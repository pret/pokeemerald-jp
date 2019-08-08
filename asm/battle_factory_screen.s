.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0819A0EC
sub_0819A0EC: @ 0x0819A0EC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r4, [r5, #5]
	lsrs r4, r4, #4
	movs r0, #0x65
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0819A15A
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0819A150
	ldrh r1, [r5, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0819A124
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
	b _0819A162
_0819A124:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0819A146
	adds r0, r5, #0
	movs r1, #0
	bl StartSpriteAnim
	movs r0, #0x20
	strh r0, [r5, #0x2e]
	b _0819A162
_0819A146:
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
	b _0819A162
_0819A150:
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnimIfDifferent
	b _0819A162
_0819A15A:
	adds r0, r5, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
_0819A162:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0819A0EC

	thumb_func_start Select_CB2
Select_CB2: @ 0x0819A168
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Select_CB2

	thumb_func_start Select_VblankCb
Select_VblankCb: @ 0x0819A184
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Select_VblankCb

	thumb_func_start DoBattleFactorySelectScreen
DoBattleFactorySelectScreen: @ 0x0819A198
	push {lr}
	ldr r0, _0819A1AC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0819A1B0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0819A1AC: .4byte 0x03001278
_0819A1B0: .4byte 0x0819A1B5
	thumb_func_end DoBattleFactorySelectScreen

	thumb_func_start CB2_InitSelectScreen
CB2_InitSelectScreen: @ 0x0819A1B4
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _0819A1D4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xa
	bls _0819A1C8
	b _0819A62E
_0819A1C8:
	lsls r0, r0, #2
	ldr r1, _0819A1D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819A1D4: .4byte 0x03002360
_0819A1D8: .4byte 0x0819A1DC
_0819A1DC: @ jump table
	.4byte _0819A208 @ case 0
	.4byte _0819A260 @ case 1
	.4byte _0819A33C @ case 2
	.4byte _0819A41C @ case 3
	.4byte _0819A46C @ case 4
	.4byte _0819A508 @ case 5
	.4byte _0819A544 @ case 6
	.4byte _0819A54C @ case 7
	.4byte _0819A564 @ case 8
	.4byte _0819A57C @ case 9
	.4byte _0819A59C @ case 10
_0819A208:
	ldr r4, _0819A250
	ldr r0, [r4]
	cmp r0, #0
	beq _0819A218
	bl Free
	movs r0, #0
	str r0, [r4]
_0819A218:
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0819A254
	add r0, sp, #8
	bl CpuSet
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0819A258
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r0, _0819A25C
	bl InitWindows
	bl DeactivateAllTextPrinters
	b _0819A586
	.align 2, 0
_0819A250: .4byte 0x0203CB08
_0819A254: .4byte 0x05006000
_0819A258: .4byte 0x085DBC30
_0819A25C: .4byte 0x085DBC3C
_0819A260:
	ldr r5, _0819A328
	movs r4, #0x88
	lsls r4, r4, #3
	adds r0, r4, #0
	bl Alloc
	str r0, [r5]
	ldr r5, _0819A32C
	adds r0, r4, #0
	bl AllocZeroed
	str r0, [r5]
	ldr r5, _0819A330
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl Alloc
	str r0, [r5]
	ldr r5, _0819A334
	adds r0, r4, #0
	bl AllocZeroed
	str r0, [r5]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
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
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4c
	movs r1, #0
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
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	ldr r1, _0819A338
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _0819A58E
	.align 2, 0
_0819A328: .4byte 0x0203CAF8
_0819A32C: .4byte 0x0203CAFC
_0819A330: .4byte 0x0203CB00
_0819A334: .4byte 0x0203CB04
_0819A338: .4byte 0x03002360
_0819A33C:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r0, _0819A3EC
	ldr r5, _0819A3F0
	ldr r1, [r5]
	movs r2, #0x88
	lsls r2, r2, #2
	bl CpuSet
	ldr r0, _0819A3F4
	ldr r4, _0819A3F8
	ldr r1, [r4]
	movs r2, #0x30
	bl CpuSet
	ldr r1, [r5]
	movs r2, #0x88
	lsls r2, r2, #3
	movs r0, #1
	movs r3, #0
	bl LoadBgTiles
	ldr r1, [r4]
	movs r0, #3
	movs r2, #0x60
	movs r3, #0
	bl LoadBgTiles
	ldr r0, _0819A3FC
	ldr r4, _0819A400
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuSet
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #4
	movs r0, #1
	movs r3, #0
	bl LoadBgTilemap
	ldr r0, _0819A404
	movs r1, #0
	movs r2, #0x40
	bl LoadPalette
	ldr r4, _0819A408
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #8
	bl LoadPalette
	adds r0, r4, #0
	movs r1, #0xe0
	movs r2, #0xa
	bl LoadPalette
	ldr r0, _0819A40C
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	cmp r0, #1
	bne _0819A3D8
	ldr r0, _0819A410
	movs r2, #0xa9
	lsls r2, r2, #2
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r3, #0xe4
	lsls r3, r3, #1
	adds r0, r0, r3
	strh r1, [r0]
_0819A3D8:
	ldr r0, _0819A414
	movs r1, #0x20
	movs r2, #4
	bl LoadPalette
	ldr r1, _0819A418
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819A58E
	.align 2, 0
_0819A3EC: .4byte 0x085DAD38
_0819A3F0: .4byte 0x0203CAF8
_0819A3F4: .4byte 0x085DBA78
_0819A3F8: .4byte 0x0203CAFC
_0819A3FC: .4byte 0x085DB178
_0819A400: .4byte 0x0203CB00
_0819A404: .4byte 0x085DBAD8
_0819A408: .4byte 0x085DBC74
_0819A40C: .4byte 0x03001278
_0819A410: .4byte 0x020373B4
_0819A414: .4byte 0x085DBB18
_0819A418: .4byte 0x03002360
_0819A41C:
	ldr r0, _0819A464
	ldr r1, [r0]
	movs r0, #3
	bl SetBgTilemapBuffer
	ldr r5, _0819A468
	movs r4, #8
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #3
	adds r1, r5, #0
	movs r2, #0xb
	movs r3, #4
	bl CopyToBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #3
	adds r1, r5, #0
	movs r2, #2
	movs r3, #4
	bl CopyToBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #3
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #4
	bl CopyToBgTilemapBufferRect
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _0819A586
	.align 2, 0
_0819A464: .4byte 0x0203CB04
_0819A468: .4byte 0x085DB978
_0819A46C:
	ldr r0, _0819A4D8
	bl LoadSpritePalettes
	ldr r0, _0819A4DC
	bl LoadSpriteSheets
	ldr r0, _0819A4E0
	bl LoadCompressedSpriteSheet
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	ldr r0, _0819A4E4
	bl SetVBlankCallback
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r1, #0x9a
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0819A4E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _0819A4F4
	movs r0, #0x58
	movs r1, #0x98
	movs r2, #0x20
	movs r3, #0x60
	bl Select_SetWinRegs
	movs r0, #3
	bl ShowBg
	ldr r1, _0819A4EC
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _0819A4F0
	movs r0, #0x52
	bl SetGpuReg
	b _0819A4FA
	.align 2, 0
_0819A4D8: .4byte 0x085DBB70
_0819A4DC: .4byte 0x085DBB38
_0819A4E0: .4byte 0x085DBB60
_0819A4E4: .4byte 0x0819A185
_0819A4E8: .4byte 0x03001278
_0819A4EC: .4byte 0x00001248
_0819A4F0: .4byte 0x0000040B
_0819A4F4:
	movs r0, #3
	bl HideBg
_0819A4FA:
	ldr r1, _0819A504
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _0819A58E
	.align 2, 0
_0819A504: .4byte 0x03002360
_0819A508:
	ldr r4, _0819A538
	ldr r1, [r4]
	ldrb r0, [r1, #6]
	cmp r0, #1
	bne _0819A518
	ldr r0, _0819A53C
	ldrb r0, [r0]
	strb r0, [r1, #3]
_0819A518:
	bl Select_InitMonsData
	bl Select_InitAllSprites
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _0819A52C
	bl Select_ShowSummaryMonSprite
_0819A52C:
	ldr r1, _0819A540
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819A58E
	.align 2, 0
_0819A538: .4byte 0x03001278
_0819A53C: .4byte 0x0203CBEC
_0819A540: .4byte 0x03002360
_0819A544:
	bl Select_PrintSelectMonString
	movs r0, #2
	b _0819A582
_0819A54C:
	bl Select_PrintMonCategory
	movs r0, #5
	bl PutWindowTilemap
	ldr r1, _0819A560
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _0819A58E
	.align 2, 0
_0819A560: .4byte 0x03002360
_0819A564:
	bl Select_PrintMonSpecies
	movs r0, #1
	bl PutWindowTilemap
	ldr r1, _0819A578
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819A58E
	.align 2, 0
_0819A578: .4byte 0x03002360
_0819A57C:
	bl Select_PrintRentalPkmnString
	movs r0, #0
_0819A582:
	bl PutWindowTilemap
_0819A586:
	ldr r1, _0819A598
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_0819A58E:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0819A62E
	.align 2, 0
_0819A598: .4byte 0x03002360
_0819A59C:
	ldr r0, _0819A5E0
	movs r1, #0
	bl CreateTask
	ldr r2, _0819A5E4
	ldr r1, [r2]
	ldr r3, _0819A5E8
	adds r1, r1, r3
	strb r0, [r1]
	ldr r3, [r2]
	ldrb r5, [r3, #6]
	cmp r5, #0
	bne _0819A5F4
	ldr r4, _0819A5EC
	ldr r1, _0819A5E8
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r5, [r0, #8]
	ldr r0, _0819A5F0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r5, [r0, #8]
	b _0819A628
	.align 2, 0
_0819A5E0: .4byte 0x0819C385
_0819A5E4: .4byte 0x03001278
_0819A5E8: .4byte 0x000002A1
_0819A5EC: .4byte 0x03005B60
_0819A5F0: .4byte 0x0819B019
_0819A5F4:
	ldr r4, _0819A638
	ldr r2, _0819A63C
	adds r0, r3, r2
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r2, #0
	movs r1, #1
	strh r1, [r0, #8]
	ldr r1, _0819A640
	adds r0, r3, r1
	strb r2, [r0]
	ldr r0, _0819A644
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0xd
	strh r1, [r0, #8]
_0819A628:
	ldr r0, _0819A648
	bl SetMainCallback2
_0819A62E:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819A638: .4byte 0x03005B60
_0819A63C: .4byte 0x000002A1
_0819A640: .4byte 0x000002A2
_0819A644: .4byte 0x0819ADC5
_0819A648: .4byte 0x0819A169
	thumb_func_end CB2_InitSelectScreen

	thumb_func_start Select_InitMonsData
Select_InitMonsData: @ 0x0819A64C
	push {r4, r5, lr}
	ldr r5, _0819A6A0
	ldr r4, [r5]
	cmp r4, #0
	bne _0819A6B2
	movs r0, #0xab
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r5]
	strb r4, [r0, #3]
	ldr r1, [r5]
	movs r0, #1
	strb r0, [r1, #5]
	ldr r0, [r5]
	strb r4, [r0, #6]
	movs r2, #0
	movs r4, #0x6c
	movs r3, #0
_0819A672:
	ldr r0, [r5]
	adds r1, r2, #0
	muls r1, r4, r1
	adds r0, r0, r1
	strb r3, [r0, #0x10]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _0819A672
	ldr r0, _0819A6A4
	ldr r0, [r0]
	ldr r1, _0819A6A8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0819A6AC
	movs r0, #0
	bl CreateFrontierFactorySelectableMons
	b _0819A6B2
	.align 2, 0
_0819A6A0: .4byte 0x03001278
_0819A6A4: .4byte 0x03005AF0
_0819A6A8: .4byte 0x00000CA9
_0819A6AC:
	movs r0, #0
	bl CreateTentFactorySelectableMons
_0819A6B2:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Select_InitMonsData

	thumb_func_start Select_InitAllSprites
Select_InitAllSprites: @ 0x0819A6B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	mov r8, r4
	ldr r7, _0819A7C8
_0819A6C4:
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #2
	subs r1, r1, r4
	adds r1, #0x20
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _0819A7CC
	movs r2, #0x40
	movs r3, #1
	bl CreateSprite
	ldr r6, _0819A7D0
	ldr r2, [r6]
	movs r5, #0x6c
	adds r1, r4, #0
	muls r1, r5, r1
	adds r2, r2, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r2, #0xe]
	ldrh r1, [r2, #0xe]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r1, r8
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl Select_SetBallSpritePaletteNum
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _0819A6C4
	ldr r0, [r6]
	ldrb r1, [r0, #3]
	ldr r4, _0819A7C8
	muls r1, r5, r1
	adds r0, r0, r1
	ldrh r0, [r0, #0xe]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r0, _0819A7D4
	movs r2, #0x20
	ldrsh r1, [r1, r2]
	movs r2, #0x58
	movs r3, #0
	bl CreateSprite
	ldr r1, [r6]
	movs r5, #0
	strb r0, [r1, #4]
	ldr r0, _0819A7D8
	movs r1, #0xb0
	movs r2, #0x70
	movs r3, #0
	bl CreateSprite
	ldr r1, [r6]
	strb r0, [r1, #1]
	ldr r0, _0819A7DC
	movs r1, #0xb0
	movs r2, #0x90
	movs r3, #0
	bl CreateSprite
	ldr r1, [r6]
	strb r0, [r1, #2]
	ldr r0, [r6]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r6]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r6]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x28
	strb r5, [r0]
	ldr r0, [r6]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x29
	strb r5, [r0]
	ldr r0, [r6]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x28
	strb r5, [r0]
	ldr r0, [r6]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x29
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819A7C8: .4byte 0x020205AC
_0819A7CC: .4byte 0x085DBDE0
_0819A7D0: .4byte 0x03001278
_0819A7D4: .4byte 0x085DBDF8
_0819A7D8: .4byte 0x085DBE10
_0819A7DC: .4byte 0x085DBE28
	thumb_func_end Select_InitAllSprites

	thumb_func_start Select_DestroyAllSprites
Select_DestroyAllSprites: @ 0x0819A7E0
	push {r4, r5, r6, lr}
	movs r4, #0
_0819A7E4:
	ldr r6, _0819A840
	ldr r1, [r6]
	movs r0, #0x6c
	muls r0, r4, r0
	adds r1, r1, r0
	ldrh r1, [r1, #0xe]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0819A844
	adds r0, r0, r5
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _0819A7E4
	ldr r0, [r6]
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	ldr r0, [r6]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	ldr r0, [r6]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819A840: .4byte 0x03001278
_0819A844: .4byte 0x020205AC
	thumb_func_end Select_DestroyAllSprites

	thumb_func_start Select_UpdateBallCursorPosition
Select_UpdateBallCursorPosition: @ 0x0819A848
	push {r4, lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0819A868
	ldr r0, _0819A860
	ldr r1, [r0]
	ldrb r3, [r1, #3]
	adds r2, r0, #0
	cmp r3, #5
	beq _0819A864
	adds r0, r3, #1
	b _0819A87E
	.align 2, 0
_0819A860: .4byte 0x03001278
_0819A864:
	movs r0, #0
	b _0819A87E
_0819A868:
	ldr r0, _0819A878
	ldr r1, [r0]
	ldrb r3, [r1, #3]
	adds r2, r0, #0
	cmp r3, #0
	beq _0819A87C
	subs r0, r3, #1
	b _0819A87E
	.align 2, 0
_0819A878: .4byte 0x03001278
_0819A87C:
	movs r0, #5
_0819A87E:
	strb r0, [r1, #3]
	ldr r2, [r2]
	ldrb r3, [r2, #3]
	ldr r4, _0819A8AC
	ldrb r0, [r2, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x6c
	muls r0, r3, r0
	adds r2, r2, r0
	ldrh r2, [r2, #0xe]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x20]
	strh r0, [r1, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819A8AC: .4byte 0x020205AC
	thumb_func_end Select_UpdateBallCursorPosition

	thumb_func_start Select_UpdateMenuCursorPosition
Select_UpdateMenuCursorPosition: @ 0x0819A8B0
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0819A8D0
	ldr r0, _0819A8C8
	ldr r1, [r0]
	ldrb r3, [r1]
	adds r2, r0, #0
	cmp r3, #2
	beq _0819A8CC
	adds r0, r3, #1
	b _0819A8E6
	.align 2, 0
_0819A8C8: .4byte 0x03001278
_0819A8CC:
	movs r0, #0
	b _0819A8E6
_0819A8D0:
	ldr r0, _0819A8E0
	ldr r1, [r0]
	ldrb r3, [r1]
	adds r2, r0, #0
	cmp r3, #0
	beq _0819A8E4
	subs r0, r3, #1
	b _0819A8E6
	.align 2, 0
_0819A8E0: .4byte 0x03001278
_0819A8E4:
	movs r0, #2
_0819A8E6:
	strb r0, [r1]
	ldr r3, _0819A914
	ldr r2, [r2]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	ldrb r0, [r2, #2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	pop {r0}
	bx r0
	.align 2, 0
_0819A914: .4byte 0x020205AC
	thumb_func_end Select_UpdateMenuCursorPosition

	thumb_func_start Select_UpdateYesNoCursorPosition
Select_UpdateYesNoCursorPosition: @ 0x0819A918
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0819A938
	ldr r0, _0819A930
	ldr r1, [r0]
	ldrb r3, [r1, #7]
	adds r2, r0, #0
	cmp r3, #1
	beq _0819A934
	adds r0, r3, #1
	b _0819A94E
	.align 2, 0
_0819A930: .4byte 0x03001278
_0819A934:
	movs r0, #0
	b _0819A94E
_0819A938:
	ldr r0, _0819A948
	ldr r1, [r0]
	ldrb r3, [r1, #7]
	adds r2, r0, #0
	cmp r3, #0
	beq _0819A94C
	subs r0, r3, #1
	b _0819A94E
	.align 2, 0
_0819A948: .4byte 0x03001278
_0819A94C:
	movs r0, #1
_0819A94E:
	strb r0, [r1, #7]
	ldr r3, _0819A97C
	ldr r2, [r2]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #7]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	ldrb r0, [r2, #2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #7]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	pop {r0}
	bx r0
	.align 2, 0
_0819A97C: .4byte 0x020205AC
	thumb_func_end Select_UpdateYesNoCursorPosition

	thumb_func_start Select_HandleMonSelectionChange
Select_HandleMonSelectionChange: @ 0x0819A980
	push {r4, r5, r6, lr}
	ldr r5, _0819A9FC
	ldr r0, [r5]
	ldrb r6, [r0, #3]
	movs r1, #0x6c
	adds r4, r6, #0
	muls r4, r1, r4
	adds r0, r0, r4
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _0819AA00
	movs r0, #0x64
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, [r5]
	ldrb r0, [r1, #5]
	cmp r0, #3
	bne _0819A9E4
	adds r0, r1, r4
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	bne _0819A9E4
	movs r2, #0
	ldrb r0, [r1, #0x10]
	cmp r0, #2
	beq _0819A9D2
	movs r4, #0x6c
_0819A9BA:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bhi _0819A9D2
	ldr r0, [r5]
	adds r1, r2, #0
	muls r1, r4, r1
	adds r0, r0, r1
	ldrb r0, [r0, #0x10]
	cmp r0, #2
	bne _0819A9BA
_0819A9D2:
	cmp r2, #6
	beq _0819AA3C
	ldr r0, _0819A9FC
	ldr r1, [r0]
	movs r0, #0x6c
	muls r0, r2, r0
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1, #0x10]
_0819A9E4:
	ldr r2, _0819A9FC
	ldr r1, [r2]
	movs r0, #0x6c
	muls r0, r6, r0
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1, #0x10]
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	subs r0, #1
	b _0819AA18
	.align 2, 0
_0819A9FC: .4byte 0x03001278
_0819AA00:
	movs r0, #0x65
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [r5]
	adds r1, r0, r4
	ldrb r0, [r0, #5]
	strb r0, [r1, #0x10]
	ldr r1, [r5]
	ldrb r0, [r1, #5]
	adds r0, #1
_0819AA18:
	strb r0, [r1, #5]
	ldr r2, _0819AA44
	ldr r0, _0819AA48
	ldr r0, [r0]
	movs r1, #0x6c
	muls r1, r6, r1
	adds r0, r0, r1
	ldrh r0, [r0, #0xe]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
_0819AA3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819AA44: .4byte 0x020205AC
_0819AA48: .4byte 0x03001278
	thumb_func_end Select_HandleMonSelectionChange

	thumb_func_start Select_SetBallSpritePaletteNum
Select_SetBallSpritePaletteNum: @ 0x0819AA4C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0819AA68
	ldr r0, [r0]
	movs r1, #0x6c
	muls r1, r4, r1
	adds r0, r0, r1
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _0819AA6C
	movs r0, #0x65
	b _0819AA6E
	.align 2, 0
_0819AA68: .4byte 0x03001278
_0819AA6C:
	movs r0, #0x64
_0819AA6E:
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0819AAA0
	ldr r0, _0819AAA4
	ldr r0, [r0]
	movs r1, #0x6c
	muls r1, r4, r1
	adds r0, r0, r1
	ldrh r0, [r0, #0xe]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819AAA0: .4byte 0x020205AC
_0819AAA4: .4byte 0x03001278
	thumb_func_end Select_SetBallSpritePaletteNum

	thumb_func_start Task_FromSelectScreenToSummaryScreen
Task_FromSelectScreenToSummaryScreen: @ 0x0819AAA8
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0819AACC
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r6, r0, r1
	movs r1, #8
	ldrsh r0, [r6, r1]
	cmp r0, #7
	beq _0819AB04
	cmp r0, #7
	bgt _0819AAD0
	cmp r0, #6
	beq _0819AAD6
	b _0819ABF0
	.align 2, 0
_0819AACC: .4byte 0x03005B60
_0819AAD0:
	cmp r0, #8
	beq _0819AB88
	b _0819ABF0
_0819AAD6:
	ldr r1, _0819AAFC
	ldr r0, _0819AB00
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r1, r2
	movs r2, #0
	strh r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r2, [sp]
	movs r1, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #7
	strh r0, [r6, #8]
	b _0819ABF0
	.align 2, 0
_0819AAFC: .4byte 0x020373B4
_0819AB00: .4byte 0x020377B4
_0819AB04:
	ldr r0, _0819AB6C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0819ABF0
	ldr r4, _0819AB70
	ldr r0, [r4]
	ldr r2, _0819AB74
	adds r0, r0, r2
	ldrb r0, [r0]
	bl DestroyTask
	ldr r1, [r4]
	movs r3, #0xa6
	lsls r3, r3, #2
	adds r0, r1, r3
	ldr r0, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_0819F330
	bl Select_DestroyAllSprites
	ldr r4, _0819AB78
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819AB7C
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819AB80
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819AB84
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	bl FreeAllWindowBuffers
	movs r0, #8
	strh r0, [r6, #8]
	b _0819ABF0
	.align 2, 0
_0819AB6C: .4byte 0x02037C74
_0819AB70: .4byte 0x03001278
_0819AB74: .4byte 0x000002A1
_0819AB78: .4byte 0x0203CAF8
_0819AB7C: .4byte 0x0203CAFC
_0819AB80: .4byte 0x0203CB00
_0819AB84: .4byte 0x0203CB04
_0819AB88:
	ldr r4, _0819ABF8
	ldr r1, [r4]
	ldr r0, _0819ABFC
	movs r3, #0xe4
	lsls r3, r3, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r3, #0xdc
	adds r1, r1, r3
	strh r0, [r1]
	adds r0, r2, #0
	bl DestroyTask
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #6]
	ldr r0, [r4]
	ldrb r6, [r0, #3]
	ldr r4, _0819AC00
	movs r0, #0x96
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	movs r4, #0
_0819ABBA:
	ldr r5, _0819AC00
	ldr r1, [r5]
	movs r0, #0x64
	muls r0, r4, r0
	adds r0, r0, r1
	ldr r1, _0819ABF8
	ldr r1, [r1]
	movs r2, #0x6c
	muls r2, r4, r2
	adds r1, r1, r2
	adds r1, #0x14
	movs r2, #0x64
	bl memcpy
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _0819ABBA
	ldr r1, [r5]
	ldr r0, _0819AC04
	str r0, [sp]
	movs r0, #1
	adds r2, r6, #0
	movs r3, #5
	bl ShowPokemonSummaryScreen
_0819ABF0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819ABF8: .4byte 0x03001278
_0819ABFC: .4byte 0x020373B4
_0819AC00: .4byte 0x0203CB08
_0819AC04: .4byte 0x0819A1B5
	thumb_func_end Task_FromSelectScreenToSummaryScreen

	thumb_func_start Task_CloseSelectionScreen
Task_CloseSelectionScreen: @ 0x0819AC08
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _0819AC38
	ldr r0, [r7]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _0819ACAE
	ldr r1, _0819AC3C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _0819AC40
	cmp r1, #1
	beq _0819AC58
	b _0819ACAE
	.align 2, 0
_0819AC38: .4byte 0x03001278
_0819AC3C: .4byte 0x03005B60
_0819AC40:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0819ACAE
_0819AC58:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0819ACAE
	bl Select_CopyMonsToPlayerParty
	ldr r0, [r7]
	ldr r1, _0819ACB8
	adds r0, r0, r1
	ldrb r0, [r0]
	bl DestroyTask
	bl Select_DestroyAllSprites
	ldr r4, _0819ACBC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819ACC0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819ACC4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r0, [r7]
	bl Free
	str r5, [r7]
	bl FreeAllWindowBuffers
	ldr r0, _0819ACC8
	bl SetMainCallback2
	adds r0, r6, #0
	bl DestroyTask
_0819ACAE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819ACB8: .4byte 0x000002A1
_0819ACBC: .4byte 0x0203CAF8
_0819ACC0: .4byte 0x0203CB00
_0819ACC4: .4byte 0x0203CB04
_0819ACC8: .4byte 0x08085B19
	thumb_func_end Task_CloseSelectionScreen

	thumb_func_start Task_HandleSelectionScreenYesNo
Task_HandleSelectionScreenYesNo: @ 0x0819ACCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r7, _0819AD04
	ldr r0, [r7]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _0819ADBA
	ldr r1, _0819AD08
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #5
	beq _0819AD24
	cmp r0, #5
	bgt _0819AD0C
	cmp r0, #4
	beq _0819AD1A
	b _0819ADBA
	.align 2, 0
_0819AD04: .4byte 0x03001278
_0819AD08: .4byte 0x03005B60
_0819AD0C:
	cmp r0, #0xa
	bne _0819ADBA
	bl sub_0819C19C
	movs r0, #4
	strh r0, [r5, #8]
	b _0819ADBA
_0819AD1A:
	bl Select_ShowYesNoOptions
	movs r0, #5
	strh r0, [r5, #8]
	b _0819ADBA
_0819AD24:
	ldr r2, _0819AD50
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	mov r8, r0
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0819AD58
	movs r0, #5
	bl PlaySE
	ldr r0, [r7]
	ldrb r4, [r0, #7]
	cmp r4, #0
	bne _0819AD66
	bl sub_0819C250
	strh r4, [r5, #8]
	ldr r0, _0819AD54
	str r0, [r5]
	b _0819ADBA
	.align 2, 0
_0819AD50: .4byte 0x03002360
_0819AD54: .4byte 0x0819AC09
_0819AD58:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0819AD8C
	movs r0, #5
	bl PlaySE
_0819AD66:
	movs r0, #4
	bl sub_0819B5F8
	bl sub_0819B940
	ldr r0, [r7]
	ldr r1, _0819AD84
	adds r0, r0, r1
	mov r1, r8
	strb r1, [r0]
	strh r6, [r5, #8]
	ldr r0, _0819AD88
	str r0, [r5]
	b _0819ADBA
	.align 2, 0
_0819AD84: .4byte 0x000002A2
_0819AD88: .4byte 0x0819B019
_0819AD8C:
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0819ADA6
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	bl Select_UpdateYesNoCursorPosition
	b _0819ADBA
_0819ADA6:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0819ADBA
	movs r0, #5
	bl PlaySE
	movs r0, #1
	bl Select_UpdateYesNoCursorPosition
_0819ADBA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Task_HandleSelectionScreenYesNo

	thumb_func_start Task_HandleSelectionScreenMenu
Task_HandleSelectionScreenMenu: @ 0x0819ADC4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0819ADF0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	subs r0, #2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r6, r1, #0
	cmp r0, #0xb
	bls _0819ADE4
	b _0819B00E
_0819ADE4:
	lsls r0, r0, #2
	ldr r1, _0819ADF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819ADF0: .4byte 0x03005B60
_0819ADF4: .4byte 0x0819ADF8
_0819ADF8: @ jump table
	.4byte _0819AE28 @ case 0
	.4byte _0819AE8C @ case 1
	.4byte _0819B00E @ case 2
	.4byte _0819B00E @ case 3
	.4byte _0819B00E @ case 4
	.4byte _0819B00E @ case 5
	.4byte _0819B00E @ case 6
	.4byte _0819AE5C @ case 7
	.4byte _0819B00E @ case 8
	.4byte _0819B00E @ case 9
	.4byte _0819AFA0 @ case 10
	.4byte _0819AFFC @ case 11
_0819AE28:
	ldr r0, _0819AE50
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0819AE42
	ldr r2, _0819AE54
	adds r0, r1, r2
	movs r7, #0xa8
	lsls r7, r7, #2
	adds r1, r1, r7
	movs r2, #0
	bl sub_0819F1A0
_0819AE42:
	ldr r0, _0819AE58
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #9
	b _0819B00C
	.align 2, 0
_0819AE50: .4byte 0x03001278
_0819AE54: .4byte 0x00000299
_0819AE58: .4byte 0x03005B60
_0819AE5C:
	ldr r4, _0819AE84
	ldr r0, [r4]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0819AE6E
	b _0819B00E
_0819AE6E:
	bl Select_ShowMenuOptions
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #6]
	ldr r1, _0819AE88
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	b _0819AFE4
	.align 2, 0
_0819AE84: .4byte 0x03001278
_0819AE88: .4byte 0x03005B60
_0819AE8C:
	ldr r2, _0819AEBC
	ldrh r1, [r2, #0x2e]
	movs r7, #1
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0819AF1C
	movs r0, #5
	bl PlaySE
	bl Select_RunMenuOptionFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	bne _0819AEC8
	ldr r0, _0819AEC0
	ldr r0, [r0]
	ldr r2, _0819AEC4
	adds r0, r0, r2
	b _0819AF4C
	.align 2, 0
_0819AEBC: .4byte 0x03002360
_0819AEC0: .4byte 0x03001278
_0819AEC4: .4byte 0x000002A2
_0819AEC8:
	cmp r0, #2
	bne _0819AEE8
	ldr r1, _0819AEE0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xa
	strh r1, [r0, #8]
	ldr r1, _0819AEE4
	str r1, [r0]
	b _0819B00E
	.align 2, 0
_0819AEE0: .4byte 0x03005B60
_0819AEE4: .4byte 0x0819ACCD
_0819AEE8:
	cmp r1, #3
	bne _0819AF00
	ldr r1, _0819AEFC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xb
	strh r1, [r0, #8]
	b _0819AF5A
	.align 2, 0
_0819AEFC: .4byte 0x03005B60
_0819AF00:
	ldr r1, _0819AF14
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #6
	strh r1, [r0, #8]
	ldr r1, _0819AF18
	str r1, [r0]
	b _0819B00E
	.align 2, 0
_0819AF14: .4byte 0x03005B60
_0819AF18: .4byte 0x0819AAA9
_0819AF1C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0819AF70
	movs r0, #5
	bl PlaySE
	ldr r4, _0819AF60
	ldr r1, [r4]
	movs r2, #0xa6
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, #8
	adds r1, r1, r2
	movs r2, #0
	bl sub_0819F2E4
	movs r0, #3
	bl sub_0819B5F8
	ldr r0, [r4]
	ldr r1, _0819AF64
	adds r0, r0, r1
_0819AF4C:
	strb r7, [r0]
	ldr r1, _0819AF68
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #8]
_0819AF5A:
	ldr r1, _0819AF6C
	str r1, [r0]
	b _0819B00E
	.align 2, 0
_0819AF60: .4byte 0x03001278
_0819AF64: .4byte 0x000002A2
_0819AF68: .4byte 0x03005B60
_0819AF6C: .4byte 0x0819B019
_0819AF70:
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0819AF8A
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	bl Select_UpdateMenuCursorPosition
	b _0819B00E
_0819AF8A:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0819B00E
	movs r0, #5
	bl PlaySE
	movs r0, #1
	bl Select_UpdateMenuCursorPosition
	b _0819B00E
_0819AFA0:
	ldr r0, _0819AFEC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0819B00E
	ldr r4, _0819AFF0
	ldr r2, [r4]
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _0819AFD8
	ldr r1, _0819AFF4
	movs r7, #0xa9
	lsls r7, r7, #2
	adds r0, r2, r7
	ldrh r0, [r0]
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r1, r1, r2
	strh r0, [r1]
	ldr r0, _0819AFF8
	subs r7, #0xbc
	adds r1, r0, r7
	ldrh r1, [r1]
	adds r0, r0, r2
	strh r1, [r0]
_0819AFD8:
	ldr r0, [r4]
	strb r3, [r0, #6]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r6
_0819AFE4:
	movs r1, #3
	strh r1, [r0, #8]
	b _0819B00E
	.align 2, 0
_0819AFEC: .4byte 0x02037C74
_0819AFF0: .4byte 0x03001278
_0819AFF4: .4byte 0x020377B4
_0819AFF8: .4byte 0x020373B4
_0819AFFC:
	bl Select_ShowMenuOptions
	ldr r0, _0819B014
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xc
_0819B00C:
	strh r0, [r1, #8]
_0819B00E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819B014: .4byte 0x03005B60
	thumb_func_end Task_HandleSelectionScreenMenu

	thumb_func_start Task_HandleSelectionScreenChooseMons
Task_HandleSelectionScreenChooseMons: @ 0x0819B018
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r5, _0819B04C
	ldr r3, [r5]
	movs r7, #0xa8
	lsls r7, r7, #2
	adds r0, r3, r7
	ldrb r0, [r0]
	cmp r0, #1
	beq _0819B116
	ldr r1, _0819B050
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _0819B07C
	cmp r1, #1
	bgt _0819B054
	cmp r1, #0
	beq _0819B05A
	b _0819B116
	.align 2, 0
_0819B04C: .4byte 0x03001278
_0819B050: .4byte 0x03005B60
_0819B054:
	cmp r1, #0xb
	beq _0819B0E0
	b _0819B116
_0819B05A:
	ldr r0, _0819B074
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0819B116
	movs r0, #1
	movs r1, #1
	strh r1, [r4, #8]
	ldr r2, _0819B078
	adds r1, r3, r2
	strb r0, [r1]
	b _0819B116
	.align 2, 0
_0819B074: .4byte 0x02037C74
_0819B078: .4byte 0x000002A2
_0819B07C:
	ldr r2, _0819B0A0
	ldrh r0, [r2, #0x2e]
	ands r1, r0
	cmp r1, #0
	beq _0819B0AC
	movs r0, #5
	bl PlaySE
	ldr r0, [r5]
	ldr r1, _0819B0A4
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #2
	strh r0, [r4, #8]
	ldr r0, _0819B0A8
	str r0, [r4]
	b _0819B116
	.align 2, 0
_0819B0A0: .4byte 0x03002360
_0819B0A4: .4byte 0x000002A2
_0819B0A8: .4byte 0x0819ADC5
_0819B0AC:
	ldrh r1, [r2, #0x30]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0819B0C2
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	b _0819B0D2
_0819B0C2:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0819B116
	movs r0, #5
	bl PlaySE
	movs r0, #1
_0819B0D2:
	bl Select_UpdateBallCursorPosition
	bl Select_PrintMonCategory
	bl Select_PrintMonSpecies
	b _0819B116
_0819B0E0:
	ldr r0, _0819B11C
	ldrh r1, [r0, #0x2e]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0819B116
	movs r0, #5
	bl PlaySE
	ldr r1, [r5]
	movs r2, #0xa6
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	adds r1, r1, r7
	movs r2, #0
	bl sub_0819F2E4
	bl Select_PrintSelectMonString
	ldr r0, [r5]
	ldr r1, _0819B120
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	strh r6, [r4, #8]
_0819B116:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819B11C: .4byte 0x03002360
_0819B120: .4byte 0x000002A2
	thumb_func_end Task_HandleSelectionScreenChooseMons

	thumb_func_start CreateFrontierFactorySelectableMons
CreateFrontierFactorySelectableMons: @ 0x0819B124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r6, #0
	add r0, sp, #0xc
	strb r6, [r0]
	ldr r0, _0819B1F4
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r7, _0819B1F8
	ldr r2, [r7]
	ldr r0, _0819B1FC
	adds r4, r2, r0
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	adds r5, r0, #0
	lsls r0, r5, #1
	lsls r1, r6, #2
	adds r0, r0, r1
	ldr r1, _0819B200
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r2]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r1, _0819B204
	ldr r0, _0819B208
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, #3
	ands r0, r1
	movs r2, #0x32
	str r2, [sp, #0x14]
	cmp r0, #0
	beq _0819B18A
	movs r3, #0x64
	str r3, [sp, #0x14]
_0819B18A:
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetNumPastRentalsRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	ldr r1, [r7]
	ldrb r0, [r1, #0xa]
	mov sb, r0
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #8
	mov r2, sb
	orrs r2, r0
	ldrb r0, [r1, #0xc]
	lsls r0, r0, #0x10
	orrs r2, r0
	ldrb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	orrs r2, r0
	mov sb, r2
	movs r3, #0
	mov r8, r3
_0819B1B8:
	ldr r0, _0819B1F8
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r3, #0xe7
	lsls r3, r3, #4
	adds r1, r1, r3
	ldrh r5, [r1]
	ldr r0, _0819B20C
	ldr r1, [r0]
	ldr r2, [sp, #0x10]
	add r2, r8
	movs r3, #0x6c
	adds r0, r2, #0
	muls r0, r3, r0
	adds r1, r1, r0
	strh r5, [r1, #0xc]
	mov sl, r2
	ldr r0, [sp, #0x1c]
	cmp r8, r0
	bhs _0819B210
	ldr r0, [sp, #0x18]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0819B212
	.align 2, 0
_0819B1F4: .4byte 0x000040CE
_0819B1F8: .4byte 0x03005AF0
_0819B1FC: .4byte 0x00000CA9
_0819B200: .4byte 0x00000DE2
_0819B204: .4byte 0x0203B958
_0819B208: .4byte 0x085B8700
_0819B20C: .4byte 0x03001278
_0819B210:
	ldr r0, [sp, #0x18]
_0819B212:
	movs r1, #0
	bl GetFactoryMonFixedIV
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r1, #0x6c
	mov r4, sl
	muls r4, r1, r4
	adds r4, #0xc
	ldr r2, _0819B2D0
	ldr r0, [r2]
	adds r0, r0, r4
	adds r0, #8
	ldr r1, _0819B2D4
	ldr r2, [r1]
	lsls r5, r5, #4
	adds r2, r5, r2
	ldrh r1, [r2]
	ldrb r3, [r2, #0xc]
	str r6, [sp]
	ldrb r2, [r2, #0xb]
	str r2, [sp, #4]
	mov r2, sb
	str r2, [sp, #8]
	ldr r2, [sp, #0x14]
	bl CreateMonWithEVSpreadNatureOTID
	movs r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
	movs r6, #0
	adds r7, r5, #0
	movs r3, #1
	add r8, r3
	ldr r3, _0819B2D0
_0819B258:
	ldr r0, [r3]
	adds r0, r0, r4
	adds r0, #8
	ldr r5, _0819B2D4
	ldr r1, [r5]
	adds r1, r7, r1
	lsls r2, r6, #1
	adds r1, #2
	adds r1, r1, r2
	ldrh r1, [r1]
	adds r2, r6, #0
	str r3, [sp, #0x20]
	bl SetMonMoveAvoidReturn
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x20]
	cmp r6, #3
	bls _0819B258
	movs r0, #0x6c
	mov r4, sl
	muls r4, r0, r4
	adds r4, #0xc
	ldr r1, _0819B2D0
	ldr r0, [r1]
	adds r0, r0, r4
	adds r0, #8
	movs r1, #0x20
	add r2, sp, #0xc
	bl SetMonData
	ldr r2, _0819B2D0
	ldr r0, [r2]
	adds r0, r0, r4
	adds r0, #8
	ldr r1, [r5]
	adds r1, r7, r1
	ldrb r2, [r1, #0xa]
	lsls r2, r2, #1
	ldr r1, _0819B2D8
	adds r2, r2, r1
	movs r1, #0xc
	bl SetMonData
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #5
	bhi _0819B2C0
	b _0819B1B8
_0819B2C0:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819B2D0: .4byte 0x03001278
_0819B2D4: .4byte 0x0203B958
_0819B2D8: .4byte 0x085ADBF4
	thumb_func_end CreateFrontierFactorySelectableMons

	thumb_func_start CreateTentFactorySelectableMons
CreateTentFactorySelectableMons: @ 0x0819B2DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	add r0, sp, #0xc
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0819B3F0
	ldr r0, _0819B3F4
	str r0, [r2]
	ldr r0, _0819B3F8
	ldr r1, [r0]
	ldrb r3, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #8
	orrs r3, r0
	ldrb r0, [r1, #0xc]
	lsls r0, r0, #0x10
	orrs r3, r0
	ldrb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	orrs r3, r0
	mov sl, r3
	movs r7, #0
	mov sb, r7
_0819B318:
	ldr r0, _0819B3F8
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r3, #0xe7
	lsls r3, r3, #4
	adds r1, r1, r3
	ldrh r1, [r1]
	mov r8, r1
	ldr r7, _0819B3FC
	ldr r0, [r7]
	ldr r6, [sp, #0x10]
	add r6, sb
	movs r1, #0x6c
	adds r4, r6, #0
	muls r4, r1, r4
	adds r1, r0, r4
	mov r2, r8
	strh r2, [r1, #0xc]
	adds r4, #0xc
	adds r0, r0, r4
	adds r0, #8
	ldr r3, _0819B3F0
	ldr r2, [r3]
	mov r7, r8
	lsls r5, r7, #4
	adds r2, r5, r2
	ldrh r1, [r2]
	ldrb r3, [r2, #0xc]
	movs r7, #0
	str r7, [sp]
	ldrb r2, [r2, #0xb]
	str r2, [sp, #4]
	mov r2, sl
	str r2, [sp, #8]
	movs r2, #0x1e
	bl CreateMonWithEVSpreadNatureOTID
	add r0, sp, #0xc
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	add sb, r0
_0819B374:
	ldr r1, _0819B3FC
	ldr r0, [r1]
	adds r0, r0, r4
	adds r0, #8
	ldr r3, _0819B3F0
	ldr r2, [r3]
	mov r3, r8
	lsls r1, r3, #4
	adds r1, r1, r2
	lsls r2, r7, #1
	adds r1, #2
	adds r1, r1, r2
	ldrh r1, [r1]
	adds r2, r7, #0
	bl SetMonMoveAvoidReturn
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _0819B374
	movs r7, #0x6c
	adds r4, r6, #0
	muls r4, r7, r4
	adds r4, #0xc
	ldr r1, _0819B3FC
	ldr r0, [r1]
	adds r0, r0, r4
	adds r0, #8
	movs r1, #0x20
	add r2, sp, #0xc
	bl SetMonData
	ldr r2, _0819B3FC
	ldr r0, [r2]
	adds r0, r0, r4
	adds r0, #8
	ldr r3, _0819B3F0
	ldr r1, [r3]
	adds r1, r5, r1
	ldrb r2, [r1, #0xa]
	lsls r2, r2, #1
	ldr r1, _0819B400
	adds r2, r2, r1
	movs r1, #0xc
	bl SetMonData
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #5
	bls _0819B318
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819B3F0: .4byte 0x0203B958
_0819B3F4: .4byte 0x085BCF70
_0819B3F8: .4byte 0x03005AF0
_0819B3FC: .4byte 0x03001278
_0819B400: .4byte 0x085ADBF4
	thumb_func_end CreateTentFactorySelectableMons

	thumb_func_start Select_CopyMonsToPlayerParty
Select_CopyMonsToPlayerParty: @ 0x0819B404
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r7, #0
	ldr r0, _0819B4A4
	mov sl, r0
	ldr r1, _0819B4A8
	mov r8, r1
_0819B418:
	movs r2, #0
	adds r0, r7, #1
	mov sb, r0
_0819B41E:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #0x6c
	adds r6, r2, #0
	muls r6, r1, r6
	adds r1, r0, r6
	ldrb r0, [r1, #0x10]
	cmp r0, sb
	bne _0819B4BC
	movs r0, #0x64
	adds r5, r7, #0
	muls r5, r0, r5
	ldr r2, _0819B4AC
	adds r5, r5, r2
	adds r1, #0x14
	adds r0, r5, #0
	movs r2, #0x64
	bl memcpy
	mov r0, r8
	ldr r1, [r0]
	lsls r4, r7, #1
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r1, r1, r4
	mov r2, sl
	ldr r0, [r2]
	adds r0, r0, r6
	ldrh r0, [r0, #0xc]
	movs r2, #0xe7
	lsls r2, r2, #4
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	mov r2, r8
	ldr r1, [r2]
	ldr r2, _0819B4B0
	adds r1, r1, r2
	adds r1, r1, r4
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #0x2e
	movs r2, #0
	bl GetBoxMonData
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	ldr r2, _0819B4B4
	adds r1, r1, r2
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0
	bl GetBoxMonData
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	ldr r2, _0819B4B8
	adds r1, r1, r2
	strb r0, [r1]
	b _0819B4C6
	.align 2, 0
_0819B4A4: .4byte 0x03001278
_0819B4A8: .4byte 0x03005AF0
_0819B4AC: .4byte 0x02024190
_0819B4B0: .4byte 0x00000E74
_0819B4B4: .4byte 0x00000E79
_0819B4B8: .4byte 0x00000E78
_0819B4BC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _0819B41E
_0819B4C6:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _0819B418
	bl CalculatePlayerPartyCount
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Select_CopyMonsToPlayerParty

	thumb_func_start Select_ShowMenuOptions
Select_ShowMenuOptions: @ 0x0819B4E4
	push {r4, r5, lr}
	ldr r5, _0819B56C
	ldr r1, [r5]
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0819B4F2
	strb r0, [r1]
_0819B4F2:
	ldr r4, _0819B570
	ldr r2, [r5]
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xb0
	strh r1, [r0, #0x20]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	ldrb r1, [r2, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xd0
	strh r1, [r0, #0x20]
	ldrb r0, [r2, #2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	bl Select_PrintMenuOptions
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819B56C: .4byte 0x03001278
_0819B570: .4byte 0x020205AC
	thumb_func_end Select_ShowMenuOptions

	thumb_func_start Select_ShowYesNoOptions
Select_ShowYesNoOptions: @ 0x0819B574
	push {r4, r5, lr}
	ldr r5, _0819B5F0
	ldr r1, [r5]
	movs r0, #0
	strb r0, [r1, #7]
	ldr r4, _0819B5F4
	ldr r2, [r5]
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xb0
	strh r1, [r0, #0x20]
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r3, #0x70
	strh r3, [r0, #0x22]
	ldrb r1, [r2, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xd0
	strh r1, [r0, #0x20]
	ldrb r1, [r2, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r3, [r0, #0x22]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	bl Select_PrintYesNoOptions
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819B5F0: .4byte 0x03001278
_0819B5F4: .4byte 0x020205AC
	thumb_func_end Select_ShowYesNoOptions

	thumb_func_start sub_0819B5F8
sub_0819B5F8: @ 0x0819B5F8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0819B64C
	ldr r3, _0819B650
	ldr r0, [r3]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	adds r0, r4, #0
	bl ClearWindowTilemap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819B64C: .4byte 0x020205AC
_0819B650: .4byte 0x03001278
	thumb_func_end sub_0819B5F8

	thumb_func_start Select_PrintRentalPkmnString
Select_PrintRentalPkmnString: @ 0x0819B654
	push {lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r2, _0819B684
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819B684: .4byte 0x085DBB98
	thumb_func_end Select_PrintRentalPkmnString

	thumb_func_start Select_PrintMonSpecies
Select_PrintMonSpecies: @ 0x0819B688
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _0819B6F8
	ldr r0, [r5]
	ldrb r4, [r0, #3]
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0x6c
	muls r0, r4, r0
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, #0x14
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0819B6FC
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0819B700
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #5
	subs r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldr r0, _0819B704
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized3
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819B6F8: .4byte 0x03001278
_0819B6FC: .4byte 0x02021C7C
_0819B700: .4byte 0x082EA31C
_0819B704: .4byte 0x085DBC81
	thumb_func_end Select_PrintMonSpecies

	thumb_func_start Select_PrintSelectMonString
Select_PrintSelectMonString: @ 0x0819B708
	push {lr}
	sub sp, #0xc
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0819B724
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #1
	bne _0819B72C
	ldr r2, _0819B728
	b _0819B740
	.align 2, 0
_0819B724: .4byte 0x03001278
_0819B728: .4byte 0x085DBBA1
_0819B72C:
	cmp r0, #2
	bne _0819B738
	ldr r2, _0819B734
	b _0819B740
	.align 2, 0
_0819B734: .4byte 0x085DBBB5
_0819B738:
	ldr r2, _0819B764
	cmp r0, #3
	bne _0819B740
	ldr r2, _0819B768
_0819B740:
	movs r0, #5
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r3, #4
	bl AddTextPrinterParameterized
	movs r0, #2
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819B764: .4byte 0x085DBBF6
_0819B768: .4byte 0x085DBBC9
	thumb_func_end Select_PrintSelectMonString

	thumb_func_start Select_PrintCantSelectSameMon
Select_PrintCantSelectSameMon: @ 0x0819B76C
	push {lr}
	sub sp, #0xc
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r2, _0819B79C
	movs r0, #5
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r3, #4
	bl AddTextPrinterParameterized
	movs r0, #2
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819B79C: .4byte 0x085DBC11
	thumb_func_end Select_PrintCantSelectSameMon

	thumb_func_start Select_PrintMenuOptions
Select_PrintMenuOptions: @ 0x0819B7A0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0819B7F4
	ldr r0, [r0]
	ldrb r2, [r0, #3]
	movs r1, #0x6c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r5, [r0, #0x10]
	movs r0, #3
	bl PutWindowTilemap
	movs r0, #3
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r4, _0819B7F8
	str r4, [sp]
	movs r6, #0
	str r6, [sp, #4]
	ldr r0, _0819B7FC
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	cmp r5, #0
	beq _0819B804
	str r4, [sp]
	str r6, [sp, #4]
	ldr r0, _0819B800
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	b _0819B818
	.align 2, 0
_0819B7F4: .4byte 0x03001278
_0819B7F8: .4byte 0x085DBC7E
_0819B7FC: .4byte 0x085DBBE4
_0819B800: .4byte 0x085DBBF2
_0819B804:
	str r4, [sp]
	str r5, [sp, #4]
	ldr r0, _0819B840
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	movs r3, #0x12
	bl AddTextPrinterParameterized3
_0819B818:
	ldr r0, _0819B844
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819B848
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #0
	movs r3, #0x22
	bl AddTextPrinterParameterized3
	movs r0, #3
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819B840: .4byte 0x085DBBDD
_0819B844: .4byte 0x085DBC7E
_0819B848: .4byte 0x085DBBEB
	thumb_func_end Select_PrintMenuOptions

	thumb_func_start Select_PrintYesNoOptions
Select_PrintYesNoOptions: @ 0x0819B84C
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #4
	bl PutWindowTilemap
	movs r0, #4
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r5, _0819B89C
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r0, _0819B8A0
	str r0, [sp, #8]
	movs r0, #4
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	ldr r0, _0819B8A4
	str r0, [sp, #8]
	movs r0, #4
	movs r1, #1
	movs r2, #0
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	movs r0, #4
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819B89C: .4byte 0x085DBC7E
_0819B8A0: .4byte 0x085DBC0A
_0819B8A4: .4byte 0x085DBC0D
	thumb_func_end Select_PrintYesNoOptions

	thumb_func_start Select_RunMenuOptionFunc
Select_RunMenuOptionFunc: @ 0x0819B8A8
	push {lr}
	ldr r2, _0819B8C8
	ldr r1, _0819B8CC
	ldr r0, _0819B8D0
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	bl _call_via_r0
	thumb_func_end Select_RunMenuOptionFunc

	thumb_func_start sub_0819B8C0
sub_0819B8C0: @ 0x0819B8C0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0819B8C8: .4byte 0x03006028
_0819B8CC: .4byte 0x085DBC24
_0819B8D0: .4byte 0x03001278
	thumb_func_end sub_0819B8C0

	thumb_func_start Select_OptionRentDeselect
Select_OptionRentDeselect: @ 0x0819B8D4
	push {r4, lr}
	ldr r0, _0819B900
	ldr r0, [r0]
	ldrb r2, [r0, #3]
	movs r1, #0x6c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	ldrh r0, [r0, #0xc]
	cmp r1, #0
	bne _0819B904
	bl Select_AreSpeciesValid
	cmp r0, #0
	bne _0819B904
	bl Select_PrintCantSelectSameMon
	movs r0, #3
	bl sub_0819B5F8
	movs r0, #3
	b _0819B93A
	.align 2, 0
_0819B900: .4byte 0x03001278
_0819B904:
	ldr r4, _0819B934
	ldr r1, [r4]
	movs r2, #0xa6
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, #8
	adds r1, r1, r2
	movs r2, #0
	bl sub_0819F2E4
	bl Select_HandleMonSelectionChange
	bl Select_PrintSelectMonString
	movs r0, #3
	bl sub_0819B5F8
	ldr r0, [r4]
	ldrb r0, [r0, #5]
	cmp r0, #3
	bhi _0819B938
	movs r0, #1
	b _0819B93A
	.align 2, 0
_0819B934: .4byte 0x03001278
_0819B938:
	movs r0, #2
_0819B93A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Select_OptionRentDeselect

	thumb_func_start sub_0819B940
sub_0819B940: @ 0x0819B940
	push {lr}
	bl sub_0819C250
	bl Select_HandleMonSelectionChange
	bl Select_PrintSelectMonString
	movs r0, #3
	bl sub_0819B5F8
	ldr r0, _0819B964
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #3
	bhi _0819B968
	movs r0, #1
	b _0819B96A
	.align 2, 0
_0819B964: .4byte 0x03001278
_0819B968:
	movs r0, #2
_0819B96A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0819B940

	thumb_func_start Select_OptionSummary
Select_OptionSummary: @ 0x0819B970
	movs r0, #0
	bx lr
	thumb_func_end Select_OptionSummary

	thumb_func_start Select_OptionOthers
Select_OptionOthers: @ 0x0819B974
	push {lr}
	ldr r0, _0819B998
	ldr r1, [r0]
	movs r2, #0xa6
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, #8
	adds r1, r1, r2
	movs r2, #0
	bl sub_0819F2E4
	movs r0, #3
	bl sub_0819B5F8
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0819B998: .4byte 0x03001278
	thumb_func_end Select_OptionOthers

	thumb_func_start Select_PrintMonCategory
Select_PrintMonCategory: @ 0x0819B99C
	push {r4, r5, lr}
	sub sp, #0x18
	ldr r5, _0819BA4C
	ldr r0, [r5]
	ldrb r4, [r0, #3]
	cmp r4, #5
	bhi _0819BA44
	movs r0, #5
	bl PutWindowTilemap
	movs r0, #5
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0x6c
	muls r0, r4, r0
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, #0x14
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	ldr r2, _0819BA50
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0819BA0E
	adds r3, r2, #0
	adds r2, r1, #0
_0819B9EC:
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	adds r0, r4, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0819BA0E
	adds r0, r4, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0819B9EC
_0819BA0E:
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0819BA54
	add r0, sp, #0xc
	bl StringAppend
	movs r3, #5
	subs r3, r3, r4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #5
	movs r1, #1
	add r2, sp, #0xc
	bl AddTextPrinterParameterized
	movs r0, #5
	movs r1, #2
	bl CopyWindowToVram
_0819BA44:
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819BA4C: .4byte 0x03001278
_0819BA50: .4byte 0x0854069C
_0819BA54: .4byte 0x085C8C66
	thumb_func_end Select_PrintMonCategory

	thumb_func_start Summary_ShowMonSprite
Summary_ShowMonSprite: @ 0x0819BA58
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	ldr r6, _0819BAFC
	ldr r2, [r6]
	ldrb r1, [r2, #3]
	movs r0, #0x6c
	adds r4, r1, #0
	muls r4, r0, r4
	adds r4, r4, r2
	adds r4, #0x14
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	mov r8, r0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	movs r0, #0x58
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r0, _0819BB00
	str r0, [sp, #0xc]
	adds r0, r5, #0
	mov r2, r8
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	ldr r1, [r6]
	movs r2, #0xa6
	lsls r2, r2, #2
	adds r1, r1, r2
	movs r3, #0
	strb r0, [r1]
	ldr r4, _0819BB04
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x28
	strb r3, [r0]
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x29
	strb r3, [r0]
	ldr r0, [r6]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	strb r3, [r0]
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819BAFC: .4byte 0x03001278
_0819BB00: .4byte 0x0000FFFF
_0819BB04: .4byte 0x020205AC
	thumb_func_end Summary_ShowMonSprite

	thumb_func_start sub_0819BB08
sub_0819BB08: @ 0x0819BB08
	ldr r1, _0819BB18
	ldr r1, [r1]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r1, r1, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0819BB18: .4byte 0x03001278
	thumb_func_end sub_0819BB08

	thumb_func_start Select_ShowSummaryMonSprite
Select_ShowSummaryMonSprite: @ 0x0819BB1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0819BC00
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #1
	bl CreateSprite
	ldr r6, _0819BC04
	ldr r1, [r6]
	ldr r2, _0819BC08
	mov sl, r2
	add r1, sl
	movs r7, #0
	strb r0, [r1]
	ldr r0, [r6]
	add r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0819BC0C
	mov r8, r1
	add r0, r8
	movs r1, #2
	bl StartSpriteAffineAnim
	ldr r2, [r6]
	ldrb r1, [r2, #3]
	movs r0, #0x6c
	adds r4, r1, #0
	muls r4, r0, r4
	adds r4, r4, r2
	adds r4, #0x14
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	mov sb, r0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	movs r0, #0x58
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r0, _0819BC10
	str r0, [sp, #0xc]
	adds r0, r5, #0
	mov r2, sb
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	ldr r1, [r6]
	movs r2, #0xa6
	lsls r2, r2, #2
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x28
	strb r7, [r0]
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x29
	strb r7, [r0]
	ldr r0, [r6]
	add r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819BC00: .4byte 0x085DBE40
_0819BC04: .4byte 0x03001278
_0819BC08: .4byte 0x00000299
_0819BC0C: .4byte 0x020205AC
_0819BC10: .4byte 0x0000FFFF
	thumb_func_end Select_ShowSummaryMonSprite

	thumb_func_start Select_ShowChosenMonsSprites
Select_ShowChosenMonsSprites: @ 0x0819BC14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r7, #0
	ldr r0, _0819BCE4
	mov sb, r0
_0819BC26:
	movs r2, #0
	adds r1, r7, #1
	mov sl, r1
	lsls r0, r7, #2
	mov r8, r0
_0819BC30:
	mov r0, sb
	ldr r1, [r0]
	movs r0, #0x6c
	adds r4, r2, #0
	muls r4, r0, r4
	adds r0, r1, r4
	ldrb r0, [r0, #0x10]
	cmp r0, sl
	bne _0819BCF0
	adds r4, r4, r1
	adds r4, #0x14
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #0x13
	movs r2, #0x80
	lsls r2, r2, #0xd
	adds r0, r0, r2
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r0, #0xd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, _0819BCE8
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	mov r2, sb
	ldr r1, [r2]
	add r1, r8
	movs r2, #0xa5
	lsls r2, r2, #2
	adds r1, r1, r2
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	add r0, r8
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0819BCEC
	adds r0, r0, r2
	adds r0, #0x28
	movs r1, #0
	strb r1, [r0]
	mov r2, sb
	ldr r0, [r2]
	add r0, r8
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0819BCEC
	adds r0, r0, r2
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	b _0819BCFA
	.align 2, 0
_0819BCE4: .4byte 0x03001278
_0819BCE8: .4byte 0x0000FFFF
_0819BCEC: .4byte 0x020205AC
_0819BCF0:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _0819BC30
_0819BCFA:
	mov r2, sl
	lsls r0, r2, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _0819BC26
	ldr r0, _0819BD24
	ldr r0, [r0]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819BD24: .4byte 0x03001278
	thumb_func_end Select_ShowChosenMonsSprites

	thumb_func_start sub_0819BD28
sub_0819BD28: @ 0x0819BD28
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0819BDC4
	ldr r3, _0819BDCC
	ldr r6, _0819BDD0
	ldr r2, [r6]
	ldr r0, _0819BDD4
	adds r5, r2, r0
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r1, #0x3f
	ldrb r0, [r1]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _0819BDC4
	ldr r1, _0819BDD8
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _0819BDC4
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, _0819BDD8
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0819BDDC
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819BDE0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	ldr r0, _0819BDE4
	str r0, [r4, #0x1c]
_0819BDC4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819BDCC: .4byte 0x020205AC
_0819BDD0: .4byte 0x03001278
_0819BDD4: .4byte 0x00000295
_0819BDD8: .4byte 0x0000029D
_0819BDDC: .4byte 0x0819BEB9
_0819BDE0: .4byte 0x03005B60
_0819BDE4: .4byte 0x08007141
	thumb_func_end sub_0819BD28

	thumb_func_start sub_0819BDE8
sub_0819BDE8: @ 0x0819BDE8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0819BEA2
	ldr r6, _0819BEA8
	ldr r4, _0819BEAC
	ldr r2, [r4]
	ldr r7, _0819BEB0
	adds r0, r2, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _0819BEA2
	ldr r1, _0819BEB4
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _0819BEA2
	ldrb r0, [r5, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldr r0, [r4]
	adds r0, r0, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldr r0, [r4]
	ldr r1, _0819BEB4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldr r0, [r4]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r0, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	ldr r0, [r4]
	ldr r1, _0819BEB4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	adds r0, r5, #0
	bl DestroySprite
_0819BEA2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819BEA8: .4byte 0x020205AC
_0819BEAC: .4byte 0x03001278
_0819BEB0: .4byte 0x00000295
_0819BEB4: .4byte 0x0000029D
	thumb_func_end sub_0819BDE8

	thumb_func_start sub_0819BEB8
sub_0819BEB8: @ 0x0819BEB8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0819BEDC
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0819BF36
	cmp r0, #1
	bgt _0819BEE0
	cmp r0, #0
	beq _0819BEE6
	b _0819BFA2
	.align 2, 0
_0819BEDC: .4byte 0x03005B60
_0819BEE0:
	cmp r0, #2
	beq _0819BF58
	b _0819BFA2
_0819BEE6:
	movs r0, #0x10
	strh r0, [r4, #0xe]
	movs r0, #0xe0
	strh r0, [r4, #0x38]
	movs r0, #0x40
	strh r0, [r4, #0x12]
	movs r0, #0x41
	strh r0, [r4, #0x18]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x38]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x37
	bl SetGpuReg
	b _0819BFAE
_0819BF36:
	movs r0, #3
	bl ShowBg
	ldr r1, _0819BF50
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _0819BF54
	movs r0, #0x52
	bl SetGpuReg
	b _0819BFAE
	.align 2, 0
_0819BF50: .4byte 0x00001248
_0819BF54: .4byte 0x0000040B
_0819BF58:
	ldrh r0, [r4, #0x12]
	subs r0, #4
	strh r0, [r4, #0x12]
	ldrh r1, [r4, #0x18]
	adds r1, #4
	strh r1, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _0819BF74
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5f
	ble _0819BF86
_0819BF74:
	movs r0, #0x20
	strh r0, [r4, #0x12]
	movs r0, #0x60
	strh r0, [r4, #0x18]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
_0819BF86:
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _0819BFB4
	b _0819BFAE
_0819BFA2:
	adds r0, r2, #0
	bl DestroyTask
	bl Select_ShowChosenMonsSprites
	b _0819BFB4
_0819BFAE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0819BFB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819BEB8

	thumb_func_start sub_0819BFBC
sub_0819BFBC: @ 0x0819BFBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _0819C0D8
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0819BFDE
	b _0819C0F8
_0819BFDE:
	cmp r0, #1
	bne _0819BFE4
	b _0819C148
_0819BFE4:
	movs r0, #3
	bl HideBg
	ldr r4, _0819C0DC
	ldr r0, _0819C0E0
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _0819C0E4
	mov ip, r1
	add r0, ip
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r3, #5
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r2
	strb r0, [r1]
	mov r0, r8
	ldr r2, [r0]
	mov r1, ip
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r6, r4, #0
	adds r6, #0x1c
	adds r0, r0, r6
	ldr r1, _0819C0E8
	str r1, [r0]
	ldr r0, _0819C0EC
	mov sb, r0
	add r2, sb
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r0]
	mov r1, r8
	ldr r2, [r1]
	mov r1, sb
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, _0819C0F0
	mov sl, r1
	str r1, [r0]
	ldr r5, _0819C0F4
	adds r2, r2, r5
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	mov r0, r8
	ldr r2, [r0]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, sl
	str r1, [r0]
	add r2, ip
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAffineAnim
	mov r1, r8
	ldr r0, [r1]
	add r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAffineAnim
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAffineAnim
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
	adds r0, r7, #0
	bl DestroyTask
	b _0819C18C
	.align 2, 0
_0819C0D8: .4byte 0x03005B60
_0819C0DC: .4byte 0x020205AC
_0819C0E0: .4byte 0x03001278
_0819C0E4: .4byte 0x00000299
_0819C0E8: .4byte 0x0819BDE9
_0819C0EC: .4byte 0x00000295
_0819C0F0: .4byte 0x08007141
_0819C0F4: .4byte 0x0000029D
_0819C0F8:
	movs r0, #0x10
	strh r0, [r4, #0xe]
	movs r0, #0xe0
	strh r0, [r4, #0x38]
	movs r0, #0x20
	strh r0, [r4, #0x12]
	movs r0, #0x60
	strh r0, [r4, #0x18]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x38]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x37
	bl SetGpuReg
	b _0819C186
_0819C148:
	ldrh r0, [r4, #0x12]
	adds r0, #4
	strh r0, [r4, #0x12]
	ldrh r1, [r4, #0x18]
	subs r1, #4
	strh r1, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	bgt _0819C164
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x41
	bgt _0819C16C
_0819C164:
	movs r0, #0x40
	strh r0, [r4, #0x12]
	movs r0, #0x41
	strh r0, [r4, #0x18]
_0819C16C:
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	bne _0819C18C
_0819C186:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0819C18C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819BFBC

	thumb_func_start sub_0819C19C
sub_0819C19C: @ 0x0819C19C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _0819C230
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #1
	bl CreateSprite
	ldr r6, _0819C234
	ldr r1, [r6]
	ldr r2, _0819C238
	mov r8, r2
	add r1, r8
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2c
	movs r2, #0x40
	movs r3, #1
	bl CreateSprite
	ldr r1, [r6]
	ldr r5, _0819C23C
	adds r1, r1, r5
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xc4
	movs r2, #0x40
	movs r3, #1
	bl CreateSprite
	ldr r1, [r6]
	ldr r4, _0819C240
	adds r1, r1, r4
	strb r0, [r1]
	ldr r3, _0819C244
	ldr r2, [r6]
	add r8, r2
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, #0x1c
	adds r0, r0, r3
	ldr r1, _0819C248
	str r1, [r0]
	adds r5, r2, r5
	ldrb r1, [r5]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r5, _0819C24C
	str r5, [r0]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	str r5, [r0]
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r2, r2, r0
	movs r0, #1
	strb r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819C230: .4byte 0x085DBE40
_0819C234: .4byte 0x03001278
_0819C238: .4byte 0x00000299
_0819C23C: .4byte 0x00000295
_0819C240: .4byte 0x0000029D
_0819C244: .4byte 0x020205AC
_0819C248: .4byte 0x0819BD29
_0819C24C: .4byte 0x08007141
	thumb_func_end sub_0819C19C

	thumb_func_start sub_0819C250
sub_0819C250: @ 0x0819C250
	push {r4, lr}
	ldr r4, _0819C2AC
	ldr r0, [r4]
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	bl FreeAndDestroyMonPicSprite
	ldr r0, [r4]
	movs r1, #0xa6
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	bl FreeAndDestroyMonPicSprite
	ldr r0, [r4]
	movs r1, #0xa7
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	bl FreeAndDestroyMonPicSprite
	ldr r0, _0819C2B0
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819C2B4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	ldr r0, [r4]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819C2AC: .4byte 0x03001278
_0819C2B0: .4byte 0x0819BFBD
_0819C2B4: .4byte 0x03005B60
	thumb_func_end sub_0819C250

	thumb_func_start Select_SetWinRegs
Select_SetWinRegs: @ 0x0819C2B8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x10
	orrs r4, r6
	movs r0, #0x40
	adds r1, r4, #0
	bl SetGpuReg
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x10
	mov r0, r8
	orrs r5, r0
	movs r0, #0x44
	adds r1, r5, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x37
	bl SetGpuReg
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end Select_SetWinRegs

	thumb_func_start Select_AreSpeciesValid
Select_AreSpeciesValid: @ 0x0819C31C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	ldr r2, _0819C360
	ldr r1, [r2]
	lsrs r0, r0, #0xc
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r0, _0819C364
	ldr r0, [r0]
	ldrb r5, [r0, #5]
	movs r3, #1
	cmp r3, r5
	bhs _0819C37C
	adds r4, r0, #0
	movs r0, #0x6c
	mov ip, r0
	adds r7, r2, #0
_0819C33E:
	movs r2, #0
_0819C340:
	mov r0, ip
	muls r0, r2, r0
	adds r1, r4, r0
	ldrb r0, [r1, #0x10]
	cmp r0, r3
	bne _0819C368
	ldrh r0, [r1, #0xc]
	ldr r1, [r7]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0819C372
	movs r0, #0
	b _0819C37E
	.align 2, 0
_0819C360: .4byte 0x0203B958
_0819C364: .4byte 0x03001278
_0819C368:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _0819C340
_0819C372:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r5
	blo _0819C33E
_0819C37C:
	movs r0, #1
_0819C37E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end Select_AreSpeciesValid

	thumb_func_start Task_SelectFadeSpeciesName
Task_SelectFadeSpeciesName: @ 0x0819C384
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0819C3A8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r0, #8
	ldrsh r2, [r5, r0]
	cmp r2, #1
	beq _0819C3E0
	cmp r2, #1
	bgt _0819C3AC
	cmp r2, #0
	beq _0819C3B2
	b _0819C4C0
	.align 2, 0
_0819C3A8: .4byte 0x03005B60
_0819C3AC:
	cmp r2, #2
	beq _0819C49C
	b _0819C4C0
_0819C3B2:
	ldr r1, _0819C3D4
	ldr r0, [r1]
	ldr r3, _0819C3D8
	adds r0, r0, r3
	strb r2, [r0]
	ldr r0, [r1]
	adds r3, #1
	adds r0, r0, r3
	strb r2, [r0]
	ldr r0, [r1]
	ldr r1, _0819C3DC
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	strh r1, [r5, #8]
	b _0819C4C0
	.align 2, 0
_0819C3D4: .4byte 0x03001278
_0819C3D8: .4byte 0x000002A7
_0819C3DC: .4byte 0x000002A6
_0819C3E0:
	ldr r0, _0819C400
	ldr r3, [r0]
	ldr r2, _0819C404
	adds r1, r3, r2
	ldrb r1, [r1]
	adds r7, r0, #0
	cmp r1, #0
	beq _0819C4C0
	ldr r1, _0819C408
	adds r0, r3, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _0819C40C
	movs r0, #2
	strh r0, [r5, #8]
	b _0819C4C0
	.align 2, 0
_0819C400: .4byte 0x03001278
_0819C404: .4byte 0x000002A2
_0819C408: .4byte 0x000002A9
_0819C40C:
	ldr r2, _0819C43C
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r7]
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #6
	bls _0819C44C
	strb r4, [r1]
	ldr r1, [r7]
	subs r2, #1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0819C440
	movs r3, #0xaa
	lsls r3, r3, #2
	adds r1, r1, r3
	ldrb r0, [r1]
	subs r0, #1
	b _0819C44A
	.align 2, 0
_0819C43C: .4byte 0x000002A7
_0819C440:
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
_0819C44A:
	strb r0, [r1]
_0819C44C:
	movs r0, #0x80
	lsls r0, r0, #7
	ldr r1, [r7]
	movs r4, #0xaa
	lsls r4, r4, #2
	adds r1, r1, r4
	ldrb r1, [r1]
	movs r2, #0
	bl BlendPalettes
	ldr r2, [r7]
	adds r4, r2, r4
	ldrb r0, [r4]
	cmp r0, #5
	bls _0819C478
	ldr r3, _0819C474
	adds r1, r2, r3
	movs r0, #0
	b _0819C4BE
	.align 2, 0
_0819C474: .4byte 0x000002A6
_0819C478:
	cmp r0, #0
	bne _0819C4C0
	ldr r1, _0819C494
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0, #8]
	ldr r0, _0819C498
	adds r1, r2, r0
	movs r0, #1
	b _0819C4BE
	.align 2, 0
_0819C494: .4byte 0x03005B60
_0819C498: .4byte 0x000002A6
_0819C49C:
	ldr r0, _0819C4B4
	ldr r0, [r0]
	ldr r2, _0819C4B8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0xe
	bls _0819C4BC
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strh r0, [r5, #8]
	b _0819C4C0
	.align 2, 0
_0819C4B4: .4byte 0x03001278
_0819C4B8: .4byte 0x000002A9
_0819C4BC:
	adds r0, #1
_0819C4BE:
	strb r0, [r1]
_0819C4C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_SelectFadeSpeciesName

	thumb_func_start Swap_CB2
Swap_CB2: @ 0x0819C4C8
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Swap_CB2

	thumb_func_start Swap_VblankCb
Swap_VblankCb: @ 0x0819C4E4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Swap_VblankCb

	thumb_func_start CopySwappedMonData
CopySwappedMonData: @ 0x0819C4F8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	ldr r4, _0819C5D8
	ldr r5, _0819C5DC
	ldr r1, [r5]
	ldrb r0, [r1, #0x12]
	movs r6, #0x64
	muls r0, r6, r0
	adds r0, r0, r4
	ldr r2, _0819C5E0
	mov sb, r2
	ldrb r1, [r1, #0x13]
	muls r1, r6, r1
	add r1, sb
	movs r2, #0x64
	bl memcpy
	movs r1, #0
	mov r0, sp
	strb r1, [r0]
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	muls r0, r6, r0
	adds r0, r0, r4
	movs r1, #0x20
	mov r2, sp
	bl SetMonData
	ldr r3, _0819C5E4
	mov r8, r3
	ldr r3, [r3]
	ldr r4, [r5]
	ldrb r0, [r4, #0x12]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r3, r2
	ldrb r1, [r4, #0x13]
	adds r1, #3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	movs r1, #0xe7
	lsls r1, r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r2, r1
	strh r0, [r2]
	ldrb r0, [r4, #0x12]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r3, r2
	ldrb r1, [r4, #0x13]
	adds r1, #3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r0, _0819C5E8
	adds r3, r3, r0
	ldrb r1, [r3]
	adds r2, r2, r0
	strb r1, [r2]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	muls r0, r6, r0
	add r0, sb
	movs r1, #0
	movs r2, #0
	bl GetMonData
	mov r1, r8
	ldr r2, [r1]
	ldr r4, [r5]
	ldrb r3, [r4, #0x12]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r3, _0819C5EC
	adds r2, r2, r3
	adds r2, r2, r1
	str r0, [r2]
	ldrb r0, [r4, #0x13]
	muls r0, r6, r0
	add r0, sb
	movs r1, #0x2e
	movs r2, #0
	bl GetBoxMonData
	mov r1, r8
	ldr r2, [r1]
	ldr r1, [r5]
	ldrb r3, [r1, #0x12]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r2, r2, r1
	ldr r3, _0819C5F0
	adds r2, r2, r3
	strb r0, [r2]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819C5D8: .4byte 0x02024190
_0819C5DC: .4byte 0x03001280
_0819C5E0: .4byte 0x020243E8
_0819C5E4: .4byte 0x03005AF0
_0819C5E8: .4byte 0x00000E78
_0819C5EC: .4byte 0x00000E74
_0819C5F0: .4byte 0x00000E79
	thumb_func_end CopySwappedMonData

	thumb_func_start Task_FromSwapScreenToSummaryScreen
Task_FromSwapScreenToSummaryScreen: @ 0x0819C5F4
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0819C618
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r6, r0, r1
	movs r1, #8
	ldrsh r0, [r6, r1]
	cmp r0, #7
	beq _0819C638
	cmp r0, #7
	bgt _0819C61C
	cmp r0, #6
	beq _0819C622
	b _0819C6D8
	.align 2, 0
_0819C618: .4byte 0x03005B60
_0819C61C:
	cmp r0, #8
	beq _0819C6AC
	b _0819C6D8
_0819C622:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #7
	strh r0, [r6, #8]
	b _0819C6D8
_0819C638:
	ldr r0, _0819C694
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0819C6D8
	ldr r4, _0819C698
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl DestroyTask
	ldr r1, [r4]
	ldr r0, [r1, #0x2c]
	adds r1, #0x30
	bl sub_0819F330
	bl Swap_DestroyAllSprites
	ldr r4, _0819C69C
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819C6A0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819C6A4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819C6A8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	bl FreeAllWindowBuffers
	movs r0, #8
	strh r0, [r6, #8]
	b _0819C6D8
	.align 2, 0
_0819C694: .4byte 0x02037C74
_0819C698: .4byte 0x03001280
_0819C69C: .4byte 0x0203CB0C
_0819C6A0: .4byte 0x0203CB10
_0819C6A4: .4byte 0x0203CB14
_0819C6A8: .4byte 0x0203CB18
_0819C6AC:
	adds r0, r2, #0
	bl DestroyTask
	ldr r2, _0819C6E0
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #0x15]
	ldr r2, [r2]
	ldr r0, _0819C6E4
	movs r1, #0xf4
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x24]
	ldr r1, _0819C6E8
	ldrb r2, [r2, #3]
	ldr r0, _0819C6EC
	str r0, [sp]
	movs r0, #0
	movs r3, #2
	bl ShowPokemonSummaryScreen
_0819C6D8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819C6E0: .4byte 0x03001280
_0819C6E4: .4byte 0x020373B4
_0819C6E8: .4byte 0x02024190
_0819C6EC: .4byte 0x0819D905
	thumb_func_end Task_FromSwapScreenToSummaryScreen

	thumb_func_start Task_CloseSwapScreen
Task_CloseSwapScreen: @ 0x0819C6F0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _0819C724
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	beq _0819C7E6
	ldr r1, _0819C728
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _0819C760
	cmp r1, #1
	bgt _0819C72C
	cmp r1, #0
	beq _0819C736
	b _0819C7E6
	.align 2, 0
_0819C724: .4byte 0x03001280
_0819C728: .4byte 0x03005B60
_0819C72C:
	cmp r1, #2
	beq _0819C774
	cmp r1, #3
	beq _0819C78C
	b _0819C7E6
_0819C736:
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0819C750
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldr r0, _0819C74C
	strh r1, [r0]
	b _0819C7E6
	.align 2, 0
_0819C74C: .4byte 0x02037290
_0819C750:
	movs r0, #2
	strh r0, [r4, #8]
	ldr r1, _0819C75C
	movs r0, #1
	strh r0, [r1]
	b _0819C7E6
	.align 2, 0
_0819C75C: .4byte 0x02037290
_0819C760:
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0819C784
	ldrb r0, [r2, #3]
	strb r0, [r2, #0x13]
	bl CopySwappedMonData
	b _0819C784
_0819C774:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0819C784:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0819C7E6
_0819C78C:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0819C7E6
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	bl DestroyTask
	bl Swap_DestroyAllSprites
	ldr r4, _0819C7F0
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819C7F4
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819C7F8
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r4, _0819C7FC
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r0, [r7]
	bl Free
	str r5, [r7]
	bl FreeAllWindowBuffers
	ldr r0, _0819C800
	bl SetMainCallback2
	adds r0, r6, #0
	bl DestroyTask
_0819C7E6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819C7F0: .4byte 0x0203CB0C
_0819C7F4: .4byte 0x0203CB10
_0819C7F8: .4byte 0x0203CB14
_0819C7FC: .4byte 0x0203CB18
_0819C800: .4byte 0x08085B19
	thumb_func_end Task_CloseSwapScreen

	thumb_func_start Task_HandleSwapScreenYesNo
Task_HandleSwapScreenYesNo: @ 0x0819C804
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r7, _0819C830
	ldr r0, [r7]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	beq _0819C8BE
	ldr r1, _0819C834
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #4
	beq _0819C838
	cmp r0, #5
	beq _0819C842
	b _0819C8BE
	.align 2, 0
_0819C830: .4byte 0x03001280
_0819C834: .4byte 0x03005B60
_0819C838:
	bl Swap_ShowYesNoOptions
	movs r0, #5
	strh r0, [r4, #8]
	b _0819C8BE
_0819C842:
	ldr r2, _0819C864
	ldrh r1, [r2, #0x2e]
	movs r6, #1
	adds r5, r6, #0
	ands r5, r1
	cmp r5, #0
	beq _0819C86E
	movs r0, #5
	bl PlaySE
	ldr r0, [r7]
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	bne _0819C868
	strh r6, [r4, #0xa]
	b _0819C884
	.align 2, 0
_0819C864: .4byte 0x03002360
_0819C868:
	movs r0, #0
	strh r0, [r4, #0xa]
	b _0819C87E
_0819C86E:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0819C890
	movs r0, #5
	bl PlaySE
	strh r5, [r4, #0xa]
_0819C87E:
	movs r0, #4
	bl sub_0819E76C
_0819C884:
	ldrh r0, [r4, #0x14]
	ldrh r1, [r4, #0x16]
	lsls r0, r0, #0x10
	orrs r0, r1
	str r0, [r4]
	b _0819C8BE
_0819C890:
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0819C8AA
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	bl Swap_UpdateYesNoCursorPosition
	b _0819C8BE
_0819C8AA:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0819C8BE
	movs r0, #5
	bl PlaySE
	movs r0, #1
	bl Swap_UpdateYesNoCursorPosition
_0819C8BE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Task_HandleSwapScreenYesNo

	thumb_func_start sub_0819C8C4
sub_0819C8C4: @ 0x0819C8C4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819C8E4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r1, r2
	movs r1, #0xa
	ldrsh r0, [r2, r1]
	cmp r0, #1
	bne _0819C8EC
	movs r0, #0
	strh r0, [r2, #8]
	ldr r0, _0819C8E8
	b _0819C8FE
	.align 2, 0
_0819C8E4: .4byte 0x03005B60
_0819C8E8: .4byte 0x0819C6F1
_0819C8EC:
	movs r0, #0
	strh r0, [r2, #8]
	ldr r1, _0819C904
	lsrs r0, r1, #0x10
	strh r0, [r2, #0x14]
	strh r1, [r2, #0x16]
	movs r0, #1
	strh r0, [r2, #0x12]
	ldr r0, _0819C908
_0819C8FE:
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0819C904: .4byte 0x0819CB29
_0819C908: .4byte 0x0819D459
	thumb_func_end sub_0819C8C4

	thumb_func_start sub_0819C90C
sub_0819C90C: @ 0x0819C90C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819C948
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _0819C942
	ldr r0, _0819C94C
	bl Swap_PrintOnInfoWindow
	ldr r0, _0819C950
	ldr r0, [r0]
	adds r0, #0x20
	strb r5, [r0]
	movs r0, #4
	strh r0, [r4, #8]
	ldr r1, _0819C954
	lsrs r0, r1, #0x10
	strh r0, [r4, #0x14]
	strh r1, [r4, #0x16]
	ldr r0, _0819C958
	str r0, [r4]
_0819C942:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819C948: .4byte 0x03005B60
_0819C94C: .4byte 0x085DC0FB
_0819C950: .4byte 0x03001280
_0819C954: .4byte 0x0819C8C5
_0819C958: .4byte 0x0819C805
	thumb_func_end sub_0819C90C

	thumb_func_start sub_0819C95C
sub_0819C95C: @ 0x0819C95C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0819C98C
	ldr r1, [r0]
	ldr r0, [r1, #0x2c]
	adds r1, #0x30
	movs r2, #1
	bl sub_0819F2E4
	ldr r1, _0819C990
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r1, #0xa
	ldrsh r0, [r2, r1]
	cmp r0, #1
	bne _0819C998
	movs r0, #0
	strh r0, [r2, #8]
	ldr r0, _0819C994
	b _0819C9AA
	.align 2, 0
_0819C98C: .4byte 0x03001280
_0819C990: .4byte 0x03005B60
_0819C994: .4byte 0x0819C6F1
_0819C998:
	movs r0, #0
	strh r0, [r2, #8]
	ldr r1, _0819C9B4
	lsrs r0, r1, #0x10
	strh r0, [r2, #0x14]
	strh r1, [r2, #0x16]
	movs r0, #1
	strh r0, [r2, #0x12]
	ldr r0, _0819C9B8
_0819C9AA:
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819C9B4: .4byte 0x0819CB29
_0819C9B8: .4byte 0x0819D459
	thumb_func_end sub_0819C95C

	thumb_func_start sub_0819C9BC
sub_0819C9BC: @ 0x0819C9BC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819CA08
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r2
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0819CA02
	ldr r4, _0819CA0C
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x2d
	adds r1, #0x30
	movs r2, #1
	bl sub_0819F1A0
	ldr r0, _0819CA10
	bl Swap_PrintOnInfoWindow
	ldr r0, [r4]
	adds r0, #0x20
	movs r1, #1
	strb r1, [r0]
	movs r0, #4
	strh r0, [r5, #8]
	ldr r1, _0819CA14
	lsrs r0, r1, #0x10
	strh r0, [r5, #0x14]
	strh r1, [r5, #0x16]
	ldr r0, _0819CA18
	str r0, [r5]
_0819CA02:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819CA08: .4byte 0x03005B60
_0819CA0C: .4byte 0x03001280
_0819CA10: .4byte 0x085DC12B
_0819CA14: .4byte 0x0819C95D
_0819CA18: .4byte 0x0819C805
	thumb_func_end sub_0819C9BC

	thumb_func_start Task_HandleSwapScreenMenu
Task_HandleSwapScreenMenu: @ 0x0819CA1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0819CA44
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #3
	beq _0819CA8C
	cmp r0, #3
	bgt _0819CA48
	cmp r0, #2
	beq _0819CA4E
	b _0819CB1E
	.align 2, 0
_0819CA44: .4byte 0x03005B60
_0819CA48:
	cmp r0, #9
	beq _0819CA70
	b _0819CB1E
_0819CA4E:
	ldr r0, _0819CA6C
	ldr r1, [r0]
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	bne _0819CA64
	adds r0, r1, #0
	adds r0, #0x2d
	adds r1, #0x30
	movs r2, #1
	bl sub_0819F1A0
_0819CA64:
	movs r0, #9
	strh r0, [r5, #8]
	b _0819CB1E
	.align 2, 0
_0819CA6C: .4byte 0x03001280
_0819CA70:
	ldr r0, _0819CA88
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	beq _0819CB1E
	bl Swap_ShowMenuOptions
	movs r0, #3
	strh r0, [r5, #8]
	b _0819CB1E
	.align 2, 0
_0819CA88: .4byte 0x03001280
_0819CA8C:
	ldr r7, _0819CAB8
	ldr r0, [r7]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	beq _0819CB1E
	ldr r2, _0819CABC
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	mov r8, r0
	mov r4, r8
	ands r4, r1
	cmp r4, #0
	beq _0819CAC0
	movs r0, #5
	bl PlaySE
	adds r0, r6, #0
	bl Swap_RunMenuOptionFunc
	b _0819CB1E
	.align 2, 0
_0819CAB8: .4byte 0x03001280
_0819CABC: .4byte 0x03002360
_0819CAC0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0819CAFC
	movs r0, #5
	bl PlaySE
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	adds r1, #0x30
	movs r2, #1
	bl sub_0819F2E4
	movs r0, #3
	bl sub_0819E76C
	strh r4, [r5, #8]
	ldr r1, _0819CAF4
	lsrs r0, r1, #0x10
	strh r0, [r5, #0x14]
	strh r1, [r5, #0x16]
	mov r1, r8
	strh r1, [r5, #0x12]
	ldr r0, _0819CAF8
	str r0, [r5]
	b _0819CB1E
	.align 2, 0
_0819CAF4: .4byte 0x0819CB29
_0819CAF8: .4byte 0x0819D459
_0819CAFC:
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0819CB10
	movs r0, #1
	rsbs r0, r0, #0
	bl Swap_UpdateMenuCursorPosition
	b _0819CB1E
_0819CB10:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0819CB1E
	movs r0, #1
	bl Swap_UpdateMenuCursorPosition
_0819CB1E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Task_HandleSwapScreenMenu

	thumb_func_start Task_HandleSwapScreenChooseMons
Task_HandleSwapScreenChooseMons: @ 0x0819CB28
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0819CB48
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0819CB4C
	cmp r0, #1
	beq _0819CB70
	b _0819CC34
	.align 2, 0
_0819CB48: .4byte 0x03005B60
_0819CB4C:
	ldr r0, _0819CB68
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0819CC34
	ldr r0, _0819CB6C
	ldr r0, [r0]
	adds r0, #0x22
	movs r1, #1
	strb r1, [r0]
	strh r1, [r4, #8]
	b _0819CC34
	.align 2, 0
_0819CB68: .4byte 0x02037C74
_0819CB6C: .4byte 0x03001280
_0819CB70:
	ldr r2, _0819CB9C
	ldrh r1, [r2, #0x2e]
	adds r5, r1, #0
	ands r5, r0
	cmp r5, #0
	beq _0819CBA4
	movs r0, #5
	bl PlaySE
	ldr r0, _0819CBA0
	ldr r0, [r0]
	adds r0, #0x22
	movs r1, #0
	strb r1, [r0]
	bl Swap_PrintMonSpecies2
	bl sub_0819E7C8
	adds r0, r6, #0
	bl Swap_RunActionFunc
	b _0819CC34
	.align 2, 0
_0819CB9C: .4byte 0x03002360
_0819CBA0: .4byte 0x03001280
_0819CBA4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0819CBE0
	movs r0, #5
	bl PlaySE
	ldr r0, _0819CBD4
	ldr r0, [r0]
	adds r0, #0x22
	strb r5, [r0]
	bl Swap_PrintMonSpecies2
	bl sub_0819E7C8
	ldr r1, _0819CBD8
	lsrs r0, r1, #0x10
	strh r0, [r4, #0x14]
	strh r1, [r4, #0x16]
	strh r5, [r4, #8]
	strh r5, [r4, #0x12]
	ldr r0, _0819CBDC
	str r0, [r4]
	b _0819CC34
	.align 2, 0
_0819CBD4: .4byte 0x03001280
_0819CBD8: .4byte 0x0819C90D
_0819CBDC: .4byte 0x0819D271
_0819CBE0:
	ldrh r1, [r2, #0x30]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0819CBF4
	movs r0, #1
	rsbs r0, r0, #0
	bl Swap_UpdateBallCursorPosition
	b _0819CC12
_0819CBF4:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0819CC04
	movs r0, #1
	bl Swap_UpdateBallCursorPosition
	b _0819CC12
_0819CC04:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0819CC1C
	movs r0, #1
	bl Swap_UpdateActionCursorPosition
_0819CC12:
	bl Swap_PrintMonCategory
	bl Swap_PrintMonSpecies
	b _0819CC34
_0819CC1C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0819CC34
	movs r0, #1
	rsbs r0, r0, #0
	bl Swap_UpdateActionCursorPosition
	bl Swap_PrintMonCategory
	bl Swap_PrintMonSpecies
_0819CC34:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_HandleSwapScreenChooseMons

	thumb_func_start Task_SwapFadeSpeciesName
Task_SwapFadeSpeciesName: @ 0x0819CC3C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0819CC60
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #8
	ldrsh r2, [r4, r0]
	cmp r2, #1
	beq _0819CC88
	cmp r2, #1
	bgt _0819CC64
	cmp r2, #0
	beq _0819CC6A
	b _0819CD44
	.align 2, 0
_0819CC60: .4byte 0x03005B60
_0819CC64:
	cmp r2, #2
	beq _0819CD24
	b _0819CD44
_0819CC6A:
	ldr r1, _0819CC84
	ldr r0, [r1]
	adds r0, #0x27
	strb r2, [r0]
	ldr r0, [r1]
	adds r0, #0x28
	strb r2, [r0]
	ldr r0, [r1]
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	strh r1, [r4, #8]
	b _0819CD44
	.align 2, 0
_0819CC84: .4byte 0x03001280
_0819CC88:
	ldr r1, _0819CCA8
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0x22
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #0
	beq _0819CD44
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r3, [r0]
	cmp r3, #0
	beq _0819CCAC
	movs r0, #2
	strh r0, [r4, #8]
	b _0819CD44
	.align 2, 0
_0819CCA8: .4byte 0x03001280
_0819CCAC:
	adds r1, r2, #0
	adds r1, #0x27
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x27
	ldrb r0, [r1]
	cmp r0, #6
	bls _0819CCE0
	strb r3, [r1]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	bne _0819CCD8
	adds r1, #0x28
	ldrb r0, [r1]
	subs r0, #1
	b _0819CCDE
_0819CCD8:
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
_0819CCDE:
	strb r0, [r1]
_0819CCE0:
	movs r0, #0x80
	lsls r0, r0, #7
	ldr r1, [r6]
	adds r1, #0x28
	ldrb r1, [r1]
	movs r2, #0
	bl BlendPalettes
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #5
	bls _0819CD04
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0
	b _0819CD42
_0819CD04:
	cmp r0, #0
	bne _0819CD44
	ldr r1, _0819CD20
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0, #8]
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	b _0819CD42
	.align 2, 0
_0819CD20: .4byte 0x03005B60
_0819CD24:
	ldr r0, _0819CD3C
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r0, [r1]
	cmp r0, #0xe
	bls _0819CD40
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strh r0, [r4, #8]
	b _0819CD44
	.align 2, 0
_0819CD3C: .4byte 0x03001280
_0819CD40:
	adds r0, #1
_0819CD42:
	strb r0, [r1]
_0819CD44:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_SwapFadeSpeciesName

	thumb_func_start Task_SwapFadeSpeciesName2
Task_SwapFadeSpeciesName2: @ 0x0819CD4C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819CD70
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _0819CD8C
	cmp r1, #1
	bgt _0819CD74
	cmp r1, #0
	beq _0819CD7A
	b _0819CE00
	.align 2, 0
_0819CD70: .4byte 0x03005B60
_0819CD74:
	cmp r1, #2
	beq _0819CDA4
	b _0819CE00
_0819CD7A:
	ldr r0, _0819CD88
	ldr r0, [r0]
	adds r0, #0x27
	strb r1, [r0]
	strh r1, [r4, #0x10]
	b _0819CD96
	.align 2, 0
_0819CD88: .4byte 0x03001280
_0819CD8C:
	ldr r0, _0819CDA0
	movs r1, #0xe0
	movs r2, #0xa
	bl LoadPalette
_0819CD96:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0819CE00
	.align 2, 0
_0819CDA0: .4byte 0x02037594
_0819CDA4:
	ldr r2, _0819CE08
	ldr r0, [r2]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0xf
	bls _0819CDBA
	movs r0, #1
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0819CDBA:
	ldr r1, [r2]
	adds r1, #0x27
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x27
	ldrb r0, [r1]
	cmp r0, #3
	bls _0819CDF0
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0819CE0C
	ldr r0, _0819CE10
	movs r3, #0xe4
	lsls r3, r3, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r3, #0x20
	adds r1, r1, r3
	strh r0, [r1]
	ldr r1, [r2]
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0819CDF0:
	movs r0, #0x80
	lsls r0, r0, #7
	ldr r1, [r2]
	adds r1, #0x28
	ldrb r1, [r1]
	movs r2, #0
	bl BlendPalettes
_0819CE00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819CE08: .4byte 0x03001280
_0819CE0C: .4byte 0x020373B4
_0819CE10: .4byte 0x020377B4
	thumb_func_end Task_SwapFadeSpeciesName2

	thumb_func_start sub_0819CE14
sub_0819CE14: @ 0x0819CE14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r1, _0819CE40
	lsls r0, r0, #2
	ldr r2, [sp]
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r2, #8
	ldrsh r3, [r4, r2]
	cmp r3, #0
	beq _0819CE44
	cmp r3, #1
	beq _0819CE50
	b _0819CFF8
	.align 2, 0
_0819CE40: .4byte 0x03005B60
_0819CE44:
	strh r3, [r4, #0xa]
	strh r3, [r4, #0xc]
	strh r3, [r4, #0xe]
	movs r0, #1
	strh r0, [r4, #8]
	b _0819CFF8
_0819CE50:
	movs r3, #0
	str r3, [sp, #4]
	movs r1, #2
	str r0, [sp, #8]
	ldr r0, _0819CEB4
	str r0, [sp, #0xc]
_0819CE5C:
	lsls r0, r1, #0x18
	asrs r4, r0, #0x18
	mov sb, r0
	cmp r4, #2
	beq _0819CEDA
	ldr r2, _0819CEB8
	ldr r3, _0819CEBC
	ldr r0, [r3]
	adds r0, #5
	mov r8, r0
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r6, r0, r2
	ldrh r1, [r6, #0x20]
	mov ip, r1
	mov r7, ip
	ldr r1, [sp, #4]
	subs r0, r1, r7
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov sl, r2
	cmp r5, #0x10
	beq _0819CEA6
	adds r0, r4, #2
	lsls r0, r0, #1
	ldr r2, [sp, #8]
	adds r0, r0, r2
	ldr r1, _0819CEB4
	adds r1, #8
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #1
	bne _0819CEC0
_0819CEA6:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, ip
	adds r0, #0xa
	strh r0, [r6, #0x20]
	b _0819CEF8
	.align 2, 0
_0819CEB4: .4byte 0x03005B60
_0819CEB8: .4byte 0x020205AC
_0819CEBC: .4byte 0x03001280
_0819CEC0:
	cmp r5, #0x10
	bls _0819CEF8
	adds r0, r4, #1
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrh r0, [r0, #0x20]
	subs r0, #0x30
	strh r0, [r6, #0x20]
	b _0819CEF8
_0819CEDA:
	ldr r3, _0819CF3C
	ldr r4, _0819CF40
	ldr r0, [r4]
	ldrb r1, [r0, #7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r2, [r0, #0x20]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r2, #0xa
	strh r2, [r0, #0x20]
	mov sl, r3
_0819CEF8:
	mov r0, sb
	asrs r2, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #1
	ldr r1, [sp, #8]
	adds r0, r0, r1
	ldr r1, _0819CF44
	adds r1, #8
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #1
	bne _0819CF52
	ldr r1, _0819CF40
	ldr r0, [r1]
	adds r0, #5
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r3, sl
	adds r1, r0, r3
	movs r0, #0x20
	ldrsh r3, [r1, r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x48
	cmp r3, r0
	ble _0819CF48
	strh r0, [r1, #0x20]
	movs r7, #1
	b _0819CF54
	.align 2, 0
_0819CF3C: .4byte 0x020205AC
_0819CF40: .4byte 0x03001280
_0819CF44: .4byte 0x03005B60
_0819CF48:
	movs r7, #0
	cmp r3, r0
	bne _0819CF54
	movs r7, #1
	b _0819CF54
_0819CF52:
	movs r7, #0
_0819CF54:
	mov r6, sl
	ldr r5, _0819CFA0
	ldr r2, [r5]
	mov r1, sb
	asrs r4, r1, #0x18
	adds r0, r2, #5
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	subs r0, #0x10
	cmp r0, #0xf0
	ble _0819CFE0
	ldrh r0, [r1, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, _0819CFA4
	strh r0, [r1, #0x20]
	ldrb r0, [r2, #0x14]
	cmp r0, #1
	bne _0819CFA8
	movs r0, #0x65
	bl IndexOfSpritePaletteTag
	ldr r1, [r5]
	adds r1, #5
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r6
	b _0819CFC0
	.align 2, 0
_0819CFA0: .4byte 0x03001280
_0819CFA4: .4byte 0x0000FFF0
_0819CFA8:
	movs r0, #0x64
	bl IndexOfSpritePaletteTag
	ldr r2, _0819D008
	ldr r1, [r2]
	adds r1, #5
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	add r2, sl
_0819CFC0:
	lsls r0, r0, #4
	ldrb r3, [r2, #5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #5]
	mov r3, sb
	asrs r0, r3, #0x17
	adds r0, #2
	ldr r1, [sp, #8]
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	adds r2, #8
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0]
_0819CFE0:
	movs r0, #0xff
	lsls r0, r0, #0x18
	add r0, sb
	lsrs r1, r0, #0x18
	cmp r0, #0
	blt _0819CFEE
	b _0819CE5C
_0819CFEE:
	cmp r7, #1
	bne _0819CFF8
	ldr r0, [sp]
	bl DestroyTask
_0819CFF8:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819D008: .4byte 0x03001280
	thumb_func_end sub_0819CE14

	thumb_func_start sub_0819D00C
sub_0819D00C: @ 0x0819D00C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r1, _0819D04C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrb r4, [r2, #0xe]
	movs r0, #0xc
	ldrsh r5, [r2, r0]
	mov sl, r1
	cmp r5, #1
	bne _0819D03A
	lsls r0, r4, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x18
_0819D03A:
	movs r1, #8
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0819D050
	cmp r0, #1
	bne _0819D048
	b _0819D168
_0819D048:
	b _0819D258
	.align 2, 0
_0819D04C: .4byte 0x03005B60
_0819D050:
	ldr r3, _0819D07C
	ldr r2, _0819D080
	ldr r0, [r2]
	ldrb r1, [r0, #8]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x20]
	cmp r5, #0
	bne _0819D084
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r4, #0x18
	asrs r1, r2, #0x18
	adds r0, r0, r1
	movs r1, #1
	cmp r0, #0xef
	ble _0819D09A
	movs r1, #0
	movs r0, #0xf0
	b _0819D098
	.align 2, 0
_0819D07C: .4byte 0x020205AC
_0819D080: .4byte 0x03001280
_0819D084:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r4, #0x18
	asrs r1, r2, #0x18
	adds r0, r0, r1
	movs r1, #1
	cmp r0, #0xa0
	bgt _0819D09A
	movs r1, #0
	movs r0, #0xa0
_0819D098:
	mov r8, r0
_0819D09A:
	cmp r1, #1
	bne _0819D0E4
	movs r3, #0
	ldr r7, _0819D0DC
	ldr r6, _0819D0E0
	asrs r5, r2, #0x18
_0819D0A6:
	movs r4, #0
	adds r2, r3, #1
_0819D0AA:
	ldr r1, [r6]
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, r3, r0
	adds r1, #8
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, r1, r5
	strh r1, [r0, #0x20]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0819D0AA
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _0819D0A6
	b _0819D258
	.align 2, 0
_0819D0DC: .4byte 0x020205AC
_0819D0E0: .4byte 0x03001280
_0819D0E4:
	movs r4, #0
	lsls r1, r7, #2
	mov ip, r1
	mov r6, r8
	adds r6, #0x10
	movs r0, #0x30
	add r0, r8
	mov sb, r0
	ldr r5, _0819D160
_0819D0F6:
	ldr r1, _0819D164
	ldr r2, [r1]
	lsls r3, r4, #1
	adds r3, r3, r4
	adds r0, r2, #0
	adds r0, #8
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x20]
	adds r0, r2, #0
	adds r0, #9
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x20]
	adds r2, #0xa
	adds r2, r2, r3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, sb
	strh r1, [r0, #0x20]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0819D0F6
	mov r1, ip
	adds r0, r1, r7
	lsls r0, r0, #3
	add r0, sl
	ldrb r1, [r0, #0xa]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	movs r1, #1
	strh r1, [r0, #0xe]
	adds r0, r7, #0
	bl DestroyTask
	b _0819D258
	.align 2, 0
_0819D160: .4byte 0x020205AC
_0819D164: .4byte 0x03001280
_0819D168:
	ldr r2, _0819D194
	ldr r0, _0819D198
	ldr r0, [r0]
	ldrb r1, [r0, #0xe]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x20]
	cmp r5, #0
	bne _0819D19C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r4, #0x18
	asrs r1, r2, #0x18
	adds r0, r0, r1
	movs r1, #1
	cmp r0, #0xef
	ble _0819D1B2
	movs r1, #0
	movs r0, #0xf0
	b _0819D1B0
	.align 2, 0
_0819D194: .4byte 0x020205AC
_0819D198: .4byte 0x03001280
_0819D19C:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r4, #0x18
	asrs r1, r2, #0x18
	adds r0, r0, r1
	movs r1, #1
	cmp r0, #0xc0
	bgt _0819D1B2
	movs r1, #0
	movs r0, #0xc0
_0819D1B0:
	mov r8, r0
_0819D1B2:
	cmp r1, #1
	bne _0819D1F8
	movs r3, #0
	ldr r7, _0819D1F0
	ldr r6, _0819D1F4
	asrs r5, r2, #0x18
_0819D1BE:
	movs r4, #0
	adds r2, r3, #1
_0819D1C2:
	ldr r0, [r6]
	lsls r1, r4, #1
	adds r1, r3, r1
	adds r0, #0xe
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, r1, r5
	strh r1, [r0, #0x20]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0819D1C2
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _0819D1BE
	b _0819D258
	.align 2, 0
_0819D1F0: .4byte 0x020205AC
_0819D1F4: .4byte 0x03001280
_0819D1F8:
	movs r4, #0
	lsls r1, r7, #2
	mov ip, r1
	mov r6, r8
	adds r6, #0x10
	ldr r5, _0819D268
	ldr r0, _0819D26C
	mov sb, r0
_0819D208:
	mov r1, sb
	ldr r2, [r1]
	lsls r3, r4, #1
	adds r0, r2, #0
	adds r0, #0xe
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x20]
	adds r2, #0xf
	adds r2, r2, r3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x20]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0819D208
	mov r1, ip
	adds r0, r1, r7
	lsls r0, r0, #3
	add r0, sl
	ldrb r1, [r0, #0xa]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	movs r1, #1
	strh r1, [r0, #0x10]
	adds r0, r7, #0
	bl DestroyTask
_0819D258:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819D268: .4byte 0x020205AC
_0819D26C: .4byte 0x03001280
	thumb_func_end sub_0819D00C

	thumb_func_start sub_0819D270
sub_0819D270: @ 0x0819D270
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0819D29C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, #5
	bls _0819D292
	b _0819D44A
_0819D292:
	lsls r0, r0, #2
	ldr r1, _0819D2A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819D29C: .4byte 0x03005B60
_0819D2A0: .4byte 0x0819D2A4
_0819D2A4: @ jump table
	.4byte _0819D2BC @ case 0
	.4byte _0819D2D8 @ case 1
	.4byte _0819D2F4 @ case 2
	.4byte _0819D324 @ case 3
	.4byte _0819D3D8 @ case 4
	.4byte _0819D422 @ case 5
_0819D2BC:
	ldr r0, _0819D2D4
	movs r1, #0xe0
	movs r2, #0xa
	bl LoadPalette
	bl Swap_PrintActionStrings
	movs r0, #5
	bl PutWindowTilemap
	b _0819D30A
	.align 2, 0
_0819D2D4: .4byte 0x085DC1C4
_0819D2D8:
	movs r0, #3
	bl sub_0819E76C
	ldr r0, _0819D2F0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0819D44A
	.align 2, 0
_0819D2F0: .4byte 0x03005B60
_0819D2F4:
	movs r0, #0x80
	lsls r0, r0, #7
	ldr r1, _0819D31C
	adds r1, #0x4a
	ldrh r1, [r1]
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0819D30A:
	ldr r1, _0819D320
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _0819D44A
	.align 2, 0
_0819D31C: .4byte 0x085D9C38
_0819D320: .4byte 0x03005B60
_0819D324:
	ldr r0, _0819D388
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _0819D336
	b _0819D44A
_0819D336:
	movs r0, #5
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #5
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, _0819D38C
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #1
	bne _0819D398
	ldr r0, _0819D390
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0819D394
	lsls r2, r5, #2
	adds r2, r2, r5
	lsls r2, r2, #3
	adds r2, r2, r1
	strh r6, [r2, #0xe]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #0xa]
	strh r6, [r0, #8]
	strh r6, [r0, #0xc]
	movs r1, #6
	strh r1, [r0, #0xe]
	movs r0, #5
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _0819D44A
	.align 2, 0
_0819D388: .4byte 0x02037C74
_0819D38C: .4byte 0x03001280
_0819D390: .4byte 0x0819D00D
_0819D394: .4byte 0x03005B60
_0819D398:
	ldr r0, _0819D3D0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, _0819D3D4
	lsls r2, r5, #2
	adds r2, r2, r5
	lsls r2, r2, #3
	adds r2, r2, r3
	movs r1, #1
	strh r1, [r2, #0xe]
	strh r6, [r2, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r5, [r0, #0xa]
	strh r1, [r0, #8]
	strh r6, [r0, #0xc]
	movs r1, #6
	strh r1, [r0, #0xe]
	ldrh r0, [r2, #8]
	adds r0, #2
	strh r0, [r2, #8]
	b _0819D44A
	.align 2, 0
_0819D3D0: .4byte 0x0819D00D
_0819D3D4: .4byte 0x03005B60
_0819D3D8:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	mov r1, r8
	adds r6, r0, r1
	ldrh r0, [r6, #0xc]
	movs r2, #0xc
	ldrsh r7, [r6, r2]
	cmp r7, #0
	bne _0819D41C
	ldr r0, _0819D418
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	strh r7, [r6, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	add r0, r8
	strh r5, [r0, #0xa]
	movs r1, #1
	strh r1, [r0, #8]
	strh r7, [r0, #0xc]
	movs r1, #6
	strh r1, [r0, #0xe]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	b _0819D44A
	.align 2, 0
_0819D418: .4byte 0x0819D00D
_0819D41C:
	subs r0, #1
	strh r0, [r6, #0xc]
	b _0819D44A
_0819D422:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	cmp r0, #1
	bne _0819D44A
	movs r1, #0x10
	ldrsh r0, [r2, r1]
	cmp r0, #1
	bne _0819D44A
	ldrh r0, [r2, #0x12]
	strh r0, [r2, #8]
	ldrh r0, [r2, #0x14]
	ldrh r1, [r2, #0x16]
	lsls r0, r0, #0x10
	orrs r0, r1
	str r0, [r2]
_0819D44A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819D270

	thumb_func_start sub_0819D458
sub_0819D458: @ 0x0819D458
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0819D498
	ldr r0, [r1]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #1
	bne _0819D474
	b _0819D6C0
_0819D474:
	ldr r0, _0819D49C
	lsls r2, r6, #2
	adds r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r4, #8
	ldrsh r1, [r1, r4]
	mov r8, r0
	adds r5, r2, #0
	cmp r1, #8
	bls _0819D48C
	b _0819D6C0
_0819D48C:
	lsls r0, r1, #2
	ldr r1, _0819D4A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819D498: .4byte 0x03001280
_0819D49C: .4byte 0x03005B60
_0819D4A0: .4byte 0x0819D4A4
_0819D4A4: @ jump table
	.4byte _0819D4C8 @ case 0
	.4byte _0819D550 @ case 1
	.4byte _0819D596 @ case 2
	.4byte _0819D5DC @ case 3
	.4byte _0819D5F8 @ case 4
	.4byte _0819D610 @ case 5
	.4byte _0819D61E @ case 6
	.4byte _0819D630 @ case 7
	.4byte _0819D698 @ case 8
_0819D4C8:
	ldr r0, [r3]
	ldrb r7, [r0, #0x14]
	cmp r7, #1
	bne _0819D510
	ldr r0, _0819D508
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, _0819D50C
	adds r2, r5, r6
	lsls r2, r2, #3
	adds r2, r2, r3
	movs r1, #0
	strh r1, [r2, #0xe]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r6, [r0, #0xa]
	strh r1, [r0, #8]
	strh r7, [r0, #0xc]
	movs r1, #6
	strh r1, [r0, #0xe]
	movs r0, #0xa
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _0819D6C0
	.align 2, 0
_0819D508: .4byte 0x0819D00D
_0819D50C: .4byte 0x03005B60
_0819D510:
	ldr r0, _0819D548
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, _0819D54C
	adds r2, r5, r6
	lsls r2, r2, #3
	adds r2, r2, r3
	movs r0, #0
	movs r1, #1
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r6, [r0, #0xa]
	strh r1, [r0, #8]
	strh r1, [r0, #0xc]
	movs r1, #6
	strh r1, [r0, #0xe]
	ldrh r0, [r2, #8]
	adds r0, #2
	strh r0, [r2, #8]
	b _0819D6C0
	.align 2, 0
_0819D548: .4byte 0x0819D00D
_0819D54C: .4byte 0x03005B60
_0819D550:
	adds r0, r5, r6
	lsls r0, r0, #3
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #0xc]
	movs r2, #0xc
	ldrsh r7, [r5, r2]
	cmp r7, #0
	bne _0819D590
	ldr r0, _0819D58C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	strh r7, [r5, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	add r0, r8
	strh r6, [r0, #0xa]
	movs r1, #1
	strh r1, [r0, #8]
	strh r1, [r0, #0xc]
	movs r1, #6
	strh r1, [r0, #0xe]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _0819D6C0
	.align 2, 0
_0819D58C: .4byte 0x0819D00D
_0819D590:
	subs r0, #1
	strh r0, [r5, #0xc]
	b _0819D6C0
_0819D596:
	adds r0, r5, r6
	lsls r0, r0, #3
	mov r1, r8
	adds r4, r0, r1
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #1
	beq _0819D5A8
	b _0819D6C0
_0819D5A8:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0819D5B2
	b _0819D6C0
_0819D5B2:
	ldr r1, _0819D5D4
	ldr r0, _0819D5D8
	adds r0, #0x4a
	ldrh r0, [r0]
	movs r2, #0xe2
	lsls r2, r2, #1
	adds r1, r1, r2
	strh r0, [r1]
	bl Swap_PrintActionStrings
	movs r0, #5
	bl PutWindowTilemap
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0819D6C0
	.align 2, 0
_0819D5D4: .4byte 0x020377B4
_0819D5D8: .4byte 0x085D9C38
_0819D5DC:
	movs r0, #0x80
	lsls r0, r0, #7
	ldr r1, _0819D5F4
	adds r1, #0x4a
	ldrh r1, [r1]
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _0819D678
	.align 2, 0
_0819D5F4: .4byte 0x085D9C38
_0819D5F8:
	ldr r0, _0819D60C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0819D6C0
	movs r0, #0
	bl Swap_PrintOneActionString
	b _0819D678
	.align 2, 0
_0819D60C: .4byte 0x02037C74
_0819D610:
	movs r0, #1
	bl Swap_PrintOneActionString
	movs r0, #3
	bl PutWindowTilemap
	b _0819D678
_0819D61E:
	movs r0, #5
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #5
	movs r1, #2
	bl CopyWindowToVram
	b _0819D678
_0819D630:
	ldr r0, _0819D644
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _0819D64C
	ldr r0, _0819D648
	bl Swap_PrintOnInfoWindow
	b _0819D652
	.align 2, 0
_0819D644: .4byte 0x03001280
_0819D648: .4byte 0x085DC0C2
_0819D64C:
	ldr r0, _0819D688
	bl Swap_PrintOnInfoWindow
_0819D652:
	ldr r0, _0819D68C
	ldr r1, [r0]
	ldrb r0, [r1, #3]
	cmp r0, #2
	bhi _0819D674
	ldr r2, _0819D690
	ldrb r1, [r1, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
_0819D674:
	bl Swap_PrintMonCategory
_0819D678:
	ldr r0, _0819D694
	adds r1, r5, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0819D6C0
	.align 2, 0
_0819D688: .4byte 0x085DC0D5
_0819D68C: .4byte 0x03001280
_0819D690: .4byte 0x020205AC
_0819D694: .4byte 0x03005B60
_0819D698:
	bl Swap_PrintMonSpecies3
	bl sub_0819E7FC
	ldr r0, _0819D6CC
	ldr r0, [r0]
	adds r0, #0x22
	movs r1, #1
	strb r1, [r0]
	ldr r1, _0819D6D0
	adds r0, r5, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x12]
	strh r1, [r0, #8]
	ldrh r1, [r0, #0x14]
	ldrh r2, [r0, #0x16]
	lsls r1, r1, #0x10
	orrs r1, r2
	str r1, [r0]
_0819D6C0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819D6CC: .4byte 0x03001280
_0819D6D0: .4byte 0x03005B60
	thumb_func_end sub_0819D458

	thumb_func_start sub_0819D6D4
sub_0819D6D4: @ 0x0819D6D4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0819D70C
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	bne _0819D6E8
	b _0819D8B2
_0819D6E8:
	ldr r0, _0819D710
	lsls r2, r6, #2
	adds r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #8
	ldrsh r1, [r1, r3]
	adds r3, r0, #0
	adds r7, r2, #0
	cmp r1, #4
	bls _0819D700
	b _0819D8B2
_0819D700:
	lsls r0, r1, #2
	ldr r1, _0819D714
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819D70C: .4byte 0x03001280
_0819D710: .4byte 0x03005B60
_0819D714: .4byte 0x0819D718
_0819D718: @ jump table
	.4byte _0819D72C @ case 0
	.4byte _0819D740 @ case 1
	.4byte _0819D774 @ case 2
	.4byte _0819D7A4 @ case 3
	.4byte _0819D898 @ case 4
_0819D72C:
	bl Swap_PrintMonSpecies3
	ldr r0, _0819D73C
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0819D87E
	.align 2, 0
_0819D73C: .4byte 0x03005B60
_0819D740:
	bl sub_0819E7FC
	ldr r2, _0819D768
	ldr r0, _0819D76C
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0819D770
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	b _0819D87E
	.align 2, 0
_0819D768: .4byte 0x020205AC
_0819D76C: .4byte 0x03001280
_0819D770: .4byte 0x03005B60
_0819D774:
	ldr r0, _0819D794
	movs r1, #0
	bl CreateTask
	ldr r2, _0819D798
	ldr r0, _0819D79C
	ldr r0, [r0]
	adds r0, #0x21
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _0819D7A0
	str r1, [r0]
	b _0819D878
	.align 2, 0
_0819D794: .4byte 0x0819CE15
_0819D798: .4byte 0x03005B60
_0819D79C: .4byte 0x03001280
_0819D7A0: .4byte 0x0819CD4D
_0819D7A4:
	ldr r0, _0819D7E0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0819D7B2
	b _0819D8B2
_0819D7B2:
	ldr r2, _0819D7E4
	ldr r4, _0819D7E8
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0819D8B2
	bl sub_0819E7C8
	ldr r0, [r4]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _0819D7EC
	movs r0, #1
	bl Swap_InitActions
	b _0819D81A
	.align 2, 0
_0819D7E0: .4byte 0x0819CE15
_0819D7E4: .4byte 0x03005B60
_0819D7E8: .4byte 0x03001280
_0819D7EC:
	movs r0, #0
	bl Swap_InitActions
	movs r2, #0
	ldr r5, _0819D888
	movs r3, #4
_0819D7F8:
	ldr r0, [r4]
	adds r0, #0xb
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _0819D7F8
_0819D81A:
	ldr r5, _0819D888
	ldr r4, _0819D88C
	ldr r3, [r4]
	ldrb r0, [r3, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #5
	ldrb r2, [r3, #3]
	adds r0, r0, r2
	ldrb r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x20]
	movs r5, #0
	strh r0, [r1, #0x20]
	ldr r2, _0819D890
	adds r0, r3, #0
	adds r0, #0x21
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _0819D894
	str r1, [r0]
	adds r3, #0x27
	strb r5, [r3]
	ldr r0, [r4]
	adds r0, #0x28
	movs r1, #6
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x26
	strb r5, [r0]
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #8]
_0819D878:
	adds r1, r7, r6
	lsls r1, r1, #3
	adds r1, r1, r2
_0819D87E:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0819D8B2
	.align 2, 0
_0819D888: .4byte 0x020205AC
_0819D88C: .4byte 0x03001280
_0819D890: .4byte 0x03005B60
_0819D894: .4byte 0x0819CC3D
_0819D898:
	adds r0, r7, r6
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #8]
	ldr r2, _0819D8B8
	lsrs r1, r2, #0x10
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	movs r1, #1
	strh r1, [r0, #0x12]
	ldr r1, _0819D8BC
	str r1, [r0]
_0819D8B2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819D8B8: .4byte 0x0819CB29
_0819D8BC: .4byte 0x0819D459
	thumb_func_end sub_0819D6D4

	thumb_func_start Swap_InitStruct
Swap_InitStruct: @ 0x0819D8C0
	push {r4, r5, lr}
	ldr r5, _0819D8E4
	ldr r4, [r5]
	cmp r4, #0
	bne _0819D8DE
	movs r0, #0x34
	bl AllocZeroed
	str r0, [r5]
	strb r4, [r0, #3]
	ldr r0, [r5]
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, [r5]
	strb r4, [r0, #0x15]
_0819D8DE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819D8E4: .4byte 0x03001280
	thumb_func_end Swap_InitStruct

	thumb_func_start DoBattleFactorySwapScreen
DoBattleFactorySwapScreen: @ 0x0819D8E8
	push {lr}
	ldr r0, _0819D8FC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0819D900
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0819D8FC: .4byte 0x03001280
_0819D900: .4byte 0x0819D905
	thumb_func_end DoBattleFactorySwapScreen

	thumb_func_start CB2_InitSwapScreen
CB2_InitSwapScreen: @ 0x0819D904
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, _0819D924
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0xf
	bls _0819D91A
	b _0819DDB2
_0819D91A:
	lsls r0, r0, #2
	ldr r1, _0819D928
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819D924: .4byte 0x03002360
_0819D928: .4byte 0x0819D92C
_0819D92C: @ jump table
	.4byte _0819D96C @ case 0
	.4byte _0819D9BC @ case 1
	.4byte _0819DA90 @ case 2
	.4byte _0819DB50 @ case 3
	.4byte _0819DB7C @ case 4
	.4byte _0819DBB4 @ case 5
	.4byte _0819DBD4 @ case 6
	.4byte _0819DBF8 @ case 7
	.4byte _0819DC18 @ case 8
	.4byte _0819DC24 @ case 9
	.4byte _0819DC4C @ case 10
	.4byte _0819DC58 @ case 11
	.4byte _0819DC80 @ case 12
	.4byte _0819DC94 @ case 13
	.4byte _0819DCAC @ case 14
	.4byte _0819DD24 @ case 15
_0819D96C:
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0819D9AC
	add r0, sp, #8
	bl CpuSet
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0819D9B0
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r0, _0819D9B4
	bl InitWindows
	bl DeactivateAllTextPrinters
	ldr r1, _0819D9B8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819DD16
	.align 2, 0
_0819D9AC: .4byte 0x05006000
_0819D9B0: .4byte 0x085DC164
_0819D9B4: .4byte 0x085DC174
_0819D9B8: .4byte 0x03002360
_0819D9BC:
	ldr r5, _0819DA80
	movs r4, #0x88
	lsls r4, r4, #3
	adds r0, r4, #0
	bl Alloc
	str r0, [r5]
	ldr r5, _0819DA84
	adds r0, r4, #0
	bl AllocZeroed
	str r0, [r5]
	ldr r5, _0819DA88
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl Alloc
	str r0, [r5]
	ldr r5, _0819DA8C
	adds r0, r4, #0
	bl AllocZeroed
	str r0, [r5]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
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
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4c
	movs r1, #0
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
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	b _0819DD0E
	.align 2, 0
_0819DA80: .4byte 0x0203CB0C
_0819DA84: .4byte 0x0203CB10
_0819DA88: .4byte 0x0203CB14
_0819DA8C: .4byte 0x0203CB18
_0819DA90:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl ResetAllPicSprites
	ldr r0, _0819DB28
	ldr r5, _0819DB2C
	ldr r1, [r5]
	movs r2, #0x88
	lsls r2, r2, #2
	bl CpuSet
	ldr r0, _0819DB30
	ldr r4, _0819DB34
	ldr r1, [r4]
	movs r2, #0x30
	bl CpuSet
	ldr r1, [r5]
	movs r2, #0x88
	lsls r2, r2, #3
	movs r0, #1
	movs r3, #0
	bl LoadBgTiles
	ldr r1, [r4]
	movs r0, #3
	movs r2, #0x60
	movs r3, #0
	bl LoadBgTiles
	ldr r0, _0819DB38
	ldr r4, _0819DB3C
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuSet
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #4
	movs r0, #1
	movs r3, #0
	bl LoadBgTilemap
	ldr r0, _0819DB40
	movs r1, #0
	movs r2, #0x40
	bl LoadPalette
	ldr r4, _0819DB44
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0xa
	bl LoadPalette
	adds r0, r4, #0
	movs r1, #0xe0
	movs r2, #0xa
	bl LoadPalette
	ldr r0, _0819DB48
	movs r1, #0x20
	movs r2, #4
	bl LoadPalette
	ldr r1, _0819DB4C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819DD16
	.align 2, 0
_0819DB28: .4byte 0x085DAD38
_0819DB2C: .4byte 0x0203CB0C
_0819DB30: .4byte 0x085DBA78
_0819DB34: .4byte 0x0203CB10
_0819DB38: .4byte 0x085DB178
_0819DB3C: .4byte 0x0203CB14
_0819DB40: .4byte 0x085DBAD8
_0819DB44: .4byte 0x085DC1C4
_0819DB48: .4byte 0x085DBB18
_0819DB4C: .4byte 0x03002360
_0819DB50:
	ldr r0, _0819DB74
	ldr r1, [r0]
	movs r0, #3
	bl SetBgTilemapBuffer
	ldr r1, _0819DB78
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #3
	movs r2, #0xb
	movs r3, #4
	bl CopyToBgTilemapBufferRect
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _0819DD0E
	.align 2, 0
_0819DB74: .4byte 0x0203CB18
_0819DB78: .4byte 0x085DB978
_0819DB7C:
	ldr r0, _0819DBA0
	bl LoadSpritePalettes
	ldr r0, _0819DBA4
	bl LoadSpriteSheets
	ldr r0, _0819DBA8
	bl LoadCompressedSpriteSheet
	ldr r0, _0819DBAC
	bl SetVBlankCallback
	ldr r1, _0819DBB0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819DD16
	.align 2, 0
_0819DBA0: .4byte 0x085DBEB8
_0819DBA4: .4byte 0x085DBE58
_0819DBA8: .4byte 0x085DBEA8
_0819DBAC: .4byte 0x0819C4E5
_0819DBB0: .4byte 0x03002360
_0819DBB4:
	ldr r0, _0819DBCC
	ldr r1, [r0]
	ldrb r0, [r1, #0x15]
	cmp r0, #1
	bne _0819DBC4
	ldr r0, _0819DBD0
	ldrb r0, [r0]
	strb r0, [r1, #3]
_0819DBC4:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	b _0819DD16
	.align 2, 0
_0819DBCC: .4byte 0x03001280
_0819DBD0: .4byte 0x0203CBEC
_0819DBD4:
	bl Swap_InitStruct
	bl Swap_InitAllSprites
	ldr r0, _0819DBF4
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	bne _0819DBEA
	bl Swap_ShowSummaryMonSprite
_0819DBEA:
	movs r0, #0
	bl Swap_InitActions
	b _0819DD0E
	.align 2, 0
_0819DBF4: .4byte 0x03001280
_0819DBF8:
	ldr r0, _0819DC10
	bl Swap_PrintOnInfoWindow
	movs r0, #2
	bl PutWindowTilemap
	ldr r1, _0819DC14
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819DD16
	.align 2, 0
_0819DC10: .4byte 0x085DC0C2
_0819DC14: .4byte 0x03002360
_0819DC18:
	bl Swap_PrintMonCategory
	movs r0, #8
	bl PutWindowTilemap
	b _0819DD0E
_0819DC24:
	ldr r0, _0819DC44
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	bne _0819DC32
	bl Swap_PrintMonSpecies
_0819DC32:
	movs r0, #1
	bl PutWindowTilemap
	ldr r1, _0819DC48
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819DD16
	.align 2, 0
_0819DC44: .4byte 0x03001280
_0819DC48: .4byte 0x03002360
_0819DC4C:
	bl Swap_PrintPkmnSwap
	movs r0, #0
	bl PutWindowTilemap
	b _0819DD0E
_0819DC58:
	ldr r0, _0819DC78
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	bne _0819DC66
	bl Swap_PrintActionString
_0819DC66:
	movs r0, #6
	bl PutWindowTilemap
	ldr r1, _0819DC7C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819DD16
	.align 2, 0
_0819DC78: .4byte 0x03001280
_0819DC7C: .4byte 0x03002360
_0819DC80:
	ldr r0, _0819DC90
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0819DD0E
	bl Swap_PrintMonSpecies2
	b _0819DD0E
	.align 2, 0
_0819DC90: .4byte 0x03001280
_0819DC94:
	bl Swap_PrintActionStrings2
	movs r0, #3
	bl PutWindowTilemap
	ldr r1, _0819DCA8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0819DD16
	.align 2, 0
_0819DCA8: .4byte 0x03002360
_0819DCAC:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
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
	ldr r0, _0819DCFC
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	bne _0819DD08
	movs r0, #3
	bl ShowBg
	ldr r1, _0819DD00
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _0819DD04
	movs r0, #0x52
	bl SetGpuReg
	b _0819DD0E
	.align 2, 0
_0819DCFC: .4byte 0x03001280
_0819DD00: .4byte 0x00001248
_0819DD04: .4byte 0x0000040B
_0819DD08:
	movs r0, #3
	bl HideBg
_0819DD0E:
	ldr r1, _0819DD20
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_0819DD16:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0819DDB2
	.align 2, 0
_0819DD20: .4byte 0x03002360
_0819DD24:
	ldr r0, _0819DD64
	movs r1, #0
	bl CreateTask
	ldr r6, _0819DD68
	ldr r1, [r6]
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, [r6]
	ldrb r5, [r0, #0x15]
	cmp r5, #0
	bne _0819DD74
	ldr r4, _0819DD6C
	adds r0, #0x21
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r5, [r0, #8]
	ldr r0, _0819DD70
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r5, [r0, #8]
	b _0819DDAC
	.align 2, 0
_0819DD64: .4byte 0x0819CC3D
_0819DD68: .4byte 0x03001280
_0819DD6C: .4byte 0x03005B60
_0819DD70: .4byte 0x0819CB29
_0819DD74:
	bl sub_0819E844
	ldr r4, _0819DDBC
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x21
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r3, #0
	movs r1, #1
	strh r1, [r0, #8]
	adds r2, #0x22
	strb r3, [r2]
	ldr r0, _0819DDC0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #2
	strh r1, [r0, #8]
_0819DDAC:
	ldr r0, _0819DDC4
	bl SetMainCallback2
_0819DDB2:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819DDBC: .4byte 0x03005B60
_0819DDC0: .4byte 0x0819CA1D
_0819DDC4: .4byte 0x0819C4C9
	thumb_func_end CB2_InitSwapScreen

	thumb_func_start Swap_InitAllSprites
Swap_InitAllSprites: @ 0x0819DDC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r1, sp
	ldr r0, _0819E1B8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	mov r1, sp
	movs r0, #0x65
	strh r0, [r1, #2]
	movs r6, #0
	ldr r4, _0819E1BC
	movs r7, #0
	ldr r5, _0819E1C0
_0819DDEE:
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #0x14
	movs r3, #0x90
	lsls r3, r3, #0xf
	adds r1, r1, r3
	asrs r1, r1, #0x10
	mov r0, sp
	movs r2, #0x40
	movs r3, #1
	bl CreateSprite
	ldr r1, [r4]
	adds r1, #5
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #5
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r7, [r0, #0x2e]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0819DDEE
	ldr r7, _0819E1BC
	ldr r1, [r7]
	adds r0, r1, #5
	ldrb r1, [r1, #3]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0819E1C0
	adds r0, r0, r4
	movs r5, #0x20
	ldrsh r1, [r0, r5]
	ldr r0, _0819E1C4
	movs r2, #0x58
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	movs r4, #0
	strb r0, [r1, #4]
	ldr r0, _0819E1C8
	movs r1, #0xb0
	movs r2, #0x70
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #1]
	ldr r0, _0819E1CC
	movs r1, #0xb0
	movs r2, #0x90
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #2]
	ldr r0, [r7]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r6, _0819E1C0
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x28
	strb r4, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x29
	strb r4, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x28
	strb r4, [r0]
	ldr r0, [r7]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x29
	strb r4, [r0]
	ldr r0, [r7]
	ldrb r0, [r0, #0x15]
	movs r1, #0xc0
	str r1, [sp, #0x18]
	cmp r0, #1
	bne _0819DEF0
	movs r2, #0xf0
	str r2, [sp, #0x18]
_0819DEF0:
	mov r1, sp
	ldr r0, _0819E1C4
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	mov r0, sp
	movs r4, #0x68
	mov sl, r4
	mov r5, sl
	strh r5, [r0]
	movs r1, #0xf0
	movs r2, #0x78
	movs r3, #0xa
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #8]
	mov r1, sp
	ldr r0, _0819E1C8
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	mov r0, sp
	movs r1, #0x69
	mov sb, r1
	mov r2, sb
	strh r2, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0xa
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #9]
	movs r5, #0x90
	lsls r5, r5, #1
	mov r0, sp
	adds r1, r5, #0
	movs r2, #0x78
	movs r3, #0xa
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #0xa]
	mov r1, sp
	ldr r0, _0819E1C4
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	mov r0, sp
	movs r3, #0x6a
	mov r8, r3
	mov r6, r8
	strh r6, [r0]
	movs r1, #0xf0
	movs r2, #0x78
	movs r3, #1
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #0xb]
	mov r1, sp
	ldr r0, _0819E1C8
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	mov r1, sp
	movs r0, #0x6b
	strh r0, [r1]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #1
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #0xc]
	mov r0, sp
	movs r6, #0x6c
	strh r6, [r0]
	adds r1, r5, #0
	movs r2, #0x78
	movs r3, #1
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #0xd]
	mov r1, sp
	ldr r0, _0819E1C4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	mov r0, sp
	mov r4, sl
	strh r4, [r0]
	ldr r1, [sp, #0x18]
	movs r2, #0x90
	movs r3, #0xa
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #0xe]
	mov r1, sp
	ldr r0, _0819E1C8
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	mov r0, sp
	mov r3, sb
	strh r3, [r0]
	ldr r4, [sp, #0x18]
	adds r4, #0x10
	adds r1, r4, #0
	movs r2, #0x90
	movs r3, #0xa
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #0xf]
	mov r1, sp
	ldr r0, _0819E1C4
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	mov r0, sp
	mov r5, r8
	strh r5, [r0]
	ldr r1, [sp, #0x18]
	movs r2, #0x90
	movs r3, #1
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #0x10]
	mov r1, sp
	ldr r0, _0819E1C8
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	mov r0, sp
	strh r6, [r0]
	adds r1, r4, #0
	movs r2, #0x90
	movs r3, #1
	bl CreateSprite
	ldr r1, [r7]
	strb r0, [r1, #0x11]
	movs r6, #0
	ldr r5, _0819E1C0
	adds r4, r7, #0
	movs r7, #0
	movs r0, #4
	mov sl, r0
_0819E038:
	ldr r0, [r4]
	lsls r3, r6, #1
	adds r2, r3, r6
	adds r0, #8
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x28
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #8
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x29
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #9
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x28
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #9
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x29
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #0xa
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x28
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #0xa
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x29
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #0xe
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x28
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #0xe
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x29
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #0xf
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x28
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #0xf
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x29
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #8
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	mov r8, r0
	ldrb r1, [r0]
	mov r0, sl
	orrs r1, r0
	mov r0, r8
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #9
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	mov r8, r0
	ldrb r1, [r0]
	mov r0, sl
	orrs r1, r0
	mov r0, r8
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0xa
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	mov r2, sl
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0xe
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0xf
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, _0819E1BC
	mov r8, r3
	ldr r0, _0819E1C0
	mov sb, r0
	cmp r6, #1
	bhi _0819E19E
	b _0819E038
_0819E19E:
	ldr r0, [r3]
	ldrb r0, [r0, #0xe]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sb
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r3, #5
	rsbs r3, r3, #0
	adds r0, r3, #0
	b _0819E1D0
	.align 2, 0
_0819E1B8: .4byte 0x085DC03C
_0819E1BC: .4byte 0x03001280
_0819E1C0: .4byte 0x020205AC
_0819E1C4: .4byte 0x085DC054
_0819E1C8: .4byte 0x085DC06C
_0819E1CC: .4byte 0x085DC084
_0819E1D0:
	ands r0, r2
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	ldrb r1, [r0, #0xf]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r0]
	mov r2, r8
	ldr r0, [r2]
	ldrb r1, [r0, #8]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r0]
	mov r4, r8
	ldr r0, [r4]
	ldrb r1, [r0, #9]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Swap_InitAllSprites

	thumb_func_start Swap_DestroyAllSprites
Swap_DestroyAllSprites: @ 0x0819E240
	push {r4, r5, r6, r7, lr}
	movs r5, #0
_0819E244:
	ldr r6, _0819E308
	ldr r0, [r6]
	adds r0, #5
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0819E30C
	adds r0, r0, r4
	bl DestroySprite
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0819E244
	ldr r0, [r6]
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r6]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r6]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	movs r5, #0
_0819E298:
	movs r4, #0
	lsls r6, r5, #1
_0819E29C:
	ldr r0, _0819E308
	ldr r0, [r0]
	adds r1, r6, r5
	adds r1, r4, r1
	adds r0, #8
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0819E30C
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0819E29C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _0819E298
	movs r5, #0
_0819E2CE:
	movs r4, #0
	adds r7, r5, #1
	lsls r6, r5, #1
_0819E2D4:
	ldr r0, _0819E308
	ldr r0, [r0]
	adds r1, r4, r6
	adds r0, #0xe
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0819E30C
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0819E2D4
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _0819E2CE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819E308: .4byte 0x03001280
_0819E30C: .4byte 0x020205AC
	thumb_func_end Swap_DestroyAllSprites

	thumb_func_start Swap_HandleActionCursorChange
Swap_HandleActionCursorChange: @ 0x0819E310
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bhi _0819E364
	ldr r4, _0819E35C
	ldr r5, _0819E360
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	bl sub_0819E5F4
	ldr r0, [r5]
	ldrb r2, [r0, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r0, #5
	adds r0, r0, r6
	ldrb r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x20]
	strh r0, [r1, #0x20]
	b _0819E38C
	.align 2, 0
_0819E35C: .4byte 0x020205AC
_0819E360: .4byte 0x03001280
_0819E364:
	ldr r2, _0819E394
	ldr r3, _0819E398
	ldr r0, [r3]
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldr r1, [r0, #0x18]
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0819E540
_0819E38C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819E394: .4byte 0x020205AC
_0819E398: .4byte 0x03001280
	thumb_func_end Swap_HandleActionCursorChange

	thumb_func_start Swap_UpdateBallCursorPosition
Swap_UpdateBallCursorPosition: @ 0x0819E39C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	lsls r4, r4, #0x18
	cmp r4, #0
	ble _0819E3C8
	ldr r1, _0819E3C4
	ldr r2, [r1]
	ldrb r0, [r2, #3]
	adds r0, #1
	ldrb r3, [r2, #0x17]
	cmp r0, r3
	bne _0819E3E0
	movs r0, #0
	b _0819E3E0
	.align 2, 0
_0819E3C4: .4byte 0x03001280
_0819E3C8:
	ldr r0, _0819E3D8
	ldr r2, [r0]
	ldrb r3, [r2, #3]
	adds r1, r0, #0
	cmp r3, #0
	beq _0819E3DC
	subs r0, r3, #1
	b _0819E3E0
	.align 2, 0
_0819E3D8: .4byte 0x03001280
_0819E3DC:
	ldrb r0, [r2, #0x17]
	subs r0, #1
_0819E3E0:
	strb r0, [r2, #3]
	ldr r0, [r1]
	ldrb r0, [r0, #3]
	bl Swap_HandleActionCursorChange
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Swap_UpdateBallCursorPosition

	thumb_func_start Swap_UpdateActionCursorPosition
Swap_UpdateActionCursorPosition: @ 0x0819E3F0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	lsls r4, r4, #0x18
	cmp r4, #0
	ble _0819E430
	ldr r0, _0819E418
	ldr r2, [r0]
	ldrb r1, [r2, #3]
	adds r4, r0, #0
	cmp r1, #2
	bhi _0819E41C
	movs r0, #3
	strb r0, [r2, #3]
	b _0819E452
	.align 2, 0
_0819E418: .4byte 0x03001280
_0819E41C:
	ldrb r0, [r2, #3]
	adds r0, #1
	ldrb r1, [r2, #0x17]
	cmp r0, r1
	beq _0819E42A
	strb r0, [r2, #3]
	b _0819E452
_0819E42A:
	movs r0, #0
	strb r0, [r2, #3]
	b _0819E452
_0819E430:
	ldr r0, _0819E448
	ldr r1, [r0]
	ldrb r3, [r1, #3]
	adds r2, r3, #0
	adds r4, r0, #0
	cmp r2, #2
	bls _0819E44C
	cmp r2, #0
	beq _0819E44C
	subs r0, r3, #1
	b _0819E450
	.align 2, 0
_0819E448: .4byte 0x03001280
_0819E44C:
	ldrb r0, [r1, #0x17]
	subs r0, #1
_0819E450:
	strb r0, [r1, #3]
_0819E452:
	ldr r0, [r4]
	ldrb r0, [r0, #3]
	bl Swap_HandleActionCursorChange
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Swap_UpdateActionCursorPosition

	thumb_func_start Swap_UpdateYesNoCursorPosition
Swap_UpdateYesNoCursorPosition: @ 0x0819E460
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0819E480
	ldr r0, _0819E478
	ldr r1, [r0]
	ldrb r3, [r1, #0x16]
	adds r2, r0, #0
	cmp r3, #1
	beq _0819E47C
	adds r0, r3, #1
	b _0819E496
	.align 2, 0
_0819E478: .4byte 0x03001280
_0819E47C:
	movs r0, #0
	b _0819E496
_0819E480:
	ldr r0, _0819E490
	ldr r1, [r0]
	ldrb r3, [r1, #0x16]
	adds r2, r0, #0
	cmp r3, #0
	beq _0819E494
	subs r0, r3, #1
	b _0819E496
	.align 2, 0
_0819E490: .4byte 0x03001280
_0819E494:
	movs r0, #1
_0819E496:
	strb r0, [r1, #0x16]
	ldr r3, _0819E4C4
	ldr r2, [r2]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x16]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	ldrb r0, [r2, #2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x16]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	pop {r0}
	bx r0
	.align 2, 0
_0819E4C4: .4byte 0x020205AC
	thumb_func_end Swap_UpdateYesNoCursorPosition

	thumb_func_start Swap_UpdateMenuCursorPosition
Swap_UpdateMenuCursorPosition: @ 0x0819E4C8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	lsls r4, r4, #0x18
	cmp r4, #0
	ble _0819E4F4
	ldr r0, _0819E4EC
	ldr r1, [r0]
	ldrb r3, [r1]
	adds r2, r0, #0
	cmp r3, #2
	beq _0819E4F0
	adds r0, r3, #1
	b _0819E50A
	.align 2, 0
_0819E4EC: .4byte 0x03001280
_0819E4F0:
	movs r0, #0
	b _0819E50A
_0819E4F4:
	ldr r0, _0819E504
	ldr r1, [r0]
	ldrb r3, [r1]
	adds r2, r0, #0
	cmp r3, #0
	beq _0819E508
	subs r0, r3, #1
	b _0819E50A
	.align 2, 0
_0819E504: .4byte 0x03001280
_0819E508:
	movs r0, #2
_0819E50A:
	strb r0, [r1]
	ldr r3, _0819E53C
	ldr r2, [r2]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	ldrb r0, [r2, #2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819E53C: .4byte 0x020205AC
	thumb_func_end Swap_UpdateMenuCursorPosition

	thumb_func_start sub_0819E540
sub_0819E540: @ 0x0819E540
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	movs r0, #5
	rsbs r0, r0, #0
	mov sb, r0
	movs r2, #4
	mov r8, r2
	ldr r0, _0819E598
	mov ip, r0
	ldr r7, _0819E59C
_0819E55E:
	cmp r6, #2
	bne _0819E5A0
	ldr r5, _0819E598
	ldr r3, _0819E59C
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	strb r0, [r1]
	cmp r4, #1
	bhi _0819E5DC
	ldr r0, [r3]
	adds r0, #0x10
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	b _0819E5D2
	.align 2, 0
_0819E598: .4byte 0x020205AC
_0819E59C: .4byte 0x03001280
_0819E5A0:
	cmp r6, #3
	bne _0819E5DC
	cmp r4, #1
	bhi _0819E5C2
	ldr r0, [r7]
	adds r0, #0x10
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	adds r1, #0x3e
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	strb r0, [r1]
_0819E5C2:
	ldr r0, [r7]
	adds r0, #0xb
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
_0819E5D2:
	adds r0, #0x3e
	ldrb r1, [r0]
	mov r2, r8
	orrs r1, r2
	strb r1, [r0]
_0819E5DC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0819E55E
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819E540

	thumb_func_start sub_0819E5F4
sub_0819E5F4: @ 0x0819E5F4
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r5, _0819E644
	ldr r4, _0819E648
	adds r6, r5, #0
	movs r3, #4
_0819E600:
	ldr r0, [r4]
	adds r0, #0xb
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	cmp r2, #1
	bhi _0819E634
	ldr r0, [r4]
	adds r0, #0x10
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
_0819E634:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _0819E600
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819E644: .4byte 0x020205AC
_0819E648: .4byte 0x03001280
	thumb_func_end sub_0819E5F4

	thumb_func_start Swap_ShowMenuOptions
Swap_ShowMenuOptions: @ 0x0819E64C
	push {r4, r5, lr}
	ldr r0, _0819E660
	ldr r3, [r0]
	ldrb r1, [r3, #0x15]
	adds r5, r0, #0
	cmp r1, #1
	bne _0819E664
	movs r0, #0
	strb r0, [r3, #0x15]
	b _0819E668
	.align 2, 0
_0819E660: .4byte 0x03001280
_0819E664:
	movs r0, #0
	strb r0, [r3]
_0819E668:
	ldr r4, _0819E6E4
	ldr r2, [r5]
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xb0
	strh r1, [r0, #0x20]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	ldrb r1, [r2, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xd0
	strh r1, [r0, #0x20]
	ldrb r0, [r2, #2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, #0x70
	strh r0, [r1, #0x22]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	bl Swap_PrintMenuOptions
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819E6E4: .4byte 0x020205AC
	thumb_func_end Swap_ShowMenuOptions

	thumb_func_start Swap_ShowYesNoOptions
Swap_ShowYesNoOptions: @ 0x0819E6E8
	push {r4, r5, lr}
	ldr r5, _0819E764
	ldr r1, [r5]
	movs r0, #0
	strb r0, [r1, #0x16]
	ldr r4, _0819E768
	ldr r2, [r5]
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xb0
	strh r1, [r0, #0x20]
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r3, #0x70
	strh r3, [r0, #0x22]
	ldrb r1, [r2, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xd0
	strh r1, [r0, #0x20]
	ldrb r1, [r2, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r3, [r0, #0x22]
	ldrb r0, [r2, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	bl Swap_PrintYesNoOptions
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819E764: .4byte 0x03001280
_0819E768: .4byte 0x020205AC
	thumb_func_end Swap_ShowYesNoOptions

	thumb_func_start sub_0819E76C
sub_0819E76C: @ 0x0819E76C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0819E7C0
	ldr r3, _0819E7C4
	ldr r0, [r3]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	adds r0, r4, #0
	bl ClearWindowTilemap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819E7C0: .4byte 0x020205AC
_0819E7C4: .4byte 0x03001280
	thumb_func_end sub_0819E76C

	thumb_func_start sub_0819E7C8
sub_0819E7C8: @ 0x0819E7C8
	push {lr}
	movs r0, #6
	bl PutWindowTilemap
	movs r0, #6
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #6
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819E7C8

	thumb_func_start sub_0819E7FC
sub_0819E7FC: @ 0x0819E7FC
	push {lr}
	sub sp, #0xc
	movs r0, #0
	bl PutWindowTilemap
	ldr r2, _0819E840
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0x48
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #7
	bl PutWindowTilemap
	movs r0, #7
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #7
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819E840: .4byte 0x085DC13C
	thumb_func_end sub_0819E7FC

	thumb_func_start sub_0819E844
sub_0819E844: @ 0x0819E844
	push {lr}
	bl sub_0819E7C8
	movs r0, #5
	bl PutWindowTilemap
	movs r0, #5
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #5
	movs r1, #2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_0819E844

	thumb_func_start Swap_PrintPkmnSwap
Swap_PrintPkmnSwap: @ 0x0819E864
	push {lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _0819E894
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819E894: .4byte 0x085DC0B4
	thumb_func_end Swap_PrintPkmnSwap

	thumb_func_start Swap_PrintMonSpecies
Swap_PrintMonSpecies: @ 0x0819E898
	push {r4, lr}
	sub sp, #0xc
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0819E8B8
	ldr r1, [r0]
	ldrb r0, [r1, #3]
	cmp r0, #2
	bls _0819E8BC
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	b _0819E924
	.align 2, 0
_0819E8B8: .4byte 0x03001280
_0819E8BC:
	ldrb r2, [r1, #3]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _0819E8D0
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, _0819E8CC
	b _0819E8D6
	.align 2, 0
_0819E8CC: .4byte 0x02024190
_0819E8D0:
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, _0819E92C
_0819E8D6:
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0819E930
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0819E934
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #5
	subs r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldr r0, _0819E938
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized3
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
_0819E924:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819E92C: .4byte 0x020243E8
_0819E930: .4byte 0x02021C7C
_0819E934: .4byte 0x082EA31C
_0819E938: .4byte 0x085DC1D1
	thumb_func_end Swap_PrintMonSpecies

	thumb_func_start Swap_PrintOnInfoWindow
Swap_PrintOnInfoWindow: @ 0x0819E93C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #5
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	adds r2, r4, #0
	movs r3, #4
	bl AddTextPrinterParameterized
	movs r0, #2
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Swap_PrintOnInfoWindow

	thumb_func_start Swap_PrintMenuOptions
Swap_PrintMenuOptions: @ 0x0819E970
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #3
	bl PutWindowTilemap
	movs r0, #3
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r5, _0819E9D4
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r0, _0819E9D8
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #2
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	ldr r0, _0819E9DC
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	ldr r0, _0819E9E0
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x22
	bl AddTextPrinterParameterized3
	movs r0, #3
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819E9D4: .4byte 0x085DC1CE
_0819E9D8: .4byte 0x085DC0ED
_0819E9DC: .4byte 0x085DC0E8
_0819E9E0: .4byte 0x085DC0F4
	thumb_func_end Swap_PrintMenuOptions

	thumb_func_start Swap_PrintYesNoOptions
Swap_PrintYesNoOptions: @ 0x0819E9E4
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #4
	bl PutWindowTilemap
	movs r0, #4
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r5, _0819EA34
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r0, _0819EA38
	str r0, [sp, #8]
	movs r0, #4
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	ldr r0, _0819EA3C
	str r0, [sp, #8]
	movs r0, #4
	movs r1, #1
	movs r2, #0
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	movs r0, #4
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819EA34: .4byte 0x085DC1CE
_0819EA38: .4byte 0x085DC10C
_0819EA3C: .4byte 0x085DC10F
	thumb_func_end Swap_PrintYesNoOptions

	thumb_func_start Swap_PrintActionString
Swap_PrintActionString: @ 0x0819EA40
	push {lr}
	sub sp, #0xc
	movs r0, #6
	bl PutWindowTilemap
	movs r0, #6
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0819EA74
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	cmp r1, #0
	bne _0819EA80
	ldr r0, _0819EA78
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0819EA7C
	str r0, [sp, #8]
	movs r0, #6
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	b _0819EA98
	.align 2, 0
_0819EA74: .4byte 0x03001280
_0819EA78: .4byte 0x085DC1D1
_0819EA7C: .4byte 0x085DC121
_0819EA80:
	ldr r0, _0819EAA8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819EAAC
	str r0, [sp, #8]
	movs r0, #6
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
_0819EA98:
	movs r0, #6
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819EAA8: .4byte 0x085DC1D1
_0819EAAC: .4byte 0x085DC126
	thumb_func_end Swap_PrintActionString

	thumb_func_start Swap_PrintActionStrings
Swap_PrintActionStrings: @ 0x0819EAB0
	push {lr}
	sub sp, #0xc
	movs r0, #5
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0819EB08
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _0819EAE2
	cmp r0, #1
	bne _0819EAFA
	ldr r0, _0819EB0C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819EB10
	str r0, [sp, #8]
	movs r0, #5
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AddTextPrinterParameterized3
_0819EAE2:
	ldr r0, _0819EB0C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819EB14
	str r0, [sp, #8]
	movs r0, #5
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x18
	bl AddTextPrinterParameterized3
_0819EAFA:
	movs r0, #5
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819EB08: .4byte 0x03001280
_0819EB0C: .4byte 0x085DC1CE
_0819EB10: .4byte 0x085DC113
_0819EB14: .4byte 0x085DC11C
	thumb_func_end Swap_PrintActionStrings

	thumb_func_start Swap_PrintActionStrings2
Swap_PrintActionStrings2: @ 0x0819EB18
	push {lr}
	sub sp, #0xc
	movs r0, #3
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0819EB70
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _0819EB4A
	cmp r0, #1
	bne _0819EB62
	ldr r0, _0819EB74
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819EB78
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl AddTextPrinterParameterized3
_0819EB4A:
	ldr r0, _0819EB74
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819EB7C
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x20
	bl AddTextPrinterParameterized3
_0819EB62:
	movs r0, #3
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819EB70: .4byte 0x03001280
_0819EB74: .4byte 0x085DC1CE
_0819EB78: .4byte 0x085DC113
_0819EB7C: .4byte 0x085DC11C
	thumb_func_end Swap_PrintActionStrings2

	thumb_func_start Swap_PrintOneActionString
Swap_PrintOneActionString: @ 0x0819EB80
	push {lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0819EB92
	cmp r1, #1
	beq _0819EBC0
	b _0819EBD8
_0819EB92:
	ldr r0, _0819EBB4
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #1
	bne _0819EBD8
	ldr r0, _0819EBB8
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0819EBBC
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl AddTextPrinterParameterized3
	b _0819EBD8
	.align 2, 0
_0819EBB4: .4byte 0x03001280
_0819EBB8: .4byte 0x085DC1CE
_0819EBBC: .4byte 0x085DC113
_0819EBC0:
	ldr r0, _0819EBE8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819EBEC
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x20
	bl AddTextPrinterParameterized3
_0819EBD8:
	movs r0, #3
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0819EBE8: .4byte 0x085DC1CE
_0819EBEC: .4byte 0x085DC11C
	thumb_func_end Swap_PrintOneActionString

	thumb_func_start Swap_PrintMonSpecies2
Swap_PrintMonSpecies2: @ 0x0819EBF0
	push {r4, lr}
	sub sp, #0x18
	ldr r0, _0819EC18
	add r1, sp, #0xc
	movs r2, #4
	bl CpuSet
	ldr r0, _0819EC1C
	ldr r2, [r0]
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	bne _0819EC24
	add r0, sp, #0xc
	ldr r1, _0819EC20
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r0, #8]
	b _0819EC2A
	.align 2, 0
_0819EC18: .4byte 0x085DC1C4
_0819EC1C: .4byte 0x03001280
_0819EC20: .4byte 0x020377B4
_0819EC24:
	add r1, sp, #0xc
	ldrh r0, [r2, #0x24]
	strh r0, [r1, #8]
_0819EC2A:
	add r0, sp, #0xc
	movs r1, #0xf0
	movs r2, #0xa
	bl LoadPalette
	movs r0, #0
	bl PutWindowTilemap
	ldr r0, _0819EC5C
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	cmp r1, #0
	bne _0819EC68
	ldr r0, _0819EC60
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0819EC64
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x48
	movs r3, #2
	bl AddTextPrinterParameterized3
	b _0819EC80
	.align 2, 0
_0819EC5C: .4byte 0x03001280
_0819EC60: .4byte 0x085DC1D1
_0819EC64: .4byte 0x085DC121
_0819EC68:
	ldr r0, _0819ECAC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819ECB0
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	movs r2, #0x48
	movs r3, #2
	bl AddTextPrinterParameterized3
_0819EC80:
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #7
	bl PutWindowTilemap
	movs r0, #7
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0819ECB4
	ldr r1, [r0]
	ldrb r0, [r1, #3]
	cmp r0, #2
	bls _0819ECB8
	movs r0, #7
	movs r1, #3
	bl CopyWindowToVram
	b _0819ED20
	.align 2, 0
_0819ECAC: .4byte 0x085DC1D1
_0819ECB0: .4byte 0x085DC126
_0819ECB4: .4byte 0x03001280
_0819ECB8:
	ldrb r2, [r1, #3]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _0819ECCC
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, _0819ECC8
	b _0819ECD2
	.align 2, 0
_0819ECC8: .4byte 0x02024190
_0819ECCC:
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, _0819ED28
_0819ECD2:
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0819ED2C
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0819ED30
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #5
	subs r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldr r0, _0819ED34
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #7
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized3
	movs r0, #7
	movs r1, #3
	bl CopyWindowToVram
_0819ED20:
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819ED28: .4byte 0x020243E8
_0819ED2C: .4byte 0x02021C7C
_0819ED30: .4byte 0x082EA31C
_0819ED34: .4byte 0x085DC1D1
	thumb_func_end Swap_PrintMonSpecies2

	thumb_func_start Swap_PrintMonSpecies3
Swap_PrintMonSpecies3: @ 0x0819ED38
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0819ED78
	movs r1, #0xe0
	movs r2, #0xa
	bl LoadPalette
	ldr r0, _0819ED7C
	ldr r1, _0819ED80
	movs r2, #5
	bl CpuSet
	movs r0, #6
	bl PutWindowTilemap
	ldr r0, _0819ED84
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	cmp r1, #0
	bne _0819ED90
	ldr r0, _0819ED88
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0819ED8C
	str r0, [sp, #8]
	movs r0, #6
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	b _0819EDA8
	.align 2, 0
_0819ED78: .4byte 0x085DC1C4
_0819ED7C: .4byte 0x02037594
_0819ED80: .4byte 0x02037974
_0819ED84: .4byte 0x03001280
_0819ED88: .4byte 0x085DC1D1
_0819ED8C: .4byte 0x085DC121
_0819ED90:
	ldr r0, _0819EDC4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0819EDC8
	str r0, [sp, #8]
	movs r0, #6
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
_0819EDA8:
	movs r0, #6
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _0819EDCC
	ldr r1, [r0]
	ldrb r0, [r1, #3]
	cmp r0, #2
	bls _0819EDD0
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	b _0819EE38
	.align 2, 0
_0819EDC4: .4byte 0x085DC1D1
_0819EDC8: .4byte 0x085DC126
_0819EDCC: .4byte 0x03001280
_0819EDD0:
	ldrb r2, [r1, #3]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _0819EDE4
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, _0819EDE0
	b _0819EDEA
	.align 2, 0
_0819EDE0: .4byte 0x02024190
_0819EDE4:
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, _0819EE40
_0819EDEA:
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0819EE44
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0819EE48
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #5
	subs r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldr r0, _0819EE4C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized3
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
_0819EE38:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819EE40: .4byte 0x020243E8
_0819EE44: .4byte 0x02021C7C
_0819EE48: .4byte 0x082EA31C
_0819EE4C: .4byte 0x085DC1D1
	thumb_func_end Swap_PrintMonSpecies3

	thumb_func_start Swap_PrintMonCategory
Swap_PrintMonCategory: @ 0x0819EE50
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r6, _0819EE74
	ldr r0, [r6]
	ldrb r4, [r0, #3]
	adds r5, r4, #0
	movs r0, #8
	movs r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #2
	bls _0819EE78
	movs r0, #8
	movs r1, #2
	bl CopyWindowToVram
	b _0819EF20
	.align 2, 0
_0819EE74: .4byte 0x03001280
_0819EE78:
	movs r0, #8
	bl PutWindowTilemap
	ldr r0, [r6]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _0819EE94
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _0819EE90
	b _0819EE9A
	.align 2, 0
_0819EE90: .4byte 0x02024190
_0819EE94:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0819EF28
_0819EE9A:
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #0
	ldr r1, _0819EF2C
	lsls r3, r5, #3
	subs r0, r3, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0819EEEA
	adds r6, r1, #0
_0819EEC4:
	mov r2, sp
	adds r2, r2, r4
	adds r2, #0xc
	subs r1, r3, r5
	lsls r1, r1, #2
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
	cmp r0, #0
	beq _0819EEEA
	cmp r4, #4
	bls _0819EEC4
_0819EEEA:
	mov r1, sp
	adds r1, r1, r4
	adds r1, #0xc
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0819EF30
	add r0, sp, #0xc
	bl StringAppend
	movs r3, #5
	subs r3, r3, r4
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x18
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	movs r1, #1
	add r2, sp, #0xc
	bl AddTextPrinterParameterized
	movs r0, #8
	movs r1, #2
	bl CopyWindowToVram
_0819EF20:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819EF28: .4byte 0x020243E8
_0819EF2C: .4byte 0x0854069C
_0819EF30: .4byte 0x085C8C66
	thumb_func_end Swap_PrintMonCategory

	thumb_func_start Swap_InitActions
Swap_InitActions: @ 0x0819EF34
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r4, _0819EF50
	ldr r3, [r4]
	ldrb r0, [r3, #0x15]
	cmp r0, #1
	beq _0819EF80
	cmp r2, #0
	beq _0819EF54
	cmp r2, #1
	beq _0819EF6C
	b _0819EF80
	.align 2, 0
_0819EF50: .4byte 0x03001280
_0819EF54:
	strb r2, [r3, #0x14]
	ldr r0, [r4]
	strb r2, [r0, #3]
	ldr r1, [r4]
	movs r0, #4
	strb r0, [r1, #0x17]
	ldr r1, [r4]
	ldr r0, _0819EF68
	b _0819EF7E
	.align 2, 0
_0819EF68: .4byte 0x085DC1D4
_0819EF6C:
	movs r1, #0
	strb r2, [r3, #0x14]
	ldr r0, [r4]
	strb r1, [r0, #3]
	ldr r1, [r4]
	movs r0, #5
	strb r0, [r1, #0x17]
	ldr r1, [r4]
	ldr r0, _0819EF88
_0819EF7E:
	str r0, [r1, #0x18]
_0819EF80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819EF88: .4byte 0x085DC1F4
	thumb_func_end Swap_InitActions

	thumb_func_start Swap_RunMenuOptionFunc
Swap_RunMenuOptionFunc: @ 0x0819EF8C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0819EFAC
	ldr r2, _0819EFB0
	ldr r1, _0819EFB4
	ldr r1, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r3]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0819EFAC: .4byte 0x0300127C
_0819EFB0: .4byte 0x085DC158
_0819EFB4: .4byte 0x03001280
	thumb_func_end Swap_RunMenuOptionFunc

	thumb_func_start sub_0819EFB8
sub_0819EFB8: @ 0x0819EFB8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0819EFF4
	ldr r1, [r5]
	ldr r0, [r1, #0x2c]
	adds r1, #0x30
	movs r2, #1
	bl sub_0819F2E4
	ldr r0, [r5]
	ldrb r1, [r0, #3]
	movs r5, #0
	strb r1, [r0, #0x12]
	movs r0, #3
	bl sub_0819E76C
	ldr r1, _0819EFF8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #8]
	ldr r1, _0819EFFC
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819EFF4: .4byte 0x03001280
_0819EFF8: .4byte 0x03005B60
_0819EFFC: .4byte 0x0819D6D5
	thumb_func_end sub_0819EFB8

	thumb_func_start sub_0819F000
sub_0819F000: @ 0x0819F000
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819F018
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #6
	strh r0, [r1, #8]
	ldr r0, _0819F01C
	str r0, [r1]
	bx lr
	.align 2, 0
_0819F018: .4byte 0x03005B60
_0819F01C: .4byte 0x0819C5F5
	thumb_func_end sub_0819F000

	thumb_func_start sub_0819F020
sub_0819F020: @ 0x0819F020
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0819F060
	ldr r1, [r0]
	ldr r0, [r1, #0x2c]
	adds r1, #0x30
	movs r2, #1
	bl sub_0819F2E4
	movs r0, #3
	bl sub_0819E76C
	ldr r1, _0819F064
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	ldr r2, _0819F068
	lsrs r1, r2, #0x10
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	movs r1, #1
	strh r1, [r0, #0x12]
	ldr r1, _0819F06C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819F060: .4byte 0x03001280
_0819F064: .4byte 0x03005B60
_0819F068: .4byte 0x0819CB29
_0819F06C: .4byte 0x0819D459
	thumb_func_end sub_0819F020

	thumb_func_start Swap_RunActionFunc
Swap_RunActionFunc: @ 0x0819F070
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0819F090
	ldr r1, _0819F094
	ldr r2, [r1]
	ldrb r1, [r2, #3]
	ldr r2, [r2, #0x18]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r1, [r1, #4]
	str r1, [r3]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0819F090: .4byte 0x0300127C
_0819F094: .4byte 0x03001280
	thumb_func_end Swap_RunActionFunc

	thumb_func_start Swap_ActionCancel
Swap_ActionCancel: @ 0x0819F098
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819F0BC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _0819F0C0
	lsrs r0, r2, #0x10
	movs r3, #0
	strh r0, [r1, #0x14]
	strh r2, [r1, #0x16]
	strh r3, [r1, #8]
	strh r3, [r1, #0x12]
	ldr r0, _0819F0C4
	str r0, [r1]
	bx lr
	.align 2, 0
_0819F0BC: .4byte 0x03005B60
_0819F0C0: .4byte 0x0819C90D
_0819F0C4: .4byte 0x0819D271
	thumb_func_end Swap_ActionCancel

	thumb_func_start Swap_ActionPkmnForSwap
Swap_ActionPkmnForSwap: @ 0x0819F0C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819F0EC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _0819F0F0
	lsrs r0, r2, #0x10
	movs r3, #0
	strh r0, [r1, #0x14]
	strh r2, [r1, #0x16]
	strh r3, [r1, #0x12]
	strh r3, [r1, #8]
	ldr r0, _0819F0F4
	str r0, [r1]
	bx lr
	.align 2, 0
_0819F0EC: .4byte 0x03005B60
_0819F0F0: .4byte 0x0819D6D5
_0819F0F4: .4byte 0x0819D271
	thumb_func_end Swap_ActionPkmnForSwap

	thumb_func_start Swap_ActionMon
Swap_ActionMon: @ 0x0819F0F8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _0819F120
	ldr r1, [r5]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _0819F12C
	ldr r3, _0819F124
	lsls r4, r6, #2
	adds r0, r4, r6
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r2, _0819F128
	lsrs r1, r2, #0x10
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	movs r1, #2
	strh r1, [r0, #0x12]
	b _0819F17E
	.align 2, 0
_0819F120: .4byte 0x03001280
_0819F124: .4byte 0x03005B60
_0819F128: .4byte 0x0819CA1D
_0819F12C:
	ldrb r0, [r1, #3]
	bl Swap_AlreadyHasSameSpecies
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _0819F164
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x2d
	adds r1, #0x30
	movs r2, #1
	bl sub_0819F1A0
	ldr r1, _0819F15C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	strh r4, [r0, #0x12]
	ldr r1, _0819F160
	b _0819F18A
	.align 2, 0
_0819F15C: .4byte 0x03005B60
_0819F160: .4byte 0x0819F375
_0819F164:
	ldr r4, _0819F194
	lsls r5, r6, #2
	adds r0, r5, r6
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r2, _0819F198
	lsrs r1, r2, #0x10
	movs r3, #0
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	strh r3, [r0, #0x12]
	adds r3, r4, #0
	adds r4, r5, #0
_0819F17E:
	adds r0, r4, r6
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #8]
	ldr r1, _0819F19C
_0819F18A:
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819F194: .4byte 0x03005B60
_0819F198: .4byte 0x0819C9BD
_0819F19C: .4byte 0x0819D271
	thumb_func_end Swap_ActionMon

	thumb_func_start sub_0819F1A0
sub_0819F1A0: @ 0x0819F1A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r5, r2, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0819F1E4
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #1
	bl CreateSprite
	strb r0, [r4]
	ldr r2, _0819F1E8
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0819F1EC
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r5, [r0, #0x3c]
	movs r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819F1E4: .4byte 0x085DC09C
_0819F1E8: .4byte 0x020205AC
_0819F1EC: .4byte 0x0819F4ED
	thumb_func_end sub_0819F1A0

	thumb_func_start Swap_ShowSummaryMonSprite
Swap_ShowSummaryMonSprite: @ 0x0819F1F0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x10
	ldr r0, _0819F2D0
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #1
	bl CreateSprite
	ldr r6, _0819F2D4
	ldr r1, [r6]
	adds r1, #0x2d
	movs r2, #0
	mov sl, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x2d
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0819F2D8
	mov r8, r1
	add r0, r8
	movs r1, #2
	bl StartSpriteAffineAnim
	ldr r0, [r6]
	ldrb r1, [r0, #3]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _0819F2DC
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	mov sb, r0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	adds r2, r0, #0
	movs r0, #0x58
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r0, _0819F2E0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	mov r1, sb
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	ldr r1, [r6]
	adds r1, #0x2c
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x28
	mov r2, sl
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x29
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, #0x2d
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819F2D0: .4byte 0x085DC09C
_0819F2D4: .4byte 0x03001280
_0819F2D8: .4byte 0x020205AC
_0819F2DC: .4byte 0x02024190
_0819F2E0: .4byte 0x0000FFFF
	thumb_func_end Swap_ShowSummaryMonSprite

	thumb_func_start sub_0819F2E4
sub_0819F2E4: @ 0x0819F2E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r5, r2, #0x18
	lsrs r5, r5, #0x18
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl FreeAndDestroyMonPicSprite
	ldr r0, _0819F328
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819F32C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #0x16]
	lsrs r4, r4, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	strh r4, [r1, #0x14]
	ldr r1, [r1]
	bl _call_via_r1
	movs r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819F328: .4byte 0x0819F6A1
_0819F32C: .4byte 0x03005B60
	thumb_func_end sub_0819F2E4

	thumb_func_start sub_0819F330
sub_0819F330: @ 0x0819F330
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl FreeAndDestroyMonPicSprite
	ldr r5, _0819F370
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	movs r0, #0
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819F370: .4byte 0x020205AC
	thumb_func_end sub_0819F330

	thumb_func_start Task_SwapCantHaveSameMons
Task_SwapCantHaveSameMons: @ 0x0819F374
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0819F3A8
	ldr r0, [r1]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #1
	beq _0819F476
	ldr r2, _0819F3AC
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r5, r1, #0
	cmp r0, #4
	bhi _0819F476
	lsls r0, r0, #2
	ldr r1, _0819F3B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0819F3A8: .4byte 0x03001280
_0819F3AC: .4byte 0x03005B60
_0819F3B0: .4byte 0x0819F3B4
_0819F3B4: @ jump table
	.4byte _0819F3C8 @ case 0
	.4byte _0819F3E4 @ case 1
	.4byte _0819F418 @ case 2
	.4byte _0819F434 @ case 3
	.4byte _0819F454 @ case 4
_0819F3C8:
	ldr r0, _0819F3DC
	bl Swap_PrintOnInfoWindow
	ldr r0, _0819F3E0
	ldr r0, [r0]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
	b _0819F43A
	.align 2, 0
_0819F3DC: .4byte 0x085DC141
_0819F3E0: .4byte 0x03001280
_0819F3E4:
	ldr r0, _0819F410
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0819F3F8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0819F476
_0819F3F8:
	movs r0, #5
	bl PlaySE
	ldr r0, _0819F414
	ldr r1, [r0]
	ldr r0, [r1, #0x2c]
	adds r1, #0x30
	movs r2, #1
	bl sub_0819F2E4
	b _0819F43A
	.align 2, 0
_0819F410: .4byte 0x03002360
_0819F414: .4byte 0x03001280
_0819F418:
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	beq _0819F476
	movs r0, #5
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #5
	movs r1, #2
	bl CopyWindowToVram
	b _0819F43A
_0819F434:
	ldr r0, _0819F44C
	bl Swap_PrintOnInfoWindow
_0819F43A:
	ldr r0, _0819F450
	adds r1, r5, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0819F476
	.align 2, 0
_0819F44C: .4byte 0x085DC0D5
_0819F450: .4byte 0x03005B60
_0819F454:
	bl Swap_PrintMonSpecies3
	bl sub_0819E7FC
	ldr r0, _0819F47C
	ldr r0, [r0]
	adds r0, #0x22
	movs r1, #1
	strb r1, [r0]
	ldr r1, _0819F480
	adds r0, r5, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x12]
	strh r1, [r0, #8]
	ldr r1, _0819F484
	str r1, [r0]
_0819F476:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819F47C: .4byte 0x03001280
_0819F480: .4byte 0x03005B60
_0819F484: .4byte 0x0819CB29
	thumb_func_end Task_SwapCantHaveSameMons

	thumb_func_start Swap_AlreadyHasSameSpecies
Swap_AlreadyHasSameSpecies: @ 0x0819F488
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0819F4CC
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #0
_0819F4A4:
	ldr r0, _0819F4D0
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	cmp r4, r0
	beq _0819F4D8
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _0819F4D4
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	bne _0819F4D8
	movs r0, #1
	b _0819F4E4
	.align 2, 0
_0819F4CC: .4byte 0x020243E8
_0819F4D0: .4byte 0x03001280
_0819F4D4: .4byte 0x02024190
_0819F4D8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0819F4A4
	movs r0, #0
_0819F4E4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Swap_AlreadyHasSameSpecies

	thumb_func_start sub_0819F4EC
sub_0819F4EC: @ 0x0819F4EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0819F52C
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0819F534
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0819F538
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r4, #0x3c]
	strh r2, [r1, #0x16]
	ldr r1, [r1]
	bl _call_via_r1
	ldr r0, _0819F53C
	str r0, [r4, #0x1c]
_0819F52C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0819F534: .4byte 0x0819F589
_0819F538: .4byte 0x03005B60
_0819F53C: .4byte 0x08007141
	thumb_func_end sub_0819F4EC

	thumb_func_start sub_0819F540
sub_0819F540: @ 0x0819F540
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0819F580
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _0819F574
	ldr r0, _0819F570
	ldr r0, [r0]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	b _0819F57A
	.align 2, 0
_0819F570: .4byte 0x03001280
_0819F574:
	movs r0, #0
	bl sub_0819BB08
_0819F57A:
	adds r0, r4, #0
	bl DestroySprite
_0819F580:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819F540

	thumb_func_start sub_0819F588
sub_0819F588: @ 0x0819F588
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0819F5AC
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0819F606
	cmp r0, #1
	bgt _0819F5B0
	cmp r0, #0
	beq _0819F5B6
	b _0819F668
	.align 2, 0
_0819F5AC: .4byte 0x03005B60
_0819F5B0:
	cmp r0, #2
	beq _0819F628
	b _0819F668
_0819F5B6:
	movs r0, #0x58
	strh r0, [r4, #0xe]
	movs r0, #0x98
	strh r0, [r4, #0x38]
	movs r0, #0x40
	strh r0, [r4, #0x12]
	movs r0, #0x41
	strh r0, [r4, #0x18]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x38]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x37
	bl SetGpuReg
	b _0819F692
_0819F606:
	movs r0, #3
	bl ShowBg
	ldr r1, _0819F620
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _0819F624
	movs r0, #0x52
	bl SetGpuReg
	b _0819F692
	.align 2, 0
_0819F620: .4byte 0x00001248
_0819F624: .4byte 0x0000040B
_0819F628:
	ldrh r0, [r4, #0x12]
	subs r0, #4
	strh r0, [r4, #0x12]
	ldrh r1, [r4, #0x18]
	adds r1, #4
	strh r1, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _0819F644
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5f
	ble _0819F64C
_0819F644:
	movs r0, #0x20
	strh r0, [r4, #0x12]
	movs r0, #0x60
	strh r0, [r4, #0x18]
_0819F64C:
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0x20
	bne _0819F698
	b _0819F692
_0819F668:
	adds r0, r5, #0
	bl DestroyTask
	ldr r0, _0819F688
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _0819F68C
	bl Swap_ShowMonSprite
	b _0819F698
	.align 2, 0
_0819F688: .4byte 0x03005B60
_0819F68C:
	bl Summary_ShowMonSprite
	b _0819F698
_0819F692:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0819F698:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819F588

	thumb_func_start sub_0819F6A0
sub_0819F6A0: @ 0x0819F6A0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0819F724
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0819F730
	cmp r0, #1
	beq _0819F780
	movs r0, #3
	bl HideBg
	ldr r3, _0819F728
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r4, #0x16]
	strh r1, [r0, #0x3c]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0819F72C
	str r1, [r0]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #1
	bl StartSpriteAffineAnim
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
	adds r0, r5, #0
	bl DestroyTask
	b _0819F7C4
	.align 2, 0
_0819F724: .4byte 0x03005B60
_0819F728: .4byte 0x020205AC
_0819F72C: .4byte 0x0819F541
_0819F730:
	movs r0, #0x58
	strh r0, [r4, #0xe]
	movs r0, #0x98
	strh r0, [r4, #0x38]
	movs r0, #0x20
	strh r0, [r4, #0x12]
	movs r0, #0x60
	strh r0, [r4, #0x18]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x38]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x37
	bl SetGpuReg
	b _0819F7BE
_0819F780:
	ldrh r0, [r4, #0x12]
	adds r0, #4
	strh r0, [r4, #0x12]
	ldrh r1, [r4, #0x18]
	subs r1, #4
	strh r1, [r4, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	bgt _0819F79C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x41
	bgt _0819F7A4
_0819F79C:
	movs r0, #0x40
	strh r0, [r4, #0x12]
	movs r0, #0x41
	strh r0, [r4, #0x18]
_0819F7A4:
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x18]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	bne _0819F7C4
_0819F7BE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_0819F7C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819F6A0

	thumb_func_start Swap_ShowMonSprite
Swap_ShowMonSprite: @ 0x0819F7CC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r0, _0819F7E4
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _0819F7EC
	ldrb r1, [r1, #3]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0819F7E8
	b _0819F7F4
	.align 2, 0
_0819F7E4: .4byte 0x03001280
_0819F7E8: .4byte 0x02024190
_0819F7EC:
	ldrb r1, [r1, #3]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0819F878
_0819F7F4:
	adds r6, r1, r0
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	movs r0, #0x58
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r0, _0819F87C
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	ldr r2, _0819F880
	ldr r1, [r2]
	adds r1, #0x2c
	movs r3, #0
	strb r0, [r1]
	ldr r4, _0819F884
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x28
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x29
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, #0x30
	strb r3, [r0]
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0819F878: .4byte 0x020243E8
_0819F87C: .4byte 0x0000FFFF
_0819F880: .4byte 0x03001280
_0819F884: .4byte 0x020205AC
	thumb_func_end Swap_ShowMonSprite

