.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081D9F50
sub_081D9F50: @ 0x081D9F50
	push {lr}
	sub sp, #8
	add r1, sp, #4
	mov r0, sp
	bl sub_0814A018
	ldr r0, _081D9F88
	ldr r1, [sp, #4]
	bl LZ77UnCompVram
	ldr r0, _081D9F8C
	ldr r1, [sp]
	bl LZ77UnCompVram
	ldr r0, _081D9F90
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _081D9F94
	bl LoadCompressedSpriteSheet
	ldr r0, _081D9F98
	bl LoadSpritePalette
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_081D9F88: .4byte 0x085FC03C
_081D9F8C: .4byte 0x085FC218
_081D9F90: .4byte 0x085FC824
_081D9F94: .4byte 0x085FCA0C
_081D9F98: .4byte 0x085FCA14
	thumb_func_end sub_081D9F50

	thumb_func_start sub_081D9F9C
sub_081D9F9C: @ 0x081D9F9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	ldr r0, _081D9FF4
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r7, #1
	beq _081DA020
	cmp r7, #1
	bgt _081D9FF8
	cmp r7, #0
	beq _081DA008
	b _081D9FFC
	.align 2, 0
_081D9FF4: .4byte 0x085FCA40
_081D9FF8:
	cmp r7, #2
	beq _081DA034
_081D9FFC:
	ldr r6, _081DA004
	lsls r3, r5, #4
	b _081DA048
	.align 2, 0
_081DA004: .4byte 0x020205AC
_081DA008:
	ldr r2, _081DA01C
	lsls r3, r5, #4
	adds r0, r3, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x78
	strh r1, [r0, #0x2e]
	movs r1, #0x2d
	b _081DA044
	.align 2, 0
_081DA01C: .4byte 0x020205AC
_081DA020:
	ldr r2, _081DA030
	lsls r3, r5, #4
	adds r0, r3, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x59
	b _081DA040
	.align 2, 0
_081DA030: .4byte 0x020205AC
_081DA034:
	ldr r2, _081DA090
	lsls r3, r5, #4
	adds r0, r3, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x97
_081DA040:
	strh r1, [r0, #0x2e]
	movs r1, #0x61
_081DA044:
	strh r1, [r0, #0x30]
	adds r6, r2, #0
_081DA048:
	adds r4, r3, r5
	lsls r4, r4, #2
	adds r0, r4, r6
	mov r2, r8
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	strh r1, [r0, #0x32]
	mov r3, sb
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #0x34]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, #0x3a]
	mov r3, sl
	strh r3, [r0, #0x3c]
	strh r2, [r0, #0x36]
	strh r2, [r0, #0x38]
	adds r1, r7, #0
	bl StartSpriteAnim
	adds r0, r6, #0
	adds r0, #0x1c
	adds r4, r4, r0
	ldr r0, _081DA094
	str r0, [r4]
	adds r0, r5, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081DA090: .4byte 0x020205AC
_081DA094: .4byte 0x081DA099
	thumb_func_end sub_081D9F9C

	thumb_func_start sub_081DA098
sub_081DA098: @ 0x081DA098
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #0x20
	ldrsh r1, [r3, r0]
	movs r4, #0x2e
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne _081DA0C4
	movs r5, #0x22
	ldrsh r1, [r3, r5]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _081DA0C4
	ldr r0, _081DA0C0
	str r0, [r3, #0x1c]
	b _081DA104
	.align 2, 0
_081DA0C0: .4byte 0x08007141
_081DA0C4:
	ldrh r4, [r2, #8]
	movs r5, #8
	ldrsh r1, [r2, r5]
	movs r5, #0xc
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bne _081DA0E0
	ldrh r0, [r2, #4]
	ldrh r1, [r3, #0x20]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r3, #0x20]
	strh r1, [r2, #8]
	b _081DA0E4
_081DA0E0:
	adds r0, r4, #1
	strh r0, [r2, #8]
_081DA0E4:
	ldrh r4, [r2, #0xa]
	movs r5, #0xa
	ldrsh r1, [r2, r5]
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bne _081DA100
	ldrh r0, [r2, #6]
	ldrh r1, [r3, #0x22]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r3, #0x22]
	strh r1, [r2, #0xa]
	b _081DA104
_081DA100:
	adds r0, r4, #1
	strh r0, [r2, #0xa]
_081DA104:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081DA098

	thumb_func_start sub_081DA10C
sub_081DA10C: @ 0x081DA10C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	mov r8, r1
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	ldr r4, [sp, #0x34]
	ldr r5, [sp, #0x38]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _081DA170
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r1, r8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	adds r1, r6, #0
	mov r2, r8
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r5, #1
	beq _081DA19C
	cmp r5, #1
	bgt _081DA174
	cmp r5, #0
	beq _081DA184
	b _081DA178
	.align 2, 0
_081DA170: .4byte 0x085FCA40
_081DA174:
	cmp r5, #2
	beq _081DA1B0
_081DA178:
	ldr r2, _081DA180
	lsls r3, r6, #4
	b _081DA1C2
	.align 2, 0
_081DA180: .4byte 0x020205AC
_081DA184:
	ldr r2, _081DA198
	lsls r3, r6, #4
	adds r0, r3, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x78
	strh r1, [r0, #0x2e]
	movs r1, #0x2d
	b _081DA1C0
	.align 2, 0
_081DA198: .4byte 0x020205AC
_081DA19C:
	ldr r2, _081DA1AC
	lsls r3, r6, #4
	adds r0, r3, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x59
	b _081DA1BC
	.align 2, 0
_081DA1AC: .4byte 0x020205AC
_081DA1B0:
	ldr r2, _081DA204
	lsls r3, r6, #4
	adds r0, r3, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x97
_081DA1BC:
	strh r1, [r0, #0x2e]
	movs r1, #0x61
_081DA1C0:
	strh r1, [r0, #0x30]
_081DA1C2:
	adds r4, r3, r6
	lsls r4, r4, #2
	adds r0, r4, r2
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r0, #0x32]
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0, #0x34]
	mov r3, sl
	strh r3, [r0, #0x36]
	mov r1, sb
	strh r1, [r0, #0x38]
	strh r7, [r0, #0x3a]
	adds r1, r5, #0
	str r2, [sp, #8]
	bl StartSpriteAnim
	ldr r2, [sp, #8]
	adds r0, r2, #0
	adds r0, #0x1c
	adds r4, r4, r0
	ldr r0, _081DA208
	str r0, [r4]
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081DA204: .4byte 0x020205AC
_081DA208: .4byte 0x081DA20D
	thumb_func_end sub_081DA10C

	thumb_func_start sub_081DA20C
sub_081DA20C: @ 0x081DA20C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	bl Cos2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r4, #0x26]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0xb4
	lsls r1, r1, #1
	bl __modsi3
	strh r0, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _081DA262
	ldrh r0, [r4, #0x3a]
	adds r0, r2, r0
	strh r0, [r4, #0x36]
	b _081DA266
_081DA262:
	ldr r0, _081DA26C
	str r0, [r4, #0x1c]
_081DA266:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081DA26C: .4byte 0x08007141
	thumb_func_end sub_081DA20C

	thumb_func_start sub_081DA270
sub_081DA270: @ 0x081DA270
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _081DA2BC
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081DA2C0
	adds r0, r0, r4
	bl DestroySprite
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	movs r0, #0x14
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DA2BC: .4byte 0x00002E90
_081DA2C0: .4byte 0x020205AC
	thumb_func_end sub_081DA270

	thumb_func_start sub_081DA2C4
sub_081DA2C4: @ 0x081DA2C4
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _081DA30C
	movs r0, #0x10
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r2, #0
	adds r5, #0x1c
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, _081DA310
	cmp r4, r0
	bne _081DA314
	movs r0, #0x12
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, r4
	bne _081DA314
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r0, [r1]
	cmp r0, r2
	bne _081DA314
	movs r0, #1
	b _081DA316
	.align 2, 0
_081DA30C: .4byte 0x020205AC
_081DA310: .4byte 0x08007141
_081DA314:
	movs r0, #0
_081DA316:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081DA2C4

	thumb_func_start sub_081DA31C
sub_081DA31C: @ 0x081DA31C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081DA370
	bl sub_081D9F50
	ldr r1, _081DA36C
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r1, #0xa0
	lsls r1, r1, #3
	movs r0, #0
	movs r2, #2
	bl ChangeBgY
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	b _081DA396
	.align 2, 0
_081DA36C: .4byte 0x00003F41
_081DA370:
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0
	bl ClearGpuRegBits
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	bl ClearGpuRegBits
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r0, #0
_081DA396:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081DA31C

	thumb_func_start sub_081DA39C
sub_081DA39C: @ 0x081DA39C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081DA3B4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	bl SetGpuRegBits
_081DA3B4:
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0x10
	bne _081DA3E8
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0x1f
	bne _081DA3E2
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _081DA400
_081DA3E2:
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	b _081DA400
_081DA3E8:
	adds r0, r1, #1
	strh r0, [r4, #0xc]
	ldrh r1, [r4, #0xc]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
_081DA400:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081DA39C

	thumb_func_start sub_081DA40C
sub_081DA40C: @ 0x081DA40C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_081DA2C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081DA422
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081DA422:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081DA40C

	thumb_func_start Phase2Task_34
Phase2Task_34: @ 0x081DA42C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081DA45C
	ldr r2, _081DA460
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081DA43E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081DA43E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DA45C: .4byte 0x085FCA58
_081DA460: .4byte 0x03005B60
	thumb_func_end Phase2Task_34

	thumb_func_start sub_081DA464
sub_081DA464: @ 0x081DA464
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r1, #0x33
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	movs r5, #2
	str r5, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x78
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x10]
	movs r0, #7
	rsbs r0, r0, #0
	str r5, [sp]
	movs r4, #2
	rsbs r4, r4, #0
	str r4, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0xc1
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x12]
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0xf7
	movs r1, #0xc1
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081DA464

	thumb_func_start sub_081DA4D0
sub_081DA4D0: @ 0x081DA4D0
	push {lr}
	adds r2, r0, #0
	ldr r0, _081DA4FC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081DA4F4
	adds r0, r2, #0
	bl sub_081DA270
	ldr r0, _081DA500
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081DA4F4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081DA4FC: .4byte 0x02037C74
_081DA500: .4byte 0x081DA42D
	thumb_func_end sub_081DA4D0

	thumb_func_start Phase2Task_35
Phase2Task_35: @ 0x081DA504
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081DA534
	ldr r2, _081DA538
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081DA516:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081DA516
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DA534: .4byte 0x085FCA6C
_081DA538: .4byte 0x03005B60
	thumb_func_end Phase2Task_35

	thumb_func_start sub_081DA53C
sub_081DA53C: @ 0x081DA53C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r4, #4
	rsbs r4, r4, #0
	str r4, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x78
	movs r1, #0xc5
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x10]
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xf1
	movs r1, #0x3b
	movs r2, #0
	movs r3, #1
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x12]
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #4
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x3b
	movs r2, #0
	movs r3, #1
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081DA53C

	thumb_func_start sub_081DA5A8
sub_081DA5A8: @ 0x081DA5A8
	push {lr}
	adds r2, r0, #0
	ldr r0, _081DA5D4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081DA5CC
	adds r0, r2, #0
	bl sub_081DA270
	ldr r0, _081DA5D8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081DA5CC:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081DA5D4: .4byte 0x02037C74
_081DA5D8: .4byte 0x081DA505
	thumb_func_end sub_081DA5A8

	thumb_func_start Phase2Task_36
Phase2Task_36: @ 0x081DA5DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081DA60C
	ldr r2, _081DA610
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081DA5EE:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081DA5EE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DA60C: .4byte 0x085FCA80
_081DA610: .4byte 0x03005B60
	thumb_func_end Phase2Task_36

	thumb_func_start sub_081DA614
sub_081DA614: @ 0x081DA614
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	mov r8, r0
	movs r6, #0x80
	str r6, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r5, #4
	rsbs r5, r5, #0
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x78
	movs r1, #0x2d
	movs r2, #0xc
	movs r3, #4
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1, #0x10]
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x59
	movs r1, #0x61
	movs r2, #0xfc
	movs r3, #4
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1, #0x12]
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x97
	movs r1, #0x61
	movs r2, #0x84
	movs r3, #4
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1, #0x14]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081DA614

	thumb_func_start sub_081DA694
sub_081DA694: @ 0x081DA694
	push {lr}
	adds r2, r0, #0
	ldr r0, _081DA6C0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081DA6B8
	adds r0, r2, #0
	bl sub_081DA270
	ldr r0, _081DA6C4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081DA6B8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081DA6C0: .4byte 0x02037C74
_081DA6C4: .4byte 0x081DA5DD
	thumb_func_end sub_081DA694

	thumb_func_start Phase2Task_37
Phase2Task_37: @ 0x081DA6C8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081DA6F8
	ldr r2, _081DA6FC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081DA6DA:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081DA6DA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DA6F8: .4byte 0x085FCA94
_081DA6FC: .4byte 0x03005B60
	thumb_func_end Phase2Task_37

	thumb_func_start sub_081DA700
sub_081DA700: @ 0x081DA700
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	mov r8, r0
	movs r2, #0x8e
	lsls r2, r2, #1
	movs r6, #0x83
	str r6, [sp]
	movs r5, #0x23
	str r5, [sp, #4]
	movs r4, #3
	rsbs r4, r4, #0
	str r4, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x78
	movs r1, #0x50
	movs r3, #8
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1, #0x10]
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x78
	movs r1, #0x50
	movs r2, #0x2c
	movs r3, #8
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1, #0x12]
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x79
	movs r1, #0x50
	movs r2, #0xa4
	movs r3, #8
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1, #0x14]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081DA700

	thumb_func_start sub_081DA784
sub_081DA784: @ 0x081DA784
	push {lr}
	adds r2, r0, #0
	ldr r0, _081DA7B0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081DA7A8
	adds r0, r2, #0
	bl sub_081DA270
	ldr r0, _081DA7B4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081DA7A8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081DA7B0: .4byte 0x02037C74
_081DA7B4: .4byte 0x081DA6C9
	thumb_func_end sub_081DA784

	thumb_func_start Phase2Task_38
Phase2Task_38: @ 0x081DA7B8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081DA7E8
	ldr r2, _081DA7EC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081DA7CA:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081DA7CA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DA7E8: .4byte 0x085FCAA8
_081DA7EC: .4byte 0x03005B60
	thumb_func_end Phase2Task_38

	thumb_func_start sub_081DA7F0
sub_081DA7F0: @ 0x081DA7F0
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _081DA81C
	movs r1, #0x33
	rsbs r1, r1, #0
	str r2, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r2, [sp, #8]
	movs r0, #0x78
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x10]
	b _081DA86A
_081DA81C:
	cmp r2, #0x10
	bne _081DA842
	movs r0, #7
	rsbs r0, r0, #0
	movs r1, #4
	str r1, [sp]
	subs r1, #8
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0xc1
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x12]
	b _081DA86A
_081DA842:
	cmp r2, #0x20
	bne _081DA86A
	movs r0, #4
	rsbs r0, r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xf7
	movs r1, #0xc1
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081DA86A:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081DA7F0

	thumb_func_start sub_081DA87C
sub_081DA87C: @ 0x081DA87C
	push {lr}
	adds r2, r0, #0
	ldr r0, _081DA8A8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081DA8A0
	adds r0, r2, #0
	bl sub_081DA270
	ldr r0, _081DA8AC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081DA8A0:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081DA8A8: .4byte 0x02037C74
_081DA8AC: .4byte 0x081DA7B9
	thumb_func_end sub_081DA87C

	thumb_func_start Phase2Task_39
Phase2Task_39: @ 0x081DA8B0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081DA8E0
	ldr r2, _081DA8E4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081DA8C2:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081DA8C2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DA8E0: .4byte 0x085FCABC
_081DA8E4: .4byte 0x03005B60
	thumb_func_end Phase2Task_39

	thumb_func_start sub_081DA8E8
sub_081DA8E8: @ 0x081DA8E8
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _081DA914
	str r1, [sp]
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x78
	movs r1, #0xc5
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x10]
	b _081DA962
_081DA914:
	cmp r1, #0x10
	bne _081DA938
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xf1
	movs r1, #0x4e
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x12]
	b _081DA962
_081DA938:
	cmp r1, #0x20
	bne _081DA962
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #8
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #2
	str r1, [sp, #8]
	movs r1, #0x4e
	movs r2, #0
	movs r3, #0
	bl sub_081D9F9C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081DA962:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081DA8E8

	thumb_func_start sub_081DA974
sub_081DA974: @ 0x081DA974
	push {lr}
	adds r2, r0, #0
	ldr r0, _081DA9A0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081DA998
	adds r0, r2, #0
	bl sub_081DA270
	ldr r0, _081DA9A4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081DA998:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081DA9A0: .4byte 0x02037C74
_081DA9A4: .4byte 0x081DA8B1
	thumb_func_end sub_081DA974

	thumb_func_start Phase2Task_40
Phase2Task_40: @ 0x081DA9A8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081DA9D8
	ldr r2, _081DA9DC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081DA9BA:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081DA9BA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DA9D8: .4byte 0x085FCAD0
_081DA9DC: .4byte 0x03005B60
	thumb_func_end Phase2Task_40

	thumb_func_start sub_081DA9E0
sub_081DA9E0: @ 0x081DA9E0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _081DAA0E
	movs r0, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	subs r0, #0x84
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x78
	movs r1, #0x2d
	movs r2, #0xc
	movs r3, #4
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x10]
	b _081DAA62
_081DAA0E:
	cmp r1, #0x10
	bne _081DAA36
	movs r0, #0x80
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	subs r0, #4
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x59
	movs r1, #0x61
	movs r2, #0xfc
	movs r3, #4
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x12]
	b _081DAA62
_081DAA36:
	cmp r1, #0x20
	bne _081DAA62
	movs r0, #0x80
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	subs r0, #4
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x97
	movs r1, #0x61
	movs r2, #0x84
	movs r3, #4
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081DAA62:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r0, #0
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081DA9E0

	thumb_func_start sub_081DAA74
sub_081DAA74: @ 0x081DAA74
	push {lr}
	adds r2, r0, #0
	ldr r0, _081DAAA0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081DAA98
	adds r0, r2, #0
	bl sub_081DA270
	ldr r0, _081DAAA4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081DAA98:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081DAAA0: .4byte 0x02037C74
_081DAAA4: .4byte 0x081DA9A9
	thumb_func_end sub_081DAA74

	thumb_func_start Phase2Task_41
Phase2Task_41: @ 0x081DAAA8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _081DAAD8
	ldr r2, _081DAADC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_081DAABA:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081DAABA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081DAAD8: .4byte 0x085FCAE4
_081DAADC: .4byte 0x03005B60
	thumb_func_end Phase2Task_41

	thumb_func_start sub_081DAAE0
sub_081DAAE0: @ 0x081DAAE0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _081DAB12
	movs r2, #0x8e
	lsls r2, r2, #1
	movs r0, #0x83
	str r0, [sp]
	movs r0, #0x23
	str r0, [sp, #4]
	subs r0, #0x26
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x78
	movs r1, #0x50
	movs r3, #8
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x10]
	b _081DAB66
_081DAB12:
	cmp r1, #0x10
	bne _081DAB3A
	movs r0, #0x83
	str r0, [sp]
	movs r0, #0x23
	str r0, [sp, #4]
	subs r0, #0x26
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x78
	movs r1, #0x50
	movs r2, #0x2c
	movs r3, #8
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x12]
	b _081DAB66
_081DAB3A:
	cmp r1, #0x20
	bne _081DAB66
	movs r0, #0x83
	str r0, [sp]
	movs r0, #0x23
	str r0, [sp, #4]
	subs r0, #0x26
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x79
	movs r1, #0x50
	movs r2, #0xa4
	movs r3, #8
	bl sub_081DA10C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081DAB66:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r0, #0
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081DAAE0

	thumb_func_start sub_081DAB78
sub_081DAB78: @ 0x081DAB78
	push {lr}
	adds r2, r0, #0
	ldr r0, _081DABA4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081DAB9C
	adds r0, r2, #0
	bl sub_081DA270
	ldr r0, _081DABA8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_081DAB9C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081DABA4: .4byte 0x02037C74
_081DABA8: .4byte 0x081DAAA9
	thumb_func_end sub_081DAB78

