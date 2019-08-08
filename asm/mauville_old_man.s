.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetupBard
SetupBard: @ 0x081205C0
	push {r4, lr}
	ldr r0, _08120600
	ldr r2, [r0]
	ldr r1, _08120604
	adds r0, r2, r1
	movs r1, #0
	strb r1, [r0]
	ldr r3, _08120608
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0812060C
	ldrb r1, [r0]
	adds r3, #1
	adds r0, r2, r3
	strb r1, [r0]
	movs r3, #0
	ldr r0, _08120610
	adds r2, r2, r0
	ldr r4, _08120614
_081205E6:
	lsls r0, r3, #1
	adds r1, r2, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #5
	bls _081205E6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120600: .4byte 0x03005AEC
_08120604: .4byte 0x00002E28
_08120608: .4byte 0x00002E51
_0812060C: .4byte 0x0829BDA5
_08120610: .4byte 0x00002E2A
_08120614: .4byte 0x0857AC08
	thumb_func_end SetupBard

	thumb_func_start SetupHipster
SetupHipster: @ 0x08120618
	ldr r0, _08120630
	ldr r1, [r0]
	ldr r0, _08120634
	adds r1, r1, r0
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	strb r2, [r1, #1]
	ldr r0, _08120638
	ldrb r0, [r0]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_08120630: .4byte 0x03005AEC
_08120634: .4byte 0x00002E28
_08120638: .4byte 0x0829BDA5
	thumb_func_end SetupHipster

	thumb_func_start ResetStorytellerFlag
ResetStorytellerFlag: @ 0x0812063C
	push {lr}
	bl StorytellerSetup
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetStorytellerFlag

	thumb_func_start SetupGiddy
SetupGiddy: @ 0x08120648
	ldr r0, _08120664
	ldr r1, [r0]
	ldr r0, _08120668
	adds r2, r1, r0
	movs r3, #0
	movs r0, #4
	strb r0, [r2]
	strb r3, [r2, #1]
	ldr r0, _0812066C
	ldrb r0, [r0]
	ldr r2, _08120670
	adds r1, r1, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08120664: .4byte 0x03005AEC
_08120668: .4byte 0x00002E28
_0812066C: .4byte 0x0829BDA5
_08120670: .4byte 0x00002E48
	thumb_func_end SetupGiddy

	thumb_func_start ResetTraderFlag
ResetTraderFlag: @ 0x08120674
	push {lr}
	bl TraderSetup
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetTraderFlag

	thumb_func_start SetMauvilleOldMan
SetMauvilleOldMan: @ 0x08120680
	push {lr}
	ldr r0, _081206A8
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	lsls r1, r1, #8
	ldrb r0, [r0, #0xa]
	orrs r0, r1
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #4
	bhi _081206E0
	lsls r0, r0, #2
	ldr r1, _081206AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081206A8: .4byte 0x03005AF0
_081206AC: .4byte 0x081206B0
_081206B0: @ jump table
	.4byte _081206C4 @ case 0
	.4byte _081206CA @ case 1
	.4byte _081206D0 @ case 2
	.4byte _081206D6 @ case 3
	.4byte _081206DC @ case 4
_081206C4:
	bl SetupBard
	b _081206E0
_081206CA:
	bl SetupHipster
	b _081206E0
_081206D0:
	bl ResetTraderFlag
	b _081206E0
_081206D6:
	bl ResetStorytellerFlag
	b _081206E0
_081206DC:
	bl SetupGiddy
_081206E0:
	bl ScrSpecial_SetMauvilleOldManEventObjGfx
	pop {r0}
	bx r0
	thumb_func_end SetMauvilleOldMan

	thumb_func_start GetCurrentMauvilleOldMan
GetCurrentMauvilleOldMan: @ 0x081206E8
	ldr r0, _081206F4
	ldr r0, [r0]
	ldr r1, _081206F8
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_081206F4: .4byte 0x03005AEC
_081206F8: .4byte 0x00002E28
	thumb_func_end GetCurrentMauvilleOldMan

	thumb_func_start ScrSpecial_GetCurrentMauvilleMan
ScrSpecial_GetCurrentMauvilleMan: @ 0x081206FC
	push {r4, lr}
	ldr r4, _08120710
	bl GetCurrentMauvilleOldMan
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120710: .4byte 0x02037290
	thumb_func_end ScrSpecial_GetCurrentMauvilleMan

	thumb_func_start ScrSpecial_HasBardSongBeenChanged
ScrSpecial_HasBardSongBeenChanged: @ 0x08120714
	ldr r1, _08120724
	ldr r0, _08120728
	ldr r0, [r0]
	ldr r2, _0812072C
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08120724: .4byte 0x02037290
_08120728: .4byte 0x03005AEC
_0812072C: .4byte 0x00002E51
	thumb_func_end ScrSpecial_HasBardSongBeenChanged

	thumb_func_start ScrSpecial_SaveBardSongLyrics
ScrSpecial_SaveBardSongLyrics: @ 0x08120730
	push {r4, r5, r6, lr}
	ldr r0, _0812078C
	ldr r4, [r0]
	ldr r0, _08120790
	adds r6, r4, r0
	ldr r1, _08120794
	adds r0, r4, r1
	ldr r5, _08120798
	ldr r1, [r5]
	bl StringCopy
	movs r2, #0
	ldr r0, _0812079C
	adds r4, r4, r0
_0812074C:
	adds r1, r4, r2
	ldr r0, [r5]
	adds r0, #0xa
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #3
	bls _0812074C
	movs r2, #0
	adds r5, r6, #0
	adds r5, #0x29
	adds r3, r6, #2
	adds r4, r6, #0
	adds r4, #0xe
_0812076E:
	lsls r0, r2, #1
	adds r1, r3, r0
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #5
	bls _0812076E
	movs r0, #1
	strb r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812078C: .4byte 0x03005AEC
_08120790: .4byte 0x00002E28
_08120794: .4byte 0x00002E42
_08120798: .4byte 0x03005AF0
_0812079C: .4byte 0x00002E4D
	thumb_func_end ScrSpecial_SaveBardSongLyrics

	thumb_func_start sub_081207A0
sub_081207A0: @ 0x081207A0
	push {r4, r5, lr}
	ldr r0, _0812080C
	ldr r1, [r0]
	ldr r0, _08120810
	ldrh r0, [r0]
	ldr r2, _08120814
	adds r4, r1, r2
	cmp r0, #0
	bne _081207B6
	ldr r0, _08120818
	adds r4, r1, r0
_081207B6:
	ldr r2, _0812081C
	movs r5, #0
_081207BA:
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r2, #0
	bl CopyEasyChatWord
	adds r2, r0, #0
	movs r0, #0
	strb r0, [r2]
	adds r2, #1
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r2, #0
	bl CopyEasyChatWord
	adds r2, r0, #0
	movs r0, #0xfe
	strb r0, [r2]
	adds r2, #1
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r2, #0
	bl CopyEasyChatWord
	adds r2, r0, #0
	cmp r5, #0
	bne _081207FA
	movs r0, #0xfc
	strb r0, [r2]
	adds r2, #1
	movs r0, #0xf
	strb r0, [r2]
	adds r2, #1
_081207FA:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #1
	bls _081207BA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812080C: .4byte 0x03005AEC
_08120810: .4byte 0x02037280
_08120814: .4byte 0x00002E36
_08120818: .4byte 0x00002E2A
_0812081C: .4byte 0x02021C7C
	thumb_func_end sub_081207A0

	thumb_func_start ScrSpecial_PlayBardSong
ScrSpecial_PlayBardSong: @ 0x08120820
	push {lr}
	ldr r0, _08120834
	ldrb r0, [r0]
	bl StartBardSong
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_08120834: .4byte 0x02037280
	thumb_func_end ScrSpecial_PlayBardSong

	thumb_func_start ScrSpecial_GetHipsterSpokenFlag
ScrSpecial_GetHipsterSpokenFlag: @ 0x08120838
	ldr r1, _08120848
	ldr r0, _0812084C
	ldr r0, [r0]
	ldr r2, _08120850
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08120848: .4byte 0x02037290
_0812084C: .4byte 0x03005AEC
_08120850: .4byte 0x00002E28
	thumb_func_end ScrSpecial_GetHipsterSpokenFlag

	thumb_func_start ScrSpecial_SetHipsterSpokenFlag
ScrSpecial_SetHipsterSpokenFlag: @ 0x08120854
	ldr r0, _08120864
	ldr r0, [r0]
	ldr r1, _08120868
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_08120864: .4byte 0x03005AEC
_08120868: .4byte 0x00002E28
	thumb_func_end ScrSpecial_SetHipsterSpokenFlag

	thumb_func_start ScrSpecial_HipsterTeachWord
ScrSpecial_HipsterTeachWord: @ 0x0812086C
	push {lr}
	bl sub_0811F4FC
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08120884
	cmp r1, r0
	bne _0812088C
	ldr r1, _08120888
	movs r0, #0
	b _08120896
	.align 2, 0
_08120884: .4byte 0x0000FFFF
_08120888: .4byte 0x02037290
_0812088C:
	ldr r0, _0812089C
	bl CopyEasyChatWord
	ldr r1, _081208A0
	movs r0, #1
_08120896:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0812089C: .4byte 0x02021C40
_081208A0: .4byte 0x02037290
	thumb_func_end ScrSpecial_HipsterTeachWord

	thumb_func_start ScrSpecial_GiddyShouldTellAnotherTale
ScrSpecial_GiddyShouldTellAnotherTale: @ 0x081208A4
	push {lr}
	ldr r0, _081208C0
	ldr r0, [r0]
	ldr r1, _081208C4
	adds r2, r0, r1
	ldrb r0, [r2, #1]
	cmp r0, #0xa
	bne _081208CC
	ldr r1, _081208C8
	movs r0, #0
	strh r0, [r1]
	strb r0, [r2, #1]
	b _081208D2
	.align 2, 0
_081208C0: .4byte 0x03005AEC
_081208C4: .4byte 0x00002E28
_081208C8: .4byte 0x02037290
_081208CC:
	ldr r1, _081208D8
	movs r0, #1
	strh r0, [r1]
_081208D2:
	pop {r0}
	bx r0
	.align 2, 0
_081208D8: .4byte 0x02037290
	thumb_func_end ScrSpecial_GiddyShouldTellAnotherTale

	thumb_func_start ScrSpecial_GenerateGiddyLine
ScrSpecial_GenerateGiddyLine: @ 0x081208DC
	push {r4, r5, r6, lr}
	ldr r0, _08120940
	ldr r4, [r0]
	ldr r0, _08120944
	adds r5, r4, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _081208F0
	bl InitGiddyTaleList
_081208F0:
	ldrb r0, [r5, #1]
	lsls r0, r0, #1
	ldr r1, _08120948
	adds r6, r4, r1
	adds r0, r6, r0
	ldrh r1, [r0]
	ldr r0, _0812094C
	cmp r1, r0
	beq _08120960
	bl Random
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #7
	ands r4, r0
	ldr r0, _08120950
	ldrb r1, [r5, #1]
	lsls r1, r1, #1
	adds r1, r6, r1
	ldrh r1, [r1]
	bl CopyEasyChatWord
	adds r2, r0, #0
	ldr r1, _08120954
	bl StringCopy
	adds r2, r0, #0
	ldr r0, _08120958
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r1, [r4]
	adds r0, r2, #0
	bl StringCopy
	adds r2, r0, #0
	ldr r1, _0812095C
	bl StringCopy
	b _08120982
	.align 2, 0
_08120940: .4byte 0x03005AEC
_08120944: .4byte 0x00002E28
_08120948: .4byte 0x00002E2C
_0812094C: .4byte 0x0000FFFF
_08120950: .4byte 0x02021C7C
_08120954: .4byte 0x0825941C
_08120958: .4byte 0x0857AC14
_0812095C: .4byte 0x0825941F
_08120960:
	ldr r0, _0812099C
	ldr r3, _081209A0
	ldrb r2, [r5, #2]
	adds r1, r2, #1
	strb r1, [r5, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r6, #0xb9
	lsls r6, r6, #6
	adds r1, r4, r6
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl StringCopy
_08120982:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081209A4
	movs r0, #0xa
	b _081209A8
	.align 2, 0
_0812099C: .4byte 0x02021C7C
_081209A0: .4byte 0x0857AC34
_081209A4:
	ldrb r0, [r5, #1]
	adds r0, #1
_081209A8:
	strb r0, [r5, #1]
	ldr r1, _081209B8
	movs r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081209B8: .4byte 0x02037290
	thumb_func_end ScrSpecial_GenerateGiddyLine

	thumb_func_start InitGiddyTaleList
InitGiddyTaleList: @ 0x081209BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08120A8C
	ldr r4, [r0]
	ldr r0, _08120A90
	adds r0, r4, r0
	str r0, [sp, #0x18]
	ldr r1, _08120A94
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	movs r5, #0
	movs r1, #2
	add r1, sp
	mov r8, r1
	movs r2, #0xb9
	lsls r2, r2, #6
	adds r3, r4, r2
	adds r1, r3, #0
_081209EC:
	adds r0, r3, r5
	strb r5, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #7
	bls _081209EC
	movs r5, #0
	ldr r3, [sp, #0x18]
	adds r3, #4
	mov sb, r3
	adds r6, r1, #0
_08120A04:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r5, #1
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r6, r5
	ldrb r7, [r2]
	adds r1, r6, r1
	ldrb r0, [r1]
	strb r0, [r2]
	strb r7, [r1]
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	cmp r5, #7
	bls _08120A04
	movs r0, #0
	mov sl, r0
	movs r5, #0
_08120A32:
	lsls r4, r5, #2
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl EasyChat_GetNumWordsInGroup
	add r4, r8
	strh r0, [r4]
	add r0, sl
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _08120A32
	movs r0, #0
	ldr r2, [sp, #0x18]
	strb r0, [r2, #2]
	movs r7, #0
	movs r5, #0
_08120A5E:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #2
	bhi _08120A9C
	cmp r7, #7
	bhi _08120A9C
	lsls r0, r5, #1
	add r0, sb
	ldr r1, _08120A98
	strh r1, [r0]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r4, r5, #1
	b _08120AEE
	.align 2, 0
_08120A8C: .4byte 0x03005AEC
_08120A90: .4byte 0x00002E28
_08120A94: .4byte 0x0857AC54
_08120A98: .4byte 0x0000FFFF
_08120A9C:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	adds r4, r5, #1
	lsls r6, r5, #1
	cmp r5, #5
	bhi _08120AD8
	mov r3, r8
	ldrh r0, [r3]
	b _08120ACE
_08120ABE:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #5
	bhi _08120AD8
	lsls r0, r1, #2
	adds r0, r3, r0
	ldrh r0, [r0]
_08120ACE:
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bgt _08120ABE
_08120AD8:
	cmp r1, #6
	bne _08120ADE
	movs r1, #0
_08120ADE:
	lsls r0, r1, #2
	add r0, sp
	ldrh r0, [r0]
	bl sub_0811F370
	mov r2, sb
	adds r1, r2, r6
	strh r0, [r1]
_08120AEE:
	lsls r0, r4, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #9
	bls _08120A5E
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitGiddyTaleList

	thumb_func_start ResetBardFlag
ResetBardFlag: @ 0x08120B08
	ldr r0, _08120B18
	ldr r0, [r0]
	ldr r1, _08120B1C
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08120B18: .4byte 0x03005AEC
_08120B1C: .4byte 0x00002E51
	thumb_func_end ResetBardFlag

	thumb_func_start ResetHipsterFlag
ResetHipsterFlag: @ 0x08120B20
	ldr r0, _08120B30
	ldr r0, [r0]
	ldr r1, _08120B34
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_08120B30: .4byte 0x03005AEC
_08120B34: .4byte 0x00002E28
	thumb_func_end ResetHipsterFlag

	thumb_func_start SetupStoryteller
SetupStoryteller: @ 0x08120B38
	push {lr}
	bl Trader_ResetFlag
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetupStoryteller

	thumb_func_start SetupTrader
SetupTrader: @ 0x08120B44
	push {lr}
	bl Storyteller_ResetFlag
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetupTrader

	thumb_func_start ResetMauvilleOldManFlag
ResetMauvilleOldManFlag: @ 0x08120B50
	push {lr}
	bl GetCurrentMauvilleOldMan
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _08120B96
	lsls r0, r0, #2
	ldr r1, _08120B68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08120B68: .4byte 0x08120B6C
_08120B6C: @ jump table
	.4byte _08120B80 @ case 0
	.4byte _08120B86 @ case 1
	.4byte _08120B92 @ case 2
	.4byte _08120B8C @ case 3
	.4byte _08120B96 @ case 4
_08120B80:
	bl ResetBardFlag
	b _08120B96
_08120B86:
	bl ResetHipsterFlag
	b _08120B96
_08120B8C:
	bl SetupTrader
	b _08120B96
_08120B92:
	bl SetupStoryteller
_08120B96:
	bl ScrSpecial_SetMauvilleOldManEventObjGfx
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetMauvilleOldManFlag

	thumb_func_start StartBardSong
StartBardSong: @ 0x08120BA0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08120BC8
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08120BCC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120BC8: .4byte 0x08120C2D
_08120BCC: .4byte 0x03005B60
	thumb_func_end StartBardSong

	thumb_func_start sub_08120BD0
sub_08120BD0: @ 0x08120BD0
	ldr r1, _08120BD8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08120BD8: .4byte 0x03003024
	thumb_func_end sub_08120BD0

	thumb_func_start BardSong_TextSubPrinter
BardSong_TextSubPrinter: @ 0x08120BDC
	ldr r1, _08120BE4
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08120BE4: .4byte 0x03003024
	thumb_func_end BardSong_TextSubPrinter

	thumb_func_start ScrSpecial_StorytellerDisplayStory
ScrSpecial_StorytellerDisplayStory: @ 0x08120BE8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	movs r0, #2
	str r0, [sp]
	movs r4, #1
	str r4, [sp, #4]
	ldr r0, _08120C24
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, _08120C28
	strb r4, [r0]
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120C24: .4byte 0x08120BDD
_08120C28: .4byte 0x03003024
	thumb_func_end ScrSpecial_StorytellerDisplayStory

	thumb_func_start Task_BardSong
Task_BardSong: @ 0x08120C2C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _08120C50
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bls _08120C46
	b _08120E0C
_08120C46:
	lsls r0, r0, #2
	ldr r1, _08120C54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08120C50: .4byte 0x03005B60
_08120C54: .4byte 0x08120C58
_08120C58: @ jump table
	.4byte _08120C70 @ case 0
	.4byte _08120C94 @ case 1
	.4byte _08120CA4 @ case 2
	.4byte _08120D4E @ case 3
	.4byte _08120DFC @ case 4
	.4byte _08120D3E @ case 5
_08120C70:
	bl sub_081207A0
	ldr r0, _08120C90
	bl ScrSpecial_StorytellerDisplayStory
	movs r0, #0
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	movs r0, #4
	bl FadeInBGM
	movs r0, #1
	b _08120E0A
	.align 2, 0
_08120C90: .4byte 0x02021C7C
_08120C94:
	bl IsBGMPausedOrStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08120CA0
	b _08120E0C
_08120CA0:
	movs r0, #2
	b _08120E0A
_08120CA4:
	ldr r0, _08120CC4
	ldr r0, [r0]
	ldr r2, _08120CC8
	adds r5, r0, r2
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	ldr r0, _08120CCC
	adds r1, r1, r0
	movs r3, #0
	ldrb r0, [r1]
	ldrh r2, [r4, #0x12]
	ldr r7, _08120CD0
	adds r6, r4, #0
	adds r6, #8
	b _08120CDE
	.align 2, 0
_08120CC4: .4byte 0x03005AEC
_08120CC8: .4byte 0x00002E28
_08120CCC: .4byte 0x02021C7C
_08120CD0: .4byte 0x02039DF4
_08120CD4:
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r0, [r1]
_08120CDE:
	cmp r0, #0
	beq _08120CEE
	cmp r0, #0xfe
	beq _08120CEE
	cmp r0, #0xfc
	beq _08120CEE
	cmp r0, #0xff
	bne _08120CD4
_08120CEE:
	cmp r2, #0
	bne _08120CFC
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	lsls r1, r1, #1
	adds r0, r5, #2
	b _08120D06
_08120CFC:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0xe
_08120D06:
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #3
	ands r1, r0
	lsrs r0, r0, #3
	movs r2, #1
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r7]
	ldrh r2, [r7]
	adds r0, r6, #0
	adds r1, r3, #0
	bl CalcWordPitch
	ldrh r0, [r4, #0x10]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x10]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08120D36
	movs r0, #3
	b _08120D38
_08120D36:
	movs r0, #5
_08120D38:
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	b _08120E0C
_08120D3E:
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08120E08
	subs r0, r1, #1
	strh r0, [r4, #0xc]
	b _08120E0C
_08120D4E:
	ldr r1, _08120D70
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	adds r1, r0, r1
	ldrb r5, [r1]
	cmp r5, #0xff
	bne _08120D74
	movs r0, #6
	bl FadeOutBGM
	bl EnableBothScriptContexts
	adds r0, r6, #0
	bl DestroyTask
	b _08120E0C
	.align 2, 0
_08120D70: .4byte 0x02021C7C
_08120D74:
	cmp r5, #0
	bne _08120D8A
	bl sub_08120BD0
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	movs r0, #2
	strh r0, [r4, #8]
	strh r5, [r4, #0xc]
	b _08120E0C
_08120D8A:
	cmp r5, #0xfe
	bne _08120D9E
	ldrh r0, [r4, #0xe]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0xe]
	movs r0, #2
	strh r0, [r4, #8]
	strh r1, [r4, #0xc]
	b _08120E0C
_08120D9E:
	cmp r5, #0xfc
	bne _08120DB2
	ldrh r0, [r4, #0xe]
	adds r0, #2
	strh r0, [r4, #0xe]
	movs r0, #2
	strh r0, [r4, #8]
	movs r0, #8
	strh r0, [r4, #0xc]
	b _08120E0C
_08120DB2:
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #1
	beq _08120DD0
	cmp r0, #1
	bgt _08120DC4
	cmp r0, #0
	beq _08120DCA
	b _08120E0C
_08120DC4:
	cmp r0, #2
	beq _08120DE2
	b _08120E0C
_08120DCA:
	bl sub_08120BD0
	b _08120DDA
_08120DD0:
	adds r0, r4, #0
	adds r0, #8
	ldrb r1, [r1]
	bl GetWordPhonemes
_08120DDA:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	b _08120E0C
_08120DE2:
	adds r0, r4, #0
	adds r0, #8
	bl GetWordSounds
	ldrh r0, [r4, #0xe]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0xe]
	strh r1, [r4, #0xa]
	movs r0, #0x10
	strh r0, [r4, #0xc]
	movs r0, #4
	b _08120E0A
_08120DFC:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08120E0C
_08120E08:
	movs r0, #3
_08120E0A:
	strh r0, [r4, #8]
_08120E0C:
	bl RunTextPrintersAndIsPrinter0Active
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_BardSong

	thumb_func_start ScrSpecial_SetMauvilleOldManEventObjGfx
ScrSpecial_SetMauvilleOldManEventObjGfx: @ 0x08120E18
	push {lr}
	ldr r0, _08120E28
	movs r1, #0x45
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08120E28: .4byte 0x00004010
	thumb_func_end ScrSpecial_SetMauvilleOldManEventObjGfx

	thumb_func_start StorytellerDisplayStory
StorytellerDisplayStory: @ 0x08120E2C
	push {r4, r5, r6, lr}
	ldrb r1, [r0]
	cmp r1, #2
	beq _08120E3A
	cmp r1, #3
	beq _08120E64
	b _08120E86
_08120E3A:
	adds r6, r0, #0
	movs r5, #0
_08120E3E:
	movs r0, #0xb
	muls r0, r5, r0
	adds r0, #5
	adds r4, r6, r0
	adds r0, r4, #0
	bl IsStringJapanese
	cmp r0, #0
	beq _08120E58
	adds r0, r4, #0
	ldr r1, _08120E60
	bl StringCopy
_08120E58:
	adds r5, #1
	cmp r5, #3
	ble _08120E3E
	b _08120E86
	.align 2, 0
_08120E60: .4byte 0x085CCEC5
_08120E64:
	adds r4, r0, #0
	adds r4, #8
	movs r5, #3
_08120E6A:
	adds r0, r4, #0
	bl IsStringJapanese
	cmp r0, #0
	beq _08120E7E
	adds r0, r4, #0
	ldr r1, _08120E8C
	movs r2, #7
	bl StringCopyN
_08120E7E:
	adds r4, #7
	subs r5, #1
	cmp r5, #0
	bge _08120E6A
_08120E86:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120E8C: .4byte 0x085CCEC5
	thumb_func_end StorytellerDisplayStory

	thumb_func_start sub_08120E90
sub_08120E90: @ 0x08120E90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldrb r0, [r5]
	cmp r0, #4
	bhi _08120F48
	lsls r0, r0, #2
	ldr r1, _08120EAC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08120EAC: .4byte 0x08120EB0
_08120EB0: @ jump table
	.4byte _08120F16 @ case 0
	.4byte _08120F26 @ case 1
	.4byte _08120EC4 @ case 2
	.4byte _08120EEE @ case 3
	.4byte _08120F34 @ case 4
_08120EC4:
	adds r6, r5, #0
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0x32
_08120ECC:
	movs r0, #0xb
	muls r0, r5, r0
	adds r0, #5
	adds r0, r6, r0
	bl IsStringJapanese
	cmp r0, #0
	beq _08120EE2
	mov r0, r8
	strb r0, [r4]
	b _08120EE4
_08120EE2:
	strb r7, [r4]
_08120EE4:
	adds r4, #1
	adds r5, #1
	cmp r5, #3
	ble _08120ECC
	b _08120F48
_08120EEE:
	adds r4, r5, #0
	adds r4, #0x34
	adds r6, r5, #0
	adds r6, #8
	movs r5, #3
_08120EF8:
	adds r0, r6, #0
	bl IsStringJapanese
	cmp r0, #0
	beq _08120F08
	mov r1, r8
	strb r1, [r4]
	b _08120F0A
_08120F08:
	strb r7, [r4]
_08120F0A:
	adds r4, #1
	adds r6, #7
	subs r5, #1
	cmp r5, #0
	bge _08120EF8
	b _08120F48
_08120F16:
	cmp r3, #1
	bne _08120F20
	adds r0, r5, #0
	adds r0, #0x2a
	b _08120F3C
_08120F20:
	adds r0, r5, #0
	adds r0, #0x2a
	b _08120F46
_08120F26:
	cmp r3, #1
	bne _08120F30
	mov r0, r8
	strb r0, [r5, #2]
	b _08120F48
_08120F30:
	strb r7, [r5, #2]
	b _08120F48
_08120F34:
	cmp r3, #1
	bne _08120F42
	adds r0, r5, #0
	adds r0, #0x20
_08120F3C:
	mov r1, r8
	strb r1, [r0]
	b _08120F48
_08120F42:
	adds r0, r5, #0
	adds r0, #0x20
_08120F46:
	strb r7, [r0]
_08120F48:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08120E90

	thumb_func_start StorytellerSetup
StorytellerSetup: @ 0x08120F54
	push {r4, r5, lr}
	ldr r2, _08120F90
	ldr r0, _08120F94
	ldr r0, [r0]
	ldr r1, _08120F98
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
	movs r1, #3
	strb r1, [r0]
	ldr r0, [r2]
	strb r3, [r0, #1]
	movs r5, #0
	movs r4, #0xff
_08120F70:
	ldr r0, [r2]
	adds r0, #4
	adds r0, r0, r3
	strb r5, [r0]
	ldr r1, [r2]
	adds r1, #8
	adds r1, r1, r3
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r3, #1
	cmp r3, #3
	ble _08120F70
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120F90: .4byte 0x02039DF8
_08120F94: .4byte 0x03005AEC
_08120F98: .4byte 0x00002E28
	thumb_func_end StorytellerSetup

	thumb_func_start Storyteller_ResetFlag
Storyteller_ResetFlag: @ 0x08120F9C
	ldr r3, _08120FB4
	ldr r0, _08120FB8
	ldr r0, [r0]
	ldr r1, _08120FBC
	adds r0, r0, r1
	str r0, [r3]
	movs r2, #0
	movs r1, #3
	strb r1, [r0]
	ldr r0, [r3]
	strb r2, [r0, #1]
	bx lr
	.align 2, 0
_08120FB4: .4byte 0x02039DF8
_08120FB8: .4byte 0x03005AEC
_08120FBC: .4byte 0x00002E28
	thumb_func_end Storyteller_ResetFlag

	thumb_func_start StorytellerGetGameStat
StorytellerGetGameStat: @ 0x08120FC0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x32
	bne _08120FCC
	movs r0, #0
_08120FCC:
	bl GetGameStat
	pop {r1}
	bx r1
	thumb_func_end StorytellerGetGameStat

	thumb_func_start GetStoryByStat
GetStoryByStat: @ 0x08120FD4
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _08120FE8
_08120FDC:
	ldrb r0, [r1]
	cmp r0, r3
	bne _08120FEC
	adds r0, r1, #0
	b _08120FF6
	.align 2, 0
_08120FE8: .4byte 0x0857AC6C
_08120FEC:
	adds r1, #0x10
	adds r2, #1
	cmp r2, #0x23
	ble _08120FDC
	ldr r0, _08120FFC
_08120FF6:
	pop {r1}
	bx r1
	.align 2, 0
_08120FFC: .4byte 0x0857AE9C
	thumb_func_end GetStoryByStat

	thumb_func_start GetStoryTitleByStat
GetStoryTitleByStat: @ 0x08121000
	push {lr}
	bl GetStoryByStat
	ldr r0, [r0, #4]
	pop {r1}
	bx r1
	thumb_func_end GetStoryTitleByStat

	thumb_func_start GetStoryTextByStat
GetStoryTextByStat: @ 0x0812100C
	push {lr}
	bl GetStoryByStat
	ldr r0, [r0, #0xc]
	pop {r1}
	bx r1
	thumb_func_end GetStoryTextByStat

	thumb_func_start GetStoryActionByStat
GetStoryActionByStat: @ 0x08121018
	push {lr}
	bl GetStoryByStat
	ldr r0, [r0, #8]
	pop {r1}
	bx r1
	thumb_func_end GetStoryActionByStat

	thumb_func_start GetFreeStorySlot
GetFreeStorySlot: @ 0x08121024
	push {lr}
	movs r1, #0
	ldr r2, _08121050
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08121048
_08121032:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _08121048
	ldr r0, [r2]
	adds r0, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08121032
_08121048:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08121050: .4byte 0x02039DF8
	thumb_func_end GetFreeStorySlot

	thumb_func_start StorytellerGetRecordedTrainerStat
StorytellerGetRecordedTrainerStat: @ 0x08121054
	ldr r1, _08121074
	lsls r0, r0, #2
	adds r0, #0x24
	ldr r2, [r1]
	adds r2, r2, r0
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	orrs r0, r1
	ldrb r1, [r2, #2]
	lsls r1, r1, #0x10
	orrs r0, r1
	ldrb r1, [r2, #3]
	lsls r1, r1, #0x18
	orrs r0, r1
	bx lr
	.align 2, 0
_08121074: .4byte 0x02039DF8
	thumb_func_end StorytellerGetRecordedTrainerStat

	thumb_func_start StorytellerSetRecordedTrainerStat
StorytellerSetRecordedTrainerStat: @ 0x08121078
	ldr r2, _08121094
	lsls r0, r0, #2
	adds r0, #0x24
	ldr r2, [r2]
	adds r2, r2, r0
	strb r1, [r2]
	lsrs r0, r1, #8
	strb r0, [r2, #1]
	lsrs r0, r1, #0x10
	strb r0, [r2, #2]
	lsrs r1, r1, #0x18
	strb r1, [r2, #3]
	bx lr
	.align 2, 0
_08121094: .4byte 0x02039DF8
	thumb_func_end StorytellerSetRecordedTrainerStat

	thumb_func_start HasTrainerStatIncreased
HasTrainerStatIncreased: @ 0x08121098
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _081210BC
	ldr r0, [r0]
	adds r0, #4
	adds r0, r0, r5
	ldrb r0, [r0]
	bl StorytellerGetGameStat
	adds r4, r0, #0
	adds r0, r5, #0
	bl StorytellerGetRecordedTrainerStat
	cmp r4, r0
	bhi _081210C0
	movs r0, #0
	b _081210C2
	.align 2, 0
_081210BC: .4byte 0x02039DF8
_081210C0:
	movs r0, #1
_081210C2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end HasTrainerStatIncreased

	thumb_func_start GetStoryByStattellerPlayerName
GetStoryByStattellerPlayerName: @ 0x081210C8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _081210F4
	lsls r1, r0, #3
	subs r1, r1, r0
	adds r1, #8
	ldr r4, [r2]
	adds r4, r4, r1
	adds r0, r5, #0
	movs r1, #0xff
	movs r2, #8
	bl memset
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #7
	bl memcpy
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081210F4: .4byte 0x02039DF8
	thumb_func_end GetStoryByStattellerPlayerName

	thumb_func_start StorytellerSetPlayerName
StorytellerSetPlayerName: @ 0x081210F8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _08121124
	lsls r1, r0, #3
	subs r1, r1, r0
	adds r1, #8
	ldr r4, [r2]
	adds r4, r4, r1
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #7
	bl memset
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl memcpy
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08121124: .4byte 0x02039DF8
	thumb_func_end StorytellerSetPlayerName

	thumb_func_start StorytellerRecordNewStat
StorytellerRecordNewStat: @ 0x08121128
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	adds r6, r1, #0
	ldr r0, _0812119C
	mov sb, r0
	ldr r0, [r0]
	adds r0, #4
	add r0, r8
	strb r6, [r0]
	ldr r0, _081211A0
	ldr r1, [r0]
	mov r0, r8
	bl StorytellerSetPlayerName
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl StorytellerGetGameStat
	adds r1, r0, #0
	mov r0, r8
	bl StorytellerSetRecordedTrainerStat
	ldr r5, _081211A4
	adds r0, r4, #0
	bl StorytellerGetGameStat
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0xa
	bl ConvertIntToDecimalStringN
	ldr r4, _081211A8
	adds r0, r6, #0
	bl GetStoryActionByStat
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0x34
	add r0, r8
	ldr r1, _081211AC
	ldrb r1, [r1]
	strb r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812119C: .4byte 0x02039DF8
_081211A0: .4byte 0x03005AF0
_081211A4: .4byte 0x02021C40
_081211A8: .4byte 0x02021C54
_081211AC: .4byte 0x0829BDA5
	thumb_func_end StorytellerRecordNewStat

	thumb_func_start ScrambleStatList
ScrambleStatList: @ 0x081211B0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0
	cmp r5, r6
	bge _081211C6
_081211BC:
	adds r0, r7, r5
	strb r5, [r0]
	adds r5, #1
	cmp r5, r6
	blt _081211BC
_081211C6:
	cmp r6, #0
	ble _081211FC
	adds r5, r6, #0
_081211CC:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	adds r4, r0, #0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	adds r4, r7, r4
	ldrb r2, [r4]
	adds r0, r7, r0
	ldrb r1, [r0]
	strb r1, [r4]
	strb r2, [r0]
	subs r5, #1
	cmp r5, #0
	bne _081211CC
_081211FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ScrambleStatList

	thumb_func_start StorytellerInitializeRandomStat
StorytellerInitializeRandomStat: @ 0x08121204
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r7, sp
	mov r8, sp
	ldr r0, _0812128C
	ldr r0, [r0]
	lsls r0, r0, #3
	lsrs r0, r0, #3
	adds r0, #3
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r1, sp
	subs r1, r1, r0
	mov sp, r1
	mov sb, sp
	mov r0, sp
	movs r1, #0x24
	bl ScrambleStatList
	movs r5, #0
_08121230:
	ldr r1, _08121290
	mov r2, sb
	adds r0, r2, r5
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r4, [r0]
	ldrb r6, [r0, #1]
	movs r1, #0
	ldr r2, _08121294
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	cmp r0, r4
	beq _0812125E
_0812124C:
	adds r1, #1
	cmp r1, #3
	bgt _0812125E
	ldr r0, [r2]
	adds r0, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, r4
	bne _0812124C
_0812125E:
	cmp r1, #4
	bne _081212AE
	adds r0, r4, #0
	bl StorytellerGetGameStat
	cmp r0, r6
	blo _081212AE
	ldr r0, _08121294
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #1]
	bl GetFreeStorySlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0812129C
	ldr r0, _08121298
	ldrb r0, [r0]
	adds r1, r4, #0
	bl StorytellerRecordNewStat
	b _081212AA
	.align 2, 0
_0812128C: .4byte 0x0857AEAC
_08121290: .4byte 0x0857AC6C
_08121294: .4byte 0x02039DF8
_08121298: .4byte 0x03001178
_0812129C:
	bl GetFreeStorySlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl StorytellerRecordNewStat
_081212AA:
	movs r0, #1
	b _081212B6
_081212AE:
	adds r5, #1
	cmp r5, #0x23
	ble _08121230
	movs r0, #0
_081212B6:
	mov sp, r8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end StorytellerInitializeRandomStat

	thumb_func_start ScrSpecial_StorytellerGetFreeStorySlot
ScrSpecial_StorytellerGetFreeStorySlot: @ 0x081212C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08121310
	ldr r0, [r0]
	adds r0, #4
	adds r0, r0, r5
	ldrb r6, [r0]
	ldr r4, _08121314
	adds r0, r5, #0
	bl StorytellerGetRecordedTrainerStat
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0xa
	bl ConvertIntToDecimalStringN
	ldr r4, _08121318
	adds r0, r6, #0
	bl GetStoryActionByStat
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _0812131C
	adds r0, r5, #0
	bl GetStoryByStattellerPlayerName
	adds r0, r6, #0
	bl GetStoryTextByStat
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08121310: .4byte 0x02039DF8
_08121314: .4byte 0x02021C40
_08121318: .4byte 0x02021C54
_0812131C: .4byte 0x02021C68
	thumb_func_end ScrSpecial_StorytellerGetFreeStorySlot

	thumb_func_start PrintStoryList
PrintStoryList: @ 0x08121320
	push {r4, r5, lr}
	sub sp, #0xc
	bl GetFreeStorySlot
	adds r3, r0, #0
	lsls r3, r3, #0x19
	movs r0, #0x80
	lsls r0, r0, #0x12
	adds r3, r3, r0
	lsrs r3, r3, #0x18
	movs r0, #0
	movs r1, #0
	movs r2, #0x17
	bl CreateWindowFromRect
	ldr r1, _081213E0
	strb r0, [r1]
	ldrb r0, [r1]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	movs r5, #0
	ldr r0, _081213E4
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08121392
	movs r4, #0x80
	lsls r4, r4, #0x12
_0812135A:
	bl GetStoryTitleByStat
	adds r2, r0, #0
	ldr r0, _081213E0
	ldrb r0, [r0]
	lsrs r1, r4, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0xa
	bl AddTextPrinterParameterized
	movs r0, #0x80
	lsls r0, r0, #0x15
	adds r4, r4, r0
	adds r5, #1
	cmp r5, #3
	bgt _08121392
	ldr r0, _081213E4
	ldr r0, [r0]
	adds r0, #4
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0812135A
_08121392:
	ldr r4, _081213E0
	ldrb r0, [r4]
	ldr r2, _081213E8
	lsls r1, r5, #4
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r1, #1
	movs r3, #0xa
	bl AddTextPrinterParameterized
	bl GetFreeStorySlot
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r1, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984F0
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081213E0: .4byte 0x02039DFC
_081213E4: .4byte 0x02039DF8
_081213E8: .4byte 0x085CB1B9
	thumb_func_end PrintStoryList

	thumb_func_start Task_StoryListMenu
Task_StoryListMenu: @ 0x081213EC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0812140C
	adds r4, r0, r1
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #0
	beq _08121410
	cmp r5, #1
	beq _0812141C
	b _08121466
	.align 2, 0
_0812140C: .4byte 0x03005B60
_08121410:
	bl PrintStoryList
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08121466
_0812141C:
	bl Menu_ProcessInput
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08121466
	adds r0, #1
	cmp r4, r0
	beq _0812143E
	bl GetFreeStorySlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0812144C
_0812143E:
	ldr r1, _08121448
	movs r0, #0
	strh r0, [r1]
	b _08121454
	.align 2, 0
_08121448: .4byte 0x02037290
_0812144C:
	ldr r0, _0812146C
	strh r5, [r0]
	ldr r0, _08121470
	strb r4, [r0]
_08121454:
	ldr r0, _08121474
	ldrb r0, [r0]
	bl ClearToTransparentAndRemoveWindow
	adds r0, r6, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_08121466:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812146C: .4byte 0x02037290
_08121470: .4byte 0x03001178
_08121474: .4byte 0x02039DFC
	thumb_func_end Task_StoryListMenu

	thumb_func_start ScrSpecial_StorytellerStoryListMenu
ScrSpecial_StorytellerStoryListMenu: @ 0x08121478
	push {lr}
	ldr r0, _08121488
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08121488: .4byte 0x081213ED
	thumb_func_end ScrSpecial_StorytellerStoryListMenu

	thumb_func_start sub_0812148C
sub_0812148C: @ 0x0812148C
	push {lr}
	ldr r0, _0812149C
	ldrb r0, [r0]
	bl ScrSpecial_StorytellerGetFreeStorySlot
	pop {r0}
	bx r0
	.align 2, 0
_0812149C: .4byte 0x03001178
	thumb_func_end sub_0812148C

	thumb_func_start ScrSpecial_StorytellerInitializeRandomStat
ScrSpecial_StorytellerInitializeRandomStat: @ 0x081214A0
	push {lr}
	ldr r1, _081214BC
	ldr r0, _081214C0
	ldr r0, [r0]
	ldr r2, _081214C4
	adds r0, r0, r2
	str r0, [r1]
	bl GetFreeStorySlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081214BC: .4byte 0x02039DF8
_081214C0: .4byte 0x03005AEC
_081214C4: .4byte 0x00002E28
	thumb_func_end ScrSpecial_StorytellerInitializeRandomStat

	thumb_func_start ScrSpecial_StorytellerUpdateStat
ScrSpecial_StorytellerUpdateStat: @ 0x081214C8
	push {r4, r5, lr}
	ldr r2, _081214F0
	ldr r0, _081214F4
	ldr r1, [r0]
	ldr r3, _081214F8
	adds r0, r1, r3
	str r0, [r2]
	ldr r5, _081214FC
	ldrb r0, [r5]
	ldr r2, _08121500
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r4, [r1]
	bl HasTrainerStatIncreased
	cmp r0, #1
	beq _08121504
	movs r0, #0
	b _0812150E
	.align 2, 0
_081214F0: .4byte 0x02039DF8
_081214F4: .4byte 0x03005AEC
_081214F8: .4byte 0x00002E28
_081214FC: .4byte 0x03001178
_08121500: .4byte 0x00002E2C
_08121504:
	ldrb r0, [r5]
	adds r1, r4, #0
	bl StorytellerRecordNewStat
	movs r0, #1
_0812150E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrSpecial_StorytellerUpdateStat

	thumb_func_start ScrSpecial_HasStorytellerAlreadyRecorded
ScrSpecial_HasStorytellerAlreadyRecorded: @ 0x08121514
	push {lr}
	ldr r1, _0812152C
	ldr r0, _08121530
	ldr r0, [r0]
	ldr r2, _08121534
	adds r0, r0, r2
	str r0, [r1]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _08121538
	movs r0, #1
	b _0812153A
	.align 2, 0
_0812152C: .4byte 0x02039DF8
_08121530: .4byte 0x03005AEC
_08121534: .4byte 0x00002E28
_08121538:
	movs r0, #0
_0812153A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrSpecial_HasStorytellerAlreadyRecorded

	thumb_func_start SanitizeReceivedEmeraldOldMan
SanitizeReceivedEmeraldOldMan: @ 0x08121540
	push {lr}
	ldr r1, _0812155C
	ldr r0, _08121560
	ldr r0, [r0]
	ldr r2, _08121564
	adds r0, r0, r2
	str r0, [r1]
	bl StorytellerInitializeRandomStat
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0812155C: .4byte 0x02039DF8
_08121560: .4byte 0x03005AEC
_08121564: .4byte 0x00002E28
	thumb_func_end SanitizeReceivedEmeraldOldMan

