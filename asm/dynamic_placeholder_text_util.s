.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DynamicPlaceholderTextUtil_Reset
DynamicPlaceholderTextUtil_Reset: @ 0x081AF8C8
	push {lr}
	ldr r1, _081AF8E0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_081AF8D2:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _081AF8D2
	pop {r0}
	bx r0
	.align 2, 0
_081AF8E0: .4byte 0x0203CB68
	thumb_func_end DynamicPlaceholderTextUtil_Reset

	thumb_func_start DynamicPlaceholderTextUtil_SetPlaceholderPtr
DynamicPlaceholderTextUtil_SetPlaceholderPtr: @ 0x081AF8E4
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _081AF8F8
	ldr r1, _081AF8FC
	lsls r0, r0, #2
	adds r0, r0, r1
	str r2, [r0]
_081AF8F8:
	pop {r0}
	bx r0
	.align 2, 0
_081AF8FC: .4byte 0x0203CB68
	thumb_func_end DynamicPlaceholderTextUtil_SetPlaceholderPtr

	thumb_func_start DynamicPlaceholderTextUtil_ExpandPlaceholders
DynamicPlaceholderTextUtil_ExpandPlaceholders: @ 0x081AF900
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _081AF940
	ldr r5, _081AF91C
_081AF910:
	cmp r1, #0xf7
	beq _081AF920
	strb r1, [r2]
	adds r4, #1
	adds r2, #1
	b _081AF938
	.align 2, 0
_081AF91C: .4byte 0x0203CB68
_081AF920:
	adds r4, #1
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _081AF936
	adds r0, r2, #0
	bl StringCopy
	adds r2, r0, #0
_081AF936:
	adds r4, #1
_081AF938:
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _081AF910
_081AF940:
	movs r0, #0xff
	strb r0, [r2]
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end DynamicPlaceholderTextUtil_ExpandPlaceholders

	thumb_func_start DynamicPlaceholderTextUtil_GetPlaceholderPtr
DynamicPlaceholderTextUtil_GetPlaceholderPtr: @ 0x081AF94C
	lsls r0, r0, #0x18
	ldr r1, _081AF958
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_081AF958: .4byte 0x0203CB68
	thumb_func_end DynamicPlaceholderTextUtil_GetPlaceholderPtr

