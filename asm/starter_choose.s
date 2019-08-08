.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetStarterPokemon
GetStarterPokemon: @ 0x08133E94
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #3
	bls _08133EA0
	movs r1, #0
_08133EA0:
	ldr r0, _08133EAC
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_08133EAC: .4byte 0x08590C08
	thumb_func_end GetStarterPokemon

	thumb_func_start VblankCB_StarterChoose
VblankCB_StarterChoose: @ 0x08133EB0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VblankCB_StarterChoose

	thumb_func_start CB2_ChooseStarter
CB2_ChooseStarter: @ 0x08133EC4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0xc
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	add r1, sp, #4
	movs r0, #0
	strh r0, [r1]
	ldr r2, _08134138
	str r1, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r2, #4]
	ldr r0, _0813413C
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	mov sb, r0
	str r0, [sp, #8]
	add r0, sp, #8
	str r0, [r2]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r2, #4]
	ldr r0, _08134140
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	add r0, sp, #4
	mov r3, sb
	strh r3, [r0]
	str r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r2, #4]
	ldr r0, _08134144
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _08134148
	bl LZ77UnCompVram
	ldr r0, _0813414C
	ldr r1, _08134150
	bl LZ77UnCompVram
	ldr r0, _08134154
	ldr r1, _08134158
	bl LZ77UnCompVram
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0813415C
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r0, _08134160
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r1, #0xa6
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	bl clear_scheduled_bg_copies_to_vram
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	bl ResetAllPicSprites
	bl GetOverworldTextboxPalettePtr
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08134164
	movs r1, #0
	movs r2, #0x40
	bl LoadPalette
	ldr r0, _08134168
	bl LoadCompressedSpriteSheet
	ldr r0, _0813416C
	bl LoadCompressedSpriteSheet
	ldr r0, _08134170
	bl LoadSpritePalettes
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, sb
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _08134174
	bl SetVBlankCallback
	ldr r0, _08134178
	bl SetMainCallback2
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x1f
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0xfe
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #7
	bl SetGpuReg
	movs r1, #0xc1
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldr r0, _0813417C
	movs r1, #0
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08134180
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r3, #1
	mov sl, r3
	mov r1, sl
	strh r1, [r0, #8]
	ldr r0, _08134184
	movs r1, #0x78
	movs r2, #0x38
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08134188
	mov r8, r3
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	strh r4, [r1, #0x2e]
	ldr r6, _0813418C
	ldr r5, _08134190
	ldrb r1, [r5]
	ldrb r2, [r5, #1]
	adds r0, r6, #0
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	strh r4, [r1, #0x2e]
	mov r0, sb
	strh r0, [r1, #0x30]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	adds r0, r6, #0
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	strh r4, [r1, #0x2e]
	mov r3, sl
	strh r3, [r1, #0x30]
	ldrb r1, [r5, #4]
	ldrb r2, [r5, #5]
	adds r0, r6, #0
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	strh r4, [r1, #0x2e]
	movs r0, #2
	strh r0, [r1, #0x30]
	ldr r1, _08134194
	movs r0, #0xff
	strh r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08134138: .4byte 0x040000D4
_0813413C: .4byte 0x8100C000
_08134140: .4byte 0x85000100
_08134144: .4byte 0x81000200
_08134148: .4byte 0x0858FC14
_0813414C: .4byte 0x0858F890
_08134150: .4byte 0x06003000
_08134154: .4byte 0x0858FA1C
_08134158: .4byte 0x06003800
_0813415C: .4byte 0x08590C10
_08134160: .4byte 0x08590BDC
_08134164: .4byte 0x0858F810
_08134168: .4byte 0x08590CE8
_0813416C: .4byte 0x08590CF8
_08134170: .4byte 0x08590D08
_08134174: .4byte 0x08133EB1
_08134178: .4byte 0x08134199
_0813417C: .4byte 0x081341B5
_08134180: .4byte 0x03005B60
_08134184: .4byte 0x08590D20
_08134188: .4byte 0x020205AC
_0813418C: .4byte 0x08590D38
_08134190: .4byte 0x08590BFC
_08134194: .4byte 0x030011F8
	thumb_func_end CB2_ChooseStarter

	thumb_func_start MainCallback2_StarterChoose
MainCallback2_StarterChoose: @ 0x08134198
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MainCallback2_StarterChoose

	thumb_func_start Task_StarterChoose1
Task_StarterChoose1: @ 0x081341B4
	push {r4, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08134208
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrb r0, [r4, #8]
	bl CreateStarterPokemonLabel
	movs r2, #0xa6
	lsls r2, r2, #2
	movs r0, #0
	movs r1, #0
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, _0813420C
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _08134210
	str r0, [r4]
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08134208: .4byte 0x03005B60
_0813420C: .4byte 0x085C9363
_08134210: .4byte 0x08134215
	thumb_func_end Task_StarterChoose1

	thumb_func_start Task_StarterChoose2
Task_StarterChoose2: @ 0x08134214
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _08134290
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r6, r0, r2
	ldrh r7, [r6, #8]
	ldrb r4, [r6, #8]
	ldr r1, _08134294
	ldrh r3, [r1, #0x2e]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _081342B0
	bl sub_0813464C
	ldr r0, _08134298
	ldr r1, _0813429C
	lsls r2, r4, #1
	adds r3, r2, r1
	ldrb r5, [r3]
	adds r1, #1
	adds r2, r2, r1
	ldrb r4, [r2]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0xc]
	ldrh r0, [r6, #8]
	bl GetStarterPokemon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreatePokemonFrontSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _081342A0
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r4, #0
	adds r2, #0x10
	adds r2, r1, r2
	ldr r3, _081342A4
	str r3, [r2]
	adds r4, #0x1c
	adds r1, r1, r4
	ldr r2, _081342A8
	str r2, [r1]
	strh r0, [r6, #0xa]
	ldr r0, _081342AC
	str r0, [r6]
	b _081342EC
	.align 2, 0
_08134290: .4byte 0x03005B60
_08134294: .4byte 0x03002360
_08134298: .4byte 0x08590D50
_0813429C: .4byte 0x08590BFC
_081342A0: .4byte 0x020205AC
_081342A4: .4byte 0x08590CE0
_081342A8: .4byte 0x081347BD
_081342AC: .4byte 0x081342F9
_081342B0:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _081342CC
	cmp r4, #0
	beq _081342CC
	subs r0, r7, #1
	strh r0, [r6, #8]
	ldr r0, _081342C8
	str r0, [r6]
	b _081342EC
	.align 2, 0
_081342C8: .4byte 0x08134689
_081342CC:
	ldrh r1, [r1, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081342EC
	cmp r4, #1
	bhi _081342EC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	ldr r1, _081342F4
	str r1, [r0]
_081342EC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081342F4: .4byte 0x08134689
	thumb_func_end Task_StarterChoose2

	thumb_func_start Task_StarterChoose3
Task_StarterChoose3: @ 0x081342F8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0813433C
	ldr r2, _08134340
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r1, r2
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r3
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _08134336
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #0x78
	bne _08134336
	movs r3, #0x22
	ldrsh r0, [r1, r3]
	cmp r0, #0x40
	bne _08134336
	ldr r0, _08134344
	str r0, [r2]
_08134336:
	pop {r0}
	bx r0
	.align 2, 0
_0813433C: .4byte 0x020205AC
_08134340: .4byte 0x03005B60
_08134344: .4byte 0x08134349
	thumb_func_end Task_StarterChoose3

	thumb_func_start Task_StarterChoose4
Task_StarterChoose4: @ 0x08134348
	push {r4, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081343A8
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrh r0, [r4, #8]
	bl GetStarterPokemon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl PlayCry1
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _081343AC
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _081343B0
	movs r2, #0xa6
	lsls r2, r2, #2
	movs r1, #1
	movs r3, #0xd
	bl sub_08198D44
	ldr r0, _081343B4
	str r0, [r4]
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081343A8: .4byte 0x03005B60
_081343AC: .4byte 0x085C9386
_081343B0: .4byte 0x08590BEC
_081343B4: .4byte 0x081343B9
	thumb_func_end Task_StarterChoose4

	thumb_func_start Task_StarterChoose5
Task_StarterChoose5: @ 0x081343B8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081343DE
	cmp r1, #0
	bgt _081343D8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08134408
	b _08134452
_081343D8:
	cmp r1, #1
	beq _08134408
	b _08134452
_081343DE:
	ldr r2, _081343FC
	ldr r1, _08134400
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	strh r0, [r2]
	bl ResetAllPicSprites
	ldr r0, _08134404
	ldr r0, [r0, #8]
	bl SetMainCallback2
	b _08134452
	.align 2, 0
_081343FC: .4byte 0x02037290
_08134400: .4byte 0x03005B60
_08134404: .4byte 0x03002360
_08134408:
	movs r0, #5
	bl PlaySE
	ldr r0, _08134458
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	adds r5, r5, r0
	ldrb r4, [r5, #0xa]
	ldr r6, _0813445C
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl FreeAndDestroyMonPicSprite
	ldrb r0, [r5, #0xc]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r6
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	ldr r0, _08134460
	str r0, [r5]
_08134452:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08134458: .4byte 0x03005B60
_0813445C: .4byte 0x020205AC
_08134460: .4byte 0x08134465
	thumb_func_end Task_StarterChoose5

	thumb_func_start Task_StarterChoose6
Task_StarterChoose6: @ 0x08134464
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08134478
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _0813447C
	str r0, [r1]
	bx lr
	.align 2, 0
_08134478: .4byte 0x03005B60
_0813447C: .4byte 0x081341B5
	thumb_func_end Task_StarterChoose6

	thumb_func_start CreateStarterPokemonLabel
CreateStarterPokemonLabel: @ 0x08134480
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	bl GetStarterPokemon
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r7, #0
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080BFB68
	adds r2, r0, #0
	movs r3, #0
	movs r5, #0
	ldrb r0, [r2]
	add r1, sp, #0x18
	mov sl, r1
	mov r1, sp
	adds r1, #0x24
	str r1, [sp, #0x2c]
	cmp r0, #0
	beq _081344E2
_081344BE:
	mov r1, sp
	adds r1, r1, r5
	adds r1, #0xc
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _081344E2
	cmp r3, #4
	bls _081344BE
_081344E2:
	movs r3, #0
	ldr r2, _0813462C
	mov r8, r2
	lsls r4, r7, #1
	ldr r0, _08134630
	mov sb, r0
	lsls r6, r6, #1
	mov ip, r6
	ldr r2, _08134634
_081344F4:
	mov r1, sp
	adds r1, r1, r5
	adds r1, #0xc
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r3, #4
	bls _081344F4
	mov r1, sp
	adds r1, r1, r5
	adds r1, #0xc
	movs r0, #0xff
	strb r0, [r1]
	movs r3, #0
	movs r5, #0
	adds r0, r4, r7
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08134558
	mov r6, r8
	mov r8, sl
_0813452E:
	mov r1, r8
	adds r2, r1, r5
	adds r1, r4, r7
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r1, r3, r1
	adds r1, r1, r6
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08134558
	cmp r3, #9
	bls _0813452E
_08134558:
	mov r2, sl
	adds r1, r2, r5
	movs r0, #0xff
	strb r0, [r1]
	mov r2, sb
	ldr r0, [r2]
	ldr r1, [r2, #4]
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, _08134638
	add r0, ip
	mov sb, r0
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0813463C
	ldr r2, [sp, #0x24]
	ands r2, r1
	orrs r2, r0
	str r2, [sp, #0x24]
	ldr r1, _08134638
	adds r1, #1
	mov r8, r1
	add r8, ip
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #0x10
	ldr r0, _08134640
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x2c]
	bl AddWindow
	ldr r4, _08134644
	strh r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	ldr r6, _08134648
	str r6, [sp]
	movs r5, #0
	str r5, [sp, #4]
	add r1, sp, #0xc
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	ldrb r0, [r4]
	str r6, [sp]
	str r5, [sp, #4]
	mov r2, sl
	str r2, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	ldrb r0, [r4]
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	mov r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	movs r2, #0xfc
	lsls r2, r2, #0x18
	adds r0, r0, r2
	adds r1, #9
	lsls r1, r1, #3
	adds r1, #4
	lsls r1, r1, #0x18
	mov r2, r8
	ldrb r4, [r2]
	lsls r5, r4, #0x1b
	lsrs r5, r5, #0x18
	adds r4, #4
	lsls r4, r4, #0x1b
	lsrs r4, r4, #0x18
	lsrs r1, r1, #8
	orrs r1, r0
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	lsls r5, r5, #8
	orrs r5, r4
	movs r0, #0x44
	adds r1, r5, #0
	bl SetGpuReg
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813462C: .4byte 0x082EA31C
_08134630: .4byte 0x08590BF4
_08134634: .4byte 0x085C9393
_08134638: .4byte 0x08590C02
_0813463C: .4byte 0xFFFF00FF
_08134640: .4byte 0xFF00FFFF
_08134644: .4byte 0x030011F8
_08134648: .4byte 0x08590C1C
	thumb_func_end CreateStarterPokemonLabel

	thumb_func_start sub_0813464C
sub_0813464C: @ 0x0813464C
	push {r4, lr}
	ldr r4, _08134684
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #0xff
	strh r0, [r4]
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08134684: .4byte 0x030011F8
	thumb_func_end sub_0813464C

	thumb_func_start Task_MoveStarterChooseCursor
Task_MoveStarterChooseCursor: @ 0x08134688
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_0813464C
	ldr r1, _081346A8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081346AC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081346A8: .4byte 0x03005B60
_081346AC: .4byte 0x081346B1
	thumb_func_end Task_MoveStarterChooseCursor

	thumb_func_start sub_081346B0
sub_081346B0: @ 0x081346B0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081346D0
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrb r0, [r4, #8]
	bl CreateStarterPokemonLabel
	ldr r0, _081346D4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081346D0: .4byte 0x03005B60
_081346D4: .4byte 0x08134215
	thumb_func_end sub_081346B0

	thumb_func_start CreatePokemonFrontSprite
CreatePokemonFrontSprite: @ 0x081346D8
	push {lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	ldr r1, _0813471C
	str r1, [sp, #0xc]
	movs r1, #8
	movs r2, #0
	movs r3, #1
	bl CreatePicSprite2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08134720
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r3, [r2, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	strb r1, [r2, #5]
	add sp, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_0813471C: .4byte 0x0000FFFF
_08134720: .4byte 0x020205AC
	thumb_func_end CreatePokemonFrontSprite

	thumb_func_start sub_08134724
sub_08134724: @ 0x08134724
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0813477C
	ldr r3, _08134780
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r1, #8
	ldrsh r0, [r0, r1]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x20]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r1, #8
	ldrsh r0, [r0, r1]
	lsls r0, r0, #1
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x22]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #4
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813477C: .4byte 0x08590C38
_08134780: .4byte 0x03005B60
	thumb_func_end sub_08134724

	thumb_func_start sub_08134784
sub_08134784: @ 0x08134784
	push {lr}
	adds r3, r0, #0
	ldr r2, _081347AC
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	movs r2, #0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _081347B0
	adds r0, r3, #0
	movs r1, #1
	bl StartSpriteAnimIfDifferent
	b _081347B8
	.align 2, 0
_081347AC: .4byte 0x03005B60
_081347B0:
	adds r0, r3, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
_081347B8:
	pop {r0}
	bx r0
	thumb_func_end sub_08134784

	thumb_func_start StarterPokemonSpriteCallback
StarterPokemonSpriteCallback: @ 0x081347BC
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x20]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #0x78
	ble _081347CE
	subs r0, r2, #4
	strh r0, [r1, #0x20]
_081347CE:
	ldrh r2, [r1, #0x20]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #0x77
	bgt _081347DC
	adds r0, r2, #4
	strh r0, [r1, #0x20]
_081347DC:
	ldrh r2, [r1, #0x22]
	movs r3, #0x22
	ldrsh r0, [r1, r3]
	cmp r0, #0x40
	ble _081347EA
	subs r0, r2, #2
	strh r0, [r1, #0x22]
_081347EA:
	ldrh r2, [r1, #0x22]
	movs r3, #0x22
	ldrsh r0, [r1, r3]
	cmp r0, #0x3f
	bgt _081347F8
	adds r0, r2, #2
	strh r0, [r1, #0x22]
_081347F8:
	pop {r0}
	bx r0
	thumb_func_end StarterPokemonSpriteCallback

