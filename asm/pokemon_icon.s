.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CreateMonIcon
CreateMonIcon: @ 0x080D2564
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x30
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x4c]
	ldr r1, [sp, #0x50]
	ldr r5, [sp, #0x54]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _080D2600
	str r0, [sp, #0x18]
	adds r0, r4, #0
	adds r2, r5, #0
	bl GetMonIconPtr
	str r0, [sp, #0x1c]
	ldr r0, _080D2604
	str r0, [sp, #0x20]
	ldr r0, _080D2608
	str r0, [sp, #0x24]
	str r6, [sp, #0x28]
	ldr r0, _080D260C
	adds r0, r4, r0
	ldr r1, _080D2610
	adds r5, r1, #0
	ldrb r0, [r0]
	adds r1, r5, r0
	add r0, sp, #0x2c
	strh r1, [r0]
	add r1, sp, #0x18
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	bls _080D25CA
	mov r0, sp
	strh r5, [r0, #0x14]
_080D25CA:
	mov r0, r8
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, sp
	mov r3, sb
	bl CreateMonIconSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080D2614
	adds r0, r0, r1
	bl UpdateMonIconFrame
	adds r0, r4, #0
	add sp, #0x30
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D2600: .4byte 0x085570CC
_080D2604: .4byte 0x08557110
_080D2608: .4byte 0x08557144
_080D260C: .4byte 0x08556EE4
_080D2610: .4byte 0x0000DAC0
_080D2614: .4byte 0x020205AC
	thumb_func_end CreateMonIcon

	thumb_func_start sub_080D2618
sub_080D2618: @ 0x080D2618
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x2c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r3, sp
	ldr r2, _080D2690
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	ldr r2, _080D2694
	str r2, [sp, #8]
	ldr r2, _080D2698
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r2, _080D269C
	adds r2, r0, r2
	ldr r7, _080D26A0
	adds r1, r7, #0
	ldrb r2, [r2]
	adds r1, r1, r2
	strh r1, [r3, #0x14]
	ldr r1, [sp, #0x30]
	bl GetMonIconTiles
	str r0, [sp, #4]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl CreateMonIconSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080D26A4
	adds r0, r0, r1
	bl UpdateMonIconFrame
	adds r0, r4, #0
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D2690: .4byte 0x085570CC
_080D2694: .4byte 0x08557110
_080D2698: .4byte 0x08557144
_080D269C: .4byte 0x08556EE4
_080D26A0: .4byte 0x0000DAC0
_080D26A4: .4byte 0x020205AC
	thumb_func_end sub_080D2618

	thumb_func_start GetIconSpecies
GetIconSpecies: @ 0x080D26A8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xc9
	bne _080D26D2
	adds r0, r1, #0
	bl GetUnownLetterByPersonality
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080D26C4
	movs r0, #0xc9
	b _080D26CE
_080D26C4:
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080D26CE:
	adds r1, r0, #0
	b _080D26E0
_080D26D2:
	movs r0, #0xce
	lsls r0, r0, #1
	adds r1, r2, #0
	cmp r1, r0
	bls _080D26E0
	movs r1, #0x82
	lsls r1, r1, #1
_080D26E0:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetIconSpecies

	thumb_func_start GetUnownLetterByPersonality
GetUnownLetterByPersonality: @ 0x080D26E8
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	beq _080D271E
	movs r0, #0xc0
	lsls r0, r0, #0x12
	ands r0, r2
	lsrs r0, r0, #0x12
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r2
	lsrs r1, r1, #0xc
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r1, r2
	lsrs r1, r1, #6
	orrs r0, r1
	movs r1, #3
	ands r1, r2
	orrs r0, r1
	movs r1, #0x1c
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080D2720
_080D271E:
	movs r0, #0
_080D2720:
	pop {r1}
	bx r1
	thumb_func_end GetUnownLetterByPersonality

	thumb_func_start sub_080D2724
sub_080D2724: @ 0x080D2724
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	mov r1, sp
	bl MailSpeciesToSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc9
	bne _080D275A
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #0
	bne _080D274A
	mov r1, sp
	adds r0, #0xc9
	b _080D2752
_080D274A:
	mov r1, sp
	movs r2, #0xce
	lsls r2, r2, #1
	adds r0, r0, r2
_080D2752:
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	b _080D2772
_080D275A:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	bls _080D2766
	movs r4, #0x82
	lsls r4, r4, #1
_080D2766:
	adds r0, r4, #0
	movs r1, #0
	bl GetIconSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080D2772:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080D2724

	thumb_func_start GetMonIconPtr
GetMonIconPtr: @ 0x080D277C
	push {r4, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetIconSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl GetMonIconTiles
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonIconPtr

	thumb_func_start sub_080D2798
sub_080D2798: @ 0x080D2798
	push {lr}
	bl sub_080D2B2C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080D2798

	thumb_func_start LoadMonIconPalettes
LoadMonIconPalettes: @ 0x080D27A4
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _080D27C4
_080D27AA:
	lsls r0, r4, #3
	adds r0, r0, r5
	bl LoadSpritePalette
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _080D27AA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D27C4: .4byte 0x0855709C
	thumb_func_end LoadMonIconPalettes

	thumb_func_start SafeLoadMonIconPalette
SafeLoadMonIconPalette: @ 0x080D27C8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bls _080D27DA
	movs r1, #0x82
	lsls r1, r1, #1
_080D27DA:
	ldr r0, _080D2800
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r1, _080D2804
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #4]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080D27FA
	adds r0, r4, #0
	bl LoadSpritePalette
_080D27FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2800: .4byte 0x08556EE4
_080D2804: .4byte 0x0855709C
	thumb_func_end SafeLoadMonIconPalette

	thumb_func_start LoadMonIconPalette
LoadMonIconPalette: @ 0x080D2808
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080D2834
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _080D2838
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #4]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080D282E
	adds r0, r4, #0
	bl LoadSpritePalette
_080D282E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2834: .4byte 0x08556EE4
_080D2838: .4byte 0x0855709C
	thumb_func_end LoadMonIconPalette

	thumb_func_start FreeMonIconPalettes
FreeMonIconPalettes: @ 0x080D283C
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _080D285C
_080D2842:
	lsls r0, r4, #3
	adds r0, r0, r5
	ldrh r0, [r0, #4]
	bl FreeSpritePaletteByTag
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _080D2842
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D285C: .4byte 0x0855709C
	thumb_func_end FreeMonIconPalettes

	thumb_func_start SafeFreeMonIconPalette
SafeFreeMonIconPalette: @ 0x080D2860
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bls _080D2872
	movs r1, #0x82
	lsls r1, r1, #1
_080D2872:
	ldr r0, _080D2888
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r1, _080D288C
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080D2888: .4byte 0x08556EE4
_080D288C: .4byte 0x0855709C
	thumb_func_end SafeFreeMonIconPalette

	thumb_func_start FreeMonIconPalette
FreeMonIconPalette: @ 0x080D2890
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080D28AC
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _080D28B0
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080D28AC: .4byte 0x08556EE4
_080D28B0: .4byte 0x0855709C
	thumb_func_end FreeMonIconPalette

	thumb_func_start sub_080D28B4
sub_080D28B4: @ 0x080D28B4
	push {lr}
	bl UpdateMonIconFrame
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080D28B4

	thumb_func_start GetMonIconTiles
GetMonIconTiles: @ 0x080D28C0
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080D28E8
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0xcd
	lsls r1, r1, #1
	cmp r0, r1
	bne _080D28E2
	cmp r3, #1
	bne _080D28E2
	movs r0, #0x80
	lsls r0, r0, #3
	adds r2, r2, r0
_080D28E2:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080D28E8: .4byte 0x08556804
	thumb_func_end GetMonIconTiles

	thumb_func_start sub_080D28EC
sub_080D28EC: @ 0x080D28EC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa0
	bhi _080D2914
	ldr r6, _080D291C
	movs r5, #5
_080D28FA:
	ldr r0, [r6]
	adds r1, r4, #0
	movs r2, #0x20
	bl LoadPalette
	adds r0, r4, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, #8
	subs r5, #1
	cmp r5, #0
	bge _080D28FA
_080D2914:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D291C: .4byte 0x0855709C
	thumb_func_end sub_080D28EC

	thumb_func_start GetValidMonIconPalIndex
GetValidMonIconPalIndex: @ 0x080D2920
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bls _080D2932
	movs r1, #0x82
	lsls r1, r1, #1
_080D2932:
	ldr r0, _080D293C
	adds r0, r1, r0
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080D293C: .4byte 0x08556EE4
	thumb_func_end GetValidMonIconPalIndex

	thumb_func_start GetMonIconPaletteIndexFromSpecies
GetMonIconPaletteIndexFromSpecies: @ 0x080D2940
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080D294C
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080D294C: .4byte 0x08556EE4
	thumb_func_end GetMonIconPaletteIndexFromSpecies

	thumb_func_start GetValidMonIconPalettePtr
GetValidMonIconPalettePtr: @ 0x080D2950
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r2, r0
	bls _080D2962
	movs r2, #0x82
	lsls r2, r2, #1
_080D2962:
	ldr r1, _080D2974
	ldr r0, _080D2978
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080D2974: .4byte 0x0855709C
_080D2978: .4byte 0x08556EE4
	thumb_func_end GetValidMonIconPalettePtr

	thumb_func_start UpdateMonIconFrame
UpdateMonIconFrame: @ 0x080D297C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	movs r7, #0
	adds r6, r4, #0
	adds r6, #0x2c
	ldrb r2, [r6]
	movs r0, #0x3f
	mov sb, r0
	ands r0, r2
	cmp r0, #0
	bne _080D2A30
	movs r1, #0x2a
	adds r1, r1, r4
	mov r8, r1
	ldrb r1, [r1]
	ldr r0, [r4, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r0, [r5]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D29C6
	adds r0, #1
	cmp r3, r0
	bne _080D29CA
	b _080D2A44
_080D29C6:
	strb r7, [r5]
	b _080D2A44
_080D29CA:
	ldr r2, _080D2A28
	ldrb r1, [r4, #3]
	lsrs r1, r1, #6
	lsls r1, r1, #1
	ldrb r0, [r4, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	muls r1, r3, r1
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r3, _080D2A2C
	adds r1, r1, r3
	bl RequestSpriteCopy
	mov r0, r8
	ldrb r1, [r0]
	ldr r0, [r4, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r5]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x1a
	mov r1, sb
	ands r1, r0
	ldrb r2, [r6]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrb r7, [r5]
	b _080D2A44
	.align 2, 0
_080D2A28: .4byte 0x0855714C
_080D2A2C: .4byte 0x06010000
_080D2A30:
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1a
	subs r0, #1
	movs r1, #0x3f
	ands r0, r1
	movs r1, #0x40
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r6]
_080D2A44:
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end UpdateMonIconFrame

	thumb_func_start CreateMonIconSprite
CreateMonIconSprite: @ 0x080D2A54
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x38
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0
	str r0, [sp, #0x30]
	ldr r2, _080D2B1C
	mov r0, sb
	ldr r6, [r0]
	ldrb r1, [r6, #3]
	lsrs r1, r1, #6
	lsls r1, r1, #1
	ldrb r0, [r6, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r2, [r1]
	ldr r1, _080D2B20
	add r3, sp, #0x30
	ldr r0, [r3, #4]
	ands r0, r1
	orrs r0, r2
	str r0, [r3, #4]
	add r1, sp, #0x18
	ldr r0, _080D2B24
	strh r0, [r1]
	mov r0, sb
	ldrh r2, [r0, #0x14]
	mov r0, sp
	adds r0, #0x1a
	strh r2, [r0]
	str r6, [sp, #0x1c]
	mov r2, sb
	ldr r0, [r2, #8]
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	ldr r0, [r2, #0xc]
	str r0, [sp, #0x28]
	ldr r0, [r2, #0x10]
	str r0, [sp, #0x2c]
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, r8
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _080D2B28
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r4, r3, r6
	adds r5, r4, #0
	adds r5, #0x2c
	ldrb r1, [r5]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r5]
	adds r4, #0x3f
	ldrb r2, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r4]
	adds r6, #0xc
	adds r3, r3, r6
	mov r2, sb
	ldr r1, [r2, #4]
	str r1, [r3]
	add sp, #0x38
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080D2B1C: .4byte 0x0855714C
_080D2B20: .4byte 0xFFFF0000
_080D2B24: .4byte 0x0000FFFF
_080D2B28: .4byte 0x020205AC
	thumb_func_end CreateMonIconSprite

	thumb_func_start sub_080D2B2C
sub_080D2B2C: @ 0x080D2B2C
	push {lr}
	sub sp, #8
	movs r1, #0
	str r1, [sp]
	ldr r3, _080D2B60
	ldrb r2, [r0, #3]
	lsrs r2, r2, #6
	lsls r2, r2, #1
	ldrb r1, [r0, #1]
	lsrs r1, r1, #6
	lsls r1, r1, #3
	adds r2, r2, r1
	adds r2, r2, r3
	ldrh r3, [r2]
	ldr r2, _080D2B64
	ldr r1, [sp, #4]
	ands r1, r2
	orrs r1, r3
	str r1, [sp, #4]
	mov r1, sp
	str r1, [r0, #0xc]
	bl DestroySprite
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080D2B60: .4byte 0x0855714C
_080D2B64: .4byte 0xFFFF0000
	thumb_func_end sub_080D2B2C

	thumb_func_start sub_080D2B68
sub_080D2B68: @ 0x080D2B68
	mov ip, r0
	adds r0, #0x2a
	movs r3, #0
	strb r1, [r0]
	mov r2, ip
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x2b
	strb r3, [r0]
	bx lr
	.align 2, 0
	thumb_func_end sub_080D2B68

