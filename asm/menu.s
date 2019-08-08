.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitStandardTextBoxWindows
InitStandardTextBoxWindows: @ 0x08196DC4
	push {lr}
	ldr r0, _08196DDC
	bl InitWindows
	ldr r0, _08196DE0
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _08196DE4
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08196DDC: .4byte 0x085D7B28
_08196DE0: .4byte 0x0203CA58
_08196DE4: .4byte 0x0203CA59
	thumb_func_end InitStandardTextBoxWindows

	thumb_func_start FreeAllOverworldWindowBuffers
FreeAllOverworldWindowBuffers: @ 0x08196DE8
	push {lr}
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FreeAllOverworldWindowBuffers

	thumb_func_start sub_08196DF4
sub_08196DF4: @ 0x08196DF4
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	bl DeactivateAllTextPrinters
	bl sub_08196F98
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08196DF4

	thumb_func_start RunTextPrintersAndIsPrinter0Active
RunTextPrintersAndIsPrinter0Active: @ 0x08196E18
	push {lr}
	bl RunTextPrinters
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end RunTextPrintersAndIsPrinter0Active

	thumb_func_start AddTextPrinterParameterized2
AddTextPrinterParameterized2: @ 0x08196E2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r7, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	mov r8, r4
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	str r2, [sp]
	mov r2, sp
	movs r4, #0
	strb r0, [r2, #4]
	mov r0, sp
	strb r1, [r0, #5]
	strb r4, [r0, #6]
	movs r1, #2
	strb r1, [r0, #7]
	strb r4, [r0, #8]
	strb r1, [r0, #9]
	strb r4, [r0, #0xa]
	strb r4, [r0, #0xb]
	mov r4, sp
	ldrb r2, [r4, #0xc]
	subs r1, #0x12
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	mov r0, sp
	mov r2, r8
	lsls r2, r2, #4
	movs r4, #0xf
	strb r2, [r0, #0xc]
	mov r2, sp
	ands r5, r4
	ldrb r0, [r2, #0xd]
	ands r1, r0
	orrs r1, r5
	strb r1, [r2, #0xd]
	mov r0, sp
	lsrs r6, r6, #0x14
	ands r1, r4
	orrs r1, r6
	strb r1, [r0, #0xd]
	ldr r2, _08196EB4
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	mov r0, sp
	adds r1, r3, #0
	adds r2, r7, #0
	bl AddTextPrinter
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08196EB4: .4byte 0x030030B4
	thumb_func_end AddTextPrinterParameterized2

	thumb_func_start AddTextPrinterForMessage
AddTextPrinterForMessage: @ 0x08196EB8
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	ldr r3, _08196EFC
	movs r4, #1
	ands r0, r4
	ldrb r2, [r3]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	bl GetPlayerTextSpeedDelay
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _08196F00
	str r5, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08196EFC: .4byte 0x030030B4
_08196F00: .4byte 0x02021C7C
	thumb_func_end AddTextPrinterForMessage

	thumb_func_start AddTextPrinterForMessage_2
AddTextPrinterForMessage_2: @ 0x08196F04
	push {r4, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08196F48
	movs r4, #1
	ands r0, r4
	ldrb r2, [r3]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	bl GetPlayerTextSpeedDelay
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _08196F4C
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08196F48: .4byte 0x030030B4
_08196F4C: .4byte 0x02021C7C
	thumb_func_end AddTextPrinterForMessage_2

	thumb_func_start AddTextPrinterWithCustomSpeedForMessage
AddTextPrinterWithCustomSpeedForMessage: @ 0x08196F50
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r4, _08196F90
	movs r5, #1
	ands r0, r5
	ldrb r2, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	ldr r2, _08196F94
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08196F90: .4byte 0x030030B4
_08196F94: .4byte 0x02021C7C
	thumb_func_end AddTextPrinterWithCustomSpeedForMessage

	thumb_func_start sub_08196F98
sub_08196F98: @ 0x08196F98
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #0xf0
	bl LoadMessageBoxGfx
	movs r1, #0x85
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08196F98

	thumb_func_start ClearDialogWindowAndFrame
ClearDialogWindowAndFrame: @ 0x08196FB8
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08196FEC
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r5, #0
	bl PutWindowTilemap
	cmp r4, #1
	bne _08196FE6
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
_08196FE6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08196FEC: .4byte 0x081971E9
	thumb_func_end ClearDialogWindowAndFrame

	thumb_func_start ClearStdWindowAndFrame
ClearStdWindowAndFrame: @ 0x08196FF0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08197024
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r5, #0
	bl PutWindowTilemap
	cmp r4, #1
	bne _0819701E
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
_0819701E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08197024: .4byte 0x08197099
	thumb_func_end ClearStdWindowAndFrame

	thumb_func_start DrawDialogueFrame
DrawDialogueFrame: @ 0x08197028
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0819705C
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r5, #0
	bl ClearWindowTilemap
	cmp r4, #1
	bne _08197056
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
_08197056:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819705C: .4byte 0x081975E9
	thumb_func_end DrawDialogueFrame

	thumb_func_start DrawStdWindowFrame
DrawStdWindowFrame: @ 0x08197060
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08197094
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r5, #0
	bl ClearWindowTilemap
	cmp r4, #1
	bne _0819708E
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
_0819708E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08197094: .4byte 0x081975A1
	thumb_func_end DrawStdWindowFrame

	thumb_func_start WindowFunc_DrawStandardFrame
WindowFunc_DrawStandardFrame: @ 0x08197098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r2, #0
	ldr r2, [sp, #0x3c]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsls r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x10]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	movs r3, #0x85
	lsls r3, r3, #2
	lsrs r0, r1, #0x18
	str r0, [sp, #0xc]
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r2, r2, r1
	mov r8, r2
	lsrs r2, r2, #0x18
	lsrs r0, r4, #0x18
	mov sb, r0
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r4, r4, r0
	lsrs r4, r4, #0x18
	movs r5, #1
	str r5, [sp]
	str r5, [sp, #4]
	movs r6, #0xe
	str r6, [sp, #8]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	ldr r1, _081971D0
	ldr r2, [sp, #0x10]
	str r2, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0xc]
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	ldr r1, _081971D4
	ldr r3, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r3, r2
	lsls r0, r0, #0x18
	mov sl, r0
	lsrs r2, r0, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	adds r0, r7, #0
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	mov r5, sb
	ldr r0, [sp, #0x14]
	add r0, sb
	cmp sb, r0
	bge _0819716C
	mov r3, r8
	str r3, [sp, #0x18]
	movs r6, #1
	movs r0, #0xe
	mov r8, r0
_08197132:
	lsls r4, r5, #0x18
	lsrs r4, r4, #0x18
	str r6, [sp]
	str r6, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r7, #0
	ldr r1, _081971D8
	ldr r3, [sp, #0x18]
	lsrs r2, r3, #0x18
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	str r6, [sp]
	str r6, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r7, #0
	ldr r1, _081971DC
	mov r3, sl
	lsrs r2, r3, #0x18
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	adds r5, #1
	ldr r0, [sp, #0x14]
	add r0, sb
	cmp r5, r0
	blt _08197132
_0819716C:
	ldr r1, _081971E0
	ldr r2, [sp, #0xc]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, [sp, #0x14]
	add r4, sb
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #1
	str r5, [sp]
	str r5, [sp, #4]
	movs r6, #0xe
	str r6, [sp, #8]
	adds r0, r7, #0
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	ldr r1, _081971E4
	ldr r0, [sp, #0x10]
	str r0, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0xc]
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	movs r1, #0x87
	lsls r1, r1, #2
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r2, r3, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	adds r0, r7, #0
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081971D0: .4byte 0x00000215
_081971D4: .4byte 0x00000216
_081971D8: .4byte 0x00000217
_081971DC: .4byte 0x00000219
_081971E0: .4byte 0x0000021A
_081971E4: .4byte 0x0000021B
	thumb_func_end WindowFunc_DrawStandardFrame

	thumb_func_start WindowFunc_DrawDialogueFrame
WindowFunc_DrawDialogueFrame: @ 0x081971E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r6, r0, #0
	adds r5, r2, #0
	ldr r4, [sp, #0x50]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r2, r1, #0x18
	lsls r5, r5, #0x18
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r1, _08197544
	lsrs r0, r2, #0x18
	str r0, [sp, #0xc]
	movs r0, #0xfd
	lsls r0, r0, #0x18
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	str r2, [sp, #0x18]
	lsrs r2, r5, #0x18
	mov sl, r2
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r5, r5, r0
	lsrs r5, r5, #0x18
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r2, #0xf
	mov r8, r2
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x18]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197548
	mov sb, r0
	ldr r0, [sp, #0xc]
	subs r0, #2
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x1c]
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	mov r1, sb
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _0819754C
	ldr r0, [sp, #0xc]
	subs r0, #1
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x20]
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	movs r1, #0x81
	lsls r1, r1, #2
	ldr r2, [sp, #0x10]
	str r2, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0xc]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _08197550
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r7, r2, r0
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x24]
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	adds r0, r7, #1
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x28]
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r1, sb
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _08197554
	adds r0, r7, #2
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x2c]
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x2c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r7, _08197558
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, [sp, #0x18]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r5, _0819755C
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x1c]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r1, _08197560
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x20]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r2, [sp, #0x10]
	str r2, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r1, _08197564
	ldr r2, [sp, #0xc]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r1, _08197568
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x24]
	mov r3, sl
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x28]
	mov r3, sl
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r1, _0819756C
	ldr r2, [sp, #0x2c]
	mov r3, sl
	bl FillBgTilemapBufferRect
	mov r5, sl
	adds r5, #1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r4, [sp]
	movs r0, #2
	mov sb, r0
	str r0, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, [sp, #0x18]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	adds r7, #1
	str r4, [sp]
	mov r0, sb
	str r0, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r0, [sp, #0x10]
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	str r0, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r1, _08197564
	ldr r2, [sp, #0x20]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	mov r0, sb
	str r0, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, [sp, #0x28]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	mov r0, sb
	str r0, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r1, _0819756C
	ldr r2, [sp, #0x2c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _08197570
	ldr r0, [sp, #0x14]
	add sl, r0
	mov r5, sl
	subs r5, #1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x18]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197574
	mov sb, r0
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	mov r1, sb
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _08197578
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x20]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _0819757C
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0xc]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _08197580
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	mov r1, sb
	ldr r2, [sp, #0x28]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _08197584
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x2c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r1, _08197588
	mov r2, sl
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x18]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r5, _0819758C
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x1c]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r1, _08197590
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x20]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r1, _08197594
	ldr r2, [sp, #0x10]
	str r2, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0xc]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r1, _08197598
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x24]
	mov r3, sl
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x28]
	mov r3, sl
	bl FillBgTilemapBufferRect
	ldr r1, _0819759C
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r0, r6, #0
	ldr r2, [sp, #0x2c]
	mov r3, sl
	bl FillBgTilemapBufferRect
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08197544: .4byte 0x00000201
_08197548: .4byte 0x00000202
_0819754C: .4byte 0x00000203
_08197550: .4byte 0x00000205
_08197554: .4byte 0x00000206
_08197558: .4byte 0x00000207
_0819755C: .4byte 0x0000020D
_08197560: .4byte 0x0000020B
_08197564: .4byte 0x00000209
_08197568: .4byte 0x0000060B
_0819756C: .4byte 0x0000020A
_08197570: .4byte 0x00000A07
_08197574: .4byte 0x00000A0D
_08197578: .4byte 0x00000A0B
_0819757C: .4byte 0x00000A09
_08197580: .4byte 0x00000E0B
_08197584: .4byte 0x00000A0A
_08197588: .4byte 0x00000A01
_0819758C: .4byte 0x00000A02
_08197590: .4byte 0x00000A03
_08197594: .4byte 0x00000A04
_08197598: .4byte 0x00000A05
_0819759C: .4byte 0x00000A06
	thumb_func_end WindowFunc_DrawDialogueFrame

	thumb_func_start WindowFunc_ClearStdWindowAndFrame
WindowFunc_ClearStdWindowAndFrame: @ 0x081975A0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsls r5, r5, #0x18
	lsls r3, r3, #0x18
	lsls r1, r1, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r4, r4, r2
	lsrs r4, r4, #0x18
	adds r5, r5, r2
	lsrs r5, r5, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r3, r3, r2
	lsrs r3, r3, #0x18
	str r3, [sp]
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end WindowFunc_ClearStdWindowAndFrame

	thumb_func_start WindowFunc_ClearDialogWindowAndFrame
WindowFunc_ClearDialogWindowAndFrame: @ 0x081975E8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsls r5, r5, #0x18
	lsls r3, r3, #0x18
	lsls r1, r1, #0x18
	movs r2, #0xfd
	lsls r2, r2, #0x18
	adds r4, r4, r2
	lsrs r4, r4, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r5, r5, r2
	lsrs r5, r5, #0x18
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r3, r3, r2
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end WindowFunc_ClearDialogWindowAndFrame

	thumb_func_start SetStandardWindowBorderStyle
SetStandardWindowBorderStyle: @ 0x08197638
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x85
	lsls r2, r2, #2
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	pop {r0}
	bx r0
	thumb_func_end SetStandardWindowBorderStyle

	thumb_func_start sub_08197650
sub_08197650: @ 0x08197650
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xf0
	bl LoadMessageBoxGfx
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0xf
	bl DrawDialogFrameWithCustomTileAndPalette
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08197650

	thumb_func_start sub_08197680
sub_08197680: @ 0x08197680
	push {lr}
	ldr r0, _08197690
	movs r1, #0xe0
	movs r2, #0x14
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08197690: .4byte 0x085D7B04
	thumb_func_end sub_08197680

	thumb_func_start Menu_LoadStdPalAt
Menu_LoadStdPalAt: @ 0x08197694
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _081976A8
	movs r2, #0x14
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_081976A8: .4byte 0x085D7B04
	thumb_func_end Menu_LoadStdPalAt

	thumb_func_start sub_081976AC
sub_081976AC: @ 0x081976AC
	ldr r0, _081976B0
	bx lr
	.align 2, 0
_081976B0: .4byte 0x085D7B04
	thumb_func_end sub_081976AC

	thumb_func_start sub_081976B4
sub_081976B4: @ 0x081976B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _081976C0
	movs r1, #0
_081976C0:
	ldr r0, _081976CC
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_081976CC: .4byte 0x085D7B04
	thumb_func_end sub_081976B4

	thumb_func_start DisplayItemMessageOnField
DisplayItemMessageOnField: @ 0x081976D0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_08196F98
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	str r6, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0xf
	bl DisplayMessageAndContinueTask
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DisplayItemMessageOnField

	thumb_func_start DisplayYesNoMenuDefaultYes
DisplayYesNoMenuDefaultYes: @ 0x08197714
	push {lr}
	sub sp, #0xc
	ldr r0, _08197738
	movs r1, #0x85
	lsls r1, r1, #2
	str r1, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_08198C08
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08197738: .4byte 0x085D7B38
	thumb_func_end DisplayYesNoMenuDefaultYes

	thumb_func_start DisplayYesNoMenuWithDefault
DisplayYesNoMenuWithDefault: @ 0x0819773C
	push {lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08197764
	movs r1, #0x85
	lsls r1, r1, #2
	str r1, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_08198C08
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08197764: .4byte 0x085D7B38
	thumb_func_end DisplayYesNoMenuWithDefault

	thumb_func_start GetPlayerTextSpeed
GetPlayerTextSpeed: @ 0x08197768
	push {lr}
	ldr r0, _08197784
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0819778C
	ldr r0, _08197788
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	b _0819778E
	.align 2, 0
_08197784: .4byte 0x030030B4
_08197788: .4byte 0x03005AF0
_0819778C:
	movs r0, #1
_0819778E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPlayerTextSpeed

	thumb_func_start GetPlayerTextSpeedDelay
GetPlayerTextSpeedDelay: @ 0x08197794
	push {lr}
	ldr r0, _081977C0
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #2
	bls _081977B0
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x14]
_081977B0:
	bl GetPlayerTextSpeed
	ldr r1, _081977C4
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081977C0: .4byte 0x03005AF0
_081977C4: .4byte 0x085D7B24
	thumb_func_end GetPlayerTextSpeedDelay

	thumb_func_start sub_081977C8
sub_081977C8: @ 0x081977C8
	push {r4, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r4, _08197808
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _081977FC
	lsls r0, r1, #0x19
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #0xad
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x17
	movs r2, #1
	movs r3, #6
	bl sub_08198BB4
	strb r0, [r4]
_081977FC:
	ldrb r0, [r4]
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08197808: .4byte 0x0203CA58
	thumb_func_end sub_081977C8

	thumb_func_start GetStartMenuWindowId
GetStartMenuWindowId: @ 0x0819780C
	ldr r0, _08197814
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08197814: .4byte 0x0203CA58
	thumb_func_end GetStartMenuWindowId

	thumb_func_start RemoveMapNamePopUpWindow
RemoveMapNamePopUpWindow: @ 0x08197818
	push {r4, lr}
	ldr r4, _08197830
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0819782A
	bl RemoveWindow
	movs r0, #0xff
	strb r0, [r4]
_0819782A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08197830: .4byte 0x0203CA58
	thumb_func_end RemoveMapNamePopUpWindow

	thumb_func_start sub_08197834
sub_08197834: @ 0x08197834
	movs r0, #0x80
	lsls r0, r0, #2
	bx lr
	.align 2, 0
	thumb_func_end sub_08197834

	thumb_func_start sub_0819783C
sub_0819783C: @ 0x0819783C
	movs r0, #0x85
	lsls r0, r0, #2
	bx lr
	.align 2, 0
	thumb_func_end sub_0819783C

	thumb_func_start AddMapNamePopUpWindow
AddMapNamePopUpWindow: @ 0x08197844
	push {r4, lr}
	sub sp, #0xc
	ldr r4, _08197878
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _0819786C
	movs r0, #3
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0x94
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0xa
	bl sub_08198BB4
	strb r0, [r4]
_0819786C:
	ldrb r0, [r4]
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08197878: .4byte 0x0203CA59
	thumb_func_end AddMapNamePopUpWindow

	thumb_func_start GetMapNamePopUpWindowId
GetMapNamePopUpWindowId: @ 0x0819787C
	ldr r0, _08197884
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08197884: .4byte 0x0203CA59
	thumb_func_end GetMapNamePopUpWindowId

	thumb_func_start RemoveStartMenuWindow
RemoveStartMenuWindow: @ 0x08197888
	push {r4, lr}
	ldr r4, _081978A0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0819789A
	bl RemoveWindow
	movs r0, #0xff
	strb r0, [r4]
_0819789A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081978A0: .4byte 0x0203CA59
	thumb_func_end RemoveStartMenuWindow

	thumb_func_start AddTextPrinterWithCallbackForMessage
AddTextPrinterWithCallbackForMessage: @ 0x081978A4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _081978E8
	movs r4, #1
	ands r0, r4
	ldrb r2, [r3]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	bl GetPlayerTextSpeedDelay
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _081978EC
	str r5, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081978E8: .4byte 0x030030B4
_081978EC: .4byte 0x02021C7C
	thumb_func_end AddTextPrinterWithCallbackForMessage

	thumb_func_start sub_081978F0
sub_081978F0: @ 0x081978F0
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	cmp r4, #1
	bne _0819791A
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_0819791A:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081978F0

	thumb_func_start DrawDialogFrameWithCustomTileAndPalette
DrawDialogFrameWithCustomTileAndPalette: @ 0x08197924
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08197960
	strh r2, [r0]
	ldr r0, _08197964
	strb r3, [r0]
	ldr r1, _08197968
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r5, #0
	bl PutWindowTilemap
	cmp r4, #1
	bne _0819795A
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
_0819795A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08197960: .4byte 0x0203CA68
_08197964: .4byte 0x0203CA6A
_08197968: .4byte 0x081979BD
	thumb_func_end DrawDialogFrameWithCustomTileAndPalette

	thumb_func_start DrawDialogFrameWithCustomTile
DrawDialogFrameWithCustomTile: @ 0x0819796C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081979B0
	strh r2, [r0]
	ldr r5, _081979B4
	adds r0, r6, #0
	movs r1, #5
	bl GetWindowAttribute
	strb r0, [r5]
	ldr r1, _081979B8
	adds r0, r6, #0
	bl CallWindowFunction
	adds r0, r6, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r6, #0
	bl PutWindowTilemap
	cmp r4, #1
	bne _081979AA
	adds r0, r6, #0
	movs r1, #3
	bl CopyWindowToVram
_081979AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081979B0: .4byte 0x0203CA68
_081979B4: .4byte 0x0203CA6A
_081979B8: .4byte 0x081979BD
	thumb_func_end DrawDialogFrameWithCustomTile

	thumb_func_start WindowFunc_DrawDialogFrameWithCustomTileAndPalette
WindowFunc_DrawDialogFrameWithCustomTileAndPalette: @ 0x081979BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov r8, r0
	adds r5, r2, #0
	ldr r4, [sp, #0x50]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r2, r1, #0x18
	lsls r5, r5, #0x18
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r1, _08197DD0
	mov sl, r1
	ldrh r1, [r1]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r0, r2, #0x18
	str r0, [sp, #0xc]
	movs r0, #0xfd
	lsls r0, r0, #0x18
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	str r2, [sp, #0x18]
	lsrs r7, r5, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r5, r5, r2
	lsrs r5, r5, #0x18
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	ldr r0, _08197DD4
	mov sb, r0
	ldrb r0, [r0]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x18]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r2, sl
	ldrh r1, [r2]
	adds r1, #2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0xc]
	subs r0, #2
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x1c]
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0xc]
	subs r0, #1
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x20]
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x20]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [sp, #0x10]
	str r2, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0xc]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r6, r2, r0
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x24]
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #1
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x28]
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x28]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #2
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x2c]
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x2c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x18]
	adds r3, r7, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #0xd
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x1c]
	adds r3, r7, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #0xb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x20]
	adds r3, r7, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #9
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [sp, #0x10]
	str r2, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0xc]
	adds r3, r7, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DD8
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x24]
	adds r3, r7, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #0xd
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x28]
	adds r3, r7, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #0xa
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x2c]
	adds r3, r7, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r5, r7, #1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r4, [sp]
	movs r6, #2
	str r6, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x18]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r6, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #9
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x10]
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r6, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x20]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r6, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x28]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r1, [r0]
	adds r1, #0xa
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r6, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x2c]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DDC
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x14]
	adds r7, r7, r0
	subs r6, r7, #1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x18]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DE0
	adds r5, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r5, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x1c]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DE4
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x20]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DE8
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0xc]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DEC
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x24]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r0, [r0]
	adds r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r1, sb
	ldrb r0, [r1]
	str r0, [sp, #8]
	mov r0, r8
	adds r1, r5, #0
	ldr r2, [sp, #0x28]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r2, _08197DF0
	adds r1, r2, #0
	mov r0, sl
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x2c]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DF4
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	lsrs r6, r3, #0x18
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x18]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DF8
	adds r5, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r5, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x1c]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197DFC
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	b _08197E00
	.align 2, 0
_08197DD0: .4byte 0x0203CA68
_08197DD4: .4byte 0x0203CA6A
_08197DD8: .4byte 0x0000040B
_08197DDC: .4byte 0x00000807
_08197DE0: .4byte 0x0000080D
_08197DE4: .4byte 0x0000080B
_08197DE8: .4byte 0x00000809
_08197DEC: .4byte 0x00000C0B
_08197DF0: .4byte 0x0000080A
_08197DF4: .4byte 0x00000801
_08197DF8: .4byte 0x00000802
_08197DFC: .4byte 0x00000803
_08197E00:
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x20]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197EB0
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x10]
	str r0, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0xc]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r0, _08197EB4
	adds r1, r0, #0
	mov r2, sl
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x24]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	mov r0, sl
	ldrh r0, [r0]
	adds r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r1, sb
	ldrb r0, [r1]
	str r0, [sp, #8]
	mov r0, r8
	adds r1, r5, #0
	ldr r2, [sp, #0x28]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	ldr r2, _08197EB8
	adds r1, r2, #0
	mov r0, sl
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r4, [sp]
	str r4, [sp, #4]
	mov r2, sb
	ldrb r0, [r2]
	str r0, [sp, #8]
	mov r0, r8
	ldr r2, [sp, #0x2c]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08197EB0: .4byte 0x00000804
_08197EB4: .4byte 0x00000805
_08197EB8: .4byte 0x00000806
	thumb_func_end WindowFunc_DrawDialogFrameWithCustomTileAndPalette

	thumb_func_start ClearDialogWindowAndFrameToTransparent
ClearDialogWindowAndFrameToTransparent: @ 0x08197EBC
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08197EF0
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r5, #0
	bl ClearWindowTilemap
	cmp r4, #1
	bne _08197EEA
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
_08197EEA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08197EF0: .4byte 0x08197EF5
	thumb_func_end ClearDialogWindowAndFrameToTransparent

	thumb_func_start WindowFunc_ClearDialogWindowAndFrameNullPalette
WindowFunc_ClearDialogWindowAndFrameNullPalette: @ 0x08197EF4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsls r5, r5, #0x18
	lsls r3, r3, #0x18
	lsls r1, r1, #0x18
	movs r2, #0xfd
	lsls r2, r2, #0x18
	adds r4, r4, r2
	lsrs r4, r4, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r5, r5, r2
	lsrs r5, r5, #0x18
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r3, r3, r2
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	adds r2, r4, #0
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WindowFunc_ClearDialogWindowAndFrameNullPalette

	thumb_func_start DrawStdFrameWithCustomTileAndPalette
DrawStdFrameWithCustomTileAndPalette: @ 0x08197F44
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08197F80
	strh r2, [r0]
	ldr r0, _08197F84
	strb r3, [r0]
	ldr r1, _08197F88
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r5, #0
	bl PutWindowTilemap
	cmp r4, #1
	bne _08197F7A
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
_08197F7A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08197F80: .4byte 0x0203CA68
_08197F84: .4byte 0x0203CA6A
_08197F88: .4byte 0x08197FDD
	thumb_func_end DrawStdFrameWithCustomTileAndPalette

	thumb_func_start DrawStdFrameWithCustomTile
DrawStdFrameWithCustomTile: @ 0x08197F8C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08197FD0
	strh r2, [r0]
	ldr r5, _08197FD4
	adds r0, r6, #0
	movs r1, #5
	bl GetWindowAttribute
	strb r0, [r5]
	ldr r1, _08197FD8
	adds r0, r6, #0
	bl CallWindowFunction
	adds r0, r6, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r6, #0
	bl PutWindowTilemap
	cmp r4, #1
	bne _08197FCA
	adds r0, r6, #0
	movs r1, #3
	bl CopyWindowToVram
_08197FCA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08197FD0: .4byte 0x0203CA68
_08197FD4: .4byte 0x0203CA6A
_08197FD8: .4byte 0x08197FDD
	thumb_func_end DrawStdFrameWithCustomTile

	thumb_func_start WindowFunc_DrawStdFrameWithCustomTileAndPalette
WindowFunc_DrawStdFrameWithCustomTileAndPalette: @ 0x08197FDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x38]
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r6, r6, #0x18
	lsls r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r2, _0819812C
	ldrh r1, [r2]
	lsrs r0, r6, #0x18
	str r0, [sp, #0xc]
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r6, r6, r2
	lsrs r6, r6, #0x18
	lsrs r0, r4, #0x18
	mov r8, r0
	adds r4, r4, r2
	lsrs r4, r4, #0x18
	movs r5, #1
	str r5, [sp]
	str r5, [sp, #4]
	ldr r7, _08198130
	ldrb r0, [r7]
	str r0, [sp, #8]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	ldr r2, _0819812C
	ldrh r1, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x10]
	str r0, [sp]
	str r5, [sp, #4]
	ldrb r0, [r7]
	str r0, [sp, #8]
	mov r0, sb
	ldr r2, [sp, #0xc]
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	ldr r2, _0819812C
	ldrh r1, [r2]
	adds r1, #2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r7]
	str r0, [sp, #8]
	mov r0, sb
	mov r2, sl
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	ldr r0, _0819812C
	ldrh r1, [r0]
	adds r1, #3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r5, [sp]
	ldr r2, [sp, #0x14]
	str r2, [sp, #4]
	ldrb r0, [r7]
	str r0, [sp, #8]
	mov r0, sb
	adds r2, r6, #0
	mov r3, r8
	bl FillBgTilemapBufferRect
	ldr r0, _0819812C
	ldrh r1, [r0]
	adds r1, #5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r5, [sp]
	ldr r2, [sp, #0x14]
	str r2, [sp, #4]
	ldrb r0, [r7]
	str r0, [sp, #8]
	mov r0, sb
	mov r2, sl
	mov r3, r8
	bl FillBgTilemapBufferRect
	ldr r0, _0819812C
	ldrh r1, [r0]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [sp, #0x14]
	add r8, r2
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r7]
	str r0, [sp, #8]
	mov r0, sb
	adds r2, r6, #0
	mov r3, r8
	bl FillBgTilemapBufferRect
	ldr r2, _0819812C
	ldrh r1, [r2]
	adds r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x10]
	str r0, [sp]
	str r5, [sp, #4]
	ldrb r0, [r7]
	str r0, [sp, #8]
	mov r0, sb
	ldr r2, [sp, #0xc]
	mov r3, r8
	bl FillBgTilemapBufferRect
	ldr r2, _0819812C
	ldrh r1, [r2]
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r7]
	str r0, [sp, #8]
	mov r0, sb
	mov r2, sl
	mov r3, r8
	bl FillBgTilemapBufferRect
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819812C: .4byte 0x0203CA68
_08198130: .4byte 0x0203CA6A
	thumb_func_end WindowFunc_DrawStdFrameWithCustomTileAndPalette

	thumb_func_start ClearStdWindowAndFrameToTransparent
ClearStdWindowAndFrameToTransparent: @ 0x08198134
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08198168
	adds r0, r5, #0
	bl CallWindowFunction
	adds r0, r5, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r5, #0
	bl ClearWindowTilemap
	cmp r4, #1
	bne _08198162
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
_08198162:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08198168: .4byte 0x0819816D
	thumb_func_end ClearStdWindowAndFrameToTransparent

	thumb_func_start WindowFunc_ClearStdWindowAndFrameToTransparent
WindowFunc_ClearStdWindowAndFrameToTransparent: @ 0x0819816C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsls r5, r5, #0x18
	lsls r3, r3, #0x18
	lsls r1, r1, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r4, r4, r2
	lsrs r4, r4, #0x18
	adds r5, r5, r2
	lsrs r5, r5, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r3, r3, r2
	lsrs r3, r3, #0x18
	str r3, [sp]
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	adds r2, r4, #0
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WindowFunc_ClearStdWindowAndFrameToTransparent

	thumb_func_start sub_081981B4
sub_081981B4: @ 0x081981B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	cmp r6, #3
	bls _081981EA
	movs r1, #0
	mov r0, sp
	strb r1, [r0]
	b _081981EE
_081981EA:
	mov r0, sp
	strb r6, [r0]
_081981EE:
	mov r1, sp
	mov r0, r8
	strb r0, [r1, #2]
	movs r0, #2
	strb r0, [r1, #4]
	movs r0, #0x1e
	subs r0, r0, r7
	strb r0, [r1, #1]
	strb r7, [r1, #3]
	strb r5, [r1, #5]
	strh r4, [r1, #6]
	ldr r4, _08198218
	mov r0, sp
	bl AddWindow
	strb r0, [r4]
	cmp r5, #0xf
	bls _0819821C
	movs r5, #0xf0
	b _08198220
	.align 2, 0
_08198218: .4byte 0x0203CA6C
_0819821C:
	lsls r0, r5, #0x1c
	lsrs r5, r0, #0x18
_08198220:
	ldr r0, _0819823C
	adds r1, r5, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08198240
	ldrb r0, [r0]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0819823C: .4byte 0x085D7B48
_08198240: .4byte 0x0203CA6C
	thumb_func_end sub_081981B4

	thumb_func_start sub_08198244
sub_08198244: @ 0x08198244
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r5, #0
	ldr r4, _081982E0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _081982D4
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #0xff
	bl FillWindowPixelBuffer
	adds r0, r6, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	lsls r7, r7, #0x18
	cmp r5, r4
	bhs _08198298
_08198280:
	adds r0, r6, r5
	ldrb r0, [r0]
	cmp r0, #0xf8
	bne _0819828E
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0819828E:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r1
	blo _08198280
_08198298:
	lsls r0, r4, #0x13
	lsrs r4, r0, #0x10
	ldr r5, _081982E0
	ldrb r0, [r5]
	movs r1, #1
	bl GetWindowAttribute
	movs r2, #0xec
	mov r1, r8
	subs r2, r2, r1
	lsls r0, r0, #3
	subs r2, r2, r0
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r5]
	ldr r1, _081982E4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r3, #1
	bl AddTextPrinterParameterized3
	cmp r7, #0
	beq _081982D4
	ldrb r0, [r5]
	movs r1, #3
	bl CopyWindowToVram
_081982D4:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081982E0: .4byte 0x0203CA6C
_081982E4: .4byte 0x085D7B68
	thumb_func_end sub_08198244

	thumb_func_start sub_081982E8
sub_081982E8: @ 0x081982E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	mov sb, r0
	adds r6, r1, #0
	ldr r0, [sp, #0x34]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r5, #0
	ldr r0, _0819831C
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _081983C8
	cmp r2, #0
	beq _08198320
	add r0, sp, #0x14
	strb r5, [r0]
	adds r1, r0, #0
	b _08198326
	.align 2, 0
_0819831C: .4byte 0x0203CA6C
_08198320:
	add r1, sp, #0x14
	movs r0, #0xf
	strb r0, [r1]
_08198326:
	movs r0, #1
	strb r0, [r1, #1]
	movs r0, #2
	strb r0, [r1, #2]
	ldr r4, _081983D8
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #0xff
	bl FillWindowPixelBuffer
	lsls r7, r7, #0x18
	cmp r6, #0
	beq _0819839E
	adds r0, r6, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r2, r5, #0
	movs r1, #0
	cmp r1, r5
	bhs _0819836E
_08198356:
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xf8
	bne _08198364
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08198364:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	blo _08198356
_0819836E:
	lsls r0, r5, #0x13
	lsrs r5, r0, #0x10
	ldr r4, _081983D8
	ldrb r0, [r4]
	movs r1, #1
	bl GetWindowAttribute
	movs r2, #0xec
	mov r1, r8
	subs r2, r2, r1
	lsls r0, r0, #3
	subs r2, r2, r0
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4]
	add r1, sp, #0x14
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r3, #1
	bl AddTextPrinterParameterized3
_0819839E:
	ldr r4, _081983D8
	ldrb r0, [r4]
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r2, sp, #0x14
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	mov r1, sb
	str r1, [sp, #0x10]
	movs r1, #1
	movs r2, #4
	movs r3, #1
	bl AddTextPrinterParameterized4
	cmp r7, #0
	beq _081983C8
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
_081983C8:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081983D8: .4byte 0x0203CA6C
	thumb_func_end sub_081982E8

	thumb_func_start sub_081983DC
sub_081983DC: @ 0x081983DC
	push {lr}
	ldr r1, _081983F0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081983EC
	movs r1, #3
	bl CopyWindowToVram
_081983EC:
	pop {r0}
	bx r0
	.align 2, 0
_081983F0: .4byte 0x0203CA6C
	thumb_func_end sub_081983DC

	thumb_func_start sub_081983F4
sub_081983F4: @ 0x081983F4
	push {r4, lr}
	ldr r4, _08198414
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0819840C
	movs r1, #0xff
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
_0819840C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08198414: .4byte 0x0203CA6C
	thumb_func_end sub_081983F4

	thumb_func_start sub_08198418
sub_08198418: @ 0x08198418
	push {r4, lr}
	ldr r4, _08198448
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08198440
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #0xff
	strb r0, [r4]
_08198440:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08198448: .4byte 0x0203CA6C
	thumb_func_end sub_08198418

	thumb_func_start sub_0819844C
sub_0819844C: @ 0x0819844C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, #0x18]
	mov r8, r4
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	ldr r6, [sp, #0x24]
	mov ip, r6
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r7, r5, #0x18
	ldr r5, _08198490
	movs r6, #0
	strb r2, [r5]
	strb r3, [r5, #1]
	strb r6, [r5, #3]
	subs r4, #1
	strb r4, [r5, #4]
	strb r0, [r5, #5]
	strb r1, [r5, #6]
	mov r0, r8
	strb r0, [r5, #8]
	mov r4, ip
	strb r4, [r5, #0xb]
	cmp r7, #0
	blt _0819848C
	movs r0, #4
	ldrsb r0, [r5, r0]
	cmp r7, r0
	ble _08198494
_0819848C:
	strb r6, [r5, #2]
	b _08198496
	.align 2, 0
_08198490: .4byte 0x0203CA5C
_08198494:
	strb r7, [r5, #2]
_08198496:
	movs r0, #0
	bl Menu_MoveCursor
	ldr r0, _081984AC
	ldrb r0, [r0, #2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081984AC: .4byte 0x0203CA5C
	thumb_func_end sub_0819844C

	thumb_func_start sub_081984B0
sub_081984B0: @ 0x081984B0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	bl sub_0819844C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081984B0

	thumb_func_start sub_081984F0
sub_081984F0: @ 0x081984F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	mov r8, r0
	adds r6, r1, #0
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	movs r1, #1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl GetMenuCursorDimensionByFont
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	mov r0, r8
	adds r1, r6, #0
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	bl sub_081984B0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081984F0

	thumb_func_start RedrawMenuCursor
RedrawMenuCursor: @ 0x0819854C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _081985E0
	add r0, sp, #0xc
	movs r2, #2
	bl memcpy
	ldr r4, _081985E4
	ldrb r0, [r4, #6]
	movs r1, #0
	bl GetMenuCursorDimensionByFont
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r0, [r4, #6]
	movs r1, #1
	bl GetMenuCursorDimensionByFont
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4, #5]
	mov sb, r1
	ldrb r2, [r4]
	ldrb r1, [r4, #8]
	adds r3, r1, #0
	muls r3, r6, r3
	ldrb r1, [r4, #1]
	adds r3, r3, r1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, sb
	movs r1, #0x11
	bl FillWindowPixelRect
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #6]
	ldrb r3, [r4]
	ldrb r2, [r4, #8]
	mov r5, r8
	muls r5, r2, r5
	adds r2, r5, #0
	ldrb r4, [r4, #1]
	adds r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	add r2, sp, #0xc
	bl AddTextPrinterParameterized
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081985E0: .4byte 0x085D7B6C
_081985E4: .4byte 0x0203CA5C
	thumb_func_end RedrawMenuCursor

	thumb_func_start Menu_MoveCursor
Menu_MoveCursor: @ 0x081985E8
	push {r4, r5, lr}
	ldr r1, _08198608
	ldrb r5, [r1, #2]
	movs r2, #2
	ldrsb r2, [r1, r2]
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	adds r2, r2, r3
	movs r0, #3
	ldrsb r0, [r1, r0]
	adds r4, r1, #0
	cmp r2, r0
	bge _0819860C
	ldrb r0, [r4, #4]
	b _0819861A
	.align 2, 0
_08198608: .4byte 0x0203CA5C
_0819860C:
	movs r0, #4
	ldrsb r0, [r4, r0]
	cmp r2, r0
	ble _08198618
	ldrb r0, [r4, #3]
	b _0819861A
_08198618:
	adds r0, r3, r5
_0819861A:
	strb r0, [r4, #2]
	ldrb r1, [r4, #2]
	adds r0, r5, #0
	bl RedrawMenuCursor
	ldrb r0, [r4, #2]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end Menu_MoveCursor

	thumb_func_start Menu_MoveCursorNoWrapAround
Menu_MoveCursorNoWrapAround: @ 0x0819862C
	push {r4, r5, lr}
	ldr r1, _0819864C
	ldrb r5, [r1, #2]
	movs r2, #2
	ldrsb r2, [r1, r2]
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	adds r2, r2, r3
	movs r0, #3
	ldrsb r0, [r1, r0]
	adds r4, r1, #0
	cmp r2, r0
	bge _08198650
	ldrb r0, [r4, #3]
	b _0819865E
	.align 2, 0
_0819864C: .4byte 0x0203CA5C
_08198650:
	movs r0, #4
	ldrsb r0, [r4, r0]
	cmp r2, r0
	ble _0819865C
	ldrb r0, [r4, #4]
	b _0819865E
_0819865C:
	adds r0, r3, r5
_0819865E:
	strb r0, [r4, #2]
	ldrb r1, [r4, #2]
	adds r0, r5, #0
	bl RedrawMenuCursor
	ldrb r0, [r4, #2]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end Menu_MoveCursorNoWrapAround

	thumb_func_start Menu_GetCursorPos
Menu_GetCursorPos: @ 0x08198670
	ldr r0, _08198678
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_08198678: .4byte 0x0203CA5C
	thumb_func_end Menu_GetCursorPos

	thumb_func_start Menu_ProcessInput
Menu_ProcessInput: @ 0x0819867C
	push {r4, lr}
	ldr r0, _081986A0
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081986A8
	ldr r4, _081986A4
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _08198698
	movs r0, #5
	bl PlaySE
_08198698:
	movs r0, #2
	ldrsb r0, [r4, r0]
	b _081986E2
	.align 2, 0
_081986A0: .4byte 0x03002360
_081986A4: .4byte 0x0203CA5C
_081986A8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081986B6
	movs r0, #1
	rsbs r0, r0, #0
	b _081986E2
_081986B6:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081986CA
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	b _081986DA
_081986CA:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081986DE
	movs r0, #5
	bl PlaySE
	movs r0, #1
_081986DA:
	bl Menu_MoveCursor
_081986DE:
	movs r0, #2
	rsbs r0, r0, #0
_081986E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Menu_ProcessInput

	thumb_func_start Menu_ProcessInputNoWrap
Menu_ProcessInputNoWrap: @ 0x081986E8
	push {r4, r5, r6, lr}
	ldr r4, _08198710
	ldrb r5, [r4, #2]
	adds r6, r5, #0
	ldr r0, _08198714
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08198718
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _08198708
	movs r0, #5
	bl PlaySE
_08198708:
	movs r0, #2
	ldrsb r0, [r4, r0]
	b _08198760
	.align 2, 0
_08198710: .4byte 0x0203CA5C
_08198714: .4byte 0x03002360
_08198718:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08198726
	movs r0, #1
	rsbs r0, r0, #0
	b _08198760
_08198726:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08198740
	movs r0, #1
	rsbs r0, r0, #0
	bl Menu_MoveCursorNoWrapAround
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _0819875C
	b _08198756
_08198740:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0819875C
	movs r0, #1
	bl Menu_MoveCursorNoWrapAround
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	beq _0819875C
_08198756:
	movs r0, #5
	bl PlaySE
_0819875C:
	movs r0, #2
	rsbs r0, r0, #0
_08198760:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Menu_ProcessInputNoWrap

	thumb_func_start ProcessMenuInput_other
ProcessMenuInput_other: @ 0x08198768
	push {r4, lr}
	ldr r2, _0819878C
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08198794
	ldr r4, _08198790
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _08198784
	movs r0, #5
	bl PlaySE
_08198784:
	movs r0, #2
	ldrsb r0, [r4, r0]
	b _081987CC
	.align 2, 0
_0819878C: .4byte 0x03002360
_08198790: .4byte 0x0203CA5C
_08198794:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081987A2
	movs r0, #1
	rsbs r0, r0, #0
	b _081987CC
_081987A2:
	ldrh r0, [r2, #0x30]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0x40
	bne _081987B8
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	b _081987C4
_081987B8:
	cmp r1, #0x80
	bne _081987C8
	movs r0, #5
	bl PlaySE
	movs r0, #1
_081987C4:
	bl Menu_MoveCursor
_081987C8:
	movs r0, #2
	rsbs r0, r0, #0
_081987CC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ProcessMenuInput_other

	thumb_func_start Menu_ProcessInputNoWrapAround_other
Menu_ProcessInputNoWrapAround_other: @ 0x081987D4
	push {r4, r5, r6, lr}
	ldr r4, _081987FC
	ldrb r5, [r4, #2]
	adds r6, r5, #0
	ldr r2, _08198800
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08198804
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _081987F4
	movs r0, #5
	bl PlaySE
_081987F4:
	movs r0, #2
	ldrsb r0, [r4, r0]
	b _0819884A
	.align 2, 0
_081987FC: .4byte 0x0203CA5C
_08198800: .4byte 0x03002360
_08198804:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08198812
	movs r0, #1
	rsbs r0, r0, #0
	b _0819884A
_08198812:
	ldrh r0, [r2, #0x30]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0x40
	bne _0819882E
	movs r0, #1
	rsbs r0, r0, #0
	bl Menu_MoveCursorNoWrapAround
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _08198846
	b _08198840
_0819882E:
	cmp r1, #0x80
	bne _08198846
	movs r0, #1
	bl Menu_MoveCursorNoWrapAround
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	beq _08198846
_08198840:
	movs r0, #5
	bl PlaySE
_08198846:
	movs r0, #2
	rsbs r0, r0, #0
_0819884A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end Menu_ProcessInputNoWrapAround_other

	thumb_func_start PrintTextArray
PrintTextArray: @ 0x08198850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _081988B4
_08198884:
	lsls r0, r4, #3
	ldr r1, [sp, #0x34]
	adds r0, r0, r1
	ldr r2, [r0]
	adds r0, r7, #0
	muls r0, r4, r0
	add r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r1, sl
	mov r3, sb
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08198884
_081988B4:
	adds r0, r6, #0
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end PrintTextArray

	thumb_func_start sub_081988CC
sub_081988CC: @ 0x081988CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r4, [sp, #0x40]
	ldr r5, [sp, #0x44]
	ldr r6, [sp, #0x4c]
	ldr r7, [sp, #0x50]
	mov r8, r7
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x18]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x1c]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov sb, r6
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _0819894C
_08198914:
	lsls r0, r4, #3
	ldr r1, [sp, #0x48]
	adds r0, r0, r1
	ldr r2, [r0]
	mov r0, sl
	muls r0, r4, r0
	ldr r1, [sp, #0x1c]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	mov r0, sb
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	adds r0, r7, #0
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl AddTextPrinterParameterized5
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08198914
_0819894C:
	adds r0, r7, #0
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081988CC

	thumb_func_start sub_08198964
sub_08198964: @ 0x08198964
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r7, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	movs r1, #0
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	str r7, [sp, #8]
	mov r0, r8
	adds r1, r6, #0
	movs r3, #2
	bl PrintTextArray
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08198964

	thumb_func_start AddItemMenuActionTextPrinters
AddItemMenuActionTextPrinters: @ 0x081989B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r1, #0
	mov r8, r2
	ldr r1, [sp, #0x38]
	mov sb, r1
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x40]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r4, r8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r8, r4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	mov r0, sp
	ldrb r1, [r0, #0x10]
	strb r1, [r0, #4]
	strb r6, [r0, #5]
	adds r0, r6, #0
	movs r1, #5
	bl GetFontAttribute
	mov r3, sp
	lsls r0, r0, #4
	ldrb r2, [r3, #0xc]
	movs r5, #0xf
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xc]
	adds r0, r6, #0
	movs r1, #6
	bl GetFontAttribute
	mov r3, sp
	adds r1, r5, #0
	ands r1, r0
	ldrb r2, [r3, #0xd]
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xd]
	adds r0, r6, #0
	movs r1, #7
	bl GetFontAttribute
	mov r3, sp
	lsls r0, r0, #4
	ldrb r2, [r3, #0xd]
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xd]
	adds r0, r6, #0
	movs r1, #4
	bl GetFontAttribute
	mov r1, sp
	ands r5, r0
	ldrb r0, [r1, #0xc]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, #0xc]
	mov r0, sp
	mov r2, sb
	strb r2, [r0, #0xa]
	adds r0, r6, #0
	movs r1, #3
	bl GetFontAttribute
	mov r1, sp
	strb r0, [r1, #0xb]
	mov r0, sp
	mov r4, r8
	strb r4, [r0, #6]
	strb r4, [r0, #8]
	movs r4, #0
	cmp r4, r7
	bhs _08198AAE
	mov r5, sp
_08198A7E:
	ldr r1, [sp, #0x48]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r2, [sp, #0x44]
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sl
	muls r0, r4, r0
	ldr r1, [sp, #0x14]
	adds r0, r1, r0
	strb r0, [r5, #7]
	strb r0, [r5, #9]
	mov r0, sp
	movs r1, #0xff
	movs r2, #0
	bl AddTextPrinter
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _08198A7E
_08198AAE:
	ldr r0, [sp, #0x10]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AddItemMenuActionTextPrinters

	thumb_func_start sub_08198AC8
sub_08198AC8: @ 0x08198AC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r4, #0
	movs r1, #0
	bl GetFontAttribute
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r4, #0
	movs r1, #2
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r6, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x10]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl AddItemMenuActionTextPrinters
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08198AC8

	thumb_func_start SetWindowTemplateFields
SetWindowTemplateFields: @ 0x08198B34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	mov r8, r7
	strb r1, [r0]
	strb r2, [r0, #1]
	strb r3, [r0, #2]
	strb r4, [r0, #3]
	strb r5, [r0, #4]
	strb r6, [r0, #5]
	mov r1, r8
	strh r1, [r0, #6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetWindowTemplateFields

	thumb_func_start CreateWindowTemplate
CreateWindowTemplate: @ 0x08198B60
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	mov r8, r0
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, [sp, #0x38]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	str r6, [sp, #0xc]
	add r0, sp, #0x10
	bl SetWindowTemplateFields
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, r8
	str r0, [r2]
	str r1, [r2, #4]
	mov r0, r8
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r2}
	bx r2
	thumb_func_end CreateWindowTemplate

	thumb_func_start sub_08198BB4
sub_08198BB4: @ 0x08198BB4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	add r0, sp, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetWindowTemplateFields
	add r0, sp, #0x10
	bl AddWindow
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08198BB4

	thumb_func_start sub_08198C08
sub_08198C08: @ 0x08198C08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r4, [sp, #0x3c]
	ldr r5, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov sl, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r1, sl
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	ldr r7, _08198D3C
	bl AddWindow
	strb r0, [r7]
	ldrb r0, [r7]
	movs r1, #1
	adds r2, r4, #0
	adds r3, r5, #0
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r0, _08198D40
	str r0, [sp, #0xc]
	add r1, sp, #0xc
	ldrb r0, [r7]
	strb r0, [r1, #4]
	adds r0, r1, #0
	strb r6, [r0, #5]
	adds r0, r6, #0
	movs r1, #0
	bl GetFontAttribute
	add r1, sp, #0xc
	add r0, r8
	strb r0, [r1, #6]
	adds r0, r1, #0
	mov r1, sb
	strb r1, [r0, #7]
	adds r1, r0, #0
	ldrb r0, [r0, #6]
	strb r0, [r1, #8]
	adds r0, r1, #0
	ldrb r0, [r0, #7]
	strb r0, [r1, #9]
	adds r0, r6, #0
	movs r1, #5
	bl GetFontAttribute
	add r3, sp, #0xc
	lsls r0, r0, #4
	ldrb r2, [r3, #0xc]
	movs r5, #0xf
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xc]
	adds r0, r6, #0
	movs r1, #6
	bl GetFontAttribute
	add r3, sp, #0xc
	adds r1, r5, #0
	ands r1, r0
	ldrb r2, [r3, #0xd]
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xd]
	adds r0, r6, #0
	movs r1, #7
	bl GetFontAttribute
	add r3, sp, #0xc
	lsls r0, r0, #4
	ldrb r2, [r3, #0xd]
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xd]
	adds r0, r6, #0
	movs r1, #4
	bl GetFontAttribute
	add r1, sp, #0xc
	ands r5, r0
	ldrb r0, [r1, #0xc]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, #0xc]
	adds r0, r6, #0
	movs r1, #2
	bl GetFontAttribute
	add r1, sp, #0xc
	strb r0, [r1, #0xa]
	adds r0, r6, #0
	movs r1, #3
	bl GetFontAttribute
	add r1, sp, #0xc
	strb r0, [r1, #0xb]
	adds r0, r1, #0
	movs r1, #0xff
	movs r2, #0
	bl AddTextPrinter
	adds r0, r6, #0
	movs r1, #1
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r7]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r1, r6, #0
	mov r2, r8
	mov r3, sb
	bl sub_081984B0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08198D3C: .4byte 0x0203CA6B
_08198D40: .4byte 0x085D7B40
	thumb_func_end sub_08198C08

	thumb_func_start sub_08198D44
sub_08198D44: @ 0x08198D44
	push {lr}
	sub sp, #0xc
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r3, #2
	bl sub_08198C08
	add sp, #0xc
	pop {r0}
	bx r0
	thumb_func_end sub_08198D44

	thumb_func_start Menu_ProcessInputNoWrapClearOnChoose
Menu_ProcessInputNoWrapClearOnChoose: @ 0x08198D68
	push {r4, lr}
	bl Menu_ProcessInputNoWrap
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08198D7E
	bl sub_08198D88
_08198D7E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Menu_ProcessInputNoWrapClearOnChoose

	thumb_func_start sub_08198D88
sub_08198D88: @ 0x08198D88
	push {r4, lr}
	ldr r4, _08198DA0
	ldrb r0, [r4]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08198DA0: .4byte 0x0203CA6B
	thumb_func_end sub_08198D88

	thumb_func_start sub_08198DA4
sub_08198DA4: @ 0x08198DA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r4, [sp, #0x40]
	ldr r5, [sp, #0x44]
	ldr r6, [sp, #0x48]
	ldr r7, [sp, #0x4c]
	mov r8, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x18]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x1c]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r5, #0
	cmp r5, sb
	bhs _08198E4A
_08198DF0:
	movs r4, #0
	adds r1, r5, #1
	mov r8, r1
	cmp r4, r6
	bhs _08198E40
	ldr r7, [sp, #0x1c]
	adds r0, r7, #0
	muls r0, r5, r0
	ldr r1, [sp, #0x14]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08198E08:
	adds r0, r5, #0
	muls r0, r6, r0
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, [sp, #0x50]
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, [sp, #0x18]
	adds r3, r0, #0
	muls r3, r4, r3
	ldr r1, [sp, #0x10]
	adds r3, r1, r3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	mov r0, sl
	ldr r1, [sp, #0xc]
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _08198E08
_08198E40:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	cmp r5, sb
	blo _08198DF0
_08198E4A:
	mov r0, sl
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08198DA4

	thumb_func_start sub_08198E64
sub_08198E64: @ 0x08198E64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x34]
	ldr r3, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #0
	str r3, [sp, #0x14]
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	ldr r3, [sp, #0x14]
	str r3, [sp, #0xc]
	str r7, [sp, #0x10]
	mov r0, sb
	mov r1, r8
	movs r3, #0
	bl sub_08198DA4
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08198E64

	thumb_func_start sub_08198ECC
sub_08198ECC: @ 0x08198ECC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r4, [sp, #0x40]
	ldr r5, [sp, #0x44]
	ldr r6, [sp, #0x48]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x1c]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r8, r5
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov sl, r6
	mov r0, sp
	ldrb r1, [r0, #0x10]
	strb r1, [r0, #4]
	strb r7, [r0, #5]
	adds r0, r7, #0
	movs r1, #5
	bl GetFontAttribute
	mov r3, sp
	lsls r0, r0, #4
	ldrb r2, [r3, #0xc]
	movs r5, #0xf
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xc]
	adds r0, r7, #0
	movs r1, #6
	bl GetFontAttribute
	mov r3, sp
	adds r1, r5, #0
	ands r1, r0
	ldrb r2, [r3, #0xd]
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xd]
	adds r0, r7, #0
	movs r1, #7
	bl GetFontAttribute
	mov r3, sp
	lsls r0, r0, #4
	ldrb r2, [r3, #0xd]
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xd]
	adds r0, r7, #0
	movs r1, #4
	bl GetFontAttribute
	mov r1, sp
	ands r5, r0
	ldrb r0, [r1, #0xc]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, #0xc]
	adds r0, r7, #0
	movs r1, #2
	bl GetFontAttribute
	mov r1, sp
	strb r0, [r1, #0xa]
	adds r0, r7, #0
	movs r1, #3
	bl GetFontAttribute
	mov r1, sp
	strb r0, [r1, #0xb]
	movs r6, #0
	cmp r6, sl
	bhs _08198FEE
_08198F8A:
	movs r5, #0
	adds r2, r6, #1
	mov sb, r2
	cmp r5, r8
	bhs _08198FE4
	mov r4, sp
_08198F96:
	mov r0, r8
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, [sp, #0x50]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r2, [sp, #0x4c]
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, [sp, #0x1c]
	adds r0, r1, #0
	muls r0, r5, r0
	ldr r2, [sp, #0x14]
	adds r0, r2, r0
	strb r0, [r4, #6]
	adds r0, r7, #0
	movs r1, #1
	bl GetFontAttribute
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x18]
	adds r1, r0, r1
	strb r1, [r4, #7]
	ldrb r0, [r4, #6]
	strb r0, [r4, #8]
	strb r1, [r4, #9]
	mov r0, sp
	movs r1, #0xff
	movs r2, #0
	bl AddTextPrinter
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r8
	blo _08198F96
_08198FE4:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	cmp r6, sl
	blo _08198F8A
_08198FEE:
	ldr r0, [sp, #0x10]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08198ECC

	thumb_func_start sub_08199008
sub_08199008: @ 0x08199008
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	mov r8, r0
	adds r3, r1, #0
	adds r4, r2, #0
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	ldr r7, [sp, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r0, r3, #0
	movs r1, #0
	str r3, [sp, #0x14]
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x10]
	mov r0, r8
	ldr r3, [sp, #0x14]
	adds r1, r3, #0
	movs r3, #0
	bl sub_08198ECC
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08199008

	thumb_func_start sub_08199068
sub_08199068: @ 0x08199068
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [sp, #0x20]
	mov ip, r4
	ldr r4, [sp, #0x24]
	mov r8, r4
	ldr r4, [sp, #0x28]
	mov sb, r4
	ldr r4, [sp, #0x2c]
	mov sl, r4
	ldr r4, [sp, #0x30]
	ldr r5, [sp, #0x34]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r7, r5, #0x18
	ldr r5, _081990C0
	movs r6, #0
	strb r2, [r5]
	strb r3, [r5, #1]
	strb r6, [r5, #3]
	subs r4, #1
	strb r4, [r5, #4]
	strb r0, [r5, #5]
	strb r1, [r5, #6]
	mov r0, ip
	strb r0, [r5, #7]
	mov r4, r8
	strb r4, [r5, #8]
	mov r0, sb
	strb r0, [r5, #9]
	mov r4, sl
	strb r4, [r5, #0xa]
	cmp r7, #0
	blt _081990BC
	movs r0, #4
	ldrsb r0, [r5, r0]
	cmp r7, r0
	ble _081990C4
_081990BC:
	strb r6, [r5, #2]
	b _081990C6
	.align 2, 0
_081990C0: .4byte 0x0203CA5C
_081990C4:
	strb r7, [r5, #2]
_081990C6:
	movs r0, #0
	movs r1, #0
	bl sub_08199250
	ldr r0, _081990E0
	ldrb r0, [r0, #2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081990E0: .4byte 0x0203CA5C
	thumb_func_end sub_08199068

	thumb_func_start sub_081990E4
sub_081990E4: @ 0x081990E4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x20
	mov sb, r0
	mov r8, r1
	mov sl, r2
	ldr r6, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	ldr r5, [sp, #0x44]
	ldr r2, [sp, #0x48]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, r8
	movs r1, #1
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl GetMenuCursorDimensionByFont
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	muls r1, r5, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r6, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x18]
	str r2, [sp, #0x14]
	mov r0, sb
	mov r1, r8
	mov r2, sl
	ldr r3, [sp, #0x1c]
	bl sub_08199068
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081990E4

	thumb_func_start sub_08199170
sub_08199170: @ 0x08199170
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08199248
	add r0, sp, #0xc
	movs r2, #2
	bl memcpy
	ldr r5, _0819924C
	ldrb r0, [r5, #6]
	movs r1, #0
	bl GetMenuCursorDimensionByFont
	mov r8, r0
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldrb r0, [r5, #6]
	movs r1, #1
	bl GetMenuCursorDimensionByFont
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldrb r0, [r5, #9]
	mov sl, r0
	mov r0, sb
	mov r1, sl
	bl __umodsi3
	ldrb r1, [r5, #7]
	adds r4, r1, #0
	muls r4, r0, r4
	ldrb r1, [r5]
	adds r4, r4, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sb
	mov r1, sl
	bl __udivsi3
	ldrb r1, [r5, #8]
	adds r3, r1, #0
	muls r3, r0, r3
	ldrb r0, [r5, #1]
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r0, [r5, #5]
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #0x11
	adds r2, r4, #0
	bl FillWindowPixelRect
	ldrb r6, [r5, #9]
	adds r0, r7, #0
	adds r1, r6, #0
	bl __umodsi3
	ldrb r1, [r5, #7]
	adds r4, r1, #0
	muls r4, r0, r4
	ldrb r0, [r5]
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	adds r1, r6, #0
	bl __udivsi3
	ldrb r1, [r5, #8]
	adds r2, r1, #0
	muls r2, r0, r2
	ldrb r1, [r5, #1]
	adds r2, r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #6]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	add r2, sp, #0xc
	adds r3, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08199248: .4byte 0x085D7B6C
_0819924C: .4byte 0x0203CA5C
	thumb_func_end sub_08199170

	thumb_func_start sub_08199250
sub_08199250: @ 0x08199250
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r1, _0819928C
	ldrb r2, [r1, #2]
	mov r8, r2
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	adds r5, r1, #0
	cmp r6, #0
	beq _081992A6
	movs r7, #2
	ldrsb r7, [r5, r7]
	ldrb r4, [r5, #9]
	adds r0, r7, #0
	adds r1, r4, #0
	bl __modsi3
	adds r0, r0, r6
	cmp r0, #0
	bge _08199290
	adds r0, r4, #0
	adds r0, #0xff
	add r0, r8
	b _081992A4
	.align 2, 0
_0819928C: .4byte 0x0203CA5C
_08199290:
	cmp r0, r4
	blt _081992A0
	adds r0, r7, #0
	adds r1, r4, #0
	bl __divsi3
	muls r0, r4, r0
	b _081992A4
_081992A0:
	mov r1, r8
	adds r0, r6, r1
_081992A4:
	strb r0, [r5, #2]
_081992A6:
	mov r2, sb
	lsls r0, r2, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	beq _081992EA
	movs r0, #2
	ldrsb r0, [r5, r0]
	ldrb r4, [r5, #9]
	adds r1, r4, #0
	bl __divsi3
	adds r1, r0, r6
	cmp r1, #0
	bge _081992CE
	ldrb r0, [r5, #0xa]
	subs r0, #1
	muls r0, r4, r0
	ldrb r1, [r5, #2]
	adds r0, r0, r1
	b _081992E8
_081992CE:
	ldrb r0, [r5, #0xa]
	cmp r1, r0
	blt _081992E0
	subs r0, #1
	adds r1, r4, #0
	muls r1, r0, r1
	ldrb r0, [r5, #2]
	subs r0, r0, r1
	b _081992E8
_081992E0:
	adds r0, r4, #0
	muls r0, r6, r0
	ldrb r2, [r5, #2]
	adds r0, r0, r2
_081992E8:
	strb r0, [r5, #2]
_081992EA:
	movs r1, #2
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bgt _08199300
	ldrb r1, [r5, #2]
	mov r0, r8
	bl sub_08199170
	b _08199304
_08199300:
	mov r0, r8
	strb r0, [r5, #2]
_08199304:
	ldrb r0, [r5, #2]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08199250

	thumb_func_start sub_08199314
sub_08199314: @ 0x08199314
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r1, _0819938C
	ldrb r7, [r1, #2]
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	adds r5, r1, #0
	cmp r4, #0
	beq _08199348
	movs r0, #2
	ldrsb r0, [r5, r0]
	ldrb r6, [r5, #9]
	adds r1, r6, #0
	bl __modsi3
	adds r0, r0, r4
	cmp r0, #0
	blt _08199348
	cmp r0, r6
	bge _08199348
	adds r0, r4, r7
	strb r0, [r5, #2]
_08199348:
	mov r1, r8
	lsls r0, r1, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _08199374
	movs r0, #2
	ldrsb r0, [r5, r0]
	ldrb r6, [r5, #9]
	adds r1, r6, #0
	bl __divsi3
	adds r0, r0, r4
	cmp r0, #0
	blt _08199374
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	bge _08199374
	adds r0, r6, #0
	muls r0, r4, r0
	ldrb r1, [r5, #2]
	adds r0, r0, r1
	strb r0, [r5, #2]
_08199374:
	movs r1, #2
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bgt _08199390
	ldrb r1, [r5, #2]
	adds r0, r7, #0
	bl sub_08199170
	b _08199392
	.align 2, 0
_0819938C: .4byte 0x0203CA5C
_08199390:
	strb r7, [r5, #2]
_08199392:
	ldrb r0, [r5, #2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08199314

	thumb_func_start sub_081993A0
sub_081993A0: @ 0x081993A0
	push {r4, lr}
	ldr r4, _081993C0
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081993C8
	movs r0, #5
	bl PlaySE
	ldr r0, _081993C4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08199448
	.align 2, 0
_081993C0: .4byte 0x03002360
_081993C4: .4byte 0x0203CA5C
_081993C8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081993D6
	movs r0, #1
	rsbs r0, r0, #0
	b _08199448
_081993D6:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081993EC
	movs r0, #5
	bl PlaySE
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	b _08199440
_081993EC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08199400
	movs r0, #5
	bl PlaySE
	movs r0, #0
	movs r1, #1
	b _08199440
_08199400:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08199414
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08199420
_08199414:
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	b _0819943E
_08199420:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08199436
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08199444
_08199436:
	movs r0, #5
	bl PlaySE
	movs r0, #1
_0819943E:
	movs r1, #0
_08199440:
	bl sub_08199250
_08199444:
	movs r0, #2
	rsbs r0, r0, #0
_08199448:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081993A0

	thumb_func_start Menu_ProcessInputGridLayout
Menu_ProcessInputGridLayout: @ 0x08199450
	push {r4, r5, r6, lr}
	ldr r5, _08199470
	ldrb r4, [r5, #2]
	ldr r6, _08199474
	ldrh r1, [r6, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08199478
	movs r0, #5
	bl PlaySE
	movs r0, #2
	ldrsb r0, [r5, r0]
	b _081994EE
	.align 2, 0
_08199470: .4byte 0x0203CA5C
_08199474: .4byte 0x03002360
_08199478:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08199486
	movs r0, #1
	rsbs r0, r0, #0
	b _081994EE
_08199486:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08199496
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	b _081994D8
_08199496:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081994A4
	movs r0, #0
	movs r1, #1
	b _081994D8
_081994A4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _081994B8
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081994BE
_081994B8:
	movs r0, #1
	rsbs r0, r0, #0
	b _081994D6
_081994BE:
	ldrh r1, [r6, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081994D4
	bl GetLRKeysState
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _081994EA
_081994D4:
	movs r0, #1
_081994D6:
	movs r1, #0
_081994D8:
	bl sub_08199314
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	beq _081994EA
	movs r0, #5
	bl PlaySE
_081994EA:
	movs r0, #2
	rsbs r0, r0, #0
_081994EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end Menu_ProcessInputGridLayout

	thumb_func_start sub_081994F4
sub_081994F4: @ 0x081994F4
	push {r4, r5, lr}
	ldr r4, _08199514
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0819951C
	movs r0, #5
	bl PlaySE
	ldr r0, _08199518
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08199598
	.align 2, 0
_08199514: .4byte 0x03002360
_08199518: .4byte 0x0203CA5C
_0819951C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0819952A
	movs r0, #1
	rsbs r0, r0, #0
	b _08199598
_0819952A:
	ldrh r0, [r4, #0x30]
	movs r5, #0xf0
	adds r1, r5, #0
	ands r1, r0
	cmp r1, #0x40
	bne _08199544
	movs r0, #5
	bl PlaySE
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	b _08199590
_08199544:
	cmp r1, #0x80
	bne _08199554
	movs r0, #5
	bl PlaySE
	movs r0, #0
	movs r1, #1
	b _08199590
_08199554:
	cmp r1, #0x20
	beq _08199564
	bl sub_08122118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08199570
_08199564:
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	b _0819958E
_08199570:
	ldrh r1, [r4, #0x30]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0x10
	beq _08199586
	bl sub_08122118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08199594
_08199586:
	movs r0, #5
	bl PlaySE
	movs r0, #1
_0819958E:
	movs r1, #0
_08199590:
	bl sub_08199250
_08199594:
	movs r0, #2
	rsbs r0, r0, #0
_08199598:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081994F4

	thumb_func_start sub_081995A0
sub_081995A0: @ 0x081995A0
	push {r4, r5, r6, lr}
	ldr r6, _081995C0
	ldrb r4, [r6, #2]
	ldr r5, _081995C4
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081995C8
	movs r0, #5
	bl PlaySE
	movs r0, #2
	ldrsb r0, [r6, r0]
	b _0819963A
	.align 2, 0
_081995C0: .4byte 0x0203CA5C
_081995C4: .4byte 0x03002360
_081995C8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081995D6
	movs r0, #1
	rsbs r0, r0, #0
	b _0819963A
_081995D6:
	ldrh r0, [r5, #0x30]
	movs r6, #0xf0
	adds r1, r6, #0
	ands r1, r0
	cmp r1, #0x40
	bne _081995EA
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	b _08199624
_081995EA:
	cmp r1, #0x80
	bne _081995F4
	movs r0, #0
	movs r1, #1
	b _08199624
_081995F4:
	cmp r1, #0x20
	beq _08199604
	bl sub_08122118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0819960A
_08199604:
	movs r0, #1
	rsbs r0, r0, #0
	b _08199622
_0819960A:
	ldrh r1, [r5, #0x30]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0x10
	beq _08199620
	bl sub_08122118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08199636
_08199620:
	movs r0, #1
_08199622:
	movs r1, #0
_08199624:
	bl sub_08199314
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	beq _08199636
	movs r0, #5
	bl PlaySE
_08199636:
	movs r0, #2
	rsbs r0, r0, #0
_0819963A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081995A0

	thumb_func_start clear_scheduled_bg_copies_to_vram
clear_scheduled_bg_copies_to_vram: @ 0x08199640
	push {lr}
	ldr r0, _08199650
	movs r1, #0
	movs r2, #4
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08199650: .4byte 0x0203CA70
	thumb_func_end clear_scheduled_bg_copies_to_vram

	thumb_func_start schedule_bg_copy_tilemap_to_vram
schedule_bg_copy_tilemap_to_vram: @ 0x08199654
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08199664
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08199664: .4byte 0x0203CA70
	thumb_func_end schedule_bg_copy_tilemap_to_vram

	thumb_func_start do_scheduled_bg_tilemap_copies_to_vram
do_scheduled_bg_tilemap_copies_to_vram: @ 0x08199668
	push {r4, lr}
	ldr r4, _081996B4
	ldrb r0, [r4]
	cmp r0, #1
	bne _0819967C
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	strb r0, [r4]
_0819967C:
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _0819968C
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	strb r0, [r4, #1]
_0819968C:
	ldrb r0, [r4, #2]
	cmp r0, #1
	bne _0819969C
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	strb r0, [r4, #2]
_0819969C:
	ldrb r0, [r4, #3]
	cmp r0, #1
	bne _081996AC
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	strb r0, [r4, #3]
_081996AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081996B4: .4byte 0x0203CA70
	thumb_func_end do_scheduled_bg_tilemap_copies_to_vram

	thumb_func_start reset_temp_tile_data_buffers
reset_temp_tile_data_buffers: @ 0x081996B8
	push {lr}
	ldr r3, _081996D4
	ldr r1, _081996D8
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x7c
_081996C4:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _081996C4
	movs r0, #0
	strh r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_081996D4: .4byte 0x0203CA74
_081996D8: .4byte 0x0203CA78
	thumb_func_end reset_temp_tile_data_buffers

	thumb_func_start free_temp_tile_data_buffers_if_possible
free_temp_tile_data_buffers_if_possible: @ 0x081996DC
	push {r4, r5, r6, lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08199720
	ldr r1, _08199718
	ldrh r0, [r1]
	cmp r0, #0
	beq _08199714
	movs r4, #0
	ldrh r1, [r1]
	cmp r4, r1
	bge _0819970E
	ldr r5, _0819971C
	movs r6, #0
_081996FC:
	ldr r0, [r5]
	bl Free
	stm r5!, {r6}
	adds r4, #1
	ldr r0, _08199718
	ldrh r0, [r0]
	cmp r4, r0
	blt _081996FC
_0819970E:
	ldr r1, _08199718
	movs r0, #0
	strh r0, [r1]
_08199714:
	movs r0, #0
	b _08199722
	.align 2, 0
_08199718: .4byte 0x0203CA74
_0819971C: .4byte 0x0203CA78
_08199720:
	movs r0, #1
_08199722:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end free_temp_tile_data_buffers_if_possible

	thumb_func_start decompress_and_copy_tile_data_to_vram
decompress_and_copy_tile_data_to_vram: @ 0x08199728
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r6, _08199788
	ldrh r0, [r6]
	cmp r0, #0x1f
	bhi _08199790
	adds r0, r4, #0
	add r1, sp, #4
	bl malloc_and_decompress
	adds r4, r0, #0
	cmp r5, #0
	bne _08199760
	ldr r5, [sp, #4]
_08199760:
	cmp r4, #0
	beq _08199784
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	str r7, [sp]
	mov r0, r8
	adds r1, r4, #0
	mov r3, sb
	bl copy_decompressed_tile_data_to_vram
	ldr r2, _0819978C
	ldrh r0, [r6]
	adds r1, r0, #1
	strh r1, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r2
	str r4, [r0]
_08199784:
	adds r0, r4, #0
	b _08199792
	.align 2, 0
_08199788: .4byte 0x0203CA74
_0819978C: .4byte 0x0203CA78
_08199790:
	movs r0, #0
_08199792:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end decompress_and_copy_tile_data_to_vram

	thumb_func_start DecompressAndLoadBgGfxUsingHeap
DecompressAndLoadBgGfxUsingHeap: @ 0x081997A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r2, #0
	ldr r2, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	adds r0, r1, #0
	add r1, sp, #4
	bl malloc_and_decompress
	adds r6, r0, #0
	cmp r5, #0
	bne _081997CE
	ldr r5, [sp, #4]
_081997CE:
	cmp r6, #0
	beq _08199806
	ldr r0, _08199814
	movs r1, #0
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	str r7, [sp]
	mov r0, r8
	adds r1, r6, #0
	mov r3, sb
	bl copy_decompressed_tile_data_to_vram
	ldr r2, _08199818
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r0, [r1, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r6, #0
	bl SetWordTaskArg
_08199806:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08199814: .4byte 0x0819981D
_08199818: .4byte 0x03005B60
	thumb_func_end DecompressAndLoadBgGfxUsingHeap

	thumb_func_start task_free_buf_after_copying_tile_data_to_vram
task_free_buf_after_copying_tile_data_to_vram: @ 0x0819981C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08199854
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	bl CheckForSpaceForDma3Request
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0819984C
	adds r0, r4, #0
	movs r1, #1
	bl GetWordTaskArg
	bl Free
	adds r0, r4, #0
	bl DestroyTask
_0819984C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08199854: .4byte 0x03005B60
	thumb_func_end task_free_buf_after_copying_tile_data_to_vram

	thumb_func_start malloc_and_decompress
malloc_and_decompress: @ 0x08199858
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #1]
	strb r0, [r1]
	ldrb r0, [r5, #2]
	strb r0, [r1, #1]
	ldrb r0, [r5, #3]
	strb r0, [r1, #2]
	movs r0, #0
	strb r0, [r1, #3]
	ldr r0, [r1]
	bl Alloc
	adds r4, r0, #0
	cmp r4, #0
	beq _08199880
	adds r0, r5, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
_08199880:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end malloc_and_decompress

	thumb_func_start copy_decompressed_tile_data_to_vram
copy_decompressed_tile_data_to_vram: @ 0x08199888
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [sp, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0
	beq _081998B0
	cmp r1, #1
	beq _081998B8
	ldr r0, _081998AC
	b _081998C2
	.align 2, 0
_081998AC: .4byte 0x0000FFFF
_081998B0:
	adds r1, r4, #0
	bl LoadBgTiles
	b _081998BE
_081998B8:
	adds r1, r4, #0
	bl LoadBgTilemap
_081998BE:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_081998C2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end copy_decompressed_tile_data_to_vram

	thumb_func_start sub_081998C8
sub_081998C8: @ 0x081998C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r2, #0
	ldr r4, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	bl GetBgTilemapBuffer
	mov r8, r0
	adds r0, r5, r4
	cmp r5, r0
	bge _08199940
	mov sb, r0
_08199906:
	ldr r3, [sp]
	ldr r1, [sp, #4]
	adds r0, r3, r1
	adds r7, r5, #1
	cmp r3, r0
	bge _08199938
	lsls r6, r5, #5
	ldr r1, _08199950
	mov ip, r1
	mov r1, sl
	lsls r5, r1, #0xc
	adds r4, r0, #0
_0819991E:
	adds r1, r6, r3
	lsls r1, r1, #1
	add r1, r8
	ldrh r2, [r1]
	mov r0, ip
	ands r0, r2
	orrs r0, r5
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	blt _0819991E
_08199938:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	cmp r5, sb
	blt _08199906
_08199940:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08199950: .4byte 0x00000FFF
	thumb_func_end sub_081998C8

	thumb_func_start sub_08199954
sub_08199954: @ 0x08199954
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r1
	ldr r1, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r8, r4
	bl GetBgTilemapBuffer
	adds r7, r0, #0
	movs r0, #0
	cmp r0, r8
	bhs _081999C2
_0819998C:
	movs r2, #0
	adds r6, r0, #1
	cmp r2, r5
	bhs _081999BA
	adds r4, r0, #0
	muls r4, r5, r4
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r3, r0, #5
_0819999E:
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, sl
	adds r0, r3, r2
	add r0, sb
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r5
	blo _0819999E
_081999BA:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r8
	blo _0819998C
_081999C2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08199954

	thumb_func_start sub_081999D4
sub_081999D4: @ 0x081999D4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x14]
	adds r4, r2, #0
	muls r4, r3, r4
	cmp r0, #1
	bne _081999FC
	adds r3, r6, #0
	movs r2, #0
	cmp r2, r4
	bge _08199A24
_081999EC:
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, r4
	blt _081999EC
	b _08199A24
_081999FC:
	cmp r4, #0
	ble _08199A24
	movs r0, #0xfc
	lsls r0, r0, #8
	mov ip, r0
	ldr r0, _08199A2C
	adds r7, r0, #0
	adds r3, r6, #0
	adds r2, r4, #0
_08199A0E:
	ldrh r0, [r3]
	mov r1, ip
	ands r1, r0
	adds r0, r0, r5
	ands r0, r7
	orrs r1, r0
	strh r1, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _08199A0E
_08199A24:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08199A2C: .4byte 0x000003FF
	thumb_func_end sub_081999D4

	thumb_func_start ResetBgPositions
ResetBgPositions: @ 0x08199A30
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
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
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetBgPositions

	thumb_func_start sub_08199A88
sub_08199A88: @ 0x08199A88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r2
	mov sb, r3
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	movs r1, #4
	bl GetBgAttribute
	lsls r0, r0, #0x10
	movs r7, #0x40
	cmp r0, #0
	bne _08199AAE
	movs r7, #0x20
_08199AAE:
	adds r0, r5, #0
	movs r1, #1
	bl GetBgAttribute
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl GetBgAttribute
	lsls r4, r4, #0x10
	lsrs r4, r4, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	muls r0, r7, r0
	adds r4, r4, r0
	lsls r0, r6, #0x18
	lsls r1, r6, #0x10
	orrs r0, r1
	lsls r1, r6, #8
	orrs r0, r1
	orrs r0, r6
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r4, r1
	mov r2, sb
	muls r2, r7, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	movs r3, #1
	bl RequestDma3Fill
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08199A88

	thumb_func_start AddTextPrinterParameterized3
AddTextPrinterParameterized3: @ 0x08199AFC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r1, #0
	ldr r6, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r1, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r1, [sp]
	mov r1, sp
	strb r0, [r1, #4]
	mov r0, sp
	strb r4, [r0, #5]
	strb r2, [r0, #6]
	strb r3, [r0, #7]
	ldrb r0, [r0, #6]
	strb r0, [r1, #8]
	mov r0, sp
	ldrb r0, [r0, #7]
	strb r0, [r1, #9]
	adds r0, r4, #0
	movs r1, #2
	bl GetFontAttribute
	mov r1, sp
	strb r0, [r1, #0xa]
	adds r0, r4, #0
	movs r1, #3
	bl GetFontAttribute
	mov r1, sp
	strb r0, [r1, #0xb]
	mov r3, sp
	ldrb r2, [r3, #0xc]
	movs r1, #0x10
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	mov r2, sp
	ldrb r0, [r6, #1]
	lsls r0, r0, #4
	movs r4, #0xf
	strb r0, [r2, #0xc]
	ldrb r2, [r6]
	adds r0, r4, #0
	ands r0, r2
	ldrb r2, [r3, #0xd]
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xd]
	mov r2, sp
	ldrb r0, [r6, #2]
	lsls r0, r0, #4
	ands r1, r4
	orrs r1, r0
	strb r1, [r2, #0xd]
	mov r0, sp
	adds r1, r5, #0
	movs r2, #0
	bl AddTextPrinter
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AddTextPrinterParameterized3

	thumb_func_start AddTextPrinterParameterized4
AddTextPrinterParameterized4: @ 0x08199B84
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, [sp, #0x28]
	mov r8, r1
	ldr r1, [sp, #0x2c]
	mov sb, r1
	ldr r6, [sp, #0x30]
	ldr r1, [sp, #0x34]
	ldr r4, [sp, #0x38]
	str r4, [sp]
	mov r4, sp
	strb r0, [r4, #4]
	mov r0, sp
	strb r5, [r0, #5]
	strb r2, [r0, #6]
	strb r3, [r0, #7]
	mov r2, sp
	ldrb r0, [r0, #6]
	strb r0, [r2, #8]
	mov r0, sp
	ldrb r0, [r0, #7]
	strb r0, [r2, #9]
	mov r0, sp
	mov r2, r8
	strb r2, [r0, #0xa]
	mov r2, sb
	strb r2, [r0, #0xb]
	ldrb r3, [r4, #0xc]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r4, #0xc]
	mov r3, sp
	ldrb r0, [r6, #1]
	lsls r0, r0, #4
	movs r5, #0xf
	strb r0, [r3, #0xc]
	ldrb r3, [r6]
	adds r0, r5, #0
	ands r0, r3
	ldrb r3, [r4, #0xd]
	ands r2, r3
	orrs r2, r0
	strb r2, [r4, #0xd]
	mov r3, sp
	ldrb r0, [r6, #2]
	lsls r0, r0, #4
	ands r2, r5
	orrs r2, r0
	strb r2, [r3, #0xd]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, sp
	movs r2, #0
	bl AddTextPrinter
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AddTextPrinterParameterized4

	thumb_func_start AddTextPrinterParameterized5
AddTextPrinterParameterized5: @ 0x08199C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r4, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	mov r8, r1
	ldr r7, [sp, #0x34]
	ldr r5, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	mov sb, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	str r2, [sp]
	mov r1, sp
	strb r0, [r1, #4]
	mov r0, sp
	strb r6, [r0, #5]
	strb r3, [r0, #6]
	strb r4, [r0, #7]
	strb r3, [r0, #8]
	strb r4, [r0, #9]
	strb r5, [r0, #0xa]
	mov r1, sb
	strb r1, [r0, #0xb]
	mov r2, sp
	ldrb r1, [r2, #0xc]
	movs r5, #0x10
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #5
	bl GetFontAttribute
	mov r3, sp
	lsls r0, r0, #4
	ldrb r2, [r3, #0xc]
	movs r4, #0xf
	adds r1, r4, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xc]
	adds r0, r6, #0
	movs r1, #6
	bl GetFontAttribute
	mov r2, sp
	adds r1, r4, #0
	ands r1, r0
	ldrb r0, [r2, #0xd]
	ands r5, r0
	orrs r5, r1
	strb r5, [r2, #0xd]
	adds r0, r6, #0
	movs r1, #7
	bl GetFontAttribute
	mov r2, sp
	lsls r0, r0, #4
	ldrb r1, [r2, #0xd]
	ands r4, r1
	orrs r4, r0
	strb r4, [r2, #0xd]
	mov r0, sp
	mov r1, r8
	adds r2, r7, #0
	bl AddTextPrinter
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AddTextPrinterParameterized5

	thumb_func_start PrintPlayerNameOnWindow
PrintPlayerNameOnWindow: @ 0x08199CBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	movs r2, #0
	ldr r0, _08199D10
	ldr r3, [r0]
	ldrb r0, [r3]
	ldr r6, _08199D14
	cmp r0, #0xff
	beq _08199CE4
_08199CDA:
	adds r2, #1
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08199CDA
_08199CE4:
	adds r0, r6, #0
	bl StringExpandPlaceholders
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	adds r2, r6, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08199D10: .4byte 0x03005AF0
_08199D14: .4byte 0x02021C7C
	thumb_func_end PrintPlayerNameOnWindow

	thumb_func_start sub_08199D18
sub_08199D18: @ 0x08199D18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0x48]
	ldr r4, [sp, #0x4c]
	ldr r1, [sp, #0x50]
	ldr r5, [sp, #0x54]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r2, [sp, #4]
	ldrh r0, [r2, #4]
	ldr r2, [sp, #0xc]
	subs r0, r0, r2
	ldr r2, [sp, #8]
	adds r2, r1, r2
	str r2, [sp, #0x10]
	cmp r0, r1
	bge _08199D64
	ldr r1, [sp, #8]
	adds r0, r0, r1
	str r0, [sp, #0x10]
_08199D64:
	ldr r2, [sp, #4]
	ldrh r1, [r2, #6]
	subs r0, r1, r4
	cmp r0, r5
	bge _08199D76
	adds r0, r3, r1
	subs r0, r0, r4
	str r0, [sp, #0x14]
	b _08199D7A
_08199D76:
	adds r5, r3, r5
	str r5, [sp, #0x14]
_08199D7A:
	ldr r0, [sp]
	ldrh r1, [r0, #4]
	movs r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r1, r1, r0
	asrs r1, r1, #3
	str r1, [sp, #0x18]
	ldr r0, [sp, #4]
	ldrh r1, [r0, #4]
	adds r0, r1, #0
	ands r0, r2
	adds r1, r1, r0
	asrs r1, r1, #3
	str r1, [sp, #0x1c]
	mov ip, r3
	mov r8, r4
	ldr r1, [sp, #0x14]
	cmp ip, r1
	blt _08199DA4
	b _08199EE2
_08199DA4:
	ldr r5, [sp, #8]
	ldr r6, [sp, #0xc]
	mov r2, ip
	adds r2, #1
	str r2, [sp, #0x20]
	mov r0, r8
	adds r0, #1
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x10]
	cmp r5, r1
	blt _08199DBC
	b _08199ED2
_08199DBC:
	movs r7, #1
	movs r2, #0xf0
	mov sl, r2
	movs r0, #0xf
	mov sb, r0
_08199DC6:
	asrs r0, r5, #1
	movs r1, #3
	ands r0, r1
	ldr r2, [sp]
	ldr r1, [r2]
	adds r1, r1, r0
	asrs r0, r5, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r2, ip
	asrs r0, r2, #3
	ldr r2, [sp, #0x18]
	muls r0, r2, r0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r2, ip
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1b
	adds r3, r1, r0
	asrs r0, r6, #1
	movs r1, #3
	ands r0, r1
	ldr r2, [sp, #4]
	ldr r1, [r2]
	adds r1, r1, r0
	asrs r0, r6, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r2, r8
	asrs r0, r2, #3
	ldr r2, [sp, #0x1c]
	muls r0, r2, r0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r2, r8
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1b
	adds r4, r1, r0
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _08199E72
	subs r4, #1
	adds r0, r6, #0
	ands r0, r7
	cmp r0, #0
	beq _08199E4A
	ldrh r0, [r4]
	ldr r2, _08199E3C
	ands r2, r0
	adds r0, r5, #0
	ands r0, r7
	cmp r0, #0
	beq _08199E40
	ldrb r1, [r3]
	mov r0, sl
	ands r0, r1
	lsls r0, r0, #8
	b _08199EC2
	.align 2, 0
_08199E3C: .4byte 0x00000FFF
_08199E40:
	ldrb r1, [r3]
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #0xc
	b _08199EC2
_08199E4A:
	ldrh r0, [r4]
	ldr r2, _08199E64
	ands r2, r0
	adds r0, r5, #0
	ands r0, r7
	cmp r0, #0
	beq _08199E68
	ldrb r1, [r3]
	mov r0, sl
	ands r0, r1
	lsls r0, r0, #4
	b _08199EC2
	.align 2, 0
_08199E64: .4byte 0x0000F0FF
_08199E68:
	ldrb r1, [r3]
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #8
	b _08199EC2
_08199E72:
	adds r0, r6, #0
	ands r0, r7
	cmp r0, #0
	beq _08199E9E
	ldrh r0, [r4]
	ldr r2, _08199E90
	ands r2, r0
	adds r0, r5, #0
	ands r0, r7
	cmp r0, #0
	beq _08199E94
	ldrb r1, [r3]
	mov r0, sl
	b _08199EC0
	.align 2, 0
_08199E90: .4byte 0x0000FF0F
_08199E94:
	ldrb r1, [r3]
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #4
	b _08199EC2
_08199E9E:
	ldrh r0, [r4]
	ldr r2, _08199EB8
	ands r2, r0
	adds r0, r5, #0
	ands r0, r7
	cmp r0, #0
	beq _08199EBC
	ldrb r1, [r3]
	mov r0, sl
	ands r0, r1
	lsrs r0, r0, #4
	b _08199EC2
	.align 2, 0
_08199EB8: .4byte 0x0000FFF0
_08199EBC:
	ldrb r1, [r3]
	mov r0, sb
_08199EC0:
	ands r0, r1
_08199EC2:
	orrs r2, r0
	strh r2, [r4]
	adds r5, #1
	adds r6, #1
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _08199ED2
	b _08199DC6
_08199ED2:
	ldr r1, [sp, #0x20]
	mov ip, r1
	ldr r2, [sp, #0x24]
	mov r8, r2
	ldr r0, [sp, #0x14]
	cmp ip, r0
	bge _08199EE2
	b _08199DA4
_08199EE2:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08199D18

	thumb_func_start sub_08199EF4
sub_08199EF4: @ 0x08199EF4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetValidMonIconPalettePtr
	adds r1, r4, #0
	movs r2, #0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08199EF4

	thumb_func_start sub_08199F14
sub_08199F14: @ 0x08199F14
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r2, #1
	bl GetMonIconPtr
	adds r1, r0, #0
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl BlitBitmapToWindow
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08199F14

	thumb_func_start sub_08199F54
sub_08199F54: @ 0x08199F54
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _08199F74
	cmp r1, #1
	ble _08199F6A
	cmp r1, #2
	beq _08199F7C
_08199F6A:
	ldr r0, _08199F70
	b _08199F7E
	.align 2, 0
_08199F70: .4byte 0x085D7BD8
_08199F74:
	ldr r0, _08199F78
	b _08199F7E
	.align 2, 0
_08199F78: .4byte 0x085D7BF8
_08199F7C:
	ldr r0, _08199F8C
_08199F7E:
	adds r1, r2, #0
	movs r2, #0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08199F8C: .4byte 0x085D7C18
	thumb_func_end sub_08199F54

	thumb_func_start blit_move_info_icon
blit_move_info_icon: @ 0x08199F90
	push {r4, r5, lr}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r4, _08199FD4
	lsrs r1, r1, #0x16
	adds r1, r1, r4
	ldrh r5, [r1, #2]
	lsls r5, r5, #5
	ldr r4, _08199FD8
	adds r5, r5, r4
	movs r4, #0x80
	str r4, [sp]
	str r4, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldrb r2, [r1]
	str r2, [sp, #0x10]
	ldrb r1, [r1, #1]
	str r1, [sp, #0x14]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl BlitBitmapRectToWindow
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08199FD4: .4byte 0x085D7B70
_08199FD8: .4byte 0x085D7C38
	thumb_func_end blit_move_info_icon

	thumb_func_start sub_08199FDC
sub_08199FDC: @ 0x08199FDC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r5, r1, #0
	movs r1, #0xfc
	strb r1, [r5]
	adds r5, #1
	movs r0, #1
	strb r0, [r5]
	adds r5, #1
	strb r2, [r5]
	adds r5, #1
	strb r1, [r5]
	adds r5, #1
	movs r0, #3
	strb r0, [r5]
	adds r5, #1
	adds r2, #1
	strb r2, [r5]
	adds r5, #1
	cmp r3, #4
	bhi _0819A0DE
	lsls r0, r3, #2
	ldr r1, _0819A018
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819A018: .4byte 0x0819A01C
_0819A01C: @ jump table
	.4byte _0819A030 @ case 0
	.4byte _0819A040 @ case 1
	.4byte _0819A072 @ case 2
	.4byte _0819A0A0 @ case 3
	.4byte _0819A0B0 @ case 4
_0819A030:
	ldr r0, _0819A03C
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringCopy
	b _0819A0DE
	.align 2, 0
_0819A03C: .4byte 0x03005AF0
_0819A040:
	bl IsNationalPokedexEnabled
	cmp r0, #0
	beq _0819A050
	movs r0, #1
	bl GetNationalPokedexCount
	b _0819A056
_0819A050:
	movs r0, #1
	bl GetHoennPokedexCount
_0819A056:
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r5, r0, #0
	movs r0, #0x1b
	strb r0, [r5]
	adds r5, #1
	movs r0, #7
	b _0819A0D8
_0819A072:
	ldr r4, _0819A09C
	ldr r0, [r4]
	ldrh r1, [r0, #0xe]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r5, r0, #0
	movs r0, #0xf0
	strb r0, [r5]
	adds r5, #1
	ldr r0, [r4]
	ldrb r1, [r0, #0x10]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	b _0819A0DE
	.align 2, 0
_0819A09C: .4byte 0x03005AF0
_0819A0A0:
	ldr r0, _0819A0AC
	ldrb r1, [r0, #0x14]
	adds r0, r5, #0
	bl sub_081245E8
	b _0819A0DE
	.align 2, 0
_0819A0AC: .4byte 0x02036FB8
_0819A0B0:
	ldr r4, _0819A0E4
	movs r6, #0
	adds r7, r5, #1
_0819A0B6:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0819A0C6
	adds r6, #1
_0819A0C6:
	adds r4, #1
	ldr r0, _0819A0E8
	cmp r4, r0
	ble _0819A0B6
	adds r0, r6, #0
	subs r0, #0x5f
	strb r0, [r5]
	adds r5, r7, #0
	movs r0, #0xa
_0819A0D8:
	strb r0, [r5]
	movs r0, #0xff
	strb r0, [r5, #1]
_0819A0DE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819A0E4: .4byte 0x00000867
_0819A0E8: .4byte 0x0000086E
	thumb_func_end sub_08199FDC

