.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitFieldMessageBox
InitFieldMessageBox: @ 0x08097AB0
	ldr r1, _08097AD4
	movs r0, #0
	strb r0, [r1]
	ldr r2, _08097AD8
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08097AD4: .4byte 0x0203725C
_08097AD8: .4byte 0x030030B4
	thumb_func_end InitFieldMessageBox

	thumb_func_start sub_08097ADC
sub_08097ADC: @ 0x08097ADC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08097B00
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08097B10
	cmp r0, #1
	bgt _08097B04
	cmp r0, #0
	beq _08097B0A
	b _08097B38
	.align 2, 0
_08097B00: .4byte 0x03005B60
_08097B04:
	cmp r0, #2
	beq _08097B20
	b _08097B38
_08097B0A:
	bl sub_08196F98
	b _08097B18
_08097B10:
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrame
_08097B18:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08097B38
_08097B20:
	bl RunTextPrintersAndIsPrinter0Active
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _08097B38
	ldr r1, _08097B40
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl DestroyTask
_08097B38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097B40: .4byte 0x0203725C
	thumb_func_end sub_08097ADC

	thumb_func_start task_add_textbox
task_add_textbox: @ 0x08097B44
	push {lr}
	ldr r0, _08097B54
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08097B54: .4byte 0x08097ADD
	thumb_func_end task_add_textbox

	thumb_func_start task_del_textbox
task_del_textbox: @ 0x08097B58
	push {lr}
	ldr r0, _08097B70
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08097B6C
	bl DestroyTask
_08097B6C:
	pop {r0}
	bx r0
	.align 2, 0
_08097B70: .4byte 0x08097ADD
	thumb_func_end task_del_textbox

	thumb_func_start ShowFieldMessage
ShowFieldMessage: @ 0x08097B74
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _08097B90
	ldrb r0, [r4]
	cmp r0, #0
	bne _08097B94
	adds r0, r1, #0
	movs r1, #1
	bl textbox_fdecode_auto_and_task_add
	movs r0, #2
	strb r0, [r4]
	movs r0, #1
	b _08097B96
	.align 2, 0
_08097B90: .4byte 0x0203725C
_08097B94:
	movs r0, #0
_08097B96:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ShowFieldMessage

	thumb_func_start sub_08097B9C
sub_08097B9C: @ 0x08097B9C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsMatchCallTaskActive
	adds r1, r0, #0
	cmp r1, #0
	bne _08097BB6
	ldr r0, _08097BBC
	strb r1, [r0]
	adds r0, r4, #0
	bl DestroyTask
_08097BB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097BBC: .4byte 0x0203725C
	thumb_func_end sub_08097B9C

	thumb_func_start sub_08097BC0
sub_08097BC0: @ 0x08097BC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08097BEC
	ldrb r0, [r5]
	cmp r0, #0
	bne _08097BF8
	ldr r0, _08097BF0
	adds r1, r4, #0
	bl StringExpandPlaceholders
	ldr r0, _08097BF4
	movs r1, #0
	bl CreateTask
	adds r0, r4, #0
	bl StartMatchCallFromScript
	movs r0, #2
	strb r0, [r5]
	movs r0, #1
	b _08097BFA
	.align 2, 0
_08097BEC: .4byte 0x0203725C
_08097BF0: .4byte 0x02021C7C
_08097BF4: .4byte 0x08097B9D
_08097BF8:
	movs r0, #0
_08097BFA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08097BC0

	thumb_func_start ShowFieldAutoScrollMessage
ShowFieldAutoScrollMessage: @ 0x08097C00
	push {lr}
	adds r1, r0, #0
	ldr r2, _08097C1C
	ldrb r0, [r2]
	cmp r0, #0
	bne _08097C20
	movs r0, #3
	strb r0, [r2]
	adds r0, r1, #0
	movs r1, #0
	bl textbox_fdecode_auto_and_task_add
	movs r0, #1
	b _08097C22
	.align 2, 0
_08097C1C: .4byte 0x0203725C
_08097C20:
	movs r0, #0
_08097C22:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShowFieldAutoScrollMessage

	thumb_func_start sub_08097C28
sub_08097C28: @ 0x08097C28
	push {lr}
	ldr r2, _08097C3C
	movs r1, #3
	strb r1, [r2]
	movs r1, #1
	bl textbox_fdecode_auto_and_task_add
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_08097C3C: .4byte 0x0203725C
	thumb_func_end sub_08097C28

	thumb_func_start sub_08097C40
sub_08097C40: @ 0x08097C40
	push {lr}
	ldr r1, _08097C58
	ldrb r0, [r1]
	cmp r0, #0
	bne _08097C5C
	movs r0, #2
	strb r0, [r1]
	bl textbox_auto_and_task_add
	movs r0, #1
	b _08097C5E
	.align 2, 0
_08097C58: .4byte 0x0203725C
_08097C5C:
	movs r0, #0
_08097C5E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08097C40

	thumb_func_start textbox_fdecode_auto_and_task_add
textbox_fdecode_auto_and_task_add: @ 0x08097C64
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08097C88
	adds r1, r2, #0
	bl StringExpandPlaceholders
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl AddTextPrinterForMessage
	bl task_add_textbox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C88: .4byte 0x02021C7C
	thumb_func_end textbox_fdecode_auto_and_task_add

	thumb_func_start textbox_auto_and_task_add
textbox_auto_and_task_add: @ 0x08097C8C
	push {lr}
	movs r0, #1
	bl AddTextPrinterForMessage
	bl task_add_textbox
	pop {r0}
	bx r0
	thumb_func_end textbox_auto_and_task_add

	thumb_func_start HideFieldMessageBox
HideFieldMessageBox: @ 0x08097C9C
	push {lr}
	bl task_del_textbox
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	ldr r1, _08097CB4
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08097CB4: .4byte 0x0203725C
	thumb_func_end HideFieldMessageBox

	thumb_func_start GetFieldMessageBoxMode
GetFieldMessageBoxMode: @ 0x08097CB8
	ldr r0, _08097CC0
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08097CC0: .4byte 0x0203725C
	thumb_func_end GetFieldMessageBoxMode

	thumb_func_start IsFieldMessageBoxHidden
IsFieldMessageBoxHidden: @ 0x08097CC4
	push {lr}
	ldr r0, _08097CD4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08097CD8
	movs r0, #0
	b _08097CDA
	.align 2, 0
_08097CD4: .4byte 0x0203725C
_08097CD8:
	movs r0, #1
_08097CDA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsFieldMessageBoxHidden

	thumb_func_start sub_08097CE0
sub_08097CE0: @ 0x08097CE0
	push {lr}
	bl task_del_textbox
	movs r0, #0
	movs r1, #1
	bl ClearStdWindowAndFrame
	ldr r1, _08097CF8
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08097CF8: .4byte 0x0203725C
	thumb_func_end sub_08097CE0

	thumb_func_start sub_08097CFC
sub_08097CFC: @ 0x08097CFC
	push {lr}
	bl task_del_textbox
	ldr r1, _08097D0C
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08097D0C: .4byte 0x0203725C
	thumb_func_end sub_08097CFC

