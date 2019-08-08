.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SpriteCB_VersionBannerLeft
SpriteCB_VersionBannerLeft: @ 0x080A9CD4
	push {lr}
	adds r3, r0, #0
	ldr r2, _080A9D00
	movs r0, #0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080A9D04
	ldrb r0, [r3, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3, #1]
	movs r0, #0x30
	strh r0, [r3, #0x22]
	b _080A9D32
	.align 2, 0
_080A9D00: .4byte 0x03005B60
_080A9D04:
	ldrh r1, [r3, #0x22]
	movs r2, #0x22
	ldrsh r0, [r3, r2]
	cmp r0, #0x30
	beq _080A9D12
	adds r0, r1, #1
	strh r0, [r3, #0x22]
_080A9D12:
	ldrh r1, [r3, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _080A9D20
	subs r0, r1, #1
	strh r0, [r3, #0x2e]
_080A9D20:
	ldr r0, _080A9D38
	movs r2, #0x2e
	ldrsh r1, [r3, r2]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	movs r0, #0x52
	bl SetGpuReg
_080A9D32:
	pop {r0}
	bx r0
	.align 2, 0
_080A9D38: .4byte 0x0851AC0C
	thumb_func_end SpriteCB_VersionBannerLeft

	thumb_func_start SpriteCB_VersionBannerRight
SpriteCB_VersionBannerRight: @ 0x080A9D3C
	push {lr}
	adds r3, r0, #0
	ldr r2, _080A9D64
	movs r0, #0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080A9D68
	ldrb r0, [r3, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3, #1]
	movs r0, #0x30
	b _080A9D74
	.align 2, 0
_080A9D64: .4byte 0x03005B60
_080A9D68:
	ldrh r1, [r3, #0x22]
	movs r2, #0x22
	ldrsh r0, [r3, r2]
	cmp r0, #0x30
	beq _080A9D76
	adds r0, r1, #1
_080A9D74:
	strh r0, [r3, #0x22]
_080A9D76:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_VersionBannerRight

	thumb_func_start SpriteCB_PressStartCopyrightBanner
SpriteCB_PressStartCopyrightBanner: @ 0x080A9D7C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #1
	bne _080A9DA4
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080A9DA4
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _080A9DB0
_080A9DA4:
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_080A9DB0:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PressStartCopyrightBanner

	thumb_func_start CreatePressStartBanner
CreatePressStartBanner: @ 0x080A9DB4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	ldr r2, _080A9E04
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	movs r6, #0
	lsls r7, r1, #0x10
_080A9DC2:
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	ldr r0, _080A9E08
	adds r1, r5, #0
	asrs r2, r7, #0x10
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080A9E0C
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r6, #0
	bl StartSpriteAnim
	movs r0, #1
	strh r0, [r4, #0x2e]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, #0x20
	lsls r5, r5, #0x10
	lsrs r0, r5, #0x10
	cmp r6, #4
	bls _080A9DC2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9E04: .4byte 0xFFC00000
_080A9E08: .4byte 0x0851AD74
_080A9E0C: .4byte 0x020205AC
	thumb_func_end CreatePressStartBanner

	thumb_func_start CreateCopyrightBanner
CreateCopyrightBanner: @ 0x080A9E10
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r2, _080A9E60
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	movs r5, #0
	lsls r6, r1, #0x10
_080A9E1E:
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	ldr r0, _080A9E64
	adds r1, r4, #0
	asrs r2, r6, #0x10
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080A9E68
	adds r2, r2, r0
	adds r1, r5, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl StartSpriteAnim
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #0x20
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	cmp r5, #4
	bls _080A9E1E
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9E60: .4byte 0xFFC00000
_080A9E64: .4byte 0x0851AD74
_080A9E68: .4byte 0x020205AC
	thumb_func_end CreateCopyrightBanner

	thumb_func_start SpriteCB_PokemonLogoShine
SpriteCB_PokemonLogoShine: @ 0x080A9E6C
	push {r4, lr}
	adds r3, r0, #0
	ldrh r2, [r3, #0x20]
	movs r0, #0x20
	ldrsh r1, [r3, r0]
	ldr r0, _080A9EA4
	cmp r1, r0
	bgt _080A9F04
	movs r4, #0x2e
	ldrsh r0, [r3, r4]
	adds r4, r2, #0
	cmp r0, #0
	beq _080A9EF8
	cmp r1, #0x77
	bgt _080A9EA8
	ldrh r1, [r3, #0x30]
	movs r2, #0x30
	ldrsh r0, [r3, r2]
	cmp r0, #0x1e
	bgt _080A9EC0
	adds r1, #1
	strh r1, [r3, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bgt _080A9EC0
	adds r0, r1, #1
	b _080A9EBE
	.align 2, 0
_080A9EA4: .4byte 0x0000010F
_080A9EA8:
	ldrh r1, [r3, #0x30]
	movs r4, #0x30
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _080A9EC0
	subs r0, r1, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080A9EC0
	subs r0, r1, #2
_080A9EBE:
	strh r0, [r3, #0x30]
_080A9EC0:
	ldrh r1, [r3, #0x30]
	movs r0, #0x1f
	ands r0, r1
	lsls r2, r0, #0xa
	lsls r1, r0, #5
	adds r2, r2, r1
	orrs r2, r0
	movs r1, #0x20
	ldrsh r0, [r3, r1]
	ldrh r4, [r3, #0x20]
	cmp r0, #0x84
	beq _080A9EE4
	cmp r0, #0x88
	beq _080A9EE4
	cmp r0, #0x8c
	beq _080A9EE4
	cmp r0, #0x90
	bne _080A9EF4
_080A9EE4:
	ldr r1, _080A9EEC
	ldr r0, _080A9EF0
	strh r0, [r1]
	b _080A9EF8
	.align 2, 0
_080A9EEC: .4byte 0x020377B4
_080A9EF0: .4byte 0x000033F8
_080A9EF4:
	ldr r0, _080A9F00
	strh r2, [r0]
_080A9EF8:
	adds r0, r4, #4
	strh r0, [r3, #0x20]
	b _080A9F10
	.align 2, 0
_080A9F00: .4byte 0x020377B4
_080A9F04:
	ldr r1, _080A9F18
	movs r0, #0
	strh r0, [r1]
	adds r0, r3, #0
	bl DestroySprite
_080A9F10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9F18: .4byte 0x020377B4
	thumb_func_end SpriteCB_PokemonLogoShine

	thumb_func_start SpriteCB_PokemonLogoShine2
SpriteCB_PokemonLogoShine2: @ 0x080A9F1C
	push {lr}
	adds r2, r0, #0
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	ldr r0, _080A9F34
	cmp r1, r0
	bgt _080A9F38
	adds r0, r3, #0
	adds r0, #8
	strh r0, [r2, #0x20]
	b _080A9F3E
	.align 2, 0
_080A9F34: .4byte 0x0000010F
_080A9F38:
	adds r0, r2, #0
	bl DestroySprite
_080A9F3E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_PokemonLogoShine2

	thumb_func_start StartPokemonLogoShine
StartPokemonLogoShine: @ 0x080A9F44
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	beq _080A9F98
	cmp r5, #1
	bgt _080A9F60
	cmp r5, #0
	beq _080A9F64
	b _080AA02E
_080A9F60:
	cmp r5, #2
	bne _080AA02E
_080A9F64:
	ldr r0, _080A9F90
	movs r1, #0
	movs r2, #0x44
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080A9F94
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #1]
	strh r5, [r0, #0x2e]
	b _080AA02E
	.align 2, 0
_080A9F90: .4byte 0x0851ADC0
_080A9F94: .4byte 0x020205AC
_080A9F98:
	ldr r0, _080AA03C
	mov sb, r0
	movs r1, #0
	movs r2, #0x44
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r6, _080AA040
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r2, [r1, #1]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	movs r2, #8
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #1]
	strh r5, [r1, #0x2e]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	mov r0, sb
	movs r1, #0
	movs r2, #0x44
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r5, r6, #0
	adds r5, #0x1c
	adds r0, r1, r5
	ldr r2, _080AA044
	mov sl, r2
	str r2, [r0]
	adds r1, r1, r6
	ldrb r2, [r1, #1]
	adds r0, r4, #0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #1]
	movs r1, #0x50
	rsbs r1, r1, #0
	mov r0, sb
	movs r2, #0x44
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r5, r0, r5
	mov r1, sl
	str r1, [r5]
	adds r0, r0, r6
	ldrb r1, [r0, #1]
	ands r4, r1
	mov r2, r8
	orrs r4, r2
	strb r4, [r0, #1]
_080AA02E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AA03C: .4byte 0x0851ADC0
_080AA040: .4byte 0x020205AC
_080AA044: .4byte 0x080A9F1D
	thumb_func_end StartPokemonLogoShine

	thumb_func_start CB2_GoToClearSaveDataScreen
CB2_GoToClearSaveDataScreen: @ 0x080AA048
	push {lr}
	bl ScanlineEffect_InitHBlankDmaTransfer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r0, _080AA068
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080AA068: .4byte 0x02022ACE
	thumb_func_end CB2_GoToClearSaveDataScreen

	thumb_func_start CB2_InitTitleScreen
CB2_InitTitleScreen: @ 0x080AA06C
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r0, _080AA088
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bhi _080AA0A8
	lsls r0, r0, #2
	ldr r1, _080AA08C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AA088: .4byte 0x03002360
_080AA08C: .4byte 0x080AA090
_080AA090: @ jump table
	.4byte _080AA0A8 @ case 0
	.4byte _080AA18C @ case 1
	.4byte _080AA26C @ case 2
	.4byte _080AA2B4 @ case 3
	.4byte _080AA2E8 @ case 4
	.4byte _080AA3C4 @ case 5
_080AA0A8:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _080AA170
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	add r1, sp, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080AA174
	add r0, sp, #0xc
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080AA178
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0
	str r2, [sp, #0x10]
	add r0, sp, #0x10
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080AA17C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add r0, sp, #0xc
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _080AA180
	str r0, [r1, #4]
	ldr r0, _080AA184
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl ResetPaletteFade
	ldr r0, _080AA188
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	b _080AA3F2
	.align 2, 0
_080AA170: .4byte 0x00007FFF
_080AA174: .4byte 0x040000D4
_080AA178: .4byte 0x8100C000
_080AA17C: .4byte 0x85000100
_080AA180: .4byte 0x05000002
_080AA184: .4byte 0x810001FF
_080AA188: .4byte 0x03002360
_080AA18C:
	ldr r0, _080AA224
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _080AA228
	ldr r1, _080AA22C
	bl LZ77UnCompVram
	ldr r4, _080AA230
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl LoadPalette
	ldr r0, _080AA234
	ldr r1, _080AA238
	bl LZ77UnCompVram
	ldr r0, _080AA23C
	ldr r1, _080AA240
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r0, #0xa0
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _080AA244
	ldr r1, _080AA248
	bl LZ77UnCompVram
	ldr r0, _080AA24C
	ldr r1, _080AA250
	bl LZ77UnCompVram
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _080AA254
	movs r0, #9
	strb r0, [r1]
	ldr r0, _080AA258
	bl LoadCompressedSpriteSheet
	ldr r0, _080AA25C
	bl LoadCompressedSpriteSheet
	ldr r0, _080AA260
	bl LoadCompressedSpriteSheet
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r2, r5, #0
	bl LoadPalette
	ldr r0, _080AA264
	bl LoadSpritePalette
	ldr r0, _080AA268
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #2
	strb r1, [r0]
	b _080AA3F2
	.align 2, 0
_080AA224: .4byte 0x08517C18
_080AA228: .4byte 0x08517AA0
_080AA22C: .4byte 0x06004800
_080AA230: .4byte 0x08517B58
_080AA234: .4byte 0x08519AB4
_080AA238: .4byte 0x06008000
_080AA23C: .4byte 0x0851A298
_080AA240: .4byte 0x0600D000
_080AA244: .4byte 0x0851A6E8
_080AA248: .4byte 0x0600C000
_080AA24C: .4byte 0x0851A9CC
_080AA250: .4byte 0x0600D800
_080AA254: .4byte 0x030030BC
_080AA258: .4byte 0x0851ACE4
_080AA25C: .4byte 0x0851AD8C
_080AA260: .4byte 0x0851ADD8
_080AA264: .4byte 0x0851AD9C
_080AA268: .4byte 0x03002360
_080AA26C:
	ldr r0, _080AA2A4
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080AA2A8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	ldr r0, _080AA2AC
	strh r0, [r1, #0xc]
	subs r0, #0x10
	strh r0, [r1, #0xe]
	ldr r0, _080AA2B0
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	b _080AA3F2
	.align 2, 0
_080AA2A4: .4byte 0x080AA419
_080AA2A8: .4byte 0x03005B60
_080AA2AC: .4byte 0x0000FFF0
_080AA2B0: .4byte 0x03002360
_080AA2B4:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080AA2DC
	str r1, [sp]
	movs r1, #1
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080AA2E0
	bl SetVBlankCallback
	ldr r0, _080AA2E4
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #4
	strb r1, [r0]
	b _080AA3F2
	.align 2, 0
_080AA2DC: .4byte 0x0000FFFF
_080AA2E0: .4byte 0x080AA049
_080AA2E4: .4byte 0x03002360
_080AA2E8:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0x78
	movs r1, #0x50
	movs r3, #0
	bl PanFadeAndZoomScreen
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #0x28
	bl SetGpuReg
	ldr r4, _080AA3A0
	movs r0, #0x2a
	adds r1, r4, #0
	bl SetGpuReg
	movs r1, #0xe0
	lsls r1, r1, #8
	movs r0, #0x2c
	bl SetGpuReg
	movs r0, #0x2e
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x42
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x46
	movs r1, #0
	bl SetGpuReg
	ldr r1, _080AA3A4
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _080AA3A8
	movs r0, #0x4a
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0x84
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0xc
	bl SetGpuReg
	ldr r1, _080AA3AC
	movs r0, #8
	bl SetGpuReg
	ldr r1, _080AA3B0
	movs r0, #0xa
	bl SetGpuReg
	ldr r1, _080AA3B4
	movs r0, #0xc
	bl SetGpuReg
	movs r0, #1
	bl EnableInterrupts
	ldr r1, _080AA3B8
	movs r0, #0
	bl SetGpuReg
	ldr r0, _080AA3BC
	bl m4aSongNumStart
	ldr r0, _080AA3C0
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	b _080AA3F2
	.align 2, 0
_080AA3A0: .4byte 0x0000FFFF
_080AA3A4: .4byte 0x00001F1F
_080AA3A8: .4byte 0x00003F1F
_080AA3AC: .4byte 0x00001A0B
_080AA3B0: .4byte 0x00001B0E
_080AA3B4: .4byte 0x00004981
_080AA3B8: .4byte 0x0000B441
_080AA3BC: .4byte 0x0000019D
_080AA3C0: .4byte 0x03002360
_080AA3C4:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080AA3F2
	movs r0, #0
	bl StartPokemonLogoShine
	str r4, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #4
	movs r3, #4
	bl ScanlineEffect_InitWave
	ldr r0, _080AA3FC
	bl SetMainCallback2
_080AA3F2:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA3FC: .4byte 0x080AA401
	thumb_func_end CB2_InitTitleScreen

	thumb_func_start CB2_GoToCopyrightScreen
CB2_GoToCopyrightScreen: @ 0x080AA400
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_GoToCopyrightScreen

	thumb_func_start Task_TitleScreenPhase1
Task_TitleScreenPhase1: @ 0x080AA418
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080AA46C
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf
	ands r0, r1
	ldr r5, _080AA470
	cmp r0, #0
	bne _080AA43E
	lsls r0, r6, #2
	adds r1, r0, r6
	lsls r1, r1, #3
	adds r1, r1, r5
	movs r2, #0xa
	ldrsh r1, [r1, r2]
	adds r4, r0, #0
	cmp r1, #0
	beq _080AA450
_080AA43E:
	lsls r3, r6, #2
	adds r0, r3, r6
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #0
	movs r1, #1
	strh r1, [r0, #0xa]
	strh r2, [r0, #8]
	adds r4, r3, #0
_080AA450:
	adds r0, r4, r6
	lsls r0, r0, #3
	adds r7, r0, r5
	movs r1, #8
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _080AA494
	ldrh r0, [r7, #8]
	cmp r0, #0xb0
	bne _080AA474
	movs r0, #1
	bl StartPokemonLogoShine
	b _080AA47E
	.align 2, 0
_080AA46C: .4byte 0x03002360
_080AA470: .4byte 0x03005B60
_080AA474:
	cmp r0, #0x40
	bne _080AA47E
	movs r0, #2
	bl StartPokemonLogoShine
_080AA47E:
	ldr r0, _080AA490
	adds r1, r4, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	subs r0, #1
	strh r0, [r1, #8]
	b _080AA50A
	.align 2, 0
_080AA490: .4byte 0x03005B60
_080AA494:
	ldr r1, _080AA510
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	ldr r1, _080AA514
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r0, _080AA518
	movs r4, #0x10
	rsbs r4, r4, #0
	movs r1, #0xa2
	adds r2, r4, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080AA51C
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r0, #0x40
	strh r0, [r1, #0x2e]
	strh r6, [r1, #0x30]
	ldr r0, _080AA520
	movs r1, #0xd2
	adds r2, r4, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	strh r6, [r1, #0x30]
	movs r0, #0x90
	strh r0, [r7, #8]
	ldr r0, _080AA524
	str r0, [r7]
_080AA50A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA510: .4byte 0x00001441
_080AA514: .4byte 0x00003F50
_080AA518: .4byte 0x0851ACB4
_080AA51C: .4byte 0x020205AC
_080AA520: .4byte 0x0851ACCC
_080AA524: .4byte 0x080AA529
	thumb_func_end Task_TitleScreenPhase1

	thumb_func_start Task_TitleScreenPhase2
Task_TitleScreenPhase2: @ 0x080AA528
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080AA578
	ldrh r1, [r0, #0x2e]
	movs r0, #0xf
	ands r0, r1
	ldr r2, _080AA57C
	cmp r0, #0
	bne _080AA54E
	lsls r0, r4, #2
	adds r1, r0, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r3, #0xa
	ldrsh r1, [r1, r3]
	adds r6, r0, #0
	cmp r1, #0
	beq _080AA560
_080AA54E:
	lsls r3, r4, #2
	adds r0, r3, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #0
	movs r1, #1
	strh r1, [r0, #0xa]
	strh r2, [r0, #8]
	adds r6, r3, #0
_080AA560:
	ldr r1, _080AA57C
	adds r0, r6, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #8]
	movs r1, #8
	ldrsh r7, [r5, r1]
	cmp r7, #0
	beq _080AA580
	subs r0, #1
	strh r0, [r5, #8]
	b _080AA5BA
	.align 2, 0
_080AA578: .4byte 0x03002360
_080AA57C: .4byte 0x03005B60
_080AA580:
	movs r0, #1
	strh r0, [r5, #0xa]
	ldr r1, _080AA63C
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _080AA640
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r1, _080AA644
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x80
	movs r1, #0x6c
	bl CreatePressStartBanner
	movs r0, #0x80
	movs r1, #0x94
	bl CreateCopyrightBanner
	strh r7, [r5, #0x10]
	ldr r0, _080AA648
	str r0, [r5]
_080AA5BA:
	ldr r2, _080AA64C
	adds r0, r6, r4
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrh r1, [r3, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080AA5DA
	ldrh r1, [r3, #0xc]
	movs r5, #0xc
	ldrsh r0, [r3, r5]
	cmp r0, #0
	beq _080AA5DA
	adds r0, r1, #1
	strh r0, [r3, #0xc]
_080AA5DA:
	adds r0, r6, r4
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrh r1, [r3, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080AA5F8
	ldrh r1, [r3, #0xe]
	movs r5, #0xe
	ldrsh r0, [r3, r5]
	cmp r0, #0
	beq _080AA5F8
	adds r0, r1, #1
	strh r0, [r3, #0xe]
_080AA5F8:
	adds r4, r6, r4
	lsls r4, r4, #3
	adds r4, r4, r2
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	lsls r5, r1, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	movs r0, #0x28
	bl SetGpuReg
	lsrs r1, r5, #0x10
	movs r0, #0x2a
	bl SetGpuReg
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	lsls r5, r1, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	movs r0, #0x2c
	bl SetGpuReg
	lsrs r1, r5, #0x10
	movs r0, #0x2e
	bl SetGpuReg
	movs r0, #0xf
	strh r0, [r4, #0x12]
	movs r0, #6
	strh r0, [r4, #0x14]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA63C: .4byte 0x00002142
_080AA640: .4byte 0x00000F06
_080AA644: .4byte 0x00001741
_080AA648: .4byte 0x080AA651
_080AA64C: .4byte 0x03005B60
	thumb_func_end Task_TitleScreenPhase2

	thumb_func_start Task_TitleScreenPhase3
Task_TitleScreenPhase3: @ 0x080AA650
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _080AA690
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080AA670
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080AA69C
_080AA670:
	movs r0, #4
	bl FadeOutBGMTemporarily
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080AA694
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080AA698
	bl SetMainCallback2
	b _080AA794
	.align 2, 0
_080AA690: .4byte 0x03002360
_080AA694: .4byte 0x0000FFFF
_080AA698: .4byte 0x080AA7B5
_080AA69C:
	ldrh r1, [r2, #0x2c]
	movs r0, #0x46
	ands r0, r1
	cmp r0, #0x46
	bne _080AA6B4
	ldr r0, _080AA6B0
	bl SetMainCallback2
	b _080AA794
	.align 2, 0
_080AA6B0: .4byte 0x080AA7ED
_080AA6B4:
	movs r0, #0x26
	ands r0, r1
	cmp r0, #0x26
	bne _080AA6E8
	bl CanResetRTC
	cmp r0, #1
	bne _080AA6E8
	movs r0, #4
	bl FadeOutBGMTemporarily
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080AA6E4
	bl SetMainCallback2
	b _080AA794
	.align 2, 0
_080AA6E4: .4byte 0x080AA809
_080AA6E8:
	ldr r0, _080AA714
	ldrh r1, [r0, #0x2c]
	movs r0, #6
	ands r0, r1
	cmp r0, #6
	bne _080AA71C
	movs r0, #4
	bl FadeOutBGMTemporarily
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080AA718
	bl SetMainCallback2
	b _080AA794
	.align 2, 0
_080AA714: .4byte 0x03002360
_080AA718: .4byte 0x080AA825
_080AA71C:
	movs r0, #0x28
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x2a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x2c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x2e
	movs r1, #0
	bl SetGpuReg
	ldr r1, _080AA79C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AA76E
	ldrh r0, [r3, #0x10]
	adds r0, #1
	strh r0, [r3, #0x10]
	ldr r2, _080AA7A0
	movs r1, #0x10
	ldrsh r0, [r3, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r2]
	ldr r1, _080AA7A4
	movs r0, #0
	strh r0, [r1]
_080AA76E:
	ldrb r0, [r3, #8]
	bl UpdateLegendaryMarkingColor
	ldr r0, _080AA7A8
	ldr r1, _080AA7AC
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _080AA794
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080AA7B0
	bl SetMainCallback2
_080AA794:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA79C: .4byte 0x03005B60
_080AA7A0: .4byte 0x02022ACE
_080AA7A4: .4byte 0x02022ACC
_080AA7A8: .4byte 0x030074D0
_080AA7AC: .4byte 0x0000FFFF
_080AA7B0: .4byte 0x080AA7D1
	thumb_func_end Task_TitleScreenPhase3

	thumb_func_start CB2_GoToMainMenu
CB2_GoToMainMenu: @ 0x080AA7B4
	push {lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AA7C6
	ldr r0, _080AA7CC
	bl SetMainCallback2
_080AA7C6:
	pop {r0}
	bx r0
	.align 2, 0
_080AA7CC: .4byte 0x0802F341
	thumb_func_end CB2_GoToMainMenu

	thumb_func_start CB2_GoToResetRtcScreen
CB2_GoToResetRtcScreen: @ 0x080AA7D0
	push {lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AA7E2
	ldr r0, _080AA7E8
	bl SetMainCallback2
_080AA7E2:
	pop {r0}
	bx r0
	.align 2, 0
_080AA7E8: .4byte 0x0816CCF1
	thumb_func_end CB2_GoToResetRtcScreen

	thumb_func_start sub_080AA7EC
sub_080AA7EC: @ 0x080AA7EC
	push {lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AA7FE
	ldr r0, _080AA804
	bl SetMainCallback2
_080AA7FE:
	pop {r0}
	bx r0
	.align 2, 0
_080AA804: .4byte 0x0817AB81
	thumb_func_end sub_080AA7EC

	thumb_func_start sub_080AA808
sub_080AA808: @ 0x080AA808
	push {lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AA81A
	ldr r0, _080AA820
	bl SetMainCallback2
_080AA81A:
	pop {r0}
	bx r0
	.align 2, 0
_080AA820: .4byte 0x0809E861
	thumb_func_end sub_080AA808

	thumb_func_start CB2_GoToBerryFixScreen
CB2_GoToBerryFixScreen: @ 0x080AA824
	push {lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AA83A
	bl m4aMPlayAllStop
	ldr r0, _080AA840
	bl SetMainCallback2
_080AA83A:
	pop {r0}
	bx r0
	.align 2, 0
_080AA840: .4byte 0x081BF021
	thumb_func_end CB2_GoToBerryFixScreen

	thumb_func_start UpdateLegendaryMarkingColor
UpdateLegendaryMarkingColor: @ 0x080AA844
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080AA898
	adds r0, r1, #0
	movs r1, #0x80
	bl Cos
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	adds r2, #0x80
	lsls r0, r2, #5
	subs r0, r0, r2
	cmp r0, #0
	bge _080AA86E
	adds r0, #0xff
_080AA86E:
	asrs r0, r0, #8
	movs r3, #0x1f
	subs r1, r3, r0
	movs r0, #0x16
	muls r0, r2, r0
	cmp r0, #0
	bge _080AA87E
	adds r0, #0xff
_080AA87E:
	asrs r0, r0, #8
	subs r0, r3, r0
	lsls r0, r0, #5
	orrs r1, r0
	movs r0, #0xc0
	lsls r0, r0, #6
	orrs r1, r0
	mov r0, sp
	strh r1, [r0]
	movs r1, #0xef
	movs r2, #2
	bl LoadPalette
_080AA898:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateLegendaryMarkingColor

