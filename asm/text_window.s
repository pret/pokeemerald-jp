.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetWindowFrameTilesPal
GetWindowFrameTilesPal: @ 0x080980E0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _080980F8
	lsls r0, r0, #3
	ldr r1, _080980F4
	adds r0, r0, r1
	b _080980FA
	.align 2, 0
_080980F4: .4byte 0x084E8860
_080980F8:
	ldr r0, _08098100
_080980FA:
	pop {r1}
	bx r1
	.align 2, 0
_08098100: .4byte 0x084E8860
	thumb_func_end GetWindowFrameTilesPal

	thumb_func_start LoadMessageBoxGfx
LoadMessageBoxGfx: @ 0x08098104
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08098140
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r3, r4, #0
	bl LoadBgTiles
	bl GetOverworldTextboxPalettePtr
	adds r1, r5, #0
	movs r2, #0x20
	bl LoadPalette
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098140: .4byte 0x084E85E0
	thumb_func_end LoadMessageBoxGfx

	thumb_func_start LoadUserWindowBorderGfx_
LoadUserWindowBorderGfx_: @ 0x08098144
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl LoadUserWindowBorderGfx
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadUserWindowBorderGfx_

	thumb_func_start LoadWindowGfx
LoadWindowGfx: @ 0x0809815C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080981B0
	lsls r4, r4, #3
	adds r1, r4, r5
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r3, r6, #0
	bl LoadBgTiles
	adds r5, #4
	adds r4, r4, r5
	ldr r0, [r4]
	mov r1, r8
	movs r2, #0x20
	bl LoadPalette
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080981B0: .4byte 0x084E8860
	thumb_func_end LoadWindowGfx

	thumb_func_start LoadUserWindowBorderGfx
LoadUserWindowBorderGfx: @ 0x080981B4
	push {r4, lr}
	adds r4, r1, #0
	adds r3, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _080981DC
	ldr r1, [r1]
	ldrb r1, [r1, #0x14]
	lsrs r1, r1, #3
	adds r2, r4, #0
	bl LoadWindowGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080981DC: .4byte 0x03005AF0
	thumb_func_end LoadUserWindowBorderGfx

	thumb_func_start DrawTextBorderOuter
DrawTextBorderOuter: @ 0x080981E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl GetWindowAttribute
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r4, #0
	movs r1, #2
	bl GetWindowAttribute
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	adds r0, r4, #0
	movs r1, #3
	bl GetWindowAttribute
	mov sb, r0
	mov r2, sb
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	adds r0, r4, #0
	movs r1, #4
	bl GetWindowAttribute
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r0, r8
	subs r0, #1
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	subs r4, r6, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	mov sl, r0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	str r2, [sp, #8]
	adds r0, r7, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x14]
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	adds r1, r5, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x18]
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	str r2, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0x18]
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	adds r1, r5, #2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	add r8, sb
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r2, sl
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	mov r2, r8
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	adds r1, r5, #3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	mov r0, sl
	str r0, [sp]
	ldr r2, [sp, #0x10]
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0x14]
	mov r3, sb
	bl FillBgTilemapBufferRect
	adds r1, r5, #5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r2, sl
	str r2, [sp]
	str r4, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	mov r2, r8
	mov r3, sb
	bl FillBgTilemapBufferRect
	adds r1, r5, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [sp, #0x10]
	adds r6, r6, r2
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, sl
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	str r2, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0x14]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	adds r1, r5, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x1c]
	str r0, [sp]
	mov r2, sl
	str r2, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0x18]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	adds r5, #8
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r2, sl
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DrawTextBorderOuter

	thumb_func_start DrawTextBorderInner
DrawTextBorderInner: @ 0x08098368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	mov sb, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	adds r0, r4, #0
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl GetWindowAttribute
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r4, #0
	movs r1, #2
	bl GetWindowAttribute
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	adds r0, r4, #0
	movs r1, #3
	bl GetWindowAttribute
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #4
	bl GetWindowAttribute
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r0, r8
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r7, #0
	mov r1, sb
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	mov r1, sb
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, r8
	adds r0, #1
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	mov r1, sb
	adds r1, #2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	add r8, r5
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r7, #0
	mov r2, r8
	adds r3, r4, #0
	bl FillBgTilemapBufferRect
	mov r1, sb
	adds r1, #3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r5, r6, #1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #1
	str r0, [sp]
	ldr r4, [sp, #0xc]
	subs r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0x10]
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r1, sb
	adds r1, #5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r7, #0
	mov r2, r8
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	mov r1, sb
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0xc]
	adds r6, r6, r0
	subs r6, #1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0x10]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	mov r1, sb
	adds r1, #7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [sp, #0x18]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r7, #0
	ldr r2, [sp, #0x14]
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	movs r0, #8
	add sb, r0
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	adds r0, r7, #0
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl FillBgTilemapBufferRect
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DrawTextBorderInner

	thumb_func_start rbox_fill_rectangle
rbox_fill_rectangle: @ 0x08098504
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r0, r6, #0
	movs r1, #0
	bl GetWindowAttribute
	mov sb, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r6, #0
	movs r1, #1
	bl GetWindowAttribute
	mov r8, r0
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r0, r6, #0
	movs r1, #2
	bl GetWindowAttribute
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	movs r1, #3
	bl GetWindowAttribute
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r6, #0
	movs r1, #4
	bl GetWindowAttribute
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	subs r5, #1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	mov r0, sb
	movs r1, #0
	mov r2, r8
	adds r3, r5, #0
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end rbox_fill_rectangle

	thumb_func_start stdpal_get
stdpal_get: @ 0x080985A0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080985DC
	lsls r0, r0, #2
	ldr r1, _080985B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080985B4: .4byte 0x080985B8
_080985B8: @ jump table
	.4byte _080985CC @ case 0
	.4byte _080985D0 @ case 1
	.4byte _080985D4 @ case 2
	.4byte _080985D8 @ case 3
	.4byte _080985DC @ case 4
_080985CC:
	movs r0, #0
	b _080985DE
_080985D0:
	movs r0, #0x10
	b _080985DE
_080985D4:
	movs r0, #0x20
	b _080985DE
_080985D8:
	movs r0, #0x30
	b _080985DE
_080985DC:
	movs r0, #0x40
_080985DE:
	lsls r0, r0, #1
	ldr r1, _080985E8
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080985E8: .4byte 0x084E87A0
	thumb_func_end stdpal_get

	thumb_func_start GetOverworldTextboxPalettePtr
GetOverworldTextboxPalettePtr: @ 0x080985EC
	ldr r0, _080985F0
	bx lr
	.align 2, 0
_080985F0: .4byte 0x084E8840
	thumb_func_end GetOverworldTextboxPalettePtr

	thumb_func_start sub_080985F4
sub_080985F4: @ 0x080985F4
	push {r4, r5, lr}
	adds r3, r1, #0
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r2, _08098638
	ldr r5, _0809863C
	ldr r1, [r5]
	ldrb r1, [r1, #0x14]
	lsrs r1, r1, #3
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #1
	bl LoadBgTiles
	ldr r0, [r5]
	ldrb r0, [r0, #0x14]
	lsrs r0, r0, #3
	bl GetWindowFrameTilesPal
	ldr r0, [r0, #4]
	adds r1, r4, #0
	movs r2, #0x20
	bl LoadPalette
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098638: .4byte 0x084E8860
_0809863C: .4byte 0x03005AF0
	thumb_func_end sub_080985F4

