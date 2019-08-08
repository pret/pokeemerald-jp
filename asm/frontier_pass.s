.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetGpuRegsAndBgs
ResetGpuRegsAndBgs: @ 0x080C49CC
	push {lr}
	sub sp, #8
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
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
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
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080C4AB8
	mov r0, sp
	bl CpuSet
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #4
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ldr r2, _080C4ABC
	bl CpuSet
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080C4AB8: .4byte 0x0100C000
_080C4ABC: .4byte 0x05000100
	thumb_func_end ResetGpuRegsAndBgs

	thumb_func_start ShowFrontierPass
ShowFrontierPass: @ 0x080C4AC0
	push {lr}
	bl AllocateFrontierPassData
	ldr r0, _080C4AD0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C4AD0: .4byte 0x080C4D49
	thumb_func_end ShowFrontierPass

	thumb_func_start LeaveFrontierPass
LeaveFrontierPass: @ 0x080C4AD4
	push {lr}
	ldr r0, _080C4AE8
	ldr r0, [r0]
	ldr r0, [r0]
	bl SetMainCallback2
	bl FreeFrontierPassData
	pop {r0}
	bx r0
	.align 2, 0
_080C4AE8: .4byte 0x0203998C
	thumb_func_end LeaveFrontierPass

	thumb_func_start AllocateFrontierPassData
AllocateFrontierPassData: @ 0x080C4AEC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _080C4AFC
	ldr r0, [r5]
	cmp r0, #0
	beq _080C4B00
	movs r0, #1
	b _080C4BC4
	.align 2, 0
_080C4AFC: .4byte 0x0203998C
_080C4B00:
	movs r0, #0x18
	bl AllocZeroed
	str r0, [r5]
	cmp r0, #0
	bne _080C4B10
	movs r0, #2
	b _080C4BC4
_080C4B10:
	str r4, [r0]
	bl GetCurrentRegionMapSectionId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3a
	beq _080C4B2E
	cmp r4, #0xca
	beq _080C4B2E
	ldr r0, [r5]
	movs r1, #0xb0
	strh r1, [r0, #8]
	movs r1, #0x68
	strh r1, [r0, #0xa]
	b _080C4B3C
_080C4B2E:
	ldr r2, _080C4BCC
	ldr r1, [r2]
	movs r0, #0xb0
	strh r0, [r1, #8]
	movs r0, #0x30
	strh r0, [r1, #0xa]
	adds r5, r2, #0
_080C4B3C:
	ldr r1, [r5]
	ldr r0, _080C4BD0
	ldr r0, [r0]
	ldr r2, _080C4BD4
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl CanCopyRecordedBattleSaveData
	ldr r3, [r5]
	movs r1, #1
	ands r0, r1
	ldrb r2, [r3, #0xe]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xe]
	ldr r2, [r5]
	ldrb r1, [r2, #0xe]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	bl CountPlayerTrainerStars
	ldr r3, [r5]
	lsls r0, r0, #4
	ldrb r2, [r3, #0xe]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xe]
	movs r4, #0
	adds r6, r5, #0
_080C4B82:
	lsls r5, r4, #1
	ldr r1, _080C4BD8
	adds r0, r5, r1
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C4B9E
	ldr r1, [r6]
	adds r1, #0xf
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080C4B9E:
	ldr r2, _080C4BDC
	adds r0, r5, r2
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C4BB8
	ldr r1, [r6]
	adds r1, #0xf
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080C4BB8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080C4B82
	movs r0, #0
_080C4BC4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C4BCC: .4byte 0x0203998C
_080C4BD0: .4byte 0x03005AF0
_080C4BD4: .4byte 0x00000EB8
_080C4BD8: .4byte 0x000008C4
_080C4BDC: .4byte 0x000008C5
	thumb_func_end AllocateFrontierPassData

	thumb_func_start FreeFrontierPassData
FreeFrontierPassData: @ 0x080C4BE0
	push {r4, lr}
	ldr r4, _080C4C00
	ldr r0, [r4]
	cmp r0, #0
	beq _080C4C04
	movs r1, #0
	movs r2, #0x18
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	b _080C4C06
	.align 2, 0
_080C4C00: .4byte 0x0203998C
_080C4C04:
	movs r0, #1
_080C4C06:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FreeFrontierPassData

	thumb_func_start AllocateFrontierPassGfx
AllocateFrontierPassGfx: @ 0x080C4C0C
	push {r4, lr}
	ldr r4, _080C4C1C
	ldr r0, [r4]
	cmp r0, #0
	beq _080C4C20
	movs r0, #1
	b _080C4C36
	.align 2, 0
_080C4C1C: .4byte 0x02039990
_080C4C20:
	ldr r0, _080C4C30
	bl AllocZeroed
	str r0, [r4]
	cmp r0, #0
	beq _080C4C34
	movs r0, #0
	b _080C4C36
	.align 2, 0
_080C4C30: .4byte 0x00002434
_080C4C34:
	movs r0, #2
_080C4C36:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AllocateFrontierPassGfx

	thumb_func_start FreeFrontierPassGfx
FreeFrontierPassGfx: @ 0x080C4C3C
	push {r4, lr}
	bl FreeAllWindowBuffers
	ldr r4, _080C4C50
	ldr r0, [r4]
	cmp r0, #0
	bne _080C4C54
	movs r0, #1
	b _080C4C9C
	.align 2, 0
_080C4C50: .4byte 0x02039990
_080C4C54:
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _080C4C64
	bl Free
	ldr r1, [r4]
	movs r0, #0
	str r0, [r1, #0x28]
_080C4C64:
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _080C4C76
	bl Free
	ldr r1, [r4]
	movs r0, #0
	str r0, [r1, #0x24]
_080C4C76:
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _080C4C88
	bl Free
	ldr r1, [r4]
	movs r0, #0
	str r0, [r1, #0x20]
_080C4C88:
	ldr r0, [r4]
	ldr r2, _080C4CA4
	movs r1, #0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
_080C4C9C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C4CA4: .4byte 0x00002434
	thumb_func_end FreeFrontierPassGfx

	thumb_func_start VblankCb_FrontierPass
VblankCb_FrontierPass: @ 0x080C4CA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _080C4D28
	ldr r6, [r0]
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C4D12
	ldr r3, _080C4D2C
	ldr r0, _080C4D30
	ldr r0, [r0]
	ldrb r4, [r0, #0xe]
	lsls r4, r4, #0x1c
	lsrs r0, r4, #0x1d
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #8
	lsrs r0, r4, #0x1d
	subs r0, #1
	lsls r0, r0, #2
	adds r5, r3, #2
	adds r0, r0, r5
	movs r7, #0
	ldrsh r2, [r0, r7]
	lsls r2, r2, #8
	lsrs r0, r4, #0x1d
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r7, #0
	ldrsh r3, [r0, r7]
	lsrs r4, r4, #0x1d
	subs r4, #1
	lsls r4, r4, #2
	adds r4, r4, r5
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r7, #0x2e
	ldrsh r0, [r6, r7]
	str r0, [sp, #4]
	movs r4, #0x30
	ldrsh r0, [r6, r4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #2
	bl SetBgAffine
_080C4D12:
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4D28: .4byte 0x02039990
_080C4D2C: .4byte 0x0854AF04
_080C4D30: .4byte 0x0203998C
	thumb_func_end VblankCb_FrontierPass

	thumb_func_start CB2_FrontierPass
CB2_FrontierPass: @ 0x080C4D34
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_FrontierPass

	thumb_func_start CB2_InitFrontierPass
CB2_InitFrontierPass: @ 0x080C4D48
	push {lr}
	bl InitFrontierPass
	cmp r0, #0
	beq _080C4D60
	ldr r0, _080C4D64
	movs r1, #0
	bl CreateTask
	ldr r0, _080C4D68
	bl SetMainCallback2
_080C4D60:
	pop {r0}
	bx r0
	.align 2, 0
_080C4D64: .4byte 0x080C5345
_080C4D68: .4byte 0x080C4D35
	thumb_func_end CB2_InitFrontierPass

	thumb_func_start CB2_HideFrontierPass
CB2_HideFrontierPass: @ 0x080C4D6C
	push {lr}
	bl HideFrontierPass
	cmp r0, #0
	beq _080C4D7A
	bl LeaveFrontierPass
_080C4D7A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_HideFrontierPass

	thumb_func_start InitFrontierPass
InitFrontierPass: @ 0x080C4D80
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _080C4DA0
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0xa
	bls _080C4D94
	b _080C4FF0
_080C4D94:
	lsls r0, r0, #2
	ldr r1, _080C4DA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4DA0: .4byte 0x0203998C
_080C4DA4: .4byte 0x080C4DA8
_080C4DA8: @ jump table
	.4byte _080C4DD4 @ case 0
	.4byte _080C4DEA @ case 1
	.4byte _080C4DF0 @ case 2
	.4byte _080C4E06 @ case 3
	.4byte _080C4E0C @ case 4
	.4byte _080C4E5C @ case 5
	.4byte _080C4E6C @ case 6
	.4byte _080C4ECC @ case 7
	.4byte _080C4F20 @ case 8
	.4byte _080C4F80 @ case 9
	.4byte _080C4FCC @ case 10
_080C4DD4:
	movs r0, #0
	bl SetVBlankCallback
	bl ScanlineEffect_Stop
	bl SetVBlankHBlankCallbacksToNull
	movs r0, #2
	bl DisableInterrupts
	b _080C4FF0
_080C4DEA:
	bl ResetGpuRegsAndBgs
	b _080C4FF0
_080C4DF0:
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl reset_temp_tile_data_buffers
	b _080C4FF0
_080C4E06:
	bl AllocateFrontierPassGfx
	b _080C4FF0
_080C4E0C:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080C4E4C
	movs r0, #1
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _080C4E50
	ldr r1, [r4]
	adds r1, #0x32
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _080C4E54
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _080C4E58
	adds r1, r1, r0
	movs r0, #3
	bl SetBgTilemapBuffer
	movs r0, #2
	movs r1, #6
	movs r2, #1
	bl SetBgAttribute
	b _080C4FF0
	.align 2, 0
_080C4E4C: .4byte 0x0854AF0C
_080C4E50: .4byte 0x02039990
_080C4E54: .4byte 0x00001032
_080C4E58: .4byte 0x00002032
_080C4E5C:
	ldr r0, _080C4E68
	bl InitWindows
	bl DeactivateAllTextPrinters
	b _080C4FF0
	.align 2, 0
_080C4E68: .4byte 0x0854AF24
_080C4E6C:
	ldr r0, _080C4EB4
	add r1, sp, #8
	bl malloc_and_decompress
	ldr r4, _080C4EB8
	ldr r1, [r4]
	str r0, [r1, #0x20]
	ldr r0, _080C4EBC
	add r1, sp, #8
	bl malloc_and_decompress
	ldr r1, [r4]
	str r0, [r1, #0x24]
	ldr r0, _080C4EC0
	add r1, sp, #8
	bl malloc_and_decompress
	ldr r1, [r4]
	str r0, [r1, #0x28]
	ldr r1, _080C4EC4
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _080C4EC8
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _080C4FF0
	.align 2, 0
_080C4EB4: .4byte 0x0854AE1C
_080C4EB8: .4byte 0x02039990
_080C4EBC: .4byte 0x08549B58
_080C4EC0: .4byte 0x08549DE8
_080C4EC4: .4byte 0x085469A4
_080C4EC8: .4byte 0x08549E20
_080C4ECC:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C4ED8
	b _080C4FFA
_080C4ED8:
	movs r5, #0x1e
	str r5, [sp]
	movs r4, #0x14
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	b _080C4FF0
_080C4F20:
	ldr r4, _080C4F78
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r0, r4, #0
	movs r1, #0
	bl LoadPalette
	ldr r5, _080C4F7C
	ldr r0, [r5]
	ldrb r0, [r0, #0xe]
	lsrs r0, r0, #4
	lsls r0, r0, #5
	adds r4, #0x20
	adds r0, r0, r4
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	bl stdpal_get
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	bl sub_080C5B88
	ldr r1, [r5]
	ldrb r0, [r1, #0xc]
	ldrb r1, [r1, #0xd]
	bl sub_080C59F0
	ldr r5, [r5]
	ldrb r0, [r5, #0xe]
	movs r1, #0xe
	ands r1, r0
	cmp r1, #2
	beq _080C4F70
	cmp r1, #4
	bne _080C4FF0
_080C4F70:
	movs r0, #0
	strh r0, [r5, #4]
	movs r0, #1
	b _080C4FFC
	.align 2, 0
_080C4F78: .4byte 0x085467E4
_080C4F7C: .4byte 0x0203998C
_080C4F80:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	bl LoadCursorAndSymbolSprites
	ldr r0, _080C4FC8
	bl SetVBlankCallback
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _080C4FF0
	.align 2, 0
_080C4FC8: .4byte 0x080C4CA9
_080C4FCC:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080C4FFA
	ldr r0, _080C4FEC
	ldr r0, [r0]
	strh r1, [r0, #4]
	movs r0, #1
	b _080C4FFC
	.align 2, 0
_080C4FEC: .4byte 0x0203998C
_080C4FF0:
	ldr r0, _080C5004
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
_080C4FFA:
	movs r0, #0
_080C4FFC:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C5004: .4byte 0x0203998C
	thumb_func_end InitFrontierPass

	thumb_func_start HideFrontierPass
HideFrontierPass: @ 0x080C5008
	push {lr}
	sub sp, #4
	ldr r1, _080C5024
	ldr r0, [r1]
	ldrh r0, [r0, #4]
	adds r2, r1, #0
	cmp r0, #5
	bhi _080C50E0
	lsls r0, r0, #2
	ldr r1, _080C5028
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C5024: .4byte 0x0203998C
_080C5028: .4byte 0x080C502C
_080C502C: @ jump table
	.4byte _080C5044 @ case 0
	.4byte _080C506C @ case 1
	.4byte _080C5078 @ case 2
	.4byte _080C50A2 @ case 3
	.4byte _080C50A8 @ case 4
	.4byte _080C50BA @ case 5
_080C5044:
	ldr r0, [r2]
	ldrb r0, [r0, #0xe]
	movs r1, #0xe
	ands r1, r0
	cmp r1, #2
	beq _080C5066
	cmp r1, #4
	beq _080C5066
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _080C50E0
_080C5066:
	ldr r1, [r2]
	movs r0, #2
	b _080C50E8
_080C506C:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C50E0
	b _080C50EA
_080C5078:
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl HideBg
	movs r0, #1
	bl HideBg
	movs r0, #2
	bl HideBg
	movs r0, #0
	bl SetVBlankCallback
	bl ScanlineEffect_Stop
	bl SetVBlankHBlankCallbacksToNull
	b _080C50E0
_080C50A2:
	bl FreeCursorAndSymbolSprites
	b _080C50E0
_080C50A8:
	bl ResetGpuRegsAndBgs
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _080C50E0
_080C50BA:
	movs r0, #0
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #2
	bl UnsetBgTilemapBuffer
	bl FreeFrontierPassGfx
	ldr r0, _080C50DC
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #4]
	movs r0, #1
	b _080C50EC
	.align 2, 0
_080C50DC: .4byte 0x0203998C
_080C50E0:
	ldr r0, _080C50F4
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	adds r0, #1
_080C50E8:
	strh r0, [r1, #4]
_080C50EA:
	movs r0, #0
_080C50EC:
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080C50F4: .4byte 0x0203998C
	thumb_func_end HideFrontierPass

	thumb_func_start GetCursorAreaFromCoords
GetCursorAreaFromCoords: @ 0x080C50F8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r4, #0
	ldr r7, _080C5148
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
_080C5106:
	lsls r0, r4, #3
	adds r3, r0, r7
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, r5
	bgt _080C5150
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, r5
	blt _080C5150
	movs r0, #4
	ldrsh r1, [r3, r0]
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _080C5150
	movs r1, #6
	ldrsh r0, [r3, r1]
	cmp r0, r2
	blt _080C5150
	cmp r4, #5
	bls _080C513E
	ldr r0, _080C514C
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080C515A
_080C513E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080C515C
	.align 2, 0
_080C5148: .4byte 0x0854AF78
_080C514C: .4byte 0x0203998C
_080C5150:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xc
	bls _080C5106
_080C515A:
	movs r0, #0
_080C515C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetCursorAreaFromCoords

	thumb_func_start CB2_ReshowFrontierPass
CB2_ReshowFrontierPass: @ 0x080C5164
	push {lr}
	bl InitFrontierPass
	cmp r0, #0
	beq _080C51C2
	ldr r1, _080C519C
	ldr r0, [r1]
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #1
	blt _080C51A8
	cmp r0, #2
	bgt _080C51A8
	ldr r0, _080C51A0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080C51A4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1, #8]
	b _080C51BC
	.align 2, 0
_080C519C: .4byte 0x0203998C
_080C51A0: .4byte 0x080C54D5
_080C51A4: .4byte 0x03005B60
_080C51A8:
	ldr r2, [r1]
	ldrb r1, [r2, #0xe]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	ldr r0, _080C51C8
	movs r1, #0
	bl CreateTask
_080C51BC:
	ldr r0, _080C51CC
	bl SetMainCallback2
_080C51C2:
	pop {r0}
	bx r0
	.align 2, 0
_080C51C8: .4byte 0x080C5345
_080C51CC: .4byte 0x080C4D35
	thumb_func_end CB2_ReshowFrontierPass

	thumb_func_start CB2_ReturnFromRecord
CB2_ReturnFromRecord: @ 0x080C51D0
	push {r4, lr}
	ldr r4, _080C5208
	ldr r0, [r4]
	bl AllocateFrontierPassData
	ldr r0, _080C520C
	ldr r1, [r0]
	ldrh r0, [r4, #4]
	strh r0, [r1, #8]
	ldrh r0, [r4, #6]
	strh r0, [r1, #0xa]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl memset
	bl InBattlePyramid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080C5210
	cmp r0, #2
	beq _080C5218
	bl Overworld_PlaySpecialMapMusic
	b _080C5220
	.align 2, 0
_080C5208: .4byte 0x02039998
_080C520C: .4byte 0x0203998C
_080C5210:
	ldr r0, _080C5214
	b _080C521C
	.align 2, 0
_080C5214: .4byte 0x000001CD
_080C5218:
	movs r0, #0xe7
	lsls r0, r0, #1
_080C521C:
	bl PlayBGM
_080C5220:
	ldr r0, _080C522C
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C522C: .4byte 0x080C5165
	thumb_func_end CB2_ReturnFromRecord

	thumb_func_start CB2_ShowFrontierPassFeature
CB2_ShowFrontierPassFeature: @ 0x080C5230
	push {lr}
	bl HideFrontierPass
	cmp r0, #0
	beq _080C5296
	ldr r0, _080C5254
	ldr r2, [r0]
	ldrb r0, [r2, #0xe]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #2
	beq _080C5290
	cmp r0, #2
	bgt _080C5258
	cmp r0, #1
	beq _080C525E
	b _080C5296
	.align 2, 0
_080C5254: .4byte 0x0203998C
_080C5258:
	cmp r0, #3
	beq _080C526C
	b _080C5296
_080C525E:
	ldr r0, _080C5268
	bl ShowFrontierMap
	b _080C5296
	.align 2, 0
_080C5268: .4byte 0x080C5165
_080C526C:
	ldr r1, _080C5288
	ldr r0, [r2]
	str r0, [r1]
	ldrh r0, [r2, #8]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0xa]
	strh r0, [r1, #6]
	bl FreeFrontierPassData
	ldr r0, _080C528C
	bl PlayRecordedBattle
	b _080C5296
	.align 2, 0
_080C5288: .4byte 0x02039998
_080C528C: .4byte 0x080C51D1
_080C5290:
	ldr r0, _080C529C
	bl ShowPlayerTrainerCard
_080C5296:
	pop {r0}
	bx r0
	.align 2, 0
_080C529C: .4byte 0x080C5165
	thumb_func_end CB2_ShowFrontierPassFeature

	thumb_func_start TryCallPassAreaFunction
TryCallPassAreaFunction: @ 0x080C52A0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, r3, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r1, #0
	cmp r1, #1
	blt _080C52C8
	cmp r1, #2
	ble _080C52F0
	cmp r1, #3
	bne _080C52C8
	ldr r0, _080C52CC
	ldr r2, [r0]
	ldrb r1, [r2, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C52D0
_080C52C8:
	movs r0, #0
	b _080C532C
	.align 2, 0
_080C52CC: .4byte 0x0203998C
_080C52D0:
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #6
	orrs r0, r1
	strb r0, [r2, #0xe]
	adds r0, r3, #0
	bl DestroyTask
	ldr r0, _080C52EC
	bl SetMainCallback2
	b _080C5316
	.align 2, 0
_080C52EC: .4byte 0x080C5231
_080C52F0:
	ldr r0, _080C5334
	ldr r3, [r0]
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #1
	ldrb r1, [r3, #0xe]
	subs r0, #0x16
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0xe]
	ldr r1, _080C5338
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080C533C
	str r1, [r0]
	movs r1, #0
	strh r1, [r0, #8]
_080C5316:
	ldr r0, _080C5334
	ldr r2, [r0]
	ldr r0, _080C5340
	ldr r1, [r0]
	ldr r0, [r1]
	ldrh r0, [r0, #0x20]
	strh r0, [r2, #8]
	ldr r0, [r1]
	ldrh r0, [r0, #0x22]
	strh r0, [r2, #0xa]
	movs r0, #1
_080C532C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C5334: .4byte 0x0203998C
_080C5338: .4byte 0x03005B60
_080C533C: .4byte 0x080C54D5
_080C5340: .4byte 0x02039990
	thumb_func_end TryCallPassAreaFunction

	thumb_func_start Task_HandleFrontierPassInput
Task_HandleFrontierPassInput: @ 0x080C5344
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	ldr r2, _080C5438
	ldrh r1, [r2, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080C537C
	ldr r0, _080C543C
	ldr r4, [r0]
	ldr r1, [r4]
	ldrh r3, [r1, #0x22]
	movs r7, #0x22
	ldrsh r0, [r1, r7]
	cmp r0, #8
	ble _080C537C
	subs r0, r3, #2
	strh r0, [r1, #0x22]
	ldr r1, [r4]
	movs r3, #0x22
	ldrsh r0, [r1, r3]
	cmp r0, #7
	bgt _080C537A
	movs r0, #2
	strh r0, [r1, #0x22]
_080C537A:
	movs r5, #1
_080C537C:
	ldrh r1, [r2, #0x2c]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080C53AA
	ldr r0, _080C543C
	ldr r4, [r0]
	ldr r1, [r4]
	ldrh r3, [r1, #0x22]
	movs r7, #0x22
	ldrsh r0, [r1, r7]
	cmp r0, #0x87
	bgt _080C53AA
	adds r0, r3, #2
	strh r0, [r1, #0x22]
	ldr r1, [r4]
	movs r3, #0x22
	ldrsh r0, [r1, r3]
	cmp r0, #0x88
	ble _080C53A8
	movs r0, #0x88
	strh r0, [r1, #0x22]
_080C53A8:
	movs r5, #1
_080C53AA:
	ldrh r1, [r2, #0x2c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080C53D8
	ldr r0, _080C543C
	ldr r4, [r0]
	ldr r1, [r4]
	ldrh r3, [r1, #0x20]
	movs r7, #0x20
	ldrsh r0, [r1, r7]
	cmp r0, #5
	ble _080C53D8
	subs r0, r3, #2
	strh r0, [r1, #0x20]
	ldr r1, [r4]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #4
	bgt _080C53D6
	movs r0, #5
	strh r0, [r1, #0x20]
_080C53D6:
	movs r5, #1
_080C53D8:
	ldrh r1, [r2, #0x2c]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080C5406
	ldr r0, _080C543C
	ldr r4, [r0]
	ldr r1, [r4]
	ldrh r3, [r1, #0x20]
	movs r7, #0x20
	ldrsh r0, [r1, r7]
	cmp r0, #0xe7
	bgt _080C5406
	adds r0, r3, #2
	strh r0, [r1, #0x20]
	ldr r1, [r4]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #0xe8
	ble _080C5404
	movs r0, #0xe8
	strh r0, [r1, #0x20]
_080C5404:
	movs r5, #1
_080C5406:
	cmp r5, #0
	bne _080C5484
	ldr r4, _080C5440
	ldr r0, [r4]
	ldrb r3, [r0, #0xc]
	cmp r3, #0
	beq _080C545A
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C545A
	cmp r3, #3
	bhi _080C5444
	movs r0, #5
	bl PlaySE
	ldr r0, [r4]
	ldrb r1, [r0, #0xc]
	adds r0, r6, #0
	bl TryCallPassAreaFunction
	cmp r0, #0
	bne _080C54C6
	b _080C545A
	.align 2, 0
_080C5438: .4byte 0x03002360
_080C543C: .4byte 0x02039990
_080C5440: .4byte 0x0203998C
_080C5444:
	cmp r3, #4
	bne _080C545A
	movs r0, #3
	bl PlaySE
	ldr r0, _080C547C
	bl SetMainCallback2
	adds r0, r6, #0
	bl DestroyTask
_080C545A:
	ldr r0, _080C5480
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C54C6
	movs r0, #3
	bl PlaySE
	ldr r0, _080C547C
	bl SetMainCallback2
	adds r0, r6, #0
	bl DestroyTask
	b _080C54C6
	.align 2, 0
_080C547C: .4byte 0x080C4D6D
_080C5480: .4byte 0x03002360
_080C5484:
	ldr r0, _080C54CC
	ldr r0, [r0]
	ldr r1, [r0]
	ldrh r0, [r1, #0x20]
	subs r0, #5
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1, #0x22]
	adds r1, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl GetCursorAreaFromCoords
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080C54D0
	ldr r0, [r4]
	ldrb r0, [r0, #0xc]
	cmp r0, r5
	beq _080C54C6
	adds r0, r5, #0
	bl PrintAreaDescription
	ldr r1, [r4]
	ldrb r0, [r1, #0xc]
	strb r0, [r1, #0xd]
	ldr r0, [r4]
	strb r5, [r0, #0xc]
	ldr r1, [r4]
	ldrb r0, [r1, #0xc]
	ldrb r1, [r1, #0xd]
	bl sub_080C59F0
_080C54C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C54CC: .4byte 0x02039990
_080C54D0: .4byte 0x0203998C
	thumb_func_end Task_HandleFrontierPassInput

	thumb_func_start Task_DoFadeEffect
Task_DoFadeEffect: @ 0x080C54D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r5, r0, #3
	ldr r0, _080C5500
	mov r8, r0
	adds r6, r5, r0
	ldr r7, _080C5504
	ldr r0, [r7]
	ldrh r0, [r0, #4]
	cmp r0, #1
	beq _080C55D0
	cmp r0, #1
	bgt _080C5508
	cmp r0, #0
	beq _080C5510
	b _080C5698
	.align 2, 0
_080C5500: .4byte 0x03005B68
_080C5504: .4byte 0x0203998C
_080C5508:
	cmp r0, #2
	bne _080C550E
	b _080C5626
_080C550E:
	b _080C5698
_080C5510:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080C5548
	movs r0, #1
	movs r1, #0
	bl sub_080C5844
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	movs r0, #0x15
	strh r0, [r6, #6]
	strh r0, [r6, #8]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080C5544
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _080C55A0
	.align 2, 0
_080C5544: .4byte 0x00007FFF
_080C5548:
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	movs r1, #0x15
	rsbs r1, r1, #0
	adds r0, r1, #0
	strh r0, [r6, #6]
	strh r0, [r6, #8]
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	bl LoadCursorAndSymbolSprites
	ldr r0, _080C55C4
	bl SetVBlankCallback
	movs r5, #1
	rsbs r5, r5, #0
	ldr r4, _080C55C8
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl BlendPalettes
	str r4, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_080C55A0:
	ldr r4, _080C55CC
	ldr r0, [r4]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
	movs r1, #2
	ldrsh r0, [r6, r1]
	bl sub_08151600
	ldr r1, [r4]
	strh r0, [r1, #0x2e]
	movs r1, #4
	ldrsh r0, [r6, r1]
	bl sub_08151600
	ldr r1, [r4]
	strh r0, [r1, #0x30]
	b _080C5698
	.align 2, 0
_080C55C4: .4byte 0x080C4CA9
_080C55C8: .4byte 0x00007FFF
_080C55CC: .4byte 0x02039990
_080C55D0:
	bl UpdatePaletteFade
	ldrh r0, [r6, #6]
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	strh r0, [r6, #2]
	ldrh r0, [r6, #8]
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	strh r0, [r6, #4]
	movs r1, #2
	ldrsh r0, [r6, r1]
	bl sub_08151600
	ldr r4, _080C5614
	ldr r1, [r4]
	strh r0, [r1, #0x2e]
	movs r1, #4
	ldrsh r0, [r6, r1]
	bl sub_08151600
	ldr r1, [r4]
	strh r0, [r1, #0x30]
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080C5618
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xfe
	lsls r0, r0, #1
	cmp r1, r0
	ble _080C56A2
	b _080C5698
	.align 2, 0
_080C5614: .4byte 0x02039990
_080C5618:
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080C56A2
	b _080C5698
_080C5626:
	ldr r0, _080C5658
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0
	beq _080C5638
	movs r0, #0
	strb r0, [r1]
_080C5638:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C56A2
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080C5660
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _080C565C
	bl SetMainCallback2
	b _080C567E
	.align 2, 0
_080C5658: .4byte 0x02039990
_080C565C: .4byte 0x080C5231
_080C5660:
	movs r0, #0
	movs r1, #0
	bl sub_080C5844
	ldr r2, [r7]
	ldrb r1, [r2, #0xe]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	mov r0, r8
	subs r0, #8
	adds r0, r5, r0
	ldr r1, _080C5690
	str r1, [r0]
_080C567E:
	movs r0, #2
	movs r1, #6
	movs r2, #0
	bl SetBgAttribute
	ldr r0, _080C5694
	ldr r1, [r0]
	movs r0, #0
	b _080C56A0
	.align 2, 0
_080C5690: .4byte 0x080C5345
_080C5694: .4byte 0x0203998C
_080C5698:
	ldr r0, _080C56B0
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	adds r0, #1
_080C56A0:
	strh r0, [r1, #4]
_080C56A2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C56B0: .4byte 0x0203998C
	thumb_func_end Task_DoFadeEffect

	thumb_func_start ShowAndPrintWindows
ShowAndPrintWindows: @ 0x080C56B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	movs r4, #0
_080C56BE:
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _080C56BE
	ldr r6, _080C57A4
	str r6, [sp]
	movs r0, #0
	mov r8, r0
	str r0, [sp, #4]
	ldr r0, _080C57A8
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #8
	movs r3, #6
	bl AddTextPrinterParameterized3
	str r6, [sp]
	mov r1, r8
	str r1, [sp, #4]
	ldr r0, _080C57AC
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #0xe
	movs r3, #6
	bl AddTextPrinterParameterized3
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	ldr r0, _080C57B0
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #0
	movs r2, #8
	movs r3, #3
	bl AddTextPrinterParameterized3
	ldr r4, _080C57B4
	ldr r5, _080C57B8
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #5
	bl ConvertIntToDecimalStringN
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	adds r1, r4, #0
	bl GetStringWidth
	movs r2, #0x5c
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r6, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r0, #2
	movs r1, #0
	movs r3, #0xf
	bl AddTextPrinterParameterized3
	ldr r1, [r5]
	ldrh r0, [r1, #8]
	subs r0, #5
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1, #0xa]
	adds r1, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl GetCursorAreaFromCoords
	ldr r1, [r5]
	strb r0, [r1, #0xc]
	ldr r0, [r5]
	mov r1, r8
	strb r1, [r0, #0xd]
	ldr r0, [r5]
	ldrb r0, [r0, #0xc]
	bl PrintAreaDescription
	movs r4, #0
_080C577E:
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _080C577E
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C57A4: .4byte 0x0854AF6C
_080C57A8: .4byte 0x085CCA93
_080C57AC: .4byte 0x085CCA9E
_080C57B0: .4byte 0x085CCAA8
_080C57B4: .4byte 0x02021C7C
_080C57B8: .4byte 0x0203998C
	thumb_func_end ShowAndPrintWindows

	thumb_func_start PrintAreaDescription
PrintAreaDescription: @ 0x080C57BC
	push {r4, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #3
	movs r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #3
	bne _080C5804
	ldr r0, _080C57F8
	ldr r0, [r0]
	ldrb r0, [r0, #0xe]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080C5804
	ldr r0, _080C57FC
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _080C5800
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	b _080C5826
	.align 2, 0
_080C57F8: .4byte 0x0203998C
_080C57FC: .4byte 0x0854AF6F
_080C5800: .4byte 0x0854B138
_080C5804:
	cmp r4, #0
	beq _080C5826
	ldr r0, _080C583C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C5840
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
_080C5826:
	movs r0, #3
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C583C: .4byte 0x0854AF6F
_080C5840: .4byte 0x0854B138
	thumb_func_end PrintAreaDescription

	thumb_func_start sub_080C5844
sub_080C5844: @ 0x080C5844
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r0, _080C5868
	ldr r0, [r0]
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #1
	beq _080C586C
	cmp r0, #2
	beq _080C58AE
	b _080C59DA
	.align 2, 0
_080C5868: .4byte 0x0203998C
_080C586C:
	cmp r2, #0
	beq _080C5894
	ldr r0, _080C5890
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	movs r2, #0x10
	movs r3, #3
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _080C58F0
	.align 2, 0
_080C5890: .4byte 0x02039990
_080C5894:
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #0
	movs r2, #0x10
	movs r3, #3
	bl FillBgTilemapBufferRect
	b _080C58F0
_080C58AE:
	cmp r2, #0
	beq _080C58D8
	ldr r0, _080C58D4
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	adds r1, #0x54
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	movs r2, #0x10
	movs r3, #0xa
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _080C58F0
	.align 2, 0
_080C58D4: .4byte 0x02039990
_080C58D8:
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #0
	movs r2, #0x10
	movs r3, #0xa
	bl FillBgTilemapBufferRect
_080C58F0:
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	cmp r7, #0
	beq _080C5970
	movs r4, #0xfe
	lsls r4, r4, #1
	adds r0, r4, #0
	bl sub_08151600
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r0, r4, #0
	bl sub_08151600
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r5, _080C5968
	ldr r1, _080C596C
	ldr r1, [r1]
	ldrb r4, [r1, #0xe]
	lsls r4, r4, #0x1c
	lsrs r1, r4, #0x1d
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #8
	lsrs r2, r4, #0x1d
	subs r2, #1
	lsls r2, r2, #2
	adds r3, r5, #2
	mov r8, r3
	add r2, r8
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsls r2, r2, #8
	lsrs r3, r4, #0x1d
	subs r3, #1
	lsls r3, r3, #2
	adds r3, r3, r5
	movs r5, #0
	ldrsh r3, [r3, r5]
	lsrs r4, r4, #0x1d
	subs r4, #1
	lsls r4, r4, #2
	add r4, r8
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	str r6, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #2
	bl SetBgAffine
	b _080C59DA
	.align 2, 0
_080C5968: .4byte 0x0854AF04
_080C596C: .4byte 0x0203998C
_080C5970:
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl sub_08151600
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r0, r4, #0
	bl sub_08151600
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r5, _080C59E8
	ldr r1, _080C59EC
	ldr r1, [r1]
	ldrb r4, [r1, #0xe]
	lsls r4, r4, #0x1c
	lsrs r1, r4, #0x1d
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #8
	lsrs r2, r4, #0x1d
	subs r2, #1
	lsls r2, r2, #2
	adds r3, r5, #2
	mov r8, r3
	add r2, r8
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsls r2, r2, #8
	lsrs r3, r4, #0x1d
	subs r3, #1
	lsls r3, r3, #2
	adds r3, r3, r5
	movs r5, #0
	ldrsh r3, [r3, r5]
	lsrs r4, r4, #0x1d
	subs r4, #1
	lsls r4, r4, #2
	add r4, r8
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	str r6, [sp, #4]
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	movs r0, #2
	bl SetBgAffine
_080C59DA:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C59E8: .4byte 0x0854AF04
_080C59EC: .4byte 0x0203998C
	thumb_func_end sub_080C5844

	thumb_func_start sub_080C59F0
sub_080C59F0: @ 0x080C59F0
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r5, #2
	beq _080C5A38
	cmp r5, #2
	bgt _080C5A0A
	cmp r5, #1
	beq _080C5A14
	b _080C5AB0
_080C5A0A:
	cmp r5, #3
	beq _080C5A5C
	cmp r5, #4
	beq _080C5A90
	b _080C5AB0
_080C5A14:
	ldr r0, _080C5A34
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x10
	movs r3, #3
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _080C5ABA
	.align 2, 0
_080C5A34: .4byte 0x02039990
_080C5A38:
	ldr r0, _080C5A58
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	movs r0, #0xa8
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x10
	b _080C5A7E
	.align 2, 0
_080C5A58: .4byte 0x02039990
_080C5A5C:
	ldr r0, _080C5A88
	ldr r0, [r0]
	ldrb r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C5AB0
	ldr r0, _080C5A8C
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	movs r0, #0xc
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #2
_080C5A7E:
	movs r3, #0xa
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _080C5ABA
	.align 2, 0
_080C5A88: .4byte 0x0203998C
_080C5A8C: .4byte 0x02039990
_080C5A90:
	ldr r1, _080C5AAC
	movs r0, #6
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x15
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _080C5ABA
	.align 2, 0
_080C5AAC: .4byte 0x08549DB8
_080C5AB0:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080C5B80
_080C5ABA:
	cmp r4, #2
	beq _080C5AF8
	cmp r4, #2
	bgt _080C5AC8
	cmp r4, #1
	beq _080C5AD2
	b _080C5B70
_080C5AC8:
	cmp r4, #3
	beq _080C5B1C
	cmp r4, #4
	beq _080C5B50
	b _080C5B70
_080C5AD2:
	ldr r0, _080C5AF4
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	adds r1, #0xa8
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x10
	movs r3, #3
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _080C5B7A
	.align 2, 0
_080C5AF4: .4byte 0x02039990
_080C5AF8:
	ldr r0, _080C5B18
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	movs r0, #0xfc
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x10
	b _080C5B40
	.align 2, 0
_080C5B18: .4byte 0x02039990
_080C5B1C:
	ldr r0, _080C5B48
	ldr r0, [r0]
	ldrb r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C5B80
	ldr r0, _080C5B4C
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	adds r1, #0x48
	movs r0, #0xc
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #2
_080C5B40:
	movs r3, #0xa
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _080C5B7A
	.align 2, 0
_080C5B48: .4byte 0x0203998C
_080C5B4C: .4byte 0x02039990
_080C5B50:
	ldr r1, _080C5B6C
	movs r0, #6
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x15
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _080C5B7A
	.align 2, 0
_080C5B6C: .4byte 0x08549DD0
_080C5B70:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080C5B80
_080C5B7A:
	movs r0, #1
	bl CopyBgTilemapBufferToVram
_080C5B80:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080C59F0

	thumb_func_start sub_080C5B88
sub_080C5B88: @ 0x080C5B88
	push {r4, lr}
	ldr r1, _080C5BC0
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r4, _080C5BC4
	ldr r1, [r4]
	ldrb r0, [r1, #0xc]
	ldrb r1, [r1, #0xd]
	bl sub_080C59F0
	ldr r0, [r4]
	ldrb r1, [r0, #0xe]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1d
	movs r0, #1
	bl sub_080C5844
	bl ShowAndPrintWindows
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5BC0: .4byte 0x08549610
_080C5BC4: .4byte 0x0203998C
	thumb_func_end sub_080C5B88

	thumb_func_start LoadCursorAndSymbolSprites
LoadCursorAndSymbolSprites: @ 0x080C5BC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	movs r5, #0
	bl FreeAllSpritePalettes
	bl ResetAffineAnimData
	ldr r0, _080C5CC4
	bl LoadSpritePalettes
	ldr r4, _080C5CC8
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #0x10
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	ldr r0, _080C5CCC
	ldr r1, _080C5CD0
	ldr r2, [r1]
	movs r3, #8
	ldrsh r1, [r2, r3]
	movs r6, #0xa
	ldrsh r2, [r2, r6]
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080C5CD4
	ldr r2, [r3]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080C5CD8
	adds r1, r1, r0
	str r1, [r2]
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	mov r8, sp
	mov sb, r3
_080C5C28:
	ldr r0, _080C5CD0
	ldr r0, [r0]
	adds r0, #0xf
	adds r2, r0, r5
	ldrb r0, [r2]
	adds r4, r5, #1
	cmp r0, #0
	beq _080C5CAE
	mov r1, sp
	ldr r0, _080C5CDC
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	mov r7, r8
	ldrh r0, [r7, #2]
	ldr r1, _080C5CE0
	adds r0, r0, r1
	ldrb r2, [r2]
	adds r0, r0, r2
	strh r0, [r7, #2]
	ldr r1, _080C5CE4
	adds r0, r5, #6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	adds r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r0]
	adds r2, #6
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	mov r0, sp
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r3, sb
	ldr r2, [r3]
	lsls r3, r5, #2
	adds r2, #4
	adds r2, r2, r3
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080C5CD8
	adds r1, r1, r0
	str r1, [r2]
	ldrb r2, [r1, #5]
	movs r6, #0xd
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r2, r0
	movs r0, #8
	orrs r2, r0
	strb r2, [r1, #5]
	mov r7, sb
	ldr r0, [r7]
	adds r0, #4
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, r5, #0
	bl StartSpriteAnim
_080C5CAE:
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #6
	bls _080C5C28
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5CC4: .4byte 0x0854B008
_080C5CC8: .4byte 0x0854AFE0
_080C5CCC: .4byte 0x0854B0D8
_080C5CD0: .4byte 0x0203998C
_080C5CD4: .4byte 0x02039990
_080C5CD8: .4byte 0x020205AC
_080C5CDC: .4byte 0x0854B108
_080C5CE0: .4byte 0x0000FFFF
_080C5CE4: .4byte 0x0854AF78
	thumb_func_end LoadCursorAndSymbolSprites

	thumb_func_start FreeCursorAndSymbolSprites
FreeCursorAndSymbolSprites: @ 0x080C5CE8
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r4, _080C5D38
	ldr r0, [r4]
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r4]
	str r5, [r0]
	adds r6, r4, #0
_080C5CFC:
	ldr r0, [r6]
	lsls r4, r5, #2
	adds r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080C5D18
	bl DestroySprite
	ldr r0, [r6]
	adds r0, #4
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080C5D18:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #6
	bls _080C5CFC
	bl FreeAllSpritePalettes
	movs r0, #2
	bl FreeSpriteTilesByTag
	movs r0, #0
	bl FreeSpriteTilesByTag
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C5D38: .4byte 0x02039990
	thumb_func_end FreeCursorAndSymbolSprites

	thumb_func_start SpriteCb_Dummy
SpriteCb_Dummy: @ 0x080C5D3C
	bx lr
	.align 2, 0
	thumb_func_end SpriteCb_Dummy

	thumb_func_start ShowFrontierMap
ShowFrontierMap: @ 0x080C5D40
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080C5D74
	ldr r0, [r5]
	cmp r0, #0
	beq _080C5D52
	adds r0, r4, #0
	bl SetMainCallback2
_080C5D52:
	ldr r0, _080C5D78
	bl AllocZeroed
	str r0, [r5]
	str r4, [r0]
	bl ResetTasks
	ldr r0, _080C5D7C
	movs r1, #0
	bl CreateTask
	ldr r0, _080C5D80
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5D74: .4byte 0x02039994
_080C5D78: .4byte 0x00003014
_080C5D7C: .4byte 0x080C60A9
_080C5D80: .4byte 0x080C4D35
	thumb_func_end ShowFrontierMap

	thumb_func_start FreeFrontierMap
FreeFrontierMap: @ 0x080C5D84
	push {r4, lr}
	bl ResetTasks
	ldr r4, _080C5DB0
	ldr r0, [r4]
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, [r4]
	ldr r2, _080C5DB4
	movs r1, #0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5DB0: .4byte 0x02039994
_080C5DB4: .4byte 0x00003014
	thumb_func_end FreeFrontierMap

	thumb_func_start InitFrontierMap
InitFrontierMap: @ 0x080C5DB8
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080C5DD4
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #7
	bls _080C5DC8
	b _080C5F80
_080C5DC8:
	lsls r0, r0, #2
	ldr r1, _080C5DD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C5DD4: .4byte 0x0203998C
_080C5DD8: .4byte 0x080C5DDC
_080C5DDC: @ jump table
	.4byte _080C5DFC @ case 0
	.4byte _080C5E0C @ case 1
	.4byte _080C5E12 @ case 2
	.4byte _080C5E24 @ case 3
	.4byte _080C5EAC @ case 4
	.4byte _080C5ED4 @ case 5
	.4byte _080C5F14 @ case 6
	.4byte _080C5F64 @ case 7
_080C5DFC:
	movs r0, #0
	bl SetVBlankCallback
	bl ScanlineEffect_Stop
	bl SetVBlankHBlankCallbacksToNull
	b _080C5F80
_080C5E0C:
	bl ResetGpuRegsAndBgs
	b _080C5F80
_080C5E12:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl reset_temp_tile_data_buffers
	b _080C5F80
_080C5E24:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080C5E9C
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _080C5EA0
	ldr r1, [r4]
	adds r1, #0x12
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _080C5EA4
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _080C5EA8
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	movs r5, #0x1e
	str r5, [sp]
	movs r4, #0x14
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	b _080C5F04
	.align 2, 0
_080C5E9C: .4byte 0x0854AF18
_080C5EA0: .4byte 0x02039994
_080C5EA4: .4byte 0x00001012
_080C5EA8: .4byte 0x00002012
_080C5EAC:
	ldr r0, _080C5ECC
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl PrintOnFrontierMap
	ldr r1, _080C5ED0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _080C5F80
	.align 2, 0
_080C5ECC: .4byte 0x0854AF4C
_080C5ED0: .4byte 0x08548168
_080C5ED4:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C5F8A
	ldr r0, _080C5F0C
	movs r2, #0xd0
	lsls r2, r2, #1
	movs r1, #0
	bl LoadPalette
	movs r0, #0
	bl stdpal_get
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _080C5F10
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
_080C5F04:
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	b _080C5F80
	.align 2, 0
_080C5F0C: .4byte 0x085467E4
_080C5F10: .4byte 0x085498F8
_080C5F14:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	bl InitFrontierMapSprites
	ldr r0, _080C5F5C
	bl SetVBlankCallback
	movs r5, #1
	rsbs r5, r5, #0
	ldr r4, _080C5F60
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl BlendPalettes
	str r4, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _080C5F80
	.align 2, 0
_080C5F5C: .4byte 0x080C4CA9
_080C5F60: .4byte 0x00007FFF
_080C5F64:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080C5F8A
	ldr r0, _080C5F7C
	ldr r0, [r0]
	strh r1, [r0, #4]
	movs r0, #1
	b _080C5F8C
	.align 2, 0
_080C5F7C: .4byte 0x0203998C
_080C5F80:
	ldr r0, _080C5F94
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
_080C5F8A:
	movs r0, #0
_080C5F8C:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C5F94: .4byte 0x0203998C
	thumb_func_end InitFrontierMap

	thumb_func_start ExitFrontierMap
ExitFrontierMap: @ 0x080C5F98
	push {r4, lr}
	sub sp, #4
	ldr r0, _080C5FB0
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #5
	bhi _080C6090
	lsls r0, r0, #2
	ldr r1, _080C5FB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C5FB0: .4byte 0x0203998C
_080C5FB4: .4byte 0x080C5FB8
_080C5FB8: @ jump table
	.4byte _080C5FD0 @ case 0
	.4byte _080C5FE8 @ case 1
	.4byte _080C600E @ case 2
	.4byte _080C601E @ case 3
	.4byte _080C6060 @ case 4
	.4byte _080C606E @ case 5
_080C5FD0:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080C5FE4
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _080C6090
	.align 2, 0
_080C5FE4: .4byte 0x00007FFF
_080C5FE8:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C609A
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl HideBg
	movs r0, #1
	bl HideBg
	movs r0, #2
	bl HideBg
	b _080C6090
_080C600E:
	movs r0, #0
	bl SetVBlankCallback
	bl ScanlineEffect_Stop
	bl SetVBlankHBlankCallbacksToNull
	b _080C6090
_080C601E:
	ldr r4, _080C605C
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _080C6032
	bl DestroySprite
	movs r0, #0
	bl FreeSpriteTilesByTag
_080C6032:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _080C6044
	bl DestroySprite
	movs r0, #1
	bl FreeSpriteTilesByTag
_080C6044:
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _080C6056
	bl DestroySprite
	movs r0, #4
	bl FreeSpriteTilesByTag
_080C6056:
	bl FreeAllWindowBuffers
	b _080C6090
	.align 2, 0
_080C605C: .4byte 0x02039994
_080C6060:
	bl ResetGpuRegsAndBgs
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _080C6090
_080C606E:
	movs r0, #0
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #2
	bl UnsetBgTilemapBuffer
	ldr r0, _080C608C
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #4]
	movs r0, #1
	b _080C609C
	.align 2, 0
_080C608C: .4byte 0x0203998C
_080C6090:
	ldr r0, _080C60A4
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
_080C609A:
	movs r0, #0
_080C609C:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C60A4: .4byte 0x0203998C
	thumb_func_end ExitFrontierMap

	thumb_func_start Task_HandleFrontierMap
Task_HandleFrontierMap: @ 0x080C60A8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080C60CC
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bls _080C60C2
	b _080C61C6
_080C60C2:
	lsls r0, r0, #2
	ldr r1, _080C60D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C60CC: .4byte 0x03005B68
_080C60D0: .4byte 0x080C60D4
_080C60D4: @ jump table
	.4byte _080C60EC @ case 0
	.4byte _080C60F2 @ case 1
	.4byte _080C6158 @ case 2
	.4byte _080C6180 @ case 3
	.4byte _080C61B0 @ case 4
	.4byte _080C61BA @ case 5
_080C60EC:
	bl InitFrontierMap
	b _080C61B4
_080C60F2:
	ldr r0, _080C610C
	ldrh r1, [r0, #0x2e]
	movs r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080C6110
	movs r0, #3
	bl PlaySE
	movs r0, #4
	b _080C61CA
	.align 2, 0
_080C610C: .4byte 0x03002360
_080C6110:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080C6134
	ldr r0, _080C612C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #5
	bls _080C6130
	movs r0, #0
	bl HandleFrontierMapCursorMove
	b _080C61CC
	.align 2, 0
_080C612C: .4byte 0x02039994
_080C6130:
	strh r2, [r4]
	b _080C61CC
_080C6134:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080C61CC
	ldr r0, _080C6150
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _080C6154
	movs r0, #1
	bl HandleFrontierMapCursorMove
	b _080C61CC
	.align 2, 0
_080C6150: .4byte 0x02039994
_080C6154:
	movs r0, #3
	b _080C61CA
_080C6158:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #3
	ble _080C616E
	movs r0, #0
	bl HandleFrontierMapCursorMove
	movs r0, #0
	strh r0, [r4, #2]
	movs r0, #1
	b _080C61CA
_080C616E:
	ldr r0, _080C617C
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldrh r0, [r1, #0x22]
	adds r0, #4
	b _080C61A0
	.align 2, 0
_080C617C: .4byte 0x02039994
_080C6180:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #3
	ble _080C6196
	movs r0, #1
	bl HandleFrontierMapCursorMove
	movs r0, #0
	strh r0, [r4, #2]
	movs r0, #1
	b _080C61CA
_080C6196:
	ldr r0, _080C61AC
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldrh r0, [r1, #0x22]
	subs r0, #4
_080C61A0:
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	b _080C61CC
	.align 2, 0
_080C61AC: .4byte 0x02039994
_080C61B0:
	bl ExitFrontierMap
_080C61B4:
	cmp r0, #0
	bne _080C61C6
	b _080C61CC
_080C61BA:
	adds r0, r2, #0
	bl DestroyTask
	bl FreeFrontierMap
	b _080C61CC
_080C61C6:
	ldrh r0, [r4]
	adds r0, #1
_080C61CA:
	strh r0, [r4]
_080C61CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_HandleFrontierMap

	thumb_func_start MapNumToFrontierFacilityId
MapNumToFrontierFacilityId: @ 0x080C61D4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _080C61F4
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _080C61F0
	adds r0, r1, #0
	subs r0, #0xf
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _080C61F8
_080C61F0:
	movs r0, #1
	b _080C625A
	.align 2, 0
_080C61F4: .4byte 0xFFFB0000
_080C61F8:
	adds r0, r1, #0
	subs r0, #0x12
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bhi _080C6208
	movs r0, #2
	b _080C625A
_080C6208:
	adds r0, r1, #0
	subs r0, #0x16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _080C6218
	movs r0, #3
	b _080C625A
_080C6218:
	adds r0, r1, #0
	subs r0, #0x1c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _080C6228
	movs r0, #4
	b _080C625A
_080C6228:
	adds r0, r1, #0
	subs r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _080C6238
	movs r0, #5
	b _080C625A
_080C6238:
	adds r0, r1, #0
	subs r0, #0x22
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bhi _080C6248
	movs r0, #6
	b _080C625A
_080C6248:
	adds r0, r1, #0
	subs r0, #0x19
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080C6258
	movs r0, #0
	b _080C625A
_080C6258:
	movs r0, #7
_080C625A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MapNumToFrontierFacilityId

	thumb_func_start InitFrontierMapSprites
InitFrontierMapSprites: @ 0x080C6260
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	movs r7, #0
	bl FreeAllSpritePalettes
	ldr r0, _080C6368
	bl LoadSpritePalettes
	ldr r6, _080C636C
	adds r0, r6, #0
	bl LoadCompressedSpriteSheet
	ldr r0, _080C6370
	mov r8, r0
	ldr r4, _080C6374
	ldr r0, [r4]
	ldrb r2, [r0, #0x10]
	lsls r2, r2, #4
	adds r2, #8
	mov r0, r8
	movs r1, #0x9b
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [r4]
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r2, _080C6378
	mov sb, r2
	add r1, sb
	str r1, [r0, #4]
	ldrb r2, [r1, #5]
	movs r5, #0xd
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r2
	strb r0, [r1, #5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	adds r1, #0x3f
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0, #4]
	movs r1, #1
	bl StartSpriteAnim
	adds r6, #8
	adds r0, r6, #0
	bl LoadCompressedSpriteSheet
	movs r3, #0x18
	add r8, r3
	ldr r6, _080C637C
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	adds r0, r0, r6
	movs r2, #8
	ldrsh r1, [r0, r2]
	movs r3, #0xa
	ldrsh r2, [r0, r3]
	mov r0, r8
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, [r4]
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, sb
	str r0, [r1, #0xc]
	ldrb r1, [r0, #5]
	ands r5, r1
	strb r5, [r0, #5]
	ldr r1, [r4]
	ldr r0, [r1, #0xc]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #4
	adds r1, r1, r6
	ldrb r1, [r1, #0xc]
	bl StartSpriteAnim
	bl GetCurrentRegionMapSectionId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3a
	beq _080C632C
	cmp r5, #0xca
	beq _080C632C
	b _080C6466
_080C632C:
	ldr r4, _080C6380
	ldr r2, [r4]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r0, #4
	beq _080C633E
	cmp r0, #0xe
	bne _080C6384
	movs r7, #0x37
_080C633E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r6, [r2]
	adds r0, r0, r6
	ldrh r4, [r2, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080C6352
	adds r0, #7
_080C6352:
	lsls r0, r0, #0xd
	lsrs r7, r0, #0x10
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080C6360
	adds r0, #7
_080C6360:
	lsls r0, r0, #0xd
	lsrs r4, r0, #0x10
	movs r5, #0
	b _080C63DE
	.align 2, 0
_080C6368: .4byte 0x0854B008
_080C636C: .4byte 0x0854AFE0
_080C6370: .4byte 0x0854B0D8
_080C6374: .4byte 0x02039994
_080C6378: .4byte 0x020205AC
_080C637C: .4byte 0x0854B174
_080C6380: .4byte 0x03005AEC
_080C6384:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl MapNumToFrontierFacilityId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080C63A0
	subs r0, r5, #1
	lsls r0, r0, #4
	adds r0, r0, r6
	ldrh r7, [r0, #8]
	ldrh r4, [r0, #0xa]
	b _080C63DE
_080C63A0:
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bne _080C63BA
	ldrh r0, [r1, #0x28]
	adds r0, #0x37
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _080C63BC
_080C63BA:
	ldrh r7, [r1, #0x28]
_080C63BC:
	ldr r0, _080C6408
	ldr r0, [r0]
	ldrh r4, [r0, #0x2a]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080C63CC
	adds r0, #7
_080C63CC:
	lsls r0, r0, #0xd
	lsrs r7, r0, #0x10
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080C63DA
	adds r0, #7
_080C63DA:
	lsls r0, r0, #0xd
	lsrs r4, r0, #0x10
_080C63DE:
	ldr r0, _080C640C
	bl LoadCompressedSpriteSheet
	mov r1, sp
	ldr r0, _080C6410
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	mov r1, sp
	ldr r0, _080C6414
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	adds r0, #4
	strh r0, [r1, #2]
	cmp r5, #0
	beq _080C6418
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	b _080C642A
	.align 2, 0
_080C6408: .4byte 0x03005AEC
_080C640C: .4byte 0x0854AFF8
_080C6410: .4byte 0x0854B120
_080C6414: .4byte 0x03005AF0
_080C6418:
	lsls r1, r7, #0x13
	lsls r2, r4, #0x13
	movs r0, #0xa0
	lsls r0, r0, #0xd
	adds r1, r1, r0
	asrs r1, r1, #0x10
	movs r3, #0x90
	lsls r3, r3, #0xe
	adds r2, r2, r3
_080C642A:
	asrs r2, r2, #0x10
	mov r0, sp
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r4, _080C6474
	ldr r2, [r4]
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r0, _080C6478
	adds r1, r1, r0
	str r1, [r2, #8]
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	ldr r0, _080C647C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _080C6466
	ldr r0, [r4]
	ldr r0, [r0, #8]
	movs r1, #1
	bl StartSpriteAnim
_080C6466:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6474: .4byte 0x02039994
_080C6478: .4byte 0x020205AC
_080C647C: .4byte 0x03005AF0
	thumb_func_end InitFrontierMapSprites

	thumb_func_start PrintOnFrontierMap
PrintOnFrontierMap: @ 0x080C6480
	push {r4, r5, r6, lr}
	sub sp, #0xc
	movs r4, #0
_080C6486:
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080C6486
	movs r4, #0
	movs r6, #0
	ldr r5, _080C64D0
_080C64A4:
	ldr r0, _080C64D4
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r4, r0
	bne _080C64DC
	lsls r1, r4, #4
	adds r3, r1, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _080C64D8
	str r0, [sp]
	str r6, [sp, #4]
	adds r1, r1, r5
	ldr r0, [r1]
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #4
	bl AddTextPrinterParameterized3
	b _080C64FA
	.align 2, 0
_080C64D0: .4byte 0x0854B174
_080C64D4: .4byte 0x02039994
_080C64D8: .4byte 0x0854AF72
_080C64DC:
	lsls r1, r4, #4
	adds r3, r1, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _080C654C
	str r0, [sp]
	str r6, [sp, #4]
	adds r1, r1, r5
	ldr r0, [r1]
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #4
	bl AddTextPrinterParameterized3
_080C64FA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080C64A4
	ldr r0, _080C6550
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C6554
	ldr r0, _080C6558
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r2, #4
	movs r3, #1
	bl AddTextPrinterParameterized3
	movs r4, #0
_080C652C:
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080C652C
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C654C: .4byte 0x0854AF6F
_080C6550: .4byte 0x0854AF6C
_080C6554: .4byte 0x0854B174
_080C6558: .4byte 0x02039994
	thumb_func_end PrintOnFrontierMap

	thumb_func_start HandleFrontierMapCursorMove
HandleFrontierMapCursorMove: @ 0x080C655C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C6578
	ldr r0, _080C6574
	ldr r4, [r0]
	ldrb r5, [r4, #0x10]
	adds r0, r5, #6
	b _080C6580
	.align 2, 0
_080C6574: .4byte 0x02039994
_080C6578:
	ldr r0, _080C6660
	ldr r4, [r0]
	ldrb r5, [r4, #0x10]
	adds r0, r5, #1
_080C6580:
	movs r1, #7
	bl __modsi3
	strb r0, [r4, #0x10]
	lsls r0, r5, #4
	adds r3, r0, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r6, _080C6664
	str r6, [sp]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #4]
	ldr r4, _080C6668
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #4
	bl AddTextPrinterParameterized3
	ldr r5, _080C6660
	ldr r1, [r5]
	ldrb r3, [r1, #0x10]
	lsls r3, r3, #4
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r6, #3
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	ldrb r0, [r1, #0x10]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #4
	bl AddTextPrinterParameterized3
	ldr r1, [r5]
	ldr r2, [r1, #4]
	ldrb r0, [r1, #0x10]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r2, #0x22]
	ldr r0, [r1, #0xc]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #4
	adds r1, r1, r4
	ldrb r1, [r1, #0xc]
	bl StartSpriteAnim
	ldr r1, [r5]
	ldr r2, [r1, #0xc]
	ldrb r0, [r1, #0x10]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrh r0, [r0, #8]
	strh r0, [r2, #0x20]
	ldr r2, [r1, #0xc]
	ldrb r0, [r1, #0x10]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrh r0, [r0, #0xa]
	strh r0, [r2, #0x22]
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	subs r6, #3
	str r6, [sp]
	mov r1, r8
	str r1, [sp, #4]
	ldr r0, [r5]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r2, #4
	movs r3, #1
	bl AddTextPrinterParameterized3
	movs r4, #0
_080C6636:
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080C6636
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #0x6c
	bl PlaySE
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6660: .4byte 0x02039994
_080C6664: .4byte 0x0854AF6F
_080C6668: .4byte 0x0854B174
	thumb_func_end HandleFrontierMapCursorMove

	thumb_func_start sub_080C666C
sub_080C666C: @ 0x080C666C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x1c]
	lsls r2, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r2, #0
	bne _080C6686
	movs r3, #0
_080C6686:
	movs r0, #0xf
	movs r1, #0xe
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0x20]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_080C6738
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080C666C

	thumb_func_start sub_080C66A4
sub_080C66A4: @ 0x080C66A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r6, #0
_080C66BC:
	movs r3, #0
	ldrb r0, [r4]
	adds r1, r0, #0
	adds r2, r0, #0
	cmp r1, #0xff
	beq _080C672A
_080C66C8:
	mov r0, sp
	adds r0, r0, r3
	adds r0, #8
	strb r2, [r0]
	adds r4, #1
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bhi _080C6704
	ldrb r0, [r4]
	adds r1, r0, #0
	adds r2, r0, #0
	cmp r1, #0xff
	bne _080C66C8
	cmp r3, #0
	beq _080C672A
	movs r6, #1
	cmp r3, #3
	bhi _080C6704
	movs r2, #0
_080C66F2:
	adds r0, r3, #0
	adds r1, r0, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	add r0, sp
	adds r0, #8
	strb r2, [r0]
	cmp r3, #3
	bls _080C66F2
_080C6704:
	mov r1, sp
	adds r1, r1, r3
	adds r1, #8
	movs r0, #0xff
	strb r0, [r1]
	str r7, [sp]
	ldr r0, [sp, #0x28]
	str r0, [sp, #4]
	add r0, sp, #8
	adds r1, r5, #0
	mov r2, r8
	movs r3, #0x80
	bl sub_080C666C
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	cmp r6, #0
	beq _080C66BC
_080C672A:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C66A4

	thumb_func_start sub_080C6738
sub_080C6738: @ 0x080C6738
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r6, r3, #0
	ldr r0, [sp, #0x4c]
	mov sb, r0
	ldr r1, [sp, #0x50]
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x28]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r2, sb
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	bl StringLength_Multibyte
	lsls r0, r0, #0x18
	ldr r2, _080C6824
	ldr r1, [sp, #0x18]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, #0x18]
	ldr r1, _080C6828
	add r2, sp, #0x18
	mov r8, r2
	ldr r0, [r2, #4]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #4]
	ldr r5, [sp, #0x18]
	lsrs r5, r5, #0x18
	lsls r5, r5, #5
	mov r0, r8
	bl AddWindow
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r6, #4
	orrs r1, r6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	movs r1, #7
	bl GetWindowAttribute
	adds r7, r0, #0
	mov r0, r8
	ldrb r0, [r0, #3]
	lsls r0, r0, #5
	mov r8, r0
	add r8, r7
	add r0, sp, #0x14
	movs r1, #0
	strb r6, [r0]
	mov r2, sb
	strb r2, [r0, #1]
	mov r2, sl
	strb r2, [r0, #2]
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized4
	lsrs r5, r5, #1
	adds r0, r7, #0
	ldr r1, [sp, #0x24]
	adds r2, r5, #0
	bl CpuSet
	ldr r2, [sp, #0x24]
	ldr r0, [sp, #0x28]
	adds r1, r2, r0
	mov r0, r8
	adds r2, r5, #0
	bl CpuSet
	adds r0, r4, #0
	bl RemoveWindow
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6824: .4byte 0x00FFFFFF
_080C6828: .4byte 0xFFFFFF00
	thumb_func_end sub_080C6738

