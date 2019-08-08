.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetTasks
ResetTasks: @ 0x080A8818
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r6, _080A886C
	adds r7, r6, #0
	adds r7, #8
_080A8822:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r6
	movs r1, #0
	strb r1, [r2, #4]
	ldr r1, _080A8870
	str r1, [r2]
	strb r4, [r2, #5]
	adds r4, #1
	strb r4, [r2, #6]
	movs r1, #1
	rsbs r1, r1, #0
	adds r5, r1, #0
	movs r1, #0xff
	strb r1, [r2, #7]
	adds r0, r0, r7
	movs r1, #0
	movs r2, #0x20
	bl memset
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #0xf
	bls _080A8822
	ldr r0, _080A886C
	movs r1, #0xfe
	strb r1, [r0, #5]
	ldr r1, _080A8874
	adds r0, r0, r1
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A886C: .4byte 0x03005B60
_080A8870: .4byte 0x080A8A41
_080A8874: .4byte 0x0000025E
	thumb_func_end ResetTasks

	thumb_func_start CreateTask
CreateTask: @ 0x080A8878
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r6, #0
	ldr r7, _080A88B4
_080A8884:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r5, r0, #3
	adds r4, r5, r7
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _080A88B8
	str r2, [r4]
	strb r1, [r4, #7]
	adds r0, r6, #0
	bl InsertTask
	adds r0, r7, #0
	adds r0, #8
	adds r0, r5, r0
	movs r1, #0
	movs r2, #0x20
	bl memset
	movs r0, #1
	strb r0, [r4, #4]
	adds r0, r6, #0
	b _080A88C4
	.align 2, 0
_080A88B4: .4byte 0x03005B60
_080A88B8:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _080A8884
	movs r0, #0
_080A88C4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CreateTask

	thumb_func_start InsertTask
InsertTask: @ 0x080A88CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl FindFirstActiveTask
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x10
	bne _080A88FC
	ldr r1, _080A88F8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xfe
	strb r1, [r0, #5]
	movs r1, #0xff
	strb r1, [r0, #6]
	b _080A8958
	.align 2, 0
_080A88F8: .4byte 0x03005B60
_080A88FC:
	ldr r6, _080A8938
	lsls r0, r4, #2
	mov ip, r0
	mov r8, r6
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r6
_080A890A:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r5, r0, #3
	mov r7, r8
	adds r3, r5, r7
	ldrb r0, [r2, #7]
	ldrb r7, [r3, #7]
	cmp r0, r7
	bhs _080A893C
	ldrb r0, [r3, #5]
	strb r0, [r2, #5]
	strb r1, [r2, #6]
	ldrb r0, [r3, #5]
	cmp r0, #0xfe
	beq _080A8934
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, r8
	strb r4, [r0, #6]
_080A8934:
	strb r4, [r3, #5]
	b _080A8958
	.align 2, 0
_080A8938: .4byte 0x03005B60
_080A893C:
	ldrb r0, [r3, #6]
	cmp r0, #0xff
	beq _080A8946
	adds r1, r0, #0
	b _080A890A
_080A8946:
	mov r2, ip
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	strb r1, [r0, #5]
	adds r2, r5, r6
	ldrb r1, [r2, #6]
	strb r1, [r0, #6]
	strb r4, [r2, #6]
_080A8958:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InsertTask

	thumb_func_start DestroyTask
DestroyTask: @ 0x080A8964
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080A8998
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r1, r4
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _080A89CE
	movs r0, #0
	strb r0, [r2, #4]
	ldrb r3, [r2, #5]
	cmp r3, #0xfe
	bne _080A899C
	ldrb r0, [r2, #6]
	cmp r0, #0xff
	beq _080A89CE
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	strb r3, [r0, #5]
	b _080A89CE
	.align 2, 0
_080A8998: .4byte 0x03005B60
_080A899C:
	ldrb r3, [r2, #6]
	adds r0, r3, #0
	cmp r0, #0xff
	bne _080A89B4
	ldrb r0, [r2, #5]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	movs r0, #0xff
	strb r0, [r1, #6]
	b _080A89CE
_080A89B4:
	ldrb r1, [r2, #5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	strb r3, [r0, #6]
	ldrb r1, [r2, #6]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r2, #5]
	strb r1, [r0, #5]
_080A89CE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroyTask

	thumb_func_start RunTasks
RunTasks: @ 0x080A89D4
	push {r4, r5, lr}
	bl FindFirstActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _080A89F8
	ldr r5, _080A8A00
_080A89E4:
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r5
	ldr r1, [r4]
	bl _call_via_r1
	ldrb r0, [r4, #6]
	cmp r0, #0xff
	bne _080A89E4
_080A89F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A00: .4byte 0x03005B60
	thumb_func_end RunTasks

	thumb_func_start FindFirstActiveTask
FindFirstActiveTask: @ 0x080A8A04
	push {lr}
	movs r2, #0
	ldr r0, _080A8A3C
	ldrb r1, [r0, #4]
	adds r3, r0, #0
	cmp r1, #1
	bne _080A8A18
	ldrb r0, [r3, #5]
	cmp r0, #0xfe
	beq _080A8A36
_080A8A18:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _080A8A36
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r3
	ldrb r0, [r1, #4]
	cmp r0, #1
	bne _080A8A18
	ldrb r0, [r1, #5]
	cmp r0, #0xfe
	bne _080A8A18
_080A8A36:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080A8A3C: .4byte 0x03005B60
	thumb_func_end FindFirstActiveTask

	thumb_func_start TaskDummy
TaskDummy: @ 0x080A8A40
	bx lr
	.align 2, 0
	thumb_func_end TaskDummy

	thumb_func_start SetTaskFuncWithFollowupFunc
SetTaskFuncWithFollowupFunc: @ 0x080A8A44
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080A8A74
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #3
	adds r0, r3, #0
	adds r0, #0x1c
	adds r4, r5, #0
	adds r4, #8
	adds r0, r0, r4
	strh r2, [r0]
	adds r0, r3, #0
	adds r0, #0x1e
	adds r0, r0, r4
	lsrs r2, r2, #0x10
	strh r2, [r0]
	adds r3, r3, r5
	str r1, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A74: .4byte 0x03005B60
	thumb_func_end SetTaskFuncWithFollowupFunc

	thumb_func_start SwitchTaskToFollowupFunc
SwitchTaskToFollowupFunc: @ 0x080A8A78
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080A8AA8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r3
	adds r0, r1, #0
	adds r0, #0x1c
	adds r3, #8
	adds r0, r0, r3
	ldrh r2, [r0]
	adds r1, #0x1e
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #0x10
	orrs r2, r0
	str r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8AA8: .4byte 0x03005B60
	thumb_func_end SwitchTaskToFollowupFunc

	thumb_func_start FuncIsActiveTask
FuncIsActiveTask: @ 0x080A8AAC
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r4, _080A8ACC
_080A8AB4:
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r4
	ldrb r0, [r1, #4]
	cmp r0, #1
	bne _080A8AD0
	ldr r0, [r1]
	cmp r0, r3
	bne _080A8AD0
	movs r0, #1
	b _080A8ADC
	.align 2, 0
_080A8ACC: .4byte 0x03005B60
_080A8AD0:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080A8AB4
	movs r0, #0
_080A8ADC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FuncIsActiveTask

	thumb_func_start FindTaskIdByFunc
FindTaskIdByFunc: @ 0x080A8AE4
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _080A8B00
_080A8AEC:
	ldrb r0, [r1, #4]
	cmp r0, #1
	bne _080A8B04
	ldr r0, [r1]
	cmp r0, r3
	bne _080A8B04
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	b _080A8B0E
	.align 2, 0
_080A8B00: .4byte 0x03005B60
_080A8B04:
	adds r1, #0x28
	adds r2, #1
	cmp r2, #0xf
	ble _080A8AEC
	movs r0, #0xff
_080A8B0E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FindTaskIdByFunc

	thumb_func_start GetTaskCount
GetTaskCount: @ 0x080A8B14
	push {lr}
	movs r2, #0
	movs r1, #0
	ldr r3, _080A8B40
_080A8B1C:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _080A8B30
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080A8B30:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _080A8B1C
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080A8B40: .4byte 0x03005B60
	thumb_func_end GetTaskCount

	thumb_func_start SetWordTaskArg
SetWordTaskArg: @ 0x080A8B44
	push {r4, r5, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0xe
	bhi _080A8B72
	ldr r2, _080A8B78
	lsls r0, r3, #1
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r2, #8
	adds r0, r0, r2
	strh r5, [r0]
	adds r0, r3, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r2
	lsrs r1, r5, #0x10
	strh r1, [r0]
_080A8B72:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8B78: .4byte 0x03005B60
	thumb_func_end SetWordTaskArg

	thumb_func_start GetWordTaskArg
GetWordTaskArg: @ 0x080A8B7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xe
	bls _080A8B8E
	movs r0, #0
	b _080A8BB0
_080A8B8E:
	ldr r3, _080A8BB8
	lsls r0, r1, #1
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #3
	adds r0, r0, r2
	adds r3, #8
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r1, #1
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r1, r1, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #0x10
	orrs r0, r1
_080A8BB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A8BB8: .4byte 0x03005B60
	thumb_func_end GetWordTaskArg

