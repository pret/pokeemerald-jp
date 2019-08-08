.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08020918
sub_08020918: @ 0x08020918
	ldr r0, _08020920
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08020920: .4byte 0x02022944
	thumb_func_end sub_08020918

	thumb_func_start sub_08020924
sub_08020924: @ 0x08020924
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08020934
	ldr r0, [r5]
	cmp r0, #0
	bne _08020938
	movs r0, #2
	b _08020974
	.align 2, 0
_08020934: .4byte 0x02022944
_08020938:
	cmp r4, #0
	bne _0802093E
	ldr r4, [r0]
_0802093E:
	ldrb r0, [r0, #0xa]
	bl DestroyTask
	ldr r0, [r5]
	bl Free
	movs r0, #0
	str r0, [r5]
	adds r0, r4, #0
	bl SetMainCallback2
	ldr r0, _0802097C
	cmp r4, r0
	bne _08020972
	ldr r2, _08020980
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xc8
	lsls r0, r0, #1
	bl PlayNewMapMusic
	ldr r0, _08020984
	bl SetMainCallback1
_08020972:
	movs r0, #0
_08020974:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802097C: .4byte 0x08085A31
_08020980: .4byte 0x030030B4
_08020984: .4byte 0x0808576D
	thumb_func_end sub_08020924

	thumb_func_start sub_08020988
sub_08020988: @ 0x08020988
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r0, _080209B8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080209A6
	ldr r0, _080209BC
	ldrb r0, [r0]
	cmp r0, #0
	bne _080209C4
_080209A6:
	adds r0, r4, #0
	bl SetMainCallback2
	ldr r0, _080209C0
	mov r1, r8
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	b _08020A10
	.align 2, 0
_080209B8: .4byte 0x030031C4
_080209BC: .4byte 0x0300319C
_080209C0: .4byte 0x030050A0
_080209C4:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r0, r8
	cmp r0, #1
	bls _080209E0
	cmp r7, r8
	blo _080209F4
_080209E0:
	adds r0, r4, #0
	bl SetMainCallback2
	ldr r0, _080209F0
	movs r1, #0
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	b _08020A10
	.align 2, 0
_080209F0: .4byte 0x030050A0
_080209F4:
	ldr r6, _08020A1C
	ldr r0, _08020A20
	bl AllocZeroed
	adds r5, r0, #0
	str r5, [r6]
	cmp r5, #0
	bne _08020A28
	adds r0, r4, #0
	bl SetMainCallback2
	ldr r0, _08020A24
	strh r5, [r0, #0x10]
	strh r5, [r0, #0x12]
_08020A10:
	adds r0, #0xee
	ldrb r1, [r0]
	movs r1, #1
	strb r1, [r0]
	b _08020A8C
	.align 2, 0
_08020A1C: .4byte 0x02022944
_08020A20: .4byte 0x000041AC
_08020A24: .4byte 0x030050A0
_08020A28:
	str r4, [r5]
	movs r4, #0
	strb r7, [r5, #8]
	ldr r0, [r6]
	mov r1, r8
	strb r1, [r0, #9]
	ldr r0, [r6]
	bl sub_08020CE0
	ldr r1, [r6]
	movs r2, #1
	movs r0, #1
	strh r0, [r1, #0x12]
	strb r2, [r1, #0xe]
	ldr r1, [r6]
	movs r0, #6
	strb r0, [r1, #0xf]
	ldr r0, [r6]
	adds r0, #0x36
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0x10
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl sub_080243D0
	ldr r2, [r6]
	adds r2, #0x36
	movs r0, #4
	movs r1, #1
	bl sub_08022950
	ldr r0, _08020A98
	bl SetMainCallback2
	ldr r0, _08020A9C
	movs r1, #8
	bl CreateTask
	ldr r1, [r6]
	strb r0, [r1, #0xa]
	ldr r2, _08020AA0
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_08020A8C:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020A98: .4byte 0x08020CA5
_08020A9C: .4byte 0x08020CBD
_08020AA0: .4byte 0x030030B4
	thumb_func_end sub_08020988

	thumb_func_start sub_08020AA4
sub_08020AA4: @ 0x08020AA4
	push {r4, lr}
	sub sp, #0xc
	ldr r1, _08020ABC
	ldrh r0, [r1]
	subs r0, #0x85
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x2b
	bls _08020AC0
	movs r0, #0x85
	strh r0, [r1]
	b _08020AC8
	.align 2, 0
_08020ABC: .4byte 0x0203CB48
_08020AC0:
	ldrh r0, [r1]
	movs r1, #1
	bl RemoveBagItem
_08020AC8:
	ldr r4, _08020B28
	ldr r2, [r4]
	ldrb r1, [r2, #8]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	ldr r1, _08020B2C
	ldrh r1, [r1]
	subs r1, #0x85
	adds r0, #0xa0
	movs r3, #0
	strh r1, [r0]
	movs r0, #1
	strb r0, [r2, #0xe]
	ldr r1, [r4]
	movs r0, #9
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	adds r0, #0x36
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0x10
	str r1, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r1, #0
	bl sub_080243D0
	ldr r2, [r4]
	adds r2, #0x36
	movs r0, #4
	movs r1, #1
	bl sub_08022950
	ldr r0, _08020B30
	movs r1, #8
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, #0xa]
	ldr r0, _08020B34
	bl SetMainCallback2
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020B28: .4byte 0x02022944
_08020B2C: .4byte 0x0203CB48
_08020B30: .4byte 0x08020CBD
_08020B34: .4byte 0x08020CA5
	thumb_func_end sub_08020AA4

	thumb_func_start sub_08020B38
sub_08020B38: @ 0x08020B38
	push {lr}
	ldr r0, _08020B50
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	bl DestroyTask
	ldr r0, _08020B54
	bl sub_081AA968
	pop {r0}
	bx r0
	.align 2, 0
_08020B50: .4byte 0x02022944
_08020B54: .4byte 0x08020AA5
	thumb_func_end sub_08020B38

	thumb_func_start sub_08020B58
sub_08020B58: @ 0x08020B58
	push {lr}
	ldr r0, _08020B64
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_08020B64: .4byte 0x08020C91
	thumb_func_end sub_08020B58

	thumb_func_start sub_08020B68
sub_08020B68: @ 0x08020B68
	push {lr}
	movs r0, #0
	bl SetVBlankCallback
	pop {r0}
	bx r0
	thumb_func_end sub_08020B68

	thumb_func_start sub_08020B74
sub_08020B74: @ 0x08020B74
	push {r4, r5, r6, lr}
	ldr r4, _08020BB8
	ldr r0, [r4]
	adds r0, #0x6c
	ldrh r2, [r0]
	lsls r2, r2, #8
	movs r1, #0xf0
	lsls r1, r1, #6
	adds r0, r2, #0
	bl sub_081515D8
	adds r2, r0, #0
	ldr r0, [r4]
	adds r0, #0x72
	ldrh r3, [r0]
	lsls r3, r3, #8
	adds r0, r3, #0
	adds r1, r2, #0
	bl sub_081515D8
	adds r3, r0, #0
	ldr r0, _08020BBC
	ands r3, r0
	ldr r2, [r4]
	strh r3, [r2, #0x16]
	ldrb r0, [r2, #9]
	cmp r0, #3
	beq _08020BF8
	cmp r0, #3
	bgt _08020BC0
	cmp r0, #2
	beq _08020BCA
	b _08020C64
	.align 2, 0
_08020BB8: .4byte 0x02022944
_08020BBC: .4byte 0x0000FFFF
_08020BC0:
	cmp r0, #4
	beq _08020C08
	cmp r0, #5
	beq _08020C3C
	b _08020C64
_08020BCA:
	ldr r5, _08020BF4
	ldr r1, [r5]
	movs r0, #0xf6
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bls _08020C64
	adds r2, #0x25
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, [r4]
	ldrh r1, [r1, #0x16]
	movs r2, #0xf6
	lsls r2, r2, #1
	b _08020C30
	.align 2, 0
_08020BF4: .4byte 0x03005AF0
_08020BF8:
	ldr r5, _08020C04
	ldr r0, [r5]
	movs r6, #0xf7
	lsls r6, r6, #1
	b _08020C44
	.align 2, 0
_08020C04: .4byte 0x03005AF0
_08020C08:
	ldr r5, _08020C38
	ldr r1, [r5]
	movs r0, #0xf8
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bls _08020C64
	adds r2, #0x25
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r1, [r4]
	ldrh r1, [r1, #0x16]
	movs r2, #0xf8
	lsls r2, r2, #1
_08020C30:
	adds r0, r0, r2
	strh r1, [r0]
	b _08020C64
	.align 2, 0
_08020C38: .4byte 0x03005AF0
_08020C3C:
	ldr r5, _08020C88
	ldr r0, [r5]
	movs r6, #0xf9
	lsls r6, r6, #1
_08020C44:
	adds r1, r0, r6
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bls _08020C64
	adds r2, #0x25
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r5]
	ldr r0, [r4]
	ldrh r0, [r0, #0x16]
	adds r1, r1, r6
	strh r0, [r1]
_08020C64:
	ldr r4, _08020C8C
	ldr r1, [r4]
	ldr r0, [r1, #0x68]
	str r0, [r1, #0x1c]
	bl GiveBerryPowder
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08020C82
	ldr r0, [r4]
	adds r0, #0x25
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
_08020C82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020C88: .4byte 0x03005AF0
_08020C8C: .4byte 0x02022944
	thumb_func_end sub_08020B74

	thumb_func_start sub_08020C90
sub_08020C90: @ 0x08020C90
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08020C90

	thumb_func_start sub_08020CA4
sub_08020CA4: @ 0x08020CA4
	push {lr}
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08020CA4

	thumb_func_start sub_08020CBC
sub_08020CBC: @ 0x08020CBC
	push {r4, lr}
	ldr r4, _08020CDC
	ldr r0, [r4]
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _08020CD0
	adds r1, r0, #0
	adds r1, #0x36
	bl _call_via_r2
_08020CD0:
	ldr r0, [r4]
	bl sub_0802117C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020CDC: .4byte 0x02022944
	thumb_func_end sub_08020CBC

	thumb_func_start sub_08020CE0
sub_08020CE0: @ 0x08020CE0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	b _08020D0A
_08020CE8:
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r4, r1, r6
	adds r0, r4, #0
	adds r0, #0x98
	ldr r2, _08020D54
	adds r1, r1, r2
	movs r2, #7
	bl memcpy
	adds r4, #0x9f
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08020D0A:
	ldrb r0, [r6, #9]
	cmp r5, r0
	blo _08020CE8
	cmp r5, #4
	bhi _08020D3A
_08020D14:
	lsls r4, r5, #3
	subs r4, r4, r5
	lsls r4, r4, #2
	adds r0, r4, #0
	adds r0, #0x98
	adds r0, r6, r0
	movs r1, #1
	movs r2, #7
	bl memset
	adds r4, r6, r4
	adds r4, #0x9f
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08020D14
_08020D3A:
	ldr r0, _08020D58
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #1
	beq _08020D66
	cmp r0, #1
	bgt _08020D5C
	cmp r0, #0
	beq _08020D62
	b _08020D6E
	.align 2, 0
_08020D54: .4byte 0x020226A8
_08020D58: .4byte 0x03005AF0
_08020D5C:
	cmp r0, #2
	beq _08020D6A
	b _08020D6E
_08020D62:
	movs r0, #8
	b _08020D6C
_08020D66:
	movs r0, #4
	b _08020D6C
_08020D6A:
	movs r0, #1
_08020D6C:
	strb r0, [r6, #0xb]
_08020D6E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08020CE0

	thumb_func_start sub_08020D74
sub_08020D74: @ 0x08020D74
	push {r4, r5, lr}
	sub sp, #0xc
	bl sub_08020918
	adds r5, r0, #0
	cmp r5, #0
	bne _08020D88
	movs r0, #1
	rsbs r0, r0, #0
	b _08021030
_08020D88:
	ldrb r0, [r5, #0xc]
	cmp r0, #9
	bls _08020D90
	b _08021028
_08020D90:
	lsls r0, r0, #2
	ldr r1, _08020D9C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08020D9C: .4byte 0x08020DA0
_08020DA0: @ jump table
	.4byte _08020DC8 @ case 0
	.4byte _08020DE6 @ case 1
	.4byte _08020E0C @ case 2
	.4byte _08020E1A @ case 3
	.4byte _08020EA4 @ case 4
	.4byte _08020EEA @ case 5
	.4byte _08020F18 @ case 6
	.4byte _08020F48 @ case 7
	.4byte _08020FA4 @ case 8
	.4byte _08020FE0 @ case 9
_08020DC8:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	bl ScanlineEffect_Stop
	bl reset_temp_tile_data_buffers
	b _08021028
_08020DE6:
	add r0, sp, #8
	movs r4, #0
	strh r4, [r0]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ldr r2, _08020E04
	bl CpuSet
	ldr r0, _08020E08
	strb r4, [r0]
	movs r0, #3
	bl sub_08034AAC
	b _08021028
	.align 2, 0
_08020E04: .4byte 0x01000200
_08020E08: .4byte 0x030030BC
_08020E0C:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _08021028
_08020E1A:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08020E98
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r0, #0xd6
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r0, _08020E9C
	adds r1, r5, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r0, _08020EA0
	adds r1, r5, r0
	movs r0, #3
	bl SetBgTilemapBuffer
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	b _08021028
	.align 2, 0
_08020E98: .4byte 0x082C5EE0
_08020E9C: .4byte 0x000021AC
_08020EA0: .4byte 0x000031AC
_08020EA4:
	movs r4, #0x20
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	b _08021028
_08020EEA:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	ldr r1, _08020F14
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _08021028
	.align 2, 0
_08020F14: .4byte 0x082C6104
_08020F18:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08020F24
	b _0802102E
_08020F24:
	bl InitStandardTextBoxWindows
	bl sub_08196DF4
	adds r0, r5, #0
	bl sub_080222E8
	adds r0, r5, #0
	bl sub_08022360
	ldr r0, _08020F44
	ldrb r1, [r0, #8]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0, #8]
	b _08021028
	.align 2, 0
_08020F44: .4byte 0x02037C74
_08020F48:
	ldr r0, _08020F94
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r1, #0
	bl LoadPalette
	ldr r1, _08020F98
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _08020F9C
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _08020FA0
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	adds r0, r5, #0
	bl sub_08022434
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _08021028
	.align 2, 0
_08020F94: .4byte 0x082C5F84
_08020F98: .4byte 0x082C74D4
_08020F9C: .4byte 0x082C7604
_08020FA0: .4byte 0x082C779C
_08020FA4:
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	adds r0, r5, #0
	bl sub_08022494
	ldr r0, _08020FDC
	ldrh r1, [r0]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x16
	bl SetGpuReg
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	b _08021028
	.align 2, 0
_08020FDC: .4byte 0x02021B3A
_08020FE0:
	ldr r2, _08021024
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuRegBits
	bl sub_08020B58
	movs r0, #0
	strb r0, [r5, #0xc]
	movs r0, #1
	b _08021030
	.align 2, 0
_08021024: .4byte 0x02037C74
_08021028:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
_0802102E:
	movs r0, #0
_08021030:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08020D74

	thumb_func_start sub_08021038
sub_08021038: @ 0x08021038
	push {r4, r5, lr}
	sub sp, #8
	bl sub_08020918
	adds r5, r0, #0
	cmp r5, #0
	bne _0802104C
	movs r0, #1
	rsbs r0, r0, #0
	b _08021172
_0802104C:
	ldrb r0, [r5, #0xc]
	cmp r0, #7
	bls _08021054
	b _0802116A
_08021054:
	lsls r0, r0, #2
	ldr r1, _08021060
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021060: .4byte 0x08021064
_08021064: @ jump table
	.4byte _08021084 @ case 0
	.4byte _0802108A @ case 1
	.4byte _08021094 @ case 2
	.4byte _080210AA @ case 3
	.4byte _080210B6 @ case 4
	.4byte _08021112 @ case 5
	.4byte _08021152 @ case 6
	.4byte _08021162 @ case 7
_08021084:
	bl sub_0800FF34
	b _0802116A
_0802108A:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08021170
_08021094:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _0802116A
_080210AA:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802116A
	b _08021170
_080210B6:
	movs r4, #0x20
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
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
	b _0802116A
_08021112:
	bl FreeAllWindowBuffers
	movs r0, #0
	bl HideBg
	movs r0, #0
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl HideBg
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #2
	bl HideBg
	movs r0, #2
	bl UnsetBgTilemapBuffer
	movs r0, #3
	bl HideBg
	movs r0, #3
	bl UnsetBgTilemapBuffer
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl ClearGpuRegBits
	b _0802116A
_08021152:
	bl DestroyWirelessStatusIndicatorSprite
	adds r0, r5, #0
	bl sub_080226C4
	bl sub_08034B20
	b _0802116A
_08021162:
	movs r0, #0
	strb r0, [r5, #0xc]
	movs r0, #1
	b _08021172
_0802116A:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
_08021170:
	movs r0, #0
_08021172:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08021038

	thumb_func_start sub_0802117C
sub_0802117C: @ 0x0802117C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080211B0
	ldrh r1, [r4, #0x2c]
	ldrh r2, [r4, #0x2a]
	adds r1, r1, r2
	strh r1, [r0]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x16
	bl SetGpuReg
	ldrh r0, [r4, #0x12]
	cmp r0, #7
	bne _080211A8
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r1, [r4, #0x28]
	bl sub_08022284
_080211A8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080211B0: .4byte 0x02021B3A
	thumb_func_end sub_0802117C

	thumb_func_start sub_080211B4
sub_080211B4: @ 0x080211B4
	movs r1, #0
	ldr r2, _080211C8
	strh r2, [r0, #0x2a]
	strh r1, [r0, #0x2c]
	ldr r0, _080211CC
	strh r1, [r0]
	ldr r0, _080211D0
	strh r2, [r0]
	bx lr
	.align 2, 0
_080211C8: .4byte 0x0000FF98
_080211CC: .4byte 0x02021B38
_080211D0: .4byte 0x02021B3A
	thumb_func_end sub_080211B4

	thumb_func_start sub_080211D4
sub_080211D4: @ 0x080211D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	str r1, [sp]
	movs r0, #0
	mov sb, r0
	mov r1, sl
	ldrb r1, [r1, #9]
	cmp sb, r1
	blo _080211F2
	b _08021314
_080211F2:
	ldr r1, _08021324
	mov r2, sb
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	mov r1, sb
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	adds r0, #0xa0
	ldrh r3, [r0]
	adds r3, #0x85
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r0, _08021328
	adds r1, r2, #0
	bl AddCustomItemIconSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, sb
	lsls r3, r2, #2
	ldr r1, [sp]
	adds r1, #0x38
	adds r6, r1, r3
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0802132C
	adds r1, r1, r0
	str r1, [r6]
	ldrb r0, [r1, #5]
	movs r2, #0xc
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r2, [r6]
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r6]
	ldr r0, [sp]
	adds r0, #0xc
	adds r0, r0, r3
	mov r8, r0
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	adds r0, #0x78
	strh r0, [r1, #0x20]
	ldr r1, [r6]
	ldr r0, _08021330
	strh r0, [r1, #0x22]
	ldr r3, [r6]
	adds r5, r3, #0
	adds r5, #0x2e
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #2]
	movs r0, #0x20
	strh r0, [r5, #4]
	movs r0, #0x70
	strh r0, [r5, #0xe]
	mov r2, r8
	ldr r1, [r2]
	ldrh r0, [r1, #0xa]
	ldrh r1, [r1, #8]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	cmp r1, #0
	bge _08021288
	adds r0, r1, #3
_08021288:
	asrs r0, r0, #2
	strh r0, [r5, #0xc]
	lsls r0, r1, #0x17
	lsrs r7, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	adds r2, #0x20
	lsrs r2, r2, #1
	movs r0, #7
	movs r1, #0xfe
	lsls r1, r1, #6
	str r3, [sp, #4]
	bl sub_081515B0
	adds r4, r0, #0
	ldr r0, [r6]
	ldrh r0, [r0, #0x20]
	lsls r0, r0, #7
	ldr r3, [sp, #4]
	strh r0, [r3, #0x2e]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #7
	adds r2, r4, #0
	bl sub_081515B0
	strh r0, [r5, #6]
	movs r0, #7
	adds r1, r4, #0
	movs r2, #0x55
	bl sub_0815152C
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r5, #8]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #7
	movs r1, #0xfe
	lsls r1, r1, #6
	bl sub_081515B0
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #0xe]
	ldr r2, _08021334
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0xe]
	mov r1, r8
	ldr r0, [r1]
	movs r2, #8
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _08021300
	ldr r0, [r6]
	movs r1, #1
	bl StartSpriteAffineAnim
_08021300:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r0, sl
	ldrb r0, [r0, #9]
	cmp sb, r0
	bhs _08021314
	b _080211F2
_08021314:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021324: .4byte 0x082C7A74
_08021328: .4byte 0x082C7BF8
_0802132C: .4byte 0x020205AC
_08021330: .4byte 0x0000FFF0
_08021334: .4byte 0xFFFF8000
	thumb_func_end sub_080211D4

	thumb_func_start sub_08021338
sub_08021338: @ 0x08021338
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x2e
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r5, #0x26]
	adds r0, r0, r2
	strh r0, [r5, #0x26]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	movs r6, #0x80
	lsls r6, r6, #8
	ands r0, r6
	cmp r0, #0
	beq _0802139E
	ldrh r0, [r4, #6]
	ldrh r2, [r5, #0x2e]
	adds r0, r0, r2
	strh r0, [r5, #0x2e]
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r5, #0x24]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	ands r0, r6
	cmp r0, #0
	beq _0802139E
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	cmp r0, #0x7e
	ble _0802139E
	movs r0, #0
	strh r0, [r5, #0x24]
	ldrh r1, [r4, #0xe]
	ldr r0, _080213D0
	ands r0, r1
	strh r0, [r4, #0xe]
_0802139E:
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	strh r0, [r5, #0x20]
	movs r2, #0x22
	ldrsh r1, [r5, r2]
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	ldrh r2, [r4, #0xe]
	ldr r0, _080213D0
	ands r0, r2
	cmp r1, r0
	blt _080213CA
	ldr r0, _080213D4
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl FreeSpriteOamMatrix
	adds r0, r5, #0
	bl DestroySprite
_080213CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080213D0: .4byte 0x00007FFF
_080213D4: .4byte 0x08007141
	thumb_func_end sub_08021338

	thumb_func_start sub_080213D8
sub_080213D8: @ 0x080213D8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	ldrb r0, [r6, #9]
	cmp r5, r0
	bhs _08021404
	ldr r7, _0802140C
_080213E6:
	lsls r0, r5, #1
	adds r0, r0, r7
	ldrh r4, [r0]
	adds r0, r4, #0
	bl FreeSpritePaletteByTag
	adds r0, r4, #0
	bl FreeSpriteTilesByTag
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r6, #9]
	cmp r5, r0
	blo _080213E6
_08021404:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802140C: .4byte 0x082C7A74
	thumb_func_end sub_080213D8

	thumb_func_start sub_08021410
sub_08021410: @ 0x08021410
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0x4e
	adds r1, r1, r6
	mov sl, r1
	mov sb, r0
	ldrb r2, [r6, #9]
	cmp r0, r2
	bhs _080214DE
	ldr r7, _08021474
_08021434:
	mov r3, sl
	ldrh r0, [r3, #0xa]
	mov r4, sb
	lsls r1, r4, #1
	add r1, sb
	asrs r0, r1
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	lsrs r1, r1, #0x10
	mov r8, r1
	cmp r1, #0
	beq _080214CE
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08021478
	lsls r4, r4, #2
	ldr r5, [sp]
	adds r5, #0x24
	adds r0, r5, r4
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAnim
	b _0802148A
	.align 2, 0
_08021474: .4byte 0x082C7A58
_08021478:
	mov r0, sb
	lsls r4, r0, #2
	ldr r5, [sp]
	adds r5, #0x24
	adds r0, r5, r4
	ldr r0, [r0]
	movs r1, #0
	bl StartSpriteAnim
_0802148A:
	adds r3, r5, r4
	ldr r2, [r3]
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r4, #5
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, #0x2c
	ldrb r0, [r2]
	subs r4, #0x3c
	adds r1, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	movs r0, #3
	mov r1, r8
	ands r1, r0
	mov r8, r1
	subs r1, #1
	lsls r1, r1, #1
	adds r0, r1, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #0x24]
	ldr r2, [r3]
	ldr r3, _080214EC
	adds r1, r1, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	strh r0, [r2, #0x26]
_080214CE:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldrb r4, [r6, #9]
	cmp sb, r4
	blo _08021434
_080214DE:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _080214F0
	adds r2, r6, #0
	adds r2, #0x25
	ldrb r1, [r2]
	b _080215CC
	.align 2, 0
_080214EC: .4byte 0x082C7A59
_080214F0:
	ldrh r0, [r6, #0x28]
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r1, r8
	str r1, [sp, #8]
	movs r2, #0
	mov sb, r2
	mov r3, sl
	ldrh r1, [r3, #0xc]
	lsls r0, r1, #1
	adds r0, #3
	adds r6, #0x25
	str r6, [sp, #0xc]
	adds r3, r1, #0
	cmp sb, r0
	bge _080215C0
_08021518:
	mov r4, sb
	lsls r1, r4, #2
	ldr r0, [sp]
	adds r0, #0x4c
	adds r7, r0, r1
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080215AE
	ldr r0, _08021584
	str r0, [r2, #0x1c]
	lsls r1, r4, #1
	ldr r3, _08021588
	adds r0, r1, r3
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r0, r4, #0
	adds r0, #0x78
	strh r0, [r2, #0x20]
	ldr r2, [r7]
	ldr r0, _0802158C
	adds r1, r1, r0
	movs r6, #0
	ldrsb r6, [r1, r6]
	mov r1, r8
	lsls r0, r1, #2
	subs r0, #0x88
	subs r0, r6, r0
	strh r0, [r2, #0x22]
	ldr r5, [r7]
	ldr r2, [sp, #8]
	lsls r1, r2, #2
	adds r0, r4, #0
	bl __divsi3
	adds r4, r4, r0
	strh r4, [r5, #0x24]
	ldr r0, [r7]
	strh r6, [r0, #0x26]
	mov r3, sl
	ldrb r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08021590
	ldr r0, [r7]
	movs r1, #1
	bl StartSpriteAnim
	b _08021598
	.align 2, 0
_08021584: .4byte 0x0802288D
_08021588: .4byte 0x082C7A5E
_0802158C: .4byte 0x082C7A5F
_08021590:
	ldr r0, [r7]
	movs r1, #0
	bl StartSpriteAnim
_08021598:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r4, sl
	ldrh r3, [r4, #0xc]
	cmp r0, #3
	bls _080215AE
	movs r0, #0
	mov r8, r0
_080215AE:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r0, r3, #1
	adds r0, #3
	cmp sb, r0
	blt _08021518
_080215C0:
	ldr r2, [sp, #0xc]
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080215D6
_080215CC:
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _080215F4
_080215D6:
	ldr r3, [sp, #4]
	cmp r3, #1
	bne _080215E4
	movs r0, #0x4e
	bl PlaySE
	b _080215EA
_080215E4:
	movs r0, #0x4d
	bl PlaySE
_080215EA:
	ldr r4, [sp, #0xc]
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_080215F4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08021410

	thumb_func_start sub_08021604
sub_08021604: @ 0x08021604
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r2, #0
	ldrb r0, [r5, #9]
	cmp r2, r0
	bhs _08021636
	adds r4, r6, #0
	adds r4, #0x24
	movs r7, #4
	adds r3, r0, #0
_0802161A:
	lsls r0, r2, #2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, #0x3e
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08021650
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r3
	blo _0802161A
_08021636:
	movs r2, #0
	adds r3, r6, #0
	adds r3, #0x4c
	movs r4, #4
_0802163E:
	lsls r0, r2, #2
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, #0x3e
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08021654
_08021650:
	movs r0, #0
	b _0802166C
_08021654:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xa
	bls _0802163E
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0802166A
	movs r0, #0
	strh r0, [r5, #0x2c]
_0802166A:
	movs r0, #1
_0802166C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08021604

	thumb_func_start sub_08021674
sub_08021674: @ 0x08021674
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0
	movs r5, #0xe1
	lsls r5, r5, #4
	adds r0, r4, #0
	adds r1, r5, #0
	bl __udivsi3
	strh r0, [r6, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x3c
	bl __udivsi3
	strh r0, [r6, #6]
	adds r0, r4, #0
	movs r1, #0x3c
	bl __umodsi3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	movs r1, #4
	bl sub_08151510
	adds r2, r7, #0
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	movs r0, #7
	mov ip, r0
	ldr r5, _080216F0
	movs r4, #1
_080216C0:
	mov r0, ip
	subs r1, r0, r2
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _080216D6
	lsls r0, r2, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r7, r7, r0
_080216D6:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _080216C0
	ldr r1, _080216F4
	adds r0, r7, #0
	bl __udivsi3
	strh r0, [r6, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080216F0: .4byte 0x082C5F64
_080216F4: .4byte 0x000F4240
	thumb_func_end sub_08021674

	thumb_func_start sub_080216F8
sub_080216F8: @ 0x080216F8
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
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #1
	mov r1, r8
	bl GetStringWidth
	lsls r4, r4, #2
	lsrs r0, r0, #1
	subs r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r5, #1
	adds r0, r0, r5
	ldr r1, _08021754
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized3
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021754: .4byte 0x082C5EF0
	thumb_func_end sub_080216F8

	thumb_func_start sub_08021758
sub_08021758: @ 0x08021758
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	str r0, [sp, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x10]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x18]
	movs r7, #0
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r1, #0
	str r1, [sp, #0x20]
	ldr r2, [sp, #0xc]
	adds r2, #0x68
	str r2, [sp, #0x24]
	ldr r4, [sp, #0xc]
	ldrb r4, [r4, #9]
	cmp r7, r4
	blo _08021792
	b _08021A9A
_08021792:
	ldr r0, [sp, #0x10]
	lsls r0, r0, #2
	str r0, [sp, #0x28]
	movs r2, #0xd3
	lsls r2, r2, #1
	ldr r1, [sp, #0xc]
	adds r2, r1, r2
	str r2, [sp, #0x2c]
_080217A2:
	bl DynamicPlaceholderTextUtil_Reset
	ldr r4, [sp, #0x10]
	cmp r4, #1
	beq _0802188C
	cmp r4, #1
	bgt _080217B6
	cmp r4, #0
	beq _080217CE
	b _080217BE
_080217B6:
	ldr r4, [sp, #0x10]
	cmp r4, #2
	bne _080217BE
	b _08021990
_080217BE:
	ldr r0, [sp, #0x20]
	adds r0, #0xa2
	mov r8, r0
	ldr r1, [sp, #0x1c]
	lsls r5, r1, #3
	adds r2, r7, #1
	mov sb, r2
	b _08021A0A
_080217CE:
	ldr r0, [sp, #0x24]
	adds r0, #0x20
	adds r0, r0, r7
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r3, r7, #1
	ldr r2, [sp, #0x24]
	adds r2, #0xc
	cmp r7, #0
	beq _080217F4
	adds r0, r2, r3
	subs r1, r7, #1
	lsls r1, r1, #1
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _080217F4
	str r7, [sp, #0x20]
_080217F4:
	ldr r4, [sp, #0x28]
	ldr r1, [sp, #0x10]
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r3, r0
	adds r0, r2, r0
	ldrh r1, [r0]
	ldr r0, _08021880
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r0, _08021884
	adds r0, r4, r0
	ldr r5, [r0]
	movs r0, #1
	adds r1, r5, #0
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	ldr r2, [sp, #0x14]
	subs r0, r2, r0
	subs r0, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, [sp, #0x2c]
	ldrb r0, [r4]
	movs r1, #0xd
	adds r4, r7, #0
	muls r4, r1, r4
	ldr r1, [sp, #0x18]
	adds r4, r1, r4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r2, _08021888
	str r2, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	adds r3, r4, #0
	bl AddTextPrinterParameterized3
	ldr r2, [sp, #0x2c]
	ldrb r0, [r2]
	adds r2, r6, #0
	subs r2, #0x21
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _08021888
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r1, _08021880
	str r1, [sp, #8]
	movs r1, #0
	adds r3, r4, #0
	bl AddTextPrinterParameterized3
	ldr r2, [sp, #0x20]
	adds r2, #0xa2
	mov r8, r2
	ldr r4, [sp, #0x1c]
	lsls r5, r4, #3
	adds r0, r7, #1
	mov sb, r0
	b _08021A0A
	.align 2, 0
_08021880: .4byte 0x02021C40
_08021884: .4byte 0x082C7C40
_08021888: .4byte 0x082C5EF0
_0802188C:
	ldr r1, [sp, #0x24]
	adds r0, r1, r7
	adds r0, #0x28
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r3, r7, #1
	adds r2, r1, #0
	adds r2, #0xc
	cmp r7, #0
	beq _080218B6
	adds r0, r3, #0
	adds r0, #0xa
	adds r0, r2, r0
	adds r1, r3, #0
	adds r1, #8
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	beq _080218B6
	str r7, [sp, #0x20]
_080218B6:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x10]
	adds r4, r0, r1
	lsls r4, r4, #1
	adds r4, r3, r4
	adds r4, r2, r4
	ldrh r1, [r4]
	lsrs r1, r1, #4
	ldr r0, _08021974
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r3, #0
	ldrb r0, [r4]
	movs r6, #0xf
	ands r6, r0
	movs r2, #0
	ldr r4, [sp, #0x10]
	lsls r4, r4, #2
	str r4, [sp, #0x34]
	ldr r0, [sp, #0x14]
	subs r0, #0x34
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x20]
	adds r1, #0xa2
	mov r8, r1
	ldr r4, [sp, #0x1c]
	lsls r5, r4, #3
	adds r0, r7, #1
	mov sb, r0
	movs r1, #3
	mov sl, r1
	movs r4, #1
	mov ip, r4
	ldr r4, _08021978
_080218FE:
	mov r0, sl
	subs r1, r0, r2
	adds r0, r6, #0
	asrs r0, r1
	mov r1, ip
	ands r0, r1
	cmp r0, #0
	beq _08021916
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r3, r3, r0
_08021916:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080218FE
	adds r0, r3, #0
	ldr r1, _0802197C
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08021980
	adds r1, r6, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _08021984
	ldr r2, [sp, #0x34]
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _08021988
	bl StringExpandPlaceholders
	ldr r4, [sp, #0x2c]
	ldrb r0, [r4]
	ldr r1, [sp, #0x30]
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0xd
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r4, [sp, #0x18]
	adds r3, r4, r3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _0802198C
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, _08021988
	str r1, [sp, #8]
	movs r1, #0
	bl AddTextPrinterParameterized3
	b _08021A0A
	.align 2, 0
_08021974: .4byte 0x02021C40
_08021978: .4byte 0x082C5F64
_0802197C: .4byte 0x000F4240
_08021980: .4byte 0x02021C54
_08021984: .4byte 0x082C7C40
_08021988: .4byte 0x02021C7C
_0802198C: .4byte 0x082C5EF0
_08021990:
	str r7, [sp, #0x1c]
	str r7, [sp, #0x20]
	lsls r4, r7, #3
	subs r0, r4, r7
	lsls r0, r0, #2
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	adds r0, #0xa0
	ldrb r2, [r0]
	cmp r2, #0x2b
	bls _080219A8
	movs r2, #0
_080219A8:
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r0, _08021A20
	adds r1, r1, r0
	ldr r0, _08021A24
	bl StringCopy
	ldr r0, _08021A28
	ldr r1, [r0, #8]
	ldr r0, _08021A2C
	bl StringExpandPlaceholders
	movs r0, #1
	ldr r1, _08021A2C
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	adds r2, r0, #0
	ldr r0, [sp, #0x14]
	subs r2, r0, r2
	subs r2, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, [sp, #0x2c]
	ldrb r0, [r1]
	movs r1, #0xd
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r1, [sp, #0x18]
	adds r3, r1, r3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _08021A30
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r1, _08021A2C
	str r1, [sp, #8]
	movs r1, #1
	bl AddTextPrinterParameterized3
	movs r2, #0xa2
	adds r2, r2, r7
	mov r8, r2
	adds r5, r4, #0
	adds r4, r7, #1
	mov sb, r4
_08021A0A:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, #8]
	cmp r1, r0
	bne _08021A3C
	ldr r0, _08021A34
	ldr r1, _08021A38
	bl StringCopy
	b _08021A44
	.align 2, 0
_08021A20: .4byte 0x08563150
_08021A24: .4byte 0x02021C40
_08021A28: .4byte 0x082C7C40
_08021A2C: .4byte 0x02021C7C
_08021A30: .4byte 0x082C5EF0
_08021A34: .4byte 0x02021C68
_08021A38: .4byte 0x085CC9C8
_08021A3C:
	ldr r0, _08021AAC
	ldr r1, _08021AB0
	bl StringCopy
_08021A44:
	ldr r4, _08021AAC
	mov r1, r8
	strb r1, [r4]
	ldr r2, [sp, #0x1c]
	subs r1, r5, r2
	lsls r1, r1, #2
	adds r1, #0x98
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	movs r0, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, _08021AB4
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r1, [sp, #0x2c]
	ldrb r0, [r1]
	movs r1, #0xd
	adds r3, r7, #0
	muls r3, r1, r3
	ldr r2, [sp, #0x18]
	adds r3, r2, r3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r4, _08021AB8
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r2, _08021AB4
	str r2, [sp, #8]
	movs r1, #1
	movs r2, #4
	bl AddTextPrinterParameterized3
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, #9]
	cmp r7, r0
	bhs _08021A9A
	b _080217A2
_08021A9A:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021AAC: .4byte 0x02021C68
_08021AB0: .4byte 0x085CC9D4
_08021AB4: .4byte 0x02021C7C
_08021AB8: .4byte 0x082C5EF0
	thumb_func_end sub_08021758

	thumb_func_start sub_08021ABC
sub_08021ABC: @ 0x08021ABC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	movs r0, #0
	mov sl, r0
	movs r6, #0
	movs r1, #0
	str r1, [sp, #0xc]
	mov r2, r8
	adds r2, #0x68
	str r2, [sp, #0x10]
	movs r4, #0xd3
	lsls r4, r4, #1
	add r4, r8
	mov sb, r4
	ldrb r0, [r4]
	movs r1, #4
	bl GetWindowAttribute
	lsls r0, r0, #0x1b
	movs r1, #0xda
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	movs r0, #0x92
	lsls r0, r0, #1
	add r0, r8
	ldr r2, [sp, #0x10]
	ldrh r1, [r2, #4]
	bl sub_08021674
	ldrb r0, [r4]
	ldr r4, _08021CF4
	str r4, [sp]
	str r6, [sp, #4]
	ldr r1, _08021CF8
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #2
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	ldr r4, _08021CFC
	movs r0, #1
	adds r1, r4, #0
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	movs r1, #0xae
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r2, sb
	ldrb r0, [r2]
	ldr r1, _08021CF4
	str r1, [sp]
	mov r2, sl
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	adds r0, r6, #0
	subs r0, #0x29
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0x95
	lsls r0, r0, #1
	add r0, r8
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, _08021D00
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _08021D04
	movs r1, #0x96
	lsls r1, r1, #1
	add r1, r8
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r5, _08021D08
	ldr r1, _08021D0C
	adds r0, r5, #0
	bl StringExpandPlaceholders
	mov r4, sb
	ldrb r0, [r4]
	ldr r1, _08021CF4
	str r1, [sp]
	mov r2, sl
	str r2, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	ldr r4, _08021D10
	movs r0, #1
	adds r1, r4, #0
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	subs r1, r6, #1
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	mov r1, sb
	ldrb r0, [r1]
	ldr r2, _08021CF4
	str r2, [sp]
	mov r1, sl
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	adds r0, r6, #0
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0x94
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08021D00
	movs r2, #2
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r1, _08021D14
	adds r0, r5, #0
	bl StringExpandPlaceholders
	mov r4, sb
	ldrb r0, [r4]
	ldr r1, _08021CF4
	str r1, [sp]
	mov r2, sl
	str r2, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	adds r0, r7, #0
	adds r0, #0xd
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r4]
	ldr r4, _08021CF4
	str r4, [sp]
	mov r1, sl
	str r1, [sp, #4]
	ldr r1, _08021D18
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #2
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	ldr r4, _08021D1C
	movs r0, #1
	adds r1, r4, #0
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	movs r2, #0xae
	subs r0, r2, r0
	lsls r0, r0, #0x18
	str r0, [sp, #0x18]
	lsrs r6, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	ldr r2, _08021CF4
	str r2, [sp]
	mov r1, sl
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	adds r2, r6, #0
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	mov r4, r8
	ldrb r2, [r4, #0x16]
	ldrh r0, [r4, #0x16]
	mov ip, r0
	movs r1, #7
	mov sb, r1
	movs r5, #1
	ldr r3, _08021D20
_08021C62:
	mov r4, sb
	mov r0, sl
	subs r1, r4, r0
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _08021C80
	mov r1, sl
	lsls r0, r1, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r4, [sp, #0xc]
	adds r4, r4, r0
	str r4, [sp, #0xc]
_08021C80:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #7
	bls _08021C62
	ldr r0, _08021D00
	mov r2, ip
	lsrs r1, r2, #8
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _08021D04
	ldr r1, _08021D24
	ldr r0, [sp, #0xc]
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r4, _08021D08
	ldr r1, _08021D28
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r6, #0
	subs r0, #0x31
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r0, r8
	adds r0, #0x25
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08021D30
	movs r0, #0xd3
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	ldr r1, _08021D2C
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r4, [sp, #8]
	adds r2, r6, #0
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	b _08021D4A
	.align 2, 0
_08021CF4: .4byte 0x082C5EF0
_08021CF8: .4byte 0x085CC9F0
_08021CFC: .4byte 0x085CCA14
_08021D00: .4byte 0x02021C40
_08021D04: .4byte 0x02021C54
_08021D08: .4byte 0x02021C7C
_08021D0C: .4byte 0x085CCA0C
_08021D10: .4byte 0x085CCA08
_08021D14: .4byte 0x085CCA04
_08021D18: .4byte 0x085CC9F4
_08021D1C: .4byte 0x085CCA20
_08021D20: .4byte 0x082C5F64
_08021D24: .4byte 0x000F4240
_08021D28: .4byte 0x085CCA18
_08021D2C: .4byte 0x082C5EFF
_08021D30:
	movs r0, #0xd3
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	ldr r1, _08021DC8
	str r1, [sp]
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
_08021D4A:
	adds r0, r7, #0
	adds r0, #0xd
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r4, #0xd3
	lsls r4, r4, #1
	add r8, r4
	mov r1, r8
	ldrb r0, [r1]
	ldr r2, _08021DC8
	mov sb, r2
	str r2, [sp]
	movs r5, #0
	str r5, [sp, #4]
	ldr r1, _08021DCC
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #2
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	ldr r0, _08021DD0
	ldr r4, [sp, #0x10]
	ldrh r1, [r4, #8]
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _08021DD4
	ldr r1, _08021DD8
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	movs r2, #0x52
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	mov r1, r8
	ldrb r0, [r1]
	mov r2, sb
	str r2, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl AddTextPrinterParameterized3
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021DC8: .4byte 0x082C5EF0
_08021DCC: .4byte 0x085CC9FC
_08021DD0: .4byte 0x02021C40
_08021DD4: .4byte 0x02021C7C
_08021DD8: .4byte 0x085CCA28
	thumb_func_end sub_08021ABC

	thumb_func_start sub_08021DDC
sub_08021DDC: @ 0x08021DDC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	adds r0, #0x80
	ldrb r0, [r0]
	cmp r0, #5
	bls _08021DF0
	b _08021F88
_08021DF0:
	lsls r0, r0, #2
	ldr r1, _08021DFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021DFC: .4byte 0x08021E00
_08021E00: @ jump table
	.4byte _08021E18 @ case 0
	.4byte _08021E64 @ case 1
	.4byte _08021E78 @ case 2
	.4byte _08021E9C @ case 3
	.4byte _08021F68 @ case 4
	.4byte _08021F70 @ case 5
_08021E18:
	ldrb r0, [r4, #9]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	bl sub_080222B4
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #3
	ldr r2, _08021E40
	mov r1, sp
	adds r0, r0, r2
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldrh r0, [r4, #0x12]
	cmp r0, #0xd
	bne _08021E48
	ldr r0, _08021E44
	adds r0, #4
	b _08021E4A
	.align 2, 0
_08021E40: .4byte 0x082C5EE4
_08021E44: .4byte 0x082C5F5C
_08021E48:
	ldr r0, _08021E60
_08021E4A:
	adds r0, r5, r0
	ldrb r1, [r0]
	mov r0, sp
	strb r1, [r0, #4]
	mov r0, sp
	bl AddWindow
	adds r1, r6, #0
	adds r1, #0x82
	strb r0, [r1]
	b _08021F88
	.align 2, 0
_08021E60: .4byte 0x082C5F5C
_08021E64:
	adds r4, r6, #0
	adds r4, #0x82
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
	b _08021F88
_08021E78:
	adds r5, r6, #0
	adds r5, #0x82
	ldrb r0, [r5]
	ldr r4, _08021E98
	adds r1, r4, #0
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx_
	ldrb r0, [r5]
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	b _08021F88
	.align 2, 0
_08021E98: .4byte 0x0000021D
_08021E9C:
	ldrb r0, [r4, #9]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r4, #0x12]
	cmp r0, #0xc
	beq _08021EF8
	cmp r0, #0xc
	bgt _08021EB4
	cmp r0, #0xb
	beq _08021EBA
	b _08021F88
_08021EB4:
	cmp r0, #0xd
	beq _08021F44
	b _08021F88
_08021EBA:
	adds r0, r6, #0
	adds r0, #0x82
	ldrb r0, [r0]
	ldr r3, _08021EF0
	movs r1, #0x14
	movs r2, #3
	bl sub_080216F8
	ldr r0, _08021EF4
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r3, r3, #3
	ldrb r1, [r4, #9]
	movs r0, #0xd
	muls r0, r1, r0
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xa0
	bl sub_08021758
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #5
	b _08021F90
	.align 2, 0
_08021EF0: .4byte 0x085CCA30
_08021EF4: .4byte 0x082C5F5C
_08021EF8:
	adds r0, r6, #0
	adds r0, #0x82
	ldrb r0, [r0]
	ldr r2, _08021F3C
	adds r1, r4, #0
	adds r1, #0x8f
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r3, [r1]
	movs r1, #0x14
	movs r2, #4
	bl sub_080216F8
	ldr r0, _08021F40
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r3, r3, #3
	ldrb r1, [r4, #9]
	movs r0, #0xd
	muls r0, r1, r0
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xa0
	bl sub_08021758
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #5
	b _08021F90
	.align 2, 0
_08021F3C: .4byte 0x082C7C40
_08021F40: .4byte 0x082C5F5C
_08021F44:
	adds r0, r6, #0
	adds r0, #0x82
	ldrb r0, [r0]
	ldr r3, _08021F64
	movs r1, #0x16
	movs r2, #3
	bl sub_080216F8
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xb0
	movs r3, #0x12
	bl sub_08021758
	b _08021F88
	.align 2, 0
_08021F64: .4byte 0x085CCA40
_08021F68:
	adds r0, r4, #0
	bl sub_08021ABC
	b _08021F88
_08021F70:
	adds r0, r6, #0
	adds r0, #0x82
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	b _08021F94
_08021F88:
	adds r1, r6, #0
	adds r1, #0x80
	ldrb r0, [r1]
	adds r0, #1
_08021F90:
	strb r0, [r1]
	movs r0, #0
_08021F94:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08021DDC

	thumb_func_start sub_08021F9C
sub_08021F9C: @ 0x08021F9C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xd3
	lsls r0, r0, #1
	adds r5, r4, r0
	ldrb r0, [r5]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r5]
	bl RemoveWindow
	adds r0, r4, #0
	bl sub_08022360
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08021F9C

	thumb_func_start sub_08021FC0
sub_08021FC0: @ 0x08021FC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #0xc]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08021FF4
	adds r6, r0, r1
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #1
	beq _08022040
	cmp r0, #1
	bgt _08021FF8
	cmp r0, #0
	beq _08022006
	b _0802221A
	.align 2, 0
_08021FF4: .4byte 0x03005B68
_08021FF8:
	cmp r0, #2
	bne _08021FFE
	b _080221E0
_08021FFE:
	cmp r0, #3
	bne _08022004
	b _080221F4
_08022004:
	b _0802221A
_08022006:
	ldr r0, _08022038
	bl AddWindow
	strh r0, [r6, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	ldrb r0, [r6, #2]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r6, #2]
	ldr r4, _0802203C
	adds r1, r4, #0
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx_
	ldrb r0, [r6, #2]
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	b _0802221A
	.align 2, 0
_08022038: .4byte 0x082C5F04
_0802203C: .4byte 0x0000021D
_08022040:
	ldr r0, _080221B0
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov r8, r1
	movs r0, #1
	mov r1, sl
	mov r2, r8
	bl GetStringWidth
	lsrs r0, r0, #1
	movs r4, #0x60
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r6, #2]
	ldr r5, _080221B4
	str r5, [sp]
	mov r1, sb
	str r1, [sp, #4]
	mov r1, sl
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r7, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	ldr r0, _080221B8
	mov sl, r0
	movs r0, #1
	mov r1, sl
	mov r2, r8
	bl GetStringWidth
	lsrs r0, r0, #1
	subs r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	ldrb r0, [r6, #2]
	str r5, [sp]
	mov r1, sb
	str r1, [sp, #4]
	mov r1, sl
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r7, #0
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	movs r0, #0x2a
	mov sl, r0
_080220A6:
	mov r1, sb
	adds r1, #2
	ldr r0, _080221BC
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r0, _080221C0
	ldr r1, _080221C4
	bl StringExpandPlaceholders
	ldrb r0, [r6, #2]
	ldr r1, _080221C8
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r1, _080221C0
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #4
	mov r3, sl
	bl AddTextPrinterParameterized3
	movs r0, #1
	ldr r1, _080221CC
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	movs r1, #0xbc
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldrb r0, [r6, #2]
	ldr r1, _080221C8
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r1, _080221CC
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r7, #0
	mov r3, sl
	bl AddTextPrinterParameterized3
	movs r2, #0
	mov r0, sb
	lsls r4, r0, #1
	mov r1, sl
	adds r1, #0xd
	str r1, [sp, #0x10]
	movs r0, #1
	add sb, r0
	adds r0, r4, r6
	ldrb r3, [r0, #4]
	movs r1, #1
	mov r8, r1
	ldr r5, _080221D0
_0802211A:
	movs r0, #7
	subs r1, r0, r2
	adds r0, r3, #0
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08022136
	lsls r0, r2, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	adds r1, r1, r0
	str r1, [sp, #0xc]
_08022136:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _0802211A
	adds r0, r4, r6
	ldrh r1, [r0, #4]
	lsrs r1, r1, #8
	ldr r0, _080221BC
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, [sp, #0xc]
	ldr r1, _080221D4
	bl __udivsi3
	adds r1, r0, #0
	ldr r0, _080221D8
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _080221C0
	ldr r1, _080221DC
	bl StringExpandPlaceholders
	adds r0, r7, #0
	subs r0, #0x31
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r6, #2]
	ldr r1, _080221C8
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r1, _080221C0
	str r1, [sp, #8]
	movs r1, #0
	adds r2, r7, #0
	mov r3, sl
	bl AddTextPrinterParameterized3
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r0, #0
	str r0, [sp, #0xc]
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #3
	bls _080220A6
	ldrb r0, [r6, #2]
	movs r1, #3
	bl CopyWindowToVram
	b _0802221A
	.align 2, 0
_080221B0: .4byte 0x085CCA70
_080221B4: .4byte 0x082C5EF9
_080221B8: .4byte 0x085CCA7C
_080221BC: .4byte 0x02021C40
_080221C0: .4byte 0x02021C7C
_080221C4: .4byte 0x085CCA8C
_080221C8: .4byte 0x082C5EF0
_080221CC: .4byte 0x085CCA20
_080221D0: .4byte 0x082C5F64
_080221D4: .4byte 0x000F4240
_080221D8: .4byte 0x02021C54
_080221DC: .4byte 0x085CCA18
_080221E0:
	ldr r0, _080221F0
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0802221A
	b _08022220
	.align 2, 0
_080221F0: .4byte 0x03002360
_080221F4:
	ldrb r0, [r6, #2]
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r6, #2]
	bl ClearWindowTilemap
	ldrb r0, [r6, #2]
	bl RemoveWindow
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	bl ScriptContext2_Disable
	mov r0, sb
	b _0802221E
_0802221A:
	ldrh r0, [r6]
	adds r0, #1
_0802221E:
	strh r0, [r6]
_08022220:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08021FC0

	thumb_func_start sub_08022230
sub_08022230: @ 0x08022230
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _08022278
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0802227C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _08022280
	ldr r2, [r0]
	movs r3, #0xf6
	lsls r3, r3, #1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, #0xc]
	adds r3, #2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, #0xe]
	adds r3, #2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, #0x10]
	adds r3, #2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1, #0x12]
	pop {r0}
	bx r0
	.align 2, 0
_08022278: .4byte 0x08021FC1
_0802227C: .4byte 0x03005B60
_08022280: .4byte 0x03005AF0
	thumb_func_end sub_08022230

	thumb_func_start sub_08022284
sub_08022284: @ 0x08022284
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_08021674
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r0, #0
	bl sub_08034E9C
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r0, #1
	bl sub_08034E9C
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r0, #2
	bl sub_08034E9C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08022284

	thumb_func_start sub_080222B4
sub_080222B4: @ 0x080222B4
	push {lr}
	ldr r2, [r0, #0x78]
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r3, #4
	orrs r1, r3
	strb r1, [r2]
	ldr r1, [r0, #0x7c]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	movs r0, #2
	movs r1, #1
	bl sub_080352D4
	movs r0, #1
	movs r1, #1
	bl sub_080352D4
	movs r0, #0
	movs r1, #1
	bl sub_080352D4
	pop {r0}
	bx r0
	thumb_func_end sub_080222B4

	thumb_func_start sub_080222E8
sub_080222E8: @ 0x080222E8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	ldrb r0, [r5, #9]
	cmp r6, r0
	bhs _08022348
	ldr r7, _08022350
_080222F6:
	lsls r0, r6, #2
	movs r1, #0x98
	lsls r1, r1, #1
	adds r2, r5, r1
	adds r2, r2, r0
	ldrb r1, [r5, #9]
	subs r1, #2
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	adds r0, r0, r7
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08022354
	adds r0, r0, r1
	str r0, [r2]
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _08022358
	adds r0, r0, r1
	bl AddWindow
	ldr r1, _0802235C
	adds r4, r5, r1
	adds r4, r4, r6
	strb r0, [r4]
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r5, #9]
	cmp r6, r0
	blo _080222F6
_08022348:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022350: .4byte 0x082C7A08
_08022354: .4byte 0x082C7A1C
_08022358: .4byte 0x082C5F0C
_0802235C: .4byte 0x000001A7
	thumb_func_end sub_080222E8

	thumb_func_start sub_08022360
sub_08022360: @ 0x08022360
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r7, r0, #0
	movs r6, #0
	ldrb r0, [r7, #9]
	cmp r6, r0
	bhs _0802241A
	mov r8, r6
_08022374:
	ldr r1, _080223C0
	adds r0, r7, r1
	adds r5, r0, r6
	ldrb r0, [r5]
	bl PutWindowTilemap
	ldrb r0, [r7, #8]
	cmp r6, r0
	bne _080223C8
	lsls r4, r6, #3
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r4, #0x98
	adds r4, r7, r4
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	bl GetStringWidth
	lsrs r0, r0, #1
	movs r2, #0x24
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r5]
	mov r1, r8
	str r1, [sp]
	str r1, [sp, #4]
	ldr r1, _080223C4
	str r1, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #1
	movs r3, #1
	bl AddTextPrinterParameterized4
	b _08022400
	.align 2, 0
_080223C0: .4byte 0x000001A7
_080223C4: .4byte 0x082C5EF3
_080223C8:
	lsls r4, r6, #3
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r4, #0x98
	adds r4, r7, r4
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	bl GetStringWidth
	lsrs r0, r0, #1
	movs r2, #0x24
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r5]
	mov r1, r8
	str r1, [sp]
	str r1, [sp, #4]
	ldr r1, _0802242C
	str r1, [sp, #8]
	mov r1, r8
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #1
	movs r3, #1
	bl AddTextPrinterParameterized4
_08022400:
	ldr r1, _08022430
	adds r0, r7, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r7, #9]
	cmp r6, r0
	blo _08022374
_0802241A:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802242C: .4byte 0x082C5EF6
_08022430: .4byte 0x000001A7
	thumb_func_end sub_08022360

	thumb_func_start sub_08022434
sub_08022434: @ 0x08022434
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _08022448
	ldr r4, _0802244C
	adds r1, r4, #0
	bl LZ77UnCompWram
	b _0802247E
	.align 2, 0
_08022448: .4byte 0x082C79C4
_0802244C: .4byte 0x0201C000
_08022450:
	lsls r1, r5, #2
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrb r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r4, r1
	ldrb r2, [r3, #1]
	ldrb r3, [r3, #2]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	bl CopyToBgTilemapBufferRect
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802247E:
	ldrb r0, [r6, #9]
	cmp r5, r0
	blo _08022450
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08022434

	thumb_func_start sub_08022494
sub_08022494: @ 0x08022494
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _08022694
	strh r0, [r6, #0x2a]
	strh r5, [r6, #0x2c]
	ldr r1, _08022698
	strh r5, [r1]
	ldr r1, _0802269C
	strh r0, [r1]
	ldr r4, _080226A0
_080224AA:
	lsls r0, r5, #3
	adds r0, r0, r4
	bl LoadCompressedSpriteSheet
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _080224AA
	ldr r0, _080226A4
	bl LoadSpritePalettes
	ldr r0, _080226A8
	movs r1, #0x78
	movs r2, #0x58
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r3, r6, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080226AC
	adds r0, r0, r1
	str r0, [r3]
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r1, [r3]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, #0x2c
	ldrb r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r1]
	movs r5, #0
	ldrb r1, [r6, #9]
	cmp r5, r1
	bhs _08022586
	movs r7, #4
_0802250E:
	lsls r4, r5, #2
	movs r3, #0x98
	lsls r3, r3, #1
	adds r0, r6, r3
	adds r0, r0, r4
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	adds r1, #0x78
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r0, #6]
	adds r2, #0x20
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, _080226B0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r3, r6, r0
	adds r3, r3, r4
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, _080226AC
	adds r1, r1, r0
	str r1, [r3]
	ldrb r0, [r1, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r2, r4, #0
	ands r0, r2
	orrs r0, r7
	strb r0, [r1, #5]
	ldr r1, [r3]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	ldr r2, [r3]
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r6, #9]
	cmp r5, r0
	blo _0802250E
_08022586:
	movs r5, #0
	ldr r4, _080226B4
	adds r7, r4, #1
_0802258C:
	lsls r2, r5, #1
	adds r0, r2, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, #0x78
	adds r2, r2, r7
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r2, #0x88
	ldr r0, _080226B8
	movs r3, #6
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r5, #2
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r3, r6, r1
	adds r3, r3, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080226AC
	adds r0, r0, r1
	str r0, [r3]
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	ldr r2, [r3]
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	strh r5, [r0, #0x2e]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xa
	bls _0802258C
	movs r5, #0
_080225F2:
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #0x13
	movs r3, #0xb0
	lsls r3, r3, #0x10
	adds r1, r1, r3
	asrs r1, r1, #0x10
	ldr r0, _080226BC
	movs r2, #8
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r5, #2
	movs r4, #0xce
	lsls r4, r4, #1
	adds r3, r6, r4
	adds r3, r3, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080226AC
	adds r0, r0, r1
	str r0, [r3]
	ldrb r1, [r0, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r2, r4, #0
	ands r1, r2
	strb r1, [r0, #5]
	ldr r2, [r3]
	adds r2, #0x3e
	ldrb r0, [r2]
	adds r4, #8
	adds r1, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldr r2, [r3]
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r3, #0x41
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _080225F2
	ldr r4, _080226C0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl sub_08034B6C
	adds r2, r4, #0
	adds r2, #0x10
	movs r0, #1
	movs r1, #0
	bl sub_08034B6C
	adds r4, #0x20
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl sub_08034B6C
	ldrh r0, [r6, #0x12]
	cmp r0, #1
	bne _0802268C
	movs r4, #0x92
	lsls r4, r4, #1
	adds r0, r6, r4
	bl sub_080222B4
_0802268C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022694: .4byte 0x0000FF98
_08022698: .4byte 0x02021B38
_0802269C: .4byte 0x02021B3A
_080226A0: .4byte 0x082C7A80
_080226A4: .4byte 0x082C7AA8
_080226A8: .4byte 0x082C7B98
_080226AC: .4byte 0x020205AC
_080226B0: .4byte 0x082C7BB0
_080226B4: .4byte 0x082C7A5E
_080226B8: .4byte 0x082C7BC8
_080226BC: .4byte 0x082C7BE0
_080226C0: .4byte 0x082C7C10
	thumb_func_end sub_08022494

	thumb_func_start sub_080226C4
sub_080226C4: @ 0x080226C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #4
	bl FreeSpriteTilesByTag
	movs r0, #3
	bl FreeSpriteTilesByTag
	movs r0, #2
	bl FreeSpriteTilesByTag
	movs r0, #1
	bl FreeSpriteTilesByTag
	movs r0, #4
	bl FreeSpritePaletteByTag
	movs r0, #2
	bl FreeSpritePaletteByTag
	movs r0, #1
	bl FreeSpritePaletteByTag
	movs r0, #0xce
	lsls r0, r0, #1
	adds r6, r5, r0
_080226FA:
	lsls r0, r4, #2
	adds r0, r6, r0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _080226FA
	movs r0, #2
	bl sub_08035234
	movs r0, #1
	bl sub_08035234
	movs r0, #0
	bl sub_08035234
	movs r4, #0
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r6, r5, r1
_08022728:
	lsls r0, r4, #2
	adds r0, r6, r0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xa
	bls _08022728
	movs r4, #0
	ldrb r2, [r5, #9]
	cmp r4, r2
	bhs _08022760
_08022744:
	lsls r1, r4, #2
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5, #9]
	cmp r4, r0
	blo _08022744
_08022760:
	movs r1, #0xa2
	lsls r1, r1, #1
	adds r0, r5, r1
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802277C
	adds r0, r2, #0
	bl DestroySprite
_0802277C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080226C4

	thumb_func_start sub_08022784
sub_08022784: @ 0x08022784
	push {lr}
	adds r3, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080227AA
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	subs r2, #0x12
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
_080227AA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08022784

	thumb_func_start sub_080227B0
sub_080227B0: @ 0x080227B0
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r5, _080227F4
	adds r2, r3, #0
	adds r2, #0x2e
	movs r4, #0
_080227BE:
	lsls r0, r1, #1
	adds r0, r2, r0
	strh r4, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _080227BE
	movs r0, #0
	strh r0, [r3, #0x24]
	strh r0, [r3, #0x26]
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	subs r2, #0x12
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	str r5, [r3, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080227F4: .4byte 0x08007141
	thumb_func_end sub_080227B0

	thumb_func_start sub_080227F8
sub_080227F8: @ 0x080227F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x2e
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r5, #0x26]
	adds r0, r0, r2
	strh r0, [r5, #0x26]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	movs r6, #0x80
	lsls r6, r6, #8
	ands r0, r6
	cmp r0, #0
	beq _0802285E
	ldrh r0, [r4, #6]
	ldrh r2, [r5, #0x2e]
	adds r0, r0, r2
	strh r0, [r5, #0x2e]
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r5, #0x24]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	ands r0, r6
	cmp r0, #0
	beq _0802285E
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	cmp r0, #0x7e
	ble _0802285E
	movs r0, #0
	strh r0, [r5, #0x24]
	ldrh r1, [r4, #0xe]
	ldr r0, _08022884
	ands r0, r1
	strh r0, [r4, #0xe]
_0802285E:
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	strh r0, [r5, #0x20]
	movs r2, #0x22
	ldrsh r1, [r5, r2]
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	ldrh r2, [r4, #0xe]
	ldr r0, _08022884
	ands r0, r2
	cmp r1, r0
	ble _0802287E
	ldr r0, _08022888
	str r0, [r5, #0x1c]
_0802287E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08022884: .4byte 0x00007FFF
_08022888: .4byte 0x080227B1
	thumb_func_end sub_080227F8

	thumb_func_start sub_0802288C
sub_0802288C: @ 0x0802288C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x2e
	movs r0, #0
	mov r8, r0
	movs r2, #0xa0
	lsls r2, r2, #2
	strh r2, [r7, #2]
	movs r0, #0x20
	strh r0, [r7, #4]
	movs r1, #0xa8
	strh r1, [r7, #0xe]
	movs r0, #0x24
	ldrsh r4, [r6, r0]
	lsls r4, r4, #0x17
	lsrs r4, r4, #0x10
	ldrh r0, [r6, #0x22]
	subs r1, r1, r0
	lsls r1, r1, #0x17
	asrs r1, r1, #0x10
	adds r2, #0x20
	asrs r2, r2, #1
	movs r0, #7
	bl sub_081515B0
	adds r5, r0, #0
	ldrh r0, [r6, #0x20]
	lsls r0, r0, #7
	strh r0, [r6, #0x2e]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #7
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_081515B0
	strh r0, [r7, #6]
	movs r0, #7
	adds r1, r5, #0
	movs r2, #0x55
	bl sub_0815152C
	adds r2, r0, #0
	mov r1, r8
	strh r1, [r7, #8]
	movs r1, #0xfe
	lsls r1, r1, #6
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #7
	bl sub_081515B0
	strh r0, [r7, #0xa]
	movs r2, #0x24
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0802290A
	adds r0, #3
_0802290A:
	asrs r0, r0, #2
	strh r0, [r7, #0xc]
	ldrh r0, [r7, #0xe]
	ldr r2, _08022948
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0xe]
	mov r0, r8
	strh r0, [r6, #0x26]
	strh r0, [r6, #0x24]
	ldr r0, _0802294C
	str r0, [r6, #0x1c]
	adds r2, r6, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	adds r2, #0x12
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022948: .4byte 0xFFFF8000
_0802294C: .4byte 0x080227F9
	thumb_func_end sub_0802288C

	thumb_func_start sub_08022950
sub_08022950: @ 0x08022950
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	mov r8, r4
	bl sub_08020918
	adds r6, r0, #0
	cmp r5, #0x19
	bls _0802296E
	movs r5, #0
_0802296E:
	cmp r4, #0
	beq _08022978
	cmp r4, #1
	beq _080229A4
	b _080229AE
_08022978:
	cmp r5, #0
	beq _0802298C
	ldr r0, _080229A0
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	bl _call_via_r2
_0802298C:
	ldrb r0, [r6, #0xe]
	cmp r0, #0x19
	bls _08022996
	mov r0, r8
	strb r0, [r6, #0xe]
_08022996:
	ldr r0, _080229A0
	ldrb r1, [r6, #0xe]
	lsls r1, r1, #2
	b _080229A8
	.align 2, 0
_080229A0: .4byte 0x082C7C58
_080229A4:
	ldr r0, _080229B8
	lsls r1, r5, #2
_080229A8:
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r6, #4]
_080229AE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080229B8: .4byte 0x082C7C58
	thumb_func_end sub_08022950

	thumb_func_start sub_080229BC
sub_080229BC: @ 0x080229BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrb r2, [r1]
	ldrb r3, [r1, #1]
	lsls r3, r3, #8
	orrs r2, r3
	ldrb r3, [r1, #2]
	lsls r3, r3, #0x10
	orrs r2, r3
	ldrb r3, [r1, #3]
	lsls r3, r3, #0x18
	adds r0, r2, #0
	orrs r0, r3
	ldrb r2, [r1, #9]
	strb r2, [r1]
	ldrb r4, [r1, #8]
	lsls r4, r4, #8
	ldrb r2, [r1, #7]
	orrs r4, r2
	ldr r5, _08022A10
	ldrb r3, [r5, #8]
	movs r2, #0x7f
	ands r2, r3
	strb r2, [r5, #8]
	movs r5, #4
	ldrsb r5, [r1, r5]
	ldrb r2, [r1, #5]
	ldrb r3, [r1, #6]
	str r4, [sp]
	adds r1, r5, #0
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	movs r0, #2
	strb r0, [r6, #0xe]
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022A10: .4byte 0x02037C74
	thumb_func_end sub_080229BC

	thumb_func_start sub_08022A14
sub_08022A14: @ 0x08022A14
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	beq _08022A48
	cmp r0, #1
	bgt _08022A2A
	cmp r0, #0
	beq _08022A34
	b _08022A6A
_08022A2A:
	cmp r0, #2
	beq _08022A4E
	cmp r0, #3
	beq _08022A5A
	b _08022A6A
_08022A34:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022A70
	ldrb r0, [r5]
	cmp r0, #0
	bne _08022A6A
	movs r0, #3
	b _08022A6E
_08022A48:
	bl sub_0800FF34
	b _08022A6A
_08022A4E:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022A6A
	b _08022A70
_08022A5A:
	ldrb r0, [r4, #0xf]
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r0, #0
	strb r0, [r4, #0xc]
	b _08022A72
_08022A6A:
	ldrb r0, [r4, #0xc]
	adds r0, #1
_08022A6E:
	strb r0, [r4, #0xc]
_08022A70:
	movs r0, #0
_08022A72:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08022A14

	thumb_func_start sub_08022A78
sub_08022A78: @ 0x08022A78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r5, r1, #0
	ldrb r4, [r5, #3]
	lsls r4, r4, #8
	ldrb r0, [r5, #2]
	orrs r4, r0
	ldrb r6, [r7, #0xc]
	cmp r6, #1
	beq _08022B24
	cmp r6, #1
	bgt _08022A9C
	cmp r6, #0
	beq _08022AA6
	b _08022B6C
_08022A9C:
	cmp r6, #2
	beq _08022B3C
	cmp r6, #3
	beq _08022B4C
	b _08022B6C
_08022AA6:
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldrb r1, [r5, #1]
	movs r0, #2
	mov r8, r0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08022AF4
	ldr r4, _08022AEC
	ldr r1, _08022AF0
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldrb r3, [r7, #0xb]
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized2
	b _08022B16
	.align 2, 0
_08022AEC: .4byte 0x02021C7C
_08022AF0: .4byte 0x082C5EBC
_08022AF4:
	ldr r1, _08022B20
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrb r3, [r7, #0xb]
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized2
_08022B16:
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	b _08022B6C
	.align 2, 0
_08022B20: .4byte 0x082C5EBC
_08022B24:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08022B72
	cmp r4, #0
	bne _08022B6C
	ldrb r0, [r7, #0xc]
	adds r0, #1
	strb r0, [r7, #0xc]
	b _08022B6C
_08022B3C:
	ldr r0, _08022B48
	ldrh r0, [r0, #0x2e]
	ands r4, r0
	cmp r4, #0
	bne _08022B6C
	b _08022B72
	.align 2, 0
_08022B48: .4byte 0x03002360
_08022B4C:
	ldrb r1, [r5, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08022B5E
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
_08022B5E:
	ldrb r0, [r7, #0xe]
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	ldrb r0, [r5, #4]
	b _08022B70
_08022B6C:
	ldrb r0, [r7, #0xc]
	adds r0, #1
_08022B70:
	strb r0, [r7, #0xc]
_08022B72:
	movs r0, #0
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08022A78

	thumb_func_start sub_08022B80
sub_08022B80: @ 0x08022B80
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08020D74
	cmp r0, #0
	beq _08022B98
	ldrb r0, [r4, #0xe]
	adds r2, r4, #0
	adds r2, #0x36
	movs r1, #0
	bl sub_08022950
_08022B98:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08022B80

	thumb_func_start sub_08022BA0
sub_08022BA0: @ 0x08022BA0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08021038
	cmp r0, #0
	beq _08022BB8
	ldrb r0, [r4, #0xe]
	adds r2, r4, #0
	adds r2, #0x36
	movs r1, #0
	bl sub_08022950
_08022BB8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08022BA0

	thumb_func_start sub_08022BC0
sub_08022BC0: @ 0x08022BC0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _08022BD0
	cmp r0, #1
	beq _08022BD6
	b _08022C00
_08022BD0:
	bl sub_0800FF34
	b _08022C00
_08022BD6:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022C06
	ldr r0, _08022BFC
	bl PlayNewMapMusic
	movs r0, #7
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r1, #0
	movs r0, #3
	strh r0, [r4, #0x12]
	strb r1, [r4, #0xc]
	b _08022C06
	.align 2, 0
_08022BFC: .4byte 0x000001E5
_08022C00:
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
_08022C06:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08022BC0

	thumb_func_start sub_08022C10
sub_08022C10: @ 0x08022C10
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _08022C26
	cmp r0, #1
	beq _08022C4C
	adds r0, #1
	b _08022C5C
_08022C26:
	adds r0, r4, #0
	bl sub_08024340
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_08024410
	movs r0, #7
	strb r0, [r4, #0xe]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	b _08022C5E
_08022C4C:
	movs r0, #8
	strb r0, [r4, #0xe]
	movs r0, #5
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r0, #2
_08022C5C:
	strb r0, [r4, #0xc]
_08022C5E:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08022C10

	thumb_func_start sub_08022C68
sub_08022C68: @ 0x08022C68
	push {lr}
	movs r1, #0
	str r1, [r0, #4]
	ldr r0, _08022C7C
	bl SetMainCallback2
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08022C7C: .4byte 0x08020B39
	thumb_func_end sub_08022C68

	thumb_func_start sub_08022C80
sub_08022C80: @ 0x08022C80
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r2, r1, #0
	ldrb r0, [r5, #0xc]
	cmp r0, #5
	bls _08022C90
	b _08022DCC
_08022C90:
	lsls r0, r0, #2
	ldr r1, _08022C9C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08022C9C: .4byte 0x08022CA0
_08022CA0: @ jump table
	.4byte _08022CB8 @ case 0
	.4byte _08022CD8 @ case 1
	.4byte _08022CDE @ case 2
	.4byte _08022D12 @ case 3
	.4byte _08022D22 @ case 4
	.4byte _08022DB0 @ case 5
_08022CB8:
	movs r0, #1
	str r0, [sp]
	adds r0, r2, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_08024410
	movs r0, #9
	strb r0, [r5, #0xe]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	b _08022DD2
_08022CD8:
	bl sub_0800FF34
	b _08022DCC
_08022CDE:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022DD2
	adds r4, r5, #0
	adds r4, #0x42
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xc
	bl memset
	ldrb r1, [r5, #8]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0xa0
	ldrh r0, [r0]
	strh r0, [r4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #2
	bl SendBlock
	b _08022DCC
_08022D12:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022DD2
	movs r0, #0
	strh r0, [r5, #0x10]
	b _08022DCC
_08022D22:
	bl GetBlockReceivedStatus
	ldr r2, _08022DA4
	ldrb r4, [r5, #9]
	subs r1, r4, #2
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _08022DD2
	movs r3, #0
	cmp r3, r4
	bhs _08022D8A
	ldr r7, _08022DA8
	movs r6, #0
	ldr r4, _08022DAC
_08022D44:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r5, r0
	lsls r1, r3, #8
	adds r1, r1, r7
	ldrh r1, [r1]
	adds r2, r0, #0
	adds r2, #0xa0
	strh r1, [r2]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xb0
	bls _08022D62
	strh r6, [r2]
_08022D62:
	ldrh r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r5, #0x18]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0x18]
	ldrh r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #2]
	ldr r0, [r5, #0x1c]
	adds r0, r0, r1
	str r0, [r5, #0x1c]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r5, #9]
	cmp r3, r0
	blo _08022D44
_08022D8A:
	movs r0, #0
	strh r0, [r5, #0x10]
	bl ResetBlockReceivedFlags
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_081515D8
	str r0, [r5, #0x20]
	b _08022DCC
	.align 2, 0
_08022DA4: .4byte 0x082C7CD4
_08022DA8: .4byte 0x0202207C
_08022DAC: .4byte 0x08563604
_08022DB0:
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	movs r0, #0xa
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r1, #0
	movs r0, #4
	strh r0, [r5, #0x12]
	strb r1, [r5, #0xc]
	b _08022DD2
_08022DCC:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
_08022DD2:
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08022C80

	thumb_func_start sub_08022DDC
sub_08022DDC: @ 0x08022DDC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #6
	bls _08022DE8
	b _08022F14
_08022DE8:
	lsls r0, r0, #2
	ldr r1, _08022DF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08022DF4: .4byte 0x08022DF8
_08022DF8: @ jump table
	.4byte _08022E14 @ case 0
	.4byte _08022E26 @ case 1
	.4byte _08022E54 @ case 2
	.4byte _08022E8C @ case 3
	.4byte _08022EBC @ case 4
	.4byte _08022EDE @ case 5
	.4byte _08022EF0 @ case 6
_08022E14:
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r4, r0
	adds r0, r4, #0
	bl sub_080211D4
	bl sub_0800FF34
	b _08022F14
_08022E26:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022F1A
	movs r2, #0x92
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r0, #0
	strb r0, [r1]
	ldr r3, _08022E50
	adds r1, r4, r3
	strb r0, [r1]
	adds r2, #2
	adds r1, r4, r2
	strb r0, [r1]
	adds r3, #2
	adds r1, r4, r3
	strb r0, [r1]
	b _08022F14
	.align 2, 0
_08022E50: .4byte 0x00000125
_08022E54:
	movs r0, #0x92
	lsls r0, r0, #1
	adds r3, r4, r0
	ldrb r0, [r3]
	lsls r0, r0, #2
	movs r2, #0xae
	lsls r2, r2, #1
	adds r1, r4, r2
	adds r0, r1, r0
	ldr r2, [r0]
	ldr r0, _08022E88
	str r0, [r2, #0x1c]
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
	movs r0, #0x3d
	bl PlaySE
	b _08022F14
	.align 2, 0
_08022E88: .4byte 0x08021339
_08022E8C:
	movs r3, #0x92
	lsls r3, r3, #1
	adds r2, r4, r3
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r3, #0x38
	adds r1, r4, r3
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r1, [r0, #0x1c]
	ldr r0, _08022EB8
	cmp r1, r0
	beq _08022F1A
	movs r0, #0
	str r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	bl sub_0800FF34
	b _08022F14
	.align 2, 0
_08022EB8: .4byte 0x08021339
_08022EBC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022F1A
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r4, r0
	ldrb r0, [r1]
	ldrb r2, [r4, #9]
	cmp r0, r2
	bhs _08022ED8
	movs r0, #2
	b _08022F18
_08022ED8:
	movs r0, #0
	strb r0, [r1]
	b _08022F14
_08022EDE:
	movs r3, #0x92
	lsls r3, r3, #1
	adds r1, r4, r3
	adds r0, r4, #0
	bl sub_080213D8
	bl sub_0800FF34
	b _08022F14
_08022EF0:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022F1A
	movs r0, #0x2b
	bl PlaySE
	movs r0, #0xb
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r1, #0
	movs r0, #5
	strh r0, [r4, #0x12]
	strb r1, [r4, #0xc]
	b _08022F1A
_08022F14:
	ldrb r0, [r4, #0xc]
	adds r0, #1
_08022F18:
	strb r0, [r4, #0xc]
_08022F1A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08022DDC

	thumb_func_start sub_08022F24
sub_08022F24: @ 0x08022F24
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0xc]
	cmp r1, #1
	beq _08022F88
	cmp r1, #1
	bgt _08022F38
	cmp r1, #0
	beq _08022F42
	b _08023048
_08022F38:
	cmp r1, #2
	beq _08023008
	cmp r1, #3
	beq _0802302A
	b _08023048
_08022F42:
	ldrh r0, [r4, #0x2a]
	adds r0, #4
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08022F50
	b _0802304E
_08022F50:
	strh r1, [r4, #0x2a]
	ldr r0, _08022F80
	adds r3, r4, r0
	movs r0, #4
	strb r0, [r3]
	movs r2, #0x92
	lsls r2, r2, #1
	adds r1, r4, r2
	movs r0, #0
	strb r0, [r1]
	ldr r2, _08022F84
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r2, #0x93
	lsls r2, r2, #1
	adds r1, r4, r2
	strb r0, [r1]
	movs r0, #0xd6
	bl PlaySE
	b _08023048
	.align 2, 0
_08022F80: .4byte 0x00000125
_08022F84: .4byte 0x082C5E84
_08022F88:
	ldr r7, _08023000
	movs r0, #0x92
	lsls r0, r0, #1
	adds r6, r4, r0
	ldr r1, _08023004
	adds r5, r4, r1
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	ldrb r2, [r6]
	adds r0, r0, r2
	adds r0, r0, r7
	movs r1, #0
	ldrsb r1, [r0, r1]
	strh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x12
	bl SetGpuReg
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1e
	bl SetGpuReg
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r1, #0x93
	lsls r1, r1, #1
	adds r2, r4, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r2]
	cmp r0, r1
	blo _0802304E
	ldrb r0, [r5]
	cmp r0, #0
	beq _08023048
	subs r0, #1
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #0
	strb r0, [r6]
	b _0802304E
	.align 2, 0
_08023000: .4byte 0x082C5E84
_08023004: .4byte 0x00000125
_08023008:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	bl sub_0800FF34
	b _08023048
_0802302A:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802304E
	movs r0, #0xc
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r1, #0
	movs r0, #6
	strh r0, [r4, #0x12]
	strb r1, [r4, #0xc]
	b _0802304E
_08023048:
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
_0802304E:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08022F24

	thumb_func_start sub_08023058
sub_08023058: @ 0x08023058
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	beq _08023078
	cmp r0, #1
	bgt _0802306E
	cmp r0, #0
	beq _0802309E
	b _080230F8
_0802306E:
	cmp r0, #2
	beq _08023096
	cmp r0, #3
	beq _080230A4
	b _080230F8
_08023078:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080230FE
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x78
	movs r3, #0x50
	bl sub_0802E788
	b _080230F8
_08023096:
	bl sub_0802E7E8
	cmp r0, #0
	bne _080230FE
_0802309E:
	bl sub_0800FF34
	b _080230F8
_080230A4:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080230FE
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r2, _080230E0
	adds r1, r4, r2
	strb r0, [r1]
	adds r2, #1
	adds r1, r4, r2
	strb r0, [r1]
	adds r2, #1
	adds r1, r4, r2
	strb r0, [r1]
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _080230E4
	movs r0, #0xd
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	b _080230EE
	.align 2, 0
_080230E0: .4byte 0x00000125
_080230E4:
	movs r0, #0xe
	movs r1, #1
	movs r2, #0
	bl sub_08022950
_080230EE:
	movs r1, #0
	movs r0, #7
	strh r0, [r4, #0x12]
	strb r1, [r4, #0xc]
	b _080230FE
_080230F8:
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
_080230FE:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08023058

	thumb_func_start sub_08023108
sub_08023108: @ 0x08023108
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r2, #0
	adds r6, r2, #0
	ldrb r1, [r5, #9]
	cmp r6, r1
	blo _08023124
	b _0802322E
_08023124:
	movs r2, #0x5e
	adds r2, r2, r5
	mov sb, r2
	ldr r3, _080231D4
	mov sl, r3
_0802312E:
	lsls r0, r6, #4
	ldr r1, _080231D8
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	movs r3, #0xbc
	lsls r3, r3, #6
	cmp r0, r3
	bne _08023220
	ldrh r0, [r2, #2]
	cmp r0, #2
	bne _08023220
	ldrb r1, [r2, #4]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08023214
	mov r0, sb
	ldrb r2, [r0]
	lsrs r1, r2, #3
	mov r3, sl
	adds r0, r6, r3
	ldrb r0, [r0]
	orrs r1, r0
	lsls r1, r1, #3
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	mov r1, sb
	strb r0, [r1]
	lsls r2, r6, #3
	subs r0, r2, r6
	lsls r0, r0, #2
	adds r3, r5, r0
	adds r1, r3, #0
	adds r1, #0xb1
	movs r0, #1
	strb r0, [r1]
	subs r1, #7
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	subs r1, #8
	ldrh r0, [r5, #0x28]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xa6
	adds r0, r0, r3
	mov ip, r0
	ldrh r1, [r0]
	subs r0, r1, #1
	adds r7, r2, #0
	cmp r4, r0
	blt _080231DC
	adds r0, r1, #1
	cmp r4, r0
	bgt _080231DC
	adds r1, r3, #0
	adds r1, #0xa4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	mov r2, ip
	strh r4, [r2]
	adds r0, r3, #0
	adds r0, #0xa8
	ldrh r1, [r1]
	ldrh r3, [r0]
	cmp r1, r3
	bls _080231EE
	strh r1, [r0]
	b _080231EE
	.align 2, 0
_080231D4: .4byte 0x082C5E74
_080231D8: .4byte 0x03003130
_080231DC:
	subs r0, r7, r6
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r0, #0
	adds r2, #0xa4
	movs r1, #0
	strh r1, [r2]
	adds r0, #0xa6
	strh r4, [r0]
_080231EE:
	subs r0, r7, r6
	lsls r0, r0, #2
	adds r0, r5, r0
	ldrh r1, [r5, #0x28]
	adds r3, r0, #0
	adds r3, #0xa2
	movs r4, #0
	strh r1, [r3]
	adds r2, r0, #0
	adds r2, #0xb0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08023220
	strb r4, [r2]
	b _08023220
_08023214:
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0xb1
	strb r1, [r0]
_08023220:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r5, #9]
	cmp r6, r0
	bhs _0802322E
	b _0802312E
_0802322E:
	mov r1, r8
	cmp r1, #1
	bls _08023268
	movs r6, #0
	ldrb r2, [r5, #9]
	cmp r6, r2
	bhs _08023268
_0802323C:
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r1, r5, r0
	adds r3, r1, #0
	adds r3, #0xb1
	ldrb r2, [r3]
	cmp r2, #0
	beq _0802325C
	movs r0, #2
	orrs r0, r2
	strb r0, [r3]
	adds r1, #0xac
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0802325C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r3, [r5, #9]
	cmp r6, r3
	blo _0802323C
_08023268:
	mov r0, r8
	cmp r0, #0
	beq _080232D0
	ldrh r0, [r5, #0x2e]
	add r0, r8
	strh r0, [r5, #0x2e]
	ldr r1, _080232B8
	mov r0, r8
	subs r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	add r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrh r0, [r5, #0x34]
	add r0, r8
	strh r0, [r5, #0x34]
	ldrh r0, [r5, #0x1a]
	add r0, r8
	strh r0, [r5, #0x1a]
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	movs r3, #0x1a
	ldrsh r2, [r5, r3]
	subs r0, r0, r2
	cmp r0, #0
	ble _080232BC
	lsls r2, r2, #8
	ldr r1, [r5, #0x20]
	adds r0, r2, #0
	bl sub_081515D8
	adds r2, r0, #0
	asrs r2, r2, #8
	adds r0, r5, #0
	adds r0, #0x24
	strb r2, [r0]
	b _080232D0
	.align 2, 0
_080232B8: .4byte 0x082C5E7C
_080232BC:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	adds r2, r5, #0
	adds r2, #0x5e
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_080232D0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08023108

	thumb_func_start sub_080232E0
sub_080232E0: @ 0x080232E0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r6, #0
	movs r1, #0
	adds r4, r1, #0
	ldrb r0, [r3, #9]
	cmp r4, r0
	bhs _0802333C
	adds r5, r3, #0
	adds r5, #0x64
_080232F4:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r1, r3, r0
	adds r0, r1, #0
	adds r0, #0xb1
	ldrb r2, [r0]
	cmp r2, #0
	beq _08023330
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r1, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	adds r1, r0, #1
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08023320
	movs r0, #4
	orrs r1, r0
_08023320:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r5]
	orrs r1, r0
	strh r1, [r5]
_08023330:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r1, [r3, #9]
	cmp r4, r1
	blo _080232F4
_0802333C:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r1, [r0]
	adds r0, #0x3c
	strh r1, [r0]
	cmp r6, #0
	bne _08023360
	ldr r2, _0802335C
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802342C
	movs r4, #0x92
	lsls r4, r4, #1
	adds r1, r3, r4
	b _0802339E
	.align 2, 0
_0802335C: .4byte 0x00000127
_08023360:
	ldr r5, _0802338C
	adds r2, r3, r5
	ldrb r0, [r2]
	cmp r0, #0
	beq _080233A6
	ldr r0, _08023390
	adds r1, r3, r0
	ldrb r2, [r1]
	cmp r6, r2
	beq _08023398
	subs r0, r6, #1
	strb r0, [r1]
	ldr r1, _08023394
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r4, #0x93
	lsls r4, r4, #1
	adds r1, r3, r4
	strb r0, [r1]
	b _080233CC
	.align 2, 0
_0802338C: .4byte 0x00000127
_08023390: .4byte 0x00000125
_08023394: .4byte 0x082C5EA8
_08023398:
	movs r5, #0x92
	lsls r5, r5, #1
	adds r1, r3, r5
_0802339E:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080233CC
_080233A6:
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r3, r0
	movs r0, #0
	strb r0, [r1]
	subs r0, r6, #1
	ldr r4, _080233FC
	adds r1, r3, r4
	strb r0, [r1]
	ldr r1, _08023400
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r5, #0x93
	lsls r5, r5, #1
	adds r1, r3, r5
	strb r0, [r1]
	movs r0, #1
	strb r0, [r2]
_080233CC:
	ldr r0, _08023404
	adds r4, r3, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802342C
	movs r2, #0x92
	lsls r2, r2, #1
	adds r1, r3, r2
	movs r5, #0x93
	lsls r5, r5, #1
	adds r2, r3, r5
	ldrb r0, [r1]
	ldrb r5, [r2]
	cmp r0, r5
	blo _08023408
	movs r0, #0
	strb r0, [r1]
	ldr r5, _080233FC
	adds r1, r3, r5
	strb r0, [r1]
	strb r0, [r2]
	strb r0, [r4]
	movs r1, #0
	b _0802341C
	.align 2, 0
_080233FC: .4byte 0x00000125
_08023400: .4byte 0x082C5EA8
_08023404: .4byte 0x00000127
_08023408:
	ldr r2, _08023424
	ldrb r1, [r1]
	ldr r4, _08023428
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
_0802341C:
	adds r0, r3, #0
	adds r0, #0x5f
	strb r1, [r0]
	b _08023434
	.align 2, 0
_08023424: .4byte 0x082C5EA8
_08023428: .4byte 0x00000125
_0802342C:
	adds r1, r3, #0
	adds r1, #0x5f
	movs r0, #0
	strb r0, [r1]
_08023434:
	ldrh r1, [r3, #0x26]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080232E0

	thumb_func_start sub_08023444
sub_08023444: @ 0x08023444
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r3, _080234DC
	ldrh r1, [r3, #0x2e]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08023466
	adds r2, r5, #0
	adds r2, #0x5e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_08023466:
	ldrh r1, [r3, #0x2c]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0802348A
	ldrb r1, [r5, #8]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r0, #0
	adds r1, #0xae
	ldrh r0, [r1]
	ldrh r2, [r5, #0x28]
	cmp r0, r2
	bhs _0802348A
	adds r0, #1
	strh r0, [r1]
_0802348A:
	ldrb r0, [r5, #8]
	adds r7, r5, #0
	adds r7, #0x5e
	cmp r0, #0
	beq _080234A0
	ldrb r1, [r7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080234A0
	b _080235DC
_080234A0:
	adds r4, r5, #0
	adds r4, #0x5c
	movs r0, #2
	strh r0, [r4]
	ldrh r0, [r5, #0x28]
	movs r1, #0x1e
	bl __umodsi3
	lsls r0, r0, #0x10
	mov r8, r4
	adds r6, r5, #0
	adds r6, #0x25
	cmp r0, #0
	bne _080234F8
	movs r0, #0x2e
	ldrsh r2, [r5, r0]
	ldr r1, _080234E0
	ldrb r0, [r5, #9]
	subs r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	ble _080234E4
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	ldrb r0, [r6]
	movs r1, #0x10
	orrs r0, r1
	b _080234EC
	.align 2, 0
_080234DC: .4byte 0x03002360
_080234E0: .4byte 0x082C7CD0
_080234E4:
	ldrb r1, [r6]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
_080234EC:
	strb r0, [r6]
	movs r0, #0
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
_080234F8:
	ldrh r0, [r5, #0x28]
	movs r1, #0xf
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802356E
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	ldr r3, _08023524
	ldrb r0, [r5, #9]
	subs r0, #2
	lsls r1, r0, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bge _08023528
	ldrb r1, [r6]
	movs r0, #0x1f
	ands r0, r1
	strb r0, [r6]
	b _08023568
	.align 2, 0
_08023524: .4byte 0x082C7CC0
_08023528:
	adds r0, r3, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802353C
	ldrb r0, [r6]
	movs r1, #0x1f
	ands r1, r0
	movs r0, #0x20
	b _08023564
_0802353C:
	adds r0, r3, #2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802354C
	movs r0, #2
	strh r0, [r5, #0x34]
	b _08023568
_0802354C:
	adds r0, r3, #3
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802355C
	movs r0, #3
	strh r0, [r5, #0x34]
	b _08023568
_0802355C:
	ldrb r0, [r6]
	movs r1, #0x1f
	ands r1, r0
	movs r0, #0x80
_08023564:
	orrs r1, r0
	strb r1, [r6]
_08023568:
	movs r0, #0
	strh r0, [r5, #0x34]
	b _0802359A
_0802356E:
	ldrh r0, [r5, #0x10]
	adds r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0802359A
	cmp r0, #0x46
	bls _0802358A
	bl sub_080115B4
	movs r0, #0
	strh r0, [r5, #0x10]
	b _0802359A
_0802358A:
	ldrb r0, [r7]
	movs r4, #0xf8
	ands r4, r0
	cmp r4, #0
	bne _0802359A
	bl sub_080115B4
	strh r4, [r5, #0x10]
_0802359A:
	ldrh r1, [r5, #0x28]
	ldr r0, _080235E8
	cmp r1, r0
	bls _080235AA
	ldrb r0, [r7]
	movs r1, #1
	orrs r0, r1
	strb r0, [r7]
_080235AA:
	ldrb r1, [r6]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1f
	lsls r1, r1, #1
	ldrb r2, [r7]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7]
	ldrb r0, [r6]
	lsrs r0, r0, #5
	adds r2, r5, #0
	adds r2, #0x66
	strh r0, [r2]
	adds r4, r5, #0
	adds r4, #0x42
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0xc
	bl memcpy
	adds r0, r4, #0
	bl sub_0800F934
_080235DC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080235E8: .4byte 0x00008C9F
	thumb_func_end sub_08023444

	thumb_func_start sub_080235EC
sub_080235EC: @ 0x080235EC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r3, _0802363C
	ldrb r0, [r5, #9]
	cmp r4, r0
	bhs _08023614
	movs r1, #0
_080235FC:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0xb1
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5, #9]
	cmp r4, r0
	blo _080235FC
_08023614:
	adds r2, r3, #0
	ldrh r0, [r2]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0xbc
	lsls r0, r0, #6
	cmp r1, r0
	bne _0802362C
	ldrh r0, [r2, #2]
	cmp r0, #2
	beq _08023640
_0802362C:
	adds r2, r5, #0
	adds r2, #0x25
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _0802367E
	.align 2, 0
_0802363C: .4byte 0x03003130
_08023640:
	adds r4, r5, #0
	adds r4, #0x4e
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #0xe
	bl memcpy
	ldrh r0, [r4, #6]
	strh r0, [r5, #0x2a]
	movs r0, #5
	ldrsb r0, [r4, r0]
	strh r0, [r5, #0x2c]
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x28]
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r0, r5, #0
	bl sub_08021410
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802367E
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0]
_0802367E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080235EC

	thumb_func_start sub_08023684
sub_08023684: @ 0x08023684
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5c
	movs r1, #0
	movs r2, #0xc
	bl memset
	adds r0, r4, #0
	adds r0, #0x4e
	movs r1, #0
	movs r2, #0xe
	bl memset
	adds r0, r4, #0
	bl sub_080235EC
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x12
	bl SetGpuReg
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1e
	bl SetGpuReg
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802370C
	ldrh r1, [r4, #0x28]
	ldr r0, _080236F4
	cmp r1, r0
	bls _080236F8
	adds r0, #1
	strh r0, [r4, #0x28]
	movs r0, #0x10
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	b _08023702
	.align 2, 0
_080236F4: .4byte 0x00008C9F
_080236F8:
	movs r0, #0xf
	movs r1, #1
	movs r2, #0
	bl sub_08022950
_08023702:
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x10]
	strb r1, [r4, #0xc]
	b _08023726
_0802370C:
	ldrh r0, [r4, #0x26]
	adds r0, #1
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	bl sub_08023108
	adds r0, r4, #0
	bl sub_080232E0
	adds r0, r4, #0
	bl sub_08023444
	movs r0, #0
_08023726:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08023684

	thumb_func_start sub_0802372C
sub_0802372C: @ 0x0802372C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5c
	movs r1, #0
	movs r2, #0xc
	bl memset
	adds r0, r4, #0
	adds r0, #0x4e
	movs r1, #0
	movs r2, #0xe
	bl memset
	adds r0, r4, #0
	bl sub_080235EC
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x12
	bl SetGpuReg
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1e
	bl SetGpuReg
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080237B4
	ldrh r1, [r4, #0x28]
	ldr r0, _0802379C
	cmp r1, r0
	bls _080237A0
	adds r0, #1
	strh r0, [r4, #0x28]
	movs r0, #0x10
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	b _080237AA
	.align 2, 0
_0802379C: .4byte 0x00008C9F
_080237A0:
	movs r0, #0xf
	movs r1, #1
	movs r2, #0
	bl sub_08022950
_080237AA:
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x10]
	strb r1, [r4, #0xc]
	b _080237BC
_080237B4:
	adds r0, r4, #0
	bl sub_08023444
	movs r0, #0
_080237BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802372C

	thumb_func_start sub_080237C4
sub_080237C4: @ 0x080237C4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #5
	bls _080237D0
	b _08023946
_080237D0:
	lsls r0, r0, #2
	ldr r1, _080237DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080237DC: .4byte 0x080237E0
_080237E0: @ jump table
	.4byte _080237F8 @ case 0
	.4byte _08023820 @ case 1
	.4byte _08023870 @ case 2
	.4byte _080238F0 @ case 3
	.4byte _0802390E @ case 4
	.4byte _08023928 @ case 5
_080237F8:
	movs r0, #8
	strh r0, [r4, #0x12]
	movs r0, #0xd6
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, _0802381C
	movs r1, #8
	bl BlendPalettes
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #2
	strb r0, [r1]
	b _08023946
	.align 2, 0
_0802381C: .4byte 0x000003FF
_08023820:
	movs r1, #0x92
	lsls r1, r1, #1
	adds r5, r4, r1
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08023836
	b _0802394C
_08023836:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, _08023864
	movs r1, #0
	bl BlendPalettes
	ldr r2, _08023868
	adds r1, r4, r2
	movs r0, #4
	strb r0, [r1]
	movs r0, #0
	strb r0, [r5]
	ldr r2, _0802386C
	ldrb r1, [r1]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r2, #0x93
	lsls r2, r2, #1
	adds r1, r4, r2
	strb r0, [r1]
	b _08023946
	.align 2, 0
_08023864: .4byte 0x000003FF
_08023868: .4byte 0x00000125
_0802386C: .4byte 0x082C5E84
_08023870:
	ldr r7, _080238E8
	movs r0, #0x92
	lsls r0, r0, #1
	adds r6, r4, r0
	ldr r1, _080238EC
	adds r5, r4, r1
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	ldrb r2, [r6]
	adds r0, r0, r2
	adds r0, r0, r7
	movs r1, #0
	ldrsb r1, [r0, r1]
	strh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x12
	bl SetGpuReg
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	ldrh r1, [r4, #0x2c]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x1e
	bl SetGpuReg
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r1, #0x93
	lsls r1, r1, #1
	adds r2, r4, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r2]
	cmp r0, r1
	blo _0802394C
	ldrb r0, [r5]
	cmp r0, #0
	beq _08023946
	subs r0, #1
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #0
	strb r0, [r6]
	b _0802394C
	.align 2, 0
_080238E8: .4byte 0x082C5E84
_080238EC: .4byte 0x00000125
_080238F0:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	b _08023946
_0802390E:
	movs r2, #0x92
	lsls r2, r2, #1
	adds r1, r4, r2
	adds r0, r4, #0
	bl sub_08021604
	cmp r0, #0
	beq _0802394C
	bl sub_0800FF34
	movs r0, #0
	strh r0, [r4, #0x10]
	b _08023946
_08023928:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802394C
	movs r0, #0x11
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x10]
	strb r1, [r4, #0xc]
	b _0802394E
_08023946:
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
_0802394C:
	movs r0, #0
_0802394E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080237C4

	thumb_func_start sub_08023954
sub_08023954: @ 0x08023954
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	beq _08023998
	cmp r0, #1
	bgt _0802396C
	cmp r0, #0
	beq _08023976
	b _08023A30
_0802396C:
	cmp r0, #2
	beq _080239BE
	cmp r0, #3
	beq _080239F0
	b _08023A30
_08023976:
	movs r0, #9
	strh r0, [r5, #0x12]
	movs r0, #0x20
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #8
	movs r2, #0x1f
	bl BlendPalettes
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #4
	strb r0, [r1]
	b _08023A30
_08023998:
	movs r0, #0x92
	lsls r0, r0, #1
	adds r4, r5, r0
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08023A36
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	movs r2, #0x1f
	bl BlendPalettes
	movs r0, #0
	strb r0, [r4]
	b _08023A30
_080239BE:
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r0, r5, #0
	bl sub_08021604
	cmp r0, #0
	beq _08023A36
	bl sub_0800FF34
	movs r0, #0
	strh r0, [r5, #0x10]
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	b _08023A30
_080239F0:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023A36
	ldr r0, _08023A2C
	ldr r1, [r5, #0x1c]
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	movs r4, #0
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #7
	movs r2, #1
	movs r3, #0
	bl sub_08024410
	movs r0, #0x13
	strb r0, [r5, #0xe]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r0, #0
	strh r4, [r5, #0x10]
	b _08023A34
	.align 2, 0
_08023A2C: .4byte 0x02021C40
_08023A30:
	ldrb r0, [r5, #0xc]
	adds r0, #1
_08023A34:
	strb r0, [r5, #0xc]
_08023A36:
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08023954

	thumb_func_start sub_08023A40
sub_08023A40: @ 0x08023A40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldrb r0, [r0, #0xc]
	cmp r0, #7
	bls _08023A56
	b _08023DF4
_08023A56:
	lsls r0, r0, #2
	ldr r1, _08023A60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023A60: .4byte 0x08023A64
_08023A64: @ jump table
	.4byte _08023A84 @ case 0
	.4byte _08023ACA @ case 1
	.4byte _08023ADE @ case 2
	.4byte _08023B52 @ case 3
	.4byte _08023CE2 @ case 4
	.4byte _08023D8E @ case 5
	.4byte _08023DA0 @ case 6
	.4byte _08023DD4 @ case 7
_08023A84:
	mov r4, r8
	adds r4, #0x42
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl memset
	mov r1, r8
	ldrb r0, [r1, #8]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	adds r1, #0xae
	mov r3, r8
	ldrh r2, [r3, #0x28]
	ldrh r0, [r1]
	cmp r0, r2
	bls _08023AAC
	strh r2, [r1]
_08023AAC:
	mov r5, r8
	ldrb r0, [r5, #8]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	adds r1, #0xae
	ldrh r0, [r1]
	strh r0, [r4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #2
	bl SendBlock
	b _08023DF4
_08023ACA:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023AD6
	b _08023DFC
_08023AD6:
	movs r0, #0
	mov r6, r8
	strh r0, [r6, #0x10]
	b _08023DF4
_08023ADE:
	bl GetBlockReceivedStatus
	ldr r2, _08023B44
	mov r1, r8
	ldrb r3, [r1, #9]
	subs r1, r3, #2
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	beq _08023AF8
	b _08023DFC
_08023AF8:
	movs r2, #0
	mov sb, r2
	mov r4, r8
	adds r4, #0x42
	cmp sb, r3
	bhs _08023B2C
	ldr r2, _08023B48
_08023B06:
	mov r3, sb
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #2
	add r1, r8
	lsls r0, r3, #8
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0xae
	strh r0, [r1]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r5, r8
	ldrb r5, [r5, #9]
	cmp sb, r5
	blo _08023B06
_08023B2C:
	movs r0, #0
	mov r6, r8
	strh r0, [r6, #0x10]
	strh r0, [r4]
	bl ResetBlockReceivedFlags
	ldrb r0, [r6, #8]
	cmp r0, #0
	bne _08023B4C
	movs r0, #3
	strb r0, [r6, #0xc]
	b _08023DFC
	.align 2, 0
_08023B44: .4byte 0x082C7CD4
_08023B48: .4byte 0x0202207C
_08023B4C:
	movs r0, #6
	mov r1, r8
	b _08023DFA
_08023B52:
	mov r0, r8
	adds r0, #0x68
	movs r1, #0
	movs r2, #0x30
	bl memset
	mov r2, r8
	ldrh r1, [r2, #0x28]
	mov r0, r8
	adds r0, #0x6c
	strh r1, [r0]
	movs r3, #0x18
	ldrsh r4, [r2, r3]
	ldrh r0, [r2, #0x28]
	movs r1, #0x3c
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl __divsi3
	mov r1, r8
	adds r1, #0x6e
	strh r0, [r1]
	mov r5, r8
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	lsls r0, r0, #8
	movs r4, #0xc8
	lsls r4, r4, #6
	adds r1, r4, #0
	bl sub_08151550
	adds r2, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	lsls r1, r1, #8
	adds r0, r2, #0
	bl sub_081515D8
	adds r2, r0, r4
	asrs r2, r2, #8
	movs r1, #0x7f
	adds r0, r2, #0
	ands r0, r1
	mov r1, r8
	adds r1, #0x70
	strh r0, [r1]
	lsls r2, r2, #8
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r2, #0
	bl sub_081515D8
	adds r2, r0, #0
	ldrb r1, [r5, #9]
	ldr r0, [r5, #0x1c]
	muls r0, r1, r0
	lsls r4, r0, #8
	adds r0, r4, #0
	adds r1, r2, #0
	bl sub_08151550
	adds r4, r0, #0
	asrs r0, r4, #8
	str r0, [r5, #0x68]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	mov r1, r8
	adds r1, #0x8f
	strb r0, [r1]
	movs r2, #0
	mov sb, r2
	adds r7, r1, #0
	ldrb r3, [r5, #9]
	cmp sb, r3
	blo _08023BFC
	b _08023DF4
_08023BFC:
	mov r0, r8
	adds r0, #0x88
	add r0, sb
	mov r5, sb
	strb r5, [r0]
	mov r0, r8
	adds r0, #0x90
	add r0, sb
	strb r5, [r0]
	mov r6, sb
	lsls r2, r6, #1
	mov r1, r8
	adds r1, #0x74
	adds r1, r1, r2
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	mov r5, r8
	adds r3, r5, r0
	adds r5, r3, #0
	adds r5, #0xaa
	ldrh r0, [r5]
	strh r0, [r1]
	mov r1, r8
	adds r1, #0x72
	ldrh r6, [r1]
	adds r0, r0, r6
	strh r0, [r1]
	ldrb r0, [r7]
	adds r6, r2, #0
	cmp r0, #1
	beq _08023C6A
	cmp r0, #1
	bgt _08023C46
	cmp r0, #0
	beq _08023C4C
	b _08023CC4
_08023C46:
	cmp r0, #2
	beq _08023C88
	b _08023CC4
_08023C4C:
	ldrh r0, [r5]
	cmp r0, #0
	beq _08023C8E
	adds r0, r3, #0
	adds r0, #0xa8
	ldrh r2, [r0]
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r1, #0xc8
	lsls r1, r1, #7
	bl sub_08151550
	adds r2, r0, #0
	ldrh r4, [r5]
	b _08023CBA
_08023C6A:
	ldrh r0, [r5]
	cmp r0, #0
	beq _08023C8E
	adds r0, r3, #0
	adds r0, #0xac
	ldrh r2, [r0]
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r1, #0xc8
	lsls r1, r1, #7
	bl sub_08151550
	adds r2, r0, #0
	ldrh r4, [r5]
	b _08023CBA
_08023C88:
	ldrh r0, [r5]
	cmp r0, #0
	bne _08023C92
_08023C8E:
	movs r4, #0
	b _08023CC4
_08023C92:
	adds r1, r3, #0
	adds r1, #0xae
	ldrh r0, [r1]
	mov r2, r8
	ldrh r2, [r2, #0x28]
	cmp r0, r2
	blo _08023CA6
	movs r4, #0xc8
	lsls r4, r4, #7
	b _08023CC4
_08023CA6:
	ldrh r2, [r1]
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r1, #0xc8
	lsls r1, r1, #7
	bl sub_08151550
	adds r2, r0, #0
	mov r3, r8
	ldrh r4, [r3, #0x28]
_08023CBA:
	lsls r4, r4, #8
	adds r1, r4, #0
	bl sub_081515D8
	adds r4, r0, #0
_08023CC4:
	asrs r4, r4, #4
	mov r0, r8
	adds r0, #0x7e
	adds r0, r0, r6
	strh r4, [r0]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r5, r8
	ldrb r5, [r5, #9]
	cmp sb, r5
	blo _08023BFC
	b _08023DF4
_08023CE2:
	movs r6, #0
	mov sb, r6
	mov r1, r8
	ldrb r0, [r1, #9]
	subs r0, #1
	adds r1, #0x68
	str r1, [sp, #0xc]
	cmp sb, r0
	bge _08023D82
_08023CF4:
	mov r2, r8
	ldrb r0, [r2, #9]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r3, sb
	adds r3, #1
	str r3, [sp, #8]
	cmp r4, sb
	bls _08023D70
	adds r2, #0x74
	str r2, [sp]
	mov r5, r8
	adds r5, #0x88
	str r5, [sp, #4]
	movs r6, #0x90
	add r6, r8
	mov sl, r6
	movs r0, #0x7e
	add r0, r8
	mov ip, r0
_08023D1E:
	subs r7, r4, #1
	lsls r6, r7, #1
	ldr r1, [sp]
	adds r3, r1, r6
	lsls r5, r4, #1
	adds r1, r1, r5
	ldrh r2, [r3]
	ldrh r0, [r1]
	cmp r2, r0
	bhs _08023D46
	ldrh r0, [r1]
	strh r2, [r1]
	strh r0, [r3]
	ldr r1, [sp, #4]
	adds r2, r1, r4
	ldrb r3, [r2]
	adds r1, r1, r7
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
_08023D46:
	mov r2, ip
	adds r3, r2, r6
	adds r1, r2, r5
	ldrh r2, [r3]
	ldrh r5, [r1]
	cmp r2, r5
	bhs _08023D68
	ldrh r0, [r1]
	strh r2, [r1]
	strh r0, [r3]
	mov r6, sl
	adds r2, r6, r4
	ldrb r3, [r2]
	adds r1, r6, r7
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
_08023D68:
	lsls r0, r7, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	bhi _08023D1E
_08023D70:
	ldr r1, [sp, #8]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r2, r8
	ldrb r0, [r2, #9]
	subs r0, #1
	cmp sb, r0
	blt _08023CF4
_08023D82:
	movs r0, #0
	ldr r1, [sp, #0xc]
	movs r2, #0x30
	bl SendBlock
	b _08023DF4
_08023D8E:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023DFC
	movs r0, #0
	mov r3, r8
	strh r0, [r3, #0x10]
	b _08023DF4
_08023DA0:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08023DFC
	mov r4, r8
	adds r4, #0x68
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x30
	bl memset
	ldr r1, _08023DD0
	adds r0, r4, #0
	movs r2, #0x30
	bl memcpy
	bl ResetBlockReceivedFlags
	movs r0, #0
	mov r5, r8
	strh r0, [r5, #0x10]
	b _08023DF4
	.align 2, 0
_08023DD0: .4byte 0x0202207C
_08023DD4:
	bl sub_08020B74
	movs r0, #0x12
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r0, #0
	movs r1, #0xb
	mov r6, r8
	strh r1, [r6, #0x12]
	strb r0, [r6, #0xc]
	mov r1, r8
	adds r1, #0x24
	strb r0, [r1]
	b _08023DFC
_08023DF4:
	mov r1, r8
	ldrb r0, [r1, #0xc]
	adds r0, #1
_08023DFA:
	strb r0, [r1, #0xc]
_08023DFC:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08023A40

	thumb_func_start sub_08023E10
sub_08023E10: @ 0x08023E10
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r0, [r5, #0xc]
	cmp r0, #4
	bhi _08023EEC
	lsls r0, r0, #2
	ldr r1, _08023E28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023E28: .4byte 0x08023E2C
_08023E2C: @ jump table
	.4byte _08023E40 @ case 0
	.4byte _08023E52 @ case 1
	.4byte _08023E64 @ case 2
	.4byte _08023E94 @ case 3
	.4byte _08023EA4 @ case 4
_08023E40:
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r0, r5, #0
	bl sub_08021DDC
	cmp r0, #0
	bne _08023EEC
	b _08023EF2
_08023E52:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x1e
	strb r0, [r1]
	b _08023EEC
_08023E64:
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08023E76
	subs r0, #1
	strb r0, [r1]
	b _08023EF2
_08023E76:
	ldr r0, _08023E90
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08023EF2
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_08021F9C
	b _08023EEC
	.align 2, 0
_08023E90: .4byte 0x03002360
_08023E94:
	ldrh r0, [r5, #0x12]
	cmp r0, #0xc
	bhi _08023EEC
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #0x12]
	strb r1, [r5, #0xc]
	b _08023EF2
_08023EA4:
	ldr r0, _08023EE4
	ldr r1, [r5, #0x1c]
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	ldr r4, _08023EE8
	bl GetBerryPowder
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	movs r4, #0
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl sub_08024410
	movs r0, #0x13
	strb r0, [r5, #0xe]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	strb r4, [r5, #0xc]
	b _08023EF2
	.align 2, 0
_08023EE4: .4byte 0x02021C40
_08023EE8: .4byte 0x02021C54
_08023EEC:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
_08023EF2:
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08023E10

	thumb_func_start sub_08023EFC
sub_08023EFC: @ 0x08023EFC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r5, #0xc]
	cmp r0, #4
	bhi _08023FE0
	lsls r0, r0, #2
	ldr r1, _08023F14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023F14: .4byte 0x08023F18
_08023F18: @ jump table
	.4byte _08023F2C @ case 0
	.4byte _08023F68 @ case 1
	.4byte _08023F6E @ case 2
	.4byte _08023FB8 @ case 3
	.4byte _08023FCC @ case 4
_08023F2C:
	ldrh r1, [r5, #0x28]
	ldr r0, _08023F64
	cmp r1, r0
	bls _08023F3E
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r5, r1
	bl sub_080222B4
_08023F3E:
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	movs r3, #0
	bl sub_08024410
	movs r4, #0
	movs r0, #0x13
	strb r0, [r5, #0xe]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	strb r4, [r5, #0xc]
	b _08023FE6
	.align 2, 0
_08023F64: .4byte 0x00008C9F
_08023F68:
	bl sub_0800FF34
	b _08023FE0
_08023F6E:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023FE6
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _08023FB0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized2
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _08023FB4
	movs r1, #0
	bl CreateTask
	b _08023FE0
	.align 2, 0
_08023FB0: .4byte 0x08277071
_08023FB4: .4byte 0x081535C5
_08023FB8:
	ldr r0, _08023FC8
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023FE0
	b _08023FE6
	.align 2, 0
_08023FC8: .4byte 0x081535C5
_08023FCC:
	movs r0, #0x14
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r1, #0
	movs r0, #0xf
	strh r0, [r5, #0x12]
	strb r1, [r5, #0xc]
	b _08023FE6
_08023FE0:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
_08023FE6:
	movs r0, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08023EFC

	thumb_func_start sub_08023FF0
sub_08023FF0: @ 0x08023FF0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	beq _08024032
	cmp r0, #1
	bgt _08024008
	cmp r0, #0
	beq _0802400E
	b _08024098
_08024008:
	cmp r0, #2
	beq _08024038
	b _08024098
_0802400E:
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0
	movs r3, #0
	bl sub_08024410
	movs r0, #0x14
	strb r0, [r5, #0xe]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r0, #0
	strb r0, [r5, #0xc]
	b _080240A0
_08024032:
	bl DisplayYesNoMenuDefaultYes
	b _08024098
_08024038:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0802409E
	adds r0, r5, #0
	adds r0, #0x42
	movs r1, #0
	movs r2, #0xc
	bl memset
	cmp r4, #0
	bne _0802406A
	bl HasAtLeastOneBerry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024066
	strh r4, [r5, #0x14]
	b _0802406E
_08024066:
	movs r0, #3
	b _0802406C
_0802406A:
	movs r0, #1
_0802406C:
	strh r0, [r5, #0x14]
_0802406E:
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	movs r4, #0
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #8
	movs r2, #0
	movs r3, #0
	bl sub_08024410
	movs r0, #0x15
	strb r0, [r5, #0xe]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	strb r4, [r5, #0xc]
	b _0802409E
_08024098:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
_0802409E:
	movs r0, #0
_080240A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08023FF0

	thumb_func_start sub_080240A8
sub_080240A8: @ 0x080240A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r5, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	beq _080240CE
	cmp r0, #1
	bgt _080240BE
	cmp r0, #0
	beq _080240C8
	b _08024174
_080240BE:
	cmp r0, #2
	beq _080240F0
	cmp r0, #3
	beq _080240FE
	b _08024174
_080240C8:
	bl sub_0800FF34
	b _08024174
_080240CE:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802417A
	ldrh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x42
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r5, [r0]
	movs r0, #0
	movs r2, #2
	bl SendBlock
	b _08024174
_080240F0:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802417A
	strh r5, [r4, #0x10]
	b _08024174
_080240FE:
	bl GetBlockReceivedStatus
	ldr r2, _08024150
	ldrb r3, [r4, #9]
	subs r1, r3, #2
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _0802417A
	adds r7, r4, #0
	adds r7, #0x42
	adds r6, r4, #0
	adds r6, #0x4e
	cmp r5, r3
	bhs _0802413C
	adds r1, r6, #0
	ldr r2, _08024154
_08024124:
	lsls r0, r5, #8
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4, #9]
	cmp r5, r0
	blo _08024124
_0802413C:
	ldrh r0, [r6]
	cmp r0, #0
	beq _08024158
	movs r0, #0x17
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	b _08024162
	.align 2, 0
_08024150: .4byte 0x082C7CD4
_08024154: .4byte 0x0202207C
_08024158:
	movs r0, #0x16
	movs r1, #1
	movs r2, #0
	bl sub_08022950
_08024162:
	bl ResetBlockReceivedFlags
	movs r1, #0
	movs r0, #0
	strh r0, [r7]
	strh r0, [r6]
	strh r0, [r4, #0x10]
	strb r1, [r4, #0xc]
	b _0802417C
_08024174:
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
_0802417A:
	movs r0, #0
_0802417C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080240A8

	thumb_func_start sub_08024184
sub_08024184: @ 0x08024184
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r4, [r5, #0xc]
	cmp r4, #1
	beq _080241B2
	cmp r4, #1
	bgt _0802419A
	cmp r4, #0
	beq _080241A4
	b _080241FC
_0802419A:
	cmp r4, #2
	beq _080241BE
	cmp r4, #3
	beq _080241E2
	b _080241FC
_080241A4:
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0x10
	b _080241D8
_080241B2:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080241FC
	b _08024202
_080241BE:
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	adds r0, r5, #0
	bl sub_080211B4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
_080241D8:
	bl BeginNormalPaletteFade
	bl UpdatePaletteFade
	b _080241FC
_080241E2:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024202
	movs r0, #7
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	movs r0, #0
	strh r4, [r5, #0x12]
	b _08024200
_080241FC:
	ldrb r0, [r5, #0xc]
	adds r0, #1
_08024200:
	strb r0, [r5, #0xc]
_08024202:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08024184

	thumb_func_start sub_0802420C
sub_0802420C: @ 0x0802420C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldrb r4, [r5, #0xc]
	cmp r4, #1
	beq _08024284
	cmp r4, #1
	bgt _08024222
	cmp r4, #0
	beq _08024228
	b _080242BE
_08024222:
	cmp r4, #2
	beq _0802429C
	b _080242BE
_08024228:
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldrh r1, [r5, #0x14]
	cmp r1, #3
	bne _08024258
	ldr r0, _08024254
	ldr r2, [r0, #0x14]
	ldrb r3, [r5, #0xb]
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized2
	b _08024274
	.align 2, 0
_08024254: .4byte 0x082C5EBC
_08024258:
	ldr r0, _08024280
	ldr r2, [r0, #0x18]
	ldrb r3, [r5, #0xb]
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized2
_08024274:
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	b _080242BE
	.align 2, 0
_08024280: .4byte 0x082C5EBC
_08024284:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080242C4
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x78
	strb r0, [r1]
	b _080242BE
_0802429C:
	movs r0, #0x92
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _080242B0
	subs r0, #1
	strb r0, [r1]
	b _080242C4
_080242B0:
	movs r0, #0x18
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	strb r4, [r5, #0xc]
	b _080242C4
_080242BE:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
_080242C4:
	movs r0, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802420C

	thumb_func_start sub_080242D0
sub_080242D0: @ 0x080242D0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r4, [r5, #0xc]
	cmp r4, #1
	beq _080242F0
	cmp r4, #1
	bgt _080242E4
	cmp r4, #0
	beq _080242EA
	b _08024320
_080242E4:
	cmp r4, #2
	beq _08024300
	b _08024320
_080242EA:
	bl sub_0800FF34
	b _08024320
_080242F0:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024326
	bl sub_0800A7F8
	b _08024320
_08024300:
	ldr r0, _0802431C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024326
	movs r0, #0x19
	strb r0, [r5, #0xe]
	movs r0, #5
	movs r1, #1
	movs r2, #0
	bl sub_08022950
	strb r4, [r5, #0xc]
	b _08024326
	.align 2, 0
_0802431C: .4byte 0x030031C4
_08024320:
	ldrb r0, [r5, #0xc]
	adds r0, #1
	strb r0, [r5, #0xc]
_08024326:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080242D0

	thumb_func_start sub_08024330
sub_08024330: @ 0x08024330
	push {lr}
	movs r0, #0
	bl sub_08020924
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08024330

	thumb_func_start sub_08024340
sub_08024340: @ 0x08024340
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	movs r0, #0x33
	bl IncrementGameStat
	strb r5, [r4, #0xd]
	movs r1, #0
	strh r5, [r4, #0x10]
	movs r0, #2
	strh r0, [r4, #0x12]
	strh r5, [r4, #0x14]
	str r5, [r4, #0x1c]
	strh r5, [r4, #0x18]
	strh r5, [r4, #0x1a]
	str r5, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
	strb r0, [r1]
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x28]
	strh r5, [r4, #0x2e]
	ldr r0, _080243CC
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x30]
	strh r5, [r4, #0x34]
	movs r6, #0
	movs r3, #0
_08024380:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r2, r4, r0
	adds r1, r2, #0
	adds r1, #0xa0
	ldr r0, _080243CC
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0xa2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r1, #6
	movs r0, #1
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0xa8
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08024380
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080243CC: .4byte 0x0000FFFF
	thumb_func_end sub_08024340

	thumb_func_start sub_080243D0
sub_080243D0: @ 0x080243D0
	push {r4, r5, r6, lr}
	sub sp, #8
	str r2, [sp, #4]
	ldr r5, [sp, #0x18]
	ldr r6, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	mov r2, sp
	strh r4, [r2]
	add r4, sp, #4
	ldrb r2, [r4]
	strb r2, [r0]
	ldrb r2, [r4, #1]
	strb r2, [r0, #1]
	ldrb r2, [r4, #2]
	strb r2, [r0, #2]
	ldrb r2, [r4, #3]
	strb r2, [r0, #3]
	strb r3, [r0, #4]
	strb r5, [r0, #5]
	strb r6, [r0, #6]
	mov r2, sp
	ldrb r2, [r2]
	strb r2, [r0, #7]
	mov r2, sp
	ldrb r2, [r2, #1]
	strb r2, [r0, #8]
	strb r1, [r0, #9]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080243D0

	thumb_func_start sub_08024410
sub_08024410: @ 0x08024410
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, [sp, #0x10]
	mov r4, sp
	strh r3, [r4]
	strb r1, [r0]
	strb r2, [r0, #1]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r1, [r1, #1]
	strb r1, [r0, #3]
	strb r5, [r0, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08024410

