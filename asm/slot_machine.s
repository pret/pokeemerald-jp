.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Task_FadeToSlotMachine
Task_FadeToSlotMachine: @ 0x0812A4EC
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0812A50C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _0812A510
	cmp r1, #1
	beq _0812A528
	b _0812A540
	.align 2, 0
_0812A50C: .4byte 0x03005B60
_0812A510:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0812A540
_0812A528:
	ldr r0, _0812A548
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0812A540
	ldr r0, _0812A54C
	bl SetMainCallback2
	adds r0, r5, #0
	bl DestroyTask
_0812A540:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A548: .4byte 0x02037C74
_0812A54C: .4byte 0x0812A599
	thumb_func_end Task_FadeToSlotMachine

	thumb_func_start PlaySlotMachine
PlaySlotMachine: @ 0x0812A550
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0812A58C
	movs r0, #0x68
	bl AllocZeroed
	str r0, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	bl PlaySlotMachine_Internal
	ldr r0, _0812A590
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812A594
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812A58C: .4byte 0x0203A800
_0812A590: .4byte 0x0812A4ED
_0812A594: .4byte 0x03005B60
	thumb_func_end PlaySlotMachine

	thumb_func_start CB2_SlotMachineSetup
CB2_SlotMachineSetup: @ 0x0812A598
	push {lr}
	sub sp, #4
	ldr r0, _0812A5B4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _0812A676
	lsls r0, r0, #2
	ldr r1, _0812A5B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812A5B4: .4byte 0x03002360
_0812A5B8: .4byte 0x0812A5BC
_0812A5BC: @ jump table
	.4byte _0812A5EC @ case 0
	.4byte _0812A5F6 @ case 1
	.4byte _0812A5FC @ case 2
	.4byte _0812A606 @ case 3
	.4byte _0812A60C @ case 4
	.4byte _0812A612 @ case 5
	.4byte _0812A618 @ case 6
	.4byte _0812A61E @ case 7
	.4byte _0812A648 @ case 8
	.4byte _0812A64E @ case 9
	.4byte _0812A654 @ case 10
	.4byte _0812A670 @ case 11
_0812A5EC:
	bl SlotMachineSetup_0_0
	bl SlotMachineSetup_0_1
	b _0812A65C
_0812A5F6:
	bl SlotMachineSetup_1_0
	b _0812A65C
_0812A5FC:
	bl SlotMachineSetup_2_0
	bl SlotMachineSetup_2_1
	b _0812A65C
_0812A606:
	bl SlotMachineSetup_3_0
	b _0812A65C
_0812A60C:
	bl SlotMachineSetup_4_0
	b _0812A65C
_0812A612:
	bl SlotMachineSetup_5_0
	b _0812A65C
_0812A618:
	bl SlotMachineSetup_6_0
	b _0812A65C
_0812A61E:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	b _0812A65C
_0812A648:
	bl SlotMachineSetup_8_0
	b _0812A65C
_0812A64E:
	bl SlotMachineSetup_9_0
	b _0812A65C
_0812A654:
	bl SlotMachineSetup_10_0
	bl SlotMachineSetupGameplayTasks
_0812A65C:
	ldr r1, _0812A66C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0812A676
	.align 2, 0
_0812A66C: .4byte 0x03002360
_0812A670:
	ldr r0, _0812A67C
	bl SetMainCallback2
_0812A676:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0812A67C: .4byte 0x0812A681
	thumb_func_end CB2_SlotMachineSetup

	thumb_func_start CB2_SlotMachineLoop
CB2_SlotMachineLoop: @ 0x0812A680
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_SlotMachineLoop

	thumb_func_start SlotMachine_VBlankCallback
SlotMachine_VBlankCallback: @ 0x0812A698
	push {r4, lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r4, _0812A6E0
	ldr r0, [r4]
	adds r0, #0x58
	ldrh r1, [r0]
	movs r0, #0x40
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x48
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x4a
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A6E0: .4byte 0x0203A800
	thumb_func_end SlotMachine_VBlankCallback

	thumb_func_start PlaySlotMachine_Internal
PlaySlotMachine_Internal: @ 0x0812A6E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0812A718
	movs r1, #0xff
	bl CreateTask
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0812A71C
	adds r0, r0, r1
	strh r4, [r0, #8]
	adds r0, #0xa
	adds r1, r5, #0
	bl StoreWordInTwoHalfwords
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A718: .4byte 0x0812A75D
_0812A71C: .4byte 0x03005B60
	thumb_func_end PlaySlotMachine_Internal

	thumb_func_start sub_0812A720
sub_0812A720: @ 0x0812A720
	push {lr}
	ldr r0, _0812A750
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	ldr r0, _0812A754
	adds r2, r2, r0
	ldr r3, _0812A758
	ldr r1, [r3]
	ldrh r0, [r2, #8]
	strb r0, [r1, #1]
	adds r2, #0xa
	ldr r1, [r3]
	adds r1, #0x64
	adds r0, r2, #0
	bl LoadWordFromTwoHalfwords
	pop {r0}
	bx r0
	.align 2, 0
_0812A750: .4byte 0x0812A75D
_0812A754: .4byte 0x03005B60
_0812A758: .4byte 0x0203A800
	thumb_func_end sub_0812A720

	thumb_func_start SlotMachineDummyTask
SlotMachineDummyTask: @ 0x0812A75C
	bx lr
	.align 2, 0
	thumb_func_end SlotMachineDummyTask

	thumb_func_start SlotMachineSetup_0_0
SlotMachineSetup_0_0: @ 0x0812A760
	push {lr}
	sub sp, #4
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0812A7A0
	mov r0, sp
	bl CpuSet
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0812A7A4
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r0, _0812A7A8
	bl InitWindows
	bl DeactivateAllTextPrinters
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0812A7A0: .4byte 0x05006000
_0812A7A4: .4byte 0x085843A8
_0812A7A8: .4byte 0x085843B8
	thumb_func_end SlotMachineSetup_0_0

	thumb_func_start SlotMachineSetup_6_0
SlotMachineSetup_6_0: @ 0x0812A7AC
	push {lr}
	ldr r0, _0812A7C8
	bl SetVBlankCallback
	movs r0, #1
	bl EnableInterrupts
	movs r1, #0xc1
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0812A7C8: .4byte 0x0812A699
	thumb_func_end SlotMachineSetup_6_0

	thumb_func_start SlotMachineSetup_1_0
SlotMachineSetup_1_0: @ 0x0812A7CC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r2, #0xc0
	lsls r2, r2, #0x13
	movs r3, #0x80
	lsls r3, r3, #9
	mov r4, sp
	movs r6, #0
	ldr r1, _0812A818
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _0812A81C
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_0812A7EA:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, r2, r5
	subs r3, r3, r5
	cmp r3, r5
	bhi _0812A7EA
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	lsrs r0, r3, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A818: .4byte 0x040000D4
_0812A81C: .4byte 0x81000800
	thumb_func_end SlotMachineSetup_1_0

	thumb_func_start SlotMachineSetup_2_0
SlotMachineSetup_2_0: @ 0x0812A820
	sub sp, #4
	movs r2, #0xe0
	lsls r2, r2, #0x13
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0812A83C
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0812A840
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0812A83C: .4byte 0x040000D4
_0812A840: .4byte 0x81000200
	thumb_func_end SlotMachineSetup_2_0

	thumb_func_start SlotMachineSetup_2_1
SlotMachineSetup_2_1: @ 0x0812A844
	push {lr}
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x3f
	bl SetGpuReg
	ldr r1, _0812A8CC
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _0812A8D0
	movs r0, #0x52
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0812A8CC: .4byte 0x00001048
_0812A8D0: .4byte 0x00000809
	thumb_func_end SlotMachineSetup_2_1

	thumb_func_start SlotMachineSetup_0_1
SlotMachineSetup_0_1: @ 0x0812A8D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl sub_0812A720
	ldr r5, _0812A9B4
	ldr r0, [r5]
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r5]
	strb r4, [r0, #2]
	bl Random
	ldr r2, [r5]
	movs r1, #1
	ands r1, r0
	strb r1, [r2, #3]
	ldr r0, [r5]
	strb r4, [r0, #4]
	ldr r0, [r5]
	movs r1, #0
	strh r4, [r0, #8]
	strb r1, [r0, #0xa]
	ldr r0, [r5]
	strb r1, [r0, #0xb]
	bl GetCoins
	ldr r2, [r5]
	strh r0, [r2, #0xc]
	strh r4, [r2, #0xe]
	strh r4, [r2, #0x10]
	strh r4, [r2, #0x12]
	strh r4, [r2, #0x18]
	movs r0, #8
	strh r0, [r2, #0x1a]
	adds r1, r2, #0
	adds r1, #0x58
	movs r0, #0xf0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xa0
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x5c
	movs r1, #0x3f
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	bl GetCurrentMapMusic
	ldr r1, [r5]
	adds r1, #0x60
	strh r0, [r1]
	movs r7, #0
	ldr r0, _0812A9B8
	mov r8, r0
_0812A944:
	ldr r0, _0812A9B4
	ldr r4, [r0]
	lsls r6, r7, #1
	adds r0, r4, #0
	adds r0, #0x22
	adds r0, r0, r6
	movs r1, #0
	strh r1, [r0]
	adds r5, r4, #0
	adds r5, #0x28
	adds r5, r5, r6
	ldrb r0, [r4, #3]
	lsls r0, r0, #1
	lsls r1, r7, #2
	adds r0, r0, r1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x15
	bl __modsi3
	strh r0, [r5]
	adds r4, #0x1c
	adds r4, r4, r6
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	movs r2, #0xfc
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r2, #0
	bl __modsi3
	strh r0, [r4]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _0812A944
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AlertTVThatPlayerPlayedSlotMachine
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A9B4: .4byte 0x0203A800
_0812A9B8: .4byte 0x08584638
	thumb_func_end SlotMachineSetup_0_1

	thumb_func_start SlotMachineSetup_3_0
SlotMachineSetup_3_0: @ 0x0812A9BC
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	ldr r1, _0812A9D8
	movs r0, #0x80
	strb r0, [r1]
	bl FreeAllSpritePalettes
	bl ResetTasks
	pop {r0}
	bx r0
	.align 2, 0
_0812A9D8: .4byte 0x02021AB4
	thumb_func_end SlotMachineSetup_3_0

	thumb_func_start SlotMachineSetup_4_0
SlotMachineSetup_4_0: @ 0x0812A9DC
	push {r4, r5, lr}
	ldr r4, _0812AA30
	movs r0, #8
	bl Alloc
	str r0, [r4]
	ldr r4, _0812AA34
	movs r0, #0xe
	bl AllocZeroed
	str r0, [r4]
	ldr r5, _0812AA38
	movs r0, #8
	bl AllocZeroed
	str r0, [r5]
	ldr r1, [r4]
	ldr r2, _0812AA3C
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, [r4]
	ldr r2, _0812AA40
	adds r0, r2, #0
	strh r0, [r1, #2]
	ldr r2, _0812AA44
	adds r0, r2, #0
	strh r0, [r1, #4]
	ldr r2, _0812AA48
	adds r0, r2, #0
	strh r0, [r1, #6]
	ldr r2, _0812AA4C
	adds r0, r2, #0
	strh r0, [r1, #8]
	ldr r2, _0812AA50
	adds r0, r2, #0
	strh r0, [r1, #0xa]
	ldr r2, _0812AA54
	adds r0, r2, #0
	strh r0, [r1, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812AA30: .4byte 0x0203A798
_0812AA34: .4byte 0x0203A79C
_0812AA38: .4byte 0x0203A7A8
_0812AA3C: .4byte 0x00002051
_0812AA40: .4byte 0x00002851
_0812AA44: .4byte 0x00002061
_0812AA48: .4byte 0x00002861
_0812AA4C: .4byte 0x000020BE
_0812AA50: .4byte 0x000028BE
_0812AA54: .4byte 0x000020BF
	thumb_func_end SlotMachineSetup_4_0

	thumb_func_start SlotMachineSetup_5_0
SlotMachineSetup_5_0: @ 0x0812AA58
	push {lr}
	bl sub_0812F918
	bl sub_0812F968
	bl sub_0812F7F4
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #0xf0
	bl LoadMessageBoxGfx
	movs r1, #0x85
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	movs r0, #0
	bl PutWindowTilemap
	pop {r0}
	bx r0
	thumb_func_end SlotMachineSetup_5_0

	thumb_func_start SlotMachineSetup_10_0
SlotMachineSetup_10_0: @ 0x0812AA88
	push {lr}
	bl sub_0812E0F4
	bl sub_0812E1D8
	bl sub_0812CF04
	bl sub_0812E310
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SlotMachineSetup_10_0

	thumb_func_start SlotMachineSetupGameplayTasks
SlotMachineSetupGameplayTasks: @ 0x0812AAA0
	push {lr}
	bl GameplayTask_PikaPower
	bl GameplayTask_StopSlotReel
	bl sub_0812DEA4
	bl GameplayTasks_Slots
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SlotMachineSetupGameplayTasks

	thumb_func_start GameplayTasks_Slots
GameplayTasks_Slots: @ 0x0812AAB8
	push {r4, lr}
	ldr r4, _0812AAD4
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AAD4: .4byte 0x0812AAD9
	thumb_func_end GameplayTasks_Slots

	thumb_func_start RunSlotActions
RunSlotActions: @ 0x0812AAD8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _0812AB08
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r4, r1, #3
	ldr r5, _0812AB0C
_0812AAE8:
	ldr r0, _0812AB10
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r4, r5
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812AAE8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812AB08: .4byte 0x085843D4
_0812AB0C: .4byte 0x03005B60
_0812AB10: .4byte 0x0203A800
	thumb_func_end RunSlotActions

	thumb_func_start SlotAction_UnfadeScreen
SlotAction_UnfadeScreen: @ 0x0812AB14
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r4, _0812AB44
	ldr r0, [r4]
	ldrb r0, [r0, #2]
	bl sub_0812D3C4
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812AB44: .4byte 0x0203A800
	thumb_func_end SlotAction_UnfadeScreen

	thumb_func_start SlotAction_WaitForUnfade
SlotAction_WaitForUnfade: @ 0x0812AB48
	push {lr}
	ldr r0, _0812AB68
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0812AB60
	ldr r0, _0812AB6C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0812AB60:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812AB68: .4byte 0x02037C74
_0812AB6C: .4byte 0x0203A800
	thumb_func_end SlotAction_WaitForUnfade

	thumb_func_start SlotAction_SetSlotMachineVars
SlotAction_SetSlotMachineVars: @ 0x0812AB70
	push {lr}
	ldr r3, _0812AB9C
	ldr r1, [r3]
	movs r0, #0
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x12]
	strh r0, [r1, #0x18]
	ldrb r2, [r1, #4]
	movs r0, #0xc0
	ands r0, r2
	strb r0, [r1, #4]
	ldr r1, [r3]
	movs r0, #4
	strb r0, [r1]
	ldr r3, [r3]
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bgt _0812ABA0
	movs r0, #0x19
	strb r0, [r3]
	b _0812ABB0
	.align 2, 0
_0812AB9C: .4byte 0x0203A800
_0812ABA0:
	ldrb r0, [r3, #0xa]
	cmp r0, #0
	beq _0812ABB0
	movs r0, #3
	strb r0, [r3]
	movs r0, #4
	bl sub_0812DEF4
_0812ABB0:
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SlotAction_SetSlotMachineVars

	thumb_func_start SlotAction3
SlotAction3: @ 0x0812ABB8
	push {lr}
	bl sub_0812E064
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812ABCC
	ldr r0, _0812ABD4
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1]
_0812ABCC:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812ABD4: .4byte 0x0203A800
	thumb_func_end SlotAction3

	thumb_func_start SlotAction4
SlotAction4: @ 0x0812ABD8
	push {lr}
	movs r0, #0
	bl sub_0812DEF4
	ldr r2, _0812AC00
	ldr r1, [r2]
	movs r0, #5
	strb r0, [r1]
	ldr r2, [r2]
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldr r0, _0812AC04
	cmp r1, r0
	ble _0812ABF8
	movs r0, #0x17
	strb r0, [r2]
_0812ABF8:
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0812AC00: .4byte 0x0203A800
_0812AC04: .4byte 0x0000270E
	thumb_func_end SlotAction4

	thumb_func_start SlotAction_AwaitPlayerInput
SlotAction_AwaitPlayerInput: @ 0x0812AC08
	push {r4, r5, lr}
	ldr r0, _0812AC24
	ldrh r1, [r0, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0812AC2C
	movs r0, #0
	bl OpenInfoBox
	ldr r0, _0812AC28
	ldr r1, [r0]
	movs r0, #8
	b _0812ACF2
	.align 2, 0
_0812AC24: .4byte 0x03002360
_0812AC28: .4byte 0x0203A800
_0812AC2C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812AC92
	ldr r0, _0812AC88
	ldr r2, [r0]
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r0, #3
	movs r3, #0x12
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	cmp r0, #0
	blt _0812AC8C
	ldrh r4, [r2, #0x12]
	adds r0, r1, #0
	cmp r0, #2
	bgt _0812AC6A
_0812AC52:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl LoadBetTiles
	lsls r0, r4, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0812AC52
_0812AC6A:
	ldr r0, _0812AC88
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	subs r0, #3
	ldrh r3, [r1, #0x12]
	adds r0, r0, r3
	strh r0, [r1, #0xc]
	movs r0, #3
	strh r0, [r1, #0x12]
	movs r0, #9
	strb r0, [r1]
	movs r0, #0x5f
	bl PlaySE
	b _0812ACF4
	.align 2, 0
_0812AC88: .4byte 0x0203A800
_0812AC8C:
	movs r0, #6
	strb r0, [r2]
	b _0812ACF4
_0812AC92:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0812ACC2
	ldr r4, _0812ACFC
	ldr r0, [r4]
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0812ACC2
	movs r0, #0x5f
	bl PlaySE
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	bl LoadBetTiles
	ldr r1, [r4]
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
_0812ACC2:
	ldr r0, _0812ACFC
	ldr r3, [r0]
	movs r1, #0x12
	ldrsh r2, [r3, r1]
	ldr r4, _0812AD00
	adds r5, r0, #0
	cmp r2, #2
	bgt _0812ACE0
	cmp r2, #0
	beq _0812ACE4
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812ACE4
_0812ACE0:
	movs r0, #9
	strb r0, [r3]
_0812ACE4:
	ldrh r1, [r4, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0812ACF4
	ldr r1, [r5]
	movs r0, #0x15
_0812ACF2:
	strb r0, [r1]
_0812ACF4:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812ACFC: .4byte 0x0203A800
_0812AD00: .4byte 0x03002360
	thumb_func_end SlotAction_AwaitPlayerInput

	thumb_func_start SlotAction_PrintYouDontHaveThreeCoins
SlotAction_PrintYouDontHaveThreeCoins: @ 0x0812AD04
	push {lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _0812AD3C
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _0812AD40
	ldr r1, [r0]
	movs r0, #7
	strb r0, [r1]
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_0812AD3C: .4byte 0x08588641
_0812AD40: .4byte 0x0203A800
	thumb_func_end SlotAction_PrintYouDontHaveThreeCoins

	thumb_func_start SlotAction_ExitMessage_9999Coins
SlotAction_ExitMessage_9999Coins: @ 0x0812AD44
	push {lr}
	ldr r0, _0812AD68
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0812AD62
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	ldr r0, _0812AD6C
	ldr r1, [r0]
	movs r0, #5
	strb r0, [r1]
_0812AD62:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812AD68: .4byte 0x03002360
_0812AD6C: .4byte 0x0203A800
	thumb_func_end SlotAction_ExitMessage_9999Coins

	thumb_func_start SlotAction_GivingInformation
SlotAction_GivingInformation: @ 0x0812AD70
	push {lr}
	bl IsInfoBoxClosed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812AD84
	ldr r0, _0812AD8C
	ldr r1, [r0]
	movs r0, #5
	strb r0, [r1]
_0812AD84:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812AD8C: .4byte 0x0203A800
	thumb_func_end SlotAction_GivingInformation

	thumb_func_start SlotAction9
SlotAction9: @ 0x0812AD90
	push {r4, lr}
	adds r4, r0, #0
	bl DrawLuckyFlags
	bl sub_0812DFEC
	movs r0, #0
	bl ReelTasks_SetUnkTaskData
	movs r0, #1
	bl ReelTasks_SetUnkTaskData
	movs r0, #2
	bl ReelTasks_SetUnkTaskData
	bl sub_080EF784
	movs r0, #0
	strh r0, [r4, #8]
	ldr r4, _0812ADD0
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0812ADD4
	bl BeginReeltime
	ldr r1, [r4]
	movs r0, #0xa
	b _0812ADDE
	.align 2, 0
_0812ADD0: .4byte 0x0203A800
_0812ADD4:
	movs r0, #1
	bl sub_0812DEF4
	ldr r1, [r4]
	movs r0, #0xb
_0812ADDE:
	strb r0, [r1]
	ldr r4, _0812AE00
	ldr r0, [r4]
	movs r1, #8
	strh r1, [r0, #0x1a]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _0812ADF6
	bl SlowReelSpeed
	ldr r1, [r4]
	strh r0, [r1, #0x1a]
_0812ADF6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812AE00: .4byte 0x0203A800
	thumb_func_end SlotAction9

	thumb_func_start SlotAction10
SlotAction10: @ 0x0812AE04
	push {lr}
	bl IsFinalTask_RunReelTimeActions
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812AE28
	movs r0, #1
	bl sub_0812DEF4
	ldr r3, _0812AE30
	ldr r2, [r3]
	ldrb r1, [r2, #4]
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r2, #4]
	ldr r1, [r3]
	movs r0, #0xb
	strb r0, [r1]
_0812AE28:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812AE30: .4byte 0x0203A800
	thumb_func_end SlotAction10

	thumb_func_start SlotAction_SetLuckySpins
SlotAction_SetLuckySpins: @ 0x0812AE34
	push {lr}
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x1d
	ble _0812AE50
	bl SetLuckySpins
	ldr r0, _0812AE58
	ldr r1, [r0]
	movs r0, #0xc
	strb r0, [r1]
_0812AE50:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812AE58: .4byte 0x0203A800
	thumb_func_end SlotAction_SetLuckySpins

	thumb_func_start SlotAction_AwaitReelStop
SlotAction_AwaitReelStop: @ 0x0812AE5C
	push {r4, lr}
	ldr r0, _0812AE90
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812AE88
	movs r0, #0x18
	bl PlaySE
	ldr r4, _0812AE94
	ldr r0, [r4]
	ldrb r0, [r0, #0x18]
	bl sub_0812BEEC
	ldr r0, [r4]
	ldrb r0, [r0, #0x18]
	bl sub_0812CD50
	ldr r1, [r4]
	movs r0, #0xd
	strb r0, [r1]
_0812AE88:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812AE90: .4byte 0x03002360
_0812AE94: .4byte 0x0203A800
	thumb_func_end SlotAction_AwaitReelStop

	thumb_func_start SlotAction_WaitForAllReelsToStop
SlotAction_WaitForAllReelsToStop: @ 0x0812AE98
	push {r4, lr}
	ldr r4, _0812AEC8
	ldr r0, [r4]
	ldrb r0, [r0, #0x18]
	bl IsSlotReelMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812AECC
	ldr r1, [r4]
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
	movs r0, #0xc
	strb r0, [r1]
	ldr r1, [r4]
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	cmp r0, #2
	ble _0812AEC4
	movs r0, #0xe
	strb r0, [r1]
_0812AEC4:
	movs r0, #1
	b _0812AECE
	.align 2, 0
_0812AEC8: .4byte 0x0203A800
_0812AECC:
	movs r0, #0
_0812AECE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SlotAction_WaitForAllReelsToStop

	thumb_func_start SlotAction_CheckMatches
SlotAction_CheckMatches: @ 0x0812AED4
	push {r4, lr}
	ldr r4, _0812AF40
	ldr r2, [r4]
	ldrb r1, [r2, #4]
	movs r0, #0xc0
	ands r0, r1
	strb r0, [r2, #4]
	bl CheckMatch
	ldr r1, [r4]
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	beq _0812AEFA
	subs r0, #1
	strb r0, [r1, #0xa]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0812AEFA:
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	beq _0812AFDC
	movs r0, #0xf
	strb r0, [r1]
	bl AwardPayout
	bl sub_0812D0C0
	ldr r2, [r4]
	ldrh r0, [r2, #0x10]
	ldrh r1, [r2, #0xe]
	subs r0, r0, r1
	strh r0, [r2, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0812AF22
	movs r0, #0
	strh r0, [r2, #0x10]
_0812AF22:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812AF48
	ldr r0, _0812AF44
	bl PlayFanfare
	movs r0, #6
	bl sub_0812DEF4
	b _0812AF72
	.align 2, 0
_0812AF40: .4byte 0x0203A800
_0812AF44: .4byte 0x00000185
_0812AF48:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0812AF64
	ldr r0, _0812AF60
	bl PlayFanfare
	movs r0, #5
	bl sub_0812DEF4
	b _0812AF72
	.align 2, 0
_0812AF60: .4byte 0x00000185
_0812AF64:
	movs r0, #0xc3
	lsls r0, r0, #1
	bl PlayFanfare
	movs r0, #2
	bl sub_0812DEF4
_0812AF72:
	ldr r2, _0812AFD8
	ldr r3, [r2]
	ldrh r1, [r3, #8]
	movs r0, #0xe0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812AFB6
	ldrb r1, [r3, #4]
	movs r0, #0x3f
	ands r0, r1
	movs r4, #0
	strb r0, [r3, #4]
	ldr r3, [r2]
	ldrh r1, [r3, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812AFB6
	strb r4, [r3, #0xa]
	ldr r0, [r2]
	strb r4, [r0, #0xb]
	ldr r0, [r2]
	strb r4, [r0, #3]
	ldr r3, [r2]
	ldrh r1, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812AFB6
	movs r0, #1
	strb r0, [r3, #3]
_0812AFB6:
	ldr r3, [r2]
	ldrh r1, [r3, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0812AFFE
	ldrb r0, [r3, #2]
	cmp r0, #0xf
	bhi _0812AFFE
	adds r0, #1
	strb r0, [r3, #2]
	ldr r0, [r2]
	ldrb r0, [r0, #2]
	bl DisplayPikaPower
	b _0812AFFE
	.align 2, 0
_0812AFD8: .4byte 0x0203A800
_0812AFDC:
	movs r0, #3
	bl sub_0812DEF4
	ldr r1, [r4]
	movs r0, #0x14
	strb r0, [r1]
	ldr r1, [r4]
	ldrh r0, [r1, #0x12]
	ldrh r2, [r1, #0x10]
	adds r0, r0, r2
	strh r0, [r1, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0812B008
	cmp r0, r2
	ble _0812AFFE
	strh r2, [r1, #0x10]
_0812AFFE:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812B008: .4byte 0x0000270F
	thumb_func_end SlotAction_CheckMatches

	thumb_func_start SlotAction_WaitForPayoutToBeAwarded
SlotAction_WaitForPayoutToBeAwarded: @ 0x0812B00C
	push {lr}
	bl IsFinalTask_RunAwardPayoutActions
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812B020
	ldr r0, _0812B028
	ldr r1, [r0]
	movs r0, #0x10
	strb r0, [r1]
_0812B020:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812B028: .4byte 0x0203A800
	thumb_func_end SlotAction_WaitForPayoutToBeAwarded

	thumb_func_start SlotAction_EndOfRoll
SlotAction_EndOfRoll: @ 0x0812B02C
	push {r4, lr}
	bl sub_0812D0F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812B098
	ldr r4, _0812B0A0
	ldr r1, [r4]
	movs r0, #0x13
	strb r0, [r1]
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812B054
	movs r0, #0x1c
	bl IncrementGameStat
_0812B054:
	ldr r2, [r4]
	ldrh r1, [r2, #8]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0812B06A
	movs r0, #0
	strh r0, [r2, #0x18]
	movs r0, #9
	strb r0, [r2]
_0812B06A:
	ldr r2, [r4]
	ldrh r1, [r2, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0812B07A
	movs r0, #0x11
	strb r0, [r2]
_0812B07A:
	ldr r1, [r4]
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	beq _0812B098
	ldrh r1, [r1, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0812B098
	movs r0, #4
	bl sub_0812DEF4
	ldr r1, [r4]
	movs r0, #0x12
	strb r0, [r1]
_0812B098:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812B0A0: .4byte 0x0203A800
	thumb_func_end SlotAction_EndOfRoll

	thumb_func_start SlotAction_MatchedPower
SlotAction_MatchedPower: @ 0x0812B0A4
	push {r4, lr}
	bl sub_0812D21C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812B0DC
	ldr r4, _0812B0E4
	ldr r1, [r4]
	movs r0, #0x13
	strb r0, [r1]
	ldr r2, [r4]
	ldrh r1, [r2, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0812B0DC
	movs r0, #9
	strb r0, [r2]
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _0812B0DC
	movs r0, #4
	bl sub_0812DEF4
	ldr r1, [r4]
	movs r0, #0x12
	strb r0, [r1]
_0812B0DC:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812B0E4: .4byte 0x0203A800
	thumb_func_end SlotAction_MatchedPower

	thumb_func_start SlotAction18
SlotAction18: @ 0x0812B0E8
	push {lr}
	bl sub_0812E064
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812B10C
	ldr r2, _0812B114
	ldr r1, [r2]
	movs r0, #0x13
	strb r0, [r1]
	ldr r2, [r2]
	ldrh r1, [r2, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0812B10C
	movs r0, #9
	strb r0, [r2]
_0812B10C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812B114: .4byte 0x0203A800
	thumb_func_end SlotAction18

	thumb_func_start SlotAction_Loop
SlotAction_Loop: @ 0x0812B118
	push {lr}
	movs r0, #0
	bl sub_0812CEC8
	movs r0, #1
	bl sub_0812CEC8
	movs r0, #2
	bl sub_0812CEC8
	ldr r0, _0812B13C
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812B13C: .4byte 0x0203A800
	thumb_func_end SlotAction_Loop

	thumb_func_start SlotAction_NoMatches
SlotAction_NoMatches: @ 0x0812B140
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble _0812B15E
	movs r0, #0
	strh r0, [r1, #0xa]
	ldr r0, _0812B164
	ldr r1, [r0]
	movs r0, #0x13
	strb r0, [r1]
_0812B15E:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812B164: .4byte 0x0203A800
	thumb_func_end SlotAction_NoMatches

	thumb_func_start SlotAction_PrintQuitTheGame
SlotAction_PrintQuitTheGame: @ 0x0812B168
	push {lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _0812B1B8
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r2, #0x85
	lsls r2, r2, #2
	movs r3, #0xca
	lsls r3, r3, #1
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #0x15
	movs r1, #7
	bl CreateYesNoMenuParameterized
	ldr r0, _0812B1BC
	ldr r1, [r0]
	movs r0, #0x16
	strb r0, [r1]
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_0812B1B8: .4byte 0x08588606
_0812B1BC: .4byte 0x0203A800
	thumb_func_end SlotAction_PrintQuitTheGame

	thumb_func_start SlotAction_SeeIfPlayerQuits
SlotAction_SeeIfPlayerQuits: @ 0x0812B1C0
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _0812B1FC
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	movs r0, #0
	bl sub_0812CEC8
	movs r0, #1
	bl sub_0812CEC8
	movs r0, #2
	bl sub_0812CEC8
	ldr r0, _0812B1F8
	ldr r1, [r0]
	ldrh r0, [r1, #0x12]
	ldrh r2, [r1, #0xc]
	adds r0, r0, r2
	strh r0, [r1, #0xc]
	movs r0, #0x1b
	b _0812B216
	.align 2, 0
_0812B1F8: .4byte 0x0203A800
_0812B1FC:
	cmp r1, #1
	beq _0812B208
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0812B218
_0812B208:
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	ldr r0, _0812B220
	ldr r1, [r0]
	movs r0, #5
_0812B216:
	strb r0, [r1]
_0812B218:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812B220: .4byte 0x0203A800
	thumb_func_end SlotAction_SeeIfPlayerQuits

	thumb_func_start SlotAction_PrintMessage_9999Coins
SlotAction_PrintMessage_9999Coins: @ 0x0812B224
	push {lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _0812B25C
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _0812B260
	ldr r1, [r0]
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_0812B25C: .4byte 0x08588612
_0812B260: .4byte 0x0203A800
	thumb_func_end SlotAction_PrintMessage_9999Coins

	thumb_func_start SlotAction_ExitYouDontHaveThreeCoinsMessage
SlotAction_ExitYouDontHaveThreeCoinsMessage: @ 0x0812B264
	push {lr}
	ldr r0, _0812B288
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0812B282
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	ldr r0, _0812B28C
	ldr r1, [r0]
	movs r0, #5
	strb r0, [r1]
_0812B282:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812B288: .4byte 0x03002360
_0812B28C: .4byte 0x0203A800
	thumb_func_end SlotAction_ExitYouDontHaveThreeCoinsMessage

	thumb_func_start SlotAction_PrintMessage_NoMoreCoins
SlotAction_PrintMessage_NoMoreCoins: @ 0x0812B290
	push {lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _0812B2C8
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _0812B2CC
	ldr r1, [r0]
	movs r0, #0x1a
	strb r0, [r1]
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_0812B2C8: .4byte 0x08588627
_0812B2CC: .4byte 0x0203A800
	thumb_func_end SlotAction_PrintMessage_NoMoreCoins

	thumb_func_start SlotAction_ExitMessage_NoMoreCoins
SlotAction_ExitMessage_NoMoreCoins: @ 0x0812B2D0
	push {lr}
	ldr r0, _0812B2F4
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0812B2EE
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	ldr r0, _0812B2F8
	ldr r1, [r0]
	movs r0, #0x1b
	strb r0, [r1]
_0812B2EE:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812B2F4: .4byte 0x03002360
_0812B2F8: .4byte 0x0203A800
	thumb_func_end SlotAction_ExitMessage_NoMoreCoins

	thumb_func_start SlotAction_EndGame
SlotAction_EndGame: @ 0x0812B2FC
	push {r4, lr}
	sub sp, #4
	ldr r4, _0812B338
	ldr r0, [r4]
	ldrh r0, [r0, #0xc]
	bl SetCoins
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AlertTVOfNewCoinTotal
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812B338: .4byte 0x0203A800
	thumb_func_end SlotAction_EndGame

	thumb_func_start SlotAction_FreeDataStructures
SlotAction_FreeDataStructures: @ 0x0812B33C
	push {r4, r5, r6, lr}
	ldr r0, _0812B488
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0812B350
	b _0812B480
_0812B350:
	ldr r6, _0812B48C
	ldr r0, [r6]
	ldr r0, [r0, #0x64]
	bl SetMainCallback2
	ldr r4, _0812B490
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B494
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B498
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B49C
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4A0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4A4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4A8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4AC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4B0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4B4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4B8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4BC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4C0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4C4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4C8
	ldr r0, [r4]
	cmp r0, #0
	beq _0812B3F4
	bl Free
	str r5, [r4]
_0812B3F4:
	ldr r4, _0812B4CC
	ldr r0, [r4]
	cmp r0, #0
	beq _0812B402
	bl Free
	str r5, [r4]
_0812B402:
	ldr r4, _0812B4D0
	ldr r0, [r4]
	cmp r0, #0
	beq _0812B410
	bl Free
	str r5, [r4]
_0812B410:
	ldr r4, _0812B4D4
	ldr r0, [r4]
	cmp r0, #0
	beq _0812B41E
	bl Free
	str r5, [r4]
_0812B41E:
	ldr r4, _0812B4D8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4DC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4E0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4E4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4E8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4EC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4F0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4F4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0812B4F8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r0, [r6]
	bl Free
	str r5, [r6]
_0812B480:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812B488: .4byte 0x02037C74
_0812B48C: .4byte 0x0203A800
_0812B490: .4byte 0x0203A7C0
_0812B494: .4byte 0x0203A7C4
_0812B498: .4byte 0x0203A7C8
_0812B49C: .4byte 0x0203A7CC
_0812B4A0: .4byte 0x0203A7D0
_0812B4A4: .4byte 0x0203A7D4
_0812B4A8: .4byte 0x0203A7D8
_0812B4AC: .4byte 0x0203A7DC
_0812B4B0: .4byte 0x0203A7E0
_0812B4B4: .4byte 0x0203A7E4
_0812B4B8: .4byte 0x0203A7E8
_0812B4BC: .4byte 0x0203A7EC
_0812B4C0: .4byte 0x0203A7F0
_0812B4C4: .4byte 0x0203A7F4
_0812B4C8: .4byte 0x0203A7B0
_0812B4CC: .4byte 0x0203A7B4
_0812B4D0: .4byte 0x0203A7B8
_0812B4D4: .4byte 0x0203A7BC
_0812B4D8: .4byte 0x0203A794
_0812B4DC: .4byte 0x0203A798
_0812B4E0: .4byte 0x0203A79C
_0812B4E4: .4byte 0x0203A7A0
_0812B4E8: .4byte 0x0203A7A4
_0812B4EC: .4byte 0x0203A7A8
_0812B4F0: .4byte 0x0203A7AC
_0812B4F4: .4byte 0x0203A7F8
_0812B4F8: .4byte 0x0203A7FC
	thumb_func_end SlotAction_FreeDataStructures

	thumb_func_start DrawLuckyFlags
DrawLuckyFlags: @ 0x0812B4FC
	push {r4, lr}
	ldr r4, _0812B560
	ldr r1, [r4]
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	bne _0812B55A
	ldrb r1, [r1, #4]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0812B55A
	bl IsThisRoundLucky
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812B53C
	bl AttemptsAtLuckyFlags_Top3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	beq _0812B53C
	ldr r2, [r4]
	ldr r1, _0812B564
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	ldrb r0, [r2, #4]
	orrs r0, r1
	strb r0, [r2, #4]
	cmp r3, #1
	bne _0812B55A
_0812B53C:
	bl AttemptsAtLuckyFlags_NotTop3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	beq _0812B55A
	ldr r0, _0812B560
	ldr r2, [r0]
	ldr r1, _0812B568
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	ldrb r0, [r2, #4]
	orrs r0, r1
	strb r0, [r2, #4]
_0812B55A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812B560: .4byte 0x0203A800
_0812B564: .4byte 0x08584782
_0812B568: .4byte 0x08584788
	thumb_func_end DrawLuckyFlags

	thumb_func_start SetLuckySpins
SetLuckySpins: @ 0x0812B56C
	push {lr}
	ldr r2, _0812B588
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #6]
	ldr r2, [r2]
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _0812B582
	movs r0, #1
	strb r0, [r2, #6]
_0812B582:
	pop {r0}
	bx r0
	.align 2, 0
_0812B588: .4byte 0x0203A800
	thumb_func_end SetLuckySpins

	thumb_func_start GetBiasTag
GetBiasTag: @ 0x0812B58C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	movs r3, #1
	ldr r4, _0812B5A8
_0812B598:
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	beq _0812B5AC
	adds r0, r2, r4
	ldrb r0, [r0]
	b _0812B5BA
	.align 2, 0
_0812B5A8: .4byte 0x0858477A
_0812B5AC:
	lsrs r1, r1, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _0812B598
	movs r0, #0
_0812B5BA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBiasTag

	thumb_func_start IsThisRoundLucky
IsThisRoundLucky: @ 0x0812B5C0
	push {r4, lr}
	bl Random
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0812B5EC
	ldr r1, _0812B5F0
	ldr r1, [r1]
	movs r3, #0x12
	ldrsh r2, [r1, r3]
	ldrb r3, [r1, #1]
	lsls r1, r3, #1
	adds r1, r1, r3
	subs r1, #1
	adds r2, r2, r1
	adds r2, r2, r4
	ldrb r1, [r2]
	cmp r1, r0
	bhi _0812B5F4
	movs r0, #0
	b _0812B5F6
	.align 2, 0
_0812B5EC: .4byte 0x08584644
_0812B5F0: .4byte 0x0203A800
_0812B5F4:
	movs r0, #1
_0812B5F6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsThisRoundLucky

	thumb_func_start AttemptsAtLuckyFlags_Top3
AttemptsAtLuckyFlags_Top3: @ 0x0812B5FC
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _0812B63C
_0812B602:
	bl Random
	movs r2, #0xff
	ldr r1, _0812B640
	ldr r3, [r1]
	lsls r1, r5, #0x10
	asrs r4, r1, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #1
	ldrb r3, [r3, #1]
	adds r1, r1, r3
	adds r1, r1, r6
	ldrb r1, [r1]
	ands r2, r0
	cmp r1, r2
	bgt _0812B630
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0812B602
_0812B630:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812B63C: .4byte 0x08584656
_0812B640: .4byte 0x0203A800
	thumb_func_end AttemptsAtLuckyFlags_Top3

	thumb_func_start AttemptsAtLuckyFlags_NotTop3
AttemptsAtLuckyFlags_NotTop3: @ 0x0812B644
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r0, _0812B688
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #0x11
_0812B654:
	bl Random
	movs r5, #0xff
	ands r5, r0
	ldr r0, _0812B68C
	ldr r4, [r0]
	lsls r2, r6, #0x10
	asrs r1, r2, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r3, [r4, #1]
	adds r0, r0, r3
	add r0, r8
	ldrb r3, [r0]
	cmp r1, #0
	bne _0812B690
	ldrb r0, [r4, #3]
	cmp r0, #1
	bne _0812B690
	adds r3, #0xa
	asrs r0, r7, #0x10
	cmp r3, r0
	ble _0812B6AE
	adds r3, r0, #0
	b _0812B6AE
	.align 2, 0
_0812B688: .4byte 0x08584668
_0812B68C: .4byte 0x0203A800
_0812B690:
	asrs r0, r2, #0x10
	cmp r0, #4
	bne _0812B6AE
	ldr r0, _0812B6D4
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	cmp r0, #1
	bne _0812B6AE
	lsls r0, r3, #0x10
	ldr r1, _0812B6D8
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	cmp r0, #0
	bge _0812B6AE
	movs r3, #0
_0812B6AE:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bgt _0812B6C4
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r2, r3
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812B654
_0812B6C4:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812B6D4: .4byte 0x0203A800
_0812B6D8: .4byte 0xFFF60000
	thumb_func_end AttemptsAtLuckyFlags_NotTop3

	thumb_func_start GetReelTimeProbability
GetReelTimeProbability: @ 0x0812B6DC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0812B6F0
	ldr r2, [r0]
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _0812B6F8
	ldr r0, _0812B6F4
	b _0812B6FA
	.align 2, 0
_0812B6F0: .4byte 0x0203A800
_0812B6F4: .4byte 0x085846EC
_0812B6F8:
	ldr r0, _0812B70C
_0812B6FA:
	lsls r1, r3, #4
	adds r1, r1, r3
	ldrb r2, [r2, #2]
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0812B70C: .4byte 0x08584686
	thumb_func_end GetReelTimeProbability

	thumb_func_start GetReeltimeDraw
GetReeltimeDraw: @ 0x0812B710
	push {r4, r5, r6, lr}
	ldr r0, _0812B734
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #5]
	bl Random
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	bl GetReelTimeProbability
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _0812B764
	movs r6, #5
	b _0812B73E
	.align 2, 0
_0812B734: .4byte 0x0203A800
_0812B738:
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_0812B73E:
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	ble _0812B75E
	bl Random
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl GetReelTimeProbability
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bhs _0812B738
_0812B75E:
	ldr r0, _0812B76C
	ldr r0, [r0]
	strb r6, [r0, #5]
_0812B764:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812B76C: .4byte 0x0203A800
	thumb_func_end GetReeltimeDraw

	thumb_func_start SkipToReeltimeAction14
SkipToReeltimeAction14: @ 0x0812B770
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl Random
	movs r1, #0xff
	ands r1, r0
	ldr r0, _0812B790
	lsls r4, r4, #1
	adds r4, r4, r0
	ldrh r4, [r4]
	cmp r1, r4
	blo _0812B794
	movs r0, #0
	b _0812B796
	.align 2, 0
_0812B790: .4byte 0x08584752
_0812B794:
	movs r0, #1
_0812B796:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SkipToReeltimeAction14

	thumb_func_start SlowReelSpeed
SlowReelSpeed: @ 0x0812B79C
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _0812B7B4
	ldr r0, [r0]
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	ldr r0, _0812B7B8
	cmp r1, r0
	ble _0812B7BC
	movs r4, #4
	b _0812B7D2
	.align 2, 0
_0812B7B4: .4byte 0x0203A800
_0812B7B8: .4byte 0x0000012B
_0812B7BC:
	cmp r1, #0xf9
	ble _0812B7C4
	movs r4, #3
	b _0812B7D2
_0812B7C4:
	cmp r1, #0xc7
	ble _0812B7CC
	movs r4, #2
	b _0812B7D2
_0812B7CC:
	cmp r1, #0x95
	ble _0812B7D2
	movs r4, #1
_0812B7D2:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r5, _0812B7F4
	lsls r4, r4, #2
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0812B7F8
	movs r0, #4
	b _0812B832
	.align 2, 0
_0812B7F4: .4byte 0x0858475C
_0812B7F8:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	adds r2, r5, #2
	adds r2, r4, r2
	ldr r3, _0812B828
	ldr r1, _0812B82C
	ldr r1, [r1]
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x18
	cmp r0, r1
	blo _0812B830
	movs r0, #8
	b _0812B832
	.align 2, 0
_0812B828: .4byte 0x08584770
_0812B82C: .4byte 0x0203A800
_0812B830:
	movs r0, #2
_0812B832:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end SlowReelSpeed

	thumb_func_start CheckMatch
CheckMatch: @ 0x0812B838
	push {r4, lr}
	ldr r4, _0812B868
	ldr r1, [r4]
	movs r0, #0
	strh r0, [r1, #8]
	bl CheckMatch_CenterRow
	ldr r0, [r4]
	movs r1, #0x12
	ldrsh r0, [r0, r1]
	cmp r0, #1
	ble _0812B854
	bl CheckMatch_TopAndBottom
_0812B854:
	ldr r0, [r4]
	movs r1, #0x12
	ldrsh r0, [r0, r1]
	cmp r0, #2
	ble _0812B862
	bl CheckMatch_Diagonals
_0812B862:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812B868: .4byte 0x0203A800
	thumb_func_end CheckMatch

	thumb_func_start CheckMatch_CenterRow
CheckMatch_CenterRow: @ 0x0812B86C
	push {r4, r5, lr}
	movs r0, #0
	movs r1, #2
	bl GetNearbyTag_Quantized
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #1
	movs r1, #2
	bl GetNearbyTag_Quantized
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	movs r1, #2
	bl GetNearbyTag_Quantized
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetMatchFromSymbolsInRow
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	beq _0812B8CC
	ldr r0, _0812B8D4
	ldr r2, [r0]
	ldr r0, _0812B8D8
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, #0xe]
	adds r0, r0, r3
	strh r0, [r2, #0xe]
	ldr r0, _0812B8DC
	adds r1, r1, r0
	ldrh r0, [r2, #8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, #8]
	movs r0, #0
	bl sub_0812CF44
_0812B8CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B8D4: .4byte 0x0203A800
_0812B8D8: .4byte 0x085847AC
_0812B8DC: .4byte 0x0858479A
	thumb_func_end CheckMatch_CenterRow

	thumb_func_start CheckMatch_TopAndBottom
CheckMatch_TopAndBottom: @ 0x0812B8E0
	push {r4, r5, lr}
	movs r0, #0
	movs r1, #1
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #1
	movs r1, #1
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #2
	movs r1, #1
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetMatchFromSymbolsInRow
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	beq _0812B940
	cmp r1, #0
	bne _0812B91C
	movs r1, #1
_0812B91C:
	ldr r0, _0812B9A4
	ldr r2, [r0]
	ldr r0, _0812B9A8
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, #0xe]
	adds r0, r0, r3
	strh r0, [r2, #0xe]
	ldr r0, _0812B9AC
	adds r1, r1, r0
	ldrh r0, [r2, #8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, #8]
	movs r0, #1
	bl sub_0812CF44
_0812B940:
	movs r0, #0
	movs r1, #3
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #1
	movs r1, #3
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #2
	movs r1, #3
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetMatchFromSymbolsInRow
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	beq _0812B99E
	cmp r1, #0
	bne _0812B97A
	movs r1, #1
_0812B97A:
	ldr r0, _0812B9A4
	ldr r2, [r0]
	ldr r0, _0812B9A8
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, #0xe]
	adds r0, r0, r3
	strh r0, [r2, #0xe]
	ldr r0, _0812B9AC
	adds r1, r1, r0
	ldrh r0, [r2, #8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, #8]
	movs r0, #2
	bl sub_0812CF44
_0812B99E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B9A4: .4byte 0x0203A800
_0812B9A8: .4byte 0x085847AC
_0812B9AC: .4byte 0x0858479A
	thumb_func_end CheckMatch_TopAndBottom

	thumb_func_start CheckMatch_Diagonals
CheckMatch_Diagonals: @ 0x0812B9B0
	push {r4, r5, lr}
	movs r0, #0
	movs r1, #1
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #1
	movs r1, #2
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #2
	movs r1, #3
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetMatchFromSymbolsInRow
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	beq _0812BA0E
	cmp r1, #0
	beq _0812BA08
	ldr r0, _0812BA70
	ldr r2, [r0]
	ldr r0, _0812BA74
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, #0xe]
	adds r0, r0, r3
	strh r0, [r2, #0xe]
	ldr r0, _0812BA78
	adds r1, r1, r0
	ldrh r0, [r2, #8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, #8]
_0812BA08:
	movs r0, #3
	bl sub_0812CF44
_0812BA0E:
	movs r0, #0
	movs r1, #3
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #1
	movs r1, #2
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #2
	movs r1, #1
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetMatchFromSymbolsInRow
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	beq _0812BA6A
	cmp r1, #0
	beq _0812BA64
	ldr r0, _0812BA70
	ldr r2, [r0]
	ldr r0, _0812BA74
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, #0xe]
	adds r0, r0, r3
	strh r0, [r2, #0xe]
	ldr r0, _0812BA78
	adds r1, r1, r0
	ldrh r0, [r2, #8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, #8]
_0812BA64:
	movs r0, #4
	bl sub_0812CF44
_0812BA6A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BA70: .4byte 0x0203A800
_0812BA74: .4byte 0x085847AC
_0812BA78: .4byte 0x0858479A
	thumb_func_end CheckMatch_Diagonals

	thumb_func_start GetMatchFromSymbolsInRow
GetMatchFromSymbolsInRow: @ 0x0812BA7C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r3, r1
	bne _0812BAA0
	cmp r3, r2
	bne _0812BAA0
	ldr r0, _0812BA9C
	adds r0, r3, r0
	ldrb r0, [r0]
	b _0812BAC6
	.align 2, 0
_0812BA9C: .4byte 0x08584792
_0812BAA0:
	cmp r3, #0
	bne _0812BAAC
	cmp r1, #0
	bne _0812BAAC
	cmp r2, #1
	beq _0812BAB8
_0812BAAC:
	cmp r3, #1
	bne _0812BABC
	cmp r1, #1
	bne _0812BABC
	cmp r2, #0
	bne _0812BABC
_0812BAB8:
	movs r0, #6
	b _0812BAC6
_0812BABC:
	cmp r3, #4
	beq _0812BAC4
	movs r0, #9
	b _0812BAC6
_0812BAC4:
	movs r0, #0
_0812BAC6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMatchFromSymbolsInRow

	thumb_func_start AwardPayout
AwardPayout: @ 0x0812BACC
	push {r4, lr}
	ldr r4, _0812BAE8
	adds r0, r4, #0
	movs r1, #4
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BAE8: .4byte 0x0812BB0D
	thumb_func_end AwardPayout

	thumb_func_start IsFinalTask_RunAwardPayoutActions
IsFinalTask_RunAwardPayoutActions: @ 0x0812BAEC
	push {lr}
	ldr r0, _0812BB00
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0812BB04
	movs r0, #0
	b _0812BB06
	.align 2, 0
_0812BB00: .4byte 0x0812BB0D
_0812BB04:
	movs r0, #1
_0812BB06:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsFinalTask_RunAwardPayoutActions

	thumb_func_start RunAwardPayoutActions
RunAwardPayoutActions: @ 0x0812BB0C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0812BB3C
	ldr r2, _0812BB40
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0812BB1E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812BB1E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BB3C: .4byte 0x08584448
_0812BB40: .4byte 0x03005B60
	thumb_func_end RunAwardPayoutActions

	thumb_func_start AwardPayoutAction0
AwardPayoutAction0: @ 0x0812BB44
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0812CF7C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812BB70
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldr r0, _0812BB6C
	ldr r0, [r0]
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0812BB70
	movs r0, #2
	strh r0, [r4, #8]
	movs r0, #1
	b _0812BB72
	.align 2, 0
_0812BB6C: .4byte 0x0203A800
_0812BB70:
	movs r0, #0
_0812BB72:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AwardPayoutAction0

	thumb_func_start AwardPayoutAction_GivePayoutToPlayer
AwardPayoutAction_GivePayoutToPlayer: @ 0x0812BB78
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0812BBCC
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812BB9E
	movs r0, #0x15
	bl PlaySE
_0812BB9E:
	ldr r0, _0812BC20
	ldr r2, [r0]
	ldrh r0, [r2, #0xe]
	subs r0, #1
	strh r0, [r2, #0xe]
	ldrh r3, [r2, #0xc]
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldr r0, _0812BC24
	cmp r1, r0
	bgt _0812BBB8
	adds r0, r3, #1
	strh r0, [r2, #0xc]
_0812BBB8:
	movs r0, #8
	strh r0, [r4, #0xa]
	ldr r0, _0812BC28
	ldrh r1, [r0, #0x2c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812BBCC
	movs r0, #4
	strh r0, [r4, #0xa]
_0812BBCC:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812BC06
	ldr r0, _0812BC28
	ldrh r1, [r0, #0x2e]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0812BC06
	movs r0, #0x15
	bl PlaySE
	ldr r1, _0812BC20
	ldr r2, [r1]
	ldrh r0, [r2, #0xe]
	ldrh r3, [r2, #0xc]
	adds r0, r0, r3
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _0812BC2C
	cmp r0, r3
	ble _0812BC00
	strh r3, [r2, #0xc]
_0812BC00:
	ldr r1, [r1]
	movs r0, #0
	strh r0, [r1, #0xe]
_0812BC06:
	ldr r0, _0812BC20
	ldr r0, [r0]
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0812BC18
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0812BC18:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BC20: .4byte 0x0203A800
_0812BC24: .4byte 0x0000270E
_0812BC28: .4byte 0x03002360
_0812BC2C: .4byte 0x0000270F
	thumb_func_end AwardPayoutAction_GivePayoutToPlayer

	thumb_func_start AwardPayoutAction_FreeTask
AwardPayoutAction_FreeTask: @ 0x0812BC30
	push {lr}
	bl sub_0812CFC8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812BC4A
	ldr r0, _0812BC50
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0812BC4A:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812BC50: .4byte 0x0812BB0D
	thumb_func_end AwardPayoutAction_FreeTask

	thumb_func_start GetNearbyTag_Quantized
GetNearbyTag_Quantized: @ 0x0812BC54
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	ldr r0, _0812BCA0
	ldr r0, [r0]
	lsls r2, r4, #1
	adds r0, #0x28
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r1
	movs r1, #0x15
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0812BC86
	adds r0, #0x15
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0812BC86:
	ldr r2, _0812BCA4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812BCA0: .4byte 0x0203A800
_0812BCA4: .4byte 0x085845F2
	thumb_func_end GetNearbyTag_Quantized

	thumb_func_start GetNearbyTag
GetNearbyTag: @ 0x0812BCA8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r6, #0
	ldr r0, _0812BCF0
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x1c
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x18
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0812BCD2
	ldr r6, _0812BCF4
_0812BCD2:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812BCF0: .4byte 0x0203A800
_0812BCF4: .4byte 0x0000FFFF
	thumb_func_end GetNearbyTag

	thumb_func_start GetNearbyReelTimeTag
GetNearbyReelTimeTag: @ 0x0812BCF8
	push {lr}
	ldr r1, _0812BD30
	ldr r1, [r1]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	adds r0, r1, #0
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0812BD20
	adds r0, #6
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0812BD20:
	ldr r0, _0812BD34
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0812BD30: .4byte 0x0203A800
_0812BD34: .4byte 0x08584631
	thumb_func_end GetNearbyReelTimeTag

	thumb_func_start AdvanceSlotReel
AdvanceSlotReel: @ 0x0812BD38
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	ldr r0, _0812BD7C
	ldr r6, [r0]
	lsrs r5, r5, #0x17
	adds r4, r6, #0
	adds r4, #0x1c
	adds r4, r4, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r4]
	adds r1, r1, r0
	strh r1, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xfc
	lsls r1, r1, #1
	bl __modsi3
	strh r0, [r4]
	adds r6, #0x28
	adds r6, r6, r5
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x18
	bl __divsi3
	movs r1, #0x15
	subs r1, r1, r0
	strh r1, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812BD7C: .4byte 0x0203A800
	thumb_func_end AdvanceSlotReel

	thumb_func_start AdvanceSlotReelToNextTag
AdvanceSlotReelToNextTag: @ 0x0812BD80
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r7, _0812BDE0
	ldr r0, [r7]
	lsls r6, r5, #1
	adds r0, #0x1c
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x18
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	cmp r1, #0
	beq _0812BDD4
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _0812BDB6
	lsrs r4, r2, #0x10
_0812BDB6:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl AdvanceSlotReel
	ldr r0, [r7]
	adds r0, #0x1c
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x18
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0812BDD4:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812BDE0: .4byte 0x0203A800
	thumb_func_end AdvanceSlotReelToNextTag

	thumb_func_start AdvanceReeltimeReel
AdvanceReeltimeReel: @ 0x0812BDE4
	push {r4, lr}
	ldr r1, _0812BE18
	ldr r4, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #0x14]
	adds r0, r0, r1
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r1, #0x78
	bl __modsi3
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl __divsi3
	movs r1, #6
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BE18: .4byte 0x0203A800
	thumb_func_end AdvanceReeltimeReel

	thumb_func_start AdvanceReeltimeReelToNextTag
AdvanceReeltimeReelToNextTag: @ 0x0812BE1C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r5, _0812BE68
	ldr r0, [r5]
	movs r1, #0x14
	ldrsh r0, [r0, r1]
	movs r1, #0x14
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	cmp r1, #0
	beq _0812BE5E
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _0812BE46
	lsrs r4, r2, #0x10
_0812BE46:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl AdvanceReeltimeReel
	ldr r0, [r5]
	movs r1, #0x14
	ldrsh r0, [r0, r1]
	movs r1, #0x14
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0812BE5E:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812BE68: .4byte 0x0203A800
	thumb_func_end AdvanceReeltimeReelToNextTag

	thumb_func_start GameplayTask_StopSlotReel
GameplayTask_StopSlotReel: @ 0x0812BE6C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _0812BEA8
	ldr r6, _0812BEAC
_0812BE74:
	adds r0, r5, #0
	movs r1, #2
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r4, [r1, #0x26]
	ldr r1, _0812BEB0
	ldr r1, [r1]
	adds r1, #0x3a
	adds r1, r1, r4
	strb r0, [r1]
	bl _call_via_r5
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0812BE74
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812BEA8: .4byte 0x0812BF3D
_0812BEAC: .4byte 0x03005B60
_0812BEB0: .4byte 0x0203A800
	thumb_func_end GameplayTask_StopSlotReel

	thumb_func_start ReelTasks_SetUnkTaskData
ReelTasks_SetUnkTaskData: @ 0x0812BEB4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0812BEE4
	ldr r1, _0812BEE8
	ldr r2, [r1]
	adds r2, #0x3a
	adds r2, r2, r0
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r3, #1
	strh r3, [r0, #8]
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r3, [r0, #0x24]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BEE4: .4byte 0x03005B60
_0812BEE8: .4byte 0x0203A800
	thumb_func_end ReelTasks_SetUnkTaskData

	thumb_func_start sub_0812BEEC
sub_0812BEEC: @ 0x0812BEEC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812BF0C
	ldr r1, _0812BF10
	ldr r1, [r1]
	adds r1, #0x3a
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #8]
	bx lr
	.align 2, 0
_0812BF0C: .4byte 0x03005B60
_0812BF10: .4byte 0x0203A800
	thumb_func_end sub_0812BEEC

	thumb_func_start IsSlotReelMoving
IsSlotReelMoving: @ 0x0812BF14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812BF34
	ldr r1, _0812BF38
	ldr r1, [r1]
	adds r1, #0x3a
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0812BF34: .4byte 0x03005B60
_0812BF38: .4byte 0x0203A800
	thumb_func_end IsSlotReelMoving

	thumb_func_start RunSlotReelActions
RunSlotReelActions: @ 0x0812BF3C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0812BF6C
	ldr r2, _0812BF70
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_0812BF4E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812BF4E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BF6C: .4byte 0x08584454
_0812BF70: .4byte 0x03005B60
	thumb_func_end RunSlotReelActions

	thumb_func_start SlotReelAction_StayStill
SlotReelAction_StayStill: @ 0x0812BF74
	movs r0, #0
	bx lr
	thumb_func_end SlotReelAction_StayStill

	thumb_func_start SlotReelAction_Spin
SlotReelAction_Spin: @ 0x0812BF78
	push {lr}
	ldrh r0, [r0, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0812BF94
	ldr r1, [r1]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	bl AdvanceSlotReel
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0812BF94: .4byte 0x0203A800
	thumb_func_end SlotReelAction_Spin

	thumb_func_start SlotReelAction_DecideWhereToStop
SlotReelAction_DecideWhereToStop: @ 0x0812BF98
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #8]
	ldr r0, _0812C020
	ldr r3, [r0]
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x34
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x2e
	adds r0, r0, r1
	strh r2, [r0]
	ldrb r0, [r3, #0xa]
	cmp r0, #0
	bne _0812C004
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0812BFEC
	ldrb r0, [r3, #6]
	cmp r0, #0
	beq _0812BFEC
	ldr r1, _0812C024
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812C004
_0812BFEC:
	ldr r0, _0812C020
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #6]
	ldr r1, _0812C028
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0812C004:
	ldr r0, _0812C020
	ldr r1, [r0]
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r1, #0x2e
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r4, #0xa]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812C020: .4byte 0x0203A800
_0812C024: .4byte 0x08584468
_0812C028: .4byte 0x08584474
	thumb_func_end SlotReelAction_DecideWhereToStop

	thumb_func_start SlotReelAction_MoveToStop
SlotReelAction_MoveToStop: @ 0x0812C02C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _0812C070
	mov r0, sp
	movs r2, #0xa
	bl memcpy
	ldr r7, _0812C074
	ldr r5, [r7]
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r6, r0, #1
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r0, r6
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #0x18
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	beq _0812C078
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0x1a
	ldrsh r1, [r5, r6]
	bl AdvanceSlotReelToNextTag
	b _0812C0B0
	.align 2, 0
_0812C070: .4byte 0x08584480
_0812C074: .4byte 0x0203A800
_0812C078:
	adds r0, r5, #0
	adds r0, #0x2e
	adds r1, r0, r6
	ldrh r3, [r1]
	movs r6, #0
	ldrsh r0, [r1, r6]
	cmp r0, #0
	beq _0812C0B4
	subs r0, r3, #1
	strh r0, [r1]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x1a
	ldrsh r1, [r5, r2]
	bl AdvanceSlotReel
	ldr r1, [r7]
	movs r6, #0x26
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r1, #0x1c
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x18
	bl __modsi3
_0812C0B0:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0812C0B4:
	cmp r2, #0
	bne _0812C0E2
	ldr r0, _0812C0EC
	ldr r1, [r0]
	movs r6, #0x26
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r1, #0x2e
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	cmp r1, #0
	bne _0812C0E2
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	strh r1, [r4, #0xc]
_0812C0E2:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812C0EC: .4byte 0x0203A800
	thumb_func_end SlotReelAction_MoveToStop

	thumb_func_start SlotReelAction_OscillatingStop
SlotReelAction_OscillatingStop: @ 0x0812C0F0
	push {r4, lr}
	adds r2, r0, #0
	ldr r4, _0812C144
	ldr r1, [r4]
	movs r3, #0x26
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r1, #0x22
	adds r1, r1, r0
	ldrh r0, [r2, #0xa]
	strh r0, [r1]
	ldrh r0, [r2, #0xa]
	rsbs r3, r0, #0
	strh r3, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0812C120
	lsls r0, r3, #0x10
	asrs r0, r0, #0x11
	strh r0, [r2, #0xa]
_0812C120:
	movs r0, #0xa
	ldrsh r3, [r2, r0]
	cmp r3, #0
	bne _0812C13A
	strh r3, [r2, #8]
	strh r3, [r2, #0x24]
	ldr r1, [r4]
	movs r4, #0x26
	ldrsh r0, [r2, r4]
	lsls r0, r0, #1
	adds r1, #0x22
	adds r1, r1, r0
	strh r3, [r1]
_0812C13A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812C144: .4byte 0x0203A800
	thumb_func_end SlotReelAction_OscillatingStop

	thumb_func_start DecideReelTurns_BiasTag_Reel1
DecideReelTurns_BiasTag_Reel1: @ 0x0812C148
	push {r4, r5, lr}
	ldr r4, _0812C18C
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl GetBiasTag
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r5, r3, #0
	ldr r4, [r4]
	ldrb r1, [r4, #4]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0812C16A
	movs r5, #0
	movs r3, #1
_0812C16A:
	ldr r1, _0812C190
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r3, #0
	bl _call_via_r2
	thumb_func_end DecideReelTurns_BiasTag_Reel1

	thumb_func_start nullsub_68
nullsub_68: @ 0x0812C180
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812C18C: .4byte 0x0203A800
_0812C190: .4byte 0x0858448C
	thumb_func_end nullsub_68

	thumb_func_start AreTagsAtPosition_Reel1
AreTagsAtPosition_Reel1: @ 0x0812C194
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0
	adds r1, r3, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, r4
	beq _0812C1BC
	cmp r0, r5
	bne _0812C1CC
_0812C1BC:
	ldr r0, _0812C1C8
	ldr r0, [r0]
	strb r1, [r0, #7]
	movs r0, #1
	b _0812C1CE
	.align 2, 0
_0812C1C8: .4byte 0x0203A800
_0812C1CC:
	movs r0, #0
_0812C1CE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end AreTagsAtPosition_Reel1

	thumb_func_start AreCherriesOnScreen_Reel1
AreCherriesOnScreen_Reel1: @ 0x0812C1D4
	push {r4, lr}
	movs r1, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _0812C21C
	movs r1, #2
	subs r1, r1, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _0812C21C
	movs r1, #3
	subs r1, r1, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0812C220
_0812C21C:
	movs r0, #1
	b _0812C222
_0812C220:
	movs r0, #0
_0812C222:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AreCherriesOnScreen_Reel1

	thumb_func_start IsBiasTowardsCherryOr7s
IsBiasTowardsCherryOr7s: @ 0x0812C228
	push {lr}
	ldr r0, _0812C23C
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	movs r0, #0xc2
	ands r0, r1
	cmp r0, #0
	bne _0812C240
	movs r0, #0
	b _0812C242
	.align 2, 0
_0812C23C: .4byte 0x0203A800
_0812C240:
	movs r0, #1
_0812C242:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsBiasTowardsCherryOr7s

	thumb_func_start DecideReelTurns_BiasTag_Reel1_Bet1
DecideReelTurns_BiasTag_Reel1_Bet1: @ 0x0812C248
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	movs r0, #2
	mov r8, r0
_0812C25C:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	mov r1, r8
	subs r0, r1, r4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r2, r6, #0
	bl AreTagsAtPosition_Reel1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812C288
	ldr r0, _0812C284
	ldr r1, [r0]
	movs r0, #2
	strh r0, [r1, #0x34]
	strh r5, [r1, #0x2e]
	movs r0, #1
	b _0812C296
	.align 2, 0
_0812C284: .4byte 0x0203A800
_0812C288:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C25C
	movs r0, #0
_0812C296:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end DecideReelTurns_BiasTag_Reel1_Bet1

	thumb_func_start DecideReelTurns_BiasTag_Reel1_Bet2or3
DecideReelTurns_BiasTag_Reel1_Bet2or3: @ 0x0812C2A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	bl IsBiasTowardsCherryOr7s
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0812C2CE
	movs r0, #0
	bl AreCherriesOnScreen_Reel1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812C304
_0812C2CE:
	movs r7, #1
	movs r6, #0
_0812C2D2:
	lsls r0, r7, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	mov r1, sb
	mov r2, r8
	bl AreTagsAtPosition_Reel1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812C2F8
	ldr r0, _0812C2F4
	ldr r0, [r0]
	strh r7, [r0, #0x34]
	strh r6, [r0, #0x2e]
	movs r0, #1
	b _0812C3A0
	.align 2, 0
_0812C2F4: .4byte 0x0203A800
_0812C2F8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0812C2D2
_0812C304:
	movs r7, #1
	adds r6, r5, #0
	ldr r0, _0812C358
	mov sl, r0
_0812C30C:
	lsls r5, r7, #0x10
	cmp r6, #0
	bne _0812C31E
	asrs r0, r5, #0x10
	bl AreCherriesOnScreen_Reel1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812C390
_0812C31E:
	movs r0, #1
	asrs r4, r5, #0x10
	subs r0, r0, r4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	mov r2, r8
	bl AreTagsAtPosition_Reel1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812C390
	cmp r4, #1
	bne _0812C35C
	cmp r6, #0
	bne _0812C34A
	movs r0, #3
	bl AreCherriesOnScreen_Reel1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812C35C
_0812C34A:
	mov r0, sl
	ldr r1, [r0]
	movs r0, #3
	strh r0, [r1, #0x34]
	strh r0, [r1, #0x2e]
	movs r0, #1
	b _0812C3A0
	.align 2, 0
_0812C358: .4byte 0x0203A800
_0812C35C:
	asrs r0, r5, #0x10
	cmp r0, #3
	bgt _0812C384
	adds r4, r0, #1
	cmp r6, #0
	bne _0812C376
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl AreCherriesOnScreen_Reel1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812C384
_0812C376:
	mov r0, sl
	ldr r1, [r0]
	movs r0, #2
	strh r0, [r1, #0x34]
	strh r4, [r1, #0x2e]
	movs r0, #1
	b _0812C3A0
_0812C384:
	mov r0, sl
	ldr r1, [r0]
	movs r0, #1
	strh r0, [r1, #0x34]
	strh r7, [r1, #0x2e]
	b _0812C3A0
_0812C390:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C30C
	movs r0, #0
_0812C3A0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DecideReelTurns_BiasTag_Reel1_Bet2or3

	thumb_func_start DecideReelTurns_BiasTag_Reel2
DecideReelTurns_BiasTag_Reel2: @ 0x0812C3B0
	push {lr}
	ldr r1, _0812C3D0
	ldr r0, _0812C3D4
	ldr r0, [r0]
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end DecideReelTurns_BiasTag_Reel2

	thumb_func_start nullsub_69
nullsub_69: @ 0x0812C3C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0812C3D0: .4byte 0x08584498
_0812C3D4: .4byte 0x0203A800
	thumb_func_end nullsub_69

	thumb_func_start DecideReelTurns_BiasTag_Reel2_Bet1or2
DecideReelTurns_BiasTag_Reel2_Bet1or2: @ 0x0812C3D8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0812C40C
	ldr r0, [r0]
	movs r5, #0
	ldrh r7, [r0, #0x34]
	movs r1, #0x34
	ldrsh r6, [r0, r1]
_0812C3E6:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	subs r1, r6, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	ldr r1, _0812C40C
	ldr r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r1, #7]
	cmp r0, r2
	bne _0812C410
	strh r7, [r1, #0x36]
	strh r5, [r1, #0x30]
	movs r0, #1
	b _0812C41E
	.align 2, 0
_0812C40C: .4byte 0x0203A800
_0812C410:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C3E6
	movs r0, #0
_0812C41E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end DecideReelTurns_BiasTag_Reel2_Bet1or2

	thumb_func_start DecideReelTurns_BiasTag_Reel2_Bet3
DecideReelTurns_BiasTag_Reel2_Bet3: @ 0x0812C424
	push {r4, r5, r6, lr}
	bl DecideReelTurns_BiasTag_Reel2_Bet1or2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812C486
	ldr r0, _0812C478
	ldr r1, [r0]
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _0812C482
	movs r2, #0x30
	ldrsh r0, [r1, r2]
	cmp r0, #1
	ble _0812C482
	cmp r0, #4
	beq _0812C482
	movs r5, #0
	movs r6, #2
_0812C44C:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	subs r1, r6, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	ldr r1, _0812C478
	ldr r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r1, #7]
	cmp r0, r2
	beq _0812C47C
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C44C
	b _0812C482
	.align 2, 0
_0812C478: .4byte 0x0203A800
_0812C47C:
	movs r0, #2
	strh r0, [r1, #0x36]
	strh r5, [r1, #0x30]
_0812C482:
	movs r0, #1
	b _0812C4C2
_0812C486:
	ldr r0, _0812C4C8
	ldr r0, [r0]
	movs r1, #0x34
	ldrsh r0, [r0, r1]
	cmp r0, #2
	beq _0812C4C0
	movs r5, #0
	movs r6, #2
_0812C496:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	subs r1, r6, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	ldr r1, _0812C4C8
	ldr r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r1, #7]
	cmp r0, r2
	beq _0812C47C
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C496
_0812C4C0:
	movs r0, #0
_0812C4C2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812C4C8: .4byte 0x0203A800
	thumb_func_end DecideReelTurns_BiasTag_Reel2_Bet3

	thumb_func_start DecideReelTurns_BiasTag_Reel3
DecideReelTurns_BiasTag_Reel3: @ 0x0812C4CC
	push {r4, lr}
	ldr r2, _0812C508
	ldr r0, [r2]
	ldrb r3, [r0, #7]
	adds r4, r3, #0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0812C4E8
	movs r3, #0
	cmp r4, #0
	bne _0812C4E8
	movs r3, #1
_0812C4E8:
	ldr r1, _0812C50C
	ldr r0, [r2]
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812C508: .4byte 0x0203A800
_0812C50C: .4byte 0x085844A4
	thumb_func_end DecideReelTurns_BiasTag_Reel3

	thumb_func_start DecideReelTurns_BiasTag_Reel3_Bet1or2
DecideReelTurns_BiasTag_Reel3_Bet1or2: @ 0x0812C510
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0812C550
	ldr r0, [r0]
	movs r5, #0
	ldrh r1, [r0, #0x36]
	mov r8, r1
	movs r1, #0x36
	ldrsh r6, [r0, r1]
_0812C528:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	subs r1, r6, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r7
	bne _0812C554
	ldr r0, _0812C550
	ldr r0, [r0]
	mov r1, r8
	strh r1, [r0, #0x38]
	strh r5, [r0, #0x32]
	movs r0, #1
	b _0812C562
	.align 2, 0
_0812C550: .4byte 0x0203A800
_0812C554:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C528
	movs r0, #0
_0812C562:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end DecideReelTurns_BiasTag_Reel3_Bet1or2

	thumb_func_start DecideReelTurns_BiasTag_Reel3_Bet3
DecideReelTurns_BiasTag_Reel3_Bet3: @ 0x0812C56C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0812C594
	ldr r0, [r0]
	movs r2, #0x34
	ldrsh r1, [r0, r2]
	movs r2, #0x36
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _0812C5AC
	adds r0, r6, #0
	bl DecideReelTurns_BiasTag_Reel3_Bet1or2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0812C5E2
	.align 2, 0
_0812C594: .4byte 0x0203A800
_0812C598:
	ldr r0, _0812C5A8
	ldr r0, [r0]
	strh r5, [r0, #0x32]
	mov r1, r8
	strh r1, [r0, #0x38]
	movs r0, #1
	b _0812C5E2
	.align 2, 0
_0812C5A8: .4byte 0x0203A800
_0812C5AC:
	movs r2, #1
	mov r8, r2
	cmp r1, #1
	bne _0812C5B8
	movs r0, #3
	mov r8, r0
_0812C5B8:
	movs r5, #0
	mov r7, r8
_0812C5BC:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	subs r1, r7, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	beq _0812C598
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C5BC
	movs r0, #0
_0812C5E2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end DecideReelTurns_BiasTag_Reel3_Bet3

	thumb_func_start DecideReelTurns_NoBiasTag_Reel1
DecideReelTurns_NoBiasTag_Reel1: @ 0x0812C5EC
	push {r4, r5, lr}
	movs r5, #0
	b _0812C5F8
_0812C5F2:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0812C5F8:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	bl AreCherriesOnScreen_Reel1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812C5F2
	ldr r0, _0812C614
	ldr r0, [r0]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812C614: .4byte 0x0203A800
	thumb_func_end DecideReelTurns_NoBiasTag_Reel1

	thumb_func_start IsBiasTag777_SwitchColor
IsBiasTag777_SwitchColor: @ 0x0812C618
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0812C626
	movs r0, #1
	b _0812C630
_0812C626:
	cmp r0, #1
	beq _0812C62E
	movs r0, #0
	b _0812C634
_0812C62E:
	movs r0, #0
_0812C630:
	strb r0, [r1]
	movs r0, #1
_0812C634:
	pop {r1}
	bx r1
	thumb_func_end IsBiasTag777_SwitchColor

	thumb_func_start DecideReelTurns_NoBiasTag_Reel2
DecideReelTurns_NoBiasTag_Reel2: @ 0x0812C638
	push {lr}
	ldr r1, _0812C654
	ldr r0, _0812C658
	ldr r0, [r0]
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end DecideReelTurns_NoBiasTag_Reel2

	thumb_func_start sub_0812C650
sub_0812C650: @ 0x0812C650
	pop {r0}
	bx r0
	.align 2, 0
_0812C654: .4byte 0x085844B0
_0812C658: .4byte 0x0203A800
	thumb_func_end sub_0812C650

	thumb_func_start DecideReelTurns_NoBiasTag_Reel2_Bet1
DecideReelTurns_NoBiasTag_Reel2_Bet1: @ 0x0812C65C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _0812C6C4
	ldr r2, [r0]
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0812C6D4
	ldrb r1, [r2, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0812C6D4
	ldrh r0, [r2, #0x2e]
	movs r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl IsBiasTag777_SwitchColor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812C6D4
	movs r5, #0
	mov r6, sp
	movs r7, #2
_0812C69C:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	subs r1, r7, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	ldrb r1, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _0812C6C8
	ldr r0, _0812C6C4
	ldr r1, [r0]
	movs r0, #2
	strh r0, [r1, #0x36]
	strh r5, [r1, #0x30]
	b _0812C6D4
	.align 2, 0
_0812C6C4: .4byte 0x0203A800
_0812C6C8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C69C
_0812C6D4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DecideReelTurns_NoBiasTag_Reel2_Bet1

	thumb_func_start DecideReelTurns_NoBiasTag_Reel2_Bet2
DecideReelTurns_NoBiasTag_Reel2_Bet2: @ 0x0812C6DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, _0812C744
	ldr r2, [r4]
	ldrh r3, [r2, #0x34]
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0812C754
	ldrb r1, [r2, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0812C754
	ldrh r1, [r2, #0x2e]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl IsBiasTag777_SwitchColor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812C754
	movs r5, #0
	mov r7, sp
	adds r6, r4, #0
_0812C71C:
	ldr r0, [r6]
	ldrh r1, [r0, #0x34]
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	ldrb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _0812C748
	ldr r0, [r6]
	ldrh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	strh r5, [r0, #0x30]
	b _0812C754
	.align 2, 0
_0812C744: .4byte 0x0203A800
_0812C748:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C71C
_0812C754:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DecideReelTurns_NoBiasTag_Reel2_Bet2

	thumb_func_start DecideReelTurns_NoBiasTag_Reel2_Bet3
DecideReelTurns_NoBiasTag_Reel2_Bet3: @ 0x0812C75C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r6, _0812C784
	ldr r2, [r6]
	ldrh r4, [r2, #0x34]
	movs r0, #0x34
	ldrsh r3, [r2, r0]
	cmp r3, #0
	beq _0812C85A
	ldrb r1, [r2, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0812C85A
	cmp r3, #2
	bne _0812C7A6
	bl DecideReelTurns_NoBiasTag_Reel2_Bet2
	b _0812C85A
	.align 2, 0
_0812C784: .4byte 0x0203A800
_0812C788:
	ldr r0, _0812C794
	ldr r0, [r0]
	movs r1, #0
	strh r5, [r0, #0x36]
	strh r1, [r0, #0x30]
	b _0812C85A
	.align 2, 0
_0812C794: .4byte 0x0203A800
_0812C798:
	movs r0, #2
	strh r0, [r1, #0x36]
	adds r0, r4, #1
	strh r0, [r1, #0x30]
	b _0812C85A
_0812C7A2:
	movs r0, #3
	b _0812C834
_0812C7A6:
	ldrh r1, [r2, #0x2e]
	subs r1, r4, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl IsBiasTag777_SwitchColor
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812C85A
	movs r5, #2
	ldr r0, [r6]
	movs r1, #0x34
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bne _0812C7D2
	movs r5, #3
_0812C7D2:
	movs r6, #0
	mov r7, sp
_0812C7D6:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	adds r1, r4, #0
	bl GetNearbyTag
	ldrb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _0812C788
	lsls r1, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r1, r1, r2
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #1
	ble _0812C7D6
	movs r5, #1
	mov r7, sp
	ldr r6, _0812C83C
_0812C808:
	ldr r0, [r6]
	ldrh r1, [r0, #0x34]
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	ldrb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _0812C84E
	ldr r1, [r6]
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _0812C840
	cmp r4, #2
	ble _0812C798
_0812C834:
	strh r0, [r1, #0x36]
	strh r5, [r1, #0x30]
	b _0812C85A
	.align 2, 0
_0812C83C: .4byte 0x0203A800
_0812C840:
	cmp r4, #2
	ble _0812C7A2
	movs r0, #2
	strh r0, [r1, #0x36]
	subs r0, r4, #1
	strh r0, [r1, #0x30]
	b _0812C85A
_0812C84E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C808
_0812C85A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DecideReelTurns_NoBiasTag_Reel2_Bet3

	thumb_func_start AreTagsMixed77
AreTagsMixed77: @ 0x0812C864
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r1, #0
	cmp r0, #0
	bne _0812C878
	cmp r1, #1
	beq _0812C880
_0812C878:
	cmp r0, #1
	bne _0812C884
	cmp r2, #0
	bne _0812C884
_0812C880:
	movs r0, #1
	b _0812C886
_0812C884:
	movs r0, #0
_0812C886:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AreTagsMixed77

	thumb_func_start AreTagsMixed777
AreTagsMixed777: @ 0x0812C88C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r0, #0
	bne _0812C8A6
	cmp r1, #1
	bne _0812C8A6
	cmp r2, #0
	beq _0812C8B2
_0812C8A6:
	cmp r0, #1
	bne _0812C8B6
	cmp r1, #0
	bne _0812C8B6
	cmp r2, #1
	bne _0812C8B6
_0812C8B2:
	movs r0, #1
	b _0812C8B8
_0812C8B6:
	movs r0, #0
_0812C8B8:
	pop {r1}
	bx r1
	thumb_func_end AreTagsMixed777

	thumb_func_start TagsDontMatchOrHaveAny7s
TagsDontMatchOrHaveAny7s: @ 0x0812C8BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r0, #0
	bne _0812C8D6
	cmp r1, #1
	bne _0812C8D6
	cmp r2, #0
	beq _0812C902
_0812C8D6:
	cmp r0, #1
	bne _0812C8E2
	cmp r1, #0
	bne _0812C8E2
	cmp r2, #1
	beq _0812C902
_0812C8E2:
	cmp r0, #0
	bne _0812C8EE
	cmp r1, #0
	bne _0812C8EE
	cmp r2, #1
	beq _0812C902
_0812C8EE:
	cmp r0, #1
	bne _0812C8FA
	cmp r1, #1
	bne _0812C8FA
	cmp r2, #0
	beq _0812C902
_0812C8FA:
	cmp r0, r1
	bne _0812C906
	cmp r0, r2
	bne _0812C906
_0812C902:
	movs r0, #0
	b _0812C908
_0812C906:
	movs r0, #1
_0812C908:
	pop {r1}
	bx r1
	thumb_func_end TagsDontMatchOrHaveAny7s

	thumb_func_start DecideReelTurns_NoBiasTag_Reel3
DecideReelTurns_NoBiasTag_Reel3: @ 0x0812C90C
	push {lr}
	ldr r1, _0812C928
	ldr r0, _0812C92C
	ldr r0, [r0]
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end DecideReelTurns_NoBiasTag_Reel3

	thumb_func_start sub_0812C924
sub_0812C924: @ 0x0812C924
	pop {r0}
	bx r0
	.align 2, 0
_0812C928: .4byte 0x085844BC
_0812C92C: .4byte 0x0203A800
	thumb_func_end sub_0812C924

	thumb_func_start DecideReelTurns_NoBiasTag_Reel3_Bet1
DecideReelTurns_NoBiasTag_Reel3_Bet1: @ 0x0812C930
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r7, _0812C96C
	ldr r0, [r7]
	ldrh r1, [r0, #0x2e]
	movs r4, #2
	subs r1, r4, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r7]
	ldrh r0, [r0, #0x30]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r4, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r5, r1
	bne _0812C9A4
	movs r4, #2
	b _0812C97A
	.align 2, 0
_0812C96C: .4byte 0x0203A800
_0812C970:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r6, r0, #0x10
_0812C97A:
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	subs r1, r4, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _0812C970
	cmp r5, #0
	bne _0812C99A
	cmp r0, #1
	beq _0812C970
_0812C99A:
	cmp r5, #1
	bne _0812CA06
	cmp r0, #0
	beq _0812C970
	b _0812CA06
_0812C9A4:
	adds r0, r5, #0
	bl AreTagsMixed77
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812CA06
	ldr r0, [r7]
	ldrb r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0812C9E2
	movs r7, #2
_0812C9BE:
	lsls r0, r6, #0x10
	asrs r4, r0, #0x10
	subs r1, r7, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _0812CA06
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812C9BE
_0812C9E2:
	movs r6, #0
	movs r7, #2
	b _0812C9EE
_0812C9E8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_0812C9EE:
	lsls r0, r6, #0x10
	asrs r4, r0, #0x10
	subs r1, r7, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _0812C9E8
_0812CA06:
	ldr r0, _0812CA14
	ldr r0, [r0]
	strh r6, [r0, #0x32]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812CA14: .4byte 0x0203A800
	thumb_func_end DecideReelTurns_NoBiasTag_Reel3_Bet1

	thumb_func_start DecideReelTurns_NoBiasTag_Reel3_Bet2
DecideReelTurns_NoBiasTag_Reel3_Bet2: @ 0x0812CA18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r4, _0812CA84
	ldr r2, [r4]
	movs r5, #0x36
	ldrsh r1, [r2, r5]
	cmp r1, #0
	beq _0812CAB4
	ldrh r3, [r2, #0x34]
	movs r5, #0x34
	ldrsh r0, [r2, r5]
	cmp r0, r1
	bne _0812CAB4
	ldrb r1, [r2, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0812CAB4
	ldrh r1, [r2, #0x2e]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [r4]
	ldrh r1, [r0, #0x36]
	ldrh r0, [r0, #0x30]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r7, #0
	adds r1, r6, #0
	bl AreTagsMixed77
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812CAB4
	movs r5, #0
	b _0812CA8E
	.align 2, 0
_0812CA84: .4byte 0x0203A800
_0812CA88:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0812CA8E:
	lsls r6, r5, #0x10
	asrs r5, r6, #0x10
	cmp r5, #4
	bgt _0812CAB4
	ldr r0, _0812CB48
	ldr r0, [r0]
	ldrh r1, [r0, #0x36]
	subs r1, r1, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r7, r4
	bne _0812CA88
	lsrs r6, r6, #0x10
	str r6, [sp]
_0812CAB4:
	ldr r0, _0812CB48
	mov sb, r0
_0812CAB8:
	movs r5, #1
	movs r1, #0
	mov r8, r1
	ldr r2, [sp]
	lsls r2, r2, #0x10
	mov sl, r2
_0812CAC4:
	mov r1, sb
	ldr r0, [r1]
	ldrh r1, [r0, #0x2e]
	lsls r5, r5, #0x10
	asrs r4, r5, #0x10
	subs r1, r4, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r2, sb
	ldr r0, [r2]
	ldrh r1, [r0, #0x30]
	subs r1, r4, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, sl
	asrs r0, r1, #0x10
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #2
	adds r1, r4, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl TagsDontMatchOrHaveAny7s
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812CB4C
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl AreTagsMixed777
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812CB38
	mov r2, sb
	ldr r0, [r2]
	ldrb r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0812CB4C
_0812CB38:
	mov r5, r8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	mov r8, r0
	b _0812CB5A
	.align 2, 0
_0812CB48: .4byte 0x0203A800
_0812CB4C:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r5, r2
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0812CAC4
_0812CB5A:
	mov r5, r8
	cmp r5, #0
	beq _0812CB70
	ldr r1, [sp]
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	str r0, [sp]
	b _0812CAB8
_0812CB70:
	ldr r0, _0812CB8C
	ldr r0, [r0]
	mov r5, sp
	ldrh r5, [r5]
	strh r5, [r0, #0x32]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812CB8C: .4byte 0x0203A800
	thumb_func_end DecideReelTurns_NoBiasTag_Reel3_Bet2

	thumb_func_start DecideReelTurns_NoBiasTag_Reel3_Bet3
DecideReelTurns_NoBiasTag_Reel3_Bet3: @ 0x0812CB90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl DecideReelTurns_NoBiasTag_Reel3_Bet2
	ldr r4, _0812CC34
	ldr r2, [r4]
	movs r0, #0x36
	ldrsh r1, [r2, r0]
	cmp r1, #0
	beq _0812CC44
	ldrh r3, [r2, #0x34]
	movs r5, #0x34
	ldrsh r0, [r2, r5]
	cmp r0, r1
	beq _0812CC44
	ldrb r1, [r2, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0812CC44
	ldrh r1, [r2, #0x2e]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r4]
	ldrh r1, [r0, #0x36]
	ldrh r0, [r0, #0x30]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	bl AreTagsMixed77
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812CC44
	movs r1, #1
	ldr r0, [r4]
	movs r2, #0x34
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _0812CBFE
	movs r1, #3
_0812CBFE:
	movs r3, #0
	lsls r1, r1, #0x10
	mov r8, r1
	adds r7, r4, #0
_0812CC06:
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	lsls r0, r3, #0x10
	asrs r5, r0, #0x10
	adds r2, r5, r2
	mov r0, r8
	asrs r1, r0, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r6, r4
	bne _0812CC38
	ldr r1, [r7]
	ldrh r0, [r1, #0x32]
	adds r0, r5, r0
	strh r0, [r1, #0x32]
	b _0812CC44
	.align 2, 0
_0812CC34: .4byte 0x0203A800
_0812CC38:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0812CC06
_0812CC44:
	ldr r7, _0812CCC0
_0812CC46:
	ldr r0, [r7]
	ldrh r0, [r0, #0x2e]
	movs r1, #1
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r7]
	ldrh r0, [r0, #0x30]
	movs r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r7]
	ldrh r0, [r0, #0x32]
	movs r1, #3
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl TagsDontMatchOrHaveAny7s
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812CCC4
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl AreTagsMixed777
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812CCB4
	ldr r0, [r7]
	ldrb r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0812CCC4
_0812CCB4:
	ldr r1, [r7]
	ldrh r0, [r1, #0x32]
	adds r0, #1
	strh r0, [r1, #0x32]
	b _0812CC46
	.align 2, 0
_0812CCC0: .4byte 0x0203A800
_0812CCC4:
	ldr r7, _0812CD40
_0812CCC6:
	ldr r0, [r7]
	ldrh r0, [r0, #0x2e]
	movs r1, #3
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r7]
	ldrh r0, [r0, #0x30]
	movs r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r7]
	ldrh r0, [r0, #0x32]
	movs r1, #1
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #2
	bl GetNearbyTag
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl TagsDontMatchOrHaveAny7s
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812CD44
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl AreTagsMixed777
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812CD34
	ldr r0, [r7]
	ldrb r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0812CD44
_0812CD34:
	ldr r1, [r7]
	ldrh r0, [r1, #0x32]
	adds r0, #1
	strh r0, [r1, #0x32]
	b _0812CCC6
	.align 2, 0
_0812CD40: .4byte 0x0203A800
_0812CD44:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DecideReelTurns_NoBiasTag_Reel3_Bet3

	thumb_func_start sub_0812CD50
sub_0812CD50: @ 0x0812CD50
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0812CD7C
	adds r0, r5, #0
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812CD80
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0x26]
	bl _call_via_r5
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812CD7C: .4byte 0x0812CD85
_0812CD80: .4byte 0x03005B60
	thumb_func_end sub_0812CD50

	thumb_func_start sub_0812CD84
sub_0812CD84: @ 0x0812CD84
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _0812CDAC
	ldr r2, _0812CDB0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r4, #8
	ldrsh r2, [r0, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	pop {r4}
	thumb_func_end sub_0812CD84

	thumb_func_start sub_0812CDA8
sub_0812CDA8: @ 0x0812CDA8
	pop {r0}
	bx r0
	.align 2, 0
_0812CDAC: .4byte 0x085844C8
_0812CDB0: .4byte 0x03005B60
	thumb_func_end sub_0812CDA8

	thumb_func_start sub_0812CDB4
sub_0812CDB4: @ 0x0812CDB4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0812CDE4
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x73
	str r1, [sp]
	movs r1, #0x62
	movs r2, #0x63
	movs r3, #0x72
	bl sub_0812FA9C
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CDE4: .4byte 0x085844D4
	thumb_func_end sub_0812CDB4

	thumb_func_start sub_0812CDE8
sub_0812CDE8: @ 0x0812CDE8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _0812CE00
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0812CE00:
	pop {r0}
	bx r0
	thumb_func_end sub_0812CDE8

	thumb_func_start sub_0812CE04
sub_0812CE04: @ 0x0812CE04
	push {r4, lr}
	sub sp, #4
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0812CE38
	movs r2, #0x26
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x53
	str r1, [sp]
	movs r1, #0x42
	movs r2, #0x43
	movs r3, #0x52
	bl sub_0812FA9C
	adds r0, r4, #0
	bl DestroyTask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CE38: .4byte 0x085844D4
	thumb_func_end sub_0812CE04

	thumb_func_start LoadLitTile
LoadLitTile: @ 0x0812CE3C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812CE5C
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, _0812CE60
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	movs r2, #2
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0812CE5C: .4byte 0x0858550C
_0812CE60: .4byte 0x08585534
	thumb_func_end LoadLitTile

	thumb_func_start sub_0812CE64
sub_0812CE64: @ 0x0812CE64
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812CE84
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, _0812CE88
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	movs r2, #2
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0812CE84: .4byte 0x08585520
_0812CE88: .4byte 0x08585534
	thumb_func_end sub_0812CE64

	thumb_func_start LoadBetTiles
LoadBetTiles: @ 0x0812CE8C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r4, #0
	ldr r0, _0812CEC0
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0812CEB8
	ldr r7, _0812CEC4
	adds r6, r0, #0
	lsls r5, r1, #1
_0812CEA4:
	adds r0, r4, r5
	adds r0, r0, r7
	ldrb r0, [r0]
	bl LoadLitTile
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0812CEA4
_0812CEB8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812CEC0: .4byte 0x0858553F
_0812CEC4: .4byte 0x08585539
	thumb_func_end LoadBetTiles

	thumb_func_start sub_0812CEC8
sub_0812CEC8: @ 0x0812CEC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r4, #0
	ldr r0, _0812CEFC
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0812CEF4
	ldr r7, _0812CF00
	adds r6, r0, #0
	lsls r5, r1, #1
_0812CEE0:
	adds r0, r4, r5
	adds r0, r0, r7
	ldrb r0, [r0]
	bl sub_0812CE64
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0812CEE0
_0812CEF4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812CEFC: .4byte 0x0858553F
_0812CF00: .4byte 0x08585539
	thumb_func_end sub_0812CEC8

	thumb_func_start sub_0812CF04
sub_0812CF04: @ 0x0812CF04
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _0812CF38
_0812CF0A:
	ldr r0, _0812CF3C
	bl CreateInvisibleSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	strh r4, [r1, #0x2e]
	ldr r1, _0812CF40
	ldr r1, [r1]
	adds r1, #0x44
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0812CF0A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812CF38: .4byte 0x020205AC
_0812CF3C: .4byte 0x0812D035
_0812CF40: .4byte 0x0203A800
	thumb_func_end sub_0812CF04

	thumb_func_start sub_0812CF44
sub_0812CF44: @ 0x0812CF44
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0812CF74
	ldr r1, [r1]
	adds r1, #0x44
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812CF78
	adds r0, r0, r1
	movs r2, #0
	movs r1, #1
	strh r1, [r0, #0x30]
	movs r1, #4
	strh r1, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r2, [r0, #0x36]
	movs r1, #2
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3c]
	bx lr
	.align 2, 0
_0812CF74: .4byte 0x0203A800
_0812CF78: .4byte 0x020205AC
	thumb_func_end sub_0812CF44

	thumb_func_start sub_0812CF7C
sub_0812CF7C: @ 0x0812CF7C
	push {r4, r5, lr}
	movs r2, #0
	ldr r0, _0812CFAC
	ldr r0, [r0]
	adds r3, r0, #0
	adds r3, #0x44
	ldr r4, _0812CFB0
_0812CF8A:
	adds r0, r3, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	movs r5, #0x30
	ldrsh r0, [r1, r5]
	cmp r0, #0
	beq _0812CFB4
	movs r5, #0x32
	ldrsh r0, [r1, r5]
	cmp r0, #0
	beq _0812CFB4
	movs r0, #0
	b _0812CFC0
	.align 2, 0
_0812CFAC: .4byte 0x0203A800
_0812CFB0: .4byte 0x020205AC
_0812CFB4:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _0812CF8A
	movs r0, #1
_0812CFC0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0812CF7C

	thumb_func_start sub_0812CFC8
sub_0812CFC8: @ 0x0812CFC8
	push {r4, lr}
	movs r4, #0
_0812CFCC:
	ldr r0, _0812CFE4
	ldr r0, [r0]
	adds r0, #0x44
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_0812CFFC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812CFE8
	movs r0, #0
	b _0812CFF4
	.align 2, 0
_0812CFE4: .4byte 0x0203A800
_0812CFE8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0812CFCC
	movs r0, #1
_0812CFF4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0812CFC8

	thumb_func_start sub_0812CFFC
sub_0812CFFC: @ 0x0812CFFC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0812D018
	adds r1, r1, r0
	movs r2, #0x30
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0812D01C
	movs r0, #1
	b _0812D02E
	.align 2, 0
_0812D018: .4byte 0x020205AC
_0812D01C:
	ldrh r2, [r1, #0x3c]
	movs r3, #0x3c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0812D02A
	movs r0, #0
	strh r0, [r1, #0x30]
_0812D02A:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
_0812D02E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0812CFFC

	thumb_func_start sub_0812D034
sub_0812D034: @ 0x0812D034
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	movs r1, #0x30
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0812D0B6
	ldrh r0, [r2, #0x34]
	subs r0, #1
	strh r0, [r2, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0812D09E
	movs r0, #0
	strh r0, [r2, #0x3c]
	movs r6, #1
	strh r6, [r2, #0x34]
	ldrh r1, [r2, #0x38]
	ldrh r3, [r2, #0x36]
	adds r0, r1, r3
	strh r0, [r2, #0x36]
	movs r4, #4
	ldrh r5, [r2, #0x32]
	movs r7, #0x32
	ldrsh r3, [r2, r7]
	cmp r3, #0
	beq _0812D070
	movs r4, #8
_0812D070:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bgt _0812D088
	strh r6, [r2, #0x3c]
	rsbs r0, r1, #0
	strh r0, [r2, #0x38]
	cmp r3, #0
	beq _0812D09E
	subs r0, r5, #1
	strh r0, [r2, #0x32]
	b _0812D090
_0812D088:
	cmp r0, r4
	blt _0812D090
	rsbs r0, r1, #0
	strh r0, [r2, #0x38]
_0812D090:
	movs r1, #0x32
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0812D09E
	ldrh r0, [r2, #0x34]
	lsls r0, r0, #1
	strh r0, [r2, #0x34]
_0812D09E:
	ldr r1, _0812D0BC
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrh r3, [r2, #0x36]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r1, r3, #0
	adds r2, r3, #0
	bl MultiplyPaletteRGBComponents
_0812D0B6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812D0BC: .4byte 0x08585534
	thumb_func_end sub_0812D034

	thumb_func_start sub_0812D0C0
sub_0812D0C0: @ 0x0812D0C0
	push {r4, lr}
	ldr r4, _0812D0E8
	adds r0, r4, #0
	movs r1, #6
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812D0EC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #1
	strh r2, [r1, #0xe]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D0E8: .4byte 0x0812D139
_0812D0EC: .4byte 0x03005B60
	thumb_func_end sub_0812D0C0

	thumb_func_start sub_0812D0F0
sub_0812D0F0: @ 0x0812D0F0
	push {lr}
	ldr r0, _0812D114
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0812D118
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0812D11C
	movs r0, #0
	b _0812D130
	.align 2, 0
_0812D114: .4byte 0x0812D139
_0812D118: .4byte 0x03005B60
_0812D11C:
	adds r0, r2, #0
	bl DestroyTask
	ldr r0, _0812D134
	ldr r0, [r0]
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	movs r0, #1
_0812D130:
	pop {r1}
	bx r1
	.align 2, 0
_0812D134: .4byte 0x085855B0
	thumb_func_end sub_0812D0F0

	thumb_func_start sub_0812D138
sub_0812D138: @ 0x0812D138
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0812D190
	adds r2, r1, r0
	ldrh r0, [r2, #0xa]
	subs r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0812D176
	movs r0, #4
	strh r0, [r2, #0xa]
	ldrh r1, [r2, #0xe]
	ldrh r3, [r2, #0xc]
	adds r0, r1, r3
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _0812D172
	cmp r0, #2
	bne _0812D176
_0812D172:
	rsbs r0, r1, #0
	strh r0, [r2, #0xe]
_0812D176:
	ldr r0, _0812D194
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0812D190: .4byte 0x03005B60
_0812D194: .4byte 0x085855A4
	thumb_func_end sub_0812D138

	thumb_func_start GameplayTask_PikaPower
GameplayTask_PikaPower: @ 0x0812D198
	push {lr}
	ldr r0, _0812D1B0
	movs r1, #8
	bl CreateTask
	ldr r1, _0812D1B4
	ldr r1, [r1]
	adds r1, #0x3e
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0812D1B0: .4byte 0x0812D241
_0812D1B4: .4byte 0x0203A800
	thumb_func_end GameplayTask_PikaPower

	thumb_func_start DisplayPikaPower
DisplayPikaPower: @ 0x0812D1B8
	push {r4, lr}
	ldr r0, _0812D1E4
	ldr r0, [r0]
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0812D1E8
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearTaskDataFields_2orHigher
	movs r1, #1
	strh r1, [r4, #8]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	strh r1, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D1E4: .4byte 0x0203A800
_0812D1E8: .4byte 0x03005B60
	thumb_func_end DisplayPikaPower

	thumb_func_start sub_0812D1EC
sub_0812D1EC: @ 0x0812D1EC
	push {r4, lr}
	ldr r0, _0812D214
	ldr r0, [r0]
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _0812D218
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearTaskDataFields_2orHigher
	movs r0, #3
	strh r0, [r4, #8]
	movs r0, #1
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D214: .4byte 0x0203A800
_0812D218: .4byte 0x03005B60
	thumb_func_end sub_0812D1EC

	thumb_func_start sub_0812D21C
sub_0812D21C: @ 0x0812D21C
	ldr r2, _0812D238
	ldr r0, _0812D23C
	ldr r0, [r0]
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0812D238: .4byte 0x03005B60
_0812D23C: .4byte 0x0203A800
	thumb_func_end sub_0812D21C

	thumb_func_start RunInfoBoxActions
RunInfoBoxActions: @ 0x0812D240
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _0812D268
	ldr r2, _0812D26C
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0812D268: .4byte 0x085844DC
_0812D26C: .4byte 0x03005B60
	thumb_func_end RunInfoBoxActions

	thumb_func_start sub_0812D270
sub_0812D270: @ 0x0812D270
	bx lr
	.align 2, 0
	thumb_func_end sub_0812D270

	thumb_func_start sub_0812D274
sub_0812D274: @ 0x0812D274
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #0x13
	movs r1, #0xa0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	asrs r0, r0, #0x10
	movs r1, #0x14
	bl sub_0812EF10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0812D274

	thumb_func_start sub_0812D29C
sub_0812D29C: @ 0x0812D29C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0812D2D0
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x3c
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0812D30C
	ldrh r1, [r4, #0xa]
	adds r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r3, #0
	movs r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #1
	bne _0812D2D4
	movs r3, #1
	movs r2, #1
	b _0812D2DC
	.align 2, 0
_0812D2D0: .4byte 0x020205AC
_0812D2D4:
	cmp r1, #0x10
	bne _0812D2DC
	movs r3, #2
	movs r2, #2
_0812D2DC:
	ldr r0, _0812D314
	ldr r0, [r0]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldr r2, _0812D318
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r3, r5, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xf
	adds r3, r3, r0
	lsrs r3, r3, #0x10
	movs r0, #2
	movs r2, #2
	bl LoadBgTilemap
	ldrb r0, [r4, #0xc]
	bl sub_0812EF7C
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0x26]
_0812D30C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812D314: .4byte 0x0203A798
_0812D318: .4byte 0x085844EC
	thumb_func_end sub_0812D29C

	thumb_func_start sub_0812D31C
sub_0812D31C: @ 0x0812D31C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0xa]
	adds r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r3, #0
	movs r2, #3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #1
	bne _0812D33A
	movs r3, #1
	movs r2, #1
	b _0812D342
_0812D33A:
	cmp r1, #0x10
	bne _0812D342
	movs r3, #2
	movs r2, #2
_0812D342:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0812D376
	ldr r0, _0812D39C
	ldr r0, [r0]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldr r0, _0812D3A0
	lsls r2, r3, #2
	adds r0, #2
	adds r2, r2, r0
	ldrh r0, [r2]
	strh r0, [r1]
	lsls r3, r5, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xf
	adds r3, r3, r0
	lsrs r3, r3, #0x10
	movs r0, #2
	movs r2, #2
	bl LoadBgTilemap
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
_0812D376:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _0812D388
	movs r0, #0
	strh r0, [r4, #0xc]
_0812D388:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0812D394
	strh r0, [r4, #8]
	strh r0, [r4, #0x26]
_0812D394:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812D39C: .4byte 0x0203A798
_0812D3A0: .4byte 0x085844EC
	thumb_func_end sub_0812D31C

	thumb_func_start ClearTaskDataFields_2orHigher
ClearTaskDataFields_2orHigher: @ 0x0812D3A4
	push {lr}
	movs r1, #2
	adds r2, r0, #0
	adds r2, #8
	movs r3, #0
_0812D3AE:
	lsls r0, r1, #1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0812D3AE
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearTaskDataFields_2orHigher

	thumb_func_start sub_0812D3C4
sub_0812D3C4: @ 0x0812D3C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #3
	movs r5, #0
	cmp r5, r6
	bge _0812D42E
	ldr r7, _0812D3E8
_0812D3D4:
	movs r3, #0
	movs r1, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _0812D3EC
	movs r3, #1
	movs r1, #1
	b _0812D3F4
	.align 2, 0
_0812D3E8: .4byte 0x085844EC
_0812D3EC:
	cmp r0, #0xf
	bne _0812D3F4
	movs r3, #2
	movs r1, #2
_0812D3F4:
	ldr r0, _0812D448
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	lsls r0, r3, #2
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r3, r4, #0x10
	asrs r4, r3, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xf
	adds r3, r3, r0
	lsrs r3, r3, #0x10
	movs r0, #2
	movs r2, #2
	bl LoadBgTilemap
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	blt _0812D3D4
_0812D42E:
	lsls r2, r5, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0xf
	bgt _0812D494
	ldr r7, _0812D44C
_0812D438:
	movs r3, #0
	movs r1, #3
	asrs r0, r2, #0x10
	cmp r0, #0
	bne _0812D450
	movs r3, #1
	movs r1, #1
	b _0812D458
	.align 2, 0
_0812D448: .4byte 0x0203A798
_0812D44C: .4byte 0x085844EE
_0812D450:
	cmp r0, #0xf
	bne _0812D458
	movs r3, #2
	movs r1, #2
_0812D458:
	ldr r0, _0812D4B0
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	lsls r0, r3, #2
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r3, r4, #0x10
	asrs r4, r3, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xf
	adds r3, r3, r0
	lsrs r3, r3, #0x10
	movs r0, #2
	movs r2, #2
	bl LoadBgTilemap
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r5, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0xf
	ble _0812D438
_0812D494:
	ldr r2, _0812D4B4
	ldr r0, _0812D4B8
	ldr r0, [r0]
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r6, [r0, #0xa]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812D4B0: .4byte 0x0203A798
_0812D4B4: .4byte 0x03005B60
_0812D4B8: .4byte 0x0203A800
	thumb_func_end sub_0812D3C4

	thumb_func_start BeginReeltime
BeginReeltime: @ 0x0812D4BC
	push {r4, lr}
	ldr r4, _0812D4D8
	adds r0, r4, #0
	movs r1, #7
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D4D8: .4byte 0x0812D4FD
	thumb_func_end BeginReeltime

	thumb_func_start IsFinalTask_RunReelTimeActions
IsFinalTask_RunReelTimeActions: @ 0x0812D4DC
	push {lr}
	ldr r0, _0812D4F0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0812D4F4
	movs r0, #0
	b _0812D4F6
	.align 2, 0
_0812D4F0: .4byte 0x0812D4FD
_0812D4F4:
	movs r0, #1
_0812D4F6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsFinalTask_RunReelTimeActions

	thumb_func_start RunReeltimeActions
RunReeltimeActions: @ 0x0812D4FC
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _0812D524
	ldr r2, _0812D528
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0812D524: .4byte 0x085844F8
_0812D528: .4byte 0x03005B60
	thumb_func_end RunReeltimeActions

	thumb_func_start ReeltimeAction0
ReeltimeAction0: @ 0x0812D52C
	push {lr}
	ldr r3, _0812D598
	ldr r1, [r3]
	movs r2, #0
	strb r2, [r1, #0xa]
	ldr r1, [r3]
	strh r2, [r1, #0x14]
	strh r2, [r1, #0x16]
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	movs r1, #0x1e
	strh r1, [r0, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #3
	strh r1, [r0, #0x10]
	ldr r0, _0812D59C
	strh r2, [r0]
	ldr r0, _0812D5A0
	strh r2, [r0]
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl sub_0812DC18
	bl sub_0812E484
	bl sub_0812E34C
	bl sub_0812E660
	bl sub_0812E71C
	bl sub_0812E7DC
	bl GetReeltimeDraw
	bl StopMapMusic
	movs r0, #0xc4
	lsls r0, r0, #1
	bl PlayNewMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_0812D598: .4byte 0x0203A800
_0812D59C: .4byte 0x02021B38
_0812D5A0: .4byte 0x02021B3A
	thumb_func_end ReeltimeAction0

	thumb_func_start ReeltimeAction1
ReeltimeAction1: @ 0x0812D5A4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0812D614
	ldrh r0, [r1]
	subs r0, #8
	strh r0, [r1]
	ldrh r1, [r4, #0xa]
	adds r1, #8
	strh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	adds r0, #0xf0
	movs r2, #0xff
	ands r0, r2
	lsrs r5, r0, #3
	ldr r0, _0812D618
	ands r1, r0
	movs r0, #0x14
	bl SetGpuReg
	adds r2, r5, #0
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r2, r0
	beq _0812D5F2
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0x12
	bgt _0812D5F2
	strh r5, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	strh r0, [r4, #0xe]
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	bl sub_0812DC18
_0812D5F2:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xc7
	ble _0812D604
	ldrh r0, [r4, #8]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #8]
	strh r1, [r4, #0xe]
_0812D604:
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl AdvanceReeltimeReel
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812D614: .4byte 0x02021B38
_0812D618: .4byte 0x000001FF
	thumb_func_end ReeltimeAction1

	thumb_func_start ReeltimeAction2
ReeltimeAction2: @ 0x0812D61C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl AdvanceReeltimeReel
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble _0812D646
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	bl CreateReelTimeSprites1
	bl CreateReelTimeSprite2
_0812D646:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ReeltimeAction2

	thumb_func_start ReeltimeAction3
ReeltimeAction3: @ 0x0812D64C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r1, _0812D6E8
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r0, sp, #4
	mov r8, r0
	ldr r1, _0812D6EC
	movs r2, #8
	bl memcpy
	add r6, sp, #0xc
	ldr r1, _0812D6F0
	adds r0, r6, #0
	movs r2, #8
	bl memcpy
	ldrh r0, [r7, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl AdvanceReeltimeReel
	ldrh r0, [r7, #0x10]
	subs r0, #4
	strh r0, [r7, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r5, #4
	subs r5, r5, r0
	lsls r4, r5, #1
	add r8, r4
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_0812EA54
	adds r6, r6, r4
	movs r1, #0
	ldrsh r0, [r6, r1]
	bl sub_0812EBBC
	ldr r0, _0812D6F4
	ldr r0, [r0]
	adds r0, #0x3f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812D6F8
	adds r0, r0, r1
	mov r2, sp
	adds r1, r2, r5
	ldrb r1, [r1]
	bl StartSpriteAnimIfDifferent
	movs r1, #0x10
	ldrsh r0, [r7, r1]
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0812D6DC
	ldrh r0, [r7, #8]
	adds r0, #1
	strh r0, [r7, #8]
	strh r1, [r7, #0x10]
	movs r0, #0
	strh r0, [r7, #0x12]
_0812D6DC:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812D6E8: .4byte 0x08584544
_0812D6EC: .4byte 0x08584548
_0812D6F0: .4byte 0x08584550
_0812D6F4: .4byte 0x0203A800
_0812D6F8: .4byte 0x020205AC
	thumb_func_end ReeltimeAction3

	thumb_func_start ReeltimeAction4
ReeltimeAction4: @ 0x0812D6FC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl AdvanceReeltimeReel
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	ble _0812D740
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0x12]
	movs r0, #2
	bl sub_0812EBBC
	ldr r0, _0812D748
	ldr r0, [r0]
	adds r0, #0x3f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812D74C
	adds r0, r0, r1
	movs r1, #3
	bl StartSpriteAnimIfDifferent
_0812D740:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D748: .4byte 0x0203A800
_0812D74C: .4byte 0x020205AC
	thumb_func_end ReeltimeAction4

	thumb_func_start ReeltimeAction5
ReeltimeAction5: @ 0x0812D750
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl AdvanceReeltimeReel
	ldrb r0, [r4, #0x10]
	adds r0, #0x80
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	ble _0812D77C
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0x12]
_0812D77C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ReeltimeAction5

	thumb_func_start ReeltimeAction6
ReeltimeAction6: @ 0x0812D784
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl AdvanceReeltimeReel
	ldrb r0, [r4, #0x10]
	adds r0, #0x40
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	ble _0812D7EC
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, _0812D7C4
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	cmp r0, #0
	beq _0812D7C8
	ldrb r1, [r1, #0xa]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _0812D7E6
	ldrh r0, [r4, #8]
	adds r0, #1
	b _0812D7E4
	.align 2, 0
_0812D7C4: .4byte 0x0203A800
_0812D7C8:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #3
	ble _0812D7D6
	ldrh r0, [r4, #8]
	adds r0, #1
	b _0812D7E4
_0812D7D6:
	ldrh r0, [r4, #0x14]
	bl SkipToReeltimeAction14
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812D7E6
	movs r0, #0xe
_0812D7E4:
	strh r0, [r4, #8]
_0812D7E6:
	ldrh r0, [r4, #0x14]
	adds r0, #1
	strh r0, [r4, #0x14]
_0812D7EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ReeltimeAction6

	thumb_func_start ReelTimeAction_LandOnOutcome
ReelTimeAction_LandOnOutcome: @ 0x0812D7F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0812D81C
	ldr r0, [r6]
	movs r1, #0x14
	ldrsh r0, [r0, r1]
	movs r1, #0x14
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r0, #0
	beq _0812D820
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl AdvanceReeltimeReelToNextTag
	b _0812D848
	.align 2, 0
_0812D81C: .4byte 0x0203A800
_0812D820:
	movs r0, #1
	bl GetNearbyReelTimeTag
	ldr r1, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #5]
	cmp r0, r1
	beq _0812D852
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	bl AdvanceReeltimeReel
	ldr r0, [r6]
	movs r1, #0x14
	ldrsh r0, [r0, r1]
	movs r1, #0x14
	bl __modsi3
_0812D848:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r0, [r4, #0x10]
	adds r0, #0x40
	strh r0, [r4, #0x10]
_0812D852:
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	bne _0812D876
	movs r0, #1
	bl GetNearbyReelTimeTag
	ldr r1, _0812D87C
	ldr r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #5]
	cmp r0, r1
	bne _0812D876
	strh r5, [r4, #0x10]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0812D876:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812D87C: .4byte 0x0203A800
	thumb_func_end ReelTimeAction_LandOnOutcome

	thumb_func_start ReeltimeAction8
ReeltimeAction8: @ 0x0812D880
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble _0812D924
	bl StopMapMusic
	bl sub_0812EA8C
	bl sub_0812EBDC
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldr r5, _0812D8D4
	ldr r1, [r5]
	ldrb r0, [r1, #5]
	cmp r0, #0
	bne _0812D8E0
	movs r0, #0xa0
	strh r0, [r4, #0x10]
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812D8D8
	adds r0, r0, r1
	movs r1, #5
	bl StartSpriteAnimIfDifferent
	ldr r0, _0812D8DC
	bl PlayFanfare
	b _0812D924
	.align 2, 0
_0812D8D4: .4byte 0x0203A800
_0812D8D8: .4byte 0x020205AC
_0812D8DC: .4byte 0x00000187
_0812D8E0:
	movs r0, #0xc0
	strh r0, [r4, #0x10]
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0812D92C
	adds r0, r0, r4
	movs r1, #4
	bl StartSpriteAnimIfDifferent
	ldr r0, [r5]
	adds r0, #0x3f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x2b
	strb r6, [r0]
	ldr r0, [r5]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0812D91C
	bl sub_0812D1EC
	ldr r0, [r5]
	strb r6, [r0, #2]
_0812D91C:
	movs r0, #0xc3
	lsls r0, r0, #1
	bl PlayFanfare
_0812D924:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812D92C: .4byte 0x020205AC
	thumb_func_end ReeltimeAction8

	thumb_func_start ReeltimeAction9
ReeltimeAction9: @ 0x0812D930
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0812D948
	subs r0, r1, #1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0812D958
_0812D948:
	bl sub_0812D21C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0812D958
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0812D958:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ReeltimeAction9

	thumb_func_start ReeltimeAction10
ReeltimeAction10: @ 0x0812D960
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0812D9A0
	ldrh r0, [r1]
	subs r0, #8
	strh r0, [r1]
	ldrh r1, [r4, #0xa]
	adds r1, #8
	strh r1, [r4, #0xa]
	ldrh r0, [r4, #0xe]
	adds r0, #8
	strh r0, [r4, #0xe]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	subs r0, #8
	movs r2, #0xff
	ands r0, r2
	lsrs r5, r0, #3
	ldr r0, _0812D9A4
	ands r1, r0
	movs r0, #0x14
	bl SetGpuReg
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	cmp r0, #0x19
	bgt _0812D9A8
	adds r0, r5, #0
	bl sub_0812DC60
	b _0812D9AE
	.align 2, 0
_0812D9A0: .4byte 0x02021B38
_0812D9A4: .4byte 0x000001FF
_0812D9A8:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0812D9AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end ReeltimeAction10

	thumb_func_start ReeltimeAction11
ReeltimeAction11: @ 0x0812D9B4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _0812DA08
	ldr r0, [r4]
	movs r6, #0
	strb r6, [r0, #0xb]
	ldr r1, [r4]
	ldrb r0, [r1, #5]
	strb r0, [r1, #0xa]
	ldr r0, _0812DA0C
	strh r6, [r0]
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	ldr r1, [r4]
	movs r0, #8
	strh r0, [r1, #0x1a]
	bl sub_0812E3F8
	bl sub_0812E83C
	bl sub_0812E8D4
	ldr r0, [r4]
	adds r0, #0x60
	ldrh r0, [r0]
	bl PlayNewMapMusic
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _0812DA14
	ldr r0, _0812DA10
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	b _0812DA2A
	.align 2, 0
_0812DA08: .4byte 0x0203A800
_0812DA0C: .4byte 0x02021B38
_0812DA10: .4byte 0x0812D4FD
_0812DA14:
	movs r0, #4
	bl sub_0812DEF4
	bl SlowReelSpeed
	strh r0, [r5, #0xa]
	strh r6, [r5, #0xc]
	strh r6, [r5, #0xe]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_0812DA2A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ReeltimeAction11

	thumb_func_start ReeltimeAction12
ReeltimeAction12: @ 0x0812DA30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0812DA4C
	ldr r5, [r0]
	movs r0, #0x1a
	ldrsh r1, [r5, r0]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0812DA50
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0812DA76
	.align 2, 0
_0812DA4C: .4byte 0x0203A800
_0812DA50:
	movs r1, #0x1c
	ldrsh r0, [r5, r1]
	movs r1, #0x18
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0812DA76
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0812DA76
	ldrh r0, [r5, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x1a]
_0812DA76:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end ReeltimeAction12

	thumb_func_start ReeltimeAction13
ReeltimeAction13: @ 0x0812DA7C
	push {lr}
	bl sub_0812E064
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812DA96
	ldr r0, _0812DA9C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_0812DA96:
	pop {r0}
	bx r0
	.align 2, 0
_0812DA9C: .4byte 0x0812D4FD
	thumb_func_end ReeltimeAction13

	thumb_func_start ReeltimeAction14
ReeltimeAction14: @ 0x0812DAA0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0812E83C
	bl sub_0812EA8C
	bl sub_0812EBDC
	bl sub_0812EC30
	ldr r5, _0812DB08
	ldr r3, _0812DB0C
	ldr r0, [r3]
	adds r0, #0x4e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0x3f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #5
	bl StartSpriteAnimIfDifferent
	ldrh r0, [r4, #8]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #8]
	movs r0, #4
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	bl StopMapMusic
	ldr r0, _0812DB10
	bl PlayFanfare
	movs r0, #0xb2
	bl PlaySE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812DB08: .4byte 0x020205AC
_0812DB0C: .4byte 0x0203A800
_0812DB10: .4byte 0x00000187
	thumb_func_end ReeltimeAction14

	thumb_func_start ReeltimeAction15
ReeltimeAction15: @ 0x0812DB14
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0812DB90
	ldrh r0, [r4, #0x10]
	strh r0, [r1]
	ldrh r1, [r4, #0x10]
	movs r0, #0x16
	bl SetGpuReg
	ldrh r1, [r4, #0x12]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812DB36
	ldrh r0, [r4, #0x10]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_0812DB36:
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0812DB4C
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x10]
_0812DB4C:
	movs r0, #0x10
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _0812DB8A
	bl sub_0812EC80
	bl sub_0812ECA4
	bl sub_0812E5B8
	bl sub_0812EDD0
	ldr r2, _0812DB94
	ldr r0, _0812DB98
	ldr r0, [r0]
	adds r0, #0x4e
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
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	strh r5, [r4, #0x12]
_0812DB8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812DB90: .4byte 0x02021B3A
_0812DB94: .4byte 0x020205AC
_0812DB98: .4byte 0x0203A800
	thumb_func_end ReeltimeAction15

	thumb_func_start ReeltimeAction16
ReeltimeAction16: @ 0x0812DB9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0812DBC8
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	bl sub_0812EEB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0812DBC2
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	bl sub_0812EEDC
_0812DBC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DBC8: .4byte 0x02021B3A
	thumb_func_end ReeltimeAction16

	thumb_func_start ReeltimeAction17
ReeltimeAction17: @ 0x0812DBCC
	push {lr}
	ldr r1, _0812DC0C
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	ldr r0, _0812DC10
	ldr r0, [r0]
	adds r0, #0x60
	ldrh r0, [r0]
	bl PlayNewMapMusic
	bl sub_0812E3F8
	bl sub_0812E908
	bl sub_0812E8D4
	bl sub_0812ED9C
	ldr r0, _0812DC14
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_0812DC0C: .4byte 0x02021B38
_0812DC10: .4byte 0x0203A800
_0812DC14: .4byte 0x0812D4FD
	thumb_func_end ReeltimeAction17

	thumb_func_start sub_0812DC18
sub_0812DC18: @ 0x0812DC18
	push {r4, r5, r6, lr}
	movs r2, #4
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
_0812DC24:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	subs r0, r4, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r6, r1
	lsls r1, r1, #1
	ldr r0, _0812DC5C
	adds r1, r1, r0
	lsls r3, r4, #5
	adds r3, r5, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	movs r2, #2
	bl LoadBgTilemap
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0xe
	ble _0812DC24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812DC5C: .4byte 0x08587F9C
	thumb_func_end sub_0812DC18

	thumb_func_start sub_0812DC60
sub_0812DC60: @ 0x0812DC60
	push {r4, r5, lr}
	movs r4, #4
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
_0812DC68:
	lsls r3, r4, #5
	adds r3, r5, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	ldr r1, _0812DC8C
	movs r2, #2
	bl LoadBgTilemap
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xe
	bls _0812DC68
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812DC8C: .4byte 0x08588604
	thumb_func_end sub_0812DC60

	thumb_func_start OpenInfoBox
OpenInfoBox: @ 0x0812DC90
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0812DCBC
	adds r0, r5, #0
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812DCC0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xa]
	bl _call_via_r5
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812DCBC: .4byte 0x0812DCE5
_0812DCC0: .4byte 0x03005B60
	thumb_func_end OpenInfoBox

	thumb_func_start IsInfoBoxClosed
IsInfoBoxClosed: @ 0x0812DCC4
	push {lr}
	ldr r0, _0812DCD8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0812DCDC
	movs r0, #0
	b _0812DCDE
	.align 2, 0
_0812DCD8: .4byte 0x0812DCE5
_0812DCDC:
	movs r0, #1
_0812DCDE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsInfoBoxClosed

	thumb_func_start sub_0812DCE4
sub_0812DCE4: @ 0x0812DCE4
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _0812DD0C
	ldr r2, _0812DD10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0812DD0C: .4byte 0x08584558
_0812DD10: .4byte 0x03005B60
	thumb_func_end sub_0812DCE4

	thumb_func_start InfoBox_FadeIn
InfoBox_FadeIn: @ 0x0812DD14
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end InfoBox_FadeIn

	thumb_func_start InfoBox_WaitForFade
InfoBox_WaitForFade: @ 0x0812DD38
	push {lr}
	adds r2, r0, #0
	ldr r0, _0812DD54
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0812DD4E
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_0812DD4E:
	pop {r0}
	bx r0
	.align 2, 0
_0812DD54: .4byte 0x02037C74
	thumb_func_end InfoBox_WaitForFade

	thumb_func_start InfoBox_8104B80
InfoBox_8104B80: @ 0x0812DD58
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0812DFEC
	bl sub_0812FB18
	ldr r0, _0812DD84
	bl AddWindow
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DD84: .4byte 0x085843C8
	thumb_func_end InfoBox_8104B80

	thumb_func_start InfoBox_AddText
InfoBox_AddText: @ 0x0812DD88
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0812DDCC
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r0, _0812DDD0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812DDCC: .4byte 0x085843D0
_0812DDD0: .4byte 0x08588651
	thumb_func_end InfoBox_AddText

	thumb_func_start InfoBox_AwaitPlayerInput
InfoBox_AwaitPlayerInput: @ 0x0812DDD4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0812DE20
	ldrh r1, [r0, #0x2e]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0812DE18
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #1
	bl ClearWindowTilemap
	movs r0, #1
	movs r1, #1
	bl CopyWindowToVram
	movs r0, #1
	bl RemoveWindow
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0812DE18:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DE20: .4byte 0x03002360
	thumb_func_end InfoBox_AwaitPlayerInput

	thumb_func_start InfoBox_812DE14
InfoBox_812DE14: @ 0x0812DE24
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0812F978
	movs r0, #3
	bl ShowBg
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InfoBox_812DE14

	thumb_func_start InfoBox_812DE30
InfoBox_812DE30: @ 0x0812DE40
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xa]
	bl sub_0812DEF4
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InfoBox_812DE30

	thumb_func_start InfoBox_8104BFC
InfoBox_8104BFC: @ 0x0812DE58
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0812DE88
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	bl sub_0812D3C4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DE88: .4byte 0x0203A800
	thumb_func_end InfoBox_8104BFC

	thumb_func_start InfoBox_FreeTask
InfoBox_FreeTask: @ 0x0812DE8C
	push {lr}
	ldr r0, _0812DEA0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_0812DEA0: .4byte 0x0812DCE5
	thumb_func_end InfoBox_FreeTask

	thumb_func_start sub_0812DEA4
sub_0812DEA4: @ 0x0812DEA4
	push {lr}
	ldr r0, _0812DEE4
	movs r1, #3
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0812DEE8
	ldr r0, [r0]
	adds r0, #0x3d
	strb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0812DEEC
	adds r0, r0, r1
	ldr r1, _0812DEF0
	strh r1, [r0, #0xa]
	movs r1, #4
	adds r2, r0, #0
	adds r2, #8
	movs r3, #0x40
_0812DED0:
	lsls r0, r1, #1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0812DED0
	pop {r0}
	bx r0
	.align 2, 0
_0812DEE4: .4byte 0x0812E0C1
_0812DEE8: .4byte 0x0203A800
_0812DEEC: .4byte 0x03005B60
_0812DEF0: .4byte 0x0000FFFF
	thumb_func_end sub_0812DEA4

	thumb_func_start sub_0812DEF4
sub_0812DEF4: @ 0x0812DEF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_0812DFEC
	ldr r0, _0812DF6C
	ldr r0, [r0]
	adds r0, #0x3d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0812DF70
	adds r7, r0, r1
	strh r4, [r7, #0xa]
	movs r6, #0
	ldr r1, _0812DF74
	lsls r5, r4, #2
	adds r0, r5, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0812DF62
	mov r8, r1
_0812DF2A:
	mov r0, r8
	adds r4, r5, r0
	ldr r0, [r4]
	lsls r2, r6, #2
	adds r2, r2, r0
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	movs r3, #2
	ldrsh r2, [r2, r3]
	bl sub_0812EFA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r6, #4
	lsls r2, r2, #1
	adds r1, r7, #0
	adds r1, #8
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, [r4]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0812DF2A
_0812DF62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812DF6C: .4byte 0x0203A800
_0812DF70: .4byte 0x03005B60
_0812DF74: .4byte 0x08584988
	thumb_func_end sub_0812DEF4

	thumb_func_start sub_0812DF78
sub_0812DF78: @ 0x0812DF78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r1
	ldr r4, [sp, #0x1c]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0812DFCC
	ldr r0, [r0]
	adds r0, #0x3d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0812DFD0
	adds r0, r0, r1
	mov ip, r0
	movs r5, #4
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
_0812DFA6:
	lsls r0, r5, #1
	mov r1, ip
	adds r1, #8
	adds r4, r1, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	bne _0812DFD4
	str r6, [sp]
	adds r0, r7, #0
	mov r1, r8
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl sub_0812EFEC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	b _0812DFDE
	.align 2, 0
_0812DFCC: .4byte 0x0203A800
_0812DFD0: .4byte 0x03005B60
_0812DFD4:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0812DFA6
_0812DFDE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812DF78

	thumb_func_start sub_0812DFEC
sub_0812DFEC: @ 0x0812DFEC
	push {r4, r5, r6, lr}
	ldr r0, _0812E050
	ldr r0, [r0]
	adds r0, #0x3d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0812E054
	adds r4, r0, r1
	ldrh r1, [r4, #0xa]
	ldr r0, _0812E058
	cmp r1, r0
	beq _0812E018
	ldr r0, _0812E05C
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0812E018:
	movs r5, #4
	adds r6, r4, #0
	adds r6, #8
_0812E01E:
	lsls r0, r5, #1
	adds r4, r6, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	beq _0812E03E
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812E060
	adds r0, r0, r1
	bl DestroySprite
	movs r0, #0x40
	strh r0, [r4]
_0812E03E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0812E01E
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E050: .4byte 0x0203A800
_0812E054: .4byte 0x03005B60
_0812E058: .4byte 0x0000FFFF
_0812E05C: .4byte 0x085849A4
_0812E060: .4byte 0x020205AC
	thumb_func_end sub_0812DFEC

	thumb_func_start sub_0812E064
sub_0812E064: @ 0x0812E064
	push {r4, r5, lr}
	ldr r0, _0812E0A0
	ldr r0, [r0]
	adds r0, #0x3d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0812E0A4
	adds r0, r0, r1
	movs r2, #4
	adds r3, r0, #0
	adds r3, #8
	ldr r4, _0812E0A8
_0812E080:
	lsls r0, r2, #1
	adds r1, r3, r0
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0x40
	beq _0812E0AC
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r5, #0x3c
	ldrsh r0, [r1, r5]
	cmp r0, #0
	beq _0812E0AC
	movs r0, #0
	b _0812E0B8
	.align 2, 0
_0812E0A0: .4byte 0x0203A800
_0812E0A4: .4byte 0x03005B60
_0812E0A8: .4byte 0x020205AC
_0812E0AC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0812E080
	movs r0, #1
_0812E0B8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0812E064

	thumb_func_start sub_0812E0C0
sub_0812E0C0: @ 0x0812E0C0
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _0812E0E8
	ldr r2, _0812E0EC
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0812E0E8: .4byte 0x08584594
_0812E0EC: .4byte 0x03005B60
	thumb_func_end sub_0812E0C0

	thumb_func_start sub_0812E0F0
sub_0812E0F0: @ 0x0812E0F0
	bx lr
	.align 2, 0
	thumb_func_end sub_0812E0F0

	thumb_func_start sub_0812E0F4
sub_0812E0F4: @ 0x0812E0F4
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	movs r0, #0x30
_0812E0FA:
	movs r4, #0
	lsls r5, r0, #0x10
	lsls r7, r6, #0x10
_0812E100:
	ldr r0, _0812E158
	asrs r1, r5, #0x10
	movs r2, #0
	movs r3, #0xe
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0812E15C
	adds r1, r1, r0
	ldrb r0, [r1, #5]
	movs r2, #0xc
	orrs r0, r2
	strb r0, [r1, #5]
	strh r6, [r1, #0x2e]
	strh r4, [r1, #0x30]
	ldr r0, _0812E160
	strh r0, [r1, #0x34]
	lsls r0, r4, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	ble _0812E100
	movs r2, #0x80
	lsls r2, r2, #9
	adds r1, r7, r2
	movs r2, #0xa0
	lsls r2, r2, #0xe
	adds r0, r5, r2
	lsrs r0, r0, #0x10
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	ble _0812E0FA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812E158: .4byte 0x08584C64
_0812E15C: .4byte 0x020205AC
_0812E160: .4byte 0x0000FFFF
	thumb_func_end sub_0812E0F4

	thumb_func_start sub_0812E164
sub_0812E164: @ 0x0812E164
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0812E1D4
	ldr r4, [r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x1c
	adds r1, r1, r0
	ldrh r0, [r5, #0x30]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	movs r1, #0x78
	bl __modsi3
	strh r0, [r5, #0x32]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	lsls r1, r1, #1
	adds r4, #0x22
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #0x1c
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	ldrh r4, [r5, #0x2e]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r1, #0x18
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl GetNearbyTag_Quantized
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetSpriteTileStartByTag
	adds r1, r5, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	bl SetSpriteSheetFrameTileNum
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812E1D4: .4byte 0x0203A800
	thumb_func_end sub_0812E164

	thumb_func_start sub_0812E1D8
sub_0812E1D8: @ 0x0812E1D8
	push {r4, r5, r6, lr}
	movs r4, #0xcb
	movs r5, #1
	ldr r6, _0812E23C
_0812E1E0:
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0
	adds r3, r5, #0
	bl sub_0812E240
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #0x11
	subs r4, #7
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	ble _0812E1E0
	movs r4, #0xeb
	movs r5, #1
	ldr r6, _0812E23C
_0812E20E:
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl sub_0812E240
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #0x11
	subs r4, #7
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	ble _0812E20E
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E23C: .4byte 0x0000270F
	thumb_func_end sub_0812E1D8

	thumb_func_start sub_0812E240
sub_0812E240: @ 0x0812E240
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0812E2AC
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0xd
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _0812E2B0
	adds r2, r2, r0
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #5]
	mov r0, r8
	strh r0, [r2, #0x2e]
	strh r4, [r2, #0x30]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	strh r0, [r2, #0x32]
	ldr r0, _0812E2B4
	strh r0, [r2, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E2AC: .4byte 0x08584C7C
_0812E2B0: .4byte 0x020205AC
_0812E2B4: .4byte 0x0000FFFF
	thumb_func_end sub_0812E240

	thumb_func_start sub_0812E2B8
sub_0812E2B8: @ 0x0812E2B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0812E30C
	ldr r1, [r0]
	ldrh r2, [r1, #0xc]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0812E2CC
	ldrh r2, [r1, #0xe]
_0812E2CC:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, r2
	beq _0812E306
	strh r2, [r4, #0x34]
	ldrh r1, [r4, #0x32]
	adds r0, r2, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r4, #0x30]
	adds r0, r2, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	movs r3, #0xe0
	lsls r3, r3, #0xb
	adds r0, r0, r3
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	bl GetSpriteTileStartByTag
	adds r1, r4, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r0, r4, #0
	bl SetSpriteSheetFrameTileNum
_0812E306:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E30C: .4byte 0x0203A800
	thumb_func_end sub_0812E2B8

	thumb_func_start sub_0812E310
sub_0812E310: @ 0x0812E310
	push {lr}
	ldr r0, _0812E340
	movs r1, #0x58
	movs r2, #0x48
	movs r3, #0xf
	bl CreateSprite
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0812E344
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r1, _0812E348
	bl SetSubspriteTables
	pop {r0}
	bx r0
	.align 2, 0
_0812E340: .4byte 0x08584C94
_0812E344: .4byte 0x020205AC
_0812E348: .4byte 0x08584F44
	thumb_func_end sub_0812E310

	thumb_func_start sub_0812E34C
sub_0812E34C: @ 0x0812E34C
	push {r4, r5, lr}
	sub sp, #0x18
	ldr r4, _0812E3E4
	ldr r0, [r4]
	cmp r0, #0
	bne _0812E360
	movs r0, #0x28
	bl AllocZeroed
	str r0, [r4]
_0812E360:
	ldr r2, [r4]
	ldr r0, _0812E3E8
	ldr r1, [r0]
	str r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #4
	strh r3, [r2, #4]
	adds r0, r1, r3
	str r0, [r2, #8]
	strh r3, [r2, #0xc]
	movs r4, #0x80
	lsls r4, r4, #5
	adds r0, r1, r4
	str r0, [r2, #0x10]
	strh r3, [r2, #0x14]
	movs r5, #0xc0
	lsls r5, r5, #5
	adds r0, r1, r5
	str r0, [r2, #0x18]
	strh r3, [r2, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r1, r0
	str r1, [r2, #0x20]
	strh r3, [r2, #0x24]
	mov r1, sp
	ldr r0, _0812E3EC
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	str r2, [sp, #0xc]
	movs r1, #0x8c
	lsls r1, r1, #1
	mov r0, sp
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0812E3F0
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r3, [r2, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	movs r3, #4
	orrs r1, r3
	strb r1, [r2, #5]
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r3, #2
	orrs r1, r3
	strb r1, [r2]
	ldr r1, _0812E3F4
	ldr r1, [r1]
	adds r1, #0x3f
	strb r0, [r1]
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812E3E4: .4byte 0x0203A7B0
_0812E3E8: .4byte 0x0203A7A4
_0812E3EC: .4byte 0x08584CAC
_0812E3F0: .4byte 0x020205AC
_0812E3F4: .4byte 0x0203A800
	thumb_func_end sub_0812E34C

	thumb_func_start sub_0812E3F8
sub_0812E3F8: @ 0x0812E3F8
	push {r4, lr}
	ldr r0, _0812E428
	ldr r0, [r0]
	adds r0, #0x3f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812E42C
	adds r0, r0, r1
	bl DestroySprite
	ldr r4, _0812E430
	ldr r0, [r4]
	cmp r0, #0
	beq _0812E420
	bl Free
	movs r0, #0
	str r0, [r4]
_0812E420:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E428: .4byte 0x0203A800
_0812E42C: .4byte 0x020205AC
_0812E430: .4byte 0x0203A7B0
	thumb_func_end sub_0812E3F8

	thumb_func_start sub_0812E434
sub_0812E434: @ 0x0812E434
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x24]
	strh r0, [r2, #0x26]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #4
	bne _0812E47A
	movs r0, #8
	strh r0, [r2, #0x24]
	strh r0, [r2, #0x26]
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0812E468
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _0812E476
	b _0812E47A
_0812E468:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _0812E47A
_0812E476:
	ldr r0, _0812E480
	strh r0, [r2, #0x26]
_0812E47A:
	pop {r0}
	bx r0
	.align 2, 0
_0812E480: .4byte 0x0000FFF8
	thumb_func_end sub_0812E434

	thumb_func_start sub_0812E484
sub_0812E484: @ 0x0812E484
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, _0812E594
	ldr r0, [r4]
	cmp r0, #0
	bne _0812E4A0
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
_0812E4A0:
	ldr r2, [r4]
	ldr r0, _0812E598
	mov sl, r0
	ldr r0, [r0]
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r2, #4]
	mov r1, sp
	ldr r0, _0812E59C
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	str r2, [sp, #0xc]
	mov r0, sp
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0x34
	movs r3, #7
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r5, _0812E5A0
	mov sb, r5
	adds r2, r0, r5
	ldrb r1, [r2, #5]
	movs r7, #0xd
	rsbs r7, r7, #0
	mov r8, r7
	mov r0, r8
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #5]
	adds r1, r2, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r6, #2
	orrs r0, r6
	strb r0, [r1]
	ldr r1, _0812E5A4
	adds r0, r2, #0
	bl SetSubspriteTables
	ldr r5, _0812E5A8
	ldr r0, [r5]
	adds r0, #0x49
	strb r4, [r0]
	ldr r4, _0812E5AC
	ldr r0, [r4]
	cmp r0, #0
	bne _0812E520
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
_0812E520:
	ldr r2, [r4]
	mov r3, sl
	ldr r0, [r3]
	movs r4, #0xac
	lsls r4, r4, #6
	adds r0, r0, r4
	str r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r2, #4]
	mov r1, sp
	ldr r0, _0812E5B0
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	str r2, [sp, #0xc]
	mov r0, sp
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0x54
	movs r3, #7
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	mov r7, sb
	adds r2, r0, r7
	ldrb r1, [r2, #5]
	mov r0, r8
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #5]
	adds r1, r2, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	ldr r1, _0812E5B4
	adds r0, r2, #0
	bl SetSubspriteTables
	ldr r0, [r5]
	adds r0, #0x4a
	strb r4, [r0]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812E594: .4byte 0x0203A7B4
_0812E598: .4byte 0x0203A7A4
_0812E59C: .4byte 0x08584CC4
_0812E5A0: .4byte 0x020205AC
_0812E5A4: .4byte 0x08584F64
_0812E5A8: .4byte 0x0203A800
_0812E5AC: .4byte 0x0203A7B8
_0812E5B0: .4byte 0x08584CDC
_0812E5B4: .4byte 0x08584F78
	thumb_func_end sub_0812E484

	thumb_func_start sub_0812E5B8
sub_0812E5B8: @ 0x0812E5B8
	push {r4, r5, lr}
	sub sp, #0x18
	ldr r4, _0812E644
	ldr r0, [r4]
	cmp r0, #0
	bne _0812E5CC
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
_0812E5CC:
	ldr r2, [r4]
	ldr r0, _0812E648
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r2, #4]
	mov r1, sp
	ldr r0, _0812E64C
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	str r2, [sp, #0xc]
	ldr r0, _0812E650
	ldrh r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sp
	movs r2, #0x50
	movs r3, #7
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0812E654
	adds r0, r0, r1
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #5]
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _0812E658
	bl SetSubspriteTables
	ldr r0, _0812E65C
	ldr r0, [r0]
	adds r0, #0x42
	strb r4, [r0]
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812E644: .4byte 0x0203A7BC
_0812E648: .4byte 0x0203A7A4
_0812E64C: .4byte 0x08584CF4
_0812E650: .4byte 0x02021B38
_0812E654: .4byte 0x020205AC
_0812E658: .4byte 0x08584F94
_0812E65C: .4byte 0x0203A800
	thumb_func_end sub_0812E5B8

	thumb_func_start sub_0812E660
sub_0812E660: @ 0x0812E660
	push {r4, r5, r6, lr}
	movs r4, #0
	movs r5, #0
_0812E666:
	ldr r0, _0812E6C8
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0
	movs r3, #0xa
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	ldr r1, _0812E6CC
	adds r3, r3, r1
	ldrb r2, [r3, #5]
	movs r6, #0xd
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r2, r1
	movs r1, #4
	orrs r2, r1
	strb r2, [r3, #5]
	movs r1, #0x3e
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r2, #2
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	strh r5, [r3, #0x3c]
	ldr r1, _0812E6D0
	ldr r1, [r1]
	adds r1, #0x4b
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r5, #0x10
	movs r6, #0xa0
	lsls r6, r6, #0xd
	adds r0, r0, r6
	lsrs r5, r0, #0x10
	cmp r4, #2
	bls _0812E666
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E6C8: .4byte 0x08584D0C
_0812E6CC: .4byte 0x020205AC
_0812E6D0: .4byte 0x0203A800
	thumb_func_end sub_0812E660

	thumb_func_start sub_0812E6D4
sub_0812E6D4: @ 0x0812E6D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0812E718
	ldr r1, [r0]
	ldrh r0, [r4, #0x3c]
	ldrh r1, [r1, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	adds r1, #0x3b
	strh r1, [r4, #0x22]
	movs r1, #0x14
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl GetNearbyReelTimeTag
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnimIfDifferent
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E718: .4byte 0x0203A800
	thumb_func_end sub_0812E6D4

	thumb_func_start sub_0812E71C
sub_0812E71C: @ 0x0812E71C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0xb8
	lsls r1, r1, #1
	ldr r0, _0812E7CC
	movs r2, #0x64
	movs r3, #9
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r7, _0812E7D0
	adds r2, r0, r7
	adds r1, r2, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r3, #2
	mov sl, r3
	mov r3, sl
	orrs r0, r3
	strb r0, [r1]
	ldrb r1, [r2, #5]
	movs r5, #0xd
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	movs r1, #4
	mov r8, r1
	mov r3, r8
	orrs r0, r3
	strb r0, [r2, #5]
	ldr r0, _0812E7D4
	mov sb, r0
	adds r0, r2, #0
	mov r1, sb
	bl SetSubspriteTables
	ldr r6, _0812E7D8
	ldr r0, [r6]
	adds r0, #0x4e
	strb r4, [r0]
	movs r1, #0x90
	lsls r1, r1, #1
	ldr r0, _0812E7CC
	movs r2, #0x68
	movs r3, #4
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, r0, r7
	adds r1, r2, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	mov r3, sl
	orrs r0, r3
	strb r0, [r1]
	ldrb r0, [r2, #5]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r2, #5]
	adds r0, r2, #0
	mov r1, sb
	bl SetSubspriteTables
	ldr r0, [r6]
	adds r0, #0x4f
	strb r4, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812E7CC: .4byte 0x08584D24
_0812E7D0: .4byte 0x020205AC
_0812E7D4: .4byte 0x08584FAC
_0812E7D8: .4byte 0x0203A800
	thumb_func_end sub_0812E71C

	thumb_func_start sub_0812E7DC
sub_0812E7DC: @ 0x0812E7DC
	push {r4, lr}
	ldr r0, _0812E82C
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0x4c
	movs r3, #0xb
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0812E830
	adds r0, r0, r1
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r1, _0812E834
	bl SetSubspriteTables
	ldr r0, _0812E838
	ldr r0, [r0]
	adds r0, #0x40
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E82C: .4byte 0x08584D3C
_0812E830: .4byte 0x020205AC
_0812E834: .4byte 0x08584FC0
_0812E838: .4byte 0x0203A800
	thumb_func_end sub_0812E7DC

	thumb_func_start sub_0812E83C
sub_0812E83C: @ 0x0812E83C
	push {r4, lr}
	ldr r0, _0812E8C4
	ldr r0, [r0]
	adds r0, #0x40
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812E8C8
	adds r0, r0, r1
	bl DestroySprite
	movs r4, #0
_0812E856:
	ldr r0, _0812E8C4
	ldr r0, [r0]
	adds r0, #0x49
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812E8C8
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0812E856
	ldr r4, _0812E8CC
	ldr r0, [r4]
	cmp r0, #0
	beq _0812E888
	bl Free
	movs r0, #0
	str r0, [r4]
_0812E888:
	ldr r4, _0812E8D0
	ldr r0, [r4]
	cmp r0, #0
	beq _0812E898
	bl Free
	movs r0, #0
	str r0, [r4]
_0812E898:
	movs r4, #0
_0812E89A:
	ldr r0, _0812E8C4
	ldr r0, [r0]
	adds r0, #0x4b
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812E8C8
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0812E89A
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E8C4: .4byte 0x0203A800
_0812E8C8: .4byte 0x020205AC
_0812E8CC: .4byte 0x0203A7B4
_0812E8D0: .4byte 0x0203A7B8
	thumb_func_end sub_0812E83C

	thumb_func_start sub_0812E8D4
sub_0812E8D4: @ 0x0812E8D4
	push {r4, lr}
	movs r4, #0
_0812E8D8:
	ldr r0, _0812E900
	ldr r0, [r0]
	adds r0, #0x4e
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812E904
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0812E8D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E900: .4byte 0x0203A800
_0812E904: .4byte 0x020205AC
	thumb_func_end sub_0812E8D4

	thumb_func_start sub_0812E908
sub_0812E908: @ 0x0812E908
	push {r4, lr}
	ldr r0, _0812E938
	ldr r0, [r0]
	adds r0, #0x42
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812E93C
	adds r0, r0, r1
	bl DestroySprite
	ldr r4, _0812E940
	ldr r0, [r4]
	cmp r0, #0
	beq _0812E930
	bl Free
	movs r0, #0
	str r0, [r4]
_0812E930:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812E938: .4byte 0x0203A800
_0812E93C: .4byte 0x020205AC
_0812E940: .4byte 0x0203A7BC
	thumb_func_end sub_0812E908

	thumb_func_start CreateReelTimeSprites1
CreateReelTimeSprites1: @ 0x0812E944
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, _0812E9E8
	mov sl, r0
	movs r1, #0x98
	movs r2, #0x20
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _0812E9EC
	mov sb, r2
	adds r3, r1, r2
	ldrb r2, [r3, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r1, r2
	movs r2, #4
	mov r8, r2
	mov r2, r8
	orrs r1, r2
	strb r1, [r3, #5]
	adds r5, r3, #0
	adds r5, #0x3f
	ldrb r1, [r5]
	movs r2, #1
	orrs r1, r2
	strb r1, [r5]
	ldr r6, _0812E9F0
	ldr r1, [r6]
	adds r1, #0x50
	strb r0, [r1]
	movs r0, #8
	strh r0, [r3, #0x2e]
	ldr r0, _0812E9F4
	strh r0, [r3, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r3, #0x32]
	movs r5, #0x20
	strh r5, [r3, #0x3c]
	mov r0, sl
	movs r1, #0xb8
	movs r2, #0x20
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r2, sb
	adds r3, r1, r2
	ldrb r1, [r3, #5]
	ands r4, r1
	mov r1, r8
	orrs r4, r1
	strb r4, [r3, #5]
	ldr r1, [r6]
	adds r1, #0x51
	strb r0, [r1]
	movs r0, #1
	strh r0, [r3, #0x30]
	subs r0, #2
	strh r0, [r3, #0x32]
	strh r5, [r3, #0x3c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E9E8: .4byte 0x08584D54
_0812E9EC: .4byte 0x020205AC
_0812E9F0: .4byte 0x0203A800
_0812E9F4: .4byte 0x0000FFFF
	thumb_func_end CreateReelTimeSprites1

	thumb_func_start sub_0812E9F8
sub_0812E9F8: @ 0x0812E9F8
	push {r4, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	movs r1, #0x2e
	ldrsh r4, [r2, r1]
	cmp r4, #0
	beq _0812EA1C
	subs r0, #1
	movs r1, #0
	strh r0, [r2, #0x2e]
	strh r1, [r2, #0x24]
	strh r1, [r2, #0x26]
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	b _0812EA4E
_0812EA1C:
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	strh r0, [r2, #0x24]
	ldrh r0, [r2, #0x32]
	ldrh r1, [r2, #0x26]
	adds r0, r0, r1
	strh r0, [r2, #0x26]
	ldrh r0, [r2, #0x34]
	adds r0, #1
	strh r0, [r2, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0812EA4E
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x2e]
	strh r4, [r2, #0x34]
_0812EA4E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0812E9F8

	thumb_func_start sub_0812EA54
sub_0812EA54: @ 0x0812EA54
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0812EA84
	ldr r1, _0812EA88
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x50
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	strh r0, [r1, #0x3c]
	adds r3, #0x51
	ldrb r2, [r3]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	strh r0, [r1, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EA84: .4byte 0x020205AC
_0812EA88: .4byte 0x0203A800
	thumb_func_end sub_0812EA54

	thumb_func_start sub_0812EA8C
sub_0812EA8C: @ 0x0812EA8C
	push {r4, lr}
	movs r4, #0
_0812EA90:
	ldr r0, _0812EAB8
	ldr r0, [r0]
	adds r0, #0x50
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812EABC
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0812EA90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EAB8: .4byte 0x0203A800
_0812EABC: .4byte 0x020205AC
	thumb_func_end sub_0812EA8C

	thumb_func_start CreateReelTimeSprite2
CreateReelTimeSprite2: @ 0x0812EAC0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r0, _0812EB4C
	mov r8, r0
	movs r1, #0x48
	movs r2, #0x50
	movs r3, #3
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0812EB50
	mov sb, r1
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, sb
	ldrb r3, [r2, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r1, r3
	movs r6, #4
	orrs r1, r6
	strb r1, [r2, #5]
	movs r3, #0
	movs r1, #1
	strh r1, [r2, #0x2e]
	strh r3, [r2, #0x38]
	movs r1, #0x10
	strh r1, [r2, #0x3a]
	movs r1, #8
	strh r1, [r2, #0x3c]
	ldr r5, _0812EB54
	ldr r1, [r5]
	adds r1, #0x52
	strb r0, [r1]
	mov r0, r8
	movs r1, #0x68
	movs r2, #0x50
	movs r3, #3
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sb
	ldrb r2, [r1, #5]
	ands r4, r2
	orrs r4, r6
	strb r4, [r1, #5]
	adds r1, #0x3f
	ldrb r2, [r1]
	movs r3, #1
	orrs r2, r3
	strb r2, [r1]
	ldr r1, [r5]
	adds r1, #0x53
	strb r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812EB4C: .4byte 0x08584D6C
_0812EB50: .4byte 0x020205AC
_0812EB54: .4byte 0x0203A800
	thumb_func_end CreateReelTimeSprite2

	thumb_func_start sub_0812EB58
sub_0812EB58: @ 0x0812EB58
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0812EBB4
	mov r0, sp
	movs r2, #2
	bl memcpy
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0812EBAA
	ldrh r0, [r4, #0x3a]
	subs r0, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0812EBAA
	movs r0, #7
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	ldr r2, _0812EBB8
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	add r1, sp
	ldrb r3, [r1]
	adds r1, r3, #0
	adds r2, r3, #0
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r0, [r4, #0x38]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
_0812EBAA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EBB4: .4byte 0x08584598
_0812EBB8: .4byte 0x01030000
	thumb_func_end sub_0812EB58

	thumb_func_start sub_0812EBBC
sub_0812EBBC: @ 0x0812EBBC
	ldr r3, _0812EBD4
	ldr r1, _0812EBD8
	ldr r1, [r1]
	adds r1, #0x52
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	strh r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_0812EBD4: .4byte 0x020205AC
_0812EBD8: .4byte 0x0203A800
	thumb_func_end sub_0812EBBC

	thumb_func_start sub_0812EBDC
sub_0812EBDC: @ 0x0812EBDC
	push {r4, lr}
	movs r0, #7
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	ldr r1, _0812EC24
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl MultiplyInvertedPaletteRGBComponents
	movs r4, #0
_0812EBFA:
	ldr r0, _0812EC28
	ldr r0, [r0]
	adds r0, #0x52
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812EC2C
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0812EBFA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EC24: .4byte 0x01030000
_0812EC28: .4byte 0x0203A800
_0812EC2C: .4byte 0x020205AC
	thumb_func_end sub_0812EBDC

	thumb_func_start sub_0812EC30
sub_0812EC30: @ 0x0812EC30
	push {lr}
	ldr r0, _0812EC68
	movs r1, #0xa8
	movs r2, #0x50
	movs r3, #6
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0812EC6C
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r3, [r1, #5]
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #4
	orrs r2, r3
	strb r2, [r1, #5]
	ldr r1, _0812EC70
	ldr r1, [r1]
	adds r1, #0x41
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0812EC68: .4byte 0x08584D84
_0812EC6C: .4byte 0x020205AC
_0812EC70: .4byte 0x0203A800
	thumb_func_end sub_0812EC30

	thumb_func_start sub_0812EC74
sub_0812EC74: @ 0x0812EC74
	ldr r1, _0812EC7C
	ldrh r1, [r1]
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
_0812EC7C: .4byte 0x02021B3A
	thumb_func_end sub_0812EC74

	thumb_func_start sub_0812EC80
sub_0812EC80: @ 0x0812EC80
	push {lr}
	ldr r0, _0812EC9C
	ldr r0, [r0]
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812ECA0
	adds r0, r0, r1
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
_0812EC9C: .4byte 0x0203A800
_0812ECA0: .4byte 0x020205AC
	thumb_func_end sub_0812EC80

	thumb_func_start sub_0812ECA4
sub_0812ECA4: @ 0x0812ECA4
	push {r4, r5, lr}
	sub sp, #8
	ldr r1, _0812ED1C
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r4, #0
_0812ECB4:
	ldr r0, _0812ED20
	ldrh r0, [r0]
	movs r1, #0x50
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _0812ED24
	movs r2, #0x44
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	ldr r1, _0812ED28
	adds r3, r3, r1
	ldrb r2, [r3, #5]
	movs r5, #0xd
	rsbs r5, r5, #0
	adds r1, r5, #0
	ands r2, r1
	movs r1, #4
	orrs r2, r1
	strb r2, [r3, #5]
	movs r1, #0x3e
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r2, #2
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	lsls r1, r4, #1
	add r1, sp
	ldrh r1, [r1]
	strh r1, [r3, #0x2e]
	ldr r1, _0812ED2C
	ldr r1, [r1]
	adds r1, #0x54
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0812ECB4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812ED1C: .4byte 0x0858459A
_0812ED20: .4byte 0x02021B38
_0812ED24: .4byte 0x08584D9C
_0812ED28: .4byte 0x020205AC
_0812ED2C: .4byte 0x0203A800
	thumb_func_end sub_0812ECA4

	thumb_func_start sub_0812ED30
sub_0812ED30: @ 0x0812ED30
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	movs r4, #0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	movs r1, #0x14
	bl Cos
	strh r0, [r5, #0x24]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r1, #6
	bl Sin
	strh r0, [r5, #0x26]
	adds r1, r5, #0
	adds r1, #0x43
	strb r4, [r1]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0x7f
	ble _0812ED6A
	movs r0, #2
	strb r0, [r1]
_0812ED6A:
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0812ED94
	adds r3, r5, #0
	adds r3, #0x3f
	ldrb r2, [r3]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0
	strh r0, [r5, #0x30]
_0812ED94:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812ED30

	thumb_func_start sub_0812ED9C
sub_0812ED9C: @ 0x0812ED9C
	push {r4, lr}
	movs r4, #0
_0812EDA0:
	ldr r0, _0812EDC8
	ldr r0, [r0]
	adds r0, #0x54
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0812EDCC
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0812EDA0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EDC8: .4byte 0x0203A800
_0812EDCC: .4byte 0x020205AC
	thumb_func_end sub_0812ED9C

	thumb_func_start sub_0812EDD0
sub_0812EDD0: @ 0x0812EDD0
	push {r4, lr}
	ldr r0, _0812EE18
	movs r1, #0xa8
	movs r2, #0x3c
	movs r3, #8
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0812EE1C
	adds r0, r0, r1
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #5]
	ldrb r1, [r0, #1]
	movs r2, #3
	orrs r1, r2
	strb r1, [r0, #1]
	bl InitSpriteAffineAnim
	ldr r0, _0812EE20
	ldr r0, [r0]
	adds r0, #0x43
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EE18: .4byte 0x08584DB4
_0812EE1C: .4byte 0x020205AC
_0812EE20: .4byte 0x0203A800
	thumb_func_end sub_0812EDD0

	thumb_func_start sub_0812EE24
sub_0812EE24: @ 0x0812EE24
	push {lr}
	adds r3, r0, #0
	ldrh r2, [r3, #0x2e]
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _0812EE46
	adds r0, r3, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0812EEA0
	adds r0, r2, #1
	strh r0, [r3, #0x2e]
	b _0812EEA0
_0812EE46:
	cmp r0, #1
	bne _0812EE82
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _0812EEA0
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	movs r0, #0
	strh r0, [r3, #0x32]
	b _0812EEA0
_0812EE82:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0812EEA0
	movs r0, #1
	strh r0, [r3, #0x3c]
_0812EEA0:
	ldrh r0, [r3, #0x30]
	movs r1, #0xff
	ands r1, r0
	adds r1, #0x10
	strh r1, [r3, #0x30]
	lsrs r1, r1, #8
	ldrh r0, [r3, #0x26]
	subs r0, r0, r1
	strh r0, [r3, #0x26]
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812EE24

	thumb_func_start sub_0812EEB8
sub_0812EEB8: @ 0x0812EEB8
	ldr r2, _0812EED4
	ldr r0, _0812EED8
	ldr r0, [r0]
	adds r0, #0x43
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0812EED4: .4byte 0x020205AC
_0812EED8: .4byte 0x0203A800
	thumb_func_end sub_0812EEB8

	thumb_func_start sub_0812EEDC
sub_0812EEDC: @ 0x0812EEDC
	push {r4, lr}
	ldr r0, _0812EF08
	ldr r0, [r0]
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0812EF0C
	adds r4, r4, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EF08: .4byte 0x0203A800
_0812EF0C: .4byte 0x020205AC
	thumb_func_end sub_0812EEDC

	thumb_func_start sub_0812EF10
sub_0812EF10: @ 0x0812EF10
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _0812EF5C
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r3, #0
	movs r3, #0xc
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0812EF60
	adds r0, r0, r1
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #5]
	ldrb r1, [r0, #1]
	movs r2, #3
	orrs r1, r2
	strb r1, [r0, #1]
	bl InitSpriteAffineAnim
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812EF5C: .4byte 0x08584F1C
_0812EF60: .4byte 0x020205AC
	thumb_func_end sub_0812EF10

	thumb_func_start sub_0812EF64
sub_0812EF64: @ 0x0812EF64
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0812EF78
	movs r0, #1
	strh r0, [r2, #0x3c]
_0812EF78:
	pop {r0}
	bx r0
	thumb_func_end sub_0812EF64

	thumb_func_start sub_0812EF7C
sub_0812EF7C: @ 0x0812EF7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0812EFA4
	adds r4, r4, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EFA4: .4byte 0x020205AC
	thumb_func_end sub_0812EF7C

	thumb_func_start sub_0812EFA8
sub_0812EFA8: @ 0x0812EFA8
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r3, _0812EFE4
	lsrs r1, r1, #0x16
	adds r3, r1, r3
	ldr r5, [r3]
	ldr r3, _0812EFE8
	adds r4, r1, r3
	movs r6, #0
	ldrsh r4, [r4, r6]
	adds r3, #2
	adds r1, r1, r3
	movs r6, #0
	ldrsh r3, [r1, r6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r2, [sp]
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0812EFEC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0812EFE4: .4byte 0x0858484C
_0812EFE8: .4byte 0x085847BE
	thumb_func_end sub_0812EFA8

	thumb_func_start sub_0812EFEC
sub_0812EFEC: @ 0x0812EFEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov r8, r1
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r5, [sp, #0x34]
	lsls r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sb, r5
	ldr r0, _0812F078
	lsrs r4, r4, #0x16
	adds r0, r4, r0
	mov r3, sp
	ldr r0, [r0]
	ldm r0!, {r5, r6, r7}
	stm r3!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r3!, {r5, r6, r7}
	ldr r0, _0812F07C
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sp
	movs r3, #0x10
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r0, #0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _0812F080
	adds r2, r0, r1
	ldrb r0, [r2, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2, #5]
	mov r0, r8
	str r0, [r2, #0x1c]
	mov r5, sb
	strh r5, [r2, #0x3a]
	movs r0, #1
	strh r0, [r2, #0x3c]
	ldr r0, _0812F084
	adds r4, r4, r0
	ldr r1, [r4]
	cmp r1, #0
	beq _0812F066
	adds r0, r2, #0
	bl SetSubspriteTables
_0812F066:
	adds r0, r7, #0
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812F078: .4byte 0x085851E8
_0812F07C: .4byte 0x03001188
_0812F080: .4byte 0x020205AC
_0812F084: .4byte 0x08585250
	thumb_func_end sub_0812EFEC

	thumb_func_start sub_0812F088
sub_0812F088: @ 0x0812F088
	movs r1, #0
	strh r1, [r0, #0x3c]
	bx lr
	.align 2, 0
	thumb_func_end sub_0812F088

	thumb_func_start sub_0812F090
sub_0812F090: @ 0x0812F090
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r1, _0812F10C
	mov r0, sp
	movs r2, #8
	bl memcpy
	add r5, sp, #8
	ldr r1, _0812F110
	adds r0, r5, #0
	movs r2, #8
	bl memcpy
	ldrh r0, [r4, #0x30]
	adds r1, r0, #1
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0812F0D6
	adds r3, r4, #0
	adds r3, #0x42
	ldrb r2, [r3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #1
	eors r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0
	strh r0, [r4, #0x30]
_0812F0D6:
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	beq _0812F102
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x24]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r4, #0x26]
_0812F102:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812F10C: .4byte 0x085845A2
_0812F110: .4byte 0x085845AA
	thumb_func_end sub_0812F090

	thumb_func_start sub_0812F114
sub_0812F114: @ 0x0812F114
	push {lr}
	adds r3, r0, #0
	adds r3, #0x3f
	ldrb r1, [r3]
	movs r2, #1
	orrs r1, r2
	strb r1, [r3]
	bl sub_0812F090
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812F114

	thumb_func_start sub_0812F12C
sub_0812F12C: @ 0x0812F12C
	push {lr}
	adds r3, r0, #0
	adds r3, #0x3f
	ldrb r1, [r3]
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	bl sub_0812F090
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812F12C

	thumb_func_start sub_0812F144
sub_0812F144: @ 0x0812F144
	push {lr}
	adds r3, r0, #0
	adds r3, #0x3f
	ldrb r1, [r3]
	movs r2, #1
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	bl sub_0812F090
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812F144

	thumb_func_start sub_0812F160
sub_0812F160: @ 0x0812F160
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _0812F194
	cmp r0, #1
	bgt _0812F176
	cmp r0, #0
	beq _0812F180
	b _0812F1C4
_0812F176:
	cmp r0, #2
	beq _0812F1A4
	cmp r0, #3
	beq _0812F1C0
	b _0812F1C4
_0812F180:
	ldrh r0, [r2, #0x20]
	adds r0, #4
	strh r0, [r2, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xcf
	ble _0812F1C4
	movs r0, #0xd0
	strh r0, [r2, #0x20]
	b _0812F1B2
_0812F194:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5a
	ble _0812F1C4
	b _0812F1B2
_0812F1A4:
	ldrh r0, [r2, #0x20]
	adds r0, #4
	strh r0, [r2, #0x20]
	lsls r0, r0, #0x10
	ldr r1, _0812F1BC
	cmp r0, r1
	ble _0812F1C4
_0812F1B2:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	b _0812F1C4
	.align 2, 0
_0812F1BC: .4byte 0x010F0000
_0812F1C0:
	movs r0, #0
	strh r0, [r2, #0x3c]
_0812F1C4:
	pop {r0}
	bx r0
	thumb_func_end sub_0812F160

	thumb_func_start sub_0812F1C8
sub_0812F1C8: @ 0x0812F1C8
	push {lr}
	adds r1, r0, #0
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #1
	beq _0812F1FC
	cmp r0, #1
	bgt _0812F1DE
	cmp r0, #0
	beq _0812F1E8
	b _0812F226
_0812F1DE:
	cmp r0, #2
	beq _0812F20C
	cmp r0, #3
	beq _0812F222
	b _0812F226
_0812F1E8:
	ldrh r0, [r1, #0x20]
	subs r0, #4
	strh r0, [r1, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _0812F226
	movs r0, #0xd0
	strh r0, [r1, #0x20]
	b _0812F21A
_0812F1FC:
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5a
	ble _0812F226
	b _0812F21A
_0812F20C:
	ldrh r0, [r1, #0x20]
	subs r0, #4
	strh r0, [r1, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x90
	bgt _0812F226
_0812F21A:
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	b _0812F226
_0812F222:
	movs r0, #0
	strh r0, [r1, #0x3c]
_0812F226:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812F1C8

	thumb_func_start sub_0812F22C
sub_0812F22C: @ 0x0812F22C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bhi _0812F2D6
	lsls r0, r0, #2
	ldr r1, _0812F244
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812F244: .4byte 0x0812F248
_0812F248: @ jump table
	.4byte _0812F260 @ case 0
	.4byte _0812F278 @ case 1
	.4byte _0812F298 @ case 2
	.4byte _0812F2AC @ case 3
	.4byte _0812F2BC @ case 4
	.4byte _0812F2D2 @ case 5
_0812F260:
	ldr r0, _0812F294
	ldr r0, [r0]
	ldrb r1, [r0, #0xa]
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0812F278:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0812F2D6
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0
	strh r0, [r4, #0x30]
	b _0812F2D6
	.align 2, 0
_0812F294: .4byte 0x0203A800
_0812F298:
	ldrh r0, [r4, #0x20]
	adds r0, #4
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xcf
	ble _0812F2D6
	movs r0, #0xd0
	strh r0, [r4, #0x20]
	b _0812F2CA
_0812F2AC:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5a
	ble _0812F2D6
	b _0812F2CA
_0812F2BC:
	ldrh r0, [r4, #0x20]
	adds r0, #4
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf7
	ble _0812F2D6
_0812F2CA:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0812F2D6
_0812F2D2:
	movs r0, #0
	strh r0, [r4, #0x3c]
_0812F2D6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0812F22C

	thumb_func_start sub_0812F2DC
sub_0812F2DC: @ 0x0812F2DC
	push {lr}
	adds r3, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #1
	beq _0812F30A
	cmp r0, #1
	bgt _0812F2F2
	cmp r0, #0
	beq _0812F2F8
	b _0812F378
_0812F2F2:
	cmp r0, #2
	beq _0812F328
	b _0812F378
_0812F2F8:
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
_0812F30A:
	ldrh r0, [r3, #0x22]
	adds r0, #8
	strh r0, [r3, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6f
	ble _0812F378
	movs r0, #0x70
	strh r0, [r3, #0x22]
	movs r0, #0x10
	strh r0, [r3, #0x30]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b _0812F378
_0812F328:
	movs r0, #0x32
	ldrsh r2, [r3, r0]
	cmp r2, #0
	bne _0812F36E
	ldrh r0, [r3, #0x22]
	ldrh r1, [r3, #0x30]
	subs r0, r0, r1
	strh r0, [r3, #0x22]
	rsbs r1, r1, #0
	strh r1, [r3, #0x30]
	ldrh r0, [r3, #0x34]
	adds r0, #1
	strh r0, [r3, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0812F36E
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	strh r0, [r3, #0x30]
	strh r2, [r3, #0x34]
	adds r1, r0, #0
	cmp r1, #0
	bne _0812F36E
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	strh r1, [r3, #0x3c]
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0812F36E:
	ldrh r0, [r3, #0x32]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	strh r0, [r3, #0x32]
_0812F378:
	pop {r0}
	bx r0
	thumb_func_end sub_0812F2DC

	thumb_func_start sub_0812F37C
sub_0812F37C: @ 0x0812F37C
	push {lr}
	adds r1, r0, #0
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0812F38E
	cmp r0, #1
	beq _0812F3A4
	b _0812F3C0
_0812F38E:
	ldrh r0, [r1, #0x30]
	adds r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0812F3C0
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	b _0812F3C0
_0812F3A4:
	ldrh r0, [r1, #0x22]
	adds r0, #2
	strh r0, [r1, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2f
	ble _0812F3C0
	movs r0, #0x30
	strh r0, [r1, #0x22]
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	movs r0, #0
	strh r0, [r1, #0x3c]
_0812F3C0:
	pop {r0}
	bx r0
	thumb_func_end sub_0812F37C

	thumb_func_start sub_0812F3C4
sub_0812F3C4: @ 0x0812F3C4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0812F3D6
	cmp r0, #1
	beq _0812F426
	b _0812F478
_0812F3D6:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _0812F478
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #5
	strh r0, [r4, #0x30]
	ldrb r0, [r4, #1]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	ldrh r0, [r4, #0x30]
	lsls r1, r0, #4
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	movs r0, #0x4c
	bl SetGpuReg
	b _0812F478
_0812F426:
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x30]
	subs r0, r0, r1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0812F43C
	movs r0, #0
	strh r0, [r4, #0x30]
_0812F43C:
	ldrh r0, [r4, #0x30]
	lsls r1, r0, #4
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	movs r0, #0x4c
	bl SetGpuReg
	ldrh r1, [r4, #0x32]
	movs r0, #0xff
	ands r0, r1
	adds r0, #0x80
	strh r0, [r4, #0x32]
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _0812F478
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x3c]
	ldrb r1, [r4, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
_0812F478:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812F3C4

	thumb_func_start sub_0812F480
sub_0812F480: @ 0x0812F480
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #2
	bgt _0812F4D0
	ldr r1, _0812F4CC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	movs r0, #6
	bl IndexOfSpritePaletteTag
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0812F50C
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	movs r0, #0
	strh r0, [r5, #0x32]
	b _0812F50C
	.align 2, 0
_0812F4CC: .4byte 0x08585614
_0812F4D0:
	ldr r1, _0812F520
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	movs r0, #6
	bl IndexOfSpritePaletteTag
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r5, #0x32]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	ble _0812F50C
	strh r1, [r5, #0x30]
	strh r1, [r5, #0x32]
_0812F50C:
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnimIfDifferent
	movs r0, #0
	strh r0, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812F520: .4byte 0x08585614
	thumb_func_end sub_0812F480

	thumb_func_start sub_0812F524
sub_0812F524: @ 0x0812F524
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r4, r0, #0
	ldr r1, _0812F560
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	add r6, sp, #0x10
	ldr r1, _0812F564
	adds r0, r6, #0
	movs r2, #0x10
	bl memcpy
	add r5, sp, #0x20
	ldr r1, _0812F568
	adds r0, r5, #0
	movs r2, #0x10
	bl memcpy
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0812F59C
	cmp r0, #1
	bgt _0812F56C
	cmp r0, #0
	beq _0812F572
	b _0812F5E8
	.align 2, 0
_0812F560: .4byte 0x085845B2
_0812F564: .4byte 0x085845C2
_0812F568: .4byte 0x085845D2
_0812F56C:
	cmp r0, #2
	beq _0812F5B0
	b _0812F5E8
_0812F572:
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x24]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r4, #0x26]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0812F59C:
	ldrh r0, [r4, #0x30]
	subs r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0812F5E8
	b _0812F5E2
_0812F5B0:
	ldrh r0, [r4, #0x24]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	cmp r1, #0
	ble _0812F5BE
	subs r0, #4
	b _0812F5C4
_0812F5BE:
	cmp r1, #0
	bge _0812F5C6
	adds r0, #4
_0812F5C4:
	strh r0, [r4, #0x24]
_0812F5C6:
	ldrh r0, [r4, #0x26]
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	cmp r1, #0
	ble _0812F5D4
	subs r0, #4
	b _0812F5DA
_0812F5D4:
	cmp r1, #0
	bge _0812F5DC
	adds r0, #4
_0812F5DA:
	strh r0, [r4, #0x26]
_0812F5DC:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _0812F5E8
_0812F5E2:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0812F5E8:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0812F524

	thumb_func_start sub_0812F5F0
sub_0812F5F0: @ 0x0812F5F0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r1, _0812F654
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0812F612
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
	movs r0, #0xc
	strh r0, [r4, #0x30]
_0812F612:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	add r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	add r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0812F64C
	subs r0, r1, #1
	strh r0, [r4, #0x30]
_0812F64C:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F654: .4byte 0x085845E2
	thumb_func_end sub_0812F5F0

	thumb_func_start sub_0812F658
sub_0812F658: @ 0x0812F658
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0812F6A4
	cmp r0, #1
	bgt _0812F670
	cmp r0, #0
	beq _0812F67A
	b _0812F77C
_0812F670:
	cmp r0, #2
	beq _0812F6F0
	cmp r0, #3
	beq _0812F72C
	b _0812F77C
_0812F67A:
	ldr r0, _0812F6E8
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x5c
	movs r0, #0x2f
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x3f
	strh r0, [r1]
	subs r1, #4
	ldr r0, _0812F6EC
	strh r0, [r1]
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0812F6A4:
	ldrh r0, [r5, #0x30]
	adds r2, r0, #2
	strh r2, [r5, #0x30]
	adds r0, #0xb2
	strh r0, [r5, #0x32]
	movs r1, #0xf0
	subs r1, r1, r2
	strh r1, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	ble _0812F6C0
	movs r0, #0xd0
	strh r0, [r5, #0x32]
_0812F6C0:
	movs r1, #0x34
	ldrsh r0, [r5, r1]
	cmp r0, #0xcf
	bgt _0812F6CC
	movs r0, #0xd0
	strh r0, [r5, #0x34]
_0812F6CC:
	ldr r0, _0812F6E8
	ldr r2, [r0]
	ldrh r0, [r5, #0x32]
	lsls r0, r0, #8
	ldrh r1, [r5, #0x34]
	orrs r0, r1
	adds r1, r2, #0
	adds r1, #0x58
	strh r0, [r1]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #0x33
	ble _0812F77C
	b _0812F76E
	.align 2, 0
_0812F6E8: .4byte 0x0203A800
_0812F6EC: .4byte 0x00002088
_0812F6F0:
	ldr r6, _0812F784
	ldr r0, [r6]
	movs r1, #0x12
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0812F77C
	ldr r1, _0812F788
	movs r4, #0
	str r4, [sp]
	movs r0, #5
	movs r2, #0xd0
	movs r3, #0x74
	bl sub_0812DF78
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x58
	ldr r0, _0812F78C
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xd1
	lsls r0, r0, #7
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x2f
	strh r0, [r1]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
_0812F72C:
	ldrh r0, [r5, #0x30]
	adds r2, r0, #2
	strh r2, [r5, #0x30]
	adds r0, #0xc2
	strh r0, [r5, #0x32]
	movs r1, #0xe0
	subs r1, r1, r2
	strh r1, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	ble _0812F748
	movs r0, #0xd0
	strh r0, [r5, #0x32]
_0812F748:
	movs r1, #0x34
	ldrsh r0, [r5, r1]
	cmp r0, #0xcf
	bgt _0812F754
	movs r0, #0xd0
	strh r0, [r5, #0x34]
_0812F754:
	ldr r0, _0812F784
	ldr r2, [r0]
	ldrh r0, [r5, #0x32]
	lsls r0, r0, #8
	ldrh r1, [r5, #0x34]
	orrs r0, r1
	adds r1, r2, #0
	adds r1, #0x58
	strh r0, [r1]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #0xf
	ble _0812F77C
_0812F76E:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	adds r1, r2, #0
	adds r1, #0x5c
	movs r0, #0x3f
	strh r0, [r1]
_0812F77C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F784: .4byte 0x0203A800
_0812F788: .4byte 0x08007141
_0812F78C: .4byte 0x0000C0E0
	thumb_func_end sub_0812F658

	thumb_func_start sub_0812F790
sub_0812F790: @ 0x0812F790
	bx lr
	.align 2, 0
	thumb_func_end sub_0812F790

	thumb_func_start sub_0812F794
sub_0812F794: @ 0x0812F794
	push {lr}
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812F794

	thumb_func_start sub_0812F7A4
sub_0812F7A4: @ 0x0812F7A4
	push {r4, lr}
	ldr r0, _0812F7CC
	ldr r4, [r0]
	movs r0, #6
	bl IndexOfSpritePaletteTag
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F7CC: .4byte 0x08585624
	thumb_func_end sub_0812F7A4

	thumb_func_start sub_0812F7D0
sub_0812F7D0: @ 0x0812F7D0
	ldr r0, _0812F7F0
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x58
	movs r0, #0xf0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xa0
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x5c
	movs r1, #0x3f
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0812F7F0: .4byte 0x0203A800
	thumb_func_end sub_0812F7D0

	thumb_func_start sub_0812F7F4
sub_0812F7F4: @ 0x0812F7F4
	push {r4, r5, r6, lr}
	bl sub_0812F8B0
	ldr r4, _0812F894
	movs r0, #0xc8
	lsls r0, r0, #6
	bl Alloc
	adds r1, r0, #0
	str r1, [r4]
	ldr r0, _0812F898
	bl LZDecompressVram
	ldr r4, _0812F89C
	movs r0, #0xd8
	lsls r0, r0, #6
	bl Alloc
	adds r1, r0, #0
	str r1, [r4]
	ldr r0, _0812F8A0
	bl LZDecompressVram
	ldr r4, _0812F8A4
	movs r0, #0xb0
	bl AllocZeroed
	str r0, [r4]
	movs r3, #0
	ldr r5, _0812F8A8
	adds r6, r4, #0
_0812F832:
	ldr r2, [r4]
	lsls r1, r3, #3
	adds r2, r1, r2
	adds r1, r1, r5
	ldr r0, [r1]
	str r0, [r2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	ldrh r0, [r1, #6]
	strh r0, [r2, #6]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x15
	bls _0812F832
	ldr r3, [r6]
	adds r2, r3, #0
	adds r2, #0x88
	ldr r0, _0812F894
	ldr r1, [r0]
	movs r4, #0xa0
	lsls r4, r4, #4
	adds r0, r1, r4
	str r0, [r2]
	adds r2, #8
	movs r4, #0xa0
	lsls r4, r4, #5
	adds r0, r1, r4
	str r0, [r2]
	adds r2, #8
	movs r4, #0xb0
	lsls r4, r4, #5
	adds r0, r1, r4
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0xa0
	movs r2, #0xc8
	lsls r2, r2, #5
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r3, #0
	bl LoadSpriteSheets
	ldr r0, _0812F8AC
	bl LoadSpritePalettes
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F894: .4byte 0x0203A7A0
_0812F898: .4byte 0x08585690
_0812F89C: .4byte 0x0203A7A4
_0812F8A0: .4byte 0x08585DF8
_0812F8A4: .4byte 0x0203A7FC
_0812F8A8: .4byte 0x085852B8
_0812F8AC: .4byte 0x08585648
	thumb_func_end sub_0812F7F4

	thumb_func_start sub_0812F8B0
sub_0812F8B0: @ 0x0812F8B0
	push {r4, r5, r6, lr}
	ldr r5, _0812F90C
	movs r0, #8
	bl AllocZeroed
	str r0, [r5]
	ldr r4, _0812F910
	movs r0, #0x80
	lsls r0, r0, #6
	bl AllocZeroed
	str r0, [r4]
	adds r3, r0, #0
	movs r1, #0
	adds r6, r4, #0
	ldr r0, _0812F914
	ldr r4, [r0]
_0812F8D2:
	movs r2, #0
	adds r1, #1
_0812F8D6:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, #1
	cmp r2, #0x1f
	bls _0812F8D6
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x3f
	bls _0812F8D2
	ldr r0, [r5]
	ldr r1, [r6]
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0, #4]
	movs r1, #0x11
	strh r1, [r0, #6]
	bl LoadSpriteSheet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F90C: .4byte 0x0203A7F8
_0812F910: .4byte 0x0203A7AC
_0812F914: .4byte 0x08585368
	thumb_func_end sub_0812F8B0

	thumb_func_start sub_0812F918
sub_0812F918: @ 0x0812F918
	push {r4, lr}
	ldr r4, _0812F958
	movs r0, #0x80
	lsls r0, r0, #6
	bl Alloc
	adds r1, r0, #0
	str r1, [r4]
	ldr r0, _0812F95C
	bl LZDecompressVram
	ldr r1, [r4]
	movs r2, #0xe9
	lsls r2, r2, #5
	movs r0, #2
	movs r3, #0
	bl LoadBgTiles
	ldr r0, _0812F960
	movs r1, #0
	movs r2, #0xa0
	bl LoadPalette
	ldr r0, _0812F964
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F958: .4byte 0x0203A794
_0812F95C: .4byte 0x08586F4C
_0812F960: .4byte 0x0858544C
_0812F964: .4byte 0x08585628
	thumb_func_end sub_0812F918

	thumb_func_start sub_0812F968
sub_0812F968: @ 0x0812F968
	push {lr}
	bl sub_0812F978
	bl LoadSlotMachineWheelOverlay
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812F968

	thumb_func_start sub_0812F978
sub_0812F978: @ 0x0812F978
	push {r4, lr}
	movs r4, #0
_0812F97C:
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	ldr r0, _0812F9A0
	adds r1, r1, r0
	lsls r3, r4, #5
	movs r0, #2
	movs r2, #0x3c
	bl LoadBgTilemap
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _0812F97C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F9A0: .4byte 0x08587AEC
	thumb_func_end sub_0812F978

	thumb_func_start LoadSlotMachineWheelOverlay
LoadSlotMachineWheelOverlay: @ 0x0812F9A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r1, #4
	ldr r0, _0812FA98
	mov r8, r0
_0812F9B2:
	movs r0, #0
	lsls r1, r1, #0x10
	mov sb, r1
_0812F9B8:
	mov r2, r8
	ldr r1, [r2]
	mov r2, sb
	asrs r6, r2, #0x10
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r5, r6, r4
	adds r3, r5, #0
	adds r3, #0xa0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #3
	movs r2, #2
	bl LoadBgTilemap
	mov r0, r8
	ldr r1, [r0]
	adds r1, #2
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r3, r5, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #3
	movs r2, #2
	bl LoadBgTilemap
	mov r0, r8
	ldr r1, [r0]
	adds r1, #4
	adds r3, r5, #0
	adds r3, #0xc0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #3
	movs r2, #2
	bl LoadBgTilemap
	mov r2, r8
	ldr r1, [r2]
	adds r1, #6
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r7, r0, #0
	adds r3, r5, r7
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #3
	movs r2, #2
	bl LoadBgTilemap
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0812F9B8
	mov r2, r8
	ldr r1, [r2]
	adds r1, #8
	adds r3, r6, #0
	adds r3, #0xc0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #3
	movs r2, #2
	bl LoadBgTilemap
	mov r0, r8
	ldr r1, [r0]
	adds r1, #0xa
	adds r3, r6, r7
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #3
	movs r2, #2
	bl LoadBgTilemap
	movs r0, #7
_0812FA56:
	mov r2, r8
	ldr r1, [r2]
	adds r1, #0xc
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	lsls r3, r4, #5
	mov r0, sb
	asrs r5, r0, #0x10
	adds r3, r5, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #3
	movs r2, #2
	bl LoadBgTilemap
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0xb
	ble _0812FA56
	adds r0, r5, #5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	ble _0812F9B2
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FA98: .4byte 0x0203A79C
	thumb_func_end LoadSlotMachineWheelOverlay

	thumb_func_start sub_0812FA9C
sub_0812FA9C: @ 0x0812FA9C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [sp, #0x10]
	ldr r6, _0812FB0C
	ldr r0, [r6]
	strh r1, [r0]
	ldr r1, [r6]
	strh r2, [r1, #2]
	strh r3, [r1, #4]
	strh r5, [r1, #6]
	lsls r4, r4, #0x10
	asrs r5, r4, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0x11
	adds r4, r4, r0
	lsrs r4, r4, #0x10
	movs r0, #2
	movs r2, #2
	adds r3, r4, #0
	bl LoadBgTilemap
	ldr r1, [r6]
	adds r1, #2
	ldr r0, _0812FB10
	adds r3, r5, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #2
	movs r2, #2
	bl LoadBgTilemap
	ldr r1, [r6]
	adds r1, #4
	movs r0, #0x80
	lsls r0, r0, #2
	adds r3, r5, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #2
	movs r2, #2
	bl LoadBgTilemap
	ldr r1, [r6]
	adds r1, #6
	ldr r0, _0812FB14
	adds r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r0, #2
	movs r2, #2
	adds r3, r5, #0
	bl LoadBgTilemap
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812FB0C: .4byte 0x0203A7A8
_0812FB10: .4byte 0x000001E1
_0812FB14: .4byte 0x00000201
	thumb_func_end sub_0812FA9C

	thumb_func_start sub_0812FB18
sub_0812FB18: @ 0x0812FB18
	push {r4, lr}
	movs r4, #0
_0812FB1C:
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	ldr r0, _0812FB48
	adds r1, r1, r0
	lsls r3, r4, #5
	movs r0, #2
	movs r2, #0x3c
	bl LoadBgTilemap
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _0812FB1C
	movs r0, #3
	bl HideBg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812FB48: .4byte 0x08588154
	thumb_func_end sub_0812FB18

	thumb_func_start SlotMachineSetup_9_0
SlotMachineSetup_9_0: @ 0x0812FB4C
	ldr r1, _0812FBC0
	ldr r0, _0812FBC4
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0812FBC8
	ldr r0, [r0]
	str r0, [r1, #4]
	ldr r0, _0812FBCC
	ldr r0, [r0]
	str r0, [r1, #8]
	ldr r0, _0812FBD0
	ldr r0, [r0]
	str r0, [r1, #0xc]
	ldr r0, _0812FBD4
	ldr r0, [r0]
	str r0, [r1, #0x10]
	ldr r0, _0812FBD8
	ldr r0, [r0]
	str r0, [r1, #0x14]
	ldr r0, _0812FBDC
	ldr r0, [r0]
	str r0, [r1, #0x18]
	ldr r0, _0812FBE0
	ldr r0, [r0]
	str r0, [r1, #0x1c]
	ldr r0, _0812FBE4
	ldr r0, [r0]
	str r0, [r1, #0x20]
	ldr r0, _0812FBE8
	ldr r0, [r0]
	str r0, [r1, #0x24]
	ldr r0, _0812FBEC
	ldr r0, [r0]
	str r0, [r1, #0x28]
	str r0, [r1, #0x2c]
	str r0, [r1, #0x30]
	str r0, [r1, #0x34]
	ldr r0, _0812FBF0
	ldr r0, [r0]
	str r0, [r1, #0x38]
	str r0, [r1, #0x3c]
	str r0, [r1, #0x40]
	str r0, [r1, #0x44]
	str r0, [r1, #0x48]
	ldr r0, _0812FBF4
	ldr r0, [r0]
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	str r0, [r1, #0x54]
	ldr r0, _0812FBF8
	ldr r0, [r0]
	str r0, [r1, #0x58]
	str r0, [r1, #0x5c]
	str r0, [r1, #0x60]
	movs r0, #0
	str r0, [r1, #0x64]
	bx lr
	.align 2, 0
_0812FBC0: .4byte 0x03001188
_0812FBC4: .4byte 0x0203A7C0
_0812FBC8: .4byte 0x0203A7C4
_0812FBCC: .4byte 0x0203A7C8
_0812FBD0: .4byte 0x0203A7D0
_0812FBD4: .4byte 0x0203A7D4
_0812FBD8: .4byte 0x0203A7E4
_0812FBDC: .4byte 0x0203A7E8
_0812FBE0: .4byte 0x0203A7EC
_0812FBE4: .4byte 0x0203A7F0
_0812FBE8: .4byte 0x0203A7F4
_0812FBEC: .4byte 0x0203A7CC
_0812FBF0: .4byte 0x0203A7D8
_0812FBF4: .4byte 0x0203A7DC
_0812FBF8: .4byte 0x0203A7E0
	thumb_func_end SlotMachineSetup_9_0

	thumb_func_start SlotMachineSetup_8_0
SlotMachineSetup_8_0: @ 0x0812FBFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _0812FDA4
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r6, _0812FDA8
	ldr r1, [r6]
	str r1, [r0]
	movs r5, #0xc0
	lsls r5, r5, #3
	strh r5, [r0, #4]
	ldr r4, _0812FDAC
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	adds r1, r1, r5
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	mov r8, r1
	mov r2, r8
	strh r2, [r0, #4]
	ldr r4, _0812FDB0
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r1, r3
	str r1, [r0]
	mov r4, r8
	strh r4, [r0, #4]
	ldr r4, _0812FDB4
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r1, r2
	str r1, [r0]
	mov r3, r8
	strh r3, [r0, #4]
	ldr r4, _0812FDB8
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r1, r1, r4
	str r1, [r0]
	movs r5, #0xc0
	lsls r5, r5, #2
	strh r5, [r0, #4]
	ldr r4, _0812FDBC
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r0, #4]
	ldr r4, _0812FDC0
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r3, #0xa0
	lsls r3, r3, #5
	adds r1, r1, r3
	str r1, [r0]
	mov r4, r8
	strh r4, [r0, #4]
	ldr r4, _0812FDC4
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r2, #0xb0
	lsls r2, r2, #5
	adds r1, r1, r2
	str r1, [r0]
	strh r5, [r0, #4]
	ldr r4, _0812FDC8
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r3, #0xc8
	lsls r3, r3, #5
	adds r1, r1, r3
	str r1, [r0]
	strh r5, [r0, #4]
	ldr r4, _0812FDCC
	movs r0, #0x10
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r4, #0xe0
	lsls r4, r4, #5
	adds r2, r1, r4
	str r2, [r0]
	mov r2, r8
	strh r2, [r0, #4]
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r1, r1, r3
	str r1, [r0, #8]
	strh r2, [r0, #0xc]
	ldr r4, _0812FDD0
	movs r0, #8
	bl AllocZeroed
	str r0, [r4]
	ldr r1, [r6]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r1, r4
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r0, #4]
	ldr r4, _0812FDD4
	movs r0, #0x28
	bl AllocZeroed
	str r0, [r4]
	ldr r2, [r6]
	movs r3, #0x8a
	lsls r3, r3, #6
	adds r1, r2, r3
	str r1, [r0]
	movs r3, #0x80
	strh r3, [r0, #4]
	movs r4, #0x8c
	lsls r4, r4, #6
	adds r1, r2, r4
	str r1, [r0, #8]
	strh r3, [r0, #0xc]
	adds r4, #0x80
	adds r1, r2, r4
	str r1, [r0, #0x10]
	strh r3, [r0, #0x14]
	adds r4, #0x80
	adds r1, r2, r4
	str r1, [r0, #0x18]
	strh r3, [r0, #0x1c]
	movs r1, #0x92
	lsls r1, r1, #6
	adds r2, r2, r1
	str r2, [r0, #0x20]
	strh r3, [r0, #0x24]
	ldr r4, _0812FDD8
	movs r0, #0x10
	bl AllocZeroed
	str r0, [r4]
	ldr r2, [r6]
	movs r3, #0x98
	lsls r3, r3, #6
	adds r1, r2, r3
	str r1, [r0]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r0, #4]
	movs r4, #0xaa
	lsls r4, r4, #6
	adds r2, r2, r4
	str r2, [r0, #8]
	strh r1, [r0, #0xc]
	ldr r4, _0812FDDC
	movs r0, #0x10
	bl AllocZeroed
	str r0, [r4]
	ldr r2, [r6]
	movs r3, #0xbc
	lsls r3, r3, #6
	adds r1, r2, r3
	str r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #4]
	movs r4, #0xc2
	lsls r4, r4, #6
	adds r2, r2, r4
	str r2, [r0, #8]
	strh r1, [r0, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812FDA4: .4byte 0x0203A7C0
_0812FDA8: .4byte 0x0203A7A0
_0812FDAC: .4byte 0x0203A7C4
_0812FDB0: .4byte 0x0203A7C8
_0812FDB4: .4byte 0x0203A7CC
_0812FDB8: .4byte 0x0203A7D0
_0812FDBC: .4byte 0x0203A7D4
_0812FDC0: .4byte 0x0203A7D8
_0812FDC4: .4byte 0x0203A7DC
_0812FDC8: .4byte 0x0203A7E0
_0812FDCC: .4byte 0x0203A7E4
_0812FDD0: .4byte 0x0203A7E8
_0812FDD4: .4byte 0x0203A7EC
_0812FDD8: .4byte 0x0203A7F0
_0812FDDC: .4byte 0x0203A7F4
	thumb_func_end SlotMachineSetup_8_0

