.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetVramOamAndBgCntRegs
ResetVramOamAndBgCntRegs: @ 0x08121D90
	push {r4, lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08121DF4
	mov r0, sp
	bl CpuSet
	movs r4, #0
	str r4, [sp, #4]
	add r0, sp, #4
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ldr r2, _08121DF8
	bl CpuSet
	add r0, sp, #8
	strh r4, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _08121DFC
	bl CpuSet
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08121DF4: .4byte 0x0100C000
_08121DF8: .4byte 0x05000100
_08121DFC: .4byte 0x01000200
	thumb_func_end ResetVramOamAndBgCntRegs

	thumb_func_start ResetAllBgsCoordinates
ResetAllBgsCoordinates: @ 0x08121E00
	push {lr}
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
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
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
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetAllBgsCoordinates

	thumb_func_start SetVBlankHBlankCallbacksToNull
SetVBlankHBlankCallbacksToNull: @ 0x08121E58
	push {lr}
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetVBlankHBlankCallbacksToNull

	thumb_func_start DisplayMessageAndContinueTask
DisplayMessageAndContinueTask: @ 0x08121E6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08121EF8
	strb r6, [r0]
	adds r0, r6, #0
	movs r1, #1
	bl DrawDialogFrameWithCustomTileAndPalette
	ldr r4, _08121EFC
	ldr r0, [sp, #0x30]
	cmp r0, r4
	beq _08121EB0
	adds r0, r4, #0
	ldr r1, [sp, #0x30]
	bl StringExpandPlaceholders
_08121EB0:
	ldr r2, _08121F00
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl AddTextPrinterParameterized2
	ldr r1, _08121F04
	ldr r0, [sp, #0x34]
	str r0, [r1]
	ldr r1, _08121F08
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08121F0C
	str r1, [r0]
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08121EF8: .4byte 0x02039E0C
_08121EFC: .4byte 0x02021C7C
_08121F00: .4byte 0x030030B4
_08121F04: .4byte 0x0300117C
_08121F08: .4byte 0x03005B60
_08121F0C: .4byte 0x08121F2D
	thumb_func_end DisplayMessageAndContinueTask

	thumb_func_start RunTextPrintersRetIsActive
RunTextPrintersRetIsActive: @ 0x08121F10
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl RunTextPrinters
	adds r0, r4, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end RunTextPrintersRetIsActive

	thumb_func_start Task_ContinueTaskAfterMessagePrints
Task_ContinueTaskAfterMessagePrints: @ 0x08121F2C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08121F50
	ldrb r0, [r0]
	bl RunTextPrintersRetIsActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08121F4A
	ldr r0, _08121F54
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_08121F4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08121F50: .4byte 0x02039E0C
_08121F54: .4byte 0x0300117C
	thumb_func_end Task_ContinueTaskAfterMessagePrints

	thumb_func_start DoYesNoFuncWithChoice
DoYesNoFuncWithChoice: @ 0x08121F58
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08121F78
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [r3]
	str r2, [r3, #4]
	ldr r2, _08121F7C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _08121F80
	str r0, [r1]
	bx lr
	.align 2, 0
_08121F78: .4byte 0x02039E04
_08121F7C: .4byte 0x03005B60
_08121F80: .4byte 0x08121FE9
	thumb_func_end DoYesNoFuncWithChoice

	thumb_func_start CreateYesNoMenuWithCallbacks
CreateYesNoMenuWithCallbacks: @ 0x08121F84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #0x20]
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x28]
	ldr r7, [sp, #0x2c]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	bl sub_08198C08
	ldr r2, _08121FDC
	ldr r0, [r7]
	ldr r1, [r7, #4]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r1, _08121FE0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08121FE4
	str r1, [r0]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08121FDC: .4byte 0x02039E04
_08121FE0: .4byte 0x03005B60
_08121FE4: .4byte 0x08121FE9
	thumb_func_end CreateYesNoMenuWithCallbacks

	thumb_func_start Task_CallYesOrNoCallback
Task_CallYesOrNoCallback: @ 0x08121FE8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0812200E
	cmp r1, #0
	bgt _08122008
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08122024
	b _08122034
_08122008:
	cmp r1, #1
	beq _08122024
	b _08122034
_0812200E:
	movs r0, #5
	bl PlaySE
	ldr r0, _08122020
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	b _08122034
	.align 2, 0
_08122020: .4byte 0x02039E04
_08122024:
	movs r0, #5
	bl PlaySE
	ldr r0, _0812203C
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
_08122034:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812203C: .4byte 0x02039E04
	thumb_func_end Task_CallYesOrNoCallback

	thumb_func_start AdjustQuantityAccordingToDPadInput
AdjustQuantityAccordingToDPadInput: @ 0x08122040
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r5, r1, #0
	ldrh r4, [r2]
	adds r6, r4, #0
	ldr r0, _08122074
	ldrh r0, [r0, #0x30]
	movs r3, #0xf0
	ands r3, r0
	cmp r3, #0x40
	bne _08122078
	adds r0, r4, #1
	strh r0, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, r1
	ble _0812206A
	movs r0, #1
	strh r0, [r2]
_0812206A:
	movs r0, #0
	ldrsh r1, [r2, r0]
_0812206E:
	lsls r0, r4, #0x10
	b _081220C2
	.align 2, 0
_08122074: .4byte 0x03002360
_08122078:
	cmp r3, #0x80
	bne _0812208E
	subs r0, r4, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08122088
	strh r1, [r2]
_08122088:
	movs r3, #0
	ldrsh r1, [r2, r3]
	b _0812206E
_0812208E:
	cmp r3, #0x10
	bne _081220A8
	adds r0, r4, #0
	adds r0, #0xa
	strh r0, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, r5
	ble _081220A2
	strh r5, [r2]
_081220A2:
	movs r3, #0
	ldrsh r1, [r2, r3]
	b _0812206E
_081220A8:
	cmp r3, #0x20
	bne _081220D2
	adds r0, r4, #0
	subs r0, #0xa
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _081220BC
	movs r0, #1
	strh r0, [r2]
_081220BC:
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r6, #0x10
_081220C2:
	asrs r0, r0, #0x10
	cmp r1, r0
	beq _081220D2
	movs r0, #5
	bl PlaySE
	movs r0, #1
	b _081220D4
_081220D2:
	movs r0, #0
_081220D4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AdjustQuantityAccordingToDPadInput

	thumb_func_start GetLRKeysState
GetLRKeysState: @ 0x081220DC
	push {lr}
	ldr r0, _081220FC
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _08122112
	ldr r0, _08122100
	ldrh r1, [r0, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08122104
	movs r0, #1
	b _08122114
	.align 2, 0
_081220FC: .4byte 0x03005AF0
_08122100: .4byte 0x03002360
_08122104:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08122112
	movs r0, #2
	b _08122114
_08122112:
	movs r0, #0
_08122114:
	pop {r1}
	bx r1
	thumb_func_end GetLRKeysState

	thumb_func_start sub_08122118
sub_08122118: @ 0x08122118
	push {lr}
	ldr r0, _08122138
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _0812214E
	ldr r0, _0812213C
	ldrh r1, [r0, #0x30]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08122140
	movs r0, #1
	b _08122150
	.align 2, 0
_08122138: .4byte 0x03005AF0
_0812213C: .4byte 0x03002360
_08122140:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0812214E
	movs r0, #2
	b _08122150
_0812214E:
	movs r0, #0
_08122150:
	pop {r1}
	bx r1
	thumb_func_end sub_08122118

	thumb_func_start sub_08122154
sub_08122154: @ 0x08122154
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _08122180
	ldr r0, _08122178
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _0812217C
	cmp r1, r0
	beq _08122172
	bl InUnionRoom
	cmp r0, #1
	bne _08122180
_08122172:
	movs r0, #0
	b _08122182
	.align 2, 0
_08122178: .4byte 0x03005AEC
_0812217C: .4byte 0x00001919
_08122180:
	movs r0, #1
_08122182:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08122154

	thumb_func_start itemid_80BF6D8_mail_related
itemid_80BF6D8_mail_related: @ 0x08122188
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl IsUpdateLinkStateCBActive
	cmp r0, #1
	beq _0812219E
	bl InUnionRoom
	cmp r0, #1
	bne _081221B0
_0812219E:
	adds r0, r4, #0
	bl ItemIsMail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081221B0
	movs r0, #0
	b _081221B2
_081221B0:
	movs r0, #1
_081221B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end itemid_80BF6D8_mail_related

	thumb_func_start sub_081221B8
sub_081221B8: @ 0x081221B8
	push {lr}
	bl IsUpdateLinkStateCBActive
	cmp r0, #1
	beq _081221CA
	ldr r0, _081221D0
	ldrb r0, [r0]
	cmp r0, #1
	bne _081221D4
_081221CA:
	movs r0, #1
	b _081221D6
	.align 2, 0
_081221D0: .4byte 0x030031C4
_081221D4:
	movs r0, #0
_081221D6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081221B8

	thumb_func_start sub_081221DC
sub_081221DC: @ 0x081221DC
	push {lr}
	bl sub_081221B8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081221F2
	bl sub_08086EFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081221F4
_081221F2:
	movs r0, #0
_081221F4:
	pop {r1}
	bx r1
	thumb_func_end sub_081221DC

	thumb_func_start sub_081221F8
sub_081221F8: @ 0x081221F8
	push {lr}
	bl sub_081221DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0812220E
	bl sub_0800AFD8
	cmp r0, #1
	bne _08122212
_0812220E:
	movs r0, #1
	b _08122214
_08122212:
	movs r0, #0
_08122214:
	pop {r1}
	bx r1
	thumb_func_end sub_081221F8

	thumb_func_start sub_08122218
sub_08122218: @ 0x08122218
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	ldr r2, [sp, #0x10]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r3]
	movs r2, #0
	lsrs r1, r1, #0x18
	cmp r2, r1
	bhs _0812224C
_08122232:
	lsls r0, r2, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	beq _08122242
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_08122242:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r1
	blo _08122232
_0812224C:
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bls _0812225E
	strb r5, [r6]
	b _08122260
_0812225E:
	strb r1, [r6]
_08122260:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08122218

	thumb_func_start sub_08122268
sub_08122268: @ 0x08122268
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrh r0, [r4]
	cmp r0, #0
	beq _08122286
	adds r0, r0, r2
	cmp r0, r3
	ble _08122286
	subs r0, r3, r2
	strh r0, [r4]
_08122286:
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r0, r1
	cmp r0, r3
	blt _0812229C
	cmp r3, #0
	bne _08122298
	strh r3, [r5]
	b _0812229C
_08122298:
	subs r0, r3, #1
	strh r0, [r5]
_0812229C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08122268

	thumb_func_start sub_081222A4
sub_081222A4: @ 0x081222A4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [sp, #0x14]
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	lsls r2, r0, #0x18
	lsrs r0, r2, #0x18
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _081222FC
	lsrs r2, r2, #0x19
	ldrh r0, [r4]
	cmp r0, r2
	blo _0812232E
	movs r1, #0
	subs r0, r0, r2
	cmp r1, r0
	bge _0812232E
	ldrh r0, [r5]
	adds r0, r0, r7
	cmp r0, r6
	beq _0812232E
_081222D8:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrh r0, [r4]
	subs r0, r0, r2
	cmp r1, r0
	bge _0812232E
	ldrh r0, [r5]
	adds r0, r0, r7
	cmp r0, r6
	bne _081222D8
	b _0812232E
_081222FC:
	ldrh r3, [r4]
	lsrs r2, r2, #0x19
	adds r0, r2, #1
	cmp r3, r0
	blt _0812232E
	movs r1, #0
	subs r0, r3, r2
	b _08122322
_0812230C:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrh r0, [r4]
	subs r0, r0, r2
_08122322:
	cmp r1, r0
	bgt _0812232E
	ldrh r0, [r5]
	adds r0, r0, r7
	cmp r0, r6
	bne _0812230C
_0812232E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081222A4

	thumb_func_start LoadListMenuArrowsGfx
LoadListMenuArrowsGfx: @ 0x08122334
	push {lr}
	ldr r0, _08122348
	bl LoadCompressedSpriteSheet
	ldr r0, _0812234C
	bl LoadCompressedSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_08122348: .4byte 0x0857B0E4
_0812234C: .4byte 0x0857B0EC
	thumb_func_end LoadListMenuArrowsGfx

	thumb_func_start sub_08122350
sub_08122350: @ 0x08122350
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	cmp r5, r6
	bhs _081223A8
	ldr r7, _081223B4
_08122364:
	lsls r1, r5, #4
	ldr r0, _081223B8
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	mov r1, r8
	adds r4, r1, r5
	strb r0, [r4]
	cmp r5, #0
	beq _0812238A
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	movs r1, #1
	bl StartSpriteAnim
_0812238A:
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r6
	blo _08122364
_081223A8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081223B4: .4byte 0x020205AC
_081223B8: .4byte 0x0857B0F4
	thumb_func_end sub_08122350

	thumb_func_start sub_081223BC
sub_081223BC: @ 0x081223BC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _08122402
	ldr r7, _081223E4
_081223CC:
	subs r0, r5, #1
	cmp r4, r0
	bne _081223E8
	adds r0, r6, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	bl DestroySpriteAndFreeResources
	b _081223F8
	.align 2, 0
_081223E4: .4byte 0x020205AC
_081223E8:
	adds r0, r6, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	bl DestroySprite
_081223F8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _081223CC
_08122402:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081223BC

	thumb_func_start sub_08122408
sub_08122408: @ 0x08122408
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x18
	movs r3, #0
	cmp r3, r4
	bhs _0812244A
	ldr r1, _08122450
	mov ip, r1
	movs r1, #1
	ands r0, r1
	lsls r5, r0, #2
	movs r7, #5
	rsbs r7, r7, #0
_08122428:
	adds r0, r6, r3
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	blo _08122428
_0812244A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122450: .4byte 0x020205AC
	thumb_func_end sub_08122408

	thumb_func_start sub_08122454
sub_08122454: @ 0x08122454
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	movs r0, #0x80
	ands r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0x7f
	ands r4, r0
	movs r3, #0
	cmp r3, r4
	bhs _081224D4
	ldr r5, _081224A8
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, #8
	mov ip, r0
_0812248A:
	subs r0, r4, #1
	cmp r3, r0
	bne _081224AC
	mov r0, r8
	cmp r0, #0
	beq _081224AC
	adds r2, r6, r3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, ip
	strh r1, [r0, #0x24]
	b _081224BA
	.align 2, 0
_081224A8: .4byte 0x020205AC
_081224AC:
	adds r2, r6, r3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r7, [r0, #0x24]
_081224BA:
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, sb
	adds r1, #1
	strh r1, [r0, #0x22]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	blo _0812248A
_081224D4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08122454

