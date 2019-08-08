.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0812FDE0
sub_0812FDE0: @ 0x0812FDE0
	push {r4, r5, r6, r7, lr}
	ldr r3, _0812FE10
	ldr r4, _0812FE14
	ldr r1, _0812FE18
	ldr r2, [r1]
	subs r0, #1
	lsls r1, r0, #5
	adds r2, r2, r1
	ldr r1, _0812FE1C
	ldr r5, _0812FE20
	adds r2, r2, r5
	ldm r2!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r2!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r2!, {r6, r7}
	stm r1!, {r6, r7}
	strb r0, [r3]
	movs r0, #0
	strb r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FE10: .4byte 0x02039BFD
_0812FE14: .4byte 0x02039BFC
_0812FE18: .4byte 0x03005AEC
_0812FE1C: .4byte 0x02039BDC
_0812FE20: .4byte 0x00002E90
	thumb_func_end sub_0812FDE0

	thumb_func_start CB2_ContestPainting
CB2_ContestPainting: @ 0x0812FE24
	push {lr}
	bl ShowContestPainting
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_ContestPainting

	thumb_func_start CB2_HoldContestPainting
CB2_HoldContestPainting: @ 0x0812FE30
	push {lr}
	bl HoldContestPainting
	bl RunTextPrinters
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_HoldContestPainting

	thumb_func_start CB2_QuitContestPainting
CB2_QuitContestPainting: @ 0x0812FE44
	push {r4, r5, lr}
	ldr r0, _0812FE80
	ldr r0, [r0, #8]
	bl SetMainCallback2
	ldr r4, _0812FE84
	ldr r0, [r4]
	bl Free
	movs r5, #0
	str r5, [r4]
	ldr r4, _0812FE88
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r0, _0812FE8C
	ldrb r0, [r0]
	bl RemoveWindow
	movs r0, #1
	bl GetBgTilemapBuffer
	bl Free
	bl FreeMonSpritesGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812FE80: .4byte 0x03002360
_0812FE84: .4byte 0x03005F04
_0812FE88: .4byte 0x03005ED0
_0812FE8C: .4byte 0x030011F7
	thumb_func_end CB2_QuitContestPainting

	thumb_func_start ShowContestPainting
ShowContestPainting: @ 0x0812FE90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _0812FEB0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #4
	bls _0812FEA6
	b _0812FFD8
_0812FEA6:
	lsls r0, r0, #2
	ldr r1, _0812FEB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812FEB0: .4byte 0x03002360
_0812FEB4: .4byte 0x0812FEB8
_0812FEB8: @ jump table
	.4byte _0812FECC @ case 0
	.4byte _0812FF00 @ case 1
	.4byte _0812FF4C @ case 2
	.4byte _0812FF62 @ case 3
	.4byte _0812FF8C @ case 4
_0812FECC:
	bl ScanlineEffect_Stop
	movs r0, #0
	bl SetVBlankCallback
	bl AllocateMonSpritesGfx
	ldr r1, _0812FEF4
	ldr r0, _0812FEF8
	str r0, [r1]
	movs r0, #1
	bl InitContestPaintingVars
	bl InitContestPaintingBg
	ldr r1, _0812FEFC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0812FF76
	.align 2, 0
_0812FEF4: .4byte 0x03005F00
_0812FEF8: .4byte 0x02039BDC
_0812FEFC: .4byte 0x03002360
_0812FF00:
	bl ResetPaletteFade
	movs r2, #0xc0
	lsls r2, r2, #0x13
	movs r3, #0xc0
	lsls r3, r3, #9
	movs r5, #0
	ldr r1, _0812FF44
	movs r4, #0x80
	lsls r4, r4, #5
	ldr r6, _0812FF48
	movs r7, #0x85
	lsls r7, r7, #0x18
_0812FF1A:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, r2, r4
	subs r3, r3, r4
	cmp r3, r4
	bhi _0812FF1A
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	lsrs r0, r3, #2
	orrs r0, r7
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl ResetSpriteData
	b _0812FF6E
	.align 2, 0
_0812FF44: .4byte 0x040000D4
_0812FF48: .4byte 0x85000400
_0812FF4C:
	ldrh r0, [r4, #0x20]
	bl SeedRng
	bl InitKeys
	bl InitContestPaintingWindow
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r4, r0
	b _0812FF76
_0812FF62:
	ldr r0, _0812FF80
	ldrb r0, [r0]
	ldr r1, _0812FF84
	ldrb r1, [r1]
	bl sub_081308DC
_0812FF6E:
	ldr r1, _0812FF88
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_0812FF76:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0812FFD8
	.align 2, 0
_0812FF80: .4byte 0x02039BFD
_0812FF84: .4byte 0x02039BFC
_0812FF88: .4byte 0x03002360
_0812FF8C:
	ldr r0, _0812FFE0
	ldrb r0, [r0]
	ldr r1, _0812FFE4
	ldrb r1, [r1]
	bl PrintContestPaintingCaption
	ldr r0, _0812FFE8
	movs r1, #0
	movs r2, #2
	bl LoadPalette
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r4, #0
	str r4, [sp]
	ldr r0, _0812FFEC
	mov r2, sp
	str r2, [r0]
	str r1, [r0, #4]
	ldr r1, _0812FFF0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r0, #2
	bl BeginFastPaletteFade
	ldr r0, _0812FFF4
	bl SetVBlankCallback
	ldr r0, _0812FFF8
	strb r4, [r0]
	movs r1, #0x9a
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0812FFFC
	bl SetMainCallback2
_0812FFD8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FFE0: .4byte 0x02039BFD
_0812FFE4: .4byte 0x02039BFC
_0812FFE8: .4byte 0x0858F648
_0812FFEC: .4byte 0x040000D4
_0812FFF0: .4byte 0x85000100
_0812FFF4: .4byte 0x08130329
_0812FFF8: .4byte 0x030011F0
_0812FFFC: .4byte 0x0812FE31
	thumb_func_end ShowContestPainting

	thumb_func_start HoldContestPainting
HoldContestPainting: @ 0x08130000
	push {lr}
	sub sp, #4
	ldr r3, _08130018
	ldrb r1, [r3]
	cmp r1, #1
	beq _08130054
	cmp r1, #1
	bgt _0813001C
	cmp r1, #0
	beq _08130022
	b _081300BA
	.align 2, 0
_08130018: .4byte 0x030011F0
_0813001C:
	cmp r1, #2
	beq _08130094
	b _081300BA
_08130022:
	ldr r0, _08130048
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08130032
	movs r0, #1
	strb r0, [r3]
_08130032:
	ldr r0, _0813004C
	ldrb r0, [r0]
	cmp r0, #0
	beq _081300BA
	ldr r1, _08130050
	ldrh r0, [r1]
	cmp r0, #0
	beq _081300BA
	subs r0, #1
	b _081300B8
	.align 2, 0
_08130048: .4byte 0x02037C74
_0813004C: .4byte 0x030011F6
_08130050: .4byte 0x030011F4
_08130054:
	ldr r0, _08130088
	ldrh r2, [r0, #0x2e]
	ands r1, r2
	cmp r1, #0
	bne _08130066
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08130078
_08130066:
	movs r0, #2
	strb r0, [r3]
	subs r0, #3
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_08130078:
	ldr r0, _0813008C
	ldrb r0, [r0]
	cmp r0, #0
	beq _081300BA
	ldr r1, _08130090
	movs r0, #0
	b _081300B8
	.align 2, 0
_08130088: .4byte 0x03002360
_0813008C: .4byte 0x030011F6
_08130090: .4byte 0x030011F4
_08130094:
	ldr r0, _081300C0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081300A6
	ldr r0, _081300C4
	bl SetMainCallback2
_081300A6:
	ldr r0, _081300C8
	ldrb r0, [r0]
	cmp r0, #0
	beq _081300BA
	ldr r1, _081300CC
	ldrh r0, [r1]
	cmp r0, #0x1d
	bhi _081300BA
	adds r0, #1
_081300B8:
	strh r0, [r1]
_081300BA:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_081300C0: .4byte 0x02037C74
_081300C4: .4byte 0x0812FE45
_081300C8: .4byte 0x030011F6
_081300CC: .4byte 0x030011F4
	thumb_func_end HoldContestPainting

	thumb_func_start InitContestPaintingWindow
InitContestPaintingWindow: @ 0x081300D0
	push {r4, lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08130138
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0x80
	lsls r0, r0, #4
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r4, _0813013C
	ldr r0, _08130140
	bl AddWindow
	strb r0, [r4]
	bl DeactivateAllTextPrinters
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	bl ShowBg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130138: .4byte 0x0858F5F8
_0813013C: .4byte 0x030011F7
_08130140: .4byte 0x0858F5FC
	thumb_func_end InitContestPaintingWindow

	thumb_func_start PrintContestPaintingCaption
PrintContestPaintingCaption: @ 0x08130144
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _0813022A
	ldr r6, _081301C8
	ldr r1, [r6]
	ldrb r5, [r1, #0xa]
	cmp r0, #7
	bhi _081301F4
	ldr r4, _081301CC
	ldr r1, _081301D0
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _081301D4
	adds r0, r4, #0
	bl StringAppend
	ldr r1, _081301D8
	adds r0, r4, #0
	bl StringAppend
	ldr r1, _081301DC
	ldr r0, [r6]
	ldrb r0, [r0, #0x1e]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringAppend
	ldr r0, _081301E0
	ldr r1, [r6]
	adds r1, #0x16
	bl StringCopy
	ldr r0, _081301E4
	ldr r1, [r6]
	adds r1, #0xb
	bl StringCopy
	ldr r4, _081301E8
	ldr r1, _081301EC
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r0, _081301F0
	ldrb r0, [r0]
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #8
	bl AddTextPrinterParameterized
	b _08130224
	.align 2, 0
_081301C8: .4byte 0x03005F00
_081301CC: .4byte 0x02021C40
_081301D0: .4byte 0x0858F5D0
_081301D4: .4byte 0x0824C200
_081301D8: .4byte 0x085C941F
_081301DC: .4byte 0x0858F5E4
_081301E0: .4byte 0x02021C54
_081301E4: .4byte 0x02021C68
_081301E8: .4byte 0x02021C7C
_081301EC: .4byte 0x0824C1F5
_081301F0: .4byte 0x030011F7
_081301F4:
	ldr r0, _08130234
	adds r1, #0xb
	bl StringCopy
	ldr r4, _08130238
	ldr r1, _0813023C
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r0, _08130240
	ldrb r0, [r0]
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
_08130224:
	movs r0, #1
	bl CopyBgTilemapBufferToVram
_0813022A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08130234: .4byte 0x02021C40
_08130238: .4byte 0x02021C7C
_0813023C: .4byte 0x0858F604
_08130240: .4byte 0x030011F7
	thumb_func_end PrintContestPaintingCaption

	thumb_func_start InitContestPaintingBg
InitContestPaintingBg: @ 0x08130244
	push {lr}
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	ldr r2, _08130284
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08130288
	movs r0, #8
	bl SetGpuReg
	ldr r1, _0813028C
	movs r0, #0xa
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
_08130284: .4byte 0x04000200
_08130288: .4byte 0x00000C42
_0813028C: .4byte 0x00000A45
	thumb_func_end InitContestPaintingBg

	thumb_func_start InitContestPaintingVars
InitContestPaintingVars: @ 0x08130290
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _081302B4
	ldr r0, _081302A8
	strb r1, [r0]
	ldr r0, _081302AC
	strh r1, [r0]
	ldr r0, _081302B0
	strh r1, [r0]
	b _081302C6
	.align 2, 0
_081302A8: .4byte 0x030011F6
_081302AC: .4byte 0x030011F2
_081302B0: .4byte 0x030011F4
_081302B4:
	ldr r1, _081302CC
	movs r0, #1
	strb r0, [r1]
	ldr r1, _081302D0
	movs r0, #0xf
	strh r0, [r1]
	ldr r1, _081302D4
	movs r0, #0x1e
	strh r0, [r1]
_081302C6:
	pop {r0}
	bx r0
	.align 2, 0
_081302CC: .4byte 0x030011F6
_081302D0: .4byte 0x030011F2
_081302D4: .4byte 0x030011F4
	thumb_func_end InitContestPaintingVars

	thumb_func_start UpdateContestPaintingMosaicEffect
UpdateContestPaintingMosaicEffect: @ 0x081302D8
	push {lr}
	ldr r0, _081302EC
	ldrb r0, [r0]
	cmp r0, #0
	bne _081302F0
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	b _08130318
	.align 2, 0
_081302EC: .4byte 0x030011F6
_081302F0:
	ldr r1, _0813031C
	movs r0, #0xa
	bl SetGpuReg
	ldr r1, _08130320
	ldr r0, _08130324
	ldrh r0, [r0]
	lsrs r0, r0, #1
	strh r0, [r1]
	lsls r1, r0, #0xc
	lsls r2, r0, #8
	orrs r1, r2
	lsls r2, r0, #4
	orrs r1, r2
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x4c
	bl SetGpuReg
_08130318:
	pop {r0}
	bx r0
	.align 2, 0
_0813031C: .4byte 0x00000A45
_08130320: .4byte 0x030011F2
_08130324: .4byte 0x030011F4
	thumb_func_end UpdateContestPaintingMosaicEffect

	thumb_func_start VBlankCB_ContestPainting
VBlankCB_ContestPainting: @ 0x08130328
	push {lr}
	bl UpdateContestPaintingMosaicEffect
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_ContestPainting

	thumb_func_start sub_08130340
sub_08130340: @ 0x08130340
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _0813038C
	ldr r0, [r6]
	ldr r1, [r0, #4]
	ldr r2, [r0]
	adds r0, r5, #0
	bl GetMonSpritePalFromSpeciesAndPersonality
	ldr r7, _08130390
	ldr r1, [r7]
	bl LZDecompressWram
	cmp r4, #0
	bne _081303A0
	lsls r0, r5, #3
	ldr r1, _08130394
	adds r0, r0, r1
	ldr r4, _08130398
	ldr r1, [r4]
	ldr r1, [r1, #8]
	ldr r2, [r6]
	ldr r3, [r2]
	adds r2, r5, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	ldr r0, [r4]
	ldr r0, [r0, #8]
	ldr r1, [r7]
	ldr r2, _0813039C
	ldr r2, [r2]
	bl sub_081303D8
	b _081303C4
	.align 2, 0
_0813038C: .4byte 0x03005F00
_08130390: .4byte 0x03005F04
_08130394: .4byte 0x082DDA1C
_08130398: .4byte 0x02024178
_0813039C: .4byte 0x03005ED0
_081303A0:
	lsls r0, r5, #3
	ldr r1, _081303CC
	adds r0, r0, r1
	ldr r4, _081303D0
	ldr r1, [r4]
	ldr r1, [r1, #4]
	ldr r2, [r6]
	ldr r3, [r2]
	adds r2, r5, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	ldr r0, [r4]
	ldr r0, [r0, #4]
	ldr r1, [r7]
	ldr r2, _081303D4
	ldr r2, [r2]
	bl sub_081303D8
_081303C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081303CC: .4byte 0x082D6148
_081303D0: .4byte 0x02024178
_081303D4: .4byte 0x03005ED0
	thumb_func_end sub_08130340

	thumb_func_start sub_081303D8
sub_081303D8: @ 0x081303D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	mov sb, r1
	str r2, [sp]
	movs r0, #0
_081303EC:
	movs r3, #0
	adds r1, r0, #1
	str r1, [sp, #4]
	lsls r0, r0, #3
	str r0, [sp, #8]
_081303F6:
	movs r1, #0
	adds r2, r3, #1
	mov r8, r2
	ldr r7, [sp, #8]
	adds r0, r7, r3
	lsls r0, r0, #5
	mov ip, r0
	lsls r4, r3, #3
_08130406:
	movs r3, #0
	lsls r0, r1, #2
	adds r6, r1, #1
	mov r2, ip
	adds r5, r2, r0
	ldr r7, [sp, #8]
	adds r0, r7, r1
	lsls r0, r0, #7
	ldr r1, [sp]
	adds r2, r0, r1
_0813041A:
	lsrs r0, r3, #1
	adds r0, r5, r0
	add r0, sl
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0813042E
	lsrs r1, r1, #4
	b _08130432
_0813042E:
	movs r0, #0xf
	ands r1, r0
_08130432:
	cmp r1, #0
	bne _08130444
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r7, #0x80
	lsls r7, r7, #8
	adds r1, r7, #0
	b _08130450
_08130444:
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	lsls r1, r1, #1
	add r1, sb
	ldrh r1, [r1]
_08130450:
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #7
	bls _0813041A
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #7
	bls _08130406
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #7
	bls _081303F6
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #7
	bls _081303EC
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081303D8

	thumb_func_start sub_08130488
sub_08130488: @ 0x08130488
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081304C4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl LoadPalette
	cmp r4, #1
	beq _081304A6
	b _081305FC
_081304A6:
	ldr r0, _081304C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _08130564
	lsls r0, r0, #2
	ldr r1, _081304CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081304C4: .4byte 0x085886AC
_081304C8: .4byte 0x03005F00
_081304CC: .4byte 0x081304D0
_081304D0: @ jump table
	.4byte _081304E4 @ case 0
	.4byte _081304FC @ case 1
	.4byte _08130514 @ case 2
	.4byte _0813052C @ case 3
	.4byte _08130550 @ case 4
_081304E4:
	ldr r0, _081304F4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _081304F8
	b _08130538
	.align 2, 0
_081304F4: .4byte 0x085888AC
_081304F8: .4byte 0x0858D784
_081304FC:
	ldr r0, _0813050C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _08130510
	b _08130538
	.align 2, 0
_0813050C: .4byte 0x08589930
_08130510: .4byte 0x0858DC90
_08130514:
	ldr r0, _08130524
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _08130528
	b _08130538
	.align 2, 0
_08130524: .4byte 0x0858A560
_08130528: .4byte 0x0858E19C
_0813052C:
	ldr r0, _08130544
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _08130548
_08130538:
	ldr r1, _0813054C
	ldr r1, [r1]
	bl RLUnCompWram
	b _08130564
	.align 2, 0
_08130544: .4byte 0x0858B098
_08130548: .4byte 0x0858E6A8
_0813054C: .4byte 0x03005ED0
_08130550:
	ldr r0, _081305E0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _081305E4
	ldr r1, _081305E8
	ldr r1, [r1]
	bl RLUnCompWram
_08130564:
	movs r1, #0
	ldr r5, _081305EC
	ldr r0, _081305F0
	adds r4, r0, #0
_0813056C:
	movs r3, #0
	lsls r2, r1, #5
_08130570:
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r4, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _08130570
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bls _0813056C
	movs r1, #0
	ldr r0, _081305F4
	mov ip, r0
	ldr r7, _081305E8
_08130594:
	movs r3, #0
	adds r6, r1, #1
	lsls r5, r1, #5
	lsls r4, r1, #6
_0813059C:
	adds r2, r5, r3
	lsls r2, r2, #1
	add r2, ip
	ldr r0, [r7]
	adds r0, r4, r0
	lsls r1, r3, #1
	adds r0, r0, r1
	adds r0, #0x8c
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x11
	bls _0813059C
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	bls _08130594
	movs r3, #0
	ldr r4, _081305F8
	ldr r2, _081305E8
_081305C8:
	lsls r1, r3, #1
	adds r1, r1, r4
	ldr r0, [r2]
	adds r0, #0x8e
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _081305C8
	b _081306CE
	.align 2, 0
_081305E0: .4byte 0x0858C050
_081305E4: .4byte 0x0858EBB4
_081305E8: .4byte 0x03005ED0
_081305EC: .4byte 0x06006000
_081305F0: .4byte 0x00001015
_081305F4: .4byte 0x0600608C
_081305F8: .4byte 0x0600608E
_081305FC:
	cmp r5, #7
	bhi _08130618
	ldr r0, _08130610
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _08130614
	b _081306A8
	.align 2, 0
_08130610: .4byte 0x0858D180
_08130614: .4byte 0x0858F0C0
_08130618:
	ldr r0, _08130638
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _081306CE
	lsls r0, r0, #2
	ldr r1, _0813063C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08130638: .4byte 0x03005F00
_0813063C: .4byte 0x08130640
_08130640: @ jump table
	.4byte _08130654 @ case 0
	.4byte _0813066C @ case 1
	.4byte _08130684 @ case 2
	.4byte _0813069C @ case 3
	.4byte _081306BC @ case 4
_08130654:
	ldr r0, _08130664
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _08130668
	b _081306A8
	.align 2, 0
_08130664: .4byte 0x085888AC
_08130668: .4byte 0x0858D784
_0813066C:
	ldr r0, _0813067C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _08130680
	b _081306A8
	.align 2, 0
_0813067C: .4byte 0x08589930
_08130680: .4byte 0x0858DC90
_08130684:
	ldr r0, _08130694
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _08130698
	b _081306A8
	.align 2, 0
_08130694: .4byte 0x0858A560
_08130698: .4byte 0x0858E19C
_0813069C:
	ldr r0, _081306B0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _081306B4
_081306A8:
	ldr r1, _081306B8
	bl RLUnCompVram
	b _081306CE
	.align 2, 0
_081306B0: .4byte 0x0858B098
_081306B4: .4byte 0x0858E6A8
_081306B8: .4byte 0x06006000
_081306BC:
	ldr r0, _081306D4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl RLUnCompVram
	ldr r0, _081306D8
	ldr r1, _081306DC
	bl RLUnCompVram
_081306CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081306D4: .4byte 0x0858C050
_081306D8: .4byte 0x0858EBB4
_081306DC: .4byte 0x06006000
	thumb_func_end sub_08130488

	thumb_func_start sub_081306E0
sub_081306E0: @ 0x081306E0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08130714
	ldr r1, _08130718
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [r3, #0x38]
	str r2, [r3, #0x3c]
	ldrh r2, [r3, #0x3c]
	ldr r1, _0813071C
	ands r1, r2
	strh r1, [r3, #0x3c]
	ldrh r1, [r3, #0x3a]
	ldr r0, _08130720
	ands r0, r1
	movs r1, #0x58
	orrs r0, r1
	strh r0, [r3, #0x3a]
	adds r1, r3, #0
	adds r1, #0x38
	movs r0, #0x18
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08130714: .4byte 0x03002360
_08130718: .4byte 0x0858F640
_0813071C: .4byte 0xFFFFFC00
_08130720: .4byte 0xFFFFFE00
	thumb_func_end sub_081306E0

	thumb_func_start sub_08130724
sub_08130724: @ 0x08130724
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _0813073C
	ldr r0, _08130738
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	b _0813074C
	.align 2, 0
_08130738: .4byte 0x03005F00
_0813073C:
	ldr r0, _0813075C
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0813074C:
	cmp r0, #4
	bhi _0813078A
	lsls r0, r0, #2
	ldr r1, _08130760
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813075C: .4byte 0x03005F00
_08130760: .4byte 0x08130764
_08130764: @ jump table
	.4byte _08130778 @ case 0
	.4byte _0813077C @ case 1
	.4byte _08130780 @ case 2
	.4byte _08130784 @ case 3
	.4byte _08130788 @ case 4
_08130778:
	movs r0, #9
	b _0813078A
_0813077C:
	movs r0, #0xd
	b _0813078A
_08130780:
	movs r0, #2
	b _0813078A
_08130784:
	movs r0, #0x24
	b _0813078A
_08130788:
	movs r0, #6
_0813078A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08130724

	thumb_func_start sub_08130790
sub_08130790: @ 0x08130790
	push {r4, lr}
	ldr r4, _081307B0
	movs r0, #0x80
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	ldr r4, _081307B4
	movs r0, #0x80
	lsls r0, r0, #6
	bl AllocZeroed
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081307B0: .4byte 0x03005F04
_081307B4: .4byte 0x03005ED0
	thumb_func_end sub_08130790

	thumb_func_start sub_081307B8
sub_081307B8: @ 0x081307B8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _081307F8
	ldr r0, _081307FC
	ldr r0, [r0]
	str r0, [r1, #4]
	ldr r0, _08130800
	ldr r0, [r0]
	str r0, [r1, #8]
	movs r2, #0
	strb r2, [r1, #0x18]
	ldr r0, _08130804
	ldr r0, [r0]
	ldrb r0, [r0]
	strb r0, [r1, #0x1f]
	strb r2, [r1, #0x19]
	strb r2, [r1, #0x1a]
	movs r0, #0x40
	strb r0, [r1, #0x1b]
	strb r0, [r1, #0x1c]
	strb r0, [r1, #0x1d]
	strb r0, [r1, #0x1e]
	subs r0, r3, #2
	adds r4, r1, #0
	cmp r0, #0x22
	bhi _0813089C
	lsls r0, r0, #2
	ldr r1, _08130808
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081307F8: .4byte 0x03005EE0
_081307FC: .4byte 0x03005ED0
_08130800: .4byte 0x03005F04
_08130804: .4byte 0x03005F00
_08130808: .4byte 0x0813080C
_0813080C: @ jump table
	.4byte _0813089C @ case 0
	.4byte _0813089C @ case 1
	.4byte _0813089C @ case 2
	.4byte _0813089C @ case 3
	.4byte _08130898 @ case 4
	.4byte _0813089C @ case 5
	.4byte _0813089C @ case 6
	.4byte _0813089C @ case 7
	.4byte _0813089C @ case 8
	.4byte _0813089C @ case 9
	.4byte _0813089C @ case 10
	.4byte _0813089C @ case 11
	.4byte _0813089C @ case 12
	.4byte _0813089C @ case 13
	.4byte _0813089C @ case 14
	.4byte _0813089C @ case 15
	.4byte _0813089C @ case 16
	.4byte _0813089C @ case 17
	.4byte _0813089C @ case 18
	.4byte _0813089C @ case 19
	.4byte _0813089C @ case 20
	.4byte _0813089C @ case 21
	.4byte _0813089C @ case 22
	.4byte _0813089C @ case 23
	.4byte _0813089C @ case 24
	.4byte _0813089C @ case 25
	.4byte _0813089C @ case 26
	.4byte _0813089C @ case 27
	.4byte _0813089C @ case 28
	.4byte _0813089C @ case 29
	.4byte _0813089C @ case 30
	.4byte _0813089C @ case 31
	.4byte _0813089C @ case 32
	.4byte _0813089C @ case 33
	.4byte _08130898 @ case 34
_08130898:
	movs r0, #3
	b _0813089E
_0813089C:
	movs r0, #1
_0813089E:
	strh r0, [r4, #0x14]
	movs r0, #2
	strh r0, [r4, #0x16]
	strb r3, [r4]
	ldr r0, _081308D4
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08124F14
	adds r0, r4, #0
	bl sub_0812618C
	adds r0, r4, #0
	bl sub_08126040
	ldr r0, _081308D8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #2
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081308D4: .4byte 0x06010000
_081308D8: .4byte 0x03005F04
	thumb_func_end sub_081307B8

	thumb_func_start sub_081308DC
sub_081308DC: @ 0x081308DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	bl sub_08130790
	ldr r0, _0813091C
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	movs r1, #0
	bl sub_08130340
	adds r0, r4, #0
	bl sub_08130724
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081307B8
	adds r0, r4, #0
	bl sub_081306E0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08130488
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813091C: .4byte 0x03005F00
	thumb_func_end sub_081308DC

