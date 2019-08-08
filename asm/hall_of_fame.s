.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start VBlankCB_HallOfFame
VBlankCB_HallOfFame: @ 0x08173330
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_HallOfFame

	thumb_func_start CB2_HallOfFame
CB2_HallOfFame: @ 0x08173344
	push {lr}
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_HallOfFame

	thumb_func_start InitHallOfFameScreen
InitHallOfFameScreen: @ 0x08173360
	push {r4, lr}
	sub sp, #4
	ldr r0, _08173380
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	bls _08173374
	b _0817346C
_08173374:
	lsls r0, r0, #2
	ldr r1, _08173384
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08173380: .4byte 0x03002360
_08173384: .4byte 0x08173388
_08173388: @ jump table
	.4byte _0817339C @ case 0
	.4byte _081733CC @ case 1
	.4byte _081733D2 @ case 2
	.4byte _08173404 @ case 3
	.4byte _08173440 @ case 4
_0817339C:
	movs r0, #0
	bl SetVBlankCallback
	bl ClearVramOamPltt_LoadHofPal
	ldr r4, _081733C0
	ldr r0, _081733C4
	bl AllocZeroed
	str r0, [r4]
	ldr r0, _081733C8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	b _0817346C
	.align 2, 0
_081733C0: .4byte 0x0203B9A8
_081733C4: .4byte 0x00002014
_081733C8: .4byte 0x03002360
_081733CC:
	bl sub_08174E74
	b _08173426
_081733D2:
	ldr r1, _081733FC
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0xe2
	lsls r1, r1, #3
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	bl sub_08174EB0
	ldr r0, _08173400
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1]
	b _08173426
	.align 2, 0
_081733FC: .4byte 0x00003F42
_08173400: .4byte 0x0203B9A8
_08173404:
	bl sub_08174F28
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0817346C
	ldr r0, _08173438
	bl SetVBlankCallback
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_08173426:
	ldr r1, _0817343C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0817346C
	.align 2, 0
_08173438: .4byte 0x08173331
_0817343C: .4byte 0x03002360
_08173440:
	bl UpdatePaletteFade
	ldr r0, _08173464
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817346C
	ldr r0, _08173468
	bl SetMainCallback2
	movs r0, #0xda
	lsls r0, r0, #1
	bl PlayBGM
	movs r0, #0
	b _0817346E
	.align 2, 0
_08173464: .4byte 0x02037C74
_08173468: .4byte 0x08173345
_0817346C:
	movs r0, #1
_0817346E:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end InitHallOfFameScreen

	thumb_func_start CB2_DoHallOfFameScreen
CB2_DoHallOfFameScreen: @ 0x08173478
	push {r4, lr}
	bl InitHallOfFameScreen
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081734A8
	ldr r0, _081734B0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081734B4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	ldr r4, _081734B8
	movs r0, #0x78
	bl AllocZeroed
	str r0, [r4]
_081734A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081734B0: .4byte 0x08173501
_081734B4: .4byte 0x03005B60
_081734B8: .4byte 0x0203B9A4
	thumb_func_end CB2_DoHallOfFameScreen

	thumb_func_start CB2_DoHallOfFameScreenDontSaveData
CB2_DoHallOfFameScreenDontSaveData: @ 0x081734BC
	push {r4, lr}
	bl InitHallOfFameScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081734EC
	ldr r0, _081734F4
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081734F8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1, #8]
	ldr r4, _081734FC
	movs r0, #0x78
	bl AllocZeroed
	str r0, [r4]
_081734EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081734F4: .4byte 0x08173501
_081734F8: .4byte 0x03005B60
_081734FC: .4byte 0x0203B9A4
	thumb_func_end CB2_DoHallOfFameScreenDontSaveData

	thumb_func_start Task_Hof_InitMonData
Task_Hof_InitMonData: @ 0x08173500
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _081735DC
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	movs r7, #0
	ldr r0, _081735E0
	mov sb, r0
_08173524:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _081735E4
	adds r6, r1, r0
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	cmp r5, #0
	beq _081735F0
	adds r0, r6, #0
	movs r1, #0x41
	bl GetMonData
	mov r1, sb
	ldr r3, [r1]
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r3, r3, r4
	ldr r2, _081735E8
	adds r1, r2, #0
	ands r0, r1
	ldrh r1, [r3, #8]
	ldr r5, _081735EC
	adds r2, r5, #0
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #8]
	adds r0, r6, #0
	movs r1, #1
	bl GetMonData
	mov r2, sb
	ldr r1, [r2]
	adds r1, r1, r4
	str r0, [r1]
	adds r0, r6, #0
	movs r1, #0
	bl GetMonData
	mov r5, sb
	ldr r1, [r5]
	adds r1, #4
	adds r1, r1, r4
	str r0, [r1]
	adds r0, r6, #0
	movs r1, #0x38
	bl GetMonData
	ldr r2, [r5]
	adds r2, r2, r4
	lsls r0, r0, #1
	ldrb r3, [r2, #9]
	movs r1, #1
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #9]
	adds r0, r6, #0
	movs r1, #2
	mov r2, sp
	bl GetMonData
	movs r2, #0
	mov r6, r8
	lsls r5, r6, #2
	ldr r3, _081735E0
_081735AE:
	ldr r0, [r3]
	adds r1, r2, r4
	adds r0, #0xa
	adds r0, r0, r1
	mov r6, sp
	adds r1, r6, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #9
	bls _081735AE
	ldr r0, _081735DC
	mov r2, r8
	adds r1, r5, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
	b _08173624
	.align 2, 0
_081735DC: .4byte 0x03005B60
_081735E0: .4byte 0x0203B9A4
_081735E4: .4byte 0x02024190
_081735E8: .4byte 0x000001FF
_081735EC: .4byte 0xFFFFFE00
_081735F0:
	mov r6, sb
	ldr r3, [r6]
	lsls r2, r7, #2
	adds r2, r2, r7
	lsls r2, r2, #2
	adds r4, r3, r2
	ldrh r0, [r4, #8]
	ldr r6, _08173678
	adds r1, r6, #0
	ands r0, r1
	strh r0, [r4, #8]
	str r5, [r4]
	adds r3, #4
	adds r3, r3, r2
	str r5, [r3]
	ldrb r1, [r4, #9]
	movs r0, #1
	ands r0, r1
	strb r0, [r4, #9]
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0xff
	strb r1, [r0, #0xa]
	mov r2, r8
	lsls r5, r2, #2
_08173624:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #5
	bhi _08173630
	b _08173524
_08173630:
	ldr r0, _0817367C
	movs r3, #0
	str r3, [r0]
	ldr r4, _08173680
	mov r6, r8
	adds r1, r5, r6
	lsls r1, r1, #3
	adds r2, r1, r4
	strh r3, [r2, #0xa]
	movs r0, #0xff
	strh r0, [r2, #0x10]
	movs r7, #0
	adds r3, r4, #0
	adds r3, #8
	movs r2, #0xff
_0817364E:
	adds r0, r7, #5
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #5
	bls _0817364E
	mov r1, r8
	adds r0, r5, r1
	lsls r0, r0, #3
	adds r1, r0, r4
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08173688
	ldr r0, _08173684
	b _0817368A
	.align 2, 0
_08173678: .4byte 0xFFFFFE00
_0817367C: .4byte 0x0203B9A0
_08173680: .4byte 0x03005B60
_08173684: .4byte 0x08173871
_08173688:
	ldr r0, _0817369C
_0817368A:
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817369C: .4byte 0x081736A1
	thumb_func_end Task_Hof_InitMonData

	thumb_func_start Task_Hof_InitTeamSaveData
Task_Hof_InitTeamSaveData: @ 0x081736A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r7, _081736C8
	ldr r0, _081736CC
	ldrb r0, [r0]
	cmp r0, #0
	bne _081736D0
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r7, #0
	movs r1, #0
	bl memset
	b _081736EA
	.align 2, 0
_081736C8: .4byte 0x0201C000
_081736CC: .4byte 0x0203B9B0
_081736D0:
	movs r0, #3
	bl Save_LoadGameData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081736EA
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r7, #0
	movs r1, #0
	bl memset
_081736EA:
	movs r5, #0
	ldrh r1, [r7, #8]
	ldr r2, _08173790
	adds r0, r2, #0
	ands r0, r1
	mov r1, sb
	lsls r1, r1, #2
	mov r8, r1
	cmp r0, #0
	beq _08173714
_081736FE:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r7, #0x78
	cmp r5, #0x31
	bhi _08173718
	ldrh r1, [r7, #8]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _081736FE
_08173714:
	cmp r5, #0x31
	bls _0817373A
_08173718:
	ldr r4, _08173794
	adds r6, r4, #0
	adds r4, #0x78
	movs r5, #0
	subs r7, #0x78
_08173722:
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x78
	bl memcpy
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, #0x78
	adds r4, #0x78
	cmp r5, #0x30
	bls _08173722
_0817373A:
	ldr r0, _08173798
	ldr r1, [r0]
	adds r0, r7, #0
	movs r2, #0x78
	bl memcpy
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _0817379C
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
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _081737A0
	mov r0, r8
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081737A4
	str r1, [r0]
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08173790: .4byte 0x000001FF
_08173794: .4byte 0x0201C000
_08173798: .4byte 0x0203B9A4
_0817379C: .4byte 0x08277071
_081737A0: .4byte 0x03005B60
_081737A4: .4byte 0x081737A9
	thumb_func_end Task_Hof_InitTeamSaveData

	thumb_func_start Task_Hof_TrySaveData
Task_Hof_TrySaveData: @ 0x081737A8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08173804
	ldr r0, _08173808
	str r0, [r1]
	movs r0, #3
	bl TrySavingData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08173818
	ldr r0, _0817380C
	ldr r0, [r0]
	cmp r0, #0
	beq _08173818
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #3
	bl UnsetBgTilemapBuffer
	bl FreeAllWindowBuffers
	ldr r5, _08173810
	ldr r0, [r5]
	cmp r0, #0
	beq _081737EA
	bl Free
	movs r0, #0
	str r0, [r5]
_081737EA:
	ldr r5, _08173814
	ldr r0, [r5]
	cmp r0, #0
	beq _081737FA
	bl Free
	movs r0, #0
	str r0, [r5]
_081737FA:
	adds r0, r4, #0
	bl DestroyTask
	b _08173830
	.align 2, 0
_08173804: .4byte 0x03005F54
_08173808: .4byte 0x081734BD
_0817380C: .4byte 0x03005F3C
_08173810: .4byte 0x0203B9A8
_08173814: .4byte 0x0203B9A4
_08173818:
	movs r0, #0x37
	bl PlaySE
	ldr r1, _08173838
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0817383C
	str r1, [r0]
	movs r1, #0x20
	strh r1, [r0, #0xe]
_08173830:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08173838: .4byte 0x03005B60
_0817383C: .4byte 0x08173841
	thumb_func_end Task_Hof_TrySaveData

	thumb_func_start Task_Hof_WaitForFrames
Task_Hof_WaitForFrames: @ 0x08173840
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08173860
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08173864
	subs r0, r2, #1
	strh r0, [r1, #0xe]
	b _08173868
	.align 2, 0
_08173860: .4byte 0x03005B60
_08173864:
	ldr r0, _0817386C
	str r0, [r1]
_08173868:
	pop {r0}
	bx r0
	.align 2, 0
_0817386C: .4byte 0x08173871
	thumb_func_end Task_Hof_WaitForFrames

	thumb_func_start Task_Hof_SetMonDisplayTask
Task_Hof_SetMonDisplayTask: @ 0x08173870
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08173884
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _08173888
	str r0, [r1]
	bx lr
	.align 2, 0
_08173884: .4byte 0x03005B60
_08173888: .4byte 0x0817388D
	thumb_func_end Task_Hof_SetMonDisplayTask

	thumb_func_start Task_Hof_DisplayMon
Task_Hof_DisplayMon: @ 0x0817388C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _081738C4
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r6, [r1, #0xa]
	ldr r2, _081738C8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r7, r2, r0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #3
	ble _081738D0
	ldr r1, _081738CC
	b _081738D2
	.align 2, 0
_081738C4: .4byte 0x03005B60
_081738C8: .4byte 0x0203B9A4
_081738CC: .4byte 0x085C6470
_081738D0:
	ldr r1, _08173988
_081738D2:
	lsls r2, r6, #3
	adds r0, r2, r1
	ldrh r3, [r0]
	adds r0, r1, #2
	adds r0, r2, r0
	ldrh r4, [r0]
	adds r0, r1, #4
	adds r0, r2, r0
	ldrh r0, [r0]
	mov sb, r0
	adds r1, #6
	adds r2, r2, r1
	ldrh r5, [r2]
	ldrh r2, [r7, #8]
	ldr r0, _0817398C
	ands r0, r2
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _08173904
	lsls r0, r5, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r5, r0, #0x10
_08173904:
	lsls r0, r2, #0x17
	lsrs r0, r0, #0x17
	ldr r1, [r7]
	ldr r2, [r7, #4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r3, [sp]
	lsls r3, r4, #0x10
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	ldr r3, _08173990
	str r3, [sp, #0xc]
	movs r3, #1
	bl CreatePicSprite2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _08173994
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r4
	movs r1, #0
	mov ip, r1
	mov r1, sb
	strh r1, [r3, #0x30]
	strh r5, [r3, #0x32]
	mov r1, ip
	strh r1, [r3, #0x2e]
	ldrh r1, [r7, #8]
	lsls r1, r1, #0x17
	lsrs r1, r1, #0x17
	strh r1, [r3, #0x3c]
	adds r4, #0x1c
	adds r2, r2, r4
	ldr r1, _08173998
	str r1, [r2]
	ldr r5, _0817399C
	adds r1, r6, #5
	lsls r1, r1, #1
	mov r2, r8
	lsls r4, r2, #2
	add r4, r8
	lsls r4, r4, #3
	adds r1, r1, r4
	adds r2, r5, #0
	adds r2, #8
	adds r1, r1, r2
	strh r0, [r1]
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	adds r4, r4, r5
	ldr r0, _081739A0
	str r0, [r4]
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08173988: .4byte 0x085C64A0
_0817398C: .4byte 0x000001FF
_08173990: .4byte 0x0000FFFF
_08173994: .4byte 0x020205AC
_08173998: .4byte 0x08175025
_0817399C: .4byte 0x03005B60
_081739A0: .4byte 0x081739A5
	thumb_func_end Task_Hof_DisplayMon

	thumb_func_start Task_Hof_PrintMonInfoAfterAnimating
Task_Hof_PrintMonInfoAfterAnimating: @ 0x081739A4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _08173A04
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #3
	adds r5, r3, r4
	ldrh r0, [r5, #0xa]
	ldr r2, _08173A08
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, [r2]
	adds r2, r2, r1
	adds r0, #5
	lsls r0, r0, #1
	adds r0, r0, r3
	adds r4, #8
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08173A0C
	adds r3, r0, r1
	ldr r1, [r3, #0x1c]
	ldr r0, _08173A10
	cmp r1, r0
	bne _081739FE
	ldrb r1, [r3, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r2, #0
	movs r1, #0
	movs r2, #0xe
	bl HallOfFame_PrintMonInfo
	movs r0, #0x78
	strh r0, [r5, #0xe]
	ldr r0, _08173A14
	str r0, [r5]
_081739FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08173A04: .4byte 0x03005B60
_08173A08: .4byte 0x0203B9A4
_08173A0C: .4byte 0x020205AC
_08173A10: .4byte 0x08007141
_08173A14: .4byte 0x08173A19
	thumb_func_end Task_Hof_PrintMonInfoAfterAnimating

	thumb_func_start Task_Hof_TryDisplayAnotherMon
Task_Hof_TryDisplayAnotherMon: @ 0x08173A18
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _08173A54
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r6, r0, #3
	adds r4, r6, r2
	ldrh r3, [r4, #0xa]
	ldr r1, _08173A58
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r1, r1, r0
	mov sb, r1
	ldrh r1, [r4, #0xe]
	movs r7, #0xe
	ldrsh r0, [r4, r7]
	mov ip, r2
	cmp r0, #0
	beq _08173A5C
	subs r0, r1, #1
	strh r0, [r4, #0xe]
	b _08173AF4
	.align 2, 0
_08173A54: .4byte 0x03005B60
_08173A58: .4byte 0x0203B9A4
_08173A5C:
	ldr r2, _08173AD4
	ldr r0, _08173AD8
	mov r8, r0
	adds r0, r3, #5
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r1, ip
	adds r1, #8
	adds r6, r0, r1
	movs r7, #0
	ldrsh r1, [r6, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r0
	ldr r3, [r2]
	orrs r3, r1
	str r3, [r2]
	ldrh r2, [r4, #0xa]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bgt _08173AE8
	mov r7, sb
	ldrh r1, [r7, #0x1c]
	ldr r0, _08173ADC
	ands r0, r1
	cmp r0, #0
	beq _08173AE8
	adds r0, r2, #1
	strh r0, [r4, #0xa]
	ldr r0, _08173AE0
	str r0, [sp]
	adds r0, r3, #0
	movs r1, #0
	movs r2, #0xc
	movs r3, #0xc
	bl BeginNormalPaletteFade
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r0, _08173AE4
	str r0, [r4]
	b _08173AF4
	.align 2, 0
_08173AD4: .4byte 0x0203B9A0
_08173AD8: .4byte 0x020205AC
_08173ADC: .4byte 0x000001FF
_08173AE0: .4byte 0x000063B0
_08173AE4: .4byte 0x0817388D
_08173AE8:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	add r0, ip
	ldr r1, _08173B04
	str r1, [r0]
_08173AF4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08173B04: .4byte 0x08173B09
	thumb_func_end Task_Hof_TryDisplayAnotherMon

	thumb_func_start Task_Hof_PaletteFadeAndPrintWelcomeText
Task_Hof_PaletteFadeAndPrintWelcomeText: @ 0x08173B08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08173B90
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r3, #0
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r5, r0, #3
	ldr r0, _08173B94
	mov ip, r0
	mov r8, r1
	ldr r6, _08173B98
	movs r7, #0xd
	rsbs r7, r7, #0
_08173B36:
	adds r0, r3, #5
	lsls r0, r0, #1
	adds r0, r0, r5
	mov r2, ip
	adds r1, r0, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	beq _08173B58
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r2, [r1, #5]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1, #5]
_08173B58:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #5
	bls _08173B36
	movs r0, #0
	movs r1, #0xf
	bl HallOfFame_PrintWelcomeText
	movs r0, #0x69
	bl PlaySE
	ldr r1, _08173B9C
	mov r2, r8
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	strh r1, [r0, #0xe]
	ldr r1, _08173BA0
	str r1, [r0]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08173B90: .4byte 0xFFFF0000
_08173B94: .4byte 0x03005B68
_08173B98: .4byte 0x020205AC
_08173B9C: .4byte 0x03005B60
_08173BA0: .4byte 0x08173BA5
	thumb_func_end Task_Hof_PaletteFadeAndPrintWelcomeText

	thumb_func_start sub_08173BA4
sub_08173BA4: @ 0x08173BA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _08173BE4
	lsls r4, r6, #2
	adds r0, r4, r6
	lsls r5, r0, #3
	adds r1, r5, r7
	ldrh r2, [r1, #0xe]
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08173BE8
	subs r2, #1
	strh r2, [r1, #0xe]
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08173C62
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6e
	ble _08173C62
	bl sub_08175100
	b _08173C62
	.align 2, 0
_08173BE4: .4byte 0x03005B60
_08173BE8:
	movs r3, #0
	mov sb, r4
	ldr r0, _08173C74
	mov sl, r0
	adds r4, r5, #0
	adds r7, #8
	mov r8, r7
	ldr r7, _08173C78
	movs r1, #0xd
	rsbs r1, r1, #0
	mov ip, r1
	movs r5, #4
_08173C00:
	adds r0, r3, #5
	lsls r0, r0, #1
	adds r0, r0, r4
	mov r2, r8
	adds r1, r0, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	beq _08173C24
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #5]
	mov r0, ip
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, #5]
_08173C24:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #5
	bls _08173C00
	mov r3, sl
	ldr r0, [r3]
	ldr r1, _08173C7C
	str r1, [sp]
	movs r1, #0
	movs r2, #0xc
	movs r3, #0xc
	bl BeginNormalPaletteFade
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _08173C80
	mov r2, sb
	adds r0, r2, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #7
	strh r1, [r0, #0xe]
	ldr r1, _08173C84
	str r1, [r0]
_08173C62:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08173C74: .4byte 0x0203B9A0
_08173C78: .4byte 0x020205AC
_08173C7C: .4byte 0x000063B0
_08173C80: .4byte 0x03005B60
_08173C84: .4byte 0x08173C89
	thumb_func_end sub_08173BA4

	thumb_func_start sub_08173C88
sub_08173C88: @ 0x08173C88
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08173CA8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r0, #0xf
	ble _08173CB0
	ldr r0, _08173CAC
	str r0, [r1]
	b _08173CC2
	.align 2, 0
_08173CA8: .4byte 0x03005B60
_08173CAC: .4byte 0x08173CC9
_08173CB0:
	adds r0, r2, #1
	strh r0, [r1, #0xe]
	movs r0, #0xe
	ldrsh r1, [r1, r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
_08173CC2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08173C88

	thumb_func_start sub_08173CC8
sub_08173CC8: @ 0x08173CC8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldr r6, _08173D50
	ldr r0, [r6]
	ldrb r0, [r0, #8]
	movs r1, #1
	bl PlayerGenderToFrontTrainerPicId_Debug
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	str r1, [sp]
	ldr r1, _08173D54
	str r1, [sp, #4]
	movs r1, #1
	movs r2, #0x78
	movs r3, #0x48
	bl CreateTrainerPicSprite
	ldr r1, _08173D58
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r1
	strh r0, [r4, #0x10]
	ldr r0, _08173D5C
	bl AddWindow
	ldr r0, [r6]
	ldrb r1, [r0, #0x14]
	lsrs r1, r1, #3
	ldr r2, _08173D60
	movs r0, #1
	movs r3, #0xd0
	bl LoadWindowGfx
	movs r0, #1
	bl stdpal_get
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0x78
	strh r0, [r4, #0xe]
	ldr r0, _08173D64
	str r0, [r4]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08173D50: .4byte 0x03005AF0
_08173D54: .4byte 0x0000FFFF
_08173D58: .4byte 0x03005B60
_08173D5C: .4byte 0x085C643C
_08173D60: .4byte 0x0000021D
_08173D64: .4byte 0x08173D69
	thumb_func_end sub_08173CC8

	thumb_func_start Task_Hof_WaitAndPrintPlayerInfo
Task_Hof_WaitAndPrintPlayerInfo: @ 0x08173D68
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08173D8C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #0xe]
	movs r1, #0xe
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _08173D90
	subs r0, #1
	strh r0, [r4, #0xe]
	b _08173DFC
	.align 2, 0
_08173D8C: .4byte 0x03005B60
_08173D90:
	ldr r2, _08173DB0
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r2, [r1, #0x20]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #0xc0
	beq _08173DB4
	adds r0, r2, #1
	strh r0, [r1, #0x20]
	b _08173DFC
	.align 2, 0
_08173DB0: .4byte 0x020205AC
_08173DB4:
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #1
	movs r1, #2
	bl HallOfFame_PrintPlayerInfo
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _08173E04
	str r5, [sp]
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
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _08173E08
	str r0, [r4]
_08173DFC:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08173E04: .4byte 0x085C9337
_08173E08: .4byte 0x08173E0D
	thumb_func_end Task_Hof_WaitAndPrintPlayerInfo

	thumb_func_start Task_Hof_ExitOnKeyPressed
Task_Hof_ExitOnKeyPressed: @ 0x08173E0C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08173E38
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08173E32
	movs r0, #4
	bl FadeOutBGMTemporarily
	ldr r0, _08173E3C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08173E40
	str r0, [r1]
_08173E32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08173E38: .4byte 0x03002360
_08173E3C: .4byte 0x03005B60
_08173E40: .4byte 0x08173E45
	thumb_func_end Task_Hof_ExitOnKeyPressed

	thumb_func_start Task_Hof_HandlePaletteOnExit
Task_Hof_HandlePaletteOnExit: @ 0x08173E44
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08173E84
	ldr r1, _08173E88
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuSet
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r1, #8
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _08173E8C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08173E90
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08173E84: .4byte 0x020377B4
_08173E88: .4byte 0x020373B4
_08173E8C: .4byte 0x03005B60
_08173E90: .4byte 0x08173E95
	thumb_func_end Task_Hof_HandlePaletteOnExit

	thumb_func_start Task_Hof_HandleExit
Task_Hof_HandleExit: @ 0x08173E94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08173F54
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08173F48
	lsls r0, r7, #2
	mov r8, r0
	ldr r1, _08173F58
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r1, #0x12
	adds r5, r0, r1
	ldr r2, _08173F5C
	mov sb, r2
	movs r6, #5
_08173EC0:
	ldrb r4, [r5]
	cmp r4, #0xff
	beq _08173EDE
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl FreeAndDestroyMonPicSprite
_08173EDE:
	adds r5, #2
	subs r6, #1
	cmp r6, #0
	bge _08173EC0
	ldr r0, _08173F58
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x10]
	bl FreeAndDestroyTrainerPicSprite
	movs r0, #0
	bl HideBg
	movs r0, #1
	bl HideBg
	movs r0, #3
	bl HideBg
	bl FreeAllWindowBuffers
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #3
	bl UnsetBgTilemapBuffer
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	adds r0, r7, #0
	bl DestroyTask
	ldr r4, _08173F60
	ldr r0, [r4]
	cmp r0, #0
	beq _08173F34
	bl Free
	movs r0, #0
	str r0, [r4]
_08173F34:
	ldr r4, _08173F64
	ldr r0, [r4]
	cmp r0, #0
	beq _08173F44
	bl Free
	movs r0, #0
	str r0, [r4]
_08173F44:
	bl SetCallback2AfterHallOfFameDisplay
_08173F48:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08173F54: .4byte 0x02037C74
_08173F58: .4byte 0x03005B60
_08173F5C: .4byte 0x020205AC
_08173F60: .4byte 0x0203B9A8
_08173F64: .4byte 0x0203B9A4
	thumb_func_end Task_Hof_HandleExit

	thumb_func_start SetCallback2AfterHallOfFameDisplay
SetCallback2AfterHallOfFameDisplay: @ 0x08173F68
	push {lr}
	ldr r0, _08173F74
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08173F74: .4byte 0x0817553D
	thumb_func_end SetCallback2AfterHallOfFameDisplay

	thumb_func_start CB2_DoHallOfFamePC
CB2_DoHallOfFamePC: @ 0x08173F78
	push {r4, lr}
	ldr r0, _08173F94
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08173FB4
	lsls r0, r0, #2
	ldr r1, _08173F98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08173F94: .4byte 0x03002360
_08173F98: .4byte 0x08173F9C
_08173F9C: @ jump table
	.4byte _08173FB4 @ case 0
	.4byte _08173FE4 @ case 1
	.4byte _08173FF8 @ case 2
	.4byte _08174024 @ case 3
	.4byte _08174064 @ case 4
	.4byte _08174094 @ case 5
_08173FB4:
	movs r0, #0
	bl SetVBlankCallback
	bl ClearVramOamPltt_LoadHofPal
	ldr r4, _08173FD8
	ldr r0, _08173FDC
	bl AllocZeroed
	str r0, [r4]
	ldr r0, _08173FE0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	b _081740EC
	.align 2, 0
_08173FD8: .4byte 0x0203B9A8
_08173FDC: .4byte 0x00002014
_08173FE0: .4byte 0x03002360
_08173FE4:
	bl sub_08174E74
	ldr r1, _08173FF4
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08174086
	.align 2, 0
_08173FF4: .4byte 0x03002360
_08173FF8:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	bl sub_08174EB0
	ldr r1, _08174020
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _08174086
	.align 2, 0
_08174020: .4byte 0x03002360
_08174024:
	bl sub_08174F28
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081740EC
	ldr r1, _08174054
	ldr r0, _08174058
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_080FA43C
	ldr r0, _0817405C
	bl SetVBlankCallback
	ldr r1, _08174060
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _08174086
	.align 2, 0
_08174054: .4byte 0x0201C000
_08174058: .4byte 0x085C6790
_0817405C: .4byte 0x08173331
_08174060: .4byte 0x03002360
_08174064:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_080FA48C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081740EC
	ldr r1, _08174090
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_08174086:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081740EC
	.align 2, 0
_08174090: .4byte 0x03002360
_08174094:
	ldr r1, _081740F4
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0xe2
	lsls r1, r1, #3
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r0, _081740F8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r4, _081740FC
	movs r3, #0xff
_081740C6:
	adds r0, r2, #5
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _081740C6
	ldr r4, _08174100
	movs r0, #0x80
	lsls r0, r0, #6
	bl AllocZeroed
	str r0, [r4]
	ldr r0, _08174104
	bl SetMainCallback2
_081740EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081740F4: .4byte 0x00003F42
_081740F8: .4byte 0x08174109
_081740FC: .4byte 0x03005B68
_08174100: .4byte 0x0203B9A4
_08174104: .4byte 0x08173345
	thumb_func_end CB2_DoHallOfFamePC

	thumb_func_start Task_HofPC_CopySaveData
Task_HofPC_CopySaveData: @ 0x08174108
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0817413C
	str r0, [sp]
	movs r0, #0
	movs r1, #0x1e
	movs r2, #0
	movs r3, #0xc
	bl sub_081981B4
	movs r0, #3
	bl Save_LoadGameData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08174148
	ldr r0, _08174140
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08174144
	b _081741BE
	.align 2, 0
_0817413C: .4byte 0x00000226
_08174140: .4byte 0x03005B60
_08174144: .4byte 0x08174785
_08174148:
	ldr r0, _08174190
	ldr r4, _08174194
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #5
	bl CpuSet
	ldr r4, [r4]
	movs r2, #0
	ldrh r1, [r4, #8]
	ldr r3, _08174198
	adds r0, r3, #0
	ands r0, r1
	lsls r5, r6, #2
	cmp r0, #0
	beq _0817417E
_08174168:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r4, #0x78
	cmp r2, #0x31
	bhi _081741A0
	ldrh r1, [r4, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08174168
_0817417E:
	cmp r2, #0x31
	bhi _081741A0
	ldr r0, _0817419C
	adds r1, r5, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	subs r0, r2, #1
	b _081741AA
	.align 2, 0
_08174190: .4byte 0x0201C000
_08174194: .4byte 0x0203B9A4
_08174198: .4byte 0x000001FF
_0817419C: .4byte 0x03005B60
_081741A0:
	ldr r0, _081741C8
	adds r1, r5, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x31
_081741AA:
	strh r0, [r1, #8]
	movs r0, #0xa
	bl GetGameStat
	ldr r2, _081741C8
	adds r1, r5, r6
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r0, [r1, #0xa]
	ldr r0, _081741CC
_081741BE:
	str r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081741C8: .4byte 0x03005B60
_081741CC: .4byte 0x081741D1
	thumb_func_end Task_HofPC_CopySaveData

	thumb_func_start Task_HofPC_DrawSpritesPrintText
Task_HofPC_DrawSpritesPrintText: @ 0x081741D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08174284
	ldr r3, [r0]
	movs r5, #0
	ldr r1, _08174288
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r4, #8
	ldrsh r0, [r0, r4]
	adds r4, r1, #0
	ldr r2, _0817428C
	cmp r5, r0
	bge _0817420E
	adds r1, r0, #0
_08174202:
	adds r3, #0x78
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r1
	blt _08174202
_0817420E:
	adds r6, r3, #0
	movs r0, #0
	str r0, [r2]
	mov r5, r8
	lsls r2, r5, #2
	adds r1, r2, r5
	lsls r1, r1, #3
	adds r1, r1, r4
	strh r0, [r1, #0xc]
	strh r0, [r1, #0x10]
	movs r5, #0
	str r2, [sp, #0x14]
	ldr r4, _08174290
	adds r2, r1, #0
_0817422A:
	ldrh r1, [r6, #8]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0817423A
	ldrh r0, [r2, #0x10]
	adds r0, #1
	strh r0, [r2, #0x10]
_0817423A:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, #0x14
	cmp r5, #5
	bls _0817422A
	adds r6, r3, #0
	movs r5, #0
	ldr r1, _08174288
	ldr r0, [sp, #0x14]
	add r0, r8
	lsls r0, r0, #3
	mov sb, r0
	adds r0, r0, r1
	str r0, [sp, #0x10]
	ldr r1, _08174290
	mov sl, r1
_0817425C:
	ldrh r0, [r6, #8]
	mov r1, sl
	ands r1, r0
	adds r7, r0, #0
	cmp r1, #0
	beq _08174324
	ldr r2, [sp, #0x10]
	movs r4, #0x10
	ldrsh r0, [r2, r4]
	cmp r0, #3
	ble _0817429C
	lsls r1, r5, #3
	ldr r0, _08174294
	adds r0, #4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r0, _08174298
	adds r1, r1, r0
	ldrh r4, [r1]
	b _081742AC
	.align 2, 0
_08174284: .4byte 0x0203B9A4
_08174288: .4byte 0x03005B60
_0817428C: .4byte 0x0203B9A0
_08174290: .4byte 0x000001FF
_08174294: .4byte 0x085C6470
_08174298: .4byte 0x085C6476
_0817429C:
	ldr r0, _08174314
	lsls r2, r5, #3
	adds r1, r0, #4
	adds r1, r2, r1
	ldrh r3, [r1]
	adds r0, #6
	adds r2, r2, r0
	ldrh r4, [r2]
_081742AC:
	mov r1, sl
	ands r1, r7
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bne _081742C2
	lsls r0, r4, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r4, r0, #0x10
_081742C2:
	lsls r0, r7, #0x17
	lsrs r0, r0, #0x17
	ldr r1, [r6]
	ldr r2, [r6, #4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r3, [sp]
	lsls r3, r4, #0x10
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	ldr r3, _08174318
	str r3, [sp, #0xc]
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0817431C
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r3, [r1, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r2, r4, #0
	ands r3, r2
	movs r2, #4
	orrs r3, r2
	strb r3, [r1, #5]
	adds r1, r5, #5
	lsls r1, r1, #1
	add r1, sb
	ldr r2, _08174320
	adds r1, r1, r2
	strh r0, [r1]
	b _08174332
	.align 2, 0
_08174314: .4byte 0x085C64A0
_08174318: .4byte 0x0000FFFF
_0817431C: .4byte 0x020205AC
_08174320: .4byte 0x03005B68
_08174324:
	adds r0, r5, #5
	lsls r0, r0, #1
	add r0, sb
	ldr r4, _08174384
	adds r0, r0, r4
	movs r1, #0xff
	strh r1, [r0]
_08174332:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, #0x14
	cmp r5, #5
	bls _0817425C
	ldr r0, _08174388
	ldr r2, _0817438C
	movs r1, #0xc
	bl BlendPalettes
	ldr r0, _08174390
	ldr r1, _08174394
	ldr r4, [sp, #0x14]
	add r4, r8
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r5, #0xa
	ldrsh r1, [r4, r5]
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r5, _08174398
	ldr r1, _0817439C
	adds r0, r5, #0
	bl StringExpandPlaceholders
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _081743A4
	ldr r1, _081743A0
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_081982E8
	b _081743B4
	.align 2, 0
_08174384: .4byte 0x03005B68
_08174388: .4byte 0xFFFF0000
_0817438C: .4byte 0x000063B0
_08174390: .4byte 0x02021C40
_08174394: .4byte 0x03005B60
_08174398: .4byte 0x02021C7C
_0817439C: .4byte 0x085C9328
_081743A0: .4byte 0x085C8E7C
_081743A4:
	ldr r1, _081743D4
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_081982E8
_081743B4:
	ldr r0, _081743D8
	ldr r1, [sp, #0x14]
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081743DC
	str r0, [r1]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081743D4: .4byte 0x085C8E68
_081743D8: .4byte 0x03005B60
_081743DC: .4byte 0x081743E1
	thumb_func_end Task_HofPC_DrawSpritesPrintText

	thumb_func_start Task_HofPC_PrintMonInfo
Task_HofPC_PrintMonInfo: @ 0x081743E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081744E8
	ldr r5, [r0]
	movs r3, #0
	ldr r1, _081744EC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	cmp r3, r0
	bge _08174414
	adds r1, r0, #0
_08174408:
	adds r5, #0x78
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	blt _08174408
_08174414:
	movs r3, #0
	lsls r7, r4, #2
	adds r0, r7, r4
	lsls r6, r0, #3
	ldr r0, _081744F0
	mov sl, r0
	ldr r1, _081744F4
	mov r8, r1
	movs r2, #0xd
	rsbs r2, r2, #0
	mov sb, r2
	movs r0, #4
	mov ip, r0
_0817442E:
	adds r0, r3, #5
	lsls r0, r0, #1
	adds r0, r0, r6
	add r0, sl
	ldrh r1, [r0]
	cmp r1, #0xff
	beq _08174450
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrb r2, [r0, #5]
	mov r1, sb
	ands r1, r2
	mov r2, ip
	orrs r1, r2
	strb r1, [r0, #5]
_08174450:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #5
	bls _0817442E
	adds r1, r7, r4
	lsls r1, r1, #3
	ldr r0, _081744EC
	adds r6, r1, r0
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	adds r0, #5
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, _081744EC
	adds r1, #8
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081744F4
	adds r0, r0, r1
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0, #5]
	lsrs r1, r1, #4
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r0, r1
	ldr r1, _081744F8
	eors r0, r1
	ldr r2, _081744FC
	str r0, [r2]
	ldr r2, _08174500
	movs r1, #0xc
	bl BlendPalettesUnfaded
	movs r0, #0xc
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r5, r0
	ldrh r1, [r4, #8]
	ldr r0, _08174504
	ands r0, r1
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _081744CA
	bl StopCryAndClearCrySongs
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	movs r1, #0
	bl PlayCry1
_081744CA:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xe
	bl HallOfFame_PrintMonInfo
	ldr r0, _08174508
	str r0, [r6]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081744E8: .4byte 0x0203B9A4
_081744EC: .4byte 0x03005B60
_081744F0: .4byte 0x03005B68
_081744F4: .4byte 0x020205AC
_081744F8: .4byte 0xFFFF0000
_081744FC: .4byte 0x0203B9A0
_08174500: .4byte 0x000063B0
_08174504: .4byte 0x000001FF
_08174508: .4byte 0x0817450D
	thumb_func_end Task_HofPC_PrintMonInfo

	thumb_func_start Task_HofPC_HandleInput
Task_HofPC_HandleInput: @ 0x0817450C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08174590
	ldrh r2, [r1, #0x2e]
	movs r0, #1
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _081745C8
	ldr r0, _08174594
	mov ip, r0
	lsls r0, r6, #2
	adds r1, r0, r6
	lsls r3, r1, #3
	mov r1, ip
	adds r4, r3, r1
	ldrh r2, [r4, #8]
	movs r5, #8
	ldrsh r1, [r4, r5]
	mov sb, r0
	cmp r1, #0
	beq _0817459C
	subs r0, r2, #1
	strh r0, [r4, #8]
	movs r5, #0
	adds r7, r3, #0
	movs r0, #8
	add r0, ip
	mov r8, r0
_0817454E:
	adds r0, r5, #5
	lsls r0, r0, #1
	adds r0, r0, r7
	mov r1, r8
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08174566
	bl FreeAndDestroyMonPicSprite
	movs r0, #0xff
	strh r0, [r4]
_08174566:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _0817454E
	ldr r0, _08174594
	mov r2, sb
	adds r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08174588
	subs r0, r2, #1
	strh r0, [r1, #0xa]
_08174588:
	ldr r0, _08174598
	str r0, [r1]
	b _08174668
	.align 2, 0
_08174590: .4byte 0x03002360
_08174594: .4byte 0x03005B60
_08174598: .4byte 0x081741D1
_0817459C:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081745B6
	bl StopCryAndClearCrySongs
	ldr r0, _081745BC
	ldr r1, _081745C0
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
_081745B6:
	ldr r0, _081745C4
	str r0, [r4]
	b _08174668
	.align 2, 0
_081745BC: .4byte 0x030074D0
_081745C0: .4byte 0x0000FFFF
_081745C4: .4byte 0x0817467D
_081745C8:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0817460C
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081745EA
	bl StopCryAndClearCrySongs
	ldr r0, _081745FC
	ldr r1, _08174600
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
_081745EA:
	ldr r0, _08174604
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08174608
	str r0, [r1]
	b _08174668
	.align 2, 0
_081745FC: .4byte 0x030074D0
_08174600: .4byte 0x0000FFFF
_08174604: .4byte 0x03005B60
_08174608: .4byte 0x0817467D
_0817460C:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0817463C
	ldr r0, _08174634
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1, #0xc]
	movs r4, #0xc
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0817463C
	subs r0, r2, #1
	strh r0, [r1, #0xc]
	ldr r0, _08174638
	str r0, [r1]
	b _08174668
	.align 2, 0
_08174634: .4byte 0x03005B60
_08174638: .4byte 0x081743E1
_0817463C:
	ldrh r1, [r3, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08174668
	ldr r1, _08174674
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r5, #0xc
	ldrsh r1, [r2, r5]
	movs r3, #0x10
	ldrsh r0, [r2, r3]
	subs r0, #1
	cmp r1, r0
	bge _08174668
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	ldr r0, _08174678
	str r0, [r2]
_08174668:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08174674: .4byte 0x03005B60
_08174678: .4byte 0x081743E1
	thumb_func_end Task_HofPC_HandleInput

	thumb_func_start Task_HofPC_HandlePaletteOnExit
Task_HofPC_HandlePaletteOnExit: @ 0x0817467C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081746BC
	ldr r1, _081746C0
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuSet
	ldr r1, _081746C4
	ldr r0, _081746C8
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_080FA464
	ldr r1, _081746CC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081746D0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081746BC: .4byte 0x020377B4
_081746C0: .4byte 0x020373B4
_081746C4: .4byte 0x0201C000
_081746C8: .4byte 0x085C6790
_081746CC: .4byte 0x03005B60
_081746D0: .4byte 0x081746D5
	thumb_func_end Task_HofPC_HandlePaletteOnExit

	thumb_func_start Task_HofPC_HandleExit
Task_HofPC_HandleExit: @ 0x081746D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl FldEffPoison_IsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0817476C
	movs r5, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r7, r0, #3
	ldr r0, _08174778
	mov r8, r0
_081746F4:
	adds r0, r5, #5
	lsls r0, r0, #1
	adds r0, r0, r7
	mov r1, r8
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #0xff
	beq _0817470C
	bl FreeAndDestroyMonPicSprite
	movs r0, #0xff
	strh r0, [r4]
_0817470C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _081746F4
	movs r0, #0
	bl HideBg
	movs r0, #1
	bl HideBg
	movs r0, #3
	bl HideBg
	bl sub_08198418
	bl FreeAllWindowBuffers
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #3
	bl UnsetBgTilemapBuffer
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	adds r0, r6, #0
	bl DestroyTask
	ldr r4, _0817477C
	ldr r0, [r4]
	cmp r0, #0
	beq _08174758
	bl Free
	movs r0, #0
	str r0, [r4]
_08174758:
	ldr r4, _08174780
	ldr r0, [r4]
	cmp r0, #0
	beq _08174768
	bl Free
	movs r0, #0
	str r0, [r4]
_08174768:
	bl ReturnFromHallOfFamePC
_0817476C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08174778: .4byte 0x03005B68
_0817477C: .4byte 0x0203B9A8
_08174780: .4byte 0x0203B9A4
	thumb_func_end Task_HofPC_HandleExit

	thumb_func_start Task_HofPC_PrintDataIsCorrupted
Task_HofPC_PrintDataIsCorrupted: @ 0x08174784
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081747DC
	movs r1, #8
	movs r2, #1
	bl sub_08198244
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _081747E0
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
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, _081747E4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081747E8
	str r1, [r0]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081747DC: .4byte 0x085C8E8C
_081747E0: .4byte 0x085C9311
_081747E4: .4byte 0x03005B60
_081747E8: .4byte 0x081747ED
	thumb_func_end Task_HofPC_PrintDataIsCorrupted

	thumb_func_start Task_HofPC_ExitOnButtonPress
Task_HofPC_ExitOnButtonPress: @ 0x081747EC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08174810
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0817480C
	ldr r0, _08174814
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08174818
	str r0, [r1]
_0817480C:
	pop {r0}
	bx r0
	.align 2, 0
_08174810: .4byte 0x03002360
_08174814: .4byte 0x03005B60
_08174818: .4byte 0x0817467D
	thumb_func_end Task_HofPC_ExitOnButtonPress

	thumb_func_start HallOfFame_PrintWelcomeText
HallOfFame_PrintWelcomeText: @ 0x0817481C
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl GetWindowAttribute
	adds r4, r0, #0
	ldr r5, _08174874
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	adds r1, r5, #0
	bl GetStringWidth
	lsls r4, r4, #2
	lsrs r0, r0, #1
	subs r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08174878
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #1
	bl AddTextPrinterParameterized3
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08174874: .4byte 0x085C929D
_08174878: .4byte 0x085C6444
	thumb_func_end HallOfFame_PrintWelcomeText

	thumb_func_start HallOfFame_PrintMonInfo
HallOfFame_PrintMonInfo: @ 0x0817487C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	ldrh r0, [r7, #8]
	ldr r1, _08174904
	ands r1, r0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	beq _0817493C
	ldr r0, _08174908
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0817490C
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl AddTextPrinterParameterized3
	ldrh r0, [r7, #8]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	bl SpeciesToPokedexNum
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08174910
	cmp r6, r0
	beq _08174914
	add r4, sp, #0xc
	adds r0, r6, #0
	movs r1, #0x64
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r4]
	add r5, sp, #0xc
	adds r0, r6, #0
	movs r1, #0x64
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r5, #1]
	add r5, sp, #0xc
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r5, #2]
	b _08174922
	.align 2, 0
_08174904: .4byte 0x000001FF
_08174908: .4byte 0x085C6444
_0817490C: .4byte 0x085C934B
_08174910: .4byte 0x0000FFFF
_08174914:
	add r3, sp, #0xc
	adds r2, r3, #0
	adds r1, r2, #0
	movs r0, #0xac
	strb r0, [r1, #2]
	strb r0, [r2, #1]
	strb r0, [r3]
_08174922:
	add r1, sp, #0xc
	movs r0, #0xff
	strb r0, [r1, #3]
	ldr r0, _081749C8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0x1c
	movs r3, #1
	bl AddTextPrinterParameterized3
_0817493C:
	movs r4, #0
	adds r1, r7, #0
	adds r1, #0xa
	ldrb r0, [r7, #0xa]
	ldrh r3, [r7, #8]
	cmp r0, #0xff
	beq _0817496E
	adds r2, r1, #0
_0817494C:
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	adds r0, r2, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	beq _0817496E
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0817496E
	cmp r4, #9
	bls _0817494C
_0817496E:
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _081749CC
	ands r0, r3
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _081749D0
	movs r0, #0
	movs r1, #3
	bl GetWindowAttribute
	adds r4, r0, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	add r1, sp, #0xc
	bl GetStringWidth
	lsls r4, r4, #2
	lsrs r0, r0, #1
	subs r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081749C8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0xc
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #1
	bl AddTextPrinterParameterized3
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	b _08174B58
	.align 2, 0
_081749C8: .4byte 0x085C6444
_081749CC: .4byte 0x000001FF
_081749D0:
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	add r1, sp, #0xc
	bl GetStringWidth
	movs r2, #0x79
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _08174A7C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0xc
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #1
	bl AddTextPrinterParameterized3
	add r1, sp, #0xc
	movs r0, #0xba
	strb r0, [r1]
	movs r4, #1
	ldr r2, _08174A80
	ldrh r5, [r7, #8]
	lsls r1, r5, #0x17
	lsrs r1, r1, #0x17
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08174A52
	adds r6, r2, #0
_08174A1A:
	mov r3, sp
	adds r3, r3, r4
	adds r3, #0xc
	lsls r2, r5, #0x17
	lsrs r1, r2, #0x17
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #1
	adds r0, r4, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	subs r0, #1
	adds r0, r4, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08174A52
	cmp r4, #9
	bls _08174A1A
_08174A52:
	ldrh r0, [r7, #8]
	ldr r1, _08174A84
	ands r1, r0
	cmp r1, #0x20
	beq _08174AA2
	cmp r1, #0x1d
	beq _08174AA2
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	ldr r1, [r7, #4]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xfe
	beq _08174A98
	cmp r0, #0xfe
	bgt _08174A88
	cmp r0, #0
	beq _08174A8E
	b _08174AAC
	.align 2, 0
_08174A7C: .4byte 0x085C6444
_08174A80: .4byte 0x082EA31C
_08174A84: .4byte 0x000001FF
_08174A88:
	cmp r0, #0xff
	beq _08174AA2
	b _08174AAC
_08174A8E:
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	movs r0, #0xb5
	b _08174AAA
_08174A98:
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	movs r0, #0xb6
	b _08174AAA
_08174AA2:
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	movs r0, #0
_08174AAA:
	strb r0, [r1]
_08174AAC:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	movs r0, #0xff
	strb r0, [r1]
	ldr r6, _08174B60
	str r6, [sp]
	movs r4, #0
	str r4, [sp, #4]
	add r0, sp, #0xc
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x7a
	movs r3, #1
	bl AddTextPrinterParameterized3
	str r6, [sp]
	str r4, [sp, #4]
	ldr r0, _08174B64
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x18
	movs r3, #0x11
	bl AddTextPrinterParameterized3
	ldr r5, _08174B68
	ldrb r1, [r7, #9]
	lsrs r1, r1, #1
	adds r0, r5, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x28
	movs r3, #0x11
	bl AddTextPrinterParameterized3
	str r6, [sp]
	str r4, [sp, #4]
	ldr r0, _08174B6C
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x52
	movs r3, #0x11
	bl AddTextPrinterParameterized3
	str r6, [sp]
	str r4, [sp, #4]
	ldr r0, _08174B70
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x7a
	movs r3, #0x11
	bl AddTextPrinterParameterized3
	ldrh r1, [r7]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #5
	bl ConvertIntToDecimalStringN
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x84
	movs r3, #0x11
	bl AddTextPrinterParameterized3
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
_08174B58:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08174B60: .4byte 0x085C6444
_08174B64: .4byte 0x085C934F
_08174B68: .4byte 0x02021C40
_08174B6C: .4byte 0x085C935D
_08174B70: .4byte 0x085C93FF
	thumb_func_end HallOfFame_PrintMonInfo

	thumb_func_start HallOfFame_PrintPlayerInfo
HallOfFame_PrintPlayerInfo: @ 0x08174B74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	movs r4, #0
	movs r0, #1
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r0, #1
	bl PutWindowTilemap
	ldr r2, _08174C04
	movs r0, #1
	movs r1, #0
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	str r4, [sp]
	str r4, [sp, #4]
	ldr r0, _08174C08
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, _08174C0C
	str r0, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	movs r2, #4
	movs r3, #3
	bl AddTextPrinterParameterized4
	movs r2, #0
	ldr r0, _08174C10
	ldr r3, [r0]
	movs r5, #1
_08174BBC:
	mov r1, sp
	adds r1, r1, r2
	adds r1, #0x14
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08174BD2
	orrs r4, r5
_08174BD2:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #4
	bls _08174BBC
	mov r1, sp
	adds r1, r1, r2
	adds r1, #0x14
	movs r0, #0xff
	strb r0, [r1]
	cmp r4, #0
	beq _08174C14
	ldr r0, _08174C08
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x14
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #0x3c
	movs r3, #3
	bl AddTextPrinterParameterized3
	b _08174C2E
	.align 2, 0
_08174C04: .4byte 0x0000021D
_08174C08: .4byte 0x085C6448
_08174C0C: .4byte 0x085C9359
_08174C10: .4byte 0x03005AF0
_08174C14:
	str r4, [sp]
	str r4, [sp, #4]
	ldr r0, _08174DB0
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	add r1, sp, #0x14
	str r1, [sp, #0x10]
	movs r0, #1
	movs r1, #1
	movs r2, #0x3c
	movs r3, #3
	bl AddTextPrinterParameterized4
_08174C2E:
	ldr r0, _08174DB4
	mov sb, r0
	ldr r0, [r0]
	ldrb r4, [r0, #0xa]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #8
	orrs r4, r0
	ldr r1, _08174DB0
	mov r8, r1
	str r1, [sp]
	movs r7, #0
	str r7, [sp, #4]
	ldr r0, _08174DB8
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #4
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	add r6, sp, #0x14
	ldr r1, _08174DBC
	adds r0, r4, #0
	bl __modsi3
	ldr r5, _08174DC0
	adds r1, r5, #0
	bl __divsi3
	subs r0, #0x5f
	strb r0, [r6]
	add r6, sp, #0x14
	adds r0, r4, #0
	adds r1, r5, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r5, #0xfa
	lsls r5, r5, #2
	adds r1, r5, #0
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r6, #1]
	add r6, sp, #0x14
	adds r0, r4, #0
	adds r1, r5, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r6, #2]
	add r5, sp, #0x14
	adds r0, r4, #0
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r5, #3]
	add r5, sp, #0x14
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r5, #4]
	add r1, sp, #0x14
	movs r0, #0xff
	strb r0, [r1, #5]
	mov r0, r8
	str r0, [sp]
	str r7, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0x3c
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	mov r1, r8
	str r1, [sp]
	str r7, [sp, #4]
	ldr r0, _08174DC4
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #4
	movs r3, #0x20
	bl AddTextPrinterParameterized3
	add r5, sp, #0x14
	mov r0, sb
	ldr r4, [r0]
	ldrh r0, [r4, #0xe]
	movs r1, #0x64
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r5]
	add r5, sp, #0x14
	ldrh r0, [r4, #0xe]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r5, #1]
	add r5, sp, #0x14
	ldrh r0, [r4, #0xe]
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r5, #2]
	add r0, sp, #0x14
	ldrb r0, [r0]
	cmp r0, #0xa1
	bne _08174D3A
	add r0, sp, #0x14
	strb r7, [r0]
_08174D3A:
	add r0, sp, #0x14
	ldrb r1, [r0]
	cmp r1, #0
	bne _08174D4C
	ldrb r0, [r0, #1]
	cmp r0, #0xa1
	bne _08174D4C
	add r0, sp, #0x14
	strb r1, [r0, #8]
_08174D4C:
	add r1, sp, #0x14
	movs r6, #0
	movs r0, #0xf0
	strb r0, [r1, #3]
	adds r4, r1, #0
	ldr r0, _08174DB4
	ldr r5, [r0]
	ldrb r0, [r5, #0x10]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r4, #4]
	add r4, sp, #0x14
	ldrb r0, [r5, #0x10]
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r4, #5]
	add r1, sp, #0x14
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, _08174DB0
	str r0, [sp]
	str r6, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0x3c
	movs r3, #0x20
	bl AddTextPrinterParameterized3
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08174DB0: .4byte 0x085C6448
_08174DB4: .4byte 0x03005AF0
_08174DB8: .4byte 0x085C935D
_08174DBC: .4byte 0x000186A0
_08174DC0: .4byte 0x00002710
_08174DC4: .4byte 0x085C8DEC
	thumb_func_end HallOfFame_PrintPlayerInfo

	thumb_func_start ClearVramOamPltt_LoadHofPal
ClearVramOamPltt_LoadHofPal: @ 0x08174DC8
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
	ldr r1, _08174E68
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _08174E6C
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_08174DEE:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _08174DEE
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
	ldr r2, _08174E68
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
	bl ResetPaletteFade
	ldr r0, _08174E70
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08174E68: .4byte 0x040000D4
_08174E6C: .4byte 0x81000800
_08174E70: .4byte 0x085C65A4
	thumb_func_end ClearVramOamPltt_LoadHofPal

	thumb_func_start sub_08174E74
sub_08174E74: @ 0x08174E74
	push {lr}
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl reset_temp_tile_data_buffers
	bl ResetAllPicSprites
	bl FreeAllSpritePalettes
	ldr r1, _08174EA4
	movs r0, #8
	strb r0, [r1]
	ldr r0, _08174EA8
	bl LoadCompressedSpriteSheet
	ldr r0, _08174EAC
	bl LoadCompressedSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_08174EA4: .4byte 0x030030BC
_08174EA8: .4byte 0x085C6450
_08174EAC: .4byte 0x085C6460
	thumb_func_end sub_08174E74

	thumb_func_start sub_08174EB0
sub_08174EB0: @ 0x08174EB0
	push {r4, lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08174F1C
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _08174F20
	ldr r1, [r4]
	adds r1, #0x12
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _08174F24
	adds r1, r1, r0
	movs r0, #3
	bl SetBgTilemapBuffer
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08174F1C: .4byte 0x085C6430
_08174F20: .4byte 0x0203B9A8
_08174F24: .4byte 0x00001012
	thumb_func_end sub_08174EB0

	thumb_func_start sub_08174F28
sub_08174F28: @ 0x08174F28
	push {r4, lr}
	sub sp, #8
	ldr r0, _08174F40
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #4
	bhi _0817500C
	lsls r0, r0, #2
	ldr r1, _08174F44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08174F40: .4byte 0x0203B9A8
_08174F44: .4byte 0x08174F48
_08174F48: @ jump table
	.4byte _08174F5C @ case 0
	.4byte _08174F74 @ case 1
	.4byte _08174F80 @ case 2
	.4byte _08174FD6 @ case 3
	.4byte _08174FE0 @ case 4
_08174F5C:
	ldr r1, _08174F70
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _0817500C
	.align 2, 0
_08174F70: .4byte 0x085C65C4
_08174F74:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0817500C
	b _08175016
_08174F80:
	movs r4, #0x20
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #3
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0xe
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #3
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _0817500C
_08174FD6:
	bl InitStandardTextBoxWindows
	bl sub_08196DF4
	b _0817500C
_08174FE0:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldr r0, _08175008
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1]
	b _08175018
	.align 2, 0
_08175008: .4byte 0x0203B9A8
_0817500C:
	ldr r0, _08175020
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08175016:
	movs r0, #1
_08175018:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08175020: .4byte 0x0203B9A8
	thumb_func_end sub_08174F28

	thumb_func_start SpriteCB_GetOnScreenAndAnimate
SpriteCB_GetOnScreenAndAnimate: @ 0x08175024
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x20]
	ldr r0, [r2, #0x30]
	cmp r1, r0
	beq _0817507A
	ldrh r3, [r2, #0x20]
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	movs r4, #0x30
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _08175044
	adds r0, r3, #0
	adds r0, #0xf
	strh r0, [r2, #0x20]
_08175044:
	ldrh r3, [r2, #0x20]
	movs r4, #0x20
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _08175054
	adds r0, r3, #0
	subs r0, #0xf
	strh r0, [r2, #0x20]
_08175054:
	ldrh r3, [r2, #0x22]
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r4, #0x32
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _08175068
	adds r0, r3, #0
	adds r0, #0xa
	strh r0, [r2, #0x22]
_08175068:
	ldrh r3, [r2, #0x22]
	movs r4, #0x22
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _081750A0
	adds r0, r3, #0
	subs r0, #0xa
	strh r0, [r2, #0x22]
	b _081750A0
_0817507A:
	ldrh r0, [r2, #0x3c]
	lsls r1, r0, #0x10
	movs r0, #0xce
	lsls r0, r0, #0x11
	cmp r1, r0
	bne _08175094
	lsrs r1, r1, #0x10
	adds r0, r2, #0
	movs r2, #1
	movs r3, #3
	bl DoMonFrontSpriteAnimation
	b _081750A0
_08175094:
	lsrs r1, r1, #0x10
	adds r0, r2, #0
	movs r2, #0
	movs r3, #3
	bl DoMonFrontSpriteAnimation
_081750A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_GetOnScreenAndAnimate

	thumb_func_start sub_081750A8
sub_081750A8: @ 0x081750A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0x26]
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	cmp r0, #0x78
	ble _081750BE
	adds r0, r5, #0
	bl DestroySprite
	b _081750F6
_081750BE:
	adds r0, r1, #1
	ldrh r1, [r5, #0x30]
	adds r0, r0, r1
	strh r0, [r5, #0x26]
	ldrh r4, [r5, #0x2e]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	ands r0, r1
	adds r0, #8
	ldr r1, _081750FC
	lsls r4, r4, #1
	adds r4, r4, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	cmp r0, #0
	bge _081750EC
	adds r0, #0xff
_081750EC:
	asrs r0, r0, #8
	strh r0, [r5, #0x24]
	ldrh r0, [r5, #0x2e]
	adds r0, #4
	strh r0, [r5, #0x2e]
_081750F6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081750FC: .4byte 0x082FA8CC
	thumb_func_end sub_081750A8

	thumb_func_start sub_08175100
sub_08175100: @ 0x08175100
	push {r4, lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf0
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl Random
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #7
	ands r2, r0
	rsbs r2, r2, #0
	ldr r0, _08175170
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08175174
	adds r4, r1, r0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x11
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	bl Random
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08175178
	movs r0, #0
	b _0817517A
	.align 2, 0
_08175170: .4byte 0x085C658C
_08175174: .4byte 0x020205AC
_08175178:
	movs r0, #1
_0817517A:
	strh r0, [r4, #0x30]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08175100

	thumb_func_start sub_08175184
sub_08175184: @ 0x08175184
	push {r4, lr}
	ldr r4, _081751B4
	movs r0, #0xb4
	strh r0, [r4]
	ldr r0, _081751B8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _081751AE
	ldr r1, _081751BC
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r4]
	strh r1, [r0, #0xa]
	ldr r0, _081751C0
	strh r2, [r0]
_081751AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081751B4: .4byte 0x02037280
_081751B8: .4byte 0x08175269
_081751BC: .4byte 0x03005B60
_081751C0: .4byte 0x02037282
	thumb_func_end sub_08175184

	thumb_func_start sub_081751C4
sub_081751C4: @ 0x081751C4
	push {r4, lr}
	ldr r0, _081751F0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _081751D8
	bl DestroyTask
_081751D8:
	bl sub_08152230
	ldr r4, _081751F4
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081751F0: .4byte 0x08175269
_081751F4: .4byte 0x000003E9
	thumb_func_end sub_081751C4

	thumb_func_start sub_081751F8
sub_081751F8: @ 0x081751F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0xe]
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	cmp r0, #0x6e
	ble _08175228
	ldr r2, _08175224
	movs r0, #0x28
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	subs r1, #1
	strh r1, [r0, #0x26]
	ldrb r0, [r5, #0x16]
	bl sub_081525AC
	b _0817525C
	.align 2, 0
_08175224: .4byte 0x03005B60
_08175228:
	adds r0, r1, #1
	ldrh r1, [r5, #0x1c]
	adds r0, r0, r1
	strh r0, [r5, #0xe]
	ldrb r4, [r5, #0x1a]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	ands r0, r1
	adds r0, #8
	ldr r1, _08175264
	lsls r4, r4, #1
	adds r4, r4, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	cmp r0, #0
	bge _08175252
	adds r0, #0xff
_08175252:
	asrs r0, r0, #8
	strh r0, [r5, #0xc]
	ldrh r0, [r5, #0x1a]
	adds r0, #4
	strh r0, [r5, #0x1a]
_0817525C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08175264: .4byte 0x082FA8CC
	thumb_func_end sub_081751F8

	thumb_func_start sub_08175268
sub_08175268: @ 0x08175268
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	movs r7, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08175294
	adds r6, r0, r1
	ldrh r0, [r6]
	cmp r0, #1
	beq _081752E4
	cmp r0, #1
	bgt _08175298
	cmp r0, #0
	beq _081752A0
	b _081753B4
	.align 2, 0
_08175294: .4byte 0x03005B68
_08175298:
	cmp r0, #0xff
	bne _0817529E
	b _081753A4
_0817529E:
	b _081753B4
_081752A0:
	movs r0, #0x40
	bl sub_0815219C
	cmp r0, #0
	bne _081752BC
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _081752D0
	strh r7, [r0]
	ldr r1, _081752D4
	ldr r2, _081752D8
	adds r0, r2, #0
	strh r0, [r1]
_081752BC:
	ldr r0, _081752DC
	bl LoadCompressedSpriteSheet
	ldr r0, _081752E0
	bl LoadCompressedSpritePalette
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	b _081753B4
	.align 2, 0
_081752D0: .4byte 0x02037280
_081752D4: .4byte 0x02037282
_081752D8: .4byte 0x0000FFFF
_081752DC: .4byte 0x085C6450
_081752E0: .4byte 0x085C6460
_081752E4:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0817537C
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0817537C
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf0
	bl __umodsi3
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	bl Random
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #7
	ands r4, r0
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x11
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0817538C
	ldr r2, _08175390
	str r4, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r3, r5, #0
	bl sub_081524A0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xff
	beq _0817537C
	adds r4, r7, #0
	ldr r1, _08175394
	adds r0, r4, #0
	bl sub_08152414
	bl Random
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0817536C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	bl sub_08152450
_0817536C:
	adds r0, r4, #0
	movs r1, #7
	mov r2, r8
	bl sub_08152450
	ldrh r0, [r6, #0x1e]
	adds r0, #1
	strh r0, [r6, #0x1e]
_0817537C:
	bl sub_081522B0
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _08175398
	subs r0, #1
	strh r0, [r6, #2]
	b _081753B4
	.align 2, 0
_0817538C: .4byte 0x085C64B8
_08175390: .4byte 0x000003E9
_08175394: .4byte 0x081751F9
_08175398:
	ldrh r0, [r6, #0x1e]
	cmp r0, #0
	bne _081753B4
	movs r0, #0xff
	strh r0, [r6]
	b _081753B4
_081753A4:
	bl sub_081751C4
	ldr r0, _081753C0
	strh r7, [r0]
	ldr r1, _081753C4
	ldr r2, _081753C8
	adds r0, r2, #0
	strh r0, [r1]
_081753B4:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081753C0: .4byte 0x02037280
_081753C4: .4byte 0x02037282
_081753C8: .4byte 0x0000FFFF
	thumb_func_end sub_08175268

