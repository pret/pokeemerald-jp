.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CallBattlePikeFunction
CallBattlePikeFunction: @ 0x081A6DD4
	push {lr}
	ldr r1, _081A6DEC
	ldr r0, _081A6DF0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end CallBattlePikeFunction

	thumb_func_start nullsub_76
nullsub_76: @ 0x081A6DE8
	bx r0
	.align 2, 0
_081A6DEC: .4byte 0x085DDE30
_081A6DF0: .4byte 0x02037280
	thumb_func_end nullsub_76

	thumb_func_start SetRoomType
SetRoomType: @ 0x081A6DF4
	push {lr}
	bl GetNextRoomType
	ldr r1, _081A6E04
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081A6E04: .4byte 0x03001288
	thumb_func_end SetRoomType

	thumb_func_start SetupRoomEventObjects
SetupRoomEventObjects: @ 0x081A6E08
	push {r4, r5, r6, r7, lr}
	movs r4, #1
	movs r6, #0
	movs r5, #0
	movs r7, #0
	ldr r0, _081A6E24
	ldrb r0, [r0]
	cmp r0, #8
	bhi _081A6EB2
	lsls r0, r0, #2
	ldr r1, _081A6E28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A6E24: .4byte 0x03001288
_081A6E28: .4byte 0x081A6E2C
_081A6E2C: @ jump table
	.4byte _081A6E50 @ case 0
	.4byte _081A6E5A @ case 1
	.4byte _081A6E5E @ case 2
	.4byte _081A6E68 @ case 3
	.4byte _081A6E7C @ case 4
	.4byte _081A6E56 @ case 5
	.4byte _081A6E80 @ case 6
	.4byte _081A6E88 @ case 7
	.4byte _081A6E8E @ case 8
_081A6E50:
	movs r0, #0
	bl PrepareOneTrainer
_081A6E56:
	movs r4, #0
	b _081A6E9A
_081A6E5A:
	movs r5, #0x1c
	b _081A6E9A
_081A6E5E:
	bl GetNPCRoomGraphicsId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _081A6E9A
_081A6E68:
	movs r5, #0x30
	ldr r0, _081A6E78
	ldrb r0, [r0]
	movs r7, #0xe1
	cmp r0, #1
	bne _081A6E98
	movs r7, #0xe2
	b _081A6E98
	.align 2, 0
_081A6E78: .4byte 0x03001289
_081A6E7C:
	movs r5, #0x30
	b _081A6E9A
_081A6E80:
	movs r0, #1
	bl PrepareOneTrainer
	b _081A6E94
_081A6E88:
	bl PrepareTwoTrainers
	b _081A6E56
_081A6E8E:
	movs r0, #5
	bl SetFrontierBrainEventObjGfx
_081A6E94:
	movs r7, #0x1c
	movs r4, #0
_081A6E98:
	movs r6, #1
_081A6E9A:
	cmp r4, #1
	bne _081A6EA6
	ldr r0, _081A6EB8
	adds r1, r5, #0
	bl VarSet
_081A6EA6:
	cmp r6, #1
	bne _081A6EB2
	ldr r0, _081A6EBC
	adds r1, r7, #0
	bl VarSet
_081A6EB2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A6EB8: .4byte 0x00004010
_081A6EBC: .4byte 0x00004011
	thumb_func_end SetupRoomEventObjects

	thumb_func_start GetBattlePikeData
GetBattlePikeData: @ 0x081A6EC0
	push {lr}
	ldr r1, _081A6EE4
	ldr r0, [r1]
	ldr r2, _081A6EE8
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r2, r0, #0x1e
	ldr r0, _081A6EEC
	ldrh r0, [r0]
	adds r3, r1, #0
	cmp r0, #4
	bhi _081A6FBA
	lsls r0, r0, #2
	ldr r1, _081A6EF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A6EE4: .4byte 0x03005AF0
_081A6EE8: .4byte 0x00000CA9
_081A6EEC: .4byte 0x02037282
_081A6EF0: .4byte 0x081A6EF4
_081A6EF4: @ jump table
	.4byte _081A6F08 @ case 0
	.4byte _081A6F20 @ case 1
	.4byte _081A6F44 @ case 2
	.4byte _081A6F68 @ case 3
	.4byte _081A6F8C @ case 4
_081A6F08:
	ldr r0, _081A6F18
	ldr r1, [r3]
	ldr r3, _081A6F1C
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r0]
	b _081A6FBA
	.align 2, 0
_081A6F18: .4byte 0x02037290
_081A6F1C: .4byte 0x00000E02
_081A6F20:
	ldr r2, _081A6F38
	ldr r1, [r3]
	ldr r3, _081A6F3C
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	ldr r3, _081A6F40
	adds r1, r1, r3
	adds r1, r1, r0
	ldrh r0, [r1]
	b _081A6FB8
	.align 2, 0
_081A6F38: .4byte 0x02037290
_081A6F3C: .4byte 0x00000CA9
_081A6F40: .4byte 0x00000E04
_081A6F44:
	ldr r2, _081A6F5C
	ldr r1, [r3]
	ldr r3, _081A6F60
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	ldr r3, _081A6F64
	adds r1, r1, r3
	adds r1, r1, r0
	ldrh r0, [r1]
	b _081A6FB8
	.align 2, 0
_081A6F5C: .4byte 0x02037290
_081A6F60: .4byte 0x00000CA9
_081A6F64: .4byte 0x00000E08
_081A6F68:
	ldr r2, _081A6F80
	ldr r1, [r3]
	ldr r3, _081A6F84
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	ldr r3, _081A6F88
	adds r1, r1, r3
	adds r1, r1, r0
	ldrh r0, [r1]
	b _081A6FB8
	.align 2, 0
_081A6F80: .4byte 0x02037290
_081A6F84: .4byte 0x00000CA9
_081A6F88: .4byte 0x00000E0C
_081A6F8C:
	cmp r2, #0
	beq _081A6FA8
	ldr r2, _081A6FA0
	ldr r0, [r3]
	ldr r1, _081A6FA4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	b _081A6FB6
	.align 2, 0
_081A6FA0: .4byte 0x02037290
_081A6FA4: .4byte 0x00000CDC
_081A6FA8:
	ldr r2, _081A6FC0
	ldr r0, [r3]
	ldr r3, _081A6FC4
	adds r0, r0, r3
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
_081A6FB6:
	ands r0, r1
_081A6FB8:
	strh r0, [r2]
_081A6FBA:
	pop {r0}
	bx r0
	.align 2, 0
_081A6FC0: .4byte 0x02037290
_081A6FC4: .4byte 0x00000CDC
	thumb_func_end GetBattlePikeData

	thumb_func_start SetBattlePikeData
SetBattlePikeData: @ 0x081A6FC8
	push {r4, r5, lr}
	ldr r1, _081A6FF0
	ldr r0, [r1]
	ldr r2, _081A6FF4
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r3, r0, #0x1e
	ldr r0, _081A6FF8
	ldrh r0, [r0]
	adds r2, r1, #0
	cmp r0, #4
	bls _081A6FE4
	b _081A712A
_081A6FE4:
	lsls r0, r0, #2
	ldr r1, _081A6FFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A6FF0: .4byte 0x03005AF0
_081A6FF4: .4byte 0x00000CA9
_081A6FF8: .4byte 0x02037282
_081A6FFC: .4byte 0x081A7000
_081A7000: @ jump table
	.4byte _081A7014 @ case 0
	.4byte _081A702C @ case 1
	.4byte _081A7058 @ case 2
	.4byte _081A7094 @ case 3
	.4byte _081A70C4 @ case 4
_081A7014:
	ldr r0, [r2]
	ldr r1, _081A7024
	ldrh r1, [r1]
	ldr r5, _081A7028
	adds r0, r0, r5
	strh r1, [r0]
	b _081A712A
	.align 2, 0
_081A7024: .4byte 0x02037284
_081A7028: .4byte 0x00000E02
_081A702C:
	ldr r0, _081A7048
	ldrh r3, [r0]
	ldr r0, _081A704C
	cmp r3, r0
	bls _081A7038
	b _081A712A
_081A7038:
	ldr r0, [r2]
	ldr r2, _081A7050
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1d
	ldr r5, _081A7054
	b _081A70AC
	.align 2, 0
_081A7048: .4byte 0x02037284
_081A704C: .4byte 0x0000270F
_081A7050: .4byte 0x00000CA9
_081A7054: .4byte 0x00000E04
_081A7058:
	ldr r0, _081A7084
	ldrh r4, [r0]
	adds r3, r4, #0
	ldr r0, _081A7088
	cmp r3, r0
	bhi _081A712A
	ldr r1, [r2]
	ldr r2, _081A708C
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r2, r0, #0x1e
	lsrs r0, r2, #0x1d
	ldr r5, _081A7090
	adds r1, r1, r5
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, r3
	bhs _081A712A
	lsrs r0, r2, #0x1d
	adds r0, r1, r0
	strh r4, [r0]
	b _081A712A
	.align 2, 0
_081A7084: .4byte 0x02037284
_081A7088: .4byte 0x0000270F
_081A708C: .4byte 0x00000CA9
_081A7090: .4byte 0x00000E08
_081A7094:
	ldr r0, _081A70B4
	ldrh r3, [r0]
	ldr r0, _081A70B8
	cmp r3, r0
	bhi _081A712A
	ldr r0, [r2]
	ldr r2, _081A70BC
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1d
	ldr r5, _081A70C0
_081A70AC:
	adds r0, r0, r5
	adds r0, r0, r1
	strh r3, [r0]
	b _081A712A
	.align 2, 0
_081A70B4: .4byte 0x02037284
_081A70B8: .4byte 0x0000270F
_081A70BC: .4byte 0x00000CA9
_081A70C0: .4byte 0x00000E0C
_081A70C4:
	cmp r3, #0
	beq _081A70FC
	ldr r0, _081A70E0
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A70E8
	ldr r0, [r2]
	ldr r1, _081A70E4
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	orrs r1, r2
	b _081A7128
	.align 2, 0
_081A70E0: .4byte 0x02037284
_081A70E4: .4byte 0x00000CDC
_081A70E8:
	ldr r0, [r2]
	ldr r2, _081A70F4
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r2, _081A70F8
	b _081A7126
	.align 2, 0
_081A70F4: .4byte 0x00000CDC
_081A70F8: .4byte 0xFFFFF7FF
_081A70FC:
	ldr r0, _081A7114
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A711C
	ldr r0, [r2]
	ldr r5, _081A7118
	adds r0, r0, r5
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	b _081A7128
	.align 2, 0
_081A7114: .4byte 0x02037284
_081A7118: .4byte 0x00000CDC
_081A711C:
	ldr r0, [r2]
	ldr r1, _081A7130
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _081A7134
_081A7126:
	ands r1, r2
_081A7128:
	str r1, [r0]
_081A712A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A7130: .4byte 0x00000CDC
_081A7134: .4byte 0xFFFFFBFF
	thumb_func_end SetBattlePikeData

	thumb_func_start GetInFinalRoom
GetInFinalRoom: @ 0x081A7138
	push {lr}
	ldr r0, _081A7150
	ldr r0, [r0]
	ldr r1, _081A7154
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xe
	bls _081A715C
	ldr r1, _081A7158
	movs r0, #1
	b _081A7160
	.align 2, 0
_081A7150: .4byte 0x03005AF0
_081A7154: .4byte 0x00000CB2
_081A7158: .4byte 0x02037290
_081A715C:
	ldr r1, _081A7168
	movs r0, #0
_081A7160:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081A7168: .4byte 0x02037290
	thumb_func_end GetInFinalRoom

	thumb_func_start GetRoomType
GetRoomType: @ 0x081A716C
	ldr r0, _081A7178
	ldr r1, _081A717C
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_081A7178: .4byte 0x02037290
_081A717C: .4byte 0x03001288
	thumb_func_end GetRoomType

	thumb_func_start sub_081A7180
sub_081A7180: @ 0x081A7180
	ldr r1, _081A7188
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_081A7188: .4byte 0x0300128A
	thumb_func_end sub_081A7180

	thumb_func_start sub_081A718C
sub_081A718C: @ 0x081A718C
	ldr r1, _081A7194
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_081A7194: .4byte 0x0300128A
	thumb_func_end sub_081A718C

	thumb_func_start sub_081A7198
sub_081A7198: @ 0x081A7198
	push {r4, lr}
	ldr r4, _081A71D0
	ldr r0, [r4]
	ldr r1, _081A71D4
	ldrh r1, [r1]
	ldr r2, _081A71D8
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _081A71DC
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	bl save_serialize_map
	movs r0, #1
	bl TrySavingData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A71D0: .4byte 0x03005AF0
_081A71D4: .4byte 0x02037282
_081A71D8: .4byte 0x00000CA8
_081A71DC: .4byte 0x00000CA9
	thumb_func_end sub_081A7198

	thumb_func_start sub_081A71E0
sub_081A71E0: @ 0x081A71E0
	bx lr
	.align 2, 0
	thumb_func_end sub_081A71E0

	thumb_func_start nullsub_124
nullsub_124: @ 0x081A71E4
	bx lr
	.align 2, 0
	thumb_func_end nullsub_124

	thumb_func_start GetRoomInflictedStatus
GetRoomInflictedStatus: @ 0x081A71E8
	push {lr}
	ldr r0, _081A7200
	ldr r0, [r0]
	cmp r0, #0x20
	beq _081A720E
	cmp r0, #0x20
	bhi _081A7204
	cmp r0, #7
	beq _081A723C
	cmp r0, #0x10
	beq _081A7218
	b _081A7242
	.align 2, 0
_081A7200: .4byte 0x0300128C
_081A7204:
	cmp r0, #0x40
	beq _081A7230
	cmp r0, #0x80
	beq _081A7224
	b _081A7242
_081A720E:
	ldr r1, _081A7214
	movs r0, #0
	b _081A7240
	.align 2, 0
_081A7214: .4byte 0x02037290
_081A7218:
	ldr r1, _081A7220
	movs r0, #1
	b _081A7240
	.align 2, 0
_081A7220: .4byte 0x02037290
_081A7224:
	ldr r1, _081A722C
	movs r0, #2
	b _081A7240
	.align 2, 0
_081A722C: .4byte 0x02037290
_081A7230:
	ldr r1, _081A7238
	movs r0, #3
	b _081A7240
	.align 2, 0
_081A7238: .4byte 0x02037290
_081A723C:
	ldr r1, _081A7248
	movs r0, #4
_081A7240:
	strh r0, [r1]
_081A7242:
	pop {r0}
	bx r0
	.align 2, 0
_081A7248: .4byte 0x02037290
	thumb_func_end GetRoomInflictedStatus

	thumb_func_start GetRoomInflictedStatusMon
GetRoomInflictedStatusMon: @ 0x081A724C
	ldr r0, _081A7258
	ldr r1, _081A725C
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_081A7258: .4byte 0x02037290
_081A725C: .4byte 0x03001289
	thumb_func_end GetRoomInflictedStatusMon

	thumb_func_start HealOneOrTwoMons
HealOneOrTwoMons: @ 0x081A7260
	push {r4, lr}
	bl Random
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	ands r4, r0
	adds r4, #1
	adds r0, r4, #0
	bl TryHealMons
	ldr r0, _081A7284
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A7284: .4byte 0x02037290
	thumb_func_end HealOneOrTwoMons

	thumb_func_start BufferNPCMessage
BufferNPCMessage: @ 0x081A7288
	push {lr}
	ldr r0, _081A72A8
	ldr r0, [r0]
	ldr r1, _081A72AC
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #4
	bhi _081A72B8
	ldr r1, _081A72B0
	ldr r0, _081A72B4
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	b _081A72E0
	.align 2, 0
_081A72A8: .4byte 0x03005AF0
_081A72AC: .4byte 0x00000CB2
_081A72B0: .4byte 0x085DDB54
_081A72B4: .4byte 0x03001290
_081A72B8:
	cmp r0, #0xa
	bhi _081A72D4
	ldr r1, _081A72CC
	ldr r0, _081A72D0
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #3]
	b _081A72E0
	.align 2, 0
_081A72CC: .4byte 0x085DDB54
_081A72D0: .4byte 0x03001290
_081A72D4:
	ldr r1, _081A72F4
	ldr r0, _081A72F8
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #4]
_081A72E0:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081A72FC
	adds r0, r0, r1
	bl FrontierSpeechToString
	pop {r0}
	bx r0
	.align 2, 0
_081A72F4: .4byte 0x085DDB54
_081A72F8: .4byte 0x03001290
_081A72FC: .4byte 0x085DDC1C
	thumb_func_end BufferNPCMessage

	thumb_func_start StatusInflictionScreenFade
StatusInflictionScreenFade: @ 0x081A7300
	push {lr}
	ldr r0, _081A7310
	movs r1, #2
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081A7310: .4byte 0x081A7C65
	thumb_func_end StatusInflictionScreenFade

	thumb_func_start HealMon
HealMon: @ 0x081A7314
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	movs r1, #0
_081A731E:
	mov r2, sp
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081A731E
	adds r0, r5, #0
	movs r1, #0x3a
	bl GetMonData
	lsls r2, r0, #0x10
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	lsrs r2, r2, #0x18
	strb r2, [r0, #1]
	adds r0, r5, #0
	movs r1, #0x39
	mov r2, sp
	bl SetMonData
	adds r0, r5, #0
	movs r1, #0x15
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
_081A735A:
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r5, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r2, r4, #0
	bl CalculatePPWithBonus
	mov r1, sp
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x11
	adds r0, r5, #0
	mov r2, sp
	bl SetMonData
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081A735A
	mov r0, sp
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	adds r0, r5, #0
	movs r1, #0x37
	mov r2, sp
	bl SetMonData
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end HealMon

	thumb_func_start DoesAbilityPreventStatus
DoesAbilityPreventStatus: @ 0x081A73A8
	push {r4, lr}
	adds r4, r1, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	cmp r4, #0x20
	beq _081A73D2
	cmp r4, #0x20
	bhi _081A73C8
	cmp r4, #7
	beq _081A73E4
	cmp r4, #0x10
	beq _081A73D8
	b _081A73F4
_081A73C8:
	cmp r4, #0x40
	beq _081A73DE
	cmp r4, #0x80
	beq _081A73EE
	b _081A73F4
_081A73D2:
	cmp r0, #0x28
	bne _081A73F4
	b _081A73F2
_081A73D8:
	cmp r0, #0x29
	bne _081A73F4
	b _081A73F2
_081A73DE:
	cmp r0, #7
	bne _081A73F4
	b _081A73F2
_081A73E4:
	cmp r0, #0xf
	beq _081A73F2
	cmp r0, #0x48
	bne _081A73F4
	b _081A73F2
_081A73EE:
	cmp r0, #0x11
	bne _081A73F4
_081A73F2:
	movs r1, #1
_081A73F4:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoesAbilityPreventStatus

	thumb_func_start DoesTypePreventStatus
DoesTypePreventStatus: @ 0x081A73FC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r3, #0
	cmp r1, #0x20
	beq _081A7444
	cmp r1, #0x20
	bhi _081A7416
	cmp r1, #7
	beq _081A749C
	cmp r1, #0x10
	beq _081A7484
	b _081A749C
_081A7416:
	cmp r1, #0x40
	beq _081A7460
	cmp r1, #0x80
	bne _081A749C
	ldr r1, _081A7440
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #6]
	cmp r2, #8
	beq _081A749A
	cmp r2, #3
	beq _081A749A
	ldrb r0, [r0, #7]
	cmp r0, #8
	beq _081A749A
	cmp r0, #3
	bne _081A749C
	b _081A749A
	.align 2, 0
_081A7440: .4byte 0x082F0D54
_081A7444:
	ldr r0, _081A745C
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #6]
	cmp r0, #0xf
	beq _081A749A
	ldrb r0, [r1, #7]
	cmp r0, #0xf
	bne _081A749C
	b _081A749A
	.align 2, 0
_081A745C: .4byte 0x082F0D54
_081A7460:
	ldr r1, _081A7480
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #6]
	cmp r2, #4
	beq _081A749A
	cmp r2, #0xd
	beq _081A749A
	ldrb r0, [r0, #7]
	cmp r0, #4
	beq _081A749A
	cmp r0, #0xd
	bne _081A749C
	b _081A749A
	.align 2, 0
_081A7480: .4byte 0x082F0D54
_081A7484:
	ldr r0, _081A74A4
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #6]
	cmp r0, #0xa
	beq _081A749A
	ldrb r0, [r1, #7]
	cmp r0, #0xa
	bne _081A749C
_081A749A:
	movs r3, #1
_081A749C:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_081A74A4: .4byte 0x082F0D54
	thumb_func_end DoesTypePreventStatus

	thumb_func_start TryInflictRandomStatus
TryInflictRandomStatus: @ 0x081A74A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r6, #0
_081A74B6:
	mov r1, sp
	adds r0, r1, r6
	strb r6, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _081A74B6
	movs r4, #0
	mov r8, r4
_081A74CA:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	adds r2, r1, r6
	ldrb r3, [r2]
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #9
	bls _081A74CA
	ldr r0, _081A7550
	ldr r0, [r0]
	ldr r4, _081A7554
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #1
	mov sl, r1
	cmp r0, #4
	bls _081A7528
	movs r4, #3
	mov sl, r4
	cmp r0, #9
	bhi _081A7528
	movs r0, #2
	mov sl, r0
_081A7528:
	movs r1, #0
	str r1, [sp, #4]
	ldr r7, _081A7558
_081A752E:
	movs r4, #0
	mov sb, r4
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x22
	bhi _081A755C
	movs r0, #0x80
	b _081A757C
	.align 2, 0
_081A7550: .4byte 0x03005AF0
_081A7554: .4byte 0x00000CB2
_081A7558: .4byte 0x0300128C
_081A755C:
	cmp r0, #0x3b
	bhi _081A7564
	movs r0, #0x20
	b _081A757C
_081A7564:
	cmp r0, #0x4f
	bhi _081A756C
	movs r0, #0x40
	b _081A757C
_081A756C:
	cmp r1, #0x59
	bhi _081A757A
	movs r0, #7
	b _081A757C
_081A7574:
	movs r0, #1
	mov sb, r0
	b _081A75EE
_081A757A:
	movs r0, #0x10
_081A757C:
	str r0, [r7]
	ldr r0, _081A7610
	ldr r0, [r0]
	ldr r1, [sp, #4]
	cmp r1, r0
	beq _081A75F4
	str r0, [sp, #4]
	movs r4, #0
	mov r8, r4
	movs r6, #0
_081A7590:
	mov r1, sp
	adds r0, r1, r6
	ldrb r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081A7614
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A75E0
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _081A75E0
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, [r7]
	adds r0, r4, #0
	bl DoesTypePreventStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A7574
_081A75E0:
	cmp r8, sl
	beq _081A75EE
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _081A7590
_081A75EE:
	mov r4, r8
	cmp r4, #0
	beq _081A764C
_081A75F4:
	mov r0, sb
	cmp r0, #0
	beq _081A752E
	ldr r0, _081A7610
	ldr r0, [r0]
	cmp r0, #0x20
	beq _081A7618
	cmp r0, #0x20
	bhi _081A7650
	cmp r0, #7
	beq _081A7650
	cmp r0, #0x10
	beq _081A7624
	b _081A7650
	.align 2, 0
_081A7610: .4byte 0x0300128C
_081A7614: .4byte 0x02024190
_081A7618:
	ldr r1, _081A7620
	movs r0, #1
	b _081A7654
	.align 2, 0
_081A7620: .4byte 0x03001289
_081A7624:
	bl Random
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #1
	ands r1, r2
	cmp r1, #0
	beq _081A7640
	ldr r0, _081A763C
	strb r2, [r0]
	b _081A7656
	.align 2, 0
_081A763C: .4byte 0x03001289
_081A7640:
	ldr r0, _081A7648
	strb r1, [r0]
	b _081A7656
	.align 2, 0
_081A7648: .4byte 0x03001289
_081A764C:
	movs r0, #0
	b _081A76D6
_081A7650:
	ldr r1, _081A76E8
	movs r0, #0
_081A7654:
	strb r0, [r1]
_081A7656:
	movs r1, #0
	mov r8, r1
	movs r6, #0
_081A765C:
	mov r4, sp
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081A76EC
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A76C6
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _081A76C6
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r7, _081A76F0
	ldr r1, [r7]
	adds r0, r5, #0
	bl DoesAbilityPreventStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A76C6
	ldr r1, [r7]
	adds r0, r4, #0
	bl DoesTypePreventStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A76C6
	adds r0, r5, #0
	movs r1, #0x37
	adds r2, r7, #0
	bl SetMonData
_081A76C6:
	cmp r8, sl
	beq _081A76D4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _081A765C
_081A76D4:
	movs r0, #1
_081A76D6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081A76E8: .4byte 0x03001289
_081A76EC: .4byte 0x02024190
_081A76F0: .4byte 0x0300128C
	thumb_func_end TryInflictRandomStatus

	thumb_func_start AtLeastOneHealthyMon
AtLeastOneHealthyMon: @ 0x081A76F4
	push {r4, r5, r6, r7, lr}
	ldr r0, _081A7714
	ldr r0, [r0]
	ldr r1, _081A7718
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r7, #1
	cmp r0, #4
	bls _081A770E
	movs r7, #3
	cmp r0, #9
	bhi _081A770E
	movs r7, #2
_081A770E:
	movs r6, #0
	movs r5, #0
	b _081A7722
	.align 2, 0
_081A7714: .4byte 0x03005AF0
_081A7718: .4byte 0x00000CB2
_081A771C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_081A7722:
	cmp r5, #2
	bhi _081A7758
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081A7760
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A7754
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _081A7754
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_081A7754:
	cmp r6, r7
	bne _081A771C
_081A7758:
	cmp r6, #0
	beq _081A7764
	movs r0, #1
	b _081A7766
	.align 2, 0
_081A7760: .4byte 0x02024190
_081A7764:
	movs r0, #0
_081A7766:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end AtLeastOneHealthyMon

	thumb_func_start GetNextRoomType
GetNextRoomType: @ 0x081A776C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _081A778C
	ldr r0, [r1]
	movs r4, #0xe1
	lsls r4, r4, #4
	adds r0, r0, r4
	ldrb r2, [r0]
	movs r3, #0x78
	ands r3, r2
	adds r5, r1, #0
	cmp r3, #0x40
	bne _081A7790
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1c
	b _081A78C8
	.align 2, 0
_081A778C: .4byte 0x03005AF0
_081A7790:
	ldr r0, _081A77B0
	lsls r1, r2, #0x1d
	ldrh r0, [r0]
	lsrs r1, r1, #0x1d
	cmp r0, r1
	bne _081A77B4
	cmp r3, #0x18
	bne _081A77A4
	bl TryInflictRandomStatus
_081A77A4:
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1c
	b _081A78C8
	.align 2, 0
_081A77B0: .4byte 0x02037286
_081A77B4:
	movs r2, #0
	ldr r3, _081A78D0
	movs r1, #0
_081A77BA:
	mov r4, sp
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _081A77BA
	movs r4, #8
	ldr r0, [r5]
	movs r6, #0xe1
	lsls r6, r6, #4
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1c
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r2, #0
	adds r5, r3, #0
	movs r3, #1
_081A77E4:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r1
	bne _081A77F8
	mov r6, sp
	adds r0, r6, r2
	strb r3, [r0]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081A77F8:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _081A77E4
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #1
	beq _081A7820
	bl AtLeastTwoAliveMons
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A7820
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #7]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081A7820:
	mov r0, sp
	ldrb r0, [r0, #3]
	cmp r0, #1
	beq _081A783E
	bl AtLeastOneHealthyMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A783E
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #3]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081A783E:
	ldr r0, _081A78D4
	ldr r0, [r0]
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081A787A
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _081A7866
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #1]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081A7866:
	mov r0, sp
	ldrb r0, [r0, #4]
	cmp r0, #1
	beq _081A787A
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #4]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081A787A:
	adds r0, r4, #0
	bl AllocZeroed
	adds r5, r0, #0
	movs r3, #0
	movs r2, #0
_081A7886:
	mov r6, sp
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _081A789C
	adds r1, r3, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r1, r5, r1
	strb r2, [r1]
_081A789C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _081A7886
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r5, #0
	bl Free
	cmp r4, #3
	bne _081A78C6
	bl TryInflictRandomStatus
_081A78C6:
	adds r0, r4, #0
_081A78C8:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081A78D0: .4byte 0x085DDEA4
_081A78D4: .4byte 0x03005AF0
	thumb_func_end GetNextRoomType

	thumb_func_start GetNPCRoomGraphicsId
GetNPCRoomGraphicsId: @ 0x081A78D8
	push {r4, lr}
	ldr r4, _081A78FC
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	bl __umodsi3
	strb r0, [r4]
	ldr r1, _081A7900
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081A78FC: .4byte 0x03001290
_081A7900: .4byte 0x085DDB54
	thumb_func_end GetNPCRoomGraphicsId

	thumb_func_start sub_081A7904
sub_081A7904: @ 0x081A7904
	ldr r0, _081A790C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081A790C: .4byte 0x0300128A
	thumb_func_end sub_081A7904

	thumb_func_start TryGenerateBattlePikeWildMon
TryGenerateBattlePikeWildMon: @ 0x081A7910
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	bl GetBattlePikeWildMonHeaderId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _081A798C
	ldr r0, [r7]
	ldr r4, _081A7990
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	ldr r1, _081A7994
	lsrs r0, r0, #0x1c
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _081A7998
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl SpeciesToPikeMonId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081A799C
	bl GetHighestLevelInPlayerParty
	adds r7, r0, #0
	cmp r7, #0x3b
	ble _081A7988
	lsls r0, r6, #2
	ldr r1, [sp, #4]
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	subs r7, r7, r0
	cmp r7, #0x3b
	bgt _081A79B2
_081A7988:
	movs r7, #0x3c
	b _081A79B2
	.align 2, 0
_081A798C: .4byte 0x03005AF0
_081A7990: .4byte 0x00000CA9
_081A7994: .4byte 0x085DDB4C
_081A7998: .4byte 0x020243E8
_081A799C:
	lsls r0, r6, #2
	ldr r2, [sp, #4]
	adds r0, r0, r2
	ldr r1, [r0]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #0x32
	subs r7, r0, r1
_081A79B2:
	mov r0, r8
	cmp r0, #1
	bne _081A79CA
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl CanEncounterWildMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A79CA
	movs r0, #0
	b _081A7A62
_081A79CA:
	ldr r0, _081A7A74
	ldr r1, _081A7A78
	mov r8, r1
	lsls r6, r6, #2
	mov sb, r6
	ldr r2, [sp, #4]
	add r2, sb
	mov sl, r2
	ldr r1, [r2]
	lsls r6, r5, #1
	adds r4, r6, r5
	lsls r4, r4, #2
	adds r1, r4, r1
	ldrh r2, [r1]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #0x13]
	movs r1, #0xca
	lsls r1, r1, #1
	muls r2, r1, r2
	lsls r1, r7, #2
	ldr r3, _081A7A7C
	adds r1, r1, r3
	adds r2, r2, r1
	movs r1, #0x19
	bl SetMonData
	mov r1, sl
	ldr r0, [r1]
	adds r4, r4, r0
	ldrh r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0, #0x17]
	mov r7, sb
	cmp r0, #0
	beq _081A7A28
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
_081A7A28:
	str r0, [sp]
	ldr r0, _081A7A74
	movs r1, #0x2e
	mov r2, sp
	bl SetMonData
	movs r4, #0
	adds r0, r6, r5
	lsls r6, r0, #2
_081A7A3A:
	ldr r2, [sp, #4]
	adds r0, r7, r2
	ldr r0, [r0]
	adds r0, r6, r0
	lsls r1, r4, #1
	adds r0, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _081A7A74
	bl SetMonMoveSlot
	adds r4, #1
	cmp r4, #3
	ble _081A7A3A
	ldr r0, _081A7A74
	bl CalculateMonStats
	movs r0, #1
_081A7A62:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081A7A74: .4byte 0x020243E8
_081A7A78: .4byte 0x082F0D54
_081A7A7C: .4byte 0x082F00B4
	thumb_func_end TryGenerateBattlePikeWildMon

	thumb_func_start GetBattlePikeWildMonHeaderId
GetBattlePikeWildMonHeaderId: @ 0x081A7A80
	push {lr}
	ldr r0, _081A7AA8
	ldr r1, [r0]
	ldr r2, _081A7AAC
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	ldr r2, _081A7AB0
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r2, r1, #0
	movs r0, #0x8c
	lsls r0, r0, #1
	cmp r1, r0
	bhi _081A7AB4
	movs r1, #0
	b _081A7ACC
	.align 2, 0
_081A7AA8: .4byte 0x03005AF0
_081A7AAC: .4byte 0x00000CA9
_081A7AB0: .4byte 0x00000E04
_081A7AB4:
	movs r0, #0x8c
	lsls r0, r0, #2
	cmp r1, r0
	bhi _081A7AC0
	movs r1, #1
	b _081A7ACC
_081A7AC0:
	movs r0, #0xd2
	lsls r0, r0, #2
	movs r1, #3
	cmp r2, r0
	bhi _081A7ACC
	movs r1, #2
_081A7ACC:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattlePikeWildMonHeaderId

	thumb_func_start DoStatusInflictionScreenFade
DoStatusInflictionScreenFade: @ 0x081A7AD4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081A7B04
	ldr r2, _081A7B08
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081A7AE6:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A7AE6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A7B04: .4byte 0x085DDEC0
_081A7B08: .4byte 0x03005B60
	thumb_func_end DoStatusInflictionScreenFade

	thumb_func_start StatusInflictionFadeOut
StatusInflictionFadeOut: @ 0x081A7B0C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _081A7B24
	subs r0, r1, #1
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081A7B48
_081A7B24:
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x10]
	ldrh r1, [r4, #0x16]
	adds r0, r0, r1
	strh r0, [r4, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _081A7B3C
	movs r0, #0x10
	strh r0, [r4, #0x16]
_081A7B3C:
	movs r0, #1
	rsbs r0, r0, #0
	ldrb r1, [r4, #0x16]
	ldr r2, _081A7B64
	bl BlendPalettes
_081A7B48:
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	ble _081A7B5A
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0x14]
_081A7B5A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081A7B64: .4byte 0x00002D6B
	thumb_func_end StatusInflictionFadeOut

	thumb_func_start StatusInflictionFadeIn
StatusInflictionFadeIn: @ 0x081A7B68
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _081A7B80
	subs r0, r1, #1
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081A7BA2
_081A7B80:
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x16]
	ldrh r1, [r4, #0x12]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _081A7B96
	movs r0, #0
	strh r0, [r4, #0x16]
_081A7B96:
	movs r0, #1
	rsbs r0, r0, #0
	ldrb r1, [r4, #0x16]
	ldr r2, _081A7BC8
	bl BlendPalettes
_081A7BA2:
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _081A7BD6
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081A7BD0
	ldr r0, _081A7BCC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	b _081A7BD6
	.align 2, 0
_081A7BC8: .4byte 0x00002D6B
_081A7BCC: .4byte 0x081A7AD5
_081A7BD0:
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x14]
	strh r1, [r4, #8]
_081A7BD6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StatusInflictionFadeIn

	thumb_func_start StartStatusInflictionScreenFade
StartStatusInflictionScreenFade: @ 0x081A7BE0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r3, [sp, #0x18]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r0, _081A7C3C
	movs r1, #3
	str r3, [sp]
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081A7C40
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	mov r0, r8
	strh r0, [r1, #0xa]
	strh r4, [r1, #0xc]
	strh r5, [r1, #0xe]
	strh r6, [r1, #0x10]
	ldr r3, [sp]
	strh r3, [r1, #0x12]
	strh r0, [r1, #0x14]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A7C3C: .4byte 0x081A7AD5
_081A7C40: .4byte 0x03005B60
	thumb_func_end StartStatusInflictionScreenFade

	thumb_func_start IsStatusInflictionScreenFadeTaskFinished
IsStatusInflictionScreenFadeTaskFinished: @ 0x081A7C44
	push {lr}
	ldr r0, _081A7C58
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _081A7C5C
	movs r0, #0
	b _081A7C5E
	.align 2, 0
_081A7C58: .4byte 0x081A7AD5
_081A7C5C:
	movs r0, #1
_081A7C5E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsStatusInflictionScreenFadeTaskFinished

	thumb_func_start Task_DoStatusInflictionScreenFade
Task_DoStatusInflictionScreenFade: @ 0x081A7C64
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	ldr r1, _081A7C98
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #8]
	movs r3, #8
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _081A7C9C
	adds r0, r2, #1
	strh r0, [r1, #8]
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #3
	movs r3, #2
	bl StartStatusInflictionScreenFade
	b _081A7CB0
	.align 2, 0
_081A7C98: .4byte 0x03005B60
_081A7C9C:
	bl IsStatusInflictionScreenFadeTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A7CB0
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_081A7CB0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_DoStatusInflictionScreenFade

	thumb_func_start TryHealMons
TryHealMons: @ 0x081A7CB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #0
	bne _081A7CD0
	b _081A7DFA
_081A7CD0:
	movs r0, #0
	mov r8, r0
_081A7CD4:
	mov r0, sp
	add r0, r8
	mov r1, r8
	strb r1, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _081A7CD4
	movs r5, #0
_081A7CEC:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r2, sp
	add r2, r8
	ldrb r3, [r2]
	mov r0, sp
	adds r1, r0, r4
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _081A7CEC
	movs r1, #0
	mov r8, r1
_081A7D30:
	movs r0, #0
	mov sl, r0
	mov r4, sp
	add r4, r8
	ldrb r1, [r4]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081A7D78
	adds r7, r1, r0
	adds r0, r7, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r7, #0
	movs r1, #0x3a
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	str r4, [sp, #8]
	cmp r5, r6
	blo _081A7DC4
	adds r0, r7, #0
	movs r1, #0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A7D7C
	movs r0, #1
	mov sl, r0
	b _081A7DC8
	.align 2, 0
_081A7D78: .4byte 0x02024190
_081A7D7C:
	adds r0, r7, #0
	movs r1, #0x15
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r4, #0
	b _081A7D94
_081A7D8E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081A7D94:
	cmp r4, #3
	bhi _081A7DC8
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r7, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sb
	adds r2, r4, #0
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x11
	adds r0, r7, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r6
	bhs _081A7D8E
_081A7DC4:
	movs r1, #1
	mov sl, r1
_081A7DC8:
	mov r0, sl
	cmp r0, #1
	bne _081A7DEC
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081A7E0C
	adds r0, r0, r1
	bl HealMon
	ldr r0, [sp, #4]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #0
	beq _081A7DFA
_081A7DEC:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _081A7D30
_081A7DFA:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A7E0C: .4byte 0x02024190
	thumb_func_end TryHealMons

	thumb_func_start GetInBattlePike
GetInBattlePike: @ 0x081A7E10
	push {r4, lr}
	ldr r4, _081A7E24
	bl InBattlePike
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A7E24: .4byte 0x02037290
	thumb_func_end GetInBattlePike

	thumb_func_start InBattlePike
InBattlePike: @ 0x081A7E28
	push {lr}
	movs r2, #0
	ldr r0, _081A7E54
	ldrh r1, [r0, #0x12]
	ldr r3, _081A7E58
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _081A7E4A
	movs r0, #0xb3
	lsls r0, r0, #1
	cmp r1, r0
	beq _081A7E4A
	adds r0, #1
	cmp r1, r0
	bne _081A7E4C
_081A7E4A:
	movs r2, #1
_081A7E4C:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_081A7E54: .4byte 0x02036FB8
_081A7E58: .4byte 0xFFFFFEA1
	thumb_func_end InBattlePike

	thumb_func_start SetHintedRoom
SetHintedRoom: @ 0x081A7E5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _081A7EB0
	movs r0, #0
	strh r0, [r4]
	movs r0, #1
	bl GetPikeQueenFightType
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A7EB8
	movs r0, #1
	strh r0, [r4]
	bl Random
	ldr r5, _081A7EB4
	ldr r4, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	bl __umodsi3
	movs r3, #0xe1
	lsls r3, r3, #4
	adds r4, r4, r3
	movs r1, #7
	ands r1, r0
	ldrb r2, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldr r2, [r5]
	adds r2, r2, r3
	ldrb r1, [r2]
	movs r0, #0x79
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	b _081A7FC8
	.align 2, 0
_081A7EB0: .4byte 0x02037290
_081A7EB4: .4byte 0x03005AF0
_081A7EB8:
	bl Random
	ldr r7, _081A7F2C
	ldr r4, [r7]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	movs r3, #0xe1
	lsls r3, r3, #4
	adds r4, r4, r3
	movs r1, #7
	ands r1, r0
	ldrb r2, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldr r0, [r7]
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	movs r6, #8
	cmp r0, #0
	beq _081A7EF2
	movs r6, #6
_081A7EF2:
	adds r0, r6, #0
	bl AllocZeroed
	adds r5, r0, #0
	movs r2, #0
	movs r3, #0
	cmp r2, r6
	bhs _081A7F3E
	adds r4, r7, #0
_081A7F04:
	ldr r0, [r4]
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081A7F30
	cmp r2, #1
	beq _081A7F34
	cmp r2, #4
	beq _081A7F34
	adds r1, r3, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r1, r5, r1
	strb r2, [r1]
	b _081A7F34
	.align 2, 0
_081A7F2C: .4byte 0x03005AF0
_081A7F30:
	adds r0, r5, r2
	strb r2, [r0]
_081A7F34:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r6
	blo _081A7F04
_081A7F3E:
	bl Random
	ldr r7, _081A7FD8
	ldr r4, [r7]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r6, #0xe1
	lsls r6, r6, #4
	adds r4, r4, r6
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r4]
	movs r0, #0x79
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	adds r0, r5, #0
	bl Free
	ldr r0, [r7]
	adds r0, r0, r6
	ldrb r1, [r0]
	movs r0, #0x78
	ands r0, r1
	cmp r0, #0x18
	bne _081A7F9C
	bl AtLeastOneHealthyMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A7F9C
	ldr r2, [r7]
	adds r2, r2, r6
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
_081A7F9C:
	ldr r5, _081A7FD8
	ldr r0, [r5]
	movs r4, #0xe1
	lsls r4, r4, #4
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #0x78
	ands r0, r1
	cmp r0, #0x38
	bne _081A7FCC
	bl AtLeastTwoAliveMons
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A7FCC
	ldr r2, [r5]
	adds r2, r2, r4
	ldrb r1, [r2]
	movs r0, #0x79
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
_081A7FC8:
	orrs r0, r1
	strb r0, [r2]
_081A7FCC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A7FD8: .4byte 0x03005AF0
	thumb_func_end SetHintedRoom

	thumb_func_start GetHintedRoomIndex
GetHintedRoomIndex: @ 0x081A7FDC
	ldr r1, _081A7FF4
	ldr r0, _081A7FF8
	ldr r0, [r0]
	movs r2, #0xe1
	lsls r2, r2, #4
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	strh r0, [r1]
	bx lr
	.align 2, 0
_081A7FF4: .4byte 0x02037290
_081A7FF8: .4byte 0x03005AF0
	thumb_func_end GetHintedRoomIndex

	thumb_func_start GetRoomTypeHint
GetRoomTypeHint: @ 0x081A7FFC
	ldr r2, _081A8018
	ldr r1, _081A801C
	ldr r0, _081A8020
	ldr r0, [r0]
	movs r3, #0xe1
	lsls r3, r3, #4
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1c
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_081A8018: .4byte 0x02037290
_081A801C: .4byte 0x085DDEA4
_081A8020: .4byte 0x03005AF0
	thumb_func_end GetRoomTypeHint

	thumb_func_start PrepareOneTrainer
PrepareOneTrainer: @ 0x081A8024
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	movs r7, #6
	cmp r0, #0
	bne _081A8030
	movs r7, #1
_081A8030:
	ldr r4, _081A8078
	ldr r1, [r4]
	ldr r2, _081A807C
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	ldr r2, _081A8080
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #0xe
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r5, r4, #0
_081A8052:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	ldr r1, [r5]
	ldr r2, _081A8084
	adds r0, r1, r2
	ldrh r0, [r0]
	subs r2, r0, #1
	cmp r3, r2
	bge _081A809A
	ldr r0, _081A8088
	adds r1, r1, r0
	b _081A8094
	.align 2, 0
_081A8078: .4byte 0x03005AF0
_081A807C: .4byte 0x00000CA9
_081A8080: .4byte 0x00000E04
_081A8084: .4byte 0x00000CB2
_081A8088: .4byte 0x00000CB4
_081A808C:
	adds r1, #2
	adds r3, #1
	cmp r3, r2
	bge _081A809A
_081A8094:
	ldrh r0, [r1]
	cmp r0, r4
	bne _081A808C
_081A809A:
	ldr r0, [r5]
	ldr r1, _081A80DC
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #1
	cmp r3, r0
	bne _081A8052
	ldr r5, _081A80E0
	strh r4, [r5]
	ldr r1, _081A80E4
	ldr r0, _081A80E8
	str r0, [r1]
	ldrh r0, [r5]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	ldr r0, _081A80EC
	ldr r1, [r0]
	ldr r0, _081A80DC
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0xd
	bhi _081A80D6
	subs r0, #1
	lsls r0, r0, #1
	ldr r2, _081A80F0
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r5]
	strh r0, [r1]
_081A80D6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A80DC: .4byte 0x00000CB2
_081A80E0: .4byte 0x0203886A
_081A80E4: .4byte 0x0203B954
_081A80E8: .4byte 0x085B4A10
_081A80EC: .4byte 0x03005AF0
_081A80F0: .4byte 0x00000CB4
	thumb_func_end PrepareOneTrainer

	thumb_func_start PrepareTwoTrainers
PrepareTwoTrainers: @ 0x081A80F4
	push {r4, r5, r6, r7, lr}
	ldr r4, _081A8144
	ldr r1, [r4]
	ldr r2, _081A8148
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	ldr r2, _081A814C
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #0xe
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _081A8150
	ldr r0, _081A8154
	str r0, [r1]
	lsls r7, r5, #0x18
	adds r6, r4, #0
_081A8120:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	ldr r1, [r6]
	ldr r2, _081A8158
	adds r0, r1, r2
	ldrh r0, [r0]
	subs r2, r0, #1
	cmp r3, r2
	bge _081A816E
	ldr r0, _081A815C
	adds r1, r1, r0
	b _081A8168
	.align 2, 0
_081A8144: .4byte 0x03005AF0
_081A8148: .4byte 0x00000CA9
_081A814C: .4byte 0x00000E04
_081A8150: .4byte 0x0203B954
_081A8154: .4byte 0x085B4A10
_081A8158: .4byte 0x00000CB2
_081A815C: .4byte 0x00000CB4
_081A8160:
	adds r1, #2
	adds r3, #1
	cmp r3, r2
	bge _081A816E
_081A8168:
	ldrh r0, [r1]
	cmp r0, r4
	bne _081A8160
_081A816E:
	ldr r0, [r6]
	ldr r1, _081A8220
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #1
	cmp r3, r0
	bne _081A8120
	ldr r5, _081A8224
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, #0
	bl SetBattleFacilityTrainerGfxId
	ldr r3, _081A8228
	ldr r1, [r3]
	ldr r0, _081A8220
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0xe
	bhi _081A81A4
	subs r0, #1
	lsls r0, r0, #1
	ldr r2, _081A822C
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r5]
	strh r0, [r1]
_081A81A4:
	adds r5, r3, #0
_081A81A6:
	lsrs r0, r7, #0x18
	movs r1, #1
	bl sub_0816245C
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	ldr r1, [r5]
	ldr r2, _081A8220
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r3, r0
	bge _081A81E6
	adds r2, #2
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, r4
	beq _081A81E6
	ldr r0, _081A8228
	ldr r1, [r0]
	subs r2, #2
	adds r0, r1, r2
	ldrh r2, [r0]
	ldr r0, _081A822C
	adds r1, r1, r0
_081A81D8:
	adds r1, #2
	adds r3, #1
	cmp r3, r2
	bge _081A81E6
	ldrh r0, [r1]
	cmp r0, r4
	bne _081A81D8
_081A81E6:
	ldr r0, [r5]
	ldr r1, _081A8220
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r3, r0
	bne _081A81A6
	ldr r5, _081A8230
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, #1
	bl SetBattleFacilityTrainerGfxId
	ldr r0, _081A8228
	ldr r1, [r0]
	ldr r0, _081A8220
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0xd
	bhi _081A821A
	subs r0, #2
	lsls r0, r0, #1
	ldr r2, _081A822C
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r5]
	strh r0, [r1]
_081A821A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A8220: .4byte 0x00000CB2
_081A8224: .4byte 0x0203886A
_081A8228: .4byte 0x03005AF0
_081A822C: .4byte 0x00000CB4
_081A8230: .4byte 0x0203886C
	thumb_func_end PrepareTwoTrainers

	thumb_func_start ClearPikeTrainerIds
ClearPikeTrainerIds: @ 0x081A8234
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _081A8260
	ldr r4, _081A8264
	ldr r0, _081A8268
	adds r3, r0, #0
_081A8240:
	ldr r1, [r5]
	lsls r0, r2, #1
	adds r1, r1, r4
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xd
	bls _081A8240
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A8260: .4byte 0x03005AF0
_081A8264: .4byte 0x00000CB4
_081A8268: .4byte 0x0000FFFF
	thumb_func_end ClearPikeTrainerIds

	thumb_func_start BufferRecordMixingTrainerMessage
BufferRecordMixingTrainerMessage: @ 0x081A826C
	push {lr}
	ldr r0, _081A8294
	ldrh r0, [r0]
	cmp r0, #0
	bne _081A82A4
	ldr r3, _081A8298
	ldrh r1, [r3]
	ldr r0, _081A829C
	cmp r1, r0
	bhi _081A82C2
	ldr r2, _081A82A0
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0xc
	bl FrontierSpeechToString
	b _081A82C2
	.align 2, 0
_081A8294: .4byte 0x02037282
_081A8298: .4byte 0x0203886A
_081A829C: .4byte 0x0000012B
_081A82A0: .4byte 0x0203B954
_081A82A4:
	cmp r0, #1
	bne _081A82C2
	ldr r3, _081A82C8
	ldrh r1, [r3]
	ldr r0, _081A82CC
	cmp r1, r0
	bhi _081A82C2
	ldr r2, _081A82D0
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, [r2]
	adds r0, r0, r1
	adds r0, #0xc
	bl FrontierSpeechToString
_081A82C2:
	pop {r0}
	bx r0
	.align 2, 0
_081A82C8: .4byte 0x0203886C
_081A82CC: .4byte 0x0000012B
_081A82D0: .4byte 0x0203B954
	thumb_func_end BufferRecordMixingTrainerMessage

	thumb_func_start AtLeastTwoAliveMons
AtLeastTwoAliveMons: @ 0x081A82D4
	push {r4, r5, r6, lr}
	ldr r5, _081A8304
	movs r6, #0
	movs r4, #0
_081A82DC:
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _081A82EE
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_081A82EE:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, #0x64
	cmp r4, #2
	bls _081A82DC
	cmp r6, #1
	bhi _081A8308
	movs r0, #1
	b _081A830A
	.align 2, 0
_081A8304: .4byte 0x02024190
_081A8308:
	movs r0, #0
_081A830A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end AtLeastTwoAliveMons

	thumb_func_start GetPikeQueenFightType
GetPikeQueenFightType: @ 0x081A8310
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	movs r6, #0
	ldr r1, _081A8360
	ldr r2, [r1]
	ldr r3, _081A8364
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1d
	ldr r3, _081A8368
	adds r2, r2, r3
	adds r2, r2, r1
	lsrs r4, r0, #0x18
	ldrh r2, [r2]
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #5
	bl GetPlayerSymbolCountForFacility
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	blt _081A8370
	cmp r2, #1
	bgt _081A8370
	ldr r1, _081A836C
	adds r0, r2, #0
	adds r0, #0x14
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r1, #0x17]
	subs r0, r0, r1
	cmp r4, r0
	bne _081A83B4
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _081A83B4
	.align 2, 0
_081A8360: .4byte 0x03005AF0
_081A8364: .4byte 0x00000CA9
_081A8368: .4byte 0x00000E04
_081A836C: .4byte 0x085DDE14
_081A8370:
	ldr r5, _081A838C
	movs r0, #5
	lsls r3, r0, #2
	adds r0, r3, r5
	ldrb r1, [r0]
	adds r0, r5, #3
	adds r0, r3, r0
	ldrb r2, [r0]
	subs r1, r1, r2
	cmp r4, r1
	bne _081A8390
	movs r6, #3
	b _081A83B4
	.align 2, 0
_081A838C: .4byte 0x085DDE14
_081A8390:
	adds r0, r5, #1
	adds r0, r3, r0
	ldrb r1, [r0]
	subs r0, r1, r2
	cmp r4, r0
	beq _081A83B2
	cmp r4, r1
	bls _081A83B4
	subs r0, r4, r1
	adds r0, r0, r2
	adds r1, r5, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	bl __modsi3
	cmp r0, #0
	bne _081A83B4
_081A83B2:
	movs r6, #4
_081A83B4:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetPikeQueenFightType

	thumb_func_start GetCurrentRoomPikeQueenFightType
GetCurrentRoomPikeQueenFightType: @ 0x081A83BC
	push {r4, lr}
	ldr r4, _081A83D4
	movs r0, #0
	bl GetPikeQueenFightType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A83D4: .4byte 0x02037290
	thumb_func_end GetCurrentRoomPikeQueenFightType

	thumb_func_start HealSomeMonsBeforePikeQueen
HealSomeMonsBeforePikeQueen: @ 0x081A83D8
	push {r4, lr}
	ldr r3, _081A840C
	ldr r2, _081A8410
	ldr r0, _081A8414
	ldr r0, [r0]
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	lsls r0, r1, #1
	adds r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	adds r0, r0, r3
	ldrb r4, [r0]
	adds r0, r4, #0
	bl TryHealMons
	ldr r0, _081A8418
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A840C: .4byte 0x085DDEAD
_081A8410: .4byte 0x02037286
_081A8414: .4byte 0x03005AF0
_081A8418: .4byte 0x02037290
	thumb_func_end HealSomeMonsBeforePikeQueen

	thumb_func_start SetHealingRoomsDisabled
SetHealingRoomsDisabled: @ 0x081A841C
	ldr r0, _081A8438
	ldr r2, [r0]
	ldr r0, _081A843C
	ldrb r1, [r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r2, r0
	lsls r1, r1, #7
	ldrb r3, [r2]
	movs r0, #0x7f
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_081A8438: .4byte 0x03005AF0
_081A843C: .4byte 0x02037282
	thumb_func_end SetHealingRoomsDisabled

	thumb_func_start CanAnyPartyMonsBeHealed
CanAnyPartyMonsBeHealed: @ 0x081A8440
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _081A84A4
	movs r0, #1
	strh r0, [r1]
	movs r0, #0
	mov sl, r0
_081A8454:
	movs r0, #0
	mov sb, r0
	movs r0, #0x64
	mov r1, sl
	muls r1, r0, r1
	ldr r0, _081A84A8
	adds r7, r1, r0
	adds r0, r7, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r7, #0
	movs r1, #0x3a
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, r5
	blo _081A84E2
	adds r0, r7, #0
	movs r1, #0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081A84E2
	adds r0, r7, #0
	movs r1, #0x15
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r6, #0
	b _081A84B2
	.align 2, 0
_081A84A4: .4byte 0x02037290
_081A84A8: .4byte 0x02024190
_081A84AC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_081A84B2:
	cmp r6, #3
	bhi _081A84E6
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r7, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	adds r2, r6, #0
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r1, r6, #0
	adds r1, #0x11
	adds r0, r7, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	bhs _081A84AC
_081A84E2:
	movs r0, #1
	mov sb, r0
_081A84E6:
	mov r0, sb
	cmp r0, #1
	bne _081A84F8
	ldr r1, _081A84F4
	movs r0, #0
	strh r0, [r1]
	b _081A8506
	.align 2, 0
_081A84F4: .4byte 0x02037290
_081A84F8:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #2
	bls _081A8454
_081A8506:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end CanAnyPartyMonsBeHealed

	thumb_func_start BackupMonHeldItems
BackupMonHeldItems: @ 0x081A8514
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r7, _081A8558
	ldr r6, _081A855C
_081A851C:
	ldr r0, [r6]
	lsls r4, r5, #1
	ldr r1, _081A8560
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	movs r2, #0xea
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r0, [r7]
	adds r0, r0, r1
	movs r1, #0xc
	bl GetMonData
	ldr r1, [r6]
	ldr r2, _081A8564
	adds r1, r1, r2
	adds r1, r1, r4
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _081A851C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A8558: .4byte 0x03005AEC
_081A855C: .4byte 0x03005AF0
_081A8560: .4byte 0x00000CAA
_081A8564: .4byte 0x00000E12
	thumb_func_end BackupMonHeldItems

	thumb_func_start RestoreMonHeldItems
RestoreMonHeldItems: @ 0x081A8568
	push {r4, lr}
	movs r4, #0
_081A856C:
	ldr r0, _081A85A0
	ldr r2, [r0]
	lsls r3, r4, #1
	ldr r1, _081A85A4
	adds r0, r2, r1
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081A85A8
	adds r0, r0, r1
	ldr r1, _081A85AC
	adds r3, r3, r1
	adds r2, r2, r3
	movs r1, #0xc
	bl SetMonData
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081A856C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A85A0: .4byte 0x03005AF0
_081A85A4: .4byte 0x00000CAA
_081A85A8: .4byte 0x0202412C
_081A85AC: .4byte 0x00000E12
	thumb_func_end RestoreMonHeldItems

	thumb_func_start InitPikeChallenge
InitPikeChallenge: @ 0x081A85B0
	push {r4, r5, r6, lr}
	ldr r3, _081A860C
	ldr r1, [r3]
	ldr r2, _081A8610
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _081A8614
	adds r1, r1, r0
	movs r4, #0
	strb r4, [r1]
	ldr r1, [r3]
	ldr r6, _081A8618
	adds r0, r1, r6
	strh r4, [r0]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r3, [r3]
	ldr r0, _081A861C
	adds r2, r3, r0
	ldr r1, _081A8620
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _081A85FC
	lsls r1, r5, #1
	ldr r2, _081A8624
	adds r0, r3, r2
	adds r0, r0, r1
	strh r4, [r0]
_081A85FC:
	ldr r0, _081A8628
	strh r4, [r0]
	ldr r1, _081A862C
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A860C: .4byte 0x03005AF0
_081A8610: .4byte 0x00000CA9
_081A8614: .4byte 0x00000CA8
_081A8618: .4byte 0x00000CB2
_081A861C: .4byte 0x00000CDC
_081A8620: .4byte 0x085DDEC8
_081A8624: .4byte 0x00000E04
_081A8628: .4byte 0x0203886A
_081A862C: .4byte 0x02023FDE
	thumb_func_end InitPikeChallenge

	thumb_func_start CanEncounterWildMon
CanEncounterWildMon: @ 0x081A8630
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081A8680
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _081A8684
	adds r0, r4, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x33
	beq _081A8656
	cmp r0, #0x16
	bne _081A8684
_081A8656:
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _081A8684
	subs r0, #5
	cmp r5, r0
	bgt _081A8684
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _081A8684
	movs r0, #0
	b _081A8686
	.align 2, 0
_081A8680: .4byte 0x02024190
_081A8684:
	movs r0, #1
_081A8686:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CanEncounterWildMon

	thumb_func_start SpeciesToPikeMonId
SpeciesToPikeMonId: @ 0x081A868C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _081A869C
	cmp r2, r0
	bne _081A86A0
	movs r1, #0
	b _081A86AA
	.align 2, 0
_081A869C: .4byte 0x0000017B
_081A86A0:
	ldr r0, _081A86B0
	movs r1, #2
	cmp r2, r0
	bne _081A86AA
	movs r1, #1
_081A86AA:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_081A86B0: .4byte 0x00000149
	thumb_func_end SpeciesToPikeMonId

