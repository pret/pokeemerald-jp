.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start PlayerPartnerCmdEnd
PlayerPartnerCmdEnd: @ 0x081BAA8C
	bx lr
	.align 2, 0
	thumb_func_end PlayerPartnerCmdEnd

	thumb_func_start SetControllerToPlayerPartner
SetControllerToPlayerPartner: @ 0x081BAA90
	ldr r1, _081BAAA0
	ldr r0, _081BAAA4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BAAA8
	str r1, [r0]
	bx lr
	.align 2, 0
_081BAAA0: .4byte 0x03005AC0
_081BAAA4: .4byte 0x02023D08
_081BAAA8: .4byte 0x081BAAAD
	thumb_func_end SetControllerToPlayerPartner

	thumb_func_start PlayerPartnerBufferRunCommand
PlayerPartnerBufferRunCommand: @ 0x081BAAAC
	push {lr}
	ldr r2, _081BAAE0
	ldr r1, _081BAAE4
	ldr r0, _081BAAE8
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _081BAAF8
	ldr r0, _081BAAEC
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _081BAAF4
	ldr r0, _081BAAF0
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _081BAAF8
	.align 2, 0
_081BAAE0: .4byte 0x02023D0C
_081BAAE4: .4byte 0x082FACB4
_081BAAE8: .4byte 0x02023D08
_081BAAEC: .4byte 0x02022D08
_081BAAF0: .4byte 0x085E732C
_081BAAF4:
	bl PlayerPartnerBufferExecCompleted
_081BAAF8:
	pop {r0}
	bx r0
	thumb_func_end PlayerPartnerBufferRunCommand

	thumb_func_start CompleteOnBattlerSpriteCallbackDummy
CompleteOnBattlerSpriteCallbackDummy: @ 0x081BAAFC
	push {lr}
	ldr r2, _081BAB24
	ldr r1, _081BAB28
	ldr r0, _081BAB2C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081BAB30
	cmp r1, r0
	bne _081BAB20
	bl PlayerPartnerBufferExecCompleted
_081BAB20:
	pop {r0}
	bx r0
	.align 2, 0
_081BAB24: .4byte 0x020205AC
_081BAB28: .4byte 0x02023E88
_081BAB2C: .4byte 0x02023D08
_081BAB30: .4byte 0x08007141
	thumb_func_end CompleteOnBattlerSpriteCallbackDummy

	thumb_func_start sub_081BAB34
sub_081BAB34: @ 0x081BAB34
	push {r4, r5, r6, lr}
	ldr r6, _081BAB8C
	ldr r5, _081BAB90
	ldr r4, _081BAB94
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _081BAB98
	cmp r1, r0
	bne _081BAB84
	movs r0, #0
	bl sub_0805DBFC
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	bl PlayerPartnerBufferExecCompleted
_081BAB84:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BAB8C: .4byte 0x020205AC
_081BAB90: .4byte 0x02023E88
_081BAB94: .4byte 0x02023D08
_081BAB98: .4byte 0x08007141
	thumb_func_end sub_081BAB34

	thumb_func_start sub_081BAB9C
sub_081BAB9C: @ 0x081BAB9C
	push {r4, lr}
	ldr r4, _081BABDC
	ldr r1, [r4]
	ldr r3, _081BABE0
	ldrb r0, [r3]
	ldr r2, [r1, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _081BABD4
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #9]
	bl PlayerPartnerBufferExecCompleted
_081BABD4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BABDC: .4byte 0x02024174
_081BABE0: .4byte 0x02023D08
	thumb_func_end sub_081BAB9C

	thumb_func_start sub_081BABE4
sub_081BABE4: @ 0x081BABE4
	push {r4, r5, r6, lr}
	movs r6, #0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BAC08
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BAC3C
	ldr r0, _081BAC28
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081BAC3C
_081BAC08:
	ldr r2, _081BAC2C
	ldr r1, _081BAC30
	ldr r0, _081BAC34
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081BAC38
	cmp r1, r0
	bne _081BAC74
	b _081BAC72
	.align 2, 0
_081BAC28: .4byte 0x02022C90
_081BAC2C: .4byte 0x020205AC
_081BAC30: .4byte 0x03005AD0
_081BAC34: .4byte 0x02023D08
_081BAC38: .4byte 0x08007141
_081BAC3C:
	ldr r2, _081BACAC
	ldr r5, _081BACB0
	ldr r0, _081BACB4
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r2, #0
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r2, [r0]
	ldr r0, _081BACB8
	cmp r2, r0
	bne _081BAC74
	movs r0, #2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, r2
	bne _081BAC74
_081BAC72:
	movs r6, #1
_081BAC74:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BAC80
	movs r6, #0
_081BAC80:
	cmp r6, #0
	beq _081BACA6
	ldr r0, _081BACBC
	ldr r0, [r0]
	ldr r3, _081BACB4
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #9]
	ldr r1, _081BACC0
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BACC4
	str r1, [r0]
_081BACA6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BACAC: .4byte 0x020205AC
_081BACB0: .4byte 0x03005AD0
_081BACB4: .4byte 0x02023D08
_081BACB8: .4byte 0x08007141
_081BACBC: .4byte 0x02024174
_081BACC0: .4byte 0x03005AC0
_081BACC4: .4byte 0x081BAB9D
	thumb_func_end sub_081BABE4

	thumb_func_start sub_081BACC8
sub_081BACC8: @ 0x081BACC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _081BAE40
	mov ip, r0
	ldr r0, [r0]
	ldr r7, _081BAE44
	ldrb r2, [r7]
	ldr r3, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r3
	ldrb r1, [r4]
	movs r5, #8
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _081BACF4
	b _081BAE32
_081BACF4:
	movs r1, #2
	mov r8, r1
	adds r1, r2, #0
	mov r0, r8
	eors r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _081BAD16
	b _081BAE32
_081BAD16:
	ldr r1, _081BAE48
	mov sl, r1
	ldr r0, _081BAE4C
	mov sb, r0
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r5, sl
	adds r5, #0x1c
	adds r0, r0, r5
	ldr r3, [r0]
	ldr r0, _081BAE50
	cmp r3, r0
	bne _081BAE32
	ldr r0, _081BAE54
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	bne _081BAE32
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081BAE32
	mov r1, ip
	ldr r0, [r1]
	ldrb r1, [r7]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r6, [r0, #9]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BADD0
	ldr r0, _081BAE58
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _081BADD0
	ldrb r0, [r7]
	mov r1, r8
	eors r0, r1
	add r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	bl DestroySprite
	ldr r4, _081BAE5C
	ldrb r0, [r7]
	mov r1, r8
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _081BAE60
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _081BAE64
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r7]
	mov r1, r8
	eors r0, r1
	bl sub_08076320
	ldrb r0, [r7]
	mov r1, r8
	eors r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
_081BADD0:
	ldr r1, _081BAE4C
	ldr r4, _081BAE44
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081BAE48
	adds r0, r0, r1
	bl DestroySprite
	ldr r5, _081BAE5C
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _081BAE60
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _081BAE64
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r0, _081BAE40
	ldr r0, [r0]
	ldr r2, [r0, #8]
	ldrb r1, [r2, #9]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldr r1, _081BAE68
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BAE6C
	str r1, [r0]
_081BAE32:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BAE40: .4byte 0x02024174
_081BAE44: .4byte 0x02023D08
_081BAE48: .4byte 0x020205AC
_081BAE4C: .4byte 0x03005ADC
_081BAE50: .4byte 0x08007141
_081BAE54: .4byte 0x02023E88
_081BAE58: .4byte 0x02022C90
_081BAE5C: .4byte 0x03005AD0
_081BAE60: .4byte 0x02023D12
_081BAE64: .4byte 0x02024190
_081BAE68: .4byte 0x03005AC0
_081BAE6C: .4byte 0x081BABE5
	thumb_func_end sub_081BACC8

	thumb_func_start sub_081BAE70
sub_081BAE70: @ 0x081BAE70
	push {lr}
	ldr r2, _081BAEA4
	ldr r1, _081BAEA8
	ldr r0, _081BAEAC
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _081BAE9E
	movs r2, #0x24
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _081BAE9E
	bl PlayerPartnerBufferExecCompleted
_081BAE9E:
	pop {r0}
	bx r0
	.align 2, 0
_081BAEA4: .4byte 0x020205AC
_081BAEA8: .4byte 0x02023E88
_081BAEAC: .4byte 0x02023D08
	thumb_func_end sub_081BAE70

	thumb_func_start CompleteOnHealthbarDone
CompleteOnHealthbarDone: @ 0x081BAEB0
	push {r4, r5, r6, lr}
	ldr r5, _081BAEF0
	ldrb r0, [r5]
	ldr r6, _081BAEF4
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, #0
	movs r3, #0
	bl MoveBattleBar
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081BAEF8
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r2, #0
	bl sub_080726F4
	b _081BAF12
	.align 2, 0
_081BAEF0: .4byte 0x02023D08
_081BAEF4: .4byte 0x03005AD0
_081BAEF8:
	ldr r2, _081BAF18
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _081BAF1C
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	bl PlayerPartnerBufferExecCompleted
_081BAF12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BAF18: .4byte 0x02023D12
_081BAF1C: .4byte 0x02024190
	thumb_func_end CompleteOnHealthbarDone

	thumb_func_start CompleteOnInactiveTextPrinter
CompleteOnInactiveTextPrinter: @ 0x081BAF20
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081BAF32
	bl PlayerPartnerBufferExecCompleted
_081BAF32:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CompleteOnInactiveTextPrinter

	thumb_func_start Task_GiveExpToMon
Task_GiveExpToMon: @ 0x081BAF38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _081BB038
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	mov r8, r0
	ldrb r0, [r0, #8]
	mov sl, r0
	mov r1, r8
	ldrb r7, [r1, #0xc]
	str r7, [sp, #8]
	ldrh r2, [r1, #0xa]
	str r2, [sp, #0xc]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081BAF7E
	ldr r1, _081BB03C
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp sl, r0
	bne _081BAF7E
	b _081BB094
_081BAF7E:
	movs r0, #0x64
	mov r1, sl
	muls r1, r0, r1
	ldr r0, _081BB040
	adds r6, r1, r0
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [sp, #4]
	ldr r3, _081BB044
	adds r4, #1
	lsls r4, r4, #2
	ldr r2, _081BB048
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x13]
	movs r1, #0xca
	lsls r1, r1, #1
	muls r1, r2, r1
	adds r4, r4, r1
	adds r4, r4, r3
	ldr r2, [r4]
	str r2, [sp]
	ldr r3, [sp, #0xc]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r1
	cmp r0, r2
	blo _081BB06C
	adds r0, r6, #0
	movs r1, #0x19
	mov r2, sp
	bl SetMonData
	adds r0, r6, #0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, #4
	ldrh r0, [r0]
	subs r2, r2, r0
	ldr r0, [sp, #0xc]
	subs r2, r0, r2
	ldr r4, _081BB04C
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xb
	bl BtlController_EmitTwoReturnValues
	strb r5, [r4]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081BB054
	ldr r2, _081BB03C
	lsls r0, r7, #1
	adds r0, r0, r2
	mov r1, sl
	ldrh r0, [r0]
	cmp r1, r0
	beq _081BB032
	movs r0, #2
	eors r7, r0
	lsls r0, r7, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r1, r0
	bne _081BB054
_081BB032:
	ldr r0, _081BB050
	b _081BB096
	.align 2, 0
_081BB038: .4byte 0x03005B60
_081BB03C: .4byte 0x02023D12
_081BB040: .4byte 0x02024190
_081BB044: .4byte 0x082F00B4
_081BB048: .4byte 0x082F0D54
_081BB04C: .4byte 0x02023D08
_081BB050: .4byte 0x081BB2C5
_081BB054:
	ldr r0, _081BB064
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081BB068
	b _081BB098
	.align 2, 0
_081BB064: .4byte 0x03005B60
_081BB068: .4byte 0x081BB3DD
_081BB06C:
	str r0, [sp, #4]
	add r2, sp, #4
	adds r0, r6, #0
	movs r1, #0x19
	bl SetMonData
	ldr r1, _081BB08C
	ldr r3, [sp, #8]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, _081BB090
	str r1, [r0]
	mov r0, sb
	bl DestroyTask
	b _081BB09A
	.align 2, 0
_081BB08C: .4byte 0x03005AC0
_081BB090: .4byte 0x081BAF21
_081BB094:
	ldr r0, _081BB0AC
_081BB096:
	mov r1, r8
_081BB098:
	str r0, [r1]
_081BB09A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BB0AC: .4byte 0x081BB0B1
	thumb_func_end Task_GiveExpToMon

	thumb_func_start Task_PrepareToGiveExpWithExpBar
Task_PrepareToGiveExpWithExpBar: @ 0x081BB0B0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081BB168
	lsls r2, r0, #2
	mov r8, r2
	add r8, r0
	mov r0, r8
	lsls r0, r0, #3
	mov r8, r0
	add r8, r1
	mov r2, r8
	ldrb r1, [r2, #8]
	movs r0, #0xa
	ldrsh r2, [r2, r0]
	mov sb, r2
	mov r2, r8
	ldrb r2, [r2, #0xc]
	mov sl, r2
	movs r0, #0x64
	adds r6, r1, #0
	muls r6, r0, r6
	ldr r0, _081BB16C
	adds r6, r6, r0
	adds r0, r6, #0
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	movs r1, #0x19
	bl GetMonData
	adds r3, r0, #0
	ldr r6, _081BB170
	lsls r1, r4, #2
	ldr r2, _081BB174
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r2, r0
	adds r1, r1, r0
	adds r1, r1, r6
	ldr r1, [r1]
	subs r3, r3, r1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r0
	adds r4, r4, r6
	ldr r2, [r4]
	subs r2, r2, r1
	ldr r0, _081BB178
	add r0, sl
	ldrb r1, [r0]
	mov r0, sb
	rsbs r0, r0, #0
	str r0, [sp]
	mov r0, sl
	bl SetBattleBarStruct
	movs r0, #0x21
	bl PlaySE
	ldr r0, _081BB17C
	mov r1, r8
	str r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BB168: .4byte 0x03005B60
_081BB16C: .4byte 0x02024190
_081BB170: .4byte 0x082F00B4
_081BB174: .4byte 0x082F0D54
_081BB178: .4byte 0x03005AD0
_081BB17C: .4byte 0x081BB181
	thumb_func_end Task_PrepareToGiveExpWithExpBar

	thumb_func_start sub_081BB180
sub_081BB180: @ 0x081BB180
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _081BB1AC
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r6, r0, r1
	ldrh r1, [r6, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r6, r2]
	cmp r0, #0xc
	bgt _081BB1B0
	adds r0, r1, #1
	strh r0, [r6, #0x1c]
	b _081BB2AC
	.align 2, 0
_081BB1AC: .4byte 0x03005B60
_081BB1B0:
	ldrb r0, [r6, #8]
	mov sb, r0
	ldrh r2, [r6, #0xa]
	mov sl, r2
	ldrb r7, [r6, #0xc]
	ldr r5, _081BB278
	adds r5, r7, r5
	ldrb r1, [r5]
	adds r0, r7, #0
	movs r2, #1
	movs r3, #0
	bl MoveBattleBar
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5]
	bl SetHealthboxSpriteVisible
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _081BB2AC
	movs r0, #0x21
	bl m4aSongNumStop
	movs r0, #0x64
	mov r1, sb
	muls r1, r0, r1
	ldr r0, _081BB27C
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _081BB280
	adds r4, #1
	lsls r4, r4, #2
	ldr r2, _081BB284
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r1, r0
	adds r4, r4, r0
	adds r4, r4, r3
	ldr r1, [r4]
	str r1, [sp]
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	ldr r0, [sp, #4]
	adds r0, r0, r4
	cmp r0, r1
	blt _081BB290
	adds r0, r5, #0
	movs r1, #0x19
	mov r2, sp
	bl SetMonData
	adds r0, r5, #0
	bl CalculateMonStats
	ldr r2, [sp]
	add r0, sp, #4
	ldrh r0, [r0]
	subs r2, r2, r0
	subs r2, r4, r2
	ldr r4, _081BB288
	ldrb r5, [r4]
	strb r7, [r4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xb
	bl BtlController_EmitTwoReturnValues
	strb r5, [r4]
	ldr r0, _081BB28C
	str r0, [r6]
	b _081BB2AC
	.align 2, 0
_081BB278: .4byte 0x03005AD0
_081BB27C: .4byte 0x02024190
_081BB280: .4byte 0x082F00B4
_081BB284: .4byte 0x082F0D54
_081BB288: .4byte 0x02023D08
_081BB28C: .4byte 0x081BB2C5
_081BB290:
	str r0, [sp, #4]
	add r2, sp, #4
	adds r0, r5, #0
	movs r1, #0x19
	bl SetMonData
	ldr r1, _081BB2BC
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r1, _081BB2C0
	str r1, [r0]
	mov r0, r8
	bl DestroyTask
_081BB2AC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BB2BC: .4byte 0x03005AC0
_081BB2C0: .4byte 0x081BAF21
	thumb_func_end sub_081BB180

	thumb_func_start sub_081BB2C4
sub_081BB2C4: @ 0x081BB2C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _081BB318
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r4, [r0, #0xc]
	ldrb r6, [r0, #8]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081BB2F8
	ldr r1, _081BB31C
	movs r0, #2
	adds r2, r4, #0
	eors r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bne _081BB2F8
	adds r4, r2, #0
_081BB2F8:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0
	bl InitAndLaunchSpecialAnimation
	ldr r0, _081BB318
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081BB320
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BB318: .4byte 0x03005B60
_081BB31C: .4byte 0x02023D12
_081BB320: .4byte 0x081BB325
	thumb_func_end sub_081BB2C4

	thumb_func_start sub_081BB324
sub_081BB324: @ 0x081BB324
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _081BB390
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrb r5, [r2, #0xc]
	ldr r0, _081BB394
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _081BB3C6
	ldrb r4, [r2, #8]
	movs r0, #0x64
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _081BB398
	adds r7, r1, r0
	adds r0, r7, #0
	movs r1, #0x38
	bl GetMonData
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081BB3A4
	ldr r1, _081BB39C
	movs r0, #2
	adds r2, r5, #0
	eors r2, r0
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _081BB3A4
	ldr r0, _081BB3A0
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r7, #0
	movs r2, #0
	bl UpdateHealthboxAttribute
	b _081BB3B8
	.align 2, 0
_081BB390: .4byte 0x03005B60
_081BB394: .4byte 0x02024174
_081BB398: .4byte 0x02024190
_081BB39C: .4byte 0x02023D12
_081BB3A0: .4byte 0x03005AD0
_081BB3A4:
	ldr r0, _081BB3CC
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, #0x64
	muls r1, r4, r1
	ldr r2, _081BB3D0
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
_081BB3B8:
	ldr r0, _081BB3D4
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081BB3D8
	str r0, [r1]
_081BB3C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BB3CC: .4byte 0x03005AD0
_081BB3D0: .4byte 0x02024190
_081BB3D4: .4byte 0x03005B60
_081BB3D8: .4byte 0x081BB3DD
	thumb_func_end sub_081BB324

	thumb_func_start DestroyExpTaskAndCompleteOnInactiveTextPrinter
DestroyExpTaskAndCompleteOnInactiveTextPrinter: @ 0x081BB3DC
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _081BB418
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r1, [r4, #8]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081BB41C
	adds r0, r0, r1
	movs r1, #0x38
	bl GetMonData
	ldrb r0, [r4, #0xc]
	ldr r1, _081BB420
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BB424
	str r1, [r0]
	adds r0, r5, #0
	bl DestroyTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BB418: .4byte 0x03005B60
_081BB41C: .4byte 0x02024190
_081BB420: .4byte 0x03005AC0
_081BB424: .4byte 0x081BAF21
	thumb_func_end DestroyExpTaskAndCompleteOnInactiveTextPrinter

	thumb_func_start sub_081BB428
sub_081BB428: @ 0x081BB428
	push {r4, r5, r6, lr}
	ldr r6, _081BB4AC
	ldr r5, _081BB4B0
	ldr r4, _081BB4B4
	ldrb r2, [r4]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r3, #0x22
	ldrsh r1, [r0, r3]
	movs r3, #0x26
	ldrsh r0, [r0, r3]
	adds r1, r1, r0
	cmp r1, #0xa0
	ble _081BB4A4
	ldr r1, _081BB4B8
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081BB4BC
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0805DB50
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	ldr r1, _081BB4C0
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerPartnerBufferExecCompleted
_081BB4A4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BB4AC: .4byte 0x020205AC
_081BB4B0: .4byte 0x02023E88
_081BB4B4: .4byte 0x02023D08
_081BB4B8: .4byte 0x02023D12
_081BB4BC: .4byte 0x02024190
_081BB4C0: .4byte 0x03005AD0
	thumb_func_end sub_081BB428

	thumb_func_start sub_081BB4C4
sub_081BB4C4: @ 0x081BB4C4
	push {r4, r5, r6, lr}
	ldr r0, _081BB520
	ldr r0, [r0]
	ldr r6, _081BB524
	ldrb r2, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _081BB518
	ldr r5, _081BB528
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081BB52C
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r1, _081BB530
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerPartnerBufferExecCompleted
_081BB518:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BB520: .4byte 0x02024174
_081BB524: .4byte 0x02023D08
_081BB528: .4byte 0x02023E88
_081BB52C: .4byte 0x020205AC
_081BB530: .4byte 0x03005AD0
	thumb_func_end sub_081BB4C4

	thumb_func_start CompleteOnInactiveTextPrinter2
CompleteOnInactiveTextPrinter2: @ 0x081BB534
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081BB546
	bl PlayerPartnerBufferExecCompleted
_081BB546:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CompleteOnInactiveTextPrinter2

	thumb_func_start DoHitAnimBlinkSpriteEffect
DoHitAnimBlinkSpriteEffect: @ 0x081BB54C
	push {r4, lr}
	ldr r1, _081BB588
	ldr r0, _081BB58C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _081BB590
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _081BB598
	movs r3, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _081BB594
	strb r3, [r0]
	bl PlayerPartnerBufferExecCompleted
	b _081BB5C2
	.align 2, 0
_081BB588: .4byte 0x02023E88
_081BB58C: .4byte 0x02023D08
_081BB590: .4byte 0x020205AC
_081BB594: .4byte 0x0202415D
_081BB598:
	ldrh r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _081BB5BC
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_081BB5BC:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_081BB5C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DoHitAnimBlinkSpriteEffect

	thumb_func_start sub_081BB5C8
sub_081BB5C8: @ 0x081BB5C8
	push {r4, lr}
	ldr r2, _081BB620
	ldr r0, _081BB624
	ldr r4, _081BB628
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081BB62C
	cmp r1, r0
	bne _081BB61A
	adds r0, r3, #0
	bl CopyBattleSpriteInvisibility
	ldr r0, _081BB630
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081BB60E
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
_081BB60E:
	ldr r0, _081BB634
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _081BB638
	str r0, [r1]
_081BB61A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BB620: .4byte 0x020205AC
_081BB624: .4byte 0x03005AD0
_081BB628: .4byte 0x02023D08
_081BB62C: .4byte 0x08007141
_081BB630: .4byte 0x02024174
_081BB634: .4byte 0x03005AC0
_081BB638: .4byte 0x081BB63D
	thumb_func_end sub_081BB5C8

	thumb_func_start sub_081BB63C
sub_081BB63C: @ 0x081BB63C
	push {lr}
	ldr r0, _081BB67C
	ldr r1, [r0]
	ldr r0, _081BB680
	ldrb r3, [r0]
	ldr r1, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _081BB678
	ldr r2, _081BB684
	ldr r0, _081BB688
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081BB68C
	cmp r1, r0
	bne _081BB678
	bl PlayerPartnerBufferExecCompleted
_081BB678:
	pop {r0}
	bx r0
	.align 2, 0
_081BB67C: .4byte 0x02024174
_081BB680: .4byte 0x02023D08
_081BB684: .4byte 0x020205AC
_081BB688: .4byte 0x02023E88
_081BB68C: .4byte 0x08007141
	thumb_func_end sub_081BB63C

	thumb_func_start sub_081BB690
sub_081BB690: @ 0x081BB690
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _081BB758
	ldr r0, [r3]
	ldr r7, _081BB75C
	ldrb r1, [r7]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r1, [r2, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081BB74C
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldrb r2, [r7]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldr r4, _081BB760
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldr r0, _081BB764
	movs r1, #0xa
	bl CreateTask
	ldr r0, _081BB768
	mov r8, r0
	ldrb r1, [r7]
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _081BB76C
	adds r0, r0, r5
	bl HandleLowHpMusicChange
	ldr r1, _081BB770
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081BB774
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAnim
	ldr r4, _081BB778
	ldrb r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	muls r1, r6, r1
	adds r1, r1, r5
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r7]
	bl sub_08076320
	ldrb r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r1, _081BB77C
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BB780
	str r1, [r0]
_081BB74C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BB758: .4byte 0x02024174
_081BB75C: .4byte 0x02023D08
_081BB760: .4byte 0x000027F9
_081BB764: .4byte 0x08058D11
_081BB768: .4byte 0x02023D12
_081BB76C: .4byte 0x02024190
_081BB770: .4byte 0x02023E88
_081BB774: .4byte 0x020205AC
_081BB778: .4byte 0x03005AD0
_081BB77C: .4byte 0x03005AC0
_081BB780: .4byte 0x081BB5C9
	thumb_func_end sub_081BB690

	thumb_func_start sub_081BB784
sub_081BB784: @ 0x081BB784
	push {r4, r5, r6, lr}
	ldr r6, _081BB804
	ldr r0, [r6]
	ldr r4, _081BB808
	ldrb r2, [r4]
	ldr r1, [r0, #4]
	lsls r3, r2, #1
	adds r0, r3, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	bne _081BB7B6
	ldr r0, _081BB80C
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081BB810
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_081BB7B6:
	ldr r5, _081BB814
	ldr r0, _081BB818
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _081BB81C
	cmp r1, r0
	bne _081BB7FC
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _081BB7FC
	adds r0, r3, r5
	bl DestroySprite
	ldr r1, _081BB820
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BB824
	str r1, [r0]
_081BB7FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BB804: .4byte 0x02024174
_081BB808: .4byte 0x02023D08
_081BB80C: .4byte 0x02023D12
_081BB810: .4byte 0x02024190
_081BB814: .4byte 0x020205AC
_081BB818: .4byte 0x03005ADC
_081BB81C: .4byte 0x08007141
_081BB820: .4byte 0x03005AC0
_081BB824: .4byte 0x081BB691
	thumb_func_end sub_081BB784

	thumb_func_start PlayerPartnerBufferExecCompleted
PlayerPartnerBufferExecCompleted: @ 0x081BB828
	push {r4, lr}
	sub sp, #4
	ldr r1, _081BB868
	ldr r4, _081BB86C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BB870
	str r1, [r0]
	ldr r0, _081BB874
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _081BB87C
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _081BB878
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _081BB88E
	.align 2, 0
_081BB868: .4byte 0x03005AC0
_081BB86C: .4byte 0x02023D08
_081BB870: .4byte 0x081BAAAD
_081BB874: .4byte 0x02022C90
_081BB878: .4byte 0x02022D08
_081BB87C:
	ldr r2, _081BB898
	ldr r1, _081BB89C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_081BB88E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BB898: .4byte 0x02023D0C
_081BB89C: .4byte 0x082FACB4
	thumb_func_end PlayerPartnerBufferExecCompleted

	thumb_func_start CompleteOnFinishedStatusAnimation
CompleteOnFinishedStatusAnimation: @ 0x081BB8A0
	push {lr}
	ldr r0, _081BB8C8
	ldr r2, [r0]
	ldr r0, _081BB8CC
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081BB8C2
	bl PlayerPartnerBufferExecCompleted
_081BB8C2:
	pop {r0}
	bx r0
	.align 2, 0
_081BB8C8: .4byte 0x02024174
_081BB8CC: .4byte 0x02023D08
	thumb_func_end CompleteOnFinishedStatusAnimation

	thumb_func_start CompleteOnFinishedBattleAnimation
CompleteOnFinishedBattleAnimation: @ 0x081BB8D0
	push {lr}
	ldr r0, _081BB8F8
	ldr r2, [r0]
	ldr r0, _081BB8FC
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081BB8F2
	bl PlayerPartnerBufferExecCompleted
_081BB8F2:
	pop {r0}
	bx r0
	.align 2, 0
_081BB8F8: .4byte 0x02024174
_081BB8FC: .4byte 0x02023D08
	thumb_func_end CompleteOnFinishedBattleAnimation

	thumb_func_start PlayerPartnerHandleGetMonData
PlayerPartnerHandleGetMonData: @ 0x081BB900
	push {r4, r5, r6, lr}
	sub sp, #0x100
	movs r6, #0
	ldr r1, _081BB92C
	ldr r0, _081BB930
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _081BB938
	ldr r0, _081BB934
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyPlayerPartnerMonData
	adds r6, r0, #0
	b _081BB95A
	.align 2, 0
_081BB92C: .4byte 0x02022D08
_081BB930: .4byte 0x02023D08
_081BB934: .4byte 0x02023D12
_081BB938:
	ldrb r4, [r1]
	movs r5, #0
_081BB93C:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _081BB952
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r6
	bl CopyPlayerPartnerMonData
	adds r6, r6, r0
_081BB952:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #5
	ble _081BB93C
_081BB95A:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl PlayerPartnerBufferExecCompleted
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleGetMonData

	thumb_func_start CopyPlayerPartnerMonData
CopyPlayerPartnerMonData: @ 0x081BB974
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	ldr r2, _081BB9A8
	ldr r3, _081BB9AC
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _081BB99E
	bl _081BC10A
_081BB99E:
	lsls r0, r0, #2
	ldr r1, _081BB9B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BB9A8: .4byte 0x02022D08
_081BB9AC: .4byte 0x02023D08
_081BB9B0: .4byte 0x081BB9B4
_081BB9B4: @ jump table
	.4byte _081BBAA4 @ case 0
	.4byte _081BBCC8 @ case 1
	.4byte _081BBCD8 @ case 2
	.4byte _081BBCE8 @ case 3
	.4byte _081BBD50 @ case 4
	.4byte _081BBD50 @ case 5
	.4byte _081BBD50 @ case 6
	.4byte _081BBD50 @ case 7
	.4byte _081BBD6C @ case 8
	.4byte _081BBDA8 @ case 9
	.4byte _081BBDA8 @ case 10
	.4byte _081BBDA8 @ case 11
	.4byte _081BBDA8 @ case 12
	.4byte _081BC10A @ case 13
	.4byte _081BC10A @ case 14
	.4byte _081BC10A @ case 15
	.4byte _081BC10A @ case 16
	.4byte _081BBDC4 @ case 17
	.4byte _081BBDD4 @ case 18
	.4byte _081BBE04 @ case 19
	.4byte _081BBE14 @ case 20
	.4byte _081BBE24 @ case 21
	.4byte _081BBE34 @ case 22
	.4byte _081BBE44 @ case 23
	.4byte _081BBE54 @ case 24
	.4byte _081BBE64 @ case 25
	.4byte _081BBE74 @ case 26
	.4byte _081BBE84 @ case 27
	.4byte _081BBE94 @ case 28
	.4byte _081BBEA4 @ case 29
	.4byte _081BBEB4 @ case 30
	.4byte _081BBEC4 @ case 31
	.4byte _081BBF14 @ case 32
	.4byte _081BBF24 @ case 33
	.4byte _081BBF34 @ case 34
	.4byte _081BBF44 @ case 35
	.4byte _081BBF54 @ case 36
	.4byte _081BBF64 @ case 37
	.4byte _081BBF74 @ case 38
	.4byte _081BBF84 @ case 39
	.4byte _081BBF94 @ case 40
	.4byte _081BBFC8 @ case 41
	.4byte _081BBFD8 @ case 42
	.4byte _081BBFE8 @ case 43
	.4byte _081BBFF8 @ case 44
	.4byte _081BC008 @ case 45
	.4byte _081BC018 @ case 46
	.4byte _081BC028 @ case 47
	.4byte _081BC038 @ case 48
	.4byte _081BC058 @ case 49
	.4byte _081BC068 @ case 50
	.4byte _081BC078 @ case 51
	.4byte _081BC088 @ case 52
	.4byte _081BC098 @ case 53
	.4byte _081BC0A8 @ case 54
	.4byte _081BC0B8 @ case 55
	.4byte _081BC0C8 @ case 56
	.4byte _081BC0D8 @ case 57
	.4byte _081BC0E8 @ case 58
	.4byte _081BC0F8 @ case 59
_081BBAA4:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081BBCB8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x2e]
	movs r6, #0
	add r0, sp, #0x24
	mov sb, r0
	movs r1, #0x3b
	add r1, sp
	mov sl, r1
	mov r2, sp
	adds r2, #0x2b
	str r2, [sp, #0x80]
	mov r0, sp
	adds r0, #0x2a
	str r0, [sp, #0x7c]
	mov r1, sp
	adds r1, #0x68
	str r1, [sp, #0x8c]
	adds r2, #5
	str r2, [sp, #0x84]
	adds r0, #0x12
	str r0, [sp, #0x88]
	mov r8, r4
	add r4, sp, #0xc
_081BBAF0:
	adds r1, r6, #0
	adds r1, #0xd
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x11
	mov r0, r8
	bl GetMonData
	mov r2, sb
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _081BBAF0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081BBCB8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl GetMonData
	mov r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	ldr r2, [sp, #0x80]
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [sp, #0x44]
	adds r0, r4, #0
	movs r1, #0x27
	bl GetMonData
	mov r3, sp
	movs r5, #0x1f
	ands r0, r5
	ldrb r2, [r3, #0x14]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x14]
	adds r0, r4, #0
	movs r1, #0x28
	bl GetMonData
	mov r3, sp
	movs r6, #0x1f
	ands r0, r6
	lsls r0, r0, #5
	ldrh r2, [r3, #0x14]
	ldr r1, _081BBCBC
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x14]
	adds r0, r4, #0
	movs r1, #0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r3, #0x15]
	movs r1, #0x7d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x15]
	adds r0, r4, #0
	movs r1, #0x2a
	bl GetMonData
	movs r1, #0x1f
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [sp, #0x14]
	ldr r2, _081BBCC0
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0x14]
	adds r0, r4, #0
	movs r1, #0x2b
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, r0, #4
	ldrh r2, [r3, #0x16]
	ldr r1, _081BBCC4
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x16]
	adds r0, r4, #0
	movs r1, #0x2c
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, r0, #1
	ldrb r2, [r3, #0x17]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [sp, #0x48]
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	str r0, [sp, #0x4c]
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	ldr r1, [sp, #0x7c]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x28]
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x2c]
	adds r0, r4, #0
	movs r1, #0x3b
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #2]
	adds r0, r4, #0
	movs r1, #0x3c
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #4]
	adds r0, r4, #0
	movs r1, #0x3d
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #6]
	adds r0, r4, #0
	movs r1, #0x3e
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #8]
	adds r0, r4, #0
	movs r1, #0x3f
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0xa]
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	mov r3, sp
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #6
	ldrb r2, [r3, #0x17]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #0x2e
	bl GetMonData
	mov r3, sp
	lsls r0, r0, #7
	ldrb r2, [r3, #0x17]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	str r0, [sp, #0x54]
	adds r0, r4, #0
	movs r1, #2
	ldr r2, [sp, #0x8c]
	bl GetMonData
	ldr r0, [sp, #0x84]
	ldr r1, [sp, #0x8c]
	bl StringCopy10
	adds r0, r4, #0
	movs r1, #7
	ldr r2, [sp, #0x88]
	bl GetMonData
	mov r2, sp
	movs r6, #0
_081BBCA8:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x57
	bls _081BBCA8
	b _081BC10A
	.align 2, 0
_081BBCB8: .4byte 0x02024190
_081BBCBC: .4byte 0xFFFFFC1F
_081BBCC0: .4byte 0xFFF07FFF
_081BBCC4: .4byte 0xFFFFFE0F
_081BBCC8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBCD4
	adds r0, r0, r1
	movs r1, #0xb
	b _081BC042
	.align 2, 0
_081BBCD4: .4byte 0x02024190
_081BBCD8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBCE4
	adds r0, r0, r1
	movs r1, #0xc
	b _081BC042
	.align 2, 0
_081BBCE4: .4byte 0x02024190
_081BBCE8:
	movs r6, #0
	add r2, sp, #0x58
	mov sb, r2
	add r0, sp, #0x60
	mov sl, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081BBD4C
	adds r4, r1, r0
	mov r8, sb
_081BBCFE:
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r4, #0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, #0
	adds r1, #0x11
	adds r0, r4, #0
	bl GetMonData
	mov r2, sl
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, #2
	add r8, r0
	adds r6, #1
	cmp r6, #3
	ble _081BBCFE
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBD4C
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	mov r1, sb
	strb r0, [r1, #0xc]
	mov r2, sb
	movs r6, #0
_081BBD3C:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0xf
	bls _081BBD3C
	b _081BC10A
	.align 2, 0
_081BBD4C: .4byte 0x02024190
_081BBD50:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBD68
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #9
	b _081BC042
	.align 2, 0
_081BBD68: .4byte 0x02024190
_081BBD6C:
	movs r6, #0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r2, _081BBDA4
	mov r8, r2
_081BBD78:
	adds r1, r6, #0
	adds r1, #0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	cmp r6, #3
	ble _081BBD78
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBDA4
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	b _081BC10A
	.align 2, 0
_081BBDA4: .4byte 0x02024190
_081BBDA8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBDC0
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #8
	b _081BC102
	.align 2, 0
_081BBDC0: .4byte 0x02024190
_081BBDC4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBDD0
	adds r0, r0, r1
	movs r1, #1
	b _081BBDDE
	.align 2, 0
_081BBDD0: .4byte 0x02024190
_081BBDD4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE00
	adds r0, r0, r1
	movs r1, #0x19
_081BBDDE:
	bl GetMonData
	adds r1, r0, #0
	strb r1, [r7]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r7, #2]
	movs r6, #3
	b _081BC10A
	.align 2, 0
_081BBE00: .4byte 0x02024190
_081BBE04:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE10
	adds r0, r0, r1
	movs r1, #0x1a
	b _081BC102
	.align 2, 0
_081BBE10: .4byte 0x02024190
_081BBE14:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE20
	adds r0, r0, r1
	movs r1, #0x1b
	b _081BC102
	.align 2, 0
_081BBE20: .4byte 0x02024190
_081BBE24:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE30
	adds r0, r0, r1
	movs r1, #0x1c
	b _081BC102
	.align 2, 0
_081BBE30: .4byte 0x02024190
_081BBE34:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE40
	adds r0, r0, r1
	movs r1, #0x1d
	b _081BC102
	.align 2, 0
_081BBE40: .4byte 0x02024190
_081BBE44:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE50
	adds r0, r0, r1
	movs r1, #0x1e
	b _081BC102
	.align 2, 0
_081BBE50: .4byte 0x02024190
_081BBE54:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE60
	adds r0, r0, r1
	movs r1, #0x1f
	b _081BC102
	.align 2, 0
_081BBE60: .4byte 0x02024190
_081BBE64:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE70
	adds r0, r0, r1
	movs r1, #0x20
	b _081BC102
	.align 2, 0
_081BBE70: .4byte 0x02024190
_081BBE74:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE80
	adds r0, r0, r1
	movs r1, #0x22
	b _081BC102
	.align 2, 0
_081BBE80: .4byte 0x02024190
_081BBE84:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBE90
	adds r0, r0, r1
	movs r1, #0x23
	b _081BC102
	.align 2, 0
_081BBE90: .4byte 0x02024190
_081BBE94:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBEA0
	adds r0, r0, r1
	movs r1, #0x24
	b _081BC102
	.align 2, 0
_081BBEA0: .4byte 0x02024190
_081BBEA4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBEB0
	adds r0, r0, r1
	movs r1, #0x25
	b _081BC102
	.align 2, 0
_081BBEB0: .4byte 0x02024190
_081BBEB4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBEC0
	adds r0, r0, r1
	movs r1, #0x26
	b _081BC102
	.align 2, 0
_081BBEC0: .4byte 0x02024190
_081BBEC4:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081BBF10
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, #0
	movs r1, #0x28
	bl GetMonData
	strb r0, [r7, #1]
	adds r0, r4, #0
	movs r1, #0x29
	bl GetMonData
	strb r0, [r7, #2]
	adds r0, r4, #0
	movs r1, #0x2a
	bl GetMonData
	strb r0, [r7, #3]
	adds r0, r4, #0
	movs r1, #0x2b
	bl GetMonData
	strb r0, [r7, #4]
	adds r0, r4, #0
	movs r1, #0x2c
	bl GetMonData
	strb r0, [r7, #5]
	movs r6, #6
	b _081BC10A
	.align 2, 0
_081BBF10: .4byte 0x02024190
_081BBF14:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBF20
	adds r0, r0, r1
	movs r1, #0x27
	b _081BC102
	.align 2, 0
_081BBF20: .4byte 0x02024190
_081BBF24:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBF30
	adds r0, r0, r1
	movs r1, #0x28
	b _081BC102
	.align 2, 0
_081BBF30: .4byte 0x02024190
_081BBF34:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBF40
	adds r0, r0, r1
	movs r1, #0x29
	b _081BC102
	.align 2, 0
_081BBF40: .4byte 0x02024190
_081BBF44:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBF50
	adds r0, r0, r1
	movs r1, #0x2a
	b _081BC102
	.align 2, 0
_081BBF50: .4byte 0x02024190
_081BBF54:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBF60
	adds r0, r0, r1
	movs r1, #0x2b
	b _081BC102
	.align 2, 0
_081BBF60: .4byte 0x02024190
_081BBF64:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBF70
	adds r0, r0, r1
	movs r1, #0x2c
	b _081BC102
	.align 2, 0
_081BBF70: .4byte 0x02024190
_081BBF74:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBF80
	adds r0, r0, r1
	movs r1, #0
	b _081BBF9E
	.align 2, 0
_081BBF80: .4byte 0x02024190
_081BBF84:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBF90
	adds r0, r0, r1
	movs r1, #9
	b _081BC042
	.align 2, 0
_081BBF90: .4byte 0x02024190
_081BBF94:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBFC4
	adds r0, r0, r1
	movs r1, #0x37
_081BBF9E:
	bl GetMonData
	adds r1, r0, #0
	strb r1, [r7]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r7, #2]
	lsrs r0, r1, #0x18
	strb r0, [r7, #3]
	movs r6, #4
	b _081BC10A
	.align 2, 0
_081BBFC4: .4byte 0x02024190
_081BBFC8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBFD4
	adds r0, r0, r1
	movs r1, #0x38
	b _081BC102
	.align 2, 0
_081BBFD4: .4byte 0x02024190
_081BBFD8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBFE4
	adds r0, r0, r1
	movs r1, #0x39
	b _081BC042
	.align 2, 0
_081BBFE4: .4byte 0x02024190
_081BBFE8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BBFF4
	adds r0, r0, r1
	movs r1, #0x3a
	b _081BC042
	.align 2, 0
_081BBFF4: .4byte 0x02024190
_081BBFF8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC004
	adds r0, r0, r1
	movs r1, #0x3b
	b _081BC042
	.align 2, 0
_081BC004: .4byte 0x02024190
_081BC008:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC014
	adds r0, r0, r1
	movs r1, #0x3c
	b _081BC042
	.align 2, 0
_081BC014: .4byte 0x02024190
_081BC018:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC024
	adds r0, r0, r1
	movs r1, #0x3d
	b _081BC042
	.align 2, 0
_081BC024: .4byte 0x02024190
_081BC028:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC034
	adds r0, r0, r1
	movs r1, #0x3e
	b _081BC042
	.align 2, 0
_081BC034: .4byte 0x02024190
_081BC038:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC054
	adds r0, r0, r1
	movs r1, #0x3f
_081BC042:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strb r0, [r7]
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r6, #2
	b _081BC10A
	.align 2, 0
_081BC054: .4byte 0x02024190
_081BC058:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC064
	adds r0, r0, r1
	movs r1, #0x16
	b _081BC102
	.align 2, 0
_081BC064: .4byte 0x02024190
_081BC068:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC074
	adds r0, r0, r1
	movs r1, #0x17
	b _081BC102
	.align 2, 0
_081BC074: .4byte 0x02024190
_081BC078:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC084
	adds r0, r0, r1
	movs r1, #0x18
	b _081BC102
	.align 2, 0
_081BC084: .4byte 0x02024190
_081BC088:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC094
	adds r0, r0, r1
	movs r1, #0x21
	b _081BC102
	.align 2, 0
_081BC094: .4byte 0x02024190
_081BC098:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC0A4
	adds r0, r0, r1
	movs r1, #0x2f
	b _081BC102
	.align 2, 0
_081BC0A4: .4byte 0x02024190
_081BC0A8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC0B4
	adds r0, r0, r1
	movs r1, #0x30
	b _081BC102
	.align 2, 0
_081BC0B4: .4byte 0x02024190
_081BC0B8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC0C4
	adds r0, r0, r1
	movs r1, #0x32
	b _081BC102
	.align 2, 0
_081BC0C4: .4byte 0x02024190
_081BC0C8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC0D4
	adds r0, r0, r1
	movs r1, #0x33
	b _081BC102
	.align 2, 0
_081BC0D4: .4byte 0x02024190
_081BC0D8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC0E4
	adds r0, r0, r1
	movs r1, #0x34
	b _081BC102
	.align 2, 0
_081BC0E4: .4byte 0x02024190
_081BC0E8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC0F4
	adds r0, r0, r1
	movs r1, #0x35
	b _081BC102
	.align 2, 0
_081BC0F4: .4byte 0x02024190
_081BC0F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC11C
	adds r0, r0, r1
	movs r1, #0x36
_081BC102:
	bl GetMonData
	strb r0, [r7]
	movs r6, #1
_081BC10A:
	adds r0, r6, #0
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081BC11C: .4byte 0x02024190
	thumb_func_end CopyPlayerPartnerMonData

	thumb_func_start PlayerPartnerHandleGetRawMonData
PlayerPartnerHandleGetRawMonData: @ 0x081BC120
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleGetRawMonData

	thumb_func_start PlayerPartnerHandleSetMonData
PlayerPartnerHandleSetMonData: @ 0x081BC12C
	push {r4, r5, lr}
	ldr r1, _081BC150
	ldr r0, _081BC154
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _081BC15C
	ldr r0, _081BC158
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl SetPlayerPartnerMonData
	b _081BC17A
	.align 2, 0
_081BC150: .4byte 0x02022D08
_081BC154: .4byte 0x02023D08
_081BC158: .4byte 0x02023D12
_081BC15C:
	ldrb r4, [r1]
	movs r5, #0
_081BC160:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _081BC16E
	adds r0, r5, #0
	bl SetPlayerPartnerMonData
_081BC16E:
	lsrs r4, r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _081BC160
_081BC17A:
	bl PlayerPartnerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end PlayerPartnerHandleSetMonData

	thumb_func_start SetPlayerPartnerMonData
SetPlayerPartnerMonData: @ 0x081BC184
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081BC1BC
	ldrb r0, [r0]
	lsls r0, r0, #9
	ldr r2, _081BC1C0
	adds r3, r0, r2
	adds r6, r3, #0
	subs r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r2, #0
	cmp r0, #0x3b
	bls _081BC1B0
	bl _081BCB4A
_081BC1B0:
	lsls r0, r0, #2
	ldr r1, _081BC1C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BC1BC: .4byte 0x02023D08
_081BC1C0: .4byte 0x02022D0B
_081BC1C4: .4byte 0x081BC1C8
_081BC1C8: @ jump table
	.4byte _081BC2B8 @ case 0
	.4byte _081BC450 @ case 1
	.4byte _081BC470 @ case 2
	.4byte _081BC490 @ case 3
	.4byte _081BC4E8 @ case 4
	.4byte _081BC4E8 @ case 5
	.4byte _081BC4E8 @ case 6
	.4byte _081BC4E8 @ case 7
	.4byte _081BC510 @ case 8
	.4byte _081BC574 @ case 9
	.4byte _081BC574 @ case 10
	.4byte _081BC574 @ case 11
	.4byte _081BC574 @ case 12
	.4byte _081BCB4A @ case 13
	.4byte _081BCB4A @ case 14
	.4byte _081BCB4A @ case 15
	.4byte _081BCB4A @ case 16
	.4byte _081BC5A4 @ case 17
	.4byte _081BC5C4 @ case 18
	.4byte _081BC5E4 @ case 19
	.4byte _081BC604 @ case 20
	.4byte _081BC624 @ case 21
	.4byte _081BC644 @ case 22
	.4byte _081BC664 @ case 23
	.4byte _081BC684 @ case 24
	.4byte _081BC6A4 @ case 25
	.4byte _081BC6C4 @ case 26
	.4byte _081BC6E4 @ case 27
	.4byte _081BC704 @ case 28
	.4byte _081BC724 @ case 29
	.4byte _081BC744 @ case 30
	.4byte _081BC764 @ case 31
	.4byte _081BC7D4 @ case 32
	.4byte _081BC7F4 @ case 33
	.4byte _081BC814 @ case 34
	.4byte _081BC834 @ case 35
	.4byte _081BC854 @ case 36
	.4byte _081BC874 @ case 37
	.4byte _081BC894 @ case 38
	.4byte _081BC8B4 @ case 39
	.4byte _081BC8D4 @ case 40
	.4byte _081BC8F4 @ case 41
	.4byte _081BC914 @ case 42
	.4byte _081BC934 @ case 43
	.4byte _081BC954 @ case 44
	.4byte _081BC974 @ case 45
	.4byte _081BC994 @ case 46
	.4byte _081BC9B4 @ case 47
	.4byte _081BC9D4 @ case 48
	.4byte _081BC9F4 @ case 49
	.4byte _081BCA14 @ case 50
	.4byte _081BCA34 @ case 51
	.4byte _081BCA54 @ case 52
	.4byte _081BCA74 @ case 53
	.4byte _081BCA94 @ case 54
	.4byte _081BCAB4 @ case 55
	.4byte _081BCAD4 @ case 56
	.4byte _081BCAF4 @ case 57
	.4byte _081BCB14 @ case 58
	.4byte _081BCB34 @ case 59
_081BC2B8:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081BC44C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r6, #0
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x2e
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	movs r0, #0
	mov r8, r0
	movs r0, #0x3b
	adds r0, r0, r6
	mov sl, r0
	adds r0, r6, #0
	adds r0, #0x2b
	str r0, [sp, #0x20]
	adds r0, #0x19
	str r0, [sp, #0x28]
	adds r0, #4
	str r0, [sp, #0x2c]
	adds r0, #4
	str r0, [sp, #0x30]
	subs r0, #0x22
	str r0, [sp, #0x1c]
	subs r0, #2
	str r0, [sp, #0x18]
	adds r0, #4
	str r0, [sp, #0x24]
	adds r0, r6, #2
	str r0, [sp, #4]
	adds r0, r6, #4
	str r0, [sp, #8]
	adds r0, r6, #6
	str r0, [sp, #0xc]
	adds r0, #2
	str r0, [sp, #0x10]
	adds r0, #2
	str r0, [sp, #0x14]
	mov sb, r4
	adds r7, r6, #0
	adds r7, #0x24
	adds r4, r6, #0
	adds r4, #0xc
_081BC31E:
	mov r1, r8
	adds r1, #0xd
	mov r0, sb
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	mov r0, sb
	adds r2, r7, #0
	bl SetMonData
	adds r7, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _081BC31E
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081BC44C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	mov r2, sl
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x20
	ldr r2, [sp, #0x20]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x19
	ldr r2, [sp, #0x28]
	bl SetMonData
	ldrb r0, [r6, #0x14]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, #0x14]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, #0x15]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, #0x14]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2a
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, #0x16]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2b
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2c
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0
	ldr r2, [sp, #0x2c]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x37
	ldr r2, [sp, #0x30]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x38
	ldr r2, [sp, #0x1c]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x39
	ldr r2, [sp, #0x18]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3a
	ldr r2, [sp, #0x24]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3b
	ldr r2, [sp, #4]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3c
	ldr r2, [sp, #8]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3d
	ldr r2, [sp, #0xc]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3e
	ldr r2, [sp, #0x10]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3f
	ldr r2, [sp, #0x14]
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC44C: .4byte 0x02024190
_081BC450:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC468
	adds r0, r0, r1
	ldr r1, _081BC46C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xb
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC468: .4byte 0x02024190
_081BC46C: .4byte 0x02023D08
_081BC470:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC488
	adds r0, r0, r1
	ldr r1, _081BC48C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xc
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC488: .4byte 0x02024190
_081BC48C: .4byte 0x02023D08
_081BC490:
	movs r0, #0
	mov r8, r0
	movs r0, #0xc
	adds r0, r0, r3
	mov sb, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081BC4E4
	adds r7, r1, r0
	adds r6, r3, #0
	adds r6, #8
	adds r4, r3, #0
_081BC4AA:
	mov r1, r8
	adds r1, #0xd
	adds r0, r7, #0
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	adds r0, r7, #0
	adds r2, r6, #0
	bl SetMonData
	adds r6, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _081BC4AA
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC4E4
	adds r0, r0, r1
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC4E4: .4byte 0x02024190
_081BC4E8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC504
	adds r0, r0, r1
	ldr r3, _081BC508
	ldr r1, _081BC50C
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #9
	b _081BC58C
	.align 2, 0
_081BC504: .4byte 0x02024190
_081BC508: .4byte 0x02022D08
_081BC50C: .4byte 0x02023D08
_081BC510:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081BC56C
	adds r4, r4, r0
	ldr r5, _081BC570
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r2, r2, r7
	adds r0, r4, #0
	movs r1, #0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC56C: .4byte 0x02024190
_081BC570: .4byte 0x02023D08
_081BC574:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC598
	adds r0, r0, r1
	ldr r3, _081BC59C
	ldr r1, _081BC5A0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #8
_081BC58C:
	adds r3, #3
	adds r2, r2, r3
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC598: .4byte 0x02024190
_081BC59C: .4byte 0x02022D08
_081BC5A0: .4byte 0x02023D08
_081BC5A4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC5BC
	adds r0, r0, r1
	ldr r1, _081BC5C0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #1
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC5BC: .4byte 0x02024190
_081BC5C0: .4byte 0x02023D08
_081BC5C4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC5DC
	adds r0, r0, r1
	ldr r1, _081BC5E0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x19
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC5DC: .4byte 0x02024190
_081BC5E0: .4byte 0x02023D08
_081BC5E4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC5FC
	adds r0, r0, r1
	ldr r1, _081BC600
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1a
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC5FC: .4byte 0x02024190
_081BC600: .4byte 0x02023D08
_081BC604:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC61C
	adds r0, r0, r1
	ldr r1, _081BC620
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1b
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC61C: .4byte 0x02024190
_081BC620: .4byte 0x02023D08
_081BC624:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC63C
	adds r0, r0, r1
	ldr r1, _081BC640
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1c
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC63C: .4byte 0x02024190
_081BC640: .4byte 0x02023D08
_081BC644:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC65C
	adds r0, r0, r1
	ldr r1, _081BC660
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1d
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC65C: .4byte 0x02024190
_081BC660: .4byte 0x02023D08
_081BC664:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC67C
	adds r0, r0, r1
	ldr r1, _081BC680
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1e
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC67C: .4byte 0x02024190
_081BC680: .4byte 0x02023D08
_081BC684:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC69C
	adds r0, r0, r1
	ldr r1, _081BC6A0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1f
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC69C: .4byte 0x02024190
_081BC6A0: .4byte 0x02023D08
_081BC6A4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC6BC
	adds r0, r0, r1
	ldr r1, _081BC6C0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x20
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC6BC: .4byte 0x02024190
_081BC6C0: .4byte 0x02023D08
_081BC6C4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC6DC
	adds r0, r0, r1
	ldr r1, _081BC6E0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x22
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC6DC: .4byte 0x02024190
_081BC6E0: .4byte 0x02023D08
_081BC6E4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC6FC
	adds r0, r0, r1
	ldr r1, _081BC700
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x23
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC6FC: .4byte 0x02024190
_081BC700: .4byte 0x02023D08
_081BC704:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC71C
	adds r0, r0, r1
	ldr r1, _081BC720
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x24
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC71C: .4byte 0x02024190
_081BC720: .4byte 0x02023D08
_081BC724:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC73C
	adds r0, r0, r1
	ldr r1, _081BC740
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x25
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC73C: .4byte 0x02024190
_081BC740: .4byte 0x02023D08
_081BC744:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC75C
	adds r0, r0, r1
	ldr r1, _081BC760
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x26
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC75C: .4byte 0x02024190
_081BC760: .4byte 0x02023D08
_081BC764:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _081BC7CC
	adds r4, r4, r0
	ldr r5, _081BC7D0
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r2, r2, r7
	adds r0, r4, #0
	movs r1, #0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2a
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2b
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, r2, #9
	adds r0, r7, #5
	adds r2, r2, r0
	adds r0, r4, #0
	b _081BC884
	.align 2, 0
_081BC7CC: .4byte 0x02024190
_081BC7D0: .4byte 0x02023D08
_081BC7D4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC7EC
	adds r0, r0, r1
	ldr r1, _081BC7F0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x27
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC7EC: .4byte 0x02024190
_081BC7F0: .4byte 0x02023D08
_081BC7F4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC80C
	adds r0, r0, r1
	ldr r1, _081BC810
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x28
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC80C: .4byte 0x02024190
_081BC810: .4byte 0x02023D08
_081BC814:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC82C
	adds r0, r0, r1
	ldr r1, _081BC830
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x29
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC82C: .4byte 0x02024190
_081BC830: .4byte 0x02023D08
_081BC834:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC84C
	adds r0, r0, r1
	ldr r1, _081BC850
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2a
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC84C: .4byte 0x02024190
_081BC850: .4byte 0x02023D08
_081BC854:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC86C
	adds r0, r0, r1
	ldr r1, _081BC870
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2b
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC86C: .4byte 0x02024190
_081BC870: .4byte 0x02023D08
_081BC874:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC88C
	adds r0, r0, r1
	ldr r1, _081BC890
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
_081BC884:
	movs r1, #0x2c
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC88C: .4byte 0x02024190
_081BC890: .4byte 0x02023D08
_081BC894:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC8AC
	adds r0, r0, r1
	ldr r1, _081BC8B0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC8AC: .4byte 0x02024190
_081BC8B0: .4byte 0x02023D08
_081BC8B4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC8CC
	adds r0, r0, r1
	ldr r1, _081BC8D0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #9
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC8CC: .4byte 0x02024190
_081BC8D0: .4byte 0x02023D08
_081BC8D4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC8EC
	adds r0, r0, r1
	ldr r1, _081BC8F0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x37
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC8EC: .4byte 0x02024190
_081BC8F0: .4byte 0x02023D08
_081BC8F4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC90C
	adds r0, r0, r1
	ldr r1, _081BC910
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x38
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC90C: .4byte 0x02024190
_081BC910: .4byte 0x02023D08
_081BC914:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC92C
	adds r0, r0, r1
	ldr r1, _081BC930
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x39
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC92C: .4byte 0x02024190
_081BC930: .4byte 0x02023D08
_081BC934:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC94C
	adds r0, r0, r1
	ldr r1, _081BC950
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3a
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC94C: .4byte 0x02024190
_081BC950: .4byte 0x02023D08
_081BC954:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC96C
	adds r0, r0, r1
	ldr r1, _081BC970
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3b
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC96C: .4byte 0x02024190
_081BC970: .4byte 0x02023D08
_081BC974:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC98C
	adds r0, r0, r1
	ldr r1, _081BC990
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3c
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC98C: .4byte 0x02024190
_081BC990: .4byte 0x02023D08
_081BC994:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC9AC
	adds r0, r0, r1
	ldr r1, _081BC9B0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3d
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC9AC: .4byte 0x02024190
_081BC9B0: .4byte 0x02023D08
_081BC9B4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC9CC
	adds r0, r0, r1
	ldr r1, _081BC9D0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3e
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC9CC: .4byte 0x02024190
_081BC9D0: .4byte 0x02023D08
_081BC9D4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BC9EC
	adds r0, r0, r1
	ldr r1, _081BC9F0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3f
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BC9EC: .4byte 0x02024190
_081BC9F0: .4byte 0x02023D08
_081BC9F4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCA0C
	adds r0, r0, r1
	ldr r1, _081BCA10
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x16
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCA0C: .4byte 0x02024190
_081BCA10: .4byte 0x02023D08
_081BCA14:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCA2C
	adds r0, r0, r1
	ldr r1, _081BCA30
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x17
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCA2C: .4byte 0x02024190
_081BCA30: .4byte 0x02023D08
_081BCA34:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCA4C
	adds r0, r0, r1
	ldr r1, _081BCA50
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x18
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCA4C: .4byte 0x02024190
_081BCA50: .4byte 0x02023D08
_081BCA54:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCA6C
	adds r0, r0, r1
	ldr r1, _081BCA70
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x21
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCA6C: .4byte 0x02024190
_081BCA70: .4byte 0x02023D08
_081BCA74:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCA8C
	adds r0, r0, r1
	ldr r1, _081BCA90
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2f
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCA8C: .4byte 0x02024190
_081BCA90: .4byte 0x02023D08
_081BCA94:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCAAC
	adds r0, r0, r1
	ldr r1, _081BCAB0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x30
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCAAC: .4byte 0x02024190
_081BCAB0: .4byte 0x02023D08
_081BCAB4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCACC
	adds r0, r0, r1
	ldr r1, _081BCAD0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x32
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCACC: .4byte 0x02024190
_081BCAD0: .4byte 0x02023D08
_081BCAD4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCAEC
	adds r0, r0, r1
	ldr r1, _081BCAF0
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x33
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCAEC: .4byte 0x02024190
_081BCAF0: .4byte 0x02023D08
_081BCAF4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCB0C
	adds r0, r0, r1
	ldr r1, _081BCB10
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x34
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCB0C: .4byte 0x02024190
_081BCB10: .4byte 0x02023D08
_081BCB14:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCB2C
	adds r0, r0, r1
	ldr r1, _081BCB30
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x35
	bl SetMonData
	b _081BCB4A
	.align 2, 0
_081BCB2C: .4byte 0x02024190
_081BCB30: .4byte 0x02023D08
_081BCB34:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081BCB74
	adds r0, r0, r1
	ldr r1, _081BCB78
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x36
	bl SetMonData
_081BCB4A:
	ldr r2, _081BCB7C
	ldr r0, _081BCB78
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _081BCB74
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BCB74: .4byte 0x02024190
_081BCB78: .4byte 0x02023D08
_081BCB7C: .4byte 0x02023D12
	thumb_func_end SetPlayerPartnerMonData

	thumb_func_start PlayerPartnerHandleSetRawMonData
PlayerPartnerHandleSetRawMonData: @ 0x081BCB80
	push {r4, r5, r6, r7, lr}
	ldr r1, _081BCBE4
	ldr r7, _081BCBE8
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r4, _081BCBEC
	lsls r2, r2, #9
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _081BCBF0
	adds r0, r0, r1
	adds r5, r3, r0
	movs r3, #0
	adds r0, r4, #2
	adds r2, r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bhs _081BCBD8
	adds r6, r4, #0
	adds r2, r7, #0
	adds r4, r0, #0
_081BCBB6:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, r0, #9
	adds r0, #3
	adds r0, r3, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r2]
	lsls r0, r0, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	blo _081BCBB6
_081BCBD8:
	bl PlayerPartnerBufferExecCompleted
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BCBE4: .4byte 0x02023D12
_081BCBE8: .4byte 0x02023D08
_081BCBEC: .4byte 0x02022D08
_081BCBF0: .4byte 0x02024190
	thumb_func_end PlayerPartnerHandleSetRawMonData

	thumb_func_start PlayerPartnerHandleLoadMonSprite
PlayerPartnerHandleLoadMonSprite: @ 0x081BCBF4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _081BCCE8
	mov r8, r0
	ldr r6, _081BCCEC
	ldrb r1, [r6]
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _081BCCF0
	adds r0, r0, r4
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r6]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _081BCCF4
	mov r8, r0
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r0, [r6]
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _081BCCF8
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r5, _081BCCFC
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081BCD00
	strh r1, [r0, #0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x2e]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081BCD04
	adds r2, r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldr r1, _081BCD08
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BCD0C
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BCCE8: .4byte 0x02023D12
_081BCCEC: .4byte 0x02023D08
_081BCCF0: .4byte 0x02024190
_081BCCF4: .4byte 0x02024640
_081BCCF8: .4byte 0x02023E88
_081BCCFC: .4byte 0x020205AC
_081BCD00: .4byte 0x0000FF10
_081BCD04: .4byte 0x02024188
_081BCD08: .4byte 0x03005AC0
_081BCD0C: .4byte 0x081BAE71
	thumb_func_end PlayerPartnerHandleLoadMonSprite

	thumb_func_start PlayerPartnerHandleSwitchInAnim
PlayerPartnerHandleSwitchInAnim: @ 0x081BCD10
	push {r4, r5, r6, lr}
	ldr r5, _081BCD68
	ldrb r0, [r5]
	ldr r4, _081BCD6C
	lsls r1, r0, #9
	adds r6, r4, #2
	adds r1, r1, r6
	ldrb r1, [r1]
	bl ClearTemporarySpeciesSpriteData
	ldr r2, _081BCD70
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r2
	lsls r0, r0, #9
	adds r4, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _081BCD74
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r5]
	lsls r1, r0, #9
	adds r1, r1, r6
	ldrb r1, [r1]
	bl sub_081BCD80
	ldr r1, _081BCD78
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BCD7C
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BCD68: .4byte 0x02023D08
_081BCD6C: .4byte 0x02022D08
_081BCD70: .4byte 0x02023D12
_081BCD74: .4byte 0x02024190
_081BCD78: .4byte 0x03005AC0
_081BCD7C: .4byte 0x081BB785
	thumb_func_end PlayerPartnerHandleSwitchInAnim

	thumb_func_start sub_081BCD80
sub_081BCD80: @ 0x081BCD80
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl ClearTemporarySpeciesSpriteData
	ldr r0, _081BCED4
	lsls r2, r6, #1
	adds r2, r2, r0
	ldr r0, _081BCED8
	lsls r1, r6, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081BCEDC
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _081BCEE0
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _081BCEE4
	mov sb, r1
	add sb, r6
	mov r1, sb
	strb r0, [r1]
	adds r0, r6, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _081BCEE8
	mov sl, r0
	adds r0, r6, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, sl
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _081BCEEC
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _081BCEF0
	mov r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r4]
	strh r1, [r0, #0x30]
	mov r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x32]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x2e]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x32]
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r6, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081BCEF4
	adds r6, r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081BCEF8
	str r1, [r0]
	movs r0, #0
	movs r1, #0xff
	bl DoPokeballSendOutAnimation
	mov r1, sb
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x2e]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BCED4: .4byte 0x02023D12
_081BCED8: .4byte 0x02022D08
_081BCEDC: .4byte 0x02024190
_081BCEE0: .4byte 0x0805D331
_081BCEE4: .4byte 0x03005ADC
_081BCEE8: .4byte 0x02024640
_081BCEEC: .4byte 0x02023E88
_081BCEF0: .4byte 0x020205AC
_081BCEF4: .4byte 0x02024188
_081BCEF8: .4byte 0x08007141
	thumb_func_end sub_081BCD80

	thumb_func_start PlayerPartnerHandleReturnMonToBall
PlayerPartnerHandleReturnMonToBall: @ 0x081BCEFC
	push {r4, r5, r6, lr}
	ldr r1, _081BCF30
	ldr r6, _081BCF34
	ldrb r2, [r6]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _081BCF44
	ldr r0, _081BCF38
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r3, [r0, #4]
	ldr r1, _081BCF3C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BCF40
	str r1, [r0]
	b _081BCF7A
	.align 2, 0
_081BCF30: .4byte 0x02022D08
_081BCF34: .4byte 0x02023D08
_081BCF38: .4byte 0x02024174
_081BCF3C: .4byte 0x03005AC0
_081BCF40: .4byte 0x081BCF8D
_081BCF44:
	ldr r5, _081BCF80
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081BCF84
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r1, _081BCF88
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl PlayerPartnerBufferExecCompleted
_081BCF7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BCF80: .4byte 0x02023E88
_081BCF84: .4byte 0x020205AC
_081BCF88: .4byte 0x03005AD0
	thumb_func_end PlayerPartnerHandleReturnMonToBall

	thumb_func_start DoSwitchOutAnimation
DoSwitchOutAnimation: @ 0x081BCF8C
	push {r4, r5, r6, lr}
	ldr r6, _081BCFAC
	ldr r4, [r6]
	ldr r5, _081BCFB0
	ldrb r2, [r5]
	ldr r1, [r4, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _081BCFB4
	cmp r0, #1
	beq _081BCFE2
	b _081BD00A
	.align 2, 0
_081BCFAC: .4byte 0x02024174
_081BCFB0: .4byte 0x02023D08
_081BCFB4:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081BCFCE
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_081BCFCE:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _081BD00A
_081BCFE2:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _081BD00A
	strb r0, [r3, #4]
	ldrb r2, [r5]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #1
	bl InitAndLaunchSpecialAnimation
	ldr r1, _081BD010
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BD014
	str r1, [r0]
_081BD00A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BD010: .4byte 0x03005AC0
_081BD014: .4byte 0x081BB4C5
	thumb_func_end DoSwitchOutAnimation

	thumb_func_start PlayerPartnerHandleDrawTrainerPic
PlayerPartnerHandleDrawTrainerPic: @ 0x081BD018
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _081BD038
	ldrh r1, [r2]
	ldr r0, _081BD03C
	cmp r1, r0
	bne _081BD044
	movs r4, #7
	movs r0, #0x5a
	mov sb, r0
	ldr r0, _081BD040
	ldrb r1, [r0, #0x1c]
	b _081BD05A
	.align 2, 0
_081BD038: .4byte 0x0203886E
_081BD03C: .4byte 0x00000C03
_081BD040: .4byte 0x082D95BC
_081BD044:
	ldrh r0, [r2]
	bl GetFrontierTrainerFrontSpriteId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x20
	mov sb, r0
	ldr r1, _081BD10C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
_081BD05A:
	movs r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x12
	movs r1, #0xa0
	lsls r1, r1, #0xf
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	ldr r0, _081BD110
	ldrh r1, [r0]
	ldr r0, _081BD114
	cmp r1, r0
	bne _081BD130
	ldr r5, _081BD118
	ldrb r1, [r5]
	adds r0, r4, #0
	bl DecompressTrainerBackPic
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _081BD11C
	mov r8, sb
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl CreateSprite
	ldr r6, _081BD120
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _081BD124
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xf0
	strh r1, [r0, #0x24]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081BD128
	strh r1, [r0, #0x2e]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _081BD12C
	str r1, [r0]
	b _081BD218
	.align 2, 0
_081BD10C: .4byte 0x082D8D70
_081BD110: .4byte 0x0203886E
_081BD114: .4byte 0x00000C03
_081BD118: .4byte 0x02023D08
_081BD11C: .4byte 0x02024640
_081BD120: .4byte 0x02023E88
_081BD124: .4byte 0x020205AC
_081BD128: .4byte 0x0000FFFE
_081BD12C: .4byte 0x0805D3C9
_081BD130:
	adds r5, r4, #0
	ldr r6, _081BD234
	ldrb r1, [r6]
	adds r0, r5, #0
	bl DecompressTrainerFrontPic
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl SetMultiuseSpriteTemplateToTrainerFront
	ldr r0, _081BD238
	mov r8, r0
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	mov r1, sb
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _081BD23C
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, _081BD240
	lsls r5, r5, #3
	adds r5, r5, r0
	ldrh r0, [r5, #4]
	bl IndexOfSpritePaletteTag
	ldr r5, _081BD244
	ldrb r1, [r6]
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r5
	lsls r0, r0, #4
	ldrb r3, [r2, #5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #5]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0xf0
	strh r1, [r0, #0x24]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x30
	strh r1, [r0, #0x26]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081BD248
	strh r1, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081BD24C
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r2, [r1, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
_081BD218:
	ldr r1, _081BD250
	ldr r0, _081BD234
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BD254
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BD234: .4byte 0x02023D08
_081BD238: .4byte 0x02024640
_081BD23C: .4byte 0x02023E88
_081BD240: .4byte 0x082D91CC
_081BD244: .4byte 0x020205AC
_081BD248: .4byte 0x0000FFFE
_081BD24C: .4byte 0x0805D3C9
_081BD250: .4byte 0x03005AC0
_081BD254: .4byte 0x081BAAFD
	thumb_func_end PlayerPartnerHandleDrawTrainerPic

	thumb_func_start PlayerPartnerHandleTrainerSlide
PlayerPartnerHandleTrainerSlide: @ 0x081BD258
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleTrainerSlide

	thumb_func_start PlayerPartnerHandleTrainerSlideBack
PlayerPartnerHandleTrainerSlideBack: @ 0x081BD264
	push {r4, r5, r6, lr}
	ldr r6, _081BD2F0
	ldr r4, _081BD2F4
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _081BD2F8
	adds r0, r0, r5
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x23
	strh r1, [r0, #0x2e]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081BD2FC
	strh r1, [r0, #0x32]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081BD300
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081BD304
	bl StoreSpriteCallbackInData6
	ldr r1, _081BD308
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BD30C
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BD2F0: .4byte 0x02023E88
_081BD2F4: .4byte 0x02023D08
_081BD2F8: .4byte 0x020205AC
_081BD2FC: .4byte 0x0000FFD8
_081BD300: .4byte 0x080A67B5
_081BD304: .4byte 0x08007141
_081BD308: .4byte 0x03005AC0
_081BD30C: .4byte 0x081BAB35
	thumb_func_end PlayerPartnerHandleTrainerSlideBack

	thumb_func_start PlayerPartnerHandleFaintAnimation
PlayerPartnerHandleFaintAnimation: @ 0x081BD310
	push {r4, r5, r6, lr}
	ldr r6, _081BD35C
	ldr r4, [r6]
	ldr r5, _081BD360
	ldrb r2, [r5]
	ldr r0, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _081BD364
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081BD344
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_081BD344:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	adds r1, #1
	strb r1, [r0, #4]
	b _081BD3DA
	.align 2, 0
_081BD35C: .4byte 0x02024174
_081BD360: .4byte 0x02023D08
_081BD364:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081BD3DA
	strb r4, [r3, #4]
	ldr r2, _081BD3E0
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _081BD3E4
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	movs r1, #0x40
	rsbs r1, r1, #0
	movs r0, #0x10
	bl PlaySE12WithPanning
	ldr r2, _081BD3E8
	ldr r3, _081BD3EC
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r4, [r0, #0x30]
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #5
	strh r1, [r0, #0x32]
	ldrb r0, [r5]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _081BD3F0
	str r1, [r0]
	ldr r1, _081BD3F4
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BD3F8
	str r1, [r0]
_081BD3DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BD3E0: .4byte 0x02023D12
_081BD3E4: .4byte 0x02024190
_081BD3E8: .4byte 0x020205AC
_081BD3EC: .4byte 0x02023E88
_081BD3F0: .4byte 0x08039845
_081BD3F4: .4byte 0x03005AC0
_081BD3F8: .4byte 0x081BB429
	thumb_func_end PlayerPartnerHandleFaintAnimation

	thumb_func_start PlayerPartnerHandlePaletteFade
PlayerPartnerHandlePaletteFade: @ 0x081BD3FC
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandlePaletteFade

	thumb_func_start PlayerPartnerHandleSuccessBallThrowAnim
PlayerPartnerHandleSuccessBallThrowAnim: @ 0x081BD408
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleSuccessBallThrowAnim

	thumb_func_start PlayerPartnerHandleBallThrowAnim
PlayerPartnerHandleBallThrowAnim: @ 0x081BD414
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleBallThrowAnim

	thumb_func_start PlayerPartnerHandlePause
PlayerPartnerHandlePause: @ 0x081BD420
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandlePause

	thumb_func_start PlayerPartnerHandleMoveAnimation
PlayerPartnerHandleMoveAnimation: @ 0x081BD42C
	push {r4, r5, r6, lr}
	ldr r6, _081BD510
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BD43E
	b _081BD552
_081BD43E:
	ldr r0, _081BD514
	mov ip, r0
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r0, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, ip
	adds r1, #2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	ldr r5, _081BD518
	mov r1, ip
	adds r1, #3
	adds r2, r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _081BD51C
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #5
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _081BD520
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r3, r1
	mov r1, ip
	adds r1, #8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x10
	orrs r3, r1
	mov r1, ip
	adds r1, #9
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #0x18
	orrs r3, r1
	str r3, [r4]
	ldr r3, _081BD524
	ldrb r1, [r6]
	lsls r1, r1, #9
	mov r2, ip
	adds r2, #0xa
	adds r1, r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _081BD528
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #0xc
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #0xd
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _081BD52C
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #0x10
	adds r2, r2, r1
	str r2, [r3]
	ldr r3, _081BD530
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl IsMoveWithoutAnimation
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _081BD534
	bl PlayerPartnerBufferExecCompleted
	b _081BD552
	.align 2, 0
_081BD510: .4byte 0x02023D08
_081BD514: .4byte 0x02022D08
_081BD518: .4byte 0x020380D2
_081BD51C: .4byte 0x020380A8
_081BD520: .4byte 0x020380A4
_081BD524: .4byte 0x020380BA
_081BD528: .4byte 0x020380BC
_081BD52C: .4byte 0x020380A0
_081BD530: .4byte 0x02024160
_081BD534:
	ldr r0, _081BD558
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #4]
	ldr r1, _081BD55C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BD560
	str r1, [r0]
_081BD552:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BD558: .4byte 0x02024174
_081BD55C: .4byte 0x03005AC0
_081BD560: .4byte 0x081BD565
	thumb_func_end PlayerPartnerHandleMoveAnimation

	thumb_func_start PlayerPartnerDoMoveAnimation
PlayerPartnerDoMoveAnimation: @ 0x081BD564
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _081BD5B0
	ldr r6, _081BD5B4
	ldrb r3, [r6]
	lsls r1, r3, #9
	adds r0, r2, #1
	mov sl, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, r2, #2
	mov sb, r5
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r4, r0
	adds r2, #0xb
	adds r1, r1, r2
	ldrb r1, [r1]
	mov r8, r1
	ldr r7, _081BD5B8
	ldr r5, [r7]
	ldr r1, [r5, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _081BD5FC
	cmp r2, #1
	bgt _081BD5BC
	cmp r2, #0
	beq _081BD5C6
	b _081BD6D8
	.align 2, 0
_081BD5B0: .4byte 0x02022D08
_081BD5B4: .4byte 0x02023D08
_081BD5B8: .4byte 0x02024174
_081BD5BC:
	cmp r2, #2
	beq _081BD626
	cmp r2, #3
	beq _081BD69C
	b _081BD6D8
_081BD5C6:
	ldr r1, [r5]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, #0xc
	ands r0, r2
	cmp r0, #4
	bne _081BD5E8
	movs r0, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_081BD5E8:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _081BD6D8
_081BD5FC:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _081BD6D8
	movs r0, #0
	bl sub_0805E7B8
	adds r0, r4, #0
	bl DoMoveAnim
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #2
	strb r1, [r0, #4]
	b _081BD6D8
_081BD626:
	ldr r0, _081BD68C
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _081BD690
	ldrb r0, [r0]
	cmp r0, #0
	bne _081BD6D8
	movs r0, #1
	bl sub_0805E7B8
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081BD674
	mov r0, r8
	cmp r0, #1
	bhi _081BD674
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_081BD674:
	ldr r0, _081BD694
	ldr r2, [r0]
	ldr r0, _081BD698
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #4]
	b _081BD6D8
	.align 2, 0
_081BD68C: .4byte 0x02038098
_081BD690: .4byte 0x0203809D
_081BD694: .4byte 0x02024174
_081BD698: .4byte 0x02023D08
_081BD69C:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081BD6D8
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, #9
	mov r3, sl
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, sb
	ldrb r2, [r2]
	lsls r2, r2, #8
	orrs r1, r2
	bl TrySetBehindSubstituteSpriteBit
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r4, [r0, #4]
	bl PlayerPartnerBufferExecCompleted
_081BD6D8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerDoMoveAnimation

	thumb_func_start PlayerPartnerHandlePrintString
PlayerPartnerHandlePrintString: @ 0x081BD6E8
	push {r4, lr}
	ldr r0, _081BD720
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081BD724
	strh r1, [r0]
	ldr r4, _081BD728
	ldrb r0, [r4]
	lsls r0, r0, #9
	ldr r1, _081BD72C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl BufferStringBattle
	ldr r0, _081BD730
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _081BD734
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BD738
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BD720: .4byte 0x02022AC8
_081BD724: .4byte 0x02022ACA
_081BD728: .4byte 0x02023D08
_081BD72C: .4byte 0x02022D0A
_081BD730: .4byte 0x02022AE0
_081BD734: .4byte 0x03005AC0
_081BD738: .4byte 0x081BB535
	thumb_func_end PlayerPartnerHandlePrintString

	thumb_func_start PlayerPartnerHandlePrintSelectionString
PlayerPartnerHandlePrintSelectionString: @ 0x081BD73C
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandlePrintSelectionString

	thumb_func_start PlayerPartnerHandleChooseAction
PlayerPartnerHandleChooseAction: @ 0x081BD748
	push {lr}
	bl AI_TrySwitchOrUseItem
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleChooseAction

	thumb_func_start PlayerPartnerHandleUnknownYesNoBox
PlayerPartnerHandleUnknownYesNoBox: @ 0x081BD758
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleUnknownYesNoBox

	thumb_func_start PlayerPartnerHandleChooseMove
PlayerPartnerHandleChooseMove: @ 0x081BD764
	push {r4, r5, r6, lr}
	ldr r6, _081BD7F4
	ldrb r4, [r6]
	lsls r4, r4, #9
	ldr r0, _081BD7F8
	adds r4, r4, r0
	movs r0, #0xf
	bl BattleAI_SetupAIData
	bl BattleAI_ChooseMoveOrAction
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _081BD7FC
	lsls r0, r5, #1
	adds r4, r4, r0
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #6]
	movs r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _081BD79E
	ldr r1, _081BD800
	ldrb r0, [r6]
	strb r0, [r1]
_081BD79E:
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #6]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081BD7D8
	movs r0, #1
	bl GetBattlerAtPosition
	ldr r4, _081BD800
	strb r0, [r4]
	ldr r0, _081BD804
	ldrb r1, [r0]
	ldr r2, _081BD808
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _081BD7D8
	movs r0, #3
	bl GetBattlerAtPosition
	strb r0, [r4]
_081BD7D8:
	ldr r0, _081BD800
	ldrb r2, [r0]
	lsls r2, r2, #8
	orrs r2, r5
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
	bl PlayerPartnerBufferExecCompleted
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BD7F4: .4byte 0x02023D08
_081BD7F8: .4byte 0x02022D0C
_081BD7FC: .4byte 0x082ED220
_081BD800: .4byte 0x02023EB0
_081BD804: .4byte 0x02023EB4
_081BD808: .4byte 0x082FACB4
	thumb_func_end PlayerPartnerHandleChooseMove

	thumb_func_start PlayerPartnerHandleChooseItem
PlayerPartnerHandleChooseItem: @ 0x081BD80C
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleChooseItem

	thumb_func_start PlayerPartnerHandleChoosePokemon
PlayerPartnerHandleChoosePokemon: @ 0x081BD818
	push {r4, r5, r6, lr}
	bl GetMostSuitableMonToSwitchInto
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bne _081BD86C
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #2
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #3
	b _081BD840
_081BD83E:
	adds r4, #1
_081BD840:
	cmp r4, #5
	bgt _081BD86C
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081BD890
	adds r0, r0, r1
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _081BD83E
	ldr r1, _081BD894
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _081BD83E
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	beq _081BD83E
_081BD86C:
	ldr r0, _081BD898
	ldrb r0, [r0]
	ldr r1, _081BD89C
	ldr r1, [r1]
	adds r0, r0, r1
	adds r0, #0x5c
	strb r4, [r0]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0
	bl BtlController_EmitChosenMonReturnValue
	bl PlayerPartnerBufferExecCompleted
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BD890: .4byte 0x02024190
_081BD894: .4byte 0x02023D12
_081BD898: .4byte 0x02023D08
_081BD89C: .4byte 0x02024140
	thumb_func_end PlayerPartnerHandleChoosePokemon

	thumb_func_start PlayerPartnerHandleCmd23
PlayerPartnerHandleCmd23: @ 0x081BD8A0
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleCmd23

	thumb_func_start PlayerPartnerHandleHealthBarUpdate
PlayerPartnerHandleHealthBarUpdate: @ 0x081BD8AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	bl LoadBattleBarGfx
	ldr r3, _081BD924
	ldr r0, _081BD928
	mov sb, r0
	ldrb r4, [r0]
	lsls r2, r4, #9
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, #3
	adds r2, r2, r3
	ldrb r0, [r2]
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	ldr r0, _081BD92C
	cmp r7, r0
	beq _081BD93C
	ldr r6, _081BD930
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _081BD934
	adds r0, r0, r4
	movs r1, #0x3a
	bl GetMonData
	mov r8, r0
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x39
	bl GetMonData
	adds r3, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _081BD938
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _081BD966
	.align 2, 0
_081BD924: .4byte 0x02022D08
_081BD928: .4byte 0x02023D08
_081BD92C: .4byte 0x00007FFF
_081BD930: .4byte 0x02023D12
_081BD934: .4byte 0x02024190
_081BD938: .4byte 0x03005AD0
_081BD93C:
	ldr r1, _081BD984
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081BD988
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _081BD98C
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, #0
	bl SetBattleBarStruct
_081BD966:
	ldr r1, _081BD990
	ldr r0, _081BD994
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BD998
	str r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BD984: .4byte 0x02023D12
_081BD988: .4byte 0x02024190
_081BD98C: .4byte 0x03005AD0
_081BD990: .4byte 0x03005AC0
_081BD994: .4byte 0x02023D08
_081BD998: .4byte 0x081BAEB1
	thumb_func_end PlayerPartnerHandleHealthBarUpdate

	thumb_func_start PlayerPartnerHandleExpUpdate
PlayerPartnerHandleExpUpdate: @ 0x081BD99C
	push {r4, r5, r6, r7, lr}
	ldr r5, _081BD9C8
	ldr r6, _081BD9CC
	ldrb r0, [r6]
	lsls r0, r0, #9
	adds r1, r5, #1
	adds r0, r0, r1
	ldrb r7, [r0]
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _081BD9D0
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	cmp r0, #0x63
	bls _081BD9D4
	bl PlayerPartnerBufferExecCompleted
	b _081BDA20
	.align 2, 0
_081BD9C8: .4byte 0x02022D08
_081BD9CC: .4byte 0x02023D08
_081BD9D0: .4byte 0x02024190
_081BD9D4:
	movs r0, #1
	bl LoadBattleBarGfx
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	ldrb r1, [r6]
	lsls r1, r1, #9
	adds r0, r5, #2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r5, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r4, r0
	ldr r0, _081BDA28
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081BDA2C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r7, [r1, #8]
	strh r4, [r1, #0xa]
	ldrb r0, [r6]
	strh r0, [r1, #0xc]
	ldr r1, _081BDA30
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BDA34
	str r1, [r0]
_081BDA20:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BDA28: .4byte 0x081BAF39
_081BDA2C: .4byte 0x03005B60
_081BDA30: .4byte 0x03005AC0
_081BDA34: .4byte 0x08057069
	thumb_func_end PlayerPartnerHandleExpUpdate

	thumb_func_start PlayerPartnerHandleStatusIconUpdate
PlayerPartnerHandleStatusIconUpdate: @ 0x081BDA38
	push {r4, lr}
	ldr r4, _081BDA94
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081BDA8C
	ldr r0, _081BDA98
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _081BDA9C
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _081BDAA0
	adds r1, r1, r2
	movs r2, #9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _081BDAA4
	ldr r0, [r0]
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
	ldr r1, _081BDAA8
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BDAAC
	str r1, [r0]
_081BDA8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BDA94: .4byte 0x02023D08
_081BDA98: .4byte 0x03005AD0
_081BDA9C: .4byte 0x02023D12
_081BDAA0: .4byte 0x02024190
_081BDAA4: .4byte 0x02024174
_081BDAA8: .4byte 0x03005AC0
_081BDAAC: .4byte 0x081BB8A1
	thumb_func_end PlayerPartnerHandleStatusIconUpdate

	thumb_func_start PlayerPartnerHandleStatusAnimation
PlayerPartnerHandleStatusAnimation: @ 0x081BDAB0
	push {r4, r5, lr}
	ldr r5, _081BDB08
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081BDB00
	ldr r4, _081BDB0C
	ldrb r3, [r5]
	lsls r3, r3, #9
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, r2, #8
	orrs r1, r2
	adds r2, r4, #4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, r2, #0x10
	orrs r1, r2
	adds r4, #5
	adds r3, r3, r4
	ldrb r2, [r3]
	lsls r2, r2, #0x18
	orrs r1, r2
	bl InitAndLaunchChosenStatusAnimation
	ldr r1, _081BDB10
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BDB14
	str r1, [r0]
_081BDB00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BDB08: .4byte 0x02023D08
_081BDB0C: .4byte 0x02022D08
_081BDB10: .4byte 0x03005AC0
_081BDB14: .4byte 0x081BB8A1
	thumb_func_end PlayerPartnerHandleStatusAnimation

	thumb_func_start PlayerPartnerHandleStatusXor
PlayerPartnerHandleStatusXor: @ 0x081BDB18
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleStatusXor

	thumb_func_start PlayerPartnerHandleDataTransfer
PlayerPartnerHandleDataTransfer: @ 0x081BDB24
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleDataTransfer

	thumb_func_start PlayerPartnerHandleDMA3Transfer
PlayerPartnerHandleDMA3Transfer: @ 0x081BDB30
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleDMA3Transfer

	thumb_func_start PlayerPartnerHandlePlayBGM
PlayerPartnerHandlePlayBGM: @ 0x081BDB3C
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandlePlayBGM

	thumb_func_start PlayerPartnerHandleCmd32
PlayerPartnerHandleCmd32: @ 0x081BDB48
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleCmd32

	thumb_func_start PlayerPartnerHandleTwoReturnValues
PlayerPartnerHandleTwoReturnValues: @ 0x081BDB54
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleTwoReturnValues

	thumb_func_start PlayerPartnerHandleChosenMonReturnValue
PlayerPartnerHandleChosenMonReturnValue: @ 0x081BDB60
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleChosenMonReturnValue

	thumb_func_start PlayerPartnerHandleOneReturnValue
PlayerPartnerHandleOneReturnValue: @ 0x081BDB6C
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleOneReturnValue

	thumb_func_start PlayerPartnerHandleOneReturnValue_Duplicate
PlayerPartnerHandleOneReturnValue_Duplicate: @ 0x081BDB78
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleOneReturnValue_Duplicate

	thumb_func_start PlayerPartnerHandleCmd37
PlayerPartnerHandleCmd37: @ 0x081BDB84
	push {lr}
	ldr r2, _081BDB9C
	ldrb r1, [r2]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081BDB9C: .4byte 0x020229C0
	thumb_func_end PlayerPartnerHandleCmd37

	thumb_func_start PlayerPartnerHandleCmd38
PlayerPartnerHandleCmd38: @ 0x081BDBA0
	push {lr}
	ldr r3, _081BDBCC
	ldr r1, _081BDBD0
	ldr r0, _081BDBD4
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081BDBCC: .4byte 0x020229C0
_081BDBD0: .4byte 0x02022D08
_081BDBD4: .4byte 0x02023D08
	thumb_func_end PlayerPartnerHandleCmd38

	thumb_func_start PlayerPartnerHandleCmd39
PlayerPartnerHandleCmd39: @ 0x081BDBD8
	push {lr}
	ldr r2, _081BDBEC
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081BDBEC: .4byte 0x020229C0
	thumb_func_end PlayerPartnerHandleCmd39

	thumb_func_start PlayerPartnerHandleCmd40
PlayerPartnerHandleCmd40: @ 0x081BDBF0
	push {lr}
	ldr r3, _081BDC14
	ldr r1, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #7
	ldrb r2, [r3]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081BDC14: .4byte 0x020229C0
	thumb_func_end PlayerPartnerHandleCmd40

	thumb_func_start PlayerPartnerHandleHitAnimation
PlayerPartnerHandleHitAnimation: @ 0x081BDC18
	push {r4, lr}
	ldr r3, _081BDC40
	ldr r2, _081BDC44
	ldr r4, _081BDC48
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _081BDC4C
	bl PlayerPartnerBufferExecCompleted
	b _081BDC76
	.align 2, 0
_081BDC40: .4byte 0x020205AC
_081BDC44: .4byte 0x02023E88
_081BDC48: .4byte 0x02023D08
_081BDC4C:
	ldr r1, _081BDC7C
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x30]
	ldrb r0, [r4]
	bl DoHitAnimHealthboxEffect
	ldr r1, _081BDC80
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BDC84
	str r1, [r0]
_081BDC76:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BDC7C: .4byte 0x0202415D
_081BDC80: .4byte 0x03005AC0
_081BDC84: .4byte 0x081BB54D
	thumb_func_end PlayerPartnerHandleHitAnimation

	thumb_func_start PlayerPartnerHandleCmd42
PlayerPartnerHandleCmd42: @ 0x081BDC88
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleCmd42

	thumb_func_start PlayerPartnerHandlePlaySE
PlayerPartnerHandlePlaySE: @ 0x081BDC94
	push {r4, lr}
	ldr r4, _081BDCD0
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r3, #0x3f
	cmp r0, #0
	bne _081BDCA8
	movs r3, #0xc0
_081BDCA8:
	ldr r2, _081BDCD4
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	bl PlaySE12WithPanning
	bl PlayerPartnerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BDCD0: .4byte 0x02023D08
_081BDCD4: .4byte 0x02022D08
	thumb_func_end PlayerPartnerHandlePlaySE

	thumb_func_start PlayerPartnerHandlePlayFanfareOrBGM
PlayerPartnerHandlePlayFanfareOrBGM: @ 0x081BDCD8
	push {r4, r5, lr}
	ldr r4, _081BDD0C
	ldr r5, _081BDD10
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _081BDD14
	bl BattleStopLowHpSound
	ldrb r1, [r5]
	lsls r1, r1, #9
	adds r0, r4, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r4, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayBGM
	b _081BDD28
	.align 2, 0
_081BDD0C: .4byte 0x02022D08
_081BDD10: .4byte 0x02023D08
_081BDD14:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_081BDD28:
	bl PlayerPartnerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandlePlayFanfareOrBGM

	thumb_func_start PlayerPartnerHandleFaintingCry
PlayerPartnerHandleFaintingCry: @ 0x081BDD34
	push {lr}
	ldr r1, _081BDD68
	ldr r0, _081BDD6C
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081BDD70
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	rsbs r1, r1, #0
	movs r2, #5
	bl PlayCry3
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081BDD68: .4byte 0x02023D12
_081BDD6C: .4byte 0x02023D08
_081BDD70: .4byte 0x02024190
	thumb_func_end PlayerPartnerHandleFaintingCry

	thumb_func_start PlayerPartnerHandleIntroSlide
PlayerPartnerHandleIntroSlide: @ 0x081BDD74
	push {lr}
	ldr r1, _081BDD9C
	ldr r0, _081BDDA0
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _081BDDA4
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081BDD9C: .4byte 0x02022D08
_081BDDA0: .4byte 0x02023D08
_081BDDA4: .4byte 0x020240A0
	thumb_func_end PlayerPartnerHandleIntroSlide

	thumb_func_start PlayerPartnerHandleIntroTrainerBallThrow
PlayerPartnerHandleIntroTrainerBallThrow: @ 0x081BDDA8
	push {r4, r5, r6, lr}
	ldr r6, _081BDE70
	ldr r5, _081BDE74
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081BDE78
	adds r0, r0, r4
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x32
	strh r1, [r0, #0x2e]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081BDE7C
	strh r1, [r0, #0x32]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081BDE80
	str r1, [r0]
	ldrb r2, [r5]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x38]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _081BDE84
	bl StoreSpriteCallbackInData6
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, _081BDE88
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _081BDE8C
	ldrh r1, [r2]
	ldr r0, _081BDE90
	cmp r1, r0
	bne _081BDE98
	ldr r0, _081BDE94
	ldr r0, [r0, #0x38]
	lsls r4, r4, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r2, #0x20
	bl LoadCompressedPalette
	b _081BDEB6
	.align 2, 0
_081BDE70: .4byte 0x02023E88
_081BDE74: .4byte 0x02023D08
_081BDE78: .4byte 0x020205AC
_081BDE7C: .4byte 0x0000FFD8
_081BDE80: .4byte 0x080A67B5
_081BDE84: .4byte 0x0805C81D
_081BDE88: .4byte 0x0000D6F9
_081BDE8C: .4byte 0x0203886E
_081BDE90: .4byte 0x00000C03
_081BDE94: .4byte 0x082D961C
_081BDE98:
	ldrh r0, [r2]
	bl GetFrontierTrainerFrontSpriteId
	lsls r0, r0, #0x18
	ldr r1, _081BDF38
	lsrs r0, r0, #0x15
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r2, #0x20
	bl LoadCompressedPalette
_081BDEB6:
	ldr r2, _081BDF3C
	ldr r1, _081BDF40
	ldr r5, _081BDF44
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, #5]
	ldr r0, _081BDF48
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _081BDF4C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r5]
	strh r0, [r1, #8]
	ldr r3, _081BDF50
	ldr r0, [r3]
	ldrb r2, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081BDF1A
	ldr r0, _081BDF54
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, _081BDF58
	str r1, [r0]
_081BDF1A:
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r0, [r2, #9]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	ldr r1, _081BDF5C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BDF60
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BDF38: .4byte 0x082D91CC
_081BDF3C: .4byte 0x020205AC
_081BDF40: .4byte 0x02023E88
_081BDF44: .4byte 0x02023D08
_081BDF48: .4byte 0x081BDF65
_081BDF4C: .4byte 0x03005B60
_081BDF50: .4byte 0x02024174
_081BDF54: .4byte 0x02024158
_081BDF58: .4byte 0x0807352D
_081BDF5C: .4byte 0x03005AC0
_081BDF60: .4byte 0x081BAA8D
	thumb_func_end PlayerPartnerHandleIntroTrainerBallThrow

	thumb_func_start sub_081BDF64
sub_081BDF64: @ 0x081BDF64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _081BDF8C
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0x17
	bgt _081BDF90
	adds r0, r2, #1
	strh r0, [r1, #0xa]
	b _081BE04C
	.align 2, 0
_081BDF8C: .4byte 0x03005B60
_081BDF90:
	ldr r7, _081BDFD0
	ldrb r0, [r7]
	mov sb, r0
	ldrh r0, [r1, #8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BDFB0
	ldr r0, _081BDFD4
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081BDFE0
_081BDFB0:
	ldr r0, _081BDFD8
	ldrb r1, [r7]
	lsls r2, r1, #9
	adds r0, #1
	adds r2, r2, r0
	ldr r0, _081BDFDC
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_081BCD80
	b _081BE034
	.align 2, 0
_081BDFD0: .4byte 0x02023D08
_081BDFD4: .4byte 0x02022C90
_081BDFD8: .4byte 0x02022D08
_081BDFDC: .4byte 0x02023D12
_081BDFE0:
	ldr r4, _081BE058
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r4, #1
	adds r1, r1, r4
	ldr r5, _081BE05C
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_081BCD80
	ldrb r0, [r7]
	movs r6, #2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r1, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _081BE060
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r7]
	movs r1, #0
	bl sub_081BCD80
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_081BE034:
	ldr r1, _081BE064
	ldr r2, _081BE068
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BE06C
	str r1, [r0]
	mov r3, sb
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_081BE04C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BE058: .4byte 0x02022D08
_081BE05C: .4byte 0x02023D12
_081BE060: .4byte 0x02024190
_081BE064: .4byte 0x03005AC0
_081BE068: .4byte 0x02023D08
_081BE06C: .4byte 0x081BACC9
	thumb_func_end sub_081BDF64

	thumb_func_start PlayerPartnerHandleDrawPartyStatusSummary
PlayerPartnerHandleDrawPartyStatusSummary: @ 0x081BE070
	push {r4, r5, r6, lr}
	ldr r1, _081BE098
	ldr r0, _081BE09C
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081BE0A0
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081BE0A0
	bl PlayerPartnerBufferExecCompleted
	b _081BE114
	.align 2, 0
_081BE098: .4byte 0x02022D08
_081BE09C: .4byte 0x02023D08
_081BE0A0:
	ldr r6, _081BE11C
	ldr r0, [r6]
	ldr r5, _081BE120
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, #9
	ldr r4, _081BE124
	adds r1, r3, r4
	subs r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, #2
	adds r3, r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _081BE128
	ldrb r1, [r5]
	adds r1, r1, r2
	movs r3, #0
	strb r0, [r1]
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #5]
	ldrb r2, [r5]
	lsls r0, r2, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _081BE108
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x5d
	strb r1, [r0, #5]
_081BE108:
	ldr r0, _081BE12C
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _081BE130
	str r0, [r1]
_081BE114:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BE11C: .4byte 0x02024174
_081BE120: .4byte 0x02023D08
_081BE124: .4byte 0x02022D0C
_081BE128: .4byte 0x02024158
_081BE12C: .4byte 0x03005AC0
_081BE130: .4byte 0x081BE135
	thumb_func_end PlayerPartnerHandleDrawPartyStatusSummary

	thumb_func_start sub_081BE134
sub_081BE134: @ 0x081BE134
	push {r4, lr}
	ldr r4, _081BE174
	ldr r0, [r4]
	ldr r3, _081BE178
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	adds r2, r1, #1
	strb r2, [r0, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x5c
	bls _081BE16C
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #5]
	bl PlayerPartnerBufferExecCompleted
_081BE16C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BE174: .4byte 0x02024174
_081BE178: .4byte 0x02023D08
	thumb_func_end sub_081BE134

	thumb_func_start PlayerPartnerHandleHidePartyStatusSummary
PlayerPartnerHandleHidePartyStatusSummary: @ 0x081BE17C
	push {lr}
	ldr r0, _081BE1B8
	ldr r1, [r0]
	ldr r0, _081BE1BC
	ldrb r3, [r0]
	ldr r1, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081BE1AE
	ldr r2, _081BE1C0
	ldr r0, _081BE1C4
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _081BE1C8
	str r1, [r0]
_081BE1AE:
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_081BE1B8: .4byte 0x02024174
_081BE1BC: .4byte 0x02023D08
_081BE1C0: .4byte 0x03005B60
_081BE1C4: .4byte 0x02024158
_081BE1C8: .4byte 0x0807352D
	thumb_func_end PlayerPartnerHandleHidePartyStatusSummary

	thumb_func_start PlayerPartnerHandleEndBounceEffect
PlayerPartnerHandleEndBounceEffect: @ 0x081BE1CC
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleEndBounceEffect

	thumb_func_start PlayerPartnerHandleSpriteInvisibility
PlayerPartnerHandleSpriteInvisibility: @ 0x081BE1D8
	push {r4, lr}
	ldr r4, _081BE228
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BE21E
	ldr r3, _081BE22C
	ldr r0, _081BE230
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _081BE234
	lsls r1, r1, #9
	adds r0, #1
	adds r1, r1, r0
	adds r2, #0x3e
	movs r0, #1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl CopyBattleSpriteInvisibility
_081BE21E:
	bl PlayerPartnerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BE228: .4byte 0x02023D08
_081BE22C: .4byte 0x020205AC
_081BE230: .4byte 0x02023E88
_081BE234: .4byte 0x02022D08
	thumb_func_end PlayerPartnerHandleSpriteInvisibility

	thumb_func_start PlayerPartnerHandleBattleAnimation
PlayerPartnerHandleBattleAnimation: @ 0x081BE238
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _081BE27C
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081BE290
	ldr r5, _081BE280
	ldrb r2, [r6]
	lsls r1, r2, #9
	adds r0, r5, #1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, #2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, #3
	adds r1, r1, r5
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, #0
	adds r1, r2, #0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081BE284
	bl PlayerPartnerBufferExecCompleted
	b _081BE290
	.align 2, 0
_081BE27C: .4byte 0x02023D08
_081BE280: .4byte 0x02022D08
_081BE284:
	ldr r0, _081BE298
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _081BE29C
	str r0, [r1]
_081BE290:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BE298: .4byte 0x03005AC0
_081BE29C: .4byte 0x081BB8D1
	thumb_func_end PlayerPartnerHandleBattleAnimation

	thumb_func_start PlayerPartnerHandleLinkStandbyMsg
PlayerPartnerHandleLinkStandbyMsg: @ 0x081BE2A0
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleLinkStandbyMsg

	thumb_func_start PlayerPartnerHandleResetActionMoveSelection
PlayerPartnerHandleResetActionMoveSelection: @ 0x081BE2AC
	push {lr}
	bl PlayerPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayerPartnerHandleResetActionMoveSelection

	thumb_func_start PlayerPartnerHandleCmd55
PlayerPartnerHandleCmd55: @ 0x081BE2B8
	push {r4, lr}
	ldr r2, _081BE2F0
	ldr r1, _081BE2F4
	ldr r4, _081BE2F8
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #5
	bl FadeOutMapMusic
	movs r0, #3
	bl BeginFastPaletteFade
	bl PlayerPartnerBufferExecCompleted
	ldr r1, _081BE2FC
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081BE300
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BE2F0: .4byte 0x02023FDE
_081BE2F4: .4byte 0x02022D08
_081BE2F8: .4byte 0x02023D08
_081BE2FC: .4byte 0x03005AC0
_081BE300: .4byte 0x080583C1
	thumb_func_end PlayerPartnerHandleCmd55

	thumb_func_start nullsub_77
nullsub_77: @ 0x081BE304
	bx lr
	.align 2, 0
	thumb_func_end nullsub_77

