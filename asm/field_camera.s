.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start move_tilemap_camera_to_upper_left_corner_
move_tilemap_camera_to_upper_left_corner_: @ 0x080894BC
	movs r1, #0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0]
	strb r1, [r0, #1]
	movs r1, #1
	strb r1, [r0, #4]
	bx lr
	thumb_func_end move_tilemap_camera_to_upper_left_corner_

	thumb_func_start tilemap_move_something
tilemap_move_something: @ 0x080894CC
	ldrb r3, [r0, #2]
	adds r3, r3, r1
	strb r3, [r0, #2]
	ldrb r1, [r0, #2]
	movs r3, #0x1f
	ands r1, r3
	strb r1, [r0, #2]
	ldrb r1, [r0, #3]
	adds r1, r1, r2
	strb r1, [r0, #3]
	ldrb r1, [r0, #3]
	ands r1, r3
	strb r1, [r0, #3]
	bx lr
	thumb_func_end tilemap_move_something

	thumb_func_start coords8_add
coords8_add: @ 0x080894E8
	ldrb r3, [r0]
	adds r3, r3, r1
	strb r3, [r0]
	ldrb r1, [r0, #1]
	adds r1, r1, r2
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
	thumb_func_end coords8_add

	thumb_func_start move_tilemap_camera_to_upper_left_corner
move_tilemap_camera_to_upper_left_corner: @ 0x080894F8
	push {lr}
	ldr r0, _08089504
	bl move_tilemap_camera_to_upper_left_corner_
	pop {r0}
	bx r0
	.align 2, 0
_08089504: .4byte 0x03000E20
	thumb_func_end move_tilemap_camera_to_upper_left_corner

	thumb_func_start FieldUpdateBgTilemapScroll
FieldUpdateBgTilemapScroll: @ 0x08089508
	push {r4, r5, lr}
	ldr r1, _08089560
	ldr r0, _08089564
	movs r2, #0
	ldrsh r5, [r0, r2]
	ldrb r0, [r1]
	adds r5, r5, r0
	ldr r0, _08089568
	movs r2, #0
	ldrsh r4, [r0, r2]
	ldrb r1, [r1, #1]
	adds r4, r4, r1
	adds r4, #8
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r0, #0x14
	adds r1, r5, #0
	bl SetGpuReg
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0x16
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x18
	adds r1, r5, #0
	bl SetGpuReg
	movs r0, #0x1a
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x1c
	adds r1, r5, #0
	bl SetGpuReg
	movs r0, #0x1e
	adds r1, r4, #0
	bl SetGpuReg
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089560: .4byte 0x03000E20
_08089564: .4byte 0x03000E28
_08089568: .4byte 0x03000E2A
	thumb_func_end FieldUpdateBgTilemapScroll

	thumb_func_start sub_0808956C
sub_0808956C: @ 0x0808956C
	push {r4, lr}
	ldr r3, _0808958C
	ldr r2, _08089590
	ldrh r2, [r2]
	ldrb r4, [r3]
	adds r2, r2, r4
	strh r2, [r0]
	ldr r0, _08089594
	ldrh r0, [r0]
	ldrb r3, [r3, #1]
	adds r0, r0, r3
	adds r0, #8
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808958C: .4byte 0x03000E20
_08089590: .4byte 0x03000E28
_08089594: .4byte 0x03000E2A
	thumb_func_end sub_0808956C

	thumb_func_start DrawWholeMapView
DrawWholeMapView: @ 0x08089598
	push {lr}
	ldr r0, _080895B8
	ldr r1, [r0]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	ldr r2, _080895BC
	ldr r2, [r2]
	bl DrawWholeMapViewInternal
	ldr r1, _080895C0
	movs r0, #1
	strb r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_080895B8: .4byte 0x03005AEC
_080895BC: .4byte 0x02036FB8
_080895C0: .4byte 0x03000E20
	thumb_func_end DrawWholeMapView

	thumb_func_start DrawWholeMapViewInternal
DrawWholeMapViewInternal: @ 0x080895C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	mov sb, r1
	mov r8, r2
	movs r1, #0
_080895D8:
	ldr r2, _08089644
	ldrb r0, [r2, #3]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080895EC
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080895EC:
	lsls r6, r0, #5
	movs r4, #0
	adds r7, r1, #2
	str r7, [sp]
	lsrs r5, r1, #1
_080895F6:
	ldr r1, _08089644
	ldrb r0, [r1, #2]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _0808960A
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0808960A:
	adds r1, r6, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r2, r4, #1
	add r2, sl
	mov r0, r8
	mov r7, sb
	adds r3, r7, r5
	bl DrawMetatileAt
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _080895F6
	ldr r1, [sp]
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1f
	bls _080895D8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089644: .4byte 0x03000E20
	thumb_func_end DrawWholeMapViewInternal

	thumb_func_start RedrawMapSlicesForCameraUpdate
RedrawMapSlicesForCameraUpdate: @ 0x08089648
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r0, _08089690
	ldr r4, [r0]
	cmp r6, #0
	ble _08089660
	adds r0, r5, #0
	adds r1, r4, #0
	bl RedrawMapSliceWest
_08089660:
	cmp r6, #0
	bge _0808966C
	adds r0, r5, #0
	adds r1, r4, #0
	bl RedrawMapSliceEast
_0808966C:
	cmp r7, #0
	ble _08089678
	adds r0, r5, #0
	adds r1, r4, #0
	bl RedrawMapSliceNorth
_08089678:
	cmp r7, #0
	bge _08089684
	adds r0, r5, #0
	adds r1, r4, #0
	bl RedrawMapSliceSouth
_08089684:
	movs r0, #1
	strb r0, [r5, #4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089690: .4byte 0x02036FB8
	thumb_func_end RedrawMapSlicesForCameraUpdate

	thumb_func_start RedrawMapSliceNorth
RedrawMapSliceNorth: @ 0x08089694
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r0, [r5, #3]
	adds r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080896AC
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080896AC:
	lsls r6, r0, #5
	movs r4, #0
_080896B0:
	ldrb r0, [r5, #2]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080896C2
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080896C2:
	adds r1, r6, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _080896F0
	ldr r3, [r0]
	movs r0, #0
	ldrsh r2, [r3, r0]
	lsrs r0, r4, #1
	adds r2, r2, r0
	movs r0, #2
	ldrsh r3, [r3, r0]
	adds r3, #0xe
	adds r0, r7, #0
	bl DrawMetatileAt
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _080896B0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080896F0: .4byte 0x03005AEC
	thumb_func_end RedrawMapSliceNorth

	thumb_func_start RedrawMapSliceSouth
RedrawMapSliceSouth: @ 0x080896F4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r0, [r5, #3]
	lsls r6, r0, #5
	movs r4, #0
_08089700:
	ldrb r0, [r5, #2]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08089712
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08089712:
	adds r1, r6, r0
	ldr r0, _0808973C
	ldr r3, [r0]
	movs r0, #0
	ldrsh r2, [r3, r0]
	lsrs r0, r4, #1
	adds r2, r2, r0
	movs r0, #2
	ldrsh r3, [r3, r0]
	adds r0, r7, #0
	bl DrawMetatileAt
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _08089700
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808973C: .4byte 0x03005AEC
	thumb_func_end RedrawMapSliceSouth

	thumb_func_start RedrawMapSliceEast
RedrawMapSliceEast: @ 0x08089740
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	ldrb r6, [r5, #2]
	movs r4, #0
_0808974E:
	ldrb r0, [r5, #3]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08089760
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08089760:
	lsls r1, r0, #5
	adds r1, r1, r6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08089794
	ldr r0, [r0]
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r7, #2
	ldrsh r3, [r0, r7]
	lsrs r0, r4, #1
	adds r3, r3, r0
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _0808974E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089794: .4byte 0x03005AEC
	thumb_func_end RedrawMapSliceEast

	thumb_func_start RedrawMapSliceWest
RedrawMapSliceWest: @ 0x08089798
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	ldrb r0, [r6, #2]
	adds r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x1f
	bls _080897B6
	adds r0, r5, #0
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080897B6:
	movs r4, #0
_080897B8:
	ldrb r0, [r6, #3]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080897CA
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080897CA:
	lsls r1, r0, #5
	adds r1, r1, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08089800
	ldr r0, [r0]
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r2, #0xe
	movs r7, #2
	ldrsh r3, [r0, r7]
	lsrs r0, r4, #1
	adds r3, r3, r0
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _080897B8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089800: .4byte 0x03005AEC
	thumb_func_end RedrawMapSliceWest

	thumb_func_start CurrentMapDrawMetatileAt
CurrentMapDrawMetatileAt: @ 0x08089804
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _08089838
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl MapPosToBgTilemapOffset
	adds r1, r0, #0
	cmp r1, #0
	blt _08089830
	ldr r0, _0808983C
	ldr r0, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #0
	adds r3, r5, #0
	bl DrawMetatileAt
	movs r0, #1
	strb r0, [r6, #4]
_08089830:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089838: .4byte 0x03000E20
_0808983C: .4byte 0x02036FB8
	thumb_func_end CurrentMapDrawMetatileAt

	thumb_func_start DrawDoorMetatileAt
DrawDoorMetatileAt: @ 0x08089840
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r6, _08089870
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r4, #0
	bl MapPosToBgTilemapOffset
	cmp r0, #0
	blt _08089868
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	adds r1, r5, #0
	bl DrawMetatile
	movs r0, #1
	strb r0, [r6, #4]
_08089868:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089870: .4byte 0x03000E20
	thumb_func_end DrawDoorMetatileAt

	thumb_func_start DrawMetatileAt
DrawMetatileAt: @ 0x08089874
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r0, r6, #0
	adds r1, r7, #0
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r4, r0
	bls _0808989C
	movs r4, #0
_0808989C:
	ldr r0, _080898A8
	cmp r4, r0
	bhi _080898AC
	ldr r0, [r5, #0x10]
	ldr r5, [r0, #0xc]
	b _080898B8
	.align 2, 0
_080898A8: .4byte 0x000001FF
_080898AC:
	ldr r0, [r5, #0x14]
	ldr r5, [r0, #0xc]
	ldr r1, _080898D8
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080898B8:
	adds r0, r6, #0
	adds r1, r7, #0
	bl MapGridGetMetatileLayerTypeAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #4
	adds r1, r5, r1
	mov r2, r8
	bl DrawMetatile
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080898D8: .4byte 0xFFFFFE00
	thumb_func_end DrawMetatileAt

	thumb_func_start DrawMetatile
DrawMetatile: @ 0x080898DC
	push {r4, lr}
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #1
	beq _08089934
	cmp r0, #1
	bgt _080898F2
	cmp r0, #0
	beq _08089994
	b _080899E6
_080898F2:
	cmp r0, #2
	bne _080899E6
	ldr r0, _0808992C
	ldr r0, [r0]
	lsls r3, r2, #1
	adds r0, r3, r0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r4, #4]
	strh r1, [r2]
	adds r0, #0x42
	ldrh r1, [r4, #6]
	strh r1, [r0]
	ldr r0, _08089930
	ldr r0, [r0]
	adds r0, r3, r0
	movs r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	adds r1, r0, #0
	adds r1, #0x40
	strh r2, [r1]
	adds r0, #0x42
	strh r2, [r0]
	b _080899CA
	.align 2, 0
_0808992C: .4byte 0x03005B04
_08089930: .4byte 0x03005AFC
_08089934:
	ldr r0, _08089988
	ldr r0, [r0]
	lsls r3, r2, #1
	adds r0, r3, r0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r4, #4]
	strh r1, [r2]
	adds r0, #0x42
	ldrh r1, [r4, #6]
	strh r1, [r0]
	ldr r0, _0808998C
	ldr r0, [r0]
	adds r0, r3, r0
	ldrh r1, [r4, #8]
	strh r1, [r0]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #2]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r4, #0xc]
	strh r1, [r2]
	adds r0, #0x42
	ldrh r1, [r4, #0xe]
	strh r1, [r0]
	ldr r0, _08089990
	ldr r0, [r0]
	adds r3, r3, r0
	movs r1, #0
	strh r1, [r3]
	strh r1, [r3, #2]
	adds r0, r3, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r3, #0x42
	strh r1, [r3]
	b _080899E6
	.align 2, 0
_08089988: .4byte 0x03005B04
_0808998C: .4byte 0x03005AFC
_08089990: .4byte 0x03005B00
_08089994:
	ldr r0, _08089A00
	ldr r0, [r0]
	lsls r3, r2, #1
	adds r0, r3, r0
	ldr r1, _08089A04
	adds r2, r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	adds r1, r0, #0
	adds r1, #0x40
	strh r2, [r1]
	adds r0, #0x42
	strh r2, [r0]
	ldr r0, _08089A08
	ldr r0, [r0]
	adds r0, r3, r0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r4, #4]
	strh r1, [r2]
	adds r0, #0x42
	ldrh r1, [r4, #6]
	strh r1, [r0]
_080899CA:
	ldr r0, _08089A0C
	ldr r0, [r0]
	adds r3, r3, r0
	ldrh r0, [r4, #8]
	strh r0, [r3]
	ldrh r0, [r4, #0xa]
	strh r0, [r3, #2]
	adds r1, r3, #0
	adds r1, #0x40
	ldrh r0, [r4, #0xc]
	strh r0, [r1]
	adds r3, #0x42
	ldrh r0, [r4, #0xe]
	strh r0, [r3]
_080899E6:
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089A00: .4byte 0x03005B04
_08089A04: .4byte 0x00003014
_08089A08: .4byte 0x03005AFC
_08089A0C: .4byte 0x03005B00
	thumb_func_end DrawMetatile

	thumb_func_start MapPosToBgTilemapOffset
MapPosToBgTilemapOffset: @ 0x08089A10
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08089A40
	ldr r3, [r0]
	movs r5, #0
	ldrsh r0, [r3, r5]
	subs r1, r1, r0
	lsls r1, r1, #1
	cmp r1, #0x1f
	bhi _08089A3A
	ldrb r0, [r4, #2]
	adds r1, r1, r0
	cmp r1, #0x1f
	ble _08089A2E
	subs r1, #0x20
_08089A2E:
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r0, r2, r0
	lsls r2, r0, #1
	cmp r2, #0x1f
	bls _08089A44
_08089A3A:
	movs r0, #1
	rsbs r0, r0, #0
	b _08089A52
	.align 2, 0
_08089A40: .4byte 0x03005AEC
_08089A44:
	ldrb r0, [r4, #3]
	adds r2, r2, r0
	cmp r2, #0x1f
	ble _08089A4E
	subs r2, #0x20
_08089A4E:
	lsls r0, r2, #5
	adds r0, r0, r1
_08089A52:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MapPosToBgTilemapOffset

	thumb_func_start CameraUpdateCallback
CameraUpdateCallback: @ 0x08089A58
	push {lr}
	adds r3, r0, #0
	ldr r2, [r3, #4]
	cmp r2, #0
	beq _08089A78
	ldr r1, _08089A7C
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x32
	ldrsh r1, [r0, r2]
	str r1, [r3, #8]
	movs r1, #0x34
	ldrsh r0, [r0, r1]
	str r0, [r3, #0xc]
_08089A78:
	pop {r0}
	bx r0
	.align 2, 0
_08089A7C: .4byte 0x020205AC
	thumb_func_end CameraUpdateCallback

	thumb_func_start ResetCameraUpdateInfo
ResetCameraUpdateInfo: @ 0x08089A80
	ldr r1, _08089A94
	movs r0, #0
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	str r0, [r1, #0x14]
	str r0, [r1, #4]
	str r0, [r1]
	bx lr
	.align 2, 0
_08089A94: .4byte 0x03005B30
	thumb_func_end ResetCameraUpdateInfo

	thumb_func_start InitCameraUpdateCallback
InitCameraUpdateCallback: @ 0x08089A98
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _08089ACC
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _08089AB4
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08089AD0
	adds r0, r0, r1
	bl DestroySprite
_08089AB4:
	adds r0, r5, #0
	bl AddCameraObject
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #4]
	ldr r0, _08089AD4
	str r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08089ACC: .4byte 0x03005B30
_08089AD0: .4byte 0x020205AC
_08089AD4: .4byte 0x08089A59
	thumb_func_end InitCameraUpdateCallback

	thumb_func_start CameraUpdate
CameraUpdate: @ 0x08089AD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r6, _08089BD8
	ldr r1, [r6]
	cmp r1, #0
	beq _08089AEC
	adds r0, r6, #0
	bl _call_via_r1
_08089AEC:
	ldr r7, [r6, #8]
	ldr r0, [r6, #0xc]
	mov r8, r0
	movs r4, #0
	movs r5, #0
	ldr r1, [r6, #0x10]
	ldr r0, [r6, #0x14]
	cmp r1, #0
	bne _08089B0A
	cmp r7, #0
	beq _08089B0A
	subs r4, #1
	cmp r7, #0
	ble _08089B0A
	movs r4, #1
_08089B0A:
	cmp r0, #0
	bne _08089B1E
	mov r2, r8
	cmp r2, #0
	beq _08089B1E
	movs r5, #1
	rsbs r5, r5, #0
	cmp r2, #0
	ble _08089B1E
	movs r5, #1
_08089B1E:
	cmp r1, #0
	beq _08089B30
	cmn r1, r7
	bne _08089B30
	movs r4, #1
	rsbs r4, r4, #0
	cmp r7, #0
	ble _08089B30
	movs r4, #1
_08089B30:
	cmp r0, #0
	beq _08089B44
	mov r3, r8
	cmn r0, r3
	bne _08089B44
	movs r4, #1
	rsbs r4, r4, #0
	cmp r3, #0
	ble _08089B44
	movs r4, #1
_08089B44:
	ldr r2, _08089BD8
	ldr r0, [r2, #0x10]
	adds r1, r0, r7
	str r1, [r2, #0x10]
	adds r0, r1, #0
	cmp r1, #0
	bge _08089B54
	adds r0, #0xf
_08089B54:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r1, r0
	str r0, [r2, #0x10]
	ldr r0, [r2, #0x14]
	mov r3, r8
	adds r1, r0, r3
	str r1, [r2, #0x14]
	adds r0, r1, #0
	cmp r1, #0
	bge _08089B6C
	adds r0, #0xf
_08089B6C:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r1, r0
	str r0, [r2, #0x14]
	cmp r4, #0
	bne _08089B7C
	cmp r5, #0
	beq _08089BB2
_08089B7C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CameraMove
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateEventObjectsForCameraUpdate
	adds r0, r4, #0
	adds r1, r5, #0
	bl RotatingGatePuzzleCameraUpdate
	bl ResetBerryTreeSparkleFlags
	ldr r6, _08089BDC
	lsls r4, r4, #1
	lsls r5, r5, #1
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl tilemap_move_something
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl RedrawMapSlicesForCameraUpdate
_08089BB2:
	ldr r0, _08089BDC
	adds r1, r7, #0
	mov r2, r8
	bl coords8_add
	ldr r1, _08089BE0
	ldrh r0, [r1]
	subs r0, r0, r7
	strh r0, [r1]
	ldr r1, _08089BE4
	ldrh r0, [r1]
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089BD8: .4byte 0x03005B30
_08089BDC: .4byte 0x03000E20
_08089BE0: .4byte 0x03005B4C
_08089BE4: .4byte 0x03005B48
	thumb_func_end CameraUpdate

	thumb_func_start MoveCameraAndRedrawMap
MoveCameraAndRedrawMap: @ 0x08089BE8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl CameraMove
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl UpdateEventObjectsForCameraUpdate
	bl DrawWholeMapView
	ldr r1, _08089C1C
	lsls r4, r4, #4
	ldrh r0, [r1]
	subs r0, r0, r4
	strh r0, [r1]
	ldr r1, _08089C20
	lsls r5, r5, #4
	ldrh r0, [r1]
	subs r0, r0, r5
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089C1C: .4byte 0x03005B4C
_08089C20: .4byte 0x03005B48
	thumb_func_end MoveCameraAndRedrawMap

	thumb_func_start SetCameraPanningCallback
SetCameraPanningCallback: @ 0x08089C24
	ldr r1, _08089C2C
	str r0, [r1]
	bx lr
	.align 2, 0
_08089C2C: .4byte 0x03000E30
	thumb_func_end SetCameraPanningCallback

	thumb_func_start SetCameraPanning
SetCameraPanning: @ 0x08089C30
	ldr r2, _08089C40
	strh r0, [r2]
	ldr r0, _08089C44
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_08089C40: .4byte 0x03000E28
_08089C44: .4byte 0x03000E2A
	thumb_func_end SetCameraPanning

	thumb_func_start InstallCameraPanAheadCallback
InstallCameraPanAheadCallback: @ 0x08089C48
	ldr r1, _08089C64
	ldr r0, _08089C68
	str r0, [r1]
	ldr r1, _08089C6C
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08089C70
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08089C74
	movs r0, #0x20
	strh r0, [r1]
	bx lr
	.align 2, 0
_08089C64: .4byte 0x03000E30
_08089C68: .4byte 0x08089CC5
_08089C6C: .4byte 0x03000E2C
_08089C70: .4byte 0x03000E28
_08089C74: .4byte 0x03000E2A
	thumb_func_end InstallCameraPanAheadCallback

	thumb_func_start UpdateCameraPanning
UpdateCameraPanning: @ 0x08089C78
	push {lr}
	ldr r0, _08089CA8
	ldr r0, [r0]
	cmp r0, #0
	beq _08089C86
	bl _call_via_r0
_08089C86:
	ldr r2, _08089CAC
	ldr r0, _08089CB0
	ldr r1, _08089CB4
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	ldr r2, _08089CB8
	ldr r0, _08089CBC
	ldr r1, _08089CC0
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	subs r0, #8
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08089CA8: .4byte 0x03000E30
_08089CAC: .4byte 0x02021B38
_08089CB0: .4byte 0x03005B4C
_08089CB4: .4byte 0x03000E28
_08089CB8: .4byte 0x02021B3A
_08089CBC: .4byte 0x03005B48
_08089CC0: .4byte 0x03000E2A
	thumb_func_end UpdateCameraPanning

	thumb_func_start CameraPanningCB_PanAhead
CameraPanningCB_PanAhead: @ 0x08089CC4
	push {lr}
	ldr r0, _08089CD4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08089CD8
	bl InstallCameraPanAheadCallback
	b _08089D60
	.align 2, 0
_08089CD4: .4byte 0x02036FE8
_08089CD8:
	ldr r0, _08089CF0
	ldrb r0, [r0, #3]
	cmp r0, #1
	bne _08089CF8
	ldr r0, _08089CF4
	ldrb r1, [r0]
	movs r2, #1
	eors r1, r2
	strb r1, [r0]
	cmp r1, #0
	beq _08089D60
	b _08089CFE
	.align 2, 0
_08089CF0: .4byte 0x02037230
_08089CF4: .4byte 0x03000E2C
_08089CF8:
	ldr r1, _08089D20
	movs r0, #0
	strb r0, [r1]
_08089CFE:
	bl GetPlayerMovementDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08089D28
	ldr r2, _08089D24
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08089D60
	subs r0, r3, #2
	b _08089D5E
	.align 2, 0
_08089D20: .4byte 0x03000E2C
_08089D24: .4byte 0x03000E2A
_08089D28:
	cmp r0, #1
	bne _08089D44
	ldr r1, _08089D40
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x47
	bgt _08089D60
	adds r0, r2, #2
	strh r0, [r1]
	b _08089D60
	.align 2, 0
_08089D40: .4byte 0x03000E2A
_08089D44:
	ldr r2, _08089D54
	ldrh r0, [r2]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r1, #0x1f
	bgt _08089D58
	adds r0, #2
	b _08089D5E
	.align 2, 0
_08089D54: .4byte 0x03000E2A
_08089D58:
	cmp r1, #0x20
	ble _08089D60
	subs r0, #2
_08089D5E:
	strh r0, [r2]
_08089D60:
	pop {r0}
	bx r0
	thumb_func_end CameraPanningCB_PanAhead

