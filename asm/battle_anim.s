.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearBattleAnimationVars
ClearBattleAnimationVars: @ 0x080A31FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080A3290
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080A3294
	strb r1, [r0]
	ldr r0, _080A3298
	strb r1, [r0]
	ldr r0, _080A329C
	strb r1, [r0]
	ldr r0, _080A32A0
	movs r1, #0
	str r1, [r0]
	ldr r0, _080A32A4
	str r1, [r0]
	ldr r0, _080A32A8
	movs r2, #0
	strh r1, [r0]
	ldr r0, _080A32AC
	strb r2, [r0]
	ldr r4, _080A32B0
	ldr r5, _080A32B4
	ldr r6, _080A32B8
	ldr r7, _080A32BC
	ldr r0, _080A32C0
	mov ip, r0
	ldr r1, _080A32C4
	mov r8, r1
	ldr r0, _080A32C8
	mov sb, r0
	ldr r1, _080A32CC
	adds r3, r1, #0
	ldr r1, _080A32D0
	movs r2, #7
_080A3246:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080A3246
	ldr r1, _080A32D4
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0xe
_080A325C:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _080A325C
	movs r1, #0
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r4, #1]
	strb r1, [r5]
	strb r1, [r6]
	movs r0, #0
	strh r1, [r7]
	mov r1, ip
	strb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r1, sb
	strb r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3290: .4byte 0x0203809C
_080A3294: .4byte 0x0203809D
_080A3298: .4byte 0x0203809E
_080A329C: .4byte 0x0203809F
_080A32A0: .4byte 0x020380A0
_080A32A4: .4byte 0x020380A4
_080A32A8: .4byte 0x020380A8
_080A32AC: .4byte 0x020380BA
_080A32B0: .4byte 0x020380D0
_080A32B4: .4byte 0x020380D2
_080A32B8: .4byte 0x020380D3
_080A32BC: .4byte 0x020380D4
_080A32C0: .4byte 0x020380D6
_080A32C4: .4byte 0x020380D7
_080A32C8: .4byte 0x020380E0
_080A32CC: .4byte 0x0000FFFF
_080A32D0: .4byte 0x020380AA
_080A32D4: .4byte 0x020380BE
	thumb_func_end ClearBattleAnimationVars

	thumb_func_start DoMoveAnim
DoMoveAnim: @ 0x080A32D8
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _080A32FC
	ldr r0, _080A3300
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, _080A3304
	ldr r0, _080A3308
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _080A330C
	movs r2, #1
	bl LaunchBattleAnimation
	pop {r0}
	bx r0
	.align 2, 0
_080A32FC: .4byte 0x020380D6
_080A3300: .4byte 0x02023EAF
_080A3304: .4byte 0x020380D7
_080A3308: .4byte 0x02023EB0
_080A330C: .4byte 0x082772F8
	thumb_func_end DoMoveAnim

	thumb_func_start LaunchBattleAnimation
LaunchBattleAnimation: @ 0x080A3310
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A33B0
	bl sub_080A7B40
	movs r0, #0
	bl UpdateOamPriorityInAllHealthboxes
	movs r4, #0
	mov r0, r8
	lsls r0, r0, #2
	mov sl, r0
	ldr r6, _080A3364
	movs r7, #0x64
	ldr r5, _080A3368
_080A334C:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3370
	ldrh r0, [r6]
	muls r0, r7, r0
	ldr r1, _080A336C
	b _080A3376
	.align 2, 0
_080A3364: .4byte 0x02023D12
_080A3368: .4byte 0x020380D8
_080A336C: .4byte 0x020243E8
_080A3370:
	ldrh r0, [r6]
	muls r0, r7, r0
	ldr r1, _080A3398
_080A3376:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	strh r0, [r5]
	adds r6, #2
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _080A334C
	ldr r3, _080A339C
	ldr r5, _080A33A0
	ldr r1, _080A33A4
	mov ip, r1
	ldr r7, _080A33A8
	ldr r6, _080A33AC
	b _080A33D8
	.align 2, 0
_080A3398: .4byte 0x02024190
_080A339C: .4byte 0x020380D4
_080A33A0: .4byte 0x020380D0
_080A33A4: .4byte 0x0203809D
_080A33A8: .4byte 0x02038098
_080A33AC: .4byte 0x080A35AD
_080A33B0:
	ldr r3, _080A33E4
	ldr r5, _080A33E8
	mov r0, r8
	lsls r0, r0, #2
	mov sl, r0
	ldr r1, _080A33EC
	mov ip, r1
	ldr r7, _080A33F0
	ldr r6, _080A33F4
	ldr r2, _080A33F8
	ldr r1, _080A33FC
	movs r4, #3
_080A33C8:
	ldr r0, [r2]
	ldr r0, [r0, #0x18]
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _080A33C8
_080A33D8:
	mov r0, sb
	cmp r0, #0
	bne _080A3400
	strh r0, [r3]
	b _080A3404
	.align 2, 0
_080A33E4: .4byte 0x020380D4
_080A33E8: .4byte 0x020380D0
_080A33EC: .4byte 0x0203809D
_080A33F0: .4byte 0x02038098
_080A33F4: .4byte 0x080A35AD
_080A33F8: .4byte 0x02039BD4
_080A33FC: .4byte 0x020380D8
_080A3400:
	mov r1, r8
	strh r1, [r3]
_080A3404:
	ldr r1, _080A3458
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0xe
_080A340C:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _080A340C
	movs r0, #0xff
	strb r0, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r5, #1]
	ldr r0, [sp]
	add r0, sl
	ldr r0, [r0]
	ldr r1, _080A345C
	str r0, [r1]
	movs r0, #1
	mov r1, ip
	strb r0, [r1]
	movs r0, #0
	ldr r1, _080A3460
	strb r0, [r1]
	str r6, [r7]
	ldr r0, _080A3464
	adds r2, r0, #0
	ldr r1, _080A3468
	movs r4, #7
_080A343E:
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _080A343E
	mov r1, sb
	cmp r1, #0
	beq _080A348A
	movs r4, #0
	ldr r2, _080A346C
	b _080A3472
	.align 2, 0
_080A3458: .4byte 0x020380BE
_080A345C: .4byte 0x02038090
_080A3460: .4byte 0x0203809C
_080A3464: .4byte 0x0000FFFF
_080A3468: .4byte 0x020380AA
_080A346C: .4byte 0x082772F0
_080A3470:
	adds r4, #1
_080A3472:
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _080A34AC
	cmp r0, r1
	beq _080A348A
	cmp r8, r0
	bne _080A3470
	ldr r0, _080A34B0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
_080A348A:
	ldr r0, _080A34B4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A34B8
	strh r1, [r0]
	ldr r0, _080A34BC
	strh r1, [r0]
	ldr r0, _080A34C0
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A34AC: .4byte 0x0000FFFF
_080A34B0: .4byte 0x030074D0
_080A34B4: .4byte 0x02022AD8
_080A34B8: .4byte 0x02022ADA
_080A34BC: .4byte 0x02022ADC
_080A34C0: .4byte 0x02022ADE
	thumb_func_end LaunchBattleAnimation

	thumb_func_start DestroyAnimSprite
DestroyAnimSprite: @ 0x080A34C4
	push {r4, lr}
	adds r4, r0, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	ldr r1, _080A34E0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A34E0: .4byte 0x0203809E
	thumb_func_end DestroyAnimSprite

	thumb_func_start DestroyAnimVisualTask
DestroyAnimVisualTask: @ 0x080A34E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	ldr r1, _080A34FC
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A34FC: .4byte 0x0203809E
	thumb_func_end DestroyAnimVisualTask

	thumb_func_start DestroyAnimSoundTask
DestroyAnimSoundTask: @ 0x080A3500
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	ldr r1, _080A3518
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A3518: .4byte 0x0203809F
	thumb_func_end DestroyAnimSoundTask

	thumb_func_start AddSpriteIndex
AddSpriteIndex: @ 0x080A351C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r4, _080A3534
	ldr r1, _080A3538
_080A3528:
	ldrh r0, [r1]
	cmp r0, r4
	bne _080A353C
	strh r3, [r1]
	b _080A3544
	.align 2, 0
_080A3534: .4byte 0x0000FFFF
_080A3538: .4byte 0x020380AA
_080A353C:
	adds r1, #2
	adds r2, #1
	cmp r2, #7
	ble _080A3528
_080A3544:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AddSpriteIndex

	thumb_func_start ClearSpriteIndex
ClearSpriteIndex: @ 0x080A354C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r0, _080A3568
	adds r4, r0, #0
	ldr r1, _080A356C
_080A355A:
	ldrh r0, [r1]
	cmp r0, r3
	bne _080A3570
	orrs r0, r4
	strh r0, [r1]
	b _080A3578
	.align 2, 0
_080A3568: .4byte 0x0000FFFF
_080A356C: .4byte 0x020380AA
_080A3570:
	adds r1, #2
	adds r2, #1
	cmp r2, #7
	ble _080A355A
_080A3578:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearSpriteIndex

	thumb_func_start WaitAnimFrameCount
WaitAnimFrameCount: @ 0x080A3580
	push {lr}
	ldr r2, _080A3598
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bgt _080A35A4
	ldr r0, _080A359C
	ldr r1, _080A35A0
	str r1, [r0]
	movs r0, #0
	b _080A35A6
	.align 2, 0
_080A3598: .4byte 0x0203809C
_080A359C: .4byte 0x02038098
_080A35A0: .4byte 0x080A35AD
_080A35A4:
	subs r0, r1, #1
_080A35A6:
	strb r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end WaitAnimFrameCount

	thumb_func_start ScriptCmd_hang1
ScriptCmd_hang1: @ 0x080A35AC
	push {r4, lr}
	ldr r4, _080A35DC
_080A35B0:
	ldr r0, _080A35E0
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end ScriptCmd_hang1

	thumb_func_start RunAnimScriptCommand
RunAnimScriptCommand: @ 0x080A35C0
	ldr r0, _080A35E4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A35D4
	ldr r0, _080A35E8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A35B0
_080A35D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A35DC: .4byte 0x084FE5A4
_080A35E0: .4byte 0x02038090
_080A35E4: .4byte 0x0203809C
_080A35E8: .4byte 0x0203809D
	thumb_func_end RunAnimScriptCommand

	thumb_func_start ScriptCmd_loadspritegfx
ScriptCmd_loadspritegfx: @ 0x080A35EC
	push {r4, r5, r6, lr}
	ldr r6, _080A3638
	ldr r0, [r6]
	adds r1, r0, #1
	str r1, [r6]
	ldrb r4, [r0, #1]
	ldrb r0, [r1, #1]
	lsls r0, r0, #8
	orrs r4, r0
	lsls r5, r4, #3
	ldr r0, _080A363C
	adds r0, r5, r0
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _080A3640
	adds r5, r5, r0
	adds r0, r5, #0
	bl LoadCompressedSpritePaletteUsingHeap
	ldr r0, [r6]
	adds r0, #2
	str r0, [r6]
	ldr r0, _080A3644
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	bl AddSpriteIndex
	ldr r1, _080A3648
	movs r0, #1
	strb r0, [r1]
	ldr r1, _080A364C
	ldr r0, _080A3650
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3638: .4byte 0x02038090
_080A363C: .4byte 0x084E99D0
_080A3640: .4byte 0x084EA2D8
_080A3644: .4byte 0xFFFFD8F0
_080A3648: .4byte 0x0203809C
_080A364C: .4byte 0x02038098
_080A3650: .4byte 0x080A3581
	thumb_func_end ScriptCmd_loadspritegfx

	thumb_func_start ScriptCmd_unloadspritegfx
ScriptCmd_unloadspritegfx: @ 0x080A3654
	push {r4, r5, r6, lr}
	ldr r6, _080A3694
	ldr r0, [r6]
	adds r1, r0, #1
	str r1, [r6]
	ldrb r4, [r0, #1]
	ldrb r0, [r1, #1]
	lsls r0, r0, #8
	orrs r4, r0
	ldr r1, _080A3698
	ldr r0, _080A369C
	adds r4, r4, r0
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r5, [r0, #6]
	adds r0, r5, #0
	bl FreeSpriteTilesByTag
	adds r0, r5, #0
	bl FreeSpritePaletteByTag
	ldr r0, [r6]
	adds r0, #2
	str r0, [r6]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	bl ClearSpriteIndex
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3694: .4byte 0x02038090
_080A3698: .4byte 0x084FD250
_080A369C: .4byte 0xFFFFD8F0
	thumb_func_end ScriptCmd_unloadspritegfx

	thumb_func_start ScriptCmd_createsprite
ScriptCmd_createsprite: @ 0x080A36A0
	push {r4, r5, r6, r7, lr}
	ldr r5, _080A3708
	ldr r1, [r5]
	adds r3, r1, #1
	str r3, [r5]
	ldrb r2, [r1, #1]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r0, [r3, #2]
	lsls r0, r0, #0x10
	adds r2, r2, r0
	ldrb r0, [r3, #3]
	lsls r0, r0, #0x18
	adds r7, r2, r0
	adds r0, r1, #5
	str r0, [r5]
	ldrb r4, [r1, #5]
	adds r0, r1, #6
	str r0, [r5]
	ldrb r0, [r1, #6]
	adds r1, #7
	str r1, [r5]
	cmp r0, #0
	beq _080A36F0
	adds r6, r5, #0
	ldr r5, _080A370C
	adds r3, r0, #0
_080A36D8:
	ldr r2, [r6]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r5]
	adds r2, #2
	str r2, [r6]
	adds r5, #2
	subs r3, #1
	cmp r3, #0
	bne _080A36D8
_080A36F0:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _080A3720
	movs r0, #0x80
	eors r4, r0
	cmp r4, #0x3f
	bls _080A3710
	adds r0, r4, #0
	subs r0, #0x40
	b _080A3712
	.align 2, 0
_080A3708: .4byte 0x02038090
_080A370C: .4byte 0x020380BE
_080A3710:
	rsbs r0, r4, #0
_080A3712:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A371C
	b _080A3732
	.align 2, 0
_080A371C: .4byte 0x020380D7
_080A3720:
	cmp r4, #0x3f
	bls _080A372A
	adds r0, r4, #0
	subs r0, #0x40
	b _080A372C
_080A372A:
	rsbs r0, r4, #0
_080A372C:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A3788
_080A3732:
	ldrb r0, [r0]
	bl GetBattlerSpriteSubpriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bgt _080A3750
	movs r6, #3
_080A3750:
	ldr r5, _080A378C
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r5]
	movs r1, #3
	bl GetBattlerSpriteCoord
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, #0
	adds r1, r4, #0
	bl CreateSpriteAndAnimate
	ldr r1, _080A3790
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3788: .4byte 0x020380D6
_080A378C: .4byte 0x020380D7
_080A3790: .4byte 0x0203809E
	thumb_func_end ScriptCmd_createsprite

	thumb_func_start ScriptCmd_createvisualtask
ScriptCmd_createvisualtask: @ 0x080A3794
	push {r4, r5, r6, r7, lr}
	ldr r4, _080A3804
	ldr r1, [r4]
	adds r3, r1, #1
	str r3, [r4]
	ldrb r2, [r1, #1]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r0, [r3, #2]
	lsls r0, r0, #0x10
	adds r2, r2, r0
	ldrb r0, [r3, #3]
	lsls r0, r0, #0x18
	adds r6, r2, r0
	adds r0, r1, #5
	str r0, [r4]
	ldrb r7, [r1, #5]
	adds r0, r1, #6
	str r0, [r4]
	ldrb r0, [r1, #6]
	adds r1, #7
	str r1, [r4]
	cmp r0, #0
	beq _080A37E4
	adds r5, r4, #0
	ldr r4, _080A3808
	adds r3, r0, #0
_080A37CC:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r4]
	adds r2, #2
	str r2, [r5]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bne _080A37CC
_080A37E4:
	adds r0, r6, #0
	adds r1, r7, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r6
	ldr r1, _080A380C
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3804: .4byte 0x02038090
_080A3808: .4byte 0x020380BE
_080A380C: .4byte 0x0203809E
	thumb_func_end ScriptCmd_createvisualtask

	thumb_func_start ScriptCmd_delay
ScriptCmd_delay: @ 0x080A3810
	push {r4, lr}
	ldr r1, _080A3840
	ldr r0, [r1]
	adds r2, r0, #1
	str r2, [r1]
	ldr r3, _080A3844
	ldrb r0, [r0, #1]
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A382E
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	strb r0, [r3]
_080A382E:
	adds r0, r2, #1
	str r0, [r1]
	ldr r1, _080A3848
	ldr r0, _080A384C
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3840: .4byte 0x02038090
_080A3844: .4byte 0x0203809C
_080A3848: .4byte 0x02038098
_080A384C: .4byte 0x080A3581
	thumb_func_end ScriptCmd_delay

	thumb_func_start ScriptCmd_waitbgfadein
ScriptCmd_waitbgfadein: @ 0x080A3850
	push {lr}
	ldr r0, _080A3868
	ldrb r2, [r0]
	cmp r2, #0
	bne _080A3874
	ldr r0, _080A386C
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	ldr r0, _080A3870
	strb r2, [r0]
	b _080A387A
	.align 2, 0
_080A3868: .4byte 0x0203809E
_080A386C: .4byte 0x02038090
_080A3870: .4byte 0x0203809C
_080A3874:
	ldr r1, _080A3880
	movs r0, #1
	strb r0, [r1]
_080A387A:
	pop {r0}
	bx r0
	.align 2, 0
_080A3880: .4byte 0x0203809C
	thumb_func_end ScriptCmd_waitbgfadein

	thumb_func_start ScriptCmd_hang2
ScriptCmd_hang2: @ 0x080A3884
	bx lr
	.align 2, 0
	thumb_func_end ScriptCmd_hang2

	thumb_func_start ScriptCmd_stopsound
ScriptCmd_stopsound: @ 0x080A3888
	bx lr
	.align 2, 0
	thumb_func_end ScriptCmd_stopsound

	thumb_func_start ScriptCmd_end
ScriptCmd_end: @ 0x080A388C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _080A38BC
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A38B4
	ldr r0, _080A38C0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A38B4
	ldr r1, _080A38C4
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080A38B4
	ldrb r0, [r1, #1]
	cmp r0, #0xff
	beq _080A38CC
_080A38B4:
	ldr r1, _080A38C8
	movs r0, #0
	strh r0, [r1]
	b _080A38E6
	.align 2, 0
_080A38BC: .4byte 0x0203809E
_080A38C0: .4byte 0x0203809F
_080A38C4: .4byte 0x020380D0
_080A38C8: .4byte 0x020380CE
_080A38CC:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3904
	ldr r1, _080A38F0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x5a
	bhi _080A38F8
_080A38E6:
	ldr r1, _080A38F4
	movs r0, #1
	strb r0, [r1]
	b _080A396A
	.align 2, 0
_080A38F0: .4byte 0x020380CE
_080A38F4: .4byte 0x0203809C
_080A38F8:
	ldr r0, _080A3974
	bl m4aMPlayStop
	ldr r0, _080A3978
	bl m4aMPlayStop
_080A3904:
	ldr r1, _080A397C
	movs r0, #0
	strh r0, [r1]
	movs r5, #0
	ldr r7, _080A3980
	ldr r6, _080A3984
	ldr r4, _080A3988
_080A3912:
	ldrh r0, [r4]
	cmp r0, r7
	beq _080A3936
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #6]
	bl FreeSpritePaletteByTag
	ldrh r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r4]
_080A3936:
	adds r4, #2
	adds r5, #1
	cmp r5, #7
	ble _080A3912
	mov r1, r8
	cmp r1, #0
	bne _080A396A
	ldr r0, _080A398C
	ldr r1, _080A3980
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3964
	bl sub_080A7B40
	movs r0, #1
	bl UpdateOamPriorityInAllHealthboxes
_080A3964:
	ldr r0, _080A3990
	mov r1, r8
	strb r1, [r0]
_080A396A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3974: .4byte 0x03007510
_080A3978: .4byte 0x03007550
_080A397C: .4byte 0x020380CE
_080A3980: .4byte 0x0000FFFF
_080A3984: .4byte 0x084FD250
_080A3988: .4byte 0x020380AA
_080A398C: .4byte 0x030074D0
_080A3990: .4byte 0x0203809D
	thumb_func_end ScriptCmd_end

	thumb_func_start ScriptCmd_playse
ScriptCmd_playse: @ 0x080A3994
	push {r4, lr}
	ldr r4, _080A39B8
	ldr r0, [r4]
	adds r1, r0, #1
	str r1, [r4]
	ldrb r0, [r0, #1]
	ldrb r1, [r1, #1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlaySE
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A39B8: .4byte 0x02038090
	thumb_func_end ScriptCmd_playse

	thumb_func_start sub_080A39BC
sub_080A39BC: @ 0x080A39BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _080A3A04
	mov r8, r1
	adds r6, r0, r1
	ldr r1, _080A3A08
	movs r2, #0
	ldrsh r0, [r6, r2]
	adds r0, r0, r1
	ldrb r5, [r0]
	ldr r1, _080A3A0C
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r4, r0, r1
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bne _080A3A10
	adds r0, r7, #0
	bl DestroyAnimVisualTask
	b _080A3A86
	.align 2, 0
_080A3A04: .4byte 0x03005B68
_080A3A08: .4byte 0x02023E88
_080A3A0C: .4byte 0x020205AC
_080A3A10:
	ldr r0, _080A3A4C
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r1, r8
	subs r1, #8
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r1
	strh r5, [r1, #8]
	ldrh r0, [r4, #0x24]
	ldrh r3, [r4, #0x20]
	adds r0, r0, r3
	strh r0, [r1, #0xa]
	ldrh r0, [r4, #0x26]
	ldrh r4, [r4, #0x22]
	adds r0, r0, r4
	strh r0, [r1, #0xc]
	movs r3, #2
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bne _080A3A58
	ldr r0, _080A3A50
	ldrh r0, [r0]
	strh r0, [r1, #0xe]
	ldr r0, _080A3A54
	b _080A3A60
	.align 2, 0
_080A3A4C: .4byte 0x080A40A1
_080A3A50: .4byte 0x02022ACC
_080A3A54: .4byte 0x02022ACE
_080A3A58:
	ldr r0, _080A3A90
	ldrh r0, [r0]
	strh r0, [r1, #0xe]
	ldr r0, _080A3A94
_080A3A60:
	ldrh r0, [r0]
	strh r0, [r1, #0x10]
	ldr r1, _080A3A98
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r6, #2]
	strh r1, [r0, #0x12]
	ldrh r1, [r6]
	strh r1, [r0, #0x14]
	ldr r1, _080A3A9C
	movs r3, #6
	ldrsh r0, [r6, r3]
	adds r0, r0, r1
	strb r2, [r0]
	adds r0, r7, #0
	bl DestroyAnimVisualTask
_080A3A86:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3A90: .4byte 0x02022AD0
_080A3A94: .4byte 0x02022AD2
_080A3A98: .4byte 0x03005B60
_080A3A9C: .4byte 0x020380D0
	thumb_func_end sub_080A39BC

	thumb_func_start ScriptCmd_monbg
ScriptCmd_monbg: @ 0x080A3AA0
	push {r4, r5, lr}
	ldr r1, _080A3AB8
	ldr r2, [r1]
	adds r0, r2, #1
	str r0, [r1]
	ldrb r0, [r2, #1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A3AC0
	ldr r0, _080A3ABC
	b _080A3AC2
	.align 2, 0
_080A3AB8: .4byte 0x02038090
_080A3ABC: .4byte 0x020380D7
_080A3AC0:
	ldr r0, _080A3AF4
_080A3AC2:
	ldrb r4, [r0]
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3B2E
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080A3AEE
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3AF8
_080A3AEE:
	movs r5, #0
	b _080A3AFA
	.align 2, 0
_080A3AF4: .4byte 0x020380D6
_080A3AF8:
	movs r5, #1
_080A3AFA:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MoveBattlerSpriteToBG
	ldr r0, _080A3B60
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080A3B64
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _080A3B68
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #8]
	strh r5, [r0, #0xa]
	movs r1, #1
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
_080A3B2E:
	movs r0, #2
	eors r4, r0
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3BA0
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080A3B5C
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3B6C
_080A3B5C:
	movs r5, #0
	b _080A3B6E
	.align 2, 0
_080A3B60: .4byte 0x080A39BD
_080A3B64: .4byte 0x0203809E
_080A3B68: .4byte 0x03005B60
_080A3B6C:
	movs r5, #1
_080A3B6E:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MoveBattlerSpriteToBG
	ldr r0, _080A3BBC
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080A3BC0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _080A3BC4
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #8]
	strh r5, [r0, #0xa]
	movs r1, #1
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
_080A3BA0:
	ldr r1, _080A3BC8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _080A3BCC
	movs r0, #1
	strb r0, [r1]
	ldr r1, _080A3BD0
	ldr r0, _080A3BD4
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3BBC: .4byte 0x080A39BD
_080A3BC0: .4byte 0x0203809E
_080A3BC4: .4byte 0x03005B60
_080A3BC8: .4byte 0x02038090
_080A3BCC: .4byte 0x0203809C
_080A3BD0: .4byte 0x02038098
_080A3BD4: .4byte 0x080A3581
	thumb_func_end ScriptCmd_monbg

	thumb_func_start IsBattlerSpriteVisible
IsBattlerSpriteVisible: @ 0x080A3BD8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3BF8
	ldr r0, _080A3BF4
	ldrb r0, [r0]
	cmp r4, r0
	beq _080A3C3C
	b _080A3C4C
	.align 2, 0
_080A3BF4: .4byte 0x020380D6
_080A3BF8:
	adds r0, r4, #0
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3C4C
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3C3C
	ldr r0, _080A3C40
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A3C3C
	ldr r2, _080A3C44
	ldr r0, _080A3C48
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _080A3C4C
_080A3C3C:
	movs r0, #1
	b _080A3C4E
	.align 2, 0
_080A3C40: .4byte 0x02024174
_080A3C44: .4byte 0x020205AC
_080A3C48: .4byte 0x02023E88
_080A3C4C:
	movs r0, #0
_080A3C4E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsBattlerSpriteVisible

	thumb_func_start MoveBattlerSpriteToBG
MoveBattlerSpriteToBG: @ 0x080A3C54
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	cmp r1, #0
	beq _080A3C72
	b _080A3E26
_080A3C72:
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080A3CA4
	ldr r1, _080A3C9C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r0, #0
	movs r3, #1
	bl RequestDma3Fill
	ldr r1, _080A3CA0
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0xff
	movs r3, #0
	bl RequestDma3Fill
	b _080A3CC0
	.align 2, 0
_080A3C9C: .4byte 0x06008000
_080A3CA0: .4byte 0x0600F000
_080A3CA4:
	ldr r1, _080A3DC0
	movs r2, #0x80
	lsls r2, r2, #6
	movs r0, #0
	movs r3, #1
	bl RequestDma3Fill
	ldr r1, _080A3DC4
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0xff
	movs r3, #0
	bl RequestDma3Fill
_080A3CC0:
	add r0, sp, #0x10
	bl sub_080A63F8
	add r0, sp, #0x20
	movs r1, #0
	strh r1, [r0]
	ldr r1, [sp, #0x10]
	ldr r2, _080A3DC8
	bl CpuSet
	mov r0, sp
	adds r0, #0x22
	movs r1, #0xff
	strh r1, [r0]
	ldr r1, [sp, #0x14]
	ldr r2, _080A3DCC
	bl CpuSet
	movs r0, #1
	movs r1, #4
	movs r2, #2
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #0
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl SetAnimBgAttribute
	ldr r0, _080A3DD0
	adds r0, r6, r0
	ldrb r4, [r0]
	ldr r5, _080A3DD4
	ldr r0, _080A3DD8
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x24]
	ldrh r1, [r1, #0x20]
	adds r0, r0, r1
	rsbs r0, r0, #0
	adds r0, #0x20
	strh r0, [r5]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3D42
	ldr r0, _080A3DDC
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r0, [r0]
	bl IsSpeciesNotUnown
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3D42
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
_080A3D42:
	ldr r5, _080A3DE0
	ldr r2, _080A3DD8
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x26]
	ldrh r1, [r1, #0x22]
	adds r0, r0, r1
	rsbs r0, r0, #0
	adds r0, #0x20
	strh r0, [r5]
	mov r0, sb
	cmp r0, #0
	beq _080A3D78
	ldr r0, _080A3DD0
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080A3D78:
	ldr r0, _080A3DD4
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldrh r1, [r5]
	movs r0, #0x16
	bl SetGpuReg
	lsls r4, r6, #5
	ldr r0, _080A3DE4
	adds r4, r4, r0
	add r0, sp, #0x10
	ldrb r1, [r0, #8]
	lsls r1, r1, #4
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	add r0, sp, #0x10
	ldrb r1, [r0, #8]
	lsls r1, r1, #5
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	ldr r2, _080A3DE8
	adds r0, r4, #0
	bl CpuSet
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3DEC
	movs r3, #0
	b _080A3DF6
	.align 2, 0
_080A3DC0: .4byte 0x06004000
_080A3DC4: .4byte 0x0600E000
_080A3DC8: .4byte 0x01000800
_080A3DCC: .4byte 0x01000400
_080A3DD0: .4byte 0x02023E88
_080A3DD4: .4byte 0x02022ACC
_080A3DD8: .4byte 0x020205AC
_080A3DDC: .4byte 0x02039BD4
_080A3DE0: .4byte 0x02022ACE
_080A3DE4: .4byte 0x020375B4
_080A3DE8: .4byte 0x04000008
_080A3DEC:
	adds r0, r6, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_080A3DF6:
	add r0, sp, #0x10
	ldrb r0, [r0, #8]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0xa]
	str r0, [sp, #0xc]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_0811980C
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3E20
	b _080A3F2E
_080A3E20:
	bl sub_080A3F68
	b _080A3F2E
_080A3E26:
	ldr r1, _080A3F3C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r0, #0
	movs r3, #1
	bl RequestDma3Fill
	ldr r1, _080A3F40
	movs r7, #0x80
	lsls r7, r7, #5
	movs r0, #0
	adds r2, r7, #0
	movs r3, #1
	bl RequestDma3Fill
	add r0, sp, #0x10
	movs r1, #2
	bl sub_080A6458
	add r0, sp, #0x24
	movs r4, #0
	strh r4, [r0]
	ldr r1, [sp, #0x10]
	adds r1, r1, r7
	ldr r2, _080A3F44
	bl CpuSet
	mov r0, sp
	adds r0, #0x26
	strh r4, [r0]
	ldr r1, [sp, #0x14]
	movs r2, #0x80
	lsls r2, r2, #4
	mov r8, r2
	add r1, r8
	ldr r2, _080A3F48
	bl CpuSet
	movs r0, #2
	movs r1, #4
	movs r2, #2
	bl SetAnimBgAttribute
	movs r0, #2
	movs r1, #0
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl SetAnimBgAttribute
	ldr r0, _080A3F4C
	adds r2, r5, r0
	ldrb r4, [r2]
	ldr r5, _080A3F50
	ldr r3, _080A3F54
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r1, #0x24]
	ldrh r4, [r1, #0x20]
	adds r0, r0, r4
	rsbs r0, r0, #0
	adds r0, #0x20
	strh r0, [r5]
	ldr r4, _080A3F58
	ldrh r0, [r1, #0x26]
	ldrh r1, [r1, #0x22]
	adds r0, r0, r1
	rsbs r0, r0, #0
	adds r0, #0x20
	strh r0, [r4]
	mov r0, sb
	cmp r0, #0
	beq _080A3ED6
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080A3ED6:
	ldrh r1, [r5]
	movs r0, #0x18
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x1a
	bl SetGpuReg
	lsls r4, r6, #5
	ldr r0, _080A3F5C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x90
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _080A3F60
	ldr r2, _080A3F64
	adds r0, r4, #0
	bl CpuSet
	adds r0, r6, #0
	bl GetBattlerPosition
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	add r0, sp, #0x10
	ldrb r0, [r0, #8]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	adds r0, r0, r7
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	add r0, r8
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0xa]
	str r0, [sp, #0xc]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_0811980C
_080A3F2E:
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3F3C: .4byte 0x06006000
_080A3F40: .4byte 0x0600F000
_080A3F44: .4byte 0x01000800
_080A3F48: .4byte 0x01000400
_080A3F4C: .4byte 0x02023E88
_080A3F50: .4byte 0x02022AD0
_080A3F54: .4byte 0x020205AC
_080A3F58: .4byte 0x02022AD2
_080A3F5C: .4byte 0x020375B4
_080A3F60: .4byte 0x05000120
_080A3F64: .4byte 0x04000008
	thumb_func_end MoveBattlerSpriteToBG

	thumb_func_start sub_080A3F68
sub_080A3F68: @ 0x080A3F68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _080A3FE4
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r0, [r0]
	bl IsSpeciesNotUnown
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3FDA
	mov r0, sp
	bl sub_080A63F8
	ldr r6, [sp, #4]
	movs r5, #0
	movs r0, #7
	mov ip, r0
	movs r7, #0
_080A3F8E:
	movs r4, #0
	adds r3, r7, r6
	mov r1, ip
	lsls r0, r1, #1
	adds r2, r0, r6
_080A3F98:
	ldrh r1, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	strh r1, [r2]
	adds r3, #2
	subs r2, #2
	adds r4, #1
	cmp r4, #3
	ble _080A3F98
	movs r0, #0x20
	add ip, r0
	adds r7, #0x40
	adds r5, #1
	cmp r5, #7
	ble _080A3F8E
	movs r5, #0
	movs r1, #0x80
	lsls r1, r1, #3
	adds r3, r1, #0
_080A3FBE:
	adds r2, r5, #1
	lsls r0, r5, #6
	adds r1, r0, r6
	movs r4, #7
_080A3FC6:
	ldrh r0, [r1]
	eors r0, r3
	strh r0, [r1]
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bge _080A3FC6
	adds r5, r2, #0
	cmp r5, #7
	ble _080A3FBE
_080A3FDA:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3FE4: .4byte 0x02039BD4
	thumb_func_end sub_080A3F68

	thumb_func_start sub_080A3FE8
sub_080A3FE8: @ 0x080A3FE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r3, r3, #0x18
	movs r0, #0x40
	mov ip, r0
	cmp r3, #0
	bne _080A4004
	movs r1, #0x20
	mov ip, r1
_080A4004:
	lsls r0, r5, #0x1c
	lsrs r5, r0, #0x10
	movs r0, #0
	cmp r0, ip
	bge _080A4034
	ldr r7, _080A4040
_080A4010:
	adds r4, r0, #1
	lsls r0, r0, #6
	mov r1, r8
	adds r3, r0, r1
	movs r2, #0x1f
_080A401A:
	ldrh r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	orrs r0, r5
	adds r0, r0, r6
	strh r0, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _080A401A
	adds r0, r4, #0
	cmp r0, ip
	blt _080A4010
_080A4034:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4040: .4byte 0x00000FFF
	thumb_func_end sub_080A3FE8

	thumb_func_start sub_080A4044
sub_080A4044: @ 0x080A4044
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sp
	bl sub_080A63F8
	cmp r4, #0
	beq _080A4064
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _080A4080
_080A4064:
	movs r0, #1
	bl sub_080A6530
	ldr r0, _080A4078
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A407C
	strh r1, [r0]
	b _080A408E
	.align 2, 0
_080A4078: .4byte 0x02022ACC
_080A407C: .4byte 0x02022ACE
_080A4080:
	movs r0, #2
	bl sub_080A6530
	ldr r0, _080A4098
	strh r4, [r0]
	ldr r0, _080A409C
	strh r4, [r0]
_080A408E:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4098: .4byte 0x02022AD0
_080A409C: .4byte 0x02022AD2
	thumb_func_end sub_080A4044

	thumb_func_start task_pA_ma0A_obj_to_bg_pal
task_pA_ma0A_obj_to_bg_pal: @ 0x080A40A0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A411C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r2
	ldrb r4, [r5, #8]
	ldrb r6, [r5, #0x14]
	mov r0, sp
	bl sub_080A63F8
	ldr r0, _080A4120
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r1, #0x24]
	ldrh r0, [r1, #0x20]
	adds r2, r2, r0
	ldrh r0, [r5, #0xa]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r2, [r1, #0x26]
	ldrh r1, [r1, #0x22]
	adds r2, r2, r1
	ldrh r0, [r5, #0xc]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080A4138
	ldr r1, _080A4124
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0xe]
	adds r0, r0, r3
	strh r0, [r1]
	ldr r1, _080A4128
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrh r5, [r5, #0x10]
	adds r0, r0, r5
	strh r0, [r1]
	lsls r0, r6, #5
	ldr r2, _080A412C
	adds r0, r0, r2
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #5
	ldr r3, _080A4130
	adds r2, r2, r3
	adds r1, r1, r2
	ldr r2, _080A4134
	bl CpuSet
	b _080A415E
	.align 2, 0
_080A411C: .4byte 0x03005B60
_080A4120: .4byte 0x020205AC
_080A4124: .4byte 0x02022ACC
_080A4128: .4byte 0x02022ACE
_080A412C: .4byte 0x020379B4
_080A4130: .4byte 0xFFFFFE00
_080A4134: .4byte 0x04000008
_080A4138:
	ldr r1, _080A4168
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0xe]
	adds r0, r0, r3
	strh r0, [r1]
	ldr r1, _080A416C
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrh r5, [r5, #0x10]
	adds r0, r0, r5
	strh r0, [r1]
	lsls r0, r6, #5
	ldr r1, _080A4170
	adds r0, r0, r1
	subs r1, #0xe0
	ldr r2, _080A4174
	bl CpuSet
_080A415E:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4168: .4byte 0x02022AD0
_080A416C: .4byte 0x02022AD2
_080A4170: .4byte 0x020379B4
_080A4174: .4byte 0x04000008
	thumb_func_end task_pA_ma0A_obj_to_bg_pal

	thumb_func_start ScriptCmd_clearmonbg
ScriptCmd_clearmonbg: @ 0x080A4178
	push {r4, r5, lr}
	ldr r0, _080A418C
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r4, [r2, #1]
	cmp r4, #0
	bne _080A4190
	movs r4, #2
	b _080A419A
	.align 2, 0
_080A418C: .4byte 0x02038090
_080A4190:
	cmp r4, #1
	bne _080A4196
	movs r4, #3
_080A4196:
	cmp r4, #0
	beq _080A419E
_080A419A:
	cmp r4, #2
	bne _080A41A8
_080A419E:
	ldr r0, _080A41A4
	b _080A41AA
	.align 2, 0
_080A41A4: .4byte 0x020380D6
_080A41A8:
	ldr r0, _080A4200
_080A41AA:
	ldrb r5, [r0]
	ldr r3, _080A4204
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080A41D0
	ldr r2, _080A4208
	ldr r0, _080A420C
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
_080A41D0:
	cmp r4, #1
	bls _080A4210
	ldrb r0, [r3, #1]
	cmp r0, #0xff
	beq _080A4210
	ldr r3, _080A4208
	ldr r2, _080A420C
	movs r1, #2
	adds r0, r5, #0
	eors r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	b _080A4212
	.align 2, 0
_080A4200: .4byte 0x020380D7
_080A4204: .4byte 0x020380D0
_080A4208: .4byte 0x020205AC
_080A420C: .4byte 0x02023E88
_080A4210:
	movs r4, #0
_080A4212:
	ldr r0, _080A423C
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A4240
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	strh r5, [r1, #0xc]
	ldr r1, _080A4244
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A423C: .4byte 0x080A4249
_080A4240: .4byte 0x03005B60
_080A4244: .4byte 0x02038090
	thumb_func_end ScriptCmd_clearmonbg

	thumb_func_start sub_080A4248
sub_080A4248: @ 0x080A4248
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080A4288
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080A42D2
	ldrb r0, [r1, #0xc]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080A4284
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A428C
_080A4284:
	movs r4, #0
	b _080A428E
	.align 2, 0
_080A4288: .4byte 0x03005B60
_080A428C:
	movs r4, #1
_080A428E:
	ldr r6, _080A42D8
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _080A42A6
	adds r0, r4, #0
	bl sub_080A4044
	ldrb r0, [r6]
	bl DestroyTask
	movs r0, #0xff
	strb r0, [r6]
_080A42A6:
	ldr r0, _080A42DC
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #1
	ble _080A42CC
	movs r0, #1
	eors r4, r0
	adds r0, r4, #0
	bl sub_080A4044
	ldrb r0, [r6, #1]
	bl DestroyTask
	movs r0, #0xff
	strb r0, [r6, #1]
_080A42CC:
	adds r0, r5, #0
	bl DestroyTask
_080A42D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A42D8: .4byte 0x020380D0
_080A42DC: .4byte 0x03005B60
	thumb_func_end sub_080A4248

	thumb_func_start ScriptCmd_monbg_22
ScriptCmd_monbg_22: @ 0x080A42E0
	push {r4, r5, lr}
	ldr r0, _080A42F4
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r5, [r2, #1]
	cmp r5, #0
	bne _080A42F8
	movs r5, #2
	b _080A4302
	.align 2, 0
_080A42F4: .4byte 0x02038090
_080A42F8:
	cmp r5, #1
	bne _080A42FE
	movs r5, #3
_080A42FE:
	cmp r5, #0
	beq _080A4306
_080A4302:
	cmp r5, #2
	bne _080A4310
_080A4306:
	ldr r0, _080A430C
	b _080A4312
	.align 2, 0
_080A430C: .4byte 0x020380D6
_080A4310:
	ldr r0, _080A4344
_080A4312:
	ldrb r4, [r0]
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4352
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080A433E
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4348
_080A433E:
	movs r1, #0
	b _080A434A
	.align 2, 0
_080A4344: .4byte 0x020380D7
_080A4348:
	movs r1, #1
_080A434A:
	adds r0, r4, #0
	movs r2, #0
	bl MoveBattlerSpriteToBG
_080A4352:
	movs r0, #2
	eors r4, r0
	cmp r5, #1
	bls _080A4392
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4392
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080A4384
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4388
_080A4384:
	movs r1, #0
	b _080A438A
_080A4388:
	movs r1, #1
_080A438A:
	adds r0, r4, #0
	movs r2, #0
	bl MoveBattlerSpriteToBG
_080A4392:
	ldr r1, _080A43A0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A43A0: .4byte 0x02038090
	thumb_func_end ScriptCmd_monbg_22

	thumb_func_start ScriptCmd_clearmonbg_23
ScriptCmd_clearmonbg_23: @ 0x080A43A4
	push {r4, r5, r6, lr}
	ldr r0, _080A43B8
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r5, [r2, #1]
	cmp r5, #0
	bne _080A43BC
	movs r5, #2
	b _080A43C6
	.align 2, 0
_080A43B8: .4byte 0x02038090
_080A43BC:
	cmp r5, #1
	bne _080A43C2
	movs r5, #3
_080A43C2:
	cmp r5, #0
	beq _080A43CA
_080A43C6:
	cmp r5, #2
	bne _080A43D4
_080A43CA:
	ldr r0, _080A43D0
	b _080A43D6
	.align 2, 0
_080A43D0: .4byte 0x020380D6
_080A43D4:
	ldr r0, _080A4434
_080A43D6:
	ldrb r6, [r0]
	adds r0, r6, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4400
	ldr r2, _080A4438
	ldr r0, _080A443C
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
_080A4400:
	cmp r5, #1
	bls _080A4440
	movs r0, #2
	adds r4, r6, #0
	eors r4, r0
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4440
	ldr r2, _080A4438
	ldr r0, _080A443C
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	b _080A4442
	.align 2, 0
_080A4434: .4byte 0x020380D7
_080A4438: .4byte 0x020205AC
_080A443C: .4byte 0x02023E88
_080A4440:
	movs r5, #0
_080A4442:
	ldr r0, _080A446C
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A4470
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #8]
	strh r6, [r1, #0xc]
	ldr r1, _080A4474
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A446C: .4byte 0x080A4479
_080A4470: .4byte 0x03005B60
_080A4474: .4byte 0x02038090
	thumb_func_end ScriptCmd_clearmonbg_23

	thumb_func_start sub_080A4478
sub_080A4478: @ 0x080A4478
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080A44BC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080A4506
	ldrb r4, [r1, #0xc]
	adds r0, r4, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080A44B6
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A44C0
_080A44B6:
	movs r5, #0
	b _080A44C2
	.align 2, 0
_080A44BC: .4byte 0x03005B60
_080A44C0:
	movs r5, #1
_080A44C2:
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A44D4
	adds r0, r5, #0
	bl sub_080A4044
_080A44D4:
	ldr r0, _080A450C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #1
	ble _080A4500
	movs r0, #2
	eors r4, r0
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4500
	movs r0, #1
	eors r5, r0
	adds r0, r5, #0
	bl sub_080A4044
_080A4500:
	adds r0, r6, #0
	bl DestroyTask
_080A4506:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A450C: .4byte 0x03005B60
	thumb_func_end sub_080A4478

	thumb_func_start ScriptCmd_setalpha
ScriptCmd_setalpha: @ 0x080A4510
	push {r4, r5, lr}
	ldr r2, _080A4544
	ldr r0, [r2]
	adds r1, r0, #1
	str r1, [r2]
	ldrb r5, [r0, #1]
	adds r0, r1, #1
	str r0, [r2]
	ldrb r4, [r1, #1]
	lsls r4, r4, #8
	adds r0, #1
	str r0, [r2]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	orrs r5, r4
	movs r0, #0x52
	adds r1, r5, #0
	bl SetGpuReg
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4544: .4byte 0x02038090
	thumb_func_end ScriptCmd_setalpha

	thumb_func_start ScriptCmd_setbldcnt
ScriptCmd_setbldcnt: @ 0x080A4548
	push {lr}
	ldr r3, _080A456C
	ldr r0, [r3]
	adds r2, r0, #1
	str r2, [r3]
	ldrb r1, [r0, #1]
	adds r0, r2, #1
	str r0, [r3]
	ldrb r2, [r2, #1]
	lsls r2, r2, #8
	adds r0, #1
	str r0, [r3]
	orrs r1, r2
	movs r0, #0x50
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080A456C: .4byte 0x02038090
	thumb_func_end ScriptCmd_setbldcnt

	thumb_func_start ScriptCmd_blendoff
ScriptCmd_blendoff: @ 0x080A4570
	push {lr}
	ldr r1, _080A4590
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080A4590: .4byte 0x02038090
	thumb_func_end ScriptCmd_blendoff

	thumb_func_start ScriptCmd_call
ScriptCmd_call: @ 0x080A4594
	push {r4, lr}
	ldr r4, _080A45C0
	ldr r1, [r4]
	adds r3, r1, #1
	str r3, [r4]
	ldr r2, _080A45C4
	adds r0, r1, #5
	str r0, [r2]
	ldrb r1, [r1, #1]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r3, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r3, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A45C0: .4byte 0x02038090
_080A45C4: .4byte 0x02038094
	thumb_func_end ScriptCmd_call

	thumb_func_start ScriptCmd_return
ScriptCmd_return: @ 0x080A45C8
	ldr r0, _080A45D4
	ldr r1, _080A45D8
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_080A45D4: .4byte 0x02038090
_080A45D8: .4byte 0x02038094
	thumb_func_end ScriptCmd_return

	thumb_func_start ScriptCmd_setarg
ScriptCmd_setarg: @ 0x080A45DC
	push {r4, r5, lr}
	ldr r5, _080A4608
	ldr r1, [r5]
	adds r0, r1, #1
	str r0, [r5]
	ldrb r2, [r1, #1]
	adds r3, r0, #1
	str r3, [r5]
	ldrb r4, [r0, #1]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	orrs r4, r0
	adds r1, #4
	str r1, [r5]
	ldr r0, _080A460C
	lsls r2, r2, #1
	adds r2, r2, r0
	strh r4, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4608: .4byte 0x02038090
_080A460C: .4byte 0x020380BE
	thumb_func_end ScriptCmd_setarg

	thumb_func_start ScriptCmd_choosetwoturnanim
ScriptCmd_choosetwoturnanim: @ 0x080A4610
	push {lr}
	ldr r3, _080A4648
	ldr r2, [r3]
	adds r0, r2, #1
	str r0, [r3]
	ldr r0, _080A464C
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A462A
	adds r0, r2, #5
	str r0, [r3]
_080A462A:
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_080A4648: .4byte 0x02038090
_080A464C: .4byte 0x020380D2
	thumb_func_end ScriptCmd_choosetwoturnanim

	thumb_func_start ScriptCmd_jumpifmoveturn
ScriptCmd_jumpifmoveturn: @ 0x080A4650
	push {r4, r5, lr}
	ldr r5, _080A4680
	ldr r4, [r5]
	adds r2, r4, #1
	str r2, [r5]
	ldrb r1, [r4, #1]
	adds r3, r2, #1
	str r3, [r5]
	ldr r0, _080A4684
	ldrb r0, [r0]
	cmp r1, r0
	bne _080A4688
	ldrb r1, [r2, #1]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r3, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r3, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r5]
	b _080A468C
	.align 2, 0
_080A4680: .4byte 0x02038090
_080A4684: .4byte 0x020380D2
_080A4688:
	adds r0, r4, #6
	str r0, [r5]
_080A468C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ScriptCmd_jumpifmoveturn

	thumb_func_start ScriptCmd_goto
ScriptCmd_goto: @ 0x080A4694
	ldr r3, _080A46B4
	ldr r0, [r3]
	adds r2, r0, #1
	str r2, [r3]
	ldrb r1, [r0, #1]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_080A46B4: .4byte 0x02038090
	thumb_func_end ScriptCmd_goto

	thumb_func_start IsContest
IsContest: @ 0x080A46B8
	push {lr}
	ldr r0, _080A46D0
	ldr r1, _080A46D4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A46D8
	movs r0, #0
	b _080A46DA
	.align 2, 0
_080A46D0: .4byte 0x03002360
_080A46D4: .4byte 0x00000439
_080A46D8:
	movs r0, #1
_080A46DA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsContest

	thumb_func_start ScriptCmd_fadetobg
ScriptCmd_fadetobg: @ 0x080A46E0
	push {r4, lr}
	ldr r1, _080A4714
	ldr r2, [r1]
	adds r0, r2, #1
	str r0, [r1]
	ldrb r4, [r2, #1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080A4718
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A471C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	ldr r1, _080A4720
	movs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4714: .4byte 0x02038090
_080A4718: .4byte 0x080A47BD
_080A471C: .4byte 0x03005B60
_080A4720: .4byte 0x020380D3
	thumb_func_end ScriptCmd_fadetobg

	thumb_func_start ScriptCmd_fadetobgfromset
ScriptCmd_fadetobgfromset: @ 0x080A4724
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _080A4764
	ldr r1, [r2]
	adds r0, r1, #1
	str r0, [r2]
	ldrb r3, [r1, #1]
	mov r8, r3
	ldrb r7, [r0, #1]
	ldrb r6, [r0, #2]
	adds r1, #4
	str r1, [r2]
	ldr r0, _080A4768
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4770
	ldr r1, _080A476C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #8]
	b _080A47A2
	.align 2, 0
_080A4764: .4byte 0x02038090
_080A4768: .4byte 0x080A47BD
_080A476C: .4byte 0x03005B60
_080A4770:
	ldr r0, _080A478C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4794
	ldr r1, _080A4790
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r7, [r0, #8]
	b _080A47A2
	.align 2, 0
_080A478C: .4byte 0x020380D7
_080A4790: .4byte 0x03005B60
_080A4794:
	ldr r1, _080A47B4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	mov r1, r8
	strh r1, [r0, #8]
_080A47A2:
	ldr r1, _080A47B8
	movs r0, #1
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A47B4: .4byte 0x03005B60
_080A47B8: .4byte 0x020380D3
	thumb_func_end ScriptCmd_fadetobgfromset

	thumb_func_start Task_FadeToBg
Task_FadeToBg: @ 0x080A47BC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080A47F0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r6, [r4, #0x1c]
	movs r0, #0x1c
	ldrsh r3, [r4, r0]
	adds r7, r1, #0
	cmp r3, #0
	bne _080A47F4
	str r3, [sp]
	movs r0, #0xe8
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginHardwarePaletteFade
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	b _080A4884
	.align 2, 0
_080A47F0: .4byte 0x03005B60
_080A47F4:
	ldr r2, _080A4810
	ldrb r1, [r2, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080A4884
	cmp r3, #1
	bne _080A4818
	adds r0, r6, #1
	strh r0, [r4, #0x1c]
	ldr r1, _080A4814
	movs r0, #2
	strb r0, [r1]
	b _080A485C
	.align 2, 0
_080A4810: .4byte 0x02037C74
_080A4814: .4byte 0x020380D3
_080A4818:
	cmp r3, #2
	bne _080A485C
	ldrh r0, [r4, #8]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080A4830
	bl LoadDefaultBg
	b _080A4836
_080A4830:
	lsrs r0, r2, #0x10
	bl LoadMoveBg
_080A4836:
	movs r0, #1
	str r0, [sp]
	movs r0, #0xe8
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginHardwarePaletteFade
	ldr r1, _080A4858
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x1c]
	adds r1, #1
	strh r1, [r0, #0x1c]
	b _080A4884
	.align 2, 0
_080A4858: .4byte 0x03005B60
_080A485C:
	ldrb r1, [r2, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080A4884
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #0x1c
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bne _080A4884
	adds r0, r5, #0
	bl DestroyTask
	ldr r0, _080A488C
	strb r4, [r0]
_080A4884:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A488C: .4byte 0x020380D3
	thumb_func_end Task_FadeToBg

	thumb_func_start LoadMoveBg
LoadMoveBg: @ 0x080A4890
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4918
	ldr r6, _080A4900
	lsls r4, r7, #1
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r0, r6, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r5, _080A4904
	adds r1, r5, #0
	bl LZDecompressVram
	bl sub_080A665C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, #0
	movs r3, #0
	bl sub_080A3FE8
	ldr r1, _080A4908
	ldr r0, _080A490C
	str r5, [r0]
	str r1, [r0, #4]
	ldr r1, _080A4910
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	adds r0, r4, r6
	ldr r0, [r0]
	ldr r1, _080A4914
	bl LZDecompressWram
	adds r6, #4
	adds r4, r4, r6
	ldr r4, [r4]
	bl sub_080A665C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadCompressedPalette
	b _080A4946
	.align 2, 0
_080A4900: .4byte 0x084FE460
_080A4904: .4byte 0x0201C000
_080A4908: .4byte 0x0600D000
_080A490C: .4byte 0x040000D4
_080A4910: .4byte 0x84000200
_080A4914: .4byte 0x06002000
_080A4918:
	ldr r5, _080A494C
	lsls r4, r7, #1
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r0, r5, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _080A4950
	bl LZDecompressWram
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _080A4954
	bl LZDecompressWram
	adds r5, #4
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x20
	movs r2, #0x20
	bl LoadCompressedPalette
_080A4946:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A494C: .4byte 0x084FE460
_080A4950: .4byte 0x0600D000
_080A4954: .4byte 0x06008000
	thumb_func_end LoadMoveBg

	thumb_func_start LoadDefaultBg
LoadDefaultBg: @ 0x080A4958
	push {lr}
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A496A
	bl LoadContestBgAfterMoveAnim
	b _080A496E
_080A496A:
	bl DrawMainBattleBackground
_080A496E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadDefaultBg

	thumb_func_start ScriptCmd_restorebg
ScriptCmd_restorebg: @ 0x080A4974
	push {lr}
	ldr r1, _080A49A4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080A49A8
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A49AC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _080A49B0
	strh r0, [r1, #8]
	ldr r1, _080A49B4
	movs r0, #1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A49A4: .4byte 0x02038090
_080A49A8: .4byte 0x080A47BD
_080A49AC: .4byte 0x03005B60
_080A49B0: .4byte 0x0000FFFF
_080A49B4: .4byte 0x020380D3
	thumb_func_end ScriptCmd_restorebg

	thumb_func_start ScriptCmd_waitbgfadeout
ScriptCmd_waitbgfadeout: @ 0x080A49B8
	push {lr}
	ldr r0, _080A49D0
	ldrb r0, [r0]
	cmp r0, #2
	bne _080A49DC
	ldr r1, _080A49D4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _080A49D8
	movs r0, #0
	b _080A49E0
	.align 2, 0
_080A49D0: .4byte 0x020380D3
_080A49D4: .4byte 0x02038090
_080A49D8: .4byte 0x0203809C
_080A49DC:
	ldr r1, _080A49E8
	movs r0, #1
_080A49E0:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A49E8: .4byte 0x0203809C
	thumb_func_end ScriptCmd_waitbgfadeout

	thumb_func_start ScriptCmd_waitforvisualfinish
ScriptCmd_waitforvisualfinish: @ 0x080A49EC
	push {lr}
	ldr r0, _080A4A04
	ldrb r2, [r0]
	cmp r2, #0
	bne _080A4A10
	ldr r0, _080A4A08
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	ldr r0, _080A4A0C
	strb r2, [r0]
	b _080A4A16
	.align 2, 0
_080A4A04: .4byte 0x020380D3
_080A4A08: .4byte 0x02038090
_080A4A0C: .4byte 0x0203809C
_080A4A10:
	ldr r1, _080A4A1C
	movs r0, #1
	strb r0, [r1]
_080A4A16:
	pop {r0}
	bx r0
	.align 2, 0
_080A4A1C: .4byte 0x0203809C
	thumb_func_end ScriptCmd_waitforvisualfinish

	thumb_func_start ScriptCmd_changebg
ScriptCmd_changebg: @ 0x080A4A20
	push {r4, lr}
	ldr r4, _080A4A3C
	ldr r1, [r4]
	adds r0, r1, #1
	str r0, [r4]
	ldrb r0, [r1, #1]
	bl LoadMoveBg
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4A3C: .4byte 0x02038090
	thumb_func_end ScriptCmd_changebg

	thumb_func_start BattleAnimAdjustPanning
BattleAnimAdjustPanning: @ 0x080A4A40
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4A88
	ldr r0, _080A4A80
	ldr r1, [r0]
	ldr r0, _080A4A84
	ldrb r2, [r0]
	ldr r1, [r1, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A4A88
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r4, #0xc0
	cmp r0, #0
	beq _080A4B1A
	movs r4, #0x3f
	b _080A4B1A
	.align 2, 0
_080A4A80: .4byte 0x02024174
_080A4A84: .4byte 0x020380D6
_080A4A88:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4AB0
	ldr r0, _080A4AA8
	ldr r1, _080A4AAC
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080A4B14
	cmp r0, #2
	bne _080A4B14
	cmp r4, #0x3f
	beq _080A4B26
	b _080A4B14
	.align 2, 0
_080A4AA8: .4byte 0x020380D6
_080A4AAC: .4byte 0x020380D7
_080A4AB0:
	ldr r0, _080A4AD8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4AEE
	ldr r0, _080A4ADC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4B1A
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x3f
	bne _080A4AE0
	movs r4, #0xc0
	b _080A4B1A
	.align 2, 0
_080A4AD8: .4byte 0x020380D6
_080A4ADC: .4byte 0x020380D7
_080A4AE0:
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080A4B1A
	rsbs r0, r1, #0
	lsls r0, r0, #0x18
	b _080A4B18
_080A4AEE:
	ldr r0, _080A4B10
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080A4B14
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x40
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080A4B1A
	movs r4, #0x3f
	b _080A4B1A
	.align 2, 0
_080A4B10: .4byte 0x020380D7
_080A4B14:
	lsls r0, r4, #0x18
	rsbs r0, r0, #0
_080A4B18:
	lsrs r4, r0, #0x18
_080A4B1A:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x3f
	ble _080A4B26
	movs r4, #0x3f
	b _080A4B34
_080A4B26:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x40
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080A4B34
	movs r4, #0xc0
_080A4B34:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end BattleAnimAdjustPanning

	thumb_func_start BattleAnimAdjustPanning2
BattleAnimAdjustPanning2: @ 0x080A4B40
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4B88
	ldr r0, _080A4B80
	ldr r1, [r0]
	ldr r0, _080A4B84
	ldrb r2, [r0]
	ldr r1, [r1, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A4B88
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r4, #0xc0
	cmp r0, #0
	beq _080A4BA6
	movs r4, #0x3f
	b _080A4BA6
	.align 2, 0
_080A4B80: .4byte 0x02024174
_080A4B84: .4byte 0x020380D6
_080A4B88:
	ldr r0, _080A4BB0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4BA0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4BA6
_080A4BA0:
	lsls r0, r4, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x18
_080A4BA6:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A4BB0: .4byte 0x020380D6
	thumb_func_end BattleAnimAdjustPanning2

	thumb_func_start KeepPanInRange
KeepPanInRange: @ 0x080A4BB4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0x3f
	ble _080A4BC4
	movs r1, #0x3f
	b _080A4BCE
_080A4BC4:
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r2, r0
	bge _080A4BCE
	ldr r1, _080A4BD8
_080A4BCE:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080A4BD8: .4byte 0x0000FFC0
	thumb_func_end KeepPanInRange

	thumb_func_start CalculatePanIncrement
CalculatePanIncrement: @ 0x080A4BDC
	push {lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r3, r2, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bge _080A4BFA
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080A4C0A
	b _080A4C08
_080A4BFA:
	cmp r0, r1
	ble _080A4C10
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080A4C08
	rsbs r0, r0, #0
_080A4C08:
	rsbs r0, r0, #0
_080A4C0A:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080A4C12
_080A4C10:
	movs r0, #0
_080A4C12:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CalculatePanIncrement

	thumb_func_start ScriptCmd_playsewithpan
ScriptCmd_playsewithpan: @ 0x080A4C1C
	push {r4, r5, lr}
	ldr r5, _080A4C50
	ldr r0, [r5]
	adds r1, r0, #1
	str r1, [r5]
	ldrb r4, [r0, #1]
	ldrb r0, [r1, #1]
	lsls r0, r0, #8
	orrs r4, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl BattleAnimAdjustPanning
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl PlaySE12WithPanning
	ldr r0, [r5]
	adds r0, #3
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4C50: .4byte 0x02038090
	thumb_func_end ScriptCmd_playsewithpan

	thumb_func_start ScriptCmd_setpan
ScriptCmd_setpan: @ 0x080A4C54
	push {r4, lr}
	ldr r4, _080A4C7C
	ldr r1, [r4]
	adds r0, r1, #1
	str r0, [r4]
	movs r0, #1
	ldrsb r0, [r1, r0]
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl SE12PanpotControl
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4C7C: .4byte 0x02038090
	thumb_func_end ScriptCmd_setpan

	thumb_func_start ScriptCmd_panse_1B
ScriptCmd_panse_1B: @ 0x080A4C80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080A4D30
	mov sl, r0
	ldr r0, [r0]
	adds r1, r0, #1
	mov r2, sl
	str r1, [r2]
	ldrb r0, [r0, #1]
	mov sb, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #8
	mov r2, sb
	orrs r2, r0
	mov sb, r2
	ldrb r4, [r1, #3]
	ldrb r6, [r1, #4]
	ldrb r7, [r1, #5]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl BattleAnimAdjustPanning
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, r4, #0
	bl BattleAnimAdjustPanning
	mov r8, r0
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	adds r0, r5, #0
	mov r1, r8
	adds r2, r6, #0
	bl CalculatePanIncrement
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A4D34
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A4D38
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #8]
	mov r2, r8
	strh r2, [r1, #0xa]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r1, #0xc]
	strh r7, [r1, #0xe]
	strh r5, [r1, #0x10]
	mov r0, sb
	adds r1, r5, #0
	bl PlaySE12WithPanning
	ldr r1, _080A4D3C
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r0, #6
	str r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4D30: .4byte 0x02038090
_080A4D34: .4byte 0x080A4D41
_080A4D38: .4byte 0x03005B60
_080A4D3C: .4byte 0x0203809F
	thumb_func_end ScriptCmd_panse_1B

	thumb_func_start Task_PanFromInitialToTarget
Task_PanFromInitialToTarget: @ 0x080A4D40
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r7, #0
	ldr r1, _080A4D84
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #0x18]
	adds r1, r0, #1
	strh r1, [r2, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _080A4DC4
	strh r7, [r2, #0x18]
	ldrh r6, [r2, #8]
	ldrh r3, [r2, #0xa]
	movs r4, #0x10
	ldrsh r0, [r2, r4]
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strh r4, [r2, #0x10]
	cmp r1, #0
	bne _080A4D88
	lsls r2, r3, #0x10
	b _080A4DAC
	.align 2, 0
_080A4D84: .4byte 0x03005B60
_080A4D88:
	lsls r1, r6, #0x10
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	adds r2, r0, #0
	cmp r1, r2
	bge _080A4D9E
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	blt _080A4DA8
	b _080A4DAC
_080A4D9E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	bgt _080A4DA8
	movs r7, #1
_080A4DA8:
	cmp r7, #0
	beq _080A4DBC
_080A4DAC:
	lsrs r4, r2, #0x10
	adds r0, r5, #0
	bl DestroyTask
	ldr r1, _080A4DCC
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_080A4DBC:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl SE12PanpotControl
_080A4DC4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4DCC: .4byte 0x0203809F
	thumb_func_end Task_PanFromInitialToTarget

	thumb_func_start ScriptCmd_panse_26
ScriptCmd_panse_26: @ 0x080A4DD0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, _080A4E54
	mov sb, r0
	ldr r0, [r0]
	adds r1, r0, #1
	mov r2, sb
	str r1, [r2]
	ldrb r0, [r0, #1]
	mov r8, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #8
	mov r2, r8
	orrs r2, r0
	mov r8, r2
	ldrb r4, [r1, #2]
	ldrb r5, [r1, #3]
	ldrb r6, [r1, #4]
	ldrb r1, [r1, #5]
	mov sl, r1
	ldr r0, _080A4E58
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A4E5C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r1, #8]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	strh r5, [r1, #0xa]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	strh r6, [r1, #0xc]
	mov r0, sl
	strh r0, [r1, #0xe]
	strh r4, [r1, #0x10]
	mov r0, r8
	adds r1, r4, #0
	bl PlaySE12WithPanning
	ldr r1, _080A4E60
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	adds r0, #6
	str r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E54: .4byte 0x02038090
_080A4E58: .4byte 0x080A4D41
_080A4E5C: .4byte 0x03005B60
_080A4E60: .4byte 0x0203809F
	thumb_func_end ScriptCmd_panse_26

	thumb_func_start ScriptCmd_panse_27
ScriptCmd_panse_27: @ 0x080A4E64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080A4F14
	mov sl, r0
	ldr r0, [r0]
	adds r1, r0, #1
	mov r2, sl
	str r1, [r2]
	ldrb r0, [r0, #1]
	mov sb, r0
	ldrb r0, [r1, #1]
	lsls r0, r0, #8
	mov r2, sb
	orrs r2, r0
	mov sb, r2
	ldrb r4, [r1, #3]
	ldrb r0, [r1, #4]
	mov r8, r0
	ldrb r7, [r1, #5]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl BattleAnimAdjustPanning2
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, r4, #0
	bl BattleAnimAdjustPanning2
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	mov r0, r8
	bl BattleAnimAdjustPanning2
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A4F18
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A4F1C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	strh r6, [r1, #8]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	strh r5, [r1, #0xa]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r1, #0xc]
	strh r7, [r1, #0xe]
	strh r6, [r1, #0x10]
	mov r0, sb
	adds r1, r6, #0
	bl PlaySE12WithPanning
	ldr r1, _080A4F20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r2, sl
	ldr r0, [r2]
	adds r0, #6
	str r0, [r2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4F14: .4byte 0x02038090
_080A4F18: .4byte 0x080A4D41
_080A4F1C: .4byte 0x03005B60
_080A4F20: .4byte 0x0203809F
	thumb_func_end ScriptCmd_panse_27

	thumb_func_start ScriptCmd_loopsewithpan
ScriptCmd_loopsewithpan: @ 0x080A4F24
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r6, _080A4F9C
	ldr r0, [r6]
	adds r1, r0, #1
	str r1, [r6]
	ldrb r5, [r0, #1]
	ldrb r0, [r1, #1]
	lsls r0, r0, #8
	orrs r5, r0
	ldrb r0, [r1, #3]
	mov r8, r0
	ldrb r2, [r1, #4]
	mov sb, r2
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl BattleAnimAdjustPanning
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A4FA0
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A4FA4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #8]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r1, #0xa]
	mov r2, r8
	strh r2, [r1, #0xc]
	mov r2, sb
	strh r2, [r1, #0xe]
	mov r2, r8
	strh r2, [r1, #0x18]
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, _080A4FA8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #5
	str r0, [r6]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4F9C: .4byte 0x02038090
_080A4FA0: .4byte 0x080A4FAD
_080A4FA4: .4byte 0x03005B60
_080A4FA8: .4byte 0x0203809F
	thumb_func_end ScriptCmd_loopsewithpan

	thumb_func_start Task_LoopAndPlaySE
Task_LoopAndPlaySE: @ 0x080A4FAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080A5000
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #0x18]
	adds r1, r0, #1
	strh r1, [r2, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _080A4FFA
	movs r0, #0
	strh r0, [r2, #0x18]
	ldrh r0, [r2, #8]
	ldrb r1, [r2, #0xa]
	ldrh r4, [r2, #0xe]
	subs r4, #1
	strh r4, [r2, #0xe]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl PlaySE12WithPanning
	cmp r4, #0
	bne _080A4FFA
	adds r0, r5, #0
	bl DestroyTask
	ldr r1, _080A5004
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_080A4FFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5000: .4byte 0x03005B60
_080A5004: .4byte 0x0203809F
	thumb_func_end Task_LoopAndPlaySE

	thumb_func_start ScriptCmd_waitplaysewithpan
ScriptCmd_waitplaysewithpan: @ 0x080A5008
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r6, _080A506C
	ldr r0, [r6]
	adds r1, r0, #1
	str r1, [r6]
	ldrb r5, [r0, #1]
	ldrb r0, [r1, #1]
	lsls r0, r0, #8
	orrs r5, r0
	ldrb r0, [r1, #3]
	mov r8, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl BattleAnimAdjustPanning
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A5070
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A5074
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #8]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r1, #0xa]
	mov r0, r8
	strh r0, [r1, #0xc]
	ldr r1, _080A5078
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #4
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A506C: .4byte 0x02038090
_080A5070: .4byte 0x080A507D
_080A5074: .4byte 0x03005B60
_080A5078: .4byte 0x0203809F
	thumb_func_end ScriptCmd_waitplaysewithpan

	thumb_func_start Task_WaitAndPlaySE
Task_WaitAndPlaySE: @ 0x080A507C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080A50B8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #0xc]
	subs r1, r0, #1
	strh r1, [r2, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080A50B0
	ldrh r0, [r2, #8]
	movs r1, #0xa
	ldrsb r1, [r2, r1]
	bl PlaySE12WithPanning
	adds r0, r4, #0
	bl DestroyTask
	ldr r1, _080A50BC
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_080A50B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A50B8: .4byte 0x03005B60
_080A50BC: .4byte 0x0203809F
	thumb_func_end Task_WaitAndPlaySE

	thumb_func_start ScriptCmd_createsoundtask
ScriptCmd_createsoundtask: @ 0x080A50C0
	push {r4, r5, r6, lr}
	ldr r4, _080A5128
	ldr r1, [r4]
	adds r3, r1, #1
	str r3, [r4]
	ldrb r2, [r1, #1]
	ldrb r0, [r3, #1]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r0, [r3, #2]
	lsls r0, r0, #0x10
	adds r2, r2, r0
	ldrb r0, [r3, #3]
	lsls r0, r0, #0x18
	adds r6, r2, r0
	adds r0, r1, #5
	str r0, [r4]
	ldrb r0, [r1, #5]
	adds r1, #6
	str r1, [r4]
	cmp r0, #0
	beq _080A510A
	adds r5, r4, #0
	ldr r4, _080A512C
	adds r3, r0, #0
_080A50F2:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r4]
	adds r2, #2
	str r2, [r5]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bne _080A50F2
_080A510A:
	adds r0, r6, #0
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r6
	ldr r1, _080A5130
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5128: .4byte 0x02038090
_080A512C: .4byte 0x020380BE
_080A5130: .4byte 0x0203809F
	thumb_func_end ScriptCmd_createsoundtask

	thumb_func_start ScriptCmd_waitsound
ScriptCmd_waitsound: @ 0x080A5134
	push {r4, r5, lr}
	ldr r0, _080A516C
	ldrb r5, [r0]
	cmp r5, #0
	bne _080A517C
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080A5194
	ldr r4, _080A5170
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x5a
	bls _080A5182
	ldr r0, _080A5174
	bl m4aMPlayStop
	ldr r0, _080A5178
	bl m4aMPlayStop
	strh r5, [r4]
	b _080A51A6
	.align 2, 0
_080A516C: .4byte 0x0203809F
_080A5170: .4byte 0x020380CE
_080A5174: .4byte 0x03007510
_080A5178: .4byte 0x03007550
_080A517C:
	ldr r1, _080A518C
	movs r0, #0
	strh r0, [r1]
_080A5182:
	ldr r1, _080A5190
	movs r0, #1
	strb r0, [r1]
	b _080A51A6
	.align 2, 0
_080A518C: .4byte 0x020380CE
_080A5190: .4byte 0x0203809C
_080A5194:
	ldr r0, _080A51AC
	movs r2, #0
	strh r1, [r0]
	ldr r1, _080A51B0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080A51B4
	strb r2, [r0]
_080A51A6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A51AC: .4byte 0x020380CE
_080A51B0: .4byte 0x02038090
_080A51B4: .4byte 0x0203809C
	thumb_func_end ScriptCmd_waitsound

	thumb_func_start ScriptCmd_jumpargeq
ScriptCmd_jumpargeq: @ 0x080A51B8
	push {r4, r5, r6, lr}
	ldr r5, _080A51F8
	ldr r4, [r5]
	adds r3, r4, #1
	str r3, [r5]
	ldrb r2, [r4, #1]
	ldrb r1, [r3, #1]
	ldrb r0, [r3, #2]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _080A51FC
	lsls r2, r2, #1
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	bne _080A5200
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r5]
	b _080A5206
	.align 2, 0
_080A51F8: .4byte 0x02038090
_080A51FC: .4byte 0x020380BE
_080A5200:
	adds r0, r4, #0
	adds r0, #8
	str r0, [r5]
_080A5206:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ScriptCmd_jumpargeq

	thumb_func_start ScriptCmd_jumpifcontest
ScriptCmd_jumpifcontest: @ 0x080A520C
	push {r4, lr}
	ldr r4, _080A523C
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5240
	ldr r2, [r4]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r4]
	b _080A5246
	.align 2, 0
_080A523C: .4byte 0x02038090
_080A5240:
	ldr r0, [r4]
	adds r0, #4
	str r0, [r4]
_080A5246:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ScriptCmd_jumpifcontest

	thumb_func_start ScriptCmd_monbgprio_28
ScriptCmd_monbgprio_28: @ 0x080A524C
	push {r4, lr}
	ldr r0, _080A5260
	ldr r1, [r0]
	ldrb r2, [r1, #1]
	adds r1, #2
	str r1, [r0]
	cmp r2, #0
	beq _080A5268
	ldr r0, _080A5264
	b _080A526A
	.align 2, 0
_080A5260: .4byte 0x02038090
_080A5264: .4byte 0x020380D7
_080A5268:
	ldr r0, _080A52A0
_080A526A:
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A529A
	cmp r4, #0
	beq _080A5286
	cmp r4, #3
	bne _080A529A
_080A5286:
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #2
	movs r1, #4
	movs r2, #2
	bl SetAnimBgAttribute
_080A529A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A52A0: .4byte 0x020380D6
	thumb_func_end ScriptCmd_monbgprio_28

	thumb_func_start ScriptCmd_monbgprio_29
ScriptCmd_monbgprio_29: @ 0x080A52A4
	push {lr}
	ldr r0, _080A52D0
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A52CC
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #2
	movs r1, #4
	movs r2, #2
	bl SetAnimBgAttribute
_080A52CC:
	pop {r0}
	bx r0
	.align 2, 0
_080A52D0: .4byte 0x02038090
	thumb_func_end ScriptCmd_monbgprio_29

	thumb_func_start ScriptCmd_monbgprio_2A
ScriptCmd_monbgprio_2A: @ 0x080A52D4
	push {r4, r5, r6, r7, lr}
	ldr r1, _080A5304
	ldr r0, [r1]
	ldrb r6, [r0, #1]
	adds r0, #2
	str r0, [r1]
	ldr r7, _080A5308
	ldrb r0, [r7]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r5, _080A530C
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _080A5340
	cmp r6, #0
	beq _080A5310
	ldrb r0, [r5]
	b _080A5312
	.align 2, 0
_080A5304: .4byte 0x02038090
_080A5308: .4byte 0x020380D6
_080A530C: .4byte 0x020380D7
_080A5310:
	ldrb r0, [r7]
_080A5312:
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A5340
	cmp r4, #0
	beq _080A532C
	cmp r4, #3
	bne _080A5340
_080A532C:
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #2
	movs r1, #4
	movs r2, #2
	bl SetAnimBgAttribute
_080A5340:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ScriptCmd_monbgprio_2A

	thumb_func_start ScriptCmd_invisible
ScriptCmd_invisible: @ 0x080A5348
	push {r4, lr}
	ldr r4, _080A537C
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _080A5370
	ldr r1, _080A5380
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080A5370:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A537C: .4byte 0x02038090
_080A5380: .4byte 0x020205AC
	thumb_func_end ScriptCmd_invisible

	thumb_func_start ScriptCmd_visible
ScriptCmd_visible: @ 0x080A5384
	push {r4, lr}
	ldr r4, _080A53BC
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _080A53AE
	ldr r1, _080A53C0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
_080A53AE:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A53BC: .4byte 0x02038090
_080A53C0: .4byte 0x020205AC
	thumb_func_end ScriptCmd_visible

	thumb_func_start ScriptCmd_doublebattle_2D
ScriptCmd_doublebattle_2D: @ 0x080A53C4
	push {r4, r5, r6, r7, lr}
	ldr r1, _080A5410
	ldr r0, [r1]
	ldrb r7, [r0, #1]
	adds r0, #2
	str r0, [r1]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A546E
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A546E
	ldr r6, _080A5414
	ldrb r0, [r6]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r5, _080A5418
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080A546E
	cmp r7, #0
	bne _080A541C
	ldrb r0, [r6]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	b _080A5428
	.align 2, 0
_080A5410: .4byte 0x02038090
_080A5414: .4byte 0x020380D6
_080A5418: .4byte 0x020380D7
_080A541C:
	ldrb r0, [r5]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #1
_080A5428:
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _080A546E
	ldr r1, _080A5464
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r2, r0, r1
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	cmp r4, #2
	bne _080A5458
	ldrb r0, [r2, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2, #5]
_080A5458:
	cmp r4, #1
	bne _080A5468
	movs r0, #0
	bl sub_080A4044
	b _080A546E
	.align 2, 0
_080A5464: .4byte 0x020205AC
_080A5468:
	movs r0, #1
	bl sub_080A4044
_080A546E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ScriptCmd_doublebattle_2D

	thumb_func_start ScriptCmd_doublebattle_2E
ScriptCmd_doublebattle_2E: @ 0x080A5474
	push {r4, r5, r6, r7, lr}
	ldr r1, _080A54C0
	ldr r0, [r1]
	ldrb r7, [r0, #1]
	adds r0, #2
	str r0, [r1]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A5500
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5500
	ldr r6, _080A54C4
	ldrb r0, [r6]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r5, _080A54C8
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080A5500
	cmp r7, #0
	bne _080A54CC
	ldrb r0, [r6]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	b _080A54D8
	.align 2, 0
_080A54C0: .4byte 0x02038090
_080A54C4: .4byte 0x020380D6
_080A54C8: .4byte 0x020380D7
_080A54CC:
	ldrb r0, [r5]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #1
_080A54D8:
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _080A5500
	cmp r4, #2
	bne _080A5500
	ldr r1, _080A5508
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #5]
_080A5500:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5508: .4byte 0x020205AC
	thumb_func_end ScriptCmd_doublebattle_2E

	thumb_func_start sub_080A550C
sub_080A550C: @ 0x080A550C
	push {lr}
	ldr r0, _080A5528
	bl m4aMPlayStop
	ldr r0, _080A552C
	bl m4aMPlayStop
	ldr r1, _080A5530
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A5528: .4byte 0x03007510
_080A552C: .4byte 0x03007550
_080A5530: .4byte 0x02038090
	thumb_func_end sub_080A550C

