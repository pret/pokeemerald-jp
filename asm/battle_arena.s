.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CallBattleArenaFunction
CallBattleArenaFunction: @ 0x081A4E28
	push {lr}
	ldr r1, _081A4E40
	ldr r0, _081A4E44
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end CallBattleArenaFunction

	thumb_func_start sub_081A4E3C
sub_081A4E3C: @ 0x081A4E3C
	bx r0
	.align 2, 0
_081A4E40: .4byte 0x085DD7BC
_081A4E44: .4byte 0x02037280
	thumb_func_end sub_081A4E3C

	thumb_func_start BattleArena_ShowJudgmentWindow
BattleArena_ShowJudgmentWindow: @ 0x081A4E48
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r6, #0
	ldrb r0, [r5]
	cmp r0, #0xa
	bls _081A4E58
	b _081A5134
_081A4E58:
	lsls r0, r0, #2
	ldr r1, _081A4E64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A4E64: .4byte 0x081A4E68
_081A4E68: @ jump table
	.4byte _081A4E94 @ case 0
	.4byte _081A4EE4 @ case 1
	.4byte _081A4F0C @ case 2
	.4byte _081A4FA4 @ case 3
	.4byte _081A4FFC @ case 4
	.4byte _081A501C @ case 5
	.4byte _081A503C @ case 6
	.4byte _081A5080 @ case 7
	.4byte _081A512E @ case 8
	.4byte _081A50C4 @ case 9
	.4byte _081A5110 @ case 10
_081A4E94:
	ldr r0, _081A4ECC
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r2, #0
	movs r3, #8
	bl BeginNormalPaletteFade
	ldr r1, _081A4ED0
	movs r0, #0x48
	bl SetGpuReg
	ldr r0, _081A4ED4
	bl LoadCompressedSpriteSheet
	ldr r0, _081A4ED8
	movs r1, #0xf8
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r1, _081A4EDC
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, _081A4EE0
	movs r0, #0x70
	strh r0, [r1]
	b _081A512E
	.align 2, 0
_081A4ECC: .4byte 0x7FFFFF1C
_081A4ED0: .4byte 0x00003F3E
_081A4ED4: .4byte 0x085DD7AC
_081A4ED8: .4byte 0x08D855CC
_081A4EDC: .4byte 0x02022AD8
_081A4EE0: .4byte 0x02022ADA
_081A4EE4:
	ldr r0, _081A4F08
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081A4EF6
	b _081A5134
_081A4EF6:
	str r0, [sp]
	movs r0, #6
	movs r1, #0
	movs r2, #0x17
	movs r3, #0xd
	bl HandleBattleWindow
	b _081A512E
	.align 2, 0
_081A4F08: .4byte 0x02037C74
_081A4F0C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A4F18
	b _081A5134
_081A4F18:
	ldr r1, _081A4F7C
	movs r2, #0xa1
	strb r2, [r1]
	movs r0, #0xff
	strb r0, [r1, #1]
	ldr r1, _081A4F80
	strb r2, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1, #1]
	ldr r0, _081A4F84
	bl TryGetStatusString
	ldr r4, _081A4F88
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_0814FA04
	ldr r0, _081A4F8C
	movs r1, #0x10
	bl sub_0814FA04
	ldr r0, _081A4F90
	bl TryGetStatusString
	adds r0, r4, #0
	movs r1, #0x11
	bl sub_0814FA04
	ldr r0, _081A4F94
	movs r1, #0x12
	bl sub_0814FA04
	ldr r0, _081A4F98
	movs r1, #0x13
	bl sub_0814FA04
	ldr r0, _081A4F9C
	movs r1, #0x14
	bl sub_0814FA04
	ldr r0, _081A4FA0
	bl TryGetStatusString
	adds r0, r4, #0
	movs r1, #0x15
	bl sub_0814FA04
	b _081A512E
	.align 2, 0
_081A4F7C: .4byte 0x02022C0C
_081A4F80: .4byte 0x02022C1C
_081A4F84: .4byte 0x085ABD9A
_081A4F88: .4byte 0x02022AE0
_081A4F8C: .4byte 0x085ABD9D
_081A4F90: .4byte 0x085ABDA0
_081A4F94: .4byte 0x085ABDA3
_081A4F98: .4byte 0x085ABDA7
_081A4F9C: .4byte 0x085ABDAA
_081A4FA0: .4byte 0x085ABDAE
_081A4FA4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A4FB0
	b _081A5134
_081A4FB0:
	ldr r1, _081A4FF0
	movs r0, #0x48
	bl SetGpuReg
	movs r6, #0x80
	lsls r6, r6, #0xf
	movs r4, #7
_081A4FBE:
	asrs r1, r6, #0x10
	ldr r0, _081A4FF4
	movs r2, #0x54
	movs r3, #0
	bl CreateSprite
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081A4FF8
	adds r0, r0, r1
	movs r1, #3
	bl StartSpriteAnim
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r6, r6, r0
	subs r4, #1
	cmp r4, #0
	bge _081A4FBE
	b _081A512C
	.align 2, 0
_081A4FF0: .4byte 0x00003F3F
_081A4FF4: .4byte 0x085DD794
_081A4FF8: .4byte 0x020205AC
_081A4FFC:
	ldr r0, _081A5018
	bl PlaySE
	movs r0, #0x50
	movs r1, #0x28
	movs r2, #0
	movs r3, #0
	bl ShowJudgmentSprite
	movs r0, #0xa0
	movs r1, #0x28
	movs r2, #0
	b _081A5054
	.align 2, 0
_081A5018: .4byte 0x00000109
_081A501C:
	ldr r0, _081A5038
	bl PlaySE
	movs r0, #0x50
	movs r1, #0x38
	movs r2, #1
	movs r3, #0
	bl ShowJudgmentSprite
	movs r0, #0xa0
	movs r1, #0x38
	movs r2, #1
	b _081A5054
	.align 2, 0
_081A5038: .4byte 0x00000109
_081A503C:
	ldr r0, _081A5074
	bl PlaySE
	movs r0, #0x50
	movs r1, #0x48
	movs r2, #2
	movs r3, #0
	bl ShowJudgmentSprite
	movs r0, #0xa0
	movs r1, #0x48
	movs r2, #2
_081A5054:
	movs r3, #1
	bl ShowJudgmentSprite
	ldr r0, _081A5078
	bl TryGetStatusString
	ldr r0, _081A507C
	movs r1, #0x15
	bl sub_0814FA04
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r6, #1
	b _081A5134
	.align 2, 0
_081A5074: .4byte 0x00000109
_081A5078: .4byte 0x085ABDAE
_081A507C: .4byte 0x02022AE0
_081A5080:
	movs r0, #0x85
	lsls r0, r0, #1
	bl PlaySE
	ldr r0, _081A50A0
	ldr r1, _081A50A4
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	bls _081A50AC
	movs r6, #2
	ldr r1, _081A50A8
	movs r0, #0
	strb r0, [r1, #0x17]
	b _081A512E
	.align 2, 0
_081A50A0: .4byte 0x02022C0C
_081A50A4: .4byte 0x02022C1C
_081A50A8: .4byte 0x02024118
_081A50AC:
	cmp r2, r0
	bhs _081A50C0
	movs r6, #3
	ldr r1, _081A50BC
	movs r0, #1
	strb r0, [r1, #0x17]
	b _081A512E
	.align 2, 0
_081A50BC: .4byte 0x02024118
_081A50C0:
	movs r6, #4
	b _081A512E
_081A50C4:
	ldr r1, _081A5100
	movs r0, #0x48
	bl SetGpuReg
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	movs r1, #0
	movs r2, #0x17
	movs r3, #0xd
	bl HandleBattleWindow
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _081A5104
	ldr r1, _081A5108
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	ldr r0, _081A510C
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r2, #8
	movs r3, #0
	bl BeginNormalPaletteFade
	b _081A512E
	.align 2, 0
_081A5100: .4byte 0x00003F3E
_081A5104: .4byte 0x030074D0
_081A5108: .4byte 0x0000FFFF
_081A510C: .4byte 0x7FFFFF1C
_081A5110:
	ldr r0, _081A5140
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081A5134
	ldr r1, _081A5144
	movs r0, #0x48
	bl SetGpuReg
	movs r0, #0xfa
	lsls r0, r0, #2
	bl FreeSpriteTilesByTag
_081A512C:
	movs r6, #1
_081A512E:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_081A5134:
	adds r0, r6, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081A5140: .4byte 0x02037C74
_081A5144: .4byte 0x00003F3F
	thumb_func_end BattleArena_ShowJudgmentWindow

	thumb_func_start ShowJudgmentSprite
ShowJudgmentSprite: @ 0x081A5148
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r6, #0
	movs r1, #0
	ldr r0, _081A5190
	ldr r0, [r0]
	movs r3, #0xa6
	lsls r3, r3, #2
	adds r4, r0, r3
	ldr r5, _081A5194
	adds r3, r0, r5
	adds r5, #2
	adds r5, r5, r0
	mov r8, r5
	cmp r2, #1
	beq _081A51B4
	cmp r2, #1
	bgt _081A5198
	cmp r2, #0
	beq _081A51A0
	b _081A5202
	.align 2, 0
_081A5190: .4byte 0x02024140
_081A5194: .4byte 0x0000029A
_081A5198:
	mov r0, sb
	cmp r0, #2
	beq _081A51C8
	b _081A5202
_081A51A0:
	adds r0, r4, r7
	movs r6, #0
	ldrsb r6, [r0, r6]
	movs r1, #1
	adds r0, r7, #0
	eors r0, r1
	adds r0, r4, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	b _081A5202
_081A51B4:
	adds r0, r3, r7
	movs r6, #0
	ldrsb r6, [r0, r6]
	movs r1, #1
	adds r0, r7, #0
	eors r0, r1
	adds r0, r3, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	b _081A5202
_081A51C8:
	ldr r3, _081A5210
	mov sb, r3
	movs r5, #0x58
	adds r0, r7, #0
	muls r0, r5, r0
	add r0, sb
	ldrh r0, [r0, #0x28]
	movs r4, #0x64
	muls r0, r4, r0
	lsls r1, r7, #1
	add r1, r8
	ldrh r1, [r1]
	bl __divsi3
	adds r6, r0, #0
	movs r0, #1
	adds r1, r7, #0
	eors r1, r0
	adds r0, r1, #0
	muls r0, r5, r0
	add r0, sb
	ldrh r0, [r0, #0x28]
	muls r0, r4, r0
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	bl __divsi3
	adds r1, r0, #0
_081A5202:
	cmp r6, r1
	ble _081A5228
	movs r4, #2
	cmp r7, #0
	beq _081A5218
	ldr r1, _081A5214
	b _081A521A
	.align 2, 0
_081A5210: .4byte 0x02023D28
_081A5214: .4byte 0x02022C1C
_081A5218:
	ldr r1, _081A5224
_081A521A:
	ldrb r0, [r1]
	adds r0, #2
	strb r0, [r1]
	b _081A524E
	.align 2, 0
_081A5224: .4byte 0x02022C0C
_081A5228:
	cmp r6, r1
	bne _081A524C
	movs r4, #1
	cmp r7, #0
	beq _081A523C
	ldr r1, _081A5238
	b _081A523E
	.align 2, 0
_081A5238: .4byte 0x02022C1C
_081A523C:
	ldr r1, _081A5248
_081A523E:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081A524E
	.align 2, 0
_081A5248: .4byte 0x02022C0C
_081A524C:
	movs r4, #0
_081A524E:
	ldr r0, _081A5280
	ldr r1, [sp]
	mov r2, sl
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	ldr r1, _081A5284
	adds r0, r0, r1
	adds r1, r4, #0
	bl StartSpriteAnim
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A5280: .4byte 0x085DD794
_081A5284: .4byte 0x020205AC
	thumb_func_end ShowJudgmentSprite

	thumb_func_start SpriteCb_JudgmentIcon
SpriteCb_JudgmentIcon: @ 0x081A5288
	push {lr}
	adds r1, r0, #0
	ldr r0, _081A52A0
	ldrb r0, [r0]
	cmp r0, #8
	bls _081A529A
	adds r0, r1, #0
	bl DestroySprite
_081A529A:
	pop {r0}
	bx r0
	.align 2, 0
_081A52A0: .4byte 0x02023FD6
	thumb_func_end SpriteCb_JudgmentIcon

	thumb_func_start BattleArena_InitPoints
BattleArena_InitPoints: @ 0x081A52A4
	ldr r0, _081A52D0
	ldr r2, [r0]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	adds r0, #2
	adds r3, r2, r0
	adds r0, #2
	adds r2, r2, r0
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r3]
	strb r0, [r3, #1]
	ldr r0, _081A52D4
	ldrh r1, [r0, #0x28]
	strh r1, [r2]
	adds r0, #0x80
	ldrh r0, [r0]
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_081A52D0: .4byte 0x02024140
_081A52D4: .4byte 0x02023D28
	thumb_func_end BattleArena_InitPoints

	thumb_func_start BattleArena_AddMindPoints
BattleArena_AddMindPoints: @ 0x081A52D8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081A52FC
	ldr r1, [r1]
	movs r2, #0xa6
	lsls r2, r2, #2
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r2, _081A5300
	ldr r0, _081A5304
	ldrh r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_081A52FC: .4byte 0x02024140
_081A5300: .4byte 0x085DD5F8
_081A5304: .4byte 0x02023E8E
	thumb_func_end BattleArena_AddMindPoints

	thumb_func_start BattleArena_AddSkillPoints
BattleArena_AddSkillPoints: @ 0x081A5308
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r6, r3, #0
	ldr r0, _081A5348
	ldr r2, [r0]
	ldr r0, _081A534C
	adds r5, r2, r0
	ldr r0, _081A5350
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _081A53CA
	ldr r0, _081A5354
	adds r4, r2, r0
	ldrb r2, [r4]
	ldr r0, _081A5358
	lsls r1, r3, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _081A535C
	bics r2, r1
	strb r2, [r4]
	adds r1, r5, r3
	ldrb r0, [r1]
	subs r0, #2
	b _081A53C8
	.align 2, 0
_081A5348: .4byte 0x02024140
_081A534C: .4byte 0x0000029A
_081A5350: .4byte 0x02023F24
_081A5354: .4byte 0x000002A2
_081A5358: .4byte 0x082FACB4
_081A535C:
	ldr r0, _081A5380
	ldrb r1, [r0]
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	beq _081A5388
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081A5378
	ldr r0, _081A5384
	ldrb r0, [r0, #6]
	cmp r0, #1
	beq _081A53CA
_081A5378:
	adds r1, r5, r3
	ldrb r0, [r1]
	subs r0, #2
	b _081A53C8
	.align 2, 0
_081A5380: .4byte 0x02023F20
_081A5384: .4byte 0x02023FD6
_081A5388:
	movs r0, #6
	ands r0, r1
	cmp r0, #6
	bne _081A5394
	adds r1, r5, r3
	b _081A53C4
_081A5394:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081A53A4
	adds r1, r5, r3
	ldrb r0, [r1]
	adds r0, #2
	b _081A53C8
_081A53A4:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081A53B4
	adds r1, r5, r3
	ldrb r0, [r1]
	subs r0, #1
	b _081A53C8
_081A53B4:
	ldr r0, _081A53D0
	lsls r1, r6, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _081A53CA
	adds r1, r5, r6
_081A53C4:
	ldrb r0, [r1]
	adds r0, #1
_081A53C8:
	strb r0, [r1]
_081A53CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A53D0: .4byte 0x02023FE0
	thumb_func_end BattleArena_AddSkillPoints

	thumb_func_start BattleArena_DeductMindPoints
BattleArena_DeductMindPoints: @ 0x081A53D4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r1, #0
	ldr r0, _081A5404
	ldr r0, [r0]
	ldr r5, _081A5408
	adds r3, r0, r5
	movs r0, #0x99
	lsls r0, r0, #1
	cmp r1, r0
	bgt _081A541A
	subs r0, #1
	cmp r1, r0
	bge _081A544C
	cmp r1, #0xc5
	bgt _081A540C
	cmp r1, #0xc3
	bge _081A544C
	cmp r1, #0x77
	beq _081A544C
	b _081A5454
	.align 2, 0
_081A5404: .4byte 0x02024140
_081A5408: .4byte 0x0000029A
_081A540C:
	cmp r1, #0xc7
	blt _081A5454
	cmp r1, #0xcc
	ble _081A544C
	cmp r1, #0xce
	beq _081A544C
	b _081A5454
_081A541A:
	ldr r0, _081A5434
	cmp r1, r0
	beq _081A544C
	cmp r1, r0
	bgt _081A5438
	subs r0, #0x12
	cmp r1, r0
	beq _081A544C
	adds r0, #2
	cmp r1, r0
	beq _081A544C
	b _081A5454
	.align 2, 0
_081A5434: .4byte 0x00000147
_081A5438:
	movs r0, #0xad
	lsls r0, r0, #1
	cmp r2, r0
	blt _081A5454
	adds r0, #1
	cmp r2, r0
	ble _081A544C
	adds r0, #3
	cmp r2, r0
	bne _081A5454
_081A544C:
	adds r1, r3, r4
	ldrb r0, [r1]
	subs r0, #3
	strb r0, [r1]
_081A5454:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleArena_DeductMindPoints

	thumb_func_start sub_081A545C
sub_081A545C: @ 0x081A545C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081A549C
	ldr r3, [r1]
	movs r1, #0xa7
	lsls r1, r1, #2
	adds r3, r3, r1
	lsls r2, r0, #1
	adds r2, r2, r3
	ldr r5, _081A54A0
	movs r4, #0x58
	adds r1, r0, #0
	muls r1, r4, r1
	adds r1, r1, r5
	ldrh r1, [r1, #0x28]
	strh r1, [r2]
	movs r1, #1
	eors r0, r1
	lsls r1, r0, #1
	adds r1, r1, r3
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r2, [r0, #0x28]
	ldrh r0, [r1]
	cmp r0, r2
	bls _081A5494
	strh r2, [r1]
_081A5494:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A549C: .4byte 0x02024140
_081A54A0: .4byte 0x02023D28
	thumb_func_end sub_081A545C

	thumb_func_start InitArenaChallenge
InitArenaChallenge: @ 0x081A54A4
	push {r4, r5, r6, lr}
	ldr r4, _081A54F0
	ldr r1, [r4]
	ldr r3, _081A54F4
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1e
	ldr r0, _081A54F8
	adds r1, r1, r0
	movs r2, #0
	strb r2, [r1]
	ldr r1, [r4]
	ldr r6, _081A54FC
	adds r0, r1, r6
	strh r2, [r0]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	cmp r5, #0
	beq _081A5504
	ldr r0, [r4]
	ldr r1, _081A5500
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x80
	b _081A550E
	.align 2, 0
_081A54F0: .4byte 0x03005AF0
_081A54F4: .4byte 0x00000CA9
_081A54F8: .4byte 0x00000CA8
_081A54FC: .4byte 0x00000CB2
_081A5500: .4byte 0x00000CDC
_081A5504:
	ldr r0, [r4]
	ldr r3, _081A5544
	adds r0, r0, r3
	ldr r2, [r0]
	movs r0, #0x40
_081A550E:
	ands r2, r0
	cmp r2, #0
	bne _081A5520
	ldr r0, [r4]
	lsls r1, r5, #1
	ldr r6, _081A5548
	adds r0, r0, r6
	adds r0, r0, r1
	strh r2, [r0]
_081A5520:
	ldr r0, _081A554C
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	ldr r1, _081A5550
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A5544: .4byte 0x00000CDC
_081A5548: .4byte 0x00000DDA
_081A554C: .4byte 0x03005AEC
_081A5550: .4byte 0x0203886A
	thumb_func_end InitArenaChallenge

	thumb_func_start GetArenaData
GetArenaData: @ 0x081A5554
	push {r4, lr}
	ldr r0, _081A5578
	ldr r3, [r0]
	ldr r1, _081A557C
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r1, r0, #0x1e
	ldr r0, _081A5580
	ldrh r0, [r0]
	cmp r0, #1
	beq _081A55A0
	cmp r0, #1
	bgt _081A5584
	cmp r0, #0
	beq _081A558A
	b _081A55DE
	.align 2, 0
_081A5578: .4byte 0x03005AF0
_081A557C: .4byte 0x00000CA9
_081A5580: .4byte 0x02037282
_081A5584:
	cmp r0, #2
	beq _081A55B8
	b _081A55DE
_081A558A:
	ldr r0, _081A5598
	ldr r2, _081A559C
	adds r1, r3, r2
	ldrh r1, [r1]
	strh r1, [r0]
	b _081A55DE
	.align 2, 0
_081A5598: .4byte 0x02037290
_081A559C: .4byte 0x00000DD8
_081A55A0:
	ldr r2, _081A55B0
	lsls r1, r1, #1
	ldr r4, _081A55B4
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	b _081A55DC
	.align 2, 0
_081A55B0: .4byte 0x02037290
_081A55B4: .4byte 0x00000DDA
_081A55B8:
	cmp r1, #0
	beq _081A55D0
	ldr r2, _081A55C8
	ldr r1, _081A55CC
	adds r0, r3, r1
	ldr r0, [r0]
	movs r1, #0x80
	b _081A55DA
	.align 2, 0
_081A55C8: .4byte 0x02037290
_081A55CC: .4byte 0x00000CDC
_081A55D0:
	ldr r2, _081A55E4
	ldr r4, _081A55E8
	adds r0, r3, r4
	ldr r0, [r0]
	movs r1, #0x40
_081A55DA:
	ands r0, r1
_081A55DC:
	strh r0, [r2]
_081A55DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A55E4: .4byte 0x02037290
_081A55E8: .4byte 0x00000CDC
	thumb_func_end GetArenaData

	thumb_func_start SetArenaData
SetArenaData: @ 0x081A55EC
	push {lr}
	ldr r0, _081A5610
	ldr r2, [r0]
	ldr r1, _081A5614
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r1, r0, #0x1e
	ldr r0, _081A5618
	ldrh r0, [r0]
	cmp r0, #1
	beq _081A5638
	cmp r0, #1
	bgt _081A561C
	cmp r0, #0
	beq _081A5622
	b _081A56AA
	.align 2, 0
_081A5610: .4byte 0x03005AF0
_081A5614: .4byte 0x00000CA9
_081A5618: .4byte 0x02037282
_081A561C:
	cmp r0, #2
	beq _081A5650
	b _081A56AA
_081A5622:
	ldr r0, _081A5630
	ldrh r1, [r0]
	ldr r3, _081A5634
	adds r0, r2, r3
	strh r1, [r0]
	b _081A56AA
	.align 2, 0
_081A5630: .4byte 0x02037284
_081A5634: .4byte 0x00000DD8
_081A5638:
	lsls r1, r1, #1
	ldr r3, _081A5648
	adds r0, r2, r3
	adds r0, r0, r1
	ldr r1, _081A564C
	ldrh r1, [r1]
	strh r1, [r0]
	b _081A56AA
	.align 2, 0
_081A5648: .4byte 0x00000DDA
_081A564C: .4byte 0x02037284
_081A5650:
	cmp r1, #0
	beq _081A5680
	ldr r0, _081A5668
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A5670
	ldr r1, _081A566C
	adds r0, r2, r1
	ldr r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	b _081A56A8
	.align 2, 0
_081A5668: .4byte 0x02037284
_081A566C: .4byte 0x00000CDC
_081A5670:
	ldr r3, _081A567C
	adds r0, r2, r3
	ldr r1, [r0]
	movs r2, #0x81
	rsbs r2, r2, #0
	b _081A56A6
	.align 2, 0
_081A567C: .4byte 0x00000CDC
_081A5680:
	ldr r0, _081A5694
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A569C
	ldr r1, _081A5698
	adds r0, r2, r1
	ldr r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	b _081A56A8
	.align 2, 0
_081A5694: .4byte 0x02037284
_081A5698: .4byte 0x00000CDC
_081A569C:
	ldr r3, _081A56B0
	adds r0, r2, r3
	ldr r1, [r0]
	movs r2, #0x41
	rsbs r2, r2, #0
_081A56A6:
	ands r1, r2
_081A56A8:
	str r1, [r0]
_081A56AA:
	pop {r0}
	bx r0
	.align 2, 0
_081A56B0: .4byte 0x00000CDC
	thumb_func_end SetArenaData

	thumb_func_start sub_081A56B4
sub_081A56B4: @ 0x081A56B4
	push {r4, lr}
	ldr r4, _081A56E8
	ldr r0, [r4]
	ldr r1, _081A56EC
	ldrh r1, [r1]
	ldr r2, _081A56F0
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0
	bl VarSet
	ldr r1, [r4]
	ldr r0, _081A56F4
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
_081A56E8: .4byte 0x03005AF0
_081A56EC: .4byte 0x02037282
_081A56F0: .4byte 0x00000CA8
_081A56F4: .4byte 0x00000CA9
	thumb_func_end sub_081A56B4

	thumb_func_start SetArenaRewardItem
SetArenaRewardItem: @ 0x081A56F8
	push {r4, r5, lr}
	ldr r4, _081A5734
	ldr r1, [r4]
	ldr r2, _081A5738
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	ldr r2, _081A573C
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x29
	bls _081A5748
	bl Random
	ldr r4, [r4]
	ldr r5, _081A5740
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #9
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r1, _081A5744
	adds r4, r4, r1
	b _081A5766
	.align 2, 0
_081A5734: .4byte 0x03005AF0
_081A5738: .4byte 0x00000CA9
_081A573C: .4byte 0x00000DDA
_081A5740: .4byte 0x085DD7E4
_081A5744: .4byte 0x00000DD8
_081A5748:
	bl Random
	ldr r4, [r4]
	ldr r5, _081A5770
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r2, _081A5774
	adds r4, r4, r2
_081A5766:
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A5770: .4byte 0x085DD7D8
_081A5774: .4byte 0x00000DD8
	thumb_func_end SetArenaRewardItem

	thumb_func_start GiveArenaRewardItem
GiveArenaRewardItem: @ 0x081A5778
	push {r4, r5, lr}
	ldr r4, _081A57B0
	ldr r0, [r4]
	ldr r1, _081A57B4
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _081A57C0
	ldr r0, [r4]
	ldr r1, _081A57B4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _081A57B8
	bl CopyItemName
	ldr r0, [r4]
	ldr r1, _081A57B4
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081A57BC
	strh r5, [r0]
	b _081A57C6
	.align 2, 0
_081A57B0: .4byte 0x03005AF0
_081A57B4: .4byte 0x00000DD8
_081A57B8: .4byte 0x02021C40
_081A57BC: .4byte 0x02037290
_081A57C0:
	ldr r1, _081A57CC
	movs r0, #0
	strh r0, [r1]
_081A57C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A57CC: .4byte 0x02037290
	thumb_func_end GiveArenaRewardItem

	thumb_func_start BufferArenaOpponentName
BufferArenaOpponentName: @ 0x081A57D0
	push {lr}
	ldr r0, _081A57E0
	ldr r1, _081A57E4
	ldrh r1, [r1]
	bl GetFrontierTrainerName
	pop {r0}
	bx r0
	.align 2, 0
_081A57E0: .4byte 0x02021C40
_081A57E4: .4byte 0x0203886A
	thumb_func_end BufferArenaOpponentName

	thumb_func_start DrawArenaRefereeTextBox
DrawArenaRefereeTextBox: @ 0x081A57E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	movs r0, #0x16
	mov r8, r0
	movs r5, #7
	movs r4, #1
	str r4, [sp]
	movs r6, #6
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1d
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x31
	movs r2, #1
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	movs r6, #2
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x32
	movs r2, #2
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x33
	movs r2, #3
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x34
	movs r2, #4
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x35
	movs r2, #0x1a
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x32
	movs r2, #0x1b
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x36
	movs r2, #0x1c
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x37
	movs r2, #1
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x38
	movs r2, #2
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x3b
	movs r2, #3
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x39
	movs r2, #4
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	ldr r1, _081A5AB0
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #0x1a
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x38
	movs r2, #0x1b
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x3a
	movs r2, #0x1c
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x37
	movs r2, #1
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x38
	movs r2, #2
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x3c
	movs r2, #3
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x39
	movs r2, #4
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	ldr r1, _081A5AB4
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #0x1a
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x38
	movs r2, #0x1b
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x3a
	movs r2, #0x1c
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x37
	movs r2, #1
	movs r3, #0x12
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x38
	movs r2, #2
	movs r3, #0x12
	bl FillBgTilemapBufferRect
	ldr r1, _081A5AB8
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #3
	movs r3, #0x12
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x39
	movs r2, #4
	movs r3, #0x12
	bl FillBgTilemapBufferRect
	ldr r1, _081A5ABC
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #0x1a
	movs r3, #0x12
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x38
	movs r2, #0x1b
	movs r3, #0x12
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x3a
	movs r2, #0x1c
	movs r3, #0x12
	bl FillBgTilemapBufferRect
	ldr r1, _081A5AC0
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #1
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	ldr r6, _081A5AC4
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	ldr r1, _081A5AC8
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #3
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	ldr r1, _081A5ACC
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #4
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	ldr r1, _081A5AD0
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #0x1a
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	adds r1, r6, #0
	movs r2, #0x1b
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	ldr r1, _081A5AD4
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r2, #0x1c
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A5AB0: .4byte 0x0000043B
_081A5AB4: .4byte 0x0000043C
_081A5AB8: .4byte 0x0000083B
_081A5ABC: .4byte 0x00000C3B
_081A5AC0: .4byte 0x00000831
_081A5AC4: .4byte 0x00000832
_081A5AC8: .4byte 0x00000833
_081A5ACC: .4byte 0x00000834
_081A5AD0: .4byte 0x00000835
_081A5AD4: .4byte 0x00000836
	thumb_func_end DrawArenaRefereeTextBox

	thumb_func_start RemoveArenaRefereeTextBox
RemoveArenaRefereeTextBox: @ 0x081A5AD8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	movs r5, #0
	movs r0, #0x1a
	mov r8, r0
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #3
	movs r2, #0
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	movs r6, #4
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #4
	movs r2, #1
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #5
	movs r2, #2
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #6
	movs r2, #0x1c
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #7
	movs r2, #0x1d
	movs r3, #0xe
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #9
	movs r2, #1
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0xa
	movs r2, #2
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0xb
	movs r2, #0x1c
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0x1d
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0xd
	movs r2, #0
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0xe
	movs r2, #1
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0xf
	movs r2, #2
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x1c
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0x11
	movs r2, #0x1d
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RemoveArenaRefereeTextBox

