.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ChooseMonToGivePokeblock
ChooseMonToGivePokeblock: @ 0x08166010
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _08166040
	ldr r0, _08166044
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _08166048
	ldr r2, _0816604C
	adds r0, r0, r2
	str r0, [r1]
	str r5, [r0, #8]
	str r6, [r0, #4]
	ldr r0, _08166050
	bl sub_08166178
	ldr r0, _08166054
	bl SetMainCallback2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08166040: .4byte 0x0203B978
_08166044: .4byte 0x00008058
_08166048: .4byte 0x0203B95C
_0816604C: .4byte 0x00007FD0
_08166050: .4byte 0x0816618D
_08166054: .4byte 0x08166129
	thumb_func_end ChooseMonToGivePokeblock

	thumb_func_start CB2_ReturnAndChooseMonToGivePokeblock
CB2_ReturnAndChooseMonToGivePokeblock: @ 0x08166058
	push {r4, r5, lr}
	ldr r4, _081660A8
	ldr r0, _081660AC
	bl AllocZeroed
	str r0, [r4]
	ldr r5, _081660B0
	ldr r1, _081660B4
	adds r0, r0, r1
	str r0, [r5]
	ldr r1, _081660B8
	ldr r1, [r1]
	str r1, [r0, #8]
	ldr r1, _081660BC
	ldr r1, [r1]
	str r1, [r0, #4]
	ldr r4, _081660C0
	ldrb r0, [r4]
	bl sub_081670E8
	strb r0, [r4]
	ldr r5, [r5]
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08166090
	movs r1, #1
_08166090:
	adds r0, r5, #0
	adds r0, #0x56
	strb r1, [r0]
	ldr r0, _081660C4
	bl sub_08166178
	ldr r0, _081660C8
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081660A8: .4byte 0x0203B978
_081660AC: .4byte 0x00008058
_081660B0: .4byte 0x0203B95C
_081660B4: .4byte 0x00007FD0
_081660B8: .4byte 0x0203B964
_081660BC: .4byte 0x0203B960
_081660C0: .4byte 0x0203B968
_081660C4: .4byte 0x0816618D
_081660C8: .4byte 0x081660CD
	thumb_func_end CB2_ReturnAndChooseMonToGivePokeblock

	thumb_func_start sub_081660CC
sub_081660CC: @ 0x081660CC
	push {r4, lr}
	ldr r4, _08166104
	ldr r0, [r4]
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	thumb_func_end sub_081660CC

	thumb_func_start sub_081660DC
sub_081660DC: @ 0x081660DC
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r0, _08166108
	cmp r1, r0
	bne _081660FC
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0816610C
	bl SetMainCallback2
_081660FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08166104: .4byte 0x0203B95C
_08166108: .4byte 0x08166371
_0816610C: .4byte 0x08166111
	thumb_func_end sub_081660DC

	thumb_func_start sub_08166110
sub_08166110: @ 0x08166110
	push {lr}
	bl sub_08166704
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08166110

	thumb_func_start sub_08166128
sub_08166128: @ 0x08166128
	push {lr}
	ldr r0, _08166148
	ldr r0, [r0]
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	thumb_func_end sub_08166128

	thumb_func_start sub_08166138
sub_08166138: @ 0x08166138
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_08166148: .4byte 0x0203B95C
	thumb_func_end sub_08166138

	thumb_func_start sub_0816614C
sub_0816614C: @ 0x0816614C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r0, _08166170
	ldr r0, [r0]
	ldr r1, _08166174
	adds r0, r0, r1
	bl sub_081D1750
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_08166170: .4byte 0x0203B978
_08166174: .4byte 0x00007C58
	thumb_func_end sub_0816614C

	thumb_func_start sub_08166178
sub_08166178: @ 0x08166178
	ldr r1, _08166188
	ldr r1, [r1]
	str r0, [r1]
	adds r1, #0x50
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08166188: .4byte 0x0203B95C
	thumb_func_end sub_08166178

	thumb_func_start sub_0816618C
sub_0816618C: @ 0x0816618C
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _081661AC
	ldr r0, [r1]
	adds r0, #0x50
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0xf
	bls _081661A0
	b _08166362
_081661A0:
	lsls r0, r0, #2
	ldr r1, _081661B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081661AC: .4byte 0x0203B95C
_081661B0: .4byte 0x081661B4
_081661B4: @ jump table
	.4byte _081661F4 @ case 0
	.4byte _08166218 @ case 1
	.4byte _08166222 @ case 2
	.4byte _08166240 @ case 3
	.4byte _08166270 @ case 4
	.4byte _08166274 @ case 5
	.4byte _08166280 @ case 6
	.4byte _08166290 @ case 7
	.4byte _0816629C @ case 8
	.4byte _081662A8 @ case 9
	.4byte _081662C4 @ case 10
	.4byte _081662C8 @ case 11
	.4byte _081662F0 @ case 12
	.4byte _0816631C @ case 13
	.4byte _08166334 @ case 14
	.4byte _0816635C @ case 15
_081661F4:
	ldr r2, _0816620C
	ldr r0, [r2]
	ldr r1, _08166210
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r2]
	ldr r2, _08166214
	adds r0, r0, r2
	bl sub_081D151C
	b _08166348
	.align 2, 0
_0816620C: .4byte 0x0203B978
_08166210: .4byte 0x00007B10
_08166214: .4byte 0x00007C58
_08166218:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _08166348
_08166222:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0816623C
	mov r0, sp
	bl CpuSet
	b _08166348
	.align 2, 0
_0816623C: .4byte 0x05006000
_08166240:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08166268
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r0, _0816626C
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	movs r1, #0x91
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	b _08166348
	.align 2, 0
_08166268: .4byte 0x085C09B0
_0816626C: .4byte 0x085C09C0
_08166270:
	ldr r1, [r2]
	b _0816634C
_08166274:
	bl sub_08168130
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08166362
	b _08166348
_08166280:
	ldr r1, _0816628C
	movs r0, #0x14
	strh r0, [r1]
	bl sub_08167224
	b _08166348
	.align 2, 0
_0816628C: .4byte 0x03002350
_08166290:
	bl sub_08167734
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08166362
	b _08166348
_0816629C:
	movs r0, #0
	bl sub_0816740C
	bl sub_08167564
	b _08166348
_081662A8:
	ldr r0, _081662BC
	ldr r0, [r0]
	ldr r1, _081662C0
	adds r0, r0, r1
	bl sub_081D275C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08166362
	b _08166348
	.align 2, 0
_081662BC: .4byte 0x0203B978
_081662C0: .4byte 0x00007B0E
_081662C4:
	ldr r1, [r2]
	b _0816634C
_081662C8:
	ldr r5, _081662E4
	ldr r1, [r5]
	ldr r4, _081662E8
	adds r0, r1, r4
	ldr r2, _081662EC
	adds r1, r1, r2
	bl sub_081D1D70
	ldr r0, [r5]
	adds r0, r0, r4
	bl sub_081D16F4
	b _08166348
	.align 2, 0
_081662E4: .4byte 0x0203B978
_081662E8: .4byte 0x00007C58
_081662EC: .4byte 0x00007C6C
_081662F0:
	ldr r4, _08166314
	ldr r0, [r4]
	ldr r1, _08166318
	adds r0, r0, r1
	bl sub_081D1704
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08166362
	ldr r2, [r4]
	ldr r1, _08166318
	adds r0, r2, r1
	adds r1, #0x14
	adds r2, r2, r1
	adds r1, r2, #0
	bl sub_081D15CC
	b _08166348
	.align 2, 0
_08166314: .4byte 0x0203B978
_08166318: .4byte 0x00007C58
_0816631C:
	ldr r0, _0816632C
	ldr r0, [r0]
	ldr r2, _08166330
	adds r0, r0, r2
	bl sub_081D1878
	b _08166348
	.align 2, 0
_0816632C: .4byte 0x0203B978
_08166330: .4byte 0x00007C58
_08166334:
	movs r0, #0
	movs r1, #1
	bl sub_081679A4
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
_08166348:
	ldr r0, _08166358
	ldr r1, [r0]
_0816634C:
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08166362
	.align 2, 0
_08166358: .4byte 0x0203B95C
_0816635C:
	ldr r0, _0816636C
	bl sub_08166178
_08166362:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816636C: .4byte 0x08166371
	thumb_func_end sub_0816618C

	thumb_func_start sub_08166370
sub_08166370: @ 0x08166370
	push {r4, lr}
	sub sp, #4
	ldr r4, _08166388
	ldr r0, [r4]
	adds r0, #0x50
	ldrb r1, [r0]
	cmp r1, #0
	beq _0816638C
	cmp r1, #1
	beq _081663CC
	b _0816641C
	.align 2, 0
_08166388: .4byte 0x0203B95C
_0816638C:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _081663C8
	bl SetVBlankCallback
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r1, [r4]
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0816641C
	.align 2, 0
_081663C8: .4byte 0x0816614D
_081663CC:
	ldr r0, _08166424
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0816641C
	ldr r4, _08166428
	ldr r0, [r4]
	ldr r1, _0816642C
	adds r0, r0, r1
	bl sub_081D2A94
	ldr r4, [r4]
	ldr r2, _08166430
	adds r0, r4, r2
	ldrb r1, [r0]
	ldr r3, _08166434
	adds r0, r4, r3
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	beq _08166416
	ldr r1, _08166438
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r2, #0x91
	adds r0, r4, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r3, _0816642C
	adds r0, r4, r3
	subs r3, #0xc
	adds r1, r4, r3
	ldrb r1, [r1]
	bl sub_081D2AB0
_08166416:
	ldr r0, _0816643C
	bl sub_08166178
_0816641C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08166424: .4byte 0x02037C74
_08166428: .4byte 0x0203B978
_0816642C: .4byte 0x00007B1C
_08166430: .4byte 0x00008041
_08166434: .4byte 0x00008040
_08166438: .4byte 0x00007FB3
_0816643C: .4byte 0x08166441
	thumb_func_end sub_08166370

	thumb_func_start sub_08166440
sub_08166440: @ 0x08166440
	push {lr}
	ldr r0, _0816645C
	ldr r0, [r0]
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #7
	bls _08166450
	b _0816661A
_08166450:
	lsls r0, r0, #2
	ldr r1, _08166460
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816645C: .4byte 0x0203B95C
_08166460: .4byte 0x08166464
_08166464: @ jump table
	.4byte _08166484 @ case 0
	.4byte _08166568 @ case 1
	.4byte _0816661A @ case 2
	.4byte _08166594 @ case 3
	.4byte _0816661A @ case 4
	.4byte _081665A0 @ case 5
	.4byte _081665B8 @ case 6
	.4byte _08166600 @ case 7
_08166484:
	ldr r2, _081664B4
	ldrh r1, [r2, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081664C4
	movs r0, #5
	bl PlaySE
	movs r0, #1
	bl sub_08167AA8
	ldr r0, _081664B8
	ldr r0, [r0]
	ldr r1, _081664BC
	adds r0, r0, r1
	bl sub_081D2B50
	ldr r0, _081664C0
	ldr r0, [r0]
	adds r0, #0x50
	movs r1, #1
	b _08166618
	.align 2, 0
_081664B4: .4byte 0x03002360
_081664B8: .4byte 0x0203B978
_081664BC: .4byte 0x00007B1C
_081664C0: .4byte 0x0203B95C
_081664C4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081664FC
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_08167AA8
	ldr r0, _081664F0
	ldr r0, [r0]
	ldr r2, _081664F4
	adds r0, r0, r2
	bl sub_081D2B50
	ldr r0, _081664F8
	ldr r0, [r0]
	adds r0, #0x50
	movs r1, #1
	b _08166618
	.align 2, 0
_081664F0: .4byte 0x0203B978
_081664F4: .4byte 0x00007B1C
_081664F8: .4byte 0x0203B95C
_081664FC:
	ldrh r1, [r2, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0816651C
	movs r0, #5
	bl PlaySE
	ldr r0, _08166518
	ldr r0, [r0]
	adds r0, #0x50
	movs r1, #3
	b _08166618
	.align 2, 0
_08166518: .4byte 0x0203B95C
_0816651C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08166526
	b _0816661A
_08166526:
	movs r0, #5
	bl PlaySE
	ldr r0, _0816654C
	ldr r0, [r0]
	ldr r2, _08166550
	adds r1, r0, r2
	ldrb r1, [r1]
	subs r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bne _08166558
	ldr r0, _08166554
	ldr r0, [r0]
	adds r0, #0x50
	movs r1, #3
	b _08166618
	.align 2, 0
_0816654C: .4byte 0x0203B978
_08166550: .4byte 0x00008041
_08166554: .4byte 0x0203B95C
_08166558:
	ldr r0, _08166564
	ldr r0, [r0]
	adds r0, #0x50
	movs r1, #5
	b _08166618
	.align 2, 0
_08166564: .4byte 0x0203B95C
_08166568:
	ldr r0, _08166588
	ldr r0, [r0]
	ldr r1, _0816658C
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0816661A
	ldr r0, _08166590
	ldr r0, [r0]
	adds r0, #0x50
	b _08166618
	.align 2, 0
_08166588: .4byte 0x0203B978
_0816658C: .4byte 0x00008044
_08166590: .4byte 0x0203B95C
_08166594:
	ldr r0, _0816659C
	bl sub_08166178
	b _0816661A
	.align 2, 0
_0816659C: .4byte 0x081669F9
_081665A0:
	bl sub_08166B50
	ldr r0, _081665B4
	ldr r1, [r0]
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0816661A
	.align 2, 0
_081665B4: .4byte 0x0203B95C
_081665B8:
	bl sub_08166BF0
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081665D8
	cmp r1, #0
	bgt _081665D2
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08166610
	b _0816661A
_081665D2:
	cmp r1, #1
	bne _0816661A
	b _08166610
_081665D8:
	bl IsSheenMaxed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081665F4
	bl sub_08166D5C
	ldr r0, _081665F0
	ldr r0, [r0]
	adds r0, #0x50
	movs r1, #7
	b _08166618
	.align 2, 0
_081665F0: .4byte 0x0203B95C
_081665F4:
	ldr r0, _081665FC
	bl sub_08166178
	b _0816661A
	.align 2, 0
_081665FC: .4byte 0x08166629
_08166600:
	ldr r0, _08166620
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0816661A
	bl sub_08166D98
_08166610:
	ldr r0, _08166624
	ldr r0, [r0]
	adds r0, #0x50
	movs r1, #0
_08166618:
	strb r1, [r0]
_0816661A:
	pop {r0}
	bx r0
	.align 2, 0
_08166620: .4byte 0x03002360
_08166624: .4byte 0x0203B95C
	thumb_func_end sub_08166440

	thumb_func_start sub_08166628
sub_08166628: @ 0x08166628
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _08166640
	ldr r0, [r5]
	adds r0, #0x50
	ldrb r4, [r0]
	cmp r4, #0
	beq _08166644
	cmp r4, #1
	beq _08166694
	b _081666E0
	.align 2, 0
_08166640: .4byte 0x0203B95C
_08166644:
	ldr r0, _08166680
	ldr r0, [r0]
	ldr r1, _08166684
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_081670A8
	ldr r1, _08166688
	strb r0, [r1]
	ldr r1, _0816668C
	ldr r2, [r5]
	ldr r0, [r2, #4]
	str r0, [r1]
	ldr r1, _08166690
	ldr r0, [r2, #8]
	str r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081666E0
	.align 2, 0
_08166680: .4byte 0x0203B978
_08166684: .4byte 0x00008041
_08166688: .4byte 0x0203B968
_0816668C: .4byte 0x0203B960
_08166690: .4byte 0x0203B964
_08166694:
	ldr r0, _081666E8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _081666E0
	movs r0, #0
	bl SetVBlankCallback
	ldr r4, _081666EC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _081666F0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _081666F4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _081666F8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	bl FreeAllWindowBuffers
	ldr r1, _081666FC
	ldr r0, _08166700
	str r0, [r1, #8]
	bl CB2_PreparePokeblockFeedScene
_081666E0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081666E8: .4byte 0x02037C74
_081666EC: .4byte 0x0203B96C
_081666F0: .4byte 0x0203B970
_081666F4: .4byte 0x0203B974
_081666F8: .4byte 0x0203B978
_081666FC: .4byte 0x03002360
_08166700: .4byte 0x08166059
	thumb_func_end sub_08166628

	thumb_func_start sub_08166704
sub_08166704: @ 0x08166704
	push {r4, lr}
	sub sp, #4
	ldr r1, _08166724
	ldr r0, [r1]
	adds r0, #0x50
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #6
	bls _08166718
	b _08166824
_08166718:
	lsls r0, r0, #2
	ldr r1, _08166728
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08166724: .4byte 0x0203B95C
_08166728: .4byte 0x0816672C
_0816672C: @ jump table
	.4byte _08166748 @ case 0
	.4byte _0816677E @ case 1
	.4byte _08166824 @ case 2
	.4byte _081667AC @ case 3
	.4byte _081667BA @ case 4
	.4byte _081667D4 @ case 5
	.4byte _08166800 @ case 6
_08166748:
	ldr r0, _08166768
	ldr r0, [r0]
	ldr r1, _0816676C
	adds r0, r0, r1
	ldr r1, _08166770
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08166774
	ldr r0, [r4]
	adds r0, #0x56
	ldrb r0, [r0]
	bl sub_08167AA8
	ldr r1, [r4]
	b _081667EE
	.align 2, 0
_08166768: .4byte 0x0203B978
_0816676C: .4byte 0x00008041
_08166770: .4byte 0x0203B968
_08166774:
	ldr r0, [r4]
	adds r0, #0x50
	movs r1, #3
	strb r1, [r0]
	b _08166824
_0816677E:
	ldr r0, _081667A0
	ldr r0, [r0]
	ldr r1, _081667A4
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08166824
	ldr r0, _081667A8
	ldr r0, [r0]
	adds r0, #0x50
	strb r1, [r0]
	b _08166824
	.align 2, 0
_081667A0: .4byte 0x0203B978
_081667A4: .4byte 0x00008044
_081667A8: .4byte 0x0203B95C
_081667AC:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	b _081667EA
_081667BA:
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #2
	bl ShowBg
	b _081667EA
_081667D4:
	ldr r0, _081667F8
	bl SetVBlankCallback
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_081667EA:
	ldr r0, _081667FC
	ldr r1, [r0]
_081667EE:
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08166824
	.align 2, 0
_081667F8: .4byte 0x0816614D
_081667FC: .4byte 0x0203B95C
_08166800:
	ldr r0, _0816682C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08166824
	ldr r0, _08166830
	ldr r0, [r0]
	ldr r1, _08166834
	adds r0, r0, r1
	bl sub_081D2A94
	ldr r0, _08166838
	bl sub_08166178
	ldr r0, _0816683C
	bl SetMainCallback2
_08166824:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816682C: .4byte 0x02037C74
_08166830: .4byte 0x0203B978
_08166834: .4byte 0x00007B1C
_08166838: .4byte 0x08166841
_0816683C: .4byte 0x08166129
	thumb_func_end sub_08166704

	thumb_func_start sub_08166840
sub_08166840: @ 0x08166840
	push {r4, r5, r6, lr}
	ldr r1, _0816685C
	ldr r0, [r1]
	adds r0, #0x50
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #5
	bls _08166852
	b _081669E6
_08166852:
	lsls r0, r0, #2
	ldr r1, _08166860
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0816685C: .4byte 0x0203B95C
_08166860: .4byte 0x08166864
_08166864: @ jump table
	.4byte _0816687C @ case 0
	.4byte _081668B8 @ case 1
	.4byte _081668CC @ case 2
	.4byte _08166920 @ case 3
	.4byte _081669A0 @ case 4
	.4byte _081669C2 @ case 5
_0816687C:
	ldr r4, [r5]
	ldr r3, _081668A8
	str r3, [r4, #0xc]
	ldr r0, _081668AC
	ldr r0, [r0]
	ldr r2, _081668B0
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r0, r1
	subs r2, #0x88
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	adds r1, r1, r3
	str r1, [r4, #0xc]
	ldr r3, _081668B4
	adds r0, r0, r3
	bl sub_081D2B50
	b _081669B6
	.align 2, 0
_081668A8: .4byte 0x02024190
_081668AC: .4byte 0x0203B978
_081668B0: .4byte 0x00008041
_081668B4: .4byte 0x00007B1C
_081668B8:
	ldr r0, _081668C8
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081668C6
	b _081669E6
_081668C6:
	b _081669B6
	.align 2, 0
_081668C8: .4byte 0x03002360
_081668CC:
	bl sub_08166F08
	ldr r6, _0816690C
	ldr r0, [r6]
	adds r0, #0x5c
	ldr r4, _08166910
	ldr r1, [r4]
	ldr r5, _08166914
	adds r1, r1, r5
	bl sub_081D1D70
	ldr r2, [r4]
	ldr r4, _08166918
	adds r0, r2, r4
	ldr r3, _0816691C
	adds r1, r2, r3
	movs r3, #0
	ldrsb r3, [r1, r3]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r4, #0x14
	adds r1, r1, r4
	adds r1, r2, r1
	adds r2, r2, r5
	bl sub_081D15CC
	bl sub_0816713C
	ldr r1, [r6]
	b _081669B8
	.align 2, 0
_0816690C: .4byte 0x0203B95C
_08166910: .4byte 0x0203B978
_08166914: .4byte 0x00007CA8
_08166918: .4byte 0x00007C58
_0816691C: .4byte 0x00007FB3
_08166920:
	ldr r5, _08166984
	ldr r0, [r5]
	ldr r1, _08166988
	adds r0, r0, r1
	bl sub_081D16BC
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _081669E6
	ldr r0, [r5]
	ldr r4, _0816698C
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_081670A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08167FFC
	ldr r3, [r5]
	adds r4, r3, r4
	ldrb r1, [r4]
	ldr r2, _08166990
	adds r0, r3, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	beq _08166978
	ldr r4, _08166994
	adds r0, r3, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r2, #0x90
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r4, _08166998
	adds r0, r3, r4
	subs r4, #0xc
	adds r1, r3, r4
	ldrb r1, [r1]
	bl sub_081D2AB0
_08166978:
	ldr r1, _0816699C
	ldr r0, [r1]
	adds r0, #0x52
	strb r6, [r0]
	ldr r1, [r1]
	b _081669B8
	.align 2, 0
_08166984: .4byte 0x0203B978
_08166988: .4byte 0x00007C58
_0816698C: .4byte 0x00008041
_08166990: .4byte 0x00008040
_08166994: .4byte 0x00007FB3
_08166998: .4byte 0x00007B1C
_0816699C: .4byte 0x0203B95C
_081669A0:
	ldr r1, [r5]
	adds r1, #0x52
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _081669E6
	bl sub_08166C30
_081669B6:
	ldr r1, [r5]
_081669B8:
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081669E6
_081669C2:
	ldr r0, _081669EC
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081669E6
	bl sub_08166CE8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081669E6
	ldr r0, _081669F0
	ldrb r0, [r0]
	bl sub_08136FD8
	ldr r0, _081669F4
	bl sub_08166178
_081669E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081669EC: .4byte 0x03002360
_081669F0: .4byte 0x0203CB48
_081669F4: .4byte 0x081669F9
	thumb_func_end sub_08166840

	thumb_func_start sub_081669F8
sub_081669F8: @ 0x081669F8
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _08166A14
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0x50
	ldrb r1, [r2]
	cmp r1, #1
	beq _08166A34
	cmp r1, #1
	bgt _08166A18
	cmp r1, #0
	beq _08166A22
	b _08166B24
	.align 2, 0
_08166A14: .4byte 0x0203B95C
_08166A18:
	cmp r1, #2
	beq _08166A4C
	cmp r1, #3
	beq _08166A68
	b _08166B24
_08166A22:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _08166A56
_08166A34:
	ldr r0, _08166A48
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08166B24
	movs r0, #2
	strb r0, [r2]
	b _08166B24
	.align 2, 0
_08166A48: .4byte 0x02037C74
_08166A4C:
	ldr r1, _08166A64
	movs r0, #3
	strb r0, [r1, #0x15]
	bl ScanlineEffect_InitHBlankDmaTransfer
_08166A56:
	ldr r1, [r4]
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08166B24
	.align 2, 0
_08166A64: .4byte 0x020397C8
_08166A68:
	ldr r0, [r0, #4]
	bl SetMainCallback2
	ldr r0, _08166B2C
	ldr r0, [r0]
	ldr r1, _08166B30
	adds r0, r0, r1
	bl nullsub_79
	movs r4, #0
_08166A7C:
	ldr r5, _08166B2C
	ldr r0, [r5]
	ldr r2, _08166B34
	adds r0, r0, r2
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08166B38
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _08166A7C
	movs r0, #0
	bl FreeSpriteTilesByTag
	movs r0, #1
	bl FreeSpriteTilesByTag
	movs r0, #0
	bl FreeSpritePaletteByTag
	movs r0, #1
	bl FreeSpritePaletteByTag
	movs r4, #0
_08166ABA:
	ldr r0, [r5]
	lsls r1, r4, #2
	ldr r2, _08166B3C
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _08166ABA
	ldr r6, _08166B2C
	ldr r0, [r6]
	ldr r2, _08166B40
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08166AF2
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08166B38
	adds r0, r0, r1
	bl DestroySprite
_08166AF2:
	movs r0, #0
	bl SetVBlankCallback
	ldr r4, _08166B44
	ldr r0, [r4]
	bl Free
	movs r5, #0
	str r5, [r4]
	ldr r4, _08166B48
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _08166B4C
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r0, [r6]
	bl Free
	str r5, [r6]
	bl FreeAllWindowBuffers
_08166B24:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08166B2C: .4byte 0x0203B978
_08166B30: .4byte 0x00007B1C
_08166B34: .4byte 0x00007B06
_08166B38: .4byte 0x020205AC
_08166B3C: .4byte 0x00007B44
_08166B40: .4byte 0x00007B10
_08166B44: .4byte 0x0203B96C
_08166B48: .4byte 0x0203B970
_08166B4C: .4byte 0x0203B974
	thumb_func_end sub_081669F8

	thumb_func_start sub_08166B50
sub_08166B50: @ 0x08166B50
	push {r4, lr}
	sub sp, #0x4c
	ldr r0, _08166BD8
	ldr r0, [r0]
	ldr r1, _08166BDC
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_081670A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _08166BE0
	adds r0, r0, r1
	movs r1, #2
	add r2, sp, #0xc
	bl GetMonData
	add r0, sp, #0xc
	bl StringGetEnd10
	ldr r1, _08166BE4
	add r0, sp, #0xc
	bl StringAppend
	ldr r4, _08166BE8
	adds r0, r4, #0
	add r1, sp, #0xc
	bl StringCopy
	movs r0, #2
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r0, #2
	movs r1, #0x91
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #2
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #2
	bl PutWindowTilemap
	ldr r0, _08166BEC
	movs r1, #1
	movs r2, #0x91
	movs r3, #0xe
	bl sub_08198D44
	add sp, #0x4c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08166BD8: .4byte 0x0203B978
_08166BDC: .4byte 0x00008041
_08166BE0: .4byte 0x02024190
_08166BE4: .4byte 0x085CBD12
_08166BE8: .4byte 0x02021C7C
_08166BEC: .4byte 0x085C09E0
	thumb_func_end sub_08166B50

	thumb_func_start sub_08166BF0
sub_08166BF0: @ 0x08166BF0
	push {r4, lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08166C24
	cmp r1, #0
	bgt _08166C0E
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08166C12
	b _08166C24
_08166C0E:
	cmp r1, #1
	bne _08166C24
_08166C12:
	movs r0, #5
	bl PlaySE
	movs r0, #2
	bl rbox_fill_rectangle
	movs r0, #2
	bl ClearWindowTilemap
_08166C24:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08166BF0

	thumb_func_start sub_08166C30
sub_08166C30: @ 0x08166C30
	push {r4, lr}
	movs r0, #2
	movs r1, #0x91
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #2
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r3, _08166CAC
	ldr r0, [r3]
	adds r0, #0x53
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r3]
	adds r1, r2, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #4
	bhi _08166CB4
	adds r0, r2, #0
	adds r0, #0x61
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r3, #0
	cmp r0, #0
	bne _08166C90
	adds r2, r4, #0
_08166C6C:
	ldr r0, [r2]
	adds r0, #0x53
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r3, [r2]
	adds r1, r3, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #4
	bhi _08166CB4
	adds r0, r3, #0
	adds r0, #0x61
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08166C6C
_08166C90:
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #4
	bhi _08166CB4
	ldr r0, _08166CB0
	ldrb r1, [r1]
	adds r2, #0x61
	adds r2, r2, r1
	ldrb r2, [r2]
	bl Pokeblock_BufferEnhancedStatText
	b _08166CC4
	.align 2, 0
_08166CAC: .4byte 0x0203B95C
_08166CB0: .4byte 0x02021C7C
_08166CB4:
	ldr r0, _08166CE0
	ldr r1, _08166CE4
	ldr r1, [r1]
	adds r1, #0x53
	ldrb r1, [r1]
	movs r2, #0
	bl Pokeblock_BufferEnhancedStatText
_08166CC4:
	ldr r0, _08166CE0
	bl Pokeblock_MenuWindowTextPrint
	movs r0, #2
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #2
	bl PutWindowTilemap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08166CE0: .4byte 0x02021C7C
_08166CE4: .4byte 0x0203B95C
	thumb_func_end sub_08166C30

	thumb_func_start sub_08166CE8
sub_08166CE8: @ 0x08166CE8
	push {r4, r5, lr}
	movs r0, #2
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r5, _08166D20
	adds r3, r5, #0
	movs r4, #5
_08166CF8:
	ldr r0, [r3]
	adds r0, #0x53
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r2, [r3]
	adds r1, r2, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #4
	bhi _08166D24
	adds r0, r2, #0
	adds r0, #0x61
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08166D2A
	b _08166CF8
	.align 2, 0
_08166D20: .4byte 0x0203B95C
_08166D24:
	strb r4, [r1]
	movs r0, #0
	b _08166D50
_08166D2A:
	ldr r4, _08166D58
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x53
	ldrb r1, [r1]
	adds r0, #0x61
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r4, #0
	bl Pokeblock_BufferEnhancedStatText
	adds r0, r4, #0
	bl Pokeblock_MenuWindowTextPrint
	movs r0, #2
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #1
_08166D50:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08166D58: .4byte 0x02021C7C
	thumb_func_end sub_08166CE8

	thumb_func_start sub_08166D5C
sub_08166D5C: @ 0x08166D5C
	push {lr}
	sub sp, #0xc
	movs r0, #2
	movs r1, #0x91
	movs r2, #0xe
	bl DrawTextBorderOuter
	ldr r2, _08166D94
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #2
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #2
	bl PutWindowTilemap
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08166D94: .4byte 0x085CBD57
	thumb_func_end sub_08166D5C

	thumb_func_start sub_08166D98
sub_08166D98: @ 0x08166D98
	push {lr}
	movs r0, #2
	bl rbox_fill_rectangle
	movs r0, #2
	bl ClearWindowTilemap
	movs r0, #2
	movs r1, #3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08166D98

	thumb_func_start Pokeblock_MenuWindowTextPrint
Pokeblock_MenuWindowTextPrint: @ 0x08166DB4
	push {lr}
	sub sp, #0xc
	ldr r2, _08166DD4
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08166DD4: .4byte 0x02021C7C
	thumb_func_end Pokeblock_MenuWindowTextPrint

	thumb_func_start Pokeblock_BufferEnhancedStatText
Pokeblock_BufferEnhancedStatText: @ 0x08166DD8
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r0, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0
	beq _08166E14
	cmp r2, #0
	ble _08166DF0
	movs r0, #0
_08166DF0:
	lsls r0, r0, #0x10
	ldr r1, _08166E0C
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _08166E10
	adds r0, r4, #0
	bl StringAppend
	b _08166E1C
	.align 2, 0
_08166E0C: .4byte 0x085C09E8
_08166E10: .4byte 0x085CBD3D
_08166E14:
	ldr r1, _08166E24
	adds r0, r4, #0
	bl StringCopy
_08166E1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08166E24: .4byte 0x085CBD4A
	thumb_func_end Pokeblock_BufferEnhancedStatText

	thumb_func_start Pokeblock_GetMonContestStats
Pokeblock_GetMonContestStats: @ 0x08166E28
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
	ldr r7, _08166E54
_08166E32:
	lsls r0, r4, #2
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r6, #0
	bl GetMonData
	adds r1, r5, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08166E32
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08166E54: .4byte 0x085C0994
	thumb_func_end Pokeblock_GetMonContestStats

	thumb_func_start sub_08166E58
sub_08166E58: @ 0x08166E58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #0x30
	bl GetMonData
	cmp r0, #0xff
	beq _08166EF4
	mov r0, r8
	adds r1, r5, #0
	bl sub_08166F88
	movs r4, #0
	mov r7, sp
_08166E7C:
	ldr r1, _08166F00
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r6, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strb r0, [r7]
	ldr r1, _08166F04
	ldr r1, [r1]
	lsls r2, r4, #1
	adds r1, #0x66
	adds r1, r1, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08166EAA
	movs r1, #0
_08166EAA:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08166EB4
	movs r1, #0xff
_08166EB4:
	strb r1, [r7]
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, sp
	bl SetMonData
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08166E7C
	adds r0, r5, #0
	movs r1, #0x30
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, r8
	ldrb r2, [r2, #6]
	adds r1, r0, r2
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08166EE6
	movs r1, #0xff
_08166EE6:
	mov r0, sp
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0x30
	mov r2, sp
	bl SetMonData
_08166EF4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08166F00: .4byte 0x085C0994
_08166F04: .4byte 0x0203B95C
	thumb_func_end sub_08166E58

	thumb_func_start sub_08166F08
sub_08166F08: @ 0x08166F08
	push {r4, r5, lr}
	ldr r5, _08166F74
	ldr r0, _08166F78
	ldr r1, [r0]
	ldr r2, _08166F7C
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _08166F80
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x64
	muls r0, r1, r0
	adds r5, r0, r5
	ldr r4, _08166F84
	ldr r1, [r4]
	adds r1, #0x57
	adds r0, r5, #0
	bl Pokeblock_GetMonContestStats
	ldr r0, [r4]
	ldr r0, [r0, #8]
	adds r1, r5, #0
	bl sub_08166E58
	ldr r1, [r4]
	adds r1, #0x5c
	adds r0, r5, #0
	bl Pokeblock_GetMonContestStats
	movs r3, #0
_08166F48:
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0x61
	adds r2, r2, r3
	adds r1, r0, #0
	adds r1, #0x5c
	adds r1, r1, r3
	adds r0, #0x57
	adds r0, r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _08166F48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08166F74: .4byte 0x02024190
_08166F78: .4byte 0x0203B978
_08166F7C: .4byte 0x00008041
_08166F80: .4byte 0x00007FB9
_08166F84: .4byte 0x0203B95C
	thumb_func_end sub_08166F08

	thumb_func_start sub_08166F88
sub_08166F88: @ 0x08166F88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r1
	ldr r1, _08166FD0
	ldr r3, [r1]
	ldrb r1, [r0, #1]
	adds r2, r3, #0
	adds r2, #0x66
	strh r1, [r2]
	ldrb r2, [r0, #5]
	adds r1, r3, #0
	adds r1, #0x68
	strh r2, [r1]
	ldrb r1, [r0, #4]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r1, [r2]
	ldrb r2, [r0, #3]
	adds r1, r3, #0
	adds r1, #0x6c
	strh r2, [r1]
	ldrb r1, [r0, #2]
	adds r0, r3, #0
	adds r0, #0x6e
	strh r1, [r0]
	ldr r0, _08166FD4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08166FD8
	movs r0, #1
	b _08166FDE
	.align 2, 0
_08166FD0: .4byte 0x0203B95C
_08166FD4: .4byte 0x0203B96A
_08166FD8:
	cmp r0, #0
	bge _08167054
	movs r0, #0xff
_08166FDE:
	movs r2, #0
	lsls r0, r0, #0x18
	mov sb, r0
	ldr r0, _08167064
	mov r8, r0
_08166FE8:
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r2, #0x18
	asrs r6, r0, #0x18
	lsls r7, r6, #1
	adds r1, #0x66
	adds r1, r1, r7
	movs r2, #0
	ldrsh r4, [r1, r2]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08167020
	lsls r0, r5, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r5, r0, #0x18
_08167020:
	ldr r0, _08167068
	adds r0, r6, r0
	ldrb r1, [r0]
	mov r0, sl
	bl sub_0806E2E4
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r0, sb
	bne _08167048
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x66
	adds r0, r0, r7
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	muls r1, r2, r1
	ldrh r2, [r0]
	adds r1, r1, r2
	strh r1, [r0]
_08167048:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	ble _08166FE8
_08167054:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08167064: .4byte 0x0203B95C
_08167068: .4byte 0x085C09A8
	thumb_func_end sub_08166F88

	thumb_func_start IsSheenMaxed
IsSheenMaxed: @ 0x0816706C
	push {lr}
	ldr r0, _08167098
	ldr r1, [r0]
	ldr r2, _0816709C
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	subs r2, #0x89
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0x30
	movs r3, #0
	bl GetBoxOrPartyMonData
	cmp r0, #0xff
	beq _081670A0
	movs r0, #0
	b _081670A2
	.align 2, 0
_08167098: .4byte 0x0203B978
_0816709C: .4byte 0x00008041
_081670A0:
	movs r0, #1
_081670A2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsSheenMaxed

	thumb_func_start sub_081670A8
sub_081670A8: @ 0x081670A8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
_081670B0:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081670CC
	adds r0, r0, r1
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081670D6
	cmp r5, #0
	bne _081670D0
	adds r0, r4, #0
	b _081670E2
	.align 2, 0
_081670CC: .4byte 0x02024190
_081670D0:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_081670D6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _081670B0
	movs r0, #0
_081670E2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081670A8

	thumb_func_start sub_081670E8
sub_081670E8: @ 0x081670E8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	movs r6, #0
	cmp r6, r5
	bhs _08167118
_081670F6:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _08167124
	adds r0, r0, r1
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	beq _0816710E
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0816710E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _081670F6
_08167118:
	subs r0, r5, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08167124: .4byte 0x02024190
	thumb_func_end sub_081670E8

	thumb_func_start sub_08167128
sub_08167128: @ 0x08167128
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081670A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08167128

	thumb_func_start sub_0816713C
sub_0816713C: @ 0x0816713C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _081671C4
	bl LoadSpriteSheet
	ldr r0, _081671C8
	bl LoadSpritePalette
	ldr r2, _081671CC
	ldr r0, [r2]
	adds r0, #0x54
	movs r1, #0
	strb r1, [r0]
	movs r4, #0
	adds r5, r2, #0
	ldr r6, _081671D0
	adds r0, r6, #2
	mov r8, r0
	ldr r7, _081671D4
_08167164:
	ldr r0, [r5]
	adds r0, #0x61
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _081671B0
	lsls r2, r4, #2
	adds r0, r2, r6
	movs r3, #0
	ldrsh r1, [r0, r3]
	add r2, r8
	movs r0, #0
	ldrsh r2, [r2, r0]
	ldr r0, _081671D8
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _081671B0
	ldr r0, [r5]
	adds r0, #0x61
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _081671A6
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, _081671DC
	str r1, [r0]
_081671A6:
	ldr r1, [r5]
	adds r1, #0x54
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_081671B0:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08167164
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081671C4: .4byte 0x085C09FC
_081671C8: .4byte 0x085C0A04
_081671CC: .4byte 0x0203B95C
_081671D0: .4byte 0x085C0A0C
_081671D4: .4byte 0x020205C8
_081671D8: .4byte 0x085C0A40
_081671DC: .4byte 0x081671E1
	thumb_func_end sub_0816713C

	thumb_func_start sub_081671E0
sub_081671E0: @ 0x081671E0
	push {lr}
	adds r1, r0, #0
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #5
	bgt _081671F2
	ldrh r0, [r1, #0x26]
	subs r0, #2
	b _081671FA
_081671F2:
	cmp r0, #0xb
	bgt _081671FC
	ldrh r0, [r1, #0x26]
	adds r0, #2
_081671FA:
	strh r0, [r1, #0x26]
_081671FC:
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _0816721C
	adds r0, r1, #0
	bl DestroySprite
	ldr r0, _08167220
	ldr r1, [r0]
	adds r1, #0x54
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0816721C:
	pop {r0}
	bx r0
	.align 2, 0
_08167220: .4byte 0x0203B95C
	thumb_func_end sub_081671E0

	thumb_func_start sub_08167224
sub_08167224: @ 0x08167224
	push {r4, r5, r6, lr}
	movs r4, #0
	movs r5, #0
	ldr r6, _08167230
	b _08167276
	.align 2, 0
_08167230: .4byte 0x0203B978
_08167234:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081672A4
	adds r0, r0, r1
	movs r1, #0x2d
	bl GetMonData
	adds r3, r0, #0
	cmp r3, #0
	bne _08167270
	ldr r1, [r6]
	lsls r2, r5, #2
	adds r1, r1, r2
	ldr r0, _081672A8
	adds r1, r1, r0
	movs r0, #0xe
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r2
	ldr r1, _081672AC
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, r0, r2
	ldr r2, _081672B0
	adds r0, r0, r2
	strh r3, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08167270:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08167276:
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _08167234
	ldr r2, _081672B4
	ldr r0, [r2]
	ldr r1, _081672B8
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r1, r5, #1
	ldr r2, _081672BC
	adds r0, r0, r2
	strb r1, [r0]
	bl sub_081672C0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081672A4: .4byte 0x02024190
_081672A8: .4byte 0x00007FB8
_081672AC: .4byte 0x00007FB9
_081672B0: .4byte 0x00007FBA
_081672B4: .4byte 0x0203B978
_081672B8: .4byte 0x00008041
_081672BC: .4byte 0x00008040
	thumb_func_end sub_08167224

	thumb_func_start sub_081672C0
sub_081672C0: @ 0x081672C0
	push {r4, r5, lr}
	ldr r4, _0816732C
	ldr r0, [r4]
	ldr r5, _08167330
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0
	bl sub_08167340
	ldr r0, [r4]
	ldr r1, _08167334
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, _08167338
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _0816733C
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r4]
	adds r5, r0, r5
	ldrb r3, [r5]
	adds r1, r3, #1
	adds r2, #0x8c
	adds r0, r0, r2
	ldrb r2, [r0]
	cmp r1, r2
	blt _08167304
	movs r1, #0
_08167304:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bge _08167314
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08167314:
	adds r0, r1, #0
	movs r1, #1
	bl sub_08167340
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #2
	bl sub_08167340
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816732C: .4byte 0x0203B978
_08167330: .4byte 0x00008041
_08167334: .4byte 0x00007FB3
_08167338: .4byte 0x00007FB4
_0816733C: .4byte 0x00007FB5
	thumb_func_end sub_081672C0

	thumb_func_start sub_08167340
sub_08167340: @ 0x08167340
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081673F0
	mov sb, r0
	ldr r1, [r0]
	lsls r5, r5, #0x10
	asrs r0, r5, #0xe
	adds r0, r1, r0
	ldr r3, _081673F4
	adds r2, r0, r3
	ldrb r7, [r2]
	ldr r2, _081673F8
	adds r0, r0, r2
	ldrb r0, [r0]
	mov sl, r0
	adds r3, #0x88
	adds r0, r1, r3
	ldrb r6, [r0]
	movs r0, #0
	mov r8, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r2, _081673FC
	adds r0, r0, r2
	adds r0, r1, r0
	lsls r2, r4, #6
	ldr r3, _08167400
	adds r2, r2, r3
	adds r1, r1, r2
	lsrs r5, r5, #0x10
	str r5, [sp]
	str r6, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r2, r7, #0
	mov r3, sl
	bl sub_081D2504
	mov r3, sb
	ldr r1, [r3]
	ldr r2, _08167404
	adds r0, r1, r2
	ldr r3, _08167408
	adds r1, r1, r3
	str r5, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	mov r2, r8
	str r2, [sp, #0xc]
	adds r2, r7, #0
	mov r3, sl
	bl sub_081D25A8
	lsls r0, r4, #0xd
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, sb
	ldr r1, [r3]
	adds r0, r1, r0
	lsls r4, r4, #7
	adds r4, #4
	adds r1, r1, r4
	str r5, [sp]
	str r6, [sp, #4]
	mov r2, r8
	str r2, [sp, #8]
	adds r2, r7, #0
	mov r3, sl
	bl sub_081D26C4
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081673F0: .4byte 0x0203B978
_081673F4: .4byte 0x00007FB8
_081673F8: .4byte 0x00007FB9
_081673FC: .4byte 0x00007B4D
_08167400: .4byte 0x00007B95
_08167404: .4byte 0x00007C58
_08167408: .4byte 0x00007FB0
	thumb_func_end sub_08167340

	thumb_func_start sub_0816740C
sub_0816740C: @ 0x0816740C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _081674A0
	ldr r3, [r1]
	ldr r0, _081674A4
	mov r8, r0
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r7, r1, #0
	cmp r0, #0xff
	bne _08167518
	add r5, sp, #0x18
	add r4, sp, #0x20
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_081D2800
	lsls r0, r6, #0xd
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	lsls r0, r6, #7
	adds r0, #4
	adds r1, r1, r0
	str r1, [sp, #0x20]
	adds r0, r4, #0
	bl LoadSpritePalette
	ldr r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081674A8
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r5, #0
	bl LoadSpriteSheet
	ldr r1, [r7]
	ldr r3, _081674AC
	adds r1, r1, r3
	strh r0, [r1]
	mov r0, sp
	movs r1, #0x26
	movs r2, #0x68
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r7]
	ldr r2, _081674A4
	adds r0, r0, r2
	strb r1, [r0]
	cmp r1, #0x40
	bne _081674B0
	movs r0, #0x64
	bl FreeSpriteTilesByTag
	movs r0, #0x64
	bl FreeSpritePaletteByTag
	ldr r0, [r7]
	add r0, r8
	movs r1, #0xff
	strb r1, [r0]
	b _08167546
	.align 2, 0
_081674A0: .4byte 0x0203B978
_081674A4: .4byte 0x00007B10
_081674A8: .4byte 0x00007B12
_081674AC: .4byte 0x00007B14
_081674B0:
	ldr r0, [r7]
	add r0, r8
	strb r1, [r0]
	ldr r4, _08167504
	ldr r2, [r7]
	mov r0, r8
	adds r3, r2, r0
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08167508
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	subs r1, #0x22
	strh r1, [r0, #0x26]
	ldr r3, _0816750C
	adds r1, r2, r3
	subs r3, #4
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08167510
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _08167514
	adds r2, r2, r0
	ldrh r0, [r2]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r2]
	b _08167546
	.align 2, 0
_08167504: .4byte 0x020205AC
_08167508: .4byte 0x08167F71
_0816750C: .4byte 0x00007B18
_08167510: .4byte 0x06010000
_08167514: .4byte 0x00007B12
_08167518:
	lsls r1, r6, #0xd
	movs r0, #0xc1
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r3, r1
	ldr r2, _08167554
	adds r0, r3, r2
	ldr r2, [r0]
	ldr r0, _08167558
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0816755C
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	lsls r0, r6, #7
	adds r0, #4
	adds r0, r3, r0
	ldr r2, _08167560
	adds r1, r3, r2
	ldrh r1, [r1]
	movs r2, #0x20
	bl LoadPalette
_08167546:
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08167554: .4byte 0x00007B18
_08167558: .4byte 0x040000D4
_0816755C: .4byte 0x80000400
_08167560: .4byte 0x00007B12
	thumb_func_end sub_0816740C

	thumb_func_start sub_08167564
sub_08167564: @ 0x08167564
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	add r5, sp, #0x20
	add r4, sp, #0x38
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_081D284C
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, #0
	bl LoadSpritePalettes
	movs r4, #0
	ldr r1, _081675EC
	ldr r0, [r1]
	ldr r2, _081675F0
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	adds r6, r5, #0
	add r2, sp, #0x50
	mov sb, r2
	add r2, sp, #0x58
	mov sl, r2
	cmp r4, r0
	bge _08167620
	adds r5, r1, #0
	ldr r7, _081675F4
	movs r0, #0x1c
	adds r0, r0, r7
	mov r8, r0
_081675B0:
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x12
	movs r1, #0x80
	lsls r1, r1, #0xc
	adds r2, r2, r1
	asrs r2, r2, #0x10
	adds r0, r6, #0
	movs r1, #0xe2
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _08167600
	ldr r0, [r5]
	ldr r2, _081675F8
	adds r0, r0, r2
	adds r0, r0, r4
	strb r3, [r0]
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r0, r7
	strh r4, [r1, #0x2e]
	add r0, r8
	ldr r1, _081675FC
	str r1, [r0]
	b _0816760C
	.align 2, 0
_081675EC: .4byte 0x0203B978
_081675F0: .4byte 0x00008040
_081675F4: .4byte 0x020205AC
_081675F8: .4byte 0x00007B06
_081675FC: .4byte 0x08167F89
_08167600:
	ldr r0, [r5]
	ldr r1, _08167668
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
_0816760C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5]
	ldr r2, _0816766C
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r4, r0
	blt _081675B0
_08167620:
	movs r0, #0x67
	strh r0, [r6]
	cmp r4, #5
	bhi _0816768E
	ldr r5, _08167670
	ldr r7, _08167674
_0816762C:
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x12
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r2, r2, r0
	asrs r2, r2, #0x10
	adds r0, r6, #0
	movs r1, #0xe6
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _08167678
	ldr r0, [r5]
	ldr r1, _08167668
	adds r0, r0, r1
	adds r0, r0, r4
	strb r3, [r0]
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #3]
	movs r0, #0x3f
	ands r0, r2
	strb r0, [r1, #3]
	b _08167684
	.align 2, 0
_08167668: .4byte 0x00007B06
_0816766C: .4byte 0x00008040
_08167670: .4byte 0x0203B978
_08167674: .4byte 0x020205AC
_08167678:
	ldr r0, [r5]
	ldr r2, _081676E8
	adds r0, r0, r2
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
_08167684:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _0816762C
_0816768E:
	movs r0, #0x66
	strh r0, [r6]
	ldr r0, _081676EC
	str r0, [r6, #0x14]
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x12
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r2, r2, r0
	asrs r2, r2, #0x10
	adds r0, r6, #0
	movs r1, #0xde
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _081676F8
	ldr r0, _081676F0
	ldr r0, [r0]
	ldr r1, _081676E8
	adds r0, r0, r1
	adds r0, r0, r4
	strb r3, [r0]
	ldr r0, _081676F4
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrb r3, [r2, #1]
	movs r1, #0x3f
	adds r0, r1, #0
	ands r0, r3
	movs r3, #0x40
	orrs r0, r3
	strb r0, [r2, #1]
	ldrb r0, [r2, #3]
	ands r1, r0
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r2, #3]
	b _08167706
	.align 2, 0
_081676E8: .4byte 0x00007B06
_081676EC: .4byte 0x08167FBD
_081676F0: .4byte 0x0203B978
_081676F4: .4byte 0x020205AC
_081676F8:
	ldr r0, _0816772C
	ldr r0, [r0]
	ldr r2, _08167730
	adds r0, r0, r2
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
_08167706:
	mov r0, sb
	mov r1, sl
	bl sub_081D28E0
	mov r0, sb
	bl LoadSpriteSheet
	mov r0, sl
	bl LoadSpritePalette
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816772C: .4byte 0x0203B978
_08167730: .4byte 0x00007B06
	thumb_func_end sub_08167564

	thumb_func_start sub_08167734
sub_08167734: @ 0x08167734
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _08167754
	ldr r0, [r0]
	ldr r2, _08167758
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xb
	bls _08167748
	b _0816797C
_08167748:
	lsls r0, r0, #2
	ldr r1, _0816775C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08167754: .4byte 0x0203B978
_08167758: .4byte 0x00008048
_0816775C: .4byte 0x08167760
_08167760: @ jump table
	.4byte _08167790 @ case 0
	.4byte _08167808 @ case 1
	.4byte _0816783C @ case 2
	.4byte _0816784C @ case 3
	.4byte _08167860 @ case 4
	.4byte _08167878 @ case 5
	.4byte _081678A0 @ case 6
	.4byte _081678B4 @ case 7
	.4byte _081678D8 @ case 8
	.4byte _081678F0 @ case 9
	.4byte _08167920 @ case 10
	.4byte _0816793C @ case 11
_08167790:
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
	movs r1, #0x88
	lsls r1, r1, #6
	movs r0, #3
	movs r2, #0
	bl ChangeBgY
	ldr r1, _08167800
	movs r0, #0
	bl SetGpuReg
	movs r1, #0x91
	lsls r1, r1, #2
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _08167804
	movs r0, #0x52
	bl SetGpuReg
	b _08167982
	.align 2, 0
_08167800: .4byte 0x00007040
_08167804: .4byte 0x0000040B
_08167808:
	ldr r4, _08167830
	movs r0, #0xfa
	lsls r0, r0, #4
	bl Alloc
	str r0, [r4]
	ldr r5, _08167834
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r0, r4, #0
	bl Alloc
	str r0, [r5]
	ldr r5, _08167838
	adds r0, r4, #0
	bl Alloc
	str r0, [r5]
	b _08167982
	.align 2, 0
_08167830: .4byte 0x0203B970
_08167834: .4byte 0x0203B96C
_08167838: .4byte 0x0203B974
_0816783C:
	ldr r0, _08167844
	ldr r1, _08167848
	b _081678A4
	.align 2, 0
_08167844: .4byte 0x085BF9A0
_08167848: .4byte 0x0203B974
_0816784C:
	ldr r1, _0816785C
	movs r0, #3
	movs r2, #0xe0
	movs r3, #0
	bl LoadBgTiles
	b _08167982
	.align 2, 0
_0816785C: .4byte 0x085BF8C0
_08167860:
	ldr r0, _08167874
	ldr r1, [r0]
	movs r2, #0xa0
	lsls r2, r2, #3
	movs r0, #3
	movs r3, #0
	bl LoadBgTilemap
	b _08167982
	.align 2, 0
_08167874: .4byte 0x0203B974
_08167878:
	ldr r0, _08167890
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08167894
	ldr r0, [r0]
	ldr r1, _08167898
	adds r0, r0, r1
	ldr r1, _0816789C
	strh r1, [r0]
	b _08167982
	.align 2, 0
_08167890: .4byte 0x085BF880
_08167894: .4byte 0x0203B978
_08167898: .4byte 0x00007B0E
_0816789C: .4byte 0x0000FFB0
_081678A0:
	ldr r0, _081678AC
	ldr r1, _081678B0
_081678A4:
	ldr r1, [r1]
	bl LZ77UnCompVram
	b _08167982
	.align 2, 0
_081678AC: .4byte 0x085BFAAC
_081678B0: .4byte 0x0203B970
_081678B4:
	ldr r0, _081678CC
	ldr r1, _081678D0
	ldr r1, [r1]
	bl LZ77UnCompVram
	ldr r0, _081678D4
	movs r1, #0x20
	movs r2, #0x20
	bl LoadPalette
	b _08167982
	.align 2, 0
_081678CC: .4byte 0x085C0230
_081678D0: .4byte 0x0203B96C
_081678D4: .4byte 0x085BFA4C
_081678D8:
	ldr r0, _081678EC
	ldr r1, [r0]
	movs r2, #0xfa
	lsls r2, r2, #4
	movs r3, #0xa0
	lsls r3, r3, #2
	movs r0, #1
	bl LoadBgTiles
	b _08167982
	.align 2, 0
_081678EC: .4byte 0x0203B970
_081678F0:
	ldr r0, _08167918
	ldr r1, [r0]
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, _0816791C
	movs r0, #0xb
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r2, #0
	movs r3, #0xd
	bl CopyToBgTilemapBufferRect
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	b _08167982
	.align 2, 0
_08167918: .4byte 0x0203B96C
_0816791C: .4byte 0x085C0410
_08167920:
	ldr r0, _08167930
	ldr r1, _08167934
	ldr r1, [r1]
	ldr r2, _08167938
	adds r1, r1, r2
	bl LZ77UnCompVram
	b _08167982
	.align 2, 0
_08167930: .4byte 0x085C0488
_08167934: .4byte 0x0203B978
_08167938: .4byte 0x00007304
_0816793C:
	ldr r0, _0816796C
	ldr r1, [r0]
	ldr r0, _08167970
	adds r1, r1, r0
	movs r2, #0xa0
	lsls r2, r2, #3
	movs r0, #2
	movs r3, #0
	bl LoadBgTilemap
	ldr r0, _08167974
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08167978
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #2
	bl sub_081D1824
	b _08167982
	.align 2, 0
_0816796C: .4byte 0x0203B978
_08167970: .4byte 0x00007304
_08167974: .4byte 0x085F4E2C
_08167978: .4byte 0x085F4E4C
_0816797C:
	movs r0, #0
	strb r0, [r1]
	b _08167992
_08167982:
	ldr r0, _0816799C
	ldr r1, [r0]
	ldr r2, _081679A0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #1
_08167992:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0816799C: .4byte 0x0203B978
_081679A0: .4byte 0x00008048
	thumb_func_end sub_08167734

	thumb_func_start sub_081679A4
sub_081679A4: @ 0x081679A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r7, _08167A68
	ldr r3, [r7]
	ldr r1, _08167A6C
	adds r0, r3, r1
	ldrb r1, [r0]
	ldr r2, _08167A70
	adds r0, r3, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	beq _08167A4E
	lsls r2, r4, #6
	ldr r0, _08167A74
	adds r2, r2, r0
	adds r2, r3, r2
	movs r0, #2
	str r0, [sp]
	movs r5, #0
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [r7]
	ldr r1, _08167A6C
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_081670A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _08167A78
	adds r0, r0, r1
	bl GetNature
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r7]
	ldr r6, _08167A7C
	adds r0, r0, r6
	ldr r1, _08167A80
	bl StringCopy
	ldr r1, _08167A84
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r1, [r4]
	movs r2, #0
	movs r3, #5
	bl StringCopyPadded
	ldr r0, _08167A88
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [r7]
	adds r0, r0, r6
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
_08167A4E:
	mov r2, r8
	cmp r2, #0
	beq _08167A8C
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	b _08167A9C
	.align 2, 0
_08167A68: .4byte 0x0203B978
_08167A6C: .4byte 0x00008041
_08167A70: .4byte 0x00008040
_08167A74: .4byte 0x00007B95
_08167A78: .4byte 0x02024190
_08167A7C: .4byte 0x0000804A
_08167A80: .4byte 0x085CB7A2
_08167A84: .4byte 0x085ECE24
_08167A88: .4byte 0x085C09AD
_08167A8C:
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
_08167A9C:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081679A4

	thumb_func_start sub_08167AA8
sub_08167AA8: @ 0x08167AA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _08167AC8
	ldr r0, _08167AC0
	ldr r0, [r0]
	ldr r1, _08167AC4
	adds r0, r0, r1
	b _08167AD0
	.align 2, 0
_08167AC0: .4byte 0x0203B978
_08167AC4: .4byte 0x00007FB5
_08167AC8:
	ldr r0, _08167B80
	ldr r0, [r0]
	ldr r2, _08167B84
	adds r0, r0, r2
_08167AD0:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r5, _08167B80
	ldr r2, [r5]
	ldr r3, _08167B88
	adds r0, r2, r3
	ldr r4, _08167B8C
	adds r1, r2, r4
	movs r3, #0
	ldrsb r3, [r1, r3]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r4, _08167B90
	adds r1, r1, r4
	adds r1, r2, r1
	lsls r3, r6, #2
	adds r3, r3, r6
	lsls r3, r3, #2
	adds r3, r3, r4
	adds r2, r2, r3
	bl sub_081D15CC
	ldr r4, [r5]
	ldr r1, _08167B94
	adds r0, r4, r1
	ldrb r1, [r0]
	ldr r2, _08167B98
	mov ip, r2
	adds r0, r4, r2
	ldrb r0, [r0]
	subs r0, #1
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	mov r8, r0
	cmp r7, #0
	beq _08167BA0
	ldr r3, _08167B84
	adds r0, r4, r3
	ldrb r1, [r0]
	subs r2, #0x8b
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, [r5]
	ldr r4, _08167B8C
	adds r1, r0, r4
	ldrb r1, [r1]
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r0, r4
	strb r6, [r0]
	ldr r0, [r5]
	adds r2, r0, r2
	ldrb r1, [r2]
	ldr r2, _08167B9C
	adds r0, r0, r2
	strb r1, [r0]
	ldr r1, [r5]
	adds r3, #0x8d
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08167B60
	mov r4, ip
	adds r0, r1, r4
	ldrb r0, [r0]
_08167B60:
	subs r2, r0, #1
	ldr r0, _08167B94
	adds r1, r1, r0
	strb r2, [r1]
	ldr r1, _08167B80
	ldr r3, [r1]
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #0
	bne _08167B7C
	ldr r1, _08167B98
	adds r0, r3, r1
	ldrb r0, [r0]
_08167B7C:
	subs r1, r0, #1
	b _08167C26
	.align 2, 0
_08167B80: .4byte 0x0203B978
_08167B84: .4byte 0x00007FB4
_08167B88: .4byte 0x00007C58
_08167B8C: .4byte 0x00007FB3
_08167B90: .4byte 0x00007C6C
_08167B94: .4byte 0x00008041
_08167B98: .4byte 0x00008040
_08167B9C: .4byte 0x00007FB6
_08167BA0:
	ldr r3, _08167BE4
	adds r0, r4, r3
	ldrb r1, [r0]
	ldr r2, _08167BE8
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, [r5]
	ldr r4, _08167BEC
	adds r1, r0, r4
	ldrb r1, [r1]
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r0, r4
	strb r6, [r0]
	ldr r0, [r5]
	adds r2, r0, r2
	ldrb r1, [r2]
	ldr r2, _08167BF0
	adds r0, r0, r2
	strb r1, [r0]
	ldr r2, [r5]
	adds r3, #0x8c
	adds r0, r2, r3
	ldrb r1, [r0]
	adds r4, #0x8d
	adds r0, r2, r4
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08167BF4
	adds r3, r1, #1
	b _08167BF6
	.align 2, 0
_08167BE4: .4byte 0x00007FB5
_08167BE8: .4byte 0x00007FB4
_08167BEC: .4byte 0x00007FB3
_08167BF0: .4byte 0x00007FB6
_08167BF4:
	movs r3, #0
_08167BF6:
	ldr r1, _08167C18
	adds r0, r2, r1
	strb r3, [r0]
	ldr r2, _08167C1C
	ldr r3, [r2]
	adds r1, r3, r1
	ldrb r1, [r1]
	ldr r4, _08167C20
	adds r0, r3, r4
	ldrb r0, [r0]
	subs r0, #1
	adds r6, r2, #0
	cmp r1, r0
	bge _08167C24
	adds r1, #1
	b _08167C26
	.align 2, 0
_08167C18: .4byte 0x00008041
_08167C1C: .4byte 0x0203B978
_08167C20: .4byte 0x00008040
_08167C24:
	movs r1, #0
_08167C26:
	ldr r2, _08167C60
	adds r0, r3, r2
	strb r1, [r0]
	adds r5, r6, #0
	ldr r0, [r5]
	ldr r3, _08167C64
	adds r1, r0, r3
	ldrb r2, [r1]
	ldr r4, _08167C68
	adds r1, r0, r4
	ldrb r1, [r1]
	subs r1, #1
	eors r2, r1
	rsbs r1, r2, #0
	orrs r1, r2
	lsrs r4, r1, #0x1f
	ldr r1, _08167C6C
	adds r0, r0, r1
	bl sub_081D2B50
	mov r2, r8
	cmp r2, #0
	bne _08167C78
	ldr r0, [r5]
	ldr r3, _08167C70
	adds r0, r0, r3
	ldr r1, _08167C74
	b _08167C98
	.align 2, 0
_08167C60: .4byte 0x00007B4C
_08167C64: .4byte 0x00008041
_08167C68: .4byte 0x00008040
_08167C6C: .4byte 0x00007B1C
_08167C70: .4byte 0x00008044
_08167C74: .4byte 0x08167CAD
_08167C78:
	cmp r4, #0
	bne _08167C90
	ldr r0, [r5]
	ldr r4, _08167C88
	adds r0, r0, r4
	ldr r1, _08167C8C
	b _08167C98
	.align 2, 0
_08167C88: .4byte 0x00008044
_08167C8C: .4byte 0x08167DAD
_08167C90:
	ldr r0, [r6]
	ldr r1, _08167CA4
	adds r0, r0, r1
	ldr r1, _08167CA8
_08167C98:
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08167CA4: .4byte 0x00008044
_08167CA8: .4byte 0x08167E51
	thumb_func_end sub_08167AA8

	thumb_func_start sub_08167CAC
sub_08167CAC: @ 0x08167CAC
	push {r4, r5, r6, lr}
	ldr r4, _08167CC8
	ldr r1, [r4]
	ldr r5, _08167CCC
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _08167CEC
	cmp r0, #1
	bgt _08167CD0
	cmp r0, #0
	beq _08167CDA
	b _08167DA4
	.align 2, 0
_08167CC8: .4byte 0x0203B978
_08167CCC: .4byte 0x00008048
_08167CD0:
	cmp r0, #2
	beq _08167D10
	cmp r0, #3
	beq _08167D50
	b _08167DA4
_08167CDA:
	ldr r2, _08167CE8
	adds r0, r1, r2
	ldrb r0, [r0]
	bl sub_0816740C
	b _08167D34
	.align 2, 0
_08167CE8: .4byte 0x00007FB3
_08167CEC:
	ldr r6, _08167D08
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_081679A4
	ldr r1, [r4]
	ldr r0, _08167D0C
	adds r1, r1, r0
	b _08167D38
	.align 2, 0
_08167D08: .4byte 0x00007FB3
_08167D0C: .4byte 0x00008048
_08167D10:
	ldr r2, _08167D40
	adds r0, r1, r2
	ldr r6, _08167D44
	adds r1, r1, r6
	bl sub_081D27A8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08167DA4
	ldr r1, [r4]
	ldr r2, _08167D48
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r6, _08167D4C
	adds r1, r1, r6
	ldrb r1, [r1]
	bl sub_08167340
_08167D34:
	ldr r1, [r4]
	adds r1, r1, r5
_08167D38:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08167DA4
	.align 2, 0
_08167D40: .4byte 0x00007C58
_08167D44: .4byte 0x00007B0E
_08167D48: .4byte 0x00007B4C
_08167D4C: .4byte 0x00007FB6
_08167D50:
	ldr r2, _08167D98
	adds r0, r1, r2
	bl sub_081D2A94
	ldr r3, [r4]
	ldr r6, _08167D9C
	adds r0, r3, r6
	ldrb r1, [r0]
	ldr r2, _08167DA0
	adds r0, r3, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	beq _08167D8A
	subs r6, #0x8e
	adds r0, r3, r6
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r2, #0x90
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r6, _08167D98
	adds r0, r3, r6
	subs r6, #0xc
	adds r1, r3, r6
	ldrb r1, [r1]
	bl sub_081D2AB0
_08167D8A:
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	b _08167DA6
	.align 2, 0
_08167D98: .4byte 0x00007B1C
_08167D9C: .4byte 0x00008041
_08167DA0: .4byte 0x00008040
_08167DA4:
	movs r0, #1
_08167DA6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08167CAC

	thumb_func_start sub_08167DAC
sub_08167DAC: @ 0x08167DAC
	push {r4, r5, lr}
	ldr r4, _08167DC8
	ldr r1, [r4]
	ldr r5, _08167DCC
	adds r2, r1, r5
	ldrb r0, [r2]
	cmp r0, #1
	beq _08167DF8
	cmp r0, #1
	bgt _08167DD0
	cmp r0, #0
	beq _08167DDA
	b _08167E46
	.align 2, 0
_08167DC8: .4byte 0x0203B978
_08167DCC: .4byte 0x00008048
_08167DD0:
	cmp r0, #2
	beq _08167E1C
	cmp r0, #3
	beq _08167E40
	b _08167E46
_08167DDA:
	ldr r2, _08167DF0
	adds r0, r1, r2
	ldr r2, _08167DF4
	adds r1, r1, r2
	bl sub_081D27D4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08167E46
	b _08167E2C
	.align 2, 0
_08167DF0: .4byte 0x00007C58
_08167DF4: .4byte 0x00007B0E
_08167DF8:
	ldr r2, _08167E14
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_081679A4
	ldr r1, [r4]
	ldr r0, _08167E18
	adds r1, r1, r0
	b _08167E30
	.align 2, 0
_08167E14: .4byte 0x00007FB3
_08167E18: .4byte 0x00008048
_08167E1C:
	ldr r2, _08167E38
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r2, _08167E3C
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_08167340
_08167E2C:
	ldr r1, [r4]
	adds r1, r1, r5
_08167E30:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08167E46
	.align 2, 0
_08167E38: .4byte 0x00007B4C
_08167E3C: .4byte 0x00007FB6
_08167E40:
	movs r0, #0
	strb r0, [r2]
	b _08167E48
_08167E46:
	movs r0, #1
_08167E48:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08167DAC

	thumb_func_start sub_08167E50
sub_08167E50: @ 0x08167E50
	push {r4, r5, r6, lr}
	ldr r4, _08167E6C
	ldr r1, [r4]
	ldr r5, _08167E70
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _08167EB0
	cmp r0, #1
	bgt _08167E74
	cmp r0, #0
	beq _08167E7E
	b _08167F68
	.align 2, 0
_08167E6C: .4byte 0x0203B978
_08167E70: .4byte 0x00008048
_08167E74:
	cmp r0, #2
	beq _08167ED4
	cmp r0, #3
	beq _08167F14
	b _08167F68
_08167E7E:
	ldr r2, _08167EA4
	adds r0, r1, r2
	bl sub_081D16BC
	ldr r0, [r4]
	ldr r6, _08167EA8
	adds r0, r0, r6
	bl sub_081D2780
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08167F68
	ldr r0, [r4]
	ldr r1, _08167EAC
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0816740C
	b _08167EF8
	.align 2, 0
_08167EA4: .4byte 0x00007C58
_08167EA8: .4byte 0x00007B0E
_08167EAC: .4byte 0x00007FB3
_08167EB0:
	ldr r2, _08167ECC
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_081679A4
	ldr r1, [r4]
	ldr r6, _08167ED0
	adds r1, r1, r6
	b _08167EFC
	.align 2, 0
_08167ECC: .4byte 0x00007FB3
_08167ED0: .4byte 0x00008048
_08167ED4:
	ldr r2, _08167F04
	adds r0, r1, r2
	ldr r6, _08167F08
	adds r1, r1, r6
	bl sub_081D27A8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08167F68
	ldr r1, [r4]
	ldr r2, _08167F0C
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r6, _08167F10
	adds r1, r1, r6
	ldrb r1, [r1]
	bl sub_08167340
_08167EF8:
	ldr r1, [r4]
	adds r1, r1, r5
_08167EFC:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08167F68
	.align 2, 0
_08167F04: .4byte 0x00007C58
_08167F08: .4byte 0x00007B0E
_08167F0C: .4byte 0x00007B4C
_08167F10: .4byte 0x00007FB6
_08167F14:
	ldr r2, _08167F5C
	adds r0, r1, r2
	bl sub_081D2A94
	ldr r3, [r4]
	ldr r6, _08167F60
	adds r0, r3, r6
	ldrb r1, [r0]
	ldr r2, _08167F64
	adds r0, r3, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	beq _08167F4E
	subs r6, #0x8e
	adds r0, r3, r6
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r2, #0x90
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r6, _08167F5C
	adds r0, r3, r6
	subs r6, #0xc
	adds r1, r3, r6
	ldrb r1, [r1]
	bl sub_081D2AB0
_08167F4E:
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	b _08167F6A
	.align 2, 0
_08167F5C: .4byte 0x00007B1C
_08167F60: .4byte 0x00008041
_08167F64: .4byte 0x00008040
_08167F68:
	movs r0, #1
_08167F6A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08167E50

	thumb_func_start sub_08167F70
sub_08167F70: @ 0x08167F70
	ldr r1, _08167F80
	ldr r1, [r1]
	ldr r2, _08167F84
	adds r1, r1, r2
	ldrh r1, [r1]
	adds r1, #0x26
	strh r1, [r0, #0x20]
	bx lr
	.align 2, 0
_08167F80: .4byte 0x0203B978
_08167F84: .4byte 0x00007B0E
	thumb_func_end sub_08167F70

	thumb_func_start sub_08167F88
sub_08167F88: @ 0x08167F88
	push {lr}
	adds r2, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r2, r0]
	ldr r0, _08167FA8
	ldr r0, [r0]
	ldr r3, _08167FAC
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _08167FB0
	adds r0, r2, #0
	movs r1, #0
	bl StartSpriteAnim
	b _08167FB8
	.align 2, 0
_08167FA8: .4byte 0x0203B978
_08167FAC: .4byte 0x00008041
_08167FB0:
	adds r0, r2, #0
	movs r1, #1
	bl StartSpriteAnim
_08167FB8:
	pop {r0}
	bx r0
	thumb_func_end sub_08167F88

	thumb_func_start sub_08167FBC
sub_08167FBC: @ 0x08167FBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08167FDC
	ldr r0, [r0]
	ldr r2, _08167FE0
	adds r1, r0, r2
	ldrb r1, [r1]
	subs r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bne _08167FE4
	movs r0, #0x65
	b _08167FE6
	.align 2, 0
_08167FDC: .4byte 0x0203B978
_08167FE0: .4byte 0x00008041
_08167FE4:
	movs r0, #0x66
_08167FE6:
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #4
	ldrb r2, [r4, #5]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #5]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08167FBC

	thumb_func_start sub_08167FFC
sub_08167FFC: @ 0x08167FFC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _08168038
	adds r0, r0, r1
	movs r1, #0x30
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0816803C
	ldr r0, [r0]
	ldr r3, _08168040
	adds r1, r0, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r3, #3
	adds r0, r0, r3
	adds r4, r0, r1
	cmp r2, #0xff
	beq _08168044
	adds r0, r2, #0
	movs r1, #0x1d
	bl __udivsi3
	b _08168046
	.align 2, 0
_08168038: .4byte 0x02024190
_0816803C: .4byte 0x0203B978
_08168040: .4byte 0x00007FB3
_08168044:
	movs r0, #9
_08168046:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08167FFC

	thumb_func_start sub_08168050
sub_08168050: @ 0x08168050
	push {lr}
	sub sp, #0x10
	ldr r0, _0816808C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _08168090
	str r0, [sp]
	ldr r1, _08168094
	ldr r0, [sp, #4]
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	ldr r1, _08168098
	ands r0, r1
	adds r1, #1
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl LoadCompressedSpriteSheet
	add r0, sp, #8
	bl LoadSpritePalette
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0816808C: .4byte 0x085C0A9C
_08168090: .4byte 0x085BEBC0
_08168094: .4byte 0xFFFF0000
_08168098: .4byte 0x0000FFFF
	thumb_func_end sub_08168050

	thumb_func_start sub_0816809C
sub_0816809C: @ 0x0816809C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08168120
	ldr r0, [r0]
	ldr r1, _08168124
	adds r7, r0, r1
	ldr r0, _08168128
	mov sl, r0
	movs r6, #0
	movs r1, #0x40
	mov sb, r1
	movs r0, #0x60
	rsbs r0, r0, #0
	mov r8, r0
_081680BE:
	mov r5, sb
	muls r5, r6, r5
	mov r0, r8
	adds r1, r0, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x11
	lsls r2, r0, #0x10
	mov r0, sl
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _08168106
	ldr r0, _0816812C
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	adds r4, r4, r0
	movs r1, #8
	strh r1, [r4, #0x2e]
	movs r0, #0x20
	orrs r5, r0
	strh r5, [r4, #0x30]
	strh r6, [r4, #0x32]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	lsls r0, r6, #2
	adds r0, r0, r7
	str r4, [r0]
_08168106:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #1
	bls _081680BE
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08168120: .4byte 0x0203B978
_08168124: .4byte 0x00007B44
_08168128: .4byte 0x085C0A84
_0816812C: .4byte 0x020205AC
	thumb_func_end sub_0816809C

	thumb_func_start sub_08168130
sub_08168130: @ 0x08168130
	push {r4, r5, lr}
	ldr r4, _08168148
	ldr r0, [r4]
	ldr r5, _0816814C
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08168150
	cmp r0, #1
	beq _08168168
	b _08168174
	.align 2, 0
_08168148: .4byte 0x0203B978
_0816814C: .4byte 0x00008048
_08168150:
	bl sub_08168050
	ldr r1, [r4]
	ldr r0, _08168164
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #1
	b _08168176
	.align 2, 0
_08168164: .4byte 0x00008048
_08168168:
	bl sub_0816809C
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
_08168174:
	movs r0, #0
_08168176:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08168130

	thumb_func_start sub_0816817C
sub_0816817C: @ 0x0816817C
	push {r4, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x20]
	ldrh r1, [r2, #0x2e]
	adds r3, r0, r1
	strh r3, [r2, #0x20]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r0, #0x30
	ldrsh r1, [r2, r0]
	cmp r4, r1
	bgt _081681A0
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	bge _081681A8
	cmp r4, r1
	blt _081681B0
_081681A0:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	bgt _081681B0
_081681A8:
	ldrh r0, [r2, #0x30]
	strh r0, [r2, #0x20]
	ldr r0, _081681B8
	str r0, [r2, #0x1c]
_081681B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081681B8: .4byte 0x08007141
	thumb_func_end sub_0816817C

