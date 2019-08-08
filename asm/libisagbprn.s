.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AGBPrintInit
AGBPrintInit: @ 0x08295600
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	ldr r0, _0829567C
	str r0, [r7]
	ldr r0, _08295680
	str r0, [r7, #4]
	ldr r0, _08295684
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7, #4]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #4]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldrh r3, [r2, #6]
	movs r4, #0
	ands r3, r4
	adds r4, r3, #0
	strh r4, [r2, #6]
	ldrh r2, [r1, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	strh r3, [r1, #4]
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xfd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, [r7, #8]
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0829567C: .4byte 0x09FE20F8
_08295680: .4byte 0x04000204
_08295684: .4byte 0x09FE2FFE
	thumb_func_end AGBPrintInit

	thumb_func_start AGBPutcInternal
AGBPutcInternal: @ 0x08295688
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	ldr r0, _08295708
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #2]
	lsls r2, r1, #0x10
	lsrs r0, r2, #0x10
	lsls r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #0x14
	adds r0, r1, r2
	str r0, [r7, #8]
	ldr r0, _0829570C
	str r0, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r7, #4]
	ldrh r2, [r1, #6]
	lsls r1, r2, #0x10
	lsrs r2, r1, #0x10
	lsrs r1, r2, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	movs r1, #0x20
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r7, #4]
	ldrh r2, [r1, #6]
	movs r3, #1
	adds r1, r2, #0
	ands r1, r3
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	cmp r1, #0
	beq _08295710
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r2, [r1]
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	adds r2, r7, #0
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #8
	adds r2, r3, #0
	adds r3, r1, #0
	orrs r3, r2
	adds r1, r3, #0
	b _08295728
	.align 2, 0
_08295708: .4byte 0x09FE20F8
_0829570C: .4byte 0x09FE2FFE
_08295710:
	adds r2, r7, #0
	adds r2, #0x10
	ldrh r3, [r2]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r2, r3, #0
	ands r2, r4
	adds r3, r7, #0
	ldrb r4, [r3]
	adds r3, r4, #0
	orrs r3, r2
	adds r1, r3, #0
_08295728:
	strh r1, [r0]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #6]
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	lsrs r0, r1, #1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldrh r2, [r1, #6]
	adds r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r0, [r7, #0xc]
	movs r1, #0
	strh r1, [r0]
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AGBPutcInternal

	thumb_func_start AGBPutc
AGBPutc: @ 0x08295774
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	ldr r0, _082957CC
	str r0, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7, #4]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #4]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	ldrb r1, [r0]
	adds r0, r1, #0
	bl AGBPutcInternal
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _082957D0
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r0, [r1, #6]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1, #4]
	subs r1, r2, #1
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	cmp r0, r1
	bne _082957C4
	bl AGBPrintFlush1Block
_082957C4:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_082957CC: .4byte 0x04000204
_082957D0: .4byte 0x09FE20F8
	thumb_func_end AGBPutc

	thumb_func_start AGBPrint
AGBPrint: @ 0x082957D4
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, _08295804
	str r0, [r7, #4]
	ldr r0, _08295808
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7, #8]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #8]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
_082957F8:
	ldr r0, [r7]
	ldrb r1, [r0]
	cmp r1, #0
	bne _0829580C
	b _0829581E
	.align 2, 0
_08295804: .4byte 0x09FE20F8
_08295808: .4byte 0x04000204
_0829580C:
	ldr r0, [r7]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl AGBPutc
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _082957F8
_0829581E:
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	thumb_func_end AGBPrint

	thumb_func_start AGBPrintf
AGBPrintf: @ 0x08295830
	push {r0, r1, r2, r3}
	push {r7, lr}
	sub sp, #0x104
	mov r7, sp
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r1, r7, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r7, r3
	str r0, [r2]
	adds r0, r7, #0
	adds r1, r7, #0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r3, r7, r1
	ldr r2, [r3]
	movs r3, #0x86
	lsls r3, r3, #1
	adds r3, r3, r7
	ldr r1, [r3]
	bl vsprintf
	adds r1, r7, #0
	adds r0, r1, #0
	bl AGBPrint
	add sp, #0x104
	pop {r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end AGBPrintf

	thumb_func_start AGBPrintTransferDataInternal
AGBPrintTransferDataInternal: @ 0x08295874
	push {r4, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	ldr r0, _082958DC
	str r0, [r7, #0x18]
	ldr r0, _082958E0
	str r0, [r7, #0x1c]
	ldr r0, _082958E4
	str r0, [r7, #4]
	ldr r0, _082958E8
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7, #8]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _082958EC
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x10]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	ldr r3, _082958F0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	cmp r0, #0
	beq _0829590A
_082958C6:
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldrh r1, [r1, #6]
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldrh r0, [r0, #4]
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	bne _082958F4
	b _08295908
	.align 2, 0
_082958DC: .4byte 0x09FE2FFE
_082958E0: .4byte 0x09FE20F8
_082958E4: .4byte 0x09FE209D
_082958E8: .4byte 0x04000208
_082958EC: .4byte 0x04000204
_082958F0: .4byte 0x0000FFFE
_082958F4:
	ldr r0, [r7, #0x18]
	movs r1, #0x20
	strh r1, [r0]
	ldr r4, [r7, #4]
	bl _call_via_r4
	ldr r0, [r7, #0x18]
	movs r1, #0
	strh r1, [r0]
	b _082958C6
_08295908:
	b _08295930
_0829590A:
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldrh r1, [r1, #6]
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldrh r0, [r0, #4]
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _08295930
	ldr r0, [r7, #0x18]
	movs r1, #0x20
	strh r1, [r0]
	ldr r4, [r7, #4]
	bl _call_via_r4
	ldr r0, [r7, #0x18]
	movs r1, #0
	strh r1, [r0]
_08295930:
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0x14
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #0x20
	pop {r4, r7}
	pop {r0}
	bx r0
	thumb_func_end AGBPrintTransferDataInternal

	thumb_func_start AGBPrintFlush1Block
AGBPrintFlush1Block: @ 0x0829594C
	push {r7, lr}
	mov r7, sp
	movs r0, #0
	bl AGBPrintTransferDataInternal
	pop {r7}
	pop {r0}
	bx r0
	thumb_func_end AGBPrintFlush1Block

	thumb_func_start AGBPrintFlush
AGBPrintFlush: @ 0x0829595C
	push {r7, lr}
	mov r7, sp
	movs r0, #1
	bl AGBPrintTransferDataInternal
	pop {r7}
	pop {r0}
	bx r0
	thumb_func_end AGBPrintFlush

	thumb_func_start AGBAssert
AGBAssert: @ 0x0829596C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _08295998
	ldr r0, _08295994
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl AGBPrintf
	bl AGBPrintFlush
	.hword 0xEFFF
	b _082959A4
	.align 2, 0
_08295994: .4byte 0x0890EEF4
_08295998:
	ldr r0, _082959AC
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl AGBPrintf
_082959A4:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_082959AC: .4byte 0x0890EF28
	thumb_func_end AGBAssert

