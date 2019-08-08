.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Font6Func
Font6Func: @ 0x081B9EF0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x14
	ldrb r0, [r6, #0x1c]
	cmp r0, #6
	bls _081B9F00
	b _081BA300
_081B9F00:
	lsls r0, r0, #2
	ldr r1, _081B9F0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B9F0C: .4byte 0x081B9F10
_081B9F10: @ jump table
	.4byte _081B9F2C @ case 0
	.4byte _081BA1F4 @ case 1
	.4byte _081BA206 @ case 2
	.4byte _081BA230 @ case 3
	.4byte _081BA268 @ case 4
	.4byte _081BA2DC @ case 5
	.4byte _081BA2EE @ case 6
_081B9F2C:
	ldr r2, _081B9F80
	ldrh r1, [r2, #0x2c]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _081B9F46
	ldrb r1, [r4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081B9F46
	movs r0, #0
	strb r0, [r6, #0x1e]
_081B9F46:
	ldrb r1, [r6, #0x1e]
	cmp r1, #0
	beq _081B9F88
	ldrb r0, [r6, #0x1d]
	cmp r0, #0
	beq _081B9F88
	subs r0, r1, #1
	strb r0, [r6, #0x1e]
	ldr r0, _081B9F84
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081B9F64
	b _081BA1AE
_081B9F64:
	ldrh r1, [r2, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081B9F70
	b _081BA1AE
_081B9F70:
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0
	strb r0, [r6, #0x1e]
	b _081BA1AE
	.align 2, 0
_081B9F80: .4byte 0x03002360
_081B9F84: .4byte 0x030030B4
_081B9F88:
	ldr r2, _081B9F98
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081B9F9C
	movs r0, #3
	b _081B9F9E
	.align 2, 0
_081B9F98: .4byte 0x030030B4
_081B9F9C:
	ldrb r0, [r6, #0x1d]
_081B9F9E:
	strb r0, [r6, #0x1e]
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, #1
	str r0, [r6]
	adds r0, r3, #0
	subs r0, #0xf8
	cmp r0, #7
	bls _081B9FB2
	b _081BA1CE
_081B9FB2:
	lsls r0, r0, #2
	ldr r1, _081B9FBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B9FBC: .4byte 0x081B9FC0
_081B9FC0: @ jump table
	.4byte _081BA1C4 @ case 0
	.4byte _081BA1B2 @ case 1
	.4byte _081BA1A4 @ case 2
	.4byte _081BA1A0 @ case 3
	.4byte _081BA00E @ case 4
	.4byte _081BA008 @ case 5
	.4byte _081B9FE0 @ case 6
	.4byte _081BA300 @ case 7
_081B9FE0:
	ldrb r0, [r6, #6]
	strb r0, [r6, #8]
	ldrb r1, [r6, #5]
	ldr r0, _081BA004
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
	strb r0, [r6, #9]
_081B9FFE:
	movs r0, #2
	b _081BA302
	.align 2, 0
_081BA004: .4byte 0x03003020
_081BA008:
	ldr r0, [r6]
	adds r0, #1
	b _081BA164
_081BA00E:
	ldr r0, [r6]
	ldrb r3, [r0]
	adds r0, #1
	str r0, [r6]
	subs r0, r3, #1
	cmp r0, #0xf
	bls _081BA01E
	b _081BA1CE
_081BA01E:
	lsls r0, r0, #2
	ldr r1, _081BA028
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BA028: .4byte 0x081BA02C
_081BA02C: @ jump table
	.4byte _081BA06C @ case 0
	.4byte _081BA08E @ case 1
	.4byte _081BA0B2 @ case 2
	.4byte _081BA0CC @ case 3
	.4byte _081BA118 @ case 4
	.4byte _081BA11E @ case 5
	.4byte _081B9FFE @ case 6
	.4byte _081BA138 @ case 7
	.4byte _081BA148 @ case 8
	.4byte _081BA15C @ case 9
	.4byte _081BA160 @ case 10
	.4byte _081BA168 @ case 11
	.4byte _081BA172 @ case 12
	.4byte _081BA17E @ case 13
	.4byte _081BA18E @ case 14
	.4byte _081BA160 @ case 15
_081BA06C:
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
	b _081BA112
_081BA08E:
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
	b _081BA112
_081BA0B2:
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
	b _081BA10A
_081BA0CC:
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
_081BA10A:
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
_081BA112:
	bl GenerateFontHalfRowLookupTable
	b _081B9FFE
_081BA118:
	ldr r0, [r6]
	adds r0, #1
	b _081BA164
_081BA11E:
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
	ldr r0, [r6]
	adds r0, #1
	b _081BA164
_081BA138:
	ldr r0, [r6]
	ldrb r1, [r0]
	strb r1, [r6, #0x1e]
	adds r0, #1
	str r0, [r6]
	movs r0, #6
	strb r0, [r6, #0x1c]
	b _081B9FFE
_081BA148:
	movs r0, #1
	strb r0, [r6, #0x1c]
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081BA1AE
	movs r0, #0
	strb r0, [r4, #2]
	b _081BA1AE
_081BA15C:
	movs r0, #5
	b _081BA2EA
_081BA160:
	ldr r0, [r6]
	adds r0, #2
_081BA164:
	str r0, [r6]
	b _081B9FFE
_081BA168:
	ldr r1, [r6]
	adds r0, r1, #1
	str r0, [r6]
	ldrb r3, [r1, #1]
	b _081BA1CE
_081BA172:
	ldr r1, [r6]
	ldrb r0, [r1]
	ldrb r2, [r6, #6]
	adds r0, r0, r2
	strb r0, [r6, #8]
	b _081BA188
_081BA17E:
	ldr r1, [r6]
	ldrb r0, [r1]
	ldrb r2, [r6, #7]
	adds r0, r0, r2
	strb r0, [r6, #9]
_081BA188:
	adds r1, #1
	str r1, [r6]
	b _081B9FFE
_081BA18E:
	ldrb r0, [r6, #4]
	ldrb r2, [r6, #0xd]
	lsls r2, r2, #0x1c
	lsrs r1, r2, #4
	orrs r1, r2
	lsrs r1, r1, #0x18
	bl FillWindowPixelBuffer
	b _081B9FFE
_081BA1A0:
	movs r0, #2
	b _081BA1A6
_081BA1A4:
	movs r0, #3
_081BA1A6:
	strb r0, [r6, #0x1c]
	adds r0, r6, #0
	bl TextPrinterInitDownArrowCounters
_081BA1AE:
	movs r0, #3
	b _081BA302
_081BA1B2:
	ldr r0, [r6]
	ldrb r3, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r3, r1
	adds r0, #1
	str r0, [r6]
	b _081BA1CE
_081BA1C4:
	ldr r0, [r6]
	adds r0, #1
	str r0, [r6]
	movs r0, #0
	b _081BA302
_081BA1CE:
	adds r0, r3, #0
	bl DecompressGlyphFont6
	adds r0, r6, #0
	bl CopyGlyphToWindow
	ldr r0, _081BA1F0
	adds r0, #0x80
	ldrb r1, [r6, #0xa]
	ldrb r0, [r0]
	adds r1, r1, r0
	ldrb r0, [r6, #8]
	adds r0, r0, r1
	strb r0, [r6, #8]
	movs r0, #0
	b _081BA302
	.align 2, 0
_081BA1F0: .4byte 0x03003030
_081BA1F4:
	adds r0, r6, #0
	bl TextPrinterWait
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081BA1AE
	movs r0, #0
	strb r0, [r6, #0x1c]
	b _081BA1AE
_081BA206:
	adds r0, r6, #0
	bl TextPrinterWaitWithDownArrow
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081BA1AE
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
	b _081BA1AE
_081BA230:
	adds r0, r6, #0
	bl TextPrinterWaitWithDownArrow
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081BA1AE
	adds r0, r6, #0
	bl TextPrinterClearDownArrow
	ldrb r1, [r6, #5]
	ldr r0, _081BA264
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
	b _081BA1AE
	.align 2, 0
_081BA264: .4byte 0x03003020
_081BA268:
	ldrb r2, [r6, #0x1f]
	cmp r2, #0
	beq _081BA2D8
	ldr r4, _081BA29C
	ldr r5, _081BA2A0
	ldr r0, [r5]
	ldrb r0, [r0, #0x14]
	lsls r1, r0, #0x1d
	lsrs r0, r1, #0x1d
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r2, r0
	bhs _081BA2A4
	ldrb r0, [r6, #4]
	ldrb r1, [r6, #0xd]
	lsls r1, r1, #0x1c
	lsrs r3, r1, #4
	orrs r3, r1
	lsrs r3, r3, #0x18
	movs r1, #0
	bl ScrollWindow
	movs r0, #0
	strb r0, [r6, #0x1f]
	b _081BA2CE
	.align 2, 0
_081BA29C: .4byte 0x085E19DC
_081BA2A0: .4byte 0x03005AF0
_081BA2A4:
	ldrb r0, [r6, #4]
	lsrs r1, r1, #0x1d
	adds r1, r1, r4
	ldrb r2, [r1]
	ldrb r1, [r6, #0xd]
	lsls r1, r1, #0x1c
	lsrs r3, r1, #4
	orrs r3, r1
	lsrs r3, r3, #0x18
	movs r1, #0
	bl ScrollWindow
	ldr r0, [r5]
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r0, r0, r4
	ldrb r1, [r6, #0x1f]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r6, #0x1f]
_081BA2CE:
	ldrb r0, [r6, #4]
	movs r1, #2
	bl CopyWindowToVram
	b _081BA1AE
_081BA2D8:
	strb r2, [r6, #0x1c]
	b _081BA1AE
_081BA2DC:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081BA2EA
	b _081BA1AE
_081BA2EA:
	strb r0, [r6, #0x1c]
	b _081BA1AE
_081BA2EE:
	ldrb r0, [r6, #0x1e]
	adds r1, r0, #0
	cmp r1, #0
	beq _081BA2FC
	subs r0, #1
	strb r0, [r6, #0x1e]
	b _081BA1AE
_081BA2FC:
	strb r1, [r6, #0x1c]
	b _081BA1AE
_081BA300:
	movs r0, #1
_081BA302:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end Font6Func

	thumb_func_start DecompressGlyphFont6
DecompressGlyphFont6: @ 0x081BA308
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x13
	lsls r2, r2, #9
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	lsrs r1, r1, #0xb
	ldr r0, _081BA364
	adds r1, r1, r0
	adds r5, r2, r1
	ldr r4, _081BA368
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
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081BA364: .4byte 0x085E19E0
_081BA368: .4byte 0x03003030
	thumb_func_end DecompressGlyphFont6

	thumb_func_start GetGlyphWidthFont6
GetGlyphWidthFont6: @ 0x081BA36C
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _081BA398
	strh r1, [r0]
	ldr r2, _081BA39C
	ldr r3, _081BA3A0
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _081BA3A4
	strh r1, [r0]
	bx lr
	.align 2, 0
_081BA398: .4byte 0x04000134
_081BA39C: .4byte 0x04000128
_081BA3A0: .4byte 0x00002003
_081BA3A4: .4byte 0x0400012A
	thumb_func_end GetGlyphWidthFont6

