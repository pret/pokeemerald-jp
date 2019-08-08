.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start load_intro_part2_graphics
load_intro_part2_graphics: @ 0x0817AF24
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0817AF80
	ldr r1, _0817AF84
	bl LZ77UnCompVram
	ldr r0, _0817AF88
	ldr r1, _0817AF8C
	bl LZ77UnCompVram
	ldr r0, _0817AF90
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	cmp r4, #0
	beq _0817AF4C
	cmp r4, #1
	beq _0817AFAC
_0817AF4C:
	ldr r0, _0817AF94
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0817AF98
	ldr r1, _0817AF9C
	bl LZ77UnCompVram
	ldr r0, _0817AFA0
	movs r1, #0
	movs r2, #0x60
	bl LoadPalette
	ldr r0, _0817AFA4
	bl LoadCompressedSpriteSheet
	ldr r0, _0817AFA8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadPalette
	bl sub_0817B62C
	b _0817AFDE
	.align 2, 0
_0817AF80: .4byte 0x085CDC10
_0817AF84: .4byte 0x06004000
_0817AF88: .4byte 0x085CE090
_0817AF8C: .4byte 0x06007800
_0817AF90: .4byte 0x085CDBB0
_0817AF94: .4byte 0x085CE28C
_0817AF98: .4byte 0x085CE868
_0817AF9C: .4byte 0x06003000
_0817AFA0: .4byte 0x085CE1CC
_0817AFA4: .4byte 0x085D2534
_0817AFA8: .4byte 0x085CEB38
_0817AFAC:
	ldr r0, _0817AFF0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0817AFF4
	ldr r1, _0817AFF8
	bl LZ77UnCompVram
	ldr r0, _0817AFFC
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0817B000
	bl LoadCompressedSpriteSheet
	ldr r0, _0817B004
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadPalette
	bl sub_0817B648
_0817AFDE:
	ldr r1, _0817B008
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0817B00C
	movs r0, #8
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817AFF0: .4byte 0x085CECF4
_0817AFF4: .4byte 0x085CF37C
_0817AFF8: .4byte 0x06003000
_0817AFFC: .4byte 0x085CECB4
_0817B000: .4byte 0x085D25BC
_0817B004: .4byte 0x085CF680
_0817B008: .4byte 0x0203B9F4
_0817B00C: .4byte 0x030030BC
	thumb_func_end load_intro_part2_graphics

	thumb_func_start sub_0817B010
sub_0817B010: @ 0x0817B010
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0817B022
	cmp r0, #1
	ble _0817B022
	cmp r0, #2
	beq _0817B054
_0817B022:
	ldr r1, _0817B048
	movs r0, #0xe
	bl SetGpuReg
	ldr r1, _0817B04C
	movs r0, #0xc
	bl SetGpuReg
	ldr r1, _0817B050
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0xf2
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	b _0817B076
	.align 2, 0
_0817B048: .4byte 0x00000603
_0817B04C: .4byte 0x00000702
_0817B050: .4byte 0x00000F05
_0817B054:
	ldr r1, _0817B07C
	movs r0, #0xe
	bl SetGpuReg
	ldr r1, _0817B080
	movs r0, #0xc
	bl SetGpuReg
	ldr r1, _0817B084
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0xf2
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
_0817B076:
	pop {r0}
	bx r0
	.align 2, 0
_0817B07C: .4byte 0x00000603
_0817B080: .4byte 0x00000702
_0817B084: .4byte 0x00000F05
	thumb_func_end sub_0817B010

	thumb_func_start sub_0817B088
sub_0817B088: @ 0x0817B088
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0817B0AC
	ldr r1, _0817B0B0
	bl LZ77UnCompVram
	ldr r0, _0817B0B4
	ldr r1, _0817B0B8
	bl LZ77UnCompVram
	cmp r4, #4
	bhi _0817B0D4
	lsls r0, r4, #2
	ldr r1, _0817B0BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0817B0AC: .4byte 0x085CDC10
_0817B0B0: .4byte 0x06004000
_0817B0B4: .4byte 0x085CE090
_0817B0B8: .4byte 0x06007800
_0817B0BC: .4byte 0x0817B0C0
_0817B0C0: @ jump table
	.4byte _0817B0D4 @ case 0
	.4byte _0817B130 @ case 1
	.4byte _0817B19C @ case 2
	.4byte _0817B19C @ case 3
	.4byte _0817B1F4 @ case 4
_0817B0D4:
	ldr r0, _0817B10C
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0817B110
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0817B114
	ldr r1, _0817B118
	bl LZ77UnCompVram
	ldr r0, _0817B11C
	movs r1, #0
	movs r2, #0x60
	bl LoadPalette
	ldr r0, _0817B120
	bl LoadCompressedSpriteSheet
	ldr r0, _0817B124
	ldr r1, _0817B128
	bl LZ77UnCompVram
	ldr r0, _0817B12C
	b _0817B166
	.align 2, 0
_0817B10C: .4byte 0x085CDBB0
_0817B110: .4byte 0x085CE28C
_0817B114: .4byte 0x085CE868
_0817B118: .4byte 0x06003000
_0817B11C: .4byte 0x085CE1CC
_0817B120: .4byte 0x085D2534
_0817B124: .4byte 0x085CEB78
_0817B128: .4byte 0x06010000
_0817B12C: .4byte 0x085CEB38
_0817B130:
	ldr r0, _0817B178
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0817B17C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0817B180
	ldr r1, _0817B184
	bl LZ77UnCompVram
	ldr r0, _0817B188
	movs r1, #0
	movs r2, #0x60
	bl LoadPalette
	ldr r0, _0817B18C
	bl LoadCompressedSpriteSheet
	ldr r0, _0817B190
	ldr r1, _0817B194
	bl LZ77UnCompVram
	ldr r0, _0817B198
_0817B166:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadPalette
	bl sub_0817B62C
	b _0817B230
	.align 2, 0
_0817B178: .4byte 0x085CDBD0
_0817B17C: .4byte 0x085CE28C
_0817B180: .4byte 0x085CE868
_0817B184: .4byte 0x06003000
_0817B188: .4byte 0x085CE22C
_0817B18C: .4byte 0x085D2534
_0817B190: .4byte 0x085CEB78
_0817B194: .4byte 0x06010000
_0817B198: .4byte 0x085CEB58
_0817B19C:
	ldr r0, _0817B1DC
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0817B1E0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0817B1E4
	ldr r1, _0817B1E8
	bl LZ77UnCompVram
	ldr r4, _0817B1EC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0817B1F0
	bl LoadCompressedSpriteSheet
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	bl sub_0817B648
	b _0817B230
	.align 2, 0
_0817B1DC: .4byte 0x085CDBD0
_0817B1E0: .4byte 0x085CECF4
_0817B1E4: .4byte 0x085CF37C
_0817B1E8: .4byte 0x06003000
_0817B1EC: .4byte 0x085CECD4
_0817B1F0: .4byte 0x085D25BC
_0817B1F4:
	ldr r0, _0817B244
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0817B248
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0817B24C
	ldr r1, _0817B250
	bl LZ77UnCompVram
	ldr r0, _0817B254
	movs r1, #0
	movs r2, #0x40
	bl LoadPalette
	ldr r0, _0817B258
	bl LoadCompressedSpriteSheet
	ldr r0, _0817B25C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadPalette
	bl sub_0817B664
_0817B230:
	ldr r1, _0817B260
	movs r0, #8
	strb r0, [r1]
	ldr r1, _0817B264
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817B244: .4byte 0x085CDBF0
_0817B248: .4byte 0x085CF82C
_0817B24C: .4byte 0x085CFA38
_0817B250: .4byte 0x06003000
_0817B254: .4byte 0x085CF7EC
_0817B258: .4byte 0x085D2650
_0817B25C: .4byte 0x085CFA18
_0817B260: .4byte 0x030030BC
_0817B264: .4byte 0x0203B9F4
	thumb_func_end sub_0817B088

	thumb_func_start sub_0817B268
sub_0817B268: @ 0x0817B268
	push {lr}
	ldr r1, _0817B290
	movs r0, #0xe
	bl SetGpuReg
	ldr r1, _0817B294
	movs r0, #0xc
	bl SetGpuReg
	ldr r1, _0817B298
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0xfa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_0817B290: .4byte 0x00000603
_0817B294: .4byte 0x00000702
_0817B298: .4byte 0x00000F05
	thumb_func_end sub_0817B268

	thumb_func_start CreateBicycleAnimationTask
CreateBicycleAnimationTask: @ 0x0817B29C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r1, _0817B310
	mov sb, r1
	mov r0, sb
	movs r1, #0
	str r3, [sp]
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0817B314
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	strh r5, [r0, #8]
	strh r6, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	mov r1, r8
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	ldr r3, [sp]
	strh r3, [r0, #0x16]
	movs r1, #8
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	adds r0, r4, #0
	bl _call_via_r9
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0817B310: .4byte 0x0817B319
_0817B314: .4byte 0x03005B60
	thumb_func_end CreateBicycleAnimationTask

	thumb_func_start sub_0817B318
sub_0817B318: @ 0x0817B318
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0817B3A4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0xa]
	lsls r2, r0, #0x10
	cmp r2, #0
	beq _0817B360
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0xe]
	adds r1, r0, r1
	lsrs r0, r2, #0xc
	subs r1, r1, r0
	asrs r0, r1, #0x10
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	ldrh r1, [r4, #0xc]
	movs r0, #0x14
	bl SetGpuReg
	ldr r2, _0817B3A8
	ldr r0, _0817B3AC
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x16
	bl SetGpuReg
_0817B360:
	ldrh r0, [r4, #0x10]
	lsls r2, r0, #0x10
	cmp r2, #0
	beq _0817B3BA
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0x14]
	adds r1, r0, r1
	lsrs r0, r2, #0xc
	subs r1, r1, r0
	asrs r0, r1, #0x10
	strh r0, [r4, #0x12]
	strh r1, [r4, #0x14]
	ldrh r1, [r4, #0x12]
	movs r0, #0x18
	bl SetGpuReg
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0817B3B0
	ldr r2, _0817B3A8
	ldr r0, _0817B3AC
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	b _0817B3BA
	.align 2, 0
_0817B3A4: .4byte 0x03005B60
_0817B3A8: .4byte 0x0203B9F0
_0817B3AC: .4byte 0x0203B9F2
_0817B3B0:
	ldr r0, _0817B3F8
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
_0817B3BA:
	ldr r0, _0817B3FC
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r2, r1, r0
	ldrh r0, [r2, #0x16]
	lsls r3, r0, #0x10
	cmp r3, #0
	beq _0817B3F2
	movs r1, #0x18
	ldrsh r0, [r2, r1]
	lsls r0, r0, #0x10
	ldrh r1, [r2, #0x1a]
	adds r1, r0, r1
	lsrs r0, r3, #0xc
	subs r1, r1, r0
	asrs r0, r1, #0x10
	strh r0, [r2, #0x18]
	strh r1, [r2, #0x1a]
	ldrh r1, [r2, #0x18]
	movs r0, #0x1c
	bl SetGpuReg
	ldr r0, _0817B3F8
	ldrh r1, [r0]
	movs r0, #0x1e
	bl SetGpuReg
_0817B3F2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817B3F8: .4byte 0x0203B9F0
_0817B3FC: .4byte 0x03005B60
	thumb_func_end sub_0817B318

	thumb_func_start sub_0817B400
sub_0817B400: @ 0x0817B400
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0817B4E0
	cmp r0, #1
	ble _0817B414
	cmp r0, #2
	beq _0817B478
_0817B414:
	ldr r0, _0817B440
	ldr r2, [r0, #0x20]
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _0817B4E0
	ldr r0, _0817B444
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817B4E0
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq _0817B44C
	ldr r2, _0817B448
	ldrh r1, [r2, #0x12]
	mov r0, sp
	strh r1, [r0]
	ldrh r1, [r2, #0x14]
	b _0817B456
	.align 2, 0
_0817B440: .4byte 0x03002360
_0817B444: .4byte 0x02037C74
_0817B448: .4byte 0x020373B4
_0817B44C:
	ldr r2, _0817B474
	ldrh r1, [r2, #0x14]
	mov r0, sp
	strh r1, [r0]
	ldrh r1, [r2, #0x12]
_0817B456:
	adds r0, #2
	strh r1, [r0]
	adds r4, r0, #0
	mov r0, sp
	movs r1, #9
	movs r2, #2
	bl LoadPalette
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl LoadPalette
	b _0817B4E0
	.align 2, 0
_0817B474: .4byte 0x020373B4
_0817B478:
	ldr r0, _0817B4A8
	ldr r2, [r0, #0x20]
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _0817B4E0
	ldr r0, _0817B4AC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817B4E0
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq _0817B4B8
	mov r1, sp
	ldr r2, _0817B4B0
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0817B4B4
	b _0817B4C6
	.align 2, 0
_0817B4A8: .4byte 0x03002360
_0817B4AC: .4byte 0x02037C74
_0817B4B0: .4byte 0x00003D27
_0817B4B4: .4byte 0x00000295
_0817B4B8:
	mov r1, sp
	movs r2, #0xc7
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0817B4E8
_0817B4C6:
	adds r0, r2, #0
	strh r0, [r1]
	adds r4, r1, #0
	mov r0, sp
	movs r1, #0xc
	movs r2, #2
	bl LoadPalette
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #2
	bl LoadPalette
_0817B4E0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817B4E8: .4byte 0x00003D27
	thumb_func_end sub_0817B400

	thumb_func_start sub_0817B4EC
sub_0817B4EC: @ 0x0817B4EC
	push {lr}
	adds r2, r0, #0
	ldr r0, _0817B508
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	beq _0817B550
	cmp r0, #0
	beq _0817B50C
	adds r0, r2, #0
	bl DestroySprite
	b _0817B550
	.align 2, 0
_0817B508: .4byte 0x0203B9F4
_0817B50C:
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	lsls r0, r0, #0x10
	ldrh r1, [r2, #0x32]
	orrs r0, r1
	ldrh r1, [r2, #0x30]
	adds r0, r0, r1
	asrs r1, r0, #0x10
	strh r1, [r2, #0x20]
	strh r0, [r2, #0x32]
	cmp r1, #0xff
	ble _0817B528
	ldr r0, _0817B53C
	strh r0, [r2, #0x20]
_0817B528:
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0817B548
	ldr r1, _0817B540
	ldr r0, _0817B544
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0817B54C
	.align 2, 0
_0817B53C: .4byte 0x0000FFE0
_0817B540: .4byte 0x0203B9F0
_0817B544: .4byte 0x0203B9F2
_0817B548:
	ldr r0, _0817B554
	ldrh r0, [r0]
_0817B54C:
	rsbs r0, r0, #0
	strh r0, [r2, #0x26]
_0817B550:
	pop {r0}
	bx r0
	.align 2, 0
_0817B554: .4byte 0x0203B9F0
	thumb_func_end sub_0817B4EC

	thumb_func_start sub_0817B558
sub_0817B558: @ 0x0817B558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp, #4]
	str r2, [sp, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	movs r7, #0
	cmp r7, r8
	bhs _0817B60E
	ldr r0, _0817B620
	mov sl, r0
	movs r2, #0x3f
	mov sb, r2
_0817B582:
	lsls r6, r7, #3
	ldr r0, [sp, #4]
	adds r6, r6, r0
	ldrb r1, [r6, #1]
	ldrb r2, [r6, #2]
	ldrb r3, [r6, #3]
	ldr r0, _0817B624
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	mov r2, sl
	adds r4, r5, r2
	ldrb r2, [r6]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1e
	lsrs r2, r2, #6
	adds r0, r4, #0
	movs r3, #0
	bl CalcCenterToCornerVec
	ldrb r3, [r4, #5]
	movs r0, #0xc
	orrs r3, r0
	strb r3, [r4, #5]
	ldrb r1, [r6]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	lsls r1, r1, #6
	ldrb r2, [r4, #1]
	mov r0, sb
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r6]
	lsrs r1, r1, #6
	lsls r1, r1, #6
	ldrb r2, [r4, #3]
	mov r0, sb
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	movs r0, #0xf
	ands r3, r0
	strb r3, [r4, #5]
	ldr r0, _0817B628
	adds r5, r5, r0
	ldr r2, [sp, #8]
	str r2, [r5]
	ldrb r1, [r6]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r0, r4, #0
	bl StartSpriteAnim
	movs r1, #0
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldrh r0, [r6, #4]
	strh r0, [r4, #0x30]
	strh r1, [r4, #0x32]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, r8
	blo _0817B582
_0817B60E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817B620: .4byte 0x020205AC
_0817B624: .4byte 0x085D251C
_0817B628: .4byte 0x020205B4
	thumb_func_end sub_0817B558

	thumb_func_start sub_0817B62C
sub_0817B62C: @ 0x0817B62C
	push {lr}
	ldr r1, _0817B640
	ldr r2, _0817B644
	movs r0, #0
	movs r3, #9
	bl sub_0817B558
	pop {r0}
	bx r0
	.align 2, 0
_0817B640: .4byte 0x085D2574
_0817B644: .4byte 0x085D2564
	thumb_func_end sub_0817B62C

	thumb_func_start sub_0817B648
sub_0817B648: @ 0x0817B648
	push {lr}
	ldr r1, _0817B65C
	ldr r2, _0817B660
	movs r0, #1
	movs r3, #0xc
	bl sub_0817B558
	pop {r0}
	bx r0
	.align 2, 0
_0817B65C: .4byte 0x085D25F0
_0817B660: .4byte 0x085D25E4
	thumb_func_end sub_0817B648

	thumb_func_start sub_0817B664
sub_0817B664: @ 0x0817B664
	push {lr}
	ldr r1, _0817B678
	ldr r2, _0817B67C
	movs r0, #1
	movs r3, #6
	bl sub_0817B558
	pop {r0}
	bx r0
	.align 2, 0
_0817B678: .4byte 0x085D266C
_0817B67C: .4byte 0x085D2668
	thumb_func_end sub_0817B664

	thumb_func_start nullsub_65
nullsub_65: @ 0x0817B680
	bx lr
	.align 2, 0
	thumb_func_end nullsub_65

	thumb_func_start sub_0817B684
sub_0817B684: @ 0x0817B684
	push {r4, lr}
	ldr r4, _0817B6F0
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r1, [r1]
	movs r2, #0x3e
	adds r2, r2, r0
	mov ip, r2
	movs r2, #4
	ands r2, r1
	mov r1, ip
	ldrb r3, [r1]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x20]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x24]
	strh r1, [r0, #0x24]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x26]
	strh r1, [r0, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817B6F0: .4byte 0x020205AC
	thumb_func_end sub_0817B684

	thumb_func_start intro_create_brendan_sprite
intro_create_brendan_sprite: @ 0x0817B6F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0817B740
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #2
	bl CreateSprite
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0817B744
	adds r4, #8
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #3
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817B748
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	strh r6, [r1, #0x2e]
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0817B740: .4byte 0x085D26BC
_0817B744: .4byte 0x085D270C
_0817B748: .4byte 0x020205AC
	thumb_func_end intro_create_brendan_sprite

	thumb_func_start intro_create_may_sprite
intro_create_may_sprite: @ 0x0817B74C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0817B798
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #2
	bl CreateSprite
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0817B79C
	adds r4, #8
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #3
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817B7A0
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	strh r6, [r1, #0x2e]
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0817B798: .4byte 0x085D26D4
_0817B79C: .4byte 0x085D2724
_0817B7A0: .4byte 0x020205AC
	thumb_func_end intro_create_may_sprite

	thumb_func_start nullsub_66
nullsub_66: @ 0x0817B7A4
	bx lr
	.align 2, 0
	thumb_func_end nullsub_66

	thumb_func_start sub_0817B7A8
sub_0817B7A8: @ 0x0817B7A8
	push {r4, lr}
	ldr r4, _0817B804
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r1, [r1]
	movs r2, #0x3e
	adds r2, r2, r0
	mov ip, r2
	movs r2, #4
	ands r2, r1
	mov r1, ip
	ldrb r3, [r1]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x22]
	strh r1, [r0, #0x22]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x24]
	strh r1, [r0, #0x24]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x26]
	strh r1, [r0, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817B804: .4byte 0x020205AC
	thumb_func_end sub_0817B7A8

	thumb_func_start intro_create_flygon_sprite
intro_create_flygon_sprite: @ 0x0817B808
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r0, _0817B874
	mov r8, r0
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	ldr r0, _0817B878
	adds r2, r2, r0
	asrs r2, r2, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, r8
	adds r1, r2, #0
	adds r2, r5, #0
	movs r3, #5
	bl CreateSprite
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r4, #0x20
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0817B87C
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	strh r6, [r0, #0x2e]
	movs r1, #1
	bl StartSpriteAnim
	adds r5, #0x1c
	adds r4, r4, r5
	ldr r0, _0817B880
	str r0, [r4]
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0817B874: .4byte 0x085D275C
_0817B878: .4byte 0xFFE00000
_0817B87C: .4byte 0x020205AC
_0817B880: .4byte 0x0817B7A9
	thumb_func_end intro_create_flygon_sprite

	thumb_func_start sub_0817B884
sub_0817B884: @ 0x0817B884
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r0, _0817B8F0
	mov r8, r0
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	ldr r0, _0817B8F4
	adds r2, r2, r0
	asrs r2, r2, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, r8
	adds r1, r2, #0
	adds r2, r5, #0
	movs r3, #5
	bl CreateSprite
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r4, #0x20
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0817B8F8
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	strh r6, [r0, #0x2e]
	movs r1, #1
	bl StartSpriteAnim
	adds r5, #0x1c
	adds r4, r4, r5
	ldr r0, _0817B8FC
	str r0, [r4]
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0817B8F0: .4byte 0x085D2774
_0817B8F4: .4byte 0xFFE00000
_0817B8F8: .4byte 0x020205AC
_0817B8FC: .4byte 0x0817B7A9
	thumb_func_end sub_0817B884

