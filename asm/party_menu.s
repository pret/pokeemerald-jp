.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitPartyMenu
InitPartyMenu: @ 0x081AFD10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	lsls r4, r4, #0x18
	lsrs r6, r4, #0x18
	bl reset_brm
	ldr r0, _081AFD5C
	mov sl, r0
	movs r0, #0x8e
	lsls r0, r0, #2
	bl Alloc
	adds r5, r0, #0
	mov r1, sl
	str r5, [r1]
	cmp r5, #0
	bne _081AFD60
	ldr r0, [sp, #0x2c]
	bl SetMainCallback2
	b _081AFE6C
	.align 2, 0
_081AFD5C: .4byte 0x0203CB90
_081AFD60:
	ldr r3, _081AFDC4
	movs r1, #0xf
	mov r4, r8
	ands r1, r4
	ldrb r2, [r3, #8]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	ldr r0, [sp, #0x2c]
	str r0, [r3]
	movs r4, #0
	strb r7, [r3, #0xb]
	lsls r2, r6, #2
	ldrh r1, [r5, #0xa]
	movs r0, #3
	ands r0, r1
	orrs r0, r2
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x28]
	str r0, [r5]
	str r4, [r5, #4]
	ldrb r1, [r5, #8]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #8]
	mov r1, sl
	ldr r2, [r1]
	ldrh r0, [r2, #8]
	movs r4, #0xfe
	lsls r4, r4, #3
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xfe
	lsls r1, r1, #0xa
	orrs r0, r1
	str r0, [r2, #8]
	adds r6, r3, #0
	mov r5, r8
	cmp r5, #4
	bne _081AFDC8
	ldrb r0, [r2, #8]
	movs r1, #1
	orrs r0, r1
	b _081AFDD0
	.align 2, 0
_081AFDC4: .4byte 0x0203CB94
_081AFDC8:
	ldrb r1, [r2, #8]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
_081AFDD0:
	strb r0, [r2, #8]
	mov r0, sb
	cmp r0, #0xff
	beq _081AFDEC
	movs r0, #3
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #4
	ldrb r2, [r6, #8]
	movs r1, #0x31
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #8]
_081AFDEC:
	movs r2, #0
	ldr r5, _081AFE30
	movs r4, #0x86
	lsls r4, r4, #2
	movs r3, #0
_081AFDF6:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r0, r0, r4
	adds r0, r0, r1
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _081AFDF6
	movs r2, #0
	ldr r4, _081AFE30
	movs r3, #0xff
_081AFE10:
	ldr r0, [r4]
	adds r0, #0xc
	adds r0, r0, r2
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #2
	bls _081AFE10
	ldr r4, [sp]
	cmp r4, #0
	bne _081AFE34
	strb r4, [r6, #9]
	b _081AFE56
	.align 2, 0
_081AFE30: .4byte 0x0203CB90
_081AFE34:
	adds r1, r6, #0
	movs r0, #9
	ldrsb r0, [r1, r0]
	cmp r0, #5
	bgt _081AFE52
	adds r1, r0, #0
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081AFE7C
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	bne _081AFE56
_081AFE52:
	movs r0, #0
	strb r0, [r6, #9]
_081AFE56:
	ldr r2, _081AFE80
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl CalculatePlayerPartyCount
	ldr r0, _081AFE84
	bl SetMainCallback2
_081AFE6C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081AFE7C: .4byte 0x02024190
_081AFE80: .4byte 0x030030B4
_081AFE84: .4byte 0x081AFEB9
	thumb_func_end InitPartyMenu

	thumb_func_start PartyMenuCallback
PartyMenuCallback: @ 0x081AFE88
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PartyMenuCallback

	thumb_func_start PartyMenuVBlankCallback
PartyMenuVBlankCallback: @ 0x081AFEA4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PartyMenuVBlankCallback

	thumb_func_start PartyMenuInitCallback
PartyMenuInitCallback: @ 0x081AFEB8
	push {lr}
_081AFEBA:
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AFEDE
	bl PartyMenuSetup
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081AFEDE
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081AFEBA
_081AFEDE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PartyMenuInitCallback

	thumb_func_start PartyMenuSetup
PartyMenuSetup: @ 0x081AFEE4
	push {r4, lr}
	sub sp, #4
	ldr r1, _081AFF04
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x16
	bls _081AFEFA
	b _081B0170
_081AFEFA:
	lsls r0, r0, #2
	ldr r1, _081AFF08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081AFF04: .4byte 0x03002360
_081AFF08: .4byte 0x081AFF0C
_081AFF0C: @ jump table
	.4byte _081AFF68 @ case 0
	.4byte _081AFF84 @ case 1
	.4byte _081AFF8A @ case 2
	.4byte _081AFFAC @ case 3
	.4byte _081AFFB2 @ case 4
	.4byte _081AFFC4 @ case 5
	.4byte _081AFFD6 @ case 6
	.4byte _081AFFE8 @ case 7
	.4byte _081B0010 @ case 8
	.4byte _081B002C @ case 9
	.4byte _081B0040 @ case 10
	.4byte _081B0064 @ case 11
	.4byte _081B0078 @ case 12
	.4byte _081B007E @ case 13
	.4byte _081B0090 @ case 14
	.4byte _081B0096 @ case 15
	.4byte _081B00B8 @ case 16
	.4byte _081B00D8 @ case 17
	.4byte _081B00EC @ case 18
	.4byte _081B0100 @ case 19
	.4byte _081B0108 @ case 20
	.4byte _081B0124 @ case 21
	.4byte _081B014C @ case 22
_081AFF68:
	bl SetVBlankHBlankCallbacksToNull
	bl ResetVramOamAndBgCntRegs
	bl clear_scheduled_bg_copies_to_vram
	ldr r1, _081AFF80
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081AFF80: .4byte 0x03002360
_081AFF84:
	bl ScanlineEffect_Stop
	b _081B015C
_081AFF8A:
	bl ResetPaletteFade
	ldr r2, _081AFFA4
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r1, _081AFFA8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081AFFA4: .4byte 0x02037C74
_081AFFA8: .4byte 0x03002360
_081AFFAC:
	bl ResetSpriteData
	b _081B015C
_081AFFB2:
	bl FreeAllSpritePalettes
	ldr r1, _081AFFC0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081AFFC0: .4byte 0x03002360
_081AFFC4:
	bl sub_081221B8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081AFFD0
	b _081B015C
_081AFFD0:
	bl ResetTasks
	b _081B015C
_081AFFD6:
	bl sub_081B1D6C
	ldr r1, _081AFFE4
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081AFFE4: .4byte 0x03002360
_081AFFE8:
	bl AllocPartyMenuBg
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081AFFFA
	bl PartyMenuExit
	movs r0, #1
	b _081B018A
_081AFFFA:
	ldr r0, _081B000C
	ldr r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081B015C
	.align 2, 0
_081B000C: .4byte 0x0203CB90
_081B0010:
	bl AllocPartyMiscGfx
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B001C
	b _081B0188
_081B001C:
	ldr r1, _081B0028
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081B0028: .4byte 0x03002360
_081B002C:
	ldr r0, _081B003C
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	bl sub_081B206C
	b _081B015C
	.align 2, 0
_081B003C: .4byte 0x0203CB94
_081B0040:
	ldr r0, _081B005C
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	bl PartyMenuInitHelperStructs
	ldr r0, _081B0060
	ldr r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081B015C
	.align 2, 0
_081B005C: .4byte 0x0203CB94
_081B0060: .4byte 0x0203CB90
_081B0064:
	bl LoadHeldItemIcons
	ldr r1, _081B0074
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081B0074: .4byte 0x03002360
_081B0078:
	bl LoadPartyMenuPokeballGfx
	b _081B015C
_081B007E:
	bl LoadPartyMenuAilmentGfx
	ldr r1, _081B008C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081B008C: .4byte 0x03002360
_081B0090:
	bl LoadMonIconPalettes
	b _081B015C
_081B0096:
	bl party_menu_add_per_mon_objects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B00A2
	b _081B0188
_081B00A2:
	ldr r0, _081B00B4
	ldr r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081B015C
	.align 2, 0
_081B00B4: .4byte 0x0203CB90
_081B00B8:
	bl RenderPartyMenuBoxes
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B0188
	ldr r0, _081B00D4
	ldr r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	b _081B015C
	.align 2, 0
_081B00D4: .4byte 0x0203CB90
_081B00D8:
	bl sub_081B0BF8
	ldr r1, _081B00E8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081B00E8: .4byte 0x03002360
_081B00EC:
	ldr r0, _081B00FC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_081B20F8
	b _081B015C
	.align 2, 0
_081B00FC: .4byte 0x0203CB90
_081B0100:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	b _081B0164
_081B0108:
	ldr r4, _081B0120
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl CreateTask
	ldr r0, [r4]
	ldrh r0, [r0, #0xa]
	lsrs r0, r0, #2
	bl display_pokemon_menu_message
	b _081B015C
	.align 2, 0
_081B0120: .4byte 0x0203CB90
_081B0124:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r2, _081B0144
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	ldr r1, _081B0148
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _081B0164
	.align 2, 0
_081B0144: .4byte 0x02037C74
_081B0148: .4byte 0x03002360
_081B014C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_081B015C:
	ldr r1, _081B016C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_081B0164:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _081B0188
	.align 2, 0
_081B016C: .4byte 0x03002360
_081B0170:
	ldr r0, _081B0180
	bl SetVBlankCallback
	ldr r0, _081B0184
	bl SetMainCallback2
	movs r0, #1
	b _081B018A
	.align 2, 0
_081B0180: .4byte 0x081AFEA5
_081B0184: .4byte 0x081AFE89
_081B0188:
	movs r0, #0
_081B018A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PartyMenuSetup

	thumb_func_start PartyMenuExit
PartyMenuExit: @ 0x081B0194
	push {lr}
	sub sp, #4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _081B01C4
	movs r1, #0
	bl CreateTask
	ldr r0, _081B01C8
	bl SetVBlankCallback
	ldr r0, _081B01CC
	bl SetMainCallback2
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_081B01C4: .4byte 0x081B01D1
_081B01C8: .4byte 0x081AFEA5
_081B01CC: .4byte 0x081AFE89
	thumb_func_end PartyMenuExit

	thumb_func_start PartyMenuExitTask
PartyMenuExitTask: @ 0x081B01D0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B01FC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B01F4
	ldr r0, _081B0200
	ldr r0, [r0]
	bl SetMainCallback2
	bl FreePartyPointers
	adds r0, r4, #0
	bl DestroyTask
_081B01F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B01FC: .4byte 0x02037C74
_081B0200: .4byte 0x0203CB94
	thumb_func_end PartyMenuExitTask

	thumb_func_start reset_brm
reset_brm: @ 0x081B0204
	ldr r0, _081B0218
	movs r1, #0
	str r1, [r0]
	ldr r0, _081B021C
	str r1, [r0]
	ldr r0, _081B0220
	str r1, [r0]
	ldr r0, _081B0224
	str r1, [r0]
	bx lr
	.align 2, 0
_081B0218: .4byte 0x0203CB90
_081B021C: .4byte 0x0203CBB0
_081B0220: .4byte 0x0203CBA8
_081B0224: .4byte 0x0203CBAC
	thumb_func_end reset_brm

	thumb_func_start AllocPartyMenuBg
AllocPartyMenuBg: @ 0x081B0228
	push {r4, r5, lr}
	ldr r5, _081B0290
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl Alloc
	str r0, [r5]
	cmp r0, #0
	beq _081B0298
	movs r1, #0
	adds r2, r4, #0
	bl memset
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081B0294
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r1, [r5]
	movs r0, #1
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #1
	b _081B029A
	.align 2, 0
_081B0290: .4byte 0x0203CBB0
_081B0294: .4byte 0x085E0F70
_081B0298:
	movs r0, #0
_081B029A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end AllocPartyMenuBg

	thumb_func_start AllocPartyMiscGfx
AllocPartyMiscGfx: @ 0x081B02A0
	push {r4, lr}
	sub sp, #4
	ldr r0, _081B02C0
	ldr r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #7
	bhi _081B0388
	lsls r0, r0, #2
	ldr r1, _081B02C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B02C0: .4byte 0x0203CB90
_081B02C4: .4byte 0x081B02C8
_081B02C8: @ jump table
	.4byte _081B02E8 @ case 0
	.4byte _081B0310 @ case 1
	.4byte _081B0330 @ case 2
	.4byte _081B035C @ case 3
	.4byte _081B0360 @ case 4
	.4byte _081B0364 @ case 5
	.4byte _081B0368 @ case 6
	.4byte _081B036C @ case 7
_081B02E8:
	ldr r4, _081B0308
	ldr r0, _081B030C
	mov r1, sp
	bl malloc_and_decompress
	adds r1, r0, #0
	str r1, [r4]
	ldr r2, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r3, #0
	bl LoadBgTiles
	b _081B0372
	.align 2, 0
_081B0308: .4byte 0x0203CBAC
_081B030C: .4byte 0x08D967A0
_081B0310:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B038C
	ldr r0, _081B0328
	ldr r1, _081B032C
	ldr r1, [r1]
	bl LZDecompressVram
	b _081B0372
	.align 2, 0
_081B0328: .4byte 0x08D96B54
_081B032C: .4byte 0x0203CBB0
_081B0330:
	ldr r0, _081B0350
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl LoadCompressedPalette
	ldr r0, _081B0354
	ldr r4, _081B0358
	ldr r1, [r4]
	adds r1, #0x18
	movs r2, #0xb0
	bl CpuSet
	ldr r1, [r4]
	b _081B0376
	.align 2, 0
_081B0350: .4byte 0x08D96A68
_081B0354: .4byte 0x020373B4
_081B0358: .4byte 0x0203CB90
_081B035C:
	movs r0, #4
	b _081B036E
_081B0360:
	movs r0, #5
	b _081B036E
_081B0364:
	movs r0, #6
	b _081B036E
_081B0368:
	movs r0, #7
	b _081B036E
_081B036C:
	movs r0, #8
_081B036E:
	bl PartyPaletteBufferCopy
_081B0372:
	ldr r0, _081B0384
	ldr r1, [r0]
_081B0376:
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _081B038C
	.align 2, 0
_081B0384: .4byte 0x0203CB90
_081B0388:
	movs r0, #1
	b _081B038E
_081B038C:
	movs r0, #0
_081B038E:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AllocPartyMiscGfx

	thumb_func_start PartyPaletteBufferCopy
PartyPaletteBufferCopy: @ 0x081B0398
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x1c
	ldr r5, _081B03C4
	lsrs r4, r4, #0x17
	adds r1, r5, #0
	subs r1, #0x60
	adds r1, r4, r1
	adds r0, r5, #0
	movs r2, #0x10
	bl CpuSet
	ldr r0, _081B03C8
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B03C4: .4byte 0x02037414
_081B03C8: .4byte 0x020377B4
	thumb_func_end PartyPaletteBufferCopy

	thumb_func_start FreePartyPointers
FreePartyPointers: @ 0x081B03CC
	push {lr}
	ldr r0, _081B0408
	ldr r0, [r0]
	cmp r0, #0
	beq _081B03DA
	bl Free
_081B03DA:
	ldr r0, _081B040C
	ldr r0, [r0]
	cmp r0, #0
	beq _081B03E6
	bl Free
_081B03E6:
	ldr r0, _081B0410
	ldr r0, [r0]
	cmp r0, #0
	beq _081B03F2
	bl Free
_081B03F2:
	ldr r0, _081B0414
	ldr r0, [r0]
	cmp r0, #0
	beq _081B03FE
	bl Free
_081B03FE:
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
_081B0408: .4byte 0x0203CB90
_081B040C: .4byte 0x0203CBB0
_081B0410: .4byte 0x0203CBAC
_081B0414: .4byte 0x0203CBA8
	thumb_func_end FreePartyPointers

	thumb_func_start PartyMenuInitHelperStructs
PartyMenuInitHelperStructs: @ 0x081B0418
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _081B0498
	movs r0, #0x60
	bl Alloc
	str r0, [r4]
	movs r5, #0
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	mov r8, r0
	movs r6, #0xff
	mov sb, r4
_081B043C:
	ldr r2, [r4]
	lsls r3, r5, #4
	adds r2, r3, r2
	ldr r0, _081B049C
	mov ip, r0
	str r0, [r2]
	lsls r0, r5, #3
	ldr r1, _081B04A0
	adds r0, r0, r1
	add r0, r8
	str r0, [r2, #4]
	strb r5, [r2, #8]
	ldr r1, [r4]
	adds r1, r3, r1
	ldrb r0, [r1, #9]
	orrs r0, r6
	strb r0, [r1, #9]
	ldr r1, [r4]
	adds r1, r3, r1
	ldrb r0, [r1, #0xa]
	orrs r0, r6
	strb r0, [r1, #0xa]
	ldr r1, [r4]
	adds r1, r3, r1
	ldrb r0, [r1, #0xb]
	orrs r0, r6
	strb r0, [r1, #0xb]
	ldr r0, [r4]
	adds r3, r3, r0
	ldrb r0, [r3, #0xc]
	orrs r0, r6
	strb r0, [r3, #0xc]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _081B043C
	mov r1, sb
	ldr r0, [r1]
	mov r1, ip
	subs r1, #0x20
	str r1, [r0]
	cmp r7, #3
	bne _081B04A4
	str r1, [r0, #0x30]
	b _081B04AA
	.align 2, 0
_081B0498: .4byte 0x0203CBA8
_081B049C: .4byte 0x085E0F9C
_081B04A0: .4byte 0x085E0FBC
_081B04A4:
	cmp r7, #0
	beq _081B04AA
	str r1, [r0, #0x10]
_081B04AA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PartyMenuInitHelperStructs

	thumb_func_start RenderPartyMenuBox
RenderPartyMenuBox: @ 0x081B04B8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081B04F4
	ldrb r1, [r0, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #5
	bne _081B0534
	cmp r5, #2
	bls _081B0534
	adds r0, r5, #0
	bl sub_081B09C4
	ldr r0, _081B04F8
	subs r1, r5, #3
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _081B0500
	ldr r0, _081B04FC
	lsls r4, r5, #4
	ldr r0, [r0]
	adds r0, r0, r4
	movs r1, #0x40
	bl UpdateSelectedPartyBox
	b _081B050E
	.align 2, 0
_081B04F4: .4byte 0x0203CB94
_081B04F8: .4byte 0x02022C9C
_081B04FC: .4byte 0x0203CBA8
_081B0500:
	ldr r0, _081B0530
	lsls r4, r5, #4
	ldr r0, [r0]
	adds r0, r0, r4
	movs r1, #8
	bl UpdateSelectedPartyBox
_081B050E:
	adds r5, r4, #0
	ldr r4, _081B0530
	ldr r0, [r4]
	adds r0, r5, r0
	ldrb r0, [r0, #8]
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, [r4]
	adds r0, r5, r0
	ldrb r0, [r0, #8]
	bl PutWindowTilemap
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	b _081B0616
	.align 2, 0
_081B0530: .4byte 0x0203CBA8
_081B0534:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081B056C
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	bne _081B0574
	ldr r4, _081B0570
	ldr r0, [r4]
	lsls r5, r5, #4
	adds r0, r5, r0
	ldrb r0, [r0, #8]
	bl DrawEmptySlot
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0x40
	bl UpdateSelectedPartyBox
	ldr r0, [r4]
	adds r0, r5, r0
	ldrb r0, [r0, #8]
	movs r1, #2
	bl CopyWindowToVram
	b _081B0604
	.align 2, 0
_081B056C: .4byte 0x02024190
_081B0570: .4byte 0x0203CBA8
_081B0574:
	ldr r0, _081B0588
	ldrb r0, [r0, #8]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #7
	bne _081B058C
	adds r0, r5, #0
	bl DisplayPartyPokemonSelectForRelearner
	b _081B05CE
	.align 2, 0
_081B0588: .4byte 0x0203CB94
_081B058C:
	cmp r1, #2
	bne _081B0598
	adds r0, r5, #0
	bl DisplayPartyPokemonSelectForContest
	b _081B05CE
_081B0598:
	cmp r1, #4
	bne _081B05A4
	adds r0, r5, #0
	bl DisplayPartyPokemonSelectForBattle
	b _081B05CE
_081B05A4:
	cmp r1, #0xb
	bne _081B05B0
	adds r0, r5, #0
	bl sub_081B0870
	b _081B05CE
_081B05B0:
	cmp r1, #0xc
	bne _081B05BC
	adds r0, r5, #0
	bl DisplayPartyPokemonSelectHeldItemRelated
	b _081B05CE
_081B05BC:
	adds r0, r5, #0
	bl sub_081B08D4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B05CE
	adds r0, r5, #0
	bl DisplayPartyPokemonData
_081B05CE:
	ldr r2, _081B05E4
	ldrb r1, [r2, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #5
	bne _081B05E8
	adds r0, r5, #0
	movs r1, #0
	bl sub_081B0C9C
	b _081B0602
	.align 2, 0
_081B05E4: .4byte 0x0203CB94
_081B05E8:
	movs r0, #9
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _081B05FA
	adds r0, r5, #0
	movs r1, #1
	bl sub_081B0C9C
	b _081B0602
_081B05FA:
	adds r0, r5, #0
	movs r1, #0
	bl sub_081B0C9C
_081B0602:
	lsls r5, r5, #4
_081B0604:
	ldr r0, _081B061C
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #8]
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
_081B0616:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B061C: .4byte 0x0203CBA8
	thumb_func_end RenderPartyMenuBox

	thumb_func_start DisplayPartyPokemonData
DisplayPartyPokemonData: @ 0x081B0620
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x64
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _081B0670
	adds r7, r1, r0
	adds r0, r7, #0
	movs r1, #0x2d
	bl GetMonData
	adds r2, r0, #0
	cmp r2, #0
	beq _081B0678
	ldr r6, _081B0674
	ldr r0, [r6]
	lsls r5, r4, #4
	adds r0, r5, r0
	ldr r2, [r0]
	ldrb r0, [r0, #8]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r4, [r2]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl _call_via_r4
	ldr r1, [r6]
	adds r1, r1, r5
	adds r0, r7, #0
	movs r2, #0
	bl DisplayPartyPokemonNickname
	b _081B06DA
	.align 2, 0
_081B0670: .4byte 0x02024190
_081B0674: .4byte 0x0203CBA8
_081B0678:
	ldr r5, _081B06E4
	ldr r0, [r5]
	lsls r4, r4, #4
	adds r0, r4, r0
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	str r2, [sp]
	str r2, [sp, #4]
	ldr r6, [r1]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl _call_via_r6
	ldr r1, [r5]
	adds r1, r1, r4
	adds r0, r7, #0
	movs r2, #0
	bl DisplayPartyPokemonNickname
	ldr r1, [r5]
	adds r1, r1, r4
	adds r0, r7, #0
	movs r2, #0
	bl DisplayPartyPokemonLevelCheck
	ldr r1, [r5]
	adds r1, r1, r4
	adds r0, r7, #0
	movs r2, #0
	bl DisplayPartyPokemonGenderNidoranCheck
	ldr r1, [r5]
	adds r1, r1, r4
	adds r0, r7, #0
	movs r2, #0
	bl DisplayPartyPokemonHPCheck
	ldr r1, [r5]
	adds r1, r1, r4
	adds r0, r7, #0
	movs r2, #0
	bl DisplayPartyPokemonMaxHPCheck
	ldr r1, [r5]
	adds r1, r1, r4
	adds r0, r7, #0
	bl DisplayPartyPokemonHPBarCheck
_081B06DA:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B06E4: .4byte 0x0203CBA8
	thumb_func_end DisplayPartyPokemonData

	thumb_func_start DisplayPartyPokemonSelectData
DisplayPartyPokemonSelectData: @ 0x081B06E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r1, #0x64
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r1, _081B076C
	adds r6, r2, r1
	ldr r7, _081B0770
	ldr r1, [r7]
	lsls r5, r0, #4
	adds r1, r5, r1
	ldr r2, [r1]
	ldrb r0, [r1, #8]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r4, [r2]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl _call_via_r4
	ldr r1, [r7]
	adds r1, r1, r5
	adds r0, r6, #0
	movs r2, #0
	bl DisplayPartyPokemonNickname
	adds r0, r6, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081B0754
	ldr r1, [r7]
	adds r1, r1, r5
	adds r0, r6, #0
	movs r2, #0
	bl DisplayPartyPokemonLevelCheck
	ldr r1, [r7]
	adds r1, r1, r5
	adds r0, r6, #0
	movs r2, #0
	bl DisplayPartyPokemonGenderNidoranCheck
_081B0754:
	ldr r1, [r7]
	adds r1, r1, r5
	mov r0, r8
	movs r2, #0
	bl DisplayPartyPokemonOtherText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B076C: .4byte 0x02024190
_081B0770: .4byte 0x0203CBA8
	thumb_func_end DisplayPartyPokemonSelectData

	thumb_func_start DisplayPartyPokemonSelectForBattle
DisplayPartyPokemonSelectForBattle: @ 0x081B0774
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081B0798
	adds r0, r0, r1
	ldr r6, _081B079C
	bl GetBattleEntryEligibility
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B07AE
	adds r0, r5, #0
	movs r1, #7
	bl DisplayPartyPokemonSelectData
	b _081B07DA
	.align 2, 0
_081B0798: .4byte 0x02024190
_081B079C: .4byte 0x0203CBC4
_081B07A0:
	adds r1, r4, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl DisplayPartyPokemonSelectData
	b _081B07DA
_081B07AE:
	movs r4, #0
	b _081B07C6
_081B07B2:
	adds r1, r6, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _081B07C0
	subs r0, #1
	cmp r0, r5
	beq _081B07A0
_081B07C0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081B07C6:
	bl sub_081B84D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _081B07B2
	adds r0, r5, #0
	movs r1, #1
	bl DisplayPartyPokemonSelectData
_081B07DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end DisplayPartyPokemonSelectForBattle

	thumb_func_start DisplayPartyPokemonSelectForContest
DisplayPartyPokemonSelectForContest: @ 0x081B07E0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081B0804
	adds r0, r0, r1
	bl sub_080DA58C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _081B0832
	lsls r0, r0, #2
	ldr r1, _081B0808
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B0804: .4byte 0x02024190
_081B0808: .4byte 0x081B080C
_081B080C: @ jump table
	.4byte _081B0820 @ case 0
	.4byte _081B082A @ case 1
	.4byte _081B082A @ case 2
	.4byte _081B0820 @ case 3
	.4byte _081B0820 @ case 4
_081B0820:
	adds r0, r4, #0
	movs r1, #7
	bl DisplayPartyPokemonSelectData
	b _081B0832
_081B082A:
	adds r0, r4, #0
	movs r1, #6
	bl DisplayPartyPokemonSelectData
_081B0832:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DisplayPartyPokemonSelectForContest

	thumb_func_start DisplayPartyPokemonSelectForRelearner
DisplayPartyPokemonSelectForRelearner: @ 0x081B0838
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081B085C
	adds r0, r0, r1
	bl GetNumberOfRelearnableMoves
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B0860
	adds r0, r4, #0
	movs r1, #9
	bl DisplayPartyPokemonSelectData
	b _081B0868
	.align 2, 0
_081B085C: .4byte 0x02024190
_081B0860:
	adds r0, r4, #0
	movs r1, #8
	bl DisplayPartyPokemonSelectData
_081B0868:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DisplayPartyPokemonSelectForRelearner

	thumb_func_start sub_081B0870
sub_081B0870: @ 0x081B0870
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_081B1E5C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B088E
	adds r0, r4, #0
	movs r1, #6
	bl DisplayPartyPokemonSelectData
	b _081B0896
_081B088E:
	adds r0, r4, #0
	movs r1, #7
	bl DisplayPartyPokemonSelectData
_081B0896:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081B0870

	thumb_func_start DisplayPartyPokemonSelectHeldItemRelated
DisplayPartyPokemonSelectHeldItemRelated: @ 0x081B089C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081B08C0
	adds r0, r0, r1
	movs r1, #0xc
	bl GetMonData
	cmp r0, #0
	beq _081B08C4
	adds r0, r4, #0
	movs r1, #0xb
	bl DisplayPartyPokemonSelectData
	b _081B08CC
	.align 2, 0
_081B08C0: .4byte 0x02024190
_081B08C4:
	adds r0, r4, #0
	movs r1, #0xc
	bl DisplayPartyPokemonSelectData
_081B08CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DisplayPartyPokemonSelectHeldItemRelated

	thumb_func_start sub_081B08D4
sub_081B08D4: @ 0x081B08D4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081B0904
	adds r6, r1, r0
	ldr r0, _081B0908
	ldrh r4, [r0]
	ldr r0, _081B090C
	ldrb r0, [r0, #0xb]
	cmp r0, #0xc
	bne _081B0918
	ldr r1, _081B0910
	movs r0, #0
	strh r0, [r1]
	ldr r0, _081B0914
	ldrb r2, [r0]
	adds r0, r5, #0
	movs r1, #0
	bl DisplayPartyPokemonSelectToTeachMove
	b _081B0962
	.align 2, 0
_081B0904: .4byte 0x02024190
_081B0908: .4byte 0x0203CB48
_081B090C: .4byte 0x0203CB94
_081B0910: .4byte 0x02037290
_081B0914: .4byte 0x02037282
_081B0918:
	cmp r0, #3
	bne _081B092E
	adds r0, r4, #0
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B0932
	cmp r0, #2
	beq _081B093E
_081B092E:
	movs r0, #0
	b _081B0964
_081B0932:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl DisplayPartyPokemonSelectToTeachMove
	b _081B0962
_081B093E:
	adds r0, r6, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081B095A
	adds r0, r6, #0
	movs r1, #3
	adds r2, r4, #0
	bl GetEvolutionTargetSpecies
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081B092E
_081B095A:
	adds r0, r5, #0
	movs r1, #0
	bl DisplayPartyPokemonSelectData
_081B0962:
	movs r0, #1
_081B0964:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081B08D4

	thumb_func_start DisplayPartyPokemonSelectToTeachMove
DisplayPartyPokemonSelectToTeachMove: @ 0x081B096C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x64
	muls r0, r4, r0
	ldr r3, _081B0998
	adds r0, r0, r3
	bl CanMonLearnTMTutor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _081B09AA
	cmp r0, #2
	bgt _081B099C
	cmp r0, #1
	beq _081B09A0
	b _081B09B4
	.align 2, 0
_081B0998: .4byte 0x02024190
_081B099C:
	cmp r0, #3
	bne _081B09B4
_081B09A0:
	adds r0, r4, #0
	movs r1, #9
	bl DisplayPartyPokemonSelectData
	b _081B09BC
_081B09AA:
	adds r0, r4, #0
	movs r1, #0xa
	bl DisplayPartyPokemonSelectData
	b _081B09BC
_081B09B4:
	adds r0, r4, #0
	movs r1, #8
	bl DisplayPartyPokemonSelectData
_081B09BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DisplayPartyPokemonSelectToTeachMove

	thumb_func_start sub_081B09C4
sub_081B09C4: @ 0x081B09C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081B09F4
	lsls r2, r0, #4
	ldr r1, [r1]
	adds r6, r1, r2
	subs r0, #3
	lsls r0, r0, #0x18
	ldr r5, _081B09F8
	lsrs r0, r0, #0x13
	mov r8, r0
	adds r7, r0, r5
	ldrh r0, [r7]
	cmp r0, #0
	bne _081B09FC
	ldrb r0, [r6, #8]
	bl DrawEmptySlot
	b _081B0A60
	.align 2, 0
_081B09F4: .4byte 0x0203CBA8
_081B09F8: .4byte 0x02022C9C
_081B09FC:
	ldr r2, [r6]
	ldrb r0, [r6, #8]
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r4, [r2]
	movs r2, #0
	movs r3, #0
	bl _call_via_r4
	ldr r4, _081B0A6C
	adds r5, #4
	add r5, r8
	adds r0, r4, #0
	adds r1, r5, #0
	bl StringCopy
	adds r0, r4, #0
	bl StringGetEnd10
	ldrb r0, [r6, #8]
	ldr r3, [r6]
	adds r3, #4
	adds r1, r4, #0
	movs r2, #0
	bl DisplayPartyPokemonBarDetail
	ldrb r0, [r7, #0xf]
	adds r1, r6, #0
	bl DisplayPartyPokemonLevel
	ldrb r0, [r7, #0x1c]
	ldrh r1, [r7]
	adds r2, r5, #0
	adds r3, r6, #0
	bl DisplayPartyPokemonGender
	ldrh r0, [r7, #0x10]
	adds r1, r6, #0
	bl DisplayPartyPokemonHP
	ldrh r0, [r7, #0x12]
	adds r1, r6, #0
	bl DisplayPartyPokemonMaxHP
	ldrh r0, [r7, #0x10]
	ldrh r1, [r7, #0x12]
	adds r2, r6, #0
	bl DisplayPartyPokemonHPBar
_081B0A60:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B0A6C: .4byte 0x02021C40
	thumb_func_end sub_081B09C4

	thumb_func_start RenderPartyMenuBoxes
RenderPartyMenuBoxes: @ 0x081B0A70
	push {r4, r5, lr}
	ldr r5, _081B0A98
	ldr r0, [r5]
	movs r4, #0x86
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	bl RenderPartyMenuBox
	ldr r1, [r5]
	adds r1, r1, r4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	beq _081B0A9C
	movs r0, #0
	b _081B0A9E
	.align 2, 0
_081B0A98: .4byte 0x0203CB90
_081B0A9C:
	movs r0, #1
_081B0A9E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end RenderPartyMenuBoxes

	thumb_func_start GetPartyMiscGraphicsTile
GetPartyMiscGraphicsTile: @ 0x081B0AA4
	lsls r0, r0, #0x10
	ldr r1, _081B0AB4
	lsrs r0, r0, #0xb
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_081B0AB4: .4byte 0x0203CBAC
	thumb_func_end GetPartyMiscGraphicsTile

	thumb_func_start party_menu_add_per_mon_objects_internal
party_menu_add_per_mon_objects_internal: @ 0x081B0AB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _081B0B2C
	ldrb r1, [r0, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #5
	bne _081B0B68
	cmp r7, #2
	bls _081B0B68
	subs r0, r7, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _081B0B30
	mov sb, r0
	mov r2, sl
	lsls r2, r2, #5
	mov r8, r2
	mov r6, r8
	add r6, sb
	ldrh r0, [r6]
	cmp r0, #0
	beq _081B0BAC
	mov r1, sb
	adds r1, #0x18
	add r1, r8
	ldr r1, [r1]
	ldr r4, _081B0B34
	lsls r5, r7, #4
	ldr r2, [r4]
	adds r2, r2, r5
	movs r3, #0
	str r3, [sp]
	bl party_menu_link_mon_icon_anim
	ldrh r0, [r6]
	ldrh r1, [r6, #2]
	ldr r2, [r4]
	adds r2, r2, r5
	bl party_menu_link_mon_held_item_object
	ldrh r0, [r6]
	ldr r1, [r4]
	adds r1, r1, r5
	bl party_menu_link_mon_pokeball_object
	ldrh r0, [r6, #0x10]
	cmp r0, #0
	bne _081B0B38
	movs r3, #7
	b _081B0B48
	.align 2, 0
_081B0B2C: .4byte 0x0203CB94
_081B0B30: .4byte 0x02022C9C
_081B0B34: .4byte 0x0203CBA8
_081B0B38:
	mov r0, sb
	adds r0, #0x14
	add r0, r8
	ldr r0, [r0]
	bl pokemon_ailments_get_primary
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_081B0B48:
	ldr r1, _081B0B60
	mov r2, sl
	lsls r0, r2, #5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _081B0B64
	ldr r2, [r1]
	adds r2, r2, r5
	adds r1, r3, #0
	bl party_menu_link_mon_status_condition_object
	b _081B0BAC
	.align 2, 0
_081B0B60: .4byte 0x02022C9C
_081B0B64: .4byte 0x0203CBA8
_081B0B68:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _081B0BBC
	adds r6, r1, r0
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B0BAC
	ldr r4, _081B0BC0
	lsls r5, r7, #4
	ldr r1, [r4]
	adds r1, r1, r5
	adds r0, r6, #0
	adds r2, r7, #0
	bl party_menu_icon_anim
	ldr r1, [r4]
	adds r1, r1, r5
	adds r0, r6, #0
	bl party_menu_held_item_object
	ldr r1, [r4]
	adds r1, r1, r5
	adds r0, r6, #0
	bl party_menu_pokeball_object
	ldr r1, [r4]
	adds r1, r1, r5
	adds r0, r6, #0
	bl party_menu_status_condition_object
_081B0BAC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B0BBC: .4byte 0x02024190
_081B0BC0: .4byte 0x0203CBA8
	thumb_func_end party_menu_add_per_mon_objects_internal

	thumb_func_start party_menu_add_per_mon_objects
party_menu_add_per_mon_objects: @ 0x081B0BC4
	push {r4, r5, lr}
	ldr r5, _081B0BEC
	ldr r0, [r5]
	movs r4, #0x86
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	bl party_menu_add_per_mon_objects_internal
	ldr r1, [r5]
	adds r1, r1, r4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	beq _081B0BF0
	movs r0, #0
	b _081B0BF2
	.align 2, 0
_081B0BEC: .4byte 0x0203CB90
_081B0BF0:
	movs r0, #1
_081B0BF2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end party_menu_add_per_mon_objects

	thumb_func_start sub_081B0BF8
sub_081B0BF8: @ 0x081B0BF8
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _081B0C20
	ldrb r1, [r0, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #5
	bne _081B0C24
	movs r0, #7
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r1, #0xe
	movs r2, #0x17
	movs r3, #0x11
	bl FillBgTilemapBufferRect
	b _081B0C8C
	.align 2, 0
_081B0C20: .4byte 0x0203CB94
_081B0C24:
	ldr r4, _081B0C5C
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _081B0C64
	movs r0, #0xbf
	movs r1, #0x88
	bl sub_081B5C14
	ldr r3, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #4
	ldrh r2, [r3, #8]
	ldr r1, _081B0C60
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #8]
	bl sub_081B0EDC
	movs r0, #0xbf
	movs r1, #0x98
	bl sub_081B5C14
	b _081B0C6C
	.align 2, 0
_081B0C5C: .4byte 0x0203CB90
_081B0C60: .4byte 0xFFFFF80F
_081B0C64:
	movs r0, #0xc6
	movs r1, #0x94
	bl sub_081B5BD4
_081B0C6C:
	ldr r3, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #0xb
	ldr r1, [r3, #8]
	ldr r2, _081B0C94
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #8]
	ldr r0, _081B0C98
	ldrb r0, [r0, #9]
	movs r1, #1
	bl sub_081B0C9C
_081B0C8C:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B0C94: .4byte 0xFFFC07FF
_081B0C98: .4byte 0x0203CB94
	thumb_func_end sub_081B0BF8

	thumb_func_start sub_081B0C9C
sub_081B0C9C: @ 0x081B0C9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	cmp r7, #6
	beq _081B0D08
	cmp r7, #7
	beq _081B0D44
	movs r0, #0x64
	muls r0, r7, r0
	ldr r1, _081B0D00
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B0DB8
	ldr r6, _081B0D04
	lsls r5, r7, #4
	ldr r4, [r6]
	adds r4, r4, r5
	adds r0, r7, #0
	mov r1, r8
	bl GetPartyBoxPalBitfield
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateSelectedPartyBox
	ldr r0, [r6]
	adds r0, r5, r0
	ldrb r0, [r0, #9]
	mov r1, r8
	bl AnimateSelectedPartyIcon
	ldr r0, [r6]
	adds r5, r5, r0
	ldrb r0, [r5, #0xb]
	mov r1, r8
	bl sub_081B5C38
	b _081B0DB8
	.align 2, 0
_081B0D00: .4byte 0x02024190
_081B0D04: .4byte 0x0203CBA8
_081B0D08:
	mov r0, r8
	cmp r0, #0
	bne _081B0D22
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0x17
	movs r2, #0x10
	movs r3, #7
	bl sub_081998C8
	b _081B0D34
_081B0D22:
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0x17
	movs r2, #0x10
	movs r3, #7
	bl sub_081998C8
_081B0D34:
	ldr r0, _081B0D40
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x15
	b _081B0DAA
	.align 2, 0
_081B0D40: .4byte 0x0203CB90
_081B0D44:
	ldr r0, _081B0D64
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _081B0D76
	mov r0, r8
	cmp r0, #0
	bne _081B0D68
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0x17
	movs r2, #0x11
	b _081B0D88
	.align 2, 0
_081B0D64: .4byte 0x0203CB90
_081B0D68:
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0x17
	movs r2, #0x11
	b _081B0D88
_081B0D76:
	mov r0, r8
	cmp r0, #0
	bne _081B0D90
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0x17
	movs r2, #0x12
_081B0D88:
	movs r3, #7
	bl sub_081998C8
	b _081B0DA2
_081B0D90:
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0x17
	movs r2, #0x12
	movs r3, #7
	bl sub_081998C8
_081B0DA2:
	ldr r0, _081B0DC4
	ldr r0, [r0]
	ldr r0, [r0, #8]
	lsls r0, r0, #0xe
_081B0DAA:
	lsrs r0, r0, #0x19
	mov r1, r8
	bl sub_081B5C38
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
_081B0DB8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B0DC4: .4byte 0x0203CB90
	thumb_func_end sub_081B0C9C

	thumb_func_start GetPartyBoxPalBitfield
GetPartyBoxPalBitfield: @ 0x081B0DC8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r4, #0
	cmp r1, #1
	bne _081B0DDA
	movs r4, #1
_081B0DDA:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081B0E54
	adds r0, r0, r1
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _081B0DF0
	movs r0, #2
	orrs r4, r0
_081B0DF0:
	adds r0, r5, #0
	bl PartyBoxPal_ParnterOrDisqualifiedInArena
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B0E06
	movs r0, #8
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_081B0E06:
	ldr r0, _081B0E58
	ldrb r1, [r0, #0xb]
	adds r2, r0, #0
	cmp r1, #9
	bne _081B0E18
	movs r0, #0x10
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_081B0E18:
	cmp r1, #8
	bne _081B0E34
	movs r0, #9
	ldrsb r0, [r2, r0]
	cmp r5, r0
	beq _081B0E2C
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	cmp r5, r0
	bne _081B0E34
_081B0E2C:
	movs r0, #4
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_081B0E34:
	ldrb r0, [r2, #0xb]
	cmp r0, #0xa
	bne _081B0E4A
	movs r0, #9
	ldrsb r0, [r2, r0]
	cmp r5, r0
	bne _081B0E4A
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_081B0E4A:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081B0E54: .4byte 0x02024190
_081B0E58: .4byte 0x0203CB94
	thumb_func_end GetPartyBoxPalBitfield

	thumb_func_start PartyBoxPal_ParnterOrDisqualifiedInArena
PartyBoxPal_ParnterOrDisqualifiedInArena: @ 0x081B0E5C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081B0E80
	ldrb r1, [r0, #8]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x20
	bne _081B0E84
	cmp r2, #1
	beq _081B0E7A
	cmp r2, #4
	beq _081B0E7A
	cmp r2, #5
	bne _081B0E84
_081B0E7A:
	movs r0, #1
	b _081B0EC8
	.align 2, 0
_081B0E80: .4byte 0x0203CB94
_081B0E84:
	cmp r2, #2
	bhi _081B0EC6
	ldr r0, _081B0ECC
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _081B0EC6
	ldr r0, _081B0ED0
	ldr r1, _081B0ED4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B0EC6
	adds r0, r2, #0
	bl sub_081B8BD8
	ldr r1, _081B0ED8
	ldr r1, [r1]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _081B0EC8
_081B0EC6:
	movs r0, #0
_081B0EC8:
	pop {r1}
	bx r1
	.align 2, 0
_081B0ECC: .4byte 0x02022C90
_081B0ED0: .4byte 0x03002360
_081B0ED4: .4byte 0x00000439
_081B0ED8: .4byte 0x02024140
	thumb_func_end PartyBoxPal_ParnterOrDisqualifiedInArena

	thumb_func_start sub_081B0EDC
sub_081B0EDC: @ 0x081B0EDC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, _081B0F18
	movs r6, #7
	str r6, [sp]
	movs r5, #2
	str r5, [sp, #4]
	movs r4, #0x11
	str r4, [sp, #8]
	movs r0, #1
	movs r2, #0x17
	movs r3, #0x10
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r1, _081B0F1C
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r2, #0x17
	movs r3, #0x12
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B0F18: .4byte 0x085E107C
_081B0F1C: .4byte 0x085E1098
	thumb_func_end sub_081B0EDC

	thumb_func_start IsMultiBattle
IsMultiBattle: @ 0x081B0F20
	push {lr}
	ldr r0, _081B0F44
	ldr r0, [r0]
	movs r1, #0x49
	ands r0, r1
	cmp r0, #0x49
	bne _081B0F50
	ldr r0, _081B0F48
	ldr r1, _081B0F4C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B0F50
	movs r0, #1
	b _081B0F52
	.align 2, 0
_081B0F44: .4byte 0x02022C90
_081B0F48: .4byte 0x03002360
_081B0F4C: .4byte 0x00000439
_081B0F50:
	movs r0, #0
_081B0F52:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsMultiBattle

	thumb_func_start sub_081B0F58
sub_081B0F58: @ 0x081B0F58
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r0, #0x64
	bl Alloc
	adds r5, r0, #0
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x64
	bl memcpy
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x64
	bl memcpy
	adds r0, r5, #0
	bl Free
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B0F58

	thumb_func_start sub_081B0F90
sub_081B0F90: @ 0x081B0F90
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
	ldr r1, _081B0FC0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B0FC4
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B0FC0: .4byte 0x03005B60
_081B0FC4: .4byte 0x081B0FC9
	thumb_func_end sub_081B0F90

	thumb_func_start c3_0811FAB4
c3_0811FAB4: @ 0x081B0FC8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081B0FFC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B101C
	ldr r4, _081B1000
	ldrb r1, [r4, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _081B0FEA
	bl sub_081B8D20
_081B0FEA:
	ldr r0, _081B1004
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _081B1008
	bl SetMainCallback2
	b _081B100E
	.align 2, 0
_081B0FFC: .4byte 0x02037C74
_081B1000: .4byte 0x0203CB94
_081B1004: .4byte 0x0203CB90
_081B1008:
	ldr r0, [r4]
	bl SetMainCallback2
_081B100E:
	bl ResetSpriteData
	bl FreePartyPointers
	adds r0, r5, #0
	bl DestroyTask
_081B101C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end c3_0811FAB4

	thumb_func_start GetCursorSelectionMonId
GetCursorSelectionMonId: @ 0x081B1024
	ldr r0, _081B102C
	ldrb r0, [r0, #9]
	bx lr
	.align 2, 0
_081B102C: .4byte 0x0203CB94
	thumb_func_end GetCursorSelectionMonId

	thumb_func_start sub_081B1030
sub_081B1030: @ 0x081B1030
	ldr r0, _081B103C
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bx lr
	.align 2, 0
_081B103C: .4byte 0x0203CB94
	thumb_func_end sub_081B1030

	thumb_func_start sub_081B1040
sub_081B1040: @ 0x081B1040
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	ldr r0, _081B107C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B10B0
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B10B0
	bl sub_081B10BC
	adds r4, r0, #0
	bl PartyMenuButtonHandler
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	beq _081B1090
	cmp r0, #2
	bgt _081B1080
	cmp r0, #1
	beq _081B1086
	b _081B10B0
	.align 2, 0
_081B107C: .4byte 0x02037C74
_081B1080:
	cmp r0, #8
	beq _081B109A
	b _081B10B0
_081B1086:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_081B10DC
	b _081B10B0
_081B1090:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_081B12A0
	b _081B10B0
_081B109A:
	ldr r0, _081B10B8
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _081B10B0
	movs r0, #5
	bl PlaySE
	bl sub_081B4C28
_081B10B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B10B8: .4byte 0x0203CB90
	thumb_func_end sub_081B1040

	thumb_func_start sub_081B10BC
sub_081B10BC: @ 0x081B10BC
	push {lr}
	ldr r0, _081B10D0
	ldrb r1, [r0, #0xb]
	cmp r1, #8
	beq _081B10CA
	cmp r1, #0xa
	bne _081B10D4
_081B10CA:
	adds r0, #0xa
	b _081B10D6
	.align 2, 0
_081B10D0: .4byte 0x0203CB94
_081B10D4:
	adds r0, #9
_081B10D6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081B10BC

	thumb_func_start sub_081B10DC
sub_081B10DC: @ 0x081B10DC
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #6
	bne _081B10FC
	ldr r0, _081B10F8
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl _call_via_r1
	b _081B126E
	.align 2, 0
_081B10F8: .4byte 0x0203CB94
_081B10FC:
	ldr r0, _081B1114
	ldrb r0, [r0, #0xb]
	subs r0, #3
	cmp r0, #0xa
	bls _081B1108
	b _081B1262
_081B1108:
	lsls r0, r0, #2
	ldr r1, _081B1118
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B1114: .4byte 0x0203CB94
_081B1118: .4byte 0x081B111C
_081B111C: @ jump table
	.4byte _081B116C @ case 0
	.4byte _081B1262 @ case 1
	.4byte _081B1208 @ case 2
	.4byte _081B1208 @ case 3
	.4byte _081B11E0 @ case 4
	.4byte _081B1230 @ case 5
	.4byte _081B1262 @ case 6
	.4byte _081B1148 @ case 7
	.4byte _081B123E @ case 8
	.4byte _081B11B8 @ case 9
	.4byte _081B124C @ case 10
_081B1148:
	adds r0, r4, #0
	bl sub_081B1274
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B1156
	b _081B126E
_081B1156:
	ldr r0, _081B1168
	ldr r0, [r0]
	adds r0, #0xd
	bl sub_081B2CB0
	adds r0, r5, #0
	bl sub_081614AC
	b _081B126E
	.align 2, 0
_081B1168: .4byte 0x0203CB90
_081B116C:
	adds r0, r4, #0
	bl sub_081B1274
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B117A
	b _081B126E
_081B117A:
	ldr r0, _081B11A4
	ldrb r1, [r0, #8]
	movs r0, #0xf
	ands r0, r1
	ldr r2, _081B11A8
	cmp r0, #1
	bne _081B118E
	ldr r1, [r2]
	ldr r0, _081B11AC
	str r0, [r1, #4]
_081B118E:
	ldr r0, [r2]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r0, _081B11B0
	ldr r1, _081B11B4
	ldr r2, [r0]
	adds r0, r5, #0
	bl _call_via_r2
	b _081B126E
	.align 2, 0
_081B11A4: .4byte 0x0203CB94
_081B11A8: .4byte 0x0203CB90
_081B11AC: .4byte 0x081B8DE1
_081B11B0: .4byte 0x03006068
_081B11B4: .4byte 0x081B6435
_081B11B8:
	adds r0, r4, #0
	bl sub_081B1274
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B126E
	movs r0, #5
	bl PlaySE
	ldr r0, _081B11DC
	ldr r0, [r0]
	adds r0, #0xd
	bl sub_081B2CB0
	adds r0, r5, #0
	bl sub_081B7AF0
	b _081B126E
	.align 2, 0
_081B11DC: .4byte 0x0203CB90
_081B11E0:
	adds r0, r4, #0
	bl sub_081B1274
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B126E
	movs r0, #5
	bl PlaySE
	ldr r0, _081B1204
	ldr r0, [r0]
	adds r0, #0xd
	bl sub_081B2CB0
	adds r0, r5, #0
	bl sub_081B8114
	b _081B126E
	.align 2, 0
_081B1204: .4byte 0x0203CB90
_081B1208:
	adds r0, r4, #0
	bl sub_081B1274
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B126E
	movs r0, #5
	bl PlaySE
	ldr r0, _081B122C
	ldr r0, [r0]
	adds r0, #0xd
	bl sub_081B2CB0
	adds r0, r5, #0
	bl sub_081B7C4C
	b _081B126E
	.align 2, 0
_081B122C: .4byte 0x0203CB90
_081B1230:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081B35D8
	b _081B126E
_081B123E:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081B0F90
	b _081B126E
_081B124C:
	adds r0, r4, #0
	bl sub_081B1274
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B126E
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_081B1E7C
	b _081B126E
_081B1262:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081B339C
_081B126E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081B10DC

	thumb_func_start sub_081B1274
sub_081B1274: @ 0x081B1274
	push {lr}
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B1290
	adds r0, r0, r1
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #1
	beq _081B1294
	movs r0, #1
	b _081B129C
	.align 2, 0
_081B1290: .4byte 0x02024190
_081B1294:
	movs r0, #0x20
	bl PlaySE
	movs r0, #0
_081B129C:
	pop {r1}
	bx r1
	thumb_func_end sub_081B1274

	thumb_func_start sub_081B12A0
sub_081B12A0: @ 0x081B12A0
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B12BC
	ldrb r0, [r0, #0xb]
	cmp r0, #8
	beq _081B12D2
	cmp r0, #8
	bgt _081B12C0
	cmp r0, #1
	beq _081B12CA
	b _081B12EE
	.align 2, 0
_081B12BC: .4byte 0x0203CB94
_081B12C0:
	cmp r0, #0xa
	beq _081B12D2
	cmp r0, #0xd
	beq _081B12E0
	b _081B12EE
_081B12CA:
	movs r0, #0x20
	bl PlaySE
	b _081B1322
_081B12D2:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081B3D1C
	b _081B1322
_081B12E0:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081B1EE0
	b _081B1322
_081B12EE:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081B1330
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B1322
	bl sub_081221B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B1312
	ldr r1, _081B1328
	movs r0, #7
	strh r0, [r1]
_081B1312:
	ldr r0, _081B132C
	movs r1, #0
	strb r1, [r0]
	movs r0, #7
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_081B0F90
_081B1322:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B1328: .4byte 0x02037280
_081B132C: .4byte 0x0203CBB4
	thumb_func_end sub_081B12A0

	thumb_func_start sub_081B1330
sub_081B1330: @ 0x081B1330
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	ldr r0, _081B1348
	ldrb r0, [r0, #8]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	bne _081B1350
	ldr r5, _081B134C
	b _081B135A
	.align 2, 0
_081B1348: .4byte 0x0203CB94
_081B134C: .4byte 0x085CA210
_081B1350:
	cmp r1, #4
	bne _081B135A
	bl sub_081B855C
	adds r5, r0, #0
_081B135A:
	cmp r5, #0
	beq _081B139C
	ldr r0, _081B138C
	ldr r0, [r0]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r4, _081B1390
	adds r0, r4, #0
	adds r1, r5, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B1394
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B1398
	str r1, [r0]
	movs r0, #1
	b _081B139E
	.align 2, 0
_081B138C: .4byte 0x0203CB90
_081B1390: .4byte 0x02021C7C
_081B1394: .4byte 0x03005B60
_081B1398: .4byte 0x081B13A5
_081B139C:
	movs r0, #0
_081B139E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_081B1330

	thumb_func_start sub_081B13A4
sub_081B13A4: @ 0x081B13A4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B13C8
	bl sub_081B2FDC
	ldr r0, _081B13D0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B13D4
	str r0, [r1]
_081B13C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B13D0: .4byte 0x03005B60
_081B13D4: .4byte 0x081B13D9
	thumb_func_end sub_081B13A4

	thumb_func_start sub_081B13D8
sub_081B13D8: @ 0x081B13D8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B13FE
	cmp r1, #0
	bgt _081B13F8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B141C
	b _081B1428
_081B13F8:
	cmp r1, #1
	beq _081B1422
	b _081B1428
_081B13FE:
	ldr r0, _081B1414
	strb r1, [r0]
	ldr r1, _081B1418
	movs r0, #7
	strb r0, [r1, #9]
	bl sub_081B81F8
	adds r0, r4, #0
	bl sub_081B0F90
	b _081B1428
	.align 2, 0
_081B1414: .4byte 0x0203CBB4
_081B1418: .4byte 0x0203CB94
_081B141C:
	movs r0, #5
	bl PlaySE
_081B1422:
	adds r0, r4, #0
	bl sub_081B18EC
_081B1428:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B13D8

	thumb_func_start PartyMenuButtonHandler
PartyMenuButtonHandler: @ 0x081B1430
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081B1448
	ldrh r1, [r0, #0x30]
	adds r3, r0, #0
	cmp r1, #0x20
	beq _081B145E
	cmp r1, #0x20
	bgt _081B144C
	cmp r1, #0x10
	beq _081B1462
	b _081B1466
	.align 2, 0
_081B1448: .4byte 0x03002360
_081B144C:
	cmp r1, #0x40
	beq _081B1456
	cmp r1, #0x80
	beq _081B145A
	b _081B1466
_081B1456:
	movs r1, #0xff
	b _081B1482
_081B145A:
	movs r1, #1
	b _081B1482
_081B145E:
	movs r1, #0xfe
	b _081B1482
_081B1462:
	movs r1, #2
	b _081B1482
_081B1466:
	bl sub_08122118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B147A
	cmp r0, #2
	beq _081B147E
	movs r1, #0
	b _081B1480
_081B147A:
	movs r1, #0xff
	b _081B1480
_081B147E:
	movs r1, #1
_081B1480:
	ldr r3, _081B1490
_081B1482:
	ldrh r2, [r3, #0x2e]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _081B1494
	movs r0, #8
	b _081B14C0
	.align 2, 0
_081B1490: .4byte 0x03002360
_081B1494:
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B14A6
	adds r0, r4, #0
	bl UpdateCurrentPartySelection
	movs r0, #0
	b _081B14C0
_081B14A6:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _081B14BA
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #7
	bne _081B14BA
	movs r0, #2
	b _081B14C0
_081B14BA:
	ldrh r1, [r3, #0x2e]
	movs r0, #3
	ands r0, r1
_081B14C0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PartyMenuButtonHandler

	thumb_func_start UpdateCurrentPartySelection
UpdateCurrentPartySelection: @ 0x081B14C8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r4, [r5]
	ldr r0, _081B14EC
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne _081B14F0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl SetNewPartySelectTarget1
	b _081B14FA
	.align 2, 0
_081B14EC: .4byte 0x0203CB94
_081B14F0:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl SetNewPartySelectTarget2
_081B14FA:
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r4, r4, #0x18
	asrs r0, r4, #0x18
	cmp r1, r0
	beq _081B151C
	movs r0, #5
	bl PlaySE
	lsrs r0, r4, #0x18
	movs r1, #0
	bl sub_081B0C9C
	ldrb r0, [r5]
	movs r1, #1
	bl sub_081B0C9C
_081B151C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateCurrentPartySelection

	thumb_func_start SetNewPartySelectTarget1
SetNewPartySelectTarget1: @ 0x081B1524
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B154A
	cmp r1, r0
	bgt _081B1540
	subs r0, #1
	cmp r1, r0
	beq _081B15F4
	b _081B1622
_081B1540:
	cmp r1, #1
	beq _081B1590
	cmp r1, #2
	beq _081B15C8
	b _081B1622
_081B154A:
	ldrb r0, [r4]
	movs r1, #0
	ldrsb r1, [r4, r1]
	cmp r1, #0
	bne _081B1558
	movs r0, #7
	b _081B1620
_081B1558:
	cmp r1, #6
	bne _081B1568
	ldr r0, _081B1564
	ldrb r0, [r0]
	subs r0, #1
	b _081B1620
	.align 2, 0
_081B1564: .4byte 0x0202418D
_081B1568:
	cmp r1, #7
	bne _081B158C
	ldr r0, _081B157C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _081B1580
	movs r0, #6
	b _081B1620
	.align 2, 0
_081B157C: .4byte 0x0203CB90
_081B1580:
	ldr r0, _081B1588
	ldrb r0, [r0]
	subs r0, #1
	b _081B1620
	.align 2, 0
_081B1588: .4byte 0x0202418D
_081B158C:
	subs r0, #1
	b _081B1620
_081B1590:
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #7
	beq _081B161E
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldr r0, _081B15B8
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bne _081B15C4
	ldr r0, _081B15BC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _081B15C0
	movs r0, #6
	b _081B1620
	.align 2, 0
_081B15B8: .4byte 0x0202418D
_081B15BC: .4byte 0x0203CB90
_081B15C0:
	movs r0, #7
	b _081B1620
_081B15C4:
	adds r0, r2, #1
	b _081B1620
_081B15C8:
	ldr r0, _081B15EC
	ldrb r0, [r0]
	cmp r0, #1
	beq _081B1622
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _081B1622
	ldr r0, _081B15F0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _081B1620
	movs r0, #1
	b _081B1620
	.align 2, 0
_081B15EC: .4byte 0x0202418D
_081B15F0: .4byte 0x0203CB90
_081B15F4:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _081B1622
	cmp r0, #6
	beq _081B1622
	cmp r0, #7
	beq _081B1622
	ldr r0, _081B1628
	ldr r3, [r0]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r3, #8]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
_081B161E:
	movs r0, #0
_081B1620:
	strb r0, [r4]
_081B1622:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B1628: .4byte 0x0203CB90
	thumb_func_end SetNewPartySelectTarget1

	thumb_func_start SetNewPartySelectTarget2
SetNewPartySelectTarget2: @ 0x081B162C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r5, r1, #0x18
	movs r6, #1
	rsbs r6, r6, #0
	cmp r5, r6
	beq _081B1658
	cmp r5, r6
	bgt _081B164E
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _081B164C
	b _081B176C
_081B164C:
	b _081B17C4
_081B164E:
	cmp r5, #1
	beq _081B16B4
	cmp r5, #2
	beq _081B16F4
	b _081B17C4
_081B1658:
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _081B1666
	movs r0, #7
	b _081B17C2
_081B1666:
	cmp r0, #6
	bne _081B1678
	ldr r0, _081B1674
	ldrb r0, [r0]
	subs r0, #1
	b _081B17C2
	.align 2, 0
_081B1674: .4byte 0x0202418D
_081B1678:
	cmp r0, #7
	bne _081B1694
	ldr r0, _081B168C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _081B1690
	movs r0, #6
	b _081B17C2
	.align 2, 0
_081B168C: .4byte 0x0203CB90
_081B1690:
	subs r0, r1, #1
	strb r0, [r4]
_081B1694:
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	bl sub_081B17D0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _081B16B0
	b _081B17C4
_081B16B0:
	strb r2, [r4]
	b _081B17C4
_081B16B4:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #6
	bne _081B16C0
	movs r0, #7
	b _081B17C2
_081B16C0:
	cmp r0, #7
	bne _081B16C8
	movs r0, #0
	b _081B17C2
_081B16C8:
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	bl sub_081B17D0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r6
	bne _081B16B0
	ldr r0, _081B16EC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _081B16F0
	movs r0, #6
	b _081B17C2
	.align 2, 0
_081B16EC: .4byte 0x0203CB90
_081B16F0:
	movs r0, #7
	b _081B17C2
_081B16F4:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _081B172C
	ldr r0, _081B171C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1c
	lsrs r6, r0, #0x1d
	cmp r6, #3
	bne _081B1724
	ldr r0, _081B1720
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B17C4
	strb r6, [r4]
	b _081B17C4
	.align 2, 0
_081B171C: .4byte 0x0203CB90
_081B1720: .4byte 0x020242BC
_081B1724:
	ldr r0, _081B1728
	b _081B1740
	.align 2, 0
_081B1728: .4byte 0x02024258
_081B172C:
	cmp r0, #1
	bne _081B17C4
	ldr r0, _081B1750
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1d
	cmp r5, #5
	bne _081B1758
	ldr r0, _081B1754
_081B1740:
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B17C4
	strb r5, [r4]
	b _081B17C4
	.align 2, 0
_081B1750: .4byte 0x0203CB90
_081B1754: .4byte 0x02024384
_081B1758:
	ldr r0, _081B1768
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B17C4
	movs r0, #4
	b _081B17C2
	.align 2, 0
_081B1768: .4byte 0x02024320
_081B176C:
	ldrb r1, [r4]
	subs r0, r1, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _081B179C
	ldr r0, _081B1798
	ldr r3, [r0]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r3, #8]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	movs r0, #0
	b _081B17C2
	.align 2, 0
_081B1798: .4byte 0x0203CB90
_081B179C:
	subs r0, r1, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _081B17C4
	ldr r0, _081B17CC
	ldr r3, [r0]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r3, #8]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	movs r0, #1
_081B17C2:
	strb r0, [r4]
_081B17C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B17CC: .4byte 0x0203CB90
	thumb_func_end SetNewPartySelectTarget2

	thumb_func_start sub_081B17D0
sub_081B17D0: @ 0x081B17D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
_081B17DA:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r5, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #5
	bhi _081B1808
	asrs r4, r1, #0x18
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081B1804
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B17DA
	adds r0, r4, #0
	b _081B180C
	.align 2, 0
_081B1804: .4byte 0x02024190
_081B1808:
	movs r0, #1
	rsbs r0, r0, #0
_081B180C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081B17D0

	thumb_func_start GetMonNickname
GetMonNickname: @ 0x081B1814
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #2
	adds r2, r4, #0
	bl GetMonData
	adds r0, r4, #0
	bl StringGetEnd10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonNickname

	thumb_func_start sub_081B182C
sub_081B182C: @ 0x081B182C
	push {r4, lr}
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl sub_081B2F90
	ldr r0, _081B1854
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081B1858
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081B1854: .4byte 0x081B185D
_081B1858: .4byte 0x03005B60
	thumb_func_end sub_081B182C

	thumb_func_start sub_081B185C
sub_081B185C: @ 0x081B185C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	movs r0, #6
	bl RunTextPrintersRetIsActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _081B1898
	ldr r0, _081B18A0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _081B1892
	movs r0, #6
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #6
	bl ClearWindowTilemap
_081B1892:
	adds r0, r5, #0
	bl DestroyTask
_081B1898:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B18A0: .4byte 0x03005B60
	thumb_func_end sub_081B185C

	thumb_func_start sub_081B18A4
sub_081B18A4: @ 0x081B18A4
	push {lr}
	ldr r0, _081B18B4
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081B18B4: .4byte 0x081B185D
	thumb_func_end sub_081B18A4

	thumb_func_start sub_081B18B8
sub_081B18B8: @ 0x081B18B8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B18DE
	movs r0, #0
	bl display_pokemon_menu_message
	ldr r0, _081B18E4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B18E8
	str r0, [r1]
_081B18DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B18E4: .4byte 0x03005B60
_081B18E8: .4byte 0x081B1041
	thumb_func_end sub_081B18B8

	thumb_func_start sub_081B18EC
sub_081B18EC: @ 0x081B18EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B1944
	movs r0, #6
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #6
	bl ClearWindowTilemap
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B1930
	ldr r0, _081B1928
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B192C
	b _081B1942
	.align 2, 0
_081B1928: .4byte 0x03005B60
_081B192C: .4byte 0x081B18B9
_081B1930:
	movs r0, #0
	bl display_pokemon_menu_message
	ldr r0, _081B194C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B1950
_081B1942:
	str r0, [r1]
_081B1944:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B194C: .4byte 0x03005B60
_081B1950: .4byte 0x081B1041
	thumb_func_end sub_081B18EC

	thumb_func_start sub_081B1954
sub_081B1954: @ 0x081B1954
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _081B1990
	bl GetMonNickname
	ldr r1, _081B1994
	adds r0, r4, #0
	bl CopyItemName
	ldr r4, _081B1998
	ldr r1, _081B199C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B1990: .4byte 0x02021C40
_081B1994: .4byte 0x02021C54
_081B1998: .4byte 0x02021C7C
_081B199C: .4byte 0x085C9C76
	thumb_func_end sub_081B1954

	thumb_func_start sub_081B19A0
sub_081B19A0: @ 0x081B19A0
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _081B19DC
	bl GetMonNickname
	ldr r1, _081B19E0
	adds r0, r4, #0
	bl CopyItemName
	ldr r4, _081B19E4
	ldr r1, _081B19E8
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B19DC: .4byte 0x02021C40
_081B19E0: .4byte 0x02021C54
_081B19E4: .4byte 0x02021C7C
_081B19E8: .4byte 0x085C9CC6
	thumb_func_end sub_081B19A0

	thumb_func_start sub_081B19EC
sub_081B19EC: @ 0x081B19EC
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _081B1A28
	bl GetMonNickname
	ldr r1, _081B1A2C
	adds r0, r4, #0
	bl CopyItemName
	ldr r4, _081B1A30
	ldr r1, _081B1A34
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B1A28: .4byte 0x02021C40
_081B1A2C: .4byte 0x02021C54
_081B1A30: .4byte 0x02021C7C
_081B1A34: .4byte 0x085C9C86
	thumb_func_end sub_081B19EC

	thumb_func_start sub_081B1A38
sub_081B1A38: @ 0x081B1A38
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _081B1A78
	bl CopyItemName
	ldr r1, _081B1A7C
	adds r0, r4, #0
	bl CopyItemName
	ldr r4, _081B1A80
	ldr r1, _081B1A84
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B1A78: .4byte 0x02021C40
_081B1A7C: .4byte 0x02021C54
_081B1A80: .4byte 0x02021C7C
_081B1A84: .4byte 0x085C9CEF
	thumb_func_end sub_081B1A38

	thumb_func_start sub_081B1A88
sub_081B1A88: @ 0x081B1A88
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	lsls r5, r1, #0x10
	lsrs r4, r5, #0x10
	adds r7, r4, #0
	adds r0, r4, #0
	bl ItemIsMail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B1AB2
	adds r0, r6, #0
	adds r1, r4, #0
	bl GiveMailToMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _081B1AC6
_081B1AB2:
	mov r0, sp
	strb r7, [r0]
	mov r1, sp
	lsrs r0, r5, #0x18
	strb r0, [r1, #1]
	adds r0, r6, #0
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
_081B1AC6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B1A88

	thumb_func_start TryTakeMonItem
TryTakeMonItem: @ 0x081B1AD0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sp
	strh r0, [r1]
	cmp r0, #0
	bne _081B1AEC
	movs r0, #0
	b _081B1B0E
_081B1AEC:
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B1B0C
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	movs r0, #2
	b _081B1B0E
_081B1B0C:
	movs r0, #1
_081B1B0E:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryTakeMonItem

	thumb_func_start pokemon_item_not_removed
pokemon_item_not_removed: @ 0x081B1B18
	push {lr}
	ldr r0, _081B1B28
	ldr r1, _081B1B2C
	bl StringExpandPlaceholders
	pop {r0}
	bx r0
	.align 2, 0
_081B1B28: .4byte 0x02021C7C
_081B1B2C: .4byte 0x085C9D47
	thumb_func_end pokemon_item_not_removed

	thumb_func_start sub_081B1B30
sub_081B1B30: @ 0x081B1B30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _081B1BD8
	adds r7, r0, r1
	ldrh r0, [r7, #4]
	ldrh r1, [r7]
	adds r0, r0, r1
	strh r0, [r7]
	ldrh r0, [r7, #6]
	subs r0, #1
	strh r0, [r7, #6]
	movs r2, #8
	ldrsh r0, [r7, r2]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _081B1BDC
	adds r0, r0, r4
	movs r1, #0x39
	adds r2, r7, #0
	bl SetMonData
	movs r3, #8
	ldrsh r2, [r7, r3]
	adds r0, r2, #0
	muls r0, r5, r0
	adds r0, r0, r4
	ldr r6, _081B1BE0
	lsls r2, r2, #4
	ldr r1, [r6]
	adds r1, r1, r2
	movs r2, #1
	bl DisplayPartyPokemonHPCheck
	movs r0, #8
	ldrsh r2, [r7, r0]
	adds r0, r2, #0
	muls r0, r5, r0
	adds r0, r0, r4
	lsls r2, r2, #4
	ldr r1, [r6]
	adds r1, r1, r2
	bl DisplayPartyPokemonHPBarCheck
	movs r1, #6
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _081B1BAC
	movs r2, #0
	ldrsh r1, [r7, r2]
	cmp r1, #0
	beq _081B1BAC
	movs r3, #2
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bne _081B1BCE
_081B1BAC:
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #0xa
	ldrsh r0, [r7, r2]
	cmp r1, r0
	ble _081B1BC8
	ldr r0, _081B1BE4
	movs r3, #0xa
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
_081B1BC8:
	mov r0, r8
	bl SwitchTaskToFollowupFunc
_081B1BCE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B1BD8: .4byte 0x03005B68
_081B1BDC: .4byte 0x02024190
_081B1BE0: .4byte 0x0203CBA8
_081B1BE4: .4byte 0x02021C54
	thumb_func_end sub_081B1B30

	thumb_func_start sub_081B1BE8
sub_081B1BE8: @ 0x081B1BE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	adds r5, r2, #0
	mov sl, r3
	ldr r7, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, sl
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	movs r0, #0x64
	mov r6, sb
	muls r6, r0, r6
	ldr r0, _081B1C6C
	adds r6, r6, r0
	mov r0, r8
	lsls r4, r0, #2
	add r4, r8
	lsls r4, r4, #3
	ldr r0, _081B1C70
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #0x39
	bl GetMonData
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #0x3a
	bl GetMonData
	strh r0, [r4, #2]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	strh r5, [r4, #4]
	mov r0, sl
	strh r0, [r4, #6]
	mov r0, sb
	strh r0, [r4, #8]
	ldrh r0, [r4]
	strh r0, [r4, #0xa]
	ldr r1, _081B1C74
	mov r0, r8
	adds r2, r7, #0
	bl SetTaskFuncWithFollowupFunc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B1C6C: .4byte 0x02024190
_081B1C70: .4byte 0x03005B68
_081B1C74: .4byte 0x081B1B31
	thumb_func_end sub_081B1BE8

	thumb_func_start sub_081B1C78
sub_081B1C78: @ 0x081B1C78
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081B1C9C
	adds r3, r0, r1
	cmp r5, #5
	bhi _081B1CDA
	lsls r0, r5, #2
	ldr r1, _081B1CA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B1C9C: .4byte 0x03005B68
_081B1CA0: .4byte 0x081B1CA4
_081B1CA4: @ jump table
	.4byte _081B1CBC @ case 0
	.4byte _081B1CC2 @ case 1
	.4byte _081B1CC6 @ case 2
	.4byte _081B1CCA @ case 3
	.4byte _081B1CCE @ case 4
	.4byte _081B1CD2 @ case 5
_081B1CBC:
	strh r2, [r3]
	strh r2, [r3, #0xa]
	b _081B1CDA
_081B1CC2:
	strh r2, [r3, #2]
	b _081B1CDA
_081B1CC6:
	strh r2, [r3, #4]
	b _081B1CDA
_081B1CCA:
	strh r2, [r3, #6]
	b _081B1CDA
_081B1CCE:
	strh r2, [r3, #8]
	b _081B1CDA
_081B1CD2:
	ldr r1, _081B1CE0
	adds r0, r4, #0
	bl SetTaskFuncWithFollowupFunc
_081B1CDA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B1CE0: .4byte 0x081B1B31
	thumb_func_end sub_081B1C78

	thumb_func_start pokemon_ailments_get_primary
pokemon_ailments_get_primary: @ 0x081B1CE4
	push {lr}
	adds r1, r0, #0
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	beq _081B1CF4
	movs r0, #1
	b _081B1D26
_081B1CF4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081B1D00
	movs r0, #2
	b _081B1D26
_081B1D00:
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _081B1D0C
	movs r0, #3
	b _081B1D26
_081B1D0C:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _081B1D18
	movs r0, #4
	b _081B1D26
_081B1D18:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _081B1D24
	movs r0, #0
	b _081B1D26
_081B1D24:
	movs r0, #5
_081B1D26:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end pokemon_ailments_get_primary

	thumb_func_start GetMonAilment
GetMonAilment: @ 0x081B1D2C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _081B1D3E
	movs r0, #7
	b _081B1D66
_081B1D3E:
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _081B1D66
	adds r0, r4, #0
	movs r1, #0
	bl CheckPartyPokerus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B1D64
	movs r0, #0
	b _081B1D66
_081B1D64:
	movs r0, #6
_081B1D66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonAilment

	thumb_func_start sub_081B1D6C
sub_081B1D6C: @ 0x081B1D6C
	push {r4, r5, lr}
	ldr r2, _081B1DBC
	ldrb r1, [r2, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xb
	bne _081B1DF6
	adds r5, r2, #0
	adds r5, #0xe
	movs r0, #0
	strh r0, [r2, #0xe]
	ldr r0, _081B1DC0
	ldrh r0, [r0]
	cmp r0, #0
	bne _081B1DCC
	movs r4, #0
	ldr r0, _081B1DC4
	ldrb r0, [r0]
	cmp r4, r0
	bhs _081B1DF6
_081B1D94:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081B1DC8
	adds r0, r0, r1
	bl sub_081B1E04
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r4
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B1DC4
	ldrb r0, [r0]
	cmp r4, r0
	blo _081B1D94
	b _081B1DF6
	.align 2, 0
_081B1DBC: .4byte 0x0203CB94
_081B1DC0: .4byte 0x02037282
_081B1DC4: .4byte 0x0202418D
_081B1DC8: .4byte 0x02024190
_081B1DCC:
	movs r4, #0
	b _081B1DEE
_081B1DD0:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081B1DFC
	adds r0, r0, r1
	bl sub_081B1E34
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r4
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081B1DEE:
	ldr r0, _081B1E00
	ldrb r0, [r0]
	cmp r4, r0
	blo _081B1DD0
_081B1DF6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B1DFC: .4byte 0x02024190
_081B1E00: .4byte 0x0202418D
	thumb_func_end sub_081B1D6C

	thumb_func_start sub_081B1E04
sub_081B1E04: @ 0x081B1E04
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #1
	beq _081B1E2A
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0802C5FC
	cmp r0, #0
	beq _081B1E2A
	movs r0, #1
	b _081B1E2C
_081B1E2A:
	movs r0, #0
_081B1E2C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081B1E04

	thumb_func_start sub_081B1E34
sub_081B1E34: @ 0x081B1E34
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #1
	beq _081B1E52
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0x55
	bne _081B1E52
	movs r0, #1
	b _081B1E54
_081B1E52:
	movs r0, #0
_081B1E54:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081B1E34

	thumb_func_start sub_081B1E5C
sub_081B1E5C: @ 0x081B1E5C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081B1E78
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _081B1E74
	movs r0, #0
_081B1E74:
	pop {r1}
	bx r1
	.align 2, 0
_081B1E78: .4byte 0x0203CB94
	thumb_func_end sub_081B1E5C

	thumb_func_start sub_081B1E7C
sub_081B1E7C: @ 0x081B1E7C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r0, r5, #0
	bl sub_081B1E5C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B1EAC
	movs r0, #5
	bl PlaySE
	ldr r0, _081B1EA8
	strh r5, [r0]
	adds r0, r4, #0
	bl sub_081B0F90
	b _081B1ECE
	.align 2, 0
_081B1EA8: .4byte 0x02037280
_081B1EAC:
	movs r0, #0x20
	bl PlaySE
	ldr r0, _081B1ED4
	movs r1, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B1ED8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B1EDC
	str r1, [r0]
_081B1ECE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B1ED4: .4byte 0x085CA1FB
_081B1ED8: .4byte 0x03005B60
_081B1EDC: .4byte 0x081B18ED
	thumb_func_end sub_081B1E7C

	thumb_func_start sub_081B1EE0
sub_081B1EE0: @ 0x081B1EE0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081B1F0C
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B1F10
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B1F14
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B1F0C: .4byte 0x085CA210
_081B1F10: .4byte 0x03005B60
_081B1F14: .4byte 0x081B1F19
	thumb_func_end sub_081B1EE0

	thumb_func_start sub_081B1F18
sub_081B1F18: @ 0x081B1F18
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B1F3C
	bl sub_081B2FDC
	ldr r0, _081B1F44
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B1F48
	str r0, [r1]
_081B1F3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B1F44: .4byte 0x03005B60
_081B1F48: .4byte 0x081B1F4D
	thumb_func_end sub_081B1F18

	thumb_func_start sub_081B1F4C
sub_081B1F4C: @ 0x081B1F4C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B1F72
	cmp r1, #0
	bgt _081B1F6C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B1F84
	b _081B1F98
_081B1F6C:
	cmp r1, #1
	beq _081B1F8A
	b _081B1F98
_081B1F72:
	ldr r1, _081B1F80
	movs r0, #7
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_081B0F90
	b _081B1F98
	.align 2, 0
_081B1F80: .4byte 0x02037280
_081B1F84:
	movs r0, #5
	bl PlaySE
_081B1F8A:
	ldr r0, _081B1FA0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B1FA4
	str r0, [r1]
_081B1F98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B1FA0: .4byte 0x03005B60
_081B1FA4: .4byte 0x081B18ED
	thumb_func_end sub_081B1F4C

	thumb_func_start CanMonLearnTMTutor
CanMonLearnTMTutor: @ 0x081B1FA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r7, r4, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	mov r8, r6
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	beq _081B1FCA
	movs r0, #3
	b _081B2026
_081B1FCA:
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r4, r0
	bls _081B1FEC
	adds r1, r4, #0
	subs r1, #0x21
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl CanMonLearnTMHM
	cmp r0, #0
	beq _081B2004
	adds r0, r7, #0
	bl ItemIdToBattleMoveId
	b _081B200E
_081B1FEC:
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl CanLearnTutorMove
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B2008
_081B2004:
	movs r0, #1
	b _081B2026
_081B2008:
	mov r0, r8
	bl GetTutorMove
_081B200E:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r5, #0
	bl MonKnowsMove
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B2024
	movs r0, #0
	b _081B2026
_081B2024:
	movs r0, #2
_081B2026:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CanMonLearnTMTutor

	thumb_func_start GetTutorMove
GetTutorMove: @ 0x081B2030
	lsls r0, r0, #0x18
	ldr r1, _081B203C
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_081B203C: .4byte 0x085E08C4
	thumb_func_end GetTutorMove

	thumb_func_start CanLearnTutorMove
CanLearnTutorMove: @ 0x081B2040
	push {lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _081B2060
	lsrs r0, r0, #0xe
	adds r0, r0, r2
	movs r2, #1
	lsls r2, r1
	ldr r0, [r0]
	ands r0, r2
	cmp r0, #0
	bne _081B2064
	movs r0, #0
	b _081B2066
	.align 2, 0
_081B2060: .4byte 0x085E0900
_081B2064:
	movs r0, #1
_081B2066:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanLearnTutorMove

	thumb_func_start sub_081B206C
sub_081B206C: @ 0x081B206C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _081B2094
	cmp r0, #1
	bgt _081B2082
	cmp r0, #0
	beq _081B2088
	b _081B20AC
_081B2082:
	cmp r1, #2
	beq _081B20A0
	b _081B20AC
_081B2088:
	ldr r0, _081B2090
	bl InitWindows
	b _081B20B2
	.align 2, 0
_081B2090: .4byte 0x085E10C8
_081B2094:
	ldr r0, _081B209C
	bl InitWindows
	b _081B20B2
	.align 2, 0
_081B209C: .4byte 0x085E1108
_081B20A0:
	ldr r0, _081B20A8
	bl InitWindows
	b _081B20B2
	.align 2, 0
_081B20A8: .4byte 0x085E1148
_081B20AC:
	ldr r0, _081B20F0
	bl InitWindows
_081B20B2:
	bl DeactivateAllTextPrinters
	movs r4, #0
_081B20B8:
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _081B20B8
	movs r0, #0
	movs r1, #0x4f
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	bl GetOverworldTextboxPalettePtr
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _081B20F4
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B20F0: .4byte 0x085E1188
_081B20F4: .4byte 0x085D7B04
	thumb_func_end sub_081B206C

	thumb_func_start sub_081B20F8
sub_081B20F8: @ 0x081B20F8
	push {r4, r5, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081B2160
	ldrb r1, [r0, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #5
	beq _081B21EE
	cmp r2, #1
	bne _081B2174
	ldr r0, _081B2164
	bl AddWindow
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _081B2168
	str r0, [sp, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	ldr r0, _081B216C
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #8
	movs r3, #2
	bl AddTextPrinterParameterized4
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, _081B2170
	bl AddWindow
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0xa
	b _081B2180
	.align 2, 0
_081B2160: .4byte 0x0203CB94
_081B2164: .4byte 0x085E11D0
_081B2168: .4byte 0x085E10B4
_081B216C: .4byte 0x085C93BB
_081B2170: .4byte 0x085E11C8
_081B2174:
	ldr r0, _081B21B0
	bl AddWindow
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0xc
_081B2180:
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _081B21B4
	ldrb r1, [r0, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	beq _081B21C0
	ldr r0, _081B21B8
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	ldr r0, _081B21BC
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	b _081B21DA
	.align 2, 0
_081B21B0: .4byte 0x085E11C0
_081B21B4: .4byte 0x0203CB94
_081B21B8: .4byte 0x085E10B4
_081B21BC: .4byte 0x085C93C4
_081B21C0:
	ldr r0, _081B21F8
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	ldr r0, _081B21FC
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
_081B21DA:
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
_081B21EE:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B21F8: .4byte 0x085E10B4
_081B21FC: .4byte 0x085C93C8
	thumb_func_end sub_081B20F8

	thumb_func_start GetPartyMenuPaletteFromBuffer
GetPartyMenuPaletteFromBuffer: @ 0x081B2200
	lsls r0, r0, #0x18
	ldr r1, _081B2210
	lsrs r0, r0, #0x17
	adds r0, #0x18
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_081B2210: .4byte 0x0203CB90
	thumb_func_end GetPartyMenuPaletteFromBuffer

	thumb_func_start BlitBitmapToPartyWindow
BlitBitmapToPartyWindow: @ 0x081B2214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x4c]
	ldr r4, [sp, #0x50]
	ldr r5, [sp, #0x54]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r6, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov sl, r5
	mov r0, sl
	muls r0, r6, r0
	lsls r0, r0, #5
	bl AllocZeroed
	mov sb, r0
	cmp r0, #0
	beq _081B22E2
	movs r5, #0
	ldr r0, [sp, #0x14]
	lsls r0, r0, #0x13
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	lsls r1, r1, #0x13
	str r1, [sp, #0x20]
	lsls r2, r6, #0x13
	str r2, [sp, #0x24]
	mov r0, sl
	lsls r0, r0, #0x13
	str r0, [sp, #0x28]
	cmp r5, sl
	bhs _081B22C0
_081B2276:
	movs r4, #0
	adds r1, r5, #1
	mov r8, r1
	cmp r4, r6
	bhs _081B22B6
	ldr r2, [sp, #0x18]
	adds r0, r2, r5
	ldr r2, [sp, #0x10]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r7, r1, #0
_081B228C:
	ldr r1, [sp, #0x14]
	adds r0, r1, r4
	adds r0, r0, r7
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl GetPartyMiscGraphicsTile
	adds r1, r5, #0
	muls r1, r6, r1
	adds r1, r1, r4
	lsls r1, r1, #5
	add r1, sb
	movs r2, #0x10
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _081B228C
_081B22B6:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, sl
	blo _081B2276
_081B22C0:
	ldr r0, [sp, #0x1c]
	lsrs r2, r0, #0x10
	ldr r1, [sp, #0x20]
	lsrs r3, r1, #0x10
	ldr r1, [sp, #0x24]
	lsrs r0, r1, #0x10
	str r0, [sp]
	ldr r1, [sp, #0x28]
	lsrs r0, r1, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r1, sb
	bl BlitBitmapToWindow
	mov r0, sb
	bl Free
_081B22E2:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BlitBitmapToPartyWindow

	thumb_func_start BlitBitmapToPartyWindow_Default1
BlitBitmapToPartyWindow_Default1: @ 0x081B22F4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	cmp r3, #0
	bne _081B2320
	cmp r4, #0
	bne _081B2320
	movs r3, #0xa
	movs r4, #7
_081B2320:
	cmp r5, #0
	bne _081B233C
	ldr r1, _081B2338
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0xa
	adds r3, r6, #0
	bl BlitBitmapToPartyWindow
	b _081B234C
	.align 2, 0
_081B2338: .4byte 0x085E1240
_081B233C:
	ldr r1, _081B2354
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0xa
	adds r3, r6, #0
	bl BlitBitmapToPartyWindow
_081B234C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B2354: .4byte 0x085E1286
	thumb_func_end BlitBitmapToPartyWindow_Default1

	thumb_func_start BlitBitmapToPartyWindow_Default2
BlitBitmapToPartyWindow_Default2: @ 0x081B2358
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	cmp r3, #0
	bne _081B2384
	cmp r4, #0
	bne _081B2384
	movs r3, #0x12
	movs r4, #3
_081B2384:
	cmp r5, #0
	bne _081B23A0
	ldr r1, _081B239C
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0x12
	adds r3, r6, #0
	bl BlitBitmapToPartyWindow
	b _081B23B0
	.align 2, 0
_081B239C: .4byte 0x085E12CC
_081B23A0:
	ldr r1, _081B23B8
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0x12
	adds r3, r6, #0
	bl BlitBitmapToPartyWindow
_081B23B0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B23B8: .4byte 0x085E1302
	thumb_func_end BlitBitmapToPartyWindow_Default2

	thumb_func_start DrawEmptySlot
DrawEmptySlot: @ 0x081B23BC
	push {lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081B23E0
	movs r2, #0
	str r2, [sp]
	movs r2, #0x12
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	movs r2, #0x12
	movs r3, #0
	bl BlitBitmapToPartyWindow
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B23E0: .4byte 0x085E1338
	thumb_func_end DrawEmptySlot

	thumb_func_start UpdateSelectedPartyBox
UpdateSelectedPartyBox: @ 0x081B23E4
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r5, r4, #0
	ldrb r0, [r0, #8]
	movs r1, #5
	bl GetWindowAttribute
	lsls r0, r0, #0x1c
	lsrs r6, r0, #0x18
	adds r7, r6, #0
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _081B2418
	ldr r5, _081B2410
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B2414
	b _081B261A
	.align 2, 0
_081B2410: .4byte 0x085E13A9
_081B2414: .4byte 0x085E1378
_081B2418:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _081B2474
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _081B2430
	ldr r5, _081B242C
	b _081B25DE
	.align 2, 0
_081B242C: .4byte 0x085E1397
_081B2430:
	ldr r5, _081B2468
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B246C
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldr r5, _081B2470
	b _081B2612
	.align 2, 0
_081B2468: .4byte 0x085E1397
_081B246C: .4byte 0x085E1372
_081B2470: .4byte 0x085E13A6
_081B2474:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _081B24C0
	ldr r5, _081B24B4
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B24B8
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldr r5, _081B24BC
	b _081B2612
	.align 2, 0
_081B24B4: .4byte 0x085E1397
_081B24B8: .4byte 0x085E1372
_081B24BC: .4byte 0x085E13A6
_081B24C0:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _081B251C
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _081B24D8
	ldr r5, _081B24D4
	b _081B25DE
	.align 2, 0
_081B24D4: .4byte 0x085E1397
_081B24D8:
	ldr r5, _081B2510
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B2514
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldr r5, _081B2518
	b _081B2612
	.align 2, 0
_081B2510: .4byte 0x085E1397
_081B2514: .4byte 0x085E1372
_081B2518: .4byte 0x085E13A6
_081B251C:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _081B2578
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _081B2534
	ldr r5, _081B2530
	b _081B25DE
	.align 2, 0
_081B2530: .4byte 0x085E1394
_081B2534:
	ldr r5, _081B256C
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B2570
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldr r5, _081B2574
	b _081B2612
	.align 2, 0
_081B256C: .4byte 0x085E138B
_081B2570: .4byte 0x085E1372
_081B2574: .4byte 0x085E13A0
_081B2578:
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _081B25D4
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _081B2590
	ldr r5, _081B258C
	b _081B25DE
	.align 2, 0
_081B258C: .4byte 0x085E1391
_081B2590:
	ldr r5, _081B25C8
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B25CC
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldr r5, _081B25D0
	b _081B2612
	.align 2, 0
_081B25C8: .4byte 0x085E1388
_081B25CC: .4byte 0x085E1372
_081B25D0: .4byte 0x085E139D
_081B25D4:
	movs r0, #1
	ands r5, r0
	cmp r5, #0
	beq _081B2658
	ldr r5, _081B2648
_081B25DE:
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B264C
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldr r5, _081B2650
_081B2612:
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B2654
_081B261A:
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	b _081B26C0
	.align 2, 0
_081B2648: .4byte 0x085E138E
_081B264C: .4byte 0x085E1372
_081B2650: .4byte 0x085E13A3
_081B2654: .4byte 0x085E1375
_081B2658:
	ldr r5, _081B26C8
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B26CC
	ldrb r1, [r4]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
	ldr r5, _081B26D0
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B26D4
	ldrb r1, [r4]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #2]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #2]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
_081B26C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B26C8: .4byte 0x085E1385
_081B26CC: .4byte 0x085E1372
_081B26D0: .4byte 0x085E139A
_081B26D4: .4byte 0x085E1375
	thumb_func_end UpdateSelectedPartyBox

	thumb_func_start DisplayPartyPokemonBarDetail
DisplayPartyPokemonBarDetail: @ 0x081B26D8
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r5, [r3]
	ldrb r3, [r3, #1]
	lsls r4, r2, #1
	adds r4, r4, r2
	ldr r2, _081B2708
	adds r4, r4, r2
	str r4, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0
	adds r2, r5, #0
	bl AddTextPrinterParameterized3
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B2708: .4byte 0x085E10B4
	thumb_func_end DisplayPartyPokemonBarDetail

	thumb_func_start DisplayPartyPokemonNickname
DisplayPartyPokemonNickname: @ 0x081B270C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B275C
	cmp r4, #1
	bne _081B2746
	ldr r5, [r6]
	ldrb r0, [r6, #8]
	ldrb r1, [r5, #4]
	lsrs r1, r1, #3
	ldrb r2, [r5, #5]
	lsrs r2, r2, #3
	ldrb r3, [r5, #6]
	lsrs r3, r3, #3
	ldrb r4, [r5, #7]
	lsrs r4, r4, #3
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	bl _call_via_r4
_081B2746:
	adds r0, r7, #0
	add r1, sp, #8
	bl GetMonNickname
	ldrb r0, [r6, #8]
	ldr r3, [r6]
	adds r3, #4
	add r1, sp, #8
	movs r2, #0
	bl DisplayPartyPokemonBarDetail
_081B275C:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DisplayPartyPokemonNickname

	thumb_func_start DisplayPartyPokemonLevelCheck
DisplayPartyPokemonLevelCheck: @ 0x081B2764
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	mov r8, r4
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B27D0
	adds r0, r6, #0
	bl GetMonAilment
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081B2792
	cmp r0, #6
	bne _081B27D0
_081B2792:
	cmp r4, #0
	beq _081B27B8
	ldr r5, [r7]
	ldrb r0, [r7, #8]
	ldrb r1, [r5, #8]
	lsrs r1, r1, #3
	ldrb r2, [r5, #9]
	lsrs r2, r2, #3
	adds r2, #1
	ldrb r3, [r5, #0xa]
	lsrs r3, r3, #3
	ldrb r4, [r5, #0xb]
	lsrs r4, r4, #3
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	bl _call_via_r4
_081B27B8:
	mov r0, r8
	cmp r0, #2
	beq _081B27D0
	adds r0, r6, #0
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl DisplayPartyPokemonLevel
_081B27D0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DisplayPartyPokemonLevelCheck

	thumb_func_start DisplayPartyPokemonLevel
DisplayPartyPokemonLevel: @ 0x081B27DC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r5, _081B281C
	adds r0, r5, #0
	adds r1, r2, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _081B2820
	ldr r1, _081B2824
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	adds r1, r5, #0
	bl StringAppend
	ldrb r0, [r6, #8]
	ldr r3, [r6]
	adds r3, #8
	adds r1, r4, #0
	movs r2, #0
	bl DisplayPartyPokemonBarDetail
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B281C: .4byte 0x02021C54
_081B2820: .4byte 0x02021C40
_081B2824: .4byte 0x085C940E
	thumb_func_end DisplayPartyPokemonLevel

	thumb_func_start DisplayPartyPokemonGenderNidoranCheck
DisplayPartyPokemonGenderNidoranCheck: @ 0x081B2828
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #1
	bne _081B285A
	ldr r5, [r7]
	ldrb r0, [r7, #8]
	ldrb r1, [r5, #0xc]
	lsrs r1, r1, #3
	ldrb r2, [r5, #0xd]
	lsrs r2, r2, #3
	adds r2, #1
	ldrb r3, [r5, #0xe]
	lsrs r3, r3, #3
	ldrb r4, [r5, #0xf]
	lsrs r4, r4, #3
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	bl _call_via_r4
_081B285A:
	adds r0, r6, #0
	add r1, sp, #8
	bl GetMonNickname
	adds r0, r6, #0
	bl GetMonGender
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	add r2, sp, #8
	adds r3, r7, #0
	bl DisplayPartyPokemonGender
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DisplayPartyPokemonGenderNidoranCheck

	thumb_func_start DisplayPartyPokemonGender
DisplayPartyPokemonGender: @ 0x081B2890
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r2
	adds r7, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r5, r4, #0
	ldrb r0, [r7, #8]
	movs r1, #5
	bl GetWindowAttribute
	lsls r0, r0, #0x1c
	lsrs r6, r0, #0x18
	cmp r4, #0
	beq _081B2956
	cmp r4, #0x20
	beq _081B28C0
	cmp r4, #0x1d
	bne _081B28D4
_081B28C0:
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r0, _081B28E0
	adds r1, r1, r0
	mov r0, sb
	bl StringCompare
	cmp r0, #0
	beq _081B2956
_081B28D4:
	mov r0, r8
	cmp r0, #0
	beq _081B28E4
	cmp r0, #0xfe
	beq _081B2924
	b _081B2956
	.align 2, 0
_081B28E0: .4byte 0x082EA31C
_081B28E4:
	ldr r5, _081B2918
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B291C
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r7, #8]
	ldr r1, _081B2920
	ldr r3, [r7]
	adds r3, #0xc
	movs r2, #2
	bl DisplayPartyPokemonBarDetail
	b _081B2956
	.align 2, 0
_081B2918: .4byte 0x085E137B
_081B291C: .4byte 0x085E136E
_081B2920: .4byte 0x085C940A
_081B2924:
	ldr r5, _081B2964
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B2968
	ldrb r1, [r4]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r6
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r7, #8]
	ldr r1, _081B296C
	ldr r3, [r7]
	adds r3, #0xc
	movs r2, #2
	bl DisplayPartyPokemonBarDetail
_081B2956:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B2964: .4byte 0x085E137D
_081B2968: .4byte 0x085E136E
_081B296C: .4byte 0x085C940C
	thumb_func_end DisplayPartyPokemonGender

	thumb_func_start DisplayPartyPokemonHPCheck
DisplayPartyPokemonHPCheck: @ 0x081B2970
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	mov r8, r4
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B29CA
	cmp r4, #0
	beq _081B29B2
	ldr r5, [r6]
	ldrb r0, [r6, #8]
	ldrb r1, [r5, #0x10]
	lsrs r1, r1, #3
	ldrb r2, [r5, #0x11]
	lsrs r2, r2, #3
	adds r2, #1
	ldrb r3, [r5, #0x12]
	lsrs r3, r3, #3
	ldrb r4, [r5, #0x13]
	lsrs r4, r4, #3
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	bl _call_via_r4
_081B29B2:
	mov r0, r8
	cmp r0, #2
	beq _081B29CA
	adds r0, r7, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl DisplayPartyPokemonHP
_081B29CA:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DisplayPartyPokemonHPCheck

	thumb_func_start DisplayPartyPokemonHP
DisplayPartyPokemonHP: @ 0x081B29D8
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r5, _081B2A04
	adds r0, r5, #0
	adds r1, r2, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldrb r0, [r4, #8]
	ldr r3, [r4]
	adds r3, #0x10
	adds r1, r5, #0
	movs r2, #0
	bl DisplayPartyPokemonBarDetail
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B2A04: .4byte 0x02021C40
	thumb_func_end DisplayPartyPokemonHP

	thumb_func_start DisplayPartyPokemonMaxHPCheck
DisplayPartyPokemonMaxHPCheck: @ 0x081B2A08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	mov r8, r4
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B2A64
	cmp r4, #0
	beq _081B2A4C
	ldr r5, [r6]
	ldrb r0, [r6, #8]
	ldrb r1, [r5, #0x14]
	lsrs r1, r1, #3
	adds r1, #1
	ldrb r2, [r5, #0x15]
	lsrs r2, r2, #3
	adds r2, #1
	ldrb r3, [r5, #0x16]
	lsrs r3, r3, #3
	ldrb r4, [r5, #0x17]
	lsrs r4, r4, #3
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	bl _call_via_r4
_081B2A4C:
	mov r0, r8
	cmp r0, #2
	beq _081B2A64
	adds r0, r7, #0
	movs r1, #0x3a
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl DisplayPartyPokemonMaxHP
_081B2A64:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DisplayPartyPokemonMaxHPCheck

	thumb_func_start DisplayPartyPokemonMaxHP
DisplayPartyPokemonMaxHP: @ 0x081B2A70
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r5, _081B2AB0
	adds r0, r5, #0
	adds r1, r2, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _081B2AB4
	ldr r1, _081B2AB8
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	adds r1, r5, #0
	bl StringAppend
	ldrb r0, [r6, #8]
	ldr r3, [r6]
	adds r3, #0x14
	adds r1, r4, #0
	movs r2, #0
	bl DisplayPartyPokemonBarDetail
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B2AB0: .4byte 0x02021C54
_081B2AB4: .4byte 0x02021C40
_081B2AB8: .4byte 0x085C93FF
	thumb_func_end DisplayPartyPokemonMaxHP

	thumb_func_start DisplayPartyPokemonHPBarCheck
DisplayPartyPokemonHPBarCheck: @ 0x081B2ABC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B2AF0
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x3a
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	adds r2, r6, #0
	bl DisplayPartyPokemonHPBar
_081B2AF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DisplayPartyPokemonHPBarCheck

	thumb_func_start DisplayPartyPokemonHPBar
DisplayPartyPokemonHPBar: @ 0x081B2AF8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldrb r0, [r6, #8]
	movs r1, #5
	bl GetWindowAttribute
	lsls r0, r0, #0x1c
	lsrs r7, r0, #0x18
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl GetHPBarLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _081B2B44
	cmp r0, #2
	blt _081B2B74
	cmp r0, #4
	bgt _081B2B74
	ldr r5, _081B2B40
	b _081B2B46
	.align 2, 0
_081B2B40: .4byte 0x085E137F
_081B2B44:
	ldr r5, _081B2B6C
_081B2B46:
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B2B70
	ldrb r1, [r4]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
	b _081B2B98
	.align 2, 0
_081B2B6C: .4byte 0x085E1381
_081B2B70: .4byte 0x085E1370
_081B2B74:
	ldr r5, _081B2C34
	ldrb r0, [r5]
	bl GetPartyMenuPaletteFromBuffer
	ldr r4, _081B2C38
	ldrb r1, [r4]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
	ldrb r0, [r5, #1]
	bl GetPartyMenuPaletteFromBuffer
	ldrb r1, [r4, #1]
	adds r1, r1, r7
	movs r2, #2
	bl LoadPalette
_081B2B98:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r2, [r6]
	ldrb r2, [r2, #0x1a]
	bl GetScaledHPFraction
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r6, #8]
	ldr r4, _081B2C38
	ldrb r1, [r4, #1]
	ldr r3, [r6]
	ldrb r2, [r3, #0x18]
	ldrb r3, [r3, #0x19]
	str r5, [sp]
	movs r7, #1
	str r7, [sp, #4]
	bl FillWindowPixelRect
	ldrb r0, [r6, #8]
	ldrb r1, [r4]
	ldr r3, [r6]
	ldrb r2, [r3, #0x18]
	ldrb r3, [r3, #0x19]
	adds r3, #1
	str r5, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl FillWindowPixelRect
	ldr r1, [r6]
	ldrb r0, [r1, #0x1a]
	cmp r5, r0
	beq _081B2C1C
	ldrb r0, [r6, #8]
	ldrb r2, [r1, #0x18]
	adds r2, r2, r5
	ldrb r3, [r1, #0x19]
	ldrb r1, [r1, #0x1a]
	subs r1, r1, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	str r7, [sp, #4]
	movs r1, #0xd
	bl FillWindowPixelRect
	ldrb r0, [r6, #8]
	ldr r1, [r6]
	ldrb r2, [r1, #0x18]
	adds r2, r2, r5
	ldrb r3, [r1, #0x19]
	adds r3, #1
	ldrb r1, [r1, #0x1a]
	subs r1, r1, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	str r4, [sp, #4]
	movs r1, #2
	bl FillWindowPixelRect
_081B2C1C:
	ldrb r0, [r6, #8]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B2C34: .4byte 0x085E1383
_081B2C38: .4byte 0x085E1370
	thumb_func_end DisplayPartyPokemonHPBar

	thumb_func_start DisplayPartyPokemonOtherText
DisplayPartyPokemonOtherText: @ 0x081B2C3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r7, r2, #0
	cmp r7, #0
	beq _081B2C76
	ldr r5, [r6]
	ldrb r0, [r6, #8]
	ldrb r1, [r5, #0x1c]
	lsrs r1, r1, #3
	ldrb r2, [r5, #0x1d]
	lsrs r2, r2, #3
	ldrb r3, [r5, #0x1e]
	lsrs r3, r3, #3
	ldrb r4, [r5, #0x1f]
	lsrs r4, r4, #3
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	ldr r4, [r5]
	bl _call_via_r4
_081B2C76:
	cmp r7, #2
	beq _081B2C9C
	ldrb r0, [r6, #8]
	ldr r1, [r6]
	ldrb r2, [r1, #0x1c]
	ldrb r3, [r1, #0x1d]
	ldr r1, _081B2CA8
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r4, _081B2CAC
	mov r5, r8
	lsls r1, r5, #2
	adds r1, r1, r4
	ldr r1, [r1]
	str r1, [sp, #8]
	movs r1, #1
	bl AddTextPrinterParameterized3
_081B2C9C:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B2CA8: .4byte 0x085E10B4
_081B2CAC: .4byte 0x085E1418
	thumb_func_end DisplayPartyPokemonOtherText

	thumb_func_start sub_081B2CB0
sub_081B2CB0: @ 0x081B2CB0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _081B2CD0
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl RemoveWindow
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
_081B2CD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B2CB0

	thumb_func_start display_pokemon_menu_message
display_pokemon_menu_message: @ 0x081B2CD8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, _081B2D08
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0xd
	ldrb r0, [r4, #0xd]
	cmp r0, #0xff
	beq _081B2CF2
	adds r0, r5, #0
	bl sub_081B2CB0
_081B2CF2:
	cmp r6, #0x7f
	beq _081B2DC0
	adds r0, r6, #0
	subs r0, #0x15
	cmp r0, #5
	bhi _081B2D58
	lsls r0, r0, #2
	ldr r1, _081B2D0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B2D08: .4byte 0x0203CB90
_081B2D0C: .4byte 0x081B2D10
_081B2D10: @ jump table
	.4byte _081B2D28 @ case 0
	.4byte _081B2D40 @ case 1
	.4byte _081B2D40 @ case 2
	.4byte _081B2D30 @ case 3
	.4byte _081B2D38 @ case 4
	.4byte _081B2D48 @ case 5
_081B2D28:
	ldr r0, _081B2D2C
	b _081B2D4A
	.align 2, 0
_081B2D2C: .4byte 0x085E11E0
_081B2D30:
	ldr r0, _081B2D34
	b _081B2D4A
	.align 2, 0
_081B2D34: .4byte 0x085E11E8
_081B2D38:
	ldr r0, _081B2D3C
	b _081B2D4A
	.align 2, 0
_081B2D3C: .4byte 0x085E11F0
_081B2D40:
	ldr r0, _081B2D44
	b _081B2D4A
	.align 2, 0
_081B2D44: .4byte 0x085E11F8
_081B2D48:
	ldr r0, _081B2D54
_081B2D4A:
	bl AddWindow
	strb r0, [r5]
	b _081B2D60
	.align 2, 0
_081B2D54: .4byte 0x085E1200
_081B2D58:
	ldr r0, _081B2D74
	bl AddWindow
	strb r0, [r4, #0xd]
_081B2D60:
	cmp r6, #0
	bne _081B2D88
	ldr r0, _081B2D78
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _081B2D7C
	movs r6, #2
	b _081B2D88
	.align 2, 0
_081B2D74: .4byte 0x085E11D8
_081B2D78: .4byte 0x0203CB90
_081B2D7C:
	bl sub_081B2DD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B2D88
	movs r6, #1
_081B2D88:
	ldrb r0, [r5]
	movs r1, #0
	movs r2, #0x4f
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r4, _081B2DC8
	ldr r1, _081B2DCC
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldrb r0, [r5]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
_081B2DC0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B2DC8: .4byte 0x02021C7C
_081B2DCC: .4byte 0x085E13AC
	thumb_func_end display_pokemon_menu_message

	thumb_func_start sub_081B2DD0
sub_081B2DD0: @ 0x081B2DD0
	push {r4, r5, r6, r7, lr}
	ldr r7, _081B2DE4
	movs r6, #0
	ldr r0, _081B2DE8
	ldrb r0, [r0, #0xb]
	cmp r0, #1
	bne _081B2DEC
_081B2DDE:
	movs r0, #1
	b _081B2E2E
	.align 2, 0
_081B2DE4: .4byte 0x02024190
_081B2DE8: .4byte 0x0203CB94
_081B2DEC:
	movs r5, #0
_081B2DEE:
	movs r0, #0x64
	muls r0, r5, r0
	adds r4, r7, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B2E1E
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _081B2E18
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	beq _081B2E1E
_081B2E18:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_081B2E1E:
	cmp r6, #1
	bhi _081B2DDE
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _081B2DEE
	movs r0, #0
_081B2E2E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081B2DD0

	thumb_func_start sub_081B2E34
sub_081B2E34: @ 0x081B2E34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	beq _081B2E90
	cmp r4, #1
	bgt _081B2E50
	cmp r4, #0
	beq _081B2E56
	b _081B2EA0
_081B2E50:
	cmp r4, #2
	beq _081B2E98
	b _081B2EA0
_081B2E56:
	ldr r0, _081B2E88
	ldr r1, [r0]
	ldrb r0, [r1, #0x17]
	lsls r0, r0, #1
	movs r3, #0x13
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	ldrb r0, [r1, #0x17]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	ldr r0, _081B2E8C
	str r0, [sp, #0xc]
	add r0, sp, #0x14
	movs r1, #2
	movs r2, #0x15
	bl SetWindowTemplateFields
	b _081B2EAA
	.align 2, 0
_081B2E88: .4byte 0x0203CB90
_081B2E8C: .4byte 0x000002D3
_081B2E90:
	ldr r0, _081B2E94
	b _081B2EA2
	.align 2, 0
_081B2E94: .4byte 0x085E1208
_081B2E98:
	ldr r0, _081B2E9C
	b _081B2EA2
	.align 2, 0
_081B2E9C: .4byte 0x085E1210
_081B2EA0:
	ldr r0, _081B2ECC
_081B2EA2:
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
_081B2EAA:
	add r0, sp, #0x14
	bl AddWindow
	ldr r6, _081B2ED0
	ldr r1, [r6]
	strb r0, [r1, #0xc]
	ldr r0, [r6]
	ldrb r0, [r0, #0xc]
	movs r1, #0
	movs r2, #0x4f
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	cmp r4, #3
	bne _081B2ED4
	ldr r0, [r6]
	b _081B2F74
	.align 2, 0
_081B2ECC: .4byte 0x085E1218
_081B2ED0: .4byte 0x0203CB90
_081B2ED4:
	movs r0, #1
	movs r1, #0
	bl GetMenuCursorDimensionByFont
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r0, #1
	movs r1, #2
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	ldr r0, [r6]
	ldrb r0, [r0, #0x17]
	cmp r5, r0
	bhs _081B2F4E
	adds r7, r6, #0
	movs r6, #0
_081B2EFE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xf
	adds r4, r0, r5
	ldrb r0, [r4]
	movs r2, #3
	cmp r0, #0x12
	bls _081B2F10
	movs r2, #4
_081B2F10:
	ldrb r0, [r1, #0xc]
	lsls r3, r5, #4
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	ldr r2, _081B2F84
	adds r1, r1, r2
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	ldr r2, _081B2F88
	ldrb r1, [r4]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [sp, #0x10]
	movs r1, #1
	mov r2, sb
	bl AddTextPrinterParameterized4
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r7]
	ldrb r0, [r0, #0x17]
	cmp r5, r0
	blo _081B2EFE
_081B2F4E:
	ldr r4, _081B2F8C
	ldr r2, [r4]
	ldrb r0, [r2, #0xc]
	movs r1, #0x10
	str r1, [sp]
	ldrb r1, [r2, #0x17]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	movs r2, #0
	movs r3, #2
	bl sub_0819844C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, [r4]
_081B2F74:
	ldrb r0, [r0, #0xc]
	add sp, #0x1c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081B2F84: .4byte 0x085E10B4
_081B2F88: .4byte 0x085E14C0
_081B2F8C: .4byte 0x0203CB90
	thumb_func_end sub_081B2E34

	thumb_func_start sub_081B2F90
sub_081B2F90: @ 0x081B2F90
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #6
	movs r1, #0
	movs r2, #0x4f
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r2, _081B2FD8
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	bl GetPlayerTextSpeedDelay
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #6
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B2FD8: .4byte 0x030030B4
	thumb_func_end sub_081B2F90

	thumb_func_start sub_081B2FDC
sub_081B2FDC: @ 0x081B2FDC
	push {lr}
	sub sp, #0xc
	ldr r0, _081B3000
	movs r1, #0x4f
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl sub_08198C08
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B3000: .4byte 0x085E1220
	thumb_func_end sub_081B2FDC

	thumb_func_start sub_081B3004
sub_081B3004: @ 0x081B3004
	push {r4, lr}
	ldr r0, _081B302C
	bl AddWindow
	ldr r4, _081B3030
	ldr r1, [r4]
	strb r0, [r1, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #0xc]
	movs r1, #0
	movs r2, #0x4f
	movs r3, #0xd
	bl DrawStdFrameWithCustomTileAndPalette
	ldr r0, [r4]
	ldrb r0, [r0, #0xc]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081B302C: .4byte 0x085E1228
_081B3030: .4byte 0x0203CB90
	thumb_func_end sub_081B3004

	thumb_func_start sub_081B3034
sub_081B3034: @ 0x081B3034
	push {r4, lr}
	ldr r4, _081B3050
	ldr r0, [r4]
	ldrb r0, [r0, #0xc]
	bl ClearWindowTilemap
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B3050: .4byte 0x0203CB90
	thumb_func_end sub_081B3034

	thumb_func_start sub_081B3054
sub_081B3054: @ 0x081B3054
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #0
	bne _081B3068
	bl CreateActionList
	b _081B30A0
_081B3068:
	ldr r4, _081B30A8
	ldr r1, [r4]
	ldr r0, _081B30AC
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r1, #0x17]
	movs r3, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0x17]
	cmp r3, r0
	bhs _081B30A0
	ldr r1, _081B30B0
	lsls r0, r2, #2
	adds r2, r0, r1
_081B3084:
	ldr r1, [r4]
	adds r1, #0xf
	adds r1, r1, r3
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [r4]
	ldrb r0, [r0, #0x17]
	cmp r3, r0
	blo _081B3084
_081B30A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B30A8: .4byte 0x0203CB90
_081B30AC: .4byte 0x085E1628
_081B30B0: .4byte 0x085E15F0
	thumb_func_end sub_081B3054

	thumb_func_start CreateActionList
CreateActionList: @ 0x081B30B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	ldr r2, _081B3128
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #0x17]
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0xf
	adds r1, #0x17
	movs r2, #0
	bl AppendToList
	movs r7, #0
	ldr r0, _081B312C
	ldrh r0, [r0]
	str r0, [sp]
_081B30E6:
	movs r4, #0
	adds r0, r7, #1
	mov r8, r0
	ldr r1, [sp]
	cmp r1, #0xe
	beq _081B3140
	movs r0, #0x64
	mov r6, sl
	muls r6, r0, r6
	ldr r5, _081B312C
_081B30FA:
	mov r1, sb
	adds r0, r1, r6
	adds r1, r7, #0
	adds r1, #0xd
	bl GetMonData
	lsls r1, r4, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	cmp r0, r1
	bne _081B3130
	ldr r0, _081B3128
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xf
	adds r1, #0x17
	adds r2, r4, #0
	adds r2, #0x13
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl AppendToList
	b _081B3140
	.align 2, 0
_081B3128: .4byte 0x0203CB90
_081B312C: .4byte 0x085E1636
_081B3130:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, #0xe
	bne _081B30FA
_081B3140:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _081B30E6
	bl InBattlePike
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B31B8
	mov r0, sb
	adds r0, #0x64
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B3172
	ldr r0, _081B31A4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xf
	adds r1, #0x17
	movs r2, #1
	bl AppendToList
_081B3172:
	movs r0, #0x64
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sb
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B31A8
	ldr r0, _081B31A4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xf
	adds r1, #0x17
	movs r2, #6
	bl AppendToList
	b _081B31B8
	.align 2, 0
_081B31A4: .4byte 0x0203CB90
_081B31A8:
	ldr r0, _081B31D8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xf
	adds r1, #0x17
	movs r2, #3
	bl AppendToList
_081B31B8:
	ldr r0, _081B31D8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xf
	adds r1, #0x17
	movs r2, #2
	bl AppendToList
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B31D8: .4byte 0x0203CB90
	thumb_func_end CreateActionList

	thumb_func_start sub_081B31DC
sub_081B31DC: @ 0x081B31DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _081B31F8
	ldrb r0, [r1, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r2, r1, #0
	cmp r0, #0xc
	bhi _081B329E
	lsls r0, r0, #2
	ldr r1, _081B31FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B31F8: .4byte 0x0203CB94
_081B31FC: .4byte 0x081B3200
_081B3200: @ jump table
	.4byte _081B3234 @ case 0
	.4byte _081B3250 @ case 1
	.4byte _081B329E @ case 2
	.4byte _081B329E @ case 3
	.4byte _081B325C @ case 4
	.4byte _081B329E @ case 5
	.4byte _081B327C @ case 6
	.4byte _081B329E @ case 7
	.4byte _081B328E @ case 8
	.4byte _081B3292 @ case 9
	.4byte _081B3296 @ case 10
	.4byte _081B329E @ case 11
	.4byte _081B329A @ case 12
_081B3234:
	bl InMultiBattleRoom
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B324C
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	beq _081B329E
_081B324C:
	movs r1, #1
	b _081B32A0
_081B3250:
	adds r0, r4, #0
	bl sub_081B86CC
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _081B32A0
_081B325C:
	movs r0, #9
	ldrsb r0, [r2, r0]
	bl sub_081B820C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081B3274
	cmp r0, #1
	beq _081B3278
	movs r1, #7
	b _081B32A0
_081B3274:
	movs r1, #4
	b _081B32A0
_081B3278:
	movs r1, #5
	b _081B32A0
_081B327C:
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	movs r1, #6
	cmp r0, #0
	beq _081B32A0
	movs r1, #7
	b _081B32A0
_081B328E:
	movs r1, #0xa
	b _081B32A0
_081B3292:
	movs r1, #0xb
	b _081B32A0
_081B3296:
	movs r1, #0xc
	b _081B32A0
_081B329A:
	movs r1, #0xd
	b _081B32A0
_081B329E:
	movs r1, #0
_081B32A0:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081B31DC

	thumb_func_start sub_081B32A8
sub_081B32A8: @ 0x081B32A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r4, _081B3304
	movs r1, #9
	ldrsb r1, [r4, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r7, _081B3308
	adds r5, r0, r7
	ldr r1, _081B330C
	adds r0, r5, #0
	bl GetMonNickname
	ldr r0, _081B3310
	ldr r0, [r0]
	adds r0, #0xd
	bl sub_081B2CB0
	ldrb r1, [r4, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xc
	beq _081B3314
	ldrb r4, [r4, #9]
	adds r0, r5, #0
	bl sub_081B31DC
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_081B3054
	movs r0, #0
	bl sub_081B2E34
	movs r0, #0x15
	bl display_pokemon_menu_message
	b _081B338A
	.align 2, 0
_081B3304: .4byte 0x0203CB94
_081B3308: .4byte 0x02024190
_081B330C: .4byte 0x02021C40
_081B3310: .4byte 0x0203CB90
_081B3314:
	adds r0, r5, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	bne _081B3360
	ldr r4, _081B3350
	ldr r1, _081B3354
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B3358
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B335C
	str r1, [r0]
	movs r0, #0
	b _081B338C
	.align 2, 0
_081B3350: .4byte 0x02021C7C
_081B3354: .4byte 0x085C9CAD
_081B3358: .4byte 0x03005B60
_081B335C: .4byte 0x081B433D
_081B3360:
	ldrb r4, [r4, #9]
	adds r0, r5, #0
	bl sub_081B31DC
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_081B3054
	movs r0, #1
	bl sub_081B2E34
	ldr r1, _081B3398
	adds r0, r6, #0
	bl CopyItemName
	movs r0, #0x1a
	bl display_pokemon_menu_message
_081B338A:
	movs r0, #1
_081B338C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081B3398: .4byte 0x02021C54
	thumb_func_end sub_081B32A8

	thumb_func_start sub_081B339C
sub_081B339C: @ 0x081B339C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_081B32A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B33C0
	ldr r1, _081B33C8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r1, _081B33CC
	str r1, [r0]
_081B33C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B33C8: .4byte 0x03005B60
_081B33CC: .4byte 0x081B33D1
	thumb_func_end sub_081B339C

	thumb_func_start HandleMenuInput
HandleMenuInput: @ 0x081B33D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _081B3408
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B348E
	bl sub_081221F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B348E
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081B340C
	adds r5, r0, r1
	ldr r0, _081B3410
	ldr r0, [r0]
	ldrb r0, [r0, #0x17]
	cmp r0, #3
	bhi _081B3414
	bl Menu_ProcessInputNoWrapAround_other
	b _081B3418
	.align 2, 0
_081B3408: .4byte 0x02037C74
_081B340C: .4byte 0x03005B68
_081B3410: .4byte 0x0203CB90
_081B3414:
	bl ProcessMenuInput_other
_081B3418:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_GetCursorPos
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	beq _081B348E
	adds r0, #1
	cmp r5, r0
	bne _081B346C
	movs r0, #5
	bl PlaySE
	ldr r4, _081B3464
	ldr r0, [r4]
	adds r0, #0xe
	bl sub_081B2CB0
	ldr r2, _081B3468
	ldr r0, [r4]
	ldrb r1, [r0, #0x17]
	adds r0, r0, r1
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	b _081B348E
	.align 2, 0
_081B3464: .4byte 0x0203CB90
_081B3468: .4byte 0x085E14C0
_081B346C:
	ldr r4, _081B3494
	ldr r0, [r4]
	adds r0, #0xe
	bl sub_081B2CB0
	ldr r1, _081B3498
	ldr r0, [r4]
	adds r0, #0xf
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
_081B348E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B3494: .4byte 0x0203CB90
_081B3498: .4byte 0x085E14C0
	thumb_func_end HandleMenuInput

	thumb_func_start CursorCb_Give
CursorCb_Give: @ 0x081B349C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	ldr r0, _081B34C0
	ldr r1, [r0]
	ldr r0, _081B34C4
	str r0, [r1, #4]
	adds r0, r4, #0
	bl sub_081B0F90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B34C0: .4byte 0x0203CB90
_081B34C4: .4byte 0x081B34C9
	thumb_func_end CursorCb_Give

	thumb_func_start sub_081B34C8
sub_081B34C8: @ 0x081B34C8
	push {r4, lr}
	sub sp, #4
	ldr r4, _081B34F8
	ldrb r1, [r4, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _081B3508
	bl pokemon_change_order
	ldr r1, _081B34FC
	ldrb r2, [r4, #9]
	ldr r0, _081B3500
	ldrb r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _081B3504
	str r0, [sp]
	movs r0, #1
	bl ShowPokemonSummaryScreen
	b _081B3520
	.align 2, 0
_081B34F8: .4byte 0x0203CB94
_081B34FC: .4byte 0x02024190
_081B3500: .4byte 0x0202418D
_081B3504: .4byte 0x081B3535
_081B3508:
	ldr r1, _081B3528
	ldrb r2, [r4, #9]
	ldr r0, _081B352C
	ldrb r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _081B3530
	str r0, [sp]
	movs r0, #0
	bl ShowPokemonSummaryScreen
_081B3520:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B3528: .4byte 0x02024190
_081B352C: .4byte 0x0202418D
_081B3530: .4byte 0x081B3535
	thumb_func_end sub_081B34C8

	thumb_func_start sub_081B3534
sub_081B3534: @ 0x081B3534
	push {lr}
	sub sp, #0xc
	ldr r2, _081B356C
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r3, _081B3570
	ldr r0, _081B3574
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r3, #0xb]
	movs r1, #0x15
	str r1, [sp]
	ldr r1, _081B3578
	str r1, [sp, #4]
	ldr r1, [r3]
	str r1, [sp, #8]
	movs r1, #0xff
	movs r3, #1
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B356C: .4byte 0x02037C74
_081B3570: .4byte 0x0203CB94
_081B3574: .4byte 0x0203CBEC
_081B3578: .4byte 0x081B339D
	thumb_func_end sub_081B3534

	thumb_func_start CursorCb_Switch
CursorCb_Switch: @ 0x081B357C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	movs r0, #5
	bl PlaySE
	ldr r5, _081B35C8
	movs r0, #8
	strb r0, [r5, #0xb]
	ldr r4, _081B35CC
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	movs r0, #3
	bl display_pokemon_menu_message
	ldrb r0, [r5, #9]
	movs r1, #1
	bl sub_081B0C9C
	ldrb r0, [r5, #9]
	strb r0, [r5, #0xa]
	ldr r1, _081B35D0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B35D4
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B35C8: .4byte 0x0203CB94
_081B35CC: .4byte 0x0203CB90
_081B35D0: .4byte 0x03005B60
_081B35D4: .4byte 0x081B1041
	thumb_func_end CursorCb_Switch

	thumb_func_start sub_081B35D8
sub_081B35D8: @ 0x081B35D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _081B3600
	adds r6, r0, r1
	ldr r3, _081B3604
	movs r1, #0xa
	ldrsb r1, [r3, r1]
	movs r0, #9
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne _081B3608
	adds r0, r7, #0
	bl sub_081B3D1C
	b _081B375A
	.align 2, 0
_081B3600: .4byte 0x03005B68
_081B3604: .4byte 0x0203CB94
_081B3608:
	add r2, sp, #8
	movs r0, #9
	ldrsb r0, [r3, r0]
	ldr r1, _081B3660
	ldr r1, [r1]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	movs r4, #0
	strb r0, [r2]
	adds r0, r2, #0
	ldrb r0, [r0]
	movs r1, #1
	bl GetWindowAttribute
	strh r0, [r6]
	add r0, sp, #8
	ldrb r0, [r0]
	movs r1, #2
	bl GetWindowAttribute
	strh r0, [r6, #2]
	add r0, sp, #8
	ldrb r0, [r0]
	movs r1, #3
	bl GetWindowAttribute
	strh r0, [r6, #4]
	add r0, sp, #8
	ldrb r0, [r0]
	movs r1, #4
	bl GetWindowAttribute
	strh r0, [r6, #6]
	strh r4, [r6, #0x10]
	movs r1, #4
	ldrsh r0, [r6, r1]
	cmp r0, #0xa
	bne _081B3664
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r2, #0
	b _081B3666
	.align 2, 0
_081B3660: .4byte 0x0203CBA8
_081B3664:
	movs r0, #1
_081B3666:
	strh r0, [r6, #0x14]
	add r2, sp, #8
	ldr r0, _081B36C4
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, _081B36C8
	ldr r1, [r1]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	movs r4, #0
	strb r0, [r2, #1]
	adds r0, r2, #0
	ldrb r0, [r0, #1]
	movs r1, #1
	bl GetWindowAttribute
	strh r0, [r6, #8]
	add r0, sp, #8
	ldrb r0, [r0, #1]
	movs r1, #2
	bl GetWindowAttribute
	strh r0, [r6, #0xa]
	add r0, sp, #8
	ldrb r0, [r0, #1]
	movs r1, #3
	bl GetWindowAttribute
	strh r0, [r6, #0xc]
	add r0, sp, #8
	ldrb r0, [r0, #1]
	movs r1, #4
	bl GetWindowAttribute
	strh r0, [r6, #0xe]
	strh r4, [r6, #0x12]
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #0xa
	bne _081B36CC
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r2, #0
	b _081B36CE
	.align 2, 0
_081B36C4: .4byte 0x0203CB94
_081B36C8: .4byte 0x0203CBA8
_081B36CC:
	movs r0, #1
_081B36CE:
	strh r0, [r6, #0x16]
	ldr r4, _081B3764
	movs r0, #4
	ldrsh r1, [r6, r0]
	movs r2, #6
	ldrsh r0, [r6, r2]
	lsls r0, r0, #1
	muls r0, r1, r0
	bl Alloc
	str r0, [r4]
	ldr r5, _081B3768
	movs r0, #0xc
	ldrsh r1, [r6, r0]
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	lsls r0, r0, #1
	muls r0, r1, r0
	bl Alloc
	str r0, [r5]
	ldr r1, [r4]
	ldrb r2, [r6]
	ldrb r3, [r6, #2]
	ldrb r0, [r6, #4]
	str r0, [sp]
	ldrb r0, [r6, #6]
	str r0, [sp, #4]
	movs r0, #0
	bl sub_08199954
	ldr r1, [r5]
	ldrb r2, [r6, #8]
	ldrb r3, [r6, #0xa]
	ldrb r0, [r6, #0xc]
	str r0, [sp]
	ldrb r0, [r6, #0xe]
	str r0, [sp, #4]
	movs r0, #0
	bl sub_08199954
	add r0, sp, #8
	ldrb r0, [r0]
	bl ClearWindowTilemap
	add r0, sp, #8
	ldrb r0, [r0, #1]
	bl ClearWindowTilemap
	ldr r4, _081B376C
	movs r0, #9
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #9]
	movs r1, #1
	bl sub_081B0C9C
	ldrb r0, [r4, #0xa]
	movs r1, #1
	bl sub_081B0C9C
	adds r0, r7, #0
	bl sub_081B3960
	ldr r1, _081B3770
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B3774
	str r1, [r0]
_081B375A:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B3764: .4byte 0x0203CBBC
_081B3768: .4byte 0x0203CBC0
_081B376C: .4byte 0x0203CB94
_081B3770: .4byte 0x03005B60
_081B3774: .4byte 0x081B39E9
	thumb_func_end sub_081B35D8

	thumb_func_start sub_081B3778
sub_081B3778: @ 0x081B3778
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r2, #0
	mov ip, r3
	ldr r7, [sp, #0x18]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r3, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	mov r8, r2
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r4, r1, r0
	cmp r4, #0
	blt _081B37A2
	cmp r1, #0x1f
	ble _081B37A6
_081B37A2:
	movs r0, #0
	b _081B37D4
_081B37A6:
	cmp r1, #0
	bge _081B37BA
	rsbs r0, r1, #0
	strb r0, [r6]
	movs r0, #0
	mov r1, ip
	strb r0, [r1]
	adds r0, r2, r3
	strb r0, [r7]
	b _081B37D2
_081B37BA:
	movs r0, #0
	strb r0, [r6]
	mov r0, ip
	strb r5, [r0]
	cmp r4, #0x1f
	ble _081B37CE
	movs r0, #0x20
	subs r0, r0, r5
	strb r0, [r7]
	b _081B37D2
_081B37CE:
	mov r1, r8
	strb r1, [r7]
_081B37D2:
	movs r0, #1
_081B37D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081B3778

	thumb_func_start sub_081B37E0
sub_081B37E0: @ 0x081B37E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x54]
	ldr r4, [sp, #0x58]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #0x30]
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	lsrs r0, r3, #0x10
	str r0, [sp, #0x2c]
	asrs r3, r3, #0x10
	mov r8, r3
	mov r5, sp
	adds r5, #0x25
	mov r6, sp
	adds r6, #0x26
	str r6, [sp]
	adds r0, r7, #0
	mov r1, r8
	add r2, sp, #0x24
	adds r3, r5, #0
	bl sub_081B3778
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B389A
	ldrb r2, [r5]
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldrb r0, [r6]
	str r0, [sp]
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	mov r3, sb
	bl FillBgTilemapBufferRect_Palette0
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r7, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r6, [sp]
	mov r1, r8
	add r2, sp, #0x24
	adds r3, r5, #0
	bl sub_081B3778
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B389A
	add r0, sp, #0x24
	ldrb r2, [r0]
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5]
	str r0, [sp, #8]
	mov r0, sb
	str r0, [sp, #0xc]
	ldrb r0, [r6]
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0x11
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x28]
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
_081B389A:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B37E0

	thumb_func_start sub_081B38AC
sub_081B38AC: @ 0x081B38AC
	push {r4, lr}
	ldr r4, _081B38FC
	ldrb r2, [r0, #0xb]
	lsls r3, r2, #4
	adds r3, r3, r2
	lsls r3, r3, #2
	adds r3, r3, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0xd
	ldrh r2, [r3, #0x24]
	adds r2, r2, r1
	strh r2, [r3, #0x24]
	ldrb r3, [r0, #0xa]
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r3, [r2, #0x24]
	adds r3, r3, r1
	strh r3, [r2, #0x24]
	ldrb r3, [r0, #9]
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r3, [r2, #0x24]
	adds r3, r3, r1
	strh r3, [r2, #0x24]
	ldrb r2, [r0, #0xc]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r2, [r0, #0x24]
	adds r2, r2, r1
	strh r2, [r0, #0x24]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B38FC: .4byte 0x020205AC
	thumb_func_end sub_081B38AC

	thumb_func_start sub_081B3900
sub_081B3900: @ 0x081B3900
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081B3954
	adds r4, r1, r0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081B392E
	ldr r2, _081B3958
	ldr r0, _081B395C
	movs r1, #9
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	bl sub_081B38AC
_081B392E:
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _081B394C
	ldr r2, _081B3958
	ldr r0, _081B395C
	movs r1, #0xa
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl sub_081B38AC
_081B394C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B3954: .4byte 0x03005B68
_081B3958: .4byte 0x0203CBA8
_081B395C: .4byte 0x0203CB94
	thumb_func_end sub_081B3900

	thumb_func_start sub_081B3960
sub_081B3960: @ 0x081B3960
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081B39DC
	adds r5, r1, r0
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _081B39A0
	ldr r0, _081B39E0
	ldr r0, [r0]
	ldrh r1, [r5, #0x10]
	ldrh r2, [r5]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r4, #4
	ldrsh r3, [r5, r4]
	movs r6, #6
	ldrsh r4, [r5, r6]
	str r4, [sp]
	movs r6, #0x14
	ldrsh r4, [r5, r6]
	str r4, [sp, #4]
	bl sub_081B37E0
_081B39A0:
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _081B39CE
	ldr r0, _081B39E4
	ldr r0, [r0]
	ldrh r1, [r5, #0x12]
	ldrh r2, [r5, #8]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xa
	ldrsh r2, [r5, r3]
	movs r4, #0xc
	ldrsh r3, [r5, r4]
	movs r6, #0xe
	ldrsh r4, [r5, r6]
	str r4, [sp]
	movs r6, #0x16
	ldrsh r4, [r5, r6]
	str r4, [sp, #4]
	bl sub_081B37E0
_081B39CE:
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B39DC: .4byte 0x03005B68
_081B39E0: .4byte 0x0203CBBC
_081B39E4: .4byte 0x0203CBC0
	thumb_func_end sub_081B3960

	thumb_func_start sub_081B39E8
sub_081B39E8: @ 0x081B39E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r7, r0, #3
	ldr r0, _081B3AE8
	mov r8, r0
	adds r6, r7, r0
	adds r0, r4, #0
	bl sub_081B3960
	adds r0, r4, #0
	bl sub_081B3900
	ldrh r1, [r6, #0x14]
	ldrh r2, [r6, #0x10]
	adds r1, r1, r2
	strh r1, [r6, #0x10]
	ldrh r0, [r6, #0x16]
	ldrh r3, [r6, #0x12]
	adds r0, r0, r3
	strh r0, [r6, #0x12]
	add r2, sp, #8
	ldrh r0, [r6]
	adds r0, r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	ldrh r0, [r6, #0x12]
	ldrh r3, [r6, #8]
	adds r2, r0, r3
	strh r2, [r1, #2]
	adds r0, r1, #0
	ldrh r0, [r0]
	cmp r0, #0x21
	bls _081B3ADA
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x21
	bls _081B3ADA
	movs r1, #0x14
	ldrsh r0, [r6, r1]
	rsbs r0, r0, #0
	strh r0, [r6, #0x14]
	movs r2, #0x16
	ldrsh r0, [r6, r2]
	rsbs r0, r0, #0
	strh r0, [r6, #0x16]
	bl swap_pokemon_and_oams
	ldr r4, _081B3AEC
	ldrb r0, [r4, #9]
	bl DisplayPartyPokemonData
	ldrb r0, [r4, #0xa]
	bl DisplayPartyPokemonData
	movs r0, #9
	ldrsb r0, [r4, r0]
	ldr r5, _081B3AF0
	ldr r1, [r5]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	bl PutWindowTilemap
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	ldr r1, [r5]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	bl PutWindowTilemap
	ldr r0, _081B3AF4
	ldr r1, [r0]
	ldrb r2, [r6]
	ldrb r3, [r6, #2]
	ldrb r0, [r6, #4]
	str r0, [sp]
	ldrb r0, [r6, #6]
	str r0, [sp, #4]
	movs r0, #0
	bl sub_08199954
	ldr r0, _081B3AF8
	ldr r1, [r0]
	ldrb r2, [r6, #8]
	ldrb r3, [r6, #0xa]
	ldrb r0, [r6, #0xc]
	str r0, [sp]
	ldrb r0, [r6, #0xe]
	str r0, [sp, #4]
	movs r0, #0
	bl sub_08199954
	movs r0, #9
	ldrsb r0, [r4, r0]
	ldr r1, [r5]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	bl ClearWindowTilemap
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	ldr r1, [r5]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	bl ClearWindowTilemap
	mov r0, r8
	subs r0, #8
	adds r0, r7, r0
	ldr r1, _081B3AFC
	str r1, [r0]
_081B3ADA:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B3AE8: .4byte 0x03005B68
_081B3AEC: .4byte 0x0203CB94
_081B3AF0: .4byte 0x0203CBA8
_081B3AF4: .4byte 0x0203CBBC
_081B3AF8: .4byte 0x0203CBC0
_081B3AFC: .4byte 0x081B3B01
	thumb_func_end sub_081B39E8

	thumb_func_start sub_081B3B00
sub_081B3B00: @ 0x081B3B00
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081B3B70
	adds r4, r0, r1
	adds r0, r6, #0
	bl sub_081B3960
	adds r0, r6, #0
	bl sub_081B3900
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081B3B84
	movs r2, #0x16
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _081B3B84
	ldr r5, _081B3B74
	movs r0, #9
	ldrsb r0, [r5, r0]
	ldr r4, _081B3B78
	ldr r1, [r4]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	bl PutWindowTilemap
	movs r0, #0xa
	ldrsb r0, [r5, r0]
	ldr r1, [r4]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	bl PutWindowTilemap
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _081B3B7C
	ldr r0, [r0]
	bl Free
	ldr r0, _081B3B80
	ldr r0, [r0]
	bl Free
	adds r0, r6, #0
	bl sub_081B3D1C
	b _081B3BA8
	.align 2, 0
_081B3B70: .4byte 0x03005B68
_081B3B74: .4byte 0x0203CB94
_081B3B78: .4byte 0x0203CBA8
_081B3B7C: .4byte 0x0203CBBC
_081B3B80: .4byte 0x0203CBC0
_081B3B84:
	ldrh r1, [r4, #0x14]
	ldrh r0, [r4, #0x10]
	adds r1, r1, r0
	strh r1, [r4, #0x10]
	ldrh r0, [r4, #0x16]
	ldrh r2, [r4, #0x12]
	adds r0, r0, r2
	strh r0, [r4, #0x12]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	bne _081B3B9E
	strh r1, [r4, #0x14]
_081B3B9E:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081B3BA8
	strh r0, [r4, #0x16]
_081B3BA8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B3B00

	thumb_func_start oamt_swap_pos
oamt_swap_pos: @ 0x081B3BB0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldrb r3, [r0]
	ldrb r2, [r1]
	strb r2, [r0]
	strb r3, [r1]
	ldr r5, _081B3C78
	ldrb r2, [r0]
	lsls r3, r2, #4
	adds r3, r3, r2
	lsls r3, r3, #2
	adds r3, r3, r5
	ldrh r6, [r3, #0x20]
	ldrh r2, [r3, #0x22]
	mov r8, r2
	ldrh r2, [r3, #0x24]
	mov sb, r2
	ldrh r2, [r3, #0x26]
	mov sl, r2
	ldrb r4, [r1]
	lsls r2, r4, #4
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r2, r5
	ldrh r2, [r2, #0x20]
	strh r2, [r3, #0x20]
	ldrb r2, [r0]
	lsls r3, r2, #4
	adds r3, r3, r2
	lsls r3, r3, #2
	adds r3, r3, r5
	ldrb r4, [r1]
	lsls r2, r4, #4
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r2, r5
	ldrh r2, [r2, #0x22]
	strh r2, [r3, #0x22]
	ldrb r2, [r0]
	lsls r3, r2, #4
	adds r3, r3, r2
	lsls r3, r3, #2
	adds r3, r3, r5
	ldrb r4, [r1]
	lsls r2, r4, #4
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r2, r5
	ldrh r2, [r2, #0x24]
	strh r2, [r3, #0x24]
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r5
	ldrb r3, [r1]
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x26]
	strh r0, [r2, #0x26]
	ldrb r2, [r1]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x20]
	ldrb r2, [r1]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r2, r8
	strh r2, [r0, #0x22]
	ldrb r2, [r1]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r2, sb
	strh r2, [r0, #0x24]
	ldrb r1, [r1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, sl
	strh r1, [r0, #0x26]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B3C78: .4byte 0x020205AC
	thumb_func_end oamt_swap_pos

	thumb_func_start swap_pokemon_and_oams
swap_pokemon_and_oams: @ 0x081B3C7C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _081B3D10
	ldr r2, _081B3D14
	movs r3, #9
	ldrsb r3, [r2, r3]
	lsls r0, r3, #4
	ldr r1, [r1]
	adds r0, r1, r0
	str r0, [sp]
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r0, r2, #4
	adds r0, r1, r0
	str r0, [sp, #4]
	movs r1, #0x64
	adds r4, r3, #0
	muls r4, r1, r4
	ldr r0, _081B3D18
	adds r4, r4, r0
	adds r5, r2, #0
	muls r5, r1, r5
	adds r5, r5, r0
	movs r0, #0x64
	bl Alloc
	adds r6, r0, #0
	adds r1, r4, #0
	movs r2, #0x64
	bl memcpy
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x64
	bl memcpy
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x64
	bl memcpy
	adds r0, r6, #0
	bl Free
	ldr r0, [sp]
	adds r0, #0xb
	ldr r1, [sp, #4]
	adds r1, #0xb
	bl oamt_swap_pos
	ldr r0, [sp]
	adds r0, #0xa
	ldr r1, [sp, #4]
	adds r1, #0xa
	bl oamt_swap_pos
	ldr r0, [sp]
	adds r0, #9
	ldr r1, [sp, #4]
	adds r1, #9
	bl oamt_swap_pos
	ldr r0, [sp]
	adds r0, #0xc
	ldr r1, [sp, #4]
	adds r1, #0xc
	bl oamt_swap_pos
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B3D10: .4byte 0x0203CBA8
_081B3D14: .4byte 0x0203CB94
_081B3D18: .4byte 0x02024190
	thumb_func_end swap_pokemon_and_oams

	thumb_func_start sub_081B3D1C
sub_081B3D1C: @ 0x081B3D1C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _081B3D64
	ldr r0, [r0]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r4, _081B3D68
	movs r0, #0
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #9]
	movs r1, #0
	bl sub_081B0C9C
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	ldrb r0, [r4, #0xa]
	movs r1, #1
	bl sub_081B0C9C
	movs r0, #0
	bl display_pokemon_menu_message
	ldr r1, _081B3D6C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B3D70
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B3D64: .4byte 0x0203CB90
_081B3D68: .4byte 0x0203CB94
_081B3D6C: .4byte 0x03005B60
_081B3D70: .4byte 0x081B1041
	thumb_func_end sub_081B3D1C

	thumb_func_start CursorCb_Cancel1
CursorCb_Cancel1: @ 0x081B3D74
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #5
	bl PlaySE
	ldr r4, _081B3DA8
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r0, _081B3DAC
	ldrb r1, [r0, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #6
	bne _081B3DB0
	movs r0, #0xf
	bl display_pokemon_menu_message
	b _081B3DB6
	.align 2, 0
_081B3DA8: .4byte 0x0203CB90
_081B3DAC: .4byte 0x0203CB94
_081B3DB0:
	movs r0, #0
	bl display_pokemon_menu_message
_081B3DB6:
	ldr r0, _081B3DCC
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B3DD0
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B3DCC: .4byte 0x03005B60
_081B3DD0: .4byte 0x081B1041
	thumb_func_end CursorCb_Cancel1

	thumb_func_start CursorCb_Item
CursorCb_Item: @ 0x081B3DD4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #5
	bl PlaySE
	ldr r4, _081B3E24
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r0, _081B3E28
	ldr r1, _081B3E2C
	ldrb r1, [r1, #9]
	movs r2, #8
	bl sub_081B3054
	movs r0, #1
	bl sub_081B2E34
	movs r0, #0x18
	bl display_pokemon_menu_message
	ldr r1, _081B3E30
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r1, _081B3E34
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B3E24: .4byte 0x0203CB90
_081B3E28: .4byte 0x02024190
_081B3E2C: .4byte 0x0203CB94
_081B3E30: .4byte 0x03005B60
_081B3E34: .4byte 0x081B33D1
	thumb_func_end CursorCb_Item

	thumb_func_start CursorCb_Summary
CursorCb_Summary: @ 0x081B3E38
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	ldr r0, _081B3E5C
	ldr r1, [r0]
	ldr r0, _081B3E60
	str r0, [r1, #4]
	adds r0, r4, #0
	bl sub_081B0F90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B3E5C: .4byte 0x0203CB90
_081B3E60: .4byte 0x081B3E65
	thumb_func_end CursorCb_Summary

	thumb_func_start sub_081B3E64
sub_081B3E64: @ 0x081B3E64
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B3E80
	ldr r2, _081B3E7C
	movs r0, #2
	movs r1, #5
	bl GoToBagMenu
	b _081B3E88
	.align 2, 0
_081B3E7C: .4byte 0x081B3E91
_081B3E80:
	ldr r1, _081B3E8C
	movs r0, #2
	bl sub_081C47A0
_081B3E88:
	pop {r0}
	bx r0
	.align 2, 0
_081B3E8C: .4byte 0x081B3E91
	thumb_func_end sub_081B3E64

	thumb_func_start c2_8123744
c2_8123744: @ 0x081B3E90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r6, _081B3EB8
	ldrh r0, [r6]
	cmp r0, #0
	bne _081B3EC4
	ldr r3, _081B3EBC
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r3, #0xb]
	movs r1, #0x7f
	str r1, [sp]
	ldr r1, _081B3EC0
	str r1, [sp, #4]
	ldr r1, [r3]
	b _081B3EFA
	.align 2, 0
_081B3EB8: .4byte 0x0203CB48
_081B3EBC: .4byte 0x0203CB94
_081B3EC0: .4byte 0x081B339D
_081B3EC4:
	ldr r4, _081B3F08
	ldr r5, _081B3F0C
	movs r0, #9
	ldrsb r0, [r5, r0]
	movs r1, #0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r7, _081B3F10
	adds r0, r0, r7
	movs r1, #0xc
	bl GetMonData
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081B3F18
	ldrb r0, [r5, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r5, #0xb]
	movs r1, #0x7f
	str r1, [sp]
	ldr r1, _081B3F14
	str r1, [sp, #4]
	ldr r1, [r5]
_081B3EFA:
	str r1, [sp, #8]
	movs r1, #0xff
	movs r3, #1
	bl InitPartyMenu
	b _081B3F60
	.align 2, 0
_081B3F08: .4byte 0x0203CBC8
_081B3F0C: .4byte 0x0203CB94
_081B3F10: .4byte 0x02024190
_081B3F14: .4byte 0x081B3FF1
_081B3F18:
	ldrh r0, [r6]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B3F44
	ldrh r0, [r6]
	movs r1, #1
	bl RemoveBagItem
	movs r0, #9
	ldrsb r0, [r5, r0]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r7
	ldrh r1, [r6]
	bl sub_081B1A88
	bl sub_081B41CC
	b _081B3F60
_081B3F44:
	ldrb r0, [r5, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r5, #0xb]
	movs r1, #0x7f
	str r1, [sp]
	ldr r1, _081B3F6C
	str r1, [sp, #4]
	ldr r1, [r5]
	str r1, [sp, #8]
	movs r1, #0xff
	movs r3, #1
	bl InitPartyMenu
_081B3F60:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B3F6C: .4byte 0x081B3F71
	thumb_func_end c2_8123744

	thumb_func_start sub_081B3F70
sub_081B3F70: @ 0x081B3F70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _081B3FD8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B3FCC
	ldr r0, _081B3FDC
	ldrh r4, [r0]
	ldr r0, _081B3FE0
	mov r8, r0
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _081B3FE4
	adds r0, r0, r5
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_081B1954
	mov r1, r8
	movs r0, #9
	ldrsb r0, [r1, r0]
	muls r0, r6, r0
	adds r0, r0, r5
	adds r1, r4, #0
	bl sub_081B1A88
	adds r0, r4, #0
	movs r1, #1
	bl RemoveBagItem
	ldr r1, _081B3FE8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B3FEC
	str r1, [r0]
_081B3FCC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B3FD8: .4byte 0x02037C74
_081B3FDC: .4byte 0x0203CB48
_081B3FE0: .4byte 0x0203CB94
_081B3FE4: .4byte 0x02024190
_081B3FE8: .4byte 0x03005B60
_081B3FEC: .4byte 0x081B433D
	thumb_func_end sub_081B3F70

	thumb_func_start sub_081B3FF0
sub_081B3FF0: @ 0x081B3FF0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B4030
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B4028
	ldr r0, _081B4034
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B4038
	adds r0, r0, r1
	ldr r1, _081B403C
	ldrh r1, [r1]
	movs r2, #1
	bl sub_081B19EC
	ldr r1, _081B4040
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4044
	str r1, [r0]
_081B4028:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B4030: .4byte 0x02037C74
_081B4034: .4byte 0x0203CB94
_081B4038: .4byte 0x02024190
_081B403C: .4byte 0x0203CBC8
_081B4040: .4byte 0x03005B60
_081B4044: .4byte 0x081B4049
	thumb_func_end sub_081B3FF0

	thumb_func_start sub_081B4048
sub_081B4048: @ 0x081B4048
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B406C
	bl sub_081B2FDC
	ldr r0, _081B4074
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B4078
	str r0, [r1]
_081B406C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B4074: .4byte 0x03005B60
_081B4078: .4byte 0x081B407D
	thumb_func_end sub_081B4048

	thumb_func_start sub_081B407C
sub_081B407C: @ 0x081B407C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B40A2
	cmp r1, #0
	bgt _081B409C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B4178
	b _081B418C
_081B409C:
	cmp r1, #1
	beq _081B417E
	b _081B418C
_081B40A2:
	ldr r5, _081B40E4
	ldrh r0, [r5]
	movs r1, #1
	bl RemoveBagItem
	ldr r6, _081B40E8
	ldrh r0, [r6]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B40F8
	ldrh r0, [r5]
	movs r1, #1
	bl AddBagItem
	ldrh r0, [r6]
	bl pokemon_item_not_removed
	ldr r0, _081B40EC
	movs r1, #0
	bl sub_081B182C
	ldr r1, _081B40F0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B40F4
	str r1, [r0]
	b _081B418C
	.align 2, 0
_081B40E4: .4byte 0x0203CB48
_081B40E8: .4byte 0x0203CBC8
_081B40EC: .4byte 0x02021C7C
_081B40F0: .4byte 0x03005B60
_081B40F4: .4byte 0x081B18ED
_081B40F8:
	ldrh r0, [r5]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B4138
	ldr r0, _081B4128
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B412C
	adds r0, r0, r1
	ldrh r1, [r5]
	bl sub_081B1A88
	ldr r1, _081B4130
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4134
	str r1, [r0]
	b _081B418C
	.align 2, 0
_081B4128: .4byte 0x0203CB94
_081B412C: .4byte 0x02024190
_081B4130: .4byte 0x03005B60
_081B4134: .4byte 0x081B419D
_081B4138:
	ldr r0, _081B4168
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B416C
	adds r0, r0, r1
	ldrh r1, [r5]
	bl sub_081B1A88
	ldrh r0, [r5]
	ldrh r1, [r6]
	movs r2, #1
	bl sub_081B1A38
	ldr r1, _081B4170
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4174
	str r1, [r0]
	b _081B418C
	.align 2, 0
_081B4168: .4byte 0x0203CB94
_081B416C: .4byte 0x02024190
_081B4170: .4byte 0x03005B60
_081B4174: .4byte 0x081B433D
_081B4178:
	movs r0, #5
	bl PlaySE
_081B417E:
	ldr r0, _081B4194
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B4198
	str r0, [r1]
_081B418C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B4194: .4byte 0x03005B60
_081B4198: .4byte 0x081B18ED
	thumb_func_end sub_081B407C

	thumb_func_start sub_081B419C
sub_081B419C: @ 0x081B419C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B41BC
	ldr r0, _081B41C4
	ldr r1, [r0]
	ldr r0, _081B41C8
	str r0, [r1, #4]
	adds r0, r4, #0
	bl sub_081B0F90
_081B41BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B41C4: .4byte 0x0203CB90
_081B41C8: .4byte 0x081B41CD
	thumb_func_end sub_081B419C

	thumb_func_start sub_081B41CC
sub_081B41CC: @ 0x081B41CC
	push {lr}
	ldr r0, _081B4204
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B4208
	adds r0, r0, r1
	movs r1, #0x40
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081B420C
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _081B4210
	adds r2, r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	ldr r2, _081B4214
	movs r0, #4
	movs r3, #3
	bl DoEasyChatScreen
	pop {r0}
	bx r0
	.align 2, 0
_081B4204: .4byte 0x0203CB94
_081B4208: .4byte 0x02024190
_081B420C: .4byte 0x03005AEC
_081B4210: .4byte 0x00002BE0
_081B4214: .4byte 0x081B4219
	thumb_func_end sub_081B41CC

	thumb_func_start sub_081B4218
sub_081B4218: @ 0x081B4218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r6, _081B4284
	movs r1, #9
	ldrsb r1, [r6, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B4288
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _081B428C
	ldrh r7, [r0]
	cmp r7, #0
	bne _081B4298
	adds r0, r5, #0
	bl TakeMailFromMon
	ldr r4, _081B4290
	adds r0, r5, #0
	movs r1, #0xc
	adds r2, r4, #0
	bl SetMonData
	ldrh r0, [r4]
	movs r1, #1
	bl RemoveBagItem
	mov r0, r8
	movs r1, #1
	bl AddBagItem
	ldrb r0, [r6, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r6, #0xb]
	str r7, [sp]
	ldr r1, _081B4294
	str r1, [sp, #4]
	ldr r1, [r6]
	str r1, [sp, #8]
	movs r1, #0xff
	movs r3, #1
	bl InitPartyMenu
	b _081B42B4
	.align 2, 0
_081B4284: .4byte 0x0203CB94
_081B4288: .4byte 0x02024190
_081B428C: .4byte 0x02037290
_081B4290: .4byte 0x0203CBC8
_081B4294: .4byte 0x081B339D
_081B4298:
	ldrb r0, [r6, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r6, #0xb]
	movs r1, #0x7f
	str r1, [sp]
	ldr r1, _081B42C0
	str r1, [sp, #4]
	ldr r1, [r6]
	str r1, [sp, #8]
	movs r1, #0xff
	movs r3, #1
	bl InitPartyMenu
_081B42B4:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B42C0: .4byte 0x081B42C5
	thumb_func_end sub_081B4218

	thumb_func_start sub_081B42C4
sub_081B42C4: @ 0x081B42C4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B42FC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B432A
	ldr r1, _081B4300
	ldrh r0, [r1]
	cmp r0, #0
	bne _081B4310
	ldr r0, _081B4304
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B4308
	adds r0, r0, r1
	ldr r1, _081B430C
	ldrh r1, [r1]
	movs r2, #0
	movs r3, #0
	bl sub_081B1954
	b _081B431C
	.align 2, 0
_081B42FC: .4byte 0x02037C74
_081B4300: .4byte 0x0203CBC8
_081B4304: .4byte 0x0203CB94
_081B4308: .4byte 0x02024190
_081B430C: .4byte 0x0203CB48
_081B4310:
	ldr r0, _081B4330
	ldrh r0, [r0]
	ldrh r1, [r1]
	movs r2, #0
	bl sub_081B1A38
_081B431C:
	ldr r0, _081B4334
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B4338
	str r0, [r1]
_081B432A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B4330: .4byte 0x0203CB48
_081B4334: .4byte 0x03005B60
_081B4338: .4byte 0x081B433D
	thumb_func_end sub_081B42C4

	thumb_func_start sub_081B433C
sub_081B433C: @ 0x081B433C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _081B4398
	movs r1, #9
	ldrsb r1, [r4, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B439C
	adds r6, r1, r0
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B43BC
	ldr r5, _081B43A0
	movs r0, #9
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	ldr r1, [r5]
	adds r1, r1, r0
	adds r0, r6, #0
	bl sub_081B5934
	ldrb r1, [r4, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xc
	bne _081B43B6
	adds r0, r6, #0
	movs r1, #0xc
	bl GetMonData
	cmp r0, #0
	beq _081B43A4
	movs r0, #9
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	ldr r1, [r5]
	adds r1, r1, r0
	movs r0, #0xb
	movs r2, #1
	bl DisplayPartyPokemonOtherText
	b _081B43B6
	.align 2, 0
_081B4398: .4byte 0x0203CB94
_081B439C: .4byte 0x02024190
_081B43A0: .4byte 0x0203CBA8
_081B43A4:
	movs r0, #9
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	ldr r1, [r5]
	adds r1, r1, r0
	movs r0, #0xc
	movs r2, #1
	bl DisplayPartyPokemonOtherText
_081B43B6:
	adds r0, r7, #0
	bl sub_081B18EC
_081B43BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B433C

	thumb_func_start CursorCb_TakeItem
CursorCb_TakeItem: @ 0x081B43C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _081B441C
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B4420
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #5
	bl PlaySE
	ldr r4, _081B4424
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	adds r0, r5, #0
	bl TryTakeMonItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081B4428
	cmp r0, #1
	beq _081B444C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_081B19A0
	b _081B445A
	.align 2, 0
_081B441C: .4byte 0x0203CB94
_081B4420: .4byte 0x02024190
_081B4424: .4byte 0x0203CB90
_081B4428:
	ldr r1, _081B4440
	adds r0, r5, #0
	bl GetMonNickname
	ldr r4, _081B4444
	ldr r1, _081B4448
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	b _081B4454
	.align 2, 0
_081B4440: .4byte 0x02021C40
_081B4444: .4byte 0x02021C7C
_081B4448: .4byte 0x085C9CAD
_081B444C:
	adds r0, r6, #0
	bl pokemon_item_not_removed
	ldr r0, _081B4474
_081B4454:
	movs r1, #1
	bl sub_081B182C
_081B445A:
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _081B4478
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B447C
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B4474: .4byte 0x02021C7C
_081B4478: .4byte 0x03005B60
_081B447C: .4byte 0x081B433D
	thumb_func_end CursorCb_TakeItem

	thumb_func_start CursorCb_Toss
CursorCb_Toss: @ 0x081B4480
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _081B44E4
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B44E8
	adds r7, r1, r0
	adds r0, r7, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #5
	bl PlaySE
	ldr r4, _081B44EC
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	cmp r5, #0
	bne _081B4504
	ldr r1, _081B44F0
	adds r0, r7, #0
	bl GetMonNickname
	ldr r4, _081B44F4
	ldr r1, _081B44F8
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B44FC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4500
	b _081B452A
	.align 2, 0
_081B44E4: .4byte 0x0203CB94
_081B44E8: .4byte 0x02024190
_081B44EC: .4byte 0x0203CB90
_081B44F0: .4byte 0x02021C40
_081B44F4: .4byte 0x02021C7C
_081B44F8: .4byte 0x085C9CAD
_081B44FC: .4byte 0x03005B60
_081B4500: .4byte 0x081B433D
_081B4504:
	ldr r1, _081B4534
	adds r0, r5, #0
	bl CopyItemName
	ldr r4, _081B4538
	ldr r1, _081B453C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B4540
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4544
_081B452A:
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B4534: .4byte 0x02021C40
_081B4538: .4byte 0x02021C7C
_081B453C: .4byte 0x085CA007
_081B4540: .4byte 0x03005B60
_081B4544: .4byte 0x081B4549
	thumb_func_end CursorCb_Toss

	thumb_func_start sub_081B4548
sub_081B4548: @ 0x081B4548
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B456C
	bl sub_081B2FDC
	ldr r0, _081B4574
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B4578
	str r0, [r1]
_081B456C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B4574: .4byte 0x03005B60
_081B4578: .4byte 0x081B457D
	thumb_func_end sub_081B4548

	thumb_func_start sub_081B457C
sub_081B457C: @ 0x081B457C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081B45AC
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B45B0
	adds r4, r1, r0
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B45BA
	cmp r1, #0
	bgt _081B45B4
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B4604
	b _081B4618
	.align 2, 0
_081B45AC: .4byte 0x0203CB94
_081B45B0: .4byte 0x02024190
_081B45B4:
	cmp r1, #1
	beq _081B460A
	b _081B4618
_081B45BA:
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _081B45F0
	bl CopyItemName
	ldr r4, _081B45F4
	ldr r1, _081B45F8
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #0
	bl sub_081B182C
	ldr r1, _081B45FC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4600
	str r1, [r0]
	b _081B4618
	.align 2, 0
_081B45F0: .4byte 0x02021C40
_081B45F4: .4byte 0x02021C7C
_081B45F8: .4byte 0x085CA018
_081B45FC: .4byte 0x03005B60
_081B4600: .4byte 0x081B4629
_081B4604:
	movs r0, #5
	bl PlaySE
_081B460A:
	ldr r0, _081B4620
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B4624
	str r0, [r1]
_081B4618:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B4620: .4byte 0x03005B60
_081B4624: .4byte 0x081B18ED
	thumb_func_end sub_081B457C

	thumb_func_start sub_081B4628
sub_081B4628: @ 0x081B4628
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r6, _081B4694
	movs r1, #9
	ldrsb r1, [r6, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B4698
	adds r5, r1, r0
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B468C
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	adds r0, r5, #0
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
	ldr r4, _081B469C
	movs r0, #9
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_081B5934
	movs r0, #9
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r1, r1, r0
	movs r0, #0xc
	movs r2, #1
	bl DisplayPartyPokemonOtherText
	ldr r1, _081B46A0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B46A4
	str r1, [r0]
_081B468C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B4694: .4byte 0x0203CB94
_081B4698: .4byte 0x02024190
_081B469C: .4byte 0x0203CBA8
_081B46A0: .4byte 0x03005B60
_081B46A4: .4byte 0x081B18ED
	thumb_func_end sub_081B4628

	thumb_func_start CursorCb_Mail
CursorCb_Mail: @ 0x081B46A8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #5
	bl PlaySE
	ldr r4, _081B46F8
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r0, _081B46FC
	ldr r1, _081B4700
	ldrb r1, [r1, #9]
	movs r2, #9
	bl sub_081B3054
	movs r0, #2
	bl sub_081B2E34
	movs r0, #0x19
	bl display_pokemon_menu_message
	ldr r1, _081B4704
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r1, _081B4708
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B46F8: .4byte 0x0203CB90
_081B46FC: .4byte 0x02024190
_081B4700: .4byte 0x0203CB94
_081B4704: .4byte 0x03005B60
_081B4708: .4byte 0x081B33D1
	thumb_func_end CursorCb_Mail

	thumb_func_start CursorCb_Read
CursorCb_Read: @ 0x081B470C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	ldr r0, _081B4730
	ldr r1, [r0]
	ldr r0, _081B4734
	str r0, [r1, #4]
	adds r0, r4, #0
	bl sub_081B0F90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B4730: .4byte 0x0203CB90
_081B4734: .4byte 0x081B4739
	thumb_func_end CursorCb_Read

	thumb_func_start sub_081B4738
sub_081B4738: @ 0x081B4738
	push {lr}
	ldr r0, _081B476C
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B4770
	adds r0, r0, r1
	movs r1, #0x40
	bl GetMonData
	ldr r2, _081B4774
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081B4778
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r1, _081B477C
	movs r2, #1
	bl ReadMail
	pop {r0}
	bx r0
	.align 2, 0
_081B476C: .4byte 0x0203CB94
_081B4770: .4byte 0x02024190
_081B4774: .4byte 0x03005AEC
_081B4778: .4byte 0x00002BE0
_081B477C: .4byte 0x081B4781
	thumb_func_end sub_081B4738

	thumb_func_start sub_081B4780
sub_081B4780: @ 0x081B4780
	push {lr}
	sub sp, #0xc
	ldr r2, _081B47B4
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r3, _081B47B8
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r3, #0xb]
	movs r1, #0x15
	str r1, [sp]
	ldr r1, _081B47BC
	str r1, [sp, #4]
	ldr r1, [r3]
	str r1, [sp, #8]
	movs r1, #0xff
	movs r3, #1
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B47B4: .4byte 0x02037C74
_081B47B8: .4byte 0x0203CB94
_081B47BC: .4byte 0x081B339D
	thumb_func_end sub_081B4780

	thumb_func_start CursorCb_TakeMail
CursorCb_TakeMail: @ 0x081B47C0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	ldr r5, _081B47FC
	ldr r0, [r5]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r0, [r5]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, _081B4800
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B4804
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4808
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B47FC: .4byte 0x0203CB90
_081B4800: .4byte 0x085C9BF1
_081B4804: .4byte 0x03005B60
_081B4808: .4byte 0x081B480D
	thumb_func_end CursorCb_TakeMail

	thumb_func_start sub_081B480C
sub_081B480C: @ 0x081B480C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B4830
	bl sub_081B2FDC
	ldr r0, _081B4838
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B483C
	str r0, [r1]
_081B4830:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B4838: .4byte 0x03005B60
_081B483C: .4byte 0x081B4841
	thumb_func_end sub_081B480C

	thumb_func_start sub_081B4840
sub_081B4840: @ 0x081B4840
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B4866
	cmp r1, #0
	bgt _081B4860
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B48D0
	b _081B48EC
_081B4860:
	cmp r1, #1
	beq _081B48D6
	b _081B48EC
_081B4866:
	ldr r0, _081B4898
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B489C
	adds r0, r0, r1
	bl TakeMailFromMon2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _081B48AC
	ldr r0, _081B48A0
	movs r1, #0
	bl sub_081B182C
	ldr r1, _081B48A4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B48A8
	b _081B48EA
	.align 2, 0
_081B4898: .4byte 0x0203CB94
_081B489C: .4byte 0x02024190
_081B48A0: .4byte 0x085C9C0A
_081B48A4: .4byte 0x03005B60
_081B48A8: .4byte 0x081B433D
_081B48AC:
	ldr r0, _081B48C4
	movs r1, #0
	bl sub_081B182C
	ldr r1, _081B48C8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B48CC
	b _081B48EA
	.align 2, 0
_081B48C4: .4byte 0x085C9C20
_081B48C8: .4byte 0x03005B60
_081B48CC: .4byte 0x081B18ED
_081B48D0:
	movs r0, #5
	bl PlaySE
_081B48D6:
	ldr r0, _081B48F4
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B48F8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B48FC
_081B48EA:
	str r1, [r0]
_081B48EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B48F4: .4byte 0x085C9C39
_081B48F8: .4byte 0x03005B60
_081B48FC: .4byte 0x081B4901
	thumb_func_end sub_081B4840

	thumb_func_start sub_081B4900
sub_081B4900: @ 0x081B4900
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B4924
	bl sub_081B2FDC
	ldr r0, _081B492C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B4930
	str r0, [r1]
_081B4924:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B492C: .4byte 0x03005B60
_081B4930: .4byte 0x081B4935
	thumb_func_end sub_081B4900

	thumb_func_start sub_081B4934
sub_081B4934: @ 0x081B4934
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B495E
	cmp r1, #0
	bgt _081B4958
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B49F0
	b _081B4A04
_081B4958:
	cmp r1, #1
	beq _081B49F6
	b _081B4A04
_081B495E:
	ldr r0, _081B49B0
	mov r8, r0
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r7, #0x64
	muls r0, r7, r0
	ldr r6, _081B49B4
	adds r0, r0, r6
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B49C4
	mov r1, r8
	movs r0, #9
	ldrsb r0, [r1, r0]
	muls r0, r7, r0
	adds r0, r0, r6
	bl TakeMailFromMon
	ldr r0, _081B49B8
	movs r1, #0
	bl sub_081B182C
	ldr r1, _081B49BC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B49C0
	str r1, [r0]
	b _081B4A04
	.align 2, 0
_081B49B0: .4byte 0x0203CB94
_081B49B4: .4byte 0x02024190
_081B49B8: .4byte 0x085C9CDA
_081B49BC: .4byte 0x03005B60
_081B49C0: .4byte 0x081B433D
_081B49C4:
	adds r0, r4, #0
	bl pokemon_item_not_removed
	ldr r0, _081B49E4
	movs r1, #0
	bl sub_081B182C
	ldr r1, _081B49E8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B49EC
	str r1, [r0]
	b _081B4A04
	.align 2, 0
_081B49E4: .4byte 0x02021C7C
_081B49E8: .4byte 0x03005B60
_081B49EC: .4byte 0x081B18ED
_081B49F0:
	movs r0, #5
	bl PlaySE
_081B49F6:
	ldr r0, _081B4A10
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B4A14
	str r0, [r1]
_081B4A04:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B4A10: .4byte 0x03005B60
_081B4A14: .4byte 0x081B18ED
	thumb_func_end sub_081B4934

	thumb_func_start CursorCb_Cancel2
CursorCb_Cancel2: @ 0x081B4A18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r5, _081B4A78
	movs r1, #9
	ldrsb r1, [r5, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r6, _081B4A7C
	adds r7, r0, r6
	movs r0, #5
	bl PlaySE
	ldr r4, _081B4A80
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	ldrb r4, [r5, #9]
	adds r0, r7, #0
	bl sub_081B31DC
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_081B3054
	ldrb r1, [r5, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xc
	beq _081B4A84
	movs r0, #0
	bl sub_081B2E34
	movs r0, #0x15
	bl display_pokemon_menu_message
	b _081B4AA2
	.align 2, 0
_081B4A78: .4byte 0x0203CB94
_081B4A7C: .4byte 0x02024190
_081B4A80: .4byte 0x0203CB90
_081B4A84:
	movs r0, #1
	bl sub_081B2E34
	adds r0, r7, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _081B4AC0
	bl CopyItemName
	movs r0, #0x1a
	bl display_pokemon_menu_message
_081B4AA2:
	ldr r1, _081B4AC4
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xff
	strh r1, [r0, #8]
	ldr r1, _081B4AC8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B4AC0: .4byte 0x02021C54
_081B4AC4: .4byte 0x03005B60
_081B4AC8: .4byte 0x081B33D1
	thumb_func_end CursorCb_Cancel2

	thumb_func_start CursorCb_SendMon
CursorCb_SendMon: @ 0x081B4ACC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #5
	bl PlaySE
	ldr r5, _081B4AF8
	ldr r0, [r5]
	adds r0, #0xc
	bl sub_081B2CB0
	bl sub_081B871C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B4AFC
	adds r0, r4, #0
	bl sub_081B0F90
	b _081B4B1A
	.align 2, 0
_081B4AF8: .4byte 0x0203CB90
_081B4AFC:
	ldr r0, [r5]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r0, _081B4B20
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B4B24
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4B28
	str r1, [r0]
_081B4B1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B4B20: .4byte 0x02021C7C
_081B4B24: .4byte 0x03005B60
_081B4B28: .4byte 0x081B18ED
	thumb_func_end CursorCb_SendMon

	thumb_func_start CursorCb_Enter
CursorCb_Enter: @ 0x081B4B2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _081B4BB4
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	bl sub_081B84D0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	cmp r5, r6
	bhs _081B4BD6
	ldr r2, _081B4BB8
	ldr r1, _081B4BBC
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	mov r8, r0
_081B4B66:
	ldr r0, _081B4BC0
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, #0
	bne _081B4BCC
	movs r0, #5
	str r2, [sp]
	bl PlaySE
	ldr r2, [sp]
	ldrb r0, [r2, #9]
	adds r0, #1
	strb r0, [r4]
	adds r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081B4BC4
	ldrb r2, [r2, #9]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r2, r2, #4
	ldr r1, [r1]
	adds r1, r1, r2
	movs r2, #1
	bl DisplayPartyPokemonOtherText
	subs r0, r6, #1
	cmp r5, r0
	bne _081B4BA4
	bl sub_081B4C28
_081B4BA4:
	movs r0, #0
	bl display_pokemon_menu_message
	ldr r0, _081B4BC8
	mov r1, r8
	str r0, [r1]
	b _081B4C08
	.align 2, 0
_081B4BB4: .4byte 0x0203CB90
_081B4BB8: .4byte 0x0203CB94
_081B4BBC: .4byte 0x03005B60
_081B4BC0: .4byte 0x0203CBC4
_081B4BC4: .4byte 0x0203CBA8
_081B4BC8: .4byte 0x081B1041
_081B4BCC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r6
	blo _081B4B66
_081B4BD6:
	ldr r0, _081B4C14
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r4, _081B4C18
	ldr r1, _081B4C1C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0x20
	bl PlaySE
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B4C20
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4C24
	str r1, [r0]
_081B4C08:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B4C14: .4byte 0x02021C40
_081B4C18: .4byte 0x02021C7C
_081B4C1C: .4byte 0x085C9BD5
_081B4C20: .4byte 0x03005B60
_081B4C24: .4byte 0x081B18ED
	thumb_func_end CursorCb_Enter

	thumb_func_start sub_081B4C28
sub_081B4C28: @ 0x081B4C28
	push {r4, lr}
	ldr r4, _081B4C44
	ldrb r0, [r4, #9]
	movs r1, #0
	bl sub_081B0C9C
	movs r0, #6
	strb r0, [r4, #9]
	movs r1, #1
	bl sub_081B0C9C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B4C44: .4byte 0x0203CB94
	thumb_func_end sub_081B4C28

	thumb_func_start CursorCb_NoEntry
CursorCb_NoEntry: @ 0x081B4C48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r0, #5
	bl PlaySE
	ldr r4, _081B4CB4
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	bl sub_081B84D0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _081B4CCA
	ldr r6, _081B4CB8
	subs r2, r5, #1
	adds r7, r6, #0
	ldr r3, _081B4CBC
_081B4C82:
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, #9
	ldrsb r0, [r3, r0]
	adds r0, #1
	cmp r1, r0
	bne _081B4CC0
	adds r0, r4, #0
	adds r4, r2, #0
	cmp r0, r4
	bge _081B4CAC
	adds r3, r7, #0
_081B4C9A:
	adds r2, r0, r3
	adds r1, r0, #1
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, r4
	blt _081B4C9A
_081B4CAC:
	adds r1, r0, r6
	movs r0, #0
	strb r0, [r1]
	b _081B4CCA
	.align 2, 0
_081B4CB4: .4byte 0x0203CB90
_081B4CB8: .4byte 0x0203CBC4
_081B4CBC: .4byte 0x0203CB94
_081B4CC0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _081B4C82
_081B4CCA:
	ldr r6, _081B4D38
	ldr r0, _081B4D3C
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, [r6]
	adds r1, r1, r0
	movs r0, #1
	movs r2, #1
	bl DisplayPartyPokemonOtherText
	movs r4, #0
	subs r5, #1
	mov r0, r8
	lsls r7, r0, #2
	cmp r4, r5
	bge _081B4D18
_081B4CEE:
	ldr r0, _081B4D40
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _081B4D0E
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r1]
	lsls r2, r2, #4
	subs r2, #0x10
	ldr r1, [r6]
	adds r1, r1, r2
	movs r2, #1
	bl DisplayPartyPokemonOtherText
_081B4D0E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blt _081B4CEE
_081B4D18:
	movs r0, #0
	bl display_pokemon_menu_message
	ldr r0, _081B4D44
	mov r2, r8
	adds r1, r7, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B4D48
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B4D38: .4byte 0x0203CBA8
_081B4D3C: .4byte 0x0203CB94
_081B4D40: .4byte 0x0203CBC4
_081B4D44: .4byte 0x03005B60
_081B4D48: .4byte 0x081B1041
	thumb_func_end CursorCb_NoEntry

	thumb_func_start CursorCb_Store
CursorCb_Store: @ 0x081B4D4C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081B0F90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CursorCb_Store

	thumb_func_start CursorCb_Register
CursorCb_Register: @ 0x081B4D68
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _081B4DF4
	mov sb, r0
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r4, _081B4DF8
	adds r0, r0, r4
	movs r1, #0x41
	bl GetMonData
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r1, sb
	movs r0, #9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r4
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r1, sb
	movs r0, #9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r4
	movs r1, #0x50
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_0800F29C
	ldr r0, [r0]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0807A340
	cmp r0, #1
	beq _081B4DFC
	cmp r0, #2
	beq _081B4E10
	movs r0, #5
	bl PlaySE
	adds r0, r7, #0
	bl sub_081B0F90
	b _081B4E50
	.align 2, 0
_081B4DF4: .4byte 0x0203CB94
_081B4DF8: .4byte 0x02024190
_081B4DFC:
	ldr r0, _081B4E08
	ldr r1, _081B4E0C
	bl StringExpandPlaceholders
	b _081B4E18
	.align 2, 0
_081B4E08: .4byte 0x02021C7C
_081B4E0C: .4byte 0x085CA2B4
_081B4E10:
	ldr r0, _081B4E5C
	ldr r1, _081B4E60
	bl StringExpandPlaceholders
_081B4E18:
	movs r0, #0x20
	bl PlaySE
	ldr r4, _081B4E64
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r4, _081B4E5C
	ldr r1, _081B4E68
	adds r0, r4, #0
	bl StringAppend
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B4E6C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4E70
	str r1, [r0]
_081B4E50:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B4E5C: .4byte 0x02021C7C
_081B4E60: .4byte 0x085CA2CC
_081B4E64: .4byte 0x0203CB90
_081B4E68: .4byte 0x085CA273
_081B4E6C: .4byte 0x03005B60
_081B4E70: .4byte 0x081B18ED
	thumb_func_end CursorCb_Register

	thumb_func_start CursorCb_Trade1
CursorCb_Trade1: @ 0x081B4E74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _081B4F3C
	mov r8, r0
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r6, #0x64
	muls r0, r6, r0
	ldr r4, _081B4F40
	adds r0, r0, r4
	movs r1, #0x41
	bl GetMonData
	mov sb, r0
	mov r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	mov r1, r8
	movs r0, #9
	ldrsb r0, [r1, r0]
	muls r0, r6, r0
	adds r0, r0, r4
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r1, r8
	movs r0, #9
	ldrsb r0, [r1, r0]
	muls r0, r6, r0
	adds r0, r0, r4
	movs r1, #0x50
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_0800F29C
	ldr r0, [r0]
	ldr r1, _081B4F44
	ldr r1, [r1]
	ldr r2, _081B4F48
	ldrh r3, [r2]
	ldr r2, _081B4F4C
	ldrb r2, [r2]
	str r2, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	mov r2, sb
	bl sub_0807A250
	cmp r0, #0
	beq _081B4F68
	ldr r5, _081B4F50
	ldr r1, _081B4F54
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringExpandPlaceholders
	movs r0, #0x20
	bl PlaySE
	ldr r4, _081B4F58
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r1, _081B4F5C
	adds r0, r5, #0
	bl StringAppend
	adds r0, r5, #0
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B4F60
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B4F64
	str r1, [r0]
	b _081B4F74
	.align 2, 0
_081B4F3C: .4byte 0x0203CB94
_081B4F40: .4byte 0x02024190
_081B4F44: .4byte 0x020228EC
_081B4F48: .4byte 0x020228F0
_081B4F4C: .4byte 0x020228F2
_081B4F50: .4byte 0x02021C7C
_081B4F54: .4byte 0x085E16C4
_081B4F58: .4byte 0x0203CB90
_081B4F5C: .4byte 0x085CA273
_081B4F60: .4byte 0x03005B60
_081B4F64: .4byte 0x081B18ED
_081B4F68:
	movs r0, #5
	bl PlaySE
	adds r0, r7, #0
	bl sub_081B0F90
_081B4F74:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CursorCb_Trade1

	thumb_func_start CursorCb_Trade2
CursorCb_Trade2: @ 0x081B4F84
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081B4FBC
	ldr r0, [r4]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r4]
	adds r0, #0xd
	bl sub_081B2CB0
	ldr r0, _081B4FC0
	ldr r1, _081B4FC4
	ldrb r1, [r1, #9]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0807A388
	cmp r0, #2
	beq _081B4FE0
	cmp r0, #2
	bgt _081B4FC8
	cmp r0, #1
	beq _081B4FCE
	b _081B5008
	.align 2, 0
_081B4FBC: .4byte 0x0203CB90
_081B4FC0: .4byte 0x02024190
_081B4FC4: .4byte 0x0203CB94
_081B4FC8:
	cmp r0, #3
	beq _081B4FF4
	b _081B5008
_081B4FCE:
	ldr r0, _081B4FD8
	ldr r1, _081B4FDC
	bl StringExpandPlaceholders
	b _081B5060
	.align 2, 0
_081B4FD8: .4byte 0x02021C7C
_081B4FDC: .4byte 0x085CA294
_081B4FE0:
	ldr r0, _081B4FEC
	ldr r1, _081B4FF0
	bl StringExpandPlaceholders
	b _081B5060
	.align 2, 0
_081B4FEC: .4byte 0x02021C7C
_081B4FF0: .4byte 0x085CA2B4
_081B4FF4:
	ldr r0, _081B5000
	ldr r1, _081B5004
	bl StringExpandPlaceholders
	b _081B5060
	.align 2, 0
_081B5000: .4byte 0x02021C7C
_081B5004: .4byte 0x085CA2CC
_081B5008:
	movs r0, #5
	bl PlaySE
	ldr r0, _081B5044
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B5048
	adds r0, r0, r1
	ldr r1, _081B504C
	bl GetMonNickname
	ldr r4, _081B5050
	ldr r1, _081B5054
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B5058
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B505C
	b _081B5084
	.align 2, 0
_081B5044: .4byte 0x0203CB94
_081B5048: .4byte 0x02024190
_081B504C: .4byte 0x02021C40
_081B5050: .4byte 0x02021C7C
_081B5054: .4byte 0x085CA276
_081B5058: .4byte 0x03005B60
_081B505C: .4byte 0x081B509D
_081B5060:
	movs r0, #0x20
	bl PlaySE
	ldr r4, _081B508C
	ldr r1, _081B5090
	adds r0, r4, #0
	bl StringAppend
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B5094
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B5098
_081B5084:
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B508C: .4byte 0x02021C7C
_081B5090: .4byte 0x085CA273
_081B5094: .4byte 0x03005B60
_081B5098: .4byte 0x081B18ED
	thumb_func_end CursorCb_Trade2

	thumb_func_start sub_081B509C
sub_081B509C: @ 0x081B509C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B50C0
	bl sub_081B2FDC
	ldr r0, _081B50C8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B50CC
	str r0, [r1]
_081B50C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B50C8: .4byte 0x03005B60
_081B50CC: .4byte 0x081B50D1
	thumb_func_end sub_081B509C

	thumb_func_start sub_081B50D0
sub_081B50D0: @ 0x081B50D0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B50F6
	cmp r1, #0
	bgt _081B50F0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B50FE
	b _081B510A
_081B50F0:
	cmp r1, #1
	beq _081B5104
	b _081B510A
_081B50F6:
	adds r0, r4, #0
	bl sub_081B0F90
	b _081B510A
_081B50FE:
	movs r0, #5
	bl PlaySE
_081B5104:
	adds r0, r4, #0
	bl sub_081B18EC
_081B510A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081B50D0

	thumb_func_start CursorCb_FieldMove
CursorCb_FieldMove: @ 0x081B5110
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl Menu_GetCursorPos
	ldr r5, _081B517C
	ldr r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0xf
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x13
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #5
	bl PlaySE
	ldr r1, _081B5180
	lsls r0, r4, #3
	adds r7, r0, r1
	ldr r0, [r7]
	cmp r0, #0
	bne _081B5142
	b _081B5304
_081B5142:
	ldr r0, [r5]
	adds r0, #0xc
	bl sub_081B2CB0
	ldr r0, [r5]
	adds r0, #0xd
	bl sub_081B2CB0
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B5166
	bl InUnionRoom
	cmp r0, #1
	bne _081B5188
_081B5166:
	adds r0, r4, #0
	subs r0, #0xb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _081B5184
	movs r0, #0xd
	bl display_pokemon_menu_message
	b _081B52F6
	.align 2, 0
_081B517C: .4byte 0x0203CB90
_081B5180: .4byte 0x085E1654
_081B5184:
	ldrb r0, [r7, #4]
	b _081B52F2
_081B5188:
	cmp r4, #7
	bhi _081B51C4
	ldr r1, _081B51B4
	adds r0, r4, r1
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B51C4
	ldr r0, _081B51B8
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B51BC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B51C0
	str r1, [r0]
	b _081B5304
	.align 2, 0
_081B51B4: .4byte 0x00000867
_081B51B8: .4byte 0x085C9BB7
_081B51BC: .4byte 0x03005B60
_081B51C0: .4byte 0x081B18ED
_081B51C4:
	ldr r1, _081B51EC
	lsls r0, r4, #3
	adds r5, r0, r1
	ldr r0, [r5]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B51DA
	b _081B52DC
_081B51DA:
	subs r0, r4, #5
	cmp r0, #7
	bhi _081B52C4
	lsls r0, r0, #2
	ldr r1, _081B51F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B51EC: .4byte 0x085E1654
_081B51F0: .4byte 0x081B51F4
_081B51F4: @ jump table
	.4byte _081B52B4 @ case 0
	.4byte _081B52C4 @ case 1
	.4byte _081B52C4 @ case 2
	.4byte _081B521C @ case 3
	.4byte _081B5258 @ case 4
	.4byte _081B52C4 @ case 5
	.4byte _081B5214 @ case 6
	.4byte _081B5214 @ case 7
_081B5214:
	adds r0, r6, #0
	bl sub_08161464
	b _081B5304
_081B521C:
	ldr r0, _081B5248
	ldr r1, [r0]
	movs r0, #0x1c
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0x1d]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	adds r1, r0, #0
	ldr r0, _081B524C
	ldrb r1, [r1, #0x14]
	bl sub_081245E8
	ldr r0, _081B5250
	ldr r1, _081B5254
	b _081B5288
	.align 2, 0
_081B5248: .4byte 0x03005AEC
_081B524C: .4byte 0x02021C40
_081B5250: .4byte 0x02021C7C
_081B5254: .4byte 0x085CA25C
_081B5258:
	ldr r0, _081B52A0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, #0x25
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	adds r1, r0, #0
	ldr r0, _081B52A4
	ldrb r1, [r1, #0x14]
	bl sub_081245E8
	ldr r0, _081B52A8
	ldr r1, _081B52AC
_081B5288:
	bl StringExpandPlaceholders
	adds r0, r6, #0
	bl sub_081B5314
	ldr r0, _081B52B0
	ldr r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r0, r1
	strh r4, [r0]
	b _081B5304
	.align 2, 0
_081B52A0: .4byte 0x03005AEC
_081B52A4: .4byte 0x02021C40
_081B52A8: .4byte 0x02021C7C
_081B52AC: .4byte 0x085CA246
_081B52B0: .4byte 0x0203CB90
_081B52B4:
	ldr r1, _081B52BC
	ldr r0, _081B52C0
	b _081B52C8
	.align 2, 0
_081B52BC: .4byte 0x0203CB94
_081B52C0: .4byte 0x0812469D
_081B52C4:
	ldr r1, _081B52D4
	ldr r0, _081B52D8
_081B52C8:
	str r0, [r1]
	adds r0, r6, #0
	bl sub_081B0F90
	b _081B5304
	.align 2, 0
_081B52D4: .4byte 0x0203CB94
_081B52D8: .4byte 0x08085A31
_081B52DC:
	cmp r4, #1
	beq _081B52EA
	cmp r4, #4
	bne _081B52F0
	bl sub_081B5504
	b _081B52F6
_081B52EA:
	bl sub_081B547C
	b _081B52F6
_081B52F0:
	ldrb r0, [r5, #4]
_081B52F2:
	bl display_pokemon_menu_message
_081B52F6:
	ldr r0, _081B530C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B5310
	str r0, [r1]
_081B5304:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B530C: .4byte 0x03005B60
_081B5310: .4byte 0x081B5455
	thumb_func_end CursorCb_FieldMove

	thumb_func_start sub_081B5314
sub_081B5314: @ 0x081B5314
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081B5338
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B533C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B5340
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B5338: .4byte 0x02021C7C
_081B533C: .4byte 0x03005B60
_081B5340: .4byte 0x081B5345
	thumb_func_end sub_081B5314

	thumb_func_start sub_081B5344
sub_081B5344: @ 0x081B5344
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B5368
	bl sub_081B2FDC
	ldr r0, _081B5370
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B5374
	str r0, [r1]
_081B5368:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B5370: .4byte 0x03005B60
_081B5374: .4byte 0x081B5379
	thumb_func_end sub_081B5344

	thumb_func_start sub_081B5378
sub_081B5378: @ 0x081B5378
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B539E
	cmp r1, #0
	bgt _081B5398
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B53B4
	b _081B53CA
_081B5398:
	cmp r1, #1
	beq _081B53BA
	b _081B53CA
_081B539E:
	ldr r1, _081B53AC
	ldr r0, _081B53B0
	str r0, [r1]
	adds r0, r4, #0
	bl sub_081B0F90
	b _081B53CA
	.align 2, 0
_081B53AC: .4byte 0x0203CB94
_081B53B0: .4byte 0x08085A31
_081B53B4:
	movs r0, #5
	bl PlaySE
_081B53BA:
	ldr r0, _081B53D0
	movs r1, #0
	str r1, [r0]
	ldr r0, _081B53D4
	str r1, [r0]
	adds r0, r4, #0
	bl sub_081B18EC
_081B53CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B53D0: .4byte 0x03005B10
_081B53D4: .4byte 0x0203CBB8
	thumb_func_end sub_081B5378

	thumb_func_start FieldCallback_PrepareFadeInFromMenu
FieldCallback_PrepareFadeInFromMenu: @ 0x081B53D8
	push {lr}
	bl pal_fill_black
	ldr r0, _081B53EC
	movs r1, #8
	bl CreateTask
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_081B53EC: .4byte 0x081B53F1
	thumb_func_end FieldCallback_PrepareFadeInFromMenu

	thumb_func_start task_launch_hm_phase_2
task_launch_hm_phase_2: @ 0x081B53F0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B541C
	bl brm_get_selected_species
	ldr r1, _081B5424
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1]
	ldr r0, _081B5428
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, #0
	bl DestroyTask
_081B541C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B5424: .4byte 0x020388A8
_081B5428: .4byte 0x0203CBB8
	thumb_func_end task_launch_hm_phase_2

	thumb_func_start brm_get_selected_species
brm_get_selected_species: @ 0x081B542C
	push {lr}
	ldr r0, _081B544C
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B5450
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_081B544C: .4byte 0x0203CB94
_081B5450: .4byte 0x02024190
	thumb_func_end brm_get_selected_species

	thumb_func_start task_brm_cancel_1_on_keypad_a_or_b
task_brm_cancel_1_on_keypad_a_or_b: @ 0x081B5454
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081B5478
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081B546E
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B5474
_081B546E:
	adds r0, r2, #0
	bl CursorCb_Cancel1
_081B5474:
	pop {r0}
	bx r0
	.align 2, 0
_081B5478: .4byte 0x03002360
	thumb_func_end task_brm_cancel_1_on_keypad_a_or_b

	thumb_func_start sub_081B547C
sub_081B547C: @ 0x081B547C
	push {lr}
	ldr r0, _081B5494
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B5498
	movs r0, #0xc
	bl display_pokemon_menu_message
	b _081B549E
	.align 2, 0
_081B5494: .4byte 0x00000888
_081B5498:
	movs r0, #0xd
	bl display_pokemon_menu_message
_081B549E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B547C

	thumb_func_start hm_surf_run_dp02scr
hm_surf_run_dp02scr: @ 0x081B54A4
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _081B54BC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	movs r0, #9
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_081B54BC: .4byte 0x020388A8
	thumb_func_end hm_surf_run_dp02scr

	thumb_func_start SetUpFieldMove_Surf
SetUpFieldMove_Surf: @ 0x081B54C0
	push {lr}
	bl PartyHasMonWithSurf
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B54FC
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B54FC
	ldr r1, _081B54EC
	ldr r0, _081B54F0
	str r0, [r1]
	ldr r1, _081B54F4
	ldr r0, _081B54F8
	str r0, [r1]
	movs r0, #1
	b _081B54FE
	.align 2, 0
_081B54EC: .4byte 0x03005B10
_081B54F0: .4byte 0x081B53D9
_081B54F4: .4byte 0x0203CBB8
_081B54F8: .4byte 0x081B54A5
_081B54FC:
	movs r0, #0
_081B54FE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetUpFieldMove_Surf

	thumb_func_start sub_081B5504
sub_081B5504: @ 0x081B5504
	push {lr}
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B551A
	movs r0, #9
	bl display_pokemon_menu_message
	b _081B5520
_081B551A:
	movs r0, #8
	bl display_pokemon_menu_message
_081B5520:
	pop {r0}
	bx r0
	thumb_func_end sub_081B5504

	thumb_func_start SetUpFieldMove_Fly
SetUpFieldMove_Fly: @ 0x081B5524
	push {lr}
	ldr r0, _081B553C
	ldrb r0, [r0, #0x17]
	bl Overworld_MapTypeAllowsTeleportAndFly
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B5540
	movs r0, #0
	b _081B5542
	.align 2, 0
_081B553C: .4byte 0x02036FB8
_081B5540:
	movs r0, #1
_081B5542:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetUpFieldMove_Fly

	thumb_func_start sub_081B5548
sub_081B5548: @ 0x081B5548
	push {lr}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp]
	ldr r0, _081B556C
	str r0, [sp, #4]
	ldr r0, _081B5570
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B556C: .4byte 0x081B1041
_081B5570: .4byte 0x08085AFD
	thumb_func_end sub_081B5548

	thumb_func_start hm2_waterfall
hm2_waterfall: @ 0x081B5574
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _081B558C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	movs r0, #0x2b
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_081B558C: .4byte 0x020388A8
	thumb_func_end hm2_waterfall

	thumb_func_start SetUpFieldMove_Waterfall
SetUpFieldMove_Waterfall: @ 0x081B5590
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsWaterfall
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B55EC
	bl IsPlayerSurfingNorth
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B55EC
	ldr r1, _081B55DC
	ldr r0, _081B55E0
	str r0, [r1]
	ldr r1, _081B55E4
	ldr r0, _081B55E8
	str r0, [r1]
	movs r0, #1
	b _081B55EE
	.align 2, 0
_081B55DC: .4byte 0x03005B10
_081B55E0: .4byte 0x081B53D9
_081B55E4: .4byte 0x0203CBB8
_081B55E8: .4byte 0x081B5575
_081B55EC:
	movs r0, #0
_081B55EE:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetUpFieldMove_Waterfall

	thumb_func_start sub_081B55F8
sub_081B55F8: @ 0x081B55F8
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _081B5610
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	movs r0, #0x2c
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_081B5610: .4byte 0x020388A8
	thumb_func_end sub_081B55F8

	thumb_func_start SetUpFieldMove_Dive
SetUpFieldMove_Dive: @ 0x081B5614
	push {lr}
	bl TrySetDiveWarp
	ldr r1, _081B562C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1, #4]
	cmp r0, #0
	bne _081B5630
	movs r0, #0
	b _081B563E
	.align 2, 0
_081B562C: .4byte 0x020388A8
_081B5630:
	ldr r1, _081B5644
	ldr r0, _081B5648
	str r0, [r1]
	ldr r1, _081B564C
	ldr r0, _081B5650
	str r0, [r1]
	movs r0, #1
_081B563E:
	pop {r1}
	bx r1
	.align 2, 0
_081B5644: .4byte 0x03005B10
_081B5648: .4byte 0x081B53D9
_081B564C: .4byte 0x0203CBB8
_081B5650: .4byte 0x081B55F9
	thumb_func_end SetUpFieldMove_Dive

	thumb_func_start party_menu_icon_anim
party_menu_icon_anim: @ 0x081B5654
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	movs r6, #1
	bl IsMultiBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B568A
	ldr r0, _081B56C0
	ldr r1, _081B56C4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B568A
	ldr r0, _081B56C8
	adds r0, r4, r0
	ldrb r1, [r0]
	eors r1, r6
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
_081B568A:
	adds r0, r5, #0
	movs r1, #0x41
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0
	bl GetMonData
	adds r1, r0, #0
	str r6, [sp]
	adds r0, r4, #0
	adds r2, r7, #0
	movs r3, #1
	bl party_menu_link_mon_icon_anim
	ldrb r0, [r7, #9]
	adds r1, r5, #0
	bl sub_081B57D8
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B56C0: .4byte 0x03002360
_081B56C4: .4byte 0x00000439
_081B56C8: .4byte 0x085E18D8
	thumb_func_end party_menu_icon_anim

	thumb_func_start party_menu_link_mon_icon_anim
party_menu_link_mon_icon_anim: @ 0x081B56CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	cmp r5, #0
	beq _081B571A
	ldr r1, _081B5724
	ldr r0, [r4, #4]
	ldrb r2, [r0]
	ldrb r3, [r0, #1]
	movs r0, #4
	str r0, [sp]
	str r6, [sp, #4]
	ldr r0, [sp, #0x20]
	str r0, [sp, #8]
	adds r0, r5, #0
	bl CreateMonIcon
	strb r0, [r4, #9]
	ldr r2, _081B5728
	ldrb r0, [r4, #9]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #3
	adds r2, r7, #0
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #5]
_081B571A:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B5724: .4byte 0x080D28B5
_081B5728: .4byte 0x020205AC
	thumb_func_end party_menu_link_mon_icon_anim

	thumb_func_start sub_081B572C
sub_081B572C: @ 0x081B572C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r1, #0
	adds r1, r2, #0
	bl GetHPBarLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _081B578C
	cmp r0, #2
	bgt _081B5754
	cmp r0, #1
	beq _081B57A4
	b _081B57BC
_081B5754:
	cmp r0, #3
	beq _081B5774
	cmp r0, #4
	bne _081B57BC
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _081B5770
	adds r0, r0, r1
	movs r1, #0
	bl sub_080D2B68
	b _081B57CC
	.align 2, 0
_081B5770: .4byte 0x020205AC
_081B5774:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _081B5788
	adds r0, r0, r1
	movs r1, #1
	bl sub_080D2B68
	b _081B57CC
	.align 2, 0
_081B5788: .4byte 0x020205AC
_081B578C:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _081B57A0
	adds r0, r0, r1
	movs r1, #2
	bl sub_080D2B68
	b _081B57CC
	.align 2, 0
_081B57A0: .4byte 0x020205AC
_081B57A4:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _081B57B8
	adds r0, r0, r1
	movs r1, #3
	bl sub_080D2B68
	b _081B57CC
	.align 2, 0
_081B57B8: .4byte 0x020205AC
_081B57BC:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _081B57D4
	adds r0, r0, r1
	movs r1, #4
	bl sub_080D2B68
_081B57CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B57D4: .4byte 0x020205AC
	thumb_func_end sub_081B572C

	thumb_func_start sub_081B57D8
sub_081B57D8: @ 0x081B57D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	movs r1, #0x39
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r6, #0
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_081B572C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081B57D8

	thumb_func_start AnimateSelectedPartyIcon
AnimateSelectedPartyIcon: @ 0x081B580C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	ldr r5, _081B583C
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r6, r0, #2
	adds r2, r6, r5
	movs r7, #0
	movs r3, #0
	strh r3, [r2, #0x2e]
	mov ip, r5
	cmp r1, #0
	bne _081B5864
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	cmp r0, #0x18
	bne _081B5844
	strh r3, [r2, #0x24]
	ldr r0, _081B5840
	strh r0, [r2, #0x26]
	b _081B584A
	.align 2, 0
_081B583C: .4byte 0x020205AC
_081B5840: .4byte 0x0000FFFC
_081B5844:
	ldr r0, _081B585C
	strh r0, [r2, #0x24]
	strh r3, [r2, #0x26]
_081B584A:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	mov r1, ip
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081B5860
	b _081B5870
	.align 2, 0
_081B585C: .4byte 0x0000FFFC
_081B5860: .4byte 0x081B58A9
_081B5864:
	strh r3, [r2, #0x24]
	strh r3, [r2, #0x26]
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _081B5878
_081B5870:
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B5878: .4byte 0x081B587D
	thumb_func_end AnimateSelectedPartyIcon

	thumb_func_start UpdatePartyMonIconFrameAndBounce
UpdatePartyMonIconFrameAndBounce: @ 0x081B587C
	push {r4, lr}
	adds r4, r0, #0
	bl UpdateMonIconFrame
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _081B58A2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _081B58A0
	ldr r0, _081B589C
	strh r0, [r4, #0x26]
	b _081B58A2
	.align 2, 0
_081B589C: .4byte 0x0000FFFD
_081B58A0:
	strh r1, [r4, #0x26]
_081B58A2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdatePartyMonIconFrameAndBounce

	thumb_func_start UpdatePartyMonIconFrame
UpdatePartyMonIconFrame: @ 0x081B58A8
	push {lr}
	bl UpdateMonIconFrame
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdatePartyMonIconFrame

	thumb_func_start party_menu_held_item_object
party_menu_held_item_object: @ 0x081B58B4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B58DC
	ldr r0, _081B58E4
	ldr r2, [r4, #4]
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	movs r3, #0
	bl CreateSprite
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_081B5934
_081B58DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B58E4: .4byte 0x085E1778
	thumb_func_end party_menu_held_item_object

	thumb_func_start party_menu_link_mon_held_item_object
party_menu_link_mon_held_item_object: @ 0x081B58E8
	push {r4, r5, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r0, #0
	beq _081B5924
	ldr r0, _081B592C
	ldr r2, [r4, #4]
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	movs r3, #0
	bl CreateSprite
	strb r0, [r4, #0xa]
	ldr r2, _081B5930
	ldrb r0, [r4, #0xa]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_081B5950
_081B5924:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B592C: .4byte 0x085E1778
_081B5930: .4byte 0x020205AC
	thumb_func_end party_menu_link_mon_held_item_object

	thumb_func_start sub_081B5934
sub_081B5934: @ 0x081B5934
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_081B5950
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B5934

	thumb_func_start sub_081B5950
sub_081B5950: @ 0x081B5950
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _081B5978
	ldr r2, _081B5974
	ldrb r1, [r4, #0xa]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _081B59C4
	.align 2, 0
_081B5974: .4byte 0x020205AC
_081B5978:
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B599C
	ldrb r1, [r4, #0xa]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081B5998
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAnim
	b _081B59AE
	.align 2, 0
_081B5998: .4byte 0x020205AC
_081B599C:
	ldrb r1, [r4, #0xa]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081B59CC
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAnim
_081B59AE:
	ldr r2, _081B59CC
	ldrb r1, [r4, #0xa]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
_081B59C4:
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B59CC: .4byte 0x020205AC
	thumb_func_end sub_081B5950

	thumb_func_start LoadHeldItemIcons
LoadHeldItemIcons: @ 0x081B59D0
	push {lr}
	ldr r0, _081B59E4
	bl LoadSpriteSheet
	ldr r0, _081B59E8
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_081B59E4: .4byte 0x085E1768
_081B59E8: .4byte 0x085E1770
	thumb_func_end LoadHeldItemIcons

	thumb_func_start sub_081B59EC
sub_081B59EC: @ 0x081B59EC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #0
	beq _081B5A00
	cmp r2, #1
	beq _081B5A48
	b _081B5A84
_081B5A00:
	movs r5, #0
	ldrb r0, [r6]
	cmp r5, r0
	bhs _081B5A84
_081B5A08:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081B5A44
	adds r0, r0, r1
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _081B5A34
	adds r0, r7, r5
	ldrb r4, [r0]
	adds r0, r1, #0
	bl ItemIsMail
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_081B5A90
_081B5A34:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r0, [r6]
	cmp r5, r0
	blo _081B5A08
	b _081B5A84
	.align 2, 0
_081B5A44: .4byte 0x02024190
_081B5A48:
	movs r5, #0
	b _081B5A7E
_081B5A4C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081B5A8C
	adds r0, r0, r1
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _081B5A78
	adds r0, r5, r7
	ldrb r4, [r0, #6]
	adds r0, r1, #0
	bl ItemIsMail
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_081B5A90
_081B5A78:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_081B5A7E:
	ldrb r0, [r6, #1]
	cmp r5, r0
	blo _081B5A4C
_081B5A84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B5A8C: .4byte 0x020243E8
	thumb_func_end sub_081B59EC

	thumb_func_start sub_081B5A90
sub_081B5A90: @ 0x081B5A90
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov sb, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _081B5B08
	mov r8, r0
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x43
	ldrb r3, [r0]
	ldr r0, _081B5B0C
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #0xfa
	movs r2, #0xaa
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	mov r0, r8
	adds r5, r4, r0
	movs r0, #4
	strh r0, [r5, #0x24]
	movs r0, #0xa
	strh r0, [r5, #0x26]
	movs r0, #0x1c
	add r8, r0
	add r4, r8
	ldr r0, _081B5B10
	str r0, [r4]
	strh r6, [r5, #0x3c]
	adds r0, r5, #0
	mov r1, sb
	bl StartSpriteAnim
	ldr r1, [r4]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B5B08: .4byte 0x020205AC
_081B5B0C: .4byte 0x085E1778
_081B5B10: .4byte 0x081B5B15
	thumb_func_end sub_081B5A90

	thumb_func_start SpriteCB_HeldItem
SpriteCB_HeldItem: @ 0x081B5B14
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _081B5B44
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _081B5B48
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _081B5B66
	.align 2, 0
_081B5B44: .4byte 0x020205AC
_081B5B48:
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, #0x24]
	ldrh r1, [r2, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r2, #0x26]
	ldrh r2, [r2, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
_081B5B66:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_HeldItem

	thumb_func_start party_menu_pokeball_object
party_menu_pokeball_object: @ 0x081B5B6C
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B5B8A
	ldr r0, _081B5B90
	ldr r2, [r4, #4]
	ldrb r1, [r2, #6]
	ldrb r2, [r2, #7]
	movs r3, #8
	bl CreateSprite
	strb r0, [r4, #0xb]
_081B5B8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B5B90: .4byte 0x085E17C0
	thumb_func_end party_menu_pokeball_object

	thumb_func_start party_menu_link_mon_pokeball_object
party_menu_link_mon_pokeball_object: @ 0x081B5B94
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081B5BC4
	ldr r0, _081B5BCC
	ldr r2, [r4, #4]
	ldrb r1, [r2, #6]
	ldrb r2, [r2, #7]
	movs r3, #8
	bl CreateSprite
	strb r0, [r4, #0xb]
	ldr r2, _081B5BD0
	ldrb r0, [r4, #0xb]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
_081B5BC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B5BCC: .4byte 0x085E17C0
_081B5BD0: .4byte 0x020205AC
	thumb_func_end party_menu_link_mon_pokeball_object

	thumb_func_start sub_081B5BD4
sub_081B5BD4: @ 0x081B5BD4
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _081B5C0C
	adds r1, r3, #0
	movs r3, #8
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081B5C10
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r3, [r1, #5]
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #8
	orrs r2, r3
	strb r2, [r1, #5]
	pop {r1}
	bx r1
	.align 2, 0
_081B5C0C: .4byte 0x085E17C0
_081B5C10: .4byte 0x020205AC
	thumb_func_end sub_081B5BD4

	thumb_func_start sub_081B5C14
sub_081B5C14: @ 0x081B5C14
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _081B5C34
	adds r1, r3, #0
	movs r3, #8
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081B5C34: .4byte 0x085E1830
	thumb_func_end sub_081B5C14

	thumb_func_start sub_081B5C38
sub_081B5C38: @ 0x081B5C38
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _081B5C58
	adds r0, r0, r2
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_081B5C58: .4byte 0x020205AC
	thumb_func_end sub_081B5C38

	thumb_func_start sub_081B5C5C
sub_081B5C5C: @ 0x081B5C5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	cmp r6, #0
	bne _081B5CA0
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _081B5C9C
	mov r8, r0
	add r4, r8
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
	lsls r5, r7, #4
	adds r5, r5, r7
	lsls r5, r5, #2
	add r5, r8
	adds r0, r5, #0
	movs r1, #4
	bl StartSpriteAnim
	strh r6, [r4, #0x26]
	strh r6, [r5, #0x26]
	b _081B5CCC
	.align 2, 0
_081B5C9C: .4byte 0x020205AC
_081B5CA0:
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r0, _081B5CD8
	mov r8, r0
	add r5, r8
	adds r0, r5, #0
	movs r1, #3
	bl StartSpriteAnim
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	add r4, r8
	adds r0, r4, #0
	movs r1, #5
	bl StartSpriteAnim
	ldr r0, _081B5CDC
	strh r0, [r5, #0x26]
	movs r0, #4
	strh r0, [r4, #0x26]
_081B5CCC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B5CD8: .4byte 0x020205AC
_081B5CDC: .4byte 0x0000FFFC
	thumb_func_end sub_081B5C5C

	thumb_func_start LoadPartyMenuPokeballGfx
LoadPartyMenuPokeballGfx: @ 0x081B5CE0
	push {lr}
	ldr r0, _081B5CF8
	bl LoadCompressedSpriteSheet
	ldr r0, _081B5CFC
	bl LoadCompressedSpriteSheet
	ldr r0, _081B5D00
	bl LoadCompressedSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_081B5CF8: .4byte 0x085E17B0
_081B5CFC: .4byte 0x085E1828
_081B5D00: .4byte 0x085E17B8
	thumb_func_end LoadPartyMenuPokeballGfx

	thumb_func_start party_menu_status_condition_object
party_menu_status_condition_object: @ 0x081B5D04
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B5D2C
	ldr r0, _081B5D34
	ldr r2, [r4, #4]
	ldrb r1, [r2, #4]
	ldrb r2, [r2, #5]
	movs r3, #0
	bl CreateSprite
	strb r0, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	bl party_menu_get_status_condition_and_update_object
_081B5D2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B5D34: .4byte 0x085E18C0
	thumb_func_end party_menu_status_condition_object

	thumb_func_start party_menu_link_mon_status_condition_object
party_menu_link_mon_status_condition_object: @ 0x081B5D38
	push {r4, r5, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r0, #0
	beq _081B5D74
	ldr r0, _081B5D7C
	ldr r2, [r4, #4]
	ldrb r1, [r2, #4]
	ldrb r2, [r2, #5]
	movs r3, #0
	bl CreateSprite
	strb r0, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	bl party_menu_update_status_condition_object
	ldr r2, _081B5D80
	ldrb r0, [r4, #0xc]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #5]
_081B5D74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B5D7C: .4byte 0x085E18C0
_081B5D80: .4byte 0x020205AC
	thumb_func_end party_menu_link_mon_status_condition_object

	thumb_func_start party_menu_get_status_condition_and_update_object
party_menu_get_status_condition_and_update_object: @ 0x081B5D84
	push {r4, lr}
	adds r4, r1, #0
	bl GetMonAilment
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl party_menu_update_status_condition_object
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end party_menu_get_status_condition_and_update_object

	thumb_func_start party_menu_update_status_condition_object
party_menu_update_status_condition_object: @ 0x081B5D9C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _081B5DAC
	cmp r2, #6
	bne _081B5DC8
_081B5DAC:
	ldr r2, _081B5DC4
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _081B5DF2
	.align 2, 0
_081B5DC4: .4byte 0x020205AC
_081B5DC8:
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081B5DFC
	adds r0, r0, r4
	subs r1, r2, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl StartSpriteAnim
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
_081B5DF2:
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B5DFC: .4byte 0x020205AC
	thumb_func_end party_menu_update_status_condition_object

	thumb_func_start LoadPartyMenuAilmentGfx
LoadPartyMenuAilmentGfx: @ 0x081B5E00
	push {lr}
	ldr r0, _081B5E14
	bl LoadCompressedSpriteSheet
	ldr r0, _081B5E18
	bl LoadCompressedSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_081B5E14: .4byte 0x085E18B0
_081B5E18: .4byte 0x085E18B8
	thumb_func_end LoadPartyMenuAilmentGfx

	thumb_func_start sub_081B5E1C
sub_081B5E1C: @ 0x081B5E1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _081B5E44
	mov r8, r0
	ldr r0, _081B5E48
	ldr r1, _081B5E4C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B5E5C
	movs r7, #1
	bl sub_081B8624
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _081B5E60
	.align 2, 0
_081B5E44: .4byte 0x081B5EF5
_081B5E48: .4byte 0x03002360
_081B5E4C: .4byte 0x00000439
_081B5E50:
	ldr r0, _081B5E58
	strb r5, [r0, #9]
	b _081B5EA4
	.align 2, 0
_081B5E58: .4byte 0x0203CB94
_081B5E5C:
	movs r7, #0
	movs r6, #0
_081B5E60:
	ldr r4, _081B5EAC
	ldrh r0, [r4]
	bl GetItemEffectType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bne _081B5EBC
	ldr r1, _081B5EB0
	movs r0, #0
	strb r0, [r1, #9]
	movs r5, #0
_081B5E78:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081B5EB4
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B5E9A
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _081B5E50
_081B5E9A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _081B5E78
_081B5EA4:
	ldr r0, _081B5EB8
	movs r1, #0x7f
	b _081B5ED0
	.align 2, 0
_081B5EAC: .4byte 0x0203CB48
_081B5EB0: .4byte 0x0203CB94
_081B5EB4: .4byte 0x02024190
_081B5EB8: .4byte 0x081B5F21
_081B5EBC:
	ldrh r0, [r4]
	bl GetPocketByItemId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #5
	cmp r0, #3
	bne _081B5ECE
	movs r1, #4
_081B5ECE:
	ldr r0, _081B5EF0
_081B5ED0:
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl InitPartyMenu
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B5EF0: .4byte 0x081B1041
	thumb_func_end sub_081B5E1C

	thumb_func_start c2_815ABFC
c2_815ABFC: @ 0x081B5EF4
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B5F0C
	movs r0, #0xc
	movs r1, #5
	movs r2, #0
	bl GoToBagMenu
	b _081B5F16
_081B5F0C:
	ldr r0, _081B5F1C
	ldr r1, [r0]
	movs r0, #4
	bl sub_081C47A0
_081B5F16:
	pop {r0}
	bx r0
	.align 2, 0
_081B5F1C: .4byte 0x0203CBFC
	thumb_func_end c2_815ABFC

	thumb_func_start sub_081B5F20
sub_081B5F20: @ 0x081B5F20
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _081B5F58
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B5F52
	ldr r0, _081B5F5C
	ldrb r1, [r0, #8]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _081B5F46
	ldr r0, _081B5F60
	ldr r1, [r0]
	ldr r0, _081B5F64
	str r0, [r1, #4]
_081B5F46:
	ldr r0, _081B5F68
	ldr r1, _081B5F6C
	ldr r2, [r0]
	adds r0, r3, #0
	bl _call_via_r2
_081B5F52:
	pop {r0}
	bx r0
	.align 2, 0
_081B5F58: .4byte 0x02037C74
_081B5F5C: .4byte 0x0203CB94
_081B5F60: .4byte 0x0203CB90
_081B5F64: .4byte 0x081B8DE1
_081B5F68: .4byte 0x03006068
_081B5F6C: .4byte 0x081B6435
	thumb_func_end sub_081B5F20

	thumb_func_start IsHPRecoveryItem
IsHPRecoveryItem: @ 0x081B5F70
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _081B5F8C
	ldr r0, _081B5F84
	ldr r0, [r0]
	ldr r1, _081B5F88
	adds r0, r0, r1
	b _081B5F96
	.align 2, 0
_081B5F84: .4byte 0x03005AEC
_081B5F88: .4byte 0x00003214
_081B5F8C:
	ldr r1, _081B5FA4
	subs r0, #0xd
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
_081B5F96:
	ldrb r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _081B5FA8
	movs r0, #0
	b _081B5FAA
	.align 2, 0
_081B5FA4: .4byte 0x082EEF14
_081B5FA8:
	movs r0, #1
_081B5FAA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsHPRecoveryItem

	thumb_func_start GetMedicineItemEffectMessage
GetMedicineItemEffectMessage: @ 0x081B5FB0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemEffectType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #3
	cmp r0, #0x12
	bls _081B5FC6
	b _081B615C
_081B5FC6:
	lsls r0, r0, #2
	ldr r1, _081B5FD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B5FD0: .4byte 0x081B5FD4
_081B5FD4: @ jump table
	.4byte _081B6020 @ case 0
	.4byte _081B6034 @ case 1
	.4byte _081B6048 @ case 2
	.4byte _081B605C @ case 3
	.4byte _081B6070 @ case 4
	.4byte _081B6084 @ case 5
	.4byte _081B6098 @ case 6
	.4byte _081B615C @ case 7
	.4byte _081B60AC @ case 8
	.4byte _081B60D0 @ case 9
	.4byte _081B60C0 @ case 10
	.4byte _081B6100 @ case 11
	.4byte _081B6110 @ case 12
	.4byte _081B60F0 @ case 13
	.4byte _081B60E0 @ case 14
	.4byte _081B615C @ case 15
	.4byte _081B6134 @ case 16
	.4byte _081B6134 @ case 17
	.4byte _081B6148 @ case 18
_081B6020:
	ldr r0, _081B602C
	ldr r1, _081B6030
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B602C: .4byte 0x02021C7C
_081B6030: .4byte 0x085C9EA6
_081B6034:
	ldr r0, _081B6040
	ldr r1, _081B6044
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B6040: .4byte 0x02021C7C
_081B6044: .4byte 0x085C9ED4
_081B6048:
	ldr r0, _081B6054
	ldr r1, _081B6058
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B6054: .4byte 0x02021C7C
_081B6058: .4byte 0x085C9EE2
_081B605C:
	ldr r0, _081B6068
	ldr r1, _081B606C
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B6068: .4byte 0x02021C7C
_081B606C: .4byte 0x085C9EF2
_081B6070:
	ldr r0, _081B607C
	ldr r1, _081B6080
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B607C: .4byte 0x02021C7C
_081B6080: .4byte 0x085C9EC0
_081B6084:
	ldr r0, _081B6090
	ldr r1, _081B6094
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B6090: .4byte 0x02021C7C
_081B6094: .4byte 0x085C9FE7
_081B6098:
	ldr r0, _081B60A4
	ldr r1, _081B60A8
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B60A4: .4byte 0x02021C7C
_081B60A8: .4byte 0x085C9FF7
_081B60AC:
	ldr r0, _081B60B8
	ldr r1, _081B60BC
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B60B8: .4byte 0x02021C7C
_081B60BC: .4byte 0x085C9F2B
_081B60C0:
	ldr r0, _081B60C8
	ldr r1, _081B60CC
	b _081B6114
	.align 2, 0
_081B60C8: .4byte 0x02021C54
_081B60CC: .4byte 0x085C9AE7
_081B60D0:
	ldr r0, _081B60D8
	ldr r1, _081B60DC
	b _081B6114
	.align 2, 0
_081B60D8: .4byte 0x02021C54
_081B60DC: .4byte 0x085CA36F
_081B60E0:
	ldr r0, _081B60E8
	ldr r1, _081B60EC
	b _081B6114
	.align 2, 0
_081B60E8: .4byte 0x02021C54
_081B60EC: .4byte 0x085CA374
_081B60F0:
	ldr r0, _081B60F8
	ldr r1, _081B60FC
	b _081B6114
	.align 2, 0
_081B60F8: .4byte 0x02021C54
_081B60FC: .4byte 0x085CA383
_081B6100:
	ldr r0, _081B6108
	ldr r1, _081B610C
	b _081B6114
	.align 2, 0
_081B6108: .4byte 0x02021C54
_081B610C: .4byte 0x085C9AED
_081B6110:
	ldr r0, _081B6124
	ldr r1, _081B6128
_081B6114:
	bl StringCopy
	ldr r0, _081B612C
	ldr r1, _081B6130
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B6124: .4byte 0x02021C54
_081B6128: .4byte 0x085C9AF2
_081B612C: .4byte 0x02021C7C
_081B6130: .4byte 0x085C9F5F
_081B6134:
	ldr r0, _081B6140
	ldr r1, _081B6144
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B6140: .4byte 0x02021C7C
_081B6144: .4byte 0x085C9F3B
_081B6148:
	ldr r0, _081B6154
	ldr r1, _081B6158
	bl StringExpandPlaceholders
	b _081B6164
	.align 2, 0
_081B6154: .4byte 0x02021C7C
_081B6158: .4byte 0x085C9F06
_081B615C:
	ldr r0, _081B6168
	ldr r1, _081B616C
	bl StringExpandPlaceholders
_081B6164:
	pop {r0}
	bx r0
	.align 2, 0
_081B6168: .4byte 0x02021C7C
_081B616C: .4byte 0x085C9AF7
	thumb_func_end GetMedicineItemEffectMessage

	thumb_func_start UsingHPEVItemOnShedinja
UsingHPEVItemOnShedinja: @ 0x081B6170
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl GetItemEffectType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd
	bne _081B619C
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	ldr r1, _081B6198
	cmp r0, r1
	bne _081B619C
	movs r0, #0
	b _081B619E
	.align 2, 0
_081B6198: .4byte 0x0000012F
_081B619C:
	movs r0, #1
_081B619E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end UsingHPEVItemOnShedinja

	thumb_func_start IsItemFlute
IsItemFlute: @ 0x081B61A4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x27
	beq _081B61B6
	cmp r0, #0x29
	beq _081B61B6
	cmp r0, #0x28
	bne _081B61BA
_081B61B6:
	movs r0, #1
	b _081B61BC
_081B61BA:
	movs r0, #0
_081B61BC:
	pop {r1}
	bx r1
	thumb_func_end IsItemFlute

	thumb_func_start ExecuteTableBasedItemEffect__
ExecuteTableBasedItemEffect__: @ 0x081B61C0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _081B61EC
	ldr r1, _081B61F0
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081B61F8
	movs r0, #0x64
	muls r0, r3, r0
	ldr r1, _081B61F4
	adds r0, r0, r1
	adds r1, r5, #0
	adds r2, r3, #0
	b _081B6212
	.align 2, 0
_081B61EC: .4byte 0x03002360
_081B61F0: .4byte 0x00000439
_081B61F4: .4byte 0x02024190
_081B61F8:
	movs r0, #0x64
	adds r4, r3, #0
	muls r4, r0, r4
	ldr r0, _081B6224
	adds r4, r4, r0
	adds r0, r3, #0
	bl sub_081B8BD8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
_081B6212:
	adds r3, r6, #0
	bl ExecuteTableBasedItemEffect
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081B6224: .4byte 0x02024190
	thumb_func_end ExecuteTableBasedItemEffect__

	thumb_func_start ItemUseCB_Medicine
ItemUseCB_Medicine: @ 0x081B6228
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r0, #0
	mov sl, r0
	ldr r0, _081B62B0
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B62B4
	adds r5, r1, r0
	ldr r0, _081B62B8
	ldrh r6, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl UsingHPEVItemOnShedinja
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B62A0
	adds r0, r6, #0
	bl IsHPRecoveryItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bne _081B628E
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	adds r0, r5, #0
	movs r1, #0x3a
	bl GetMonData
	cmp sl, r0
	bne _081B628E
	movs r1, #0
	mov r8, r1
_081B628E:
	ldr r4, _081B62B0
	ldrb r0, [r4, #9]
	adds r1, r6, #0
	movs r2, #0
	bl ExecuteTableBasedItemEffect__
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B62C4
_081B62A0:
	ldr r1, _081B62BC
	movs r0, #0
	strb r0, [r1]
	movs r0, #5
	bl PlaySE
	ldr r0, _081B62C0
	b _081B6394
	.align 2, 0
_081B62B0: .4byte 0x0203CB94
_081B62B4: .4byte 0x02024190
_081B62B8: .4byte 0x0203CB48
_081B62BC: .4byte 0x0203CBB4
_081B62C0: .4byte 0x085C9AF7
_081B62C4:
	ldr r1, _081B62EC
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl IsItemFlute
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B62F0
	movs r0, #1
	bl PlaySE
	ldrb r0, [r4, #0xb]
	cmp r0, #0xe
	beq _081B62F6
	adds r0, r6, #0
	movs r1, #1
	bl RemoveBagItem
	b _081B62F6
	.align 2, 0
_081B62EC: .4byte 0x0203CBB4
_081B62F0:
	movs r0, #0x75
	bl PlaySE
_081B62F6:
	ldr r4, _081B6374
	ldr r7, _081B6378
	movs r0, #9
	ldrsb r0, [r7, r0]
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r1, r1, r0
	adds r0, r5, #0
	bl party_menu_get_status_condition_and_update_object
	ldr r2, _081B637C
	movs r0, #9
	ldrsb r0, [r7, r0]
	ldr r1, [r4]
	lsls r0, r0, #4
	adds r3, r0, r1
	ldrb r1, [r3, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _081B6334
	adds r0, r5, #0
	adds r1, r3, #0
	movs r2, #1
	bl DisplayPartyPokemonLevelCheck
_081B6334:
	mov r2, r8
	cmp r2, #1
	bne _081B6384
	mov r0, sl
	cmp r0, #0
	bne _081B6348
	ldrb r0, [r7, #9]
	movs r1, #1
	bl sub_081B0C9C
_081B6348:
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	adds r3, r0, #0
	mov r1, sl
	subs r3, r3, r1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldrb r1, [r7, #9]
	ldr r0, _081B6380
	str r0, [sp]
	mov r0, sb
	movs r2, #1
	bl sub_081B1BE8
	mov r0, sb
	movs r1, #0
	mov r2, sl
	bl sub_081B1C78
	b _081B63B0
	.align 2, 0
_081B6374: .4byte 0x0203CBA8
_081B6378: .4byte 0x0203CB94
_081B637C: .4byte 0x020205AC
_081B6380: .4byte 0x081B63CD
_081B6384:
	ldr r1, _081B63C0
	adds r0, r5, #0
	bl GetMonNickname
	adds r0, r6, #0
	bl GetMedicineItemEffectMessage
	ldr r0, _081B63C4
_081B6394:
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B63C8
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [sp, #4]
	str r1, [r0]
_081B63B0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B63C0: .4byte 0x02021C40
_081B63C4: .4byte 0x02021C7C
_081B63C8: .4byte 0x03005B60
	thumb_func_end ItemUseCB_Medicine

	thumb_func_start sub_081B63CC
sub_081B63CC: @ 0x081B63CC
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _081B6418
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B641C
	adds r0, r0, r1
	ldr r1, _081B6420
	bl GetMonNickname
	ldr r4, _081B6424
	ldr r1, _081B6428
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	bl HandleBattleLowHpMusicChange
	ldr r1, _081B642C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6430
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B6418: .4byte 0x0203CB94
_081B641C: .4byte 0x02024190
_081B6420: .4byte 0x02021C40
_081B6424: .4byte 0x02021C7C
_081B6428: .4byte 0x085C9E8F
_081B642C: .4byte 0x03005B60
_081B6430: .4byte 0x081B6435
	thumb_func_end sub_081B63CC

	thumb_func_start sub_081B6434
sub_081B6434: @ 0x081B6434
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B645A
	ldr r0, _081B6460
	ldrb r1, [r0]
	cmp r1, #0
	bne _081B6454
	ldr r0, _081B6464
	ldr r0, [r0]
	str r1, [r0, #4]
_081B6454:
	adds r0, r4, #0
	bl sub_081B0F90
_081B645A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6460: .4byte 0x0203CBB4
_081B6464: .4byte 0x0203CB90
	thumb_func_end sub_081B6434

	thumb_func_start sub_081B6468
sub_081B6468: @ 0x081B6468
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r4, _081B6500
	movs r1, #9
	ldrsb r1, [r4, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B6504
	adds r5, r1, r0
	ldr r0, _081B6508
	ldrh r6, [r0]
	adds r0, r6, #0
	bl GetItemEffectType
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r5, #0
	movs r1, #0x20
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ItemEffectToMonEv
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldrb r0, [r4, #9]
	adds r1, r6, #0
	movs r2, #0
	bl ExecuteTableBasedItemEffect__
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x20
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ItemEffectToMonEv
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r4, #0
	bne _081B64F0
	ldr r0, [sp, #4]
	cmp r0, sb
	bne _081B6514
	ldr r1, [sp, #8]
	cmp r1, r8
	bne _081B6514
_081B64F0:
	ldr r1, _081B650C
	movs r0, #0
	strb r0, [r1]
	movs r0, #5
	bl PlaySE
	ldr r0, _081B6510
	b _081B6582
	.align 2, 0
_081B6500: .4byte 0x0203CB94
_081B6504: .4byte 0x02024190
_081B6508: .4byte 0x0203CB48
_081B650C: .4byte 0x0203CBB4
_081B6510: .4byte 0x085C9AF7
_081B6514:
	ldr r1, _081B6550
	movs r0, #1
	strb r0, [r1]
	movs r0, #1
	bl PlaySE
	adds r0, r6, #0
	movs r1, #1
	bl RemoveBagItem
	ldr r1, _081B6554
	adds r0, r5, #0
	bl GetMonNickname
	ldr r1, _081B6558
	adds r0, r7, #0
	bl ItemEffectToStatString
	ldr r2, [sp, #4]
	cmp r2, sb
	beq _081B6578
	ldr r0, [sp, #8]
	cmp r0, r8
	beq _081B6564
	ldr r0, _081B655C
	ldr r1, _081B6560
	bl StringExpandPlaceholders
	b _081B6580
	.align 2, 0
_081B6550: .4byte 0x0203CBB4
_081B6554: .4byte 0x02021C40
_081B6558: .4byte 0x02021C54
_081B655C: .4byte 0x02021C7C
_081B6560: .4byte 0x085C9F78
_081B6564:
	ldr r0, _081B6570
	ldr r1, _081B6574
	bl StringExpandPlaceholders
	b _081B6580
	.align 2, 0
_081B6570: .4byte 0x02021C7C
_081B6574: .4byte 0x085C9FC1
_081B6578:
	ldr r0, _081B65B0
	ldr r1, _081B65B4
	bl StringExpandPlaceholders
_081B6580:
	ldr r0, _081B65B0
_081B6582:
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B65B8
	mov r2, sl
	lsls r0, r2, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [sp]
	str r1, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B65B0: .4byte 0x02021C7C
_081B65B4: .4byte 0x085C9F9B
_081B65B8: .4byte 0x03005B60
	thumb_func_end sub_081B6468

	thumb_func_start ItemEffectToMonEv
ItemEffectToMonEv: @ 0x081B65BC
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	subs r0, #0xc
	cmp r0, #5
	bhi _081B6632
	lsls r0, r0, #2
	ldr r1, _081B65D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B65D8: .4byte 0x081B65DC
_081B65DC: @ jump table
	.4byte _081B660C @ case 0
	.4byte _081B65F4 @ case 1
	.4byte _081B661E @ case 2
	.4byte _081B6624 @ case 3
	.4byte _081B6618 @ case 4
	.4byte _081B6612 @ case 5
_081B65F4:
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	ldr r1, _081B6608
	cmp r0, r1
	beq _081B6632
	adds r0, r4, #0
	movs r1, #0x1a
	b _081B6628
	.align 2, 0
_081B6608: .4byte 0x0000012F
_081B660C:
	adds r0, r4, #0
	movs r1, #0x1b
	b _081B6628
_081B6612:
	adds r0, r4, #0
	movs r1, #0x1c
	b _081B6628
_081B6618:
	adds r0, r4, #0
	movs r1, #0x1d
	b _081B6628
_081B661E:
	adds r0, r4, #0
	movs r1, #0x1e
	b _081B6628
_081B6624:
	adds r0, r4, #0
	movs r1, #0x1f
_081B6628:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _081B6634
_081B6632:
	movs r0, #0
_081B6634:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ItemEffectToMonEv

	thumb_func_start ItemEffectToStatString
ItemEffectToStatString: @ 0x081B663C
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0xc
	cmp r0, #5
	bhi _081B66A8
	lsls r0, r0, #2
	ldr r1, _081B6654
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081B6654: .4byte 0x081B6658
_081B6658: @ jump table
	.4byte _081B6678 @ case 0
	.4byte _081B6670 @ case 1
	.4byte _081B6690 @ case 2
	.4byte _081B66A0 @ case 3
	.4byte _081B6688 @ case 4
	.4byte _081B6680 @ case 5
_081B6670:
	ldr r1, _081B6674
	b _081B6692
	.align 2, 0
_081B6674: .4byte 0x085C9AE7
_081B6678:
	ldr r1, _081B667C
	b _081B6692
	.align 2, 0
_081B667C: .4byte 0x085CA36F
_081B6680:
	ldr r1, _081B6684
	b _081B6692
	.align 2, 0
_081B6684: .4byte 0x085CA374
_081B6688:
	ldr r1, _081B668C
	b _081B6692
	.align 2, 0
_081B668C: .4byte 0x085CA383
_081B6690:
	ldr r1, _081B669C
_081B6692:
	adds r0, r2, #0
	bl StringCopy
	b _081B66A8
	.align 2, 0
_081B669C: .4byte 0x085C9AED
_081B66A0:
	ldr r1, _081B66AC
	adds r0, r2, #0
	bl StringCopy
_081B66A8:
	pop {r0}
	bx r0
	.align 2, 0
_081B66AC: .4byte 0x085C9AF2
	thumb_func_end ItemEffectToStatString

	thumb_func_start sub_081B66B0
sub_081B66B0: @ 0x081B66B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov sl, r0
	movs r1, #1
	mov r8, r1
	movs r0, #3
	bl sub_081B2E34
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r6, #0
	movs r0, #0x64
	adds r2, r4, #0
	muls r2, r0, r2
	str r2, [sp, #0xc]
_081B66E0:
	ldr r0, _081B6774
	adds r1, r6, #0
	adds r1, #0xd
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	movs r1, #0
	bl GetFontAttribute
	adds r4, r0, #0
	mov r0, r8
	movs r1, #2
	bl GetFontAttribute
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r5, #3
	ldr r0, _081B6778
	adds r2, r2, r0
	lsls r0, r6, #4
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r7, #0
	str r7, [sp, #8]
	mov r0, sb
	mov r1, r8
	adds r3, r4, #0
	bl AddTextPrinterParameterized
	cmp r5, #0
	beq _081B673C
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_081B673C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _081B66E0
	movs r0, #0x10
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	str r7, [sp, #8]
	mov r0, sb
	mov r1, r8
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B6774: .4byte 0x02024190
_081B6778: .4byte 0x082EACC4
	thumb_func_end sub_081B66B0

	thumb_func_start ether_effect_related_3
ether_effect_related_3: @ 0x081B677C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl Menu_ProcessInput
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B67B8
	adds r0, #1
	cmp r1, r0
	bne _081B67A8
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081B687C
	b _081B67B8
_081B67A8:
	ldr r0, _081B67C0
	ldr r0, [r0]
	adds r0, #0xd
	bl sub_081B2CB0
	adds r0, r5, #0
	bl ether_effect_related_2
_081B67B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B67C0: .4byte 0x0203CB90
	thumb_func_end ether_effect_related_3

	thumb_func_start dp05_ether
dp05_ether: @ 0x081B67C4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B67DC
	ldrh r0, [r0]
	cmp r0, #0xaf
	bne _081B67E8
	ldr r0, _081B67E0
	ldr r0, [r0]
	ldr r1, _081B67E4
	adds r0, r0, r1
	b _081B67F2
	.align 2, 0
_081B67DC: .4byte 0x0203CB48
_081B67E0: .4byte 0x03005AEC
_081B67E4: .4byte 0x00003214
_081B67E8:
	ldr r1, _081B680C
	subs r0, #0xd
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
_081B67F2:
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _081B6814
	ldr r0, _081B6810
	strh r1, [r0, #0xe]
	adds r0, r4, #0
	bl ether_effect_related
	b _081B6836
	.align 2, 0
_081B680C: .4byte 0x082EEF14
_081B6810: .4byte 0x0203CB94
_081B6814:
	movs r0, #5
	bl PlaySE
	movs r0, #0x16
	bl display_pokemon_menu_message
	ldr r0, _081B683C
	ldrb r0, [r0, #9]
	bl sub_081B66B0
	ldr r1, _081B6840
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6844
	str r1, [r0]
_081B6836:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B683C: .4byte 0x0203CB94
_081B6840: .4byte 0x03005B60
_081B6844: .4byte 0x081B677D
	thumb_func_end dp05_ether

	thumb_func_start ether_effect_related_2
ether_effect_related_2: @ 0x081B6848
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081B6874
	ldr r0, [r0]
	adds r0, #0xc
	bl sub_081B2CB0
	bl Menu_GetCursorPos
	ldr r1, _081B6878
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0xe]
	adds r0, r4, #0
	bl ether_effect_related
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6874: .4byte 0x0203CB90
_081B6878: .4byte 0x0203CB94
	thumb_func_end ether_effect_related_2

	thumb_func_start sub_081B687C
sub_081B687C: @ 0x081B687C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081B68A8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _081B68AC
	str r0, [r1]
	ldr r0, _081B68B0
	ldr r0, [r0]
	movs r1, #0
	str r1, [r0, #4]
	adds r0, #0xc
	bl sub_081B2CB0
	movs r0, #5
	bl display_pokemon_menu_message
	pop {r0}
	bx r0
	.align 2, 0
_081B68A8: .4byte 0x03005B60
_081B68AC: .4byte 0x081B1041
_081B68B0: .4byte 0x0203CB90
	thumb_func_end sub_081B687C

	thumb_func_start ether_effect_related
ether_effect_related: @ 0x081B68B4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _081B68E4
	ldr r0, _081B68E8
	ldrh r5, [r0]
	adds r4, r7, #0
	subs r4, #0xe
	ldrb r0, [r4, #9]
	ldrb r2, [r7]
	adds r1, r5, #0
	bl ExecuteTableBasedItemEffect__
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B68F4
	ldr r1, _081B68EC
	movs r0, #0
	strb r0, [r1]
	movs r0, #5
	bl PlaySE
	ldr r0, _081B68F0
	b _081B693A
	.align 2, 0
_081B68E4: .4byte 0x0203CBA2
_081B68E8: .4byte 0x0203CB48
_081B68EC: .4byte 0x0203CBB4
_081B68F0: .4byte 0x085C9AF7
_081B68F4:
	ldr r1, _081B695C
	movs r0, #1
	strb r0, [r1]
	movs r1, #9
	ldrsb r1, [r4, r1]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _081B6960
	adds r4, r4, r0
	movs r0, #1
	bl PlaySE
	adds r0, r5, #0
	movs r1, #1
	bl RemoveBagItem
	movs r0, #0
	ldrsh r1, [r7, r0]
	adds r1, #0xd
	adds r0, r4, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	ldr r0, _081B6964
	lsrs r1, r1, #0xd
	ldr r2, _081B6968
	adds r1, r1, r2
	bl StringCopy
	adds r0, r5, #0
	bl GetMedicineItemEffectMessage
	ldr r0, _081B696C
_081B693A:
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B6970
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6974
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B695C: .4byte 0x0203CBB4
_081B6960: .4byte 0x02024190
_081B6964: .4byte 0x02021C40
_081B6968: .4byte 0x082EACC4
_081B696C: .4byte 0x02021C7C
_081B6970: .4byte 0x03005B60
_081B6974: .4byte 0x081B6435
	thumb_func_end ether_effect_related

	thumb_func_start dp05_pp_up
dp05_pp_up: @ 0x081B6978
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	movs r0, #0x17
	bl display_pokemon_menu_message
	ldr r0, _081B69A8
	ldrb r0, [r0, #9]
	bl sub_081B66B0
	ldr r1, _081B69AC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B69B0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B69A8: .4byte 0x0203CB94
_081B69AC: .4byte 0x03005B60
_081B69B0: .4byte 0x081B677D
	thumb_func_end dp05_pp_up

	thumb_func_start ItemIdToBattleMoveId
ItemIdToBattleMoveId: @ 0x081B69B4
	lsls r0, r0, #0x10
	ldr r1, _081B69C4
	adds r0, r0, r1
	ldr r1, _081B69C8
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_081B69C4: .4byte 0xFEDF0000
_081B69C8: .4byte 0x085E18F8
	thumb_func_end ItemIdToBattleMoveId

	thumb_func_start IsMoveHm
IsMoveHm: @ 0x081B69CC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	ldr r3, _081B69E8
_081B69D6:
	adds r0, r1, #0
	adds r0, #0x32
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _081B69EC
	movs r0, #1
	b _081B69F8
	.align 2, 0
_081B69E8: .4byte 0x085E18F8
_081B69EC:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _081B69D6
	movs r0, #0
_081B69F8:
	pop {r1}
	bx r1
	thumb_func_end IsMoveHm

	thumb_func_start MonKnowsMove
MonKnowsMove: @ 0x081B69FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r4, #0
_081B6A06:
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r6, #0
	bl GetMonData
	cmp r0, r5
	bne _081B6A18
	movs r0, #1
	b _081B6A24
_081B6A18:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081B6A06
	movs r0, #0
_081B6A24:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MonKnowsMove

	thumb_func_start sub_081B6A2C
sub_081B6A2C: @ 0x081B6A2C
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _081B6A4C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6A4C: .4byte 0x02021C7C
	thumb_func_end sub_081B6A2C

	thumb_func_start sub_081B6A50
sub_081B6A50: @ 0x081B6A50
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_081B6A2C
	ldr r1, _081B6A74
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6A78
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6A74: .4byte 0x03005B60
_081B6A78: .4byte 0x081B6435
	thumb_func_end sub_081B6A50

	thumb_func_start sub_081B6A7C
sub_081B6A7C: @ 0x081B6A7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #5
	bl PlaySE
	ldr r7, _081B6B00
	movs r1, #9
	ldrsb r1, [r7, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B6B04
	adds r5, r1, r0
	movs r0, #0xe
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _081B6B08
	ldrh r4, [r0]
	ldr r1, _081B6B0C
	adds r0, r5, #0
	bl GetMonNickname
	adds r0, r4, #0
	bl ItemIdToBattleMoveId
	strh r0, [r7, #0xe]
	ldr r0, _081B6B10
	movs r2, #0xe
	ldrsh r1, [r7, r2]
	lsls r1, r1, #3
	ldr r2, _081B6B14
	adds r1, r1, r2
	bl StringCopy
	movs r0, #0
	mov r1, r8
	strh r0, [r1, #2]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl CanMonLearnTMTutor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B6B24
	cmp r0, #2
	beq _081B6B2C
	ldrh r1, [r7, #0xe]
	adds r0, r5, #0
	bl GiveMoveToMon
	lsls r0, r0, #0x10
	ldr r1, _081B6B18
	cmp r0, r1
	beq _081B6B3C
	ldr r0, _081B6B1C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B6B20
	str r0, [r1]
	b _081B6B50
	.align 2, 0
_081B6B00: .4byte 0x0203CB94
_081B6B04: .4byte 0x02024190
_081B6B08: .4byte 0x0203CB48
_081B6B0C: .4byte 0x02021C40
_081B6B10: .4byte 0x02021C54
_081B6B14: .4byte 0x082EACC4
_081B6B18: .4byte 0xFFFF0000
_081B6B1C: .4byte 0x03005B60
_081B6B20: .4byte 0x081B6B69
_081B6B24:
	ldr r1, _081B6B28
	b _081B6B2E
	.align 2, 0
_081B6B28: .4byte 0x085C9D7C
_081B6B2C:
	ldr r1, _081B6B38
_081B6B2E:
	adds r0, r6, #0
	bl sub_081B6A50
	b _081B6B50
	.align 2, 0
_081B6B38: .4byte 0x085C9E79
_081B6B3C:
	ldr r0, _081B6B5C
	bl sub_081B6A2C
	ldr r1, _081B6B60
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6B64
	str r1, [r0]
_081B6B50:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B6B5C: .4byte 0x085C9DA1
_081B6B60: .4byte 0x03005B60
_081B6B64: .4byte 0x081B6CA5
	thumb_func_end sub_081B6A7C

	thumb_func_start sub_081B6B68
sub_081B6B68: @ 0x081B6B68
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _081B6BE8
	movs r1, #9
	ldrsb r1, [r2, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B6BEC
	adds r5, r1, r0
	adds r7, r2, #0
	adds r7, #0xe
	ldr r0, _081B6BF0
	ldrh r4, [r0]
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bne _081B6BA4
	adds r0, r5, #0
	movs r1, #4
	bl AdjustFriendship
	movs r0, #0xa9
	lsls r0, r0, #1
	cmp r4, r0
	bhi _081B6BA4
	adds r0, r4, #0
	movs r1, #1
	bl RemoveBagItem
_081B6BA4:
	ldr r1, _081B6BF4
	adds r0, r5, #0
	bl GetMonNickname
	ldr r0, _081B6BF8
	movs r2, #0
	ldrsh r1, [r7, r2]
	lsls r1, r1, #3
	ldr r2, _081B6BFC
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _081B6C00
	ldr r1, _081B6C04
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B6C08
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6C0C
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B6BE8: .4byte 0x0203CB94
_081B6BEC: .4byte 0x02024190
_081B6BF0: .4byte 0x0203CB48
_081B6BF4: .4byte 0x02021C40
_081B6BF8: .4byte 0x02021C54
_081B6BFC: .4byte 0x082EACC4
_081B6C00: .4byte 0x02021C7C
_081B6C04: .4byte 0x085C9D68
_081B6C08: .4byte 0x03005B60
_081B6C0C: .4byte 0x081B6C11
	thumb_func_end sub_081B6B68

	thumb_func_start sub_081B6C10
sub_081B6C10: @ 0x081B6C10
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B6C36
	ldr r0, _081B6C3C
	bl PlayFanfare
	ldr r1, _081B6C40
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6C44
	str r1, [r0]
_081B6C36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6C3C: .4byte 0x0000016F
_081B6C40: .4byte 0x03005B60
_081B6C44: .4byte 0x081B6C49
	thumb_func_end sub_081B6C10

	thumb_func_start sub_081B6C48
sub_081B6C48: @ 0x081B6C48
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B6C9A
	ldr r0, _081B6C84
	ldrh r1, [r0, #0x2e]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _081B6C70
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B6C9A
_081B6C70:
	ldr r0, _081B6C88
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _081B6C8C
	adds r0, r4, #0
	bl sub_081B7458
	b _081B6C9A
	.align 2, 0
_081B6C84: .4byte 0x03002360
_081B6C88: .4byte 0x0203CB94
_081B6C8C:
	cmp r0, #2
	bne _081B6C94
	ldr r0, _081B6CA0
	strh r2, [r0]
_081B6C94:
	adds r0, r5, #0
	bl sub_081B0F90
_081B6C9A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B6CA0: .4byte 0x02037290
	thumb_func_end sub_081B6C48

	thumb_func_start sub_081B6CA4
sub_081B6CA4: @ 0x081B6CA4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B6CC8
	bl sub_081B2FDC
	ldr r0, _081B6CD0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B6CD4
	str r0, [r1]
_081B6CC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6CD0: .4byte 0x03005B60
_081B6CD4: .4byte 0x081B6CD9
	thumb_func_end sub_081B6CA4

	thumb_func_start sub_081B6CD8
sub_081B6CD8: @ 0x081B6CD8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B6CFE
	cmp r1, #0
	bgt _081B6CF8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B6D24
	b _081B6D30
_081B6CF8:
	cmp r1, #1
	beq _081B6D2A
	b _081B6D30
_081B6CFE:
	ldr r0, _081B6D18
	movs r1, #1
	bl sub_081B182C
	ldr r1, _081B6D1C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6D20
	str r1, [r0]
	b _081B6D30
	.align 2, 0
_081B6D18: .4byte 0x085C9E23
_081B6D1C: .4byte 0x03005B60
_081B6D20: .4byte 0x081B6D39
_081B6D24:
	movs r0, #5
	bl PlaySE
_081B6D2A:
	adds r0, r4, #0
	bl sub_081B6EE0
_081B6D30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B6CD8

	thumb_func_start sub_081B6D38
sub_081B6D38: @ 0x081B6D38
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B6D58
	ldr r0, _081B6D60
	ldr r1, [r0]
	ldr r0, _081B6D64
	str r0, [r1, #4]
	adds r0, r4, #0
	bl sub_081B0F90
_081B6D58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6D60: .4byte 0x0203CB90
_081B6D64: .4byte 0x081B6D69
	thumb_func_end sub_081B6D38

	thumb_func_start sub_081B6D68
sub_081B6D68: @ 0x081B6D68
	push {r4, lr}
	sub sp, #4
	ldr r0, _081B6D90
	ldr r4, _081B6D94
	ldrb r1, [r4, #9]
	ldr r2, _081B6D98
	ldrb r2, [r2]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _081B6D9C
	ldrh r4, [r4, #0xe]
	str r4, [sp]
	bl ShowSelectMovePokemonSummaryScreen
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6D90: .4byte 0x02024190
_081B6D94: .4byte 0x0203CB94
_081B6D98: .4byte 0x0202418D
_081B6D9C: .4byte 0x081B6DA1
	thumb_func_end sub_081B6D68

	thumb_func_start sub_081B6DA0
sub_081B6DA0: @ 0x081B6DA0
	push {lr}
	sub sp, #0xc
	movs r0, #0x7f
	str r0, [sp]
	ldr r0, _081B6DC4
	str r0, [sp, #4]
	ldr r0, _081B6DC8
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B6DC4: .4byte 0x081B6DCD
_081B6DC8: .4byte 0x0203CB94
	thumb_func_end sub_081B6DA0

	thumb_func_start sub_081B6DCC
sub_081B6DCC: @ 0x081B6DCC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r0, _081B6DF4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B6DFE
	bl sub_081C14C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _081B6DF8
	adds r0, r4, #0
	bl sub_081B6E04
	b _081B6DFE
	.align 2, 0
_081B6DF4: .4byte 0x02037C74
_081B6DF8:
	adds r0, r5, #0
	bl sub_081B6EE0
_081B6DFE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081B6DCC

	thumb_func_start sub_081B6E04
sub_081B6E04: @ 0x081B6E04
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _081B6E64
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	adds r5, r1, #0
	muls r5, r0, r5
	ldr r0, _081B6E68
	adds r5, r5, r0
	bl sub_081C14C8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r1, #0xd
	adds r0, r5, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _081B6E6C
	adds r0, r5, #0
	bl GetMonNickname
	ldr r0, _081B6E70
	lsls r4, r4, #3
	ldr r1, _081B6E74
	adds r4, r4, r1
	adds r1, r4, #0
	bl StringCopy
	ldr r0, _081B6E78
	bl sub_081B6A2C
	ldr r1, _081B6E7C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6E80
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B6E64: .4byte 0x0203CB94
_081B6E68: .4byte 0x02024190
_081B6E6C: .4byte 0x02021C40
_081B6E70: .4byte 0x02021C54
_081B6E74: .4byte 0x082EACC4
_081B6E78: .4byte 0x085C9E35
_081B6E7C: .4byte 0x03005B60
_081B6E80: .4byte 0x081B6E85
	thumb_func_end sub_081B6E04

	thumb_func_start sub_081B6E84
sub_081B6E84: @ 0x081B6E84
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B6ED0
	ldr r5, _081B6ED8
	movs r1, #9
	ldrsb r1, [r5, r1]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _081B6EDC
	adds r4, r4, r0
	bl sub_081C14C8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl RemoveMonPPBonus
	ldrh r5, [r5, #0xe]
	bl sub_081C14C8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMonMoveSlot
	adds r0, r6, #0
	bl sub_081B6B68
_081B6ED0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B6ED8: .4byte 0x0203CB94
_081B6EDC: .4byte 0x02024190
	thumb_func_end sub_081B6E84

	thumb_func_start sub_081B6EE0
sub_081B6EE0: @ 0x081B6EE0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _081B6F28
	ldr r1, _081B6F2C
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _081B6F30
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _081B6F34
	ldr r1, _081B6F38
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B6F3C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B6F40
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B6F28: .4byte 0x02021C54
_081B6F2C: .4byte 0x0203CB94
_081B6F30: .4byte 0x082EACC4
_081B6F34: .4byte 0x02021C7C
_081B6F38: .4byte 0x085C9DF2
_081B6F3C: .4byte 0x03005B60
_081B6F40: .4byte 0x081B6F45
	thumb_func_end sub_081B6EE0

	thumb_func_start sub_081B6F44
sub_081B6F44: @ 0x081B6F44
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B6F68
	bl sub_081B2FDC
	ldr r0, _081B6F70
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B6F74
	str r0, [r1]
_081B6F68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B6F70: .4byte 0x03005B60
_081B6F74: .4byte 0x081B6F79
	thumb_func_end sub_081B6F44

	thumb_func_start sub_081B6F78
sub_081B6F78: @ 0x081B6F78
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _081B6FA8
	movs r1, #9
	ldrsb r1, [r7, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B6FAC
	adds r4, r1, r0
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	beq _081B6FB6
	cmp r5, #0
	bgt _081B6FB0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _081B7038
	b _081B706C
	.align 2, 0
_081B6FA8: .4byte 0x0203CB94
_081B6FAC: .4byte 0x02024190
_081B6FB0:
	cmp r5, #1
	beq _081B703E
	b _081B706C
_081B6FB6:
	ldr r1, _081B6FF8
	adds r0, r4, #0
	bl GetMonNickname
	ldr r0, _081B6FFC
	movs r2, #0xe
	ldrsh r1, [r7, r2]
	lsls r1, r1, #3
	ldr r2, _081B7000
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _081B7004
	ldr r1, _081B7008
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	movs r1, #0x10
	ldrsh r0, [r7, r1]
	cmp r0, #1
	bne _081B7014
	ldr r0, _081B700C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B7010
	str r0, [r1]
	b _081B706C
	.align 2, 0
_081B6FF8: .4byte 0x02021C40
_081B6FFC: .4byte 0x02021C54
_081B7000: .4byte 0x082EACC4
_081B7004: .4byte 0x02021C7C
_081B7008: .4byte 0x085C9E0D
_081B700C: .4byte 0x03005B60
_081B7010: .4byte 0x081B7091
_081B7014:
	cmp r0, #2
	bne _081B701C
	ldr r0, _081B702C
	strh r5, [r0]
_081B701C:
	ldr r0, _081B7030
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B7034
	str r0, [r1]
	b _081B706C
	.align 2, 0
_081B702C: .4byte 0x02037290
_081B7030: .4byte 0x03005B60
_081B7034: .4byte 0x081B6435
_081B7038:
	movs r0, #5
	bl PlaySE
_081B703E:
	ldr r1, _081B7074
	adds r0, r4, #0
	bl GetMonNickname
	ldr r0, _081B7078
	ldr r1, _081B707C
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _081B7080
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _081B7084
	bl sub_081B6A2C
	ldr r1, _081B7088
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B708C
	str r1, [r0]
_081B706C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B7074: .4byte 0x02021C40
_081B7078: .4byte 0x02021C54
_081B707C: .4byte 0x0203CB94
_081B7080: .4byte 0x082EACC4
_081B7084: .4byte 0x085C9DA1
_081B7088: .4byte 0x03005B60
_081B708C: .4byte 0x081B6CA5
	thumb_func_end sub_081B6F78

	thumb_func_start sub_081B7090
sub_081B7090: @ 0x081B7090
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B70A8
	adds r0, r4, #0
	bl sub_081B7458
_081B70A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B7090

	thumb_func_start dp05_rare_candy
dp05_rare_candy: @ 0x081B70B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _081B7114
	mov sb, r0
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B7118
	adds r5, r1, r0
	ldr r0, _081B711C
	ldr r6, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r4, r6, r1
	ldr r2, _081B7120
	mov r8, r2
	adds r0, r5, #0
	movs r1, #0x38
	bl GetMonData
	cmp r0, #0x64
	beq _081B7124
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_081B7644
	mov r1, sb
	ldrb r0, [r1, #9]
	mov r2, r8
	ldrh r1, [r2]
	movs r2, #0
	bl ExecuteTableBasedItemEffect__
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r6, r0
	adds r0, r5, #0
	bl sub_081B7644
	b _081B7126
	.align 2, 0
_081B7114: .4byte 0x0203CB94
_081B7118: .4byte 0x02024190
_081B711C: .4byte 0x0203CB90
_081B7120: .4byte 0x0203CB48
_081B7124:
	movs r4, #1
_081B7126:
	movs r0, #5
	bl PlaySE
	cmp r4, #0
	beq _081B7160
	ldr r1, _081B7154
	movs r0, #0
	strb r0, [r1]
	ldr r0, _081B7158
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B715C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	mov r1, sl
	b _081B71C2
	.align 2, 0
_081B7154: .4byte 0x0203CBB4
_081B7158: .4byte 0x085C9AF7
_081B715C: .4byte 0x03005B60
_081B7160:
	ldr r1, _081B71D4
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	bl PlayFanfareByFanfareNum
	ldr r0, _081B71D8
	ldrb r0, [r0, #9]
	adds r1, r5, #0
	bl sub_081B71F8
	ldr r0, _081B71DC
	ldrh r0, [r0]
	movs r1, #1
	bl RemoveBagItem
	ldr r1, _081B71E0
	adds r0, r5, #0
	bl GetMonNickname
	ldr r4, _081B71E4
	adds r0, r5, #0
	movs r1, #0x38
	bl GetMonData
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r4, _081B71E8
	ldr r1, _081B71EC
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B71F0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B71F4
_081B71C2:
	str r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B71D4: .4byte 0x0203CBB4
_081B71D8: .4byte 0x0203CB94
_081B71DC: .4byte 0x0203CB48
_081B71E0: .4byte 0x02021C40
_081B71E4: .4byte 0x02021C54
_081B71E8: .4byte 0x02021C7C
_081B71EC: .4byte 0x085C9F4E
_081B71F0: .4byte 0x03005B60
_081B71F4: .4byte 0x081B7281
	thumb_func_end dp05_rare_candy

	thumb_func_start sub_081B71F8
sub_081B71F8: @ 0x081B71F8
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r0, #0
	ldr r6, _081B7278
	lsls r4, r7, #4
	ldr r1, [r6]
	adds r1, r1, r4
	adds r0, r5, #0
	bl party_menu_get_status_condition_and_update_object
	ldr r2, _081B727C
	ldr r0, [r6]
	adds r3, r4, r0
	ldrb r1, [r3, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _081B7234
	adds r0, r5, #0
	adds r1, r3, #0
	movs r2, #1
	bl DisplayPartyPokemonLevelCheck
_081B7234:
	ldr r1, [r6]
	adds r1, r1, r4
	adds r0, r5, #0
	movs r2, #1
	bl DisplayPartyPokemonHPCheck
	ldr r1, [r6]
	adds r1, r1, r4
	adds r0, r5, #0
	movs r2, #1
	bl DisplayPartyPokemonMaxHPCheck
	ldr r1, [r6]
	adds r1, r1, r4
	adds r0, r5, #0
	bl DisplayPartyPokemonHPBarCheck
	ldr r0, [r6]
	adds r0, r4, r0
	ldrb r0, [r0, #9]
	adds r1, r5, #0
	bl sub_081B57D8
	adds r0, r7, #0
	movs r1, #1
	bl sub_081B0C9C
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B7278: .4byte 0x0203CBA8
_081B727C: .4byte 0x020205AC
	thumb_func_end sub_081B71F8

	thumb_func_start sub_081B7280
sub_081B7280: @ 0x081B7280
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	bl WaitFanfare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B72CC
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B72CC
	ldr r0, _081B72D4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081B72B2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B72CC
_081B72B2:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081B7328
	ldr r0, _081B72D8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B72DC
	str r0, [r1]
_081B72CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B72D4: .4byte 0x03002360
_081B72D8: .4byte 0x03005B60
_081B72DC: .4byte 0x081B72E1
	thumb_func_end sub_081B7280

	thumb_func_start sub_081B72E0
sub_081B72E0: @ 0x081B72E0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B731C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081B72FA
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B7314
_081B72FA:
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl sub_081B7374
	ldr r0, _081B7320
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B7324
	str r0, [r1]
_081B7314:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B731C: .4byte 0x03002360
_081B7320: .4byte 0x03005B60
_081B7324: .4byte 0x081B73B1
	thumb_func_end sub_081B72E0

	thumb_func_start sub_081B7328
sub_081B7328: @ 0x081B7328
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _081B7370
	ldr r5, [r0]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r4, r5, r0
	bl sub_081B3004
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #0x18]
	movs r1, #0x89
	lsls r1, r1, #2
	adds r2, r5, r1
	movs r1, #2
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r3, #1
	bl DrawLevelUpWindowPg1
	ldrb r0, [r4, #0x18]
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B7370: .4byte 0x0203CB90
	thumb_func_end sub_081B7328

	thumb_func_start sub_081B7374
sub_081B7374: @ 0x081B7374
	push {r4, lr}
	sub sp, #4
	ldr r0, _081B73AC
	ldr r1, [r0]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r4, r1, r0
	ldrh r0, [r4, #0x18]
	movs r2, #0x89
	lsls r2, r2, #2
	adds r1, r1, r2
	movs r2, #3
	str r2, [sp]
	movs r2, #1
	movs r3, #2
	bl DrawLevelUpWindowPg2
	ldrb r0, [r4, #0x18]
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B73AC: .4byte 0x0203CB90
	thumb_func_end sub_081B7374

	thumb_func_start sub_081B73B0
sub_081B73B0: @ 0x081B73B0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0
	bl WaitFanfare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B7452
	ldr r0, _081B7408
	ldrh r1, [r0, #0x2e]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _081B73D8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B7452
_081B73D8:
	bl sub_081B3034
	ldr r4, _081B740C
	movs r1, #9
	ldrsb r1, [r4, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B7410
	adds r0, r0, r1
	movs r1, #1
	bl MonTryLearningNewMove
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	strh r6, [r4, #0x10]
	ldr r0, _081B7414
	cmp r1, r0
	beq _081B7434
	cmp r1, r0
	bgt _081B7418
	cmp r1, #0
	beq _081B7424
	b _081B744C
	.align 2, 0
_081B7408: .4byte 0x03002360
_081B740C: .4byte 0x0203CB94
_081B7410: .4byte 0x02024190
_081B7414: .4byte 0x0000FFFE
_081B7418:
	ldr r0, _081B7420
	cmp r1, r0
	beq _081B742C
	b _081B744C
	.align 2, 0
_081B7420: .4byte 0x0000FFFF
_081B7424:
	adds r0, r5, #0
	bl sub_081B74BC
	b _081B7452
_081B742C:
	adds r0, r5, #0
	bl sub_081B7528
	b _081B7452
_081B7434:
	ldr r0, _081B7444
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B7448
	str r0, [r1]
	b _081B7452
	.align 2, 0
_081B7444: .4byte 0x03005B60
_081B7448: .4byte 0x081B7459
_081B744C:
	adds r0, r5, #0
	bl sub_081B75B8
_081B7452:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081B73B0

	thumb_func_start sub_081B7458
sub_081B7458: @ 0x081B7458
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B7488
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B748C
	adds r0, r0, r1
	movs r1, #0
	bl MonTryLearningNewMove
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _081B7490
	cmp r1, r0
	beq _081B74B6
	cmp r1, r0
	bgt _081B7494
	cmp r1, #0
	beq _081B74A0
	b _081B74B0
	.align 2, 0
_081B7488: .4byte 0x0203CB94
_081B748C: .4byte 0x02024190
_081B7490: .4byte 0x0000FFFE
_081B7494:
	ldr r0, _081B749C
	cmp r1, r0
	beq _081B74A8
	b _081B74B0
	.align 2, 0
_081B749C: .4byte 0x0000FFFF
_081B74A0:
	adds r0, r4, #0
	bl sub_081B74BC
	b _081B74B6
_081B74A8:
	adds r0, r4, #0
	bl sub_081B7528
	b _081B74B6
_081B74B0:
	adds r0, r4, #0
	bl sub_081B75B8
_081B74B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081B7458

	thumb_func_start sub_081B74BC
sub_081B74BC: @ 0x081B74BC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _081B7500
	movs r1, #9
	ldrsb r1, [r6, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B7504
	adds r7, r1, r0
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0
	bl GetEvolutionTargetSpecies
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _081B750C
	bl FreePartyPointers
	ldr r0, _081B7508
	ldr r1, [r6]
	str r1, [r0]
	ldrb r3, [r6, #9]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #1
	bl BeginEvolutionScene
	adds r0, r5, #0
	bl DestroyTask
	b _081B751A
	.align 2, 0
_081B7500: .4byte 0x0203CB94
_081B7504: .4byte 0x02024190
_081B7508: .4byte 0x03005F28
_081B750C:
	ldr r0, _081B7520
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B7524
	str r0, [r1]
_081B751A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B7520: .4byte 0x03005B60
_081B7524: .4byte 0x081B6435
	thumb_func_end sub_081B74BC

	thumb_func_start sub_081B7528
sub_081B7528: @ 0x081B7528
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _081B7590
	mov r8, r0
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B7594
	adds r0, r0, r1
	ldr r1, _081B7598
	bl GetMonNickname
	ldr r0, _081B759C
	ldr r6, _081B75A0
	ldrh r1, [r6]
	lsls r1, r1, #3
	ldr r2, _081B75A4
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _081B75A8
	ldr r1, _081B75AC
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldrh r0, [r6]
	mov r1, r8
	strh r0, [r1, #0xe]
	ldr r1, _081B75B0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B75B4
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B7590: .4byte 0x0203CB94
_081B7594: .4byte 0x02024190
_081B7598: .4byte 0x02021C40
_081B759C: .4byte 0x02021C54
_081B75A0: .4byte 0x02024186
_081B75A4: .4byte 0x082EACC4
_081B75A8: .4byte 0x02021C7C
_081B75AC: .4byte 0x085C9DA1
_081B75B0: .4byte 0x03005B60
_081B75B4: .4byte 0x081B6CA5
	thumb_func_end sub_081B7528

	thumb_func_start sub_081B75B8
sub_081B75B8: @ 0x081B75B8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _081B7620
	mov r8, r0
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B7624
	adds r0, r0, r1
	ldr r1, _081B7628
	bl GetMonNickname
	ldr r0, _081B762C
	lsls r1, r5, #3
	ldr r2, _081B7630
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _081B7634
	ldr r1, _081B7638
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	mov r0, r8
	strh r5, [r0, #0xe]
	ldr r1, _081B763C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B7640
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B7620: .4byte 0x0203CB94
_081B7624: .4byte 0x02024190
_081B7628: .4byte 0x02021C40
_081B762C: .4byte 0x02021C54
_081B7630: .4byte 0x082EACC4
_081B7634: .4byte 0x02021C7C
_081B7638: .4byte 0x085C9D68
_081B763C: .4byte 0x03005B60
_081B7640: .4byte 0x081B6C11
	thumb_func_end sub_081B75B8

	thumb_func_start sub_081B7644
sub_081B7644: @ 0x081B7644
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #0x3a
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0x3b
	bl GetMonData
	strh r0, [r5, #2]
	adds r0, r4, #0
	movs r1, #0x3c
	bl GetMonData
	strh r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0x3e
	bl GetMonData
	strh r0, [r5, #8]
	adds r0, r4, #0
	movs r1, #0x3f
	bl GetMonData
	strh r0, [r5, #0xa]
	adds r0, r4, #0
	movs r1, #0x3d
	bl GetMonData
	strh r0, [r5, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B7644

	thumb_func_start sub_081B768C
sub_081B768C: @ 0x081B768C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081B76C0
	ldr r2, [r1]
	movs r3, #0x86
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r3, #0
	strh r3, [r1]
	ldr r4, _081B76C4
	adds r1, r2, r4
	strh r3, [r1]
	ldr r1, _081B76C8
	ldrb r1, [r1, #9]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r3, #0x87
	lsls r3, r3, #2
	adds r2, r2, r3
	strh r1, [r2]
	bl sub_081B76CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B76C0: .4byte 0x0203CB90
_081B76C4: .4byte 0x0000021A
_081B76C8: .4byte 0x0203CB94
	thumb_func_end sub_081B768C

	thumb_func_start sub_081B76CC
sub_081B76CC: @ 0x081B76CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	ldr r6, _081B7724
	movs r1, #9
	ldrsb r1, [r6, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B7728
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B7712
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrb r0, [r6, #9]
	ldr r1, _081B772C
	ldrh r1, [r1]
	movs r2, #0
	bl ExecuteTableBasedItemEffect__
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B7738
_081B7712:
	ldr r0, _081B7730
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B7734
	str r0, [r1]
	b _081B77CE
	.align 2, 0
_081B7724: .4byte 0x0203CB94
_081B7728: .4byte 0x02024190
_081B772C: .4byte 0x0203CB48
_081B7730: .4byte 0x03005B60
_081B7734: .4byte 0x081B77F1
_081B7738:
	movs r0, #1
	bl PlaySE
	ldr r4, _081B77DC
	movs r0, #9
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r1, r1, r0
	adds r0, r5, #0
	bl party_menu_get_status_condition_and_update_object
	ldr r2, _081B77E0
	movs r0, #9
	ldrsb r0, [r6, r0]
	ldr r1, [r4]
	lsls r0, r0, #4
	adds r3, r0, r1
	ldrb r1, [r3, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _081B777A
	adds r0, r5, #0
	adds r1, r3, #0
	movs r2, #1
	bl DisplayPartyPokemonLevelCheck
_081B777A:
	ldr r4, _081B77E4
	ldr r0, [r4]
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl sub_081B0C9C
	ldrb r0, [r6, #9]
	movs r1, #1
	bl sub_081B0C9C
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	adds r3, r0, #0
	subs r3, r3, r7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldrb r1, [r6, #9]
	ldr r0, _081B77E8
	str r0, [sp]
	mov r0, r8
	movs r2, #1
	bl sub_081B1BE8
	mov r0, r8
	movs r1, #0
	adds r2, r7, #0
	bl sub_081B1C78
	ldr r0, [r4]
	movs r2, #0x86
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #1
	strh r2, [r1]
	ldr r1, _081B77EC
	adds r0, r0, r1
	strh r2, [r0]
_081B77CE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B77DC: .4byte 0x0203CBA8
_081B77E0: .4byte 0x020205AC
_081B77E4: .4byte 0x0203CB90
_081B77E8: .4byte 0x081B78B5
_081B77EC: .4byte 0x0000021A
	thumb_func_end sub_081B76CC

	thumb_func_start task_sacred_ash_party_loop
task_sacred_ash_party_loop: @ 0x081B77F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B78AE
	ldr r5, _081B7858
	ldr r2, [r5]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r3, _081B785C
	cmp r0, #1
	bne _081B7826
	movs r0, #0
	strh r0, [r1]
	movs r1, #9
	ldrsb r1, [r3, r1]
	movs r6, #0x87
	lsls r6, r6, #2
	adds r0, r2, r6
	strh r1, [r0]
_081B7826:
	ldrb r0, [r3, #9]
	adds r0, #1
	strb r0, [r3, #9]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	bne _081B78A8
	ldr r0, [r5]
	ldr r1, _081B7860
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bne _081B786C
	ldr r0, _081B7864
	strb r1, [r0]
	ldr r0, _081B7868
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	b _081B787C
	.align 2, 0
_081B7858: .4byte 0x0203CB90
_081B785C: .4byte 0x0203CB94
_081B7860: .4byte 0x0000021A
_081B7864: .4byte 0x0203CBB4
_081B7868: .4byte 0x085C9AF7
_081B786C:
	ldr r1, _081B7894
	movs r0, #1
	strb r0, [r1]
	ldr r0, _081B7898
	ldrh r0, [r0]
	movs r1, #1
	bl RemoveBagItem
_081B787C:
	ldr r1, _081B789C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B78A0
	str r1, [r0]
	ldr r1, _081B78A4
	movs r0, #0
	strb r0, [r1, #9]
	b _081B78AE
	.align 2, 0
_081B7894: .4byte 0x0203CBB4
_081B7898: .4byte 0x0203CB48
_081B789C: .4byte 0x03005B60
_081B78A0: .4byte 0x081B6435
_081B78A4: .4byte 0x0203CB94
_081B78A8:
	adds r0, r4, #0
	bl sub_081B76CC
_081B78AE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end task_sacred_ash_party_loop

	thumb_func_start sub_081B78B4
sub_081B78B4: @ 0x081B78B4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _081B78FC
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B7900
	adds r0, r0, r1
	ldr r1, _081B7904
	bl GetMonNickname
	ldr r4, _081B7908
	ldr r1, _081B790C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B7910
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B7914
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B78FC: .4byte 0x0203CB94
_081B7900: .4byte 0x02024190
_081B7904: .4byte 0x02021C40
_081B7908: .4byte 0x02021C7C
_081B790C: .4byte 0x085C9E8F
_081B7910: .4byte 0x03005B60
_081B7914: .4byte 0x081B77F1
	thumb_func_end sub_081B78B4

	thumb_func_start sub_081B7918
sub_081B7918: @ 0x081B7918
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #5
	bl PlaySE
	ldr r2, _081B7964
	ldr r1, _081B7968
	ldr r0, [r1]
	str r0, [r2]
	ldrb r0, [r1, #9]
	ldr r4, _081B796C
	ldrh r1, [r4]
	movs r2, #0
	bl ExecuteTableBasedItemEffect__
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B797C
	ldr r1, _081B7970
	movs r0, #0
	strb r0, [r1]
	ldr r0, _081B7974
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B7978
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	str r6, [r0]
	b _081B7988
	.align 2, 0
_081B7964: .4byte 0x03005F28
_081B7968: .4byte 0x0203CB94
_081B796C: .4byte 0x0203CB48
_081B7970: .4byte 0x0203CBB4
_081B7974: .4byte 0x085C9AF7
_081B7978: .4byte 0x03005B60
_081B797C:
	ldrh r0, [r4]
	movs r1, #1
	bl RemoveBagItem
	bl FreePartyPointers
_081B7988:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B7918

	thumb_func_start GetItemEffectType
GetItemEffectType: @ 0x081B7990
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	subs r2, #0xd
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa5
	bls _081B79A4
	b _081B7AE4
_081B79A4:
	cmp r1, #0xaf
	bne _081B79BC
	ldr r0, _081B79B4
	ldr r0, [r0]
	ldr r1, _081B79B8
	adds r4, r0, r1
	b _081B79C4
	.align 2, 0
_081B79B4: .4byte 0x03005AEC
_081B79B8: .4byte 0x00003214
_081B79BC:
	ldr r1, _081B79EC
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r4, [r0]
_081B79C4:
	ldrb r1, [r4]
	movs r5, #0x3f
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _081B79E6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _081B79E6
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _081B79E6
	ldrb r3, [r4, #3]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _081B79F0
_081B79E6:
	movs r0, #0
	b _081B7AEA
	.align 2, 0
_081B79EC: .4byte 0x082EEF14
_081B79F0:
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _081B79FE
	movs r0, #0xa
	b _081B7AEA
_081B79FE:
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	beq _081B7A0A
	movs r0, #1
	b _081B7AEA
_081B7A0A:
	adds r2, r5, #0
	ands r2, r3
	cmp r2, #0
	bne _081B7A18
	lsrs r0, r1, #7
	cmp r0, #0
	beq _081B7A5A
_081B7A18:
	cmp r2, #0x20
	bne _081B7A20
	movs r0, #4
	b _081B7AEA
_081B7A20:
	cmp r2, #0x10
	bne _081B7A28
	movs r0, #3
	b _081B7AEA
_081B7A28:
	cmp r2, #8
	bne _081B7A30
	movs r0, #5
	b _081B7AEA
_081B7A30:
	cmp r2, #4
	bne _081B7A38
	movs r0, #6
	b _081B7AEA
_081B7A38:
	cmp r2, #2
	bne _081B7A40
	movs r0, #7
	b _081B7AEA
_081B7A40:
	cmp r2, #1
	bne _081B7A48
	movs r0, #8
	b _081B7AEA
_081B7A48:
	lsrs r0, r1, #7
	cmp r0, #0
	beq _081B7A56
	cmp r2, #0
	bne _081B7A56
	movs r0, #9
	b _081B7AEA
_081B7A56:
	movs r0, #0xb
	b _081B7AEA
_081B7A5A:
	ldrb r1, [r4, #4]
	movs r0, #0x44
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	beq _081B7A6A
	movs r0, #2
	b _081B7AEA
_081B7A6A:
	movs r5, #2
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _081B7A78
	movs r0, #0xc
	b _081B7AEA
_081B7A78:
	movs r3, #1
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _081B7A86
	movs r0, #0xd
	b _081B7AEA
_081B7A86:
	ldrb r1, [r4, #5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081B7A94
	movs r0, #0xe
	b _081B7AEA
_081B7A94:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081B7AA0
	movs r0, #0xf
	b _081B7AEA
_081B7AA0:
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _081B7AAC
	movs r0, #0x10
	b _081B7AEA
_081B7AAC:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _081B7AB8
	movs r0, #0x11
	b _081B7AEA
_081B7AB8:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _081B7AC4
	movs r0, #0x12
	b _081B7AEA
_081B7AC4:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _081B7AD0
	movs r0, #0x13
	b _081B7AEA
_081B7AD0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081B7ADC
	movs r0, #0x14
	b _081B7AEA
_081B7ADC:
	movs r0, #0x18
	ands r0, r2
	cmp r0, #0
	bne _081B7AE8
_081B7AE4:
	movs r0, #0x16
	b _081B7AEA
_081B7AE8:
	movs r0, #0x15
_081B7AEA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetItemEffectType

	thumb_func_start sub_081B7AF0
sub_081B7AF0: @ 0x081B7AF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _081B7B70
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B7BBC
	ldr r7, _081B7B74
	movs r1, #9
	ldrsb r1, [r7, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B7B78
	adds r5, r1, r0
	movs r0, #0xe
	adds r0, r0, r7
	mov r8, r0
	ldr r1, _081B7B7C
	adds r0, r5, #0
	bl GetMonNickname
	ldr r4, _081B7B80
	ldrb r0, [r4]
	bl GetTutorMove
	strh r0, [r7, #0xe]
	ldr r0, _081B7B84
	movs r2, #0xe
	ldrsh r1, [r7, r2]
	lsls r1, r1, #3
	ldr r2, _081B7B88
	adds r1, r1, r2
	bl StringCopy
	movs r0, #2
	mov r1, r8
	strh r0, [r1, #2]
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl CanMonLearnTMTutor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B7B90
	cmp r0, #2
	beq _081B7B98
	ldrh r1, [r7, #0xe]
	adds r0, r5, #0
	bl GiveMoveToMon
	lsls r0, r0, #0x10
	ldr r1, _081B7B8C
	cmp r0, r1
	beq _081B7BA8
	adds r0, r6, #0
	bl sub_081B6B68
	b _081B7BBC
	.align 2, 0
_081B7B70: .4byte 0x02037C74
_081B7B74: .4byte 0x0203CB94
_081B7B78: .4byte 0x02024190
_081B7B7C: .4byte 0x02021C40
_081B7B80: .4byte 0x02037282
_081B7B84: .4byte 0x02021C54
_081B7B88: .4byte 0x082EACC4
_081B7B8C: .4byte 0xFFFF0000
_081B7B90:
	ldr r1, _081B7B94
	b _081B7B9A
	.align 2, 0
_081B7B94: .4byte 0x085C9D7C
_081B7B98:
	ldr r1, _081B7BA4
_081B7B9A:
	adds r0, r6, #0
	bl sub_081B6A50
	b _081B7BBC
	.align 2, 0
_081B7BA4: .4byte 0x085C9E79
_081B7BA8:
	ldr r0, _081B7BC8
	bl sub_081B6A2C
	ldr r1, _081B7BCC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B7BD0
	str r1, [r0]
_081B7BBC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B7BC8: .4byte 0x085C9DA1
_081B7BCC: .4byte 0x03005B60
_081B7BD0: .4byte 0x081B6CA5
	thumb_func_end sub_081B7AF0

	thumb_func_start CB2_PartyMenuFromStartMenu
CB2_PartyMenuFromStartMenu: @ 0x081B7BD4
	push {lr}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp]
	ldr r0, _081B7BF8
	str r0, [sp, #4]
	ldr r0, _081B7BFC
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B7BF8: .4byte 0x081B1041
_081B7BFC: .4byte 0x08085AFD
	thumb_func_end CB2_PartyMenuFromStartMenu

	thumb_func_start sub_081B7C00
sub_081B7C00: @ 0x081B7C00
	push {lr}
	sub sp, #0xc
	bl InBattlePyramid
	lsls r0, r0, #0x18
	ldr r1, _081B7C38
	cmp r0, #0
	bne _081B7C12
	ldr r1, _081B7C3C
_081B7C12:
	movs r0, #6
	str r0, [sp]
	ldr r0, _081B7C40
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #5
	movs r3, #0
	bl InitPartyMenu
	ldr r1, _081B7C44
	ldr r0, _081B7C48
	ldrh r0, [r0]
	strh r0, [r1, #0xc]
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B7C38: .4byte 0x081C478D
_081B7C3C: .4byte 0x081B5EF5
_081B7C40: .4byte 0x081B1041
_081B7C44: .4byte 0x0203CB94
_081B7C48: .4byte 0x0203CB48
	thumb_func_end sub_081B7C00

	thumb_func_start sub_081B7C4C
sub_081B7C4C: @ 0x081B7C4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r5, _081B7C8C
	ldr r0, _081B7C90
	mov sb, r0
	ldrb r0, [r0, #9]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r7, _081B7C94
	adds r0, r0, r7
	movs r1, #0xc
	bl GetMonData
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081B7C98
	adds r0, r4, #0
	bl sub_081B7CE4
	b _081B7CD0
	.align 2, 0
_081B7C8C: .4byte 0x0203CBC8
_081B7C90: .4byte 0x0203CB94
_081B7C94: .4byte 0x02024190
_081B7C98:
	ldrh r0, [r5]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B7CAC
	adds r0, r4, #0
	bl sub_081B8058
	b _081B7CD0
_081B7CAC:
	mov r1, sb
	movs r0, #9
	ldrsb r0, [r1, r0]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r7
	ldrh r1, [r5]
	movs r2, #1
	bl sub_081B19EC
	ldr r1, _081B7CDC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B7CE0
	str r1, [r0]
_081B7CD0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B7CDC: .4byte 0x03005B60
_081B7CE0: .4byte 0x081B7F41
	thumb_func_end sub_081B7C4C

	thumb_func_start sub_081B7CE4
sub_081B7CE4: @ 0x081B7CE4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _081B7D10
	ldrh r0, [r5, #0xc]
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B7D1C
	ldrh r0, [r5, #0xc]
	bl sub_081B8090
	ldr r0, _081B7D14
	ldr r1, [r0]
	ldr r0, _081B7D18
	str r0, [r1, #4]
	adds r0, r4, #0
	bl sub_081B0F90
	b _081B7D22
	.align 2, 0
_081B7D10: .4byte 0x0203CB94
_081B7D14: .4byte 0x0203CB90
_081B7D18: .4byte 0x081B7DED
_081B7D1C:
	adds r0, r4, #0
	bl sub_081B7D28
_081B7D22:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081B7CE4

	thumb_func_start sub_081B7D28
sub_081B7D28: @ 0x081B7D28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _081B7D90
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B7D84
	ldr r4, _081B7D94
	ldrh r5, [r4, #0xc]
	movs r0, #9
	ldrsb r0, [r4, r0]
	movs r1, #0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r6, _081B7D98
	adds r0, r0, r6
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	bl sub_081B1954
	movs r0, #9
	ldrsb r0, [r4, r0]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r6
	adds r1, r5, #0
	bl sub_081B1A88
	adds r0, r5, #0
	bl sub_081B8090
	ldr r1, _081B7D9C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B7DA0
	str r1, [r0]
_081B7D84:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B7D90: .4byte 0x02037C74
_081B7D94: .4byte 0x0203CB94
_081B7D98: .4byte 0x02024190
_081B7D9C: .4byte 0x03005B60
_081B7DA0: .4byte 0x081B7DA5
	thumb_func_end sub_081B7D28

	thumb_func_start sub_081B7DA4
sub_081B7DA4: @ 0x081B7DA4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081B7DE0
	ldrb r4, [r0, #9]
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B7DD8
	lsls r2, r4, #0x18
	asrs r2, r2, #0x18
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, _081B7DE4
	adds r0, r0, r1
	ldr r1, _081B7DE8
	lsls r2, r2, #4
	ldr r1, [r1]
	adds r1, r1, r2
	bl sub_081B5934
	adds r0, r5, #0
	bl sub_081B0F90
_081B7DD8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B7DE0: .4byte 0x0203CB94
_081B7DE4: .4byte 0x02024190
_081B7DE8: .4byte 0x0203CBA8
	thumb_func_end sub_081B7DA4

	thumb_func_start sub_081B7DEC
sub_081B7DEC: @ 0x081B7DEC
	push {r4, r5, r6, lr}
	ldr r4, _081B7E34
	movs r0, #9
	ldrsb r0, [r4, r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _081B7E38
	adds r0, r0, r5
	ldrh r1, [r4, #0xc]
	bl sub_081B1A88
	movs r0, #9
	ldrsb r0, [r4, r0]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0x40
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081B7E3C
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _081B7E40
	adds r2, r2, r0
	ldr r1, [r1]
	adds r1, r1, r2
	ldr r2, _081B7E44
	movs r0, #4
	movs r3, #3
	bl DoEasyChatScreen
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B7E34: .4byte 0x0203CB94
_081B7E38: .4byte 0x02024190
_081B7E3C: .4byte 0x03005AEC
_081B7E40: .4byte 0x00002BE0
_081B7E44: .4byte 0x081B7E49
	thumb_func_end sub_081B7DEC

	thumb_func_start sub_081B7E48
sub_081B7E48: @ 0x081B7E48
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r6, _081B7E98
	movs r1, #9
	ldrsb r1, [r6, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B7E9C
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _081B7EA0
	ldrh r0, [r0]
	cmp r0, #0
	bne _081B7EA8
	adds r0, r5, #0
	bl TakeMailFromMon
	ldr r4, _081B7EA4
	adds r0, r5, #0
	movs r1, #0xc
	adds r2, r4, #0
	bl SetMonData
	ldrh r0, [r4]
	movs r1, #1
	bl RemoveBagItem
	adds r0, r7, #0
	bl sub_081B80BC
	ldr r0, [r6]
	bl SetMainCallback2
	b _081B7EC4
	.align 2, 0
_081B7E98: .4byte 0x0203CB94
_081B7E9C: .4byte 0x02024190
_081B7EA0: .4byte 0x02037290
_081B7EA4: .4byte 0x0203CBC8
_081B7EA8:
	ldrb r0, [r6, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r6, #0xb]
	movs r1, #0x7f
	str r1, [sp]
	ldr r1, _081B7ECC
	str r1, [sp, #4]
	ldr r1, [r6]
	str r1, [sp, #8]
	movs r1, #0xff
	movs r3, #1
	bl InitPartyMenu
_081B7EC4:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B7ECC: .4byte 0x081B7ED1
	thumb_func_end sub_081B7E48

	thumb_func_start sub_081B7ED0
sub_081B7ED0: @ 0x081B7ED0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B7EF8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B7F2A
	ldr r1, _081B7EFC
	ldrh r0, [r1]
	cmp r0, #0
	beq _081B7F04
	ldr r0, _081B7F00
	ldrh r0, [r0, #0xc]
	ldrh r1, [r1]
	movs r2, #0
	bl sub_081B1A38
	b _081B7F1C
	.align 2, 0
_081B7EF8: .4byte 0x02037C74
_081B7EFC: .4byte 0x0203CBC8
_081B7F00: .4byte 0x0203CB94
_081B7F04:
	ldr r2, _081B7F30
	movs r1, #9
	ldrsb r1, [r2, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B7F34
	adds r0, r0, r1
	ldrh r1, [r2, #0xc]
	movs r2, #0
	movs r3, #1
	bl sub_081B1954
_081B7F1C:
	ldr r0, _081B7F38
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B7F3C
	str r0, [r1]
_081B7F2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B7F30: .4byte 0x0203CB94
_081B7F34: .4byte 0x02024190
_081B7F38: .4byte 0x03005B60
_081B7F3C: .4byte 0x081B7DA5
	thumb_func_end sub_081B7ED0

	thumb_func_start sub_081B7F40
sub_081B7F40: @ 0x081B7F40
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B7F64
	bl sub_081B2FDC
	ldr r0, _081B7F6C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B7F70
	str r0, [r1]
_081B7F64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B7F6C: .4byte 0x03005B60
_081B7F70: .4byte 0x081B7F75
	thumb_func_end sub_081B7F40

	thumb_func_start sub_081B7F74
sub_081B7F74: @ 0x081B7F74
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _081B7F9A
	cmp r1, #0
	bgt _081B7F94
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081B8034
	b _081B8048
_081B7F94:
	cmp r1, #1
	beq _081B803A
	b _081B8048
_081B7F9A:
	ldr r7, _081B7FCC
	ldrh r4, [r7, #0xc]
	adds r0, r4, #0
	bl sub_081B8090
	ldr r6, _081B7FD0
	ldrh r0, [r6]
	movs r1, #1
	bl AddBagItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B7FD8
	adds r0, r4, #0
	bl sub_081B80BC
	ldrh r0, [r6]
	bl pokemon_item_not_removed
	ldr r0, _081B7FD4
	movs r1, #0
	bl sub_081B182C
	b _081B8018
	.align 2, 0
_081B7FCC: .4byte 0x0203CB94
_081B7FD0: .4byte 0x0203CBC8
_081B7FD4: .4byte 0x02021C7C
_081B7FD8:
	adds r0, r4, #0
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B7FFC
	ldr r0, _081B7FF4
	ldr r1, [r0]
	ldr r0, _081B7FF8
	str r0, [r1, #4]
	adds r0, r5, #0
	bl sub_081B0F90
	b _081B8048
	.align 2, 0
_081B7FF4: .4byte 0x0203CB90
_081B7FF8: .4byte 0x081B7DED
_081B7FFC:
	movs r1, #9
	ldrsb r1, [r7, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B8028
	adds r0, r0, r1
	adds r1, r4, #0
	bl sub_081B1A88
	ldrh r1, [r6]
	adds r0, r4, #0
	movs r2, #1
	bl sub_081B1A38
_081B8018:
	ldr r1, _081B802C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B8030
	str r1, [r0]
	b _081B8048
	.align 2, 0
_081B8028: .4byte 0x02024190
_081B802C: .4byte 0x03005B60
_081B8030: .4byte 0x081B7DA5
_081B8034:
	movs r0, #5
	bl PlaySE
_081B803A:
	ldr r0, _081B8050
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B8054
	str r0, [r1]
_081B8048:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B8050: .4byte 0x03005B60
_081B8054: .4byte 0x081B7DA5
	thumb_func_end sub_081B7F74

	thumb_func_start sub_081B8058
sub_081B8058: @ 0x081B8058
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081B8084
	movs r1, #1
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081B8088
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081B808C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B8084: .4byte 0x085C9C5C
_081B8088: .4byte 0x03005B60
_081B808C: .4byte 0x081B7DA5
	thumb_func_end sub_081B8058

	thumb_func_start sub_081B8090
sub_081B8090: @ 0x081B8090
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _081B80AC
	ldrb r0, [r0, #0xb]
	cmp r0, #6
	bne _081B80B0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl RemovePCItem
	b _081B80B8
	.align 2, 0
_081B80AC: .4byte 0x0203CB94
_081B80B0:
	adds r0, r1, #0
	movs r1, #1
	bl RemoveBagItem
_081B80B8:
	pop {r0}
	bx r0
	thumb_func_end sub_081B8090

	thumb_func_start sub_081B80BC
sub_081B80BC: @ 0x081B80BC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _081B80D4
	ldrb r0, [r0, #0xb]
	cmp r0, #5
	beq _081B80D8
	adds r0, r1, #0
	movs r1, #1
	bl AddPCItem
	b _081B80E0
	.align 2, 0
_081B80D4: .4byte 0x0203CB94
_081B80D8:
	adds r0, r1, #0
	movs r1, #1
	bl AddBagItem
_081B80E0:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end sub_081B80BC

	thumb_func_start sub_081B80E8
sub_081B80E8: @ 0x081B80E8
	push {lr}
	sub sp, #0xc
	movs r0, #6
	str r0, [sp]
	ldr r0, _081B810C
	str r0, [sp, #4]
	ldr r0, _081B8110
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #7
	movs r3, #0
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B810C: .4byte 0x081B1041
_081B8110: .4byte 0x0816B969
	thumb_func_end sub_081B80E8

	thumb_func_start sub_081B8114
sub_081B8114: @ 0x081B8114
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _081B8160
	movs r1, #9
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _081B8164
	adds r5, r1, r0
	ldr r1, _081B8168
	movs r0, #0
	strb r0, [r1]
	ldr r2, _081B816C
	ldr r0, _081B8170
	ldrh r1, [r0]
	adds r1, #6
	ldrh r0, [r0, #2]
	adds r1, r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081B8174
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl GetMonData
	cmp r0, #0
	beq _081B817C
	ldr r0, _081B8178
	movs r1, #1
	bl sub_081B182C
	b _081B8192
	.align 2, 0
_081B8160: .4byte 0x0203CB94
_081B8164: .4byte 0x02024190
_081B8168: .4byte 0x0203CBB4
_081B816C: .4byte 0x03005AEC
_081B8170: .4byte 0x0203B984
_081B8174: .4byte 0x00002BE0
_081B8178: .4byte 0x085C9D0C
_081B817C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GiveMailToMon2
	adds r0, r4, #0
	bl ClearMailStruct
	ldr r0, _081B81AC
	movs r1, #1
	bl sub_081B182C
_081B8192:
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r0, _081B81B0
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B81B4
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B81AC: .4byte 0x085C9D32
_081B81B0: .4byte 0x03005B60
_081B81B4: .4byte 0x081B7DA5
	thumb_func_end sub_081B8114

	thumb_func_start InitChooseHalfPartyForBattle
InitChooseHalfPartyForBattle: @ 0x081B81B8
	push {lr}
	sub sp, #0xc
	bl sub_081B81F8
	movs r0, #0
	str r0, [sp]
	ldr r0, _081B81E8
	str r0, [sp, #4]
	ldr r0, _081B81EC
	ldr r0, [r0, #8]
	str r0, [sp, #8]
	movs r0, #4
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl InitPartyMenu
	ldr r1, _081B81F0
	ldr r0, _081B81F4
	str r0, [r1, #4]
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B81E8: .4byte 0x081B1041
_081B81EC: .4byte 0x03002360
_081B81F0: .4byte 0x0203CB94
_081B81F4: .4byte 0x081B843D
	thumb_func_end InitChooseHalfPartyForBattle

	thumb_func_start sub_081B81F8
sub_081B81F8: @ 0x081B81F8
	push {lr}
	ldr r0, _081B8208
	movs r1, #0
	movs r2, #4
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_081B8208: .4byte 0x0203CBC4
	thumb_func_end sub_081B81F8

	thumb_func_start sub_081B820C
sub_081B820C: @ 0x081B820C
	push {r4, lr}
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081B8228
	adds r0, r0, r1
	bl GetBattleEntryEligibility
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B822C
	movs r0, #2
	b _081B8244
	.align 2, 0
_081B8228: .4byte 0x02024190
_081B822C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081B8410
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B8242
	movs r0, #0
	b _081B8244
_081B8242:
	movs r0, #1
_081B8244:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081B820C

	thumb_func_start GetBattleEntryEligibility
GetBattleEntryEligibility: @ 0x081B824C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081B82A8
	adds r0, r5, #0
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	bl sub_081B8528
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bhi _081B82A8
	ldr r0, _081B82AC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _081B82B0
	cmp r1, r0
	bne _081B828A
	adds r0, r5, #0
	movs r1, #0xc
	bl GetMonData
	cmp r0, #0
	bne _081B82A8
_081B828A:
	ldr r0, _081B82B4
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	beq _081B82EA
	cmp r0, #9
	bne _081B82B8
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _081B82EA
_081B82A8:
	movs r0, #0
	b _081B82EC
	.align 2, 0
_081B82AC: .4byte 0x03005AEC
_081B82B0: .4byte 0x0000191A
_081B82B4: .4byte 0x000040CF
_081B82B8:
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r3, _081B82F4
	lsls r1, r6, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	ldr r2, _081B82F8
	cmp r0, r2
	beq _081B82EA
_081B82D2:
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r4
	beq _081B82A8
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r6, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _081B82D2
_081B82EA:
	movs r0, #1
_081B82EC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081B82F4: .4byte 0x085DD48E
_081B82F8: .4byte 0x0000FFFF
	thumb_func_end GetBattleEntryEligibility

	thumb_func_start sub_081B82FC
sub_081B82FC: @ 0x081B82FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl sub_081B84FC
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r1, r2, #0
	ldr r3, _081B8324
	adds r0, r2, r3
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081B833C
	cmp r2, #1
	bne _081B8328
	movs r0, #0xe
	b _081B83F8
	.align 2, 0
_081B8324: .4byte 0x0203CBC4
_081B8328:
	ldr r0, _081B8338
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	movs r0, #0x11
	b _081B83F8
	.align 2, 0
_081B8338: .4byte 0x02021C40
_081B833C:
	ldr r0, _081B8354
	bl VarGet
	lsls r0, r0, #0x18
	movs r1, #0xf8
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _081B8360
	b _081B83F6
	.align 2, 0
_081B8354: .4byte 0x000040CF
_081B8358:
	movs r0, #0x12
	b _081B83F8
_081B835C:
	movs r0, #0x13
	b _081B83F8
_081B8360:
	bl sub_081B84D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	b _081B83F0
_081B836E:
	ldr r3, _081B8408
	adds r4, r3, r5
	ldrb r0, [r4]
	movs r1, #0x64
	muls r0, r1, r0
	subs r0, #0x64
	ldr r3, _081B840C
	adds r0, r3, r0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrb r0, [r4]
	movs r1, #0x64
	muls r0, r1, r0
	subs r0, #0x64
	ldr r3, _081B840C
	adds r0, r3, r0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r1, r5, #1
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	mov sb, r1
	cmp r4, r8
	bhs _081B83E8
	movs r7, #0x64
_081B83AE:
	ldr r0, _081B8408
	adds r5, r0, r4
	ldrb r0, [r5]
	muls r0, r7, r0
	subs r0, #0x64
	ldr r1, _081B840C
	adds r0, r1, r0
	movs r1, #0xb
	bl GetMonData
	cmp sl, r0
	beq _081B8358
	cmp r6, #0
	beq _081B83DE
	ldrb r0, [r5]
	muls r0, r7, r0
	subs r0, #0x64
	ldr r3, _081B840C
	adds r0, r3, r0
	movs r1, #0xc
	bl GetMonData
	cmp r6, r0
	beq _081B835C
_081B83DE:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r8
	blo _081B83AE
_081B83E8:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	mov r0, r8
_081B83F0:
	subs r0, #1
	cmp r5, r0
	blt _081B836E
_081B83F6:
	movs r0, #0xff
_081B83F8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081B8408: .4byte 0x0203CBC4
_081B840C: .4byte 0x02024190
	thumb_func_end sub_081B82FC

	thumb_func_start sub_081B8410
sub_081B8410: @ 0x081B8410
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _081B8428
_081B841A:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _081B842C
	movs r0, #1
	b _081B8438
	.align 2, 0
_081B8428: .4byte 0x0203CBC4
_081B842C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _081B841A
	movs r0, #0
_081B8438:
	pop {r1}
	bx r1
	thumb_func_end sub_081B8410

	thumb_func_start sub_081B843C
sub_081B843C: @ 0x081B843C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_081B82FC
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xff
	beq _081B8474
	movs r0, #0x20
	bl PlaySE
	adds r0, r4, #0
	bl display_pokemon_menu_message
	ldr r0, _081B846C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B8470
	str r0, [r1]
	b _081B8480
	.align 2, 0
_081B846C: .4byte 0x03005B60
_081B8470: .4byte 0x081B8489
_081B8474:
	movs r0, #5
	bl PlaySE
	adds r0, r5, #0
	bl sub_081B0F90
_081B8480:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B843C

	thumb_func_start sub_081B8488
sub_081B8488: @ 0x081B8488
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081B84C4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081B84A2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081B84BC
_081B84A2:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl display_pokemon_menu_message
	ldr r0, _081B84C8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B84CC
	str r0, [r1]
_081B84BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B84C4: .4byte 0x03002360
_081B84C8: .4byte 0x03005B60
_081B84CC: .4byte 0x081B1041
	thumb_func_end sub_081B8488

	thumb_func_start sub_081B84D0
sub_081B84D0: @ 0x081B84D0
	push {lr}
	ldr r0, _081B84E8
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	beq _081B84EC
	cmp r0, #9
	bne _081B84F0
	movs r0, #3
	b _081B84F4
	.align 2, 0
_081B84E8: .4byte 0x000040CF
_081B84EC:
	movs r0, #2
	b _081B84F4
_081B84F0:
	ldr r0, _081B84F8
	ldrb r0, [r0]
_081B84F4:
	pop {r1}
	bx r1
	.align 2, 0
_081B84F8: .4byte 0x02037282
	thumb_func_end sub_081B84D0

	thumb_func_start sub_081B84FC
sub_081B84FC: @ 0x081B84FC
	push {lr}
	ldr r0, _081B8514
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	beq _081B8518
	cmp r0, #9
	bne _081B851C
	movs r0, #1
	b _081B8520
	.align 2, 0
_081B8514: .4byte 0x000040CF
_081B8518:
	movs r0, #2
	b _081B8520
_081B851C:
	ldr r0, _081B8524
	ldrb r0, [r0]
_081B8520:
	pop {r1}
	bx r1
	.align 2, 0
_081B8524: .4byte 0x02037282
	thumb_func_end sub_081B84FC

	thumb_func_start sub_081B8528
sub_081B8528: @ 0x081B8528
	push {lr}
	ldr r0, _081B8540
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	beq _081B8544
	cmp r0, #9
	bne _081B8548
_081B853C:
	movs r0, #0x64
	b _081B8552
	.align 2, 0
_081B8540: .4byte 0x000040CF
_081B8544:
	movs r0, #0x1e
	b _081B8552
_081B8548:
	ldr r0, _081B8558
	ldrh r0, [r0]
	cmp r0, #0
	bne _081B853C
	movs r0, #0x32
_081B8552:
	pop {r1}
	bx r1
	.align 2, 0
_081B8558: .4byte 0x02037280
	thumb_func_end sub_081B8528

	thumb_func_start sub_081B855C
sub_081B855C: @ 0x081B855C
	push {lr}
	ldr r0, _081B8578
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xf8
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _081B8580
	ldr r0, _081B857C
	b _081B859A
	.align 2, 0
_081B8578: .4byte 0x000040CF
_081B857C: .4byte 0x085CA21C
_081B8580:
	cmp r1, #1
	bne _081B8598
	ldr r0, _081B8590
	ldrh r0, [r0]
	cmp r0, #2
	bne _081B8598
	ldr r0, _081B8594
	b _081B859A
	.align 2, 0
_081B8590: .4byte 0x02037282
_081B8594: .4byte 0x085CA229
_081B8598:
	ldr r0, _081B85A0
_081B859A:
	pop {r1}
	bx r1
	.align 2, 0
_081B85A0: .4byte 0x085CA238
	thumb_func_end sub_081B855C

	thumb_func_start sub_081B85A4
sub_081B85A4: @ 0x081B85A4
	push {lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	str r2, [sp]
	ldr r2, _081B85C8
	str r2, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B85C8: .4byte 0x081B1041
	thumb_func_end sub_081B85A4

	thumb_func_start sub_081B85CC
sub_081B85CC: @ 0x081B85CC
	push {lr}
	sub sp, #0xc
	movs r0, #4
	str r0, [sp]
	ldr r0, _081B85F0
	str r0, [sp, #4]
	ldr r0, _081B85F4
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc
	movs r3, #0
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B85F0: .4byte 0x081B1041
_081B85F4: .4byte 0x08085B35
	thumb_func_end sub_081B85CC

	thumb_func_start sub_081B85F8
sub_081B85F8: @ 0x081B85F8
	push {lr}
	sub sp, #0xc
	movs r0, #1
	str r0, [sp]
	ldr r0, _081B861C
	str r0, [sp, #4]
	ldr r0, _081B8620
	str r0, [sp, #8]
	movs r0, #0xb
	movs r1, #0
	movs r2, #0xd
	movs r3, #0
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B861C: .4byte 0x081B1041
_081B8620: .4byte 0x08085B35
	thumb_func_end sub_081B85F8

	thumb_func_start sub_081B8624
sub_081B8624: @ 0x081B8624
	push {lr}
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B8634
	movs r0, #0
	b _081B8646
_081B8634:
	bl IsMultiBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081B8644
	movs r0, #1
	b _081B8646
_081B8644:
	movs r0, #2
_081B8646:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081B8624

	thumb_func_start OpenPartyMenuInBattle
OpenPartyMenuInBattle: @ 0x081B864C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_081B8624
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	str r0, [sp]
	ldr r0, _081B8688
	str r0, [sp, #4]
	ldr r0, _081B868C
	str r0, [sp, #8]
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl InitPartyMenu
	bl nullsub_35
	bl pokemon_change_order
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B8688: .4byte 0x081B1041
_081B868C: .4byte 0x0805995D
	thumb_func_end OpenPartyMenuInBattle

	thumb_func_start sub_081B8690
sub_081B8690: @ 0x081B8690
	push {lr}
	sub sp, #0xc
	bl sub_081B8624
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #5
	str r0, [sp]
	ldr r0, _081B86C4
	str r0, [sp, #4]
	ldr r0, _081B86C8
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #3
	movs r3, #0
	bl InitPartyMenu
	bl nullsub_35
	bl pokemon_change_order
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B86C4: .4byte 0x081B1041
_081B86C8: .4byte 0x081B5EF5
	thumb_func_end sub_081B8690

	thumb_func_start sub_081B86CC
sub_081B86CC: @ 0x081B86CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081B86F4
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B8714
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081B8714
	ldr r0, _081B86F8
	ldrb r0, [r0, #0xb]
	cmp r0, #1
	bne _081B86FC
	movs r0, #3
	b _081B8716
	.align 2, 0
_081B86F4: .4byte 0x020241F4
_081B86F8: .4byte 0x0203CB94
_081B86FC:
	ldr r0, _081B8710
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	bne _081B8714
	movs r0, #2
	b _081B8716
	.align 2, 0
_081B8710: .4byte 0x02022C90
_081B8714:
	movs r0, #7
_081B8716:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081B86CC

	thumb_func_start sub_081B871C
sub_081B871C: @ 0x081B871C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl IsMultiBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B8764
	cmp r5, #1
	beq _081B8742
	cmp r5, #4
	beq _081B8742
	cmp r5, #5
	bne _081B8764
_081B8742:
	ldr r4, _081B8758
	bl GetTrainerPartnerName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r0, _081B875C
	ldr r1, _081B8760
	b _081B88E2
	.align 2, 0
_081B8758: .4byte 0x02021C40
_081B875C: .4byte 0x02021C7C
_081B8760: .4byte 0x085C9B76
_081B8764:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081B8788
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _081B8798
	ldr r1, _081B878C
	adds r0, r4, #0
	bl GetMonNickname
	ldr r0, _081B8790
	ldr r1, _081B8794
	b _081B88E2
	.align 2, 0
_081B8788: .4byte 0x02024190
_081B878C: .4byte 0x02021C40
_081B8790: .4byte 0x02021C7C
_081B8794: .4byte 0x085C9B59
_081B8798:
	movs r4, #0
	b _081B87C4
_081B879C:
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B87BE
	adds r0, r5, #0
	bl sub_081B8BD8
	lsls r0, r0, #0x18
	ldr r2, _081B87EC
	lsls r1, r4, #1
	adds r1, r1, r2
	lsrs r0, r0, #0x18
	ldrh r1, [r1]
	cmp r0, r1
	beq _081B889C
_081B87BE:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081B87C4:
	ldr r0, _081B87F0
	ldrb r0, [r0]
	cmp r4, r0
	blo _081B879C
	movs r7, #0x64
	adds r0, r5, #0
	muls r0, r7, r0
	ldr r1, _081B87F4
	mov r8, r1
	adds r6, r0, r1
	adds r0, r6, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	beq _081B8800
	ldr r0, _081B87F8
	ldr r1, _081B87FC
	b _081B88E2
	.align 2, 0
_081B87EC: .4byte 0x02023D12
_081B87F0: .4byte 0x02023D10
_081B87F4: .4byte 0x02024190
_081B87F8: .4byte 0x02021C7C
_081B87FC: .4byte 0x085C9B9D
_081B8800:
	adds r0, r5, #0
	bl sub_081B8BD8
	ldr r1, _081B8824
	ldr r1, [r1]
	adds r1, #0x8b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _081B8834
	ldr r1, _081B8828
	adds r0, r6, #0
	bl GetMonNickname
	ldr r0, _081B882C
	ldr r1, _081B8830
	b _081B88E2
	.align 2, 0
_081B8824: .4byte 0x02024140
_081B8828: .4byte 0x02021C40
_081B882C: .4byte 0x02021C7C
_081B8830: .4byte 0x085C9B43
_081B8834:
	ldr r0, _081B8844
	ldrb r0, [r0, #0xb]
	cmp r0, #4
	bne _081B8848
	bl SetMonPreventsSwitchingString
	b _081B88E6
	.align 2, 0
_081B8844: .4byte 0x0203CB94
_081B8848:
	cmp r0, #2
	beq _081B88C0
	adds r0, r5, #0
	bl sub_081B8BD8
	ldr r1, _081B888C
	strb r0, [r1]
	ldr r1, _081B8890
	movs r0, #1
	strb r0, [r1]
	ldr r1, _081B8894
	ldr r0, _081B8898
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_081B8C50
	adds r0, r4, #0
	muls r0, r7, r0
	add r0, r8
	adds r1, r6, #0
	bl sub_081B0F58
	movs r0, #1
	b _081B88E8
	.align 2, 0
_081B888C: .4byte 0x0203CBB5
_081B8890: .4byte 0x0203CBB4
_081B8894: .4byte 0x02023D12
_081B8898: .4byte 0x0202415C
_081B889C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081B88B0
	adds r0, r0, r1
	ldr r1, _081B88B4
	bl GetMonNickname
	ldr r0, _081B88B8
	ldr r1, _081B88BC
	b _081B88E2
	.align 2, 0
_081B88B0: .4byte 0x02024190
_081B88B4: .4byte 0x02021C40
_081B88B8: .4byte 0x02021C7C
_081B88BC: .4byte 0x085C9B2D
_081B88C0:
	ldr r0, _081B88F4
	ldrb r0, [r0]
	ldr r1, _081B88F8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r7, r0
	add r0, r8
	ldr r1, _081B88FC
	bl GetMonNickname
	ldr r0, _081B8900
	ldr r1, _081B8904
_081B88E2:
	bl StringExpandPlaceholders
_081B88E6:
	movs r0, #0
_081B88E8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081B88F4: .4byte 0x0202415C
_081B88F8: .4byte 0x02023D12
_081B88FC: .4byte 0x02021C40
_081B8900: .4byte 0x02021C7C
_081B8904: .4byte 0x085C9B1A
	thumb_func_end sub_081B871C

	thumb_func_start sub_081B8908
sub_081B8908: @ 0x081B8908
	push {r4, lr}
	ldr r4, _081B8924
	bl sub_0806D288
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_081B8928
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B8924: .4byte 0x0203CBCC
	thumb_func_end sub_081B8908

	thumb_func_start sub_081B8928
sub_081B8928: @ 0x081B8928
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl IsMultiBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B895E
	cmp r4, #0
	beq _081B8950
	movs r0, #0x30
	strb r0, [r6]
	movs r0, #0x45
	strb r0, [r6, #1]
	movs r0, #0x12
	strb r0, [r6, #2]
	b _081B89F8
_081B8950:
	movs r0, #3
	strb r0, [r6]
	movs r0, #0x12
	strb r0, [r6, #1]
	movs r0, #0x45
	strb r0, [r6, #2]
	b _081B89F8
_081B895E:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B899C
	movs r5, #1
	movs r0, #0
	bl GetBattlerAtPosition
	mov r2, sp
	ldr r1, _081B8998
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, #0
	mov r1, sp
_081B8982:
	ldrb r0, [r1]
	cmp r4, r0
	beq _081B8990
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, #1
_081B8990:
	adds r4, #1
	cmp r4, #5
	ble _081B8982
	b _081B89E0
	.align 2, 0
_081B8998: .4byte 0x02023D12
_081B899C:
	movs r5, #2
	movs r0, #0
	bl GetBattlerAtPosition
	mov r1, sp
	ldr r4, _081B8A00
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r4
	ldrh r0, [r0]
	strb r0, [r1]
	movs r0, #2
	bl GetBattlerAtPosition
	mov r1, sp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r4
	ldrh r0, [r0]
	strb r0, [r1, #1]
	movs r4, #0
_081B89C6:
	ldrb r0, [r1]
	cmp r4, r0
	beq _081B89DA
	ldrb r0, [r1, #1]
	cmp r4, r0
	beq _081B89DA
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, #1
_081B89DA:
	adds r4, #1
	cmp r4, #5
	ble _081B89C6
_081B89E0:
	movs r4, #0
	mov r3, sp
_081B89E4:
	adds r0, r6, r4
	ldrb r1, [r3]
	lsls r1, r1, #4
	ldrb r2, [r3, #1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, #2
	adds r4, #1
	cmp r4, #2
	ble _081B89E4
_081B89F8:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B8A00: .4byte 0x02023D12
	thumb_func_end sub_081B8928

	thumb_func_start sub_081B8A04
sub_081B8A04: @ 0x081B8A04
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _081B8A24
	lsls r3, r2, #1
	adds r3, r3, r2
	adds r3, #0x60
	ldr r0, [r0]
	adds r0, r0, r3
	bl sub_081B8A28
	pop {r0}
	bx r0
	.align 2, 0
_081B8A24: .4byte 0x02024140
	thumb_func_end sub_081B8A04

	thumb_func_start sub_081B8A28
sub_081B8A28: @ 0x081B8A28
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B8A50
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #2
	b _081B8A5C
_081B8A50:
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #3
_081B8A5C:
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl IsMultiBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081B8A90
	cmp r7, #0
	beq _081B8A82
	movs r0, #0x30
	strb r0, [r5]
	movs r0, #0x45
	strb r0, [r5, #1]
	movs r0, #0x12
	strb r0, [r5, #2]
	b _081B8B12
_081B8A82:
	movs r0, #3
	strb r0, [r5]
	movs r0, #0x12
	strb r0, [r5, #1]
	movs r0, #0x45
	strb r0, [r5, #2]
	b _081B8B12
_081B8A90:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081B8AC8
	movs r3, #1
	mov r2, sp
	ldr r1, _081B8AC4
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, #0
	mov r1, sp
_081B8AAC:
	ldrb r0, [r1]
	cmp r4, r0
	beq _081B8ABA
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, #1
_081B8ABA:
	adds r4, #1
	cmp r4, #5
	ble _081B8AAC
	b _081B8AFA
	.align 2, 0
_081B8AC4: .4byte 0x02023D12
_081B8AC8:
	movs r3, #2
	mov r1, sp
	ldr r2, _081B8B1C
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strb r0, [r1, #1]
	movs r4, #0
_081B8AE0:
	ldrb r0, [r1]
	cmp r4, r0
	beq _081B8AF4
	ldrb r0, [r1, #1]
	cmp r4, r0
	beq _081B8AF4
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, #1
_081B8AF4:
	adds r4, #1
	cmp r4, #5
	ble _081B8AE0
_081B8AFA:
	movs r4, #0
	mov r3, sp
_081B8AFE:
	adds r0, r5, r4
	ldrb r1, [r3]
	lsls r1, r1, #4
	ldrb r2, [r3, #1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, #2
	adds r4, #1
	cmp r4, #2
	ble _081B8AFE
_081B8B12:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B8B1C: .4byte 0x02023D12
	thumb_func_end sub_081B8A28

	thumb_func_start sub_081B8B20
sub_081B8B20: @ 0x081B8B20
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r7, #0
	bl IsMultiBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B8BCE
	ldr r0, _081B8B84
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, #0x60
	ldr r0, [r0]
	adds r4, r0, r1
	movs r2, #0
	add r6, sp
	mov ip, r6
	movs r6, #0xf
	mov r3, sp
_081B8B52:
	adds r1, r4, r2
	ldrb r0, [r1]
	lsrs r0, r0, #4
	strb r0, [r3]
	adds r3, #1
	ldrb r1, [r1]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r3]
	adds r3, #1
	adds r2, #1
	cmp r2, #2
	ble _081B8B52
	mov r0, ip
	ldrb r3, [r0]
	movs r2, #0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, r5
	bne _081B8B88
	mov r0, sp
	ldrb r7, [r0]
	strb r3, [r0]
	b _081B8B9C
	.align 2, 0
_081B8B84: .4byte 0x02024140
_081B8B88:
	adds r2, #1
	cmp r2, #5
	bgt _081B8B9C
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, r5
	bne _081B8B88
	adds r7, r0, #0
	strb r3, [r1]
_081B8B9C:
	cmp r2, #6
	beq _081B8BCE
	mov r0, ip
	strb r7, [r0]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #4
	mov r1, sp
	ldrb r1, [r1, #1]
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #4
	mov r1, sp
	ldrb r1, [r1, #3]
	orrs r0, r1
	strb r0, [r4, #1]
	mov r0, sp
	ldrb r0, [r0, #4]
	lsls r0, r0, #4
	mov r1, sp
	ldrb r1, [r1, #5]
	orrs r0, r1
	strb r0, [r4, #2]
_081B8BCE:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B8B20

	thumb_func_start sub_081B8BD8
sub_081B8BD8: @ 0x081B8BD8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #1
	ands r1, r2
	lsrs r2, r0, #0x19
	cmp r1, #0
	beq _081B8BF8
	ldr r0, _081B8BF4
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	b _081B8C00
	.align 2, 0
_081B8BF4: .4byte 0x0203CBCC
_081B8BF8:
	ldr r0, _081B8C08
	adds r0, r2, r0
	ldrb r0, [r0]
	lsrs r1, r0, #4
_081B8C00:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_081B8C08: .4byte 0x0203CBCC
	thumb_func_end sub_081B8BD8

	thumb_func_start sub_081B8C0C
sub_081B8C0C: @ 0x081B8C0C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r1, #1
	ands r1, r3
	lsrs r3, r0, #0x19
	cmp r1, #0
	beq _081B8C34
	ldr r0, _081B8C30
	adds r0, r3, r0
	ldrb r2, [r0]
	movs r1, #0xf0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	b _081B8C44
	.align 2, 0
_081B8C30: .4byte 0x0203CBCC
_081B8C34:
	ldr r2, _081B8C4C
	adds r2, r3, r2
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	lsls r1, r4, #4
	orrs r0, r1
	strb r0, [r2]
_081B8C44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B8C4C: .4byte 0x0203CBCC
	thumb_func_end sub_081B8C0C

	thumb_func_start sub_081B8C50
sub_081B8C50: @ 0x081B8C50
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r0, r5, #0
	bl sub_081B8BD8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	bl sub_081B8BD8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_081B8C0C
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_081B8C0C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081B8C50

	thumb_func_start pokemon_order_func
pokemon_order_func: @ 0x081B8C8C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	movs r2, #0
	ldr r5, _081B8CB4
_081B8C98:
	adds r0, r3, r5
	ldrb r1, [r0]
	lsrs r0, r1, #4
	cmp r0, r4
	beq _081B8CB0
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xf
	ands r0, r1
	cmp r0, r4
	bne _081B8CB8
_081B8CB0:
	adds r0, r2, #0
	b _081B8CCA
	.align 2, 0
_081B8CB4: .4byte 0x0203CBCC
_081B8CB8:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _081B8C98
	movs r0, #0
_081B8CCA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end pokemon_order_func

	thumb_func_start pokemon_change_order
pokemon_change_order: @ 0x081B8CD0
	push {r4, r5, r6, lr}
	movs r4, #0x96
	lsls r4, r4, #2
	adds r0, r4, #0
	bl Alloc
	adds r5, r0, #0
	ldr r1, _081B8D1C
	adds r2, r4, #0
	bl memcpy
	movs r4, #0
	movs r6, #0x64
_081B8CEA:
	adds r0, r4, #0
	bl pokemon_order_func
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	ldr r1, _081B8D1C
	adds r0, r0, r1
	adds r1, r4, #0
	muls r1, r6, r1
	adds r1, r1, r5
	movs r2, #0x64
	bl memcpy
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _081B8CEA
	adds r0, r5, #0
	bl Free
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B8D1C: .4byte 0x02024190
	thumb_func_end pokemon_change_order

	thumb_func_start sub_081B8D20
sub_081B8D20: @ 0x081B8D20
	push {r4, r5, r6, lr}
	movs r4, #0x96
	lsls r4, r4, #2
	adds r0, r4, #0
	bl Alloc
	adds r5, r0, #0
	ldr r1, _081B8D6C
	adds r2, r4, #0
	bl memcpy
	movs r4, #0
	movs r6, #0x64
_081B8D3A:
	adds r0, r4, #0
	bl sub_081B8BD8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	ldr r1, _081B8D6C
	adds r0, r0, r1
	adds r1, r4, #0
	muls r1, r6, r1
	adds r1, r1, r5
	movs r2, #0x64
	bl memcpy
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _081B8D3A
	adds r0, r5, #0
	bl Free
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B8D6C: .4byte 0x02024190
	thumb_func_end sub_081B8D20

	thumb_func_start sub_081B8D70
sub_081B8D70: @ 0x081B8D70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #1
	movs r7, #0x64
	ldr r0, _081B8DC8
	mov r8, r0
_081B8D7E:
	adds r0, r6, #0
	bl sub_081B8BD8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r7, r0
	mov r1, r8
	adds r5, r0, r1
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081B8DCC
	adds r0, r5, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	beq _081B8DCC
	movs r0, #0
	bl sub_081B8BD8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	adds r1, r6, #0
	bl sub_081B8C50
	adds r0, r4, #0
	muls r0, r7, r0
	add r0, r8
	adds r1, r5, #0
	bl sub_081B0F58
	b _081B8DD6
	.align 2, 0
_081B8DC8: .4byte 0x02024190
_081B8DCC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _081B8D7E
_081B8DD6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081B8D70

	thumb_func_start sub_081B8DE0
sub_081B8DE0: @ 0x081B8DE0
	push {lr}
	ldr r0, _081B8DEC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081B8DEC: .4byte 0x0805995D
	thumb_func_end sub_081B8DE0

	thumb_func_start sub_081B8DF0
sub_081B8DF0: @ 0x081B8DF0
	push {lr}
	sub sp, #0xc
	movs r0, #0x7f
	str r0, [sp]
	ldr r0, _081B8E14
	str r0, [sp, #4]
	ldr r0, _081B8E18
	ldr r0, [r0, #8]
	str r0, [sp, #8]
	movs r0, #5
	movs r1, #3
	movs r2, #0
	movs r3, #0
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B8E14: .4byte 0x081B8E1D
_081B8E18: .4byte 0x03002360
	thumb_func_end sub_081B8DF0

	thumb_func_start sub_081B8E1C
sub_081B8E1C: @ 0x081B8E1C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081B8E4C
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r4, #8]
	bl sub_081B8F34
	movs r1, #0x80
	lsls r1, r1, #9
	movs r0, #2
	movs r2, #0
	bl ChangeBgX
	ldr r0, _081B8E50
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B8E4C: .4byte 0x03005B60
_081B8E50: .4byte 0x081B8E55
	thumb_func_end sub_081B8E1C

	thumb_func_start sub_081B8E54
sub_081B8E54: @ 0x081B8E54
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r6, r5, #2
	adds r0, r6, r5
	lsls r0, r0, #3
	ldr r1, _081B8EC8
	adds r4, r0, r1
	ldr r0, _081B8ECC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081B8EC0
	ldrh r0, [r4]
	subs r0, #8
	strh r0, [r4]
	adds r0, r5, #0
	bl sub_081B8F34
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081B8EC0
	movs r4, #3
	ldr r7, _081B8ED0
_081B8E88:
	subs r0, r4, #3
	lsls r0, r0, #5
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, #0
	beq _081B8EA4
	ldr r0, _081B8ED4
	ldr r1, [r0]
	lsls r0, r4, #4
	adds r0, r0, r1
	ldrb r0, [r0, #9]
	movs r1, #0
	bl AnimateSelectedPartyIcon
_081B8EA4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _081B8E88
	movs r0, #0x78
	bl PlaySE
	ldr r0, _081B8ED8
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081B8EDC
	str r0, [r1]
_081B8EC0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B8EC8: .4byte 0x03005B68
_081B8ECC: .4byte 0x02037C74
_081B8ED0: .4byte 0x02022C9C
_081B8ED4: .4byte 0x0203CBA8
_081B8ED8: .4byte 0x03005B60
_081B8EDC: .4byte 0x081B8EE1
	thumb_func_end sub_081B8E54

	thumb_func_start sub_081B8EE0
sub_081B8EE0: @ 0x081B8EE0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081B8F0C
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	cmp r1, r0
	bne _081B8F06
	adds r0, r2, #0
	bl sub_081B0F90
_081B8F06:
	pop {r0}
	bx r0
	.align 2, 0
_081B8F0C: .4byte 0x03005B68
	thumb_func_end sub_081B8EE0

	thumb_func_start sub_081B8F10
sub_081B8F10: @ 0x081B8F10
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	cmp r1, #0
	blt _081B8F2A
	ldr r1, _081B8F30
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r3, [r0, #0x24]
_081B8F2A:
	pop {r0}
	bx r0
	.align 2, 0
_081B8F30: .4byte 0x020205AC
	thumb_func_end sub_081B8F10

	thumb_func_start sub_081B8F34
sub_081B8F34: @ 0x081B8F34
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081B8FBC
	adds r5, r1, r0
	movs r6, #3
	ldr r7, _081B8FC0
_081B8F48:
	ldr r0, _081B8FC4
	subs r1, r6, #3
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _081B8FA0
	ldr r0, [r7]
	lsls r4, r6, #4
	adds r0, r4, r0
	ldrb r0, [r0, #9]
	ldrh r1, [r5]
	subs r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_081B8F10
	ldr r0, [r7]
	adds r0, r4, r0
	ldrb r0, [r0, #0xa]
	ldrh r1, [r5]
	subs r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_081B8F10
	ldr r0, [r7]
	adds r0, r4, r0
	ldrb r0, [r0, #0xb]
	ldrh r1, [r5]
	subs r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_081B8F10
	ldr r0, [r7]
	adds r4, r4, r0
	ldrb r0, [r4, #0xc]
	ldrh r1, [r5]
	subs r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_081B8F10
_081B8FA0:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _081B8F48
	movs r1, #0x80
	lsls r1, r1, #4
	movs r0, #2
	movs r2, #1
	bl ChangeBgX
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B8FBC: .4byte 0x03005B68
_081B8FC0: .4byte 0x0203CBA8
_081B8FC4: .4byte 0x02022C9C
	thumb_func_end sub_081B8F34

	thumb_func_start sub_081B8FC8
sub_081B8FC8: @ 0x081B8FC8
	push {lr}
	sub sp, #0xc
	movs r0, #0xf
	str r0, [sp]
	ldr r0, _081B8FEC
	str r0, [sp, #4]
	ldr r0, _081B8FF0
	str r0, [sp, #8]
	movs r0, #6
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B8FEC: .4byte 0x081B1041
_081B8FF0: .4byte 0x081B9031
	thumb_func_end sub_081B8FC8

	thumb_func_start sub_081B8FF4
sub_081B8FF4: @ 0x081B8FF4
	push {lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081B9020
	ldr r1, _081B9024
	str r1, [r2]
	movs r1, #0
	str r1, [sp]
	ldr r1, _081B9028
	str r1, [sp, #4]
	ldr r1, _081B902C
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0xb
	movs r3, #0
	bl InitPartyMenu
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_081B9020: .4byte 0x03005B10
_081B9024: .4byte 0x081B9069
_081B9028: .4byte 0x081B1041
_081B902C: .4byte 0x08085A31
	thumb_func_end sub_081B8FF4

	thumb_func_start sub_081B9030
sub_081B9030: @ 0x081B9030
	push {r4, lr}
	ldr r4, _081B9058
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	cmp r0, #5
	bls _081B9046
	movs r0, #0xff
	strh r0, [r4]
_081B9046:
	ldr r0, _081B905C
	ldr r1, _081B9060
	str r1, [r0]
	ldr r0, _081B9064
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081B9058: .4byte 0x02037280
_081B905C: .4byte 0x03005B10
_081B9060: .4byte 0x081B9069
_081B9064: .4byte 0x08085A31
	thumb_func_end sub_081B9030

	thumb_func_start hm_add_c3_without_phase_2
hm_add_c3_without_phase_2: @ 0x081B9068
	push {lr}
	bl pal_fill_black
	ldr r0, _081B907C
	movs r1, #0xa
	bl CreateTask
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_081B907C: .4byte 0x081B9081
	thumb_func_end hm_add_c3_without_phase_2

	thumb_func_start task_hm_without_phase_2
task_hm_without_phase_2: @ 0x081B9080
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081B909E
	adds r0, r4, #0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_081B909E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task_hm_without_phase_2

	thumb_func_start sub_081B90A4
sub_081B90A4: @ 0x081B90A4
	push {lr}
	bl ScriptContext2_Enable
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _081B90C0
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081B90C0: .4byte 0x081B90C5
	thumb_func_end sub_081B90A4

	thumb_func_start sub_081B90C4
sub_081B90C4: @ 0x081B90C4
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081B9104
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081B90FC
	bl CleanupOverworldWindowsAndTilemaps
	str r4, [sp]
	ldr r0, _081B9108
	str r0, [sp, #4]
	ldr r0, _081B910C
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #0
	movs r2, #0xb
	movs r3, #0
	bl InitPartyMenu
	adds r0, r5, #0
	bl DestroyTask
_081B90FC:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B9104: .4byte 0x02037C74
_081B9108: .4byte 0x081B1041
_081B910C: .4byte 0x081B9111
	thumb_func_end sub_081B90C4

	thumb_func_start sub_081B9110
sub_081B9110: @ 0x081B9110
	push {lr}
	bl GetCursorSelectionMonId
	ldr r2, _081B913C
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _081B9126
	movs r0, #0xff
	strb r0, [r2]
_081B9126:
	ldr r1, _081B9140
	ldrb r0, [r2]
	strh r0, [r1]
	ldr r1, _081B9144
	ldr r0, _081B9148
	str r0, [r1]
	ldr r0, _081B914C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081B913C: .4byte 0x02039BC4
_081B9140: .4byte 0x02037280
_081B9144: .4byte 0x03005B10
_081B9148: .4byte 0x081B9069
_081B914C: .4byte 0x08085A31
	thumb_func_end sub_081B9110

	thumb_func_start sub_081B9150
sub_081B9150: @ 0x081B9150
	push {lr}
	bl ScriptContext2_Enable
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _081B916C
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081B916C: .4byte 0x081B9171
	thumb_func_end sub_081B9150

	thumb_func_start sub_081B9170
sub_081B9170: @ 0x081B9170
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081B91B0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081B91A8
	bl CleanupOverworldWindowsAndTilemaps
	str r4, [sp]
	ldr r0, _081B91B4
	str r0, [sp, #4]
	ldr r0, _081B91B8
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #0xb
	movs r3, #0
	bl InitPartyMenu
	adds r0, r5, #0
	bl DestroyTask
_081B91A8:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B91B0: .4byte 0x02037C74
_081B91B4: .4byte 0x081B1041
_081B91B8: .4byte 0x081B9031
	thumb_func_end sub_081B9170

	thumb_func_start sub_081B91BC
sub_081B91BC: @ 0x081B91BC
	push {lr}
	bl ScriptContext2_Enable
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _081B91D8
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081B91D8: .4byte 0x081B91DD
	thumb_func_end sub_081B91BC

	thumb_func_start sub_081B91DC
sub_081B91DC: @ 0x081B91DC
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081B921C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081B9214
	bl CleanupOverworldWindowsAndTilemaps
	str r4, [sp]
	ldr r0, _081B9220
	str r0, [sp, #4]
	ldr r0, _081B9224
	str r0, [sp, #8]
	movs r0, #7
	movs r1, #0
	movs r2, #0xb
	movs r3, #0
	bl InitPartyMenu
	adds r0, r5, #0
	bl DestroyTask
_081B9214:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B921C: .4byte 0x02037C74
_081B9220: .4byte 0x081B1041
_081B9224: .4byte 0x081B9229
	thumb_func_end sub_081B91DC

	thumb_func_start sub_081B9228
sub_081B9228: @ 0x081B9228
	push {r4, r5, lr}
	ldr r5, _081B9240
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	cmp r0, #5
	bls _081B9244
	movs r0, #0xff
	strh r0, [r5]
	b _081B925A
	.align 2, 0
_081B9240: .4byte 0x02037280
_081B9244:
	ldr r4, _081B926C
	ldrh r1, [r5]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B9270
	adds r0, r0, r1
	bl GetNumberOfRelearnableMoves
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
_081B925A:
	ldr r0, _081B9274
	ldr r1, _081B9278
	str r1, [r0]
	ldr r0, _081B927C
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B926C: .4byte 0x02037282
_081B9270: .4byte 0x02024190
_081B9274: .4byte 0x03005B10
_081B9278: .4byte 0x081B9069
_081B927C: .4byte 0x08085A31
	thumb_func_end sub_081B9228

	thumb_func_start sub_081B9280
sub_081B9280: @ 0x081B9280
	push {r4, r5, lr}
	ldr r1, _081B9290
	movs r0, #0
	strh r0, [r1]
	movs r4, #0
	adds r5, r1, #0
	b _081B929A
	.align 2, 0
_081B9290: .4byte 0x02037290
_081B9294:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_081B929A:
	cmp r4, #2
	bhi _081B92B4
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _081B92BC
	adds r0, r0, r1
	movs r1, #0xc
	bl GetMonData
	cmp r0, #0
	beq _081B9294
	movs r0, #1
	strh r0, [r5]
_081B92B4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B92BC: .4byte 0x02024190
	thumb_func_end sub_081B9280

	thumb_func_start sub_081B92C0
sub_081B92C0: @ 0x081B92C0
	push {lr}
	bl ScriptContext2_Enable
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _081B92DC
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081B92DC: .4byte 0x081B92E1
	thumb_func_end sub_081B92C0

	thumb_func_start sub_081B92E0
sub_081B92E0: @ 0x081B92E0
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081B9320
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081B9318
	bl CleanupOverworldWindowsAndTilemaps
	str r4, [sp]
	ldr r0, _081B9324
	str r0, [sp, #4]
	ldr r0, _081B9328
	str r0, [sp, #8]
	movs r0, #0xc
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl InitPartyMenu
	adds r0, r5, #0
	bl DestroyTask
_081B9318:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B9320: .4byte 0x02037C74
_081B9324: .4byte 0x081B1041
_081B9328: .4byte 0x081B9031
	thumb_func_end sub_081B92E0

	thumb_func_start sub_081B932C
sub_081B932C: @ 0x081B932C
	push {lr}
	sub sp, #4
	ldr r1, _081B9358
	ldr r0, _081B935C
	ldrb r2, [r0]
	ldr r0, _081B9360
	ldrb r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _081B9364
	str r0, [sp]
	movs r0, #3
	bl ShowPokemonSummaryScreen
	ldr r1, _081B9368
	ldr r0, _081B936C
	str r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_081B9358: .4byte 0x02024190
_081B935C: .4byte 0x02037280
_081B9360: .4byte 0x0202418D
_081B9364: .4byte 0x08085A31
_081B9368: .4byte 0x03005B0C
_081B936C: .4byte 0x080AEA65
	thumb_func_end sub_081B932C

	thumb_func_start sub_081B9370
sub_081B9370: @ 0x081B9370
	push {r4, r5, lr}
	ldr r1, _081B93AC
	movs r0, #0
	strh r0, [r1]
	movs r4, #0
	adds r5, r1, #0
_081B937C:
	ldr r0, _081B93B0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B93B4
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0xd
	bl GetMonData
	cmp r0, #0
	beq _081B939A
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_081B939A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _081B937C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B93AC: .4byte 0x02037290
_081B93B0: .4byte 0x02037280
_081B93B4: .4byte 0x02024190
	thumb_func_end sub_081B9370

	thumb_func_start sub_081B93B8
sub_081B93B8: @ 0x081B93B8
	push {r4, r5, lr}
	ldr r0, _081B93F8
	ldrh r1, [r0]
	movs r0, #0x64
	adds r5, r1, #0
	muls r5, r0, r5
	ldr r0, _081B93FC
	adds r5, r5, r0
	ldr r0, _081B9400
	ldrh r1, [r0]
	adds r1, #0xd
	adds r0, r5, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _081B9404
	adds r0, r5, #0
	bl GetMonNickname
	ldr r0, _081B9408
	lsls r4, r4, #3
	ldr r1, _081B940C
	adds r4, r4, r1
	adds r1, r4, #0
	bl StringCopy
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081B93F8: .4byte 0x02037280
_081B93FC: .4byte 0x02024190
_081B9400: .4byte 0x02037282
_081B9404: .4byte 0x02021C40
_081B9408: .4byte 0x02021C54
_081B940C: .4byte 0x082EACC4
	thumb_func_end sub_081B93B8

	thumb_func_start sub_081B9410
sub_081B9410: @ 0x081B9410
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _081B9470
	mov r8, r0
	ldrh r0, [r0]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _081B9474
	adds r0, r0, r5
	ldr r4, _081B9478
	ldrb r2, [r4]
	movs r1, #0
	bl SetMonMoveSlot
	mov r1, r8
	ldrh r0, [r1]
	muls r0, r6, r0
	adds r0, r0, r5
	ldrb r1, [r4]
	bl RemoveMonPPBonus
	ldrh r4, [r4]
	cmp r4, #2
	bhi _081B9464
_081B9442:
	ldr r0, _081B9470
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B9474
	adds r0, r0, r1
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r4, #1
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	bl sub_081B947C
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #2
	bls _081B9442
_081B9464:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081B9470: .4byte 0x02037280
_081B9474: .4byte 0x02024190
_081B9478: .4byte 0x02037282
	thumb_func_end sub_081B9410

	thumb_func_start sub_081B947C
sub_081B947C: @ 0x081B947C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r0, #0xd
	str r0, [sp, #8]
	mov r0, r8
	ldr r1, [sp, #8]
	bl GetMonData
	mov r1, sp
	adds r1, #2
	str r1, [sp, #0x14]
	strh r0, [r1]
	adds r3, r4, #0
	adds r3, #0xd
	str r3, [sp, #0xc]
	mov r0, r8
	adds r1, r3, #0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r7, r5, #0
	adds r7, #0x11
	str r7, [sp, #0x10]
	mov r0, r8
	adds r1, r7, #0
	bl GetMonData
	mov r1, sp
	adds r1, #5
	str r1, [sp, #0x18]
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x11
	str r3, [sp, #0x1c]
	mov r0, r8
	adds r1, r3, #0
	bl GetMonData
	add r7, sp, #4
	mov sl, r7
	strb r0, [r7]
	mov r0, r8
	movs r1, #0x15
	bl GetMonData
	mov r6, sp
	adds r6, #6
	strb r0, [r6]
	ldr r1, _081B9578
	adds r0, r5, r1
	ldrb r0, [r0]
	mov sb, r0
	ldrb r0, [r6]
	adds r2, r0, #0
	mov r3, sb
	ands r2, r3
	lsls r5, r5, #1
	asrs r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r1, r4, r1
	ldrb r3, [r1]
	adds r1, r0, #0
	ands r1, r3
	lsls r4, r4, #1
	asrs r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r7, sb
	bics r0, r7
	strb r0, [r6]
	ldrb r0, [r6]
	bics r0, r3
	strb r0, [r6]
	lsls r2, r4
	lsls r1, r5
	adds r2, r2, r1
	ldrb r0, [r6]
	orrs r0, r2
	strb r0, [r6]
	mov r0, r8
	ldr r1, [sp, #8]
	mov r2, sp
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x14]
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, #0x10]
	mov r2, sl
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	bl SetMonData
	mov r0, r8
	movs r1, #0x15
	adds r2, r6, #0
	bl SetMonData
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B9578: .4byte 0x082FA6AA
	thumb_func_end sub_081B947C

	thumb_func_start sub_081B957C
sub_081B957C: @ 0x081B957C
	push {lr}
	ldr r0, _081B95A0
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B95A4
	adds r0, r0, r1
	movs r1, #0x2d
	bl GetMonData
	adds r1, r0, #0
	cmp r1, #0
	beq _081B95AC
	ldr r1, _081B95A8
	movs r0, #1
	strh r0, [r1]
	b _081B95B0
	.align 2, 0
_081B95A0: .4byte 0x02037280
_081B95A4: .4byte 0x02024190
_081B95A8: .4byte 0x02037290
_081B95AC:
	ldr r0, _081B95B4
	strh r1, [r0]
_081B95B0:
	pop {r0}
	bx r0
	.align 2, 0
_081B95B4: .4byte 0x02037290
	thumb_func_end sub_081B957C

	thumb_func_start sub_081B95B8
sub_081B95B8: @ 0x081B95B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _081B95E8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _081B95EC
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081B95F0
	adds r0, r0, r1
	ldr r1, _081B95F4
	ldrh r1, [r1]
	adds r1, #0xd
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0x39
	bne _081B963C
	movs r6, #0
	b _081B9620
	.align 2, 0
_081B95E8: .4byte 0x02037290
_081B95EC: .4byte 0x02037280
_081B95F0: .4byte 0x02024190
_081B95F4: .4byte 0x02037282
_081B95F8:
	ldr r0, _081B9648
	ldrh r0, [r0]
	cmp r6, r0
	beq _081B961E
	movs r4, #0
	movs r0, #0x64
	adds r5, r6, #0
	muls r5, r0, r5
	ldr r7, _081B964C
_081B960A:
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r5, r7
	bl GetMonData
	cmp r0, #0x39
	beq _081B963C
	adds r4, #1
	cmp r4, #3
	bls _081B960A
_081B961E:
	adds r6, #1
_081B9620:
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	blo _081B95F8
	mov r0, r8
	bl AnyStorageMonWithMove
	cmp r0, #1
	beq _081B963C
	ldr r1, _081B9650
	movs r0, #1
	strh r0, [r1]
_081B963C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081B9648: .4byte 0x02037280
_081B964C: .4byte 0x02024190
_081B9650: .4byte 0x02037290
	thumb_func_end sub_081B95B8

