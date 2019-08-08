.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetFontsPointer
SetFontsPointer: @ 0x08004474
	ldr r1, _0800447C
	str r0, [r1]
	bx lr
	.align 2, 0
_0800447C: .4byte 0x03003020
	thumb_func_end SetFontsPointer

	thumb_func_start DeactivateAllTextPrinters
DeactivateAllTextPrinters: @ 0x08004480
	push {lr}
	ldr r1, _08004498
	movs r2, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r1, r3
_0800448C:
	strb r2, [r0, #0x1b]
	subs r0, #0x20
	cmp r0, r1
	bge _0800448C
	pop {r0}
	bx r0
	.align 2, 0
_08004498: .4byte 0x020201AC
	thumb_func_end DeactivateAllTextPrinters

	thumb_func_start AddTextPrinterParameterized
AddTextPrinterParameterized: @ 0x0800449C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r7, [sp, #0x30]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r8, r5
	str r2, [sp]
	mov r2, sp
	strb r0, [r2, #4]
	mov r0, sp
	strb r1, [r0, #5]
	strb r3, [r0, #6]
	strb r4, [r0, #7]
	strb r3, [r0, #8]
	strb r4, [r0, #9]
	ldr r0, _08004544
	ldr r0, [r0]
	lsls r3, r1, #1
	adds r3, r3, r1
	lsls r3, r3, #2
	adds r3, r3, r0
	ldrb r0, [r3, #6]
	strb r0, [r2, #0xa]
	mov r1, sp
	ldrb r0, [r3, #7]
	strb r0, [r1, #0xb]
	mov r5, sp
	ldrb r1, [r3, #8]
	lsls r1, r1, #0x1c
	movs r6, #0xf
	lsrs r1, r1, #0x1c
	ldrb r4, [r5, #0xc]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r5, #0xc]
	mov r4, sp
	ldrb r1, [r3, #8]
	lsrs r1, r1, #4
	lsls r1, r1, #4
	ands r0, r6
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r1, r6, #0
	ands r1, r0
	ldrb r0, [r4, #0xd]
	ands r2, r0
	orrs r2, r1
	strb r2, [r4, #0xd]
	mov r1, sp
	ldrb r0, [r3, #9]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	ands r2, r6
	orrs r2, r0
	strb r2, [r1, #0xd]
	mov r0, sp
	mov r1, r8
	adds r2, r7, #0
	bl AddTextPrinter
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004544: .4byte 0x03003020
	thumb_func_end AddTextPrinterParameterized

	thumb_func_start AddTextPrinter
AddTextPrinter: @ 0x08004548
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	mov ip, r2
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _08004560
	ldr r0, [r0]
	cmp r0, #0
	bne _08004564
	movs r0, #0
	b _0800461E
	.align 2, 0
_08004560: .4byte 0x03003020
_08004564:
	ldr r0, _080045CC
	movs r2, #0
	movs r1, #1
	strb r1, [r0, #0x1b]
	strb r2, [r0, #0x1c]
	strb r5, [r0, #0x1d]
	strb r2, [r0, #0x1e]
	strb r2, [r0, #0x1f]
	adds r4, r0, #0
	movs r1, #6
	adds r0, #0x1a
_0800457A:
	strb r2, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _0800457A
	adds r1, r4, #0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r0, [r0]
	str r0, [r1]
	mov r0, ip
	str r0, [r4, #0x10]
	ldrb r0, [r6, #0xc]
	lsrs r0, r0, #4
	ldrb r2, [r6, #0xd]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	lsrs r2, r2, #4
	bl GenerateFontHalfRowLookupTable
	cmp r5, #0xff
	beq _080045D4
	cmp r5, #0
	beq _080045D4
	ldrb r0, [r4, #0x1d]
	subs r0, #1
	strb r0, [r4, #0x1d]
	ldr r0, _080045D0
	ldrb r1, [r6, #4]
	lsls r1, r1, #5
	adds r1, r1, r0
	adds r0, r4, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r4, r7}
	stm r1!, {r4, r7}
	b _08004616
	.align 2, 0
_080045CC: .4byte 0x0202018C
_080045D0: .4byte 0x020201AC
_080045D4:
	ldr r1, _080045E0
	movs r0, #0
	strb r0, [r1, #0x1d]
	movs r4, #0
	ldr r7, _080045E4
	b _080045EE
	.align 2, 0
_080045E0: .4byte 0x0202018C
_080045E4: .4byte 0x000003FF
_080045E8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080045EE:
	cmp r4, r7
	bhi _080045FC
	ldr r0, _08004624
	bl RenderFont
	cmp r0, #1
	bne _080045E8
_080045FC:
	cmp r5, #0xff
	beq _0800460A
	ldr r0, _08004624
	ldrb r0, [r0, #4]
	movs r1, #2
	bl CopyWindowToVram
_0800460A:
	ldr r0, _08004628
	ldrb r1, [r6, #4]
	lsls r1, r1, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1, #0x1b]
_08004616:
	ldr r1, _0800462C
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
_0800461E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004624: .4byte 0x0202018C
_08004628: .4byte 0x020201AC
_0800462C: .4byte 0x03003024
	thumb_func_end AddTextPrinter

	thumb_func_start RunTextPrinters
RunTextPrinters: @ 0x08004630
	push {r4, r5, r6, r7, lr}
	ldr r0, _08004660
	ldrb r0, [r0]
	cmp r0, #0
	bne _080046A0
	movs r6, #0
	movs r7, #0x1f
_0800463E:
	ldr r0, _08004664
	adds r5, r6, r0
	ldrb r0, [r5, #0x1b]
	cmp r0, #0
	beq _08004698
	adds r0, r5, #0
	bl RenderFont
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	beq _08004694
	cmp r4, #1
	bgt _08004668
	cmp r4, #0
	beq _0800466E
	b _08004698
	.align 2, 0
_08004660: .4byte 0x03003024
_08004664: .4byte 0x020201AC
_08004668:
	cmp r4, #3
	beq _08004676
	b _08004698
_0800466E:
	ldrb r0, [r5, #4]
	movs r1, #2
	bl CopyWindowToVram
_08004676:
	ldr r1, _08004690
	adds r0, r1, #0
	adds r0, #0x10
	adds r0, r6, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _08004698
	adds r0, r6, r1
	adds r1, r4, #0
	bl _call_via_r2
	b _08004698
	.align 2, 0
_08004690: .4byte 0x020201AC
_08004694:
	movs r0, #0
	strb r0, [r5, #0x1b]
_08004698:
	adds r6, #0x20
	subs r7, #1
	cmp r7, #0
	bge _0800463E
_080046A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RunTextPrinters

	thumb_func_start IsTextPrinterActive
IsTextPrinterActive: @ 0x080046A8
	lsls r0, r0, #0x18
	ldr r1, _080046B4
	lsrs r0, r0, #0x13
	adds r0, r0, r1
	ldrb r0, [r0, #0x1b]
	bx lr
	.align 2, 0
_080046B4: .4byte 0x020201AC
	thumb_func_end IsTextPrinterActive

	thumb_func_start RenderFont
RenderFont: @ 0x080046B8
	push {r4, lr}
	adds r4, r0, #0
_080046BC:
	ldrb r1, [r4, #5]
	ldr r0, _080046E0
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	beq _080046BC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080046E0: .4byte 0x03003020
	thumb_func_end RenderFont

	thumb_func_start GenerateFontHalfRowLookupTable
GenerateFontHalfRowLookupTable: @ 0x080046E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r1, [sp]
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _08004788
	strh r1, [r3]
	ldr r1, _0800478C
	strh r0, [r1]
	ldr r0, _08004790
	strh r2, [r0]
	movs r0, #0
	mov ip, r0
	movs r1, #0
_08004714:
	movs r2, #0
	lsls r0, r1, #2
	adds r1, #1
	mov sl, r1
	add r0, sp
	mov r8, r0
_08004720:
	movs r1, #0
	lsls r0, r2, #2
	adds r2, #1
	mov sb, r2
	add r0, sp
	str r0, [sp, #0xc]
_0800472C:
	lsls r0, r1, #2
	adds r6, r1, #1
	mov r1, sp
	adds r4, r1, r0
	mov r5, sp
	mov r7, ip
	lsls r0, r7, #1
	ldr r1, _08004794
	adds r2, r0, r1
	movs r3, #2
_08004740:
	ldm r5!, {r1}
	lsls r1, r1, #0xc
	ldr r0, [r4]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r7, [sp, #0xc]
	ldr r0, [r7]
	lsls r0, r0, #4
	orrs r1, r0
	mov r7, r8
	ldr r0, [r7]
	orrs r0, r1
	strh r0, [r2]
	adds r2, #2
	movs r0, #1
	add ip, r0
	subs r3, #1
	cmp r3, #0
	bge _08004740
	adds r1, r6, #0
	cmp r1, #2
	ble _0800472C
	mov r2, sb
	cmp r2, #2
	ble _08004720
	mov r1, sl
	cmp r1, #2
	ble _08004714
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004788: .4byte 0x030009EA
_0800478C: .4byte 0x030009EC
_08004790: .4byte 0x030009EE
_08004794: .4byte 0x03000948
	thumb_func_end GenerateFontHalfRowLookupTable

	thumb_func_start SaveTextColors
SaveTextColors: @ 0x08004798
	ldr r3, _080047AC
	ldrh r3, [r3]
	strb r3, [r1]
	ldr r1, _080047B0
	ldrh r1, [r1]
	strb r1, [r0]
	ldr r0, _080047B4
	ldrh r0, [r0]
	strb r0, [r2]
	bx lr
	.align 2, 0
_080047AC: .4byte 0x030009EA
_080047B0: .4byte 0x030009EC
_080047B4: .4byte 0x030009EE
	thumb_func_end SaveTextColors

	thumb_func_start RestoreTextColors
RestoreTextColors: @ 0x080047B8
	push {lr}
	ldrb r0, [r0]
	ldrb r1, [r1]
	ldrb r2, [r2]
	bl GenerateFontHalfRowLookupTable
	pop {r0}
	bx r0
	thumb_func_end RestoreTextColors

	thumb_func_start DecompressGlyphTile
DecompressGlyphTile: @ 0x080047C8
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r3, #0
	ldr r5, _080047E0
	ldr r4, _080047E4
_080047D2:
	lsls r0, r3, #0x1f
	cmp r0, #0
	beq _080047E8
	ldrb r0, [r2]
	adds r2, #2
	b _080047EC
	.align 2, 0
_080047E0: .4byte 0x03000948
_080047E4: .4byte 0x0829BEB8
_080047E8:
	ldrh r0, [r2]
	lsrs r0, r0, #8
_080047EC:
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	cmp r3, #0xf
	ble _080047D2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DecompressGlyphTile

	thumb_func_start GetLastTextColor
GetLastTextColor: @ 0x08004808
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _0800483C
	cmp r0, #1
	bgt _0800481E
	cmp r0, #0
	beq _08004824
	b _08004848
_0800481E:
	cmp r1, #2
	beq _08004830
	b _08004848
_08004824:
	ldr r0, _0800482C
	ldrb r0, [r0]
	b _0800484A
	.align 2, 0
_0800482C: .4byte 0x030009EC
_08004830:
	ldr r0, _08004838
	ldrb r0, [r0]
	b _0800484A
	.align 2, 0
_08004838: .4byte 0x030009EA
_0800483C:
	ldr r0, _08004844
	ldrb r0, [r0]
	b _0800484A
	.align 2, 0
_08004844: .4byte 0x030009EE
_08004848:
	movs r0, #0
_0800484A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetLastTextColor

	thumb_func_start CopyGlyphToWindow
CopyGlyphToWindow: @ 0x08004850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x6c
	adds r6, r0, #0
	ldr r0, _080048C0
	mov sb, r0
	ldrb r1, [r6, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r2, r0, r1
	ldrb r0, [r2, #3]
	lsls r0, r0, #3
	ldrb r1, [r6, #8]
	subs r1, r0, r1
	ldr r3, _080048C4
	mov r8, r3
	mov r0, r8
	adds r0, #0x80
	ldrb r7, [r0]
	cmp r1, r7
	bge _08004886
	adds r7, r1, #0
_08004886:
	ldrb r0, [r2, #4]
	lsls r0, r0, #3
	ldrb r4, [r6, #9]
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x81
	ldrb r1, [r1]
	mov sl, r1
	adds r5, r4, #0
	cmp r0, sl
	bge _0800489E
	mov sl, r0
_0800489E:
	movs r1, #0
	cmp r7, #8
	ble _080048A6
	movs r1, #1
_080048A6:
	mov r0, sl
	cmp r0, #8
	ble _080048B0
	movs r0, #2
	orrs r1, r0
_080048B0:
	cmp r1, #1
	beq _08004970
	cmp r1, #1
	bgt _080048C8
	cmp r1, #0
	beq _080048D6
	b _08004E38
	.align 2, 0
_080048C0: .4byte 0x02020004
_080048C4: .4byte 0x03003030
_080048C8:
	cmp r1, #2
	bne _080048CE
	b _08004AA4
_080048CE:
	cmp r1, #3
	bne _080048D4
	b _08004BDC
_080048D4:
	b _08004E38
_080048D6:
	adds r2, r3, #0
	movs r1, #0
	adds r0, r5, #0
	cmp r1, sl
	blt _080048E2
	b _08004E38
_080048E2:
	ldm r2!, {r3}
	str r3, [sp]
	movs r5, #0
	ldrb r4, [r6, #8]
	str r2, [sp, #0x28]
	adds r1, #1
	str r1, [sp, #0x20]
	adds r1, r0, #1
	str r1, [sp, #0x24]
	cmp r5, r7
	bge _08004960
	ldr r2, _0800496C
	mov ip, r2
	asrs r3, r0, #3
	mov sb, r3
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1b
	mov r8, r0
_08004906:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	mov r1, ip
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r3, ip
	ldrb r0, [r3, #3]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, #2
	ldr r2, [sp]
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004958
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08004958:
	adds r5, #1
	adds r4, #1
	cmp r5, r7
	blt _08004906
_08004960:
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x24]
	cmp r1, sl
	blt _080048E2
	b _08004E38
	.align 2, 0
_0800496C: .4byte 0x02020004
_08004970:
	movs r2, #0
	adds r1, r5, #0
	cmp r2, sl
	bge _080049FA
_08004978:
	ldm r3!, {r0}
	mov sb, r0
	movs r5, #0
	ldrb r4, [r6, #8]
	lsls r0, r1, #0x1d
	str r3, [sp, #0x38]
	adds r2, #1
	str r2, [sp, #0x30]
	adds r2, r1, #1
	str r2, [sp, #0x34]
	asrs r1, r1, #3
	mov ip, r1
	lsrs r0, r0, #0x1b
	mov r8, r0
_08004994:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	ldr r1, _08004A9C
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r0, _08004A9C
	adds r3, r3, r0
	ldrb r0, [r3, #3]
	mov r2, ip
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, #2
	mov r2, sb
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _080049E8
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_080049E8:
	adds r5, #1
	adds r4, #1
	cmp r5, #7
	ble _08004994
	ldr r3, [sp, #0x38]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x34]
	cmp r2, sl
	blt _08004978
_080049FA:
	ldr r3, _08004AA0
	movs r2, #0
	ldrb r1, [r6, #9]
	cmp r2, sl
	blt _08004A06
	b _08004E38
_08004A06:
	subs r7, #8
	str r7, [sp, #0x64]
	str r7, [sp, #4]
_08004A0C:
	ldm r3!, {r0}
	mov ip, r0
	movs r5, #0
	ldrb r0, [r6, #8]
	adds r4, r0, #0
	adds r4, #8
	str r3, [sp, #0x50]
	adds r2, #1
	str r2, [sp, #0x48]
	adds r2, r1, #1
	str r2, [sp, #0x4c]
	ldr r3, [sp, #4]
	cmp r5, r3
	bge _08004A90
	ldr r7, _08004A9C
	asrs r0, r1, #3
	mov sb, r0
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1b
	mov r8, r0
_08004A34:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r1, r7, #0
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r3, r3, r7
	ldrb r0, [r3, #3]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, #2
	mov r2, ip
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004A86
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08004A86:
	adds r5, #1
	adds r4, #1
	ldr r1, [sp, #0x64]
	cmp r5, r1
	blt _08004A34
_08004A90:
	ldr r3, [sp, #0x50]
	ldr r2, [sp, #0x48]
	ldr r1, [sp, #0x4c]
	cmp r2, sl
	blt _08004A0C
	b _08004E38
	.align 2, 0
_08004A9C: .4byte 0x02020004
_08004AA0: .4byte 0x03003050
_08004AA4:
	adds r1, r3, #0
	movs r2, #0
	adds r0, r5, #0
	mov r3, sl
	subs r3, #8
	str r3, [sp, #0x68]
_08004AB0:
	ldm r1!, {r3}
	mov sl, r3
	movs r5, #0
	ldrb r4, [r6, #8]
	str r1, [sp, #0x60]
	adds r2, #1
	str r2, [sp, #0x58]
	adds r1, r0, #1
	str r1, [sp, #0x5c]
	cmp r5, r7
	bge _08004B2E
	ldr r2, _08004BD4
	mov ip, r2
	asrs r3, r0, #3
	mov sb, r3
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1b
	mov r8, r0
_08004AD4:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	mov r1, ip
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r3, ip
	ldrb r0, [r3, #3]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, #2
	mov r2, sl
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004B26
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08004B26:
	adds r5, #1
	adds r4, #1
	cmp r5, r7
	blt _08004AD4
_08004B2E:
	ldr r1, [sp, #0x60]
	ldr r2, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	cmp r2, #7
	ble _08004AB0
	ldr r2, _08004BD8
	movs r1, #0
	ldrb r0, [r6, #9]
	adds r0, #8
	ldr r3, [sp, #0x68]
	cmp r1, r3
	blt _08004B48
	b _08004E38
_08004B48:
	ldm r2!, {r3}
	mov sl, r3
	movs r5, #0
	ldrb r4, [r6, #8]
	str r2, [sp, #0x1c]
	adds r1, #1
	str r1, [sp, #0x14]
	adds r1, r0, #1
	str r1, [sp, #0x18]
	cmp r5, r7
	bge _08004BC6
	ldr r2, _08004BD4
	mov ip, r2
	asrs r3, r0, #3
	mov sb, r3
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1b
	mov r8, r0
_08004B6C:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	mov r1, ip
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r3, ip
	ldrb r0, [r3, #3]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, #2
	mov r2, sl
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004BBE
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08004BBE:
	adds r5, #1
	adds r4, #1
	cmp r5, r7
	blt _08004B6C
_08004BC6:
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x68]
	cmp r1, r3
	blt _08004B48
	b _08004E38
	.align 2, 0
_08004BD4: .4byte 0x02020004
_08004BD8: .4byte 0x03003070
_08004BDC:
	mov r2, r8
	movs r3, #0
	adds r1, r4, #0
	subs r7, #8
	str r7, [sp, #0x64]
	mov r0, sl
	subs r0, #8
	str r0, [sp, #0x68]
_08004BEC:
	ldm r2!, {r0}
	mov sb, r0
	movs r5, #0
	ldrb r4, [r6, #8]
	lsls r0, r1, #0x1d
	str r2, [sp, #0x2c]
	adds r3, #1
	mov sl, r3
	adds r2, r1, #1
	mov ip, r2
	asrs r1, r1, #3
	mov r8, r1
	lsrs r7, r0, #0x1b
_08004C06:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	ldr r1, _08004D0C
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r0, _08004D0C
	adds r3, r3, r0
	ldrb r0, [r3, #3]
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r3, r1, r7
	lsls r0, r5, #2
	mov r2, sb
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004C58
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08004C58:
	adds r5, #1
	adds r4, #1
	cmp r5, #7
	ble _08004C06
	ldr r2, [sp, #0x2c]
	mov r3, sl
	mov r1, ip
	cmp r3, #7
	ble _08004BEC
	ldr r3, _08004D10
	movs r2, #0
	ldrb r1, [r6, #9]
	ldr r0, [sp, #0x64]
	mov ip, r0
_08004C74:
	ldm r3!, {r0}
	mov sl, r0
	movs r5, #0
	ldrb r0, [r6, #8]
	adds r4, r0, #0
	adds r4, #8
	str r3, [sp, #0x44]
	adds r2, #1
	str r2, [sp, #0x3c]
	adds r2, r1, #1
	str r2, [sp, #0x40]
	cmp r5, ip
	bge _08004CF4
	ldr r7, _08004D0C
	asrs r3, r1, #3
	mov sb, r3
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1b
	mov r8, r0
_08004C9A:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r1, r7, #0
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r3, r3, r7
	ldrb r0, [r3, #3]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, #2
	mov r2, sl
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004CEC
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08004CEC:
	adds r5, #1
	adds r4, #1
	cmp r5, ip
	blt _08004C9A
_08004CF4:
	ldr r3, [sp, #0x44]
	ldr r2, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	cmp r2, #7
	ble _08004C74
	ldr r3, _08004D14
	movs r2, #0
	ldrb r0, [r6, #9]
	adds r1, r0, #0
	adds r1, #8
	b _08004D92
	.align 2, 0
_08004D0C: .4byte 0x02020004
_08004D10: .4byte 0x03003050
_08004D14: .4byte 0x03003070
_08004D18:
	ldm r3!, {r0}
	mov sb, r0
	movs r5, #0
	ldrb r4, [r6, #8]
	lsls r0, r1, #0x1d
	str r3, [sp, #0x54]
	adds r2, #1
	mov sl, r2
	adds r2, r1, #1
	mov ip, r2
	asrs r1, r1, #3
	mov r8, r1
	lsrs r7, r0, #0x1b
_08004D32:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	ldr r1, _08004E48
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	ldr r0, _08004E48
	adds r3, r3, r0
	ldrb r0, [r3, #3]
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r3, r1, r7
	lsls r0, r5, #2
	mov r2, sb
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004D84
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08004D84:
	adds r5, #1
	adds r4, #1
	cmp r5, #7
	ble _08004D32
	ldr r3, [sp, #0x54]
	mov r2, sl
	mov r1, ip
_08004D92:
	ldr r0, [sp, #0x68]
	cmp r2, r0
	blt _08004D18
	ldr r3, _08004E4C
	movs r2, #0
	ldrb r0, [r6, #9]
	adds r1, r0, #0
	adds r1, #8
	ldr r0, [sp, #0x68]
	cmp r2, r0
	bge _08004E38
	ldr r0, [sp, #0x64]
	mov sl, r0
_08004DAC:
	ldm r3!, {r0}
	mov ip, r0
	movs r5, #0
	ldrb r0, [r6, #8]
	adds r4, r0, #0
	adds r4, #8
	str r3, [sp, #0x10]
	adds r2, #1
	str r2, [sp, #8]
	adds r2, r1, #1
	str r2, [sp, #0xc]
	cmp r5, sl
	bge _08004E2C
	ldr r7, _08004E48
	asrs r3, r1, #3
	mov sb, r3
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1b
	mov r8, r0
_08004DD2:
	ldrb r0, [r6, #4]
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r1, r7, #0
	adds r1, #8
	adds r1, r3, r1
	asrs r2, r4, #1
	movs r0, #3
	ands r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r3, r3, r7
	ldrb r0, [r3, #3]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #5
	adds r1, r1, r0
	mov r0, r8
	adds r3, r1, r0
	lsls r0, r5, #2
	mov r2, ip
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004E24
	movs r0, #1
	ands r0, r4
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r2, r1
	strb r2, [r3]
_08004E24:
	adds r5, #1
	adds r4, #1
	cmp r5, sl
	blt _08004DD2
_08004E2C:
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x68]
	cmp r2, r0
	blt _08004DAC
_08004E38:
	add sp, #0x6c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004E48: .4byte 0x02020004
_08004E4C: .4byte 0x03003090
	thumb_func_end CopyGlyphToWindow

	thumb_func_start ClearTextSpan
ClearTextSpan: @ 0x08004E50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	str r0, [sp]
	ldr r0, [sp, #0x60]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	subs r1, r3, r1
	ldr r5, _08004EC4
	adds r0, r5, #0
	adds r0, #0x80
	ldrb r7, [r0]
	adds r2, r5, #0
	cmp r1, r7
	bge _08004E86
	adds r7, r1, #0
_08004E86:
	ldr r1, [sp, #8]
	subs r0, r4, r1
	adds r1, r2, #0
	adds r1, #0x81
	ldrb r1, [r1]
	str r1, [sp, #0xc]
	cmp r0, r1
	bge _08004E98
	str r0, [sp, #0xc]
_08004E98:
	movs r1, #0
	movs r0, #7
	ands r0, r3
	adds r0, r3, r0
	lsrs r0, r0, #3
	str r0, [sp, #0x10]
	cmp r7, #8
	ble _08004EAA
	movs r1, #1
_08004EAA:
	ldr r3, [sp, #0xc]
	cmp r3, #8
	ble _08004EB4
	movs r0, #2
	orrs r1, r0
_08004EB4:
	cmp r1, #1
	beq _08004F54
	cmp r1, #1
	bgt _08004EC8
	cmp r1, #0
	beq _08004ED6
	b _0800533C
	.align 2, 0
_08004EC4: .4byte 0x03003030
_08004EC8:
	cmp r1, #2
	bne _08004ECE
	b _08005058
_08004ECE:
	cmp r1, #3
	bne _08004ED4
	b _08005158
_08004ED4:
	b _0800533C
_08004ED6:
	adds r1, r2, #0
	movs r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	cmp r0, r3
	blt _08004EE4
	b _0800533C
_08004EE4:
	ldm r1!, {r3}
	mov r8, r3
	movs r5, #0
	ldr r3, [sp, #4]
	str r1, [sp, #0x28]
	adds r0, #1
	mov sb, r0
	adds r0, r2, #1
	mov sl, r0
	cmp r5, r7
	bge _08004F46
	asrs r0, r2, #3
	ldr r1, [sp, #0x10]
	muls r0, r1, r0
	lsls r0, r0, #5
	mov ip, r0
	lsls r0, r2, #0x1d
	lsrs r6, r0, #0x1b
_08004F08:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r2, [sp]
	adds r1, r2, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, ip
	adds r4, r1, r6
	lsls r0, r5, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004F3E
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_08004F3E:
	adds r5, #1
	adds r3, #1
	cmp r5, r7
	blt _08004F08
_08004F46:
	ldr r1, [sp, #0x28]
	mov r0, sb
	mov r2, sl
	ldr r3, [sp, #0xc]
	cmp r0, r3
	blt _08004EE4
	b _0800533C
_08004F54:
	adds r5, r2, #0
	movs r4, #0
	ldr r2, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r4, r0
	bge _08004FCA
_08004F60:
	ldm r5!, {r1}
	mov r8, r1
	movs r6, #0
	ldr r3, [sp, #4]
	asrs r0, r2, #3
	lsls r1, r2, #0x1d
	str r5, [sp, #0x2c]
	adds r4, #1
	mov sb, r4
	adds r2, #1
	mov sl, r2
	ldr r2, [sp, #0x10]
	muls r0, r2, r0
	lsls r0, r0, #5
	mov ip, r0
	lsrs r5, r1, #0x1b
_08004F80:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, ip
	adds r4, r1, r5
	lsls r0, r6, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08004FB6
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_08004FB6:
	adds r6, #1
	adds r3, #1
	cmp r6, #7
	ble _08004F80
	ldr r5, [sp, #0x2c]
	mov r4, sb
	mov r2, sl
	ldr r1, [sp, #0xc]
	cmp r4, r1
	blt _08004F60
_08004FCA:
	ldr r1, _08005054
	movs r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	cmp r0, r3
	blt _08004FD8
	b _0800533C
_08004FD8:
	subs r7, #8
	str r7, [sp, #0x18]
	str r7, [sp, #0x14]
_08004FDE:
	ldm r1!, {r3}
	mov r8, r3
	movs r5, #0
	ldr r3, [sp, #4]
	adds r3, #8
	mov ip, r1
	adds r0, #1
	mov sb, r0
	adds r0, r2, #1
	mov sl, r0
	ldr r1, [sp, #0x14]
	cmp r5, r1
	bge _08005044
	asrs r0, r2, #3
	ldr r1, [sp, #0x10]
	muls r0, r1, r0
	lsls r7, r0, #5
	lsls r0, r2, #0x1d
	lsrs r6, r0, #0x1b
_08005004:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r2, [sp]
	adds r1, r2, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	adds r4, r1, r6
	lsls r0, r5, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _0800503A
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_0800503A:
	adds r5, #1
	adds r3, #1
	ldr r0, [sp, #0x18]
	cmp r5, r0
	blt _08005004
_08005044:
	mov r1, ip
	mov r0, sb
	mov r2, sl
	ldr r3, [sp, #0xc]
	cmp r0, r3
	blt _08004FDE
	b _0800533C
	.align 2, 0
_08005054: .4byte 0x03003050
_08005058:
	adds r0, r2, #0
	movs r1, #0
	ldr r2, [sp, #8]
	adds r3, r2, #0
	adds r3, #8
	str r3, [sp, #0x1c]
	ldr r3, [sp, #0xc]
	subs r3, #8
	str r3, [sp, #0x20]
_0800506A:
	ldm r0!, {r3}
	mov r8, r3
	movs r5, #0
	ldr r3, [sp, #4]
	str r0, [sp, #0x34]
	adds r1, #1
	mov sb, r1
	adds r0, r2, #1
	mov sl, r0
	cmp r5, r7
	bge _080050CC
	asrs r0, r2, #3
	ldr r1, [sp, #0x10]
	muls r0, r1, r0
	lsls r0, r0, #5
	mov ip, r0
	lsls r0, r2, #0x1d
	lsrs r6, r0, #0x1b
_0800508E:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r2, [sp]
	adds r1, r2, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, ip
	adds r4, r1, r6
	lsls r0, r5, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _080050C4
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_080050C4:
	adds r5, #1
	adds r3, #1
	cmp r5, r7
	blt _0800508E
_080050CC:
	ldr r0, [sp, #0x34]
	mov r1, sb
	mov r2, sl
	cmp r1, #7
	ble _0800506A
	ldr r2, _08005154
	movs r0, #0
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	cmp r0, r3
	blt _080050E4
	b _0800533C
_080050E4:
	ldm r2!, {r3}
	mov r8, r3
	movs r5, #0
	ldr r3, [sp, #4]
	str r2, [sp, #0x38]
	adds r0, #1
	mov sb, r0
	adds r0, r1, #1
	mov sl, r0
	cmp r5, r7
	bge _08005146
	asrs r0, r1, #3
	ldr r2, [sp, #0x10]
	muls r0, r2, r0
	lsls r0, r0, #5
	mov ip, r0
	lsls r0, r1, #0x1d
	lsrs r6, r0, #0x1b
_08005108:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	add r1, ip
	adds r4, r1, r6
	lsls r0, r5, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _0800513E
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_0800513E:
	adds r5, #1
	adds r3, #1
	cmp r5, r7
	blt _08005108
_08005146:
	ldr r2, [sp, #0x38]
	mov r0, sb
	mov r1, sl
	ldr r3, [sp, #0x20]
	cmp r0, r3
	blt _080050E4
	b _0800533C
	.align 2, 0
_08005154: .4byte 0x03003070
_08005158:
	movs r2, #0
	ldr r4, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #8
	str r0, [sp, #0x3c]
	subs r7, #8
	str r7, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #8
	str r1, [sp, #0x1c]
	ldr r3, [sp, #0xc]
	subs r3, #8
	str r3, [sp, #0x20]
_08005172:
	ldm r5!, {r0}
	mov r8, r0
	movs r6, #0
	ldr r3, [sp, #4]
	asrs r0, r4, #3
	lsls r1, r4, #0x1d
	mov sl, r5
	adds r2, #1
	mov ip, r2
	adds r4, #1
	mov sb, r4
	ldr r2, [sp, #0x10]
	muls r0, r2, r0
	lsls r7, r0, #5
	lsrs r5, r1, #0x1b
_08005190:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	adds r4, r1, r5
	lsls r0, r6, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _080051C6
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_080051C6:
	adds r6, #1
	adds r3, #1
	cmp r6, #7
	ble _08005190
	mov r5, sl
	mov r2, ip
	mov r4, sb
	cmp r2, #7
	ble _08005172
	ldr r1, _0800534C
	movs r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0x18]
	mov ip, r3
_080051E2:
	ldm r1!, {r3}
	mov r8, r3
	movs r5, #0
	ldr r3, [sp, #0x3c]
	str r1, [sp, #0x24]
	adds r0, #1
	mov sb, r0
	adds r0, r2, #1
	mov sl, r0
	cmp r5, ip
	bge _08005242
	asrs r0, r2, #3
	ldr r1, [sp, #0x10]
	muls r0, r1, r0
	lsls r7, r0, #5
	lsls r0, r2, #0x1d
	lsrs r6, r0, #0x1b
_08005204:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r2, [sp]
	adds r1, r2, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	adds r4, r1, r6
	lsls r0, r5, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _0800523A
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_0800523A:
	adds r5, #1
	adds r3, #1
	cmp r5, ip
	blt _08005204
_08005242:
	ldr r1, [sp, #0x24]
	mov r0, sb
	mov r2, sl
	cmp r0, #7
	ble _080051E2
	ldr r6, _08005350
	movs r4, #0
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	cmp r4, r3
	bge _080052C0
_08005258:
	ldm r6!, {r0}
	mov r8, r0
	movs r5, #0
	ldr r3, [sp, #4]
	asrs r0, r2, #3
	lsls r1, r2, #0x1d
	mov ip, r6
	adds r4, #1
	mov sb, r4
	adds r2, #1
	mov sl, r2
	ldr r2, [sp, #0x10]
	muls r0, r2, r0
	lsls r7, r0, #5
	lsrs r6, r1, #0x1b
_08005276:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	adds r4, r1, r6
	lsls r0, r5, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _080052AC
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_080052AC:
	adds r5, #1
	adds r3, #1
	cmp r5, #7
	ble _08005276
	mov r6, ip
	mov r4, sb
	mov r2, sl
	ldr r1, [sp, #0x20]
	cmp r4, r1
	blt _08005258
_080052C0:
	ldr r2, _08005354
	movs r0, #0
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	cmp r0, r3
	bge _0800533C
	ldr r3, [sp, #0x18]
	mov ip, r3
_080052D0:
	ldm r2!, {r3}
	mov r8, r3
	movs r5, #0
	ldr r3, [sp, #0x3c]
	str r2, [sp, #0x30]
	adds r0, #1
	mov sb, r0
	adds r0, r1, #1
	mov sl, r0
	cmp r5, ip
	bge _08005330
	asrs r0, r1, #3
	ldr r2, [sp, #0x10]
	muls r0, r2, r0
	lsls r7, r0, #5
	lsls r0, r1, #0x1d
	lsrs r6, r0, #0x1b
_080052F2:
	asrs r1, r3, #1
	movs r0, #3
	ands r1, r0
	ldr r0, [sp]
	adds r1, r0, r1
	asrs r0, r3, #3
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	adds r4, r1, r6
	lsls r0, r5, #2
	mov r2, r8
	lsrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08005328
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #2
	lsls r2, r0
	movs r1, #0xf0
	asrs r1, r0
	ldrb r0, [r4]
	ands r1, r0
	orrs r2, r1
	strb r2, [r4]
_08005328:
	adds r5, #1
	adds r3, #1
	cmp r5, ip
	blt _080052F2
_08005330:
	ldr r2, [sp, #0x30]
	mov r0, sb
	mov r1, sl
	ldr r3, [sp, #0x20]
	cmp r0, r3
	blt _080052D0
_0800533C:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800534C: .4byte 0x03003050
_08005350: .4byte 0x03003070
_08005354: .4byte 0x03003090
	thumb_func_end ClearTextSpan

	thumb_func_start Font0Func
Font0Func: @ 0x08005358
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x14
	ldrb r1, [r3, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800537C
	ldrb r1, [r2, #0x14]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r3, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
_0800537C:
	adds r0, r2, #0
	bl RenderText
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Font0Func

	thumb_func_start Font1Func
Font1Func: @ 0x0800538C
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x14
	ldrb r1, [r3, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080053B4
	ldrb r1, [r2, #0x14]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r3, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
_080053B4:
	adds r0, r2, #0
	bl RenderText
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Font1Func

	thumb_func_start Font2Func
Font2Func: @ 0x080053C4
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x14
	ldrb r1, [r3, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080053EC
	ldrb r1, [r2, #0x14]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r3, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
_080053EC:
	adds r0, r2, #0
	bl RenderText
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Font2Func

	thumb_func_start Font3Func
Font3Func: @ 0x080053FC
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x14
	ldrb r1, [r3, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08005424
	ldrb r1, [r2, #0x14]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r3, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
_08005424:
	adds r0, r2, #0
	bl RenderText
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Font3Func

	thumb_func_start Font4Func
Font4Func: @ 0x08005434
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x14
	ldrb r1, [r3, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800545C
	ldrb r1, [r2, #0x14]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r3, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
_0800545C:
	adds r0, r2, #0
	bl RenderText
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Font4Func

	thumb_func_start Font5Func
Font5Func: @ 0x0800546C
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x14
	ldrb r1, [r3, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08005494
	ldrb r1, [r2, #0x14]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #5
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r3, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
_08005494:
	adds r0, r2, #0
	bl RenderText
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Font5Func

	thumb_func_start TextPrinterInitDownArrowCounters
TextPrinterInitDownArrowCounters: @ 0x080054A4
	push {lr}
	adds r2, r0, #0
	adds r2, #0x14
	ldr r0, _080054BC
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080054C0
	movs r0, #0
	strb r0, [r2, #2]
	b _080054D0
	.align 2, 0
_080054BC: .4byte 0x030030B4
_080054C0:
	ldrb r0, [r2, #1]
	movs r1, #0x61
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2, #1]
_080054D0:
	pop {r0}
	bx r0
	thumb_func_end TextPrinterInitDownArrowCounters

	thumb_func_start TextPrinterDrawDownArrow
TextPrinterDrawDownArrow: @ 0x080054D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x14
	ldr r7, _08005508
	ldrb r1, [r7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800559A
	ldrb r2, [r6, #1]
	movs r0, #0x1f
	ands r0, r2
	cmp r0, #0
	beq _0800550C
	ldr r0, [r5, #0x14]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1b
	subs r0, #1
	movs r1, #0x1f
	ands r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	b _08005594
	.align 2, 0
_08005508: .4byte 0x030030B4
_0800550C:
	ldrb r0, [r5, #4]
	ldrb r2, [r5, #0xd]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	ldrb r2, [r5, #8]
	ldrb r3, [r5, #9]
	movs r4, #8
	str r4, [sp]
	movs r4, #0x10
	str r4, [sp, #4]
	bl FillWindowPixelRect
	ldr r0, [r7]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #0
	beq _08005536
	cmp r0, #1
	beq _08005540
_08005536:
	ldr r7, _0800553C
	b _08005542
	.align 2, 0
_0800553C: .4byte 0x0829BFB8
_08005540:
	ldr r7, _080055A4
_08005542:
	ldrb r0, [r5, #4]
	ldr r2, _080055A8
	ldr r1, [r6]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1e
	adds r1, r1, r2
	ldrb r3, [r1]
	movs r4, #8
	str r4, [sp]
	movs r2, #0x10
	str r2, [sp, #4]
	ldrb r1, [r5, #8]
	str r1, [sp, #8]
	ldrb r1, [r5, #9]
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r2, [sp, #0x14]
	adds r1, r7, #0
	movs r2, #0
	bl BlitBitmapRectToWindow
	ldrb r0, [r5, #4]
	movs r1, #2
	bl CopyWindowToVram
	ldrb r0, [r6, #1]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #8
	orrs r1, r0
	strb r1, [r6, #1]
	ldr r0, [r6]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1e
	adds r0, #1
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #5
	movs r2, #0x61
	rsbs r2, r2, #0
_08005594:
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #1]
_0800559A:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080055A4: .4byte 0x0829C078
_080055A8: .4byte 0x0829C638
	thumb_func_end TextPrinterDrawDownArrow

	thumb_func_start TextPrinterClearDownArrow
TextPrinterClearDownArrow: @ 0x080055AC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5, #4]
	ldrb r2, [r5, #0xd]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	ldrb r2, [r5, #8]
	ldrb r3, [r5, #9]
	movs r4, #8
	str r4, [sp]
	movs r4, #0x10
	str r4, [sp, #4]
	bl FillWindowPixelRect
	ldrb r0, [r5, #4]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TextPrinterClearDownArrow

	thumb_func_start TextPrinterWaitAutoMode
TextPrinterWaitAutoMode: @ 0x080055E0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x14
	ldrb r0, [r1, #2]
	cmp r0, #0x31
	beq _080055F4
	adds r0, #1
	strb r0, [r1, #2]
	movs r0, #0
	b _080055F6
_080055F4:
	movs r0, #1
_080055F6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TextPrinterWaitAutoMode

	thumb_func_start TextPrinterWaitWithDownArrow
TextPrinterWaitWithDownArrow: @ 0x080055FC
	push {r4, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _0800561C
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08005620
	adds r0, r2, #0
	bl TextPrinterWaitAutoMode
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _0800563A
	.align 2, 0
_0800561C: .4byte 0x030030B4
_08005620:
	adds r0, r2, #0
	bl TextPrinterDrawDownArrow
	ldr r0, _08005644
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0800563A
	movs r4, #1
	movs r0, #5
	bl PlaySE
_0800563A:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005644: .4byte 0x03002360
	thumb_func_end TextPrinterWaitWithDownArrow

	thumb_func_start TextPrinterWait
TextPrinterWait: @ 0x08005648
	push {r4, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _08005668
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800566C
	adds r0, r2, #0
	bl TextPrinterWaitAutoMode
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _08005680
	.align 2, 0
_08005668: .4byte 0x030030B4
_0800566C:
	ldr r0, _08005688
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08005680
	movs r4, #1
	movs r0, #5
	bl PlaySE
_08005680:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005688: .4byte 0x03002360
	thumb_func_end TextPrinterWait

	thumb_func_start DrawDownArrow
DrawDownArrow: @ 0x0800568C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	ldr r5, [sp, #0x3c]
	mov sb, r5
	ldr r5, [sp, #0x40]
	mov sl, r5
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	beq _080056C6
	subs r0, #1
	strb r0, [r1]
	b _08005746
_080056C6:
	lsls r1, r3, #4
	orrs r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #8
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl FillWindowPixelRect
	cmp r4, #0
	bne _08005746
	ldr r0, _080056F8
	ldr r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #0
	beq _080056F4
	cmp r0, #1
	beq _08005700
_080056F4:
	ldr r6, _080056FC
	b _08005702
	.align 2, 0
_080056F8: .4byte 0x030030B4
_080056FC: .4byte 0x0829BFB8
_08005700:
	ldr r6, _08005758
_08005702:
	ldr r2, _0800575C
	mov r0, sl
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r3, [r0]
	movs r4, #8
	str r4, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	subs r0, r7, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl BlitBitmapRectToWindow
	adds r0, r5, #0
	movs r1, #2
	bl CopyWindowToVram
	mov r1, sb
	strb r4, [r1]
	mov r5, sl
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_08005746:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005758: .4byte 0x0829C078
_0800575C: .4byte 0x0829C638
	thumb_func_end DrawDownArrow

	thumb_func_start RenderText
RenderText: @ 0x08005760
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x14
	ldrb r0, [r6, #0x1c]
	cmp r0, #6
	bls _08005770
	b _08005C40
_08005770:
	lsls r0, r0, #2
	ldr r1, _0800577C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800577C: .4byte 0x08005780
_08005780: @ jump table
	.4byte _0800579C @ case 0
	.4byte _08005B50 @ case 1
	.4byte _08005B62 @ case 2
	.4byte _08005B8C @ case 3
	.4byte _08005BC4 @ case 4
	.4byte _08005C1C @ case 5
	.4byte _08005C2E @ case 6
_0800579C:
	ldr r2, _080057F0
	ldrh r1, [r2, #0x2c]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080057B6
	ldrb r1, [r4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080057B6
	movs r0, #0
	strb r0, [r6, #0x1e]
_080057B6:
	ldrb r1, [r6, #0x1e]
	cmp r1, #0
	beq _080057F8
	ldrb r0, [r6, #0x1d]
	cmp r0, #0
	beq _080057F8
	subs r0, r1, #1
	strb r0, [r6, #0x1e]
	ldr r0, _080057F4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080057D4
	b _08005A96
_080057D4:
	ldrh r1, [r2, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080057E0
	b _08005A96
_080057E0:
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0
	strb r0, [r6, #0x1e]
	b _08005A96
	.align 2, 0
_080057F0: .4byte 0x03002360
_080057F4: .4byte 0x030030B4
_080057F8:
	ldr r0, _08005818
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08005820
	ldr r0, _0800581C
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08005820
	movs r0, #3
	b _08005822
	.align 2, 0
_08005818: .4byte 0x02022C90
_0800581C: .4byte 0x030030B4
_08005820:
	ldrb r0, [r6, #0x1d]
_08005822:
	strb r0, [r6, #0x1e]
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, #1
	str r0, [r6]
	adds r0, r3, #0
	subs r0, #0xf8
	cmp r0, #7
	bls _08005836
	b _08005AD4
_08005836:
	lsls r0, r0, #2
	ldr r1, _08005840
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005840: .4byte 0x08005844
_08005844: @ jump table
	.4byte _08005AAC @ case 0
	.4byte _08005A9A @ case 1
	.4byte _08005A8C @ case 2
	.4byte _08005A88 @ case 3
	.4byte _08005888 @ case 4
	.4byte _08005A80 @ case 5
	.4byte _08005864 @ case 6
	.4byte _08005C40 @ case 7
_08005864:
	ldrb r0, [r6, #6]
	strb r0, [r6, #8]
	ldrb r1, [r6, #5]
	ldr r0, _08005884
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r6, #0xb]
	ldrb r0, [r0, #5]
	adds r1, r1, r0
	ldrb r0, [r6, #9]
	adds r0, r0, r1
	b _08005A62
	.align 2, 0
_08005884: .4byte 0x03003020
_08005888:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, #1
	str r0, [r6]
	subs r0, r3, #1
	cmp r0, #0x17
	bls _08005898
	b _08005AD4
_08005898:
	lsls r0, r0, #2
	ldr r1, _080058A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080058A4: .4byte 0x080058A8
_080058A8: @ jump table
	.4byte _08005908 @ case 0
	.4byte _0800592A @ case 1
	.4byte _0800594E @ case 2
	.4byte _08005968 @ case 3
	.4byte _08005A80 @ case 4
	.4byte _080059B6 @ case 5
	.4byte _080059B2 @ case 6
	.4byte _080059CC @ case 7
	.4byte _080059DC @ case 8
	.4byte _080059F8 @ case 9
	.4byte _080059FC @ case 10
	.4byte _08005A9A @ case 11
	.4byte _08005A30 @ case 12
	.4byte _08005A3C @ case 13
	.4byte _08005A4C @ case 14
	.4byte _08005A16 @ case 15
	.4byte _08005A80 @ case 16
	.4byte _08005A80 @ case 17
	.4byte _08005A80 @ case 18
	.4byte _08005A80 @ case 19
	.4byte _080059B2 @ case 20
	.4byte _080059B2 @ case 21
	.4byte _08005A66 @ case 22
	.4byte _08005A74 @ case 23
_08005908:
	ldr r2, [r6]
	ldrb r1, [r2]
	lsls r1, r1, #4
	ldrb r3, [r6, #0xc]
	movs r0, #0xf
	ands r0, r3
	orrs r0, r1
	strb r0, [r6, #0xc]
	adds r2, #1
	str r2, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	ldrb r2, [r6, #0xd]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	lsrs r2, r2, #4
	b _080059AE
_0800592A:
	ldr r1, [r6]
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	ldrb r3, [r6, #0xd]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r3
	orrs r2, r0
	strb r2, [r6, #0xd]
	adds r1, #1
	str r1, [r6]
	ldrb r0, [r6, #0xc]
	lsrs r0, r0, #4
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	lsrs r2, r2, #4
	b _080059AE
_0800594E:
	ldr r1, [r6]
	ldrb r0, [r1]
	lsls r0, r0, #4
	ldrb r3, [r6, #0xd]
	movs r2, #0xf
	ands r2, r3
	orrs r2, r0
	strb r2, [r6, #0xd]
	adds r1, #1
	str r1, [r6]
	ldrb r0, [r6, #0xc]
	lsrs r0, r0, #4
	b _080059A6
_08005968:
	ldr r3, [r6]
	ldrb r1, [r3]
	lsls r1, r1, #4
	ldrb r4, [r6, #0xc]
	movs r2, #0xf
	adds r0, r2, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6, #0xc]
	adds r5, r3, #1
	str r5, [r6]
	ldrb r3, [r3, #1]
	adds r1, r2, #0
	ands r1, r3
	ldrb r4, [r6, #0xd]
	movs r3, #0x10
	rsbs r3, r3, #0
	ands r3, r4
	orrs r3, r1
	strb r3, [r6, #0xd]
	adds r4, r5, #1
	str r4, [r6]
	ldrb r1, [r5, #1]
	lsls r1, r1, #4
	ands r2, r3
	orrs r2, r1
	strb r2, [r6, #0xd]
	adds r4, #1
	str r4, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
_080059A6:
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
_080059AE:
	bl GenerateFontHalfRowLookupTable
_080059B2:
	movs r0, #2
	b _08005C42
_080059B6:
	ldr r0, [r6]
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	ldrb r2, [r4]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	b _08005A80
_080059CC:
	ldr r0, [r6]
	ldrb r1, [r0]
	strb r1, [r6, #0x1e]
	adds r0, #1
	str r0, [r6]
	movs r0, #6
	strb r0, [r6, #0x1c]
	b _080059B2
_080059DC:
	movs r0, #1
	strb r0, [r6, #0x1c]
	ldr r0, _080059F4
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08005A96
	movs r0, #0
	strb r0, [r4, #2]
	b _08005A96
	.align 2, 0
_080059F4: .4byte 0x030030B4
_080059F8:
	movs r0, #5
	b _08005C2A
_080059FC:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r1, r0, #1
	str r1, [r6]
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	orrs r3, r0
	adds r1, #1
	str r1, [r6]
	adds r0, r3, #0
	bl PlayBGM
	b _080059B2
_08005A16:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r1, r0, #1
	str r1, [r6]
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	orrs r3, r0
	adds r1, #1
	str r1, [r6]
	adds r0, r3, #0
	bl PlaySE
	b _080059B2
_08005A30:
	ldr r1, [r6]
	ldrb r0, [r1]
	ldrb r2, [r6, #6]
	adds r0, r0, r2
	strb r0, [r6, #8]
	b _08005A46
_08005A3C:
	ldr r1, [r6]
	ldrb r0, [r1]
	ldrb r2, [r6, #7]
	adds r0, r0, r2
	strb r0, [r6, #9]
_08005A46:
	adds r1, #1
	str r1, [r6]
	b _080059B2
_08005A4C:
	ldrb r0, [r6, #4]
	ldrb r2, [r6, #0xd]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldrb r0, [r6, #6]
	strb r0, [r6, #8]
	ldrb r0, [r6, #7]
_08005A62:
	strb r0, [r6, #9]
	b _080059B2
_08005A66:
	ldr r0, _08005A70
	bl m4aMPlayStop
	b _080059B2
	.align 2, 0
_08005A70: .4byte 0x030074D0
_08005A74:
	ldr r0, _08005A7C
	bl m4aMPlayContinue
	b _080059B2
	.align 2, 0
_08005A7C: .4byte 0x030074D0
_08005A80:
	ldr r0, [r6]
	adds r0, #1
	str r0, [r6]
	b _080059B2
_08005A88:
	movs r0, #2
	b _08005A8E
_08005A8C:
	movs r0, #3
_08005A8E:
	strb r0, [r6, #0x1c]
	adds r0, r6, #0
	bl TextPrinterInitDownArrowCounters
_08005A96:
	movs r0, #3
	b _08005C42
_08005A9A:
	ldr r0, [r6]
	ldrb r3, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r3, r1
	adds r0, #1
	str r0, [r6]
	b _08005AD4
_08005AAC:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, #1
	str r0, [r6]
	ldrb r0, [r6, #4]
	adds r1, r3, #0
	ldrb r2, [r6, #8]
	ldrb r3, [r6, #9]
	bl DrawKeypadIcon
	ldr r1, _08005AD0
	adds r1, #0x80
	strb r0, [r1]
	ldrb r1, [r6, #0xa]
	adds r0, r0, r1
	ldrb r2, [r6, #8]
	adds r0, r0, r2
	b _08005B46
	.align 2, 0
_08005AD0: .4byte 0x03003030
_08005AD4:
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #5
	bhi _08005B32
	lsls r0, r0, #2
	ldr r1, _08005AE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005AE8: .4byte 0x08005AEC
_08005AEC: @ jump table
	.4byte _08005B04 @ case 0
	.4byte _08005B0C @ case 1
	.4byte _08005B14 @ case 2
	.4byte _08005B1C @ case 3
	.4byte _08005B24 @ case 4
	.4byte _08005B2C @ case 5
_08005B04:
	adds r0, r3, #0
	bl DecompressGlyphFont9
	b _08005B32
_08005B0C:
	adds r0, r3, #0
	bl sub_08006304
	b _08005B32
_08005B14:
	adds r0, r3, #0
	bl sub_08006354
	b _08005B32
_08005B1C:
	adds r0, r3, #0
	bl sub_08006418
	b _08005B32
_08005B24:
	adds r0, r3, #0
	bl sub_080064B8
	b _08005B32
_08005B2C:
	adds r0, r3, #0
	bl sub_0800657C
_08005B32:
	adds r0, r6, #0
	bl CopyGlyphToWindow
	ldr r0, _08005B4C
	adds r0, #0x80
	ldrb r1, [r6, #0xa]
	ldrb r0, [r0]
	adds r1, r1, r0
	ldrb r0, [r6, #8]
	adds r0, r0, r1
_08005B46:
	strb r0, [r6, #8]
	movs r0, #0
	b _08005C42
	.align 2, 0
_08005B4C: .4byte 0x03003030
_08005B50:
	adds r0, r6, #0
	bl TextPrinterWait
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08005A96
	movs r0, #0
	strb r0, [r6, #0x1c]
	b _08005A96
_08005B62:
	adds r0, r6, #0
	bl TextPrinterWaitWithDownArrow
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08005A96
	ldrb r0, [r6, #4]
	ldrb r2, [r6, #0xd]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldrb r0, [r6, #6]
	movs r1, #0
	strb r0, [r6, #8]
	ldrb r0, [r6, #7]
	strb r0, [r6, #9]
	strb r1, [r6, #0x1c]
	b _08005A96
_08005B8C:
	adds r0, r6, #0
	bl TextPrinterWaitWithDownArrow
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08005B9A
	b _08005A96
_08005B9A:
	adds r0, r6, #0
	bl TextPrinterClearDownArrow
	ldrb r1, [r6, #5]
	ldr r0, _08005BC0
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r6, #0xb]
	ldrb r0, [r0, #5]
	adds r1, r1, r0
	strb r1, [r6, #0x1f]
	ldrb r0, [r6, #6]
	strb r0, [r6, #8]
	movs r0, #4
	strb r0, [r6, #0x1c]
	b _08005A96
	.align 2, 0
_08005BC0: .4byte 0x03003020
_08005BC4:
	ldrb r0, [r6, #0x1f]
	cmp r0, #0
	beq _08005C18
	bl GetPlayerTextSpeed
	ldr r1, _08005BF0
	adds r0, r0, r1
	ldrb r4, [r0]
	ldrb r2, [r6, #0x1f]
	cmp r2, r4
	bge _08005BF4
	ldrb r0, [r6, #4]
	ldrb r1, [r6, #0xd]
	lsls r1, r1, #0x1c
	lsrs r3, r1, #4
	orrs r3, r1
	lsrs r3, r3, #0x18
	movs r1, #0
	bl ScrollWindow
	movs r0, #0
	b _08005C0C
	.align 2, 0
_08005BF0: .4byte 0x0829C63C
_08005BF4:
	ldrb r0, [r6, #4]
	ldrb r1, [r6, #0xd]
	lsls r1, r1, #0x1c
	lsrs r3, r1, #4
	orrs r3, r1
	lsrs r3, r3, #0x18
	movs r1, #0
	adds r2, r4, #0
	bl ScrollWindow
	ldrb r0, [r6, #0x1f]
	subs r0, r0, r4
_08005C0C:
	strb r0, [r6, #0x1f]
	ldrb r0, [r6, #4]
	movs r1, #2
	bl CopyWindowToVram
	b _08005A96
_08005C18:
	strb r0, [r6, #0x1c]
	b _08005A96
_08005C1C:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08005C2A
	b _08005A96
_08005C2A:
	strb r0, [r6, #0x1c]
	b _08005A96
_08005C2E:
	ldrb r0, [r6, #0x1e]
	adds r1, r0, #0
	cmp r1, #0
	beq _08005C3C
	subs r0, #1
	strb r0, [r6, #0x1e]
	b _08005A96
_08005C3C:
	strb r1, [r6, #0x1c]
	b _08005A96
_08005C40:
	movs r0, #1
_08005C42:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end RenderText

	thumb_func_start GetStringWidthFixedWidthFont
GetStringWidthFixedWidthFont: @ 0x08005C48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r2, #0
	mov r1, sp
	adds r1, #7
_08005C60:
	strb r2, [r1]
	subs r1, #1
	cmp r1, sp
	bge _08005C60
	movs r5, #0
	movs r6, #0
	adds r4, r0, #0
	movs r2, #0
_08005C70:
	adds r0, r4, r2
	ldrb r3, [r0]
	adds r2, #1
	adds r0, r3, #0
	subs r0, #0xf7
	cmp r0, #8
	bhi _08005D3E
	lsls r0, r0, #2
	ldr r1, _08005C88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005C88: .4byte 0x08005C8C
_08005C8C: @ jump table
	.4byte _08005D38 @ case 0
	.4byte _08005D3C @ case 1
	.4byte _08005D3C @ case 2
	.4byte _08005D44 @ case 3
	.4byte _08005D44 @ case 4
	.4byte _08005CC0 @ case 5
	.4byte _08005D38 @ case 6
	.4byte _08005CB0 @ case 7
	.4byte _08005CB0 @ case 8
_08005CB0:
	mov r1, sp
	adds r0, r1, r6
	strb r5, [r0]
	movs r5, #0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _08005D44
_08005CC0:
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r2, #1
	subs r0, #1
	cmp r0, #0x15
	bhi _08005D44
	lsls r0, r0, #2
	ldr r1, _08005CD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005CD8: .4byte 0x08005CDC
_08005CDC: @ jump table
	.4byte _08005D38 @ case 0
	.4byte _08005D38 @ case 1
	.4byte _08005D38 @ case 2
	.4byte _08005D34 @ case 3
	.4byte _08005D38 @ case 4
	.4byte _08005D38 @ case 5
	.4byte _08005D44 @ case 6
	.4byte _08005D38 @ case 7
	.4byte _08005D44 @ case 8
	.4byte _08005D44 @ case 9
	.4byte _08005D36 @ case 10
	.4byte _08005D38 @ case 11
	.4byte _08005D38 @ case 12
	.4byte _08005D38 @ case 13
	.4byte _08005D44 @ case 14
	.4byte _08005D36 @ case 15
	.4byte _08005D38 @ case 16
	.4byte _08005D38 @ case 17
	.4byte _08005D38 @ case 18
	.4byte _08005D38 @ case 19
	.4byte _08005D44 @ case 20
	.4byte _08005D44 @ case 21
_08005D34:
	adds r2, #1
_08005D36:
	adds r2, #1
_08005D38:
	adds r2, #1
	b _08005D44
_08005D3C:
	adds r2, #1
_08005D3E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08005D44:
	cmp r3, #0xff
	bne _08005C70
	movs r5, #0
	movs r2, #0
_08005D4C:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	cmp r5, r1
	bhs _08005D58
	ldrb r5, [r0]
_08005D58:
	adds r2, #1
	cmp r2, #7
	ble _08005D4C
	adds r0, r7, #0
	movs r1, #0
	bl GetFontAttribute
	add r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r5, r0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetStringWidthFixedWidthFont

	thumb_func_start GetFontWidthFunc
GetFontWidthFunc: @ 0x08005D7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r0, _08005D94
	adds r2, r0, #4
	adds r1, r0, #0
_08005D8A:
	ldr r0, [r1]
	cmp r4, r0
	bne _08005D98
	ldr r0, [r2]
	b _08005DA4
	.align 2, 0
_08005D94: .4byte 0x0829C640
_08005D98:
	adds r2, #8
	adds r1, #8
	adds r3, #1
	cmp r3, #5
	bls _08005D8A
	movs r0, #0
_08005DA4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetFontWidthFunc

	thumb_func_start GetStringWidth
GetStringWidth: @ 0x08005DAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r0, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	bl GetFontWidthFunc
	adds r6, r0, #0
	cmp r6, #0
	bne _08005DD0
_08005DCC:
	movs r0, #0
	b _08005F6C
_08005DD0:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	mov sl, r0
	cmp r2, r1
	bne _08005DEC
	adds r0, r7, #0
	movs r1, #2
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08005DEE
_08005DEC:
	adds r7, r2, #0
_08005DEE:
	movs r0, #0
	mov sb, r0
	mov r8, r0
	movs r5, #0
	b _08005F5A
_08005DF8:
	ldrb r1, [r4]
	adds r0, r1, #0
	subs r0, #0xf7
	cmp r0, #7
	bls _08005E04
	b _08005F4E
_08005E04:
	lsls r0, r0, #2
	ldr r1, _08005E10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005E10: .4byte 0x08005E14
_08005E14: @ jump table
	.4byte _08005E6E @ case 0
	.4byte _08005F40 @ case 1
	.4byte _08005F40 @ case 2
	.4byte _08005F58 @ case 3
	.4byte _08005F58 @ case 4
	.4byte _08005E9A @ case 5
	.4byte _08005E42 @ case 6
	.4byte _08005E34 @ case 7
_08005E34:
	cmp r8, sb
	bhi _08005E3A
	b _08005F58
_08005E3A:
	mov sb, r8
	movs r2, #0
	mov r8, r2
	b _08005F58
_08005E42:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #3
	beq _08005E64
	cmp r0, #3
	bgt _08005E54
	cmp r0, #2
	beq _08005E5A
	b _08005DCC
_08005E54:
	cmp r0, #4
	beq _08005E6C
	b _08005DCC
_08005E5A:
	ldr r5, _08005E60
	b _08005E6E
	.align 2, 0
_08005E60: .4byte 0x02021C40
_08005E64:
	ldr r5, _08005E68
	b _08005E6E
	.align 2, 0
_08005E68: .4byte 0x02021C54
_08005E6C:
	ldr r5, _08005E80
_08005E6E:
	cmp r5, #0
	bne _08005E90
	adds r4, #1
	ldrb r0, [r4]
	bl DynamicPlaceholderTextUtil_GetPlaceholderPtr
	adds r5, r0, #0
	b _08005E90
	.align 2, 0
_08005E80: .4byte 0x02021C68
_08005E84:
	ldrb r0, [r5]
	bl _call_via_r6
	adds r0, r0, r7
	add r8, r0
	adds r5, #1
_08005E90:
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _08005E84
	movs r5, #0
	b _08005F58
_08005E9A:
	adds r4, #1
	ldrb r0, [r4]
	subs r0, #1
	cmp r0, #0x15
	bhi _08005F58
	lsls r0, r0, #2
	ldr r1, _08005EB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005EB0: .4byte 0x08005EB4
_08005EB4: @ jump table
	.4byte _08005F3C @ case 0
	.4byte _08005F3C @ case 1
	.4byte _08005F3C @ case 2
	.4byte _08005F0C @ case 3
	.4byte _08005F3C @ case 4
	.4byte _08005F12 @ case 5
	.4byte _08005F58 @ case 6
	.4byte _08005F3C @ case 7
	.4byte _08005F58 @ case 8
	.4byte _08005F58 @ case 9
	.4byte _08005F0E @ case 10
	.4byte _08005F3C @ case 11
	.4byte _08005F3C @ case 12
	.4byte _08005F3C @ case 13
	.4byte _08005F58 @ case 14
	.4byte _08005F0E @ case 15
	.4byte _08005F3C @ case 16
	.4byte _08005F3C @ case 17
	.4byte _08005F3C @ case 18
	.4byte _08005F3C @ case 19
	.4byte _08005F58 @ case 20
	.4byte _08005F58 @ case 21
_08005F0C:
	adds r4, #1
_08005F0E:
	adds r4, #1
	b _08005F3C
_08005F12:
	adds r4, #1
	ldrb r0, [r4]
	bl GetFontWidthFunc
	adds r6, r0, #0
	cmp r6, #0
	bne _08005F22
	b _08005DCC
_08005F22:
	mov r0, sl
	asrs r1, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08005F58
	ldrb r0, [r4]
	movs r1, #2
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08005F58
_08005F3C:
	adds r4, #1
	b _08005F58
_08005F40:
	adds r4, #1
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	b _08005F50
_08005F4E:
	adds r0, r1, #0
_08005F50:
	bl _call_via_r6
	adds r0, r0, r7
	add r8, r0
_08005F58:
	adds r4, #1
_08005F5A:
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08005F62
	b _08005DF8
_08005F62:
	cmp r8, sb
	bhi _08005F6A
	mov r0, sb
	b _08005F6C
_08005F6A:
	mov r0, r8
_08005F6C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetStringWidth

	thumb_func_start RenderTextFont9
RenderTextFont9: @ 0x08005F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	adds r6, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	mov r4, sp
	adds r4, #1
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	bl SaveTextColors
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #3
	mov sl, r0
	movs r0, #1
	movs r1, #0
	movs r2, #3
	bl GenerateFontHalfRowLookupTable
	adds r7, r6, #0
	movs r6, #0
_08005FBE:
	adds r0, r7, r6
	ldrb r0, [r0]
	mov r8, r0
	adds r6, #1
	subs r0, #0xf7
	cmp r0, #8
	bhi _080060BA
	lsls r0, r0, #2
	ldr r1, _08005FD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005FD8: .4byte 0x08005FDC
_08005FDC: @ jump table
	.4byte _080060B2 @ case 0
	.4byte _080060B2 @ case 1
	.4byte _080060B2 @ case 2
	.4byte _080060F2 @ case 3
	.4byte _080060F2 @ case 4
	.4byte _08006000 @ case 5
	.4byte _080060B2 @ case 6
	.4byte _080060F2 @ case 7
	.4byte _080060F2 @ case 8
_08006000:
	adds r0, r7, r6
	ldrb r0, [r0]
	adds r6, #1
	subs r0, #1
	cmp r0, #0x15
	bhi _080060F2
	lsls r0, r0, #2
	ldr r1, _08006018
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006018: .4byte 0x0800601C
_0800601C: @ jump table
	.4byte _08006086 @ case 0
	.4byte _08006090 @ case 1
	.4byte _08006098 @ case 2
	.4byte _08006074 @ case 3
	.4byte _080060B2 @ case 4
	.4byte _080060AC @ case 5
	.4byte _080060F2 @ case 6
	.4byte _080060B2 @ case 7
	.4byte _080060F2 @ case 8
	.4byte _080060F2 @ case 9
	.4byte _080060B6 @ case 10
	.4byte _080060B2 @ case 11
	.4byte _080060B2 @ case 12
	.4byte _080060B2 @ case 13
	.4byte _080060F2 @ case 14
	.4byte _080060B6 @ case 15
	.4byte _080060B2 @ case 16
	.4byte _080060B2 @ case 17
	.4byte _080060B2 @ case 18
	.4byte _080060B2 @ case 19
	.4byte _080060F2 @ case 20
	.4byte _080060F2 @ case 21
_08006074:
	adds r0, r7, r6
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r6, #1
	adds r0, r7, r6
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	adds r6, #1
	b _08006098
_08006086:
	adds r0, r7, r6
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r6, #1
	b _080060A2
_08006090:
	adds r0, r7, r6
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	b _0800609E
_08006098:
	adds r0, r7, r6
	ldrb r0, [r0]
	mov sl, r0
_0800609E:
	adds r6, #1
	ldr r0, [sp, #8]
_080060A2:
	ldr r1, [sp, #0xc]
	mov r2, sl
	bl GenerateFontHalfRowLookupTable
	b _080060F2
_080060AC:
	adds r0, r7, r6
	ldrb r0, [r0]
	str r0, [sp, #4]
_080060B2:
	adds r6, #1
	b _080060F2
_080060B6:
	adds r6, #1
	b _080060B2
_080060BA:
	ldr r0, [sp, #4]
	cmp r0, #1
	beq _080060CC
	cmp r0, #7
	bne _080060CC
	mov r0, r8
	bl sub_08006640
	b _080060D2
_080060CC:
	mov r0, r8
	bl sub_08006304
_080060D2:
	ldr r4, _0800611C
	ldr r5, _08006120
	adds r0, r4, #0
	mov r1, sb
	adds r2, r5, #0
	bl CpuSet
	adds r4, #0x40
	mov r1, sb
	adds r1, #0x20
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuSet
	movs r0, #0x40
	add sb, r0
_080060F2:
	mov r0, r8
	cmp r0, #0xff
	beq _080060FA
	b _08005FBE
_080060FA:
	mov r0, sp
	mov r1, sp
	adds r1, #1
	mov r2, sp
	adds r2, #2
	bl RestoreTextColors
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800611C: .4byte 0x03003030
_08006120: .4byte 0x04000008
	thumb_func_end RenderTextFont9

	thumb_func_start DrawKeypadIcon
DrawKeypadIcon: @ 0x08006124
	push {r4, r5, lr}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r4, _0800616C
	lsrs r1, r1, #0x16
	adds r1, r1, r4
	ldrh r5, [r1]
	lsls r5, r5, #5
	ldr r4, _08006170
	adds r5, r5, r4
	movs r4, #0x80
	str r4, [sp]
	str r4, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldrb r4, [r1, #2]
	str r4, [sp, #0x10]
	ldrb r1, [r1, #3]
	str r1, [sp, #0x14]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl BlitBitmapRectToWindow
	adds r0, r4, #0
	add sp, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800616C: .4byte 0x0829C670
_08006170: .4byte 0x0829C6A4
	thumb_func_end DrawKeypadIcon

	thumb_func_start GetKeypadIconTileOffset
GetKeypadIconTileOffset: @ 0x08006174
	lsls r0, r0, #0x18
	ldr r1, _08006180
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08006180: .4byte 0x0829C670
	thumb_func_end GetKeypadIconTileOffset

	thumb_func_start GetKeypadIconWidth
GetKeypadIconWidth: @ 0x08006184
	lsls r0, r0, #0x18
	ldr r1, _08006190
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_08006190: .4byte 0x0829C670
	thumb_func_end GetKeypadIconWidth

	thumb_func_start GetKeypadIconHeight
GetKeypadIconHeight: @ 0x08006194
	lsls r0, r0, #0x18
	ldr r1, _080061A0
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_080061A0: .4byte 0x0829C670
	thumb_func_end GetKeypadIconHeight

	thumb_func_start SetDefaultFontsPointer
SetDefaultFontsPointer: @ 0x080061A4
	push {lr}
	ldr r0, _080061B0
	bl SetFontsPointer
	pop {r0}
	bx r0
	.align 2, 0
_080061B0: .4byte 0x0829CEA4
	thumb_func_end SetDefaultFontsPointer

	thumb_func_start GetFontAttribute
GetFontAttribute: @ 0x080061B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	cmp r1, #7
	bhi _08006292
	lsls r0, r1, #2
	ldr r1, _080061D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080061D0: .4byte 0x080061D4
_080061D4: @ jump table
	.4byte _080061F4 @ case 0
	.4byte _08006208 @ case 1
	.4byte _0800621C @ case 2
	.4byte _08006230 @ case 3
	.4byte _08006244 @ case 4
	.4byte _08006258 @ case 5
	.4byte _0800626C @ case 6
	.4byte _08006284 @ case 7
_080061F4:
	ldr r1, _08006204
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	b _08006292
	.align 2, 0
_08006204: .4byte 0x0829CEA4
_08006208:
	ldr r1, _08006218
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	b _08006292
	.align 2, 0
_08006218: .4byte 0x0829CEA4
_0800621C:
	ldr r1, _0800622C
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #6]
	b _08006292
	.align 2, 0
_0800622C: .4byte 0x0829CEA4
_08006230:
	ldr r1, _08006240
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	b _08006292
	.align 2, 0
_08006240: .4byte 0x0829CEA4
_08006244:
	ldr r0, _08006254
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #8]
	b _08006278
	.align 2, 0
_08006254: .4byte 0x0829CEA4
_08006258:
	ldr r0, _08006268
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #8]
	b _08006290
	.align 2, 0
_08006268: .4byte 0x0829CEA4
_0800626C:
	ldr r0, _08006280
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #9]
_08006278:
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	b _08006292
	.align 2, 0
_08006280: .4byte 0x0829CEA4
_08006284:
	ldr r0, _08006298
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #9]
_08006290:
	lsrs r0, r0, #4
_08006292:
	pop {r1}
	bx r1
	.align 2, 0
_08006298: .4byte 0x0829CEA4
	thumb_func_end GetFontAttribute

	thumb_func_start GetMenuCursorDimensionByFont
GetMenuCursorDimensionByFont: @ 0x0800629C
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080062B0
	lsrs r0, r0, #0x17
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080062B0: .4byte 0x0829CF04
	thumb_func_end GetMenuCursorDimensionByFont

	thumb_func_start DecompressGlyphFont9
DecompressGlyphFont9: @ 0x080062B4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x14
	lsls r4, r4, #9
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	lsrs r1, r1, #0xc
	ldr r0, _080062F8
	adds r1, r1, r0
	adds r4, r4, r1
	ldr r5, _080062FC
	adds r0, r4, #0
	adds r1, r5, #0
	bl DecompressGlyphTile
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x40
	adds r0, r4, #0
	bl DecompressGlyphTile
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #8
	strb r0, [r1]
	adds r5, #0x81
	movs r0, #0xc
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080062F8: .4byte 0x0829CF14
_080062FC: .4byte 0x03003030
	thumb_func_end DecompressGlyphFont9

	thumb_func_start sub_08006300
sub_08006300: @ 0x08006300
	movs r0, #8
	bx lr
	thumb_func_end sub_08006300

	thumb_func_start sub_08006304
sub_08006304: @ 0x08006304
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x14
	lsls r4, r4, #9
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	lsrs r1, r1, #0xc
	ldr r0, _08006348
	adds r1, r1, r0
	adds r4, r4, r1
	ldr r5, _0800634C
	adds r0, r4, #0
	adds r1, r5, #0
	bl DecompressGlyphTile
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x40
	adds r0, r4, #0
	bl DecompressGlyphTile
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #8
	strb r0, [r1]
	adds r5, #0x81
	movs r0, #0x10
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006348: .4byte 0x082A0F14
_0800634C: .4byte 0x03003030
	thumb_func_end sub_08006304

	thumb_func_start sub_08006350
sub_08006350: @ 0x08006350
	movs r0, #8
	bx lr
	thumb_func_end sub_08006350

	thumb_func_start sub_08006354
sub_08006354: @ 0x08006354
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	bne _08006390
	movs r0, #2
	bl GetLastTextColor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	ldr r3, _0800638C
	lsls r2, r0, #4
	orrs r2, r0
	adds r7, r3, #0
	adds r7, #0x80
	movs r6, #0xa
	adds r5, r3, #0
	adds r5, #0x81
	movs r4, #0xc
_0800637C:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, #1
	cmp r1, #0x7f
	ble _0800637C
	b _080063E6
	.align 2, 0
_0800638C: .4byte 0x03003030
_08006390:
	lsrs r2, r0, #0x13
	lsls r2, r2, #9
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #5
	ldr r1, _080063EC
	adds r0, r0, r1
	adds r4, r2, r0
	ldr r5, _080063F0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DecompressGlyphTile
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0x20
	bl DecompressGlyphTile
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, #0
	adds r1, #0x40
	bl DecompressGlyphTile
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, #0
	adds r1, #0x60
	bl DecompressGlyphTile
	ldr r0, _080063F4
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x80
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x81
	movs r0, #0xc
	strb r0, [r1]
_080063E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080063EC: .4byte 0x082A4F14
_080063F0: .4byte 0x03003030
_080063F4: .4byte 0x082ACF14
	thumb_func_end sub_08006354

	thumb_func_start sub_080063F8
sub_080063F8: @ 0x080063F8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08006410
	ldr r0, _0800640C
	adds r0, r1, r0
	ldrb r0, [r0]
	b _08006412
	.align 2, 0
_0800640C: .4byte 0x082ACF14
_08006410:
	movs r0, #0xa
_08006412:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080063F8

	thumb_func_start sub_08006418
sub_08006418: @ 0x08006418
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08006454
	movs r0, #2
	bl GetLastTextColor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	ldr r3, _08006450
	lsls r2, r0, #4
	orrs r2, r0
	adds r7, r3, #0
	adds r7, #0x80
	movs r6, #0xa
	adds r5, r3, #0
	adds r5, #0x81
	movs r4, #0xc
_08006440:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, #1
	cmp r1, #0x7f
	ble _08006440
	b _080064A4
	.align 2, 0
_08006450: .4byte 0x03003030
_08006454:
	lsrs r2, r0, #0x13
	lsls r2, r2, #9
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _080064AC
	adds r0, r0, r1
	adds r5, r2, r0
	ldr r4, _080064B0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DecompressGlyphTile
	adds r0, r5, #0
	adds r0, #0x10
	adds r1, r4, #0
	adds r1, #0x20
	bl DecompressGlyphTile
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x40
	bl DecompressGlyphTile
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x60
	bl DecompressGlyphTile
	adds r1, r4, #0
	adds r1, #0x80
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
_080064A4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080064AC: .4byte 0x082A4F14
_080064B0: .4byte 0x03003030
	thumb_func_end sub_08006418

	thumb_func_start sub_080064B4
sub_080064B4: @ 0x080064B4
	movs r0, #0xa
	bx lr
	thumb_func_end sub_080064B4

	thumb_func_start sub_080064B8
sub_080064B8: @ 0x080064B8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	bne _080064F4
	movs r0, #2
	bl GetLastTextColor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	ldr r3, _080064F0
	lsls r2, r0, #4
	orrs r2, r0
	adds r7, r3, #0
	adds r7, #0x80
	movs r6, #0xa
	adds r5, r3, #0
	adds r5, #0x81
	movs r4, #0xc
_080064E0:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, #1
	cmp r1, #0x7f
	ble _080064E0
	b _0800654A
	.align 2, 0
_080064F0: .4byte 0x03003030
_080064F4:
	lsrs r2, r0, #0x13
	lsls r2, r2, #9
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #5
	ldr r1, _08006550
	adds r0, r0, r1
	adds r4, r2, r0
	ldr r5, _08006554
	adds r0, r4, #0
	adds r1, r5, #0
	bl DecompressGlyphTile
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0x20
	bl DecompressGlyphTile
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, #0
	adds r1, #0x40
	bl DecompressGlyphTile
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, #0
	adds r1, #0x60
	bl DecompressGlyphTile
	ldr r0, _08006558
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x80
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x81
	movs r0, #0xc
	strb r0, [r1]
_0800654A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006550: .4byte 0x082AD02C
_08006554: .4byte 0x03003030
_08006558: .4byte 0x082B502C
	thumb_func_end sub_080064B8

	thumb_func_start sub_0800655C
sub_0800655C: @ 0x0800655C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08006574
	ldr r0, _08006570
	adds r0, r1, r0
	ldrb r0, [r0]
	b _08006576
	.align 2, 0
_08006570: .4byte 0x082B502C
_08006574:
	movs r0, #0xa
_08006576:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800655C

	thumb_func_start sub_0800657C
sub_0800657C: @ 0x0800657C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	bne _080065B8
	movs r0, #2
	bl GetLastTextColor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	ldr r3, _080065B4
	lsls r2, r0, #4
	orrs r2, r0
	adds r7, r3, #0
	adds r7, #0x80
	movs r6, #0xa
	adds r5, r3, #0
	adds r5, #0x81
	movs r4, #0xc
_080065A4:
	adds r0, r1, r3
	strb r2, [r0]
	strb r6, [r7]
	strb r4, [r5]
	adds r1, #1
	cmp r1, #0x7f
	ble _080065A4
	b _0800660E
	.align 2, 0
_080065B4: .4byte 0x03003030
_080065B8:
	lsrs r2, r0, #0x13
	lsls r2, r2, #9
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #5
	ldr r1, _08006614
	adds r0, r0, r1
	adds r4, r2, r0
	ldr r5, _08006618
	adds r0, r4, #0
	adds r1, r5, #0
	bl DecompressGlyphTile
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0x20
	bl DecompressGlyphTile
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, #0
	adds r1, #0x40
	bl DecompressGlyphTile
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r1, r5, #0
	adds r1, #0x60
	bl DecompressGlyphTile
	ldr r0, _0800661C
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x80
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x81
	movs r0, #0xc
	strb r0, [r1]
_0800660E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006614: .4byte 0x082B5144
_08006618: .4byte 0x03003030
_0800661C: .4byte 0x082BD144
	thumb_func_end sub_0800657C

	thumb_func_start sub_08006620
sub_08006620: @ 0x08006620
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08006638
	ldr r0, _08006634
	adds r0, r1, r0
	ldrb r0, [r0]
	b _0800663A
	.align 2, 0
_08006634: .4byte 0x082BD144
_08006638:
	movs r0, #0xa
_0800663A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08006620

	thumb_func_start sub_08006640
sub_08006640: @ 0x08006640
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x14
	lsls r4, r4, #9
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	lsrs r1, r1, #0xc
	ldr r0, _08006684
	adds r1, r1, r0
	adds r4, r4, r1
	ldr r5, _08006688
	adds r0, r4, #0
	adds r1, r5, #0
	bl DecompressGlyphTile
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x40
	adds r0, r4, #0
	bl DecompressGlyphTile
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #8
	strb r0, [r1]
	adds r5, #0x81
	movs r0, #0xc
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006684: .4byte 0x082BD25C
_08006688: .4byte 0x03003030
	thumb_func_end sub_08006640

