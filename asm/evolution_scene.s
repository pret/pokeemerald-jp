.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start BeginEvolutionScene
BeginEvolutionScene: @ 0x0813DB44
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0813DB84
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0813DB88
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	strh r4, [r1, #0xc]
	strh r5, [r1, #0xe]
	strh r6, [r1, #0x1c]
	ldr r0, _0813DB8C
	bl SetMainCallback2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813DB84: .4byte 0x0813DAC5
_0813DB88: .4byte 0x03005B60
_0813DB8C: .4byte 0x0813DAB5
	thumb_func_end BeginEvolutionScene

	thumb_func_start EvolutionScene
EvolutionScene: @ 0x0813DB90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	mov sb, r1
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x18]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x1c]
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r1, #0
	str r1, [sp, #0x14]
	add r0, sp, #0x14
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0813DE14
	bl CpuSet
	movs r0, #0x4c
	movs r1, #0
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
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	bl ResetPaletteFade
	ldr r0, _0813DE18
	movs r2, #0
	strh r2, [r0]
	ldr r0, _0813DE1C
	strh r2, [r0]
	ldr r0, _0813DE20
	strh r2, [r0]
	ldr r0, _0813DE24
	strh r2, [r0]
	ldr r0, _0813DE28
	strh r2, [r0]
	ldr r0, _0813DE2C
	strh r2, [r0]
	ldr r1, _0813DE30
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0813DE34
	movs r1, #0
	strh r1, [r0]
	ldr r1, _0813DE38
	movs r0, #9
	strb r0, [r1]
	bl sub_08035528
	bl LoadBattleTextboxAndBackground
	bl ResetSpriteData
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r0, _0813DE3C
	movs r2, #4
	strb r2, [r0]
	movs r0, #0x64
	bl AllocZeroed
	ldr r1, _0813DE40
	str r0, [r1]
	bl AllocateMonSpritesGfx
	adds r0, r4, #0
	movs r1, #2
	mov r2, sp
	bl GetMonData
	ldr r0, _0813DE44
	mov r1, sp
	bl StringCopy10
	ldr r0, _0813DE48
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #1
	ldr r2, _0813DE4C
	adds r1, r1, r2
	bl StringCopy
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	str r0, [sp, #0x20]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	mov sl, r0
	lsls r0, r5, #3
	ldr r1, _0813DE50
	adds r0, r0, r1
	ldr r2, _0813DE54
	ldr r1, [r2]
	ldr r1, [r1, #8]
	adds r2, r5, #0
	bl DecompressPicFromTable_2
	adds r0, r5, #0
	ldr r1, [sp, #0x20]
	mov r2, sl
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadCompressedPalette
	adds r0, r5, #0
	movs r1, #1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0813DE58
	mov r8, r0
	ldr r1, _0813DE5C
	str r1, [r0, #0x10]
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #0x1e
	bl CreateSprite
	ldr r1, _0813DE40
	ldr r2, [r1]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	strb r0, [r2]
	ldr r7, _0813DE60
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r6, r7, #0
	adds r6, #0x1c
	adds r0, r1, r6
	ldr r2, _0813DE64
	str r2, [r0]
	adds r1, r1, r7
	ldrb r2, [r1, #5]
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r2
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1, #5]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	mov r1, sb
	lsls r0, r1, #3
	ldr r2, _0813DE50
	adds r0, r0, r2
	ldr r2, _0813DE54
	ldr r1, [r2]
	ldr r1, [r1, #0x10]
	mov r2, sb
	bl DecompressPicFromTable_2
	mov r0, sb
	ldr r1, [sp, #0x20]
	mov r2, sl
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadCompressedPalette
	mov r0, sb
	movs r1, #3
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0813DE5C
	mov r1, r8
	str r0, [r1, #0x10]
	mov r0, r8
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #0x1e
	bl CreateSprite
	ldr r1, _0813DE40
	ldr r2, [r1]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	strb r0, [r2, #1]
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r6, r1, r6
	ldr r2, _0813DE64
	str r2, [r6]
	adds r1, r1, r7
	ldrb r0, [r1, #5]
	ands r4, r0
	movs r0, #0x20
	orrs r4, r0
	strb r4, [r1, #5]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	bl LoadEvoSparkleSpriteAndPal
	ldr r0, _0813DE68
	movs r1, #0
	bl CreateTask
	ldr r1, _0813DE40
	ldr r2, [r1]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	strb r0, [r2, #2]
	ldr r1, _0813DE6C
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0, #8]
	strh r5, [r0, #0xa]
	mov r1, sb
	strh r1, [r0, #0xc]
	mov r2, sp
	ldrh r2, [r2, #0x18]
	strh r2, [r0, #0xe]
	movs r1, #1
	strh r1, [r0, #0x10]
	movs r1, #0
	strh r1, [r0, #0x1a]
	mov r2, sp
	ldrh r2, [r2, #0x1c]
	strh r2, [r0, #0x1c]
	ldr r1, _0813DE40
	ldr r0, [r1]
	ldr r1, _0813DE70
	adds r0, #4
	movs r2, #0x60
	bl memcpy
	movs r1, #0xfa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0813DE74
	bl SetHBlankCallback
	ldr r0, _0813DE78
	bl SetVBlankCallback
	bl m4aMPlayAllStop
	ldr r0, _0813DE7C
	bl SetMainCallback2
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813DE14: .4byte 0x05006000
_0813DE18: .4byte 0x02022AC8
_0813DE1C: .4byte 0x02022ACA
_0813DE20: .4byte 0x02022ACC
_0813DE24: .4byte 0x02022ACE
_0813DE28: .4byte 0x02022AD0
_0813DE2C: .4byte 0x02022AD2
_0813DE30: .4byte 0x02022AD4
_0813DE34: .4byte 0x02022AD6
_0813DE38: .4byte 0x02022C94
_0813DE3C: .4byte 0x030030BC
_0813DE40: .4byte 0x0203A84C
_0813DE44: .4byte 0x02021C40
_0813DE48: .4byte 0x02021C54
_0813DE4C: .4byte 0x082EA31C
_0813DE50: .4byte 0x082DDA1C
_0813DE54: .4byte 0x02024178
_0813DE58: .4byte 0x02024640
_0813DE5C: .4byte 0x082BF310
_0813DE60: .4byte 0x020205AC
_0813DE64: .4byte 0x080394FD
_0813DE68: .4byte 0x0813E639
_0813DE6C: .4byte 0x03005B60
_0813DE70: .4byte 0x020373F4
_0813DE74: .4byte 0x0813FDA1
_0813DE78: .4byte 0x0813FDA5
_0813DE7C: .4byte 0x0813E4A9
	thumb_func_end EvolutionScene

	thumb_func_start CB2_EvolutionSceneLoadGraphics
CB2_EvolutionSceneLoadGraphics: @ 0x0813DE80
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	ldr r2, _0813E018
	ldr r0, _0813E01C
	mov r8, r0
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x1c
	ldrsh r2, [r0, r1]
	movs r1, #0x64
	adds r4, r2, #0
	muls r4, r1, r4
	ldr r1, _0813E020
	adds r4, r4, r1
	ldrh r5, [r0, #0xc]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	mov sb, r0
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	adds r6, r0, #0
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r4, #0
	str r4, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0813E024
	add r0, sp, #4
	bl CpuSet
	movs r0, #0x4c
	movs r1, #0
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
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	bl ResetPaletteFade
	ldr r0, _0813E028
	strh r4, [r0]
	ldr r0, _0813E02C
	strh r4, [r0]
	ldr r0, _0813E030
	strh r4, [r0]
	ldr r0, _0813E034
	strh r4, [r0]
	ldr r0, _0813E038
	strh r4, [r0]
	ldr r0, _0813E03C
	strh r4, [r0]
	ldr r1, _0813E040
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0813E044
	strh r4, [r0]
	ldr r1, _0813E048
	movs r0, #9
	strb r0, [r1]
	bl sub_08035528
	bl LoadBattleTextboxAndBackground
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0813E04C
	movs r0, #4
	strb r0, [r1]
	lsls r0, r5, #3
	ldr r1, _0813E050
	adds r0, r0, r1
	ldr r1, _0813E054
	ldr r1, [r1]
	ldr r1, [r1, #0x10]
	adds r2, r5, #0
	bl DecompressPicFromTable_2
	adds r0, r5, #0
	mov r1, sb
	adds r2, r6, #0
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadCompressedPalette
	adds r0, r5, #0
	movs r1, #3
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0813E058
	ldr r1, _0813E05C
	str r1, [r0, #0x10]
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #0x1e
	bl CreateSprite
	mov r2, r8
	ldr r1, [r2]
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	strb r0, [r1, #1]
	ldr r3, _0813E060
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r1, r0
	ldr r2, _0813E064
	str r2, [r0]
	adds r1, r1, r3
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1, #5]
	movs r1, #0xfa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0813E068
	bl SetHBlankCallback
	ldr r0, _0813E06C
	bl SetVBlankCallback
	ldr r0, _0813E070
	bl SetMainCallback2
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E018: .4byte 0x03005B60
_0813E01C: .4byte 0x0203A84C
_0813E020: .4byte 0x02024190
_0813E024: .4byte 0x05006000
_0813E028: .4byte 0x02022AC8
_0813E02C: .4byte 0x02022ACA
_0813E030: .4byte 0x02022ACC
_0813E034: .4byte 0x02022ACE
_0813E038: .4byte 0x02022AD0
_0813E03C: .4byte 0x02022AD2
_0813E040: .4byte 0x02022AD4
_0813E044: .4byte 0x02022AD6
_0813E048: .4byte 0x02022C94
_0813E04C: .4byte 0x030030BC
_0813E050: .4byte 0x082DDA1C
_0813E054: .4byte 0x02024178
_0813E058: .4byte 0x02024640
_0813E05C: .4byte 0x082BF310
_0813E060: .4byte 0x020205AC
_0813E064: .4byte 0x080394FD
_0813E068: .4byte 0x0813FDA1
_0813E06C: .4byte 0x0813FDA5
_0813E070: .4byte 0x0813E4A9
	thumb_func_end CB2_EvolutionSceneLoadGraphics

	thumb_func_start CB2_TradeEvolutionSceneLoadGraphics
CB2_TradeEvolutionSceneLoadGraphics: @ 0x0813E074
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r2, _0813E0B0
	ldr r0, _0813E0B4
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x1c
	ldrsh r2, [r0, r1]
	movs r1, #0x64
	muls r2, r1, r2
	ldr r1, _0813E0B8
	adds r4, r2, r1
	ldrh r6, [r0, #0xc]
	ldr r0, _0813E0BC
	movs r3, #0x87
	lsls r3, r3, #3
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #7
	bls _0813E0A6
	b _0813E2CC
_0813E0A6:
	lsls r0, r0, #2
	ldr r1, _0813E0C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E0B0: .4byte 0x03005B60
_0813E0B4: .4byte 0x0203A84C
_0813E0B8: .4byte 0x02024190
_0813E0BC: .4byte 0x03002360
_0813E0C0: .4byte 0x0813E0C4
_0813E0C4: @ jump table
	.4byte _0813E0E4 @ case 0
	.4byte _0813E154 @ case 1
	.4byte _0813E17C @ case 2
	.4byte _0813E182 @ case 3
	.4byte _0813E1AC @ case 4
	.4byte _0813E1F4 @ case 5
	.4byte _0813E264 @ case 6
	.4byte _0813E29C @ case 7
_0813E0E4:
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0813E130
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0813E134
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0813E138
	strh r1, [r0]
	ldr r0, _0813E13C
	strh r1, [r0]
	ldr r0, _0813E140
	strh r1, [r0]
	ldr r0, _0813E144
	strh r1, [r0]
	ldr r0, _0813E148
	strh r1, [r0]
	ldr r2, _0813E14C
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _0813E150
	strh r1, [r0]
	b _0813E284
	.align 2, 0
_0813E130: .4byte 0x030030BC
_0813E134: .4byte 0x02022AC8
_0813E138: .4byte 0x02022ACA
_0813E13C: .4byte 0x02022ACC
_0813E140: .4byte 0x02022ACE
_0813E144: .4byte 0x02022AD0
_0813E148: .4byte 0x02022AD2
_0813E14C: .4byte 0x02022AD4
_0813E150: .4byte 0x02022AD6
_0813E154:
	bl ResetPaletteFade
	ldr r0, _0813E170
	bl SetHBlankCallback
	ldr r0, _0813E174
	bl SetVBlankCallback
	ldr r1, _0813E178
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _0813E28C
	.align 2, 0
_0813E170: .4byte 0x0813FDA1
_0813E174: .4byte 0x0813FE2D
_0813E178: .4byte 0x03002360
_0813E17C:
	bl sub_0807EBD4
	b _0813E284
_0813E182:
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	ldr r1, _0813E1A8
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _0813E28C
	.align 2, 0
_0813E1A8: .4byte 0x03002360
_0813E1AC:
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r0, r6, #3
	ldr r1, _0813E1EC
	adds r0, r0, r1
	ldr r1, _0813E1F0
	ldr r1, [r1]
	ldr r1, [r1, #0x10]
	adds r2, r6, #0
	bl DecompressPicFromTable_2
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadCompressedPalette
	b _0813E284
	.align 2, 0
_0813E1EC: .4byte 0x082DDA1C
_0813E1F0: .4byte 0x02024178
_0813E1F4:
	adds r0, r6, #0
	movs r1, #1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0813E24C
	ldr r1, _0813E250
	str r1, [r0, #0x10]
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #0x1e
	bl CreateSprite
	ldr r1, _0813E254
	ldr r1, [r1]
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	strb r0, [r1, #1]
	ldr r3, _0813E258
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r1, r0
	ldr r2, _0813E25C
	str r2, [r0]
	adds r1, r1, r3
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r1, _0813E260
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_0807ABB0
	b _0813E2CC
	.align 2, 0
_0813E24C: .4byte 0x02024640
_0813E250: .4byte 0x082BF310
_0813E254: .4byte 0x0203A84C
_0813E258: .4byte 0x020205AC
_0813E25C: .4byte 0x080394FD
_0813E260: .4byte 0x03002360
_0813E264:
	ldr r0, _0813E294
	ldrb r0, [r0]
	cmp r0, #0
	beq _0813E278
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
_0813E278:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
_0813E284:
	ldr r1, _0813E298
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_0813E28C:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0813E2CC
	.align 2, 0
_0813E294: .4byte 0x0300319C
_0813E298: .4byte 0x03002360
_0813E29C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	bl sub_0807AB9C
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	ldr r0, _0813E2D4
	bl SetMainCallback2
	movs r1, #0x9a
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
_0813E2CC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813E2D4: .4byte 0x0813E4C5
	thumb_func_end CB2_TradeEvolutionSceneLoadGraphics

	thumb_func_start TradeEvolutionScene
TradeEvolutionScene: @ 0x0813E2D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	movs r1, #2
	mov r2, sp
	bl GetMonData
	ldr r0, _0813E448
	mov r1, sp
	bl StringCopy10
	ldr r0, _0813E44C
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r2, _0813E450
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _0813E454
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	mov sl, r0
	ldr r1, _0813E458
	mov sb, r1
	movs r0, #0x64
	bl AllocZeroed
	mov r2, sb
	str r0, [r2]
	movs r4, #0
	strb r6, [r0]
	lsls r0, r5, #3
	ldr r1, _0813E45C
	adds r0, r0, r1
	ldr r1, _0813E460
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r2, r5, #0
	bl DecompressPicFromTable_2
	adds r0, r5, #0
	mov r1, sl
	adds r2, r7, #0
	bl GetMonSpritePalStructFromOtIdPersonality
	ldr r0, [r0]
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadCompressedPalette
	adds r0, r5, #0
	movs r1, #1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0813E464
	ldr r1, _0813E468
	str r1, [r0, #0x10]
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #0x1e
	bl CreateSprite
	mov r1, sb
	ldr r2, [r1]
	lsls r1, r0, #0x18
	lsrs r6, r1, #0x18
	strb r0, [r2, #1]
	ldr r3, _0813E46C
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r1, r0
	ldr r2, _0813E470
	str r2, [r0]
	adds r1, r1, r3
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1, #5]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	bl LoadEvoSparkleSpriteAndPal
	ldr r0, _0813E474
	movs r1, #0
	bl CreateTask
	mov r1, sb
	ldr r2, [r1]
	lsls r1, r0, #0x18
	lsrs r6, r1, #0x18
	strb r0, [r2, #2]
	ldr r1, _0813E478
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #8]
	mov r2, r8
	strh r2, [r0, #0xa]
	strh r5, [r0, #0xc]
	movs r1, #1
	strh r1, [r0, #0x10]
	strh r4, [r0, #0x1a]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0x1c]
	ldr r0, _0813E47C
	strh r4, [r0]
	ldr r0, _0813E480
	strh r4, [r0]
	ldr r0, _0813E484
	strh r4, [r0]
	ldr r0, _0813E488
	strh r4, [r0]
	ldr r0, _0813E48C
	strh r4, [r0]
	ldr r0, _0813E490
	strh r4, [r0]
	ldr r1, _0813E494
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0813E498
	strh r4, [r0]
	ldr r2, _0813E49C
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0813E4A0
	bl SetVBlankCallback
	ldr r0, _0813E4A4
	bl SetMainCallback2
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E448: .4byte 0x02021C40
_0813E44C: .4byte 0x02021C54
_0813E450: .4byte 0x082EA31C
_0813E454: .4byte 0x02021C3C
_0813E458: .4byte 0x0203A84C
_0813E45C: .4byte 0x082DDA1C
_0813E460: .4byte 0x02024178
_0813E464: .4byte 0x02024640
_0813E468: .4byte 0x082BF310
_0813E46C: .4byte 0x020205AC
_0813E470: .4byte 0x080394FD
_0813E474: .4byte 0x0813F281
_0813E478: .4byte 0x03005B60
_0813E47C: .4byte 0x02022AC8
_0813E480: .4byte 0x02022ACA
_0813E484: .4byte 0x02022ACC
_0813E488: .4byte 0x02022ACE
_0813E48C: .4byte 0x02022AD0
_0813E490: .4byte 0x02022AD2
_0813E494: .4byte 0x02022AD4
_0813E498: .4byte 0x02022AD6
_0813E49C: .4byte 0x030030B4
_0813E4A0: .4byte 0x0813FE2D
_0813E4A4: .4byte 0x0813E4C5
	thumb_func_end TradeEvolutionScene

	thumb_func_start CB2_EvolutionSceneUpdate
CB2_EvolutionSceneUpdate: @ 0x0813E4A8
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_EvolutionSceneUpdate

	thumb_func_start CB2_TradeEvolutionSceneUpdate
CB2_TradeEvolutionSceneUpdate: @ 0x0813E4C4
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_TradeEvolutionSceneUpdate

	thumb_func_start CreateShedinja
CreateShedinja: @ 0x0813E4E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0813E628
	mov sl, r0
	mov r2, sb
	lsls r2, r2, #2
	str r2, [sp, #4]
	adds r0, r2, #0
	add r0, sb
	lsls r7, r0, #3
	adds r0, r7, #0
	add r0, sl
	mov r8, r0
	ldrh r0, [r0]
	cmp r0, #0xd
	beq _0813E514
	b _0813E616
_0813E514:
	ldr r6, _0813E62C
	ldrb r0, [r6]
	cmp r0, #5
	bhi _0813E616
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _0813E630
	adds r0, r0, r4
	movs r2, #0x64
	bl CopyMon
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	mov r1, sl
	adds r2, r1, r7
	adds r2, #0xc
	movs r1, #0xb
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	mov r2, r8
	ldrh r1, [r2, #0xc]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _0813E634
	adds r2, r2, r1
	movs r1, #2
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #8
	mov r2, sp
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0xa
	mov r2, sp
	bl SetMonData
	movs r4, #0x32
	ldr r0, [sp, #4]
	mov r8, r0
	adds r5, r6, #0
_0813E588:
	ldrb r1, [r5]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0813E630
	adds r0, r0, r1
	adds r1, r4, #0
	mov r2, sp
	bl SetMonData
	adds r4, #1
	cmp r4, #0x36
	ble _0813E588
	movs r4, #0x43
	ldr r7, _0813E62C
_0813E5A4:
	ldrb r0, [r7]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0813E630
	adds r0, r0, r5
	adds r1, r4, #0
	mov r2, sp
	bl SetMonData
	adds r4, #1
	cmp r4, #0x4f
	ble _0813E5A4
	ldr r4, _0813E62C
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x37
	mov r2, sp
	bl SetMonData
	movs r0, #0xff
	str r0, [sp]
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x40
	mov r2, sp
	bl SetMonData
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r5
	bl CalculateMonStats
	bl CalculatePlayerPartyCount
	ldr r0, _0813E628
	mov r4, r8
	add r4, sb
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0xc]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	bl GetSetPokedexFlag
	ldrh r0, [r4, #0xc]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl GetSetPokedexFlag
_0813E616:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E628: .4byte 0x082F5CA4
_0813E62C: .4byte 0x0202418D
_0813E630: .4byte 0x02024190
_0813E634: .4byte 0x082EA31C
	thumb_func_end CreateShedinja

	thumb_func_start Task_EvolutionScene
Task_EvolutionScene: @ 0x0813E638
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _0813E6A8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r3, r0, r2
	movs r0, #0x1c
	ldrsh r1, [r3, r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0813E6AC
	adds r1, r1, r0
	mov sb, r1
	ldr r0, _0813E6B0
	ldrh r1, [r0, #0x2c]
	adds r5, r2, #0
	adds r6, r0, #0
	cmp r1, #2
	bne _0813E6B8
	movs r1, #8
	ldrsh r0, [r3, r1]
	cmp r0, #8
	bne _0813E6B8
	ldr r4, _0813E6B4
	ldrb r0, [r4, #2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0813E6B8
	ldrh r1, [r3, #0xe]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0813E6B8
	movs r0, #0x11
	strh r0, [r3, #8]
	ldrb r1, [r4, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r2, [r0, #0x18]
	bl sub_081401FC
	bl _0813F26C
	.align 2, 0
_0813E6A8: .4byte 0x03005B60
_0813E6AC: .4byte 0x02024190
_0813E6B0: .4byte 0x03002360
_0813E6B4: .4byte 0x02023FD6
_0813E6B8:
	lsls r1, r7, #2
	adds r0, r1, r7
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, #0x16
	bls _0813E6CE
	bl _0813F26C
_0813E6CE:
	lsls r0, r0, #2
	ldr r1, _0813E6D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E6D8: .4byte 0x0813E6DC
_0813E6DC: @ jump table
	.4byte _0813E738 @ case 0
	.4byte _0813E79C @ case 1
	.4byte _0813E7DC @ case 2
	.4byte _0813E808 @ case 3
	.4byte _0813E838 @ case 4
	.4byte _0813E878 @ case 5
	.4byte _0813E8B0 @ case 6
	.4byte _0813E8F0 @ case 7
	.4byte _0813E928 @ case 8
	.4byte _0813E96C @ case 9
	.4byte _0813E988 @ case 10
	.4byte _0813E9B4 @ case 11
	.4byte _0813E9E0 @ case 12
	.4byte _0813EA2C @ case 13
	.4byte _0813EA58 @ case 14
	.4byte _0813EAE4 @ case 15
	.4byte _0813EB90 @ case 16
	.4byte _0813EBFC @ case 17
	.4byte _0813EC3C @ case 18
	.4byte _0813EC70 @ case 19
	.4byte _0813ECD8 @ case 20
	.4byte _0813ED34 @ case 21
	.4byte _0813ED70 @ case 22
_0813E738:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _0813E790
	ldr r0, _0813E794
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldr r0, _0813E798
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	bl _0813F26C
	.align 2, 0
_0813E790: .4byte 0x020205AC
_0813E794: .4byte 0x0203A84C
_0813E798: .4byte 0x03005B60
_0813E79C:
	ldr r0, _0813E7CC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813E7AC
	bl _0813F26C
_0813E7AC:
	ldr r4, _0813E7D0
	ldr r1, _0813E7D4
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #0
	bl sub_0814FA04
	ldr r0, _0813E7D8
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0813ED1A
	.align 2, 0
_0813E7CC: .4byte 0x02037C74
_0813E7D0: .4byte 0x02021C7C
_0813E7D4: .4byte 0x085ABAFC
_0813E7D8: .4byte 0x03005B60
_0813E7DC:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813E7EC
	bl _0813F26C
_0813E7EC:
	ldr r0, _0813E800
	ldr r0, [r0]
	ldrb r0, [r0]
	ldr r1, _0813E804
	mov r3, r8
	adds r4, r3, r7
	lsls r4, r4, #3
	adds r4, r4, r1
	b _0813EC58
	.align 2, 0
_0813E800: .4byte 0x0203A84C
_0813E804: .4byte 0x03005B60
_0813E808:
	ldr r0, _0813E830
	ldr r0, [r0]
	ldrb r0, [r0]
	bl EvoScene_IsMonAnimFinished
	cmp r0, #0
	bne _0813E81A
	bl _0813F26C
_0813E81A:
	movs r0, #0xbc
	lsls r0, r0, #1
	bl PlaySE
	ldr r0, _0813E834
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0813ED1A
	.align 2, 0
_0813E830: .4byte 0x0203A84C
_0813E834: .4byte 0x03005B60
_0813E838:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0813E848
	bl _0813F26C
_0813E848:
	ldr r0, _0813E870
	bl PlayNewMapMusic
	ldr r0, _0813E874
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	str r4, [sp]
	movs r0, #0x1c
	movs r1, #4
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	bl _0813F26C
	.align 2, 0
_0813E870: .4byte 0x00000179
_0813E874: .4byte 0x03005B60
_0813E878:
	ldr r0, _0813E8A4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813E888
	bl _0813F26C
_0813E888:
	movs r0, #0
	bl InitMovingBackgroundTask
	movs r0, #0x11
	bl LaunchTask_PreEvoSparklesSet1
	ldr r1, _0813E8A8
	strb r0, [r1, #2]
	ldr r0, _0813E8AC
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0813ED1A
	.align 2, 0
_0813E8A4: .4byte 0x02037C74
_0813E8A8: .4byte 0x02023FD6
_0813E8AC: .4byte 0x03005B60
_0813E8B0:
	ldr r4, _0813E8E8
	ldrb r0, [r4, #2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0813E8C6
	bl _0813F26C
_0813E8C6:
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	ldr r0, _0813E8EC
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #3]
	bl LaunchTask_PostEvoSparklesSet1
	strb r0, [r4, #2]
	bl _0813F26C
	.align 2, 0
_0813E8E8: .4byte 0x02023FD6
_0813E8EC: .4byte 0x0203A84C
_0813E8F0:
	ldr r4, _0813E920
	ldrb r0, [r4, #2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0813E906
	bl _0813F26C
_0813E906:
	ldr r0, _0813E924
	ldr r1, [r0]
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl sub_0817C260
	strb r0, [r4, #2]
	mov r0, r8
	adds r1, r0, r7
	lsls r1, r1, #3
	adds r1, r1, r5
	b _0813ED1A
	.align 2, 0
_0813E920: .4byte 0x02023FD6
_0813E924: .4byte 0x0203A84C
_0813E928:
	ldr r2, _0813E964
	ldr r1, [r2]
	ldrb r0, [r1, #3]
	subs r0, #1
	strb r0, [r1, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813E93C
	bl _0813F26C
_0813E93C:
	ldr r1, [r2]
	movs r0, #3
	strb r0, [r1, #3]
	ldr r0, _0813E968
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0813E958
	bl _0813F26C
_0813E958:
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r5
	b _0813ED1A
	.align 2, 0
_0813E964: .4byte 0x0203A84C
_0813E968: .4byte 0x02023FD6
_0813E96C:
	bl LaunchTask_PreEvoSparklesSet2
	ldr r1, _0813E980
	strb r0, [r1, #2]
	ldr r0, _0813E984
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0813ED1A
	.align 2, 0
_0813E980: .4byte 0x02023FD6
_0813E984: .4byte 0x03005B60
_0813E988:
	ldr r6, _0813E9B0
	ldrb r0, [r6, #2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0813E99E
	bl _0813F26C
_0813E99E:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, r4, #3
	adds r4, r4, r5
	ldrh r0, [r4, #0xc]
	bl LaunchTask_PostEvoSparklesSet2AndFlash
	strb r0, [r6, #2]
	b _0813EC5E
	.align 2, 0
_0813E9B0: .4byte 0x02023FD6
_0813E9B4:
	ldr r0, _0813E9DC
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0813E9CA
	bl _0813F26C
_0813E9CA:
	movs r0, #0x21
	bl PlaySE
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r5
	b _0813ED1A
	.align 2, 0
_0813E9DC: .4byte 0x02023FD6
_0813E9E0:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813E9EE
	bl _0813F26C
_0813E9EE:
	bl m4aMPlayAllStop
	ldr r0, _0813EA20
	ldr r1, _0813EA24
	ldr r1, [r1]
	adds r1, #4
	movs r2, #0x60
	bl memcpy
	bl sub_0814023C
	movs r0, #0
	str r0, [sp]
	movs r0, #0x1c
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0813EA28
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0813ED1A
	.align 2, 0
_0813EA20: .4byte 0x020373F4
_0813EA24: .4byte 0x0203A84C
_0813EA28: .4byte 0x03005B60
_0813EA2C:
	ldr r0, _0813EA50
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813EA3C
	bl _0813F26C
_0813EA3C:
	ldr r0, _0813EA54
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	mov r1, r8
	adds r4, r1, r7
	lsls r4, r4, #3
	adds r4, r4, r5
	ldrh r1, [r4, #0xc]
	b _0813EC5A
	.align 2, 0
_0813EA50: .4byte 0x02037C74
_0813EA54: .4byte 0x0203A84C
_0813EA58:
	bl IsCryFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813EA66
	bl _0813F26C
_0813EA66:
	ldr r4, _0813EAD4
	ldr r1, _0813EAD8
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #0
	bl sub_0814FA04
	ldr r0, _0813EADC
	bl PlayBGM
	ldr r2, _0813EAE0
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	adds r2, r2, r1
	adds r2, #0xc
	mov r0, sb
	movs r1, #0xb
	bl SetMonData
	mov r0, sb
	bl CalculateMonStats
	ldrh r1, [r4, #0xa]
	ldrh r2, [r4, #0xc]
	mov r0, sb
	bl sub_0806D23C
	ldrh r0, [r4, #0xc]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	bl GetSetPokedexFlag
	ldrh r0, [r4, #0xc]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl GetSetPokedexFlag
	movs r0, #0xe
	bl IncrementGameStat
	b _0813F26C
	.align 2, 0
_0813EAD4: .4byte 0x02021C7C
_0813EAD8: .4byte 0x085ABB0F
_0813EADC: .4byte 0x00000173
_0813EAE0: .4byte 0x03005B60
_0813EAE4:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813EAF2
	b _0813F26C
_0813EAF2:
	ldr r1, _0813EB50
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrb r1, [r4, #0x10]
	mov r0, sb
	bl MonTryLearningNewMove
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0813EB70
	movs r3, #0x1a
	ldrsh r5, [r4, r3]
	cmp r5, #0
	bne _0813EB70
	ldrh r1, [r4, #0xe]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0813EB26
	bl StopMapMusic
	bl Overworld_PlaySpecialMapMusic
_0813EB26:
	ldrh r0, [r4, #0xe]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x14]
	mov r0, sb
	movs r1, #2
	add r2, sp, #4
	bl GetMonData
	ldr r0, _0813EB54
	add r1, sp, #4
	bl StringCopy10
	ldr r0, _0813EB58
	cmp r6, r0
	bne _0813EB5C
	movs r0, #0x16
	strh r0, [r4, #8]
	b _0813F26C
	.align 2, 0
_0813EB50: .4byte 0x03005B60
_0813EB54: .4byte 0x02022C0C
_0813EB58: .4byte 0x0000FFFF
_0813EB5C:
	ldr r0, _0813EB6C
	cmp r6, r0
	bne _0813EB64
	b _0813F26C
_0813EB64:
	movs r0, #0x14
	strh r0, [r4, #8]
	b _0813F26C
	.align 2, 0
_0813EB6C: .4byte 0x0000FFFE
_0813EB70:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0813EB8C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0813ED1A
	.align 2, 0
_0813EB8C: .4byte 0x03005B60
_0813EB90:
	ldr r0, _0813EBF0
	ldrb r1, [r0, #7]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _0813EBA4
	b _0813F26C
_0813EBA4:
	mov r3, r8
	adds r0, r3, r7
	lsls r0, r0, #3
	adds r4, r0, r5
	ldrh r1, [r4, #0xe]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0813EBBE
	bl StopMapMusic
	bl Overworld_PlaySpecialMapMusic
_0813EBBE:
	movs r1, #0x1a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0813EBCE
	ldrh r0, [r4, #0xa]
	mov r1, sb
	bl CreateShedinja
_0813EBCE:
	adds r0, r7, #0
	bl DestroyTask
	bl FreeMonSpritesGfx
	ldr r4, _0813EBF4
	ldr r0, [r4]
	bl Free
	str r6, [r4]
	bl FreeAllWindowBuffers
	ldr r0, _0813EBF8
	ldr r0, [r0]
	bl SetMainCallback2
	b _0813F26C
	.align 2, 0
_0813EBF0: .4byte 0x02037C74
_0813EBF4: .4byte 0x0203A84C
_0813EBF8: .4byte 0x03005F28
_0813EBFC:
	ldr r0, _0813EC30
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0813EC10
	b _0813F26C
_0813EC10:
	bl m4aMPlayAllStop
	ldr r0, _0813EC34
	ldr r1, _0813EC38
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r5
	b _0813ED1A
	.align 2, 0
_0813EC30: .4byte 0x02023FD6
_0813EC34: .4byte 0x0006001C
_0813EC38: .4byte 0x00007FFF
_0813EC3C:
	ldr r0, _0813EC68
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813EC4A
	b _0813F26C
_0813EC4A:
	ldr r0, _0813EC6C
	ldr r0, [r0]
	ldrb r0, [r0]
	mov r3, r8
	adds r4, r3, r7
	lsls r4, r4, #3
	adds r4, r4, r5
_0813EC58:
	ldrh r1, [r4, #0xa]
_0813EC5A:
	bl EvoScene_DoMonAnimation
_0813EC5E:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0813F26C
	.align 2, 0
_0813EC68: .4byte 0x02037C74
_0813EC6C: .4byte 0x0203A84C
_0813EC70:
	ldr r0, _0813EC9C
	ldr r0, [r0]
	ldrb r0, [r0]
	bl EvoScene_IsMonAnimFinished
	cmp r0, #0
	bne _0813EC80
	b _0813F26C
_0813EC80:
	ldr r0, _0813ECA0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #0x1a
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0813ECAC
	ldr r0, _0813ECA4
	ldr r1, _0813ECA8
	bl StringExpandPlaceholders
	b _0813ECB4
	.align 2, 0
_0813EC9C: .4byte 0x0203A84C
_0813ECA0: .4byte 0x03005B60
_0813ECA4: .4byte 0x02021C7C
_0813ECA8: .4byte 0x085ABB3E
_0813ECAC:
	ldr r0, _0813ECCC
	ldr r1, _0813ECD0
	bl StringExpandPlaceholders
_0813ECB4:
	ldr r0, _0813ECCC
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0813ECD4
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #0x1a]
	b _0813F236
	.align 2, 0
_0813ECCC: .4byte 0x02021C7C
_0813ECD0: .4byte 0x085ABB28
_0813ECD4: .4byte 0x03005B60
_0813ECD8:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813ECE6
	b _0813F26C
_0813ECE6:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813ECF2
	b _0813F26C
_0813ECF2:
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r0, _0813ED24
	bl PlayFanfare
	ldr r0, _0813ED28
	ldr r0, [r0, #0xc]
	bl TryGetStatusString
	ldr r0, _0813ED2C
	movs r1, #0
	bl sub_0814FA04
	ldr r0, _0813ED30
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x40
	strh r0, [r1, #0x10]
_0813ED1A:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0813F26C
	.align 2, 0
_0813ED24: .4byte 0x0000016F
_0813ED28: .4byte 0x085AB3DC
_0813ED2C: .4byte 0x02022AE0
_0813ED30: .4byte 0x03005B60
_0813ED34:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813ED42
	b _0813F26C
_0813ED42:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813ED4E
	b _0813F26C
_0813ED4E:
	ldr r0, _0813ED6C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x10]
	subs r0, #1
	strh r0, [r1, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813ED66
	b _0813F26C
_0813ED66:
	movs r0, #0xf
	strh r0, [r1, #8]
	b _0813F26C
	.align 2, 0
_0813ED6C: .4byte 0x03005B60
_0813ED70:
	mov r3, r8
	adds r0, r3, r7
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0x14
	ldrsh r0, [r0, r1]
	cmp r0, #0xc
	bls _0813ED82
	b _0813F26C
_0813ED82:
	lsls r0, r0, #2
	ldr r1, _0813ED8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813ED8C: .4byte 0x0813ED90
_0813ED90: @ jump table
	.4byte _0813EDC4 @ case 0
	.4byte _0813EE10 @ case 1
	.4byte _0813EE58 @ case 2
	.4byte _0813EE96 @ case 3
	.4byte _0813EEFC @ case 4
	.4byte _0813EFF8 @ case 5
	.4byte _0813F050 @ case 6
	.4byte _0813F124 @ case 7
	.4byte _0813F158 @ case 8
	.4byte _0813F1A0 @ case 9
	.4byte _0813F1E8 @ case 10
	.4byte _0813F21C @ case 11
	.4byte _0813F248 @ case 12
_0813EDC4:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813EDD2
	b _0813F26C
_0813EDD2:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813EDDE
	b _0813F26C
_0813EDDE:
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r0, _0813EE04
	ldr r0, [r0, #0x10]
	bl TryGetStatusString
	ldr r0, _0813EE08
	movs r1, #0
	bl sub_0814FA04
	ldr r0, _0813EE0C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813F26A
	.align 2, 0
_0813EE04: .4byte 0x085AB3DC
_0813EE08: .4byte 0x02022AE0
_0813EE0C: .4byte 0x03005B60
_0813EE10:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813EE1E
	b _0813F26C
_0813EE1E:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813EE2A
	b _0813F26C
_0813EE2A:
	ldr r0, _0813EE4C
	ldr r0, [r0, #0x14]
	bl TryGetStatusString
	ldr r0, _0813EE50
	movs r1, #0
	bl sub_0814FA04
	ldr r0, _0813EE54
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813F26A
	.align 2, 0
_0813EE4C: .4byte 0x085AB3DC
_0813EE50: .4byte 0x02022AE0
_0813EE54: .4byte 0x03005B60
_0813EE58:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0813EE96
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813EE96
	ldr r0, _0813EEE8
	ldr r0, [r0, #0x18]
	bl TryGetStatusString
	ldr r0, _0813EEEC
	movs r1, #0
	bl sub_0814FA04
	ldr r0, _0813EEF0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	strh r0, [r1, #0x16]
	movs r0, #0xa
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x14]
	adds r0, #1
	strh r0, [r1, #0x14]
_0813EE96:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813EEA4
	b _0813F26C
_0813EEA4:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0813EEB2
	b _0813F26C
_0813EEB2:
	str r0, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	ldr r0, _0813EEF4
	movs r1, #0xc
	bl sub_0814FA04
	ldr r0, _0813EEF0
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	movs r2, #0
	strh r0, [r1, #0x14]
	ldr r0, _0813EEF8
	strb r2, [r0, #1]
	movs r0, #0
	bl BattleCreateYesNoCursorAt
	b _0813F26C
	.align 2, 0
_0813EEE8: .4byte 0x085AB3DC
_0813EEEC: .4byte 0x02022AE0
_0813EEF0: .4byte 0x03005B60
_0813EEF4: .4byte 0x085ABBC9
_0813EEF8: .4byte 0x02023FD6
_0813EEFC:
	ldr r0, _0813EF88
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0813EF24
	ldr r4, _0813EF8C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0813EF24
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4, #1]
	bl BattleDestroyYesNoCursorAt
	movs r0, #0
	strb r0, [r4, #1]
	bl BattleCreateYesNoCursorAt
_0813EF24:
	ldr r0, _0813EF88
	ldrh r1, [r0, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813EF4C
	ldr r4, _0813EF8C
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0813EF4C
	movs r0, #5
	bl PlaySE
	ldrb r0, [r4, #1]
	bl BattleDestroyYesNoCursorAt
	movs r0, #1
	strb r0, [r4, #1]
	bl BattleCreateYesNoCursorAt
_0813EF4C:
	ldr r0, _0813EF88
	ldrh r1, [r0, #0x2e]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0813EFBA
	str r2, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	movs r0, #5
	bl PlaySE
	ldr r0, _0813EF8C
	ldrb r2, [r0, #1]
	cmp r2, #0
	beq _0813EF94
	ldr r0, _0813EF90
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	strh r0, [r1, #0x14]
	b _0813EFBA
	.align 2, 0
_0813EF88: .4byte 0x03002360
_0813EF8C: .4byte 0x02023FD6
_0813EF90: .4byte 0x03005B60
_0813EF94:
	ldr r0, _0813EFF0
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x16]
	strh r0, [r1, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0813EFBA
	movs r0, #1
	rsbs r0, r0, #0
	str r2, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0813EFBA:
	ldr r0, _0813EFF4
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0813EFC8
	b _0813F26C
_0813EFC8:
	movs r0, #1
	str r0, [sp]
	movs r0, #0x18
	movs r1, #8
	movs r2, #0x1d
	movs r3, #0xd
	bl HandleBattleWindow
	movs r0, #5
	bl PlaySE
	ldr r1, _0813EFF0
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	strh r1, [r0, #0x14]
	b _0813F26C
	.align 2, 0
_0813EFF0: .4byte 0x03005B60
_0813EFF4: .4byte 0x03002360
_0813EFF8:
	ldr r0, _0813F038
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813F006
	b _0813F26C
_0813F006:
	bl FreeAllWindowBuffers
	ldr r0, _0813F03C
	ldr r1, _0813F040
	mov r3, r8
	adds r5, r3, r7
	lsls r5, r5, #3
	adds r5, r5, r1
	ldrb r1, [r5, #0x1c]
	ldr r2, _0813F044
	ldrb r2, [r2]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _0813F048
	ldr r4, _0813F04C
	ldrh r4, [r4]
	str r4, [sp]
	bl ShowSelectMovePokemonSummaryScreen
	ldrh r0, [r5, #0x14]
	adds r0, #1
	strh r0, [r5, #0x14]
	b _0813F26C
	.align 2, 0
_0813F038: .4byte 0x02037C74
_0813F03C: .4byte 0x02024190
_0813F040: .4byte 0x03005B60
_0813F044: .4byte 0x0202418D
_0813F048: .4byte 0x0813DE81
_0813F04C: .4byte 0x02024186
_0813F050:
	ldr r0, _0813F084
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813F05E
	b _0813F26C
_0813F05E:
	ldr r1, [r6, #4]
	ldr r0, _0813F088
	cmp r1, r0
	beq _0813F068
	b _0813F26C
_0813F068:
	bl sub_081C14C8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	bne _0813F090
	ldr r0, _0813F08C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xa
	b _0813F26A
	.align 2, 0
_0813F084: .4byte 0x02037C74
_0813F088: .4byte 0x0813E4A9
_0813F08C: .4byte 0x03005B60
_0813F090:
	adds r1, r6, #0
	adds r1, #0xd
	mov r0, sb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl IsHMMove2
	cmp r0, #0
	beq _0813F0DC
	ldr r0, _0813F0CC
	ldr r3, _0813F0D0
	adds r0, r0, r3
	ldr r0, [r0]
	bl TryGetStatusString
	ldr r0, _0813F0D4
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0813F0D8
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xc
	strh r1, [r0, #0x14]
	b _0813F26C
	.align 2, 0
_0813F0CC: .4byte 0x085AB3DC
_0813F0D0: .4byte 0x000004CC
_0813F0D4: .4byte 0x02022AE0
_0813F0D8: .4byte 0x03005B60
_0813F0DC:
	ldr r1, _0813F118
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #2
	strb r0, [r1, #1]
	strb r4, [r1, #2]
	lsrs r0, r4, #8
	strb r0, [r1, #3]
	movs r0, #0xff
	strb r0, [r1, #4]
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	mov r0, sb
	adds r1, r4, #0
	bl RemoveMonPPBonus
	ldr r0, _0813F11C
	ldrh r1, [r0]
	mov r0, sb
	adds r2, r4, #0
	bl SetMonMoveSlot
	ldr r0, _0813F120
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813F26A
	.align 2, 0
_0813F118: .4byte 0x02022C1C
_0813F11C: .4byte 0x02024186
_0813F120: .4byte 0x03005B60
_0813F124:
	ldr r0, _0813F14C
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl TryGetStatusString
	ldr r0, _0813F150
	movs r1, #0
	bl sub_0814FA04
	ldr r0, _0813F154
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813F26A
	.align 2, 0
_0813F14C: .4byte 0x085AB3DC
_0813F150: .4byte 0x02022AE0
_0813F154: .4byte 0x03005B60
_0813F158:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F166
	b _0813F26C
_0813F166:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813F172
	b _0813F26C
_0813F172:
	ldr r0, _0813F194
	ldr r0, [r0, #0x1c]
	bl TryGetStatusString
	ldr r0, _0813F198
	movs r1, #0
	bl sub_0814FA04
	ldr r0, _0813F19C
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813F26A
	.align 2, 0
_0813F194: .4byte 0x085AB3DC
_0813F198: .4byte 0x02022AE0
_0813F19C: .4byte 0x03005B60
_0813F1A0:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0813F26C
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813F26C
	ldr r0, _0813F1DC
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl TryGetStatusString
	ldr r0, _0813F1E0
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0813F1E4
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x14
	strh r1, [r0, #8]
	b _0813F26C
	.align 2, 0
_0813F1DC: .4byte 0x085AB3DC
_0813F1E0: .4byte 0x02022AE0
_0813F1E4: .4byte 0x03005B60
_0813F1E8:
	ldr r0, _0813F210
	ldr r0, [r0, #0x20]
	bl TryGetStatusString
	ldr r0, _0813F214
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0813F218
	mov r3, r8
	adds r0, r3, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0xb
	strh r1, [r0, #0x16]
	strh r2, [r0, #0x18]
	movs r1, #3
	strh r1, [r0, #0x14]
	b _0813F26C
	.align 2, 0
_0813F210: .4byte 0x085AB3DC
_0813F214: .4byte 0x02022AE0
_0813F218: .4byte 0x03005B60
_0813F21C:
	ldr r0, _0813F23C
	ldr r0, [r0, #0x24]
	bl TryGetStatusString
	ldr r0, _0813F240
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _0813F244
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
_0813F236:
	movs r1, #0xf
	strh r1, [r0, #8]
	b _0813F26C
	.align 2, 0
_0813F23C: .4byte 0x085AB3DC
_0813F240: .4byte 0x02022AE0
_0813F244: .4byte 0x03005B60
_0813F248:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0813F26C
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813F26C
	ldr r0, _0813F27C
	mov r3, r8
	adds r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
_0813F26A:
	strh r0, [r1, #0x14]
_0813F26C:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F27C: .4byte 0x03005B60
	thumb_func_end Task_EvolutionScene

	thumb_func_start Task_TradeEvolutionScene
Task_TradeEvolutionScene: @ 0x0813F280
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, _0813F2C0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r1, #0x1c
	ldrsh r2, [r0, r1]
	movs r1, #0x64
	muls r2, r1, r2
	ldr r1, _0813F2C4
	adds r2, r2, r1
	mov sb, r2
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r5, r3, #0
	cmp r0, #0x14
	bls _0813F2B4
	bl _0813FD8C
_0813F2B4:
	lsls r0, r0, #2
	ldr r1, _0813F2C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813F2C0: .4byte 0x03005B60
_0813F2C4: .4byte 0x02024190
_0813F2C8: .4byte 0x0813F2CC
_0813F2CC: @ jump table
	.4byte _0813F320 @ case 0
	.4byte _0813F34C @ case 1
	.4byte _0813F374 @ case 2
	.4byte _0813F3A4 @ case 3
	.4byte _0813F3DC @ case 4
	.4byte _0813F448 @ case 5
	.4byte _0813F488 @ case 6
	.4byte _0813F4B8 @ case 7
	.4byte _0813F4F4 @ case 8
	.4byte _0813F510 @ case 9
	.4byte _0813F53C @ case 10
	.4byte _0813F560 @ case 11
	.4byte _0813F5A0 @ case 12
	.4byte _0813F62C @ case 13
	.4byte _0813F6E0 @ case 14
	.4byte _0813F724 @ case 15
	.4byte _0813F78C @ case 16
	.4byte _0813F7C0 @ case 17
	.4byte _0813F804 @ case 18
	.4byte _0813F860 @ case 19
	.4byte _0813F8A0 @ case 20
_0813F320:
	ldr r4, _0813F340
	ldr r1, _0813F344
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r1, _0813F348
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	b _0813F770
	.align 2, 0
_0813F340: .4byte 0x02021C7C
_0813F344: .4byte 0x085ABAFC
_0813F348: .4byte 0x03005B60
_0813F34C:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F35C
	bl _0813FD8C
_0813F35C:
	ldr r0, _0813F370
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0xa]
	movs r1, #0
	bl PlayCry1
	b _0813F7AE
	.align 2, 0
_0813F370: .4byte 0x03005B60
_0813F374:
	bl IsCryFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813F382
	bl _0813FD8C
_0813F382:
	ldr r0, _0813F39C
	bl m4aSongNumStop
	movs r0, #0xbc
	lsls r0, r0, #1
	bl PlaySE
	ldr r1, _0813F3A0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	b _0813F770
	.align 2, 0
_0813F39C: .4byte 0x00000179
_0813F3A0: .4byte 0x03005B60
_0813F3A4:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0813F3B4
	bl _0813FD8C
_0813F3B4:
	ldr r0, _0813F3D4
	bl PlayBGM
	ldr r1, _0813F3D8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	str r5, [sp]
	movs r0, #0x1c
	movs r1, #4
	b _0813FA90
	.align 2, 0
_0813F3D4: .4byte 0x00000179
_0813F3D8: .4byte 0x03005B60
_0813F3DC:
	ldr r0, _0813F430
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813F3EC
	bl _0813FD8C
_0813F3EC:
	movs r0, #1
	bl InitMovingBackgroundTask
	ldr r2, _0813F434
	ldr r0, _0813F438
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #5]
	lsrs r0, r0, #4
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r6, #0
	bl LaunchTask_PreEvoSparklesSet1
	ldr r1, _0813F43C
	strb r0, [r1, #2]
	ldr r1, _0813F440
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	ldr r1, _0813F444
	movs r0, #0xe
	bl SetGpuReg
	bl _0813FD8C
	.align 2, 0
_0813F430: .4byte 0x02037C74
_0813F434: .4byte 0x020205AC
_0813F438: .4byte 0x0203A84C
_0813F43C: .4byte 0x02023FD6
_0813F440: .4byte 0x03005B60
_0813F444: .4byte 0x00000603
_0813F448:
	ldr r4, _0813F480
	ldrb r0, [r4, #2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0813F45E
	bl _0813FD8C
_0813F45E:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	ldr r0, _0813F484
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #3]
	bl LaunchTask_PostEvoSparklesSet1
	strb r0, [r4, #2]
	bl _0813FD8C
	.align 2, 0
_0813F480: .4byte 0x02023FD6
_0813F484: .4byte 0x0203A84C
_0813F488:
	ldr r4, _0813F4B0
	ldrb r0, [r4, #2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0813F49E
	bl _0813FD8C
_0813F49E:
	ldr r0, _0813F4B4
	ldr r1, [r0]
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl sub_0817C260
	strb r0, [r4, #2]
	b _0813F768
	.align 2, 0
_0813F4B0: .4byte 0x02023FD6
_0813F4B4: .4byte 0x0203A84C
_0813F4B8:
	ldr r2, _0813F4EC
	ldr r1, [r2]
	ldrb r0, [r1, #3]
	subs r0, #1
	strb r0, [r1, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813F4CC
	bl _0813FD8C
_0813F4CC:
	ldr r1, [r2]
	movs r0, #3
	strb r0, [r1, #3]
	ldr r0, _0813F4F0
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0813F4E8
	bl _0813FD8C
_0813F4E8:
	b _0813F768
	.align 2, 0
_0813F4EC: .4byte 0x0203A84C
_0813F4F0: .4byte 0x02023FD6
_0813F4F4:
	bl LaunchTask_PreEvoSparklesSet2
	ldr r1, _0813F508
	strb r0, [r1, #2]
	ldr r1, _0813F50C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	b _0813F770
	.align 2, 0
_0813F508: .4byte 0x02023FD6
_0813F50C: .4byte 0x03005B60
_0813F510:
	ldr r6, _0813F538
	ldrb r0, [r6, #2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _0813F526
	bl _0813FD8C
_0813F526:
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r5
	ldrh r0, [r4, #0xc]
	bl LaunchTask_PostEvoSparklesSet2AndFlash_Trade
	strb r0, [r6, #2]
	b _0813F7AE
	.align 2, 0
_0813F538: .4byte 0x02023FD6
_0813F53C:
	ldr r0, _0813F55C
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0813F552
	bl _0813FD8C
_0813F552:
	movs r0, #0x21
	bl PlaySE
	b _0813F768
	.align 2, 0
_0813F55C: .4byte 0x02023FD6
_0813F560:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813F56E
	bl _0813FD8C
_0813F56E:
	ldr r5, _0813F594
	ldr r0, [r5]
	ldrb r0, [r0, #1]
	ldr r1, _0813F598
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrh r1, [r4, #0xc]
	bl EvoScene_DoMonAnimation
	ldr r0, _0813F59C
	ldr r1, [r5]
	adds r1, #4
	movs r2, #0x60
	bl memcpy
	b _0813F7AE
	.align 2, 0
_0813F594: .4byte 0x0203A84C
_0813F598: .4byte 0x03005B60
_0813F59C: .4byte 0x020373F4
_0813F5A0:
	bl IsCryFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813F5AE
	bl _0813FD8C
_0813F5AE:
	ldr r4, _0813F61C
	ldr r1, _0813F620
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r0, _0813F624
	bl PlayFanfare
	ldr r2, _0813F628
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	adds r2, r2, r1
	adds r2, #0xc
	mov r0, sb
	movs r1, #0xb
	bl SetMonData
	mov r0, sb
	bl CalculateMonStats
	ldrh r1, [r4, #0xa]
	ldrh r2, [r4, #0xc]
	mov r0, sb
	bl sub_0806D23C
	ldrh r0, [r4, #0xc]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	bl GetSetPokedexFlag
	ldrh r0, [r4, #0xc]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl GetSetPokedexFlag
	movs r0, #0xe
	bl IncrementGameStat
	b _0813FD8C
	.align 2, 0
_0813F61C: .4byte 0x02021C7C
_0813F620: .4byte 0x085ABB0F
_0813F624: .4byte 0x00000173
_0813F628: .4byte 0x03005B60
_0813F62C:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F63A
	b _0813FD8C
_0813F63A:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0813F648
	b _0813FD8C
_0813F648:
	ldr r1, _0813F698
	lsls r4, r7, #2
	adds r0, r4, r7
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrb r1, [r5, #0x10]
	mov r0, sb
	bl MonTryLearningNewMove
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r8, r4
	cmp r6, #0
	beq _0813F6B8
	movs r0, #0x1a
	ldrsh r2, [r5, r0]
	cmp r2, #0
	bne _0813F6B8
	ldrh r1, [r5, #0xe]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r5, #0xe]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0x14]
	mov r0, sb
	movs r1, #2
	add r2, sp, #0xc
	bl GetMonData
	ldr r0, _0813F69C
	add r1, sp, #0xc
	bl StringCopy10
	ldr r0, _0813F6A0
	cmp r6, r0
	bne _0813F6A4
	movs r0, #0x14
	strh r0, [r5, #8]
	b _0813FD8C
	.align 2, 0
_0813F698: .4byte 0x03005B60
_0813F69C: .4byte 0x02022C0C
_0813F6A0: .4byte 0x0000FFFF
_0813F6A4:
	ldr r0, _0813F6B4
	cmp r6, r0
	bne _0813F6AC
	b _0813FD8C
_0813F6AC:
	movs r0, #0x12
	strh r0, [r5, #8]
	b _0813FD8C
	.align 2, 0
_0813F6B4: .4byte 0x0000FFFE
_0813F6B8:
	ldr r0, _0813F6D4
	bl PlayBGM
	ldr r1, _0813F6D8
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r0, _0813F6DC
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0813F848
	.align 2, 0
_0813F6D4: .4byte 0x00000179
_0813F6D8: .4byte 0x08595430
_0813F6DC: .4byte 0x03005B60
_0813F6E0:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0813F6F0
	b _0813FD8C
_0813F6F0:
	adds r0, r7, #0
	bl DestroyTask
	ldr r4, _0813F718
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r2, _0813F71C
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0813F720
	ldr r0, [r0]
	bl SetMainCallback2
	b _0813FD8C
	.align 2, 0
_0813F718: .4byte 0x0203A84C
_0813F71C: .4byte 0x030030B4
_0813F720: .4byte 0x03005F28
_0813F724:
	ldr r0, _0813F778
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0813F738
	b _0813FD8C
_0813F738:
	bl m4aMPlayAllStop
	ldr r2, _0813F77C
	ldr r0, _0813F780
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	ldr r1, _0813F784
	orrs r0, r1
	ldr r1, _0813F788
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_0813F768:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r5
_0813F770:
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _0813FD8C
	.align 2, 0
_0813F778: .4byte 0x02023FD6
_0813F77C: .4byte 0x020205AC
_0813F780: .4byte 0x0203A84C
_0813F784: .4byte 0x0004001C
_0813F788: .4byte 0x00007FFF
_0813F78C:
	ldr r0, _0813F7B8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813F79A
	b _0813FD8C
_0813F79A:
	ldr r0, _0813F7BC
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r5
	ldrh r1, [r4, #0xa]
	bl EvoScene_DoMonAnimation
_0813F7AE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0813FD8C
	.align 2, 0
_0813F7B8: .4byte 0x02037C74
_0813F7BC: .4byte 0x0203A84C
_0813F7C0:
	ldr r0, _0813F7F4
	ldr r0, [r0]
	ldrb r0, [r0]
	bl EvoScene_IsMonAnimFinished
	cmp r0, #0
	bne _0813F7D0
	b _0813FD8C
_0813F7D0:
	ldr r4, _0813F7F8
	ldr r1, _0813F7FC
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r1, _0813F800
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #0x1a]
	b _0813FD54
	.align 2, 0
_0813F7F4: .4byte 0x0203A84C
_0813F7F8: .4byte 0x02021C7C
_0813F7FC: .4byte 0x085ABB3E
_0813F800: .4byte 0x03005B60
_0813F804:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F812
	b _0813FD8C
_0813F812:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813F81E
	b _0813FD8C
_0813F81E:
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r0, _0813F850
	bl PlayFanfare
	ldr r0, _0813F854
	ldr r0, [r0, #0xc]
	bl TryGetStatusString
	ldr r1, _0813F858
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r0, _0813F85C
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x40
	strh r0, [r1, #0x10]
_0813F848:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0813FD8C
	.align 2, 0
_0813F850: .4byte 0x0000016F
_0813F854: .4byte 0x085AB3DC
_0813F858: .4byte 0x02022AE0
_0813F85C: .4byte 0x03005B60
_0813F860:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F86E
	b _0813FD8C
_0813F86E:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0813F87C
	b _0813FD8C
_0813F87C:
	ldr r0, _0813F89C
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x10]
	subs r0, #1
	strh r0, [r1, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F894
	b _0813FD8C
_0813F894:
	movs r0, #0xd
	strh r0, [r1, #8]
	b _0813FD8C
	.align 2, 0
_0813F89C: .4byte 0x03005B60
_0813F8A0:
	lsls r1, r7, #2
	adds r0, r1, r7
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #0x14
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, #0xb
	bls _0813F8B4
	b _0813FD8C
_0813F8B4:
	lsls r0, r0, #2
	ldr r1, _0813F8C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813F8C0: .4byte 0x0813F8C4
_0813F8C4: @ jump table
	.4byte _0813F8F4 @ case 0
	.4byte _0813F940 @ case 1
	.4byte _0813F988 @ case 2
	.4byte _0813F9C8 @ case 3
	.4byte _0813FA34 @ case 4
	.4byte _0813FAEC @ case 5
	.4byte _0813FB70 @ case 6
	.4byte _0813FC6C @ case 7
	.4byte _0813FCB4 @ case 8
	.4byte _0813FD00 @ case 9
	.4byte _0813FD38 @ case 10
	.4byte _0813FD68 @ case 11
_0813F8F4:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F902
	b _0813FD8C
_0813F902:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813F90E
	b _0813FD8C
_0813F90E:
	bl BufferMoveToLearnIntoBattleTextBuff2
	ldr r0, _0813F934
	ldr r0, [r0, #0x10]
	bl TryGetStatusString
	ldr r1, _0813F938
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r0, _0813F93C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813FD8A
	.align 2, 0
_0813F934: .4byte 0x085AB3DC
_0813F938: .4byte 0x02022AE0
_0813F93C: .4byte 0x03005B60
_0813F940:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F94E
	b _0813FD8C
_0813F94E:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813F95A
	b _0813FD8C
_0813F95A:
	ldr r0, _0813F97C
	ldr r0, [r0, #0x14]
	bl TryGetStatusString
	ldr r1, _0813F980
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r0, _0813F984
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813FD8A
	.align 2, 0
_0813F97C: .4byte 0x085AB3DC
_0813F980: .4byte 0x02022AE0
_0813F984: .4byte 0x03005B60
_0813F988:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0813F9C8
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813F9C8
	ldr r0, _0813FA20
	ldr r0, [r0, #0x18]
	bl TryGetStatusString
	ldr r1, _0813FA24
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r0, _0813FA28
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	strh r0, [r1, #0x16]
	movs r0, #9
	strh r0, [r1, #0x18]
	ldrh r0, [r1, #0x14]
	adds r0, #1
	strh r0, [r1, #0x14]
_0813F9C8:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813F9D6
	b _0813FD8C
_0813F9D6:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0813F9E4
	b _0813FD8C
_0813F9E4:
	movs r0, #0
	movs r1, #0xa8
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	ldr r0, _0813FA2C
	movs r1, #0xa8
	str r1, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl sub_08198C08
	ldr r3, _0813FA30
	strb r4, [r3, #1]
	ldr r0, _0813FA28
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	movs r2, #0
	strh r0, [r1, #0x14]
	strb r2, [r3, #1]
	b _0813FD8C
	.align 2, 0
_0813FA20: .4byte 0x085AB3DC
_0813FA24: .4byte 0x02022AE0
_0813FA28: .4byte 0x03005B60
_0813FA2C: .4byte 0x0830D28C
_0813FA30: .4byte 0x02023FD6
_0813FA34:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	beq _0813FA54
	cmp r6, #0
	bgt _0813FA4E
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	beq _0813FAAC
	b _0813FD8C
_0813FA4E:
	cmp r6, #1
	beq _0813FAAC
	b _0813FD8C
_0813FA54:
	ldr r0, _0813FA9C
	strb r6, [r0, #1]
	ldr r0, _0813FAA0
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r0, [r0]
	bl TryGetStatusString
	ldr r1, _0813FAA4
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r1, _0813FAA8
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x16]
	strh r1, [r0, #0x14]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	beq _0813FA88
	b _0813FD8C
_0813FA88:
	movs r0, #1
	rsbs r0, r0, #0
	str r6, [sp]
	movs r1, #0
_0813FA90:
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _0813FD8C
	.align 2, 0
_0813FA9C: .4byte 0x02023FD6
_0813FAA0: .4byte 0x085AB3DC
_0813FAA4: .4byte 0x02022AE0
_0813FAA8: .4byte 0x03005B60
_0813FAAC:
	ldr r1, _0813FADC
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, _0813FAE0
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r0, [r0]
	bl TryGetStatusString
	ldr r1, _0813FAE4
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r1, _0813FAE8
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	strh r1, [r0, #0x14]
	b _0813FD8C
	.align 2, 0
_0813FADC: .4byte 0x02023FD6
_0813FAE0: .4byte 0x085AB3DC
_0813FAE4: .4byte 0x02022AE0
_0813FAE8: .4byte 0x03005B60
_0813FAEC:
	ldr r0, _0813FB54
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813FAFA
	b _0813FD8C
_0813FAFA:
	ldr r0, _0813FB58
	ldrb r0, [r0]
	cmp r0, #0
	beq _0813FB06
	bl DestroyWirelessStatusIndicatorSprite
_0813FB06:
	movs r0, #3
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #0
	bl GetBgTilemapBuffer
	bl Free
	bl FreeAllWindowBuffers
	ldr r0, _0813FB5C
	ldr r1, _0813FB60
	mov r2, r8
	adds r5, r2, r7
	lsls r5, r5, #3
	adds r5, r5, r1
	ldrb r1, [r5, #0x1c]
	ldr r2, _0813FB64
	ldrb r2, [r2]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _0813FB68
	ldr r4, _0813FB6C
	ldrh r4, [r4]
	str r4, [sp]
	bl ShowSelectMovePokemonSummaryScreen
	ldrh r0, [r5, #0x14]
	adds r0, #1
	strh r0, [r5, #0x14]
	b _0813FD8C
	.align 2, 0
_0813FB54: .4byte 0x02037C74
_0813FB58: .4byte 0x0300319C
_0813FB5C: .4byte 0x02024190
_0813FB60: .4byte 0x03005B60
_0813FB64: .4byte 0x0202418D
_0813FB68: .4byte 0x0813E075
_0813FB6C: .4byte 0x02024186
_0813FB70:
	ldr r0, _0813FBA4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0813FB7E
	b _0813FD8C
_0813FB7E:
	ldr r0, _0813FBA8
	ldr r1, [r0, #4]
	ldr r0, _0813FBAC
	cmp r1, r0
	beq _0813FB8A
	b _0813FD8C
_0813FB8A:
	bl sub_081C14C8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	bne _0813FBB4
	ldr r0, _0813FBB0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #9
	b _0813FD8A
	.align 2, 0
_0813FBA4: .4byte 0x02037C74
_0813FBA8: .4byte 0x03002360
_0813FBAC: .4byte 0x0813E4C5
_0813FBB0: .4byte 0x03005B60
_0813FBB4:
	adds r1, r6, #0
	adds r1, #0xd
	mov r0, sb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl IsHMMove2
	cmp r0, #0
	beq _0813FC04
	ldr r0, _0813FBF4
	ldr r1, _0813FBF8
	adds r0, r0, r1
	ldr r0, [r0]
	bl TryGetStatusString
	ldr r1, _0813FBFC
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r1, _0813FC00
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xb
	strh r1, [r0, #0x14]
	b _0813FD8C
	.align 2, 0
_0813FBF4: .4byte 0x085AB3DC
_0813FBF8: .4byte 0x000004CC
_0813FBFC: .4byte 0x02022AE0
_0813FC00: .4byte 0x03005B60
_0813FC04:
	ldr r1, _0813FC58
	movs r0, #0xfd
	strb r0, [r1]
	movs r0, #2
	strb r0, [r1, #1]
	strb r4, [r1, #2]
	lsrs r0, r4, #8
	strb r0, [r1, #3]
	movs r0, #0xff
	strb r0, [r1, #4]
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	mov r0, sb
	adds r1, r4, #0
	bl RemoveMonPPBonus
	ldr r0, _0813FC5C
	ldrh r1, [r0]
	mov r0, sb
	adds r2, r4, #0
	bl SetMonMoveSlot
	ldr r0, _0813FC60
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl TryGetStatusString
	ldr r1, _0813FC64
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r0, _0813FC68
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813FD8A
	.align 2, 0
_0813FC58: .4byte 0x02022C1C
_0813FC5C: .4byte 0x02024186
_0813FC60: .4byte 0x085AB3DC
_0813FC64: .4byte 0x02022AE0
_0813FC68: .4byte 0x03005B60
_0813FC6C:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0813FC7A
	b _0813FD8C
_0813FC7A:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813FC86
	b _0813FD8C
_0813FC86:
	ldr r0, _0813FCA8
	ldr r0, [r0, #0x1c]
	bl TryGetStatusString
	ldr r1, _0813FCAC
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r0, _0813FCB0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	adds r0, #1
	b _0813FD8A
	.align 2, 0
_0813FCA8: .4byte 0x085AB3DC
_0813FCAC: .4byte 0x02022AE0
_0813FCB0: .4byte 0x03005B60
_0813FCB4:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0813FD8C
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813FD8C
	ldr r0, _0813FCF4
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl TryGetStatusString
	ldr r1, _0813FCF8
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r1, _0813FCFC
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x12
	strh r1, [r0, #8]
	b _0813FD8C
	.align 2, 0
_0813FCF4: .4byte 0x085AB3DC
_0813FCF8: .4byte 0x02022AE0
_0813FCFC: .4byte 0x03005B60
_0813FD00:
	ldr r0, _0813FD2C
	ldr r0, [r0, #0x20]
	bl TryGetStatusString
	ldr r1, _0813FD30
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r1, _0813FD34
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0xa
	strh r1, [r0, #0x16]
	strh r2, [r0, #0x18]
	movs r1, #3
	strh r1, [r0, #0x14]
	b _0813FD8C
	.align 2, 0
_0813FD2C: .4byte 0x085AB3DC
_0813FD30: .4byte 0x02022AE0
_0813FD34: .4byte 0x03005B60
_0813FD38:
	ldr r0, _0813FD5C
	ldr r0, [r0, #0x24]
	bl TryGetStatusString
	ldr r1, _0813FD60
	movs r0, #0
	movs r2, #1
	bl sub_0807EBE0
	ldr r1, _0813FD64
	mov r2, r8
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r0, r0, r1
_0813FD54:
	movs r1, #0xd
	strh r1, [r0, #8]
	b _0813FD8C
	.align 2, 0
_0813FD5C: .4byte 0x085AB3DC
_0813FD60: .4byte 0x02022AE0
_0813FD64: .4byte 0x03005B60
_0813FD68:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0813FD8C
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813FD8C
	ldr r0, _0813FD9C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
_0813FD8A:
	strh r0, [r1, #0x14]
_0813FD8C:
	add sp, #0x20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813FD9C: .4byte 0x03005B60
	thumb_func_end Task_TradeEvolutionScene

	thumb_func_start EvoDummyFunc
EvoDummyFunc: @ 0x0813FDA0
	bx lr
	.align 2, 0
	thumb_func_end EvoDummyFunc

	thumb_func_start VBlankCB_EvolutionScene
VBlankCB_EvolutionScene: @ 0x0813FDA4
	push {lr}
	ldr r0, _0813FE0C
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, _0813FE10
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r0, _0813FE14
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, _0813FE18
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, _0813FE1C
	ldrh r1, [r0]
	movs r0, #0x18
	bl SetGpuReg
	ldr r0, _0813FE20
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, _0813FE24
	ldrh r1, [r0]
	movs r0, #0x1c
	bl SetGpuReg
	ldr r0, _0813FE28
	ldrh r1, [r0]
	movs r0, #0x1e
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0813FE0C: .4byte 0x02022AC8
_0813FE10: .4byte 0x02022ACA
_0813FE14: .4byte 0x02022ACC
_0813FE18: .4byte 0x02022ACE
_0813FE1C: .4byte 0x02022AD0
_0813FE20: .4byte 0x02022AD2
_0813FE24: .4byte 0x02022AD4
_0813FE28: .4byte 0x02022AD6
	thumb_func_end VBlankCB_EvolutionScene

	thumb_func_start VBlankCB_TradeEvolutionScene
VBlankCB_TradeEvolutionScene: @ 0x0813FE2C
	push {lr}
	ldr r0, _0813FE94
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, _0813FE98
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r0, _0813FE9C
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, _0813FEA0
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, _0813FEA4
	ldrh r1, [r0]
	movs r0, #0x18
	bl SetGpuReg
	ldr r0, _0813FEA8
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, _0813FEAC
	ldrh r1, [r0]
	movs r0, #0x1c
	bl SetGpuReg
	ldr r0, _0813FEB0
	ldrh r1, [r0]
	movs r0, #0x1e
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_0813FE94: .4byte 0x02022AC8
_0813FE98: .4byte 0x02022ACA
_0813FE9C: .4byte 0x02022ACC
_0813FEA0: .4byte 0x02022ACE
_0813FEA4: .4byte 0x02022AD0
_0813FEA8: .4byte 0x02022AD2
_0813FEAC: .4byte 0x02022AD4
_0813FEB0: .4byte 0x02022AD6
	thumb_func_end VBlankCB_TradeEvolutionScene

	thumb_func_start sub_0813FEB4
sub_0813FEB4: @ 0x0813FEB4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0813FF34
	adds r4, r0, r1
	movs r0, #0xc
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _0813FF62
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _0813FF62
	ldrh r1, [r4]
	adds r0, r1, #1
	strh r0, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _0813FF38
	movs r2, #4
	ldrsh r0, [r4, r2]
	lsls r2, r0, #2
	adds r0, r3, #3
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r1, r0
	ble _0813FF54
	adds r0, r3, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r2, #2
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0813FF3C
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
	movs r0, #6
	ldrsh r2, [r4, r0]
	movs r1, #4
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r1, r3, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	bne _0813FF26
	strh r5, [r4, #6]
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
_0813FF26:
	movs r2, #4
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	b _0813FF52
	.align 2, 0
_0813FF34: .4byte 0x03005B68
_0813FF38: .4byte 0x08595475
_0813FF3C:
	ldr r0, _0813FF68
	lsls r1, r1, #5
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xa0
	movs r2, #0x20
	bl LoadPalette
	strh r5, [r4]
	ldrh r0, [r4, #2]
	adds r0, #1
_0813FF52:
	strh r0, [r4, #2]
_0813FF54:
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _0813FF62
	adds r0, r6, #0
	bl DestroyTask
_0813FF62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FF68: .4byte 0x0203A850
	thumb_func_end sub_0813FEB4

	thumb_func_start sub_0813FF6C
sub_0813FF6C: @ 0x0813FF6C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0813FF90
	movs r1, #7
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r4, #0
	bne _0813FF98
	ldr r1, _0813FF94
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #0xc]
	b _0813FFA6
	.align 2, 0
_0813FF90: .4byte 0x0813FFB1
_0813FF94: .4byte 0x03005B60
_0813FF98:
	ldr r0, _0813FFAC
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0xc]
_0813FFA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813FFAC: .4byte 0x03005B60
	thumb_func_end sub_0813FF6C

	thumb_func_start sub_0813FFB0
sub_0813FFB0: @ 0x0813FFB0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0813FFDC
	mov r8, r0
	ldr r1, _0813FFE0
	mov sb, r1
	ldr r1, _0813FFE4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0813FFF0
	ldr r7, _0813FFE8
	ldr r6, _0813FFEC
	b _0813FFF4
	.align 2, 0
_0813FFDC: .4byte 0x02022ACC
_0813FFE0: .4byte 0x02022ACE
_0813FFE4: .4byte 0x03005B60
_0813FFE8: .4byte 0x02022AD0
_0813FFEC: .4byte 0x02022AD2
_0813FFF0:
	ldr r7, _0814007C
	ldr r6, _08140080
_0813FFF4:
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrh r0, [r4, #8]
	adds r0, #5
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #8]
	adds r0, #0x80
	ands r0, r1
	strh r0, [r4, #0xa]
	movs r1, #8
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl Cos
	adds r0, #8
	mov r2, r8
	strh r0, [r2]
	movs r1, #8
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl Sin
	adds r0, #0x10
	mov r2, sb
	strh r0, [r2]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r1, #4
	bl Cos
	adds r0, #8
	strh r0, [r7]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	movs r1, #4
	bl Sin
	adds r0, #0x10
	strh r0, [r6]
	ldr r0, _08140084
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0814006E
	adds r0, r5, #0
	bl DestroyTask
	mov r0, r8
	strh r4, [r0]
	mov r1, sb
	strh r4, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r7]
	strh r4, [r6]
_0814006E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814007C: .4byte 0x02022AD4
_08140080: .4byte 0x02022AD6
_08140084: .4byte 0x0813FEB5
	thumb_func_end sub_0813FFB0

	thumb_func_start InitMovingBgValues
InitMovingBgValues: @ 0x08140088
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r1, #0
	ldr r5, _081400C0
	ldr r7, _081400C4
_08140092:
	lsls r0, r1, #4
	adds r4, r1, #1
	adds r2, r0, r7
	lsls r0, r1, #5
	adds r1, r0, r6
	movs r3, #0xf
_0814009E:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	adds r2, #1
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _0814009E
	adds r1, r4, #0
	cmp r1, #0x31
	ble _08140092
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081400C0: .4byte 0x085953F0
_081400C4: .4byte 0x08595485
	thumb_func_end InitMovingBgValues

	thumb_func_start InitMovingBackgroundTask
InitMovingBackgroundTask: @ 0x081400C8
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081400EC
	movs r0, #0xc8
	lsls r0, r0, #3
	bl AllocZeroed
	str r0, [r4]
	bl InitMovingBgValues
	cmp r5, #0
	bne _081400F0
	movs r6, #1
	movs r4, #2
	b _081400F4
	.align 2, 0
_081400EC: .4byte 0x0203A850
_081400F0:
	movs r6, #1
	movs r4, #3
_081400F4:
	ldr r0, _08140174
	movs r1, #0xa0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _08140178
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _0814017C
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _08140180
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	adds r0, r4, #0
	bl CopyBgTilemapBufferToVram
	cmp r5, #0
	bne _0814018C
	ldr r1, _08140184
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _08140188
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xba
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	adds r0, r6, #0
	movs r1, #7
	movs r2, #2
	bl SetBgAttribute
	adds r0, r4, #0
	movs r1, #7
	movs r2, #2
	bl SetBgAttribute
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	b _081401A6
	.align 2, 0
_08140174: .4byte 0x08594D50
_08140178: .4byte 0x08593CA0
_0814017C: .4byte 0x08594398
_08140180: .4byte 0x0859487C
_08140184: .4byte 0x00000442
_08140188: .4byte 0x00000808
_0814018C:
	ldr r1, _081401BC
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _081401C0
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0xda
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
_081401A6:
	ldr r0, _081401C4
	movs r1, #5
	bl CreateTask
	adds r0, r5, #0
	bl sub_0813FF6C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081401BC: .4byte 0x00000842
_081401C0: .4byte 0x00000808
_081401C4: .4byte 0x0813FEB5
	thumb_func_end InitMovingBackgroundTask

	thumb_func_start sub_081401C8
sub_081401C8: @ 0x081401C8
	push {lr}
	ldr r0, _081401F4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _081401E6
	ldr r0, _081401F8
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x14]
_081401E6:
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl FillPalette
	pop {r0}
	bx r0
	.align 2, 0
_081401F4: .4byte 0x0813FEB5
_081401F8: .4byte 0x03005B60
	thumb_func_end sub_081401C8

	thumb_func_start sub_081401FC
sub_081401FC: @ 0x081401FC
	push {lr}
	ldr r0, _08140234
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08140210
	bl DestroyTask
_08140210:
	ldr r0, _08140238
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08140222
	bl DestroyTask
_08140222:
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl FillPalette
	bl sub_0814023C
	pop {r0}
	bx r0
	.align 2, 0
_08140234: .4byte 0x0813FEB5
_08140238: .4byte 0x0813FFB1
	thumb_func_end sub_081401FC

	thumb_func_start sub_0814023C
sub_0814023C: @ 0x0814023C
	push {lr}
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	ldr r0, _08140298
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0814029C
	strh r1, [r0]
	ldr r0, _081402A0
	strh r1, [r0]
	movs r0, #1
	movs r1, #5
	bl sub_08038E94
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #7
	bl SetBgAttribute
	movs r0, #2
	movs r1, #5
	bl sub_08038E94
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #2
	movs r1, #7
	bl SetBgAttribute
	movs r1, #0xca
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _081402A4
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_08140298: .4byte 0x02022ACC
_0814029C: .4byte 0x02022ACE
_081402A0: .4byte 0x02022AD0
_081402A4: .4byte 0x0203A850
	thumb_func_end sub_0814023C

	thumb_func_start EvoScene_DoMonAnimation
EvoScene_DoMonAnimation: @ 0x081402A8
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _081402CC
	adds r0, r0, r2
	movs r2, #0
	movs r3, #0
	bl DoMonFrontSpriteAnimation
	pop {r0}
	bx r0
	.align 2, 0
_081402CC: .4byte 0x020205AC
	thumb_func_end EvoScene_DoMonAnimation

	thumb_func_start EvoScene_IsMonAnimFinished
EvoScene_IsMonAnimFinished: @ 0x081402D0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081402F0
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, #0x1c
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r0, _081402F4
	cmp r1, r0
	beq _081402F8
	movs r0, #0
	b _081402FA
	.align 2, 0
_081402F0: .4byte 0x020205AC
_081402F4: .4byte 0x08007141
_081402F8:
	movs r0, #1
_081402FA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end EvoScene_IsMonAnimFinished

