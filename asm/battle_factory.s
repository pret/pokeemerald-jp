.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CallBattleFactoryFunction
CallBattleFactoryFunction: @ 0x081A5C0C
	push {lr}
	ldr r1, _081A5C24
	ldr r0, _081A5C28
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end CallBattleFactoryFunction

	thumb_func_start nullsub_75
nullsub_75: @ 0x081A5C20
	bx r0
	.align 2, 0
_081A5C24: .4byte 0x085DD958
_081A5C28: .4byte 0x02037280
	thumb_func_end nullsub_75

	thumb_func_start InitFactoryChallenge
InitFactoryChallenge: @ 0x081A5C2C
	push {r4, r5, r6, r7, lr}
	ldr r5, _081A5D0C
	ldr r0, [r5]
	ldr r4, _081A5D10
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r7, r0, #0x1e
	ldr r0, _081A5D14
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r5]
	ldr r1, _081A5D18
	adds r0, r0, r1
	movs r2, #0
	strb r2, [r0]
	ldr r1, [r5]
	ldr r3, _081A5D1C
	adds r0, r1, r3
	strh r2, [r0]
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r4, [r5]
	ldr r0, _081A5D20
	adds r3, r4, r0
	ldr r2, _081A5D24
	lsls r0, r7, #2
	lsls r1, r6, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r3, [r3]
	ldr r0, [r0]
	ands r3, r0
	cmp r3, #0
	bne _081A5CA2
	lsls r1, r7, #1
	lsls r0, r6, #2
	adds r1, r1, r0
	ldr r2, _081A5D28
	adds r0, r4, r2
	adds r0, r0, r1
	strh r3, [r0]
	adds r2, #0x10
	adds r0, r4, r2
	adds r0, r0, r1
	strh r3, [r0]
_081A5CA2:
	ldr r1, _081A5D2C
	movs r0, #0
	strb r0, [r1]
	movs r2, #0
	ldr r6, _081A5D30
	movs r4, #0xe7
	lsls r4, r4, #4
	ldr r0, _081A5D34
	adds r3, r0, #0
_081A5CB4:
	ldr r1, [r5]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _081A5CB4
	movs r2, #0
	ldr r4, _081A5D38
	ldr r1, _081A5D34
	adds r3, r1, #0
_081A5CD8:
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _081A5CD8
	ldr r0, [r6]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	ldr r1, _081A5D3C
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A5D0C: .4byte 0x03005AF0
_081A5D10: .4byte 0x00000CA9
_081A5D14: .4byte 0x000040CE
_081A5D18: .4byte 0x00000CA8
_081A5D1C: .4byte 0x00000CB2
_081A5D20: .4byte 0x00000CDC
_081A5D24: .4byte 0x085DD99C
_081A5D28: .4byte 0x00000DE2
_081A5D2C: .4byte 0x03001284
_081A5D30: .4byte 0x03005AEC
_081A5D34: .4byte 0x0000FFFF
_081A5D38: .4byte 0x03005FD8
_081A5D3C: .4byte 0x0203886A
	thumb_func_end InitFactoryChallenge

	thumb_func_start GetBattleFactoryData
GetBattleFactoryData: @ 0x081A5D40
	push {r4, r5, r6, r7, lr}
	ldr r7, _081A5D6C
	ldr r0, [r7]
	ldr r1, _081A5D70
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r6, r0, #0x1e
	ldr r0, _081A5D74
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _081A5D78
	ldrh r0, [r0]
	cmp r0, #2
	beq _081A5D98
	cmp r0, #2
	bgt _081A5D7C
	cmp r0, #1
	beq _081A5D82
	b _081A5DDC
	.align 2, 0
_081A5D6C: .4byte 0x03005AF0
_081A5D70: .4byte 0x00000CA9
_081A5D74: .4byte 0x000040CE
_081A5D78: .4byte 0x02037282
_081A5D7C:
	cmp r0, #3
	beq _081A5DC8
	b _081A5DDC
_081A5D82:
	ldr r3, _081A5D90
	ldr r0, [r7]
	lsls r1, r6, #1
	lsls r2, r5, #2
	adds r1, r1, r2
	ldr r2, _081A5D94
	b _081A5DD4
	.align 2, 0
_081A5D90: .4byte 0x02037290
_081A5D94: .4byte 0x00000DE2
_081A5D98:
	ldr r4, _081A5DBC
	ldr r2, [r7]
	ldr r0, _081A5DC0
	adds r2, r2, r0
	ldr r3, _081A5DC4
	lsls r0, r6, #2
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	strh r0, [r4]
	b _081A5DDC
	.align 2, 0
_081A5DBC: .4byte 0x02037290
_081A5DC0: .4byte 0x00000CDC
_081A5DC4: .4byte 0x085DD99C
_081A5DC8:
	ldr r3, _081A5DE4
	ldr r0, [r7]
	lsls r1, r6, #1
	lsls r2, r5, #2
	adds r1, r1, r2
	ldr r2, _081A5DE8
_081A5DD4:
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
_081A5DDC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A5DE4: .4byte 0x02037290
_081A5DE8: .4byte 0x00000DF2
	thumb_func_end GetBattleFactoryData

	thumb_func_start SetBattleFactoryData
SetBattleFactoryData: @ 0x081A5DEC
	push {r4, r5, r6, lr}
	ldr r6, _081A5E18
	ldr r0, [r6]
	ldr r1, _081A5E1C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _081A5E20
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _081A5E24
	ldrh r0, [r0]
	cmp r0, #2
	beq _081A5E4C
	cmp r0, #2
	bgt _081A5E28
	cmp r0, #1
	beq _081A5E2E
	b _081A5EC0
	.align 2, 0
_081A5E18: .4byte 0x03005AF0
_081A5E1C: .4byte 0x00000CA9
_081A5E20: .4byte 0x000040CE
_081A5E24: .4byte 0x02037282
_081A5E28:
	cmp r0, #3
	beq _081A5EA0
	b _081A5EC0
_081A5E2E:
	ldr r2, [r6]
	lsls r0, r5, #1
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r1, _081A5E44
	adds r2, r2, r1
	adds r2, r2, r0
	ldr r0, _081A5E48
	ldrh r0, [r0]
	strh r0, [r2]
	b _081A5EC0
	.align 2, 0
_081A5E44: .4byte 0x00000DE2
_081A5E48: .4byte 0x02037284
_081A5E4C:
	ldr r0, _081A5E70
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A5E7C
	ldr r2, [r6]
	ldr r0, _081A5E74
	adds r2, r2, r0
	ldr r3, _081A5E78
	lsls r1, r5, #2
	lsls r0, r4, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r2]
	ldr r1, [r1]
	orrs r0, r1
	str r0, [r2]
	b _081A5EC0
	.align 2, 0
_081A5E70: .4byte 0x02037284
_081A5E74: .4byte 0x00000CDC
_081A5E78: .4byte 0x085DD99C
_081A5E7C:
	ldr r2, [r6]
	ldr r1, _081A5E98
	adds r2, r2, r1
	ldr r3, _081A5E9C
	lsls r1, r5, #2
	lsls r0, r4, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r2]
	ldr r1, [r1]
	ands r0, r1
	str r0, [r2]
	b _081A5EC0
	.align 2, 0
_081A5E98: .4byte 0x00000CDC
_081A5E9C: .4byte 0x085DD9AC
_081A5EA0:
	ldr r3, _081A5EC8
	ldrb r0, [r3]
	cmp r0, #1
	bne _081A5EC0
	ldr r2, [r6]
	lsls r0, r5, #1
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r1, _081A5ECC
	adds r2, r2, r1
	adds r2, r2, r0
	ldr r0, _081A5ED0
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2]
	strb r1, [r3]
_081A5EC0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A5EC8: .4byte 0x03001284
_081A5ECC: .4byte 0x00000DF2
_081A5ED0: .4byte 0x02037284
	thumb_func_end SetBattleFactoryData

	thumb_func_start sub_081A5ED4
sub_081A5ED4: @ 0x081A5ED4
	push {r4, lr}
	ldr r4, _081A5F08
	ldr r0, [r4]
	ldr r1, _081A5F0C
	ldrh r1, [r1]
	ldr r2, _081A5F10
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _081A5F14
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	bl sub_081A482C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A5F08: .4byte 0x03005AF0
_081A5F0C: .4byte 0x02037282
_081A5F10: .4byte 0x00000CA8
_081A5F14: .4byte 0x00000CA9
	thumb_func_end sub_081A5ED4

	thumb_func_start SwapRentalMons
SwapRentalMons: @ 0x081A5F18
	bx lr
	.align 2, 0
	thumb_func_end SwapRentalMons

	thumb_func_start nullsub_123
nullsub_123: @ 0x081A5F1C
	bx lr
	.align 2, 0
	thumb_func_end nullsub_123

	thumb_func_start SelectInitialRentalMons
SelectInitialRentalMons: @ 0x081A5F20
	push {lr}
	bl ZeroPlayerPartyMons
	bl DoBattleFactorySelectScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SelectInitialRentalMons

	thumb_func_start sub_081A5F30
sub_081A5F30: @ 0x081A5F30
	push {lr}
	bl DoBattleFactorySwapScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A5F30

	thumb_func_start SetPerformedRentalSwap
SetPerformedRentalSwap: @ 0x081A5F3C
	ldr r1, _081A5F44
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_081A5F44: .4byte 0x03001284
	thumb_func_end SetPerformedRentalSwap

	thumb_func_start GenerateOpponentMons
GenerateOpponentMons: @ 0x081A5F48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r4, _081A611C
	ldr r0, [r4]
	ldr r1, _081A6120
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	str r0, [sp, #0x10]
	ldr r0, _081A6124
	bl VarGet
	lsls r0, r0, #0x10
	ldr r1, [r4]
	ldr r3, [sp, #0x10]
	lsls r2, r3, #1
	lsrs r0, r0, #0xe
	adds r2, r2, r0
	ldr r6, _081A6128
	adds r1, r1, r6
	adds r1, r1, r2
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	ldr r2, _081A612C
	ldr r1, _081A6130
	str r1, [r2]
	ldr r5, _081A6134
	lsls r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r8, r0
_081A5F92:
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	mov r2, r8
	lsrs r0, r2, #0x18
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r7, #0
	ldr r1, [r4]
	adds r0, r1, r5
	ldr r6, [sp, #0x10]
	lsls r6, r6, #0x18
	str r6, [sp, #0x1c]
	ldrh r0, [r0]
	cmp r7, r0
	bge _081A5FDC
	ldr r2, _081A6138
	adds r0, r1, r2
	ldrh r0, [r0]
	ldr r6, _081A611C
	cmp r0, r3
	beq _081A5FDC
	ldr r1, [r6]
	ldr r6, _081A6134
	adds r0, r1, r6
	ldrh r2, [r0]
	ldr r0, _081A6138
	adds r1, r1, r0
_081A5FCE:
	adds r1, #2
	adds r7, #1
	cmp r7, r2
	bge _081A5FDC
	ldrh r0, [r1]
	cmp r0, r3
	bne _081A5FCE
_081A5FDC:
	ldr r0, [r4]
	ldr r1, _081A6134
	adds r0, r0, r1
	ldr r6, _081A611C
	ldrh r0, [r0]
	cmp r7, r0
	bne _081A5F92
	ldr r0, _081A613C
	strh r3, [r0]
	ldr r2, [r6]
	adds r1, r2, r1
	ldrh r0, [r1]
	cmp r0, #5
	bhi _081A6004
	adds r1, r0, #0
	lsls r1, r1, #1
	ldr r4, _081A6138
	adds r0, r2, r4
	adds r0, r0, r1
	strh r3, [r0]
_081A6004:
	movs r7, #0
	mov sl, sp
	movs r6, #0
	lsls r6, r6, #1
	str r6, [sp, #0x14]
	add r6, sp
	str r6, [sp, #0x18]
_081A6012:
	ldr r1, [sp, #0x1c]
	lsrs r0, r1, #0x18
	ldr r2, [sp, #0x20]
	lsrs r1, r2, #0x18
	movs r2, #0
	bl GetMonSetId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r4, _081A6140
	ldr r2, [r4]
	lsls r1, r0, #4
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #0xc9
	beq _081A6106
	movs r3, #0
	ldr r6, _081A611C
	mov r8, r1
	adds r5, r0, #0
	ldr r1, [r6]
_081A603E:
	movs r4, #0xe7
	lsls r4, r4, #4
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	beq _081A6058
	adds r1, #0xc
	adds r3, #1
	cmp r3, #5
	ble _081A603E
_081A6058:
	cmp r3, #6
	bne _081A6106
	ldr r6, [sp, #0x10]
	cmp r6, #0
	bne _081A6068
	ldr r0, _081A6144
	cmp sb, r0
	bhi _081A6106
_081A6068:
	movs r2, #0
	adds r4, r2, r7
	cmp r2, r4
	bge _081A609A
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	cmp r0, r5
	beq _081A609A
	adds r6, r4, #0
	ldr r3, _081A6140
	mov ip, r3
	mov r5, r8
	ldr r3, [sp, #0x14]
	add r3, sp
_081A6084:
	adds r3, #2
	adds r2, #1
	cmp r2, r6
	bge _081A609A
	mov r1, ip
	ldr r0, [r1]
	adds r0, r5, r0
	ldrh r1, [r3]
	ldrh r0, [r0]
	cmp r1, r0
	bne _081A6084
_081A609A:
	cmp r2, r4
	bne _081A6106
	movs r2, #0
	cmp r2, r4
	bge _081A60D6
	ldr r3, _081A6148
	mov ip, r3
	add r0, sp, #8
	ldr r6, [sp, #0x14]
	adds r3, r0, r6
	mov r0, r8
	str r0, [sp, #0x24]
	adds r5, r4, #0
_081A60B4:
	ldrh r1, [r3]
	cmp r1, #0
	beq _081A60CE
	ldr r6, _081A6140
	ldr r0, [r6]
	ldr r6, [sp, #0x24]
	adds r0, r6, r0
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	cmp r1, r0
	beq _081A60D6
_081A60CE:
	adds r3, #2
	adds r2, #1
	cmp r2, r5
	blt _081A60B4
_081A60D6:
	cmp r2, r4
	bne _081A6106
	lsls r4, r7, #1
	ldr r0, _081A6140
	ldr r1, [r0]
	add r1, r8
	ldrh r0, [r1]
	mov r2, sl
	strh r0, [r2]
	add r2, sp, #8
	adds r2, r2, r4
	ldr r3, _081A6148
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, _081A614C
	adds r4, r4, r0
	mov r3, sb
	strh r3, [r4]
	movs r4, #2
	add sl, r4
	adds r7, #1
_081A6106:
	cmp r7, #3
	bne _081A6012
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A611C: .4byte 0x03005AF0
_081A6120: .4byte 0x00000CA9
_081A6124: .4byte 0x000040CE
_081A6128: .4byte 0x00000DE2
_081A612C: .4byte 0x0203B954
_081A6130: .4byte 0x085B4A10
_081A6134: .4byte 0x00000CB2
_081A6138: .4byte 0x00000CB4
_081A613C: .4byte 0x0203886A
_081A6140: .4byte 0x0203B958
_081A6144: .4byte 0x00000351
_081A6148: .4byte 0x085ADBF4
_081A614C: .4byte 0x03005FD8
	thumb_func_end GenerateOpponentMons

	thumb_func_start SetOpponentGfxVar
SetOpponentGfxVar: @ 0x081A6150
	push {lr}
	ldr r0, _081A6160
	ldrh r0, [r0]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	pop {r0}
	bx r0
	.align 2, 0
_081A6160: .4byte 0x0203886A
	thumb_func_end SetOpponentGfxVar

	thumb_func_start SetRentalsToOpponentParty
SetRentalsToOpponentParty: @ 0x081A6164
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _081A6184
	ldr r0, [r0]
	ldr r1, _081A6188
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _081A6194
	ldr r1, _081A618C
	ldr r0, _081A6190
	b _081A6198
	.align 2, 0
_081A6184: .4byte 0x03005AF0
_081A6188: .4byte 0x00000CA9
_081A618C: .4byte 0x0203B958
_081A6190: .4byte 0x085B8700
_081A6194:
	ldr r1, _081A6238
	ldr r0, _081A623C
_081A6198:
	str r0, [r1]
	movs r7, #0
	ldr r2, _081A6240
	mov r8, r2
_081A61A0:
	mov r0, r8
	ldr r1, [r0]
	adds r0, r7, #3
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r1, r1, r4
	ldr r0, _081A6244
	lsls r6, r7, #1
	adds r6, r6, r0
	ldrh r0, [r6]
	movs r2, #0xe7
	lsls r2, r2, #4
	adds r1, r1, r2
	strh r0, [r1]
	movs r0, #0x64
	adds r5, r7, #0
	muls r5, r0, r5
	ldr r0, _081A6248
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0
	bl GetBoxMonData
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	ldr r2, _081A624C
	adds r1, r1, r2
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	mov r2, r8
	ldr r1, [r2]
	ldr r2, _081A6250
	adds r1, r1, r2
	adds r1, r1, r4
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #0x2e
	movs r2, #0
	bl GetBoxMonData
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	ldr r2, _081A6254
	adds r1, r1, r2
	strb r0, [r1]
	ldrh r1, [r6]
	ldr r0, _081A6238
	ldr r0, [r0]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r2, [r1, #0xa]
	lsls r2, r2, #1
	ldr r0, _081A6258
	adds r2, r2, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl SetMonData
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _081A61A0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A6238: .4byte 0x0203B958
_081A623C: .4byte 0x085BCF70
_081A6240: .4byte 0x03005AF0
_081A6244: .4byte 0x03005FD8
_081A6248: .4byte 0x020243E8
_081A624C: .4byte 0x00000E78
_081A6250: .4byte 0x00000E74
_081A6254: .4byte 0x00000E79
_081A6258: .4byte 0x085ADBF4
	thumb_func_end SetRentalsToOpponentParty

	thumb_func_start SetPlayerAndOpponentParties
SetPlayerAndOpponentParties: @ 0x081A625C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _081A6288
	ldr r0, [r0]
	ldr r1, _081A628C
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r3, #3
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #2
	bne _081A6298
	ldr r1, _081A6290
	ldr r0, _081A6294
	str r0, [r1]
	movs r2, #0x1e
	str r2, [sp, #0x14]
	b _081A62B0
	.align 2, 0
_081A6288: .4byte 0x03005AF0
_081A628C: .4byte 0x00000CA9
_081A6290: .4byte 0x0203B958
_081A6294: .4byte 0x085BCF70
_081A6298:
	ldr r1, _081A6558
	ldr r0, _081A655C
	str r0, [r1]
	ldrb r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	movs r4, #0x32
	str r4, [sp, #0x14]
	cmp r0, #0
	beq _081A62B0
	movs r5, #0x64
	str r5, [sp, #0x14]
_081A62B0:
	ldr r0, _081A6560
	ldrh r0, [r0]
	cmp r0, #1
	bls _081A62BA
	b _081A6404
_081A62BA:
	bl ZeroPlayerPartyMons
	movs r0, #0
	mov r8, r0
	mov r1, sp
	adds r1, #0x12
	str r1, [sp, #0x1c]
	ldr r2, _081A6558
	mov sb, r2
_081A62CC:
	ldr r4, _081A6564
	ldr r2, [r4]
	mov r5, r8
	lsls r5, r5, #1
	mov sl, r5
	mov r3, sl
	add r3, r8
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r4, #0xe7
	lsls r4, r4, #4
	adds r0, r1, r4
	ldrh r7, [r0]
	ldr r5, _081A6568
	adds r1, r1, r5
	ldrb r6, [r1]
	movs r1, #0x64
	mov r0, r8
	muls r0, r1, r0
	ldr r1, _081A656C
	adds r0, r0, r1
	mov r4, sb
	ldr r1, [r4]
	lsls r4, r7, #4
	adds r1, r4, r1
	ldrh r1, [r1]
	movs r5, #1
	str r5, [sp]
	ldr r5, _081A6570
	adds r2, r2, r5
	adds r2, r2, r3
	ldr r2, [r2]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, [sp, #0x14]
	adds r3, r6, #0
	bl CreateMon
	movs r1, #0
	mov r2, sb
	ldr r0, [r2]
	adds r4, r4, r0
	ldrb r4, [r4, #0xb]
	mov r5, r8
	adds r5, #1
	str r5, [sp, #0x18]
	movs r5, #5
_081A632E:
	adds r0, r4, #0
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	beq _081A633A
	adds r1, #1
_081A633A:
	lsrs r4, r4, #1
	subs r5, #1
	cmp r5, #0
	bge _081A632E
	movs r0, #0xff
	lsls r0, r0, #1
	bl __divsi3
	add r1, sp, #0x10
	strh r0, [r1]
	movs r4, #1
	movs r5, #0
	lsls r7, r7, #4
	movs r0, #0x64
	mov r6, r8
	muls r6, r0, r6
	ldr r3, _081A656C
_081A635C:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldrb r0, [r0, #0xb]
	ands r0, r4
	cmp r0, #0
	beq _081A637A
	adds r1, r5, #0
	adds r1, #0x1a
	adds r0, r6, r3
	add r2, sp, #0x10
	str r3, [sp, #0x20]
	bl SetMonData
	ldr r3, [sp, #0x20]
_081A637A:
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
	adds r5, #1
	cmp r5, #5
	ble _081A635C
	movs r2, #0x64
	mov r4, r8
	muls r4, r2, r4
	ldr r5, _081A656C
	adds r0, r4, r5
	bl CalculateMonStats
	movs r0, #0
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	movs r6, #0
_081A639A:
	mov r2, sb
	ldr r0, [r2]
	adds r0, r7, r0
	lsls r1, r6, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, r5
	bl SetMonMoveAvoidReturn
	adds r6, #1
	cmp r6, #3
	ble _081A639A
	movs r5, #0x64
	mov r4, r8
	muls r4, r5, r4
	ldr r0, _081A656C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	ldr r2, [sp, #0x1c]
	bl SetMonData
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _081A6574
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	mov r2, sl
	add r2, r8
	lsls r2, r2, #2
	ldr r5, _081A6564
	ldr r0, [r5]
	adds r2, r2, r0
	ldr r0, _081A6578
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2e
	bl SetMonData
	ldr r1, [sp, #0x18]
	mov r8, r1
	cmp r1, #2
	bgt _081A6404
	b _081A62CC
_081A6404:
	ldr r0, _081A6560
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A6412
	cmp r0, #2
	beq _081A6412
	b _081A6546
_081A6412:
	movs r2, #0
	mov r8, r2
	ldr r4, _081A6558
	mov sb, r4
_081A641A:
	ldr r5, _081A6564
	ldr r3, [r5]
	mov r0, r8
	adds r0, #3
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r4, #0xe7
	lsls r4, r4, #4
	adds r0, r1, r4
	ldrh r7, [r0]
	ldr r5, _081A6568
	adds r1, r1, r5
	ldrb r6, [r1]
	movs r1, #0x64
	mov r0, r8
	muls r0, r1, r0
	ldr r1, _081A657C
	adds r0, r0, r1
	mov r4, sb
	ldr r1, [r4]
	lsls r4, r7, #4
	adds r1, r4, r1
	ldrh r1, [r1]
	movs r5, #1
	str r5, [sp]
	ldr r5, _081A6570
	adds r3, r3, r5
	adds r3, r3, r2
	ldr r2, [r3]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, [sp, #0x14]
	adds r3, r6, #0
	bl CreateMon
	movs r1, #0
	mov r2, sb
	ldr r0, [r2]
	adds r4, r4, r0
	ldrb r4, [r4, #0xb]
	mov r5, r8
	lsls r5, r5, #1
	mov sl, r5
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x18]
	movs r5, #5
_081A6480:
	adds r0, r4, #0
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	beq _081A648C
	adds r1, #1
_081A648C:
	lsrs r4, r4, #1
	subs r5, #1
	cmp r5, #0
	bge _081A6480
	add r4, sp, #0x10
	movs r0, #0xff
	lsls r0, r0, #1
	bl __divsi3
	strh r0, [r4]
	movs r4, #1
	movs r5, #0
	lsls r7, r7, #4
	movs r0, #0x64
	mov r6, r8
	muls r6, r0, r6
	ldr r3, _081A657C
_081A64AE:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldrb r0, [r0, #0xb]
	ands r0, r4
	cmp r0, #0
	beq _081A64CC
	adds r1, r5, #0
	adds r1, #0x1a
	adds r0, r6, r3
	add r2, sp, #0x10
	str r3, [sp, #0x20]
	bl SetMonData
	ldr r3, [sp, #0x20]
_081A64CC:
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
	adds r5, #1
	cmp r5, #5
	ble _081A64AE
	movs r2, #0x64
	mov r4, r8
	muls r4, r2, r4
	ldr r5, _081A657C
	adds r0, r4, r5
	bl CalculateMonStats
	movs r6, #0
_081A64E6:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	lsls r1, r6, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, r5
	bl SetMonMoveAvoidReturn
	adds r6, #1
	cmp r6, #3
	ble _081A64E6
	movs r2, #0x64
	mov r4, r8
	muls r4, r2, r4
	ldr r0, _081A657C
	adds r4, r4, r0
	mov r5, sb
	ldr r0, [r5]
	adds r0, r7, r0
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _081A6574
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	mov r2, sl
	add r2, r8
	lsls r2, r2, #2
	ldr r1, _081A6564
	ldr r0, [r1]
	adds r2, r2, r0
	ldr r5, _081A6580
	adds r2, r2, r5
	adds r0, r4, #0
	movs r1, #0x2e
	bl SetMonData
	ldr r0, [sp, #0x18]
	mov r8, r0
	cmp r0, #2
	bgt _081A6546
	b _081A641A
_081A6546:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A6558: .4byte 0x0203B958
_081A655C: .4byte 0x085B8700
_081A6560: .4byte 0x02037282
_081A6564: .4byte 0x03005AF0
_081A6568: .4byte 0x00000E78
_081A656C: .4byte 0x02024190
_081A6570: .4byte 0x00000E74
_081A6574: .4byte 0x085ADBF4
_081A6578: .4byte 0x00000E79
_081A657C: .4byte 0x020243E8
_081A6580: .4byte 0x00000E9D
	thumb_func_end SetPlayerAndOpponentParties

	thumb_func_start GenerateInitialRentalMons
GenerateInitialRentalMons: @ 0x081A6584
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	ldr r1, _081A662C
	ldr r0, _081A6630
	str r0, [r1]
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x38]
	mov r1, sp
	adds r1, #0x18
	str r1, [sp, #0x3c]
	ldr r2, _081A6634
	mov sb, r2
	movs r2, #0
	adds r3, r1, #0
	adds r1, r0, #0
	mov r0, sp
	movs r4, #5
	mov r8, r4
_081A65B2:
	strh r2, [r0]
	strh r2, [r1]
	strh r2, [r3]
	adds r3, #2
	adds r1, #2
	adds r0, #2
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	mov r4, r8
	cmp r4, #0
	bge _081A65B2
	mov r5, sb
	ldr r0, [r5]
	ldr r7, _081A6638
	adds r0, r0, r7
	ldrb r4, [r0]
	lsls r4, r4, #0x1e
	lsrs r4, r4, #0x1e
	ldr r6, _081A663C
	adds r0, r6, #0
	bl VarGet
	lsls r0, r0, #0x18
	ldr r1, [r5]
	lsls r4, r4, #1
	lsrs r0, r0, #0x16
	adds r4, r4, r0
	ldr r5, _081A6640
	adds r1, r1, r5
	adds r1, r1, r4
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	adds r0, r6, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0
	cmp r0, #1
	bne _081A6610
	movs r2, #1
_081A6610:
	ldr r1, _081A6644
	ldr r0, _081A6648
	str r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081A664C
	movs r4, #1
	str r4, [sp, #0x28]
	b _081A6650
	.align 2, 0
_081A662C: .4byte 0x0203B954
_081A6630: .4byte 0x085B4A10
_081A6634: .4byte 0x03005AF0
_081A6638: .4byte 0x00000CA9
_081A663C: .4byte 0x000040CE
_081A6640: .4byte 0x00000DE2
_081A6644: .4byte 0x0203B958
_081A6648: .4byte 0x085B8700
_081A664C:
	movs r5, #0
	str r5, [sp, #0x28]
_081A6650:
	adds r0, r2, #0
	ldr r1, [sp, #0x28]
	bl GetNumPastRentalsRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	movs r0, #0
	mov sl, r0
	mov r8, r0
	ldr r1, [sp, #0x3c]
	str r1, [sp, #0x40]
	mov r2, sp
	str r2, [sp, #0x44]
	lsls r4, r0, #1
	str r4, [sp, #0x30]
	ldr r5, [sp, #0x38]
	adds r5, r5, r4
	str r5, [sp, #0x34]
_081A6676:
	ldr r0, [sp, #0x2c]
	cmp r8, r0
	bge _081A6684
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x24]
	movs r2, #1
	b _081A668A
_081A6684:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x24]
	movs r2, #0
_081A668A:
	bl GetMonSetId
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _081A6724
	ldr r1, [r0]
	lsls r2, r7, #4
	adds r4, r2, r1
	ldrh r1, [r4]
	mov sb, r2
	cmp r1, #0xc9
	beq _081A677A
	movs r3, #0
	mov r2, r8
	adds r6, r3, r2
	cmp r3, r6
	bge _081A66E8
	ldr r5, [sp, #0x34]
	ldrh r0, [r5]
	cmp r0, r7
	beq _081A66E8
	mov ip, r4
	adds r2, r1, #0
	lsls r4, r3, #1
	ldr r1, [sp, #0x30]
	add r1, sp
	str r6, [sp, #0x48]
_081A66C0:
	ldrh r0, [r1]
	cmp r0, r2
	bne _081A66D2
	mov r0, sl
	cmp r0, #0
	bne _081A66E8
	mov r5, ip
	ldrh r5, [r5]
	mov sl, r5
_081A66D2:
	adds r4, #2
	adds r1, #2
	adds r3, #1
	ldr r0, [sp, #0x48]
	cmp r3, r0
	bge _081A66E8
	ldr r5, [sp, #0x38]
	adds r0, r5, r4
	ldrh r0, [r0]
	cmp r0, r7
	bne _081A66C0
_081A66E8:
	cmp r3, r6
	bne _081A677A
	movs r3, #0
	cmp r3, r6
	bge _081A6734
	ldr r0, _081A6728
	mov ip, r0
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x3c]
	adds r5, r1, r2
_081A66FC:
	ldrh r4, [r5]
	cmp r4, #0
	beq _081A672C
	ldr r1, _081A6724
	ldr r0, [r1]
	mov r2, sb
	adds r1, r2, r0
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	cmp r4, r0
	bne _081A672C
	ldrh r0, [r1]
	cmp r0, sl
	bne _081A6734
	movs r4, #0
	mov sl, r4
	b _081A6734
	.align 2, 0
_081A6724: .4byte 0x0203B958
_081A6728: .4byte 0x085ADBF4
_081A672C:
	adds r5, #2
	adds r3, #1
	cmp r3, r6
	blt _081A66FC
_081A6734:
	cmp r3, r6
	bne _081A677A
	ldr r0, _081A6794
	ldr r1, [r0]
	mov r5, r8
	lsls r3, r5, #1
	adds r0, r3, r5
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0xe7
	lsls r0, r0, #4
	adds r1, r1, r0
	strh r7, [r1]
	ldr r2, _081A6798
	ldr r1, [r2]
	add r1, sb
	ldrh r0, [r1]
	ldr r4, [sp, #0x44]
	strh r0, [r4]
	ldr r2, _081A679C
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, [sp, #0x40]
	strh r0, [r5]
	ldr r0, [sp, #0x38]
	adds r3, r0, r3
	strh r7, [r3]
	adds r5, #2
	str r5, [sp, #0x40]
	adds r4, #2
	str r4, [sp, #0x44]
	movs r1, #1
	add r8, r1
_081A677A:
	mov r2, r8
	cmp r2, #6
	beq _081A6782
	b _081A6676
_081A6782:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A6794: .4byte 0x03005AF0
_081A6798: .4byte 0x0203B958
_081A679C: .4byte 0x085ADBF4
	thumb_func_end GenerateInitialRentalMons

	thumb_func_start GetOpponentMostCommonMonType
GetOpponentMostCommonMonType: @ 0x081A67A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	ldr r1, _081A6830
	ldr r0, _081A6834
	str r0, [r1]
	movs r4, #0
	add r5, sp, #0x14
	ldr r7, _081A6838
	movs r1, #0
_081A67B6:
	mov r2, sp
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x11
	bls _081A67B6
	movs r4, #0
	ldr r0, _081A683C
	mov r8, r0
	ldr r0, _081A6830
	ldr r6, [r0]
	ldr r1, _081A6840
	mov ip, r1
_081A67D4:
	lsls r0, r4, #1
	add r0, r8
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r2, ip
	adds r3, r0, r2
	ldrb r2, [r3, #6]
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r3, #7]
	cmp r2, r1
	beq _081A6808
	ldrb r0, [r3, #7]
	mov r2, sp
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_081A6808:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081A67D4
	movs r0, #0
	strb r0, [r5]
	strb r0, [r5, #1]
	movs r4, #1
	adds r3, r5, #0
_081A681C:
	ldrb r0, [r3]
	add r0, sp
	mov r2, sp
	adds r1, r2, r4
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	bhs _081A6844
	strb r4, [r5]
	b _081A684A
	.align 2, 0
_081A6830: .4byte 0x0203B958
_081A6834: .4byte 0x085B8700
_081A6838: .4byte 0x02037290
_081A683C: .4byte 0x03005FD8
_081A6840: .4byte 0x082F0D54
_081A6844:
	cmp r2, r0
	bne _081A684A
	strb r4, [r3, #1]
_081A684A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x11
	bls _081A681C
	ldrb r1, [r5]
	mov r4, sp
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, #0
	beq _081A6872
	ldrb r3, [r5, #1]
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r2, r0
	bhi _081A686E
	cmp r1, r3
	bne _081A6872
_081A686E:
	strh r1, [r7]
	b _081A6876
_081A6872:
	movs r0, #0x12
	strh r0, [r7]
_081A6876:
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetOpponentMostCommonMonType

	thumb_func_start GetOpponentBattleStyle
GetOpponentBattleStyle: @ 0x081A6884
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r7, #0
	ldr r1, _081A6928
	ldr r0, _081A692C
	str r0, [r1]
	movs r4, #0
	movs r1, #0
_081A6894:
	mov r2, sp
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081A6894
	movs r4, #0
_081A68A6:
	ldr r1, _081A6930
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r5, #0
_081A68B0:
	ldr r0, _081A6928
	ldr r1, [r0]
	lsls r0, r6, #4
	adds r0, r0, r1
	lsls r1, r5, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMoveBattleStyle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _081A68B0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081A68A6
	ldr r1, _081A6934
	movs r0, #0
	strh r0, [r1]
	movs r4, #1
	adds r5, r1, #0
	ldr r3, _081A6938
	adds r2, r5, #0
_081A68F4:
	mov r1, sp
	adds r0, r1, r4
	subs r1, r4, #1
	adds r1, r1, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _081A690C
	strh r4, [r2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_081A690C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081A68F4
	cmp r7, #2
	bls _081A691E
	movs r0, #8
	strh r0, [r5]
_081A691E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A6928: .4byte 0x0203B958
_081A692C: .4byte 0x085B8700
_081A6930: .4byte 0x03005FD8
_081A6934: .4byte 0x02037290
_081A6938: .4byte 0x085DD7F8
	thumb_func_end GetOpponentBattleStyle

	thumb_func_start GetMoveBattleStyle
GetMoveBattleStyle: @ 0x081A693C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r2, #0
	ldr r6, _081A6968
_081A6946:
	movs r3, #0
	lsls r0, r2, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r4, r2, #1
	cmp r0, #0
	beq _081A697C
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
_081A695A:
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	bne _081A696C
	adds r0, r2, #0
	b _081A6986
	.align 2, 0
_081A6968: .4byte 0x085DD93C
_081A696C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _081A695A
_081A697C:
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #6
	bls _081A6946
	movs r0, #0
_081A6986:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetMoveBattleStyle

	thumb_func_start InBattleFactory
InBattleFactory: @ 0x081A698C
	push {lr}
	movs r2, #0
	ldr r1, _081A69AC
	ldr r3, _081A69B0
	adds r0, r3, #0
	ldrh r1, [r1, #0x12]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _081A69A4
	movs r2, #1
_081A69A4:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_081A69AC: .4byte 0x02036FB8
_081A69B0: .4byte 0xFFFFFEA5
	thumb_func_end InBattleFactory

	thumb_func_start RestorePlayerPartyHeldItems
RestorePlayerPartyHeldItems: @ 0x081A69B4
	push {r4, lr}
	ldr r0, _081A69D0
	ldr r0, [r0]
	ldr r1, _081A69D4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _081A69E0
	ldr r1, _081A69D8
	ldr r0, _081A69DC
	b _081A69E4
	.align 2, 0
_081A69D0: .4byte 0x03005AF0
_081A69D4: .4byte 0x00000CA9
_081A69D8: .4byte 0x0203B958
_081A69DC: .4byte 0x085B8700
_081A69E0:
	ldr r1, _081A6A2C
	ldr r0, _081A6A30
_081A69E4:
	str r0, [r1]
	movs r4, #0
_081A69E8:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081A6A34
	adds r0, r0, r1
	ldr r1, _081A6A38
	ldr r2, [r1]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r2, r2, r1
	movs r1, #0xe7
	lsls r1, r1, #4
	adds r2, r2, r1
	ldrh r2, [r2]
	ldr r1, _081A6A2C
	ldr r1, [r1]
	lsls r2, r2, #4
	adds r2, r2, r1
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	ldr r1, _081A6A3C
	adds r2, r2, r1
	movs r1, #0xc
	bl SetMonData
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081A69E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A6A2C: .4byte 0x0203B958
_081A6A30: .4byte 0x085BCF70
_081A6A34: .4byte 0x02024190
_081A6A38: .4byte 0x03005AF0
_081A6A3C: .4byte 0x085ADBF4
	thumb_func_end RestorePlayerPartyHeldItems

	thumb_func_start GetFactoryMonFixedIV
GetFactoryMonFixedIV: @ 0x081A6A40
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	lsrs r1, r0, #0x18
	cmp r1, #8
	bls _081A6A56
	movs r1, #7
_081A6A56:
	ldr r0, _081A6A64
	lsls r1, r1, #1
	adds r1, r2, r1
	adds r1, r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_081A6A64: .4byte 0x085DD9BC
	thumb_func_end GetFactoryMonFixedIV

	thumb_func_start FillFactoryBrainParty
FillFactoryBrainParty: @ 0x081A6A68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r4, _081A6C68
	ldr r0, [r4]
	ldr r1, _081A6C6C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	str r0, [sp, #0x2c]
	ldr r0, _081A6C70
	bl VarGet
	lsls r0, r0, #0x18
	ldr r1, [r4]
	ldr r3, [sp, #0x2c]
	lsls r2, r3, #1
	lsrs r0, r0, #0x16
	adds r2, r2, r0
	ldr r7, _081A6C74
	adds r1, r1, r7
	adds r1, r1, r2
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	str r1, [sp, #0x30]
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	movs r1, #0
	bl GetFactoryMonFixedIV
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	bl SetFacilityPtrsGetLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	movs r3, #0
	mov sb, r3
	ldr r1, [r4]
	ldrb r4, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #8
	orrs r4, r0
	ldrb r0, [r1, #0xc]
	lsls r0, r0, #0x10
	orrs r4, r0
	ldrb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	orrs r4, r0
	str r4, [sp, #0x28]
_081A6AE4:
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	movs r2, #0
	bl GetMonSetId
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r7, _081A6C78
	ldr r1, [r7]
	lsls r0, r5, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xc9
	bne _081A6B02
	b _081A6C50
_081A6B02:
	ldr r0, [sp, #0x20]
	cmp r0, #0x32
	bne _081A6B10
	ldr r0, _081A6C7C
	cmp r5, r0
	bls _081A6B10
	b _081A6C50
_081A6B10:
	movs r2, #0
	ldr r1, _081A6C68
	ldr r0, [r1]
	movs r3, #0xe7
	lsls r3, r3, #4
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r5, r0
	beq _081A6B3A
	adds r4, r1, #0
	movs r1, #0
_081A6B26:
	adds r1, #0xc
	adds r2, #1
	cmp r2, #5
	bgt _081A6B3A
	ldr r0, [r4]
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r5, r0
	bne _081A6B26
_081A6B3A:
	cmp r2, #6
	beq _081A6B40
	b _081A6C50
_081A6B40:
	movs r4, #0
	cmp r4, sb
	bge _081A6B74
	add r2, sp, #0xc
	ldr r7, _081A6C78
	ldr r0, [r7]
	lsls r1, r5, #4
	adds r0, r1, r0
	ldrh r2, [r2]
	adds r7, r1, #0
	ldrh r0, [r0]
	cmp r2, r0
	beq _081A6B74
	ldr r6, _081A6C78
	adds r3, r7, #0
	add r2, sp, #0xc
_081A6B60:
	adds r2, #2
	adds r4, #1
	cmp r4, sb
	bge _081A6B74
	ldr r0, [r6]
	adds r0, r3, r0
	ldrh r1, [r2]
	ldrh r0, [r0]
	cmp r1, r0
	bne _081A6B60
_081A6B74:
	cmp r4, sb
	bne _081A6C50
	movs r4, #0
	cmp r4, sb
	bge _081A6BA4
	ldr r7, _081A6C80
	ldr r6, _081A6C78
	add r2, sp, #0x14
	lsls r3, r5, #4
_081A6B86:
	ldrh r1, [r2]
	cmp r1, #0
	beq _081A6B9C
	ldr r0, [r6]
	adds r0, r3, r0
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r1, r0
	beq _081A6BA4
_081A6B9C:
	adds r2, #2
	adds r4, #1
	cmp r4, sb
	blt _081A6B86
_081A6BA4:
	cmp r4, sb
	bne _081A6C50
	mov r0, sb
	lsls r2, r0, #1
	mov r1, sp
	adds r1, r1, r2
	adds r1, #0xc
	ldr r3, _081A6C78
	ldr r4, [r3]
	lsls r5, r5, #4
	mov r8, r5
	add r4, r8
	ldrh r0, [r4]
	strh r0, [r1]
	add r1, sp, #0x14
	adds r1, r1, r2
	ldr r2, _081A6C80
	ldrb r0, [r4, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, #0x64
	mov r5, sb
	muls r5, r0, r5
	ldr r6, _081A6C84
	adds r0, r5, r6
	ldrh r1, [r4]
	ldr r7, [sp, #0x20]
	lsls r2, r7, #0x18
	ldrb r3, [r4, #0xc]
	ldr r7, [sp, #0x24]
	str r7, [sp]
	ldrb r4, [r4, #0xb]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	lsrs r2, r2, #0x18
	bl CreateMonWithEVSpreadNatureOTID
	add r0, sp, #0x1c
	movs r7, #0
	strb r7, [r0]
	movs r4, #0
	mov r7, r8
	mov sl, r0
	movs r0, #1
	add r0, sb
	mov r8, r0
_081A6C06:
	ldr r1, _081A6C78
	ldr r0, [r1]
	adds r0, r7, r0
	lsls r1, r4, #1
	adds r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, r6
	bl SetMonMoveAvoidReturn
	adds r4, #1
	cmp r4, #3
	ble _081A6C06
	movs r0, #0x64
	mov r4, sb
	muls r4, r0, r4
	ldr r0, _081A6C84
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	mov r2, sl
	bl SetMonData
	ldr r2, _081A6C78
	ldr r0, [r2]
	adds r0, r7, r0
	ldrb r2, [r0, #0xa]
	lsls r2, r2, #1
	ldr r0, _081A6C80
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	mov sb, r8
_081A6C50:
	mov r3, sb
	cmp r3, #3
	beq _081A6C58
	b _081A6AE4
_081A6C58:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A6C68: .4byte 0x03005AF0
_081A6C6C: .4byte 0x00000CA9
_081A6C70: .4byte 0x000040CE
_081A6C74: .4byte 0x00000DE2
_081A6C78: .4byte 0x0203B958
_081A6C7C: .4byte 0x00000351
_081A6C80: .4byte 0x085ADBF4
_081A6C84: .4byte 0x020243E8
	thumb_func_end FillFactoryBrainParty

	thumb_func_start GetMonSetId
GetMonSetId: @ 0x081A6C88
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r4, #8
	rsbs r1, r0, #0
	orrs r1, r0
	asrs r1, r1, #0x1f
	ands r1, r4
	adds r4, r1, #0
	cmp r3, #6
	bhi _081A6CC4
	cmp r2, #0
	beq _081A6CB8
	ldr r2, _081A6CB4
	adds r1, r1, r3
	adds r1, #1
	b _081A6CD0
	.align 2, 0
_081A6CB4: .4byte 0x085DD9CC
_081A6CB8:
	ldr r2, _081A6CC0
	adds r1, r1, r3
	b _081A6CD0
	.align 2, 0
_081A6CC0: .4byte 0x085DD9CC
_081A6CC4:
	adds r1, r3, #0
	cmp r1, #7
	beq _081A6CCC
	movs r1, #7
_081A6CCC:
	ldr r2, _081A6D04
	adds r1, r4, r1
_081A6CD0:
	lsls r1, r1, #2
	adds r0, r2, #2
	adds r0, r1, r0
	adds r1, r1, r2
	ldrh r0, [r0]
	ldrh r4, [r1]
	subs r0, r0, r4
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, r4
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081A6D04: .4byte 0x085DD9CC
	thumb_func_end GetMonSetId

	thumb_func_start GetNumPastRentalsRank
GetNumPastRentalsRank: @ 0x081A6D08
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _081A6D44
	ldr r2, [r2]
	lsrs r1, r1, #0x17
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r0, _081A6D48
	adds r2, r2, r0
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0
	cmp r1, #0xe
	bls _081A6D40
	movs r0, #1
	cmp r1, #0x15
	bls _081A6D40
	movs r0, #2
	cmp r1, #0x1c
	bls _081A6D40
	movs r0, #3
	cmp r1, #0x23
	bls _081A6D40
	movs r0, #5
	cmp r1, #0x2a
	bhi _081A6D40
	movs r0, #4
_081A6D40:
	pop {r1}
	bx r1
	.align 2, 0
_081A6D44: .4byte 0x03005AF0
_081A6D48: .4byte 0x00000DF2
	thumb_func_end GetNumPastRentalsRank

	thumb_func_start GetAiScriptsInBattleFactory
GetAiScriptsInBattleFactory: @ 0x081A6D4C
	push {r4, r5, lr}
	ldr r5, _081A6D94
	ldr r0, [r5]
	ldr r1, _081A6D98
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1e
	cmp r4, #2
	beq _081A6D90
	ldr r0, _081A6D9C
	bl VarGet
	lsls r0, r0, #0x10
	ldr r1, [r5]
	lsls r2, r4, #1
	lsrs r0, r0, #0xe
	adds r2, r2, r0
	ldr r0, _081A6DA0
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _081A6DA4
	ldrh r1, [r0]
	ldr r0, _081A6DA8
	cmp r1, r0
	beq _081A6DB0
	cmp r2, #1
	bgt _081A6DAC
_081A6D90:
	movs r0, #0
	b _081A6DB6
	.align 2, 0
_081A6D94: .4byte 0x03005AF0
_081A6D98: .4byte 0x00000CA9
_081A6D9C: .4byte 0x000040CE
_081A6DA0: .4byte 0x00000DE2
_081A6DA4: .4byte 0x0203886A
_081A6DA8: .4byte 0x000003FE
_081A6DAC:
	cmp r2, #3
	ble _081A6DB4
_081A6DB0:
	movs r0, #7
	b _081A6DB6
_081A6DB4:
	movs r0, #1
_081A6DB6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetAiScriptsInBattleFactory

	thumb_func_start SetMonMoveAvoidReturn
SetMonMoveAvoidReturn: @ 0x081A6DBC
	push {lr}
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsrs r1, r1, #0x10
	cmp r1, #0xd8
	bne _081A6DCC
	movs r1, #0xda
_081A6DCC:
	bl SetMonMoveSlot
	pop {r0}
	bx r0
	thumb_func_end SetMonMoveAvoidReturn

