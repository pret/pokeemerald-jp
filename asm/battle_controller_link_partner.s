.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SpriteCB_Null2
SpriteCB_Null2: @ 0x0814AF6C
	bx lr
	.align 2, 0
	thumb_func_end SpriteCB_Null2

	thumb_func_start SetControllerToLinkPartner
SetControllerToLinkPartner: @ 0x0814AF70
	ldr r1, _0814AF80
	ldr r0, _0814AF84
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814AF88
	str r1, [r0]
	bx lr
	.align 2, 0
_0814AF80: .4byte 0x03005AC0
_0814AF84: .4byte 0x02023D08
_0814AF88: .4byte 0x0814AF8D
	thumb_func_end SetControllerToLinkPartner

	thumb_func_start LinkPartnerBufferRunCommand
LinkPartnerBufferRunCommand: @ 0x0814AF8C
	push {lr}
	ldr r2, _0814AFC0
	ldr r1, _0814AFC4
	ldr r0, _0814AFC8
	ldrb r3, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0814AFD8
	ldr r0, _0814AFCC
	lsls r1, r3, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x38
	bhi _0814AFD4
	ldr r0, _0814AFD0
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0814AFD8
	.align 2, 0
_0814AFC0: .4byte 0x02023D0C
_0814AFC4: .4byte 0x082FACB4
_0814AFC8: .4byte 0x02023D08
_0814AFCC: .4byte 0x02022D08
_0814AFD0: .4byte 0x085A9544
_0814AFD4:
	bl LinkPartnerBufferExecCompleted
_0814AFD8:
	pop {r0}
	bx r0
	thumb_func_end LinkPartnerBufferRunCommand

	thumb_func_start sub_0814AFDC
sub_0814AFDC: @ 0x0814AFDC
	push {lr}
	ldr r2, _0814B004
	ldr r1, _0814B008
	ldr r0, _0814B00C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0814B010
	cmp r1, r0
	bne _0814B000
	bl LinkPartnerBufferExecCompleted
_0814B000:
	pop {r0}
	bx r0
	.align 2, 0
_0814B004: .4byte 0x020205AC
_0814B008: .4byte 0x02023E88
_0814B00C: .4byte 0x02023D08
_0814B010: .4byte 0x08007141
	thumb_func_end sub_0814AFDC

	thumb_func_start sub_0814B014
sub_0814B014: @ 0x0814B014
	push {r4, r5, r6, lr}
	ldr r6, _0814B06C
	ldr r5, _0814B070
	ldr r4, _0814B074
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
	ldr r0, _0814B078
	cmp r1, r0
	bne _0814B064
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
	bl LinkPartnerBufferExecCompleted
_0814B064:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814B06C: .4byte 0x020205AC
_0814B070: .4byte 0x02023E88
_0814B074: .4byte 0x02023D08
_0814B078: .4byte 0x08007141
	thumb_func_end sub_0814B014

	thumb_func_start sub_0814B07C
sub_0814B07C: @ 0x0814B07C
	push {r4, lr}
	ldr r4, _0814B0BC
	ldr r1, [r4]
	ldr r3, _0814B0C0
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
	bne _0814B0B4
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #9]
	bl LinkPartnerBufferExecCompleted
_0814B0B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B0BC: .4byte 0x02024174
_0814B0C0: .4byte 0x02023D08
	thumb_func_end sub_0814B07C

	thumb_func_start sub_0814B0C4
sub_0814B0C4: @ 0x0814B0C4
	push {r4, r5, r6, lr}
	movs r6, #0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814B0E8
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814B11C
	ldr r0, _0814B108
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0814B11C
_0814B0E8:
	ldr r2, _0814B10C
	ldr r1, _0814B110
	ldr r0, _0814B114
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0814B118
	cmp r1, r0
	bne _0814B154
	b _0814B152
	.align 2, 0
_0814B108: .4byte 0x02022C90
_0814B10C: .4byte 0x020205AC
_0814B110: .4byte 0x03005AD0
_0814B114: .4byte 0x02023D08
_0814B118: .4byte 0x08007141
_0814B11C:
	ldr r2, _0814B18C
	ldr r5, _0814B190
	ldr r0, _0814B194
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
	ldr r0, _0814B198
	cmp r2, r0
	bne _0814B154
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
	bne _0814B154
_0814B152:
	movs r6, #1
_0814B154:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814B160
	movs r6, #0
_0814B160:
	cmp r6, #0
	beq _0814B186
	ldr r0, _0814B19C
	ldr r0, [r0]
	ldr r3, _0814B194
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #9]
	ldr r1, _0814B1A0
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814B1A4
	str r1, [r0]
_0814B186:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814B18C: .4byte 0x020205AC
_0814B190: .4byte 0x03005AD0
_0814B194: .4byte 0x02023D08
_0814B198: .4byte 0x08007141
_0814B19C: .4byte 0x02024174
_0814B1A0: .4byte 0x03005AC0
_0814B1A4: .4byte 0x0814B07D
	thumb_func_end sub_0814B0C4

	thumb_func_start sub_0814B1A8
sub_0814B1A8: @ 0x0814B1A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0814B320
	mov ip, r0
	ldr r0, [r0]
	ldr r7, _0814B324
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
	beq _0814B1D4
	b _0814B312
_0814B1D4:
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
	beq _0814B1F6
	b _0814B312
_0814B1F6:
	ldr r1, _0814B328
	mov sl, r1
	ldr r0, _0814B32C
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
	ldr r0, _0814B330
	cmp r3, r0
	bne _0814B312
	ldr r0, _0814B334
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	bne _0814B312
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0814B312
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
	beq _0814B2B0
	ldr r0, _0814B338
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0814B2B0
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
	ldr r4, _0814B33C
	ldrb r0, [r7]
	mov r1, r8
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0814B340
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0814B344
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
_0814B2B0:
	ldr r1, _0814B32C
	ldr r4, _0814B324
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0814B328
	adds r0, r0, r1
	bl DestroySprite
	ldr r5, _0814B33C
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0814B340
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0814B344
	adds r1, r1, r2
	movs r2, #0
	bl UpdateHealthboxAttribute
	ldrb r0, [r4]
	bl sub_08076320
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl SetHealthboxSpriteVisible
	ldr r0, _0814B320
	ldr r0, [r0]
	ldr r2, [r0, #8]
	ldrb r1, [r2, #9]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldr r1, _0814B348
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814B34C
	str r1, [r0]
_0814B312:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B320: .4byte 0x02024174
_0814B324: .4byte 0x02023D08
_0814B328: .4byte 0x020205AC
_0814B32C: .4byte 0x03005ADC
_0814B330: .4byte 0x08007141
_0814B334: .4byte 0x02023E88
_0814B338: .4byte 0x02022C90
_0814B33C: .4byte 0x03005AD0
_0814B340: .4byte 0x02023D12
_0814B344: .4byte 0x02024190
_0814B348: .4byte 0x03005AC0
_0814B34C: .4byte 0x0814B0C5
	thumb_func_end sub_0814B1A8

	thumb_func_start sub_0814B350
sub_0814B350: @ 0x0814B350
	push {lr}
	ldr r2, _0814B384
	ldr r1, _0814B388
	ldr r0, _0814B38C
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
	bge _0814B37E
	movs r2, #0x24
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0814B37E
	bl LinkPartnerBufferExecCompleted
_0814B37E:
	pop {r0}
	bx r0
	.align 2, 0
_0814B384: .4byte 0x020205AC
_0814B388: .4byte 0x02023E88
_0814B38C: .4byte 0x02023D08
	thumb_func_end sub_0814B350

	thumb_func_start LinkPartnerHandleSwitchInAnim
LinkPartnerHandleSwitchInAnim: @ 0x0814B390
	push {r4, r5, r6, lr}
	ldr r5, _0814B3D0
	ldrb r0, [r5]
	ldr r6, _0814B3D4
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
	beq _0814B3D8
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r2, #0
	bl sub_080726F4
	b _0814B3F2
	.align 2, 0
_0814B3D0: .4byte 0x02023D08
_0814B3D4: .4byte 0x03005AD0
_0814B3D8:
	ldr r2, _0814B3F8
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0814B3FC
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	bl LinkPartnerBufferExecCompleted
_0814B3F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814B3F8: .4byte 0x02023D12
_0814B3FC: .4byte 0x02024190
	thumb_func_end LinkPartnerHandleSwitchInAnim

	thumb_func_start sub_0814B400
sub_0814B400: @ 0x0814B400
	push {r4, r5, r6, lr}
	ldr r6, _0814B484
	ldr r5, _0814B488
	ldr r4, _0814B48C
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
	ble _0814B47C
	ldr r1, _0814B490
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814B494
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
	ldr r1, _0814B498
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl LinkPartnerBufferExecCompleted
_0814B47C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814B484: .4byte 0x020205AC
_0814B488: .4byte 0x02023E88
_0814B48C: .4byte 0x02023D08
_0814B490: .4byte 0x02023D12
_0814B494: .4byte 0x02024190
_0814B498: .4byte 0x03005AD0
	thumb_func_end sub_0814B400

	thumb_func_start sub_0814B49C
sub_0814B49C: @ 0x0814B49C
	push {r4, r5, r6, lr}
	ldr r0, _0814B4F8
	ldr r0, [r0]
	ldr r6, _0814B4FC
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
	bne _0814B4F0
	ldr r5, _0814B500
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0814B504
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
	ldr r1, _0814B508
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl LinkPartnerBufferExecCompleted
_0814B4F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814B4F8: .4byte 0x02024174
_0814B4FC: .4byte 0x02023D08
_0814B500: .4byte 0x02023E88
_0814B504: .4byte 0x020205AC
_0814B508: .4byte 0x03005AD0
	thumb_func_end sub_0814B49C

	thumb_func_start LinkPartnerHandlePlaySE
LinkPartnerHandlePlaySE: @ 0x0814B50C
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0814B51E
	bl LinkPartnerBufferExecCompleted
_0814B51E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandlePlaySE

	thumb_func_start LinkPartnerHandleHitAnimation
LinkPartnerHandleHitAnimation: @ 0x0814B524
	push {r4, lr}
	ldr r1, _0814B560
	ldr r0, _0814B564
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _0814B568
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _0814B570
	movs r3, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0814B56C
	strb r3, [r0]
	bl LinkPartnerBufferExecCompleted
	b _0814B59A
	.align 2, 0
_0814B560: .4byte 0x02023E88
_0814B564: .4byte 0x02023D08
_0814B568: .4byte 0x020205AC
_0814B56C: .4byte 0x0202415D
_0814B570:
	ldrh r0, [r4, #0x30]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0814B594
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
_0814B594:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
_0814B59A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end LinkPartnerHandleHitAnimation

	thumb_func_start sub_0814B5A0
sub_0814B5A0: @ 0x0814B5A0
	push {r4, lr}
	ldr r2, _0814B5F8
	ldr r0, _0814B5FC
	ldr r4, _0814B600
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0814B604
	cmp r1, r0
	bne _0814B5F2
	adds r0, r3, #0
	bl CopyBattleSpriteInvisibility
	ldr r0, _0814B608
	ldr r0, [r0]
	ldrb r2, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0814B5E6
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
_0814B5E6:
	ldr r0, _0814B60C
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0814B610
	str r0, [r1]
_0814B5F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B5F8: .4byte 0x020205AC
_0814B5FC: .4byte 0x03005AD0
_0814B600: .4byte 0x02023D08
_0814B604: .4byte 0x08007141
_0814B608: .4byte 0x02024174
_0814B60C: .4byte 0x03005AC0
_0814B610: .4byte 0x0814B615
	thumb_func_end sub_0814B5A0

	thumb_func_start sub_0814B614
sub_0814B614: @ 0x0814B614
	push {lr}
	ldr r0, _0814B654
	ldr r1, [r0]
	ldr r0, _0814B658
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
	bne _0814B650
	ldr r2, _0814B65C
	ldr r0, _0814B660
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0814B664
	cmp r1, r0
	bne _0814B650
	bl LinkPartnerBufferExecCompleted
_0814B650:
	pop {r0}
	bx r0
	.align 2, 0
_0814B654: .4byte 0x02024174
_0814B658: .4byte 0x02023D08
_0814B65C: .4byte 0x020205AC
_0814B660: .4byte 0x02023E88
_0814B664: .4byte 0x08007141
	thumb_func_end sub_0814B614

	thumb_func_start sub_0814B668
sub_0814B668: @ 0x0814B668
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _0814B730
	ldr r0, [r3]
	ldr r7, _0814B734
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
	beq _0814B724
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
	ldr r4, _0814B738
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	ldr r0, _0814B73C
	movs r1, #0xa
	bl CreateTask
	ldr r0, _0814B740
	mov r8, r0
	ldrb r1, [r7]
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0814B744
	adds r0, r0, r5
	bl HandleLowHpMusicChange
	ldr r1, _0814B748
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0814B74C
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAnim
	ldr r4, _0814B750
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
	ldr r1, _0814B754
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814B758
	str r1, [r0]
_0814B724:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814B730: .4byte 0x02024174
_0814B734: .4byte 0x02023D08
_0814B738: .4byte 0x000027F9
_0814B73C: .4byte 0x08058D11
_0814B740: .4byte 0x02023D12
_0814B744: .4byte 0x02024190
_0814B748: .4byte 0x02023E88
_0814B74C: .4byte 0x020205AC
_0814B750: .4byte 0x03005AD0
_0814B754: .4byte 0x03005AC0
_0814B758: .4byte 0x0814B5A1
	thumb_func_end sub_0814B668

	thumb_func_start sub_0814B75C
sub_0814B75C: @ 0x0814B75C
	push {r4, r5, r6, lr}
	ldr r6, _0814B7DC
	ldr r0, [r6]
	ldr r4, _0814B7E0
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
	bne _0814B78E
	ldr r0, _0814B7E4
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0814B7E8
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08172CD4
_0814B78E:
	ldr r5, _0814B7EC
	ldr r0, _0814B7F0
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
	ldr r0, _0814B7F4
	cmp r1, r0
	bne _0814B7D4
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
	bne _0814B7D4
	adds r0, r3, r5
	bl DestroySprite
	ldr r1, _0814B7F8
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814B7FC
	str r1, [r0]
_0814B7D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814B7DC: .4byte 0x02024174
_0814B7E0: .4byte 0x02023D08
_0814B7E4: .4byte 0x02023D12
_0814B7E8: .4byte 0x02024190
_0814B7EC: .4byte 0x020205AC
_0814B7F0: .4byte 0x03005ADC
_0814B7F4: .4byte 0x08007141
_0814B7F8: .4byte 0x03005AC0
_0814B7FC: .4byte 0x0814B669
	thumb_func_end sub_0814B75C

	thumb_func_start LinkPartnerBufferExecCompleted
LinkPartnerBufferExecCompleted: @ 0x0814B800
	push {r4, lr}
	sub sp, #4
	ldr r1, _0814B840
	ldr r4, _0814B844
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814B848
	str r1, [r0]
	ldr r0, _0814B84C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0814B854
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _0814B850
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _0814B866
	.align 2, 0
_0814B840: .4byte 0x03005AC0
_0814B844: .4byte 0x02023D08
_0814B848: .4byte 0x0814AF8D
_0814B84C: .4byte 0x02022C90
_0814B850: .4byte 0x02022D08
_0814B854:
	ldr r2, _0814B870
	ldr r1, _0814B874
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0814B866:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B870: .4byte 0x02023D0C
_0814B874: .4byte 0x082FACB4
	thumb_func_end LinkPartnerBufferExecCompleted

	thumb_func_start LinkPartnerHandleStatusAnimation
LinkPartnerHandleStatusAnimation: @ 0x0814B878
	push {lr}
	ldr r0, _0814B8A0
	ldr r2, [r0]
	ldr r0, _0814B8A4
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
	bne _0814B89A
	bl LinkPartnerBufferExecCompleted
_0814B89A:
	pop {r0}
	bx r0
	.align 2, 0
_0814B8A0: .4byte 0x02024174
_0814B8A4: .4byte 0x02023D08
	thumb_func_end LinkPartnerHandleStatusAnimation

	thumb_func_start LinkPartnerHandleStatusIconUpdate
LinkPartnerHandleStatusIconUpdate: @ 0x0814B8A8
	push {lr}
	ldr r0, _0814B8D0
	ldr r2, [r0]
	ldr r0, _0814B8D4
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
	bne _0814B8CA
	bl LinkPartnerBufferExecCompleted
_0814B8CA:
	pop {r0}
	bx r0
	.align 2, 0
_0814B8D0: .4byte 0x02024174
_0814B8D4: .4byte 0x02023D08
	thumb_func_end LinkPartnerHandleStatusIconUpdate

	thumb_func_start LinkPartnerHandleGetMonData
LinkPartnerHandleGetMonData: @ 0x0814B8D8
	push {r4, r5, r6, lr}
	sub sp, #0x100
	movs r6, #0
	ldr r1, _0814B904
	ldr r0, _0814B908
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0814B910
	ldr r0, _0814B90C
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyLinkPartnerMonData
	adds r6, r0, #0
	b _0814B932
	.align 2, 0
_0814B904: .4byte 0x02022D08
_0814B908: .4byte 0x02023D08
_0814B90C: .4byte 0x02023D12
_0814B910:
	ldrb r4, [r1]
	movs r5, #0
_0814B914:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0814B92A
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r6
	bl CopyLinkPartnerMonData
	adds r6, r6, r0
_0814B92A:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #5
	ble _0814B914
_0814B932:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl LinkPartnerBufferExecCompleted
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleGetMonData

	thumb_func_start CopyLinkPartnerMonData
CopyLinkPartnerMonData: @ 0x0814B94C
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
	ldr r2, _0814B980
	ldr r3, _0814B984
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _0814B976
	bl _0814C0E2
_0814B976:
	lsls r0, r0, #2
	ldr r1, _0814B988
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814B980: .4byte 0x02022D08
_0814B984: .4byte 0x02023D08
_0814B988: .4byte 0x0814B98C
_0814B98C: @ jump table
	.4byte _0814BA7C @ case 0
	.4byte _0814BCA0 @ case 1
	.4byte _0814BCB0 @ case 2
	.4byte _0814BCC0 @ case 3
	.4byte _0814BD28 @ case 4
	.4byte _0814BD28 @ case 5
	.4byte _0814BD28 @ case 6
	.4byte _0814BD28 @ case 7
	.4byte _0814BD44 @ case 8
	.4byte _0814BD80 @ case 9
	.4byte _0814BD80 @ case 10
	.4byte _0814BD80 @ case 11
	.4byte _0814BD80 @ case 12
	.4byte _0814C0E2 @ case 13
	.4byte _0814C0E2 @ case 14
	.4byte _0814C0E2 @ case 15
	.4byte _0814C0E2 @ case 16
	.4byte _0814BD9C @ case 17
	.4byte _0814BDAC @ case 18
	.4byte _0814BDDC @ case 19
	.4byte _0814BDEC @ case 20
	.4byte _0814BDFC @ case 21
	.4byte _0814BE0C @ case 22
	.4byte _0814BE1C @ case 23
	.4byte _0814BE2C @ case 24
	.4byte _0814BE3C @ case 25
	.4byte _0814BE4C @ case 26
	.4byte _0814BE5C @ case 27
	.4byte _0814BE6C @ case 28
	.4byte _0814BE7C @ case 29
	.4byte _0814BE8C @ case 30
	.4byte _0814BE9C @ case 31
	.4byte _0814BEEC @ case 32
	.4byte _0814BEFC @ case 33
	.4byte _0814BF0C @ case 34
	.4byte _0814BF1C @ case 35
	.4byte _0814BF2C @ case 36
	.4byte _0814BF3C @ case 37
	.4byte _0814BF4C @ case 38
	.4byte _0814BF5C @ case 39
	.4byte _0814BF6C @ case 40
	.4byte _0814BFA0 @ case 41
	.4byte _0814BFB0 @ case 42
	.4byte _0814BFC0 @ case 43
	.4byte _0814BFD0 @ case 44
	.4byte _0814BFE0 @ case 45
	.4byte _0814BFF0 @ case 46
	.4byte _0814C000 @ case 47
	.4byte _0814C010 @ case 48
	.4byte _0814C030 @ case 49
	.4byte _0814C040 @ case 50
	.4byte _0814C050 @ case 51
	.4byte _0814C060 @ case 52
	.4byte _0814C070 @ case 53
	.4byte _0814C080 @ case 54
	.4byte _0814C090 @ case 55
	.4byte _0814C0A0 @ case 56
	.4byte _0814C0B0 @ case 57
	.4byte _0814C0C0 @ case 58
	.4byte _0814C0D0 @ case 59
_0814BA7C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0814BC90
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
_0814BAC8:
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
	ble _0814BAC8
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0814BC90
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
	ldr r1, _0814BC94
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
	ldr r2, _0814BC98
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
	ldr r1, _0814BC9C
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
_0814BC80:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x57
	bls _0814BC80
	b _0814C0E2
	.align 2, 0
_0814BC90: .4byte 0x02024190
_0814BC94: .4byte 0xFFFFFC1F
_0814BC98: .4byte 0xFFF07FFF
_0814BC9C: .4byte 0xFFFFFE0F
_0814BCA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BCAC
	adds r0, r0, r1
	movs r1, #0xb
	b _0814C01A
	.align 2, 0
_0814BCAC: .4byte 0x02024190
_0814BCB0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BCBC
	adds r0, r0, r1
	movs r1, #0xc
	b _0814C01A
	.align 2, 0
_0814BCBC: .4byte 0x02024190
_0814BCC0:
	movs r6, #0
	add r2, sp, #0x58
	mov sb, r2
	add r0, sp, #0x60
	mov sl, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0814BD24
	adds r4, r1, r0
	mov r8, sb
_0814BCD6:
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
	ble _0814BCD6
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BD24
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	mov r1, sb
	strb r0, [r1, #0xc]
	mov r2, sb
	movs r6, #0
_0814BD14:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0xf
	bls _0814BD14
	b _0814C0E2
	.align 2, 0
_0814BD24: .4byte 0x02024190
_0814BD28:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BD40
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #9
	b _0814C01A
	.align 2, 0
_0814BD40: .4byte 0x02024190
_0814BD44:
	movs r6, #0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r2, _0814BD7C
	mov r8, r2
_0814BD50:
	adds r1, r6, #0
	adds r1, #0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	cmp r6, #3
	ble _0814BD50
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BD7C
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	b _0814C0E2
	.align 2, 0
_0814BD7C: .4byte 0x02024190
_0814BD80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BD98
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #8
	b _0814C0DA
	.align 2, 0
_0814BD98: .4byte 0x02024190
_0814BD9C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BDA8
	adds r0, r0, r1
	movs r1, #1
	b _0814BDB6
	.align 2, 0
_0814BDA8: .4byte 0x02024190
_0814BDAC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BDD8
	adds r0, r0, r1
	movs r1, #0x19
_0814BDB6:
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
	b _0814C0E2
	.align 2, 0
_0814BDD8: .4byte 0x02024190
_0814BDDC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BDE8
	adds r0, r0, r1
	movs r1, #0x1a
	b _0814C0DA
	.align 2, 0
_0814BDE8: .4byte 0x02024190
_0814BDEC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BDF8
	adds r0, r0, r1
	movs r1, #0x1b
	b _0814C0DA
	.align 2, 0
_0814BDF8: .4byte 0x02024190
_0814BDFC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE08
	adds r0, r0, r1
	movs r1, #0x1c
	b _0814C0DA
	.align 2, 0
_0814BE08: .4byte 0x02024190
_0814BE0C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE18
	adds r0, r0, r1
	movs r1, #0x1d
	b _0814C0DA
	.align 2, 0
_0814BE18: .4byte 0x02024190
_0814BE1C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE28
	adds r0, r0, r1
	movs r1, #0x1e
	b _0814C0DA
	.align 2, 0
_0814BE28: .4byte 0x02024190
_0814BE2C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE38
	adds r0, r0, r1
	movs r1, #0x1f
	b _0814C0DA
	.align 2, 0
_0814BE38: .4byte 0x02024190
_0814BE3C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE48
	adds r0, r0, r1
	movs r1, #0x20
	b _0814C0DA
	.align 2, 0
_0814BE48: .4byte 0x02024190
_0814BE4C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE58
	adds r0, r0, r1
	movs r1, #0x22
	b _0814C0DA
	.align 2, 0
_0814BE58: .4byte 0x02024190
_0814BE5C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE68
	adds r0, r0, r1
	movs r1, #0x23
	b _0814C0DA
	.align 2, 0
_0814BE68: .4byte 0x02024190
_0814BE6C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE78
	adds r0, r0, r1
	movs r1, #0x24
	b _0814C0DA
	.align 2, 0
_0814BE78: .4byte 0x02024190
_0814BE7C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE88
	adds r0, r0, r1
	movs r1, #0x25
	b _0814C0DA
	.align 2, 0
_0814BE88: .4byte 0x02024190
_0814BE8C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BE98
	adds r0, r0, r1
	movs r1, #0x26
	b _0814C0DA
	.align 2, 0
_0814BE98: .4byte 0x02024190
_0814BE9C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0814BEE8
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
	b _0814C0E2
	.align 2, 0
_0814BEE8: .4byte 0x02024190
_0814BEEC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BEF8
	adds r0, r0, r1
	movs r1, #0x27
	b _0814C0DA
	.align 2, 0
_0814BEF8: .4byte 0x02024190
_0814BEFC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BF08
	adds r0, r0, r1
	movs r1, #0x28
	b _0814C0DA
	.align 2, 0
_0814BF08: .4byte 0x02024190
_0814BF0C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BF18
	adds r0, r0, r1
	movs r1, #0x29
	b _0814C0DA
	.align 2, 0
_0814BF18: .4byte 0x02024190
_0814BF1C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BF28
	adds r0, r0, r1
	movs r1, #0x2a
	b _0814C0DA
	.align 2, 0
_0814BF28: .4byte 0x02024190
_0814BF2C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BF38
	adds r0, r0, r1
	movs r1, #0x2b
	b _0814C0DA
	.align 2, 0
_0814BF38: .4byte 0x02024190
_0814BF3C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BF48
	adds r0, r0, r1
	movs r1, #0x2c
	b _0814C0DA
	.align 2, 0
_0814BF48: .4byte 0x02024190
_0814BF4C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BF58
	adds r0, r0, r1
	movs r1, #0
	b _0814BF76
	.align 2, 0
_0814BF58: .4byte 0x02024190
_0814BF5C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BF68
	adds r0, r0, r1
	movs r1, #9
	b _0814C01A
	.align 2, 0
_0814BF68: .4byte 0x02024190
_0814BF6C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BF9C
	adds r0, r0, r1
	movs r1, #0x37
_0814BF76:
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
	b _0814C0E2
	.align 2, 0
_0814BF9C: .4byte 0x02024190
_0814BFA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BFAC
	adds r0, r0, r1
	movs r1, #0x38
	b _0814C0DA
	.align 2, 0
_0814BFAC: .4byte 0x02024190
_0814BFB0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BFBC
	adds r0, r0, r1
	movs r1, #0x39
	b _0814C01A
	.align 2, 0
_0814BFBC: .4byte 0x02024190
_0814BFC0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BFCC
	adds r0, r0, r1
	movs r1, #0x3a
	b _0814C01A
	.align 2, 0
_0814BFCC: .4byte 0x02024190
_0814BFD0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BFDC
	adds r0, r0, r1
	movs r1, #0x3b
	b _0814C01A
	.align 2, 0
_0814BFDC: .4byte 0x02024190
_0814BFE0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BFEC
	adds r0, r0, r1
	movs r1, #0x3c
	b _0814C01A
	.align 2, 0
_0814BFEC: .4byte 0x02024190
_0814BFF0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814BFFC
	adds r0, r0, r1
	movs r1, #0x3d
	b _0814C01A
	.align 2, 0
_0814BFFC: .4byte 0x02024190
_0814C000:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C00C
	adds r0, r0, r1
	movs r1, #0x3e
	b _0814C01A
	.align 2, 0
_0814C00C: .4byte 0x02024190
_0814C010:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C02C
	adds r0, r0, r1
	movs r1, #0x3f
_0814C01A:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strb r0, [r7]
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r6, #2
	b _0814C0E2
	.align 2, 0
_0814C02C: .4byte 0x02024190
_0814C030:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C03C
	adds r0, r0, r1
	movs r1, #0x16
	b _0814C0DA
	.align 2, 0
_0814C03C: .4byte 0x02024190
_0814C040:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C04C
	adds r0, r0, r1
	movs r1, #0x17
	b _0814C0DA
	.align 2, 0
_0814C04C: .4byte 0x02024190
_0814C050:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C05C
	adds r0, r0, r1
	movs r1, #0x18
	b _0814C0DA
	.align 2, 0
_0814C05C: .4byte 0x02024190
_0814C060:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C06C
	adds r0, r0, r1
	movs r1, #0x21
	b _0814C0DA
	.align 2, 0
_0814C06C: .4byte 0x02024190
_0814C070:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C07C
	adds r0, r0, r1
	movs r1, #0x2f
	b _0814C0DA
	.align 2, 0
_0814C07C: .4byte 0x02024190
_0814C080:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C08C
	adds r0, r0, r1
	movs r1, #0x30
	b _0814C0DA
	.align 2, 0
_0814C08C: .4byte 0x02024190
_0814C090:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C09C
	adds r0, r0, r1
	movs r1, #0x32
	b _0814C0DA
	.align 2, 0
_0814C09C: .4byte 0x02024190
_0814C0A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C0AC
	adds r0, r0, r1
	movs r1, #0x33
	b _0814C0DA
	.align 2, 0
_0814C0AC: .4byte 0x02024190
_0814C0B0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C0BC
	adds r0, r0, r1
	movs r1, #0x34
	b _0814C0DA
	.align 2, 0
_0814C0BC: .4byte 0x02024190
_0814C0C0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C0CC
	adds r0, r0, r1
	movs r1, #0x35
	b _0814C0DA
	.align 2, 0
_0814C0CC: .4byte 0x02024190
_0814C0D0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C0F4
	adds r0, r0, r1
	movs r1, #0x36
_0814C0DA:
	bl GetMonData
	strb r0, [r7]
	movs r6, #1
_0814C0E2:
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
_0814C0F4: .4byte 0x02024190
	thumb_func_end CopyLinkPartnerMonData

	thumb_func_start LinkPartnerHandleGetRawMonData
LinkPartnerHandleGetRawMonData: @ 0x0814C0F8
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleGetRawMonData

	thumb_func_start LinkPartnerHandleSetMonData
LinkPartnerHandleSetMonData: @ 0x0814C104
	push {r4, r5, lr}
	ldr r1, _0814C128
	ldr r0, _0814C12C
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0814C134
	ldr r0, _0814C130
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl SetLinkPartnerMonData
	b _0814C152
	.align 2, 0
_0814C128: .4byte 0x02022D08
_0814C12C: .4byte 0x02023D08
_0814C130: .4byte 0x02023D12
_0814C134:
	ldrb r4, [r1]
	movs r5, #0
_0814C138:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0814C146
	adds r0, r5, #0
	bl SetLinkPartnerMonData
_0814C146:
	lsrs r4, r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0814C138
_0814C152:
	bl LinkPartnerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end LinkPartnerHandleSetMonData

	thumb_func_start SetLinkPartnerMonData
SetLinkPartnerMonData: @ 0x0814C15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0814C194
	ldrb r0, [r0]
	lsls r0, r0, #9
	ldr r2, _0814C198
	adds r3, r0, r2
	adds r6, r3, #0
	subs r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r2, #0
	cmp r0, #0x3b
	bls _0814C188
	bl _0814CB22
_0814C188:
	lsls r0, r0, #2
	ldr r1, _0814C19C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814C194: .4byte 0x02023D08
_0814C198: .4byte 0x02022D0B
_0814C19C: .4byte 0x0814C1A0
_0814C1A0: @ jump table
	.4byte _0814C290 @ case 0
	.4byte _0814C428 @ case 1
	.4byte _0814C448 @ case 2
	.4byte _0814C468 @ case 3
	.4byte _0814C4C0 @ case 4
	.4byte _0814C4C0 @ case 5
	.4byte _0814C4C0 @ case 6
	.4byte _0814C4C0 @ case 7
	.4byte _0814C4E8 @ case 8
	.4byte _0814C54C @ case 9
	.4byte _0814C54C @ case 10
	.4byte _0814C54C @ case 11
	.4byte _0814C54C @ case 12
	.4byte _0814CB22 @ case 13
	.4byte _0814CB22 @ case 14
	.4byte _0814CB22 @ case 15
	.4byte _0814CB22 @ case 16
	.4byte _0814C57C @ case 17
	.4byte _0814C59C @ case 18
	.4byte _0814C5BC @ case 19
	.4byte _0814C5DC @ case 20
	.4byte _0814C5FC @ case 21
	.4byte _0814C61C @ case 22
	.4byte _0814C63C @ case 23
	.4byte _0814C65C @ case 24
	.4byte _0814C67C @ case 25
	.4byte _0814C69C @ case 26
	.4byte _0814C6BC @ case 27
	.4byte _0814C6DC @ case 28
	.4byte _0814C6FC @ case 29
	.4byte _0814C71C @ case 30
	.4byte _0814C73C @ case 31
	.4byte _0814C7AC @ case 32
	.4byte _0814C7CC @ case 33
	.4byte _0814C7EC @ case 34
	.4byte _0814C80C @ case 35
	.4byte _0814C82C @ case 36
	.4byte _0814C84C @ case 37
	.4byte _0814C86C @ case 38
	.4byte _0814C88C @ case 39
	.4byte _0814C8AC @ case 40
	.4byte _0814C8CC @ case 41
	.4byte _0814C8EC @ case 42
	.4byte _0814C90C @ case 43
	.4byte _0814C92C @ case 44
	.4byte _0814C94C @ case 45
	.4byte _0814C96C @ case 46
	.4byte _0814C98C @ case 47
	.4byte _0814C9AC @ case 48
	.4byte _0814C9CC @ case 49
	.4byte _0814C9EC @ case 50
	.4byte _0814CA0C @ case 51
	.4byte _0814CA2C @ case 52
	.4byte _0814CA4C @ case 53
	.4byte _0814CA6C @ case 54
	.4byte _0814CA8C @ case 55
	.4byte _0814CAAC @ case 56
	.4byte _0814CACC @ case 57
	.4byte _0814CAEC @ case 58
	.4byte _0814CB0C @ case 59
_0814C290:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0814C424
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
_0814C2F6:
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
	ble _0814C2F6
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0814C424
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
	b _0814CB22
	.align 2, 0
_0814C424: .4byte 0x02024190
_0814C428:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C440
	adds r0, r0, r1
	ldr r1, _0814C444
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xb
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C440: .4byte 0x02024190
_0814C444: .4byte 0x02023D08
_0814C448:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C460
	adds r0, r0, r1
	ldr r1, _0814C464
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0xc
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C460: .4byte 0x02024190
_0814C464: .4byte 0x02023D08
_0814C468:
	movs r0, #0
	mov r8, r0
	movs r0, #0xc
	adds r0, r0, r3
	mov sb, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0814C4BC
	adds r7, r1, r0
	adds r6, r3, #0
	adds r6, #8
	adds r4, r3, #0
_0814C482:
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
	ble _0814C482
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C4BC
	adds r0, r0, r1
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C4BC: .4byte 0x02024190
_0814C4C0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C4DC
	adds r0, r0, r1
	ldr r3, _0814C4E0
	ldr r1, _0814C4E4
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #9
	b _0814C564
	.align 2, 0
_0814C4DC: .4byte 0x02024190
_0814C4E0: .4byte 0x02022D08
_0814C4E4: .4byte 0x02023D08
_0814C4E8:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0814C544
	adds r4, r4, r0
	ldr r5, _0814C548
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
	b _0814CB22
	.align 2, 0
_0814C544: .4byte 0x02024190
_0814C548: .4byte 0x02023D08
_0814C54C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C570
	adds r0, r0, r1
	ldr r3, _0814C574
	ldr r1, _0814C578
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #8
_0814C564:
	adds r3, #3
	adds r2, r2, r3
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C570: .4byte 0x02024190
_0814C574: .4byte 0x02022D08
_0814C578: .4byte 0x02023D08
_0814C57C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C594
	adds r0, r0, r1
	ldr r1, _0814C598
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #1
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C594: .4byte 0x02024190
_0814C598: .4byte 0x02023D08
_0814C59C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C5B4
	adds r0, r0, r1
	ldr r1, _0814C5B8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x19
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C5B4: .4byte 0x02024190
_0814C5B8: .4byte 0x02023D08
_0814C5BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C5D4
	adds r0, r0, r1
	ldr r1, _0814C5D8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1a
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C5D4: .4byte 0x02024190
_0814C5D8: .4byte 0x02023D08
_0814C5DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C5F4
	adds r0, r0, r1
	ldr r1, _0814C5F8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1b
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C5F4: .4byte 0x02024190
_0814C5F8: .4byte 0x02023D08
_0814C5FC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C614
	adds r0, r0, r1
	ldr r1, _0814C618
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1c
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C614: .4byte 0x02024190
_0814C618: .4byte 0x02023D08
_0814C61C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C634
	adds r0, r0, r1
	ldr r1, _0814C638
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1d
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C634: .4byte 0x02024190
_0814C638: .4byte 0x02023D08
_0814C63C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C654
	adds r0, r0, r1
	ldr r1, _0814C658
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1e
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C654: .4byte 0x02024190
_0814C658: .4byte 0x02023D08
_0814C65C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C674
	adds r0, r0, r1
	ldr r1, _0814C678
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x1f
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C674: .4byte 0x02024190
_0814C678: .4byte 0x02023D08
_0814C67C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C694
	adds r0, r0, r1
	ldr r1, _0814C698
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x20
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C694: .4byte 0x02024190
_0814C698: .4byte 0x02023D08
_0814C69C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C6B4
	adds r0, r0, r1
	ldr r1, _0814C6B8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x22
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C6B4: .4byte 0x02024190
_0814C6B8: .4byte 0x02023D08
_0814C6BC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C6D4
	adds r0, r0, r1
	ldr r1, _0814C6D8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x23
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C6D4: .4byte 0x02024190
_0814C6D8: .4byte 0x02023D08
_0814C6DC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C6F4
	adds r0, r0, r1
	ldr r1, _0814C6F8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x24
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C6F4: .4byte 0x02024190
_0814C6F8: .4byte 0x02023D08
_0814C6FC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C714
	adds r0, r0, r1
	ldr r1, _0814C718
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x25
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C714: .4byte 0x02024190
_0814C718: .4byte 0x02023D08
_0814C71C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C734
	adds r0, r0, r1
	ldr r1, _0814C738
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x26
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C734: .4byte 0x02024190
_0814C738: .4byte 0x02023D08
_0814C73C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _0814C7A4
	adds r4, r4, r0
	ldr r5, _0814C7A8
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
	b _0814C85C
	.align 2, 0
_0814C7A4: .4byte 0x02024190
_0814C7A8: .4byte 0x02023D08
_0814C7AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C7C4
	adds r0, r0, r1
	ldr r1, _0814C7C8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x27
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C7C4: .4byte 0x02024190
_0814C7C8: .4byte 0x02023D08
_0814C7CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C7E4
	adds r0, r0, r1
	ldr r1, _0814C7E8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x28
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C7E4: .4byte 0x02024190
_0814C7E8: .4byte 0x02023D08
_0814C7EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C804
	adds r0, r0, r1
	ldr r1, _0814C808
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x29
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C804: .4byte 0x02024190
_0814C808: .4byte 0x02023D08
_0814C80C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C824
	adds r0, r0, r1
	ldr r1, _0814C828
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2a
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C824: .4byte 0x02024190
_0814C828: .4byte 0x02023D08
_0814C82C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C844
	adds r0, r0, r1
	ldr r1, _0814C848
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2b
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C844: .4byte 0x02024190
_0814C848: .4byte 0x02023D08
_0814C84C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C864
	adds r0, r0, r1
	ldr r1, _0814C868
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
_0814C85C:
	movs r1, #0x2c
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C864: .4byte 0x02024190
_0814C868: .4byte 0x02023D08
_0814C86C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C884
	adds r0, r0, r1
	ldr r1, _0814C888
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C884: .4byte 0x02024190
_0814C888: .4byte 0x02023D08
_0814C88C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C8A4
	adds r0, r0, r1
	ldr r1, _0814C8A8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #9
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C8A4: .4byte 0x02024190
_0814C8A8: .4byte 0x02023D08
_0814C8AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C8C4
	adds r0, r0, r1
	ldr r1, _0814C8C8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x37
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C8C4: .4byte 0x02024190
_0814C8C8: .4byte 0x02023D08
_0814C8CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C8E4
	adds r0, r0, r1
	ldr r1, _0814C8E8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x38
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C8E4: .4byte 0x02024190
_0814C8E8: .4byte 0x02023D08
_0814C8EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C904
	adds r0, r0, r1
	ldr r1, _0814C908
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x39
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C904: .4byte 0x02024190
_0814C908: .4byte 0x02023D08
_0814C90C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C924
	adds r0, r0, r1
	ldr r1, _0814C928
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3a
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C924: .4byte 0x02024190
_0814C928: .4byte 0x02023D08
_0814C92C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C944
	adds r0, r0, r1
	ldr r1, _0814C948
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3b
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C944: .4byte 0x02024190
_0814C948: .4byte 0x02023D08
_0814C94C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C964
	adds r0, r0, r1
	ldr r1, _0814C968
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3c
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C964: .4byte 0x02024190
_0814C968: .4byte 0x02023D08
_0814C96C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C984
	adds r0, r0, r1
	ldr r1, _0814C988
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3d
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C984: .4byte 0x02024190
_0814C988: .4byte 0x02023D08
_0814C98C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C9A4
	adds r0, r0, r1
	ldr r1, _0814C9A8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3e
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C9A4: .4byte 0x02024190
_0814C9A8: .4byte 0x02023D08
_0814C9AC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C9C4
	adds r0, r0, r1
	ldr r1, _0814C9C8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x3f
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C9C4: .4byte 0x02024190
_0814C9C8: .4byte 0x02023D08
_0814C9CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814C9E4
	adds r0, r0, r1
	ldr r1, _0814C9E8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x16
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814C9E4: .4byte 0x02024190
_0814C9E8: .4byte 0x02023D08
_0814C9EC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CA04
	adds r0, r0, r1
	ldr r1, _0814CA08
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x17
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CA04: .4byte 0x02024190
_0814CA08: .4byte 0x02023D08
_0814CA0C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CA24
	adds r0, r0, r1
	ldr r1, _0814CA28
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x18
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CA24: .4byte 0x02024190
_0814CA28: .4byte 0x02023D08
_0814CA2C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CA44
	adds r0, r0, r1
	ldr r1, _0814CA48
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x21
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CA44: .4byte 0x02024190
_0814CA48: .4byte 0x02023D08
_0814CA4C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CA64
	adds r0, r0, r1
	ldr r1, _0814CA68
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x2f
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CA64: .4byte 0x02024190
_0814CA68: .4byte 0x02023D08
_0814CA6C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CA84
	adds r0, r0, r1
	ldr r1, _0814CA88
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x30
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CA84: .4byte 0x02024190
_0814CA88: .4byte 0x02023D08
_0814CA8C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CAA4
	adds r0, r0, r1
	ldr r1, _0814CAA8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x32
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CAA4: .4byte 0x02024190
_0814CAA8: .4byte 0x02023D08
_0814CAAC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CAC4
	adds r0, r0, r1
	ldr r1, _0814CAC8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x33
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CAC4: .4byte 0x02024190
_0814CAC8: .4byte 0x02023D08
_0814CACC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CAE4
	adds r0, r0, r1
	ldr r1, _0814CAE8
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x34
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CAE4: .4byte 0x02024190
_0814CAE8: .4byte 0x02023D08
_0814CAEC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CB04
	adds r0, r0, r1
	ldr r1, _0814CB08
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x35
	bl SetMonData
	b _0814CB22
	.align 2, 0
_0814CB04: .4byte 0x02024190
_0814CB08: .4byte 0x02023D08
_0814CB0C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0814CB4C
	adds r0, r0, r1
	ldr r1, _0814CB50
	ldrb r2, [r1]
	lsls r2, r2, #9
	adds r2, r2, r7
	movs r1, #0x36
	bl SetMonData
_0814CB22:
	ldr r2, _0814CB54
	ldr r0, _0814CB50
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0814CB4C
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
_0814CB4C: .4byte 0x02024190
_0814CB50: .4byte 0x02023D08
_0814CB54: .4byte 0x02023D12
	thumb_func_end SetLinkPartnerMonData

	thumb_func_start LinkPartnerHandleSetRawMonData
LinkPartnerHandleSetRawMonData: @ 0x0814CB58
	push {r4, r5, r6, r7, lr}
	ldr r1, _0814CBBC
	ldr r7, _0814CBC0
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r4, _0814CBC4
	lsls r2, r2, #9
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _0814CBC8
	adds r0, r0, r1
	adds r5, r3, r0
	movs r3, #0
	adds r0, r4, #2
	adds r2, r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bhs _0814CBB0
	adds r6, r4, #0
	adds r2, r7, #0
	adds r4, r0, #0
_0814CB8E:
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
	blo _0814CB8E
_0814CBB0:
	bl LinkPartnerBufferExecCompleted
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814CBBC: .4byte 0x02023D12
_0814CBC0: .4byte 0x02023D08
_0814CBC4: .4byte 0x02022D08
_0814CBC8: .4byte 0x02024190
	thumb_func_end LinkPartnerHandleSetRawMonData

	thumb_func_start LinkPartnerHandleLoadMonSprite
LinkPartnerHandleLoadMonSprite: @ 0x0814CBCC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _0814CCC0
	mov r8, r0
	ldr r6, _0814CCC4
	ldrb r1, [r6]
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _0814CCC8
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
	ldr r0, _0814CCCC
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
	ldr r4, _0814CCD0
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r5, _0814CCD4
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0814CCD8
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
	ldr r1, _0814CCDC
	adds r2, r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldr r1, _0814CCE0
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814CCE4
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814CCC0: .4byte 0x02023D12
_0814CCC4: .4byte 0x02023D08
_0814CCC8: .4byte 0x02024190
_0814CCCC: .4byte 0x02024640
_0814CCD0: .4byte 0x02023E88
_0814CCD4: .4byte 0x020205AC
_0814CCD8: .4byte 0x0000FF10
_0814CCDC: .4byte 0x02024188
_0814CCE0: .4byte 0x03005AC0
_0814CCE4: .4byte 0x0814B351
	thumb_func_end LinkPartnerHandleLoadMonSprite

	thumb_func_start sub_0814CCE8
sub_0814CCE8: @ 0x0814CCE8
	push {r4, r5, r6, lr}
	ldr r5, _0814CD40
	ldrb r0, [r5]
	ldr r4, _0814CD44
	lsls r1, r0, #9
	adds r6, r4, #2
	adds r1, r1, r6
	ldrb r1, [r1]
	bl ClearTemporarySpeciesSpriteData
	ldr r2, _0814CD48
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
	ldr r2, _0814CD4C
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r5]
	lsls r1, r0, #9
	adds r1, r1, r6
	ldrb r1, [r1]
	bl sub_0814CD58
	ldr r1, _0814CD50
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814CD54
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814CD40: .4byte 0x02023D08
_0814CD44: .4byte 0x02022D08
_0814CD48: .4byte 0x02023D12
_0814CD4C: .4byte 0x02024190
_0814CD50: .4byte 0x03005AC0
_0814CD54: .4byte 0x0814B75D
	thumb_func_end sub_0814CCE8

	thumb_func_start sub_0814CD58
sub_0814CD58: @ 0x0814CD58
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
	ldr r0, _0814CEAC
	lsls r2, r6, #1
	adds r2, r2, r0
	ldr r0, _0814CEB0
	lsls r1, r6, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814CEB4
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0814CEB8
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0814CEBC
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
	ldr r0, _0814CEC0
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
	ldr r4, _0814CEC4
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0814CEC8
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
	ldr r1, _0814CECC
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
	ldr r1, _0814CED0
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
_0814CEAC: .4byte 0x02023D12
_0814CEB0: .4byte 0x02022D08
_0814CEB4: .4byte 0x02024190
_0814CEB8: .4byte 0x0805D331
_0814CEBC: .4byte 0x03005ADC
_0814CEC0: .4byte 0x02024640
_0814CEC4: .4byte 0x02023E88
_0814CEC8: .4byte 0x020205AC
_0814CECC: .4byte 0x02024188
_0814CED0: .4byte 0x08007141
	thumb_func_end sub_0814CD58

	thumb_func_start LinkPartnerHandleReturnMonToBall
LinkPartnerHandleReturnMonToBall: @ 0x0814CED4
	push {r4, r5, r6, lr}
	ldr r1, _0814CF08
	ldr r6, _0814CF0C
	ldrb r2, [r6]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _0814CF1C
	ldr r0, _0814CF10
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r3, [r0, #4]
	ldr r1, _0814CF14
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814CF18
	str r1, [r0]
	b _0814CF52
	.align 2, 0
_0814CF08: .4byte 0x02022D08
_0814CF0C: .4byte 0x02023D08
_0814CF10: .4byte 0x02024174
_0814CF14: .4byte 0x03005AC0
_0814CF18: .4byte 0x0814CF65
_0814CF1C:
	ldr r5, _0814CF58
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0814CF5C
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
	ldr r1, _0814CF60
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl LinkPartnerBufferExecCompleted
_0814CF52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814CF58: .4byte 0x02023E88
_0814CF5C: .4byte 0x020205AC
_0814CF60: .4byte 0x03005AD0
	thumb_func_end LinkPartnerHandleReturnMonToBall

	thumb_func_start sub_0814CF64
sub_0814CF64: @ 0x0814CF64
	push {r4, r5, r6, lr}
	ldr r6, _0814CF84
	ldr r4, [r6]
	ldr r5, _0814CF88
	ldrb r2, [r5]
	ldr r1, [r4, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0814CF8C
	cmp r0, #1
	beq _0814CFBA
	b _0814CFE2
	.align 2, 0
_0814CF84: .4byte 0x02024174
_0814CF88: .4byte 0x02023D08
_0814CF8C:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0814CFA6
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0814CFA6:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0814CFE2
_0814CFBA:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0814CFE2
	strb r0, [r3, #4]
	ldrb r2, [r5]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #1
	bl InitAndLaunchSpecialAnimation
	ldr r1, _0814CFE8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814CFEC
	str r1, [r0]
_0814CFE2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814CFE8: .4byte 0x03005AC0
_0814CFEC: .4byte 0x0814B49D
	thumb_func_end sub_0814CF64

	thumb_func_start LinkPartnerHandleDrawTrainerPic
LinkPartnerHandleDrawTrainerPic: @ 0x0814CFF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0814D018
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0814D020
	ldr r0, _0814D01C
	ldrb r0, [r0]
	bl GetBattlerPosition
	movs r1, #2
	ands r1, r0
	movs r7, #0x20
	cmp r1, #0
	beq _0814D022
	movs r7, #0x5a
	b _0814D022
	.align 2, 0
_0814D018: .4byte 0x02022C90
_0814D01C: .4byte 0x02023D08
_0814D020:
	movs r7, #0x50
_0814D022:
	ldr r5, _0814D068
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	ldr r6, _0814D06C
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r4, #0xff
	ldrb r0, [r1]
	cmp r0, #4
	beq _0814D054
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #5
	bne _0814D070
_0814D054:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #0x13]
	adds r4, r0, #2
	b _0814D0C2
	.align 2, 0
_0814D068: .4byte 0x02023D08
_0814D06C: .4byte 0x020226A0
_0814D070:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #2
	beq _0814D09E
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r1]
	ands r4, r0
	cmp r4, #1
	bne _0814D0B2
_0814D09E:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #0x13]
	adds r4, r0, #4
	b _0814D0C2
_0814D0B2:
	ldrb r0, [r5]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r4, [r1, #0x13]
_0814D0C2:
	ldr r5, _0814D180
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
	ldr r6, _0814D184
	mov r8, r7
	ldr r0, _0814D188
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r0, [r4]
	movs r4, #8
	subs r4, r4, r0
	lsls r4, r4, #0x12
	movs r0, #0xa0
	lsls r0, r0, #0xf
	adds r4, r4, r0
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
	ldr r6, _0814D18C
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _0814D190
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
	ldr r1, _0814D194
	strh r1, [r0, #0x2e]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _0814D198
	str r1, [r0]
	ldr r1, _0814D19C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814D1A0
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814D180: .4byte 0x02023D08
_0814D184: .4byte 0x02024640
_0814D188: .4byte 0x082D95BC
_0814D18C: .4byte 0x02023E88
_0814D190: .4byte 0x020205AC
_0814D194: .4byte 0x0000FFFE
_0814D198: .4byte 0x0805D3C9
_0814D19C: .4byte 0x03005AC0
_0814D1A0: .4byte 0x0814AFDD
	thumb_func_end LinkPartnerHandleDrawTrainerPic

	thumb_func_start LinkPartnerHandleTrainerSlide
LinkPartnerHandleTrainerSlide: @ 0x0814D1A4
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleTrainerSlide

	thumb_func_start LinkPartnerHandleTrainerSlideBack
LinkPartnerHandleTrainerSlideBack: @ 0x0814D1B0
	push {r4, r5, r6, lr}
	ldr r6, _0814D23C
	ldr r4, _0814D240
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0814D244
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
	ldr r1, _0814D248
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
	ldr r1, _0814D24C
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0814D250
	bl StoreSpriteCallbackInData6
	ldr r1, _0814D254
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814D258
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814D23C: .4byte 0x02023E88
_0814D240: .4byte 0x02023D08
_0814D244: .4byte 0x020205AC
_0814D248: .4byte 0x0000FFD8
_0814D24C: .4byte 0x080A67B5
_0814D250: .4byte 0x08007141
_0814D254: .4byte 0x03005AC0
_0814D258: .4byte 0x0814B015
	thumb_func_end LinkPartnerHandleTrainerSlideBack

	thumb_func_start LinkPartnerHandleFaintAnimation
LinkPartnerHandleFaintAnimation: @ 0x0814D25C
	push {r4, r5, r6, lr}
	ldr r6, _0814D2A8
	ldr r4, [r6]
	ldr r5, _0814D2AC
	ldrb r2, [r5]
	ldr r0, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _0814D2B0
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0814D290
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0814D290:
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
	b _0814D326
	.align 2, 0
_0814D2A8: .4byte 0x02024174
_0814D2AC: .4byte 0x02023D08
_0814D2B0:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0814D326
	strb r4, [r3, #4]
	ldr r2, _0814D32C
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r2, _0814D330
	adds r0, r0, r2
	bl HandleLowHpMusicChange
	movs r1, #0x40
	rsbs r1, r1, #0
	movs r0, #0x10
	bl PlaySE12WithPanning
	ldr r2, _0814D334
	ldr r3, _0814D338
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
	ldr r1, _0814D33C
	str r1, [r0]
	ldr r1, _0814D340
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814D344
	str r1, [r0]
_0814D326:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814D32C: .4byte 0x02023D12
_0814D330: .4byte 0x02024190
_0814D334: .4byte 0x020205AC
_0814D338: .4byte 0x02023E88
_0814D33C: .4byte 0x08039845
_0814D340: .4byte 0x03005AC0
_0814D344: .4byte 0x0814B401
	thumb_func_end LinkPartnerHandleFaintAnimation

	thumb_func_start LinkPartnerHandlePaletteFade
LinkPartnerHandlePaletteFade: @ 0x0814D348
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandlePaletteFade

	thumb_func_start LinkPartnerHandleSuccessBallThrowAnim
LinkPartnerHandleSuccessBallThrowAnim: @ 0x0814D354
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleSuccessBallThrowAnim

	thumb_func_start LinkPartnerHandleBallThrowAnim
LinkPartnerHandleBallThrowAnim: @ 0x0814D360
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleBallThrowAnim

	thumb_func_start LinkPartnerHandlePause
LinkPartnerHandlePause: @ 0x0814D36C
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandlePause

	thumb_func_start LinkPartnerHandleMoveAnimation
LinkPartnerHandleMoveAnimation: @ 0x0814D378
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0814D468
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814D38E
	b _0814D4B4
_0814D38E:
	ldr r0, _0814D46C
	mov ip, r0
	ldrb r1, [r5]
	lsls r1, r1, #9
	adds r0, #1
	adds r0, r1, r0
	ldrb r6, [r0]
	mov r0, ip
	adds r0, #2
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r6, r0
	ldr r0, _0814D470
	mov r8, r0
	mov r0, ip
	adds r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	ldr r3, _0814D474
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #4
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #5
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r3]
	ldr r3, _0814D478
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #6
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #7
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r2, r0
	mov r0, ip
	adds r0, #8
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x10
	orrs r2, r0
	mov r0, ip
	adds r0, #9
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r3]
	ldr r2, _0814D47C
	ldrb r0, [r5]
	lsls r0, r0, #9
	mov r1, ip
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r4, _0814D480
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #0xc
	adds r0, r1, r0
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #0xd
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r4]
	ldr r7, _0814D484
	ldrb r1, [r5]
	lsls r1, r1, #9
	mov r0, ip
	adds r0, #0x10
	adds r1, r1, r0
	str r1, [r7]
	ldr r2, _0814D488
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r1]
	str r1, [r0]
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, #0
	bl IsMoveWithoutAnimation
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _0814D48C
	bl LinkPartnerBufferExecCompleted
	b _0814D4B4
	.align 2, 0
_0814D468: .4byte 0x02023D08
_0814D46C: .4byte 0x02022D08
_0814D470: .4byte 0x020380D2
_0814D474: .4byte 0x020380A8
_0814D478: .4byte 0x020380A4
_0814D47C: .4byte 0x020380BA
_0814D480: .4byte 0x020380BC
_0814D484: .4byte 0x020380A0
_0814D488: .4byte 0x02024160
_0814D48C:
	ldr r0, _0814D4C0
	ldr r0, [r0]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #4]
	ldr r1, _0814D4C4
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814D4C8
	str r1, [r0]
	ldrh r1, [r4]
	ldr r2, [r7]
	adds r0, r6, #0
	bl BattleTv_SetDataBasedOnMove
_0814D4B4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814D4C0: .4byte 0x02024174
_0814D4C4: .4byte 0x03005AC0
_0814D4C8: .4byte 0x0814D4CD
	thumb_func_end LinkPartnerHandleMoveAnimation

	thumb_func_start LinkPartnerDoMoveAnimation
LinkPartnerDoMoveAnimation: @ 0x0814D4CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _0814D518
	ldr r6, _0814D51C
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
	ldr r7, _0814D520
	ldr r5, [r7]
	ldr r1, [r5, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _0814D564
	cmp r2, #1
	bgt _0814D524
	cmp r2, #0
	beq _0814D52E
	b _0814D640
	.align 2, 0
_0814D518: .4byte 0x02022D08
_0814D51C: .4byte 0x02023D08
_0814D520: .4byte 0x02024174
_0814D524:
	cmp r2, #2
	beq _0814D58E
	cmp r2, #3
	beq _0814D604
	b _0814D640
_0814D52E:
	ldr r1, [r5]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, #0xc
	ands r0, r2
	cmp r0, #4
	bne _0814D550
	movs r0, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0814D550:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _0814D640
_0814D564:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0814D640
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
	b _0814D640
_0814D58E:
	ldr r0, _0814D5F4
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0814D5F8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0814D640
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
	beq _0814D5DC
	mov r0, r8
	cmp r0, #1
	bhi _0814D5DC
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
_0814D5DC:
	ldr r0, _0814D5FC
	ldr r2, [r0]
	ldr r0, _0814D600
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #4]
	b _0814D640
	.align 2, 0
_0814D5F4: .4byte 0x02038098
_0814D5F8: .4byte 0x0203809D
_0814D5FC: .4byte 0x02024174
_0814D600: .4byte 0x02023D08
_0814D604:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0814D640
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
	bl LinkPartnerBufferExecCompleted
_0814D640:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerDoMoveAnimation

	thumb_func_start LinkPartnerHandlePrintString
LinkPartnerHandlePrintString: @ 0x0814D650
	push {r4, r5, lr}
	ldr r0, _0814D68C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0814D690
	strh r1, [r0]
	ldr r5, _0814D694
	ldrb r4, [r5]
	lsls r4, r4, #9
	ldr r0, _0814D698
	adds r4, r4, r0
	ldrh r0, [r4]
	bl BufferStringBattle
	ldr r0, _0814D69C
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0814D6A0
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814D6A4
	str r1, [r0]
	ldrh r0, [r4]
	bl BattleTv_SetDataBasedOnString
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814D68C: .4byte 0x02022AC8
_0814D690: .4byte 0x02022ACA
_0814D694: .4byte 0x02023D08
_0814D698: .4byte 0x02022D0A
_0814D69C: .4byte 0x02022AE0
_0814D6A0: .4byte 0x03005AC0
_0814D6A4: .4byte 0x0814B50D
	thumb_func_end LinkPartnerHandlePrintString

	thumb_func_start LinkPartnerHandlePrintSelectionString
LinkPartnerHandlePrintSelectionString: @ 0x0814D6A8
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandlePrintSelectionString

	thumb_func_start LinkPartnerHandleChooseAction
LinkPartnerHandleChooseAction: @ 0x0814D6B4
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleChooseAction

	thumb_func_start LinkPartnerHandleUnknownYesNoBox
LinkPartnerHandleUnknownYesNoBox: @ 0x0814D6C0
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleUnknownYesNoBox

	thumb_func_start LinkPartnerHandleChooseMove
LinkPartnerHandleChooseMove: @ 0x0814D6CC
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleChooseMove

	thumb_func_start LinkPartnerHandleChooseItem
LinkPartnerHandleChooseItem: @ 0x0814D6D8
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleChooseItem

	thumb_func_start LinkPartnerHandleChoosePokemon
LinkPartnerHandleChoosePokemon: @ 0x0814D6E4
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleChoosePokemon

	thumb_func_start LinkPartnerHandleCmd23
LinkPartnerHandleCmd23: @ 0x0814D6F0
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleCmd23

	thumb_func_start LinkPartnerHandleHealthBarUpdate
LinkPartnerHandleHealthBarUpdate: @ 0x0814D6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	bl LoadBattleBarGfx
	ldr r3, _0814D774
	ldr r0, _0814D778
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
	ldr r0, _0814D77C
	cmp r7, r0
	beq _0814D78C
	ldr r6, _0814D780
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _0814D784
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
	ldr r1, _0814D788
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _0814D7B6
	.align 2, 0
_0814D774: .4byte 0x02022D08
_0814D778: .4byte 0x02023D08
_0814D77C: .4byte 0x00007FFF
_0814D780: .4byte 0x02023D12
_0814D784: .4byte 0x02024190
_0814D788: .4byte 0x03005AD0
_0814D78C:
	ldr r1, _0814D7D4
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814D7D8
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _0814D7DC
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, #0
	bl SetBattleBarStruct
_0814D7B6:
	ldr r1, _0814D7E0
	ldr r0, _0814D7E4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814D7E8
	str r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814D7D4: .4byte 0x02023D12
_0814D7D8: .4byte 0x02024190
_0814D7DC: .4byte 0x03005AD0
_0814D7E0: .4byte 0x03005AC0
_0814D7E4: .4byte 0x02023D08
_0814D7E8: .4byte 0x0814B391
	thumb_func_end LinkPartnerHandleHealthBarUpdate

	thumb_func_start LinkPartnerHandleExpUpdate
LinkPartnerHandleExpUpdate: @ 0x0814D7EC
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleExpUpdate

	thumb_func_start sub_0814D7F8
sub_0814D7F8: @ 0x0814D7F8
	push {r4, lr}
	ldr r4, _0814D854
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814D84C
	ldr r0, _0814D858
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0814D85C
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _0814D860
	adds r1, r1, r2
	movs r2, #9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _0814D864
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
	ldr r1, _0814D868
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814D86C
	str r1, [r0]
_0814D84C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814D854: .4byte 0x02023D08
_0814D858: .4byte 0x03005AD0
_0814D85C: .4byte 0x02023D12
_0814D860: .4byte 0x02024190
_0814D864: .4byte 0x02024174
_0814D868: .4byte 0x03005AC0
_0814D86C: .4byte 0x0814B879
	thumb_func_end sub_0814D7F8

	thumb_func_start sub_0814D870
sub_0814D870: @ 0x0814D870
	push {r4, r5, lr}
	ldr r5, _0814D8C8
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814D8C0
	ldr r4, _0814D8CC
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
	ldr r1, _0814D8D0
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814D8D4
	str r1, [r0]
_0814D8C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814D8C8: .4byte 0x02023D08
_0814D8CC: .4byte 0x02022D08
_0814D8D0: .4byte 0x03005AC0
_0814D8D4: .4byte 0x0814B879
	thumb_func_end sub_0814D870

	thumb_func_start LinkPartnerHandleStatusXor
LinkPartnerHandleStatusXor: @ 0x0814D8D8
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleStatusXor

	thumb_func_start LinkPartnerHandleDataTransfer
LinkPartnerHandleDataTransfer: @ 0x0814D8E4
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleDataTransfer

	thumb_func_start LinkPartnerHandleDMA3Transfer
LinkPartnerHandleDMA3Transfer: @ 0x0814D8F0
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleDMA3Transfer

	thumb_func_start LinkPartnerHandlePlayBGM
LinkPartnerHandlePlayBGM: @ 0x0814D8FC
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandlePlayBGM

	thumb_func_start LinkPartnerHandleCmd32
LinkPartnerHandleCmd32: @ 0x0814D908
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleCmd32

	thumb_func_start LinkPartnerHandleTwoReturnValues
LinkPartnerHandleTwoReturnValues: @ 0x0814D914
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleTwoReturnValues

	thumb_func_start LinkPartnerHandleChosenMonReturnValue
LinkPartnerHandleChosenMonReturnValue: @ 0x0814D920
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleChosenMonReturnValue

	thumb_func_start LinkPartnerHandleOneReturnValue
LinkPartnerHandleOneReturnValue: @ 0x0814D92C
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleOneReturnValue

	thumb_func_start LinkPartnerHandleOneReturnValue_Duplicate
LinkPartnerHandleOneReturnValue_Duplicate: @ 0x0814D938
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleOneReturnValue_Duplicate

	thumb_func_start LinkPartnerHandleCmd37
LinkPartnerHandleCmd37: @ 0x0814D944
	push {lr}
	ldr r2, _0814D95C
	ldrb r1, [r2]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0814D95C: .4byte 0x020229C0
	thumb_func_end LinkPartnerHandleCmd37

	thumb_func_start LinkPartnerHandleCmd38
LinkPartnerHandleCmd38: @ 0x0814D960
	push {lr}
	ldr r3, _0814D98C
	ldr r1, _0814D990
	ldr r0, _0814D994
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
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0814D98C: .4byte 0x020229C0
_0814D990: .4byte 0x02022D08
_0814D994: .4byte 0x02023D08
	thumb_func_end LinkPartnerHandleCmd38

	thumb_func_start LinkPartnerHandleCmd39
LinkPartnerHandleCmd39: @ 0x0814D998
	push {lr}
	ldr r2, _0814D9AC
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0814D9AC: .4byte 0x020229C0
	thumb_func_end LinkPartnerHandleCmd39

	thumb_func_start LinkPartnerHandleCmd40
LinkPartnerHandleCmd40: @ 0x0814D9B0
	push {lr}
	ldr r3, _0814D9D4
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
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0814D9D4: .4byte 0x020229C0
	thumb_func_end LinkPartnerHandleCmd40

	thumb_func_start sub_0814D9D8
sub_0814D9D8: @ 0x0814D9D8
	push {r4, lr}
	ldr r3, _0814DA00
	ldr r2, _0814DA04
	ldr r4, _0814DA08
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
	bge _0814DA0C
	bl LinkPartnerBufferExecCompleted
	b _0814DA36
	.align 2, 0
_0814DA00: .4byte 0x020205AC
_0814DA04: .4byte 0x02023E88
_0814DA08: .4byte 0x02023D08
_0814DA0C:
	ldr r1, _0814DA3C
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
	ldr r1, _0814DA40
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814DA44
	str r1, [r0]
_0814DA36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814DA3C: .4byte 0x0202415D
_0814DA40: .4byte 0x03005AC0
_0814DA44: .4byte 0x0814B525
	thumb_func_end sub_0814D9D8

	thumb_func_start LinkPartnerHandleCmd42
LinkPartnerHandleCmd42: @ 0x0814DA48
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleCmd42

	thumb_func_start sub_0814DA54
sub_0814DA54: @ 0x0814DA54
	push {r4, lr}
	ldr r4, _0814DA90
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r3, #0x3f
	cmp r0, #0
	bne _0814DA68
	movs r3, #0xc0
_0814DA68:
	ldr r2, _0814DA94
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
	bl LinkPartnerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814DA90: .4byte 0x02023D08
_0814DA94: .4byte 0x02022D08
	thumb_func_end sub_0814DA54

	thumb_func_start LinkPartnerHandlePlayFanfareOrBGM
LinkPartnerHandlePlayFanfareOrBGM: @ 0x0814DA98
	push {r4, r5, lr}
	ldr r4, _0814DACC
	ldr r5, _0814DAD0
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0814DAD4
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
	b _0814DAE8
	.align 2, 0
_0814DACC: .4byte 0x02022D08
_0814DAD0: .4byte 0x02023D08
_0814DAD4:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_0814DAE8:
	bl LinkPartnerBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandlePlayFanfareOrBGM

	thumb_func_start LinkPartnerHandleFaintingCry
LinkPartnerHandleFaintingCry: @ 0x0814DAF4
	push {lr}
	ldr r1, _0814DB28
	ldr r0, _0814DB2C
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0814DB30
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	rsbs r1, r1, #0
	movs r2, #5
	bl PlayCry3
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0814DB28: .4byte 0x02023D12
_0814DB2C: .4byte 0x02023D08
_0814DB30: .4byte 0x02024190
	thumb_func_end LinkPartnerHandleFaintingCry

	thumb_func_start LinkPartnerHandleIntroSlide
LinkPartnerHandleIntroSlide: @ 0x0814DB34
	push {lr}
	ldr r1, _0814DB5C
	ldr r0, _0814DB60
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _0814DB64
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0814DB5C: .4byte 0x02022D08
_0814DB60: .4byte 0x02023D08
_0814DB64: .4byte 0x020240A0
	thumb_func_end LinkPartnerHandleIntroSlide

	thumb_func_start LinkPartnerHandleIntroTrainerBallThrow
LinkPartnerHandleIntroTrainerBallThrow: @ 0x0814DB68
	push {r4, r5, r6, r7, lr}
	ldr r5, _0814DC54
	ldr r6, _0814DC58
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0814DC5C
	adds r0, r0, r4
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x32
	strh r1, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0814DC60
	strh r1, [r0, #0x32]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0814DC64
	str r1, [r0]
	ldrb r2, [r6]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x38]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0814DC68
	bl StoreSpriteCallbackInData6
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, _0814DC6C
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r6]
	bl GetBattlerMultiplayerId
	ldr r4, _0814DC70
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r5, #0xff
	ldrb r0, [r1]
	cmp r0, #4
	beq _0814DC40
	ldrb r0, [r6]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #5
	bne _0814DC74
_0814DC40:
	ldrb r0, [r6]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r1, #0x13]
	adds r0, #2
	b _0814DCC6
	.align 2, 0
_0814DC54: .4byte 0x02023E88
_0814DC58: .4byte 0x02023D08
_0814DC5C: .4byte 0x020205AC
_0814DC60: .4byte 0x0000FFD8
_0814DC64: .4byte 0x080A67B5
_0814DC68: .4byte 0x0805C81D
_0814DC6C: .4byte 0x0000D6F9
_0814DC70: .4byte 0x020226A0
_0814DC74:
	ldrb r0, [r6]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #2
	beq _0814DCA2
	ldrb r0, [r6]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r1]
	ands r5, r0
	cmp r5, #1
	bne _0814DCB6
_0814DCA2:
	ldrb r0, [r6]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r1, #0x13]
	adds r0, #4
	b _0814DCC6
_0814DCB6:
	ldrb r0, [r6]
	bl GetBattlerMultiplayerId
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r1, #0x13]
_0814DCC6:
	ldr r1, _0814DD60
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r7, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r2, _0814DD64
	ldr r1, _0814DD68
	ldr r5, _0814DD6C
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
	ldr r0, _0814DD70
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0814DD74
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r5]
	strh r0, [r1, #8]
	ldr r3, _0814DD78
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
	beq _0814DD40
	ldr r0, _0814DD7C
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, _0814DD80
	str r1, [r0]
_0814DD40:
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r0, [r2, #9]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	ldr r1, _0814DD84
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814DD88
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814DD60: .4byte 0x082D961C
_0814DD64: .4byte 0x020205AC
_0814DD68: .4byte 0x02023E88
_0814DD6C: .4byte 0x02023D08
_0814DD70: .4byte 0x0814DD8D
_0814DD74: .4byte 0x03005B60
_0814DD78: .4byte 0x02024174
_0814DD7C: .4byte 0x02024158
_0814DD80: .4byte 0x0807352D
_0814DD84: .4byte 0x03005AC0
_0814DD88: .4byte 0x0814AF6D
	thumb_func_end LinkPartnerHandleIntroTrainerBallThrow

	thumb_func_start sub_0814DD8C
sub_0814DD8C: @ 0x0814DD8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _0814DDB4
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0x17
	bgt _0814DDB8
	adds r0, r2, #1
	strh r0, [r1, #0xa]
	b _0814DE74
	.align 2, 0
_0814DDB4: .4byte 0x03005B60
_0814DDB8:
	ldr r7, _0814DDF8
	ldrb r0, [r7]
	mov sb, r0
	ldrh r0, [r1, #8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814DDD8
	ldr r0, _0814DDFC
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0814DE08
_0814DDD8:
	ldr r0, _0814DE00
	ldrb r1, [r7]
	lsls r2, r1, #9
	adds r0, #1
	adds r2, r2, r0
	ldr r0, _0814DE04
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0814CD58
	b _0814DE5C
	.align 2, 0
_0814DDF8: .4byte 0x02023D08
_0814DDFC: .4byte 0x02022C90
_0814DE00: .4byte 0x02022D08
_0814DE04: .4byte 0x02023D12
_0814DE08:
	ldr r4, _0814DE80
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r4, #1
	adds r1, r1, r4
	ldr r5, _0814DE84
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0814CD58
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
	ldr r2, _0814DE88
	adds r0, r0, r2
	bl BattleLoadPlayerMonSpriteGfx
	ldrb r0, [r7]
	movs r1, #0
	bl sub_0814CD58
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_0814DE5C:
	ldr r1, _0814DE8C
	ldr r2, _0814DE90
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814DE94
	str r1, [r0]
	mov r3, sb
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_0814DE74:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814DE80: .4byte 0x02022D08
_0814DE84: .4byte 0x02023D12
_0814DE88: .4byte 0x02024190
_0814DE8C: .4byte 0x03005AC0
_0814DE90: .4byte 0x02023D08
_0814DE94: .4byte 0x0814B1A9
	thumb_func_end sub_0814DD8C

	thumb_func_start LinkPartnerHandleDrawPartyStatusSummary
LinkPartnerHandleDrawPartyStatusSummary: @ 0x0814DE98
	push {r4, r5, r6, lr}
	ldr r1, _0814DEC0
	ldr r0, _0814DEC4
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0814DEC8
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814DEC8
	bl LinkPartnerBufferExecCompleted
	b _0814DF3C
	.align 2, 0
_0814DEC0: .4byte 0x02022D08
_0814DEC4: .4byte 0x02023D08
_0814DEC8:
	ldr r6, _0814DF44
	ldr r0, [r6]
	ldr r5, _0814DF48
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
	ldr r4, _0814DF4C
	adds r1, r3, r4
	subs r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, #2
	adds r3, r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _0814DF50
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
	beq _0814DF30
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x5d
	strb r1, [r0, #5]
_0814DF30:
	ldr r0, _0814DF54
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0814DF58
	str r0, [r1]
_0814DF3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814DF44: .4byte 0x02024174
_0814DF48: .4byte 0x02023D08
_0814DF4C: .4byte 0x02022D0C
_0814DF50: .4byte 0x02024158
_0814DF54: .4byte 0x03005AC0
_0814DF58: .4byte 0x0814DF5D
	thumb_func_end LinkPartnerHandleDrawPartyStatusSummary

	thumb_func_start sub_0814DF5C
sub_0814DF5C: @ 0x0814DF5C
	push {r4, lr}
	ldr r4, _0814DF9C
	ldr r0, [r4]
	ldr r3, _0814DFA0
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
	bls _0814DF94
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #5]
	bl LinkPartnerBufferExecCompleted
_0814DF94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814DF9C: .4byte 0x02024174
_0814DFA0: .4byte 0x02023D08
	thumb_func_end sub_0814DF5C

	thumb_func_start LinkPartnerHandleHidePartyStatusSummary
LinkPartnerHandleHidePartyStatusSummary: @ 0x0814DFA4
	push {lr}
	ldr r0, _0814DFE0
	ldr r1, [r0]
	ldr r0, _0814DFE4
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
	beq _0814DFD6
	ldr r2, _0814DFE8
	ldr r0, _0814DFEC
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _0814DFF0
	str r1, [r0]
_0814DFD6:
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0814DFE0: .4byte 0x02024174
_0814DFE4: .4byte 0x02023D08
_0814DFE8: .4byte 0x03005B60
_0814DFEC: .4byte 0x02024158
_0814DFF0: .4byte 0x0807352D
	thumb_func_end LinkPartnerHandleHidePartyStatusSummary

	thumb_func_start LinkPartnerHandleEndBounceEffect
LinkPartnerHandleEndBounceEffect: @ 0x0814DFF4
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleEndBounceEffect

	thumb_func_start LinkPartnerHandleSpriteInvisibility
LinkPartnerHandleSpriteInvisibility: @ 0x0814E000
	push {r4, lr}
	ldr r4, _0814E050
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814E046
	ldr r3, _0814E054
	ldr r0, _0814E058
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _0814E05C
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
_0814E046:
	bl LinkPartnerBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814E050: .4byte 0x02023D08
_0814E054: .4byte 0x020205AC
_0814E058: .4byte 0x02023E88
_0814E05C: .4byte 0x02022D08
	thumb_func_end LinkPartnerHandleSpriteInvisibility

	thumb_func_start LinkPartnerHandleBattleAnimation
LinkPartnerHandleBattleAnimation: @ 0x0814E060
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _0814E0A8
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814E0C2
	ldr r4, _0814E0AC
	ldrb r2, [r5]
	lsls r1, r2, #9
	adds r0, r4, #1
	adds r0, r1, r0
	ldrb r6, [r0]
	adds r0, r4, #2
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r4, #3
	adds r1, r1, r4
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r3, r0
	str r3, [sp]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r3, r6, #0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814E0B0
	bl LinkPartnerBufferExecCompleted
	b _0814E0BC
	.align 2, 0
_0814E0A8: .4byte 0x02023D08
_0814E0AC: .4byte 0x02022D08
_0814E0B0:
	ldr r0, _0814E0CC
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0814E0D0
	str r0, [r1]
_0814E0BC:
	adds r0, r6, #0
	bl BattleTv_SetDataBasedOnAnimation
_0814E0C2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814E0CC: .4byte 0x03005AC0
_0814E0D0: .4byte 0x0814B8A9
	thumb_func_end LinkPartnerHandleBattleAnimation

	thumb_func_start LinkPartnerHandleLinkStandbyMsg
LinkPartnerHandleLinkStandbyMsg: @ 0x0814E0D4
	push {lr}
	ldr r0, _0814E0EC
	ldrb r0, [r0]
	lsls r0, r0, #9
	ldr r1, _0814E0F0
	adds r0, r0, r1
	bl sub_08185008
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0814E0EC: .4byte 0x02023D08
_0814E0F0: .4byte 0x02022D0A
	thumb_func_end LinkPartnerHandleLinkStandbyMsg

	thumb_func_start LinkPartnerHandleResetActionMoveSelection
LinkPartnerHandleResetActionMoveSelection: @ 0x0814E0F4
	push {lr}
	bl LinkPartnerBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkPartnerHandleResetActionMoveSelection

	thumb_func_start LinkPartnerHandleCmd55
LinkPartnerHandleCmd55: @ 0x0814E100
	push {r4, r5, lr}
	ldr r5, _0814E164
	ldrb r0, [r5]
	lsls r0, r0, #9
	ldr r4, _0814E168
	adds r0, r0, r4
	bl sub_08185008
	ldr r2, _0814E16C
	ldrb r0, [r5]
	lsls r0, r0, #9
	subs r1, r4, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _0814E170
	ldr r3, [r0]
	ldrb r0, [r5]
	lsls r0, r0, #9
	subs r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0814E174
	adds r3, r3, r1
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #5
	bl FadeOutMapMusic
	movs r0, #3
	bl BeginFastPaletteFade
	bl LinkPartnerBufferExecCompleted
	ldr r1, _0814E178
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0814E17C
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814E164: .4byte 0x02023D08
_0814E168: .4byte 0x02022D0C
_0814E16C: .4byte 0x02023FDE
_0814E170: .4byte 0x03005AF0
_0814E174: .4byte 0x00000CA9
_0814E178: .4byte 0x03005AC0
_0814E17C: .4byte 0x080583C1
	thumb_func_end LinkPartnerHandleCmd55

	thumb_func_start LinkPartnerCmdEnd
LinkPartnerCmdEnd: @ 0x0814E180
	bx lr
	.align 2, 0
	thumb_func_end LinkPartnerCmdEnd

