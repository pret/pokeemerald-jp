.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081C4578
sub_081C4578: @ 0x081C4578
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _081C45D8
	movs r0, #4
	bl Alloc
	str r0, [r4]
	ldr r1, [r5]
	lsls r0, r1, #0x14
	lsrs r4, r0, #0x1e
	cmp r4, #0
	bne _081C45E4
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #8
	movs r2, #0
	bl SetBgAttribute
	ldr r3, [r5]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1e
	ldr r1, _081C45DC
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x18
	str r4, [sp]
	movs r2, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	ldr r1, _081C45E0
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, [r5]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x18
	str r4, [sp]
	movs r2, #0x20
	movs r3, #0x20
	bl sub_081999D4
	b _081C4636
	.align 2, 0
_081C45D8: .4byte 0x0203CBF4
_081C45DC: .4byte 0x085ED5F0
_081C45E0: .4byte 0x085EE344
_081C45E4:
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #8
	movs r2, #2
	bl SetBgAttribute
	ldr r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #9
	movs r2, #1
	bl SetBgAttribute
	ldr r3, [r5]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1e
	ldr r1, _081C4680
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x18
	movs r2, #0
	str r2, [sp]
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	ldr r1, _081C4684
	movs r4, #1
	str r4, [sp]
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, [r5]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x18
	str r4, [sp]
	movs r2, #0x40
	movs r3, #0x40
	bl sub_081999D4
_081C4636:
	ldr r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	ldr r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	ldr r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #4
	movs r2, #1
	bl SetBgAttribute
	ldr r0, _081C4688
	ldr r1, _081C468C
	ldr r2, _081C4690
	bl CpuSet
	ldr r0, _081C4694
	ldr r1, [r0]
	ldr r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C4680: .4byte 0x085EE658
_081C4684: .4byte 0x085EF3B4
_081C4688: .4byte 0x085ED590
_081C468C: .4byte 0x02037494
_081C4690: .4byte 0x04000018
_081C4694: .4byte 0x0203CBF4
	thumb_func_end sub_081C4578

	thumb_func_start sub_081C4698
sub_081C4698: @ 0x081C4698
	push {lr}
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C46A8
	movs r0, #1
	b _081C46B4
_081C46A8:
	ldr r0, _081C46B8
	ldr r0, [r0]
	ldrb r0, [r0]
	bl ShowBg
	movs r0, #0
_081C46B4:
	pop {r1}
	bx r1
	.align 2, 0
_081C46B8: .4byte 0x0203CBF4
	thumb_func_end sub_081C4698

	thumb_func_start sub_081C46BC
sub_081C46BC: @ 0x081C46BC
	push {r4, lr}
	ldr r4, _081C46D4
	ldr r0, [r4]
	cmp r0, #0
	beq _081C46CE
	bl Free
	movs r0, #0
	str r0, [r4]
_081C46CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C46D4: .4byte 0x0203CBF4
	thumb_func_end sub_081C46BC

	thumb_func_start sub_081C46D8
sub_081C46D8: @ 0x081C46D8
	push {lr}
	adds r1, r0, #0
	ldr r0, _081C46F0
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r1, r1, #8
	movs r2, #0
	bl ChangeBgY
	pop {r0}
	bx r0
	.align 2, 0
_081C46F0: .4byte 0x0203CBF4
	thumb_func_end sub_081C46D8

