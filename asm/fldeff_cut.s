.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetUpFieldMove_Cut
SetUpFieldMove_Cut: @ 0x080D2FB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	movs r0, #0x52
	bl CheckObjectGraphicsInFrontOfPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D2FF4
	ldr r1, _080D2FE4
	ldr r0, _080D2FE8
	str r0, [r1]
	ldr r1, _080D2FEC
	ldr r0, _080D2FF0
	str r0, [r1]
	movs r0, #1
	b _080D32CC
	.align 2, 0
_080D2FE4: .4byte 0x03005B10
_080D2FE8: .4byte 0x081B53D9
_080D2FEC: .4byte 0x0203CBB8
_080D2FF0: .4byte 0x080D333D
_080D2FF4:
	ldr r0, _080D3028
	adds r1, r0, #2
	bl PlayerGetDestCoords
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _080D302C
	adds r0, r0, r1
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #0x34
	bne _080D3038
	ldr r1, _080D3030
	movs r0, #5
	strb r0, [r1]
	ldr r0, _080D3034
	movs r1, #2
	b _080D3042
	.align 2, 0
_080D3028: .4byte 0x0203A80C
_080D302C: .4byte 0x02024190
_080D3030: .4byte 0x03001100
_080D3034: .4byte 0x03001101
_080D3038:
	ldr r1, _080D3118
	movs r0, #3
	strb r0, [r1]
	ldr r0, _080D311C
	movs r1, #1
_080D3042:
	strb r1, [r0]
	ldr r0, _080D3120
	strb r1, [r0]
	movs r6, #0
	movs r1, #0
_080D304C:
	mov r2, sp
	adds r0, r2, r6
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #8
	bls _080D304C
	movs r6, #0
	ldr r2, _080D3124
	movs r1, #0
_080D3062:
	adds r0, r6, r2
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x18
	bls _080D3062
	movs r3, #0
	str r3, [sp, #0x10]
	movs r6, #0
_080D3076:
	ldr r4, _080D3128
	adds r0, r6, r4
	ldr r1, _080D312C
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	movs r5, #0
	adds r2, r6, #1
	str r2, [sp, #0x18]
	lsls r7, r6, #1
	lsls r0, r0, #0x10
	str r0, [sp, #0x14]
	asrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r6, #2
	adds r0, r0, r6
	mov sb, r0
_080D3096:
	ldr r3, _080D3128
	adds r0, r5, r3
	ldr r4, _080D312C
	ldrh r4, [r4]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r8, r1
	asrs r4, r0, #0x10
	adds r0, r4, #0
	mov r1, sl
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D312C
	movs r1, #4
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _080D315C
	adds r0, r4, #0
	mov r1, sl
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsPokeGrass
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080D30E6
	adds r0, r4, #0
	bl MetatileBehavior_IsAshGrass
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D30F6
_080D30E6:
	adds r0, r5, #6
	add r0, sb
	ldr r3, _080D3124
	adds r0, r0, r3
	movs r1, #1
	strb r1, [r0]
	movs r0, #1
	str r0, [sp, #0x10]
_080D30F6:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x14]
	asrs r1, r2, #0x10
	bl MapGridIsImpassableAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D3130
	adds r0, r7, r6
	adds r0, r0, r5
	mov r3, sp
	adds r1, r3, r0
	b _080D3164
	.align 2, 0
_080D3118: .4byte 0x03001100
_080D311C: .4byte 0x03001101
_080D3120: .4byte 0x03001102
_080D3124: .4byte 0x03001108
_080D3128: .4byte 0x0000FFFF
_080D312C: .4byte 0x0203A80C
_080D3130:
	adds r0, r7, r6
	adds r0, r0, r5
	mov r2, sp
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl MetatileBehavior_IsCuttableGrass
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080D3168
	adds r0, r5, #6
	add r0, sb
	ldr r3, _080D3158
	adds r0, r0, r3
	strb r1, [r0]
	b _080D3168
	.align 2, 0
_080D3158: .4byte 0x03001108
_080D315C:
	adds r0, r7, r6
	adds r0, r0, r5
	mov r4, sp
	adds r1, r4, r0
_080D3164:
	movs r0, #0
	strb r0, [r1]
_080D3168:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080D3096
	ldr r1, [sp, #0x18]
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bhi _080D317E
	b _080D3076
_080D317E:
	ldr r2, [sp, #0xc]
	cmp r2, #0x34
	beq _080D318E
	ldr r3, [sp, #0x10]
	cmp r3, #1
	beq _080D318C
	b _080D32CA
_080D318C:
	b _080D32BE
_080D318E:
	movs r6, #0
	ldr r4, _080D3274
	mov sb, r4
	ldr r0, _080D3278
	mov sl, r0
_080D3198:
	lsls r2, r6, #2
	mov r3, sl
	adds r1, r2, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	mov r4, sb
	ldrh r4, [r4]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	mov r1, sb
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r7, #1
	movs r5, #0
	ldr r3, _080D327C
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r6, #1
	str r6, [sp, #0x18]
	adds r6, r2, #0
	cmp r0, #0
	beq _080D31FA
_080D31D0:
	adds r1, r2, #0
	adds r0, r5, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D3294
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bhi _080D31FA
	adds r0, r5, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080D31D0
_080D31FA:
	cmp r7, #1
	bne _080D32AC
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, sb
	movs r1, #4
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _080D32AC
	mov r3, sl
	adds r2, r6, r3
	movs r1, #1
	ldrsb r1, [r2, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #0xc
	ldrb r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsPokeGrass
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080D325C
	adds r0, r4, #0
	bl MetatileBehavior_IsAshGrass
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D3298
_080D325C:
	ldr r1, _080D3280
	ldr r0, _080D3284
	str r0, [r1]
	ldr r1, _080D3288
	ldr r0, _080D328C
	str r0, [r1]
	ldr r0, _080D3290
	adds r0, r6, r0
	strb r7, [r0]
	movs r4, #1
	str r4, [sp, #0x10]
	b _080D32AC
	.align 2, 0
_080D3274: .4byte 0x0203A80C
_080D3278: .4byte 0x08557164
_080D327C: .4byte 0x08557166
_080D3280: .4byte 0x03005B10
_080D3284: .4byte 0x081B53D9
_080D3288: .4byte 0x0203CBB8
_080D328C: .4byte 0x080D32F1
_080D3290: .4byte 0x03001108
_080D3294:
	movs r7, #0
	b _080D31FA
_080D3298:
	adds r0, r4, #0
	bl MetatileBehavior_IsCuttableGrass
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080D32AC
	ldr r0, _080D32DC
	adds r0, r6, r0
	strb r1, [r0]
_080D32AC:
	ldr r1, [sp, #0x18]
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bhi _080D32B8
	b _080D3198
_080D32B8:
	ldr r2, [sp, #0x10]
	cmp r2, #1
	bne _080D32CA
_080D32BE:
	ldr r1, _080D32E0
	ldr r0, _080D32E4
	str r0, [r1]
	ldr r1, _080D32E8
	ldr r0, _080D32EC
	str r0, [r1]
_080D32CA:
	ldr r0, [sp, #0x10]
_080D32CC:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D32DC: .4byte 0x03001108
_080D32E0: .4byte 0x03005B10
_080D32E4: .4byte 0x081B53D9
_080D32E8: .4byte 0x0203CBB8
_080D32EC: .4byte 0x080D32F1
	thumb_func_end SetUpFieldMove_Cut

	thumb_func_start FieldCallback_CutGrass
FieldCallback_CutGrass: @ 0x080D32F0
	push {lr}
	movs r0, #1
	bl FieldEffectStart
	bl GetCursorSelectionMonId
	ldr r1, _080D3308
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080D3308: .4byte 0x020388A8
	thumb_func_end FieldCallback_CutGrass

	thumb_func_start FldEff_UseCutOnGrass
FldEff_UseCutOnGrass: @ 0x080D330C
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D3334
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _080D3338
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0x12
	bl IncrementGameStat
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080D3334: .4byte 0x03005B60
_080D3338: .4byte 0x080D338D
	thumb_func_end FldEff_UseCutOnGrass

	thumb_func_start FieldCallback_CutTree
FieldCallback_CutTree: @ 0x080D333C
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _080D3354
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	ldr r0, _080D3358
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080D3354: .4byte 0x020388A8
_080D3358: .4byte 0x08256612
	thumb_func_end FieldCallback_CutTree

	thumb_func_start FldEff_UseCutOnTree
FldEff_UseCutOnTree: @ 0x080D335C
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D3384
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _080D3388
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0x12
	bl IncrementGameStat
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080D3384: .4byte 0x03005B60
_080D3388: .4byte 0x080D3BF5
	thumb_func_end FldEff_UseCutOnTree

	thumb_func_start StartCutGrassFieldEffect
StartCutGrassFieldEffect: @ 0x080D338C
	push {lr}
	movs r0, #1
	bl FieldEffectActiveListRemove
	movs r0, #0x3a
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartCutGrassFieldEffect

	thumb_func_start FldEff_CutGrass
FldEff_CutGrass: @ 0x080D33A0
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	movs r0, #0x80
	bl PlaySE
	ldr r4, _080D3490
	adds r1, r4, #2
	adds r0, r4, #0
	bl PlayerGetDestCoords
	adds r7, r4, #0
_080D33B6:
	ldr r0, _080D3494
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _080D3404
	adds r0, r6, #0
	movs r1, #5
	bl __umodsi3
	adds r4, r0, #0
	subs r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	movs r1, #5
	bl __udivsi3
	adds r5, r0, #0
	subs r5, #2
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldrh r0, [r7]
	adds r4, r4, r0
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	ldrh r2, [r7, #2]
	adds r5, r5, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetCutGrassMetatile
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0808E0CC
_080D3404:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x18
	bls _080D33B6
	ldr r2, _080D3490
	ldr r0, _080D3498
	ldrb r1, [r0]
	ldrh r0, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080D349C
	ldrb r1, [r1]
	mvns r1, r1
	ldrh r2, [r2, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl SetCutGrassMetatiles
	bl DrawWholeMapView
	ldr r4, _080D34A0
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	movs r6, #0
	ldr r5, _080D34A4
_080D3440:
	ldr r0, _080D34A8
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #7
	movs r2, #0x80
	lsls r2, r2, #0xc
	adds r1, r1, r2
	asrs r1, r1, #0x10
	ldrb r2, [r0]
	adds r2, #0x14
	ldr r0, _080D34AC
	movs r3, #0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	lsls r1, r6, #5
	strh r1, [r0, #0x32]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _080D3440
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D3490: .4byte 0x0203A80C
_080D3494: .4byte 0x03001108
_080D3498: .4byte 0x03001101
_080D349C: .4byte 0x03001102
_080D34A0: .4byte 0x02039A70
_080D34A4: .4byte 0x020205AC
_080D34A8: .4byte 0x02037230
_080D34AC: .4byte 0x085571C8
	thumb_func_end FldEff_CutGrass

	thumb_func_start SetCutGrassMetatile
SetCutGrassMetatile: @ 0x080D34B0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r0, #0x10
	asrs r4, r0, #0x10
	lsrs r7, r1, #0x10
	asrs r5, r1, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	ldr r0, _080D34E8
	cmp r1, r0
	bgt _080D34FC
	subs r0, #1
	cmp r1, r0
	bge _080D3574
	cmp r1, #0x25
	beq _080D3596
	cmp r1, #0x25
	bgt _080D34EC
	cmp r1, #0xd
	beq _080D353C
	cmp r1, #0x15
	beq _080D353C
	b _080D35A0
	.align 2, 0
_080D34E8: .4byte 0x00000207
_080D34EC:
	movs r0, #0xe3
	lsls r0, r0, #1
	cmp r1, r0
	beq _080D354C
	adds r0, #1
	cmp r1, r0
	beq _080D3552
	b _080D35A0
_080D34FC:
	ldr r0, _080D3514
	cmp r1, r0
	beq _080D3584
	cmp r1, r0
	bgt _080D3518
	subs r0, #0xa
	cmp r1, r0
	beq _080D353C
	adds r0, #2
	cmp r1, r0
	beq _080D3584
	b _080D35A0
	.align 2, 0
_080D3514: .4byte 0x00000212
_080D3518:
	ldr r0, _080D352C
	cmp r1, r0
	beq _080D3564
	cmp r1, r0
	bgt _080D3530
	subs r0, #1
	cmp r1, r0
	beq _080D355C
	b _080D35A0
	.align 2, 0
_080D352C: .4byte 0x00000282
_080D3530:
	ldr r0, _080D3538
	cmp r1, r0
	beq _080D356C
	b _080D35A0
	.align 2, 0
_080D3538: .4byte 0x00000283
_080D353C:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	bl MapGridSetMetatileIdAt
	b _080D35A0
_080D354C:
	movs r2, #0xe7
	lsls r2, r2, #1
	b _080D3576
_080D3552:
	ldr r2, _080D3558
	b _080D3576
	.align 2, 0
_080D3558: .4byte 0x000001CF
_080D355C:
	ldr r2, _080D3560
	b _080D3576
	.align 2, 0
_080D3560: .4byte 0x00000279
_080D3564:
	ldr r2, _080D3568
	b _080D3576
	.align 2, 0
_080D3568: .4byte 0x0000027A
_080D356C:
	ldr r2, _080D3570
	b _080D3576
	.align 2, 0
_080D3570: .4byte 0x0000027B
_080D3574:
	ldr r2, _080D3580
_080D3576:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
	b _080D35A0
	.align 2, 0
_080D3580: .4byte 0x00000271
_080D3584:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x86
	lsls r2, r2, #2
	bl MapGridSetMetatileIdAt
	b _080D35A0
_080D3596:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xe
	bl MapGridSetMetatileIdAt
_080D35A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetCutGrassMetatile

	thumb_func_start GetLongGrassCaseAt
GetLongGrassCaseAt: @ 0x080D35A8
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #1
	bne _080D35C4
	movs r0, #1
	b _080D35F6
_080D35C4:
	ldr r0, _080D35D0
	cmp r1, r0
	bne _080D35D4
	movs r0, #2
	b _080D35F6
	.align 2, 0
_080D35D0: .4byte 0x00000279
_080D35D4:
	ldr r0, _080D35E0
	cmp r1, r0
	bne _080D35E4
	movs r0, #3
	b _080D35F6
	.align 2, 0
_080D35E0: .4byte 0x0000027A
_080D35E4:
	ldr r0, _080D35F0
	cmp r2, r0
	beq _080D35F4
	movs r0, #0
	b _080D35F6
	.align 2, 0
_080D35F0: .4byte 0x0000027B
_080D35F4:
	movs r0, #4
_080D35F6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetLongGrassCaseAt

	thumb_func_start SetCutGrassMetatiles
SetCutGrassMetatiles: @ 0x080D35FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldr r1, _080D366C
	ldrb r2, [r1]
	mov r3, sl
	adds r0, r2, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r4, #0
	cmp r4, r2
	blt _080D362A
	b _080D3740
_080D362A:
	lsls r0, r3, #0x10
	asrs r7, r0, #0x10
_080D362E:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r5, r0, #0x10
	adds r0, r5, #0
	adds r1, r7, #0
	bl MapGridGetMetatileIdAt
	mov r8, r4
	cmp r0, #0x15
	bne _080D36B2
	adds r4, r7, #1
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl GetLongGrassCaseAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080D3688
	cmp r0, #2
	bgt _080D3670
	cmp r0, #1
	beq _080D367A
	b _080D36B2
	.align 2, 0
_080D366C: .4byte 0x03001100
_080D3670:
	cmp r0, #3
	beq _080D3698
	cmp r0, #4
	beq _080D36A8
	b _080D36B2
_080D367A:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x82
	lsls r2, r2, #2
	bl MapGridSetMetatileIdAt
	b _080D36B2
_080D3688:
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _080D3694
	bl MapGridSetMetatileIdAt
	b _080D36B2
	.align 2, 0
_080D3694: .4byte 0x00000281
_080D3698:
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _080D36A4
	bl MapGridSetMetatileIdAt
	b _080D36B2
	.align 2, 0
_080D36A4: .4byte 0x00000282
_080D36A8:
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _080D3778
	bl MapGridSetMetatileIdAt
_080D36B2:
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	cmp r0, #1
	bne _080D372C
	adds r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	movs r1, #0x82
	lsls r1, r1, #2
	cmp r0, r1
	bne _080D36E4
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl MapGridSetMetatileIdAt
_080D36E4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D377C
	cmp r0, r1
	bne _080D36FC
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _080D3780
	bl MapGridSetMetatileIdAt
_080D36FC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D3784
	cmp r0, r1
	bne _080D3714
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _080D3788
	bl MapGridSetMetatileIdAt
_080D3714:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D3778
	cmp r0, r1
	bne _080D372C
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _080D378C
	bl MapGridSetMetatileIdAt
_080D372C:
	movs r1, #0x80
	lsls r1, r1, #9
	add r1, r8
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080D3790
	ldrb r0, [r0]
	cmp r1, r0
	bge _080D3740
	b _080D362E
_080D3740:
	ldr r1, _080D3790
	ldrb r0, [r1]
	cmp r0, #5
	bne _080D3768
	mov r3, sb
	lsls r5, r3, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl HandleLongGrassOnHyper
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl HandleLongGrassOnHyper
_080D3768:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3778: .4byte 0x00000283
_080D377C: .4byte 0x00000281
_080D3780: .4byte 0x00000279
_080D3784: .4byte 0x00000282
_080D3788: .4byte 0x0000027A
_080D378C: .4byte 0x0000027B
_080D3790: .4byte 0x03001100
	thumb_func_end SetCutGrassMetatiles

	thumb_func_start HandleLongGrassOnHyper
HandleLongGrassOnHyper: @ 0x080D3794
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r3, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	cmp r0, #0
	bne _080D37CC
	mov r2, sp
	ldr r1, _080D37C8
	ldrb r0, [r1, #5]
	strb r0, [r2]
	ldrb r0, [r1, #0xa]
	strb r0, [r2, #1]
	ldrb r0, [r1, #0xf]
	strb r0, [r2, #2]
	mov r8, r5
	b _080D37EE
	.align 2, 0
_080D37C8: .4byte 0x03001108
_080D37CC:
	cmp r0, #1
	beq _080D37D2
	b _080D39EA
_080D37D2:
	mov r2, sp
	ldr r1, _080D38A8
	ldrb r0, [r1, #9]
	strb r0, [r2]
	ldrb r0, [r1, #0xe]
	strb r0, [r2, #1]
	ldrb r0, [r1, #0x13]
	strb r0, [r2, #2]
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xb
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	mov r8, r0
_080D37EE:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #1
	bne _080D3866
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r4, r0, #3
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	movs r1, #0x82
	lsls r1, r1, #2
	cmp r0, r1
	bne _080D381E
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl MapGridSetMetatileIdAt
_080D381E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D38AC
	cmp r0, r1
	bne _080D3836
	ldr r2, _080D38B0
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D3836:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D38B4
	cmp r0, r1
	bne _080D384E
	ldr r2, _080D38B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D384E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D38BC
	cmp r0, r1
	bne _080D3866
	ldr r2, _080D38C0
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D3866:
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _080D3960
	mov r0, r8
	lsls r5, r0, #0x10
	asrs r6, r5, #0x10
	mov r1, sl
	lsls r4, r1, #0x10
	asrs r7, r4, #0x10
	adds r1, r7, #2
	adds r0, r6, #0
	bl MapGridGetMetatileIdAt
	mov sb, r4
	cmp r0, #0x15
	bne _080D38F6
	adds r4, r7, #3
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl GetLongGrassCaseAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080D38D4
	cmp r0, #2
	bgt _080D38C4
	cmp r0, #1
	beq _080D38CE
	b _080D38F6
	.align 2, 0
_080D38A8: .4byte 0x03001108
_080D38AC: .4byte 0x00000281
_080D38B0: .4byte 0x00000279
_080D38B4: .4byte 0x00000282
_080D38B8: .4byte 0x0000027A
_080D38BC: .4byte 0x00000283
_080D38C0: .4byte 0x0000027B
_080D38C4:
	cmp r0, #3
	beq _080D38DC
	cmp r0, #4
	beq _080D38EC
	b _080D38F6
_080D38CE:
	movs r2, #0x82
	lsls r2, r2, #2
	b _080D38DE
_080D38D4:
	ldr r2, _080D38D8
	b _080D38DE
	.align 2, 0
_080D38D8: .4byte 0x00000281
_080D38DC:
	ldr r2, _080D38E8
_080D38DE:
	adds r0, r6, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
	b _080D38F6
	.align 2, 0
_080D38E8: .4byte 0x00000282
_080D38EC:
	ldr r2, _080D39A0
	adds r0, r6, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D38F6:
	asrs r5, r5, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	adds r4, r0, #4
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	movs r1, #0x82
	lsls r1, r1, #2
	cmp r0, r1
	bne _080D3918
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl MapGridSetMetatileIdAt
_080D3918:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D39A4
	cmp r0, r1
	bne _080D3930
	ldr r2, _080D39A8
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D3930:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D39AC
	cmp r0, r1
	bne _080D3948
	ldr r2, _080D39B0
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D3948:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileIdAt
	ldr r1, _080D39A0
	cmp r0, r1
	bne _080D3960
	ldr r2, _080D39B4
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D3960:
	mov r0, sp
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _080D39EA
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	adds r1, r4, #3
	adds r0, r5, #0
	bl MapGridGetMetatileIdAt
	cmp r0, #0x15
	bne _080D39EA
	adds r4, #4
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl GetLongGrassCaseAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080D39C8
	cmp r0, #2
	bgt _080D39B8
	cmp r0, #1
	beq _080D39C2
	b _080D39EA
	.align 2, 0
_080D39A0: .4byte 0x00000283
_080D39A4: .4byte 0x00000281
_080D39A8: .4byte 0x00000279
_080D39AC: .4byte 0x00000282
_080D39B0: .4byte 0x0000027A
_080D39B4: .4byte 0x0000027B
_080D39B8:
	cmp r0, #3
	beq _080D39D0
	cmp r0, #4
	beq _080D39E0
	b _080D39EA
_080D39C2:
	movs r2, #0x82
	lsls r2, r2, #2
	b _080D39D2
_080D39C8:
	ldr r2, _080D39CC
	b _080D39D2
	.align 2, 0
_080D39CC: .4byte 0x00000281
_080D39D0:
	ldr r2, _080D39DC
_080D39D2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
	b _080D39EA
	.align 2, 0
_080D39DC: .4byte 0x00000282
_080D39E0:
	ldr r2, _080D39FC
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D39EA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D39FC: .4byte 0x00000283
	thumb_func_end HandleLongGrassOnHyper

	thumb_func_start CutGrassSpriteCallback1
CutGrassSpriteCallback1: @ 0x080D3A00
	movs r2, #0
	movs r1, #8
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x34]
	ldr r1, _080D3A10
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_080D3A10: .4byte 0x080D3A15
	thumb_func_end CutGrassSpriteCallback1

	thumb_func_start CutGrassSpriteCallback2
CutGrassSpriteCallback2: @ 0x080D3A14
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #8
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x2e]
	adds r1, #1
	ldrh r2, [r4, #0x34]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x12
	adds r1, r1, r0
	strh r1, [r4, #0x2e]
	adds r2, #1
	strh r2, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0x1c
	beq _080D3A60
	adds r0, r1, #1
	strh r0, [r4, #0x30]
	b _080D3A64
_080D3A60:
	ldr r0, _080D3A6C
	str r0, [r4, #0x1c]
_080D3A64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D3A6C: .4byte 0x080D3A71
	thumb_func_end CutGrassSpriteCallback2

	thumb_func_start CutGrassSpriteCallbackEnd
CutGrassSpriteCallbackEnd: @ 0x080D3A70
	push {r4, r5, r6, lr}
	movs r4, #1
_080D3A74:
	ldr r6, _080D3AD0
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _080D3AD4
	adds r0, r0, r5
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _080D3A74
	ldr r0, [r6]
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x3a
	bl FieldEffectStop
	ldr r0, [r6]
	bl Free
	movs r0, #0
	str r0, [r6]
	bl ScriptUnfreezeEventObjects
	bl ScriptContext2_Disable
	bl IsMewPlayingHideAndSeek
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D3ACA
	ldr r0, _080D3AD8
	bl ScriptContext1_SetupScript
_080D3ACA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D3AD0: .4byte 0x02039A70
_080D3AD4: .4byte 0x020205AC
_080D3AD8: .4byte 0x0823B5A9
	thumb_func_end CutGrassSpriteCallbackEnd

	thumb_func_start FixLongGrassMetatilesWindowTop
FixLongGrassMetatilesWindowTop: @ 0x080D3ADC
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsLongGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D3B4E
	adds r4, #1
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl GetLongGrassCaseAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080D3B2A
	cmp r0, #2
	bgt _080D3B1A
	cmp r0, #1
	beq _080D3B24
	b _080D3B4E
_080D3B1A:
	cmp r0, #3
	beq _080D3B34
	cmp r0, #4
	beq _080D3B44
	b _080D3B4E
_080D3B24:
	movs r2, #0x82
	lsls r2, r2, #2
	b _080D3B36
_080D3B2A:
	ldr r2, _080D3B30
	b _080D3B36
	.align 2, 0
_080D3B30: .4byte 0x00000281
_080D3B34:
	ldr r2, _080D3B40
_080D3B36:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
	b _080D3B4E
	.align 2, 0
_080D3B40: .4byte 0x00000282
_080D3B44:
	ldr r2, _080D3B54
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
_080D3B4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3B54: .4byte 0x00000283
	thumb_func_end FixLongGrassMetatilesWindowTop

	thumb_func_start FixLongGrassMetatilesWindowBottom
FixLongGrassMetatilesWindowBottom: @ 0x080D3B58
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileIdAt
	cmp r0, #1
	bne _080D3BEA
	adds r5, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsLongGrassSouthEdge
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D3BEA
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	ldr r0, _080D3BA4
	cmp r1, r0
	beq _080D3BC8
	cmp r1, r0
	bgt _080D3BA8
	subs r0, #0x79
	cmp r1, r0
	beq _080D3BBC
	b _080D3BEA
	.align 2, 0
_080D3BA4: .4byte 0x00000281
_080D3BA8:
	ldr r0, _080D3BB8
	cmp r1, r0
	beq _080D3BD0
	adds r0, #1
	cmp r1, r0
	beq _080D3BE0
	b _080D3BEA
	.align 2, 0
_080D3BB8: .4byte 0x00000282
_080D3BBC:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl MapGridSetMetatileIdAt
	b _080D3BEA
_080D3BC8:
	ldr r2, _080D3BCC
	b _080D3BD2
	.align 2, 0
_080D3BCC: .4byte 0x00000279
_080D3BD0:
	ldr r2, _080D3BDC
_080D3BD2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
	b _080D3BEA
	.align 2, 0
_080D3BDC: .4byte 0x0000027A
_080D3BE0:
	ldr r2, _080D3BF0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
_080D3BEA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3BF0: .4byte 0x0000027B
	thumb_func_end FixLongGrassMetatilesWindowBottom

	thumb_func_start StartCutTreeFieldEffect
StartCutTreeFieldEffect: @ 0x080D3BF4
	push {lr}
	movs r0, #0x80
	bl PlaySE
	movs r0, #2
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartCutTreeFieldEffect

