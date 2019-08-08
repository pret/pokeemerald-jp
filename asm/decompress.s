.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start LZDecompressVram
LZDecompressVram: @ 0x08034370
	push {lr}
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LZDecompressVram

	thumb_func_start LZDecompressWram
LZDecompressWram: @ 0x0803437C
	push {lr}
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LZDecompressWram

	thumb_func_start LoadCompressedSpriteSheet
LoadCompressedSpriteSheet: @ 0x08034388
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r5, _080343B8
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x10
	ldrh r0, [r4, #4]
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080343B8: .4byte 0x0201C000
	thumb_func_end LoadCompressedSpriteSheet

	thumb_func_start LoadCompressedSpriteSheetOverrideBuffer
LoadCompressedSpriteSheetOverrideBuffer: @ 0x080343BC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x10
	ldrh r0, [r4, #4]
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end LoadCompressedSpriteSheetOverrideBuffer

	thumb_func_start LoadCompressedSpritePalette
LoadCompressedSpritePalette: @ 0x080343E4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r4, _08034410
	adds r1, r4, #0
	bl LZ77UnCompWram
	str r4, [sp]
	ldrh r2, [r5, #4]
	ldr r1, _08034414
	ldr r0, [sp, #4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpritePalette
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034410: .4byte 0x0201C000
_08034414: .4byte 0xFFFF0000
	thumb_func_end LoadCompressedSpritePalette

	thumb_func_start LoadCompressedSpritePaletteOverrideBuffer
LoadCompressedSpritePaletteOverrideBuffer: @ 0x08034418
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5]
	bl LZ77UnCompWram
	str r4, [sp]
	ldrh r2, [r5, #4]
	ldr r1, _08034444
	ldr r0, [sp, #4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpritePalette
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034444: .4byte 0xFFFF0000
	thumb_func_end LoadCompressedSpritePaletteOverrideBuffer

	thumb_func_start DecompressPicFromTable
DecompressPicFromTable: @ 0x08034448
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r5, r0
	ble _08034468
	ldr r0, _08034464
	ldr r0, [r0]
	bl LZ77UnCompWram
	b _08034470
	.align 2, 0
_08034464: .4byte 0x082DDA1C
_08034468:
	ldr r0, [r3]
	adds r1, r4, #0
	bl LZ77UnCompWram
_08034470:
	adds r0, r4, #0
	adds r1, r5, #0
	bl DuplicateDeoxysTiles
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DecompressPicFromTable

	thumb_func_start HandleLoadSpecialPokePic
HandleLoadSpecialPokePic: @ 0x08034480
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #3
	ldr r1, _080344A8
	adds r0, r0, r1
	movs r1, #0
	cmp r4, r0
	bne _08034496
	movs r1, #1
_08034496:
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadSpecialPokePic_2
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080344A8: .4byte 0x082DDA1C
	thumb_func_end HandleLoadSpecialPokePic

	thumb_func_start LoadSpecialPokePic
LoadSpecialPokePic: @ 0x080344AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r7, #0xc9
	bne _08034528
	movs r0, #0xc0
	lsls r0, r0, #0x12
	ands r0, r5
	lsrs r0, r0, #0x12
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r5
	lsrs r1, r1, #0xc
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r1, r5
	lsrs r1, r1, #6
	orrs r0, r1
	movs r1, #3
	ands r1, r5
	orrs r0, r1
	movs r1, #0x1c
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080344FA
	movs r1, #0xc9
	b _08034504
_080344FA:
	movs r2, #0xce
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08034504:
	mov r0, r8
	cmp r0, #0
	bne _08034518
	ldr r0, _08034514
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, [r1]
	b _08034534
	.align 2, 0
_08034514: .4byte 0x082D6148
_08034518:
	ldr r0, _08034524
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, [r1]
	b _08034534
	.align 2, 0
_08034524: .4byte 0x082DDA1C
_08034528:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r7, r0
	ble _08034540
	ldr r0, _0803453C
	ldr r0, [r0]
_08034534:
	adds r1, r4, #0
	bl LZ77UnCompWram
	b _08034548
	.align 2, 0
_0803453C: .4byte 0x082DDA1C
_08034540:
	ldr r0, [r6]
	adds r1, r4, #0
	bl LZ77UnCompWram
_08034548:
	adds r0, r4, #0
	adds r1, r7, #0
	bl DuplicateDeoxysTiles
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl DrawSpindaSpots
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end LoadSpecialPokePic

	thumb_func_start Unused_LZDecompressWramIndirect
Unused_LZDecompressWramIndirect: @ 0x08034568
	push {lr}
	ldr r0, [r0]
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	thumb_func_end Unused_LZDecompressWramIndirect

	thumb_func_start sub_08034574
sub_08034574: @ 0x08034574
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	str r1, [sp]
	str r2, [sp, #4]
	adds r5, r3, #0
	movs r0, #1
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	bne _08034594
	b _0803472C
_08034594:
	asrs r0, r1, #1
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0
	ldr r2, [sp]
	cmp r0, r2
	blt _080345A8
	b _080347BC
_080345A8:
	movs r4, #8
	subs r1, r4, r1
	str r1, [sp, #0x10]
_080345AE:
	movs r7, #0
	adds r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r7, r0
	bge _0803462A
	ldr r1, [sp, #8]
	lsls r1, r1, #8
	str r1, [sp, #0x18]
	movs r2, #0
	mov sl, r2
	mov r0, sb
	movs r4, #8
	subs r0, r4, r0
	str r0, [sp, #0xc]
_080345CC:
	movs r3, #0
	asrs r0, r7, #1
	adds r1, r7, #0
	movs r2, #1
	ands r1, r2
	str r1, [sp, #0x20]
	lsls r0, r0, #8
	mov r8, r0
	mov ip, r5
_080345DE:
	lsls r1, r3, #5
	ldr r4, [sp, #0x18]
	adds r0, r5, r4
	adds r0, r0, r1
	mov r1, r8
	adds r2, r0, r1
	mov r1, ip
	add r1, r8
	movs r6, #0xf
_080345F0:
	ldr r4, [sp, #0x20]
	cmp r4, #0
	bne _08034600
	strb r4, [r1]
	add r4, sp, #0x20
	ldrb r4, [r4]
	strb r4, [r2, #0x10]
	b _0803460E
_08034600:
	mov r0, sl
	strb r0, [r1, #0x10]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r4, r2, r4
	str r4, [sp, #0x1c]
	strb r0, [r4]
_0803460E:
	adds r2, #1
	adds r1, #1
	subs r6, #1
	cmp r6, #0
	bge _080345F0
	movs r0, #0x20
	add ip, r0
	adds r3, #1
	cmp r3, #7
	ble _080345DE
	adds r7, #1
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blt _080345CC
_0803462A:
	movs r7, #0
	movs r2, #0
_0803462E:
	movs r6, #0
	adds r4, r7, #1
	mov r8, r4
	lsls r4, r7, #5
_08034636:
	adds r0, r6, #1
	mov sl, r0
	lsls r1, r6, #8
	adds r0, r1, #0
	adds r0, #0xc0
	adds r0, r5, r0
	adds r0, r0, r4
	adds r1, r5, r1
	adds r1, r1, r4
	movs r3, #0x1f
_0803464A:
	strb r2, [r1]
	strb r2, [r0]
	adds r0, #1
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0803464A
	mov r6, sl
	cmp r6, #7
	ble _08034636
	mov r7, r8
	cmp r7, #1
	ble _0803462E
	mov r1, sb
	cmp r1, #5
	bne _08034670
	movs r2, #0x90
	lsls r2, r2, #1
	adds r5, r5, r2
_08034670:
	movs r7, #0
	cmp r7, sb
	bge _08034706
_08034676:
	movs r3, #0
	adds r7, #1
	mov r8, r7
	cmp r3, sb
	bge _080346E6
_08034680:
	adds r3, #1
	mov sl, r3
	ldr r4, [sp, #4]
	adds r4, #0x20
	adds r7, r5, #0
	adds r7, #0x20
	movs r0, #0x12
	adds r0, r0, r5
	mov ip, r0
	ldr r2, [sp, #4]
	adds r3, r5, #0
	movs r6, #3
_08034698:
	ldrb r0, [r2]
	mov r1, ip
	strb r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #1]
	ldrb r0, [r2, #2]
	strb r0, [r1, #0x1e]
	ldrb r0, [r2, #3]
	strb r0, [r1, #0x1f]
	movs r0, #0x81
	lsls r0, r0, #1
	adds r1, r3, r0
	ldrb r0, [r2, #0x10]
	strb r0, [r1]
	ldr r0, _080346F0
	adds r1, r3, r0
	ldrb r0, [r2, #0x11]
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #1
	adds r1, r3, r0
	ldrb r0, [r2, #0x12]
	strb r0, [r1]
	ldr r0, _080346F4
	adds r1, r3, r0
	ldrb r0, [r2, #0x13]
	strb r0, [r1]
	movs r1, #4
	add ip, r1
	adds r2, #4
	adds r3, #4
	subs r6, #1
	cmp r6, #0
	bge _08034698
	str r4, [sp, #4]
	adds r5, r7, #0
	mov r3, sl
	cmp r3, sb
	blt _08034680
_080346E6:
	mov r2, sb
	cmp r2, #7
	bne _080346F8
	adds r5, #0x20
	b _08034700
	.align 2, 0
_080346F0: .4byte 0x00000103
_080346F4: .4byte 0x00000121
_080346F8:
	mov r4, sb
	cmp r4, #5
	bne _08034700
	adds r5, #0x60
_08034700:
	mov r7, r8
	cmp r7, sb
	blt _08034676
_08034706:
	mov r0, sb
	cmp r0, #7
	bne _08034714
	movs r1, #0x80
	lsls r1, r1, #1
	adds r5, r5, r1
	b _08034720
_08034714:
	mov r2, sb
	cmp r2, #5
	bne _08034720
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r5, r5, r4
_08034720:
	ldr r0, [sp, #0x14]
	ldr r1, [sp]
	cmp r0, r1
	bge _0803472A
	b _080345AE
_0803472A:
	b _080347BC
_0803472C:
	movs r6, #0
	ldr r2, [sp]
	cmp r6, r2
	bge _080347BC
_08034734:
	adds r6, #1
	mov sl, r6
	mov r4, sb
	cmp r4, #6
	bne _0803474C
	movs r0, #0
	movs r3, #0xff
_08034742:
	strb r0, [r5]
	adds r5, #1
	subs r3, #1
	cmp r3, #0
	bge _08034742
_0803474C:
	movs r7, #0
	cmp r7, sb
	bge _080347A0
_08034752:
	adds r7, #1
	mov r8, r7
	mov r1, sb
	lsls r0, r1, #5
	cmp r1, #6
	bne _0803476C
	movs r1, #0
	movs r3, #0x1f
_08034762:
	strb r1, [r5]
	adds r5, #1
	subs r3, #1
	cmp r3, #0
	bge _08034762
_0803476C:
	adds r1, r0, #0
	cmp r1, #0
	ble _08034786
	adds r3, r1, #0
_08034774:
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	strb r0, [r5]
	adds r2, #1
	str r2, [sp, #4]
	adds r5, #1
	subs r3, #1
	cmp r3, #0
	bne _08034774
_08034786:
	mov r4, sb
	cmp r4, #6
	bne _0803479A
	movs r0, #0
	movs r3, #0x1f
_08034790:
	strb r0, [r5]
	adds r5, #1
	subs r3, #1
	cmp r3, #0
	bge _08034790
_0803479A:
	mov r7, r8
	cmp r7, sb
	blt _08034752
_080347A0:
	mov r0, sb
	cmp r0, #6
	bne _080347B4
	movs r0, #0
	movs r3, #0xff
_080347AA:
	strb r0, [r5]
	adds r5, #1
	subs r3, #1
	cmp r3, #0
	bge _080347AA
_080347B4:
	mov r6, sl
	ldr r1, [sp]
	cmp r6, r1
	blt _08034734
_080347BC:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08034574

	thumb_func_start GetDecompressedDataSize
GetDecompressedDataSize: @ 0x080347CC
	adds r2, r0, #0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x10
	ldrb r1, [r2, #2]
	lsls r1, r1, #8
	orrs r0, r1
	ldrb r1, [r2, #1]
	orrs r0, r1
	bx lr
	.align 2, 0
	thumb_func_end GetDecompressedDataSize

	thumb_func_start LoadCompressedSpriteSheetUsingHeap
LoadCompressedSpriteSheetUsingHeap: @ 0x080347E0
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl AllocZeroed
	adds r5, r0, #0
	ldr r0, [r4]
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x10
	ldrh r0, [r4, #4]
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r5, #0
	bl Free
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end LoadCompressedSpriteSheetUsingHeap

	thumb_func_start LoadCompressedSpritePaletteUsingHeap
LoadCompressedSpritePaletteUsingHeap: @ 0x0803481C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl AllocZeroed
	adds r5, r0, #0
	ldr r0, [r4]
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r2, [r4, #4]
	ldr r1, _0803485C
	ldr r0, [sp, #4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpritePalette
	adds r0, r5, #0
	bl Free
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803485C: .4byte 0xFFFF0000
	thumb_func_end LoadCompressedSpritePaletteUsingHeap

	thumb_func_start DecompressPicFromTable_2
DecompressPicFromTable_2: @ 0x08034860
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r5, r0
	ble _08034880
	ldr r0, _0803487C
	ldr r0, [r0]
	bl LZ77UnCompWram
	b _08034888
	.align 2, 0
_0803487C: .4byte 0x082DDA1C
_08034880:
	ldr r0, [r3]
	adds r1, r4, #0
	bl LZ77UnCompWram
_08034888:
	adds r0, r4, #0
	adds r1, r5, #0
	bl DuplicateDeoxysTiles
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DecompressPicFromTable_2

	thumb_func_start LoadSpecialPokePic_2
LoadSpecialPokePic_2: @ 0x08034898
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r7, #0xc9
	bne _08034914
	movs r0, #0xc0
	lsls r0, r0, #0x12
	ands r0, r5
	lsrs r0, r0, #0x12
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r5
	lsrs r1, r1, #0xc
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r1, r5
	lsrs r1, r1, #6
	orrs r0, r1
	movs r1, #3
	ands r1, r5
	orrs r0, r1
	movs r1, #0x1c
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080348E6
	movs r1, #0xc9
	b _080348F0
_080348E6:
	movs r2, #0xce
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080348F0:
	mov r0, r8
	cmp r0, #0
	bne _08034904
	ldr r0, _08034900
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, [r1]
	b _08034920
	.align 2, 0
_08034900: .4byte 0x082D6148
_08034904:
	ldr r0, _08034910
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, [r1]
	b _08034920
	.align 2, 0
_08034910: .4byte 0x082DDA1C
_08034914:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r7, r0
	ble _0803492C
	ldr r0, _08034928
	ldr r0, [r0]
_08034920:
	adds r1, r4, #0
	bl LZ77UnCompWram
	b _08034934
	.align 2, 0
_08034928: .4byte 0x082DDA1C
_0803492C:
	ldr r0, [r6]
	adds r1, r4, #0
	bl LZ77UnCompWram
_08034934:
	adds r0, r4, #0
	adds r1, r7, #0
	bl DuplicateDeoxysTiles
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl DrawSpindaSpots
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end LoadSpecialPokePic_2

	thumb_func_start HandleLoadSpecialPokePic_2
HandleLoadSpecialPokePic_2: @ 0x08034954
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #3
	ldr r1, _0803497C
	adds r0, r0, r1
	movs r1, #0
	cmp r4, r0
	bne _0803496A
	movs r1, #1
_0803496A:
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadSpecialPokePic_2
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803497C: .4byte 0x082DDA1C
	thumb_func_end HandleLoadSpecialPokePic_2

	thumb_func_start DecompressPicFromTable_DontHandleDeoxys
DecompressPicFromTable_DontHandleDeoxys: @ 0x08034980
	push {lr}
	adds r3, r0, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r2, r0
	ble _0803499C
	ldr r0, _08034998
	ldr r0, [r0]
	bl LZ77UnCompWram
	b _080349A2
	.align 2, 0
_08034998: .4byte 0x082DDA1C
_0803499C:
	ldr r0, [r3]
	bl LZ77UnCompWram
_080349A2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DecompressPicFromTable_DontHandleDeoxys

	thumb_func_start HandleLoadSpecialPokePic_DontHandleDeoxys
HandleLoadSpecialPokePic_DontHandleDeoxys: @ 0x080349A8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #3
	ldr r1, _080349D0
	adds r0, r0, r1
	movs r1, #0
	cmp r4, r0
	bne _080349BE
	movs r1, #1
_080349BE:
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadSpecialPokePic_DontHandleDeoxys
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080349D0: .4byte 0x082DDA1C
	thumb_func_end HandleLoadSpecialPokePic_DontHandleDeoxys

	thumb_func_start LoadSpecialPokePic_DontHandleDeoxys
LoadSpecialPokePic_DontHandleDeoxys: @ 0x080349D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r7, #0xc9
	bne _08034A50
	movs r0, #0xc0
	lsls r0, r0, #0x12
	ands r0, r4
	lsrs r0, r0, #0x12
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r4
	lsrs r1, r1, #0xc
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r1, r4
	lsrs r1, r1, #6
	orrs r0, r1
	movs r1, #3
	ands r1, r4
	orrs r0, r1
	movs r1, #0x1c
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08034A22
	movs r1, #0xc9
	b _08034A2C
_08034A22:
	movs r2, #0xce
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08034A2C:
	mov r0, r8
	cmp r0, #0
	bne _08034A40
	ldr r0, _08034A3C
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, [r1]
	b _08034A5C
	.align 2, 0
_08034A3C: .4byte 0x082D6148
_08034A40:
	ldr r0, _08034A4C
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, [r1]
	b _08034A5C
	.align 2, 0
_08034A4C: .4byte 0x082DDA1C
_08034A50:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r7, r0
	ble _08034A68
	ldr r0, _08034A64
	ldr r0, [r0]
_08034A5C:
	adds r1, r5, #0
	bl LZ77UnCompWram
	b _08034A70
	.align 2, 0
_08034A64: .4byte 0x082DDA1C
_08034A68:
	ldr r0, [r6]
	adds r1, r5, #0
	bl LZ77UnCompWram
_08034A70:
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, r8
	bl DrawSpindaSpots
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end LoadSpecialPokePic_DontHandleDeoxys

	thumb_func_start DuplicateDeoxysTiles
DuplicateDeoxysTiles: @ 0x08034A88
	push {lr}
	adds r3, r0, #0
	movs r0, #0xcd
	lsls r0, r0, #1
	cmp r1, r0
	bne _08034AA2
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r3, r1
	ldr r2, _08034AA8
	adds r1, r3, #0
	bl CpuSet
_08034AA2:
	pop {r0}
	bx r0
	.align 2, 0
_08034AA8: .4byte 0x04000200
	thumb_func_end DuplicateDeoxysTiles

