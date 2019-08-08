.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start BattleInitBgsAndWindows
BattleInitBgsAndWindows: @ 0x080354B0
	push {r4, lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080354EC
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r0, _080354F0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r1, r0
	cmp r1, #0
	beq _080354FC
	ldr r0, _080354F4
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	ldr r4, _080354F8
	ldr r1, [r4]
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, #2
	bl SetBgTilemapBuffer
	b _08035502
	.align 2, 0
_080354EC: .4byte 0x082EB860
_080354F0: .4byte 0x02022C90
_080354F4: .4byte 0x02024118
_080354F8: .4byte 0x02022D04
_080354FC:
	ldr r0, _08035520
	adds r0, #0x24
	strb r1, [r0]
_08035502:
	ldr r1, _08035524
	ldr r0, _08035520
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl InitWindows
	bl DeactivateAllTextPrinters
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035520: .4byte 0x02024118
_08035524: .4byte 0x082EB9F8
	thumb_func_end BattleInitBgsAndWindows

	thumb_func_start sub_08035528
sub_08035528: @ 0x08035528
	push {lr}
	movs r0, #2
	bl DisableInterrupts
	movs r0, #0xc5
	bl EnableInterrupts
	bl BattleInitBgsAndWindows
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r1, _08035560
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_08035560: .4byte 0x0000B040
	thumb_func_end sub_08035528

	thumb_func_start LoadBattleMenuWindowGfx
LoadBattleMenuWindowGfx: @ 0x08035564
	push {lr}
	movs r0, #2
	movs r1, #0x12
	movs r2, #0x10
	bl LoadUserWindowBorderGfx
	movs r0, #2
	movs r1, #0x22
	movs r2, #0x10
	bl LoadUserWindowBorderGfx
	ldr r0, _080355B8
	movs r1, #0x50
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r0, _080355BC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080355B2
	movs r0, #0x70
	bl Menu_LoadStdPalAt
	movs r0, #0
	movs r1, #0x30
	movs r2, #0x70
	bl LoadMessageBoxGfx
	ldr r0, _080355C0
	adds r0, #0xec
	movs r1, #0
	strh r1, [r0]
	ldr r1, _080355C4
	movs r2, #1
	bl CpuSet
_080355B2:
	pop {r0}
	bx r0
	.align 2, 0
_080355B8: .4byte 0x08D855E4
_080355BC: .4byte 0x02022C90
_080355C0: .4byte 0x020373B4
_080355C4: .4byte 0x020378A0
	thumb_func_end LoadBattleMenuWindowGfx

	thumb_func_start DrawMainBattleBackground
DrawMainBattleBackground: @ 0x080355C8
	push {r4, r5, lr}
	ldr r0, _080355EC
	ldr r1, [r0]
	ldr r0, _080355F0
	ands r0, r1
	cmp r0, #0
	beq _08035608
	ldr r0, _080355F4
	ldr r1, _080355F8
	bl LZDecompressWram
	ldr r0, _080355FC
	ldr r1, _08035600
	bl LZDecompressWram
	ldr r0, _08035604
	b _080358A6
	.align 2, 0
_080355EC: .4byte 0x02022C90
_080355F0: .4byte 0x023F0902
_080355F4: .4byte 0x08D7C4E4
_080355F8: .4byte 0x06008000
_080355FC: .4byte 0x08D7CACC
_08035600: .4byte 0x0600D000
_08035604: .4byte 0x08D7CA90
_08035608:
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r1
	cmp r0, #0
	beq _0803563C
	ldr r0, _08035628
	ldr r1, _0803562C
	bl LZDecompressWram
	ldr r0, _08035630
	ldr r1, _08035634
	bl LZDecompressWram
	ldr r0, _08035638
	b _080358A6
	.align 2, 0
_08035628: .4byte 0x08D7BBB8
_0803562C: .4byte 0x06008000
_08035630: .4byte 0x08D7C1F8
_08035634: .4byte 0x0600D000
_08035638: .4byte 0x08D7DFD4
_0803563C:
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r1
	cmp r0, #0
	beq _08035670
	ldr r0, _0803565C
	ldr r1, _08035660
	bl LZDecompressWram
	ldr r0, _08035664
	ldr r1, _08035668
	bl LZDecompressWram
	ldr r0, _0803566C
	b _080358A6
	.align 2, 0
_0803565C: .4byte 0x08D7A1AC
_08035660: .4byte 0x06008000
_08035664: .4byte 0x08D7A7C4
_08035668: .4byte 0x0600D000
_0803566C: .4byte 0x08D7DF98
_08035670:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	cmp r0, #0
	beq _080356A4
	ldr r0, _08035690
	ldr r1, _08035694
	bl LZDecompressWram
	ldr r0, _08035698
	ldr r1, _0803569C
	bl LZDecompressWram
	ldr r0, _080356A0
	b _080358A6
	.align 2, 0
_08035690: .4byte 0x08D7D634
_08035694: .4byte 0x06008000
_08035698: .4byte 0x08D7DCA8
_0803569C: .4byte 0x0600D000
_080356A0: .4byte 0x08D7E2D8
_080356A4:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08035718
	ldr r1, _080356D0
	ldr r0, _080356D4
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	cmp r0, #0x20
	bne _080356EC
	ldr r0, _080356D8
	ldr r1, _080356DC
	bl LZDecompressWram
	ldr r0, _080356E0
	ldr r1, _080356E4
	bl LZDecompressWram
	ldr r0, _080356E8
	b _080358A6
	.align 2, 0
_080356D0: .4byte 0x082E383C
_080356D4: .4byte 0x0203886A
_080356D8: .4byte 0x08D7C4E4
_080356DC: .4byte 0x06008000
_080356E0: .4byte 0x08D7CACC
_080356E4: .4byte 0x0600D000
_080356E8: .4byte 0x08D7E068
_080356EC:
	cmp r0, #0x26
	bne _08035718
	ldr r0, _08035704
	ldr r1, _08035708
	bl LZDecompressWram
	ldr r0, _0803570C
	ldr r1, _08035710
	bl LZDecompressWram
	ldr r0, _08035714
	b _080358A6
	.align 2, 0
_08035704: .4byte 0x08D7CD7C
_08035708: .4byte 0x06008000
_0803570C: .4byte 0x08D7D384
_08035710: .4byte 0x0600D000
_08035714: .4byte 0x08D7E29C
_08035718:
	bl GetCurrentMapBattleScene
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bhi _08035758
	lsls r0, r0, #2
	ldr r1, _08035730
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035730: .4byte 0x08035734
_08035734: @ jump table
	.4byte _08035758 @ case 0
	.4byte _080357A4 @ case 1
	.4byte _080357CC @ case 2
	.4byte _080357F4 @ case 3
	.4byte _0803581C @ case 4
	.4byte _08035844 @ case 5
	.4byte _0803586C @ case 6
	.4byte _08035894 @ case 7
	.4byte _080358C4 @ case 8
_08035758:
	ldr r4, _08035794
	ldr r5, _08035798
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0803579C
	bl LZDecompressWram
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080357A0
	bl LZDecompressWram
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x10
	adds r0, r0, r4
	ldr r0, [r0]
	b _080358A6
	.align 2, 0
_08035794: .4byte 0x082EBA00
_08035798: .4byte 0x02022C94
_0803579C: .4byte 0x06008000
_080357A0: .4byte 0x0600D000
_080357A4:
	ldr r0, _080357B8
	ldr r1, _080357BC
	bl LZDecompressWram
	ldr r0, _080357C0
	ldr r1, _080357C4
	bl LZDecompressWram
	ldr r0, _080357C8
	b _080358A6
	.align 2, 0
_080357B8: .4byte 0x08D7C4E4
_080357BC: .4byte 0x06008000
_080357C0: .4byte 0x08D7CACC
_080357C4: .4byte 0x0600D000
_080357C8: .4byte 0x08D7E02C
_080357CC:
	ldr r0, _080357E0
	ldr r1, _080357E4
	bl LZDecompressWram
	ldr r0, _080357E8
	ldr r1, _080357EC
	bl LZDecompressWram
	ldr r0, _080357F0
	b _080358A6
	.align 2, 0
_080357E0: .4byte 0x08D7CD7C
_080357E4: .4byte 0x06008000
_080357E8: .4byte 0x08D7D384
_080357EC: .4byte 0x0600D000
_080357F0: .4byte 0x08D7E104
_080357F4:
	ldr r0, _08035808
	ldr r1, _0803580C
	bl LZDecompressWram
	ldr r0, _08035810
	ldr r1, _08035814
	bl LZDecompressWram
	ldr r0, _08035818
	b _080358A6
	.align 2, 0
_08035808: .4byte 0x08D7CD7C
_0803580C: .4byte 0x06008000
_08035810: .4byte 0x08D7D384
_08035814: .4byte 0x0600D000
_08035818: .4byte 0x08D7E0A4
_0803581C:
	ldr r0, _08035830
	ldr r1, _08035834
	bl LZDecompressWram
	ldr r0, _08035838
	ldr r1, _0803583C
	bl LZDecompressWram
	ldr r0, _08035840
	b _080358A6
	.align 2, 0
_08035830: .4byte 0x08D7CD7C
_08035834: .4byte 0x06008000
_08035838: .4byte 0x08D7D384
_0803583C: .4byte 0x0600D000
_08035840: .4byte 0x08D7E170
_08035844:
	ldr r0, _08035858
	ldr r1, _0803585C
	bl LZDecompressWram
	ldr r0, _08035860
	ldr r1, _08035864
	bl LZDecompressWram
	ldr r0, _08035868
	b _080358A6
	.align 2, 0
_08035858: .4byte 0x08D7CD7C
_0803585C: .4byte 0x06008000
_08035860: .4byte 0x08D7D384
_08035864: .4byte 0x0600D000
_08035868: .4byte 0x08D7E1C0
_0803586C:
	ldr r0, _08035880
	ldr r1, _08035884
	bl LZDecompressWram
	ldr r0, _08035888
	ldr r1, _0803588C
	bl LZDecompressWram
	ldr r0, _08035890
	b _080358A6
	.align 2, 0
_08035880: .4byte 0x08D7CD7C
_08035884: .4byte 0x06008000
_08035888: .4byte 0x08D7D384
_0803588C: .4byte 0x0600D000
_08035890: .4byte 0x08D7E208
_08035894:
	ldr r0, _080358B0
	ldr r1, _080358B4
	bl LZDecompressWram
	ldr r0, _080358B8
	ldr r1, _080358BC
	bl LZDecompressWram
	ldr r0, _080358C0
_080358A6:
	movs r1, #0x20
	movs r2, #0x60
	bl LoadCompressedPalette
	b _080358DE
	.align 2, 0
_080358B0: .4byte 0x08D7CD7C
_080358B4: .4byte 0x06008000
_080358B8: .4byte 0x08D7D384
_080358BC: .4byte 0x0600D000
_080358C0: .4byte 0x08D7E24C
_080358C4:
	ldr r0, _080358E4
	ldr r1, _080358E8
	bl LZDecompressWram
	ldr r0, _080358EC
	ldr r1, _080358F0
	bl LZDecompressWram
	ldr r0, _080358F4
	movs r1, #0x20
	movs r2, #0x60
	bl LoadCompressedPalette
_080358DE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080358E4: .4byte 0x08D7C4E4
_080358E8: .4byte 0x06008000
_080358EC: .4byte 0x08D7CACC
_080358F0: .4byte 0x0600D000
_080358F4: .4byte 0x08D7CA90
	thumb_func_end DrawMainBattleBackground

	thumb_func_start LoadBattleTextboxAndBackground
LoadBattleTextboxAndBackground: @ 0x080358F8
	push {lr}
	movs r0, #0x8c
	lsls r0, r0, #0x14
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZDecompressWram
	ldr r1, _08035930
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08035934
	movs r1, #0
	movs r2, #0x40
	bl LoadCompressedPalette
	bl LoadBattleMenuWindowGfx
	bl DrawMainBattleBackground
	pop {r0}
	bx r0
	.align 2, 0
_08035930: .4byte 0x08C00530
_08035934: .4byte 0x08C004EC
	thumb_func_end LoadBattleTextboxAndBackground

	thumb_func_start sub_08035938
sub_08035938: @ 0x08035938
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x34]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r7, r6, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov ip, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sb, r4
	movs r4, #0
	ldr r0, _08035990
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08035A20
	ldr r0, _08035994
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080359AA
	cmp r5, #1
	beq _080359D2
	cmp r5, #1
	bgt _08035998
	cmp r5, #0
	beq _080359A2
	b _080359DC
	.align 2, 0
_08035990: .4byte 0x02022C90
_08035994: .4byte 0x03005B60
_08035998:
	cmp r5, #2
	beq _080359A6
	cmp r5, #3
	beq _080359C6
	b _080359DC
_080359A2:
	ldrh r0, [r1, #0xe]
	b _080359C8
_080359A6:
	ldrh r1, [r1, #0xe]
	b _080359D4
_080359AA:
	cmp r5, #1
	beq _080359C6
	cmp r5, #1
	bgt _080359B8
	cmp r5, #0
	beq _080359C2
	b _080359DC
_080359B8:
	cmp r5, #2
	beq _080359CE
	cmp r5, #3
	beq _080359D2
	b _080359DC
_080359C2:
	ldrh r0, [r1, #0xe]
	b _080359C8
_080359C6:
	ldrh r0, [r1, #0x10]
_080359C8:
	movs r4, #0x3f
	ands r4, r0
	b _080359DC
_080359CE:
	ldrh r1, [r1, #0xe]
	b _080359D4
_080359D2:
	ldrh r1, [r1, #0x10]
_080359D4:
	movs r0, #0xfc
	lsls r0, r0, #4
	ands r0, r1
	lsrs r4, r0, #6
_080359DC:
	movs r2, #0
	movs r6, #3
	ldr r0, _08035A1C
	adds r5, r0, #0
	add r3, sp, #0xc
_080359E6:
	lsls r1, r2, #1
	adds r0, r6, #0
	lsls r0, r1
	ands r0, r4
	asrs r0, r1
	adds r0, r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #2
	ble _080359E6
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	mov r0, r8
	add r1, sp, #0xc
	mov r2, ip
	mov r3, sb
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r0, r8
	bl CopyBgTilemapBufferToVram
	b _08035A8A
	.align 2, 0
_08035A1C: .4byte 0x00006001
_08035A20:
	ldr r0, _08035A38
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r5, r0
	bne _08035A40
	ldr r1, _08035A3C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r4, [r0, #0xe]
	b _08035A4C
	.align 2, 0
_08035A38: .4byte 0x02024118
_08035A3C: .4byte 0x03005B60
_08035A40:
	ldr r1, _08035A98
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r4, [r0, #0x10]
_08035A4C:
	movs r2, #0
	movs r6, #3
	ldr r0, _08035A9C
	adds r5, r0, #0
	add r3, sp, #0xc
_08035A56:
	lsls r1, r2, #1
	adds r0, r6, #0
	lsls r0, r1
	ands r0, r4
	asrs r0, r1
	adds r0, r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #5
	ble _08035A56
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	mov r0, r8
	add r1, sp, #0xc
	mov r2, ip
	mov r3, sb
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r0, r8
	bl CopyBgTilemapBufferToVram
_08035A8A:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035A98: .4byte 0x03005B60
_08035A9C: .4byte 0x00006001
	thumb_func_end sub_08035938

	thumb_func_start sub_08035AA0
sub_08035AA0: @ 0x08035AA0
	push {lr}
	ldr r0, _08035AB4
	ldrb r2, [r0]
	cmp r2, #3
	bne _08035ABC
	ldr r0, _08035AB8
	movs r1, #0x15
	bl sub_0814FA04
	b _08035BBC
	.align 2, 0
_08035AB4: .4byte 0x02023FDE
_08035AB8: .4byte 0x085ABC8E
_08035ABC:
	ldr r0, _08035AEC
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08035B36
	cmp r2, #1
	bne _08035B02
	ldr r2, _08035AF0
	ldr r0, _08035AF4
	adds r0, #0x25
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	beq _08035B50
	cmp r0, #1
	bgt _08035AF8
	cmp r0, #0
	beq _08035B8A
	b _08035BBC
	.align 2, 0
_08035AEC: .4byte 0x02022C90
_08035AF0: .4byte 0x020226A0
_08035AF4: .4byte 0x02024118
_08035AF8:
	cmp r0, #2
	beq _08035B8A
	cmp r0, #3
	bne _08035BBC
	b _08035B50
_08035B02:
	ldr r2, _08035B24
	ldr r0, _08035B28
	adds r0, #0x25
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	beq _08035B8A
	cmp r0, #1
	bgt _08035B2C
	cmp r0, #0
	beq _08035B50
	b _08035BBC
	.align 2, 0
_08035B24: .4byte 0x020226A0
_08035B28: .4byte 0x02024118
_08035B2C:
	cmp r0, #2
	beq _08035B50
	cmp r0, #3
	bne _08035BBC
	b _08035B8A
_08035B36:
	cmp r2, #1
	bne _08035B74
	ldr r2, _08035B64
	ldr r0, _08035B68
	adds r0, #0x25
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _08035B8A
_08035B50:
	ldr r0, _08035B6C
	movs r1, #0x17
	bl sub_0814FA04
	ldr r0, _08035B70
	movs r1, #0x16
	bl sub_0814FA04
	b _08035BBC
	.align 2, 0
_08035B64: .4byte 0x020226A0
_08035B68: .4byte 0x02024118
_08035B6C: .4byte 0x085ABC82
_08035B70: .4byte 0x085ABC88
_08035B74:
	ldr r2, _08035B9C
	ldr r0, _08035BA0
	adds r0, #0x25
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _08035BAC
_08035B8A:
	ldr r0, _08035BA4
	movs r1, #0x16
	bl sub_0814FA04
	ldr r0, _08035BA8
	movs r1, #0x17
	bl sub_0814FA04
	b _08035BBC
	.align 2, 0
_08035B9C: .4byte 0x020226A0
_08035BA0: .4byte 0x02024118
_08035BA4: .4byte 0x085ABC82
_08035BA8: .4byte 0x085ABC88
_08035BAC:
	ldr r0, _08035BC0
	movs r1, #0x17
	bl sub_0814FA04
	ldr r0, _08035BC4
	movs r1, #0x16
	bl sub_0814FA04
_08035BBC:
	pop {r0}
	bx r0
	.align 2, 0
_08035BC0: .4byte 0x085ABC82
_08035BC4: .4byte 0x085ABC88
	thumb_func_end sub_08035AA0

	thumb_func_start sub_08035BC8
sub_08035BC8: @ 0x08035BC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08035BF4
	lsls r0, r7, #2
	mov r8, r0
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _08035BEA
	b _08035D28
_08035BEA:
	cmp r0, #1
	bgt _08035BF8
	cmp r0, #0
	beq _08035C00
	b _08035F9C
	.align 2, 0
_08035BF4: .4byte 0x03005B60
_08035BF8:
	cmp r0, #2
	bne _08035BFE
	b _08035DC8
_08035BFE:
	b _08035F9C
_08035C00:
	ldr r0, _08035C2C
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08035C9C
	mov r6, r8
	ldr r4, _08035C30
	movs r5, #3
_08035C12:
	add r0, sp, #4
	adds r1, r4, #0
	bl StringCopy7
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	beq _08035C4C
	cmp r0, #1
	bgt _08035C34
	cmp r0, #0
	beq _08035C3E
	b _08035C92
	.align 2, 0
_08035C2C: .4byte 0x02022C90
_08035C30: .4byte 0x020226A8
_08035C34:
	cmp r0, #2
	beq _08035C60
	cmp r0, #3
	beq _08035C7A
	b _08035C92
_08035C3E:
	add r0, sp, #4
	movs r1, #0x11
	bl sub_0814FA04
	ldrb r1, [r4, #0x10]
	movs r0, #4
	b _08035C6C
_08035C4C:
	add r0, sp, #4
	movs r1, #0x12
	bl sub_0814FA04
	ldrb r1, [r4, #0x10]
	movs r0, #4
	str r0, [sp]
	adds r0, r7, #0
	movs r2, #2
	b _08035C72
_08035C60:
	add r0, sp, #4
	movs r1, #0x13
	bl sub_0814FA04
	ldrb r1, [r4, #0x10]
	movs r0, #8
_08035C6C:
	str r0, [sp]
	adds r0, r7, #0
	movs r2, #1
_08035C72:
	movs r3, #2
	bl sub_08035938
	b _08035C92
_08035C7A:
	add r0, sp, #4
	movs r1, #0x14
	bl sub_0814FA04
	ldrb r1, [r4, #0x10]
	movs r0, #8
	str r0, [sp]
	adds r0, r7, #0
	movs r2, #2
	movs r3, #2
	bl sub_08035938
_08035C92:
	adds r4, #0x1c
	subs r5, #1
	cmp r5, #0
	bge _08035C12
	b _08035D0C
_08035C9C:
	ldr r0, _08035D1C
	adds r0, #0x25
	ldrb r5, [r0]
	movs r0, #1
	adds r6, r5, #0
	eors r6, r0
	adds r1, r6, #0
	ldr r4, _08035D20
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _08035CBE
	adds r6, r5, #0
	adds r5, r1, #0
_08035CBE:
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r4, #8
	adds r1, r1, r4
	add r0, sp, #4
	bl StringCopy7
	add r0, sp, #4
	movs r1, #0xf
	bl sub_0814FA04
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r4
	add r0, sp, #4
	bl StringCopy7
	add r0, sp, #4
	movs r1, #0x10
	bl sub_0814FA04
	movs r4, #7
	str r4, [sp]
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl sub_08035938
	str r4, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #2
	bl sub_08035938
	mov r6, r8
_08035D0C:
	ldr r0, _08035D24
	adds r1, r6, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _08035F9C
	.align 2, 0
_08035D1C: .4byte 0x02024118
_08035D20: .4byte 0x020226A0
_08035D24: .4byte 0x03005B60
_08035D28:
	ldr r0, _08035DA4
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	ldr r2, _08035DA8
	lsrs r0, r0, #0x13
	ldr r3, _08035DAC
	adds r0, r0, r3
	adds r2, r0, r2
	ldr r1, _08035DB0
	adds r0, r0, r1
	ldr r1, _08035DB4
	strh r1, [r0]
	strh r1, [r2]
	ldr r0, _08035DB8
	movs r1, #0x6f
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	ldr r4, _08035DBC
	ldr r1, [r4]
	adds r1, #0x7d
	strb r0, [r1]
	ldr r0, _08035DC0
	movs r1, #0x81
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, #0x7e
	strb r0, [r1]
	ldr r3, _08035DC4
	ldr r0, [r4]
	adds r0, #0x7d
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x7e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _08035F9C
	.align 2, 0
_08035DA4: .4byte 0x00002710
_08035DA8: .4byte 0x020373B4
_08035DAC: .4byte 0x0000021E
_08035DB0: .4byte 0x020377B4
_08035DB4: .4byte 0x00007FFF
_08035DB8: .4byte 0x082EB828
_08035DBC: .4byte 0x02024140
_08035DC0: .4byte 0x082EB840
_08035DC4: .4byte 0x020205AC
_08035DC8:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08035E30
	ldr r4, _08035E1C
	ldrh r0, [r5, #0xa]
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08035DE2
	adds r0, #0x1f
_08035DE2:
	asrs r1, r0, #5
	movs r2, #0x14
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r4]
	ldr r4, _08035E20
	ldrh r0, [r5, #0xc]
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08035E00
	adds r0, #0x1f
_08035E00:
	asrs r1, r0, #5
	movs r3, #0x8c
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r1
	strh r0, [r4]
	ldr r0, _08035E24
	ldr r2, _08035E28
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08035E2C
	strh r1, [r0]
	b _08035E9C
	.align 2, 0
_08035E1C: .4byte 0x02022ACC
_08035E20: .4byte 0x02022AD0
_08035E24: .4byte 0x02022ACE
_08035E28: .4byte 0x0000FFDC
_08035E2C: .4byte 0x02022AD2
_08035E30:
	ldr r4, _08035EC0
	ldrh r0, [r5, #0xa]
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08035E42
	adds r0, #0x1f
_08035E42:
	asrs r1, r0, #5
	movs r3, #0x14
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r1
	strh r0, [r4]
	ldr r4, _08035EC4
	ldrh r0, [r5, #0xa]
	bl Cos2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08035E60
	adds r0, #0x1f
_08035E60:
	asrs r0, r0, #5
	subs r0, #0xa4
	strh r0, [r4]
	ldr r4, _08035EC8
	ldrh r0, [r5, #0xc]
	bl Sin2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08035E78
	adds r0, #0x1f
_08035E78:
	asrs r1, r0, #5
	movs r2, #0x8c
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r4]
	ldr r4, _08035ECC
	ldrh r0, [r5, #0xc]
	bl Cos2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08035E96
	adds r0, #0x1f
_08035E96:
	asrs r0, r0, #5
	subs r0, #0xa4
	strh r0, [r4]
_08035E9C:
	ldr r1, _08035ED0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1, #0xc]
	movs r2, #0xc
	ldrsh r3, [r1, r2]
	mov r8, r3
	cmp r3, #0
	beq _08035ED4
	subs r0, #2
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0xa]
	adds r0, #2
	strh r0, [r1, #0xa]
	b _08035F9C
	.align 2, 0
_08035EC0: .4byte 0x02022ACC
_08035EC4: .4byte 0x02022ACE
_08035EC8: .4byte 0x02022AD0
_08035ECC: .4byte 0x02022AD2
_08035ED0: .4byte 0x03005B60
_08035ED4:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08035EE0
	bl sub_08035AA0
_08035EE0:
	movs r0, #0x78
	bl PlaySE
	adds r0, r7, #0
	bl DestroyTask
	ldr r4, _08035FA8
	ldr r5, _08035FAC
	ldr r0, [r5]
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x7e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r5, [r5]
	adds r6, r5, #0
	adds r6, #0x7e
	ldrb r0, [r6]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x40
	ldr r7, _08035FB0
	adds r0, r7, #0
	ands r1, r0
	ldr r0, _08035FB4
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
	adds r5, #0x7d
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r1, r8
	strh r1, [r0, #0x2e]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	strh r1, [r0, #0x2e]
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x20]
	strh r1, [r0, #0x30]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x20]
	strh r1, [r0, #0x30]
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r2, r8
	strh r2, [r0, #0x32]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x32]
_08035F9C:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035FA8: .4byte 0x020205AC
_08035FAC: .4byte 0x02024140
_08035FB0: .4byte 0x000003FF
_08035FB4: .4byte 0xFFFFFC00
	thumb_func_end sub_08035BC8

	thumb_func_start DrawBattleEntryBackground
DrawBattleEntryBackground: @ 0x08035FB8
	push {r4, r5, lr}
	ldr r0, _0803603C
	ldr r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803606C
	ldr r0, _08036040
	ldr r1, _08036044
	bl LZDecompressWram
	ldr r0, _08036048
	ldr r1, _0803604C
	bl LZDecompressWram
	ldr r0, _08036050
	movs r1, #0x60
	movs r2, #0x20
	bl LoadCompressedPalette
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetBgAttribute
	ldr r1, _08036054
	movs r0, #0xa
	bl SetGpuReg
	ldr r4, _08036058
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #0x48
	movs r1, #0x36
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x36
	bl SetGpuReg
	ldr r0, _0803605C
	ldr r2, _08036060
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08036064
	strh r1, [r0]
	ldr r0, _08036068
	bl LoadCompressedSpriteSheetUsingHeap
	b _0803620C
	.align 2, 0
_0803603C: .4byte 0x02022C90
_08036040: .4byte 0x08D77994
_08036044: .4byte 0x06004000
_08036048: .4byte 0x08D77BB0
_0803604C: .4byte 0x06010000
_08036050: .4byte 0x08D77B88
_08036054: .4byte 0x00005C04
_08036058: .4byte 0x08D77A7C
_0803605C: .4byte 0x02022ACE
_08036060: .4byte 0x0000FF5C
_08036064: .4byte 0x02022AD2
_08036068: .4byte 0x082EB858
_0803606C:
	ldr r0, _08036094
	ands r0, r1
	cmp r0, #0
	beq _080360F0
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	cmp r1, #0
	beq _08036088
	ldr r0, _08036098
	ldrh r1, [r0]
	ldr r0, _0803609C
	cmp r1, r0
	bne _080360AC
_08036088:
	ldr r0, _080360A0
	ldr r1, _080360A4
	bl LZDecompressWram
	ldr r0, _080360A8
	b _080361E2
	.align 2, 0
_08036094: .4byte 0x023F0902
_08036098: .4byte 0x0203886E
_0803609C: .4byte 0x00000C03
_080360A0: .4byte 0x08D82178
_080360A4: .4byte 0x06004000
_080360A8: .4byte 0x08D82588
_080360AC:
	movs r0, #1
	movs r1, #1
	movs r2, #2
	bl SetBgAttribute
	movs r0, #2
	movs r1, #1
	movs r2, #2
	bl SetBgAttribute
	ldr r1, _080360E8
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _080360EC
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	b _0803620C
	.align 2, 0
_080360E8: .4byte 0x08D8578C
_080360EC: .4byte 0x08D85A00
_080360F0:
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08036114
	ldr r0, _08036108
	ldr r1, _0803610C
	bl LZDecompressWram
	ldr r0, _08036110
	b _080361E2
	.align 2, 0
_08036108: .4byte 0x08D816B4
_0803610C: .4byte 0x06004000
_08036110: .4byte 0x08D81ED0
_08036114:
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r1
	cmp r0, #0
	beq _08036138
	ldr r0, _0803612C
	ldr r1, _08036130
	bl LZDecompressWram
	ldr r0, _08036134
	b _080361E2
	.align 2, 0
_0803612C: .4byte 0x08D7FA9C
_08036130: .4byte 0x06004000
_08036134: .4byte 0x08D7FF68
_08036138:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	cmp r0, #0
	beq _0803615C
	ldr r0, _08036150
	ldr r1, _08036154
	bl LZDecompressWram
	ldr r0, _08036158
	b _080361E2
	.align 2, 0
_08036150: .4byte 0x08D826AC
_08036154: .4byte 0x06004000
_08036158: .4byte 0x08D82D14
_0803615C:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080361B0
	ldr r1, _08036180
	ldr r0, _08036184
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	cmp r0, #0x20
	bne _08036194
	ldr r0, _08036188
	ldr r1, _0803618C
	bl LZDecompressWram
	ldr r0, _08036190
	b _080361E2
	.align 2, 0
_08036180: .4byte 0x082E383C
_08036184: .4byte 0x0203886A
_08036188: .4byte 0x08D82178
_0803618C: .4byte 0x06004000
_08036190: .4byte 0x08D82588
_08036194:
	cmp r0, #0x26
	bne _080361B0
	ldr r0, _080361A4
	ldr r1, _080361A8
	bl LZDecompressWram
	ldr r0, _080361AC
	b _080361E2
	.align 2, 0
_080361A4: .4byte 0x08D82178
_080361A8: .4byte 0x06004000
_080361AC: .4byte 0x08D82588
_080361B0:
	bl GetCurrentMapBattleScene
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080361FC
	ldr r4, _080361EC
	ldr r5, _080361F0
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080361F4
	bl LZDecompressWram
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r0, r0, r4
	ldr r0, [r0]
_080361E2:
	ldr r1, _080361F8
	bl LZDecompressWram
	b _0803620C
	.align 2, 0
_080361EC: .4byte 0x082EBA00
_080361F0: .4byte 0x02022C94
_080361F4: .4byte 0x06004000
_080361F8: .4byte 0x0600E000
_080361FC:
	ldr r0, _08036214
	ldr r1, _08036218
	bl LZDecompressWram
	ldr r0, _0803621C
	ldr r1, _08036220
	bl LZDecompressWram
_0803620C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036214: .4byte 0x08D82178
_08036218: .4byte 0x06004000
_0803621C: .4byte 0x08D82588
_08036220: .4byte 0x0600E000
	thumb_func_end DrawBattleEntryBackground

	thumb_func_start LoadChosenBattleElement
LoadChosenBattleElement: @ 0x08036224
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #6
	bls _08036232
	b _080365AA
_08036232:
	lsls r0, r0, #2
	ldr r1, _0803623C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803623C: .4byte 0x08036240
_08036240: @ jump table
	.4byte _0803625C @ case 0
	.4byte _0803626A @ case 1
	.4byte _08036284 @ case 2
	.4byte _08036294 @ case 3
	.4byte _08036388 @ case 4
	.4byte _08036490 @ case 5
	.4byte _080365A4 @ case 6
_0803625C:
	movs r0, #0x8c
	lsls r0, r0, #0x14
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZDecompressWram
	b _080365AC
_0803626A:
	ldr r1, _08036280
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	b _080365AC
	.align 2, 0
_08036280: .4byte 0x08C00530
_08036284:
	ldr r0, _08036290
	movs r1, #0
	movs r2, #0x40
	bl LoadCompressedPalette
	b _080365AC
	.align 2, 0
_08036290: .4byte 0x08C004EC
_08036294:
	ldr r0, _080362B0
	ldr r1, [r0]
	ldr r0, _080362B4
	ands r0, r1
	cmp r0, #0
	bne _08036374
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r1
	cmp r0, #0
	beq _080362BC
	ldr r0, _080362B8
	b _08036376
	.align 2, 0
_080362B0: .4byte 0x02022C90
_080362B4: .4byte 0x023F0902
_080362B8: .4byte 0x08D7BBB8
_080362BC:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080362E8
	ldr r1, _080362DC
	ldr r0, _080362E0
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	cmp r0, #0x20
	beq _08036374
	cmp r0, #0x26
	bne _080362E8
	ldr r0, _080362E4
	b _08036376
	.align 2, 0
_080362DC: .4byte 0x082E383C
_080362E0: .4byte 0x0203886A
_080362E4: .4byte 0x08D7CD7C
_080362E8:
	bl GetCurrentMapBattleScene
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bhi _08036328
	lsls r0, r0, #2
	ldr r1, _08036300
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036300: .4byte 0x08036304
_08036304: @ jump table
	.4byte _08036328 @ case 0
	.4byte _08036374 @ case 1
	.4byte _08036344 @ case 2
	.4byte _0803634C @ case 3
	.4byte _08036354 @ case 4
	.4byte _0803635C @ case 5
	.4byte _08036364 @ case 6
	.4byte _0803636C @ case 7
	.4byte _08036374 @ case 8
_08036328:
	ldr r2, _0803633C
	ldr r0, _08036340
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	b _08036376
	.align 2, 0
_0803633C: .4byte 0x082EBA00
_08036340: .4byte 0x02022C94
_08036344:
	ldr r0, _08036348
	b _08036376
	.align 2, 0
_08036348: .4byte 0x08D7CD7C
_0803634C:
	ldr r0, _08036350
	b _08036376
	.align 2, 0
_08036350: .4byte 0x08D7CD7C
_08036354:
	ldr r0, _08036358
	b _08036376
	.align 2, 0
_08036358: .4byte 0x08D7CD7C
_0803635C:
	ldr r0, _08036360
	b _08036376
	.align 2, 0
_08036360: .4byte 0x08D7CD7C
_08036364:
	ldr r0, _08036368
	b _08036376
	.align 2, 0
_08036368: .4byte 0x08D7CD7C
_0803636C:
	ldr r0, _08036370
	b _08036376
	.align 2, 0
_08036370: .4byte 0x08D7CD7C
_08036374:
	ldr r0, _08036380
_08036376:
	ldr r1, _08036384
	bl LZDecompressWram
	b _080365AC
	.align 2, 0
_08036380: .4byte 0x08D7C4E4
_08036384: .4byte 0x06008000
_08036388:
	ldr r0, _080363AC
	ldr r1, [r0]
	ldr r0, _080363B0
	ands r0, r1
	cmp r0, #0
	beq _08036396
	b _0803647C
_08036396:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _080363C4
	ldr r0, _080363B4
	ldrb r0, [r0]
	cmp r0, #2
	bne _080363BC
	ldr r0, _080363B8
	b _0803647E
	.align 2, 0
_080363AC: .4byte 0x02022C90
_080363B0: .4byte 0x023F0902
_080363B4: .4byte 0x0829BDA4
_080363B8: .4byte 0x08D7C1F8
_080363BC:
	ldr r0, _080363C0
	b _0803647E
	.align 2, 0
_080363C0: .4byte 0x08D7A7C4
_080363C4:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080363F0
	ldr r1, _080363E4
	ldr r0, _080363E8
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	cmp r0, #0x20
	beq _0803647C
	cmp r0, #0x26
	bne _080363F0
	ldr r0, _080363EC
	b _0803647E
	.align 2, 0
_080363E4: .4byte 0x082E383C
_080363E8: .4byte 0x0203886A
_080363EC: .4byte 0x08D7D384
_080363F0:
	bl GetCurrentMapBattleScene
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bhi _08036430
	lsls r0, r0, #2
	ldr r1, _08036408
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036408: .4byte 0x0803640C
_0803640C: @ jump table
	.4byte _08036430 @ case 0
	.4byte _0803647C @ case 1
	.4byte _0803644C @ case 2
	.4byte _08036454 @ case 3
	.4byte _0803645C @ case 4
	.4byte _08036464 @ case 5
	.4byte _0803646C @ case 6
	.4byte _08036474 @ case 7
	.4byte _0803647C @ case 8
_08036430:
	ldr r2, _08036444
	ldr r0, _08036448
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #4
	adds r0, r0, r2
	ldr r0, [r0]
	b _0803647E
	.align 2, 0
_08036444: .4byte 0x082EBA00
_08036448: .4byte 0x02022C94
_0803644C:
	ldr r0, _08036450
	b _0803647E
	.align 2, 0
_08036450: .4byte 0x08D7D384
_08036454:
	ldr r0, _08036458
	b _0803647E
	.align 2, 0
_08036458: .4byte 0x08D7D384
_0803645C:
	ldr r0, _08036460
	b _0803647E
	.align 2, 0
_08036460: .4byte 0x08D7D384
_08036464:
	ldr r0, _08036468
	b _0803647E
	.align 2, 0
_08036468: .4byte 0x08D7D384
_0803646C:
	ldr r0, _08036470
	b _0803647E
	.align 2, 0
_08036470: .4byte 0x08D7D384
_08036474:
	ldr r0, _08036478
	b _0803647E
	.align 2, 0
_08036478: .4byte 0x08D7D384
_0803647C:
	ldr r0, _08036488
_0803647E:
	ldr r1, _0803648C
	bl LZDecompressWram
	b _080365AC
	.align 2, 0
_08036488: .4byte 0x08D7CACC
_0803648C: .4byte 0x0600D000
_08036490:
	ldr r0, _080364B4
	ldr r1, [r0]
	ldr r0, _080364B8
	ands r0, r1
	cmp r0, #0
	beq _0803649E
	b _08036594
_0803649E:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _080364CC
	ldr r0, _080364BC
	ldrb r0, [r0]
	cmp r0, #2
	bne _080364C4
	ldr r0, _080364C0
	b _08036596
	.align 2, 0
_080364B4: .4byte 0x02022C90
_080364B8: .4byte 0x023F0902
_080364BC: .4byte 0x0829BDA4
_080364C0: .4byte 0x08D7DFD4
_080364C4:
	ldr r0, _080364C8
	b _08036596
	.align 2, 0
_080364C8: .4byte 0x08D7DF98
_080364CC:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08036500
	ldr r1, _080364E8
	ldr r0, _080364EC
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	cmp r0, #0x20
	bne _080364F4
	ldr r0, _080364F0
	b _08036596
	.align 2, 0
_080364E8: .4byte 0x082E383C
_080364EC: .4byte 0x0203886A
_080364F0: .4byte 0x08D7E068
_080364F4:
	cmp r0, #0x26
	bne _08036500
	ldr r0, _080364FC
	b _08036596
	.align 2, 0
_080364FC: .4byte 0x08D7E29C
_08036500:
	bl GetCurrentMapBattleScene
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bhi _08036540
	lsls r0, r0, #2
	ldr r1, _08036518
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036518: .4byte 0x0803651C
_0803651C: @ jump table
	.4byte _08036540 @ case 0
	.4byte _0803655C @ case 1
	.4byte _08036564 @ case 2
	.4byte _0803656C @ case 3
	.4byte _08036574 @ case 4
	.4byte _0803657C @ case 5
	.4byte _08036584 @ case 6
	.4byte _0803658C @ case 7
	.4byte _08036594 @ case 8
_08036540:
	ldr r2, _08036554
	ldr r0, _08036558
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x10
	adds r0, r0, r2
	ldr r0, [r0]
	b _08036596
	.align 2, 0
_08036554: .4byte 0x082EBA00
_08036558: .4byte 0x02022C94
_0803655C:
	ldr r0, _08036560
	b _08036596
	.align 2, 0
_08036560: .4byte 0x08D7E02C
_08036564:
	ldr r0, _08036568
	b _08036596
	.align 2, 0
_08036568: .4byte 0x08D7E104
_0803656C:
	ldr r0, _08036570
	b _08036596
	.align 2, 0
_08036570: .4byte 0x08D7E0A4
_08036574:
	ldr r0, _08036578
	b _08036596
	.align 2, 0
_08036578: .4byte 0x08D7E170
_0803657C:
	ldr r0, _08036580
	b _08036596
	.align 2, 0
_08036580: .4byte 0x08D7E1C0
_08036584:
	ldr r0, _08036588
	b _08036596
	.align 2, 0
_08036588: .4byte 0x08D7E208
_0803658C:
	ldr r0, _08036590
	b _08036596
	.align 2, 0
_08036590: .4byte 0x08D7E24C
_08036594:
	ldr r0, _080365A0
_08036596:
	movs r1, #0x20
	movs r2, #0x60
	bl LoadCompressedPalette
	b _080365AC
	.align 2, 0
_080365A0: .4byte 0x08D7CA90
_080365A4:
	bl LoadBattleMenuWindowGfx
	b _080365AC
_080365AA:
	movs r4, #1
_080365AC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LoadChosenBattleElement

