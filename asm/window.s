.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start nullsub_9
nullsub_9: @ 0x0800308C
	bx lr
	.align 2, 0
	thumb_func_end nullsub_9

	thumb_func_start InitWindows
InitWindows: @ 0x08003090
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r4, _08003124
_080030A4:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080030B4
	ldr r0, _08003128
_080030B4:
	str r0, [r4]
	adds r4, #4
	movs r2, #1
	add r8, r2
	mov r0, r8
	cmp r0, #3
	ble _080030A4
	ldr r0, _0800312C
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r1, _08003130
	movs r0, #0
	movs r4, #0x1f
	mov r8, r4
_080030D0:
	str r2, [r1]
	str r3, [r1, #4]
	str r0, [r1, #8]
	adds r1, #0xc
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	mov r4, r8
	cmp r4, #0
	bge _080030D0
	movs r0, #0
	mov r8, r0
	movs r1, #0
	str r1, [sp]
	ldrb r7, [r5]
	cmp r7, #0xff
	bne _080030F4
	b _0800322C
_080030F4:
	adds r6, r5, #0
	movs r2, #0
	str r2, [sp, #4]
_080030FA:
	ldr r0, _08003134
	ldr r0, [r0]
	cmp r0, #1
	bne _08003138
	ldrb r1, [r6, #3]
	ldrb r0, [r6, #4]
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r7, #0
	movs r1, #0
	movs r3, #0
	bl DummiedOutFireRedLeafGreenTileAllocFunc
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r4, [sp]
	cmp r4, r0
	bne _08003138
_08003120:
	movs r0, #0
	b _08003234
	.align 2, 0
_08003124: .4byte 0x03003010
_08003128: .4byte 0x0800308D
_0800312C: .4byte 0x0829BEB0
_08003130: .4byte 0x02020004
_08003134: .4byte 0x03002FF4
_08003138:
	ldr r0, _08003170
	mov sb, r0
	lsls r0, r7, #2
	mov r2, sb
	adds r1, r0, r2
	ldr r1, [r1]
	mov sl, r0
	cmp r1, #0
	bne _0800319A
	adds r0, r7, #0
	movs r1, #8
	bl GetBgAttribute
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08003174
	cmp r5, r0
	beq _0800319A
	adds r0, r5, #0
	bl AllocZeroed
	adds r4, r0, #0
	cmp r4, #0
	bne _08003178
	bl FreeAllWindowBuffers
	b _08003120
	.align 2, 0
_08003170: .4byte 0x03003010
_08003174: .4byte 0x0000FFFF
_08003178:
	movs r1, #0
	mov r3, sb
	cmp r1, r5
	bge _0800318C
	movs r2, #0
_08003182:
	adds r0, r4, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, r5
	blt _08003182
_0800318C:
	mov r1, sl
	adds r0, r1, r3
	str r4, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	bl SetBgTilemapBuffer
_0800319A:
	ldrb r1, [r6, #3]
	ldrb r0, [r6, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x10
	bl AllocZeroed
	adds r4, r0, #0
	cmp r4, #0
	bne _080031DC
	adds r0, r7, #0
	bl GetNumActiveWindowsOnBg
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08003120
	ldr r0, _080031D4
	mov r2, sl
	adds r5, r2, r0
	ldr r1, [r5]
	ldr r0, _080031D8
	cmp r1, r0
	beq _08003120
	adds r0, r1, #0
	bl Free
	str r4, [r5]
	b _08003120
	.align 2, 0
_080031D4: .4byte 0x03003010
_080031D8: .4byte 0x0800308D
_080031DC:
	ldr r1, _08003244
	adds r0, r1, #0
	adds r0, #8
	ldr r2, [sp, #4]
	adds r0, r2, r0
	str r4, [r0]
	adds r2, r2, r1
	ldr r0, [r6]
	ldr r1, [r6, #4]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _08003248
	ldr r0, [r0]
	cmp r0, #1
	bne _08003212
	mov r4, sp
	ldrh r4, [r4]
	strh r4, [r2, #6]
	ldrb r0, [r6, #3]
	ldrb r1, [r6, #4]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r7, #0
	ldr r1, [sp]
	movs r3, #1
	bl DummiedOutFireRedLeafGreenTileAllocFunc
_08003212:
	adds r6, #8
	ldr r0, [sp, #4]
	adds r0, #0xc
	str r0, [sp, #4]
	movs r1, #1
	add r8, r1
	ldrb r7, [r6]
	cmp r7, #0xff
	beq _0800322C
	mov r2, r8
	cmp r2, #0x1f
	bgt _0800322C
	b _080030FA
_0800322C:
	ldr r1, _0800324C
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
_08003234:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08003244: .4byte 0x02020004
_08003248: .4byte 0x03002FF4
_0800324C: .4byte 0x03003000
	thumb_func_end InitWindows

	thumb_func_start AddWindow
AddWindow: @ 0x08003250
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	movs r6, #0
	ldr r1, _08003340
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08003280
_08003268:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x1f
	bhi _08003280
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08003268
_08003280:
	cmp r6, #0x20
	beq _0800333A
	mov r0, r8
	ldrb r7, [r0]
	movs r1, #0
	mov sb, r1
	ldr r0, _08003344
	ldr r0, [r0]
	cmp r0, #1
	bne _080032B2
	mov r2, r8
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r7, #0
	movs r1, #0
	movs r3, #0
	bl DummiedOutFireRedLeafGreenTileAllocFunc
	mov sb, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	beq _0800333A
_080032B2:
	ldr r3, _08003348
	mov sl, r3
	lsls r0, r7, #2
	adds r1, r0, r3
	ldr r1, [r1]
	str r0, [sp]
	cmp r1, #0
	bne _08003302
	adds r0, r7, #0
	movs r1, #8
	bl GetBgAttribute
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0800334C
	cmp r5, r0
	beq _08003302
	adds r0, r5, #0
	bl AllocZeroed
	adds r4, r0, #0
	cmp r4, #0
	beq _0800333A
	movs r1, #0
	mov r3, sl
	cmp r1, r5
	bge _080032F4
	movs r2, #0
_080032EA:
	adds r0, r4, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, r5
	blt _080032EA
_080032F4:
	ldr r1, [sp]
	adds r0, r1, r3
	str r4, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	bl SetBgTilemapBuffer
_08003302:
	mov r2, r8
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x10
	bl AllocZeroed
	adds r4, r0, #0
	cmp r4, #0
	bne _08003354
	adds r0, r7, #0
	bl GetNumActiveWindowsOnBg
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800333A
	ldr r0, _08003348
	ldr r3, [sp]
	adds r5, r3, r0
	ldr r1, [r5]
	ldr r0, _08003350
	cmp r1, r0
	beq _0800333A
	adds r0, r1, #0
	bl Free
	str r4, [r5]
_0800333A:
	movs r0, #0xff
	b _08003390
	.align 2, 0
_08003340: .4byte 0x02020004
_08003344: .4byte 0x03002FF4
_08003348: .4byte 0x03003010
_0800334C: .4byte 0x0000FFFF
_08003350: .4byte 0x0800308D
_08003354:
	ldr r2, _080033A0
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	str r4, [r0]
	adds r2, r1, r2
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _080033A4
	ldr r0, [r0]
	cmp r0, #1
	bne _0800338E
	mov r0, sb
	strh r0, [r2, #6]
	ldrb r0, [r2, #3]
	ldrb r1, [r2, #4]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r7, #0
	mov r1, sb
	movs r3, #1
	bl DummiedOutFireRedLeafGreenTileAllocFunc
_0800338E:
	adds r0, r6, #0
_08003390:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080033A0: .4byte 0x02020004
_080033A4: .4byte 0x03002FF4
	thumb_func_end AddWindow

	thumb_func_start AddWindowWithoutTileMap
AddWindowWithoutTileMap: @ 0x080033A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r1, _080033FC
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080033CE
_080033B6:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1f
	bhi _080033CE
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080033B6
_080033CE:
	cmp r4, #0x20
	beq _080033F8
	ldrb r6, [r5]
	movs r3, #0
	ldr r0, _08003400
	ldr r0, [r0]
	cmp r0, #1
	bne _08003404
	ldrb r1, [r5, #3]
	ldrb r0, [r5, #4]
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r6, #0
	movs r1, #0
	bl DummiedOutFireRedLeafGreenTileAllocFunc
	adds r3, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _08003404
_080033F8:
	movs r0, #0xff
	b _08003434
	.align 2, 0
_080033FC: .4byte 0x02020004
_08003400: .4byte 0x03002FF4
_08003404:
	ldr r1, _0800343C
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, r0, r1
	ldr r0, [r5]
	ldr r1, [r5, #4]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _08003440
	ldr r0, [r0]
	cmp r0, #1
	bne _08003432
	strh r3, [r2, #6]
	ldrb r0, [r2, #3]
	ldrb r1, [r2, #4]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r6, #0
	adds r1, r3, #0
	movs r3, #1
	bl DummiedOutFireRedLeafGreenTileAllocFunc
_08003432:
	adds r0, r4, #0
_08003434:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800343C: .4byte 0x02020004
_08003440: .4byte 0x03002FF4
	thumb_func_end AddWindowWithoutTileMap

	thumb_func_start RemoveWindow
RemoveWindow: @ 0x08003444
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080034C0
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrb r3, [r4]
	adds r7, r3, #0
	ldr r0, _080034C4
	ldr r0, [r0]
	cmp r0, #1
	bne _08003470
	ldrh r1, [r4, #6]
	ldrb r2, [r4, #3]
	ldrb r0, [r4, #4]
	muls r2, r0, r2
	adds r0, r3, #0
	movs r3, #2
	bl DummiedOutFireRedLeafGreenTileAllocFunc
_08003470:
	ldr r0, _080034C8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, #4]
	adds r0, r7, #0
	bl GetNumActiveWindowsOnBg
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0800349E
	ldr r0, _080034CC
	lsls r1, r7, #2
	adds r4, r1, r0
	ldr r1, [r4]
	ldr r0, _080034D0
	cmp r1, r0
	beq _0800349E
	adds r0, r1, #0
	bl Free
	str r5, [r4]
_0800349E:
	ldr r1, _080034C0
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, #8
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, #0
	beq _080034B8
	bl Free
	movs r0, #0
	str r0, [r4]
_080034B8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080034C0: .4byte 0x02020004
_080034C4: .4byte 0x03002FF4
_080034C8: .4byte 0x0829BEB0
_080034CC: .4byte 0x03003010
_080034D0: .4byte 0x0800308D
	thumb_func_end RemoveWindow

	thumb_func_start FreeAllWindowBuffers
FreeAllWindowBuffers: @ 0x080034D4
	push {r4, r5, r6, lr}
	ldr r4, _0800351C
	movs r5, #3
_080034DA:
	ldr r1, [r4]
	cmp r1, #0
	beq _080034F0
	ldr r0, _08003520
	cmp r1, r0
	beq _080034F0
	adds r0, r1, #0
	bl Free
	movs r0, #0
	str r0, [r4]
_080034F0:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080034DA
	ldr r0, _08003524
	adds r4, r0, #0
	adds r4, #8
	movs r6, #0
	movs r5, #0x1f
_08003502:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800350E
	bl Free
	str r6, [r4]
_0800350E:
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _08003502
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800351C: .4byte 0x03003010
_08003520: .4byte 0x0800308D
_08003524: .4byte 0x02020004
	thumb_func_end FreeAllWindowBuffers

	thumb_func_start CopyWindowToVram
CopyWindowToVram: @ 0x08003528
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r5, r3, #0
	ldr r2, _08003560
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r0, sp
	adds r1, r1, r2
	ldm r1!, {r2, r4, r6}
	stm r0!, {r2, r4, r6}
	mov r0, sp
	ldrb r1, [r0, #3]
	ldrb r0, [r0, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x15
	lsrs r4, r0, #0x10
	cmp r3, #2
	beq _08003574
	cmp r3, #2
	bgt _08003564
	cmp r3, #1
	beq _0800356A
	b _0800359E
	.align 2, 0
_08003560: .4byte 0x02020004
_08003564:
	cmp r5, #3
	beq _08003586
	b _0800359E
_0800356A:
	mov r0, sp
	ldrb r0, [r0]
	bl CopyBgTilemapBufferToVram
	b _0800359E
_08003574:
	mov r0, sp
	ldrb r0, [r0]
	ldr r1, [sp, #8]
	mov r2, sp
	ldrh r3, [r2, #6]
	adds r2, r4, #0
	bl LoadBgTiles
	b _0800359E
_08003586:
	mov r0, sp
	ldrb r0, [r0]
	ldr r1, [sp, #8]
	mov r2, sp
	ldrh r3, [r2, #6]
	adds r2, r4, #0
	bl LoadBgTiles
	mov r0, sp
	ldrb r0, [r0]
	bl CopyBgTilemapBufferToVram
_0800359E:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CopyWindowToVram

	thumb_func_start CopyWindowRectToVram
CopyWindowRectToVram: @ 0x080035A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov ip, r3
	ldr r3, [sp, #0x24]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _08003652
	cmp r3, #0
	beq _08003652
	ldr r2, _080035FC
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	mov r1, sp
	adds r0, r0, r2
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	subs r2, r3, #1
	mov r0, sp
	ldrb r1, [r0, #3]
	adds r3, r2, #0
	muls r3, r1, r3
	subs r0, r1, r4
	adds r3, r3, r0
	ldr r2, [sp, #0x20]
	adds r0, r4, r2
	subs r0, r1, r0
	subs r3, r3, r0
	lsls r3, r3, #5
	mov r0, ip
	muls r0, r1, r0
	adds r4, r0, r4
	cmp r5, #2
	beq _08003610
	cmp r5, #2
	bhi _08003600
	cmp r5, #1
	beq _08003606
	b _08003652
	.align 2, 0
_080035FC: .4byte 0x02020004
_08003600:
	cmp r5, #3
	beq _0800362E
	b _08003652
_08003606:
	mov r0, sp
	ldrb r0, [r0]
	bl CopyBgTilemapBufferToVram
	b _08003652
_08003610:
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r4, #5
	ldr r1, [sp, #8]
	adds r1, r1, r2
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	mov r3, sp
	ldrh r3, [r3, #6]
	adds r3, r3, r4
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl LoadBgTiles
	b _08003652
_0800362E:
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r4, #5
	ldr r1, [sp, #8]
	adds r1, r1, r2
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	mov r3, sp
	ldrh r3, [r3, #6]
	adds r3, r3, r4
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl LoadBgTiles
	mov r0, sp
	ldrb r0, [r0]
	bl CopyBgTilemapBufferToVram
_08003652:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CopyWindowRectToVram

	thumb_func_start PutWindowTilemap
PutWindowTilemap: @ 0x0800365C
	push {r4, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080036B8
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	add r0, sp, #0x10
	adds r1, r1, r2
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	add r0, sp, #0x10
	ldrb r0, [r0]
	movs r1, #0xa
	bl GetBgAttribute
	adds r1, r0, #0
	add r0, sp, #0x10
	ldrh r0, [r0, #6]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	add r0, sp, #0x10
	ldrb r0, [r0]
	add r2, sp, #0x10
	ldrb r2, [r2, #1]
	add r3, sp, #0x10
	ldrb r3, [r3, #2]
	add r4, sp, #0x10
	ldrb r4, [r4, #3]
	str r4, [sp]
	add r4, sp, #0x10
	ldrb r4, [r4, #4]
	str r4, [sp, #4]
	add r4, sp, #0x10
	ldrb r4, [r4, #5]
	str r4, [sp, #8]
	movs r4, #1
	str r4, [sp, #0xc]
	bl WriteSequenceToBgTilemapBuffer
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080036B8: .4byte 0x02020004
	thumb_func_end PutWindowTilemap

	thumb_func_start PutWindowRectTilemapOverridePalette
PutWindowRectTilemapOverridePalette: @ 0x080036BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r4, [sp, #0x44]
	ldr r5, [sp, #0x48]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x1c]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r8, r4
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x20]
	ldr r2, _08003770
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	add r0, sp, #0x10
	adds r1, r1, r2
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	add r0, sp, #0x10
	ldrb r0, [r0]
	movs r1, #0xa
	bl GetBgAttribute
	add r2, sp, #0x10
	adds r1, r2, #0
	ldrb r1, [r1, #3]
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	ldrh r2, [r2, #6]
	adds r1, r1, r2
	add r1, sl
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #0
	cmp r5, r8
	bge _0800375E
	add r4, sp, #0x10
	movs r7, #1
_0800372A:
	ldrb r0, [r4]
	ldrb r2, [r4, #1]
	add r2, sl
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	add r3, sb
	adds r3, r3, r5
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, [sp, #0x1c]
	str r1, [sp]
	str r7, [sp, #4]
	ldr r1, [sp, #0x20]
	str r1, [sp, #8]
	str r7, [sp, #0xc]
	adds r1, r6, #0
	bl WriteSequenceToBgTilemapBuffer
	ldrb r0, [r4, #3]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r5, #1
	cmp r5, r8
	blt _0800372A
_0800375E:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003770: .4byte 0x02020004
	thumb_func_end PutWindowRectTilemapOverridePalette

	thumb_func_start ClearWindowTilemap
ClearWindowTilemap: @ 0x08003774
	push {r4, lr}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080037BC
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	add r0, sp, #0xc
	adds r1, r1, r2
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	add r0, sp, #0xc
	ldrb r0, [r0]
	ldr r1, _080037C0
	ldrb r1, [r1]
	add r2, sp, #0xc
	ldrb r2, [r2, #1]
	add r3, sp, #0xc
	ldrb r3, [r3, #2]
	add r4, sp, #0xc
	ldrb r4, [r4, #3]
	str r4, [sp]
	add r4, sp, #0xc
	ldrb r4, [r4, #4]
	str r4, [sp, #4]
	add r4, sp, #0xc
	ldrb r4, [r4, #5]
	str r4, [sp, #8]
	bl FillBgTilemapBufferRect
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080037BC: .4byte 0x02020004
_080037C0: .4byte 0x03003000
	thumb_func_end ClearWindowTilemap

	thumb_func_start PutWindowRectTilemap
PutWindowRectTilemap: @ 0x080037C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r4, [sp, #0x40]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x1c]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r8, r4
	ldr r2, _08003870
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	add r0, sp, #0x10
	adds r1, r1, r2
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	add r0, sp, #0x10
	ldrb r0, [r0]
	movs r1, #0xa
	bl GetBgAttribute
	add r2, sp, #0x10
	adds r1, r2, #0
	ldrb r1, [r1, #3]
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	ldrh r2, [r2, #6]
	adds r1, r1, r2
	add r1, sl
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #0
	cmp r5, r8
	bge _0800385E
	add r4, sp, #0x10
	movs r7, #1
_0800382A:
	ldrb r0, [r4]
	ldrb r2, [r4, #1]
	add r2, sl
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	add r3, sb
	adds r3, r3, r5
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, [sp, #0x1c]
	str r1, [sp]
	str r7, [sp, #4]
	ldrb r1, [r4, #5]
	str r1, [sp, #8]
	str r7, [sp, #0xc]
	adds r1, r6, #0
	bl WriteSequenceToBgTilemapBuffer
	ldrb r0, [r4, #3]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r5, #1
	cmp r5, r8
	blt _0800382A
_0800385E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003870: .4byte 0x02020004
	thumb_func_end PutWindowRectTilemap

	thumb_func_start BlitBitmapToWindow
BlitBitmapToWindow: @ 0x08003874
	push {r4, r5, lr}
	sub sp, #0x18
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r4, [sp]
	str r5, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r2, #0
	movs r3, #0
	bl BlitBitmapRectToWindow
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BlitBitmapToWindow

	thumb_func_start BlitBitmapRectToWindow
BlitBitmapRectToWindow: @ 0x080038AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r4, [sp, #0x44]
	ldr r5, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	mov r8, r6
	ldr r6, [sp, #0x50]
	mov sb, r6
	ldr r6, [sp, #0x54]
	mov sl, r6
	ldr r6, [sp, #0x58]
	mov ip, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	mov r6, r8
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r8, r6
	mov r6, sb
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov sb, r6
	mov r6, sl
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov sl, r6
	mov r6, ip
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov ip, r6
	str r1, [sp, #0x14]
	ldr r7, _08003960
	lsls r5, r5, #0x10
	ldr r6, _08003964
	lsrs r4, r4, #0x10
	orrs r4, r5
	str r4, [sp, #0x18]
	ldr r1, _08003968
	lsls r5, r0, #1
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp, #0x1c]
	adds r5, r5, r1
	ldrb r0, [r5, #3]
	lsls r0, r0, #3
	add r1, sp, #0x1c
	ldr r4, [r1, #4]
	ands r4, r7
	orrs r4, r0
	str r4, [r1, #4]
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x13
	ands r6, r4
	orrs r6, r0
	str r6, [r1, #4]
	mov r0, r8
	str r0, [sp]
	mov r6, sb
	str r6, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	mov r6, ip
	str r6, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0x14
	bl BlitBitmapRect4Bit
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003960: .4byte 0xFFFF0000
_08003964: .4byte 0x0000FFFF
_08003968: .4byte 0x02020004
	thumb_func_end BlitBitmapRectToWindow

	thumb_func_start BlitBitmapRectToWindowWithColorKey
BlitBitmapRectToWindowWithColorKey: @ 0x0800396C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r4, [sp, #0x48]
	ldr r5, [sp, #0x4c]
	ldr r6, [sp, #0x50]
	mov r8, r6
	ldr r7, [sp, #0x54]
	mov sb, r7
	ldr r6, [sp, #0x58]
	mov sl, r6
	ldr r7, [sp, #0x5c]
	mov ip, r7
	ldr r6, [sp, #0x60]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	mov r7, r8
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov r8, r7
	mov r7, sb
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov sb, r7
	mov r7, sl
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov sl, r7
	mov r7, ip
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov ip, r7
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #0x24]
	str r1, [sp, #0x14]
	lsls r5, r5, #0x10
	ldr r6, _08003A28
	lsrs r4, r4, #0x10
	orrs r4, r5
	str r4, [sp, #0x18]
	ldr r1, _08003A2C
	lsls r5, r0, #1
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp, #0x1c]
	adds r5, r5, r1
	ldrb r0, [r5, #3]
	lsls r0, r0, #3
	add r1, sp, #0x1c
	ldr r4, [r1, #4]
	ldr r7, _08003A30
	ands r4, r7
	orrs r4, r0
	str r4, [r1, #4]
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x13
	ands r6, r4
	orrs r6, r0
	str r6, [r1, #4]
	mov r0, r8
	str r0, [sp]
	mov r6, sb
	str r6, [sp, #4]
	mov r7, sl
	str r7, [sp, #8]
	mov r0, ip
	str r0, [sp, #0xc]
	ldr r6, [sp, #0x24]
	str r6, [sp, #0x10]
	add r0, sp, #0x14
	bl BlitBitmapRect4Bit
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003A28: .4byte 0x0000FFFF
_08003A2C: .4byte 0x02020004
_08003A30: .4byte 0xFFFF0000
	thumb_func_end BlitBitmapRectToWindowWithColorKey

	thumb_func_start FillWindowPixelRect
FillWindowPixelRect: @ 0x08003A34
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov sb, r3
	ldr r3, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	mov r8, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r4, sb
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov sb, r4
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r4, r8
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	ldr r5, _08003AB4
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r5, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp, #8]
	adds r4, r4, r5
	ldrb r0, [r4, #3]
	lsls r0, r0, #3
	ldr r6, _08003AB8
	ldr r5, [sp, #0xc]
	ands r5, r6
	orrs r5, r0
	str r5, [sp, #0xc]
	ldrb r4, [r4, #4]
	lsls r4, r4, #0x13
	ldr r0, _08003ABC
	ands r0, r5
	orrs r0, r4
	str r0, [sp, #0xc]
	mov r0, r8
	str r0, [sp]
	str r1, [sp, #4]
	add r0, sp, #8
	adds r1, r2, #0
	mov r2, sb
	bl FillBitmapRect4Bit
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003AB4: .4byte 0x02020004
_08003AB8: .4byte 0xFFFF0000
_08003ABC: .4byte 0x0000FFFF
	thumb_func_end FillWindowPixelRect

	thumb_func_start CopyToWindowPixelBuffer
CopyToWindowPixelBuffer: @ 0x08003AC0
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r2, r3, #0x10
	cmp r5, #0
	beq _08003AF4
	ldr r1, _08003AF0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	lsls r2, r2, #5
	ldr r1, [r0]
	adds r1, r1, r2
	lsrs r2, r5, #0x11
	adds r0, r6, #0
	bl CpuSet
	b _08003B0C
	.align 2, 0
_08003AF0: .4byte 0x02020004
_08003AF4:
	ldr r1, _08003B14
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	lsls r2, r2, #5
	ldr r1, [r0]
	adds r1, r1, r2
	adds r0, r6, #0
	bl LZ77UnCompWram
_08003B0C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003B14: .4byte 0x02020004
	thumb_func_end CopyToWindowPixelBuffer

	thumb_func_start FillWindowPixelBuffer
FillWindowPixelBuffer: @ 0x08003B18
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r5, _08003B60
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	muls r2, r0, r2
	lsls r0, r1, #0x18
	lsls r3, r1, #0x10
	orrs r0, r3
	lsls r3, r1, #8
	orrs r0, r3
	orrs r0, r1
	str r0, [sp]
	adds r5, #8
	adds r4, r4, r5
	ldr r1, [r4]
	lsls r2, r2, #3
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003B60: .4byte 0x02020004
	thumb_func_end FillWindowPixelBuffer

	thumb_func_start ScrollWindow
ScrollWindow: @ 0x08003B64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _08003C00
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r2
	adds r2, #8
	adds r1, r1, r2
	ldr r5, [r1]
	lsls r7, r3, #0x18
	lsls r0, r3, #0x10
	orrs r7, r0
	lsls r0, r3, #8
	orrs r7, r0
	orrs r7, r3
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldrb r3, [r4, #4]
	lsrs r0, r1, #0x18
	muls r0, r3, r0
	lsls r6, r0, #5
	lsrs r1, r1, #0x18
	mov ip, r1
	mov r0, r8
	cmp r0, #1
	bne _08003BB8
	b _08003D6E
_08003BB8:
	cmp r0, #1
	ble _08003BBE
	b _08003F16
_08003BBE:
	cmp r0, #0
	beq _08003BC4
	b _08003F16
_08003BC4:
	movs r4, #0
	cmp r4, r6
	blt _08003BCC
	b _08003F16
_08003BCC:
	movs r1, #8
	rsbs r1, r1, #0
	mov sb, r1
	movs r2, #7
	mov r8, r2
	mov sl, r5
_08003BD8:
	ldr r3, [sp]
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	adds r0, r3, #0
	mov r2, r8
	ands r0, r2
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003C04
	adds r0, r5, r1
	ldr r0, [r0]
	mov r1, sl
	str r0, [r1]
	b _08003C08
	.align 2, 0
_08003C00: .4byte 0x02020004
_08003C04:
	mov r2, sl
	str r7, [r2]
_08003C08:
	adds r3, #1
	adds r2, r4, #4
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003C34
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003C38
_08003C34:
	adds r0, r5, r2
	str r7, [r0]
_08003C38:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #8
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003C66
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003C6A
_08003C66:
	adds r0, r5, r2
	str r7, [r0]
_08003C6A:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0xc
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003C98
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003C9C
_08003C98:
	adds r0, r5, r2
	str r7, [r0]
_08003C9C:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x10
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003CCA
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003CCE
_08003CCA:
	adds r0, r5, r2
	str r7, [r0]
_08003CCE:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x14
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003CFC
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003D00
_08003CFC:
	adds r0, r5, r2
	str r7, [r0]
_08003D00:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x18
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003D2E
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003D32
_08003D2E:
	adds r0, r5, r2
	str r7, [r0]
_08003D32:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x1c
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	mov r1, r8
	ands r3, r1
	orrs r0, r3
	lsls r0, r0, #2
	adds r1, r4, r0
	cmp r1, r6
	bge _08003D5C
	adds r0, r5, r2
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003D60
_08003D5C:
	adds r0, r5, r2
	str r7, [r0]
_08003D60:
	movs r2, #0x20
	add sl, r2
	adds r4, #0x20
	cmp r4, r6
	bge _08003D6C
	b _08003BD8
_08003D6C:
	b _08003F16
_08003D6E:
	subs r0, r6, #4
	adds r5, r5, r0
	movs r4, #0
	cmp r4, r6
	blt _08003D7A
	b _08003F16
_08003D7A:
	movs r0, #8
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #7
	mov r8, r1
	mov sl, r5
_08003D86:
	ldr r3, [sp]
	adds r0, r3, #0
	mov r2, sb
	ands r0, r2
	mov r1, ip
	muls r1, r0, r1
	adds r0, r3, #0
	mov r2, r8
	ands r0, r2
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003DAC
	subs r0, r5, r1
	ldr r0, [r0]
	mov r1, sl
	str r0, [r1]
	b _08003DB0
_08003DAC:
	mov r2, sl
	str r7, [r2]
_08003DB0:
	adds r3, #1
	adds r2, r4, #4
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003DDC
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003DE0
_08003DDC:
	subs r0, r5, r2
	str r7, [r0]
_08003DE0:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #8
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003E0E
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003E12
_08003E0E:
	subs r0, r5, r2
	str r7, [r0]
_08003E12:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0xc
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003E40
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003E44
_08003E40:
	subs r0, r5, r2
	str r7, [r0]
_08003E44:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x10
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003E72
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003E76
_08003E72:
	subs r0, r5, r2
	str r7, [r0]
_08003E76:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x14
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003EA4
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003EA8
_08003EA4:
	subs r0, r5, r2
	str r7, [r0]
_08003EA8:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x18
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	str r1, [sp, #4]
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, [sp, #4]
	orrs r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	cmp r1, r6
	bge _08003ED6
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003EDA
_08003ED6:
	subs r0, r5, r2
	str r7, [r0]
_08003EDA:
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x1c
	adds r0, r3, #0
	mov r1, sb
	ands r0, r1
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	mov r1, r8
	ands r3, r1
	orrs r0, r3
	lsls r0, r0, #2
	adds r1, r4, r0
	cmp r1, r6
	bge _08003F04
	subs r0, r5, r2
	subs r1, r5, r1
	ldr r1, [r1]
	str r1, [r0]
	b _08003F08
_08003F04:
	subs r0, r5, r2
	str r7, [r0]
_08003F08:
	movs r2, #0x20
	rsbs r2, r2, #0
	add sl, r2
	adds r4, #0x20
	cmp r4, r6
	bge _08003F16
	b _08003D86
_08003F16:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ScrollWindow

	thumb_func_start CallWindowFunction
CallWindowFunction: @ 0x08003F28
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08003F74
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r5, [r1]
	ldr r6, [r1, #4]
	ldrb r0, [r1]
	lsrs r1, r5, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r5, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r5, #0x18
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	lsrs r4, r6, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	bl _call_via_r8
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003F74: .4byte 0x02020004
	thumb_func_end CallWindowFunction

	thumb_func_start SetWindowAttribute
SetWindowAttribute: @ 0x08003F78
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #7
	bhi _08004012
	lsls r0, r0, #2
	ldr r1, _08003F90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003F90: .4byte 0x08003F94
_08003F94: @ jump table
	.4byte _08004012 @ case 0
	.4byte _08003FB4 @ case 1
	.4byte _08003FC8 @ case 2
	.4byte _08004012 @ case 3
	.4byte _08004012 @ case 4
	.4byte _08003FDC @ case 5
	.4byte _08003FF0 @ case 6
	.4byte _08004004 @ case 7
_08003FB4:
	ldr r1, _08003FC4
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r2, [r0, #1]
	movs r0, #0
	b _08004014
	.align 2, 0
_08003FC4: .4byte 0x02020004
_08003FC8:
	ldr r1, _08003FD8
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r2, [r0, #2]
	movs r0, #0
	b _08004014
	.align 2, 0
_08003FD8: .4byte 0x02020004
_08003FDC:
	ldr r1, _08003FEC
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r2, [r0, #5]
	movs r0, #0
	b _08004014
	.align 2, 0
_08003FEC: .4byte 0x02020004
_08003FF0:
	ldr r1, _08004000
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r2, [r0, #6]
	movs r0, #0
	b _08004014
	.align 2, 0
_08004000: .4byte 0x02020004
_08004004:
	ldr r1, _08004018
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	str r2, [r0]
_08004012:
	movs r0, #1
_08004014:
	pop {r1}
	bx r1
	.align 2, 0
_08004018: .4byte 0x02020004
	thumb_func_end SetWindowAttribute

	thumb_func_start GetWindowAttribute
GetWindowAttribute: @ 0x0800401C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #7
	bhi _080040F8
	lsls r0, r0, #2
	ldr r1, _08004034
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08004034: .4byte 0x08004038
_08004038: @ jump table
	.4byte _08004058 @ case 0
	.4byte _0800406C @ case 1
	.4byte _08004080 @ case 2
	.4byte _08004094 @ case 3
	.4byte _080040A8 @ case 4
	.4byte _080040BC @ case 5
	.4byte _080040D0 @ case 6
	.4byte _080040E4 @ case 7
_08004058:
	ldr r0, _08004068
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _080040FA
	.align 2, 0
_08004068: .4byte 0x02020004
_0800406C:
	ldr r0, _0800407C
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #1]
	b _080040FA
	.align 2, 0
_0800407C: .4byte 0x02020004
_08004080:
	ldr r0, _08004090
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	b _080040FA
	.align 2, 0
_08004090: .4byte 0x02020004
_08004094:
	ldr r0, _080040A4
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #3]
	b _080040FA
	.align 2, 0
_080040A4: .4byte 0x02020004
_080040A8:
	ldr r0, _080040B8
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	b _080040FA
	.align 2, 0
_080040B8: .4byte 0x02020004
_080040BC:
	ldr r0, _080040CC
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #5]
	b _080040FA
	.align 2, 0
_080040CC: .4byte 0x02020004
_080040D0:
	ldr r0, _080040E0
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #6]
	b _080040FA
	.align 2, 0
_080040E0: .4byte 0x02020004
_080040E4:
	ldr r0, _080040F4
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	b _080040FA
	.align 2, 0
_080040F4: .4byte 0x02020004
_080040F8:
	movs r0, #0
_080040FA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetWindowAttribute

	thumb_func_start GetNumActiveWindowsOnBg
GetNumActiveWindowsOnBg: @ 0x08004100
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r2, _08004128
	movs r1, #0x1f
_0800410C:
	ldrb r0, [r2]
	cmp r0, r4
	bne _08004118
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_08004118:
	adds r2, #0xc
	subs r1, #1
	cmp r1, #0
	bge _0800410C
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08004128: .4byte 0x02020004
	thumb_func_end GetNumActiveWindowsOnBg

	thumb_func_start nullsub_8
nullsub_8: @ 0x0800412C
	bx lr
	.align 2, 0
	thumb_func_end nullsub_8

	thumb_func_start AddWindow8Bit
AddWindow8Bit: @ 0x08004130
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r6, #0
	ldr r1, _080041F8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800415E
_08004146:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x1f
	bhi _0800415E
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08004146
_0800415E:
	cmp r6, #0x20
	beq _080041F2
	mov r0, sb
	ldrb r7, [r0]
	ldr r1, _080041FC
	mov sl, r1
	lsls r2, r7, #2
	mov r8, r2
	mov r0, r8
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	bne _080041BA
	adds r0, r7, #0
	movs r1, #8
	bl GetBgAttribute
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08004200
	cmp r5, r0
	beq _080041BA
	adds r0, r5, #0
	bl Alloc
	adds r4, r0, #0
	cmp r4, #0
	beq _080041F2
	movs r1, #0
	mov ip, sl
	mov r3, r8
	cmp r1, r5
	bge _080041AC
	movs r2, #0
_080041A2:
	adds r0, r4, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, r5
	blt _080041A2
_080041AC:
	mov r1, ip
	adds r0, r3, r1
	str r4, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	bl SetBgTilemapBuffer
_080041BA:
	mov r2, sb
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x10
	bl Alloc
	adds r4, r0, #0
	cmp r4, #0
	bne _08004208
	adds r0, r7, #0
	bl GetNumActiveWindowsOnBg8Bit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080041F2
	ldr r0, _080041FC
	lsls r1, r7, #2
	adds r5, r1, r0
	ldr r1, [r5]
	ldr r0, _08004204
	cmp r1, r0
	beq _080041F2
	adds r0, r1, #0
	bl Free
	str r4, [r5]
_080041F2:
	movs r0, #0xff
	b _08004226
	.align 2, 0
_080041F8: .4byte 0x02020004
_080041FC: .4byte 0x03003010
_08004200: .4byte 0x0000FFFF
_08004204: .4byte 0x0800412D
_08004208:
	ldr r1, _08004234
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r0, #8
	adds r0, r2, r0
	str r4, [r0]
	adds r2, r2, r1
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [r2]
	str r1, [r2, #4]
	adds r0, r6, #0
_08004226:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004234: .4byte 0x02020004
	thumb_func_end AddWindow8Bit

	thumb_func_start FillWindowPixelBuffer8Bit
FillWindowPixelBuffer8Bit: @ 0x08004238
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r6, _08004274
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r4, r1, #2
	adds r0, r4, r6
	ldrb r1, [r0, #3]
	ldrb r0, [r0, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x16
	lsrs r3, r0, #0x10
	movs r2, #0
	cmp r2, r3
	bge _0800426E
	adds r0, r6, #0
	adds r0, #8
	adds r1, r4, r0
_08004262:
	ldr r0, [r1]
	adds r0, r0, r2
	strb r5, [r0]
	adds r2, #1
	cmp r2, r3
	blt _08004262
_0800426E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004274: .4byte 0x02020004
	thumb_func_end FillWindowPixelBuffer8Bit

	thumb_func_start FillWindowPixelRect8Bit
FillWindowPixelRect8Bit: @ 0x08004278
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov sb, r3
	ldr r3, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	mov r8, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r4, sb
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov sb, r4
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r4, r8
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	ldr r5, _080042F8
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r5, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp, #8]
	adds r4, r4, r5
	ldrb r0, [r4, #3]
	lsls r0, r0, #3
	ldr r6, _080042FC
	ldr r5, [sp, #0xc]
	ands r5, r6
	orrs r5, r0
	str r5, [sp, #0xc]
	ldrb r4, [r4, #4]
	lsls r4, r4, #0x13
	ldr r0, _08004300
	ands r0, r5
	orrs r0, r4
	str r0, [sp, #0xc]
	mov r0, r8
	str r0, [sp]
	str r1, [sp, #4]
	add r0, sp, #8
	adds r1, r2, #0
	mov r2, sb
	bl FillBitmapRect8Bit
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080042F8: .4byte 0x02020004
_080042FC: .4byte 0xFFFF0000
_08004300: .4byte 0x0000FFFF
	thumb_func_end FillWindowPixelRect8Bit

	thumb_func_start BlitBitmapRectToWindow4BitTo8Bit
BlitBitmapRectToWindow4BitTo8Bit: @ 0x08004304
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r4, [sp, #0x4c]
	ldr r5, [sp, #0x50]
	ldr r6, [sp, #0x54]
	mov r8, r6
	ldr r7, [sp, #0x58]
	mov sb, r7
	ldr r6, [sp, #0x5c]
	mov sl, r6
	ldr r7, [sp, #0x60]
	mov ip, r7
	ldr r6, [sp, #0x64]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	mov r7, r8
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov r8, r7
	mov r7, sb
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov sb, r7
	mov r7, sl
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov sl, r7
	mov r7, ip
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	mov ip, r7
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #0x28]
	str r1, [sp, #0x18]
	lsls r5, r5, #0x10
	ldr r6, _080043C4
	lsrs r4, r4, #0x10
	orrs r4, r5
	str r4, [sp, #0x1c]
	ldr r1, _080043C8
	lsls r5, r0, #1
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp, #0x20]
	adds r5, r5, r1
	ldrb r0, [r5, #3]
	lsls r0, r0, #3
	add r1, sp, #0x20
	ldr r4, [r1, #4]
	ldr r7, _080043CC
	ands r4, r7
	orrs r4, r0
	str r4, [r1, #4]
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x13
	ands r6, r4
	orrs r6, r0
	str r6, [r1, #4]
	mov r0, r8
	str r0, [sp]
	mov r6, sb
	str r6, [sp, #4]
	mov r7, sl
	str r7, [sp, #8]
	mov r0, ip
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r6, [sp, #0x28]
	str r6, [sp, #0x14]
	add r0, sp, #0x18
	bl BlitBitmapRect4BitTo8Bit
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080043C4: .4byte 0x0000FFFF
_080043C8: .4byte 0x02020004
_080043CC: .4byte 0xFFFF0000
	thumb_func_end BlitBitmapRectToWindow4BitTo8Bit

	thumb_func_start CopyWindowToVram8Bit
CopyWindowToVram8Bit: @ 0x080043D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	adds r5, r2, #0
	ldr r6, _08004404
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08004408
	adds r3, r1, r0
	str r3, [r6]
	ldr r4, _0800440C
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	muls r0, r1, r0
	lsls r0, r0, #6
	strh r0, [r4]
	cmp r2, #2
	beq _0800441E
	cmp r2, #2
	bgt _08004410
	cmp r2, #1
	beq _08004416
	b _08004440
	.align 2, 0
_08004404: .4byte 0x02020184
_08004408: .4byte 0x02020004
_0800440C: .4byte 0x02020188
_08004410:
	cmp r5, #3
	beq _0800442C
	b _08004440
_08004416:
	ldrb r0, [r3]
	bl CopyBgTilemapBufferToVram
	b _08004440
_0800441E:
	ldrb r0, [r3]
	ldr r1, [r3, #8]
	ldrh r2, [r4]
	ldrh r3, [r3, #6]
	bl LoadBgTiles
	b _08004440
_0800442C:
	ldrb r0, [r3]
	ldr r1, [r3, #8]
	ldrh r2, [r4]
	ldrh r3, [r3, #6]
	bl LoadBgTiles
	ldr r0, [r6]
	ldrb r0, [r0]
	bl CopyBgTilemapBufferToVram
_08004440:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CopyWindowToVram8Bit

	thumb_func_start GetNumActiveWindowsOnBg8Bit
GetNumActiveWindowsOnBg8Bit: @ 0x08004448
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r2, _08004470
	movs r1, #0x1f
_08004454:
	ldrb r0, [r2]
	cmp r0, r4
	bne _08004460
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_08004460:
	adds r2, #0xc
	subs r1, #1
	cmp r1, #0
	bge _08004454
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08004470: .4byte 0x02020004
	thumb_func_end GetNumActiveWindowsOnBg8Bit

