.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SaveFailedScreenTextPrint
SaveFailedScreenTextPrint: @ 0x08178DFC
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	lsls r3, r3, #0x18
	add r0, sp, #0x14
	movs r2, #0
	strb r2, [r0]
	adds r1, r0, #0
	movs r0, #0xf
	strb r0, [r1, #1]
	movs r0, #3
	strb r0, [r1, #2]
	ldr r0, _08178E44
	ldrb r0, [r0]
	lsls r4, r4, #0x1b
	lsrs r4, r4, #0x18
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r2, [sp]
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08178E44: .4byte 0x0203B9DA
	thumb_func_end SaveFailedScreenTextPrint

	thumb_func_start DoSaveFailedScreen
DoSaveFailedScreen: @ 0x08178E48
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08178E70
	bl SetMainCallback2
	ldr r0, _08178E74
	strh r4, [r0]
	ldr r1, _08178E78
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r0, _08178E7C
	strb r2, [r0]
	strb r2, [r0, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08178E70: .4byte 0x08178E95
_08178E74: .4byte 0x0203B9C8
_08178E78: .4byte 0x0203B9CA
_08178E7C: .4byte 0x0203B9DA
	thumb_func_end DoSaveFailedScreen

	thumb_func_start sub_08178E80
sub_08178E80: @ 0x08178E80
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08178E80

	thumb_func_start CB2_SaveFailedScreen
CB2_SaveFailedScreen: @ 0x08178E94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _081790AC
	movs r1, #0x87
	lsls r1, r1, #3
	adds r7, r0, r1
	ldrb r0, [r7]
	cmp r0, #0
	beq _08178EB0
	cmp r0, #1
	bne _08178EB0
	b _08179114
_08178EB0:
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
	add r1, sp, #4
	movs r0, #0
	strh r0, [r1]
	ldr r2, _081790B0
	str r1, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r2, #4]
	ldr r0, _081790B4
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r3, #0
	mov r8, r3
	str r3, [sp, #8]
	add r4, sp, #8
	str r4, [r2]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r2, #4]
	ldr r0, _081790B8
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	add r0, sp, #4
	mov r3, r8
	strh r3, [r0]
	str r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r2, #4]
	ldr r0, _081790BC
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _081790C0
	bl LZ77UnCompVram
	ldr r0, _081790C4
	ldr r1, _081790C8
	bl LZ77UnCompVram
	ldr r0, _081790CC
	ldr r1, _081790D0
	bl LZ77UnCompVram
	ldr r0, _081790D4
	ldr r1, _081790D8
	bl LZ77UnCompVram
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081790DC
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r5, _081790E0
	movs r0, #0
	adds r1, r5, #0
	bl SetBgTilemapBuffer
	mov r0, r8
	str r0, [sp, #8]
	ldr r2, _081790E4
	adds r0, r4, #0
	adds r1, r5, #0
	bl CpuSet
	ldr r1, _081790E8
	movs r2, #0x90
	lsls r2, r2, #1
	movs r6, #0x85
	lsls r6, r6, #2
	movs r0, #0
	adds r3, r6, #0
	bl LoadBgTiles
	ldr r0, _081790EC
	bl InitWindows
	ldr r0, _081790F0
	bl AddWindowWithoutTileMap
	ldr r4, _081790F4
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r2, r5, r1
	movs r1, #7
	bl SetWindowAttribute
	ldr r0, _081790F8
	bl AddWindowWithoutTileMap
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	movs r3, #0xe8
	lsls r3, r3, #5
	adds r5, r5, r3
	movs r1, #7
	adds r2, r5, #0
	bl SetWindowAttribute
	bl DeactivateAllTextPrinters
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, _081790FC
	movs r1, #0
	movs r2, #0x40
	bl LoadPalette
	ldr r0, _08179100
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08179104
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08179108
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldrb r0, [r4]
	movs r1, #0
	adds r2, r6, #0
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	ldrb r0, [r4, #1]
	movs r1, #0
	adds r2, r6, #0
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	ldrb r0, [r4, #1]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #1]
	movs r1, #2
	bl CopyWindowToVram
	ldrb r0, [r4]
	movs r1, #1
	bl CopyWindowToVram
	ldr r0, _0817910C
	movs r1, #1
	movs r2, #0
	bl SaveFailedScreenTextPrint
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, r8
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _08179110
	bl SetVBlankCallback
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b _0817912A
	.align 2, 0
_081790AC: .4byte 0x03002360
_081790B0: .4byte 0x040000D4
_081790B4: .4byte 0x8100C000
_081790B8: .4byte 0x85000100
_081790BC: .4byte 0x81000200
_081790C0: .4byte 0x0858FC14
_081790C4: .4byte 0x0858F890
_081790C8: .4byte 0x06007000
_081790CC: .4byte 0x0858FA1C
_081790D0: .4byte 0x06007800
_081790D4: .4byte 0x085CD284
_081790D8: .4byte 0x06010020
_081790DC: .4byte 0x085CD228
_081790E0: .4byte 0x0201E000
_081790E4: .4byte 0x05000200
_081790E8: .4byte 0x084E6CE0
_081790EC: .4byte 0x085CD234
_081790F0: .4byte 0x085CD23C
_081790F4: .4byte 0x0203B9DA
_081790F8: .4byte 0x085CD244
_081790FC: .4byte 0x0858F810
_08179100: .4byte 0x085CD264
_08179104: .4byte 0x084E8360
_08179108: .4byte 0x085D7B04
_0817910C: .4byte 0x085CBD6B
_08179110: .4byte 0x08178E81
_08179114:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0817912A
	ldr r0, _08179138
	bl SetMainCallback2
	ldr r0, _0817913C
	bl SetVBlankCallback
_0817912A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08179138: .4byte 0x08179141
_0817913C: .4byte 0x0817930D
	thumb_func_end CB2_SaveFailedScreen

	thumb_func_start CB2_WipeSave
CB2_WipeSave: @ 0x08179140
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _081791B8
	movs r1, #1
	strh r1, [r0]
	ldr r1, _081791BC
	ldr r0, [r1]
	cmp r0, #0
	beq _081791A4
	adds r6, r1, #0
_08179154:
	ldr r0, [r6]
	bl WipeSectors
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08179200
	ldr r4, _081791C0
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _081791C4
	movs r1, #1
	movs r2, #0
	bl SaveFailedScreenTextPrint
	ldr r0, _081791C8
	ldrb r0, [r0]
	bl HandleSavingData
	ldr r0, [r6]
	cmp r0, #0
	beq _08179194
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _081791CC
	movs r1, #1
	movs r2, #0
	bl SaveFailedScreenTextPrint
_08179194:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r6]
	cmp r0, #0
	beq _081791A4
	cmp r5, #2
	bls _08179154
_081791A4:
	cmp r5, #3
	bne _081791D4
	ldr r0, _081791C0
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _081791D0
	b _081791E8
	.align 2, 0
_081791B8: .4byte 0x0203B9CA
_081791BC: .4byte 0x03005F3C
_081791C0: .4byte 0x0203B9DA
_081791C4: .4byte 0x085CBE20
_081791C8: .4byte 0x0203B9C8
_081791CC: .4byte 0x085CBD6B
_081791D0: .4byte 0x085CBDB2
_081791D4:
	ldr r0, _081791F4
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _081791F8
	ldr r0, [r0]
	cmp r0, #0
	bne _08179228
	ldr r0, _081791FC
_081791E8:
	movs r1, #1
	movs r2, #0
	bl SaveFailedScreenTextPrint
	b _08179232
	.align 2, 0
_081791F4: .4byte 0x0203B9DA
_081791F8: .4byte 0x03005F54
_081791FC: .4byte 0x085CBE50
_08179200:
	ldr r0, _0817921C
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _08179220
	movs r1, #1
	movs r2, #0
	bl SaveFailedScreenTextPrint
	ldr r0, _08179224
	bl SetMainCallback2
	b _08179238
	.align 2, 0
_0817921C: .4byte 0x0203B9DA
_08179220: .4byte 0x085CBDB2
_08179224: .4byte 0x08179249
_08179228:
	ldr r0, _08179240
	movs r1, #1
	movs r2, #0
	bl SaveFailedScreenTextPrint
_08179232:
	ldr r0, _08179244
	bl SetMainCallback2
_08179238:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08179240: .4byte 0x085CBE90
_08179244: .4byte 0x08179299
	thumb_func_end CB2_WipeSave

	thumb_func_start CB2_GameplayCannotBeContinued
CB2_GameplayCannotBeContinued: @ 0x08179248
	push {lr}
	ldr r1, _08179280
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08179284
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0817927C
	ldr r0, _08179288
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _0817928C
	movs r1, #1
	movs r2, #0
	bl SaveFailedScreenTextPrint
	ldr r0, _08179290
	bl SetVBlankCallback
	ldr r0, _08179294
	bl SetMainCallback2
_0817927C:
	pop {r0}
	bx r0
	.align 2, 0
_08179280: .4byte 0x0203B9CA
_08179284: .4byte 0x03002360
_08179288: .4byte 0x0203B9DA
_0817928C: .4byte 0x085CBDF7
_08179290: .4byte 0x08178E81
_08179294: .4byte 0x08179299
	thumb_func_end CB2_GameplayCannotBeContinued

	thumb_func_start CB2_FadeAndReturnToTitleScreen
CB2_FadeAndReturnToTitleScreen: @ 0x08179298
	push {lr}
	sub sp, #4
	ldr r0, _081792D0
	movs r2, #0
	strh r2, [r0]
	ldr r0, _081792D4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081792C8
	movs r0, #1
	rsbs r0, r0, #0
	str r2, [sp]
	movs r1, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _081792D8
	bl SetVBlankCallback
	ldr r0, _081792DC
	bl SetMainCallback2
_081792C8:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_081792D0: .4byte 0x0203B9CA
_081792D4: .4byte 0x03002360
_081792D8: .4byte 0x08178E81
_081792DC: .4byte 0x081792E1
	thumb_func_end CB2_FadeAndReturnToTitleScreen

	thumb_func_start CB2_ReturnToTitleScreen
CB2_ReturnToTitleScreen: @ 0x081792E0
	push {r4, r5, lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08179306
	ldr r5, _081792FC
	ldr r0, [r5]
	cmp r0, #0
	bne _08179300
	bl DoSoftReset
	b _08179306
	.align 2, 0
_081792FC: .4byte 0x03005F54
_08179300:
	bl SetMainCallback2
	str r4, [r5]
_08179306:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end CB2_ReturnToTitleScreen

	thumb_func_start VBlankCB_UpdateClockGraphics
VBlankCB_UpdateClockGraphics: @ 0x0817930C
	push {r4, r5, lr}
	ldr r5, _0817937C
	ldr r0, [r5, #0x24]
	lsrs r4, r0, #3
	movs r0, #7
	ands r4, r0
	ldr r0, _08179380
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r5, #0x38]
	str r1, [r5, #0x3c]
	ldrh r1, [r5, #0x3a]
	ldr r0, _08179384
	ands r0, r1
	movs r1, #0x70
	orrs r0, r1
	strh r0, [r5, #0x3a]
	adds r1, r5, #0
	adds r1, #0x38
	movs r0, #0x48
	strb r0, [r1]
	ldr r0, _08179388
	ldrh r0, [r0]
	cmp r0, #0
	beq _08179394
	ldr r3, _0817938C
	lsls r2, r4, #1
	adds r2, r2, r4
	adds r0, r2, r3
	ldrb r4, [r0]
	ldrh r1, [r5, #0x3c]
	ldr r0, _08179390
	ands r0, r1
	orrs r0, r4
	strh r0, [r5, #0x3c]
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r3, #1
	adds r2, r2, r3
	ldrb r0, [r2]
	lsls r0, r0, #3
	orrs r1, r0
	adds r3, r5, #0
	adds r3, #0x3b
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _081793A0
	.align 2, 0
_0817937C: .4byte 0x03002360
_08179380: .4byte 0x085CD220
_08179384: .4byte 0xFFFFFE00
_08179388: .4byte 0x0203B9CA
_0817938C: .4byte 0x085CD24C
_08179390: .4byte 0xFFFFFC00
_08179394:
	ldrh r0, [r5, #0x3c]
	ldr r1, _081793C0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strh r1, [r5, #0x3c]
_081793A0:
	ldr r0, _081793C4
	movs r1, #0xe0
	lsls r1, r1, #0x13
	movs r2, #1
	bl CpuFastSet
	ldr r1, _081793C8
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _081793B8
	subs r0, #1
	strh r0, [r1, #2]
_081793B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081793C0: .4byte 0xFFFFFC00
_081793C4: .4byte 0x03002398
_081793C8: .4byte 0x0203B9CA
	thumb_func_end VBlankCB_UpdateClockGraphics

	thumb_func_start VerifySectorWipe
VerifySectorWipe: @ 0x081793CC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _081793F0
	movs r3, #0x80
	lsls r3, r3, #5
	movs r1, #0
	adds r2, r4, #0
	bl ReadFlash
	movs r1, #0
	ldr r2, _081793F4
_081793E4:
	ldr r0, [r4]
	cmp r0, #0
	beq _081793F8
	movs r0, #1
	b _08179406
	.align 2, 0
_081793F0: .4byte 0x0203A888
_081793F4: .4byte 0x000003FF
_081793F8:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r4, #4
	cmp r1, r2
	bls _081793E4
	movs r0, #0
_08179406:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VerifySectorWipe

	thumb_func_start WipeSector
WipeSector: @ 0x0817940C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	ldr r1, _0817945C
	mov r8, r1
	ldr r7, _08179460
_0817941E:
	movs r4, #0
	adds r5, r0, #1
_08179422:
	ldr r3, [r7]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl _call_via_r3
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r8
	bls _08179422
	adds r0, r6, #0
	bl VerifySectorWipe
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	cmp r1, #0
	beq _0817944E
	cmp r0, #0x81
	bls _0817941E
_0817944E:
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0817945C: .4byte 0x00000FFF
_08179460: .4byte 0x030075F4
	thumb_func_end WipeSector

	thumb_func_start WipeSectors
WipeSectors: @ 0x08179464
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
_0817946A:
	movs r4, #1
	lsls r4, r6
	adds r0, r5, #0
	ands r0, r4
	cmp r0, #0
	beq _08179484
	adds r0, r6, #0
	bl WipeSector
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08179484
	bics r5, r4
_08179484:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x1f
	bls _0817946A
	cmp r5, #0
	beq _08179496
	movs r0, #1
	b _08179498
_08179496:
	movs r0, #0
_08179498:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WipeSectors

