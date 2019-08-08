.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AnimTask_ShakeMon
AnimTask_ShakeMon: @ 0x080D4A30
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080D4A50
	ldrb r0, [r4]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _080D4A54
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _080D4A90
	.align 2, 0
_080D4A50: .4byte 0x020380BE
_080D4A54:
	ldr r1, _080D4A98
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r4, #2]
	strh r1, [r0, #0x24]
	ldrh r1, [r4, #4]
	strh r1, [r0, #0x26]
	ldr r1, _080D4A9C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r2, [r0, #8]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0xe]
	ldrh r1, [r4, #2]
	strh r1, [r0, #0x10]
	ldrh r1, [r4, #4]
	strh r1, [r0, #0x12]
	ldr r1, _080D4AA0
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_080D4A90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4A98: .4byte 0x020205AC
_080D4A9C: .4byte 0x03005B60
_080D4AA0: .4byte 0x080D4AA5
	thumb_func_end AnimTask_ShakeMon

	thumb_func_start AnimTask_ShakeMonStep
AnimTask_ShakeMonStep: @ 0x080D4AA4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080D4AE0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r0, [r3, #0xe]
	movs r2, #0xe
	ldrsh r5, [r3, r2]
	adds r7, r1, #0
	cmp r5, #0
	bne _080D4B4A
	ldr r2, _080D4AE4
	movs r6, #8
	ldrsh r1, [r3, r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r6, #0x24
	ldrsh r0, [r1, r6]
	adds r6, r2, #0
	cmp r0, #0
	bne _080D4AE8
	ldrh r0, [r3, #0x10]
	strh r0, [r1, #0x24]
	b _080D4AEA
	.align 2, 0
_080D4AE0: .4byte 0x03005B60
_080D4AE4: .4byte 0x020205AC
_080D4AE8:
	strh r5, [r1, #0x24]
_080D4AEA:
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r3, r0, r7
	movs r0, #8
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	movs r5, #0x26
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bne _080D4B0A
	ldrh r0, [r3, #0x12]
	b _080D4B0C
_080D4B0A:
	movs r0, #0
_080D4B0C:
	strh r0, [r1, #0x26]
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r2, r0, r7
	ldrh r0, [r2, #0xc]
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #0xa]
	subs r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	bne _080D4B4E
	movs r0, #8
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r3, [r0, #0x24]
	movs r5, #8
	ldrsh r1, [r2, r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r3, [r0, #0x26]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _080D4B4E
_080D4B4A:
	subs r0, #1
	strh r0, [r3, #0xe]
_080D4B4E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_ShakeMonStep

	thumb_func_start AnimTask_ShakeMon2
AnimTask_ShakeMon2: @ 0x080D4B54
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	ldr r2, _080D4B7C
	ldrh r0, [r2]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r1, #3
	bgt _080D4B80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xff
	bne _080D4BD6
	b _080D4BDA
	.align 2, 0
_080D4B7C: .4byte 0x020380BE
_080D4B80:
	cmp r1, #8
	beq _080D4BCC
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #5
	beq _080D4BA0
	cmp r0, #5
	bgt _080D4B96
	cmp r0, #4
	beq _080D4B9C
	b _080D4BA8
_080D4B96:
	cmp r0, #6
	beq _080D4BA4
	b _080D4BA8
_080D4B9C:
	movs r0, #0
	b _080D4BAA
_080D4BA0:
	movs r0, #2
	b _080D4BAA
_080D4BA4:
	movs r0, #1
	b _080D4BAA
_080D4BA8:
	movs r0, #3
_080D4BAA:
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D4BC0
	movs r6, #1
_080D4BC0:
	ldr r0, _080D4BC8
	adds r0, r4, r0
	b _080D4BD4
	.align 2, 0
_080D4BC8: .4byte 0x02023E88
_080D4BCC:
	ldr r1, _080D4BE4
	ldr r0, _080D4BE8
	ldrb r0, [r0]
	adds r0, r0, r1
_080D4BD4:
	ldrb r3, [r0]
_080D4BD6:
	cmp r6, #0
	beq _080D4BEC
_080D4BDA:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _080D4C2A
	.align 2, 0
_080D4BE4: .4byte 0x02023E88
_080D4BE8: .4byte 0x020380D6
_080D4BEC:
	ldr r1, _080D4C30
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, _080D4C34
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x24]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0x26]
	ldr r1, _080D4C38
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r3, [r0, #8]
	ldrh r1, [r2, #6]
	strh r1, [r0, #0xa]
	ldrh r1, [r2, #8]
	strh r1, [r0, #0xc]
	ldrh r1, [r2, #8]
	strh r1, [r0, #0xe]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x10]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0x12]
	ldr r1, _080D4C3C
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_080D4C2A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4C30: .4byte 0x020205AC
_080D4C34: .4byte 0x020380BE
_080D4C38: .4byte 0x03005B60
_080D4C3C: .4byte 0x080D4C41
	thumb_func_end AnimTask_ShakeMon2

	thumb_func_start AnimTask_ShakeMon2Step
AnimTask_ShakeMon2Step: @ 0x080D4C40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080D4C84
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r2, [r3, #0xe]
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	mov ip, r1
	cmp r0, #0
	bne _080D4CF8
	ldr r2, _080D4C88
	movs r7, #8
	ldrsh r1, [r3, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	ldrh r5, [r3, #0x10]
	movs r7, #0x10
	ldrsh r0, [r3, r7]
	adds r7, r2, #0
	cmp r1, r0
	bne _080D4C8C
	rsbs r0, r5, #0
	strh r0, [r4, #0x24]
	b _080D4C8E
	.align 2, 0
_080D4C84: .4byte 0x03005B60
_080D4C88: .4byte 0x020205AC
_080D4C8C:
	strh r5, [r4, #0x24]
_080D4C8E:
	lsls r3, r6, #2
	adds r1, r3, r6
	lsls r1, r1, #3
	add r1, ip
	movs r0, #8
	ldrsh r2, [r1, r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r0, r7
	movs r0, #0x26
	ldrsh r2, [r4, r0]
	mov r8, r2
	ldrh r5, [r1, #0x12]
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	cmp r8, r0
	bne _080D4CB8
	rsbs r0, r5, #0
	strh r0, [r4, #0x26]
	b _080D4CBA
_080D4CB8:
	strh r5, [r4, #0x26]
_080D4CBA:
	adds r0, r3, r6
	lsls r0, r0, #3
	mov r4, ip
	adds r3, r0, r4
	ldrh r0, [r3, #0xc]
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #0xa]
	subs r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _080D4CFC
	movs r0, #8
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x24]
	movs r4, #8
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	b _080D4CFC
_080D4CF8:
	subs r0, r2, #1
	strh r0, [r3, #0xe]
_080D4CFC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_ShakeMon2Step

	thumb_func_start AnimTask_ShakeMonInPlace
AnimTask_ShakeMonInPlace: @ 0x080D4D08
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080D4D28
	ldrb r0, [r4]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xff
	bne _080D4D2C
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _080D4D7A
	.align 2, 0
_080D4D28: .4byte 0x020380BE
_080D4D2C:
	ldr r0, _080D4D80
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r4, #2]
	ldrh r2, [r1, #0x24]
	adds r0, r0, r2
	movs r2, #0
	strh r0, [r1, #0x24]
	ldrh r0, [r4, #4]
	ldrh r6, [r1, #0x26]
	adds r0, r0, r6
	strh r0, [r1, #0x26]
	ldr r0, _080D4D84
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r3, [r1, #8]
	strh r2, [r1, #0xa]
	ldrh r0, [r4, #6]
	strh r0, [r1, #0xc]
	strh r2, [r1, #0xe]
	ldrh r0, [r4, #8]
	strh r0, [r1, #0x10]
	movs r2, #2
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	strh r0, [r1, #0x12]
	movs r6, #4
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	strh r0, [r1, #0x14]
	ldr r2, _080D4D88
	str r2, [r1]
	adds r0, r5, #0
	bl _call_via_r2
_080D4D7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4D80: .4byte 0x020205AC
_080D4D84: .4byte 0x03005B60
_080D4D88: .4byte 0x080D4D8D
	thumb_func_end AnimTask_ShakeMonInPlace

	thumb_func_start AnimTask_ShakeMonInPlaceStep
AnimTask_ShakeMonInPlaceStep: @ 0x080D4D8C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080D4DE4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r2, [r4, #0xe]
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	adds r6, r1, #0
	cmp r0, #0
	beq _080D4DAA
	b _080D4EBC
_080D4DAA:
	ldrh r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D4DEC
	ldr r2, _080D4DE8
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x12]
	ldrh r3, [r0, #0x24]
	adds r1, r1, r3
	strh r1, [r0, #0x24]
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x14]
	ldrh r3, [r0, #0x26]
	adds r1, r1, r3
	strh r1, [r0, #0x26]
	adds r3, r2, #0
	b _080D4E16
	.align 2, 0
_080D4DE4: .4byte 0x03005B60
_080D4DE8: .4byte 0x020205AC
_080D4DEC:
	ldr r3, _080D4E78
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x24]
	ldrh r2, [r4, #0x12]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	movs r2, #8
	ldrsh r1, [r4, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x26]
	ldrh r2, [r4, #0x14]
	subs r1, r1, r2
	strh r1, [r0, #0x26]
_080D4E16:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r6
	ldrh r0, [r4, #0x10]
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xa]
	adds r2, r0, #1
	strh r2, [r4, #0xa]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r6, #0xc
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080D4EC0
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _080D4E7C
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
	ldrh r6, [r1, #0x24]
	adds r0, r0, r6
	strh r0, [r1, #0x24]
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
	ldrh r3, [r1, #0x26]
	adds r0, r0, r3
	strh r0, [r1, #0x26]
	b _080D4EB4
	.align 2, 0
_080D4E78: .4byte 0x020205AC
_080D4E7C:
	movs r6, #8
	ldrsh r0, [r4, r6]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	ldrh r0, [r2, #0x24]
	subs r0, r0, r1
	strh r0, [r2, #0x24]
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	ldrh r0, [r2, #0x26]
	subs r0, r0, r1
	strh r0, [r2, #0x26]
_080D4EB4:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _080D4EC0
_080D4EBC:
	subs r0, r2, #1
	strh r0, [r4, #0xe]
_080D4EC0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_ShakeMonInPlaceStep

	thumb_func_start AnimTask_ShakeAndSinkMon
AnimTask_ShakeAndSinkMon: @ 0x080D4EC8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080D4F18
	ldrb r0, [r5]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D4F1C
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r2, [r5, #2]
	strh r2, [r1, #0x24]
	ldr r2, _080D4F20
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r0, [r1, #8]
	ldrh r0, [r5, #2]
	strh r0, [r1, #0xa]
	ldrh r0, [r5, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r5, #6]
	strh r0, [r1, #0xe]
	ldrh r0, [r5, #8]
	strh r0, [r1, #0x10]
	ldr r2, _080D4F24
	str r2, [r1]
	adds r0, r4, #0
	bl _call_via_r2
	thumb_func_end AnimTask_ShakeAndSinkMon

	thumb_func_start sub_080D4F10
sub_080D4F10: @ 0x080D4F10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4F18: .4byte 0x020380BE
_080D4F1C: .4byte 0x020205AC
_080D4F20: .4byte 0x03005B60
_080D4F24: .4byte 0x080D4F29
	thumb_func_end sub_080D4F10

	thumb_func_start AnimTask_ShakeAndSinkMonStep
AnimTask_ShakeAndSinkMonStep: @ 0x080D4F28
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _080D4FB4
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrb r5, [r3, #8]
	ldrh r4, [r3, #0xa]
	ldrh r1, [r3, #0x18]
	adds r0, r1, #1
	strh r0, [r3, #0x18]
	movs r7, #0xc
	ldrsh r0, [r3, r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov ip, r2
	ldr r7, _080D4FB8
	cmp r0, r1
	bne _080D4F7A
	movs r0, #0
	strh r0, [r3, #0x18]
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, r0, r7
	ldrh r3, [r1, #0x24]
	movs r0, #0x24
	ldrsh r2, [r1, r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _080D4F72
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080D4F72:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	strh r0, [r1, #0x24]
_080D4F7A:
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #3
	add r2, ip
	strh r4, [r2, #0xa]
	ldrh r1, [r2, #0xe]
	ldrh r0, [r2, #0x1a]
	adds r1, r1, r0
	strh r1, [r2, #0x1a]
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	strh r1, [r0, #0x26]
	ldrh r0, [r2, #0x10]
	subs r0, #1
	strh r0, [r2, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080D4FAC
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_080D4FAC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4FB4: .4byte 0x03005B60
_080D4FB8: .4byte 0x020205AC
	thumb_func_end AnimTask_ShakeAndSinkMonStep

	thumb_func_start AnimTask_TranslateMonElliptical
AnimTask_TranslateMonElliptical: @ 0x080D4FBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #1
	ldr r4, _080D5030
	ldrb r0, [r4]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #5
	ble _080D4FE0
	movs r0, #5
	strh r0, [r4, #8]
_080D4FE0:
	movs r1, #0
	movs r2, #8
	ldrsh r0, [r4, r2]
	adds r3, r4, #0
	ldr r2, _080D5034
	mov ip, r2
	lsls r4, r5, #2
	ldr r2, _080D5038
	mov r8, r2
	cmp r1, r0
	bge _080D5006
	adds r2, r0, #0
_080D4FF8:
	lsls r0, r6, #0x19
	lsrs r6, r0, #0x18
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	blt _080D4FF8
_080D5006:
	adds r0, r4, r5
	lsls r0, r0, #3
	add r0, ip
	strh r7, [r0, #8]
	ldrh r1, [r3, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r3, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r3, #6]
	strh r1, [r0, #0xe]
	strh r6, [r0, #0x10]
	mov r1, r8
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5030: .4byte 0x020380BE
_080D5034: .4byte 0x03005B60
_080D5038: .4byte 0x080D503D
	thumb_func_end AnimTask_TranslateMonElliptical

	thumb_func_start sub_080D503C
sub_080D503C: @ 0x080D503C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r1, _080D50AC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrb r4, [r5, #8]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	movs r2, #0xa
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r2, _080D50B0
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r4, r1, r2
	strh r0, [r4, #0x24]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r1, [r5, #0xc]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r5, #0x10]
	ldrh r1, [r5, #0x12]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x12]
	cmp r0, #0
	bne _080D5094
	ldrh r0, [r5, #0xe]
	subs r0, #1
	strh r0, [r5, #0xe]
_080D5094:
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _080D50A6
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_080D50A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D50AC: .4byte 0x03005B60
_080D50B0: .4byte 0x020205AC
	thumb_func_end sub_080D503C

	thumb_func_start AnimTask_TranslateMonEllipticalRespectSide
AnimTask_TranslateMonEllipticalRespectSide: @ 0x080D50B4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080D50DC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D50D0
	ldr r1, _080D50E0
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_080D50D0:
	adds r0, r4, #0
	bl AnimTask_TranslateMonElliptical
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D50DC: .4byte 0x020380D6
_080D50E0: .4byte 0x020380BE
	thumb_func_end AnimTask_TranslateMonEllipticalRespectSide

	thumb_func_start DoHorizontalLunge
DoHorizontalLunge: @ 0x080D50E4
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080D510C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5114
	ldr r1, _080D5110
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	b _080D5118
	.align 2, 0
_080D510C: .4byte 0x020380D6
_080D5110: .4byte 0x020380BE
_080D5114:
	ldr r1, _080D5144
	ldrh r0, [r1, #2]
_080D5118:
	strh r0, [r4, #0x30]
	ldrh r2, [r1]
	movs r0, #0
	strh r2, [r4, #0x2e]
	strh r0, [r4, #0x32]
	ldr r1, _080D5148
	ldr r0, _080D514C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x34]
	strh r2, [r4, #0x36]
	ldr r1, _080D5150
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _080D5154
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5144: .4byte 0x020380BE
_080D5148: .4byte 0x02023E88
_080D514C: .4byte 0x020380D6
_080D5150: .4byte 0x080D5159
_080D5154: .4byte 0x080A5EF9
	thumb_func_end DoHorizontalLunge

	thumb_func_start ReverseHorizontalLungeDirection
ReverseHorizontalLungeDirection: @ 0x080D5158
	push {lr}
	ldrh r1, [r0, #0x36]
	strh r1, [r0, #0x2e]
	ldrh r1, [r0, #0x30]
	rsbs r1, r1, #0
	strh r1, [r0, #0x30]
	ldr r1, _080D5174
	str r1, [r0, #0x1c]
	ldr r1, _080D5178
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080D5174: .4byte 0x080A5EF9
_080D5178: .4byte 0x080A34C5
	thumb_func_end ReverseHorizontalLungeDirection

	thumb_func_start DoVerticalDip
DoVerticalDip: @ 0x080D517C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r5, _080D51BC
	ldrb r0, [r5, #4]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r2, [r5]
	movs r1, #0
	strh r2, [r4, #0x2e]
	strh r1, [r4, #0x30]
	ldrh r1, [r5, #2]
	strh r1, [r4, #0x32]
	strh r0, [r4, #0x34]
	strh r2, [r4, #0x36]
	ldr r1, _080D51C0
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _080D51C4
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D51BC: .4byte 0x020380BE
_080D51C0: .4byte 0x080D51C9
_080D51C4: .4byte 0x080A5EF9
	thumb_func_end DoVerticalDip

	thumb_func_start ReverseVerticalDipDirection
ReverseVerticalDipDirection: @ 0x080D51C8
	push {lr}
	ldrh r1, [r0, #0x36]
	strh r1, [r0, #0x2e]
	ldrh r1, [r0, #0x32]
	rsbs r1, r1, #0
	strh r1, [r0, #0x32]
	ldr r1, _080D51E4
	str r1, [r0, #0x1c]
	ldr r1, _080D51E8
	bl StoreSpriteCallbackInData6
	pop {r0}
	bx r0
	.align 2, 0
_080D51E4: .4byte 0x080A5EF9
_080D51E8: .4byte 0x080A34C5
	thumb_func_end ReverseVerticalDipDirection

	thumb_func_start SlideMonToOriginalPos
SlideMonToOriginalPos: @ 0x080D51EC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080D5204
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080D5210
	ldr r1, _080D5208
	ldr r0, _080D520C
	b _080D5214
	.align 2, 0
_080D5204: .4byte 0x020380BE
_080D5208: .4byte 0x02023E88
_080D520C: .4byte 0x020380D6
_080D5210:
	ldr r1, _080D5274
	ldr r0, _080D5278
_080D5214:
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	ldr r5, _080D527C
	ldrh r0, [r5, #4]
	movs r3, #0
	strh r0, [r6, #0x2e]
	ldr r0, _080D5280
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	ldrh r0, [r4, #0x20]
	strh r0, [r6, #0x32]
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r6, #0x34]
	ldrh r0, [r4, #0x22]
	strh r0, [r6, #0x36]
	adds r0, r6, #0
	str r3, [sp]
	bl InitSpriteDataForLinearTranslation
	ldr r3, [sp]
	strh r3, [r6, #0x34]
	strh r3, [r6, #0x36]
	ldrh r0, [r4, #0x24]
	strh r0, [r6, #0x38]
	ldrh r0, [r4, #0x26]
	strh r0, [r6, #0x3a]
	adds r2, r6, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _080D5284
	strh r3, [r6, #0x32]
	b _080D528A
	.align 2, 0
_080D5274: .4byte 0x02023E88
_080D5278: .4byte 0x020380D7
_080D527C: .4byte 0x020380BE
_080D5280: .4byte 0x020205AC
_080D5284:
	cmp r0, #2
	bne _080D528A
	strh r3, [r6, #0x30]
_080D528A:
	ldr r0, _080D52A0
	ldrh r1, [r0, #2]
	lsls r0, r7, #8
	orrs r0, r1
	strh r0, [r6, #0x3c]
	ldr r0, _080D52A4
	str r0, [r6, #0x1c]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D52A0: .4byte 0x020380BE
_080D52A4: .4byte 0x080D52A9
	thumb_func_end SlideMonToOriginalPos

	thumb_func_start SlideMonToOriginalPosStep
SlideMonToOriginalPosStep: @ 0x080D52A8
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3c]
	lsls r1, r0, #0x18
	lsrs r4, r1, #0x18
	adds r5, r4, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080D52E4
	adds r3, r1, r0
	ldrh r0, [r2, #0x2e]
	movs r6, #0x2e
	ldrsh r1, [r2, r6]
	cmp r1, #0
	bne _080D52E8
	cmp r4, #1
	bhi _080D52D2
	strh r1, [r3, #0x24]
_080D52D2:
	cmp r5, #2
	beq _080D52DA
	cmp r5, #0
	bne _080D52DC
_080D52DA:
	strh r1, [r3, #0x26]
_080D52DC:
	adds r0, r2, #0
	bl DestroyAnimSprite
	b _080D5312
	.align 2, 0
_080D52E4: .4byte 0x020205AC
_080D52E8:
	subs r0, #1
	strh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x30]
	ldrh r0, [r2, #0x34]
	adds r1, r1, r0
	strh r1, [r2, #0x34]
	ldrh r0, [r2, #0x32]
	ldrh r4, [r2, #0x36]
	adds r0, r0, r4
	strh r0, [r2, #0x36]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r6, [r2, #0x38]
	adds r1, r1, r6
	strh r1, [r3, #0x24]
	ldrh r0, [r2, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r2, #0x3a]
	adds r0, r0, r2
	strh r0, [r3, #0x26]
_080D5312:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end SlideMonToOriginalPosStep

	thumb_func_start SlideMonToOffset
SlideMonToOffset: @ 0x080D5318
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080D532C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080D5334
	ldr r0, _080D5330
	b _080D5336
	.align 2, 0
_080D532C: .4byte 0x020380BE
_080D5330: .4byte 0x020380D6
_080D5334:
	ldr r0, _080D53B4
_080D5336:
	ldrb r2, [r0]
	ldr r0, _080D53B8
	adds r0, r2, r0
	ldrb r6, [r0]
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5360
	ldr r1, _080D53BC
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	movs r2, #6
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _080D5360
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_080D5360:
	ldr r2, _080D53BC
	ldrh r0, [r2, #8]
	movs r4, #0
	strh r0, [r5, #0x2e]
	ldr r0, _080D53C0
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x20]
	strh r0, [r5, #0x30]
	ldrh r0, [r2, #2]
	ldrh r3, [r1, #0x20]
	adds r0, r0, r3
	strh r0, [r5, #0x32]
	ldrh r0, [r1, #0x22]
	strh r0, [r5, #0x34]
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
	adds r0, r5, #0
	bl InitSpriteDataForLinearTranslation
	strh r4, [r5, #0x34]
	strh r4, [r5, #0x36]
	strh r6, [r5, #0x38]
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080D53C4
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _080D53C8
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D53B4: .4byte 0x020380D7
_080D53B8: .4byte 0x02023E88
_080D53BC: .4byte 0x020380BE
_080D53C0: .4byte 0x020205AC
_080D53C4: .4byte 0x080A34C5
_080D53C8: .4byte 0x080A5F49
	thumb_func_end SlideMonToOffset

	thumb_func_start sub_080D53CC
sub_080D53CC: @ 0x080D53CC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080D53EC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080D53F4
	ldr r0, _080D53F0
	b _080D53F6
	.align 2, 0
_080D53EC: .4byte 0x020380BE
_080D53F0: .4byte 0x020380D6
_080D53F4:
	ldr r0, _080D5474
_080D53F6:
	ldrb r1, [r0]
	ldr r0, _080D5478
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r0, r1, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5420
	ldr r1, _080D547C
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	movs r2, #6
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _080D5420
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	strh r0, [r1, #4]
_080D5420:
	ldr r5, _080D547C
	ldrh r0, [r5, #8]
	strh r0, [r6, #0x2e]
	ldr r0, _080D5480
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r6, #0x34]
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x36]
	adds r0, r6, #0
	bl InitSpriteDataForLinearTranslation
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #8
	strh r0, [r6, #0x34]
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #8
	strh r0, [r6, #0x36]
	strh r7, [r6, #0x38]
	ldrh r0, [r5, #0xa]
	strh r0, [r6, #0x3a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080D5488
	ldr r1, _080D5484
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
	b _080D5490
	.align 2, 0
_080D5474: .4byte 0x020380D7
_080D5478: .4byte 0x02023E88
_080D547C: .4byte 0x020380BE
_080D5480: .4byte 0x020205AC
_080D5484: .4byte 0x080A34C5
_080D5488:
	ldr r1, _080D549C
	adds r0, r6, #0
	bl StoreSpriteCallbackInData6
_080D5490:
	ldr r0, _080D54A0
	str r0, [r6, #0x1c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D549C: .4byte 0x080D54A5
_080D54A0: .4byte 0x080A5F49
	thumb_func_end sub_080D53CC

	thumb_func_start sub_080D54A4
sub_080D54A4: @ 0x080D54A4
	push {r4, lr}
	ldr r4, _080D54D0
	movs r1, #0x38
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r3, #0
	strh r3, [r1, #0x24]
	movs r1, #0x38
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	strh r3, [r1, #0x26]
	bl DestroyAnimSprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D54D0: .4byte 0x020205AC
	thumb_func_end sub_080D54A4

	thumb_func_start AnimTask_WindUpLunge
AnimTask_WindUpLunge: @ 0x080D54D4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _080D5558
	movs r0, #6
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #8
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _080D555C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5506
	ldrh r0, [r5, #2]
	rsbs r0, r0, #0
	strh r0, [r5, #2]
	ldrh r0, [r5, #0xa]
	rsbs r0, r0, #0
	strh r0, [r5, #0xa]
_080D5506:
	ldrb r0, [r5]
	bl GetAnimBattlerSpriteId
	ldr r1, _080D5560
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #3
	adds r4, r4, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #8]
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	movs r2, #6
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, #0xa]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0xc]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0xe]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x10]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, #0x12]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #0x14]
	strh r7, [r4, #0x16]
	ldr r0, _080D5564
	str r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5558: .4byte 0x020380BE
_080D555C: .4byte 0x020380D6
_080D5560: .4byte 0x03005B60
_080D5564: .4byte 0x080D5569
	thumb_func_end AnimTask_WindUpLunge

	thumb_func_start AnimTask_WindUpLungePart1
AnimTask_WindUpLungePart1: @ 0x080D5568
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D55C0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r2
	ldrb r1, [r5, #8]
	ldrh r0, [r5, #0xa]
	ldrh r2, [r5, #0x1e]
	adds r0, r0, r2
	strh r0, [r5, #0x1e]
	ldr r2, _080D55C4
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	adds r4, r4, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r4, #0x24]
	ldrh r0, [r5, #0x1c]
	lsrs r0, r0, #8
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r5, #0x16]
	ldrh r1, [r5, #0x1c]
	adds r0, r0, r1
	strh r0, [r5, #0x1c]
	ldrh r0, [r5, #0xe]
	subs r0, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080D55B8
	ldr r0, _080D55C8
	str r0, [r5]
_080D55B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D55C0: .4byte 0x03005B60
_080D55C4: .4byte 0x020205AC
_080D55C8: .4byte 0x080D55CD
	thumb_func_end AnimTask_WindUpLungePart1

	thumb_func_start AnimTask_WindUpLungePart2
AnimTask_WindUpLungePart2: @ 0x080D55CC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _080D55F0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080D55F4
	subs r0, r1, #1
	strh r0, [r4, #0x10]
	b _080D5628
	.align 2, 0
_080D55F0: .4byte 0x03005B60
_080D55F4:
	ldrb r0, [r4, #8]
	ldrh r2, [r4, #0x12]
	ldrh r1, [r4, #0x20]
	adds r2, r2, r1
	strh r2, [r4, #0x20]
	ldr r3, _080D5630
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x18
	ldrh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r2, r2, r0
	strh r2, [r1, #0x24]
	ldrh r0, [r4, #0x14]
	subs r0, #1
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080D5628
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_080D5628:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5630: .4byte 0x020205AC
	thumb_func_end AnimTask_WindUpLungePart2

	thumb_func_start sub_080D5634
sub_080D5634: @ 0x080D5634
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080D5658
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _080D5662
	cmp r0, #2
	bgt _080D565C
	cmp r0, #0
	blt _080D5694
	ldrb r0, [r1]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _080D569C
	.align 2, 0
_080D5658: .4byte 0x020380BE
_080D565C:
	cmp r0, #3
	beq _080D566C
	b _080D5694
_080D5662:
	ldr r5, _080D5668
	b _080D566E
	.align 2, 0
_080D5668: .4byte 0x020380D6
_080D566C:
	ldr r5, _080D568C
_080D566E:
	ldrb r0, [r5]
	movs r4, #2
	eors r0, r4
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5694
	ldr r1, _080D5690
	ldrb r0, [r5]
	eors r0, r4
	adds r0, r0, r1
	ldrb r2, [r0]
	b _080D569C
	.align 2, 0
_080D568C: .4byte 0x020380D7
_080D5690: .4byte 0x02023E88
_080D5694:
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	b _080D56DC
_080D569C:
	ldr r1, _080D56BC
	lsls r4, r6, #2
	adds r0, r4, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	strh r2, [r5, #8]
	ldr r0, _080D56C0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D56C8
	ldr r0, _080D56C4
	ldrh r0, [r0, #2]
	b _080D56CE
	.align 2, 0
_080D56BC: .4byte 0x03005B60
_080D56C0: .4byte 0x020380D7
_080D56C4: .4byte 0x020380BE
_080D56C8:
	ldr r0, _080D56E4
	ldrh r0, [r0, #2]
	rsbs r0, r0, #0
_080D56CE:
	strh r0, [r5, #0xa]
	ldr r0, _080D56E8
	adds r1, r4, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D56EC
	str r0, [r1]
_080D56DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D56E4: .4byte 0x020380BE
_080D56E8: .4byte 0x03005B60
_080D56EC: .4byte 0x080D56F1
	thumb_func_end sub_080D5634

	thumb_func_start sub_080D56F0
sub_080D56F0: @ 0x080D56F0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080D5734
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r2, [r1, #8]
	ldr r3, _080D5738
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r1, #0xa]
	ldrh r2, [r0, #0x24]
	adds r1, r1, r2
	strh r1, [r0, #0x24]
	movs r2, #0x24
	ldrsh r1, [r0, r2]
	movs r2, #0x20
	ldrsh r0, [r0, r2]
	adds r1, r1, r0
	adds r1, #0x20
	movs r0, #0x98
	lsls r0, r0, #1
	cmp r1, r0
	bls _080D572E
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_080D572E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5734: .4byte 0x03005B60
_080D5738: .4byte 0x020205AC
	thumb_func_end sub_080D56F0

	thumb_func_start AnimTask_SwayMon
AnimTask_SwayMon: @ 0x080D573C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _080D578C
	ldrb r0, [r6]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5758
	ldr r1, _080D5790
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_080D5758:
	ldr r4, _080D5790
	ldrb r0, [r4, #8]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D5794
	lsls r3, r5, #2
	adds r1, r3, r5
	lsls r1, r1, #3
	adds r2, r1, r2
	ldrh r1, [r4]
	strh r1, [r2, #8]
	ldrh r1, [r4, #2]
	strh r1, [r2, #0xa]
	ldrh r1, [r4, #4]
	strh r1, [r2, #0xc]
	ldrh r1, [r4, #6]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080D5798
	ldrb r0, [r6]
	b _080D579C
	.align 2, 0
_080D578C: .4byte 0x020380D6
_080D5790: .4byte 0x020380BE
_080D5794: .4byte 0x03005B60
_080D5798:
	ldr r0, _080D57B4
	ldrb r0, [r0]
_080D579C:
	strh r0, [r2, #0x12]
	ldr r1, _080D57B8
	adds r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #0x20]
	ldr r1, _080D57BC
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D57B4: .4byte 0x020380D7
_080D57B8: .4byte 0x03005B60
_080D57BC: .4byte 0x080D57C1
	thumb_func_end AnimTask_SwayMon

	thumb_func_start AnimTask_SwayMonStep
AnimTask_SwayMonStep: @ 0x080D57C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080D5810
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrb r7, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	lsls r1, r0, #0x10
	strh r0, [r4, #0x1c]
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r0, r8
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov sb, r5
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080D5818
	ldr r0, _080D5814
	lsls r2, r7, #4
	adds r1, r2, r7
	lsls r1, r1, #2
	adds r1, r1, r0
	strh r5, [r1, #0x24]
	mov sb, r0
	adds r4, r2, #0
	b _080D585E
	.align 2, 0
_080D5810: .4byte 0x03005B60
_080D5814: .4byte 0x020205AC
_080D5818:
	ldrb r0, [r4, #0x12]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D5840
	ldr r1, _080D583C
	lsls r2, r7, #4
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r3, r0, r1
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov sb, r1
	adds r4, r2, #0
	cmp r0, #0
	bge _080D585C
	b _080D585A
	.align 2, 0
_080D583C: .4byte 0x020205AC
_080D5840:
	ldr r1, _080D58E0
	lsls r2, r7, #4
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r3, r0, r1
	mov r4, sb
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov sb, r1
	adds r4, r2, #0
	cmp r0, #0
	bge _080D585A
	rsbs r0, r0, #0
_080D585A:
	rsbs r0, r0, #0
_080D585C:
	strh r0, [r3, #0x26]
_080D585E:
	mov r5, r8
	cmp r5, #0x7f
	bls _080D5880
	ldr r1, _080D58E4
	lsls r2, r6, #2
	adds r0, r2, r6
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r5, #0x1e
	ldrsh r0, [r3, r5]
	adds r5, r1, #0
	cmp r0, #0
	bne _080D5880
	movs r1, #0x20
	ldrsh r0, [r3, r1]
	cmp r0, #1
	beq _080D58A2
_080D5880:
	mov r2, r8
	cmp r2, #0x7e
	bhi _080D58D4
	ldr r1, _080D58E4
	lsls r2, r6, #2
	adds r0, r2, r6
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r5, #0x1e
	ldrsh r0, [r3, r5]
	adds r5, r1, #0
	cmp r0, #1
	bne _080D58D4
	movs r1, #0x20
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _080D58D4
_080D58A2:
	adds r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r0, [r1, #0x1e]
	movs r2, #1
	eors r0, r2
	strh r0, [r1, #0x1e]
	ldrh r0, [r1, #0x20]
	eors r0, r2
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0xe]
	subs r0, #1
	strh r0, [r1, #0xe]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	bne _080D58D4
	adds r0, r4, r7
	lsls r0, r0, #2
	add r0, sb
	strh r3, [r0, #0x24]
	strh r3, [r0, #0x26]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_080D58D4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D58E0: .4byte 0x020205AC
_080D58E4: .4byte 0x03005B60
	thumb_func_end AnimTask_SwayMonStep

	thumb_func_start AnimTask_ScaleMonAndRestore
AnimTask_ScaleMonAndRestore: @ 0x080D58E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _080D5934
	ldrb r0, [r6, #6]
	bl GetAnimBattlerSpriteId
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r1, [r6, #8]
	adds r0, r5, #0
	bl PrepareBattlerSpriteForRotScale
	ldr r1, _080D5938
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r6]
	strh r1, [r0, #8]
	ldrh r1, [r6, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r6, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r6, #4]
	strh r1, [r0, #0xe]
	strh r5, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #0x1c]
	strh r1, [r0, #0x1e]
	ldr r1, _080D593C
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D5934: .4byte 0x020380BE
_080D5938: .4byte 0x03005B60
_080D593C: .4byte 0x080D5941
	thumb_func_end AnimTask_ScaleMonAndRestore

	thumb_func_start AnimTask_ScaleMonAndRestoreStep
AnimTask_ScaleMonAndRestoreStep: @ 0x080D5940
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _080D59A0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0xa]
	ldrh r3, [r4, #0x1e]
	adds r0, r0, r3
	strh r0, [r4, #0x1e]
	ldrb r0, [r4, #0x10]
	adds r6, r0, #0
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	movs r3, #0x1e
	ldrsh r2, [r4, r3]
	adds r0, r6, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _080D59B0
	ldrh r2, [r4, #0xe]
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r0, #0
	ble _080D59A4
	ldrh r0, [r4, #8]
	rsbs r0, r0, #0
	strh r0, [r4, #8]
	ldrh r0, [r4, #0xa]
	rsbs r0, r0, #0
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	strh r1, [r4, #0xe]
	b _080D59B0
	.align 2, 0
_080D59A0: .4byte 0x03005B60
_080D59A4:
	adds r0, r6, #0
	bl ResetSpriteRotScale
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_080D59B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimTask_ScaleMonAndRestoreStep

	thumb_func_start sub_080D59B8
sub_080D59B8: @ 0x080D59B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _080D59F4
	ldrb r0, [r4, #4]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldr r1, _080D59F8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r1, #0
	strh r1, [r2, #0xa]
	ldrh r0, [r4]
	strh r0, [r2, #0xc]
	movs r3, #6
	ldrsh r0, [r4, r3]
	cmp r0, #1
	beq _080D59FC
	strh r1, [r2, #0xe]
	b _080D5A08
	.align 2, 0
_080D59F4: .4byte 0x020380BE
_080D59F8: .4byte 0x03005B60
_080D59FC:
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	adds r3, r0, #0
	muls r3, r1, r3
	adds r0, r3, #0
	strh r0, [r2, #0xe]
_080D5A08:
	ldr r1, _080D5A34
	lsls r4, r7, #2
	adds r0, r4, r7
	lsls r0, r0, #3
	adds r5, r0, r1
	ldr r6, _080D5A38
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x10]
	mov r0, r8
	strh r0, [r5, #0x12]
	ldrh r0, [r6, #6]
	strh r0, [r5, #0x14]
	bl IsContest
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	beq _080D5A3C
	movs r0, #1
	strh r0, [r5, #0x16]
	b _080D5A60
	.align 2, 0
_080D5A34: .4byte 0x03005B60
_080D5A38: .4byte 0x020380BE
_080D5A3C:
	movs r1, #4
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080D5A4C
	ldr r0, _080D5A48
	b _080D5A4E
	.align 2, 0
_080D5A48: .4byte 0x020380D6
_080D5A4C:
	ldr r0, _080D5AA4
_080D5A4E:
	ldrb r0, [r0]
	bl GetBattlerSide
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D5A5E
	movs r1, #1
_080D5A5E:
	strh r1, [r5, #0x16]
_080D5A60:
	ldr r0, _080D5AA8
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r4, r1, r0
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080D5A8C
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D5A8C
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0xe]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_080D5A8C:
	ldr r0, _080D5AA8
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D5AAC
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5AA4: .4byte 0x020380D7
_080D5AA8: .4byte 0x03005B60
_080D5AAC: .4byte 0x080D5B8D
	thumb_func_end sub_080D59B8

	thumb_func_start sub_080D5AB0
sub_080D5AB0: @ 0x080D5AB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080D5AEC
	ldrb r0, [r4, #4]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	ldr r1, _080D5AF0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xa]
	ldrh r1, [r4]
	strh r1, [r0, #0xc]
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080D5AF8
	ldr r0, _080D5AF4
	b _080D5AFA
	.align 2, 0
_080D5AEC: .4byte 0x020380BE
_080D5AF0: .4byte 0x03005B60
_080D5AF4: .4byte 0x020380D6
_080D5AF8:
	ldr r0, _080D5B28
_080D5AFA:
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5B0C
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_080D5B0C:
	ldr r0, _080D5B2C
	movs r2, #6
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #1
	beq _080D5B34
	ldr r2, _080D5B30
	lsls r3, r5, #2
	adds r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0xe]
	b _080D5B4E
	.align 2, 0
_080D5B28: .4byte 0x020380D7
_080D5B2C: .4byte 0x020380BE
_080D5B30: .4byte 0x03005B60
_080D5B34:
	ldr r3, _080D5B84
	lsls r4, r5, #2
	adds r0, r4, r5
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r2, [r6]
	ldrh r1, [r6, #2]
	adds r7, r2, #0
	muls r7, r1, r7
	adds r1, r7, #0
	strh r1, [r0, #0xe]
	adds r2, r3, #0
	adds r3, r4, #0
_080D5B4E:
	adds r1, r3, r5
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r6, #2]
	strh r0, [r1, #0x10]
	mov r0, r8
	strh r0, [r1, #0x12]
	ldrh r0, [r6, #6]
	strh r0, [r1, #0x14]
	movs r0, #1
	strh r0, [r1, #0x16]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #0xe]
	movs r7, #0x10
	ldrsh r0, [r1, r7]
	rsbs r0, r0, #0
	strh r0, [r1, #0x10]
	ldr r0, _080D5B88
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5B84: .4byte 0x03005B60
_080D5B88: .4byte 0x080D5B8D
	thumb_func_end sub_080D5AB0

	thumb_func_start sub_080D5B8C
sub_080D5B8C: @ 0x080D5B8C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080D5BE4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x10]
	ldrh r1, [r4, #0xe]
	adds r0, r0, r1
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #0x12]
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0xe]
	adds r1, r2, #0
	bl SetSpriteRotScale
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080D5BC0
	ldrb r0, [r4, #0x12]
	bl SetBattlerSpriteYOffsetFromRotation
_080D5BC0:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080D5C06
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080D5BE8
	cmp r0, #1
	ble _080D5BEE
	cmp r0, #2
	beq _080D5BF6
	b _080D5BEE
	.align 2, 0
_080D5BE4: .4byte 0x03005B60
_080D5BE8:
	ldrb r0, [r4, #0x12]
	bl ResetSpriteRotScale
_080D5BEE:
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _080D5C06
_080D5BF6:
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
	movs r0, #1
	strh r0, [r4, #0x14]
_080D5C06:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080D5B8C

	thumb_func_start sub_080D5C0C
sub_080D5C0C: @ 0x080D5C0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080D5C38
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0
	bne _080D5C44
	ldr r4, _080D5C3C
	lsls r5, r7, #2
	adds r0, r5, r7
	lsls r0, r0, #3
	adds r6, r0, r4
	ldr r0, _080D5C40
	ldrh r0, [r0]
	movs r1, #0xc
	bl __udivsi3
	b _080D5C58
	.align 2, 0
_080D5C38: .4byte 0x020380BE
_080D5C3C: .4byte 0x03005B60
_080D5C40: .4byte 0x020380A8
_080D5C44:
	ldr r4, _080D5CE0
	lsls r5, r7, #2
	adds r0, r5, r7
	lsls r0, r0, #3
	adds r6, r0, r4
	ldr r0, _080D5CE4
	ldr r0, [r0]
	movs r1, #0xc
	bl __divsi3
_080D5C58:
	strh r0, [r6, #0x26]
	lsls r0, r0, #0x10
	adds r1, r4, #0
	cmp r0, #0
	bgt _080D5C66
	movs r0, #1
	strh r0, [r6, #0x26]
_080D5C66:
	movs r2, #0x26
	ldrsh r0, [r6, r2]
	cmp r0, #0x10
	ble _080D5C72
	movs r0, #0x10
	strh r0, [r6, #0x26]
_080D5C72:
	adds r4, r5, r7
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r5, #0
	strh r1, [r4, #0x24]
	ldrh r2, [r4, #0x26]
	movs r0, #1
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	strh r5, [r4, #0x20]
	mov r1, r8
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x1c]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x1e]
	movs r0, #1
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x16]
	ldr r2, _080D5CE8
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x24]
	strh r0, [r4, #0x18]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x26]
	strh r0, [r4, #0x1a]
	strh r5, [r4, #8]
	mov r1, r8
	ldrh r0, [r1, #2]
	strh r0, [r4, #0xa]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xc]
	ldr r0, _080D5CEC
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5CE0: .4byte 0x03005B60
_080D5CE4: .4byte 0x020380A4
_080D5CE8: .4byte 0x020205AC
_080D5CEC: .4byte 0x080D5CF1
	thumb_func_end sub_080D5C0C

	thumb_func_start sub_080D5CF0
sub_080D5CF0: @ 0x080D5CF0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080D5D44
	adds r3, r0, r1
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xa
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _080D5DCE
	movs r0, #0
	strh r0, [r3, #8]
	ldrh r0, [r3, #0x20]
	adds r1, r0, #1
	movs r0, #1
	ands r1, r0
	strh r1, [r3, #0x20]
	movs r2, #0x1c
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _080D5D62
	cmp r1, #0
	beq _080D5D4C
	ldr r2, _080D5D48
	movs r0, #0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0x22]
	ldrh r2, [r3, #0x18]
	adds r1, r1, r2
	b _080D5D60
	.align 2, 0
_080D5D44: .4byte 0x03005B60
_080D5D48: .4byte 0x020205AC
_080D5D4C:
	ldr r2, _080D5D88
	movs r0, #0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0x18]
	ldrh r2, [r3, #0x24]
	subs r1, r1, r2
_080D5D60:
	strh r1, [r0, #0x24]
_080D5D62:
	movs r1, #0x1e
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _080D5D9C
	movs r2, #0x20
	ldrsh r4, [r3, r2]
	cmp r4, #0
	beq _080D5D8C
	ldr r2, _080D5D88
	movs r0, #0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #0x26]
	strh r1, [r0, #0x26]
	b _080D5D9C
	.align 2, 0
_080D5D88: .4byte 0x020205AC
_080D5D8C:
	ldr r2, _080D5DD4
	movs r0, #0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r4, [r0, #0x26]
_080D5D9C:
	ldrh r0, [r3, #0xc]
	subs r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	bne _080D5DCE
	ldr r2, _080D5DD4
	movs r0, #0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r4, [r0, #0x24]
	movs r0, #0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r4, [r0, #0x26]
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_080D5DCE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5DD4: .4byte 0x020205AC
	thumb_func_end sub_080D5CF0

