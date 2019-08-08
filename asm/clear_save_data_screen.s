.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CB2_InitClearSaveDataScreen
CB2_InitClearSaveDataScreen: @ 0x0817AB80
	push {lr}
	bl SetupClearSaveDataScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0817AB94
	ldr r0, _0817AB98
	movs r1, #0
	bl CreateTask
_0817AB94:
	pop {r0}
	bx r0
	.align 2, 0
_0817AB98: .4byte 0x0817AB9D
	thumb_func_end CB2_InitClearSaveDataScreen

	thumb_func_start Task_DoClearSaveDataScreenYesNo
Task_DoClearSaveDataScreenYesNo: @ 0x0817AB9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0
	movs r2, #2
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, _0817ABF0
	movs r5, #2
	str r5, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, _0817ABF4
	str r5, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r2, #0
	movs r3, #2
	bl sub_08198C08
	ldr r1, _0817ABF8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0817ABFC
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817ABF0: .4byte 0x085CDB60
_0817ABF4: .4byte 0x085CDBA8
_0817ABF8: .4byte 0x03005B60
_0817ABFC: .4byte 0x0817AC01
	thumb_func_end Task_DoClearSaveDataScreenYesNo

	thumb_func_start Task_ClearSaveDataScreenYesNoChoice
Task_ClearSaveDataScreenYesNoChoice: @ 0x0817AC00
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0817AC28
	cmp r4, #0
	bgt _0817AC22
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0817AC60
	b _0817AC72
_0817AC22:
	cmp r4, #1
	beq _0817AC60
	b _0817AC72
_0817AC28:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _0817AC54
	movs r0, #2
	str r0, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r1, _0817AC58
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0817AC5C
	str r1, [r0]
	b _0817AC72
	.align 2, 0
_0817AC54: .4byte 0x085CDB7A
_0817AC58: .4byte 0x03005B60
_0817AC5C: .4byte 0x0817AC81
_0817AC60:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl DestroyTask
	ldr r0, _0817AC7C
	bl SetMainCallback2
_0817AC72:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817AC7C: .4byte 0x0817AE95
	thumb_func_end Task_ClearSaveDataScreenYesNoChoice

	thumb_func_start Task_ClearSaveData
Task_ClearSaveData: @ 0x0817AC80
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ClearSaveData
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _0817ACA0
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817ACA0: .4byte 0x0817AE95
	thumb_func_end Task_ClearSaveData

	thumb_func_start MainCB
MainCB: @ 0x0817ACA4
	push {lr}
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MainCB

