.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ScriptMenu_Multichoice
ScriptMenu_Multichoice: @ 0x080E12C8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r0, _080E1304
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E130C
	ldr r0, _080E1308
	movs r1, #0xff
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl DrawMultichoiceMenu
	movs r0, #1
	b _080E130E
	.align 2, 0
_080E1304: .4byte 0x080E1569
_080E1308: .4byte 0x02037290
_080E130C:
	movs r0, #0
_080E130E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScriptMenu_Multichoice

	thumb_func_start ScriptMenu_MultichoiceWithDefault
ScriptMenu_MultichoiceWithDefault: @ 0x080E1318
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r4, [sp, #0x1c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080E1360
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E1368
	ldr r1, _080E1364
	movs r0, #0xff
	strh r0, [r1]
	str r4, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl DrawMultichoiceMenu
	movs r0, #1
	b _080E136A
	.align 2, 0
_080E1360: .4byte 0x080E1569
_080E1364: .4byte 0x02037290
_080E1368:
	movs r0, #0
_080E136A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScriptMenu_MultichoiceWithDefault

	thumb_func_start sub_080E1378
sub_080E1378: @ 0x080E1378
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _080E13AC
_080E1380:
	cmp r1, #0xfd
	bne _080E13A4
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #1
	bne _080E13AC
	ldr r0, _080E13A0
	ldr r0, [r0]
	bl StringLength
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	b _080E13AC
	.align 2, 0
_080E13A0: .4byte 0x03005AF0
_080E13A4:
	adds r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080E13AC:
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _080E1380
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080E1378

	thumb_func_start ScrSpecial_CreatePCMenu
ScrSpecial_CreatePCMenu: @ 0x080E13BC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r7]
	bl sub_080E1378
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #1
	cmp r5, r4
	bhs _080E13F2
_080E13D4:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r0, [r0]
	bl sub_080E1378
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bhs _080E13E8
	adds r6, r0, #0
_080E13E8:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r4
	blo _080E13D4
_080E13F2:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrSpecial_CreatePCMenu

	thumb_func_start DrawMultichoiceMenu
DrawMultichoiceMenu: @ 0x080E13FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	mov sb, r2
	mov sl, r3
	ldr r0, [sp, #0x34]
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, _080E14C8
	mov r2, sb
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrb r6, [r0, #4]
	ldr r7, [r0]
	adds r0, r7, #0
	adds r1, r6, #0
	bl ScrSpecial_CreatePCMenu
	adds r2, r0, #0
	lsls r2, r2, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	lsls r3, r6, #0x19
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl CreateWindowFromRect
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r5, #0x10
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl sub_081988CC
	str r5, [sp]
	str r6, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	mov r0, sl
	adds r1, r6, #0
	adds r2, r4, #0
	mov r3, sb
	bl sub_080E14CC
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E14C8: .4byte 0x08564218
	thumb_func_end DrawMultichoiceMenu

	thumb_func_start sub_080E14CC
sub_080E14CC: @ 0x080E14CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r1, _080E152C
	movs r0, #2
	strb r0, [r1]
	movs r2, #0
	ldr r6, _080E1530
	ldr r5, _080E1534
	movs r3, #0xc
_080E14F6:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r4
	bne _080E1500
	strb r3, [r1]
_080E1500:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _080E14F6
	adds r0, r6, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080E1538
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r1
	mov r0, r8
	strh r0, [r1, #0x10]
	cmp r7, #3
	bls _080E153C
	movs r0, #1
	b _080E153E
	.align 2, 0
_080E152C: .4byte 0x02039C30
_080E1530: .4byte 0x080E1569
_080E1534: .4byte 0x08564618
_080E1538: .4byte 0x03005B60
_080E153C:
	movs r0, #0
_080E153E:
	strh r0, [r1, #0x12]
	ldr r1, _080E1564
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	mov r1, sb
	strh r1, [r0, #0x14]
	strh r4, [r0, #0x16]
	adds r0, r4, #0
	bl sub_080E1F88
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1564: .4byte 0x03005B60
	thumb_func_end sub_080E14CC

	thumb_func_start Task_HandleMultichoiceInput
Task_HandleMultichoiceInput: @ 0x080E1568
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _080E1594
	adds r5, r0, r1
	ldr r0, _080E1598
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080E160C
	ldr r1, _080E159C
	ldrb r0, [r1]
	cmp r0, #0
	beq _080E15A0
	subs r0, #1
	strb r0, [r1]
	b _080E160C
	.align 2, 0
_080E1594: .4byte 0x03005B68
_080E1598: .4byte 0x02037C74
_080E159C: .4byte 0x02039C30
_080E15A0:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080E15AE
	bl Menu_ProcessInputNoWrap
	b _080E15B2
_080E15AE:
	bl Menu_ProcessInput
_080E15B2:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080E15F0
	ldrh r1, [r0, #0x2e]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080E15C8
	ldrb r0, [r5, #0xe]
	bl sub_080E1F88
_080E15C8:
	lsls r0, r4, #0x18
	asrs r1, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080E160C
	adds r0, #1
	cmp r1, r0
	bne _080E15F8
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080E160C
	movs r0, #5
	bl PlaySE
	ldr r1, _080E15F4
	movs r0, #0x7f
	strh r0, [r1]
	b _080E15FC
	.align 2, 0
_080E15F0: .4byte 0x03002360
_080E15F4: .4byte 0x02037290
_080E15F8:
	ldr r0, _080E1614
	strh r1, [r0]
_080E15FC:
	ldrb r0, [r5, #0xc]
	bl ClearToTransparentAndRemoveWindow
	adds r0, r6, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_080E160C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1614: .4byte 0x02037290
	thumb_func_end Task_HandleMultichoiceInput

	thumb_func_start ScriptMenu_YesNo
ScriptMenu_YesNo: @ 0x080E1618
	push {r4, lr}
	ldr r4, _080E1640
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E1648
	ldr r1, _080E1644
	movs r0, #0xff
	strh r0, [r1]
	bl DisplayYesNoMenuDefaultYes
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
	movs r0, #1
	b _080E164A
	.align 2, 0
_080E1640: .4byte 0x080E166D
_080E1644: .4byte 0x02037290
_080E1648:
	movs r0, #0
_080E164A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScriptMenu_YesNo

	thumb_func_start IsScriptActive
IsScriptActive: @ 0x080E1650
	push {lr}
	ldr r0, _080E1660
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _080E1664
	movs r0, #1
	b _080E1666
	.align 2, 0
_080E1660: .4byte 0x02037290
_080E1664:
	movs r0, #0
_080E1666:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsScriptActive

	thumb_func_start Task_HandleYesNoInput
Task_HandleYesNoInput: @ 0x080E166C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080E168C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #4
	bgt _080E1690
	adds r0, r2, #1
	strh r0, [r1, #0xc]
	b _080E16D4
	.align 2, 0
_080E168C: .4byte 0x03005B60
_080E1690:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080E16B4
	cmp r1, r0
	bgt _080E16AC
	subs r0, #1
	cmp r1, r0
	beq _080E16D4
	b _080E16CA
_080E16AC:
	cmp r1, #0
	beq _080E16C4
	cmp r1, #1
	bne _080E16CA
_080E16B4:
	movs r0, #5
	bl PlaySE
	ldr r1, _080E16C0
	movs r0, #0
	b _080E16C8
	.align 2, 0
_080E16C0: .4byte 0x02037290
_080E16C4:
	ldr r1, _080E16DC
	movs r0, #1
_080E16C8:
	strh r0, [r1]
_080E16CA:
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_080E16D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E16DC: .4byte 0x02037290
	thumb_func_end Task_HandleYesNoInput

	thumb_func_start sp106_CreateStartMenu
sp106_CreateStartMenu: @ 0x080E16E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, [sp, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	ldr r0, _080E17C8
	mov sb, r0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E17D8
	ldr r1, _080E17CC
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, _080E17D0
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r1, [r0]
	mov r8, r1
	ldrb r5, [r0, #4]
	mov r0, r8
	adds r1, r5, #0
	bl ScrSpecial_CreatePCMenu
	adds r4, r0, #0
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r7, #0
	bl __udivsi3
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, sb
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080E17D4
	lsls r5, r0, #2
	adds r5, r5, r0
	lsls r5, r5, #3
	adds r5, r5, r1
	movs r0, #0
	mov sb, r0
	mov r1, sl
	strh r1, [r5, #0x10]
	adds r2, r4, #0
	muls r2, r7, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r6, #0x19
	lsrs r3, r3, #0x18
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl CreateWindowFromRect
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x14]
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldrb r0, [r5, #0x14]
	lsls r4, r4, #0x1b
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r7, [sp, #8]
	str r6, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	movs r1, #1
	movs r2, #8
	movs r3, #2
	bl sub_08198DA4
	ldrb r0, [r5, #0x14]
	str r4, [sp]
	str r7, [sp, #4]
	str r6, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081990E4
	ldrb r0, [r5, #0x14]
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	b _080E17DA
	.align 2, 0
_080E17C8: .4byte 0x080E17ED
_080E17CC: .4byte 0x02037290
_080E17D0: .4byte 0x08564218
_080E17D4: .4byte 0x03005B60
_080E17D8:
	movs r0, #0
_080E17DA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sp106_CreateStartMenu

	thumb_func_start Task_HandleMultichoiceGridInput
Task_HandleMultichoiceGridInput: @ 0x080E17EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080E1828
	adds r5, r0, r1
	bl Menu_ProcessInputGridLayout
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080E1844
	adds r0, #1
	cmp r1, r0
	bne _080E1830
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080E1844
	movs r0, #5
	bl PlaySE
	ldr r1, _080E182C
	movs r0, #0x7f
	strh r0, [r1]
	b _080E1834
	.align 2, 0
_080E1828: .4byte 0x03005B68
_080E182C: .4byte 0x02037290
_080E1830:
	ldr r0, _080E184C
	strh r1, [r0]
_080E1834:
	ldrb r0, [r5, #0xc]
	bl ClearToTransparentAndRemoveWindow
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_080E1844:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E184C: .4byte 0x02037290
	thumb_func_end Task_HandleMultichoiceGridInput

	thumb_func_start sub_080E1850
sub_080E1850: @ 0x080E1850
	push {lr}
	ldr r0, _080E1870
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E1878
	ldr r1, _080E1874
	movs r0, #0xff
	strh r0, [r1]
	bl CreatePCMenu
	movs r0, #1
	b _080E187A
	.align 2, 0
_080E1870: .4byte 0x080E1569
_080E1874: .4byte 0x02037290
_080E1878:
	movs r0, #0
_080E187A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080E1850

	thumb_func_start CreatePCMenu
CreatePCMenu: @ 0x080E1880
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	ldr r0, _080E18BC
	bl sub_080E1378
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080E18C0
	bl sub_080E1378
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bls _080E18C4
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	b _080E18C6
	.align 2, 0
_080E18BC: .4byte 0x085CACFE
_080E18C0: .4byte 0x085CACEC
_080E18C4:
	movs r4, #8
_080E18C6:
	ldr r0, _080E1924
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080E1930
	movs r0, #4
	mov r8, r0
	adds r2, r4, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0
	movs r3, #8
	bl CreateWindowFromRect
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldr r2, _080E1928
	movs r0, #0x22
	str r0, [sp]
	movs r5, #0xff
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r3, r7, #0
	bl AddTextPrinterParameterized
	ldr r2, _080E192C
	movs r0, #0x32
	str r0, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r3, r7, #0
	bl AddTextPrinterParameterized
	b _080E1966
	.align 2, 0
_080E1924: .4byte 0x00000864
_080E1928: .4byte 0x085CAD06
_080E192C: .4byte 0x085CAD0D
_080E1930:
	movs r0, #3
	mov r8, r0
	adds r2, r4, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0
	movs r3, #6
	bl CreateWindowFromRect
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldr r2, _080E1990
	movs r0, #0x22
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r3, r7, #0
	bl AddTextPrinterParameterized
_080E1966:
	ldr r0, _080E1994
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080E199C
	ldr r2, _080E1998
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r3, r7, #0
	bl AddTextPrinterParameterized
	b _080E19B2
	.align 2, 0
_080E1990: .4byte 0x085CAD0D
_080E1994: .4byte 0x000008AB
_080E1998: .4byte 0x085CACF5
_080E199C:
	ldr r2, _080E1A00
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r3, r7, #0
	bl AddTextPrinterParameterized
_080E19B2:
	ldr r4, _080E1A04
	ldr r1, _080E1A08
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #0x12
	bl PrintPlayerNameOnWindow
	movs r0, #0x10
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	adds r0, r6, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #0
	mov r1, r8
	adds r2, r6, #0
	movs r3, #1
	bl sub_080E14CC
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1A00: .4byte 0x085CACEC
_080E1A04: .4byte 0x02021C7C
_080E1A08: .4byte 0x085CACFE
	thumb_func_end CreatePCMenu

	thumb_func_start ScriptMenu_DisplayPCStartupPrompt
ScriptMenu_DisplayPCStartupPrompt: @ 0x080E1A0C
	push {lr}
	sub sp, #0x10
	movs r0, #0
	movs r1, #1
	bl sub_08197650
	ldr r2, _080E1A3C
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
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080E1A3C: .4byte 0x082436CD
	thumb_func_end ScriptMenu_DisplayPCStartupPrompt

	thumb_func_start display_text_and_get_width_internal
display_text_and_get_width_internal: @ 0x080E1A40
	push {lr}
	ldr r0, _080E1A60
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E1A68
	ldr r1, _080E1A64
	movs r0, #0xff
	strh r0, [r1]
	bl sub_080E1A70
	movs r0, #1
	b _080E1A6A
	.align 2, 0
_080E1A60: .4byte 0x080E1569
_080E1A64: .4byte 0x02037290
_080E1A68:
	movs r0, #0
_080E1A6A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end display_text_and_get_width_internal

	thumb_func_start sub_080E1A70
sub_080E1A70: @ 0x080E1A70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	movs r6, #0
	movs r5, #0
	movs r4, #0
	ldr r3, _080E1C94
	movs r2, #0xff
_080E1A84:
	adds r0, r4, r3
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080E1A84
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	ldr r0, _080E1C98
	ldrh r1, [r0]
	cmp r1, #0
	bne _080E1ACE
	movs r6, #6
	ldr r4, _080E1C94
	adds r0, r5, r4
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0xe8
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080E1ACE
	adds r0, r5, r4
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080E1ACE:
	ldr r0, _080E1C9C
	movs r1, #1
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1B30
	ldr r0, _080E1CA0
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1B30
	ldr r2, _080E1C98
	ldrh r0, [r2]
	cmp r0, #0
	bne _080E1B04
	movs r6, #7
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080E1B04:
	ldrh r0, [r2]
	cmp r0, #1
	bne _080E1B30
	movs r4, #0xd7
	lsls r4, r4, #1
	adds r0, r4, #0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E1B30
	movs r6, #7
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl FlagSet
_080E1B30:
	movs r0, #0xb9
	lsls r0, r0, #1
	movs r1, #1
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1B90
	movs r0, #0x8e
	lsls r0, r0, #4
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1B90
	ldr r2, _080E1C98
	ldrh r0, [r2]
	cmp r0, #0
	bne _080E1B68
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #3
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080E1B68:
	ldrh r0, [r2]
	cmp r0, #1
	bne _080E1B90
	ldr r4, _080E1CA4
	adds r0, r4, #0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E1B90
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #3
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl FlagSet
_080E1B90:
	ldr r0, _080E1CA8
	movs r1, #1
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1BF0
	ldr r0, _080E1CAC
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1BF0
	ldr r2, _080E1C98
	ldrh r0, [r2]
	cmp r0, #0
	bne _080E1BC6
	movs r6, #8
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #4
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080E1BC6:
	ldrh r0, [r2]
	cmp r0, #1
	bne _080E1BF0
	ldr r4, _080E1CB0
	adds r0, r4, #0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E1BF0
	movs r6, #8
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #4
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl FlagSet
_080E1BF0:
	movs r0, #0xbc
	lsls r0, r0, #1
	movs r1, #1
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1C54
	ldr r0, _080E1CB4
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1C54
	ldr r2, _080E1C98
	ldrh r0, [r2]
	cmp r0, #0
	bne _080E1C28
	movs r6, #8
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #5
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080E1C28:
	ldrh r0, [r2]
	cmp r0, #1
	bne _080E1C54
	movs r4, #0xd8
	lsls r4, r4, #1
	adds r0, r4, #0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E1C54
	movs r6, #8
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #5
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl FlagSet
_080E1C54:
	ldr r0, _080E1C94
	adds r0, r5, r0
	movs r1, #6
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080E1C98
	ldrh r0, [r0]
	cmp r0, #0
	bne _080E1C7C
	movs r0, #0xe8
	lsls r0, r0, #1
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080E1C7C
	movs r6, #9
_080E1C7C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r7, r5, #0
	cmp r7, #7
	bne _080E1CB8
	ldr r1, _080E1C98
	movs r0, #0xb
	strh r0, [r1]
	bl sub_0813A164
	b _080E1D54
	.align 2, 0
_080E1C94: .4byte 0x03001124
_080E1C98: .4byte 0x02037280
_080E1C9C: .4byte 0x00000113
_080E1CA0: .4byte 0x000008B3
_080E1CA4: .4byte 0x000001DB
_080E1CA8: .4byte 0x00000173
_080E1CAC: .4byte 0x000008D5
_080E1CB0: .4byte 0x000001AF
_080E1CB4: .4byte 0x000008D6
_080E1CB8:
	movs r0, #0x1c
	subs r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #6
	subs r1, r1, r7
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x18
	lsls r3, r7, #0x19
	lsrs r3, r3, #0x18
	adds r2, r6, #0
	bl CreateWindowFromRect
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	movs r5, #0
	movs r4, #0
	subs r0, r7, #1
	mov r8, r0
	ldr r1, _080E1D64
	mov sb, r1
_080E1CEA:
	ldr r0, _080E1D68
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080E1D1C
	lsls r0, r0, #2
	add r0, sb
	ldr r2, [r0]
	lsls r0, r5, #4
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080E1D1C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080E1CEA
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	adds r0, r6, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #0
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #8
	bl sub_080E14CC
_080E1D54:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1D64: .4byte 0x08564620
_080E1D68: .4byte 0x03001124
	thumb_func_end sub_080E1A70

	thumb_func_start sub_080E1D6C
sub_080E1D6C: @ 0x080E1D6C
	push {lr}
	ldr r2, _080E1D84
	ldrh r0, [r2]
	cmp r0, #0x7f
	beq _080E1D80
	ldr r0, _080E1D88
	ldrh r1, [r2]
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
_080E1D80:
	pop {r0}
	bx r0
	.align 2, 0
_080E1D84: .4byte 0x02037290
_080E1D88: .4byte 0x03001124
	thumb_func_end sub_080E1D6C

	thumb_func_start Task_PokemonPicWindow
Task_PokemonPicWindow: @ 0x080E1D8C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080E1DB0
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080E1DEC
	cmp r0, #1
	bgt _080E1DB4
	cmp r0, #0
	beq _080E1DD2
	b _080E1DEC
	.align 2, 0
_080E1DB0: .4byte 0x03005B60
_080E1DB4:
	cmp r0, #2
	beq _080E1DBE
	cmp r0, #3
	beq _080E1DE0
	b _080E1DEC
_080E1DBE:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E1DDC
	adds r0, r0, r1
	ldrb r1, [r4, #0xc]
	bl FreeResourcesAndDestroySprite
_080E1DD2:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080E1DEC
	.align 2, 0
_080E1DDC: .4byte 0x020205AC
_080E1DE0:
	ldrb r0, [r4, #0x12]
	bl ClearToTransparentAndRemoveWindow
	adds r0, r5, #0
	bl DestroyTask
_080E1DEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_PokemonPicWindow

	thumb_func_start ScriptMenu_ShowPokemonPic
ScriptMenu_ShowPokemonPic: @ 0x080E1DF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r4, _080E1E9C
	adds r0, r4, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080E1EAC
	lsls r1, r7, #0x13
	movs r0, #0xa0
	lsls r0, r0, #0xe
	adds r1, r1, r0
	asrs r1, r1, #0x10
	lsls r2, r6, #0x13
	adds r2, r2, r0
	asrs r2, r2, #0x10
	mov r0, r8
	movs r3, #0
	bl CreateMonSprite_PicBox
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #8
	movs r3, #8
	bl CreateWindowFromRect
	ldr r1, _080E1EA0
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r3, r3, #3
	adds r3, r3, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	strh r0, [r3, #0x12]
	strh r1, [r3, #8]
	mov r0, r8
	strh r0, [r3, #0xa]
	strh r5, [r3, #0xc]
	ldr r4, _080E1EA4
	lsls r1, r5, #4
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x1c
	adds r0, r1, r0
	ldr r2, _080E1EA8
	str r2, [r0]
	adds r1, r1, r4
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	ldrb r0, [r3, #0x12]
	movs r1, #1
	bl SetStandardWindowBorderStyle
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	b _080E1EAE
	.align 2, 0
_080E1E9C: .4byte 0x080E1D8D
_080E1EA0: .4byte 0x03005B60
_080E1EA4: .4byte 0x020205AC
_080E1EA8: .4byte 0x08007141
_080E1EAC:
	movs r0, #0
_080E1EAE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end ScriptMenu_ShowPokemonPic

	thumb_func_start ScriptMenu_GetPicboxWaitFunc
ScriptMenu_GetPicboxWaitFunc: @ 0x080E1EB8
	push {lr}
	ldr r0, _080E1EDC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _080E1EE8
	ldr r0, _080E1EE0
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	ldr r0, _080E1EE4
	b _080E1EEA
	.align 2, 0
_080E1EDC: .4byte 0x080E1D8D
_080E1EE0: .4byte 0x03005B60
_080E1EE4: .4byte 0x080E1EF1
_080E1EE8:
	movs r0, #0
_080E1EEA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScriptMenu_GetPicboxWaitFunc

	thumb_func_start IsPicboxClosed
IsPicboxClosed: @ 0x080E1EF0
	push {lr}
	ldr r0, _080E1F04
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _080E1F08
	movs r0, #0
	b _080E1F0A
	.align 2, 0
_080E1F04: .4byte 0x080E1D8D
_080E1F08:
	movs r0, #1
_080E1F0A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPicboxClosed

	thumb_func_start CreateWindowFromRect
CreateWindowFromRect: @ 0x080E1F10
	push {r4, r5, lr}
	sub sp, #0x20
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsls r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r4, r4, r0
	lsrs r4, r4, #0x18
	adds r5, r5, r0
	lsrs r5, r5, #0x18
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x5c
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl CreateWindowTemplate
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	add r0, sp, #0x18
	bl AddWindow
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CreateWindowFromRect

	thumb_func_start ClearToTransparentAndRemoveWindow
ClearToTransparentAndRemoveWindow: @ 0x080E1F6C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	adds r0, r4, #0
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearToTransparentAndRemoveWindow

	thumb_func_start sub_080E1F88
sub_080E1F88: @ 0x080E1F88
	push {r4, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0x4a
	cmp r0, #5
	bhi _080E2064
	lsls r0, r0, #2
	ldr r1, _080E1FA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E1FA0: .4byte 0x080E1FA4
_080E1FA4: @ jump table
	.4byte _080E2034 @ case 0
	.4byte _080E1FFC @ case 1
	.4byte _080E1FCC @ case 2
	.4byte _080E1FBC @ case 3
	.4byte _080E1FDC @ case 4
	.4byte _080E1FEC @ case 5
_080E1FBC:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r4, _080E1FC8
	b _080E2006
	.align 2, 0
_080E1FC8: .4byte 0x0856464C
_080E1FCC:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r4, _080E1FD8
	b _080E2006
	.align 2, 0
_080E1FD8: .4byte 0x0856463C
_080E1FDC:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r4, _080E1FE8
	b _080E2006
	.align 2, 0
_080E1FE8: .4byte 0x0856465C
_080E1FEC:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r4, _080E1FF8
	b _080E2006
	.align 2, 0
_080E1FF8: .4byte 0x0856466C
_080E1FFC:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r4, _080E2030
_080E2006:
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r2, [r0]
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
	b _080E2064
	.align 2, 0
_080E2030: .4byte 0x0856468C
_080E2034:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r4, _080E206C
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r2, [r0]
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
_080E2064:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E206C: .4byte 0x08564680
	thumb_func_end sub_080E1F88

	thumb_func_start convert_pixel_width_to_tile_width
convert_pixel_width_to_tile_width: @ 0x080E2070
	push {lr}
	ldr r0, _080E2090
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080E2098
	ldr r1, _080E2094
	movs r0, #0xff
	strh r0, [r1]
	bl CreateStartMenu
	movs r0, #1
	b _080E209A
	.align 2, 0
_080E2090: .4byte 0x080E1569
_080E2094: .4byte 0x02037290
_080E2098:
	movs r0, #0
_080E209A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end convert_pixel_width_to_tile_width

	thumb_func_start CreateStartMenu
CreateStartMenu: @ 0x080E20A0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0xc
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	adds r5, r0, #0
	adds r5, #1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	movs r0, #8
	mov sl, r0
	movs r0, #0x10
	mov sb, r0
	movs r0, #0x16
	movs r1, #0
	movs r2, #6
	movs r3, #0x10
	bl CreateWindowFromRect
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	ldr r2, _080E21D8
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	mov r8, r0
	str r0, [sp, #4]
	movs r6, #0
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	ldr r2, _080E21DC
	movs r0, #0x12
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	ldr r2, _080E21E0
	movs r0, #0x22
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	ldr r2, _080E21E4
	movs r0, #0x32
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	ldr r0, _080E21E8
	ldr r2, [r0]
	movs r0, #0x42
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	ldr r2, _080E21EC
	movs r0, #0x52
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	ldr r2, _080E21F0
	movs r0, #0x62
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	ldr r2, _080E21F4
	movs r0, #0x72
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r5, #0
	bl AddTextPrinterParameterized
	mov r0, sb
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #0
	movs r1, #8
	adds r2, r4, #0
	movs r3, #0x56
	bl sub_080E21F8
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E21D8: .4byte 0x085CADAE
_080E21DC: .4byte 0x085CADB2
_080E21E0: .4byte 0x085CADB7
_080E21E4: .4byte 0x085CADBB
_080E21E8: .4byte 0x03005AF0
_080E21EC: .4byte 0x085CADC6
_080E21F0: .4byte 0x085CADCB
_080E21F4: .4byte 0x085CADD0
	thumb_func_end CreateStartMenu

	thumb_func_start sub_080E21F8
sub_080E21F8: @ 0x080E21F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r1, _080E2238
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080E223C
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080E2240
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r4, [r1, #0x10]
	strh r0, [r1, #0x12]
	strh r5, [r1, #0x14]
	strh r6, [r1, #0x16]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2238: .4byte 0x02039C30
_080E223C: .4byte 0x080E1569
_080E2240: .4byte 0x03005B60
	thumb_func_end sub_080E21F8

