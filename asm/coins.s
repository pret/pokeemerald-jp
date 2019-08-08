.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start PrintCoinsString
PrintCoinsString: @ 0x08145C20
	push {r4, lr}
	sub sp, #0xc
	adds r1, r0, #0
	ldr r0, _08145C5C
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _08145C60
	ldr r1, _08145C64
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r0, _08145C68
	ldrb r0, [r0]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #8
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145C5C: .4byte 0x02021C40
_08145C60: .4byte 0x02021C7C
_08145C64: .4byte 0x085C9443
_08145C68: .4byte 0x0203A868
	thumb_func_end PrintCoinsString

	thumb_func_start ShowCoinsWindow
ShowCoinsWindow: @ 0x08145C6C
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x9b
	lsls r0, r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl SetWindowTemplateFields
	ldr r4, _08145CD0
	add r0, sp, #0x10
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r2, #0x85
	lsls r2, r2, #2
	movs r1, #0
	movs r3, #0xe
	bl DrawStdFrameWithCustomTileAndPalette
	adds r0, r5, #0
	bl PrintCoinsString
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08145CD0: .4byte 0x0203A868
	thumb_func_end ShowCoinsWindow

	thumb_func_start HideCoinsWindow
HideCoinsWindow: @ 0x08145CD4
	push {r4, lr}
	ldr r4, _08145CEC
	ldrb r0, [r4]
	movs r1, #1
	bl DrawStdWindowFrame
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145CEC: .4byte 0x0203A868
	thumb_func_end HideCoinsWindow

	thumb_func_start GetCoins
GetCoins: @ 0x08145CF0
	ldr r0, _08145D0C
	ldr r1, [r0]
	ldr r0, _08145D10
	adds r1, r1, r0
	ldr r0, _08145D14
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	ldrh r1, [r1]
	eors r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_08145D0C: .4byte 0x03005AEC
_08145D10: .4byte 0x00000494
_08145D14: .4byte 0x03005AF0
	thumb_func_end GetCoins

	thumb_func_start SetCoins
SetCoins: @ 0x08145D18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08145D34
	ldr r2, [r1]
	ldr r1, _08145D38
	ldr r1, [r1]
	adds r1, #0xac
	ldr r1, [r1]
	eors r0, r1
	ldr r1, _08145D3C
	adds r2, r2, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08145D34: .4byte 0x03005AEC
_08145D38: .4byte 0x03005AF0
_08145D3C: .4byte 0x00000494
	thumb_func_end SetCoins

	thumb_func_start GiveCoins
GiveCoins: @ 0x08145D40
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08145D58
	cmp r1, r0
	bls _08145D5C
	movs r0, #0
	b _08145D80
	.align 2, 0
_08145D58: .4byte 0x0000270E
_08145D5C:
	adds r0, r1, r4
	cmp r1, r0
	ble _08145D6C
	ldr r0, _08145D68
	b _08145D7A
	.align 2, 0
_08145D68: .4byte 0x0000270F
_08145D6C:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08145D88
	cmp r1, r0
	bls _08145D78
	adds r1, r0, #0
_08145D78:
	adds r0, r1, #0
_08145D7A:
	bl SetCoins
	movs r0, #1
_08145D80:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08145D88: .4byte 0x0000270F
	thumb_func_end GiveCoins

	thumb_func_start TakeCoins
TakeCoins: @ 0x08145D8C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bhs _08145DA2
	movs r0, #0
	b _08145DAE
_08145DA2:
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetCoins
	movs r0, #1
_08145DAE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TakeCoins

