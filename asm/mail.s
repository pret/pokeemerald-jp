.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ReadMail
ReadMail: @ 0x08121568
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r4, _081215B4
	ldr r0, _081215B8
	bl AllocZeroed
	str r0, [r4]
	adds r0, #0xdd
	movs r3, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0xde
	strb r3, [r0]
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0xe0
	ldr r0, _081215BC
	str r0, [r1]
	adds r1, #4
	ldr r0, _081215C0
	str r0, [r1]
	ldrh r1, [r5, #0x20]
	adds r0, r1, #0
	subs r0, #0x79
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb
	bhi _081215C4
	subs r1, #0x79
	adds r0, r2, #0
	adds r0, #0xda
	strb r1, [r0]
	b _081215CC
	.align 2, 0
_081215B4: .4byte 0x02039E00
_081215B8: .4byte 0x000020EC
_081215BC: .4byte 0x0811F181
_081215C0: .4byte 0x0811F1CD
_081215C4:
	adds r0, r2, #0
	adds r0, #0xda
	strb r3, [r0]
	movs r6, #0
_081215CC:
	ldr r0, _081215EC
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0xde
	ldrb r1, [r1]
	cmp r1, #0
	beq _081215DE
	cmp r1, #1
	beq _081215F4
_081215DE:
	adds r2, r0, #0
	adds r2, #0xe8
	adds r0, #0xda
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _081215F0
	b _08121600
	.align 2, 0
_081215EC: .4byte 0x02039E00
_081215F0: .4byte 0x0857AFE0
_081215F4:
	adds r2, r0, #0
	adds r2, #0xe8
	adds r0, #0xda
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _08121638
_08121600:
	adds r0, r0, r1
	str r0, [r2]
	ldrh r0, [r5, #0x1e]
	mov r1, sp
	bl MailSpeciesToSpecies
	lsls r0, r0, #0x10
	ldr r1, _0812163C
	adds r0, r0, r1
	movs r1, #0xcd
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08121654
	ldr r0, _08121640
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0xda
	ldrb r2, [r2]
	adds r3, r0, #0
	cmp r2, #6
	beq _08121644
	cmp r2, #9
	beq _0812164C
	adds r1, #0xdb
	movs r0, #0
	strb r0, [r1]
	b _08121660
	.align 2, 0
_08121638: .4byte 0x0857B054
_0812163C: .4byte 0xFFFF0000
_08121640: .4byte 0x02039E00
_08121644:
	adds r1, #0xdb
	movs r0, #1
	strb r0, [r1]
	b _08121660
_0812164C:
	adds r1, #0xdb
	movs r0, #2
	strb r0, [r1]
	b _08121660
_08121654:
	ldr r0, _08121680
	ldr r1, [r0]
	adds r1, #0xdb
	movs r2, #0
	strb r2, [r1]
	adds r3, r0, #0
_08121660:
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0xd4
	str r5, [r0]
	subs r0, #8
	str r7, [r0]
	adds r0, #0xc
	strb r6, [r0]
	ldr r0, _08121684
	bl SetMainCallback2
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08121680: .4byte 0x02039E00
_08121684: .4byte 0x08121A61
	thumb_func_end ReadMail

	thumb_func_start MailReadBuildGraphics
MailReadBuildGraphics: @ 0x08121688
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _081216A8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x12
	bls _0812169C
	b _08121A52
_0812169C:
	lsls r0, r0, #2
	ldr r1, _081216AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081216A8: .4byte 0x03002360
_081216AC: .4byte 0x081216B0
_081216B0: @ jump table
	.4byte _081216FC @ case 0
	.4byte _0812170A @ case 1
	.4byte _08121724 @ case 2
	.4byte _0812172A @ case 3
	.4byte _08121730 @ case 4
	.4byte _08121736 @ case 5
	.4byte _08121790 @ case 6
	.4byte _081217C8 @ case 7
	.4byte _081217D8 @ case 8
	.4byte _08121808 @ case 9
	.4byte _08121816 @ case 10
	.4byte _08121864 @ case 11
	.4byte _08121878 @ case 12
	.4byte _08121938 @ case 13
	.4byte _08121950 @ case 14
	.4byte _0812196C @ case 15
	.4byte _08121976 @ case 16
	.4byte _08121990 @ case 17
	.4byte _081219F4 @ case 18
_081216FC:
	movs r0, #0
	bl SetVBlankCallback
	bl ScanlineEffect_Stop
	movs r0, #0
	b _08121788
_0812170A:
	add r1, sp, #8
	movs r0, #0
	strh r0, [r1]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ldr r2, _08121720
	add r0, sp, #8
	bl CpuSet
	b _08121A44
	.align 2, 0
_08121720: .4byte 0x01000200
_08121724:
	bl ResetPaletteFade
	b _08121A44
_0812172A:
	bl ResetTasks
	b _08121A44
_08121730:
	bl ResetSpriteData
	b _08121A44
_08121736:
	bl FreeAllSpritePalettes
	bl reset_temp_tile_data_buffers
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
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
_08121788:
	movs r1, #0
	bl SetGpuReg
	b _08121A44
_08121790:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081217BC
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _081217C0
	ldr r1, [r4]
	adds r1, #0xec
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081217C4
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	b _08121A44
	.align 2, 0
_081217BC: .4byte 0x0857AEB4
_081217C0: .4byte 0x02039E00
_081217C4: .4byte 0x000010EC
_081217C8:
	ldr r0, _081217D4
	bl InitWindows
	bl DeactivateAllTextPrinters
	b _08121A44
	.align 2, 0
_081217D4: .4byte 0x0857AEC0
_081217D8:
	ldr r2, _08121800
	ldr r0, _08121804
	ldr r0, [r0]
	adds r0, #0xda
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _08121A44
	.align 2, 0
_08121800: .4byte 0x0857AEE4
_08121804: .4byte 0x02039E00
_08121808:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08121814
	b _08121A44
_08121814:
	b _08121A52
_08121816:
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
	movs r0, #2
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	ldr r2, _0812185C
	ldr r0, _08121860
	ldr r0, [r0]
	adds r0, #0xda
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r1, [r0]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	b _08121A44
	.align 2, 0
_0812185C: .4byte 0x0857AEE4
_08121860: .4byte 0x02039E00
_08121864:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	b _08121A44
_08121878:
	bl GetOverworldTextboxPalettePtr
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r6, _08121920
	ldr r4, _08121924
	ldr r0, _08121928
	ldr r3, [r0]
	adds r3, #0xda
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x10]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r6, r2
	strh r1, [r0]
	ldr r5, _0812192C
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x10]
	adds r2, r5, r2
	strh r0, [r2]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x12]
	movs r2, #0xfb
	lsls r2, r2, #1
	adds r0, r6, r2
	strh r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x12]
	adds r2, r5, r2
	strh r0, [r2]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _08121930
	ldr r0, _08121934
	ldr r2, [r0]
	ldrb r0, [r2, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x14]
	ldrb r0, [r2, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	ldrb r0, [r2, #8]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x16]
	ldrb r0, [r2, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	b _08121A44
	.align 2, 0
_08121920: .4byte 0x020373B4
_08121924: .4byte 0x0857AEE4
_08121928: .4byte 0x02039E00
_0812192C: .4byte 0x020377B4
_08121930: .4byte 0x0857AEDC
_08121934: .4byte 0x03005AF0
_08121938:
	ldr r0, _0812194C
	ldr r0, [r0]
	adds r0, #0xd8
	ldrb r0, [r0]
	cmp r0, #0
	bne _08121946
	b _08121A44
_08121946:
	bl sub_08121A8C
	b _08121A44
	.align 2, 0
_0812194C: .4byte 0x02039E00
_08121950:
	ldr r0, _08121968
	ldr r0, [r0]
	adds r0, #0xd8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08121A44
	bl sub_08121B64
	bl RunTextPrinters
	b _08121A44
	.align 2, 0
_08121968: .4byte 0x02039E00
_0812196C:
	bl sub_08086EFC
	cmp r0, #1
	bne _08121A44
	b _08121A52
_08121976:
	ldr r0, _08121988
	bl SetVBlankCallback
	ldr r2, _0812198C
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	b _08121A44
	.align 2, 0
_08121988: .4byte 0x08121C61
_0812198C: .4byte 0x02037C74
_08121990:
	ldr r5, _081219B4
	ldr r0, [r5]
	adds r0, #0xd4
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	bl sub_080D2724
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #1
	beq _081219B8
	cmp r0, #2
	beq _081219D0
	b _08121A44
	.align 2, 0
_081219B4: .4byte 0x02039E00
_081219B8:
	adds r0, r4, #0
	bl LoadMonIconPalette
	ldr r1, _081219CC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x60
	b _081219E2
	.align 2, 0
_081219CC: .4byte 0x08007141
_081219D0:
	adds r0, r4, #0
	bl LoadMonIconPalette
	ldr r1, _081219F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x28
_081219E2:
	movs r3, #0x80
	bl sub_080D2618
	ldr r1, [r5]
	adds r1, #0xdc
	strb r0, [r1]
	b _08121A44
	.align 2, 0
_081219F0: .4byte 0x08007141
_081219F4:
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
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r2, _08121A38
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	ldr r0, _08121A3C
	ldr r0, [r0]
	adds r0, #0xd0
	ldr r1, _08121A40
	str r1, [r0]
	movs r0, #1
	b _08121A54
	.align 2, 0
_08121A38: .4byte 0x02037C74
_08121A3C: .4byte 0x02039E00
_08121A40: .4byte 0x08121CA1
_08121A44:
	ldr r1, _08121A5C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08121A52:
	movs r0, #0
_08121A54:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08121A5C: .4byte 0x03002360
	thumb_func_end MailReadBuildGraphics

	thumb_func_start CB2_InitMailRead
CB2_InitMailRead: @ 0x08121A60
	push {lr}
_08121A62:
	bl MailReadBuildGraphics
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08121A7C
	ldr r0, _08121A78
	bl SetMainCallback2
	b _08121A88
	.align 2, 0
_08121A78: .4byte 0x08121C75
_08121A7C:
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08121A62
_08121A88:
	pop {r0}
	bx r0
	thumb_func_end CB2_InitMailRead

	thumb_func_start sub_08121A8C
sub_08121A8C: @ 0x08121A8C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r1, _08121B44
	mov r0, sp
	movs r2, #4
	bl memcpy
	movs r6, #0
	movs r5, #0
	ldr r2, _08121B48
	ldr r0, [r2]
	adds r0, #0xe8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r5, r0
	bhs _08121AFA
	adds r7, r2, #0
_08121AAE:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r2, [r7]
	adds r0, r2, r0
	adds r1, r2, #0
	adds r1, #0xd4
	lsls r3, r6, #1
	ldr r1, [r1]
	adds r1, r1, r3
	adds r2, #0xe8
	ldr r2, [r2]
	ldr r2, [r2, #4]
	lsls r4, r5, #2
	adds r2, r4, r2
	ldr r2, [r2]
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x1e
	movs r3, #1
	bl ConvertEasyChatWordsToString
	ldr r0, [r7]
	adds r0, #0xe8
	ldr r1, [r0]
	ldr r0, [r1, #4]
	adds r4, r4, r0
	ldr r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	adds r0, r6, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r1, [r1]
	cmp r5, r1
	blo _08121AAE
_08121AFA:
	ldr r4, _08121B48
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0xc0
	adds r1, #0xd4
	ldr r1, [r1]
	adds r1, #0x12
	bl StringCopy
	adds r2, r0, #0
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0xde
	ldrb r0, [r0]
	cmp r0, #0
	bne _08121B4C
	adds r0, r2, #0
	mov r1, sp
	bl StringCopy
	ldr r0, [r4]
	adds r0, #0xc0
	bl StringLength
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0xe8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	lsrs r1, r1, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	subs r0, #0x60
	subs r1, r1, r0
	adds r2, #0xd9
	strb r1, [r2]
	b _08121B5A
	.align 2, 0
_08121B44: .4byte 0x0857B0B4
_08121B48: .4byte 0x02039E00
_08121B4C:
	adds r0, r1, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #4
	adds r1, #0xd9
	strb r0, [r1]
_08121B5A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08121A8C

	thumb_func_start sub_08121B64
sub_08121B64: @ 0x08121B64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	movs r7, #0
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r6, #0
	ldr r0, _08121C58
	mov sb, r0
	ldr r0, [r0]
	adds r0, #0xe8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r6, r0
	bhs _08121C10
	mov r8, sb
_08121BA0:
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _08121BFC
	cmp r0, #0
	beq _08121BFC
	adds r0, r1, #0
	adds r0, #0xe8
	ldr r1, [r0]
	ldr r0, [r1, #4]
	lsls r4, r6, #2
	adds r0, r4, r0
	ldr r2, [r0]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1a
	ldrb r0, [r1, #3]
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r1, #2]
	adds r3, r7, r3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _08121C5C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	bl AddTextPrinterParameterized3
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r4, r4, r0
	ldrb r0, [r4, #1]
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08121BFC:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0xe8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r6, r0
	blo _08121BA0
_08121C10:
	ldr r0, _08121C58
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xd9
	ldrb r2, [r0]
	adds r0, #0xf
	ldr r0, [r0]
	ldrb r3, [r0, #1]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1c
	ldr r0, _08121C5C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r0, #0xc0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	bl AddTextPrinterParameterized3
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08121C58: .4byte 0x02039E00
_08121C5C: .4byte 0x0857AED8
	thumb_func_end sub_08121B64

	thumb_func_start VBlankCB_MailRead
VBlankCB_MailRead: @ 0x08121C60
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_MailRead

	thumb_func_start CB2_MailRead
CB2_MailRead: @ 0x08121C74
	push {r4, lr}
	ldr r4, _08121C9C
	ldr r0, [r4]
	adds r0, #0xdb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08121C8A
	bl AnimateSprites
	bl BuildOamBuffer
_08121C8A:
	ldr r0, [r4]
	adds r0, #0xd0
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end CB2_MailRead

	thumb_func_start sub_08121C94
sub_08121C94: @ 0x08121C94
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08121C9C: .4byte 0x02039E00
	thumb_func_end sub_08121C94

	thumb_func_start CB2_WaitForPaletteExitOnKeyPress
CB2_WaitForPaletteExitOnKeyPress: @ 0x08121CA0
	push {lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08121CB6
	ldr r0, _08121CBC
	ldr r0, [r0]
	adds r0, #0xd0
	ldr r1, _08121CC0
	str r1, [r0]
_08121CB6:
	pop {r0}
	bx r0
	.align 2, 0
_08121CBC: .4byte 0x02039E00
_08121CC0: .4byte 0x08121CC5
	thumb_func_end CB2_WaitForPaletteExitOnKeyPress

	thumb_func_start CB2_ExitOnKeyPress
CB2_ExitOnKeyPress: @ 0x08121CC4
	push {lr}
	sub sp, #4
	ldr r0, _08121CF4
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08121CEE
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08121CF8
	ldr r0, [r0]
	adds r0, #0xd0
	ldr r1, _08121CFC
	str r1, [r0]
_08121CEE:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08121CF4: .4byte 0x03002360
_08121CF8: .4byte 0x02039E00
_08121CFC: .4byte 0x08121D01
	thumb_func_end CB2_ExitOnKeyPress

	thumb_func_start CB2_ExitMailReadFreeVars
CB2_ExitMailReadFreeVars: @ 0x08121D00
	push {r4, lr}
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08121D7E
	ldr r4, _08121D84
	ldr r0, [r4]
	adds r0, #0xcc
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xdb
	ldrb r1, [r1]
	cmp r1, #2
	bgt _08121D4E
	cmp r1, #1
	blt _08121D4E
	adds r0, #0xd4
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	bl sub_080D2724
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FreeMonIconPalette
	ldr r0, [r4]
	adds r0, #0xdc
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08121D88
	adds r0, r0, r1
	bl sub_080D2798
_08121D4E:
	ldr r4, _08121D84
	ldr r0, [r4]
	ldr r2, _08121D8C
	movs r1, #0
	bl memset
	bl ResetPaletteFade
	movs r0, #0
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	bl FreeAllWindowBuffers
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
_08121D7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08121D84: .4byte 0x02039E00
_08121D88: .4byte 0x020205AC
_08121D8C: .4byte 0x000020EC
	thumb_func_end CB2_ExitMailReadFreeVars

