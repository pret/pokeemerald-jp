.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start VBlankCB_Intro
VBlankCB_Intro: @ 0x0816C9F8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_Intro

	thumb_func_start MainCB2_Intro
MainCB2_Intro: @ 0x0816CA10
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _0816CA40
	ldrh r0, [r0, #0x2e]
	cmp r0, #0
	beq _0816CA4C
	ldr r0, _0816CA44
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816CA4C
	ldr r0, _0816CA48
	bl SetMainCallback2
	b _0816CA5C
	.align 2, 0
_0816CA40: .4byte 0x03002360
_0816CA44: .4byte 0x02037C74
_0816CA48: .4byte 0x0816CA65
_0816CA4C:
	ldr r2, _0816CA60
	ldr r1, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0816CA5C
	adds r0, r1, #1
	str r0, [r2]
_0816CA5C:
	pop {r0}
	bx r0
	.align 2, 0
_0816CA60: .4byte 0x03005FE0
	thumb_func_end MainCB2_Intro

	thumb_func_start MainCB2_EndIntro
MainCB2_EndIntro: @ 0x0816CA64
	push {lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816CA76
	ldr r0, _0816CA7C
	bl SetMainCallback2
_0816CA76:
	pop {r0}
	bx r0
	.align 2, 0
_0816CA7C: .4byte 0x080AA06D
	thumb_func_end MainCB2_EndIntro

	thumb_func_start LoadCopyrightGraphics
LoadCopyrightGraphics: @ 0x0816CA80
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0816CABC
	movs r6, #0xc0
	lsls r6, r6, #0x13
	adds r3, r3, r6
	adds r1, r3, #0
	bl LZ77UnCompVram
	ldr r0, _0816CAC0
	adds r4, r4, r6
	adds r1, r4, #0
	bl LZ77UnCompVram
	ldr r0, _0816CAC4
	adds r1, r5, #0
	movs r2, #0x20
	bl LoadPalette
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816CABC: .4byte 0x085C0C94
_0816CAC0: .4byte 0x085C0EF8
_0816CAC4: .4byte 0x085C0C74
	thumb_func_end LoadCopyrightGraphics

	thumb_func_start SerialCB_CopyrightScreen
SerialCB_CopyrightScreen: @ 0x0816CAC8
	push {lr}
	ldr r0, _0816CAD4
	bl GameCubeMultiBoot_HandleSerialInterrupt
	pop {r0}
	bx r0
	.align 2, 0
_0816CAD4: .4byte 0x03005FF0
	thumb_func_end SerialCB_CopyrightScreen

	thumb_func_start SetUpCopyrightScreen
SetUpCopyrightScreen: @ 0x0816CAD8
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r0, _0816CAF8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r5, r0, r1
	ldrb r4, [r5]
	cmp r4, #0x8c
	bne _0816CAEC
	b _0816CC10
_0816CAEC:
	cmp r4, #0x8c
	bgt _0816CAFC
	cmp r4, #0
	beq _0816CB04
	b _0816CBCC
	.align 2, 0
_0816CAF8: .4byte 0x03002360
_0816CAFC:
	cmp r4, #0x8d
	bne _0816CB02
	b _0816CC3C
_0816CB02:
	b _0816CBCC
_0816CB04:
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
	ldr r2, _0816CBE8
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	str r4, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0816CBEC
	add r0, sp, #4
	bl CpuSet
	str r4, [sp, #8]
	add r0, sp, #8
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ldr r2, _0816CBF0
	bl CpuSet
	add r0, sp, #0xc
	strh r4, [r0]
	ldr r1, _0816CBF4
	ldr r2, _0816CBF8
	bl CpuSet
	bl ResetPaletteFade
	movs r1, #0xe0
	lsls r1, r1, #6
	movs r0, #0
	movs r2, #0
	bl LoadCopyrightGraphics
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0816CBFC
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r1, #0xe0
	lsls r1, r1, #3
	movs r0, #8
	bl SetGpuReg
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _0816CC00
	bl SetVBlankCallback
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0816CC04
	bl SetSerialCallback
	ldr r0, _0816CC08
	bl GameCubeMultiBoot_Init
_0816CBCC:
	bl UpdatePaletteFade
	ldr r0, _0816CC0C
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, _0816CC08
	bl sGameCubeMultiBoot_Main
	b _0816CC84
	.align 2, 0
_0816CBE8: .4byte 0x00007FFF
_0816CBEC: .4byte 0x05006000
_0816CBF0: .4byte 0x05000100
_0816CBF4: .4byte 0x05000002
_0816CBF8: .4byte 0x010001FF
_0816CBFC: .4byte 0x0000FFFF
_0816CC00: .4byte 0x0816C9F9
_0816CC04: .4byte 0x0816CAC9
_0816CC08: .4byte 0x03005FF0
_0816CC0C: .4byte 0x03002360
_0816CC10:
	ldr r4, _0816CC38
	adds r0, r4, #0
	bl sGameCubeMultiBoot_Main
	ldrb r0, [r4, #2]
	cmp r0, #1
	beq _0816CC84
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0816CC84
	.align 2, 0
_0816CC38: .4byte 0x03005FF0
_0816CC3C:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816CC84
	ldr r0, _0816CC64
	movs r1, #0
	bl CreateTask
	ldr r0, _0816CC68
	bl SetMainCallback2
	ldr r1, _0816CC6C
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _0816CC70
	adds r0, r1, #0
	bl GameCubeMultiBoot_ExecuteProgram
	b _0816CC7A
	.align 2, 0
_0816CC64: .4byte 0x0816CCFD
_0816CC68: .4byte 0x0816CA11
_0816CC6C: .4byte 0x03005FF0
_0816CC70:
	bl GameCubeMultiBoot_Quit
	ldr r0, _0816CC80
	bl SetSerialCallback
_0816CC7A:
	movs r0, #0
	b _0816CC86
	.align 2, 0
_0816CC80: .4byte 0x0800B4F5
_0816CC84:
	movs r0, #1
_0816CC86:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetUpCopyrightScreen

	thumb_func_start CB2_InitCopyrightScreenAfterBootup
CB2_InitCopyrightScreenAfterBootup: @ 0x0816CC90
	push {lr}
	bl SetUpCopyrightScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0816CCDE
	bl sub_08153498
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetSaveBlocksPointers
	bl ResetMenuAndMonGlobals
	bl Save_ResetSaveCounters
	movs r0, #0
	bl Save_LoadGameData
	ldr r0, _0816CCE4
	ldrh r0, [r0]
	cmp r0, #0
	beq _0816CCC2
	cmp r0, #2
	bne _0816CCC6
_0816CCC2:
	bl Sav2_ClearSetDefault
_0816CCC6:
	ldr r0, _0816CCE8
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl SetPokemonCryStereo
	ldr r0, _0816CCEC
	movs r1, #0xe0
	lsls r1, r1, #9
	bl InitHeap
_0816CCDE:
	pop {r0}
	bx r0
	.align 2, 0
_0816CCE4: .4byte 0x03005F50
_0816CCE8: .4byte 0x03005AF0
_0816CCEC: .4byte 0x02000000
	thumb_func_end CB2_InitCopyrightScreenAfterBootup

	thumb_func_start CB2_InitCopyrightScreenAfterTitleScreen
CB2_InitCopyrightScreenAfterTitleScreen: @ 0x0816CCF0
	push {lr}
	bl SetUpCopyrightScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_InitCopyrightScreenAfterTitleScreen

	thumb_func_start Task_IntroLoadPart1Graphics
Task_IntroLoadPart1Graphics: @ 0x0816CCFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	mov r8, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0
	bl SetVBlankCallback
	ldr r4, _0816CEA0
	bl Random
	movs r1, #1
	ands r1, r0
	strh r1, [r4]
	bl intro_reset_and_hide_bgs
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0x50
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0x18
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0x28
	bl SetGpuReg
	ldr r0, _0816CEA4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0816CEA8
	ldr r1, _0816CEAC
	bl LZ77UnCompVram
	ldr r1, _0816CEB0
	add r0, sp, #8
	movs r6, #0
	strh r6, [r0]
	ldr r4, _0816CEB4
	str r0, [r4]
	str r1, [r4, #4]
	ldr r5, _0816CEB8
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0816CEBC
	ldr r1, _0816CEC0
	bl LZ77UnCompVram
	ldr r1, _0816CEC4
	add r0, sp, #8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0816CEC8
	ldr r1, _0816CECC
	bl LZ77UnCompVram
	ldr r1, _0816CED0
	add r0, sp, #8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0816CED4
	ldr r1, _0816CED8
	bl LZ77UnCompVram
	ldr r1, _0816CEDC
	add r0, sp, #8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0816CEE0
	movs r5, #0x80
	lsls r5, r5, #2
	movs r1, #0
	adds r2, r5, #0
	bl LoadPalette
	ldr r1, _0816CEE4
	movs r0, #0xe
	bl SetGpuReg
	ldr r1, _0816CEE8
	movs r0, #0xc
	bl SetGpuReg
	ldr r1, _0816CEEC
	movs r0, #0xa
	bl SetGpuReg
	movs r1, #0x90
	lsls r1, r1, #8
	movs r0, #8
	bl SetGpuReg
	ldr r0, _0816CEF0
	bl LoadCompressedSpriteSheet
	ldr r0, _0816CEF4
	bl LoadCompressedSpriteSheet
	ldr r0, _0816CEF8
	bl LoadSpritePalettes
	ldr r0, _0816CEFC
	bl LoadCompressedSpriteSheet
	ldr r0, _0816CF00
	bl LoadSpritePalettes
	ldr r4, _0816CF04
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r1, r4, r3
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuSet
	movs r0, #0xe1
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r4, #0
	movs r2, #0xf
	bl CpuSet
	movs r3, #0xd2
	lsls r3, r3, #1
	adds r1, r4, r3
	adds r0, r4, #0
	movs r2, #0xe
	bl CpuSet
	movs r0, #0xc3
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r4, #0
	movs r2, #0xd
	bl CpuSet
	movs r3, #0xb4
	lsls r3, r3, #1
	adds r1, r4, r3
	adds r0, r4, #0
	movs r2, #0xc
	bl CpuSet
	movs r0, #0xa5
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r4, #0
	movs r2, #0xb
	bl CpuSet
	movs r3, #0x96
	lsls r3, r3, #1
	adds r1, r4, r3
	adds r0, r4, #0
	movs r2, #0xa
	bl CpuSet
	movs r0, #0x78
	movs r1, #0x50
	movs r2, #0
	bl CreatePart1Animations
	movs r1, #0xe
	rsbs r1, r1, #0
	movs r0, #0x78
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xec
	adds r2, r5, #0
	movs r3, #1
	bl CreateWaterDrop
	ldr r2, _0816CF08
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #8]
	ldr r0, _0816CF0C
	str r0, [r1]
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816CEA0: .4byte 0x0203B994
_0816CEA4: .4byte 0x085C2468
_0816CEA8: .4byte 0x085C1878
_0816CEAC: .4byte 0x06008000
_0816CEB0: .4byte 0x06008800
_0816CEB4: .4byte 0x040000D4
_0816CEB8: .4byte 0x81000400
_0816CEBC: .4byte 0x085C1C2C
_0816CEC0: .4byte 0x06009000
_0816CEC4: .4byte 0x06009800
_0816CEC8: .4byte 0x085C1F60
_0816CECC: .4byte 0x0600A000
_0816CED0: .4byte 0x0600A800
_0816CED4: .4byte 0x085C2250
_0816CED8: .4byte 0x0600B000
_0816CEDC: .4byte 0x0600B800
_0816CEE0: .4byte 0x085C1678
_0816CEE4: .4byte 0x00009603
_0816CEE8: .4byte 0x00009402
_0816CEEC: .4byte 0x00009201
_0816CEF0: .4byte 0x085C6090
_0816CEF4: .4byte 0x085C60A0
_0816CEF8: .4byte 0x085C60B0
_0816CEFC: .4byte 0x085C5B28
_0816CF00: .4byte 0x085C5B38
_0816CF04: .4byte 0x020375B4
_0816CF08: .4byte 0x03005B60
_0816CF0C: .4byte 0x0816CF11
	thumb_func_end Task_IntroLoadPart1Graphics

	thumb_func_start Task_IntroFadeIn
Task_IntroFadeIn: @ 0x0816CF10
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	movs r5, #0
	str r5, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0816CF64
	bl SetVBlankCallback
	movs r1, #0xfa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r1, _0816CF68
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816CF6C
	str r1, [r0]
	ldr r0, _0816CF70
	str r5, [r0]
	movs r0, #0xcf
	lsls r0, r0, #1
	bl m4aSongNumStart
	bl ResetSerial
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816CF64: .4byte 0x0816C9F9
_0816CF68: .4byte 0x03005B60
_0816CF6C: .4byte 0x0816CF75
_0816CF70: .4byte 0x03005FE0
	thumb_func_end Task_IntroFadeIn

	thumb_func_start Task_IntroWaterDrops
Task_IntroWaterDrops: @ 0x0816CF74
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r5, _0816D068
	ldr r0, [r5]
	cmp r0, #0x4c
	bne _0816CFA2
	ldr r2, _0816D06C
	ldr r1, _0816D070
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r3, #8
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #0x2e]
_0816CFA2:
	ldr r0, [r5]
	cmp r0, #0x80
	bne _0816CFB0
	ldr r0, _0816D074
	movs r1, #0
	bl CreateTask
_0816CFB0:
	ldr r0, [r5]
	cmp r0, #0xfb
	bne _0816CFD2
	ldr r2, _0816D06C
	ldr r1, _0816D070
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r3, #8
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #0x2e]
_0816CFD2:
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _0816CFE4
	ldr r0, _0816D078
	movs r1, #0
	bl CreateTask
_0816CFE4:
	ldr r1, [r5]
	movs r0, #0xb8
	lsls r0, r0, #1
	cmp r1, r0
	bne _0816D004
	movs r2, #0x80
	lsls r2, r2, #3
	movs r0, #0x70
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x30
	movs r1, #0
	movs r3, #5
	bl CreateWaterDrop
_0816D004:
	ldr r1, [r5]
	movs r0, #0xc0
	lsls r0, r0, #1
	cmp r1, r0
	bne _0816D024
	movs r2, #0x80
	lsls r2, r2, #3
	movs r0, #0x80
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xc8
	movs r1, #0x3c
	movs r3, #9
	bl CreateWaterDrop
_0816D024:
	ldr r0, [r5]
	movs r4, #0x8c
	lsls r4, r4, #2
	cmp r0, r4
	bne _0816D036
	ldr r0, _0816D07C
	movs r1, #0
	bl CreateTask
_0816D036:
	ldr r0, [r5]
	cmp r0, r4
	bls _0816D05E
	ldr r1, _0816D070
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0x50
	strh r1, [r0, #0xa]
	strh r2, [r0, #0xc]
	movs r1, #0x18
	strh r1, [r0, #0xe]
	strh r2, [r0, #0x10]
	movs r1, #0x28
	strh r1, [r0, #0x12]
	strh r2, [r0, #0x14]
	ldr r1, _0816D080
	str r1, [r0]
_0816D05E:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816D068: .4byte 0x03005FE0
_0816D06C: .4byte 0x020205AC
_0816D070: .4byte 0x03005B60
_0816D074: .4byte 0x0816EF0D
_0816D078: .4byte 0x0816EFC5
_0816D07C: .4byte 0x0816D085
_0816D080: .4byte 0x0816D139
	thumb_func_end Task_IntroWaterDrops

	thumb_func_start Task_IntroWaterDrops_3
Task_IntroWaterDrops_3: @ 0x0816D084
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0816D0B8
	adds r4, r0, r1
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0816D0A8
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
_0816D0A8:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0816D0BC
	cmp r0, #1
	beq _0816D0F8
	b _0816D108
	.align 2, 0
_0816D0B8: .4byte 0x03005B68
_0816D0BC:
	ldr r0, _0816D0F0
	ldr r2, _0816D0F4
	movs r1, #8
	ldrsh r3, [r4, r1]
	lsls r3, r3, #1
	adds r1, r3, r2
	ldrb r1, [r1]
	adds r2, #1
	adds r3, r3, r2
	ldrh r2, [r4, #6]
	ldrb r3, [r3]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSprite
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0xc
	strh r0, [r4, #2]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0816D108
	.align 2, 0
_0816D0F0: .4byte 0x085C5B6C
_0816D0F4: .4byte 0x085C5B84
_0816D0F8:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _0816D108
	strh r0, [r4]
_0816D108:
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0x3c
	ble _0816D116
	adds r0, r5, #0
	bl DestroyTask
_0816D116:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_IntroWaterDrops_3

	thumb_func_start sub_0816D11C
sub_0816D11C: @ 0x0816D11C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0816D134
	adds r0, r1, #0
	bl DestroySprite
_0816D134:
	pop {r0}
	bx r0
	thumb_func_end sub_0816D11C

	thumb_func_start Task_IntroScrollDownAndShowFlygon
Task_IntroScrollDownAndShowFlygon: @ 0x0816D138
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r4, r1, #0
	ldr r5, _0816D1DC
	ldr r2, [r5]
	ldr r0, _0816D1E0
	cmp r2, r0
	bhi _0816D1FC
	ldr r0, _0816D1E4
	lsls r4, r1, #2
	adds r4, r4, r1
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0xc]
	adds r1, r0, r1
	ldr r0, _0816D1E8
	adds r1, r1, r0
	asrs r0, r1, #0x10
	strh r0, [r4, #0xa]
	strh r1, [r4, #0xc]
	ldrh r1, [r4, #0xa]
	movs r0, #0x1a
	bl SetGpuReg
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0x10]
	adds r1, r0, r1
	ldr r0, _0816D1EC
	adds r1, r1, r0
	asrs r0, r1, #0x10
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	ldrh r1, [r4, #0xe]
	movs r0, #0x16
	bl SetGpuReg
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0x14]
	adds r1, r0, r1
	ldr r0, _0816D1F0
	adds r1, r1, r0
	asrs r0, r1, #0x10
	strh r0, [r4, #0x12]
	strh r1, [r4, #0x14]
	ldrh r1, [r4, #0x12]
	movs r0, #0x12
	bl SetGpuReg
	ldr r1, [r5]
	movs r0, #0xd0
	lsls r0, r0, #2
	cmp r1, r0
	bne _0816D222
	ldr r0, _0816D1F4
	movs r1, #0x78
	movs r2, #0xa0
	movs r3, #0xa
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0816D1F8
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	b _0816D222
	.align 2, 0
_0816D1DC: .4byte 0x03005FE0
_0816D1E0: .4byte 0x00000387
_0816D1E4: .4byte 0x03005B60
_0816D1E8: .4byte 0xFFFFA000
_0816D1EC: .4byte 0xFFFF8000
_0816D1F0: .4byte 0xFFFF4000
_0816D1F4: .4byte 0x085C6078
_0816D1F8: .4byte 0x020205AC
_0816D1FC:
	ldr r0, _0816D22C
	cmp r2, r0
	bls _0816D222
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0816D230
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0816D234
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816D238
	str r1, [r0]
_0816D222:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816D22C: .4byte 0x000003EF
_0816D230: .4byte 0x0000FFFF
_0816D234: .4byte 0x03005B60
_0816D238: .4byte 0x0816D23D
	thumb_func_end Task_IntroScrollDownAndShowFlygon

	thumb_func_start Task_IntroWaitToSetupPart3
Task_IntroWaitToSetupPart3: @ 0x0816D23C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0816D260
	ldr r1, [r0]
	ldr r0, _0816D264
	cmp r1, r0
	bls _0816D25A
	ldr r0, _0816D268
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816D26C
	str r0, [r1]
_0816D25A:
	pop {r0}
	bx r0
	.align 2, 0
_0816D260: .4byte 0x03005FE0
_0816D264: .4byte 0x00000402
_0816D268: .4byte 0x03005B60
_0816D26C: .4byte 0x0816D271
	thumb_func_end Task_IntroWaitToSetupPart3

	thumb_func_start Task_IntroLoadPart2Graphics
Task_IntroLoadPart2Graphics: @ 0x0816D270
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl intro_reset_and_hide_bgs
	movs r0, #0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0816D2B4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0816D2B8
	strh r1, [r0]
	ldr r0, _0816D2BC
	strh r1, [r0]
	movs r0, #1
	bl load_intro_part2_graphics
	ldr r1, _0816D2C0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816D2C4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816D2B4: .4byte 0x0203B9F0
_0816D2B8: .4byte 0x0203B9F2
_0816D2BC: .4byte 0x0203B998
_0816D2C0: .4byte 0x03005B60
_0816D2C4: .4byte 0x0816D2C9
	thumb_func_end Task_IntroLoadPart2Graphics

	thumb_func_start Task_IntroStartBikeRide
Task_IntroStartBikeRide: @ 0x0816D2C8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0816D2E0
	ldrh r0, [r0]
	cmp r0, #0
	bne _0816D2E8
	ldr r0, _0816D2E4
	bl LoadCompressedSpriteSheet
	b _0816D2EE
	.align 2, 0
_0816D2E0: .4byte 0x0203B994
_0816D2E4: .4byte 0x085D278C
_0816D2E8:
	ldr r0, _0816D350
	bl LoadCompressedSpriteSheet
_0816D2EE:
	ldr r0, _0816D354
	bl LoadCompressedSpriteSheet
	ldr r0, _0816D358
	bl LoadCompressedSpriteSheet
	movs r6, #0
	lsls r7, r4, #2
	ldr r5, _0816D35C
_0816D300:
	lsls r0, r6, #3
	adds r0, r0, r5
	bl LoadCompressedSpriteSheet
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0816D300
	ldr r0, _0816D360
	bl LoadSpritePalettes
	ldr r0, _0816D364
	bl LoadSpritePalettes
	ldr r0, _0816D368
	movs r5, #0x88
	lsls r5, r5, #1
	adds r1, r5, #0
	movs r2, #0x80
	movs r3, #0
	bl CreateSprite
	ldr r0, _0816D36C
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x6e
	movs r3, #1
	bl CreateSprite
	ldr r0, _0816D370
	ldrh r0, [r0]
	cmp r0, #0
	bne _0816D374
	adds r0, r5, #0
	movs r1, #0x64
	bl intro_create_brendan_sprite
	b _0816D37C
	.align 2, 0
_0816D350: .4byte 0x085D279C
_0816D354: .4byte 0x085D27AC
_0816D358: .4byte 0x085D27CC
_0816D35C: .4byte 0x085C5B9C
_0816D360: .4byte 0x085D27DC
_0816D364: .4byte 0x085C5BBC
_0816D368: .4byte 0x085C5C90
_0816D36C: .4byte 0x085C5C58
_0816D370: .4byte 0x0203B994
_0816D374:
	adds r0, r5, #0
	movs r1, #0x64
	bl intro_create_may_sprite
_0816D37C:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _0816D410
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r5, r2, #0
	adds r5, #0x1c
	adds r3, r0, r5
	ldr r1, _0816D414
	str r1, [r3]
	adds r2, #8
	adds r0, r0, r2
	ldr r1, _0816D418
	str r1, [r0]
	ldr r0, _0816D41C
	adds r4, r7, r4
	lsls r4, r4, #3
	adds r4, r4, r0
	strh r6, [r4, #0xa]
	ldr r0, _0816D420
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0x50
	movs r3, #4
	bl CreateSprite
	movs r0, #0x40
	rsbs r0, r0, #0
	movs r1, #0x3c
	bl sub_0817B884
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0816D424
	str r1, [r0]
	strh r6, [r4, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0816D428
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0816D42C
	bl SetVBlankCallback
	movs r1, #0x80
	lsls r1, r1, #7
	movs r2, #0x80
	lsls r2, r2, #3
	movs r0, #1
	movs r3, #0x10
	bl CreateBicycleAnimationTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #8]
	movs r0, #1
	bl sub_0817B010
	ldr r0, _0816D430
	str r0, [r4]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816D410: .4byte 0x020205AC
_0816D414: .4byte 0x0816F7B9
_0816D418: .4byte 0x085C5E78
_0816D41C: .4byte 0x03005B60
_0816D420: .4byte 0x085C5BF4
_0816D424: .4byte 0x0816F895
_0816D428: .4byte 0x0000FFFF
_0816D42C: .4byte 0x0816C9F9
_0816D430: .4byte 0x0816D435
	thumb_func_end Task_IntroStartBikeRide

	thumb_func_start Task_IntroHandleBikeAndFlygonMovement
Task_IntroHandleBikeAndFlygonMovement: @ 0x0816D434
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r5, _0816D594
	ldr r1, [r5]
	movs r0, #0xe8
	lsls r0, r0, #3
	cmp r1, r0
	bne _0816D460
	ldr r1, _0816D598
	movs r0, #2
	strh r0, [r1]
	ldr r1, _0816D59C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	bl DestroyTask
_0816D460:
	ldr r1, [r5]
	ldr r0, _0816D5A0
	cmp r1, r0
	bls _0816D488
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0816D5A4
	str r1, [sp]
	movs r1, #8
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0816D59C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816D5A8
	str r1, [r0]
_0816D488:
	ldr r1, [r5]
	ldr r0, _0816D5AC
	ldr r3, _0816D59C
	cmp r1, r0
	bne _0816D4AC
	ldr r2, _0816D5B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r7, #0xa
	ldrsh r1, [r0, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #0x2e]
_0816D4AC:
	ldr r1, [r5]
	ldr r0, _0816D5B4
	cmp r1, r0
	bne _0816D4CE
	ldr r2, _0816D5B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r7, #0xa
	ldrsh r1, [r0, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x2e]
_0816D4CE:
	ldr r1, [r5]
	ldr r0, _0816D5B8
	cmp r1, r0
	bne _0816D4F0
	ldr r2, _0816D5B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r7, #0xc
	ldrsh r1, [r0, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #0x2e]
_0816D4F0:
	ldr r1, [r5]
	ldr r0, _0816D5BC
	cmp r1, r0
	bne _0816D512
	ldr r2, _0816D5B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r7, #0xa
	ldrsh r1, [r0, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #0x2e]
_0816D512:
	ldr r1, [r5]
	movs r0, #0xc5
	lsls r0, r0, #3
	cmp r1, r0
	bne _0816D536
	ldr r2, _0816D5B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r7, #0xa
	ldrsh r1, [r0, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strh r1, [r0, #0x2e]
_0816D536:
	ldr r1, [r5]
	ldr r0, _0816D5C0
	cmp r1, r0
	bne _0816D558
	ldr r2, _0816D5B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r4, #0xa
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #4
	strh r1, [r0, #0x2e]
_0816D558:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r3
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x30
	bl Sin
	ldr r1, _0816D5C4
	strh r0, [r1]
	ldrh r2, [r4, #0xe]
	movs r7, #0xe
	ldrsh r1, [r4, r7]
	ldr r0, _0816D5C8
	cmp r1, r0
	bgt _0816D584
	adds r0, r2, #1
	strh r0, [r4, #0xe]
_0816D584:
	movs r0, #0
	bl sub_0817B400
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816D594: .4byte 0x03005FE0
_0816D598: .4byte 0x0203B9F4
_0816D59C: .4byte 0x03005B60
_0816D5A0: .4byte 0x0000079A
_0816D5A4: .4byte 0x0000FFFF
_0816D5A8: .4byte 0x0816D5CD
_0816D5AC: .4byte 0x00000455
_0816D5B0: .4byte 0x020205AC
_0816D5B4: .4byte 0x000004BE
_0816D5B8: .4byte 0x00000572
_0816D5BC: .4byte 0x00000576
_0816D5C0: .4byte 0x000006BF
_0816D5C4: .4byte 0x0203B998
_0816D5C8: .4byte 0x000001FF
	thumb_func_end Task_IntroHandleBikeAndFlygonMovement

	thumb_func_start Task_IntroWaitToSetupPart2
Task_IntroWaitToSetupPart2: @ 0x0816D5CC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0816D5F0
	ldr r1, [r0]
	ldr r0, _0816D5F4
	cmp r1, r0
	bls _0816D5EA
	ldr r0, _0816D5F8
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816D5FC
	str r0, [r1]
_0816D5EA:
	pop {r0}
	bx r0
	.align 2, 0
_0816D5F0: .4byte 0x03005FE0
_0816D5F4: .4byte 0x00000814
_0816D5F8: .4byte 0x03005B60
_0816D5FC: .4byte 0x0816D991
	thumb_func_end Task_IntroWaitToSetupPart2

	thumb_func_start sub_0816D600
sub_0816D600: @ 0x0816D600
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #4
	strh r0, [r4, #0x34]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #8
	bls _0816D614
	b _0816D79E
_0816D614:
	lsls r0, r0, #2
	ldr r1, _0816D620
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816D620: .4byte 0x0816D624
_0816D624: @ jump table
	.4byte _0816D648 @ case 0
	.4byte _0816D65E @ case 1
	.4byte _0816D67C @ case 2
	.4byte _0816D6A0 @ case 3
	.4byte _0816D6BC @ case 4
	.4byte _0816D6DE @ case 5
	.4byte _0816D6F6 @ case 6
	.4byte _0816D752 @ case 7
	.4byte _0816D780 @ case 8
_0816D648:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb3
	bgt _0816D658
	b _0816D79E
_0816D658:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0816D65E:
	ldrh r0, [r4, #0x20]
	subs r0, #4
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	beq _0816D66E
	b _0816D79E
_0816D66E:
	movs r0, #8
	strh r0, [r4, #0x2e]
	movs r0, #0x14
	strh r0, [r4, #0x30]
	movs r0, #2
	strh r0, [r4, #0x32]
	b _0816D79E
_0816D67C:
	ldrh r1, [r4, #0x20]
	adds r1, #8
	strh r1, [r4, #0x20]
	ldrh r0, [r4, #0x22]
	subs r0, #2
	strh r0, [r4, #0x22]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x7c
	beq _0816D692
	b _0816D79E
_0816D692:
	movs r0, #8
	strh r0, [r4, #0x2e]
	movs r0, #0x14
	strh r0, [r4, #0x30]
	movs r0, #3
	strh r0, [r4, #0x32]
	b _0816D79E
_0816D6A0:
	ldrh r0, [r4, #0x22]
	adds r0, #4
	strh r0, [r4, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	bne _0816D79E
	movs r0, #8
	strh r0, [r4, #0x2e]
	movs r0, #0xa
	strh r0, [r4, #0x30]
	movs r0, #4
	strh r0, [r4, #0x32]
	b _0816D79E
_0816D6BC:
	ldrh r1, [r4, #0x20]
	subs r1, #8
	strh r1, [r4, #0x20]
	ldrh r0, [r4, #0x22]
	subs r0, #2
	strh r0, [r4, #0x22]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x3c
	bne _0816D79E
	movs r0, #8
	strh r0, [r4, #0x2e]
	movs r0, #0xa
	strh r0, [r4, #0x30]
	movs r0, #5
	strh r0, [r4, #0x32]
	b _0816D79E
_0816D6DE:
	ldrh r0, [r4, #0x20]
	adds r0, #0x3c
	strh r0, [r4, #0x20]
	movs r0, #0xc0
	strh r0, [r4, #0x36]
	movs r0, #0x80
	strh r0, [r4, #0x38]
	movs r0, #3
	strh r0, [r4, #0x3a]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0816D6F6:
	ldrh r0, [r4, #0x36]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x3c
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x14
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x36]
	adds r1, #2
	strh r1, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	adds r0, #4
	strh r0, [r4, #0x38]
	movs r0, #0xff
	ands r1, r0
	cmp r1, #0x40
	bne _0816D79E
	adds r2, r4, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2]
	ldrh r0, [r4, #0x3a]
	subs r0, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _0816D79E
	ldrh r0, [r4, #0x24]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	strh r1, [r4, #0x24]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	b _0816D79C
_0816D752:
	ldrh r0, [r4, #0x20]
	subs r0, #2
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x14
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x38]
	adds r0, #4
	strh r0, [r4, #0x38]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0816D79E
	adds r0, r4, #0
	bl DestroySprite
	b _0816D79E
_0816D780:
	ldrh r0, [r4, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	subs r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816D79E
	ldrh r0, [r4, #0x32]
_0816D79C:
	strh r0, [r4, #0x2e]
_0816D79E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0816D600

	thumb_func_start sub_0816D7A4
sub_0816D7A4: @ 0x0816D7A4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bls _0816D7B2
	b _0816D8BE
_0816D7B2:
	lsls r0, r0, #2
	ldr r1, _0816D7BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816D7BC: .4byte 0x0816D7C0
_0816D7C0: @ jump table
	.4byte _0816D7D8 @ case 0
	.4byte _0816D7EC @ case 1
	.4byte _0816D804 @ case 2
	.4byte _0816D848 @ case 3
	.4byte _0816D87E @ case 4
	.4byte _0816D8AE @ case 5
_0816D7D8:
	ldr r0, _0816D7E8
	ldr r1, [r0]
	movs r0, #0x99
	lsls r0, r0, #3
	cmp r1, r0
	bne _0816D8BE
	b _0816D89E
	.align 2, 0
_0816D7E8: .4byte 0x03005FE0
_0816D7EC:
	ldr r0, _0816D800
	ldr r1, [r0]
	movs r0, #0xc5
	lsls r0, r0, #3
	cmp r1, r0
	bne _0816D854
	adds r0, r4, #0
	movs r1, #0
	b _0816D8A2
	.align 2, 0
_0816D800: .4byte 0x03005FE0
_0816D804:
	ldr r0, _0816D82C
	ldr r1, [r0]
	ldr r0, _0816D830
	cmp r1, r0
	beq _0816D834
	ldrh r0, [r4, #0x30]
	adds r2, r0, #0
	adds r2, #0x20
	strh r2, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0816D8BE
	ldrh r0, [r4, #0x20]
	adds r0, #1
	b _0816D86E
	.align 2, 0
_0816D82C: .4byte 0x03005FE0
_0816D830: .4byte 0x000006C7
_0816D834:
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0x50
	strh r0, [r4, #0x32]
	b _0816D8BE
_0816D848:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816D878
_0816D854:
	ldrh r0, [r4, #0x30]
	adds r2, r0, #0
	adds r2, #0x40
	strh r2, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0816D8BE
	ldrh r0, [r4, #0x20]
	subs r0, #1
_0816D86E:
	strh r0, [r4, #0x20]
	movs r0, #0xff
	ands r2, r0
	strh r2, [r4, #0x30]
	b _0816D8BE
_0816D878:
	adds r0, r4, #0
	movs r1, #2
	b _0816D8A2
_0816D87E:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0816D892
	ldrh r0, [r4, #0x20]
	adds r0, #4
	strh r0, [r4, #0x20]
_0816D892:
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #0xa8
	lsls r0, r0, #1
	cmp r1, r0
	ble _0816D8BE
_0816D89E:
	adds r0, r4, #0
	movs r1, #1
_0816D8A2:
	bl StartSpriteAnim
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0816D8BE
_0816D8AE:
	ldr r0, _0816D8C4
	ldr r1, [r0]
	ldr r0, _0816D8C8
	cmp r1, r0
	bls _0816D8BE
	ldrh r0, [r4, #0x20]
	subs r0, #2
	strh r0, [r4, #0x20]
_0816D8BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816D8C4: .4byte 0x03005FE0
_0816D8C8: .4byte 0x0000073F
	thumb_func_end sub_0816D7A4

	thumb_func_start sub_0816D8CC
sub_0816D8CC: @ 0x0816D8CC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0816D900
	cmp r0, #1
	bgt _0816D8E2
	cmp r0, #0
	beq _0816D8E8
	b _0816D988
_0816D8E2:
	cmp r0, #2
	beq _0816D926
	b _0816D988
_0816D8E8:
	ldr r0, _0816D8FC
	ldr r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #3
	cmp r1, r0
	bne _0816D988
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0816D988
	.align 2, 0
_0816D8FC: .4byte 0x03005FE0
_0816D900:
	ldrh r0, [r4, #0x20]
	subs r0, #2
	strh r0, [r4, #0x20]
	ldr r0, _0816D940
	ldr r1, [r0]
	movs r0, #0x92
	lsls r0, r0, #3
	cmp r1, r0
	bne _0816D988
	ldrh r0, [r4, #0x22]
	subs r0, #0xc
	strh r0, [r4, #0x22]
	movs r0, #0x80
	strh r0, [r4, #0x30]
	movs r0, #0
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0816D926:
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _0816D944
	adds r0, r4, #0
	bl DestroySprite
	b _0816D988
	.align 2, 0
_0816D940: .4byte 0x03005FE0
_0816D944:
	ldrh r0, [r4, #0x30]
	movs r1, #0xff
	ands r1, r0
	cmp r1, #0x3f
	bgt _0816D956
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x10
	b _0816D968
_0816D956:
	cmp r1, #0x40
	bne _0816D960
	ldrh r0, [r4, #0x20]
	subs r0, #0x30
	strh r0, [r4, #0x20]
_0816D960:
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x40
_0816D968:
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xc
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_0816D988:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0816D8CC

	thumb_func_start Task_IntroLoadPart3Graphics
Task_IntroLoadPart3Graphics: @ 0x0816D990
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	bl intro_reset_and_hide_bgs
	ldr r0, _0816DA20
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _0816DA24
	ldr r1, _0816DA28
	bl LZ77UnCompVram
	ldr r0, _0816DA2C
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl LoadPalette
	ldr r0, _0816DA30
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r5, #0
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0xe]
	movs r0, #0x78
	movs r1, #0x50
	movs r2, #0
	movs r3, #0
	bl PanFadeAndZoomScreen
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0816DA34
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, _0816DA38
	movs r0, #0xc
	bl SetGpuReg
	ldr r1, _0816DA3C
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0816DA40
	str r0, [r4]
	ldr r0, _0816DA44
	str r5, [r0]
	movs r0, #0xdd
	lsls r0, r0, #1
	bl m4aSongNumStart
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816DA20: .4byte 0x085C4908
_0816DA24: .4byte 0x085C47D8
_0816DA28: .4byte 0x06004000
_0816DA2C: .4byte 0x085C45D8
_0816DA30: .4byte 0x03005B60
_0816DA34: .4byte 0x0000FFFF
_0816DA38: .4byte 0x00004883
_0816DA3C: .4byte 0x00001441
_0816DA40: .4byte 0x0816DA49
_0816DA44: .4byte 0x03005FE0
	thumb_func_end Task_IntroLoadPart3Graphics

	thumb_func_start Task_IntroSpinAndZoomPokeball
Task_IntroSpinAndZoomPokeball: @ 0x0816DA48
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _0816DA80
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r3, r0, r2
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r1, [r3, #8]
	adds r0, r0, r1
	strh r0, [r3, #8]
	ldrh r4, [r3, #0xa]
	movs r0, #0xa
	ldrsh r1, [r3, r0]
	ldr r0, _0816DA84
	cmp r1, r0
	bgt _0816DA88
	ldrh r0, [r3, #0xc]
	adds r1, r4, r0
	strh r1, [r3, #0xa]
	adds r0, #2
	strh r0, [r3, #0xc]
	b _0816DA8C
	.align 2, 0
_0816DA80: .4byte 0x03005B60
_0816DA84: .4byte 0x000006BF
_0816DA88:
	ldr r0, _0816DAD4
	str r0, [r3]
_0816DA8C:
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r2
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r3, [r4, #8]
	movs r0, #0x78
	movs r1, #0x50
	bl PanFadeAndZoomScreen
	ldr r0, _0816DAD8
	ldr r0, [r0]
	cmp r0, #0x1c
	bne _0816DACA
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0816DADC
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0816DACA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816DAD4: .4byte 0x0816DAE1
_0816DAD8: .4byte 0x03005FE0
_0816DADC: .4byte 0x0000FFFF
	thumb_func_end Task_IntroSpinAndZoomPokeball

	thumb_func_start Task_IntroWaitToSetupPart3LegendsFight
Task_IntroWaitToSetupPart3LegendsFight: @ 0x0816DAE0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0816DB00
	ldr r0, [r0]
	cmp r0, #0x2b
	bls _0816DAFC
	ldr r0, _0816DB04
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816DB08
	str r0, [r1]
_0816DAFC:
	pop {r0}
	bx r0
	.align 2, 0
_0816DB00: .4byte 0x03005FE0
_0816DB04: .4byte 0x03005B60
_0816DB08: .4byte 0x0816DB0D
	thumb_func_end Task_IntroWaitToSetupPart3LegendsFight

	thumb_func_start Task_IntroLoadGroudonScene
Task_IntroLoadGroudonScene: @ 0x0816DB0C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0816DB80
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816DB78
	bl intro_reset_and_hide_bgs
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0816DB84
	movs r0, #8
	strb r0, [r1]
	ldr r0, _0816DB88
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZDecompressWram
	ldr r0, _0816DB8C
	ldr r1, _0816DB90
	bl LZDecompressWram
	ldr r0, _0816DB94
	ldr r1, _0816DB98
	bl LZDecompressWram
	ldr r0, _0816DB9C
	ldr r1, _0816DBA0
	bl LZDecompressWram
	ldr r0, _0816DBA4
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _0816DBA8
	bl LoadCompressedSpritePaletteUsingHeap
	ldr r0, _0816DBAC
	ldr r1, _0816DBB0
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuSet
	ldr r1, _0816DBB4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816DBB8
	str r1, [r0]
_0816DB78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816DB80: .4byte 0x02037C74
_0816DB84: .4byte 0x030030BC
_0816DB88: .4byte 0x08D88478
_0816DB8C: .4byte 0x08D88D24
_0816DB90: .4byte 0x0600C000
_0816DB94: .4byte 0x08D89F60
_0816DB98: .4byte 0x06004000
_0816DB9C: .4byte 0x08D8A7FC
_0816DBA0: .4byte 0x0600E000
_0816DBA4: .4byte 0x084FD420
_0816DBA8: .4byte 0x084FDD28
_0816DBAC: .4byte 0x08D85CB4
_0816DBB0: .4byte 0x020373B4
_0816DBB4: .4byte 0x03005B60
_0816DBB8: .4byte 0x0816DBBD
	thumb_func_end Task_IntroLoadGroudonScene

	thumb_func_start Task_IntroLoadPart3Graphics1
Task_IntroLoadPart3Graphics1: @ 0x0816DBBC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0xa0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	ldr r1, _0816DC40
	movs r0, #0xc
	bl SetGpuReg
	ldr r1, _0816DC44
	movs r0, #0xa
	bl SetGpuReg
	ldr r1, _0816DC48
	movs r0, #0
	bl SetGpuReg
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0816DC4C
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0816DC50
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, _0816DC54
	strh r0, [r4, #0xa]
	ldr r1, _0816DC58
	strh r1, [r4, #0xc]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r4, #0xe]
	movs r3, #0
	bl PanFadeAndZoomScreen
	ldr r0, _0816DC5C
	str r0, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816DC40: .4byte 0x0000B880
_0816DC44: .4byte 0x00001C05
_0816DC48: .4byte 0x00003641
_0816DC4C: .4byte 0x0000FFFF
_0816DC50: .4byte 0x03005B60
_0816DC54: .4byte 0x0000FFA0
_0816DC58: .4byte 0x0000FF51
_0816DC5C: .4byte 0x0816DC61
	thumb_func_end Task_IntroLoadPart3Graphics1

	thumb_func_start Task_IntroLoadPart3Graphics2
Task_IntroLoadPart3Graphics2: @ 0x0816DC60
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0816DC98
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r2, [r4, #8]
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	beq _0816DC9C
	adds r0, r2, #4
	strh r0, [r4, #8]
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r1, r1, #8
	adds r0, r2, #0
	subs r0, #0x9c
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	b _0816DCAA
	.align 2, 0
_0816DC98: .4byte 0x03005B60
_0816DC9C:
	movs r1, #0x82
	lsls r1, r1, #6
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, _0816DCB0
	str r0, [r4]
_0816DCAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816DCB0: .4byte 0x0816DCB5
	thumb_func_end Task_IntroLoadPart3Graphics2

	thumb_func_start Task_IntroLoadPart3Graphics3
Task_IntroLoadPart3Graphics3: @ 0x0816DCB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0816DCC8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _0816DCCC
	str r0, [r1]
	bx lr
	.align 2, 0
_0816DCC8: .4byte 0x03005B60
_0816DCCC: .4byte 0x0816DCD1
	thumb_func_end Task_IntroLoadPart3Graphics3

	thumb_func_start Task_IntroLoadPart3Graphics4
Task_IntroLoadPart3Graphics4: @ 0x0816DCD0
	push {lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0816DD08
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #8]
	ldr r0, _0816DD0C
	str r0, [r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r2, [sp, #8]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #4
	movs r3, #4
	bl ScanlineEffect_InitWave
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0816DD08: .4byte 0x03005B60
_0816DD0C: .4byte 0x0816DD11
	thumb_func_end Task_IntroLoadPart3Graphics4

	thumb_func_start Task_IntroGroudonScene
Task_IntroGroudonScene: @ 0x0816DD10
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0816DD70
	adds r4, r0, r1
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bhi _0816DD46
	ldrh r0, [r4, #0xa]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0816DD46
	ldrh r0, [r4, #8]
	movs r1, #3
	eors r0, r1
	strh r0, [r4, #8]
_0816DD46:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #8]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #6]
	movs r3, #0
	bl PanFadeAndZoomScreen
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bls _0816DD64
	b _0816DF5A
_0816DD64:
	lsls r0, r0, #2
	ldr r1, _0816DD74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816DD70: .4byte 0x03005B68
_0816DD74: .4byte 0x0816DD78
_0816DD78: @ jump table
	.4byte _0816DDA0 @ case 0
	.4byte _0816DDCA @ case 1
	.4byte _0816DE08 @ case 2
	.4byte _0816DE1C @ case 3
	.4byte _0816DE60 @ case 4
	.4byte _0816DE7E @ case 5
	.4byte _0816DEAC @ case 6
	.4byte _0816DEC2 @ case 7
	.4byte _0816DF20 @ case 8
	.4byte _0816DF3A @ case 9
_0816DDA0:
	ldrh r0, [r4, #2]
	adds r0, #0x10
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	beq _0816DDB0
	b _0816DF5A
_0816DDB0:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #2
	strh r0, [r4, #0xc]
	movs r2, #0xf1
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r4, #0xe]
	adds r0, r5, #0
	bl CreateGroudonRockSprites
	b _0816DF5A
_0816DDCA:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816DDD8
	b _0816DF5A
_0816DDD8:
	movs r0, #2
	strh r0, [r4, #0xc]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	ldr r2, _0816DE00
	adds r0, r0, r2
	ldr r1, _0816DE04
	movs r2, #1
	bl CpuSet
	ldrh r0, [r4, #0xe]
	adds r0, #2
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	movs r1, #0xf6
	lsls r1, r1, #0x11
	cmp r0, r1
	beq _0816DDFE
	b _0816DF5A
_0816DDFE:
	b _0816DF32
	.align 2, 0
_0816DE00: .4byte 0x08D85CB4
_0816DE04: .4byte 0x020377F2
_0816DE08:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816DE16
	b _0816DF5A
_0816DE16:
	movs r0, #2
	strh r0, [r4, #0xc]
	b _0816DF32
_0816DE1C:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816DE2A
	b _0816DF5A
_0816DE2A:
	movs r0, #2
	strh r0, [r4, #0xc]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	ldr r2, _0816DE58
	adds r0, r0, r2
	ldr r1, _0816DE5C
	movs r2, #1
	bl CpuSet
	ldrh r0, [r4, #0xe]
	subs r0, #2
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0x11
	cmp r0, r1
	beq _0816DE50
	b _0816DF5A
_0816DE50:
	movs r0, #8
	strh r0, [r4, #0xc]
	b _0816DF32
	.align 2, 0
_0816DE58: .4byte 0x08D85CB4
_0816DE5C: .4byte 0x020377F2
_0816DE60:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816DF5A
	movs r1, #0x60
	rsbs r1, r1, #0
	adds r0, r1, #0
	strh r0, [r4, #2]
	movs r0, #0xa9
	strh r0, [r4, #4]
	movs r0, #3
	strh r0, [r4, #0xc]
	b _0816DF32
_0816DE7E:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _0816DF5A
	movs r0, #0x50
	strh r0, [r4, #2]
	movs r0, #0x29
	strh r0, [r4, #4]
	movs r0, #0x10
	strh r0, [r4, #0xc]
	ldr r0, _0816DEA8
	str r1, [sp]
	movs r1, #0
	movs r2, #0x64
	movs r3, #0xa
	bl PlayCryInternal
	b _0816DF32
	.align 2, 0
_0816DEA8: .4byte 0x00000195
_0816DEAC:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816DF5A
	movs r0, #0x50
	strh r0, [r4, #2]
	movs r0, #0x28
	strh r0, [r4, #4]
	b _0816DF32
_0816DEC2:
	ldrh r0, [r4, #2]
	adds r0, #4
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #4
	strh r0, [r4, #4]
	ldr r2, _0816DF18
	adds r0, r2, #0
	ldrh r1, [r4, #0xc]
	adds r0, r0, r1
	strh r0, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r0, r0, #8
	movs r1, #0x40
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r5, r1, #0
	adds r0, r0, r5
	strh r0, [r4, #6]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0x78
	bne _0816DF5A
	movs r0, #2
	rsbs r0, r0, #0
	ldr r1, _0816DF1C
	str r1, [sp]
	movs r1, #3
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	strh r5, [r4, #6]
	movs r0, #0
	strh r0, [r4, #8]
	b _0816DF32
	.align 2, 0
_0816DF18: .4byte 0x00000666
_0816DF1C: .4byte 0x00007FFF
_0816DF20:
	ldrh r1, [r4, #6]
	movs r2, #6
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0816DF32
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r4, #6]
	b _0816DF5A
_0816DF32:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _0816DF5A
_0816DF3A:
	ldr r0, _0816DF64
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816DF5A
	ldr r1, _0816DF68
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816DF6C
	str r1, [r0]
	ldr r1, _0816DF70
	movs r0, #3
	strb r0, [r1, #0x15]
_0816DF5A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816DF64: .4byte 0x02037C74
_0816DF68: .4byte 0x03005B60
_0816DF6C: .4byte 0x0816E085
_0816DF70: .4byte 0x020397C8
	thumb_func_end Task_IntroGroudonScene

	thumb_func_start CreateGroudonRockSprites
CreateGroudonRockSprites: @ 0x0816DF74
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r4, #0
	ldr r6, _0816DFCC
	ldr r5, _0816DFD0
_0816DF80:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0816DFD4
	movs r2, #0xa0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r1, _0816DFD8
	str r1, [r0]
	adds r2, r2, r6
	ldrb r0, [r2, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strb r0, [r2, #5]
	strh r4, [r2, #0x30]
	strh r7, [r2, #0x36]
	ldrb r1, [r5, #2]
	adds r0, r2, #0
	bl StartSpriteAnim
	adds r5, #6
	adds r4, #1
	cmp r4, #5
	ble _0816DF80
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816DFCC: .4byte 0x020205AC
_0816DFD0: .4byte 0x085C5D18
_0816DFD4: .4byte 0x085727F4
_0816DFD8: .4byte 0x0816DFDD
	thumb_func_end CreateGroudonRockSprites

	thumb_func_start SpriteCB_IntroGroudonRocks
SpriteCB_IntroGroudonRocks: @ 0x0816DFDC
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x34]
	adds r0, #1
	strh r0, [r3, #0x34]
	ldrh r0, [r3, #0x34]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0816DFF8
	ldrh r0, [r3, #0x26]
	movs r1, #3
	eors r0, r1
	strh r0, [r3, #0x26]
_0816DFF8:
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0816E006
	cmp r0, #1
	beq _0816E05C
	b _0816E080
_0816E006:
	ldr r2, _0816E054
	movs r0, #0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
	ldrh r2, [r0]
	ldrh r1, [r3, #0x32]
	adds r2, r2, r1
	strh r2, [r3, #0x32]
	movs r0, #0x32
	ldrsh r1, [r3, r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	asrs r1, r1, #8
	ldrh r0, [r3, #0x22]
	subs r0, r0, r1
	strh r0, [r3, #0x22]
	movs r0, #0xff
	ands r2, r0
	strh r2, [r3, #0x32]
	ldr r2, _0816E058
	movs r0, #0x36
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #7
	ble _0816E080
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b _0816E080
	.align 2, 0
_0816E054: .4byte 0x085C5D18
_0816E058: .4byte 0x03005B60
_0816E05C:
	ldrh r1, [r3, #0x20]
	movs r2, #0x20
	ldrsh r0, [r3, r2]
	cmp r0, #0x77
	bgt _0816E06A
	subs r0, r1, #2
	b _0816E06C
_0816E06A:
	adds r0, r1, #2
_0816E06C:
	strh r0, [r3, #0x20]
	ldrh r1, [r3, #0x22]
	movs r2, #0x22
	ldrsh r0, [r3, r2]
	cmp r0, #0x4f
	bgt _0816E07C
	subs r0, r1, #2
	b _0816E07E
_0816E07C:
	adds r0, r1, #2
_0816E07E:
	strh r0, [r3, #0x22]
_0816E080:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_IntroGroudonRocks

	thumb_func_start Task_IntroLoadKyogreScene
Task_IntroLoadKyogreScene: @ 0x0816E084
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ResetSpriteData
	ldr r0, _0816E114
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZDecompressWram
	ldr r0, _0816E118
	ldr r1, _0816E11C
	bl LZDecompressWram
	ldr r0, _0816E120
	ldr r1, _0816E124
	bl LZDecompressWram
	ldr r0, _0816E128
	bl LoadCompressedSpriteSheet
	ldr r0, _0816E12C
	bl LoadSpritePalette
	movs r0, #2
	rsbs r0, r0, #0
	ldr r1, _0816E130
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0816E134
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0816E138
	str r0, [r1]
	movs r4, #0
	strh r4, [r1, #8]
	movs r0, #0xa8
	lsls r0, r0, #1
	strh r0, [r1, #0xa]
	movs r2, #0x50
	strh r2, [r1, #0xc]
	movs r2, #0x10
	strh r2, [r1, #0x14]
	adds r2, #0xf0
	strh r2, [r1, #0xe]
	movs r1, #0x50
	movs r3, #0
	bl PanFadeAndZoomScreen
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #4
	movs r3, #4
	bl ScanlineEffect_InitWave
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816E114: .4byte 0x08D89208
_0816E118: .4byte 0x08D89AA0
_0816E11C: .4byte 0x0600C000
_0816E120: .4byte 0x08D8A918
_0816E124: .4byte 0x0600E000
_0816E128: .4byte 0x085C5D3C
_0816E12C: .4byte 0x085C5D4C
_0816E130: .4byte 0x0000FFFF
_0816E134: .4byte 0x03005B60
_0816E138: .4byte 0x0816E13D
	thumb_func_end Task_IntroLoadKyogreScene

	thumb_func_start Task_IntroKyogreScene
Task_IntroKyogreScene: @ 0x0816E13C
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0816E170
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	ldrh r2, [r5, #6]
	movs r3, #0
	bl PanFadeAndZoomScreen
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0xd
	bls _0816E164
	b _0816E4A0
_0816E164:
	lsls r0, r0, #2
	ldr r1, _0816E174
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816E170: .4byte 0x03005B68
_0816E174: .4byte 0x0816E178
_0816E178: @ jump table
	.4byte _0816E1B0 @ case 0
	.4byte _0816E1C4 @ case 1
	.4byte _0816E220 @ case 2
	.4byte _0816E26C @ case 3
	.4byte _0816E2A8 @ case 4
	.4byte _0816E2D0 @ case 5
	.4byte _0816E328 @ case 6
	.4byte _0816E344 @ case 7
	.4byte _0816E384 @ case 8
	.4byte _0816E3A0 @ case 9
	.4byte _0816E3E0 @ case 10
	.4byte _0816E3FE @ case 11
	.4byte _0816E448 @ case 12
	.4byte _0816E480 @ case 13
_0816E1B0:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816E1BE
	b _0816E4A0
_0816E1BE:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_0816E1C4:
	ldrh r0, [r5, #0xc]
	adds r0, #4
	strh r0, [r5, #0xc]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	movs r1, #0x80
	lsls r1, r1, #1
	bl Sin
	ldr r1, _0816E21C
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r2, #0xac
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r4, #0xa]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	movs r1, #0x40
	bl Cos
	movs r1, #0x54
	subs r1, r1, r0
	strh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	cmp r0, #0x40
	beq _0816E204
	b _0816E4A0
_0816E204:
	movs r0, #0x19
	strh r0, [r5, #0xc]
	movs r0, #1
	strh r0, [r5, #0xe]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #0
	bl CreateKyogreBubbleSprites_0
	b _0816E4A0
	.align 2, 0
_0816E21C: .4byte 0x03005B60
_0816E220:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816E22E
	b _0816E4A0
_0816E22E:
	ldr r0, _0816E264
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r2, [r1, #0xa]
	adds r0, r0, r2
	strh r0, [r1, #0xa]
	ldr r2, _0816E268
	adds r0, r2, #0
	ldrh r2, [r1, #0xc]
	adds r0, r0, r2
	strh r0, [r1, #0xc]
	movs r0, #8
	strh r0, [r5, #0xc]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #0
	bl CreateKyogreBubbleSprites_0
	bl CreateKyogreBubbleSprites_1
	b _0816E4A0
	.align 2, 0
_0816E264: .4byte 0x03005B60
_0816E268: .4byte 0xFFFFFEFE
_0816E26C:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816E27A
	b _0816E4A0
_0816E27A:
	ldr r0, _0816E2A0
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r2, _0816E2A4
	adds r0, r2, #0
	ldrh r2, [r1, #0xa]
	adds r0, r0, r2
	strh r0, [r1, #0xa]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r2, [r1, #0xc]
	adds r0, r0, r2
	strh r0, [r1, #0xc]
	movs r0, #8
	strh r0, [r5, #0xc]
	b _0816E474
	.align 2, 0
_0816E2A0: .4byte 0x03005B60
_0816E2A4: .4byte 0xFFFFFF00
_0816E2A8:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816E2B6
	b _0816E4A0
_0816E2B6:
	ldr r1, _0816E2CC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0xc]
	subs r1, #0xfc
	strh r1, [r0, #0xc]
	movs r0, #8
	strh r0, [r5, #0xc]
	b _0816E474
	.align 2, 0
_0816E2CC: .4byte 0x03005B60
_0816E2D0:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816E2DE
	b _0816E4A0
_0816E2DE:
	ldr r0, _0816E308
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xc]
	adds r0, #0xfc
	strh r0, [r1, #0xc]
	ldrh r2, [r5, #0xe]
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	cmp r1, #0
	beq _0816E30C
	movs r0, #0xc
	strh r0, [r5, #0xc]
	subs r0, r2, #1
	strh r0, [r5, #0xe]
	movs r0, #2
	strh r0, [r5]
	b _0816E4A0
	.align 2, 0
_0816E308: .4byte 0x03005B60
_0816E30C:
	movs r0, #1
	strh r0, [r5, #0xc]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #0xca
	lsls r0, r0, #1
	str r1, [sp]
	movs r1, #0
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
	b _0816E4A0
_0816E328:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816E336
	b _0816E4A0
_0816E336:
	movs r0, #4
	strh r0, [r5, #0xc]
	movs r1, #0xf5
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r5, #0xe]
	b _0816E474
_0816E344:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816E352
	b _0816E4A0
_0816E352:
	movs r0, #4
	strh r0, [r5, #0xc]
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	ldr r1, _0816E37C
	adds r0, r0, r1
	ldr r1, _0816E380
	movs r2, #1
	bl CpuSet
	ldrh r0, [r5, #0xe]
	subs r0, #2
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0x11
	cmp r0, r1
	beq _0816E378
	b _0816E4A0
_0816E378:
	b _0816E474
	.align 2, 0
_0816E37C: .4byte 0x08D85CB4
_0816E380: .4byte 0x02037812
_0816E384:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816E392
	b _0816E4A0
_0816E392:
	movs r0, #4
	strh r0, [r5, #0xc]
	movs r2, #0xf1
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r5, #0xe]
	b _0816E474
_0816E3A0:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816E4A0
	movs r0, #4
	strh r0, [r5, #0xc]
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	ldr r2, _0816E3D8
	adds r0, r0, r2
	ldr r1, _0816E3DC
	movs r2, #1
	bl CpuSet
	ldrh r0, [r5, #0xe]
	adds r0, #2
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	movs r1, #0xf7
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _0816E4A0
	movs r0, #0x10
	strh r0, [r5, #0xc]
	b _0816E474
	.align 2, 0
_0816E3D8: .4byte 0x08D85CB4
_0816E3DC: .4byte 0x02037812
_0816E3E0:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _0816E4A0
	strh r0, [r5, #0xc]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r0, r6, #0
	bl CreateKyogreBubbleSprites_0
	b _0816E4A0
_0816E3FE:
	ldrh r0, [r5, #0xc]
	adds r0, #4
	strh r0, [r5, #0xc]
	ldrh r0, [r5, #6]
	subs r0, #8
	strh r0, [r5, #6]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	movs r1, #0x3c
	bl Sin
	ldr r2, _0816E440
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r0, #0x58
	strh r0, [r1, #0xa]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	cmp r0, #0x40
	bne _0816E4A0
	movs r0, #2
	rsbs r0, r0, #0
	ldr r1, _0816E444
	str r1, [sp]
	movs r1, #3
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _0816E474
	.align 2, 0
_0816E440: .4byte 0x03005B60
_0816E444: .4byte 0x00007FFF
_0816E448:
	ldrh r0, [r5, #0xc]
	adds r0, #4
	strh r0, [r5, #0xc]
	ldrh r0, [r5, #6]
	subs r0, #8
	strh r0, [r5, #6]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	movs r1, #0x14
	bl Sin
	ldr r2, _0816E47C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r0, #0x80
	strh r0, [r1, #0xa]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	cmp r0, #0x80
	bne _0816E4A0
_0816E474:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _0816E4A0
	.align 2, 0
_0816E47C: .4byte 0x03005B60
_0816E480:
	ldr r0, _0816E4A8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816E4A0
	ldr r1, _0816E4AC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816E4B0
	str r1, [r0]
	ldr r1, _0816E4B4
	movs r0, #3
	strb r0, [r1, #0x15]
_0816E4A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816E4A8: .4byte 0x02037C74
_0816E4AC: .4byte 0x03005B60
_0816E4B0: .4byte 0x0816E66D
_0816E4B4: .4byte 0x020397C8
	thumb_func_end Task_IntroKyogreScene

	thumb_func_start CreateKyogreBubbleSprites_0
CreateKyogreBubbleSprites_0: @ 0x0816E4B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	ldr r7, _0816E524
	ldr r0, _0816E528
	mov sb, r0
	adds r4, r7, #0
	movs r6, #0
_0816E4D2:
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r0, r7, #2
	adds r0, r6, r0
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0816E52C
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, sb
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	mov r0, r8
	strh r0, [r2, #0x38]
	ldrh r0, [r4, #4]
	strh r0, [r2, #0x3a]
	movs r0, #0x40
	strh r0, [r2, #0x3c]
	adds r4, #6
	adds r6, #6
	adds r5, #1
	cmp r5, #5
	ble _0816E4D2
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816E524: .4byte 0x085C5D5C
_0816E528: .4byte 0x020205AC
_0816E52C: .4byte 0x085C5DC8
	thumb_func_end CreateKyogreBubbleSprites_0

	thumb_func_start CreateKyogreBubbleSprites_1
CreateKyogreBubbleSprites_1: @ 0x0816E530
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r7, _0816E58C
	adds r4, r7, #4
	movs r6, #0x24
	ldr r0, _0816E590
	mov r8, r0
_0816E542:
	movs r3, #0x20
	ldrsh r1, [r4, r3]
	adds r0, r7, #2
	adds r0, r6, r0
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0816E594
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, r8
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4]
	strh r0, [r2, #0x3a]
	movs r0, #0x40
	strh r0, [r2, #0x3c]
	adds r4, #6
	adds r6, #6
	adds r5, #1
	cmp r5, #5
	ble _0816E542
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816E58C: .4byte 0x085C5D5C
_0816E590: .4byte 0x020205AC
_0816E594: .4byte 0x085C5DC8
	thumb_func_end CreateKyogreBubbleSprites_1

	thumb_func_start SpriteCB_IntroKyogreBubbles
SpriteCB_IntroKyogreBubbles: @ 0x0816E598
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0816E5AA
	cmp r0, #1
	beq _0816E630
	b _0816E666
_0816E5AA:
	ldrh r1, [r4, #0x3a]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0816E5EE
	ldrh r0, [r4, #0x30]
	adds r0, #0xb
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	adds r0, #0x30
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0816E60E
	adds r0, r4, #0
	bl DestroySprite
	b _0816E60E
_0816E5EE:
	subs r0, r1, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816E60E
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0816E60E:
	ldr r2, _0816E62C
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #0xb
	ble _0816E666
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0816E666
	.align 2, 0
_0816E62C: .4byte 0x03005B60
_0816E630:
	ldrh r1, [r4, #0x20]
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #0x77
	bgt _0816E63E
	subs r0, r1, #3
	b _0816E640
_0816E63E:
	adds r0, r1, #3
_0816E640:
	strh r0, [r4, #0x20]
	ldrh r1, [r4, #0x22]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	cmp r0, #0x4f
	bgt _0816E650
	subs r0, r1, #3
	b _0816E652
_0816E650:
	adds r0, r1, #3
_0816E652:
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x22]
	subs r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x8c
	bls _0816E666
	adds r0, r4, #0
	bl DestroySprite
_0816E666:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_IntroKyogreBubbles

	thumb_func_start Task_IntroLoadClouds1
Task_IntroLoadClouds1: @ 0x0816E66C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0x50
	movs r1, #0x87
	bl SetGpuReg
	ldr r1, _0816E710
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0x1f
	bl SetGpuReg
	movs r1, #0xb0
	lsls r1, r1, #7
	movs r0, #8
	bl SetGpuReg
	ldr r1, _0816E714
	movs r0, #0xa
	bl SetGpuReg
	ldr r1, _0816E718
	movs r0, #0xc
	bl SetGpuReg
	movs r1, #0xdd
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0x50
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	ldr r1, _0816E71C
	movs r0, #0x14
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	ldr r4, _0816E720
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	bl LZDecompressWram
	ldr r1, _0816E724
	adds r0, r4, #0
	bl LZDecompressWram
	ldr r0, _0816E728
	ldr r1, _0816E72C
	bl LZDecompressWram
	ldr r1, _0816E730
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816E734
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816E710: .4byte 0x00001F1F
_0816E714: .4byte 0x00005A04
_0816E718: .4byte 0x00001C06
_0816E71C: .4byte 0x0000FFB0
_0816E720: .4byte 0x08D8AA38
_0816E724: .4byte 0x06004000
_0816E728: .4byte 0x08D8B6CC
_0816E72C: .4byte 0x0600E000
_0816E730: .4byte 0x03005B60
_0816E734: .4byte 0x0816E739
	thumb_func_end Task_IntroLoadClouds1

	thumb_func_start Task_IntroLoadClouds2
Task_IntroLoadClouds2: @ 0x0816E738
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0816E764
	ldr r1, _0816E768
	bl LZDecompressWram
	ldr r0, _0816E76C
	ldr r1, _0816E770
	bl LZDecompressWram
	ldr r1, _0816E774
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816E778
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816E764: .4byte 0x08D8B164
_0816E768: .4byte 0x0600C000
_0816E76C: .4byte 0x08D8B424
_0816E770: .4byte 0x0600D000
_0816E774: .4byte 0x03005B60
_0816E778: .4byte 0x0816E77D
	thumb_func_end Task_IntroLoadClouds2

	thumb_func_start Task_IntroLoadClouds3
Task_IntroLoadClouds3: @ 0x0816E77C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r1, _0816E7B8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816E7BC
	str r1, [r0]
	movs r1, #0
	strh r1, [r0, #8]
	movs r1, #0x10
	strh r1, [r0, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816E7B8: .4byte 0x03005B60
_0816E7BC: .4byte 0x0816E7C1
	thumb_func_end Task_IntroLoadClouds3

	thumb_func_start Task_IntroCloudScene
Task_IntroCloudScene: @ 0x0816E7C0
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r5, r1, #3
	ldr r6, _0816E804
	adds r4, r5, r6
	ldrh r1, [r4, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x10
	bl SetGpuReg
	ldrh r1, [r4, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x14
	bl SetGpuReg
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0816E808
	cmp r0, #1
	beq _0816E83C
	b _0816E88A
	.align 2, 0
_0816E804: .4byte 0x03005B68
_0816E808:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816E88A
	movs r0, #2
	rsbs r0, r0, #0
	ldr r1, _0816E838
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r2, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _0816E88A
	.align 2, 0
_0816E838: .4byte 0x0000FFFF
_0816E83C:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #6
	cmp r1, r0
	bne _0816E858
	ldr r0, _0816E86C
	ldr r1, _0816E870
	str r1, [sp]
	movs r1, #3
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0816E858:
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0816E874
	adds r0, r1, #0
	subs r0, #0x80
	strh r0, [r4, #0xc]
	b _0816E88A
	.align 2, 0
_0816E86C: .4byte 0x0000FFFE
_0816E870: .4byte 0x00002949
_0816E874:
	ldr r0, _0816E894
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816E88A
	adds r0, r6, #0
	subs r0, #8
	adds r0, r5, r0
	ldr r1, _0816E898
	str r1, [r0]
_0816E88A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816E894: .4byte 0x02037C74
_0816E898: .4byte 0x0816E89D
	thumb_func_end Task_IntroCloudScene

	thumb_func_start Task_IntroLoadRayquazaLightningScene
Task_IntroLoadRayquazaLightningScene: @ 0x0816E89C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0816E8FC
	ldr r1, _0816E900
	bl LZDecompressWram
	ldr r0, _0816E904
	ldr r1, _0816E908
	bl LZDecompressWram
	ldr r0, _0816E90C
	ldr r1, _0816E910
	bl LZDecompressWram
	ldr r0, _0816E914
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZDecompressWram
	movs r1, #0xd5
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	ldr r1, _0816E918
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0816E91C
	str r1, [r0]
	movs r2, #0
	strh r2, [r0, #8]
	movs r1, #1
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	ldr r0, _0816E920
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _0816E924
	bl LoadSpritePalettes
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816E8FC: .4byte 0x08D8C150
_0816E900: .4byte 0x0600E000
_0816E904: .4byte 0x08D8CCAC
_0816E908: .4byte 0x0600C000
_0816E90C: .4byte 0x08D8BA58
_0816E910: .4byte 0x06004000
_0816E914: .4byte 0x08D8C81C
_0816E918: .4byte 0x03005B60
_0816E91C: .4byte 0x0816E929
_0816E920: .4byte 0x085C5CA8
_0816E924: .4byte 0x085C5CB8
	thumb_func_end Task_IntroLoadRayquazaLightningScene

	thumb_func_start Task_IntroRayquazaLightningScene
Task_IntroRayquazaLightningScene: @ 0x0816E928
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r2, _0816E94C
	adds r6, r1, r2
	movs r3, #0
	ldrsh r0, [r6, r3]
	cmp r0, #1
	beq _0816E9C4
	cmp r0, #1
	bgt _0816E950
	cmp r0, #0
	beq _0816E956
	b _0816EA46
	.align 2, 0
_0816E94C: .4byte 0x03005B68
_0816E950:
	cmp r0, #2
	beq _0816EA30
	b _0816EA46
_0816E956:
	ldrh r0, [r6, #0xc]
	subs r0, #1
	strh r0, [r6, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816EA46
	ldr r4, _0816E9BC
	adds r0, r4, #0
	movs r1, #0xc8
	movs r2, #0x30
	movs r3, #0
	bl CreateSprite
	adds r0, r4, #0
	movs r1, #0xc8
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0816E9C0
	adds r0, r0, r5
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r4, #0
	movs r1, #0xc8
	movs r2, #0x70
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #2
	bl StartSpriteAnim
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r0, #0x48
	strh r0, [r6, #0xc]
	b _0816EA46
	.align 2, 0
_0816E9BC: .4byte 0x085C5D00
_0816E9C0: .4byte 0x020205AC
_0816E9C4:
	ldrh r0, [r6, #0xc]
	subs r0, #1
	strh r0, [r6, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816EA46
	ldr r4, _0816EA28
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #0x30
	movs r3, #0
	bl CreateSprite
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0816EA2C
	adds r0, r0, r5
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #0x70
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #2
	bl StartSpriteAnim
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r0, #0x30
	strh r0, [r6, #0xc]
	b _0816EA46
	.align 2, 0
_0816EA28: .4byte 0x085C5D00
_0816EA2C: .4byte 0x020205AC
_0816EA30:
	ldrh r0, [r6, #0xc]
	subs r0, #1
	strh r0, [r6, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816EA46
	adds r0, r2, #0
	subs r0, #8
	adds r0, r1, r0
	ldr r1, _0816EA4C
	str r1, [r0]
_0816EA46:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816EA4C: .4byte 0x0816EB05
	thumb_func_end Task_IntroRayquazaLightningScene

	thumb_func_start SpriteCB_IntroRayquazaLightning
SpriteCB_IntroRayquazaLightning: @ 0x0816EA50
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0816EA6C
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_0816EA6C:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0816EA90
	cmp r0, #1
	bgt _0816EA7E
	cmp r0, #0
	beq _0816EA84
	b _0816EAF6
_0816EA7E:
	cmp r0, #2
	beq _0816EAC0
	b _0816EAF6
_0816EA84:
	movs r0, #0xe1
	lsls r0, r0, #1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0816EA90:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	ldr r1, _0816EAFC
	adds r0, r0, r1
	ldr r1, _0816EB00
	movs r2, #1
	bl CpuSet
	ldrh r0, [r4, #0x30]
	adds r0, #2
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	movs r1, #0xe7
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _0816EAF6
	movs r0, #0xe6
	lsls r0, r0, #1
	strh r0, [r4, #0x30]
	movs r0, #4
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0816EAC0:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816EAF6
	movs r0, #4
	strh r0, [r4, #0x32]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	ldr r1, _0816EAFC
	adds r0, r0, r1
	ldr r1, _0816EB00
	movs r2, #1
	bl CpuSet
	ldrh r0, [r4, #0x30]
	subs r0, #2
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _0816EAF6
	adds r0, r4, #0
	bl DestroySprite
_0816EAF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816EAFC: .4byte 0x08D85CB4
_0816EB00: .4byte 0x0203786E
	thumb_func_end SpriteCB_IntroRayquazaLightning

	thumb_func_start Task_IntroLoadRayquazaGlowScene
Task_IntroLoadRayquazaGlowScene: @ 0x0816EB04
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0816EB74
	bl LoadCompressedSpriteSheet
	ldr r0, _0816EB78
	bl LoadSpritePalettes
	movs r1, #0xd5
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	ldr r6, _0816EB7C
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r6
	ldr r0, _0816EB80
	str r0, [r4]
	ldr r0, _0816EB84
	ldr r1, _0816EB88
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #0xa8
	strh r0, [r4, #0xa]
	ldr r1, _0816EB8C
	strh r1, [r4, #0xc]
	ldr r0, _0816EB90
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	ldr r0, _0816EB94
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r5, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816EB74: .4byte 0x085C60FC
_0816EB78: .4byte 0x085C610C
_0816EB7C: .4byte 0x03005B60
_0816EB80: .4byte 0x0816EB99
_0816EB84: .4byte 0x0000FFDE
_0816EB88: .4byte 0x00002949
_0816EB8C: .4byte 0x0000FFF0
_0816EB90: .4byte 0x0000FF78
_0816EB94: .4byte 0x0816EC8D
	thumb_func_end Task_IntroLoadRayquazaGlowScene

	thumb_func_start Task_IntroRayquazaGlowScene_0
Task_IntroRayquazaGlowScene_0: @ 0x0816EB98
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r4, r1, #3
	ldr r5, _0816EBD4
	adds r2, r4, r5
	ldrh r0, [r2, #0xe]
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	bne _0816EBBA
	ldrh r0, [r2, #0xc]
	movs r1, #2
	eors r0, r1
	strh r0, [r2, #0xc]
_0816EBBA:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	movs r6, #0
	ldrsh r1, [r2, r6]
	cmp r1, #1
	beq _0816EC12
	cmp r1, #1
	bgt _0816EBD8
	cmp r1, #0
	beq _0816EBE2
	b _0816EC6A
	.align 2, 0
_0816EBD4: .4byte 0x03005B68
_0816EBD8:
	cmp r1, #2
	beq _0816EC1E
	cmp r1, #3
	beq _0816EC54
	b _0816EC6A
_0816EBE2:
	ands r0, r3
	cmp r0, #0
	beq _0816EC00
	ldrh r0, [r2, #2]
	subs r0, #2
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	adds r0, #2
	strh r0, [r2, #6]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_0816EC00:
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #0x68
	bne _0816EC6A
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	strh r3, [r2, #0xa]
	b _0816EC6A
_0816EC12:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	movs r0, #4
	strh r0, [r2, #0xa]
	b _0816EC6A
_0816EC1E:
	ldrh r0, [r2, #2]
	adds r0, #4
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	subs r0, #2
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	subs r0, #4
	strh r0, [r2, #6]
	ldrh r0, [r2, #8]
	subs r0, #2
	strh r0, [r2, #8]
	ldr r0, _0816EC50
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816EC6A
	movs r0, #0x8c
	strh r0, [r2, #0xa]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0816EC6A
	.align 2, 0
_0816EC50: .4byte 0x02037C74
_0816EC54:
	ldrh r0, [r2, #0xa]
	subs r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816EC6A
	adds r0, r5, #0
	subs r0, #8
	adds r0, r4, r0
	ldr r1, _0816EC70
	str r1, [r0]
_0816EC6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0816EC70: .4byte 0x0816EC75
	thumb_func_end Task_IntroRayquazaGlowScene_0

	thumb_func_start Task_EndIntroMovie
Task_EndIntroMovie: @ 0x0816EC74
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	ldr r0, _0816EC88
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0816EC88: .4byte 0x0816CA65
	thumb_func_end Task_EndIntroMovie

	thumb_func_start Task_IntroRayquazaGlowScene_1
Task_IntroRayquazaGlowScene_1: @ 0x0816EC8C
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0816ECB8
	adds r5, r0, r1
	ldrh r0, [r5, #4]
	adds r0, #1
	strh r0, [r5, #4]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #5
	bls _0816ECAE
	b _0816EE96
_0816ECAE:
	lsls r0, r0, #2
	ldr r1, _0816ECBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816ECB8: .4byte 0x03005B68
_0816ECBC: .4byte 0x0816ECC0
_0816ECC0: @ jump table
	.4byte _0816ECD8 @ case 0
	.4byte _0816ED18 @ case 1
	.4byte _0816ED64 @ case 2
	.4byte _0816EDEE @ case 3
	.4byte _0816EE58 @ case 4
	.4byte _0816EE84 @ case 5
_0816ECD8:
	ldrh r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0816ECFA
	movs r2, #2
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _0816ED10
	adds r0, r0, r1
	ldr r1, _0816ED14
	movs r2, #1
	bl CpuSet
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
_0816ECFA:
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #6
	beq _0816ED04
	b _0816EE96
_0816ED04:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #0
	strh r0, [r5, #2]
	b _0816ED54
	.align 2, 0
_0816ED10: .4byte 0x08D85E56
_0816ED14: .4byte 0x02037870
_0816ED18:
	ldrh r1, [r5, #6]
	movs r2, #6
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0816EDE8
	ldrh r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0816ED44
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	ldr r2, _0816ED5C
	adds r0, r0, r2
	ldr r1, _0816ED60
	movs r2, #1
	bl CpuSet
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
_0816ED44:
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #6
	beq _0816ED4E
	b _0816EE96
_0816ED4E:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_0816ED54:
	movs r0, #0xa
	strh r0, [r5, #6]
	b _0816EE96
	.align 2, 0
_0816ED5C: .4byte 0x08D85E56
_0816ED60: .4byte 0x02037864
_0816ED64:
	ldrh r1, [r5, #6]
	movs r2, #6
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0816EDE8
	ldrh r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0816ED90
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	ldr r2, _0816EDD8
	adds r0, r0, r2
	ldr r1, _0816EDDC
	movs r2, #1
	bl CpuSet
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
_0816ED90:
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #6
	beq _0816ED9A
	b _0816EE96
_0816ED9A:
	ldr r0, _0816EDE0
	movs r1, #0x78
	movs r2, #0x58
	movs r3, #0xf
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x67
	bl PlaySE
	ldr r1, _0816EDE4
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #4
	orrs r1, r2
	strb r1, [r3]
	ldrh r1, [r5, #8]
	strh r1, [r0, #0x34]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #0x10
	strh r0, [r5, #6]
	b _0816EE96
	.align 2, 0
_0816EDD8: .4byte 0x08D85E36
_0816EDDC: .4byte 0x0203786C
_0816EDE0: .4byte 0x085C60E4
_0816EDE4: .4byte 0x020205AC
_0816EDE8:
	subs r0, r1, #1
	strh r0, [r5, #6]
	b _0816EE96
_0816EDEE:
	ldrh r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0816EE96
	ldrh r0, [r5, #6]
	subs r0, #1
	adds r2, r0, #0
	strh r0, [r5, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0816EE4C
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _0816EE3C
	movs r0, #0x50
	movs r1, #0x10
	bl BlendPalette
	ldr r5, _0816EE40
	ldr r4, _0816EE44
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	adds r1, r4, #0
	subs r1, #0xc
	adds r0, r5, #0
	movs r2, #1
	bl CpuSet
	ldr r0, _0816EE48
	subs r4, #4
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	b _0816EE96
	.align 2, 0
_0816EE3C: .4byte 0x00002949
_0816EE40: .4byte 0x08D85E60
_0816EE44: .4byte 0x02037870
_0816EE48: .4byte 0x08D85E40
_0816EE4C:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #0x35
	strh r0, [r5, #6]
	b _0816EE96
_0816EE58:
	ldrh r0, [r5, #6]
	subs r0, #1
	strh r0, [r5, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816EE96
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _0816EE80
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _0816EE96
	.align 2, 0
_0816EE80: .4byte 0x00007FFF
_0816EE84:
	ldr r0, _0816EEA0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816EE96
	adds r0, r2, #0
	bl DestroyTask
_0816EE96:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816EEA0: .4byte 0x02037C74
	thumb_func_end Task_IntroRayquazaGlowScene_1

	thumb_func_start intro_reset_and_hide_bgs
intro_reset_and_hide_bgs: @ 0x0816EEA4
	push {lr}
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
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
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end intro_reset_and_hide_bgs

	thumb_func_start Task_IntroWaterDrops_1
Task_IntroWaterDrops_1: @ 0x0816EF0C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0816EF4C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0816EF54
	cmp r0, #1
	ble _0816EF2C
	cmp r0, #2
	beq _0816EFA0
_0816EF2C:
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldr r0, _0816EF50
	ldrh r1, [r0, #0x3e]
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	b _0816EF90
	.align 2, 0
_0816EF4C: .4byte 0x03005B60
_0816EF50: .4byte 0x0851AC0C
_0816EF54:
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0816EF84
	subs r0, r1, #1
	strh r0, [r4, #0xa]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r1, #0xff
	lsls r1, r1, #1
	ldr r2, _0816EF80
	ands r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x52
	bl SetGpuReg
	b _0816EFBE
	.align 2, 0
_0816EF80: .4byte 0x0851AC0C
_0816EF84:
	ldr r0, _0816EF9C
	ldrh r1, [r0]
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x10
_0816EF90:
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0816EFBE
	.align 2, 0
_0816EF9C: .4byte 0x0851AC0C
_0816EFA0:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyTask
_0816EFBE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_IntroWaterDrops_1

	thumb_func_start Task_IntroWaterDrops_2
Task_IntroWaterDrops_2: @ 0x0816EFC4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0816F004
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0816F00C
	cmp r0, #1
	ble _0816EFE4
	cmp r0, #2
	beq _0816F058
_0816EFE4:
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldr r0, _0816F008
	ldrh r1, [r0]
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	b _0816F048
	.align 2, 0
_0816F004: .4byte 0x03005B60
_0816F008: .4byte 0x0851AC0C
_0816F00C:
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0x3d
	bgt _0816F03C
	adds r0, r1, #1
	strh r0, [r4, #0xa]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r1, #0xff
	lsls r1, r1, #1
	ldr r2, _0816F038
	ands r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x52
	bl SetGpuReg
	b _0816F086
	.align 2, 0
_0816F038: .4byte 0x0851AC0C
_0816F03C:
	ldr r0, _0816F054
	ldrh r1, [r0, #0x3e]
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x10
_0816F048:
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0816F086
	.align 2, 0
_0816F054: .4byte 0x0851AC0C
_0816F058:
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0816F068
	subs r0, r1, #1
	strh r0, [r4, #0xa]
	b _0816F086
_0816F068:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyTask
_0816F086:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_IntroWaterDrops_2

	thumb_func_start PanFadeAndZoomScreen
PanFadeAndZoomScreen: @ 0x0816F08C
	push {r4, lr}
	sub sp, #0x24
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r4, #0x80
	lsls r4, r4, #8
	str r4, [sp]
	str r4, [sp, #4]
	mov r4, sp
	strh r0, [r4, #8]
	mov r0, sp
	strh r1, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r3, [r0, #0x10]
	add r4, sp, #0x14
	adds r1, r4, #0
	movs r2, #1
	bl BgAffineSet
	ldrh r1, [r4]
	movs r0, #0x20
	bl SetGpuReg
	ldrh r1, [r4, #2]
	movs r0, #0x22
	bl SetGpuReg
	ldrh r1, [r4, #4]
	movs r0, #0x24
	bl SetGpuReg
	ldrh r1, [r4, #6]
	movs r0, #0x26
	bl SetGpuReg
	ldrh r1, [r4, #8]
	movs r0, #0x28
	bl SetGpuReg
	ldrh r1, [r4, #0xa]
	movs r0, #0x2a
	bl SetGpuReg
	ldrh r1, [r4, #0xc]
	movs r0, #0x2c
	bl SetGpuReg
	ldrh r1, [r4, #0xe]
	movs r0, #0x2e
	bl SetGpuReg
	add sp, #0x24
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PanFadeAndZoomScreen

	thumb_func_start sub_0816F0FC
sub_0816F0FC: @ 0x0816F0FC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0xbf
	ble _0816F178
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0816F11A
	subs r0, r1, #1
	strh r0, [r4, #0x34]
	b _0816F17E
_0816F11A:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x32]
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	subs r0, r0, r1
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4, #0x32]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	adds r0, r1, #0
	subs r0, #0xc0
	cmp r0, #0
	bge _0816F15C
	adds r0, #0x7f
_0816F15C:
	asrs r0, r0, #7
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _0816F16A
	movs r0, #0xf
_0816F16A:
	lsls r2, r0, #4
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
	b _0816F17E
_0816F178:
	adds r0, r4, #0
	bl DestroySprite
_0816F17E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0816F0FC

	thumb_func_start sub_0816F188
sub_0816F188: @ 0x0816F188
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0816F1FC
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r3, #0x3c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0816F204
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r0, r0, r3
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #3
	bl StartSpriteAnim
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x30]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	strh r0, [r4, #0x34]
	ldr r0, _0816F200
	str r0, [r4, #0x1c]
	ldrb r1, [r4, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r4, #3]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	movs r3, #2
	bl CalcCenterToCornerVec
	b _0816F230
	.align 2, 0
_0816F1FC: .4byte 0x020205AC
_0816F200: .4byte 0x0816F0FD
_0816F204:
	ldrh r0, [r1, #0x24]
	strh r0, [r4, #0x24]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x26]
	strh r0, [r4, #0x26]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x20]
	strh r0, [r4, #0x20]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x22]
	strh r0, [r4, #0x22]
_0816F230:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0816F188

	thumb_func_start sub_0816F238
sub_0816F238: @ 0x0816F238
	push {lr}
	adds r1, r0, #0
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0816F248
	ldr r0, _0816F24C
	str r0, [r1, #0x1c]
_0816F248:
	pop {r0}
	bx r0
	.align 2, 0
_0816F24C: .4byte 0x0816F251
	thumb_func_end sub_0816F238

	thumb_func_start sub_0816F250
sub_0816F250: @ 0x0816F250
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r4, [r7, #0x20]
	movs r1, #0x20
	ldrsh r0, [r7, r1]
	cmp r0, #0x74
	bgt _0816F290
	ldrh r0, [r7, #0x26]
	ldrh r1, [r7, #0x22]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r7, #0x22]
	strh r1, [r7, #0x26]
	adds r0, r4, #4
	strh r0, [r7, #0x20]
	ldr r0, _0816F288
	strh r0, [r7, #0x24]
	movs r0, #0x80
	strh r0, [r7, #0x36]
	ldr r0, _0816F28C
	str r0, [r7, #0x1c]
	b _0816F382
	.align 2, 0
_0816F288: .4byte 0x0000FFFC
_0816F28C: .4byte 0x0816F399
_0816F290:
	ldrh r1, [r7, #0x36]
	ldr r5, _0816F394
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r5
	ldrh r2, [r0]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r5
	ldrh r3, [r0]
	adds r1, #2
	strh r1, [r7, #0x36]
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _0816F2B6
	adds r0, #0x1f
_0816F2B6:
	asrs r0, r0, #5
	strh r0, [r7, #0x26]
	subs r0, r4, #1
	strh r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0816F2CC
	ldrh r0, [r7, #0x22]
	adds r0, #1
	strh r0, [r7, #0x22]
_0816F2CC:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	cmp r0, #0
	bge _0816F2D8
	adds r0, #0xf
_0816F2D8:
	lsls r1, r0, #0xc
	lsrs r1, r1, #0x10
	ldrh r4, [r7, #0x32]
	ldrh r3, [r7, #0x34]
	adds r0, r1, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r5
	ldrh r2, [r0]
	adds r1, #0x30
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r1, r1, r5
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r1, #0
	muls r0, r4, r0
	cmp r0, #0
	bge _0816F302
	adds r0, #0xff
_0816F302:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	rsbs r0, r2, #0
	muls r0, r3, r0
	cmp r0, #0
	bge _0816F316
	adds r0, #0xff
_0816F316:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	adds r0, r2, #0
	muls r0, r4, r0
	cmp r0, #0
	bge _0816F326
	adds r0, #0xff
_0816F326:
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	muls r0, r3, r0
	cmp r0, #0
	bge _0816F334
	adds r0, #0xff
_0816F334:
	lsls r6, r0, #8
	lsrs r6, r6, #0x10
	ldrh r0, [r7, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	ldrh r0, [r7, #0x30]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r5
	mov r1, sl
	lsls r5, r1, #0x10
	lsrs r3, r5, #0x10
	lsls r4, r6, #0x10
	str r6, [sp]
	mov r1, r8
	mov r2, sb
	bl SetOamMatrix
	ldrh r0, [r7, #0x30]
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r5, #1
	lsrs r5, r5, #0x10
	lsls r4, r4, #1
	lsrs r4, r4, #0x10
	str r4, [sp]
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl SetOamMatrix
_0816F382:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816F394: .4byte 0x082FA8CC
	thumb_func_end sub_0816F250

	thumb_func_start sub_0816F398
sub_0816F398: @ 0x0816F398
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x3a]
	adds r1, #0x40
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	ldrh r0, [r4, #0x30]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x3a]
	adds r1, #0x40
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	ldrh r0, [r4, #0x30]
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x3a]
	adds r1, #0x40
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	ldrh r1, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #0x40
	beq _0816F430
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x36]
	adds r1, r0, #0
	ldr r2, _0816F42C
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0816F412
	adds r0, #0x3f
_0816F412:
	asrs r0, r0, #6
	strh r0, [r4, #0x24]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0816F426
	adds r0, #0x3f
_0816F426:
	asrs r0, r0, #6
	strh r0, [r4, #0x26]
	b _0816F438
	.align 2, 0
_0816F42C: .4byte 0x082FA8CC
_0816F430:
	movs r0, #0
	strh r0, [r4, #0x36]
	ldr r0, _0816F440
	str r0, [r4, #0x1c]
_0816F438:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816F440: .4byte 0x0816F445
	thumb_func_end sub_0816F398

	thumb_func_start sub_0816F444
sub_0816F444: @ 0x0816F444
	push {r4, lr}
	adds r1, r0, #0
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _0816F4A4
	ldrh r0, [r1, #0x36]
	adds r0, #8
	strh r0, [r1, #0x36]
	ldr r3, _0816F4A0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r3
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	bge _0816F468
	adds r0, #0xf
_0816F468:
	asrs r0, r0, #4
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r3
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	bge _0816F484
	adds r0, #0x3f
_0816F484:
	asrs r0, r0, #6
	strh r0, [r1, #0x24]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0816F498
	adds r0, #0x3f
_0816F498:
	asrs r0, r0, #6
	strh r0, [r1, #0x26]
	b _0816F4A8
	.align 2, 0
_0816F4A0: .4byte 0x082FA8CC
_0816F4A4:
	ldr r0, _0816F4B0
	str r0, [r1, #0x1c]
_0816F4A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816F4B0: .4byte 0x0816F4B5
	thumb_func_end sub_0816F444

	thumb_func_start SpriteCB_WaterDropFall_2
SpriteCB_WaterDropFall_2: @ 0x0816F4B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x22]
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _0816F4CC
	adds r0, r2, #4
	strh r0, [r4, #0x22]
	b _0816F528
_0816F4CC:
	movs r0, #1
	strh r0, [r4, #0x3c]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r0, r0, r3
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #3
	bl StartSpriteAnim
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x30]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	strh r0, [r4, #0x34]
	ldr r0, _0816F530
	str r0, [r4, #0x1c]
	ldrb r1, [r4, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r4, #3]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	movs r3, #2
	bl CalcCenterToCornerVec
_0816F528:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816F530: .4byte 0x0816F0FD
	thumb_func_end SpriteCB_WaterDropFall_2

	thumb_func_start SpriteCB_WaterDropFall
SpriteCB_WaterDropFall: @ 0x0816F534
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x22]
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _0816F54C
	adds r0, r2, #4
	strh r0, [r4, #0x22]
	b _0816F5A8
_0816F54C:
	movs r0, #1
	strh r0, [r4, #0x3c]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r3, [r4, #0x22]
	adds r0, r0, r3
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #3
	bl StartSpriteAnim
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x30]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	strh r0, [r4, #0x34]
	ldr r0, _0816F5B0
	str r0, [r4, #0x1c]
	ldrb r1, [r4, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r4, #3]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	movs r3, #2
	bl CalcCenterToCornerVec
_0816F5A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816F5B0: .4byte 0x0816F0FD
	thumb_func_end SpriteCB_WaterDropFall

	thumb_func_start CreateWaterDrop
CreateWaterDrop: @ 0x0816F5B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, [sp, #0x34]
	ldr r0, [sp, #0x38]
	mov r8, r0
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0xc]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r0, _0816F670
	lsrs r2, r4, #0x10
	mov sl, r2
	asrs r4, r4, #0x10
	lsrs r1, r5, #0x10
	str r1, [sp, #4]
	asrs r5, r5, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _0816F674
	mov sb, r2
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r5, r0, #2
	adds r4, r5, r2
	movs r0, #0
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x3c]
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r4, #0x30]
	mov r1, sp
	ldrh r1, [r1, #8]
	strh r1, [r4, #0x32]
	mov r2, sp
	ldrh r2, [r2, #8]
	strh r2, [r4, #0x34]
	strh r6, [r4, #0x38]
	mov r0, sp
	ldrh r0, [r0, #8]
	strh r0, [r4, #0x3a]
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x1f
	ldr r1, [sp, #0xc]
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	movs r3, #2
	bl CalcCenterToCornerVec
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
	mov r1, r8
	cmp r1, #0
	bne _0816F67C
	mov r0, sb
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0816F678
	b _0816F684
	.align 2, 0
_0816F670: .4byte 0x085C5E18
_0816F674: .4byte 0x020205AC
_0816F678: .4byte 0x0816F239
_0816F67C:
	mov r0, sb
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0816F7A4
_0816F684:
	str r1, [r0]
	str r7, [sp, #0x10]
	mov r2, sl
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sl, r2
	ldr r0, [sp, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0816F7A8
	mov r1, sl
	mov r2, r8
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r5, _0816F7AC
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r0, r4, r5
	mov r1, sp
	ldrh r1, [r1, #0x10]
	strh r1, [r0, #0x3c]
	ldr r2, [sp, #0xc]
	adds r2, #1
	mov sb, r2
	strh r2, [r0, #0x30]
	ldrb r1, [r0, #1]
	movs r2, #3
	orrs r1, r2
	strb r1, [r0, #1]
	mov r2, sb
	movs r1, #0x1f
	ands r2, r1
	lsls r2, r2, #1
	ldrb r3, [r0, #3]
	movs r6, #0x3f
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #3]
	movs r1, #0
	movs r2, #2
	movs r3, #2
	bl CalcCenterToCornerVec
	ldr r2, _0816F7B0
	adds r4, r4, r2
	ldr r0, _0816F7B4
	str r0, [r4]
	ldr r0, _0816F7A8
	mov r1, sl
	mov r2, r8
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r5, r4, r5
	mov r1, sp
	ldrh r1, [r1, #0x10]
	strh r1, [r5, #0x3c]
	ldr r2, [sp, #0xc]
	adds r2, #2
	mov r8, r2
	strh r2, [r5, #0x30]
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
	ldrb r0, [r5, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #1]
	mov r0, r8
	movs r2, #0x1f
	ands r0, r2
	lsls r0, r0, #1
	ldrb r1, [r5, #3]
	ands r6, r1
	orrs r6, r0
	strb r6, [r5, #3]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #2
	movs r3, #2
	bl CalcCenterToCornerVec
	ldr r0, _0816F7B0
	adds r4, r4, r0
	ldr r1, _0816F7B4
	str r1, [r4]
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	ldr r5, [sp, #8]
	adds r5, #0x20
	lsls r4, r5, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	str r4, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r5, r5, #0x11
	lsrs r5, r5, #0x10
	str r5, [sp]
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	ldr r0, [sp, #0x10]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0816F7A4: .4byte 0x0816F535
_0816F7A8: .4byte 0x085C5E18
_0816F7AC: .4byte 0x020205AC
_0816F7B0: .4byte 0x020205C8
_0816F7B4: .4byte 0x0816F189
	thumb_func_end CreateWaterDrop

	thumb_func_start SpriteCB_IntroGraphicsBicycle
SpriteCB_IntroGraphicsBicycle: @ 0x0816F7B8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bhi _0816F846
	lsls r0, r0, #2
	ldr r1, _0816F7D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816F7D0: .4byte 0x0816F7D4
_0816F7D4: @ jump table
	.4byte _0816F7E8 @ case 0
	.4byte _0816F7F6 @ case 1
	.4byte _0816F814 @ case 2
	.4byte _0816F846 @ case 3
	.4byte _0816F834 @ case 4
_0816F7E8:
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	ldrh r0, [r4, #0x20]
	subs r0, #1
	b _0816F844
_0816F7F6:
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	ldr r0, _0816F810
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0816F88E
	ldrh r0, [r4, #0x20]
	adds r0, #1
	b _0816F844
	.align 2, 0
_0816F810: .4byte 0x03005FE0
_0816F814:
	ldrh r2, [r4, #0x20]
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	ble _0816F82A
	ldr r0, _0816F830
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0816F852
_0816F82A:
	adds r0, r2, #1
	b _0816F844
	.align 2, 0
_0816F830: .4byte 0x03005FE0
_0816F834:
	ldrh r2, [r4, #0x20]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0816F846
	subs r0, r2, #2
_0816F844:
	strh r0, [r4, #0x20]
_0816F846:
	ldr r0, _0816F860
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0816F88E
_0816F852:
	movs r1, #0x26
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _0816F864
	movs r0, #0
	strh r0, [r4, #0x26]
	b _0816F88E
	.align 2, 0
_0816F860: .4byte 0x03005FE0
_0816F864:
	bl Random
	movs r1, #3
	ands r1, r0
	cmp r1, #1
	beq _0816F88C
	cmp r1, #1
	bgt _0816F87A
	cmp r1, #0
	beq _0816F882
	b _0816F88E
_0816F87A:
	cmp r1, #3
	bgt _0816F88E
	strh r5, [r4, #0x26]
	b _0816F88E
_0816F882:
	ldr r0, _0816F888
	strh r0, [r4, #0x26]
	b _0816F88E
	.align 2, 0
_0816F888: .4byte 0x0000FFFF
_0816F88C:
	strh r1, [r4, #0x26]
_0816F88E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_IntroGraphicsBicycle

	thumb_func_start SpriteCB_IntroGraphicsFlygon
SpriteCB_IntroGraphicsFlygon: @ 0x0816F894
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0816F8AE
	cmp r0, #1
	ble _0816F8F6
	cmp r0, #2
	beq _0816F8CE
	cmp r0, #3
	beq _0816F8E8
	b _0816F8F6
_0816F8AE:
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	movs r2, #0x20
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	ldr r1, _0816F8C4
	cmp r0, r1
	bgt _0816F8C8
	ldrh r0, [r4, #0x24]
	adds r0, #8
	b _0816F8F4
	.align 2, 0
_0816F8C4: .4byte 0x0000012F
_0816F8C8:
	movs r0, #2
	strh r0, [r4, #0x2e]
	b _0816F8F6
_0816F8CE:
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	movs r2, #0x20
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	cmp r0, #0x78
	ble _0816F8E2
	ldrh r0, [r4, #0x24]
	subs r0, #1
	b _0816F8F4
_0816F8E2:
	movs r0, #3
	strh r0, [r4, #0x2e]
	b _0816F8F6
_0816F8E8:
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _0816F8F6
	subs r0, r1, #2
_0816F8F4:
	strh r0, [r4, #0x24]
_0816F8F6:
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	bl Sin
	ldr r1, _0816F918
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816F918: .4byte 0x0203B998
	thumb_func_end SpriteCB_IntroGraphicsFlygon

	thumb_func_start sub_0816F91C
sub_0816F91C: @ 0x0816F91C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #5
	bls _0816F92A
	b _0816FB30
_0816F92A:
	lsls r0, r0, #2
	ldr r1, _0816F934
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816F934: .4byte 0x0816F938
_0816F938: @ jump table
	.4byte _0816F950 @ case 0
	.4byte _0816F978 @ case 1
	.4byte _0816F998 @ case 2
	.4byte _0816FA50 @ case 3
	.4byte _0816FABC @ case 4
	.4byte _0816FAEC @ case 5
_0816F950:
	ldrh r1, [r5, #0x30]
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0816F960
	subs r0, r1, #1
	strh r0, [r5, #0x30]
	b _0816FB30
_0816F960:
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2]
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	b _0816FADE
_0816F978:
	ldr r0, _0816F994
	ldr r0, [r0]
	cmp r0, #0x90
	beq _0816F982
	b _0816FB30
_0816F982:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	movs r0, #9
	strh r0, [r5, #0x30]
	movs r0, #2
	strh r0, [r5, #0x34]
	b _0816FB30
	.align 2, 0
_0816F994: .4byte 0x03005FE0
_0816F998:
	ldrh r1, [r5, #0x34]
	movs r2, #0x34
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0816FA5A
	movs r0, #2
	strh r0, [r5, #0x34]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0816FA00
	lsls r0, r0, #1
	ldr r1, _0816F9F0
	adds r0, r0, r1
	ldr r4, _0816F9F4
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _0816F9F8
	adds r0, r0, r1
	adds r1, r4, #0
	subs r1, #0x16
	movs r2, #1
	bl CpuSet
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _0816F9FC
	adds r0, r0, r1
	subs r4, #0xa
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	ldrh r0, [r5, #0x30]
	subs r0, #1
	strh r0, [r5, #0x30]
	b _0816FB30
	.align 2, 0
_0816F9F0: .4byte 0x08D85C34
_0816F9F4: .4byte 0x020379F2
_0816F9F8: .4byte 0x08D85C54
_0816F9FC: .4byte 0x08D85C74
_0816FA00:
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _0816FA40
	adds r0, r0, r1
	ldr r4, _0816FA44
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _0816FA48
	adds r0, r0, r1
	adds r1, r4, #0
	subs r1, #0x16
	movs r2, #1
	bl CpuSet
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _0816FA4C
	adds r0, r0, r1
	subs r4, #0xa
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	b _0816FADE
	.align 2, 0
_0816FA40: .4byte 0x08D85C34
_0816FA44: .4byte 0x020379F2
_0816FA48: .4byte 0x08D85C54
_0816FA4C: .4byte 0x08D85C74
_0816FA50:
	ldrh r1, [r5, #0x34]
	movs r2, #0x34
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0816FA60
_0816FA5A:
	subs r0, r1, #1
	strh r0, [r5, #0x34]
	b _0816FB30
_0816FA60:
	movs r0, #2
	strh r0, [r5, #0x34]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #9
	bgt _0816FADE
	lsls r0, r0, #1
	ldr r1, _0816FAAC
	adds r0, r0, r1
	ldr r4, _0816FAB0
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _0816FAB4
	adds r0, r0, r1
	adds r1, r4, #0
	subs r1, #0x16
	movs r2, #1
	bl CpuSet
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	ldr r1, _0816FAB8
	adds r0, r0, r1
	subs r4, #0xa
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	b _0816FB30
	.align 2, 0
_0816FAAC: .4byte 0x08D85C34
_0816FAB0: .4byte 0x020379F2
_0816FAB4: .4byte 0x08D85C54
_0816FAB8: .4byte 0x08D85C74
_0816FABC:
	ldr r0, _0816FAE8
	ldr r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bne _0816FB30
	adds r0, r5, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	ldrb r1, [r5, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #1]
_0816FADE:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _0816FB30
	.align 2, 0
_0816FAE8: .4byte 0x03005FE0
_0816FAEC:
	ldr r1, _0816FB38
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r5, #0x34]
	adds r0, r0, r1
	strh r0, [r5, #0x34]
	movs r2, #0x34
	ldrsh r0, [r5, r2]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	asrs r0, r0, #8
	strh r0, [r5, #0x24]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #3
	bgt _0816FB1C
	movs r2, #0x24
	ldrsh r0, [r5, r2]
	rsbs r0, r0, #0
	strh r0, [r5, #0x24]
_0816FB1C:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0816FB30
	adds r0, r5, #0
	bl DestroySprite
_0816FB30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816FB38: .4byte 0x085C5FFC
	thumb_func_end sub_0816F91C

	thumb_func_start sub_0816FB3C
sub_0816FB3C: @ 0x0816FB3C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0816FB74
	cmp r0, #1
	bgt _0816FB52
	cmp r0, #0
	beq _0816FB58
	b _0816FBA8
_0816FB52:
	cmp r0, #2
	beq _0816FB94
	b _0816FBA8
_0816FB58:
	ldr r0, _0816FB70
	ldr r0, [r0]
	cmp r0, #0x80
	bne _0816FBA8
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2]
	b _0816FB88
	.align 2, 0
_0816FB70: .4byte 0x03005FE0
_0816FB74:
	ldr r0, _0816FB90
	ldr r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bne _0816FBA8
	adds r0, r4, #0
	movs r1, #3
	bl StartSpriteAffineAnim
_0816FB88:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _0816FBA8
	.align 2, 0
_0816FB90: .4byte 0x03005FE0
_0816FB94:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0816FBA8
	adds r0, r4, #0
	bl DestroySprite
_0816FBA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0816FB3C

	thumb_func_start CreatePart1Animations
CreatePart1Animations: @ 0x0816FBB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r7, #0
_0816FBCA:
	lsls r5, r7, #2
	ldr r0, _0816FCBC
	adds r0, #2
	adds r0, r5, r0
	ldr r2, [sp]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	str r0, [sp, #8]
	ldr r3, _0816FCC0
	adds r2, r2, r3
	ldr r0, _0816FCC4
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	ldr r0, _0816FCC8
	adds r4, r4, r0
	movs r1, #0
	strh r1, [r4, #0x2e]
	ldr r0, _0816FCCC
	adds r0, r7, r0
	ldrb r0, [r0]
	strh r0, [r4, #0x30]
	strh r7, [r4, #0x32]
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	mov sl, r2
	mov r3, sl
	orrs r0, r3
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0xc
	movs r0, #0x1f
	mov sb, r0
	mov r2, sb
	ands r1, r2
	lsls r1, r1, #1
	ldrb r0, [r4, #3]
	movs r3, #0x3f
	rsbs r3, r3, #0
	mov r8, r3
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	ldr r3, _0816FCBC
	adds r5, r5, r3
	ldrb r1, [r5]
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #8
	bls _0816FBCA
	ldr r0, _0816FCD0
	ldr r2, [sp, #8]
	subs r2, #6
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x78
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	ldr r1, _0816FCC8
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0, #0x2e]
	adds r2, r0, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	mov r3, sl
	orrs r1, r3
	strb r1, [r2]
	adds r2, r7, #0
	adds r2, #0xc
	mov r1, sb
	ands r2, r1
	lsls r2, r2, #1
	ldrb r1, [r0, #3]
	mov r3, r8
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #3]
	movs r1, #1
	bl StartSpriteAffineAnim
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
_0816FCBC: .4byte 0x085C5F48
_0816FCC0: .4byte 0xFFFC0000
_0816FCC4: .4byte 0x085C6010
_0816FCC8: .4byte 0x020205AC
_0816FCCC: .4byte 0x085C6058
_0816FCD0: .4byte 0x085C6040
	thumb_func_end CreatePart1Animations

	thumb_func_start sub_0816FCD4
sub_0816FCD4: @ 0x0816FCD4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0816FD40
	ldr r2, _0816FD90
	ldrh r1, [r4, #0x32]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r2
	ldrh r3, [r0]
	adds r1, #0x40
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x30
	ldrsh r2, [r4, r1]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	cmp r1, #0
	bge _0816FD10
	adds r0, #0xff
_0816FD10:
	lsls r0, r0, #8
	lsrs r6, r0, #0x10
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	rsbs r0, r3, #0
	muls r0, r2, r0
	cmp r0, #0
	bge _0816FD22
	adds r0, #0xff
_0816FD22:
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	adds r0, r3, #0
	muls r0, r2, r0
	cmp r0, #0
	bge _0816FD30
	adds r0, #0xff
_0816FD30:
	lsls r0, r0, #8
	lsrs r2, r0, #0x10
	adds r1, r6, #0
	adds r3, r5, #0
	str r1, [sp]
	movs r0, #1
	bl SetOamMatrix
_0816FD40:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #1
	beq _0816FD94
	cmp r0, #1
	ble _0816FD50
	cmp r0, #2
	beq _0816FDF6
_0816FD50:
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #3]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	movs r3, #3
	bl CalcCenterToCornerVec
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r1, #0
	movs r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0x80
	strh r0, [r4, #0x30]
	strh r1, [r4, #0x32]
	strh r1, [r4, #0x34]
	b _0816FE30
	.align 2, 0
_0816FD90: .4byte 0x082FA8CC
_0816FD94:
	ldrh r0, [r4, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x8c
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x78
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #7
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x34]
	adds r0, #3
	strh r0, [r4, #0x34]
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _0816FE30
	ldrb r0, [r4, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #5]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0x14
	strh r0, [r4, #0x20]
	movs r0, #0x28
	strh r0, [r4, #0x22]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x30]
	movs r0, #0
	strh r0, [r4, #0x32]
	movs r0, #0x10
	b _0816FE2E
_0816FDF6:
	ldrh r0, [r4, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x22
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x3c
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #2
	strh r0, [r4, #0x30]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #5
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0816FE30
	ldrh r0, [r4, #0x34]
	adds r0, #1
_0816FE2E:
	strh r0, [r4, #0x34]
_0816FE30:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0816FCD4

	thumb_func_start SpriteCB_IntroRayquazaHyperbeam
SpriteCB_IntroRayquazaHyperbeam: @ 0x0816FE38
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0816FE4E
	adds r4, r5, #0
	adds r4, #0x3e
	cmp r0, #1
	beq _0816FE86
_0816FE4E:
	adds r4, r5, #0
	adds r4, #0x3e
	ldrb r1, [r4]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r5, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #1]
	ldrb r1, [r5, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x24
	orrs r0, r1
	strb r0, [r5, #3]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #3
	movs r3, #3
	bl CalcCenterToCornerVec
	movs r0, #0
	strh r0, [r5, #0x30]
	movs r0, #1
	strh r0, [r5, #0x2e]
_0816FE86:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0816FE9E
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	b _0816FEB6
_0816FE9E:
	ldrb r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4]
	ldrh r1, [r5, #0x30]
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r0, #0x3f
	bgt _0816FEB6
	adds r0, r1, #1
	strh r0, [r5, #0x30]
_0816FEB6:
	ldr r1, _0816FEEC
	ldrh r0, [r5, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r0, #0x12
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816FEEC: .4byte 0x082FA8CC
	thumb_func_end SpriteCB_IntroRayquazaHyperbeam

