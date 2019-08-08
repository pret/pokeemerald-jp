.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SpriteCB_ResetRtcCursor0
SpriteCB_ResetRtcCursor0: @ 0x0809E1C0
	push {lr}
	adds r3, r0, #0
	ldr r2, _0809E1F0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	movs r2, #0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0809E2D6
	strh r1, [r3, #0x30]
	subs r0, r1, #1
	cmp r0, #5
	bhi _0809E2D6
	lsls r0, r0, #2
	ldr r1, _0809E1F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809E1F0: .4byte 0x03005B60
_0809E1F4: .4byte 0x0809E1F8
_0809E1F8: @ jump table
	.4byte _0809E210 @ case 0
	.4byte _0809E234 @ case 1
	.4byte _0809E258 @ case 2
	.4byte _0809E27C @ case 3
	.4byte _0809E2A6 @ case 4
	.4byte _0809E2D0 @ case 5
_0809E210:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x40
	b _0809E29E
_0809E234:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x60
	b _0809E29E
_0809E258:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x78
	b _0809E29E
_0809E27C:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x90
_0809E29E:
	strh r0, [r3, #0x20]
	movs r0, #0x44
	strh r0, [r3, #0x22]
	b _0809E2D6
_0809E2A6:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #2
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x42
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x9b
	strh r0, [r3, #0x20]
	movs r0, #0x50
	strh r0, [r3, #0x22]
	b _0809E2D6
_0809E2D0:
	adds r0, r3, #0
	bl DestroySprite
_0809E2D6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_ResetRtcCursor0

	thumb_func_start SpriteCB_ResetRtcCursor1
SpriteCB_ResetRtcCursor1: @ 0x0809E2DC
	push {lr}
	adds r3, r0, #0
	ldr r2, _0809E30C
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	movs r2, #0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0809E3D6
	strh r1, [r3, #0x30]
	subs r0, r1, #1
	cmp r0, #5
	bhi _0809E3D6
	lsls r0, r0, #2
	ldr r1, _0809E310
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809E30C: .4byte 0x03005B60
_0809E310: .4byte 0x0809E314
_0809E314: @ jump table
	.4byte _0809E32C @ case 0
	.4byte _0809E350 @ case 1
	.4byte _0809E374 @ case 2
	.4byte _0809E398 @ case 3
	.4byte _0809E3C2 @ case 4
	.4byte _0809E3D0 @ case 5
_0809E32C:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x40
	b _0809E3BA
_0809E350:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x60
	b _0809E3BA
_0809E374:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x78
	b _0809E3BA
_0809E398:
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	subs r2, #0x12
	ldrb r1, [r2]
	subs r0, #0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x90
_0809E3BA:
	strh r0, [r3, #0x20]
	movs r0, #0x5c
	strh r0, [r3, #0x22]
	b _0809E3D6
_0809E3C2:
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _0809E3D6
_0809E3D0:
	adds r0, r3, #0
	bl DestroySprite
_0809E3D6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_ResetRtcCursor1

	thumb_func_start CreateCursor
CreateCursor: @ 0x0809E3DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0809E44C
	bl LoadSpritePalette
	ldr r0, _0809E450
	mov r8, r0
	movs r1, #0x40
	movs r2, #0x44
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0809E454
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x1c
	adds r2, r0, r4
	ldr r1, _0809E458
	str r1, [r2]
	adds r0, r0, r6
	strh r5, [r0, #0x2e]
	ldr r1, _0809E45C
	strh r1, [r0, #0x30]
	mov r0, r8
	movs r1, #0x40
	movs r2, #0x44
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r4
	ldr r1, _0809E460
	str r1, [r4]
	adds r0, r0, r6
	strh r5, [r0, #0x2e]
	movs r1, #1
	rsbs r1, r1, #0
	strh r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E44C: .4byte 0x084E8B14
_0809E450: .4byte 0x084E8B40
_0809E454: .4byte 0x020205AC
_0809E458: .4byte 0x0809E1C1
_0809E45C: .4byte 0x0000FFFF
_0809E460: .4byte 0x0809E2DD
	thumb_func_end CreateCursor

	thumb_func_start FreeCursorPalette
FreeCursorPalette: @ 0x0809E464
	push {lr}
	ldr r0, _0809E474
	ldrh r0, [r0, #4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0809E474: .4byte 0x084E8B14
	thumb_func_end FreeCursorPalette

	thumb_func_start HideChooseTimeWindow
HideChooseTimeWindow: @ 0x0809E478
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	adds r0, r4, #0
	bl RemoveWindow
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end HideChooseTimeWindow

	thumb_func_start PrintTime
PrintTime: @ 0x0809E49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	adds r0, r1, #0
	mov sb, r2
	adds r1, r3, #0
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	ldr r2, [sp, #0x38]
	mov r8, r2
	mov r2, sl
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r0, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0xc]
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r2, r8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r7, _0809E57C
	ldr r4, _0809E580
	adds r0, r4, #0
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	adds r0, r7, #0
	adds r1, r4, #0
	bl StringCopy
	adds r7, r0, #0
	ldr r1, _0809E584
	bl StringCopy
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r7, #0
	adds r1, r4, #0
	bl StringCopy
	adds r7, r0, #0
	ldr r5, _0809E588
	adds r1, r5, #0
	bl StringCopy
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	adds r0, r7, #0
	adds r1, r4, #0
	bl StringCopy
	adds r7, r0, #0
	adds r1, r5, #0
	bl StringCopy
	adds r7, r0, #0
	adds r0, r4, #0
	mov r1, r8
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	adds r0, r7, #0
	adds r1, r4, #0
	bl StringCopy
	ldr r2, _0809E57C
	mov r0, sb
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	mov r0, sl
	movs r1, #1
	ldr r3, [sp, #0xc]
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
_0809E57C: .4byte 0x02021C7C
_0809E580: .4byte 0x02021C40
_0809E584: .4byte 0x084E8A6C
_0809E588: .4byte 0x084E8A6F
	thumb_func_end PrintTime

	thumb_func_start ShowChooseTimeWindow
ShowChooseTimeWindow: @ 0x0809E58C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r4, r0, #0
	mov sb, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, [sp, #0x24]
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	str r5, [sp]
	str r6, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	mov r3, sb
	bl PrintTime
	ldr r2, _0809E60C
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0x80
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E60C: .4byte 0x084E8A71
	thumb_func_end ShowChooseTimeWindow

	thumb_func_start MoveTimeUpDown
MoveTimeUpDown: @ 0x0809E610
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r1, r3, #0
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0809E62A
	ldrh r0, [r4]
	subs r0, #1
	b _0809E644
_0809E62A:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _0809E638
	ldrh r0, [r4]
	adds r0, #1
	b _0809E662
_0809E638:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0809E652
	ldrh r0, [r4]
	subs r0, #0xa
_0809E644:
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bge _0809E66E
	strh r2, [r4]
	b _0809E66E
_0809E652:
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0809E65E
	movs r0, #0
	b _0809E670
_0809E65E:
	ldrh r0, [r4]
	adds r0, #0xa
_0809E662:
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _0809E66E
	strh r5, [r4]
_0809E66E:
	movs r0, #1
_0809E670:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MoveTimeUpDown

	thumb_func_start Task_ResetRtc_3
Task_ResetRtc_3: @ 0x0809E678
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0809E68C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1, #8]
	bx lr
	.align 2, 0
_0809E68C: .4byte 0x03005B60
	thumb_func_end Task_ResetRtc_3

	thumb_func_start Task_ResetRtc_2
Task_ResetRtc_2: @ 0x0809E690
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _0809E6B8
	adds r0, r4, r5
	ldrb r0, [r0, #0x10]
	bl HideChooseTimeWindow
	bl FreeCursorPalette
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _0809E6BC
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E6B8: .4byte 0x03005B68
_0809E6BC: .4byte 0x0809E679
	thumb_func_end Task_ResetRtc_2

	thumb_func_start Task_ResetRtc_1
Task_ResetRtc_1: @ 0x0809E6C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r7, r0, #3
	ldr r0, _0809E704
	mov r8, r0
	adds r5, r7, r0
	ldrb r4, [r5, #4]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0809E708
	adds r2, r0, r1
	ldr r1, _0809E70C
	ldrh r3, [r1, #0x2e]
	movs r0, #2
	ands r0, r3
	mov ip, r1
	cmp r0, #0
	beq _0809E714
	mov r0, r8
	subs r0, #8
	adds r0, r7, r0
	ldr r1, _0809E710
	str r1, [r0]
	movs r0, #0
	strh r0, [r5, #2]
	movs r0, #6
	b _0809E734
	.align 2, 0
_0809E704: .4byte 0x03005B68
_0809E708: .4byte 0x084E8A6C
_0809E70C: .4byte 0x03002360
_0809E710: .4byte 0x0809E691
_0809E714:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0809E722
	ldrb r0, [r2, #7]
	cmp r0, #0
	bne _0809E734
_0809E722:
	mov r3, ip
	ldrh r1, [r3, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809E73E
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _0809E73E
_0809E734:
	strh r0, [r5, #4]
	movs r0, #5
	bl PlaySE
	b _0809E7CC
_0809E73E:
	cmp r4, #5
	bne _0809E78C
	mov r0, ip
	ldrh r1, [r0, #0x2e]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E7CC
	ldr r1, _0809E780
	ldrh r0, [r5, #6]
	strh r0, [r1]
	ldrh r0, [r5, #8]
	strb r0, [r1, #2]
	ldrh r0, [r5, #0xa]
	strb r0, [r1, #3]
	ldrh r0, [r5, #0xc]
	strb r0, [r1, #4]
	movs r0, #5
	bl PlaySE
	ldr r1, _0809E784
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0809E788
	str r1, [r0]
	strh r4, [r5, #2]
	movs r0, #6
	strh r0, [r5, #4]
	b _0809E7CC
	.align 2, 0
_0809E780: .4byte 0x03005A50
_0809E784: .4byte 0x03005B60
_0809E788: .4byte 0x0809E691
_0809E78C:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r2, #2]
	ldrh r2, [r2, #4]
	mov r3, ip
	ldrh r4, [r3, #0x30]
	movs r3, #0xc0
	ands r3, r4
	bl MoveTimeUpDown
	cmp r0, #0
	beq _0809E7CC
	movs r0, #5
	bl PlaySE
	ldrb r0, [r5, #0x10]
	ldrh r3, [r5, #6]
	ldrb r1, [r5, #8]
	str r1, [sp]
	ldrb r1, [r5, #0xa]
	str r1, [sp, #4]
	ldrb r1, [r5, #0xc]
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #2
	bl PrintTime
	ldrb r0, [r5, #0x10]
	movs r1, #2
	bl CopyWindowToVram
_0809E7CC:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Task_ResetRtc_1

	thumb_func_start Task_ResetRtc_0
Task_ResetRtc_0: @ 0x0809E7D8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r6, r0, #2
	add r6, r8
	lsls r6, r6, #3
	ldr r0, _0809E850
	mov sb, r0
	adds r5, r6, r0
	movs r0, #0
	strh r0, [r5]
	ldr r1, _0809E854
	ldrh r0, [r1]
	strh r0, [r5, #6]
	movs r0, #2
	ldrsb r0, [r1, r0]
	strh r0, [r5, #8]
	movs r0, #3
	ldrsb r0, [r1, r0]
	strh r0, [r5, #0xa]
	movs r0, #4
	ldrsb r0, [r1, r0]
	strh r0, [r5, #0xc]
	ldr r0, _0809E858
	bl AddWindow
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #6]
	ldrb r2, [r5, #8]
	ldrb r3, [r5, #0xa]
	ldrb r4, [r5, #0xc]
	str r4, [sp]
	bl ShowChooseTimeWindow
	mov r0, r8
	bl CreateCursor
	movs r0, #2
	strh r0, [r5, #4]
	movs r0, #8
	rsbs r0, r0, #0
	add sb, r0
	add r6, sb
	ldr r0, _0809E85C
	str r0, [r6]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E850: .4byte 0x03005B68
_0809E854: .4byte 0x03005A50
_0809E858: .4byte 0x084E8A64
_0809E85C: .4byte 0x0809E6C1
	thumb_func_end Task_ResetRtc_0

	thumb_func_start CB2_InitResetRtcScreen
CB2_InitResetRtcScreen: @ 0x0809E860
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl SetVBlankCallback
	movs r2, #0xa0
	lsls r2, r2, #0x13
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0809E908
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _0809E90C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	movs r3, #0xc0
	lsls r3, r3, #9
	mov r4, sp
	movs r6, #0
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _0809E910
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_0809E8A2:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, r2, r5
	subs r3, r3, r5
	cmp r3, r5
	bhi _0809E8A2
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	lsrs r0, r3, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	movs r1, #0x80
	bl ResetOamRange
	bl LoadOam
	bl ScanlineEffect_Stop
	bl ScanlineEffect_Clear
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	bl sub_0809E920
	ldr r0, _0809E914
	bl SetVBlankCallback
	ldr r0, _0809E918
	bl SetMainCallback2
	ldr r0, _0809E91C
	movs r1, #0x50
	bl CreateTask
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E908: .4byte 0x040000D4
_0809E90C: .4byte 0x81000200
_0809E910: .4byte 0x81000800
_0809E914: .4byte 0x0809E985
_0809E918: .4byte 0x0809E969
_0809E91C: .4byte 0x0809EAD9
	thumb_func_end CB2_InitResetRtcScreen

	thumb_func_start sub_0809E920
sub_0809E920: @ 0x0809E920
	push {lr}
	bl clear_scheduled_bg_copies_to_vram
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0809E960
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	ldr r0, _0809E964
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl sub_08196F98
	pop {r0}
	bx r0
	.align 2, 0
_0809E960: .4byte 0x084E8A48
_0809E964: .4byte 0x084E8A4C
	thumb_func_end sub_0809E920

	thumb_func_start CB2_ResetRtcScreen
CB2_ResetRtcScreen: @ 0x0809E968
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_ResetRtcScreen

	thumb_func_start sub_0809E984
sub_0809E984: @ 0x0809E984
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0809E984

	thumb_func_start ShowMessage
ShowMessage: @ 0x0809E998
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	movs r0, #1
	movs r1, #0
	movs r3, #0xf
	bl DrawDialogFrameWithCustomTileAndPalette
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ShowMessage

	thumb_func_start Task_ShowResetRtcPrompt
Task_ShowResetRtcPrompt: @ 0x0809E9D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _0809E9F0
	adds r6, r0, r1
	movs r0, #0
	ldrsh r5, [r6, r0]
	cmp r5, #0
	beq _0809E9F4
	cmp r5, #1
	beq _0809EA8A
	b _0809EAD0
	.align 2, 0
_0809E9F0: .4byte 0x03005B68
_0809E9F4:
	movs r2, #0x85
	lsls r2, r2, #2
	movs r0, #0
	movs r1, #0
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, _0809EAA4
	movs r0, #2
	str r0, [sp]
	movs r4, #0xff
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r1, _0809EAA8
	ldrh r3, [r1]
	ldrb r0, [r1, #2]
	str r0, [sp]
	ldrb r0, [r1, #3]
	str r0, [sp, #4]
	ldrb r0, [r1, #4]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x12
	bl PrintTime
	ldr r2, _0809EAAC
	movs r0, #0x22
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, _0809EAB0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xa0
	ldrh r3, [r0]
	adds r0, #2
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, #0
	adds r0, #0xa3
	ldrb r0, [r0]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r0, #0xa4
	ldrb r0, [r0]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x32
	bl PrintTime
	ldr r0, _0809EAB4
	bl ShowMessage
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
_0809EA8A:
	ldr r0, _0809EAB8
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809EABC
	adds r0, r7, #0
	bl DestroyTask
	bl DoSoftReset
	b _0809EAD0
	.align 2, 0
_0809EAA4: .4byte 0x085CBEE9
_0809EAA8: .4byte 0x03005A50
_0809EAAC: .4byte 0x085CBEF9
_0809EAB0: .4byte 0x03005AF0
_0809EAB4: .4byte 0x085CBECB
_0809EAB8: .4byte 0x03002360
_0809EABC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EAD0
	movs r0, #5
	bl PlaySE
	adds r0, r7, #0
	bl DestroyTask
_0809EAD0:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Task_ShowResetRtcPrompt

	thumb_func_start Task_ResetRtcScreen
Task_ResetRtcScreen: @ 0x0809EAD8
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0809EB00
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #6
	bls _0809EAF4
	b _0809ECDC
_0809EAF4:
	lsls r0, r0, #2
	ldr r1, _0809EB04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809EB00: .4byte 0x03005B68
_0809EB04: .4byte 0x0809EB08
_0809EB08: @ jump table
	.4byte _0809EB24 @ case 0
	.4byte _0809EB40 @ case 1
	.4byte _0809EB8C @ case 2
	.4byte _0809EBE8 @ case 3
	.4byte _0809EC70 @ case 4
	.4byte _0809ECA0 @ case 5
	.4byte _0809ECC2 @ case 6
_0809EB24:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0809EB3C
	str r1, [sp]
	movs r1, #1
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	strh r0, [r5]
	b _0809ECDC
	.align 2, 0
_0809EB3C: .4byte 0x0000FFFF
_0809EB40:
	ldr r0, _0809EB68
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809EB4E
	b _0809ECDC
_0809EB4E:
	ldr r0, _0809EB6C
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809EB5A
	cmp r0, #2
	bne _0809EB74
_0809EB5A:
	ldr r0, _0809EB70
	bl ShowMessage
	movs r0, #5
	strh r0, [r5]
	b _0809ECDC
	.align 2, 0
_0809EB68: .4byte 0x02037C74
_0809EB6C: .4byte 0x03005F50
_0809EB70: .4byte 0x085CBF69
_0809EB74:
	bl RtcCalcLocalTime
	ldr r0, _0809EB88
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #2]
	b _0809EC0C
	.align 2, 0
_0809EB88: .4byte 0x0809E9D1
_0809EB8C:
	ldr r2, _0809EBD4
	movs r0, #2
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _0809EBA2
	b _0809ECDC
_0809EBA2:
	movs r0, #0
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldr r0, _0809EBD8
	bl ShowMessage
	ldr r2, _0809EBDC
	ldr r0, _0809EBE0
	ldr r0, [r0]
	adds r0, #0xa0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _0809EBE4
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #2]
	movs r0, #3
	strh r0, [r5]
	b _0809ECDC
	.align 2, 0
_0809EBD4: .4byte 0x03005B60
_0809EBD8: .4byte 0x085CBF09
_0809EBDC: .4byte 0x03005A50
_0809EBE0: .4byte 0x03005AF0
_0809EBE4: .4byte 0x0809E7D9
_0809EBE8:
	ldr r2, _0809EC14
	movs r0, #2
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0809ECDC
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0809EC18
	ldrb r0, [r5, #2]
	bl DestroyTask
_0809EC0C:
	movs r0, #2
	strh r0, [r5]
	b _0809ECDC
	.align 2, 0
_0809EC14: .4byte 0x03005B60
_0809EC18:
	ldrb r0, [r5, #2]
	bl DestroyTask
	bl RtcReset
	ldr r4, _0809EC60
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #2
	ldrsb r1, [r4, r1]
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #4
	ldrsb r3, [r4, r3]
	bl RtcCalcLocalTimeOffset
	ldr r0, _0809EC64
	ldr r2, [r0]
	adds r2, #0xa0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _0809EC68
	ldrh r1, [r4]
	bl VarSet
	bl DisableResetRTC
	ldr r0, _0809EC6C
	bl ShowMessage
	movs r0, #4
	strh r0, [r5]
	b _0809ECDC
	.align 2, 0
_0809EC60: .4byte 0x03005A50
_0809EC64: .4byte 0x03005AF0
_0809EC68: .4byte 0x00004040
_0809EC6C: .4byte 0x085CBF1C
_0809EC70:
	movs r0, #0
	bl TrySavingData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EC90
	ldr r0, _0809EC8C
	bl ShowMessage
	movs r0, #0x49
	bl PlaySE
	b _0809EC9C
	.align 2, 0
_0809EC8C: .4byte 0x085CBF43
_0809EC90:
	ldr r0, _0809ECE4
	bl ShowMessage
	movs r0, #0x16
	bl PlaySE
_0809EC9C:
	movs r0, #5
	strh r0, [r5]
_0809ECA0:
	ldr r0, _0809ECE8
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809ECDC
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0809ECEC
	str r1, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #6
	strh r0, [r5]
_0809ECC2:
	ldr r0, _0809ECF0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0809ECDC
	adds r0, r4, #0
	bl DestroyTask
	bl FreeAllWindowBuffers
	bl DoSoftReset
_0809ECDC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809ECE4: .4byte 0x085CBF52
_0809ECE8: .4byte 0x03002360
_0809ECEC: .4byte 0x0000FFFF
_0809ECF0: .4byte 0x02037C74
	thumb_func_end Task_ResetRtcScreen

