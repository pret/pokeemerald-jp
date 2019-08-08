.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_080D4058
sub_080D4058: @ 0x080D4058
	push {lr}
	bl HideStartMenu
	bl ShowMapNamePopup
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end sub_080D4058

	thumb_func_start ShowMapNamePopup
ShowMapNamePopup: @ 0x080D4068
	push {r4, lr}
	movs r0, #0x80
	lsls r0, r0, #7
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080D40F0
	ldr r4, _080D40BC
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D40C8
	adds r0, r4, #0
	movs r1, #0x5a
	bl CreateTask
	ldr r4, _080D40C0
	strb r0, [r4]
	movs r0, #0x12
	movs r1, #0x28
	bl SetGpuReg
	ldr r2, _080D40C4
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #6
	strh r1, [r0, #8]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x28
	strh r1, [r0, #0xc]
	b _080D40F0
	.align 2, 0
_080D40BC: .4byte 0x080D4101
_080D40C0: .4byte 0x02039A74
_080D40C4: .4byte 0x03005B60
_080D40C8:
	ldr r3, _080D40F8
	ldr r2, _080D40FC
	ldrb r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r3
	movs r4, #8
	ldrsh r0, [r1, r4]
	cmp r0, #2
	beq _080D40E2
	movs r0, #2
	strh r0, [r1, #8]
_080D40E2:
	ldrb r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r3
	movs r0, #1
	strh r0, [r1, #0xe]
_080D40F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D40F8: .4byte 0x03005B60
_080D40FC: .4byte 0x02039A74
	thumb_func_end ShowMapNamePopup

	thumb_func_start Task_MapNamePopUpWindow
Task_MapNamePopUpWindow: @ 0x080D4100
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080D4124
	adds r4, r1, r0
	movs r2, #8
	ldrsh r1, [r4, r2]
	adds r3, r0, #0
	cmp r1, #6
	bhi _080D41EA
	lsls r0, r1, #2
	ldr r1, _080D4128
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D4124: .4byte 0x03005B60
_080D4128: .4byte 0x080D412C
_080D412C: @ jump table
	.4byte _080D4162 @ case 0
	.4byte _080D418C @ case 1
	.4byte _080D41A4 @ case 2
	.4byte _080D41EA @ case 3
	.4byte _080D41D0 @ case 4
	.4byte _080D41E4 @ case 5
	.4byte _080D4148 @ case 6
_080D4148:
	ldrh r0, [r4, #0x10]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _080D41EA
	strh r1, [r4, #8]
	strh r1, [r4, #0x10]
	bl ShowMapNamePopUpWindow
	b _080D41EA
_080D4162:
	ldrh r0, [r4, #0xc]
	subs r0, #2
	movs r2, #0
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080D41EA
	strh r2, [r4, #0xc]
	movs r0, #1
	strh r0, [r4, #8]
	ldr r0, _080D4188
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r2, [r0, #0xa]
	b _080D41EA
	.align 2, 0
_080D4188: .4byte 0x02039A74
_080D418C:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble _080D41EA
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #2
	strh r0, [r4, #8]
	b _080D41EA
_080D41A4:
	ldrh r0, [r4, #0xc]
	adds r0, #2
	movs r1, #0
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	ble _080D41EA
	movs r0, #0x28
	strh r0, [r4, #0xc]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080D41CA
	movs r0, #6
	strh r0, [r4, #8]
	strh r1, [r4, #0x10]
	strh r1, [r4, #0xe]
	b _080D41EA
_080D41CA:
	movs r0, #4
	strh r0, [r4, #8]
	b _080D41F2
_080D41D0:
	bl GetMapNamePopUpWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl DrawStdWindowFrame
	movs r0, #5
	strh r0, [r4, #8]
	b _080D41EA
_080D41E4:
	bl HideMapNamePopUpWindow
	b _080D41F2
_080D41EA:
	ldrh r1, [r4, #0xc]
	movs r0, #0x12
	bl SetGpuReg
_080D41F2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_MapNamePopUpWindow

	thumb_func_start HideMapNamePopUpWindow
HideMapNamePopUpWindow: @ 0x080D41F8
	push {lr}
	ldr r0, _080D422C
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D4228
	bl GetMapNamePopUpWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl DrawStdWindowFrame
	bl RemoveStartMenuWindow
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	ldr r0, _080D4230
	ldrb r0, [r0]
	bl DestroyTask
_080D4228:
	pop {r0}
	bx r0
	.align 2, 0
_080D422C: .4byte 0x080D4101
_080D4230: .4byte 0x02039A74
	thumb_func_end HideMapNamePopUpWindow

	thumb_func_start ShowMapNamePopUpWindow
ShowMapNamePopUpWindow: @ 0x080D4234
	push {r4, r5, lr}
	sub sp, #0x24
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D428C
	ldr r0, _080D4258
	ldrh r1, [r0, #0x12]
	movs r0, #0xbd
	lsls r0, r0, #1
	cmp r1, r0
	bne _080D4260
	mov r4, sp
	adds r4, #0xf
	ldr r0, _080D425C
	ldr r1, [r0, #0x1c]
	b _080D4276
	.align 2, 0
_080D4258: .4byte 0x02036FB8
_080D425C: .4byte 0x0855A074
_080D4260:
	mov r4, sp
	adds r4, #0xf
	ldr r1, _080D4280
	ldr r0, _080D4284
	ldr r0, [r0]
	ldr r2, _080D4288
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
_080D4276:
	adds r0, r4, #0
	bl StringCopy
	b _080D429C
	.align 2, 0
_080D4280: .4byte 0x0855A074
_080D4284: .4byte 0x03005AF0
_080D4288: .4byte 0x00000CB2
_080D428C:
	mov r4, sp
	adds r4, #0xf
	ldr r0, _080D42F8
	ldrb r1, [r0, #0x14]
	adds r0, r4, #0
	movs r2, #0
	bl GetMapName
_080D429C:
	bl AddMapNamePopUpWindow
	bl LoadMapNamePopUpWindowBg
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0xa
	subs r4, r4, r0
	lsls r4, r4, #0x1a
	lsrs r4, r4, #0x18
	add r1, sp, #0xc
	movs r5, #0
	movs r0, #0xfc
	strb r0, [r1]
	movs r0, #2
	strb r0, [r1, #1]
	adds r0, r1, #0
	strb r5, [r0, #2]
	bl GetMapNamePopUpWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #4
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	add r2, sp, #0xc
	adds r3, r4, #0
	bl AddTextPrinterParameterized
	bl GetMapNamePopUpWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x24
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D42F8: .4byte 0x02036FB8
	thumb_func_end ShowMapNamePopUpWindow

	thumb_func_start sub_080D42FC
sub_080D42FC: @ 0x080D42FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, [sp, #0x3c]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x10]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x14]
	movs r5, #0
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r3, r2, #0x18
	str r3, [sp, #0xc]
	movs r6, #0xff
	lsls r6, r6, #0x18
	adds r6, r6, r2
	mov r8, r6
	str r0, [sp, #0x18]
	subs r4, r1, #1
_080D4338:
	ldr r0, _080D4448
	adds r1, r5, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r6, #0xe
	mov sb, r6
	str r6, [sp, #8]
	adds r0, r7, #0
	mov r6, r8
	lsrs r3, r6, #0x18
	bl FillBgTilemapBufferRect
	adds r4, #1
	adds r5, #1
	cmp r5, #0xb
	ble _080D4338
	ldr r1, _080D444C
	movs r0, #1
	rsbs r0, r0, #0
	add r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #1
	str r5, [sp]
	str r5, [sp, #4]
	mov r2, sb
	str r2, [sp, #8]
	adds r0, r7, #0
	mov r2, r8
	ldr r3, [sp, #0xc]
	bl FillBgTilemapBufferRect
	ldr r1, _080D4450
	ldr r6, [sp, #0x10]
	add r6, sl
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	mov r3, sb
	str r3, [sp, #8]
	adds r0, r7, #0
	adds r2, r6, #0
	ldr r3, [sp, #0xc]
	bl FillBgTilemapBufferRect
	ldr r1, _080D4454
	ldr r4, [sp, #0xc]
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	adds r0, r7, #0
	mov r2, r8
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	movs r1, #0x8b
	lsls r1, r1, #2
	str r5, [sp]
	str r5, [sp, #4]
	mov r2, sb
	str r2, [sp, #8]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	ldr r1, _080D4458
	ldr r4, [sp, #0xc]
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	mov r3, sb
	str r3, [sp, #8]
	adds r0, r7, #0
	mov r2, r8
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	ldr r1, _080D445C
	str r5, [sp]
	str r5, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	movs r5, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x14]
	adds r0, r1, r2
	lsls r4, r0, #0x18
	movs r6, #1
_080D440E:
	ldr r3, _080D4460
	adds r1, r5, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	subs r0, r5, #1
	ldr r3, [sp, #0x18]
	asrs r2, r3, #0x18
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r6, [sp]
	str r6, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	adds r0, r7, #0
	lsrs r3, r4, #0x18
	bl FillBgTilemapBufferRect
	adds r5, #1
	cmp r5, #0xb
	ble _080D440E
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4448: .4byte 0x0000021D
_080D444C: .4byte 0x00000229
_080D4450: .4byte 0x0000022A
_080D4454: .4byte 0x0000022B
_080D4458: .4byte 0x0000022D
_080D445C: .4byte 0x0000022E
_080D4460: .4byte 0x0000022F
	thumb_func_end sub_080D42FC

	thumb_func_start LoadMapNamePopUpWindowBg
LoadMapNamePopUpWindowBg: @ 0x080D4464
	push {r4, r5, lr}
	sub sp, #8
	bl GetMapNamePopUpWindowId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080D4488
	ldrb r1, [r0, #0x14]
	cmp r1, #0x57
	bls _080D448E
	cmp r1, #0xc4
	bls _080D448C
	adds r0, r1, #0
	subs r0, #0x6d
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _080D448E
	.align 2, 0
_080D4488: .4byte 0x02036FB8
_080D448C:
	movs r1, #0
_080D448E:
	ldr r0, _080D44D8
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r5, #0
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #6
	ldr r2, _080D44DC
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	ldr r3, _080D44E0
	bl LoadBgTiles
	ldr r1, _080D44E4
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	bl PutWindowTilemap
	ldr r0, _080D44E8
	ldrb r0, [r0, #0x16]
	cmp r0, #0xe
	bne _080D44F0
	ldr r0, _080D44EC
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	b _080D44FE
	.align 2, 0
_080D44D8: .4byte 0x08559FC0
_080D44DC: .4byte 0x08558860
_080D44E0: .4byte 0x0000021D
_080D44E4: .4byte 0x080D42FD
_080D44E8: .4byte 0x02036FB8
_080D44EC: .4byte 0x08559FA0
_080D44F0:
	lsls r0, r4, #5
	ldr r1, _080D4524
	adds r0, r0, r1
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
_080D44FE:
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #6
	ldr r0, _080D4528
	adds r1, r1, r0
	movs r0, #0x50
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl BlitBitmapToWindow
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4524: .4byte 0x08559EE0
_080D4528: .4byte 0x085571E0
	thumb_func_end LoadMapNamePopUpWindowBg

