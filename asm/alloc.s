.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start PutMemBlockHeader
PutMemBlockHeader: @ 0x08000988
	push {r4, lr}
	movs r4, #0
	strh r4, [r0]
	ldr r4, _080009A0
	strh r4, [r0, #2]
	str r3, [r0, #4]
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080009A0: .4byte 0x0000A3A3
	thumb_func_end PutMemBlockHeader

	thumb_func_start PutFirstMemBlockHeader
PutFirstMemBlockHeader: @ 0x080009A4
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	subs r3, #0x10
	adds r1, r2, #0
	bl PutMemBlockHeader
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PutFirstMemBlockHeader

	thumb_func_start AllocInternal
AllocInternal: @ 0x080009B8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080009CC
	lsrs r0, r1, #2
	adds r0, #1
	lsls r1, r0, #2
_080009CC:
	movs r2, #1
_080009CE:
	ldrh r0, [r4]
	cmp r0, #0
	bne _08000A0C
	ldr r3, [r4, #4]
	cmp r3, r1
	blo _08000A0C
	subs r0, r3, r1
	cmp r0, #0x1f
	bhi _080009E4
	strh r2, [r4]
	b _08000A06
_080009E4:
	subs r3, #0x10
	subs r3, r3, r1
	adds r0, r1, #0
	adds r0, #0x10
	adds r5, r4, r0
	strh r2, [r4]
	str r1, [r4, #4]
	ldr r2, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutMemBlockHeader
	str r5, [r4, #0xc]
	ldr r0, [r5, #0xc]
	cmp r0, r6
	beq _08000A06
	str r5, [r0, #8]
_08000A06:
	adds r0, r4, #0
	adds r0, #0x10
	b _08000A24
_08000A0C:
	ldr r0, [r4, #0xc]
	cmp r0, r6
	beq _08000A16
	adds r4, r0, #0
	b _080009CE
_08000A16:
	ldr r0, _08000A2C
	movs r1, #0xae
	ldr r2, _08000A30
	movs r3, #1
	bl AGBAssert
	movs r0, #0
_08000A24:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08000A2C: .4byte 0x0829BDF4
_08000A30: .4byte 0x0829BE08
	thumb_func_end AllocInternal

	thumb_func_start FreeInternal
FreeInternal: @ 0x08000A34
	push {r4, r5, r6, r7, lr}
	cmp r1, #0
	bne _08000A50
	ldr r0, _08000A48
	ldr r2, _08000A4C
	movs r1, #0xc3
	movs r3, #1
	bl AGBAssert
	b _08000AF6
	.align 2, 0
_08000A48: .4byte 0x0829BDF4
_08000A4C: .4byte 0x0829BE0C
_08000A50:
	adds r6, r0, #0
	adds r4, r1, #0
	subs r4, #0x10
	ldrh r0, [r4, #2]
	ldr r7, _08000AFC
	cmp r0, r7
	beq _08000A6A
	ldr r0, _08000B00
	ldr r2, _08000B04
	movs r1, #0xcc
	movs r3, #1
	bl AGBAssert
_08000A6A:
	ldrh r0, [r4]
	cmp r0, #1
	beq _08000A7C
	ldr r0, _08000B00
	ldr r2, _08000B08
	movs r1, #0xcd
	movs r3, #1
	bl AGBAssert
_08000A7C:
	movs r0, #0
	strh r0, [r4]
	ldr r0, [r4, #0xc]
	cmp r0, r6
	beq _08000AB8
	ldrh r5, [r0]
	cmp r5, #0
	bne _08000AB8
	ldrh r0, [r0, #2]
	cmp r0, r7
	beq _08000A9E
	ldr r0, _08000B00
	ldr r2, _08000B0C
	movs r1, #0xd3
	movs r3, #1
	bl AGBAssert
_08000A9E:
	ldr r0, [r4, #4]
	adds r0, #0x10
	ldr r2, [r4, #0xc]
	ldr r1, [r2, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	strh r5, [r2, #2]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	str r0, [r4, #0xc]
	cmp r0, r6
	beq _08000AB8
	str r4, [r0, #8]
_08000AB8:
	cmp r4, r6
	beq _08000AF6
	ldr r0, [r4, #8]
	ldrh r5, [r0]
	cmp r5, #0
	bne _08000AF6
	ldrh r1, [r0, #2]
	ldr r0, _08000AFC
	cmp r1, r0
	beq _08000AD8
	ldr r0, _08000B00
	ldr r2, _08000B10
	movs r1, #0xe4
	movs r3, #1
	bl AGBAssert
_08000AD8:
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	str r0, [r1, #0xc]
	ldr r1, [r4, #0xc]
	cmp r1, r6
	beq _08000AE8
	ldr r0, [r4, #8]
	str r0, [r1, #8]
_08000AE8:
	strh r5, [r4, #2]
	ldr r0, [r4, #8]
	ldr r1, [r0, #4]
	adds r1, #0x10
	ldr r2, [r4, #4]
	adds r1, r1, r2
	str r1, [r0, #4]
_08000AF6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000AFC: .4byte 0x0000A3A3
_08000B00: .4byte 0x0829BDF4
_08000B04: .4byte 0x0829BE18
_08000B08: .4byte 0x0829BE40
_08000B0C: .4byte 0x0829BE54
_08000B10: .4byte 0x0829BE80
	thumb_func_end FreeInternal

	thumb_func_start AllocZeroedInternal
AllocZeroedInternal: @ 0x08000B14
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	bl AllocInternal
	adds r5, r0, #0
	cmp r5, #0
	beq _08000B48
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	beq _08000B32
	lsrs r0, r4, #2
	adds r0, #1
	lsls r4, r0, #2
_08000B32:
	movs r0, #0
	str r0, [sp]
	lsls r2, r4, #9
	lsrs r2, r2, #0xb
	movs r0, #0xa0
	lsls r0, r0, #0x13
	orrs r2, r0
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
_08000B48:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AllocZeroedInternal

	thumb_func_start CheckMemBlockInternal
CheckMemBlockInternal: @ 0x08000B54
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	subs r3, #0x10
	ldrh r2, [r3, #2]
	ldr r0, _08000BA0
	cmp r2, r0
	bne _08000B9A
	ldr r0, [r3, #0xc]
	ldrh r1, [r0, #2]
	adds r4, r0, #0
	cmp r1, r2
	bne _08000B9A
	cmp r4, r5
	beq _08000B78
	ldr r0, [r4, #8]
	cmp r0, r3
	bne _08000B9A
_08000B78:
	ldr r2, [r3, #8]
	ldrh r1, [r2, #2]
	ldr r0, _08000BA0
	cmp r1, r0
	bne _08000B9A
	cmp r2, r5
	beq _08000B8C
	ldr r0, [r2, #0xc]
	cmp r0, r3
	bne _08000B9A
_08000B8C:
	cmp r4, r5
	beq _08000BA4
	ldr r0, [r3, #4]
	adds r0, #0x10
	adds r0, r3, r0
	cmp r4, r0
	beq _08000BA4
_08000B9A:
	movs r0, #0
	b _08000BA6
	.align 2, 0
_08000BA0: .4byte 0x0000A3A3
_08000BA4:
	movs r0, #1
_08000BA6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CheckMemBlockInternal

	thumb_func_start InitHeap
InitHeap: @ 0x08000BAC
	push {lr}
	ldr r2, _08000BC0
	str r0, [r2]
	ldr r2, _08000BC4
	str r1, [r2]
	bl PutFirstMemBlockHeader
	pop {r0}
	bx r0
	.align 2, 0
_08000BC0: .4byte 0x03000004
_08000BC4: .4byte 0x03000008
	thumb_func_end InitHeap

	thumb_func_start Alloc
Alloc: @ 0x08000BC8
	push {lr}
	adds r1, r0, #0
	ldr r0, _08000BD8
	ldr r0, [r0]
	bl AllocInternal
	pop {r1}
	bx r1
	.align 2, 0
_08000BD8: .4byte 0x03000004
	thumb_func_end Alloc

	thumb_func_start AllocZeroed
AllocZeroed: @ 0x08000BDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _08000BEC
	ldr r0, [r0]
	bl AllocZeroedInternal
	pop {r1}
	bx r1
	.align 2, 0
_08000BEC: .4byte 0x03000004
	thumb_func_end AllocZeroed

	thumb_func_start Free
Free: @ 0x08000BF0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08000C00
	ldr r0, [r0]
	bl FreeInternal
	pop {r0}
	bx r0
	.align 2, 0
_08000C00: .4byte 0x03000004
	thumb_func_end Free

	thumb_func_start CheckMemBlock
CheckMemBlock: @ 0x08000C04
	push {lr}
	adds r1, r0, #0
	ldr r0, _08000C14
	ldr r0, [r0]
	bl CheckMemBlockInternal
	pop {r1}
	bx r1
	.align 2, 0
_08000C14: .4byte 0x03000004
	thumb_func_end CheckMemBlock

	thumb_func_start CheckHeap
CheckHeap: @ 0x08000C18
	push {r4, r5, lr}
	ldr r0, _08000C3C
	ldr r4, [r0]
	adds r5, r0, #0
_08000C20:
	ldr r0, [r5]
	adds r1, r4, #0
	adds r1, #0x10
	bl CheckMemBlockInternal
	cmp r0, #0
	beq _08000C40
	ldr r4, [r4, #0xc]
	ldr r0, [r5]
	cmp r4, r0
	bne _08000C20
	movs r0, #1
	b _08000C42
	.align 2, 0
_08000C3C: .4byte 0x03000004
_08000C40:
	movs r0, #0
_08000C42:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CheckHeap

