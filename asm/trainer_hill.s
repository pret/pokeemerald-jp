.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CallTrainerHillFunction
CallTrainerHillFunction: @ 0x081D4B14
	push {lr}
	bl SetUpDataStruct
	ldr r1, _081D4B34
	ldr r0, _081D4B38
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	bl FreeTrainerHillBattleStruct
	pop {r0}
	bx r0
	.align 2, 0
_081D4B34: .4byte 0x085FB91C
_081D4B38: .4byte 0x02037280
	thumb_func_end CallTrainerHillFunction

	thumb_func_start ResetTrainerHillResults
ResetTrainerHillResults: @ 0x081D4B3C
	push {r4, lr}
	ldr r4, _081D4B70
	ldr r1, [r4]
	ldr r3, _081D4B74
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _081D4B78
	ldr r0, [r0]
	ldr r1, _081D4B7C
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D4B70: .4byte 0x03005AF0
_081D4B74: .4byte 0x00000EF9
_081D4B78: .4byte 0x03005AEC
_081D4B7C: .4byte 0x00003D68
	thumb_func_end ResetTrainerHillResults

	thumb_func_start GetFloorId
GetFloorId: @ 0x081D4B80
	ldr r0, _081D4B8C
	ldrb r0, [r0, #0x12]
	adds r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_081D4B8C: .4byte 0x02036FB8
	thumb_func_end GetFloorId

	thumb_func_start GetTrainerHillOpponentClass
GetTrainerHillOpponentClass: @ 0x081D4B90
	lsls r0, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	ldr r2, _081D4BAC
	ldr r1, _081D4BB0
	ldr r1, [r1]
	adds r1, #0x10
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081D4BAC: .4byte 0x082EFF52
_081D4BB0: .4byte 0x0203CC24
	thumb_func_end GetTrainerHillOpponentClass

	thumb_func_start GetTrainerHillTrainerName
GetTrainerHillTrainerName: @ 0x081D4BB4
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r1, r1, r0
	movs r3, #0
	ldr r0, _081D4BE0
	ldr r0, [r0]
	lsrs r1, r1, #0x15
	adds r2, r1, r0
_081D4BCA:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r3, #1
	cmp r3, #7
	ble _081D4BCA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D4BE0: .4byte 0x0203CC24
	thumb_func_end GetTrainerHillTrainerName

	thumb_func_start GetTrainerHillTrainerFrontSpriteId
GetTrainerHillTrainerFrontSpriteId: @ 0x081D4BE4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl SetUpDataStruct
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081D4C28
	ldr r3, [r0]
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	ldrb r2, [r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r3, r3, r1
	ldrb r4, [r3, #0x18]
	bl FreeTrainerHillBattleStruct
	ldr r0, _081D4C2C
	adds r4, r4, r0
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081D4C28: .4byte 0x0203CC20
_081D4C2C: .4byte 0x082EFF00
	thumb_func_end GetTrainerHillTrainerFrontSpriteId

	thumb_func_start InitTrainerHillBattleStruct
InitTrainerHillBattleStruct: @ 0x081D4C30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl SetUpDataStruct
	ldr r4, _081D4CE0
	movs r0, #0x14
	bl AllocZeroed
	str r0, [r4]
	movs r6, #0
	ldr r0, _081D4CE4
	mov sl, r0
_081D4C4E:
	movs r5, #0
	lsls r1, r6, #2
	mov r8, r1
	adds r0, r6, #1
	mov sb, r0
	adds r0, r1, r6
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	mov ip, r0
	lsls r7, r6, #3
_081D4C64:
	ldr r1, _081D4CE0
	ldr r4, [r1]
	adds r0, r5, r7
	adds r4, r4, r0
	mov r0, sl
	ldr r2, [r0]
	mov r1, ip
	adds r3, r5, r1
	ldrb r1, [r2]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r2, #0x10
	adds r2, r2, r3
	ldrb r0, [r2]
	strb r0, [r4]
	adds r5, #1
	cmp r5, #7
	ble _081D4C64
	ldr r0, _081D4CE0
	ldr r4, [r0]
	adds r4, #0x10
	adds r4, r4, r6
	mov r1, sl
	ldr r3, [r1]
	mov r0, r8
	adds r1, r0, r6
	lsls r1, r1, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	ldrb r2, [r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r3, r3, r1
	ldrb r0, [r3, #0x18]
	strb r0, [r4]
	mov r6, sb
	cmp r6, #1
	ble _081D4C4E
	ldr r1, _081D4CE8
	ldr r0, [r1]
	ldr r1, _081D4CEC
	adds r0, r0, r1
	bl SetTrainerHillVBlankCounter
	bl FreeTrainerHillBattleStruct
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D4CE0: .4byte 0x0203CC24
_081D4CE4: .4byte 0x0203CC20
_081D4CE8: .4byte 0x03005AEC
_081D4CEC: .4byte 0x00003D64
	thumb_func_end InitTrainerHillBattleStruct

	thumb_func_start FreeDataStruct
FreeDataStruct: @ 0x081D4CF0
	push {r4, lr}
	ldr r4, _081D4D08
	ldr r0, [r4]
	cmp r0, #0
	beq _081D4D02
	bl Free
	movs r0, #0
	str r0, [r4]
_081D4D02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D4D08: .4byte 0x0203CC24
	thumb_func_end FreeDataStruct

	thumb_func_start SetUpDataStruct
SetUpDataStruct: @ 0x081D4D0C
	push {r4, lr}
	ldr r4, _081D4D38
	ldr r0, [r4]
	cmp r0, #0
	bne _081D4D54
	ldr r0, _081D4D3C
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _081D4D40
	ldrb r1, [r1, #0x12]
	adds r1, #0x61
	strb r1, [r0]
	bl ReadTrainerHillAndValidate
	cmp r0, #1
	bne _081D4D44
	ldr r0, [r4]
	adds r0, #4
	bl TryReadTrainerHill
	b _081D4D54
	.align 2, 0
_081D4D38: .4byte 0x0203CC20
_081D4D3C: .4byte 0x00000ECC
_081D4D40: .4byte 0x02036FB8
_081D4D44:
	ldr r0, _081D4D5C
	ldr r1, [r4]
	adds r1, #4
	ldr r2, _081D4D60
	bl CpuSet
	bl sub_081D5360
_081D4D54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D4D5C: .4byte 0x085FAF38
_081D4D60: .4byte 0x040003B2
	thumb_func_end SetUpDataStruct

	thumb_func_start FreeTrainerHillBattleStruct
FreeTrainerHillBattleStruct: @ 0x081D4D64
	push {r4, lr}
	ldr r4, _081D4D7C
	ldr r0, [r4]
	cmp r0, #0
	beq _081D4D76
	bl Free
	movs r0, #0
	str r0, [r4]
_081D4D76:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D4D7C: .4byte 0x0203CC20
	thumb_func_end FreeTrainerHillBattleStruct

	thumb_func_start CopyTrainerHillTrainerText
CopyTrainerHillTrainerText: @ 0x081D4D80
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl SetUpDataStruct
	bl GetFloorId
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r5, #3
	beq _081D4DE4
	cmp r5, #3
	bgt _081D4DAE
	cmp r5, #2
	beq _081D4DB8
	b _081D4E60
_081D4DAE:
	cmp r6, #4
	beq _081D4E10
	cmp r6, #5
	beq _081D4E3C
	b _081D4E60
_081D4DB8:
	ldr r1, _081D4DE0
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0xc
	ldr r1, [r1]
	adds r1, r1, r0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x10
	bl FrontierSpeechToString
	b _081D4E60
	.align 2, 0
_081D4DE0: .4byte 0x0203CC20
_081D4DE4:
	ldr r1, _081D4E0C
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0xc
	ldr r1, [r1]
	adds r1, r1, r0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x1c
	bl FrontierSpeechToString
	b _081D4E60
	.align 2, 0
_081D4E0C: .4byte 0x0203CC20
_081D4E10:
	ldr r1, _081D4E38
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0xc
	ldr r1, [r1]
	adds r1, r1, r0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x28
	bl FrontierSpeechToString
	b _081D4E60
	.align 2, 0
_081D4E38: .4byte 0x0203CC20
_081D4E3C:
	ldr r1, _081D4E6C
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0xc
	ldr r1, [r1]
	adds r1, r1, r0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x34
	bl FrontierSpeechToString
_081D4E60:
	bl FreeTrainerHillBattleStruct
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D4E6C: .4byte 0x0203CC20
	thumb_func_end CopyTrainerHillTrainerText

	thumb_func_start TrainerHillStartChallenge
TrainerHillStartChallenge: @ 0x081D4E70
	push {r4, r5, r6, lr}
	bl sub_081D5360
	bl ReadTrainerHillAndValidate
	cmp r0, #0
	bne _081D4E98
	ldr r3, _081D4E90
	ldr r1, [r3]
	ldr r0, _081D4E94
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	b _081D4EA8
	.align 2, 0
_081D4E90: .4byte 0x03005AEC
_081D4E94: .4byte 0x00003D6E
_081D4E98:
	ldr r3, _081D4F14
	ldr r1, [r3]
	ldr r0, _081D4F18
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
_081D4EA8:
	strb r0, [r1]
	adds r6, r3, #0
	ldr r0, [r6]
	ldr r1, _081D4F1C
	adds r0, r0, r1
	movs r5, #0
	strb r5, [r0]
	ldr r0, [r6]
	ldr r4, _081D4F20
	adds r0, r0, r4
	bl SetTrainerHillVBlankCounter
	ldr r1, [r6]
	adds r4, r1, r4
	str r5, [r4]
	ldr r3, _081D4F18
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _081D4F24
	ldr r0, [r0]
	movs r1, #0xee
	lsls r1, r1, #4
	adds r0, r0, r1
	strb r5, [r0]
	ldr r0, _081D4F28
	strb r5, [r0]
	ldr r1, [r6]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D4F14: .4byte 0x03005AEC
_081D4F18: .4byte 0x00003D6E
_081D4F1C: .4byte 0x00003D6C
_081D4F20: .4byte 0x00003D64
_081D4F24: .4byte 0x03005AF0
_081D4F28: .4byte 0x02023FDE
	thumb_func_end TrainerHillStartChallenge

	thumb_func_start sub_081D4F2C
sub_081D4F2C: @ 0x081D4F2C
	push {lr}
	bl ClearTrainerHillVBlankCounter
	ldr r3, _081D4F6C
	movs r0, #0
	strh r0, [r3]
	ldr r0, _081D4F70
	ldr r0, [r0]
	ldr r1, _081D4F74
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081D4F4E
	movs r0, #1
	strh r0, [r3]
_081D4F4E:
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne _081D4F5E
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_081D4F5E:
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_081D4F6C: .4byte 0x02037290
_081D4F70: .4byte 0x03005AEC
_081D4F74: .4byte 0x00003D6E
	thumb_func_end sub_081D4F2C

	thumb_func_start sub_081D4F78
sub_081D4F78: @ 0x081D4F78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl sub_081D5F98
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _081D4FB0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #4
	bne _081D4FA6
	ldr r0, _081D4FB4
	mov r8, r0
	ldr r0, [r0]
	ldr r7, _081D4FB8
	adds r0, r0, r7
	ldrb r0, [r0]
	movs r6, #1
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #0
	beq _081D4FC0
_081D4FA6:
	ldr r1, _081D4FBC
	movs r0, #2
	strh r0, [r1]
	b _081D5014
	.align 2, 0
_081D4FB0: .4byte 0x0203CC20
_081D4FB4: .4byte 0x03005AEC
_081D4FB8: .4byte 0x00003D6E
_081D4FBC: .4byte 0x02037290
_081D4FC0:
	adds r0, r5, #0
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081D5010
	ldr r1, _081D5000
	adds r0, r5, #0
	bl CopyItemName
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r7
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _081D5004
	ldr r1, [r0]
	ldr r0, _081D5008
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _081D500C
	strh r4, [r0]
	b _081D5014
	.align 2, 0
_081D5000: .4byte 0x02021C54
_081D5004: .4byte 0x03005AF0
_081D5008: .4byte 0x00000EF9
_081D500C: .4byte 0x02037290
_081D5010:
	ldr r0, _081D5020
	strh r6, [r0]
_081D5014:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D5020: .4byte 0x02037290
	thumb_func_end sub_081D4F78

	thumb_func_start sub_081D5024
sub_081D5024: @ 0x081D5024
	push {r4, r5, lr}
	ldr r5, _081D5044
	ldr r2, [r5]
	ldr r1, _081D5048
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _081D5050
	ldr r0, _081D504C
	strh r3, [r0]
	b _081D5086
	.align 2, 0
_081D5044: .4byte 0x03005AEC
_081D5048: .4byte 0x00003D6E
_081D504C: .4byte 0x02037290
_081D5050:
	ldr r3, _081D5074
	adds r0, r2, r3
	bl GetTimerValue
	ldr r2, [r5]
	ldr r3, _081D5078
	adds r1, r2, r3
	ldr r1, [r1]
	cmp r0, r1
	bls _081D5080
	adds r3, #4
	adds r0, r2, r3
	bl SetTimerValue
	ldr r0, _081D507C
	strh r4, [r0]
	b _081D5086
	.align 2, 0
_081D5074: .4byte 0x00003D68
_081D5078: .4byte 0x00003D64
_081D507C: .4byte 0x02037290
_081D5080:
	ldr r1, _081D509C
	movs r0, #1
	strh r0, [r1]
_081D5086:
	ldr r0, _081D50A0
	ldr r1, [r0]
	ldr r0, _081D50A4
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D509C: .4byte 0x02037290
_081D50A0: .4byte 0x03005AEC
_081D50A4: .4byte 0x00003D6E
	thumb_func_end sub_081D5024

	thumb_func_start TrainerHillResumeTimer
TrainerHillResumeTimer: @ 0x081D50A8
	push {lr}
	ldr r0, _081D50D0
	ldr r2, [r0]
	ldr r1, _081D50D4
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _081D50E6
	ldr r0, _081D50D8
	adds r2, r2, r0
	ldr r1, [r2]
	ldr r0, _081D50DC
	cmp r1, r0
	bls _081D50E0
	adds r0, #1
	str r0, [r2]
	b _081D50E6
	.align 2, 0
_081D50D0: .4byte 0x03005AEC
_081D50D4: .4byte 0x00003D6E
_081D50D8: .4byte 0x00003D64
_081D50DC: .4byte 0x00034BBE
_081D50E0:
	adds r0, r2, #0
	bl SetTrainerHillVBlankCounter
_081D50E6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TrainerHillResumeTimer

	thumb_func_start TrainerHillSetPlayerLost
TrainerHillSetPlayerLost: @ 0x081D50EC
	ldr r0, _081D5100
	ldr r1, [r0]
	ldr r0, _081D5104
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #8
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_081D5100: .4byte 0x03005AEC
_081D5104: .4byte 0x00003D6E
	thumb_func_end TrainerHillSetPlayerLost

	thumb_func_start TrainerHillGetChallengeStatus
TrainerHillGetChallengeStatus: @ 0x081D5108
	push {lr}
	ldr r0, _081D512C
	ldr r0, [r0]
	ldr r1, _081D5130
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081D5138
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r1, _081D5134
	movs r0, #0
	b _081D5158
	.align 2, 0
_081D512C: .4byte 0x03005AEC
_081D5130: .4byte 0x00003D6E
_081D5134: .4byte 0x02037290
_081D5138:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081D5154
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r1, _081D5150
	movs r0, #1
	b _081D5158
	.align 2, 0
_081D5150: .4byte 0x02037290
_081D5154:
	ldr r1, _081D5160
	movs r0, #2
_081D5158:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081D5160: .4byte 0x02037290
	thumb_func_end TrainerHillGetChallengeStatus

	thumb_func_start sub_081D5164
sub_081D5164: @ 0x081D5164
	push {r4, r5, r6, r7, lr}
	ldr r0, _081D51D8
	ldr r0, [r0]
	ldr r1, _081D51DC
	adds r0, r0, r1
	ldr r7, [r0]
	ldr r0, _081D51E0
	cmp r7, r0
	ble _081D5178
	ldr r7, _081D51E4
_081D5178:
	movs r4, #0xe1
	lsls r4, r4, #4
	adds r0, r7, #0
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl __modsi3
	adds r7, r0, #0
	movs r1, #0x3c
	bl __divsi3
	adds r5, r0, #0
	adds r0, r7, #0
	movs r1, #0x3c
	bl __modsi3
	adds r7, r0, #0
	movs r0, #0xa8
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	ldr r0, _081D51E8
	adds r1, r6, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _081D51EC
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _081D51F0
	adds r1, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D51D8: .4byte 0x03005AEC
_081D51DC: .4byte 0x00003D64
_081D51E0: .4byte 0x00034BBE
_081D51E4: .4byte 0x00034BBF
_081D51E8: .4byte 0x02021C40
_081D51EC: .4byte 0x02021C54
_081D51F0: .4byte 0x02021C68
	thumb_func_end sub_081D5164

	thumb_func_start sub_081D51F4
sub_081D51F4: @ 0x081D51F4
	push {lr}
	bl SetUpDataStruct
	ldr r0, _081D5218
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	cmp r0, #4
	beq _081D5224
	ldr r0, _081D521C
	ldrb r1, [r1, #6]
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r1, _081D5220
	movs r0, #0
	b _081D5228
	.align 2, 0
_081D5218: .4byte 0x0203CC20
_081D521C: .4byte 0x02021C40
_081D5220: .4byte 0x02037290
_081D5224:
	ldr r1, _081D5234
	movs r0, #1
_081D5228:
	strh r0, [r1]
	bl FreeTrainerHillBattleStruct
	pop {r0}
	bx r0
	.align 2, 0
_081D5234: .4byte 0x02037290
	thumb_func_end sub_081D51F4

	thumb_func_start sub_081D5238
sub_081D5238: @ 0x081D5238
	push {r4, lr}
	bl SetUpDataStruct
	ldr r0, _081D5260
	ldrh r1, [r0, #0x12]
	movs r0, #0xcf
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D526C
	ldr r0, _081D5264
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _081D526C
	ldr r0, _081D5268
	strh r1, [r0]
	b _081D52E2
	.align 2, 0
_081D5260: .4byte 0x02036FB8
_081D5264: .4byte 0x000040D6
_081D5268: .4byte 0x02037290
_081D526C:
	ldr r4, _081D52C4
	ldr r3, [r4]
	ldr r0, _081D52C8
	adds r2, r3, r0
	ldr r0, _081D52CC
	ldr r1, [r0]
	ldrb r0, [r2]
	ldrb r1, [r1, #5]
	cmp r0, r1
	bne _081D5296
	ldr r1, _081D52D0
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081D52DC
	bl ReadTrainerHillAndValidate
	cmp r0, #0
	bne _081D52DC
_081D5296:
	ldr r1, [r4]
	ldr r0, _081D52D0
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _081D52D4
	movs r0, #1
	strh r0, [r1]
	ldr r0, _081D52D8
	ldrh r1, [r0, #0x12]
	movs r0, #0xcf
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D52E2
	ldr r0, [r4]
	movs r1, #9
	strh r1, [r0]
	movs r1, #6
	strh r1, [r0, #2]
	b _081D52E2
	.align 2, 0
_081D52C4: .4byte 0x03005AEC
_081D52C8: .4byte 0x00003D6D
_081D52CC: .4byte 0x0203CC20
_081D52D0: .4byte 0x00003D6E
_081D52D4: .4byte 0x02037290
_081D52D8: .4byte 0x02036FB8
_081D52DC:
	ldr r1, _081D52EC
	movs r0, #0
	strh r0, [r1]
_081D52E2:
	bl FreeTrainerHillBattleStruct
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D52EC: .4byte 0x02037290
	thumb_func_end sub_081D5238

	thumb_func_start sub_081D52F0
sub_081D52F0: @ 0x081D52F0
	push {lr}
	ldr r0, _081D5320
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081D531A
	ldr r0, _081D5324
	ldr r0, [r0]
	ldr r1, _081D5328
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _081D531A
	bl GetCurrentTrainerHillMapId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D532C
_081D531A:
	movs r0, #0
	b _081D532E
	.align 2, 0
_081D5320: .4byte 0x000040D6
_081D5324: .4byte 0x03005AEC
_081D5328: .4byte 0x00003D6E
_081D532C:
	movs r0, #1
_081D532E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D52F0

	thumb_func_start sub_081D5334
sub_081D5334: @ 0x081D5334
	push {lr}
	bl sub_081D52F0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _081D534C
	ldr r0, _081D5348
	strh r1, [r0]
	b _081D5352
	.align 2, 0
_081D5348: .4byte 0x02037290
_081D534C:
	ldr r1, _081D5358
	movs r0, #1
	strh r0, [r1]
_081D5352:
	pop {r0}
	bx r0
	.align 2, 0
_081D5358: .4byte 0x02037290
	thumb_func_end sub_081D5334

	thumb_func_start nullsub_129
nullsub_129: @ 0x081D535C
	bx lr
	.align 2, 0
	thumb_func_end nullsub_129

	thumb_func_start sub_081D5360
sub_081D5360: @ 0x081D5360
	push {r4, lr}
	ldr r4, _081D53AC
	ldr r0, [r4]
	ldr r1, _081D53B0
	adds r2, r0, r1
	ldr r0, _081D53B4
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r0, [r2]
	cmp r0, r1
	beq _081D53A6
	strb r1, [r2]
	ldr r0, [r4]
	ldr r1, _081D53B8
	adds r0, r0, r1
	ldr r1, _081D53BC
	bl SetTimerValue
	ldr r1, [r4]
	ldr r0, _081D53C0
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _081D53C4
	ldr r1, [r0]
	ldr r0, _081D53C8
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_081D53A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D53AC: .4byte 0x03005AEC
_081D53B0: .4byte 0x00003D6D
_081D53B4: .4byte 0x0203CC20
_081D53B8: .4byte 0x00003D68
_081D53BC: .4byte 0x00034BBF
_081D53C0: .4byte 0x00003D6E
_081D53C4: .4byte 0x03005AF0
_081D53C8: .4byte 0x00000EF9
	thumb_func_end sub_081D5360

	thumb_func_start PrintOnTrainerHillRecordsWindow
PrintOnTrainerHillRecordsWindow: @ 0x081D53CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r1, _081D5560
	add r0, sp, #0xc
	movs r2, #0xa
	bl memcpy
	bl SetUpDataStruct
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x90
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillWindowPixelRect
	bl sub_081D5360
	ldr r7, _081D5564
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _081D5568
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x44
	movs r3, #0
	bl AddTextPrinterParameterized3
	str r7, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, _081D556C
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0x78
	bl AddTextPrinterParameterized3
	ldr r0, _081D5570
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	str r0, [sp, #0x18]
	ldr r0, _081D5574
	ldr r0, [r0]
	ldr r2, _081D5578
	adds r0, r0, r2
	bl GetTimerValue
	adds r4, r0, #0
	movs r5, #0xe1
	lsls r5, r5, #4
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl __modsi3
	adds r4, r0, #0
	movs r1, #0x3c
	bl __divsi3
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0x3c
	bl __modsi3
	movs r1, #0xa8
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	ldr r0, _081D557C
	adds r1, r6, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _081D5580
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _081D5584
	adds r1, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _081D5588
	ldr r1, _081D558C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r2, #0x30
	movs r3, #0x84
	bl AddTextPrinterParameterized3
	ldr r0, _081D5590
	ldr r0, [r0]
	ldr r1, _081D5594
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081D54C8
	b _081D5648
_081D54C8:
	movs r4, #0
	ldr r2, [sp, #0x18]
	cmp r4, r2
	blt _081D54D2
	b _081D56C2
_081D54D2:
	movs r0, #0x1a
	adds r3, r4, #0
	muls r3, r0, r3
	adds r3, #0xe
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r6, _081D5564
	str r6, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _081D5598
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0xc
	bl AddTextPrinterParameterized3
	ldr r0, _081D5574
	ldr r0, [r0]
	ldr r1, _081D5578
	adds r0, r0, r1
	bl GetTimerValue
	ldr r1, _081D559C
	cmp r0, r1
	bne _081D55A0
	movs r5, #0
	lsls r2, r4, #1
	mov r8, r2
	add r0, sp, #0x10
	mov sb, r0
	adds r4, #1
	mov sl, r4
	adds r7, r6, #0
	movs r6, #0
_081D551E:
	mov r1, r8
	adds r0, r1, r5
	movs r1, #0xd
	adds r4, r0, #0
	muls r4, r1, r4
	adds r4, #0xe
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r7, [sp]
	str r6, [sp, #4]
	add r2, sp, #0xc
	str r2, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x24
	adds r3, r4, #0
	bl AddTextPrinterParameterized3
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x90
	adds r3, r4, #0
	bl AddTextPrinterParameterized3
	adds r5, #1
	cmp r5, #1
	ble _081D551E
	b _081D562C
	.align 2, 0
_081D5560: .4byte 0x085FB960
_081D5564: .4byte 0x085FB8E0
_081D5568: .4byte 0x085FB8E3
_081D556C: .4byte 0x085FB8EA
_081D5570: .4byte 0x0203CC20
_081D5574: .4byte 0x03005AEC
_081D5578: .4byte 0x00003D68
_081D557C: .4byte 0x02021C40
_081D5580: .4byte 0x02021C54
_081D5584: .4byte 0x02021C68
_081D5588: .4byte 0x02021C7C
_081D558C: .4byte 0x085FB8F1
_081D5590: .4byte 0x03005AF0
_081D5594: .4byte 0x00000EF9
_081D5598: .4byte 0x085FB90C
_081D559C: .4byte 0x00034BBF
_081D55A0:
	movs r5, #0
	lsls r1, r4, #1
	mov r8, r1
	lsls r0, r4, #4
	adds r2, r4, #1
	mov sl, r2
	movs r7, #4
	movs r6, #0
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r0, r0, r4
	lsls r0, r0, #4
	mov sb, r0
	adds r0, #0xc
	str r0, [sp, #0x1c]
_081D55BE:
	ldr r1, _081D5638
	ldr r0, [r1]
	mov r2, sb
	adds r1, r6, r2
	adds r0, r0, r1
	ldrb r0, [r0, #0x18]
	ldr r1, _081D563C
	adds r0, r0, r1
	ldrb r2, [r0]
	mov r0, r8
	adds r1, r0, r5
	movs r0, #0xd
	adds r4, r1, #0
	muls r4, r0, r4
	adds r4, #0xe
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _081D5640
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xb
	muls r0, r2, r0
	ldr r1, _081D5644
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x24
	adds r3, r4, #0
	bl AddTextPrinterParameterized3
	ldr r1, _081D5640
	str r1, [sp]
	movs r2, #0
	str r2, [sp, #4]
	ldr r1, _081D5638
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	adds r0, r0, r2
	adds r0, r0, r7
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x90
	adds r3, r4, #0
	bl AddTextPrinterParameterized3
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r6, r6, r0
	adds r5, #1
	cmp r5, #1
	ble _081D55BE
_081D562C:
	mov r4, sl
	ldr r1, [sp, #0x18]
	cmp r4, r1
	bge _081D5636
	b _081D54D2
_081D5636:
	b _081D56C2
	.align 2, 0
_081D5638: .4byte 0x0203CC20
_081D563C: .4byte 0x082EFF52
_081D5640: .4byte 0x085FB8E0
_081D5644: .4byte 0x082E3564
_081D5648:
	movs r4, #0
	add r2, sp, #0x10
	mov sb, r2
	movs r6, #0
_081D5650:
	movs r0, #0x1a
	adds r3, r4, #0
	muls r3, r0, r3
	adds r3, #0xe
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r7, [sp]
	str r6, [sp, #4]
	ldr r1, _081D56E4
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0xc
	bl AddTextPrinterParameterized3
	movs r5, #0
	lsls r0, r4, #1
	mov r8, r0
	adds r4, #1
	mov sl, r4
_081D567E:
	mov r1, r8
	adds r0, r1, r5
	movs r1, #0xd
	adds r4, r0, #0
	muls r4, r1, r4
	adds r4, #0xe
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r7, [sp]
	str r6, [sp, #4]
	add r2, sp, #0xc
	str r2, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x24
	adds r3, r4, #0
	bl AddTextPrinterParameterized3
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x90
	adds r3, r4, #0
	bl AddTextPrinterParameterized3
	adds r5, #1
	cmp r5, #1
	ble _081D567E
	mov r4, sl
	cmp r4, #1
	ble _081D5650
_081D56C2:
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	bl FreeTrainerHillBattleStruct
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D56E4: .4byte 0x085FB90C
	thumb_func_end PrintOnTrainerHillRecordsWindow

	thumb_func_start GetTimerValue
GetTimerValue: @ 0x081D56E8
	ldr r0, [r0]
	bx lr
	thumb_func_end GetTimerValue

	thumb_func_start SetTimerValue
SetTimerValue: @ 0x081D56EC
	str r1, [r0]
	bx lr
	thumb_func_end SetTimerValue

	thumb_func_start sub_081D56F0
sub_081D56F0: @ 0x081D56F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _081D5818
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r1, r0, r1
	str r1, [sp, #4]
	bl sub_081D5840
	cmp r0, #0
	beq _081D5806
	bl SetUpDataStruct
	movs r7, #0
	ldr r4, _081D581C
	ldr r3, _081D5820
	ldr r0, _081D5824
	adds r2, r0, #0
_081D571E:
	ldr r1, [r4]
	lsls r0, r7, #1
	adds r1, r1, r3
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #1
	bls _081D571E
	movs r0, #0
	str r0, [sp]
	ldr r0, _081D5818
	ldr r1, [r0]
	movs r2, #0xc7
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r2, _081D5828
	mov r0, sp
	bl CpuSet
	bl GetFloorId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r7, #0
	ldr r3, _081D582C
	mov sl, r3
_081D575C:
	lsls r4, r7, #1
	mov r8, r4
	adds r5, r4, r7
	lsls r5, r5, #3
	ldr r0, [sp, #4]
	adds r5, r5, r0
	adds r1, r5, #0
	ldr r0, _081D5830
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	adds r6, r7, #1
	strb r6, [r5]
	mov r0, sl
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	mov r2, sb
	lsls r4, r2, #4
	subs r4, r4, r2
	lsls r4, r4, #2
	subs r4, r4, r2
	lsls r4, r4, #4
	adds r0, r0, r4
	adds r1, r1, r0
	ldrb r0, [r1, #0x18]
	bl FacilityClassToGraphicsId
	strb r0, [r5, #1]
	mov r0, sl
	ldr r3, [r0]
	adds r0, r7, r4
	movs r2, #0xee
	lsls r2, r2, #2
	adds r1, r3, r2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strh r0, [r5, #4]
	ldrb r0, [r1]
	lsrs r0, r0, #4
	movs r1, #0xf
	ands r0, r1
	adds r0, #5
	strh r0, [r5, #6]
	lsls r1, r7, #0x1a
	lsrs r1, r1, #0x18
	adds r3, r3, r4
	ldr r2, _081D5834
	adds r3, r3, r2
	ldrb r0, [r3]
	asrs r0, r1
	movs r3, #0xf
	ands r0, r3
	adds r0, #7
	strb r0, [r5, #9]
	mov r2, sl
	ldr r0, [r2]
	adds r0, r0, r4
	ldr r3, _081D5838
	adds r0, r0, r3
	ldrb r0, [r0]
	asrs r0, r1
	movs r1, #0xf
	ands r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _081D583C
	str r0, [r5, #0x10]
	ldr r0, _081D581C
	ldr r0, [r0]
	ldr r4, _081D5820
	adds r0, r0, r4
	add r0, r8
	strh r6, [r0]
	lsls r6, r6, #0x18
	lsrs r7, r6, #0x18
	cmp r7, #1
	bls _081D575C
	bl FreeTrainerHillBattleStruct
_081D5806:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D5818: .4byte 0x03005AEC
_081D581C: .4byte 0x03005AF0
_081D5820: .4byte 0x00000CB4
_081D5824: .4byte 0x0000FFFF
_081D5828: .4byte 0x05000180
_081D582C: .4byte 0x0203CC20
_081D5830: .4byte 0x085FB96C
_081D5834: .4byte 0x000003BA
_081D5838: .4byte 0x000003BB
_081D583C: .4byte 0x08276D0C
	thumb_func_end sub_081D56F0

	thumb_func_start sub_081D5840
sub_081D5840: @ 0x081D5840
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #1
	bl SetUpDataStruct
	ldr r4, _081D589C
	ldr r3, [r4]
	ldr r0, _081D58A0
	adds r2, r3, r0
	ldr r0, _081D58A4
	ldr r1, [r0]
	ldrb r0, [r2]
	ldrb r1, [r1, #5]
	cmp r0, r1
	bne _081D5874
	ldr r1, _081D58A8
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081D588E
	bl ReadTrainerHillAndValidate
	cmp r0, #0
	bne _081D588E
_081D5874:
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4]
	movs r0, #0xc7
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r2, _081D58AC
	mov r0, sp
	bl CpuSet
	bl ClearAllEventObjects
	movs r5, #0
_081D588E:
	bl FreeTrainerHillBattleStruct
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081D589C: .4byte 0x03005AEC
_081D58A0: .4byte 0x00003D6D
_081D58A4: .4byte 0x0203CC20
_081D58A8: .4byte 0x00003D6E
_081D58AC: .4byte 0x05000180
	thumb_func_end sub_081D5840

	thumb_func_start sub_081D58B0
sub_081D58B0: @ 0x081D58B0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _081D5908
	ldr r4, [r4]
	mov ip, r4
	lsls r4, r2, #1
	lsls r5, r0, #4
	subs r5, r5, r0
	lsls r5, r5, #2
	subs r5, r5, r0
	lsls r5, r5, #4
	adds r4, r4, r5
	movs r0, #0xe6
	lsls r0, r0, #2
	add r0, ip
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r4, #0xf
	subs r4, r4, r1
	asrs r0, r4
	movs r4, #1
	ands r0, r4
	muls r2, r3, r2
	adds r2, r2, r1
	adds r2, r2, r5
	movs r1, #0xa6
	lsls r1, r1, #2
	add r1, ip
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r3, r2, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	lsls r0, r0, #0xa
	orrs r0, r2
	orrs r1, r3
	orrs r0, r1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081D5908: .4byte 0x0203CC20
	thumb_func_end sub_081D58B0

	thumb_func_start sub_081D590C
sub_081D590C: @ 0x081D590C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	bl GetCurrentTrainerHillMapId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #6
	bne _081D592A
	bl InitMapFromSavedGame
	b _081D59FC
_081D592A:
	bl SetUpDataStruct
	ldr r0, _081D5964
	ldr r3, [r0]
	ldr r0, _081D5968
	adds r2, r3, r0
	ldr r0, _081D596C
	ldr r1, [r0]
	ldrb r0, [r2]
	ldrb r1, [r1, #5]
	cmp r0, r1
	bne _081D5958
	ldr r1, _081D5970
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081D5974
	bl ReadTrainerHillAndValidate
	cmp r0, #0
	bne _081D5974
_081D5958:
	bl RunOnLoadMapScript
	bl FreeTrainerHillBattleStruct
	b _081D59FC
	.align 2, 0
_081D5964: .4byte 0x03005AEC
_081D5968: .4byte 0x00003D6D
_081D596C: .4byte 0x0203CC20
_081D5970: .4byte 0x00003D6E
_081D5974:
	mov r0, sb
	cmp r0, #5
	bne _081D5984
	bl InitMapFromSavedGame
	bl FreeTrainerHillBattleStruct
	b _081D59FC
_081D5984:
	bl GetFloorId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _081D5A08
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ldr r1, _081D5A0C
	str r4, [r1, #8]
	movs r0, #0x1f
	str r0, [r1]
	movs r0, #0x23
	str r0, [r1, #4]
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r3, r4, r1
	movs r6, #4
_081D59A8:
	adds r4, r2, #0
	adds r4, #0x20
	adds r1, r3, #0
	movs r5, #0xf
_081D59B0:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bge _081D59B0
	adds r3, #0x3e
	adds r2, r4, #0
	subs r6, #1
	cmp r6, #0
	bge _081D59A8
	movs r6, #0
_081D59CA:
	movs r5, #0
	movs r0, #0x3e
	adds r0, r0, r3
	mov r8, r0
	adds r7, r6, #1
	adds r4, r3, #0
_081D59D6:
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0x10
	bl sub_081D58B0
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	ble _081D59D6
	mov r3, r8
	adds r6, r7, #0
	cmp r6, #0xf
	ble _081D59CA
	bl RunOnLoadMapScript
	bl FreeTrainerHillBattleStruct
_081D59FC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D5A08: .4byte 0x02036FB8
_081D5A0C: .4byte 0x03005B20
	thumb_func_end sub_081D590C

	thumb_func_start InTrainerHill
InTrainerHill: @ 0x081D5A10
	push {lr}
	ldr r1, _081D5A30
	ldr r2, _081D5A34
	adds r0, r2, #0
	ldrh r1, [r1, #0x12]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	cmp r0, #3
	bhi _081D5A28
	movs r1, #1
_081D5A28:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_081D5A30: .4byte 0x02036FB8
_081D5A34: .4byte 0xFFFFFE61
	thumb_func_end InTrainerHill

	thumb_func_start GetCurrentTrainerHillMapId
GetCurrentTrainerHillMapId: @ 0x081D5A38
	push {lr}
	ldr r0, _081D5A48
	ldrh r2, [r0, #0x12]
	ldr r0, _081D5A4C
	cmp r2, r0
	bne _081D5A50
	movs r1, #1
	b _081D5A94
	.align 2, 0
_081D5A48: .4byte 0x02036FB8
_081D5A4C: .4byte 0x0000019F
_081D5A50:
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r2, r0
	bne _081D5A5C
	movs r1, #2
	b _081D5A94
_081D5A5C:
	ldr r0, _081D5A68
	cmp r2, r0
	bne _081D5A6C
	movs r1, #3
	b _081D5A94
	.align 2, 0
_081D5A68: .4byte 0x000001A1
_081D5A6C:
	movs r0, #0xd1
	lsls r0, r0, #1
	cmp r2, r0
	bne _081D5A78
	movs r1, #4
	b _081D5A94
_081D5A78:
	ldr r0, _081D5A84
	cmp r2, r0
	bne _081D5A88
	movs r1, #5
	b _081D5A94
	.align 2, 0
_081D5A84: .4byte 0x000001A3
_081D5A88:
	movs r0, #0xcf
	lsls r0, r0, #1
	movs r1, #0
	cmp r2, r0
	bne _081D5A94
	movs r1, #6
_081D5A94:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetCurrentTrainerHillMapId

	thumb_func_start sub_081D5A9C
sub_081D5A9C: @ 0x081D5A9C
	push {lr}
	ldr r0, _081D5AB4
	ldrh r1, [r0, #0x12]
	ldr r0, _081D5AB8
	movs r2, #0
	cmp r1, r0
	bne _081D5AAC
	movs r2, #1
_081D5AAC:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_081D5AB4: .4byte 0x02036FB8
_081D5AB8: .4byte 0x000001A3
	thumb_func_end sub_081D5A9C

	thumb_func_start sub_081D5ABC
sub_081D5ABC: @ 0x081D5ABC
	push {lr}
	movs r0, #0x1a
	movs r1, #0x40
	bl Overworld_GetMapHeaderByGroupAndId
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	adds r0, #8
	pop {r1}
	bx r1
	thumb_func_end sub_081D5ABC

	thumb_func_start sub_081D5AD0
sub_081D5AD0: @ 0x081D5AD0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081D5AE8
	ldr r0, _081D5AE4
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	adds r0, #8
	b _081D5B12
	.align 2, 0
_081D5AE4: .4byte 0x02036FB8
_081D5AE8:
	bl sub_081D5E30
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _081D5AFE
	movs r2, #4
_081D5AFE:
	ldr r1, _081D5B18
	subs r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1a
	bl Overworld_GetMapHeaderByGroupAndId
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
_081D5B12:
	pop {r1}
	bx r1
	.align 2, 0
_081D5B18: .4byte 0x085FB984
	thumb_func_end sub_081D5AD0

	thumb_func_start LocalIdToHillTrainerId
LocalIdToHillTrainerId: @ 0x081D5B1C
	lsls r0, r0, #0x18
	ldr r1, _081D5B30
	ldr r1, [r1]
	lsrs r0, r0, #0x17
	adds r1, r1, r0
	ldr r0, _081D5B34
	adds r1, r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_081D5B30: .4byte 0x03005AF0
_081D5B34: .4byte 0x00000CB2
	thumb_func_end LocalIdToHillTrainerId

	thumb_func_start GetHillTrainerFlag
GetHillTrainerFlag: @ 0x081D5B38
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetFloorId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r2, _081D5B78
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, #0xff
	ldrb r1, [r1, #8]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	ldr r1, _081D5B7C
	ldr r1, [r1]
	movs r2, #0xee
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r2, _081D5B80
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ldrb r1, [r1]
	ands r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081D5B78: .4byte 0x02036FF0
_081D5B7C: .4byte 0x03005AF0
_081D5B80: .4byte 0x082FACB4
	thumb_func_end GetHillTrainerFlag

	thumb_func_start SetHillTrainerFlag
SetHillTrainerFlag: @ 0x081D5B84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetFloorId
	lsls r0, r0, #0x19
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r0, _081D5BCC
	mov r8, r0
	ldr r6, _081D5BD0
	ldr r1, _081D5BD4
	mov ip, r1
	adds r5, r6, #0
_081D5BA0:
	ldr r2, [r5]
	lsls r0, r3, #1
	ldr r7, _081D5BD8
	adds r1, r2, r7
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r1, r8
	ldrh r1, [r1]
	cmp r0, r1
	bne _081D5BDC
	movs r7, #0xee
	lsls r7, r7, #4
	adds r2, r2, r7
	adds r0, r4, r3
	lsls r0, r0, #2
	add r0, ip
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	b _081D5BE6
	.align 2, 0
_081D5BCC: .4byte 0x0203886A
_081D5BD0: .4byte 0x03005AF0
_081D5BD4: .4byte 0x082FACB4
_081D5BD8: .4byte 0x00000CB4
_081D5BDC:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _081D5BA0
_081D5BE6:
	ldr r0, _081D5C24
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _081D5C3E
	movs r3, #0
	ldr r5, _081D5C28
	ldr r0, _081D5C2C
	mov r8, r0
_081D5BFC:
	ldr r2, [r6]
	lsls r0, r3, #1
	ldr r7, _081D5C30
	adds r1, r2, r7
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r1, [r5]
	cmp r0, r1
	bne _081D5C34
	movs r7, #0xee
	lsls r7, r7, #4
	adds r2, r2, r7
	adds r0, r4, r3
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	b _081D5C3E
	.align 2, 0
_081D5C24: .4byte 0x02022C90
_081D5C28: .4byte 0x0203886C
_081D5C2C: .4byte 0x082FACB4
_081D5C30: .4byte 0x00000CB4
_081D5C34:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _081D5BFC
_081D5C3E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SetHillTrainerFlag

	thumb_func_start GetTrainerHillTrainerScript
GetTrainerHillTrainerScript: @ 0x081D5C48
	ldr r0, _081D5C4C
	bx lr
	.align 2, 0
_081D5C4C: .4byte 0x08276D0C
	thumb_func_end GetTrainerHillTrainerScript

	thumb_func_start sub_081D5C50
sub_081D5C50: @ 0x081D5C50
	push {lr}
	ldr r0, _081D5C64
	ldrh r1, [r0]
	movs r0, #5
	bl CopyTrainerHillTrainerText
	bl sub_08097C40
	pop {r0}
	bx r0
	.align 2, 0
_081D5C64: .4byte 0x02037292
	thumb_func_end sub_081D5C50

	thumb_func_start sub_081D5C68
sub_081D5C68: @ 0x081D5C68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	subs r1, r0, #1
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _081D5D06
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	bl SetUpDataStruct
	bl GetHighestLevelInPlayerParty
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	bl GetFloorId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r5, sb
	adds r0, r5, #3
	cmp r5, r0
	bge _081D5D02
	ldr r1, _081D5D14
	lsls r0, r6, #1
	adds r0, r0, r6
	adds r7, r0, r1
_081D5CB2:
	ldrb r2, [r7]
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081D5D18
	adds r4, r4, r0
	mov r1, r8
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0xc
	ldr r3, _081D5D1C
	ldr r1, [r3]
	adds r1, r1, r0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, #4
	adds r1, r1, r0
	movs r0, #0x2c
	muls r0, r2, r0
	adds r0, #0x3c
	adds r1, r1, r0
	adds r0, r4, #0
	bl CreateBattleTowerMon
	adds r0, r4, #0
	mov r1, sl
	bl sub_081D5DCC
	adds r5, #1
	adds r7, #1
	mov r0, sb
	adds r0, #3
	cmp r5, r0
	blt _081D5CB2
_081D5D02:
	bl FreeTrainerHillBattleStruct
_081D5D06:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D5D14: .4byte 0x085FB994
_081D5D18: .4byte 0x020243E8
_081D5D1C: .4byte 0x0203CC20
	thumb_func_end sub_081D5C68

	thumb_func_start FillHillTrainerParty
FillHillTrainerParty: @ 0x081D5D20
	push {lr}
	bl ZeroEnemyPartyMons
	ldr r0, _081D5D34
	ldrh r0, [r0]
	movs r1, #0
	bl sub_081D5C68
	pop {r0}
	bx r0
	.align 2, 0
_081D5D34: .4byte 0x0203886A
	thumb_func_end FillHillTrainerParty

	thumb_func_start FillHillTrainersParties
FillHillTrainersParties: @ 0x081D5D38
	push {lr}
	bl ZeroEnemyPartyMons
	ldr r0, _081D5D58
	ldrh r0, [r0]
	movs r1, #0
	bl sub_081D5C68
	ldr r0, _081D5D5C
	ldrh r0, [r0]
	movs r1, #3
	bl sub_081D5C68
	pop {r0}
	bx r0
	.align 2, 0
_081D5D58: .4byte 0x0203886A
_081D5D5C: .4byte 0x0203886C
	thumb_func_end FillHillTrainersParties

	thumb_func_start sub_081D5D60
sub_081D5D60: @ 0x081D5D60
	movs r0, #7
	bx lr
	thumb_func_end sub_081D5D60

	thumb_func_start GetTrainerEncounterMusicIdInTrainerHill
GetTrainerEncounterMusicIdInTrainerHill: @ 0x081D5D64
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl SetUpDataStruct
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081D5DB0
	ldr r3, [r0]
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	ldrb r2, [r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r3, r3, r1
	ldrb r4, [r3, #0x18]
	bl FreeTrainerHillBattleStruct
	movs r2, #0
	ldr r0, _081D5DB4
	adds r4, r4, r0
	ldrb r3, [r4]
	ldr r1, _081D5DB8
_081D5DA4:
	ldrb r0, [r1]
	cmp r0, r3
	bne _081D5DBC
	ldrb r0, [r1, #1]
	b _081D5DC6
	.align 2, 0
_081D5DB0: .4byte 0x0203CC20
_081D5DB4: .4byte 0x082EFF52
_081D5DB8: .4byte 0x085FB6A0
_081D5DBC:
	adds r1, #4
	adds r2, #1
	cmp r2, #0x35
	bls _081D5DA4
	movs r0, #0
_081D5DC6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetTrainerEncounterMusicIdInTrainerHill

	thumb_func_start sub_081D5DCC
sub_081D5DCC: @ 0x081D5DCC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	mov r0, sp
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r5, _081D5E28
	mov r1, sp
	ldrb r2, [r1]
	lsls r2, r2, #2
	ldr r3, _081D5E2C
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r1, [r1, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r1, r0
	adds r2, r2, r0
	adds r2, r2, r5
	ldr r0, [r2]
	str r0, [sp, #4]
	add r2, sp, #4
	adds r0, r4, #0
	movs r1, #0x19
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x38
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	bl CalculateMonStats
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D5E28: .4byte 0x082F00B4
_081D5E2C: .4byte 0x082F0D54
	thumb_func_end sub_081D5DCC

	thumb_func_start sub_081D5E30
sub_081D5E30: @ 0x081D5E30
	push {r4, lr}
	bl SetUpDataStruct
	ldr r0, _081D5E48
	ldr r0, [r0]
	ldrb r4, [r0, #6]
	bl FreeTrainerHillBattleStruct
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081D5E48: .4byte 0x0203CC20
	thumb_func_end sub_081D5E30

	thumb_func_start sub_081D5E4C
sub_081D5E4C: @ 0x081D5E4C
	ldr r0, _081D5E5C
	ldr r0, [r0]
	movs r1, #0xee
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	bx lr
	.align 2, 0
_081D5E5C: .4byte 0x03005AF0
	thumb_func_end sub_081D5E4C

	thumb_func_start sub_081D5E60
sub_081D5E60: @ 0x081D5E60
	push {lr}
	bl sub_081D5ED4
	cmp r0, #1
	bne _081D5E74
	ldr r0, _081D5E78
	movs r1, #0x70
	movs r2, #0x20
	bl LoadPalette
_081D5E74:
	pop {r0}
	bx r0
	.align 2, 0
_081D5E78: .4byte 0x085FB8C0
	thumb_func_end sub_081D5E60

	thumb_func_start sub_081D5E7C
sub_081D5E7C: @ 0x081D5E7C
	ldr r1, _081D5E90
	ldr r0, _081D5E94
	ldr r0, [r0]
	ldr r2, _081D5E98
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r0, r0, #7
	strh r0, [r1]
	bx lr
	.align 2, 0
_081D5E90: .4byte 0x02037290
_081D5E94: .4byte 0x03005AF0
_081D5E98: .4byte 0x00000EF9
	thumb_func_end sub_081D5E7C

	thumb_func_start sub_081D5E9C
sub_081D5E9C: @ 0x081D5E9C
	ldr r0, _081D5EB0
	ldr r1, [r0]
	ldr r0, _081D5EB4
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_081D5EB0: .4byte 0x03005AF0
_081D5EB4: .4byte 0x00000EF9
	thumb_func_end sub_081D5E9C

	thumb_func_start nullsub_2
nullsub_2: @ 0x081D5EB8
	ldr r0, _081D5ECC
	ldr r1, [r0]
	ldr r0, _081D5ED0
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_081D5ECC: .4byte 0x03005AF0
_081D5ED0: .4byte 0x00000EF9
	thumb_func_end nullsub_2

	thumb_func_start sub_081D5ED4
sub_081D5ED4: @ 0x081D5ED4
	push {lr}
	bl sub_081D52F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D5F00
	bl GetCurrentTrainerHillMapId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	beq _081D5F00
	bl sub_081D5238
	ldr r0, _081D5EFC
	ldrh r0, [r0]
	cmp r0, #0
	beq _081D5F00
	movs r0, #1
	b _081D5F02
	.align 2, 0
_081D5EFC: .4byte 0x02037290
_081D5F00:
	movs r0, #0
_081D5F02:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D5ED4

	thumb_func_start sub_081D5F08
sub_081D5F08: @ 0x081D5F08
	push {lr}
	ldr r0, _081D5F24
	ldr r0, [r0]
	ldr r1, _081D5F28
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081D5F30
	ldr r1, _081D5F2C
	movs r0, #0
	b _081D5F34
	.align 2, 0
_081D5F24: .4byte 0x03005AEC
_081D5F28: .4byte 0x00003D6E
_081D5F2C: .4byte 0x02037290
_081D5F30:
	ldr r1, _081D5F3C
	movs r0, #1
_081D5F34:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081D5F3C: .4byte 0x02037290
	thumb_func_end sub_081D5F08

	thumb_func_start sub_081D5F40
sub_081D5F40: @ 0x081D5F40
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r3, #0
	movs r4, #0
	ldr r0, _081D5F94
	ldr r6, [r0]
	movs r5, #0x1f
_081D5F50:
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	subs r1, r1, r4
	lsls r1, r1, #4
	adds r1, r6, r1
	ldrb r2, [r1, #0xc]
	adds r0, r5, #0
	ands r0, r2
	eors r3, r0
	ldrb r1, [r1, #0xd]
	adds r0, r5, #0
	ands r0, r1
	eors r3, r0
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081D5F50
	movs r1, #5
	cmp r7, #0
	beq _081D5F82
	movs r1, #0xa
_081D5F82:
	adds r0, r3, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081D5F94: .4byte 0x0203CC20
	thumb_func_end sub_081D5F40

	thumb_func_start sub_081D5F98
sub_081D5F98: @ 0x081D5F98
	push {r4, lr}
	movs r3, #0
	movs r2, #0
	ldr r0, _081D5FF0
	ldr r4, [r0]
_081D5FA2:
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, r4, r0
	ldrb r1, [r0, #0xc]
	adds r1, r3, r1
	ldrb r0, [r0, #0xd]
	adds r3, r1, r0
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _081D5FA2
	adds r0, r3, #0
	cmp r0, #0
	bge _081D5FC8
	adds r0, #0xff
_081D5FC8:
	asrs r4, r0, #8
	lsrs r0, r0, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r4, r4, r0
	ldr r0, _081D5FF4
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D5FF8
	ldr r0, _081D5FF0
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #8
	bne _081D5FF8
	movs r0, #1
	b _081D5FFA
	.align 2, 0
_081D5FF0: .4byte 0x0203CC20
_081D5FF4: .4byte 0x00000864
_081D5FF8:
	movs r0, #0
_081D5FFA:
	bl sub_081D5F40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _081D6050
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _081D6054
	ldr r0, [r0]
	ldr r1, _081D6058
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xe1
	lsls r1, r1, #4
	bl __divsi3
	movs r1, #0
	cmp r0, #0xb
	ble _081D6042
	movs r1, #1
	cmp r0, #0xc
	ble _081D6042
	movs r1, #2
	cmp r0, #0xd
	ble _081D6042
	movs r1, #3
	cmp r0, #0xf
	ble _081D6042
	movs r1, #5
	cmp r0, #0x11
	bgt _081D6042
	movs r1, #4
_081D6042:
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081D6050: .4byte 0x085FB8B8
_081D6054: .4byte 0x03005AEC
_081D6058: .4byte 0x00003D64
	thumb_func_end sub_081D5F98

