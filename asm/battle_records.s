.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearLinkBattleRecord
ClearLinkBattleRecord: @ 0x0813BFB8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0813BFE4
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813BFE4: .4byte 0x01000008
	thumb_func_end ClearLinkBattleRecord

	thumb_func_start ClearLinkBattleRecords
ClearLinkBattleRecords: @ 0x0813BFE8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #4
_0813BFEE:
	adds r0, r4, #0
	bl ClearLinkBattleRecord
	adds r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _0813BFEE
	movs r0, #0x17
	movs r1, #0
	bl SetGameStat
	movs r0, #0x18
	movs r1, #0
	bl SetGameStat
	movs r0, #0x19
	movs r1, #0
	bl SetGameStat
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearLinkBattleRecords

	thumb_func_start GetLinkBattleRecordTotalBattles
GetLinkBattleRecordTotalBattles: @ 0x0813C01C
	adds r1, r0, #0
	ldrh r0, [r1, #0xa]
	ldrh r2, [r1, #0xc]
	adds r0, r0, r2
	ldrh r1, [r1, #0xe]
	adds r0, r0, r1
	bx lr
	.align 2, 0
	thumb_func_end GetLinkBattleRecordTotalBattles

	thumb_func_start FindLinkBattleRecord
FindLinkBattleRecord: @ 0x0813C02C
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r5, #0
	adds r4, r0, #0
_0813C038:
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #7
	bl StringCompareN
	cmp r0, #0
	bne _0813C050
	ldrh r0, [r4, #8]
	cmp r0, r6
	bne _0813C050
	adds r0, r5, #0
	b _0813C05A
_0813C050:
	adds r4, #0x10
	adds r5, #1
	cmp r5, #4
	ble _0813C038
	movs r0, #5
_0813C05A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end FindLinkBattleRecord

	thumb_func_start SortLinkBattleRecords
SortLinkBattleRecords: @ 0x0813C060
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	mov r8, r0
	movs r0, #4
_0813C06E:
	subs r2, r0, #1
	mov sb, r2
	cmp r2, #0
	blt _0813C0C8
	lsls r0, r0, #4
	mov r1, r8
	adds r6, r1, r0
	lsls r0, r2, #4
	adds r5, r0, r1
_0813C080:
	adds r0, r6, #0
	str r2, [sp, #0x10]
	bl GetLinkBattleRecordTotalBattles
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetLinkBattleRecordTotalBattles
	ldr r2, [sp, #0x10]
	cmp r4, r0
	ble _0813C0BA
	mov r1, sp
	adds r0, r6, #0
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r6, #0
	adds r0, r5, #0
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r5, #0
	mov r0, sp
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldr r0, [r0]
	str r0, [r1]
_0813C0BA:
	subs r5, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	bge _0813C080
_0813C0C8:
	adds r0, r2, #0
	cmp r0, #0
	bgt _0813C06E
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SortLinkBattleRecords

	thumb_func_start UpdateLinkBattleRecord
UpdateLinkBattleRecord: @ 0x0813C0DC
	push {lr}
	adds r2, r0, #0
	cmp r1, #2
	beq _0813C10C
	cmp r1, #2
	bgt _0813C0EE
	cmp r1, #1
	beq _0813C0F4
	b _0813C136
_0813C0EE:
	cmp r1, #3
	beq _0813C124
	b _0813C136
_0813C0F4:
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0813C108
	cmp r0, r1
	bls _0813C136
	strh r1, [r2, #0xa]
	b _0813C136
	.align 2, 0
_0813C108: .4byte 0x0000270F
_0813C10C:
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0813C120
	cmp r0, r1
	bls _0813C136
	strh r1, [r2, #0xc]
	b _0813C136
	.align 2, 0
_0813C120: .4byte 0x0000270F
_0813C124:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0813C13C
	cmp r0, r1
	bls _0813C136
	strh r1, [r2, #0xe]
_0813C136:
	pop {r0}
	bx r0
	.align 2, 0
_0813C13C: .4byte 0x0000270F
	thumb_func_end UpdateLinkBattleRecord

	thumb_func_start UpdateLinkBattleGameStats
UpdateLinkBattleGameStats: @ 0x0813C140
	push {r4, lr}
	cmp r0, #2
	beq _0813C15A
	cmp r0, #2
	bgt _0813C150
	cmp r0, #1
	beq _0813C156
	b _0813C172
_0813C150:
	cmp r0, #3
	beq _0813C15E
	b _0813C172
_0813C156:
	movs r4, #0x17
	b _0813C160
_0813C15A:
	movs r4, #0x18
	b _0813C160
_0813C15E:
	movs r4, #0x19
_0813C160:
	adds r0, r4, #0
	bl GetGameStat
	ldr r1, _0813C178
	cmp r0, r1
	bhi _0813C172
	adds r0, r4, #0
	bl IncrementGameStat
_0813C172:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C178: .4byte 0x0000270E
	thumb_func_end UpdateLinkBattleGameStats

	thumb_func_start UpdateLinkBattleRecords
UpdateLinkBattleRecords: @ 0x0813C17C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov r8, r1
	mov sl, r3
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r0, sl
	bl UpdateLinkBattleGameStats
	adds r0, r6, #0
	bl SortLinkBattleRecords
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	bl FindLinkBattleRecord
	adds r5, r0, #0
	cmp r5, #5
	bne _0813C1E0
	movs r5, #4
	adds r4, r6, #0
	adds r4, #0x40
	adds r0, r4, #0
	bl ClearLinkBattleRecord
	adds r0, r4, #0
	mov r1, r8
	movs r2, #7
	bl StringCopyN
	strh r7, [r4, #8]
	adds r2, r6, #0
	adds r2, #0x54
	ldr r1, _0813C200
	mov r3, sb
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x1a]
	strb r0, [r2]
_0813C1E0:
	lsls r0, r5, #4
	adds r0, r6, r0
	mov r1, sl
	bl UpdateLinkBattleRecord
	adds r0, r6, #0
	bl SortLinkBattleRecords
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C200: .4byte 0x020226A0
	thumb_func_end UpdateLinkBattleRecords

	thumb_func_start ClearPlayerLinkBattleRecords
ClearPlayerLinkBattleRecords: @ 0x0813C204
	push {lr}
	ldr r0, _0813C218
	ldr r0, [r0]
	ldr r1, _0813C21C
	adds r0, r0, r1
	bl ClearLinkBattleRecords
	pop {r0}
	bx r0
	.align 2, 0
_0813C218: .4byte 0x03005AEC
_0813C21C: .4byte 0x00003150
	thumb_func_end ClearPlayerLinkBattleRecords

	thumb_func_start IncTrainerCardWins
IncTrainerCardWins: @ 0x0813C220
	push {lr}
	movs r1, #0x64
	muls r1, r0, r1
	ldr r0, _0813C240
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0813C244
	cmp r0, r2
	bls _0813C23C
	strh r2, [r1]
_0813C23C:
	pop {r0}
	bx r0
	.align 2, 0
_0813C240: .4byte 0x0203980C
_0813C244: .4byte 0x0000270F
	thumb_func_end IncTrainerCardWins

	thumb_func_start IncTrainerCardLosses
IncTrainerCardLosses: @ 0x0813C248
	push {lr}
	movs r1, #0x64
	muls r1, r0, r1
	ldr r0, _0813C268
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0813C26C
	cmp r0, r2
	bls _0813C264
	strh r2, [r1]
_0813C264:
	pop {r0}
	bx r0
	.align 2, 0
_0813C268: .4byte 0x0203980E
_0813C26C: .4byte 0x0000270F
	thumb_func_end IncTrainerCardLosses

	thumb_func_start UpdateTrainerCardWinsLosses
UpdateTrainerCardWinsLosses: @ 0x0813C270
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0813C284
	ldrb r0, [r0]
	cmp r0, #1
	beq _0813C288
	cmp r0, #2
	beq _0813C296
	b _0813C2A4
	.align 2, 0
_0813C284: .4byte 0x02023FDE
_0813C288:
	eors r0, r4
	bl IncTrainerCardWins
	adds r0, r4, #0
	bl IncTrainerCardLosses
	b _0813C2A4
_0813C296:
	movs r0, #1
	eors r0, r4
	bl IncTrainerCardLosses
	adds r0, r4, #0
	bl IncTrainerCardWins
_0813C2A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateTrainerCardWinsLosses

	thumb_func_start UpdatePlayerLinkBattleRecords
UpdatePlayerLinkBattleRecords: @ 0x0813C2AC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl InUnionRoom
	cmp r0, #1
	beq _0813C2E6
	adds r0, r4, #0
	bl UpdateTrainerCardWinsLosses
	ldr r0, _0813C2F0
	ldr r0, [r0]
	ldr r1, _0813C2F4
	adds r0, r0, r1
	movs r1, #0x64
	adds r3, r4, #0
	muls r3, r1, r3
	ldr r2, _0813C2F8
	adds r1, r3, r2
	subs r2, #0x30
	adds r3, r3, r2
	ldrh r2, [r3, #0xe]
	ldr r3, _0813C2FC
	ldrb r3, [r3]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	bl UpdateLinkBattleRecords
_0813C2E6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C2F0: .4byte 0x03005AEC
_0813C2F4: .4byte 0x00003150
_0813C2F8: .4byte 0x02039828
_0813C2FC: .4byte 0x02023FDE
	thumb_func_end UpdatePlayerLinkBattleRecords

	thumb_func_start PrintLinkBattleWinsLossesDraws
PrintLinkBattleWinsLossesDraws: @ 0x0813C300
	push {r4, lr}
	sub sp, #0xc
	ldr r4, _0813C36C
	movs r0, #0x17
	bl GetGameStat
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _0813C370
	movs r0, #0x18
	bl GetGameStat
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _0813C374
	movs r0, #0x19
	bl GetGameStat
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _0813C378
	ldr r1, _0813C37C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r0, _0813C380
	ldrb r0, [r0]
	movs r1, #0x12
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C36C: .4byte 0x02021C40
_0813C370: .4byte 0x02021C54
_0813C374: .4byte 0x02021C68
_0813C378: .4byte 0x02021C7C
_0813C37C: .4byte 0x085937EF
_0813C380: .4byte 0x0203A840
	thumb_func_end PrintLinkBattleWinsLossesDraws

	thumb_func_start PrintLinkBattleRecord
PrintLinkBattleRecord: @ 0x0813C384
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldrh r0, [r6, #0xa]
	cmp r0, #0
	bne _0813C408
	ldr r7, [r6, #0xc]
	cmp r7, #0
	bne _0813C408
	ldr r0, _0813C3FC
	mov r8, r0
	ldrb r0, [r0]
	ldr r2, _0813C400
	lsls r4, r4, #3
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	mov r1, r8
	ldrb r0, [r1]
	ldr r5, _0813C404
	str r4, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x50
	bl AddTextPrinterParameterized
	mov r1, r8
	ldrb r0, [r1]
	str r4, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x78
	bl AddTextPrinterParameterized
	mov r1, r8
	ldrb r0, [r1]
	str r4, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0xa8
	bl AddTextPrinterParameterized
	b _0813C49A
	.align 2, 0
_0813C3FC: .4byte 0x0203A840
_0813C400: .4byte 0x08593811
_0813C404: .4byte 0x08593817
_0813C408:
	ldr r0, _0813C4A8
	movs r1, #8
	bl StringFillWithTerminator
	ldr r0, _0813C4A8
	adds r1, r6, #0
	movs r2, #7
	bl StringCopyN
	ldr r0, _0813C4AC
	mov r8, r0
	ldrb r0, [r0]
	lsls r4, r4, #3
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r5, #0
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _0813C4A8
	movs r3, #8
	bl AddTextPrinterParameterized
	ldrh r1, [r6, #0xa]
	ldr r0, _0813C4A8
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	mov r1, r8
	ldrb r0, [r1]
	str r4, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _0813C4A8
	movs r3, #0x50
	bl AddTextPrinterParameterized
	ldrh r1, [r6, #0xc]
	ldr r0, _0813C4A8
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	mov r1, r8
	ldrb r0, [r1]
	str r4, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _0813C4A8
	movs r3, #0x78
	bl AddTextPrinterParameterized
	ldrh r1, [r6, #0xe]
	ldr r0, _0813C4A8
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	mov r1, r8
	ldrb r0, [r1]
	str r4, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	ldr r2, _0813C4A8
	movs r3, #0xa8
	bl AddTextPrinterParameterized
_0813C49A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C4A8: .4byte 0x02021C40
_0813C4AC: .4byte 0x0203A840
	thumb_func_end PrintLinkBattleRecord

	thumb_func_start ShowLinkBattleRecords
ShowLinkBattleRecords: @ 0x0813C4B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r6, _0813C560
	ldr r0, _0813C564
	bl AddWindow
	strb r0, [r6]
	ldrb r0, [r6]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r6]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r5, _0813C568
	ldr r1, _0813C56C
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldrb r0, [r6]
	movs r1, #2
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x30
	bl AddTextPrinterParameterized
	ldr r0, _0813C570
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _0813C574
	mov sb, r1
	add r0, sb
	bl PrintLinkBattleWinsLossesDraws
	ldr r1, _0813C578
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldrb r0, [r6]
	movs r1, #0x2a
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x50
	bl AddTextPrinterParameterized
	mov r7, r8
	movs r6, #0xe0
	lsls r6, r6, #0x13
	mov r5, sb
	movs r4, #4
_0813C52A:
	ldr r0, [r7]
	adds r0, r0, r5
	lsrs r1, r6, #0x18
	bl PrintLinkBattleRecord
	movs r0, #0x80
	lsls r0, r0, #0x12
	adds r6, r6, r0
	adds r5, #0x10
	subs r4, #1
	cmp r4, #0
	bge _0813C52A
	ldr r4, _0813C560
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C560: .4byte 0x0203A840
_0813C564: .4byte 0x085937D8
_0813C568: .4byte 0x02021C7C
_0813C56C: .4byte 0x085937E0
_0813C570: .4byte 0x03005AEC
_0813C574: .4byte 0x00003150
_0813C578: .4byte 0x08593801
	thumb_func_end ShowLinkBattleRecords

	thumb_func_start RemoveRecordsWindow
RemoveRecordsWindow: @ 0x0813C57C
	push {r4, lr}
	ldr r4, _0813C594
	ldrb r0, [r4]
	movs r1, #0
	bl DrawStdWindowFrame
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C594: .4byte 0x0203A840
	thumb_func_end RemoveRecordsWindow

	thumb_func_start Task_TrainerHillWaitForPaletteFade
Task_TrainerHillWaitForPaletteFade: @ 0x0813C598
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0813C5BC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0813C5B8
	ldr r0, _0813C5C0
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0813C5C4
	str r0, [r1]
_0813C5B8:
	pop {r0}
	bx r0
	.align 2, 0
_0813C5BC: .4byte 0x02037C74
_0813C5C0: .4byte 0x03005B60
_0813C5C4: .4byte 0x0813C5C9
	thumb_func_end Task_TrainerHillWaitForPaletteFade

	thumb_func_start Task_CloseTrainerHillRecordsOnButton
Task_CloseTrainerHillRecordsOnButton: @ 0x0813C5C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0813C5FC
	adds r4, r1, r0
	ldr r0, _0813C600
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0813C5EC
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0813C5F6
_0813C5EC:
	movs r0, #5
	bl PlaySE
	ldr r0, _0813C604
	str r0, [r4]
_0813C5F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C5FC: .4byte 0x03005B60
_0813C600: .4byte 0x03002360
_0813C604: .4byte 0x0813C609
	thumb_func_end Task_CloseTrainerHillRecordsOnButton

	thumb_func_start Task_BeginPaletteFade
Task_BeginPaletteFade: @ 0x0813C608
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813C638
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0813C63C
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C638: .4byte 0x03005B60
_0813C63C: .4byte 0x0813C641
	thumb_func_end Task_BeginPaletteFade

	thumb_func_start Task_ExitTrainerHillRecords
Task_ExitTrainerHillRecords: @ 0x0813C640
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0813C678
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0813C670
	ldr r0, _0813C67C
	bl SetMainCallback2
	ldr r0, _0813C680
	ldr r0, [r0]
	bl Free
	movs r0, #0
	bl RemoveTrainerHillRecordsWindow
	bl FreeAllWindowBuffers
	adds r0, r4, #0
	bl DestroyTask
_0813C670:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C678: .4byte 0x02037C74
_0813C67C: .4byte 0x08085B35
_0813C680: .4byte 0x0203A844
	thumb_func_end Task_ExitTrainerHillRecords

	thumb_func_start RemoveTrainerHillRecordsWindow
RemoveTrainerHillRecordsWindow: @ 0x0813C684
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	bl ClearWindowTilemap
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	adds r0, r4, #0
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RemoveTrainerHillRecordsWindow

	thumb_func_start ClearVramOamPlttRegs
ClearVramOamPlttRegs: @ 0x0813C6B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #9
	add r0, sp, #4
	mov r8, r0
	mov r2, sp
	movs r6, #0
	ldr r1, _0813C7E0
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _0813C7E4
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_0813C6D6:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _0813C6D6
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #4]
	ldr r2, _0813C7E0
	mov r1, r8
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C7E0: .4byte 0x040000D4
_0813C7E4: .4byte 0x81000800
	thumb_func_end ClearVramOamPlttRegs

	thumb_func_start ClearTasksAndGraphicalStructs
ClearTasksAndGraphicalStructs: @ 0x0813C7E8
	push {lr}
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearTasksAndGraphicalStructs

	thumb_func_start ResetBgCoordinates
ResetBgCoordinates: @ 0x0813C804
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetBgCoordinates

	thumb_func_start SetDispcntReg
SetDispcntReg: @ 0x0813C85C
	push {lr}
	movs r1, #0x94
	lsls r1, r1, #4
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end SetDispcntReg

	thumb_func_start LoadTrainerHillRecordsWindowGfx
LoadTrainerHillRecordsWindowGfx: @ 0x0813C86C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0813C8A8
	adds r0, r4, #0
	movs r2, #0xc0
	movs r3, #0
	bl LoadBgTiles
	ldr r1, _0813C8AC
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBufferRect
	ldr r0, _0813C8B0
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C8A8: .4byte 0x08592EE0
_0813C8AC: .4byte 0x08592FC0
_0813C8B0: .4byte 0x08592FA0
	thumb_func_end LoadTrainerHillRecordsWindowGfx

	thumb_func_start VblankCB_TrainerHillRecords
VblankCB_TrainerHillRecords: @ 0x0813C8B4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VblankCB_TrainerHillRecords

	thumb_func_start MainCB2_TrainerHillRecords
MainCB2_TrainerHillRecords: @ 0x0813C8C8
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MainCB2_TrainerHillRecords

	thumb_func_start ShowTrainerHillRecords
ShowTrainerHillRecords: @ 0x0813C8E0
	push {lr}
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, _0813C8F4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813C8F4: .4byte 0x0813C8F9
	thumb_func_end ShowTrainerHillRecords

	thumb_func_start CB2_ShowTrainerHillRecords
CB2_ShowTrainerHillRecords: @ 0x0813C8F8
	push {r4, lr}
	sub sp, #4
	ldr r0, _0813C918
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	bls _0813C90C
	b _0813CA18
_0813C90C:
	lsls r0, r0, #2
	ldr r1, _0813C91C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813C918: .4byte 0x03002360
_0813C91C: .4byte 0x0813C920
_0813C920: @ jump table
	.4byte _0813C940 @ case 0
	.4byte _0813C94C @ case 1
	.4byte _0813C952 @ case 2
	.4byte _0813C984 @ case 3
	.4byte _0813C99A @ case 4
	.4byte _0813C9BA @ case 5
	.4byte _0813C9CC @ case 6
	.4byte _0813C9F0 @ case 7
_0813C940:
	movs r0, #0
	bl SetVBlankCallback
	bl ClearVramOamPlttRegs
	b _0813C9DC
_0813C94C:
	bl ClearTasksAndGraphicalStructs
	b _0813C9DC
_0813C952:
	ldr r4, _0813C97C
	movs r0, #0x80
	lsls r0, r0, #4
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0813C980
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	ldr r1, [r4]
	movs r0, #3
	bl SetBgTilemapBuffer
	bl ResetBgCoordinates
	b _0813C9DC
	.align 2, 0
_0813C97C: .4byte 0x0203A844
_0813C980: .4byte 0x085937C0
_0813C984:
	movs r0, #3
	bl LoadTrainerHillRecordsWindowGfx
	movs r0, #0
	bl stdpal_get
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	b _0813C9DC
_0813C99A:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0813CA18
	movs r0, #0
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _0813C9DC
_0813C9BA:
	ldr r0, _0813C9C8
	bl InitWindows
	bl DeactivateAllTextPrinters
	b _0813C9DC
	.align 2, 0
_0813C9C8: .4byte 0x085937C8
_0813C9CC:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_0813C9DC:
	ldr r1, _0813C9EC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0813CA18
	.align 2, 0
_0813C9EC: .4byte 0x03002360
_0813C9F0:
	bl SetDispcntReg
	ldr r0, _0813CA20
	bl SetVBlankCallback
	bl PrintOnTrainerHillRecordsWindow
	ldr r0, _0813CA24
	movs r1, #8
	bl CreateTask
	ldr r0, _0813CA28
	bl SetMainCallback2
	ldr r0, _0813CA2C
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_0813CA18:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813CA20: .4byte 0x0813C8B5
_0813CA24: .4byte 0x0813C599
_0813CA28: .4byte 0x0813C8C9
_0813CA2C: .4byte 0x03002360
	thumb_func_end CB2_ShowTrainerHillRecords

