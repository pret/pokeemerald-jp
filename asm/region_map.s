.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitRegionMap
InitRegionMap: @ 0x08122CE8
	push {lr}
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0
	bl sub_08122D04
_08122CF4:
	bl sub_08122DBC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08122CF4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitRegionMap

	thumb_func_start sub_08122D04
sub_08122D04: @ 0x08122D04
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08122D2C
	str r0, [r3]
	movs r1, #0x79
	adds r1, r1, r0
	mov ip, r1
	movs r1, #0
	mov r5, ip
	strb r1, [r5]
	adds r0, #0x78
	strb r2, [r0]
	ldr r1, [r3]
	cmp r2, #1
	bne _08122D34
	ldr r0, _08122D30
	b _08122D36
	.align 2, 0
_08122D2C: .4byte 0x02039E10
_08122D30: .4byte 0x08123261
_08122D34:
	ldr r0, _08122D6C
_08122D36:
	str r0, [r1, #0x18]
	cmp r4, #0
	beq _08122D70
	ldr r1, [r3]
	ldr r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	adds r1, #0x80
	strb r0, [r1]
	ldr r1, [r3]
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r1, #0x81
	strb r0, [r1]
	ldr r1, [r3]
	ldr r0, [r4]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	adds r1, #0x82
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, #0x83
	movs r1, #1
	strb r1, [r0]
	b _08122D8C
	.align 2, 0
_08122D6C: .4byte 0x081230D1
_08122D70:
	ldr r0, [r3]
	adds r0, #0x80
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0x81
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0x82
	movs r1, #0x1c
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0x83
	strb r4, [r0]
_08122D8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08122D04

	thumb_func_start sub_08122D94
sub_08122D94: @ 0x08122D94
	push {r4, lr}
	ldr r4, _08122DB8
	str r0, [r4]
	bl RegionMap_InitializeStateBasedOnPlayerLocation
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x54
	ldrh r1, [r0]
	adds r0, #0x20
	strh r1, [r0]
	subs r0, #0x1e
	ldrh r1, [r0]
	adds r0, #0x20
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122DB8: .4byte 0x02039E10
	thumb_func_end sub_08122D94

	thumb_func_start sub_08122DBC
sub_08122DBC: @ 0x08122DBC
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _08122DD8
	ldr r0, [r0]
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #7
	bls _08122DCE
	b _08123018
_08122DCE:
	lsls r0, r0, #2
	ldr r1, _08122DDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122DD8: .4byte 0x02039E10
_08122DDC: .4byte 0x08122DE0
_08122DE0: @ jump table
	.4byte _08122E00 @ case 0
	.4byte _08122E38 @ case 1
	.4byte _08122E84 @ case 2
	.4byte _08122EA0 @ case 3
	.4byte _08122EBC @ case 4
	.4byte _08122ED8 @ case 5
	.4byte _08122F1C @ case 6
	.4byte _08122F98 @ case 7
_08122E00:
	ldr r0, _08122E1C
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x83
	ldrb r0, [r0]
	cmp r0, #0
	beq _08122E24
	adds r0, r1, #0
	adds r0, #0x80
	ldrb r0, [r0]
	ldr r1, _08122E20
	movs r2, #0
	str r2, [sp]
	b _08122E5E
	.align 2, 0
_08122E1C: .4byte 0x02039E10
_08122E20: .4byte 0x0857B34C
_08122E24:
	ldr r0, _08122E30
	ldr r1, _08122E34
	bl LZ77UnCompVram
	b _08123020
	.align 2, 0
_08122E30: .4byte 0x0857B34C
_08122E34: .4byte 0x06008000
_08122E38:
	ldr r4, _08122E68
	ldr r0, [r4]
	adds r0, #0x83
	ldrb r0, [r0]
	cmp r0, #0
	beq _08122E70
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08122E50
	b _08123020
_08122E50:
	ldr r0, [r4]
	adds r0, #0x80
	ldrb r0, [r0]
	ldr r1, _08122E6C
	movs r2, #1
	str r2, [sp]
	movs r2, #0
_08122E5E:
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _08123020
	.align 2, 0
_08122E68: .4byte 0x02039E10
_08122E6C: .4byte 0x0857C0B0
_08122E70:
	ldr r0, _08122E7C
	ldr r1, _08122E80
	bl LZ77UnCompVram
	b _08123020
	.align 2, 0
_08122E7C: .4byte 0x0857C0B0
_08122E80: .4byte 0x0600E000
_08122E84:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08122E90
	b _08123020
_08122E90:
	ldr r0, _08122E9C
	movs r1, #0x70
	movs r2, #0x60
	bl LoadPalette
	b _08123020
	.align 2, 0
_08122E9C: .4byte 0x0857B30C
_08122EA0:
	ldr r0, _08122EB4
	ldr r1, _08122EB8
	ldr r1, [r1]
	movs r2, #0xc2
	lsls r2, r2, #1
	adds r1, r1, r2
	bl LZ77UnCompWram
	b _08123020
	.align 2, 0
_08122EB4: .4byte 0x0857B1DC
_08122EB8: .4byte 0x02039E10
_08122EBC:
	ldr r0, _08122ED0
	ldr r1, _08122ED4
	ldr r1, [r1]
	movs r5, #0xa1
	lsls r5, r5, #2
	adds r1, r1, r5
	bl LZ77UnCompWram
	b _08123020
	.align 2, 0
_08122ED0: .4byte 0x0857B220
_08122ED4: .4byte 0x02039E10
_08122ED8:
	bl RegionMap_InitializeStateBasedOnPlayerLocation
	ldr r4, _08122F18
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x54
	ldrh r1, [r0]
	adds r0, #0x20
	strh r1, [r0]
	subs r0, #0x1e
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x76
	strh r0, [r1]
	ldrh r0, [r2]
	bl CorrectSpecialMapSecId_Internal
	ldr r1, [r4]
	strh r0, [r1]
	ldrh r0, [r1]
	bl get_flagnr_blue_points
	ldr r1, [r4]
	strb r0, [r1, #2]
	ldr r1, [r4]
	adds r0, r1, #4
	ldrh r1, [r1]
	movs r2, #0xa
	bl GetMapName
	b _08123020
	.align 2, 0
_08122F18: .4byte 0x02039E10
_08122F1C:
	ldr r0, _08122F44
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0x78
	ldrb r1, [r0]
	cmp r1, #0
	bne _08122F48
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CalcZoomScrollParams
	b _08123020
	.align 2, 0
_08122F44: .4byte 0x02039E10
_08122F48:
	adds r1, r4, #0
	adds r1, #0x54
	ldrh r0, [r1]
	lsls r0, r0, #3
	subs r0, #0x34
	adds r2, r4, #0
	adds r2, #0x5c
	movs r3, #0
	strh r0, [r2]
	movs r0, #0x56
	adds r0, r0, r4
	mov ip, r0
	ldrh r0, [r0]
	lsls r0, r0, #3
	subs r0, #0x44
	adds r5, r4, #0
	adds r5, #0x5e
	strh r0, [r5]
	ldrh r1, [r1]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	mov r0, ip
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x66
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r2, #0x80
	str r2, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r2, #0x38
	movs r3, #0x48
	bl CalcZoomScrollParams
	b _08123020
_08122F98:
	bl RegionMap_GetPositionOfCursorWithinMapSection
	bl UpdateRegionMapVideoRegs
	ldr r4, _0812301C
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	adds r0, #0x7a
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x7e
	strb r1, [r0]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x83
	ldrb r0, [r0]
	cmp r0, #0
	beq _0812300E
	adds r0, r1, #0
	adds r0, #0x80
	ldrb r0, [r0]
	movs r1, #3
	movs r2, #2
	bl SetBgAttribute
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x80
	ldrb r0, [r0]
	adds r1, #0x81
	ldrb r2, [r1]
	movs r1, #1
	bl SetBgAttribute
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x80
	ldrb r0, [r0]
	adds r1, #0x82
	ldrb r2, [r1]
	movs r1, #2
	bl SetBgAttribute
	ldr r0, [r4]
	adds r0, #0x80
	ldrb r0, [r0]
	movs r1, #6
	movs r2, #1
	bl SetBgAttribute
	ldr r0, [r4]
	adds r0, #0x80
	ldrb r0, [r0]
	movs r1, #4
	movs r2, #1
	bl SetBgAttribute
_0812300E:
	ldr r1, [r4]
	adds r1, #0x79
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08123018:
	movs r0, #0
	b _0812302E
	.align 2, 0
_0812301C: .4byte 0x02039E10
_08123020:
	ldr r0, _08123038
	ldr r1, [r0]
	adds r1, #0x79
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #1
_0812302E:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08123038: .4byte 0x02039E10
	thumb_func_end sub_08122DBC

	thumb_func_start sub_0812303C
sub_0812303C: @ 0x0812303C
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xe0
	lsls r0, r0, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl BlendPalettes
	ldr r0, _08123060
	ldr r1, _08123064
	movs r2, #0x30
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08123060: .4byte 0x02037894
_08123064: .4byte 0x02037494
	thumb_func_end sub_0812303C

	thumb_func_start FreeRegionMapIconResources
FreeRegionMapIconResources: @ 0x08123068
	push {r4, lr}
	ldr r4, _081230B4
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0812308C
	bl DestroySprite
	ldr r0, [r4]
	adds r0, #0x58
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, #0x5a
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_0812308C:
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _081230AC
	bl DestroySprite
	ldr r0, [r4]
	adds r0, #0x70
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, #0x72
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_081230AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081230B4: .4byte 0x02039E10
	thumb_func_end FreeRegionMapIconResources

	thumb_func_start sub_081230B8
sub_081230B8: @ 0x081230B8
	push {lr}
	ldr r0, _081230CC
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bl _call_via_r0
	thumb_func_end sub_081230B8

	thumb_func_start sub_081230C4
sub_081230C4: @ 0x081230C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081230CC: .4byte 0x02039E10
	thumb_func_end sub_081230C4

	thumb_func_start ProcessRegionMapInput_Full
ProcessRegionMapInput_Full: @ 0x081230D0
	push {r4, lr}
	movs r4, #0
	ldr r2, _0812316C
	ldr r0, [r2]
	adds r0, #0x7b
	strb r4, [r0]
	ldr r0, [r2]
	adds r0, #0x7c
	strb r4, [r0]
	ldr r3, _08123170
	ldrh r1, [r3, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08123102
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x56
	ldrh r0, [r0]
	cmp r0, #2
	bls _08123102
	adds r1, #0x7c
	movs r0, #0xff
	strb r0, [r1]
	movs r4, #1
_08123102:
	ldrh r1, [r3, #0x2c]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08123120
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x56
	ldrh r0, [r0]
	cmp r0, #0xf
	bhi _08123120
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
	movs r4, #1
_08123120:
	ldrh r1, [r3, #0x2c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0812313E
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x54
	ldrh r0, [r0]
	cmp r0, #1
	bls _0812313E
	adds r1, #0x7b
	movs r0, #0xff
	strb r0, [r1]
	movs r4, #1
_0812313E:
	ldrh r1, [r3, #0x2c]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0812315C
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x54
	ldrh r0, [r0]
	cmp r0, #0x1b
	bhi _0812315C
	adds r1, #0x7b
	movs r0, #1
	strb r0, [r1]
	movs r4, #1
_0812315C:
	ldrh r3, [r3, #0x2e]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08123174
	movs r4, #4
	b _0812317E
	.align 2, 0
_0812316C: .4byte 0x02039E10
_08123170: .4byte 0x03002360
_08123174:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0812317E
	movs r4, #5
_0812317E:
	cmp r4, #1
	bne _08123190
	ldr r0, [r2]
	adds r0, #0x7a
	movs r1, #4
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, _08123198
	str r0, [r1, #0x18]
_08123190:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08123198: .4byte 0x0812319D
	thumb_func_end ProcessRegionMapInput_Full

	thumb_func_start MoveRegionMapCursor_Full
MoveRegionMapCursor_Full: @ 0x0812319C
	push {r4, r5, lr}
	ldr r5, _081231B4
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _081231B8
	movs r0, #2
	b _08123254
	.align 2, 0
_081231B4: .4byte 0x02039E10
_081231B8:
	adds r0, r1, #0
	adds r0, #0x7b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _081231CE
	adds r1, #0x54
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_081231CE:
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x7b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _081231E6
	adds r1, #0x54
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_081231E6:
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _081231FE
	adds r1, #0x56
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_081231FE:
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08123216
	adds r1, #0x56
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08123216:
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x54
	ldrh r0, [r0]
	adds r1, #0x56
	ldrh r1, [r1]
	bl GetRegionMapSectionIdAt_Internal
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl get_flagnr_blue_points
	ldr r1, [r5]
	strb r0, [r1, #2]
	ldr r1, [r5]
	ldrh r0, [r1]
	cmp r4, r0
	beq _08123248
	strh r4, [r1]
	adds r0, r1, #4
	ldrh r1, [r1]
	movs r2, #0xa
	bl GetMapName
_08123248:
	bl RegionMap_GetPositionOfCursorWithinMapSection
	ldr r1, [r5]
	ldr r0, _0812325C
	str r0, [r1, #0x18]
	movs r0, #3
_08123254:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812325C: .4byte 0x081230D1
	thumb_func_end MoveRegionMapCursor_Full

	thumb_func_start ProcessRegionMapInput_Zoomed
ProcessRegionMapInput_Zoomed: @ 0x08123260
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r3, _08123330
	ldr r0, [r3]
	mov ip, r0
	adds r0, #0x6a
	strh r4, [r0]
	mov r5, ip
	adds r5, #0x68
	strh r4, [r5]
	ldr r2, _08123334
	ldrh r1, [r2, #0x2c]
	movs r0, #0x40
	ands r0, r1
	adds r6, r3, #0
	adds r3, r2, #0
	cmp r0, #0
	beq _0812329A
	mov r0, ip
	adds r0, #0x5e
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x34
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0812329A
	ldr r0, _08123338
	strh r0, [r5]
	movs r4, #1
_0812329A:
	ldrh r1, [r3, #0x2c]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081232BA
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x5e
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r0, #0x3b
	bgt _081232BA
	adds r1, #0x68
	movs r0, #1
	strh r0, [r1]
	movs r4, #1
_081232BA:
	ldrh r1, [r3, #0x2c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081232E0
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x5c
	movs r5, #0
	ldrsh r1, [r0, r5]
	movs r0, #0x2c
	rsbs r0, r0, #0
	cmp r1, r0
	ble _081232E0
	adds r1, r2, #0
	adds r1, #0x6a
	ldr r0, _08123338
	strh r0, [r1]
	movs r4, #1
_081232E0:
	ldrh r1, [r3, #0x2c]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08123300
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x5c
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0xab
	bgt _08123300
	adds r1, #0x6a
	movs r0, #1
	strh r0, [r1]
	movs r4, #1
_08123300:
	ldrh r2, [r3, #0x2e]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0812330C
	movs r4, #4
_0812330C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08123316
	movs r4, #5
_08123316:
	cmp r4, #1
	bne _08123326
	ldr r0, [r6]
	ldr r1, _0812333C
	str r1, [r0, #0x18]
	adds r0, #0x6c
	movs r1, #0
	strh r1, [r0]
_08123326:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08123330: .4byte 0x02039E10
_08123334: .4byte 0x03002360
_08123338: .4byte 0x0000FFFF
_0812333C: .4byte 0x08123341
	thumb_func_end ProcessRegionMapInput_Zoomed

	thumb_func_start MoveRegionMapCursor_Zoomed
MoveRegionMapCursor_Zoomed: @ 0x08123340
	push {r4, r5, lr}
	ldr r5, _08123414
	ldr r2, [r5]
	adds r3, r2, #0
	adds r3, #0x5e
	adds r0, r2, #0
	adds r0, #0x68
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x5c
	adds r0, r2, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	movs r2, #0
	ldrsh r1, [r3, r2]
	bl RegionMap_SetBG2XAndBG2Y
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x6c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bne _0812341C
	adds r0, r2, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, r1, #0
	adds r0, #0x2c
	cmp r0, #0
	bge _08123398
	adds r0, #7
_08123398:
	asrs r0, r0, #3
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x5e
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r1, #0
	adds r0, #0x34
	cmp r0, #0
	bge _081233B2
	adds r0, #7
_081233B2:
	asrs r0, r0, #3
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r4, r2, #0
	adds r4, #0x64
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r2, [r4]
	cmp r3, r2
	bne _081233CE
	ldrh r2, [r0]
	cmp r1, r2
	beq _081233FE
_081233CE:
	strh r3, [r4]
	strh r1, [r0]
	adds r0, r3, #0
	bl GetRegionMapSectionIdAt_Internal
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl get_flagnr_blue_points
	ldr r1, [r5]
	strb r0, [r1, #2]
	ldr r1, [r5]
	ldrh r3, [r1]
	cmp r4, r3
	beq _081233FA
	strh r4, [r1]
	adds r0, r1, #4
	ldrh r1, [r1]
	movs r2, #0xa
	bl GetMapName
_081233FA:
	bl RegionMap_GetPositionOfCursorWithinMapSection
_081233FE:
	ldr r0, _08123414
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x6c
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08123418
	str r0, [r2, #0x18]
	movs r0, #3
	b _0812341E
	.align 2, 0
_08123414: .4byte 0x02039E10
_08123418: .4byte 0x08123261
_0812341C:
	movs r0, #2
_0812341E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MoveRegionMapCursor_Zoomed

	thumb_func_start sub_08123424
sub_08123424: @ 0x08123424
	push {r4, r5, r6, lr}
	ldr r1, _081234A0
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0x78
	ldrb r3, [r0]
	adds r5, r1, #0
	cmp r3, #0
	bne _081234A8
	subs r0, #0x1a
	strh r3, [r0]
	subs r0, #2
	strh r3, [r0]
	str r3, [r2, #0x40]
	str r3, [r2, #0x3c]
	adds r4, r2, #0
	adds r4, #0x54
	ldrh r0, [r4]
	lsls r0, r0, #3
	subs r0, #0x34
	adds r1, r2, #0
	adds r1, #0x60
	strh r0, [r1]
	movs r0, #0x56
	adds r0, r0, r2
	mov ip, r0
	ldrh r0, [r0]
	lsls r0, r0, #3
	subs r0, #0x44
	adds r3, r2, #0
	adds r3, #0x62
	strh r0, [r3]
	movs r6, #0
	ldrsh r0, [r1, r6]
	lsls r0, r0, #8
	cmp r0, #0
	bge _08123470
	adds r0, #0xf
_08123470:
	asrs r0, r0, #4
	str r0, [r2, #0x44]
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #8
	cmp r0, #0
	bge _08123480
	adds r0, #0xf
_08123480:
	asrs r0, r0, #4
	str r0, [r2, #0x48]
	ldrh r1, [r4]
	adds r0, r2, #0
	adds r0, #0x64
	strh r1, [r0]
	mov r3, ip
	ldrh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #9
	str r0, [r2, #0x4c]
	ldr r0, _081234A4
	b _08123506
	.align 2, 0
_081234A0: .4byte 0x02039E10
_081234A4: .4byte 0xFFFFF800
_081234A8:
	adds r0, r2, #0
	adds r0, #0x5c
	movs r6, #0
	ldrsh r0, [r0, r6]
	lsls r0, r0, #8
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	adds r0, #0x5e
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r2, #0x40]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, [r2, #0x3c]
	cmp r0, #0
	bge _081234D4
	adds r0, #0xf
_081234D4:
	asrs r0, r0, #4
	rsbs r0, r0, #0
	str r0, [r2, #0x44]
	ldr r0, [r2, #0x40]
	cmp r0, #0
	bge _081234E2
	adds r0, #0xf
_081234E2:
	asrs r0, r0, #4
	rsbs r0, r0, #0
	str r0, [r2, #0x48]
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r1, [r0]
	subs r0, #0x10
	strh r1, [r0]
	adds r0, #0x12
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [r2, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #4
_08123506:
	str r0, [r2, #0x50]
	ldr r0, [r5]
	adds r0, #0x6e
	movs r1, #0
	strh r1, [r0]
	bl FreeRegionMapCursorSprite
	bl HideRegionMapPlayerIcon
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08123424

	thumb_func_start sub_08123520
sub_08123520: @ 0x08123520
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _08123538
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x6e
	ldrh r1, [r2]
	adds r5, r0, #0
	cmp r1, #0xf
	bls _0812353C
	movs r0, #0
	b _081236C4
	.align 2, 0
_08123538: .4byte 0x02039E10
_0812353C:
	adds r0, r1, #1
	movs r1, #0
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bne _081235B0
	str r1, [r3, #0x44]
	str r1, [r3, #0x48]
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r1, [r0]
	subs r0, #4
	strh r1, [r0]
	adds r0, #6
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5e
	strh r0, [r1]
	adds r1, #0x1a
	ldrb r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #9
	cmp r0, #0
	bne _08123572
	movs r2, #0x80
	lsls r2, r2, #8
_08123572:
	str r2, [r3, #0x4c]
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0812357E
	movs r2, #1
_0812357E:
	strb r2, [r1]
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x78
	ldrb r0, [r0]
	ldr r2, _081235A8
	cmp r0, #0
	bne _08123590
	ldr r2, _081235AC
_08123590:
	str r2, [r1, #0x18]
	adds r0, r1, #0
	adds r0, #0x58
	ldrh r0, [r0]
	adds r1, #0x5a
	ldrh r1, [r1]
	bl CreateRegionMapCursor
	bl UnhideRegionMapPlayerIcon
	movs r4, #0
	b _08123692
	.align 2, 0
_081235A8: .4byte 0x08123261
_081235AC: .4byte 0x081230D1
_081235B0:
	ldr r2, [r3, #0x3c]
	ldr r0, [r3, #0x44]
	adds r2, r2, r0
	str r2, [r3, #0x3c]
	ldr r0, [r3, #0x40]
	ldr r1, [r3, #0x48]
	adds r0, r0, r1
	str r0, [r3, #0x40]
	asrs r2, r2, #8
	adds r4, r3, #0
	adds r4, #0x5c
	strh r2, [r4]
	ldr r0, [r3, #0x40]
	asrs r0, r0, #8
	adds r1, r3, #0
	adds r1, #0x5e
	strh r0, [r1]
	ldr r0, [r3, #0x4c]
	ldr r1, [r3, #0x50]
	adds r0, r0, r1
	str r0, [r3, #0x4c]
	ldr r2, [r3, #0x44]
	cmp r2, #0
	bge _081235F0
	adds r0, r3, #0
	adds r0, #0x60
	movs r6, #0
	ldrsh r1, [r4, r6]
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	blt _08123604
_081235F0:
	cmp r2, #0
	ble _08123614
	adds r0, r3, #0
	adds r0, #0x60
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	ble _08123614
_08123604:
	ldr r3, [r5]
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r2, [r0]
	subs r0, #4
	movs r1, #0
	strh r2, [r0]
	str r1, [r3, #0x44]
_08123614:
	ldr r2, [r5]
	ldr r4, [r2, #0x48]
	cmp r4, #0
	bge _08123630
	adds r0, r2, #0
	adds r0, #0x5e
	adds r3, r2, #0
	adds r3, #0x62
	movs r6, #0
	ldrsh r1, [r0, r6]
	movs r6, #0
	ldrsh r0, [r3, r6]
	cmp r1, r0
	blt _08123648
_08123630:
	cmp r4, #0
	ble _0812365A
	adds r1, r2, #0
	adds r1, #0x5e
	adds r0, r2, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	ble _0812365A
_08123648:
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r3, r2, #0
	adds r3, #0x5e
	movs r0, #0
	strh r1, [r3]
	str r0, [r2, #0x48]
_0812365A:
	ldr r0, _08123678
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x78
	ldrb r3, [r0]
	cmp r3, #0
	bne _08123680
	ldr r1, [r2, #0x4c]
	ldr r0, _0812367C
	cmp r1, r0
	bgt _08123690
	adds r0, #1
	str r0, [r2, #0x4c]
	str r3, [r2, #0x50]
	b _08123690
	.align 2, 0
_08123678: .4byte 0x02039E10
_0812367C: .4byte 0x00007FFF
_08123680:
	ldr r0, [r2, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	ble _08123690
	str r1, [r2, #0x4c]
	movs r0, #0
	str r0, [r2, #0x50]
_08123690:
	movs r4, #1
_08123692:
	ldr r0, _081236CC
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r2, [r3, #0x4c]
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	str r2, [sp]
	ldr r2, [r3, #0x4c]
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #0x38
	movs r3, #0x48
	bl CalcZoomScrollParams
	adds r0, r4, #0
_081236C4:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081236CC: .4byte 0x02039E10
	thumb_func_end sub_08123520

	thumb_func_start CalcZoomScrollParams
CalcZoomScrollParams: @ 0x081236D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	ldr r7, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	lsls r7, r7, #0x10
	adds r4, r7, #0
	lsrs r4, r4, #0x10
	mov sb, r4
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r4, _08123790
	ldr r6, [r4]
	ldr r7, _08123794
	mov ip, r7
	adds r4, r5, #0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, ip
	movs r7, #0
	ldrsh r4, [r4, r7]
	str r4, [sp]
	mov r7, r8
	muls r7, r4, r7
	adds r4, r7, #0
	asrs r4, r4, #8
	mov sl, r4
	str r4, [r6, #0x2c]
	lsls r5, r5, #1
	add r5, ip
	movs r7, #0
	ldrsh r5, [r5, r7]
	rsbs r4, r5, #0
	mov r7, r8
	muls r7, r4, r7
	adds r4, r7, #0
	asrs r4, r4, #8
	mov ip, r4
	str r4, [r6, #0x30]
	mov r7, sb
	muls r7, r5, r7
	adds r5, r7, #0
	asrs r5, r5, #8
	str r5, [r6, #0x34]
	ldr r7, [sp]
	mov r4, sb
	muls r4, r7, r4
	asrs r4, r4, #8
	mov r8, r4
	str r4, [r6, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r4, r2, #8
	adds r0, r0, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r4, r3, #0
	muls r4, r5, r4
	mov r5, sl
	muls r5, r2, r5
	adds r4, r4, r5
	subs r0, r0, r4
	str r0, [r6, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r3, #8
	adds r1, r1, r0
	mov r0, r8
	muls r0, r3, r0
	mov r3, ip
	muls r3, r2, r3
	adds r2, r3, #0
	adds r0, r0, r2
	subs r1, r1, r0
	str r1, [r6, #0x28]
	adds r6, #0x7d
	movs r0, #1
	strb r0, [r6]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123790: .4byte 0x02039E10
_08123794: .4byte 0x082FA8CC
	thumb_func_end CalcZoomScrollParams

	thumb_func_start RegionMap_SetBG2XAndBG2Y
RegionMap_SetBG2XAndBG2Y: @ 0x08123798
	ldr r2, _081237BC
	ldr r2, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #8
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r0, r0, r3
	str r0, [r2, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	movs r0, #0x90
	lsls r0, r0, #6
	adds r1, r1, r0
	str r1, [r2, #0x28]
	adds r2, #0x7d
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_081237BC: .4byte 0x02039E10
	thumb_func_end RegionMap_SetBG2XAndBG2Y

	thumb_func_start UpdateRegionMapVideoRegs
UpdateRegionMapVideoRegs: @ 0x081237C0
	push {r4, lr}
	ldr r4, _0812382C
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08123826
	ldrh r1, [r1, #0x2c]
	movs r0, #0x20
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x34]
	movs r0, #0x22
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x30]
	movs r0, #0x24
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x38]
	movs r0, #0x26
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x24]
	movs r0, #0x28
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x26]
	movs r0, #0x2a
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x28]
	movs r0, #0x2c
	bl SetGpuReg
	ldr r0, [r4]
	ldrh r1, [r0, #0x2a]
	movs r0, #0x2e
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, #0x7d
	movs r1, #0
	strb r1, [r0]
_08123826:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812382C: .4byte 0x02039E10
	thumb_func_end UpdateRegionMapVideoRegs

	thumb_func_start PokedexAreaScreen_UpdateRegionMapVariablesAndVideoRegs
PokedexAreaScreen_UpdateRegionMapVariablesAndVideoRegs: @ 0x08123830
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x38
	movs r3, #0x48
	bl CalcZoomScrollParams
	bl UpdateRegionMapVideoRegs
	ldr r0, _08123874
	ldr r2, [r0]
	ldr r1, [r2, #0x20]
	cmp r1, #0
	beq _0812386C
	rsbs r0, r4, #0
	strh r0, [r1, #0x24]
	ldr r1, [r2, #0x20]
	rsbs r0, r5, #0
	strh r0, [r1, #0x26]
_0812386C:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123874: .4byte 0x02039E10
	thumb_func_end PokedexAreaScreen_UpdateRegionMapVariablesAndVideoRegs

	thumb_func_start GetRegionMapSectionIdAt_Internal
GetRegionMapSectionIdAt_Internal: @ 0x08123878
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	ldr r0, _08123898
	adds r1, r1, r0
	lsrs r2, r1, #0x10
	cmp r2, #0xe
	bhi _08123892
	cmp r3, #0
	beq _08123892
	cmp r3, #0x1c
	bls _0812389C
_08123892:
	movs r0, #0xd5
	b _081238B0
	.align 2, 0
_08123898: .4byte 0xFFFE0000
_0812389C:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _081238B4
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r0, r0, r1
	ldrb r0, [r0]
_081238B0:
	pop {r1}
	bx r1
	.align 2, 0
_081238B4: .4byte 0x0857C53C
	thumb_func_end GetRegionMapSectionIdAt_Internal

	thumb_func_start RegionMap_InitializeStateBasedOnPlayerLocation
RegionMap_InitializeStateBasedOnPlayerLocation: @ 0x081238B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _081238E4
	ldr r2, [r0]
	movs r1, #4
	ldrsb r1, [r2, r1]
	adds r3, r0, #0
	cmp r1, #0x19
	bne _081238E8
	ldrb r0, [r2, #5]
	subs r0, #0x29
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _081238E8
	bl RegionMap_InitializeStateBasedOnSSTidalLocation
	b _08123BF8
	.align 2, 0
_081238E4: .4byte 0x03005AEC
_081238E8:
	ldr r1, [r3]
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapTypeByGroupAndId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #8
	bhi _08123934
	lsls r0, r0, #2
	ldr r1, _0812390C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812390C: .4byte 0x08123910
_08123910: @ jump table
	.4byte _08123934 @ case 0
	.4byte _08123934 @ case 1
	.4byte _08123934 @ case 2
	.4byte _08123978 @ case 3
	.4byte _08123934 @ case 4
	.4byte _08123934 @ case 5
	.4byte _08123978 @ case 6
	.4byte _08123A34 @ case 7
	.4byte _081239F0 @ case 8
_08123934:
	ldr r4, _0812396C
	ldr r0, [r4]
	ldr r3, _08123970
	ldrb r1, [r3, #0x14]
	movs r2, #0
	strh r1, [r0]
	adds r0, #0x7f
	strb r2, [r0]
	ldr r0, [r3]
	ldrh r2, [r0]
	ldrh r0, [r0, #4]
	mov sb, r0
	ldr r0, _08123974
	ldr r0, [r0]
	ldrh r6, [r0]
	ldrh r3, [r0, #2]
	ldr r1, [r4]
	ldrh r0, [r1]
	cmp r0, #0x45
	beq _08123962
	cmp r0, #0xcc
	beq _08123962
	b _08123ACA
_08123962:
	adds r1, #0x7f
	movs r0, #1
	strb r0, [r1]
	b _08123ACA
	.align 2, 0
_0812396C: .4byte 0x02039E10
_08123970: .4byte 0x02036FB8
_08123974: .4byte 0x03005AEC
_08123978:
	ldr r2, _081239C8
	ldrb r1, [r2, #0x1a]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081239D4
	ldr r4, _081239CC
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, #0x25
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	adds r5, r0, #0
	ldr r0, _081239D0
	ldr r0, [r0]
	ldrb r1, [r5, #0x14]
	strh r1, [r0]
	adds r0, #0x7f
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	ldrh r2, [r0]
	ldrh r0, [r0, #4]
	mov sb, r0
	ldr r0, [r4]
	ldrh r6, [r0, #0x28]
	ldrh r3, [r0, #0x2a]
	b _08123ACA
	.align 2, 0
_081239C8: .4byte 0x02036FB8
_081239CC: .4byte 0x03005AEC
_081239D0: .4byte 0x02039E10
_081239D4:
	ldr r0, _081239EC
	ldr r0, [r0]
	ldrb r1, [r2, #0x14]
	strh r1, [r0]
	adds r0, #0x7f
	movs r1, #1
	strb r1, [r0]
	movs r2, #1
	mov sb, r2
	movs r6, #1
	movs r3, #1
	b _08123ACA
	.align 2, 0
_081239EC: .4byte 0x02039E10
_081239F0:
	ldr r4, _08123A2C
	ldr r1, [r4]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	adds r5, r0, #0
	ldr r0, _08123A30
	ldr r0, [r0]
	ldrb r1, [r5, #0x14]
	strh r1, [r0]
	adds r0, #0x7f
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	ldrh r2, [r0]
	ldrh r0, [r0, #4]
	mov sb, r0
	ldr r0, [r4]
	ldrh r6, [r0, #0x18]
	ldrh r3, [r0, #0x1a]
	b _08123ACA
	.align 2, 0
_08123A2C: .4byte 0x03005AEC
_08123A30: .4byte 0x02039E10
_08123A34:
	ldr r4, _08123A64
	ldr r0, [r4]
	ldr r1, _08123A68
	ldrb r1, [r1, #0x14]
	strh r1, [r0]
	cmp r1, #0x57
	beq _08123A70
	ldr r0, _08123A6C
	ldr r0, [r0]
	adds r7, r0, #0
	adds r7, #0x24
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ldrsb r1, [r7, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	adds r5, r0, #0
	b _08123A96
	.align 2, 0
_08123A64: .4byte 0x02039E10
_08123A68: .4byte 0x02036FB8
_08123A6C: .4byte 0x03005AEC
_08123A70:
	ldr r0, _08123AB0
	ldr r0, [r0]
	adds r7, r0, #0
	adds r7, #0x14
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ldrsb r1, [r7, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	adds r5, r0, #0
	ldr r1, [r4]
	ldrb r0, [r5, #0x14]
	strh r0, [r1]
_08123A96:
	ldr r4, _08123AB4
	ldr r0, [r4]
	ldrb r0, [r0]
	bl RegionMap_IsPlayerInCave
	adds r1, r0, #0
	cmp r1, #0
	beq _08123AB8
	ldr r0, [r4]
	adds r0, #0x7f
	movs r1, #1
	b _08123ABC
	.align 2, 0
_08123AB0: .4byte 0x03005AEC
_08123AB4: .4byte 0x02039E10
_08123AB8:
	ldr r0, [r4]
	adds r0, #0x7f
_08123ABC:
	strb r1, [r0]
	ldr r0, [r5]
	ldrh r2, [r0]
	ldrh r0, [r0, #4]
	mov sb, r0
	ldrh r6, [r7, #4]
	ldrh r3, [r7, #6]
_08123ACA:
	str r6, [sp]
	ldr r5, _08123B50
	ldr r4, _08123B54
	ldr r0, [r4]
	mov sl, r0
	ldrh r7, [r0]
	lsls r0, r7, #3
	adds r0, r0, r5
	str r0, [sp, #4]
	ldrb r0, [r0, #2]
	mov r8, r0
	adds r0, r2, #0
	mov r1, r8
	str r3, [sp, #8]
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, [sp, #8]
	cmp r1, #0
	bne _08123AF6
	movs r1, #1
_08123AF6:
	adds r0, r6, #0
	str r3, [sp, #8]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r3, [sp, #8]
	cmp r6, r8
	blo _08123B10
	mov r0, r8
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08123B10:
	ldr r2, [sp, #4]
	ldrb r4, [r2, #3]
	mov r0, sb
	adds r1, r4, #0
	str r3, [sp, #8]
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, [sp, #8]
	cmp r1, #0
	bne _08123B2A
	movs r1, #1
_08123B2A:
	adds r0, r3, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blo _08123B3E
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08123B3E:
	cmp r7, #0x29
	beq _08123B6A
	cmp r7, #0x29
	bgt _08123B58
	cmp r7, #0x1d
	beq _08123B62
	cmp r7, #0x24
	beq _08123BA0
	b _08123BD2
	.align 2, 0
_08123B50: .4byte 0x0857CD6C
_08123B54: .4byte 0x02039E10
_08123B58:
	cmp r7, #0x33
	beq _08123B6A
	cmp r7, #0xcc
	beq _08123BC4
	b _08123BD2
_08123B62:
	cmp r3, #0
	beq _08123BD2
	movs r6, #0
	b _08123BD2
_08123B6A:
	movs r6, #0
	ldr r0, _08123B9C
	ldr r1, [r0]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x20
	ble _08123B7A
	movs r6, #1
_08123B7A:
	cmp r0, #0x33
	ble _08123B84
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08123B84:
	movs r3, #0
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r0, #0x25
	ble _08123B90
	movs r3, #1
_08123B90:
	cmp r0, #0x38
	ble _08123BD2
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _08123BD2
	.align 2, 0
_08123B9C: .4byte 0x03005AEC
_08123BA0:
	movs r6, #0
	ldr r0, [sp]
	cmp r0, #0xe
	bls _08123BAA
	movs r6, #1
_08123BAA:
	ldr r2, [sp]
	cmp r2, #0x1c
	bls _08123BB6
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08123BB6:
	ldr r0, [sp]
	cmp r0, #0x36
	bls _08123BD2
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _08123BD2
_08123BC4:
	mov r0, sl
	adds r0, #0x54
	mov r1, sl
	adds r1, #0x56
	bl RegionMap_GetMarineCaveCoords
	b _08123BF8
_08123BD2:
	ldr r0, _08123C08
	ldr r2, [r0]
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0]
	adds r0, r6, r0
	adds r0, #1
	adds r1, r2, #0
	adds r1, #0x54
	strh r0, [r1]
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #1]
	adds r0, r3, r0
	adds r0, #2
	adds r2, #0x56
	strh r0, [r2]
_08123BF8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123C08: .4byte 0x02039E10
	thumb_func_end RegionMap_InitializeStateBasedOnPlayerLocation

	thumb_func_start RegionMap_InitializeStateBasedOnSSTidalLocation
RegionMap_InitializeStateBasedOnSSTidalLocation: @ 0x08123C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r7, #0
	movs r0, #0
	mov r8, r0
	mov r4, sp
	adds r4, #1
	mov r5, sp
	adds r5, #2
	add r6, sp, #4
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl GetSSTidalLocation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r5
	cmp r0, #4
	bhi _08123CA0
	lsls r0, r0, #2
	ldr r1, _08123C48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08123C48: .4byte 0x08123C4C
_08123C4C: @ jump table
	.4byte _08123CA0 @ case 0
	.4byte _08123C60 @ case 1
	.4byte _08123C70 @ case 2
	.4byte _08123C80 @ case 3
	.4byte _08123C90 @ case 4
_08123C60:
	ldr r2, _08123C6C
	ldr r1, [r2]
	movs r0, #8
	strh r0, [r1]
	b _08123D1C
	.align 2, 0
_08123C6C: .4byte 0x02039E10
_08123C70:
	ldr r2, _08123C7C
	ldr r1, [r2]
	movs r0, #0xc
	strh r0, [r1]
	b _08123D1C
	.align 2, 0
_08123C7C: .4byte 0x02039E10
_08123C80:
	ldr r2, _08123C8C
	ldr r1, [r2]
	movs r0, #0x27
	strh r0, [r1]
	b _08123D1C
	.align 2, 0
_08123C8C: .4byte 0x02039E10
_08123C90:
	ldr r2, _08123C9C
	ldr r1, [r2]
	movs r0, #0x2e
	strh r0, [r1]
	b _08123D1C
	.align 2, 0
_08123C9C: .4byte 0x02039E10
_08123CA0:
	mov r0, sp
	ldrb r0, [r0]
	ldrb r1, [r4]
	bl Overworld_GetMapHeaderByGroupAndId
	ldr r1, _08123D5C
	mov sb, r1
	ldr r2, [r1]
	ldrb r1, [r0, #0x14]
	strh r1, [r2]
	ldr r6, [r0]
	ldr r1, _08123D60
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrb r4, [r5, #2]
	ldr r0, [r6]
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08123CD2
	movs r1, #1
_08123CD2:
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r8, r4
	blo _08123CEE
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08123CEE:
	ldrb r4, [r5, #3]
	ldr r0, [r6, #4]
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08123D02
	movs r1, #1
_08123D02:
	mov r2, sp
	movs r3, #4
	ldrsh r0, [r2, r3]
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r2, sb
	cmp r7, r4
	blo _08123D1C
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08123D1C:
	ldr r0, [r2]
	adds r0, #0x7f
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r2]
	ldr r3, _08123D60
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0]
	add r0, r8
	adds r0, #1
	adds r1, r2, #0
	adds r1, #0x54
	strh r0, [r1]
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	adds r0, r7, r0
	adds r0, #2
	adds r2, #0x56
	strh r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123D5C: .4byte 0x02039E10
_08123D60: .4byte 0x0857CD6C
	thumb_func_end RegionMap_InitializeStateBasedOnSSTidalLocation

	thumb_func_start get_flagnr_blue_points
get_flagnr_blue_points: @ 0x08123D64
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, #9
	beq _08123E24
	cmp r0, #9
	bgt _08123DA6
	cmp r0, #4
	beq _08123DFC
	cmp r0, #4
	bgt _08123D94
	cmp r0, #1
	beq _08123DE4
	cmp r0, #1
	bgt _08123D8A
	cmp r0, #0
	beq _08123DDC
	b _08123EA0
_08123D8A:
	cmp r0, #2
	beq _08123DEA
	cmp r0, #3
	beq _08123DF4
	b _08123EA0
_08123D94:
	cmp r0, #6
	beq _08123E0C
	cmp r0, #6
	blt _08123E04
	cmp r0, #7
	beq _08123E14
	cmp r0, #8
	beq _08123E1C
	b _08123EA0
_08123DA6:
	cmp r0, #0xe
	beq _08123E4C
	cmp r0, #0xe
	bgt _08123DC0
	cmp r0, #0xb
	beq _08123E34
	cmp r0, #0xb
	blt _08123E2C
	cmp r0, #0xc
	beq _08123E3C
	cmp r0, #0xd
	beq _08123E44
	b _08123EA0
_08123DC0:
	cmp r0, #0x3a
	beq _08123E6C
	cmp r0, #0x3a
	bgt _08123DCE
	cmp r0, #0xf
	beq _08123E54
	b _08123EA0
_08123DCE:
	cmp r1, #0x49
	beq _08123E88
	cmp r1, #0xd5
	beq _08123DD8
	b _08123EA0
_08123DD8:
	movs r0, #0
	b _08123EA2
_08123DDC:
	ldr r0, _08123DE0
	b _08123E56
	.align 2, 0
_08123DE0: .4byte 0x0000086F
_08123DE4:
	movs r0, #0x87
	lsls r0, r0, #4
	b _08123E56
_08123DEA:
	ldr r0, _08123DF0
	b _08123E56
	.align 2, 0
_08123DF0: .4byte 0x00000871
_08123DF4:
	ldr r0, _08123DF8
	b _08123E56
	.align 2, 0
_08123DF8: .4byte 0x00000872
_08123DFC:
	ldr r0, _08123E00
	b _08123E56
	.align 2, 0
_08123E00: .4byte 0x00000873
_08123E04:
	ldr r0, _08123E08
	b _08123E56
	.align 2, 0
_08123E08: .4byte 0x00000874
_08123E0C:
	ldr r0, _08123E10
	b _08123E56
	.align 2, 0
_08123E10: .4byte 0x00000875
_08123E14:
	ldr r0, _08123E18
	b _08123E56
	.align 2, 0
_08123E18: .4byte 0x00000876
_08123E1C:
	ldr r0, _08123E20
	b _08123E56
	.align 2, 0
_08123E20: .4byte 0x00000877
_08123E24:
	ldr r0, _08123E28
	b _08123E56
	.align 2, 0
_08123E28: .4byte 0x00000878
_08123E2C:
	ldr r0, _08123E30
	b _08123E56
	.align 2, 0
_08123E30: .4byte 0x00000879
_08123E34:
	ldr r0, _08123E38
	b _08123E56
	.align 2, 0
_08123E38: .4byte 0x0000087A
_08123E3C:
	ldr r0, _08123E40
	b _08123E56
	.align 2, 0
_08123E40: .4byte 0x0000087B
_08123E44:
	ldr r0, _08123E48
	b _08123E56
	.align 2, 0
_08123E48: .4byte 0x0000087C
_08123E4C:
	ldr r0, _08123E50
	b _08123E56
	.align 2, 0
_08123E50: .4byte 0x0000087D
_08123E54:
	ldr r0, _08123E68
_08123E56:
	bl FlagGet
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq _08123E64
	movs r1, #2
_08123E64:
	adds r0, r1, #0
	b _08123EA2
	.align 2, 0
_08123E68: .4byte 0x0000087E
_08123E6C:
	ldr r0, _08123E84
	bl FlagGet
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	movs r1, #4
	ands r0, r1
	b _08123EA2
	.align 2, 0
_08123E84: .4byte 0x000008A8
_08123E88:
	ldr r0, _08123E9C
	bl FlagGet
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _08123EA2
	.align 2, 0
_08123E9C: .4byte 0x000008A9
_08123EA0:
	movs r0, #1
_08123EA2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end get_flagnr_blue_points

	thumb_func_start GetRegionMapSectionIdAt
GetRegionMapSectionIdAt: @ 0x08123EA8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl GetRegionMapSectionIdAt_Internal
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetRegionMapSectionIdAt

	thumb_func_start CorrectSpecialMapSecId_Internal
CorrectSpecialMapSecId_Internal: @ 0x08123EC0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r1, _08123EDC
_08123ECA:
	ldrh r0, [r1]
	cmp r0, r3
	bne _08123EE0
	bl RegionMap_GetTerraCaveMapSecId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08123F0C
	.align 2, 0
_08123EDC: .4byte 0x0857D474
_08123EE0:
	adds r1, #2
	adds r2, #1
	cmp r2, #2
	bls _08123ECA
	ldr r1, _08123EFC
	ldrh r0, [r1]
	cmp r0, #0xd5
	beq _08123F0A
	adds r2, r1, #0
_08123EF2:
	ldrh r0, [r2]
	cmp r0, r3
	bne _08123F00
	ldrh r0, [r1, #2]
	b _08123F0C
	.align 2, 0
_08123EFC: .4byte 0x0857D414
_08123F00:
	adds r1, #4
	adds r2, #4
	ldrh r0, [r1]
	cmp r0, #0xd5
	bne _08123EF2
_08123F0A:
	adds r0, r3, #0
_08123F0C:
	pop {r1}
	bx r1
	thumb_func_end CorrectSpecialMapSecId_Internal

	thumb_func_start RegionMap_GetTerraCaveMapSecId
RegionMap_GetTerraCaveMapSecId: @ 0x08123F10
	push {lr}
	ldr r0, _08123F34
	bl VarGet
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xf
	bls _08123F24
	movs r1, #0
_08123F24:
	ldr r0, _08123F38
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_08123F34: .4byte 0x00004037
_08123F38: .4byte 0x0857D47A
	thumb_func_end RegionMap_GetTerraCaveMapSecId

	thumb_func_start RegionMap_GetMarineCaveCoords
RegionMap_GetMarineCaveCoords: @ 0x08123F3C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08123F74
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _08123F78
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #7
	bls _08123F58
	movs r1, #9
_08123F58:
	subs r1, #9
	lsls r1, r1, #0x10
	ldr r0, _08123F7C
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r1, #2]
	adds r0, #2
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08123F74: .4byte 0x00004037
_08123F78: .4byte 0xFFF70000
_08123F7C: .4byte 0x0857D49C
	thumb_func_end RegionMap_GetMarineCaveCoords

	thumb_func_start RegionMap_IsPlayerInCave
RegionMap_IsPlayerInCave: @ 0x08123F80
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _08123F98
_08123F8A:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08123F9C
	movs r0, #1
	b _08123FA4
	.align 2, 0
_08123F98: .4byte 0x0857D4BC
_08123F9C:
	adds r1, #1
	cmp r1, #0
	beq _08123F8A
	movs r0, #0
_08123FA4:
	pop {r1}
	bx r1
	thumb_func_end RegionMap_IsPlayerInCave

	thumb_func_start CorrectSpecialMapSecId
CorrectSpecialMapSecId: @ 0x08123FA8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CorrectSpecialMapSecId_Internal
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CorrectSpecialMapSecId

	thumb_func_start RegionMap_GetPositionOfCursorWithinMapSection
RegionMap_GetPositionOfCursorWithinMapSection: @ 0x08123FBC
	push {r4, r5, r6, lr}
	ldr r0, _08123FD0
	ldr r1, [r0]
	ldrh r0, [r1]
	cmp r0, #0xd5
	bne _08123FD4
	movs r0, #0
	strb r0, [r1, #3]
	b _0812403A
	.align 2, 0
_08123FD0: .4byte 0x02039E10
_08123FD4:
	adds r0, r1, #0
	adds r0, #0x78
	ldrb r0, [r0]
	cmp r0, #0
	bne _08123FE4
	adds r0, r1, #0
	adds r0, #0x54
	b _08123FE8
_08123FE4:
	adds r0, r1, #0
	adds r0, #0x64
_08123FE8:
	ldrh r4, [r0]
	adds r0, #2
	ldrh r5, [r0]
	movs r6, #0
	b _08124014
_08123FF2:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetRegionMapSectionIdAt_Internal
	ldr r1, _08124030
	ldr r1, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bne _08124014
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08124014:
	cmp r4, #1
	bhi _08123FF2
	adds r0, r5, #0
	bl RegionMap_IsMapSecIdInNextRow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08124034
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #0x1d
	b _08124014
	.align 2, 0
_08124030: .4byte 0x02039E10
_08124034:
	ldr r0, _08124040
	ldr r0, [r0]
	strb r6, [r0, #3]
_0812403A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08124040: .4byte 0x02039E10
	thumb_func_end RegionMap_GetPositionOfCursorWithinMapSection

	thumb_func_start RegionMap_IsMapSecIdInNextRow
RegionMap_IsMapSecIdInNextRow: @ 0x08124044
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	ldr r1, _08124058
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	ldr r0, _0812405C
	cmp r5, r0
	bne _08124064
	b _08124086
	.align 2, 0
_08124058: .4byte 0xFFFF0000
_0812405C: .4byte 0x0000FFFF
_08124060:
	movs r0, #1
	b _08124088
_08124064:
	movs r4, #1
_08124066:
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetRegionMapSectionIdAt_Internal
	ldr r1, _08124090
	ldr r1, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	beq _08124060
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1c
	bls _08124066
_08124086:
	movs r0, #0
_08124088:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08124090: .4byte 0x02039E10
	thumb_func_end RegionMap_IsMapSecIdInNextRow

	thumb_func_start SpriteCallback_CursorFull
SpriteCallback_CursorFull: @ 0x08124094
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _081240D8
	ldr r1, [r0]
	adds r3, r1, #0
	adds r3, #0x7a
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _081240D2
	adds r0, r1, #0
	adds r0, #0x7b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldrh r4, [r2, #0x20]
	adds r0, r0, r4
	strh r0, [r2, #0x20]
	adds r0, r1, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldrh r1, [r2, #0x22]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
_081240D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081240D8: .4byte 0x02039E10
	thumb_func_end SpriteCallback_CursorFull

	thumb_func_start SpriteCallback_CursorZoomed
SpriteCallback_CursorZoomed: @ 0x081240DC
	bx lr
	.align 2, 0
	thumb_func_end SpriteCallback_CursorZoomed

	thumb_func_start CreateRegionMapCursor
CreateRegionMapCursor: @ 0x081240E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r1, _08124150
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [sp, #0x20]
	str r2, [sp, #0x24]
	mov r2, sp
	ldr r1, _08124154
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	lsrs r3, r0, #0x10
	add r2, sp, #0x18
	ldrh r1, [r2, #4]
	orrs r1, r0
	str r1, [r2, #4]
	mov r0, sp
	strh r3, [r0]
	ldr r0, _08124158
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0x58
	strh r3, [r0]
	ldr r5, _0812415C
	add r1, sp, #0x20
	ldr r0, [r1, #4]
	ands r0, r5
	orrs r0, r6
	str r0, [r1, #4]
	mov r0, sp
	strh r6, [r0, #2]
	adds r3, r4, #0
	adds r0, r3, #0
	adds r0, #0x5a
	strh r6, [r0]
	adds r0, #0x1e
	ldrb r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	bne _08124164
	movs r1, #0xc2
	lsls r1, r1, #1
	adds r0, r3, r1
	str r0, [sp, #0x18]
	ldr r0, [r2, #4]
	ands r0, r5
	subs r1, #0x84
	orrs r0, r1
	str r0, [r2, #4]
	ldr r0, _08124160
	b _0812417A
	.align 2, 0
_08124150: .4byte 0x0857D4F0
_08124154: .4byte 0x0857D4F8
_08124158: .4byte 0x02039E10
_0812415C: .4byte 0xFFFF0000
_08124160: .4byte 0x08124095
_08124164:
	movs r3, #0xa1
	lsls r3, r3, #2
	adds r0, r4, r3
	str r0, [sp, #0x18]
	ldr r0, [r2, #4]
	ands r0, r5
	movs r1, #0xc0
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #4]
	ldr r0, _081241DC
_0812417A:
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl LoadSpriteSheet
	adds r0, r7, #0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, #0x38
	movs r2, #0x48
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _08124234
	ldr r4, _081241E0
	ldr r2, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081241E4
	adds r3, r0, r1
	str r3, [r2, #0x1c]
	adds r2, #0x78
	ldrb r0, [r2]
	cmp r0, #1
	bne _081241E8
	ldrb r1, [r3, #3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #3]
	ldr r2, [r4]
	ldr r1, [r2, #0x1c]
	ldrh r0, [r1, #0x20]
	subs r0, #8
	strh r0, [r1, #0x20]
	ldr r1, [r2, #0x1c]
	ldrh r0, [r1, #0x22]
	subs r0, #8
	strh r0, [r1, #0x22]
	ldr r0, [r2, #0x1c]
	movs r1, #1
	bl StartSpriteAnim
	b _08124210
	.align 2, 0
_081241DC: .4byte 0x081240DD
_081241E0: .4byte 0x02039E10
_081241E4: .4byte 0x020205AC
_081241E8:
	ldrb r1, [r3, #3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3, #3]
	ldr r1, [r4]
	ldr r2, [r1, #0x1c]
	adds r0, r1, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r0, #4
	strh r0, [r2, #0x20]
	ldr r2, [r1, #0x1c]
	adds r1, #0x56
	ldrh r0, [r1]
	lsls r0, r0, #3
	adds r0, #4
	strh r0, [r2, #0x22]
_08124210:
	ldr r4, _0812423C
	ldr r0, [r4]
	ldr r1, [r0, #0x1c]
	movs r0, #2
	strh r0, [r1, #0x30]
	adds r0, r6, #0
	bl IndexOfSpritePaletteTag
	ldr r1, [r4]
	ldr r2, [r1, #0x1c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	ldr r4, _08124240
	adds r0, r0, r4
	strh r0, [r2, #0x32]
	ldr r1, [r1, #0x1c]
	movs r0, #1
	strh r0, [r1, #0x34]
_08124234:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812423C: .4byte 0x02039E10
_08124240: .4byte 0x00000101
	thumb_func_end CreateRegionMapCursor

	thumb_func_start FreeRegionMapCursorSprite
FreeRegionMapCursorSprite: @ 0x08124244
	push {r4, lr}
	ldr r4, _08124270
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _08124268
	bl DestroySprite
	ldr r0, [r4]
	adds r0, #0x58
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, #0x5a
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_08124268:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124270: .4byte 0x02039E10
	thumb_func_end FreeRegionMapCursorSprite

	thumb_func_start sub_08124274
sub_08124274: @ 0x08124274
	ldr r0, _08124280
	ldr r0, [r0]
	ldr r1, [r0, #0x1c]
	movs r0, #1
	strh r0, [r1, #0x34]
	bx lr
	.align 2, 0
_08124280: .4byte 0x02039E10
	thumb_func_end sub_08124274

	thumb_func_start sub_08124284
sub_08124284: @ 0x08124284
	ldr r0, _08124290
	ldr r0, [r0]
	ldr r1, [r0, #0x1c]
	movs r0, #0
	strh r0, [r1, #0x34]
	bx lr
	.align 2, 0
_08124290: .4byte 0x02039E10
	thumb_func_end sub_08124284

	thumb_func_start CreateRegionMapPlayerIcon
CreateRegionMapPlayerIcon: @ 0x08124294
	push {r4, r5, r6, lr}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _081242EC
	str r2, [sp, #0x18]
	movs r2, #0x80
	add r6, sp, #0x18
	lsrs r3, r0, #0x10
	orrs r0, r2
	str r0, [r6, #4]
	ldr r0, _081242F0
	str r0, [sp, #0x20]
	ldr r2, _081242F4
	add r4, sp, #0x20
	ldr r0, [r4, #4]
	ands r0, r2
	orrs r0, r1
	str r0, [r4, #4]
	mov r0, sp
	movs r5, #0
	strh r3, [r0]
	strh r1, [r0, #2]
	ldr r0, _081242F8
	str r0, [sp, #4]
	ldr r0, _081242FC
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r0, _08124300
	str r0, [sp, #0x10]
	ldr r0, _08124304
	str r0, [sp, #0x14]
	ldr r0, _08124308
	ldrb r0, [r0, #0x14]
	bl sub_08124674
	cmp r0, #0
	beq _08124310
	ldr r0, _0812430C
	ldr r0, [r0]
	str r5, [r0, #0x20]
	b _081243B0
	.align 2, 0
_081242EC: .4byte 0x0857C41C
_081242F0: .4byte 0x0857C3FC
_081242F4: .4byte 0xFFFF0000
_081242F8: .4byte 0x0857D510
_081242FC: .4byte 0x0857D520
_08124300: .4byte 0x082BF310
_08124304: .4byte 0x08007141
_08124308: .4byte 0x02036FB8
_0812430C: .4byte 0x02039E10
_08124310:
	ldr r0, _08124378
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #1
	bne _08124322
	ldr r0, _0812437C
	str r0, [sp, #0x18]
	ldr r0, _08124380
	str r0, [sp, #0x20]
_08124322:
	adds r0, r6, #0
	bl LoadSpriteSheet
	adds r0, r4, #0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08124384
	ldr r2, [r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08124388
	adds r1, r1, r0
	str r1, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x78
	ldrb r0, [r0]
	cmp r0, #0
	bne _08124390
	adds r0, r2, #0
	adds r0, #0x74
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r0, #4
	strh r0, [r1, #0x20]
	ldr r1, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x76
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r0, #4
	strh r0, [r1, #0x22]
	ldr r1, [r2, #0x20]
	ldr r0, _0812438C
	b _081243AE
	.align 2, 0
_08124378: .4byte 0x03005AF0
_0812437C: .4byte 0x0857C4BC
_08124380: .4byte 0x0857C49C
_08124384: .4byte 0x02039E10
_08124388: .4byte 0x020205AC
_0812438C: .4byte 0x081244F9
_08124390:
	adds r0, r2, #0
	adds r0, #0x74
	ldrh r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x30
	strh r0, [r1, #0x20]
	ldr r1, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x76
	ldrh r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x42
	strh r0, [r1, #0x22]
	ldr r1, [r2, #0x20]
	ldr r0, _081243B8
_081243AE:
	str r0, [r1, #0x1c]
_081243B0:
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081243B8: .4byte 0x08124469
	thumb_func_end CreateRegionMapPlayerIcon

	thumb_func_start HideRegionMapPlayerIcon
HideRegionMapPlayerIcon: @ 0x081243BC
	push {lr}
	ldr r3, _081243E0
	ldr r0, [r3]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _081243DA
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, [r0, #0x20]
	ldr r0, _081243E4
	str r0, [r1, #0x1c]
_081243DA:
	pop {r0}
	bx r0
	.align 2, 0
_081243E0: .4byte 0x02039E10
_081243E4: .4byte 0x08007141
	thumb_func_end HideRegionMapPlayerIcon

	thumb_func_start UnhideRegionMapPlayerIcon
UnhideRegionMapPlayerIcon: @ 0x081243E8
	push {lr}
	ldr r0, _08124420
	ldr r3, [r0]
	ldr r1, [r3, #0x20]
	cmp r1, #0
	beq _0812445E
	adds r0, r3, #0
	adds r0, #0x78
	ldrb r0, [r0]
	cmp r0, #1
	bne _08124428
	adds r0, r3, #0
	adds r0, #0x74
	ldrh r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x30
	strh r0, [r1, #0x20]
	ldr r1, [r3, #0x20]
	adds r0, r3, #0
	adds r0, #0x76
	ldrh r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x42
	strh r0, [r1, #0x22]
	ldr r1, [r3, #0x20]
	ldr r0, _08124424
	b _08124450
	.align 2, 0
_08124420: .4byte 0x02039E10
_08124424: .4byte 0x08124469
_08124428:
	adds r0, r3, #0
	adds r0, #0x74
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0
	strh r0, [r1, #0x20]
	ldr r1, [r3, #0x20]
	adds r0, r3, #0
	adds r0, #0x76
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r0, #4
	strh r0, [r1, #0x22]
	ldr r0, [r3, #0x20]
	strh r2, [r0, #0x24]
	ldr r0, [r3, #0x20]
	strh r2, [r0, #0x26]
	ldr r1, [r3, #0x20]
	ldr r0, _08124464
_08124450:
	str r0, [r1, #0x1c]
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_0812445E:
	pop {r0}
	bx r0
	.align 2, 0
_08124464: .4byte 0x081244F9
	thumb_func_end UnhideRegionMapPlayerIcon

	thumb_func_start RegionMapPlayerIconSpriteCallback_Zoomed
RegionMapPlayerIconSpriteCallback_Zoomed: @ 0x08124468
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _081244CC
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x5c
	movs r4, #0
	ldrsh r2, [r0, r4]
	lsls r2, r2, #1
	rsbs r2, r2, #0
	strh r2, [r3, #0x24]
	adds r1, #0x5e
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strh r0, [r3, #0x26]
	ldrh r1, [r3, #0x22]
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	strh r0, [r3, #0x2e]
	ldrh r1, [r3, #0x20]
	adds r1, r1, r2
	adds r2, r3, #0
	adds r2, #0x28
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r2, r2, r1
	strh r2, [r3, #0x30]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb0
	bhi _081244C8
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	blt _081244C8
	cmp r2, #0xf8
	ble _081244D0
_081244C8:
	movs r0, #0
	b _081244D2
	.align 2, 0
_081244CC: .4byte 0x02039E10
_081244D0:
	movs r0, #1
_081244D2:
	strh r0, [r3, #0x32]
	movs r1, #0x32
	ldrsh r0, [r3, r1]
	cmp r0, #1
	bne _081244E4
	adds r0, r3, #0
	bl RegionMapPlayerIconSpriteCallback
	b _081244F0
_081244E4:
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_081244F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RegionMapPlayerIconSpriteCallback_Zoomed

	thumb_func_start RegionMapPlayerIconSpriteCallback_Full
RegionMapPlayerIconSpriteCallback_Full: @ 0x081244F8
	push {lr}
	bl RegionMapPlayerIconSpriteCallback
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RegionMapPlayerIconSpriteCallback_Full

	thumb_func_start RegionMapPlayerIconSpriteCallback
RegionMapPlayerIconSpriteCallback: @ 0x08124504
	push {lr}
	adds r2, r0, #0
	ldr r0, _08124544
	ldr r0, [r0]
	adds r0, #0x7e
	ldrb r0, [r0]
	cmp r0, #0
	beq _08124548
	ldrh r0, [r2, #0x3c]
	adds r0, #1
	strh r0, [r2, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08124554
	movs r0, #0
	strh r0, [r2, #0x3c]
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsrs r1, r2, #2
	movs r0, #1
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08124554
	.align 2, 0
_08124544: .4byte 0x02039E10
_08124548:
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_08124554:
	pop {r0}
	bx r0
	thumb_func_end RegionMapPlayerIconSpriteCallback

	thumb_func_start sub_08124558
sub_08124558: @ 0x08124558
	push {lr}
	ldr r0, _08124574
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x7f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0812456E
	adds r1, #0x7e
	movs r0, #1
	strb r0, [r1]
_0812456E:
	pop {r0}
	bx r0
	.align 2, 0
_08124574: .4byte 0x02039E10
	thumb_func_end sub_08124558

	thumb_func_start GetMapName
GetMapName: @ 0x08124578
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	cmp r1, #0x56
	bne _08124590
	bl RegistryMenu_OnCursorMove
	adds r1, r0, #0
	b _081245BE
_08124590:
	cmp r1, #0xd4
	bhi _081245AC
	ldr r0, _081245A8
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl StringCopy
	adds r1, r0, #0
	b _081245BE
	.align 2, 0
_081245A8: .4byte 0x0857CD6C
_081245AC:
	cmp r4, #0
	bne _081245B2
	movs r4, #0x12
_081245B2:
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl StringFill
	b _081245E2
_081245BE:
	cmp r4, #0
	beq _081245E0
	subs r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bhs _081245DC
	movs r2, #0
_081245CE:
	strb r2, [r1]
	adds r1, #1
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	blo _081245CE
_081245DC:
	movs r0, #0xff
	strb r0, [r1]
_081245E0:
	adds r0, r1, #0
_081245E2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetMapName

	thumb_func_start sub_081245E8
sub_081245E8: @ 0x081245E8
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x56
	beq _08124604
	cmp r1, #0x57
	bne _08124610
	ldr r1, _08124600
	bl StringCopy
	b _08124616
	.align 2, 0
_08124600: .4byte 0x085CBEBA
_08124604:
	ldr r1, _0812460C
	bl StringCopy
	b _08124616
	.align 2, 0
_0812460C: .4byte 0x085CBEC1
_08124610:
	movs r2, #0
	bl GetMapName
_08124616:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081245E8

	thumb_func_start sub_0812461C
sub_0812461C: @ 0x0812461C
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x42
	beq _0812462C
	bl sub_081245E8
	b _08124632
_0812462C:
	ldr r1, _08124638
	bl StringCopy
_08124632:
	pop {r1}
	bx r1
	.align 2, 0
_08124638: .4byte 0x085CBEC7
	thumb_func_end sub_0812461C

	thumb_func_start sub_0812463C
sub_0812463C: @ 0x0812463C
	push {r4, r5, lr}
	ldr r5, [sp, #0xc]
	lsls r0, r0, #0x10
	ldr r4, _08124660
	lsrs r0, r0, #0xd
	adds r0, r0, r4
	ldrb r4, [r0]
	strh r4, [r1]
	ldrb r1, [r0, #1]
	strh r1, [r2]
	ldrb r1, [r0, #2]
	strh r1, [r3]
	ldrb r0, [r0, #3]
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124660: .4byte 0x0857CD6C
	thumb_func_end sub_0812463C

	thumb_func_start sub_08124664
sub_08124664: @ 0x08124664
	ldr r0, _08124670
	ldr r0, [r0]
	adds r0, #0x78
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08124670: .4byte 0x02039E10
	thumb_func_end sub_08124664

	thumb_func_start sub_08124674
sub_08124674: @ 0x08124674
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _0812468C
_0812467E:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bne _08124690
	movs r0, #1
	b _08124698
	.align 2, 0
_0812468C: .4byte 0x0857D524
_08124690:
	adds r1, #1
	cmp r1, #2
	bls _0812467E
	movs r0, #0
_08124698:
	pop {r1}
	bx r1
	thumb_func_end sub_08124674

	thumb_func_start MCB2_FlyMap
MCB2_FlyMap: @ 0x0812469C
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _081246BC
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xa
	bls _081246B0
	b _081248B6
_081246B0:
	lsls r0, r0, #2
	ldr r1, _081246C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081246BC: .4byte 0x03002360
_081246C0: .4byte 0x081246C4
_081246C4: @ jump table
	.4byte _081246F0 @ case 0
	.4byte _08124772 @ case 1
	.4byte _08124788 @ case 2
	.4byte _08124798 @ case 3
	.4byte _081247A8 @ case 4
	.4byte _081247F0 @ case 5
	.4byte _08124804 @ case 6
	.4byte _08124818 @ case 7
	.4byte _08124858 @ case 8
	.4byte _0812485E @ case 9
	.4byte _08124878 @ case 10
_081246F0:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	ldr r4, _08124754
	ldr r0, _08124758
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	bne _08124760
	ldr r0, _0812475C
	bl SetMainCallback2
	b _081248B6
	.align 2, 0
_08124754: .4byte 0x02039E14
_08124758: .4byte 0x00000A74
_0812475C: .4byte 0x08085AFD
_08124760:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	b _081248A8
_08124772:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08124784
	movs r0, #1
	movs r2, #3
	bl InitBgsFromTemplates
	b _081248A8
	.align 2, 0
_08124784: .4byte 0x0857D7D4
_08124788:
	ldr r0, _08124794
	bl InitWindows
	bl DeactivateAllTextPrinters
	b _081248A8
	.align 2, 0
_08124794: .4byte 0x0857D7E0
_08124798:
	movs r0, #0
	movs r1, #0x51
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	bl clear_scheduled_bg_copies_to_vram
	b _081248A8
_081247A8:
	ldr r4, _081247E4
	ldr r0, [r4]
	adds r0, #8
	movs r1, #0
	bl InitRegionMap
	movs r0, #0
	movs r1, #0
	bl CreateRegionMapCursor
	movs r0, #1
	movs r1, #1
	bl CreateRegionMapPlayerIcon
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	strh r1, [r0, #6]
	ldr r1, _081247E8
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0xa
	bl StringFill
	ldr r1, _081247EC
	movs r0, #1
	str r0, [r1]
	bl sub_08124910
	b _081248A8
	.align 2, 0
_081247E4: .4byte 0x02039E14
_081247E8: .4byte 0x00000A4C
_081247EC: .4byte 0x03001180
_081247F0:
	ldr r0, _081247FC
	ldr r1, _08124800
	bl LZ77UnCompVram
	b _081248A8
	.align 2, 0
_081247FC: .4byte 0x0857D548
_08124800: .4byte 0x0600C000
_08124804:
	ldr r0, _08124810
	ldr r1, _08124814
	bl LZ77UnCompVram
	b _081248A8
	.align 2, 0
_08124810: .4byte 0x0857D580
_08124814: .4byte 0x0600F000
_08124818:
	ldr r0, _08124850
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r2, _08124854
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	b _081248A8
	.align 2, 0
_08124850: .4byte 0x0857D528
_08124854: .4byte 0x085C9398
_08124858:
	bl sub_08124A58
	b _081248A8
_0812485E:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _08124874
	bl SetVBlankCallback
	b _081248A8
	.align 2, 0
_08124874: .4byte 0x081248CD
_08124878:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuRegBits
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r0, _081248C0
	bl sub_08124900
	ldr r0, _081248C4
	bl SetMainCallback2
_081248A8:
	ldr r1, _081248C8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_081248B6:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081248C0: .4byte 0x08124CFD
_081248C4: .4byte 0x081248E1
_081248C8: .4byte 0x03002360
	thumb_func_end MCB2_FlyMap

	thumb_func_start sub_081248CC
sub_081248CC: @ 0x081248CC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081248CC

	thumb_func_start sub_081248E0
sub_081248E0: @ 0x081248E0
	push {lr}
	ldr r0, _081248FC
	ldr r0, [r0]
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	thumb_func_end sub_081248E0

	thumb_func_start sub_081248F0
sub_081248F0: @ 0x081248F0
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	pop {r0}
	bx r0
	.align 2, 0
_081248FC: .4byte 0x02039E14
	thumb_func_end sub_081248F0

	thumb_func_start sub_08124900
sub_08124900: @ 0x08124900
	ldr r1, _0812490C
	ldr r1, [r1]
	str r0, [r1]
	movs r0, #0
	strh r0, [r1, #4]
	bx lr
	.align 2, 0
_0812490C: .4byte 0x02039E14
	thumb_func_end sub_08124900

	thumb_func_start sub_08124910
sub_08124910: @ 0x08124910
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r2, _081249B4
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08124A14
	movs r7, #0
	movs r3, #0
	ldr r0, _081249B8
	mov ip, r0
	adds r5, r2, #0
	movs r6, #0
_08124930:
	ldr r0, [r5]
	lsls r1, r3, #3
	mov r2, ip
	adds r4, r1, r2
	ldrh r0, [r0, #8]
	ldrh r1, [r4, #4]
	cmp r0, r1
	bne _081249C0
	ldrh r0, [r4, #6]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081249CA
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl StringLength
	movs r7, #1
	movs r0, #0
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #1
	movs r1, #0
	movs r2, #0x51
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, [r5]
	adds r2, #0xc
	movs r0, #2
	str r0, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x12
	str r0, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0x10
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _081249BC
	str r7, [r0]
	b _081249CA
	.align 2, 0
_081249B4: .4byte 0x02039E14
_081249B8: .4byte 0x0857D7CC
_081249BC: .4byte 0x03001180
_081249C0:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08124930
_081249CA:
	cmp r7, #0
	bne _08124A4A
	ldr r4, _08124A0C
	ldr r0, [r4]
	cmp r0, #1
	bne _081249EA
	movs r0, #1
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #0
	movs r1, #0
	movs r2, #0x51
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
_081249EA:
	ldr r0, _08124A10
	ldr r2, [r0]
	adds r2, #0xc
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	str r7, [r4]
	b _08124A4A
	.align 2, 0
_08124A0C: .4byte 0x03001180
_08124A10: .4byte 0x02039E14
_08124A14:
	ldr r4, _08124A54
	ldr r0, [r4]
	cmp r0, #1
	bne _08124A30
	movs r0, #1
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #0
	movs r1, #0
	movs r2, #0x51
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
_08124A30:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #0
	str r0, [r4]
_08124A4A:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124A54: .4byte 0x03001180
	thumb_func_end sub_08124910

	thumb_func_start sub_08124A58
sub_08124A58: @ 0x08124A58
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _08124AA4
	ldr r5, _08124AA8
	ldr r1, [r5]
	ldr r4, _08124AAC
	adds r1, r1, r4
	bl LZ77UnCompWram
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [sp]
	ldr r1, _08124AB0
	ldr r0, [sp, #4]
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #1
	orrs r0, r1
	ldr r1, _08124AB4
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xa
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _08124AB8
	bl LoadSpritePalette
	bl sub_08124ABC
	bl sub_08124BCC
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124AA4: .4byte 0x0857D658
_08124AA8: .4byte 0x02039E14
_08124AAC: .4byte 0x0000088C
_08124AB0: .4byte 0xFFFF0000
_08124AB4: .4byte 0x0000FFFF
_08124AB8: .4byte 0x0857D800
	thumb_func_end sub_08124A58

	thumb_func_start sub_08124ABC
sub_08124ABC: @ 0x08124ABC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08124B1C
	str r0, [sp, #0xc]
	movs r1, #0
	mov sb, r1
	mov r2, sp
	adds r2, #6
	str r2, [sp, #0x14]
	mov r3, sp
	adds r3, #0xa
	str r3, [sp, #0x18]
	mov r0, sp
	adds r0, #8
	str r0, [sp, #0x10]
	add r1, sp, #4
	mov sl, r1
_08124AE6:
	ldr r2, [sp, #0x18]
	str r2, [sp]
	mov r0, sb
	add r1, sp, #4
	mov r2, sp
	adds r2, #6
	ldr r3, [sp, #0x10]
	bl sub_0812463C
	mov r3, sl
	ldrh r0, [r3]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	strh r0, [r3]
	mov r1, sp
	ldrh r0, [r1, #6]
	adds r0, #2
	lsls r0, r0, #3
	adds r0, #4
	strh r0, [r1, #6]
	ldr r2, [sp, #0x10]
	ldrh r0, [r2]
	cmp r0, #2
	bne _08124B20
	movs r7, #1
	b _08124B2C
	.align 2, 0
_08124B1C: .4byte 0x0000086F
_08124B20:
	ldr r3, [sp, #0x18]
	ldrh r0, [r3]
	movs r7, #0
	cmp r0, #2
	bne _08124B2C
	movs r7, #2
_08124B2C:
	mov r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x14]
	movs r0, #0
	ldrsh r2, [r3, r0]
	ldr r0, _08124B78
	movs r3, #0xa
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x40
	beq _08124BA0
	ldr r1, _08124B7C
	mov r8, r1
	lsls r4, r5, #4
	adds r0, r4, r5
	lsls r6, r0, #2
	adds r2, r6, r1
	lsls r3, r7, #6
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #1]
	ldr r0, [sp, #0xc]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08124B84
	mov r0, r8
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _08124B80
	str r1, [r0]
	b _08124B8A
	.align 2, 0
_08124B78: .4byte 0x0857D86C
_08124B7C: .4byte 0x020205AC
_08124B80: .4byte 0x08124CA5
_08124B84:
	adds r0, r7, #3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08124B8A:
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, _08124BC8
	adds r4, r4, r0
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	mov r2, sb
	strh r2, [r4, #0x2e]
_08124BA0:
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0xf
	bls _08124AE6
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124BC8: .4byte 0x020205AC
	thumb_func_end sub_08124ABC

	thumb_func_start sub_08124BCC
sub_08124BCC: @ 0x08124BCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov r8, r0
	ldr r6, _08124C94
	ldrh r0, [r6, #2]
	cmp r0, #0xd5
	beq _08124C84
	mov r5, sp
	adds r5, #6
	add r7, sp, #4
	ldr r1, _08124C98
	mov sb, r1
	movs r0, #0x1c
	add r0, sb
	mov sl, r0
_08124BF4:
	mov r1, r8
	lsls r4, r1, #2
	adds r0, r4, r6
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08124C6C
	adds r0, r6, #2
	adds r0, r4, r0
	ldrh r6, [r0]
	mov r0, sp
	adds r0, #0xa
	str r0, [sp]
	adds r0, r6, #0
	add r1, sp, #4
	adds r2, r5, #0
	add r3, sp, #8
	bl sub_0812463C
	ldrh r0, [r7]
	adds r0, #1
	lsls r0, r0, #3
	strh r0, [r7]
	ldrh r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	strh r0, [r5]
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r0, _08124C9C
	movs r3, #0xa
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08124C6C
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r1, sb
	adds r4, r2, r1
	ldrb r1, [r4, #3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4, #3]
	add r2, sl
	ldr r0, _08124CA0
	str r0, [r2]
	adds r0, r4, #0
	movs r1, #6
	bl StartSpriteAnim
	strh r6, [r4, #0x2e]
_08124C6C:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r6, _08124C94
	lsls r0, r0, #2
	adds r1, r6, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xd5
	bne _08124BF4
_08124C84:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124C94: .4byte 0x0857D808
_08124C98: .4byte 0x020205AC
_08124C9C: .4byte 0x0857D86C
_08124CA0: .4byte 0x08124CA5
	thumb_func_end sub_08124BCC

	thumb_func_start sub_08124CA4
sub_08124CA4: @ 0x08124CA4
	push {lr}
	adds r2, r0, #0
	ldr r0, _08124CE4
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _08124CE8
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08124CF6
	movs r0, #0
	strh r0, [r2, #0x30]
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsrs r1, r2, #2
	movs r0, #1
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08124CF6
	.align 2, 0
_08124CE4: .4byte 0x02039E14
_08124CE8:
	movs r0, #0x10
	strh r0, [r2, #0x30]
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #0x15
	ands r0, r1
	strb r0, [r2]
_08124CF6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08124CA4

	thumb_func_start sub_08124CFC
sub_08124CFC: @ 0x08124CFC
	push {r4, lr}
	sub sp, #4
	ldr r4, _08124D10
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _08124D14
	cmp r1, #1
	beq _08124D2E
	b _08124D3E
	.align 2, 0
_08124D10: .4byte 0x02039E14
_08124D14:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _08124D3E
_08124D2E:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08124D3E
	ldr r0, _08124D48
	bl sub_08124900
_08124D3E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124D48: .4byte 0x08124D4D
	thumb_func_end sub_08124CFC

	thumb_func_start sub_08124D4C
sub_08124D4C: @ 0x08124D4C
	push {r4, lr}
	ldr r0, _08124D70
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _08124DE0
	bl sub_081230B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _08124DE0
	lsls r0, r0, #2
	ldr r1, _08124D74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08124D70: .4byte 0x02039E14
_08124D74: .4byte 0x08124D78
_08124D78: @ jump table
	.4byte _08124DE0 @ case 0
	.4byte _08124DE0 @ case 1
	.4byte _08124DE0 @ case 2
	.4byte _08124D90 @ case 3
	.4byte _08124D96 @ case 4
	.4byte _08124DC8 @ case 5
_08124D90:
	bl sub_08124910
	b _08124DE0
_08124D96:
	ldr r4, _08124DBC
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	cmp r0, #2
	beq _08124DA4
	cmp r0, #4
	bne _08124DE0
_08124DA4:
	movs r0, #5
	bl m4aSongNumStart
	ldr r0, [r4]
	ldr r1, _08124DC0
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08124DC4
	bl sub_08124900
	b _08124DE0
	.align 2, 0
_08124DBC: .4byte 0x02039E14
_08124DC0: .4byte 0x00000A72
_08124DC4: .4byte 0x08124DF5
_08124DC8:
	movs r0, #5
	bl m4aSongNumStart
	ldr r0, _08124DE8
	ldr r0, [r0]
	ldr r1, _08124DEC
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08124DF0
	bl sub_08124900
_08124DE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124DE8: .4byte 0x02039E14
_08124DEC: .4byte 0x00000A72
_08124DF0: .4byte 0x08124DF5
	thumb_func_end sub_08124D4C

