.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_080F5FBC
sub_080F5FBC: @ 0x080F5FBC
	push {r4, lr}
	movs r0, #0
	movs r1, #0x40
	bl SetGpuReg
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080F60D0
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r4, #0
_080F5FD8:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080F60D4
	ldr r1, [r1]
	lsls r2, r4, #2
	adds r1, #0xc
	adds r1, r1, r2
	ldr r1, [r1]
	bl SetBgTilemapBuffer
	adds r4, #1
	cmp r4, #3
	ble _080F5FD8
	ldr r0, _080F60D8
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	ldr r1, _080F60DC
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _080F60E0
	movs r0, #0x4a
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
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
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
	movs r1, #0xff
	lsls r1, r1, #8
	movs r0, #0
	bl SetGpuRegBits
	ldr r0, _080F60E4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080F60E8
	strh r1, [r0]
	ldr r0, _080F60EC
	strh r1, [r0]
	ldr r0, _080F60F0
	strh r1, [r0]
	ldr r0, _080F60F4
	strh r1, [r0]
	ldr r0, _080F60F8
	strh r1, [r0]
	ldr r0, _080F60FC
	strh r1, [r0]
	ldr r0, _080F6100
	strh r1, [r0]
	ldr r0, _080F6104
	strh r1, [r0]
	ldr r0, _080F6108
	strh r1, [r0]
	ldr r0, _080F610C
	strh r1, [r0]
	ldr r0, _080F6110
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F60D0: .4byte 0x0856944C
_080F60D4: .4byte 0x02039D00
_080F60D8: .4byte 0x0856945C
_080F60DC: .4byte 0x00003F3F
_080F60E0: .4byte 0x00003F2E
_080F60E4: .4byte 0x02022AC8
_080F60E8: .4byte 0x02022ACA
_080F60EC: .4byte 0x02022ACC
_080F60F0: .4byte 0x02022ACE
_080F60F4: .4byte 0x02022AD0
_080F60F8: .4byte 0x02022AD2
_080F60FC: .4byte 0x02022AD4
_080F6100: .4byte 0x02022AD6
_080F6104: .4byte 0x02022AD8
_080F6108: .4byte 0x02022ADA
_080F610C: .4byte 0x02022ADC
_080F6110: .4byte 0x02022ADE
	thumb_func_end sub_080F5FBC

	thumb_func_start sub_080F6114
sub_080F6114: @ 0x080F6114
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _080F61CC
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZDecompressWram
	ldr r1, _080F61D0
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _080F61D4
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _080F61D8
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	bl sub_080F7A3C
	ldr r0, _080F61DC
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl LoadCompressedPalette
	ldr r0, _080F61E0
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r7, #0
	movs r0, #1
	mov r8, r0
_080F616E:
	lsls r5, r7, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	movs r1, #1
	bl sub_080F7BA0
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #1
	bl sub_080F7BF4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r6, #0
	lsls r1, r7, #1
	adds r2, r7, #1
	str r2, [sp, #0xc]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sl, r4
	adds r1, r1, r7
	adds r0, r1, #6
	lsls r0, r0, #0x18
	mov sb, r0
	adds r1, #5
	lsls r7, r1, #0x18
_080F61A8:
	ldr r1, _080F61E4
	cmp r6, sl
	bge _080F61B0
	adds r1, #2
_080F61B0:
	ldr r4, [sp, #8]
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	adds r2, r0, #0
	cmp r0, #0
	bge _080F61BE
	rsbs r2, r0, #0
_080F61BE:
	cmp r6, r2
	bge _080F61EC
	ldr r5, _080F61E8
	cmp r0, #0
	bge _080F61EE
	adds r5, #2
	b _080F61EE
	.align 2, 0
_080F61CC: .4byte 0x08C196CC
_080F61D0: .4byte 0x08C1A174
_080F61D4: .4byte 0x08C1A048
_080F61D8: .4byte 0x08C19F34
_080F61DC: .4byte 0x08C1A2FC
_080F61E0: .4byte 0x0856915C
_080F61E4: .4byte 0x000060B2
_080F61E8: .4byte 0x000060A4
_080F61EC:
	ldr r5, _080F6268
_080F61EE:
	adds r4, r6, #0
	adds r4, #0x13
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, r8
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	adds r2, r4, #0
	lsrs r3, r7, #0x18
	bl FillBgTilemapBufferRect_Palette0
	mov r2, r8
	str r2, [sp]
	str r2, [sp, #4]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r4, sb
	lsrs r3, r4, #0x18
	bl FillBgTilemapBufferRect_Palette0
	adds r6, #1
	cmp r6, #9
	ble _080F61A8
	ldr r7, [sp, #0xc]
	cmp r7, #3
	ble _080F616E
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6268: .4byte 0x000060A2
	thumb_func_end sub_080F6114

	thumb_func_start sub_080F626C
sub_080F626C: @ 0x080F626C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080F6288
	ldrb r0, [r0]
	cmp r6, r0
	bne _080F6294
	ldr r0, _080F628C
	ldr r1, _080F6290
	bl StringCopy
	adds r5, r0, #0
	b _080F6296
	.align 2, 0
_080F6288: .4byte 0x02039BC5
_080F628C: .4byte 0x02022AE0
_080F6290: .4byte 0x085CC4E0
_080F6294:
	ldr r5, _080F62E0
_080F6296:
	lsls r4, r6, #6
	ldr r1, _080F62E4
	adds r1, r4, r1
	adds r0, r5, #0
	bl StringCopy
	ldr r5, _080F62E0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080F8760
	ldr r0, _080F62E8
	ldrb r0, [r0]
	cmp r6, r0
	bne _080F62BE
	ldr r1, _080F62EC
	adds r0, r5, #0
	bl StringCopy
	adds r5, r0, #0
_080F62BE:
	ldr r1, _080F62F0
	adds r0, r5, #0
	bl StringCopy
	ldr r1, _080F62F4
	adds r1, r4, r1
	adds r0, r5, #0
	bl StringAppend
	adds r0, r6, #4
	ldr r1, _080F62E0
	bl sub_080F8760
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F62E0: .4byte 0x02022AE0
_080F62E4: .4byte 0x02039AA2
_080F62E8: .4byte 0x02039BC5
_080F62EC: .4byte 0x085CC4E0
_080F62F0: .4byte 0x085C93FF
_080F62F4: .4byte 0x02039AAD
	thumb_func_end sub_080F626C

	thumb_func_start sub_080F62F8
sub_080F62F8: @ 0x080F62F8
	push {r4, lr}
	movs r4, #0
_080F62FC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080F626C
	adds r4, #1
	cmp r4, #3
	ble _080F62FC
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F62F8

	thumb_func_start sub_080F6318
sub_080F6318: @ 0x080F6318
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _080F63D8
	ldrb r0, [r5, #8]
	movs r6, #0x80
	orrs r0, r6
	strb r0, [r5, #8]
	movs r0, #0
	bl SetVBlankCallback
	bl sub_080F8684
	bl sub_080F5FBC
	bl ScanlineEffect_Clear
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl sub_080F6114
	bl sub_080F72C0
	movs r0, #0
	movs r1, #1
	bl LoadAllContestMonIcons
	bl sub_080F62F8
	ldr r4, _080F63DC
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x18
	bl memset
	ldr r0, [r4]
	ldr r0, [r0, #4]
	movs r1, #0
	movs r2, #0x50
	bl memset
	bl sub_080F760C
	bl sub_080F730C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldrb r1, [r5, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r5, #8]
	ldr r0, _080F63E0
	movs r1, #5
	bl CreateTask
	ldr r1, [r4]
	ldr r1, [r1]
	strb r0, [r1, #2]
	ldr r0, _080F63E4
	bl SetMainCallback2
	ldr r1, _080F63E8
	movs r0, #0xf0
	strh r0, [r1]
	ldr r1, _080F63EC
	ldr r2, _080F63F0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080F63F4
	movs r1, #0x14
	bl CreateTask
	bl sub_080F8110
	ldr r0, _080F63F8
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080F63FC
	ldrb r0, [r5, #8]
	orrs r0, r6
	strb r0, [r5, #8]
	b _080F6404
	.align 2, 0
_080F63D8: .4byte 0x02037C74
_080F63DC: .4byte 0x02039D00
_080F63E0: .4byte 0x080F64FD
_080F63E4: .4byte 0x080F6419
_080F63E8: .4byte 0x02022ADC
_080F63EC: .4byte 0x02022ADE
_080F63F0: .4byte 0x000080A0
_080F63F4: .4byte 0x080F70D9
_080F63F8: .4byte 0x02039BCA
_080F63FC:
	movs r0, #0xdf
	lsls r0, r0, #1
	bl PlayBGM
_080F6404:
	ldr r0, _080F6414
	bl SetVBlankCallback
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F6414: .4byte 0x080F643D
	thumb_func_end sub_080F6318

	thumb_func_start sub_080F6418
sub_080F6418: @ 0x080F6418
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F6418

	thumb_func_start sub_080F643C
sub_080F643C: @ 0x080F643C
	push {lr}
	ldr r0, _080F64CC
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, _080F64D0
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r0, _080F64D4
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, _080F64D8
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, _080F64DC
	ldrh r1, [r0]
	movs r0, #0x18
	bl SetGpuReg
	ldr r0, _080F64E0
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, _080F64E4
	ldrh r1, [r0]
	movs r0, #0x1c
	bl SetGpuReg
	ldr r0, _080F64E8
	ldrh r1, [r0]
	movs r0, #0x1e
	bl SetGpuReg
	ldr r0, _080F64EC
	ldrh r1, [r0]
	movs r0, #0x40
	bl SetGpuReg
	ldr r0, _080F64F0
	ldrh r1, [r0]
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, _080F64F4
	ldrh r1, [r0]
	movs r0, #0x42
	bl SetGpuReg
	ldr r0, _080F64F8
	ldrh r1, [r0]
	movs r0, #0x46
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080F64CC: .4byte 0x02022AC8
_080F64D0: .4byte 0x02022ACA
_080F64D4: .4byte 0x02022ACC
_080F64D8: .4byte 0x02022ACE
_080F64DC: .4byte 0x02022AD0
_080F64E0: .4byte 0x02022AD2
_080F64E4: .4byte 0x02022AD4
_080F64E8: .4byte 0x02022AD6
_080F64EC: .4byte 0x02022AD8
_080F64F0: .4byte 0x02022ADA
_080F64F4: .4byte 0x02022ADC
_080F64F8: .4byte 0x02022ADE
	thumb_func_end sub_080F643C

	thumb_func_start sub_080F64FC
sub_080F64FC: @ 0x080F64FC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, _080F6530
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080F6510
	b _080F6646
_080F6510:
	ldr r2, _080F6534
	lsls r1, r6, #2
	adds r0, r1, r6
	lsls r0, r0, #3
	adds r4, r0, r2
	movs r2, #8
	ldrsh r0, [r4, r2]
	adds r7, r1, #0
	cmp r0, #1
	beq _080F65F8
	cmp r0, #1
	bgt _080F6538
	cmp r0, #0
	beq _080F6542
	b _080F6646
	.align 2, 0
_080F6530: .4byte 0x02039BCA
_080F6534: .4byte 0x03005B60
_080F6538:
	cmp r0, #2
	beq _080F660C
	cmp r0, #3
	beq _080F6622
	b _080F6646
_080F6542:
	bl SaveLinkContestResults
	ldr r1, _080F65D4
	ldr r0, _080F65D8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F6570
	movs r0, #0x23
	bl IncrementGameStat
	ldr r1, _080F65DC
	movs r0, #8
	strh r0, [r1]
	bl InterviewBefore
	ldr r0, _080F65E0
	ldrh r0, [r0]
	cmp r0, #1
	beq _080F6570
	bl InterviewAfter
_080F6570:
	movs r0, #2
	bl sub_0813BB14
	ldr r0, _080F65E4
	ldrb r0, [r0]
	bl sub_080DE4B0
	movs r0, #0xfe
	bl sub_080DE4B0
	ldr r1, _080F65E8
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xfe
	movs r1, #0
	bl sub_080DE6B0
	ldr r1, _080F65EC
	strb r0, [r1]
	ldr r5, _080F65F0
	adds r0, r5, #0
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0
	bl VarSet
	bl SetContinueGameWarpStatusToDynamicWarp
	movs r0, #1
	bl TrySavingData
	bl ClearContinueGameWarpStatus
	adds r0, r5, #0
	adds r1, r4, #0
	bl VarSet
	ldr r0, _080F65F4
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080F6646
	.align 2, 0
_080F65D4: .4byte 0x02039BC0
_080F65D8: .4byte 0x02039BC5
_080F65DC: .4byte 0x02037282
_080F65E0: .4byte 0x02037290
_080F65E4: .4byte 0x02039BCE
_080F65E8: .4byte 0x02039BFC
_080F65EC: .4byte 0x02039BFD
_080F65F0: .4byte 0x00004086
_080F65F4: .4byte 0x03005B60
_080F65F8:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldrb r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080F6646
	movs r0, #0x64
	b _080F6644
_080F660C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080F66D2
	bl sub_0800A8D4
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080F66D2
_080F6622:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080F66D2
	movs r0, #0xdf
	lsls r0, r0, #1
	bl PlayBGM
	ldr r2, _080F667C
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	ldrh r0, [r4, #8]
	adds r0, #1
_080F6644:
	strh r0, [r4, #8]
_080F6646:
	ldr r0, _080F667C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080F66D2
	ldr r1, _080F6680
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	strh r2, [r4, #8]
	ldr r0, _080F6684
	ldrb r1, [r0]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080F6690
	ldr r0, _080F6688
	bl sub_080F78E8
	ldr r0, _080F668C
	b _080F66D0
	.align 2, 0
_080F667C: .4byte 0x02037C74
_080F6680: .4byte 0x03005B60
_080F6684: .4byte 0x02039BCA
_080F6688: .4byte 0x085CC4D5
_080F668C: .4byte 0x080F66F1
_080F6690:
	movs r0, #0x24
	bl IncrementGameStat
	ldr r1, _080F66D8
	ldr r0, _080F66DC
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F66AA
	movs r0, #0x25
	bl IncrementGameStat
_080F66AA:
	ldr r0, _080F66E0
	ldrb r0, [r0]
	bl sub_080DE4B0
	movs r0, #0xfe
	bl sub_080DE4B0
	ldr r0, _080F66E4
	strb r5, [r0]
	movs r0, #0xfe
	movs r1, #0
	bl sub_080DE6B0
	ldr r1, _080F66E8
	strb r0, [r1]
	movs r0, #2
	bl sub_0813BB14
	ldr r0, _080F66EC
_080F66D0:
	str r0, [r4]
_080F66D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F66D8: .4byte 0x02039BC0
_080F66DC: .4byte 0x02039BC5
_080F66E0: .4byte 0x02039BCE
_080F66E4: .4byte 0x02039BFC
_080F66E8: .4byte 0x02039BFD
_080F66EC: .4byte 0x080F678D
	thumb_func_end sub_080F64FC

	thumb_func_start sub_080F66F0
sub_080F66F0: @ 0x080F66F0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080F671C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080F6714
	ldr r0, _080F6720
	movs r1, #0
	bl CreateTask
	ldr r1, _080F6724
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080F6728
	str r1, [r0]
_080F6714:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F671C: .4byte 0x030031C4
_080F6720: .4byte 0x080F672D
_080F6724: .4byte 0x03005B60
_080F6728: .4byte 0x080A8A41
	thumb_func_end sub_080F66F0

	thumb_func_start sub_080F672C
sub_080F672C: @ 0x080F672C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080F6740
	ldr r2, _080F6744
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080F6740: .4byte 0x080FD1ED
_080F6744: .4byte 0x080F6749
	thumb_func_end sub_080F672C

	thumb_func_start sub_080F6748
sub_080F6748: @ 0x080F6748
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080F6778
	adds r0, r4, #0
	bl DestroyTask
	ldr r2, _080F6780
	ldr r0, _080F6784
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _080F6788
	str r1, [r0]
	bl sub_080F79B8
_080F6778:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6780: .4byte 0x03005B60
_080F6784: .4byte 0x02039D00
_080F6788: .4byte 0x080F678D
	thumb_func_end sub_080F6748

	thumb_func_start sub_080F678C
sub_080F678C: @ 0x080F678C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080F67D4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r2
	ldrh r1, [r5, #8]
	movs r2, #8
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _080F67E4
	ldr r0, _080F67D8
	movs r1, #0x14
	bl CreateTask
	ldr r4, _080F67DC
	ldr r0, _080F67E0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080F739C
	adds r0, r4, #0
	bl sub_080F76E8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x88
	lsls r3, r3, #3
	movs r1, #0x90
	movs r2, #0x78
	b _080F683E
	.align 2, 0
_080F67D4: .4byte 0x03005B60
_080F67D8: .4byte 0x080F7115
_080F67DC: .4byte 0x085CC4A3
_080F67E0: .4byte 0x02039D00
_080F67E4:
	cmp r0, #1
	bne _080F67FC
	ldr r0, _080F67F8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080F6870
	b _080F6810
	.align 2, 0
_080F67F8: .4byte 0x02039D00
_080F67FC:
	cmp r0, #2
	bne _080F6818
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bne _080F6870
	movs r0, #0
_080F6810:
	strh r0, [r5, #0xa]
	adds r0, r1, #1
	strh r0, [r5, #8]
	b _080F6870
_080F6818:
	cmp r0, #3
	bne _080F6858
	ldr r4, _080F684C
	ldr r0, _080F6850
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080F739C
	adds r0, r4, #0
	bl sub_080F76E8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _080F6854
	movs r3, #0x88
	lsls r3, r3, #3
	movs r1, #0x90
_080F683E:
	bl sub_080F7708
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _080F6870
	.align 2, 0
_080F684C: .4byte 0x085CC4AE
_080F6850: .4byte 0x02039D00
_080F6854: .4byte 0x0000FFFF
_080F6858:
	cmp r0, #4
	bne _080F6870
	ldr r0, _080F6878
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #2
	bne _080F6870
	movs r0, #0
	strh r0, [r5, #8]
	ldr r0, _080F687C
	str r0, [r5]
_080F6870:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6878: .4byte 0x02039D00
_080F687C: .4byte 0x080F6881
	thumb_func_end sub_080F678C

	thumb_func_start sub_080F6880
sub_080F6880: @ 0x080F6880
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080F68A4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080F68E8
	cmp r0, #1
	bgt _080F68A8
	cmp r0, #0
	beq _080F68AE
	b _080F690E
	.align 2, 0
_080F68A4: .4byte 0x03005B60
_080F68A8:
	cmp r0, #2
	beq _080F68FC
	b _080F690E
_080F68AE:
	ldr r5, _080F68DC
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _080F690E
	ldrh r1, [r4, #0xc]
	adds r0, r1, #1
	strh r0, [r4, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_080F8310
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _080F68E0
	movs r0, #2
	strh r0, [r4, #8]
	b _080F690E
	.align 2, 0
_080F68DC: .4byte 0x02039D00
_080F68E0:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080F690E
_080F68E8:
	ldr r0, _080F68F8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _080F690E
	strh r0, [r4, #8]
	b _080F690E
	.align 2, 0
_080F68F8: .4byte 0x02039D00
_080F68FC:
	movs r0, #0x88
	lsls r0, r0, #3
	bl sub_080F7760
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xc]
	ldr r0, _080F6914
	str r0, [r4]
_080F690E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6914: .4byte 0x080F6919
	thumb_func_end sub_080F6880

	thumb_func_start sub_080F6918
sub_080F6918: @ 0x080F6918
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r4, r2, #0
	ldr r0, _080F696C
	ldr r5, [r0]
	ldr r0, [r5]
	ldrb r3, [r0, #4]
	cmp r3, #0
	bne _080F697C
	ldr r1, _080F6970
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bne _080F698E
	strh r3, [r1, #0xa]
	ldr r4, _080F6974
	ldr r0, [r5]
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080F739C
	adds r0, r4, #0
	bl sub_080F76E8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _080F6978
	movs r3, #0x88
	lsls r3, r3, #3
	movs r1, #0x90
	bl sub_080F7708
	b _080F698E
	.align 2, 0
_080F696C: .4byte 0x02039D00
_080F6970: .4byte 0x03005B60
_080F6974: .4byte 0x085CC4BA
_080F6978: .4byte 0x0000FFFF
_080F697C:
	cmp r3, #2
	bne _080F698E
	ldr r0, _080F6994
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080F6998
	str r0, [r1]
_080F698E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6994: .4byte 0x03005B60
_080F6998: .4byte 0x080F699D
	thumb_func_end sub_080F6918

	thumb_func_start sub_080F699C
sub_080F699C: @ 0x080F699C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080F69C0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080F6A04
	cmp r0, #1
	bgt _080F69C4
	cmp r0, #0
	beq _080F69CA
	b _080F6A28
	.align 2, 0
_080F69C0: .4byte 0x03005B60
_080F69C4:
	cmp r0, #2
	beq _080F6A18
	b _080F6A28
_080F69CA:
	ldr r5, _080F69F8
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _080F6A28
	ldrh r1, [r4, #0xc]
	adds r0, r1, #1
	strh r0, [r4, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	bl sub_080F8310
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _080F69FC
	movs r0, #2
	strh r0, [r4, #8]
	b _080F6A28
	.align 2, 0
_080F69F8: .4byte 0x02039D00
_080F69FC:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080F6A28
_080F6A04:
	ldr r0, _080F6A14
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _080F6A28
	strh r0, [r4, #8]
	b _080F6A28
	.align 2, 0
_080F6A14: .4byte 0x02039D00
_080F6A18:
	movs r0, #0x88
	lsls r0, r0, #3
	bl sub_080F7760
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, _080F6A30
	str r0, [r4]
_080F6A28:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6A30: .4byte 0x080F6A35
	thumb_func_end sub_080F699C

	thumb_func_start sub_080F6A34
sub_080F6A34: @ 0x080F6A34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080F6A5C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #5
	bls _080F6A52
	b _080F6C1C
_080F6A52:
	lsls r0, r0, #2
	ldr r1, _080F6A60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F6A5C: .4byte 0x03005B60
_080F6A60: .4byte 0x080F6A64
_080F6A64: @ jump table
	.4byte _080F6A7C @ case 0
	.4byte _080F6AA0 @ case 1
	.4byte _080F6ABE @ case 2
	.4byte _080F6AF8 @ case 3
	.4byte _080F6B60 @ case 4
	.4byte _080F6C0C @ case 5
_080F6A7C:
	ldr r0, _080F6A9C
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080F6A8A
	b _080F6C1C
_080F6A8A:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _080F6C1C
	.align 2, 0
_080F6A9C: .4byte 0x02039D00
_080F6AA0:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	beq _080F6AB8
	b _080F6C1C
_080F6AB8:
	movs r0, #0
	strh r0, [r1, #0xa]
	b _080F6BE4
_080F6ABE:
	movs r4, #0
	lsls r6, r5, #2
	ldr r7, _080F6AEC
_080F6AC4:
	ldr r0, _080F6AF0
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r7
	ldr r0, _080F6AF4
	adds r0, r4, r0
	ldrb r0, [r0]
	strh r0, [r1, #8]
	strh r4, [r1, #0xa]
	adds r4, #1
	cmp r4, #3
	ble _080F6AC4
	b _080F6BDC
	.align 2, 0
_080F6AEC: .4byte 0x03005B60
_080F6AF0: .4byte 0x080F7C6D
_080F6AF4: .4byte 0x02039BC0
_080F6AF8:
	ldr r0, _080F6B54
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #4
	beq _080F6B06
	b _080F6C1C
_080F6B06:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	beq _080F6B1E
	b _080F6C1C
_080F6B1E:
	movs r0, #0
	strh r0, [r4, #0xa]
	ldr r0, _080F6B58
	movs r1, #0xa
	bl CreateTask
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r4, #0
	ldr r1, _080F6B5C
	ldrb r0, [r1]
	cmp r0, #0
	beq _080F6B48
_080F6B3A:
	adds r4, #1
	cmp r4, #3
	bgt _080F6B48
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F6B3A
_080F6B48:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xe
	bl sub_080F8070
	b _080F6C1C
	.align 2, 0
_080F6B54: .4byte 0x02039D00
_080F6B58: .4byte 0x080F7D4D
_080F6B5C: .4byte 0x02039BC0
_080F6B60:
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r6, r1, #0
	cmp r0, #0x15
	bne _080F6C1C
	movs r0, #0
	strh r0, [r2, #0xa]
	movs r4, #0
	ldr r1, _080F6BEC
	ldrb r0, [r1]
	ldr r2, _080F6BF0
	ldr r7, _080F6BF4
	cmp r0, #0
	beq _080F6B98
_080F6B8A:
	adds r4, #1
	cmp r4, #3
	bgt _080F6B98
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F6B8A
_080F6B98:
	lsls r4, r4, #6
	adds r1, r4, r7
	adds r0, r2, #0
	bl StringCopy
	ldr r0, _080F6BF8
	adds r1, r7, #0
	subs r1, #0xb
	adds r4, r4, r1
	adds r1, r4, #0
	bl StringCopy
	ldr r1, _080F6BFC
	mov r0, sp
	bl StringExpandPlaceholders
	ldr r0, _080F6C00
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0]
	mov r0, sp
	bl sub_080F739C
	mov r0, sp
	bl sub_080F76E8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _080F6C04
	movs r3, #0x88
	lsls r3, r3, #3
	movs r1, #0x90
	bl sub_080F7708
_080F6BDC:
	ldr r0, _080F6C08
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
_080F6BE4:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080F6C1C
	.align 2, 0
_080F6BEC: .4byte 0x02039BC0
_080F6BF0: .4byte 0x02021C40
_080F6BF4: .4byte 0x02039AAD
_080F6BF8: .4byte 0x02021C54
_080F6BFC: .4byte 0x085CC4C6
_080F6C00: .4byte 0x02039D00
_080F6C04: .4byte 0x0000FFFF
_080F6C08: .4byte 0x03005B60
_080F6C0C:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #8]
	ldr r1, _080F6C24
	str r1, [r0]
_080F6C1C:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6C24: .4byte 0x080F6C29
	thumb_func_end sub_080F6A34

	thumb_func_start sub_080F6C28
sub_080F6C28: @ 0x080F6C28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080F6C58
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r4, r1, #0
	cmp r0, #5
	bls _080F6C4C
	b _080F6EC0
_080F6C4C:
	lsls r0, r0, #2
	ldr r1, _080F6C5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F6C58: .4byte 0x03005B60
_080F6C5C: .4byte 0x080F6C60
_080F6C60: @ jump table
	.4byte _080F6C78 @ case 0
	.4byte _080F6DB0 @ case 1
	.4byte _080F6E00 @ case 2
	.4byte _080F6E14 @ case 3
	.4byte _080F6E5C @ case 4
	.4byte _080F6EA0 @ case 5
_080F6C78:
	ldr r1, _080F6CE4
	movs r0, #0xf0
	strh r0, [r1]
	ldr r1, _080F6CE8
	ldr r3, _080F6CEC
	adds r0, r3, #0
	strh r0, [r1]
	movs r2, #0
	ldr r1, _080F6CF0
	ldrb r0, [r1]
	lsls r4, r7, #2
	mov sl, r4
	ldr r3, _080F6CF4
	ldr r4, _080F6CF8
	mov sb, r4
	ldr r4, _080F6CFC
	mov ip, r4
	ldr r4, _080F6D00
	mov r8, r4
	cmp r0, #0
	beq _080F6CB0
_080F6CA2:
	adds r2, #1
	cmp r2, #3
	bgt _080F6CB0
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F6CA2
_080F6CB0:
	lsls r1, r2, #6
	adds r0, r1, r3
	ldrh r6, [r0]
	adds r0, r3, #0
	adds r0, #0x38
	adds r0, r1, r0
	ldr r4, [r0]
	adds r0, r3, #0
	adds r0, #0x3c
	adds r1, r1, r0
	ldr r5, [r1]
	mov r0, sb
	ldrb r0, [r0]
	cmp r2, r0
	bne _080F6D04
	lsls r0, r6, #3
	add r0, ip
	mov r2, r8
	ldr r1, [r2]
	ldr r1, [r1, #8]
	adds r2, r6, #0
	adds r3, r4, #0
	bl HandleLoadSpecialPokePic_2
	b _080F6D16
	.align 2, 0
_080F6CE4: .4byte 0x02022AD8
_080F6CE8: .4byte 0x02022ADA
_080F6CEC: .4byte 0x00005050
_080F6CF0: .4byte 0x02039BC0
_080F6CF4: .4byte 0x02039AA0
_080F6CF8: .4byte 0x02039BC5
_080F6CFC: .4byte 0x082DDA1C
_080F6D00: .4byte 0x02024178
_080F6D04:
	lsls r0, r6, #3
	add r0, ip
	mov r3, r8
	ldr r1, [r3]
	ldr r1, [r1, #8]
	adds r2, r6, #0
	adds r3, r4, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
_080F6D16:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl GetMonSpritePalStructFromOtIdPersonality
	adds r4, r0, #0
	bl LoadCompressedSpritePalette
	adds r0, r6, #0
	movs r1, #1
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _080F6D90
	ldrh r1, [r4, #4]
	strh r1, [r0, #2]
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0x50
	movs r3, #0xa
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080F6D94
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r5
	strh r6, [r3, #0x30]
	ldrb r4, [r3, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r4
	strb r1, [r3, #5]
	adds r5, #0x1c
	adds r2, r2, r5
	ldr r1, _080F6D98
	str r1, [r2]
	ldr r1, _080F6D9C
	ldr r1, [r1]
	ldr r1, [r1]
	strb r0, [r1, #8]
	ldr r0, _080F6DA0
	bl LoadCompressedSpriteSheet
	ldr r0, _080F6DA4
	bl LoadCompressedSpritePalette
	ldr r0, _080F6DA8
	movs r1, #0xa
	bl CreateTask
	ldr r0, _080F6DAC
	mov r4, sl
	adds r1, r4, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080F6EC0
	.align 2, 0
_080F6D90: .4byte 0x02024640
_080F6D94: .4byte 0x020205AC
_080F6D98: .4byte 0x080F7E39
_080F6D9C: .4byte 0x02039D00
_080F6DA0: .4byte 0x08569324
_080F6DA4: .4byte 0x0856932C
_080F6DA8: .4byte 0x080F7F01
_080F6DAC: .4byte 0x03005B60
_080F6DB0:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r4, r0, r4
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080F6DC8
	b _080F6EC0
_080F6DC8:
	movs r0, #0
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	adds r0, #2
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _080F6DDE
	movs r0, #0x20
	strh r0, [r4, #0xc]
_080F6DDE:
	ldrb r2, [r4, #0xc]
	ldr r3, _080F6DFC
	movs r0, #0x50
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r1, r2, #0
	adds r1, #0x50
	orrs r0, r1
	strh r0, [r3]
	cmp r2, #0x20
	bne _080F6EC0
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080F6EC0
	.align 2, 0
_080F6DFC: .4byte 0x02022ADA
_080F6E00:
	ldr r0, _080F6E10
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _080F6EC0
	b _080F6E88
	.align 2, 0
_080F6E10: .4byte 0x02039D00
_080F6E14:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r3, r0, r4
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x79
	bne _080F6EC0
	movs r0, #0
	strh r0, [r3, #0xa]
	ldr r2, _080F6E50
	ldr r0, _080F6E54
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _080F6E58
	str r1, [r0]
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	b _080F6EC0
	.align 2, 0
_080F6E50: .4byte 0x020205AC
_080F6E54: .4byte 0x02039D00
_080F6E58: .4byte 0x080F7EB1
_080F6E5C:
	ldr r0, _080F6E98
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #2
	bne _080F6EC0
	ldr r3, _080F6E9C
	ldrh r0, [r3]
	lsrs r2, r0, #8
	adds r0, r2, #2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x50
	bls _080F6E7A
	movs r2, #0x50
_080F6E7A:
	lsls r1, r2, #8
	movs r0, #0xa0
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r3]
	cmp r2, #0x50
	bne _080F6EC0
_080F6E88:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _080F6EC0
	.align 2, 0
_080F6E98: .4byte 0x02039D00
_080F6E9C: .4byte 0x02022ADA
_080F6EA0:
	ldr r0, _080F6ED0
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	cmp r0, #2
	bne _080F6EC0
	movs r1, #0
	movs r0, #1
	strb r0, [r2, #9]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r1, [r0, #8]
	ldr r1, _080F6ED4
	str r1, [r0]
_080F6EC0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6ED0: .4byte 0x02039D00
_080F6ED4: .4byte 0x080F6ED9
	thumb_func_end sub_080F6C28

	thumb_func_start sub_080F6ED8
sub_080F6ED8: @ 0x080F6ED8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080F6F2C
	ldrh r1, [r0, #0x2e]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080F6F26
	ldr r0, _080F6F30
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	lsls r6, r7, #2
	cmp r0, #0
	bne _080F6F16
	ldr r5, _080F6F34
	movs r4, #3
_080F6EFE:
	ldrh r0, [r5]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	bl GetSetPokedexFlag
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080F6EFE
_080F6F16:
	ldr r1, _080F6F38
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x1c]
	ldr r1, _080F6F3C
	str r1, [r0]
_080F6F26:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6F2C: .4byte 0x03002360
_080F6F30: .4byte 0x02039BCA
_080F6F34: .4byte 0x02039AA0
_080F6F38: .4byte 0x03005B60
_080F6F3C: .4byte 0x080F6F41
	thumb_func_end sub_080F6ED8

	thumb_func_start sub_080F6F40
sub_080F6F40: @ 0x080F6F40
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080F6F74
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080F6F84
	ldr r0, _080F6F78
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r4, r1, r0
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080F6F92
	ldr r0, _080F6F7C
	bl sub_080F78E8
	bl sub_0800A7F8
	ldr r0, _080F6F80
	str r0, [r4]
	b _080F6F92
	.align 2, 0
_080F6F74: .4byte 0x02039BCA
_080F6F78: .4byte 0x03005B60
_080F6F7C: .4byte 0x085CC4D5
_080F6F80: .4byte 0x080F6FA1
_080F6F84:
	ldr r0, _080F6F98
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080F6F9C
	str r0, [r1]
_080F6F92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6F98: .4byte 0x03005B60
_080F6F9C: .4byte 0x080F6FE9
	thumb_func_end sub_080F6F40

	thumb_func_start sub_080F6FA0
sub_080F6FA0: @ 0x080F6FA0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080F6FD8
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F6FD0
	ldr r0, _080F6FDC
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080F6FBE
	bl DestroyWirelessStatusIndicatorSprite
_080F6FBE:
	bl sub_080F79B8
	ldr r0, _080F6FE0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080F6FE4
	str r0, [r1]
_080F6FD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6FD8: .4byte 0x030031C4
_080F6FDC: .4byte 0x02039BCA
_080F6FE0: .4byte 0x03005B60
_080F6FE4: .4byte 0x080F6FE9
	thumb_func_end sub_080F6FA0

	thumb_func_start sub_080F6FE8
sub_080F6FE8: @ 0x080F6FE8
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080F7030
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080F700A
	ldr r1, _080F7034
	ldr r0, _080F7038
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl BravoTrainerPokemonProfile_BeforeInterview2
_080F700A:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginHardwarePaletteFade
	ldr r1, _080F703C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080F7040
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7030: .4byte 0x02039BCA
_080F7034: .4byte 0x02039BC0
_080F7038: .4byte 0x02039BC5
_080F703C: .4byte 0x03005B60
_080F7040: .4byte 0x080F7045
	thumb_func_end sub_080F6FE8

	thumb_func_start sub_080F7044
sub_080F7044: @ 0x080F7044
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r5, r2, #0
	ldr r0, _080F707C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080F70CC
	ldr r1, _080F7080
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080F708C
	ldr r0, _080F7084
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	bl DestroyTask
	ldr r0, _080F7088
	b _080F7092
	.align 2, 0
_080F707C: .4byte 0x02037C74
_080F7080: .4byte 0x03005B60
_080F7084: .4byte 0x02039D00
_080F7088: .4byte 0x0000FFFF
_080F708C:
	cmp r0, #1
	bne _080F70A8
	ldr r0, _080F70A4
_080F7092:
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	b _080F70CC
	.align 2, 0
_080F70A4: .4byte 0xFFFF0000
_080F70A8:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyTask
	bl FreeAllWindowBuffers
	ldr r0, _080F70D4
	bl SetMainCallback2
	bl sub_080F86F4
_080F70CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F70D4: .4byte 0x08085B35
	thumb_func_end sub_080F7044

	thumb_func_start sub_080F70D8
sub_080F70D8: @ 0x080F70D8
	push {r4, r5, lr}
	ldr r2, _080F710C
	ldrh r3, [r2]
	adds r0, r3, #2
	strh r0, [r2]
	ldr r4, _080F7110
	ldrh r5, [r4]
	adds r1, r5, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _080F70F8
	adds r0, r3, #0
	subs r0, #0xfd
	strh r0, [r2]
_080F70F8:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _080F7106
	adds r0, r5, #0
	subs r0, #0xfe
	strh r0, [r4]
_080F7106:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F710C: .4byte 0x02022AD4
_080F7110: .4byte 0x02022AD6
	thumb_func_end sub_080F70D8

	thumb_func_start sub_080F7114
sub_080F7114: @ 0x080F7114
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080F7144
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _080F7196
	movs r0, #0
	strh r0, [r2, #8]
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _080F7148
	ldrh r0, [r2, #0xa]
	adds r0, #1
	b _080F714C
	.align 2, 0
_080F7144: .4byte 0x03005B60
_080F7148:
	ldrh r0, [r2, #0xa]
	subs r0, #1
_080F714C:
	strh r0, [r2, #0xa]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0x10
	bne _080F7162
	movs r0, #1
	b _080F7166
_080F7162:
	cmp r0, #0
	bne _080F7168
_080F7166:
	strh r0, [r1, #0xc]
_080F7168:
	ldr r0, _080F71B4
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r2, [r4, #0xa]
	ldr r3, _080F71B8
	movs r0, #0x6b
	movs r1, #1
	bl BlendPalette
	ldrb r2, [r4, #0xa]
	ldr r3, _080F71BC
	movs r0, #0x68
	movs r1, #1
	bl BlendPalette
	ldrb r2, [r4, #0xa]
	ldr r3, _080F71C0
	movs r0, #0x6e
	movs r1, #1
	bl BlendPalette
_080F7196:
	ldr r1, _080F71B4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r3, #0xa
	ldrsh r4, [r0, r3]
	cmp r4, #0
	bne _080F71C8
	ldr r0, _080F71C4
	ldr r0, [r0]
	ldr r0, [r0]
	strb r4, [r0, #0xa]
	b _080F71D2
	.align 2, 0
_080F71B4: .4byte 0x03005B60
_080F71B8: .4byte 0x00002EDE
_080F71BC: .4byte 0x00007FFF
_080F71C0: .4byte 0x000077BE
_080F71C4: .4byte 0x02039D00
_080F71C8:
	ldr r0, _080F71D8
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0xa]
_080F71D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F71D8: .4byte 0x02039D00
	thumb_func_end sub_080F7114

	thumb_func_start sub_080F71DC
sub_080F71DC: @ 0x080F71DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	mov r8, r4
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _080F725C
	movs r2, #0
	ldrb r0, [r0]
	cmp r4, r0
	bne _080F7202
	movs r2, #1
_080F7202:
	adds r0, r7, #0
	ldr r1, [sp, #0x28]
	bl GetMonIconPtr
	adds r3, r0, #0
	lsls r0, r5, #9
	adds r0, #0x80
	adds r3, r3, r0
	cmp r6, #0
	beq _080F7264
	lsls r1, r4, #9
	ldr r0, _080F7260
	adds r1, r1, r0
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r0, r3, #0
	movs r3, #1
	bl RequestDma3Copy
	adds r0, r4, #0
	adds r0, #0xa
	lsls r0, r0, #0x1c
	lsls r1, r4, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r1, r1, r2
	orrs r1, r0
	lsrs r1, r1, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	adds r3, #4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #4
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r2, #3
	bl WriteSequenceToBgTilemapBuffer
	b _080F7278
	.align 2, 0
_080F725C: .4byte 0x02039BC5
_080F7260: .4byte 0x06004000
_080F7264:
	mov r0, r8
	lsls r1, r0, #9
	ldr r2, _080F7284
	adds r1, r1, r2
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r0, r3, #0
	movs r3, #1
	bl RequestDma3Copy
_080F7278:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7284: .4byte 0x06004000
	thumb_func_end sub_080F71DC

	thumb_func_start LoadAllContestMonIcons
LoadAllContestMonIcons: @ 0x080F7288
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	ldr r4, _080F72BC
_080F7298:
	ldrh r0, [r4]
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r4, #0x38]
	str r2, [sp]
	adds r2, r7, #0
	adds r3, r6, #0
	bl sub_080F71DC
	adds r4, #0x40
	adds r5, #1
	cmp r5, #3
	ble _080F7298
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F72BC: .4byte 0x02039AA0
	thumb_func_end LoadAllContestMonIcons

	thumb_func_start sub_080F72C0
sub_080F72C0: @ 0x080F72C0
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r6, _080F7300
	movs r5, #0xa0
	lsls r5, r5, #0x10
_080F72CA:
	ldr r1, _080F7304
	lsls r0, r4, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl GetIconSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _080F7308
	adds r0, r0, r1
	lsrs r1, r5, #0x10
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #3
	ble _080F72CA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7300: .4byte 0x08556EE4
_080F7304: .4byte 0x02039AA0
_080F7308: .4byte 0x085567A4
	thumb_func_end sub_080F72C0

	thumb_func_start sub_080F730C
sub_080F730C: @ 0x080F730C
	push {r4, lr}
	ldr r0, _080F7384
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080F737C
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #8
	movs r1, #8
	bl CreateWirelessStatusIndicatorSprite
	ldr r4, _080F7388
	ldr r0, _080F738C
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x43
	movs r1, #1
	strb r1, [r0]
	ldr r0, _080F7390
	bl LoadSpriteSheet
	adds r1, r0, #0
	lsls r1, r1, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	lsrs r1, r1, #0xb
	ldr r2, _080F7394
	adds r1, r1, r2
	movs r2, #0x80
	movs r3, #1
	bl RequestDma3Fill
	ldr r0, _080F7398
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r2, [r1, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #8
	orrs r0, r2
	strb r0, [r1, #1]
_080F737C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7384: .4byte 0x02039BCA
_080F7388: .4byte 0x020205AC
_080F738C: .4byte 0x020227C8
_080F7390: .4byte 0x085694C4
_080F7394: .4byte 0x06010000
_080F7398: .4byte 0x085694AC
	thumb_func_end sub_080F730C

	thumb_func_start sub_080F739C
sub_080F739C: @ 0x080F739C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	ldr r4, _080F74B4
	adds r2, r2, r4
	ldrh r0, [r2, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x11
	ldr r3, _080F74B8
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0x2e
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x11
	adds r0, r0, r3
	str r0, [sp, #4]
	movs r0, #0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x11
	adds r0, r0, r3
	str r0, [sp, #8]
	movs r0, #0x32
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x11
	adds r0, r0, r3
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	ldr r1, _080F74BC
	mov sl, r1
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	ldr r2, _080F74C0
	bl CpuSet
	ldr r4, _080F74C4
	ldr r1, _080F74C8
	adds r0, r4, #0
	bl StringCopy
	adds r1, r5, #0
	bl StringCopy
	mov r2, sl
	ldr r0, [r2]
	ldr r0, [r0, #8]
	movs r1, #1
	adds r2, r4, #0
	bl RenderTextFont9
	adds r0, r5, #0
	bl StringLength
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r1, sl
	ldr r0, [r1]
	ldr r7, [r0, #0x1c]
	ldr r2, _080F74CC
	mov r8, r2
	ldr r5, _080F74D0
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	bl CpuSet
	mov r4, r8
	adds r4, #0x80
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r7, r0
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuSet
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r7, r2
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuSet
	mov r0, r8
	adds r0, #0x40
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r7, r2
	adds r2, r5, #0
	bl CpuSet
	movs r6, #0
	cmp r6, sb
	bgt _080F7588
	mov r4, sl
	movs r0, #0x92
	lsls r0, r0, #4
	str r0, [sp, #0x14]
	movs r1, #0xc4
	lsls r1, r1, #3
	str r1, [sp, #0x18]
	movs r2, #0xc8
	lsls r2, r2, #2
	mov sl, r2
	mov r8, r5
_080F74A6:
	cmp r6, #6
	bgt _080F74D4
	ldr r0, [r4]
	adds r1, r6, #1
	lsls r1, r1, #5
	ldr r0, [r0, #0x1c]
	b _080F74F4
	.align 2, 0
_080F74B4: .4byte 0x020205AC
_080F74B8: .4byte 0x06010000
_080F74BC: .4byte 0x02039D00
_080F74C0: .4byte 0x05000400
_080F74C4: .4byte 0x02022AE0
_080F74C8: .4byte 0x085CC4E4
_080F74CC: .4byte 0x0856917C
_080F74D0: .4byte 0x04000008
_080F74D4:
	cmp r6, #0xe
	bgt _080F74E0
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	mov r1, sl
	b _080F74F4
_080F74E0:
	cmp r6, #0x16
	bgt _080F74EE
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	ldr r2, [sp, #0x18]
	adds r7, r0, r2
	b _080F74F6
_080F74EE:
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	ldr r1, [sp, #0x14]
_080F74F4:
	adds r7, r0, r1
_080F74F6:
	cmp r6, sb
	beq _080F7588
	ldr r0, _080F75F8
	adds r1, r7, #0
	mov r2, r8
	bl CpuSet
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r7, r2
	ldr r0, _080F75F8
	adds r0, #0x20
	mov r2, r8
	bl CpuSet
	ldr r0, [r4]
	lsls r1, r6, #6
	ldr r0, [r0, #8]
	adds r3, r0, r1
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r7, r0
	movs r1, #0x11
	ldr r2, _080F75FC
	adds r0, r7, r2
_080F7528:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r5
	bge _080F7528
	movs r0, #0x84
	lsls r0, r0, #1
	adds r5, r7, r0
	movs r2, #0
_080F7538:
	adds r1, r5, r2
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r2, #1
	cmp r2, #0x17
	ble _080F7538
	movs r1, #0x80
	lsls r1, r1, #2
	adds r5, r7, r1
	movs r2, #0
_080F754E:
	adds r1, r5, r2
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r2, #1
	cmp r2, #0x1f
	ble _080F754E
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r5, r7, r2
	movs r2, #0
_080F7564:
	adds r1, r5, r2
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r2, #1
	cmp r2, #7
	ble _080F7564
	ldr r0, [sp, #0x14]
	adds r0, #0x20
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r1, #0x20
	str r1, [sp, #0x18]
	movs r2, #0x20
	add sl, r2
	adds r6, #1
	cmp r6, sb
	ble _080F74A6
_080F7588:
	ldr r4, _080F7600
	ldr r5, _080F7604
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl CpuSet
	adds r6, r4, #0
	adds r6, #0x80
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r7, r0
	adds r0, r6, #0
	adds r2, r5, #0
	bl CpuSet
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r7, r2
	adds r0, r6, #0
	adds r2, r5, #0
	bl CpuSet
	adds r4, #0x40
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuSet
	movs r6, #0
	mov r4, sp
_080F75CA:
	ldr r0, _080F7608
	ldr r0, [r0]
	lsls r1, r6, #0xa
	ldr r0, [r0, #0x1c]
	adds r0, r0, r1
	ldm r4!, {r1}
	movs r2, #0x80
	lsls r2, r2, #3
	movs r3, #1
	bl RequestDma3Copy
	adds r6, #1
	cmp r6, #3
	ble _080F75CA
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F75F8: .4byte 0x0856923C
_080F75FC: .4byte 0x00000107
_080F7600: .4byte 0x0856919C
_080F7604: .4byte 0x04000008
_080F7608: .4byte 0x02039D00
	thumb_func_end sub_080F739C

	thumb_func_start sub_080F760C
sub_080F760C: @ 0x080F760C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	mov r1, sp
	ldr r0, _080F76D4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	add r5, sp, #0x18
	ldr r6, _080F76D8
	movs r4, #7
_080F7622:
	adds r0, r6, #0
	bl LoadSpriteSheet
	adds r6, #8
	subs r4, #1
	cmp r4, #0
	bge _080F7622
	ldr r0, _080F76DC
	bl LoadSpritePalette
	movs r4, #0
	mov r6, sp
_080F763A:
	mov r0, sp
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0x90
	movs r3, #0xa
	bl CreateSprite
	adds r1, r5, r4
	strb r0, [r1]
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	adds r4, #1
	cmp r4, #7
	ble _080F763A
	ldr r2, _080F76E0
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r5, #1]
	movs r3, #0
	strh r1, [r0, #0x2e]
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r5, #2]
	strh r1, [r0, #0x30]
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r5, #3]
	strh r1, [r0, #0x32]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r5, #5]
	strh r1, [r0, #0x2e]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r5, #6]
	strh r1, [r0, #0x30]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r5, #7]
	strh r1, [r0, #0x32]
	ldr r1, _080F76E4
	ldr r0, [r1]
	ldr r2, [r0]
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r0, [r1]
	ldr r0, [r0]
	strb r3, [r0, #4]
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r0, [r5, #4]
	strb r0, [r1, #1]
	bl sub_080F79B8
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F76D4: .4byte 0x085692A4
_080F76D8: .4byte 0x085692BC
_080F76DC: .4byte 0x085692FC
_080F76E0: .4byte 0x020205AC
_080F76E4: .4byte 0x02039D00
	thumb_func_end sub_080F760C

	thumb_func_start sub_080F76E8
sub_080F76E8: @ 0x080F76E8
	push {lr}
	bl StringLength
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	movs r0, #0x78
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _080F7704
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080F7704: .4byte 0xFFF80000
	thumb_func_end sub_080F76E8

	thumb_func_start sub_080F7708
sub_080F7708: @ 0x080F7708
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _080F7754
	ldr r4, [r4]
	mov r8, r4
	ldr r4, [r4]
	ldrb r5, [r4]
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r5, _080F7758
	adds r4, r4, r5
	movs r6, #0
	movs r5, #0x88
	lsls r5, r5, #1
	strh r5, [r4, #0x20]
	strh r1, [r4, #0x22]
	strh r6, [r4, #0x24]
	strh r6, [r4, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, #0x20
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	strh r3, [r4, #0x3a]
	strh r6, [r4, #0x3c]
	ldr r0, _080F775C
	str r0, [r4, #0x1c]
	mov r0, r8
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7754: .4byte 0x02039D00
_080F7758: .4byte 0x020205AC
_080F775C: .4byte 0x080F77D5
	thumb_func_end sub_080F7708

	thumb_func_start sub_080F7760
sub_080F7760: @ 0x080F7760
	push {r4, r5, lr}
	ldr r1, _080F77A0
	ldr r4, [r1]
	ldr r1, [r4]
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _080F77A4
	adds r1, r1, r2
	ldrh r2, [r1, #0x24]
	ldrh r3, [r1, #0x20]
	adds r2, r2, r3
	movs r3, #0
	strh r2, [r1, #0x20]
	ldrh r2, [r1, #0x26]
	ldrh r5, [r1, #0x22]
	adds r2, r2, r5
	strh r2, [r1, #0x22]
	strh r3, [r1, #0x26]
	strh r3, [r1, #0x24]
	strh r0, [r1, #0x3a]
	strh r3, [r1, #0x3c]
	ldr r0, _080F77A8
	str r0, [r1, #0x1c]
	ldr r1, [r4]
	movs r0, #3
	strb r0, [r1, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F77A0: .4byte 0x02039D00
_080F77A4: .4byte 0x020205AC
_080F77A8: .4byte 0x080F7881
	thumb_func_end sub_080F7760

	thumb_func_start sub_080F77AC
sub_080F77AC: @ 0x080F77AC
	movs r3, #0
	movs r2, #0
	movs r1, #0x88
	lsls r1, r1, #1
	strh r1, [r0, #0x20]
	movs r1, #0x90
	strh r1, [r0, #0x22]
	strh r2, [r0, #0x26]
	strh r2, [r0, #0x24]
	ldr r1, _080F77CC
	str r1, [r0, #0x1c]
	ldr r0, _080F77D0
	ldr r0, [r0]
	ldr r0, [r0]
	strb r3, [r0, #4]
	bx lr
	.align 2, 0
_080F77CC: .4byte 0x08007141
_080F77D0: .4byte 0x02039D00
	thumb_func_end sub_080F77AC

	thumb_func_start sub_080F77D4
sub_080F77D4: @ 0x080F77D4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldrh r2, [r3, #0x3a]
	ldrh r0, [r3, #0x3c]
	adds r2, r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r3, #0x20]
	subs r0, r0, r1
	strh r0, [r3, #0x20]
	movs r1, #0xff
	ands r2, r1
	strh r2, [r3, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r3, #0x36]
	movs r4, #0x36
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _080F77FE
	strh r2, [r3, #0x20]
_080F77FE:
	movs r4, #0
	ldr r6, _080F7840
	movs r5, #0x40
	adds r2, r3, #0
	adds r2, #0x2e
_080F7808:
	movs r7, #0
	ldrsh r0, [r2, r7]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r3, #0x24]
	ldrh r7, [r3, #0x20]
	adds r0, r0, r7
	adds r0, r0, r5
	strh r0, [r1, #0x20]
	adds r5, #0x40
	adds r2, #2
	adds r4, #1
	cmp r4, #2
	ble _080F7808
	movs r0, #0x20
	ldrsh r1, [r3, r0]
	movs r2, #0x36
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _080F7838
	ldr r0, _080F7844
	str r0, [r3, #0x1c]
_080F7838:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7840: .4byte 0x020205AC
_080F7844: .4byte 0x080F7849
	thumb_func_end sub_080F77D4

	thumb_func_start sub_080F7848
sub_080F7848: @ 0x080F7848
	push {lr}
	adds r2, r0, #0
	ldr r0, _080F7878
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1, #4]
	ldrh r3, [r2, #0x38]
	ldr r1, _080F787C
	lsrs r0, r1, #0x10
	cmp r3, r0
	beq _080F7874
	subs r0, r3, #1
	strh r0, [r2, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bne _080F7874
	ldrh r0, [r2, #0x3a]
	bl sub_080F7760
_080F7874:
	pop {r0}
	bx r0
	.align 2, 0
_080F7878: .4byte 0x02039D00
_080F787C: .4byte 0xFFFF0000
	thumb_func_end sub_080F7848

	thumb_func_start sub_080F7880
sub_080F7880: @ 0x080F7880
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldrh r2, [r3, #0x3a]
	ldrh r0, [r3, #0x3c]
	adds r2, r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r3, #0x20]
	subs r0, r0, r1
	strh r0, [r3, #0x20]
	movs r0, #0xff
	ands r2, r0
	strh r2, [r3, #0x3c]
	movs r4, #0
	ldr r6, _080F78E4
	movs r5, #0x40
	adds r2, r3, #0
	adds r2, #0x2e
_080F78A4:
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r3, #0x24]
	ldrh r7, [r3, #0x20]
	adds r0, r0, r7
	adds r0, r0, r5
	strh r0, [r1, #0x20]
	adds r5, #0x40
	adds r2, #2
	adds r4, #1
	cmp r4, #2
	ble _080F78A4
	movs r1, #0x20
	ldrsh r0, [r3, r1]
	movs r2, #0x24
	ldrsh r1, [r3, r2]
	adds r0, r0, r1
	movs r1, #0xe0
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080F78DC
	adds r0, r3, #0
	bl sub_080F77AC
_080F78DC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F78E4: .4byte 0x020205AC
	thumb_func_end sub_080F7880

	thumb_func_start sub_080F78E8
sub_080F78E8: @ 0x080F78E8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _080F79A4
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	adds r0, r4, #0
	bl sub_080F739C
	adds r0, r4, #0
	bl sub_080F76E8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [r5]
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r3, _080F79A8
	adds r4, r1, r3
	adds r0, #0x20
	strh r0, [r4, #0x20]
	movs r0, #0x50
	strh r0, [r4, #0x22]
	adds r5, r4, #0
	adds r5, #0x3e
	ldrb r1, [r5]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r5]
	movs r5, #0
	adds r6, r3, #0
	mov ip, r2
	movs r3, #0x40
_080F7934:
	lsls r0, r5, #1
	adds r2, r4, #0
	adds r2, #0x2e
	adds r2, r2, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r4, #0x24]
	ldrh r7, [r4, #0x20]
	adds r0, r0, r7
	adds r0, r0, r3
	strh r0, [r1, #0x20]
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r4, #0x22]
	strh r1, [r0, #0x22]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r1, #0x3e
	ldrb r2, [r1]
	mov r0, ip
	ands r0, r2
	strb r0, [r1]
	adds r3, #0x40
	adds r5, #1
	cmp r5, #2
	ble _080F7934
	ldr r1, _080F79AC
	movs r0, #0xf0
	strh r0, [r1]
	ldr r2, _080F79B0
	ldrh r1, [r4, #0x22]
	adds r0, r1, #0
	subs r0, #0x10
	lsls r0, r0, #8
	adds r1, #0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080F79B4
	movs r0, #0x48
	bl SetGpuReg
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F79A4: .4byte 0x02039D00
_080F79A8: .4byte 0x020205AC
_080F79AC: .4byte 0x02022AD8
_080F79B0: .4byte 0x02022ADA
_080F79B4: .4byte 0x00003F3E
	thumb_func_end sub_080F78E8

	thumb_func_start sub_080F79B8
sub_080F79B8: @ 0x080F79B8
	push {r4, r5, r6, r7, lr}
	ldr r0, _080F7A28
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r3, _080F7A2C
	adds r2, r2, r3
	movs r0, #0x3e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	movs r1, #4
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldr r7, _080F7A30
	ldr r6, _080F7A34
	adds r5, r3, #0
	movs r4, #4
	adds r2, #0x2e
	movs r3, #2
_080F79E8:
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080F79E8
	movs r0, #0
	strh r0, [r7]
	strh r0, [r6]
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r6]
	movs r0, #0x44
	bl SetGpuReg
	ldr r1, _080F7A38
	movs r0, #0x48
	bl SetGpuReg
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7A28: .4byte 0x02039D00
_080F7A2C: .4byte 0x020205AC
_080F7A30: .4byte 0x02022AD8
_080F7A34: .4byte 0x02022ADA
_080F7A38: .4byte 0x00003F3F
	thumb_func_end sub_080F79B8

	thumb_func_start sub_080F7A3C
sub_080F7A3C: @ 0x080F7A3C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	movs r5, #0
	movs r4, #1
	ldr r0, _080F7A60
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080F7A68
	movs r5, #1
	ldr r1, _080F7A64
	movs r0, #8
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	b _080F7AA6
	.align 2, 0
_080F7A60: .4byte 0x02039BCA
_080F7A64: .4byte 0x085693B4
_080F7A68:
	ldr r0, _080F7A7C
	ldrh r2, [r0]
	cmp r2, #0
	bne _080F7A84
	ldr r1, _080F7A80
	movs r0, #8
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	b _080F7AA6
	.align 2, 0
_080F7A7C: .4byte 0x02039BCE
_080F7A80: .4byte 0x08569334
_080F7A84:
	cmp r2, #1
	bne _080F7A98
	ldr r1, _080F7A94
	movs r0, #8
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	b _080F7AA6
	.align 2, 0
_080F7A94: .4byte 0x08569354
_080F7A98:
	cmp r2, #2
	bne _080F7AB4
	ldr r1, _080F7AB0
	movs r0, #8
	str r0, [sp]
	str r2, [sp, #4]
	movs r0, #2
_080F7AA6:
	movs r2, #5
	movs r3, #1
	bl CopyToBgTilemapBufferRect
	b _080F7AC6
	.align 2, 0
_080F7AB0: .4byte 0x08569374
_080F7AB4:
	ldr r1, _080F7ADC
	movs r0, #8
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r2, #5
	movs r3, #1
	bl CopyToBgTilemapBufferRect
_080F7AC6:
	adds r2, r5, #0
	adds r2, #0xd
	movs r5, #0
	ldr r0, _080F7AE0
	ldrh r0, [r0]
	cmp r0, #0
	bne _080F7AE8
	movs r6, #0
	ldr r1, _080F7AE4
	b _080F7B26
	.align 2, 0
_080F7ADC: .4byte 0x08569394
_080F7AE0: .4byte 0x02039BCC
_080F7AE4: .4byte 0x085693D4
_080F7AE8:
	cmp r0, #1
	bne _080F7AF8
	movs r6, #1
	ldr r1, _080F7AF4
	b _080F7B26
	.align 2, 0
_080F7AF4: .4byte 0x085693E8
_080F7AF8:
	cmp r0, #2
	bne _080F7B1C
	movs r6, #2
	subs r5, #1
	ldr r1, _080F7B18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r3, r4, #0x18
	movs r0, #5
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #2
	bl CopyToBgTilemapBufferRect
	b _080F7B58
	.align 2, 0
_080F7B18: .4byte 0x085693FC
_080F7B1C:
	cmp r0, #3
	bne _080F7B40
	movs r6, #3
	subs r5, #1
	ldr r1, _080F7B3C
_080F7B26:
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r3, r4, #0x18
	movs r0, #5
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	bl CopyToBgTilemapBufferRect
	b _080F7B58
	.align 2, 0
_080F7B3C: .4byte 0x08569410
_080F7B40:
	movs r6, #4
	ldr r1, _080F7B94
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r3, r4, #0x18
	movs r0, #5
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	bl CopyToBgTilemapBufferRect
_080F7B58:
	adds r2, r5, #0
	adds r2, #0x13
	ldr r1, _080F7B98
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r4, #0x18
	movs r0, #5
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	bl CopyToBgTilemapBufferRect
	ldr r0, _080F7B9C
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7B94: .4byte 0x08569424
_080F7B98: .4byte 0x08569438
_080F7B9C: .4byte 0x02039D00
	thumb_func_end sub_080F7A3C

	thumb_func_start sub_080F7BA0
sub_080F7BA0: @ 0x080F7BA0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r1, _080F7BEC
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x3f
	bl __udivsi3
	adds r1, r0, #0
	ldr r0, _080F7BF0
	ands r0, r1
	cmp r0, #0
	beq _080F7BCC
	movs r0, #0x80
	lsls r0, r0, #9
	adds r1, r1, r0
_080F7BCC:
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _080F7BD8
	cmp r4, #0
	beq _080F7BD8
	movs r1, #1
_080F7BD8:
	cmp r5, #0
	beq _080F7BE2
	cmp r1, #0xa
	bls _080F7BE2
	movs r1, #0xa
_080F7BE2:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F7BEC: .4byte 0x02039BA0
_080F7BF0: .4byte 0x0000FFFF
	thumb_func_end sub_080F7BA0

	thumb_func_start sub_080F7BF4
sub_080F7BF4: @ 0x080F7BF4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _080F7C54
	lsls r0, r5, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r7, r1, #0
	cmp r0, #0
	bge _080F7C10
	rsbs r0, r0, #0
_080F7C10:
	lsls r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x50
	bl __udivsi3
	adds r2, r0, #0
	ldr r0, _080F7C58
	ands r0, r2
	cmp r0, #0
	beq _080F7C2A
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
_080F7C2A:
	lsrs r2, r2, #0x10
	cmp r2, #0
	bne _080F7C36
	cmp r4, #0
	beq _080F7C36
	movs r2, #1
_080F7C36:
	cmp r6, #0
	beq _080F7C40
	cmp r2, #0xa
	bls _080F7C40
	movs r2, #0xa
_080F7C40:
	lsls r0, r5, #1
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080F7C5C
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	b _080F7C5E
	.align 2, 0
_080F7C54: .4byte 0x02039BB8
_080F7C58: .4byte 0x0000FFFF
_080F7C5C:
	lsls r0, r2, #0x18
_080F7C5E:
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080F7BF4

	thumb_func_start sub_080F7C6C
sub_080F7C6C: @ 0x080F7C6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _080F7CA8
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r7, r0, r1
	ldrh r2, [r7, #0x1c]
	movs r0, #0x1c
	ldrsh r6, [r7, r0]
	cmp r6, #0
	bne _080F7CAC
	movs r1, #8
	ldrsh r0, [r7, r1]
	movs r1, #3
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	strh r0, [r7, #0x1e]
	adds r0, r2, #1
	strh r0, [r7, #0x1c]
	b _080F7D34
	.align 2, 0
_080F7CA8: .4byte 0x03005B60
_080F7CAC:
	cmp r6, #1
	bne _080F7D34
	ldrh r0, [r7, #0x1e]
	subs r0, #1
	strh r0, [r7, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080F7D34
	movs r2, #8
	ldrsh r4, [r7, r2]
	lsls r4, r4, #0x11
	ldr r0, _080F7D44
	adds r4, r4, r0
	lsrs r4, r4, #0x10
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	lsls r3, r0, #1
	adds r3, r3, r0
	adds r3, #5
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #2
	mov sb, r2
	str r2, [sp]
	str r6, [sp, #4]
	movs r5, #0x11
	str r5, [sp, #8]
	str r6, [sp, #0xc]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #1
	bl WriteSequenceToBgTilemapBuffer
	adds r4, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	lsls r3, r0, #1
	adds r3, r3, r0
	adds r3, #6
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r2, sb
	str r2, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	str r6, [sp, #0xc]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #1
	bl WriteSequenceToBgTilemapBuffer
	ldr r0, _080F7D48
	ldr r0, [r0]
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	adds r0, #1
	strb r0, [r1, #5]
	mov r0, r8
	bl DestroyTask
	movs r0, #0x18
	bl PlaySE
_080F7D34:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7D44: .4byte 0x50430000
_080F7D48: .4byte 0x02039D00
	thumb_func_end sub_080F7C6C

	thumb_func_start sub_080F7D4C
sub_080F7D4C: @ 0x080F7D4C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r1, _080F7DBC
	ldrb r0, [r1]
	ldr r6, _080F7DC0
	cmp r0, #0
	beq _080F7D6E
_080F7D60:
	adds r4, #1
	cmp r4, #3
	bgt _080F7D6E
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F7D60
_080F7D6E:
	ldr r1, [r6]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r0, r3, #6
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, [r1, #0x14]
	adds r1, r1, r0
	adds r3, #4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	movs r0, #2
	movs r2, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r1, _080F7DC4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #0x1c]
	movs r1, #1
	strh r1, [r0, #0x20]
	ldr r1, _080F7DC8
	str r1, [r0]
	ldr r0, [r6]
	ldr r0, [r0]
	strb r5, [r0, #3]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F7DBC: .4byte 0x02039BC0
_080F7DC0: .4byte 0x02039D00
_080F7DC4: .4byte 0x03005B60
_080F7DC8: .4byte 0x080F7DCD
	thumb_func_end sub_080F7D4C

	thumb_func_start sub_080F7DCC
sub_080F7DCC: @ 0x080F7DCC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080F7E18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #1
	bne _080F7E30
	movs r0, #0
	strh r0, [r4, #0x1e]
	ldrh r2, [r4, #0x20]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _080F7E1C
	movs r0, #0x91
	movs r1, #1
	bl BlendPalette
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080F7E20
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _080F7E30
	strh r5, [r4, #0x22]
	b _080F7E30
	.align 2, 0
_080F7E18: .4byte 0x03005B60
_080F7E1C: .4byte 0x00006F8D
_080F7E20:
	ldrh r0, [r4, #0x20]
	subs r0, #1
	strh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _080F7E30
	strh r0, [r4, #0x22]
_080F7E30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F7DCC

	thumb_func_start sub_080F7E38
sub_080F7E38: @ 0x080F7E38
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #9
	bgt _080F7E60
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080F7EA0
	ldrh r0, [r4, #0x30]
	movs r1, #0
	bl PlayCry1
	movs r0, #0
	strh r0, [r4, #0x30]
	b _080F7EA0
_080F7E60:
	movs r0, #0xc0
	lsls r0, r0, #3
	adds r2, r0, #0
	ldrh r1, [r4, #0x30]
	adds r2, r2, r1
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x20]
	subs r0, r0, r1
	strh r0, [r4, #0x20]
	movs r1, #0xff
	ands r2, r1
	strh r2, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	bgt _080F7E86
	movs r0, #0x78
	strh r0, [r4, #0x20]
_080F7E86:
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #0x78
	bne _080F7EA0
	ldr r0, _080F7EA8
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x30]
	ldr r0, _080F7EAC
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #6]
_080F7EA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7EA8: .4byte 0x08007141
_080F7EAC: .4byte 0x02039D00
	thumb_func_end sub_080F7E38

	thumb_func_start sub_080F7EB0
sub_080F7EB0: @ 0x080F7EB0
	push {lr}
	adds r3, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	adds r2, r0, #0
	ldrh r0, [r3, #0x30]
	adds r2, r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r3, #0x20]
	subs r0, r0, r1
	strh r0, [r3, #0x20]
	movs r1, #0xff
	ands r2, r1
	strh r2, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080F7EF4
	ldr r0, _080F7EF8
	str r0, [r3, #0x1c]
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080F7EFC
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1, #6]
_080F7EF4:
	pop {r0}
	bx r0
	.align 2, 0
_080F7EF8: .4byte 0x08007141
_080F7EFC: .4byte 0x02039D00
	thumb_func_end sub_080F7EB0

	thumb_func_start sub_080F7F00
sub_080F7F00: @ 0x080F7F00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080F7FE0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _080F7FC2
	movs r0, #0
	strh r0, [r1, #8]
	ldr r0, _080F7FE4
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0x27
	bhi _080F7FC2
	ldr r4, _080F7FE8
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf0
	bl __umodsi3
	adds r1, r0, #0
	subs r1, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0x2c
	movs r3, #5
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	ldr r1, _080F7FEC
	lsls r5, r4, #4
	adds r5, r5, r4
	lsls r5, r5, #2
	adds r5, r5, r1
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	strh r0, [r5, #0x2e]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x18
	bl __umodsi3
	adds r0, #0x10
	strh r0, [r5, #0x30]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xff
	ands r0, r1
	adds r0, #0x30
	strh r0, [r5, #0x32]
	bl Random
	ldrh r6, [r5, #4]
	lsls r4, r6, #0x16
	lsrs r4, r4, #0x16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x11
	bl __umodsi3
	adds r4, r4, r0
	ldr r1, _080F7FF0
	adds r0, r1, #0
	ands r4, r0
	ldr r0, _080F7FF4
	ands r0, r6
	orrs r0, r4
	strh r0, [r5, #4]
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r0, [r1, #7]
	adds r0, #1
	strb r0, [r1, #7]
_080F7FC2:
	ldr r0, _080F7FE4
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080F7FD4
	adds r0, r7, #0
	bl DestroyTask
_080F7FD4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7FE0: .4byte 0x03005B60
_080F7FE4: .4byte 0x02039D00
_080F7FE8: .4byte 0x0856930C
_080F7FEC: .4byte 0x020205AC
_080F7FF0: .4byte 0x000003FF
_080F7FF4: .4byte 0xFFFFFC00
	thumb_func_end sub_080F7F00

	thumb_func_start sub_080F7FF8
sub_080F7FF8: @ 0x080F7FF8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x34]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r1, [r4, #0x32]
	ldrh r0, [r4, #0x36]
	adds r1, r1, r0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r4, #0x20]
	movs r0, #0xff
	ands r1, r0
	strh r1, [r4, #0x36]
	ldrh r0, [r4, #0x22]
	adds r0, #1
	strh r0, [r4, #0x22]
	ldr r5, _080F806C
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080F8046
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_080F8046:
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	cmp r0, #0xf8
	bgt _080F8056
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	cmp r0, #0x74
	ble _080F8066
_080F8056:
	adds r0, r4, #0
	bl DestroySprite
	ldr r0, [r5]
	ldr r1, [r0]
	ldrb r0, [r1, #7]
	subs r0, #1
	strb r0, [r1, #7]
_080F8066:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F806C: .4byte 0x02039D00
	thumb_func_end sub_080F7FF8

	thumb_func_start sub_080F8070
sub_080F8070: @ 0x080F8070
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080F80A8
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080F80AC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	strh r5, [r1, #0xa]
	ldr r0, _080F80B0
	lsls r4, r4, #6
	adds r4, r4, r0
	ldrh r0, [r4]
	strh r0, [r1, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F80A8: .4byte 0x080F80B5
_080F80AC: .4byte 0x03005B60
_080F80B0: .4byte 0x02039AA0
	thumb_func_end sub_080F8070

	thumb_func_start sub_080F80B4
sub_080F80B4: @ 0x080F80B4
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080F8108
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrb r5, [r4, #8]
	ldrh r0, [r4, #0x1c]
	adds r1, r0, #1
	strh r1, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080F80FE
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0xc]
	ldrb r2, [r4, #0x1e]
	ldr r1, _080F810C
	lsls r3, r5, #6
	adds r1, #0x38
	adds r3, r3, r1
	ldr r1, [r3]
	str r1, [sp]
	adds r1, r5, #0
	movs r3, #0
	bl sub_080F71DC
	ldrh r0, [r4, #0x1e]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x1e]
_080F80FE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F8108: .4byte 0x03005B60
_080F810C: .4byte 0x02039AA0
	thumb_func_end sub_080F80B4

	thumb_func_start sub_080F8110
sub_080F8110: @ 0x080F8110
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080F82D4
	ldrh r2, [r0]
	adds r4, r0, #0
	adds r3, r4, #2
	movs r0, #2
	mov r8, r0
_080F8128:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r5, #0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	bge _080F8136
	ldrh r2, [r3]
_080F8136:
	adds r3, #2
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _080F8128
	lsls r0, r2, #0x10
	str r0, [sp]
	cmp r0, #0
	bge _080F8174
	ldrh r2, [r4]
	adds r3, r4, #2
	movs r4, #2
	mov r8, r4
_080F8154:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r5, #0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	ble _080F8162
	ldrh r2, [r3]
_080F8162:
	adds r3, #2
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	lsls r1, r2, #0x10
	str r1, [sp]
	mov r4, r8
	cmp r4, #0
	bge _080F8154
_080F8174:
	movs r5, #0
	mov r8, r5
	mov sl, r5
_080F817A:
	ldr r0, _080F82D8
	mov r1, r8
	lsls r7, r1, #1
	adds r0, r7, r0
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [sp]
	asrs r5, r4, #0x10
	adds r1, r5, #0
	cmp r5, #0
	bge _080F819C
	rsbs r1, r5, #0
_080F819C:
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	cmp r0, #4
	ble _080F81AE
	adds r4, #0xa
_080F81AE:
	ldr r0, _080F82DC
	mov sb, r0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	mov r1, sl
	adds r6, r1, r0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	str r0, [r6]
	ldr r0, _080F82E0
	adds r7, r7, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	cmp r1, #0
	bge _080F81D2
	rsbs r1, r1, #0
_080F81D2:
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r5, #0
	cmp r1, #0
	bge _080F81E4
	rsbs r1, r1, #0
_080F81E4:
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	cmp r0, #4
	ble _080F81F6
	adds r4, #0xa
_080F81F6:
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	str r0, [r6, #4]
	movs r4, #0
	ldrsh r0, [r7, r4]
	cmp r0, #0
	bge _080F820C
	movs r0, #1
	strb r0, [r6, #0x10]
_080F820C:
	mov r5, sb
	ldr r0, [r5]
	ldr r0, [r0, #4]
	mov r1, sl
	adds r4, r1, r0
	ldr r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #0xb
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	movs r5, #0xff
	ands r0, r5
	cmp r0, #0x7f
	bls _080F8238
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
_080F8238:
	lsrs r0, r1, #8
	str r0, [r4, #8]
	ldr r1, [r4, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #0xb
	movs r1, #0x64
	bl __divsi3
	adds r1, r0, #0
	ands r0, r5
	cmp r0, #0x7f
	bls _080F825C
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r1, r5
_080F825C:
	lsrs r0, r1, #8
	str r0, [r4, #0xc]
	mov r0, r8
	lsls r4, r0, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl sub_080F7BA0
	mov r2, sb
	ldr r1, [r2]
	ldr r1, [r1, #4]
	add r1, sl
	strb r0, [r1, #0x11]
	adds r0, r4, #0
	movs r1, #1
	bl sub_080F7BF4
	mov r4, sb
	ldr r1, [r4]
	ldr r1, [r1, #4]
	add r1, sl
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080F8292
	rsbs r0, r0, #0
_080F8292:
	strb r0, [r1, #0x12]
	ldr r0, _080F82E4
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080F82F0
	mov r5, sb
	ldr r0, [r5]
	ldr r0, [r0, #4]
	mov r2, sl
	adds r1, r2, r0
	ldr r5, [r1, #8]
	ldrh r3, [r1, #8]
	ldr r4, [r1, #0xc]
	ldrh r2, [r1, #0xc]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _080F82BC
	lsls r0, r2, #0x10
	rsbs r0, r0, #0
	lsrs r2, r0, #0x10
_080F82BC:
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r0, r3, r2
	cmp r0, #0x58
	bne _080F82F0
	cmp r2, #0
	ble _080F82E8
	subs r0, r4, #1
	str r0, [r1, #0xc]
	b _080F82F0
	.align 2, 0
_080F82D4: .4byte 0x02039BA8
_080F82D8: .4byte 0x02039BA0
_080F82DC: .4byte 0x02039D00
_080F82E0: .4byte 0x02039BB8
_080F82E4: .4byte 0x02039BC0
_080F82E8:
	cmp r3, #0
	ble _080F82F0
	subs r0, r5, #1
	str r0, [r1, #8]
_080F82F0:
	movs r4, #0x14
	add sl, r4
	movs r5, #1
	add r8, r5
	mov r0, r8
	cmp r0, #3
	bgt _080F8300
	b _080F817A
_080F8300:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080F8110

	thumb_func_start sub_080F8310
sub_080F8310: @ 0x080F8310
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r1, #0
	str r1, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	cmp r0, #0
	bne _080F83EC
	mov sb, r3
	ldr r4, _080F83D4
	mov sl, r4
	movs r7, #0xa0
	lsls r7, r7, #0x13
	movs r6, #0
_080F833C:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0, #4]
	adds r0, r6, r0
	ldrb r2, [r0, #0x11]
	cmp r8, r2
	bhs _080F83BE
	adds r2, #0x13
	mov r3, r8
	subs r2, r2, r3
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r7, #0x18
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, _080F83D8
	bl FillBgTilemapBufferRect_Palette0
	ldr r0, _080F83DC
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, sl
	ldr r4, [r0]
	ldr r1, [r4, #4]
	adds r1, r6, r1
	ldr r0, [r1, #8]
	lsls r0, r0, #0x10
	ldrb r1, [r1, #0x11]
	bl __udivsi3
	mov r1, r8
	adds r1, #1
	adds r3, r0, #0
	muls r3, r1, r3
	ldr r0, _080F83E0
	ands r0, r3
	ldr r1, _080F83E4
	cmp r0, r1
	bls _080F839A
	movs r1, #0x80
	lsls r1, r1, #9
	adds r3, r3, r1
_080F839A:
	ldr r1, _080F83E8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	mov r1, sb
	strh r1, [r0, #8]
	lsrs r1, r3, #0x10
	strh r1, [r0, #0xa]
	ldr r1, [r4]
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
_080F83BE:
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r7, r7, r3
	adds r6, #0x14
	movs r4, #1
	add sb, r4
	mov r0, sb
	cmp r0, #3
	ble _080F833C
	b _080F850E
	.align 2, 0
_080F83D4: .4byte 0x02039D00
_080F83D8: .4byte 0x000060B3
_080F83DC: .4byte 0x080F8539
_080F83E0: .4byte 0x0000FFFF
_080F83E4: .4byte 0x00007FFF
_080F83E8: .4byte 0x03005B60
_080F83EC:
	movs r1, #0
	mov sb, r1
	mov sl, r1
	movs r3, #0xc0
	lsls r3, r3, #0x13
	str r3, [sp, #0x10]
_080F83F8:
	ldr r4, _080F8494
	ldr r0, [r4]
	ldr r0, [r0, #4]
	add r0, sl
	ldrb r2, [r0, #0x12]
	ldrb r0, [r0, #0x10]
	ldr r1, _080F8498
	cmp r0, #0
	beq _080F840C
	adds r1, #2
_080F840C:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r8, r0
	bge _080F84F4
	mov r3, r8
	lsls r2, r3, #0x18
	asrs r2, r2, #0x18
	subs r2, #0x13
	subs r2, r0, r2
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, [sp, #0x10]
	lsrs r3, r4, #0x18
	movs r7, #1
	str r7, [sp]
	str r7, [sp, #4]
	movs r0, #1
	bl FillBgTilemapBufferRect_Palette0
	ldr r0, _080F849C
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080F8494
	ldr r6, [r0]
	ldr r1, [r6, #4]
	add r1, sl
	ldr r0, [r1, #0xc]
	lsls r0, r0, #0x10
	ldrb r1, [r1, #0x12]
	bl __udivsi3
	mov r1, r8
	adds r1, #1
	adds r3, r0, #0
	muls r3, r1, r3
	ldr r0, _080F84A0
	ands r0, r3
	ldr r1, _080F84A4
	cmp r0, r1
	bls _080F846A
	movs r1, #0x80
	lsls r1, r1, #9
	adds r3, r3, r1
_080F846A:
	ldr r1, _080F84A8
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	mov r0, sb
	strh r0, [r4, #8]
	ldr r0, [r6, #4]
	add r0, sl
	ldrb r0, [r0, #0x10]
	adds r6, r1, #0
	cmp r0, #0
	beq _080F84AC
	strh r7, [r4, #0xc]
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	b _080F84B6
	.align 2, 0
_080F8494: .4byte 0x02039D00
_080F8498: .4byte 0x000060A3
_080F849C: .4byte 0x080F8539
_080F84A0: .4byte 0x0000FFFF
_080F84A4: .4byte 0x00007FFF
_080F84A8: .4byte 0x03005B60
_080F84AC:
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
_080F84B6:
	ldr r1, _080F84D8
	ldr r0, [r1]
	ldr r0, [r0, #4]
	mov r4, sl
	adds r1, r4, r0
	ldrb r0, [r1, #0x10]
	ldr r4, _080F84D8
	cmp r0, #0
	beq _080F84DC
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	lsrs r2, r3, #0x10
	ldr r1, [r1, #8]
	subs r1, r1, r2
	b _080F84E8
	.align 2, 0
_080F84D8: .4byte 0x02039D00
_080F84DC:
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	lsrs r2, r3, #0x10
	ldr r1, [r1, #8]
	adds r1, r1, r2
_080F84E8:
	strh r1, [r0, #0xa]
	ldr r0, [r4]
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
_080F84F4:
	movs r0, #0x14
	add sl, r0
	ldr r1, [sp, #0x10]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r1, r1, r3
	str r1, [sp, #0x10]
	movs r4, #1
	add sb, r4
	mov r0, sb
	cmp r0, #3
	bgt _080F850E
	b _080F83F8
_080F850E:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _080F851A
	movs r0, #0x16
	bl PlaySE
_080F851A:
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _080F8526
	movs r0, #0x15
	bl PlaySE
_080F8526:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F8310

	thumb_func_start sub_080F8538
sub_080F8538: @ 0x080F8538
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r4, #0
	mov sb, r4
	ldr r1, _080F8580
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r6, [r0, #8]
	ldrh r7, [r0, #0xa]
	ldrh r1, [r0, #0xc]
	mov ip, r1
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _080F8588
	ldr r2, _080F8584
	ldr r0, [r2]
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0xc
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r5, r1, #0
	cmp r0, #0
	bgt _080F85A0
	b _080F859E
	.align 2, 0
_080F8580: .4byte 0x03005B60
_080F8584: .4byte 0x02039D00
_080F8588:
	ldr r2, _080F85C8
	ldr r0, [r2]
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0xc
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r5, r1, #0
	cmp r0, #0x57
	ble _080F85A0
_080F859E:
	movs r4, #1
_080F85A0:
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0xc
	adds r2, r0, r5
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _080F85BA
	movs r1, #1
	mov sb, r1
_080F85BA:
	mov r0, sb
	cmp r0, #0
	bne _080F85DA
	cmp r4, #0
	beq _080F85CC
	strh r7, [r2]
	b _080F85DA
	.align 2, 0
_080F85C8: .4byte 0x02039D00
_080F85CC:
	mov r1, ip
	cmp r1, #0
	beq _080F85D6
	subs r0, r3, #1
	b _080F85D8
_080F85D6:
	adds r0, r3, #1
_080F85D8:
	strh r0, [r2]
_080F85DA:
	cmp r4, #0
	bne _080F8654
	mov r2, sb
	cmp r2, #0
	bne _080F865A
	movs r2, #0
_080F85E6:
	ldr r0, _080F8604
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0xc
	adds r0, r0, r5
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r2, #1
	lsls r1, r0, #3
	adds r4, r0, #0
	cmp r3, r1
	blt _080F8608
	movs r0, #8
	b _080F8624
	.align 2, 0
_080F8604: .4byte 0x02039D00
_080F8608:
	lsls r0, r2, #3
	cmp r3, r0
	blt _080F8622
	adds r0, r3, #0
	cmp r3, #0
	bge _080F8616
	adds r0, r3, #7
_080F8616:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080F8624
_080F8622:
	movs r0, #0
_080F8624:
	cmp r0, #3
	bhi _080F8630
	ldr r3, _080F862C
	b _080F8632
	.align 2, 0
_080F862C: .4byte 0x0000504C
_080F8630:
	ldr r3, _080F867C
_080F8632:
	adds r1, r0, r3
	adds r2, #7
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r5, r6
	adds r3, #6
	lsls r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	lsrs r3, r3, #0x18
	bl FillBgTilemapBufferRect_Palette0
	adds r2, r4, #0
	cmp r2, #0xa
	ble _080F85E6
_080F8654:
	mov r0, sb
	cmp r0, #0
	beq _080F866C
_080F865A:
	ldr r0, _080F8680
	ldr r0, [r0]
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	subs r0, #1
	strb r0, [r1, #0x14]
	mov r0, r8
	bl DestroyTask
_080F866C:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F867C: .4byte 0x00005057
_080F8680: .4byte 0x02039D00
	thumb_func_end sub_080F8538

	thumb_func_start sub_080F8684
sub_080F8684: @ 0x080F8684
	push {r4, r5, lr}
	ldr r4, _080F86F0
	movs r0, #0x20
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0x18
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
	movs r0, #0x50
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #4]
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #8]
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0xc]
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x10]
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x14]
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x18]
	movs r0, #0x80
	lsls r0, r0, #5
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x1c]
	bl AllocateMonSpritesGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F86F0: .4byte 0x02039D00
	thumb_func_end sub_080F8684

	thumb_func_start sub_080F86F4
sub_080F86F4: @ 0x080F86F4
	push {r4, r5, lr}
	ldr r5, _080F875C
	ldr r0, [r5]
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	movs r4, #0
	str r4, [r0]
	ldr r0, [r0, #4]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #4]
	ldr r0, [r0, #8]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #8]
	ldr r0, [r0, #0xc]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0xc]
	ldr r0, [r0, #0x10]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x10]
	ldr r0, [r0, #0x14]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x14]
	ldr r0, [r0, #0x18]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x18]
	ldr r0, [r0, #0x1c]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x1c]
	bl Free
	str r4, [r5]
	bl FreeMonSpritesGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F875C: .4byte 0x02039D00
	thumb_func_end sub_080F86F4

	thumb_func_start sub_080F8760
sub_080F8760: @ 0x080F8760
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	str r1, [sp]
	mov r0, sp
	movs r2, #0
	strb r4, [r0, #4]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #5]
	mov r0, sp
	strb r2, [r0, #6]
	movs r1, #2
	strb r1, [r0, #7]
	strb r2, [r0, #8]
	strb r1, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	mov r3, sp
	ldrb r2, [r3, #0xc]
	subs r1, #0x12
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	mov r2, sp
	movs r0, #0x10
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	ands r1, r0
	strb r1, [r2, #0xd]
	mov r1, sp
	movs r0, #0x80
	strb r0, [r1, #0xd]
	mov r0, sp
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F8760

	thumb_func_start sub_080F87C0
sub_080F87C0: @ 0x080F87C0
	push {r4, r5, lr}
	ldr r0, _080F87F8
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080F87FC
	adds r0, r0, r1
	bl sub_080DA58C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	cmp r5, #0
	beq _080F87EE
	ldr r4, _080F8800
	ldrb r0, [r4]
	ldr r1, _080F8804
	ldrb r1, [r1]
	bl sub_080DA330
	ldrb r0, [r4]
	bl sub_080DA800
_080F87EE:
	ldr r0, _080F8808
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F87F8: .4byte 0x02039BC4
_080F87FC: .4byte 0x02024190
_080F8800: .4byte 0x02039BCC
_080F8804: .4byte 0x02039BCE
_080F8808: .4byte 0x02037290
	thumb_func_end sub_080F87C0

	thumb_func_start sub_080F880C
sub_080F880C: @ 0x080F880C
	push {r4, lr}
	movs r4, #0
	ldr r0, _080F8830
	ldrb r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _080F8834
	adds r2, r1, r0
	ldr r0, _080F8838
	ldrh r0, [r0]
	cmp r0, #4
	bhi _080F887E
	lsls r0, r0, #2
	ldr r1, _080F883C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8830: .4byte 0x02039BC4
_080F8834: .4byte 0x02024190
_080F8838: .4byte 0x02039BCC
_080F883C: .4byte 0x080F8840
_080F8840: @ jump table
	.4byte _080F8854 @ case 0
	.4byte _080F885A @ case 1
	.4byte _080F8860 @ case 2
	.4byte _080F8866 @ case 3
	.4byte _080F886C @ case 4
_080F8854:
	adds r0, r2, #0
	movs r1, #0x32
	b _080F8870
_080F885A:
	adds r0, r2, #0
	movs r1, #0x33
	b _080F8870
_080F8860:
	adds r0, r2, #0
	movs r1, #0x34
	b _080F8870
_080F8866:
	adds r0, r2, #0
	movs r1, #0x35
	b _080F8870
_080F886C:
	adds r0, r2, #0
	movs r1, #0x36
_080F8870:
	bl GetMonData
	ldr r1, _080F8888
	ldrh r1, [r1]
	cmp r0, r1
	bls _080F887E
	movs r4, #1
_080F887E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F8888: .4byte 0x02039BCE
	thumb_func_end sub_080F880C

	thumb_func_start sub_080F888C
sub_080F888C: @ 0x080F888C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _080F88B4
	ldr r0, _080F88B8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080F88A0
	b _080F8AE0
_080F88A0:
	ldr r0, _080F88BC
	ldrh r0, [r0]
	cmp r0, #4
	bls _080F88AA
	b _080F8AE0
_080F88AA:
	lsls r0, r0, #2
	ldr r1, _080F88C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F88B4: .4byte 0x02039BC0
_080F88B8: .4byte 0x02039BC5
_080F88BC: .4byte 0x02039BCC
_080F88C0: .4byte 0x080F88C4
_080F88C4: @ jump table
	.4byte _080F88D8 @ case 0
	.4byte _080F8948 @ case 1
	.4byte _080F89B4 @ case 2
	.4byte _080F8A20 @ case 3
	.4byte _080F8A88 @ case 4
_080F88D8:
	ldr r6, _080F893C
	ldrb r0, [r6]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _080F8940
	adds r0, r0, r4
	movs r1, #0x32
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov r0, sp
	strb r1, [r0]
	ldr r0, _080F8944
	ldrh r0, [r0]
	cmp r1, r0
	bls _080F88FC
	b _080F8AE0
_080F88FC:
	adds r0, r1, #0
	cmp r0, #3
	bls _080F8904
	b _080F8AE0
_080F8904:
	adds r1, r0, #1
	mov r0, sp
	strb r1, [r0]
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x32
	mov r2, sp
	bl SetMonData
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	bl GetRibbonCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080F892C
	b _080F8AE0
_080F892C:
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x32
	bl sub_080EEFFC
	b _080F8AE0
	.align 2, 0
_080F893C: .4byte 0x02039BC4
_080F8940: .4byte 0x02024190
_080F8944: .4byte 0x02039BCE
_080F8948:
	mov r4, sp
	ldr r7, _080F89A8
	ldrb r0, [r7]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080F89AC
	adds r0, r0, r5
	movs r1, #0x33
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080F89B0
	ldrh r0, [r0]
	cmp r2, r0
	bls _080F896C
	b _080F8AE0
_080F896C:
	cmp r2, #3
	bls _080F8972
	b _080F8AE0
_080F8972:
	mov r1, sp
	adds r0, r2, #1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x33
	mov r2, sp
	bl SetMonData
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	bl GetRibbonCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080F899A
	b _080F8AE0
_080F899A:
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x33
	bl sub_080EEFFC
	b _080F8AE0
	.align 2, 0
_080F89A8: .4byte 0x02039BC4
_080F89AC: .4byte 0x02024190
_080F89B0: .4byte 0x02039BCE
_080F89B4:
	mov r4, sp
	ldr r7, _080F8A14
	ldrb r0, [r7]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080F8A18
	adds r0, r0, r5
	movs r1, #0x34
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080F8A1C
	ldrh r0, [r0]
	cmp r2, r0
	bls _080F89D8
	b _080F8AE0
_080F89D8:
	cmp r2, #3
	bls _080F89DE
	b _080F8AE0
_080F89DE:
	mov r1, sp
	adds r0, r2, #1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x34
	mov r2, sp
	bl SetMonData
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	bl GetRibbonCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080F8AE0
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x34
	bl sub_080EEFFC
	b _080F8AE0
	.align 2, 0
_080F8A14: .4byte 0x02039BC4
_080F8A18: .4byte 0x02024190
_080F8A1C: .4byte 0x02039BCE
_080F8A20:
	mov r4, sp
	ldr r7, _080F8A7C
	ldrb r0, [r7]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080F8A80
	adds r0, r0, r5
	movs r1, #0x35
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080F8A84
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080F8AE0
	cmp r2, #3
	bhi _080F8AE0
	mov r1, sp
	adds r0, r2, #1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x35
	mov r2, sp
	bl SetMonData
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	bl GetRibbonCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080F8AE0
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x35
	bl sub_080EEFFC
	b _080F8AE0
	.align 2, 0
_080F8A7C: .4byte 0x02039BC4
_080F8A80: .4byte 0x02024190
_080F8A84: .4byte 0x02039BCE
_080F8A88:
	mov r4, sp
	ldr r7, _080F8AE8
	ldrb r0, [r7]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080F8AEC
	adds r0, r0, r5
	movs r1, #0x36
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080F8AF0
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080F8AE0
	cmp r2, #3
	bhi _080F8AE0
	mov r1, sp
	adds r0, r2, #1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x36
	mov r2, sp
	bl SetMonData
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	bl GetRibbonCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080F8AE0
	ldrb r0, [r7]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x36
	bl sub_080EEFFC
_080F8AE0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F8AE8: .4byte 0x02039BC4
_080F8AEC: .4byte 0x02024190
_080F8AF0: .4byte 0x02039BCE
	thumb_func_end sub_080F888C

	thumb_func_start sub_080F8AF4
sub_080F8AF4: @ 0x080F8AF4
	push {lr}
	ldr r0, _080F8B0C
	ldr r1, _080F8B10
	ldrh r1, [r1]
	lsls r1, r1, #6
	ldr r2, _080F8B14
	adds r1, r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080F8B0C: .4byte 0x02021C40
_080F8B10: .4byte 0x02037284
_080F8B14: .4byte 0x02039AAD
	thumb_func_end sub_080F8AF4

	thumb_func_start sub_080F8B18
sub_080F8B18: @ 0x080F8B18
	push {lr}
	ldr r0, _080F8B30
	ldr r1, _080F8B34
	ldrh r1, [r1]
	lsls r1, r1, #6
	ldr r2, _080F8B38
	adds r1, r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080F8B30: .4byte 0x02021C68
_080F8B34: .4byte 0x02037284
_080F8B38: .4byte 0x02039AA2
	thumb_func_end sub_080F8B18

	thumb_func_start sub_080F8B3C
sub_080F8B3C: @ 0x080F8B3C
	push {r4, r5, r6, lr}
	movs r1, #0
	movs r2, #0
	ldr r5, _080F8B78
	ldr r4, _080F8B7C
	ldr r0, _080F8B80
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r3, [r0, r6]
_080F8B52:
	lsls r0, r1, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r3, r0
	bge _080F8B64
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080F8B64:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080F8B52
	strh r2, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8B78: .4byte 0x02037280
_080F8B7C: .4byte 0x02039BA0
_080F8B80: .4byte 0x02037284
	thumb_func_end sub_080F8B3C

	thumb_func_start sub_080F8B84
sub_080F8B84: @ 0x080F8B84
	ldr r2, _080F8B98
	ldr r1, _080F8B9C
	ldr r0, _080F8BA0
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080F8B98: .4byte 0x02037280
_080F8B9C: .4byte 0x02039BA0
_080F8BA0: .4byte 0x02037284
	thumb_func_end sub_080F8B84

	thumb_func_start sub_080F8BA4
sub_080F8BA4: @ 0x080F8BA4
	push {lr}
	movs r1, #0
	ldr r2, _080F8BCC
	ldrb r0, [r2]
	ldr r3, _080F8BD0
	cmp r0, #0
	beq _080F8BC4
_080F8BB2:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _080F8BC4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F8BB2
_080F8BC4:
	strh r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_080F8BCC: .4byte 0x02039BC0
_080F8BD0: .4byte 0x02037282
	thumb_func_end sub_080F8BA4

	thumb_func_start sub_080F8BD4
sub_080F8BD4: @ 0x080F8BD4
	push {r4, lr}
	movs r1, #0
	ldr r2, _080F8C08
	ldrb r0, [r2]
	ldr r4, _080F8C0C
	ldr r3, _080F8C10
	cmp r0, #0
	beq _080F8BF6
_080F8BE4:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _080F8BF6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F8BE4
_080F8BF6:
	lsls r1, r1, #6
	adds r1, r1, r3
	adds r0, r4, #0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8C08: .4byte 0x02039BC0
_080F8C0C: .4byte 0x02021C68
_080F8C10: .4byte 0x02039AAD
	thumb_func_end sub_080F8BD4

	thumb_func_start sub_080F8C14
sub_080F8C14: @ 0x080F8C14
	push {r4, lr}
	movs r1, #0
	ldr r2, _080F8C48
	ldrb r0, [r2]
	ldr r4, _080F8C4C
	ldr r3, _080F8C50
	cmp r0, #0
	beq _080F8C36
_080F8C24:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _080F8C36
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F8C24
_080F8C36:
	lsls r1, r1, #6
	adds r1, r1, r3
	adds r0, r4, #0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8C48: .4byte 0x02039BC0
_080F8C4C: .4byte 0x02021C40
_080F8C50: .4byte 0x02039AA2
	thumb_func_end sub_080F8C14

	thumb_func_start sub_080F8C54
sub_080F8C54: @ 0x080F8C54
	push {lr}
	ldr r0, _080F8C60
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080F8C60: .4byte 0x080D7351
	thumb_func_end sub_080F8C54

	thumb_func_start sub_080F8C64
sub_080F8C64: @ 0x080F8C64
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080F8C88
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080F8C82
	adds r0, r2, #0
	bl DestroyTask
	ldr r0, _080F8C8C
	bl SetMainCallback2
_080F8C82:
	pop {r0}
	bx r0
	.align 2, 0
_080F8C88: .4byte 0x02037C74
_080F8C8C: .4byte 0x080F8C55
	thumb_func_end sub_080F8C64

	thumb_func_start sub_080F8C90
sub_080F8C90: @ 0x080F8C90
	push {lr}
	sub sp, #4
	bl ScriptContext2_Enable
	ldr r0, _080F8CB8
	movs r1, #0xa
	bl CreateTask
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080F8CB8: .4byte 0x080F8C65
	thumb_func_end sub_080F8C90

	thumb_func_start sub_080F8CBC
sub_080F8CBC: @ 0x080F8CBC
	ldr r2, _080F8CD0
	ldr r1, _080F8CD4
	ldr r0, _080F8CD8
	ldrh r0, [r0]
	lsls r0, r0, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080F8CD0: .4byte 0x02037280
_080F8CD4: .4byte 0x02039AA0
_080F8CD8: .4byte 0x02037284
	thumb_func_end sub_080F8CBC

	thumb_func_start sub_080F8CDC
sub_080F8CDC: @ 0x080F8CDC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080F8D00
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080F8CFA
	adds r0, r2, #0
	bl DestroyTask
	ldr r0, _080F8D04
	bl SetMainCallback2
_080F8CFA:
	pop {r0}
	bx r0
	.align 2, 0
_080F8D00: .4byte 0x02037C74
_080F8D04: .4byte 0x080F6319
	thumb_func_end sub_080F8CDC

	thumb_func_start sub_080F8D08
sub_080F8D08: @ 0x080F8D08
	push {lr}
	sub sp, #4
	bl ScriptContext2_Enable
	ldr r0, _080F8D30
	movs r1, #0xa
	bl CreateTask
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080F8D30: .4byte 0x080F8CDD
	thumb_func_end sub_080F8D08

	thumb_func_start sub_080F8D34
sub_080F8D34: @ 0x080F8D34
	ldr r0, _080F8D40
	ldr r1, _080F8D44
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F8D40: .4byte 0x02037280
_080F8D44: .4byte 0x02039BC5
	thumb_func_end sub_080F8D34

	thumb_func_start sub_080F8D48
sub_080F8D48: @ 0x080F8D48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	bl ScriptContext2_Enable
	ldr r6, _080F8D80
	adds r0, r6, #0
	movs r1, #0
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r2, _080F8D84
	adds r0, r4, #0
	adds r1, r6, #0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080F8D88
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #0x1a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8D80: .4byte 0x080FCDF1
_080F8D84: .4byte 0x080F8D8D
_080F8D88: .4byte 0x03005B60
	thumb_func_end sub_080F8D48

	thumb_func_start sub_080F8D8C
sub_080F8D8C: @ 0x080F8D8C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080F8DB4
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080F8DC4
	ldr r0, _080F8DB8
	ldrb r0, [r0]
	bl sub_080DA0B8
	ldr r1, _080F8DBC
	ldr r2, _080F8DC0
	adds r0, r4, #0
	bl SetTaskFuncWithFollowupFunc
	b _080F8DDA
	.align 2, 0
_080F8DB4: .4byte 0x02039BCA
_080F8DB8: .4byte 0x02039BC4
_080F8DBC: .4byte 0x080FCF2D
_080F8DC0: .4byte 0x080F8DED
_080F8DC4:
	ldr r0, _080F8DE0
	ldrb r0, [r0]
	bl sub_080DA0B8
	ldr r1, _080F8DE4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080F8DE8
	str r1, [r0]
_080F8DDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8DE0: .4byte 0x02039BC4
_080F8DE4: .4byte 0x03005B60
_080F8DE8: .4byte 0x081D9691
	thumb_func_end sub_080F8D8C

	thumb_func_start sub_080F8DEC
sub_080F8DEC: @ 0x080F8DEC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080F8E00
	ldr r2, _080F8E04
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080F8E00: .4byte 0x080FD059
_080F8E04: .4byte 0x080F8E09
	thumb_func_end sub_080F8DEC

	thumb_func_start sub_080F8E08
sub_080F8E08: @ 0x080F8E08
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080F8E1C
	ldr r2, _080F8E20
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080F8E1C: .4byte 0x080FD69D
_080F8E20: .4byte 0x080F8E25
	thumb_func_end sub_080F8E08

	thumb_func_start sub_080F8E24
sub_080F8E24: @ 0x080F8E24
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080F8E38
	ldr r2, _080F8E3C
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080F8E38: .4byte 0x080FD0E9
_080F8E3C: .4byte 0x080F8E41
	thumb_func_end sub_080F8E24

	thumb_func_start sub_080F8E40
sub_080F8E40: @ 0x080F8E40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #0
	ldr r5, _080F8EBC
	mov ip, r5
	ldr r0, _080F8EC0
	mov sb, r0
	add r1, sp, #4
	mov r8, r1
	ldrb r0, [r5]
	cmp r3, r0
	bhs _080F8E8A
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r4, r0, #3
	ldr r7, _080F8EC4
_080F8E70:
	mov r1, sp
	adds r2, r1, r3
	adds r1, r3, #1
	lsls r0, r1, #1
	adds r0, r0, r4
	adds r0, r0, r7
	ldrh r0, [r0]
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldrb r0, [r5]
	cmp r3, r0
	blo _080F8E70
_080F8E8A:
	movs r3, #0
	mov r1, ip
	ldrb r0, [r1]
	cmp r3, r0
	bhs _080F8EAE
	adds r4, r0, #0
	mov r2, sp
_080F8E98:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	bhs _080F8EAE
	mov r0, sp
	adds r1, r0, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F8E98
_080F8EAE:
	mov r1, ip
	ldrb r1, [r1]
	cmp r3, r1
	bne _080F8EC8
	movs r0, #0
	b _080F8ECA
	.align 2, 0
_080F8EBC: .4byte 0x02039BD0
_080F8EC0: .4byte 0x02037280
_080F8EC4: .4byte 0x03005B68
_080F8EC8:
	movs r0, #1
_080F8ECA:
	mov r1, sb
	strh r0, [r1]
	movs r3, #0
	mov r4, ip
	ldrb r0, [r4]
	cmp r3, r0
	bhs _080F8EFC
	mov r5, r8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r2, r0, #3
	ldr r7, _080F8F28
_080F8EE2:
	adds r1, r5, r3
	adds r0, r3, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r0, r0, r7
	ldrh r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r1, [r4]
	cmp r3, r1
	blo _080F8EE2
_080F8EFC:
	mov r0, r8
	bl sub_080F8F64
	ldr r1, _080F8F2C
	strb r0, [r1]
	ldr r0, _080F8F30
	ldrb r0, [r0]
	bl sub_080DA800
	ldr r1, _080F8F34
	ldr r2, _080F8F38
	adds r0, r6, #0
	bl SetTaskFuncWithFollowupFunc
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F8F28: .4byte 0x03005B68
_080F8F2C: .4byte 0x02039BCB
_080F8F30: .4byte 0x02039BCC
_080F8F34: .4byte 0x080FD795
_080F8F38: .4byte 0x080F8F3D
	thumb_func_end sub_080F8E40

	thumb_func_start sub_080F8F3C
sub_080F8F3C: @ 0x080F8F3C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	bl SortContestants
	ldr r1, _080F8F5C
	ldr r2, _080F8F60
	adds r0, r4, #0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8F5C: .4byte 0x080FD825
_080F8F60: .4byte 0x080F8F99
	thumb_func_end sub_080F8F3C

	thumb_func_start sub_080F8F64
sub_080F8F64: @ 0x080F8F64
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	movs r2, #1
	ldr r0, _080F8F94
	ldrb r0, [r0]
	cmp r2, r0
	bge _080F8F8C
	adds r5, r0, #0
_080F8F76:
	adds r0, r3, r4
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _080F8F86
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
_080F8F86:
	adds r2, #1
	cmp r2, r5
	blt _080F8F76
_080F8F8C:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F8F94: .4byte 0x02039BD0
	thumb_func_end sub_080F8F64

	thumb_func_start sub_080F8F98
sub_080F8F98: @ 0x080F8F98
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080F8FC0
	ldrh r0, [r0]
	cmp r0, #1
	bne _080F8FCC
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080F900C
	ldr r0, _080F8FC4
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080F8FC8
	str r0, [r1]
	b _080F900C
	.align 2, 0
_080F8FC0: .4byte 0x02037280
_080F8FC4: .4byte 0x03005B60
_080F8FC8: .4byte 0x080F901D
_080F8FCC:
	ldr r0, _080F9014
	adds r4, r0, #2
	movs r7, #0xff
	movs r5, #3
_080F8FD4:
	ldrb r0, [r4, #0x10]
	orrs r0, r7
	strb r0, [r4, #0x10]
	adds r0, r4, #0
	bl StringGetEnd10
	adds r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge _080F8FD4
	adds r0, r6, #0
	bl DestroyTask
	ldr r0, _080F9018
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	bl SetDynamicWarp
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_080F900C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9014: .4byte 0x02039AA0
_080F9018: .4byte 0x03005AEC
	thumb_func_end sub_080F8F98

	thumb_func_start sub_080F901C
sub_080F901C: @ 0x080F901C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_0800A7F8
	ldr r1, _080F903C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080F9040
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F903C: .4byte 0x03005B60
_080F9040: .4byte 0x080F9045
	thumb_func_end sub_080F901C

	thumb_func_start sub_080F9044
sub_080F9044: @ 0x080F9044
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080F9064
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F9060
	adds r0, r1, #0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_080F9060:
	pop {r0}
	bx r0
	.align 2, 0
_080F9064: .4byte 0x030031C4
	thumb_func_end sub_080F9044

