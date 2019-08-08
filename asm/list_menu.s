.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Task_RedArrowCursor
Task_RedArrowCursor: @ 0x081AE130
	bx lr
	.align 2, 0
	thumb_func_end Task_RedArrowCursor

	thumb_func_start DoMysteryGiftListMenu
DoMysteryGiftListMenu: @ 0x081AE134
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov ip, r0
	str r1, [sp]
	ldr r0, [sp, #0x28]
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	mov sl, r6
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	str r7, [sp, #4]
	lsls r0, r0, #0x10
	mov r8, r0
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r5, _081AE1C4
	ldrb r4, [r5, #4]
	cmp r4, #1
	beq _081AE1CC
	cmp r4, #1
	ble _081AE16A
	cmp r4, #2
	beq _081AE230
_081AE16A:
	mov r0, ip
	bl AddWindow
	strb r0, [r5, #5]
	cmp r6, #1
	beq _081AE188
	cmp r6, #2
	bne _081AE198
	ldrb r0, [r5, #5]
	mov r1, sb
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	adds r1, r7, #0
	bl LoadUserWindowBorderGfx
_081AE188:
	ldrb r0, [r5, #5]
	mov r3, r8
	lsrs r2, r3, #0x14
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, [sp, #4]
	bl DrawTextBorderOuter
_081AE198:
	ldr r0, _081AE1C8
	adds r2, r0, #0
	ldr r1, [sp]
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r4, _081AE1C4
	ldrb r1, [r4, #5]
	strb r1, [r0, #0x10]
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	strb r0, [r4, #6]
	ldrb r0, [r4, #5]
	movs r1, #1
	bl CopyWindowToVram
	movs r0, #1
	strb r0, [r4, #4]
	b _081AE248
	.align 2, 0
_081AE1C4: .4byte 0x0203CB50
_081AE1C8: .4byte 0x03006050
_081AE1CC:
	ldrb r0, [r5, #6]
	bl ListMenu_ProcessInput
	str r0, [r5]
	ldr r1, _081AE208
	ldrh r0, [r1, #0x2e]
	ands r4, r0
	cmp r4, #0
	beq _081AE1E2
	movs r0, #2
	strb r0, [r5, #4]
_081AE1E2:
	ldrh r1, [r1, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081AE1F6
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r5]
	movs r0, #2
	strb r0, [r5, #4]
_081AE1F6:
	ldrb r0, [r5, #4]
	cmp r0, #2
	bne _081AE248
	cmp r6, #0
	bne _081AE20C
	ldrb r0, [r5, #5]
	bl ClearWindowTilemap
	b _081AE21E
	.align 2, 0
_081AE208: .4byte 0x03002360
_081AE20C:
	mov r4, sl
	cmp r4, #0
	blt _081AE21E
	cmp r4, #2
	bgt _081AE21E
	ldrb r0, [r5, #5]
	movs r1, #0
	bl DrawStdWindowFrame
_081AE21E:
	ldr r0, _081AE22C
	ldrb r0, [r0, #5]
	movs r1, #1
	bl CopyWindowToVram
	b _081AE248
	.align 2, 0
_081AE22C: .4byte 0x0203CB50
_081AE230:
	ldrb r0, [r5, #6]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r5, #5]
	bl RemoveWindow
	movs r0, #0
	strb r0, [r5, #4]
	ldr r0, [r5]
	b _081AE24C
_081AE248:
	movs r0, #1
	rsbs r0, r0, #0
_081AE24C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end DoMysteryGiftListMenu

	thumb_func_start ListMenuInit
ListMenuInit: @ 0x081AE25C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl ListMenuInitInternal
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r5, #0x10]
	bl PutWindowTilemap
	ldrb r0, [r5, #0x10]
	movs r1, #2
	bl CopyWindowToVram
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ListMenuInit

	thumb_func_start ListMenuInitInRect
ListMenuInitInRect: @ 0x081AE288
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl ListMenuInitInternal
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r4, #4]
	cmp r0, #0xff
	beq _081AE2C8
	adds r5, r4, #0
_081AE2AC:
	ldrb r0, [r6, #0x10]
	ldrb r1, [r5]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #2]
	ldrb r4, [r5, #3]
	str r4, [sp]
	ldrb r4, [r5, #4]
	str r4, [sp, #4]
	bl PutWindowRectTilemapOverridePalette
	adds r5, #8
	ldrb r0, [r5, #4]
	cmp r0, #0xff
	bne _081AE2AC
_081AE2C8:
	ldrb r0, [r6, #0x10]
	movs r1, #2
	bl CopyWindowToVram
	adds r0, r7, #0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ListMenuInitInRect

	thumb_func_start ListMenu_ProcessInput
ListMenu_ProcessInput: @ 0x081AE2DC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081AE308
	adds r3, r1, r0
	ldr r2, _081AE30C
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081AE310
	ldrh r0, [r3, #0x18]
	ldrh r1, [r3, #0x1a]
	adds r0, r0, r1
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	b _081AE39A
	.align 2, 0
_081AE308: .4byte 0x03005B68
_081AE30C: .4byte 0x03002360
_081AE310:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081AE31E
	movs r0, #2
	rsbs r0, r0, #0
	b _081AE39A
_081AE31E:
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081AE332
	adds r0, r3, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	b _081AE392
_081AE332:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081AE342
	adds r0, r3, #0
	movs r1, #1
	movs r2, #1
	b _081AE390
_081AE342:
	ldrb r0, [r3, #0x16]
	lsrs r0, r0, #6
	cmp r0, #1
	beq _081AE358
	cmp r0, #1
	ble _081AE352
	cmp r0, #2
	beq _081AE364
_081AE352:
	movs r2, #0
	movs r0, #0
	b _081AE378
_081AE358:
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0x10
	b _081AE372
_081AE364:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
_081AE372:
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_081AE378:
	cmp r2, #0
	beq _081AE386
	ldrb r2, [r3, #0xe]
	adds r0, r3, #0
	movs r1, #1
	movs r3, #0
	b _081AE392
_081AE386:
	cmp r0, #0
	beq _081AE396
	ldrb r2, [r3, #0xe]
	adds r0, r3, #0
	movs r1, #1
_081AE390:
	movs r3, #1
_081AE392:
	bl ListMenuChangeSelection
_081AE396:
	movs r0, #1
	rsbs r0, r0, #0
_081AE39A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ListMenu_ProcessInput

	thumb_func_start DestroyListMenuTask
DestroyListMenuTask: @ 0x081AE3A0
	push {r4, lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081AE3E0
	adds r1, r0, r1
	cmp r3, #0
	beq _081AE3BC
	ldrh r0, [r1, #0x18]
	strh r0, [r3]
_081AE3BC:
	cmp r2, #0
	beq _081AE3C4
	ldrh r0, [r1, #0x1a]
	strh r0, [r2]
_081AE3C4:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0xff
	beq _081AE3D4
	ldrb r1, [r1, #0x17]
	lsrs r1, r1, #6
	subs r1, #2
	bl ListMenuRemoveCursorObject
_081AE3D4:
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AE3E0: .4byte 0x03005B68
	thumb_func_end DestroyListMenuTask

	thumb_func_start RedrawListMenu
RedrawListMenu: @ 0x081AE3E4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081AE424
	adds r4, r4, r0
	ldrb r0, [r4, #0x10]
	ldrb r2, [r4, #0x15]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldrh r1, [r4, #0x18]
	ldrh r3, [r4, #0xe]
	adds r0, r4, #0
	movs r2, #0
	bl ListMenuPrintEntries
	adds r0, r4, #0
	bl ListMenuDrawCursor
	ldrb r0, [r4, #0x10]
	movs r1, #2
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AE424: .4byte 0x03005B68
	thumb_func_end RedrawListMenu

	thumb_func_start ChangeListMenuPals
ChangeListMenuPals: @ 0x081AE428
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081AE468
	adds r4, r4, r0
	lsrs r1, r1, #0x14
	ldrb r6, [r4, #0x14]
	movs r5, #0xf
	adds r0, r5, #0
	ands r0, r6
	orrs r0, r1
	strb r0, [r4, #0x14]
	ands r2, r5
	ldrb r1, [r4, #0x15]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	lsrs r3, r3, #0x14
	ands r0, r5
	orrs r0, r3
	strb r0, [r4, #0x15]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AE468: .4byte 0x03005B68
	thumb_func_end ChangeListMenuPals

	thumb_func_start ChangeListMenuCoords
ChangeListMenuCoords: @ 0x081AE46C
	push {r4, r5, lr}
	adds r3, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081AE4A4
	adds r4, r4, r0
	ldrb r0, [r4, #0x10]
	movs r1, #1
	adds r2, r3, #0
	bl SetWindowAttribute
	ldrb r0, [r4, #0x10]
	movs r1, #2
	adds r2, r5, #0
	bl SetWindowAttribute
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AE4A4: .4byte 0x03005B68
	thumb_func_end ChangeListMenuCoords

	thumb_func_start ListMenuTestInput
ListMenuTestInput: @ 0x081AE4A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov ip, r2
	ldr r5, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r4, r3, #0
	mov r3, sp
	ldm r0!, {r2, r6, r7}
	stm r3!, {r2, r6, r7}
	ldm r0!, {r2, r6, r7}
	stm r3!, {r2, r6, r7}
	mov r0, sp
	movs r3, #0
	strh r1, [r0, #0x18]
	mov r1, ip
	strh r1, [r0, #0x1a]
	strb r3, [r0, #0x1c]
	strb r3, [r0, #0x1d]
	cmp r4, #0x40
	bne _081AE4DC
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl ListMenuChangeSelection
_081AE4DC:
	cmp r4, #0x80
	bne _081AE4EC
	mov r0, sp
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl ListMenuChangeSelection
_081AE4EC:
	cmp r5, #0
	beq _081AE4F6
	mov r0, sp
	ldrh r0, [r0, #0x18]
	strh r0, [r5]
_081AE4F6:
	ldr r2, [sp, #0x38]
	cmp r2, #0
	beq _081AE502
	mov r0, sp
	ldrh r0, [r0, #0x1a]
	strh r0, [r2]
_081AE502:
	movs r0, #1
	rsbs r0, r0, #0
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ListMenuTestInput

	thumb_func_start ListMenuGetCurrentItemArrayId
ListMenuGetCurrentItemArrayId: @ 0x081AE510
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081AE534
	adds r1, r1, r0
	cmp r2, #0
	beq _081AE52E
	ldrh r0, [r1, #0x1a]
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	strh r0, [r2]
_081AE52E:
	pop {r0}
	bx r0
	.align 2, 0
_081AE534: .4byte 0x03005B68
	thumb_func_end ListMenuGetCurrentItemArrayId

	thumb_func_start ListMenuGetScrollAndRow
ListMenuGetScrollAndRow: @ 0x081AE538
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081AE560
	adds r1, r1, r0
	cmp r3, #0
	beq _081AE552
	ldrh r0, [r1, #0x18]
	strh r0, [r3]
_081AE552:
	cmp r2, #0
	beq _081AE55A
	ldrh r0, [r1, #0x1a]
	strh r0, [r2]
_081AE55A:
	pop {r0}
	bx r0
	.align 2, 0
_081AE560: .4byte 0x03005B68
	thumb_func_end ListMenuGetScrollAndRow

	thumb_func_start ListMenuGetYCoordForPrintingArrowCursor
ListMenuGetYCoordForPrintingArrowCursor: @ 0x081AE564
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081AE5A8
	adds r4, r4, r0
	ldrb r0, [r4, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #1
	bl GetFontAttribute
	ldrb r1, [r4, #0x16]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x1a]
	adds r2, r1, #0
	muls r2, r0, r2
	adds r1, r2, #0
	ldrb r0, [r4, #0x14]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081AE5A8: .4byte 0x03005B68
	thumb_func_end ListMenuGetYCoordForPrintingArrowCursor

	thumb_func_start ListMenuInitInternal
ListMenuInitInternal: @ 0x081AE5AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _081AE67C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _081AE680
	adds r7, r0, r1
	adds r0, r7, #0
	ldm r4!, {r1, r2, r3}
	stm r0!, {r1, r2, r3}
	ldm r4!, {r1, r2, r3}
	stm r0!, {r1, r2, r3}
	movs r1, #0
	strh r5, [r7, #0x18]
	strh r6, [r7, #0x1a]
	strb r1, [r7, #0x1c]
	strb r1, [r7, #0x1d]
	movs r0, #0xff
	strb r0, [r7, #0x1e]
	strb r1, [r7, #0x1f]
	ldr r3, _081AE684
	ldrb r1, [r7, #0x14]
	movs r5, #0xf
	lsrs r1, r1, #4
	ldrb r4, [r3]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r7, #0x15]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x18
	ands r0, r5
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r7, #0x15]
	lsrs r0, r0, #4
	ands r5, r0
	ldrb r0, [r3, #1]
	ands r2, r0
	orrs r2, r5
	strb r2, [r3, #1]
	ldrb r1, [r7, #0x16]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x11
	ldr r0, [r3]
	ldr r2, _081AE688
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	strb r0, [r3, #3]
	ldrh r0, [r7, #0xc]
	ldrh r1, [r7, #0xe]
	cmp r0, r1
	bhs _081AE644
	strh r0, [r7, #0xe]
_081AE644:
	ldrb r0, [r7, #0x10]
	ldrb r2, [r7, #0x15]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldrh r1, [r7, #0x18]
	ldrh r3, [r7, #0xe]
	adds r0, r7, #0
	movs r2, #0
	bl ListMenuPrintEntries
	adds r0, r7, #0
	bl ListMenuDrawCursor
	adds r0, r7, #0
	movs r1, #1
	bl ListMenuCallSelectionChangedCallback
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081AE67C: .4byte 0x081AE131
_081AE680: .4byte 0x03005B68
_081AE684: .4byte 0x03006040
_081AE688: .4byte 0xFFFC0FFF
	thumb_func_end ListMenuInitInternal

	thumb_func_start ListMenuPrint
ListMenuPrint: @ 0x081AE68C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov ip, r3
	ldr r5, _081AE6F4
	ldrb r1, [r5, #3]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _081AE6F8
	add r1, sp, #0x14
	ldr r2, [r5]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1c
	movs r3, #0
	strb r0, [r1]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r1, #1]
	lsls r0, r2, #0x14
	lsrs r0, r0, #0x1c
	strb r0, [r1, #2]
	ldrb r0, [r4, #0x10]
	lsls r1, r2, #1
	lsrs r1, r1, #0x19
	lsls r2, r2, #0xe
	lsrs r2, r2, #0x1a
	str r2, [sp]
	str r3, [sp, #4]
	add r2, sp, #0x14
	str r2, [sp, #8]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [sp, #0xc]
	str r6, [sp, #0x10]
	adds r2, r7, #0
	mov r3, ip
	bl AddTextPrinterParameterized4
	ldrb r1, [r5, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r5, #3]
	b _081AE736
	.align 2, 0
_081AE6F4: .4byte 0x03006040
_081AE6F8:
	add r2, sp, #0x14
	ldrb r1, [r4, #0x15]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r2]
	ldrb r0, [r4, #0x14]
	lsrs r0, r0, #4
	strb r0, [r2, #1]
	adds r0, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	strb r1, [r0, #2]
	ldrb r0, [r4, #0x10]
	ldrb r1, [r4, #0x17]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrb r2, [r4, #0x16]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1d
	str r2, [sp]
	str r3, [sp, #4]
	add r2, sp, #0x14
	str r2, [sp, #8]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [sp, #0xc]
	str r6, [sp, #0x10]
	adds r2, r7, #0
	mov r3, ip
	bl AddTextPrinterParameterized4
_081AE736:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ListMenuPrint

	thumb_func_start ListMenuPrintEntries
ListMenuPrintEntries: @ 0x081AE740
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	ldrb r0, [r4, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #1
	bl GetFontAttribute
	ldrb r1, [r4, #0x16]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	mov r8, r0
	cmp r8, sl
	bge _081AE7E8
_081AE782:
	ldr r0, [r4]
	mov r2, sb
	lsls r1, r2, #3
	adds r0, r1, r0
	ldr r2, [r0, #4]
	movs r0, #3
	rsbs r0, r0, #0
	adds r5, r1, #0
	cmp r2, r0
	beq _081AE79A
	ldrb r6, [r4, #0x12]
	b _081AE79C
_081AE79A:
	ldrb r6, [r4, #0x11]
_081AE79C:
	ldr r0, [sp]
	add r0, r8
	ldr r2, [sp, #4]
	adds r1, r0, #0
	muls r1, r2, r1
	ldrb r0, [r4, #0x14]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r7, r2, #0
	ldr r3, [r4, #8]
	cmp r3, #0
	beq _081AE7C6
	ldrb r0, [r4, #0x10]
	ldr r1, [r4]
	adds r1, r5, r1
	ldr r1, [r1, #4]
	bl _call_via_r3
_081AE7C6:
	ldr r0, [r4]
	adds r0, r5, r0
	ldr r1, [r0]
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ListMenuPrint
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r0, #1
	add r8, r0
	cmp r8, sl
	blt _081AE782
_081AE7E8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ListMenuPrintEntries

	thumb_func_start ListMenuDrawCursor
ListMenuDrawCursor: @ 0x081AE7F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldrb r0, [r6, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #1
	bl GetFontAttribute
	ldrb r1, [r6, #0x16]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r6, #0x13]
	mov r8, r1
	ldrh r1, [r6, #0x1a]
	muls r1, r0, r1
	ldrb r0, [r6, #0x14]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r6, #0x17]
	lsrs r0, r0, #6
	cmp r0, #1
	beq _081AE8E4
	cmp r0, #1
	bgt _081AE83E
	cmp r0, #0
	beq _081AE848
	b _081AE8E4
_081AE83E:
	cmp r0, #2
	beq _081AE85C
	cmp r0, #3
	beq _081AE8A4
	b _081AE8E4
_081AE848:
	ldr r1, _081AE858
	adds r0, r6, #0
	mov r2, r8
	adds r3, r7, #0
	bl ListMenuPrint
	b _081AE8E4
	.align 2, 0
_081AE858: .4byte 0x085C9421
_081AE85C:
	ldrb r0, [r6, #0x1e]
	cmp r0, #0xff
	bne _081AE86C
	adds r0, r6, #0
	movs r1, #0
	bl ListMenuAddCursorObject
	strb r0, [r6, #0x1e]
_081AE86C:
	ldrb r5, [r6, #0x1e]
	ldrb r0, [r6, #0x10]
	movs r1, #1
	bl GetWindowAttribute
	adds r4, r0, #0
	lsls r4, r4, #0x13
	ldr r0, _081AE8A0
	adds r4, r4, r0
	lsrs r4, r4, #0x10
	ldrb r0, [r6, #0x10]
	movs r1, #2
	bl GetWindowAttribute
	adds r2, r0, #0
	lsls r2, r2, #3
	adds r2, r2, r7
	subs r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl ListMenuUpdateCursorObject
	b _081AE8E4
	.align 2, 0
_081AE8A0: .4byte 0xFFFF0000
_081AE8A4:
	ldrb r0, [r6, #0x1e]
	cmp r0, #0xff
	bne _081AE8B4
	adds r0, r6, #0
	movs r1, #1
	bl ListMenuAddCursorObject
	strb r0, [r6, #0x1e]
_081AE8B4:
	ldrb r5, [r6, #0x1e]
	ldrb r0, [r6, #0x10]
	movs r1, #1
	bl GetWindowAttribute
	adds r4, r0, #0
	lsls r4, r4, #3
	add r4, r8
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r6, #0x10]
	movs r1, #2
	bl GetWindowAttribute
	adds r2, r0, #0
	lsls r2, r2, #3
	adds r2, r2, r7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #1
	bl ListMenuUpdateCursorObject
_081AE8E4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ListMenuDrawCursor

	thumb_func_start ListMenuAddCursorObject
ListMenuAddCursorObject: @ 0x081AE8F0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xa0
	strb r0, [r1, #1]
	ldrb r0, [r4, #0x10]
	movs r1, #3
	bl GetWindowAttribute
	mov r1, sp
	lsls r0, r0, #3
	adds r0, #2
	strh r0, [r1, #2]
	ldrb r0, [r4, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #1
	bl GetFontAttribute
	mov r1, sp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #2
	strh r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r1, #6]
	ldr r0, _081AE94C
	strh r0, [r1, #8]
	movs r0, #0xf
	strb r0, [r1, #0xa]
	mov r0, sp
	adds r1, r5, #0
	bl ListMenuAddCursorObjectInternal
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081AE94C: .4byte 0x0000FFFF
	thumb_func_end ListMenuAddCursorObject

	thumb_func_start ListMenuErasePrintedCursor
ListMenuErasePrintedCursor: @ 0x081AE950
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrb r1, [r7, #0x17]
	lsrs r0, r1, #6
	cmp r0, #0
	bne _081AE9CC
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #1
	bl GetFontAttribute
	adds r4, r0, #0
	ldrb r0, [r7, #0x16]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #0
	bl GetMenuCursorDimensionByFont
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #1
	bl GetMenuCursorDimensionByFont
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r6, [r7, #0x10]
	ldrb r2, [r7, #0x15]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	ldrb r2, [r7, #0x13]
	mov r3, r8
	muls r3, r4, r3
	adds r4, r3, #0
	ldrb r3, [r7, #0x14]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1c
	adds r3, r3, r4
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	bl FillWindowPixelRect
_081AE9CC:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ListMenuErasePrintedCursor

	thumb_func_start ListMenuUpdateSelectedRowIndexAndScrollOffset
ListMenuUpdateSelectedRowIndexAndScrollOffset: @ 0x081AE9D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldrh r3, [r4, #0x1a]
	ldrh r5, [r4, #0x18]
	cmp r1, #0
	bne _081AEA4C
	ldrh r0, [r4, #0xe]
	cmp r0, #1
	bne _081AE9F0
	movs r2, #0
	b _081AEA02
_081AE9F0:
	ldrh r0, [r4, #0xe]
	lsrs r2, r0, #1
	movs r1, #1
	ands r1, r0
	adds r2, r2, r1
	subs r0, r0, r2
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_081AEA02:
	cmp r5, #0
	bne _081AEA28
	cmp r3, #0
	beq _081AEA8E
	ldr r1, [r4]
	movs r2, #3
	rsbs r2, r2, #0
_081AEA10:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	cmp r0, r2
	bne _081AEA92
	cmp r3, #0
	bne _081AEA10
	b _081AEA8E
_081AEA28:
	cmp r3, r2
	bls _081AEA48
	ldr r1, [r4]
	movs r6, #3
	rsbs r6, r6, #0
_081AEA32:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	cmp r0, r6
	bne _081AEA92
	cmp r3, r2
	bhi _081AEA32
_081AEA48:
	subs r0, r5, #1
	b _081AEABA
_081AEA4C:
	ldrh r0, [r4, #0xe]
	cmp r0, #1
	bne _081AEA56
	movs r2, #0
	b _081AEA60
_081AEA56:
	ldrh r0, [r4, #0xe]
	lsrs r2, r0, #1
	movs r1, #1
	ands r1, r0
	adds r2, r2, r1
_081AEA60:
	adds r1, r0, #0
	ldrh r0, [r4, #0xc]
	subs r0, r0, r1
	cmp r5, r0
	bne _081AEA98
	subs r0, r1, #1
	cmp r3, r0
	bge _081AEA8E
	ldr r2, [r4]
	movs r6, #3
	rsbs r6, r6, #0
	adds r1, r0, #0
_081AEA78:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, r3
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r0, [r0, #4]
	cmp r0, r6
	bne _081AEA92
	cmp r3, r1
	blt _081AEA78
_081AEA8E:
	movs r0, #0
	b _081AEAC0
_081AEA92:
	strh r3, [r4, #0x1a]
	movs r0, #1
	b _081AEAC0
_081AEA98:
	cmp r3, r2
	bhs _081AEAB8
	ldr r1, [r4]
	movs r6, #3
	rsbs r6, r6, #0
_081AEAA2:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	cmp r0, r6
	bne _081AEA92
	cmp r3, r2
	blo _081AEAA2
_081AEAB8:
	adds r0, r5, #1
_081AEABA:
	strh r2, [r4, #0x1a]
	strh r0, [r4, #0x18]
	movs r0, #2
_081AEAC0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ListMenuUpdateSelectedRowIndexAndScrollOffset

	thumb_func_start ListMenuScroll
ListMenuScroll: @ 0x081AEAC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r7, r5, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldrh r0, [r6, #0xe]
	cmp r5, r0
	blo _081AEB02
	ldrb r0, [r6, #0x10]
	ldrb r2, [r6, #0x15]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldrh r1, [r6, #0x18]
	ldrh r3, [r6, #0xe]
	adds r0, r6, #0
	movs r2, #0
	bl ListMenuPrintEntries
	b _081AEBF2
_081AEB02:
	ldrb r0, [r6, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #1
	bl GetFontAttribute
	ldrb r1, [r6, #0x16]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r1, r8
	cmp r1, #0
	bne _081AEB94
	ldrb r0, [r6, #0x10]
	adds r2, r5, #0
	muls r2, r4, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r1, [r6, #0x15]
	lsls r1, r1, #0x1c
	lsrs r3, r1, #4
	orrs r3, r1
	lsrs r3, r3, #0x18
	movs r1, #1
	bl ScrollWindow
	ldrh r1, [r6, #0x18]
	adds r0, r6, #0
	movs r2, #0
	adds r3, r5, #0
	bl ListMenuPrintEntries
	ldrh r0, [r6, #0xe]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r1, #0
	ldrb r4, [r6, #0x14]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1c
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r6, #0x10]
	movs r1, #3
	bl GetWindowAttribute
	adds r5, r0, #0
	lsls r5, r5, #0x13
	lsrs r5, r5, #0x10
	ldrb r0, [r6, #0x10]
	movs r1, #4
	bl GetWindowAttribute
	lsls r0, r0, #3
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r3, [r6, #0x10]
	ldrb r2, [r6, #0x15]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r2, #0
	adds r3, r4, #0
	bl FillWindowPixelRect
	b _081AEBF2
_081AEB94:
	ldrb r0, [r6, #0x10]
	adds r2, r7, #0
	muls r2, r4, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r1, [r6, #0x15]
	lsls r1, r1, #0x1c
	lsrs r3, r1, #4
	orrs r3, r1
	lsrs r3, r3, #0x18
	movs r1, #0
	bl ScrollWindow
	ldrh r2, [r6, #0xe]
	subs r2, r2, r7
	ldrh r1, [r6, #0x18]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r6, #0
	adds r3, r7, #0
	bl ListMenuPrintEntries
	ldrb r0, [r6, #0x10]
	movs r1, #3
	bl GetWindowAttribute
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x10
	ldrb r3, [r6, #0x10]
	ldrb r2, [r6, #0x15]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	str r0, [sp]
	ldrb r0, [r6, #0x14]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r2, #0
	movs r3, #0
	bl FillWindowPixelRect
_081AEBF2:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ListMenuScroll

	thumb_func_start ListMenuChangeSelection
ListMenuChangeSelection: @ 0x081AEC00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	ldrh r0, [r4, #0x1a]
	mov sl, r0
	movs r7, #0
	movs r5, #0
	movs r0, #0
	cmp r7, r8
	bhs _081AEC68
_081AEC2E:
	adds r6, r0, #1
	b _081AEC4E
_081AEC32:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	adds r0, r0, r1
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _081AEC60
_081AEC4E:
	adds r0, r4, #0
	mov r1, sb
	bl ListMenuUpdateSelectedRowIndexAndScrollOffset
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r5, r0
	cmp r0, #2
	beq _081AEC32
_081AEC60:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r8
	blo _081AEC2E
_081AEC68:
	ldr r0, [sp]
	cmp r0, #0
	beq _081AECC6
	cmp r5, #1
	beq _081AEC7E
	cmp r5, #1
	ble _081AEC7A
	cmp r5, #3
	ble _081AEC9E
_081AEC7A:
	movs r0, #1
	b _081AECC8
_081AEC7E:
	adds r0, r4, #0
	mov r1, sl
	bl ListMenuErasePrintedCursor
	adds r0, r4, #0
	bl ListMenuDrawCursor
	adds r0, r4, #0
	movs r1, #0
	bl ListMenuCallSelectionChangedCallback
	ldrb r0, [r4, #0x10]
	movs r1, #2
	bl CopyWindowToVram
	b _081AECC6
_081AEC9E:
	adds r0, r4, #0
	mov r1, sl
	bl ListMenuErasePrintedCursor
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, sb
	bl ListMenuScroll
	adds r0, r4, #0
	bl ListMenuDrawCursor
	adds r0, r4, #0
	movs r1, #0
	bl ListMenuCallSelectionChangedCallback
	ldrb r0, [r4, #0x10]
	movs r1, #2
	bl CopyWindowToVram
_081AECC6:
	movs r0, #0
_081AECC8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end ListMenuChangeSelection

	thumb_func_start ListMenuCallSelectionChangedCallback
ListMenuCallSelectionChangedCallback: @ 0x081AECD8
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, [r2, #4]
	cmp r3, #0
	beq _081AECFA
	ldrh r0, [r2, #0x18]
	ldrh r1, [r2, #0x1a]
	adds r0, r0, r1
	ldr r1, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl _call_via_r3
_081AECFA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ListMenuCallSelectionChangedCallback

	thumb_func_start ListMenuOverrideSetColors
ListMenuOverrideSetColors: @ 0x081AED00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r6, _081AED4C
	movs r5, #0xf
	ands r0, r5
	ldrb r3, [r6]
	mov r8, r3
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r3, r4, #0
	mov r7, r8
	ands r3, r7
	orrs r3, r0
	lsrs r1, r1, #0x14
	ands r3, r5
	orrs r3, r1
	strb r3, [r6]
	ands r2, r5
	ldrb r0, [r6, #1]
	ands r4, r0
	orrs r4, r2
	strb r4, [r6, #1]
	ldrb r0, [r6, #3]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r6, #3]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AED4C: .4byte 0x03006040
	thumb_func_end ListMenuOverrideSetColors

	thumb_func_start ListMenuDefaultCursorMoveFunc
ListMenuDefaultCursorMoveFunc: @ 0x081AED50
	push {lr}
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _081AED5E
	movs r0, #5
	bl PlaySE
_081AED5E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ListMenuDefaultCursorMoveFunc

	thumb_func_start ListMenuGetUnkIndicatorsStructFields
ListMenuGetUnkIndicatorsStructFields: @ 0x081AED64
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081AED88
	adds r2, r1, r0
	cmp r3, #0x10
	bhi _081AEE2C
	lsls r0, r3, #2
	ldr r1, _081AED8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081AED88: .4byte 0x03005B68
_081AED8C: .4byte 0x081AED90
_081AED90: @ jump table
	.4byte _081AEDD4 @ case 0
	.4byte _081AEDD4 @ case 1
	.4byte _081AEDD8 @ case 2
	.4byte _081AEDDC @ case 3
	.4byte _081AEDE0 @ case 4
	.4byte _081AEDE4 @ case 5
	.4byte _081AEDE8 @ case 6
	.4byte _081AEDEC @ case 7
	.4byte _081AEDF0 @ case 8
	.4byte _081AEDF4 @ case 9
	.4byte _081AEDFA @ case 10
	.4byte _081AEE02 @ case 11
	.4byte _081AEE08 @ case 12
	.4byte _081AEE10 @ case 13
	.4byte _081AEE18 @ case 14
	.4byte _081AEE1E @ case 15
	.4byte _081AEE26 @ case 16
_081AEDD4:
	ldr r0, [r2, #4]
	b _081AEE30
_081AEDD8:
	ldrh r0, [r2, #0xc]
	b _081AEE30
_081AEDDC:
	ldrh r0, [r2, #0xe]
	b _081AEE30
_081AEDE0:
	ldrb r0, [r2, #0x10]
	b _081AEE30
_081AEDE4:
	ldrb r0, [r2, #0x11]
	b _081AEE30
_081AEDE8:
	ldrb r0, [r2, #0x12]
	b _081AEE30
_081AEDEC:
	ldrb r0, [r2, #0x13]
	b _081AEE30
_081AEDF0:
	ldrb r0, [r2, #0x14]
	b _081AEDFC
_081AEDF4:
	ldrb r0, [r2, #0x14]
	lsrs r0, r0, #4
	b _081AEE30
_081AEDFA:
	ldrb r0, [r2, #0x15]
_081AEDFC:
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	b _081AEE30
_081AEE02:
	ldrb r0, [r2, #0x15]
	lsrs r0, r0, #4
	b _081AEE30
_081AEE08:
	ldrb r0, [r2, #0x16]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	b _081AEE30
_081AEE10:
	ldrb r0, [r2, #0x16]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	b _081AEE30
_081AEE18:
	ldrb r0, [r2, #0x16]
	lsrs r0, r0, #6
	b _081AEE30
_081AEE1E:
	ldrb r0, [r2, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	b _081AEE30
_081AEE26:
	ldrb r0, [r2, #0x17]
	lsrs r0, r0, #6
	b _081AEE30
_081AEE2C:
	movs r0, #1
	rsbs r0, r0, #0
_081AEE30:
	pop {r1}
	bx r1
	thumb_func_end ListMenuGetUnkIndicatorsStructFields

	thumb_func_start ListMenuSetUnkIndicatorsStructField
ListMenuSetUnkIndicatorsStructField: @ 0x081AEE34
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081AEE58
	adds r3, r1, r0
	cmp r4, #0x10
	bhi _081AEF34
	lsls r0, r4, #2
	ldr r1, _081AEE5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081AEE58: .4byte 0x03005B68
_081AEE5C: .4byte 0x081AEE60
_081AEE60: @ jump table
	.4byte _081AEEA4 @ case 0
	.4byte _081AEEA4 @ case 1
	.4byte _081AEEA8 @ case 2
	.4byte _081AEEAC @ case 3
	.4byte _081AEEB0 @ case 4
	.4byte _081AEEB4 @ case 5
	.4byte _081AEEB8 @ case 6
	.4byte _081AEEBC @ case 7
	.4byte _081AEEC0 @ case 8
	.4byte _081AEECC @ case 9
	.4byte _081AEEDA @ case 10
	.4byte _081AEEE6 @ case 11
	.4byte _081AEEF4 @ case 12
	.4byte _081AEF00 @ case 13
	.4byte _081AEF0E @ case 14
	.4byte _081AEF1C @ case 15
	.4byte _081AEF28 @ case 16
_081AEEA4:
	str r2, [r3, #4]
	b _081AEF34
_081AEEA8:
	strh r2, [r3, #0xc]
	b _081AEF34
_081AEEAC:
	strh r2, [r3, #0xe]
	b _081AEF34
_081AEEB0:
	strb r2, [r3, #0x10]
	b _081AEF34
_081AEEB4:
	strb r2, [r3, #0x11]
	b _081AEF34
_081AEEB8:
	strb r2, [r3, #0x12]
	b _081AEF34
_081AEEBC:
	strb r2, [r3, #0x13]
	b _081AEF34
_081AEEC0:
	movs r0, #0xf
	ands r2, r0
	ldrb r1, [r3, #0x14]
	movs r0, #0x10
	rsbs r0, r0, #0
	b _081AEED2
_081AEECC:
	lsls r2, r2, #4
	ldrb r1, [r3, #0x14]
	movs r0, #0xf
_081AEED2:
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x14]
	b _081AEF34
_081AEEDA:
	movs r0, #0xf
	ands r2, r0
	ldrb r1, [r3, #0x15]
	movs r0, #0x10
	rsbs r0, r0, #0
	b _081AEEEC
_081AEEE6:
	lsls r2, r2, #4
	ldrb r1, [r3, #0x15]
	movs r0, #0xf
_081AEEEC:
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x15]
	b _081AEF34
_081AEEF4:
	movs r0, #7
	ands r2, r0
	ldrb r1, [r3, #0x16]
	movs r0, #8
	rsbs r0, r0, #0
	b _081AEF14
_081AEF00:
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #3
	ldrb r1, [r3, #0x16]
	movs r0, #0x39
	rsbs r0, r0, #0
	b _081AEF14
_081AEF0E:
	lsls r2, r2, #6
	ldrb r1, [r3, #0x16]
	movs r0, #0x3f
_081AEF14:
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x16]
	b _081AEF34
_081AEF1C:
	movs r0, #0x3f
	ands r2, r0
	ldrb r1, [r3, #0x17]
	movs r0, #0x40
	rsbs r0, r0, #0
	b _081AEF2E
_081AEF28:
	lsls r2, r2, #6
	ldrb r1, [r3, #0x17]
	movs r0, #0x3f
_081AEF2E:
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x17]
_081AEF34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ListMenuSetUnkIndicatorsStructField

	thumb_func_start SpriteCallback_ScrollIndicatorArrow
SpriteCallback_ScrollIndicatorArrow: @ 0x081AEF3C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081AEF4E
	cmp r0, #1
	beq _081AEF62
	b _081AEFBC
_081AEF4E:
	ldrh r1, [r4, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _081AEFBC
_081AEF62:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081AEF72
	cmp r0, #1
	beq _081AEF98
	ldrh r2, [r4, #0x38]
	b _081AEFB6
_081AEF72:
	movs r0, #0x34
	ldrsh r3, [r4, r0]
	ldr r1, _081AEF94
	ldrh r2, [r4, #0x38]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	cmp r0, #0
	bge _081AEF8C
	adds r0, #0xff
_081AEF8C:
	asrs r0, r0, #8
	strh r0, [r4, #0x24]
	b _081AEFB6
	.align 2, 0
_081AEF94: .4byte 0x082FA8CC
_081AEF98:
	movs r0, #0x34
	ldrsh r3, [r4, r0]
	ldr r1, _081AEFC4
	ldrh r2, [r4, #0x38]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	cmp r0, #0
	bge _081AEFB2
	adds r0, #0xff
_081AEFB2:
	asrs r0, r0, #8
	strh r0, [r4, #0x26]
_081AEFB6:
	ldrh r0, [r4, #0x36]
	adds r0, r2, r0
	strh r0, [r4, #0x38]
_081AEFBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AEFC4: .4byte 0x082FA8CC
	thumb_func_end SpriteCallback_ScrollIndicatorArrow

	thumb_func_start AddScrollIndicatorArrowObject
AddScrollIndicatorArrowObject: @ 0x081AEFC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r5, [sp, #0x30]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r8, r6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov ip, r5
	mov r4, sp
	ldr r0, _081AF04C
	ldm r0!, {r5, r6, r7}
	stm r4!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r4!, {r5, r6, r7}
	mov r0, sp
	movs r4, #0
	strh r3, [r0]
	mov r3, ip
	strh r3, [r0, #2]
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081AF050
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r3, r3, r1
	adds r5, r3, #0
	adds r5, #0x3e
	ldrb r1, [r5]
	movs r2, #4
	orrs r1, r2
	strb r1, [r5]
	strh r4, [r3, #0x2e]
	ldr r1, _081AF054
	mov r5, r8
	lsls r6, r5, #2
	adds r6, r6, r1
	ldrb r2, [r6]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	strh r1, [r3, #0x30]
	lsrs r2, r2, #4
	strh r2, [r3, #0x32]
	ldrb r1, [r6, #1]
	strh r1, [r3, #0x34]
	ldrh r1, [r6, #2]
	strh r1, [r3, #0x36]
	strh r4, [r3, #0x38]
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081AF04C: .4byte 0x085DFAFC
_081AF050: .4byte 0x020205AC
_081AF054: .4byte 0x085DFAB4
	thumb_func_end AddScrollIndicatorArrowObject

	thumb_func_start AddScrollIndicatorArrowPair
AddScrollIndicatorArrowPair: @ 0x081AF058
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov sb, r1
	ldr r0, _081AF0A4
	str r0, [sp, #4]
	ldr r5, _081AF0A8
	ldr r0, [sp, #8]
	ands r0, r5
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	ldrh r1, [r6, #0xa]
	lsls r1, r1, #0x10
	ldr r4, _081AF0AC
	ands r0, r4
	orrs r0, r1
	str r0, [sp, #8]
	add r0, sp, #4
	bl LoadCompressedSpriteSheet
	ldrh r2, [r6, #0xc]
	cmp r2, r4
	bne _081AF0B4
	ldr r0, _081AF0B0
	ldrb r1, [r6, #0xe]
	lsls r1, r1, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	b _081AF0C6
	.align 2, 0
_081AF0A4: .4byte 0x085DFB80
_081AF0A8: .4byte 0xFFFF0000
_081AF0AC: .4byte 0x0000FFFF
_081AF0B0: .4byte 0x085DFB60
_081AF0B4:
	ldr r0, _081AF164
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	ldr r1, [r0, #4]
	ands r1, r5
	orrs r1, r2
	str r1, [r0, #4]
	bl LoadSpritePalette
_081AF0C6:
	ldr r0, _081AF168
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _081AF16C
	adds r7, r0, r1
	movs r0, #0
	strb r0, [r7]
	mov r0, sb
	str r0, [r7, #4]
	ldrh r0, [r6, #6]
	strh r0, [r7, #8]
	ldrh r0, [r6, #8]
	strh r0, [r7, #0xa]
	ldrh r0, [r6, #0xa]
	strh r0, [r7, #0xe]
	ldrh r0, [r6, #0xc]
	strh r0, [r7, #0x10]
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	ldrb r2, [r6, #2]
	ldrh r3, [r6, #0xa]
	ldrh r4, [r6, #0xc]
	str r4, [sp]
	bl AddScrollIndicatorArrowObject
	strb r0, [r7, #0xc]
	ldrb r0, [r6, #3]
	ldrb r1, [r6, #4]
	ldrb r2, [r6, #5]
	ldrh r3, [r6, #0xa]
	ldrh r4, [r6, #0xc]
	str r4, [sp]
	bl AddScrollIndicatorArrowObject
	strb r0, [r7, #0xd]
	ldrh r1, [r6, #0xc]
	ldr r0, _081AF170
	cmp r1, r0
	bne _081AF154
	ldr r5, _081AF174
	ldrb r0, [r7, #0xc]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r3, [r6, #0xe]
	lsls r3, r3, #4
	ldrb r4, [r1, #5]
	movs r2, #0xf
	adds r0, r2, #0
	ands r0, r4
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r1, [r7, #0xd]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r6, #0xe]
	lsls r1, r1, #4
	ldrb r3, [r0, #5]
	ands r2, r3
	orrs r2, r1
	strb r2, [r0, #5]
_081AF154:
	mov r0, r8
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081AF164: .4byte 0x085DFB60
_081AF168: .4byte 0x081AF1DD
_081AF16C: .4byte 0x03005B68
_081AF170: .4byte 0x0000FFFF
_081AF174: .4byte 0x020205AC
	thumb_func_end AddScrollIndicatorArrowPair

	thumb_func_start AddScrollIndicatorArrowPairParameterized
AddScrollIndicatorArrowPairParameterized: @ 0x081AF178
	push {r4, lr}
	adds r4, r1, #0
	subs r0, #2
	cmp r0, #1
	bhi _081AF19C
	ldr r0, _081AF198
	movs r1, #2
	strb r1, [r0]
	strb r4, [r0, #1]
	strb r2, [r0, #2]
	movs r1, #3
	strb r1, [r0, #3]
	strb r4, [r0, #4]
	strb r3, [r0, #5]
	b _081AF1AE
	.align 2, 0
_081AF198: .4byte 0x0203CB58
_081AF19C:
	ldr r0, _081AF1D8
	movs r1, #0
	strb r1, [r0]
	strb r2, [r0, #1]
	strb r4, [r0, #2]
	movs r1, #1
	strb r1, [r0, #3]
	strb r3, [r0, #4]
	strb r4, [r0, #5]
_081AF1AE:
	adds r2, r0, #0
	movs r1, #0
	movs r0, #0
	strh r0, [r2, #6]
	ldr r0, [sp, #8]
	strh r0, [r2, #8]
	ldr r0, [sp, #0xc]
	strh r0, [r2, #0xa]
	ldr r0, [sp, #0x10]
	strh r0, [r2, #0xc]
	strb r1, [r2, #0xe]
	adds r0, r2, #0
	ldr r1, [sp, #0x14]
	bl AddScrollIndicatorArrowPair
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081AF1D8: .4byte 0x0203CB58
	thumb_func_end AddScrollIndicatorArrowPairParameterized

	thumb_func_start Task_ScrollIndicatorArrowPair
Task_ScrollIndicatorArrowPair: @ 0x081AF1DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081AF214
	adds r4, r1, r0
	ldr r0, [r4, #4]
	ldrh r5, [r0]
	ldrh r0, [r4, #8]
	cmp r5, r0
	bne _081AF220
	ldr r0, _081AF218
	cmp r5, r0
	beq _081AF220
	ldr r3, _081AF21C
	ldrb r1, [r4, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _081AF236
	.align 2, 0
_081AF214: .4byte 0x03005B68
_081AF218: .4byte 0x0000FFFF
_081AF21C: .4byte 0x020205AC
_081AF220:
	ldr r3, _081AF254
	ldrb r1, [r4, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
_081AF236:
	strb r1, [r0]
	ldrh r0, [r4, #0xa]
	cmp r5, r0
	bne _081AF258
	ldrb r1, [r4, #0xd]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _081AF26C
	.align 2, 0
_081AF254: .4byte 0x020205AC
_081AF258:
	ldrb r1, [r4, #0xd]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
_081AF26C:
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_ScrollIndicatorArrowPair

	thumb_func_start Task_ScrollIndicatorArrowPairOnMainMenu
Task_ScrollIndicatorArrowPairOnMainMenu: @ 0x081AF274
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081AF2B8
	adds r4, r1, r0
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081AF2C0
	ldr r3, _081AF2BC
	ldrb r1, [r4, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r4, #0xd]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _081AF2EA
	.align 2, 0
_081AF2B8: .4byte 0x03005B68
_081AF2BC: .4byte 0x020205AC
_081AF2C0:
	ldr r3, _081AF2F4
	ldrb r1, [r4, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4, #0xd]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
_081AF2EA:
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081AF2F4: .4byte 0x020205AC
	thumb_func_end Task_ScrollIndicatorArrowPairOnMainMenu

	thumb_func_start RemoveScrollIndicatorArrowPair
RemoveScrollIndicatorArrowPair: @ 0x081AF2F8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081AF34C
	adds r5, r0, r1
	ldrh r0, [r5, #0xe]
	ldr r4, _081AF350
	cmp r0, r4
	beq _081AF316
	bl FreeSpriteTilesByTag
_081AF316:
	ldrh r0, [r5, #0x10]
	cmp r0, r4
	beq _081AF320
	bl FreeSpritePaletteByTag
_081AF320:
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081AF354
	adds r0, r0, r4
	bl DestroySprite
	ldrb r1, [r5, #0xd]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	adds r0, r6, #0
	bl DestroyTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AF34C: .4byte 0x03005B68
_081AF350: .4byte 0x0000FFFF
_081AF354: .4byte 0x020205AC
	thumb_func_end RemoveScrollIndicatorArrowPair

	thumb_func_start ListMenuAddCursorObjectInternal
ListMenuAddCursorObjectInternal: @ 0x081AF358
	push {lr}
	cmp r1, #0
	beq _081AF362
	cmp r1, #1
	beq _081AF368
_081AF362:
	bl ListMenuAddRedOutlineCursorObject
	b _081AF36C
_081AF368:
	bl ListMenuAddRedArrowCursorObject
_081AF36C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end ListMenuAddCursorObjectInternal

	thumb_func_start ListMenuUpdateCursorObject
ListMenuUpdateCursorObject: @ 0x081AF374
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r3, #0
	beq _081AF38C
	cmp r3, #1
	beq _081AF392
	b _081AF396
_081AF38C:
	bl ListMenuUpdateRedOutlineCursorObject
	b _081AF396
_081AF392:
	bl ListMenuUpdateRedArrowCursorObject
_081AF396:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ListMenuUpdateCursorObject

	thumb_func_start ListMenuRemoveCursorObject
ListMenuRemoveCursorObject: @ 0x081AF39C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, #0
	beq _081AF3AC
	cmp r1, #1
	beq _081AF3B2
	b _081AF3B6
_081AF3AC:
	bl ListMenuRemoveRedOutlineCursorObject
	b _081AF3B6
_081AF3B2:
	bl ListMenuRemoveRedArrowCursorObject
_081AF3B6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ListMenuRemoveCursorObject

	thumb_func_start Task_RedOutlineCursor
Task_RedOutlineCursor: @ 0x081AF3BC
	bx lr
	.align 2, 0
	thumb_func_end Task_RedOutlineCursor

	thumb_func_start ListMenuGetRedOutlineCursorSpriteCount
ListMenuGetRedOutlineCursorSpriteCount: @ 0x081AF3C0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #4
	cmp r0, #0x10
	bls _081AF3E0
	movs r2, #8
	subs r0, #8
	cmp r2, r0
	bge _081AF3E0
_081AF3D8:
	adds r3, #2
	adds r2, #8
	cmp r2, r0
	blt _081AF3D8
_081AF3E0:
	cmp r1, #0x10
	bls _081AF3F4
	movs r2, #8
	subs r1, #8
	cmp r2, r1
	bge _081AF3F4
_081AF3EC:
	adds r3, #2
	adds r2, #8
	cmp r2, r1
	blt _081AF3EC
_081AF3F4:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end ListMenuGetRedOutlineCursorSpriteCount

	thumb_func_start ListMenuSetUpRedOutlineCursorSpriteOamTable
ListMenuSetUpRedOutlineCursorSpriteOamTable: @ 0x081AF3FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r3, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _081AF4E0
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0x88
	strb r1, [r3]
	strb r1, [r3, #1]
	ldr r0, _081AF4E4
	ldr r0, [r0]
	str r0, [r3, #4]
	mov r2, r8
	adds r2, #0x80
	strb r2, [r3, #4]
	strb r1, [r3, #5]
	ldr r0, _081AF4E8
	ldr r0, [r0]
	str r0, [r3, #8]
	strb r1, [r3, #8]
	mov r4, sb
	adds r4, #0x80
	strb r4, [r3, #9]
	ldr r0, _081AF4EC
	ldr r0, [r0]
	str r0, [r3, #0xc]
	strb r2, [r3, #0xc]
	strb r4, [r3, #0xd]
	movs r0, #4
	mov ip, r0
	mov r2, r8
	cmp r2, #0x10
	bls _081AF490
	movs r2, #8
	mov r5, r8
	subs r5, #8
	cmp r2, r5
	bge _081AF490
	ldr r0, _081AF4F0
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _081AF4F4
	ldr r6, [r0]
	adds r1, r3, #0
	adds r1, #0x10
	movs r7, #0x88
	mov sl, r7
_081AF46E:
	ldr r0, [sp]
	str r0, [r1]
	adds r0, r2, #0
	subs r0, #0x78
	strb r0, [r1]
	mov r7, sl
	strb r7, [r1, #1]
	adds r1, #4
	str r6, [r1]
	strb r0, [r1]
	strb r4, [r1, #1]
	adds r1, #4
	movs r0, #2
	add ip, r0
	adds r2, #8
	cmp r2, r5
	blt _081AF46E
_081AF490:
	mov r2, sb
	cmp r2, #0x10
	bls _081AF4CE
	movs r1, #8
	mov r4, sb
	subs r4, #8
	cmp r1, r4
	bge _081AF4CE
	ldr r0, _081AF4F8
	ldr r6, [r0]
	ldr r0, _081AF4FC
	ldr r5, [r0]
	mov r7, ip
	lsls r0, r7, #2
	adds r2, r0, r3
	movs r7, #0x88
	mov r3, r8
	adds r3, #0x80
_081AF4B4:
	str r6, [r2]
	strb r7, [r2]
	adds r0, r1, #0
	subs r0, #0x78
	strb r0, [r2, #1]
	adds r2, #4
	str r5, [r2]
	strb r3, [r2]
	strb r0, [r2, #1]
	adds r2, #4
	adds r1, #8
	cmp r1, r4
	blt _081AF4B4
_081AF4CE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AF4E0: .4byte 0x085DFB14
_081AF4E4: .4byte 0x085DFB18
_081AF4E8: .4byte 0x085DFB2C
_081AF4EC: .4byte 0x085DFB30
_081AF4F0: .4byte 0x085DFB1C
_081AF4F4: .4byte 0x085DFB28
_081AF4F8: .4byte 0x085DFB20
_081AF4FC: .4byte 0x085DFB24
	thumb_func_end ListMenuSetUpRedOutlineCursorSpriteOamTable

	thumb_func_start ListMenuAddRedOutlineCursorObject
ListMenuAddRedOutlineCursorObject: @ 0x081AF500
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	adds r6, r0, #0
	ldr r0, _081AF54C
	str r0, [sp, #0x18]
	ldr r5, _081AF550
	add r0, sp, #0x18
	ldr r1, [r0, #4]
	ands r1, r5
	movs r2, #0x80
	lsls r2, r2, #1
	orrs r1, r2
	ldrh r2, [r6, #6]
	lsls r2, r2, #0x10
	ldr r3, _081AF554
	ands r1, r3
	orrs r1, r2
	str r1, [r0, #4]
	bl LoadCompressedSpriteSheet
	ldrh r2, [r6, #8]
	ldr r7, _081AF554
	cmp r2, r7
	bne _081AF55C
	ldr r0, _081AF558
	ldrb r1, [r6, #0xa]
	lsls r1, r1, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	b _081AF56E
	.align 2, 0
_081AF54C: .4byte 0x085DFBF0
_081AF550: .4byte 0xFFFF0000
_081AF554: .4byte 0x0000FFFF
_081AF558: .4byte 0x085DFB60
_081AF55C:
	ldr r0, _081AF654
	str r0, [sp, #0x20]
	add r0, sp, #0x20
	ldr r1, [r0, #4]
	ands r1, r5
	orrs r1, r2
	str r1, [r0, #4]
	bl LoadSpritePalette
_081AF56E:
	ldr r0, _081AF658
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081AF65C
	adds r5, r0, r1
	ldrh r0, [r6, #6]
	movs r3, #0
	mov r8, r3
	strh r0, [r5, #0xe]
	ldrh r0, [r6, #8]
	strh r0, [r5, #0x10]
	ldrh r0, [r6, #2]
	ldrh r1, [r6, #4]
	bl ListMenuGetRedOutlineCursorSpriteCount
	strb r0, [r5]
	ldrb r0, [r5]
	lsls r0, r0, #2
	bl Alloc
	adds r2, r0, #0
	str r2, [r5, #8]
	str r2, [r5, #4]
	ldrh r0, [r6, #2]
	ldrh r1, [r6, #4]
	bl ListMenuSetUpRedOutlineCursorSpriteOamTable
	mov r1, sp
	ldr r0, _081AF660
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	mov r1, sp
	ldrh r0, [r6, #6]
	strh r0, [r1]
	ldrh r0, [r6, #8]
	strh r0, [r1, #2]
	ldrb r1, [r6]
	adds r1, #0x78
	ldrb r2, [r6, #1]
	adds r2, #0x78
	mov r0, sp
	movs r3, #0
	bl CreateSprite
	strb r0, [r5, #0xc]
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r7, _081AF664
	adds r0, r0, r7
	adds r1, r5, #0
	bl SetSubspriteTables
	ldrb r0, [r5, #0xc]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x43
	mov r1, r8
	strb r1, [r0]
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x42
	ldrb r2, [r0]
	movs r1, #0x40
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrh r1, [r6, #8]
	ldr r0, _081AF668
	cmp r1, r0
	bne _081AF646
	ldrb r0, [r5, #0xc]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r6, #0xa]
	lsls r2, r2, #4
	ldrb r3, [r1, #5]
	movs r0, #0xf
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
_081AF646:
	adds r0, r4, #0
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081AF654: .4byte 0x085DFB60
_081AF658: .4byte 0x081AF3BD
_081AF65C: .4byte 0x03005B68
_081AF660: .4byte 0x082BF314
_081AF664: .4byte 0x020205AC
_081AF668: .4byte 0x0000FFFF
	thumb_func_end ListMenuAddRedOutlineCursorObject

	thumb_func_start ListMenuUpdateRedOutlineCursorObject
ListMenuUpdateRedOutlineCursorObject: @ 0x081AF66C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #3
	ldr r0, _081AF6A8
	adds r3, r3, r0
	ldr r5, _081AF6AC
	ldrb r4, [r3, #0xc]
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r1, #0x78
	strh r1, [r0, #0x20]
	ldrb r1, [r3, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r2, #0x78
	strh r2, [r0, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AF6A8: .4byte 0x03005B68
_081AF6AC: .4byte 0x020205AC
	thumb_func_end ListMenuUpdateRedOutlineCursorObject

	thumb_func_start ListMenuRemoveRedOutlineCursorObject
ListMenuRemoveRedOutlineCursorObject: @ 0x081AF6B0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081AF6FC
	adds r4, r0, r1
	ldr r0, [r4, #8]
	bl Free
	ldrh r0, [r4, #0xe]
	ldr r6, _081AF700
	cmp r0, r6
	beq _081AF6D4
	bl FreeSpriteTilesByTag
_081AF6D4:
	ldrh r0, [r4, #0x10]
	cmp r0, r6
	beq _081AF6DE
	bl FreeSpritePaletteByTag
_081AF6DE:
	ldrb r1, [r4, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081AF704
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r5, #0
	bl DestroyTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AF6FC: .4byte 0x03005B68
_081AF700: .4byte 0x0000FFFF
_081AF704: .4byte 0x020205AC
	thumb_func_end ListMenuRemoveRedOutlineCursorObject

	thumb_func_start SpriteCallback_RedArrowCursor
SpriteCallback_RedArrowCursor: @ 0x081AF708
	push {lr}
	adds r2, r0, #0
	ldr r1, _081AF730
	ldrh r3, [r2, #0x2e]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _081AF720
	adds r0, #0x3f
_081AF720:
	asrs r0, r0, #6
	strh r0, [r2, #0x24]
	adds r0, r3, #0
	adds r0, #8
	strh r0, [r2, #0x2e]
	pop {r0}
	bx r0
	.align 2, 0
_081AF730: .4byte 0x082FA8CC
	thumb_func_end SpriteCallback_RedArrowCursor

	thumb_func_start ListMenuDummyTask
ListMenuDummyTask: @ 0x081AF734
	bx lr
	.align 2, 0
	thumb_func_end ListMenuDummyTask

	thumb_func_start ListMenuAddRedArrowCursorObject
ListMenuAddRedArrowCursorObject: @ 0x081AF738
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r0, _081AF77C
	str r0, [sp, #0x18]
	ldr r6, _081AF780
	add r0, sp, #0x18
	ldr r1, [r0, #4]
	ands r1, r6
	movs r2, #0x80
	orrs r1, r2
	ldrh r2, [r5, #6]
	lsls r2, r2, #0x10
	ldr r4, _081AF784
	ands r1, r4
	orrs r1, r2
	str r1, [r0, #4]
	bl LoadCompressedSpriteSheet
	ldrh r2, [r5, #8]
	cmp r2, r4
	bne _081AF78C
	ldr r0, _081AF788
	ldrb r1, [r5, #0xa]
	lsls r1, r1, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	b _081AF79E
	.align 2, 0
_081AF77C: .4byte 0x085DFC30
_081AF780: .4byte 0xFFFF0000
_081AF784: .4byte 0x0000FFFF
_081AF788: .4byte 0x085DFB60
_081AF78C:
	ldr r0, _081AF828
	str r0, [sp, #0x20]
	add r0, sp, #0x20
	ldr r1, [r0, #4]
	ands r1, r6
	orrs r1, r2
	str r1, [r0, #4]
	bl LoadSpritePalette
_081AF79E:
	ldr r0, _081AF82C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081AF830
	adds r4, r0, r1
	ldrh r0, [r5, #6]
	strh r0, [r4, #2]
	ldrh r0, [r5, #8]
	strh r0, [r4, #4]
	mov r1, sp
	ldr r0, _081AF834
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	mov r1, sp
	ldrh r0, [r5, #6]
	strh r0, [r1]
	ldrh r0, [r5, #8]
	strh r0, [r1, #2]
	ldrb r1, [r5]
	ldrb r2, [r5, #1]
	mov r0, sp
	movs r3, #0
	bl CreateSprite
	strb r0, [r4]
	ldr r3, _081AF838
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #8
	strh r2, [r0, #0x24]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x26]
	ldrh r1, [r5, #8]
	ldr r0, _081AF83C
	cmp r1, r0
	bne _081AF81E
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r5, #0xa]
	lsls r2, r2, #4
	ldrb r3, [r1, #5]
	movs r0, #0xf
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
_081AF81E:
	adds r0, r6, #0
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081AF828: .4byte 0x085DFB60
_081AF82C: .4byte 0x081AF735
_081AF830: .4byte 0x03005B68
_081AF834: .4byte 0x085DFB48
_081AF838: .4byte 0x020205AC
_081AF83C: .4byte 0x0000FFFF
	thumb_func_end ListMenuAddRedArrowCursorObject

	thumb_func_start ListMenuUpdateRedArrowCursorObject
ListMenuUpdateRedArrowCursorObject: @ 0x081AF840
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #3
	ldr r0, _081AF870
	adds r3, r3, r0
	ldr r5, _081AF874
	ldrb r4, [r3]
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r1, [r0, #0x20]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081AF870: .4byte 0x03005B68
_081AF874: .4byte 0x020205AC
	thumb_func_end ListMenuUpdateRedArrowCursorObject

	thumb_func_start ListMenuRemoveRedArrowCursorObject
ListMenuRemoveRedArrowCursorObject: @ 0x081AF878
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081AF8BC
	adds r4, r0, r1
	ldrh r0, [r4, #2]
	ldr r6, _081AF8C0
	cmp r0, r6
	beq _081AF896
	bl FreeSpriteTilesByTag
_081AF896:
	ldrh r0, [r4, #4]
	cmp r0, r6
	beq _081AF8A0
	bl FreeSpritePaletteByTag
_081AF8A0:
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081AF8C4
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r5, #0
	bl DestroyTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081AF8BC: .4byte 0x03005B68
_081AF8C0: .4byte 0x0000FFFF
_081AF8C4: .4byte 0x020205AC
	thumb_func_end ListMenuRemoveRedArrowCursorObject

