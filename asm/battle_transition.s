.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CB2_TestBattleTransition
CB2_TestBattleTransition: @ 0x08145F44
	push {r4, lr}
	ldr r4, _08145F54
	ldrb r0, [r4]
	cmp r0, #0
	beq _08145F58
	cmp r0, #1
	beq _08145F6C
	b _08145F80
	.align 2, 0
_08145F54: .4byte 0x0300120B
_08145F58:
	ldr r0, _08145F68
	ldrb r0, [r0]
	bl LaunchBattleTransitionTask
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08145F80
	.align 2, 0
_08145F68: .4byte 0x0300120A
_08145F6C:
	bl IsBattleTransitionDone
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08145F80
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08145F98
	bl SetMainCallback2
_08145F80:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145F98: .4byte 0x08085A31
	thumb_func_end CB2_TestBattleTransition

	thumb_func_start TestBattleTransition
TestBattleTransition: @ 0x08145F9C
	push {lr}
	ldr r1, _08145FAC
	strb r0, [r1]
	ldr r0, _08145FB0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08145FAC: .4byte 0x0300120A
_08145FB0: .4byte 0x08145F45
	thumb_func_end TestBattleTransition

	thumb_func_start BattleTransition_StartOnField
BattleTransition_StartOnField: @ 0x08145FB4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08145FC8
	ldr r1, _08145FCC
	str r1, [r2, #4]
	bl LaunchBattleTransitionTask
	pop {r0}
	bx r0
	.align 2, 0
_08145FC8: .4byte 0x03002360
_08145FCC: .4byte 0x080857B9
	thumb_func_end BattleTransition_StartOnField

	thumb_func_start BattleTransition_Start
BattleTransition_Start: @ 0x08145FD0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl LaunchBattleTransitionTask
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleTransition_Start

	thumb_func_start IsBattleTransitionDone
IsBattleTransitionDone: @ 0x08145FE0
	push {r4, lr}
	ldr r0, _08146004
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08146008
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x26
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0814600C
	movs r0, #0
	b _08146020
	.align 2, 0
_08146004: .4byte 0x08146069
_08146008: .4byte 0x03005B60
_0814600C:
	adds r0, r2, #0
	bl DestroyTask
	ldr r4, _08146028
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	movs r0, #1
_08146020:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146028: .4byte 0x0203A86C
	thumb_func_end IsBattleTransitionDone

	thumb_func_start LaunchBattleTransitionTask
LaunchBattleTransitionTask: @ 0x0814602C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0814605C
	movs r1, #2
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08146060
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xa]
	ldr r4, _08146064
	movs r0, #0x3c
	bl AllocZeroed
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814605C: .4byte 0x08146069
_08146060: .4byte 0x03005B60
_08146064: .4byte 0x0203A86C
	thumb_func_end LaunchBattleTransitionTask

	thumb_func_start Phase2Task_29
Phase2Task_29: @ 0x08146068
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08146098
	ldr r2, _0814609C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814607A:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814607A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146098: .4byte 0x085A8548
_0814609C: .4byte 0x03005B60
	thumb_func_end Phase2Task_29

	thumb_func_start Transition_Phase1
Transition_Phase1: @ 0x081460A0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080ABCCC
	ldr r0, _081460CC
	ldr r1, _081460D0
	ldr r2, _081460D4
	bl CpuSet
	ldr r1, _081460D8
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _081460DC
	movs r0, #2
	strh r0, [r4, #8]
	movs r0, #1
	b _081460EA
	.align 2, 0
_081460CC: .4byte 0x020377B4
_081460D0: .4byte 0x020373B4
_081460D4: .4byte 0x04000100
_081460D8: .4byte 0x085A83F8
_081460DC:
	movs r1, #4
	bl CreateTask
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
_081460EA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Transition_Phase1

	thumb_func_start Transition_WaitForPhase1
Transition_WaitForPhase1: @ 0x081460F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08146110
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08146114
	movs r0, #0
	b _0814611C
	.align 2, 0
_08146110: .4byte 0x085A83F8
_08146114:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
_0814611C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Transition_WaitForPhase1

	thumb_func_start Transition_Phase2
Transition_Phase2: @ 0x08146124
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08146148
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl CreateTask
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146148: .4byte 0x085A84A0
	thumb_func_end Transition_Phase2

	thumb_func_start Transition_WaitForPhase2
Transition_WaitForPhase2: @ 0x0814614C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x26]
	ldr r1, _08146178
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08146170
	movs r0, #1
	strh r0, [r4, #0x26]
_08146170:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146178: .4byte 0x085A84A0
	thumb_func_end Transition_WaitForPhase2

	thumb_func_start Phase1Task_TransitionAll
Phase1Task_TransitionAll: @ 0x0814617C
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	ldr r1, _081461B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #8]
	movs r3, #8
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _081461B4
	adds r0, r2, #1
	strh r0, [r1, #8]
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #3
	movs r3, #2
	bl CreatePhase1Task
	b _081461C4
	.align 2, 0
_081461B0: .4byte 0x03005B60
_081461B4:
	bl IsPhase1Done
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081461C4
	adds r0, r4, #0
	bl DestroyTask
_081461C4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Phase1Task_TransitionAll

	thumb_func_start Phase2Task_30
Phase2Task_30: @ 0x081461CC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081461FC
	ldr r2, _08146200
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081461DE:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081461DE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081461FC: .4byte 0x085A8558
_08146200: .4byte 0x03005B60
	thumb_func_end Phase2Task_30

	thumb_func_start Phase2_Blur_Func1
Phase2_Blur_Func1: @ 0x08146204
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0x40
	bl SetGpuRegBits
	movs r0, #0xc
	movs r1, #0x40
	bl SetGpuRegBits
	movs r0, #0xe
	movs r1, #0x40
	bl SetGpuRegBits
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Phase2_Blur_Func1

	thumb_func_start Phase2_Blur_Func2
Phase2_Blur_Func2: @ 0x08146238
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0814624E
	subs r0, #1
	strh r0, [r4, #0xa]
	b _0814628E
_0814624E:
	movs r0, #4
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _08146270
	movs r1, #1
	rsbs r1, r1, #0
	str r2, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_08146270:
	ldrh r1, [r4, #0xc]
	movs r0, #0xf
	ands r0, r1
	lsls r1, r0, #4
	orrs r1, r0
	movs r0, #0x4c
	bl SetGpuReg
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xe
	ble _0814628E
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0814628E:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Phase2_Blur_Func2

	thumb_func_start Phase2_Blur_Func3
Phase2_Blur_Func3: @ 0x08146298
	push {lr}
	ldr r0, _081462BC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081462B4
	ldr r0, _081462C0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081462B4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081462BC: .4byte 0x02037C74
_081462C0: .4byte 0x081461CD
	thumb_func_end Phase2_Blur_Func3

	thumb_func_start Phase2Task_31
Phase2Task_31: @ 0x081462C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081462F4
	ldr r2, _081462F8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081462D6:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081462D6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081462F4: .4byte 0x085A8564
_081462F8: .4byte 0x03005B60
	thumb_func_end Phase2Task_31

	thumb_func_start Phase2_Swirl_Func1
Phase2_Swirl_Func1: @ 0x081462FC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	movs r0, #1
	rsbs r0, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r1, #4
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08146358
	ldr r1, _0814635C
	ldr r1, [r1]
	movs r2, #0x14
	ldrsh r1, [r1, r2]
	str r4, [sp]
	movs r2, #0xa0
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #2
	bl sub_0814A058
	ldr r0, _08146360
	bl SetVBlankCallback
	ldr r0, _08146364
	bl SetHBlankCallback
	movs r0, #3
	bl EnableInterrupts
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08146358: .4byte 0x02039048
_0814635C: .4byte 0x0203A86C
_08146360: .4byte 0x081463E1
_08146364: .4byte 0x08146419
	thumb_func_end Phase2_Swirl_Func1

	thumb_func_start Phase2_Swirl_Func2
Phase2_Swirl_Func2: @ 0x08146368
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _081463D0
	ldr r2, [r4]
	ldrb r1, [r2]
	movs r1, #0
	strb r1, [r2]
	ldrh r1, [r0, #0xa]
	adds r1, #4
	strh r1, [r0, #0xa]
	ldrh r1, [r0, #0xc]
	adds r1, #8
	strh r1, [r0, #0xc]
	ldr r3, _081463D4
	ldr r1, [r4]
	movs r2, #0x14
	ldrsh r1, [r1, r2]
	movs r5, #0xa
	ldrsh r2, [r0, r5]
	movs r5, #0xc
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r0, #0xa0
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #2
	bl sub_0814A058
	ldr r0, _081463D8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081463BA
	ldr r0, _081463DC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081463BA:
	ldr r0, [r4]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081463D0: .4byte 0x0203A86C
_081463D4: .4byte 0x020388C8
_081463D8: .4byte 0x02037C74
_081463DC: .4byte 0x081462C5
	thumb_func_end Phase2_Swirl_Func2

	thumb_func_start VBlankCB_Phase2_Swirl
VBlankCB_Phase2_Swirl: @ 0x081463E0
	push {lr}
	bl VBlankCB_BattleTransition
	ldr r0, _08146408
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08146404
	ldr r1, _0814640C
	ldr r0, _08146410
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _08146414
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08146404:
	pop {r0}
	bx r0
	.align 2, 0
_08146408: .4byte 0x0203A86C
_0814640C: .4byte 0x040000D4
_08146410: .4byte 0x020388C8
_08146414: .4byte 0x800000A0
	thumb_func_end VBlankCB_Phase2_Swirl

	thumb_func_start HBlankCB_Phase2_Shuffle
HBlankCB_Phase2_Shuffle: @ 0x08146418
	ldr r1, _08146438
	ldr r0, _0814643C
	ldrh r0, [r0]
	lsls r0, r0, #1
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08146440
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_08146438: .4byte 0x020388C8
_0814643C: .4byte 0x04000006
_08146440: .4byte 0x04000014
	thumb_func_end HBlankCB_Phase2_Shuffle

	thumb_func_start Phase2Task_32
Phase2Task_32: @ 0x08146444
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08146474
	ldr r2, _08146478
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08146456:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08146456
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146474: .4byte 0x085A856C
_08146478: .4byte 0x03005B60
	thumb_func_end Phase2Task_32

	thumb_func_start Phase2_Shuffle_Func1
Phase2_Shuffle_Func1: @ 0x0814647C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _081464D0
	ldr r1, [r0]
	ldr r0, _081464D4
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	movs r2, #0xa0
	lsls r2, r2, #1
	bl memset
	ldr r0, _081464D8
	bl SetVBlankCallback
	ldr r0, _081464DC
	bl SetHBlankCallback
	movs r0, #3
	bl EnableInterrupts
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081464D0: .4byte 0x0203A86C
_081464D4: .4byte 0x02039048
_081464D8: .4byte 0x08146571
_081464DC: .4byte 0x081465A9
	thumb_func_end Phase2_Shuffle_Func1

	thumb_func_start Phase2_Shuffle_Func2
Phase2_Shuffle_Func2: @ 0x081464E0
	push {r4, r5, r6, r7, lr}
	ldr r1, _08146560
	ldr r2, [r1]
	ldrb r1, [r2]
	movs r1, #0
	strb r1, [r2]
	ldrh r4, [r0, #0xa]
	ldrh r2, [r0, #0xc]
	lsls r3, r2, #0x10
	asrs r3, r3, #0x18
	movs r5, #0x84
	lsls r5, r5, #5
	adds r1, r4, r5
	strh r1, [r0, #0xa]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r2, r2, r1
	strh r2, [r0, #0xc]
	movs r5, #0
	lsls r7, r3, #0x10
_08146508:
	lsrs r0, r4, #8
	asrs r1, r7, #0x10
	bl Sin
	ldr r1, _08146564
	lsls r2, r5, #1
	adds r2, r2, r1
	ldr r6, _08146560
	ldr r1, [r6]
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0x84
	lsls r1, r1, #5
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r5, #0x9f
	bls _08146508
	ldr r0, _08146568
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0814654E
	ldr r0, _0814656C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0814654E:
	ldr r0, [r6]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08146560: .4byte 0x0203A86C
_08146564: .4byte 0x020388C8
_08146568: .4byte 0x02037C74
_0814656C: .4byte 0x08146445
	thumb_func_end Phase2_Shuffle_Func2

	thumb_func_start VBlankCB_Phase2_Shuffle
VBlankCB_Phase2_Shuffle: @ 0x08146570
	push {lr}
	bl VBlankCB_BattleTransition
	ldr r0, _08146598
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08146594
	ldr r1, _0814659C
	ldr r0, _081465A0
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _081465A4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08146594:
	pop {r0}
	bx r0
	.align 2, 0
_08146598: .4byte 0x0203A86C
_0814659C: .4byte 0x040000D4
_081465A0: .4byte 0x020388C8
_081465A4: .4byte 0x800000A0
	thumb_func_end VBlankCB_Phase2_Shuffle

	thumb_func_start HBlankCB_Phase2_Swirl
HBlankCB_Phase2_Swirl: @ 0x081465A8
	ldr r1, _081465C8
	ldr r0, _081465CC
	ldrh r0, [r0]
	lsls r0, r0, #1
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _081465D0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_081465C8: .4byte 0x020388C8
_081465CC: .4byte 0x04000006
_081465D0: .4byte 0x04000016
	thumb_func_end HBlankCB_Phase2_Swirl

	thumb_func_start Phase2Task_33
Phase2Task_33: @ 0x081465D4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08146604
	ldr r2, _08146608
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081465E6:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081465E6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146604: .4byte 0x085A85AC
_08146608: .4byte 0x03005B60
	thumb_func_end Phase2Task_33

	thumb_func_start Phase2Task_Aqua
Phase2Task_Aqua: @ 0x0814660C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0814663C
	ldr r2, _08146640
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814661E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814661E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814663C: .4byte 0x085A8574
_08146640: .4byte 0x03005B60
	thumb_func_end Phase2Task_Aqua

	thumb_func_start Phase2Task_BigPokeball
Phase2Task_BigPokeball: @ 0x08146644
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08146674
	ldr r2, _08146678
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08146656:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08146656
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146674: .4byte 0x085A8590
_08146678: .4byte 0x03005B60
	thumb_func_end Phase2Task_BigPokeball

	thumb_func_start Phase2Task_Blackhole1
Phase2Task_Blackhole1: @ 0x0814667C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081466AC
	ldr r2, _081466B0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814668E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814668E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081466AC: .4byte 0x085A85C4
_081466B0: .4byte 0x03005B60
	thumb_func_end Phase2Task_Blackhole1

	thumb_func_start Phase2Task_Blackhole2
Phase2Task_Blackhole2: @ 0x081466B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081466E4
	ldr r2, _081466E8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081466C6:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081466C6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081466E4: .4byte 0x085A85DC
_081466E8: .4byte 0x03005B60
	thumb_func_end Phase2Task_Blackhole2

	thumb_func_start Phase2Task_Blur
Phase2Task_Blur: @ 0x081466EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0814671C
	ldr r2, _08146720
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081466FE:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081466FE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814671C: .4byte 0x085A85F4
_08146720: .4byte 0x03005B60
	thumb_func_end Phase2Task_Blur

	thumb_func_start Phase2Task_Clockwise_BlackFade
Phase2Task_Clockwise_BlackFade: @ 0x08146724
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08146754
	ldr r2, _08146758
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08146736:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08146736
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146754: .4byte 0x085A860C
_08146758: .4byte 0x03005B60
	thumb_func_end Phase2Task_Clockwise_BlackFade

	thumb_func_start sub_0814675C
sub_0814675C: @ 0x0814675C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	movs r1, #0
	movs r0, #0x10
	strh r0, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r4, #0x12]
	ldr r0, _081467B8
	ldr r2, [r0]
	movs r0, #0x3f
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	movs r0, #0xf0
	strh r0, [r2, #6]
	movs r0, #0xa0
	strh r0, [r2, #8]
	ldr r0, _081467BC
	strh r0, [r2, #0xe]
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r2, #0x10]
	ldr r0, _081467C0
	movs r2, #0xf0
	movs r1, #0x9f
	ldr r3, _081467C4
	adds r0, r0, r3
_081467A2:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _081467A2
	ldr r0, _081467C8
	bl SetVBlankCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081467B8: .4byte 0x0203A86C
_081467BC: .4byte 0x00003F41
_081467C0: .4byte 0x020388C8
_081467C4: .4byte 0x000008BE
_081467C8: .4byte 0x08146FFD
	thumb_func_end sub_0814675C

	thumb_func_start Phase2_Aqua_Func1
Phase2_Aqua_Func1: @ 0x081467CC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r5, #0
	movs r0, #0x3c
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_0814675C
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r0, sp
	strh r5, [r0]
	ldr r1, [sp, #4]
	ldr r2, _08146814
	bl CpuSet
	ldr r0, _08146818
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _0814681C
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08146814: .4byte 0x01000400
_08146818: .4byte 0x0859A980
_0814681C: .4byte 0x0859A960
	thumb_func_end Phase2_Aqua_Func1

	thumb_func_start Phase2_Magma_Func1
Phase2_Magma_Func1: @ 0x08146820
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r5, #0
	movs r0, #0x3c
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_0814675C
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r0, sp
	strh r5, [r0]
	ldr r1, [sp, #4]
	ldr r2, _08146868
	bl CpuSet
	ldr r0, _0814686C
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _08146870
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08146868: .4byte 0x01000400
_0814686C: .4byte 0x0859AF54
_08146870: .4byte 0x0859A960
	thumb_func_end Phase2_Magma_Func1

	thumb_func_start Phase2_Regi_Func1
Phase2_Regi_Func1: @ 0x08146874
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r5, #0
	movs r0, #0x3c
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_0814675C
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r0, sp
	strh r5, [r0]
	ldr r1, [sp, #4]
	ldr r2, _081468B8
	bl CpuSet
	ldr r0, _081468BC
	ldr r1, [sp, #8]
	movs r2, #0x80
	lsls r2, r2, #5
	bl CpuSet
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081468B8: .4byte 0x01000400
_081468BC: .4byte 0x0859B6C4
	thumb_func_end Phase2_Regi_Func1

	thumb_func_start Phase2_BigPokeball_Func1
Phase2_BigPokeball_Func1: @ 0x081468C0
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_0814675C
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r2, _08146908
	mov r0, sp
	bl CpuSet
	ldr r0, _0814690C
	ldr r1, [sp, #8]
	movs r2, #0xb0
	lsls r2, r2, #2
	bl CpuSet
	ldr r0, _08146910
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146908: .4byte 0x01000400
_0814690C: .4byte 0x08598DE0
_08146910: .4byte 0x085A8984
	thumb_func_end Phase2_BigPokeball_Func1

	thumb_func_start Phase2_BigPokeball_Func2
Phase2_BigPokeball_Func2: @ 0x08146914
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldr r5, _0814699C
	movs r1, #0
	ldr r0, [sp, #8]
	mov sb, r0
	ldr r6, _081469A0
	mov r8, r6
	movs r0, #0xf0
	lsls r0, r0, #8
	mov ip, r0
_0814693A:
	movs r0, #0
	lsls r3, r1, #0x10
	asrs r4, r3, #0xb
_08146940:
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, sb
	ldrh r0, [r5]
	mov r6, ip
	orrs r0, r6
	strh r0, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	adds r5, #2
	lsrs r0, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x1d
	ble _08146940
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _0814693A
	movs r6, #0x10
	ldrsh r2, [r7, r6]
	movs r1, #0x12
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0xa0
	str r0, [sp, #4]
	mov r0, r8
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldrh r0, [r7, #8]
	adds r0, #1
	strh r0, [r7, #8]
	movs r0, #1
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814699C: .4byte 0x085A8AD0
_081469A0: .4byte 0x020388C8
	thumb_func_end Phase2_BigPokeball_Func2

	thumb_func_start Phase2_Aqua_Func2
Phase2_Aqua_Func2: @ 0x081469A4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldr r0, _081469E4
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _081469E8
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	str r1, [sp]
	movs r1, #0xa0
	str r1, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081469E4: .4byte 0x0859ACF8
_081469E8: .4byte 0x020388C8
	thumb_func_end Phase2_Aqua_Func2

	thumb_func_start Phase2_Magma_Func2
Phase2_Magma_Func2: @ 0x081469EC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldr r0, _08146A2C
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _08146A30
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	str r1, [sp]
	movs r1, #0xa0
	str r1, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146A2C: .4byte 0x0859B3E0
_08146A30: .4byte 0x020388C8
	thumb_func_end Phase2_Magma_Func2

	thumb_func_start Phase2_Regice_Func2
Phase2_Regice_Func2: @ 0x08146A34
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldr r0, _08146A80
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08146A84
	ldr r1, [sp, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	bl CpuSet
	ldr r0, _08146A88
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	str r1, [sp]
	movs r1, #0xa0
	str r1, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146A80: .4byte 0x0859BD64
_08146A84: .4byte 0x0859BDC4
_08146A88: .4byte 0x020388C8
	thumb_func_end Phase2_Regice_Func2

	thumb_func_start Phase2_Registeel_Func2
Phase2_Registeel_Func2: @ 0x08146A8C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldr r0, _08146AD8
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08146ADC
	ldr r1, [sp, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	bl CpuSet
	ldr r0, _08146AE0
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	str r1, [sp]
	movs r1, #0xa0
	str r1, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146AD8: .4byte 0x0859BD84
_08146ADC: .4byte 0x0859C5C4
_08146AE0: .4byte 0x020388C8
	thumb_func_end Phase2_Registeel_Func2

	thumb_func_start Phase2_Regirock_Func2
Phase2_Regirock_Func2: @ 0x08146AE4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldr r0, _08146B30
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08146B34
	ldr r1, [sp, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	bl CpuSet
	ldr r0, _08146B38
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	str r1, [sp]
	movs r1, #0xa0
	str r1, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146B30: .4byte 0x0859BDA4
_08146B34: .4byte 0x0859CDC4
_08146B38: .4byte 0x020388C8
	thumb_func_end Phase2_Regirock_Func2

	thumb_func_start Phase2_Kyogre_Func3
Phase2_Kyogre_Func3: @ 0x08146B3C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r2, _08146B7C
	mov r0, sp
	bl CpuSet
	ldr r0, _08146B80
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _08146B84
	ldr r1, [sp, #4]
	bl LZ77UnCompVram
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146B7C: .4byte 0x01000400
_08146B80: .4byte 0x0859D5E4
_08146B84: .4byte 0x0859DC98
	thumb_func_end Phase2_Kyogre_Func3

	thumb_func_start Phase2_Kyogre_Func4
Phase2_Kyogre_Func4: @ 0x08146B88
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r5, [r4, r0]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08146BC0
	adds r0, r5, #0
	movs r1, #0x1e
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	ldr r1, _08146BE0
	adds r0, r0, r1
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
_08146BC0:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3a
	ble _08146BD8
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0xa]
_08146BD8:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08146BE0: .4byte 0x0859E850
	thumb_func_end Phase2_Kyogre_Func4

	thumb_func_start Phase2_Kyogre_Func5
Phase2_Kyogre_Func5: @ 0x08146BE4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r5, [r4, r0]
	adds r0, r5, #0
	movs r1, #5
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08146C12
	adds r0, r5, #0
	movs r1, #5
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xb
	ldr r1, _08146C38
	adds r0, r0, r1
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
_08146C12:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x44
	ble _08146C2E
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #0x1e
	strh r0, [r4, #0x18]
_08146C2E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08146C38: .4byte 0x0859E990
	thumb_func_end Phase2_Kyogre_Func5

	thumb_func_start Phase2_WeatherDuo_Func6
Phase2_WeatherDuo_Func6: @ 0x08146C3C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08146C64
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146C64: .4byte 0xFFFF8000
	thumb_func_end Phase2_WeatherDuo_Func6

	thumb_func_start Phase2_WeatherDuo_Func7
Phase2_WeatherDuo_Func7: @ 0x08146C68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08146CA8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08146C9E
	ldr r1, _08146CAC
	ldrh r2, [r1, #0xa]
	ldr r0, _08146CB0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08146CB4
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_08146C9E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146CA8: .4byte 0x02037C74
_08146CAC: .4byte 0x040000B0
_08146CB0: .4byte 0x0000C5FF
_08146CB4: .4byte 0x00007FFF
	thumb_func_end Phase2_WeatherDuo_Func7

	thumb_func_start Phase2_BigPokeball_Func3
Phase2_BigPokeball_Func3: @ 0x08146CB8
	push {r4, r5, lr}
	sub sp, #8
	adds r3, r0, #0
	ldr r2, _08146D40
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r3, #0xe]
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	adds r4, r2, #0
	cmp r0, #0
	beq _08146CDE
	subs r0, r1, #1
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08146CE8
_08146CDE:
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	movs r0, #2
	strh r0, [r3, #0xe]
_08146CE8:
	ldr r2, [r4]
	ldrh r0, [r3, #0xa]
	lsls r0, r0, #8
	ldrh r1, [r3, #0xc]
	orrs r0, r1
	strh r0, [r2, #0x10]
	movs r5, #0xc
	ldrsh r0, [r3, r5]
	cmp r0, #0xf
	ble _08146D02
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_08146D02:
	ldrh r0, [r3, #0x10]
	adds r0, #8
	strh r0, [r3, #0x10]
	ldr r0, _08146D44
	adds r1, r0, #0
	ldrh r5, [r3, #0x12]
	adds r1, r1, r5
	strh r1, [r3, #0x12]
	ldr r0, _08146D48
	movs r5, #0x10
	ldrsh r2, [r3, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xa0
	str r1, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08146D40: .4byte 0x0203A86C
_08146D44: .4byte 0xFFFFFF00
_08146D48: .4byte 0x020388C8
	thumb_func_end Phase2_BigPokeball_Func3

	thumb_func_start Phase2_BigPokeball_Func4
Phase2_BigPokeball_Func4: @ 0x08146D4C
	push {r4, r5, lr}
	sub sp, #8
	adds r3, r0, #0
	ldr r2, _08146DD4
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r3, #0xe]
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	adds r4, r2, #0
	cmp r0, #0
	beq _08146D72
	subs r0, r1, #1
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08146D7C
_08146D72:
	ldrh r0, [r3, #0xa]
	subs r0, #1
	strh r0, [r3, #0xa]
	movs r0, #2
	strh r0, [r3, #0xe]
_08146D7C:
	ldr r2, [r4]
	ldrh r0, [r3, #0xa]
	lsls r0, r0, #8
	ldrh r1, [r3, #0xc]
	orrs r0, r1
	strh r0, [r2, #0x10]
	movs r5, #0xa
	ldrsh r0, [r3, r5]
	cmp r0, #0
	bne _08146D96
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_08146D96:
	ldrh r0, [r3, #0x10]
	adds r0, #8
	strh r0, [r3, #0x10]
	ldr r0, _08146DD8
	adds r1, r0, #0
	ldrh r5, [r3, #0x12]
	adds r1, r1, r5
	strh r1, [r3, #0x12]
	ldr r0, _08146DDC
	movs r5, #0x10
	ldrsh r2, [r3, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xa0
	str r1, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08146DD4: .4byte 0x0203A86C
_08146DD8: .4byte 0xFFFFFF00
_08146DDC: .4byte 0x020388C8
	thumb_func_end Phase2_BigPokeball_Func4

	thumb_func_start Phase2_BigPokeball_Func5
Phase2_BigPokeball_Func5: @ 0x08146DE0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r7, _08146E44
	ldr r0, [r7]
	ldrb r1, [r0]
	movs r6, #0
	strb r6, [r0]
	ldrh r0, [r4, #0x10]
	adds r0, #8
	strh r0, [r4, #0x10]
	ldr r0, _08146E48
	adds r1, r0, #0
	ldrh r3, [r4, #0x12]
	adds r1, r1, r3
	strh r1, [r4, #0x12]
	ldr r0, _08146E4C
	movs r3, #0x10
	ldrsh r2, [r4, r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	str r1, [sp]
	movs r5, #0xa0
	str r5, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _08146E30
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0xc]
	strh r6, [r4, #0xe]
_08146E30:
	ldr r0, [r7]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08146E44: .4byte 0x0203A86C
_08146E48: .4byte 0xFFFFFF00
_08146E4C: .4byte 0x020388C8
	thumb_func_end Phase2_BigPokeball_Func5

	thumb_func_start Phase2_FramesCountdown
Phase2_FramesCountdown: @ 0x08146E50
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x18]
	subs r0, #1
	strh r0, [r1, #0x18]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08146E66
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_08146E66:
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end Phase2_FramesCountdown

	thumb_func_start Phase2_WeatherTrio_Func1
Phase2_WeatherTrio_Func1: @ 0x08146E6C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08146E94
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146E94: .4byte 0x0000FFFF
	thumb_func_end Phase2_WeatherTrio_Func1

	thumb_func_start Phase2_WaitPaletteFade
Phase2_WaitPaletteFade: @ 0x08146E98
	push {lr}
	adds r2, r0, #0
	ldr r0, _08146EB4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08146EAE
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_08146EAE:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08146EB4: .4byte 0x02037C74
	thumb_func_end Phase2_WaitPaletteFade

	thumb_func_start Phase2_BigPokeball_Func6
Phase2_BigPokeball_Func6: @ 0x08146EB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08146F38
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r3, #0
	strb r3, [r0]
	ldrh r2, [r4, #0xc]
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, _08146F3C
	cmp r1, r0
	bgt _08146ED8
	adds r0, r2, #0
	adds r0, #0x80
	strh r0, [r4, #0xc]
_08146ED8:
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08146EF4
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	subs r0, r1, r0
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08146EF4
	strh r3, [r4, #0xa]
_08146EF4:
	ldr r0, _08146F40
	movs r1, #0xa
	ldrsh r3, [r4, r1]
	movs r1, #0x78
	movs r2, #0x50
	bl sub_0814A0D4
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08146F50
	movs r0, #0
	bl SetVBlankCallback
	ldr r1, _08146F44
	ldrh r2, [r1, #0xa]
	ldr r0, _08146F48
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08146F4C
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	b _08146F70
	.align 2, 0
_08146F38: .4byte 0x0203A86C
_08146F3C: .4byte 0x000003FF
_08146F40: .4byte 0x020388C8
_08146F44: .4byte 0x040000B0
_08146F48: .4byte 0x0000C5FF
_08146F4C: .4byte 0x00007FFF
_08146F50:
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08146F64
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	ldr r0, _08146F78
	bl SetVBlankCallback
_08146F64:
	ldr r0, _08146F7C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
_08146F70:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146F78: .4byte 0x08147029
_08146F7C: .4byte 0x0203A86C
	thumb_func_end Phase2_BigPokeball_Func6

	thumb_func_start Transition_BigPokeball_Vblank
Transition_BigPokeball_Vblank: @ 0x08146F80
	push {lr}
	ldr r1, _08146FDC
	ldrh r2, [r1, #0xa]
	ldr r0, _08146FE0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08146FE4
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl VBlankCB_BattleTransition
	ldr r2, _08146FE8
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08146FB8
	ldr r1, _08146FEC
	ldr r0, _08146FF0
	str r0, [r1]
	movs r3, #0xf0
	lsls r3, r3, #3
	adds r0, r0, r3
	str r0, [r1, #4]
	ldr r0, _08146FF4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08146FB8:
	ldr r1, _08146FF8
	ldr r2, [r2]
	ldrh r0, [r2, #2]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #4]
	strh r0, [r1]
	subs r1, #6
	ldrh r0, [r2, #8]
	strh r0, [r1]
	adds r1, #0xc
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08146FDC: .4byte 0x040000B0
_08146FE0: .4byte 0x0000C5FF
_08146FE4: .4byte 0x00007FFF
_08146FE8: .4byte 0x0203A86C
_08146FEC: .4byte 0x040000D4
_08146FF0: .4byte 0x020388C8
_08146FF4: .4byte 0x800000A0
_08146FF8: .4byte 0x04000048
	thumb_func_end Transition_BigPokeball_Vblank

	thumb_func_start VBlankCB0_Phase2_BigPokeball
VBlankCB0_Phase2_BigPokeball: @ 0x08146FFC
	push {lr}
	bl Transition_BigPokeball_Vblank
	ldr r1, _08147018
	ldr r0, _0814701C
	str r0, [r1]
	ldr r0, _08147020
	str r0, [r1, #4]
	ldr r0, _08147024
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08147018: .4byte 0x040000B0
_0814701C: .4byte 0x02039048
_08147020: .4byte 0x04000010
_08147024: .4byte 0xA2400001
	thumb_func_end VBlankCB0_Phase2_BigPokeball

	thumb_func_start VBlankCB1_Phase2_BigPokeball
VBlankCB1_Phase2_BigPokeball: @ 0x08147028
	push {lr}
	bl Transition_BigPokeball_Vblank
	ldr r1, _08147044
	ldr r0, _08147048
	str r0, [r1]
	ldr r0, _0814704C
	str r0, [r1, #4]
	ldr r0, _08147050
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08147044: .4byte 0x040000B0
_08147048: .4byte 0x02039048
_0814704C: .4byte 0x04000040
_08147050: .4byte 0xA2400001
	thumb_func_end VBlankCB1_Phase2_BigPokeball

	thumb_func_start Phase2Task_GridSquares
Phase2Task_GridSquares: @ 0x08147054
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08147084
	ldr r2, _08147088
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08147066:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08147066
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147084: .4byte 0x085A862C
_08147088: .4byte 0x03005B60
	thumb_func_end Phase2Task_GridSquares

	thumb_func_start Phase2_PokeballsTrail_Func1
Phase2_PokeballsTrail_Func1: @ 0x0814708C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	ldr r0, _081470CC
	ldr r1, [sp, #8]
	movs r2, #0x20
	bl CpuSet
	movs r0, #0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, _081470D0
	mov r0, sp
	bl CpuSet
	ldr r0, _081470D4
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081470CC: .4byte 0x08599360
_081470D0: .4byte 0x05000200
_081470D4: .4byte 0x085A8984
	thumb_func_end Phase2_PokeballsTrail_Func1

	thumb_func_start Phase2_PokeballsTrail_Func2
Phase2_PokeballsTrail_Func2: @ 0x081470D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, _08147158
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r4, sp, #4
	ldr r1, _0814715C
	adds r0, r4, #0
	movs r2, #0xa
	bl memcpy
	bl Random
	movs r5, #1
	ands r5, r0
	movs r1, #0
	mov r8, r4
	ldr r6, _08147160
_08147106:
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r0, r5, #1
	add r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r6]
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #5
	adds r0, #0x10
	str r0, [r6, #4]
	str r5, [r6, #8]
	lsls r0, r4, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	str r0, [r6, #0xc]
	movs r0, #0x2d
	bl FieldEffectStart
	adds r4, #1
	lsls r4, r4, #0x10
	movs r0, #1
	eors r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsrs r1, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _08147106
	ldrh r0, [r7, #8]
	adds r0, #1
	strh r0, [r7, #8]
	movs r0, #0
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147158: .4byte 0x085A8638
_0814715C: .4byte 0x085A863C
_08147160: .4byte 0x020388A8
	thumb_func_end Phase2_PokeballsTrail_Func2

	thumb_func_start Phase2_PokeballsTrail_Func3
Phase2_PokeballsTrail_Func3: @ 0x08147164
	push {lr}
	movs r0, #0x2d
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08147184
	bl sub_0814A044
	ldr r0, _0814718C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_08147184:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0814718C: .4byte 0x08147055
	thumb_func_end Phase2_PokeballsTrail_Func3

	thumb_func_start FldEff_Pokeball
FldEff_Pokeball: @ 0x08147190
	push {r4, r5, lr}
	ldr r0, _081471EC
	ldr r5, _081471F0
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r2, [r5, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081471F4
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r1
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #5]
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, [r5, #8]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0xc]
	strh r0, [r4, #0x30]
	ldr r0, _081471F8
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	ldrb r1, [r5, #8]
	adds r0, r4, #0
	bl StartSpriteAffineAnim
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081471EC: .4byte 0x085A8918
_081471F0: .4byte 0x020388A8
_081471F4: .4byte 0x020205AC
_081471F8: .4byte 0x0000FFFF
	thumb_func_end FldEff_Pokeball

	thumb_func_start sub_081471FC
sub_081471FC: @ 0x081471FC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0814721C
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08147220
	subs r0, r1, #1
	strh r0, [r4, #0x30]
	b _081472B2
	.align 2, 0
_0814721C: .4byte 0x085A8646
_08147220:
	ldrh r0, [r4, #0x20]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xf0
	bhi _0814728E
	asrs r0, r1, #0x13
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0x22]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r2, r0, #0x10
	asrs r5, r0, #0x10
	movs r3, #0x32
	ldrsh r0, [r4, r3]
	cmp r5, r0
	beq _0814728E
	strh r2, [r4, #0x32]
	ldr r0, _081472BC
	ldrh r2, [r0]
	lsrs r2, r2, #8
	movs r0, #0x1f
	ands r2, r0
	lsls r2, r2, #0xb
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r1, #2
	lsls r0, r0, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r6, _081472C0
	adds r3, r6, #0
	strh r3, [r0]
	subs r0, r1, #1
	lsls r0, r0, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r2
	strh r3, [r0]
	lsls r0, r1, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r2
	strh r3, [r0]
	adds r1, #1
	lsls r1, r1, #5
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r1, r1, r2
	strh r3, [r1]
_0814728E:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	adds r0, #0xf
	lsls r0, r0, #0x10
	movs r1, #0x87
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _081472B2
	adds r0, r4, #0
	movs r1, #0x2d
	bl FieldEffectStop
_081472B2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081472BC: .4byte 0x04000008
_081472C0: .4byte 0x0000F001
	thumb_func_end sub_081471FC

	thumb_func_start Phase2Task_Groudon
Phase2Task_Groudon: @ 0x081472C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081472F4
	ldr r2, _081472F8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081472D6:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081472D6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081472F4: .4byte 0x085A864C
_081472F8: .4byte 0x03005B60
	thumb_func_end Phase2Task_Groudon

	thumb_func_start Phase2_Clockwise_BlackFade_Func1
Phase2_Clockwise_BlackFade_Func1: @ 0x081472FC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	ldr r0, _08147350
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #2]
	movs r0, #0x3f
	strh r0, [r1, #4]
	ldr r0, _08147354
	strh r0, [r1, #6]
	movs r0, #0xa0
	strh r0, [r1, #8]
	movs r1, #0
	ldr r3, _08147358
	ldr r2, _0814735C
_08147322:
	lsls r0, r1, #1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bls _08147322
	ldr r0, _08147360
	bl SetVBlankCallback
	ldr r0, _08147350
	ldr r1, [r0]
	movs r0, #0x78
	strh r0, [r1, #0x2c]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08147350: .4byte 0x0203A86C
_08147354: .4byte 0x0000F0F1
_08147358: .4byte 0x02039048
_0814735C: .4byte 0x0000F3F4
_08147360: .4byte 0x08147749
	thumb_func_end Phase2_Clockwise_BlackFade_Func1

	thumb_func_start Phase2_Clockwise_BlackFade_Func2
Phase2_Clockwise_BlackFade_Func2: @ 0x08147364
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r2, _081473EC
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x24
	movs r2, #0x2c
	ldrsh r3, [r1, r2]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x78
	movs r2, #0x50
	bl sub_0814A26C
	ldr r5, _081473F0
_08147394:
	ldr r4, _081473EC
	ldr r0, [r4]
	movs r7, #0x2a
	ldrsh r3, [r0, r7]
	lsls r3, r3, #1
	adds r3, r3, r5
	ldrh r1, [r0, #0x28]
	adds r1, #1
	movs r7, #0xf0
	lsls r7, r7, #7
	adds r2, r7, #0
	orrs r1, r2
	strh r1, [r3]
	adds r0, #0x24
	movs r1, #1
	movs r2, #1
	bl sub_0814A2E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08147394
	ldr r1, [r4]
	ldrh r0, [r1, #0x2c]
	adds r0, #0x10
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xef
	ble _081473D8
	movs r0, #0
	strh r0, [r1, #0x2e]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
_081473D8:
	ldr r0, [r4]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081473EC: .4byte 0x0203A86C
_081473F0: .4byte 0x020388C8
	thumb_func_end Phase2_Clockwise_BlackFade_Func2

	thumb_func_start Phase2_Clockwise_BlackFade_Func3
Phase2_Clockwise_BlackFade_Func3: @ 0x081473F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov r8, r0
	add r1, sp, #0xc
	movs r0, #0
	strb r0, [r1]
	ldr r4, _08147478
	ldr r1, [r4]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x24
	movs r2, #0x2e
	ldrsh r1, [r1, r2]
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0xf0
	bl sub_0814A26C
	mov sb, r4
	mov r7, sb
	add r5, sp, #0xc
_08147432:
	movs r1, #0x78
	ldr r3, [r7]
	ldrh r0, [r3, #0x28]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r2, #0x2e
	ldrsh r0, [r3, r2]
	cmp r0, #0x4f
	ble _0814744A
	ldrh r1, [r3, #0x28]
	movs r4, #0xf0
_0814744A:
	ldr r6, _0814747C
	movs r0, #0x2a
	ldrsh r2, [r3, r0]
	lsls r2, r2, #1
	adds r2, r2, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	orrs r4, r1
	strh r4, [r2]
	ldrb r0, [r5]
	cmp r0, #0
	bne _08147480
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #1
	movs r2, #1
	bl sub_0814A2E8
	strb r0, [r5]
	b _08147432
	.align 2, 0
_08147478: .4byte 0x0203A86C
_0814747C: .4byte 0x020388C8
_08147480:
	ldr r1, [r7]
	ldrh r0, [r1, #0x2e]
	adds r0, #8
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0x9f
	ble _0814749E
	movs r0, #0xf0
	strh r0, [r1, #0x2c]
	mov r1, r8
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _081474C6
_0814749E:
	movs r3, #0x2a
	ldrsh r0, [r1, r3]
	cmp r0, r2
	bge _081474C6
	adds r3, r4, #0
	ldr r5, _081474E4
_081474AA:
	ldr r2, [r5]
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	adds r0, r0, r6
	strh r3, [r0]
	movs r4, #0x2a
	ldrsh r1, [r2, r4]
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	cmp r1, r0
	blt _081474AA
_081474C6:
	mov r1, sb
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081474E4: .4byte 0x0203A86C
	thumb_func_end Phase2_Clockwise_BlackFade_Func3

	thumb_func_start Phase2_Clockwise_BlackFade_Func4
Phase2_Clockwise_BlackFade_Func4: @ 0x081474E8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r2, _08147568
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x24
	movs r2, #0x2c
	ldrsh r3, [r1, r2]
	movs r1, #0xa0
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x78
	movs r2, #0x50
	bl sub_0814A26C
	ldr r5, _0814756C
_08147516:
	ldr r4, _08147568
	ldr r0, [r4]
	movs r1, #0x2a
	ldrsh r3, [r0, r1]
	lsls r3, r3, #1
	adds r3, r3, r5
	ldrh r1, [r0, #0x28]
	lsls r1, r1, #8
	movs r2, #0xf0
	orrs r1, r2
	strh r1, [r3]
	adds r0, #0x24
	movs r1, #1
	movs r2, #1
	bl sub_0814A2E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08147516
	ldr r1, [r4]
	ldrh r0, [r1, #0x2c]
	subs r0, #0x10
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08147554
	movs r0, #0xa0
	strh r0, [r1, #0x2e]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
_08147554:
	ldr r0, [r4]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08147568: .4byte 0x0203A86C
_0814756C: .4byte 0x020388C8
	thumb_func_end Phase2_Clockwise_BlackFade_Func4

	thumb_func_start Phase2_Clockwise_BlackFade_Func5
Phase2_Clockwise_BlackFade_Func5: @ 0x08147570
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	add r1, sp, #0xc
	movs r0, #0
	strb r0, [r1]
	ldr r4, _081475F8
	ldr r1, [r4]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x24
	movs r2, #0x2e
	ldrsh r1, [r1, r2]
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl sub_0814A26C
	ldr r7, _081475FC
	mov sl, r7
	ldr r0, _081475F8
	mov r8, r0
	add r6, sp, #0xc
_081475B4:
	mov r1, r8
	ldr r4, [r1]
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	mov r7, sl
	adds r5, r0, r7
	ldrb r1, [r5]
	ldrh r2, [r4, #0x28]
	adds r3, r2, #0
	movs r7, #0x2e
	ldrsh r0, [r4, r7]
	cmp r0, #0x50
	bgt _081475D4
	movs r2, #0x78
	adds r1, r3, #0
_081475D4:
	lsls r0, r2, #0x10
	asrs r0, r0, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	orrs r1, r0
	movs r7, #0
	strh r1, [r5]
	ldrb r0, [r6]
	cmp r0, #0
	bne _08147600
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #1
	movs r2, #1
	bl sub_0814A2E8
	strb r0, [r6]
	b _081475B4
	.align 2, 0
_081475F8: .4byte 0x0203A86C
_081475FC: .4byte 0x020388C8
_08147600:
	mov r0, r8
	ldr r2, [r0]
	ldrh r0, [r2, #0x2e]
	subs r0, #8
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	bgt _0814761E
	strh r7, [r2, #0x2c]
	mov r1, sb
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _08147648
_0814761E:
	movs r4, #0x2a
	ldrsh r0, [r2, r4]
	cmp r0, r3
	ble _08147648
	ldr r6, _08147668
	adds r3, r1, #0
	ldr r5, _0814766C
_0814762C:
	ldr r2, [r5]
	ldrh r0, [r2, #0x2a]
	subs r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	adds r0, r0, r6
	strh r3, [r0]
	movs r7, #0x2a
	ldrsh r1, [r2, r7]
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bgt _0814762C
_08147648:
	ldr r7, _0814766C
	ldr r0, [r7]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147668: .4byte 0x020388C8
_0814766C: .4byte 0x0203A86C
	thumb_func_end Phase2_Clockwise_BlackFade_Func5

	thumb_func_start Phase2_Clockwise_BlackFade_Func6
Phase2_Clockwise_BlackFade_Func6: @ 0x08147670
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _08147700
	ldr r0, [r1]
	ldrb r2, [r0]
	movs r2, #0
	strb r2, [r0]
	ldr r1, [r1]
	adds r0, r1, #0
	adds r0, #0x24
	movs r4, #0x2c
	ldrsh r3, [r1, r4]
	str r2, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x78
	movs r2, #0x50
	bl sub_0814A26C
	ldr r6, _08147704
_0814769C:
	movs r2, #0x78
	ldr r5, _08147700
	ldr r3, [r5]
	ldrh r4, [r3, #0x28]
	movs r1, #0x28
	ldrsh r0, [r3, r1]
	cmp r0, #0x77
	ble _081476B0
	movs r2, #0
	movs r4, #0xf0
_081476B0:
	movs r0, #0x2a
	ldrsh r1, [r3, r0]
	lsls r1, r1, #1
	adds r1, r1, r6
	lsls r2, r2, #8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	orrs r0, r2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #1
	movs r2, #1
	bl sub_0814A2E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814769C
	ldr r0, [r5]
	ldrh r1, [r0, #0x2c]
	adds r1, #0x10
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	ldrsh r0, [r0, r1]
	cmp r0, #0x78
	ble _081476EA
	ldrh r0, [r7, #8]
	adds r0, #1
	strh r0, [r7, #8]
_081476EA:
	ldr r0, [r5]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147700: .4byte 0x0203A86C
_08147704: .4byte 0x020388C8
	thumb_func_end Phase2_Clockwise_BlackFade_Func6

	thumb_func_start Phase2_Clockwise_BlackFade_Func7
Phase2_Clockwise_BlackFade_Func7: @ 0x08147708
	push {lr}
	ldr r1, _08147738
	ldrh r2, [r1, #0xa]
	ldr r0, _0814773C
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08147740
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, _08147744
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08147738: .4byte 0x040000B0
_0814773C: .4byte 0x0000C5FF
_08147740: .4byte 0x00007FFF
_08147744: .4byte 0x081472C5
	thumb_func_end Phase2_Clockwise_BlackFade_Func7

	thumb_func_start VBlankCB_Phase2_Clockwise_BlackFade
VBlankCB_Phase2_Clockwise_BlackFade: @ 0x08147748
	push {r4, lr}
	ldr r4, _081477B4
	ldrh r1, [r4, #0xa]
	ldr r0, _081477B8
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _081477BC
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl VBlankCB_BattleTransition
	ldr r3, _081477C0
	ldr r0, [r3]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08147780
	ldr r1, _081477C4
	ldr r0, _081477C8
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _081477CC
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08147780:
	ldr r2, _081477D0
	ldr r1, [r3]
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	subs r2, #6
	ldrh r0, [r1, #8]
	strh r0, [r2]
	subs r2, #4
	ldr r0, _081477C8
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	str r0, [r4]
	str r2, [r4, #4]
	ldr r0, _081477D4
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081477B4: .4byte 0x040000B0
_081477B8: .4byte 0x0000C5FF
_081477BC: .4byte 0x00007FFF
_081477C0: .4byte 0x0203A86C
_081477C4: .4byte 0x040000D4
_081477C8: .4byte 0x020388C8
_081477CC: .4byte 0x800000A0
_081477D0: .4byte 0x04000048
_081477D4: .4byte 0xA2400001
	thumb_func_end VBlankCB_Phase2_Clockwise_BlackFade

	thumb_func_start Phase2Task_Kyogre
Phase2Task_Kyogre: @ 0x081477D8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08147808
	ldr r2, _0814780C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081477EA:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081477EA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147808: .4byte 0x085A8668
_0814780C: .4byte 0x03005B60
	thumb_func_end Phase2Task_Kyogre

	thumb_func_start Phase2_Ripple_Func1
Phase2_Ripple_Func1: @ 0x08147810
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	movs r2, #0
	ldr r4, _08147858
	ldr r3, _0814785C
_08147822:
	lsls r1, r2, #1
	adds r1, r1, r4
	ldr r0, [r3]
	ldrh r0, [r0, #0x16]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9f
	bls _08147822
	ldr r0, _08147860
	bl SetVBlankCallback
	ldr r0, _08147864
	bl SetHBlankCallback
	movs r0, #2
	bl EnableInterrupts
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08147858: .4byte 0x02039048
_0814785C: .4byte 0x0203A86C
_08147860: .4byte 0x08147949
_08147864: .4byte 0x08147981
	thumb_func_end Phase2_Ripple_Func1

	thumb_func_start Phase2_Ripple_Func2
Phase2_Ripple_Func2: @ 0x08147868
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08147934
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldrh r2, [r6, #0xc]
	lsls r1, r2, #0x10
	asrs r0, r1, #0x18
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r4, [r6, #0xa]
	movs r0, #0xc0
	lsls r0, r0, #1
	mov r8, r0
	movs r5, #0x80
	lsls r5, r5, #3
	adds r0, r4, r5
	strh r0, [r6, #0xa]
	ldr r0, _08147938
	cmp r1, r0
	bgt _081478A4
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r2, r1
	strh r0, [r6, #0xc]
_081478A4:
	movs r5, #0
	lsls r7, r3, #0x10
_081478A8:
	lsrs r0, r4, #8
	asrs r1, r7, #0x10
	bl Sin
	ldr r1, _0814793C
	lsls r2, r5, #1
	adds r2, r2, r1
	ldr r1, _08147934
	ldr r1, [r1]
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r1, r8
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r5, #0x9f
	bls _081478A8
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x51
	bne _081478F8
	ldrh r0, [r6, #0x10]
	adds r0, #1
	strh r0, [r6, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #2
	rsbs r1, r1, #0
	movs r2, #0
	str r2, [sp]
	movs r3, #0x10
	bl BeginNormalPaletteFade
_081478F8:
	movs r5, #0x10
	ldrsh r0, [r6, r5]
	cmp r0, #0
	beq _0814791A
	ldr r0, _08147940
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0814791A
	ldr r0, _08147944
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0814791A:
	ldr r0, _08147934
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147934: .4byte 0x0203A86C
_08147938: .4byte 0x1FFF0000
_0814793C: .4byte 0x020388C8
_08147940: .4byte 0x02037C74
_08147944: .4byte 0x081477D9
	thumb_func_end Phase2_Ripple_Func2

	thumb_func_start VBlankCB_Phase2_Ripple
VBlankCB_Phase2_Ripple: @ 0x08147948
	push {lr}
	bl VBlankCB_BattleTransition
	ldr r0, _08147970
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0814796C
	ldr r1, _08147974
	ldr r0, _08147978
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _0814797C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0814796C:
	pop {r0}
	bx r0
	.align 2, 0
_08147970: .4byte 0x0203A86C
_08147974: .4byte 0x040000D4
_08147978: .4byte 0x020388C8
_0814797C: .4byte 0x800000A0
	thumb_func_end VBlankCB_Phase2_Ripple

	thumb_func_start HBlankCB_Phase2_Ripple
HBlankCB_Phase2_Ripple: @ 0x08147980
	ldr r1, _081479A0
	ldr r0, _081479A4
	ldrh r0, [r0]
	lsls r0, r0, #1
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _081479A8
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_081479A0: .4byte 0x020388C8
_081479A4: .4byte 0x04000006
_081479A8: .4byte 0x04000016
	thumb_func_end HBlankCB_Phase2_Ripple

	thumb_func_start Phase2Task_MugShotTransition
Phase2Task_MugShotTransition: @ 0x081479AC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081479DC
	ldr r2, _081479E0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081479BE:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081479BE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081479DC: .4byte 0x085A8670
_081479E0: .4byte 0x03005B60
	thumb_func_end Phase2Task_MugShotTransition

	thumb_func_start Phase2_Wave_Func1
Phase2_Wave_Func1: @ 0x081479E4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	ldr r0, _08147A30
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0x3f
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	movs r0, #0xf0
	strh r0, [r1, #6]
	movs r0, #0xa0
	strh r0, [r1, #8]
	movs r1, #0
	ldr r3, _08147A34
	movs r2, #0xf2
_08147A0A:
	lsls r0, r1, #1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x9f
	bls _08147A0A
	ldr r0, _08147A38
	bl SetVBlankCallback
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08147A30: .4byte 0x0203A86C
_08147A34: .4byte 0x02039048
_08147A38: .4byte 0x08147B19
	thumb_func_end Phase2_Wave_Func1

	thumb_func_start Phase2_Wave_Func2
Phase2_Wave_Func2: @ 0x08147A3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _08147AD0
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r7, _08147AD4
	ldrh r0, [r4, #0xc]
	ldrb r5, [r4, #0xc]
	adds r0, #0x10
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	adds r0, #8
	strh r0, [r4, #0xa]
	movs r6, #0
	movs r0, #1
	mov r8, r0
_08147A64:
	adds r0, r5, #0
	movs r1, #0x28
	bl Sin
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08147A7A
	movs r1, #0
_08147A7A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _08147A84
	movs r1, #0xf0
_08147A84:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #8
	movs r2, #0xf1
	orrs r1, r2
	strh r1, [r7]
	cmp r0, #0xef
	bgt _08147A98
	movs r0, #0
	mov r8, r0
_08147A98:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, #2
	cmp r6, #0x9f
	bls _08147A64
	mov r1, r8
	cmp r1, #0
	beq _08147AB6
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08147AB6:
	ldr r0, _08147AD0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147AD0: .4byte 0x0203A86C
_08147AD4: .4byte 0x020388C8
	thumb_func_end Phase2_Wave_Func2

	thumb_func_start Phase2_Wave_Func3
Phase2_Wave_Func3: @ 0x08147AD8
	push {lr}
	ldr r1, _08147B08
	ldrh r2, [r1, #0xa]
	ldr r0, _08147B0C
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08147B10
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, _08147B14
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08147B08: .4byte 0x040000B0
_08147B0C: .4byte 0x0000C5FF
_08147B10: .4byte 0x00007FFF
_08147B14: .4byte 0x081479AD
	thumb_func_end Phase2_Wave_Func3

	thumb_func_start VBlankCB_Phase2_Wave
VBlankCB_Phase2_Wave: @ 0x08147B18
	push {r4, lr}
	ldr r4, _08147B78
	ldrh r1, [r4, #0xa]
	ldr r0, _08147B7C
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _08147B80
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl VBlankCB_BattleTransition
	ldr r3, _08147B84
	ldr r0, [r3]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08147B50
	ldr r1, _08147B88
	ldr r0, _08147B8C
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _08147B90
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08147B50:
	ldr r2, _08147B94
	ldr r1, [r3]
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	subs r2, #6
	ldrh r0, [r1, #8]
	strh r0, [r2]
	ldr r0, _08147B98
	str r0, [r4]
	ldr r0, _08147B9C
	str r0, [r4, #4]
	ldr r0, _08147BA0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147B78: .4byte 0x040000B0
_08147B7C: .4byte 0x0000C5FF
_08147B80: .4byte 0x00007FFF
_08147B84: .4byte 0x0203A86C
_08147B88: .4byte 0x040000D4
_08147B8C: .4byte 0x020388C8
_08147B90: .4byte 0x800000A0
_08147B94: .4byte 0x04000048
_08147B98: .4byte 0x02039048
_08147B9C: .4byte 0x04000040
_08147BA0: .4byte 0xA2400001
	thumb_func_end VBlankCB_Phase2_Wave

	thumb_func_start Phase2Task_Sidney
Phase2Task_Sidney: @ 0x08147BA4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08147BC0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #0x26]
	bl Phase2Task_PokeballsTrail
	pop {r0}
	bx r0
	.align 2, 0
_08147BC0: .4byte 0x03005B60
	thumb_func_end Phase2Task_Sidney

	thumb_func_start Phase2Task_Phoebe
Phase2Task_Phoebe: @ 0x08147BC4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08147BE0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #1
	strh r2, [r1, #0x26]
	bl Phase2Task_PokeballsTrail
	pop {r0}
	bx r0
	.align 2, 0
_08147BE0: .4byte 0x03005B60
	thumb_func_end Phase2Task_Phoebe

	thumb_func_start Phase2Task_Glacia
Phase2Task_Glacia: @ 0x08147BE4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08147C00
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #2
	strh r2, [r1, #0x26]
	bl Phase2Task_PokeballsTrail
	pop {r0}
	bx r0
	.align 2, 0
_08147C00: .4byte 0x03005B60
	thumb_func_end Phase2Task_Glacia

	thumb_func_start Phase2Task_Drake
Phase2Task_Drake: @ 0x08147C04
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08147C20
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #3
	strh r2, [r1, #0x26]
	bl Phase2Task_PokeballsTrail
	pop {r0}
	bx r0
	.align 2, 0
_08147C20: .4byte 0x03005B60
	thumb_func_end Phase2Task_Drake

	thumb_func_start Phase2Task_Champion
Phase2Task_Champion: @ 0x08147C24
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08147C40
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #4
	strh r2, [r1, #0x26]
	bl Phase2Task_PokeballsTrail
	pop {r0}
	bx r0
	.align 2, 0
_08147C40: .4byte 0x03005B60
	thumb_func_end Phase2Task_Champion

	thumb_func_start Phase2Task_PokeballsTrail
Phase2Task_PokeballsTrail: @ 0x08147C44
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08147C74
	ldr r2, _08147C78
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08147C56:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08147C56
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147C74: .4byte 0x085A867C
_08147C78: .4byte 0x03005B60
	thumb_func_end Phase2Task_PokeballsTrail

	thumb_func_start Phase2_Mugshot_Func1
Phase2_Mugshot_Func1: @ 0x08147C7C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	adds r0, r4, #0
	bl Mugshots_CreateOpponentPlayerSprites
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #1
	strh r0, [r4, #0xc]
	movs r0, #0xef
	strh r0, [r4, #0xe]
	ldr r0, _08147CD4
	ldr r1, [r0]
	movs r0, #0x3f
	strh r0, [r1, #2]
	movs r0, #0x3e
	strh r0, [r1, #4]
	movs r0, #0xa0
	strh r0, [r1, #8]
	movs r1, #0
	ldr r3, _08147CD8
	ldr r2, _08147CDC
_08147CB0:
	lsls r0, r1, #1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x9f
	bls _08147CB0
	ldr r0, _08147CE0
	bl SetVBlankCallback
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08147CD4: .4byte 0x0203A86C
_08147CD8: .4byte 0x02039048
_08147CDC: .4byte 0x0000F0F1
_08147CE0: .4byte 0x0814818D
	thumb_func_end Phase2_Mugshot_Func1

	thumb_func_start Phase2_Mugshot_Func2
Phase2_Mugshot_Func2: @ 0x08147CE4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _08147D8C
	add r1, sp, #4
	mov r0, sp
	bl sub_0814A018
	ldr r0, _08147D90
	ldr r1, [sp, #4]
	movs r2, #0xf0
	bl CpuSet
	ldr r1, _08147D94
	mov r2, r8
	movs r3, #0x26
	ldrsh r0, [r2, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _08147D98
	ldr r0, _08147D9C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xfa
	movs r2, #0xc
	bl LoadPalette
	movs r1, #0
	ldr r5, [sp]
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r7, r0, #0
_08147D38:
	movs r0, #0
	lsls r3, r1, #0x10
	asrs r4, r3, #0xb
_08147D3E:
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r6]
	orrs r0, r7
	strh r0, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	adds r6, #2
	lsrs r0, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x1f
	ble _08147D3E
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _08147D38
	movs r0, #2
	bl EnableInterrupts
	ldr r0, _08147DA0
	bl SetHBlankCallback
	mov r2, r8
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	movs r0, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147D8C: .4byte 0x085A8F80
_08147D90: .4byte 0x085995A0
_08147D94: .4byte 0x085A8A8C
_08147D98: .4byte 0x085A8AA0
_08147D9C: .4byte 0x03005AF0
_08147DA0: .4byte 0x081482A1
	thumb_func_end Phase2_Mugshot_Func2

	thumb_func_start Phase2_Mugshot_Func3
Phase2_Mugshot_Func3: @ 0x08147DA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08147E88
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r7, _08147E8C
	ldrh r0, [r4, #0xa]
	ldrb r5, [r4, #0xa]
	adds r0, #0x10
	strh r0, [r4, #0xa]
	movs r6, #0
_08147DBE:
	adds r0, r5, #0
	movs r1, #0x10
	bl Sin
	ldrh r1, [r4, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08147DD4
	movs r2, #1
_08147DD4:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _08147DDE
	movs r2, #0xf0
_08147DDE:
	strh r2, [r7]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r7, #2
	adds r0, r5, #0
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r6, #0x4f
	bls _08147DBE
	cmp r6, #0x9f
	bhi _08147E36
_08147DF8:
	adds r0, r5, #0
	movs r1, #0x10
	bl Sin
	ldrh r1, [r4, #0xe]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r1, #0
	bge _08147E0E
	movs r2, #0
_08147E0E:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xef
	ble _08147E18
	movs r2, #0xef
_08147E18:
	lsls r0, r2, #0x10
	asrs r0, r0, #8
	movs r1, #0xf0
	orrs r0, r1
	strh r0, [r7]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r7, #2
	adds r0, r5, #0
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r6, #0x9f
	bls _08147DF8
_08147E36:
	ldrh r1, [r4, #0xc]
	adds r1, #8
	strh r1, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	subs r0, #8
	strh r0, [r4, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xf0
	ble _08147E4E
	movs r0, #0xf0
	strh r0, [r4, #0xc]
_08147E4E:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08147E5A
	movs r0, #0
	strh r0, [r4, #0xe]
_08147E5A:
	ldr r0, [r4, #0xc]
	cmp r0, #0xf0
	bne _08147E66
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08147E66:
	ldr r0, _08147E88
	ldr r1, [r0]
	ldrh r0, [r1, #0x18]
	subs r0, #8
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x1a]
	adds r0, #8
	strh r0, [r1, #0x1a]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147E88: .4byte 0x0203A86C
_08147E8C: .4byte 0x020388C8
	thumb_func_end Phase2_Mugshot_Func3

	thumb_func_start Phase2_Mugshot_Func4
Phase2_Mugshot_Func4: @ 0x08147E90
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08147F04
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08147F08
	adds r5, r2, #0
	movs r2, #0xf0
_08147EA4:
	strh r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #2
	cmp r0, #0x9f
	bls _08147EA4
	ldrh r0, [r4, #8]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0xe]
	ldr r1, [r5]
	ldrh r0, [r1, #0x18]
	subs r0, #8
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x1a]
	adds r0, #8
	strh r0, [r1, #0x1a]
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl sub_08148544
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	movs r1, #1
	bl sub_08148544
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	bl sub_0814855C
	movs r0, #0x68
	bl PlaySE
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08147F04: .4byte 0x0203A86C
_08147F08: .4byte 0x020388C8
	thumb_func_end Phase2_Mugshot_Func4

	thumb_func_start Phase2_Mugshot_Func5
Phase2_Mugshot_Func5: @ 0x08147F0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08147F44
	ldr r1, [r0]
	ldrh r0, [r1, #0x18]
	subs r0, #8
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x1a]
	adds r0, #8
	strh r0, [r1, #0x1a]
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	bl sub_08148578
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08147F3C
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	bl sub_0814855C
_08147F3C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08147F44: .4byte 0x0203A86C
	thumb_func_end Phase2_Mugshot_Func5

	thumb_func_start Phase2_Mugshot_Func6
Phase2_Mugshot_Func6: @ 0x08147F48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r7, _08147FE8
	ldr r1, [r7]
	ldrh r0, [r1, #0x18]
	subs r0, #8
	movs r2, #0
	mov r8, r2
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x1a]
	adds r0, #8
	strh r0, [r1, #0x1a]
	movs r1, #0x24
	ldrsh r0, [r6, r1]
	bl sub_08148578
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08147FDC
	ldr r1, [r7]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	bl SetVBlankCallback
	ldr r1, _08147FEC
	ldrh r2, [r1, #0xa]
	ldr r0, _08147FF0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08147FF4
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r4, _08147FF8
	movs r5, #0xa0
	lsls r5, r5, #1
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl memset
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r4, r4, r2
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl memset
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	mov r0, r8
	strh r0, [r6, #0xe]
	strh r0, [r6, #0x10]
	ldr r1, [r7]
	movs r0, #0xbf
	strh r0, [r1, #0xe]
	ldr r0, _08147FFC
	bl SetVBlankCallback
_08147FDC:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147FE8: .4byte 0x0203A86C
_08147FEC: .4byte 0x040000B0
_08147FF0: .4byte 0x0000C5FF
_08147FF4: .4byte 0x00007FFF
_08147FF8: .4byte 0x020388C8
_08147FFC: .4byte 0x08148221
	thumb_func_end Phase2_Mugshot_Func6

	thumb_func_start Phase2_Mugshot_Func7
Phase2_Mugshot_Func7: @ 0x08148000
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, _081480C0
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	movs r6, #1
	ldr r1, [r2]
	ldrh r0, [r1, #0x18]
	subs r0, #8
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x1a]
	adds r0, #8
	strh r0, [r1, #0x1a]
	ldrh r1, [r4, #0x10]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	mov ip, r2
	cmp r0, #0x4f
	bgt _0814802E
	adds r0, r1, #2
	strh r0, [r4, #0x10]
_0814802E:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _0814803A
	movs r0, #0x50
	strh r0, [r4, #0x10]
_0814803A:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	movs r1, #1
	ands r0, r1
	ldrh r3, [r4, #0x10]
	cmp r0, #0
	beq _0814809C
	movs r2, #0
	lsls r0, r3, #0x10
	movs r6, #0
	cmp r0, #0
	blt _0814809C
	movs r7, #0x50
	ldr r5, _081480C4
_08148058:
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	subs r1, r7, r3
	adds r0, r3, #0
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r5
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08148078
	movs r6, #1
	adds r0, #1
	strh r0, [r1]
_08148078:
	lsls r0, r2, #0x10
	asrs r0, r0, #0xf
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0814808A
	movs r6, #1
	adds r0, #1
	strh r0, [r1]
_0814808A:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldrh r3, [r4, #0x10]
	cmp r0, r1
	ble _08148058
_0814809C:
	cmp r3, #0x50
	bne _081480AA
	cmp r6, #0
	bne _081480AA
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081480AA:
	mov r1, ip
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081480C0: .4byte 0x0203A86C
_081480C4: .4byte 0x020388C8
	thumb_func_end Phase2_Mugshot_Func7

	thumb_func_start Phase2_Mugshot_Func8
Phase2_Mugshot_Func8: @ 0x081480C8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _081480F8
	ldr r0, [r5]
	ldrb r1, [r0]
	movs r6, #0
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, _081480FC
	movs r1, #0x10
	bl BlendPalettes
	ldr r1, [r5]
	movs r0, #0xff
	strh r0, [r1, #0xe]
	strh r6, [r4, #0xe]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081480F8: .4byte 0x0203A86C
_081480FC: .4byte 0x00007FFF
	thumb_func_end Phase2_Mugshot_Func8

	thumb_func_start Phase2_Mugshot_Func9
Phase2_Mugshot_Func9: @ 0x08148100
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08148144
	ldr r1, [r5]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	ldr r0, _08148148
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	movs r2, #0xa0
	lsls r2, r2, #1
	bl memset
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble _08148130
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08148130:
	ldr r0, [r5]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08148144: .4byte 0x0203A86C
_08148148: .4byte 0x020388C8
	thumb_func_end Phase2_Mugshot_Func9

	thumb_func_start Phase2_Mugshot_Func10
Phase2_Mugshot_Func10: @ 0x0814814C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08148180
	ldrh r2, [r1, #0xa]
	ldr r0, _08148184
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08148188
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08148180: .4byte 0x040000B0
_08148184: .4byte 0x0000C5FF
_08148188: .4byte 0x00007FFF
	thumb_func_end Phase2_Mugshot_Func10

	thumb_func_start VBlankCB0_Phase2_Mugshots
VBlankCB0_Phase2_Mugshots: @ 0x0814818C
	push {r4, lr}
	ldr r4, _081481F4
	ldrh r1, [r4, #0xa]
	ldr r0, _081481F8
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _081481FC
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl VBlankCB_BattleTransition
	ldr r3, _08148200
	ldr r0, [r3]
	ldrb r0, [r0]
	cmp r0, #0
	beq _081481C4
	ldr r1, _08148204
	ldr r0, _08148208
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _0814820C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_081481C4:
	ldr r2, _08148210
	ldr r1, [r3]
	ldrh r0, [r1, #0x1c]
	strh r0, [r2]
	adds r2, #0x36
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	subs r2, #6
	ldrh r0, [r1, #8]
	strh r0, [r2]
	ldr r0, _08148214
	str r0, [r4]
	ldr r0, _08148218
	str r0, [r4, #4]
	ldr r0, _0814821C
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081481F4: .4byte 0x040000B0
_081481F8: .4byte 0x0000C5FF
_081481FC: .4byte 0x00007FFF
_08148200: .4byte 0x0203A86C
_08148204: .4byte 0x040000D4
_08148208: .4byte 0x020388C8
_0814820C: .4byte 0x800000A0
_08148210: .4byte 0x04000012
_08148214: .4byte 0x02039048
_08148218: .4byte 0x04000040
_0814821C: .4byte 0xA2400001
	thumb_func_end VBlankCB0_Phase2_Mugshots

	thumb_func_start VBlankCB1_Phase2_Mugshots
VBlankCB1_Phase2_Mugshots: @ 0x08148220
	push {r4, lr}
	ldr r4, _08148274
	ldrh r1, [r4, #0xa]
	ldr r0, _08148278
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _0814827C
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl VBlankCB_BattleTransition
	ldr r2, _08148280
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08148258
	ldr r1, _08148284
	ldr r0, _08148288
	str r0, [r1]
	movs r3, #0xf0
	lsls r3, r3, #3
	adds r0, r0, r3
	str r0, [r1, #4]
	ldr r0, _0814828C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08148258:
	ldr r1, _08148290
	ldr r0, [r2]
	ldrh r0, [r0, #0xe]
	strh r0, [r1]
	ldr r0, _08148294
	str r0, [r4]
	ldr r0, _08148298
	str r0, [r4, #4]
	ldr r0, _0814829C
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148274: .4byte 0x040000B0
_08148278: .4byte 0x0000C5FF
_0814827C: .4byte 0x00007FFF
_08148280: .4byte 0x0203A86C
_08148284: .4byte 0x040000D4
_08148288: .4byte 0x020388C8
_0814828C: .4byte 0x800000A0
_08148290: .4byte 0x04000050
_08148294: .4byte 0x02039048
_08148298: .4byte 0x04000054
_0814829C: .4byte 0xA2400001
	thumb_func_end VBlankCB1_Phase2_Mugshots

	thumb_func_start HBlankCB_Phase2_Mugshots
HBlankCB_Phase2_Mugshots: @ 0x081482A0
	push {lr}
	ldr r0, _081482B4
	ldrh r0, [r0]
	cmp r0, #0x4f
	bhi _081482C0
	ldr r1, _081482B8
	ldr r0, _081482BC
	ldr r0, [r0]
	ldrh r0, [r0, #0x18]
	b _081482C8
	.align 2, 0
_081482B4: .4byte 0x04000006
_081482B8: .4byte 0x04000010
_081482BC: .4byte 0x0203A86C
_081482C0:
	ldr r1, _081482D0
	ldr r0, _081482D4
	ldr r0, [r0]
	ldrh r0, [r0, #0x1a]
_081482C8:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081482D0: .4byte 0x04000010
_081482D4: .4byte 0x0203A86C
	thumb_func_end HBlankCB_Phase2_Mugshots

	thumb_func_start Mugshots_CreateOpponentPlayerSprites
Mugshots_CreateOpponentPlayerSprites: @ 0x081482D8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08148420
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	mov r8, r1
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08148424
	lsls r1, r1, #2
	mov r8, r1
	adds r1, r1, r2
	ldrh r1, [r1]
	subs r1, #0x20
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, #2
	add r2, r8
	ldrh r2, [r2]
	adds r2, #0x2a
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r5, _08148428
	str r5, [sp]
	movs r3, #0
	bl CreateTrainerSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	ldr r0, _0814842C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bl PlayerGenderToFrontTrainerPicId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x88
	lsls r1, r1, #1
	str r5, [sp]
	movs r2, #0x6a
	movs r3, #0
	bl CreateTrainerSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	movs r3, #0x22
	ldrsh r0, [r4, r3]
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r1, _08148430
	adds r5, r5, r1
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	lsls r6, r0, #4
	adds r6, r6, r0
	lsls r6, r6, #2
	adds r6, r6, r1
	ldr r0, _08148434
	str r0, [r5, #0x1c]
	str r0, [r6, #0x1c]
	ldrb r0, [r5, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #1]
	ldrb r0, [r6, #1]
	orrs r0, r1
	strb r0, [r6, #1]
	bl AllocOamMatrix
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0x1f
	mov sb, r3
	mov r4, sb
	ands r0, r4
	lsls r0, r0, #1
	ldrb r2, [r5, #3]
	movs r4, #0x3f
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #3]
	bl AllocOamMatrix
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	ldrb r1, [r6, #3]
	ands r4, r1
	orrs r4, r0
	strb r4, [r6, #3]
	ldrb r2, [r5, #1]
	movs r1, #0x3f
	adds r0, r1, #0
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r5, #1]
	ldrb r0, [r6, #1]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, #1]
	ldrb r0, [r5, #3]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r5, #3]
	ldrb r0, [r6, #3]
	orrs r0, r1
	strb r0, [r6, #3]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	movs r3, #3
	bl CalcCenterToCornerVec
	adds r0, r6, #0
	movs r1, #1
	movs r2, #3
	movs r3, #3
	bl CalcCenterToCornerVec
	ldrb r0, [r5, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	ldr r2, _08148438
	mov r3, r8
	adds r1, r3, r2
	movs r4, #0
	ldrsh r1, [r1, r4]
	adds r2, #2
	add r8, r2
	mov r3, r8
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r3, #0
	bl SetOamMatrixRotationScaling
	ldrb r0, [r6, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	ldr r1, _0814843C
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0
	bl SetOamMatrixRotationScaling
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08148420: .4byte 0x085A86A4
_08148424: .4byte 0x085A86BE
_08148428: .4byte 0x0201C000
_0814842C: .4byte 0x03005AF0
_08148430: .4byte 0x020205AC
_08148434: .4byte 0x08148441
_08148438: .4byte 0x085A86AA
_0814843C: .4byte 0xFFFFFE00
	thumb_func_end Mugshots_CreateOpponentPlayerSprites

	thumb_func_start sub_08148440
sub_08148440: @ 0x08148440
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08148464
_08148446:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08148446
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08148464: .4byte 0x085A86D4
	thumb_func_end sub_08148440

	thumb_func_start sub_08148468
sub_08148468: @ 0x08148468
	movs r0, #0
	bx lr
	thumb_func_end sub_08148468

	thumb_func_start sub_0814846C
sub_0814846C: @ 0x0814846C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _081484B0
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r4, sp, #4
	ldr r1, _081484B4
	adds r0, r4, #0
	movs r2, #4
	bl memcpy
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x30]
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	strh r0, [r5, #0x32]
	movs r0, #1
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081484B0: .4byte 0x085A86F0
_081484B4: .4byte 0x085A86F4
	thumb_func_end sub_0814846C

	thumb_func_start sub_081484B8
sub_081484B8: @ 0x081484B8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	ldrh r3, [r1, #0x20]
	adds r2, r0, r3
	strh r2, [r1, #0x20]
	movs r3, #0x3c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _081484D6
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x84
	bgt _081484E4
	b _081484DE
_081484D6:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x67
	ble _081484E4
_081484DE:
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
_081484E4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081484B8

	thumb_func_start sub_081484EC
sub_081484EC: @ 0x081484EC
	push {lr}
	adds r2, r0, #0
	ldrh r3, [r2, #0x32]
	ldrh r0, [r2, #0x30]
	adds r1, r3, r0
	strh r1, [r2, #0x30]
	ldrh r0, [r2, #0x20]
	adds r0, r0, r1
	strh r0, [r2, #0x20]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _08148512
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	rsbs r0, r3, #0
	strh r0, [r2, #0x32]
	movs r0, #1
	strh r0, [r2, #0x3a]
_08148512:
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end sub_081484EC

	thumb_func_start sub_08148518
sub_08148518: @ 0x08148518
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x32]
	ldrh r1, [r2, #0x30]
	adds r0, r0, r1
	strh r0, [r2, #0x30]
	ldrh r1, [r2, #0x20]
	adds r1, r1, r0
	strh r1, [r2, #0x20]
	adds r1, #0x1f
	lsls r1, r1, #0x10
	movs r0, #0x97
	lsls r0, r0, #0x11
	cmp r1, r0
	bls _0814853C
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
_0814853C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08148518

	thumb_func_start sub_08148544
sub_08148544: @ 0x08148544
	ldr r3, _08148558
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	strh r1, [r2, #0x3c]
	bx lr
	.align 2, 0
_08148558: .4byte 0x020205AC
	thumb_func_end sub_08148544

	thumb_func_start sub_0814855C
sub_0814855C: @ 0x0814855C
	ldr r2, _08148574
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	bx lr
	.align 2, 0
_08148574: .4byte 0x020205AC
	thumb_func_end sub_0814855C

	thumb_func_start sub_08148578
sub_08148578: @ 0x08148578
	ldr r2, _0814858C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x3a
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_0814858C: .4byte 0x020205AC
	thumb_func_end sub_08148578

	thumb_func_start Phase2Task_Rayquaza
Phase2Task_Rayquaza: @ 0x08148590
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081485C0
	ldr r2, _081485C4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081485A2:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081485A2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081485C0: .4byte 0x085A86F8
_081485C4: .4byte 0x03005B60
	thumb_func_end Phase2Task_Rayquaza

	thumb_func_start Phase2_Slice_Func1
Phase2_Slice_Func1: @ 0x081485C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	movs r4, #0
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0xc]
	movs r0, #1
	strh r0, [r5, #0xe]
	ldr r2, _08148640
	ldr r1, [r2]
	movs r0, #0x3f
	strh r0, [r1, #2]
	strh r3, [r1, #4]
	movs r0, #0xa0
	strh r0, [r1, #8]
	ldrb r0, [r1]
	strb r4, [r1]
	ldr r4, _08148644
	adds r6, r2, #0
	movs r2, #0xf0
_081485FA:
	lsls r1, r3, #1
	adds r1, r1, r4
	ldr r0, [r6]
	ldrh r0, [r0, #0x14]
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xa0
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _081485FA
	movs r0, #2
	bl EnableInterrupts
	movs r0, #4
	movs r1, #0x10
	bl SetGpuRegBits
	ldr r0, _08148648
	bl SetVBlankCallback
	ldr r0, _0814864C
	bl SetHBlankCallback
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08148640: .4byte 0x0203A86C
_08148644: .4byte 0x02039048
_08148648: .4byte 0x0814875D
_0814864C: .4byte 0x081487E9
	thumb_func_end Phase2_Slice_Func1

	thumb_func_start Phase2_Slice_Func2
Phase2_Slice_Func2: @ 0x08148650
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	ldr r2, _081486CC
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r3, #0xa]
	adds r0, r0, r1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r2
	cmp r0, #0xf0
	ble _0814867C
	movs r0, #0xf0
	strh r0, [r3, #0xa]
_0814867C:
	ldrh r4, [r3, #0xc]
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	ldr r0, _081486D0
	ldrh r2, [r3, #0xe]
	cmp r1, r0
	bgt _0814868E
	adds r0, r4, r2
	strh r0, [r3, #0xc]
_0814868E:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	bgt _0814869A
	lsls r0, r2, #1
	strh r0, [r3, #0xe]
_0814869A:
	movs r5, #0
	ldr r7, _081486D4
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r1, r1, r7
	mov ip, r1
	mov r6, r8
_081486A8:
	lsls r0, r5, #1
	adds r2, r0, r7
	mov r1, ip
	adds r4, r0, r1
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _081486D8
	ldr r1, [r6]
	ldrh r0, [r3, #0xa]
	ldrh r1, [r1, #0x14]
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r1, [r3, #0xa]
	movs r0, #0xf0
	subs r0, r0, r1
	b _081486EA
	.align 2, 0
_081486CC: .4byte 0x0203A86C
_081486D0: .4byte 0x00000FFF
_081486D4: .4byte 0x020388C8
_081486D8:
	ldr r0, [r6]
	ldrh r0, [r0, #0x14]
	ldrh r1, [r3, #0xa]
	subs r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r3, #0xa]
	lsls r0, r0, #8
	movs r1, #0xf1
	orrs r0, r1
_081486EA:
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x9f
	bls _081486A8
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	cmp r0, #0xef
	ble _08148704
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_08148704:
	mov r1, r8
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end Phase2_Slice_Func2

	thumb_func_start Phase2_Slice_Func3
Phase2_Slice_Func3: @ 0x0814871C
	push {lr}
	ldr r1, _0814874C
	ldrh r2, [r1, #0xa]
	ldr r0, _08148750
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08148754
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, _08148758
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0814874C: .4byte 0x040000B0
_08148750: .4byte 0x0000C5FF
_08148754: .4byte 0x00007FFF
_08148758: .4byte 0x08148591
	thumb_func_end Phase2_Slice_Func3

	thumb_func_start VBlankCB_Phase2_Slice
VBlankCB_Phase2_Slice: @ 0x0814875C
	push {r4, lr}
	ldr r4, _081487BC
	ldrh r1, [r4, #0xa]
	ldr r0, _081487C0
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _081487C4
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl VBlankCB_BattleTransition
	ldr r2, _081487C8
	ldr r0, _081487CC
	ldr r1, [r0]
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	subs r2, #6
	ldrh r0, [r1, #8]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, #0
	beq _081487A6
	ldr r1, _081487D0
	ldr r0, _081487D4
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _081487D8
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_081487A6:
	ldr r0, _081487DC
	str r0, [r4]
	ldr r0, _081487E0
	str r0, [r4, #4]
	ldr r0, _081487E4
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081487BC: .4byte 0x040000B0
_081487C0: .4byte 0x0000C5FF
_081487C4: .4byte 0x00007FFF
_081487C8: .4byte 0x04000048
_081487CC: .4byte 0x0203A86C
_081487D0: .4byte 0x040000D4
_081487D4: .4byte 0x020388C8
_081487D8: .4byte 0x80000140
_081487DC: .4byte 0x02039188
_081487E0: .4byte 0x04000040
_081487E4: .4byte 0xA2400001
	thumb_func_end VBlankCB_Phase2_Slice

	thumb_func_start HBlankCB_Phase2_Slice
HBlankCB_Phase2_Slice: @ 0x081487E8
	push {lr}
	ldr r2, _08148814
	ldrh r0, [r2]
	cmp r0, #0x9f
	bhi _0814880E
	ldr r1, _08148818
	ldrh r0, [r2]
	lsls r0, r0, #1
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _0814881C
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_0814880E:
	pop {r0}
	bx r0
	.align 2, 0
_08148814: .4byte 0x04000006
_08148818: .4byte 0x020388C8
_0814881C: .4byte 0x04000014
	thumb_func_end HBlankCB_Phase2_Slice

	thumb_func_start Phase2Task_RectangularSpiral
Phase2Task_RectangularSpiral: @ 0x08148820
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08148850
	ldr r2, _08148854
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08148832:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08148832
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08148850: .4byte 0x085A8704
_08148854: .4byte 0x03005B60
	thumb_func_end Phase2Task_RectangularSpiral

	thumb_func_start Phase2_ShredSplit_Func1
Phase2_ShredSplit_Func1: @ 0x08148858
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	ldr r0, _08148914
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0x3f
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	movs r0, #0xa0
	strh r0, [r1, #8]
	movs r4, #0
	ldr r5, _08148918
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r0, r0, r5
	mov ip, r0
	mov r8, r4
	movs r1, #0xf0
	mov sb, r1
_0814888C:
	lsls r2, r4, #1
	mov r7, ip
	adds r1, r2, r7
	ldr r0, _08148914
	ldr r3, [r0]
	ldrh r0, [r3, #0x14]
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, r7
	mov r7, sb
	strh r7, [r0]
	adds r2, r2, r5
	ldrh r0, [r3, #0x14]
	strh r0, [r2]
	adds r1, r1, r5
	mov r0, sb
	strh r0, [r1]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	mov r7, r8
	strh r7, [r0]
	adds r1, #0xa0
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	subs r1, #0xe0
	strh r1, [r0]
	movs r7, #0xa0
	lsls r7, r7, #2
	adds r0, r4, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #1
	strh r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bls _0814888C
	movs r0, #0
	strh r0, [r6, #0x10]
	strh r0, [r6, #0x12]
	movs r0, #7
	strh r0, [r6, #0x14]
	movs r0, #2
	bl EnableInterrupts
	ldr r0, _0814891C
	bl SetVBlankCallback
	ldr r0, _08148920
	bl SetHBlankCallback
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	movs r0, #1
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08148914: .4byte 0x0203A86C
_08148918: .4byte 0x020388C8
_0814891C: .4byte 0x0814875D
_08148920: .4byte 0x081487E9
	thumb_func_end Phase2_ShredSplit_Func1

	thumb_func_start Phase2_ShredSplit_Func2
Phase2_ShredSplit_Func2: @ 0x08148924
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	ldr r1, _081489CC
	mov r0, sp
	movs r2, #2
	bl memcpy
	add r4, sp, #4
	ldr r1, _081489D0
	adds r0, r4, #0
	movs r2, #4
	bl memcpy
	ldr r2, _081489D4
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	str r0, [sp, #8]
	mov sl, r0
	mov r1, sb
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	ldr r1, [sp, #8]
	cmp r1, r0
	ble _08148964
	b _08148B28
_08148964:
	movs r7, #0
	mov r2, sl
	rsbs r2, r2, #0
	str r2, [sp, #0xc]
	mov r3, sl
	adds r3, #1
	str r3, [sp, #0x10]
_08148972:
	movs r6, #0
	mov r0, sp
	adds r0, r0, r7
	mov ip, r0
_0814897A:
	lsls r0, r6, #1
	add r0, sp
	adds r0, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0xc]
	muls r0, r2, r0
	lsls r0, r0, #1
	mov r3, ip
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _08148A26
	cmp r0, #0x4f
	bne _081489A2
	cmp r7, #1
	beq _08148A26
_081489A2:
	lsls r1, r0, #1
	ldr r0, _081489D8
	adds r4, r1, r0
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r3, r1, r0
	ldr r0, _081489DC
	adds r1, r1, r0
	ldrh r2, [r4]
	cmp r2, #0xef
	bls _081489E0
	movs r1, #0xf0
	strh r1, [r4]
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	b _08148A00
	.align 2, 0
_081489CC: .4byte 0x085A8714
_081489D0: .4byte 0x085A8716
_081489D4: .4byte 0x0203A86C
_081489D8: .4byte 0x02038B48
_081489DC: .4byte 0x02038DC8
_081489E0:
	ldrh r0, [r3]
	lsrs r0, r0, #8
	adds r0, r2, r0
	strh r0, [r4]
	ldrh r0, [r1]
	cmp r0, #0x7f
	bhi _081489F2
	lsls r0, r0, #1
	strh r0, [r1]
_081489F2:
	ldrh r2, [r3]
	ldr r0, _08148AA0
	cmp r2, r0
	bhi _08148A00
	ldrh r0, [r1]
	adds r0, r2, r0
	strh r0, [r3]
_08148A00:
	lsls r0, r5, #0x10
	asrs r0, r0, #0xf
	ldr r1, _08148AA4
	adds r2, r0, r1
	ldr r1, _08148AA8
	adds r3, r0, r1
	ldr r0, _08148AAC
	ldr r1, [r0]
	ldrh r0, [r4]
	ldrh r1, [r1, #0x14]
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r4]
	movs r1, #0xf0
	subs r0, r1, r0
	strh r0, [r3]
	mov r2, sl
	cmp r2, #0
	beq _08148A30
_08148A26:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #1
	bls _0814897A
_08148A30:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #1
	bls _08148972
	movs r7, #0
	ldr r3, _08148AB0
	mov r8, r3
_08148A40:
	movs r6, #0
	mov r0, sp
	adds r0, r0, r7
	mov ip, r0
	adds r1, r7, #1
	str r1, [sp, #0x14]
_08148A4C:
	mov r2, ip
	ldrb r1, [r2]
	adds r1, #1
	lsls r0, r6, #1
	add r0, sp
	adds r0, #4
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r2, [sp, #0xc]
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xa0
	bgt _08148B00
	cmp r1, #0x50
	bne _08148A76
	cmp r7, #1
	beq _08148B00
_08148A76:
	lsls r1, r1, #1
	mov r3, r8
	adds r4, r1, r3
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, r8
	adds r3, r1, r0
	ldr r0, _08148AB4
	adds r1, r1, r0
	ldrh r2, [r4]
	cmp r2, #0xef
	bls _08148AB8
	movs r1, #0xf0
	strh r1, [r4]
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	b _08148AD8
	.align 2, 0
_08148AA0: .4byte 0x00000FFF
_08148AA4: .4byte 0x020388C8
_08148AA8: .4byte 0x02038A08
_08148AAC: .4byte 0x0203A86C
_08148AB0: .4byte 0x02038B48
_08148AB4: .4byte 0x02038DC8
_08148AB8:
	ldrh r0, [r3]
	lsrs r0, r0, #8
	adds r0, r2, r0
	strh r0, [r4]
	ldrh r0, [r1]
	cmp r0, #0x7f
	bhi _08148ACA
	lsls r0, r0, #1
	strh r0, [r1]
_08148ACA:
	ldrh r2, [r3]
	ldr r0, _08148B84
	cmp r2, r0
	bhi _08148AD8
	ldrh r0, [r1]
	adds r0, r2, r0
	strh r0, [r3]
_08148AD8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0xf
	ldr r1, _08148B88
	adds r2, r0, r1
	ldr r1, _08148B8C
	adds r3, r0, r1
	ldr r1, _08148B90
	ldr r0, [r1]
	ldrh r1, [r0, #0x14]
	ldrh r0, [r4]
	subs r1, r1, r0
	strh r1, [r2]
	ldrh r0, [r4]
	lsls r0, r0, #8
	movs r1, #0xf1
	orrs r0, r1
	strh r0, [r3]
	mov r2, sl
	cmp r2, #0
	beq _08148B0A
_08148B00:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #1
	bls _08148A4C
_08148B0A:
	ldr r3, [sp, #0x14]
	lsls r0, r3, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #1
	bls _08148A40
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r2, sb
	movs r3, #0x12
	ldrsh r0, [r2, r3]
	cmp sl, r0
	bgt _08148B28
	b _08148964
_08148B28:
	mov r1, sb
	ldrh r0, [r1, #0x10]
	subs r0, #1
	strh r0, [r1, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08148B3A
	movs r0, #0
	strh r0, [r1, #0x10]
_08148B3A:
	mov r2, sb
	movs r3, #0x10
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bgt _08148B58
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	adds r0, #1
	cmp r0, #0x14
	bgt _08148B58
	ldrh r0, [r2, #0x14]
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x12]
	adds r0, #1
	strh r0, [r2, #0x12]
_08148B58:
	ldr r2, [sp, #8]
	cmp r2, #0x9f
	bls _08148B66
	mov r3, sb
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_08148B66:
	ldr r0, _08148B90
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08148B84: .4byte 0x00000FFF
_08148B88: .4byte 0x020388C8
_08148B8C: .4byte 0x02038A08
_08148B90: .4byte 0x0203A86C
	thumb_func_end Phase2_ShredSplit_Func2

	thumb_func_start Phase2_ShredSplit_Func3
Phase2_ShredSplit_Func3: @ 0x08148B94
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r2, #1
	ldr r5, _08148BCC
	movs r1, #0
	ldr r4, _08148BD0
_08148BA0:
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0xf0
	beq _08148BB0
	cmp r0, r5
	beq _08148BB0
	movs r2, #0
_08148BB0:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bls _08148BA0
	cmp r2, #1
	bne _08148BC4
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_08148BC4:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08148BCC: .4byte 0x0000FF10
_08148BD0: .4byte 0x02039048
	thumb_func_end Phase2_ShredSplit_Func3

	thumb_func_start Phase2_ShredSplit_Func4
Phase2_ShredSplit_Func4: @ 0x08148BD4
	push {lr}
	ldr r1, _08148C04
	ldrh r2, [r1, #0xa]
	ldr r0, _08148C08
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08148C0C
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, _08148C10
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08148C04: .4byte 0x040000B0
_08148C08: .4byte 0x0000C5FF
_08148C0C: .4byte 0x00007FFF
_08148C10: .4byte 0x08148821
	thumb_func_end Phase2_ShredSplit_Func4

	thumb_func_start Phase2Task_Regice
Phase2Task_Regice: @ 0x08148C14
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08148C44
	ldr r2, _08148C48
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08148C26:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08148C26
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08148C44: .4byte 0x085A871C
_08148C48: .4byte 0x03005B60
	thumb_func_end Phase2Task_Regice

	thumb_func_start Phase2Task_Regirock
Phase2Task_Regirock: @ 0x08148C4C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08148C7C
	ldr r2, _08148C80
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08148C5E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08148C5E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08148C7C: .4byte 0x085A8728
_08148C80: .4byte 0x03005B60
	thumb_func_end Phase2Task_Regirock

	thumb_func_start Phase2_Blackhole_Func1
Phase2_Blackhole_Func1: @ 0x08148C84
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	ldr r0, _08148CD8
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #2]
	movs r0, #0x3f
	strh r0, [r1, #4]
	movs r0, #0xf0
	strh r0, [r1, #6]
	movs r0, #0xa0
	strh r0, [r1, #8]
	ldr r0, _08148CDC
	movs r2, #0
	movs r1, #0x9f
	ldr r3, _08148CE0
	adds r0, r0, r3
_08148CAE:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08148CAE
	movs r4, #0
	ldr r0, _08148CE4
	bl SetVBlankCallback
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #1
	strh r0, [r5, #0xa]
	adds r0, #0xff
	strh r0, [r5, #0xc]
	strh r4, [r5, #0x16]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08148CD8: .4byte 0x0203A86C
_08148CDC: .4byte 0x020388C8
_08148CE0: .4byte 0x000008BE
_08148CE4: .4byte 0x08147029
	thumb_func_end Phase2_Blackhole_Func1

	thumb_func_start Phase2_Blackhole1_Func3
Phase2_Blackhole1_Func3: @ 0x08148CE8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08148D2C
	ldr r1, _08148D20
	ldrh r2, [r1, #0xa]
	ldr r0, _08148D24
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08148D28
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	b _08148D9E
	.align 2, 0
_08148D20: .4byte 0x040000B0
_08148D24: .4byte 0x0000C5FF
_08148D28: .4byte 0x00007FFF
_08148D2C:
	ldr r5, _08148D88
	ldr r1, [r5]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldrh r2, [r4, #0xc]
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, _08148D8C
	cmp r1, r0
	bgt _08148D48
	adds r0, r2, #0
	adds r0, #0x80
	strh r0, [r4, #0xc]
_08148D48:
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0x9f
	bgt _08148D5C
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, r1, r0
	strh r0, [r4, #0xa]
_08148D5C:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xa0
	ble _08148D68
	movs r0, #0xa0
	strh r0, [r4, #0xa]
_08148D68:
	ldr r0, _08148D90
	movs r2, #0xa
	ldrsh r3, [r4, r2]
	movs r1, #0x78
	movs r2, #0x50
	bl sub_0814A0D4
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xa0
	bne _08148D94
	movs r0, #1
	strh r0, [r4, #0x16]
	bl sub_0814A044
	b _08148D9E
	.align 2, 0
_08148D88: .4byte 0x0203A86C
_08148D8C: .4byte 0x000003FF
_08148D90: .4byte 0x020388C8
_08148D94:
	ldr r0, [r5]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
_08148D9E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Phase2_Blackhole1_Func3

	thumb_func_start Phase2_Blackhole1_Func2
Phase2_Blackhole1_Func2: @ 0x08148DA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _08148E20
	ldr r0, [r6]
	ldrb r1, [r0]
	movs r5, #0
	strb r5, [r0]
	ldrh r1, [r4, #0x16]
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08148DCA
	adds r0, r1, #1
	strh r0, [r4, #0x16]
	movs r0, #0x30
	strh r0, [r4, #0xa]
	strh r5, [r4, #0x14]
_08148DCA:
	ldr r1, _08148E24
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	strh r0, [r4, #0xa]
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	strh r1, [r4, #0x14]
	ldr r0, _08148E28
	movs r1, #0xa
	ldrsh r3, [r4, r1]
	movs r1, #0x78
	movs r2, #0x50
	bl sub_0814A0D4
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bgt _08148E0C
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	strh r5, [r4, #0x16]
_08148E0C:
	ldr r0, [r6]
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08148E20: .4byte 0x0203A86C
_08148E24: .4byte 0x085A8730
_08148E28: .4byte 0x020388C8
	thumb_func_end Phase2_Blackhole1_Func2

	thumb_func_start Phase2_Blackhole2_Func2
Phase2_Blackhole2_Func2: @ 0x08148E2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08148EA8
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r4, #0x16]
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08148E4E
	adds r0, r1, #1
	strh r0, [r4, #0x16]
	movs r0, #2
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
_08148E4E:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xa0
	ble _08148E5A
	movs r0, #0xa0
	strh r0, [r4, #0xa]
_08148E5A:
	ldr r0, _08148EAC
	movs r2, #0xa
	ldrsh r3, [r4, r2]
	movs r1, #0x78
	movs r2, #0x50
	bl sub_0814A0D4
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xa0
	bne _08148E96
	ldr r1, _08148EB0
	ldrh r2, [r1, #0xa]
	ldr r0, _08148EB4
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08148EB8
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_08148E96:
	ldrh r2, [r4, #0x12]
	ldrb r0, [r4, #0x12]
	cmp r0, #0x80
	bgt _08148EBC
	ldrh r1, [r4, #0x14]
	adds r0, r2, #0
	adds r0, #8
	b _08148EC8
	.align 2, 0
_08148EA8: .4byte 0x0203A86C
_08148EAC: .4byte 0x020388C8
_08148EB0: .4byte 0x040000B0
_08148EB4: .4byte 0x0000C5FF
_08148EB8: .4byte 0x00007FFF
_08148EBC:
	ldrh r0, [r4, #0x14]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x10
_08148EC8:
	strh r0, [r4, #0x12]
	movs r0, #0xff
	ands r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl Sin
	ldrh r2, [r4, #0xa]
	adds r0, r0, r2
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08148EE8
	movs r0, #1
	strh r0, [r4, #0xa]
_08148EE8:
	ldrh r0, [r4, #0x12]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xfe
	ble _08148EFC
	asrs r0, r1, #0x18
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x14]
	adds r0, #1
	strh r0, [r4, #0x14]
_08148EFC:
	ldr r0, _08148F10
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08148F10: .4byte 0x0203A86C
	thumb_func_end Phase2_Blackhole2_Func2

	thumb_func_start Phase2Task_Registeel
Phase2Task_Registeel: @ 0x08148F14
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08148F44
	ldr r2, _08148F48
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08148F26:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08148F26
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08148F44: .4byte 0x085A8734
_08148F48: .4byte 0x03005B60
	thumb_func_end Phase2Task_Registeel

	thumb_func_start Phase2_RectangularSpiral_Func1
Phase2_RectangularSpiral_Func1: @ 0x08148F4C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	ldr r4, _08148FF0
	ldr r1, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuSet
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r1, [sp, #8]
	adds r1, #0x40
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuSet
	mov r1, sp
	movs r2, #0xf0
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r2, _08148FF4
	mov r0, sp
	bl CpuSet
	ldr r0, _08148FF8
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r1, #0
	movs r4, #1
	movs r0, #1
	strh r0, [r5, #0xe]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	ldr r5, _08148FFC
	strb r1, [r5]
	ldr r0, _08149000
	strh r0, [r5, #2]
	strb r4, [r5, #4]
	movs r2, #0x9a
	lsls r2, r2, #1
	strh r2, [r5, #6]
	strb r1, [r5, #8]
	strb r1, [r5, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r5, #0xe]
	strb r4, [r5, #0x10]
	strh r2, [r5, #0x12]
	strb r1, [r5, #0x14]
	strb r1, [r5, #0x18]
	ldr r2, _08149004
	strh r2, [r5, #0x1a]
	strb r4, [r5, #0x1c]
	ldr r3, _08149008
	strh r3, [r5, #0x1e]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	strh r2, [r5, #0x26]
	adds r0, #4
	strb r4, [r0]
	strh r3, [r5, #0x2a]
	adds r0, #4
	strb r1, [r0]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08148FF0: .4byte 0x0859A780
_08148FF4: .4byte 0x01000400
_08148FF8: .4byte 0x085A8984
_08148FFC: .4byte 0x03001210
_08149000: .4byte 0x0000FFFF
_08149004: .4byte 0x0000FFFD
_08149008: .4byte 0x00000133
	thumb_func_end Phase2_RectangularSpiral_Func1

	thumb_func_start Phase2_RectangularSpiral_Func2
Phase2_RectangularSpiral_Func2: @ 0x0814900C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	movs r7, #1
	add r1, sp, #4
	mov r0, sp
	bl sub_0814A018
	movs r0, #0
_08149022:
	movs r5, #0
	adds r6, r0, #1
_08149026:
	ldr r1, _081490B8
	lsrs r0, r5, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	ldr r2, _081490BC
	adds r4, r1, r2
	adds r1, r4, #0
	bl sub_08149108
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0814908A
	movs r7, #0
	ldrh r2, [r4, #2]
	movs r0, #1
	ands r0, r5
	cmp r0, #1
	bne _08149060
	ldr r0, _081490C0
	adds r1, r0, #0
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
_08149060:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	cmp r1, #0
	bge _0814906C
	adds r0, #0x1f
_0814906C:
	asrs r2, r0, #5
	lsls r0, r2, #5
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r2, #5
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	ldr r0, [sp]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r2, _081490C4
	adds r0, r2, #0
	strh r0, [r1]
_0814908A:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _08149026
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08149022
	cmp r7, #1
	bne _081490A8
	mov r1, r8
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_081490A8:
	movs r0, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081490B8: .4byte 0x085A87E8
_081490BC: .4byte 0x03001210
_081490C0: .4byte 0x0000027D
_081490C4: .4byte 0x0000F002
	thumb_func_end Phase2_RectangularSpiral_Func2

	thumb_func_start Phase2_RectangularSpiral_Func3
Phase2_RectangularSpiral_Func3: @ 0x081490C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _081490FC
	ldrh r2, [r1, #0xa]
	ldr r0, _08149100
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08149104
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081490FC: .4byte 0x040000B0
_08149100: .4byte 0x0000C5FF
_08149104: .4byte 0x00007FFF
	thumb_func_end Phase2_RectangularSpiral_Func3

	thumb_func_start sub_08149108
sub_08149108: @ 0x08149108
	push {r4, lr}
	adds r2, r1, #0
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r3, [r1]
	ldrb r0, [r2, #4]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0814918E
	ldr r1, _0814914C
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #2]
	strh r0, [r1]
	ldrh r0, [r3, #4]
	strh r0, [r1]
	ldrh r0, [r3, #6]
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #2
	beq _08149160
	cmp r0, #2
	bgt _08149150
	cmp r0, #1
	beq _0814915A
	b _08149172
	.align 2, 0
_0814914C: .4byte 0x03001208
_08149150:
	cmp r0, #3
	beq _08149166
	cmp r0, #4
	beq _0814916C
	b _08149172
_0814915A:
	ldrh r0, [r2, #2]
	adds r0, #1
	b _08149170
_08149160:
	ldrh r0, [r2, #2]
	subs r0, #1
	b _08149170
_08149166:
	ldrh r0, [r2, #2]
	subs r0, #0x20
	b _08149170
_0814916C:
	ldrh r0, [r2, #2]
	adds r0, #0x20
_08149170:
	strh r0, [r2, #2]
_08149172:
	movs r4, #2
	ldrsh r1, [r2, r4]
	ldr r0, _08149194
	cmp r1, r0
	bgt _0814918E
	ldrb r0, [r2, #4]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08149198
_0814918E:
	movs r0, #0
	b _081491F8
	.align 2, 0
_08149194: .4byte 0x0000027F
_08149198:
	ldrb r0, [r2, #8]
	cmp r0, #0
	bne _081491B4
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _081491B4
	movs r0, #1
	strb r0, [r2, #8]
	strb r0, [r2, #4]
	ldrh r0, [r2, #6]
	strh r0, [r2, #2]
	movs r0, #4
	strb r0, [r2]
_081491B4:
	ldrb r0, [r2, #4]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _081491F6
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	ldrb r0, [r2, #8]
	cmp r0, #1
	bne _081491E4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _081491F6
	ldrb r0, [r2, #4]
	adds r0, #1
	strb r0, [r2, #4]
	movs r0, #4
	b _081491F4
_081491E4:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _081491F6
	ldrb r0, [r2, #4]
	adds r0, #1
	strb r0, [r2, #4]
	movs r0, #0
_081491F4:
	strb r0, [r2]
_081491F6:
	movs r0, #1
_081491F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08149108

	thumb_func_start Phase2Task_Ripple
Phase2Task_Ripple: @ 0x08149200
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08149230
	ldr r2, _08149234
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08149212:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08149212
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149230: .4byte 0x085A87F0
_08149234: .4byte 0x03005B60
	thumb_func_end Phase2Task_Ripple

	thumb_func_start Phase2_Groudon_Func3
Phase2_Groudon_Func3: @ 0x08149238
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r2, _0814927C
	mov r0, sp
	bl CpuSet
	ldr r0, _08149280
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _08149284
	ldr r1, [sp, #4]
	bl LZ77UnCompVram
	ldrh r0, [r4, #8]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814927C: .4byte 0x01000400
_08149280: .4byte 0x0859DFCC
_08149284: .4byte 0x0859E538
	thumb_func_end Phase2_Groudon_Func3

	thumb_func_start Phase2_Groudon_Func4
Phase2_Groudon_Func4: @ 0x08149288
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r5, [r4, r0]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081492C0
	adds r0, r5, #0
	movs r1, #0x1e
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	ldr r1, _081492E0
	adds r0, r0, r1
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
_081492C0:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3a
	ble _081492D8
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0xa]
_081492D8:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081492E0: .4byte 0x0859EB50
	thumb_func_end Phase2_Groudon_Func4

	thumb_func_start Phase2_Groudon_Func5
Phase2_Groudon_Func5: @ 0x081492E4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r5, [r4, r0]
	adds r0, r5, #0
	movs r1, #5
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08149312
	adds r0, r5, #0
	movs r1, #5
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xb
	ldr r1, _08149338
	adds r0, r0, r1
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
_08149312:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x44
	ble _0814932E
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #0x1e
	strh r0, [r4, #0x18]
_0814932E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08149338: .4byte 0x0859ED50
	thumb_func_end Phase2_Groudon_Func5

	thumb_func_start Phase2Task_Shards
Phase2Task_Shards: @ 0x0814933C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0814936C
	ldr r2, _08149370
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814934E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814934E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814936C: .4byte 0x085A8810
_08149370: .4byte 0x03005B60
	thumb_func_end Phase2Task_Shards

	thumb_func_start Phase2_Rayquaza_Func3
Phase2_Rayquaza_Func3: @ 0x08149374
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	ldr r1, _081493FC
	movs r0, #8
	bl SetGpuReg
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r2, _08149400
	mov r0, sp
	bl CpuSet
	ldr r0, _08149404
	ldr r1, [sp, #8]
	movs r2, #0x80
	lsls r2, r2, #5
	bl CpuSet
	ldr r0, _08149408
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldr r0, _0814940C
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r2, #0
	ldr r3, _08149410
	movs r6, #0
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r5, r3, r0
	movs r4, #0x80
	lsls r4, r4, #1
_081493D6:
	lsls r1, r2, #1
	adds r0, r1, r3
	strh r6, [r0]
	adds r1, r1, r5
	strh r4, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bls _081493D6
	ldr r0, _08149414
	bl SetVBlankCallback
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081493FC: .4byte 0x00009A08
_08149400: .4byte 0x01000400
_08149404: .4byte 0x0859F150
_08149408: .4byte 0x0203A86C
_0814940C: .4byte 0x0859EFF0
_08149410: .4byte 0x020388C8
_08149414: .4byte 0x081495C9
	thumb_func_end Phase2_Rayquaza_Func3

	thumb_func_start Phase2_Rayquaza_Func4
Phase2_Rayquaza_Func4: @ 0x08149418
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r1, sp, #4
	mov r0, sp
	bl sub_0814A018
	ldr r0, _08149444
	ldr r1, [sp]
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuSet
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149444: .4byte 0x085A6690
	thumb_func_end Phase2_Rayquaza_Func4

	thumb_func_start Phase2_Rayquaza_Func5
Phase2_Rayquaza_Func5: @ 0x08149448
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08149474
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08149460
	adds r0, #3
_08149460:
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x10
	adds r0, #5
	lsls r0, r0, #5
	ldr r1, _08149494
	adds r0, r0, r1
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
_08149474:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0814948C
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0xa]
_0814948C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149494: .4byte 0x0859EF50
	thumb_func_end Phase2_Rayquaza_Func5

	thumb_func_start Phase2_Rayquaza_Func6
Phase2_Rayquaza_Func6: @ 0x08149498
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldrh r0, [r1, #0xa]
	adds r0, #1
	movs r2, #0
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _081494C2
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	ldr r0, _081494CC
	str r2, [sp]
	movs r1, #2
	movs r3, #0x10
	bl BeginNormalPaletteFade
_081494C2:
	movs r0, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_081494CC: .4byte 0xFFFF8000
	thumb_func_end Phase2_Rayquaza_Func6

	thumb_func_start Phase2_Rayquaza_Func7
Phase2_Rayquaza_Func7: @ 0x081494D0
	push {lr}
	adds r2, r0, #0
	ldr r0, _081494F4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081494EE
	ldr r0, _081494F8
	ldr r1, [r0]
	movs r0, #1
	strh r0, [r1, #0x20]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_081494EE:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081494F4: .4byte 0x02037C74
_081494F8: .4byte 0x0203A86C
	thumb_func_end Phase2_Rayquaza_Func7

	thumb_func_start Phase2_Rayquaza_Func8
Phase2_Rayquaza_Func8: @ 0x081494FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08149524
	movs r1, #8
	movs r2, #0
	bl BlendPalettes
	ldr r0, _08149528
	movs r1, #0
	movs r2, #0
	bl BlendPalettes
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149524: .4byte 0x00007FFF
_08149528: .4byte 0xFFFF8000
	thumb_func_end Phase2_Rayquaza_Func8

	thumb_func_start Phase2_Rayquaza_Func9
Phase2_Rayquaza_Func9: @ 0x0814952C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r5, [r4, r0]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0814955A
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	ldr r1, _081495B8
	adds r0, r0, r1
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
_0814955A:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	ble _081495B0
	ldr r0, _081495BC
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #2]
	movs r0, #0x3f
	strh r0, [r1, #4]
	movs r0, #0xf0
	strh r0, [r1, #6]
	movs r0, #0xa0
	strh r0, [r1, #8]
	movs r1, #0
	ldr r5, _081495C0
	ldr r3, _081495C4
	movs r2, #0
_08149584:
	lsls r0, r1, #1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bls _08149584
	adds r0, r5, #0
	bl SetVBlankCallback
	ldrh r0, [r4, #8]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r4, #0xc]
	strh r2, [r4, #0x16]
	movs r0, #0
	bl ClearGpuRegBits
_081495B0:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081495B8: .4byte 0x0859EF50
_081495BC: .4byte 0x0203A86C
_081495C0: .4byte 0x08147029
_081495C4: .4byte 0x02039048
	thumb_func_end Phase2_Rayquaza_Func9

	thumb_func_start VBlankCB_Phase2_Rayquaza
VBlankCB_Phase2_Rayquaza: @ 0x081495C8
	push {lr}
	ldr r1, _081495F4
	ldrh r2, [r1, #0xa]
	ldr r0, _081495F8
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _081495FC
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl VBlankCB_BattleTransition
	ldr r0, _08149600
	ldr r0, [r0]
	movs r1, #0x20
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08149608
	ldr r2, _08149604
	b _08149614
	.align 2, 0
_081495F4: .4byte 0x040000B0
_081495F8: .4byte 0x0000C5FF
_081495FC: .4byte 0x00007FFF
_08149600: .4byte 0x0203A86C
_08149604: .4byte 0x020388C8
_08149608:
	ldr r2, _08149628
	cmp r0, #1
	bne _08149614
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r2, r2, r0
_08149614:
	ldr r1, _0814962C
	str r2, [r1]
	ldr r0, _08149630
	str r0, [r1, #4]
	ldr r0, _08149634
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08149628: .4byte 0x020388C8
_0814962C: .4byte 0x040000B0
_08149630: .4byte 0x04000012
_08149634: .4byte 0xA2400001
	thumb_func_end VBlankCB_Phase2_Rayquaza

	thumb_func_start Phase2Task_ShredSplit
Phase2Task_ShredSplit: @ 0x08149638
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08149668
	ldr r2, _0814966C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814964A:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814964A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149668: .4byte 0x085A883C
_0814966C: .4byte 0x03005B60
	thumb_func_end Phase2Task_ShredSplit

	thumb_func_start Phase2_WhiteFade_Func1
Phase2_WhiteFade_Func1: @ 0x08149670
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	ldr r0, _081496D8
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0xbf
	strh r0, [r1, #0xe]
	strh r2, [r1, #0x12]
	movs r0, #0x1e
	strh r0, [r1, #2]
	movs r0, #0x3f
	strh r0, [r1, #4]
	movs r0, #0xa0
	strh r0, [r1, #8]
	movs r1, #0
	ldr r2, _081496DC
	movs r4, #0
	movs r3, #0xf0
_0814969C:
	lsls r0, r1, #1
	adds r0, r0, r2
	strh r4, [r0]
	adds r0, r1, #0
	adds r0, #0xa0
	lsls r0, r0, #1
	adds r0, r0, r2
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bls _0814969C
	movs r0, #2
	bl EnableInterrupts
	ldr r0, _081496E0
	bl SetHBlankCallback
	ldr r0, _081496E4
	bl SetVBlankCallback
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081496D8: .4byte 0x0203A86C
_081496DC: .4byte 0x02039048
_081496E0: .4byte 0x08149901
_081496E4: .4byte 0x08149835
	thumb_func_end Phase2_WhiteFade_Func1

	thumb_func_start Phase2_WhiteFade_Func2
Phase2_WhiteFade_Func2: @ 0x081496E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, _08149750
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	movs r5, #0
	movs r4, #0
_081496FC:
	ldr r0, _08149754
	bl CreateInvisibleSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08149758
	adds r2, r1, r0
	movs r0, #0xf0
	strh r0, [r2, #0x20]
	strh r4, [r2, #0x22]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r2, #0x38]
	adds r1, #1
	lsls r1, r1, #0x10
	lsls r0, r4, #0x10
	movs r3, #0xa0
	lsls r3, r3, #0xd
	adds r0, r0, r3
	lsrs r4, r0, #0x10
	lsrs r5, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #7
	ble _081496FC
	ldrh r0, [r2, #0x3a]
	adds r0, #1
	strh r0, [r2, #0x3a]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08149750: .4byte 0x085A8850
_08149754: .4byte 0x08149925
_08149758: .4byte 0x020205AC
	thumb_func_end Phase2_WhiteFade_Func2

	thumb_func_start Phase2_WhiteFade_Func3
Phase2_WhiteFade_Func3: @ 0x0814975C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08149790
	ldr r1, [r2]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, #0x20
	ldrsh r0, [r0, r1]
	cmp r0, #7
	ble _08149786
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, _08149794
	movs r1, #0x10
	bl BlendPalettes
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08149786:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149790: .4byte 0x0203A86C
_08149794: .4byte 0x00007FFF
	thumb_func_end Phase2_WhiteFade_Func3

	thumb_func_start Phase2_WhiteFade_Func4
Phase2_WhiteFade_Func4: @ 0x08149798
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _081497EC
	ldr r0, [r4]
	ldrb r1, [r0]
	movs r5, #0
	strb r5, [r0]
	ldr r1, _081497F0
	ldrh r2, [r1, #0xa]
	ldr r0, _081497F4
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _081497F8
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	ldr r1, [r4]
	movs r0, #0xf0
	strh r0, [r1, #6]
	strh r5, [r1, #0x12]
	movs r0, #0xff
	strh r0, [r1, #0xe]
	movs r0, #0x3f
	strh r0, [r1, #2]
	ldr r0, _081497FC
	bl SetVBlankCallback
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081497EC: .4byte 0x0203A86C
_081497F0: .4byte 0x040000B0
_081497F4: .4byte 0x0000C5FF
_081497F8: .4byte 0x00007FFF
_081497FC: .4byte 0x081498C5
	thumb_func_end Phase2_WhiteFade_Func4

	thumb_func_start Phase2_WhiteFade_Func5
Phase2_WhiteFade_Func5: @ 0x08149800
	push {lr}
	ldr r0, _0814982C
	ldr r1, [r0]
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _08149826
	bl sub_0814A044
	ldr r0, _08149830
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_08149826:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0814982C: .4byte 0x0203A86C
_08149830: .4byte 0x08149639
	thumb_func_end Phase2_WhiteFade_Func5

	thumb_func_start VBlankCB0_Phase2_WhiteFade
VBlankCB0_Phase2_WhiteFade: @ 0x08149834
	push {r4, lr}
	ldr r4, _08149898
	ldrh r1, [r4, #0xa]
	ldr r0, _0814989C
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _081498A0
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl VBlankCB_BattleTransition
	ldr r2, _081498A4
	ldr r0, _081498A8
	ldr r1, [r0]
	ldrh r0, [r1, #0xe]
	strh r0, [r2]
	subs r2, #8
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	subs r2, #6
	ldrh r0, [r1, #8]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08149884
	ldr r1, _081498AC
	ldr r0, _081498B0
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _081498B4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08149884:
	ldr r0, _081498B8
	str r0, [r4]
	ldr r0, _081498BC
	str r0, [r4, #4]
	ldr r0, _081498C0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149898: .4byte 0x040000B0
_0814989C: .4byte 0x0000C5FF
_081498A0: .4byte 0x00007FFF
_081498A4: .4byte 0x04000050
_081498A8: .4byte 0x0203A86C
_081498AC: .4byte 0x040000D4
_081498B0: .4byte 0x020388C8
_081498B4: .4byte 0x80000140
_081498B8: .4byte 0x02039188
_081498BC: .4byte 0x04000040
_081498C0: .4byte 0xA2400001
	thumb_func_end VBlankCB0_Phase2_WhiteFade

	thumb_func_start VBlankCB1_Phase2_WhiteFade
VBlankCB1_Phase2_WhiteFade: @ 0x081498C4
	push {lr}
	bl VBlankCB_BattleTransition
	ldr r1, _081498F8
	ldr r0, _081498FC
	ldr r2, [r0]
	ldrh r0, [r2, #0x12]
	strh r0, [r1]
	subs r1, #4
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	subs r1, #8
	ldrh r0, [r2, #2]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #4]
	strh r0, [r1]
	subs r1, #0xa
	ldrh r0, [r2, #6]
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #8]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081498F8: .4byte 0x04000054
_081498FC: .4byte 0x0203A86C
	thumb_func_end VBlankCB1_Phase2_WhiteFade

	thumb_func_start HBlankCB_Phase2_WhiteFade
HBlankCB_Phase2_WhiteFade: @ 0x08149900
	ldr r2, _08149918
	ldr r1, _0814991C
	ldr r0, _08149920
	ldrh r0, [r0]
	lsls r0, r0, #1
	movs r3, #0xf0
	lsls r3, r3, #3
	adds r1, r1, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08149918: .4byte 0x04000054
_0814991C: .4byte 0x020388C8
_08149920: .4byte 0x04000006
	thumb_func_end HBlankCB_Phase2_WhiteFade

	thumb_func_start sub_08149924
sub_08149924: @ 0x08149924
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x38]
	movs r2, #0x38
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _08149950
	subs r0, r1, #1
	strh r0, [r3, #0x38]
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _08149A0C
	ldr r0, _0814994C
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, #1
	strb r0, [r1]
	b _08149A0C
	.align 2, 0
_0814994C: .4byte 0x0203A86C
_08149950:
	movs r2, #0x22
	ldrsh r1, [r3, r2]
	lsls r1, r1, #1
	ldr r0, _08149A14
	adds r6, r1, r0
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r5, r1, r0
	movs r4, #0
_08149964:
	lsls r1, r4, #1
	adds r2, r1, r6
	ldrh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r2]
	adds r1, r1, r5
	ldrh r0, [r3, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _08149964
	movs r1, #0x20
	ldrsh r0, [r3, r1]
	ldrh r2, [r3, #0x20]
	cmp r0, #0
	bne _0814999E
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r1, r0
	bne _0814999E
	movs r0, #1
	strh r0, [r3, #0x30]
_0814999E:
	adds r1, r2, #0
	subs r1, #0x10
	strh r1, [r3, #0x20]
	ldrh r0, [r3, #0x2e]
	adds r0, #0x80
	strh r0, [r3, #0x2e]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _081499B4
	movs r0, #0
	strh r0, [r3, #0x20]
_081499B4:
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	movs r1, #0x80
	lsls r1, r1, #5
	cmp r0, r1
	ble _081499C2
	strh r1, [r3, #0x2e]
_081499C2:
	movs r2, #0x3a
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _081499D4
	ldr r0, _08149A18
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, #1
	strb r0, [r1]
_081499D4:
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _08149A0C
	movs r2, #0x3a
	ldrsh r0, [r3, r2]
	ldr r2, _08149A18
	cmp r0, #0
	beq _081499FE
	ldr r0, [r2]
	movs r1, #0x20
	ldrsh r0, [r0, r1]
	cmp r0, #6
	ble _08149A0C
	ldrh r0, [r3, #0x32]
	adds r1, r0, #1
	strh r1, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _08149A0C
_081499FE:
	ldr r1, [r2]
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
	adds r0, r3, #0
	bl DestroySprite
_08149A0C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149A14: .4byte 0x020388C8
_08149A18: .4byte 0x0203A86C
	thumb_func_end sub_08149924

	thumb_func_start Phase2Task_Shuffle
Phase2Task_Shuffle: @ 0x08149A1C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08149A4C
	ldr r2, _08149A50
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08149A2E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08149A2E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149A4C: .4byte 0x085A8860
_08149A50: .4byte 0x03005B60
	thumb_func_end Phase2Task_Shuffle

	thumb_func_start Phase2_GridSquares_Func1
Phase2_GridSquares_Func1: @ 0x08149A54
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	ldr r0, _08149A9C
	ldr r1, [sp, #8]
	movs r2, #0x10
	bl CpuSet
	mov r1, sp
	movs r2, #0xf0
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r2, _08149AA0
	mov r0, sp
	bl CpuSet
	ldr r0, _08149AA4
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149A9C: .4byte 0x0859A780
_08149AA0: .4byte 0x01000400
_08149AA4: .4byte 0x085A8984
	thumb_func_end Phase2_GridSquares_Func1

	thumb_func_start Phase2_GridSquares_Func2
Phase2_GridSquares_Func2: @ 0x08149AA8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08149AEA
	mov r0, sp
	bl sub_0814A000
	movs r0, #3
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	ldr r1, _08149AFC
	adds r0, r0, r1
	ldr r1, [sp]
	movs r2, #0x10
	bl CpuSet
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	ble _08149AEA
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0x10
	strh r0, [r4, #0xa]
_08149AEA:
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149AFC: .4byte 0x0859A780
	thumb_func_end Phase2_GridSquares_Func2

	thumb_func_start Phase2_GridSquares_Func3
Phase2_GridSquares_Func3: @ 0x08149B00
	push {lr}
	ldrh r1, [r0, #0xa]
	subs r1, #1
	strh r1, [r0, #0xa]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _08149B20
	bl sub_0814A044
	ldr r0, _08149B28
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_08149B20:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08149B28: .4byte 0x08149A1D
	thumb_func_end Phase2_GridSquares_Func3

	thumb_func_start Phase2Task_Slice
Phase2Task_Slice: @ 0x08149B2C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08149B5C
	ldr r2, _08149B60
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08149B3E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08149B3E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149B5C: .4byte 0x085A886C
_08149B60: .4byte 0x03005B60
	thumb_func_end Phase2Task_Slice

	thumb_func_start Phase2_Shards_Func1
Phase2_Shards_Func1: @ 0x08149B64
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	ldr r0, _08149BBC
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0x3f
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	movs r0, #0xa0
	strh r0, [r1, #8]
	movs r1, #0
	ldr r2, _08149BC0
	movs r3, #0xf0
	adds r4, r2, #0
_08149B88:
	lsls r0, r1, #1
	adds r0, r0, r2
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bls _08149B88
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r1, r4, r0
	adds r0, r4, #0
	movs r2, #0xa0
	bl CpuSet
	ldr r0, _08149BC4
	bl SetVBlankCallback
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08149BBC: .4byte 0x0203A86C
_08149BC0: .4byte 0x020388C8
_08149BC4: .4byte 0x08149DA9
	thumb_func_end Phase2_Shards_Func1

	thumb_func_start Phase2_Shards_Func2
Phase2_Shards_Func2: @ 0x08149BC8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	mov r8, r0
	ldr r0, _08149C3C
	ldr r0, [r0]
	adds r0, #0x24
	ldr r6, _08149C40
	mov r2, r8
	movs r3, #0xa
	ldrsh r1, [r2, r3]
	lsls r4, r1, #2
	adds r4, r4, r1
	lsls r4, r4, #1
	adds r1, r4, r6
	movs r5, #0
	ldrsh r1, [r1, r5]
	adds r2, r6, #2
	adds r2, r4, r2
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r6, #4
	adds r3, r4, r3
	movs r5, #0
	ldrsh r3, [r3, r5]
	adds r5, r6, #6
	adds r4, r4, r5
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	str r4, [sp, #8]
	bl sub_0814A26C
	mov r0, r8
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r6, #8
	adds r0, r0, r6
	ldrh r0, [r0]
	mov r3, r8
	strh r0, [r3, #0xc]
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	movs r0, #1
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08149C3C: .4byte 0x0203A86C
_08149C40: .4byte 0x085A8880
	thumb_func_end Phase2_Shards_Func2

	thumb_func_start Phase2_Shards_Func3
Phase2_Shards_Func3: @ 0x08149C44
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _08149C94
	ldr r1, [r0]
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	mov r8, r0
	movs r7, #0
	ldr r0, _08149C98
	mov sb, r0
_08149C60:
	ldr r1, _08149C98
	ldr r0, _08149C94
	ldr r2, [r0]
	movs r3, #0x2a
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r3, r0, #8
	movs r5, #0xff
	ands r5, r0
	movs r4, #0xc
	ldrsh r0, [r6, r4]
	cmp r0, #0
	bne _08149C9C
	movs r1, #0x28
	ldrsh r0, [r2, r1]
	cmp r3, r0
	bge _08149C88
	ldrh r3, [r2, #0x28]
_08149C88:
	lsls r0, r3, #0x10
	lsls r1, r5, #0x10
	cmp r0, r1
	ble _08149CB4
	lsrs r3, r1, #0x10
	b _08149CB4
	.align 2, 0
_08149C94: .4byte 0x0203A86C
_08149C98: .4byte 0x020388C8
_08149C9C:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x28
	ldrsh r1, [r2, r4]
	cmp r0, r1
	ble _08149CAA
	ldrh r5, [r2, #0x28]
_08149CAA:
	lsls r0, r5, #0x10
	lsls r1, r3, #0x10
	cmp r0, r1
	bgt _08149CB4
	lsrs r5, r1, #0x10
_08149CB4:
	ldr r0, _08149CD8
	ldr r4, [r0]
	movs r0, #0x2a
	ldrsh r2, [r4, r0]
	lsls r2, r2, #1
	add r2, sb
	lsls r1, r3, #0x10
	asrs r1, r1, #8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r2]
	cmp r7, #0
	beq _08149CDC
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	b _08149D00
	.align 2, 0
_08149CD8: .4byte 0x0203A86C
_08149CDC:
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #1
	movs r2, #1
	bl sub_0814A2E8
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r1, r8
	lsls r0, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r4, r0, #0x10
	mov r8, r4
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08149C60
_08149D00:
	ldr r0, _08149D1C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08149D1C: .4byte 0x0203A86C
	thumb_func_end Phase2_Shards_Func3

	thumb_func_start Phase2_Shards_Func4
Phase2_Shards_Func4: @ 0x08149D20
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08149D6C
	ldr r1, _08149D5C
	ldrh r2, [r1, #0xa]
	ldr r0, _08149D60
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _08149D64
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	bl sub_0814A044
	ldr r0, _08149D68
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	b _08149D84
	.align 2, 0
_08149D5C: .4byte 0x040000B0
_08149D60: .4byte 0x0000C5FF
_08149D64: .4byte 0x00007FFF
_08149D68: .4byte 0x08149B2D
_08149D6C:
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	ldr r1, _08149D88
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0xe]
	movs r0, #1
_08149D84:
	pop {r1}
	bx r1
	.align 2, 0
_08149D88: .4byte 0x085A88C6
	thumb_func_end Phase2_Shards_Func4

	thumb_func_start Phase2_Shards_Func5
Phase2_Shards_Func5: @ 0x08149D8C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0xe]
	subs r0, #1
	strh r0, [r1, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08149DA0
	movs r0, #0
	b _08149DA4
_08149DA0:
	movs r0, #1
	strh r0, [r1, #8]
_08149DA4:
	pop {r1}
	bx r1
	thumb_func_end Phase2_Shards_Func5

	thumb_func_start VBlankCB_Phase2_Shards
VBlankCB_Phase2_Shards: @ 0x08149DA8
	push {r4, lr}
	ldr r4, _08149E14
	ldrh r1, [r4, #0xa]
	ldr r0, _08149E18
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _08149E1C
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl VBlankCB_BattleTransition
	ldr r3, _08149E20
	ldr r0, [r3]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08149DE0
	ldr r1, _08149E24
	ldr r0, _08149E28
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _08149E2C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08149DE0:
	ldr r2, _08149E30
	ldr r1, [r3]
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	subs r2, #6
	ldrh r0, [r1, #8]
	strh r0, [r2]
	subs r2, #4
	ldr r0, _08149E28
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	str r0, [r4]
	str r2, [r4, #4]
	ldr r0, _08149E34
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149E14: .4byte 0x040000B0
_08149E18: .4byte 0x0000C5FF
_08149E1C: .4byte 0x00007FFF
_08149E20: .4byte 0x0203A86C
_08149E24: .4byte 0x040000D4
_08149E28: .4byte 0x020388C8
_08149E2C: .4byte 0x800000A0
_08149E30: .4byte 0x04000048
_08149E34: .4byte 0xA2400001
	thumb_func_end VBlankCB_Phase2_Shards

	thumb_func_start CreatePhase1Task
CreatePhase1Task: @ 0x08149E38
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
	ldr r0, _08149E94
	movs r1, #3
	str r3, [sp]
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08149E98
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
_08149E94: .4byte 0x08149EBD
_08149E98: .4byte 0x03005B60
	thumb_func_end CreatePhase1Task

	thumb_func_start IsPhase1Done
IsPhase1Done: @ 0x08149E9C
	push {lr}
	ldr r0, _08149EB0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08149EB4
	movs r0, #0
	b _08149EB6
	.align 2, 0
_08149EB0: .4byte 0x08149EBD
_08149EB4:
	movs r0, #1
_08149EB6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPhase1Done

	thumb_func_start Phase2Task_Magma
Phase2Task_Magma: @ 0x08149EBC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08149EEC
	ldr r2, _08149EF0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_08149ECE:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08149ECE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149EEC: .4byte 0x085A88D4
_08149EF0: .4byte 0x03005B60
	thumb_func_end Phase2Task_Magma

	thumb_func_start Phase1_TransitionAll_Func1
Phase1_TransitionAll_Func1: @ 0x08149EF4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08149F0C
	subs r0, r1, #1
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08149F30
_08149F0C:
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x10]
	ldrh r1, [r4, #0x16]
	adds r0, r0, r1
	strh r0, [r4, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08149F24
	movs r0, #0x10
	strh r0, [r4, #0x16]
_08149F24:
	movs r0, #1
	rsbs r0, r0, #0
	ldrb r1, [r4, #0x16]
	ldr r2, _08149F4C
	bl BlendPalettes
_08149F30:
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	ble _08149F42
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0x14]
_08149F42:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149F4C: .4byte 0x00002D6B
	thumb_func_end Phase1_TransitionAll_Func1

	thumb_func_start Phase1_TransitionAll_Func2
Phase1_TransitionAll_Func2: @ 0x08149F50
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08149F68
	subs r0, r1, #1
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08149F8A
_08149F68:
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x16]
	ldrh r1, [r4, #0x12]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08149F7E
	movs r0, #0
	strh r0, [r4, #0x16]
_08149F7E:
	movs r0, #1
	rsbs r0, r0, #0
	ldrb r1, [r4, #0x16]
	ldr r2, _08149FB0
	bl BlendPalettes
_08149F8A:
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _08149FBE
	ldrh r0, [r4, #0xe]
	subs r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08149FB8
	ldr r0, _08149FB4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	b _08149FBE
	.align 2, 0
_08149FB0: .4byte 0x00002D6B
_08149FB4: .4byte 0x08149EBD
_08149FB8:
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x14]
	strh r1, [r4, #8]
_08149FBE:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Phase1_TransitionAll_Func2

	thumb_func_start sub_08149FC8
sub_08149FC8: @ 0x08149FC8
	push {r4, lr}
	ldr r4, _08149FE8
	ldr r0, [r4]
	movs r1, #0
	movs r2, #0x3c
	bl memset
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x14
	adds r1, #0x16
	bl sub_0808956C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149FE8: .4byte 0x0203A86C
	thumb_func_end sub_08149FC8

	thumb_func_start VBlankCB_BattleTransition
VBlankCB_BattleTransition: @ 0x08149FEC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_BattleTransition

	thumb_func_start sub_0814A000
sub_0814A000: @ 0x0814A000
	ldr r1, _0814A014
	ldrh r1, [r1]
	lsrs r1, r1, #2
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x10
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0814A014: .4byte 0x04000008
	thumb_func_end sub_0814A000

	thumb_func_start sub_0814A018
sub_0814A018: @ 0x0814A018
	push {r4, lr}
	ldr r3, _0814A040
	ldrh r2, [r3]
	lsrs r2, r2, #8
	ldrh r3, [r3]
	lsrs r3, r3, #2
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x10
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r2, r2, r4
	str r2, [r0]
	adds r3, r3, r4
	str r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A040: .4byte 0x04000008
	thumb_func_end sub_0814A018

	thumb_func_start sub_0814A044
sub_0814A044: @ 0x0814A044
	push {lr}
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0814A044

	thumb_func_start sub_0814A058
sub_0814A058: @ 0x0814A058
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r0, [sp, #0x20]
	ldr r4, [sp, #0x24]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r4, r4, #0x10
	movs r6, #0
	lsrs r5, r4, #0x10
	cmp r4, #0
	ble _0814A0C0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	mov r8, r1
	lsls r0, r3, #0x10
	asrs r7, r0, #0x10
_0814A090:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	movs r0, #0xff
	ands r0, r4
	mov r2, r8
	asrs r1, r2, #0x10
	bl Sin
	lsls r1, r6, #1
	add r1, sl
	add r0, sb
	strh r0, [r1]
	lsls r1, r5, #0x10
	ldr r0, _0814A0D0
	adds r1, r1, r0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, r4, r7
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	lsrs r5, r1, #0x10
	cmp r1, #0
	bgt _0814A090
_0814A0C0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A0D0: .4byte 0xFFFF0000
	thumb_func_end sub_0814A058

	thumb_func_start sub_0814A0D4
sub_0814A0D4: @ 0x0814A0D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r5, r2, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xa
	bl memset
	movs r1, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #8]
_0814A10C:
	lsls r5, r1, #0x10
	asrs r0, r5, #0x10
	mov sl, r0
	ldr r1, [sp, #4]
	bl Sin
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sl
	ldr r1, [sp, #4]
	bl Cos
	ldr r2, [sp]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r2, r1, r4
	lsls r2, r2, #0x10
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	subs r1, r3, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsrs r1, r2, #0x10
	str r5, [sp, #0x10]
	cmp r2, #0
	bge _0814A158
	movs r1, #0
_0814A158:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0814A162
	movs r6, #0xf0
_0814A162:
	lsls r0, r7, #0x10
	cmp r0, #0
	bge _0814A16A
	movs r7, #0
_0814A16A:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0814A178
	movs r3, #0x9f
	mov r8, r3
_0814A178:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x10
	orrs r6, r0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r0, #1
	add r0, sb
	strh r6, [r0]
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r0, r4, #0xf
	add r0, sb
	strh r6, [r0]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [sp, #4]
	bl Cos
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #8]
	subs r1, r2, r0
	lsls r1, r1, #0x10
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r3, r1, #0x10
	cmp r1, #0
	bge _0814A1BA
	movs r3, #0
_0814A1BA:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0814A1C4
	movs r2, #0x9f
_0814A1C4:
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	adds r3, r0, #0
	lsls r5, r2, #0x10
	ldr r0, [sp, #0xc]
	cmp r0, r1
	ble _0814A1E8
	adds r2, r1, #0
_0814A1D4:
	lsls r1, r7, #0x10
	ldr r0, _0814A268
	adds r1, r1, r0
	asrs r0, r1, #0xf
	add r0, sb
	strh r6, [r0]
	lsrs r7, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r2
	bgt _0814A1D4
_0814A1E8:
	lsls r1, r7, #0x10
	asrs r0, r3, #0x10
	cmp r1, r3
	bge _0814A206
	adds r2, r0, #0
_0814A1F2:
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r1, r3
	asrs r1, r0, #0xf
	add r1, sb
	strh r6, [r1]
	adds r1, r0, #0
	asrs r0, r1, #0x10
	cmp r0, r2
	blt _0814A1F2
_0814A206:
	asrs r0, r5, #0x10
	cmp r4, r5
	ble _0814A224
	adds r1, r0, #0
_0814A20E:
	ldr r2, _0814A268
	adds r0, r4, r2
	lsrs r3, r0, #0x10
	mov r8, r3
	asrs r0, r0, #0xf
	add r0, sb
	strh r6, [r0]
	lsls r4, r3, #0x10
	asrs r0, r4, #0x10
	cmp r0, r1
	bgt _0814A20E
_0814A224:
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r0, r5, #0x10
	cmp r4, r5
	bge _0814A244
	adds r2, r0, #0
_0814A230:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	asrs r1, r0, #0xf
	add r1, sb
	strh r6, [r1]
	adds r4, r0, #0
	asrs r0, r4, #0x10
	cmp r0, r2
	blt _0814A230
_0814A244:
	ldr r2, [sp, #0x10]
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r2, r3
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	bgt _0814A256
	b _0814A10C
_0814A256:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A268: .4byte 0xFFFF0000
	thumb_func_end sub_0814A0D4

	thumb_func_start sub_0814A26C
sub_0814A26C: @ 0x0814A26C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [sp, #0x14]
	ldr r5, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strh r1, [r6]
	strh r2, [r6, #2]
	strh r1, [r6, #4]
	strh r2, [r6, #6]
	strh r3, [r6, #8]
	strh r7, [r6, #0xa]
	strh r5, [r6, #0xc]
	strh r4, [r6, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r3, r3, r1
	strh r3, [r6, #0x10]
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _0814A2BE
	rsbs r0, r3, #0
	strh r0, [r6, #0x10]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r6, #0xc]
_0814A2BE:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	subs r1, r0, r1
	strh r1, [r6, #0x12]
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0814A2DC
	rsbs r0, r1, #0
	strh r0, [r6, #0x12]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r6, #0xe]
_0814A2DC:
	movs r0, #0
	strh r0, [r6, #0x14]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0814A26C

	thumb_func_start sub_0814A2E8
sub_0814A2E8: @ 0x0814A2E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	ldrh r0, [r3, #0x10]
	mov r8, r0
	movs r1, #0x10
	ldrsh r6, [r3, r1]
	ldrh r2, [r3, #0x12]
	mov ip, r2
	movs r4, #0x12
	ldrsh r5, [r3, r4]
	cmp r6, r5
	ble _0814A338
	ldrh r0, [r3, #0xc]
	ldrh r2, [r3, #4]
	adds r1, r0, r2
	strh r1, [r3, #4]
	ldrh r2, [r3, #0x14]
	add r2, ip
	strh r2, [r3, #0x14]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r4, r0, #0
	ldrh r7, [r3, #0xe]
	cmp r1, r6
	ble _0814A35E
	ldrh r1, [r3, #6]
	adds r0, r7, r1
	strh r0, [r3, #6]
	mov r1, r8
	b _0814A35A
_0814A338:
	ldrh r0, [r3, #0xe]
	ldrh r2, [r3, #6]
	adds r1, r0, r2
	strh r1, [r3, #6]
	ldrh r2, [r3, #0x14]
	add r2, r8
	strh r2, [r3, #0x14]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldrh r4, [r3, #0xc]
	adds r7, r0, #0
	cmp r1, r5
	ble _0814A35E
	ldrh r1, [r3, #4]
	adds r0, r4, r1
	strh r0, [r3, #4]
	mov r1, ip
_0814A35A:
	subs r0, r2, r1
	strh r0, [r3, #0x14]
_0814A35E:
	movs r5, #0
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	ble _0814A376
	movs r4, #4
	ldrsh r1, [r3, r4]
	movs r4, #8
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, #8]
	cmp r1, r0
	bge _0814A388
_0814A376:
	cmp r2, #0
	bge _0814A396
	movs r0, #4
	ldrsh r1, [r3, r0]
	movs r2, #8
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, #8]
	cmp r1, r0
	bgt _0814A396
_0814A388:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, sb
	cmp r0, #0
	beq _0814A396
	strh r4, [r3, #4]
_0814A396:
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	ble _0814A3AC
	movs r4, #6
	ldrsh r1, [r3, r4]
	movs r4, #0xa
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, #0xa]
	cmp r1, r0
	bge _0814A3BE
_0814A3AC:
	cmp r2, #0
	bge _0814A3CC
	movs r0, #6
	ldrsh r1, [r3, r0]
	movs r2, #0xa
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, #0xa]
	cmp r1, r0
	bgt _0814A3CC
_0814A3BE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, sl
	cmp r0, #0
	beq _0814A3CC
	strh r4, [r3, #6]
_0814A3CC:
	cmp r5, #2
	beq _0814A3D4
	movs r0, #0
	b _0814A3D6
_0814A3D4:
	movs r0, #1
_0814A3D6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0814A2E8

	thumb_func_start Phase2_29_Func1
Phase2_29_Func1: @ 0x0814A3E4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_0814675C
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r2, _0814A428
	mov r0, sp
	bl CpuSet
	ldr r0, _0814A42C
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _0814A430
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A428: .4byte 0x01000400
_0814A42C: .4byte 0x085A76B0
_0814A430: .4byte 0x085A7690
	thumb_func_end Phase2_29_Func1

	thumb_func_start Phase2_29_Func2
Phase2_29_Func2: @ 0x0814A434
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldr r0, _0814A474
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _0814A478
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	str r1, [sp]
	movs r1, #0xa0
	str r1, [sp, #4]
	movs r1, #0
	movs r3, #0x84
	bl sub_0814A058
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A474: .4byte 0x085A7D3C
_0814A478: .4byte 0x020388C8
	thumb_func_end Phase2_29_Func2

	thumb_func_start Phase2Task_Swirl
Phase2Task_Swirl: @ 0x0814A47C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0814A4AC
	ldr r2, _0814A4B0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814A48E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814A48E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A4AC: .4byte 0x085A9480
_0814A4B0: .4byte 0x03005B60
	thumb_func_end Phase2Task_Swirl

	thumb_func_start Phase2Task_Wave
Phase2Task_Wave: @ 0x0814A4B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0814A4E4
	ldr r2, _0814A4E8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814A4C6:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814A4C6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A4E4: .4byte 0x085A9498
_0814A4E8: .4byte 0x03005B60
	thumb_func_end Phase2Task_Wave

	thumb_func_start Phase2_30_Func1
Phase2_30_Func1: @ 0x0814A4EC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_08149FC8
	bl ScanlineEffect_Clear
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl ClearGpuRegBits
	movs r5, #0
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r4, #0xc]
	ldr r0, _0814A574
	strh r0, [r4, #0xa]
	strh r5, [r4, #0x12]
	movs r0, #0x10
	strh r0, [r4, #0x14]
	movs r0, #0xa0
	lsls r0, r0, #4
	strh r0, [r4, #0x16]
	ldr r6, _0814A578
	ldr r2, [r6]
	ldr r3, _0814A57C
	strh r3, [r2, #0xe]
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #8
	ldrh r1, [r4, #0x12]
	orrs r0, r1
	strh r0, [r2, #0x10]
	ldr r0, _0814A580
	strh r3, [r0]
	ldr r1, _0814A584
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	add r0, sp, #4
	add r1, sp, #8
	bl sub_0814A018
	mov r0, sp
	strh r5, [r0]
	ldr r1, [sp, #4]
	ldr r2, _0814A588
	bl CpuSet
	ldr r0, _0814A58C
	ldr r1, [sp, #8]
	bl LZ77UnCompVram
	ldr r0, _0814A590
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, [r6]
	strh r5, [r0, #0x16]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814A574: .4byte 0x00007FFF
_0814A578: .4byte 0x0203A86C
_0814A57C: .4byte 0x00003F41
_0814A580: .4byte 0x04000050
_0814A584: .4byte 0x04000052
_0814A588: .4byte 0x01000400
_0814A58C: .4byte 0x085A76B0
_0814A590: .4byte 0x085A7690
	thumb_func_end Phase2_30_Func1

	thumb_func_start Phase2_30_Func2
Phase2_30_Func2: @ 0x0814A594
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r1, sp, #4
	mov r0, sp
	bl sub_0814A018
	ldr r0, _0814A5BC
	ldr r1, [sp]
	bl LZ77UnCompVram
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A5BC: .4byte 0x085A7D3C
	thumb_func_end Phase2_30_Func2

	thumb_func_start Phase2_30_Func3
Phase2_30_Func3: @ 0x0814A5C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r2, #0
	ldr r6, _0814A600
	ldr r4, _0814A604
	ldr r3, _0814A608
_0814A5CC:
	lsls r1, r2, #1
	adds r1, r1, r4
	ldr r0, [r3]
	ldrh r0, [r0, #0x16]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9f
	bls _0814A5CC
	adds r0, r6, #0
	bl SetVBlankCallback
	ldr r0, _0814A60C
	bl SetHBlankCallback
	movs r0, #2
	bl EnableInterrupts
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814A600: .4byte 0x0814A745
_0814A604: .4byte 0x02039048
_0814A608: .4byte 0x0203A86C
_0814A60C: .4byte 0x0814A78D
	thumb_func_end Phase2_30_Func3

	thumb_func_start Phase2_30_Func4
Phase2_30_Func4: @ 0x0814A610
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0814A658
	ldr r0, [r1]
	ldrb r2, [r0]
	movs r3, #0
	strb r3, [r0]
	ldrh r2, [r4, #0xc]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r6, [r4, #0xa]
	movs r0, #0xc0
	lsls r0, r0, #1
	mov r8, r0
	ldrh r0, [r4, #0x16]
	subs r0, r6, r0
	strh r0, [r4, #0xa]
	movs r5, #0xe
	ldrsh r0, [r4, r5]
	adds r5, r1, #0
	cmp r0, #0x45
	ble _0814A662
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldr r1, _0814A65C
	adds r0, r0, r1
	cmp r0, #0
	blt _0814A660
	adds r0, r2, r1
	strh r0, [r4, #0xc]
	b _0814A662
	.align 2, 0
_0814A658: .4byte 0x0203A86C
_0814A65C: .4byte 0xFFFFFE80
_0814A660:
	strh r3, [r4, #0xc]
_0814A662:
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _0814A6A0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0814A6A0
	ldrh r1, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0xf
	bgt _0814A686
	adds r0, r1, #1
	strh r0, [r4, #0x12]
	b _0814A694
_0814A686:
	ldrh r1, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _0814A694
	subs r0, r1, #1
	strh r0, [r4, #0x14]
_0814A694:
	ldr r0, [r5]
	ldrh r1, [r4, #0x14]
	lsls r1, r1, #8
	ldrh r2, [r4, #0x12]
	orrs r1, r2
	strh r1, [r0, #0x10]
_0814A6A0:
	movs r5, #0
	lsls r7, r7, #0x10
_0814A6A4:
	lsrs r0, r6, #8
	asrs r1, r7, #0x10
	bl Sin
	ldr r1, _0814A734
	lsls r2, r5, #1
	adds r2, r2, r1
	ldr r1, _0814A738
	ldr r1, [r1]
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r1, r8
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r5, #0x9f
	bls _0814A6A4
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x65
	bne _0814A6F2
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0814A6F2:
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0814A714
	ldr r0, _0814A73C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0814A714
	ldr r0, _0814A740
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0814A714:
	ldrh r0, [r4, #0x16]
	subs r0, #0x11
	strh r0, [r4, #0x16]
	ldr r0, _0814A738
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A734: .4byte 0x020388C8
_0814A738: .4byte 0x0203A86C
_0814A73C: .4byte 0x02037C74
_0814A740: .4byte 0x0814A4B5
	thumb_func_end Phase2_30_Func4

	thumb_func_start VBlankCB_Phase2_30
VBlankCB_Phase2_30: @ 0x0814A744
	push {lr}
	bl VBlankCB_BattleTransition
	ldr r2, _0814A778
	ldr r0, _0814A77C
	ldr r1, [r0]
	ldrh r0, [r1, #0xe]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0x10]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0814A774
	ldr r1, _0814A780
	ldr r0, _0814A784
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _0814A788
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0814A774:
	pop {r0}
	bx r0
	.align 2, 0
_0814A778: .4byte 0x04000050
_0814A77C: .4byte 0x0203A86C
_0814A780: .4byte 0x040000D4
_0814A784: .4byte 0x020388C8
_0814A788: .4byte 0x800000A0
	thumb_func_end VBlankCB_Phase2_30

	thumb_func_start HBlankCB_Phase2_30
HBlankCB_Phase2_30: @ 0x0814A78C
	ldr r1, _0814A7A4
	ldr r0, _0814A7A8
	ldrh r0, [r0]
	lsls r0, r0, #1
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _0814A7AC
	strh r1, [r0]
	bx lr
	.align 2, 0
_0814A7A4: .4byte 0x020388C8
_0814A7A8: .4byte 0x04000006
_0814A7AC: .4byte 0x04000012
	thumb_func_end HBlankCB_Phase2_30

	thumb_func_start Phase2Task_WhiteFade
Phase2Task_WhiteFade: @ 0x0814A7B0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0814A7E0
	ldr r2, _0814A7E4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814A7C2:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814A7C2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A7E0: .4byte 0x085A94A8
_0814A7E4: .4byte 0x03005B60
	thumb_func_end Phase2Task_WhiteFade

	thumb_func_start Task_BattleTransitionMain
Task_BattleTransitionMain: @ 0x0814A7E8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0814A818
	ldr r2, _0814A81C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814A7FA:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814A7FA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A818: .4byte 0x085A94B8
_0814A81C: .4byte 0x03005B60
	thumb_func_end Task_BattleTransitionMain

	thumb_func_start TransitionPhase1_Task_RunFuncs
TransitionPhase1_Task_RunFuncs: @ 0x0814A820
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0814A850
	ldr r2, _0814A854
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0814A832:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0814A832
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A850: .4byte 0x085A94CC
_0814A854: .4byte 0x03005B60
	thumb_func_end TransitionPhase1_Task_RunFuncs

	thumb_func_start Phase2_31_Func1
Phase2_31_Func1: @ 0x0814A858
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	mov r8, r0
	add r1, sp, #0x10
	add r0, sp, #0xc
	bl sub_0814A018
	ldr r0, _0814A8E0
	ldr r1, [sp, #0x10]
	bl LZ77UnCompVram
	movs r4, #0x20
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r6, #1
	str r6, [sp]
	str r4, [sp, #4]
	movs r5, #0xf
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x1d
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _0814A8E4
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	mov r1, r8
	strh r6, [r1, #0xc]
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x10]
	movs r0, #0xa
	strh r0, [r1, #0x16]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814A8E0: .4byte 0x085A8048
_0814A8E4: .4byte 0x085A8028
	thumb_func_end Phase2_31_Func1

	thumb_func_start Phase2_31_Func2
Phase2_31_Func2: @ 0x0814A8E8
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	ldr r1, _0814A954
	movs r2, #4
	str r2, [sp]
	str r2, [sp, #4]
	ldrb r0, [r4, #0xc]
	str r0, [sp, #8]
	ldrb r0, [r4, #0xe]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #0xf
	str r0, [sp, #0x18]
	movs r5, #0
	str r5, [sp, #0x1c]
	str r5, [sp, #0x20]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrh r0, [r4, #0xc]
	adds r0, #4
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bne _0814A94A
	movs r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, #4
	strh r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _0814A94A
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0814A94A:
	movs r0, #0
	add sp, #0x24
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0814A954: .4byte 0x085A83D8
	thumb_func_end Phase2_31_Func2

	thumb_func_start Phase2_31_Func3
Phase2_31_Func3: @ 0x0814A958
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldrh r0, [r4, #0x14]
	adds r1, r0, #1
	strh r1, [r4, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0814AA16
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0814A9BC
	cmp r0, #1
	bgt _0814A98A
	cmp r0, #0
	beq _0814A994
	b _0814A9EC
_0814A98A:
	cmp r0, #2
	beq _0814A9D4
	cmp r0, #3
	beq _0814A9DC
	b _0814A9EC
_0814A994:
	movs r2, #0xfa
	ldr r6, _0814A9B4
	movs r3, #0
	ldr r5, _0814A9B8
_0814A99C:
	lsls r1, r2, #1
	adds r0, r1, r6
	strh r3, [r0]
	adds r1, r1, r5
	strh r3, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xfe
	bls _0814A99C
	b _0814AA0C
	.align 2, 0
_0814A9B4: .4byte 0x020373B4
_0814A9B8: .4byte 0x020377B4
_0814A9BC:
	ldr r0, _0814A9CC
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _0814A9D0
	b _0814A9DE
	.align 2, 0
_0814A9CC: .4byte 0xFFFF7FFF
_0814A9D0: .4byte 0x085A81A4
_0814A9D4:
	ldr r0, _0814A9D8
	b _0814A9DE
	.align 2, 0
_0814A9D8: .4byte 0x085A82A4
_0814A9DC:
	ldr r0, _0814A9E8
_0814A9DE:
	ldr r1, [sp, #0xc]
	bl LZ77UnCompVram
	b _0814AA0C
	.align 2, 0
_0814A9E8: .4byte 0x085A8354
_0814A9EC:
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0814AA16
_0814AA0C:
	movs r0, #0
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
_0814AA16:
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end Phase2_31_Func3

	thumb_func_start Phase2_33_Func1
Phase2_33_Func1: @ 0x0814AA20
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	mov r8, r0
	add r1, sp, #0x10
	add r0, sp, #0xc
	bl sub_0814A018
	ldr r0, _0814AABC
	ldr r1, [sp, #0x10]
	bl LZ77UnCompVram
	movs r4, #0x20
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r6, #1
	str r6, [sp]
	str r4, [sp, #4]
	movs r5, #0xf
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x1d
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r4, _0814AAC0
	adds r0, r4, #0
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0xe0
	movs r1, #0x10
	movs r2, #8
	movs r3, #0
	bl BlendPalette
	movs r1, #0
	movs r0, #0x22
	mov r2, r8
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	movs r0, #0
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814AABC: .4byte 0x085A8048
_0814AAC0: .4byte 0x085A8028
	thumb_func_end Phase2_33_Func1

	thumb_func_start Phase2_33_Func2
Phase2_33_Func2: @ 0x0814AAC4
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r1, _0814AB3C
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #7
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #7
	bl __udivsi3
	ldr r1, _0814AB40
	movs r2, #4
	str r2, [sp]
	str r2, [sp, #4]
	lsls r4, r4, #2
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #0xf
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	movs r2, #0
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrh r0, [r6, #0xc]
	subs r0, #1
	strh r0, [r6, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0814AB30
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
_0814AB30:
	movs r0, #0
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814AB3C: .4byte 0x085A94E0
_0814AB40: .4byte 0x085A83D8
	thumb_func_end Phase2_33_Func2

	thumb_func_start Phase2_33_Func3
Phase2_33_Func3: @ 0x0814AB44
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe0
	movs r1, #0x10
	movs r2, #3
	movs r3, #0
	bl BlendPalette
	ldr r0, _0814AB74
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	movs r0, #0
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814AB74: .4byte 0xFFFF3FFF
	thumb_func_end Phase2_33_Func3

	thumb_func_start Phase2_33_Func4
Phase2_33_Func4: @ 0x0814AB78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	adds r7, r0, #0
	ldrh r0, [r7, #0xe]
	movs r1, #1
	eors r0, r1
	movs r6, #0
	strh r0, [r7, #0xe]
	cmp r0, #0
	beq _0814ABEC
	ldr r0, _0814ABE4
	mov r8, r0
	movs r4, #4
	str r4, [sp]
	str r4, [sp, #4]
	ldr r5, _0814ABE8
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r2, #0xc
	ldrsh r0, [r7, r2]
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0xe
	str r0, [sp, #0x18]
	str r6, [sp, #0x1c]
	str r6, [sp, #0x20]
	movs r0, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
	b _0814AC38
	.align 2, 0
_0814ABE4: .4byte 0x085A83D8
_0814ABE8: .4byte 0x085A94E0
_0814ABEC:
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #0
	ble _0814AC32
	ldr r1, _0814AC5C
	subs r0, #1
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #7
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #7
	bl __udivsi3
	adds r3, r0, #0
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x18
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	bl FillBgTilemapBufferRect
_0814AC32:
	ldrh r0, [r7, #0xc]
	adds r0, #1
	strh r0, [r7, #0xc]
_0814AC38:
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #0x22
	ble _0814AC46
	ldrh r0, [r7, #8]
	adds r0, #1
	strh r0, [r7, #8]
_0814AC46:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814AC5C: .4byte 0x085A94E0
	thumb_func_end Phase2_33_Func4

	thumb_func_start Phase2_31_33_Func5
Phase2_31_33_Func5: @ 0x0814AC60
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Phase2_31_33_Func5

	thumb_func_start sub_0814ACA4
sub_0814ACA4: @ 0x0814ACA4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0814ACEC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r6, r1, r2
	ldrh r0, [r6, #0xc]
	movs r1, #1
	eors r0, r1
	strh r0, [r6, #0xc]
	cmp r0, #0
	bne _0814ACE4
	ldr r5, _0814ACF0
	ldrh r1, [r5]
	movs r0, #0x12
	bl SetGpuReg
	ldr r4, _0814ACF4
	ldrh r1, [r4]
	movs r0, #0x10
	bl SetGpuReg
	ldrh r0, [r6, #8]
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	ldrh r0, [r6, #0xa]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
_0814ACE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814ACEC: .4byte 0x03005B60
_0814ACF0: .4byte 0x02022AC8
_0814ACF4: .4byte 0x02022ACA
	thumb_func_end sub_0814ACA4

	thumb_func_start Phase2_32_Func1
Phase2_32_Func1: @ 0x0814ACF8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r5, #0
	add r1, sp, #0xc
	add r0, sp, #8
	bl sub_0814A018
	ldr r0, _0814AD74
	ldr r1, [sp, #0xc]
	bl LZ77UnCompVram
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _0814AD78
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0814AD7C
	strh r5, [r0]
	ldr r4, _0814AD80
	strh r5, [r4]
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x10
	bl SetGpuReg
	strh r5, [r6, #0xc]
	ldr r0, _0814AD84
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r1, r1, #0x10
	cmp r1, #1
	beq _0814ADA4
	cmp r1, #1
	bgt _0814AD88
	cmp r1, #0
	beq _0814AD8E
	b _0814ADDC
	.align 2, 0
_0814AD74: .4byte 0x085A8048
_0814AD78: .4byte 0x085A8028
_0814AD7C: .4byte 0x02022AC8
_0814AD80: .4byte 0x02022ACA
_0814AD84: .4byte 0x0814ACA5
_0814AD88:
	cmp r1, #2
	beq _0814ADC0
	b _0814ADDC
_0814AD8E:
	ldr r0, _0814ADA0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	b _0814ADEE
	.align 2, 0
_0814ADA0: .4byte 0x03005B60
_0814ADA4:
	ldr r1, _0814ADB8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0814ADBC
	strh r1, [r0, #8]
	movs r1, #1
	rsbs r1, r1, #0
	b _0814ADEC
	.align 2, 0
_0814ADB8: .4byte 0x03005B60
_0814ADBC: .4byte 0x0000FFFF
_0814ADC0:
	ldr r1, _0814ADD4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #8]
	ldr r1, _0814ADD8
	b _0814ADEC
	.align 2, 0
_0814ADD4: .4byte 0x03005B60
_0814ADD8: .4byte 0x0000FFFF
_0814ADDC:
	ldr r1, _0814AE00
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0814AE04
	strh r1, [r0, #8]
	movs r1, #1
_0814ADEC:
	strh r1, [r0, #0xa]
_0814ADEE:
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814AE00: .4byte 0x03005B60
_0814AE04: .4byte 0x0000FFFF
	thumb_func_end Phase2_32_Func1

	thumb_func_start Phase2_32_Func2
Phase2_32_Func2: @ 0x0814AE08
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	ldr r1, _0814AE6C
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r3, [r0]
	lsrs r2, r3, #3
	movs r0, #7
	ands r3, r0
	ldr r1, _0814AE70
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	lsls r2, r2, #2
	adds r2, #1
	str r2, [sp, #8]
	lsls r3, r3, #2
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xf
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	movs r2, #0
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _0814AE60
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0814AE60:
	movs r0, #0
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814AE6C: .4byte 0x085A9503
_0814AE70: .4byte 0x085A83D8
	thumb_func_end Phase2_32_Func2

	thumb_func_start Phase2_32_Func3
Phase2_32_Func3: @ 0x0814AE74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0814AE94
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814AE94: .4byte 0xFFFF7FFF
	thumb_func_end Phase2_32_Func3

	thumb_func_start Phase2_32_Func4
Phase2_32_Func4: @ 0x0814AE98
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _0814AEF8
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r3, [r0]
	lsrs r2, r3, #3
	movs r0, #7
	ands r3, r0
	lsls r2, r2, #2
	adds r2, #1
	lsls r3, r3, #2
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	bl FillBgTilemapBufferRect
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _0814AEEE
	ldr r0, _0814AEFC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0814AEEE:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814AEF8: .4byte 0x085A9503
_0814AEFC: .4byte 0x0814ACA5
	thumb_func_end Phase2_32_Func4

	thumb_func_start Phase2_32_Func5
Phase2_32_Func5: @ 0x0814AF00
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0814AF64
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0814AF68
	strh r1, [r4]
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x10
	bl SetGpuReg
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, [r5]
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0814AF64: .4byte 0x02022AC8
_0814AF68: .4byte 0x02022ACA
	thumb_func_end Phase2_32_Func5

