.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081C9080
sub_081C9080: @ 0x081C9080
	push {r4, lr}
	movs r4, #0
_081C9084:
	adds r0, r4, #0
	bl sub_081CA86C
	ldr r1, _081C90B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #0x14]
	cmp r0, r1
	bne _081C90C0
	adds r0, r4, #0
	bl sub_081CA5B4
	cmp r0, #0
	beq _081C90C0
	ldr r0, _081C90B8
	ldr r0, [r0]
	ldr r1, _081C90BC
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _081C90C0
	movs r0, #1
	b _081C90C8
	.align 2, 0
_081C90B4: .4byte 0x02036FB8
_081C90B8: .4byte 0x03005AEC
_081C90BC: .4byte 0x000009CA
_081C90C0:
	adds r4, #1
	cmp r4, #0x4d
	ble _081C9084
	movs r0, #0
_081C90C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C9080

	thumb_func_start sub_081C90D0
sub_081C90D0: @ 0x081C90D0
	push {lr}
	bl sub_081C9104
	adds r1, r0, #0
	cmp r1, #0
	beq _081C90E4
	movs r0, #0
	strb r0, [r1, #0xd]
	movs r0, #1
	b _081C90E6
_081C90E4:
	movs r0, #0
_081C90E6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C90D0

	thumb_func_start sub_081C90EC
sub_081C90EC: @ 0x081C90EC
	push {lr}
	bl sub_081C9104
	adds r1, r0, #0
	cmp r1, #0
	beq _081C90FE
	movs r0, #1
	strb r0, [r1, #0xd]
	b _081C9100
_081C90FE:
	movs r0, #0
_081C9100:
	pop {r1}
	bx r1
	thumb_func_end sub_081C90EC

	thumb_func_start sub_081C9104
sub_081C9104: @ 0x081C9104
	push {r4, lr}
	ldr r1, _081C9130
	movs r0, #2
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081C9126
	movs r0, #0
	strb r0, [r4, #0xc]
	ldr r0, _081C9134
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	ldr r0, _081C9138
	str r0, [r4]
_081C9126:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081C9130: .4byte 0x0000088C
_081C9134: .4byte 0x081C91BD
_081C9138: .4byte 0x081C91A9
	thumb_func_end sub_081C9104

	thumb_func_start sub_081C913C
sub_081C913C: @ 0x081C913C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #2
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, _081C9164
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r5, #4]
	ldr r0, _081C9168
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C9164: .4byte 0x085F2708
_081C9168: .4byte 0x081C91A9
	thumb_func_end sub_081C913C

	thumb_func_start sub_081C916C
sub_081C916C: @ 0x081C916C
	push {lr}
	movs r0, #2
	bl GetSubstructPtr
	ldr r0, [r0]
	bl _call_via_r0
	pop {r1}
	thumb_func_end sub_081C916C

	thumb_func_start sub_081C917C
sub_081C917C: @ 0x081C917C
	bx r1
	.align 2, 0
	thumb_func_end sub_081C917C

	thumb_func_start sub_081C9180
sub_081C9180: @ 0x081C9180
	push {r4, lr}
	movs r0, #2
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_081C9FA0
	ldrb r0, [r4, #8]
	bl RemoveWindow
	bl sub_081C9798
	bl sub_081CA140
	movs r0, #2
	bl FreePokenavSubstruct
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081C9180

	thumb_func_start sub_081C91A8
sub_081C91A8: @ 0x081C91A8
	push {lr}
	movs r0, #2
	bl GetSubstructPtr
	ldr r0, [r0, #4]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C91A8

	thumb_func_start sub_081C91BC
sub_081C91BC: @ 0x081C91BC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #2
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #9
	bls _081C91D0
	b _081C940C
_081C91D0:
	lsls r0, r4, #2
	ldr r1, _081C91DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C91DC: .4byte 0x081C91E0
_081C91E0: @ jump table
	.4byte _081C9208 @ case 0
	.4byte _081C9298 @ case 1
	.4byte _081C92DC @ case 2
	.4byte _081C9334 @ case 3
	.4byte _081C934A @ case 4
	.4byte _081C9350 @ case 5
	.4byte _081C9362 @ case 6
	.4byte _081C936C @ case 7
	.4byte _081C93BA @ case 8
	.4byte _081C93F8 @ case 9
_081C9208:
	ldr r0, _081C9288
	movs r1, #3
	bl InitBgTemplates
	ldr r1, _081C928C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	adds r1, r5, #0
	adds r1, #0x8c
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, _081C9290
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	ldr r0, _081C9294
	movs r1, #0x10
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
_081C9282:
	movs r0, #0
	b _081C940E
	.align 2, 0
_081C9288: .4byte 0x085F26FC
_081C928C: .4byte 0x085F1730
_081C9290: .4byte 0x085F1780
_081C9294: .4byte 0x085F1710
_081C9298:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081C92A6
	b _081C9408
_081C92A6:
	ldr r1, _081C92D0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081C92D4
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _081C92D8
	movs r1, #0x20
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	b _081C9282
	.align 2, 0
_081C92D0: .4byte 0x085F1858
_081C92D4: .4byte 0x085F1AE0
_081C92D8: .4byte 0x085F1838
_081C92DC:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081C92EA
	b _081C9408
_081C92EA:
	ldr r1, _081C9328
	str r0, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081C932C
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _081C9330
	movs r1, #0x30
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	bl sub_081C9040
	cmp r0, #3
	beq _081C9322
	bl sub_081C9040
	cmp r0, #4
	bne _081C9282
_081C9322:
	bl sub_081C9FFC
	b _081C9282
	.align 2, 0
_081C9328: .4byte 0x085F165C
_081C932C: .4byte 0x085F1670
_081C9330: .4byte 0x085F163C
_081C9334:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C9408
	bl sub_081C9E8C
	bl sub_081C9F80
_081C9346:
	movs r0, #1
	b _081C940E
_081C934A:
	bl sub_081C9770
	b _081C9346
_081C9350:
	bl sub_081C9EC0
	bl sub_081C97D8
	bl sub_081C9DEC
	bl sub_081C9874
	b _081C9282
_081C9362:
	bl sub_081C9F70
	cmp r0, #0
	bne _081C9408
	b _081C9346
_081C936C:
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	beq _081C938C
	movs r0, #1
	bl sub_081C7280
	b _081C9398
_081C938C:
	movs r0, #0x6e
	bl PlaySE
	movs r0, #3
	bl sub_081C7280
_081C9398:
	bl sub_081C9040
	cmp r0, #3
	beq _081C93AA
	cmp r0, #4
	bne _081C93B2
	movs r0, #7
	bl LoadLeftHeaderGfxForIndex
_081C93AA:
	movs r0, #1
	bl LoadLeftHeaderGfxForIndex
	b _081C9282
_081C93B2:
	movs r0, #0
	bl LoadLeftHeaderGfxForIndex
	b _081C9282
_081C93BA:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081C9408
	bl sub_081C9040
	cmp r0, #3
	beq _081C93D8
	cmp r0, #4
	bne _081C93E4
	movs r0, #7
	movs r1, #0
	movs r2, #0
	bl sub_081C7748
_081C93D8:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_081C7748
	b _081C93EE
_081C93E4:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_081C7748
_081C93EE:
	bl sub_081C99B8
	bl sub_081CA0D8
	b _081C9346
_081C93F8:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C9408
	bl sub_081C77B8
	cmp r0, #0
	beq _081C940C
_081C9408:
	movs r0, #2
	b _081C940E
_081C940C:
	movs r0, #4
_081C940E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C91BC

	thumb_func_start sub_081C9418
sub_081C9418: @ 0x081C9418
	push {lr}
	cmp r0, #0
	beq _081C9424
	cmp r0, #1
	beq _081C943A
	b _081C944E
_081C9424:
	bl sub_081CA1E8
	bl sub_081C9A24
	bl sub_081C9EC0
	movs r0, #5
	bl PlaySE
	movs r0, #0
	b _081C9450
_081C943A:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C944A
	bl sub_081C9F70
	cmp r0, #0
	beq _081C944E
_081C944A:
	movs r0, #2
	b _081C9450
_081C944E:
	movs r0, #4
_081C9450:
	pop {r1}
	bx r1
	thumb_func_end sub_081C9418

	thumb_func_start sub_081C9454
sub_081C9454: @ 0x081C9454
	push {lr}
	cmp r0, #1
	beq _081C9488
	cmp r0, #1
	bgt _081C9464
	cmp r0, #0
	beq _081C946E
	b _081C94E8
_081C9464:
	cmp r0, #2
	beq _081C94A6
	cmp r0, #3
	beq _081C94C0
	b _081C94E8
_081C946E:
	bl sub_081CA174
	bl sub_081C9A88
	movs r0, #0
	movs r1, #0
	bl sub_081C776C
	movs r0, #5
	bl PlaySE
	movs r0, #0
	b _081C94EA
_081C9488:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C94E0
	bl sub_081C77B8
	cmp r0, #0
	bne _081C94E0
	bl sub_081C9874
	movs r0, #1
	bl LoadLeftHeaderGfxForIndex
	movs r0, #0
	b _081C94EA
_081C94A6:
	bl sub_081C99B8
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_081C7748
	bl sub_081C9FC4
	bl sub_081C9EC0
	movs r0, #0
	b _081C94EA
_081C94C0:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C94E0
	bl sub_081C77B8
	cmp r0, #0
	bne _081C94E0
	bl sub_081CA048
	cmp r0, #0
	bne _081C94E0
	bl sub_081C9F70
	cmp r0, #0
	beq _081C94E4
_081C94E0:
	movs r0, #2
	b _081C94EA
_081C94E4:
	bl sub_081CA184
_081C94E8:
	movs r0, #4
_081C94EA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C9454

	thumb_func_start sub_081C94F0
sub_081C94F0: @ 0x081C94F0
	push {lr}
	cmp r0, #1
	beq _081C951E
	cmp r0, #1
	bgt _081C9500
	cmp r0, #0
	beq _081C950A
	b _081C957E
_081C9500:
	cmp r0, #2
	beq _081C953C
	cmp r0, #3
	beq _081C9556
	b _081C957E
_081C950A:
	bl sub_081CA174
	bl sub_081C9A88
	movs r0, #1
	movs r1, #0
	bl sub_081C776C
	movs r0, #0
	b _081C9580
_081C951E:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C9576
	bl sub_081C77B8
	cmp r0, #0
	bne _081C9576
	bl sub_081C9874
	movs r0, #0
	bl LoadLeftHeaderGfxForIndex
	movs r0, #0
	b _081C9580
_081C953C:
	bl sub_081C99B8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_081C7748
	bl sub_081CA010
	bl sub_081C9EC0
	movs r0, #0
	b _081C9580
_081C9556:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C9576
	bl sub_081C77B8
	cmp r0, #0
	bne _081C9576
	bl sub_081CA048
	cmp r0, #0
	bne _081C9576
	bl sub_081C9F70
	cmp r0, #0
	beq _081C957A
_081C9576:
	movs r0, #2
	b _081C9580
_081C957A:
	bl sub_081CA184
_081C957E:
	movs r0, #4
_081C9580:
	pop {r1}
	bx r1
	thumb_func_end sub_081C94F0

	thumb_func_start sub_081C9584
sub_081C9584: @ 0x081C9584
	push {lr}
	cmp r0, #1
	beq _081C95B0
	cmp r0, #1
	bgt _081C9594
	cmp r0, #0
	beq _081C959E
	b _081C95FC
_081C9594:
	cmp r0, #2
	beq _081C95C6
	cmp r0, #3
	beq _081C95DC
	b _081C95FC
_081C959E:
	bl sub_081CA174
	bl sub_081C9A88
	movs r0, #5
	bl PlaySE
	movs r0, #0
	b _081C95FE
_081C95B0:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C95F4
	movs r0, #7
	bl LoadLeftHeaderGfxForIndex
	bl sub_081C9874
	movs r0, #0
	b _081C95FE
_081C95C6:
	bl sub_081C99B8
	movs r0, #7
	movs r1, #0
	movs r2, #0
	bl sub_081C7748
	bl sub_081C9EC0
	movs r0, #0
	b _081C95FE
_081C95DC:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C95F4
	bl sub_081C77B8
	cmp r0, #0
	bne _081C95F4
	bl sub_081CA048
	cmp r0, #0
	beq _081C95F8
_081C95F4:
	movs r0, #2
	b _081C95FE
_081C95F8:
	bl sub_081CA184
_081C95FC:
	movs r0, #4
_081C95FE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C9584

	thumb_func_start sub_081C9604
sub_081C9604: @ 0x081C9604
	push {lr}
	cmp r0, #1
	beq _081C9632
	cmp r0, #1
	bgt _081C9614
	cmp r0, #0
	beq _081C961E
	b _081C966E
_081C9614:
	cmp r0, #2
	beq _081C964A
	cmp r0, #3
	beq _081C9656
	b _081C966E
_081C961E:
	bl sub_081CA174
	bl sub_081C9A88
	movs r0, #7
	movs r1, #0
	bl sub_081C776C
	movs r0, #0
	b _081C9670
_081C9632:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C9666
	bl sub_081C77B8
	cmp r0, #0
	bne _081C9666
	bl sub_081C9874
	movs r0, #0
	b _081C9670
_081C964A:
	bl sub_081C99B8
	bl sub_081C9EC0
	movs r0, #0
	b _081C9670
_081C9656:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C9666
	bl sub_081CA048
	cmp r0, #0
	beq _081C966A
_081C9666:
	movs r0, #2
	b _081C9670
_081C966A:
	bl sub_081CA184
_081C966E:
	movs r0, #4
_081C9670:
	pop {r1}
	bx r1
	thumb_func_end sub_081C9604

	thumb_func_start sub_081C9674
sub_081C9674: @ 0x081C9674
	push {lr}
	cmp r0, #0
	beq _081C9680
	cmp r0, #1
	beq _081C968E
	b _081C969C
_081C9680:
	movs r0, #0x20
	bl PlaySE
	bl sub_081C9F1C
	movs r0, #0
	b _081C969E
_081C968E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C969C
	movs r0, #2
	b _081C969E
_081C969C:
	movs r0, #4
_081C969E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C9674

	thumb_func_start sub_081C96A4
sub_081C96A4: @ 0x081C96A4
	push {lr}
	cmp r0, #0
	beq _081C96B0
	cmp r0, #1
	beq _081C96BE
	b _081C96CC
_081C96B0:
	movs r0, #5
	bl PlaySE
	bl sub_081C9EC0
	movs r0, #0
	b _081C96CE
_081C96BE:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C96CC
	movs r0, #2
	b _081C96CE
_081C96CC:
	movs r0, #4
_081C96CE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C96A4

	thumb_func_start sub_081C96D4
sub_081C96D4: @ 0x081C96D4
	push {lr}
	cmp r0, #1
	beq _081C96FE
	cmp r0, #1
	bgt _081C96E4
	cmp r0, #0
	beq _081C96EE
	b _081C9768
_081C96E4:
	cmp r0, #2
	beq _081C9742
	cmp r0, #3
	beq _081C975C
	b _081C9768
_081C96EE:
	bl sub_081C9070
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_081C7364
	movs r0, #0
	b _081C976A
_081C96FE:
	bl sub_081C73A8
	cmp r0, #0
	bne _081C9764
	bl sub_081C7040
	bl sub_081CA174
	bl sub_081C9A88
	bl sub_081C9040
	cmp r0, #3
	beq _081C9726
	cmp r0, #4
	bne _081C9730
	movs r0, #7
	movs r1, #0
	bl sub_081C776C
_081C9726:
	movs r0, #1
	movs r1, #0
	bl sub_081C776C
	b _081C9738
_081C9730:
	movs r0, #0
	movs r1, #0
	bl sub_081C776C
_081C9738:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	b _081C976A
_081C9742:
	bl sub_081C9AD0
	cmp r0, #0
	bne _081C9764
	bl sub_081C77B8
	cmp r0, #0
	bne _081C9764
	movs r0, #0
	bl sub_081C7280
	movs r0, #0
	b _081C976A
_081C975C:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	beq _081C9768
_081C9764:
	movs r0, #2
	b _081C976A
_081C9768:
	movs r0, #4
_081C976A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C96D4

	thumb_func_start sub_081C9770
sub_081C9770: @ 0x081C9770
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _081C9790
_081C9776:
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #8
	adds r5, #1
	cmp r5, #1
	bls _081C9776
	ldr r0, _081C9794
	bl Pokenav_AllocAndLoadPalettes
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C9790: .4byte 0x085F272C
_081C9794: .4byte 0x085F273C
	thumb_func_end sub_081C9770

	thumb_func_start sub_081C9798
sub_081C9798: @ 0x081C9798
	push {lr}
	movs r0, #3
	bl FreeSpriteTilesByTag
	movs r0, #1
	bl FreeSpriteTilesByTag
	movs r0, #4
	bl FreeSpritePaletteByTag
	movs r0, #5
	bl FreeSpritePaletteByTag
	movs r0, #6
	bl FreeSpritePaletteByTag
	movs r0, #7
	bl FreeSpritePaletteByTag
	movs r0, #8
	bl FreeSpritePaletteByTag
	movs r0, #3
	bl FreeSpritePaletteByTag
	bl sub_081C9840
	bl sub_081C9E44
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9798

	thumb_func_start sub_081C97D8
sub_081C97D8: @ 0x081C97D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #2
	bl GetSubstructPtr
	movs r2, #0
	adds r0, #0x2c
	mov r8, r0
_081C97EA:
	movs r4, #0
	lsls r0, r2, #2
	lsls r1, r2, #4
	adds r7, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #0x12
	movs r2, #0xa0
	lsls r2, r2, #0xe
	adds r5, r0, r2
	mov r0, r8
	adds r6, r1, r0
_081C9800:
	ldr r0, _081C9838
	movs r1, #0x8c
	asrs r2, r5, #0x10
	movs r3, #3
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081C983C
	adds r1, r1, r0
	stm r6!, {r1}
	lsls r0, r4, #5
	strh r0, [r1, #0x24]
	adds r4, #1
	cmp r4, #3
	ble _081C9800
	adds r2, r7, #0
	cmp r2, #5
	ble _081C97EA
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C9838: .4byte 0x085F28B4
_081C983C: .4byte 0x020205AC
	thumb_func_end sub_081C97D8

	thumb_func_start sub_081C9840
sub_081C9840: @ 0x081C9840
	push {r4, r5, r6, r7, lr}
	movs r0, #2
	bl GetSubstructPtr
	movs r1, #0
	adds r7, r0, #0
	adds r7, #0x2c
_081C984E:
	lsls r0, r1, #4
	adds r6, r1, #1
	adds r4, r0, r7
	movs r5, #3
_081C9856:
	ldr r0, [r4]
	bl FreeSpriteOamMatrix
	ldm r4!, {r0}
	bl DestroySprite
	subs r5, #1
	cmp r5, #0
	bge _081C9856
	adds r1, r6, #0
	cmp r1, #5
	ble _081C984E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081C9840

	thumb_func_start sub_081C9874
sub_081C9874: @ 0x081C9874
	push {lr}
	bl sub_081C9040
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	ldr r1, _081C9894
	adds r0, r2, r1
	subs r1, #4
	adds r2, r2, r1
	ldrh r1, [r2]
	ldrh r2, [r2, #2]
	bl sub_081C9898
	pop {r0}
	bx r0
	.align 2, 0
_081C9894: .4byte 0x085F27AC
	thumb_func_end sub_081C9874

	thumb_func_start sub_081C9898
sub_081C9898: @ 0x081C9898
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	str r1, [sp, #0x14]
	str r2, [sp]
	movs r0, #2
	bl GetSubstructPtr
	mov sl, r0
	movs r0, #3
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r1, #0
_081C98C0:
	ldr r0, [r6]
	cmp r0, #0
	beq _081C995C
	movs r5, #0
	lsls r2, r1, #4
	mov r0, sl
	adds r0, #0x2c
	lsls r3, r1, #2
	mov sb, r3
	movs r4, #0x10
	add r4, sl
	mov r8, r4
	adds r7, r6, #4
	str r7, [sp, #0xc]
	ldr r3, [sp, #0x14]
	ldr r4, [sp]
	adds r3, r3, r4
	str r3, [sp, #8]
	adds r1, #1
	str r1, [sp, #0x10]
	adds r4, r2, r0
_081C98EA:
	ldr r3, [r4]
	ldr r0, [r6]
	ldrh r2, [r0]
	ldr r7, [sp, #4]
	adds r2, r2, r7
	lsls r0, r5, #3
	adds r2, r2, r0
	ldr r1, _081C9954
	adds r0, r1, #0
	ands r2, r0
	ldrh r0, [r3, #4]
	ldr r7, _081C9958
	adds r1, r7, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl IndexOfSpritePaletteTag
	ldr r3, [r4]
	lsls r0, r0, #4
	ldrb r2, [r3, #5]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #5]
	ldr r2, [r4]
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r4]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0x22]
	ldr r1, [r4]
	movs r0, #0x8c
	strh r0, [r1, #0x20]
	ldm r4!, {r1}
	lsls r0, r5, #5
	strh r0, [r1, #0x24]
	adds r5, #1
	cmp r5, #3
	ble _081C98EA
	mov r1, r8
	add r1, sb
	movs r0, #1
	b _081C9998
	.align 2, 0
_081C9954: .4byte 0x000003FF
_081C9958: .4byte 0xFFFFFC00
_081C995C:
	lsls r2, r1, #4
	mov r0, sl
	adds r0, #0x2c
	lsls r3, r1, #2
	mov sb, r3
	movs r4, #0x10
	add r4, sl
	mov r8, r4
	adds r6, #4
	str r6, [sp, #0xc]
	ldr r7, [sp, #0x14]
	ldr r3, [sp]
	adds r7, r7, r3
	str r7, [sp, #8]
	adds r1, #1
	str r1, [sp, #0x10]
	movs r3, #4
	adds r2, r2, r0
	movs r5, #3
_081C9982:
	ldm r2!, {r1}
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r5, #1
	cmp r5, #0
	bge _081C9982
	mov r1, r8
	add r1, sb
	movs r0, #0
_081C9998:
	str r0, [r1]
	ldr r6, [sp, #0xc]
	ldr r4, [sp, #8]
	str r4, [sp, #0x14]
	ldr r1, [sp, #0x10]
	cmp r1, #5
	ble _081C98C0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9898

	thumb_func_start sub_081C99B8
sub_081C99B8: @ 0x081C99B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #2
	bl GetSubstructPtr
	adds r6, r0, #0
	bl sub_081C9050
	mov r8, r0
	movs r7, #0
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0x2c
_081C99D4:
	lsls r0, r5, #2
	adds r1, r6, #0
	adds r1, #0x10
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _081C9A08
	adds r0, r7, #0
	adds r7, #1
	cmp r0, r8
	bne _081C99F0
	movs r2, #0x82
	strb r5, [r6, #0xb]
	b _081C99F2
_081C99F0:
	movs r2, #0x8c
_081C99F2:
	adds r0, r4, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0xc
	bl sub_081C9B08
	adds r0, r4, #0
	movs r1, #0
	bl sub_081C9BF4
	b _081C9A10
_081C9A08:
	adds r0, r4, #0
	movs r1, #1
	bl sub_081C9BF4
_081C9A10:
	adds r4, #0x10
	adds r5, #1
	cmp r5, #5
	ble _081C99D4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C99B8

	thumb_func_start sub_081C9A24
sub_081C9A24: @ 0x081C9A24
	push {r4, r5, lr}
	movs r0, #2
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_081C9050
	adds r3, r0, #0
	movs r2, #0
	movs r5, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _081C9A44
	cmp r5, r3
	beq _081C9A5E
_081C9A42:
	adds r5, #1
_081C9A44:
	adds r2, #1
	cmp r2, #5
	bgt _081C9A5E
	lsls r0, r2, #2
	adds r1, r4, #0
	adds r1, #0x10
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _081C9A44
	cmp r5, r3
	bne _081C9A42
	adds r5, r2, #0
_081C9A5E:
	ldrb r0, [r4, #0xb]
	lsls r0, r0, #4
	adds r0, #0x2c
	adds r0, r4, r0
	movs r1, #0x82
	movs r2, #0x8c
	movs r3, #4
	bl sub_081C9B08
	lsls r0, r5, #4
	adds r0, #0x2c
	adds r0, r4, r0
	movs r1, #0x8c
	movs r2, #0x82
	movs r3, #4
	bl sub_081C9B08
	strb r5, [r4, #0xb]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081C9A24

	thumb_func_start sub_081C9A88
sub_081C9A88: @ 0x081C9A88
	push {r4, r5, r6, lr}
	movs r0, #2
	bl GetSubstructPtr
	adds r6, r0, #0
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0x2c
_081C9A98:
	lsls r0, r5, #2
	adds r1, r6, #0
	adds r1, #0x10
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _081C9AC2
	ldrb r0, [r6, #0xb]
	cmp r0, r5
	beq _081C9ABC
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #8
	bl sub_081C9B08
	b _081C9AC2
_081C9ABC:
	adds r0, r4, #0
	bl sub_081C9B60
_081C9AC2:
	adds r4, #0x10
	adds r5, #1
	cmp r5, #5
	ble _081C9A98
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081C9A88

	thumb_func_start sub_081C9AD0
sub_081C9AD0: @ 0x081C9AD0
	push {r4, lr}
	movs r0, #2
	bl GetSubstructPtr
	adds r3, r0, #0
	movs r2, #0
	ldr r4, _081C9AFC
	adds r1, r3, #0
	adds r1, #0x2c
_081C9AE2:
	ldr r0, [r1]
	ldr r0, [r0, #0x1c]
	cmp r0, r4
	bne _081C9B00
	adds r1, #0x10
	adds r2, #1
	cmp r2, #5
	ble _081C9AE2
	ldrb r0, [r3, #0xc]
	cmp r0, #0
	bne _081C9B00
	movs r0, #0
	b _081C9B02
	.align 2, 0
_081C9AFC: .4byte 0x08007141
_081C9B00:
	movs r0, #1
_081C9B02:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081C9AD0

	thumb_func_start sub_081C9B08
sub_081C9B08: @ 0x081C9B08
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov sb, r2
	adds r6, r3, #0
	ldr r0, _081C9B5C
	mov r8, r0
	subs r0, r2, r5
	lsls r0, r0, #4
	adds r1, r6, #0
	bl __divsi3
	adds r3, r0, #0
	movs r1, #3
	lsls r2, r5, #4
_081C9B2C:
	ldr r0, [r4]
	strh r5, [r0, #0x20]
	ldr r0, [r4]
	strh r6, [r0, #0x2e]
	ldr r0, [r4]
	strh r3, [r0, #0x30]
	ldr r0, [r4]
	strh r2, [r0, #0x32]
	ldr r0, [r4]
	mov r7, sb
	strh r7, [r0, #0x3c]
	ldm r4!, {r0}
	mov r7, r8
	str r7, [r0, #0x1c]
	subs r1, #1
	cmp r1, #0
	bge _081C9B2C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C9B5C: .4byte 0x081C9C21
	thumb_func_end sub_081C9B08

	thumb_func_start sub_081C9B60
sub_081C9B60: @ 0x081C9B60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #2
	bl GetSubstructPtr
	adds r7, r0, #0
	movs r5, #0
	mov r8, r5
_081C9B74:
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r2, #1]
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, [r4]
	ldr r0, _081C9BE8
	str r0, [r1, #0x1c]
	movs r6, #8
	strh r6, [r1, #0x2e]
	ldr r0, [r4]
	mov r1, r8
	strh r1, [r0, #0x30]
	ldr r0, [r4]
	strh r5, [r0, #0x3c]
	ldr r0, [r4]
	bl InitSpriteAffineAnim
	ldm r4!, {r0}
	movs r1, #0
	bl StartSpriteAffineAnim
	adds r5, #1
	cmp r5, #3
	ble _081C9B74
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	ldr r0, _081C9BEC
	movs r1, #3
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081C9BF0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r6, [r1, #8]
	ldrb r0, [r7, #0xc]
	adds r0, #1
	strb r0, [r7, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C9BE8: .4byte 0x081C9C59
_081C9BEC: .4byte 0x081C9D2D
_081C9BF0: .4byte 0x03005B60
	thumb_func_end sub_081C9B60

	thumb_func_start sub_081C9BF4
sub_081C9BF4: @ 0x081C9BF4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #1
	ands r1, r0
	lsls r4, r1, #2
	movs r6, #5
	rsbs r6, r6, #0
	movs r3, #3
_081C9C04:
	ldm r5!, {r0}
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r1, r6, #0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	subs r3, #1
	cmp r3, #0
	bge _081C9C04
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9BF4

	thumb_func_start sub_081C9C20
sub_081C9C20: @ 0x081C9C20
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _081C9C46
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x32]
	adds r0, r0, r1
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x20]
	b _081C9C4E
_081C9C46:
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x20]
	ldr r0, _081C9C54
	str r0, [r2, #0x1c]
_081C9C4E:
	pop {r0}
	bx r0
	.align 2, 0
_081C9C54: .4byte 0x08007141
	thumb_func_end sub_081C9C20

	thumb_func_start sub_081C9C58
sub_081C9C58: @ 0x081C9C58
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _081C9D20
	movs r0, #0x30
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _081C9C8E
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	strh r5, [r4, #0x24]
	b _081C9D24
_081C9C8E:
	ldrh r0, [r4, #0x32]
	adds r0, #0x10
	strh r0, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	asrs r1, r0, #3
	adds r0, r1, #0
	subs r0, #0x20
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #1
	beq _081C9CC4
	cmp r0, #1
	bgt _081C9CB6
	cmp r0, #0
	beq _081C9CC0
	b _081C9CD2
_081C9CB6:
	cmp r0, #2
	beq _081C9CC8
	cmp r0, #3
	beq _081C9CCC
	b _081C9CD2
_081C9CC0:
	rsbs r1, r1, #0
	b _081C9CCC
_081C9CC4:
	rsbs r0, r1, #0
	b _081C9CD0
_081C9CC8:
	strh r1, [r4, #0x24]
	b _081C9CD2
_081C9CCC:
	lsls r0, r1, #1
	adds r0, r0, r1
_081C9CD0:
	strh r0, [r4, #0x24]
_081C9CD2:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081C9D24
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r1, [r4, #1]
	lsrs r1, r1, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	adds r0, r4, #0
	movs r3, #0
	bl CalcCenterToCornerVec
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldr r0, _081C9D1C
	str r0, [r4, #0x1c]
	b _081C9D24
	.align 2, 0
_081C9D1C: .4byte 0x08007141
_081C9D20:
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
_081C9D24:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9C58

	thumb_func_start sub_081C9D2C
sub_081C9D2C: @ 0x081C9D2C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C9D54
	adds r4, r0, r1
	ldrh r0, [r4]
	movs r1, #0
	ldrsh r2, [r4, r1]
	cmp r2, #0
	bne _081C9DE0
	movs r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _081C9D58
	cmp r1, #1
	beq _081C9D78
	b _081C9DE4
	.align 2, 0
_081C9D54: .4byte 0x03005B68
_081C9D58:
	movs r0, #0x10
	strh r0, [r4, #4]
	strh r2, [r4, #6]
	movs r1, #0xfc
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	b _081C9DE4
_081C9D78:
	ldrh r0, [r4, #8]
	ands r1, r0
	cmp r1, #0
	beq _081C9D90
	ldrh r0, [r4, #4]
	subs r0, #3
	strh r0, [r4, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _081C9DA2
	strh r2, [r4, #4]
	b _081C9DA2
_081C9D90:
	ldrh r0, [r4, #6]
	adds r0, #3
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _081C9DA2
	movs r0, #0x10
	strh r0, [r4, #6]
_081C9DA2:
	ldrh r1, [r4, #6]
	lsls r1, r1, #8
	ldrh r0, [r4, #4]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _081C9DE4
	movs r0, #2
	bl GetSubstructPtr
	ldrb r1, [r0, #0xc]
	subs r1, #1
	strb r1, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyTask
	b _081C9DE4
_081C9DE0:
	subs r0, #1
	strh r0, [r4]
_081C9DE4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9D2C

	thumb_func_start sub_081C9DEC
sub_081C9DEC: @ 0x081C9DEC
	push {r4, lr}
	movs r0, #2
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C9E24
	movs r1, #0x10
	movs r2, #0x60
	movs r3, #4
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081C9E28
	adds r1, r1, r0
	str r1, [r4, #0x28]
	bl sub_081C9080
	cmp r0, #0
	beq _081C9E30
	ldr r1, [r4, #0x28]
	ldr r0, _081C9E2C
	str r0, [r1, #0x1c]
	b _081C9E3C
	.align 2, 0
_081C9E24: .4byte 0x085F28D4
_081C9E28: .4byte 0x020205AC
_081C9E2C: .4byte 0x081C9E59
_081C9E30:
	ldr r0, [r4, #0x28]
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_081C9E3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9DEC

	thumb_func_start sub_081C9E44
sub_081C9E44: @ 0x081C9E44
	push {lr}
	movs r0, #2
	bl GetSubstructPtr
	ldr r0, [r0, #0x28]
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9E44

	thumb_func_start sub_081C9E58
sub_081C9E58: @ 0x081C9E58
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _081C9E86
	movs r0, #0
	strh r0, [r3, #0x2e]
	adds r3, #0x3e
	ldrb r2, [r3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_081C9E86:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9E58

	thumb_func_start sub_081C9E8C
sub_081C9E8C: @ 0x081C9E8C
	push {r4, lr}
	movs r0, #2
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C9EBC
	bl AddWindow
	strh r0, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	ldrb r0, [r4, #8]
	movs r1, #0x66
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #8]
	movs r1, #3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C9EBC: .4byte 0x085F2834
	thumb_func_end sub_081C9E8C

	thumb_func_start sub_081C9EC0
sub_081C9EC0: @ 0x081C9EC0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	movs r0, #2
	bl GetSubstructPtr
	adds r5, r0, #0
	bl sub_081C9060
	ldr r1, _081C9F14
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r6, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	adds r1, r6, #0
	bl GetStringWidth
	adds r4, r0, #0
	ldrb r0, [r5, #8]
	movs r1, #0x66
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #8]
	movs r2, #0xb0
	subs r2, r2, r4
	lsrs r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _081C9F18
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized3
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C9F14: .4byte 0x085F283C
_081C9F18: .4byte 0x085F2874
	thumb_func_end sub_081C9EC0

	thumb_func_start sub_081C9F1C
sub_081C9F1C: @ 0x081C9F1C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	movs r0, #2
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r6, _081C9F68
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	adds r1, r6, #0
	bl GetStringWidth
	adds r4, r0, #0
	ldrb r0, [r5, #8]
	movs r1, #0x66
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #8]
	movs r2, #0xb0
	subs r2, r2, r4
	lsrs r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _081C9F6C
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized3
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C9F68: .4byte 0x085CB5DC
_081C9F6C: .4byte 0x085F2877
	thumb_func_end sub_081C9F1C

	thumb_func_start sub_081C9F70
sub_081C9F70: @ 0x081C9F70
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C9F70

	thumb_func_start sub_081C9F80
sub_081C9F80: @ 0x081C9F80
	push {r4, lr}
	movs r0, #2
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C9F9C
	movs r1, #2
	bl CreateTask
	strb r0, [r4, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C9F9C: .4byte 0x081C9FB5
	thumb_func_end sub_081C9F80

	thumb_func_start sub_081C9FA0
sub_081C9FA0: @ 0x081C9FA0
	push {lr}
	movs r0, #2
	bl GetSubstructPtr
	ldrb r0, [r0, #0xa]
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C9FA0

	thumb_func_start sub_081C9FB4
sub_081C9FB4: @ 0x081C9FB4
	push {lr}
	movs r0, #3
	movs r1, #0x80
	movs r2, #1
	bl ChangeBgX
	pop {r0}
	bx r0
	thumb_func_end sub_081C9FB4

	thumb_func_start sub_081C9FC4
sub_081C9FC4: @ 0x081C9FC4
	push {r4, r5, lr}
	ldr r0, _081C9FF4
	movs r1, #3
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _081C9FF8
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	bl SetWordTaskArg
	adds r5, #0xc
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	bl SetWordTaskArg
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C9FF4: .4byte 0x081CA05D
_081C9FF8: .4byte 0x085F163E
	thumb_func_end sub_081C9FC4

	thumb_func_start sub_081C9FFC
sub_081C9FFC: @ 0x081C9FFC
	push {lr}
	ldr r0, _081CA00C
	movs r1, #0x31
	movs r2, #4
	bl CopyPaletteIntoBufferUnfaded
	pop {r0}
	bx r0
	.align 2, 0
_081CA00C: .4byte 0x085F164A
	thumb_func_end sub_081C9FFC

	thumb_func_start sub_081CA010
sub_081CA010: @ 0x081CA010
	push {r4, r5, lr}
	ldr r0, _081CA040
	movs r1, #3
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _081CA044
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	bl SetWordTaskArg
	subs r5, #0xc
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	bl SetWordTaskArg
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CA040: .4byte 0x081CA05D
_081CA044: .4byte 0x085F164A
	thumb_func_end sub_081CA010

	thumb_func_start sub_081CA048
sub_081CA048: @ 0x081CA048
	push {lr}
	ldr r0, _081CA058
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081CA058: .4byte 0x081CA05D
	thumb_func_end sub_081CA048

	thumb_func_start sub_081CA05C
sub_081CA05C: @ 0x081CA05C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #3
	ldr r0, _081CA0BC
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #1
	bl GetWordTaskArg
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #3
	bl GetWordTaskArg
	adds r1, r0, #0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #0xc
	bl sub_081C717C
	add r0, sp, #8
	movs r1, #0x31
	movs r2, #4
	bl LoadPalette
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xc
	bne _081CA0B4
	adds r0, r6, #0
	bl DestroyTask
_081CA0B4:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CA0BC: .4byte 0x03005B68
	thumb_func_end sub_081CA05C

	thumb_func_start sub_081CA0C0
sub_081CA0C0: @ 0x081CA0C0
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CA0C0

	thumb_func_start sub_081CA0D8
sub_081CA0D8: @ 0x081CA0D8
	push {lr}
	movs r0, #0x50
	movs r1, #0x90
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuRegBits
	movs r0, #0x4a
	movs r1, #0x1f
	bl SetGpuRegBits
	movs r0, #0x44
	movs r1, #0xa0
	bl SetGpuRegBits
	bl ScanlineEffect_Stop
	bl sub_081CA1E8
	ldr r2, _081CA134
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [r2, #8]
	bl ScanlineEffect_SetParams
	ldr r0, _081CA138
	bl InitKeys_
	ldr r0, _081CA13C
	movs r1, #3
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081CA134: .4byte 0x085F28EC
_081CA138: .4byte 0x081CA0C1
_081CA13C: .4byte 0x081CA199
	thumb_func_end sub_081CA0D8

	thumb_func_start sub_081CA140
sub_081CA140: @ 0x081CA140
	push {lr}
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
	bl ScanlineEffect_Stop
	ldr r0, _081CA170
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	bl SetPokenavVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_081CA170: .4byte 0x081CA199
	thumb_func_end sub_081CA140

	thumb_func_start sub_081CA174
sub_081CA174: @ 0x081CA174
	push {lr}
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CA174

	thumb_func_start sub_081CA184
sub_081CA184: @ 0x081CA184
	push {lr}
	bl sub_081CA1E8
	movs r0, #0x50
	movs r1, #0x90
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CA184

	thumb_func_start sub_081CA198
sub_081CA198: @ 0x081CA198
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081CA1E0
	adds r2, r1, r0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _081CA1DC
	movs r0, #0
	strh r0, [r2]
	ldrh r0, [r2, #2]
	adds r0, #3
	movs r1, #0x7f
	ands r0, r1
	strh r0, [r2, #2]
	ldr r1, _081CA1E4
	movs r3, #2
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x54
	bl SetGpuReg
_081CA1DC:
	pop {r0}
	bx r0
	.align 2, 0
_081CA1E0: .4byte 0x03005B68
_081CA1E4: .4byte 0x082FA8CC
	thumb_func_end sub_081CA198

	thumb_func_start sub_081CA1E8
sub_081CA1E8: @ 0x081CA1E8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	bl sub_081C9040
	adds r4, r0, #0
	bl sub_081C9050
	ldr r2, _081CA274
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r2, [r1, #2]
	adds r4, r2, #0
	muls r4, r0, r4
	ldrh r1, [r1]
	adds r4, r4, r1
	subs r4, #8
	mov r0, sp
	movs r6, #0
	strh r6, [r0]
	ldr r5, _081CA278
	ldr r0, _081CA27C
	mov r8, r0
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r6, [r0]
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r1, r1, r5
	mov sb, r1
	mov r2, r8
	bl CpuSet
	add r0, sp, #4
	ldr r1, _081CA280
	adds r6, r1, #0
	strh r6, [r0]
	lsls r4, r4, #1
	adds r5, r4, r5
	ldr r1, _081CA284
	mov r8, r1
	adds r1, r5, #0
	mov r2, r8
	bl CpuSet
	mov r0, sp
	adds r0, #6
	strh r6, [r0]
	add r4, sb
	adds r1, r4, #0
	mov r2, r8
	bl CpuSet
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CA274: .4byte 0x085F27A8
_081CA278: .4byte 0x020388C8
_081CA27C: .4byte 0x010000A0
_081CA280: .4byte 0x000072F0
_081CA284: .4byte 0x01000010
	thumb_func_end sub_081CA1E8

	thumb_func_start sub_081CA288
sub_081CA288: @ 0x081CA288
	push {lr}
	bl sub_081CA174
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CA288

