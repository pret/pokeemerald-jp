.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081D97DC
sub_081D97DC: @ 0x081D97DC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081D97F0
	ldr r2, _081D97F4
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_081D97F0: .4byte 0x081D9B79
_081D97F4: .4byte 0x081D97F9
	thumb_func_end sub_081D97DC

	thumb_func_start sub_081D97F8
sub_081D97F8: @ 0x081D97F8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081D980C
	ldr r2, _081D9810
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_081D980C: .4byte 0x081D9C49
_081D9810: .4byte 0x081D9815
	thumb_func_end sub_081D97F8

	thumb_func_start sub_081D9814
sub_081D9814: @ 0x081D9814
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #0
	ldr r5, _081D9894
	mov r8, r5
	ldr r0, _081D9898
	mov ip, r0
	add r1, sp, #4
	mov sb, r1
	ldrb r4, [r5]
	cmp r3, r4
	bhs _081D985E
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r4, r0, #3
	ldr r7, _081D989C
_081D9844:
	mov r0, sp
	adds r2, r0, r3
	adds r1, r3, #1
	lsls r0, r1, #1
	adds r0, r0, r4
	adds r0, r0, r7
	ldrh r0, [r0]
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldrb r1, [r5]
	cmp r3, r1
	blo _081D9844
_081D985E:
	movs r3, #0
	mov r4, r8
	ldrb r0, [r4]
	cmp r3, r0
	bhs _081D9882
	adds r4, r0, #0
	mov r2, sp
_081D986C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	bhs _081D9882
	mov r7, sp
	adds r1, r7, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _081D986C
_081D9882:
	mov r0, r8
	ldrb r0, [r0]
	cmp r3, r0
	bne _081D98A0
	movs r0, #0
	mov r1, ip
	strh r0, [r1]
	b _081D98A6
	.align 2, 0
_081D9894: .4byte 0x02039BD0
_081D9898: .4byte 0x02037280
_081D989C: .4byte 0x03005B68
_081D98A0:
	movs r0, #1
	mov r4, ip
	strh r0, [r4]
_081D98A6:
	movs r3, #0
	mov r7, r8
	mov r0, r8
	ldrb r0, [r0]
	cmp r3, r0
	bhs _081D98D6
	mov r4, sb
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r2, r0, #3
	ldr r5, _081D9934
_081D98BC:
	adds r1, r4, r3
	adds r0, r3, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r1, [r7]
	cmp r3, r1
	blo _081D98BC
_081D98D6:
	mov r4, r8
	ldrb r0, [r4]
	cmp r0, #4
	beq _081D9964
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D9964
	ldr r0, _081D9938
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r3, #1
	ldrb r1, [r4]
	adds r5, r0, #0
	cmp r3, r1
	bhs _081D9918
	adds r4, r5, #0
	mov r7, r8
	ldrb r1, [r7]
_081D9900:
	lsls r0, r3, #6
	adds r0, r0, r4
	adds r0, #0x2c
	ldrb r7, [r0]
	cmp r2, r7
	bhs _081D990E
	ldrb r2, [r0]
_081D990E:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r1
	blo _081D9900
_081D9918:
	cmp r2, #0
	beq _081D9922
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_081D9922:
	movs r4, #1
	movs r3, #0
	mov r0, r8
	ldrb r0, [r0]
	cmp r3, r0
	bhs _081D9958
	adds r0, r5, #0
	b _081D994E
	.align 2, 0
_081D9934: .4byte 0x03005B68
_081D9938: .4byte 0x02039AA0
_081D993C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, r8
	ldrb r1, [r1]
	cmp r3, r1
	bhs _081D9958
	lsls r0, r3, #6
	adds r0, r0, r5
_081D994E:
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D993C
	movs r4, #0
_081D9958:
	mov r0, sp
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r2, r4, #0
	bl sub_080DA460
_081D9964:
	mov r0, sb
	bl sub_080F8F64
	ldr r1, _081D9984
	strb r0, [r1]
	ldr r0, _081D9988
	ldrb r0, [r0]
	cmp r0, #3
	bhi _081D9994
	ldr r1, _081D998C
	ldr r2, _081D9990
	adds r0, r6, #0
	bl SetTaskFuncWithFollowupFunc
	b _081D99A2
	.align 2, 0
_081D9984: .4byte 0x02039BCB
_081D9988: .4byte 0x02039BD0
_081D998C: .4byte 0x081D9D19
_081D9990: .4byte 0x081D99B9
_081D9994:
	ldr r0, _081D99B0
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081D99B4
	str r0, [r1]
_081D99A2:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D99B0: .4byte 0x03005B60
_081D99B4: .4byte 0x081D99B9
	thumb_func_end sub_081D9814

	thumb_func_start sub_081D99B8
sub_081D99B8: @ 0x081D99B8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081D99D8
	ldrb r0, [r0]
	bl sub_080DA800
	ldr r1, _081D99DC
	ldr r2, _081D99E0
	adds r0, r4, #0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D99D8: .4byte 0x02039BCC
_081D99DC: .4byte 0x080FD795
_081D99E0: .4byte 0x081D99E5
	thumb_func_end sub_081D99B8

	thumb_func_start sub_081D99E4
sub_081D99E4: @ 0x081D99E4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	bl SortContestants
	ldr r1, _081D9A04
	ldr r2, _081D9A08
	adds r0, r4, #0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D9A04: .4byte 0x080FD825
_081D9A08: .4byte 0x080F8F99
	thumb_func_end sub_081D99E4

	thumb_func_start sub_081D9A0C
sub_081D9A0C: @ 0x081D9A0C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r7, r5, #2
	adds r0, r7, r5
	lsls r4, r0, #3
	ldr r6, _081D9A48
	adds r0, r4, r6
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _081D9ABE
	adds r0, r6, #0
	subs r0, #8
	adds r4, r4, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081D9A4C
	cmp r0, #1
	beq _081D9A7C
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	bl SwitchTaskToFollowupFunc
	b _081D9ABE
	.align 2, 0
_081D9A48: .4byte 0x03005B68
_081D9A4C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9ABE
	ldr r0, _081D9A74
	ldrb r0, [r0]
	lsls r0, r0, #6
	ldr r1, _081D9A78
	adds r0, r0, r1
	movs r1, #0x40
	bl sub_080FCD64
	cmp r0, #1
	bne _081D9ABE
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _081D9ABE
	.align 2, 0
_081D9A74: .4byte 0x02039BC5
_081D9A78: .4byte 0x02039AA0
_081D9A7C:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9ABE
	movs r4, #0
	ldr r0, _081D9A90
	adds r6, r7, #0
	b _081D9AAA
	.align 2, 0
_081D9A90: .4byte 0x02039BD0
_081D9A94:
	lsls r0, r4, #6
	ldr r1, _081D9AC4
	adds r0, r0, r1
	lsls r1, r4, #8
	ldr r2, _081D9AC8
	adds r1, r1, r2
	movs r2, #0x40
	bl memcpy
	adds r4, #1
	ldr r0, _081D9ACC
_081D9AAA:
	ldrb r0, [r0]
	cmp r4, r0
	blt _081D9A94
	ldr r0, _081D9AD0
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_081D9ABE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D9AC4: .4byte 0x02039AA0
_081D9AC8: .4byte 0x0202207C
_081D9ACC: .4byte 0x02039BD0
_081D9AD0: .4byte 0x03005B60
	thumb_func_end sub_081D9A0C

	thumb_func_start sub_081D9AD4
sub_081D9AD4: @ 0x081D9AD4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r5, r0, #3
	ldr r6, _081D9B10
	adds r0, r5, r6
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _081D9B64
	adds r0, r6, #0
	subs r0, #8
	adds r5, r5, r0
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _081D9B14
	cmp r0, #1
	beq _081D9B3C
	movs r0, #0
	strh r0, [r5, #8]
	strh r0, [r5, #0x20]
	adds r0, r4, #0
	bl SwitchTaskToFollowupFunc
	b _081D9B64
	.align 2, 0
_081D9B10: .4byte 0x03005B68
_081D9B14:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D9B5E
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9B64
	ldr r0, _081D9B38
	movs r1, #4
	bl sub_080FCD64
	cmp r0, #1
	bne _081D9B64
	b _081D9B5E
	.align 2, 0
_081D9B38: .4byte 0x03005AE0
_081D9B3C:
	movs r0, #0
	bl sub_080FCDA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9B64
	ldr r0, _081D9B6C
	ldr r4, _081D9B70
	adds r1, r4, #0
	movs r2, #4
	bl memcpy
	ldr r0, _081D9B74
	adds r1, r4, #0
	movs r2, #4
	bl memcpy
_081D9B5E:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_081D9B64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D9B6C: .4byte 0x03005AE0
_081D9B70: .4byte 0x0202207C
_081D9B74: .4byte 0x03005E18
	thumb_func_end sub_081D9AD4

	thumb_func_start sub_081D9B78
sub_081D9B78: @ 0x081D9B78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	mov sb, r0
	adds r0, r0, r6
	lsls r5, r0, #3
	ldr r1, _081D9BC4
	mov r8, r1
	adds r0, r5, r1
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _081D9C2E
	movs r0, #8
	rsbs r0, r0, #0
	add r0, r8
	mov sl, r0
	adds r4, r5, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081D9BC8
	cmp r0, #1
	beq _081D9BEA
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0x20]
	adds r0, r6, #0
	bl SwitchTaskToFollowupFunc
	b _081D9C2E
	.align 2, 0
_081D9BC4: .4byte 0x03005B68
_081D9BC8:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9C2E
	add r0, sp, #8
	movs r1, #0x6e
	strh r1, [r0]
	movs r1, #2
	bl sub_080FCD64
	cmp r0, #1
	bne _081D9C2E
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _081D9C2E
_081D9BEA:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9C2E
	movs r1, #0
	ldr r7, _081D9C40
	ldrb r0, [r7]
	cmp r1, r0
	bge _081D9C20
	mov r0, r8
	adds r0, #0xa
	adds r3, r5, r0
	ldr r4, _081D9C44
	mov r2, sp
	movs r5, #0x80
	lsls r5, r5, #1
_081D9C0C:
	ldrh r0, [r4]
	strh r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r4, r4, r5
	adds r2, #2
	adds r1, #1
	ldrb r0, [r7]
	cmp r1, r0
	blt _081D9C0C
_081D9C20:
	mov r0, sb
	adds r1, r0, r6
	lsls r1, r1, #3
	add r1, sl
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_081D9C2E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D9C40: .4byte 0x02039BD0
_081D9C44: .4byte 0x0202207C
	thumb_func_end sub_081D9B78

	thumb_func_start sub_081D9C48
sub_081D9C48: @ 0x081D9C48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	mov sb, r0
	adds r0, r0, r6
	lsls r5, r0, #3
	ldr r1, _081D9C94
	mov r8, r1
	adds r0, r5, r1
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _081D9CFE
	movs r0, #8
	rsbs r0, r0, #0
	add r0, r8
	mov sl, r0
	adds r4, r5, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081D9C98
	cmp r0, #1
	beq _081D9CBA
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0x20]
	adds r0, r6, #0
	bl SwitchTaskToFollowupFunc
	b _081D9CFE
	.align 2, 0
_081D9C94: .4byte 0x03005B68
_081D9C98:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9CFE
	ldrh r1, [r4, #0x1a]
	add r0, sp, #8
	strh r1, [r0]
	movs r1, #2
	bl sub_080FCD64
	cmp r0, #1
	bne _081D9CFE
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _081D9CFE
_081D9CBA:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9CFE
	movs r1, #0
	ldr r7, _081D9D10
	ldrb r0, [r7]
	cmp r1, r0
	bge _081D9CF0
	mov r0, r8
	adds r0, #2
	adds r3, r5, r0
	ldr r4, _081D9D14
	mov r2, sp
	movs r5, #0x80
	lsls r5, r5, #1
_081D9CDC:
	ldrh r0, [r4]
	strh r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r4, r4, r5
	adds r2, #2
	adds r1, #1
	ldrb r0, [r7]
	cmp r1, r0
	blt _081D9CDC
_081D9CF0:
	mov r0, sb
	adds r1, r0, r6
	lsls r1, r1, #3
	add r1, sl
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_081D9CFE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D9D10: .4byte 0x02039BD0
_081D9D14: .4byte 0x0202207C
	thumb_func_end sub_081D9C48

	thumb_func_start sub_081D9D18
sub_081D9D18: @ 0x081D9D18
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r4, r0, #3
	ldr r6, _081D9D54
	adds r0, r4, r6
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _081D9DB8
	adds r0, r6, #0
	subs r0, #8
	adds r4, r4, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081D9D58
	cmp r0, #1
	beq _081D9D90
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	bl SwitchTaskToFollowupFunc
	b _081D9DB8
	.align 2, 0
_081D9D54: .4byte 0x03005B68
_081D9D58:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D9DB2
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9DB8
	ldr r0, _081D9D88
	ldrb r2, [r0]
	lsls r0, r2, #6
	ldr r1, _081D9D8C
	adds r0, r0, r1
	movs r1, #4
	subs r1, r1, r2
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x10
	bl sub_080FCD64
	cmp r0, #1
	bne _081D9DB8
	b _081D9DB2
	.align 2, 0
_081D9D88: .4byte 0x02039BD0
_081D9D8C: .4byte 0x02039AA0
_081D9D90:
	movs r0, #0
	bl sub_080FCDA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9DB8
	ldr r0, _081D9DC0
	ldrb r3, [r0]
	lsls r0, r3, #6
	ldr r1, _081D9DC4
	adds r0, r0, r1
	ldr r1, _081D9DC8
	movs r2, #4
	subs r2, r2, r3
	lsls r2, r2, #6
	bl memcpy
_081D9DB2:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081D9DB8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D9DC0: .4byte 0x02039BD0
_081D9DC4: .4byte 0x02039AA0
_081D9DC8: .4byte 0x0202207C
	thumb_func_end sub_081D9D18

