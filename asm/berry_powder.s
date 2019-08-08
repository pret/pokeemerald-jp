.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DecryptBerryPowder
DecryptBerryPowder: @ 0x08024434
	ldr r1, _08024444
	ldr r1, [r1]
	adds r1, #0xac
	ldr r0, [r0]
	ldr r1, [r1]
	eors r0, r1
	bx lr
	.align 2, 0
_08024444: .4byte 0x03005AF0
	thumb_func_end DecryptBerryPowder

	thumb_func_start SetBerryPowder
SetBerryPowder: @ 0x08024448
	ldr r2, _08024458
	ldr r2, [r2]
	adds r2, #0xac
	ldr r2, [r2]
	eors r2, r1
	str r2, [r0]
	bx lr
	.align 2, 0
_08024458: .4byte 0x03005AF0
	thumb_func_end SetBerryPowder

	thumb_func_start ApplyNewEncryptionKeyToBerryPowder
ApplyNewEncryptionKeyToBerryPowder: @ 0x0802445C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08024474
	ldr r0, [r0]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r0, r2
	bl ApplyNewEncryptionKeyToWord
	pop {r0}
	bx r0
	.align 2, 0
_08024474: .4byte 0x03005AF0
	thumb_func_end ApplyNewEncryptionKeyToBerryPowder

	thumb_func_start HasEnoughBerryPowder_
HasEnoughBerryPowder_: @ 0x08024478
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024494
	ldr r0, [r0]
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r0, r1
	bl DecryptBerryPowder
	cmp r0, r4
	blo _08024498
	movs r0, #1
	b _0802449A
	.align 2, 0
_08024494: .4byte 0x03005AF0
_08024498:
	movs r0, #0
_0802449A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end HasEnoughBerryPowder_

	thumb_func_start HasEnoughBerryPowder
HasEnoughBerryPowder: @ 0x080244A0
	push {lr}
	ldr r0, _080244BC
	ldr r0, [r0]
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r0, r1
	bl DecryptBerryPowder
	ldr r1, _080244C0
	ldrh r1, [r1]
	cmp r0, r1
	blo _080244C4
	movs r0, #1
	b _080244C6
	.align 2, 0
_080244BC: .4byte 0x03005AF0
_080244C0: .4byte 0x02037280
_080244C4:
	movs r0, #0
_080244C6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HasEnoughBerryPowder

	thumb_func_start GiveBerryPowder
GiveBerryPowder: @ 0x080244CC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080244F4
	ldr r0, [r0]
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r5, r0, r1
	adds r0, r5, #0
	bl DecryptBerryPowder
	adds r1, r0, r4
	ldr r2, _080244F8
	cmp r1, r2
	bhi _080244FC
	adds r0, r5, #0
	bl SetBerryPowder
	movs r0, #1
	b _08024506
	.align 2, 0
_080244F4: .4byte 0x03005AF0
_080244F8: .4byte 0x0001869F
_080244FC:
	adds r0, r5, #0
	adds r1, r2, #0
	bl SetBerryPowder
	movs r0, #0
_08024506:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GiveBerryPowder

	thumb_func_start TakeBerryPowder_
TakeBerryPowder_: @ 0x0802450C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0802453C
	ldr r0, [r0]
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r4, r0, r1
	adds r0, r5, #0
	bl HasEnoughBerryPowder_
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024540
	adds r0, r4, #0
	bl DecryptBerryPowder
	adds r1, r0, #0
	subs r1, r1, r5
	adds r0, r4, #0
	bl SetBerryPowder
	movs r0, #1
	b _08024542
	.align 2, 0
_0802453C: .4byte 0x03005AF0
_08024540:
	movs r0, #0
_08024542:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end TakeBerryPowder_

	thumb_func_start TakeBerryPowder
TakeBerryPowder: @ 0x08024548
	push {r4, r5, lr}
	ldr r0, _08024578
	ldr r0, [r0]
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r5, _0802457C
	ldrh r0, [r5]
	bl HasEnoughBerryPowder_
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024580
	adds r0, r4, #0
	bl DecryptBerryPowder
	adds r1, r0, #0
	ldrh r0, [r5]
	subs r1, r1, r0
	adds r0, r4, #0
	bl SetBerryPowder
	movs r0, #1
	b _08024582
	.align 2, 0
_08024578: .4byte 0x03005AF0
_0802457C: .4byte 0x02037280
_08024580:
	movs r0, #0
_08024582:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end TakeBerryPowder

	thumb_func_start GetBerryPowder
GetBerryPowder: @ 0x08024588
	push {lr}
	ldr r0, _0802459C
	ldr r0, [r0]
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r0, r1
	bl DecryptBerryPowder
	pop {r1}
	bx r1
	.align 2, 0
_0802459C: .4byte 0x03005AF0
	thumb_func_end GetBerryPowder

	thumb_func_start PrintBerryPowderAmount
PrintBerryPowderAmount: @ 0x080245A0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x24]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080245F4
	mov sb, r0
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #0
	mov r2, sb
	mov r3, r8
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080245F4: .4byte 0x02021C40
	thumb_func_end PrintBerryPowderAmount

	thumb_func_start DrawPlayerPowderAmount
DrawPlayerPowderAmount: @ 0x080245F8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, _08024650
	movs r4, #0
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	str r4, [sp]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0xc
	bl PrintBerryPowderAmount
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024650: .4byte 0x085CCCEE
	thumb_func_end DrawPlayerPowderAmount

	thumb_func_start PrintPlayerBerryPowderAmount
PrintPlayerBerryPowderAmount: @ 0x08024654
	push {lr}
	sub sp, #4
	bl GetBerryPowder
	adds r1, r0, #0
	ldr r0, _08024674
	ldrb r0, [r0]
	movs r2, #0
	str r2, [sp]
	movs r2, #0x10
	movs r3, #0xc
	bl PrintBerryPowderAmount
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08024674: .4byte 0x02022948
	thumb_func_end PrintPlayerBerryPowderAmount

	thumb_func_start DisplayBerryPowderVendorMenu
DisplayBerryPowderVendorMenu: @ 0x08024678
	push {r4, r5, lr}
	sub sp, #0x18
	movs r0, #7
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x20
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetWindowTemplateFields
	ldr r4, _080246D8
	add r0, sp, #0x10
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	ldr r5, _080246DC
	adds r1, r5, #0
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx_
	ldrb r4, [r4]
	bl GetBerryPowder
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl DrawPlayerPowderAmount
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080246D8: .4byte 0x02022948
_080246DC: .4byte 0x0000021D
	thumb_func_end DisplayBerryPowderVendorMenu

	thumb_func_start RemoveBerryPowderVendorMenu
RemoveBerryPowderVendorMenu: @ 0x080246E0
	push {r4, lr}
	ldr r4, _08024700
	ldrb r0, [r4]
	bl ClearWindowTilemap
	ldrb r0, [r4]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024700: .4byte 0x02022948
	thumb_func_end RemoveBerryPowderVendorMenu

