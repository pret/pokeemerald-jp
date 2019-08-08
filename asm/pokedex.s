.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetPokedex
ResetPokedex: @ 0x080BAA0C
	push {r4, r5, r6, lr}
	ldr r0, _080BAA78
	movs r2, #0
	strh r2, [r0]
	ldr r1, _080BAA7C
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _080BAA80
	strb r2, [r0]
	ldr r4, _080BAA84
	ldr r0, [r4]
	movs r1, #0
	strb r2, [r0, #0x19]
	ldr r0, [r4]
	strb r2, [r0, #0x18]
	ldr r0, [r4]
	strb r2, [r0, #0x1a]
	ldr r0, [r4]
	strb r2, [r0, #0x1b]
	ldr r0, [r4]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	bl DisableNationalPokedex
	movs r1, #0
	movs r2, #0
	ldr r3, _080BAA88
	ldr r6, _080BAA8C
	ldr r5, _080BAA90
_080BAA48:
	ldr r0, [r4]
	adds r0, #0x28
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, #0x5c
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, r0, r6
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, r0, r5
	adds r0, r0, r1
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x33
	bls _080BAA48
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA78: .4byte 0x020397F0
_080BAA7C: .4byte 0x020397F2
_080BAA80: .4byte 0x03005E10
_080BAA84: .4byte 0x03005AF0
_080BAA88: .4byte 0x03005AEC
_080BAA8C: .4byte 0x00000988
_080BAA90: .4byte 0x00003B24
	thumb_func_end ResetPokedex

	thumb_func_start ResetPokedexScrollPositions
ResetPokedexScrollPositions: @ 0x080BAA94
	ldr r1, _080BAAA4
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080BAAA8
	movs r0, #0x40
	strb r0, [r1]
	bx lr
	.align 2, 0
_080BAAA4: .4byte 0x020397F0
_080BAAA8: .4byte 0x020397F2
	thumb_func_end ResetPokedexScrollPositions

	thumb_func_start sub_080BAAAC
sub_080BAAAC: @ 0x080BAAAC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080BAAAC

	thumb_func_start ResetPokedexView
ResetPokedexView: @ 0x080BAAC0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r3, #0
	ldr r0, _080BAC34
	adds r7, r0, #0
	movs r1, #2
	rsbs r1, r1, #0
	mov ip, r1
	movs r6, #3
	rsbs r6, r6, #0
	ldr r5, _080BAC38
_080BAAD6:
	lsls r1, r3, #2
	adds r1, r4, r1
	ldrh r0, [r1]
	orrs r0, r7
	strh r0, [r1]
	ldrb r2, [r1, #2]
	mov r0, ip
	ands r0, r2
	ands r0, r6
	strb r0, [r1, #2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r5
	bls _080BAAD6
	movs r2, #0xc1
	lsls r2, r2, #3
	adds r0, r4, r2
	movs r2, #0
	strh r2, [r0]
	ldr r0, _080BAC3C
	adds r3, r4, r0
	ldrb r1, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ldr r1, _080BAC40
	adds r0, r4, r1
	strh r2, [r0]
	ldr r3, _080BAC44
	adds r0, r4, r3
	strh r2, [r0]
	adds r1, #4
	adds r0, r4, r1
	strh r2, [r0]
	adds r3, #4
	adds r0, r4, r3
	strh r2, [r0]
	adds r1, #4
	adds r0, r4, r1
	strh r2, [r0]
	adds r3, #4
	adds r0, r4, r3
	strh r2, [r0]
	adds r1, #4
	adds r0, r4, r1
	strh r2, [r0]
	adds r3, #4
	adds r0, r4, r3
	strh r2, [r0]
	adds r1, #4
	adds r0, r4, r1
	strh r2, [r0]
	movs r3, #0
	ldr r0, _080BAC48
	adds r2, r4, r0
	ldr r1, _080BAC34
	adds r5, r1, #0
_080BAB52:
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r1, [r0]
	orrs r1, r5
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _080BAB52
	movs r2, #0xc5
	lsls r2, r2, #3
	adds r0, r4, r2
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	ldr r3, _080BAC4C
	adds r0, r4, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strb r2, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r2, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r2, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r2, [r0]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r0, r4, r2
	strh r1, [r0]
	adds r3, #3
	adds r0, r4, r3
	strh r1, [r0]
	adds r2, #4
	adds r0, r4, r2
	strh r1, [r0]
	adds r3, #4
	adds r0, r4, r3
	strh r1, [r0]
	adds r2, #4
	adds r0, r4, r2
	strh r1, [r0]
	movs r3, #0
	ldr r0, _080BAC50
	adds r1, r4, r0
	movs r2, #0
_080BABB8:
	lsls r0, r3, #1
	adds r0, r1, r0
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _080BABB8
	ldr r1, _080BAC54
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, _080BAC58
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _080BAC5C
	adds r3, r4, r0
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3]
	ldr r2, _080BAC60
	adds r0, r4, r2
	strb r1, [r0]
	ldr r3, _080BAC64
	adds r0, r4, r3
	strb r1, [r0]
	adds r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	adds r2, #3
	adds r0, r4, r2
	strh r1, [r0]
	movs r3, #0
	ldr r0, _080BAC68
	adds r1, r4, r0
	movs r2, #0
_080BAC0A:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #7
	bls _080BAC0A
	movs r3, #0
	ldr r2, _080BAC6C
	adds r1, r4, r2
	movs r2, #0
_080BAC20:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #7
	bls _080BAC20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAC34: .4byte 0x0000FFFF
_080BAC38: .4byte 0x00000181
_080BAC3C: .4byte 0x0000060A
_080BAC40: .4byte 0x0000060C
_080BAC44: .4byte 0x0000060E
_080BAC48: .4byte 0x0000061E
_080BAC4C: .4byte 0x0000062A
_080BAC50: .4byte 0x0000063A
_080BAC54: .4byte 0x0000064A
_080BAC58: .4byte 0x0000064B
_080BAC5C: .4byte 0x0000064C
_080BAC60: .4byte 0x0000064D
_080BAC64: .4byte 0x0000064E
_080BAC68: .4byte 0x00000654
_080BAC6C: .4byte 0x0000065C
	thumb_func_end ResetPokedexView

	thumb_func_start CB2_Pokedex
CB2_Pokedex: @ 0x080BAC70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _080BAD2C
	movs r1, #0x87
	lsls r1, r1, #3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #1
	beq _080BAD38
	cmp r0, #1
	ble _080BAC94
	cmp r0, #2
	beq _080BAD64
	cmp r0, #3
	bne _080BAC94
	b _080BAE58
_080BAC94:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl sub_080BFF08
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #9
	add r2, sp, #4
	mov r8, r2
	mov r2, sp
	movs r6, #0
	ldr r1, _080BAD30
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _080BAD34
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_080BACBE:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _080BACBE
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r3, ip
	orrs r0, r3
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #4]
	ldr r2, _080BAD30
	mov r1, r8
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _080BAD2C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	b _080BAE88
	.align 2, 0
_080BAD2C: .4byte 0x03002360
_080BAD30: .4byte 0x040000D4
_080BAD34: .4byte 0x81000800
_080BAD38:
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	ldr r1, _080BAD60
	movs r0, #8
	strb r0, [r1]
	bl ResetAllPicSprites
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _080BAE88
	.align 2, 0
_080BAD60: .4byte 0x030030BC
_080BAD64:
	ldr r4, _080BADE4
	ldr r0, _080BADE8
	bl AllocZeroed
	str r0, [r4]
	bl ResetPokedexView
	ldr r0, _080BADEC
	movs r1, #0
	bl CreateTask
	ldr r1, [r4]
	ldr r5, _080BADF0
	ldr r0, [r5]
	ldrb r0, [r0, #0x19]
	ldr r3, _080BADF4
	adds r1, r1, r3
	strh r0, [r1]
	bl IsNationalPokedexEnabled
	adds r1, r0, #0
	cmp r1, #0
	bne _080BAD9A
	ldr r0, [r4]
	ldr r2, _080BADF4
	adds r0, r0, r2
	strh r1, [r0]
_080BAD9A:
	ldr r1, [r4]
	ldr r0, [r5]
	ldrb r2, [r0, #0x18]
	ldr r3, _080BADF8
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _080BADFC
	ldrh r2, [r0]
	subs r3, #8
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _080BAE00
	ldrb r0, [r0]
	ldr r2, _080BAE04
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r3, #0x3f
	adds r0, r0, r3
	movs r1, #0
	strb r1, [r0]
	bl IsNationalPokedexEnabled
	cmp r0, #0
	bne _080BAE0C
	movs r0, #0
	bl GetHoennPokedexCount
	ldr r1, [r4]
	ldr r2, _080BAE08
	adds r1, r1, r2
	strh r0, [r1]
	movs r0, #1
	bl GetHoennPokedexCount
	b _080BAE20
	.align 2, 0
_080BADE4: .4byte 0x020397EC
_080BADE8: .4byte 0x00000664
_080BADEC: .4byte 0x080BAEC9
_080BADF0: .4byte 0x03005AF0
_080BADF4: .4byte 0x00000612
_080BADF8: .4byte 0x00000616
_080BADFC: .4byte 0x020397F0
_080BAE00: .4byte 0x020397F2
_080BAE04: .4byte 0x0000062C
_080BAE08: .4byte 0x0000061A
_080BAE0C:
	movs r0, #0
	bl GetNationalPokedexCount
	ldr r1, [r4]
	ldr r2, _080BAE44
	adds r1, r1, r2
	strh r0, [r1]
	movs r0, #1
	bl GetNationalPokedexCount
_080BAE20:
	ldr r1, [r4]
	ldr r3, _080BAE48
	adds r1, r1, r3
	strh r0, [r1]
	ldr r0, _080BAE4C
	ldr r0, [r0]
	ldr r1, _080BAE50
	adds r0, r0, r1
	movs r1, #8
	strb r1, [r0]
	ldr r1, _080BAE54
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080BAE88
	.align 2, 0
_080BAE44: .4byte 0x0000061A
_080BAE48: .4byte 0x0000061C
_080BAE4C: .4byte 0x020397EC
_080BAE50: .4byte 0x0000062D
_080BAE54: .4byte 0x03002360
_080BAE58:
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _080BAE94
	bl SetVBlankCallback
	ldr r0, _080BAE98
	bl SetMainCallback2
	ldr r0, _080BAE9C
	ldr r1, [r0]
	ldr r3, _080BAEA0
	adds r0, r1, r3
	ldrb r0, [r0]
	ldr r2, _080BAEA4
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_080BC010
	ldr r0, _080BAEA8
	ldr r1, _080BAEAC
	movs r2, #0x80
	bl m4aMPlayVolumeControl
_080BAE88:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE94: .4byte 0x080BAAAD
_080BAE98: .4byte 0x080BAEB1
_080BAE9C: .4byte 0x020397EC
_080BAEA0: .4byte 0x00000612
_080BAEA4: .4byte 0x00000616
_080BAEA8: .4byte 0x030074D0
_080BAEAC: .4byte 0x0000FFFF
	thumb_func_end CB2_Pokedex

	thumb_func_start sub_080BAEB0
sub_080BAEB0: @ 0x080BAEB0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080BAEB0

	thumb_func_start sub_080BAEC8
sub_080BAEC8: @ 0x080BAEC8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080BAF00
	ldr r1, [r0]
	ldr r0, _080BAF04
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	movs r0, #0
	bl sub_080BBC50
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BAEFA
	ldr r0, _080BAF08
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BAF0C
	str r0, [r1]
_080BAEFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAF00: .4byte 0x020397EC
_080BAF04: .4byte 0x0000064C
_080BAF08: .4byte 0x03005B60
_080BAF0C: .4byte 0x080BAF11
	thumb_func_end sub_080BAEC8

	thumb_func_start sub_080BAF10
sub_080BAF10: @ 0x080BAF10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _080BAF44
	ldr r0, [r7]
	ldr r4, _080BAF48
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r3, [r7]
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r4, #0
	ldrsh r2, [r1, r4]
	mov r8, r2
	cmp r2, #0
	beq _080BAF4C
	subs r0, #8
	strh r0, [r1]
	b _080BB142
	.align 2, 0
_080BAF44: .4byte 0x020397EC
_080BAF48: .4byte 0x00000652
_080BAF4C:
	ldr r2, _080BAFC4
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	mov sb, r0
	ands r0, r1
	cmp r0, #0
	beq _080BAFE0
	ldr r1, _080BAFC8
	adds r0, r3, r1
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r3, r0
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080BAFE0
	bl sub_080BD070
	ldr r4, _080BAFCC
	ldr r0, [r7]
	ldr r5, _080BAFD0
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	mov r0, sb
	lsls r0, r1
	mvns r0, r0
	mov r2, r8
	str r2, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, [r7]
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _080BAFD4
	str r1, [r0]
	ldr r1, _080BAFD8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BAFDC
	str r1, [r0]
	movs r0, #0x15
	b _080BB0B2
	.align 2, 0
_080BAFC4: .4byte 0x03002360
_080BAFC8: .4byte 0x0000060E
_080BAFCC: .4byte 0x020205AC
_080BAFD0: .4byte 0x00000626
_080BAFD4: .4byte 0x080BDC11
_080BAFD8: .4byte 0x03005B60
_080BAFDC: .4byte 0x080BB331
_080BAFE0:
	ldrh r2, [r2, #0x2e]
	movs r0, #8
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080BB038
	ldr r3, _080BB024
	ldr r1, [r3]
	ldr r4, _080BB028
	adds r0, r1, r4
	movs r2, #0
	strh r2, [r0]
	ldr r0, _080BB02C
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, #0xca
	lsls r1, r1, #3
	adds r0, r0, r1
	strh r2, [r0]
	ldr r1, _080BB030
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB034
	str r1, [r0]
	movs r0, #5
	bl PlaySE
	b _080BB142
	.align 2, 0
_080BB024: .4byte 0x020397EC
_080BB028: .4byte 0x00000652
_080BB02C: .4byte 0x0000064F
_080BB030: .4byte 0x03005B60
_080BB034: .4byte 0x080BB1B5
_080BB038:
	movs r0, #4
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080BB0DC
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	bl sub_080C07B4
	ldr r1, _080BB0BC
	lsls r3, r6, #2
	adds r3, r3, r6
	lsls r3, r3, #3
	adds r3, r3, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	strh r0, [r3, #8]
	ldr r1, _080BB0C0
	ldr r0, [r1]
	ldr r4, _080BB0C4
	adds r0, r0, r4
	strb r2, [r0]
	ldr r0, [r1]
	ldr r2, _080BB0C8
	adds r1, r0, r2
	ldrb r2, [r1]
	subs r4, #0x24
	adds r1, r0, r4
	strh r2, [r1]
	ldr r2, _080BB0CC
	adds r1, r0, r2
	ldrh r2, [r1]
	subs r4, #0x1a
	adds r1, r0, r4
	strh r2, [r1]
	ldr r2, _080BB0D0
	adds r1, r0, r2
	ldrh r2, [r1]
	adds r4, #4
	adds r1, r0, r4
	strh r2, [r1]
	ldr r2, _080BB0D4
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r4, #4
	adds r0, r0, r4
	strh r1, [r0]
	ldr r0, _080BB0D8
	str r0, [r3]
	movs r0, #2
_080BB0B2:
	bl PlaySE
	bl sub_080BBFCC
	b _080BB142
	.align 2, 0
_080BB0BC: .4byte 0x03005B60
_080BB0C0: .4byte 0x020397EC
_080BB0C4: .4byte 0x0000064E
_080BB0C8: .4byte 0x0000062C
_080BB0CC: .4byte 0x0000060E
_080BB0D0: .4byte 0x00000612
_080BB0D4: .4byte 0x00000616
_080BB0D8: .4byte 0x080BB459
_080BB0DC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080BB114
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _080BB10C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB110
	str r1, [r0]
	movs r0, #3
	bl PlaySE
	b _080BB142
	.align 2, 0
_080BB10C: .4byte 0x03005B60
_080BB110: .4byte 0x080BB525
_080BB114:
	ldr r5, _080BB150
	ldr r0, [r5]
	ldr r4, _080BB154
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #0xe
	bl sub_080BCE3C
	ldr r1, [r5]
	adds r4, r1, r4
	strh r0, [r4]
	ldr r0, _080BB158
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080BB142
	ldr r0, _080BB15C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BB160
	str r0, [r1]
_080BB142:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB150: .4byte 0x020397EC
_080BB154: .4byte 0x0000060E
_080BB158: .4byte 0x0000062E
_080BB15C: .4byte 0x03005B60
_080BB160: .4byte 0x080BB165
	thumb_func_end sub_080BAF10

	thumb_func_start sub_080BB164
sub_080BB164: @ 0x080BB164
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080BB1A0
	ldr r2, [r0]
	ldr r1, _080BB1A4
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r3, _080BB1A8
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r3, #2
	adds r2, r2, r3
	ldrb r2, [r2]
	bl sub_080BCBA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BB198
	ldr r0, _080BB1AC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BB1B0
	str r0, [r1]
_080BB198:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB1A0: .4byte 0x020397EC
_080BB1A4: .4byte 0x0000062F
_080BB1A8: .4byte 0x00000634
_080BB1AC: .4byte 0x03005B60
_080BB1B0: .4byte 0x080BAF11
	thumb_func_end sub_080BB164

	thumb_func_start sub_080BB1B4
sub_080BB1B4: @ 0x080BB1B4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r6, _080BB1E4
	ldr r0, [r6]
	ldr r4, _080BB1E8
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r3, [r6]
	adds r1, r3, r4
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0x50
	beq _080BB1EC
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r1]
	b _080BB324
	.align 2, 0
_080BB1E4: .4byte 0x020397EC
_080BB1E8: .4byte 0x00000652
_080BB1EC:
	ldr r5, _080BB214
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BB294
	movs r2, #0xca
	lsls r2, r2, #3
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, #1
	beq _080BB218
	cmp r0, #1
	ble _080BB25C
	cmp r0, #2
	beq _080BB230
	cmp r0, #3
	beq _080BB270
	b _080BB25C
	.align 2, 0
_080BB214: .4byte 0x03002360
_080BB218:
	ldr r4, _080BB228
	adds r1, r3, r4
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080BB22C
	adds r1, r3, r0
	movs r0, #0x40
	b _080BB248
	.align 2, 0
_080BB228: .4byte 0x0000060E
_080BB22C: .4byte 0x0000062C
_080BB230:
	ldr r1, _080BB264
	adds r2, r3, r1
	ldrh r0, [r2]
	subs r0, #1
	ldr r4, _080BB268
	adds r1, r3, r4
	strh r0, [r1]
	ldrh r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x30
	ldr r2, _080BB26C
	adds r1, r3, r2
_080BB248:
	strb r0, [r1]
	bl sub_080BD1E0
	ldr r0, [r6]
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #0xe
	bl CreateInitialPokemonSprites
	ldrh r1, [r5, #0x2e]
_080BB25C:
	movs r0, #8
	orrs r0, r1
	strh r0, [r5, #0x2e]
	b _080BB294
	.align 2, 0
_080BB264: .4byte 0x0000060C
_080BB268: .4byte 0x0000060E
_080BB26C: .4byte 0x0000062C
_080BB270:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _080BB2BC
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB2C0
	str r1, [r0]
	movs r0, #3
	bl PlaySE
_080BB294:
	ldr r2, _080BB2C4
	ldrh r1, [r2, #0x2e]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080BB2D4
	ldr r0, _080BB2C8
	ldr r0, [r0]
	ldr r3, _080BB2CC
	adds r0, r0, r3
	movs r1, #0
	strb r1, [r0]
	ldr r1, _080BB2BC
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB2D0
	str r1, [r0]
	b _080BB2F2
	.align 2, 0
_080BB2BC: .4byte 0x03005B60
_080BB2C0: .4byte 0x080BB525
_080BB2C4: .4byte 0x03002360
_080BB2C8: .4byte 0x020397EC
_080BB2CC: .4byte 0x0000064F
_080BB2D0: .4byte 0x080BAF11
_080BB2D4:
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080BB300
	ldr r0, _080BB2FC
	ldr r0, [r0]
	movs r4, #0xca
	lsls r4, r4, #3
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, #0
	beq _080BB300
	subs r0, #1
	strh r0, [r1]
_080BB2F2:
	movs r0, #5
	bl PlaySE
	b _080BB324
	.align 2, 0
_080BB2FC: .4byte 0x020397EC
_080BB300:
	ldrh r1, [r2, #0x30]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BB324
	ldr r0, _080BB32C
	ldr r0, [r0]
	movs r2, #0xca
	lsls r2, r2, #3
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #2
	bhi _080BB324
	adds r0, #1
	strh r0, [r1]
	movs r0, #5
	bl PlaySE
_080BB324:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB32C: .4byte 0x020397EC
	thumb_func_end sub_080BB1B4

	thumb_func_start sub_080BB330
sub_080BB330: @ 0x080BB330
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _080BB394
	ldr r5, _080BB398
	ldr r3, [r5]
	ldr r6, _080BB39C
	adds r0, r3, r6
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	cmp r0, #0x30
	bne _080BB38E
	movs r2, #0x22
	ldrsh r0, [r1, r2]
	cmp r0, #0x38
	bne _080BB38E
	ldr r1, _080BB3A0
	adds r0, r3, r1
	ldrb r1, [r0]
	ldr r2, _080BB3A4
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, [r5]
	subs r2, #0x3d
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r1, r1, r6
	ldrb r1, [r1]
	bl sub_080BE0C0
	ldr r2, _080BB3A8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #8]
	ldr r0, _080BB3AC
	str r0, [r1]
_080BB38E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB394: .4byte 0x020205AC
_080BB398: .4byte 0x020397EC
_080BB39C: .4byte 0x00000626
_080BB3A0: .4byte 0x0000064A
_080BB3A4: .4byte 0x0000064B
_080BB3A8: .4byte 0x03005B60
_080BB3AC: .4byte 0x080BB3B1
	thumb_func_end sub_080BB330

	thumb_func_start sub_080BB3B0
sub_080BB3B0: @ 0x080BB3B0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080BB40C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080BB41C
	ldr r5, _080BB410
	ldr r0, [r5]
	ldr r1, _080BB414
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080BB438
	ldrb r0, [r4, #8]
	bl sub_080BE168
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BB438
	bl sub_080BD0D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BB438
	ldr r0, [r5]
	ldr r2, _080BB418
	adds r1, r0, r2
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r1, [r4, #8]
	bl sub_080BE19C
	b _080BB438
	.align 2, 0
_080BB40C: .4byte 0x03005B60
_080BB410: .4byte 0x020397EC
_080BB414: .4byte 0x0000064A
_080BB418: .4byte 0x0000060E
_080BB41C:
	ldr r2, _080BB440
	ldr r0, _080BB444
	ldr r1, [r0]
	ldr r3, _080BB448
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r2, _080BB44C
	ldr r0, _080BB450
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r0, _080BB454
	str r0, [r4]
_080BB438:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB440: .4byte 0x020397F0
_080BB444: .4byte 0x020397EC
_080BB448: .4byte 0x0000060E
_080BB44C: .4byte 0x020397F2
_080BB450: .4byte 0x0000062C
_080BB454: .4byte 0x080BAEC9
	thumb_func_end sub_080BB3B0

	thumb_func_start sub_080BB458
sub_080BB458: @ 0x080BB458
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080BB4A0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r6, r1, r2
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r4, [r0, #4]
	cmp r4, #0
	bne _080BB506
	bl sub_080BD1E0
	ldr r5, _080BB4A4
	ldr r2, [r5]
	ldr r1, _080BB4A8
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BB4B8
	ldr r3, _080BB4AC
	adds r0, r2, r3
	strh r4, [r0]
	ldr r0, _080BB4B0
	adds r1, r2, r0
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _080BB4B4
	b _080BB504
	.align 2, 0
_080BB4A0: .4byte 0x03005B60
_080BB4A4: .4byte 0x020397EC
_080BB4A8: .4byte 0x0000064E
_080BB4AC: .4byte 0x0000060E
_080BB4B0: .4byte 0x0000062C
_080BB4B4: .4byte 0x080BB5AD
_080BB4B8:
	ldr r1, _080BB50C
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r3, _080BB510
	adds r0, r2, r3
	strb r1, [r0]
	ldr r1, [r5]
	movs r2, #0xc2
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrh r2, [r0]
	subs r3, #0x1e
	adds r0, r1, r3
	strh r2, [r0]
	ldr r2, _080BB514
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r3, #4
	adds r1, r1, r3
	strh r0, [r1]
	bl IsNationalPokedexEnabled
	adds r1, r0, #0
	cmp r1, #0
	bne _080BB4F2
	ldr r0, [r5]
	ldr r2, _080BB518
	adds r0, r0, r2
	strh r1, [r0]
_080BB4F2:
	ldr r0, [r5]
	movs r3, #0xc3
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrh r1, [r1]
	ldr r2, _080BB51C
	adds r0, r0, r2
	strh r1, [r0]
	ldr r0, _080BB520
_080BB504:
	str r0, [r6]
_080BB506:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB50C: .4byte 0x0000062A
_080BB510: .4byte 0x0000062C
_080BB514: .4byte 0x00000614
_080BB518: .4byte 0x00000612
_080BB51C: .4byte 0x00000616
_080BB520: .4byte 0x080BAEC9
	thumb_func_end sub_080BB458

	thumb_func_start sub_080BB524
sub_080BB524: @ 0x080BB524
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080BB58C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BB586
	ldr r4, _080BB590
	ldr r0, [r4]
	ldr r5, _080BB594
	ldr r1, [r5]
	ldr r2, _080BB598
	adds r1, r1, r2
	ldrh r1, [r1]
	strb r1, [r0, #0x19]
	bl IsNationalPokedexEnabled
	adds r1, r0, #0
	cmp r1, #0
	bne _080BB554
	ldr r0, [r4]
	strb r1, [r0, #0x19]
_080BB554:
	ldr r1, [r4]
	ldr r0, [r5]
	ldr r2, _080BB59C
	adds r0, r0, r2
	ldrh r0, [r0]
	strb r0, [r1, #0x18]
	bl sub_080BD1E0
	bl sub_080BBFCC
	adds r0, r6, #0
	bl DestroyTask
	ldr r0, _080BB5A0
	bl SetMainCallback2
	ldr r0, _080BB5A4
	ldr r1, _080BB5A8
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	ldr r0, [r5]
	bl Free
_080BB586:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB58C: .4byte 0x02037C74
_080BB590: .4byte 0x03005AF0
_080BB594: .4byte 0x020397EC
_080BB598: .4byte 0x00000612
_080BB59C: .4byte 0x00000616
_080BB5A0: .4byte 0x08085AFD
_080BB5A4: .4byte 0x030074D0
_080BB5A8: .4byte 0x0000FFFF
	thumb_func_end sub_080BB524

	thumb_func_start sub_080BB5AC
sub_080BB5AC: @ 0x080BB5AC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080BB5E4
	ldr r1, [r0]
	ldr r0, _080BB5E8
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
	movs r0, #3
	bl sub_080BBC50
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BB5DC
	ldr r0, _080BB5EC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BB5F0
	str r0, [r1]
_080BB5DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB5E4: .4byte 0x020397EC
_080BB5E8: .4byte 0x0000064C
_080BB5EC: .4byte 0x03005B60
_080BB5F0: .4byte 0x080BB5F5
	thumb_func_end sub_080BB5AC

	thumb_func_start sub_080BB5F4
sub_080BB5F4: @ 0x080BB5F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _080BB620
	ldr r0, [r5]
	ldr r4, _080BB624
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r3, [r5]
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r2, #0
	ldrsh r4, [r1, r2]
	cmp r4, #0
	beq _080BB628
	subs r0, #8
	strh r0, [r1]
	b _080BB7C6
	.align 2, 0
_080BB620: .4byte 0x020397EC
_080BB624: .4byte 0x00000652
_080BB628:
	ldr r2, _080BB690
	ldrh r1, [r2, #0x2e]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080BB6AC
	ldr r1, _080BB694
	adds r0, r3, r1
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r3, r0
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080BB6AC
	bl sub_080BD070
	ldr r3, _080BB698
	ldr r0, [r5]
	ldr r2, _080BB69C
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r0, r2, r3
	ldrb r1, [r0, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	adds r0, r7, #0
	lsls r0, r1
	adds r3, #0x1c
	adds r2, r2, r3
	ldr r1, _080BB6A0
	str r1, [r2]
	mvns r0, r0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _080BB6A4
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB6A8
	str r1, [r0]
	movs r0, #0x15
	b _080BB746
	.align 2, 0
_080BB690: .4byte 0x03002360
_080BB694: .4byte 0x0000060E
_080BB698: .4byte 0x020205AC
_080BB69C: .4byte 0x00000626
_080BB6A0: .4byte 0x080BDC11
_080BB6A4: .4byte 0x03005B60
_080BB6A8: .4byte 0x080BBA11
_080BB6AC:
	ldrh r2, [r2, #0x2e]
	movs r0, #8
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080BB704
	ldr r3, _080BB6F0
	ldr r1, [r3]
	ldr r2, _080BB6F4
	adds r0, r1, r2
	movs r2, #0
	strh r2, [r0]
	ldr r0, _080BB6F8
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, #0xca
	lsls r1, r1, #3
	adds r0, r0, r1
	strh r2, [r0]
	ldr r1, _080BB6FC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB700
	str r1, [r0]
	movs r0, #5
	bl PlaySE
	b _080BB7C6
	.align 2, 0
_080BB6F0: .4byte 0x020397EC
_080BB6F4: .4byte 0x00000652
_080BB6F8: .4byte 0x0000064F
_080BB6FC: .4byte 0x03005B60
_080BB700: .4byte 0x080BB835
_080BB704:
	movs r0, #4
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080BB760
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	bl sub_080C07B4
	ldr r2, _080BB750
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	strh r0, [r1, #8]
	ldr r0, _080BB754
	ldr r0, [r0]
	ldr r3, _080BB758
	adds r0, r0, r3
	strb r2, [r0]
	ldr r0, _080BB75C
	str r0, [r1]
	movs r0, #2
_080BB746:
	bl PlaySE
	bl sub_080BBFCC
	b _080BB7C6
	.align 2, 0
_080BB750: .4byte 0x03005B60
_080BB754: .4byte 0x020397EC
_080BB758: .4byte 0x0000064E
_080BB75C: .4byte 0x080BB459
_080BB760:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080BB798
	movs r0, #1
	rsbs r0, r0, #0
	str r3, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _080BB790
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB794
	str r1, [r0]
	movs r0, #3
	bl PlaySE
	b _080BB7C6
	.align 2, 0
_080BB790: .4byte 0x03005B60
_080BB794: .4byte 0x080BBB19
_080BB798:
	ldr r5, _080BB7D0
	ldr r0, [r5]
	ldr r4, _080BB7D4
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #0xe
	bl sub_080BCE3C
	ldr r1, [r5]
	adds r4, r1, r4
	strh r0, [r4]
	ldr r0, _080BB7D8
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080BB7C6
	ldr r0, _080BB7DC
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BB7E0
	str r0, [r1]
_080BB7C6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB7D0: .4byte 0x020397EC
_080BB7D4: .4byte 0x0000060E
_080BB7D8: .4byte 0x0000062E
_080BB7DC: .4byte 0x03005B60
_080BB7E0: .4byte 0x080BB7E5
	thumb_func_end sub_080BB5F4

	thumb_func_start sub_080BB7E4
sub_080BB7E4: @ 0x080BB7E4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080BB820
	ldr r2, [r0]
	ldr r1, _080BB824
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r3, _080BB828
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r3, #2
	adds r2, r2, r3
	ldrb r2, [r2]
	bl sub_080BCBA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BB818
	ldr r0, _080BB82C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BB830
	str r0, [r1]
_080BB818:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB820: .4byte 0x020397EC
_080BB824: .4byte 0x0000062F
_080BB828: .4byte 0x00000634
_080BB82C: .4byte 0x03005B60
_080BB830: .4byte 0x080BB5F5
	thumb_func_end sub_080BB7E4

	thumb_func_start HandleButtonPress_StartMenu
HandleButtonPress_StartMenu: @ 0x080BB834
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _080BB864
	ldr r0, [r5]
	ldr r4, _080BB868
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r5, [r5]
	adds r1, r5, r4
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x60
	beq _080BB86C
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r1]
	b _080BBA04
	.align 2, 0
_080BB864: .4byte 0x020397EC
_080BB868: .4byte 0x00000652
_080BB86C:
	ldr r0, _080BB890
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080BB87A
	b _080BB974
_080BB87A:
	movs r1, #0xca
	lsls r1, r1, #3
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, #4
	bhi _080BB8FE
	lsls r0, r0, #2
	ldr r1, _080BB894
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BB890: .4byte 0x03002360
_080BB894: .4byte 0x080BB898
_080BB898: @ jump table
	.4byte _080BB8FE @ case 0
	.4byte _080BB8AC @ case 1
	.4byte _080BB8D0 @ case 2
	.4byte _080BB920 @ case 3
	.4byte _080BB950 @ case 4
_080BB8AC:
	ldr r5, _080BB8C4
	ldr r1, [r5]
	ldr r4, _080BB8C8
	adds r2, r1, r4
	movs r0, #0
	strh r0, [r2]
	ldr r2, _080BB8CC
	adds r1, r1, r2
	movs r0, #0x40
	strb r0, [r1]
	b _080BB8EE
	.align 2, 0
_080BB8C4: .4byte 0x020397EC
_080BB8C8: .4byte 0x0000060E
_080BB8CC: .4byte 0x0000062C
_080BB8D0:
	ldr r5, _080BB90C
	ldr r2, [r5]
	ldr r0, _080BB910
	adds r3, r2, r0
	ldrh r0, [r3]
	subs r0, #1
	ldr r4, _080BB914
	adds r1, r2, r4
	strh r0, [r1]
	ldrh r0, [r3]
	lsls r0, r0, #4
	adds r0, #0x30
	ldr r1, _080BB918
	adds r2, r2, r1
	strb r0, [r2]
_080BB8EE:
	bl sub_080BD1E0
	ldr r0, [r5]
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #0xe
	bl CreateInitialPokemonSprites
_080BB8FE:
	ldr r2, _080BB91C
	ldrh r1, [r2, #0x2e]
	movs r0, #8
	orrs r0, r1
	strh r0, [r2, #0x2e]
	b _080BB974
	.align 2, 0
_080BB90C: .4byte 0x020397EC
_080BB910: .4byte 0x0000060C
_080BB914: .4byte 0x0000060E
_080BB918: .4byte 0x0000062C
_080BB91C: .4byte 0x03002360
_080BB920:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _080BB948
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB94C
	str r1, [r0]
	movs r0, #0x34
	bl PlaySE
	b _080BB974
	.align 2, 0
_080BB948: .4byte 0x03005B60
_080BB94C: .4byte 0x080BBB19
_080BB950:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _080BB99C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB9A0
	str r1, [r0]
	movs r0, #3
	bl PlaySE
_080BB974:
	ldr r2, _080BB9A4
	ldrh r1, [r2, #0x2e]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080BB9B4
	ldr r0, _080BB9A8
	ldr r0, [r0]
	ldr r2, _080BB9AC
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldr r1, _080BB99C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BB9B0
	str r1, [r0]
	b _080BB9D2
	.align 2, 0
_080BB99C: .4byte 0x03005B60
_080BB9A0: .4byte 0x080BBBB9
_080BB9A4: .4byte 0x03002360
_080BB9A8: .4byte 0x020397EC
_080BB9AC: .4byte 0x0000064F
_080BB9B0: .4byte 0x080BB5F5
_080BB9B4:
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080BB9E0
	ldr r0, _080BB9DC
	ldr r0, [r0]
	movs r3, #0xca
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, #0
	beq _080BB9E0
	subs r0, #1
	strh r0, [r1]
_080BB9D2:
	movs r0, #5
	bl PlaySE
	b _080BBA04
	.align 2, 0
_080BB9DC: .4byte 0x020397EC
_080BB9E0:
	ldrh r1, [r2, #0x30]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BBA04
	ldr r0, _080BBA0C
	ldr r0, [r0]
	movs r2, #0xca
	lsls r2, r2, #3
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #3
	bhi _080BBA04
	adds r0, #1
	strh r0, [r1]
	movs r0, #5
	bl PlaySE
_080BBA04:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBA0C: .4byte 0x020397EC
	thumb_func_end HandleButtonPress_StartMenu

	thumb_func_start sub_080BBA10
sub_080BBA10: @ 0x080BBA10
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _080BBA7C
	ldr r5, _080BBA80
	ldr r3, [r5]
	ldr r4, _080BBA84
	adds r0, r3, r4
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	cmp r0, #0x30
	bne _080BBA76
	movs r2, #0x22
	ldrsh r0, [r1, r2]
	cmp r0, #0x38
	bne _080BBA76
	ldr r1, _080BBA88
	adds r0, r3, r1
	ldrb r1, [r0]
	ldr r2, _080BBA8C
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, [r5]
	subs r2, #0x3d
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_080BE0C0
	ldr r2, _080BBA90
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r2, _080BBA94
	strh r2, [r0]
	ldr r0, _080BBA98
	str r0, [r1]
_080BBA76:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBA7C: .4byte 0x020205AC
_080BBA80: .4byte 0x020397EC
_080BBA84: .4byte 0x00000626
_080BBA88: .4byte 0x0000064A
_080BBA8C: .4byte 0x0000064B
_080BBA90: .4byte 0x03005B60
_080BBA94: .4byte 0x0000FFFF
_080BBA98: .4byte 0x080BBA9D
	thumb_func_end sub_080BBA10

	thumb_func_start sub_080BBA9C
sub_080BBA9C: @ 0x080BBA9C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080BBAF8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080BBB08
	ldr r5, _080BBAFC
	ldr r0, [r5]
	ldr r1, _080BBB00
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080BBB0C
	ldrb r0, [r4, #8]
	bl sub_080BE168
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BBB0C
	bl sub_080BD0D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BBB0C
	ldr r0, [r5]
	ldr r2, _080BBB04
	adds r1, r0, r2
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r1, [r4, #8]
	bl sub_080BE19C
	b _080BBB0C
	.align 2, 0
_080BBAF8: .4byte 0x03005B60
_080BBAFC: .4byte 0x020397EC
_080BBB00: .4byte 0x0000064A
_080BBB04: .4byte 0x0000060E
_080BBB08:
	ldr r0, _080BBB14
	str r0, [r4]
_080BBB0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB14: .4byte 0x080BB5AD
	thumb_func_end sub_080BBA9C

	thumb_func_start sub_080BBB18
sub_080BBB18: @ 0x080BBB18
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080BBB94
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BBB8C
	ldr r4, _080BBB98
	ldr r0, [r4]
	ldr r2, _080BBB9C
	adds r1, r0, r2
	ldrh r1, [r1]
	ldr r3, _080BBBA0
	adds r0, r0, r3
	strb r1, [r0]
	ldr r1, [r4]
	subs r2, #0x1a
	adds r0, r1, r2
	ldrh r2, [r0]
	subs r3, #0x1e
	adds r0, r1, r3
	strh r2, [r0]
	ldr r2, _080BBBA4
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r3, #4
	adds r1, r1, r3
	strh r0, [r1]
	bl IsNationalPokedexEnabled
	adds r1, r0, #0
	cmp r1, #0
	bne _080BBB66
	ldr r0, [r4]
	ldr r2, _080BBBA8
	adds r0, r0, r2
	strh r1, [r0]
_080BBB66:
	ldr r0, [r4]
	movs r3, #0xc3
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrh r1, [r1]
	ldr r2, _080BBBAC
	adds r0, r0, r2
	strh r1, [r0]
	ldr r1, _080BBBB0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BBBB4
	str r1, [r0]
	bl sub_080BD1E0
	bl sub_080BBFCC
_080BBB8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB94: .4byte 0x02037C74
_080BBB98: .4byte 0x020397EC
_080BBB9C: .4byte 0x0000062A
_080BBBA0: .4byte 0x0000062C
_080BBBA4: .4byte 0x00000614
_080BBBA8: .4byte 0x00000612
_080BBBAC: .4byte 0x00000616
_080BBBB0: .4byte 0x03005B60
_080BBBB4: .4byte 0x080BAEC9
	thumb_func_end sub_080BBB18

	thumb_func_start sub_080BBBB8
sub_080BBBB8: @ 0x080BBBB8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080BBC2C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BBC24
	ldr r4, _080BBC30
	ldr r0, [r4]
	ldr r2, _080BBC34
	adds r1, r0, r2
	ldrh r1, [r1]
	ldr r3, _080BBC38
	adds r0, r0, r3
	strb r1, [r0]
	ldr r1, [r4]
	subs r2, #0x1a
	adds r0, r1, r2
	ldrh r2, [r0]
	subs r3, #0x1e
	adds r0, r1, r3
	strh r2, [r0]
	ldr r2, _080BBC3C
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r3, #4
	adds r1, r1, r3
	strh r0, [r1]
	bl IsNationalPokedexEnabled
	adds r1, r0, #0
	cmp r1, #0
	bne _080BBC06
	ldr r0, [r4]
	ldr r2, _080BBC40
	adds r0, r0, r2
	strh r1, [r0]
_080BBC06:
	ldr r0, [r4]
	movs r3, #0xc3
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrh r1, [r1]
	ldr r2, _080BBC44
	adds r0, r0, r2
	strh r1, [r0]
	ldr r1, _080BBC48
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BBC4C
	str r1, [r0]
_080BBC24:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC2C: .4byte 0x02037C74
_080BBC30: .4byte 0x020397EC
_080BBC34: .4byte 0x0000062A
_080BBC38: .4byte 0x0000062C
_080BBC3C: .4byte 0x00000614
_080BBC40: .4byte 0x00000612
_080BBC44: .4byte 0x00000616
_080BBC48: .4byte 0x03005B60
_080BBC4C: .4byte 0x080BB525
	thumb_func_end sub_080BBBB8

	thumb_func_start sub_080BBC50
sub_080BBC50: @ 0x080BBC50
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080BBC74
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #6
	bhi _080BBC98
	lsls r0, r0, #2
	ldr r1, _080BBC78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BBC74: .4byte 0x03002360
_080BBC78: .4byte 0x080BBC7C
_080BBC7C: @ jump table
	.4byte _080BBC98 @ case 0
	.4byte _080BBE08 @ case 1
	.4byte _080BBE38 @ case 2
	.4byte _080BBE40 @ case 3
	.4byte _080BBEA4 @ case 4
	.4byte _080BBECC @ case 5
	.4byte _080BBF54 @ case 6
_080BBC98:
	ldr r0, _080BBD58
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _080BBCAA
	b _080BBF74
_080BBCAA:
	movs r0, #0
	bl SetVBlankCallback
	ldr r4, _080BBD5C
	ldr r0, [r4]
	ldr r1, _080BBD60
	adds r0, r0, r1
	strb r5, [r0]
	movs r0, #0
	bl sub_080BFF08
	ldr r0, [r4]
	ldr r2, _080BBD64
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080BBD68
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #3
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #2
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #1
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, _080BBD6C
	movs r2, #0x80
	lsls r2, r2, #6
	str r6, [sp]
	movs r0, #3
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080BBD70
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _080BBD74
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	cmp r5, #0
	bne _080BBD7C
	ldr r1, _080BBD78
	movs r3, #0xa0
	lsls r3, r3, #2
	movs r0, #0
	movs r2, #0
	bl CopyToBgTilemapBuffer
	b _080BBD8A
	.align 2, 0
_080BBD58: .4byte 0x02037C74
_080BBD5C: .4byte 0x020397EC
_080BBD60: .4byte 0x0000064A
_080BBD64: .4byte 0x0000062D
_080BBD68: .4byte 0x08539BE8
_080BBD6C: .4byte 0x08537E8C
_080BBD70: .4byte 0x08537804
_080BBD74: .4byte 0x08537954
_080BBD78: .4byte 0x08537660
_080BBD7C:
	ldr r1, _080BBDA4
	movs r3, #0xa0
	lsls r3, r3, #2
	movs r0, #0
	movs r2, #0
	bl CopyToBgTilemapBuffer
_080BBD8A:
	bl ResetPaletteFade
	cmp r5, #0
	bne _080BBDB0
	ldr r3, _080BBDA8
	ldr r1, [r3]
	ldr r0, _080BBDAC
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	b _080BBDBE
	.align 2, 0
_080BBDA4: .4byte 0x08537730
_080BBDA8: .4byte 0x020397EC
_080BBDAC: .4byte 0x0000064C
_080BBDB0:
	ldr r3, _080BBDF8
	ldr r1, [r3]
	ldr r2, _080BBDFC
	adds r1, r1, r2
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
_080BBDBE:
	strb r0, [r1]
	ldr r0, [r3]
	ldr r1, _080BBDFC
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl LoadPokedexBgPalette
	ldr r0, _080BBE00
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _080BBE04
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	b _080BBF74
	.align 2, 0
_080BBDF8: .4byte 0x020397EC
_080BBDFC: .4byte 0x0000064C
_080BBE00: .4byte 0x08539BF8
_080BBE04: .4byte 0x03002360
_080BBE08:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _080BBE2C
	movs r0, #8
	strb r0, [r1]
	ldr r0, _080BBE30
	bl LoadCompressedSpriteSheet
	ldr r0, _080BBE34
	bl LoadSpritePalettes
	adds r0, r5, #0
	bl CreateInterfaceSprites
	b _080BBF34
	.align 2, 0
_080BBE2C: .4byte 0x030030BC
_080BBE30: .4byte 0x08539BBC
_080BBE34: .4byte 0x08539BCC
_080BBE38:
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r3, r2
	b _080BBF3C
_080BBE40:
	cmp r5, #0
	bne _080BBE58
	ldr r0, _080BBE94
	ldr r1, [r0]
	ldr r2, _080BBE98
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, #4
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_080BC010
_080BBE58:
	ldr r4, _080BBE94
	ldr r0, [r4]
	ldr r1, _080BBE9C
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0xe
	bl CreateInitialPokemonSprites
	ldr r0, [r4]
	ldr r2, _080BBEA0
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	adds r2, #3
	adds r0, r0, r2
	strh r1, [r0]
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _080BBF34
	.align 2, 0
_080BBE94: .4byte 0x020397EC
_080BBE98: .4byte 0x00000612
_080BBE9C: .4byte 0x0000060E
_080BBEA0: .4byte 0x0000064F
_080BBEA4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080BBEC4
	bl SetVBlankCallback
	ldr r1, _080BBEC8
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _080BBF3C
	.align 2, 0
_080BBEC4: .4byte 0x080BAAAD
_080BBEC8: .4byte 0x03002360
_080BBECC:
	ldr r1, _080BBF44
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _080BBF48
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
	ldr r1, _080BBF4C
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
_080BBF34:
	ldr r1, _080BBF50
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_080BBF3C:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080BBF74
	.align 2, 0
_080BBF44: .4byte 0x00003F3F
_080BBF48: .4byte 0x00001D3F
_080BBF4C: .4byte 0x00009040
_080BBF50: .4byte 0x03002360
_080BBF54:
	ldr r0, _080BBF70
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080BBF74
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r3, r1
	strb r2, [r0]
	movs r0, #1
	b _080BBF76
	.align 2, 0
_080BBF70: .4byte 0x02037C74
_080BBF74:
	movs r0, #0
_080BBF76:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080BBC50

	thumb_func_start LoadPokedexBgPalette
LoadPokedexBgPalette: @ 0x080BBF80
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080BBF94
	ldr r0, _080BBF90
	b _080BBF9E
	.align 2, 0
_080BBF90: .4byte 0x085374E2
_080BBF94:
	bl IsNationalPokedexEnabled
	cmp r0, #0
	bne _080BBFAC
	ldr r0, _080BBFA8
_080BBF9E:
	movs r1, #1
	movs r2, #0xbe
	bl LoadPalette
	b _080BBFB6
	.align 2, 0
_080BBFA8: .4byte 0x08537422
_080BBFAC:
	ldr r0, _080BBFC8
	movs r1, #1
	movs r2, #0xbe
	bl LoadPalette
_080BBFB6:
	bl GetOverworldTextboxPalettePtr
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080BBFC8: .4byte 0x085375A2
	thumb_func_end LoadPokedexBgPalette

	thumb_func_start sub_080BBFCC
sub_080BBFCC: @ 0x080BBFCC
	push {lr}
	bl FreeAllWindowBuffers
	movs r0, #0
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BBFE0
	bl Free
_080BBFE0:
	movs r0, #1
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BBFEE
	bl Free
_080BBFEE:
	movs r0, #2
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BBFFC
	bl Free
_080BBFFC:
	movs r0, #3
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BC00A
	bl Free
_080BC00A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080BBFCC

	thumb_func_start sub_080BC010
sub_080BC010: @ 0x080BC010
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, _080BC044
	ldr r0, [r0]
	ldr r1, _080BC048
	adds r0, r0, r1
	movs r5, #0
	strh r5, [r0]
	cmp r4, #0
	beq _080BC038
	cmp r4, #1
	beq _080BC04C
_080BC038:
	mov r1, sp
	movs r0, #0xca
	strh r0, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	b _080BC068
	.align 2, 0
_080BC044: .4byte 0x020397EC
_080BC048: .4byte 0x0000060C
_080BC04C:
	bl IsNationalPokedexEnabled
	cmp r0, #0
	beq _080BC060
	mov r0, sp
	movs r1, #0xc1
	lsls r1, r1, #1
	strh r1, [r0]
	strh r5, [r0, #2]
	b _080BC068
_080BC060:
	mov r0, sp
	movs r1, #0xca
	strh r1, [r0]
	strh r4, [r0, #2]
_080BC068:
	cmp r6, #5
	bls _080BC06E
	b _080BC4F0
_080BC06E:
	lsls r0, r6, #2
	ldr r1, _080BC078
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC078: .4byte 0x080BC07C
_080BC07C: @ jump table
	.4byte _080BC094 @ case 0
	.4byte _080BC208 @ case 1
	.4byte _080BC2B4 @ case 2
	.4byte _080BC344 @ case 3
	.4byte _080BC3DC @ case 4
	.4byte _080BC46C @ case 5
_080BC094:
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _080BC13C
	movs r4, #0
	mov r0, sp
	ldrh r0, [r0]
	cmp r4, r0
	blt _080BC0A8
	b _080BC4F0
_080BC0A8:
	mov r5, sp
	ldr r2, _080BC134
	mov r8, r2
	movs r3, #1
	mov sb, r3
_080BC0B2:
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r7, r4, #1
	mov sl, r7
	lsls r0, r7, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	bl SpeciesToNationalPokedexNum
	strh r0, [r5, #4]
	mov r2, r8
	ldr r1, [r2]
	lsls r4, r4, #2
	adds r1, r1, r4
	strh r0, [r1]
	ldrh r0, [r5, #4]
	movs r1, #0
	bl GetSetPokedexFlag
	mov r3, r8
	ldr r2, [r3]
	adds r2, r2, r4
	mov r3, sb
	ands r3, r0
	ldrb r0, [r2, #2]
	movs r7, #2
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #2]
	ldrh r0, [r5, #4]
	movs r1, #1
	bl GetSetPokedexFlag
	mov r1, r8
	ldr r3, [r1]
	adds r3, r3, r4
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	ldrb r0, [r3, #2]
	subs r7, #1
	adds r1, r7, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #2]
	mov r0, r8
	ldr r1, [r0]
	adds r4, r1, r4
	ldrb r0, [r4, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080BC126
	ldr r2, _080BC138
	adds r0, r1, r2
	mov r3, sl
	strh r3, [r0]
_080BC126:
	adds r4, r6, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r7, [r5]
	cmp r0, r7
	blt _080BC0B2
	b _080BC4F0
	.align 2, 0
_080BC134: .4byte 0x020397EC
_080BC138: .4byte 0x0000060C
_080BC13C:
	movs r4, #0
	movs r5, #0
	mov sl, r5
	mov r0, sp
	ldrh r0, [r0]
	cmp r4, r0
	blt _080BC14C
	b _080BC4F0
_080BC14C:
	mov r6, sp
	ldr r0, _080BC200
	mov r8, r0
	movs r1, #1
	mov sb, r1
_080BC156:
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	adds r0, #1
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	movs r1, #0
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	adds r7, r4, #0
	cmp r0, #0
	beq _080BC172
	movs r2, #1
	mov sl, r2
_080BC172:
	mov r3, sl
	cmp r3, #0
	beq _080BC1EE
	mov r4, r8
	ldr r1, [r4]
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	lsls r4, r5, #2
	adds r1, r1, r4
	ldrh r0, [r6, #4]
	strh r0, [r1]
	ldrh r0, [r6, #4]
	movs r1, #0
	bl GetSetPokedexFlag
	mov r1, r8
	ldr r2, [r1]
	adds r2, r2, r4
	mov r3, sb
	ands r3, r0
	mov ip, r3
	ldrb r0, [r2, #2]
	movs r3, #2
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	mov r1, ip
	orrs r0, r1
	strb r0, [r2, #2]
	ldrh r0, [r6, #4]
	movs r1, #1
	bl GetSetPokedexFlag
	mov r2, r8
	ldr r3, [r2]
	adds r3, r3, r4
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	mov ip, r2
	ldrb r0, [r3, #2]
	movs r2, #3
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	mov r1, ip
	orrs r0, r1
	strb r0, [r3, #2]
	mov r3, r8
	ldr r2, [r3]
	adds r4, r2, r4
	ldrb r0, [r4, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080BC1E8
	adds r1, r5, #1
	ldr r4, _080BC204
	adds r0, r2, r4
	strh r1, [r0]
_080BC1E8:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080BC1EE:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r7, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6]
	cmp r0, r2
	blt _080BC156
	b _080BC4F0
	.align 2, 0
_080BC200: .4byte 0x020397EC
_080BC204: .4byte 0x0000060C
_080BC208:
	movs r4, #0
	mov r5, sp
	ldr r3, _080BC2A8
	mov r8, r3
	ldr r6, _080BC2AC
	movs r7, #1
	mov sb, r7
_080BC216:
	ldr r1, _080BC2B0
	lsls r4, r4, #0x10
	asrs r0, r4, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #4]
	ldrh r0, [r5, #4]
	bl NationalToHoennOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r4, #0
	ldrh r1, [r5]
	cmp r0, r1
	bhi _080BC294
	ldrh r0, [r5, #4]
	movs r1, #0
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC294
	mov r3, r8
	ldr r2, [r3]
	adds r3, r2, r6
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r2, r0
	ldrh r1, [r5, #4]
	strh r1, [r0]
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	mov r4, sb
	orrs r0, r4
	strb r0, [r2, #2]
	ldrh r0, [r5, #4]
	movs r1, #1
	bl GetSetPokedexFlag
	mov r1, r8
	ldr r3, [r1]
	adds r1, r3, r6
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r3, r3, r1
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	ldrb r0, [r3, #2]
	movs r4, #3
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #2]
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r6
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080BC294:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r1, r7, r2
	lsrs r4, r1, #0x10
	movs r0, #0xcd
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080BC216
	b _080BC4F0
	.align 2, 0
_080BC2A8: .4byte 0x020397EC
_080BC2AC: .4byte 0x0000060C
_080BC2B0: .4byte 0x08538FF4
_080BC2B4:
	ldr r4, _080BC330
	lsls r0, r4, #0x10
	mov r5, sp
	ldr r7, _080BC334
	ldr r6, _080BC338
_080BC2BE:
	ldr r1, _080BC33C
	asrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #4]
	ldrh r0, [r5, #4]
	bl NationalToHoennOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r5]
	cmp r0, r3
	bhi _080BC31E
	ldrh r0, [r5, #4]
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC31E
	ldr r2, [r7]
	adds r3, r2, r6
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r2, r0
	ldrh r1, [r5, #4]
	strh r1, [r0]
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #2]
	ldr r2, [r7]
	adds r0, r2, r6
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #2]
	ldr r1, [r7]
	adds r1, r1, r6
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080BC31E:
	lsls r0, r4, #0x10
	ldr r4, _080BC340
	adds r0, r0, r4
	lsrs r4, r0, #0x10
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _080BC2BE
	b _080BC4F0
	.align 2, 0
_080BC330: .4byte 0x00000181
_080BC334: .4byte 0x020397EC
_080BC338: .4byte 0x0000060C
_080BC33C: .4byte 0x0853932A
_080BC340: .4byte 0xFFFF0000
_080BC344:
	movs r4, #0
	mov r5, sp
	ldr r7, _080BC3CC
	mov r8, r7
	ldr r6, _080BC3D0
	ldr r0, _080BC3D4
	mov sb, r0
_080BC352:
	ldr r1, _080BC3D8
	lsls r4, r4, #0x10
	asrs r0, r4, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #4]
	ldrh r0, [r5, #4]
	bl NationalToHoennOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r4, #0
	ldrh r1, [r5]
	cmp r0, r1
	bhi _080BC3BA
	ldrh r0, [r5, #4]
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC3BA
	mov r3, r8
	ldr r2, [r3]
	adds r3, r2, r6
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r2, r0
	ldrh r1, [r5, #4]
	strh r1, [r0]
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #2]
	mov r4, r8
	ldr r2, [r4]
	adds r0, r2, r6
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #2]
	ldr r1, [r4]
	adds r1, r1, r6
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080BC3BA:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r7, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	ble _080BC352
	b _080BC4F0
	.align 2, 0
_080BC3CC: .4byte 0x020397EC
_080BC3D0: .4byte 0x0000060C
_080BC3D4: .4byte 0x00000181
_080BC3D8: .4byte 0x0853932A
_080BC3DC:
	ldr r4, _080BC458
	lsls r0, r4, #0x10
	mov r5, sp
	ldr r7, _080BC45C
	ldr r6, _080BC460
_080BC3E6:
	ldr r1, _080BC464
	asrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #4]
	ldrh r0, [r5, #4]
	bl NationalToHoennOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r5]
	cmp r0, r2
	bhi _080BC446
	ldrh r0, [r5, #4]
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC446
	ldr r2, [r7]
	adds r3, r2, r6
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r2, r0
	ldrh r1, [r5, #4]
	strh r1, [r0]
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #2]
	ldr r2, [r7]
	adds r0, r2, r6
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #2]
	ldr r1, [r7]
	adds r1, r1, r6
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080BC446:
	lsls r0, r4, #0x10
	ldr r3, _080BC468
	adds r0, r0, r3
	lsrs r4, r0, #0x10
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _080BC3E6
	b _080BC4F0
	.align 2, 0
_080BC458: .4byte 0x00000181
_080BC45C: .4byte 0x020397EC
_080BC460: .4byte 0x0000060C
_080BC464: .4byte 0x0853962E
_080BC468: .4byte 0xFFFF0000
_080BC46C:
	movs r4, #0
	mov r5, sp
	ldr r7, _080BC554
	mov r8, r7
	ldr r6, _080BC558
	ldr r0, _080BC55C
	mov sb, r0
_080BC47A:
	ldr r1, _080BC560
	lsls r4, r4, #0x10
	asrs r0, r4, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #4]
	ldrh r0, [r5, #4]
	bl NationalToHoennOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r4, #0
	ldrh r1, [r5]
	cmp r0, r1
	bhi _080BC4E2
	ldrh r0, [r5, #4]
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC4E2
	mov r3, r8
	ldr r2, [r3]
	adds r3, r2, r6
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r2, r0
	ldrh r1, [r5, #4]
	strh r1, [r0]
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #2]
	mov r4, r8
	ldr r2, [r4]
	adds r0, r2, r6
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r0, [r2, #2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #2]
	ldr r1, [r4]
	adds r1, r1, r6
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080BC4E2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r7, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	ble _080BC47A
_080BC4F0:
	ldr r1, _080BC554
	ldr r0, [r1]
	ldr r2, _080BC558
	adds r0, r0, r2
	ldrh r4, [r0]
	lsls r3, r4, #0x10
	asrs r0, r3, #0x10
	ldr r2, _080BC55C
	cmp r0, r2
	bgt _080BC544
	adds r5, r1, #0
	movs r4, #2
	rsbs r4, r4, #0
	mov sb, r4
	movs r7, #3
	rsbs r7, r7, #0
	mov r8, r7
	adds r7, r2, #0
	ldr r0, _080BC564
	adds r6, r0, #0
_080BC518:
	ldr r1, [r5]
	asrs r3, r3, #0x10
	lsls r4, r3, #2
	adds r1, r1, r4
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	ldrb r2, [r1, #2]
	mov r0, sb
	ands r0, r2
	strb r0, [r1, #2]
	ldr r1, [r5]
	adds r1, r1, r4
	ldrb r2, [r1, #2]
	mov r0, r8
	ands r0, r2
	strb r0, [r1, #2]
	adds r3, #1
	lsls r3, r3, #0x10
	asrs r0, r3, #0x10
	cmp r0, r7
	ble _080BC518
_080BC544:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC554: .4byte 0x020397EC
_080BC558: .4byte 0x0000060C
_080BC55C: .4byte 0x00000181
_080BC560: .4byte 0x0853962E
_080BC564: .4byte 0x0000FFFF
	thumb_func_end sub_080BC010

	thumb_func_start PrintMonDexNumAndName
PrintMonDexNumAndName: @ 0x080BC568
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	mov r8, r3
	ldr r3, [sp, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	add r4, sp, #0x14
	movs r6, #0
	strb r6, [r4]
	adds r5, r4, #0
	movs r4, #0xf
	strb r4, [r5, #1]
	movs r4, #3
	strb r4, [r5, #2]
	mov r4, r8
	lsls r4, r4, #0x1b
	lsrs r4, r4, #0x18
	mov r8, r4
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r6, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r2, r8
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PrintMonDexNumAndName

	thumb_func_start CreateMonListEntry
CreateMonListEntry: @ 0x080BC5C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	cmp r0, #1
	beq _080BC6B8
	cmp r0, #1
	ble _080BC5E4
	cmp r0, #2
	bne _080BC5E4
	b _080BC7B0
_080BC5E4:
	subs r0, r1, #5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0
	mov sb, r0
_080BC5EE:
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	mov sl, r0
	ldr r1, _080BC620
	cmp r5, r1
	bhi _080BC60E
	ldr r2, _080BC624
	mov r8, r2
	ldr r0, [r2]
	mov r3, sl
	asrs r6, r3, #0xe
	adds r0, r0, r6
	ldrh r0, [r0]
	ldr r1, _080BC628
	cmp r0, r1
	bne _080BC62C
_080BC60E:
	mov r2, sb
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x18
	movs r0, #0x11
	adds r2, r7, #0
	bl sub_080BCA2C
	b _080BC6A0
	.align 2, 0
_080BC620: .4byte 0x00000181
_080BC624: .4byte 0x020397EC
_080BC628: .4byte 0x0000FFFF
_080BC62C:
	mov r3, sb
	lsls r0, r3, #0x19
	lsrs r4, r0, #0x18
	movs r0, #0x11
	adds r1, r4, #0
	adds r2, r7, #0
	bl sub_080BCA2C
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080BC67E
	adds r0, r5, #0
	movs r1, #0x12
	adds r2, r4, #0
	adds r3, r7, #0
	bl CreateMonDexNum
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r6
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	movs r1, #0x11
	adds r2, r4, #0
	adds r3, r7, #0
	bl CreateCaughtBall
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r1, #0x17
	adds r2, r4, #0
	bl sub_080BC978
	b _080BC6A0
_080BC67E:
	adds r0, r5, #0
	movs r1, #0x12
	adds r2, r4, #0
	adds r3, r7, #0
	bl CreateMonDexNum
	movs r0, #0
	movs r1, #0x11
	adds r2, r4, #0
	adds r3, r7, #0
	bl CreateCaughtBall
	movs r0, #0
	movs r1, #0x17
	adds r2, r4, #0
	bl sub_080BC978
_080BC6A0:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, sl
	lsrs r1, r0, #0x10
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0xa
	bls _080BC5EE
	b _080BC87A
_080BC6B8:
	subs r0, r1, #5
	lsls r1, r0, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _080BC6E8
	ldr r2, _080BC6EC
	cmp r5, r0
	bhi _080BC6D6
	adds r6, r2, #0
	ldr r3, [r6]
	asrs r4, r1, #0xe
	adds r0, r3, r4
	ldrh r1, [r0]
	ldr r0, _080BC6F0
	cmp r1, r0
	bne _080BC6F4
_080BC6D6:
	ldr r0, [r2]
	movs r1, #0xc6
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #0x19
	b _080BC7EE
	.align 2, 0
_080BC6E8: .4byte 0x00000181
_080BC6EC: .4byte 0x020397EC
_080BC6F0: .4byte 0x0000FFFF
_080BC6F4:
	movs r1, #0xc6
	lsls r1, r1, #3
	adds r0, r3, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x18
	movs r0, #0x11
	adds r2, r7, #0
	bl sub_080BCA2C
	ldr r1, [r6]
	adds r0, r1, r4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080BC764
	movs r3, #0xc6
	lsls r3, r3, #3
	adds r0, r1, r3
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	movs r1, #0x12
	adds r3, r7, #0
	bl CreateMonDexNum
	ldr r1, [r6]
	adds r0, r1, r4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r1, r1, r2
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	movs r1, #0x11
	adds r3, r7, #0
	bl CreateCaughtBall
	ldr r1, [r6]
	adds r0, r1, r4
	ldrh r0, [r0]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r1, r1, r2
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	b _080BC7A8
_080BC764:
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r0, r1, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	movs r1, #0x12
	adds r3, r7, #0
	bl CreateMonDexNum
	ldr r0, [r6]
	movs r1, #0xc6
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x11
	adds r3, r7, #0
	bl CreateCaughtBall
	ldr r0, [r6]
	movs r1, #0xc6
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	movs r0, #0
_080BC7A8:
	movs r1, #0x17
	bl sub_080BC978
	b _080BC87A
_080BC7B0:
	adds r0, r1, #5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080BC7FC
	mov r8, r0
	ldr r3, [r0]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r0, r3, r2
	ldrh r0, [r0]
	adds r0, #0xa
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _080BC7D6
	adds r0, r2, #0
	subs r0, #0x10
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080BC7D6:
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _080BC800
	cmp r5, r0
	bhi _080BC7EC
	asrs r6, r1, #0xe
	adds r0, r3, r6
	ldrh r1, [r0]
	ldr r0, _080BC804
	cmp r1, r0
	bne _080BC808
_080BC7EC:
	lsls r1, r2, #0x19
_080BC7EE:
	lsrs r1, r1, #0x18
	movs r0, #0x11
	adds r2, r7, #0
	bl sub_080BCA2C
	b _080BC87A
	.align 2, 0
_080BC7FC: .4byte 0x020397EC
_080BC800: .4byte 0x00000181
_080BC804: .4byte 0x0000FFFF
_080BC808:
	lsls r0, r2, #0x19
	lsrs r4, r0, #0x18
	movs r0, #0x11
	adds r1, r4, #0
	adds r2, r7, #0
	bl sub_080BCA2C
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r6
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080BC858
	adds r0, r5, #0
	movs r1, #0x12
	adds r2, r4, #0
	adds r3, r7, #0
	bl CreateMonDexNum
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	movs r1, #0x11
	adds r2, r4, #0
	adds r3, r7, #0
	bl CreateCaughtBall
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r1, #0x17
	adds r2, r4, #0
	bl sub_080BC978
	b _080BC87A
_080BC858:
	adds r0, r5, #0
	movs r1, #0x12
	adds r2, r4, #0
	adds r3, r7, #0
	bl CreateMonDexNum
	movs r0, #0
	movs r1, #0x11
	adds r2, r4, #0
	adds r3, r7, #0
	bl CreateCaughtBall
	movs r0, #0
	movs r1, #0x17
	adds r2, r4, #0
	bl sub_080BC978
_080BC87A:
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end CreateMonListEntry

	thumb_func_start CreateMonDexNum
CreateMonDexNum: @ 0x080BC890
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r1, _080BC924
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r0, _080BC928
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r4, r0, r4
	ldrh r6, [r4]
	ldr r1, _080BC92C
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080BC8D0
	adds r0, r6, #0
	bl NationalToHoennOrder
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080BC8D0:
	add r4, sp, #4
	adds r0, r6, #0
	movs r1, #0x64
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r4, #2]
	add r5, sp, #4
	adds r0, r6, #0
	movs r1, #0x64
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r5, #3]
	add r5, sp, #4
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r5, #4]
	str r7, [sp]
	movs r0, #0
	movs r1, #1
	add r2, sp, #4
	mov r3, r8
	bl PrintMonDexNumAndName
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC924: .4byte 0x08539C08
_080BC928: .4byte 0x020397EC
_080BC92C: .4byte 0x00000612
	thumb_func_end CreateMonDexNum

	thumb_func_start CreateCaughtBall
CreateCaughtBall: @ 0x080BC930
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r0, #0
	beq _080BC95C
	ldr r1, _080BC958
	lsls r2, r3, #3
	lsls r3, r4, #3
	movs r0, #8
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	bl BlitBitmapToWindow
	b _080BC970
	.align 2, 0
_080BC958: .4byte 0x08539C0E
_080BC95C:
	lsls r2, r3, #3
	lsls r3, r4, #3
	movs r0, #8
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelRect
_080BC970:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CreateCaughtBall

	thumb_func_start sub_080BC978
sub_080BC978: @ 0x080BC978
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r4, #0
	movs r1, #0
_080BC992:
	mov r0, sp
	adds r0, r0, r4
	adds r0, #4
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _080BC992
	add r0, sp, #4
	movs r1, #0xff
	strb r1, [r0, #5]
	adds r0, r5, #0
	bl NationalPokedexNumToSpecies
	adds r5, r0, #0
	cmp r5, #0
	beq _080BC9F8
	movs r4, #0
	ldr r1, _080BC9F4
	lsls r3, r5, #1
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080BCA0E
	adds r6, r1, #0
_080BC9CA:
	mov r2, sp
	adds r2, r2, r4
	adds r2, #4
	adds r1, r3, r5
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r1, r4, r1
	adds r1, r1, r6
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080BCA0E
	cmp r4, #9
	bls _080BC9CA
	b _080BCA0E
	.align 2, 0
_080BC9F4: .4byte 0x082EA31C
_080BC9F8:
	movs r4, #0
	movs r1, #0xae
_080BC9FC:
	mov r0, sp
	adds r0, r0, r4
	adds r0, #4
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _080BC9FC
_080BCA0E:
	str r7, [sp]
	movs r0, #0
	movs r1, #1
	add r2, sp, #4
	mov r3, r8
	bl PrintMonDexNumAndName
	adds r0, r4, #0
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080BC978

	thumb_func_start sub_080BCA2C
sub_080BCA2C: @ 0x080BCA2C
	push {lr}
	sub sp, #8
	adds r2, r0, #0
	adds r3, r1, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x15
	lsrs r3, r3, #0x15
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelRect
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080BCA2C

	thumb_func_start CreateInitialPokemonSprites
CreateInitialPokemonSprites: @ 0x080BCA54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r2, _080BCB7C
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	movs r2, #0
	ldr r7, _080BCB80
	adds r5, r7, #0
	ldr r4, _080BCB84
	ldr r0, _080BCB88
	adds r3, r0, #0
_080BCA7A:
	ldr r1, [r5]
	lsls r0, r2, #1
	adds r1, r1, r4
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080BCA7A
	ldr r0, [r7]
	ldr r1, _080BCB8C
	adds r0, r0, r1
	ldr r1, _080BCB88
	strh r1, [r0]
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetPokemonSpriteToDisplay
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080BCB88
	cmp r0, r4
	beq _080BCAD4
	movs r1, #0x60
	movs r2, #0x50
	bl sub_080BD26C
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080BCB90
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r1, r0, r1
	ldr r2, _080BCB94
	str r2, [r1]
	adds r0, r0, r3
	ldr r1, _080BCB98
	strh r1, [r0, #0x38]
_080BCAD4:
	adds r0, r6, #0
	bl GetPokemonSpriteToDisplay
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	beq _080BCB06
	movs r1, #0x60
	movs r2, #0x50
	bl sub_080BD26C
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080BCB90
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r1, r0, r1
	ldr r2, _080BCB94
	str r2, [r1]
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x38]
_080BCB06:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetPokemonSpriteToDisplay
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	beq _080BCB3C
	movs r1, #0x60
	movs r2, #0x50
	bl sub_080BD26C
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080BCB90
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r1, r0, r1
	ldr r2, _080BCB94
	str r2, [r1]
	adds r0, r0, r3
	movs r1, #0x20
	strh r1, [r0, #0x38]
_080BCB3C:
	movs r0, #0
	adds r1, r6, #0
	mov r2, r8
	bl CreateMonListEntry
	ldr r0, [r7]
	ldr r2, _080BCB9C
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, [r7]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r1, r0, r2
	movs r2, #0
	strh r2, [r1]
	ldr r1, _080BCBA0
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, _080BCB7C
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCB7C: .4byte 0x02037C74
_080BCB80: .4byte 0x020397EC
_080BCB84: .4byte 0x0000061E
_080BCB88: .4byte 0x0000FFFF
_080BCB8C: .4byte 0x00000626
_080BCB90: .4byte 0x020205AC
_080BCB94: .4byte 0x080BDC81
_080BCB98: .4byte 0x0000FFE0
_080BCB9C: .4byte 0x0000062D
_080BCBA0: .4byte 0x00000632
	thumb_func_end CreateInitialPokemonSprites

	thumb_func_start sub_080BCBA4
sub_080BCBA4: @ 0x080BCBA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _080BCBD8
	ldr r1, [r0]
	ldr r3, _080BCBDC
	adds r2, r1, r3
	ldrb r3, [r2]
	adds r7, r0, #0
	cmp r3, #0
	bne _080BCBC8
	b _080BCD18
_080BCBC8:
	subs r0, r3, #1
	strb r0, [r2]
	cmp r4, #1
	beq _080BCBE0
	cmp r4, #2
	beq _080BCC7C
	b _080BCCF8
	.align 2, 0
_080BCBD8: .4byte 0x020397EC
_080BCBDC: .4byte 0x0000062E
_080BCBE0:
	movs r3, #0
	ldr r4, _080BCC60
	mov ip, r4
	ldr r0, _080BCC64
	mov r8, r0
	adds r2, r7, #0
_080BCBEC:
	ldr r0, [r2]
	lsls r1, r3, #1
	ldr r4, _080BCC68
	adds r0, r0, r4
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, ip
	beq _080BCC0A
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrh r0, [r1, #0x38]
	adds r0, r0, r5
	strh r0, [r1, #0x38]
_080BCC0A:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _080BCBEC
	ldr r4, [r7]
	ldr r1, _080BCC6C
	adds r0, r4, r1
	ldrb r0, [r0]
	subs r0, r6, r0
	lsls r0, r0, #4
	adds r1, r6, #0
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, _080BCC70
	adds r0, r4, r3
	ldr r1, _080BCC74
	adds r4, r4, r1
	movs r3, #0
	ldrsh r1, [r4, r3]
	lsls r1, r1, #4
	ldrb r0, [r0]
	adds r1, r1, r0
	subs r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, [r7]
	ldr r4, _080BCC78
	adds r2, r0, r4
	movs r1, #0xc5
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r1, [r0]
	ldrb r0, [r2]
	subs r0, r0, r1
	strb r0, [r2]
	b _080BCCF8
	.align 2, 0
_080BCC60: .4byte 0x0000FFFF
_080BCC64: .4byte 0x020205AC
_080BCC68: .4byte 0x0000061E
_080BCC6C: .4byte 0x0000062E
_080BCC70: .4byte 0x0000062D
_080BCC74: .4byte 0x00000632
_080BCC78: .4byte 0x0000062C
_080BCC7C:
	movs r3, #0
	ldr r2, _080BCCFC
	mov ip, r2
	ldr r4, _080BCD00
	mov r8, r4
	adds r2, r7, #0
_080BCC88:
	ldr r0, [r2]
	lsls r1, r3, #1
	ldr r4, _080BCD04
	adds r0, r0, r4
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, ip
	beq _080BCCA6
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrh r0, [r1, #0x38]
	subs r0, r0, r5
	strh r0, [r1, #0x38]
_080BCCA6:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _080BCC88
	ldr r4, [r7]
	ldr r1, _080BCD08
	adds r0, r4, r1
	ldrb r0, [r0]
	subs r0, r6, r0
	lsls r0, r0, #4
	adds r1, r6, #0
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, _080BCD0C
	adds r0, r4, r3
	ldr r1, _080BCD10
	adds r4, r4, r1
	movs r3, #0
	ldrsh r1, [r4, r3]
	lsls r1, r1, #4
	ldrb r0, [r0]
	adds r1, r1, r0
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, [r7]
	ldr r4, _080BCD14
	adds r1, r0, r4
	movs r2, #0xc5
	lsls r2, r2, #3
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
_080BCCF8:
	movs r0, #0
	b _080BCD38
	.align 2, 0
_080BCCFC: .4byte 0x0000FFFF
_080BCD00: .4byte 0x020205AC
_080BCD04: .4byte 0x0000061E
_080BCD08: .4byte 0x0000062E
_080BCD0C: .4byte 0x0000062D
_080BCD10: .4byte 0x00000632
_080BCD14: .4byte 0x0000062C
_080BCD18:
	ldr r4, _080BCD44
	adds r2, r1, r4
	movs r3, #0xc6
	lsls r3, r3, #3
	adds r0, r1, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r1, r1, #4
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	movs r0, #1
_080BCD38:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BCD44: .4byte 0x0000062D
	thumb_func_end sub_080BCBA4

	thumb_func_start CreateNewPokemonSprite
CreateNewPokemonSprite: @ 0x080BCD48
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r4, _080BCD70
	ldr r0, [r4]
	movs r5, #0xc6
	lsls r5, r5, #3
	adds r1, r0, r5
	ldrh r1, [r1]
	ldr r6, _080BCD74
	adds r0, r0, r6
	strh r1, [r0]
	cmp r2, #1
	beq _080BCD78
	cmp r2, #2
	beq _080BCDD8
	b _080BCE34
	.align 2, 0
_080BCD70: .4byte 0x020397EC
_080BCD74: .4byte 0x00000632
_080BCD78:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetPokemonSpriteToDisplay
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080BCDC4
	cmp r1, r0
	beq _080BCDB2
	adds r0, r1, #0
	movs r1, #0x60
	movs r2, #0x50
	bl sub_080BD26C
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080BCDC8
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r1, r0, r1
	ldr r2, _080BCDCC
	str r2, [r1]
	adds r0, r0, r3
	ldr r1, _080BCDD0
	strh r1, [r0, #0x38]
_080BCDB2:
	ldr r0, [r4]
	adds r1, r0, r5
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _080BCDD4
	subs r0, r2, #1
	b _080BCE32
	.align 2, 0
_080BCDC4: .4byte 0x0000FFFF
_080BCDC8: .4byte 0x020205AC
_080BCDCC: .4byte 0x080BDC81
_080BCDD0: .4byte 0x0000FFC0
_080BCDD4:
	movs r0, #0xf
	b _080BCE32
_080BCDD8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetPokemonSpriteToDisplay
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080BCE24
	cmp r1, r0
	beq _080BCE12
	adds r0, r1, #0
	movs r1, #0x60
	movs r2, #0x50
	bl sub_080BD26C
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080BCE28
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r1, r0, r1
	ldr r2, _080BCE2C
	str r2, [r1]
	adds r0, r0, r3
	movs r1, #0x40
	strh r1, [r0, #0x38]
_080BCE12:
	ldr r0, [r4]
	adds r1, r0, r5
	ldrh r2, [r1]
	movs r6, #0
	ldrsh r0, [r1, r6]
	cmp r0, #0xe
	bgt _080BCE30
	adds r0, r2, #1
	b _080BCE32
	.align 2, 0
_080BCE24: .4byte 0x0000FFFF
_080BCE28: .4byte 0x020205AC
_080BCE2C: .4byte 0x080BDC81
_080BCE30:
	movs r0, #0
_080BCE32:
	strh r0, [r1]
_080BCE34:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateNewPokemonSprite

	thumb_func_start sub_080BCE3C
sub_080BCE3C: @ 0x080BCE3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r0, #0
	mov sl, r0
	ldr r2, _080BCE90
	ldrh r1, [r2, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080BCE9C
	cmp r7, #0
	beq _080BCE9C
	movs r1, #1
	mov sl, r1
	ldr r0, _080BCE94
	ldr r0, [r0]
	ldr r2, _080BCE98
	adds r0, r0, r2
	ldrh r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	adds r1, r7, #0
	movs r2, #0
	bl sub_080C0364
	adds r7, r0, #0
	movs r0, #1
	adds r1, r7, #0
	bl CreateNewPokemonSprite
	movs r0, #1
	b _080BCED4
	.align 2, 0
_080BCE90: .4byte 0x03002360
_080BCE94: .4byte 0x020397EC
_080BCE98: .4byte 0x0000060C
_080BCE9C:
	ldrh r1, [r2, #0x2c]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BCEEC
	ldr r0, _080BCEE4
	ldr r0, [r0]
	ldr r3, _080BCEE8
	adds r0, r0, r3
	ldrh r0, [r0]
	subs r0, #1
	cmp r7, r0
	bge _080BCEEC
	movs r1, #2
	mov sl, r1
	lsls r3, r0, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_080C0364
	adds r7, r0, #0
	movs r0, #2
	adds r1, r7, #0
	bl CreateNewPokemonSprite
	movs r0, #2
_080BCED4:
	adds r1, r7, #0
	adds r2, r4, #0
	bl CreateMonListEntry
	movs r0, #0x6c
	bl PlaySE
	b _080BCFBA
	.align 2, 0
_080BCEE4: .4byte 0x020397EC
_080BCEE8: .4byte 0x0000060C
_080BCEEC:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080BCF54
	cmp r7, #0
	beq _080BCF54
	adds r6, r7, #0
	movs r4, #0
_080BCEFE:
	ldr r5, _080BCF48
	ldr r0, [r5]
	ldr r2, _080BCF4C
	adds r0, r0, r2
	ldrh r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	adds r1, r7, #0
	movs r2, #0
	bl sub_080C0364
	adds r7, r0, #0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080BCEFE
	ldr r1, [r5]
	ldr r3, _080BCF50
	adds r1, r1, r3
	subs r0, r7, r6
	lsls r0, r0, #4
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	bl sub_080BD1E0
	adds r0, r7, #0
	movs r1, #0xe
	bl CreateInitialPokemonSprites
	movs r0, #0x6d
	bl PlaySE
	b _080BCFBA
	.align 2, 0
_080BCF48: .4byte 0x020397EC
_080BCF4C: .4byte 0x0000060C
_080BCF50: .4byte 0x0000062C
_080BCF54:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BCFBA
	ldr r0, _080BCFD0
	ldr r0, [r0]
	ldr r3, _080BCFD4
	adds r0, r0, r3
	ldrh r0, [r0]
	subs r0, #1
	cmp r7, r0
	bge _080BCFBA
	adds r6, r7, #0
	movs r4, #0
_080BCF72:
	ldr r5, _080BCFD0
	ldr r0, [r5]
	ldr r1, _080BCFD4
	adds r0, r0, r1
	ldrh r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_080C0364
	adds r7, r0, #0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080BCF72
	ldr r1, [r5]
	ldr r2, _080BCFD8
	adds r1, r1, r2
	subs r0, r7, r6
	lsls r0, r0, #4
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	bl sub_080BD1E0
	adds r0, r7, #0
	movs r1, #0xe
	bl CreateInitialPokemonSprites
	movs r0, #0x6d
	bl PlaySE
_080BCFBA:
	mov r0, sl
	cmp r0, #0
	bne _080BCFDC
	ldr r0, _080BCFD0
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, sl
	strh r2, [r0]
	b _080BD042
	.align 2, 0
_080BCFD0: .4byte 0x020397EC
_080BCFD4: .4byte 0x0000060C
_080BCFD8: .4byte 0x0000062C
_080BCFDC:
	ldr r1, _080BD054
	ldr r6, _080BD058
	ldr r2, [r6]
	movs r3, #0xc7
	lsls r3, r3, #3
	mov sb, r3
	adds r0, r2, r3
	ldrh r0, [r0]
	lsrs r0, r0, #2
	adds r1, r0, r1
	ldrb r5, [r1]
	ldr r1, _080BD05C
	adds r0, r0, r1
	ldrb r3, [r0]
	ldr r0, _080BD060
	adds r2, r2, r0
	strb r3, [r2]
	ldr r1, [r6]
	ldr r2, _080BD064
	mov r8, r2
	adds r0, r1, r2
	strh r3, [r0]
	ldr r4, _080BD068
	adds r0, r1, r4
	strh r5, [r0]
	ldr r3, _080BD06C
	adds r1, r1, r3
	mov r0, sl
	strb r0, [r1]
	ldr r2, [r6]
	lsrs r5, r5, #1
	movs r1, #0xc5
	lsls r1, r1, #3
	adds r0, r2, r1
	strh r5, [r0]
	adds r3, r2, r3
	ldrb r0, [r3]
	adds r4, r2, r4
	ldrb r1, [r4]
	add r2, r8
	ldrb r2, [r2]
	bl sub_080BCBA4
	ldr r0, [r6]
	mov r2, sb
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0xb
	bhi _080BD042
	adds r0, #1
	strh r0, [r1]
_080BD042:
	adds r0, r7, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BD054: .4byte 0x08539BDC
_080BD058: .4byte 0x020397EC
_080BD05C: .4byte 0x08539BE1
_080BD060: .4byte 0x0000062E
_080BD064: .4byte 0x00000636
_080BD068: .4byte 0x00000634
_080BD06C: .4byte 0x0000062F
	thumb_func_end sub_080BCE3C

	thumb_func_start sub_080BD070
sub_080BD070: @ 0x080BD070
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r0, _080BD0BC
	mov ip, r0
	ldr r6, _080BD0C0
	ldr r5, _080BD0C4
_080BD07C:
	mov r1, ip
	ldr r3, [r1]
	lsls r1, r4, #1
	ldr r2, _080BD0C8
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r6
	movs r7, #0x24
	ldrsh r0, [r1, r7]
	cmp r0, #0
	bne _080BD0AC
	movs r7, #0x26
	ldrsh r0, [r1, r7]
	cmp r0, #0
	bne _080BD0AC
	cmp r2, r5
	beq _080BD0AC
	ldr r1, _080BD0CC
	adds r0, r3, r1
	strh r2, [r0]
_080BD0AC:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _080BD07C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD0BC: .4byte 0x020397EC
_080BD0C0: .4byte 0x020205AC
_080BD0C4: .4byte 0x0000FFFF
_080BD0C8: .4byte 0x0000061E
_080BD0CC: .4byte 0x00000626
	thumb_func_end sub_080BD070

	thumb_func_start sub_080BD0D0
sub_080BD0D0: @ 0x080BD0D0
	push {r4, r5, r6, lr}
	ldr r3, _080BD130
	ldr r0, [r3]
	ldr r1, _080BD134
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r2, _080BD138
	ldrh r1, [r2, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080BD158
	cmp r4, #0
	beq _080BD158
	adds r2, r4, #0
	adds r5, r3, #0
_080BD0F0:
	ldr r0, [r5]
	ldr r1, _080BD13C
	adds r0, r0, r1
	ldrh r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	adds r1, r2, #0
	movs r2, #0
	bl sub_080C0364
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080BD140
	cmp r2, #0
	bne _080BD0F0
_080BD11E:
	ldr r0, _080BD130
	ldr r1, [r0]
	ldr r0, _080BD134
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r4
	bne _080BD144
	b _080BD1D8
	.align 2, 0
_080BD130: .4byte 0x020397EC
_080BD134: .4byte 0x0000060E
_080BD138: .4byte 0x03002360
_080BD13C: .4byte 0x0000060C
_080BD140:
	adds r4, r2, #0
	b _080BD11E
_080BD144:
	strh r4, [r2]
	ldr r0, _080BD150
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x10
	b _080BD1C0
	.align 2, 0
_080BD150: .4byte 0x0000062C
_080BD154:
	adds r4, r2, #0
	b _080BD1A8
_080BD158:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BD1D8
	ldr r0, [r3]
	ldr r1, _080BD1C8
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _080BD1D8
	adds r2, r4, #0
	adds r6, r3, #0
	adds r5, r1, #0
_080BD176:
	ldr r0, [r6]
	adds r0, r0, r5
	ldrh r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0
	adds r1, r2, #0
	movs r2, #0
	bl sub_080C0364
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, [r6]
	lsls r0, r2, #2
	adds r0, r1, r0
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080BD154
	adds r0, r1, r5
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _080BD176
_080BD1A8:
	ldr r0, _080BD1CC
	ldr r1, [r0]
	ldr r0, _080BD1D0
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r4
	beq _080BD1D8
	strh r4, [r2]
	ldr r0, _080BD1D4
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #0x10
_080BD1C0:
	strb r0, [r1]
	movs r0, #1
	b _080BD1DA
	.align 2, 0
_080BD1C8: .4byte 0x0000060C
_080BD1CC: .4byte 0x020397EC
_080BD1D0: .4byte 0x0000060E
_080BD1D4: .4byte 0x0000062C
_080BD1D8:
	movs r0, #0
_080BD1DA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080BD0D0

	thumb_func_start sub_080BD1E0
sub_080BD1E0: @ 0x080BD1E0
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r6, _080BD220
	ldr r7, _080BD224
_080BD1E8:
	ldr r0, [r6]
	lsls r4, r5, #1
	ldr r1, _080BD228
	adds r0, r0, r1
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r7
	beq _080BD20C
	bl FreeAndDestroyMonPicSprite
	ldr r1, [r6]
	ldr r0, _080BD228
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r2, [r1]
	adds r0, r7, #0
	orrs r0, r2
	strh r0, [r1]
_080BD20C:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _080BD1E8
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BD220: .4byte 0x020397EC
_080BD224: .4byte 0x0000FFFF
_080BD228: .4byte 0x0000061E
	thumb_func_end sub_080BD1E0

	thumb_func_start GetPokemonSpriteToDisplay
GetPokemonSpriteToDisplay: @ 0x080BD22C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _080BD24C
	cmp r2, r0
	bhi _080BD248
	ldr r0, _080BD250
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r2, r1, r0
	ldrh r1, [r2]
	ldr r0, _080BD254
	cmp r1, r0
	bne _080BD258
_080BD248:
	ldr r0, _080BD254
	b _080BD266
	.align 2, 0
_080BD24C: .4byte 0x00000181
_080BD250: .4byte 0x020397EC
_080BD254: .4byte 0x0000FFFF
_080BD258:
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080BD264
	movs r0, #0
	b _080BD266
_080BD264:
	ldrh r0, [r2]
_080BD266:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPokemonSpriteToDisplay

	thumb_func_start sub_080BD26C
sub_080BD26C: @ 0x080BD26C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r6, #0
	ldr r0, _080BD2F0
	mov sb, r0
	ldr r3, _080BD2F4
	lsls r1, r1, #0x10
_080BD288:
	mov r4, sb
	ldr r0, [r4]
	lsls r7, r6, #1
	ldr r4, _080BD2F8
	adds r0, r0, r4
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, r3
	bne _080BD300
	lsls r2, r2, #0x10
	mov r0, r8
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	adds r3, r6, #0
	bl CreateMonSpriteFromNationalDexNumber
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080BD2FC
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r1, [r4, #1]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #1]
	ldrb r0, [r4, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #5]
	movs r0, #0
	strh r0, [r4, #0x2e]
	strh r6, [r4, #0x30]
	mov r0, r8
	bl NationalPokedexNumToSpecies
	strh r0, [r4, #0x32]
	mov r4, sb
	ldr r0, [r4]
	ldr r1, _080BD2F8
	adds r0, r0, r1
	adds r0, r0, r7
	strh r5, [r0]
	adds r0, r5, #0
	b _080BD30C
	.align 2, 0
_080BD2F0: .4byte 0x020397EC
_080BD2F4: .4byte 0x0000FFFF
_080BD2F8: .4byte 0x0000061E
_080BD2FC: .4byte 0x020205AC
_080BD300:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _080BD288
	ldr r0, _080BD318
_080BD30C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BD318: .4byte 0x0000FFFF
	thumb_func_end sub_080BD26C

	thumb_func_start CreateInterfaceSprites
CreateInterfaceSprites: @ 0x080BD31C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r4, _080BD4E8
	adds r0, r4, #0
	movs r1, #0xb8
	movs r2, #4
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080BD4EC
	mov sl, r1
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	movs r1, #0
	strh r1, [r0, #0x30]
	adds r0, r4, #0
	movs r1, #0xb8
	movs r2, #0x9c
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	movs r1, #1
	strh r1, [r0, #0x30]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _080BD4F0
	movs r1, #0xe4
	movs r2, #0x14
	movs r3, #0
	bl CreateSprite
	ldr r5, _080BD4F4
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0x78
	movs r3, #0
	bl CreateSprite
	adds r0, r5, #0
	movs r1, #0x30
	movs r2, #0x78
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	movs r1, #3
	bl StartSpriteAnim
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0x90
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	add r4, sl
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
	movs r0, #0x80
	mov sb, r0
	mov r1, sb
	strh r1, [r4, #0x32]
	adds r0, r5, #0
	movs r1, #0x30
	movs r2, #0x90
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	movs r1, #1
	bl StartSpriteAnim
	ldr r6, _080BD4F8
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x50
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r7, #4
	adds r1, r1, r7
	lsls r1, r1, #2
	add r1, sl
	ldrb r2, [r1, #1]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	movs r5, #1
	orrs r0, r5
	strb r0, [r1, #1]
	ldrb r2, [r1, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #0x3c
	orrs r0, r2
	strb r0, [r1, #3]
	movs r0, #0x1e
	strh r0, [r1, #0x2e]
	movs r0, #0
	strh r0, [r1, #0x30]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x50
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r7, #4
	adds r1, r1, r7
	lsls r1, r1, #2
	add r1, sl
	ldrb r0, [r1, #1]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1, #1]
	ldrb r0, [r1, #3]
	movs r2, #0x3e
	orrs r0, r2
	strb r0, [r1, #3]
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	mov r0, sb
	strh r0, [r1, #0x30]
	mov r1, r8
	cmp r1, #0
	beq _080BD46C
	b _080BDBB4
_080BD46C:
	bl IsNationalPokedexEnabled
	cmp r0, #0
	beq _080BD476
	b _080BD6EC
_080BD476:
	ldr r4, _080BD4FC
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x28
	movs r3, #1
	bl CreateSprite
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x48
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	movs r1, #1
	bl StartSpriteAnim
	movs r0, #0
	mov r8, r0
	ldr r0, _080BD500
	movs r1, #0x18
	movs r2, #0x30
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BD504
	ldr r0, [r0]
	ldr r1, _080BD508
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	mov r1, sl
	adds r4, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	cmp r5, #0
	beq _080BD50C
	movs r0, #1
	mov r8, r0
	b _080BD518
	.align 2, 0
_080BD4E8: .4byte 0x08539AFC
_080BD4EC: .4byte 0x020205AC
_080BD4F0: .4byte 0x08539AE4
_080BD4F4: .4byte 0x08539B14
_080BD4F8: .4byte 0x08539B2C
_080BD4FC: .4byte 0x08539B44
_080BD500: .4byte 0x08539B74
_080BD504: .4byte 0x020397EC
_080BD508: .4byte 0x0000061A
_080BD50C:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD518:
	ldr r0, _080BD564
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BD568
	ldr r0, [r0]
	ldr r1, _080BD56C
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080BD550
	mov r0, r8
	cmp r0, #0
	beq _080BD574
_080BD550:
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _080BD570
	adds r0, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	b _080BD588
	.align 2, 0
_080BD564: .4byte 0x08539B74
_080BD568: .4byte 0x020397EC
_080BD56C: .4byte 0x0000061A
_080BD570: .4byte 0x020205AC
_080BD574:
	ldr r1, _080BD60C
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD588:
	ldr r6, _080BD610
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x30
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r5, _080BD614
	ldr r0, [r5]
	ldr r1, _080BD618
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r4, _080BD60C
	adds r0, r0, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	movs r1, #0x18
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [r5]
	ldr r1, _080BD61C
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r4, r0, r4
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	cmp r5, #0
	beq _080BD620
	movs r0, #1
	mov r8, r0
	b _080BD62C
	.align 2, 0
_080BD60C: .4byte 0x020205AC
_080BD610: .4byte 0x08539B74
_080BD614: .4byte 0x020397EC
_080BD618: .4byte 0x0000061A
_080BD61C: .4byte 0x0000061C
_080BD620:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD62C:
	ldr r0, _080BD678
	movs r1, #0x20
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BD67C
	ldr r0, [r0]
	ldr r1, _080BD680
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080BD664
	mov r0, r8
	cmp r0, #0
	beq _080BD688
_080BD664:
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _080BD684
	adds r0, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	b _080BD69C
	.align 2, 0
_080BD678: .4byte 0x08539B74
_080BD67C: .4byte 0x020397EC
_080BD680: .4byte 0x0000061C
_080BD684: .4byte 0x020205AC
_080BD688:
	ldr r1, _080BD6DC
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD69C:
	ldr r0, _080BD6E0
	movs r1, #0x28
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BD6E4
	ldr r0, [r0]
	ldr r1, _080BD6E8
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r2, _080BD6DC
	adds r0, r0, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	b _080BDB82
	.align 2, 0
_080BD6DC: .4byte 0x020205AC
_080BD6E0: .4byte 0x08539B74
_080BD6E4: .4byte 0x020397EC
_080BD6E8: .4byte 0x0000061C
_080BD6EC:
	ldr r4, _080BD7B8
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x28
	movs r3, #1
	bl CreateSprite
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x4c
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	movs r1, #1
	bl StartSpriteAnim
	ldr r4, _080BD7BC
	adds r0, r4, #0
	movs r1, #0x11
	movs r2, #0x2d
	movs r3, #1
	bl CreateSprite
	adds r0, r4, #0
	movs r1, #0x11
	movs r2, #0x37
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r4, #0
	movs r1, #0x11
	movs r2, #0x51
	movs r3, #1
	bl CreateSprite
	adds r0, r4, #0
	movs r1, #0x11
	movs r2, #0x5b
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	movs r1, #1
	bl StartSpriteAnim
	movs r0, #0
	bl GetHoennPokedexCount
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, _080BD7C0
	movs r1, #0x28
	movs r2, #0x2d
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	mov r1, sl
	adds r4, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	cmp r5, #0
	beq _080BD7C4
	movs r0, #1
	mov r8, r0
	b _080BD7D0
	.align 2, 0
_080BD7B8: .4byte 0x08539B44
_080BD7BC: .4byte 0x08539B5C
_080BD7C0: .4byte 0x08539B8C
_080BD7C4:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD7D0:
	ldr r0, _080BD814
	movs r1, #0x30
	movs r2, #0x2d
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080BD800
	mov r1, r8
	cmp r1, #0
	beq _080BD81C
_080BD800:
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _080BD818
	adds r0, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	b _080BD830
	.align 2, 0
_080BD814: .4byte 0x08539B8C
_080BD818: .4byte 0x020205AC
_080BD81C:
	ldr r1, _080BD8AC
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD830:
	ldr r5, _080BD8B0
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #0x2d
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r4, _080BD8AC
	adds r0, r0, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	movs r0, #0
	mov r8, r0
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0x37
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BD8B4
	ldr r0, [r0]
	ldr r1, _080BD8B8
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r4, r0, r4
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	cmp r5, #0
	beq _080BD8BC
	movs r0, #1
	mov r8, r0
	b _080BD8C8
	.align 2, 0
_080BD8AC: .4byte 0x020205AC
_080BD8B0: .4byte 0x08539B8C
_080BD8B4: .4byte 0x020397EC
_080BD8B8: .4byte 0x0000061A
_080BD8BC:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD8C8:
	ldr r0, _080BD914
	movs r1, #0x30
	movs r2, #0x37
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BD918
	ldr r0, [r0]
	ldr r1, _080BD91C
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080BD900
	mov r0, r8
	cmp r0, #0
	beq _080BD924
_080BD900:
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _080BD920
	adds r0, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	b _080BD938
	.align 2, 0
_080BD914: .4byte 0x08539B8C
_080BD918: .4byte 0x020397EC
_080BD91C: .4byte 0x0000061A
_080BD920: .4byte 0x020205AC
_080BD924:
	ldr r1, _080BD9C0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD938:
	ldr r5, _080BD9C4
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #0x37
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BD9C8
	ldr r0, [r0]
	ldr r1, _080BD9CC
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r4, _080BD9C0
	adds r0, r0, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	movs r0, #1
	bl GetHoennPokedexCount
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	mov r8, r0
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0x51
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r4, r0, r4
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	cmp r5, #0
	beq _080BD9D0
	movs r1, #1
	mov r8, r1
	b _080BD9DC
	.align 2, 0
_080BD9C0: .4byte 0x020205AC
_080BD9C4: .4byte 0x08539B8C
_080BD9C8: .4byte 0x020397EC
_080BD9CC: .4byte 0x0000061A
_080BD9D0:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BD9DC:
	ldr r0, _080BDA20
	movs r1, #0x30
	movs r2, #0x51
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080BDA0C
	mov r0, r8
	cmp r0, #0
	beq _080BDA28
_080BDA0C:
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _080BDA24
	adds r0, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	b _080BDA3C
	.align 2, 0
_080BDA20: .4byte 0x08539B8C
_080BDA24: .4byte 0x020205AC
_080BDA28:
	ldr r1, _080BDAB8
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BDA3C:
	ldr r5, _080BDABC
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #0x51
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r4, _080BDAB8
	adds r0, r0, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	movs r1, #0
	mov r8, r1
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0x5b
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BDAC0
	ldr r0, [r0]
	ldr r1, _080BDAC4
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r4, r0, r4
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	cmp r5, #0
	beq _080BDAC8
	movs r0, #1
	mov r8, r0
	b _080BDAD4
	.align 2, 0
_080BDAB8: .4byte 0x020205AC
_080BDABC: .4byte 0x08539B8C
_080BDAC0: .4byte 0x020397EC
_080BDAC4: .4byte 0x0000061C
_080BDAC8:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BDAD4:
	ldr r0, _080BDB20
	movs r1, #0x30
	movs r2, #0x5b
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BDB24
	ldr r0, [r0]
	ldr r1, _080BDB28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080BDB0C
	mov r0, r8
	cmp r0, #0
	beq _080BDB30
_080BDB0C:
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _080BDB2C
	adds r0, r0, r1
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	b _080BDB44
	.align 2, 0
_080BDB20: .4byte 0x08539B8C
_080BDB24: .4byte 0x020397EC
_080BDB28: .4byte 0x0000061C
_080BDB2C: .4byte 0x020205AC
_080BDB30:
	ldr r1, _080BDBA0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BDB44:
	ldr r0, _080BDBA4
	movs r1, #0x38
	movs r2, #0x5b
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080BDBA8
	ldr r0, [r0]
	ldr r1, _080BDBAC
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r2, _080BDBA0
	adds r0, r0, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
_080BDB82:
	ldr r0, _080BDBB0
	movs r1, #0x90
	movs r2, #0x60
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080BDBA0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	b _080BDBCC
	.align 2, 0
_080BDBA0: .4byte 0x020205AC
_080BDBA4: .4byte 0x08539B8C
_080BDBA8: .4byte 0x020397EC
_080BDBAC: .4byte 0x0000061C
_080BDBB0: .4byte 0x08539BA4
_080BDBB4:
	ldr r0, _080BDBE4
	movs r1, #0x90
	movs r2, #0x50
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
_080BDBCC:
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDBE4: .4byte 0x08539BA4
	thumb_func_end CreateInterfaceSprites

	thumb_func_start nullsub_38
nullsub_38: @ 0x080BDBE8
	bx lr
	.align 2, 0
	thumb_func_end nullsub_38

	thumb_func_start sub_080BDBEC
sub_080BDBEC: @ 0x080BDBEC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BDC08
	ldr r0, [r0]
	ldr r2, _080BDC0C
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BDC04
	adds r0, r1, #0
	bl DestroySprite
_080BDC04:
	pop {r0}
	bx r0
	.align 2, 0
_080BDC08: .4byte 0x020397EC
_080BDC0C: .4byte 0x0000064A
	thumb_func_end sub_080BDBEC

	thumb_func_start sub_080BDC10
sub_080BDC10: @ 0x080BDC10
	push {lr}
	adds r2, r0, #0
	ldrb r1, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #5]
	ldrb r1, [r2, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	strh r0, [r2, #0x24]
	strh r0, [r2, #0x26]
	ldr r1, [r2, #0x20]
	ldr r0, _080BDC70
	cmp r1, r0
	beq _080BDC74
	ldrh r1, [r2, #0x20]
	movs r3, #0x20
	ldrsh r0, [r2, r3]
	cmp r0, #0x30
	ble _080BDC44
	subs r0, r1, #1
	strh r0, [r2, #0x20]
_080BDC44:
	ldrh r1, [r2, #0x20]
	movs r3, #0x20
	ldrsh r0, [r2, r3]
	cmp r0, #0x2f
	bgt _080BDC52
	adds r0, r1, #1
	strh r0, [r2, #0x20]
_080BDC52:
	ldrh r1, [r2, #0x22]
	movs r3, #0x22
	ldrsh r0, [r2, r3]
	cmp r0, #0x38
	ble _080BDC60
	subs r0, r1, #1
	strh r0, [r2, #0x22]
_080BDC60:
	ldrh r1, [r2, #0x22]
	movs r3, #0x22
	ldrsh r0, [r2, r3]
	cmp r0, #0x37
	bgt _080BDC78
	adds r0, r1, #1
	strh r0, [r2, #0x22]
	b _080BDC78
	.align 2, 0
_080BDC70: .4byte 0x00380030
_080BDC74:
	ldr r0, _080BDC7C
	str r0, [r2, #0x1c]
_080BDC78:
	pop {r0}
	bx r0
	.align 2, 0
_080BDC7C: .4byte 0x080BDBE9
	thumb_func_end sub_080BDC10

	thumb_func_start sub_080BDC80
sub_080BDC80: @ 0x080BDC80
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _080BDCB4
	ldr r1, [r7]
	ldr r2, _080BDCB8
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BDCC0
	cmp r0, #3
	beq _080BDCC0
	lsls r5, r6, #1
	ldr r4, _080BDCBC
	adds r0, r1, r4
	adds r0, r0, r5
	ldrh r0, [r0]
	bl FreeAndDestroyMonPicSprite
	ldr r0, [r7]
	adds r0, r0, r4
	adds r0, r0, r5
	b _080BDD8C
	.align 2, 0
_080BDCB4: .4byte 0x020397EC
_080BDCB8: .4byte 0x0000064A
_080BDCBC: .4byte 0x0000061E
_080BDCC0:
	ldr r2, _080BDD4C
	ldrh r0, [r4, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x4c
	muls r0, r1, r0
	cmp r0, #0
	bge _080BDCD8
	adds r0, #0xff
_080BDCD8:
	asrs r0, r0, #8
	strh r0, [r4, #0x26]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	adds r2, r0, #0
	ldr r0, _080BDD50
	cmp r2, r0
	bls _080BDCFC
	adds r2, r0, #0
_080BDCFC:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	adds r1, r6, #1
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	ldrh r0, [r4, #0x38]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _080BDD54
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2]
	movs r0, #1
	strh r0, [r4, #0x2e]
	b _080BDD60
	.align 2, 0
_080BDD4C: .4byte 0x082FA8CC
_080BDD50: .4byte 0x0000FFFF
_080BDD54:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_080BDD60:
	ldrh r0, [r4, #0x38]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bls _080BDD90
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080BDD90
	ldr r5, _080BDD98
	ldr r0, [r5]
	lsls r6, r6, #1
	ldr r4, _080BDD9C
	adds r0, r0, r4
	adds r0, r0, r6
	ldrh r0, [r0]
	bl FreeAndDestroyMonPicSprite
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, r0, r6
_080BDD8C:
	ldr r1, _080BDDA0
	strh r1, [r0]
_080BDD90:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDD98: .4byte 0x020397EC
_080BDD9C: .4byte 0x0000061E
_080BDDA0: .4byte 0x0000FFFF
	thumb_func_end sub_080BDC80

	thumb_func_start SpriteCB_Scrollbar
SpriteCB_Scrollbar: @ 0x080BDDA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080BDDC4
	ldr r0, [r1]
	ldr r2, _080BDDC8
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BDDCC
	cmp r0, #3
	beq _080BDDCC
	adds r0, r4, #0
	bl DestroySprite
	b _080BDDE8
	.align 2, 0
_080BDDC4: .4byte 0x020397EC
_080BDDC8: .4byte 0x0000064A
_080BDDCC:
	ldr r2, [r1]
	ldr r1, _080BDDF0
	adds r0, r2, r1
	ldrh r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _080BDDF4
	adds r2, r2, r1
	ldrh r1, [r2]
	subs r1, #1
	bl __divsi3
	strh r0, [r4, #0x26]
_080BDDE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDDF0: .4byte 0x0000060E
_080BDDF4: .4byte 0x0000060C
	thumb_func_end SpriteCB_Scrollbar

	thumb_func_start sub_080BDDF8
sub_080BDDF8: @ 0x080BDDF8
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r1, _080BDE18
	ldr r0, [r1]
	ldr r2, _080BDE1C
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _080BDE20
	cmp r0, #3
	beq _080BDE20
	adds r0, r3, #0
	bl DestroySprite
	b _080BDEF0
	.align 2, 0
_080BDE18: .4byte 0x020397EC
_080BDE1C: .4byte 0x0000064A
_080BDE20:
	movs r1, #0x30
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _080BDE62
	ldr r0, [r5]
	ldr r2, _080BDE48
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bne _080BDE4C
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _080BDE58
	.align 2, 0
_080BDE48: .4byte 0x0000060E
_080BDE4C:
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
_080BDE58:
	strb r1, [r0]
	adds r2, r0, #0
	ldrh r1, [r3, #0x32]
	lsls r0, r1, #0x18
	b _080BDE98
_080BDE62:
	ldr r0, [r5]
	ldr r1, _080BDE7C
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080BDE80
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _080BDE8C
	.align 2, 0
_080BDE7C: .4byte 0x0000060E
_080BDE80:
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
_080BDE8C:
	strb r1, [r0]
	adds r2, r0, #0
	ldrh r1, [r3, #0x32]
	adds r0, r1, #0
	subs r0, #0x80
	lsls r0, r0, #0x18
_080BDE98:
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	ldr r1, _080BDEE0
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080BDEAC
	adds r0, #0x3f
_080BDEAC:
	asrs r0, r0, #6
	strh r0, [r3, #0x26]
	adds r0, r4, #0
	adds r0, #8
	strh r0, [r3, #0x32]
	ldr r1, [r5]
	ldr r3, _080BDEE4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080BDEE8
	adds r3, #3
	adds r0, r1, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080BDEE8
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080BDEE8
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	b _080BDEEE
	.align 2, 0
_080BDEE0: .4byte 0x082FA8CC
_080BDEE4: .4byte 0x0000064F
_080BDEE8:
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
_080BDEEE:
	strb r0, [r2]
_080BDEF0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080BDDF8

	thumb_func_start sub_080BDEF8
sub_080BDEF8: @ 0x080BDEF8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BDF18
	ldr r0, [r0]
	ldr r2, _080BDF1C
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BDF14
	cmp r0, #3
	beq _080BDF14
	adds r0, r1, #0
	bl DestroySprite
_080BDF14:
	pop {r0}
	bx r0
	.align 2, 0
_080BDF18: .4byte 0x020397EC
_080BDF1C: .4byte 0x0000064A
	thumb_func_end sub_080BDEF8

	thumb_func_start sub_080BDF20
sub_080BDF20: @ 0x080BDF20
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _080BDF44
	ldr r0, [r1]
	ldr r2, _080BDF48
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	beq _080BDF4C
	cmp r0, #3
	beq _080BDF4C
	adds r0, r6, #0
	bl DestroySprite
	b _080BDFC4
	.align 2, 0
_080BDF44: .4byte 0x020397EC
_080BDF48: .4byte 0x0000064A
_080BDF4C:
	ldr r0, [r7]
	ldr r5, _080BDFCC
	adds r0, r0, r5
	ldrb r1, [r0]
	ldrh r0, [r6, #0x30]
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r4, _080BDFD0
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r1]
	lsls r3, r3, #0x10
	lsrs r2, r3, #0x10
	rsbs r3, r3, #0
	lsrs r3, r3, #0x10
	str r1, [sp]
	bl SetOamMatrix
	ldr r1, [r7]
	adds r1, r1, r5
	ldrh r0, [r6, #0x30]
	adds r0, #0x40
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r4
	ldrh r3, [r1]
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	cmp r0, #0
	bge _080BDFAC
	adds r0, #0xff
_080BDFAC:
	asrs r0, r0, #8
	strh r0, [r6, #0x24]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	cmp r0, #0
	bge _080BDFC0
	adds r0, #0xff
_080BDFC0:
	asrs r0, r0, #8
	strh r0, [r6, #0x26]
_080BDFC4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDFCC: .4byte 0x0000062C
_080BDFD0: .4byte 0x082FA8CC
	thumb_func_end sub_080BDF20

	thumb_func_start sub_080BDFD4
sub_080BDFD4: @ 0x080BDFD4
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, _080BDFF4
	ldr r0, [r1]
	ldr r2, _080BDFF8
	adds r0, r0, r2
	ldrb r2, [r0]
	cmp r2, #0
	beq _080BDFFC
	cmp r2, #3
	beq _080BDFFC
	adds r0, r3, #0
	bl DestroySprite
	b _080BE074
	.align 2, 0
_080BDFF4: .4byte 0x020397EC
_080BDFF8: .4byte 0x0000064A
_080BDFFC:
	ldr r4, [r1]
	ldr r1, _080BE05C
	adds r0, r4, r1
	ldrb r0, [r0]
	movs r1, #0x60
	cmp r0, #0
	bne _080BE00C
	movs r1, #0x50
_080BE00C:
	ldr r2, _080BE060
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BE068
	adds r2, #3
	adds r0, r4, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, r1
	bne _080BE068
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r1, #0xca
	lsls r1, r1, #3
	adds r0, r4, r1
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r3, #0x26]
	ldr r1, _080BE064
	ldrh r2, [r3, #0x32]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080BE050
	adds r0, #0x3f
_080BE050:
	asrs r0, r0, #6
	strh r0, [r3, #0x24]
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r3, #0x32]
	b _080BE074
	.align 2, 0
_080BE05C: .4byte 0x0000064A
_080BE060: .4byte 0x0000064F
_080BE064: .4byte 0x082FA8CC
_080BE068:
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080BE074:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080BDFD4

	thumb_func_start sub_080BE07C
sub_080BE07C: @ 0x080BE07C
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r3, r2, #0
	lsls r3, r3, #0x18
	add r1, sp, #0x14
	movs r4, #0
	strb r4, [r1]
	adds r2, r1, #0
	movs r1, #0xf
	strb r1, [r2, #1]
	movs r1, #3
	strb r1, [r2, #2]
	lsls r5, r5, #0x1b
	lsrs r5, r5, #0x18
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r4, [sp]
	str r4, [sp, #4]
	str r2, [sp, #8]
	subs r1, #4
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #1
	adds r2, r5, #0
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080BE07C

	thumb_func_start sub_080BE0C0
sub_080BE0C0: @ 0x080BE0C0
	push {r4, r5, lr}
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _080BE154
	str r0, [r1]
	ldr r0, _080BE158
	movs r1, #0
	bl CreateTask
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080BE15C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0, #8]
	movs r1, #1
	strh r1, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r4, [r0, #0x10]
	movs r1, #0xff
	strh r1, [r0, #0x12]
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080BE160
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #3
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #2
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #1
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r0, _080BE164
	bl InitWindows
	bl DeactivateAllTextPrinters
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BE154: .4byte 0x020397F4
_080BE158: .4byte 0x080BE1C9
_080BE15C: .4byte 0x03005B60
_080BE160: .4byte 0x08543110
_080BE164: .4byte 0x08543120
	thumb_func_end sub_080BE0C0

	thumb_func_start sub_080BE168
sub_080BE168: @ 0x080BE168
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080BE18C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _080BE194
	ldr r1, [r1]
	ldr r0, _080BE190
	cmp r1, r0
	bne _080BE194
	movs r0, #0
	b _080BE196
	.align 2, 0
_080BE18C: .4byte 0x03005B60
_080BE190: .4byte 0x080BE679
_080BE194:
	movs r0, #1
_080BE196:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080BE168

	thumb_func_start sub_080BE19C
sub_080BE19C: @ 0x080BE19C
	adds r2, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080BE1C0
	str r2, [r1]
	ldr r2, _080BE1C4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r3, #0
	movs r2, #1
	strh r2, [r1, #8]
	strh r3, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r3, [r1, #0xe]
	bx lr
	.align 2, 0
_080BE1C0: .4byte 0x020397F4
_080BE1C4: .4byte 0x03005B60
	thumb_func_end sub_080BE19C

	thumb_func_start sub_080BE1C8
sub_080BE1C8: @ 0x080BE1C8
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080BE1EC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0xa
	bhi _080BE220
	lsls r0, r0, #2
	ldr r1, _080BE1F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BE1EC: .4byte 0x03002360
_080BE1F0: .4byte 0x080BE1F4
_080BE1F4: @ jump table
	.4byte _080BE220 @ case 0
	.4byte _080BE294 @ case 1
	.4byte _080BE2F4 @ case 2
	.4byte _080BE334 @ case 3
	.4byte _080BE33C @ case 4
	.4byte _080BE498 @ case 5
	.4byte _080BE4E4 @ case 6
	.4byte _080BE540 @ case 7
	.4byte _080BE588 @ case 8
	.4byte _080BE5E2 @ case 9
	.4byte _080BE600 @ case 10
_080BE220:
	ldr r0, _080BE280
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BE22E
	b _080BE624
_080BE22E:
	ldr r0, _080BE284
	ldr r0, [r0]
	ldr r3, _080BE288
	adds r0, r0, r3
	movs r6, #1
	strb r6, [r0]
	ldr r1, _080BE28C
	ldr r0, [r5, #0xc]
	str r0, [r1]
	movs r0, #0
	bl SetVBlankCallback
	movs r2, #0
	ldr r1, _080BE290
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080BE25E
	movs r2, #0x80
	lsls r2, r2, #5
_080BE25E:
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080BE26E
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r2, r0
_080BE26E:
	adds r0, r2, #0
	bl sub_080BFF08
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r5, r2
	strb r6, [r0]
	b _080BE624
	.align 2, 0
_080BE280: .4byte 0x02037C74
_080BE284: .4byte 0x020397EC
_080BE288: .4byte 0x0000064A
_080BE28C: .4byte 0x03005E14
_080BE290: .4byte 0x03005B60
_080BE294:
	ldr r1, _080BE2E4
	movs r2, #0x80
	lsls r2, r2, #6
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080BE2E8
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	ldr r0, _080BE2EC
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #1
	bl sub_080C0288
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	ldr r1, _080BE2F0
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _080BE5F4
	.align 2, 0
_080BE2E4: .4byte 0x08537E8C
_080BE2E8: .4byte 0x08537A10
_080BE2EC: .4byte 0x020397F4
_080BE2F0: .4byte 0x03002360
_080BE2F4:
	movs r0, #0xd
	bl sub_080BF598
	ldr r4, _080BE324
	ldr r0, [r4]
	ldr r1, _080BE328
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0xd
	bl sub_080BF5C8
	ldr r0, [r4]
	ldr r2, _080BE32C
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl LoadPokedexBgPalette
	ldr r1, _080BE330
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _080BE5F4
	.align 2, 0
_080BE324: .4byte 0x020397EC
_080BE328: .4byte 0x0000064D
_080BE32C: .4byte 0x0000064C
_080BE330: .4byte 0x03002360
_080BE334:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r5, r0
	b _080BE5F4
_080BE33C:
	ldr r0, _080BE368
	ldr r0, [r0]
	ldr r1, _080BE36C
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080BE374
	ldr r0, _080BE370
	ldr r0, [r0]
	ldrh r0, [r0]
	bl NationalToHoennOrder
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0xd
	movs r3, #3
	bl sub_080C0020
	b _080BE384
	.align 2, 0
_080BE368: .4byte 0x020397EC
_080BE36C: .4byte 0x00000612
_080BE370: .4byte 0x020397F4
_080BE374:
	ldr r0, _080BE420
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0
	movs r2, #0xd
	movs r3, #3
	bl sub_080C0020
_080BE384:
	ldr r5, _080BE420
	ldr r0, [r5]
	ldrh r1, [r0]
	movs r0, #0
	movs r2, #0x11
	movs r3, #3
	bl sub_080C00A0
	ldr r0, [r5]
	ldrb r1, [r0, #2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BE434
	ldr r0, _080BE424
	movs r1, #0xd
	movs r2, #5
	bl sub_080BE07C
	ldr r0, _080BE428
	movs r1, #0x10
	movs r2, #7
	bl sub_080BE07C
	ldr r0, _080BE42C
	movs r1, #0x10
	movs r2, #9
	bl sub_080BE07C
	ldr r0, [r5]
	ldrh r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r4, _080BE430
	adds r1, r1, r4
	movs r0, #0
	movs r2, #0xd
	movs r3, #5
	bl sub_080C0150
	ldr r0, [r5]
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #6]
	movs r0, #0
	movs r2, #0x10
	movs r3, #7
	bl sub_080C01C8
	ldr r0, [r5]
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #8]
	movs r0, #0
	movs r2, #0x10
	movs r3, #9
	bl sub_080C01C8
	ldr r0, [r5]
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #3
	movs r2, #0xd
	bl sub_080BE07C
	b _080BE466
	.align 2, 0
_080BE420: .4byte 0x020397F4
_080BE424: .4byte 0x085C8FBB
_080BE428: .4byte 0x085C8FC5
_080BE42C: .4byte 0x085C8FCC
_080BE430: .4byte 0x0854069C
_080BE434:
	ldr r0, _080BE484
	movs r1, #0xd
	movs r2, #5
	bl sub_080BE07C
	ldr r0, _080BE488
	movs r1, #0x10
	movs r2, #7
	bl sub_080BE07C
	ldr r0, _080BE48C
	movs r1, #0x10
	movs r2, #9
	bl sub_080BE07C
	ldr r0, _080BE490
	movs r1, #3
	movs r2, #0xd
	bl sub_080BE07C
	ldr r0, _080BE494
	movs r1, #0x31
	movs r2, #0x1e
	bl LoadPalette
_080BE466:
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _080BE5EC
	.align 2, 0
_080BE484: .4byte 0x085C8FA2
_080BE488: .4byte 0x085C8FAC
_080BE48C: .4byte 0x085C8FB3
_080BE490: .4byte 0x08539C50
_080BE494: .4byte 0x020373B6
_080BE498:
	ldr r0, _080BE4D8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r4, r1, r0
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080BE4AC
	b _080BE5EC
_080BE4AC:
	ldr r0, _080BE4DC
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0x30
	movs r2, #0x38
	movs r3, #0
	bl CreateMonSpriteFromNationalDexNumber
	strh r0, [r4, #0x10]
	ldr r2, _080BE4E0
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	b _080BE5EC
	.align 2, 0
_080BE4D8: .4byte 0x03005B60
_080BE4DC: .4byte 0x020397F4
_080BE4E0: .4byte 0x020205AC
_080BE4E4:
	movs r3, #0
	ldr r0, _080BE534
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080BE4FA
	movs r3, #0x14
_080BE4FA:
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080BE51C
	ldr r2, _080BE538
	movs r0, #0x10
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	orrs r3, r0
_080BE51C:
	mvns r0, r3
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080BE53C
	ldr r0, [r0]
	bl SetVBlankCallback
	b _080BE5EC
	.align 2, 0
_080BE534: .4byte 0x03005B60
_080BE538: .4byte 0x020205AC
_080BE53C: .4byte 0x03005E14
_080BE540:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl HideBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldr r1, _080BE584
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _080BE5F4
	.align 2, 0
_080BE584: .4byte 0x03002360
_080BE588:
	ldr r0, _080BE5D0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BE624
	movs r0, #0x87
	lsls r0, r0, #3
	adds r2, r5, r0
	ldrb r0, [r2]
	adds r3, r0, #1
	strb r3, [r2]
	ldr r1, _080BE5D4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080BE5DC
	bl StopCryAndClearCrySongs
	ldr r0, _080BE5D8
	ldr r0, [r0]
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0x7d
	movs r3, #0xa
	bl PlayCry2
	b _080BE624
	.align 2, 0
_080BE5D0: .4byte 0x02037C74
_080BE5D4: .4byte 0x03005B60
_080BE5D8: .4byte 0x020397F4
_080BE5DC:
	adds r0, r3, #1
	strb r0, [r2]
	b _080BE624
_080BE5E2:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BE624
_080BE5EC:
	ldr r1, _080BE5FC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_080BE5F4:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080BE624
	.align 2, 0
_080BE5FC: .4byte 0x03002360
_080BE600:
	ldr r1, _080BE62C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	movs r1, #1
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	ldr r1, _080BE630
	str r1, [r0]
	movs r3, #0x87
	lsls r3, r3, #3
	adds r0, r5, r3
	strb r2, [r0]
_080BE624:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE62C: .4byte 0x03005B60
_080BE630: .4byte 0x080BE679
	thumb_func_end sub_080BE1C8

	thumb_func_start sub_080BE634
sub_080BE634: @ 0x080BE634
	push {lr}
	bl FreeAllWindowBuffers
	movs r0, #0
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BE648
	bl Free
_080BE648:
	movs r0, #1
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BE656
	bl Free
_080BE656:
	movs r0, #2
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BE664
	bl Free
_080BE664:
	movs r0, #3
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BE672
	bl Free
_080BE672:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080BE634

	thumb_func_start sub_080BE678
sub_080BE678: @ 0x080BE678
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080BE6B0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #0
	beq _080BE6B8
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BE6B4
	str r0, [r4]
	movs r0, #0x6c
	bl PlaySE
	b _080BE83E
	.align 2, 0
_080BE6B0: .4byte 0x03005B60
_080BE6B4: .4byte 0x080BE8BD
_080BE6B8:
	ldr r1, _080BE6D0
	ldrh r2, [r1, #0x2e]
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080BE6D4
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	b _080BE792
	.align 2, 0
_080BE6D0: .4byte 0x03002360
_080BE6D4:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080BE7AC
	ldr r5, _080BE6F4
	ldr r0, [r5]
	ldr r1, _080BE6F8
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #1
	beq _080BE724
	cmp r1, #1
	bgt _080BE6FC
	cmp r1, #0
	beq _080BE706
	b _080BE83E
	.align 2, 0
_080BE6F4: .4byte 0x020397EC
_080BE6F8: .4byte 0x0000064D
_080BE6FC:
	cmp r1, #2
	beq _080BE744
	cmp r1, #3
	beq _080BE78C
	b _080BE83E
_080BE706:
	movs r0, #0x15
	rsbs r0, r0, #0
	str r3, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	ldr r3, _080BE720
	adds r0, r0, r3
	movs r1, #1
	b _080BE774
	.align 2, 0
_080BE720: .4byte 0x0000064E
_080BE724:
	movs r0, #0x15
	rsbs r0, r0, #0
	str r3, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	ldr r1, _080BE740
	adds r0, r0, r1
	movs r1, #2
	b _080BE774
	.align 2, 0
_080BE740: .4byte 0x0000064E
_080BE744:
	ldr r0, _080BE758
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	ands r1, r0
	cmp r1, #0
	bne _080BE75C
	movs r0, #0x20
	bl PlaySE
	b _080BE83E
	.align 2, 0
_080BE758: .4byte 0x020397F4
_080BE75C:
	movs r0, #0x15
	rsbs r0, r0, #0
	str r3, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	ldr r3, _080BE784
	adds r0, r0, r3
	movs r1, #3
_080BE774:
	strb r1, [r0]
	ldr r0, _080BE788
	str r0, [r4]
	movs r0, #0x15
	bl PlaySE
	b _080BE83E
	.align 2, 0
_080BE784: .4byte 0x0000064E
_080BE788: .4byte 0x080BE855
_080BE78C:
	movs r0, #1
	rsbs r0, r0, #0
	str r3, [sp]
_080BE792:
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BE7A8
	str r0, [r4]
	movs r0, #3
	bl PlaySE
	b _080BE83E
	.align 2, 0
_080BE7A8: .4byte 0x080BE8F5
_080BE7AC:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _080BE7C8
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080BE7FC
	ldr r0, _080BE7F0
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _080BE7FC
_080BE7C8:
	ldr r3, _080BE7F4
	ldr r0, [r3]
	ldr r4, _080BE7F8
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, #0
	beq _080BE7FC
	subs r0, #1
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0xd
	bl sub_080BF5C8
	movs r0, #0x6d
	bl PlaySE
	b _080BE83E
	.align 2, 0
_080BE7F0: .4byte 0x03005AF0
_080BE7F4: .4byte 0x020397EC
_080BE7F8: .4byte 0x0000064D
_080BE7FC:
	ldrh r1, [r1, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080BE81A
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BE83E
	ldr r0, _080BE848
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _080BE83E
_080BE81A:
	ldr r2, _080BE84C
	ldr r0, [r2]
	ldr r3, _080BE850
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #2
	bhi _080BE83E
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r1, #0xd
	bl sub_080BF5C8
	movs r0, #0x6d
	bl PlaySE
_080BE83E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE848: .4byte 0x03005AF0
_080BE84C: .4byte 0x020397EC
_080BE850: .4byte 0x0000064D
	thumb_func_end sub_080BE678

	thumb_func_start sub_080BE854
sub_080BE854: @ 0x080BE854
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080BE890
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BE8B0
	ldr r1, _080BE894
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x10]
	bl FreeAndDestroyMonPicSprite
	ldr r0, _080BE898
	ldr r0, [r0]
	ldr r1, _080BE89C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	beq _080BE8A4
	cmp r0, #2
	ble _080BE88C
	cmp r0, #3
	beq _080BE8AC
_080BE88C:
	ldr r0, _080BE8A0
	b _080BE8AE
	.align 2, 0
_080BE890: .4byte 0x02037C74
_080BE894: .4byte 0x03005B60
_080BE898: .4byte 0x020397EC
_080BE89C: .4byte 0x0000064E
_080BE8A0: .4byte 0x080BE931
_080BE8A4:
	ldr r0, _080BE8A8
	b _080BE8AE
	.align 2, 0
_080BE8A8: .4byte 0x080BEAD5
_080BE8AC:
	ldr r0, _080BE8B8
_080BE8AE:
	str r0, [r4]
_080BE8B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE8B8: .4byte 0x080BF0C9
	thumb_func_end sub_080BE854

	thumb_func_start sub_080BE8BC
sub_080BE8BC: @ 0x080BE8BC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080BE8E8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BE8E2
	ldr r0, _080BE8EC
	lsls r4, r2, #2
	adds r4, r4, r2
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0x10]
	bl FreeAndDestroyMonPicSprite
	ldr r0, _080BE8F0
	str r0, [r4]
_080BE8E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE8E8: .4byte 0x02037C74
_080BE8EC: .4byte 0x03005B60
_080BE8F0: .4byte 0x080BE1C9
	thumb_func_end sub_080BE8BC

	thumb_func_start sub_080BE8F4
sub_080BE8F4: @ 0x080BE8F4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080BE928
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BE920
	ldr r0, _080BE92C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x10]
	bl FreeAndDestroyMonPicSprite
	bl sub_080BE634
	adds r0, r4, #0
	bl DestroyTask
_080BE920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE928: .4byte 0x02037C74
_080BE92C: .4byte 0x03005B60
	thumb_func_end sub_080BE8F4

	thumb_func_start sub_080BE930
sub_080BE930: @ 0x080BE930
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _080BE98C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r7, r2, r0
	ldrb r0, [r7]
	cmp r0, #1
	beq _080BE9A4
	cmp r0, #1
	ble _080BE94C
	cmp r0, #2
	beq _080BE9E0
_080BE94C:
	ldr r0, _080BE990
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _080BEA1A
	ldr r4, _080BE994
	ldr r0, [r4]
	ldr r1, _080BE998
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	ldr r1, _080BE99C
	ldr r0, [r2, #0xc]
	str r0, [r1]
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0x80
	lsls r0, r0, #2
	bl sub_080BFF08
	ldr r0, [r4]
	ldr r1, _080BE9A0
	adds r0, r0, r1
	strb r5, [r0]
	movs r0, #1
	strb r0, [r7]
	b _080BEA1A
	.align 2, 0
_080BE98C: .4byte 0x03002360
_080BE990: .4byte 0x02037C74
_080BE994: .4byte 0x020397EC
_080BE998: .4byte 0x0000064A
_080BE99C: .4byte 0x03005E14
_080BE9A0: .4byte 0x0000064D
_080BE9A4:
	movs r0, #0xd
	bl sub_080BF5B0
	movs r0, #0
	movs r1, #0xd
	bl sub_080BF638
	ldr r0, _080BE9D8
	ldr r0, [r0]
	ldr r1, _080BE9DC
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl LoadPokedexBgPalette
	movs r1, #0xd0
	lsls r1, r1, #4
	movs r0, #0xa
	bl SetGpuReg
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b _080BEA1A
	.align 2, 0
_080BE9D8: .4byte 0x020397EC
_080BE9DC: .4byte 0x0000064C
_080BE9E0:
	ldr r0, _080BEA20
	ldr r0, [r0]
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r5, _080BEA24
	ldr r1, [r5]
	ldr r4, _080BEA28
	adds r1, r1, r4
	bl ShowPokedexAreaScreen
	ldr r0, _080BEA2C
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	strb r1, [r7]
	ldr r1, _080BEA30
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BEA34
	str r1, [r0]
_080BEA1A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BEA20: .4byte 0x020397F4
_080BEA24: .4byte 0x020397EC
_080BEA28: .4byte 0x0000064E
_080BEA2C: .4byte 0x03005E14
_080BEA30: .4byte 0x03005B60
_080BEA34: .4byte 0x080BEA39
	thumb_func_end sub_080BE930

	thumb_func_start sub_080BEA38
sub_080BEA38: @ 0x080BEA38
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080BEA60
	ldr r0, [r0]
	ldr r1, _080BEA64
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BEA5A
	ldr r0, _080BEA68
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BEA6C
	str r0, [r1]
_080BEA5A:
	pop {r0}
	bx r0
	.align 2, 0
_080BEA60: .4byte 0x020397EC
_080BEA64: .4byte 0x0000064E
_080BEA68: .4byte 0x03005B60
_080BEA6C: .4byte 0x080BEA71
	thumb_func_end sub_080BEA38

	thumb_func_start sub_080BEA70
sub_080BEA70: @ 0x080BEA70
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080BEAA4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BEAC6
	ldr r0, _080BEAA8
	ldr r0, [r0]
	ldr r1, _080BEAAC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080BEA94
	cmp r0, #2
	beq _080BEAB8
_080BEA94:
	ldr r0, _080BEAB0
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BEAB4
	b _080BEAC4
	.align 2, 0
_080BEAA4: .4byte 0x02037C74
_080BEAA8: .4byte 0x020397EC
_080BEAAC: .4byte 0x0000064E
_080BEAB0: .4byte 0x03005B60
_080BEAB4: .4byte 0x080BE1C9
_080BEAB8:
	ldr r0, _080BEACC
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080BEAD0
_080BEAC4:
	str r0, [r1]
_080BEAC6:
	pop {r0}
	bx r0
	.align 2, 0
_080BEACC: .4byte 0x03005B60
_080BEAD0: .4byte 0x080BEAD5
	thumb_func_end sub_080BEA70

	thumb_func_start sub_080BEAD4
sub_080BEAD4: @ 0x080BEAD4
	push {r4, r5, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080BEAF8
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0xa
	bhi _080BEB2C
	lsls r0, r0, #2
	ldr r1, _080BEAFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BEAF8: .4byte 0x03002360
_080BEAFC: .4byte 0x080BEB00
_080BEB00: @ jump table
	.4byte _080BEB2C @ case 0
	.4byte _080BEB94 @ case 1
	.4byte _080BEBE4 @ case 2
	.4byte _080BEC10 @ case 3
	.4byte _080BEC24 @ case 4
	.4byte _080BEC6C @ case 5
	.4byte _080BECB8 @ case 6
	.4byte _080BED34 @ case 7
	.4byte _080BEDB0 @ case 8
	.4byte _080BEDDC @ case 9
	.4byte _080BEE2C @ case 10
_080BEB2C:
	ldr r0, _080BEB78
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BEB3A
	b _080BEE4E
_080BEB3A:
	ldr r0, _080BEB7C
	bl m4aMPlayStop
	ldr r5, _080BEB80
	ldr r0, [r5]
	ldr r3, _080BEB84
	adds r0, r0, r3
	movs r1, #6
	strb r1, [r0]
	ldr r1, _080BEB88
	ldr r4, _080BEB8C
	ldr r0, [r4, #0xc]
	str r0, [r1]
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0x80
	lsls r0, r0, #2
	bl sub_080BFF08
	ldr r0, [r5]
	ldr r1, _080BEB90
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	movs r2, #0x87
	lsls r2, r2, #3
	adds r4, r4, r2
	strb r1, [r4]
	b _080BEE4E
	.align 2, 0
_080BEB78: .4byte 0x02037C74
_080BEB7C: .4byte 0x030074D0
_080BEB80: .4byte 0x020397EC
_080BEB84: .4byte 0x0000064A
_080BEB88: .4byte 0x03005E14
_080BEB8C: .4byte 0x03002360
_080BEB90: .4byte 0x0000064D
_080BEB94:
	ldr r1, _080BEBD8
	movs r2, #0x80
	lsls r2, r2, #6
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080BEBDC
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #3
	bl PutWindowTilemap
	movs r0, #2
	bl PutWindowTilemap
	ldr r1, _080BEBE0
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _080BEE1E
	.align 2, 0
_080BEBD8: .4byte 0x08537E8C
_080BEBDC: .4byte 0x08537B44
_080BEBE0: .4byte 0x03002360
_080BEBE4:
	movs r0, #0xd
	bl sub_080BF5B0
	movs r0, #1
	movs r1, #0xd
	bl sub_080BF638
	ldr r0, _080BEC08
	ldr r0, [r0]
	ldr r4, _080BEC0C
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl LoadPokedexBgPalette
	b _080BEE16
	.align 2, 0
_080BEC08: .4byte 0x020397EC
_080BEC0C: .4byte 0x0000064C
_080BEC10:
	bl ResetPaletteFade
	ldr r1, _080BEC20
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _080BEE1E
	.align 2, 0
_080BEC20: .4byte 0x03002360
_080BEC24:
	ldr r0, _080BEC5C
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0
	movs r2, #0xb
	movs r3, #4
	bl sub_080C00A0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	ldr r0, _080BEC60
	movs r3, #0xb0
	lsls r3, r3, #0x14
	adds r1, r1, r3
	lsrs r1, r1, #0x18
	movs r2, #4
	bl sub_080BE07C
	ldr r0, _080BEC64
	movs r1, #0xb
	movs r2, #6
	bl sub_080BE07C
	ldr r1, _080BEC68
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _080BEE1E
	.align 2, 0
_080BEC5C: .4byte 0x020397F4
_080BEC60: .4byte 0x085C8FD4
_080BEC64: .4byte 0x085C8FD6
_080BEC68: .4byte 0x03002360
_080BEC6C:
	ldr r0, _080BECA8
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0x30
	movs r2, #0x38
	movs r3, #0
	bl CreateMonSpriteFromNationalDexNumber
	ldr r2, _080BECAC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r3, #0
	strh r0, [r1, #0x10]
	ldr r2, _080BECB0
	movs r4, #0x10
	ldrsh r0, [r1, r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	ldr r0, _080BECB4
	strb r3, [r0]
	b _080BEE16
	.align 2, 0
_080BECA8: .4byte 0x020397F4
_080BECAC: .4byte 0x03005B60
_080BECB0: .4byte 0x020205AC
_080BECB4: .4byte 0x03005F2C
_080BECB8:
	ldr r1, _080BED14
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r1, _080BED18
	orrs r0, r1
	ldr r1, _080BED1C
	ands r0, r1
	movs r1, #0xf8
	lsls r1, r1, #0xd
	orrs r0, r1
	ldr r1, _080BED20
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x14
	orrs r0, r1
	str r0, [sp, #4]
	ldr r1, _080BED24
	ldr r0, [sp, #8]
	ands r0, r1
	movs r1, #0xf0
	lsls r1, r1, #5
	orrs r0, r1
	ldr r1, _080BED28
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	str r0, [sp, #8]
	add r0, sp, #4
	movs r1, #2
	bl sub_08145420
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BECFE
	b _080BEE4E
_080BECFE:
	ldr r1, _080BED2C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	ldr r0, _080BED30
	strb r2, [r0]
	b _080BEE4E
	.align 2, 0
_080BED14: .4byte 0xFFFF0000
_080BED18: .4byte 0x00004020
_080BED1C: .4byte 0xFF00FFFF
_080BED20: .4byte 0x00FFFFFF
_080BED24: .4byte 0xFFFF00FF
_080BED28: .4byte 0xFFFFFF00
_080BED2C: .4byte 0x03002360
_080BED30: .4byte 0x03005F2C
_080BED34:
	ldr r1, _080BEDA0
	ldr r0, [sp, #0xc]
	ands r0, r1
	movs r1, #0x90
	lsls r1, r1, #0x14
	orrs r0, r1
	str r0, [sp, #0xc]
	ldr r2, _080BEDA4
	add r0, sp, #0xc
	ldr r1, [r0, #4]
	ands r1, r2
	movs r2, #0x12
	orrs r1, r2
	ldr r2, _080BEDA8
	ands r1, r2
	movs r2, #0xc0
	lsls r2, r2, #2
	orrs r1, r2
	str r1, [r0, #4]
	movs r1, #3
	bl sub_0814591C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BED74
	ldr r1, _080BEDAC
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080BED74:
	movs r0, #3
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _080BEE4E
	.align 2, 0
_080BEDA0: .4byte 0x00FFFFFF
_080BEDA4: .4byte 0xFFFFFF00
_080BEDA8: .4byte 0xFFFF00FF
_080BEDAC: .4byte 0x03002360
_080BEDB0:
	movs r0, #0x15
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080BEDD4
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r1, _080BEDD8
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _080BEE1E
	.align 2, 0
_080BEDD4: .4byte 0x03005E14
_080BEDD8: .4byte 0x03002360
_080BEDDC:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
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
	movs r0, #3
	bl ShowBg
_080BEE16:
	ldr r1, _080BEE28
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_080BEE1E:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080BEE4E
	.align 2, 0
_080BEE28: .4byte 0x03002360
_080BEE2C:
	ldr r0, _080BEE58
	ldr r0, [r0]
	ldr r1, _080BEE5C
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	movs r3, #0x87
	lsls r3, r3, #3
	adds r0, r2, r3
	strb r1, [r0]
	ldr r1, _080BEE60
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BEE64
	str r1, [r0]
_080BEE4E:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BEE58: .4byte 0x020397EC
_080BEE5C: .4byte 0x0000064E
_080BEE60: .4byte 0x03005B60
_080BEE64: .4byte 0x080BEE69
	thumb_func_end sub_080BEAD4

	thumb_func_start sub_080BEE68
sub_080BEE68: @ 0x080BEE68
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #2
	bl sub_08145528
	bl IsCryPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BEE88
	movs r0, #1
	bl sub_080BF098
	b _080BEE8E
_080BEE88:
	movs r0, #0
	bl sub_080BF098
_080BEE8E:
	ldr r1, _080BEEB8
	ldrh r2, [r1, #0x2e]
	movs r0, #1
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _080BEEC0
	movs r0, #1
	bl sub_080BF098
	ldr r0, _080BEEBC
	ldr r0, [r0]
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_08145600
	b _080BF00E
	.align 2, 0
_080BEEB8: .4byte 0x03002360
_080BEEBC: .4byte 0x020397F4
_080BEEC0:
	ldr r0, _080BEF18
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080BEED2
	b _080BF00E
_080BEED2:
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080BEF30
	movs r0, #0x15
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BEF1C
	bl m4aMPlayContinue
	ldr r0, _080BEF20
	ldr r0, [r0]
	ldr r1, _080BEF24
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	ldr r1, _080BEF28
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BEF2C
	str r1, [r0]
	movs r0, #3
	bl PlaySE
	b _080BF00E
	.align 2, 0
_080BEF18: .4byte 0x02037C74
_080BEF1C: .4byte 0x030074D0
_080BEF20: .4byte 0x020397EC
_080BEF24: .4byte 0x0000064E
_080BEF28: .4byte 0x03005B60
_080BEF2C: .4byte 0x080BF02D
_080BEF30:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _080BEF4C
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080BEF9C
	ldr r0, _080BEF84
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _080BEF9C
_080BEF4C:
	movs r0, #0x15
	rsbs r0, r0, #0
	str r3, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BEF88
	bl m4aMPlayContinue
	ldr r0, _080BEF8C
	ldr r0, [r0]
	ldr r1, _080BEF90
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	ldr r1, _080BEF94
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BEF98
	str r1, [r0]
	movs r0, #0x6d
	bl PlaySE
	b _080BF00E
	.align 2, 0
_080BEF84: .4byte 0x03005AF0
_080BEF88: .4byte 0x030074D0
_080BEF8C: .4byte 0x020397EC
_080BEF90: .4byte 0x0000064E
_080BEF94: .4byte 0x03005B60
_080BEF98: .4byte 0x080BF02D
_080BEF9C:
	ldrh r1, [r5, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080BEFBA
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BF00E
	ldr r0, _080BEFD0
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _080BF00E
_080BEFBA:
	ldr r0, _080BEFD4
	ldr r0, [r0]
	ldrb r1, [r0, #2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BEFD8
	movs r0, #0x20
	bl PlaySE
	b _080BF00E
	.align 2, 0
_080BEFD0: .4byte 0x03005AF0
_080BEFD4: .4byte 0x020397F4
_080BEFD8:
	movs r0, #0x15
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BF018
	bl m4aMPlayContinue
	ldr r0, _080BF01C
	ldr r0, [r0]
	ldr r1, _080BF020
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	ldr r1, _080BF024
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BF028
	str r1, [r0]
	movs r0, #0x6d
	bl PlaySE
_080BF00E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF018: .4byte 0x030074D0
_080BF01C: .4byte 0x020397EC
_080BF020: .4byte 0x0000064E
_080BF024: .4byte 0x03005B60
_080BF028: .4byte 0x080BF02D
	thumb_func_end sub_080BEE68

	thumb_func_start sub_080BF02C
sub_080BF02C: @ 0x080BF02C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080BF06C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BF08C
	bl sub_081459E0
	ldr r1, _080BF070
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x10]
	bl FreeAndDestroyMonPicSprite
	ldr r0, _080BF074
	ldr r0, [r0]
	ldr r1, _080BF078
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	beq _080BF080
	cmp r0, #2
	ble _080BF068
	cmp r0, #3
	beq _080BF088
_080BF068:
	ldr r0, _080BF07C
	b _080BF08A
	.align 2, 0
_080BF06C: .4byte 0x02037C74
_080BF070: .4byte 0x03005B60
_080BF074: .4byte 0x020397EC
_080BF078: .4byte 0x0000064E
_080BF07C: .4byte 0x080BE1C9
_080BF080:
	ldr r0, _080BF084
	b _080BF08A
	.align 2, 0
_080BF084: .4byte 0x080BE931
_080BF088:
	ldr r0, _080BF094
_080BF08A:
	str r0, [r4]
_080BF08C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF094: .4byte 0x080BF0C9
	thumb_func_end sub_080BF02C

	thumb_func_start sub_080BF098
sub_080BF098: @ 0x080BF098
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BF0AC
	ldr r1, _080BF0A8
	b _080BF0AE
	.align 2, 0
_080BF0A8: .4byte 0x00000392
_080BF0AC:
	ldr r1, _080BF0C4
_080BF0AE:
	mov r0, sp
	strh r1, [r0]
	mov r0, sp
	movs r1, #0x5d
	movs r2, #2
	bl LoadPalette
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BF0C4: .4byte 0x000002AF
	thumb_func_end sub_080BF098

	thumb_func_start sub_080BF0C8
sub_080BF0C8: @ 0x080BF0C8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080BF0EC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #9
	bhi _080BF11C
	lsls r0, r0, #2
	ldr r1, _080BF0F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BF0EC: .4byte 0x03002360
_080BF0F0: .4byte 0x080BF0F4
_080BF0F4: @ jump table
	.4byte _080BF11C @ case 0
	.4byte _080BF174 @ case 1
	.4byte _080BF1AC @ case 2
	.4byte _080BF1D8 @ case 3
	.4byte _080BF228 @ case 4
	.4byte _080BF22E @ case 5
	.4byte _080BF2E8 @ case 6
	.4byte _080BF3A4 @ case 7
	.4byte _080BF3D0 @ case 8
	.4byte _080BF420 @ case 9
_080BF11C:
	ldr r0, _080BF160
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BF12A
	b _080BF450
_080BF12A:
	ldr r4, _080BF164
	ldr r0, [r4]
	ldr r1, _080BF168
	adds r0, r0, r1
	movs r1, #7
	strb r1, [r0]
	ldr r1, _080BF16C
	ldr r0, [r5, #0xc]
	str r0, [r1]
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0x80
	lsls r0, r0, #2
	bl sub_080BFF08
	ldr r0, [r4]
	ldr r2, _080BF170
	adds r0, r0, r2
	movs r1, #2
	strb r1, [r0]
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	b _080BF450
	.align 2, 0
_080BF160: .4byte 0x02037C74
_080BF164: .4byte 0x020397EC
_080BF168: .4byte 0x0000064A
_080BF16C: .4byte 0x03005E14
_080BF170: .4byte 0x0000064D
_080BF174:
	ldr r1, _080BF1A4
	movs r2, #0x80
	lsls r2, r2, #6
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080BF1A8
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	b _080BF40A
	.align 2, 0
_080BF1A4: .4byte 0x08537E8C
_080BF1A8: .4byte 0x08537C30
_080BF1AC:
	movs r0, #0xd
	bl sub_080BF5B0
	movs r0, #2
	movs r1, #0xd
	bl sub_080BF638
	ldr r0, _080BF1D0
	ldr r0, [r0]
	ldr r1, _080BF1D4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl LoadPokedexBgPalette
	b _080BF40A
	.align 2, 0
_080BF1D0: .4byte 0x020397EC
_080BF1D4: .4byte 0x0000064C
_080BF1D8:
	ldr r0, _080BF214
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0
	movs r2, #4
	movs r3, #0xf
	bl sub_080C00A0
	ldr r0, _080BF218
	movs r1, #9
	movs r2, #0xf
	bl sub_080BE07C
	ldr r0, _080BF21C
	ldr r0, [r0]
	movs r1, #0xb
	movs r2, #0xf
	bl sub_080BE07C
	ldr r0, _080BF220
	movs r1, #0x10
	movs r2, #0xf
	bl sub_080BE07C
	ldr r1, _080BF224
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080BF412
	.align 2, 0
_080BF214: .4byte 0x020397F4
_080BF218: .4byte 0x085C8FDB
_080BF21C: .4byte 0x03005AF0
_080BF220: .4byte 0x085C8FDD
_080BF224: .4byte 0x03002360
_080BF228:
	bl ResetPaletteFade
	b _080BF40A
_080BF22E:
	ldr r0, _080BF2CC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bl PlayerGenderToFrontTrainerPicId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x98
	movs r2, #0x38
	movs r3, #0
	bl sub_080C0450
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080BF2D0
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #3]
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #5]
	ldr r3, _080BF2D4
	ldr r0, _080BF2D8
	ldr r2, [r0]
	ldrh r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x26]
	ldrh r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x16]
	str r1, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	ldr r0, _080BF2DC
	ldrb r1, [r4, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _080BF2E0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #0x12]
	ldr r1, _080BF2E4
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080BF412
	.align 2, 0
_080BF2CC: .4byte 0x03005AF0
_080BF2D0: .4byte 0x020205AC
_080BF2D4: .4byte 0x0854069C
_080BF2D8: .4byte 0x020397F4
_080BF2DC: .4byte 0x085430F0
_080BF2E0: .4byte 0x03005B60
_080BF2E4: .4byte 0x03002360
_080BF2E8:
	ldr r5, _080BF390
	ldr r0, [r5]
	ldrh r0, [r0]
	movs r1, #0x58
	movs r2, #0x38
	movs r3, #1
	bl CreateMonSpriteFromNationalDexNumber
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080BF394
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4, #3]
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #5]
	ldr r3, _080BF398
	ldr r2, [r5]
	ldrh r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x14]
	strh r0, [r4, #0x26]
	ldrh r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x12]
	str r1, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	ldr r0, _080BF39C
	ldrb r1, [r4, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _080BF3A0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #0x10]
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _080BF40A
	.align 2, 0
_080BF390: .4byte 0x020397F4
_080BF394: .4byte 0x020205AC
_080BF398: .4byte 0x0854069C
_080BF39C: .4byte 0x085430F0
_080BF3A0: .4byte 0x03005B60
_080BF3A4:
	movs r0, #0x15
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080BF3C8
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r1, _080BF3CC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080BF412
	.align 2, 0
_080BF3C8: .4byte 0x03005E14
_080BF3CC: .4byte 0x03002360
_080BF3D0:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl HideBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
_080BF40A:
	ldr r1, _080BF41C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_080BF412:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080BF450
	.align 2, 0
_080BF41C: .4byte 0x03002360
_080BF420:
	ldr r0, _080BF458
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080BF450
	ldr r0, _080BF45C
	ldr r0, [r0]
	ldr r1, _080BF460
	adds r0, r0, r1
	strb r2, [r0]
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r5, r1
	strb r2, [r0]
	ldr r1, _080BF464
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BF468
	str r1, [r0]
_080BF450:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF458: .4byte 0x02037C74
_080BF45C: .4byte 0x020397EC
_080BF460: .4byte 0x0000064E
_080BF464: .4byte 0x03005B60
_080BF468: .4byte 0x080BF46D
	thumb_func_end sub_080BF0C8

	thumb_func_start sub_080BF46C
sub_080BF46C: @ 0x080BF46C
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r0, _080BF4B8
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080BF4CC
	movs r0, #0x15
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BF4BC
	ldr r0, [r0]
	ldr r1, _080BF4C0
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	ldr r1, _080BF4C4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BF4C8
	str r1, [r0]
	movs r0, #3
	bl PlaySE
	b _080BF518
	.align 2, 0
_080BF4B8: .4byte 0x03002360
_080BF4BC: .4byte 0x020397EC
_080BF4C0: .4byte 0x0000064E
_080BF4C4: .4byte 0x03005B60
_080BF4C8: .4byte 0x080BF535
_080BF4CC:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080BF4E8
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BF518
	ldr r0, _080BF520
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _080BF518
_080BF4E8:
	movs r0, #0x15
	rsbs r0, r0, #0
	str r2, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BF524
	ldr r0, [r0]
	ldr r1, _080BF528
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	ldr r1, _080BF52C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080BF530
	str r1, [r0]
	movs r0, #0x6d
	bl PlaySE
_080BF518:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF520: .4byte 0x03005AF0
_080BF524: .4byte 0x020397EC
_080BF528: .4byte 0x0000064E
_080BF52C: .4byte 0x03005B60
_080BF530: .4byte 0x080BF535
	thumb_func_end sub_080BF46C

	thumb_func_start sub_080BF534
sub_080BF534: @ 0x080BF534
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080BF574
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BF58C
	ldr r1, _080BF578
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x10]
	bl FreeAndDestroyMonPicSprite
	ldrh r0, [r4, #0x12]
	bl FreeAndDestroyTrainerPicSprite
	ldr r0, _080BF57C
	ldr r0, [r0]
	ldr r1, _080BF580
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080BF56E
	cmp r0, #2
	beq _080BF588
_080BF56E:
	ldr r0, _080BF584
	b _080BF58A
	.align 2, 0
_080BF574: .4byte 0x02037C74
_080BF578: .4byte 0x03005B60
_080BF57C: .4byte 0x020397EC
_080BF580: .4byte 0x0000064E
_080BF584: .4byte 0x080BE1C9
_080BF588:
	ldr r0, _080BF594
_080BF58A:
	str r0, [r4]
_080BF58C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF594: .4byte 0x080BEAD5
	thumb_func_end sub_080BF534

	thumb_func_start sub_080BF598
sub_080BF598: @ 0x080BF598
	push {lr}
	ldr r1, _080BF5AC
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080BF5AC: .4byte 0x08537D24
	thumb_func_end sub_080BF598

	thumb_func_start sub_080BF5B0
sub_080BF5B0: @ 0x080BF5B0
	push {lr}
	ldr r1, _080BF5C4
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080BF5C4: .4byte 0x08537DB4
	thumb_func_end sub_080BF5B0

	thumb_func_start sub_080BF5C8
sub_080BF5C8: @ 0x080BF5C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #1
	bl GetBgTilemapBuffer
	adds r7, r0, #0
	movs r1, #0
_080BF5DE:
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r3, #0x80
	lsls r3, r3, #7
	cmp r1, r8
	bne _080BF5F4
	movs r3, #0x80
	lsls r3, r3, #6
_080BF5F4:
	movs r2, #0
	adds r6, r1, #1
	ldr r4, _080BF634
_080BF5FA:
	adds r1, r5, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	ands r0, r4
	orrs r0, r3
	strh r0, [r1]
	adds r1, #0x40
	ldrh r0, [r1]
	ands r0, r4
	orrs r0, r3
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #6
	bls _080BF5FA
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080BF5DE
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF634: .4byte 0x00000FFF
	thumb_func_end sub_080BF5C8

	thumb_func_start sub_080BF638
sub_080BF638: @ 0x080BF638
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #1
	bl GetBgTilemapBuffer
	adds r7, r0, #0
	movs r1, #0
_080BF64E:
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r1, r8
	beq _080BF660
	cmp r1, #3
	bne _080BF666
_080BF660:
	movs r3, #0x80
	lsls r3, r3, #6
	b _080BF66A
_080BF666:
	movs r3, #0x80
	lsls r3, r3, #7
_080BF66A:
	movs r2, #0
	adds r5, r1, #1
	ldr r4, _080BF6AC
_080BF670:
	adds r1, r6, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	ands r0, r4
	orrs r0, r3
	strh r0, [r1]
	adds r1, #0x40
	ldrh r0, [r1]
	ands r0, r4
	orrs r0, r3
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #6
	bls _080BF670
	lsls r0, r5, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080BF64E
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF6AC: .4byte 0x00000FFF
	thumb_func_end sub_080BF638

	thumb_func_start CreateDexDisplayMonDataTask
CreateDexDisplayMonDataTask: @ 0x080BF6B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080BF6EC
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080BF6F0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1, #8]
	strh r4, [r1, #0xa]
	strh r5, [r1, #0x20]
	lsrs r5, r5, #0x10
	strh r5, [r1, #0x22]
	strh r6, [r1, #0x24]
	lsrs r6, r6, #0x10
	strh r6, [r1, #0x26]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BF6EC: .4byte 0x080BF6F5
_080BF6F0: .4byte 0x03005B60
	thumb_func_end CreateDexDisplayMonDataTask

	thumb_func_start sub_080BF6F4
sub_080BF6F4: @ 0x080BF6F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080BF71C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r5, [r0, #0xa]
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r4, r1, #0
	cmp r0, #6
	bhi _080BF740
	lsls r0, r0, #2
	ldr r1, _080BF720
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BF71C: .4byte 0x03005B60
_080BF720: .4byte 0x080BF724
_080BF724: @ jump table
	.4byte _080BF740 @ case 0
	.4byte _080BF7C8 @ case 1
	.4byte _080BF834 @ case 2
	.4byte _080BF83E @ case 3
	.4byte _080BF904 @ case 4
	.4byte _080BF95C @ case 5
	.4byte _080BF9A0 @ case 6
_080BF740:
	ldr r0, _080BF7B0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BF74E
	b _080BF9D0
_080BF74E:
	ldr r1, _080BF7B4
	ldr r0, _080BF7B8
	ldr r0, [r0, #0xc]
	str r0, [r1]
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0x80
	lsls r0, r0, #1
	bl sub_080BFF08
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080BF7BC
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #3
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r0, _080BF7C0
	bl InitWindows
	bl DeactivateAllTextPrinters
	ldr r1, _080BF7C4
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #8]
	b _080BF9D0
	.align 2, 0
_080BF7B0: .4byte 0x02037C74
_080BF7B4: .4byte 0x03005E14
_080BF7B8: .4byte 0x03002360
_080BF7BC: .4byte 0x08543148
_080BF7C0: .4byte 0x08543150
_080BF7C4: .4byte 0x03005B60
_080BF7C8:
	ldr r1, _080BF828
	movs r2, #0x80
	lsls r2, r2, #6
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _080BF82C
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	ldr r0, _080BF830
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r1, [r4, #0xa]
	movs r0, #1
	bl sub_080C0288
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	bl ResetPaletteFade
	movs r0, #0
	bl LoadPokedexBgPalette
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080BF9D0
	.align 2, 0
_080BF828: .4byte 0x08537E8C
_080BF82C: .4byte 0x08537A10
_080BF830: .4byte 0x03005B60
_080BF834:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r4
	b _080BF994
_080BF83E:
	ldr r0, _080BF868
	movs r1, #3
	movs r2, #0
	bl sub_080BE07C
	bl IsNationalPokedexEnabled
	cmp r0, #0
	bne _080BF86C
	adds r0, r5, #0
	bl NationalToHoennOrder
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0xd
	movs r3, #3
	bl sub_080C0020
	b _080BF878
	.align 2, 0
_080BF868: .4byte 0x085C8FE7
_080BF86C:
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0xd
	movs r3, #3
	bl sub_080C0020
_080BF878:
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x11
	movs r3, #3
	bl sub_080C00A0
	ldr r0, _080BF8F4
	movs r1, #0xd
	movs r2, #5
	bl sub_080BE07C
	ldr r0, _080BF8F8
	movs r1, #0x10
	movs r2, #7
	bl sub_080BE07C
	ldr r0, _080BF8FC
	movs r1, #0x10
	movs r2, #9
	bl sub_080BE07C
	lsls r4, r5, #3
	subs r4, r4, r5
	lsls r4, r4, #2
	ldr r6, _080BF900
	adds r5, r4, r6
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0xd
	movs r3, #5
	bl sub_080C0150
	ldrh r1, [r5, #6]
	movs r0, #0
	movs r2, #0x10
	movs r3, #7
	bl sub_080C01C8
	ldrh r1, [r5, #8]
	movs r0, #0
	movs r2, #0x10
	movs r3, #9
	bl sub_080C01C8
	adds r6, #0xc
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #3
	movs r2, #0xd
	bl sub_080BE07C
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _080BF98A
	.align 2, 0
_080BF8F4: .4byte 0x085C8FBB
_080BF8F8: .4byte 0x085C8FC5
_080BF8FC: .4byte 0x085C8FCC
_080BF900: .4byte 0x0854069C
_080BF904:
	adds r0, r5, #0
	movs r1, #0x30
	movs r2, #0x38
	movs r3, #0
	bl CreateMonSpriteFromNationalDexNumber
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080BF950
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080BF954
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r1, _080BF958
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #0xe]
	b _080BF994
	.align 2, 0
_080BF950: .4byte 0x020205AC
_080BF954: .4byte 0x03005E14
_080BF958: .4byte 0x03005B60
_080BF95C:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
_080BF98A:
	ldr r1, _080BF99C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
_080BF994:
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _080BF9D0
	.align 2, 0
_080BF99C: .4byte 0x03005B60
_080BF9A0:
	ldr r0, _080BF9D8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080BF9D0
	adds r0, r5, #0
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl PlayCry1
	ldr r1, _080BF9DC
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #0xc]
	ldr r1, _080BF9E0
	str r1, [r0]
_080BF9D0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF9D8: .4byte 0x02037C74
_080BF9DC: .4byte 0x03005B60
_080BF9E0: .4byte 0x080BF9E5
	thumb_func_end sub_080BF6F4

	thumb_func_start sub_080BF9E4
sub_080BF9E4: @ 0x080BF9E4
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080BFA2C
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080BFA44
	ldr r0, _080BFA30
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r3, _080BFA34
	ldr r0, _080BFA38
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xe
	ldrsh r2, [r1, r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x1c
	adds r0, r0, r3
	ldr r2, _080BFA3C
	str r2, [r0]
	ldr r0, _080BFA40
	str r0, [r1]
	b _080BFA7A
	.align 2, 0
_080BFA2C: .4byte 0x03002360
_080BFA30: .4byte 0x0000FFFF
_080BFA34: .4byte 0x020205AC
_080BFA38: .4byte 0x03005B60
_080BFA3C: .4byte 0x080BFB29
_080BFA40: .4byte 0x080BFA89
_080BFA44:
	ldr r1, _080BFA68
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0xc]
	adds r1, #1
	strh r1, [r0, #0xc]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080BFA70
	ldr r0, _080BFA6C
	movs r1, #0x31
	movs r2, #0xe
	bl LoadPalette
	b _080BFA7A
	.align 2, 0
_080BFA68: .4byte 0x03005B60
_080BFA6C: .4byte 0x08537422
_080BFA70:
	ldr r0, _080BFA84
	movs r1, #0x31
	movs r2, #0xe
	bl LoadPalette
_080BFA7A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFA84: .4byte 0x08537482
	thumb_func_end sub_080BF9E4

	thumb_func_start blockset_load_palette_to_gpu
blockset_load_palette_to_gpu: @ 0x080BFA88
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080BFB1C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BFB16
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	bl FreeAllWindowBuffers
	movs r0, #2
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BFAB6
	bl Free
_080BFAB6:
	movs r0, #3
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080BFAC4
	bl Free
_080BFAC4:
	ldr r0, _080BFB20
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0xa]
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x22]
	lsls r1, r1, #0x10
	ldrh r2, [r4, #0x20]
	orrs r1, r2
	ldrh r2, [r4, #0x26]
	lsls r2, r2, #0x10
	ldrh r3, [r4, #0x24]
	orrs r2, r3
	ldr r5, _080BFB24
	movs r3, #0xe
	ldrsh r4, [r4, r3]
	lsls r3, r4, #4
	adds r3, r3, r4
	lsls r3, r3, #2
	adds r3, r3, r5
	ldrb r4, [r3, #5]
	lsrs r4, r4, #4
	bl GetMonSpritePalFromSpeciesAndPersonality
	lsls r4, r4, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r4, r1
	adds r1, r4, #0
	movs r2, #0x20
	bl LoadCompressedPalette
	adds r0, r6, #0
	bl DestroyTask
_080BFB16:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BFB1C: .4byte 0x02037C74
_080BFB20: .4byte 0x03005B60
_080BFB24: .4byte 0x020205AC
	thumb_func_end blockset_load_palette_to_gpu

	thumb_func_start sub_080BFB28
sub_080BFB28: @ 0x080BFB28
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x20]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #0x77
	bgt _080BFB3A
	adds r0, r2, #2
	strh r0, [r1, #0x20]
_080BFB3A:
	ldrh r2, [r1, #0x20]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #0x78
	ble _080BFB48
	subs r0, r2, #2
	strh r0, [r1, #0x20]
_080BFB48:
	ldrh r2, [r1, #0x22]
	movs r3, #0x22
	ldrsh r0, [r1, r3]
	cmp r0, #0x4f
	bgt _080BFB56
	adds r0, r2, #1
	strh r0, [r1, #0x22]
_080BFB56:
	ldrh r2, [r1, #0x22]
	movs r3, #0x22
	ldrsh r0, [r1, r3]
	cmp r0, #0x50
	ble _080BFB64
	subs r0, r2, #1
	strh r0, [r1, #0x22]
_080BFB64:
	pop {r0}
	bx r0
	thumb_func_end sub_080BFB28

	thumb_func_start sub_080BFB68
sub_080BFB68: @ 0x080BFB68
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080BFB7C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080BFB7C: .4byte 0x0854069C
	thumb_func_end sub_080BFB68

	thumb_func_start GetPokedexHeightWeight
GetPokedexHeightWeight: @ 0x080BFB80
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0
	beq _080BFB96
	cmp r1, #1
	beq _080BFBA8
	movs r0, #1
	b _080BFBB4
_080BFB96:
	ldr r0, _080BFBA4
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #6]
	b _080BFBB4
	.align 2, 0
_080BFBA4: .4byte 0x0854069C
_080BFBA8:
	ldr r0, _080BFBB8
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #8]
_080BFBB4:
	pop {r1}
	bx r1
	.align 2, 0
_080BFBB8: .4byte 0x0854069C
	thumb_func_end GetPokedexHeightWeight

	thumb_func_start GetSetPokedexFlag
GetSetPokedexFlag: @ 0x080BFBBC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	adds r3, r2, #0
	ldr r1, _080BFBF0
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	lsrs r0, r0, #0x13
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #7
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r1
	lsrs r5, r0, #0x18
	movs r6, #0
	cmp r2, #1
	beq _080BFC54
	cmp r2, #1
	bgt _080BFBF4
	cmp r2, #0
	beq _080BFC02
	b _080BFD40
	.align 2, 0
_080BFBF0: .4byte 0xFFFF0000
_080BFBF4:
	cmp r3, #2
	bne _080BFBFA
	b _080BFCF4
_080BFBFA:
	cmp r3, #3
	bne _080BFC00
	b _080BFD30
_080BFC00:
	b _080BFD40
_080BFC02:
	ldr r1, _080BFC44
	ldr r0, [r1]
	adds r0, #0x5c
	adds r0, r0, r4
	ldrb r2, [r0]
	ands r2, r5
	adds r7, r1, #0
	cmp r2, #0
	bne _080BFC16
	b _080BFD40
_080BFC16:
	ldr r0, _080BFC48
	ldr r3, [r0]
	ldr r6, _080BFC4C
	adds r1, r3, r6
	adds r1, r1, r4
	ldrb r1, [r1]
	ands r1, r5
	adds r6, r0, #0
	cmp r2, r1
	bne _080BFC38
	ldr r1, _080BFC50
	adds r0, r3, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	beq _080BFC96
_080BFC38:
	ldr r1, [r7]
	adds r1, #0x5c
	adds r1, r1, r4
	mvns r3, r5
	b _080BFCC2
	.align 2, 0
_080BFC44: .4byte 0x03005AF0
_080BFC48: .4byte 0x03005AEC
_080BFC4C: .4byte 0x00000988
_080BFC50: .4byte 0x00003B24
_080BFC54:
	ldr r1, _080BFC9C
	ldr r3, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r2, [r0]
	ands r2, r5
	adds r7, r1, #0
	cmp r2, #0
	beq _080BFD40
	adds r0, r3, #0
	adds r0, #0x5c
	adds r0, r0, r4
	ldrb r0, [r0]
	ands r0, r5
	ldr r6, _080BFCA0
	cmp r2, r0
	bne _080BFCAC
	ldr r1, [r6]
	ldr r3, _080BFCA4
	adds r0, r1, r3
	adds r0, r0, r4
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	bne _080BFCAC
	ldr r3, _080BFCA8
	adds r0, r1, r3
	adds r0, r0, r4
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	bne _080BFCAC
_080BFC96:
	movs r6, #1
	b _080BFD40
	.align 2, 0
_080BFC9C: .4byte 0x03005AF0
_080BFCA0: .4byte 0x03005AEC
_080BFCA4: .4byte 0x00000988
_080BFCA8: .4byte 0x00003B24
_080BFCAC:
	ldr r1, [r7]
	adds r1, #0x28
	adds r1, r1, r4
	mvns r3, r5
	ldrb r2, [r1]
	adds r0, r3, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r7]
	adds r1, #0x5c
	adds r1, r1, r4
_080BFCC2:
	ldrb r2, [r1]
	adds r0, r3, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r6]
	ldr r0, _080BFCEC
	adds r1, r1, r0
	adds r1, r1, r4
	ldrb r2, [r1]
	adds r0, r3, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	ldr r1, _080BFCF0
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	movs r6, #0
	b _080BFD40
	.align 2, 0
_080BFCEC: .4byte 0x00000988
_080BFCF0: .4byte 0x00003B24
_080BFCF4:
	ldr r0, _080BFD20
	ldr r1, [r0]
	adds r1, #0x5c
	adds r1, r1, r4
	ldrb r2, [r1]
	adds r0, r5, #0
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _080BFD24
	ldr r1, [r3]
	ldr r0, _080BFD28
	adds r1, r1, r0
	adds r1, r1, r4
	ldrb r2, [r1]
	adds r0, r5, #0
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	ldr r3, _080BFD2C
	adds r1, r1, r3
	b _080BFD36
	.align 2, 0
_080BFD20: .4byte 0x03005AF0
_080BFD24: .4byte 0x03005AEC
_080BFD28: .4byte 0x00000988
_080BFD2C: .4byte 0x00003B24
_080BFD30:
	ldr r0, _080BFD48
	ldr r1, [r0]
	adds r1, #0x28
_080BFD36:
	adds r1, r1, r4
	ldrb r2, [r1]
	adds r0, r5, #0
	orrs r0, r2
	strb r0, [r1]
_080BFD40:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BFD48: .4byte 0x03005AF0
	thumb_func_end GetSetPokedexFlag

	thumb_func_start GetNationalPokedexCount
GetNationalPokedexCount: @ 0x080BFD4C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	movs r0, #0
	ldr r7, _080BFD64
_080BFD58:
	cmp r6, #0
	beq _080BFD68
	cmp r6, #1
	beq _080BFD72
	adds r4, r0, #1
	b _080BFD8A
	.align 2, 0
_080BFD64: .4byte 0x00000181
_080BFD68:
	adds r4, r0, #1
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	b _080BFD7A
_080BFD72:
	adds r4, r0, #1
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
_080BFD7A:
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BFD8A
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080BFD8A:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r7
	bls _080BFD58
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetNationalPokedexCount

	thumb_func_start GetHoennPokedexCount
GetHoennPokedexCount: @ 0x080BFD9C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	movs r0, #0
_080BFDA6:
	cmp r6, #0
	beq _080BFDB2
	cmp r6, #1
	beq _080BFDC4
	adds r4, r0, #1
	b _080BFDE4
_080BFDB2:
	adds r4, r0, #1
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl SpeciesToNationalPokedexNum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	b _080BFDD4
_080BFDC4:
	adds r4, r0, #1
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl SpeciesToNationalPokedexNum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
_080BFDD4:
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BFDE4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080BFDE4:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc9
	bls _080BFDA6
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetHoennPokedexCount

	thumb_func_start sub_080BFDF4
sub_080BFDF4: @ 0x080BFDF4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	movs r0, #0
_080BFDFE:
	cmp r6, #0
	beq _080BFE0A
	cmp r6, #1
	beq _080BFE14
	adds r4, r0, #1
	b _080BFE2C
_080BFE0A:
	adds r4, r0, #1
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	b _080BFE1C
_080BFE14:
	adds r4, r0, #1
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
_080BFE1C:
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BFE2C
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080BFE2C:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x96
	bls _080BFDFE
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080BFDF4

	thumb_func_start HasAllHoennMons
HasAllHoennMons: @ 0x080BFE3C
	push {r4, lr}
	movs r0, #0
_080BFE40:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl SpeciesToNationalPokedexNum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BFE60
	movs r0, #0
	b _080BFE68
_080BFE60:
	adds r0, r4, #0
	cmp r0, #0xc7
	bls _080BFE40
	movs r0, #1
_080BFE68:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HasAllHoennMons

	thumb_func_start sub_080BFE70
sub_080BFE70: @ 0x080BFE70
	push {r4, lr}
	movs r0, #0
_080BFE74:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BFE8C
	movs r0, #0
	b _080BFE94
_080BFE8C:
	adds r0, r4, #0
	cmp r0, #0x95
	bls _080BFE74
	movs r0, #1
_080BFE94:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080BFE70

	thumb_func_start sub_080BFE9C
sub_080BFE9C: @ 0x080BFE9C
	push {r4, r5, lr}
	movs r0, #0
_080BFEA0:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BFEEE
	adds r0, r4, #0
	cmp r0, #0x95
	bls _080BFEA0
	movs r0, #0x97
_080BFEBC:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BFEEE
	adds r0, r4, #0
	cmp r0, #0xf7
	bls _080BFEBC
	movs r0, #0xfb
	ldr r5, _080BFEF4
_080BFEDA:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BFEF8
_080BFEEE:
	movs r0, #0
	b _080BFF00
	.align 2, 0
_080BFEF4: .4byte 0x0000017F
_080BFEF8:
	adds r0, r4, #0
	cmp r0, r5
	bls _080BFEDA
	movs r0, #1
_080BFF00:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080BFE9C

	thumb_func_start sub_080BFF08
sub_080BFF08: @ 0x080BFF08
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080BFF3A
	movs r0, #0
	bl ClearGpuRegBits
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
_080BFF3A:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080BFF64
	movs r0, #0
	bl ClearGpuRegBits
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
_080BFF64:
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080BFF8E
	movs r0, #0
	bl ClearGpuRegBits
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
_080BFF8E:
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080BFFB8
	movs r0, #0
	bl ClearGpuRegBits
	movs r0, #0xe
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
_080BFFB8:
	movs r1, #0x80
	lsls r1, r1, #5
	ands r5, r1
	cmp r5, #0
	bne _080BFFD6
	movs r0, #0
	bl ClearGpuRegBits
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _080BFFDC
	movs r0, #8
	strb r0, [r1]
_080BFFD6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BFFDC: .4byte 0x030030BC
	thumb_func_end sub_080BFF08

	thumb_func_start sub_080BFFE0
sub_080BFFE0: @ 0x080BFFE0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r3, #0x18
	add r4, sp, #0x14
	movs r6, #0
	strb r6, [r4]
	adds r5, r4, #0
	movs r4, #0xf
	strb r4, [r5, #1]
	movs r4, #3
	strb r4, [r5, #2]
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r6, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	subs r4, #4
	str r4, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #1
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080BFFE0

	thumb_func_start sub_080C0020
sub_080C0020: @ 0x080C0020
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r5, sp
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r5]
	mov r5, sp
	adds r0, r4, #0
	movs r1, #0x64
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r5, #1]
	mov r5, sp
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r5, #2]
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #3]
	adds r0, r6, #0
	mov r2, r8
	mov r3, sb
	bl sub_080BFFE0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080C0020

	thumb_func_start sub_080C00A0
sub_080C00A0: @ 0x080C00A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r4, #0
	movs r2, #0xff
_080C00C2:
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xa
	bls _080C00C2
	adds r0, r5, #0
	bl NationalPokedexNumToSpecies
	adds r5, r0, #0
	cmp r5, #0
	beq _080C0120
	movs r4, #0
	ldr r1, _080C011C
	lsls r3, r5, #1
	adds r0, r3, r5
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080C0134
	adds r6, r1, #0
_080C00F6:
	mov r0, sp
	adds r2, r0, r4
	adds r1, r3, r5
	lsls r1, r1, #1
	adds r0, r4, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r1, r4, r1
	adds r1, r1, r6
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080C0134
	cmp r4, #9
	bls _080C00F6
	b _080C0134
	.align 2, 0
_080C011C: .4byte 0x082EA31C
_080C0120:
	movs r4, #0
	movs r1, #0xae
_080C0124:
	mov r2, sp
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _080C0124
_080C0134:
	mov r0, sb
	mov r1, sp
	mov r2, r8
	adds r3, r7, #0
	bl sub_080BFFE0
	adds r0, r4, #0
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080C00A0

	thumb_func_start sub_080C0150
sub_080C0150: @ 0x080C0150
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r2, #0
	movs r1, #0
_080C0168:
	mov r3, sp
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _080C0168
	movs r3, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _080C0192
_080C0180:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C0192
	cmp r3, #4
	bls _080C0180
_080C0192:
	movs r2, #0
	cmp r2, r3
	bhs _080C01B0
_080C0198:
	adds r0, r2, #5
	subs r0, r0, r3
	mov r7, sp
	adds r1, r7, r0
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r3
	blo _080C0198
_080C01B0:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #5]
	adds r0, r6, #0
	mov r2, ip
	adds r3, r5, #0
	bl sub_080BFFE0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080C0150

	thumb_func_start sub_080C01C8
sub_080C01C8: @ 0x080C01C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	movs r5, #0
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r4, #0
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080C01FC
	mov r0, sp
	strb r5, [r0]
	b _080C0204
_080C01FC:
	mov r1, sp
	adds r0, #0xa1
	strb r0, [r1]
	movs r5, #1
_080C0204:
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080C022A
	cmp r5, #0
	bne _080C022A
	mov r0, sp
	strb r5, [r0, #1]
	b _080C0230
_080C022A:
	mov r1, sp
	adds r0, #0xa1
	strb r0, [r1, #1]
_080C0230:
	mov r5, sp
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	adds r0, #0xa1
	strb r0, [r5, #2]
	mov r1, sp
	movs r0, #0xb8
	strb r0, [r1, #3]
	mov r5, sp
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r5, #4]
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #5]
	mov r0, r8
	adds r2, r7, #0
	adds r3, r6, #0
	bl sub_080BFFE0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080C01C8

	thumb_func_start sub_080C0288
sub_080C0288: @ 0x080C0288
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _080C0314
	adds r0, r1, #0
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r0, [r0]
	mov ip, r0
	movs r5, #0
	movs r1, #0
	movs r7, #2
_080C02B2:
	mov r2, ip
	adds r0, r2, r1
	ldrb r3, [r0]
	movs r4, #0
	adds r6, r1, #1
_080C02BC:
	lsls r2, r4, #1
	adds r1, r3, #0
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r1, r0, #0x1f
	ands r1, r7
	adds r0, r7, #0
	lsls r0, r2
	ands r0, r3
	cmp r0, #0
	beq _080C02DC
	movs r0, #0x20
	orrs r1, r0
_080C02DC:
	mov r2, sp
	adds r0, r2, r5
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _080C02BC
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _080C02B2
	mov r0, r8
	mov r1, sp
	movs r2, #0x80
	movs r3, #0
	bl CopyToWindowPixelBuffer
	add sp, #0x80
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0314: .4byte 0x08543168
	thumb_func_end sub_080C0288

	thumb_func_start sub_080C0318
sub_080C0318: @ 0x080C0318
	push {r4, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r0, r0, #5
	ldr r2, _080C0354
	adds r3, r0, r2
	movs r4, #0xf0
	lsls r4, r4, #8
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _080C0358
	adds r3, r0, r2
	adds r4, #1
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _080C035C
	adds r3, r0, r2
	adds r4, #1
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _080C0360
	adds r0, r0, r2
	adds r4, #1
	adds r1, r1, r4
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0354: .4byte 0x06000232
_080C0358: .4byte 0x06000234
_080C035C: .4byte 0x06000272
_080C0360: .4byte 0x06000274
	thumb_func_end sub_080C0318

	thumb_func_start sub_080C0364
sub_080C0364: @ 0x080C0364
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r4, #1
	beq _080C0390
	cmp r4, #1
	bgt _080C0386
	cmp r4, #0
	beq _080C0398
	b _080C03B8
_080C0386:
	cmp r5, #2
	beq _080C03AA
	cmp r5, #3
	beq _080C039E
	b _080C03B8
_080C0390:
	cmp r0, r2
	bls _080C03B8
	subs r0, #1
	b _080C03B0
_080C0398:
	cmp r0, r3
	bhs _080C03B8
	b _080C03AE
_080C039E:
	cmp r0, r2
	bls _080C03A6
	subs r0, #1
	b _080C03B0
_080C03A6:
	adds r0, r3, #0
	b _080C03B8
_080C03AA:
	cmp r0, r3
	bhs _080C03B6
_080C03AE:
	adds r0, #1
_080C03B0:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080C03B8
_080C03B6:
	adds r0, r2, #0
_080C03B8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080C0364

	thumb_func_start sub_080C03C0
sub_080C03C0: @ 0x080C03C0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xc9
	beq _080C03E0
	movs r0, #0x9a
	lsls r0, r0, #1
	cmp r1, r0
	bne _080C03EC
	ldr r0, _080C03DC
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	b _080C03EE
	.align 2, 0
_080C03DC: .4byte 0x03005AF0
_080C03E0:
	ldr r0, _080C03E8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	b _080C03EE
	.align 2, 0
_080C03E8: .4byte 0x03005AF0
_080C03EC:
	movs r0, #0
_080C03EE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080C03C0

	thumb_func_start CreateMonSpriteFromNationalDexNumber
CreateMonSpriteFromNationalDexNumber: @ 0x080C03F4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl NationalPokedexNumToSpecies
	adds r1, r0, #0
	adds r0, r1, #0
	str r1, [sp, #0x10]
	bl sub_080C03C0
	adds r2, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #4]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #8]
	ldr r0, _080C044C
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	adds r0, r1, #0
	movs r1, #8
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C044C: .4byte 0x0000FFFF
	thumb_func_end CreateMonSpriteFromNationalDexNumber

	thumb_func_start sub_080C0450
sub_080C0450: @ 0x080C0450
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	ldr r1, _080C0484
	str r1, [sp, #4]
	movs r1, #1
	adds r2, r4, #0
	adds r3, r5, #0
	bl CreateTrainerPicSprite
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C0484: .4byte 0x0000FFFF
	thumb_func_end sub_080C0450

	thumb_func_start sub_080C0488
sub_080C0488: @ 0x080C0488
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r4, [sp, #0x34]
	ldr r5, [sp, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #8]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov sl, r5
	bl sub_080BC010
	movs r5, #0
	movs r6, #0
	ldr r4, _080C069C
	ldr r3, _080C06A0
_080C04C2:
	ldr r2, [r3]
	lsls r0, r5, #2
	adds r1, r2, r0
	ldrb r0, [r1, #2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080C04DE
	lsls r0, r6, #2
	adds r0, r2, r0
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080C04DE:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r4
	bls _080C04C2
	ldr r1, _080C06A0
	ldr r0, [r1]
	ldr r2, _080C06A4
	adds r0, r0, r2
	adds r1, r6, #0
	strh r6, [r0]
	cmp r7, #0xff
	beq _080C0596
	movs r5, #0
	lsls r0, r1, #0x10
	movs r6, #0
	cmp r0, #0
	beq _080C058C
	lsls r7, r7, #2
	ldr r0, _080C06A8
	adds r0, #3
	adds r0, r7, r0
	str r0, [sp, #0xc]
	ldr r0, _080C06A8
	adds r0, r0, r7
	mov sb, r0
_080C0512:
	ldr r1, _080C06A0
	ldr r0, [r1]
	lsls r4, r5, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _080C06AC
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r3, r2, #0
	mov r0, sb
	ldrb r0, [r0]
	cmp r2, r0
	blo _080C054C
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _080C06A8
	adds r1, #1
	adds r1, r7, r1
	ldrb r1, [r1]
	adds r0, r0, r1
	cmp r2, r0
	blt _080C0564
_080C054C:
	ldr r0, _080C06A8
	adds r0, #2
	adds r0, r7, r0
	ldrb r2, [r0]
	cmp r3, r2
	blo _080C0578
	ldrb r1, [r0]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	adds r1, r1, r0
	cmp r3, r1
	bge _080C0578
_080C0564:
	ldr r2, _080C06A0
	ldr r0, [r2]
	lsls r1, r6, #2
	adds r1, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080C0578:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _080C06A0
	ldr r0, [r1]
	ldr r2, _080C06A4
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	blo _080C0512
_080C058C:
	ldr r1, _080C06A0
	ldr r0, [r1]
	ldr r2, _080C06A4
	adds r0, r0, r2
	strh r6, [r0]
_080C0596:
	ldr r0, [sp, #4]
	cmp r0, #0xff
	beq _080C0606
	movs r5, #0
	movs r6, #0
	ldr r1, _080C06A0
	ldr r0, [r1]
	ldr r2, _080C06A4
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r6, r0
	bhs _080C05FC
	adds r7, r1, #0
	ldr r0, _080C06B0
	mov r8, r0
_080C05B4:
	ldr r0, [r7]
	lsls r4, r5, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	ldr r1, [sp, #4]
	cmp r1, r0
	bne _080C05EA
	ldr r0, [r7]
	lsls r1, r6, #2
	adds r1, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080C05EA:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r7]
	ldr r2, _080C06A4
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	blo _080C05B4
_080C05FC:
	ldr r1, _080C06A0
	ldr r0, [r1]
	ldr r2, _080C06A4
	adds r0, r0, r2
	strh r6, [r0]
_080C0606:
	ldr r0, [sp, #8]
	cmp r0, #0xff
	bne _080C061C
	mov r1, sl
	cmp r1, #0xff
	bne _080C0614
	b _080C073A
_080C0614:
	mov r2, sl
	str r2, [sp, #8]
	movs r0, #0xff
	mov sl, r0
_080C061C:
	mov r1, sl
	cmp r1, #0xff
	bne _080C06B4
	movs r5, #0
	movs r6, #0
	ldr r2, _080C06A0
	ldr r0, [r2]
	ldr r1, _080C06A4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bhs _080C0730
	adds r3, r2, #0
	mov r7, sp
	mov r8, r2
_080C063A:
	ldr r0, [r3]
	lsls r4, r5, #2
	adds r1, r0, r4
	ldrb r0, [r1, #2]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080C0684
	ldrh r0, [r1]
	str r3, [sp, #0x10]
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _080C06B0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #6]
	strb r1, [r7]
	ldrb r0, [r0, #7]
	strb r0, [r7, #1]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #8]
	cmp r1, r2
	beq _080C0672
	cmp r0, r2
	bne _080C0684
_080C0672:
	ldr r0, [r3]
	lsls r1, r6, #2
	adds r1, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080C0684:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _080C06A4
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	blo _080C063A
	b _080C0730
	.align 2, 0
_080C069C: .4byte 0x00000181
_080C06A0: .4byte 0x020397EC
_080C06A4: .4byte 0x0000060C
_080C06A8: .4byte 0x0854410C
_080C06AC: .4byte 0x082EA31C
_080C06B0: .4byte 0x082F0D54
_080C06B4:
	movs r5, #0
	movs r6, #0
	ldr r1, _080C07A0
	ldr r0, [r1]
	ldr r2, _080C07A4
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r6, r0
	bhs _080C0730
	mov r7, sp
_080C06C8:
	ldr r0, [r1]
	lsls r1, r5, #2
	adds r2, r0, r1
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x1e
	adds r4, r1, #0
	cmp r0, #0
	bge _080C071C
	ldrh r0, [r2]
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _080C07A8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #6]
	strb r1, [r7]
	ldrb r0, [r0, #7]
	strb r0, [r7, #1]
	ldr r2, [sp, #8]
	cmp r1, r2
	bne _080C06FE
	cmp r0, sl
	beq _080C0708
_080C06FE:
	cmp r1, sl
	bne _080C071C
	ldr r1, [sp, #8]
	cmp r0, r1
	bne _080C071C
_080C0708:
	ldr r2, _080C07A0
	ldr r0, [r2]
	lsls r1, r6, #2
	adds r1, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080C071C:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _080C07A0
	ldr r0, [r1]
	ldr r2, _080C07A4
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	blo _080C06C8
_080C0730:
	ldr r1, _080C07A0
	ldr r0, [r1]
	ldr r2, _080C07A4
	adds r0, r0, r2
	strh r6, [r0]
_080C073A:
	ldr r1, _080C07A0
	ldr r0, [r1]
	ldr r2, _080C07A4
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _080C078E
	adds r5, r0, #0
	ldr r0, _080C07AC
	cmp r5, r0
	bhi _080C078E
	ldr r4, _080C07A0
	movs r1, #2
	rsbs r1, r1, #0
	mov sl, r1
	movs r2, #3
	rsbs r2, r2, #0
	mov sb, r2
	mov r8, r0
	ldr r0, _080C07B0
	adds r7, r0, #0
_080C0764:
	ldr r1, [r4]
	lsls r3, r5, #2
	adds r1, r1, r3
	ldrh r0, [r1]
	orrs r0, r7
	strh r0, [r1]
	ldrb r2, [r1, #2]
	mov r0, sl
	ands r0, r2
	strb r0, [r1, #2]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1, #2]
	mov r0, sb
	ands r0, r2
	strb r0, [r1, #2]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	bls _080C0764
_080C078E:
	adds r0, r6, #0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C07A0: .4byte 0x020397EC
_080C07A4: .4byte 0x0000060C
_080C07A8: .4byte 0x082F0D54
_080C07AC: .4byte 0x00000181
_080C07B0: .4byte 0x0000FFFF
	thumb_func_end sub_080C0488

	thumb_func_start sub_080C07B4
sub_080C07B4: @ 0x080C07B4
	push {lr}
	ldr r0, _080C07C8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080C07C8: .4byte 0x080C0851
	thumb_func_end sub_080C07B4

	thumb_func_start sub_080C07CC
sub_080C07CC: @ 0x080C07CC
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r3, r2, #0
	lsls r3, r3, #0x18
	add r1, sp, #0x14
	movs r4, #0
	strb r4, [r1]
	adds r2, r1, #0
	movs r1, #0xf
	strb r1, [r2, #1]
	movs r1, #2
	strb r1, [r2, #2]
	lsls r5, r5, #0x1b
	lsrs r5, r5, #0x18
	lsrs r3, r3, #0x15
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r4, [sp]
	str r4, [sp, #4]
	str r2, [sp, #8]
	subs r1, #3
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #1
	adds r2, r5, #0
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080C07CC

	thumb_func_start sub_080C0810
sub_080C0810: @ 0x080C0810
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r0, #3
	lsls r5, r1, #3
	subs r0, #1
	subs r2, r2, r0
	lsls r2, r2, #0x13
	lsrs r2, r2, #0x10
	str r2, [sp]
	subs r1, #1
	subs r3, r3, r1
	lsls r3, r3, #0x13
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl FillWindowPixelRect
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080C0810

	thumb_func_start sub_080C0850
sub_080C0850: @ 0x080C0850
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080C0874
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #4
	bhi _080C0890
	lsls r0, r0, #2
	ldr r1, _080C0878
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0874: .4byte 0x03002360
_080C0878: .4byte 0x080C087C
_080C087C: @ jump table
	.4byte _080C0890 @ case 0
	.4byte _080C0984 @ case 1
	.4byte _080C09F0 @ case 2
	.4byte _080C0A10 @ case 3
	.4byte _080C0A60 @ case 4
_080C0890:
	ldr r0, _080C0938
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080C08A2
	b _080C0A86
_080C08A2:
	ldr r0, _080C093C
	ldr r0, [r0]
	ldr r1, _080C0940
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	movs r0, #0
	bl sub_080BFF08
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080C0944
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #3
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #2
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #1
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r0, _080C0948
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	bl PutWindowTilemap
	ldr r1, _080C094C
	movs r2, #0x80
	lsls r2, r2, #6
	str r5, [sp]
	movs r0, #3
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	bl IsNationalPokedexEnabled
	cmp r0, #0
	bne _080C0954
	ldr r1, _080C0950
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	b _080C0960
	.align 2, 0
_080C0938: .4byte 0x02037C74
_080C093C: .4byte 0x020397EC
_080C0940: .4byte 0x0000064A
_080C0944: .4byte 0x085443FC
_080C0948: .4byte 0x0854440C
_080C094C: .4byte 0x0854385C
_080C0950: .4byte 0x08543F84
_080C0954:
	ldr r1, _080C0978
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
_080C0960:
	ldr r0, _080C097C
	movs r1, #1
	movs r2, #0x7e
	bl LoadPalette
	ldr r0, _080C0980
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	b _080C0A86
	.align 2, 0
_080C0978: .4byte 0x08543DE8
_080C097C: .4byte 0x085437DE
_080C0980: .4byte 0x03002360
_080C0984:
	ldr r0, _080C09E4
	bl LoadCompressedSpriteSheet
	ldr r0, _080C09E8
	bl LoadSpritePalettes
	adds r0, r4, #0
	bl sub_080C1C38
	movs r1, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r2, r0, #3
	ldr r5, _080C09EC
	movs r3, #0
_080C09A2:
	lsls r0, r1, #1
	adds r0, r0, r2
	adds r0, r0, r5
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xf
	bls _080C09A2
	adds r0, r4, #0
	bl sub_080C1A5C
	movs r0, #0
	bl sub_080C1684
	adds r0, r4, #0
	bl sub_080C175C
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _080C0A4A
	.align 2, 0
_080C09E4: .4byte 0x08539BBC
_080C09E8: .4byte 0x08539BCC
_080C09EC: .4byte 0x03005B68
_080C09F0:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, _080C0A0C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _080C0A52
	.align 2, 0
_080C0A0C: .4byte 0x03002360
_080C0A10:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl HideBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
_080C0A4A:
	ldr r1, _080C0A5C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_080C0A52:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C0A86
	.align 2, 0
_080C0A5C: .4byte 0x03002360
_080C0A60:
	ldr r0, _080C0A90
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080C0A86
	ldr r1, _080C0A94
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080C0A98
	str r1, [r0]
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r3, r1
	strb r2, [r0]
_080C0A86:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0A90: .4byte 0x02037C74
_080C0A94: .4byte 0x03005B60
_080C0A98: .4byte 0x080C0AE1
	thumb_func_end sub_080C0850

	thumb_func_start sub_080C0A9C
sub_080C0A9C: @ 0x080C0A9C
	push {lr}
	bl FreeAllWindowBuffers
	movs r0, #0
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080C0AB0
	bl Free
_080C0AB0:
	movs r0, #1
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080C0ABE
	bl Free
_080C0ABE:
	movs r0, #2
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080C0ACC
	bl Free
_080C0ACC:
	movs r0, #3
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _080C0ADA
	bl Free
_080C0ADA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C0A9C

	thumb_func_start sub_080C0AE0
sub_080C0AE0: @ 0x080C0AE0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080C0B18
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	adds r5, r5, r0
	ldrb r0, [r5, #8]
	bl sub_080C1684
	adds r0, r4, #0
	bl sub_080C175C
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	ldr r0, _080C0B1C
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0B18: .4byte 0x03005B60
_080C0B1C: .4byte 0x080C0B21
	thumb_func_end sub_080C0AE0

	thumb_func_start sub_080C0B20
sub_080C0B20: @ 0x080C0B20
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080C0B48
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C0B54
	movs r0, #3
	bl PlaySE
	ldr r0, _080C0B4C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080C0B50
	str r0, [r1]
	b _080C0C2C
	.align 2, 0
_080C0B48: .4byte 0x03002360
_080C0B4C: .4byte 0x03005B60
_080C0B50: .4byte 0x080C137D
_080C0B54:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C0BB0
	ldr r1, _080C0B78
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r0, #8
	ldrsh r4, [r5, r0]
	cmp r4, #1
	beq _080C0B8C
	cmp r4, #1
	bgt _080C0B7C
	cmp r4, #0
	beq _080C0B82
	b _080C0C2C
	.align 2, 0
_080C0B78: .4byte 0x03005B60
_080C0B7C:
	cmp r4, #2
	beq _080C0BA0
	b _080C0C2C
_080C0B82:
	movs r0, #0x15
	bl PlaySE
	strh r4, [r5, #0xa]
	b _080C0B96
_080C0B8C:
	movs r0, #0x15
	bl PlaySE
	movs r0, #4
	strh r0, [r5, #0xa]
_080C0B96:
	ldr r0, _080C0B9C
	str r0, [r5]
	b _080C0C2C
	.align 2, 0
_080C0B9C: .4byte 0x080C0C3D
_080C0BA0:
	movs r0, #3
	bl PlaySE
	ldr r0, _080C0BAC
	str r0, [r5]
	b _080C0C2C
	.align 2, 0
_080C0BAC: .4byte 0x080C137D
_080C0BB0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080C0BEC
	ldr r0, _080C0C34
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r4, r1, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080C0BEC
	movs r0, #0x6d
	bl PlaySE
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080C1684
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
_080C0BEC:
	ldr r0, _080C0C38
	ldrh r1, [r0, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080C0C2C
	ldr r0, _080C0C34
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r4, r1, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bgt _080C0C2C
	movs r0, #0x6d
	bl PlaySE
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080C1684
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
_080C0C2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0C34: .4byte 0x03005B60
_080C0C38: .4byte 0x03002360
	thumb_func_end sub_080C0B20

	thumb_func_start sub_080C0C3C
sub_080C0C3C: @ 0x080C0C3C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080C0C74
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	adds r5, r5, r0
	ldrb r0, [r5, #8]
	ldrb r1, [r5, #0xa]
	bl sub_080C16B8
	adds r0, r4, #0
	bl sub_080C175C
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	ldr r0, _080C0C78
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0C74: .4byte 0x03005B60
_080C0C78: .4byte 0x080C0C7D
	thumb_func_end sub_080C0C3C

	thumb_func_start sub_080C0C7C
sub_080C0C7C: @ 0x080C0C7C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080C0CA4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080C0CB0
	bl IsNationalPokedexEnabled
	ldr r6, _080C0CA8
	cmp r0, #0
	bne _080C0CBC
	ldr r6, _080C0CAC
	b _080C0CBC
	.align 2, 0
_080C0CA4: .4byte 0x03005B60
_080C0CA8: .4byte 0x085441BC
_080C0CAC: .4byte 0x085441F4
_080C0CB0:
	bl IsNationalPokedexEnabled
	ldr r6, _080C0CE8
	cmp r0, #0
	bne _080C0CBC
	ldr r6, _080C0CEC
_080C0CBC:
	ldr r0, _080C0CF0
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080C0CFC
	movs r0, #0x17
	bl PlaySE
	adds r0, r5, #0
	bl sub_080C1A5C
	ldr r0, _080C0CF4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080C0CF8
	str r0, [r1]
	b _080C0F14
	.align 2, 0
_080C0CE8: .4byte 0x085441A0
_080C0CEC: .4byte 0x085441D8
_080C0CF0: .4byte 0x03002360
_080C0CF4: .4byte 0x03005B60
_080C0CF8: .4byte 0x080C0AE1
_080C0CFC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C0DF0
	ldr r0, _080C0D8C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r6, r1, r0
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	cmp r0, #6
	bne _080C0DE0
	movs r1, #8
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _080C0DAC
	ldr r1, _080C0D90
	movs r0, #0x40
	strb r0, [r1]
	ldr r7, _080C0D94
	ldr r1, [r7]
	ldr r0, _080C0D98
	adds r2, r1, r0
	movs r0, #0x40
	strh r0, [r2]
	ldr r0, _080C0D9C
	strh r3, [r0]
	movs r2, #0xc2
	lsls r2, r2, #3
	adds r1, r1, r2
	strh r3, [r1]
	adds r0, r5, #0
	movs r1, #5
	bl sub_080C19BC
	ldr r4, _080C0DA0
	ldr r1, [r4]
	strb r0, [r1, #0x19]
	bl IsNationalPokedexEnabled
	cmp r0, #0
	bne _080C0D58
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x19]
_080C0D58:
	ldr r0, [r7]
	ldr r1, [r4]
	ldrb r1, [r1, #0x19]
	ldr r2, _080C0DA4
	adds r0, r0, r2
	strh r1, [r0]
	adds r0, r5, #0
	movs r1, #4
	bl sub_080C19BC
	ldr r1, [r4]
	strb r0, [r1, #0x18]
	ldr r0, [r7]
	ldr r1, [r4]
	ldrb r1, [r1, #0x18]
	movs r2, #0xc3
	lsls r2, r2, #3
	adds r0, r0, r2
	strh r1, [r0]
	movs r0, #3
	bl PlaySE
	ldr r0, _080C0DA8
	str r0, [r6]
	b _080C0F14
	.align 2, 0
_080C0D8C: .4byte 0x03005B60
_080C0D90: .4byte 0x020397F2
_080C0D94: .4byte 0x020397EC
_080C0D98: .4byte 0x0000062A
_080C0D9C: .4byte 0x020397F0
_080C0DA0: .4byte 0x03005AF0
_080C0DA4: .4byte 0x00000614
_080C0DA8: .4byte 0x080C137D
_080C0DAC:
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_080C0810
	ldr r0, _080C0DD8
	movs r1, #2
	movs r2, #0xf
	bl sub_080C07CC
	ldr r0, _080C0DDC
	str r0, [r6]
	movs r0, #0x70
	bl PlaySE
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	b _080C0F14
	.align 2, 0
_080C0DD8: .4byte 0x085C8FFC
_080C0DDC: .4byte 0x080C0F25
_080C0DE0:
	movs r0, #0x15
	bl PlaySE
	ldr r0, _080C0DEC
	str r0, [r6]
	b _080C0F14
	.align 2, 0
_080C0DEC: .4byte 0x080C1105
_080C0DF0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080C0E36
	ldr r1, _080C0F1C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080C0E36
	movs r0, #5
	bl PlaySE
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0]
	strh r1, [r4, #0xa]
	ldrb r0, [r4, #8]
	bl sub_080C16B8
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
_080C0E36:
	ldr r0, _080C0F20
	ldrh r1, [r0, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080C0E80
	ldr r1, _080C0F1C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #1]
	cmp r0, #0xff
	beq _080C0E80
	movs r0, #5
	bl PlaySE
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0, #1]
	strh r1, [r4, #0xa]
	ldrb r0, [r4, #8]
	bl sub_080C16B8
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
_080C0E80:
	ldr r0, _080C0F20
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080C0ECA
	ldr r1, _080C0F1C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #2]
	cmp r0, #0xff
	beq _080C0ECA
	movs r0, #5
	bl PlaySE
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0, #2]
	strh r1, [r4, #0xa]
	ldrb r0, [r4, #8]
	bl sub_080C16B8
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
_080C0ECA:
	ldr r0, _080C0F20
	ldrh r1, [r0, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080C0F14
	ldr r1, _080C0F1C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	beq _080C0F14
	movs r0, #5
	bl PlaySE
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0, #3]
	strh r1, [r4, #0xa]
	ldrb r0, [r4, #8]
	bl sub_080C16B8
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
_080C0F14:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0F1C: .4byte 0x03005B60
_080C0F20: .4byte 0x03002360
	thumb_func_end sub_080C0C7C

	thumb_func_start sub_080C0F24
sub_080C0F24: @ 0x080C0F24
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	movs r1, #5
	bl sub_080C19BC
	mov sl, r0
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r0, r5, #0
	movs r1, #4
	bl sub_080C19BC
	mov sb, r0
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r5, #0
	movs r1, #0
	bl sub_080C19BC
	mov r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	movs r1, #1
	bl sub_080C19BC
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r0, r5, #0
	movs r1, #2
	bl sub_080C19BC
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl sub_080C19BC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, sl
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl sub_080C0488
	ldr r1, _080C0FC4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080C0FC8
	str r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C0FC4: .4byte 0x03005B60
_080C0FC8: .4byte 0x080C0FCD
	thumb_func_end sub_080C0F24

	thumb_func_start sub_080C0FCC
sub_080C0FCC: @ 0x080C0FCC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C1046
	ldr r0, _080C1008
	ldr r0, [r0]
	ldr r1, _080C100C
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C1014
	movs r0, #0x1f
	bl PlaySE
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_080C0810
	ldr r0, _080C1010
	movs r1, #2
	movs r2, #0xf
	bl sub_080C07CC
	b _080C1030
	.align 2, 0
_080C1008: .4byte 0x020397EC
_080C100C: .4byte 0x0000060C
_080C1010: .4byte 0x085C900A
_080C1014:
	movs r0, #0x20
	bl PlaySE
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_080C0810
	ldr r0, _080C104C
	movs r1, #2
	movs r2, #0xf
	bl sub_080C07CC
_080C1030:
	ldr r0, _080C1050
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080C1054
	str r0, [r1]
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
_080C1046:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C104C: .4byte 0x085C901D
_080C1050: .4byte 0x03005B60
_080C1054: .4byte 0x080C1059
	thumb_func_end sub_080C0FCC

	thumb_func_start sub_080C1058
sub_080C1058: @ 0x080C1058
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r2, r4, #0
	ldr r0, _080C10C0
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C10F4
	ldr r5, _080C10C4
	ldr r1, [r5]
	ldr r3, _080C10C8
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C10E0
	ldr r0, _080C10CC
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #5
	bl sub_080C19BC
	ldr r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080C10D0
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #4
	bl sub_080C19BC
	ldr r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080C10D4
	adds r1, r1, r3
	strh r0, [r1]
	ldr r1, _080C10D8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080C10DC
	str r1, [r0]
	movs r0, #3
	bl PlaySE
	b _080C10F4
	.align 2, 0
_080C10C0: .4byte 0x03002360
_080C10C4: .4byte 0x020397EC
_080C10C8: .4byte 0x0000060C
_080C10CC: .4byte 0x0000064E
_080C10D0: .4byte 0x00000612
_080C10D4: .4byte 0x00000616
_080C10D8: .4byte 0x03005B60
_080C10DC: .4byte 0x080C137D
_080C10E0:
	ldr r0, _080C10FC
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080C1100
	str r0, [r1]
	movs r0, #0x17
	bl PlaySE
_080C10F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C10FC: .4byte 0x03005B60
_080C1100: .4byte 0x080C0C3D
	thumb_func_end sub_080C1058

	thumb_func_start sub_080C1104
sub_080C1104: @ 0x080C1104
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0
	bl sub_080C1838
	ldr r2, _080C116C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r6, r1, r2
	ldrb r0, [r6, #0xa]
	adds r2, #8
	adds r1, r1, r2
	ldr r2, _080C1170
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r4, [r0, #4]
	lsls r4, r4, #1
	adds r4, r1, r4
	ldrb r0, [r0, #5]
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r4]
	strh r0, [r6, #0x24]
	ldrh r0, [r1]
	strh r0, [r6, #0x26]
	adds r0, r5, #0
	bl sub_080C1918
	ldr r0, _080C1174
	ldrh r2, [r4]
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0x12
	bl sub_080C07CC
	ldr r0, _080C1178
	str r0, [r6]
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C116C: .4byte 0x03005B60
_080C1170: .4byte 0x085443CC
_080C1174: .4byte 0x085C9299
_080C1178: .4byte 0x080C117D
	thumb_func_end sub_080C1104

	thumb_func_start sub_080C117C
sub_080C117C: @ 0x080C117C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, _080C11DC
	lsls r2, r7, #2
	adds r2, r2, r7
	lsls r2, r2, #3
	adds r5, r2, r3
	ldrb r1, [r5, #0xa]
	ldr r0, _080C11E0
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, [r1]
	mov r8, r0
	adds r3, #8
	adds r2, r2, r3
	ldrb r0, [r1, #4]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrb r0, [r1, #5]
	lsls r0, r0, #1
	adds r6, r2, r0
	ldrh r0, [r1, #6]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _080C11E4
	mov ip, r0
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C11E8
	movs r0, #0x15
	bl PlaySE
	movs r0, #0x12
	movs r1, #1
	movs r2, #0x1c
	movs r3, #0xc
	bl sub_080C0810
	movs r0, #1
	bl sub_080C1838
	b _080C1210
	.align 2, 0
_080C11DC: .4byte 0x03005B60
_080C11E0: .4byte 0x085443CC
_080C11E4: .4byte 0x03002360
_080C11E8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C1228
	movs r0, #0x17
	bl PlaySE
	movs r0, #0x12
	movs r1, #1
	movs r2, #0x1c
	movs r3, #0xc
	bl sub_080C0810
	movs r0, #1
	bl sub_080C1838
	ldrh r0, [r5, #0x24]
	strh r0, [r4]
	ldrh r0, [r5, #0x26]
	strh r0, [r6]
_080C1210:
	ldr r0, _080C1224
	str r0, [r5]
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _080C136C
	.align 2, 0
_080C1224: .4byte 0x080C0C3D
_080C1228:
	movs r3, #0
	mov r0, ip
	ldrh r1, [r0, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080C12D0
	ldrh r0, [r4]
	cmp r0, #0
	beq _080C1274
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x12
	movs r2, #0x12
	bl sub_080C0810
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r0, _080C1270
	ldrh r2, [r4]
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0x12
	bl sub_080C07CC
	b _080C129C
	.align 2, 0
_080C1270: .4byte 0x085C9299
_080C1274:
	ldrh r0, [r6]
	cmp r0, #0
	beq _080C1298
	subs r0, #1
	strh r0, [r6]
	adds r0, r7, #0
	bl sub_080C1918
	ldr r0, _080C12CC
	ldrh r2, [r4]
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0x12
	bl sub_080C07CC
	movs r3, #1
_080C1298:
	cmp r3, #0
	beq _080C136C
_080C129C:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_080C0810
	ldrh r0, [r4]
	ldrh r1, [r6]
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, r8
	ldr r0, [r0]
	movs r1, #2
	movs r2, #0xf
	bl sub_080C07CC
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	b _080C136C
	.align 2, 0
_080C12CC: .4byte 0x085C9299
_080C12D0:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080C136C
	ldrh r0, [r4]
	cmp r0, #4
	bhi _080C1318
	cmp r0, r2
	bhs _080C1318
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x12
	movs r2, #0x12
	bl sub_080C0810
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, _080C1314
	ldrh r2, [r4]
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0x12
	bl sub_080C07CC
	b _080C133E
	.align 2, 0
_080C1314: .4byte 0x085C9299
_080C1318:
	cmp r2, #5
	bls _080C133A
	ldrh r1, [r6]
	subs r0, r2, #5
	cmp r1, r0
	bge _080C133A
	adds r0, r1, #1
	strh r0, [r6]
	adds r0, r7, #0
	bl sub_080C1918
	ldr r0, _080C1378
	movs r1, #0x12
	movs r2, #0xb
	bl sub_080C07CC
	movs r3, #1
_080C133A:
	cmp r3, #0
	beq _080C136C
_080C133E:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_080C0810
	ldrh r0, [r4]
	ldrh r1, [r6]
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, r8
	ldr r0, [r0]
	movs r1, #2
	movs r2, #0xf
	bl sub_080C07CC
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
_080C136C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1378: .4byte 0x085C9299
	thumb_func_end sub_080C117C

	thumb_func_start sub_080C137C
sub_080C137C: @ 0x080C137C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _080C13AC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080C13B0
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C13AC: .4byte 0x03005B60
_080C13B0: .4byte 0x080C13B5
	thumb_func_end sub_080C137C

	thumb_func_start sub_080C13B4
sub_080C13B4: @ 0x080C13B4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080C13D8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080C13D0
	bl sub_080C0A9C
	adds r0, r4, #0
	bl DestroyTask
_080C13D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C13D8: .4byte 0x02037C74
	thumb_func_end sub_080C13B4

	thumb_func_start sub_080C13DC
sub_080C13DC: @ 0x080C13DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #3
	bl GetBgTilemapBuffer
	adds r2, r0, #0
	movs r3, #0
	cmp r3, r4
	bhs _080C1430
	lsls r0, r5, #6
	adds r7, r0, r2
	ldr r5, _080C143C
	lsls r2, r6, #0xc
_080C140C:
	mov r0, r8
	adds r1, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	ands r0, r5
	orrs r0, r2
	strh r0, [r1]
	adds r1, #0x40
	ldrh r0, [r1]
	ands r0, r5
	orrs r0, r2
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blo _080C140C
_080C1430:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C143C: .4byte 0x00000FFF
	thumb_func_end sub_080C13DC

	thumb_func_start sub_080C1440
sub_080C1440: @ 0x080C1440
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	ands r5, r0
	ands r2, r0
	lsls r2, r2, #1
	orrs r5, r2
	cmp r4, #0xa
	bhi _080C152C
	lsls r0, r4, #2
	ldr r1, _080C1468
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1468: .4byte 0x080C146C
_080C146C: @ jump table
	.4byte _080C1498 @ case 0
	.4byte _080C1498 @ case 1
	.4byte _080C1498 @ case 2
	.4byte _080C14A8 @ case 3
	.4byte _080C14A8 @ case 4
	.4byte _080C14C0 @ case 5
	.4byte _080C14C0 @ case 6
	.4byte _080C14A8 @ case 7
	.4byte _080C14A8 @ case 8
	.4byte _080C14E8 @ case 9
	.4byte _080C14D8 @ case 10
_080C1498:
	ldr r1, _080C14A4
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrb r1, [r0, #4]
	ldrb r2, [r0, #5]
	b _080C1506
	.align 2, 0
_080C14A4: .4byte 0x08544134
_080C14A8:
	ldr r2, _080C14D4
	subs r1, r4, #3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	ldrb r2, [r0, #5]
	ldrb r3, [r0, #6]
	adds r0, r5, #0
	bl sub_080C13DC
_080C14C0:
	ldr r2, _080C14D4
	subs r1, r4, #3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #7]
	ldrb r2, [r0, #8]
	ldrb r3, [r0, #9]
	b _080C1508
	.align 2, 0
_080C14D4: .4byte 0x0854414C
_080C14D8:
	ldr r0, _080C14E4
	ldrb r1, [r0, #0x1c]
	ldrb r2, [r0, #0x1d]
	ldrb r3, [r0, #0x1e]
	b _080C1508
	.align 2, 0
_080C14E4: .4byte 0x0854414C
_080C14E8:
	bl IsNationalPokedexEnabled
	cmp r0, #0
	bne _080C1514
	ldr r2, _080C1510
	subs r1, r4, #3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	ldrb r2, [r0, #5]
	subs r2, #2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
_080C1506:
	ldrb r3, [r0, #6]
_080C1508:
	adds r0, r5, #0
	bl sub_080C13DC
	b _080C152C
	.align 2, 0
_080C1510: .4byte 0x0854414C
_080C1514:
	ldr r2, _080C1534
	subs r1, r4, #3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	ldrb r2, [r0, #5]
	ldrb r3, [r0, #6]
	adds r0, r5, #0
	bl sub_080C13DC
_080C152C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C1534: .4byte 0x0854414C
	thumb_func_end sub_080C1440

	thumb_func_start sub_080C1538
sub_080C1538: @ 0x080C1538
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _080C15A2
	cmp r0, #1
	bgt _080C154E
	cmp r0, #0
	beq _080C1554
	b _080C1680
_080C154E:
	cmp r1, #2
	beq _080C1612
	b _080C1680
_080C1554:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_080C1440
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #4
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #0xa
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #5
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #6
	movs r1, #1
	movs r2, #0
	b _080C15EE
_080C15A2:
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_080C1440
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #3
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #4
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #0xa
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #5
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #6
	movs r1, #1
	movs r2, #1
_080C15EE:
	bl sub_080C1440
	movs r0, #7
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #8
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #9
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	b _080C1680
_080C1612:
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl sub_080C1440
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_080C1440
	movs r0, #3
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #4
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #0xa
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #5
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #6
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #7
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #8
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
	movs r0, #9
	movs r1, #1
	movs r2, #1
	bl sub_080C1440
_080C1680:
	pop {r0}
	bx r0
	thumb_func_end sub_080C1538

	thumb_func_start sub_080C1684
sub_080C1684: @ 0x080C1684
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_080C1538
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_080C0810
	ldr r0, _080C16B4
	lsls r4, r4, #3
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #2
	movs r2, #0xf
	bl sub_080C07CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C16B4: .4byte 0x08544134
	thumb_func_end sub_080C1684

	thumb_func_start sub_080C16B8
sub_080C16B8: @ 0x080C16B8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl sub_080C1538
	cmp r4, #6
	bhi _080C1732
	lsls r0, r4, #2
	ldr r1, _080C16D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C16D4: .4byte 0x080C16D8
_080C16D8: @ jump table
	.4byte _080C16F4 @ case 0
	.4byte _080C16F8 @ case 1
	.4byte _080C16FC @ case 2
	.4byte _080C170A @ case 3
	.4byte _080C1718 @ case 4
	.4byte _080C171C @ case 5
	.4byte _080C1728 @ case 6
_080C16F4:
	movs r0, #3
	b _080C171E
_080C16F8:
	movs r0, #4
	b _080C171E
_080C16FC:
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl sub_080C1440
	movs r0, #5
	b _080C171E
_080C170A:
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl sub_080C1440
	movs r0, #6
	b _080C171E
_080C1718:
	movs r0, #7
	b _080C171E
_080C171C:
	movs r0, #8
_080C171E:
	movs r1, #0
	movs r2, #0
	bl sub_080C1440
	b _080C1732
_080C1728:
	movs r0, #9
	movs r1, #0
	movs r2, #0
	bl sub_080C1440
_080C1732:
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_080C0810
	ldr r0, _080C1758
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	movs r2, #0xf
	bl sub_080C07CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C1758: .4byte 0x0854414C
	thumb_func_end sub_080C16B8

	thumb_func_start sub_080C175C
sub_080C175C: @ 0x080C175C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #6
	movs r1, #2
	movs r2, #0xf
	movs r3, #0xb
	bl sub_080C0810
	ldr r1, _080C1820
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #0x16]
	ldrh r1, [r5, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _080C1824
	lsrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #6
	movs r2, #2
	bl sub_080C07CC
	ldrh r0, [r5, #0x1a]
	ldrh r1, [r5, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _080C1828
	lsrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #6
	movs r2, #4
	bl sub_080C07CC
	ldrh r0, [r5, #0x1e]
	ldrh r1, [r5, #0x1c]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r4, _080C182C
	lsrs r0, r0, #0xd
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #6
	movs r2, #6
	bl sub_080C07CC
	ldrh r0, [r5, #0x22]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0xc
	movs r2, #6
	bl sub_080C07CC
	ldrh r0, [r5, #0x12]
	ldrh r1, [r5, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _080C1830
	lsrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #6
	movs r2, #8
	bl sub_080C07CC
	bl IsNationalPokedexEnabled
	cmp r0, #0
	beq _080C181A
	ldrh r0, [r5, #0xe]
	ldrh r5, [r5, #0xc]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	ldr r1, _080C1834
	lsrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #6
	movs r2, #0xa
	bl sub_080C07CC
_080C181A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C1820: .4byte 0x03005B60
_080C1824: .4byte 0x08544260
_080C1828: .4byte 0x085442B8
_080C182C: .4byte 0x08544318
_080C1830: .4byte 0x08544228
_080C1834: .4byte 0x08544210
	thumb_func_end sub_080C175C

	thumb_func_start sub_080C1838
sub_080C1838: @ 0x080C1838
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #3
	bl GetBgTilemapBuffer
	adds r5, r0, #0
	cmp r4, #0
	bne _080C18EC
	ldr r1, _080C18D0
	adds r0, r1, #0
	strh r0, [r5, #0x22]
	movs r2, #0x12
	ldr r0, _080C18D4
	adds r1, r0, #0
_080C1858:
	lsls r0, r2, #1
	adds r0, r0, r5
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1c
	bls _080C1858
	ldr r1, _080C18D8
	adds r0, r1, #0
	strh r0, [r5, #0x3a]
	movs r3, #1
	movs r6, #2
	ldr r2, _080C18DC
	adds r7, r2, #0
_080C1876:
	lsls r0, r3, #6
	adds r1, r0, r5
	strh r7, [r1, #0x22]
	movs r2, #0x12
	adds r4, r0, #0
	adds r3, #1
_080C1882:
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r6, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1c
	bls _080C1882
	adds r0, r4, r5
	movs r1, #0xa
	strh r1, [r0, #0x3a]
	lsls r0, r3, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xc
	bls _080C1876
	ldr r0, _080C18E0
	adds r1, r5, r0
	ldr r2, _080C18E4
	adds r0, r2, #0
	strh r0, [r1]
	movs r2, #0x12
	movs r3, #0xd0
	lsls r3, r3, #2
	movs r1, #0xd
_080C18B2:
	lsls r0, r2, #1
	adds r0, r0, r5
	adds r0, r0, r3
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1c
	bls _080C18B2
	ldr r0, _080C18E8
	adds r1, r5, r0
	movs r0, #0xb
	strh r0, [r1]
	b _080C1910
	.align 2, 0
_080C18D0: .4byte 0x00000C0B
_080C18D4: .4byte 0x0000080D
_080C18D8: .4byte 0x0000080B
_080C18DC: .4byte 0x0000040A
_080C18E0: .4byte 0x00000362
_080C18E4: .4byte 0x0000040B
_080C18E8: .4byte 0x0000037A
_080C18EC:
	movs r3, #0
	movs r6, #0x4f
_080C18F0:
	movs r2, #0x11
	lsls r4, r3, #6
	adds r3, #1
	adds r1, r4, r5
_080C18F8:
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r6, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1d
	bls _080C18F8
	lsls r0, r3, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xd
	bls _080C18F0
_080C1910:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C1838

	thumb_func_start sub_080C1918
sub_080C1918: @ 0x080C1918
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080C195C
	ldr r3, _080C1960
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r0, r2, r3
	movs r5, #0xa
	ldrsh r1, [r0, r5]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r6, [r1]
	adds r3, #8
	adds r2, r2, r3
	ldrb r0, [r1, #4]
	lsls r0, r0, #1
	adds r0, r0, r2
	mov r8, r0
	ldrb r0, [r1, #5]
	lsls r0, r0, #1
	adds r7, r2, r0
	movs r0, #0x12
	movs r1, #1
	movs r2, #0x1c
	movs r3, #0xc
	bl sub_080C0810
	movs r5, #0
	ldrh r4, [r7]
	b _080C1986
	.align 2, 0
_080C195C: .4byte 0x085443CC
_080C1960: .4byte 0x03005B60
_080C1964:
	adds r0, r1, r6
	ldr r0, [r0, #4]
	lsls r2, r5, #1
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0x13
	bl sub_080C07CC
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r5, #5
	bhi _080C1990
_080C1986:
	lsls r1, r4, #3
	adds r0, r1, r6
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _080C1964
_080C1990:
	movs r0, #0
	movs r1, #0xe
	movs r2, #0x1d
	movs r3, #0x13
	bl sub_080C0810
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r7]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r0, [r0]
	movs r1, #2
	movs r2, #0xf
	bl sub_080C07CC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080C1918

	thumb_func_start sub_080C19BC
sub_080C19BC: @ 0x080C19BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080C19FC
	adds r1, r1, r0
	ldr r2, _080C1A00
	lsls r0, r3, #3
	adds r0, r0, r2
	ldrb r2, [r0, #4]
	lsls r2, r2, #1
	adds r2, r1, r2
	ldrb r0, [r0, #5]
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r3, #5
	bhi _080C1A20
	lsls r0, r3, #2
	ldr r1, _080C1A04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C19FC: .4byte 0x03005B68
_080C1A00: .4byte 0x085443CC
_080C1A04: .4byte 0x080C1A08
_080C1A08: @ jump table
	.4byte _080C1A34 @ case 0
	.4byte _080C1A3E @ case 1
	.4byte _080C1A4E @ case 2
	.4byte _080C1A4E @ case 3
	.4byte _080C1A2C @ case 4
	.4byte _080C1A24 @ case 5
_080C1A20:
	movs r0, #0
	b _080C1A54
_080C1A24:
	ldr r0, _080C1A28
	b _080C1A50
	.align 2, 0
_080C1A28: .4byte 0x085443B0
_080C1A2C:
	ldr r0, _080C1A30
	b _080C1A50
	.align 2, 0
_080C1A30: .4byte 0x085443B2
_080C1A34:
	cmp r2, #0
	beq _080C1A42
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	b _080C1A54
_080C1A3E:
	cmp r2, #0
	bne _080C1A46
_080C1A42:
	movs r0, #0xff
	b _080C1A54
_080C1A46:
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080C1A54
_080C1A4E:
	ldr r0, _080C1A58
_080C1A50:
	adds r0, r2, r0
	ldrb r0, [r0]
_080C1A54:
	pop {r1}
	bx r1
	.align 2, 0
_080C1A58: .4byte 0x085443B8
	thumb_func_end sub_080C19BC

	thumb_func_start sub_080C1A5C
sub_080C1A5C: @ 0x080C1A5C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080C1A7C
	ldr r0, [r1]
	ldr r2, _080C1A80
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _080C1A76
	cmp r0, #1
	beq _080C1A84
_080C1A76:
	movs r3, #0
	b _080C1A86
	.align 2, 0
_080C1A7C: .4byte 0x020397EC
_080C1A80: .4byte 0x00000614
_080C1A84:
	movs r3, #1
_080C1A86:
	ldr r1, _080C1AAC
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r3, [r0, #0xc]
	ldr r0, [r5]
	movs r3, #0xc3
	lsls r3, r3, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r5, r1, #0
	cmp r0, #5
	bhi _080C1ACC
	lsls r0, r0, #2
	ldr r1, _080C1AB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1AAC: .4byte 0x03005B60
_080C1AB0: .4byte 0x080C1AB4
_080C1AB4: @ jump table
	.4byte _080C1ACC @ case 0
	.4byte _080C1AD0 @ case 1
	.4byte _080C1AD4 @ case 2
	.4byte _080C1AD8 @ case 3
	.4byte _080C1ADC @ case 4
	.4byte _080C1AE0 @ case 5
_080C1ACC:
	movs r3, #0
	b _080C1AE2
_080C1AD0:
	movs r3, #1
	b _080C1AE2
_080C1AD4:
	movs r3, #2
	b _080C1AE2
_080C1AD8:
	movs r3, #3
	b _080C1AE2
_080C1ADC:
	movs r3, #4
	b _080C1AE2
_080C1AE0:
	movs r3, #5
_080C1AE2:
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r3, [r0, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080C1A5C

	thumb_func_start sub_080C1AF0
sub_080C1AF0: @ 0x080C1AF0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080C1B28
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r3
	ldrb r2, [r0, #0xa]
	adds r3, #8
	adds r1, r1, r3
	ldr r0, _080C1B2C
	lsls r2, r2, #3
	adds r2, r2, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r2, #6]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bls _080C1B30
	ldrh r0, [r1]
	cmp r0, #0
	beq _080C1B30
	movs r0, #0
	b _080C1B32
	.align 2, 0
_080C1B28: .4byte 0x03005B60
_080C1B2C: .4byte 0x085443CC
_080C1B30:
	movs r0, #1
_080C1B32:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080C1AF0

	thumb_func_start sub_080C1B38
sub_080C1B38: @ 0x080C1B38
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080C1B74
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r3
	ldrb r2, [r0, #0xa]
	adds r3, #8
	adds r1, r1, r3
	ldr r0, _080C1B78
	lsls r2, r2, #3
	adds r2, r2, r0
	ldrb r0, [r2, #5]
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r2, #6]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bls _080C1B7C
	ldrh r1, [r1]
	subs r0, #5
	cmp r1, r0
	bge _080C1B7C
	movs r0, #0
	b _080C1B7E
	.align 2, 0
_080C1B74: .4byte 0x03005B60
_080C1B78: .4byte 0x085443CC
_080C1B7C:
	movs r0, #1
_080C1B7E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080C1B38

	thumb_func_start sub_080C1B84
sub_080C1B84: @ 0x080C1B84
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080C1BC4
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _080C1BC8
	cmp r1, r0
	bne _080C1C24
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080C1BCC
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080C1B38
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1BE8
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	b _080C1BF4
	.align 2, 0
_080C1BC4: .4byte 0x03005B60
_080C1BC8: .4byte 0x080C117D
_080C1BCC:
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080C1AF0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1BE8
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	b _080C1BF4
_080C1BE8:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
_080C1BF4:
	strb r0, [r2]
	ldrh r2, [r4, #0x32]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	lsls r0, r0, #7
	adds r0, r2, r0
	lsls r0, r0, #0x18
	ldr r1, _080C1C20
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080C1C12
	adds r0, #0x7f
_080C1C12:
	asrs r0, r0, #7
	strh r0, [r4, #0x26]
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r4, #0x32]
	b _080C1C30
	.align 2, 0
_080C1C20: .4byte 0x082FA8CC
_080C1C24:
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080C1C30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C1B84

	thumb_func_start sub_080C1C38
sub_080C1C38: @ 0x080C1C38
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _080C1CB0
	adds r0, r6, #0
	movs r1, #0xb8
	movs r2, #4
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080C1CB4
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r4
	movs r2, #0
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r0, #0x1c
	adds r0, r0, r4
	mov sb, r0
	add r1, sb
	ldr r0, _080C1CB8
	mov r8, r0
	str r0, [r1]
	adds r0, r6, #0
	movs r1, #0xb8
	movs r2, #0x6c
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r4
	strh r5, [r4, #0x2e]
	movs r0, #1
	strh r0, [r4, #0x30]
	adds r4, #0x3f
	ldrb r0, [r4]
	movs r2, #2
	orrs r0, r2
	strb r0, [r4]
	add r1, sb
	mov r0, r8
	str r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1CB0: .4byte 0x08539AFC
_080C1CB4: .4byte 0x020205AC
_080C1CB8: .4byte 0x080C1B85
	thumb_func_end sub_080C1C38

