.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start VBlankCB
VBlankCB: @ 0x0817ACB4
	push {lr}
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB

	thumb_func_start SetupClearSaveDataScreen
SetupClearSaveDataScreen: @ 0x0817ACC0
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0817AE20
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0817ACD8
	cmp r0, #1
	bne _0817ACD8
	b _0817AE64
_0817ACD8:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
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
	add r0, sp, #4
	movs r4, #0
	strh r4, [r0]
	ldr r1, _0817AE24
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0817AE28
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0
	str r2, [sp, #8]
	add r0, sp, #8
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0817AE2C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add r0, sp, #4
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _0817AE30
	str r0, [r1, #4]
	ldr r0, _0817AE34
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl ResetPaletteFade
	ldr r2, _0817AE38
	ldr r0, _0817AE3C
	strh r0, [r2]
	ldr r1, _0817AE40
	strh r0, [r1]
	ldr r0, _0817AE44
	strh r0, [r2, #2]
	strh r0, [r1, #2]
	movs r1, #0
	ldr r3, _0817AE48
	ldr r0, _0817AE4C
	adds r2, r0, #0
_0817AD94:
	lsls r0, r1, #1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xf
	bls _0817AD94
	movs r1, #0
	ldr r4, _0817AE50
	movs r3, #1
	ldr r2, _0817AE54
_0817ADAC:
	lsls r0, r1, #1
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	bls _0817ADAC
	bl ResetTasks
	bl ResetSpriteData
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0817AE58
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	bl InitClearSaveDataScreenWindows
	ldr r0, _0817AE5C
	str r0, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _0817AE60
	bl SetVBlankCallback
	ldr r0, _0817AE20
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	b _0817AE88
	.align 2, 0
_0817AE20: .4byte 0x03002360
_0817AE24: .4byte 0x040000D4
_0817AE28: .4byte 0x8100C000
_0817AE2C: .4byte 0x85000100
_0817AE30: .4byte 0x05000002
_0817AE34: .4byte 0x810001FF
_0817AE38: .4byte 0x020373B4
_0817AE3C: .4byte 0x00007FFF
_0817AE40: .4byte 0x020377B4
_0817AE44: .4byte 0x00003945
_0817AE48: .4byte 0x06000020
_0817AE4C: .4byte 0x00001111
_0817AE50: .4byte 0x0600F000
_0817AE54: .4byte 0x000003FF
_0817AE58: .4byte 0x085CDB90
_0817AE5C: .4byte 0x0000FFFF
_0817AE60: .4byte 0x0817ACB5
_0817AE64:
	bl UpdatePaletteFade
	ldr r0, _0817AE80
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817AE88
	ldr r0, _0817AE84
	bl SetMainCallback2
	movs r0, #1
	b _0817AE8A
	.align 2, 0
_0817AE80: .4byte 0x02037C74
_0817AE84: .4byte 0x0817ACA5
_0817AE88:
	movs r0, #0
_0817AE8A:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetupClearSaveDataScreen

	thumb_func_start CB2_FadeAndDoReset
CB2_FadeAndDoReset: @ 0x0817AE94
	push {r4, lr}
	sub sp, #4
	ldr r0, _0817AEC0
	movs r1, #0x87
	lsls r1, r1, #3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _0817AEAA
	cmp r0, #1
	beq _0817AEC8
_0817AEAA:
	ldr r0, _0817AEC4
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #1
	strb r0, [r4]
	b _0817AEE0
	.align 2, 0
_0817AEC0: .4byte 0x03002360
_0817AEC4: .4byte 0x0000FFFF
_0817AEC8:
	bl UpdatePaletteFade
	ldr r0, _0817AEE8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817AEE0
	bl FreeAllWindowBuffers
	bl DoSoftReset
_0817AEE0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817AEE8: .4byte 0x02037C74
	thumb_func_end CB2_FadeAndDoReset

	thumb_func_start InitClearSaveDataScreenWindows
InitClearSaveDataScreenWindows: @ 0x0817AEEC
	push {lr}
	ldr r0, _0817AF1C
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	movs r1, #0
	movs r2, #2
	movs r3, #0xe0
	bl LoadWindowGfx
	ldr r0, _0817AF20
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0817AF1C: .4byte 0x085CDB98
_0817AF20: .4byte 0x085D7B04
	thumb_func_end InitClearSaveDataScreenWindows

