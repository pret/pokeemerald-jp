.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitPokenavMainMenu
InitPokenavMainMenu: @ 0x081C6E84
	push {r4, lr}
	ldr r1, _081C6EAC
	movs r0, #0
	bl AllocSubstruct
	adds r4, r0, #0
	cmp r4, #0
	beq _081C6EB4
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _081C6EB0
	movs r1, #1
	bl CreateLoopedTask
	str r0, [r4, #0xc]
	movs r0, #1
	b _081C6EB6
	.align 2, 0
_081C6EAC: .4byte 0x0000082C
_081C6EB0: .4byte 0x081C6F25
_081C6EB4:
	movs r0, #0
_081C6EB6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end InitPokenavMainMenu

	thumb_func_start PokenavMainMenuLoopedTaskIsActive
PokenavMainMenuLoopedTaskIsActive: @ 0x081C6EBC
	push {lr}
	movs r0, #0
	bl GetSubstructPtr
	ldr r0, [r0, #0xc]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PokenavMainMenuLoopedTaskIsActive

	thumb_func_start ShutdownPokenav
ShutdownPokenav: @ 0x081C6ED0
	push {lr}
	sub sp, #4
	movs r0, #0x6f
	bl PlaySE
	bl sub_081CA288
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ShutdownPokenav

	thumb_func_start WaitForPokenavShutdownFade
WaitForPokenavShutdownFade: @ 0x081C6EF8
	push {lr}
	ldr r0, _081C6F0C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _081C6F10
	movs r0, #1
	b _081C6F1E
	.align 2, 0
_081C6F0C: .4byte 0x02037C74
_081C6F10:
	bl sub_081C9180
	bl CleanupPokenavMainMenuResources
	bl FreeAllWindowBuffers
	movs r0, #0
_081C6F1E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WaitForPokenavShutdownFade

	thumb_func_start LoopedTask_InitPokenavMenu
LoopedTask_InitPokenavMenu: @ 0x081C6F24
	push {r4, lr}
	sub sp, #4
	cmp r0, #1
	beq _081C6F70
	cmp r0, #1
	bgt _081C6F36
	cmp r0, #0
	beq _081C6F40
	b _081C6FEA
_081C6F36:
	cmp r0, #2
	beq _081C6FBC
	cmp r0, #3
	beq _081C6FCE
	b _081C6FEA
_081C6F40:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	bl FreeAllWindowBuffers
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081C6F6C
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	bl ResetBgPositions
	bl reset_temp_tile_data_buffers
	movs r0, #1
	b _081C6FEC
	.align 2, 0
_081C6F6C: .4byte 0x085F13C8
_081C6F70:
	movs r0, #0
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r1, _081C6FB0
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	adds r4, #0x2c
	movs r0, #0
	adds r1, r4, #0
	bl SetBgTilemapBuffer
	ldr r1, _081C6FB4
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r0, _081C6FB8
	movs r1, #0
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	b _081C6FEC
	.align 2, 0
_081C6FB0: .4byte 0x085EFA00
_081C6FB4: .4byte 0x085EFC2C
_081C6FB8: .4byte 0x085EF9E0
_081C6FBC:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081C6FD8
	bl sub_081C7334
	movs r0, #0
	b _081C6FEC
_081C6FCE:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081C6FDC
_081C6FD8:
	movs r0, #2
	b _081C6FEC
_081C6FDC:
	bl InitPokenavMainMenuResources
	bl InitHoennMapHeaderSprites
	movs r0, #0
	bl ShowBg
_081C6FEA:
	movs r0, #4
_081C6FEC:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LoopedTask_InitPokenavMenu

	thumb_func_start sub_081C6FF4
sub_081C6FF4: @ 0x081C6FF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	bl GetSubstructPtr
	str r4, [r0]
	str r5, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C6FF4

	thumb_func_start sub_081C7010
sub_081C7010: @ 0x081C7010
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetSubstructPtr
	movs r1, #0
	str r1, [r0, #8]
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081C7010

	thumb_func_start sub_081C702C
sub_081C702C: @ 0x081C702C
	push {lr}
	movs r0, #0
	bl GetSubstructPtr
	ldr r0, [r0, #4]
	bl _call_via_r0
	pop {r1}
	thumb_func_end sub_081C702C

	thumb_func_start IsPaletteFadeActive
IsPaletteFadeActive: @ 0x081C703C
	bx r1
	.align 2, 0
	thumb_func_end IsPaletteFadeActive

	thumb_func_start sub_081C7040
sub_081C7040: @ 0x081C7040
	push {r4, lr}
	movs r0, #0
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C705C
	movs r1, #4
	bl CreateLoopedTask
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C705C: .4byte 0x081C7095
	thumb_func_end sub_081C7040

	thumb_func_start sub_081C7060
sub_081C7060: @ 0x081C7060
	push {r4, lr}
	movs r0, #0
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C707C
	movs r1, #4
	bl CreateLoopedTask
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C707C: .4byte 0x081C70DD
	thumb_func_end sub_081C7060

	thumb_func_start MainMenuLoopedTaskIsBusy
MainMenuLoopedTaskIsBusy: @ 0x081C7080
	push {lr}
	movs r0, #0
	bl GetSubstructPtr
	ldr r0, [r0, #0xc]
	bl IsLoopedTaskActive
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MainMenuLoopedTaskIsBusy

	thumb_func_start LoopedTask_ScrollMenuHeaderDown
LoopedTask_ScrollMenuHeaderDown: @ 0x081C7094
	push {lr}
	cmp r0, #1
	beq _081C70AA
	cmp r0, #1
	bgt _081C70A4
	cmp r0, #0
	beq _081C70AA
	b _081C70D4
_081C70A4:
	cmp r0, #2
	beq _081C70AE
	b _081C70D4
_081C70AA:
	movs r0, #0
	b _081C70D6
_081C70AE:
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r0, #0
	movs r2, #1
	bl ChangeBgY
	ldr r1, _081C70C4
	cmp r0, r1
	bhi _081C70C8
	movs r0, #2
	b _081C70D6
	.align 2, 0
_081C70C4: .4byte 0x00001FFF
_081C70C8:
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	movs r2, #0
	bl ChangeBgY
_081C70D4:
	movs r0, #4
_081C70D6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LoopedTask_ScrollMenuHeaderDown

	thumb_func_start LoopedTask_ScrollMenuHeaderUp
LoopedTask_ScrollMenuHeaderUp: @ 0x081C70DC
	push {lr}
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r0, #0
	movs r2, #2
	bl ChangeBgY
	cmp r0, #0
	ble _081C70F2
	movs r0, #2
	b _081C70FE
_081C70F2:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #4
_081C70FE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LoopedTask_ScrollMenuHeaderUp

	thumb_func_start CopyPaletteIntoBufferUnfaded
CopyPaletteIntoBufferUnfaded: @ 0x081C7104
	push {lr}
	lsls r1, r1, #1
	ldr r3, _081C7118
	adds r1, r1, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_081C7118: .4byte 0x020373B4
	thumb_func_end CopyPaletteIntoBufferUnfaded

	thumb_func_start Pokenav_AllocAndLoadPalettes
Pokenav_AllocAndLoadPalettes: @ 0x081C711C
	push {r4, lr}
	adds r4, r0, #0
	b _081C7134
_081C7122:
	lsls r0, r1, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	ldr r0, [r4]
	movs r2, #0x20
	bl CopyPaletteIntoBufferUnfaded
	adds r4, #8
_081C7134:
	ldr r0, [r4]
	cmp r0, #0
	beq _081C7148
	ldrh r0, [r4, #4]
	bl AllocSpritePalette
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	bne _081C7122
_081C7148:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Pokenav_AllocAndLoadPalettes

	thumb_func_start sub_081C7150
sub_081C7150: @ 0x081C7150
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sp
	strh r1, [r0]
	lsls r3, r3, #5
	ldr r0, _081C7174
	adds r3, r3, r0
	ldr r2, _081C7178
	mov r0, sp
	adds r1, r3, #0
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_081C7174: .4byte 0x020379B4
_081C7178: .4byte 0x01000010
	thumb_func_end sub_081C7150

	thumb_func_start sub_081C717C
sub_081C717C: @ 0x081C717C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov sl, r2
	str r3, [sp, #8]
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _081C71A4
	ldr r2, _081C71A0
	mov r1, sl
	ands r2, r1
	ldr r0, [sp]
	b _081C71B4
	.align 2, 0
_081C71A0: .4byte 0x001FFFFF
_081C71A4:
	ldr r2, [sp, #0x2c]
	ldr r0, [sp, #8]
	cmp r2, r0
	blt _081C71C0
	ldr r2, _081C71BC
	mov r1, sl
	ands r2, r1
	ldr r0, [sp, #4]
_081C71B4:
	ldr r1, [sp, #0x30]
	bl CpuSet
	b _081C726E
	.align 2, 0
_081C71BC: .4byte 0x001FFFFF
_081C71C0:
	movs r2, #1
	rsbs r2, r2, #0
	add sl, r2
	b _081C7266
_081C71C8:
	ldr r1, [sp]
	ldrh r0, [r1]
	movs r2, #0x1f
	mov sb, r2
	mov r1, sb
	ands r1, r0
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x15
	movs r1, #0x1f
	ands r1, r2
	mov r8, r1
	lsrs r7, r0, #0x1a
	movs r2, #0x1f
	ands r7, r2
	ldr r0, [sp, #4]
	ldrh r4, [r0]
	movs r0, #0x1f
	ands r0, r4
	mov r1, sb
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [sp, #8]
	bl __divsi3
	ldr r2, [sp, #0x2c]
	adds r6, r0, #0
	muls r6, r2, r6
	asrs r6, r6, #8
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x15
	movs r1, #0x1f
	ands r0, r1
	mov r2, r8
	subs r0, r0, r2
	lsls r0, r0, #8
	ldr r1, [sp, #8]
	bl __divsi3
	ldr r1, [sp, #0x2c]
	adds r5, r0, #0
	muls r5, r1, r5
	asrs r5, r5, #8
	lsrs r4, r4, #0x1a
	movs r2, #0x1f
	ands r4, r2
	subs r4, r4, r7
	lsls r4, r4, #8
	adds r0, r4, #0
	ldr r1, [sp, #8]
	bl __divsi3
	ldr r1, [sp, #0x2c]
	muls r0, r1, r0
	asrs r0, r0, #8
	add r6, sb
	movs r2, #0x1f
	ands r6, r2
	add r5, r8
	ands r5, r2
	adds r0, r7, r0
	ands r0, r2
	lsls r0, r0, #0xa
	lsls r5, r5, #5
	orrs r0, r5
	orrs r0, r6
	ldr r1, [sp, #0x30]
	strh r0, [r1]
	ldr r2, [sp]
	adds r2, #2
	str r2, [sp]
	ldr r0, [sp, #4]
	adds r0, #2
	str r0, [sp, #4]
	adds r1, #2
	str r1, [sp, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	add sl, r1
_081C7266:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sl, r0
	bne _081C71C8
_081C726E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C717C

	thumb_func_start sub_081C7280
sub_081C7280: @ 0x081C7280
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl GetSubstructPtr
	cmp r4, #1
	beq _081C72B0
	cmp r4, #1
	bgt _081C729A
	cmp r4, #0
	beq _081C72A4
	b _081C72EC
_081C729A:
	cmp r4, #2
	beq _081C72C4
	cmp r4, #3
	beq _081C72D8
	b _081C72EC
_081C72A4:
	ldr r0, [r0, #0x14]
	movs r1, #2
	rsbs r1, r1, #0
	str r4, [sp]
	movs r2, #0
	b _081C72D0
_081C72B0:
	ldr r0, [r0, #0x14]
	movs r1, #2
	rsbs r1, r1, #0
	movs r2, #0
	str r2, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _081C72EC
_081C72C4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #2
	rsbs r1, r1, #0
	movs r2, #0
	str r2, [sp]
_081C72D0:
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _081C72EC
_081C72D8:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #2
	rsbs r1, r1, #0
	movs r2, #0
	str r2, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_081C72EC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081C7280

	thumb_func_start IsDma3ManagerBusyWithBgCopy_
IsDma3ManagerBusyWithBgCopy_: @ 0x081C72F4
	ldr r0, _081C72FC
	ldrb r0, [r0, #7]
	lsrs r0, r0, #7
	bx lr
	.align 2, 0
_081C72FC: .4byte 0x02037C74
	thumb_func_end IsDma3ManagerBusyWithBgCopy_

	thumb_func_start sub_081C7300
sub_081C7300: @ 0x081C7300
	push {lr}
	ldr r0, _081C7310
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	pop {r0}
	bx r0
	.align 2, 0
_081C7310: .4byte 0xFFFEFFFE
	thumb_func_end sub_081C7300

	thumb_func_start InitBgTemplates
InitBgTemplates: @ 0x081C7314
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #0
	ble _081C732C
	adds r4, r1, #0
_081C731E:
	adds r0, r5, #0
	adds r5, #4
	bl InitBgFromTemplate
	subs r4, #1
	cmp r4, #0
	bne _081C731E
_081C732C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitBgTemplates

	thumb_func_start sub_081C7334
sub_081C7334: @ 0x081C7334
	push {r4, lr}
	movs r0, #0
	bl GetSubstructPtr
	adds r4, r0, #0
	ldr r0, _081C7360
	bl InitWindows
	movs r0, #0
	str r0, [r4, #0x10]
	bl sub_081C73B8
	ldrb r0, [r4, #0x10]
	bl PutWindowTilemap
	ldrb r0, [r4, #0x10]
	movs r1, #3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C7360: .4byte 0x085F13CC
	thumb_func_end sub_081C7334

	thumb_func_start sub_081C7364
sub_081C7364: @ 0x081C7364
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	bl GetSubstructPtr
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl sub_081C73B8
	ldrb r0, [r5, #0x10]
	ldr r1, _081C73A0
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r1, _081C73A4
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r1, [r4]
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C73A0: .4byte 0x085F140C
_081C73A4: .4byte 0x085F13DC
	thumb_func_end sub_081C7364

	thumb_func_start sub_081C73A8
sub_081C73A8: @ 0x081C73A8
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C73A8

	thumb_func_start sub_081C73B8
sub_081C73B8: @ 0x081C73B8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0x44
	bl FillWindowPixelBuffer
	movs r0, #0x80
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x55
	movs r2, #0
	movs r3, #0
	bl FillWindowPixelRect
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C73B8

	thumb_func_start InitPokenavMainMenuResources
InitPokenavMainMenuResources: @ 0x081C73E8
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetSubstructPtr
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _081C7444
_081C73F6:
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #8
	adds r5, #1
	cmp r5, #0
	beq _081C73F6
	ldr r0, _081C7448
	bl Pokenav_AllocAndLoadPalettes
	movs r0, #0
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	bics r0, r1
	str r0, [r6, #0x14]
	ldr r0, _081C744C
	movs r1, #0xdc
	movs r2, #0xc
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _081C7450
	adds r1, r1, r0
	str r1, [r6, #0x18]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C7444: .4byte 0x085F1410
_081C7448: .4byte 0x085F1418
_081C744C: .4byte 0x085F14C8
_081C7450: .4byte 0x020205AC
	thumb_func_end InitPokenavMainMenuResources

	thumb_func_start CleanupPokenavMainMenuResources
CleanupPokenavMainMenuResources: @ 0x081C7454
	push {lr}
	movs r0, #0
	bl GetSubstructPtr
	ldr r0, [r0, #0x18]
	bl DestroySprite
	movs r0, #0
	bl FreeSpriteTilesByTag
	movs r0, #0
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CleanupPokenavMainMenuResources

	thumb_func_start SpriteCB_SpinningPokenav
SpriteCB_SpinningPokenav: @ 0x081C7474
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetBgY
	lsrs r0, r0, #8
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_SpinningPokenav

	thumb_func_start PauseSpinningPokenavSprite
PauseSpinningPokenavSprite: @ 0x081C748C
	push {lr}
	movs r0, #0
	bl GetSubstructPtr
	ldr r0, [r0, #0x18]
	ldr r1, _081C74A0
	str r1, [r0, #0x1c]
	pop {r1}
	bx r1
	.align 2, 0
_081C74A0: .4byte 0x08007141
	thumb_func_end PauseSpinningPokenavSprite

	thumb_func_start ResumeSpinningPokenavSprite
ResumeSpinningPokenavSprite: @ 0x081C74A4
	push {r4, lr}
	movs r0, #0
	bl GetSubstructPtr
	ldr r2, [r0, #0x18]
	movs r4, #0
	movs r1, #0xdc
	strh r1, [r2, #0x20]
	ldr r2, [r0, #0x18]
	movs r1, #0xc
	strh r1, [r2, #0x22]
	ldr r2, [r0, #0x18]
	ldr r1, _081C74E4
	str r1, [r2, #0x1c]
	adds r2, #0x3e
	ldrb r3, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r3
	strb r1, [r2]
	ldr r3, [r0, #0x18]
	ldrb r2, [r3, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r3, #5]
	ldr r0, [r0, #0x18]
	adds r0, #0x43
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C74E4: .4byte 0x081C7475
	thumb_func_end ResumeSpinningPokenavSprite

	thumb_func_start InitHoennMapHeaderSprites
InitHoennMapHeaderSprites: @ 0x081C74E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	bl GetSubstructPtr
	adds r6, r0, #0
	ldr r0, _081C75A4
	bl LoadCompressedSpriteSheet
	movs r0, #1
	bl AllocSpritePalette
	movs r0, #2
	bl AllocSpritePalette
	movs r5, #0
	ldr r0, _081C75A8
	mov r8, r0
	movs r7, #4
_081C7510:
	ldr r0, _081C75AC
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r4, r5, #2
	adds r2, r6, #0
	adds r2, #0x1c
	adds r2, r2, r4
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	str r0, [r2]
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	ldr r1, [r2]
	lsls r0, r5, #6
	strh r0, [r1, #0x24]
	ldr r0, _081C75B0
	movs r1, #0
	movs r2, #0
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r6, #0
	adds r2, #0x24
	adds r2, r2, r4
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	str r0, [r2]
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	ldr r1, [r2]
	lsls r0, r5, #5
	strh r0, [r1, #0x24]
	ldr r1, [r2]
	movs r0, #0x12
	strh r0, [r1, #0x26]
	ldr r3, [r2]
	ldrh r2, [r3, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	lsls r0, r5, #3
	adds r0, #0x40
	adds r1, r1, r0
	ldr r4, _081C75B4
	adds r0, r4, #0
	ands r1, r0
	ldr r4, _081C75B8
	adds r0, r4, #0
	ands r2, r0
	orrs r2, r1
	strh r2, [r3, #4]
	adds r5, #1
	cmp r5, #1
	ble _081C7510
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C75A4: .4byte 0x085F1428
_081C75A8: .4byte 0x020205AC
_081C75AC: .4byte 0x085F14F0
_081C75B0: .4byte 0x085F1508
_081C75B4: .4byte 0x000003FF
_081C75B8: .4byte 0xFFFFFC00
	thumb_func_end InitHoennMapHeaderSprites

	thumb_func_start LoadLeftHeaderGfxForIndex
LoadLeftHeaderGfxForIndex: @ 0x081C75BC
	push {lr}
	cmp r0, #5
	bhi _081C75C8
	bl LoadLeftHeaderGfxForMenu
	b _081C75CE
_081C75C8:
	subs r0, #6
	bl LoadLeftHeaderGfxForSubMenu
_081C75CE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadLeftHeaderGfxForIndex

	thumb_func_start sub_081C75D4
sub_081C75D4: @ 0x081C75D4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetSubstructPtr
	adds r5, r0, #0
	cmp r4, #4
	bne _081C75F0
	movs r0, #2
	bl GetSpriteTileStartByTag
	ldr r3, [r5, #0x20]
	adds r0, #0x20
	b _081C75FA
_081C75F0:
	movs r0, #2
	bl GetSpriteTileStartByTag
	ldr r3, [r5, #0x20]
	adds r0, #0x40
_081C75FA:
	ldr r2, _081C7610
	adds r1, r2, #0
	ands r0, r1
	ldrh r2, [r3, #4]
	ldr r1, _081C7614
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C7610: .4byte 0x000003FF
_081C7614: .4byte 0xFFFFFC00
	thumb_func_end sub_081C75D4

	thumb_func_start LoadLeftHeaderGfxForMenu
LoadLeftHeaderGfxForMenu: @ 0x081C7618
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	cmp r6, #5
	bhi _081C76A8
	movs r0, #0
	bl GetSubstructPtr
	mov sb, r0
	ldr r0, _081C76B4
	lsls r6, r6, #3
	adds r6, r6, r0
	ldrh r4, [r6, #6]
	ldr r0, [r6]
	mov r8, r0
	bl GetDecompressedDataSize
	adds r5, r0, #0
	lsls r4, r4, #5
	ldr r0, _081C76B8
	adds r4, r4, r0
	movs r0, #1
	bl IndexOfSpritePaletteTag
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #4
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r4, _081C76BC
	mov r0, r8
	adds r1, r4, #0
	bl LZ77UnCompWram
	movs r0, #2
	bl GetSpriteTileStartByTag
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	ldr r0, _081C76C0
	adds r1, r1, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl RequestDma3Copy
	movs r0, #2
	bl GetSpriteTileStartByTag
	mov r1, sb
	ldr r3, [r1, #0x20]
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	ldr r2, _081C76C4
	adds r1, r2, #0
	ands r0, r1
	ldrh r2, [r3, #4]
	ldr r1, _081C76C8
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #4]
_081C76A8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C76B4: .4byte 0x085F1430
_081C76B8: .4byte 0x085F021C
_081C76BC: .4byte 0x0201C000
_081C76C0: .4byte 0x06010000
_081C76C4: .4byte 0x000003FF
_081C76C8: .4byte 0xFFFFFC00
	thumb_func_end LoadLeftHeaderGfxForMenu

	thumb_func_start LoadLeftHeaderGfxForSubMenu
LoadLeftHeaderGfxForSubMenu: @ 0x081C76CC
	push {r4, r5, r6, lr}
	cmp r0, #6
	bhi _081C7732
	ldr r2, _081C7738
	lsls r1, r0, #3
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r4, [r0]
	adds r1, r1, r2
	ldr r6, [r1]
	adds r0, r6, #0
	bl GetDecompressedDataSize
	adds r5, r0, #0
	lsls r4, r4, #5
	ldr r0, _081C773C
	adds r4, r4, r0
	movs r0, #2
	bl IndexOfSpritePaletteTag
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r4, _081C7740
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	movs r0, #2
	bl GetSpriteTileStartByTag
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	ldr r0, _081C7744
	adds r1, r1, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl RequestDma3Copy
_081C7732:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C7738: .4byte 0x085F1460
_081C773C: .4byte 0x085F021C
_081C7740: .4byte 0x0201D000
_081C7744: .4byte 0x06010800
	thumb_func_end LoadLeftHeaderGfxForSubMenu

	thumb_func_start sub_081C7748
sub_081C7748: @ 0x081C7748
	push {lr}
	adds r3, r0, #0
	movs r0, #0x10
	cmp r1, #0
	bne _081C7754
	movs r0, #0x30
_081C7754:
	cmp r3, #5
	bhi _081C7760
	adds r1, r2, #0
	bl ShowLeftHeaderSprites
	b _081C7766
_081C7760:
	adds r1, r2, #0
	bl ShowLeftHeaderSubmenuSprites
_081C7766:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C7748

	thumb_func_start sub_081C776C
sub_081C776C: @ 0x081C776C
	push {lr}
	cmp r0, #5
	bhi _081C777A
	adds r0, r1, #0
	bl HideLeftHeaderSprites
	b _081C7780
_081C777A:
	adds r0, r1, #0
	bl HideLeftHeaderSubmenuSprites
_081C7780:
	pop {r0}
	bx r0
	thumb_func_end sub_081C776C

	thumb_func_start sub_081C7784
sub_081C7784: @ 0x081C7784
	push {r4, lr}
	movs r0, #0
	bl GetSubstructPtr
	movs r4, #4
	adds r2, r0, #0
	adds r2, #0x1c
	movs r3, #1
_081C7794:
	ldr r1, [r2]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	ldr r1, [r2, #8]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _081C7794
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081C7784

	thumb_func_start sub_081C77B8
sub_081C77B8: @ 0x081C77B8
	push {lr}
	movs r0, #0
	bl GetSubstructPtr
	adds r1, r0, #0
	ldr r0, [r1, #0x1c]
	ldr r2, [r0, #0x1c]
	ldr r0, _081C77D8
	cmp r2, r0
	bne _081C77DC
	ldr r0, [r1, #0x24]
	ldr r0, [r0, #0x1c]
	cmp r0, r2
	bne _081C77DC
	movs r0, #0
	b _081C77DE
	.align 2, 0
_081C77D8: .4byte 0x08007141
_081C77DC:
	movs r0, #1
_081C77DE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C77B8

	thumb_func_start ShowLeftHeaderSprites
ShowLeftHeaderSprites: @ 0x081C77E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	movs r0, #0
	bl GetSubstructPtr
	cmp r4, #0
	bne _081C7800
	movs r7, #0x60
	rsbs r7, r7, #0
	movs r6, #0x20
	b _081C7806
_081C7800:
	movs r7, #0x80
	lsls r7, r7, #1
	movs r6, #0xa0
_081C7806:
	adds r4, r0, #0
	adds r4, #0x1c
	movs r5, #1
_081C780C:
	ldr r0, [r4]
	mov r1, r8
	strh r1, [r0, #0x22]
	ldm r4!, {r0}
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0xc
	bl MoveLeftHeader
	subs r5, #1
	cmp r5, #0
	bge _081C780C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ShowLeftHeaderSprites

	thumb_func_start ShowLeftHeaderSubmenuSprites
ShowLeftHeaderSubmenuSprites: @ 0x081C7830
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	movs r0, #0
	bl GetSubstructPtr
	cmp r4, #0
	bne _081C784C
	movs r7, #0x60
	rsbs r7, r7, #0
	movs r6, #0x10
	b _081C7852
_081C784C:
	movs r7, #0x80
	lsls r7, r7, #1
	movs r6, #0xc0
_081C7852:
	adds r4, r0, #0
	adds r4, #0x24
	movs r5, #1
_081C7858:
	ldr r0, [r4]
	mov r1, r8
	strh r1, [r0, #0x22]
	ldm r4!, {r0}
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0xc
	bl MoveLeftHeader
	subs r5, #1
	cmp r5, #0
	bge _081C7858
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ShowLeftHeaderSubmenuSprites

	thumb_func_start HideLeftHeaderSprites
HideLeftHeaderSprites: @ 0x081C787C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetSubstructPtr
	cmp r4, #0
	bne _081C7892
	movs r6, #0x20
	movs r5, #0x60
	rsbs r5, r5, #0
	b _081C7898
_081C7892:
	movs r6, #0xc0
	movs r5, #0x80
	lsls r5, r5, #1
_081C7898:
	adds r7, r0, #0
	adds r7, #0x1c
	movs r4, #1
_081C789E:
	ldm r7!, {r0}
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0xc
	bl MoveLeftHeader
	subs r4, #1
	cmp r4, #0
	bge _081C789E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end HideLeftHeaderSprites

	thumb_func_start HideLeftHeaderSubmenuSprites
HideLeftHeaderSubmenuSprites: @ 0x081C78B8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetSubstructPtr
	cmp r4, #0
	bne _081C78CE
	movs r6, #0x10
	movs r5, #0x60
	rsbs r5, r5, #0
	b _081C78D4
_081C78CE:
	movs r6, #0xc0
	movs r5, #0x80
	lsls r5, r5, #1
_081C78D4:
	adds r7, r0, #0
	adds r7, #0x24
	movs r4, #1
_081C78DA:
	ldm r7!, {r0}
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0xc
	bl MoveLeftHeader
	subs r4, #1
	cmp r4, #0
	bge _081C78DA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end HideLeftHeaderSubmenuSprites

	thumb_func_start MoveLeftHeader
MoveLeftHeader: @ 0x081C78F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	strh r0, [r4, #0x20]
	lsls r1, r0, #4
	strh r1, [r4, #0x2e]
	subs r0, r6, r0
	lsls r0, r0, #4
	adds r1, r5, #0
	bl __divsi3
	strh r0, [r4, #0x30]
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x3c]
	ldr r0, _081C7920
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081C7920: .4byte 0x081C7925
	thumb_func_end MoveLeftHeader

	thumb_func_start SpriteCB_MoveLeftHeader
SpriteCB_MoveLeftHeader: @ 0x081C7924
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x32]
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _081C796C
	subs r0, r1, #1
	strh r0, [r2, #0x32]
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x2e]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x20]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _081C795E
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	b _081C7974
_081C795E:
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _081C7974
_081C796C:
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x20]
	ldr r0, _081C7978
	str r0, [r2, #0x1c]
_081C7974:
	pop {r0}
	bx r0
	.align 2, 0
_081C7978: .4byte 0x08007141
	thumb_func_end SpriteCB_MoveLeftHeader

