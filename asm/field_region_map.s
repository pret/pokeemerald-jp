.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start FieldInitRegionMap
FieldInitRegionMap: @ 0x0816FF84
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl SetVBlankCallback
	ldr r4, _0816FFB0
	movs r0, #0x89
	lsls r0, r0, #4
	bl Alloc
	str r0, [r4]
	ldr r1, _0816FFB4
	adds r2, r0, r1
	movs r1, #0
	strh r1, [r2]
	str r5, [r0]
	ldr r0, _0816FFB8
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816FFB0: .4byte 0x0203B99C
_0816FFB4: .4byte 0x0000088C
_0816FFB8: .4byte 0x0816FFBD
	thumb_func_end FieldInitRegionMap

	thumb_func_start MCB2_InitRegionMapRegisters
MCB2_InitRegionMapRegisters: @ 0x0816FFBC
	push {lr}
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
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
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08170048
	movs r0, #1
	movs r2, #2
	bl InitBgsFromTemplates
	ldr r0, _0817004C
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	movs r1, #0x23
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	bl clear_scheduled_bg_copies_to_vram
	ldr r0, _08170050
	bl SetMainCallback2
	ldr r0, _08170054
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_08170048: .4byte 0x085C6124
_0817004C: .4byte 0x085C612C
_08170050: .4byte 0x0817006D
_08170054: .4byte 0x08170059
	thumb_func_end MCB2_InitRegionMapRegisters

	thumb_func_start VBCB_FieldUpdateRegionMap
VBCB_FieldUpdateRegionMap: @ 0x08170058
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBCB_FieldUpdateRegionMap

	thumb_func_start MCB2_FieldUpdateRegionMap
MCB2_FieldUpdateRegionMap: @ 0x0817006C
	push {lr}
	bl FieldUpdateRegionMap
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl do_scheduled_bg_tilemap_copies_to_vram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MCB2_FieldUpdateRegionMap

	thumb_func_start FieldUpdateRegionMap
FieldUpdateRegionMap: @ 0x08170088
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _081700A8
	ldr r0, [r1]
	ldr r2, _081700AC
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r1, #0
	cmp r0, #6
	bls _0817009E
	b _08170202
_0817009E:
	lsls r0, r0, #2
	ldr r1, _081700B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081700A8: .4byte 0x0203B99C
_081700AC: .4byte 0x0000088C
_081700B0: .4byte 0x081700B4
_081700B4: @ jump table
	.4byte _081700D0 @ case 0
	.4byte _081700F8 @ case 1
	.4byte _08170144 @ case 2
	.4byte _0817016C @ case 3
	.4byte _08170180 @ case 4
	.4byte _081701AC @ case 5
	.4byte _081701D4 @ case 6
_081700D0:
	ldr r0, [r4]
	adds r0, #8
	movs r1, #0
	bl InitRegionMap
	movs r0, #0
	movs r1, #0
	bl CreateRegionMapPlayerIcon
	movs r0, #1
	movs r1, #1
	bl CreateRegionMapCursor
	ldr r1, [r4]
	ldr r0, _081700F4
	adds r1, r1, r0
	b _081701C4
	.align 2, 0
_081700F4: .4byte 0x0000088C
_081700F8:
	movs r0, #1
	movs r1, #0
	movs r2, #0x23
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, _08170140
	movs r0, #2
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #0
	movs r1, #0
	movs r2, #0x23
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	bl PrintRegionMapSecName
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	b _081701B8
	.align 2, 0
_08170140: .4byte 0x085C611C
_08170144:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuRegBits
	movs r0, #0
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r0, _08170164
	ldr r1, [r0]
	ldr r0, _08170168
	adds r1, r1, r0
	b _081701C4
	.align 2, 0
_08170164: .4byte 0x0203B99C
_08170168: .4byte 0x0000088C
_0817016C:
	ldr r0, _0817017C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08170202
	ldr r1, [r4]
	b _081701C0
	.align 2, 0
_0817017C: .4byte 0x02037C74
_08170180:
	bl sub_081230B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _08170192
	bl PrintRegionMapSecName
	b _08170202
_08170192:
	cmp r0, #3
	blt _08170202
	cmp r0, #5
	bgt _08170202
	ldr r0, _081701A4
	ldr r1, [r0]
	ldr r0, _081701A8
	adds r1, r1, r0
	b _081701C4
	.align 2, 0
_081701A4: .4byte 0x0203B99C
_081701A8: .4byte 0x0000088C
_081701AC:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
_081701B8:
	bl BeginNormalPaletteFade
	ldr r0, _081701CC
	ldr r1, [r0]
_081701C0:
	ldr r2, _081701D0
	adds r1, r1, r2
_081701C4:
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _08170202
	.align 2, 0
_081701CC: .4byte 0x0203B99C
_081701D0: .4byte 0x0000088C
_081701D4:
	ldr r0, _0817020C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08170202
	bl FreeRegionMapIconResources
	ldr r4, _08170210
	ldr r0, [r4]
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, [r4]
	cmp r0, #0
	beq _081701FE
	bl Free
	str r5, [r4]
_081701FE:
	bl FreeAllWindowBuffers
_08170202:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817020C: .4byte 0x02037C74
_08170210: .4byte 0x0203B99C
	thumb_func_end FieldUpdateRegionMap

	thumb_func_start PrintRegionMapSecName
PrintRegionMapSecName: @ 0x08170214
	push {lr}
	sub sp, #0xc
	ldr r0, _08170240
	ldr r2, [r0]
	ldrb r0, [r2, #0xa]
	cmp r0, #0
	beq _08170244
	adds r2, #0xc
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
	b _08170254
	.align 2, 0
_08170240: .4byte 0x0203B99C
_08170244:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
_08170254:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PrintRegionMapSecName

