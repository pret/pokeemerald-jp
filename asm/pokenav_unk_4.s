.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081CAA04
sub_081CAA04: @ 0x081CAA04
	push {r4, lr}
	ldr r1, _081CAA2C
	movs r0, #6
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CAA38
	movs r0, #0
	strb r0, [r4, #0x19]
	ldr r0, _081CAA30
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	ldr r0, _081CAA34
	str r0, [r4]
	movs r0, #1
	b _081CAA3A
	.align 2, 0
_081CAA2C: .4byte 0x00002048
_081CAA30: .4byte 0x081CAAC9
_081CAA34: .4byte 0x081CAAB5
_081CAA38:
	movs r0, #0
_081CAA3A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CAA04

	thumb_func_start sub_081CAA40
sub_081CAA40: @ 0x081CAA40
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, _081CAA68
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r5, #4]
	ldr r0, _081CAA6C
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CAA68: .4byte 0x085F4138
_081CAA6C: .4byte 0x081CAAB5
	thumb_func_end sub_081CAA40

	thumb_func_start sub_081CAA70
sub_081CAA70: @ 0x081CAA70
	push {lr}
	movs r0, #6
	bl GetSubstructPtr
	ldr r0, [r0]
	bl _call_via_r0
	pop {r1}
	thumb_func_end sub_081CAA70

	thumb_func_start sub_081CAA80
sub_081CAA80: @ 0x081CAA80
	bx r1
	.align 2, 0
	thumb_func_end sub_081CAA80

	thumb_func_start sub_081CAA84
sub_081CAA84: @ 0x081CAA84
	push {r4, lr}
	movs r0, #6
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_081CBA08
	bl sub_081CB38C
	ldrb r0, [r4, #0x12]
	bl RemoveWindow
	ldrb r0, [r4, #0x10]
	bl RemoveWindow
	ldrb r0, [r4, #0x14]
	bl RemoveWindow
	movs r0, #6
	bl FreePokenavSubstruct
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CAA84

	thumb_func_start sub_081CAAB4
sub_081CAAB4: @ 0x081CAAB4
	push {lr}
	movs r0, #6
	bl GetSubstructPtr
	ldr r0, [r0, #4]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CAAB4

	thumb_func_start sub_081CAAC8
sub_081CAAC8: @ 0x081CAAC8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #7
	bls _081CAADC
	b _081CACA8
_081CAADC:
	lsls r0, r4, #2
	ldr r1, _081CAAE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CAAE8: .4byte 0x081CAAEC
_081CAAEC: @ jump table
	.4byte _081CAB0C @ case 0
	.4byte _081CAB78 @ case 1
	.4byte _081CABC8 @ case 2
	.4byte _081CAC0C @ case 3
	.4byte _081CAC26 @ case 4
	.4byte _081CAC38 @ case 5
	.4byte _081CAC4A @ case 6
	.4byte _081CAC8E @ case 7
_081CAB0C:
	ldr r0, _081CAB64
	movs r1, #3
	bl InitBgTemplates
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	ldr r1, _081CAB68
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _081CAB6C
	adds r1, r5, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, _081CAB70
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	ldr r0, _081CAB74
	movs r1, #0x20
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #2
	b _081CABBC
	.align 2, 0
_081CAB64: .4byte 0x085F412C
_081CAB68: .4byte 0x085F3ED0
_081CAB6C: .4byte 0x00001024
_081CAB70: .4byte 0x085F3F74
_081CAB74: .4byte 0x085F3EB0
_081CAB78:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CAB84
	b _081CAC9E
_081CAB84:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_08199A88
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #1
	bl SetBgTilemapBuffer
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	ldr r0, _081CABC4
	movs r1, #0x10
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #1
_081CABBC:
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	b _081CACAA
	.align 2, 0
_081CABC4: .4byte 0x085F4080
_081CABC8:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081CAC9E
	adds r0, r5, #0
	bl sub_081CB780
	ldr r1, _081CAC00
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _081CAC04
	movs r1, #0x30
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	ldr r0, _081CAC08
	movs r1, #0x50
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #0
	b _081CACAA
	.align 2, 0
_081CAC00: .4byte 0x085F4100
_081CAC04: .4byte 0x085F40A0
_081CAC08: .4byte 0x085F40C0
_081CAC0C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CAC9E
	bl sub_081CA5D4
	cmp r0, #0
	beq _081CAC9E
	bl sub_081CB32C
	movs r0, #0
	b _081CACAA
_081CAC26:
	bl sub_081C79CC
	cmp r0, #0
	bne _081CAC9E
	adds r0, r5, #0
	bl sub_081CB4E8
	movs r0, #0
	b _081CACAA
_081CAC38:
	adds r0, r5, #0
	bl sub_081CB530
	adds r0, r5, #0
	movs r1, #0
	bl sub_081CB640
	movs r0, #0
	b _081CACAA
_081CAC4A:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #1
	bl ShowBg
	bl sub_081CB968
	movs r0, #3
	bl LoadLeftHeaderGfxForIndex
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_081C7748
	movs r0, #1
	bl sub_081C7280
	movs r0, #0
	b _081CACAA
_081CAC8E:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CAC9E
	bl sub_081C77B8
	cmp r0, #0
	beq _081CACA2
_081CAC9E:
	movs r0, #2
	b _081CACAA
_081CACA2:
	movs r0, #1
	bl sub_081CB3A8
_081CACA8:
	movs r0, #4
_081CACAA:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CAAC8

	thumb_func_start sub_081CACB4
sub_081CACB4: @ 0x081CACB4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CACF4
	cmp r4, #1
	bgt _081CACCE
	cmp r4, #0
	beq _081CACD8
	b _081CAD16
_081CACCE:
	cmp r4, #2
	beq _081CACFC
	cmp r4, #3
	beq _081CAD08
	b _081CAD16
_081CACD8:
	movs r0, #5
	bl PlaySE
	bl MatchCall_MoveCursorDown
	cmp r0, #1
	beq _081CACF0
	cmp r0, #1
	bgt _081CAD04
	cmp r0, #0
	bne _081CAD04
	b _081CAD16
_081CACF0:
	movs r0, #7
	b _081CAD18
_081CACF4:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CAD12
_081CACFC:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081CB640
_081CAD04:
	movs r0, #0
	b _081CAD18
_081CAD08:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CAD16
_081CAD12:
	movs r0, #2
	b _081CAD18
_081CAD16:
	movs r0, #4
_081CAD18:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CACB4

	thumb_func_start sub_081CAD20
sub_081CAD20: @ 0x081CAD20
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CAD60
	cmp r4, #1
	bgt _081CAD3A
	cmp r4, #0
	beq _081CAD44
	b _081CAD82
_081CAD3A:
	cmp r4, #2
	beq _081CAD68
	cmp r4, #3
	beq _081CAD74
	b _081CAD82
_081CAD44:
	movs r0, #5
	bl PlaySE
	bl MatchCall_MoveCursorUp
	cmp r0, #1
	beq _081CAD5C
	cmp r0, #1
	bgt _081CAD70
	cmp r0, #0
	bne _081CAD70
	b _081CAD82
_081CAD5C:
	movs r0, #7
	b _081CAD84
_081CAD60:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CAD7E
_081CAD68:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081CB640
_081CAD70:
	movs r0, #0
	b _081CAD84
_081CAD74:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CAD82
_081CAD7E:
	movs r0, #2
	b _081CAD84
_081CAD82:
	movs r0, #4
_081CAD84:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CAD20

	thumb_func_start sub_081CAD8C
sub_081CAD8C: @ 0x081CAD8C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CADCC
	cmp r4, #1
	bgt _081CADA6
	cmp r4, #0
	beq _081CADB0
	b _081CADEE
_081CADA6:
	cmp r4, #2
	beq _081CADD4
	cmp r4, #3
	beq _081CADE0
	b _081CADEE
_081CADB0:
	movs r0, #5
	bl PlaySE
	bl MatchCall_PageDown
	cmp r0, #1
	beq _081CADC8
	cmp r0, #1
	bgt _081CADDC
	cmp r0, #0
	bne _081CADDC
	b _081CADEE
_081CADC8:
	movs r0, #7
	b _081CADF0
_081CADCC:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CADEA
_081CADD4:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081CB640
_081CADDC:
	movs r0, #0
	b _081CADF0
_081CADE0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CADEE
_081CADEA:
	movs r0, #2
	b _081CADF0
_081CADEE:
	movs r0, #4
_081CADF0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CAD8C

	thumb_func_start sub_081CADF8
sub_081CADF8: @ 0x081CADF8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CAE38
	cmp r4, #1
	bgt _081CAE12
	cmp r4, #0
	beq _081CAE1C
	b _081CAE5A
_081CAE12:
	cmp r4, #2
	beq _081CAE40
	cmp r4, #3
	beq _081CAE4C
	b _081CAE5A
_081CAE1C:
	movs r0, #5
	bl PlaySE
	bl MatchCall_PageUp
	cmp r0, #1
	beq _081CAE34
	cmp r0, #1
	bgt _081CAE48
	cmp r0, #0
	bne _081CAE48
	b _081CAE5A
_081CAE34:
	movs r0, #7
	b _081CAE5C
_081CAE38:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CAE56
_081CAE40:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081CB640
_081CAE48:
	movs r0, #0
	b _081CAE5C
_081CAE4C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CAE5A
_081CAE56:
	movs r0, #2
	b _081CAE5C
_081CAE5A:
	movs r0, #4
_081CAE5C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CADF8

	thumb_func_start sub_081CAE64
sub_081CAE64: @ 0x081CAE64
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #0
	beq _081CAE7A
	cmp r4, #1
	beq _081CAE90
	b _081CAE9E
_081CAE7A:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081CB6AC
	movs r0, #7
	bl sub_081C7364
	movs r0, #0
	b _081CAEA0
_081CAE90:
	adds r0, r5, #0
	bl sub_081CB710
	cmp r0, #0
	beq _081CAE9E
	movs r0, #2
	b _081CAEA0
_081CAE9E:
	movs r0, #4
_081CAEA0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CAE64

	thumb_func_start sub_081CAEA8
sub_081CAEA8: @ 0x081CAEA8
	push {r4, lr}
	movs r0, #5
	bl PlaySE
	movs r0, #6
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_081CA7C0
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_081CBA98
	movs r0, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CAEA8

	thumb_func_start sub_081CAED0
sub_081CAED0: @ 0x081CAED0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #0
	beq _081CAEE6
	cmp r4, #1
	beq _081CAEFC
	b _081CAF0A
_081CAEE6:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081CB73C
	movs r0, #6
	bl sub_081C7364
	movs r0, #0
	b _081CAF0C
_081CAEFC:
	adds r0, r5, #0
	bl sub_081CB750
	cmp r0, #0
	beq _081CAF0A
	movs r0, #2
	b _081CAF0C
_081CAF0A:
	movs r0, #4
_081CAF0C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CAED0

	thumb_func_start sub_081CAF14
sub_081CAF14: @ 0x081CAF14
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CAF48
	cmp r4, #1
	bgt _081CAF2E
	cmp r4, #0
	beq _081CAF38
	b _081CAF8E
_081CAF2E:
	cmp r4, #2
	beq _081CAF6C
	cmp r4, #3
	beq _081CAF80
	b _081CAF8E
_081CAF38:
	movs r0, #1
	bl ToggleMatchCallVerticalArrows
	adds r0, r5, #0
	bl sub_081CB7A4
	movs r0, #0
	b _081CAF90
_081CAF48:
	adds r0, r5, #0
	bl sub_081CB81C
	adds r4, r0, #0
	cmp r4, #0
	bne _081CAF8A
	adds r0, r5, #0
	bl sub_081CB82C
	ldr r0, _081CAF68
	bl PlaySE
	strb r4, [r5, #0xe]
	movs r0, #0
	b _081CAF90
	.align 2, 0
_081CAF68: .4byte 0x00000107
_081CAF6C:
	adds r0, r5, #0
	bl sub_081CB854
	cmp r0, #0
	bne _081CAF8A
	adds r0, r5, #0
	bl sub_081CB8AC
	movs r0, #0
	b _081CAF90
_081CAF80:
	adds r0, r5, #0
	bl sub_081CB8E8
	cmp r0, #0
	beq _081CAF8E
_081CAF8A:
	movs r0, #2
	b _081CAF90
_081CAF8E:
	movs r0, #4
_081CAF90:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CAF14

	thumb_func_start sub_081CAF98
sub_081CAF98: @ 0x081CAF98
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CAFD2
	cmp r4, #1
	bgt _081CAFB2
	cmp r4, #0
	beq _081CAFB8
	b _081CAFF4
_081CAFB2:
	cmp r4, #2
	beq _081CAFE6
	b _081CAFF4
_081CAFB8:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081CB7E8
	movs r0, #1
	bl ToggleMatchCallVerticalArrows
	movs r0, #1
	strb r0, [r5, #0xe]
	movs r0, #0
	b _081CAFF6
_081CAFD2:
	adds r0, r5, #0
	bl sub_081CB81C
	cmp r0, #0
	bne _081CAFF0
	adds r0, r5, #0
	bl sub_081CB86C
	movs r0, #0
	b _081CAFF6
_081CAFE6:
	adds r0, r5, #0
	bl sub_081CB894
	cmp r0, #0
	beq _081CAFF4
_081CAFF0:
	movs r0, #2
	b _081CAFF6
_081CAFF4:
	movs r0, #4
_081CAFF6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CAF98

	thumb_func_start sub_081CAFFC
sub_081CAFFC: @ 0x081CAFFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r4, r0, #0
	movs r6, #0
	cmp r5, #6
	bhi _081CB0A8
	lsls r0, r5, #2
	ldr r1, _081CB018
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CB018: .4byte 0x081CB01C
_081CB01C: @ jump table
	.4byte _081CB038 @ case 0
	.4byte _081CB04E @ case 1
	.4byte _081CB056 @ case 2
	.4byte _081CB064 @ case 3
	.4byte _081CB06C @ case 4
	.4byte _081CB080 @ case 5
	.4byte _081CB096 @ case 6
_081CB038:
	ldrb r0, [r4, #0xe]
	cmp r0, #0
	bne _081CB046
	movs r0, #0x84
	lsls r0, r0, #1
	bl PlaySE
_081CB046:
	movs r0, #5
	bl PlaySE
	b _081CB0A8
_081CB04E:
	adds r0, r4, #0
	bl sub_081CB930
	b _081CB0A8
_081CB056:
	adds r0, r4, #0
	bl sub_081CB958
	cmp r0, #0
	beq _081CB0A8
_081CB060:
	movs r6, #2
	b _081CB0A8
_081CB064:
	adds r0, r4, #0
	bl sub_081CB73C
	b _081CB0A8
_081CB06C:
	adds r0, r4, #0
	bl sub_081CB750
	cmp r0, #0
	beq _081CB078
	movs r6, #2
_081CB078:
	movs r0, #6
	bl sub_081C7364
	b _081CB0A8
_081CB080:
	bl sub_081C73A8
	cmp r0, #0
	bne _081CB060
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	beq _081CB0A0
	bl sub_081C7FE0
	movs r6, #1
	b _081CB0A8
_081CB096:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CB060
_081CB0A0:
	movs r0, #0
	bl ToggleMatchCallVerticalArrows
	movs r6, #4
_081CB0A8:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081CAFFC

	thumb_func_start sub_081CB0B0
sub_081CB0B0: @ 0x081CB0B0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CB0E8
	cmp r4, #1
	bgt _081CB0CA
	cmp r4, #0
	beq _081CB0D4
	b _081CB132
_081CB0CA:
	cmp r4, #2
	beq _081CB104
	cmp r4, #3
	beq _081CB114
	b _081CB132
_081CB0D4:
	movs r0, #5
	bl PlaySE
	bl sub_081C7F24
	adds r0, r5, #0
	bl sub_081CB760
	movs r0, #0
	b _081CB134
_081CB0E8:
	bl sub_081C7FC8
	cmp r0, #0
	bne _081CB12E
	adds r0, r5, #0
	bl sub_081CB750
	cmp r0, #0
	bne _081CB12E
	movs r0, #8
	bl sub_081C7364
	movs r0, #0
	b _081CB134
_081CB104:
	movs r0, #0
	bl sub_081C7F54
	adds r0, r5, #0
	bl sub_081CBAF0
	movs r0, #0
	b _081CB134
_081CB114:
	bl sub_081C7FC8
	cmp r0, #0
	bne _081CB12E
	adds r0, r5, #0
	bl sub_081CBB80
	cmp r0, #0
	bne _081CB12E
	bl sub_081C73A8
	cmp r0, #0
	beq _081CB132
_081CB12E:
	movs r0, #2
	b _081CB134
_081CB132:
	movs r0, #4
_081CB134:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CB0B0

	thumb_func_start sub_081CB13C
sub_081CB13C: @ 0x081CB13C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r4, r0, #0
	cmp r5, #4
	bhi _081CB1D4
	lsls r0, r5, #2
	ldr r1, _081CB158
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CB158: .4byte 0x081CB15C
_081CB15C: @ jump table
	.4byte _081CB170 @ case 0
	.4byte _081CB190 @ case 1
	.4byte _081CB1A8 @ case 2
	.4byte _081CB1B4 @ case 3
	.4byte _081CB1BE @ case 4
_081CB170:
	bl GetMatchCallListTopIndex
	bl sub_081CA888
	adds r5, r0, #0
	cmp r5, #0
	beq _081CB1D4
	movs r0, #5
	bl PlaySE
	strh r5, [r4, #0x16]
	adds r0, r4, #0
	bl sub_081CBB74
	movs r0, #0
	b _081CB1D6
_081CB190:
	adds r0, r4, #0
	bl sub_081CBB80
	cmp r0, #0
	bne _081CB1D0
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl sub_081CB640
	movs r0, #0
	b _081CB1D6
_081CB1A8:
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	bl sub_081C7F54
	movs r0, #0
	b _081CB1D6
_081CB1B4:
	adds r0, r4, #0
	bl sub_081CBAF0
	movs r0, #0
	b _081CB1D6
_081CB1BE:
	bl sub_081C7FC8
	cmp r0, #0
	bne _081CB1D0
	adds r0, r4, #0
	bl sub_081CBB80
	cmp r0, #0
	beq _081CB1D4
_081CB1D0:
	movs r0, #2
	b _081CB1D6
_081CB1D4:
	movs r0, #4
_081CB1D6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CB13C

	thumb_func_start sub_081CB1DC
sub_081CB1DC: @ 0x081CB1DC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CB210
	cmp r4, #1
	bgt _081CB1F6
	cmp r4, #0
	beq _081CB1FC
	b _081CB240
_081CB1F6:
	cmp r4, #2
	beq _081CB232
	b _081CB240
_081CB1FC:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081CBB74
	bl sub_081C7F98
	movs r0, #0
	b _081CB242
_081CB210:
	bl sub_081C7FC8
	cmp r0, #0
	bne _081CB23C
	adds r0, r5, #0
	bl sub_081CBB80
	cmp r0, #0
	bne _081CB23C
	movs r0, #6
	bl sub_081C7364
	adds r0, r5, #0
	bl sub_081CB530
	movs r0, #0
	b _081CB242
_081CB232:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CB240
_081CB23C:
	movs r0, #2
	b _081CB242
_081CB240:
	movs r0, #4
_081CB242:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CB1DC

	thumb_func_start sub_081CB248
sub_081CB248: @ 0x081CB248
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	bl GetSubstructPtr
	adds r4, r0, #0
	cmp r5, #4
	bhi _081CB2E0
	lsls r0, r5, #2
	ldr r1, _081CB264
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CB264: .4byte 0x081CB268
_081CB268: @ jump table
	.4byte _081CB27C @ case 0
	.4byte _081CB29C @ case 1
	.4byte _081CB2B4 @ case 2
	.4byte _081CB2C0 @ case 3
	.4byte _081CB2CA @ case 4
_081CB27C:
	bl GetMatchCallListTopIndex
	bl sub_081CA8CC
	adds r5, r0, #0
	cmp r5, #0
	beq _081CB2E0
	movs r0, #5
	bl PlaySE
	strh r5, [r4, #0x16]
	adds r0, r4, #0
	bl sub_081CBB74
	movs r0, #0
	b _081CB2E2
_081CB29C:
	adds r0, r4, #0
	bl sub_081CBB80
	cmp r0, #0
	bne _081CB2DC
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl sub_081CB640
	movs r0, #0
	b _081CB2E2
_081CB2B4:
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	bl sub_081C7F54
	movs r0, #0
	b _081CB2E2
_081CB2C0:
	adds r0, r4, #0
	bl sub_081CBAF0
	movs r0, #0
	b _081CB2E2
_081CB2CA:
	bl sub_081C7FC8
	cmp r0, #0
	bne _081CB2DC
	adds r0, r4, #0
	bl sub_081CBB80
	cmp r0, #0
	beq _081CB2E0
_081CB2DC:
	movs r0, #2
	b _081CB2E2
_081CB2E0:
	movs r0, #4
_081CB2E2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CB248

	thumb_func_start sub_081CB2E8
sub_081CB2E8: @ 0x081CB2E8
	push {lr}
	cmp r0, #0
	beq _081CB2F4
	cmp r0, #1
	beq _081CB30E
	b _081CB326
_081CB2F4:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081CB3A8
	movs r0, #0
	bl sub_081C7280
	bl sub_081C7060
	movs r0, #0
	b _081CB328
_081CB30E:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CB31E
	bl MainMenuLoopedTaskIsBusy
	cmp r0, #0
	beq _081CB322
_081CB31E:
	movs r0, #2
	b _081CB328
_081CB322:
	bl sub_081C7784
_081CB326:
	movs r0, #4
_081CB328:
	pop {r1}
	bx r1
	thumb_func_end sub_081CB2E8

	thumb_func_start sub_081CB32C
sub_081CB32C: @ 0x081CB32C
	push {lr}
	sub sp, #0x18
	bl sub_081CA640
	str r0, [sp]
	bl sub_081CA5E4
	mov r1, sp
	movs r2, #0
	strh r0, [r1, #4]
	movs r0, #4
	strb r0, [r1, #8]
	mov r0, sp
	strh r2, [r0, #6]
	movs r0, #0xe
	strb r0, [r1, #9]
	movs r0, #0xf
	strb r0, [r1, #0xa]
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #8
	strb r0, [r1, #0xc]
	movs r0, #3
	strb r0, [r1, #0xd]
	ldr r0, _081CB37C
	str r0, [sp, #0x10]
	ldr r0, _081CB380
	str r0, [sp, #0x14]
	ldr r0, _081CB384
	movs r2, #2
	bl sub_081C797C
	ldr r0, _081CB388
	movs r1, #7
	bl CreateTask
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_081CB37C: .4byte 0x081CA7F5
_081CB380: .4byte 0x081CB45D
_081CB384: .4byte 0x085F4134
_081CB388: .4byte 0x081CB3D5
	thumb_func_end sub_081CB32C

	thumb_func_start sub_081CB38C
sub_081CB38C: @ 0x081CB38C
	push {lr}
	bl sub_081C79DC
	ldr r0, _081CB3A4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_081CB3A4: .4byte 0x081CB3D5
	thumb_func_end sub_081CB38C

	thumb_func_start sub_081CB3A8
sub_081CB3A8: @ 0x081CB3A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081CB3CC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _081CB3C6
	ldr r1, _081CB3D0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #0x26]
_081CB3C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CB3CC: .4byte 0x081CB3D5
_081CB3D0: .4byte 0x03005B60
	thumb_func_end sub_081CB3A8

	thumb_func_start sub_081CB3D4
sub_081CB3D4: @ 0x081CB3D4
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081CB440
	adds r2, r1, r0
	movs r1, #0x1e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _081CB438
	ldrh r0, [r2]
	adds r0, #4
	movs r1, #0x7f
	ands r0, r1
	strh r0, [r2]
	ldr r1, _081CB444
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #2]
	ldr r0, _081CB448
	adds r1, r0, #0
	adds r1, #0x20
	movs r3, #2
	ldrsh r2, [r2, r3]
	str r2, [sp]
	ldr r4, _081CB44C
	str r4, [sp, #4]
	movs r2, #0x10
	movs r3, #0x10
	bl sub_081C717C
	ldr r0, _081CB450
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081CB438
	ldr r1, _081CB454
	ldr r2, _081CB458
	adds r0, r4, #0
	bl CpuSet
_081CB438:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CB440: .4byte 0x03005B68
_081CB444: .4byte 0x082FA8CC
_081CB448: .4byte 0x085F40C0
_081CB44C: .4byte 0x02037454
_081CB450: .4byte 0x02037C74
_081CB454: .4byte 0x02037854
_081CB458: .4byte 0x04000008
	thumb_func_end sub_081CB3D4

	thumb_func_start sub_081CB45C
sub_081CB45C: @ 0x081CB45C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBgTilemapBuffer
	adds r6, r0, #0
	lsls r4, r4, #7
	adds r4, #0x3a
	adds r6, r6, r4
	adds r0, r5, #0
	bl sub_081CA668
	cmp r0, #0
	beq _081CB4A0
	movs r1, #0xa0
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r6]
	adds r1, r6, #0
	adds r1, #0x40
	ldr r2, _081CB49C
	adds r0, r2, #0
	strh r0, [r1]
	b _081CB4AC
	.align 2, 0
_081CB49C: .4byte 0x00005001
_081CB4A0:
	ldr r0, _081CB4B4
	adds r1, r0, #0
	strh r1, [r6]
	adds r0, r6, #0
	adds r0, #0x40
	strh r1, [r0]
_081CB4AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CB4B4: .4byte 0x00005002
	thumb_func_end sub_081CB45C

	thumb_func_start sub_081CB4B8
sub_081CB4B8: @ 0x081CB4B8
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl GetWindowAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBgTilemapBuffer
	lsls r4, r4, #7
	adds r4, #0x3a
	adds r0, r0, r4
	ldr r2, _081CB4E4
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0x40
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CB4E4: .4byte 0x00005002
	thumb_func_end sub_081CB4B8

	thumb_func_start sub_081CB4E8
sub_081CB4E8: @ 0x081CB4E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081CB528
	bl AddWindow
	strh r0, [r4, #0x10]
	ldr r0, _081CB52C
	bl AddWindow
	strh r0, [r4, #0x12]
	ldrb r0, [r4, #0x10]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #0x10]
	bl PutWindowTilemap
	ldrb r0, [r4, #0x12]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #0x12]
	bl PutWindowTilemap
	ldrb r0, [r4, #0x10]
	movs r1, #1
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CB528: .4byte 0x085F4178
_081CB52C: .4byte 0x085F4180
	thumb_func_end sub_081CB4E8

	thumb_func_start sub_081CB530
sub_081CB530: @ 0x081CB530
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x12]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrh r0, [r4, #0x12]
	bl sub_081CB564
	ldrh r0, [r4, #0x12]
	bl sub_081CB57C
	ldrh r0, [r4, #0x12]
	bl sub_081CB5A8
	ldrh r0, [r4, #0x12]
	bl sub_081CB5C0
	ldrb r0, [r4, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CB530

	thumb_func_start sub_081CB564
sub_081CB564: @ 0x081CB564
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _081CB578
	movs r2, #0
	bl sub_081CB5F8
	pop {r0}
	bx r0
	.align 2, 0
_081CB578: .4byte 0x085CB6AE
	thumb_func_end sub_081CB564

	thumb_func_start sub_081CB57C
sub_081CB57C: @ 0x081CB57C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_081CA5E4
	adds r1, r0, #0
	mov r0, sp
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r4, #0
	mov r1, sp
	movs r2, #1
	bl sub_081CB5F8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CB57C

	thumb_func_start sub_081CB5A8
sub_081CB5A8: @ 0x081CB5A8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _081CB5BC
	movs r2, #2
	bl sub_081CB5F8
	pop {r0}
	bx r0
	.align 2, 0
_081CB5BC: .4byte 0x085CB6B8
	thumb_func_end sub_081CB5A8

	thumb_func_start sub_081CB5C0
sub_081CB5C0: @ 0x081CB5C0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #9
	bl GetGameStat
	adds r1, r0, #0
	ldr r0, _081CB5F4
	cmp r1, r0
	ble _081CB5D8
	adds r1, r0, #0
_081CB5D8:
	mov r0, sp
	movs r2, #0
	movs r3, #5
	bl ConvertIntToDecimalStringN
	adds r0, r4, #0
	mov r1, sp
	movs r2, #3
	bl sub_081CB5F8
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CB5F4: .4byte 0x0001869F
	thumb_func_end sub_081CB5C0

	thumb_func_start sub_081CB5F8
sub_081CB5F8: @ 0x081CB5F8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	bl GetStringWidth
	movs r3, #0x54
	subs r3, r3, r0
	lsls r4, r4, #4
	adds r4, #2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081CB5F8

	thumb_func_start sub_081CB640
sub_081CB640: @ 0x081CB640
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetSelectedMatchCall
	adds r0, r0, r4
	bl sub_081CA650
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xd5
	beq _081CB664
	add r0, sp, #0xc
	movs r2, #0
	bl GetMapName
	b _081CB66C
_081CB664:
	ldr r1, _081CB6A8
	add r0, sp, #0xc
	bl StringCopy
_081CB66C:
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	add r1, sp, #0xc
	bl GetStringWidth
	movs r4, #0x54
	subs r4, r4, r0
	ldrb r0, [r5, #0x10]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0x10]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	add r2, sp, #0xc
	adds r3, r4, #0
	bl AddTextPrinterParameterized
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CB6A8: .4byte 0x085CB808
	thumb_func_end sub_081CB640

	thumb_func_start sub_081CB6AC
sub_081CB6AC: @ 0x081CB6AC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrb r0, [r5, #0x12]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r4, #0
	movs r6, #0x80
	lsls r6, r6, #0x12
	b _081CB6E8
_081CB6C2:
	ldrb r0, [r5, #0x12]
	ldr r2, _081CB70C
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	lsrs r1, r6, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0x14
	bl AddTextPrinterParameterized
	movs r0, #0x80
	lsls r0, r0, #0x15
	adds r6, r6, r0
	adds r4, #1
_081CB6E8:
	cmp r4, #2
	bhi _081CB6FA
	adds r0, r4, #0
	bl sub_081CA7D0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #3
	bne _081CB6C2
_081CB6FA:
	ldrb r0, [r5, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CB70C: .4byte 0x085F4188
	thumb_func_end sub_081CB6AC

	thumb_func_start sub_081CB710
sub_081CB710: @ 0x081CB710
	push {r4, lr}
	adds r4, r0, #0
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CB722
	movs r0, #1
	b _081CB734
_081CB722:
	bl sub_081CA7C0
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_081CBA44
	movs r0, #0
_081CB734:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CB710

	thumb_func_start sub_081CB73C
sub_081CB73C: @ 0x081CB73C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081CBA84
	adds r0, r4, #0
	bl sub_081CB530
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CB73C

	thumb_func_start sub_081CB750
sub_081CB750: @ 0x081CB750
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CB750

	thumb_func_start sub_081CB760
sub_081CB760: @ 0x081CB760
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081CBA84
	ldrb r0, [r4, #0x12]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CB760

	thumb_func_start sub_081CB780
sub_081CB780: @ 0x081CB780
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081CB7A0
	bl AddWindow
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x14]
	movs r1, #1
	movs r2, #4
	bl sub_08196D78
	bl sub_081C7300
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CB7A0: .4byte 0x085F41A8
	thumb_func_end sub_081CB780

	thumb_func_start sub_081CB7A4
sub_081CB7A4: @ 0x081CB7A4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x14]
	movs r1, #1
	movs r2, #4
	bl sub_08196D78
	ldrh r0, [r4, #0x14]
	movs r1, #1
	movs r2, #4
	bl sub_08196DB8
	ldrb r0, [r4, #0x14]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #0x14]
	bl PutWindowTilemap
	ldrb r0, [r4, #0x14]
	movs r1, #3
	bl CopyWindowToVram
	bl PauseSpinningPokenavSprite
	movs r2, #0
	movs r1, #0x18
	strh r1, [r0, #0x20]
	movs r1, #0x70
	strh r1, [r0, #0x22]
	strh r2, [r0, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CB7A4

	thumb_func_start sub_081CB7E8
sub_081CB7E8: @ 0x081CB7E8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	movs r1, #1
	movs r2, #0x40
	bl LoadUserWindowBorderGfx
	ldrb r0, [r4, #0x14]
	movs r1, #1
	movs r2, #4
	bl DrawTextBorderOuter
	ldrb r0, [r4, #0x14]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #0x14]
	bl PutWindowTilemap
	ldrb r0, [r4, #0x14]
	movs r1, #3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CB7E8

	thumb_func_start sub_081CB81C
sub_081CB81C: @ 0x081CB81C
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CB81C

	thumb_func_start sub_081CB82C
sub_081CB82C: @ 0x081CB82C
	push {lr}
	sub sp, #0xc
	ldrb r0, [r0, #0x14]
	ldr r2, _081CB850
	movs r1, #2
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0x20
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081CB850: .4byte 0x085F4194
	thumb_func_end sub_081CB82C

	thumb_func_start sub_081CB854
sub_081CB854: @ 0x081CB854
	push {r4, lr}
	adds r4, r0, #0
	bl RunTextPrinters
	ldrb r0, [r4, #0x14]
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CB854

	thumb_func_start sub_081CB86C
sub_081CB86C: @ 0x081CB86C
	push {lr}
	sub sp, #0xc
	ldrb r0, [r0, #0x14]
	ldr r2, _081CB890
	movs r1, #2
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0x20
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081CB890: .4byte 0x085CB7A8
	thumb_func_end sub_081CB86C

	thumb_func_start sub_081CB894
sub_081CB894: @ 0x081CB894
	push {r4, lr}
	adds r4, r0, #0
	bl RunTextPrinters
	ldrb r0, [r4, #0x14]
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CB894

	thumb_func_start sub_081CB8AC
sub_081CB8AC: @ 0x081CB8AC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl GetSelectedMatchCall
	adds r1, r4, #0
	adds r1, #0xf
	bl sub_081CA71C
	adds r5, r0, #0
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r4, #0x14]
	movs r1, #2
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x20
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081CB8AC

	thumb_func_start sub_081CB8E8
sub_081CB8E8: @ 0x081CB8E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081CB904
	ldrh r1, [r0, #0x2c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081CB90C
	ldr r0, _081CB908
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b _081CB918
	.align 2, 0
_081CB904: .4byte 0x03002360
_081CB908: .4byte 0x030030B4
_081CB90C:
	ldr r2, _081CB92C
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_081CB918:
	bl RunTextPrinters
	ldrb r0, [r4, #0x14]
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CB92C: .4byte 0x030030B4
	thumb_func_end sub_081CB8E8

	thumb_func_start sub_081CB930
sub_081CB930: @ 0x081CB930
	push {lr}
	sub sp, #8
	bl ResumeSpinningPokenavSprite
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r0}
	bx r0
	thumb_func_end sub_081CB930

	thumb_func_start sub_081CB958
sub_081CB958: @ 0x081CB958
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CB958

	thumb_func_start sub_081CB968
sub_081CB968: @ 0x081CB968
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #6
	bl GetSubstructPtr
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _081CB9EC
_081CB978:
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #8
	adds r5, #1
	cmp r5, #0
	beq _081CB978
	ldr r0, _081CB9F0
	bl Pokenav_AllocAndLoadPalettes
	movs r0, #0
	str r0, [r6, #0x1c]
	ldr r1, _081CB9F4
	adds r0, r6, r1
	str r0, [sp]
	ldr r1, _081CB9F8
	ldr r0, [sp, #4]
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	ldr r1, _081CB9FC
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r2, _081CBA00
	adds r1, r6, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	ldr r2, _081CBA04
	adds r0, r0, r2
	str r0, [r1]
	movs r0, #0xd
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r6, #0x1a]
	bl sub_081CBAC4
	str r0, [r6, #0x20]
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CB9EC: .4byte 0x085F41B0
_081CB9F0: .4byte 0x085F41B8
_081CB9F4: .4byte 0x00001828
_081CB9F8: .4byte 0xFFFF0000
_081CB9FC: .4byte 0x0000FFFF
_081CBA00: .4byte 0x00001824
_081CBA04: .4byte 0x06010000
	thumb_func_end sub_081CB968

	thumb_func_start sub_081CBA08
sub_081CBA08: @ 0x081CBA08
	push {r4, lr}
	movs r0, #6
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _081CBA1C
	bl DestroySprite
_081CBA1C:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _081CBA26
	bl DestroySprite
_081CBA26:
	movs r0, #8
	bl FreeSpriteTilesByTag
	movs r0, #7
	bl FreeSpriteTilesByTag
	movs r0, #0xc
	bl FreeSpritePaletteByTag
	movs r0, #0xd
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CBA08

	thumb_func_start sub_081CBA44
sub_081CBA44: @ 0x081CBA44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _081CBA74
	ldr r0, _081CBA7C
	movs r1, #8
	movs r2, #0x50
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081CBA80
	adds r1, r1, r0
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_081CBA98
_081CBA74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CBA7C: .4byte 0x085F41D0
_081CBA80: .4byte 0x020205AC
	thumb_func_end sub_081CBA44

	thumb_func_start sub_081CBA84
sub_081CBA84: @ 0x081CBA84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl DestroySprite
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CBA84

	thumb_func_start sub_081CBA98
sub_081CBA98: @ 0x081CBA98
	ldr r0, [r0, #0x1c]
	lsls r1, r1, #4
	strh r1, [r0, #0x26]
	bx lr
	thumb_func_end sub_081CBA98

	thumb_func_start sub_081CBAA0
sub_081CBAA0: @ 0x081CBAA0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _081CBAC0
	movs r0, #0
	strh r0, [r2, #0x2e]
	ldrh r0, [r2, #0x24]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	strh r0, [r2, #0x24]
_081CBAC0:
	pop {r0}
	bx r0
	thumb_func_end sub_081CBAA0

	thumb_func_start sub_081CBAC4
sub_081CBAC4: @ 0x081CBAC4
	push {lr}
	ldr r0, _081CBAE8
	movs r1, #0x2c
	movs r2, #0x68
	movs r3, #6
	bl CreateSprite
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081CBAEC
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_081CBAE8: .4byte 0x085F41F0
_081CBAEC: .4byte 0x020205AC
	thumb_func_end sub_081CBAC4

	thumb_func_start sub_081CBAF0
sub_081CBAF0: @ 0x081CBAF0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetSelectedMatchCall
	bl sub_081CA6B0
	cmp r0, #0
	blt _081CBB54
	lsls r4, r0, #3
	ldr r0, _081CBB5C
	adds r0, r4, r0
	ldr r1, _081CBB60
	adds r5, r7, r1
	adds r1, r5, #0
	movs r2, #0
	bl DecompressPicFromTable
	ldr r0, _081CBB64
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _081CBB68
	adds r6, r7, r1
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r1, _081CBB6C
	adds r0, r7, r1
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r5, #0
	movs r3, #1
	bl RequestDma3Copy
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r1, [r7, #0x1a]
	adds r0, r6, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, [r7, #0x20]
	movs r0, #0
	strh r0, [r1, #0x2e]
	ldr r0, [r7, #0x20]
	strh r4, [r0, #0x3c]
	ldr r1, [r7, #0x20]
	ldr r0, _081CBB70
	str r0, [r1, #0x1c]
_081CBB54:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CBB5C: .4byte 0x082D8EE4
_081CBB60: .4byte 0x00001828
_081CBB64: .4byte 0x082D91CC
_081CBB68: .4byte 0x00002028
_081CBB6C: .4byte 0x00001824
_081CBB70: .4byte 0x081CBB95
	thumb_func_end sub_081CBAF0

	thumb_func_start sub_081CBB74
sub_081CBB74: @ 0x081CBB74
	ldr r1, [r0, #0x20]
	ldr r0, _081CBB7C
	str r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_081CBB7C: .4byte 0x081CBBF9
	thumb_func_end sub_081CBB74

	thumb_func_start sub_081CBB80
sub_081CBB80: @ 0x081CBB80
	ldr r0, [r0, #0x20]
	ldr r1, [r0, #0x1c]
	ldr r0, _081CBB90
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_081CBB90: .4byte 0x08007141
	thumb_func_end sub_081CBB80

	thumb_func_start sub_081CBB94
sub_081CBB94: @ 0x081CBB94
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081CBBA6
	cmp r0, #1
	beq _081CBBD8
	b _081CBBEC
_081CBBA6:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	bl CheckForSpaceForDma3Request
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _081CBBEC
	ldr r0, _081CBBD4
	strh r0, [r4, #0x24]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _081CBBEC
	.align 2, 0
_081CBBD4: .4byte 0x0000FFB0
_081CBBD8:
	ldrh r0, [r4, #0x24]
	adds r0, #8
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _081CBBEC
	movs r0, #0
	strh r0, [r4, #0x24]
	ldr r0, _081CBBF4
	str r0, [r4, #0x1c]
_081CBBEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CBBF4: .4byte 0x08007141
	thumb_func_end sub_081CBB94

	thumb_func_start sub_081CBBF8
sub_081CBBF8: @ 0x081CBBF8
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x24]
	subs r0, #8
	strh r0, [r3, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x50
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _081CBC1E
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _081CBC24
	str r0, [r3, #0x1c]
_081CBC1E:
	pop {r0}
	bx r0
	.align 2, 0
_081CBC24: .4byte 0x08007141
	thumb_func_end sub_081CBBF8

	thumb_func_start sub_081CBC28
sub_081CBC28: @ 0x081CBC28
	push {r4, lr}
	movs r0, #3
	movs r1, #0x14
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CBC44
	ldr r1, _081CBC48
	movs r0, #0x10
	bl AllocSubstruct
	cmp r0, #0
	bne _081CBC4C
_081CBC44:
	movs r0, #0
	b _081CBC6E
	.align 2, 0
_081CBC48: .4byte 0x00000884
_081CBC4C:
	ldr r0, _081CBC60
	ldrb r0, [r0, #0x14]
	bl sub_08124674
	str r0, [r4, #0xc]
	cmp r0, #0
	bne _081CBC68
	ldr r0, _081CBC64
	b _081CBC6A
	.align 2, 0
_081CBC60: .4byte 0x02036FB8
_081CBC64: .4byte 0x081CBCBD
_081CBC68:
	ldr r0, _081CBC74
_081CBC6A:
	str r0, [r4, #0x10]
	movs r0, #1
_081CBC6E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CBC74: .4byte 0x081CBD09
	thumb_func_end sub_081CBC28

	thumb_func_start sub_081CBC78
sub_081CBC78: @ 0x081CBC78
	push {lr}
	bl sub_08124664
	ldr r1, _081CBCA4
	ldr r3, [r1]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #0x15]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x15]
	movs r0, #0x10
	bl FreePokenavSubstruct
	movs r0, #3
	bl FreePokenavSubstruct
	pop {r0}
	bx r0
	.align 2, 0
_081CBCA4: .4byte 0x03005AF0
	thumb_func_end sub_081CBC78

	thumb_func_start sub_081CBCA8
sub_081CBCA8: @ 0x081CBCA8
	push {lr}
	movs r0, #3
	bl GetSubstructPtr
	ldr r1, [r0, #0x10]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CBCA8

	thumb_func_start sub_081CBCBC
sub_081CBCBC: @ 0x081CBCBC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081230B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _081CBCE0
	cmp r0, #4
	bgt _081CBCD6
	cmp r0, #3
	beq _081CBCDC
	b _081CBD00
_081CBCD6:
	cmp r0, #5
	beq _081CBCF2
	b _081CBD00
_081CBCDC:
	movs r0, #1
	b _081CBD02
_081CBCE0:
	bl sub_08124664
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CBCEE
	movs r0, #3
	b _081CBD02
_081CBCEE:
	movs r0, #2
	b _081CBD02
_081CBCF2:
	ldr r0, _081CBCFC
	str r0, [r4, #0x10]
	movs r0, #4
	b _081CBD02
	.align 2, 0
_081CBCFC: .4byte 0x081CBD31
_081CBD00:
	movs r0, #0
_081CBD02:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CBCBC

	thumb_func_start sub_081CBD08
sub_081CBD08: @ 0x081CBD08
	push {lr}
	adds r2, r0, #0
	ldr r0, _081CBD1C
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081CBD20
	movs r0, #0
	b _081CBD26
	.align 2, 0
_081CBD1C: .4byte 0x03002360
_081CBD20:
	ldr r0, _081CBD2C
	str r0, [r2, #0x10]
	movs r0, #4
_081CBD26:
	pop {r1}
	bx r1
	.align 2, 0
_081CBD2C: .4byte 0x081CBD31
	thumb_func_end sub_081CBD08

	thumb_func_start sub_081CBD30
sub_081CBD30: @ 0x081CBD30
	ldr r0, _081CBD34
	bx lr
	.align 2, 0
_081CBD34: .4byte 0x000186A1
	thumb_func_end sub_081CBD30

	thumb_func_start sub_081CBD38
sub_081CBD38: @ 0x081CBD38
	push {lr}
	movs r0, #3
	bl GetSubstructPtr
	ldr r0, [r0, #0xc]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CBD38

	thumb_func_start sub_081CBD48
sub_081CBD48: @ 0x081CBD48
	push {r4, lr}
	ldr r1, _081CBD6C
	movs r0, #4
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CBD78
	ldr r0, _081CBD70
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	ldr r0, _081CBD74
	str r0, [r4]
	movs r0, #1
	b _081CBD7A
	.align 2, 0
_081CBD6C: .4byte 0x00001948
_081CBD70: .4byte 0x081CBE49
_081CBD74: .4byte 0x081CBE11
_081CBD78:
	movs r0, #0
_081CBD7A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CBD48

	thumb_func_start sub_081CBD80
sub_081CBD80: @ 0x081CBD80
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #4
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, _081CBDA8
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r5, #4]
	ldr r0, _081CBDAC
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CBDA8: .4byte 0x085F4D08
_081CBDAC: .4byte 0x081CBE11
	thumb_func_end sub_081CBD80

	thumb_func_start sub_081CBDB0
sub_081CBDB0: @ 0x081CBDB0
	push {lr}
	movs r0, #4
	bl GetSubstructPtr
	ldr r0, [r0]
	bl _call_via_r0
	pop {r1}
	thumb_func_end sub_081CBDB0

	thumb_func_start sub_081CBDC0
sub_081CBDC0: @ 0x081CBDC0
	bx r1
	.align 2, 0
	thumb_func_end sub_081CBDC0

	thumb_func_start sub_081CBDC4
sub_081CBDC4: @ 0x081CBDC4
	push {r4, lr}
	movs r0, #4
	bl GetSubstructPtr
	adds r4, r0, #0
	bl FreeRegionMapIconResources
	bl sub_081CC140
	ldrb r0, [r4, #8]
	bl RemoveWindow
	movs r0, #0x10
	bl FreePokenavSubstruct
	movs r0, #4
	bl FreePokenavSubstruct
	bl SetPokenavVBlankCallback
	movs r0, #0
	bl SetBgMode
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CBDC4

	thumb_func_start sub_081CBDF8
sub_081CBDF8: @ 0x081CBDF8
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl UpdateRegionMapVideoRegs
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CBDF8

	thumb_func_start sub_081CBE10
sub_081CBE10: @ 0x081CBE10
	push {lr}
	movs r0, #4
	bl GetSubstructPtr
	ldr r0, [r0, #4]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CBE10

	thumb_func_start sub_081CBE24
sub_081CBE24: @ 0x081CBE24
	push {lr}
	bl sub_081CBD38
	cmp r0, #0
	bne _081CBE40
	ldr r0, _081CBE3C
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	lsrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	b _081CBE42
	.align 2, 0
_081CBE3C: .4byte 0x03005AF0
_081CBE40:
	movs r0, #0
_081CBE42:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CBE24

	thumb_func_start sub_081CBE48
sub_081CBE48: @ 0x081CBE48
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #4
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #7
	bls _081CBE5A
	b _081CBF92
_081CBE5A:
	lsls r0, r4, #2
	ldr r1, _081CBE64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CBE64: .4byte 0x081CBE68
_081CBE68: @ jump table
	.4byte _081CBE88 @ case 0
	.4byte _081CBED8 @ case 1
	.4byte _081CBF0A @ case 2
	.4byte _081CBF12 @ case 3
	.4byte _081CBF22 @ case 4
	.4byte _081CBF36 @ case 5
	.4byte _081CBF58 @ case 6
	.4byte _081CBF7E @ case 7
_081CBE88:
	movs r0, #0
	bl InitKeys_
	movs r0, #1
	bl HideBg
	movs r0, #2
	bl HideBg
	movs r0, #3
	bl HideBg
	movs r0, #1
	bl SetBgMode
	ldr r4, _081CBED4
	adds r0, r4, #0
	movs r1, #2
	bl InitBgTemplates
	movs r0, #0x10
	bl GetSubstructPtr
	adds r5, r0, #0
	adds r4, #4
	bl sub_081CBE24
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08122D04
	bl sub_081CC114
_081CBED0:
	movs r0, #0
	b _081CBF94
	.align 2, 0
_081CBED4: .4byte 0x085F4CFC
_081CBED8:
	bl sub_08122DBC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CBF8E
	bl sub_081CBD38
	cmp r0, #0
	bne _081CBF00
	movs r0, #4
	movs r1, #9
	bl CreateRegionMapPlayerIcon
	movs r0, #5
	movs r1, #0xa
	bl CreateRegionMapCursor
	bl sub_08124558
	b _081CBED0
_081CBF00:
	movs r0, #0
	movs r1, #6
	bl sub_0812303C
	b _081CBED0
_081CBF0A:
	bl sub_081CC450
_081CBF0E:
	movs r0, #1
	b _081CBF94
_081CBF12:
	bl sub_081CC464
	cmp r0, #0
	bne _081CBF8E
	adds r0, r5, #0
	bl sub_081CC170
	b _081CBF0E
_081CBF22:
	bl sub_081CC250
	cmp r0, #0
	bne _081CBF8E
	adds r0, r5, #0
	bl sub_081CC260
	bl sub_081C7300
	b _081CBED0
_081CBF36:
	adds r0, r5, #0
	bl sub_081CC38C
	cmp r0, #0
	bne _081CBF8E
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r0, _081CBF54
	bl InitKeys_
	b _081CBED0
	.align 2, 0
_081CBF54: .4byte 0x081CBDF9
_081CBF58:
	bl sub_081CBE24
	lsls r0, r0, #0x18
	movs r4, #5
	cmp r0, #0
	bne _081CBF66
	movs r4, #4
_081CBF66:
	adds r0, r4, #0
	bl LoadLeftHeaderGfxForIndex
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	bl sub_081C7748
	movs r0, #1
	bl sub_081C7280
	b _081CBED0
_081CBF7E:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CBF8E
	bl sub_081C77B8
	cmp r0, #0
	beq _081CBF0E
_081CBF8E:
	movs r0, #2
	b _081CBF94
_081CBF92:
	movs r0, #4
_081CBF94:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CBE48

	thumb_func_start sub_081CBF9C
sub_081CBF9C: @ 0x081CBF9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #4
	bl GetSubstructPtr
	cmp r4, #0
	beq _081CBFB0
	cmp r4, #1
	beq _081CBFB8
	b _081CBFC4
_081CBFB0:
	bl sub_081CC260
	movs r0, #0
	b _081CBFC6
_081CBFB8:
	bl sub_081CC38C
	cmp r0, #0
	beq _081CBFC4
	movs r0, #2
	b _081CBFC6
_081CBFC4:
	movs r0, #4
_081CBFC6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CBF9C

	thumb_func_start sub_081CBFCC
sub_081CBFCC: @ 0x081CBFCC
	push {lr}
	cmp r0, #1
	beq _081CBFF6
	cmp r0, #1
	bgt _081CBFDC
	cmp r0, #0
	beq _081CBFE2
	b _081CC024
_081CBFDC:
	cmp r0, #2
	beq _081CC012
	b _081CC024
_081CBFE2:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081CC39C
	bl sub_08123424
	movs r0, #0
	b _081CC026
_081CBFF6:
	bl sub_08123520
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CC01A
	bl sub_081CC3C8
	cmp r0, #0
	bne _081CC01A
	movs r0, #1
	bl sub_081C7364
	movs r0, #0
	b _081CC026
_081CC012:
	bl sub_081C73A8
	cmp r0, #0
	beq _081CC01E
_081CC01A:
	movs r0, #2
	b _081CC026
_081CC01E:
	movs r0, #4
	bl sub_081C75D4
_081CC024:
	movs r0, #4
_081CC026:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CBFCC

	thumb_func_start sub_081CC02C
sub_081CC02C: @ 0x081CC02C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #4
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CC060
	cmp r4, #1
	bgt _081CC046
	cmp r4, #0
	beq _081CC050
	b _081CC0A6
_081CC046:
	cmp r4, #2
	beq _081CC078
	cmp r4, #3
	beq _081CC094
	b _081CC0A6
_081CC050:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081CC260
	movs r0, #0
	b _081CC0A8
_081CC060:
	adds r0, r5, #0
	bl sub_081CC38C
	cmp r0, #0
	bne _081CC09C
	movs r0, #1
	bl sub_081CC39C
	bl sub_08123424
	movs r0, #0
	b _081CC0A8
_081CC078:
	bl sub_08123520
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CC09C
	bl sub_081CC3C8
	cmp r0, #0
	bne _081CC09C
	movs r0, #2
	bl sub_081C7364
	movs r0, #0
	b _081CC0A8
_081CC094:
	bl sub_081C73A8
	cmp r0, #0
	beq _081CC0A0
_081CC09C:
	movs r0, #2
	b _081CC0A8
_081CC0A0:
	movs r0, #5
	bl sub_081C75D4
_081CC0A6:
	movs r0, #4
_081CC0A8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CC02C

	thumb_func_start sub_081CC0B0
sub_081CC0B0: @ 0x081CC0B0
	push {lr}
	cmp r0, #1
	beq _081CC0D6
	cmp r0, #1
	bgt _081CC0C0
	cmp r0, #0
	beq _081CC0C6
	b _081CC10C
_081CC0C0:
	cmp r0, #2
	beq _081CC0EA
	b _081CC10C
_081CC0C6:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081C7280
	movs r0, #0
	b _081CC10E
_081CC0D6:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CC0F2
	bl sub_081C7784
	bl sub_081C7060
	movs r0, #0
	b _081CC10E
_081CC0EA:
	bl MainMenuLoopedTaskIsBusy
	cmp r0, #0
	beq _081CC0F6
_081CC0F2:
	movs r0, #2
	b _081CC10E
_081CC0F6:
	movs r0, #1
	bl HideBg
	movs r0, #2
	bl HideBg
	movs r0, #3
	bl HideBg
	movs r0, #0
	b _081CC10E
_081CC10C:
	movs r0, #4
_081CC10E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CC0B0

	thumb_func_start sub_081CC114
sub_081CC114: @ 0x081CC114
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _081CC138
_081CC11A:
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #8
	adds r5, #1
	cmp r5, #0
	beq _081CC11A
	ldr r0, _081CC13C
	bl Pokenav_AllocAndLoadPalettes
	bl sub_081CC598
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CC138: .4byte 0x085F4D1C
_081CC13C: .4byte 0x085F4D24
	thumb_func_end sub_081CC114

	thumb_func_start sub_081CC140
sub_081CC140: @ 0x081CC140
	push {r4, r5, lr}
	movs r0, #4
	bl GetSubstructPtr
	adds r4, r0, #0
	movs r0, #6
	bl FreeSpriteTilesByTag
	movs r0, #0xb
	bl FreeSpritePaletteByTag
	adds r5, r4, #0
	adds r5, #0xc
	movs r4, #2
_081CC15C:
	ldm r5!, {r0}
	bl DestroySprite
	subs r4, #1
	cmp r4, #0
	bge _081CC15C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CC140

	thumb_func_start sub_081CC170
sub_081CC170: @ 0x081CC170
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0x40
	movs r3, #1
	bl sub_08199A88
	movs r0, #1
	movs r1, #0x11
	movs r2, #0x41
	movs r3, #1
	bl sub_08199A88
	add r1, sp, #4
	movs r2, #0x82
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r4, r5, #0
	adds r4, #0x18
	ldr r2, _081CC21C
	adds r0, r1, #0
	adds r1, r4, #0
	bl CpuSet
	movs r0, #1
	adds r1, r4, #0
	bl SetBgTilemapBuffer
	ldr r0, _081CC220
	bl AddWindow
	movs r4, #0
	strh r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x42
	movs r2, #0x40
	bl LoadUserWindowBorderGfx_
	ldrb r0, [r5, #8]
	movs r1, #0x42
	movs r2, #4
	bl DrawTextBorderOuter
	ldr r1, _081CC224
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldrb r0, [r5, #8]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #8]
	bl PutWindowTilemap
	ldrb r0, [r5, #8]
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _081CC228
	movs r1, #0x10
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	ldr r0, _081CC22C
	movs r1, #0x30
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	bl sub_08124664
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CC234
	ldr r1, _081CC230
	movs r0, #1
	movs r2, #0
	bl ChangeBgY
	b _081CC23E
	.align 2, 0
_081CC21C: .4byte 0x01000400
_081CC220: .4byte 0x085F4D34
_081CC224: .4byte 0x085F4248
_081CC228: .4byte 0x085F4208
_081CC22C: .4byte 0x085F4228
_081CC230: .4byte 0xFFFFA000
_081CC234:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
_081CC23E:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081CC170

	thumb_func_start sub_081CC250
sub_081CC250: @ 0x081CC250
	push {lr}
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CC250

	thumb_func_start sub_081CC260
sub_081CC260: @ 0x081CC260
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x10
	bl GetSubstructPtr
	adds r6, r0, #0
	ldrb r0, [r6, #2]
	cmp r0, #4
	bls _081CC276
	b _081CC380
_081CC276:
	lsls r0, r0, #2
	ldr r1, _081CC280
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CC280: .4byte 0x081CC284
_081CC284: @ jump table
	.4byte _081CC35C @ case 0
	.4byte _081CC31C @ case 1
	.4byte _081CC298 @ case 2
	.4byte _081CC2D8 @ case 3
	.4byte _081CC31C @ case 4
_081CC298:
	ldrb r0, [r5, #8]
	movs r4, #2
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0xc
	bl PutWindowRectTilemap
	ldrb r0, [r5, #8]
	adds r2, r6, #4
	str r4, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrh r1, [r6]
	ldrb r2, [r6, #3]
	adds r0, r5, #0
	bl sub_081CC4B0
	ldrb r0, [r5, #8]
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #0
	bl sub_081CC6E4
	b _081CC380
_081CC2D8:
	ldrb r0, [r5, #8]
	movs r4, #2
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0xc
	bl PutWindowRectTilemap
	ldrb r0, [r5, #8]
	adds r2, r6, #4
	str r4, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r1, _081CC318
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x11
	movs r3, #6
	bl FillBgTilemapBufferRect
	b _081CC34C
	.align 2, 0
_081CC318: .4byte 0x00001041
_081CC31C:
	ldrb r0, [r5, #8]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #8]
	bl PutWindowTilemap
	ldrb r0, [r5, #8]
	adds r2, r6, #4
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrh r1, [r6]
	ldrb r2, [r6, #3]
	adds r0, r5, #0
	bl sub_081CC528
_081CC34C:
	ldrb r0, [r5, #8]
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	bl sub_081CC6E4
	b _081CC380
_081CC35C:
	ldr r1, _081CC388
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x11
	movs r3, #4
	bl FillBgTilemapBufferRect
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl sub_081CC6E4
_081CC380:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CC388: .4byte 0x00001041
	thumb_func_end sub_081CC260

	thumb_func_start sub_081CC38C
sub_081CC38C: @ 0x081CC38C
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CC38C

	thumb_func_start sub_081CC39C
sub_081CC39C: @ 0x081CC39C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081CC3C0
	movs r1, #3
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081CC3C4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CC3C0: .4byte 0x081CC3DD
_081CC3C4: .4byte 0x03005B60
	thumb_func_end sub_081CC39C

	thumb_func_start sub_081CC3C8
sub_081CC3C8: @ 0x081CC3C8
	push {lr}
	ldr r0, _081CC3D8
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081CC3D8: .4byte 0x081CC3DD
	thumb_func_end sub_081CC3C8

	thumb_func_start sub_081CC3DC
sub_081CC3DC: @ 0x081CC3DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r1, _081CC41C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _081CC420
	movs r1, #0x90
	lsls r1, r1, #3
	movs r0, #1
	movs r2, #1
	bl ChangeBgY
	cmp r0, #0
	blt _081CC416
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	adds r0, r4, #0
	bl DestroyTask
_081CC416:
	bl sub_081CC6B8
	b _081CC444
	.align 2, 0
_081CC41C: .4byte 0x03005B60
_081CC420:
	movs r1, #0x90
	lsls r1, r1, #3
	movs r0, #1
	movs r2, #2
	bl ChangeBgY
	ldr r1, _081CC44C
	cmp r0, r1
	bgt _081CC440
	movs r0, #1
	movs r2, #0
	bl ChangeBgY
	adds r0, r5, #0
	bl DestroyTask
_081CC440:
	bl sub_081CC6B8
_081CC444:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CC44C: .4byte 0xFFFFA000
	thumb_func_end sub_081CC3DC

	thumb_func_start sub_081CC450
sub_081CC450: @ 0x081CC450
	push {lr}
	ldr r0, _081CC460
	movs r1, #1
	bl CreateLoopedTask
	pop {r0}
	bx r0
	.align 2, 0
_081CC460: .4byte 0x081CC475
	thumb_func_end sub_081CC450

	thumb_func_start sub_081CC464
sub_081CC464: @ 0x081CC464
	push {lr}
	ldr r0, _081CC470
	bl FuncIsActiveLoopedTask
	pop {r1}
	bx r1
	.align 2, 0
_081CC470: .4byte 0x081CC475
	thumb_func_end sub_081CC464

	thumb_func_start sub_081CC474
sub_081CC474: @ 0x081CC474
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #4
	bl GetSubstructPtr
	adds r2, r0, #0
	cmp r4, #0x15
	ble _081CC488
	movs r0, #4
	b _081CC4A2
_081CC488:
	ldr r0, _081CC4A8
	lsls r1, r4, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xc8
	muls r1, r4, r1
	ldr r3, _081CC4AC
	adds r1, r1, r3
	adds r1, r2, r1
	bl LZ77UnCompWram
	movs r0, #1
_081CC4A2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CC4A8: .4byte 0x085F4D3C
_081CC4AC: .4byte 0x00000818
	thumb_func_end sub_081CC474

	thumb_func_start sub_081CC4B0
sub_081CC4B0: @ 0x081CC4B0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r3, r1, #0
	movs r4, #0
	ldr r0, _081CC51C
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, r3
	bne _081CC4CA
	ldrh r0, [r5, #2]
	cmp r0, r2
	beq _081CC4E0
_081CC4CA:
	adds r4, #1
	cmp r4, #0x15
	bgt _081CC4E0
	lsls r0, r4, #3
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r3
	bne _081CC4CA
	ldrh r0, [r1, #2]
	cmp r0, r2
	bne _081CC4CA
_081CC4E0:
	cmp r4, #0x16
	beq _081CC514
	ldr r1, _081CC520
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #1
	movs r2, #0x11
	movs r3, #6
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0xc8
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _081CC524
	adds r1, r1, r0
	adds r1, r6, r1
	movs r0, #0xa
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r2, #0x12
	movs r3, #6
	bl CopyToBgTilemapBufferRect
_081CC514:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CC51C: .4byte 0x085F4D3C
_081CC520: .4byte 0x00001041
_081CC524: .4byte 0x00000818
	thumb_func_end sub_081CC4B0

	thumb_func_start sub_081CC528
sub_081CC528: @ 0x081CC528
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov sb, r0
	movs r5, #0
	ldr r6, _081CC544
	movs r4, #0x90
	lsls r4, r4, #0x15
	lsls r1, r1, #0x18
	mov r8, r1
	lsls r7, r2, #0x18
	b _081CC574
	.align 2, 0
_081CC544: .4byte 0x02021C40
_081CC548:
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0xc
	bl StringCopyPadded
	mov r1, sb
	ldrb r0, [r1, #8]
	lsrs r1, r4, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0x80
	lsls r0, r0, #0x15
	adds r4, r4, r0
	adds r5, #1
_081CC574:
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	mov r1, r8
	lsrs r0, r1, #0x18
	lsrs r1, r7, #0x18
	bl GetLandmarkName
	adds r1, r0, #0
	cmp r1, #0
	bne _081CC548
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CC528

	thumb_func_start sub_081CC598
sub_081CC598: @ 0x081CC598
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #4
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_08124664
	lsls r0, r0, #0x18
	movs r2, #0x84
	cmp r0, #0
	bne _081CC5B4
	movs r2, #0xe4
_081CC5B4:
	movs r5, #0
	lsls r7, r2, #0x10
	adds r4, #0xc
	mov r8, r4
	movs r6, #0x98
	lsls r6, r6, #0x10
_081CC5C0:
	asrs r1, r6, #0x10
	ldr r0, _081CC624
	asrs r2, r7, #0x10
	movs r3, #8
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _081CC628
	adds r2, r2, r0
	movs r0, #0
	strh r0, [r2, #0x2e]
	lsls r4, r5, #2
	strh r4, [r2, #0x30]
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r0, r1, #0x16
	adds r1, r0, #0
	strh r0, [r2, #0x32]
	movs r0, #0x96
	strh r0, [r2, #0x34]
	strh r4, [r2, #0x36]
	adds r1, r1, r4
	ldr r4, _081CC62C
	adds r0, r4, #0
	ands r1, r0
	ldr r4, _081CC630
	adds r0, r4, #0
	ands r3, r0
	orrs r3, r1
	strh r3, [r2, #4]
	mov r0, r8
	adds r0, #4
	mov r8, r0
	subs r0, #4
	stm r0!, {r2}
	movs r4, #0x80
	lsls r4, r4, #0xe
	adds r6, r6, r4
	adds r5, #1
	cmp r5, #2
	ble _081CC5C0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CC624: .4byte 0x085F4DF4
_081CC628: .4byte 0x020205AC
_081CC62C: .4byte 0x000003FF
_081CC630: .4byte 0xFFFFFC00
	thumb_func_end sub_081CC598

	thumb_func_start sub_081CC634
sub_081CC634: @ 0x081CC634
	push {r4, r5, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x34]
	movs r1, #0x34
	ldrsh r4, [r3, r1]
	cmp r4, #0
	beq _081CC646
	subs r0, #1
	b _081CC6AE
_081CC646:
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _081CC656
	strh r4, [r3, #0x2e]
_081CC656:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _081CC666
	strh r4, [r3, #0x30]
_081CC666:
	ldrh r5, [r3, #0x30]
	ldrh r2, [r3, #0x32]
	adds r1, r5, r2
	ldr r2, _081CC694
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #4]
	ldr r0, _081CC698
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldrh r1, [r3, #0x38]
	movs r2, #0x38
	ldrsh r0, [r3, r2]
	cmp r0, #3
	bgt _081CC69C
	movs r2, #0x2e
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bne _081CC6B0
	adds r0, r1, #1
	strh r0, [r3, #0x38]
	b _081CC6AC
	.align 2, 0
_081CC694: .4byte 0x000003FF
_081CC698: .4byte 0xFFFFFC00
_081CC69C:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bne _081CC6B0
	strh r4, [r3, #0x38]
	strh r4, [r3, #0x2e]
_081CC6AC:
	movs r0, #0x78
_081CC6AE:
	strh r0, [r3, #0x34]
_081CC6B0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CC634

	thumb_func_start sub_081CC6B8
sub_081CC6B8: @ 0x081CC6B8
	push {r4, lr}
	movs r0, #4
	bl GetSubstructPtr
	adds r4, r0, #0
	movs r0, #1
	bl GetBgY
	asrs r0, r0, #8
	movs r1, #0x84
	subs r1, r1, r0
	adds r4, #0xc
	movs r2, #2
_081CC6D2:
	ldm r4!, {r0}
	strh r1, [r0, #0x22]
	subs r2, #1
	cmp r2, #0
	bge _081CC6D2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CC6B8

	thumb_func_start sub_081CC6E4
sub_081CC6E4: @ 0x081CC6E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #4
	bl GetSubstructPtr
	movs r1, #1
	ands r4, r1
	lsls r5, r4, #2
	movs r6, #5
	rsbs r6, r6, #0
	adds r4, r0, #0
	adds r4, #0xc
	movs r3, #2
_081CC6FE:
	ldm r4!, {r0}
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r1, r6, #0
	ands r1, r2
	orrs r1, r5
	strb r1, [r0]
	subs r3, #1
	cmp r3, #0
	bge _081CC6FE
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081CC6E4

	thumb_func_start sub_081CC718
sub_081CC718: @ 0x081CC718
	push {r4, lr}
	ldr r1, _081CC748
	movs r0, #0xb
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CC75C
	ldr r1, _081CC74C
	adds r0, r4, r1
	bl sub_081D151C
	bl sub_081CD0D0
	ldr r1, _081CC750
	movs r0, #0x14
	strh r0, [r1]
	ldr r0, _081CC754
	adds r1, r4, r0
	ldr r0, _081CC758
	str r0, [r1]
	movs r0, #1
	b _081CC75E
	.align 2, 0
_081CC748: .4byte 0x0000678C
_081CC74C: .4byte 0x00006428
_081CC750: .4byte 0x03002350
_081CC754: .4byte 0x00006304
_081CC758: .4byte 0x081CC7CD
_081CC75C:
	movs r0, #0
_081CC75E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CC718

	thumb_func_start sub_081CC764
sub_081CC764: @ 0x081CC764
	push {r4, lr}
	ldr r1, _081CC794
	movs r0, #0xb
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CC7A8
	ldr r1, _081CC798
	adds r0, r4, r1
	bl sub_081D151C
	bl sub_081CD158
	ldr r1, _081CC79C
	movs r0, #0x14
	strh r0, [r1]
	ldr r0, _081CC7A0
	adds r1, r4, r0
	ldr r0, _081CC7A4
	str r0, [r1]
	movs r0, #1
	b _081CC7AA
	.align 2, 0
_081CC794: .4byte 0x0000678C
_081CC798: .4byte 0x00006428
_081CC79C: .4byte 0x03002350
_081CC7A0: .4byte 0x00006304
_081CC7A4: .4byte 0x081CC7CD
_081CC7A8:
	movs r0, #0
_081CC7AA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CC764

	thumb_func_start sub_081CC7B0
sub_081CC7B0: @ 0x081CC7B0
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	ldr r2, _081CC7C8
	adds r1, r0, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
_081CC7C8: .4byte 0x00006304
	thumb_func_end sub_081CC7B0

	thumb_func_start sub_081CC7CC
sub_081CC7CC: @ 0x081CC7CC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x12
	bl GetSubstructPtr
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_081CC924
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _081CC840
	ldr r0, _081CC824
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081CC810
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081CC840
	movs r1, #0xc6
	lsls r1, r1, #7
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081CC830
	ldrh r1, [r5, #2]
	ldrh r0, [r5]
	subs r0, #1
	cmp r1, r0
	bne _081CC840
_081CC810:
	movs r0, #5
	bl PlaySE
	ldr r0, _081CC828
	adds r1, r4, r0
	ldr r0, _081CC82C
	str r0, [r1]
	movs r2, #2
	b _081CC840
	.align 2, 0
_081CC824: .4byte 0x03002360
_081CC828: .4byte 0x00006304
_081CC82C: .4byte 0x081CC8DD
_081CC830:
	movs r0, #5
	bl PlaySE
	movs r2, #5
	ldr r0, _081CC848
	adds r1, r4, r0
	ldr r0, _081CC84C
	str r0, [r1]
_081CC840:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081CC848: .4byte 0x00006304
_081CC84C: .4byte 0x081CC851
	thumb_func_end sub_081CC7CC

	thumb_func_start sub_081CC850
sub_081CC850: @ 0x081CC850
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r4, #0
	bl sub_081200C4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CC8CA
	bl sub_081CE648
	ldr r1, _081CC8A8
	adds r5, r6, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r2, _081CC8AC
	adds r4, r6, r2
	adds r1, r4, r1
	strb r0, [r1]
	movs r0, #0x12
	bl GetSubstructPtr
	ldrh r1, [r0, #2]
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r4, r4, r0
	ldrb r1, [r4]
	mov r0, sp
	strb r1, [r0]
	cmp r2, #0xe
	bne _081CC8B4
	movs r0, #0x64
	muls r0, r3, r0
	ldr r1, _081CC8B0
	adds r0, r0, r1
	movs r1, #8
	mov r2, sp
	bl SetMonData
	b _081CC8C0
	.align 2, 0
_081CC8A8: .4byte 0x00006786
_081CC8AC: .4byte 0x00006783
_081CC8B0: .4byte 0x02024190
_081CC8B4:
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #8
	mov r3, sp
	bl SetBoxMonDataAt
_081CC8C0:
	ldr r0, _081CC8D4
	adds r1, r6, r0
	ldr r0, _081CC8D8
	str r0, [r1]
	movs r4, #6
_081CC8CA:
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081CC8D4: .4byte 0x00006304
_081CC8D8: .4byte 0x081CC7CD
	thumb_func_end sub_081CC850

	thumb_func_start sub_081CC8DC
sub_081CC8DC: @ 0x081CC8DC
	push {lr}
	movs r1, #0xc6
	lsls r1, r1, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081CC8F4
	ldr r0, _081CC8F0
	b _081CC8F6
	.align 2, 0
_081CC8F0: .4byte 0x000186AA
_081CC8F4:
	ldr r0, _081CC8FC
_081CC8F6:
	pop {r1}
	bx r1
	.align 2, 0
_081CC8FC: .4byte 0x000186A2
	thumb_func_end sub_081CC8DC

	thumb_func_start sub_081CC900
sub_081CC900: @ 0x081CC900
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	movs r1, #0xc6
	lsls r1, r1, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081CC91A
	movs r0, #0x12
	bl FreePokenavSubstruct
_081CC91A:
	movs r0, #0xb
	bl FreePokenavSubstruct
	pop {r0}
	bx r0
	thumb_func_end sub_081CC900

	thumb_func_start sub_081CC924
sub_081CC924: @ 0x081CC924
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x12
	bl GetSubstructPtr
	adds r2, r0, #0
	movs r3, #0
	ldr r0, _081CC95C
	ldrh r1, [r0, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081CC960
	movs r1, #0xc6
	lsls r1, r1, #7
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081CC950
	ldrh r0, [r2, #2]
	cmp r0, #0
	beq _081CC98E
_081CC950:
	movs r0, #5
	bl PlaySE
	movs r0, #1
	b _081CC986
	.align 2, 0
_081CC95C: .4byte 0x03002360
_081CC960:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081CC98E
	movs r1, #0xc6
	lsls r1, r1, #7
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081CC97E
	ldrh r1, [r2, #2]
	ldrh r0, [r2]
	subs r0, #1
	cmp r1, r0
	bge _081CC98E
_081CC97E:
	movs r0, #5
	bl PlaySE
	movs r0, #0
_081CC986:
	bl sub_081CC998
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_081CC98E:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CC924

	thumb_func_start sub_081CC998
sub_081CC998: @ 0x081CC998
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0xb
	bl GetSubstructPtr
	adds r4, r0, #0
	movs r0, #0x12
	bl GetSubstructPtr
	adds r5, r0, #0
	mov r0, r8
	cmp r0, #0
	beq _081CC9C4
	ldr r1, _081CC9C0
	adds r0, r4, r1
	b _081CC9C8
	.align 2, 0
_081CC9C0: .4byte 0x00006788
_081CC9C4:
	ldr r2, _081CCA08
	adds r0, r4, r2
_081CC9C8:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r0, #0
	ldr r1, _081CCA0C
	adds r0, r4, r1
	ldr r2, _081CCA10
	adds r1, r4, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r3, _081CCA14
	adds r1, r1, r3
	adds r1, r4, r1
	lsls r2, r7, #2
	adds r2, r2, r7
	lsls r2, r2, #2
	adds r2, r2, r3
	adds r2, r4, r2
	bl sub_081D15CC
	ldrh r6, [r5, #2]
	bl sub_081CD4BC
	cmp r0, #0
	beq _081CCA18
	ldrh r1, [r5]
	b _081CCA1C
	.align 2, 0
_081CCA08: .4byte 0x00006787
_081CCA0C: .4byte 0x00006428
_081CCA10: .4byte 0x00006786
_081CCA14: .4byte 0x0000643C
_081CCA18:
	ldrh r1, [r5]
	subs r1, #1
_081CCA1C:
	eors r1, r6
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	adds r6, r0, #0
	mov r0, r8
	cmp r0, #0
	beq _081CCA72
	ldr r1, _081CCA60
	adds r2, r4, r1
	ldrb r0, [r2]
	adds r1, #1
	adds r3, r4, r1
	strb r0, [r3]
	ldr r0, _081CCA64
	adds r1, r4, r0
	ldrb r0, [r1]
	strb r0, [r2]
	strb r7, [r1]
	ldrb r1, [r3]
	ldr r2, _081CCA68
	adds r0, r4, r2
	strb r1, [r0]
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _081CCA52
	ldrh r0, [r5]
_081CCA52:
	subs r1, r0, #1
	strh r1, [r5, #2]
	lsls r0, r1, #0x10
	cmp r0, #0
	beq _081CCA6C
	subs r1, #1
	b _081CCAC4
	.align 2, 0
_081CCA60: .4byte 0x00006787
_081CCA64: .4byte 0x00006786
_081CCA68: .4byte 0x00006789
_081CCA6C:
	ldrh r0, [r5]
	subs r1, r0, #1
	b _081CCAC4
_081CCA72:
	ldr r0, _081CCAA0
	adds r2, r4, r0
	ldrb r0, [r2]
	ldr r1, _081CCAA4
	adds r3, r4, r1
	strb r0, [r3]
	ldr r0, _081CCAA8
	adds r1, r4, r0
	ldrb r0, [r1]
	strb r0, [r2]
	strb r7, [r1]
	ldrb r1, [r3]
	ldr r2, _081CCAAC
	adds r0, r4, r2
	strb r1, [r0]
	ldrh r1, [r5, #2]
	ldrh r0, [r5]
	subs r0, #1
	cmp r1, r0
	bge _081CCAB0
	adds r0, r1, #1
	b _081CCAB2
	.align 2, 0
_081CCAA0: .4byte 0x00006788
_081CCAA4: .4byte 0x00006787
_081CCAA8: .4byte 0x00006786
_081CCAAC: .4byte 0x00006789
_081CCAB0:
	movs r0, #0
_081CCAB2:
	strh r0, [r5, #2]
	ldrh r1, [r5, #2]
	ldrh r0, [r5]
	subs r0, #1
	cmp r1, r0
	bge _081CCAC2
	adds r1, #1
	b _081CCAC4
_081CCAC2:
	movs r1, #0
_081CCAC4:
	ldr r2, _081CCAD8
	adds r0, r4, r2
	strh r1, [r0]
	ldrh r4, [r5, #2]
	bl sub_081CD4BC
	cmp r0, #0
	beq _081CCADC
	ldrh r1, [r5]
	b _081CCAE0
	.align 2, 0
_081CCAD8: .4byte 0x00006302
_081CCADC:
	ldrh r1, [r5]
	subs r1, #1
_081CCAE0:
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	cmp r6, #0
	bne _081CCAF0
	movs r0, #3
	b _081CCAFA
_081CCAF0:
	cmp r0, #0
	beq _081CCAF8
	movs r0, #1
	b _081CCAFA
_081CCAF8:
	movs r0, #4
_081CCAFA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081CC998

	thumb_func_start sub_081CCB04
sub_081CCB04: @ 0x081CCB04
	push {r4, lr}
	movs r0, #0xb
	bl GetSubstructPtr
	adds r4, r0, #0
	movs r0, #0x12
	bl GetSubstructPtr
	adds r2, r0, #0
	ldr r1, _081CCB2C
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #9
	bls _081CCB22
	b _081CCC70
_081CCB22:
	lsls r0, r0, #2
	ldr r1, _081CCB30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CCB2C: .4byte 0x0000678A
_081CCB30: .4byte 0x081CCB34
_081CCB34: @ jump table
	.4byte _081CCB5C @ case 0
	.4byte _081CCB68 @ case 1
	.4byte _081CCB74 @ case 2
	.4byte _081CCB80 @ case 3
	.4byte _081CCBD0 @ case 4
	.4byte _081CCBE8 @ case 5
	.4byte _081CCC00 @ case 6
	.4byte _081CCC18 @ case 7
	.4byte _081CCC30 @ case 8
	.4byte _081CCC48 @ case 9
_081CCB5C:
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r1, #0
	bl sub_081CCF84
	b _081CCC70
_081CCB68:
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r1, #0
	bl sub_081CD17C
	b _081CCC70
_081CCB74:
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r1, #0
	bl sub_081CD2F8
	b _081CCC70
_081CCB80:
	ldrh r0, [r2]
	cmp r0, #1
	bne _081CCBA8
	ldr r2, _081CCBA4
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	adds r2, #1
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	movs r0, #1
	b _081CCC7C
	.align 2, 0
_081CCBA4: .4byte 0x00006786
_081CCBA8:
	ldr r0, _081CCBC4
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r2, _081CCBC8
	adds r1, r4, r2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _081CCBCC
	adds r1, r4, r0
	movs r0, #2
	strb r0, [r1]
	b _081CCC70
	.align 2, 0
_081CCBC4: .4byte 0x00006786
_081CCBC8: .4byte 0x00006787
_081CCBCC: .4byte 0x00006788
_081CCBD0:
	ldrh r0, [r2, #2]
	adds r0, #1
	ldrh r2, [r2]
	cmp r0, r2
	blt _081CCBDC
	movs r0, #0
_081CCBDC:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	bl sub_081CCF84
	b _081CCC70
_081CCBE8:
	ldrh r0, [r2, #2]
	adds r0, #1
	ldrh r2, [r2]
	cmp r0, r2
	blt _081CCBF4
	movs r0, #0
_081CCBF4:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	bl sub_081CD17C
	b _081CCC70
_081CCC00:
	ldrh r0, [r2, #2]
	adds r0, #1
	ldrh r2, [r2]
	cmp r0, r2
	blt _081CCC0C
	movs r0, #0
_081CCC0C:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	bl sub_081CD2F8
	b _081CCC70
_081CCC18:
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r0, #0
	bge _081CCC24
	ldrh r0, [r2]
	subs r0, #1
_081CCC24:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #2
	bl sub_081CCF84
	b _081CCC70
_081CCC30:
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r0, #0
	bge _081CCC3C
	ldrh r0, [r2]
	subs r0, #1
_081CCC3C:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #2
	bl sub_081CD17C
	b _081CCC70
_081CCC48:
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r0, #0
	bge _081CCC54
	ldrh r0, [r2]
	subs r0, #1
_081CCC54:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #2
	bl sub_081CD2F8
	ldr r2, _081CCC6C
	adds r1, r4, r2
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	b _081CCC7C
	.align 2, 0
_081CCC6C: .4byte 0x0000678A
_081CCC70:
	ldr r0, _081CCC84
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
_081CCC7C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CCC84: .4byte 0x0000678A
	thumb_func_end sub_081CCB04

	thumb_func_start sub_081CCC88
sub_081CCC88: @ 0x081CCC88
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	movs r0, #0xb
	bl GetSubstructPtr
	adds r1, r0, #0
	cmp r4, #1
	beq _081CCCC8
	cmp r4, #1
	bgt _081CCCA6
	cmp r4, #0
	beq _081CCCAC
	b _081CCD04
_081CCCA6:
	cmp r5, #2
	beq _081CCCE4
	b _081CCD04
_081CCCAC:
	ldr r2, _081CCCC0
	adds r0, r1, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r2, _081CCCC4
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_081CCF84
	b _081CCD04
	.align 2, 0
_081CCCC0: .4byte 0x00006302
_081CCCC4: .4byte 0x00006789
_081CCCC8:
	ldr r2, _081CCCDC
	adds r0, r1, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r2, _081CCCE0
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_081CD17C
	b _081CCD04
	.align 2, 0
_081CCCDC: .4byte 0x00006302
_081CCCE0: .4byte 0x00006789
_081CCCE4:
	ldr r2, _081CCCFC
	adds r0, r1, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r2, _081CCD00
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_081CD2F8
	movs r0, #1
	b _081CCD06
	.align 2, 0
_081CCCFC: .4byte 0x00006302
_081CCD00: .4byte 0x00006789
_081CCD04:
	movs r0, #0
_081CCD06:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CCC88

	thumb_func_start sub_081CCD0C
sub_081CCD0C: @ 0x081CCD0C
	push {r4, lr}
	adds r4, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	b _081CCD24
_081CCD16:
	strb r3, [r4]
	adds r1, #1
	adds r4, #1
	lsls r0, r2, #0x10
	ldr r2, _081CCD60
	adds r0, r0, r2
	lsrs r2, r0, #0x10
_081CCD24:
	ldrb r3, [r1]
	adds r0, r3, #0
	cmp r0, #0xff
	bne _081CCD16
	adds r1, r2, #0
	lsls r0, r1, #0x10
	ldr r2, _081CCD60
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	cmp r1, #0
	ble _081CCD52
	movs r3, #0
_081CCD3E:
	strb r3, [r4]
	adds r4, #1
	adds r1, r2, #0
	lsls r0, r1, #0x10
	ldr r2, _081CCD60
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _081CCD3E
_081CCD52:
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CCD60: .4byte 0xFFFF0000
	thumb_func_end sub_081CCD0C

	thumb_func_start sub_081CCD64
sub_081CCD64: @ 0x081CCD64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	movs r0, #0x12
	bl GetSubstructPtr
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r4, [r0, #4]
	mov r8, r4
	ldrb r6, [r0, #5]
	mov sb, r6
	movs r0, #0xfc
	strb r0, [r5]
	adds r5, #1
	movs r0, #4
	strb r0, [r5]
	adds r5, #1
	movs r0, #8
	strb r0, [r5]
	adds r5, #1
	movs r0, #0
	strb r0, [r5]
	adds r5, #1
	movs r0, #9
	strb r0, [r5]
	adds r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x2d
	movs r3, #0
	bl GetBoxOrPartyMonData
	cmp r0, #0
	beq _081CCDD0
	ldr r1, _081CCDCC
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0xc
	bl StringCopyPadded
	b _081CCF6C
	.align 2, 0
_081CCDCC: .4byte 0x085C8C62
_081CCDD0:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	adds r3, r5, #0
	bl GetBoxOrPartyMonData
	adds r0, r5, #0
	bl StringGetEnd10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xb
	movs r3, #0
	bl GetBoxOrPartyMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0xe
	bne _081CCE20
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _081CCE1C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r4, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _081CCE3E
	.align 2, 0
_081CCE1C: .4byte 0x02024190
_081CCE20:
	mov r0, r8
	mov r1, sb
	bl GetBoxedMonPtr
	adds r4, r0, #0
	bl GetBoxMonGender
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	bl GetLevelFromBoxMonExp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_081CCE3E:
	cmp r7, #0x1d
	beq _081CCE46
	cmp r7, #0x20
	bne _081CCE5C
_081CCE46:
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _081CCE64
	adds r1, r1, r0
	adds r0, r5, #0
	bl StringCompare
	cmp r0, #0
	bne _081CCE5C
	movs r6, #0xff
_081CCE5C:
	adds r3, r5, #0
	movs r4, #0
	b _081CCE70
	.align 2, 0
_081CCE64: .4byte 0x082EA31C
_081CCE68:
	adds r3, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_081CCE70:
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _081CCE68
	adds r1, r4, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r1, #4
	bhi _081CCE94
	movs r2, #0
_081CCE84:
	strb r2, [r3]
	adds r3, #1
	adds r1, r4, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r1, #4
	bls _081CCE84
_081CCE94:
	movs r0, #0
	strb r0, [r3]
	adds r3, #1
	cmp r6, #0
	beq _081CCEA4
	cmp r6, #0xfe
	beq _081CCECA
	b _081CCEEE
_081CCEA4:
	movs r1, #0xfc
	strb r1, [r3]
	adds r3, #1
	movs r0, #1
	strb r0, [r3]
	adds r3, #1
	movs r0, #4
	strb r0, [r3]
	adds r3, #1
	strb r1, [r3]
	adds r3, #1
	movs r0, #3
	strb r0, [r3]
	adds r3, #1
	movs r0, #5
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xb5
	b _081CCEEE
_081CCECA:
	movs r1, #0xfc
	strb r1, [r3]
	adds r3, #1
	movs r0, #1
	strb r0, [r3]
	adds r3, #1
	movs r0, #6
	strb r0, [r3]
	adds r3, #1
	strb r1, [r3]
	adds r3, #1
	movs r0, #3
	strb r0, [r3]
	adds r3, #1
	movs r0, #7
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xb6
_081CCEEE:
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xfc
	strb r0, [r3]
	adds r3, #1
	movs r0, #4
	strb r0, [r3]
	adds r3, #1
	movs r0, #8
	strb r0, [r3]
	adds r3, #1
	movs r5, #0
	strb r5, [r3]
	adds r3, #1
	movs r0, #9
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xba
	strb r0, [r3]
	adds r3, #1
	movs r0, #0xf9
	strb r0, [r3]
	adds r3, #1
	movs r0, #5
	strb r0, [r3]
	adds r3, #1
	adds r4, r3, #0
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r3, r0, #0
	subs r4, r3, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strb r5, [r3]
	adds r3, #1
	mov r0, sl
	cmp r0, #0
	bne _081CCF66
	movs r0, #3
	subs r0, r0, r4
	lsls r0, r0, #0x10
	ldr r1, _081CCF7C
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	ldr r0, _081CCF80
	cmp r4, r0
	beq _081CCF66
	movs r2, #0
	adds r1, r0, #0
_081CCF58:
	strb r2, [r3]
	adds r3, #1
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r1
	bne _081CCF58
_081CCF66:
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r3, #0
_081CCF6C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081CCF7C: .4byte 0xFFFF0000
_081CCF80: .4byte 0x0000FFFF
	thumb_func_end sub_081CCD64

	thumb_func_start sub_081CCF84
sub_081CCF84: @ 0x081CCF84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r0, #0xb
	bl GetSubstructPtr
	adds r5, r0, #0
	movs r0, #0x12
	bl GetSubstructPtr
	adds r7, r0, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	bl sub_081CD4BC
	cmp r0, #0
	beq _081CCFBA
	ldrh r2, [r7]
	cmp r4, r2
	bne _081CCFC2
	b _081CD060
_081CCFBA:
	ldrh r0, [r7]
	subs r0, #1
	cmp r4, r0
	beq _081CD060
_081CCFC2:
	lsls r0, r6, #6
	ldr r1, _081CD024
	adds r0, r0, r1
	adds r0, r5, r0
	mov r2, r8
	lsls r4, r2, #0x10
	lsrs r1, r4, #0x10
	movs r2, #0
	bl sub_081CCD64
	asrs r4, r4, #0xe
	adds r4, r7, r4
	ldrb r3, [r4, #4]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r4, r0, #3
	ldr r1, _081CD028
	adds r0, r5, r1
	adds r0, r0, r4
	movs r2, #0
	movs r1, #0xfc
	strb r1, [r0]
	ldr r1, _081CD02C
	adds r0, r5, r1
	adds r0, r0, r4
	movs r1, #4
	strb r1, [r0]
	ldr r1, _081CD030
	adds r0, r5, r1
	adds r0, r0, r4
	movs r1, #8
	strb r1, [r0]
	ldr r1, _081CD034
	adds r0, r5, r1
	adds r0, r0, r4
	strb r2, [r0]
	ldr r2, _081CD038
	adds r0, r5, r2
	adds r0, r0, r4
	movs r1, #9
	strb r1, [r0]
	cmp r3, #0xe
	bne _081CD044
	adds r0, r4, r5
	ldr r1, _081CD03C
	adds r0, r0, r1
	ldr r1, _081CD040
	b _081CD054
	.align 2, 0
_081CD024: .4byte 0x00006368
_081CD028: .4byte 0x00006320
_081CD02C: .4byte 0x00006321
_081CD030: .4byte 0x00006322
_081CD034: .4byte 0x00006323
_081CD038: .4byte 0x00006324
_081CD03C: .4byte 0x00006325
_081CD040: .4byte 0x085CB7C6
_081CD044:
	adds r4, r4, r5
	ldr r2, _081CD05C
	adds r4, r4, r2
	adds r0, r3, #0
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
_081CD054:
	movs r2, #8
	bl sub_081CCD0C
	b _081CD0BC
	.align 2, 0
_081CD05C: .4byte 0x00006325
_081CD060:
	movs r1, #0
	lsls r4, r6, #6
	lsls r0, r6, #1
	mov r8, r0
	adds r3, r4, #0
	ldr r0, _081CD0C8
	adds r2, r5, r0
	movs r7, #0
_081CD070:
	adds r0, r1, r3
	adds r0, r2, r0
	strb r7, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xb
	bls _081CD070
	adds r1, r1, r4
	ldr r2, _081CD0C8
	adds r0, r5, r2
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	movs r1, #0
	mov r2, r8
	adds r0, r2, r6
	lsls r3, r0, #3
	ldr r0, _081CD0CC
	adds r2, r5, r0
	movs r4, #0
_081CD09A:
	adds r0, r1, r3
	adds r0, r2, r0
	strb r4, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #7
	bls _081CD09A
	mov r2, r8
	adds r0, r2, r6
	lsls r0, r0, #3
	adds r0, r1, r0
	ldr r2, _081CD0CC
	adds r1, r5, r2
	adds r1, r1, r0
	movs r0, #0xff
	strb r0, [r1]
_081CD0BC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CD0C8: .4byte 0x00006368
_081CD0CC: .4byte 0x00006320
	thumb_func_end sub_081CCF84

	thumb_func_start sub_081CD0D0
sub_081CD0D0: @ 0x081CD0D0
	push {r4, r5, r6, r7, lr}
	movs r0, #0xb
	bl GetSubstructPtr
	adds r7, r0, #0
	ldr r1, _081CD0F4
	movs r0, #0x12
	bl AllocSubstruct
	adds r6, r0, #0
	movs r0, #0xc6
	lsls r0, r0, #7
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	movs r5, #0
	b _081CD124
	.align 2, 0
_081CD0F4: .4byte 0x000006AC
_081CD0F8:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081CD150
	adds r0, r0, r1
	movs r1, #0x2d
	bl GetMonData
	adds r2, r0, #0
	cmp r2, #0
	bne _081CD11E
	lsls r1, r5, #2
	adds r1, r6, r1
	movs r0, #0xe
	strb r0, [r1, #4]
	strb r4, [r1, #5]
	strh r2, [r1, #6]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_081CD11E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_081CD124:
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _081CD0F8
	lsls r0, r5, #2
	adds r0, r6, r0
	movs r1, #0
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	movs r2, #0
	strh r1, [r0, #6]
	strh r1, [r6, #2]
	adds r0, r5, #1
	strh r0, [r6]
	ldr r1, _081CD154
	adds r0, r7, r1
	strb r2, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CD150: .4byte 0x02024190
_081CD154: .4byte 0x0000678A
	thumb_func_end sub_081CD0D0

	thumb_func_start sub_081CD158
sub_081CD158: @ 0x081CD158
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	movs r1, #0xc6
	lsls r1, r1, #7
	adds r2, r0, r1
	movs r3, #0
	movs r1, #1
	strb r1, [r2]
	ldr r1, _081CD178
	adds r0, r0, r1
	strb r3, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_081CD178: .4byte 0x0000678A
	thumb_func_end sub_081CD158

	thumb_func_start sub_081CD17C
sub_081CD17C: @ 0x081CD17C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r0, #0xb
	bl GetSubstructPtr
	mov r8, r0
	movs r0, #0x12
	bl GetSubstructPtr
	adds r4, r0, #0
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
	bl sub_081CD4BC
	cmp r0, #0
	beq _081CD1B2
	ldrh r0, [r4]
	cmp r5, r0
	bne _081CD1BA
	b _081CD2A8
_081CD1B2:
	ldrh r0, [r4]
	subs r0, #1
	cmp r5, r0
	beq _081CD2A8
_081CD1BA:
	lsls r0, r6, #0x10
	asrs r0, r0, #0xe
	adds r0, r4, r0
	ldrb r6, [r0, #4]
	ldrb r7, [r0, #5]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x16
	movs r3, #0
	bl GetBoxOrPartyMonData
	mov r1, sb
	lsls r5, r1, #2
	adds r4, r5, r1
	ldr r1, _081CD25C
	add r1, r8
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x2f
	movs r3, #0
	bl GetBoxOrPartyMonData
	ldr r1, _081CD260
	add r1, r8
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x21
	movs r3, #0
	bl GetBoxOrPartyMonData
	ldr r1, _081CD264
	add r1, r8
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x18
	movs r3, #0
	bl GetBoxOrPartyMonData
	ldr r1, _081CD268
	add r1, r8
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x17
	movs r3, #0
	bl GetBoxOrPartyMonData
	ldr r1, _081CD26C
	add r1, r8
	adds r1, r1, r4
	strb r0, [r1]
	movs r0, #0xcf
	lsls r0, r0, #7
	add r0, r8
	mov r2, sb
	adds r4, r0, r2
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x30
	movs r3, #0
	bl GetBoxOrPartyMonData
	cmp r0, #0xff
	beq _081CD270
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x30
	movs r3, #0
	bl GetBoxOrPartyMonData
	movs r1, #0x1d
	bl __udivsi3
	b _081CD272
	.align 2, 0
_081CD25C: .4byte 0x00006428
_081CD260: .4byte 0x00006429
_081CD264: .4byte 0x0000642A
_081CD268: .4byte 0x0000642B
_081CD26C: .4byte 0x0000642C
_081CD270:
	movs r0, #9
_081CD272:
	strb r0, [r4]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #8
	movs r3, #0
	bl GetBoxOrPartyMonData
	ldr r1, _081CD2A0
	add r1, r8
	add r1, sb
	strb r0, [r1]
	mov r0, sb
	adds r1, r5, r0
	ldr r2, _081CD2A4
	adds r0, r1, r2
	add r0, r8
	lsls r1, r1, #2
	adds r2, #0x14
	adds r1, r1, r2
	add r1, r8
	bl sub_081D1D70
	b _081CD2E0
	.align 2, 0
_081CD2A0: .4byte 0x00006783
_081CD2A4: .4byte 0x00006428
_081CD2A8:
	movs r2, #0
	mov r0, sb
	lsls r5, r0, #2
	add r5, sb
	ldr r4, _081CD2EC
	add r4, r8
	lsls r3, r5, #2
	mov sb, r2
	ldr r7, _081CD2F0
	movs r6, #0x9b
_081CD2BC:
	adds r0, r2, r5
	adds r0, r4, r0
	mov r1, sb
	strb r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r3
	add r0, r8
	adds r1, r0, r7
	strh r6, [r1]
	ldr r1, _081CD2F4
	adds r0, r0, r1
	movs r1, #0x5b
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #4
	bls _081CD2BC
_081CD2E0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CD2EC: .4byte 0x00006428
_081CD2F0: .4byte 0x0000643C
_081CD2F4: .4byte 0x0000643E
	thumb_func_end sub_081CD17C

	thumb_func_start sub_081CD2F8
sub_081CD2F8: @ 0x081CD2F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r0, #0xb
	bl GetSubstructPtr
	adds r7, r0, #0
	movs r0, #0x12
	bl GetSubstructPtr
	adds r4, r0, #0
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
	bl sub_081CD4BC
	cmp r0, #0
	beq _081CD32C
	ldrh r0, [r4]
	b _081CD330
_081CD32C:
	ldrh r0, [r4]
	subs r0, #1
_081CD330:
	cmp r5, r0
	beq _081CD39E
	lsls r0, r6, #0x10
	asrs r0, r0, #0xe
	adds r0, r4, r0
	ldrb r5, [r0, #4]
	ldrb r6, [r0, #5]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x41
	movs r3, #0
	bl GetBoxOrPartyMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #0
	bl GetBoxOrPartyMonData
	mov r8, r0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl GetBoxOrPartyMonData
	adds r5, r0, #0
	lsls r0, r4, #3
	ldr r1, _081CD3AC
	adds r0, r0, r1
	mov r2, sb
	lsls r1, r2, #0xd
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r1, r2
	adds r1, r7, r1
	movs r2, #1
	str r2, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl LoadSpecialPokePic
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl GetMonSpritePalFromSpeciesAndPersonality
	mov r2, sb
	lsls r1, r2, #7
	adds r1, r7, r1
	bl LZ77UnCompWram
_081CD39E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CD3AC: .4byte 0x082DDA1C
	thumb_func_end sub_081CD2F8

	thumb_func_start sub_081CD3B0
sub_081CD3B0: @ 0x081CD3B0
	push {lr}
	movs r0, #0x12
	bl GetSubstructPtr
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CD3B0

	thumb_func_start sub_081CD3C0
sub_081CD3C0: @ 0x081CD3C0
	push {lr}
	movs r0, #0x12
	bl GetSubstructPtr
	ldrh r0, [r0, #2]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CD3C0

	thumb_func_start sub_081CD3D0
sub_081CD3D0: @ 0x081CD3D0
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	ldr r1, _081CD3E0
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_081CD3E0: .4byte 0x00006428
	thumb_func_end sub_081CD3D0

	thumb_func_start sub_081CD3E4
sub_081CD3E4: @ 0x081CD3E4
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	ldr r1, _081CD3F8
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081CD3F8: .4byte 0x00006786
	thumb_func_end sub_081CD3E4

	thumb_func_start sub_081CD3FC
sub_081CD3FC: @ 0x081CD3FC
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	ldr r1, _081CD410
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081CD410: .4byte 0x00006302
	thumb_func_end sub_081CD3FC

	thumb_func_start sub_081CD414
sub_081CD414: @ 0x081CD414
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0xb
	bl GetSubstructPtr
	lsls r4, r4, #0xd
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r4, r4, r1
	adds r0, r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CD414

	thumb_func_start sub_081CD434
sub_081CD434: @ 0x081CD434
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0xb
	bl GetSubstructPtr
	lsls r4, r4, #7
	adds r0, r0, r4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CD434

	thumb_func_start sub_081CD44C
sub_081CD44C: @ 0x081CD44C
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	ldr r1, _081CD460
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081CD460: .4byte 0x00006789
	thumb_func_end sub_081CD44C

	thumb_func_start sub_081CD464
sub_081CD464: @ 0x081CD464
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0xb
	bl GetSubstructPtr
	lsls r4, r4, #6
	ldr r1, _081CD480
	adds r4, r4, r1
	adds r0, r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CD480: .4byte 0x00006368
	thumb_func_end sub_081CD464

	thumb_func_start sub_081CD484
sub_081CD484: @ 0x081CD484
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0xb
	bl GetSubstructPtr
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	ldr r2, _081CD4A4
	adds r1, r1, r2
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CD4A4: .4byte 0x00006320
	thumb_func_end sub_081CD484

	thumb_func_start sub_081CD4A8
sub_081CD4A8: @ 0x081CD4A8
	push {lr}
	movs r0, #0x12
	bl GetSubstructPtr
	ldrh r1, [r0, #2]
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	pop {r1}
	bx r1
	thumb_func_end sub_081CD4A8

	thumb_func_start sub_081CD4BC
sub_081CD4BC: @ 0x081CD4BC
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	movs r1, #0xc6
	lsls r1, r1, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _081CD4D4
	movs r0, #0
	b _081CD4D6
_081CD4D4:
	movs r0, #1
_081CD4D6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CD4BC

	thumb_func_start sub_081CD4DC
sub_081CD4DC: @ 0x081CD4DC
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	adds r2, r0, #0
	movs r1, #0xc6
	lsls r1, r1, #7
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _081CD4F6
	movs r0, #0
	b _081CD506
_081CD4F6:
	ldr r3, _081CD50C
	adds r0, r2, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r3, #3
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
_081CD506:
	pop {r1}
	bx r1
	.align 2, 0
_081CD50C: .4byte 0x00006786
	thumb_func_end sub_081CD4DC

	thumb_func_start sub_081CD510
sub_081CD510: @ 0x081CD510
	push {lr}
	movs r0, #0xb
	bl GetSubstructPtr
	ldr r2, _081CD530
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r2, #6
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081CD530: .4byte 0x00006786
	thumb_func_end sub_081CD510

	thumb_func_start sub_081CD534
sub_081CD534: @ 0x081CD534
	push {r4, lr}
	ldr r1, _081CD56C
	movs r0, #0xc
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CD584
	ldr r0, _081CD570
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _081CD574
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4]
	ldr r0, _081CD578
	adds r1, r4, r0
	ldr r0, _081CD57C
	str r0, [r1]
	ldr r0, _081CD580
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	b _081CD586
	.align 2, 0
_081CD56C: .4byte 0x000038AC
_081CD570: .4byte 0x00001816
_081CD574: .4byte 0x081CD5F5
_081CD578: .4byte 0x00001810
_081CD57C: .4byte 0x081CD5E1
_081CD580: .4byte 0x00002908
_081CD584:
	movs r0, #0
_081CD586:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CD534

	thumb_func_start sub_081CD58C
sub_081CD58C: @ 0x081CD58C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xc
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, _081CD5B8
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r5]
	ldr r0, _081CD5BC
	adds r5, r5, r0
	ldr r0, _081CD5C0
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CD5B8: .4byte 0x085F5990
_081CD5BC: .4byte 0x00001810
_081CD5C0: .4byte 0x081CD5E1
	thumb_func_end sub_081CD58C

	thumb_func_start sub_081CD5C4
sub_081CD5C4: @ 0x081CD5C4
	push {lr}
	movs r0, #0xc
	bl GetSubstructPtr
	ldr r1, _081CD5DC
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r1}
	thumb_func_end sub_081CD5C4

	thumb_func_start sub_081CD5D8
sub_081CD5D8: @ 0x081CD5D8
	bx r1
	.align 2, 0
_081CD5DC: .4byte 0x00001810
	thumb_func_end sub_081CD5D8

	thumb_func_start sub_081CD5E0
sub_081CD5E0: @ 0x081CD5E0
	push {lr}
	movs r0, #0xc
	bl GetSubstructPtr
	ldr r0, [r0]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CD5E0

	thumb_func_start sub_081CD5F4
sub_081CD5F4: @ 0x081CD5F4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xc
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #0x14
	bls _081CD608
	b _081CDA24
_081CD608:
	lsls r0, r4, #2
	ldr r1, _081CD614
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CD614: .4byte 0x081CD618
_081CD618: @ jump table
	.4byte _081CD66C @ case 0
	.4byte _081CD678 @ case 1
	.4byte _081CD6F4 @ case 2
	.4byte _081CD718 @ case 3
	.4byte _081CD790 @ case 4
	.4byte _081CD7D4 @ case 5
	.4byte _081CD810 @ case 6
	.4byte _081CD878 @ case 7
	.4byte _081CD880 @ case 8
	.4byte _081CD886 @ case 9
	.4byte _081CD896 @ case 10
	.4byte _081CD8A6 @ case 11
	.4byte _081CD8B6 @ case 12
	.4byte _081CD8CC @ case 13
	.4byte _081CD928 @ case 14
	.4byte _081CD94C @ case 15
	.4byte _081CD978 @ case 16
	.4byte _081CD99C @ case 17
	.4byte _081CD9AA @ case 18
	.4byte _081CD9BA @ case 19
	.4byte _081CD9C2 @ case 20
_081CD66C:
	bl sub_081CCB04
	cmp r0, #1
	beq _081CD676
	b _081CDA20
_081CD676:
	b _081CD710
_081CD678:
	ldr r0, _081CD6E0
	movs r1, #3
	bl InitBgTemplates
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
	ldr r1, _081CD6E4
	movs r0, #0
	bl SetGpuReg
	ldr r1, _081CD6E8
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _081CD6EC
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, _081CD6F0
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	b _081CD708
	.align 2, 0
_081CD6E0: .4byte 0x085F5964
_081CD6E4: .4byte 0x00007940
_081CD6E8: .4byte 0x00000844
_081CD6EC: .4byte 0x0000040B
_081CD6F0: .4byte 0x085F4E6C
_081CD6F4:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081CD702
	b _081CDA20
_081CD702:
	ldr r1, _081CD714
	str r0, [sp]
	movs r0, #2
_081CD708:
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
_081CD710:
	movs r0, #0
	b _081CDA26
	.align 2, 0
_081CD714: .4byte 0x085F57EC
_081CD718:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CD724
	b _081CDA20
_081CD724:
	ldr r0, _081CD778
	adds r4, r5, #4
	adds r1, r4, #0
	bl LZ77UnCompVram
	movs r0, #3
	adds r1, r4, #0
	bl SetBgTilemapBuffer
	bl sub_081CD4BC
	cmp r0, #1
	bne _081CD752
	ldr r1, _081CD77C
	movs r0, #9
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #3
	movs r2, #0
	movs r3, #5
	bl CopyToBgTilemapBufferRect
_081CD752:
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	ldr r0, _081CD780
	movs r1, #0x10
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	ldr r0, _081CD784
	movs r1, #0xf0
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	ldr r0, _081CD788
	adds r1, r5, r0
	ldr r0, _081CD78C
	strh r0, [r1]
	b _081CD710
	.align 2, 0
_081CD778: .4byte 0x085F5600
_081CD77C: .4byte 0x085F58FC
_081CD780: .4byte 0x085F4E0C
_081CD784: .4byte 0x085F4E4C
_081CD788: .4byte 0x00001814
_081CD78C: .4byte 0x0000FFB0
_081CD790:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CD79C
	b _081CDA20
_081CD79C:
	ldr r0, _081CD7C8
	ldr r1, _081CD7CC
	adds r4, r5, r1
	adds r1, r4, #0
	bl LZ77UnCompVram
	movs r0, #2
	adds r1, r4, #0
	bl SetBgTilemapBuffer
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	ldr r0, _081CD7D0
	movs r1, #0x30
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #2
	bl sub_081D1824
	b _081CD710
	.align 2, 0
_081CD7C8: .4byte 0x085F5800
_081CD7CC: .4byte 0x00001004
_081CD7D0: .4byte 0x085F4E2C
_081CD7D4:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_08199A88
	movs r0, #1
	movs r1, #0x11
	movs r2, #1
	movs r3, #1
	bl sub_08199A88
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, _081CD808
	adds r4, r5, r2
	ldr r2, _081CD80C
	add r0, sp, #8
	adds r1, r4, #0
	bl CpuSet
	movs r0, #1
	adds r1, r4, #0
	bl SetBgTilemapBuffer
	b _081CD710
	.align 2, 0
_081CD808: .4byte 0x00000804
_081CD80C: .4byte 0x05000200
_081CD810:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CD81C
	b _081CDA20
_081CD81C:
	ldr r0, _081CD85C
	bl AddWindow
	movs r2, #0xc1
	lsls r2, r2, #5
	adds r1, r5, r2
	strb r0, [r1]
	bl sub_081CD4BC
	cmp r0, #1
	bne _081CD856
	ldr r0, _081CD860
	bl AddWindow
	ldr r2, _081CD864
	adds r1, r5, r2
	strb r0, [r1]
	ldr r0, _081CD868
	bl AddWindow
	ldr r2, _081CD86C
	adds r1, r5, r2
	strb r0, [r1]
	ldr r0, _081CD870
	bl AddWindow
	ldr r2, _081CD874
	adds r1, r5, r2
	strb r0, [r1]
_081CD856:
	bl DeactivateAllTextPrinters
	b _081CD710
	.align 2, 0
_081CD85C: .4byte 0x085F5970
_081CD860: .4byte 0x085F5978
_081CD864: .4byte 0x00001821
_081CD868: .4byte 0x085F5980
_081CD86C: .4byte 0x00001822
_081CD870: .4byte 0x085F5988
_081CD874: .4byte 0x00001823
_081CD878:
	movs r0, #0
	bl sub_081CE464
	b _081CD710
_081CD880:
	bl sub_081CE118
	b _081CD710
_081CD886:
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CD890
	b _081CD710
_081CD890:
	bl sub_081CE068
	b _081CD710
_081CD896:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #0
	b _081CD8C4
_081CD8A6:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #1
	b _081CD8C4
_081CD8B6:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #2
_081CD8C4:
	movs r2, #1
	bl sub_081CDEB4
	b _081CD710
_081CD8CC:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #1
	bl sub_081CDEB4
	cmp r0, #1
	beq _081CD8E6
	b _081CDA20
_081CD8E6:
	movs r1, #0xc1
	lsls r1, r1, #5
	adds r0, r5, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CD8FC
	b _081CD710
_081CD8FC:
	ldr r2, _081CD91C
	adds r0, r5, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r1, _081CD920
	adds r0, r5, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r2, _081CD924
	adds r0, r5, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
	b _081CD710
	.align 2, 0
_081CD91C: .4byte 0x00001821
_081CD920: .4byte 0x00001822
_081CD924: .4byte 0x00001823
_081CD928:
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl HideBg
	movs r0, #3
	bl ShowBg
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CD944
	b _081CD710
_081CD944:
	movs r0, #4
	bl sub_081C7364
	b _081CD710
_081CD94C:
	movs r0, #1
	bl sub_081C7280
	bl sub_081CD4BC
	cmp r0, #0
	beq _081CD95C
	b _081CD710
_081CD95C:
	movs r0, #6
	bl LoadLeftHeaderGfxForIndex
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl sub_081C7748
	movs r0, #6
	movs r1, #1
	movs r2, #0
	bl sub_081C7748
	b _081CD710
_081CD978:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CDA20
	bl sub_081CD4BC
	cmp r0, #0
	bne _081CD990
	bl sub_081C77B8
	cmp r0, #0
	bne _081CDA20
_081CD990:
	ldr r0, _081CD998
	bl InitKeys_
	b _081CD710
	.align 2, 0
_081CD998: .4byte 0x081CE579
_081CD99C:
	bl sub_081CE5C4
	bl sub_081CD3D0
	bl sub_081D16F4
	b _081CD710
_081CD9AA:
	bl sub_081CD3D0
	bl sub_081D1704
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CDA20
	b _081CD710
_081CD9BA:
	movs r0, #1
	bl sub_081CE5A8
	b _081CD710
_081CD9C2:
	bl sub_081CD3D0
	ldr r2, _081CDA14
	adds r1, r5, r2
	bl sub_081D27A8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CDA20
	ldr r0, _081CDA18
	adds r6, r5, r0
	adds r0, r6, #0
	bl sub_081D2A94
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CD9F8
	bl sub_081CD3C0
	adds r4, r0, #0
	bl sub_081CD3B0
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	beq _081CDA24
_081CD9F8:
	ldr r1, _081CDA1C
	adds r0, r5, r1
	ldrb r4, [r0]
	bl sub_081CD510
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_081D2AB0
	b _081CDA24
	.align 2, 0
_081CDA14: .4byte 0x00001814
_081CDA18: .4byte 0x000028E0
_081CDA1C: .4byte 0x00001816
_081CDA20:
	movs r0, #2
	b _081CDA26
_081CDA24:
	movs r0, #4
_081CDA26:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CD5F4

	thumb_func_start sub_081CDA30
sub_081CDA30: @ 0x081CDA30
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xc
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CDA68
	cmp r4, #1
	bgt _081CDA4A
	cmp r4, #0
	beq _081CDA54
	b _081CDAD4
_081CDA4A:
	cmp r4, #2
	beq _081CDA88
	cmp r4, #3
	beq _081CDA9E
	b _081CDAD4
_081CDA54:
	bl sub_081CE5FC
	ldr r1, _081CDA64
	adds r0, r5, r1
	bl sub_081D2B50
	movs r0, #1
	b _081CDAD6
	.align 2, 0
_081CDA64: .4byte 0x000028E0
_081CDA68:
	bl sub_081CD3D0
	ldr r2, _081CDA84
	adds r1, r5, r2
	bl sub_081D27D4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CDAAE
	movs r0, #0
	bl sub_081CE5A8
	movs r0, #1
	b _081CDAD6
	.align 2, 0
_081CDA84: .4byte 0x00001814
_081CDA88:
	movs r0, #0
	bl sub_081C7280
	bl sub_081CD4BC
	cmp r0, #0
	bne _081CDA9A
	bl sub_081C7060
_081CDA9A:
	movs r0, #0
	b _081CDAD6
_081CDA9E:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CDAAE
	bl MainMenuLoopedTaskIsBusy
	cmp r0, #0
	beq _081CDAB2
_081CDAAE:
	movs r0, #2
	b _081CDAD6
_081CDAB2:
	ldr r1, _081CDAD0
	adds r0, r5, r1
	bl nullsub_79
	movs r0, #1
	bl HideBg
	movs r0, #2
	bl HideBg
	movs r0, #3
	bl HideBg
	movs r0, #1
	b _081CDAD6
	.align 2, 0
_081CDAD0: .4byte 0x000028E0
_081CDAD4:
	movs r0, #4
_081CDAD6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CDA30

	thumb_func_start sub_081CDADC
sub_081CDADC: @ 0x081CDADC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0xc
	bl GetSubstructPtr
	adds r6, r0, #0
	bl sub_081CD3D0
	adds r2, r0, #0
	cmp r4, #9
	bls _081CDAF4
	b _081CDC30
_081CDAF4:
	lsls r0, r4, #2
	ldr r1, _081CDB00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CDB00: .4byte 0x081CDB04
_081CDB04: @ jump table
	.4byte _081CDB2C @ case 0
	.4byte _081CDB30 @ case 1
	.4byte _081CDB3A @ case 2
	.4byte _081CDB50 @ case 3
	.4byte _081CDB58 @ case 4
	.4byte _081CDB78 @ case 5
	.4byte _081CDB88 @ case 6
	.4byte _081CDB98 @ case 7
	.4byte _081CDBAE @ case 8
	.4byte _081CDBC8 @ case 9
_081CDB2C:
	movs r0, #0
	b _081CDB32
_081CDB30:
	movs r0, #1
_081CDB32:
	bl sub_081CCC88
_081CDB36:
	movs r0, #1
	b _081CDC32
_081CDB3A:
	movs r0, #2
	bl sub_081CCC88
	ldr r1, _081CDB4C
	adds r0, r6, r1
	bl sub_081D2B50
	b _081CDB36
	.align 2, 0
_081CDB4C: .4byte 0x000028E0
_081CDB50:
	adds r0, r2, #0
	bl sub_081D16BC
	b _081CDB36
_081CDB58:
	ldr r1, _081CDB74
	adds r0, r6, r1
	bl sub_081D2780
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CDC2C
	bl sub_081CD3E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081CE464
	b _081CDB36
	.align 2, 0
_081CDB74: .4byte 0x00001814
_081CDB78:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #0
	b _081CDBA6
_081CDB88:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #1
	b _081CDBA6
_081CDB98:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #2
_081CDBA6:
	movs r2, #0
	bl sub_081CDEB4
	b _081CDB36
_081CDBAE:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl sub_081CDEB4
	cmp r0, #1
	beq _081CDB36
	b _081CDC2C
_081CDBC8:
	bl sub_081CD3D0
	adds r2, r0, #0
	ldr r0, _081CDC20
	adds r1, r6, r0
	adds r0, r2, #0
	bl sub_081D27A8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CDC2C
	ldr r1, _081CDC24
	adds r0, r6, r1
	bl sub_081D2A94
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CDC00
	bl sub_081CD3C0
	adds r4, r0, #0
	bl sub_081CD3B0
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	beq _081CDB36
_081CDC00:
	ldr r0, _081CDC24
	adds r5, r6, r0
	ldr r1, _081CDC28
	adds r0, r6, r1
	ldrb r4, [r0]
	bl sub_081CD510
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_081D2AB0
	b _081CDB36
	.align 2, 0
_081CDC20: .4byte 0x00001814
_081CDC24: .4byte 0x000028E0
_081CDC28: .4byte 0x00001816
_081CDC2C:
	movs r0, #2
	b _081CDC32
_081CDC30:
	movs r0, #4
_081CDC32:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081CDADC

	thumb_func_start sub_081CDC38
sub_081CDC38: @ 0x081CDC38
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xc
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #8
	bhi _081CDD3C
	lsls r0, r4, #2
	ldr r1, _081CDC54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CDC54: .4byte 0x081CDC58
_081CDC58: @ jump table
	.4byte _081CDC7C @ case 0
	.4byte _081CDC80 @ case 1
	.4byte _081CDC84 @ case 2
	.4byte _081CDC8E @ case 3
	.4byte _081CDC9E @ case 4
	.4byte _081CDCAE @ case 5
	.4byte _081CDCBE @ case 6
	.4byte _081CDCD6 @ case 7
	.4byte _081CDCF2 @ case 8
_081CDC7C:
	movs r0, #0
	b _081CDC86
_081CDC80:
	movs r0, #1
	b _081CDC86
_081CDC84:
	movs r0, #2
_081CDC86:
	bl sub_081CCC88
	movs r0, #1
	b _081CDD3E
_081CDC8E:
	bl sub_081CD3E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081CE464
	movs r0, #1
	b _081CDD3E
_081CDC9E:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #0
	b _081CDCCC
_081CDCAE:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #1
	b _081CDCCC
_081CDCBE:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #2
_081CDCCC:
	movs r2, #0
	bl sub_081CDEB4
	movs r0, #1
	b _081CDD3E
_081CDCD6:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl sub_081CDEB4
	cmp r0, #1
	bne _081CDD38
	movs r0, #1
	b _081CDD3E
_081CDCF2:
	bl sub_081CD3D0
	ldr r2, _081CDD2C
	adds r1, r5, r2
	bl sub_081D27A8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CDD38
	ldr r0, _081CDD30
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_081D2A94
	ldr r1, _081CDD34
	adds r0, r5, r1
	ldrb r5, [r0]
	bl sub_081CD510
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_081D2AB0
	movs r0, #1
	b _081CDD3E
	.align 2, 0
_081CDD2C: .4byte 0x00001814
_081CDD30: .4byte 0x000028E0
_081CDD34: .4byte 0x00001816
_081CDD38:
	movs r0, #2
	b _081CDD3E
_081CDD3C:
	movs r0, #4
_081CDD3E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CDC38

	thumb_func_start sub_081CDD44
sub_081CDD44: @ 0x081CDD44
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xc
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #7
	bhi _081CDE12
	lsls r0, r4, #2
	ldr r1, _081CDD60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CDD60: .4byte 0x081CDD64
_081CDD64: @ jump table
	.4byte _081CDD84 @ case 0
	.4byte _081CDD88 @ case 1
	.4byte _081CDD92 @ case 2
	.4byte _081CDDA8 @ case 3
	.4byte _081CDDC0 @ case 4
	.4byte _081CDDD0 @ case 5
	.4byte _081CDDE0 @ case 6
	.4byte _081CDDF6 @ case 7
_081CDD84:
	movs r0, #0
	b _081CDD8A
_081CDD88:
	movs r0, #1
_081CDD8A:
	bl sub_081CCC88
_081CDD8E:
	movs r0, #1
	b _081CDE14
_081CDD92:
	movs r0, #2
	bl sub_081CCC88
	ldr r1, _081CDDA4
	adds r0, r5, r1
	bl sub_081D2B50
	b _081CDD8E
	.align 2, 0
_081CDDA4: .4byte 0x000028E0
_081CDDA8:
	bl sub_081CD3D0
	ldr r2, _081CDDBC
	adds r1, r5, r2
	bl sub_081D27D4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CDD8E
	b _081CDE0E
	.align 2, 0
_081CDDBC: .4byte 0x00001814
_081CDDC0:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #0
	b _081CDDEE
_081CDDD0:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #1
	b _081CDDEE
_081CDDE0:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #2
_081CDDEE:
	movs r2, #0
	bl sub_081CDEB4
	b _081CDD8E
_081CDDF6:
	bl sub_081CD3E4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl sub_081CDEB4
	cmp r0, #1
	beq _081CDD8E
_081CDE0E:
	movs r0, #2
	b _081CDE14
_081CDE12:
	movs r0, #4
_081CDE14:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CDD44

	thumb_func_start sub_081CDE1C
sub_081CDE1C: @ 0x081CDE1C
	push {lr}
	cmp r0, #1
	beq _081CDE46
	cmp r0, #1
	bgt _081CDE2C
	cmp r0, #0
	beq _081CDE32
	b _081CDE5A
_081CDE2C:
	cmp r0, #2
	beq _081CDE4E
	b _081CDE5A
_081CDE32:
	bl sub_081CD4DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xb0
	movs r2, #0x20
	bl sub_0811FFC4
_081CDE42:
	movs r0, #1
	b _081CDE5C
_081CDE46:
	movs r0, #5
	bl sub_081C7364
	b _081CDE42
_081CDE4E:
	bl sub_081C73A8
	cmp r0, #1
	bne _081CDE42
	movs r0, #2
	b _081CDE5C
_081CDE5A:
	movs r0, #4
_081CDE5C:
	pop {r1}
	bx r1
	thumb_func_end sub_081CDE1C

	thumb_func_start sub_081CDE60
sub_081CDE60: @ 0x081CDE60
	push {lr}
	cmp r0, #1
	beq _081CDE7E
	cmp r0, #1
	bgt _081CDE70
	cmp r0, #0
	beq _081CDE76
	b _081CDE92
_081CDE70:
	cmp r0, #2
	beq _081CDE86
	b _081CDE92
_081CDE76:
	bl sub_08120018
_081CDE7A:
	movs r0, #1
	b _081CDE94
_081CDE7E:
	movs r0, #4
	bl sub_081C7364
	b _081CDE7A
_081CDE86:
	bl sub_081C73A8
	cmp r0, #1
	bne _081CDE7A
	movs r0, #2
	b _081CDE94
_081CDE92:
	movs r0, #4
_081CDE94:
	pop {r1}
	bx r1
	thumb_func_end sub_081CDE60

	thumb_func_start sub_081CDE98
sub_081CDE98: @ 0x081CDE98
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r1, _081CDEB0
	bl StringCopy
	pop {r1}
	bx r1
	.align 2, 0
_081CDEB0: .4byte 0x085CB7CE
	thumb_func_end sub_081CDE98

	thumb_func_start sub_081CDEB4
sub_081CDEB4: @ 0x081CDEB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r0, #0xc
	bl GetSubstructPtr
	adds r6, r0, #0
	cmp r7, #1
	beq _081CDF10
	cmp r7, #1
	bgt _081CDEDA
	cmp r7, #0
	beq _081CDEE4
	b _081CE05C
_081CDEDA:
	cmp r7, #2
	beq _081CDF52
	cmp r7, #3
	beq _081CDFD4
	b _081CE05C
_081CDEE4:
	movs r1, #0xc1
	lsls r1, r1, #5
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #0
	bl FillWindowPixelBuffer
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CDEFC
	b _081CE05C
_081CDEFC:
	ldr r1, _081CDF0C
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #0
	bl FillWindowPixelBuffer
	b _081CE05C
	.align 2, 0
_081CDF0C: .4byte 0x00001821
_081CDF10:
	bl sub_081CD3C0
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_081CD3B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r0, #1
	cmp r4, r0
	bne _081CDF32
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CDF32
	b _081CE05C
_081CDF32:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_081CD464
	adds r2, r0, #0
	movs r1, #0xc1
	lsls r1, r1, #5
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	b _081CDFC4
_081CDF52:
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CDF5C
	b _081CE05C
_081CDF5C:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_081CD484
	adds r2, r0, #0
	movs r1, #0xc1
	lsls r1, r1, #5
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #0x12
	str r1, [sp]
	movs r5, #0
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	add r1, sp, #0xc
	movs r0, #0xfc
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #8
	strb r0, [r1, #2]
	adds r0, r1, #0
	strb r5, [r0, #3]
	movs r0, #9
	strb r0, [r1, #4]
	mov r4, sp
	adds r4, #0x11
	bl sub_081CD4A8
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_081CDE98
	ldr r4, _081CDFCC
	adds r0, r4, #0
	add r1, sp, #0xc
	bl StringExpandPlaceholders
	ldr r1, _081CDFD0
	adds r0, r6, r1
	ldrb r0, [r0]
	str r7, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
_081CDFC4:
	movs r3, #0
	bl AddTextPrinterParameterized
	b _081CE05C
	.align 2, 0
_081CDFCC: .4byte 0x02021C7C
_081CDFD0: .4byte 0x00001821
_081CDFD4:
	ldr r1, _081CDFE4
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081CDFE8
	cmp r0, #1
	beq _081CE024
	b _081CE05C
	.align 2, 0
_081CDFE4: .4byte 0x00002908
_081CDFE8:
	cmp r4, #0
	beq _081CDFFC
	movs r1, #0xc1
	lsls r1, r1, #5
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	b _081CE00A
_081CDFFC:
	movs r1, #0xc1
	lsls r1, r1, #5
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
_081CE00A:
	bl sub_081CD4BC
	cmp r0, #1
	bne _081CE048
	ldr r0, _081CE020
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081CE05C
	.align 2, 0
_081CE020: .4byte 0x00002908
_081CE024:
	cmp r4, #0
	beq _081CE03C
	ldr r1, _081CE038
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	b _081CE048
	.align 2, 0
_081CE038: .4byte 0x00001821
_081CE03C:
	ldr r1, _081CE054
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
_081CE048:
	ldr r0, _081CE058
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	b _081CE05E
	.align 2, 0
_081CE054: .4byte 0x00001821
_081CE058: .4byte 0x00002908
_081CE05C:
	movs r0, #0
_081CE05E:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CDEB4

	thumb_func_start sub_081CE068
sub_081CE068: @ 0x081CE068
	push {r4, lr}
	movs r0, #0xc
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r1, _081CE090
	adds r0, r4, r1
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _081CE094
	adds r4, r4, r0
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CE090: .4byte 0x00001822
_081CE094: .4byte 0x00001823
	thumb_func_end sub_081CE068

	thumb_func_start sub_081CE098
sub_081CE098: @ 0x081CE098
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	bl sub_081CD3C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bne _081CE0B6
	adds r0, r5, #0
	movs r1, #0
	bl StartSpriteAnim
	b _081CE0BE
_081CE0B6:
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
_081CE0BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081CE098

	thumb_func_start sub_081CE0C4
sub_081CE0C4: @ 0x081CE0C4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_081CD3C0
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_081CD3B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r0, #1
	cmp r4, r0
	bne _081CE0E4
	movs r0, #0x65
	b _081CE0E6
_081CE0E4:
	movs r0, #0x66
_081CE0E6:
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #4
	ldrb r2, [r5, #5]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #5]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081CE0C4

	thumb_func_start sub_081CE0FC
sub_081CE0FC: @ 0x081CE0FC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081CD4DC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CE0FC

	thumb_func_start sub_081CE118
sub_081CE118: @ 0x081CE118
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	movs r0, #0xc
	bl GetSubstructPtr
	adds r6, r0, #0
	add r4, sp, #0x20
	add r5, sp, #0x38
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_081D284C
	bl sub_081CD4BC
	adds r7, r4, #0
	mov sl, r5
	cmp r0, #1
	bne _081CE1AC
	ldr r1, _081CE198
	adds r0, r6, r1
	movs r2, #0x6a
	strh r2, [r0]
	ldr r3, _081CE19C
	adds r1, r6, r3
	strh r2, [r1]
	bl unref_sub_811BBF4
	bl sub_0811FFB0
	ldr r2, _081CE1A0
	movs r0, #0x69
	movs r1, #0x69
	bl sub_081204B4
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	movs r1, #0xc0
	strh r1, [r0, #0x20]
	movs r1, #0x20
	strh r1, [r0, #0x22]
	ldr r1, _081CE1A4
	str r1, [r0, #0x1c]
	ldr r2, _081CE1A8
	adds r1, r6, r2
	str r0, [r1]
	movs r0, #0x69
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_081C7150
	add r3, sp, #0x50
	mov r8, r3
	b _081CE2FA
	.align 2, 0
_081CE198: .4byte 0x00001824
_081CE19C: .4byte 0x00001826
_081CE1A0: .4byte 0x085F5944
_081CE1A4: .4byte 0x081CE0FD
_081CE1A8: .4byte 0x000028DC
_081CE1AC:
	mov r0, sp
	bl LoadSpriteSheets
	mov r0, sl
	bl Pokenav_AllocAndLoadPalettes
	movs r4, #0
	add r0, sp, #0x50
	mov r8, r0
	b _081CE21C
_081CE1C0:
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x12
	movs r1, #0x80
	lsls r1, r1, #0xc
	adds r2, r2, r1
	asrs r2, r2, #0x10
	adds r0, r7, #0
	movs r1, #0xe2
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _081CE20C
	ldr r2, _081CE200
	adds r0, r6, r2
	adds r0, r0, r4
	strb r3, [r0]
	ldr r2, _081CE204
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r0, r2
	strh r4, [r1, #0x2e]
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _081CE208
	str r1, [r0]
	b _081CE216
	.align 2, 0
_081CE200: .4byte 0x00001806
_081CE204: .4byte 0x020205AC
_081CE208: .4byte 0x081CE099
_081CE20C:
	ldr r3, _081CE274
	adds r0, r6, r3
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
_081CE216:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_081CE21C:
	bl sub_081CD3B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r0, #1
	cmp r4, r0
	blt _081CE1C0
	movs r0, #0x67
	strh r0, [r7]
	ldr r0, _081CE278
	str r0, [r7, #0x14]
	cmp r4, #5
	bhi _081CE290
	ldr r0, _081CE274
	adds r5, r6, r0
	ldr r1, _081CE27C
	mov sb, r1
_081CE23E:
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x12
	movs r3, #0x80
	lsls r3, r3, #0xc
	adds r2, r2, r3
	asrs r2, r2, #0x10
	adds r0, r7, #0
	movs r1, #0xe6
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _081CE280
	adds r0, r5, r4
	strb r3, [r0]
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	add r1, sb
	ldrb r2, [r1, #3]
	movs r0, #0x3f
	ands r0, r2
	strb r0, [r1, #3]
	b _081CE286
	.align 2, 0
_081CE274: .4byte 0x00001806
_081CE278: .4byte 0x08007141
_081CE27C: .4byte 0x020205AC
_081CE280:
	adds r1, r5, r4
	movs r0, #0xff
	strb r0, [r1]
_081CE286:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _081CE23E
_081CE290:
	movs r0, #0x66
	strh r0, [r7]
	ldr r0, _081CE2E4
	str r0, [r7, #0x14]
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x12
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r2, r2, r0
	asrs r2, r2, #0x10
	adds r0, r7, #0
	movs r1, #0xde
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _081CE2F0
	ldr r1, _081CE2E8
	adds r0, r6, r1
	adds r0, r0, r4
	strb r3, [r0]
	ldr r0, _081CE2EC
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrb r3, [r2, #1]
	movs r1, #0x3f
	adds r0, r1, #0
	ands r0, r3
	movs r3, #0x40
	orrs r0, r3
	strb r0, [r2, #1]
	ldrb r0, [r2, #3]
	ands r1, r0
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r2, #3]
	b _081CE2FA
	.align 2, 0
_081CE2E4: .4byte 0x081CE0C5
_081CE2E8: .4byte 0x00001806
_081CE2EC: .4byte 0x020205AC
_081CE2F0:
	ldr r2, _081CE324
	adds r0, r6, r2
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
_081CE2FA:
	mov r0, r8
	mov r1, sl
	bl sub_081D28E0
	mov r0, r8
	bl LoadSpriteSheet
	movs r0, #0
	mov r3, sl
	str r0, [r3, #8]
	mov r0, sl
	bl Pokenav_AllocAndLoadPalettes
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CE324: .4byte 0x00001806
	thumb_func_end sub_081CE118

	thumb_func_start sub_081CE328
sub_081CE328: @ 0x081CE328
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_081CD4BC
	cmp r0, #1
	bne _081CE35C
	ldr r1, _081CE358
	adds r0, r5, r1
	ldr r0, [r0]
	bl DestroySprite
	movs r0, #0x6a
	bl FreeSpriteTilesByTag
	movs r0, #0x69
	bl FreeSpriteTilesByTag
	movs r0, #0x6a
	bl FreeSpritePaletteByTag
	movs r0, #0x69
	bl FreeSpritePaletteByTag
	b _081CE39C
	.align 2, 0
_081CE358: .4byte 0x000028DC
_081CE35C:
	movs r4, #0
_081CE35E:
	ldr r1, _081CE3C8
	adds r0, r5, r1
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081CE3CC
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _081CE35E
	movs r0, #0x65
	bl FreeSpriteTilesByTag
	movs r0, #0x66
	bl FreeSpriteTilesByTag
	movs r0, #0x67
	bl FreeSpriteTilesByTag
	movs r0, #0x65
	bl FreeSpritePaletteByTag
	movs r0, #0x66
	bl FreeSpritePaletteByTag
_081CE39C:
	ldr r0, _081CE3D0
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _081CE3C2
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081CE3CC
	adds r0, r0, r1
	bl DestroySprite
	movs r0, #0x64
	bl FreeSpriteTilesByTag
	movs r0, #0x64
	bl FreeSpritePaletteByTag
_081CE3C2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CE3C8: .4byte 0x00001806
_081CE3CC: .4byte 0x020205AC
_081CE3D0: .4byte 0x00001816
	thumb_func_end sub_081CE328

	thumb_func_start sub_081CE3D4
sub_081CE3D4: @ 0x081CE3D4
	push {r4, lr}
	movs r0, #0xc
	bl GetSubstructPtr
	adds r4, r0, #0
	movs r1, #0xc1
	lsls r1, r1, #5
	adds r0, r4, r1
	ldrb r0, [r0]
	bl RemoveWindow
	bl sub_081CD4BC
	cmp r0, #1
	bne _081CE420
	ldr r1, _081CE414
	adds r0, r4, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r1, _081CE418
	adds r0, r4, r1
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r1, _081CE41C
	adds r0, r4, r1
	ldrb r0, [r0]
	bl RemoveWindow
	b _081CE424
	.align 2, 0
_081CE414: .4byte 0x00001821
_081CE418: .4byte 0x00001822
_081CE41C: .4byte 0x00001823
_081CE420:
	bl sub_081C7784
_081CE424:
	movs r1, #0x8a
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl sub_081CE328
	bl sub_081CE59C
	movs r0, #0xc
	bl FreePokenavSubstruct
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CE3D4

	thumb_func_start sub_081CE444
sub_081CE444: @ 0x081CE444
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc
	bl GetSubstructPtr
	ldr r1, _081CE460
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x26
	strh r0, [r4, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CE460: .4byte 0x00001814
	thumb_func_end sub_081CE444

	thumb_func_start sub_081CE464
sub_081CE464: @ 0x081CE464
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0xc
	bl GetSubstructPtr
	mov r8, r0
	ldr r7, _081CE4E4
	add r7, r8
	ldrb r0, [r7]
	cmp r0, #0xff
	bne _081CE530
	add r5, sp, #0x18
	add r4, sp, #0x20
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_081D2800
	adds r0, r6, #0
	bl sub_081CD414
	str r0, [sp, #0x18]
	adds r0, r6, #0
	bl sub_081CD434
	str r0, [sp, #0x20]
	adds r0, r4, #0
	bl LoadSpritePalette
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _081CE4E8
	add r4, r8
	strh r0, [r4]
	adds r0, r5, #0
	bl LoadSpriteSheet
	ldr r5, _081CE4EC
	add r5, r8
	strh r0, [r5]
	mov r0, sp
	movs r1, #0x26
	movs r2, #0x68
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strb r0, [r7]
	cmp r0, #0x40
	bne _081CE4F0
	movs r0, #0x64
	bl FreeSpriteTilesByTag
	movs r0, #0x64
	bl FreeSpritePaletteByTag
	movs r0, #0xff
	strb r0, [r7]
	b _081CE55A
	.align 2, 0
_081CE4E4: .4byte 0x00001816
_081CE4E8: .4byte 0x00001818
_081CE4EC: .4byte 0x0000181A
_081CE4F0:
	strb r0, [r7]
	ldr r2, _081CE520
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _081CE524
	str r1, [r0]
	ldr r1, _081CE528
	add r1, r8
	ldrh r0, [r5]
	lsls r0, r0, #5
	ldr r2, _081CE52C
	adds r0, r0, r2
	str r0, [r1]
	ldrh r0, [r4]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r4]
	b _081CE55A
	.align 2, 0
_081CE520: .4byte 0x020205AC
_081CE524: .4byte 0x081CE445
_081CE528: .4byte 0x0000181C
_081CE52C: .4byte 0x06010000
_081CE530:
	adds r0, r6, #0
	bl sub_081CD414
	ldr r1, _081CE568
	add r1, r8
	ldr r2, [r1]
	ldr r1, _081CE56C
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _081CE570
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r6, #0
	bl sub_081CD434
	ldr r1, _081CE574
	add r1, r8
	ldrh r1, [r1]
	movs r2, #0x20
	bl LoadPalette
_081CE55A:
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CE568: .4byte 0x0000181C
_081CE56C: .4byte 0x040000D4
_081CE570: .4byte 0x80000400
_081CE574: .4byte 0x00001818
	thumb_func_end sub_081CE464

	thumb_func_start sub_081CE578
sub_081CE578: @ 0x081CE578
	push {r4, lr}
	bl sub_081CD3D0
	adds r4, r0, #0
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	adds r0, r4, #0
	bl sub_081D1750
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CE578

	thumb_func_start sub_081CE59C
sub_081CE59C: @ 0x081CE59C
	push {lr}
	bl SetPokenavVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CE59C

	thumb_func_start sub_081CE5A8
sub_081CE5A8: @ 0x081CE5A8
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CE5B8
	movs r0, #2
	bl ShowBg
	b _081CE5BE
_081CE5B8:
	movs r0, #2
	bl HideBg
_081CE5BE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CE5A8

	thumb_func_start sub_081CE5C4
sub_081CE5C4: @ 0x081CE5C4
	push {r4, lr}
	bl sub_081CD3D0
	adds r4, r0, #0
	bl sub_081CD3E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081CE5F8
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x50
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, #0x14
	adds r2, r4, r2
	adds r0, r4, #0
	bl sub_081D15CC
	adds r0, r4, #0
	bl sub_081D16BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CE5F8: .4byte 0x030012B0
	thumb_func_end sub_081CE5C4

	thumb_func_start sub_081CE5FC
sub_081CE5FC: @ 0x081CE5FC
	push {r4, r5, lr}
	bl sub_081CD3D0
	adds r5, r0, #0
	bl sub_081CD4BC
	cmp r0, #0
	bne _081CE624
	bl sub_081CD3C0
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_081CD3B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r0, #1
	cmp r4, r0
	beq _081CE640
_081CE624:
	bl sub_081CD3E4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x14
	adds r1, r5, r1
	adds r2, r5, #0
	adds r2, #0x50
	adds r0, r5, #0
	bl sub_081D15CC
_081CE640:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CE5FC

	thumb_func_start sub_081CE648
sub_081CE648: @ 0x081CE648
	push {r4, lr}
	movs r0, #0xc
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_081CD4BC
	cmp r0, #1
	beq _081CE65E
	movs r0, #0
	b _081CE664
_081CE65E:
	ldr r1, _081CE66C
	adds r0, r4, r1
	ldrb r0, [r0]
_081CE664:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CE66C: .4byte 0x00001828
	thumb_func_end sub_081CE648

	thumb_func_start sub_081CE670
sub_081CE670: @ 0x081CE670
	push {r4, lr}
	movs r0, #7
	movs r1, #0x24
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CE6C4
	ldr r1, _081CE6B4
	movs r0, #0x12
	bl AllocSubstruct
	str r0, [r4, #0x20]
	cmp r0, #0
	beq _081CE6C4
	ldr r0, _081CE6B8
	str r0, [r4]
	ldr r0, _081CE6BC
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r4, #0x18]
	bl sub_081C6E6C
	ldr r1, _081CE6C0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x14]
	movs r0, #1
	b _081CE6C6
	.align 2, 0
_081CE6B4: .4byte 0x000006AC
_081CE6B8: .4byte 0x081CE745
_081CE6BC: .4byte 0x081CE851
_081CE6C0: .4byte 0x085F59AC
_081CE6C4:
	movs r0, #0
_081CE6C6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CE670

	thumb_func_start sub_081CE6CC
sub_081CE6CC: @ 0x081CE6CC
	push {r4, lr}
	movs r0, #7
	movs r1, #0x24
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CE708
	movs r0, #0x12
	bl GetSubstructPtr
	str r0, [r4, #0x20]
	ldr r0, _081CE700
	str r0, [r4]
	movs r0, #1
	str r0, [r4, #0x18]
	bl sub_081C6E6C
	ldr r1, _081CE704
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x14]
	movs r0, #1
	b _081CE70A
	.align 2, 0
_081CE700: .4byte 0x081CE765
_081CE704: .4byte 0x085F59AC
_081CE708:
	movs r0, #0
_081CE70A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CE6CC

	thumb_func_start sub_081CE710
sub_081CE710: @ 0x081CE710
	push {lr}
	movs r0, #7
	bl GetSubstructPtr
	ldr r1, [r0]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CE710

	thumb_func_start sub_081CE724
sub_081CE724: @ 0x081CE724
	push {lr}
	movs r0, #7
	bl GetSubstructPtr
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	bne _081CE738
	movs r0, #0x12
	bl FreePokenavSubstruct
_081CE738:
	movs r0, #7
	bl FreePokenavSubstruct
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CE724

	thumb_func_start sub_081CE744
sub_081CE744: @ 0x081CE744
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl IsLoopedTaskActive
	cmp r0, #0
	bne _081CE756
	ldr r0, _081CE760
	str r0, [r4]
_081CE756:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CE760: .4byte 0x081CE765
	thumb_func_end sub_081CE744

	thumb_func_start sub_081CE764
sub_081CE764: @ 0x081CE764
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _081CE778
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081CE77C
	movs r0, #1
	b _081CE7DA
	.align 2, 0
_081CE778: .4byte 0x03002360
_081CE77C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081CE788
	movs r0, #2
	b _081CE7DA
_081CE788:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081CE796
	movs r0, #3
	b _081CE7DA
_081CE796:
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _081CE7A6
	movs r0, #4
	b _081CE7DA
_081CE7A6:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081CE7BC
	str r2, [r4, #0x1c]
	ldr r0, _081CE7B8
	str r0, [r4]
	movs r0, #5
	b _081CE7DA
	.align 2, 0
_081CE7B8: .4byte 0x081CE7E5
_081CE7BC:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _081CE7CA
	movs r0, #0
	b _081CE7DA
_081CE7CA:
	bl GetSelectedMatchCall
	ldr r1, [r4, #0x20]
	strh r0, [r1, #2]
	str r5, [r4, #0x1c]
	ldr r0, _081CE7E0
	str r0, [r4]
	movs r0, #6
_081CE7DA:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081CE7E0: .4byte 0x081CE7ED
	thumb_func_end sub_081CE764

	thumb_func_start sub_081CE7E4
sub_081CE7E4: @ 0x081CE7E4
	ldr r0, _081CE7E8
	bx lr
	.align 2, 0
_081CE7E8: .4byte 0x000186A3
	thumb_func_end sub_081CE7E4

	thumb_func_start sub_081CE7EC
sub_081CE7EC: @ 0x081CE7EC
	ldr r0, _081CE7F0
	bx lr
	.align 2, 0
_081CE7F0: .4byte 0x000186A9
	thumb_func_end sub_081CE7EC

	thumb_func_start sub_081CE7F4
sub_081CE7F4: @ 0x081CE7F4
	push {lr}
	movs r0, #7
	bl GetSubstructPtr
	ldr r0, [r0, #0x18]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CE7F4

	thumb_func_start sub_081CE804
sub_081CE804: @ 0x081CE804
	push {lr}
	movs r0, #7
	bl GetSubstructPtr
	ldr r0, [r0, #0x20]
	adds r0, #4
	pop {r1}
	bx r1
	thumb_func_end sub_081CE804

	thumb_func_start sub_081CE814
sub_081CE814: @ 0x081CE814
	push {lr}
	movs r0, #7
	bl GetSubstructPtr
	ldr r0, [r0, #0x20]
	ldrh r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end sub_081CE814

	thumb_func_start sub_081CE824
sub_081CE824: @ 0x081CE824
	push {r4, lr}
	movs r0, #7
	bl GetSubstructPtr
	adds r4, r0, #0
	bl GetSelectedMatchCall
	ldr r1, [r4, #0x20]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1, #6]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CE824

	thumb_func_start sub_081CE840
sub_081CE840: @ 0x081CE840
	push {lr}
	movs r0, #7
	bl GetSubstructPtr
	ldr r0, [r0, #0x20]
	ldrh r0, [r0, #2]
	pop {r1}
	bx r1
	thumb_func_end sub_081CE840

	thumb_func_start sub_081CE850
sub_081CE850: @ 0x081CE850
	push {lr}
	ldr r2, _081CE864
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
_081CE864: .4byte 0x085F59C0
	thumb_func_end sub_081CE850

	thumb_func_start sub_081CE868
sub_081CE868: @ 0x081CE868
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r0, #7
	bl GetSubstructPtr
	adds r6, r0, #0
	ldr r0, [r6, #0x20]
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r6, #0x20]
	strh r1, [r0, #2]
	ldr r1, _081CE8E8
	ldr r0, [sp]
	ands r0, r1
	movs r1, #0xe
	orrs r0, r1
	str r0, [sp]
	movs r5, #0
_081CE88C:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081CE8EC
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _081CE8DE
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _081CE8D8
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x10
	ldr r2, _081CE8F0
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldr r1, [r6, #0x14]
	adds r0, r4, #0
	bl GetMonData
	lsls r0, r0, #0x10
	ldr r2, _081CE8F4
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	adds r0, r6, #0
	mov r1, sp
	bl sub_081CE9F8
_081CE8D8:
	adds r5, #1
	cmp r5, #5
	ble _081CE88C
_081CE8DE:
	movs r0, #1
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081CE8E8: .4byte 0xFFFFFF00
_081CE8EC: .4byte 0x02024190
_081CE8F0: .4byte 0xFFFF00FF
_081CE8F4: .4byte 0x0000FFFF
	thumb_func_end sub_081CE868

	thumb_func_start sub_081CE8F8
sub_081CE8F8: @ 0x081CE8F8
	push {lr}
	movs r0, #7
	bl GetSubstructPtr
	movs r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0xc]
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end sub_081CE8F8

	thumb_func_start sub_081CE90C
sub_081CE90C: @ 0x081CE90C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r0, #7
	bl GetSubstructPtr
	adds r6, r0, #0
	ldr r5, [r6, #0xc]
	ldr r4, [r6, #0x10]
	movs r0, #0
	mov r8, r0
	cmp r5, #0xd
	bgt _081CE99C
_081CE928:
	cmp r4, #0x1d
	bgt _081CE994
	lsls r0, r5, #0x18
	lsrs r7, r0, #0x18
_081CE930:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CheckBoxMonSanityAt
	cmp r0, #0
	beq _081CE96E
	ldr r1, _081CE984
	ldr r0, [sp]
	ands r0, r1
	orrs r0, r7
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r1, #8
	ldr r2, _081CE988
	ands r0, r2
	orrs r0, r3
	str r0, [sp]
	ldr r2, [r6, #0x14]
	adds r0, r7, #0
	bl GetBoxMonDataAt
	lsls r0, r0, #0x10
	ldr r2, _081CE98C
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	adds r0, r6, #0
	mov r1, sp
	bl sub_081CE9F8
_081CE96E:
	movs r0, #1
	add r8, r0
	adds r4, #1
	mov r0, r8
	cmp r0, #0xe
	ble _081CE990
	str r5, [r6, #0xc]
	str r4, [r6, #0x10]
	movs r0, #3
	b _081CE99E
	.align 2, 0
_081CE984: .4byte 0xFFFFFF00
_081CE988: .4byte 0xFFFF00FF
_081CE98C: .4byte 0x0000FFFF
_081CE990:
	cmp r4, #0x1d
	ble _081CE930
_081CE994:
	movs r4, #0
	adds r5, #1
	cmp r5, #0xd
	ble _081CE928
_081CE99C:
	movs r0, #1
_081CE99E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CE90C

	thumb_func_start sub_081CE9AC
sub_081CE9AC: @ 0x081CE9AC
	push {r4, r5, r6, lr}
	movs r0, #7
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	ldrh r6, [r0]
	ldrh r4, [r0, #6]
	movs r1, #1
	strh r1, [r0, #6]
	movs r3, #1
	cmp r3, r6
	bge _081CE9EC
_081CE9C6:
	ldr r2, [r5, #0x20]
	lsls r0, r3, #2
	adds r1, r2, r0
	ldrh r0, [r1, #6]
	cmp r0, r4
	bne _081CE9E0
	subs r0, r3, #1
	lsls r0, r0, #2
	adds r0, r2, r0
	ldrh r0, [r0, #6]
	strh r0, [r1, #6]
	adds r0, r3, #1
	b _081CE9E6
_081CE9E0:
	adds r4, r0, #0
	adds r0, r3, #1
	strh r0, [r1, #6]
_081CE9E6:
	adds r3, r0, #0
	cmp r3, r6
	blt _081CE9C6
_081CE9EC:
	movs r0, #1
	str r0, [r5, #0x18]
	movs r0, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081CE9AC

	thumb_func_start sub_081CE9F8
sub_081CE9F8: @ 0x081CE9F8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r1, #0
	ldr r0, [r5, #0x20]
	ldrh r2, [r0]
	lsrs r3, r2, #1
	cmp r2, r3
	beq _081CEA28
	adds r6, r0, #0
	ldrh r4, [r7, #2]
_081CEA0E:
	lsls r0, r3, #2
	adds r0, r6, r0
	ldrh r0, [r0, #6]
	cmp r4, r0
	bls _081CEA1C
	adds r2, r3, #0
	b _081CEA1E
_081CEA1C:
	adds r1, r3, #1
_081CEA1E:
	subs r0, r2, r1
	lsrs r0, r0, #1
	adds r3, r1, r0
	cmp r2, r3
	bne _081CEA0E
_081CEA28:
	ldr r0, [r5, #0x20]
	ldrh r2, [r0]
	lsls r6, r3, #2
	cmp r2, r3
	bls _081CEA4C
	lsls r0, r2, #2
	subs r4, r0, #4
_081CEA36:
	ldr r0, [r5, #0x20]
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	subs r4, #4
	subs r2, #1
	cmp r2, r3
	bhi _081CEA36
_081CEA4C:
	ldr r0, [r5, #0x20]
	adds r0, #4
	adds r0, r0, r6
	ldr r1, [r7]
	str r1, [r0]
	ldr r1, [r5, #0x20]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081CE9F8

	thumb_func_start sub_081CEA64
sub_081CEA64: @ 0x081CEA64
	push {r4, lr}
	movs r1, #0x81
	lsls r1, r1, #4
	movs r0, #8
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CEA94
	ldr r0, _081CEA8C
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	ldr r0, _081CEA90
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #1
	b _081CEA96
	.align 2, 0
_081CEA8C: .4byte 0x081CEB4D
_081CEA90: .4byte 0x081CEB19
_081CEA94:
	movs r0, #0
_081CEA96:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CEA64

	thumb_func_start sub_081CEA9C
sub_081CEA9C: @ 0x081CEA9C
	push {r4, lr}
	movs r1, #0x81
	lsls r1, r1, #4
	movs r0, #8
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CEACC
	ldr r0, _081CEAC4
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	ldr r0, _081CEAC8
	str r0, [r4]
	movs r0, #1
	str r0, [r4, #0xc]
	b _081CEACE
	.align 2, 0
_081CEAC4: .4byte 0x081CEB4D
_081CEAC8: .4byte 0x081CEB19
_081CEACC:
	movs r0, #0
_081CEACE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CEA9C

	thumb_func_start sub_081CEAD4
sub_081CEAD4: @ 0x081CEAD4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #8
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, _081CEAFC
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r5, #4]
	ldr r0, _081CEB00
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CEAFC: .4byte 0x085F5BA4
_081CEB00: .4byte 0x081CEB19
	thumb_func_end sub_081CEAD4

	thumb_func_start sub_081CEB04
sub_081CEB04: @ 0x081CEB04
	push {lr}
	movs r0, #8
	bl GetSubstructPtr
	ldr r0, [r0]
	bl _call_via_r0
	pop {r1}
	thumb_func_end sub_081CEB04

	thumb_func_start sub_081CEB14
sub_081CEB14: @ 0x081CEB14
	bx r1
	.align 2, 0
	thumb_func_end sub_081CEB14

	thumb_func_start sub_081CEB18
sub_081CEB18: @ 0x081CEB18
	push {lr}
	movs r0, #8
	bl GetSubstructPtr
	ldr r0, [r0, #4]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CEB18

	thumb_func_start sub_081CEB2C
sub_081CEB2C: @ 0x081CEB2C
	push {r4, lr}
	movs r0, #8
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_081C79DC
	ldrb r0, [r4, #8]
	bl RemoveWindow
	movs r0, #8
	bl FreePokenavSubstruct
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CEB2C

	thumb_func_start sub_081CEB4C
sub_081CEB4C: @ 0x081CEB4C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #8
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #5
	bls _081CEB60
	b _081CECA2
_081CEB60:
	lsls r0, r4, #2
	ldr r1, _081CEB6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CEB6C: .4byte 0x081CEB70
_081CEB70: @ jump table
	.4byte _081CEB88 @ case 0
	.4byte _081CEBE0 @ case 1
	.4byte _081CEBF4 @ case 2
	.4byte _081CEC14 @ case 3
	.4byte _081CEC2A @ case 4
	.4byte _081CEC8E @ case 5
_081CEB88:
	ldr r0, _081CEBD0
	movs r1, #2
	bl InitBgTemplates
	ldr r1, _081CEBD4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, _081CEBD8
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	ldr r0, _081CEBDC
	movs r1, #0x10
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #1
	bl CopyBgTilemapBufferToVram
_081CEBCC:
	movs r0, #0
	b _081CECA4
	.align 2, 0
_081CEBD0: .4byte 0x085F5B9C
_081CEBD4: .4byte 0x085F59F0
_081CEBD8: .4byte 0x085F5AB8
_081CEBDC: .4byte 0x085F59D0
_081CEBE0:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CEC9E
	bl sub_081CE7F4
	cmp r0, #0
	beq _081CEC9E
	b _081CEBCC
_081CEBF4:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CEC9E
	ldr r0, _081CEC10
	movs r1, #0x20
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	bl sub_081CEF4C
	b _081CEBCC
	.align 2, 0
_081CEC10: .4byte 0x085F5B7C
_081CEC14:
	bl sub_081C79CC
	cmp r0, #0
	bne _081CEC9E
	adds r0, r5, #0
	bl sub_081CEEBC
	movs r0, #3
	bl sub_081C7364
	b _081CEBCC
_081CEC2A:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CEC9E
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl HideBg
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _081CEC86
	bl sub_081C6E6C
	adds r4, r0, #0
	adds r4, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl LoadLeftHeaderGfxForIndex
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl sub_081C7748
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl sub_081C7748
_081CEC86:
	movs r0, #1
	bl sub_081C7280
	b _081CEBCC
_081CEC8E:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CEC9E
	bl sub_081C77B8
	cmp r0, #0
	beq _081CECA2
_081CEC9E:
	movs r0, #2
	b _081CECA4
_081CECA2:
	movs r0, #4
_081CECA4:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CEB4C

	thumb_func_start sub_081CECAC
sub_081CECAC: @ 0x081CECAC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #8
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CECEC
	cmp r4, #1
	bgt _081CECC6
	cmp r4, #0
	beq _081CECD0
	b _081CED0C
_081CECC6:
	cmp r4, #2
	beq _081CECF4
	cmp r4, #3
	beq _081CECFE
	b _081CED0C
_081CECD0:
	movs r0, #5
	bl PlaySE
	bl MatchCall_MoveCursorUp
	cmp r0, #1
	beq _081CECE8
	cmp r0, #1
	bgt _081CECFA
	cmp r0, #0
	bne _081CECFA
	b _081CED0C
_081CECE8:
	movs r0, #7
	b _081CED0E
_081CECEC:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CED08
_081CECF4:
	adds r0, r5, #0
	bl sub_081CEEE8
_081CECFA:
	movs r0, #0
	b _081CED0E
_081CECFE:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CED0C
_081CED08:
	movs r0, #2
	b _081CED0E
_081CED0C:
	movs r0, #4
_081CED0E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CECAC

	thumb_func_start sub_081CED14
sub_081CED14: @ 0x081CED14
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #8
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CED54
	cmp r4, #1
	bgt _081CED2E
	cmp r4, #0
	beq _081CED38
	b _081CED74
_081CED2E:
	cmp r4, #2
	beq _081CED5C
	cmp r4, #3
	beq _081CED66
	b _081CED74
_081CED38:
	movs r0, #5
	bl PlaySE
	bl MatchCall_MoveCursorDown
	cmp r0, #1
	beq _081CED50
	cmp r0, #1
	bgt _081CED62
	cmp r0, #0
	bne _081CED62
	b _081CED74
_081CED50:
	movs r0, #7
	b _081CED76
_081CED54:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CED70
_081CED5C:
	adds r0, r5, #0
	bl sub_081CEEE8
_081CED62:
	movs r0, #0
	b _081CED76
_081CED66:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CED74
_081CED70:
	movs r0, #2
	b _081CED76
_081CED74:
	movs r0, #4
_081CED76:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CED14

	thumb_func_start sub_081CED7C
sub_081CED7C: @ 0x081CED7C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #8
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CEDBC
	cmp r4, #1
	bgt _081CED96
	cmp r4, #0
	beq _081CEDA0
	b _081CEDDC
_081CED96:
	cmp r4, #2
	beq _081CEDC4
	cmp r4, #3
	beq _081CEDCE
	b _081CEDDC
_081CEDA0:
	movs r0, #5
	bl PlaySE
	bl MatchCall_PageUp
	cmp r0, #1
	beq _081CEDB8
	cmp r0, #1
	bgt _081CEDCA
	cmp r0, #0
	bne _081CEDCA
	b _081CEDDC
_081CEDB8:
	movs r0, #7
	b _081CEDDE
_081CEDBC:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CEDD8
_081CEDC4:
	adds r0, r5, #0
	bl sub_081CEEE8
_081CEDCA:
	movs r0, #0
	b _081CEDDE
_081CEDCE:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CEDDC
_081CEDD8:
	movs r0, #2
	b _081CEDDE
_081CEDDC:
	movs r0, #4
_081CEDDE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CED7C

	thumb_func_start sub_081CEDE4
sub_081CEDE4: @ 0x081CEDE4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #8
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CEE24
	cmp r4, #1
	bgt _081CEDFE
	cmp r4, #0
	beq _081CEE08
	b _081CEE44
_081CEDFE:
	cmp r4, #2
	beq _081CEE2C
	cmp r4, #3
	beq _081CEE36
	b _081CEE44
_081CEE08:
	movs r0, #5
	bl PlaySE
	bl MatchCall_PageDown
	cmp r0, #1
	beq _081CEE20
	cmp r0, #1
	bgt _081CEE32
	cmp r0, #0
	bne _081CEE32
	b _081CEE44
_081CEE20:
	movs r0, #7
	b _081CEE46
_081CEE24:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CEE40
_081CEE2C:
	adds r0, r5, #0
	bl sub_081CEEE8
_081CEE32:
	movs r0, #0
	b _081CEE46
_081CEE36:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CEE44
_081CEE40:
	movs r0, #2
	b _081CEE46
_081CEE44:
	movs r0, #4
_081CEE46:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CEDE4

	thumb_func_start sub_081CEE4C
sub_081CEE4C: @ 0x081CEE4C
	push {lr}
	cmp r0, #0
	beq _081CEE58
	cmp r0, #1
	beq _081CEE6C
	b _081CEE84
_081CEE58:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081C7280
	bl sub_081C7060
	movs r0, #0
	b _081CEE86
_081CEE6C:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CEE7C
	bl MainMenuLoopedTaskIsBusy
	cmp r0, #0
	beq _081CEE80
_081CEE7C:
	movs r0, #2
	b _081CEE86
_081CEE80:
	bl sub_081C7784
_081CEE84:
	movs r0, #4
_081CEE86:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CEE4C

	thumb_func_start sub_081CEE8C
sub_081CEE8C: @ 0x081CEE8C
	push {lr}
	cmp r0, #0
	beq _081CEE98
	cmp r0, #1
	beq _081CEEA8
	b _081CEEB4
_081CEE98:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081C7280
	movs r0, #0
	b _081CEEB6
_081CEEA8:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	beq _081CEEB4
	movs r0, #2
	b _081CEEB6
_081CEEB4:
	movs r0, #4
_081CEEB6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CEE8C

	thumb_func_start sub_081CEEBC
sub_081CEEBC: @ 0x081CEEBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081CEEE4
	bl AddWindow
	strh r0, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	ldrb r0, [r4, #8]
	movs r1, #1
	bl CopyWindowToVram
	adds r0, r4, #0
	bl sub_081CEEE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CEEE4: .4byte 0x085F5BC0
	thumb_func_end sub_081CEEBC

	thumb_func_start sub_081CEEE8
sub_081CEEE8: @ 0x081CEEE8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	bl sub_081CE824
	adds r5, r0, #0
	bl DynamicPlaceholderTextUtil_Reset
	ldr r4, _081CEF40
	movs r0, #0
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _081CEF44
	ldr r1, _081CEF48
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldrb r0, [r6, #8]
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r6, #8]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CEF40: .4byte 0x02021C40
_081CEF44: .4byte 0x02021C54
_081CEF48: .4byte 0x085CB81B
	thumb_func_end sub_081CEEE8

	thumb_func_start sub_081CEF4C
sub_081CEF4C: @ 0x081CEF4C
	push {r4, lr}
	sub sp, #0x18
	bl sub_081CE804
	str r0, [sp]
	bl sub_081CE814
	mov r1, sp
	movs r4, #0
	strh r0, [r1, #4]
	movs r0, #4
	strb r0, [r1, #8]
	bl sub_081CE840
	mov r1, sp
	strh r0, [r1, #6]
	movs r0, #0xe
	strb r0, [r1, #9]
	movs r0, #0xf
	strb r0, [r1, #0xa]
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #8
	strb r0, [r1, #0xc]
	movs r0, #2
	strb r0, [r1, #0xd]
	ldr r0, _081CEF98
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	ldr r0, _081CEF9C
	movs r2, #0
	bl sub_081C797C
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CEF98: .4byte 0x081CEFA1
_081CEF9C: .4byte 0x085F5BA0
	thumb_func_end sub_081CEF4C

	thumb_func_start sub_081CEFA0
sub_081CEFA0: @ 0x081CEFA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	bl DynamicPlaceholderTextUtil_Reset
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _081CEFE8
	ldrb r1, [r4, #1]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _081CEFE0
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl GetLevelFromMonExp
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _081CEFE4
	adds r0, r4, #0
	movs r1, #2
	bl GetMonData
	b _081CF00E
	.align 2, 0
_081CEFE0: .4byte 0x02024190
_081CEFE4: .4byte 0x02021C68
_081CEFE8:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetBoxedMonPtr
	adds r4, r0, #0
	bl GetBoxMonGender
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl GetLevelFromBoxMonExp
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _081CF060
	adds r0, r4, #0
	movs r1, #2
	bl GetBoxMonData
_081CF00E:
	ldr r4, _081CF060
	adds r0, r4, #0
	bl StringGetEnd10
	ldr r6, _081CF064
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #5
	bl StringCopyPadded
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r5, _081CF068
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #3
	bl StringCopyPadded
	movs r0, #0
	adds r1, r6, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #1
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	cmp r7, #0xfe
	beq _081CF070
	cmp r7, #0xfe
	bgt _081CF078
	cmp r7, #0
	bne _081CF078
	ldr r1, _081CF06C
	b _081CF07A
	.align 2, 0
_081CF060: .4byte 0x02021C68
_081CF064: .4byte 0x02021C40
_081CF068: .4byte 0x02021C54
_081CF06C: .4byte 0x085CB7D6
_081CF070:
	ldr r1, _081CF074
	b _081CF07A
	.align 2, 0
_081CF074: .4byte 0x085CB7EA
_081CF078:
	ldr r1, _081CF08C
_081CF07A:
	mov r0, r8
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CF08C: .4byte 0x085CB7FE
	thumb_func_end sub_081CEFA0

	thumb_func_start sub_081CF090
sub_081CF090: @ 0x081CF090
	push {r4, lr}
	movs r0, #9
	movs r1, #0x20
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CF0D0
	ldr r1, _081CF0C4
	movs r0, #0x12
	bl AllocSubstruct
	str r0, [r4, #0x1c]
	cmp r0, #0
	beq _081CF0D0
	ldr r0, _081CF0C8
	str r0, [r4]
	ldr r0, _081CF0CC
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r4, #0x14]
	movs r0, #1
	b _081CF0D2
	.align 2, 0
_081CF0C4: .4byte 0x000006AC
_081CF0C8: .4byte 0x081CF13D
_081CF0CC: .4byte 0x081CF249
_081CF0D0:
	movs r0, #0
_081CF0D2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF090

	thumb_func_start sub_081CF0D8
sub_081CF0D8: @ 0x081CF0D8
	push {r4, lr}
	movs r0, #9
	movs r1, #0x20
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CF100
	movs r0, #0x12
	bl GetSubstructPtr
	str r0, [r4, #0x1c]
	ldr r0, _081CF0FC
	str r0, [r4]
	movs r0, #1
	str r0, [r4, #0x14]
	b _081CF102
	.align 2, 0
_081CF0FC: .4byte 0x081CF15D
_081CF100:
	movs r0, #0
_081CF102:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF0D8

	thumb_func_start sub_081CF108
sub_081CF108: @ 0x081CF108
	push {lr}
	movs r0, #9
	bl GetSubstructPtr
	ldr r1, [r0]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CF108

	thumb_func_start sub_081CF11C
sub_081CF11C: @ 0x081CF11C
	push {lr}
	movs r0, #9
	bl GetSubstructPtr
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _081CF130
	movs r0, #0x12
	bl FreePokenavSubstruct
_081CF130:
	movs r0, #9
	bl FreePokenavSubstruct
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081CF11C

	thumb_func_start sub_081CF13C
sub_081CF13C: @ 0x081CF13C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl IsLoopedTaskActive
	cmp r0, #0
	bne _081CF14E
	ldr r0, _081CF158
	str r0, [r4]
_081CF14E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081CF158: .4byte 0x081CF15D
	thumb_func_end sub_081CF13C

	thumb_func_start sub_081CF15C
sub_081CF15C: @ 0x081CF15C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _081CF170
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081CF174
	movs r0, #1
	b _081CF1D2
	.align 2, 0
_081CF170: .4byte 0x03002360
_081CF174:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081CF180
	movs r0, #2
	b _081CF1D2
_081CF180:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081CF18E
	movs r0, #3
	b _081CF1D2
_081CF18E:
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _081CF19E
	movs r0, #4
	b _081CF1D2
_081CF19E:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081CF1B4
	str r2, [r4, #0x18]
	ldr r0, _081CF1B0
	str r0, [r4]
	movs r0, #5
	b _081CF1D2
	.align 2, 0
_081CF1B0: .4byte 0x081CF1DD
_081CF1B4:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _081CF1C2
	movs r0, #0
	b _081CF1D2
_081CF1C2:
	bl GetSelectedMatchCall
	ldr r1, [r4, #0x1c]
	strh r0, [r1, #2]
	str r5, [r4, #0x18]
	ldr r0, _081CF1D8
	str r0, [r4]
	movs r0, #6
_081CF1D2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081CF1D8: .4byte 0x081CF1E5
	thumb_func_end sub_081CF15C

	thumb_func_start sub_081CF1DC
sub_081CF1DC: @ 0x081CF1DC
	ldr r0, _081CF1E0
	bx lr
	.align 2, 0
_081CF1E0: .4byte 0x000186A5
	thumb_func_end sub_081CF1DC

	thumb_func_start sub_081CF1E4
sub_081CF1E4: @ 0x081CF1E4
	ldr r0, _081CF1E8
	bx lr
	.align 2, 0
_081CF1E8: .4byte 0x000186AD
	thumb_func_end sub_081CF1E4

	thumb_func_start sub_081CF1EC
sub_081CF1EC: @ 0x081CF1EC
	push {lr}
	movs r0, #9
	bl GetSubstructPtr
	ldr r0, [r0, #0x14]
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CF1EC

	thumb_func_start sub_081CF1FC
sub_081CF1FC: @ 0x081CF1FC
	push {lr}
	movs r0, #9
	bl GetSubstructPtr
	ldr r0, [r0, #0x1c]
	adds r0, #4
	pop {r1}
	bx r1
	thumb_func_end sub_081CF1FC

	thumb_func_start sub_081CF20C
sub_081CF20C: @ 0x081CF20C
	push {lr}
	movs r0, #9
	bl GetSubstructPtr
	ldr r0, [r0, #0x1c]
	ldrh r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end sub_081CF20C

	thumb_func_start sub_081CF21C
sub_081CF21C: @ 0x081CF21C
	push {r4, lr}
	movs r0, #9
	bl GetSubstructPtr
	adds r4, r0, #0
	bl GetSelectedMatchCall
	ldr r1, [r4, #0x1c]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1, #6]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF21C

	thumb_func_start sub_081CF238
sub_081CF238: @ 0x081CF238
	push {lr}
	movs r0, #9
	bl GetSubstructPtr
	ldr r0, [r0, #0x1c]
	ldrh r0, [r0, #2]
	pop {r1}
	bx r1
	thumb_func_end sub_081CF238

	thumb_func_start sub_081CF248
sub_081CF248: @ 0x081CF248
	push {lr}
	ldr r2, _081CF25C
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r1}
	bx r1
	.align 2, 0
_081CF25C: .4byte 0x085F5BC8
	thumb_func_end sub_081CF248

	thumb_func_start sub_081CF260
sub_081CF260: @ 0x081CF260
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r0, #9
	bl GetSubstructPtr
	adds r6, r0, #0
	ldr r0, [r6, #0x1c]
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r6, #0x1c]
	strh r1, [r0, #2]
	ldr r1, _081CF2F0
	ldr r0, [sp]
	ands r0, r1
	movs r1, #0xe
	orrs r0, r1
	str r0, [sp]
	movs r5, #0
_081CF284:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081CF2F4
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _081CF2E4
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _081CF2DE
	adds r0, r4, #0
	movs r1, #4
	bl GetMonData
	cmp r0, #0
	bne _081CF2DE
	adds r0, r4, #0
	movs r1, #0x52
	bl GetMonData
	adds r3, r0, #0
	cmp r3, #0
	beq _081CF2DE
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x10
	ldr r2, _081CF2F8
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	lsls r2, r3, #0x10
	ldr r1, _081CF2FC
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	adds r0, r6, #0
	mov r1, sp
	bl sub_081CF3C0
_081CF2DE:
	adds r5, #1
	cmp r5, #5
	ble _081CF284
_081CF2E4:
	movs r0, #1
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081CF2F0: .4byte 0xFFFFFF00
_081CF2F4: .4byte 0x02024190
_081CF2F8: .4byte 0xFFFF00FF
_081CF2FC: .4byte 0x0000FFFF
	thumb_func_end sub_081CF260

	thumb_func_start sub_081CF300
sub_081CF300: @ 0x081CF300
	push {lr}
	movs r0, #9
	bl GetSubstructPtr
	movs r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0xc]
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end sub_081CF300

	thumb_func_start sub_081CF314
sub_081CF314: @ 0x081CF314
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #9
	bl GetSubstructPtr
	mov r8, r0
	ldr r7, [r0, #0xc]
	ldr r6, [r0, #0x10]
	movs r0, #0
	mov sb, r0
	cmp r7, #0xd
	bgt _081CF3A8
	b _081CF39C
_081CF334:
	adds r0, r7, #0
	adds r1, r6, #0
	bl CheckBoxMonSanityAt
	cmp r0, #0
	beq _081CF37A
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x52
	bl GetBoxMonDataAt
	adds r3, r0, #0
	cmp r3, #0
	beq _081CF37A
	ldr r1, _081CF390
	ldr r0, [sp]
	ands r0, r1
	orrs r0, r5
	lsls r2, r4, #8
	ldr r1, _081CF394
	ands r0, r1
	orrs r0, r2
	lsls r2, r3, #0x10
	ldr r1, _081CF398
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	mov r0, r8
	mov r1, sp
	bl sub_081CF3C0
_081CF37A:
	movs r1, #1
	add sb, r1
	adds r6, #1
	mov r0, sb
	cmp r0, #0xe
	ble _081CF39C
	mov r1, r8
	str r7, [r1, #0xc]
	str r6, [r1, #0x10]
	movs r0, #3
	b _081CF3B0
	.align 2, 0
_081CF390: .4byte 0xFFFFFF00
_081CF394: .4byte 0xFFFF00FF
_081CF398: .4byte 0x0000FFFF
_081CF39C:
	cmp r6, #0x1d
	ble _081CF334
	movs r6, #0
	adds r7, #1
	cmp r7, #0xd
	ble _081CF39C
_081CF3A8:
	movs r0, #1
	mov r1, r8
	str r0, [r1, #0x14]
	movs r0, #4
_081CF3B0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CF314

	thumb_func_start sub_081CF3C0
sub_081CF3C0: @ 0x081CF3C0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r1, #0
	ldr r0, [r5, #0x1c]
	ldrh r2, [r0]
	lsrs r3, r2, #1
	cmp r2, r3
	beq _081CF3F0
	adds r6, r0, #0
	ldrh r4, [r7, #2]
_081CF3D6:
	lsls r0, r3, #2
	adds r0, r6, r0
	ldrh r0, [r0, #6]
	cmp r4, r0
	bls _081CF3E4
	adds r2, r3, #0
	b _081CF3E6
_081CF3E4:
	adds r1, r3, #1
_081CF3E6:
	subs r0, r2, r1
	lsrs r0, r0, #1
	adds r3, r1, r0
	cmp r2, r3
	bne _081CF3D6
_081CF3F0:
	ldr r0, [r5, #0x1c]
	ldrh r2, [r0]
	lsls r6, r3, #2
	cmp r2, r3
	bls _081CF414
	lsls r0, r2, #2
	subs r4, r0, #4
_081CF3FE:
	ldr r0, [r5, #0x1c]
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	subs r4, #4
	subs r2, #1
	cmp r2, r3
	bhi _081CF3FE
_081CF414:
	ldr r0, [r5, #0x1c]
	adds r0, #4
	adds r0, r0, r6
	ldr r1, [r7]
	str r1, [r0]
	ldr r1, [r5, #0x1c]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081CF3C0

	thumb_func_start sub_081CF42C
sub_081CF42C: @ 0x081CF42C
	push {r4, r5, r6, lr}
	movs r5, #0
_081CF430:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081CF48C
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _081CF45E
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _081CF45E
	adds r0, r4, #0
	movs r1, #0x53
	bl GetMonData
	cmp r0, #0
	bne _081CF486
_081CF45E:
	adds r5, #1
	cmp r5, #5
	ble _081CF430
	movs r5, #0
_081CF466:
	movs r4, #0
	lsls r6, r5, #0x18
_081CF46A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CheckBoxMonSanityAt
	cmp r0, #0
	beq _081CF490
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r6, #0x18
	movs r2, #0x53
	bl GetBoxMonDataAt
	cmp r0, #0
	beq _081CF490
_081CF486:
	movs r0, #1
	b _081CF49E
	.align 2, 0
_081CF48C: .4byte 0x02024190
_081CF490:
	adds r4, #1
	cmp r4, #0x1d
	ble _081CF46A
	adds r5, #1
	cmp r5, #0xd
	ble _081CF466
	movs r0, #0
_081CF49E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF42C

	thumb_func_start sub_081CF4A4
sub_081CF4A4: @ 0x081CF4A4
	push {r4, lr}
	movs r1, #0x81
	lsls r1, r1, #4
	movs r0, #0xa
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CF4D4
	ldr r0, _081CF4CC
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	ldr r0, _081CF4D0
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #1
	b _081CF4D6
	.align 2, 0
_081CF4CC: .4byte 0x081CF58D
_081CF4D0: .4byte 0x081CF559
_081CF4D4:
	movs r0, #0
_081CF4D6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF4A4

	thumb_func_start sub_081CF4DC
sub_081CF4DC: @ 0x081CF4DC
	push {r4, lr}
	movs r1, #0x81
	lsls r1, r1, #4
	movs r0, #0xa
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081CF50C
	ldr r0, _081CF504
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #4]
	ldr r0, _081CF508
	str r0, [r4]
	movs r0, #1
	str r0, [r4, #0xc]
	b _081CF50E
	.align 2, 0
_081CF504: .4byte 0x081CF58D
_081CF508: .4byte 0x081CF559
_081CF50C:
	movs r0, #0
_081CF50E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF4DC

	thumb_func_start sub_081CF514
sub_081CF514: @ 0x081CF514
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, _081CF53C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r5, #4]
	ldr r0, _081CF540
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CF53C: .4byte 0x085F5DA8
_081CF540: .4byte 0x081CF559
	thumb_func_end sub_081CF514

	thumb_func_start sub_081CF544
sub_081CF544: @ 0x081CF544
	push {lr}
	movs r0, #0xa
	bl GetSubstructPtr
	ldr r0, [r0]
	bl _call_via_r0
	pop {r1}
	thumb_func_end sub_081CF544

	thumb_func_start sub_081CF554
sub_081CF554: @ 0x081CF554
	bx r1
	.align 2, 0
	thumb_func_end sub_081CF554

	thumb_func_start sub_081CF558
sub_081CF558: @ 0x081CF558
	push {lr}
	movs r0, #0xa
	bl GetSubstructPtr
	ldr r0, [r0, #4]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CF558

	thumb_func_start sub_081CF56C
sub_081CF56C: @ 0x081CF56C
	push {r4, lr}
	movs r0, #0xa
	bl GetSubstructPtr
	adds r4, r0, #0
	bl sub_081C79DC
	ldrb r0, [r4, #8]
	bl RemoveWindow
	movs r0, #0xa
	bl FreePokenavSubstruct
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081CF56C

	thumb_func_start sub_081CF58C
sub_081CF58C: @ 0x081CF58C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0xa
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #5
	bls _081CF5A0
	b _081CF6C6
_081CF5A0:
	lsls r0, r4, #2
	ldr r1, _081CF5AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081CF5AC: .4byte 0x081CF5B0
_081CF5B0: @ jump table
	.4byte _081CF5C8 @ case 0
	.4byte _081CF61C @ case 1
	.4byte _081CF64A @ case 2
	.4byte _081CF668 @ case 3
	.4byte _081CF678 @ case 4
	.4byte _081CF6B2 @ case 5
_081CF5C8:
	ldr r0, _081CF60C
	movs r1, #2
	bl InitBgTemplates
	ldr r1, _081CF610
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, _081CF614
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r0, _081CF618
	movs r1, #0x10
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #1
	bl CopyBgTilemapBufferToVram
_081CF606:
	movs r0, #0
	b _081CF6C8
	.align 2, 0
_081CF60C: .4byte 0x085F5DA0
_081CF610: .4byte 0x085F5BF4
_081CF614: .4byte 0x085F5CBC
_081CF618: .4byte 0x085F5BD4
_081CF61C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CF6C2
	bl sub_081CF1EC
	cmp r0, #0
	beq _081CF6C2
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	bl ShowBg
	b _081CF606
_081CF64A:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CF6C2
	ldr r0, _081CF664
	movs r1, #0x20
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	bl sub_081CF9A4
	b _081CF606
	.align 2, 0
_081CF664: .4byte 0x085F5D80
_081CF668:
	bl sub_081C79CC
	cmp r0, #0
	bne _081CF6C2
	adds r0, r5, #0
	bl sub_081CF8E0
	b _081CF606
_081CF678:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081CF6C2
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl HideBg
	movs r0, #9
	bl sub_081C7364
	movs r0, #1
	bl sub_081C7280
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _081CF606
	movs r0, #2
	bl LoadLeftHeaderGfxForIndex
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl sub_081C7748
	b _081CF606
_081CF6B2:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CF6C2
	bl sub_081C77B8
	cmp r0, #0
	beq _081CF6C6
_081CF6C2:
	movs r0, #2
	b _081CF6C8
_081CF6C6:
	movs r0, #4
_081CF6C8:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF58C

	thumb_func_start sub_081CF6D0
sub_081CF6D0: @ 0x081CF6D0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CF710
	cmp r4, #1
	bgt _081CF6EA
	cmp r4, #0
	beq _081CF6F4
	b _081CF730
_081CF6EA:
	cmp r4, #2
	beq _081CF718
	cmp r4, #3
	beq _081CF722
	b _081CF730
_081CF6F4:
	movs r0, #5
	bl PlaySE
	bl MatchCall_MoveCursorUp
	cmp r0, #1
	beq _081CF70C
	cmp r0, #1
	bgt _081CF71E
	cmp r0, #0
	bne _081CF71E
	b _081CF730
_081CF70C:
	movs r0, #7
	b _081CF732
_081CF710:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CF72C
_081CF718:
	adds r0, r5, #0
	bl sub_081CF95C
_081CF71E:
	movs r0, #0
	b _081CF732
_081CF722:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CF730
_081CF72C:
	movs r0, #2
	b _081CF732
_081CF730:
	movs r0, #4
_081CF732:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF6D0

	thumb_func_start sub_081CF738
sub_081CF738: @ 0x081CF738
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CF778
	cmp r4, #1
	bgt _081CF752
	cmp r4, #0
	beq _081CF75C
	b _081CF798
_081CF752:
	cmp r4, #2
	beq _081CF780
	cmp r4, #3
	beq _081CF78A
	b _081CF798
_081CF75C:
	movs r0, #5
	bl PlaySE
	bl MatchCall_MoveCursorDown
	cmp r0, #1
	beq _081CF774
	cmp r0, #1
	bgt _081CF786
	cmp r0, #0
	bne _081CF786
	b _081CF798
_081CF774:
	movs r0, #7
	b _081CF79A
_081CF778:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CF794
_081CF780:
	adds r0, r5, #0
	bl sub_081CF95C
_081CF786:
	movs r0, #0
	b _081CF79A
_081CF78A:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CF798
_081CF794:
	movs r0, #2
	b _081CF79A
_081CF798:
	movs r0, #4
_081CF79A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF738

	thumb_func_start sub_081CF7A0
sub_081CF7A0: @ 0x081CF7A0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CF7E0
	cmp r4, #1
	bgt _081CF7BA
	cmp r4, #0
	beq _081CF7C4
	b _081CF800
_081CF7BA:
	cmp r4, #2
	beq _081CF7E8
	cmp r4, #3
	beq _081CF7F2
	b _081CF800
_081CF7C4:
	movs r0, #5
	bl PlaySE
	bl MatchCall_PageUp
	cmp r0, #1
	beq _081CF7DC
	cmp r0, #1
	bgt _081CF7EE
	cmp r0, #0
	bne _081CF7EE
	b _081CF800
_081CF7DC:
	movs r0, #7
	b _081CF802
_081CF7E0:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CF7FC
_081CF7E8:
	adds r0, r5, #0
	bl sub_081CF95C
_081CF7EE:
	movs r0, #0
	b _081CF802
_081CF7F2:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CF800
_081CF7FC:
	movs r0, #2
	b _081CF802
_081CF800:
	movs r0, #4
_081CF802:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF7A0

	thumb_func_start sub_081CF808
sub_081CF808: @ 0x081CF808
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #1
	beq _081CF848
	cmp r4, #1
	bgt _081CF822
	cmp r4, #0
	beq _081CF82C
	b _081CF868
_081CF822:
	cmp r4, #2
	beq _081CF850
	cmp r4, #3
	beq _081CF85A
	b _081CF868
_081CF82C:
	movs r0, #5
	bl PlaySE
	bl MatchCall_PageDown
	cmp r0, #1
	beq _081CF844
	cmp r0, #1
	bgt _081CF856
	cmp r0, #0
	bne _081CF856
	b _081CF868
_081CF844:
	movs r0, #7
	b _081CF86A
_081CF848:
	bl sub_081C7DD8
	cmp r0, #0
	bne _081CF864
_081CF850:
	adds r0, r5, #0
	bl sub_081CF95C
_081CF856:
	movs r0, #0
	b _081CF86A
_081CF85A:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081CF868
_081CF864:
	movs r0, #2
	b _081CF86A
_081CF868:
	movs r0, #4
_081CF86A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081CF808

	thumb_func_start sub_081CF870
sub_081CF870: @ 0x081CF870
	push {lr}
	cmp r0, #0
	beq _081CF87C
	cmp r0, #1
	beq _081CF890
	b _081CF8A8
_081CF87C:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081C7280
	bl sub_081C7060
	movs r0, #0
	b _081CF8AA
_081CF890:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	bne _081CF8A0
	bl MainMenuLoopedTaskIsBusy
	cmp r0, #0
	beq _081CF8A4
_081CF8A0:
	movs r0, #2
	b _081CF8AA
_081CF8A4:
	bl sub_081C7784
_081CF8A8:
	movs r0, #4
_081CF8AA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CF870

	thumb_func_start sub_081CF8B0
sub_081CF8B0: @ 0x081CF8B0
	push {lr}
	cmp r0, #0
	beq _081CF8BC
	cmp r0, #1
	beq _081CF8CC
	b _081CF8D8
_081CF8BC:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_081C7280
	movs r0, #0
	b _081CF8DA
_081CF8CC:
	bl IsDma3ManagerBusyWithBgCopy_
	cmp r0, #0
	beq _081CF8D8
	movs r0, #2
	b _081CF8DA
_081CF8D8:
	movs r0, #4
_081CF8DA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081CF8B0

	thumb_func_start sub_081CF8E0
sub_081CF8E0: @ 0x081CF8E0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _081CF94C
	bl AddWindow
	movs r6, #0
	strh r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	bl sub_081CF20C
	adds r1, r0, #0
	ldr r4, _081CF950
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, #0
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r4, _081CF954
	ldr r1, _081CF958
	adds r0, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldrb r0, [r5, #8]
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r5, #8]
	movs r1, #1
	bl CopyWindowToVram
	adds r0, r5, #0
	bl sub_081CF95C
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081CF94C: .4byte 0x085F5DC4
_081CF950: .4byte 0x02021C40
_081CF954: .4byte 0x02021C54
_081CF958: .4byte 0x085F5DCC
	thumb_func_end sub_081CF8E0

	thumb_func_start sub_081CF95C
sub_081CF95C: @ 0x081CF95C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl GetSelectedMatchCall
	adds r1, r0, #0
	ldr r4, _081CF9A0
	adds r1, #1
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldrb r0, [r5, #8]
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r5, #8]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081CF9A0: .4byte 0x02021C40
	thumb_func_end sub_081CF95C

	thumb_func_start sub_081CF9A4
sub_081CF9A4: @ 0x081CF9A4
	push {r4, lr}
	sub sp, #0x18
	bl sub_081CF1FC
	str r0, [sp]
	bl sub_081CF20C
	mov r1, sp
	movs r4, #0
	strh r0, [r1, #4]
	movs r0, #4
	strb r0, [r1, #8]
	bl sub_081CF238
	mov r1, sp
	strh r0, [r1, #6]
	movs r0, #0xe
	strb r0, [r1, #9]
	movs r0, #0x10
	strb r0, [r1, #0xa]
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #8
	strb r0, [r1, #0xc]
	movs r0, #2
	strb r0, [r1, #0xd]
	ldr r0, _081CF9F0
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	ldr r0, _081CF9F4
	movs r2, #0
	bl sub_081C797C
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081CF9F0: .4byte 0x081CF9F9
_081CF9F4: .4byte 0x085F5DA4
	thumb_func_end sub_081CF9A4

	thumb_func_start sub_081CF9F8
sub_081CF9F8: @ 0x081CF9F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r1
	adds r7, r0, #0
	bl DynamicPlaceholderTextUtil_Reset
	ldrb r0, [r7]
	cmp r0, #0xe
	bne _081CFA44
	ldrb r1, [r7, #1]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _081CFA3C
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	bl GetLevelFromMonExp
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _081CFA40
	adds r0, r4, #0
	movs r1, #2
	bl GetMonData
	b _081CFA6A
	.align 2, 0
_081CFA3C: .4byte 0x02024190
_081CFA40: .4byte 0x02021C68
_081CFA44:
	ldrb r0, [r7]
	ldrb r1, [r7, #1]
	bl GetBoxedMonPtr
	adds r4, r0, #0
	bl GetBoxMonGender
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	bl GetLevelFromBoxMonExp
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _081CFAD0
	adds r0, r4, #0
	movs r1, #2
	bl GetBoxMonData
_081CFA6A:
	ldr r4, _081CFAD0
	adds r0, r4, #0
	bl StringGetEnd10
	ldr r0, _081CFAD4
	mov r8, r0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #5
	bl StringCopyPadded
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r5, _081CFAD8
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #3
	bl StringCopyPadded
	ldrh r1, [r7, #2]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	movs r0, #0
	mov r1, r8
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #1
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	movs r0, #2
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	cmp r6, #0xfe
	beq _081CFAE0
	cmp r6, #0xfe
	bgt _081CFAE8
	cmp r6, #0
	bne _081CFAE8
	ldr r1, _081CFADC
	b _081CFAEA
	.align 2, 0
_081CFAD0: .4byte 0x02021C68
_081CFAD4: .4byte 0x02021C40
_081CFAD8: .4byte 0x02021C54
_081CFADC: .4byte 0x085F5DD3
_081CFAE0:
	ldr r1, _081CFAE4
	b _081CFAEA
	.align 2, 0
_081CFAE4: .4byte 0x085F5DEB
_081CFAE8:
	ldr r1, _081CFAFC
_081CFAEA:
	mov r0, sb
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081CFAFC: .4byte 0x085F5E03
	thumb_func_end sub_081CF9F8

