.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Special_ShowDiploma
Special_ShowDiploma: @ 0x08137D24
	push {lr}
	ldr r0, _08137D34
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08137D34: .4byte 0x08177715
	thumb_func_end Special_ShowDiploma

	thumb_func_start Special_ViewWallClock
Special_ViewWallClock: @ 0x08137D38
	push {lr}
	ldr r0, _08137D50
	ldr r1, _08137D54
	str r1, [r0, #8]
	ldr r0, _08137D58
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08137D50: .4byte 0x03002360
_08137D54: .4byte 0x08085A31
_08137D58: .4byte 0x08134B8D
	thumb_func_end Special_ViewWallClock

	thumb_func_start ResetCyclingRoadChallengeData
ResetCyclingRoadChallengeData: @ 0x08137D5C
	ldr r0, _08137D70
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08137D74
	strb r1, [r0]
	ldr r1, _08137D78
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08137D70: .4byte 0x0203A820
_08137D74: .4byte 0x0203A821
_08137D78: .4byte 0x0203A824
	thumb_func_end ResetCyclingRoadChallengeData

	thumb_func_start Special_BeginCyclingRoadChallenge
Special_BeginCyclingRoadChallenge: @ 0x08137D7C
	ldr r1, _08137D94
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08137D98
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08137D9C
	ldr r0, _08137DA0
	ldr r0, [r0, #0x20]
	str r0, [r1]
	bx lr
	.align 2, 0
_08137D94: .4byte 0x0203A820
_08137D98: .4byte 0x0203A821
_08137D9C: .4byte 0x0203A824
_08137DA0: .4byte 0x03002360
	thumb_func_end Special_BeginCyclingRoadChallenge

	thumb_func_start GetPlayerAvatarBike
GetPlayerAvatarBike: @ 0x08137DA4
	push {lr}
	movs r0, #4
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08137DB6
	movs r0, #1
	b _08137DC8
_08137DB6:
	movs r0, #2
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08137DC6
	movs r0, #0
	b _08137DC8
_08137DC6:
	movs r0, #2
_08137DC8:
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarBike

	thumb_func_start DetermineCyclingRoadResults
DetermineCyclingRoadResults: @ 0x08137DCC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r6, #0x63
	bhi _08137DF8
	ldr r4, _08137DF0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r1, _08137DF4
	adds r0, r4, #0
	bl StringAppend
	b _08137E00
	.align 2, 0
_08137DF0: .4byte 0x02021C40
_08137DF4: .4byte 0x085CB025
_08137DF8:
	ldr r0, _08137E4C
	ldr r1, _08137E50
	bl StringCopy
_08137E00:
	ldr r0, _08137E54
	cmp r7, r0
	bhi _08137E60
	ldr r4, _08137E58
	adds r0, r7, #0
	movs r1, #0x3c
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r0, #0xb8
	strb r0, [r4, #2]
	adds r5, r4, #3
	adds r0, r7, #0
	movs r1, #0x3c
	bl __umodsi3
	movs r1, #0x64
	muls r0, r1, r0
	movs r1, #0x3c
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r1, _08137E5C
	adds r0, r4, #0
	bl StringAppend
	b _08137E68
	.align 2, 0
_08137E4C: .4byte 0x02021C40
_08137E50: .4byte 0x085CB00E
_08137E54: .4byte 0x00000E0F
_08137E58: .4byte 0x02021C54
_08137E5C: .4byte 0x085CB021
_08137E60:
	ldr r0, _08137E74
	ldr r1, _08137E78
	bl StringCopy
_08137E68:
	movs r4, #0
	cmp r6, #0
	bne _08137E7C
	movs r4, #5
	b _08137E9A
	.align 2, 0
_08137E74: .4byte 0x02021C54
_08137E78: .4byte 0x085CB018
_08137E7C:
	cmp r6, #3
	bhi _08137E84
	movs r4, #4
	b _08137E9A
_08137E84:
	cmp r6, #9
	bhi _08137E8C
	movs r4, #3
	b _08137E9A
_08137E8C:
	cmp r6, #0x13
	bhi _08137E94
	movs r4, #2
	b _08137E9A
_08137E94:
	cmp r6, #0x63
	bhi _08137E9A
	movs r4, #1
_08137E9A:
	adds r0, r7, #0
	movs r1, #0x3c
	bl __udivsi3
	cmp r0, #0xa
	bhi _08137EAA
	adds r0, r4, #5
	b _08137EC8
_08137EAA:
	cmp r0, #0xf
	bhi _08137EB2
	adds r0, r4, #4
	b _08137EC8
_08137EB2:
	cmp r0, #0x14
	bhi _08137EBA
	adds r0, r4, #3
	b _08137EC8
_08137EBA:
	cmp r0, #0x28
	bhi _08137EC2
	adds r0, r4, #2
	b _08137EC8
_08137EC2:
	cmp r0, #0x3b
	bhi _08137ECC
	adds r0, r4, #1
_08137EC8:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08137ECC:
	ldr r0, _08137ED8
	strh r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137ED8: .4byte 0x02037290
	thumb_func_end DetermineCyclingRoadResults

	thumb_func_start FinishCyclingRoadChallenge
FinishCyclingRoadChallenge: @ 0x08137EDC
	push {r4, r5, lr}
	ldr r0, _08137F00
	ldr r1, _08137F04
	ldr r4, [r0, #0x20]
	ldr r0, [r1]
	subs r4, r4, r0
	ldr r5, _08137F08
	ldrb r1, [r5]
	adds r0, r4, #0
	bl DetermineCyclingRoadResults
	ldrb r1, [r5]
	adds r0, r4, #0
	bl RecordCyclingRoadResults
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08137F00: .4byte 0x03002360
_08137F04: .4byte 0x0203A824
_08137F08: .4byte 0x0203A821
	thumb_func_end FinishCyclingRoadChallenge

	thumb_func_start RecordCyclingRoadResults
RecordCyclingRoadResults: @ 0x08137F0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r6, _08137F60
	adds r0, r6, #0
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r7, _08137F64
	adds r0, r7, #0
	bl VarGet
	lsls r0, r0, #0x10
	adds r4, r4, r0
	cmp r4, r5
	bhi _08137F3C
	cmp r4, #0
	bne _08137F56
_08137F3C:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	bl VarSet
	lsrs r1, r5, #0x10
	adds r0, r7, #0
	bl VarSet
	ldr r0, _08137F68
	mov r1, r8
	bl VarSet
_08137F56:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137F60: .4byte 0x00004028
_08137F64: .4byte 0x00004029
_08137F68: .4byte 0x00004027
	thumb_func_end RecordCyclingRoadResults

	thumb_func_start GetRecordedCyclingRoadResults
GetRecordedCyclingRoadResults: @ 0x08137F6C
	push {r4, lr}
	ldr r0, _08137FA0
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08137FA4
	bl VarGet
	lsls r0, r0, #0x10
	adds r4, r4, r0
	cmp r4, #0
	beq _08137FAC
	ldr r0, _08137FA8
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl DetermineCyclingRoadResults
	movs r0, #1
	b _08137FAE
	.align 2, 0
_08137FA0: .4byte 0x00004028
_08137FA4: .4byte 0x00004029
_08137FA8: .4byte 0x00004027
_08137FAC:
	movs r0, #0
_08137FAE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetRecordedCyclingRoadResults

	thumb_func_start UpdateCyclingRoadState
UpdateCyclingRoadState: @ 0x08137FB4
	push {r4, lr}
	ldr r0, _08137FF4
	ldrh r1, [r0]
	ldr r0, _08137FF8
	cmp r1, r0
	beq _08137FEC
	ldr r4, _08137FFC
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	beq _08137FDE
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bne _08137FEC
_08137FDE:
	adds r0, r4, #0
	movs r1, #0
	bl VarSet
	movs r0, #0
	bl Overworld_SetSavedMusic
_08137FEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08137FF4: .4byte 0x02031F7C
_08137FF8: .4byte 0x00000C1D
_08137FFC: .4byte 0x000040A9
	thumb_func_end UpdateCyclingRoadState

	thumb_func_start SetSSTidalFlag
SetSSTidalFlag: @ 0x08138000
	push {lr}
	ldr r0, _08138018
	bl FlagSet
	ldr r0, _0813801C
	bl GetVarPointer
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08138018: .4byte 0x0000088D
_0813801C: .4byte 0x0000404A
	thumb_func_end SetSSTidalFlag

	thumb_func_start ResetSSTidalFlag
ResetSSTidalFlag: @ 0x08138020
	push {lr}
	ldr r0, _0813802C
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0813802C: .4byte 0x0000088D
	thumb_func_end ResetSSTidalFlag

	thumb_func_start CountSSTidalStep
CountSSTidalStep: @ 0x08138030
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0813805C
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08138056
	ldr r0, _08138060
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, r4, r1
	strh r1, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xcc
	bhi _08138064
_08138056:
	movs r0, #0
	b _08138066
	.align 2, 0
_0813805C: .4byte 0x0000088D
_08138060: .4byte 0x0000404A
_08138064:
	movs r0, #1
_08138066:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CountSSTidalStep

	thumb_func_start GetSSTidalLocation
GetSSTidalLocation: @ 0x0813806C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0813809C
	bl GetVarPointer
	adds r4, r0, #0
	ldr r0, _081380A0
	bl GetVarPointer
	ldrh r0, [r0]
	subs r0, #1
	cmp r0, #9
	bhi _08138132
	lsls r0, r0, #2
	ldr r1, _081380A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813809C: .4byte 0x0000404A
_081380A0: .4byte 0x000040B4
_081380A4: .4byte 0x081380A8
_081380A8: @ jump table
	.4byte _081380D0 @ case 0
	.4byte _081380E0 @ case 1
	.4byte _081380D4 @ case 2
	.4byte _081380D8 @ case 3
	.4byte _081380D8 @ case 4
	.4byte _081380DC @ case 5
	.4byte _08138108 @ case 6
	.4byte _081380D0 @ case 7
	.4byte _081380D4 @ case 8
	.4byte _081380DC @ case 9
_081380D0:
	movs r0, #1
	b _0813813E
_081380D4:
	movs r0, #4
	b _0813813E
_081380D8:
	movs r0, #2
	b _0813813E
_081380DC:
	movs r0, #3
	b _0813813E
_081380E0:
	ldrh r0, [r4]
	cmp r0, #0x3b
	bhi _081380F0
	movs r0, #0x31
	strb r0, [r5]
	ldrh r0, [r4]
	adds r0, #0x13
	b _08138130
_081380F0:
	cmp r0, #0x8b
	bhi _081380FE
	movs r0, #0x30
	strb r0, [r5]
	ldrh r0, [r4]
	subs r0, #0x3c
	b _08138130
_081380FE:
	movs r0, #0x2f
	strb r0, [r5]
	ldrh r0, [r4]
	subs r0, #0x8c
	b _08138130
_08138108:
	ldrh r0, [r4]
	cmp r0, #0x41
	bhi _08138118
	movs r0, #0x2f
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, #0x41
	b _0813812E
_08138118:
	cmp r0, #0x91
	bhi _08138126
	movs r0, #0x30
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, #0x91
	b _0813812E
_08138126:
	movs r0, #0x31
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, #0xe0
_0813812E:
	subs r0, r0, r1
_08138130:
	strh r0, [r6]
_08138132:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x14
	strh r0, [r7]
	movs r0, #0
_0813813E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetSSTidalLocation

	thumb_func_start ShouldDoWallyCall
ShouldDoWallyCall: @ 0x08138148
	push {lr}
	movs r0, #0x88
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813817A
	ldr r0, _08138180
	ldrb r0, [r0, #0x17]
	cmp r0, #1
	blt _0813817A
	cmp r0, #3
	ble _08138166
	cmp r0, #6
	bne _0813817A
_08138166:
	ldr r0, _08138184
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xf9
	bhi _08138188
_0813817A:
	movs r0, #0
	b _0813818A
	.align 2, 0
_08138180: .4byte 0x02036FB8
_08138184: .4byte 0x000040F2
_08138188:
	movs r0, #1
_0813818A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldDoWallyCall

	thumb_func_start ShouldDoWinonaCall
ShouldDoWinonaCall: @ 0x08138190
	push {lr}
	movs r0, #0x8a
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081381C2
	ldr r0, _081381C8
	ldrb r0, [r0, #0x17]
	cmp r0, #1
	blt _081381C2
	cmp r0, #3
	ble _081381AE
	cmp r0, #6
	bne _081381C2
_081381AE:
	ldr r0, _081381CC
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #9
	bhi _081381D0
_081381C2:
	movs r0, #0
	b _081381D2
	.align 2, 0
_081381C8: .4byte 0x02036FB8
_081381CC: .4byte 0x000040F3
_081381D0:
	movs r0, #1
_081381D2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldDoWinonaCall

	thumb_func_start ShouldDoScottCall
ShouldDoScottCall: @ 0x081381D8
	push {lr}
	movs r0, #0x72
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813820A
	ldr r0, _08138210
	ldrb r0, [r0, #0x17]
	cmp r0, #1
	blt _0813820A
	cmp r0, #3
	ble _081381F6
	cmp r0, #6
	bne _0813820A
_081381F6:
	ldr r0, _08138214
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #9
	bhi _08138218
_0813820A:
	movs r0, #0
	b _0813821A
	.align 2, 0
_08138210: .4byte 0x02036FB8
_08138214: .4byte 0x000040F5
_08138218:
	movs r0, #1
_0813821A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldDoScottCall

	thumb_func_start ShouldDoRoxanneCall
ShouldDoRoxanneCall: @ 0x08138220
	push {lr}
	movs r0, #0x80
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08138252
	ldr r0, _08138258
	ldrb r0, [r0, #0x17]
	cmp r0, #1
	blt _08138252
	cmp r0, #3
	ble _0813823E
	cmp r0, #6
	bne _08138252
_0813823E:
	ldr r0, _0813825C
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xf9
	bhi _08138260
_08138252:
	movs r0, #0
	b _08138262
	.align 2, 0
_08138258: .4byte 0x02036FB8
_0813825C: .4byte 0x000040F4
_08138260:
	movs r0, #1
_08138262:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldDoRoxanneCall

	thumb_func_start ShouldDoRivalRayquazaCall
ShouldDoRivalRayquazaCall: @ 0x08138268
	push {lr}
	movs r0, #0x75
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813829A
	ldr r0, _081382A0
	ldrb r0, [r0, #0x17]
	cmp r0, #1
	blt _0813829A
	cmp r0, #3
	ble _08138286
	cmp r0, #6
	bne _0813829A
_08138286:
	ldr r0, _081382A4
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xf9
	bhi _081382A8
_0813829A:
	movs r0, #0
	b _081382AA
	.align 2, 0
_081382A0: .4byte 0x02036FB8
_081382A4: .4byte 0x000040F6
_081382A8:
	movs r0, #1
_081382AA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldDoRivalRayquazaCall

	thumb_func_start GetLinkPartnerNames
GetLinkPartnerNames: @ 0x081382B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _081382FA
	ldr r0, _08138308
	mov r8, r0
_081382D2:
	cmp r7, r4
	beq _081382F0
	lsls r0, r6, #2
	add r0, r8
	ldr r0, [r0]
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	ldr r2, _0813830C
	adds r1, r1, r2
	bl StringCopy
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_081382F0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _081382D2
_081382FA:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08138308: .4byte 0x08568BF0
_0813830C: .4byte 0x020226A8
	thumb_func_end GetLinkPartnerNames

	thumb_func_start SpawnLinkPartnerEventObject
SpawnLinkPartnerEventObject: @ 0x08138310
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r7, #0
	movs r0, #0
	mov sb, r0
	mov r8, r0
	ldr r1, _0813835C
	add r0, sp, #8
	movs r2, #4
	bl memcpy
	add r4, sp, #0xc
	ldr r1, _08138360
	adds r0, r4, #0
	movs r2, #8
	bl memcpy
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _08138380
	cmp r0, #2
	bgt _08138364
	cmp r0, #1
	beq _081383AC
	b _081383C0
	.align 2, 0
_0813835C: .4byte 0x085925A8
_08138360: .4byte 0x085925AC
_08138364:
	cmp r1, #3
	beq _0813836E
	cmp r1, #4
	beq _08138394
	b _081383C0
_0813836E:
	movs r7, #2
	ldr r0, _0813837C
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	b _0813839C
	.align 2, 0
_0813837C: .4byte 0x03005AEC
_08138380:
	movs r7, #1
	ldr r0, _08138390
	ldr r0, [r0]
	ldrh r1, [r0]
	mov sb, r1
	ldrh r0, [r0, #2]
	subs r0, #1
	b _081383BA
	.align 2, 0
_08138390: .4byte 0x03005AEC
_08138394:
	ldr r0, _081383A8
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
_0813839C:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r1, [r1, #2]
	mov r8, r1
	b _081383C0
	.align 2, 0
_081383A8: .4byte 0x03005AEC
_081383AC:
	movs r7, #3
	ldr r0, _081383C4
	ldr r0, [r0]
	ldrh r3, [r0]
	mov sb, r3
	ldrh r0, [r0, #2]
	adds r0, #1
_081383BA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_081383C0:
	movs r6, #0
	b _08138480
	.align 2, 0
_081383C4: .4byte 0x03005AEC
_081383C8:
	cmp sl, r6
	beq _0813847A
	ldr r0, _081383E8
	lsls r2, r6, #3
	subs r1, r2, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	adds r4, r0, #0
	cmp r3, #1
	blt _081383FC
	cmp r3, #2
	ble _081383EC
	cmp r3, #3
	beq _081383F8
	b _081383FC
	.align 2, 0
_081383E8: .4byte 0x020226A0
_081383EC:
	ldrb r0, [r1, #0x13]
	movs r5, #0xec
	cmp r0, #0
	bne _0813840C
	movs r5, #0xeb
	b _0813840C
_081383F8:
	ldrb r0, [r1, #0x13]
	b _08138404
_081383FC:
	subs r0, r2, r6
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #0x13]
_08138404:
	movs r5, #0x69
	cmp r0, #0
	bne _0813840C
	movs r5, #0x64
_0813840C:
	mov r0, sp
	adds r0, r0, r7
	adds r0, #8
	ldrb r1, [r0]
	movs r4, #0xf0
	subs r4, r4, r6
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r7, #1
	mov r0, sp
	adds r0, r0, r2
	adds r0, #0xc
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, sb
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov ip, r3
	add r0, ip
	adds r3, r0, #7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov ip, r3
	mov r0, sp
	adds r0, #0xd
	adds r0, r0, r2
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	adds r0, #7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	mov r3, ip
	bl SpawnSpecialEventObjectParameterized
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl LoadLinkPartnerEventObjectSpritePalette
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #4
	bne _0813847A
	movs r7, #0
_0813847A:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08138480:
	ldr r0, _08138498
	ldrh r0, [r0]
	cmp r6, r0
	blo _081383C8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08138498: .4byte 0x02037280
	thumb_func_end SpawnLinkPartnerEventObject

	thumb_func_start LoadLinkPartnerEventObjectSpritePalette
LoadLinkPartnerEventObjectSpritePalette: @ 0x0813849C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	lsrs r5, r2, #0x18
	lsrs r4, r0, #0x18
	movs r2, #0xa8
	lsls r2, r2, #0x15
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _081384C4
	cmp r4, #0x64
	beq _081384C4
	cmp r4, #0x69
	bne _08138556
_081384C4:
	ldr r0, _0813850C
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	adds r0, r3, #0
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x10
	beq _08138556
	ldr r1, _08138510
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08138514
	adds r1, r1, r0
	lsls r3, r5, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	cmp r4, #0x69
	beq _08138548
	cmp r4, #0x69
	bgt _08138518
	cmp r4, #0x64
	beq _08138534
	b _08138556
	.align 2, 0
_0813850C: .4byte 0x03005AEC
_08138510: .4byte 0x02036FF0
_08138514: .4byte 0x020205AC
_08138518:
	cmp r4, #0xeb
	beq _08138522
	cmp r4, #0xec
	beq _0813852C
	b _08138556
_08138522:
	ldr r0, _08138528
	b _08138536
	.align 2, 0
_08138528: .4byte 0x08471E6C
_0813852C:
	ldr r0, _08138530
	b _08138536
	.align 2, 0
_08138530: .4byte 0x0847D90C
_08138534:
	ldr r0, _08138544
_08138536:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r3, r2
	movs r2, #0x20
	bl LoadPalette
	b _08138556
	.align 2, 0
_08138544: .4byte 0x08470C4C
_08138548:
	ldr r0, _0813855C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r3, r2
	movs r2, #0x20
	bl LoadPalette
_08138556:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813855C: .4byte 0x0847C6CC
	thumb_func_end LoadLinkPartnerEventObjectSpritePalette

	thumb_func_start MauvilleGymSpecial1
MauvilleGymSpecial1: @ 0x08138560
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08138580
_08138566:
	ldr r0, _08138584
	ldrh r0, [r0]
	cmp r4, r0
	bne _0813858C
	lsls r1, r4, #2
	adds r1, r1, r5
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	ldr r2, _08138588
	bl MapGridSetMetatileIdAt
	b _0813859A
	.align 2, 0
_08138580: .4byte 0x085925B4
_08138584: .4byte 0x02037280
_08138588: .4byte 0x00000206
_0813858C:
	lsls r1, r4, #2
	adds r1, r1, r5
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	ldr r2, _081385AC
	bl MapGridSetMetatileIdAt
_0813859A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08138566
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081385AC: .4byte 0x00000205
	thumb_func_end MauvilleGymSpecial1

	thumb_func_start MauvilleGymSpecial2
MauvilleGymSpecial2: @ 0x081385B0
	push {r4, r5, r6, lr}
	movs r5, #0xc
_081385B4:
	movs r4, #7
	adds r6, r5, #1
_081385B8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _081385D4
	adds r0, r0, r1
	cmp r0, #0x37
	bls _081385CA
	b _081387A4
_081385CA:
	lsls r0, r0, #2
	ldr r1, _081385D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081385D4: .4byte 0xFFFFFDE6
_081385D8: .4byte 0x081385DC
_081385DC: @ jump table
	.4byte _08138762 @ case 0
	.4byte _081387A4 @ case 1
	.4byte _081387A4 @ case 2
	.4byte _081387A4 @ case 3
	.4byte _081387A4 @ case 4
	.4byte _081387A4 @ case 5
	.4byte _081386BC @ case 6
	.4byte _081386C2 @ case 7
	.4byte _081386FC @ case 8
	.4byte _08138704 @ case 9
	.4byte _081387A4 @ case 10
	.4byte _081387A4 @ case 11
	.4byte _081387A4 @ case 12
	.4byte _081387A4 @ case 13
	.4byte _081386CC @ case 14
	.4byte _081386D2 @ case 15
	.4byte _0813870C @ case 16
	.4byte _08138714 @ case 17
	.4byte _081387A4 @ case 18
	.4byte _081387A4 @ case 19
	.4byte _081387A4 @ case 20
	.4byte _081387A4 @ case 21
	.4byte _081386DC @ case 22
	.4byte _081386E2 @ case 23
	.4byte _0813871C @ case 24
	.4byte _08138724 @ case 25
	.4byte _081387A4 @ case 26
	.4byte _081387A4 @ case 27
	.4byte _081387A4 @ case 28
	.4byte _081387A4 @ case 29
	.4byte _081386EC @ case 30
	.4byte _081386F4 @ case 31
	.4byte _0813872C @ case 32
	.4byte _08138734 @ case 33
	.4byte _081387A4 @ case 34
	.4byte _081387A4 @ case 35
	.4byte _081387A4 @ case 36
	.4byte _081387A4 @ case 37
	.4byte _0813873C @ case 38
	.4byte _0813874C @ case 39
	.4byte _0813875C @ case 40
	.4byte _08138784 @ case 41
	.4byte _081387A4 @ case 42
	.4byte _081387A4 @ case 43
	.4byte _081387A4 @ case 44
	.4byte _081387A4 @ case 45
	.4byte _08138744 @ case 46
	.4byte _08138754 @ case 47
	.4byte _081387A4 @ case 48
	.4byte _081387A4 @ case 49
	.4byte _081387A4 @ case 50
	.4byte _081387A4 @ case 51
	.4byte _081387A4 @ case 52
	.4byte _081387A4 @ case 53
	.4byte _0813879A @ case 54
	.4byte _0813878C @ case 55
_081386BC:
	movs r2, #0x8c
	lsls r2, r2, #2
	b _08138790
_081386C2:
	ldr r2, _081386C8
	b _08138790
	.align 2, 0
_081386C8: .4byte 0x00000231
_081386CC:
	movs r2, #0x8e
	lsls r2, r2, #2
	b _08138790
_081386D2:
	ldr r2, _081386D8
	b _08138790
	.align 2, 0
_081386D8: .4byte 0x00000239
_081386DC:
	movs r2, #0x88
	lsls r2, r2, #2
	b _08138790
_081386E2:
	ldr r2, _081386E8
	b _08138790
	.align 2, 0
_081386E8: .4byte 0x00000221
_081386EC:
	ldr r2, _081386F0
	b _08138790
	.align 2, 0
_081386F0: .4byte 0x00000E28
_081386F4:
	ldr r2, _081386F8
	b _08138790
	.align 2, 0
_081386F8: .4byte 0x00000E29
_081386FC:
	ldr r2, _08138700
	b _08138790
	.align 2, 0
_08138700: .4byte 0x00000232
_08138704:
	ldr r2, _08138708
	b _08138790
	.align 2, 0
_08138708: .4byte 0x00000233
_0813870C:
	ldr r2, _08138710
	b _08138790
	.align 2, 0
_08138710: .4byte 0x0000023A
_08138714:
	ldr r2, _08138718
	b _08138790
	.align 2, 0
_08138718: .4byte 0x0000023B
_0813871C:
	ldr r2, _08138720
	b _08138790
	.align 2, 0
_08138720: .4byte 0x00000222
_08138724:
	ldr r2, _08138728
	b _08138790
	.align 2, 0
_08138728: .4byte 0x00000223
_0813872C:
	ldr r2, _08138730
	b _08138790
	.align 2, 0
_08138730: .4byte 0x00000E2A
_08138734:
	ldr r2, _08138738
	b _08138790
	.align 2, 0
_08138738: .4byte 0x00000E2B
_0813873C:
	ldr r2, _08138740
	b _08138790
	.align 2, 0
_08138740: .4byte 0x00000E42
_08138744:
	ldr r2, _08138748
	b _08138790
	.align 2, 0
_08138748: .4byte 0x0000021A
_0813874C:
	ldr r2, _08138750
	b _08138790
	.align 2, 0
_08138750: .4byte 0x00000E43
_08138754:
	ldr r2, _08138758
	b _08138790
	.align 2, 0
_08138758: .4byte 0x0000021A
_0813875C:
	movs r2, #0xe4
	lsls r2, r2, #4
	b _08138790
_08138762:
	subs r1, r5, #1
	adds r0, r4, #0
	bl MapGridGetMetatileIdAt
	movs r1, #0x90
	lsls r1, r1, #2
	cmp r0, r1
	bne _0813877C
	ldr r2, _08138778
	b _08138790
	.align 2, 0
_08138778: .4byte 0x00000E48
_0813877C:
	ldr r2, _08138780
	b _08138790
	.align 2, 0
_08138780: .4byte 0x00000E49
_08138784:
	ldr r2, _08138788
	b _08138790
	.align 2, 0
_08138788: .4byte 0x00000E41
_0813878C:
	movs r2, #0xe5
	lsls r2, r2, #4
_08138790:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
	b _081387A4
_0813879A:
	ldr r2, _081387BC
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
_081387A4:
	adds r4, #1
	cmp r4, #0xf
	bgt _081387AC
	b _081385B8
_081387AC:
	adds r5, r6, #0
	cmp r5, #0x17
	bgt _081387B4
	b _081385B4
_081387B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081387BC: .4byte 0x00000251
	thumb_func_end MauvilleGymSpecial2

	thumb_func_start MauvilleGymSpecial3
MauvilleGymSpecial3: @ 0x081387C0
	push {r4, r5, r6, lr}
	ldr r4, _081387FC
	movs r5, #3
_081387C6:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldr r2, _08138800
	bl MapGridSetMetatileIdAt
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _081387C6
	movs r5, #0xc
_081387DA:
	movs r4, #7
	adds r6, r5, #1
_081387DE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _08138804
	adds r0, r0, r1
	cmp r0, #0x30
	bls _081387F0
	b _0813893A
_081387F0:
	lsls r0, r0, #2
	ldr r1, _08138808
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081387FC: .4byte 0x085925B4
_08138800: .4byte 0x00000206
_08138804: .4byte 0xFFFFFDE0
_08138808: .4byte 0x0813880C
_0813880C: @ jump table
	.4byte _081388D0 @ case 0
	.4byte _081388D6 @ case 1
	.4byte _081388F0 @ case 2
	.4byte _081388F8 @ case 3
	.4byte _0813893A @ case 4
	.4byte _0813893A @ case 5
	.4byte _0813893A @ case 6
	.4byte _0813893A @ case 7
	.4byte _081388E0 @ case 8
	.4byte _081388E6 @ case 9
	.4byte _08138900 @ case 10
	.4byte _08138908 @ case 11
	.4byte _0813893A @ case 12
	.4byte _0813893A @ case 13
	.4byte _0813893A @ case 14
	.4byte _0813893A @ case 15
	.4byte _0813893A @ case 16
	.4byte _0813893A @ case 17
	.4byte _0813893A @ case 18
	.4byte _0813893A @ case 19
	.4byte _0813893A @ case 20
	.4byte _0813893A @ case 21
	.4byte _0813893A @ case 22
	.4byte _0813893A @ case 23
	.4byte _0813893A @ case 24
	.4byte _0813893A @ case 25
	.4byte _0813893A @ case 26
	.4byte _0813893A @ case 27
	.4byte _0813893A @ case 28
	.4byte _0813893A @ case 29
	.4byte _0813893A @ case 30
	.4byte _0813893A @ case 31
	.4byte _08138910 @ case 32
	.4byte _08138918 @ case 33
	.4byte _0813893A @ case 34
	.4byte _0813893A @ case 35
	.4byte _0813893A @ case 36
	.4byte _0813893A @ case 37
	.4byte _0813893A @ case 38
	.4byte _0813893A @ case 39
	.4byte _08138920 @ case 40
	.4byte _08138920 @ case 41
	.4byte _0813893A @ case 42
	.4byte _0813893A @ case 43
	.4byte _0813893A @ case 44
	.4byte _0813893A @ case 45
	.4byte _0813893A @ case 46
	.4byte _0813893A @ case 47
	.4byte _08138930 @ case 48
_081388D0:
	movs r2, #0x8c
	lsls r2, r2, #2
	b _08138922
_081388D6:
	ldr r2, _081388DC
	b _08138922
	.align 2, 0
_081388DC: .4byte 0x00000231
_081388E0:
	movs r2, #0x8e
	lsls r2, r2, #2
	b _08138922
_081388E6:
	ldr r2, _081388EC
	b _08138922
	.align 2, 0
_081388EC: .4byte 0x00000239
_081388F0:
	ldr r2, _081388F4
	b _08138922
	.align 2, 0
_081388F4: .4byte 0x00000232
_081388F8:
	ldr r2, _081388FC
	b _08138922
	.align 2, 0
_081388FC: .4byte 0x00000233
_08138900:
	ldr r2, _08138904
	b _08138922
	.align 2, 0
_08138904: .4byte 0x0000023A
_08138908:
	ldr r2, _0813890C
	b _08138922
	.align 2, 0
_0813890C: .4byte 0x0000023B
_08138910:
	ldr r2, _08138914
	b _08138922
	.align 2, 0
_08138914: .4byte 0x00000E42
_08138918:
	ldr r2, _0813891C
	b _08138922
	.align 2, 0
_0813891C: .4byte 0x00000E43
_08138920:
	ldr r2, _0813892C
_08138922:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
	b _0813893A
	.align 2, 0
_0813892C: .4byte 0x0000021A
_08138930:
	ldr r2, _08138950
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
_0813893A:
	adds r4, #1
	cmp r4, #0xf
	bgt _08138942
	b _081387DE
_08138942:
	adds r5, r6, #0
	cmp r5, #0x17
	bgt _0813894A
	b _081387DA
_0813894A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138950: .4byte 0x00000251
	thumb_func_end MauvilleGymSpecial3

	thumb_func_start PetalburgGymSpecial1
PetalburgGymSpecial1: @ 0x08138954
	push {lr}
	ldr r0, _08138974
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08138978
	strb r1, [r0]
	movs r0, #0x2c
	bl PlaySE
	ldr r0, _0813897C
	movs r1, #8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08138974: .4byte 0x0203A828
_08138978: .4byte 0x0203A829
_0813897C: .4byte 0x08138981
	thumb_func_end PetalburgGymSpecial1

	thumb_func_start Task_PetalburgGym
Task_PetalburgGym: @ 0x08138980
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _081389C8
	ldr r5, _081389CC
	ldrb r1, [r5]
	adds r0, r1, r0
	ldr r4, _081389D0
	ldrb r2, [r4]
	ldrb r0, [r0]
	cmp r0, r2
	bne _081389DC
	ldr r0, _081389D4
	ldrb r0, [r0]
	ldr r2, _081389D8
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	bl PetalburgGymFunc
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bne _081389E0
	adds r0, r6, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	b _081389E0
	.align 2, 0
_081389C8: .4byte 0x085925C4
_081389CC: .4byte 0x0203A829
_081389D0: .4byte 0x0203A828
_081389D4: .4byte 0x02037280
_081389D8: .4byte 0x085925CA
_081389DC:
	adds r0, r2, #1
	strb r0, [r4]
_081389E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_PetalburgGym

	thumb_func_start PetalburgGymFunc
PetalburgGymFunc: @ 0x081389E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r7, #0
	subs r0, #1
	cmp r0, #7
	bhi _08138AB0
	lsls r0, r0, #2
	ldr r1, _08138A0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08138A0C: .4byte 0x08138A10
_08138A10: @ jump table
	.4byte _08138A30 @ case 0
	.4byte _08138A42 @ case 1
	.4byte _08138A54 @ case 2
	.4byte _08138A66 @ case 3
	.4byte _08138A74 @ case 4
	.4byte _08138A8A @ case 5
	.4byte _08138A96 @ case 6
	.4byte _08138AA4 @ case 7
_08138A30:
	movs r7, #2
	mov r1, sp
	movs r0, #1
	strh r0, [r1]
	movs r0, #7
	strh r0, [r1, #2]
	add r1, sp, #8
	movs r0, #0x68
	b _08138A84
_08138A42:
	movs r7, #2
	mov r1, sp
	movs r0, #1
	strh r0, [r1]
	movs r0, #7
	strh r0, [r1, #2]
	add r1, sp, #8
	movs r0, #0x4e
	b _08138A84
_08138A54:
	movs r7, #2
	mov r1, sp
	movs r0, #1
	strh r0, [r1]
	movs r0, #7
	strh r0, [r1, #2]
	add r1, sp, #8
	movs r0, #0x5b
	b _08138A84
_08138A66:
	movs r7, #1
	mov r1, sp
	movs r0, #7
	strh r0, [r1]
	add r1, sp, #8
	movs r0, #0x27
	b _08138AAE
_08138A74:
	movs r7, #2
	mov r1, sp
	movs r0, #1
	strh r0, [r1]
	movs r0, #7
	strh r0, [r1, #2]
	add r1, sp, #8
	movs r0, #0x34
_08138A84:
	strh r0, [r1]
	strh r0, [r1, #2]
	b _08138AB0
_08138A8A:
	movs r7, #1
	mov r0, sp
	strh r7, [r0]
	add r1, sp, #8
	movs r0, #0x41
	b _08138AAE
_08138A96:
	movs r7, #1
	mov r1, sp
	movs r0, #7
	strh r0, [r1]
	add r1, sp, #8
	movs r0, #0xd
	b _08138AAE
_08138AA4:
	movs r7, #1
	mov r0, sp
	strh r7, [r0]
	add r1, sp, #8
	movs r0, #0x1a
_08138AAE:
	strh r0, [r1]
_08138AB0:
	movs r6, #0
	cmp r6, r7
	bhs _08138B02
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	adds r1, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	mov sb, r1
	adds r1, r2, #0
	adds r1, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	mov r8, r1
_08138ACE:
	lsls r1, r6, #1
	mov r3, sp
	adds r5, r3, r1
	ldrh r0, [r5]
	adds r0, #7
	add r4, sp, #8
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #7
	mov r3, sb
	lsrs r2, r3, #0x10
	bl MapGridSetMetatileIdAt
	ldrh r0, [r5]
	adds r0, #7
	ldrh r1, [r4]
	adds r1, #8
	mov r3, r8
	lsrs r2, r3, #0x10
	bl MapGridSetMetatileIdAt
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _08138ACE
_08138B02:
	bl DrawWholeMapView
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end PetalburgGymFunc

	thumb_func_start PetalburgGymSpecial2
PetalburgGymSpecial2: @ 0x08138B14
	push {lr}
	ldr r0, _08138B28
	ldrb r0, [r0]
	ldr r1, _08138B2C
	ldrh r1, [r1, #8]
	bl PetalburgGymFunc
	pop {r0}
	bx r0
	.align 2, 0
_08138B28: .4byte 0x02037280
_08138B2C: .4byte 0x085925CA
	thumb_func_end PetalburgGymSpecial2

	thumb_func_start ShowFieldMessageStringVar4
ShowFieldMessageStringVar4: @ 0x08138B30
	push {lr}
	ldr r0, _08138B3C
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_08138B3C: .4byte 0x02021C7C
	thumb_func_end ShowFieldMessageStringVar4

	thumb_func_start StorePlayerCoordsInVars
StorePlayerCoordsInVars: @ 0x08138B40
	ldr r1, _08138B54
	ldr r0, _08138B58
	ldr r2, [r0]
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _08138B5C
	ldrh r0, [r2, #2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08138B54: .4byte 0x02037280
_08138B58: .4byte 0x03005AEC
_08138B5C: .4byte 0x02037282
	thumb_func_end StorePlayerCoordsInVars

	thumb_func_start GetPlayerTrainerIdOnesDigit
GetPlayerTrainerIdOnesDigit: @ 0x08138B60
	push {lr}
	ldr r0, _08138B7C
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	lsls r1, r1, #8
	ldrb r0, [r0, #0xa]
	orrs r0, r1
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08138B7C: .4byte 0x03005AF0
	thumb_func_end GetPlayerTrainerIdOnesDigit

	thumb_func_start GetPlayerBigGuyGirlString
GetPlayerBigGuyGirlString: @ 0x08138B80
	push {lr}
	ldr r0, _08138B98
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08138BA4
	ldr r0, _08138B9C
	ldr r1, _08138BA0
	bl StringCopy
	b _08138BAC
	.align 2, 0
_08138B98: .4byte 0x03005AF0
_08138B9C: .4byte 0x02021C40
_08138BA0: .4byte 0x085CB02A
_08138BA4:
	ldr r0, _08138BB0
	ldr r1, _08138BB4
	bl StringCopy
_08138BAC:
	pop {r0}
	bx r0
	.align 2, 0
_08138BB0: .4byte 0x02021C40
_08138BB4: .4byte 0x085CB031
	thumb_func_end GetPlayerBigGuyGirlString

	thumb_func_start GetRivalSonDaughterString
GetRivalSonDaughterString: @ 0x08138BB8
	push {lr}
	ldr r0, _08138BD0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08138BDC
	ldr r0, _08138BD4
	ldr r1, _08138BD8
	bl StringCopy
	b _08138BE4
	.align 2, 0
_08138BD0: .4byte 0x03005AF0
_08138BD4: .4byte 0x02021C40
_08138BD8: .4byte 0x085CB03C
_08138BDC:
	ldr r0, _08138BE8
	ldr r1, _08138BEC
	bl StringCopy
_08138BE4:
	pop {r0}
	bx r0
	.align 2, 0
_08138BE8: .4byte 0x02021C40
_08138BEC: .4byte 0x085CB038
	thumb_func_end GetRivalSonDaughterString

	thumb_func_start GetBattleOutcome
GetBattleOutcome: @ 0x08138BF0
	ldr r0, _08138BF8
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08138BF8: .4byte 0x02023FDE
	thumb_func_end GetBattleOutcome

	thumb_func_start CableCarWarp
CableCarWarp: @ 0x08138BFC
	push {lr}
	sub sp, #4
	ldr r0, _08138C1C
	ldrh r0, [r0]
	cmp r0, #0
	beq _08138C20
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0
	movs r3, #6
	bl SetWarpDestination
	b _08138C32
	.align 2, 0
_08138C1C: .4byte 0x02037280
_08138C20:
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0x13
	movs r1, #1
	movs r3, #6
	bl SetWarpDestination
_08138C32:
	add sp, #4
	pop {r0}
	bx r0
	thumb_func_end CableCarWarp

	thumb_func_start SetFlagInVar
SetFlagInVar: @ 0x08138C38
	push {lr}
	ldr r0, _08138C48
	ldrh r0, [r0]
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08138C48: .4byte 0x02037280
	thumb_func_end SetFlagInVar

	thumb_func_start GetWeekCount
GetWeekCount: @ 0x08138C4C
	push {lr}
	ldr r0, _08138C6C
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #7
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08138C70
	cmp r0, r1
	bls _08138C66
	adds r0, r1, #0
_08138C66:
	pop {r1}
	bx r1
	.align 2, 0
_08138C6C: .4byte 0x03005A50
_08138C70: .4byte 0x0000270F
	thumb_func_end GetWeekCount

	thumb_func_start GetLeadMonFriendshipScore
GetLeadMonFriendshipScore: @ 0x08138C74
	push {r4, lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r1, r0, r1
	ldr r0, _08138C98
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	cmp r0, #0xff
	bne _08138C9C
	movs r0, #6
	b _08138CEE
	.align 2, 0
_08138C98: .4byte 0x02024190
_08138C9C:
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	cmp r0, #0xc7
	bls _08138CAC
	movs r0, #5
	b _08138CEE
_08138CAC:
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	cmp r0, #0x95
	bls _08138CBC
	movs r0, #4
	b _08138CEE
_08138CBC:
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	cmp r0, #0x63
	bls _08138CCC
	movs r0, #3
	b _08138CEE
_08138CCC:
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	cmp r0, #0x31
	bls _08138CDC
	movs r0, #2
	b _08138CEE
_08138CDC:
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	cmp r0, #0
	bne _08138CEC
	movs r0, #0
	b _08138CEE
_08138CEC:
	movs r0, #1
_08138CEE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonFriendshipScore

	thumb_func_start CB2_FieldShowRegionMap
CB2_FieldShowRegionMap: @ 0x08138CF4
	push {lr}
	ldr r0, _08138D00
	bl FieldInitRegionMap
	pop {r0}
	bx r0
	.align 2, 0
_08138D00: .4byte 0x08085B35
	thumb_func_end CB2_FieldShowRegionMap

	thumb_func_start FieldShowRegionMap
FieldShowRegionMap: @ 0x08138D04
	push {lr}
	ldr r0, _08138D10
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08138D10: .4byte 0x08138CF5
	thumb_func_end FieldShowRegionMap

	thumb_func_start DoLotteryCornerComputerEffect
DoLotteryCornerComputerEffect: @ 0x08138D14
	push {r4, lr}
	ldr r4, _08138D50
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08138D48
	adds r0, r4, #0
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08138D54
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #8]
	strh r0, [r1, #0xa]
	strh r2, [r1, #0xc]
	strh r2, [r1, #0xe]
	strh r2, [r1, #0x10]
_08138D48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08138D50: .4byte 0x08138D59
_08138D54: .4byte 0x03005B60
	thumb_func_end DoLotteryCornerComputerEffect

	thumb_func_start Task_PCTurnOnEffect
Task_PCTurnOnEffect: @ 0x08138D58
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08138D7C
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08138D76
	adds r0, r1, #0
	bl PCTurnOnEffect_0
_08138D76:
	pop {r0}
	bx r0
	.align 2, 0
_08138D7C: .4byte 0x03005B60
	thumb_func_end Task_PCTurnOnEffect

	thumb_func_start PCTurnOnEffect_0
PCTurnOnEffect_0: @ 0x08138D80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bne _08138DEC
	strh r5, [r4, #0xe]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #3
	beq _08138DB4
	cmp r0, #3
	bgt _08138DAA
	cmp r0, #2
	beq _08138DB0
	b _08138DBC
_08138DAA:
	cmp r1, #4
	beq _08138DB8
	b _08138DBC
_08138DB0:
	movs r6, #0
	b _08138DBA
_08138DB4:
	movs r6, #0xff
	b _08138DBA
_08138DB8:
	movs r6, #1
_08138DBA:
	movs r5, #0xff
_08138DBC:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	bl PCTurnOnEffect_1
	bl DrawWholeMapView
	ldrh r0, [r4, #0x10]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08138DEC
	ldrb r0, [r4, #0xa]
	bl DestroyTask
_08138DEC:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end PCTurnOnEffect_0

	thumb_func_start PCTurnOnEffect_1
PCTurnOnEffect_1: @ 0x08138DF8
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r3, #0
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08138E34
	ldr r0, _08138E18
	ldrh r0, [r0]
	cmp r0, #0
	bne _08138E1C
	movs r3, #4
	b _08138E56
	.align 2, 0
_08138E18: .4byte 0x02037280
_08138E1C:
	cmp r0, #1
	bne _08138E28
	ldr r3, _08138E24
	b _08138E56
	.align 2, 0
_08138E24: .4byte 0x0000025A
_08138E28:
	cmp r0, #2
	bne _08138E56
	ldr r3, _08138E30
	b _08138E56
	.align 2, 0
_08138E30: .4byte 0x00000259
_08138E34:
	ldr r0, _08138E40
	ldrh r0, [r0]
	cmp r0, #0
	bne _08138E44
	movs r3, #5
	b _08138E56
	.align 2, 0
_08138E40: .4byte 0x02037280
_08138E44:
	cmp r0, #1
	bne _08138E50
	ldr r3, _08138E4C
	b _08138E56
	.align 2, 0
_08138E4C: .4byte 0x0000027F
_08138E50:
	cmp r0, #2
	bne _08138E56
	ldr r3, _08138E88
_08138E56:
	ldr r0, _08138E8C
	ldr r2, [r0]
	movs r5, #0
	ldrsh r0, [r2, r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	adds r0, #7
	movs r5, #2
	ldrsh r1, [r2, r5]
	lsls r2, r4, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	adds r1, #7
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r3, r2
	adds r2, r3, #0
	bl MapGridSetMetatileIdAt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08138E88: .4byte 0x0000027E
_08138E8C: .4byte 0x03005AEC
	thumb_func_end PCTurnOnEffect_1

	thumb_func_start DoPCTurnOffEffect
DoPCTurnOffEffect: @ 0x08138E90
	push {lr}
	bl PCTurnOffEffect
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DoPCTurnOffEffect

	thumb_func_start PCTurnOffEffect
PCTurnOffEffect: @ 0x08138E9C
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0
	movs r4, #0
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #3
	beq _08138EC6
	cmp r0, #3
	bgt _08138EBC
	cmp r0, #2
	beq _08138EC2
	b _08138ECE
_08138EBC:
	cmp r1, #4
	beq _08138ECA
	b _08138ECE
_08138EC2:
	movs r6, #0
	b _08138ECC
_08138EC6:
	movs r6, #0xff
	b _08138ECC
_08138ECA:
	movs r6, #1
_08138ECC:
	movs r5, #0xff
_08138ECE:
	ldr r0, _08138EDC
	ldrh r0, [r0]
	cmp r0, #0
	bne _08138EE0
	movs r4, #4
	b _08138EF2
	.align 2, 0
_08138EDC: .4byte 0x02037280
_08138EE0:
	cmp r0, #1
	bne _08138EEC
	ldr r4, _08138EE8
	b _08138EF2
	.align 2, 0
_08138EE8: .4byte 0x0000025A
_08138EEC:
	cmp r0, #2
	bne _08138EF2
	ldr r4, _08138F28
_08138EF2:
	ldr r0, _08138F2C
	ldr r2, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	adds r0, #7
	movs r3, #2
	ldrsh r1, [r2, r3]
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	adds r1, #7
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r4, r2
	adds r2, r4, #0
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08138F28: .4byte 0x00000259
_08138F2C: .4byte 0x03005AEC
	thumb_func_end PCTurnOffEffect

	thumb_func_start DoPCTurnOnEffect
DoPCTurnOnEffect: @ 0x08138F30
	push {r4, lr}
	ldr r4, _08138F6C
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08138F64
	adds r0, r4, #0
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08138F70
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #8]
	strh r0, [r1, #0xa]
	strh r2, [r1, #0xc]
	strh r2, [r1, #0xe]
	strh r2, [r1, #0x10]
_08138F64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08138F6C: .4byte 0x08138F75
_08138F70: .4byte 0x03005B60
	thumb_func_end DoPCTurnOnEffect

	thumb_func_start Task_LotteryCornerComputerEffect
Task_LotteryCornerComputerEffect: @ 0x08138F74
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08138F98
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08138F92
	adds r0, r1, #0
	bl LotteryCornerComputerEffect
_08138F92:
	pop {r0}
	bx r0
	.align 2, 0
_08138F98: .4byte 0x03005B60
	thumb_func_end Task_LotteryCornerComputerEffect

	thumb_func_start LotteryCornerComputerEffect
LotteryCornerComputerEffect: @ 0x08138F9C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bne _0813900A
	movs r0, #0
	strh r0, [r4, #0xe]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08138FD4
	ldr r2, _08138FCC
	movs r0, #0x12
	movs r1, #8
	bl MapGridSetMetatileIdAt
	ldr r2, _08138FD0
	movs r0, #0x12
	movs r1, #9
	bl MapGridSetMetatileIdAt
	b _08138FEA
	.align 2, 0
_08138FCC: .4byte 0x00000E9D
_08138FD0: .4byte 0x00000EA5
_08138FD4:
	ldr r2, _08139018
	movs r0, #0x12
	movs r1, #8
	bl MapGridSetMetatileIdAt
	movs r2, #0xe6
	lsls r2, r2, #4
	movs r0, #0x12
	movs r1, #9
	bl MapGridSetMetatileIdAt
_08138FEA:
	bl DrawWholeMapView
	ldrh r0, [r4, #0x10]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0813900A
	ldrb r0, [r4, #0xa]
	bl DestroyTask
_0813900A:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139018: .4byte 0x00000E58
	thumb_func_end LotteryCornerComputerEffect

	thumb_func_start EndLotteryCornerComputerEffect
EndLotteryCornerComputerEffect: @ 0x0813901C
	push {lr}
	ldr r2, _0813903C
	movs r0, #0x12
	movs r1, #8
	bl MapGridSetMetatileIdAt
	ldr r2, _08139040
	movs r0, #0x12
	movs r1, #9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_0813903C: .4byte 0x00000E9D
_08139040: .4byte 0x00000EA5
	thumb_func_end EndLotteryCornerComputerEffect

	thumb_func_start ResetTrickHouseEndRoomFlag
ResetTrickHouseEndRoomFlag: @ 0x08139044
	push {lr}
	ldr r1, _08139054
	ldr r0, _08139058
	strh r0, [r1]
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08139054: .4byte 0x02037280
_08139058: .4byte 0x000001F5
	thumb_func_end ResetTrickHouseEndRoomFlag

	thumb_func_start SetTrickHouseEndRoomFlag
SetTrickHouseEndRoomFlag: @ 0x0813905C
	push {lr}
	ldr r1, _0813906C
	ldr r0, _08139070
	strh r0, [r1]
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0813906C: .4byte 0x02037280
_08139070: .4byte 0x000001F5
	thumb_func_end SetTrickHouseEndRoomFlag

	thumb_func_start CheckLeadMonCool
CheckLeadMonCool: @ 0x08139074
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _08139094
	adds r0, r0, r1
	movs r1, #0x16
	bl GetMonData
	cmp r0, #0xc7
	bls _08139098
	movs r0, #1
	b _0813909A
	.align 2, 0
_08139094: .4byte 0x02024190
_08139098:
	movs r0, #0
_0813909A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckLeadMonCool

	thumb_func_start CheckLeadMonBeauty
CheckLeadMonBeauty: @ 0x081390A0
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _081390C0
	adds r0, r0, r1
	movs r1, #0x17
	bl GetMonData
	cmp r0, #0xc7
	bls _081390C4
	movs r0, #1
	b _081390C6
	.align 2, 0
_081390C0: .4byte 0x02024190
_081390C4:
	movs r0, #0
_081390C6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckLeadMonBeauty

	thumb_func_start CheckLeadMonCute
CheckLeadMonCute: @ 0x081390CC
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _081390EC
	adds r0, r0, r1
	movs r1, #0x18
	bl GetMonData
	cmp r0, #0xc7
	bls _081390F0
	movs r0, #1
	b _081390F2
	.align 2, 0
_081390EC: .4byte 0x02024190
_081390F0:
	movs r0, #0
_081390F2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckLeadMonCute

	thumb_func_start CheckLeadMonSmart
CheckLeadMonSmart: @ 0x081390F8
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _08139118
	adds r0, r0, r1
	movs r1, #0x21
	bl GetMonData
	cmp r0, #0xc7
	bls _0813911C
	movs r0, #1
	b _0813911E
	.align 2, 0
_08139118: .4byte 0x02024190
_0813911C:
	movs r0, #0
_0813911E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckLeadMonSmart

	thumb_func_start CheckLeadMonTough
CheckLeadMonTough: @ 0x08139124
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _08139144
	adds r0, r0, r1
	movs r1, #0x2f
	bl GetMonData
	cmp r0, #0xc7
	bls _08139148
	movs r0, #1
	b _0813914A
	.align 2, 0
_08139144: .4byte 0x02024190
_08139148:
	movs r0, #0
_0813914A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckLeadMonTough

	thumb_func_start IsGrassTypeInParty
IsGrassTypeInParty: @ 0x08139150
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _081391A0
_08139156:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081391A4
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _081391AC
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081391AC
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #6]
	cmp r0, #0xc
	beq _08139198
	ldrb r0, [r1, #7]
	cmp r0, #0xc
	bne _081391AC
_08139198:
	ldr r1, _081391A8
	movs r0, #1
	b _081391BA
	.align 2, 0
_081391A0: .4byte 0x082F0D54
_081391A4: .4byte 0x02024190
_081391A8: .4byte 0x02037290
_081391AC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08139156
	ldr r1, _081391C4
	movs r0, #0
_081391BA:
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081391C4: .4byte 0x02037290
	thumb_func_end IsGrassTypeInParty

	thumb_func_start SpawnCameraObject
SpawnCameraObject: @ 0x081391C8
	push {lr}
	sub sp, #8
	ldr r0, _08139214
	ldr r0, [r0]
	ldrh r3, [r0]
	adds r3, #7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldrh r0, [r0, #2]
	adds r0, #7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #7
	movs r1, #8
	movs r2, #0x7f
	bl SpawnSpecialEventObjectParameterized
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08139218
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1, #1]
	ldrb r0, [r1, #4]
	bl CameraObjectSetFollowedObjectId
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08139214: .4byte 0x03005AEC
_08139218: .4byte 0x02036FF0
	thumb_func_end SpawnCameraObject

	thumb_func_start RemoveCameraObject
RemoveCameraObject: @ 0x0813921C
	push {lr}
	bl GetPlayerAvatarObjectId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl CameraObjectSetFollowedObjectId
	ldr r0, _0813923C
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r0, #0x7f
	bl RemoveEventObjectByLocalIdAndMap
	pop {r0}
	bx r0
	.align 2, 0
_0813923C: .4byte 0x03005AEC
	thumb_func_end RemoveCameraObject

	thumb_func_start GetPokeblockNameByMonNature
GetPokeblockNameByMonNature: @ 0x08139240
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _08139268
	adds r0, r0, r1
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0813926C
	bl sub_081370D8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08139268: .4byte 0x02024190
_0813926C: .4byte 0x02021C40
	thumb_func_end GetPokeblockNameByMonNature

	thumb_func_start GetSecretBaseNearbyMapName
GetSecretBaseNearbyMapName: @ 0x08139270
	push {r4, lr}
	ldr r4, _08139290
	ldr r0, _08139294
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl GetMapName
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139290: .4byte 0x02021C40
_08139294: .4byte 0x00004026
	thumb_func_end GetSecretBaseNearbyMapName

	thumb_func_start GetBestBattleTowerStreak
GetBestBattleTowerStreak: @ 0x08139298
	push {lr}
	movs r0, #0x20
	bl GetGameStat
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end GetBestBattleTowerStreak

	thumb_func_start BufferEReaderTrainerName
BufferEReaderTrainerName: @ 0x081392A8
	push {lr}
	ldr r0, _081392B4
	bl GetEreaderTrainerName
	pop {r0}
	bx r0
	.align 2, 0
_081392B4: .4byte 0x02021C40
	thumb_func_end BufferEReaderTrainerName

	thumb_func_start GetSlotMachineId
GetSlotMachineId: @ 0x081392B8
	push {r4, r5, lr}
	ldr r0, _081392EC
	ldr r2, [r0]
	ldr r1, _081392F0
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x19
	ldr r0, _081392F4
	adds r2, r2, r0
	lsrs r1, r1, #0x19
	ldrh r2, [r2]
	adds r1, r1, r2
	ldr r2, _081392F8
	ldr r0, _081392FC
	ldrh r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r5, r1, r0
	movs r0, #2
	bl GetPriceReduction
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08139304
	ldr r4, _08139300
	b _08139306
	.align 2, 0
_081392EC: .4byte 0x03005AEC
_081392F0: .4byte 0x00002E68
_081392F4: .4byte 0x00002E6A
_081392F8: .4byte 0x085925D4
_081392FC: .4byte 0x02037280
_08139300: .4byte 0x085925E0
_08139304:
	ldr r4, _08139318
_08139306:
	adds r0, r5, #0
	movs r1, #0xc
	bl __umodsi3
	adds r0, r0, r4
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08139318: .4byte 0x085925EC
	thumb_func_end GetSlotMachineId

	thumb_func_start FoundAbandonedShipRoom1Key
FoundAbandonedShipRoom1Key: @ 0x0813931C
	push {lr}
	ldr r1, _08139334
	ldr r0, _08139338
	strh r0, [r1]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813933C
	movs r0, #1
	b _0813933E
	.align 2, 0
_08139334: .4byte 0x02037280
_08139338: .4byte 0x00000213
_0813933C:
	movs r0, #0
_0813933E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FoundAbandonedShipRoom1Key

	thumb_func_start FoundAbandonedShipRoom2Key
FoundAbandonedShipRoom2Key: @ 0x08139344
	push {lr}
	ldr r1, _0813935C
	movs r0, #0x85
	lsls r0, r0, #2
	strh r0, [r1]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08139360
	movs r0, #1
	b _08139362
	.align 2, 0
_0813935C: .4byte 0x02037280
_08139360:
	movs r0, #0
_08139362:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FoundAbandonedShipRoom2Key

	thumb_func_start FoundAbandonedShipRoom4Key
FoundAbandonedShipRoom4Key: @ 0x08139368
	push {lr}
	ldr r1, _08139380
	ldr r0, _08139384
	strh r0, [r1]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08139388
	movs r0, #1
	b _0813938A
	.align 2, 0
_08139380: .4byte 0x02037280
_08139384: .4byte 0x00000215
_08139388:
	movs r0, #0
_0813938A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FoundAbandonedShipRoom4Key

	thumb_func_start FoundAbandonedShipRoom6Key
FoundAbandonedShipRoom6Key: @ 0x08139390
	push {lr}
	ldr r1, _081393A8
	ldr r0, _081393AC
	strh r0, [r1]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081393B0
	movs r0, #1
	b _081393B2
	.align 2, 0
_081393A8: .4byte 0x02037280
_081393AC: .4byte 0x00000216
_081393B0:
	movs r0, #0
_081393B2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FoundAbandonedShipRoom6Key

	thumb_func_start LeadMonHasEffortRibbon
LeadMonHasEffortRibbon: @ 0x081393B8
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _081393DC
	adds r0, r0, r1
	movs r1, #0x47
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081393DC: .4byte 0x02024190
	thumb_func_end LeadMonHasEffortRibbon

	thumb_func_start GiveLeadMonEffortRibbon
GiveLeadMonEffortRibbon: @ 0x081393E0
	push {r4, lr}
	sub sp, #4
	movs r0, #0x2a
	bl IncrementGameStat
	ldr r0, _08139430
	bl FlagSet
	movs r1, #1
	mov r0, sp
	strb r1, [r0]
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r1, r0, r1
	ldr r0, _08139434
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x47
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	bl GetRibbonCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08139426
	adds r0, r4, #0
	movs r1, #0x47
	bl sub_080EEFFC
_08139426:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139430: .4byte 0x0000089B
_08139434: .4byte 0x02024190
	thumb_func_end GiveLeadMonEffortRibbon

	thumb_func_start Special_AreLeadMonEVsMaxedOut
Special_AreLeadMonEVsMaxedOut: @ 0x08139438
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0813945C
	adds r0, r0, r1
	bl GetMonEVCount
	lsls r0, r0, #0x10
	ldr r1, _08139460
	cmp r0, r1
	bhi _08139464
	movs r0, #0
	b _08139466
	.align 2, 0
_0813945C: .4byte 0x02024190
_08139460: .4byte 0x01FD0000
_08139464:
	movs r0, #1
_08139466:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Special_AreLeadMonEVsMaxedOut

	thumb_func_start TryUpdateRusturfTunnelState
TryUpdateRusturfTunnelState: @ 0x0813946C
	push {lr}
	movs r0, #0xc7
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081394C4
	ldr r0, _0813949C
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x83
	lsls r0, r0, #3
	cmp r1, r0
	bne _081394C4
	subs r0, #0x75
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081394A4
	ldr r0, _081394A0
	movs r1, #4
	b _081394B6
	.align 2, 0
_0813949C: .4byte 0x03005AEC
_081394A0: .4byte 0x0000409A
_081394A4:
	movs r0, #0xe9
	lsls r0, r0, #2
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081394C4
	ldr r0, _081394C0
	movs r1, #5
_081394B6:
	bl VarSet
	movs r0, #1
	b _081394C6
	.align 2, 0
_081394C0: .4byte 0x0000409A
_081394C4:
	movs r0, #0
_081394C6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryUpdateRusturfTunnelState

	thumb_func_start SetShoalItemFlag
SetShoalItemFlag: @ 0x081394CC
	push {lr}
	ldr r0, _081394D8
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_081394D8: .4byte 0x000008BF
	thumb_func_end SetShoalItemFlag

	thumb_func_start PutZigzagoonInPlayerParty
PutZigzagoonInPlayerParty: @ 0x081394DC
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _08139544
	movs r1, #0x90
	lsls r1, r1, #1
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #7
	movs r3, #0x20
	bl CreateMon
	movs r1, #1
	add r0, sp, #0x10
	strh r1, [r0]
	adds r0, r5, #0
	movs r1, #0x2e
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	movs r0, #0x21
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xd
	add r2, sp, #0x10
	bl SetMonData
	add r0, sp, #0x10
	strh r4, [r0]
	adds r0, r5, #0
	movs r1, #0xe
	add r2, sp, #0x10
	bl SetMonData
	adds r0, r5, #0
	movs r1, #0xf
	add r2, sp, #0x10
	bl SetMonData
	adds r0, r5, #0
	movs r1, #0x10
	add r2, sp, #0x10
	bl SetMonData
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139544: .4byte 0x02024190
	thumb_func_end PutZigzagoonInPlayerParty

	thumb_func_start IsStarterInParty
IsStarterInParty: @ 0x08139548
	push {r4, r5, r6, lr}
	ldr r0, _08139584
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetStarterPokemon
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _08139596
_0813956A:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _08139588
	adds r0, r0, r1
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	cmp r0, r6
	bne _0813958C
	movs r0, #1
	b _08139598
	.align 2, 0
_08139584: .4byte 0x00004023
_08139588: .4byte 0x02024190
_0813958C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _0813956A
_08139596:
	movs r0, #0
_08139598:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsStarterInParty

	thumb_func_start ScriptCheckFreePokemonStorageSpace
ScriptCheckFreePokemonStorageSpace: @ 0x081395A0
	push {lr}
	bl CheckFreePokemonStorageSpace
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScriptCheckFreePokemonStorageSpace

	thumb_func_start IsPokerusInParty
IsPokerusInParty: @ 0x081395B0
	push {lr}
	ldr r0, _081395C4
	movs r1, #0x3f
	bl CheckPartyPokerus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081395C8
	movs r0, #1
	b _081395CA
	.align 2, 0
_081395C4: .4byte 0x02024190
_081395C8:
	movs r0, #0
_081395CA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPokerusInParty

	thumb_func_start sub_081395D0
sub_081395D0: @ 0x081395D0
	push {lr}
	ldr r0, _08139614
	movs r1, #9
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08139618
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _0813961C
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	ldr r0, _08139620
	ldrh r0, [r0]
	strh r0, [r1, #0xc]
	ldr r0, _08139624
	ldrh r0, [r0]
	strh r0, [r1, #0xe]
	ldr r0, _08139628
	ldrh r0, [r0]
	strh r0, [r1, #0x10]
	movs r0, #0
	bl SetCameraPanningCallback
	movs r0, #0xd6
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_08139614: .4byte 0x0813962D
_08139618: .4byte 0x03005B60
_0813961C: .4byte 0x02037282
_08139620: .4byte 0x02037284
_08139624: .4byte 0x02037286
_08139628: .4byte 0x02037280
	thumb_func_end sub_081395D0

	thumb_func_start sub_0813962C
sub_0813962C: @ 0x0813962C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0813968C
	adds r4, r0, r1
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r2, #6
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, #0
	bne _08139684
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4]
	rsbs r0, r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #8]
	rsbs r0, r0, #0
	strh r0, [r4, #8]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #8
	ldrsh r1, [r4, r2]
	bl SetCameraPanning
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08139684
	adds r0, r5, #0
	bl sub_08139690
	bl InstallCameraPanAheadCallback
_08139684:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813968C: .4byte 0x03005B68
	thumb_func_end sub_0813962C

	thumb_func_start sub_08139690
sub_08139690: @ 0x08139690
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08139690

	thumb_func_start FoundBlackGlasses
FoundBlackGlasses: @ 0x081396A4
	push {lr}
	movs r0, #0x95
	lsls r0, r0, #2
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FoundBlackGlasses

	thumb_func_start SetRoute119Weather
SetRoute119Weather: @ 0x081396B8
	push {lr}
	bl GetLastUsedWarpMapType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsMapTypeOutdoors
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081396D4
	movs r0, #0x14
	bl SetSav1Weather
_081396D4:
	pop {r0}
	bx r0
	thumb_func_end SetRoute119Weather

	thumb_func_start SetRoute123Weather
SetRoute123Weather: @ 0x081396D8
	push {lr}
	bl GetLastUsedWarpMapType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsMapTypeOutdoors
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081396F4
	movs r0, #0x15
	bl SetSav1Weather
_081396F4:
	pop {r0}
	bx r0
	thumb_func_end SetRoute123Weather

	thumb_func_start GetLeadMonIndex
GetLeadMonIndex: @ 0x081396F8
	push {r4, r5, r6, lr}
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	cmp r5, r6
	bhs _08139746
_08139708:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08139738
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _0813973C
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0813973C
	adds r0, r5, #0
	b _08139748
	.align 2, 0
_08139738: .4byte 0x02024190
_0813973C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r6
	blo _08139708
_08139746:
	movs r0, #0
_08139748:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetLeadMonIndex

	thumb_func_start ScriptGetPartyMonSpecies
ScriptGetPartyMonSpecies: @ 0x08139750
	push {lr}
	ldr r0, _08139770
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08139774
	adds r0, r0, r1
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08139770: .4byte 0x02037280
_08139774: .4byte 0x02024190
	thumb_func_end ScriptGetPartyMonSpecies

	thumb_func_start nullsub_54
nullsub_54: @ 0x08139778
	bx lr
	.align 2, 0
	thumb_func_end nullsub_54

	thumb_func_start GetDaysUntilPacifidlogTMAvailable
GetDaysUntilPacifidlogTMAvailable: @ 0x0813977C
	push {r4, lr}
	ldr r0, _0813979C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	ldr r2, _081397A0
	movs r1, #0
	ldrsh r0, [r2, r1]
	subs r0, r0, r3
	cmp r0, #6
	ble _081397A4
	movs r0, #0
	b _081397BC
	.align 2, 0
_0813979C: .4byte 0x000040C2
_081397A0: .4byte 0x03005A50
_081397A4:
	ldrh r1, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	blt _081397BA
	subs r1, r1, r3
	movs r0, #7
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _081397BC
_081397BA:
	movs r0, #8
_081397BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetDaysUntilPacifidlogTMAvailable

	thumb_func_start SetPacifidlogTMReceivedDay
SetPacifidlogTMReceivedDay: @ 0x081397C4
	push {r4, lr}
	ldr r0, _081397D8
	ldr r4, _081397DC
	ldrh r1, [r4]
	bl VarSet
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081397D8: .4byte 0x000040C2
_081397DC: .4byte 0x03005A50
	thumb_func_end SetPacifidlogTMReceivedDay

	thumb_func_start MonOTNameMatchesPlayer
MonOTNameMatchesPlayer: @ 0x081397E0
	push {r4, lr}
	ldr r0, _0813980C
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08139810
	adds r0, r0, r1
	ldr r4, _08139814
	movs r1, #7
	adds r2, r4, #0
	bl GetMonData
	ldr r0, _08139818
	ldr r0, [r0]
	adds r1, r4, #0
	bl StringCompare
	cmp r0, #0
	beq _0813981C
	movs r0, #1
	b _0813981E
	.align 2, 0
_0813980C: .4byte 0x02037280
_08139810: .4byte 0x02024190
_08139814: .4byte 0x02021C40
_08139818: .4byte 0x03005AF0
_0813981C:
	movs r0, #0
_0813981E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MonOTNameMatchesPlayer

	thumb_func_start BufferLottoTicketNumber
BufferLottoTicketNumber: @ 0x08139824
	push {r4, r5, lr}
	ldr r2, _08139838
	ldrh r1, [r2]
	ldr r0, _0813983C
	cmp r1, r0
	bls _08139840
	movs r0, #0
	bl TV_PrintIntToStringVar
	b _081398C2
	.align 2, 0
_08139838: .4byte 0x02037290
_0813983C: .4byte 0x0000270F
_08139840:
	ldr r0, _08139850
	cmp r1, r0
	bls _08139858
	ldr r4, _08139854
	movs r0, #0xa1
	strb r0, [r4]
	adds r4, #1
	b _0813987C
	.align 2, 0
_08139850: .4byte 0x000003E7
_08139854: .4byte 0x02021C40
_08139858:
	cmp r1, #0x63
	bls _0813986C
	ldr r4, _08139868
	movs r0, #0xa1
	strb r0, [r4]
	strb r0, [r4, #1]
	adds r4, #2
	b _0813987C
	.align 2, 0
_08139868: .4byte 0x02021C40
_0813986C:
	cmp r1, #9
	bls _0813989C
	ldr r4, _08139898
	movs r0, #0xa1
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	adds r4, #3
_0813987C:
	ldrh r5, [r2]
	adds r0, r5, #0
	bl CountDigits
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ConvertIntToDecimalStringN
	b _081398C2
	.align 2, 0
_08139898: .4byte 0x02021C40
_0813989C:
	ldr r4, _081398C8
	movs r0, #0xa1
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	adds r4, #4
	ldrh r5, [r2]
	adds r0, r5, #0
	bl CountDigits
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ConvertIntToDecimalStringN
_081398C2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081398C8: .4byte 0x02021C40
	thumb_func_end BufferLottoTicketNumber

	thumb_func_start sub_081398CC
sub_081398CC: @ 0x081398CC
	push {lr}
	ldr r0, _081398E0
	ldrh r0, [r0]
	cmp r0, #4
	bhi _08139918
	lsls r0, r0, #2
	ldr r1, _081398E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081398E0: .4byte 0x02037290
_081398E4: .4byte 0x081398E8
_081398E8: @ jump table
	.4byte _081398FC @ case 0
	.4byte _08139900 @ case 1
	.4byte _08139904 @ case 2
	.4byte _08139908 @ case 3
	.4byte _0813990C @ case 4
_081398FC:
	movs r0, #3
	b _0813990E
_08139900:
	movs r0, #4
	b _0813990E
_08139904:
	movs r0, #0
	b _0813990E
_08139908:
	movs r0, #1
	b _0813990E
_0813990C:
	movs r0, #2
_0813990E:
	bl mevent_081445C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08139926
_08139918:
	ldr r0, _0813992C
	ldr r1, _08139930
	ldr r2, _08139934
	movs r3, #1
	bl AGBAssert
	movs r0, #0
_08139926:
	pop {r1}
	bx r1
	.align 2, 0
_0813992C: .4byte 0x085925F8
_08139930: .4byte 0x00000B14
_08139934: .4byte 0x08592604
	thumb_func_end sub_081398CC

	thumb_func_start sub_08139938
sub_08139938: @ 0x08139938
	push {r4, lr}
	ldr r1, _08139950
	ldr r2, _08139954
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x39
	bls _08139958
	movs r0, #0
	b _08139972
	.align 2, 0
_08139950: .4byte 0x02037280
_08139954: .4byte 0xFFFFFEDF
_08139958:
	ldr r4, _08139978
	ldrh r0, [r1]
	bl ItemIdToBattleMoveId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xd
	ldr r0, _0813997C
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	movs r0, #1
_08139972:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08139978: .4byte 0x02021C54
_0813997C: .4byte 0x082EACC4
	thumb_func_end sub_08139938

	thumb_func_start sub_08139980
sub_08139980: @ 0x08139980
	push {r4, r5, lr}
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _081399B6
_08139990:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081399A8
	adds r0, r0, r1
	movs r1, #4
	bl GetMonData
	cmp r0, #1
	bne _081399AC
	movs r0, #1
	b _081399B8
	.align 2, 0
_081399A8: .4byte 0x02024190
_081399AC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08139990
_081399B6:
	movs r0, #0
_081399B8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08139980

	thumb_func_start InMultiBattleRoom
InMultiBattleRoom: @ 0x081399C0
	push {lr}
	ldr r0, _081399E0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _081399E4
	cmp r1, r0
	bne _081399EC
	ldr r0, _081399E8
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _081399EC
	movs r0, #1
	b _081399EE
	.align 2, 0
_081399E0: .4byte 0x03005AEC
_081399E4: .4byte 0x00000F1A
_081399E8: .4byte 0x000040CE
_081399EC:
	movs r0, #0
_081399EE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end InMultiBattleRoom

	thumb_func_start sub_081399F4
sub_081399F4: @ 0x081399F4
	push {lr}
	movs r0, #0
	bl SetCameraPanningCallback
	movs r0, #8
	movs r1, #0
	bl SetCameraPanning
	pop {r0}
	bx r0
	thumb_func_end sub_081399F4

	thumb_func_start SetDepartmentStoreFloorVar
SetDepartmentStoreFloorVar: @ 0x08139A08
	push {lr}
	ldr r0, _08139A24
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	subs r0, #0x10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	bhi _08139A58
	lsls r0, r0, #2
	ldr r1, _08139A28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08139A24: .4byte 0x03005AEC
_08139A28: .4byte 0x08139A2C
_08139A2C: @ jump table
	.4byte _08139A58 @ case 0
	.4byte _08139A44 @ case 1
	.4byte _08139A48 @ case 2
	.4byte _08139A4C @ case 3
	.4byte _08139A50 @ case 4
	.4byte _08139A54 @ case 5
_08139A44:
	movs r1, #5
	b _08139A5A
_08139A48:
	movs r1, #6
	b _08139A5A
_08139A4C:
	movs r1, #7
	b _08139A5A
_08139A50:
	movs r1, #8
	b _08139A5A
_08139A54:
	movs r1, #0xf
	b _08139A5A
_08139A58:
	movs r1, #4
_08139A5A:
	ldr r0, _08139A64
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08139A64: .4byte 0x00004043
	thumb_func_end SetDepartmentStoreFloorVar

	thumb_func_start sub_08139A68
sub_08139A68: @ 0x08139A68
	push {r4, lr}
	ldr r2, _08139A98
	movs r0, #0
	strh r0, [r2]
	ldr r1, _08139A9C
	strh r0, [r1]
	ldr r0, _08139AA0
	ldr r3, [r0]
	movs r0, #0x14
	ldrsb r0, [r3, r0]
	adds r4, r1, #0
	cmp r0, #0xd
	bne _08139AE2
	ldrb r0, [r3, #0x15]
	subs r0, #0x10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _08139AE2
	lsls r0, r0, #2
	ldr r1, _08139AA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08139A98: .4byte 0x0203A82C
_08139A9C: .4byte 0x0203A82E
_08139AA0: .4byte 0x03005AEC
_08139AA4: .4byte 0x08139AA8
_08139AA8: @ jump table
	.4byte _08139ADA @ case 0
	.4byte _08139AD2 @ case 1
	.4byte _08139ACA @ case 2
	.4byte _08139AC2 @ case 3
	.4byte _08139ABC @ case 4
_08139ABC:
	movs r0, #0
	strh r0, [r2]
	b _08139AE0
_08139AC2:
	movs r0, #0
	strh r0, [r2]
	movs r0, #1
	b _08139AE0
_08139ACA:
	movs r0, #0
	strh r0, [r2]
	movs r0, #2
	b _08139AE0
_08139AD2:
	movs r0, #0
	strh r0, [r2]
	movs r0, #3
	b _08139AE0
_08139ADA:
	movs r0, #0
	strh r0, [r2]
	movs r0, #4
_08139AE0:
	strh r0, [r4]
_08139AE2:
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08139A68

	thumb_func_start ShakeScreenInElevator
ShakeScreenInElevator: @ 0x08139AEC
	push {r4, r5, r6, lr}
	ldr r0, _08139B24
	movs r1, #9
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08139B28
	adds r4, r1, r0
	movs r3, #0
	strh r3, [r4, #2]
	strh r3, [r4, #4]
	movs r6, #1
	strh r6, [r4, #8]
	ldr r0, _08139B2C
	ldr r1, _08139B30
	ldrh r2, [r0]
	ldrh r0, [r1]
	cmp r2, r0
	bls _08139B34
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	strh r6, [r4, #0xc]
	b _08139B3C
	.align 2, 0
_08139B24: .4byte 0x08139B69
_08139B28: .4byte 0x03005B68
_08139B2C: .4byte 0x02037282
_08139B30: .4byte 0x02037284
_08139B34:
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	strh r3, [r4, #0xc]
_08139B3C:
	cmp r5, #8
	bls _08139B42
	movs r5, #8
_08139B42:
	ldr r0, _08139B64
	adds r0, r5, r0
	ldrb r0, [r0]
	strh r0, [r4, #0xa]
	movs r0, #0
	bl SetCameraPanningCallback
	ldrb r1, [r4, #0xc]
	adds r0, r5, #0
	bl sub_08139C68
	movs r0, #0x59
	bl PlaySE
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139B64: .4byte 0x08592674
	thumb_func_end ShakeScreenInElevator

	thumb_func_start sub_08139B68
sub_08139B68: @ 0x08139B68
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08139BD0
	adds r4, r0, r1
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _08139BC8
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4, #8]
	rsbs r0, r0, #0
	strh r0, [r4, #8]
	movs r2, #8
	ldrsh r1, [r4, r2]
	movs r0, #0
	bl SetCameraPanning
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08139BC8
	movs r0, #0x49
	bl PlaySE
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	bl InstallCameraPanAheadCallback
_08139BC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139BD0: .4byte 0x03005B68
	thumb_func_end sub_08139B68

	thumb_func_start sub_08139BD4
sub_08139BD4: @ 0x08139BD4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, _08139C38
	ldr r0, _08139C3C
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldrb r0, [r4]
	ldr r2, _08139C40
	movs r1, #2
	str r1, [sp]
	movs r6, #0xff
	str r6, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	ldr r2, _08139C44
	ldr r1, _08139C48
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	str r1, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	movs r3, #0x13
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139C38: .4byte 0x0203A82A
_08139C3C: .4byte 0x08592608
_08139C40: .4byte 0x085CB0BF
_08139C44: .4byte 0x08592610
_08139C48: .4byte 0x02037282
	thumb_func_end sub_08139BD4

	thumb_func_start sub_08139C4C
sub_08139C4C: @ 0x08139C4C
	push {r4, lr}
	ldr r4, _08139C64
	ldrb r0, [r4]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139C64: .4byte 0x0203A82A
	thumb_func_end sub_08139C4C

	thumb_func_start sub_08139C68
sub_08139C68: @ 0x08139C68
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r4, _08139CB0
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08139CA8
	adds r0, r4, #0
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08139CB4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	strh r5, [r1, #0xc]
	ldr r0, _08139CB8
	adds r0, r6, r0
	ldrb r0, [r0]
	strh r0, [r1, #0xe]
_08139CA8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139CB0: .4byte 0x08139CBD
_08139CB4: .4byte 0x03005B60
_08139CB8: .4byte 0x0859267D
	thumb_func_end sub_08139C68

	thumb_func_start MoveElevatorWindowLights
MoveElevatorWindowLights: @ 0x08139CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r0, r0, #2
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08139D44
	adds r6, r0, r1
	movs r2, #2
	ldrsh r0, [r6, r2]
	cmp r0, #6
	bne _08139DB8
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r1, #4
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08139D4C
	movs r1, #0
	ldr r2, _08139D48
	mov sl, r2
_08139CF6:
	movs r5, #0
	adds r7, r1, #7
	lsls r0, r1, #1
	adds r2, r1, #1
	mov r8, r2
	adds r0, r0, r1
	lsls r0, r0, #1
	mov sb, r0
_08139D06:
	adds r4, r5, #0
	adds r4, #8
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	add r0, sb
	add r0, sl
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r2, r1, #0
	orrs r2, r0
	adds r0, r4, #0
	adds r1, r7, #0
	bl MapGridSetMetatileIdAt
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08139D06
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _08139CF6
	b _08139D9E
	.align 2, 0
_08139D44: .4byte 0x03005B68
_08139D48: .4byte 0x08592650
_08139D4C:
	movs r1, #0
	ldr r0, _08139DD0
	mov sl, r0
_08139D52:
	movs r5, #0
	adds r7, r1, #7
	lsls r0, r1, #1
	adds r2, r1, #1
	mov r8, r2
	adds r0, r0, r1
	lsls r0, r0, #1
	mov sb, r0
_08139D62:
	adds r4, r5, #0
	adds r4, #8
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	add r0, sb
	add r0, sl
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r2, r1, #0
	orrs r2, r0
	adds r0, r4, #0
	adds r1, r7, #0
	bl MapGridSetMetatileIdAt
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08139D62
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _08139D52
_08139D9E:
	bl DrawWholeMapView
	movs r0, #0
	strh r0, [r6, #2]
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r2, #6
	ldrsh r0, [r6, r2]
	cmp r1, r0
	bne _08139DB8
	ldr r0, [sp]
	bl DestroyTask
_08139DB8:
	ldrh r0, [r6, #2]
	adds r0, #1
	strh r0, [r6, #2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139DD0: .4byte 0x08592662
	thumb_func_end MoveElevatorWindowLights

	thumb_func_start sub_08139DD4
sub_08139DD4: @ 0x08139DD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r6, _08139E7C
	ldrh r0, [r6]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _08139E80
	adds r0, r0, r4
	movs r1, #0x27
	bl GetMonData
	str r0, [sp]
	ldrh r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x28
	bl GetMonData
	str r0, [sp, #4]
	ldrh r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x29
	bl GetMonData
	str r0, [sp, #8]
	ldrh r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x2a
	bl GetMonData
	str r0, [sp, #0xc]
	ldrh r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x2b
	bl GetMonData
	str r0, [sp, #0x10]
	ldrh r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x2c
	bl GetMonData
	str r0, [sp, #0x14]
	ldr r1, _08139E84
	movs r0, #0
	strh r0, [r1]
	movs r4, #0
	adds r2, r1, #0
_08139E3C:
	lsls r0, r4, #2
	add r0, sp
	ldr r1, [r0]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _08139E3C
	ldr r2, _08139E88
	movs r0, #0
	strh r0, [r2]
	ldr r1, _08139E8C
	ldr r0, [sp]
	strh r0, [r1]
	movs r4, #1
	adds r6, r2, #0
	adds r7, r1, #0
_08139E64:
	ldrh r0, [r6]
	lsls r0, r0, #2
	mov r2, sp
	adds r1, r2, r0
	lsls r0, r4, #2
	adds r5, r2, r0
	ldr r1, [r1]
	ldr r0, [r5]
	cmp r1, r0
	bhs _08139E90
	strh r4, [r6]
	b _08139EA8
	.align 2, 0
_08139E7C: .4byte 0x02037280
_08139E80: .4byte 0x02024190
_08139E84: .4byte 0x02037282
_08139E88: .4byte 0x02037284
_08139E8C: .4byte 0x02037286
_08139E90:
	cmp r1, r0
	bne _08139EAA
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08139EAA
	strh r4, [r6]
	ldr r0, [r5]
_08139EA8:
	strh r0, [r7]
_08139EAA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _08139E64
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08139DD4

	thumb_func_start warp0_in_pokecenter
warp0_in_pokecenter: @ 0x08139EBC
	push {r4, lr}
	ldr r0, _08139EEC
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _08139EF0
	ldrh r0, [r2]
	ldr r1, _08139EF4
	cmp r0, r1
	beq _08139F02
	adds r4, r1, #0
	adds r1, r2, #0
_08139EE0:
	ldrh r0, [r2]
	cmp r0, r3
	bne _08139EF8
	movs r0, #1
	b _08139F04
	.align 2, 0
_08139EEC: .4byte 0x02031F7C
_08139EF0: .4byte 0x08592686
_08139EF4: .4byte 0x0000FFFF
_08139EF8:
	adds r1, #2
	adds r2, #2
	ldrh r0, [r1]
	cmp r0, r4
	bne _08139EE0
_08139F02:
	movs r0, #0
_08139F04:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end warp0_in_pokecenter

	thumb_func_start sub_08139F0C
sub_08139F0C: @ 0x08139F0C
	push {lr}
	ldr r0, _08139F20
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _08139F24
	cmp r1, r0
	beq _08139F28
	movs r0, #1
	b _08139F2A
	.align 2, 0
_08139F20: .4byte 0x03005AEC
_08139F24: .4byte 0x00003C1A
_08139F28:
	movs r0, #0
_08139F2A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08139F0C

	thumb_func_start UpdateFrontierManiac
UpdateFrontierManiac: @ 0x08139F30
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08139F58
	bl GetVarPointer
	adds r5, r0, #0
	ldrh r0, [r5]
	adds r4, r4, r0
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, #0xa
	bl __umodsi3
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139F58: .4byte 0x0000402F
	thumb_func_end UpdateFrontierManiac

	thumb_func_start sub_08139F5C
sub_08139F5C: @ 0x08139F5C
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r0, _08139F7C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #9
	bls _08139F70
	b _0813A076
_08139F70:
	lsls r0, r6, #2
	ldr r1, _08139F80
	adds r1, r0, r1
	ldr r1, [r1]
	adds r2, r0, #0
	mov pc, r1
	.align 2, 0
_08139F7C: .4byte 0x0000402F
_08139F80: .4byte 0x08139F84
_08139F84: @ jump table
	.4byte _08139FAC @ case 0
	.4byte _08139FAC @ case 1
	.4byte _08139FAC @ case 2
	.4byte _08139FAC @ case 3
	.4byte _08139FD0 @ case 4
	.4byte _08139FF0 @ case 5
	.4byte _0813A008 @ case 6
	.4byte _0813A020 @ case 7
	.4byte _0813A038 @ case 8
	.4byte _0813A050 @ case 9
_08139FAC:
	ldr r0, _08139FC8
	ldr r0, [r0]
	movs r3, #0xce
	lsls r3, r3, #4
	adds r1, r0, r3
	adds r3, r1, r2
	ldr r1, _08139FCC
	adds r0, r0, r1
	adds r1, r0, r2
	ldrh r0, [r3]
	ldrh r2, [r1]
	cmp r0, r2
	bhs _0813A064
	b _0813A074
	.align 2, 0
_08139FC8: .4byte 0x03005AF0
_08139FCC: .4byte 0x00000CE2
_08139FD0:
	ldr r0, _08139FE8
	ldr r0, [r0]
	ldr r3, _08139FEC
	adds r2, r0, r3
	adds r3, #2
_08139FDA:
	adds r1, r0, r3
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	bhs _0813A064
	b _0813A074
	.align 2, 0
_08139FE8: .4byte 0x03005AF0
_08139FEC: .4byte 0x00000D0C
_08139FF0:
	ldr r0, _08139FFC
	ldr r0, [r0]
	ldr r1, _0813A000
	adds r2, r0, r1
	ldr r3, _0813A004
	b _08139FDA
	.align 2, 0
_08139FFC: .4byte 0x03005AF0
_0813A000: .4byte 0x00000DE2
_0813A004: .4byte 0x00000DE4
_0813A008:
	ldr r0, _0813A014
	ldr r0, [r0]
	ldr r1, _0813A018
	adds r2, r0, r1
	ldr r3, _0813A01C
	b _08139FDA
	.align 2, 0
_0813A014: .4byte 0x03005AF0
_0813A018: .4byte 0x00000DC8
_0813A01C: .4byte 0x00000DCA
_0813A020:
	ldr r0, _0813A02C
	ldr r0, [r0]
	ldr r1, _0813A030
	adds r2, r0, r1
	ldr r3, _0813A034
	b _08139FDA
	.align 2, 0
_0813A02C: .4byte 0x03005AF0
_0813A030: .4byte 0x00000DDA
_0813A034: .4byte 0x00000DDC
_0813A038:
	ldr r0, _0813A044
	ldr r0, [r0]
	ldr r1, _0813A048
	adds r2, r0, r1
	ldr r3, _0813A04C
	b _08139FDA
	.align 2, 0
_0813A044: .4byte 0x03005AF0
_0813A048: .4byte 0x00000E04
_0813A04C: .4byte 0x00000E06
_0813A050:
	ldr r0, _0813A068
	ldr r0, [r0]
	ldr r1, _0813A06C
	adds r2, r0, r1
	ldr r3, _0813A070
	adds r1, r0, r3
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	blo _0813A074
_0813A064:
	adds r4, r0, #0
	b _0813A076
	.align 2, 0
_0813A068: .4byte 0x03005AF0
_0813A06C: .4byte 0x00000E1A
_0813A070: .4byte 0x00000E1C
_0813A074:
	ldrh r4, [r1]
_0813A076:
	movs r2, #0
	ldr r5, _0813A0B4
	lsls r0, r6, #1
	adds r1, r0, r5
	ldrb r1, [r1]
	adds r3, r0, #0
	ldr r7, _0813A0B8
	cmp r1, r4
	bhs _0813A09E
	adds r1, r3, #0
_0813A08A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bhi _0813A09E
	adds r0, r2, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, r4
	blo _0813A08A
_0813A09E:
	adds r0, r3, r6
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	bl ShowFieldMessage
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A0B4: .4byte 0x08592724
_0813A0B8: .4byte 0x085926AC
	thumb_func_end sub_08139F5C

	thumb_func_start sub_0813A0BC
sub_0813A0BC: @ 0x0813A0BC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0813A0F8
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0813A0FC
	ldr r0, [r0]
	ldr r1, _0813A100
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1e
	cmp r5, #2
	bne _0813A114
	movs r0, #0xa9
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813A114
	ldr r1, _0813A104
	movs r0, #5
	strh r0, [r1]
	ldr r1, _0813A108
	movs r0, #4
	strh r0, [r1]
	b _0813A14C
	.align 2, 0
_0813A0F8: .4byte 0x000040CE
_0813A0FC: .4byte 0x03005AF0
_0813A100: .4byte 0x00000CA9
_0813A104: .4byte 0x02037282
_0813A108: .4byte 0x02037284
_0813A10C:
	movs r0, #4
	strh r0, [r6]
	adds r0, r3, #5
	b _0813A14A
_0813A114:
	movs r3, #0
	ldr r6, _0813A154
	ldr r7, _0813A158
	lsls r1, r4, #1
	lsls r2, r5, #2
	ldr r4, _0813A15C
	ldr r0, _0813A160
	ldr r0, [r0]
	adds r1, r1, r2
	movs r2, #0xce
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r1, [r0]
_0813A130:
	lsls r0, r3, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, r1
	bhi _0813A10C
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bls _0813A130
	movs r0, #4
	strh r0, [r6]
	movs r0, #0xc
_0813A14A:
	strh r0, [r7]
_0813A14C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A154: .4byte 0x02037282
_0813A158: .4byte 0x02037284
_0813A15C: .4byte 0x08592738
_0813A160: .4byte 0x03005AF0
	thumb_func_end sub_0813A0BC

	thumb_func_start sub_0813A164
sub_0813A164: @ 0x0813A164
	push {r4, lr}
	ldr r0, _0813A194
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0813A198
	adds r3, r0, r1
	ldr r1, _0813A19C
	ldrh r0, [r1]
	strh r0, [r3, #0x1e]
	ldrh r0, [r1]
	cmp r0, #0xc
	bls _0813A18A
	b _0813A302
_0813A18A:
	lsls r0, r0, #2
	ldr r1, _0813A1A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813A194: .4byte 0x0813A319
_0813A198: .4byte 0x03005B60
_0813A19C: .4byte 0x02037280
_0813A1A0: .4byte 0x0813A1A4
_0813A1A4: @ jump table
	.4byte _0813A1D8 @ case 0
	.4byte _0813A1E6 @ case 1
	.4byte _0813A1FE @ case 2
	.4byte _0813A212 @ case 3
	.4byte _0813A22C @ case 4
	.4byte _0813A244 @ case 5
	.4byte _0813A25E @ case 6
	.4byte _0813A278 @ case 7
	.4byte _0813A296 @ case 8
	.4byte _0813A2B0 @ case 9
	.4byte _0813A2B0 @ case 10
	.4byte _0813A2CA @ case 11
	.4byte _0813A2E4 @ case 12
_0813A1D8:
	movs r1, #0
	movs r0, #1
	strh r0, [r3, #8]
	strh r0, [r3, #0xa]
	strh r0, [r3, #0xc]
	strh r0, [r3, #0xe]
	b _0813A2F8
_0813A1E6:
	movs r1, #0
	movs r0, #5
	strh r0, [r3, #8]
	movs r0, #8
	strh r0, [r3, #0xa]
	movs r0, #1
	strh r0, [r3, #0xc]
	strh r0, [r3, #0xe]
	movs r0, #9
	strh r0, [r3, #0x10]
	movs r0, #0xa
	b _0813A2FA
_0813A1FE:
	movs r2, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r1, #0xc
	strh r1, [r3, #0xa]
	movs r0, #1
	strh r0, [r3, #0xc]
	strh r0, [r3, #0xe]
	movs r0, #7
	b _0813A28C
_0813A212:
	movs r1, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r0, #0xb
	strh r0, [r3, #0xa]
	movs r0, #0xe
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xf
	strh r0, [r3, #0x10]
	movs r0, #0xc
	b _0813A2FA
_0813A22C:
	movs r1, #0
	movs r0, #6
	strh r0, [r3, #8]
	strh r0, [r3, #0xa]
	movs r0, #0xe
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xf
	strh r0, [r3, #0x10]
	movs r0, #0xc
	b _0813A2FA
_0813A244:
	movs r1, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r0, #7
	strh r0, [r3, #0xa]
	movs r0, #0xe
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xf
	strh r0, [r3, #0x10]
	movs r0, #0xc
	b _0813A2FA
_0813A25E:
	movs r1, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r0, #0xa
	strh r0, [r3, #0xa]
	movs r0, #0xe
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xf
	strh r0, [r3, #0x10]
	movs r0, #0xc
	b _0813A2FA
_0813A278:
	movs r2, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r1, #0xc
	strh r1, [r3, #0xa]
	movs r0, #0xf
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xe
_0813A28C:
	strh r0, [r3, #0x10]
	strh r1, [r3, #0x12]
	strh r2, [r3, #0x14]
	strh r4, [r3, #0x26]
	b _0813A30E
_0813A296:
	movs r1, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r0, #0xa
	strh r0, [r3, #0xa]
	movs r0, #0x11
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xb
	strh r0, [r3, #0x10]
	movs r0, #0xc
	b _0813A2FA
_0813A2B0:
	movs r1, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r0, #0xb
	strh r0, [r3, #0xa]
	movs r0, #0xf
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xe
	strh r0, [r3, #0x10]
	movs r0, #0xc
	b _0813A2FA
_0813A2CA:
	movs r1, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r0, #7
	strh r0, [r3, #0xa]
	movs r0, #0x13
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xa
	strh r0, [r3, #0x10]
	movs r0, #0xc
	b _0813A2FA
_0813A2E4:
	movs r1, #0
	movs r0, #6
	strh r0, [r3, #8]
	movs r0, #7
	strh r0, [r3, #0xa]
	movs r0, #0x11
	strh r0, [r3, #0xc]
	movs r0, #1
	strh r0, [r3, #0xe]
	movs r0, #0xc
_0813A2F8:
	strh r0, [r3, #0x10]
_0813A2FA:
	strh r0, [r3, #0x12]
	strh r1, [r3, #0x14]
	strh r4, [r3, #0x26]
	b _0813A30E
_0813A302:
	ldr r1, _0813A314
	movs r0, #0x7f
	strh r0, [r1]
	adds r0, r4, #0
	bl DestroyTask
_0813A30E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A314: .4byte 0x02037290
	thumb_func_end sub_0813A164

	thumb_func_start sub_0813A318
sub_0813A318: @ 0x0813A318
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _0813A410
	adds r5, r0, r1
	bl ScriptContext2_Enable
	ldr r1, _0813A414
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0813A418
	movs r0, #0x40
	strb r0, [r1]
	ldrh r0, [r5, #0x1e]
	movs r1, #0
	bl sub_0813AAAC
	ldrb r0, [r5, #0x1e]
	movs r1, #0
	bl sub_0813AD2C
	ldrb r2, [r5, #0xc]
	ldrb r3, [r5, #0xe]
	ldrb r0, [r5, #0x10]
	str r0, [sp]
	ldrb r0, [r5, #0x12]
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x5c
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	movs r1, #0
	bl CreateWindowTemplate
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	add r0, sp, #0x18
	bl AddWindow
	movs r4, #0
	strh r0, [r5, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldr r6, _0813A41C
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	lsls r0, r0, #3
	bl AllocZeroed
	str r0, [r6]
	ldr r0, _0813A420
	strh r4, [r0]
	bl sub_0813A434
	movs r3, #0
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _0813A3CE
	mov ip, r6
	ldr r6, _0813A424
	ldr r4, _0813A428
_0813A3A8:
	mov r1, ip
	ldr r0, [r1]
	lsls r2, r3, #3
	adds r2, r2, r0
	lsls r1, r3, #2
	ldrh r0, [r4]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r1, r1, r6
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r2, #4]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r3, r0
	blt _0813A3A8
_0813A3CE:
	ldr r4, _0813A42C
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0xc]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0xe]
	ldrh r0, [r5, #0x22]
	strb r0, [r4, #0x10]
	adds r0, r7, #0
	bl sub_0813A69C
	ldrh r1, [r5, #0x16]
	ldrh r2, [r5, #0x18]
	adds r0, r4, #0
	bl ListMenuInit
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x24]
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _0813A410
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0813A430
	str r1, [r0]
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813A410: .4byte 0x03005B60
_0813A414: .4byte 0x0203A834
_0813A418: .4byte 0x0203A838
_0813A41C: .4byte 0x0203A830
_0813A420: .4byte 0x0203A836
_0813A424: .4byte 0x0859274C
_0813A428: .4byte 0x02037280
_0813A42C: .4byte 0x03005F10
_0813A430: .4byte 0x0813A4F5
	thumb_func_end sub_0813A318

	thumb_func_start sub_0813A434
sub_0813A434: @ 0x0813A434
	ldr r1, _0813A468
	ldr r0, _0813A46C
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0813A470
	str r0, [r1, #4]
	movs r0, #0
	str r0, [r1, #8]
	movs r2, #0
	movs r0, #1
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	strb r2, [r1, #0x10]
	strb r2, [r1, #0x11]
	movs r0, #8
	strb r0, [r1, #0x12]
	strb r2, [r1, #0x13]
	movs r0, #0x20
	strb r0, [r1, #0x14]
	movs r0, #0x31
	strb r0, [r1, #0x15]
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #1
	strb r0, [r1, #0x17]
	bx lr
	.align 2, 0
_0813A468: .4byte 0x03005F10
_0813A46C: .4byte 0x0203A830
_0813A470: .4byte 0x0813A475
	thumb_func_end sub_0813A434

	thumb_func_start sub_0813A474
sub_0813A474: @ 0x0813A474
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #5
	bl PlaySE
	ldr r0, _0813A4E4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0813A4DC
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0813A4E8
	adds r4, r4, r0
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	movs r2, #0
	bl ListMenuGetScrollAndRow
	ldr r1, _0813A4EC
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	bl ListMenuGetCurrentItemArrayId
	ldrh r0, [r4, #0x1e]
	ldr r5, _0813A4F0
	ldrh r1, [r5]
	bl sub_0813AC90
	ldrh r0, [r4, #0x1e]
	mov r1, sp
	ldrh r1, [r1]
	bl sub_0813AAAC
	ldrb r0, [r4, #0x1e]
	mov r1, sp
	ldrh r1, [r1]
	bl sub_0813AD6C
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5]
_0813A4DC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A4E4: .4byte 0x0813A4F5
_0813A4E8: .4byte 0x03005B60
_0813A4EC: .4byte 0x0203A834
_0813A4F0: .4byte 0x0203A836
	thumb_func_end sub_0813A474

	thumb_func_start sub_0813A4F4
sub_0813A4F4: @ 0x0813A4F4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0813A520
	adds r6, r0, r1
	ldrh r0, [r6, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ListMenu_ProcessInput
	adds r4, r0, #0
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0813A524
	adds r0, #1
	cmp r4, r0
	bne _0813A538
	b _0813A56E
	.align 2, 0
_0813A520: .4byte 0x03005B60
_0813A524:
	ldr r1, _0813A534
	movs r0, #0x7f
	strh r0, [r1]
	movs r0, #5
	bl PlaySE
	b _0813A554
	.align 2, 0
_0813A534: .4byte 0x02037290
_0813A538:
	ldr r0, _0813A55C
	strh r4, [r0]
	movs r0, #5
	bl PlaySE
	movs r1, #0x14
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _0813A554
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	subs r0, #1
	cmp r4, r0
	bne _0813A560
_0813A554:
	adds r0, r5, #0
	bl sub_0813A578
	b _0813A56E
	.align 2, 0
_0813A55C: .4byte 0x02037290
_0813A560:
	adds r0, r5, #0
	bl sub_0813A740
	ldr r0, _0813A574
	str r0, [r6]
	bl EnableBothScriptContexts
_0813A56E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A574: .4byte 0x0813A609
	thumb_func_end sub_0813A4F4

	thumb_func_start sub_0813A578
sub_0813A578: @ 0x0813A578
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0813A600
	adds r4, r4, r0
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	bl ListMenuGetCurrentItemArrayId
	ldrh r0, [r4, #0x1e]
	mov r1, sp
	ldrh r1, [r1]
	bl sub_0813AC90
	adds r0, r5, #0
	bl sub_0813A740
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldr r0, _0813A604
	ldr r0, [r0]
	bl Free
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl CopyWindowToVram
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl RemoveWindow
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A600: .4byte 0x03005B60
_0813A604: .4byte 0x0203A830
	thumb_func_end sub_0813A578

	thumb_func_start sub_0813A608
sub_0813A608: @ 0x0813A608
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0813A630
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	cmp r0, #1
	beq _0813A62C
	cmp r0, #2
	bne _0813A62C
	movs r0, #1
	strh r0, [r1, #0x14]
	ldr r0, _0813A634
	str r0, [r1]
_0813A62C:
	pop {r0}
	bx r0
	.align 2, 0
_0813A630: .4byte 0x03005B60
_0813A634: .4byte 0x0813A66D
	thumb_func_end sub_0813A608

	thumb_func_start sub_0813A638
sub_0813A638: @ 0x0813A638
	push {lr}
	ldr r0, _0813A650
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _0813A654
	bl EnableBothScriptContexts
	b _0813A664
	.align 2, 0
_0813A650: .4byte 0x0813A609
_0813A654:
	ldr r0, _0813A668
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	strh r0, [r1, #0x14]
_0813A664:
	pop {r0}
	bx r0
	.align 2, 0
_0813A668: .4byte 0x03005B60
	thumb_func_end sub_0813A638

	thumb_func_start sub_0813A66C
sub_0813A66C: @ 0x0813A66C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ScriptContext2_Enable
	adds r0, r4, #0
	bl sub_0813A69C
	ldr r1, _0813A694
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0813A698
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A694: .4byte 0x03005B60
_0813A698: .4byte 0x0813A4F5
	thumb_func_end sub_0813A66C

	thumb_func_start sub_0813A69C
sub_0813A69C: @ 0x0813A69C
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0813A734
	adds r4, r1, r0
	mov r1, sp
	ldr r0, _0813A738
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _0813A72C
	mov r2, sp
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	lsls r1, r1, #3
	adds r1, #0xc
	movs r5, #0xc
	ldrsh r0, [r4, r5]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r3, #0
	strb r1, [r2, #1]
	mov r1, sp
	movs r0, #8
	strb r0, [r1, #2]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	lsls r1, r1, #3
	adds r1, #0xc
	movs r5, #0xc
	ldrsh r0, [r4, r5]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	strb r1, [r2, #4]
	mov r1, sp
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	lsls r0, r0, #3
	adds r0, #0xa
	strb r0, [r1, #5]
	mov r0, sp
	strh r3, [r0, #6]
	mov r2, sp
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	subs r0, r0, r1
	strh r0, [r2, #8]
	ldr r1, _0813A73C
	mov r0, sp
	bl AddScrollIndicatorArrowPair
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
_0813A72C:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A734: .4byte 0x03005B60
_0813A738: .4byte 0x08592A8C
_0813A73C: .4byte 0x0203A834
	thumb_func_end sub_0813A69C

	thumb_func_start sub_0813A740
sub_0813A740: @ 0x0813A740
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0813A76C
	adds r2, r1, r0
	movs r0, #8
	ldrsh r1, [r2, r0]
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	cmp r1, r0
	beq _0813A766
	ldrh r0, [r2, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl RemoveScrollIndicatorArrowPair
_0813A766:
	pop {r0}
	bx r0
	.align 2, 0
_0813A76C: .4byte 0x03005B60
	thumb_func_end sub_0813A740

	thumb_func_start nullsub_55
nullsub_55: @ 0x0813A770
	bx lr
	.align 2, 0
	thumb_func_end nullsub_55

	thumb_func_start sub_0813A774
sub_0813A774: @ 0x0813A774
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r6, _0813A79C
	ldr r0, _0813A7A0
	adds r5, r0, #0
_0813A77E:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	bne _0813A7A4
	subs r0, r5, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl VarSet
	b _0813A7B0
	.align 2, 0
_0813A79C: .4byte 0x020226A0
_0813A7A0: .4byte 0x0000401F
_0813A7A4:
	subs r0, r5, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x69
	bl VarSet
_0813A7B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0813A77E
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0813A774

	thumb_func_start sub_0813A7C0
sub_0813A7C0: @ 0x0813A7C0
	push {lr}
	ldr r1, _0813A7F0
	ldrh r0, [r1]
	cmp r0, #5
	bls _0813A7CE
	movs r0, #0
	strh r0, [r1]
_0813A7CE:
	ldrh r1, [r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0813A7F4
	adds r0, r0, r1
	bl GetNature
	lsls r0, r0, #0x18
	ldr r1, _0813A7F8
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_0813A7F0: .4byte 0x02037280
_0813A7F4: .4byte 0x02024190
_0813A7F8: .4byte 0x08592A9C
	thumb_func_end sub_0813A7C0

	thumb_func_start UpdateFrontierGambler
UpdateFrontierGambler: @ 0x0813A7FC
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0813A824
	bl GetVarPointer
	adds r5, r0, #0
	ldrh r0, [r5]
	adds r4, r4, r0
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, #0xc
	bl __umodsi3
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813A824: .4byte 0x00004030
	thumb_func_end UpdateFrontierGambler

	thumb_func_start sub_0813A828
sub_0813A828: @ 0x0813A828
	push {r4, lr}
	ldr r0, _0813A850
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _0813A854
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	ldr r0, _0813A858
	adds r1, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A850: .4byte 0x00004030
_0813A854: .4byte 0x08592B00
_0813A858: .4byte 0x00004031
	thumb_func_end sub_0813A828

	thumb_func_start sub_0813A85C
sub_0813A85C: @ 0x0813A85C
	push {r4, lr}
	ldr r4, _0813A878
	ldr r0, _0813A87C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r0, [r0]
	bl ShowFieldMessage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A878: .4byte 0x08592B30
_0813A87C: .4byte 0x00004031
	thumb_func_end sub_0813A85C

	thumb_func_start sub_0813A880
sub_0813A880: @ 0x0813A880
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0813A8DC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0813A8E0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0813A8E4
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r4, _0813A8E8
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _0813A8F8
	ldr r1, _0813A8EC
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r5, #8
	adds r0, r0, r7
	cmp r1, r0
	bne _0813A8F8
	mov r0, r8
	cmp r0, #0
	beq _0813A8F0
	adds r0, r4, #0
	movs r1, #2
	bl VarSet
	b _0813A8F8
	.align 2, 0
_0813A8DC: .4byte 0x000040CE
_0813A8E0: .4byte 0x00004031
_0813A8E4: .4byte 0x000040CF
_0813A8E8: .4byte 0x00004033
_0813A8EC: .4byte 0x08592B60
_0813A8F0:
	adds r0, r4, #0
	movs r1, #3
	bl VarSet
_0813A8F8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0813A880

	thumb_func_start sub_0813A904
sub_0813A904: @ 0x0813A904
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	ldr r5, _0813A974
	ldr r0, _0813A978
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldrb r0, [r5]
	ldr r2, _0813A97C
	movs r4, #0
	str r4, [sp]
	movs r1, #0xff
	mov r8, r1
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0x38
	bl AddTextPrinterParameterized
	ldr r6, _0813A980
	ldr r0, _0813A984
	ldr r0, [r0]
	ldr r1, _0813A988
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	movs r2, #2
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldrb r0, [r5]
	str r4, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0x18
	bl AddTextPrinterParameterized
	ldrb r0, [r5]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813A974: .4byte 0x0203A839
_0813A978: .4byte 0x08592B78
_0813A97C: .4byte 0x085CB0C8
_0813A980: .4byte 0x02021C40
_0813A984: .4byte 0x03005AF0
_0813A988: .4byte 0x00000EB8
	thumb_func_end sub_0813A904

	thumb_func_start sub_0813A98C
sub_0813A98C: @ 0x0813A98C
	push {r4, lr}
	sub sp, #0xc
	ldr r4, _0813A9C4
	ldr r0, _0813A9C8
	ldr r0, [r0]
	ldr r1, _0813A9CC
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r0, _0813A9D0
	ldrb r0, [r0]
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x18
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A9C4: .4byte 0x02021C40
_0813A9C8: .4byte 0x03005AF0
_0813A9CC: .4byte 0x00000EB8
_0813A9D0: .4byte 0x0203A839
	thumb_func_end sub_0813A98C

	thumb_func_start sub_0813A9D4
sub_0813A9D4: @ 0x0813A9D4
	push {r4, lr}
	ldr r4, _0813A9EC
	ldrb r0, [r4]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813A9EC: .4byte 0x0203A839
	thumb_func_end sub_0813A9D4

	thumb_func_start sub_0813A9F0
sub_0813A9F0: @ 0x0813A9F0
	push {lr}
	ldr r0, _0813AA08
	ldr r0, [r0]
	ldr r2, _0813AA0C
	adds r1, r0, r2
	ldr r0, _0813AA10
	ldrh r2, [r1]
	ldrh r0, [r0]
	cmp r2, r0
	bhs _0813AA14
	movs r0, #0
	b _0813AA16
	.align 2, 0
_0813AA08: .4byte 0x03005AF0
_0813AA0C: .4byte 0x00000EB8
_0813AA10: .4byte 0x02037280
_0813AA14:
	subs r0, r2, r0
_0813AA16:
	strh r0, [r1]
	pop {r0}
	bx r0
	thumb_func_end sub_0813A9F0

	thumb_func_start sub_0813AA1C
sub_0813AA1C: @ 0x0813AA1C
	push {lr}
	ldr r0, _0813AA38
	ldr r0, [r0]
	ldr r1, _0813AA3C
	adds r2, r0, r1
	ldrh r1, [r2]
	ldr r0, _0813AA40
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r0, _0813AA44
	cmp r1, r0
	ble _0813AA48
	strh r0, [r2]
	b _0813AA4A
	.align 2, 0
_0813AA38: .4byte 0x03005AF0
_0813AA3C: .4byte 0x00000EB8
_0813AA40: .4byte 0x02037280
_0813AA44: .4byte 0x0000270F
_0813AA48:
	strh r1, [r2]
_0813AA4A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0813AA1C

	thumb_func_start sub_0813AA50
sub_0813AA50: @ 0x0813AA50
	ldr r0, _0813AA5C
	ldr r0, [r0]
	ldr r1, _0813AA60
	adds r0, r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0813AA5C: .4byte 0x03005AF0
_0813AA60: .4byte 0x00000EB8
	thumb_func_end sub_0813AA50

	thumb_func_start sub_0813AA64
sub_0813AA64: @ 0x0813AA64
	push {r4, lr}
	ldr r4, _0813AA88
	ldr r0, _0813AA8C
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldrb r0, [r4]
	movs r1, #2
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AA88: .4byte 0x0203A83A
_0813AA8C: .4byte 0x08592B80
	thumb_func_end sub_0813AA64

	thumb_func_start sub_0813AA90
sub_0813AA90: @ 0x0813AA90
	push {r4, lr}
	ldr r4, _0813AAA8
	ldrb r0, [r4]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AAA8: .4byte 0x0203A83A
	thumb_func_end sub_0813AA90

	thumb_func_start sub_0813AAAC
sub_0813AAAC: @ 0x0813AAAC
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _0813AAE8
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0813AAC4
	b _0813AC0E
_0813AAC4:
	movs r0, #0xb0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	movs r2, #0
	movs r3, #0
	bl FillWindowPixelRect
	cmp r4, #4
	beq _0813AB34
	cmp r4, #4
	bgt _0813AAEC
	cmp r4, #3
	beq _0813AAF6
	b _0813AC0E
	.align 2, 0
_0813AAE8: .4byte 0xFFFD0000
_0813AAEC:
	cmp r4, #5
	beq _0813ABA8
	cmp r4, #6
	beq _0813ABE0
	b _0813AC0E
_0813AAF6:
	ldr r1, _0813AB28
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized2
	ldr r1, _0813AB2C
	lsls r0, r5, #1
	adds r1, r0, r1
	ldrh r5, [r1]
	ldr r0, _0813AB30
	cmp r5, r0
	beq _0813AB64
	b _0813AB78
	.align 2, 0
_0813AB28: .4byte 0x08592BCC
_0813AB2C: .4byte 0x08592B88
_0813AB30: .4byte 0x0000FFFF
_0813AB34:
	ldr r1, _0813AB6C
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized2
	ldr r1, _0813AB70
	lsls r0, r5, #1
	adds r1, r0, r1
	ldrh r5, [r1]
	ldr r0, _0813AB74
	cmp r5, r0
	bne _0813AB78
_0813AB64:
	ldrh r0, [r1]
	bl sub_0813AC20
	b _0813AC0E
	.align 2, 0
_0813AB6C: .4byte 0x08592BF8
_0813AB70: .4byte 0x08592B9E
_0813AB74: .4byte 0x0000FFFF
_0813AB78:
	ldr r4, _0813ABA0
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r4, [sp]
	str r4, [sp, #4]
	movs r1, #0x21
	movs r2, #0x58
	movs r3, #0
	bl AddDecorationIconObject
	ldr r1, _0813ABA4
	strb r0, [r1]
	b _0813AC0E
	.align 2, 0
_0813ABA0: .4byte 0x0000157C
_0813ABA4: .4byte 0x0203A838
_0813ABA8:
	ldr r1, _0813ABD8
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized2
	ldr r1, _0813ABDC
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_0813AC20
	b _0813AC0E
	.align 2, 0
_0813ABD8: .4byte 0x08592C10
_0813ABDC: .4byte 0x08592BAA
_0813ABE0:
	ldr r1, _0813AC18
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized2
	ldr r1, _0813AC1C
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_0813AC20
_0813AC0E:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AC18: .4byte 0x08592C2C
_0813AC1C: .4byte 0x08592BB8
	thumb_func_end sub_0813AAAC

	thumb_func_start sub_0813AC20
sub_0813AC20: @ 0x0813AC20
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r4, _0813AC84
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl AddItemIconSprite
	ldr r4, _0813AC88
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0813AC7E
	ldr r3, _0813AC8C
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0x24
	strh r1, [r0, #0x20]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0x5c
	strh r1, [r0, #0x22]
_0813AC7E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AC84: .4byte 0x0000157C
_0813AC88: .4byte 0x0203A838
_0813AC8C: .4byte 0x020205AC
	thumb_func_end sub_0813AC20

	thumb_func_start sub_0813AC90
sub_0813AC90: @ 0x0813AC90
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _0813ACC0
	ldrb r0, [r2]
	cmp r0, #0x40
	beq _0813ACBC
	cmp r1, #6
	bgt _0813ACB6
	cmp r1, #3
	blt _0813ACB6
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0813ACC4
	adds r0, r0, r1
	bl DestroySpriteAndFreeResources
_0813ACB6:
	ldr r1, _0813ACC0
	movs r0, #0x40
	strb r0, [r1]
_0813ACBC:
	pop {r0}
	bx r0
	.align 2, 0
_0813ACC0: .4byte 0x0203A838
_0813ACC4: .4byte 0x020205AC
	thumb_func_end sub_0813AC90

	thumb_func_start sub_0813ACC8
sub_0813ACC8: @ 0x0813ACC8
	push {lr}
	ldr r0, _0813ACEC
	ldrh r0, [r0]
	cmp r0, #0
	beq _0813AD00
	ldr r0, _0813ACF0
	ldr r2, _0813ACF4
	ldr r1, _0813ACF8
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #3
	ldr r2, _0813ACFC
	adds r1, r1, r2
	bl StringCopy
	b _0813AD18
	.align 2, 0
_0813ACEC: .4byte 0x02037282
_0813ACF0: .4byte 0x02021C40
_0813ACF4: .4byte 0x08592C68
_0813ACF8: .4byte 0x02037280
_0813ACFC: .4byte 0x082EACC4
_0813AD00:
	ldr r0, _0813AD1C
	ldr r2, _0813AD20
	ldr r1, _0813AD24
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #3
	ldr r2, _0813AD28
	adds r1, r1, r2
	bl StringCopy
_0813AD18:
	pop {r0}
	bx r0
	.align 2, 0
_0813AD1C: .4byte 0x02021C40
_0813AD20: .4byte 0x08592C54
_0813AD24: .4byte 0x02037280
_0813AD28: .4byte 0x082EACC4
	thumb_func_end sub_0813ACC8

	thumb_func_start sub_0813AD2C
sub_0813AD2C: @ 0x0813AD2C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsrs r6, r0, #0x18
	movs r1, #0xf7
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0813AD5C
	ldr r4, _0813AD64
	ldr r0, _0813AD68
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0813AD6C
_0813AD5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813AD64: .4byte 0x0203A82A
_0813AD68: .4byte 0x08592C7C
	thumb_func_end sub_0813AD2C

	thumb_func_start sub_0813AD6C
sub_0813AD6C: @ 0x0813AD6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r7, r5, #0
	lsrs r6, r0, #0x18
	movs r1, #0xf7
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0813ADE4
	ldr r4, _0813ADC0
	ldrb r0, [r4]
	movs r1, #0x50
	str r1, [sp]
	movs r1, #0x30
	str r1, [sp, #4]
	movs r1, #0x11
	movs r2, #0
	movs r3, #0
	bl FillWindowPixelRect
	cmp r6, #0xa
	bne _0813ADC8
	ldrb r0, [r4]
	ldr r2, _0813ADC4
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	b _0813ADE4
	.align 2, 0
_0813ADC0: .4byte 0x0203A82A
_0813ADC4: .4byte 0x08592CB0
_0813ADC8:
	ldrb r0, [r4]
	ldr r2, _0813ADEC
	lsls r1, r7, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
_0813ADE4:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813ADEC: .4byte 0x08592C84
	thumb_func_end sub_0813AD6C

	thumb_func_start sub_0813ADF0
sub_0813ADF0: @ 0x0813ADF0
	push {r4, lr}
	ldr r4, _0813AE08
	ldrb r0, [r4]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AE08: .4byte 0x0203A82A
	thumb_func_end sub_0813ADF0

	thumb_func_start sub_0813AE0C
sub_0813AE0C: @ 0x0813AE0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	ldr r0, _0813AED8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _0813AEC8
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0813AEDC
	adds r6, r0, r1
	ldrh r0, [r6, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, sp
	adds r4, #0x16
	add r1, sp, #0x14
	adds r2, r4, #0
	bl ListMenuGetScrollAndRow
	ldrh r0, [r6, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl SetStandardWindowBorderStyle
	movs r5, #0
	mov sb, r4
	ldr r0, _0813AEE0
	mov r8, r0
	movs r4, #0
_0813AE56:
	ldrh r0, [r6, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r1, sp, #0x14
	ldrh r2, [r1]
	adds r2, r2, r5
	lsls r2, r2, #2
	ldr r1, _0813AEE4
	ldrh r1, [r1]
	lsls r1, r1, #6
	adds r2, r2, r1
	add r2, r8
	ldr r2, [r2]
	lsls r1, r5, #0x1c
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r7, #0xff
	str r7, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #1
	movs r3, #0xa
	bl AddTextPrinterParameterized5
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0813AE56
	ldrh r0, [r6, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0813AEE8
	mov r3, sb
	ldrh r1, [r3]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x18
	str r1, [sp]
	str r7, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrh r0, [r6, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	ldrh r0, [r6, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl CopyWindowToVram
_0813AEC8:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AED8: .4byte 0x0813A609
_0813AEDC: .4byte 0x03005B60
_0813AEE0: .4byte 0x0859274C
_0813AEE4: .4byte 0x02037280
_0813AEE8: .4byte 0x085C9299
	thumb_func_end sub_0813AE0C

	thumb_func_start sub_0813AEEC
sub_0813AEEC: @ 0x0813AEEC
	push {r4, lr}
	movs r1, #0
	ldr r0, _0813AF30
	strh r1, [r0]
	ldr r0, _0813AF34
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0813AF38
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r4, #0
	beq _0813AF50
	movs r2, #0
	lsls r1, r1, #1
	ldr r3, _0813AF3C
	ldr r0, _0813AF40
	adds r0, r1, r0
	ldrh r1, [r0]
_0813AF1A:
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r1
	beq _0813AF44
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1d
	bls _0813AF1A
	b _0813AF70
	.align 2, 0
_0813AF30: .4byte 0x02037282
_0813AF34: .4byte 0x0000400E
_0813AF38: .4byte 0x0000400D
_0813AF3C: .4byte 0x085E08C4
_0813AF40: .4byte 0x08592C68
_0813AF44:
	ldr r0, _0813AF4C
	strh r2, [r0]
	b _0813AF70
	.align 2, 0
_0813AF4C: .4byte 0x02037282
_0813AF50:
	movs r2, #0
	lsls r1, r1, #1
	ldr r3, _0813AF78
	ldr r0, _0813AF7C
	adds r0, r1, r0
	ldrh r1, [r0]
_0813AF5C:
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r1
	beq _0813AF44
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1d
	bls _0813AF5C
_0813AF70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AF78: .4byte 0x085E08C4
_0813AF7C: .4byte 0x08592C54
	thumb_func_end sub_0813AEEC

	thumb_func_start sub_0813AF80
sub_0813AF80: @ 0x0813AF80
	push {r4, r5, lr}
	ldr r0, _0813AFF4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xff
	beq _0813AFEE
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0813AFF8
	adds r4, r4, r0
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldr r0, _0813AFFC
	ldr r0, [r0]
	bl Free
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ClearWindowTilemap
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl CopyWindowToVram
	ldrh r0, [r4, #0x22]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl RemoveWindow
	adds r0, r5, #0
	bl DestroyTask
_0813AFEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AFF4: .4byte 0x0813A609
_0813AFF8: .4byte 0x03005B60
_0813AFFC: .4byte 0x0203A830
	thumb_func_end sub_0813AF80

	thumb_func_start DoDeoxysRockInteraction
DoDeoxysRockInteraction: @ 0x0813B000
	push {lr}
	ldr r0, _0813B010
	movs r1, #8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0813B010: .4byte 0x0813B015
	thumb_func_end DoDeoxysRockInteraction

	thumb_func_start Task_DeoxysRockInteraction
Task_DeoxysRockInteraction: @ 0x0813B014
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0813B034
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0813B03C
	ldr r1, _0813B038
	movs r0, #3
	b _0813B0A2
	.align 2, 0
_0813B034: .4byte 0x000008D4
_0813B038: .4byte 0x02037290
_0813B03C:
	ldr r0, _0813B084
	mov r8, r0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r4, _0813B088
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl VarSet
	cmp r5, #0
	beq _0813B094
	ldr r0, _0813B08C
	subs r1, r5, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, r6
	bhs _0813B094
	movs r0, #0
	bl ChangeDeoxysRockLevel
	mov r0, r8
	movs r1, #0
	bl VarSet
	ldr r1, _0813B090
	movs r0, #0
	strh r0, [r1]
	b _0813B0A8
	.align 2, 0
_0813B084: .4byte 0x00004035
_0813B088: .4byte 0x00004034
_0813B08C: .4byte 0x08592E52
_0813B090: .4byte 0x02037290
_0813B094:
	cmp r5, #0xa
	bne _0813B0B8
	ldr r0, _0813B0B0
	bl FlagSet
	ldr r1, _0813B0B4
	movs r0, #2
_0813B0A2:
	strh r0, [r1]
	bl EnableBothScriptContexts
_0813B0A8:
	adds r0, r7, #0
	bl DestroyTask
	b _0813B0DA
	.align 2, 0
_0813B0B0: .4byte 0x000008D4
_0813B0B4: .4byte 0x02037290
_0813B0B8:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl ChangeDeoxysRockLevel
	ldr r0, _0813B0E4
	adds r1, r5, #0
	bl VarSet
	ldr r1, _0813B0E8
	movs r0, #1
	strh r0, [r1]
	adds r0, r7, #0
	bl DestroyTask
_0813B0DA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813B0E4: .4byte 0x00004035
_0813B0E8: .4byte 0x02037290
	thumb_func_end Task_DeoxysRockInteraction

	thumb_func_start ChangeDeoxysRockLevel
ChangeDeoxysRockLevel: @ 0x0813B0EC
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #5
	ldr r1, _0813B120
	adds r0, r0, r1
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #8
	bl LoadPalette
	ldr r0, _0813B124
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r0, #1
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	cmp r4, #0
	bne _0813B128
	movs r0, #0xc4
	bl PlaySE
	b _0813B130
	.align 2, 0
_0813B120: .4byte 0x08592CDC
_0813B124: .4byte 0x03005AEC
_0813B128:
	movs r0, #0x82
	lsls r0, r0, #1
	bl PlaySE
_0813B130:
	ldr r0, _0813B164
	movs r1, #8
	bl CreateTask
	ldr r3, _0813B168
	movs r0, #1
	str r0, [r3]
	movs r0, #0x3a
	str r0, [r3, #4]
	movs r0, #0x1a
	str r0, [r3, #8]
	ldr r0, _0813B16C
	lsls r2, r4, #1
	adds r1, r2, r0
	ldrb r1, [r1]
	str r1, [r3, #0xc]
	adds r0, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	str r0, [r3, #0x10]
	adds r5, r2, #0
	cmp r4, #0
	bne _0813B170
	movs r0, #0x3c
	b _0813B172
	.align 2, 0
_0813B164: .4byte 0x0813B199
_0813B168: .4byte 0x020388A8
_0813B16C: .4byte 0x08592E3C
_0813B170:
	movs r0, #5
_0813B172:
	str r0, [r3, #0x14]
	movs r0, #0x42
	bl FieldEffectStart
	ldr r0, _0813B194
	adds r1, r5, r0
	ldrb r1, [r1]
	adds r0, #1
	adds r0, r5, r0
	ldrb r2, [r0]
	movs r0, #1
	bl Overworld_SetEventObjTemplateCoords
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B194: .4byte 0x08592E3C
	thumb_func_end ChangeDeoxysRockLevel

	thumb_func_start WaitForDeoxysRockMovement
WaitForDeoxysRockMovement: @ 0x0813B198
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x42
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813B1B4
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_0813B1B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WaitForDeoxysRockMovement

	thumb_func_start IncrementBirthIslandRockStepCount
IncrementBirthIslandRockStepCount: @ 0x0813B1BC
	push {r4, lr}
	ldr r4, _0813B1EC
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0813B1F0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _0813B1F4
	cmp r1, r0
	bne _0813B200
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x63
	bls _0813B1F8
	adds r0, r4, #0
	movs r1, #0
	bl VarSet
	b _0813B200
	.align 2, 0
_0813B1EC: .4byte 0x00004034
_0813B1F0: .4byte 0x03005AEC
_0813B1F4: .4byte 0x00003A1A
_0813B1F8:
	adds r0, r4, #0
	adds r1, r2, #0
	bl VarSet
_0813B200:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end IncrementBirthIslandRockStepCount

	thumb_func_start sub_0813B208
sub_0813B208: @ 0x0813B208
	push {lr}
	ldr r0, _0813B234
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	ldr r1, _0813B238
	adds r0, r0, r1
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #8
	bl LoadPalette
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	pop {r0}
	bx r0
	.align 2, 0
_0813B234: .4byte 0x00004035
_0813B238: .4byte 0x08592CDC
	thumb_func_end sub_0813B208

	thumb_func_start set_unknown_box_id
set_unknown_box_id: @ 0x0813B23C
	ldr r1, _0813B244
	strb r0, [r1]
	bx lr
	.align 2, 0
_0813B244: .4byte 0x0203A83B
	thumb_func_end set_unknown_box_id

	thumb_func_start get_unknown_box_id
get_unknown_box_id: @ 0x0813B248
	ldr r0, _0813B250
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0813B250: .4byte 0x0203A83B
	thumb_func_end get_unknown_box_id

	thumb_func_start sub_0813B254
sub_0813B254: @ 0x0813B254
	push {r4, r5, lr}
	ldr r5, _0813B288
	adds r0, r5, #0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813B290
	bl StorageGetCurrentBox
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0813B28C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	beq _0813B290
	adds r0, r5, #0
	bl FlagSet
	movs r0, #1
	b _0813B292
	.align 2, 0
_0813B288: .4byte 0x000008D7
_0813B28C: .4byte 0x00004036
_0813B290:
	movs r0, #0
_0813B292:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0813B254

	thumb_func_start sub_0813B298
sub_0813B298: @ 0x0813B298
	push {r4, r5, r6, r7, lr}
	ldr r0, _0813B2F0
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl set_unknown_box_id
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0813B2B0:
	movs r5, #0
	lsls r6, r4, #0x18
	lsls r7, r4, #0x10
_0813B2B6:
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r6, #0x18
	bl GetBoxedMonPtr
	movs r1, #0xb
	movs r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0813B2F8
	bl get_unknown_box_id
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	beq _0813B2DE
	ldr r0, _0813B2F4
	bl FlagClear
_0813B2DE:
	ldr r0, _0813B2F0
	lsrs r1, r7, #0x10
	bl VarSet
	bl sub_0813B254
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0813B314
	.align 2, 0
_0813B2F0: .4byte 0x00004036
_0813B2F4: .4byte 0x000008D7
_0813B2F8:
	adds r5, #1
	cmp r5, #0x1d
	ble _0813B2B6
	adds r4, #1
	cmp r4, #0xe
	bne _0813B306
	movs r4, #0
_0813B306:
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0813B2B0
	movs r0, #0
_0813B314:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0813B298

	thumb_func_start CreateUnusualWeatherEvent
CreateUnusualWeatherEvent: @ 0x0813B31C
	push {r4, lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0813B35C
	movs r1, #0
	bl VarSet
	movs r0, #0xdf
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0813B378
	ldr r0, _0813B360
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0813B368
	ldr r0, _0813B364
	movs r1, #7
	ands r4, r1
	adds r1, r4, #0
	adds r1, #9
	bl VarSet
	b _0813B3A2
	.align 2, 0
_0813B35C: .4byte 0x00004038
_0813B360: .4byte 0x000001BF
_0813B364: .4byte 0x00004037
_0813B368:
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne _0813B38C
	bl Random
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0813B378:
	ldr r0, _0813B388
	movs r1, #7
	ands r4, r1
	adds r1, r4, #1
	bl VarSet
	b _0813B3A2
	.align 2, 0
_0813B388: .4byte 0x00004037
_0813B38C:
	bl Random
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0813B3A8
	movs r1, #7
	ands r4, r1
	adds r1, r4, #0
	adds r1, #9
	bl VarSet
_0813B3A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B3A8: .4byte 0x00004037
	thumb_func_end CreateUnusualWeatherEvent

	thumb_func_start GetUnusualWeatherMapNameAndType
GetUnusualWeatherMapNameAndType: @ 0x0813B3AC
	push {r4, lr}
	ldr r0, _0813B3D4
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0813B3D8
	ldr r2, _0813B3DC
	subs r1, r4, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl GetMapName
	cmp r4, #8
	bls _0813B3E0
	movs r0, #1
	b _0813B3E2
	.align 2, 0
_0813B3D4: .4byte 0x00004037
_0813B3D8: .4byte 0x02021C40
_0813B3DC: .4byte 0x08592E5C
_0813B3E0:
	movs r0, #0
_0813B3E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetUnusualWeatherMapNameAndType

	thumb_func_start UnusualWeatherHasExpired
UnusualWeatherHasExpired: @ 0x0813B3E8
	push {r4, r5, r6, lr}
	ldr r5, _0813B438
	adds r0, r5, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0813B43C
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0813B4B4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0813B440
	cmp r4, r0
	bls _0813B4AC
	adds r0, r5, #0
	movs r1, #0
	bl VarSet
	ldr r0, _0813B444
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #0x18
	bne _0813B44C
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0x69
	bgt _0813B44C
	cmp r0, #0x65
	blt _0813B44C
	ldr r0, _0813B448
	movs r1, #1
	b _0813B4B0
	.align 2, 0
_0813B438: .4byte 0x00004038
_0813B43C: .4byte 0x00004037
_0813B440: .4byte 0x000003E7
_0813B444: .4byte 0x03005AEC
_0813B448: .4byte 0x00004039
_0813B44C:
	ldr r0, _0813B474
	ldr r2, [r0]
	movs r1, #4
	ldrsb r1, [r2, r1]
	adds r3, r0, #0
	cmp r1, #0
	bne _0813B47C
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r0, #0x34
	beq _0813B46E
	cmp r0, #0x34
	blt _0813B47C
	cmp r0, #0x38
	bgt _0813B47C
	cmp r0, #0x36
	blt _0813B47C
_0813B46E:
	ldr r0, _0813B478
	movs r1, #1
	b _0813B4B0
	.align 2, 0
_0813B474: .4byte 0x03005AEC
_0813B478: .4byte 0x00004039
_0813B47C:
	ldr r3, [r3]
	movs r2, #5
	ldrsb r2, [r3, r2]
	ldr r1, _0813B49C
	subs r0, r6, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	bne _0813B4A0
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0813B4A0
	movs r0, #1
	b _0813B4B6
	.align 2, 0
_0813B49C: .4byte 0x08592E6C
_0813B4A0:
	ldr r0, _0813B4A8
	movs r1, #0
	b _0813B4B0
	.align 2, 0
_0813B4A8: .4byte 0x00004037
_0813B4AC:
	adds r0, r5, #0
	adds r1, r4, #0
_0813B4B0:
	bl VarSet
_0813B4B4:
	movs r0, #0
_0813B4B6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end UnusualWeatherHasExpired

	thumb_func_start Unused_SetWeatherSunny
Unused_SetWeatherSunny: @ 0x0813B4BC
	push {lr}
	movs r0, #2
	bl SetCurrentAndNextWeather
	pop {r0}
	bx r0
	thumb_func_end Unused_SetWeatherSunny

	thumb_func_start sub_0813B4C8
sub_0813B4C8: @ 0x0813B4C8
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r0, _0813B4FC
	ldr r4, [r0]
	movs r6, #4
	ldrsb r6, [r4, r6]
	ldr r5, _0813B500
	adds r0, r5, #2
	mov ip, r0
	adds r7, r5, #1
_0813B4DC:
	lsls r0, r3, #1
	adds r2, r0, r3
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r6, r0
	bne _0813B504
	movs r1, #5
	ldrsb r1, [r4, r1]
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r1, r0
	bne _0813B504
	mov r1, ip
	adds r0, r2, r1
	ldrb r0, [r0]
	b _0813B510
	.align 2, 0
_0813B4FC: .4byte 0x03005AEC
_0813B500: .4byte 0x08592E7C
_0813B504:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xb
	bls _0813B4DC
	movs r0, #1
_0813B510:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0813B4C8

	thumb_func_start sub_0813B518
sub_0813B518: @ 0x0813B518
	push {lr}
	ldr r0, _0813B540
	ldrh r0, [r0]
	bl GetRematchIdxByTrainerIdx
	cmp r0, #0
	blt _0813B544
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0813B544
	movs r0, #1
	b _0813B546
	.align 2, 0
_0813B540: .4byte 0x02037280
_0813B544:
	movs r0, #0
_0813B546:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0813B518

	thumb_func_start sub_0813B54C
sub_0813B54C: @ 0x0813B54C
	push {lr}
	ldr r0, _0813B560
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813B564
	movs r0, #1
	b _0813B566
	.align 2, 0
_0813B560: .4byte 0x0000403F
_0813B564:
	movs r0, #0
_0813B566:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0813B54C

	thumb_func_start sub_0813B56C
sub_0813B56C: @ 0x0813B56C
	push {lr}
	ldr r2, _0813B590
	ldr r1, _0813B594
	ldr r0, [r1]
	str r0, [r2]
	movs r0, #0
	str r0, [r1]
	ldr r0, _0813B598
	ldrb r0, [r0]
	cmp r0, #0
	bne _0813B58A
	ldr r0, _0813B59C
	movs r1, #5
	bl CreateTask
_0813B58A:
	pop {r0}
	bx r0
	.align 2, 0
_0813B590: .4byte 0x0203A83C
_0813B594: .4byte 0x02022C90
_0813B598: .4byte 0x030031C4
_0813B59C: .4byte 0x080B3251
	thumb_func_end sub_0813B56C

	thumb_func_start sub_0813B5A0
sub_0813B5A0: @ 0x0813B5A0
	push {lr}
	ldr r0, _0813B5B0
	movs r1, #5
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0813B5B0: .4byte 0x0813B5B5
	thumb_func_end sub_0813B5A0

	thumb_func_start sub_0813B5B4
sub_0813B5B4: @ 0x0813B5B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0813B5D8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #9
	bls _0813B5CE
	b _0813B7FE
_0813B5CE:
	lsls r0, r0, #2
	ldr r1, _0813B5DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813B5D8: .4byte 0x03005B60
_0813B5DC: .4byte 0x0813B5E0
_0813B5E0: @ jump table
	.4byte _0813B608 @ case 0
	.4byte _0813B61C @ case 1
	.4byte _0813B64C @ case 2
	.4byte _0813B6EC @ case 3
	.4byte _0813B71C @ case 4
	.4byte _0813B760 @ case 5
	.4byte _0813B79C @ case 6
	.4byte _0813B7AA @ case 7
	.4byte _0813B7BC @ case 8
	.4byte _0813B7E0 @ case 9
_0813B608:
	ldr r0, _0813B618
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813B616
	b _0813B7FE
_0813B616:
	b _0813B7C8
	.align 2, 0
_0813B618: .4byte 0x080B3251
_0813B61C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0813B62A
	b _0813B7FE
_0813B62A:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813B636
	b _0813B7C8
_0813B636:
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0813B648
	movs r2, #2
	bl SendBlock
	b _0813B740
	.align 2, 0
_0813B648: .4byte 0x02037280
_0813B64C:
	bl GetBlockReceivedStatus
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0813B65A
	b _0813B7FE
_0813B65A:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813B666
	b _0813B7C8
_0813B666:
	ldr r5, _0813B690
	ldr r0, _0813B694
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, #1
	bl ResetBlockReceivedFlag
	ldr r0, _0813B698
	ldrh r0, [r0]
	cmp r0, #1
	bne _0813B6A0
	ldrh r1, [r5]
	cmp r1, #1
	bne _0813B6A0
	ldr r0, _0813B69C
	strh r1, [r0]
	b _0813B7C8
	.align 2, 0
_0813B690: .4byte 0x02037282
_0813B694: .4byte 0x0202207C
_0813B698: .4byte 0x02037280
_0813B69C: .4byte 0x02037290
_0813B6A0:
	ldr r0, _0813B6B8
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _0813B6C4
	ldr r0, _0813B6BC
	ldrh r0, [r0]
	cmp r0, #1
	bne _0813B6C4
	ldr r1, _0813B6C0
	movs r0, #2
	b _0813B6E4
	.align 2, 0
_0813B6B8: .4byte 0x02037280
_0813B6BC: .4byte 0x02037282
_0813B6C0: .4byte 0x02037290
_0813B6C4:
	ldrh r0, [r2]
	cmp r0, #1
	bne _0813B6E0
	ldr r0, _0813B6D8
	ldrh r0, [r0]
	cmp r0, #0
	bne _0813B6E0
	ldr r1, _0813B6DC
	movs r0, #3
	b _0813B6E4
	.align 2, 0
_0813B6D8: .4byte 0x02037282
_0813B6DC: .4byte 0x02037290
_0813B6E0:
	ldr r1, _0813B6E8
	movs r0, #0
_0813B6E4:
	strh r0, [r1]
	b _0813B7C8
	.align 2, 0
_0813B6E8: .4byte 0x02037290
_0813B6EC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0813B6FA
	b _0813B7FE
_0813B6FA:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813B7C8
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0813B718
	movs r2, #2
	bl SendBlock
	b _0813B740
	.align 2, 0
_0813B718: .4byte 0x02037290
_0813B71C:
	bl GetBlockReceivedStatus
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0813B7FE
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813B7C8
	ldr r1, _0813B754
	ldr r0, _0813B758
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, #0
	bl ResetBlockReceivedFlag
_0813B740:
	ldr r1, _0813B75C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _0813B7FE
	.align 2, 0
_0813B754: .4byte 0x02037290
_0813B758: .4byte 0x0202207C
_0813B75C: .4byte 0x03005B60
_0813B760:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813B784
	ldr r0, _0813B77C
	ldrh r0, [r0]
	cmp r0, #2
	bne _0813B7C8
	ldr r0, _0813B780
	bl ShowFieldAutoScrollMessage
	b _0813B7C8
	.align 2, 0
_0813B77C: .4byte 0x02037290
_0813B780: .4byte 0x08226D61
_0813B784:
	ldr r0, _0813B794
	ldrh r0, [r0]
	cmp r0, #3
	bne _0813B7C8
	ldr r0, _0813B798
	bl ShowFieldAutoScrollMessage
	b _0813B7C8
	.align 2, 0
_0813B794: .4byte 0x02037290
_0813B798: .4byte 0x08226D61
_0813B79C:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0813B7FE
	b _0813B7C8
_0813B7AA:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0813B7FE
	bl sub_0800A8D4
	b _0813B7C8
_0813B7BC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0813B7FE
_0813B7C8:
	ldr r0, _0813B7DC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0813B7FE
	.align 2, 0
_0813B7DC: .4byte 0x03005B60
_0813B7E0:
	ldr r0, _0813B804
	ldrb r0, [r0]
	cmp r0, #0
	bne _0813B7EC
	bl sub_0800A7F8
_0813B7EC:
	ldr r0, _0813B808
	ldr r1, _0813B80C
	ldr r1, [r1]
	str r1, [r0]
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_0813B7FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B804: .4byte 0x0300319C
_0813B808: .4byte 0x02022C90
_0813B80C: .4byte 0x0203A83C
	thumb_func_end sub_0813B5B4

	thumb_func_start sub_0813B810
sub_0813B810: @ 0x0813B810
	push {lr}
	ldr r0, _0813B828
	ldrh r0, [r0]
	cmp r0, #0
	bne _0813B830
	ldr r2, _0813B82C
	movs r0, #0
	movs r1, #1
	bl DoRayquazaScene
	b _0813B83A
	.align 2, 0
_0813B828: .4byte 0x02037280
_0813B82C: .4byte 0x08085B35
_0813B830:
	ldr r2, _0813B840
	movs r0, #1
	movs r1, #0
	bl DoRayquazaScene
_0813B83A:
	pop {r0}
	bx r0
	.align 2, 0
_0813B840: .4byte 0x08085B35
	thumb_func_end sub_0813B810

	thumb_func_start sub_0813B844
sub_0813B844: @ 0x0813B844
	push {lr}
	ldr r0, _0813B858
	movs r1, #8
	bl CreateTask
	movs r0, #0x9d
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0813B858: .4byte 0x0813B85D
	thumb_func_end sub_0813B844

	thumb_func_start sub_0813B85C
sub_0813B85C: @ 0x0813B85C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0813B8AC
	adds r4, r0, r1
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	movs r0, #2
	ldrsh r1, [r4, r0]
	ldr r0, _0813B8B0
	ldrh r0, [r0]
	cmp r1, r0
	bne _0813B890
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	strh r0, [r4, #2]
	movs r0, #0x9d
	bl PlaySE
_0813B890:
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, _0813B8B4
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bne _0813B8A4
	adds r0, r5, #0
	bl DestroyTask
_0813B8A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B8AC: .4byte 0x03005B68
_0813B8B0: .4byte 0x02037282
_0813B8B4: .4byte 0x02037280
	thumb_func_end sub_0813B85C

	thumb_func_start sub_0813B8B8
sub_0813B8B8: @ 0x0813B8B8
	push {lr}
	ldr r0, _0813B8E0
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0813B8E4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	movs r0, #4
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	strh r0, [r1, #0xc]
	strh r2, [r1, #0xe]
	pop {r0}
	bx r0
	.align 2, 0
_0813B8E0: .4byte 0x0813B8E9
_0813B8E4: .4byte 0x03005B60
	thumb_func_end sub_0813B8B8

	thumb_func_start sub_0813B8E8
sub_0813B8E8: @ 0x0813B8E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	ldr r1, _0813B994
	adds r5, r0, r1
	movs r0, #6
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	movs r1, #6
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0813B986
	movs r6, #0
_0813B922:
	movs r4, #0
	lsls r3, r6, #3
	mov sl, r3
	adds r7, r6, #1
	mov r8, r7
_0813B92C:
	ldr r0, _0813B998
	ldr r1, [r0]
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, r0, r4
	adds r0, #6
	movs r3, #2
	ldrsh r1, [r1, r3]
	adds r1, r1, r6
	adds r1, #4
	ldr r7, _0813B99C
	adds r2, r4, r7
	add r2, sl
	movs r7, #6
	ldrsh r3, [r5, r7]
	lsls r3, r3, #5
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl MapGridSetMetatileIdAt
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0813B92C
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _0813B922
	bl DrawWholeMapView
	ldrh r0, [r5, #6]
	adds r0, #1
	strh r0, [r5, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne _0813B986
	mov r0, sb
	bl DestroyTask
	bl EnableBothScriptContexts
_0813B986:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813B994: .4byte 0x03005B68
_0813B998: .4byte 0x03005AEC
_0813B99C: .4byte 0x00000201
	thumb_func_end sub_0813B8E8

	thumb_func_start sub_0813B9A0
sub_0813B9A0: @ 0x0813B9A0
	push {r4, r5, lr}
	ldr r5, _0813B9D0
	ldr r0, _0813B9D4
	ldrh r0, [r0]
	movs r1, #7
	bl __udivsi3
	strh r0, [r5]
	ldrh r4, [r5]
	adds r0, r4, #0
	movs r1, #0x14
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r4, r4, r1
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B9D0: .4byte 0x02037290
_0813B9D4: .4byte 0x02037280
	thumb_func_end sub_0813B9A0

	thumb_func_start sub_0813B9D8
sub_0813B9D8: @ 0x0813B9D8
	push {lr}
	ldr r0, _0813B9F4
	ldr r0, [r0]
	ldrh r1, [r0, #0x1c]
	movs r0, #0xb0
	lsls r0, r0, #4
	cmp r1, r0
	bne _0813B9EE
	movs r0, #3
	bl SetLastHealLocationWarp
_0813B9EE:
	pop {r0}
	bx r0
	.align 2, 0
_0813B9F4: .4byte 0x03005AEC
	thumb_func_end sub_0813B9D8

	thumb_func_start sub_0813B9F8
sub_0813B9F8: @ 0x0813B9F8
	push {r4, lr}
	ldr r0, _0813BA28
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	lsls r1, r1, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _0813BA2C
	ldrh r0, [r2]
	ldr r1, _0813BA30
	cmp r0, r1
	beq _0813BA3E
	adds r4, r1, #0
	adds r1, r2, #0
_0813BA1E:
	ldrh r0, [r2]
	cmp r0, r3
	bne _0813BA34
	movs r0, #1
	b _0813BA40
	.align 2, 0
_0813BA28: .4byte 0x03005AEC
_0813BA2C: .4byte 0x08592EA0
_0813BA30: .4byte 0x0000FFFF
_0813BA34:
	adds r1, #2
	adds r2, #2
	ldrh r0, [r1]
	cmp r0, r4
	bne _0813BA1E
_0813BA3E:
	movs r0, #0
_0813BA40:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0813B9F8

	thumb_func_start ResetFanClub
ResetFanClub: @ 0x0813BA48
	ldr r0, _0813BA60
	ldr r0, [r0]
	ldr r2, _0813BA64
	adds r1, r0, r2
	movs r2, #0
	strh r2, [r1]
	movs r1, #0xa1
	lsls r1, r1, #5
	adds r0, r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_0813BA60: .4byte 0x03005AEC
_0813BA64: .4byte 0x0000141E
	thumb_func_end ResetFanClub

	thumb_func_start sub_0813BA68
sub_0813BA68: @ 0x0813BA68
	push {lr}
	bl sub_0813BF68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813BA8A
	bl UpdateMovedLilycoveFanClubMembers
	ldr r0, _0813BA90
	ldr r1, [r0]
	ldr r0, _0813BA94
	ldr r0, [r0]
	ldrh r0, [r0, #0xe]
	movs r2, #0xa1
	lsls r2, r2, #5
	adds r1, r1, r2
	strh r0, [r1]
_0813BA8A:
	pop {r0}
	bx r0
	.align 2, 0
_0813BA90: .4byte 0x03005AEC
_0813BA94: .4byte 0x03005AF0
	thumb_func_end sub_0813BA68

	thumb_func_start sub_0813BA98
sub_0813BA98: @ 0x0813BA98
	push {r4, lr}
	ldr r4, _0813BAF4
	ldr r0, [r4]
	ldr r1, _0813BAF8
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0813BAEE
	bl sub_0813BF84
	bl sub_0813BDBC
	ldr r1, [r4]
	ldr r0, _0813BAFC
	ldr r0, [r0]
	ldrh r0, [r0, #0xe]
	movs r2, #0xa1
	lsls r2, r2, #5
	adds r1, r1, r2
	strh r0, [r1]
	ldr r0, _0813BB00
	bl FlagClear
	ldr r0, _0813BB04
	bl FlagClear
	ldr r0, _0813BB08
	bl FlagClear
	movs r0, #0xc6
	lsls r0, r0, #2
	bl FlagClear
	ldr r0, _0813BB0C
	bl FlagClear
	ldr r0, _0813BB10
	movs r1, #1
	bl VarSet
_0813BAEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813BAF4: .4byte 0x03005AEC
_0813BAF8: .4byte 0x0000141E
_0813BAFC: .4byte 0x03005AF0
_0813BB00: .4byte 0x00000315
_0813BB04: .4byte 0x00000316
_0813BB08: .4byte 0x00000317
_0813BB0C: .4byte 0x000002DA
_0813BB10: .4byte 0x00004095
	thumb_func_end sub_0813BA98

	thumb_func_start sub_0813BB14
sub_0813BB14: @ 0x0813BB14
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0813BB60
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _0813BB90
	ldr r4, _0813BB64
	ldr r0, [r4]
	ldr r5, _0813BB68
	adds r3, r0, r5
	ldrh r2, [r3]
	movs r1, #0x7f
	ands r1, r2
	ldr r0, _0813BB6C
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r1, r1, r0
	cmp r1, #0x13
	ble _0813BB8C
	bl GetNumMovedLilycoveFanClubMembers
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0813BB74
	bl sub_0813BBAC
	ldr r0, [r4]
	adds r0, r0, r5
	ldrh r2, [r0]
	ldr r1, _0813BB70
	ands r1, r2
	strh r1, [r0]
	b _0813BB90
	.align 2, 0
_0813BB60: .4byte 0x00004095
_0813BB64: .4byte 0x03005AEC
_0813BB68: .4byte 0x0000141E
_0813BB6C: .4byte 0x08592ECC
_0813BB70: .4byte 0x0000FF80
_0813BB74:
	ldr r2, [r4]
	adds r2, r2, r5
	ldrh r1, [r2]
	ldr r0, _0813BB88
	ands r0, r1
	movs r1, #0x14
	orrs r0, r1
	strh r0, [r2]
	b _0813BB90
	.align 2, 0
_0813BB88: .4byte 0x0000FF80
_0813BB8C:
	adds r0, r2, r0
	strh r0, [r3]
_0813BB90:
	ldr r0, _0813BBA4
	ldr r0, [r0]
	ldr r1, _0813BBA8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0813BBA4: .4byte 0x03005AEC
_0813BBA8: .4byte 0x0000141E
	thumb_func_end sub_0813BB14

	thumb_func_start sub_0813BBAC
sub_0813BBAC: @ 0x0813BBAC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r3, #0
	movs r5, #0
	ldr r7, _0813BBF4
	ldr r2, _0813BBF8
	movs r6, #1
_0813BBBA:
	ldr r0, [r7]
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r0, _0813BBFC
	adds r0, r5, r0
	ldrb r4, [r0]
	asrs r1, r4
	ands r1, r6
	cmp r1, #0
	bne _0813BC00
	adds r3, r5, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl Random
	adds r1, r6, #0
	ands r1, r0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r1, #0
	beq _0813BC00
	ldr r0, [r7]
	adds r0, r0, r2
	adds r1, r6, #0
	lsls r1, r4
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	b _0813BC22
	.align 2, 0
_0813BBF4: .4byte 0x03005AEC
_0813BBF8: .4byte 0x0000141E
_0813BBFC: .4byte 0x08592ED0
_0813BC00:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0813BBBA
	ldr r0, _0813BC2C
	ldr r2, [r0]
	ldr r0, _0813BC30
	adds r2, r2, r0
	ldr r1, _0813BC34
	adds r1, r3, r1
	movs r0, #1
	ldrb r1, [r1]
	lsls r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0813BC22:
	adds r0, r3, #0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813BC2C: .4byte 0x03005AEC
_0813BC30: .4byte 0x0000141E
_0813BC34: .4byte 0x08592ED0
	thumb_func_end sub_0813BBAC

	thumb_func_start sub_0813BC38
sub_0813BC38: @ 0x0813BC38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	bl GetNumMovedLilycoveFanClubMembers
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _0813BC66
	movs r0, #0
	b _0813BCC6
_0813BC56:
	mov r1, r8
	ldr r0, [r1]
	add r0, sb
	lsls r4, r6
	ldrh r1, [r0]
	eors r4, r1
	strh r4, [r0]
	b _0813BCC4
_0813BC66:
	movs r5, #0
	ldr r2, _0813BCD4
	mov r8, r2
	ldr r0, _0813BCD8
	mov sb, r0
	movs r4, #1
_0813BC72:
	mov r1, r8
	ldr r0, [r1]
	add r0, sb
	ldrh r1, [r0]
	ldr r7, _0813BCDC
	adds r0, r5, r7
	ldrb r6, [r0]
	asrs r1, r6
	ands r1, r4
	cmp r1, #0
	beq _0813BC96
	mov sl, r5
	bl Random
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	bne _0813BC56
_0813BC96:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0813BC72
	ldr r0, _0813BCD4
	ldr r0, [r0]
	ldr r2, _0813BCD8
	adds r4, r0, r2
	ldrh r1, [r4]
	mov r2, sl
	adds r0, r2, r7
	ldrb r2, [r0]
	adds r0, r1, #0
	asrs r0, r2
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _0813BCC4
	adds r0, r3, #0
	lsls r0, r2
	eors r1, r0
	strh r1, [r4]
_0813BCC4:
	mov r0, sl
_0813BCC6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813BCD4: .4byte 0x03005AEC
_0813BCD8: .4byte 0x0000141E
_0813BCDC: .4byte 0x08592ED8
	thumb_func_end sub_0813BC38

	thumb_func_start GetNumMovedLilycoveFanClubMembers
GetNumMovedLilycoveFanClubMembers: @ 0x0813BCE0
	push {r4, r5, lr}
	movs r3, #0
	movs r2, #0
	ldr r0, _0813BD18
	ldr r0, [r0]
	ldr r1, _0813BD1C
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r5, #1
_0813BCF2:
	adds r1, r2, #0
	adds r1, #8
	adds r0, r4, #0
	asrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _0813BD06
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0813BD06:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _0813BCF2
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0813BD18: .4byte 0x03005AEC
_0813BD1C: .4byte 0x0000141E
	thumb_func_end GetNumMovedLilycoveFanClubMembers

	thumb_func_start UpdateMovedLilycoveFanClubMembers
UpdateMovedLilycoveFanClubMembers: @ 0x0813BD20
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _0813BD34
	ldr r0, [r2]
	ldrh r1, [r0, #0xe]
	ldr r0, _0813BD38
	cmp r1, r0
	bhi _0813BD90
	adds r6, r2, #0
	b _0813BD6A
	.align 2, 0
_0813BD34: .4byte 0x03005AF0
_0813BD38: .4byte 0x000003E6
_0813BD3C:
	ldr r0, [r6]
	ldrh r1, [r0, #0xe]
	ldr r4, _0813BD88
	ldr r0, [r4]
	movs r2, #0xa1
	lsls r2, r2, #5
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	cmp r1, #0xb
	ble _0813BD90
	bl sub_0813BC38
	ldr r0, [r4]
	movs r1, #0xa1
	lsls r1, r1, #5
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #0xc
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0813BD6A:
	bl GetNumMovedLilycoveFanClubMembers
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bhi _0813BD8C
	ldr r0, _0813BD88
	ldr r1, [r0]
	ldr r0, [r6]
	ldrh r0, [r0, #0xe]
	movs r2, #0xa1
	lsls r2, r2, #5
	adds r1, r1, r2
	strh r0, [r1]
	b _0813BD90
	.align 2, 0
_0813BD88: .4byte 0x03005AEC
_0813BD8C:
	cmp r5, #8
	bne _0813BD3C
_0813BD90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateMovedLilycoveFanClubMembers

	thumb_func_start ShouldMoveLilycoveFanClubMember
ShouldMoveLilycoveFanClubMember: @ 0x0813BD98
	ldr r0, _0813BDB0
	ldr r0, [r0]
	ldr r1, _0813BDB4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0813BDB8
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0813BDB0: .4byte 0x03005AEC
_0813BDB4: .4byte 0x0000141E
_0813BDB8: .4byte 0x02037280
	thumb_func_end ShouldMoveLilycoveFanClubMember

	thumb_func_start sub_0813BDBC
sub_0813BDBC: @ 0x0813BDBC
	ldr r0, _0813BDE4
	ldr r2, [r0]
	ldr r0, _0813BDE8
	adds r2, r2, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	orrs r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0813BDE4: .4byte 0x03005AEC
_0813BDE8: .4byte 0x0000141E
	thumb_func_end sub_0813BDBC

	thumb_func_start BufferStreakTrainerText
BufferStreakTrainerText: @ 0x0813BDEC
	push {lr}
	movs r3, #0
	movs r2, #0
	ldr r0, _0813BE08
	ldrh r0, [r0]
	subs r0, #8
	cmp r0, #7
	bhi _0813BE4C
	lsls r0, r0, #2
	ldr r1, _0813BE0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813BE08: .4byte 0x02037280
_0813BE0C: .4byte 0x0813BE10
_0813BE10: @ jump table
	.4byte _0813BE4C @ case 0
	.4byte _0813BE4C @ case 1
	.4byte _0813BE30 @ case 2
	.4byte _0813BE36 @ case 3
	.4byte _0813BE3C @ case 4
	.4byte _0813BE42 @ case 5
	.4byte _0813BE48 @ case 6
	.4byte _0813BE4C @ case 7
_0813BE30:
	movs r3, #0
	movs r2, #3
	b _0813BE4C
_0813BE36:
	movs r3, #0
	movs r2, #1
	b _0813BE4C
_0813BE3C:
	movs r3, #1
	movs r2, #0
	b _0813BE4C
_0813BE42:
	movs r3, #0
	movs r2, #4
	b _0813BE4C
_0813BE48:
	movs r3, #1
	movs r2, #5
_0813BE4C:
	ldr r0, _0813BE60
	ldr r0, [r0]
	ldr r1, _0813BE64
	adds r0, r0, r1
	adds r1, r3, #0
	bl sub_0813BE68
	pop {r0}
	bx r0
	.align 2, 0
_0813BE60: .4byte 0x03005AEC
_0813BE64: .4byte 0x00003150
	thumb_func_end BufferStreakTrainerText

	thumb_func_start sub_0813BE68
sub_0813BE68: @ 0x0813BE68
	push {r4, lr}
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsrs r1, r1, #0x14
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0813BF1C
	cmp r2, #5
	bhi _0813BF08
	lsls r0, r2, #2
	ldr r1, _0813BE88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813BE88: .4byte 0x0813BE8C
_0813BE8C: @ jump table
	.4byte _0813BF08 @ case 0
	.4byte _0813BEA4 @ case 1
	.4byte _0813BEB8 @ case 2
	.4byte _0813BECC @ case 3
	.4byte _0813BEE0 @ case 4
	.4byte _0813BEF4 @ case 5
_0813BEA4:
	ldr r0, _0813BEB0
	ldr r1, _0813BEB4
	bl StringCopy
	b _0813BF2A
	.align 2, 0
_0813BEB0: .4byte 0x02021C40
_0813BEB4: .4byte 0x085CA9E8
_0813BEB8:
	ldr r0, _0813BEC4
	ldr r1, _0813BEC8
	bl StringCopy
	b _0813BF2A
	.align 2, 0
_0813BEC4: .4byte 0x02021C40
_0813BEC8: .4byte 0x085CA9EC
_0813BECC:
	ldr r0, _0813BED8
	ldr r1, _0813BEDC
	bl StringCopy
	b _0813BF2A
	.align 2, 0
_0813BED8: .4byte 0x02021C40
_0813BEDC: .4byte 0x085CA9F0
_0813BEE0:
	ldr r0, _0813BEEC
	ldr r1, _0813BEF0
	bl StringCopy
	b _0813BF2A
	.align 2, 0
_0813BEEC: .4byte 0x02021C40
_0813BEF0: .4byte 0x085CA9F3
_0813BEF4:
	ldr r0, _0813BF00
	ldr r1, _0813BF04
	bl StringCopy
	b _0813BF2A
	.align 2, 0
_0813BF00: .4byte 0x02021C40
_0813BF04: .4byte 0x085CA9F7
_0813BF08:
	ldr r0, _0813BF14
	ldr r1, _0813BF18
	bl StringCopy
	b _0813BF2A
	.align 2, 0
_0813BF14: .4byte 0x02021C40
_0813BF18: .4byte 0x085CA9E4
_0813BF1C:
	ldr r4, _0813BF30
	adds r0, r4, #0
	movs r2, #7
	bl StringCopyN
	movs r0, #0xff
	strb r0, [r4, #7]
_0813BF2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813BF30: .4byte 0x02021C40
	thumb_func_end sub_0813BE68

	thumb_func_start sub_0813BF34
sub_0813BF34: @ 0x0813BF34
	push {lr}
	ldr r0, _0813BF58
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _0813BF64
	bl sub_0813BA68
	ldr r0, _0813BF5C
	ldrb r0, [r0]
	cmp r0, #1
	bne _0813BF60
	bl sub_0813BBAC
	b _0813BF64
	.align 2, 0
_0813BF58: .4byte 0x00004095
_0813BF5C: .4byte 0x02023FDE
_0813BF60:
	bl sub_0813BC38
_0813BF64:
	pop {r0}
	bx r0
	thumb_func_end sub_0813BF34

	thumb_func_start sub_0813BF68
sub_0813BF68: @ 0x0813BF68
	ldr r0, _0813BF7C
	ldr r0, [r0]
	ldr r1, _0813BF80
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0813BF7C: .4byte 0x03005AEC
_0813BF80: .4byte 0x0000141E
	thumb_func_end sub_0813BF68

	thumb_func_start sub_0813BF84
sub_0813BF84: @ 0x0813BF84
	ldr r0, _0813BF98
	ldr r1, [r0]
	ldr r0, _0813BF9C
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r0, #0x80
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0813BF98: .4byte 0x03005AEC
_0813BF9C: .4byte 0x0000141E
	thumb_func_end sub_0813BF84

	thumb_func_start sub_0813BFA0
sub_0813BFA0: @ 0x0813BFA0
	push {lr}
	ldr r0, _0813BFB4
	ldrb r0, [r0]
	bl sub_0813BB14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0813BFB4: .4byte 0x02037280
	thumb_func_end sub_0813BFA0

