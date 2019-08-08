.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitDewfordTrend
InitDewfordTrend: @ 0x081224E0
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r5, _08122514
_081224E6:
	movs r0, #0xa
	bl sub_0811F318
	ldr r1, [r5]
	lsls r4, r6, #3
	adds r1, r1, r4
	ldr r2, _08122518
	adds r1, r1, r2
	strh r0, [r1]
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08122520
	movs r0, #0xc
	bl sub_0811F318
	ldr r1, [r5]
	adds r1, r1, r4
	ldr r7, _0812251C
	adds r1, r1, r7
	b _0812252E
	.align 2, 0
_08122514: .4byte 0x03005AEC
_08122518: .4byte 0x00002E6C
_0812251C: .4byte 0x00002E6E
_08122520:
	movs r0, #0xd
	bl sub_0811F318
	ldr r1, [r5]
	adds r1, r1, r4
	ldr r2, _0812257C
	adds r1, r1, r2
_0812252E:
	strh r0, [r1]
	bl Random
	ldr r3, [r5]
	adds r3, r3, r4
	movs r2, #1
	ands r2, r0
	ldr r7, _08122580
	adds r3, r3, r7
	lsls r2, r2, #6
	ldrb r0, [r3]
	movs r7, #0x41
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	ldr r0, _08122584
	adds r1, r4, r0
	ldr r0, [r5]
	adds r0, r0, r1
	bl sub_08122B34
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #4
	bls _081224E6
	ldr r0, _08122588
	ldr r0, [r0]
	ldr r1, _08122584
	adds r0, r0, r1
	movs r1, #5
	movs r2, #0
	bl sub_08122810
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812257C: .4byte 0x00002E6E
_08122580: .4byte 0x00002E69
_08122584: .4byte 0x00002E68
_08122588: .4byte 0x03005AEC
	thumb_func_end InitDewfordTrend

	thumb_func_start UpdateDewfordTrendPerDay
UpdateDewfordTrendPerDay: @ 0x0812258C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _081225A2
	b _081226CA
_081225A2:
	lsls r0, r1, #2
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	mov sl, r0
	movs r1, #0x7f
	mov sb, r1
	movs r2, #0x80
	rsbs r2, r2, #0
	mov r8, r2
_081225B6:
	ldr r2, [sp]
	mov r3, sl
	lsls r0, r3, #3
	ldr r4, _081225FC
	adds r0, r0, r4
	ldr r3, _08122600
	ldr r1, [r3]
	adds r5, r1, r0
	ldrb r6, [r5, #1]
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	bne _08122614
	ldrb r4, [r5]
	lsls r3, r4, #0x19
	lsrs r1, r3, #0x19
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	blo _08122604
	adds r0, r1, #0
	subs r0, r0, r2
	mov r1, sb
	ands r0, r1
	mov r1, r8
	ands r1, r4
	orrs r1, r0
	strb r1, [r5]
	movs r0, #0x7f
	ands r1, r0
	cmp r1, #0
	bne _081226AA
	movs r0, #0x40
	orrs r0, r6
	b _081226A8
	.align 2, 0
_081225FC: .4byte 0x00002E68
_08122600: .4byte 0x03005AEC
_08122604:
	lsrs r0, r3, #0x19
	subs r2, r2, r0
	mov r0, r8
	ands r0, r4
	strb r0, [r5]
	movs r0, #0x40
	orrs r0, r6
	strb r0, [r5, #1]
_08122614:
	ldrb r7, [r5]
	lsls r0, r7, #0x19
	lsrs r0, r0, #0x19
	adds r4, r0, r2
	ldrh r0, [r5]
	lsls r6, r0, #0x12
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r6, #0x19
	cmp r0, r1
	bls _08122684
	adds r0, r4, #0
	bl __umodsi3
	adds r3, r0, #0
	lsrs r1, r6, #0x19
	adds r0, r4, #0
	str r3, [sp, #4]
	bl __udivsi3
	adds r4, r0, #0
	movs r0, #1
	eors r4, r0
	ands r4, r0
	lsls r2, r4, #6
	ldrb r0, [r5, #1]
	movs r4, #0x41
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #1]
	movs r1, #0x40
	ands r0, r1
	ldr r3, [sp, #4]
	cmp r0, #0
	beq _0812266E
	adds r1, r3, #0
	mov r0, sb
	ands r1, r0
	mov r0, r8
	ands r0, r7
	orrs r0, r1
	strb r0, [r5]
	b _081226AA
_0812266E:
	ldrh r0, [r5]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x19
	subs r0, r0, r3
	mov r1, sb
	ands r0, r1
	mov r1, r8
	ands r1, r7
	orrs r1, r0
	strb r1, [r5]
	b _081226AA
_08122684:
	mov r2, sb
	ands r4, r2
	mov r0, r8
	ands r0, r7
	orrs r0, r4
	strb r0, [r5]
	lsls r0, r0, #0x19
	ldrh r1, [r5]
	lsls r1, r1, #0x12
	lsrs r0, r0, #0x19
	lsrs r1, r1, #0x19
	cmp r0, r1
	bne _081226AA
	ldrb r0, [r5, #1]
	movs r3, #0x41
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
_081226A8:
	strb r0, [r5, #1]
_081226AA:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #4
	bhi _081226BA
	b _081225B6
_081226BA:
	ldr r4, _081226DC
	ldr r0, [r4]
	ldr r1, _081226E0
	adds r0, r0, r1
	movs r1, #5
	movs r2, #0
	bl sub_08122810
_081226CA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081226DC: .4byte 0x03005AEC
_081226E0: .4byte 0x00002E68
	thumb_func_end UpdateDewfordTrendPerDay

	thumb_func_start sub_081226E4
sub_081226E4: @ 0x081226E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	movs r0, #0
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r8
	bl SB1ContainsWords
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08122704
	b _081227FE
_08122704:
	ldr r4, _08122740
	adds r0, r4, #0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08122750
	adds r0, r4, #0
	bl FlagSet
	ldr r0, _08122744
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08122750
	ldr r0, _08122748
	ldr r1, [r0]
	mov r0, r8
	ldrh r2, [r0]
	ldr r3, _0812274C
	adds r0, r1, r3
	strh r2, [r0]
	mov r2, r8
	ldrh r0, [r2, #2]
	adds r3, #2
	adds r1, r1, r3
	strh r0, [r1]
	movs r0, #1
	b _08122800
	.align 2, 0
_08122740: .4byte 0x00000893
_08122744: .4byte 0x00000894
_08122748: .4byte 0x03005AEC
_0812274C: .4byte 0x00002E6C
_08122750:
	mov r0, r8
	ldrh r1, [r0, #2]
	lsls r1, r1, #0x10
	ldrh r0, [r0]
	orrs r0, r1
	str r0, [sp, #4]
	movs r1, #0x80
	lsls r1, r1, #7
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	mov r0, sp
	bl sub_08122B34
	movs r5, #0
_0812276E:
	ldr r6, _081227D8
	lsls r4, r5, #3
	ldr r1, _081227DC
	adds r0, r4, r1
	ldr r1, [r6]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0
	bl sub_08122A64
	lsls r0, r0, #0x18
	adds r7, r4, #0
	cmp r0, #0
	beq _081227E0
	movs r2, #4
	mov ip, r6
	cmp r2, r5
	bls _081227B2
	ldr r4, _081227DC
_08122794:
	ldr r0, [r6]
	lsls r3, r2, #3
	adds r0, r0, r4
	adds r3, r0, r3
	subs r2, #1
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, r5
	bhi _08122794
_081227B2:
	mov r3, ip
	ldr r2, [r3]
	ldr r0, _081227DC
	adds r2, r2, r0
	adds r2, r2, r7
	ldr r0, [sp]
	ldr r1, [sp, #4]
	str r0, [r2]
	str r1, [r2, #4]
	cmp r5, #4
	bne _081227CE
	mov r0, r8
	bl sub_080EE780
_081227CE:
	movs r0, #0
	cmp r5, #0
	bne _08122800
	movs r0, #1
	b _08122800
	.align 2, 0
_081227D8: .4byte 0x03005AEC
_081227DC: .4byte 0x00002E68
_081227E0:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _0812276E
	ldr r2, [r6]
	ldr r1, _0812280C
	adds r2, r2, r1
	ldr r0, [sp]
	ldr r1, [sp, #4]
	str r0, [r2]
	str r1, [r2, #4]
	mov r0, r8
	bl sub_080EE780
_081227FE:
	movs r0, #0
_08122800:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812280C: .4byte 0x00002E88
	thumb_func_end sub_081226E4

	thumb_func_start sub_08122810
sub_08122810: @ 0x08122810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	movs r2, #0
	cmp r2, r7
	bhs _08122878
_0812282C:
	adds r1, r2, #1
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	mov r8, r1
	cmp r5, r7
	bhs _0812286E
	lsls r0, r2, #3
	mov r1, sb
	adds r6, r1, r0
_0812283E:
	lsls r0, r5, #3
	mov r1, sb
	adds r4, r1, r0
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sl
	bl sub_08122A64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08122864
	ldr r2, [r4]
	ldr r3, [r4, #4]
	ldr r0, [r6]
	ldr r1, [r6, #4]
	str r0, [r4]
	str r1, [r4, #4]
	str r2, [r6]
	str r3, [r6, #4]
_08122864:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r7
	blo _0812283E
_0812286E:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r7
	blo _0812282C
_08122878:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08122810

	thumb_func_start ReceiveEasyChatPairsData
ReceiveEasyChatPairsData: @ 0x08122888
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl Alloc
	mov sl, r0
	cmp r0, #0
	beq _0812298C
	adds r0, r4, #0
	bl Alloc
	adds r7, r0, #0
	cmp r7, #0
	bne _081228BC
	mov r0, sl
	bl Free
	b _0812298C
_081228BC:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r5, #0
	cmp r5, sb
	bhs _081228EA
_081228CC:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	add r0, sl
	adds r1, r5, #0
	muls r1, r6, r1
	add r1, r8
	movs r2, #0x28
	bl memcpy
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	blo _081228CC
_081228EA:
	mov r4, sl
	mov r8, r7
	movs r3, #0
	movs r5, #0
	cmp r5, sb
	bhs _08122952
_081228F6:
	movs r6, #0
_081228F8:
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r3, #0
	str r3, [sp]
	bl GetEqualEasyChatPairIndex
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp]
	cmp r0, #0
	bge _08122924
	ldr r0, [r4]
	ldr r1, [r4, #4]
	mov r2, r8
	adds r2, #8
	mov r8, r2
	subs r2, #8
	stm r2!, {r0, r1}
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _0812293C
_08122924:
	lsls r0, r0, #3
	adds r2, r7, r0
	ldrb r1, [r2]
	lsls r1, r1, #0x19
	ldrb r0, [r4]
	lsls r0, r0, #0x19
	cmp r1, r0
	bhs _0812293C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	str r0, [r2]
	str r1, [r2, #4]
_0812293C:
	adds r4, #8
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #4
	bls _081228F8
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	blo _081228F6
_08122952:
	adds r0, r7, #0
	adds r1, r3, #0
	movs r2, #2
	bl sub_08122810
	adds r4, r7, #0
	ldr r0, _0812299C
	ldr r0, [r0]
	ldr r1, _081229A0
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
_0812296A:
	ldm r4!, {r0, r1}
	mov r2, r8
	adds r2, #8
	mov r8, r2
	subs r2, #8
	stm r2!, {r0, r1}
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _0812296A
	mov r0, sl
	bl Free
	adds r0, r7, #0
	bl Free
_0812298C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812299C: .4byte 0x03005AEC
_081229A0: .4byte 0x00002E68
	thumb_func_end ReceiveEasyChatPairsData

	thumb_func_start BufferTrendyPhraseString
BufferTrendyPhraseString: @ 0x081229A4
	push {lr}
	ldr r2, _081229C4
	ldr r0, _081229C8
	ldrh r1, [r0]
	lsls r1, r1, #3
	ldr r0, [r2]
	adds r1, r1, r0
	ldr r0, _081229CC
	ldr r2, _081229D0
	adds r1, r1, r2
	movs r2, #2
	movs r3, #1
	bl ConvertEasyChatWordsToString
	pop {r0}
	bx r0
	.align 2, 0
_081229C4: .4byte 0x03005AEC
_081229C8: .4byte 0x02037280
_081229CC: .4byte 0x02021C40
_081229D0: .4byte 0x00002E6C
	thumb_func_end BufferTrendyPhraseString

	thumb_func_start TrendyPhraseIsOld
TrendyPhraseIsOld: @ 0x081229D4
	push {r4, lr}
	movs r4, #0
	ldr r0, _08122A24
	ldr r3, [r0]
	ldr r1, _08122A28
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	ldr r2, _08122A2C
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	subs r1, r1, r0
	cmp r1, #1
	bgt _08122A18
	ldr r1, _08122A30
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08122A18
	ldr r1, _08122A34
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
_08122A18:
	ldr r0, _08122A38
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122A24: .4byte 0x03005AEC
_08122A28: .4byte 0x00002E68
_08122A2C: .4byte 0x00002E70
_08122A30: .4byte 0x00002E69
_08122A34: .4byte 0x00002E71
_08122A38: .4byte 0x02037290
	thumb_func_end TrendyPhraseIsOld

	thumb_func_start GetDewfordHallPaintingNameIndex
GetDewfordHallPaintingNameIndex: @ 0x08122A3C
	ldr r2, _08122A58
	ldr r0, _08122A5C
	ldr r0, [r0]
	ldr r3, _08122A60
	adds r1, r0, r3
	adds r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #7
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08122A58: .4byte 0x02037290
_08122A5C: .4byte 0x03005AEC
_08122A60: .4byte 0x00002E6C
	thumb_func_end GetDewfordHallPaintingNameIndex

	thumb_func_start sub_08122A64
sub_08122A64: @ 0x08122A64
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r2, #0
	cmp r2, #1
	beq _08122AAA
	cmp r2, #1
	bgt _08122A7E
	cmp r2, #0
	beq _08122A84
	b _08122B26
_08122A7E:
	cmp r0, #2
	beq _08122AD6
	b _08122B26
_08122A84:
	ldrb r0, [r3]
	lsls r1, r0, #0x19
	ldrb r0, [r5]
	lsls r0, r0, #0x19
	cmp r1, r0
	bhi _08122B22
	cmp r1, r0
	blo _08122AD2
	ldrh r0, [r3]
	lsls r3, r0, #0x12
	ldrh r0, [r5]
	lsls r2, r0, #0x12
	lsrs r1, r3, #0x19
	lsrs r0, r2, #0x19
	cmp r1, r0
	bhi _08122B22
	lsrs r1, r3, #0x19
	lsrs r0, r2, #0x19
	b _08122ACE
_08122AAA:
	ldrh r0, [r3]
	lsls r4, r0, #0x12
	ldrh r0, [r5]
	lsls r2, r0, #0x12
	lsrs r1, r4, #0x19
	lsrs r0, r2, #0x19
	cmp r1, r0
	bhi _08122B22
	lsrs r1, r4, #0x19
	lsrs r0, r2, #0x19
	cmp r1, r0
	blo _08122AD2
	ldrb r0, [r3]
	lsls r1, r0, #0x19
	ldrb r0, [r5]
	lsls r0, r0, #0x19
	cmp r1, r0
	bhi _08122B22
_08122ACE:
	cmp r1, r0
	bhs _08122B26
_08122AD2:
	movs r0, #0
	b _08122B2E
_08122AD6:
	ldrb r0, [r3]
	lsls r1, r0, #0x19
	ldrb r0, [r5]
	lsls r0, r0, #0x19
	cmp r1, r0
	bhi _08122B22
	cmp r1, r0
	blo _08122AD2
	ldrh r0, [r3]
	lsls r4, r0, #0x12
	ldrh r0, [r5]
	lsls r2, r0, #0x12
	lsrs r1, r4, #0x19
	lsrs r0, r2, #0x19
	cmp r1, r0
	bhi _08122B22
	lsrs r1, r4, #0x19
	lsrs r0, r2, #0x19
	cmp r1, r0
	blo _08122AD2
	ldrh r1, [r3, #2]
	ldrh r0, [r5, #2]
	cmp r1, r0
	bhi _08122B22
	cmp r1, r0
	blo _08122AD2
	ldrh r1, [r3, #4]
	ldrh r0, [r5, #4]
	cmp r1, r0
	bhi _08122B22
	cmp r1, r0
	blo _08122AD2
	ldrh r1, [r3, #6]
	ldrh r0, [r5, #6]
	cmp r1, r0
	bhi _08122B22
	cmp r1, r0
	blo _08122AD2
_08122B22:
	movs r0, #1
	b _08122B2E
_08122B26:
	bl Random
	movs r1, #1
	ands r0, r1
_08122B2E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08122A64

	thumb_func_start sub_08122B34
sub_08122B34: @ 0x08122B34
	push {r4, r5, lr}
	adds r5, r0, #0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x62
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x32
	bls _08122B76
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x62
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x50
	bls _08122B76
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x62
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08122B76:
	adds r1, r4, #0
	adds r1, #0x1e
	movs r0, #0x7f
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r5]
	ldr r0, _08122BB8
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #1
	bl __modsi3
	adds r0, #0x1e
	movs r1, #0x7f
	ands r0, r1
	ldrb r2, [r5]
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	bl Random
	strh r0, [r5, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08122BB8: .4byte 0xFFFFC07F
	thumb_func_end sub_08122B34

	thumb_func_start SB1ContainsWords
SB1ContainsWords: @ 0x08122BBC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r6, _08122BE0
_08122BC4:
	lsls r1, r4, #3
	ldr r0, [r6]
	adds r1, r1, r0
	ldr r0, _08122BE4
	adds r1, r1, r0
	adds r0, r5, #0
	bl IsEasyChatPairEqual
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08122BE8
	movs r0, #1
	b _08122BF4
	.align 2, 0
_08122BE0: .4byte 0x03005AEC
_08122BE4: .4byte 0x00002E6C
_08122BE8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08122BC4
	movs r0, #0
_08122BF4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SB1ContainsWords

	thumb_func_start IsEasyChatPairEqual
IsEasyChatPairEqual: @ 0x08122BFC
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r4, #0
_08122C04:
	ldrh r1, [r3]
	ldrh r0, [r2]
	adds r2, #2
	adds r3, #2
	cmp r1, r0
	beq _08122C14
	movs r0, #0
	b _08122C20
_08122C14:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bls _08122C04
	movs r0, #1
_08122C20:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsEasyChatPairEqual

	thumb_func_start GetEqualEasyChatPairIndex
GetEqualEasyChatPairIndex: @ 0x08122C28
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r4, #0
	cmp r4, r6
	bge _08122C5E
_08122C38:
	adds r1, r5, #4
	adds r0, r7, #4
	bl IsEasyChatPairEqual
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08122C4C
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	b _08122C62
_08122C4C:
	adds r5, #8
	lsls r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	blt _08122C38
_08122C5E:
	movs r0, #1
	rsbs r0, r0, #0
_08122C62:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetEqualEasyChatPairIndex

