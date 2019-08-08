.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitWonderCardResources
InitWonderCardResources: @ 0x0801B5D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	beq _0801B5F4
	cmp r5, #0
	beq _0801B5F4
	ldr r6, _0801B5F8
	ldr r0, _0801B5FC
	bl AllocZeroed
	str r0, [r6]
	cmp r0, #0
	bne _0801B600
_0801B5F4:
	movs r0, #0
	b _0801B664
	.align 2, 0
_0801B5F8: .4byte 0x02022928
_0801B5FC: .4byte 0x0000126C
_0801B600:
	adds r1, r4, #0
	movs r2, #0xa4
	bl memcpy
	ldr r0, [r6]
	adds r0, #0xa4
	adds r1, r5, #0
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r2, [r6]
	ldrb r1, [r2, #8]
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #7
	bls _0801B62E
	movs r0, #0x3d
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #8]
_0801B62E:
	ldr r2, [r6]
	ldrb r1, [r2, #8]
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bls _0801B642
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #8]
_0801B642:
	ldr r1, [r6]
	ldrb r0, [r1, #9]
	cmp r0, #7
	bls _0801B64E
	movs r0, #0
	strb r0, [r1, #9]
_0801B64E:
	ldr r0, [r6]
	adds r2, r0, #0
	adds r2, #0xc8
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	lsls r0, r0, #4
	ldr r1, _0801B66C
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #1
_0801B664:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B66C: .4byte 0x082C428C
	thumb_func_end InitWonderCardResources

	thumb_func_start DestroyWonderCardResources
DestroyWonderCardResources: @ 0x0801B670
	push {r4, lr}
	ldr r4, _0801B694
	ldr r0, [r4]
	cmp r0, #0
	beq _0801B68C
	ldr r2, _0801B698
	movs r1, #0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
_0801B68C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B694: .4byte 0x02022928
_0801B698: .4byte 0x0000126C
	thumb_func_end DestroyWonderCardResources

	thumb_func_start FadeToWonderCardMenu
FadeToWonderCardMenu: @ 0x0801B69C
	push {r4, r5, r6, lr}
	sub sp, #0x24
	ldr r4, _0801B6B0
	ldr r0, [r4]
	cmp r0, #0
	bne _0801B6B4
	movs r0, #1
	rsbs r0, r0, #0
	b _0801B8A4
	.align 2, 0
_0801B6B0: .4byte 0x02022928
_0801B6B4:
	adds r0, #0xcc
	ldrb r0, [r0]
	cmp r0, #7
	bls _0801B6BE
	b _0801B880
_0801B6BE:
	lsls r0, r0, #2
	ldr r1, _0801B6C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B6C8: .4byte 0x0801B6CC
_0801B6CC: @ jump table
	.4byte _0801B6EC @ case 0
	.4byte _0801B6FE @ case 1
	.4byte _0801B70C @ case 2
	.4byte _0801B7A0 @ case 3
	.4byte _0801B824 @ case 4
	.4byte _0801B82A @ case 5
	.4byte _0801B844 @ case 6
	.4byte _0801B84A @ case 7
_0801B6EC:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _0801B896
_0801B6FE:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B70A
	b _0801B896
_0801B70A:
	b _0801B8A2
_0801B70C:
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
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	ldr r5, _0801B798
	ldr r0, [r5]
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r1, [r0, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #8
	bl decompress_and_copy_tile_data_to_vram
	ldr r4, _0801B79C
	adds r0, r4, #0
	bl AddWindow
	ldr r1, [r5]
	adds r1, #0xce
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #8
	bl AddWindow
	ldr r1, [r5]
	adds r1, #0xd0
	strh r0, [r1]
	adds r4, #0x10
	adds r0, r4, #0
	bl AddWindow
	ldr r1, [r5]
	adds r1, #0xd2
	strh r0, [r1]
	b _0801B896
	.align 2, 0
_0801B798: .4byte 0x02022928
_0801B79C: .4byte 0x082C3348
_0801B7A0:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _0801B8A2
	movs r0, #1
	bl stdpal_get
	movs r1, #0x20
	movs r2, #0x20
	bl LoadPalette
	ldr r2, _0801B81C
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r5, _0801B820
	ldr r0, [r5]
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	movs r4, #0x9b
	lsls r4, r4, #2
	adds r1, r1, r4
	bl LZ77UnCompWram
	ldr r1, [r5]
	adds r1, r1, r4
	movs r2, #0x1e
	str r2, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #1
	str r0, [sp, #0x18]
	movs r0, #8
	str r0, [sp, #0x1c]
	str r6, [sp, #0x20]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	b _0801B896
	.align 2, 0
_0801B81C: .4byte 0x02037C74
_0801B820: .4byte 0x02022928
_0801B824:
	bl sub_0801B9F0
	b _0801B896
_0801B82A:
	movs r0, #0
	bl sub_0801BCA4
	movs r0, #1
	bl sub_0801BCA4
	movs r0, #2
	bl sub_0801BCA4
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	b _0801B896
_0801B844:
	bl LoadMonIconPalettes
	b _0801B896
_0801B84A:
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r2, _0801B87C
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	bl sub_0801C04C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0801B896
	.align 2, 0
_0801B87C: .4byte 0x02037C74
_0801B880:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0801B8A2
	ldr r0, [r4]
	adds r0, #0xcc
	strb r1, [r0]
	movs r0, #1
	b _0801B8A4
_0801B896:
	ldr r0, _0801B8AC
	ldr r1, [r0]
	adds r1, #0xcc
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B8A2:
	movs r0, #0
_0801B8A4:
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B8AC: .4byte 0x02022928
	thumb_func_end FadeToWonderCardMenu

	thumb_func_start FadeOutFromWonderCard
FadeOutFromWonderCard: @ 0x0801B8B0
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _0801B8C4
	ldr r0, [r4]
	cmp r0, #0
	bne _0801B8C8
	movs r0, #1
	rsbs r0, r0, #0
	b _0801B9E4
	.align 2, 0
_0801B8C4: .4byte 0x02022928
_0801B8C8:
	adds r0, #0xcc
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0801B9C0
	lsls r0, r0, #2
	ldr r1, _0801B8DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B8DC: .4byte 0x0801B8E0
_0801B8E0: @ jump table
	.4byte _0801B8F8 @ case 0
	.4byte _0801B90A @ case 1
	.4byte _0801B916 @ case 2
	.4byte _0801B95E @ case 3
	.4byte _0801B990 @ case 4
	.4byte _0801B99A @ case 5
_0801B8F8:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _0801B9D6
_0801B90A:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B9D6
	b _0801B9E2
_0801B916:
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
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	b _0801B9D6
_0801B95E:
	movs r0, #1
	bl HideBg
	movs r0, #2
	bl HideBg
	ldr r4, _0801B98C
	ldr r0, [r4]
	adds r0, #0xd2
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	adds r0, #0xd0
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	adds r0, #0xce
	ldrb r0, [r0]
	bl RemoveWindow
	b _0801B9D6
	.align 2, 0
_0801B98C: .4byte 0x02022928
_0801B990:
	bl sub_0801C17C
	bl FreeMonIconPalettes
	b _0801B9D6
_0801B99A:
	ldr r0, _0801B9BC
	ldrb r0, [r0]
	bl PrintMysteryGiftOrEReaderTopMenu
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _0801B9D6
	.align 2, 0
_0801B9BC: .4byte 0x02022914
_0801B9C0:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0801B9E2
	ldr r0, [r4]
	adds r0, #0xcc
	strb r1, [r0]
	movs r0, #1
	b _0801B9E4
_0801B9D6:
	ldr r0, _0801B9EC
	ldr r1, [r0]
	adds r1, #0xcc
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B9E2:
	movs r0, #0
_0801B9E4:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B9EC: .4byte 0x02022928
	thumb_func_end FadeOutFromWonderCard

	thumb_func_start sub_0801B9F0
sub_0801B9F0: @ 0x0801B9F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r5, #0
	mov r0, sp
	movs r1, #0
	movs r2, #6
	bl memset
	ldr r4, _0801BAC4
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0xe3
	adds r1, #0xa
	movs r2, #0x12
	bl memcpy
	ldr r0, [r4]
	adds r0, #0xf5
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0xf6
	adds r1, #0x1c
	movs r2, #0xd
	bl memcpy
	ldr r0, [r4]
	ldr r2, _0801BAC8
	adds r1, r0, r2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldr r2, _0801BACC
	cmp r0, r2
	bls _0801BA42
	str r2, [r1, #4]
_0801BA42:
	ldr r1, [r4]
	movs r3, #0x82
	lsls r3, r3, #1
	adds r0, r1, r3
	ldr r1, [r1, #4]
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	adds r6, r4, #0
_0801BA56:
	ldr r2, [r6]
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r4, r1, r5
	adds r0, r4, r2
	ldr r3, _0801BAD0
	adds r0, r0, r3
	adds r1, r1, r2
	adds r1, #0x29
	movs r2, #0x14
	bl memcpy
	ldr r1, [r6]
	ldr r0, _0801BAD4
	adds r1, r1, r0
	adds r1, r1, r4
	movs r2, #1
	rsbs r2, r2, #0
	adds r7, r2, #0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _0801BA56
	ldr r6, _0801BAC4
	ldr r1, [r6]
	ldr r3, _0801BAD8
	adds r0, r1, r3
	adds r1, #0x79
	movs r2, #0x14
	bl memcpy
	ldr r0, [r6]
	ldr r2, _0801BADC
	adds r1, r0, r2
	movs r3, #1
	rsbs r3, r3, #0
	adds r4, r3, #0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r6]
	ldrb r0, [r1, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0801BAFE
	cmp r0, #1
	bgt _0801BAE0
	cmp r0, #0
	beq _0801BAE6
	b _0801BC96
	.align 2, 0
_0801BAC4: .4byte 0x02022928
_0801BAC8: .4byte 0x00000103
_0801BACC: .4byte 0x000F423F
_0801BAD0: .4byte 0x0000010B
_0801BAD4: .4byte 0x0000011F
_0801BAD8: .4byte 0x0000015F
_0801BADC: .4byte 0x00000173
_0801BAE0:
	cmp r0, #2
	beq _0801BB0C
	b _0801BC96
_0801BAE6:
	movs r2, #0xba
	lsls r2, r2, #1
	adds r0, r1, r2
	adds r1, #0x8d
	movs r2, #0x14
	bl memcpy
	ldr r1, [r6]
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r1, r1, r3
	b _0801BB04
_0801BAFE:
	movs r6, #0xba
	lsls r6, r6, #1
	adds r1, r1, r6
_0801BB04:
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	b _0801BC96
_0801BB0C:
	movs r2, #0xba
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	mov r3, sp
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0xa4
	ldrh r0, [r0]
	ldr r2, _0801BBB8
	cmp r0, r2
	bls _0801BB2A
	adds r0, r2, #0
_0801BB2A:
	strh r0, [r3]
	mov r3, sp
	adds r0, r1, #0
	adds r0, #0xa6
	ldrh r0, [r0]
	cmp r0, r2
	bls _0801BB3A
	adds r0, r2, #0
_0801BB3A:
	strh r0, [r3, #2]
	mov r3, sp
	adds r0, r1, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	cmp r0, r2
	bls _0801BB4A
	adds r0, r2, #0
_0801BB4A:
	strh r0, [r3, #4]
	movs r5, #0
_0801BB4E:
	lsls r4, r5, #3
	subs r4, r4, r5
	lsls r4, r4, #2
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r4, r4, r3
	ldr r0, [r6]
	adds r0, r0, r4
	adds r0, #0x16
	movs r1, #0xff
	movs r2, #4
	bl memset
	ldr r0, [r6]
	adds r0, r0, r4
	adds r0, #1
	movs r1, #0xff
	movs r2, #0x15
	bl memset
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #7
	bls _0801BB4E
	movs r5, #0
	movs r4, #0
	ldr r7, _0801BBBC
	movs r6, #0xc6
	lsls r6, r6, #1
	mov r8, r6
_0801BB8C:
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0x8d
	adds r0, r1, r5
	ldrb r3, [r0]
	cmp r3, #0xf7
	beq _0801BBC4
	adds r0, r2, #0
	adds r0, #0xcd
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r6, _0801BBC0
	adds r1, r2, r6
	adds r1, r1, r0
	strb r3, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0801BC8A
	.align 2, 0
_0801BBB8: .4byte 0x000003E7
_0801BBBC: .4byte 0x02022928
_0801BBC0: .4byte 0x0000018D
_0801BBC4:
	adds r0, r5, #1
	adds r0, r1, r0
	ldrb r3, [r0]
	cmp r3, #2
	bls _0801BBD4
	adds r0, r5, #2
	lsls r0, r0, #0x10
	b _0801BC88
_0801BBD4:
	adds r0, r2, #0
	adds r0, #0xcd
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	adds r0, #0x16
	lsls r1, r3, #1
	add r1, sp
	ldrh r1, [r1]
	movs r2, #2
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xcd
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r6, r5, #2
	adds r1, #0x8d
	adds r1, r1, r6
	ldrb r1, [r1]
	add r0, r8
	strb r1, [r0]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xcd
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	add r2, r8
	ldrb r5, [r2]
	movs r0, #3
	movs r1, #2
	bl GetFontAttribute
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	bl GetFontAttribute
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r4, r0
	cmp r5, r4
	ble _0801BC70
	movs r0, #3
	movs r1, #2
	bl GetFontAttribute
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	bl GetFontAttribute
	ldr r3, [r7]
	adds r1, r3, #0
	adds r1, #0xcd
	ldrb r2, [r1]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r3, r3, r1
	adds r4, r4, r0
	movs r0, #0xc6
	lsls r0, r0, #1
	adds r3, r3, r0
	strb r4, [r3]
_0801BC70:
	ldr r1, [r7]
	adds r1, #0xcd
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0801BC96
	movs r4, #0
	lsls r0, r6, #0x10
_0801BC88:
	lsrs r5, r0, #0x10
_0801BC8A:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x13
	bhi _0801BC96
	b _0801BB8C
_0801BC96:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0801B9F0

	thumb_func_start sub_0801BCA4
sub_0801BCA4: @ 0x0801BCA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, _0801BCF0
	mov sl, r1
	ldr r0, [r1]
	lsls r1, r4, #1
	adds r0, #0xce
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r7, r0, #0x18
	lsrs r3, r7, #0x18
	mov sb, r3
	mov r0, sb
	bl PutWindowTilemap
	mov r0, sb
	movs r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #1
	bne _0801BCE2
	b _0801BE20
_0801BCE2:
	cmp r4, #1
	bgt _0801BCF4
	cmp r4, #0
	beq _0801BCFE
	mov r8, r7
	b _0801C02A
	.align 2, 0
_0801BCF0: .4byte 0x02022928
_0801BCF4:
	cmp r5, #2
	bne _0801BCFA
	b _0801BE84
_0801BCFA:
	mov r8, r7
	b _0801C02A
_0801BCFE:
	mov r0, sl
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r3, _0801BE1C
	adds r1, r1, r3
	str r1, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	adds r2, #0xe3
	str r2, [sp, #8]
	mov r0, sb
	movs r1, #3
	movs r2, #0
	movs r3, #1
	bl AddTextPrinterParameterized3
	movs r0, #3
	movs r1, #2
	bl GetFontAttribute
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0
	bl GetFontAttribute
	adds r6, r0, #0
	mov r1, sl
	ldr r0, [r1]
	adds r0, #0xf6
	bl StringLength
	mov r8, r0
	movs r0, #3
	movs r1, #2
	bl GetFontAttribute
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	bl GetFontAttribute
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r5, r5, r6
	movs r6, #0xd
	adds r2, r5, #0
	muls r2, r6, r2
	mov r3, r8
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r4, r0
	mov r0, r8
	muls r0, r4, r0
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, sl
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r1, _0801BE1C
	adds r0, r0, r1
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	adds r3, #0xf6
	str r3, [sp, #8]
	mov r0, sb
	movs r1, #3
	movs r3, #0x11
	bl AddTextPrinterParameterized3
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0, #4]
	mov r8, r7
	cmp r0, #0
	bne _0801BDC4
	b _0801C02A
_0801BDC4:
	movs r0, #3
	movs r1, #2
	bl GetFontAttribute
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	bl GetFontAttribute
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r4, r0
	adds r2, r4, #0
	muls r2, r6, r2
	adds r2, #6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, sl
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r1, _0801BE1C
	adds r0, r0, r1
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r3, r1
	str r0, [sp, #8]
	mov r0, sb
	movs r1, #0
	movs r3, #0x11
	bl AddTextPrinterParameterized3
	b _0801C02A
	.align 2, 0
_0801BE1C: .4byte 0x082C333C
_0801BE20:
	mov r8, r7
_0801BE22:
	ldr r3, [sp, #0xc]
	lsls r4, r3, #0x18
	asrs r4, r4, #0x18
	lsls r3, r4, #4
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0801BE78
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r0, [r0]
	lsrs r0, r0, #4
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _0801BE7C
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0801BE80
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [sp, #8]
	mov r1, r8
	lsrs r0, r1, #0x18
	movs r1, #3
	movs r2, #2
	bl AddTextPrinterParameterized3
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r3, r4, #0x18
	str r3, [sp, #0xc]
	asrs r4, r4, #0x18
	cmp r4, #3
	ble _0801BE22
	b _0801C02A
	.align 2, 0
_0801BE78: .4byte 0x02022928
_0801BE7C: .4byte 0x082C333C
_0801BE80: .4byte 0x0000010B
_0801BE84:
	ldr r4, _0801BF08
	mov r0, sl
	ldr r2, [r0]
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	adds r0, r0, r4
	ldrb r3, [r0]
	adds r0, r2, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r5, _0801BF0C
	adds r1, r1, r5
	str r1, [sp]
	ldr r1, [sp, #0xc]
	str r1, [sp, #4]
	ldr r1, _0801BF10
	adds r0, r2, r1
	str r0, [sp, #8]
	mov r0, sb
	movs r1, #3
	movs r2, #2
	bl AddTextPrinterParameterized3
	mov r3, sl
	ldr r2, [r3]
	ldrb r1, [r2, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0801BF14
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	adds r0, r0, r4
	ldrb r3, [r0]
	adds r3, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r2, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r1, #0xba
	lsls r1, r1, #1
	adds r0, r2, r1
	str r0, [sp, #8]
	mov r0, sb
	movs r1, #3
	movs r2, #2
	bl AddTextPrinterParameterized3
	mov r8, r7
	b _0801C02A
	.align 2, 0
_0801BF08: .4byte 0x082C3344
_0801BF0C: .4byte 0x082C333C
_0801BF10: .4byte 0x0000015F
_0801BF14:
	movs r3, #0xde
	mov sb, r3
	adds r0, r2, #0
	adds r0, #0xcd
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	mov r8, r7
	cmp r0, #0
	bge _0801BF28
	b _0801C02A
_0801BF28:
	mov r1, sl
	ldr r4, [r1]
	asrs r7, r0, #0x18
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r6, r0, #2
	adds r2, r4, r6
	movs r3, #0xd1
	lsls r3, r3, #1
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0801BF9A
	mov r1, sb
	subs r1, #0x18
	subs r3, #0x16
	adds r0, r2, r3
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	ldr r1, _0801C044
	adds r0, r0, r1
	ldrb r3, [r0]
	adds r3, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _0801C048
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0xc6
	lsls r1, r1, #1
	adds r0, r6, r1
	adds r0, r4, r0
	adds r0, #0x16
	str r0, [sp, #8]
	mov r1, r8
	lsrs r0, r1, #0x18
	movs r1, #0
	bl AddTextPrinterParameterized3
_0801BF9A:
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r6, r6, r3
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r6
	adds r0, #1
	bl StringLength
	adds r5, r0, #0
	movs r0, #3
	movs r1, #2
	bl GetFontAttribute
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	bl GetFontAttribute
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r5, #0
	muls r0, r4, r0
	mov r3, sb
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	mov r0, sl
	ldr r4, [r0]
	ldrb r0, [r4, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	ldr r1, _0801C044
	adds r0, r0, r1
	ldrb r3, [r0]
	adds r3, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _0801C048
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r4, r4, r6
	adds r4, #1
	str r4, [sp, #8]
	mov r1, r8
	lsrs r0, r1, #0x18
	movs r1, #3
	bl AddTextPrinterParameterized3
	subs r0, r7, #1
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _0801C02A
	b _0801BF28
_0801C02A:
	mov r3, r8
	lsrs r0, r3, #0x18
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C044: .4byte 0x082C3344
_0801C048: .4byte 0x082C333C
	thumb_func_end sub_0801BCA4

	thumb_func_start sub_0801C04C
sub_0801C04C: @ 0x0801C04C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r7, #0
	ldr r4, _0801C164
	ldr r0, [r4]
	adds r0, #0xd4
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xaa
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801C0A8
	bl sub_080D2724
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0801C168
	str r7, [sp]
	str r7, [sp, #4]
	movs r2, #0xdc
	movs r3, #0x14
	bl sub_080D2618
	ldr r1, [r4]
	adds r1, #0xd4
	strb r0, [r1]
	ldr r2, _0801C16C
	ldr r0, [r4]
	adds r0, #0xd4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #5]
_0801C0A8:
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _0801C156
	ldrb r1, [r1, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _0801C156
	ldr r0, _0801C170
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, [r4]
	adds r0, #0xc8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #4
	lsls r0, r0, #3
	ldr r1, _0801C174
	adds r0, r0, r1
	bl LoadSpritePalette
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	cmp r7, r0
	bhs _0801C156
	adds r6, r4, #0
	movs r0, #0xff
	mov sb, r0
	movs r1, #0
	mov r8, r1
_0801C0E6:
	ldr r1, [r6]
	lsls r4, r7, #1
	adds r1, #0xd5
	adds r1, r1, r4
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, #0xd6
	adds r1, r1, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	lsls r1, r7, #5
	movs r0, #0xd8
	subs r5, r0, r1
	ldr r0, _0801C178
	adds r1, r5, #0
	movs r2, #0x90
	movs r3, #8
	bl CreateSprite
	ldr r1, [r6]
	adds r1, #0xd5
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0xac
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801C148
	bl sub_080D2724
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	str r1, [sp]
	str r1, [sp, #4]
	ldr r1, _0801C168
	adds r2, r5, #0
	movs r3, #0x88
	bl sub_080D2618
	ldr r1, [r6]
	adds r1, #0xd6
	adds r1, r1, r4
	strb r0, [r1]
_0801C148:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [r6]
	ldrb r0, [r0, #9]
	cmp r7, r0
	blo _0801C0E6
_0801C156:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C164: .4byte 0x02022928
_0801C168: .4byte 0x08007141
_0801C16C: .4byte 0x020205AC
_0801C170: .4byte 0x082C422C
_0801C174: .4byte 0x082C4234
_0801C178: .4byte 0x082C4274
	thumb_func_end sub_0801C04C

	thumb_func_start sub_0801C17C
sub_0801C17C: @ 0x0801C17C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _0801C21C
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xd4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0801C19E
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0801C220
	adds r0, r0, r1
	bl sub_080D2798
_0801C19E:
	ldr r0, [r4]
	ldrb r2, [r0, #9]
	cmp r2, #0
	beq _0801C214
	ldrb r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _0801C214
	cmp r6, r2
	bhs _0801C204
	adds r7, r4, #0
_0801C1B6:
	ldr r0, [r7]
	lsls r4, r6, #1
	adds r0, #0xd5
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0801C1F6
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0801C220
	adds r0, r0, r5
	bl DestroySprite
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xd5
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0801C1F6
	adds r0, r1, #0
	adds r0, #0xd6
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl sub_080D2798
_0801C1F6:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r7]
	ldrb r0, [r0, #9]
	cmp r6, r0
	blo _0801C1B6
_0801C204:
	movs r4, #0x80
	lsls r4, r4, #8
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
_0801C214:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C21C: .4byte 0x02022928
_0801C220: .4byte 0x020205AC
	thumb_func_end sub_0801C17C

	thumb_func_start InitWonderNewsResources
InitWonderNewsResources: @ 0x0801C224
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C23A
	ldr r5, _0801C240
	ldr r0, _0801C244
	bl AllocZeroed
	str r0, [r5]
	cmp r0, #0
	bne _0801C248
_0801C23A:
	movs r0, #0
	b _0801C274
	.align 2, 0
_0801C240: .4byte 0x0202292C
_0801C244: .4byte 0x000011EC
_0801C248:
	adds r1, r4, #0
	movs r2, #0xe0
	bl memcpy
	ldr r1, [r5]
	ldrb r0, [r1, #3]
	cmp r0, #7
	bls _0801C25C
	movs r0, #0
	strb r0, [r1, #3]
_0801C25C:
	ldr r2, [r5]
	adds r3, r2, #0
	adds r3, #0xe0
	ldrb r0, [r2, #3]
	lsls r0, r0, #4
	ldr r1, _0801C27C
	adds r0, r0, r1
	str r0, [r3]
	adds r2, #0xe5
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #1
_0801C274:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801C27C: .4byte 0x082C49F4
	thumb_func_end InitWonderNewsResources

	thumb_func_start DestroyWonderNewsResources
DestroyWonderNewsResources: @ 0x0801C280
	push {r4, lr}
	ldr r4, _0801C2A4
	ldr r0, [r4]
	cmp r0, #0
	beq _0801C29C
	ldr r2, _0801C2A8
	movs r1, #0
	bl memset
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
_0801C29C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C2A4: .4byte 0x0202292C
_0801C2A8: .4byte 0x000011EC
	thumb_func_end DestroyWonderNewsResources

	thumb_func_start FadeToWonderNewsMenu
FadeToWonderNewsMenu: @ 0x0801C2AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r4, _0801C2C8
	ldr r0, [r4]
	cmp r0, #0
	bne _0801C2CC
	movs r0, #1
	rsbs r0, r0, #0
	b _0801C572
	.align 2, 0
_0801C2C8: .4byte 0x0202292C
_0801C2CC:
	adds r0, #0xe4
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, #6
	bls _0801C2D8
	b _0801C540
_0801C2D8:
	lsls r0, r0, #2
	ldr r1, _0801C2E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C2E4: .4byte 0x0801C2E8
_0801C2E8: @ jump table
	.4byte _0801C304 @ case 0
	.4byte _0801C316 @ case 1
	.4byte _0801C37C @ case 2
	.4byte _0801C418 @ case 3
	.4byte _0801C4D4 @ case 4
	.4byte _0801C4DA @ case 5
	.4byte _0801C4EC @ case 6
_0801C304:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _0801C55A
_0801C316:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C322
	b _0801C570
_0801C322:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	ldr r1, _0801C378
	movs r0, #0x44
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x1f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x1b
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	b _0801C55A
	.align 2, 0
_0801C378: .4byte 0x00001C98
_0801C37C:
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
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	ldr r5, _0801C410
	ldr r0, [r5]
	adds r0, #0xe0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #8
	bl decompress_and_copy_tile_data_to_vram
	ldr r4, _0801C414
	adds r0, r4, #0
	bl AddWindow
	ldr r1, [r5]
	adds r1, #0xec
	strh r0, [r1]
	adds r4, #8
	adds r0, r4, #0
	bl AddWindow
	ldr r1, [r5]
	adds r1, #0xee
	strh r0, [r1]
	b _0801C55A
	.align 2, 0
_0801C410: .4byte 0x0202292C
_0801C414: .4byte 0x082C4314
_0801C418:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0801C426
	b _0801C570
_0801C426:
	movs r0, #1
	bl stdpal_get
	movs r1, #0x20
	movs r2, #0x20
	bl LoadPalette
	ldr r2, _0801C4CC
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r0, _0801C4D0
	mov r8, r0
	ldr r0, [r0]
	adds r0, #0xe0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	mov r2, r8
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0xe0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	movs r6, #0xf6
	lsls r6, r6, #1
	adds r1, r1, r6
	bl LZ77UnCompWram
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r6
	movs r4, #0x1e
	str r4, [sp]
	movs r5, #3
	str r5, [sp, #4]
	str r7, [sp, #8]
	str r7, [sp, #0xc]
	str r4, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r2, #1
	mov sl, r2
	str r2, [sp, #0x18]
	movs r0, #8
	mov sb, r0
	str r0, [sp, #0x1c]
	str r7, [sp, #0x20]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r6
	str r4, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r5, [sp, #0xc]
	str r4, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, sl
	str r0, [sp, #0x18]
	mov r2, sb
	str r2, [sp, #0x1c]
	str r7, [sp, #0x20]
	movs r0, #3
	movs r2, #0
	movs r3, #3
	bl CopyRectToBgTilemapBufferRect
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _0801C55A
	.align 2, 0
_0801C4CC: .4byte 0x02037C74
_0801C4D0: .4byte 0x0202292C
_0801C4D4:
	bl sub_0801C8B4
	b _0801C55A
_0801C4DA:
	bl sub_0801C95C
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	b _0801C55A
_0801C4EC:
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	ldr r2, _0801C538
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	ldr r4, _0801C53C
	ldr r1, [r4]
	movs r2, #0xee
	lsls r2, r2, #1
	adds r0, r1, r2
	adds r1, #0xea
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	adds r1, #0xe5
	movs r2, #0
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r2, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0801C55A
	.align 2, 0
_0801C538: .4byte 0x02037C74
_0801C53C: .4byte 0x0202292C
_0801C540:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C570
	ldr r0, [r4]
	adds r0, #0xe4
	ldrb r2, [r0]
	movs r1, #1
	ands r1, r2
	strb r1, [r0]
	movs r0, #1
	b _0801C572
_0801C55A:
	ldr r0, _0801C584
	ldr r2, [r0]
	adds r2, #0xe4
	ldrb r3, [r2]
	lsrs r1, r3, #1
	adds r1, #1
	lsls r1, r1, #1
	movs r0, #1
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0801C570:
	movs r0, #0
_0801C572:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C584: .4byte 0x0202292C
	thumb_func_end FadeToWonderNewsMenu

	thumb_func_start FadeOutFromWonderNews
FadeOutFromWonderNews: @ 0x0801C588
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _0801C59C
	ldr r0, [r4]
	cmp r0, #0
	bne _0801C5A0
	movs r0, #1
	rsbs r0, r0, #0
	b _0801C746
	.align 2, 0
_0801C59C: .4byte 0x0202292C
_0801C5A0:
	adds r0, #0xe4
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, #5
	bls _0801C5AC
	b _0801C714
_0801C5AC:
	lsls r0, r0, #2
	ldr r1, _0801C5B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C5B8: .4byte 0x0801C5BC
_0801C5BC: @ jump table
	.4byte _0801C5D4 @ case 0
	.4byte _0801C5E6 @ case 1
	.4byte _0801C628 @ case 2
	.4byte _0801C688 @ case 3
	.4byte _0801C6B0 @ case 4
	.4byte _0801C6E4 @ case 5
_0801C5D4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _0801C72E
_0801C5E6:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C5F2
	b _0801C744
_0801C5F2:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
	b _0801C72E
_0801C628:
	movs r4, #0x1e
	str r4, [sp]
	movs r5, #0x14
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r5, #0x18
	str r5, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _0801C72E
_0801C688:
	movs r0, #1
	bl HideBg
	movs r0, #2
	bl HideBg
	ldr r4, _0801C6AC
	ldr r0, [r4]
	adds r0, #0xee
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r4]
	adds r0, #0xec
	ldrb r0, [r0]
	bl RemoveWindow
	b _0801C72E
	.align 2, 0
_0801C6AC: .4byte 0x0202292C
_0801C6B0:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	ldr r4, _0801C6E0
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xe5
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0801C72E
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	adds r0, #0xe5
	movs r1, #0xff
	strb r1, [r0]
	b _0801C72E
	.align 2, 0
_0801C6E0: .4byte 0x0202292C
_0801C6E4:
	ldr r0, _0801C710
	ldrb r0, [r0]
	bl PrintMysteryGiftOrEReaderTopMenu
	movs r0, #3
	bl MG_DrawCheckerboardPattern
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _0801C72E
	.align 2, 0
_0801C710: .4byte 0x02022914
_0801C714:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C744
	ldr r0, [r4]
	adds r0, #0xe4
	ldrb r2, [r0]
	movs r1, #1
	ands r1, r2
	strb r1, [r0]
	movs r0, #1
	b _0801C746
_0801C72E:
	ldr r0, _0801C750
	ldr r2, [r0]
	adds r2, #0xe4
	ldrb r3, [r2]
	lsrs r1, r3, #1
	adds r1, #1
	lsls r1, r1, #1
	movs r0, #1
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0801C744:
	movs r0, #0
_0801C746:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801C750: .4byte 0x0202292C
	thumb_func_end FadeOutFromWonderNews

	thumb_func_start MENews_RemoveScrollIndicatorArrowPair
MENews_RemoveScrollIndicatorArrowPair: @ 0x0801C754
	push {r4, lr}
	ldr r4, _0801C790
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0xe4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801C78A
	adds r1, r2, #0
	adds r1, #0xe5
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0801C78A
	bl RemoveScrollIndicatorArrowPair
	ldr r0, [r4]
	adds r0, #0xe5
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, #0xe4
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
_0801C78A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C790: .4byte 0x0202292C
	thumb_func_end MENews_RemoveScrollIndicatorArrowPair

	thumb_func_start MENews_AddScrollIndicatorArrowPair
MENews_AddScrollIndicatorArrowPair: @ 0x0801C794
	push {r4, lr}
	ldr r4, _0801C7D0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0xe4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801C7CA
	movs r1, #0xee
	lsls r1, r1, #1
	adds r0, r2, r1
	adds r1, r2, #0
	adds r1, #0xea
	bl AddScrollIndicatorArrowPair
	ldr r1, [r4]
	adds r1, #0xe5
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, #0xe4
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_0801C7CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C7D0: .4byte 0x0202292C
	thumb_func_end MENews_AddScrollIndicatorArrowPair

	thumb_func_start MENews_GetInput
MENews_GetInput: @ 0x0801C7D4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r4, r3, #0
	ldr r2, _0801C7FC
	ldr r0, [r2]
	mov ip, r0
	adds r0, #0xe6
	ldrb r1, [r0]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _0801C800
	bl sub_0801CA6C
_0801C7F6:
	movs r0, #0xff
	b _0801C8AE
	.align 2, 0
_0801C7FC: .4byte 0x0202292C
_0801C800:
	cmp r3, #2
	beq _0801C81C
	cmp r3, #2
	bgt _0801C80E
	cmp r3, #1
	beq _0801C818
	b _0801C7F6
_0801C80E:
	cmp r4, #0x40
	beq _0801C820
	cmp r4, #0x80
	beq _0801C848
	b _0801C7F6
_0801C818:
	movs r0, #0
	b _0801C8AE
_0801C81C:
	movs r0, #1
	b _0801C8AE
_0801C820:
	mov r0, ip
	adds r0, #0xea
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801C7F6
	mov r0, ip
	adds r0, #0xe4
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0801C7F6
	mov r2, ip
	adds r2, #0xe7
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _0801C872
_0801C848:
	mov r0, ip
	adds r0, #0xea
	mov r1, ip
	adds r1, #0xe8
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0801C7F6
	mov r0, ip
	adds r0, #0xe4
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0801C7F6
	mov r0, ip
	adds r0, #0xe7
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
_0801C872:
	ldr r1, [r6]
	adds r1, #0xe6
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r3, [r6]
	adds r3, #0xe6
	ldrb r1, [r3]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldr r1, [r6]
	adds r1, #0xe7
	ldrb r3, [r1]
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0xe7
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, #0
	beq _0801C8AC
	movs r0, #3
	b _0801C8AE
_0801C8AC:
	movs r0, #2
_0801C8AE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end MENews_GetInput

	thumb_func_start sub_0801C8B4
sub_0801C8B4: @ 0x0801C8B4
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r4, _0801C94C
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0xf2
	adds r1, #4
	movs r2, #0x14
	bl memcpy
	ldr r0, [r4]
	movs r2, #0x83
	lsls r2, r2, #1
	adds r1, r0, r2
	movs r0, #0xff
	strb r0, [r1]
	adds r6, r4, #0
_0801C8D6:
	ldr r2, [r6]
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r4, r1, r5
	adds r0, r4, r2
	ldr r3, _0801C950
	adds r0, r0, r3
	adds r1, r1, r2
	adds r1, #0x18
	movs r2, #0x14
	bl memcpy
	ldr r0, [r6]
	ldr r1, _0801C954
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
	cmp r5, #7
	bls _0801C916
	ldr r1, [r6]
	ldr r2, _0801C950
	adds r0, r1, r2
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0801C916
	adds r1, #0xe8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0801C916:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _0801C8D6
	ldr r2, _0801C94C
	ldr r1, [r2]
	movs r3, #0xee
	lsls r3, r3, #1
	adds r1, r1, r3
	ldr r0, _0801C958
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, [r2]
	adds r0, r2, #0
	adds r0, #0xe8
	ldrh r1, [r0]
	movs r4, #0xf2
	lsls r4, r4, #1
	adds r0, r2, r4
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801C94C: .4byte 0x0202292C
_0801C950: .4byte 0x00000107
_0801C954: .4byte 0x0000011B
_0801C958: .4byte 0x082C4324
	thumb_func_end sub_0801C8B4

	thumb_func_start sub_0801C95C
sub_0801C95C: @ 0x0801C95C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r7, #0
	ldr r6, _0801CA60
	ldr r0, [r6]
	adds r0, #0xec
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	adds r0, #0xee
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	adds r0, #0xec
	ldrb r0, [r0]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, #0xee
	ldrb r0, [r0]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, #0xf2
	bl StringLength
	adds r5, r0, #0
	movs r0, #3
	movs r1, #2
	bl GetFontAttribute
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	bl GetFontAttribute
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r5, #0
	muls r0, r4, r0
	asrs r0, r0, #1
	movs r2, #0x71
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, [r6]
	adds r0, r4, #0
	adds r0, #0xec
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0xe0
	ldr r1, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	lsls r3, r1, #1
	adds r3, r3, r1
	ldr r1, _0801CA64
	adds r3, r3, r1
	str r3, [sp]
	str r7, [sp, #4]
	adds r4, #0xf2
	str r4, [sp, #8]
	movs r1, #3
	movs r3, #6
	bl AddTextPrinterParameterized3
_0801C9F4:
	ldr r5, _0801CA60
	ldr r4, [r5]
	adds r0, r4, #0
	adds r0, #0xee
	ldrb r0, [r0]
	lsls r3, r7, #4
	adds r3, #4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r1, r4, #0
	adds r1, #0xe0
	ldr r1, [r1]
	ldrb r1, [r1]
	lsrs r1, r1, #4
	lsls r2, r1, #1
	adds r2, r2, r1
	ldr r1, _0801CA64
	adds r2, r2, r1
	str r2, [sp]
	movs r1, #0
	str r1, [sp, #4]
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r2, _0801CA68
	adds r1, r1, r2
	adds r4, r4, r1
	str r4, [sp, #8]
	movs r1, #3
	movs r2, #3
	bl AddTextPrinterParameterized3
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #9
	bls _0801C9F4
	ldr r0, [r5]
	adds r0, #0xec
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, [r5]
	adds r0, #0xee
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CA60: .4byte 0x0202292C
_0801CA64: .4byte 0x082C430C
_0801CA68: .4byte 0x00000107
	thumb_func_end sub_0801C95C

	thumb_func_start sub_0801CA6C
sub_0801CA6C: @ 0x0801CA6C
	push {r4, r5, lr}
	ldr r0, _0801CAA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xe6
	ldrb r0, [r0]
	lsrs r4, r0, #1
	lsls r4, r4, #8
	adds r1, #0xe7
	ldrb r1, [r1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CAA4
	movs r0, #2
	adds r1, r4, #0
	movs r2, #1
	bl ChangeBgY
	movs r0, #3
	adds r1, r4, #0
	movs r2, #1
	bl ChangeBgY
	b _0801CAB8
	.align 2, 0
_0801CAA0: .4byte 0x0202292C
_0801CAA4:
	movs r0, #2
	adds r1, r4, #0
	movs r2, #2
	bl ChangeBgY
	movs r0, #3
	adds r1, r4, #0
	movs r2, #2
	bl ChangeBgY
_0801CAB8:
	ldr r2, _0801CAF8
	ldr r0, [r2]
	adds r4, r0, #0
	adds r4, #0xe7
	ldrb r3, [r4]
	lsrs r1, r3, #1
	adds r0, #0xe6
	ldrb r0, [r0]
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	movs r5, #1
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0xe7
	ldrb r3, [r0]
	lsrs r0, r3, #1
	adds r4, r2, #0
	cmp r0, #0xf
	bls _0801CB1E
	adds r0, r5, #0
	ands r0, r3
	cmp r0, #0
	beq _0801CAFC
	adds r1, #0xea
	ldrh r0, [r1]
	adds r0, #1
	b _0801CB02
	.align 2, 0
_0801CAF8: .4byte 0x0202292C
_0801CAFC:
	adds r1, #0xea
	ldrh r0, [r1]
	subs r0, #1
_0801CB02:
	strh r0, [r1]
	ldr r1, [r4]
	adds r1, #0xe6
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, #0xe7
	ldrb r2, [r1]
	movs r0, #1
	ands r0, r2
	strb r0, [r1]
_0801CB1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0801CA6C

