.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start LoadCompressedPalette
LoadCompressedPalette: @ 0x080A11BC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	ldr r6, _080A11F4
	adds r1, r6, #0
	bl LZDecompressVram
	lsls r4, r4, #1
	ldr r1, _080A11F8
	adds r1, r4, r1
	lsrs r5, r5, #0x11
	adds r0, r6, #0
	adds r2, r5, #0
	bl CpuSet
	ldr r0, _080A11FC
	adds r4, r4, r0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A11F4: .4byte 0x02037C88
_080A11F8: .4byte 0x020373B4
_080A11FC: .4byte 0x020377B4
	thumb_func_end LoadCompressedPalette

	thumb_func_start LoadPalette
LoadPalette: @ 0x080A1200
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r4, r4, #0xf
	ldr r1, _080A1230
	adds r1, r4, r1
	lsrs r5, r5, #0x11
	adds r2, r5, #0
	bl CpuSet
	ldr r0, _080A1234
	adds r4, r4, r0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1230: .4byte 0x020373B4
_080A1234: .4byte 0x020377B4
	thumb_func_end LoadPalette

	thumb_func_start FillPalette
FillPalette: @ 0x080A1238
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	mov r0, sp
	strh r6, [r0]
	lsrs r4, r4, #0xf
	ldr r1, _080A1280
	adds r1, r4, r1
	lsrs r5, r5, #0x11
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r5, r0
	mov r0, sp
	adds r2, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r6, [r0]
	ldr r1, _080A1284
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuSet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1280: .4byte 0x020373B4
_080A1284: .4byte 0x020377B4
	thumb_func_end FillPalette

	thumb_func_start TransferPlttBuffer
TransferPlttBuffer: @ 0x080A1288
	push {r4, r5, lr}
	ldr r4, _080A12D0
	ldrb r1, [r4, #8]
	movs r5, #0x80
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _080A12CA
	ldr r1, _080A12D4
	movs r2, #0xa0
	lsls r2, r2, #0x13
	ldr r0, _080A12D8
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _080A12DC
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _080A12E0
	str r3, [r0]
	ldrb r1, [r4, #9]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _080A12CA
	ldrb r1, [r4, #7]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080A12CA
	bl UpdateBlendRegisters
_080A12CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A12D0: .4byte 0x02037C74
_080A12D4: .4byte 0x020377B4
_080A12D8: .4byte 0x040000D4
_080A12DC: .4byte 0x80000200
_080A12E0: .4byte 0x02037C84
	thumb_func_end TransferPlttBuffer

	thumb_func_start UpdatePaletteFade
UpdatePaletteFade: @ 0x080A12E4
	push {lr}
	ldr r0, _080A12F4
	ldr r0, [r0]
	cmp r0, #0
	beq _080A12F8
	movs r0, #0xff
	b _080A1330
	.align 2, 0
_080A12F4: .4byte 0x02037C84
_080A12F8:
	ldr r0, _080A130C
	ldrb r0, [r0, #9]
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080A1310
	bl UpdateNormalPaletteFade
	b _080A131E
	.align 2, 0
_080A130C: .4byte 0x02037C74
_080A1310:
	cmp r1, #1
	bne _080A131A
	bl UpdateFastPaletteFade
	b _080A131E
_080A131A:
	bl UpdateHardwarePaletteFade
_080A131E:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _080A1334
	ldr r0, _080A1338
	ldr r0, [r0]
	movs r1, #0
	orrs r0, r1
	str r0, [r2]
	adds r0, r3, #0
_080A1330:
	pop {r1}
	bx r1
	.align 2, 0
_080A1334: .4byte 0x02037C84
_080A1338: .4byte 0x02037C74
	thumb_func_end UpdatePaletteFade

	thumb_func_start ResetPaletteFade
ResetPaletteFade: @ 0x080A133C
	push {r4, lr}
	movs r4, #0
_080A1340:
	adds r0, r4, #0
	bl ResetPaletteStruct
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080A1340
	bl ResetPaletteFadeControl
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetPaletteFade

	thumb_func_start ReadPlttIntoBuffers
ReadPlttIntoBuffers: @ 0x080A135C
	push {r4, r5, r6, r7, lr}
	movs r0, #0xa0
	lsls r0, r0, #0x13
	mov ip, r0
	movs r4, #0
	ldr r7, _080A1390
	ldr r6, _080A1394
	ldr r5, _080A1398
_080A136C:
	lsls r1, r4, #1
	adds r3, r1, r7
	mov r0, ip
	adds r2, r1, r0
	ldrh r0, [r2]
	strh r0, [r3]
	adds r1, r1, r6
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	bls _080A136C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1390: .4byte 0x020373B4
_080A1394: .4byte 0x020377B4
_080A1398: .4byte 0x000001FF
	thumb_func_end ReadPlttIntoBuffers

	thumb_func_start BeginNormalPaletteFade
BeginNormalPaletteFade: @ 0x080A139C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, [sp, #0x18]
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r5, _080A13CC
	ldrb r1, [r5, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A13D0
	movs r0, #0
	b _080A14C8
	.align 2, 0
_080A13CC: .4byte 0x02037C74
_080A13D0:
	ldrb r0, [r5, #0xa]
	movs r3, #0x79
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r2, r0
	movs r0, #0x10
	orrs r2, r0
	strb r2, [r5, #0xa]
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bge _080A13FE
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1c
	rsbs r1, r1, #0
	adds r0, r0, r1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #3
	ands r2, r3
	orrs r2, r0
	strb r2, [r5, #0xa]
	movs r6, #0
_080A13FE:
	str r4, [r5]
	movs r4, #0x3f
	adds r1, r6, #0
	ands r1, r4
	ldrb r2, [r5, #4]
	movs r3, #0x40
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #4]
	ands r6, r4
	ldrb r0, [r5, #8]
	ands r3, r0
	orrs r3, r6
	strb r3, [r5, #8]
	movs r0, #0x1f
	mov r1, ip
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r5, #4]
	ldr r0, _080A146C
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	lsls r2, r7, #3
	ldrb r1, [r5, #5]
	movs r0, #7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	ldr r1, _080A1470
	mov r0, r8
	ands r1, r0
	ldrh r2, [r5, #6]
	ldr r0, _080A1474
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #6]
	ldrb r0, [r5, #7]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5, #7]
	ldrb r1, [r5, #9]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #9]
	cmp ip, r7
	bhs _080A1478
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r3, r0
	b _080A147C
	.align 2, 0
_080A146C: .4byte 0xFFFFF83F
_080A1470: .4byte 0x00007FFF
_080A1474: .4byte 0xFFFF8000
_080A1478:
	movs r0, #0x40
	orrs r3, r0
_080A147C:
	strb r3, [r5, #8]
	bl UpdatePaletteFade
	ldr r4, _080A14D4
	ldrb r1, [r4, #8]
	lsrs r5, r1, #7
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #8]
	ldr r0, _080A14D8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _080A14DC
	bl CpuSet
	ldr r1, _080A14E0
	movs r0, #0
	str r0, [r1]
	ldrb r1, [r4, #9]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _080A14B8
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A14B8
	bl UpdateBlendRegisters
_080A14B8:
	ldr r2, _080A14D4
	lsls r3, r5, #7
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #8]
	movs r0, #1
_080A14C8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A14D4: .4byte 0x02037C74
_080A14D8: .4byte 0x020377B4
_080A14DC: .4byte 0x04000100
_080A14E0: .4byte 0x02037C84
	thumb_func_end BeginNormalPaletteFade

	thumb_func_start unref_sub_80A1C1C
unref_sub_80A1C1C: @ 0x080A14E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	ldr r5, [sp, #0x1c]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r3, [sp, #4]
	bl ReadPlttIntoBuffers
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r5, [sp]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	ldr r3, [sp, #4]
	bl BeginNormalPaletteFade
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80A1C1C

	thumb_func_start unref_sub_80A1C64
unref_sub_80A1C64: @ 0x080A152C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r5, #0
_080A1536:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _080A1584
	adds r4, r0, r1
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080A1594
	ldr r2, [r4]
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, r7
	bne _080A1594
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x19
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	cmp r1, r0
	bne _080A1572
	adds r0, r4, #0
	bl unused_sub_80A1F00
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080A1594
_080A1572:
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _080A1588
	adds r0, r4, #0
	adds r1, r6, #0
	bl unused_sub_80A1CDC
	b _080A158C
	.align 2, 0
_080A1584: .4byte 0x02037BB4
_080A1588:
	subs r0, #1
	strb r0, [r4, #8]
_080A158C:
	adds r0, r4, #0
	adds r1, r6, #0
	bl unused_sub_80A1E40
_080A1594:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _080A1536
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80A1C64

	thumb_func_start unused_sub_80A1CDC
unused_sub_80A1CDC: @ 0x080A15A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	movs r6, #0
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x19
	ldr r3, [r4]
	ldrb r0, [r3, #9]
	lsls r2, r0, #0x19
	lsrs r0, r2, #0x1b
	adds r5, r1, #0
	muls r5, r0, r5
	ldrb r1, [r3, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A1640
	lsrs r0, r2, #0x1b
	cmp r6, r0
	bhs _080A168C
	ldr r0, _080A1630
	mov ip, r0
	ldr r7, _080A1634
_080A15D8:
	ldr r0, [r4, #4]
	lsls r0, r0, #0xb
	lsrs r0, r0, #0x16
	lsls r0, r0, #1
	add r0, ip
	ldr r1, [r3, #4]
	lsls r2, r5, #1
	adds r1, r2, r1
	ldrh r1, [r1]
	strh r1, [r0]
	ldr r0, [r4, #4]
	lsls r0, r0, #0xb
	lsrs r0, r0, #0x16
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r1, [r4]
	ldr r1, [r1, #4]
	adds r2, r2, r1
	ldrh r1, [r2]
	strh r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [r4, #4]
	lsls r1, r2, #0xb
	lsrs r1, r1, #0x16
	adds r1, #1
	ldr r0, _080A1638
	ands r1, r0
	lsls r1, r1, #0xb
	ldr r0, _080A163C
	ands r0, r2
	orrs r0, r1
	str r0, [r4, #4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, [r4]
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	cmp r6, r0
	blo _080A15D8
	b _080A168C
	.align 2, 0
_080A1630: .4byte 0x020373B4
_080A1634: .4byte 0x020377B4
_080A1638: .4byte 0x000003FF
_080A163C: .4byte 0xFFE007FF
_080A1640:
	lsrs r0, r2, #0x1b
	cmp r6, r0
	bhs _080A168C
	ldr r3, _080A16F8
_080A1648:
	ldr r1, [r4, #4]
	lsls r1, r1, #0xb
	lsrs r1, r1, #0x16
	lsls r1, r1, #1
	adds r1, r1, r3
	ldr r0, [r4]
	ldr r2, [r0, #4]
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [r4, #4]
	lsls r1, r2, #0xb
	lsrs r1, r1, #0x16
	adds r1, #1
	ldr r0, _080A16FC
	ands r1, r0
	lsls r1, r1, #0xb
	ldr r0, _080A1700
	ands r0, r2
	orrs r0, r1
	str r0, [r4, #4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	cmp r6, r0
	blo _080A1648
_080A168C:
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x17
	lsls r0, r0, #0xb
	ldr r1, [r4, #4]
	ldr r2, _080A1700
	ands r1, r2
	orrs r1, r0
	str r1, [r4, #4]
	ldr r3, [r4]
	ldrb r0, [r3, #0xa]
	strb r0, [r4, #8]
	ldrh r2, [r4, #6]
	lsls r0, r2, #0x14
	lsrs r0, r0, #0x19
	adds r0, #1
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #5
	ldr r5, _080A1704
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, #6]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x19
	ldrb r0, [r3, #0xb]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	cmp r1, r0
	blt _080A16DC
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _080A16D4
	subs r0, #1
	strb r0, [r4, #9]
_080A16D4:
	ldrh r1, [r4, #6]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r4, #6]
_080A16DC:
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	movs r1, #1
	lsls r1, r0
	mov r2, r8
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A16F8: .4byte 0x020377B4
_080A16FC: .4byte 0x000003FF
_080A1700: .4byte 0xFFE007FF
_080A1704: .4byte 0xFFFFF01F
	thumb_func_end unused_sub_80A1CDC

	thumb_func_start unused_sub_80A1E40
unused_sub_80A1E40: @ 0x080A1708
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, _080A1760
	ldrb r1, [r3, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A17BC
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x15
	lsrs r6, r0, #0x17
	asrs r1, r6, #4
	movs r5, #1
	adds r0, r5, #0
	lsls r0, r1
	ldr r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _080A17BC
	ldr r2, [r4]
	ldrb r1, [r2, #8]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _080A1764
	ldrb r1, [r3, #4]
	lsls r1, r1, #0x1a
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x1a
	cmp r1, r0
	beq _080A17BC
	adds r0, r6, #0
	ldrb r1, [r2, #9]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1b
	ldrh r2, [r3, #4]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x1b
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x11
	bl BlendPalette
	b _080A17BC
	.align 2, 0
_080A1760: .4byte 0x02037C74
_080A1764:
	ldrb r1, [r3, #4]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _080A17BC
	ldrb r0, [r4, #8]
	ldrb r1, [r2, #0xa]
	cmp r0, r1
	beq _080A17BC
	ldrh r0, [r4, #6]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x19
	ldrb r1, [r2, #9]
	lsls r1, r1, #0x19
	lsrs r2, r1, #0x1b
	adds r5, r0, #0
	muls r5, r2, r5
	movs r3, #0
	adds r1, r2, #0
	cmp r3, r1
	bhs _080A17BC
	ldr r6, _080A17C4
_080A1790:
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x17
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r6
	ldr r2, [r4]
	adds r0, r5, r3
	ldr r2, [r2, #4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	cmp r3, r0
	blo _080A1790
_080A17BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A17C4: .4byte 0x020377B4
	thumb_func_end unused_sub_80A1E40

	thumb_func_start unused_sub_80A1F00
unused_sub_80A1F00: @ 0x080A17C8
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #9]
	cmp r0, #0
	bne _080A1818
	ldr r2, [r3]
	ldrb r0, [r2, #0xb]
	lsrs r0, r0, #5
	cmp r0, #0
	bne _080A1808
	ldrh r1, [r3, #6]
	ldr r0, _080A1800
	ands r0, r1
	strh r0, [r3, #6]
	ldrb r0, [r2, #0xa]
	strb r0, [r3, #8]
	ldrb r0, [r2, #0xc]
	strb r0, [r3, #9]
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x17
	lsls r0, r0, #0xb
	ldr r1, [r3, #4]
	ldr r2, _080A1804
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #4]
	b _080A181C
	.align 2, 0
_080A1800: .4byte 0xFFFFF01F
_080A1804: .4byte 0xFFE007FF
_080A1808:
	cmp r0, #0
	blt _080A181C
	cmp r0, #2
	bgt _080A181C
	ldrh r0, [r2]
	bl ResetPaletteStructByUid
	b _080A181C
_080A1818:
	subs r0, #1
	strb r0, [r3, #9]
_080A181C:
	pop {r0}
	bx r0
	thumb_func_end unused_sub_80A1F00

	thumb_func_start ResetPaletteStructByUid
ResetPaletteStructByUid: @ 0x080A1820
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetPaletteNumByUid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _080A1836
	bl ResetPaletteStruct
_080A1836:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetPaletteStructByUid

	thumb_func_start ResetPaletteStruct
ResetPaletteStruct: @ 0x080A183C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080A1884
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, _080A1888
	str r0, [r1]
	ldrb r2, [r1, #4]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #4]
	ldrh r2, [r1, #4]
	ldr r0, _080A188C
	ands r0, r2
	strh r0, [r1, #4]
	ldr r0, [r1, #4]
	ldr r2, _080A1890
	ands r0, r2
	str r0, [r1, #4]
	ldrh r2, [r1, #6]
	ldr r0, _080A1894
	ands r0, r2
	strh r0, [r1, #6]
	ldrb r2, [r1, #4]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	bx lr
	.align 2, 0
_080A1884: .4byte 0x02037BB4
_080A1888: .4byte 0x084FCF98
_080A188C: .4byte 0xFFFFF803
_080A1890: .4byte 0xFFE007FF
_080A1894: .4byte 0xFFFFF01F
	thumb_func_end ResetPaletteStruct

	thumb_func_start ResetPaletteFadeControl
ResetPaletteFadeControl: @ 0x080A1898
	ldr r2, _080A1900
	movs r0, #0
	str r0, [r2]
	subs r0, #0x40
	ldrb r1, [r2, #4]
	ands r0, r1
	strb r0, [r2, #4]
	ldrh r1, [r2, #4]
	ldr r0, _080A1904
	ands r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r2, #5]
	movs r0, #7
	ands r0, r1
	strb r0, [r2, #5]
	ldrh r1, [r2, #6]
	ldr r0, _080A1908
	ands r0, r1
	strh r0, [r2, #6]
	ldrb r1, [r2, #7]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #7]
	movs r0, #0
	strb r0, [r2, #8]
	ldrb r1, [r2, #9]
	movs r3, #5
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldrb r1, [r2, #0xa]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xa]
	ldr r0, [r2, #8]
	ldr r1, _080A190C
	ands r0, r1
	str r0, [r2, #8]
	ldrb r0, [r2, #0xa]
	ands r3, r0
	movs r0, #0x79
	rsbs r0, r0, #0
	ands r3, r0
	movs r0, #0x10
	orrs r3, r0
	strb r3, [r2, #0xa]
	bx lr
	.align 2, 0
_080A1900: .4byte 0x02037C74
_080A1904: .4byte 0xFFFFF83F
_080A1908: .4byte 0xFFFF8000
_080A190C: .4byte 0xFFFE0FFF
	thumb_func_end ResetPaletteFadeControl

	thumb_func_start unref_sub_80A2048
unref_sub_80A2048: @ 0x080A1910
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetPaletteNumByUid
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x10
	beq _080A1934
	ldr r1, _080A1938
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #4]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0, #4]
_080A1934:
	pop {r0}
	bx r0
	.align 2, 0
_080A1938: .4byte 0x02037BB4
	thumb_func_end unref_sub_80A2048

	thumb_func_start unref_sub_80A2074
unref_sub_80A2074: @ 0x080A193C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetPaletteNumByUid
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x10
	beq _080A1962
	ldr r0, _080A1968
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #4]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #4]
_080A1962:
	pop {r0}
	bx r0
	.align 2, 0
_080A1968: .4byte 0x02037BB4
	thumb_func_end unref_sub_80A2074

	thumb_func_start GetPaletteNumByUid
GetPaletteNumByUid: @ 0x080A196C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	ldr r3, _080A198C
_080A1976:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, r2
	bne _080A1990
	adds r0, r1, #0
	b _080A199C
	.align 2, 0
_080A198C: .4byte 0x02037BB4
_080A1990:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _080A1976
	movs r0, #0x10
_080A199C:
	pop {r1}
	bx r1
	thumb_func_end GetPaletteNumByUid

	thumb_func_start UpdateNormalPaletteFade
UpdateNormalPaletteFade: @ 0x080A19A0
	push {r4, r5, r6, r7, lr}
	ldr r4, _080A19B4
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080A19B8
	movs r0, #0
	b _080A1AD4
	.align 2, 0
_080A19B4: .4byte 0x02037C74
_080A19B8:
	bl IsSoftwarePaletteFadeFinishing
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A19C6
	ldrb r0, [r4, #7]
	b _080A1AD2
_080A19C6:
	ldrb r1, [r4, #0xa]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080A19FA
	ldrb r2, [r4, #4]
	lsls r1, r2, #0x1a
	ldrb r0, [r4, #8]
	lsls r0, r0, #0x1a
	cmp r1, r0
	bhs _080A19F2
	lsrs r0, r1, #0x1a
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	movs r1, #0x40
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #4]
	movs r0, #2
	b _080A1AD4
_080A19F2:
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r4, #4]
_080A19FA:
	movs r5, #0
	ldr r2, _080A1A10
	ldrb r1, [r2, #0xa]
	movs r0, #4
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	bne _080A1A14
	ldrh r4, [r7]
	b _080A1A1A
	.align 2, 0
_080A1A10: .4byte 0x02037C74
_080A1A14:
	ldrh r4, [r7, #2]
	movs r5, #0x80
	lsls r5, r5, #1
_080A1A1A:
	cmp r4, #0
	beq _080A1A4C
	ldr r7, _080A1A88
	adds r6, r7, #0
_080A1A22:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080A1A3E
	ldrh r2, [r6, #4]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x1b
	ldrh r3, [r6, #6]
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x11
	adds r0, r5, #0
	movs r1, #0x10
	bl BlendPalette
_080A1A3E:
	lsrs r4, r4, #1
	adds r0, r5, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, #0
	bne _080A1A22
_080A1A4C:
	ldrb r2, [r7, #0xa]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r4, #5
	rsbs r4, r4, #0
	ands r4, r2
	orrs r4, r1
	strb r4, [r7, #0xa]
	movs r0, #4
	ands r0, r4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _080A1AD0
	ldrh r6, [r7, #4]
	lsls r2, r6, #0x15
	ldrb r0, [r7, #5]
	lsls r5, r0, #0x18
	lsrs r1, r2, #0x1b
	lsrs r0, r5, #0x1b
	cmp r1, r0
	bne _080A1A8C
	str r3, [r7]
	movs r0, #2
	orrs r4, r0
	strb r4, [r7, #0xa]
	b _080A1AD0
	.align 2, 0
_080A1A88: .4byte 0x02037C74
_080A1A8C:
	ldrb r1, [r7, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A1AA8
	lsrs r3, r2, #0x1b
	lsls r0, r4, #0x19
	lsrs r0, r0, #0x1c
	adds r3, r0, r3
	lsrs r0, r5, #0x1b
	cmp r3, r0
	ble _080A1ABE
	adds r3, r0, #0
	b _080A1ABE
_080A1AA8:
	lsrs r3, r2, #0x1b
	lsls r0, r4, #0x19
	lsrs r0, r0, #0x1c
	subs r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r5, #0x1b
	cmp r0, r1
	bge _080A1ABE
	adds r3, r1, #0
_080A1ABE:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _080A1ADC
	ands r1, r6
	orrs r1, r0
	strh r1, [r7, #4]
_080A1AD0:
	ldrb r0, [r7, #7]
_080A1AD2:
	lsrs r0, r0, #7
_080A1AD4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A1ADC: .4byte 0xFFFFF83F
	thumb_func_end UpdateNormalPaletteFade

	thumb_func_start InvertPlttBuffer
InvertPlttBuffer: @ 0x080A1AE0
	push {r4, r5, r6, r7, lr}
	adds r1, r0, #0
	movs r3, #0
	cmp r1, #0
	beq _080A1B1E
	ldr r7, _080A1B24
_080A1AEC:
	movs r0, #1
	ands r0, r1
	lsrs r4, r1, #1
	adds r5, r3, #0
	adds r5, #0x10
	cmp r0, #0
	beq _080A1B14
	movs r2, #0
	adds r6, r7, #0
_080A1AFE:
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	mvns r1, r1
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080A1AFE
_080A1B14:
	adds r1, r4, #0
	lsls r0, r5, #0x10
	lsrs r3, r0, #0x10
	cmp r1, #0
	bne _080A1AEC
_080A1B1E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B24: .4byte 0x020377B4
	thumb_func_end InvertPlttBuffer

	thumb_func_start TintPlttBuffer
TintPlttBuffer: @ 0x080A1B28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	movs r0, #0
	mov sb, r0
	cmp r4, #0
	beq _080A1BE4
	lsls r1, r1, #0x18
	str r1, [sp, #8]
_080A1B52:
	movs r0, #1
	ands r0, r4
	lsrs r4, r4, #1
	str r4, [sp, #0xc]
	movs r1, #0x10
	add r1, sb
	mov sl, r1
	cmp r0, #0
	beq _080A1BD6
	movs r4, #0
	ldr r2, _080A1BF4
	mov r8, r2
	ldr r1, [sp]
	lsls r0, r1, #0x18
	ldr r2, [sp, #4]
	lsls r1, r2, #0x18
	ldr r2, [sp, #8]
	asrs r2, r2, #0x18
	mov ip, r2
	movs r5, #0x1f
	asrs r7, r0, #0x18
	asrs r6, r1, #0x18
_080A1B7E:
	mov r0, sb
	adds r2, r0, r4
	lsls r2, r2, #1
	add r2, r8
	ldr r1, [r2]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	add r1, ip
	ands r1, r5
	ldrb r3, [r2]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r2]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x1b
	adds r1, r1, r7
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #5
	ldrh r3, [r2]
	ldr r0, _080A1BF8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	ldr r1, [r2]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	adds r1, r1, r6
	ands r1, r5
	lsls r1, r1, #2
	ldrb r3, [r2, #1]
	movs r0, #0x7d
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080A1B7E
_080A1BD6:
	ldr r4, [sp, #0xc]
	mov r1, sl
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r4, #0
	bne _080A1B52
_080A1BE4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1BF4: .4byte 0x020377B4
_080A1BF8: .4byte 0xFFFFFC1F
	thumb_func_end TintPlttBuffer

	thumb_func_start UnfadePlttBuffer
UnfadePlttBuffer: @ 0x080A1BFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	movs r3, #0
	cmp r1, #0
	beq _080A1C46
	ldr r0, _080A1C50
	mov r8, r0
	ldr r0, _080A1C54
	mov ip, r0
_080A1C12:
	movs r0, #1
	ands r0, r1
	lsrs r4, r1, #1
	adds r5, r3, #0
	adds r5, #0x10
	cmp r0, #0
	beq _080A1C3C
	movs r2, #0
	mov r7, r8
	mov r6, ip
_080A1C26:
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r1, r0, r7
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080A1C26
_080A1C3C:
	adds r1, r4, #0
	lsls r0, r5, #0x10
	lsrs r3, r0, #0x10
	cmp r1, #0
	bne _080A1C12
_080A1C46:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C50: .4byte 0x020377B4
_080A1C54: .4byte 0x020373B4
	thumb_func_end UnfadePlttBuffer

	thumb_func_start BeginFastPaletteFade
BeginFastPaletteFade: @ 0x080A1C58
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080A1C78
	ldrb r2, [r3, #0xa]
	movs r1, #0x79
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #0xa]
	bl BeginFastPaletteFadeInternal
	pop {r0}
	bx r0
	.align 2, 0
_080A1C78: .4byte 0x02037C74
	thumb_func_end BeginFastPaletteFade

	thumb_func_start BeginFastPaletteFadeInternal
BeginFastPaletteFadeInternal: @ 0x080A1C7C
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	ldr r2, _080A1CF0
	ldrh r0, [r2, #4]
	movs r3, #0xf8
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #4]
	movs r1, #0x3f
	ands r1, r4
	ldrb r3, [r2, #8]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #8]
	ldrb r0, [r2, #7]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #7]
	ldrb r1, [r2, #9]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	cmp r4, #2
	bne _080A1CCE
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A1CF4
	ldr r2, _080A1CF8
	mov r0, sp
	bl CpuSet
_080A1CCE:
	cmp r4, #0
	bne _080A1CE4
	mov r0, sp
	adds r0, #2
	ldr r2, _080A1CFC
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _080A1CF4
	ldr r2, _080A1CF8
	bl CpuSet
_080A1CE4:
	bl UpdatePaletteFade
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CF0: .4byte 0x02037C74
_080A1CF4: .4byte 0x020377B4
_080A1CF8: .4byte 0x01000200
_080A1CFC: .4byte 0x00007FFF
	thumb_func_end BeginFastPaletteFadeInternal

	thumb_func_start UpdateFastPaletteFade
UpdateFastPaletteFade: @ 0x080A1D00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, _080A1D1C
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080A1D20
	movs r0, #0
	b _080A205A
	.align 2, 0
_080A1D1C: .4byte 0x02037C74
_080A1D20:
	bl IsSoftwarePaletteFadeFinishing
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A1D2E
	ldrb r0, [r4, #7]
	b _080A2058
_080A1D2E:
	ldrb r1, [r4, #0xa]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080A1D44
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0x80
	lsls r0, r0, #2
	mov sl, r0
	b _080A1D4C
_080A1D44:
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #1
	mov sl, r1
_080A1D4C:
	ldr r1, _080A1D64
	ldrb r0, [r1, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #1
	beq _080A1E0C
	cmp r0, #1
	bgt _080A1D68
	cmp r0, #0
	beq _080A1D76
	b _080A1F5C
	.align 2, 0
_080A1D64: .4byte 0x02037C74
_080A1D68:
	cmp r0, #2
	bne _080A1D6E
	b _080A1E70
_080A1D6E:
	cmp r0, #3
	bne _080A1D74
	b _080A1EF8
_080A1D74:
	b _080A1F5C
_080A1D76:
	adds r7, r2, #0
	cmp r7, sl
	blo _080A1D7E
	b _080A1F5C
_080A1D7E:
	lsls r2, r7, #1
	ldr r0, _080A1E04
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, #0x1b
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	mov ip, r0
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	mov r8, r1
	ldr r0, _080A1E08
	adds r2, r2, r0
	mov sb, r2
	ldr r1, [r2]
	lsls r2, r1, #0x1b
	lsrs r2, r2, #3
	movs r4, #0xfe
	lsls r4, r4, #0x18
	adds r2, r2, r4
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	subs r1, #2
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsrs r6, r2, #0x18
	asrs r2, r2, #0x18
	lsrs r3, r3, #3
	asrs r0, r3, #0x18
	cmp r2, r0
	bge _080A1DC8
	lsrs r6, r3, #0x18
_080A1DC8:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r2, ip
	lsls r1, r2, #0x18
	cmp r0, ip
	bge _080A1DD6
	lsrs r5, r1, #0x18
_080A1DD6:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	mov r3, r8
	lsls r1, r3, #0x18
	cmp r0, r8
	bge _080A1DE4
	lsrs r4, r1, #0x18
_080A1DE4:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r0, r5, #0x18
	asrs r0, r0, #0x13
	orrs r1, r0
	lsls r0, r4, #0x18
	asrs r0, r0, #0xe
	orrs r1, r0
	mov r4, sb
	strh r1, [r4]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, sl
	blo _080A1D7E
	b _080A1F5C
	.align 2, 0
_080A1E04: .4byte 0x020373B4
_080A1E08: .4byte 0x020377B4
_080A1E0C:
	adds r7, r2, #0
	cmp r7, sl
	blo _080A1E14
	b _080A1F5C
_080A1E14:
	lsls r1, r7, #1
	ldr r0, _080A1E6C
	adds r2, r1, r0
	ldr r1, [r2]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #3
	movs r3, #0x80
	lsls r3, r3, #0x12
	adds r0, r0, r3
	lsrs r6, r0, #0x18
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	adds r5, r0, #2
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	adds r4, r1, #2
	cmp r6, #0x1f
	ble _080A1E3A
	movs r6, #0x1f
_080A1E3A:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1f
	ble _080A1E44
	movs r5, #0x1f
_080A1E44:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1f
	ble _080A1E4E
	movs r4, #0x1f
_080A1E4E:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r0, r5, #0x18
	asrs r0, r0, #0x13
	orrs r1, r0
	lsls r0, r4, #0x18
	asrs r0, r0, #0xe
	orrs r1, r0
	strh r1, [r2]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, sl
	blo _080A1E14
	b _080A1F5C
	.align 2, 0
_080A1E6C: .4byte 0x020377B4
_080A1E70:
	adds r7, r2, #0
	cmp r7, sl
	bhs _080A1F5C
_080A1E76:
	lsls r2, r7, #1
	ldr r0, _080A1EF0
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, #0x1b
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	mov ip, r0
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	mov r8, r1
	ldr r0, _080A1EF4
	adds r2, r2, r0
	ldr r1, [r2]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #3
	movs r4, #0x80
	lsls r4, r4, #0x12
	adds r0, r0, r4
	lsrs r6, r0, #0x18
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	adds r5, r0, #2
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	adds r4, r1, #2
	lsrs r3, r3, #3
	asrs r0, r3, #0x18
	cmp r6, r0
	ble _080A1EB4
	lsrs r6, r3, #0x18
_080A1EB4:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r3, ip
	lsls r1, r3, #0x18
	cmp r0, ip
	ble _080A1EC2
	lsrs r5, r1, #0x18
_080A1EC2:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	mov r3, r8
	lsls r1, r3, #0x18
	cmp r0, r8
	ble _080A1ED0
	lsrs r4, r1, #0x18
_080A1ED0:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r0, r5, #0x18
	asrs r0, r0, #0x13
	orrs r1, r0
	lsls r0, r4, #0x18
	asrs r0, r0, #0xe
	orrs r1, r0
	strh r1, [r2]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, sl
	blo _080A1E76
	b _080A1F5C
	.align 2, 0
_080A1EF0: .4byte 0x020373B4
_080A1EF4: .4byte 0x020377B4
_080A1EF8:
	adds r7, r2, #0
	cmp r7, sl
	bhs _080A1F5C
	ldr r4, _080A1F84
	mov r8, r4
_080A1F02:
	lsls r0, r7, #1
	mov r1, r8
	adds r3, r0, r1
	ldr r1, [r3]
	lsls r2, r1, #0x1b
	lsrs r2, r2, #3
	movs r4, #0xfe
	lsls r4, r4, #0x18
	adds r2, r2, r4
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	subs r1, #2
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsrs r6, r2, #0x18
	cmp r2, #0
	bge _080A1F30
	movs r6, #0
_080A1F30:
	lsls r0, r5, #0x18
	cmp r0, #0
	bge _080A1F38
	movs r5, #0
_080A1F38:
	lsls r0, r4, #0x18
	cmp r0, #0
	bge _080A1F40
	movs r4, #0
_080A1F40:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r0, r5, #0x18
	asrs r0, r0, #0x13
	orrs r1, r0
	lsls r0, r4, #0x18
	asrs r0, r0, #0xe
	orrs r1, r0
	strh r1, [r3]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, sl
	blo _080A1F02
_080A1F5C:
	ldr r0, _080A1F88
	ldrb r2, [r0, #0xa]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r3, #5
	rsbs r3, r3, #0
	ands r3, r2
	orrs r3, r1
	ldr r1, _080A1F88
	strb r3, [r1, #0xa]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _080A1F8C
	ldrb r0, [r1, #7]
	b _080A2058
	.align 2, 0
_080A1F84: .4byte 0x020377B4
_080A1F88: .4byte 0x02037C74
_080A1F8C:
	ldr r2, _080A1FA8
	ldrh r4, [r2, #4]
	lsls r5, r4, #0x15
	lsrs r0, r5, #0x1b
	lsls r2, r3, #0x19
	lsrs r1, r2, #0x1c
	subs r0, r0, r1
	cmp r0, #0
	bge _080A1FB0
	ldr r0, _080A1FAC
	ands r0, r4
	ldr r3, _080A1FA8
	strh r0, [r3, #4]
	b _080A1FC6
	.align 2, 0
_080A1FA8: .4byte 0x02037C74
_080A1FAC: .4byte 0xFFFFF83F
_080A1FB0:
	lsrs r1, r5, #0x1b
	lsrs r0, r2, #0x1c
	subs r1, r1, r0
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080A1FEC
	ands r0, r4
	orrs r0, r1
	ldr r4, _080A1FF0
	strh r0, [r4, #4]
_080A1FC6:
	ldr r1, _080A1FF0
	ldrh r0, [r1, #4]
	movs r1, #0xf8
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080A2054
	ldr r2, _080A1FF0
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #1
	beq _080A2018
	cmp r0, #1
	bgt _080A1FF4
	cmp r0, #0
	beq _080A1FFE
	b _080A2040
	.align 2, 0
_080A1FEC: .4byte 0xFFFFF83F
_080A1FF0: .4byte 0x02037C74
_080A1FF4:
	cmp r0, #2
	beq _080A1FFE
	cmp r0, #3
	beq _080A2034
	b _080A2040
_080A1FFE:
	ldr r0, _080A200C
	ldr r1, _080A2010
	ldr r2, _080A2014
	bl CpuSet
	b _080A2040
	.align 2, 0
_080A200C: .4byte 0x020373B4
_080A2010: .4byte 0x020377B4
_080A2014: .4byte 0x04000100
_080A2018:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r1, _080A202C
	ldr r2, _080A2030
	mov r0, sp
	bl CpuSet
	b _080A2040
	.align 2, 0
_080A202C: .4byte 0x020377B4
_080A2030: .4byte 0x05000100
_080A2034:
	str r1, [sp, #4]
	add r0, sp, #4
	ldr r1, _080A206C
	ldr r2, _080A2070
	bl CpuSet
_080A2040:
	ldr r2, _080A2074
	ldrb r1, [r2, #9]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldrb r0, [r2, #0xa]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0xa]
_080A2054:
	ldr r3, _080A2074
	ldrb r0, [r3, #7]
_080A2058:
	lsrs r0, r0, #7
_080A205A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A206C: .4byte 0x020377B4
_080A2070: .4byte 0x05000100
_080A2074: .4byte 0x02037C74
	thumb_func_end UpdateFastPaletteFade

	thumb_func_start BeginHardwarePaletteFade
BeginHardwarePaletteFade: @ 0x080A2078
	push {r4, r5, r6, r7, lr}
	ldr r5, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r7, _080A2100
	str r0, [r7]
	movs r0, #0x3f
	ands r1, r0
	ldrb r4, [r7, #4]
	movs r6, #0x40
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r7, #4]
	ldrb r0, [r7, #8]
	ands r6, r0
	orrs r6, r1
	strb r6, [r7, #8]
	movs r0, #0x1f
	adds r1, r2, #0
	ands r1, r0
	lsls r1, r1, #6
	ldrh r4, [r7, #4]
	ldr r0, _080A2104
	ands r0, r4
	orrs r0, r1
	strh r0, [r7, #4]
	lsls r4, r3, #3
	ldrb r1, [r7, #5]
	movs r0, #7
	ands r0, r1
	orrs r0, r4
	strb r0, [r7, #5]
	ldrb r0, [r7, #7]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r7, #7]
	ldrb r1, [r7, #9]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	ands r5, r1
	lsls r5, r5, #2
	subs r1, #6
	ands r0, r1
	orrs r0, r5
	subs r1, #4
	ands r0, r1
	strb r0, [r7, #9]
	cmp r2, r3
	bhs _080A2108
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r6, r0
	b _080A210C
	.align 2, 0
_080A2100: .4byte 0x02037C74
_080A2104: .4byte 0xFFFFF83F
_080A2108:
	movs r0, #0x40
	orrs r6, r0
_080A210C:
	strb r6, [r7, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end BeginHardwarePaletteFade

	thumb_func_start UpdateHardwarePaletteFade
UpdateHardwarePaletteFade: @ 0x080A2114
	push {r4, r5, r6, r7, lr}
	ldr r2, _080A2128
	ldrb r1, [r2, #7]
	movs r0, #0x80
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _080A212C
	movs r0, #0
	b _080A2224
	.align 2, 0
_080A2128: .4byte 0x02037C74
_080A212C:
	ldrb r2, [r4, #4]
	lsls r1, r2, #0x1a
	ldrb r3, [r4, #8]
	lsls r0, r3, #0x1a
	cmp r1, r0
	bhs _080A214E
	lsrs r0, r1, #0x1a
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	movs r1, #0x40
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #4]
	movs r0, #2
	b _080A2224
_080A214E:
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r4, #4]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	bne _080A21AC
	ldrh r1, [r4, #4]
	lsls r0, r1, #0x15
	lsrs r0, r0, #0x1b
	adds r0, #1
	movs r7, #0x1f
	ands r0, r7
	lsls r0, r0, #6
	ldr r6, _080A21A8
	adds r3, r6, #0
	ands r3, r1
	orrs r3, r0
	strh r3, [r4, #4]
	lsls r5, r3, #0x15
	ldrb r0, [r4, #5]
	lsrs r1, r5, #0x1b
	lsrs r0, r0, #3
	cmp r1, r0
	bls _080A21F8
	ldrb r2, [r4, #9]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1f
	adds r1, #1
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #3
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #9]
	lsrs r0, r5, #0x1b
	subs r0, #1
	ands r0, r7
	lsls r0, r0, #6
	ands r3, r6
	b _080A21F4
	.align 2, 0
_080A21A8: .4byte 0xFFFFF83F
_080A21AC:
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x15
	lsrs r0, r1, #0x1b
	subs r0, #1
	movs r6, #0x1f
	ands r0, r6
	lsls r0, r0, #6
	ldr r5, _080A222C
	adds r3, r5, #0
	ands r3, r2
	orrs r3, r0
	strh r3, [r4, #4]
	lsrs r1, r1, #0x1b
	subs r1, #1
	ldrb r0, [r4, #5]
	lsrs r0, r0, #3
	cmp r1, r0
	bge _080A21F8
	ldrb r2, [r4, #9]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1f
	adds r1, #1
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #3
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #9]
	lsls r0, r3, #0x15
	lsrs r0, r0, #0x1b
	adds r0, #1
	ands r0, r6
	lsls r0, r0, #6
	ands r3, r5
_080A21F4:
	orrs r3, r0
	strh r3, [r4, #4]
_080A21F8:
	ldrb r1, [r4, #9]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080A2220
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080A2216
	movs r0, #0
	str r0, [r4]
	ldrh r1, [r4, #4]
	ldr r0, _080A222C
	ands r0, r1
	strh r0, [r4, #4]
_080A2216:
	ldrb r1, [r4, #9]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #9]
_080A2220:
	ldrb r0, [r4, #7]
	lsrs r0, r0, #7
_080A2224:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A222C: .4byte 0xFFFFF83F
	thumb_func_end UpdateHardwarePaletteFade

	thumb_func_start UpdateBlendRegisters
UpdateBlendRegisters: @ 0x080A2230
	push {r4, lr}
	ldr r4, _080A227C
	ldrh r1, [r4]
	movs r0, #0x50
	bl SetGpuReg
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x1b
	movs r0, #0x54
	bl SetGpuReg
	ldrb r1, [r4, #9]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080A2274
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #9]
	movs r0, #0
	str r0, [r4]
	ldrh r1, [r4, #4]
	ldr r0, _080A2280
	ands r0, r1
	strh r0, [r4, #4]
	ldrb r1, [r4, #7]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #7]
_080A2274:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A227C: .4byte 0x02037C74
_080A2280: .4byte 0xFFFFF83F
	thumb_func_end UpdateBlendRegisters

	thumb_func_start IsSoftwarePaletteFadeFinishing
IsSoftwarePaletteFadeFinishing: @ 0x080A2284
	push {r4, lr}
	ldr r3, _080A22BC
	ldrb r4, [r3, #0xa]
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080A22E0
	ldr r2, [r3, #8]
	movs r0, #0xf8
	lsls r0, r0, #9
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #7
	cmp r0, r1
	bne _080A22C4
	ldrb r1, [r3, #7]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3, #7]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r4
	strb r0, [r3, #0xa]
	ldr r0, [r3, #8]
	ldr r1, _080A22C0
	ands r0, r1
	str r0, [r3, #8]
	b _080A22D8
	.align 2, 0
_080A22BC: .4byte 0x02037C74
_080A22C0: .4byte 0xFFFE0FFF
_080A22C4:
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x1b
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _080A22DC
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #8]
_080A22D8:
	movs r0, #1
	b _080A22E2
	.align 2, 0
_080A22DC: .4byte 0xFFFE0FFF
_080A22E0:
	movs r0, #0
_080A22E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsSoftwarePaletteFadeFinishing

	thumb_func_start BlendPalettes
BlendPalettes: @ 0x080A22E8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r5, #0
	cmp r4, #0
	beq _080A231C
_080A22FA:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080A230E
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r7, #0
	adds r3, r6, #0
	bl BlendPalette
_080A230E:
	lsrs r4, r4, #1
	adds r0, r5, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, #0
	bne _080A22FA
_080A231C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BlendPalettes

	thumb_func_start BlendPalettesUnfaded
BlendPalettesUnfaded: @ 0x080A2324
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _080A2348
	ldr r5, _080A234C
	ldr r3, _080A2350
	str r4, [r3]
	str r5, [r3, #4]
	ldr r4, _080A2354
	str r4, [r3, #8]
	ldr r3, [r3, #8]
	bl BlendPalettes
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2348: .4byte 0x020373B4
_080A234C: .4byte 0x020377B4
_080A2350: .4byte 0x040000D4
_080A2354: .4byte 0x84000100
	thumb_func_end BlendPalettesUnfaded

	thumb_func_start TintPalette_GrayScale
TintPalette_GrayScale: @ 0x080A2358
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080A23A0
	movs r6, #0x1f
	adds r5, r1, #0
_080A2368:
	ldrh r1, [r4]
	movs r2, #0x1f
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	ands r3, r6
	lsrs r1, r1, #0x1a
	ands r1, r6
	movs r0, #0x4c
	muls r2, r0, r2
	movs r0, #0x97
	muls r0, r3, r0
	adds r2, r2, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r2, r2, r0
	asrs r2, r2, #8
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080A2368
_080A23A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TintPalette_GrayScale

	thumb_func_start TintPalette_GrayScale2
TintPalette_GrayScale2: @ 0x080A23A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080A23FC
	movs r6, #0x1f
	ldr r7, _080A2404
	adds r5, r1, #0
_080A23BA:
	ldrh r1, [r4]
	movs r2, #0x1f
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	ands r3, r6
	lsrs r1, r1, #0x1a
	ands r1, r6
	movs r0, #0x4c
	muls r2, r0, r2
	movs r0, #0x97
	muls r0, r3, r0
	adds r2, r2, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r2, r2, r0
	asrs r2, r2, #8
	cmp r2, #0x1f
	bls _080A23E6
	movs r2, #0x1f
_080A23E6:
	adds r0, r2, r7
	ldrb r2, [r0]
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080A23BA
_080A23FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2404: .4byte 0x084FCFA8
	thumb_func_end TintPalette_GrayScale2

	thumb_func_start TintPalette_SepiaTone
TintPalette_SepiaTone: @ 0x080A2408
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080A246A
	movs r7, #0x1f
	adds r6, r1, #0
_080A2418:
	ldrh r0, [r5]
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x15
	ands r2, r7
	lsrs r3, r0, #0x1a
	ands r3, r7
	movs r0, #0x4c
	muls r1, r0, r1
	movs r0, #0x97
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, r1, r0
	asrs r1, r1, #8
	ldr r0, _080A2470
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x18
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #0x14
	lsrs r3, r0, #0x18
	cmp r2, #0x1f
	ble _080A2458
	movs r2, #0x1f
_080A2458:
	lsls r0, r3, #0xa
	lsls r1, r4, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r5]
	adds r5, #2
	subs r6, #1
	cmp r6, #0
	bne _080A2418
_080A246A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2470: .4byte 0x00000133
	thumb_func_end TintPalette_SepiaTone

	thumb_func_start TintPalette_CustomTone
TintPalette_CustomTone: @ 0x080A2474
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	cmp r1, #0
	beq _080A2500
	movs r7, #0x1f
	adds r6, r1, #0
_080A249E:
	ldrh r0, [r5]
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x15
	ands r2, r7
	lsrs r3, r0, #0x1a
	ands r3, r7
	movs r0, #0x4c
	muls r1, r0, r1
	movs r0, #0x97
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, r1, r0
	asrs r1, r1, #8
	mov r0, sb
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x18
	mov r0, r8
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x18
	mov r0, ip
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
	cmp r4, #0x1f
	ble _080A24E2
	movs r4, #0x1f
_080A24E2:
	cmp r2, #0x1f
	ble _080A24E8
	movs r2, #0x1f
_080A24E8:
	cmp r3, #0x1f
	ble _080A24EE
	movs r3, #0x1f
_080A24EE:
	lsls r0, r3, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r5]
	adds r5, #2
	subs r6, #1
	cmp r6, #0
	bne _080A249E
_080A2500:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end TintPalette_CustomTone

	thumb_func_start sub_080A250C
sub_080A250C: @ 0x080A250C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	adds r4, r1, #0
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	ldr r5, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r8, r5
	ldr r0, _080A2564
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080A2568
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	strh r7, [r1, #8]
	strh r6, [r1, #0xa]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #0
	blt _080A256C
	strh r4, [r1, #0xe]
	movs r0, #1
	b _080A2574
	.align 2, 0
_080A2564: .4byte 0x080A261D
_080A2568: .4byte 0x03005B60
_080A256C:
	movs r0, #0
	strh r0, [r1, #0xe]
	rsbs r0, r4, #0
	adds r0, #1
_080A2574:
	strh r0, [r1, #0xc]
	lsls r4, r5, #2
	cmp r6, r7
	bhs _080A258C
	ldr r0, _080A25BC
	adds r1, r4, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #0xc]
_080A258C:
	adds r0, r5, #0
	movs r1, #5
	mov r2, sl
	bl SetWordTaskArg
	ldr r0, _080A25BC
	adds r1, r4, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	mov r0, sb
	strh r0, [r1, #0x16]
	mov r2, r8
	strh r2, [r1, #0x18]
	ldr r1, [r1]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A25BC: .4byte 0x03005B60
	thumb_func_end sub_080A250C

	thumb_func_start sub_080A25C0
sub_080A25C0: @ 0x080A25C0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _080A25E4
	ldr r1, _080A25E8
_080A25CC:
	ldrb r0, [r1, #4]
	cmp r0, #1
	bne _080A25EC
	ldr r0, [r1]
	cmp r0, r4
	bne _080A25EC
	movs r5, #0x18
	ldrsh r0, [r1, r5]
	cmp r0, r3
	bne _080A25EC
	movs r0, #1
	b _080A25F6
	.align 2, 0
_080A25E4: .4byte 0x080A261D
_080A25E8: .4byte 0x03005B60
_080A25EC:
	adds r1, #0x28
	adds r2, #1
	cmp r2, #0xf
	ble _080A25CC
	movs r0, #0
_080A25F6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080A25C0

	thumb_func_start sub_080A25FC
sub_080A25FC: @ 0x080A25FC
	push {lr}
	b _080A2604
_080A2600:
	bl DestroyTask
_080A2604:
	ldr r0, _080A2618
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080A2600
	pop {r0}
	bx r0
	.align 2, 0
_080A2618: .4byte 0x080A261D
	thumb_func_end sub_080A25FC

	thumb_func_start sub_080A261C
sub_080A261C: @ 0x080A261C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080A2670
	adds r4, r0, r1
	adds r0, r5, #0
	movs r1, #5
	bl GetWordTaskArg
	adds r3, r0, #0
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #6
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080A2694
	movs r0, #0
	strh r0, [r4, #8]
	ldrb r1, [r4]
	ldrh r2, [r4, #0xe]
	adds r0, r3, #0
	bl BlendPalettes
	ldrh r1, [r4]
	movs r6, #0
	ldrsh r0, [r4, r6]
	ldrh r3, [r4, #2]
	movs r6, #2
	ldrsh r2, [r4, r6]
	cmp r0, r2
	bne _080A2674
	adds r0, r5, #0
	bl DestroyTask
	b _080A2694
	.align 2, 0
_080A2670: .4byte 0x03005B68
_080A2674:
	ldrh r0, [r4, #4]
	adds r1, r1, r0
	strh r1, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080A268A
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	blt _080A2694
	b _080A2692
_080A268A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bgt _080A2694
_080A2692:
	strh r3, [r4]
_080A2694:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080A261C

