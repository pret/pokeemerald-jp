.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start FieldEffectStart
FieldEffectStart: @ 0x080B5270
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl FieldEffectActiveListAdd
	ldr r0, _080B52B0
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	str r0, [sp]
	add r4, sp, #4
	ldr r5, _080B52B4
_080B528E:
	ldr r0, [sp]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	mov r0, sp
	adds r1, r4, #0
	bl _call_via_r2
	thumb_func_end FieldEffectStart

	thumb_func_start sub_080B52A0
sub_080B52A0: @ 0x080B52A0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B528E
	ldr r0, [sp, #4]
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B52B0: .4byte 0x08289F5C
_080B52B4: .4byte 0x08536E9C
	thumb_func_end sub_080B52A0

	thumb_func_start FieldEffectCmd_loadtiles
FieldEffectCmd_loadtiles: @ 0x080B52B8
	push {lr}
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	bl FieldEffectScript_LoadTiles
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FieldEffectCmd_loadtiles

	thumb_func_start FieldEffectCmd_loadfadedpal
FieldEffectCmd_loadfadedpal: @ 0x080B52CC
	push {lr}
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	bl FieldEffectScript_LoadFadedPalette
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FieldEffectCmd_loadfadedpal

	thumb_func_start FieldEffectCmd_loadpal
FieldEffectCmd_loadpal: @ 0x080B52E0
	push {lr}
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	bl FieldEffectScript_LoadPalette
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FieldEffectCmd_loadpal

	thumb_func_start FieldEffectCmd_callnative
FieldEffectCmd_callnative: @ 0x080B52F4
	push {lr}
	ldr r2, [r0]
	adds r2, #1
	str r2, [r0]
	bl FieldEffectScript_CallNative
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FieldEffectCmd_callnative

	thumb_func_start FieldEffectCmd_end
FieldEffectCmd_end: @ 0x080B5308
	movs r0, #0
	bx lr
	thumb_func_end FieldEffectCmd_end

	thumb_func_start FieldEffectCmd_loadgfx_callnative
FieldEffectCmd_loadgfx_callnative: @ 0x080B530C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r0, r4, #0
	bl FieldEffectScript_LoadTiles
	adds r0, r4, #0
	bl FieldEffectScript_LoadFadedPalette
	adds r0, r4, #0
	adds r1, r5, #0
	bl FieldEffectScript_CallNative
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadgfx_callnative

	thumb_func_start FieldEffectCmd_loadtiles_callnative
FieldEffectCmd_loadtiles_callnative: @ 0x080B5334
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r0, r4, #0
	bl FieldEffectScript_LoadTiles
	adds r0, r4, #0
	adds r1, r5, #0
	bl FieldEffectScript_CallNative
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FieldEffectCmd_loadtiles_callnative

	thumb_func_start FieldEffectCmd_loadfadedpal_callnative
FieldEffectCmd_loadfadedpal_callnative: @ 0x080B5358
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r0, r4, #0
	bl FieldEffectScript_LoadFadedPalette
	adds r0, r4, #0
	adds r1, r5, #0
	bl FieldEffectScript_CallNative
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FieldEffectCmd_loadfadedpal_callnative

	thumb_func_start FieldEffectScript_ReadWord
FieldEffectScript_ReadWord: @ 0x080B537C
	ldr r2, [r0]
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	ldrb r1, [r2, #2]
	lsls r1, r1, #0x10
	adds r0, r0, r1
	ldrb r1, [r2, #3]
	lsls r1, r1, #0x18
	adds r0, r0, r1
	bx lr
	thumb_func_end FieldEffectScript_ReadWord

	thumb_func_start FieldEffectScript_LoadTiles
FieldEffectScript_LoadTiles: @ 0x080B5394
	push {r4, r5, lr}
	adds r4, r0, #0
	bl FieldEffectScript_ReadWord
	adds r5, r0, #0
	ldrh r0, [r5, #6]
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	ldr r1, _080B53C0
	cmp r0, r1
	bne _080B53B2
	adds r0, r5, #0
	bl LoadSpriteSheet
_080B53B2:
	ldr r0, [r4]
	adds r0, #4
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B53C0: .4byte 0xFFFF0000
	thumb_func_end FieldEffectScript_LoadTiles

	thumb_func_start FieldEffectScript_LoadFadedPalette
FieldEffectScript_LoadFadedPalette: @ 0x080B53C4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl FieldEffectScript_ReadWord
	adds r4, r0, #0
	bl LoadSpritePalette
	ldrh r0, [r4, #4]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl UpdateSpritePaletteWithWeather
	ldr r0, [r5]
	adds r0, #4
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_LoadFadedPalette

	thumb_func_start FieldEffectScript_LoadPalette
FieldEffectScript_LoadPalette: @ 0x080B53EC
	push {r4, lr}
	adds r4, r0, #0
	bl FieldEffectScript_ReadWord
	bl LoadSpritePalette
	ldr r0, [r4]
	adds r0, #4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_LoadPalette

	thumb_func_start FieldEffectScript_CallNative
FieldEffectScript_CallNative: @ 0x080B5404
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl FieldEffectScript_ReadWord
	bl _call_via_r0
	str r0, [r5]
	thumb_func_end FieldEffectScript_CallNative

	thumb_func_start CreateTeleportFieldEffectTask
CreateTeleportFieldEffectTask: @ 0x080B5414
	ldr r0, [r4]
	adds r0, #4
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end CreateTeleportFieldEffectTask

	thumb_func_start FieldEffectFreeGraphicsResources
FieldEffectFreeGraphicsResources: @ 0x080B5420
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r1, #0x40
	ldrh r5, [r1]
	ldrb r4, [r0, #5]
	lsrs r4, r4, #4
	bl DestroySprite
	adds r0, r5, #0
	bl FieldEffectFreeTilesIfUnused
	adds r0, r4, #0
	bl FieldEffectFreePaletteIfUnused
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FieldEffectFreeGraphicsResources

	thumb_func_start FieldEffectStop
FieldEffectStop: @ 0x080B5444
	push {r4, lr}
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl FieldEffectFreeGraphicsResources
	adds r0, r4, #0
	bl FieldEffectActiveListRemove
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FieldEffectStop

	thumb_func_start FieldEffectFreeTilesIfUnused
FieldEffectFreeTilesIfUnused: @ 0x080B545C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl GetSpriteTileTagByTileStart
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080B54B8
	cmp r3, r0
	beq _080B54B0
	movs r2, #0
	ldr r5, _080B54BC
_080B5476:
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r5
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080B54A0
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _080B54A0
	adds r0, r1, #0
	adds r0, #0x40
	ldrh r0, [r0]
	cmp r4, r0
	beq _080B54B0
_080B54A0:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _080B5476
	adds r0, r3, #0
	bl FreeSpriteTilesByTag
_080B54B0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B54B8: .4byte 0x0000FFFF
_080B54BC: .4byte 0x020205AC
	thumb_func_end FieldEffectFreeTilesIfUnused

	thumb_func_start FieldEffectFreePaletteIfUnused
FieldEffectFreePaletteIfUnused: @ 0x080B54C0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080B5510
	cmp r5, r0
	beq _080B5508
	movs r2, #0
	ldr r6, _080B5514
	adds r3, r4, #0
_080B54DC:
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r6
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080B54F8
	ldrb r0, [r1, #5]
	lsrs r0, r0, #4
	cmp r0, r3
	beq _080B5508
_080B54F8:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _080B54DC
	adds r0, r5, #0
	bl FreeSpritePaletteByTag
_080B5508:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5510: .4byte 0x0000FFFF
_080B5514: .4byte 0x020205AC
	thumb_func_end FieldEffectFreePaletteIfUnused

	thumb_func_start FieldEffectActiveListClear
FieldEffectActiveListClear: @ 0x080B5518
	push {r4, lr}
	movs r2, #0
	ldr r4, _080B5538
	movs r3, #0xff
_080B5520:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _080B5520
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5538: .4byte 0x03000F58
	thumb_func_end FieldEffectActiveListClear

	thumb_func_start FieldEffectActiveListAdd
FieldEffectActiveListAdd: @ 0x080B553C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _080B5554
_080B5546:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080B5558
	strb r3, [r1]
	b _080B5562
	.align 2, 0
_080B5554: .4byte 0x03000F58
_080B5558:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _080B5546
_080B5562:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectActiveListAdd

	thumb_func_start FieldEffectActiveListRemove
FieldEffectActiveListRemove: @ 0x080B5568
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _080B5584
	movs r5, #0xff
_080B5574:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _080B5588
	orrs r0, r5
	strb r0, [r1]
	b _080B5592
	.align 2, 0
_080B5584: .4byte 0x03000F58
_080B5588:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _080B5574
_080B5592:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectActiveListRemove

	thumb_func_start FieldEffectActiveListContains
FieldEffectActiveListContains: @ 0x080B5598
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _080B55B0
_080B55A2:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080B55B4
	movs r0, #1
	b _080B55C0
	.align 2, 0
_080B55B0: .4byte 0x03000F58
_080B55B4:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1f
	bls _080B55A2
	movs r0, #0
_080B55C0:
	pop {r1}
	bx r1
	thumb_func_end FieldEffectActiveListContains

	thumb_func_start CreateTrainerSprite
CreateTrainerSprite: @ 0x080B55C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov sb, r3
	ldr r7, [sp, #0x34]
	lsls r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsrs r4, r4, #0x15
	ldr r3, _080B564C
	mov r8, r3
	add r8, r4
	mov r0, r8
	adds r1, r7, #0
	bl LoadCompressedSpritePaletteOverrideBuffer
	ldr r0, _080B5650
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r7, #0
	bl LoadCompressedSpriteSheetOverrideBuffer
	mov r1, sp
	ldrh r0, [r4, #6]
	movs r2, #0
	strh r0, [r1]
	mov r3, r8
	ldrh r0, [r3, #4]
	strh r0, [r1, #2]
	ldr r0, _080B5654
	str r0, [sp, #4]
	ldr r0, _080B5658
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, _080B565C
	str r0, [sp, #0x10]
	ldr r0, _080B5660
	str r0, [sp, #0x14]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, sb
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B564C: .4byte 0x082D91CC
_080B5650: .4byte 0x082D8EE4
_080B5654: .4byte 0x08536EBC
_080B5658: .4byte 0x082BF304
_080B565C: .4byte 0x082BF310
_080B5660: .4byte 0x08007141
	thumb_func_end CreateTrainerSprite

	thumb_func_start LoadTrainerGfx_TrainerCard
LoadTrainerGfx_TrainerCard: @ 0x080B5664
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080B5694
	lsrs r4, r4, #0x15
	adds r0, r4, r0
	ldr r0, [r0]
	bl LZDecompressWram
	ldr r0, _080B5698
	adds r4, r4, r0
	ldr r0, [r4]
	adds r1, r5, #0
	movs r2, #0x20
	bl LoadCompressedPalette
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5694: .4byte 0x082D8EE4
_080B5698: .4byte 0x082D91CC
	thumb_func_end LoadTrainerGfx_TrainerCard

	thumb_func_start AddNewGameBirchObject
AddNewGameBirchObject: @ 0x080B569C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080B56D4
	bl LoadSpritePalette
	ldr r0, _080B56D8
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B56D4: .4byte 0x08536EDC
_080B56D8: .4byte 0x08536EF0
	thumb_func_end AddNewGameBirchObject

	thumb_func_start CreateMonSprite_PicBox
CreateMonSprite_PicBox: @ 0x080B56DC
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r1, _080B572C
	lsls r4, r0, #3
	adds r4, r4, r1
	ldrh r1, [r4, #4]
	str r1, [sp, #0xc]
	movs r1, #0
	adds r2, r3, #0
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #4]
	bl IndexOfSpritePaletteTag
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PreservePaletteInWeather
	ldr r0, _080B5730
	cmp r5, r0
	beq _080B5734
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	b _080B5736
	.align 2, 0
_080B572C: .4byte 0x082D6F08
_080B5730: .4byte 0x0000FFFF
_080B5734:
	movs r0, #0x40
_080B5736:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CreateMonSprite_PicBox

	thumb_func_start CreateMonSprite_FieldMove
CreateMonSprite_FieldMove: @ 0x080B5740
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x2c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	bl GetMonSpritePalStructFromOtIdPersonality
	mov r8, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	mov r1, r8
	ldrh r0, [r1, #4]
	str r0, [sp, #0xc]
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	movs r3, #1
	bl CreateMonPicSprite_HandleDeoxys
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r1, r8
	ldrh r0, [r1, #4]
	bl IndexOfSpritePaletteTag
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PreservePaletteInWeather
	ldr r0, _080B57B0
	cmp r4, r0
	beq _080B57B4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	b _080B57B6
	.align 2, 0
_080B57B0: .4byte 0x0000FFFF
_080B57B4:
	movs r0, #0x40
_080B57B6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CreateMonSprite_FieldMove

	thumb_func_start FreeResourcesAndDestroySprite
FreeResourcesAndDestroySprite: @ 0x080B57C8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl ResetPreservedPalettesInWeather
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	beq _080B57E6
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
_080B57E6:
	adds r0, r5, #0
	bl FreeAndDestroyMonPicSprite
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FreeResourcesAndDestroySprite

	thumb_func_start MultiplyInvertedPaletteRGBComponents
MultiplyInvertedPaletteRGBComponents: @ 0x080B57F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r4, _080B5878
	lsrs r0, r0, #0xf
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, #0x1f
	mov sb, r5
	mov r8, r4
	mov r6, r8
	ands r6, r5
	mov r8, r6
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r4
	lsrs r6, r6, #5
	movs r5, #0xf8
	lsls r5, r5, #7
	ands r4, r5
	lsrs r4, r4, #0xa
	mov r7, sb
	mov r5, r8
	subs r7, r7, r5
	mov ip, r7
	mov r7, ip
	muls r7, r1, r7
	adds r1, r7, #0
	asrs r1, r1, #4
	add r8, r1
	mov r5, sb
	subs r1, r5, r6
	muls r1, r2, r1
	asrs r1, r1, #4
	adds r6, r6, r1
	subs r5, r5, r4
	mov sb, r5
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #4
	adds r4, r4, r1
	mov r7, r8
	lsls r7, r7, #0x10
	lsls r6, r6, #0x15
	orrs r6, r7
	lsls r4, r4, #0x1a
	orrs r4, r6
	lsrs r4, r4, #0x10
	ldr r1, _080B587C
	adds r0, r0, r1
	strh r4, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5878: .4byte 0x020373B4
_080B587C: .4byte 0x020377B4
	thumb_func_end MultiplyInvertedPaletteRGBComponents

	thumb_func_start MultiplyPaletteRGBComponents
MultiplyPaletteRGBComponents: @ 0x080B5880
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r4, _080B58F0
	lsrs r0, r0, #0xf
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, #0x1f
	mov r8, r5
	mov r6, r8
	ands r6, r4
	mov r8, r6
	movs r5, #0xf8
	lsls r5, r5, #2
	ands r5, r4
	lsrs r5, r5, #5
	movs r6, #0xf8
	lsls r6, r6, #7
	ands r4, r6
	lsrs r4, r4, #0xa
	mov r6, r8
	muls r6, r1, r6
	adds r1, r6, #0
	asrs r1, r1, #4
	mov r6, r8
	subs r6, r6, r1
	adds r1, r5, #0
	muls r1, r2, r1
	asrs r1, r1, #4
	subs r5, r5, r1
	adds r1, r4, #0
	muls r1, r3, r1
	asrs r1, r1, #4
	subs r4, r4, r1
	lsls r6, r6, #0x10
	lsls r5, r5, #0x15
	orrs r5, r6
	lsls r4, r4, #0x1a
	orrs r4, r5
	lsrs r4, r4, #0x10
	ldr r1, _080B58F4
	adds r0, r0, r1
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B58F0: .4byte 0x020373B4
_080B58F4: .4byte 0x020377B4
	thumb_func_end MultiplyPaletteRGBComponents

	thumb_func_start FldEff_PokecenterHeal
FldEff_PokecenterHeal: @ 0x080B58F8
	push {r4, lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B5934
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B5938
	adds r1, r1, r0
	strh r4, [r1, #0xa]
	movs r0, #0x5d
	strh r0, [r1, #0xc]
	movs r0, #0x24
	strh r0, [r1, #0xe]
	movs r0, #0x7c
	strh r0, [r1, #0x10]
	movs r0, #0x18
	strh r0, [r1, #0x12]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B5934: .4byte 0x080B593D
_080B5938: .4byte 0x03005B60
	thumb_func_end FldEff_PokecenterHeal

	thumb_func_start Task_HallOfFameRecord
Task_HallOfFameRecord: @ 0x080B593C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B5964
	adds r1, r1, r0
	ldr r2, _080B5968
	movs r3, #8
	ldrsh r0, [r1, r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r1, #0
	bl _call_via_r2
	pop {r0}
	thumb_func_end Task_HallOfFameRecord

	thumb_func_start sub_080B5960
sub_080B5960: @ 0x080B5960
	bx r0
	.align 2, 0
_080B5964: .4byte 0x03005B60
_080B5968: .4byte 0x08537010
	thumb_func_end sub_080B5960

	thumb_func_start PokecenterHealEffect_0
PokecenterHealEffect_0: @ 0x080B596C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r3, #0xe
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl CreatePokeballGlowSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x14]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	bl PokecenterHealEffectHelper
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PokecenterHealEffect_0

	thumb_func_start PokecenterHealEffect_1
PokecenterHealEffect_1: @ 0x080B59A8
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, _080B59E0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r4, #0x2e
	ldrsh r0, [r1, r4]
	cmp r0, #1
	ble _080B59DA
	movs r0, #0x16
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x2e]
	adds r1, #1
	strh r1, [r0, #0x2e]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_080B59DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B59E0: .4byte 0x020205AC
	thumb_func_end PokecenterHealEffect_1

	thumb_func_start PokecenterHealEffect_2
PokecenterHealEffect_2: @ 0x080B59E4
	push {lr}
	adds r3, r0, #0
	ldr r2, _080B5A08
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	cmp r0, #4
	ble _080B5A04
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_080B5A04:
	pop {r0}
	bx r0
	.align 2, 0
_080B5A08: .4byte 0x020205AC
	thumb_func_end PokecenterHealEffect_2

	thumb_func_start PokecenterHealEffect_3
PokecenterHealEffect_3: @ 0x080B5A0C
	push {lr}
	ldr r2, _080B5A44
	movs r3, #0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #6
	ble _080B5A3E
	adds r0, r1, #0
	bl DestroySprite
	movs r0, #0x19
	bl FieldEffectActiveListRemove
	ldr r0, _080B5A48
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B5A3E:
	pop {r0}
	bx r0
	.align 2, 0
_080B5A44: .4byte 0x020205AC
_080B5A48: .4byte 0x080B593D
	thumb_func_end PokecenterHealEffect_3

	thumb_func_start FldEff_HallOfFameRecord
FldEff_HallOfFameRecord: @ 0x080B5A4C
	push {r4, lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B5A80
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B5A84
	adds r1, r1, r0
	strh r4, [r1, #0xa]
	movs r0, #0x75
	strh r0, [r1, #0xc]
	movs r0, #0x34
	strh r0, [r1, #0xe]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B5A80: .4byte 0x080B5A89
_080B5A84: .4byte 0x03005B60
	thumb_func_end FldEff_HallOfFameRecord

	thumb_func_start Task_PokecenterHeal
Task_PokecenterHeal: @ 0x080B5A88
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B5AB0
	adds r1, r1, r0
	ldr r2, _080B5AB4
	movs r3, #8
	ldrsh r0, [r1, r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r1, #0
	bl _call_via_r2
	pop {r0}
	thumb_func_end Task_PokecenterHeal

	thumb_func_start sub_080B5AAC
sub_080B5AAC: @ 0x080B5AAC
	bx r0
	.align 2, 0
_080B5AB0: .4byte 0x03005B60
_080B5AB4: .4byte 0x08537020
	thumb_func_end sub_080B5AAC

	thumb_func_start HallOfFameRecordEffect_0
HallOfFameRecordEffect_0: @ 0x080B5AB8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r3, #0xe
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreatePokeballGlowSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x14]
	ldr r0, _080B5B28
	bl FindTaskIdByFunc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0x18
	movs r3, #0
	bl HallOfFameRecordEffectHelper
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #8
	movs r3, #1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #8
	movs r3, #1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, #0
	movs r1, #0xa8
	movs r2, #8
	movs r3, #1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, #0
	movs r1, #0xc8
	movs r2, #8
	movs r3, #1
	bl HallOfFameRecordEffectHelper
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B28: .4byte 0x080B5A89
	thumb_func_end HallOfFameRecordEffect_0

	thumb_func_start HallOfFameRecordEffect_1
HallOfFameRecordEffect_1: @ 0x080B5B2C
	push {lr}
	adds r3, r0, #0
	ldr r2, _080B5B58
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	cmp r0, #1
	ble _080B5B52
	ldrh r0, [r3, #0x26]
	adds r0, #1
	strh r0, [r3, #0x26]
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_080B5B52:
	pop {r0}
	bx r0
	.align 2, 0
_080B5B58: .4byte 0x020205AC
	thumb_func_end HallOfFameRecordEffect_1

	thumb_func_start HallOfFameRecordEffect_2
HallOfFameRecordEffect_2: @ 0x080B5B5C
	push {lr}
	adds r3, r0, #0
	ldr r2, _080B5B80
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	cmp r0, #4
	ble _080B5B7C
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_080B5B7C:
	pop {r0}
	bx r0
	.align 2, 0
_080B5B80: .4byte 0x020205AC
	thumb_func_end HallOfFameRecordEffect_2

	thumb_func_start HallOfFameRecordEffect_3
HallOfFameRecordEffect_3: @ 0x080B5B84
	push {lr}
	ldr r2, _080B5BBC
	movs r3, #0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #6
	ble _080B5BB6
	adds r0, r1, #0
	bl DestroySprite
	movs r0, #0x3e
	bl FieldEffectActiveListRemove
	ldr r0, _080B5BC0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B5BB6:
	pop {r0}
	bx r0
	.align 2, 0
_080B5BBC: .4byte 0x020205AC
_080B5BC0: .4byte 0x080B5A89
	thumb_func_end HallOfFameRecordEffect_3

	thumb_func_start CreatePokeballGlowSprite
CreatePokeballGlowSprite: @ 0x080B5BC4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080B5C10
	bl CreateInvisibleSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _080B5C14
	adds r1, r1, r2
	strh r4, [r1, #0x24]
	strh r5, [r1, #0x26]
	strh r6, [r1, #0x38]
	mov r2, r8
	strh r2, [r1, #0x3a]
	strh r0, [r1, #0x3c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B5C10: .4byte 0x080B5C19
_080B5C14: .4byte 0x020205AC
	thumb_func_end CreatePokeballGlowSprite

	thumb_func_start SpriteCB_PokeballGlowEffect
SpriteCB_PokeballGlowEffect: @ 0x080B5C18
	push {lr}
	ldr r2, _080B5C30
	movs r3, #0x2e
	ldrsh r1, [r0, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B5C30: .4byte 0x08537030
	thumb_func_end SpriteCB_PokeballGlowEffect

	thumb_func_start PokeballGlowEffect_0
PokeballGlowEffect_0: @ 0x080B5C34
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080B5C4C
	subs r0, r1, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B5CA8
_080B5C4C:
	movs r0, #0x19
	strh r0, [r4, #0x30]
	ldr r0, _080B5CC0
	ldr r1, _080B5CC4
	movs r2, #0x32
	ldrsh r3, [r4, r2]
	lsls r3, r3, #2
	adds r3, r3, r1
	ldrh r1, [r4, #0x24]
	ldrh r2, [r3]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x26]
	ldrh r3, [r3, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B5CC8
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #8
	orrs r0, r2
	strb r0, [r1, #5]
	ldrh r0, [r4, #0x3c]
	strh r0, [r1, #0x2e]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x3a]
	subs r0, #1
	strh r0, [r4, #0x3a]
	movs r0, #0x17
	bl PlaySE
_080B5CA8:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B5CBA
	movs r0, #0x20
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_080B5CBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5CC0: .4byte 0x08536FB0
_080B5CC4: .4byte 0x08537050
_080B5CC8: .4byte 0x020205AC
	thumb_func_end PokeballGlowEffect_0

	thumb_func_start PokeballGlowEffect_1
PokeballGlowEffect_1: @ 0x080B5CCC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	subs r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _080B5CFC
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	movs r0, #8
	strh r0, [r1, #0x30]
	strh r2, [r1, #0x32]
	strh r2, [r1, #0x34]
	movs r2, #0x38
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080B5CFC
	movs r0, #0xb8
	lsls r0, r0, #1
	bl PlayFanfare
_080B5CFC:
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_1

	thumb_func_start PokeballGlowEffect_2
PokeballGlowEffect_2: @ 0x080B5D00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldrh r0, [r7, #0x30]
	subs r0, #1
	strh r0, [r7, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B5D30
	movs r0, #8
	strh r0, [r7, #0x30]
	ldrh r0, [r7, #0x32]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r7, #0x32]
	cmp r0, #0
	bne _080B5D30
	ldrh r0, [r7, #0x34]
	adds r0, #1
	strh r0, [r7, #0x34]
_080B5D30:
	ldrh r4, [r7, #0x32]
	adds r4, #3
	movs r0, #3
	mov r8, r0
	mov r1, r8
	ands r4, r1
	ldr r3, _080B5E28
	mov sl, r3
	mov r0, sl
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	movs r1, #0x84
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	ldr r6, _080B5E2C
	adds r1, r4, r6
	ldrb r1, [r1]
	ldr r5, _080B5E30
	adds r2, r4, r5
	ldrb r2, [r2]
	ldr r3, _080B5E34
	mov sb, r3
	add r4, sb
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, #0x32]
	adds r4, #2
	mov r0, r8
	ands r4, r0
	mov r0, sl
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	movs r1, #0x83
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, sb
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, #0x32]
	adds r4, #1
	mov r3, r8
	ands r4, r3
	mov r0, sl
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	movs r1, #0x81
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, sb
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, #0x32]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sl
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	ldr r3, _080B5E38
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	adds r6, r4, r6
	ldrb r6, [r6]
	adds r5, r4, r5
	ldrb r5, [r5]
	add r4, sb
	ldrb r4, [r4]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, sl
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	ldr r1, _080B5E3C
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl MultiplyInvertedPaletteRGBComponents
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #2
	ble _080B5E1A
	ldrh r0, [r7, #0x2e]
	adds r0, #1
	movs r1, #0
	strh r0, [r7, #0x2e]
	movs r0, #8
	strh r0, [r7, #0x30]
	strh r1, [r7, #0x32]
_080B5E1A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E28: .4byte 0x00001007
_080B5E2C: .4byte 0x08537068
_080B5E30: .4byte 0x0853706C
_080B5E34: .4byte 0x08537070
_080B5E38: .4byte 0x01050000
_080B5E3C: .4byte 0x01030000
	thumb_func_end PokeballGlowEffect_2

	thumb_func_start PokeballGlowEffect_3
PokeballGlowEffect_3: @ 0x080B5E40
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	subs r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B5E70
	movs r0, #8
	strh r0, [r2, #0x30]
	ldrh r0, [r2, #0x32]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r2, #0x32]
	cmp r0, #3
	bne _080B5E70
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	movs r0, #0x1e
	strh r0, [r2, #0x30]
_080B5E70:
	ldrh r4, [r2, #0x32]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B5F1C
	mov r8, r0
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	movs r1, #0x84
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	ldr r1, _080B5F20
	adds r1, r4, r1
	ldrb r6, [r1]
	ldr r1, _080B5F24
	adds r1, r4, r1
	ldrb r5, [r1]
	ldr r1, _080B5F28
	adds r4, r4, r1
	ldrb r4, [r4]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	movs r1, #0x83
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	movs r1, #0x81
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	ldr r1, _080B5F2C
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	ldr r1, _080B5F30
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl MultiplyInvertedPaletteRGBComponents
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5F1C: .4byte 0x00001007
_080B5F20: .4byte 0x08537068
_080B5F24: .4byte 0x0853706C
_080B5F28: .4byte 0x08537070
_080B5F2C: .4byte 0x01050000
_080B5F30: .4byte 0x01030000
	thumb_func_end PokeballGlowEffect_3

	thumb_func_start PokeballGlowEffect_4
PokeballGlowEffect_4: @ 0x080B5F34
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	subs r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B5F4A
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
_080B5F4A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PokeballGlowEffect_4

	thumb_func_start PokeballGlowEffect_5
PokeballGlowEffect_5: @ 0x080B5F50
	ldrh r1, [r0, #0x2e]
	adds r1, #1
	strh r1, [r0, #0x2e]
	bx lr
	thumb_func_end PokeballGlowEffect_5

	thumb_func_start PokeballGlowEffect_6
PokeballGlowEffect_6: @ 0x080B5F58
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080B5F6E
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B5F74
_080B5F6E:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_080B5F74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PokeballGlowEffect_6

	thumb_func_start PokeballGlowEffect_7
PokeballGlowEffect_7: @ 0x080B5F7C
	bx lr
	.align 2, 0
	thumb_func_end PokeballGlowEffect_7

	thumb_func_start SpriteCB_PokeballGlow
SpriteCB_PokeballGlow: @ 0x080B5F80
	push {lr}
	adds r3, r0, #0
	ldr r2, _080B5FA4
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	cmp r0, #4
	ble _080B5FA0
	adds r0, r3, #0
	bl FieldEffectFreeGraphicsResources
_080B5FA0:
	pop {r0}
	bx r0
	.align 2, 0
_080B5FA4: .4byte 0x020205AC
	thumb_func_end SpriteCB_PokeballGlow

	thumb_func_start PokecenterHealEffectHelper
PokecenterHealEffectHelper: @ 0x080B5FA8
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _080B5FF8
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r3, #0
	movs r3, #0
	bl CreateSpriteAtEnd
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080B5FFC
	adds r0, r0, r1
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #5]
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #4
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _080B6000
	bl SetSubspriteTables
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B5FF8: .4byte 0x08536FC8
_080B5FFC: .4byte 0x020205AC
_080B6000: .4byte 0x08536F58
	thumb_func_end PokecenterHealEffectHelper

	thumb_func_start SpriteCB_PokecenterMonitor
SpriteCB_PokecenterMonitor: @ 0x080B6004
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080B6028
	movs r0, #0
	strh r0, [r4, #0x2e]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	subs r0, #5
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
_080B6028:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B603C
	adds r0, r4, #0
	bl FieldEffectFreeGraphicsResources
_080B603C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_PokecenterMonitor

	thumb_func_start HallOfFameRecordEffectHelper
HallOfFameRecordEffectHelper: @ 0x080B6044
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _080B608C
	ldr r0, _080B6080
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080B6084
	adds r0, r0, r1
	ldr r1, _080B6088
	bl SetSubspriteTables
	b _080B60A0
	.align 2, 0
_080B6080: .4byte 0x08536FE0
_080B6084: .4byte 0x020205AC
_080B6088: .4byte 0x08536F70
_080B608C:
	ldr r0, _080B60C0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080B60A0:
	ldr r1, _080B60C4
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #4
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B60C0: .4byte 0x08536FF8
_080B60C4: .4byte 0x020205AC
	thumb_func_end HallOfFameRecordEffectHelper

	thumb_func_start SpriteCB_HallOfFameMonitor
SpriteCB_HallOfFameMonitor: @ 0x080B60C8
	push {lr}
	adds r3, r0, #0
	ldr r2, _080B6130
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x26
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080B611E
	ldrh r1, [r3, #0x30]
	movs r2, #0x30
	ldrsh r0, [r3, r2]
	cmp r0, #0
	beq _080B60F6
	subs r0, r1, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B6118
_080B60F6:
	movs r0, #0x10
	strh r0, [r3, #0x30]
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
_080B6118:
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
_080B611E:
	movs r2, #0x32
	ldrsh r0, [r3, r2]
	cmp r0, #0x7f
	ble _080B612C
	adds r0, r3, #0
	bl FieldEffectFreeGraphicsResources
_080B612C:
	pop {r0}
	bx r0
	.align 2, 0
_080B6130: .4byte 0x03005B60
	thumb_func_end SpriteCB_HallOfFameMonitor

	thumb_func_start sub_080B6134
sub_080B6134: @ 0x080B6134
	push {lr}
	ldr r0, _080B6148
	bl SetMainCallback2
	ldr r1, _080B614C
	ldr r0, _080B6150
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B6148: .4byte 0x08085A31
_080B614C: .4byte 0x03005B0C
_080B6150: .4byte 0x080B6155
	thumb_func_end sub_080B6134

	thumb_func_start mapldr_080842E8
mapldr_080842E8: @ 0x080B6154
	push {lr}
	bl pal_fill_black
	ldr r0, _080B6174
	movs r1, #0
	bl CreateTask
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	ldr r1, _080B6178
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B6174: .4byte 0x080B617D
_080B6178: .4byte 0x03005B0C
	thumb_func_end mapldr_080842E8

	thumb_func_start task00_8084310
task00_8084310: @ 0x080B617C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080B61E8
	adds r4, r0, r1
	movs r0, #8
	ldrsh r6, [r4, r0]
	cmp r6, #0
	bne _080B61BC
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B61E2
	bl GetCursorSelectionMonId
	ldr r1, _080B61EC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	cmp r0, #5
	ble _080B61B0
	str r6, [r1]
_080B61B0:
	movs r0, #0x1f
	bl FieldEffectStart
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B61BC:
	movs r0, #0x1f
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B61E2
	bl Overworld_ResetStateAfterDigEscRope
	bl WarpIntoMap
	ldr r0, _080B61F0
	bl SetMainCallback2
	ldr r1, _080B61F4
	ldr r0, _080B61F8
	str r0, [r1]
	adds r0, r5, #0
	bl DestroyTask
_080B61E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B61E8: .4byte 0x03005B60
_080B61EC: .4byte 0x020388A8
_080B61F0: .4byte 0x08085935
_080B61F4: .4byte 0x03005B0C
_080B61F8: .4byte 0x080B61FD
	thumb_func_end task00_8084310

	thumb_func_start mapldr_08084390
mapldr_08084390: @ 0x080B61FC
	push {r4, lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_black
	ldr r0, _080B6254
	movs r1, #0
	bl CreateTask
	ldr r4, _080B6258
	ldr r3, _080B625C
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r3]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080B623E
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #3
	bl EventObjectTurn
_080B623E:
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	ldr r1, _080B6260
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6254: .4byte 0x080B6265
_080B6258: .4byte 0x02036FF0
_080B625C: .4byte 0x02037230
_080B6260: .4byte 0x03005B0C
	thumb_func_end mapldr_08084390

	thumb_func_start c3_080843F8
c3_080843F8: @ 0x080B6264
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080B62B8
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B6296
	ldr r0, _080B62BC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B62B0
	movs r0, #0x20
	bl FieldEffectStart
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B6296:
	movs r0, #0x20
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B62B0
	bl ScriptContext2_Disable
	bl UnfreezeEventObjects
	adds r0, r5, #0
	bl DestroyTask
_080B62B0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B62B8: .4byte 0x03005B60
_080B62BC: .4byte 0x02037C74
	thumb_func_end c3_080843F8

	thumb_func_start sub_080B62C0
sub_080B62C0: @ 0x080B62C0
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	ldr r0, _080B62E4
	movs r1, #0
	bl CreateTask
	ldr r1, _080B62E8
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B62E4: .4byte 0x080B62ED
_080B62E8: .4byte 0x03005B0C
	thumb_func_end sub_080B62C0

	thumb_func_start sub_080B62EC
sub_080B62EC: @ 0x080B62EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B631C
	adds r4, r1, r0
	ldr r5, _080B6320
_080B62FE:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B62FE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B631C: .4byte 0x03005B60
_080B6320: .4byte 0x08537074
	thumb_func_end sub_080B62EC

	thumb_func_start sub_080B6324
sub_080B6324: @ 0x080B6324
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	ldr r6, _080B63C0
	ldrb r0, [r6, #5]
	lsls r5, r0, #3
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r0, _080B63C4
	mov r8, r0
	add r5, r8
	ldrb r0, [r6, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B63C8
	adds r4, r4, r0
	bl CameraObjectReset2
	ldrb r1, [r6, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #1]
	movs r0, #1
	strb r0, [r6, #6]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl EventObjectSetHeldMovement
	adds r3, r4, #0
	adds r3, #0x42
	ldrb r0, [r3]
	lsrs r0, r0, #6
	mov r1, sb
	strh r0, [r1, #0x10]
	ldrb r0, [r5, #3]
	movs r2, #4
	orrs r0, r2
	strb r0, [r5, #3]
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3]
	mov r1, sb
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #1
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B63C0: .4byte 0x02037230
_080B63C4: .4byte 0x02036FF0
_080B63C8: .4byte 0x020205AC
	thumb_func_end sub_080B6324

	thumb_func_start sub_080B63CC
sub_080B63CC: @ 0x080B63CC
	push {r4, lr}
	adds r4, r0, #0
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B63E0
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B63E0:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080B63CC

	thumb_func_start sub_080B63E8
sub_080B63E8: @ 0x080B63E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080B644C
	ldrb r0, [r6, #4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080B6450
	adds r2, r2, r0
	adds r0, r2, #0
	adds r0, #0x29
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r0, r4, #0x11
	rsbs r0, r0, #0
	ldrh r1, [r2, #0x22]
	ldr r3, _080B6454
	adds r1, r1, r4
	ldrh r3, [r3]
	adds r1, r1, r3
	asrs r0, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	movs r1, #0
	strh r0, [r2, #0x26]
	movs r0, #1
	strh r0, [r5, #0xa]
	strh r1, [r5, #0xc]
	ldr r2, _080B6458
	ldrb r0, [r6, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #1]
	movs r0, #0x2b
	bl PlaySE
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B644C: .4byte 0x02037230
_080B6450: .4byte 0x020205AC
_080B6454: .4byte 0x02021B3A
_080B6458: .4byte 0x02036FF0
	thumb_func_end sub_080B63E8

	thumb_func_start sub_080B645C
sub_080B645C: @ 0x080B645C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _080B6508
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B650C
	adds r6, r0, r1
	ldrb r1, [r2, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B6510
	adds r5, r0, r1
	ldrh r0, [r4, #0xa]
	ldrh r1, [r5, #0x26]
	adds r0, r0, r1
	strh r0, [r5, #0x26]
	ldrh r2, [r4, #0xa]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #7
	bgt _080B649E
	ldrh r1, [r4, #0xc]
	adds r0, r2, r1
	strh r0, [r4, #0xc]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080B649E
	lsls r0, r2, #1
	strh r0, [r4, #0xa]
_080B649E:
	ldrh r2, [r4, #0xe]
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B64DC
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080B64DC
	adds r0, r2, #1
	strh r0, [r4, #0xe]
	ldrb r1, [r6, #3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #3]
	ldrb r1, [r4, #0x10]
	adds r3, r5, #0
	adds r3, #0x42
	lsls r1, r1, #6
	ldrb r2, [r3]
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r6]
	movs r1, #4
	orrs r0, r1
	strb r0, [r6]
_080B64DC:
	movs r1, #0x26
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _080B6500
	movs r0, #0xd6
	bl PlaySE
	ldrb r0, [r6]
	movs r1, #8
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r6]
	movs r0, #0
	strh r0, [r5, #0x26]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B6500:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B6508: .4byte 0x02037230
_080B650C: .4byte 0x02036FF0
_080B6510: .4byte 0x020205AC
	thumb_func_end sub_080B645C

	thumb_func_start sub_080B6514
sub_080B6514: @ 0x080B6514
	push {lr}
	ldrh r1, [r0, #8]
	adds r1, #1
	movs r2, #0
	strh r1, [r0, #8]
	movs r1, #4
	strh r1, [r0, #0xa]
	strh r2, [r0, #0xc]
	movs r0, #0
	bl SetCameraPanningCallback
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end sub_080B6514

	thumb_func_start sub_080B6530
sub_080B6530: @ 0x080B6530
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0
	bl SetCameraPanning
	ldrh r0, [r4, #0xa]
	rsbs r2, r0, #0
	strh r2, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080B6558
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0xa]
_080B6558:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B6566
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B6566:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080B6530

	thumb_func_start sub_080B6570
sub_080B6570: @ 0x080B6570
	push {lr}
	ldr r1, _080B659C
	movs r0, #0
	strb r0, [r1, #6]
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl UnfreezeEventObjects
	bl InstallCameraPanAheadCallback
	ldr r0, _080B65A0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B659C: .4byte 0x02037230
_080B65A0: .4byte 0x080B62ED
	thumb_func_end sub_080B6570

	thumb_func_start sub_080B65A4
sub_080B65A4: @ 0x080B65A4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080B65D8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B65DC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #0xa]
	cmp r4, #0x6a
	bne _080B65D0
	movs r0, #1
	strh r0, [r1, #0xa]
_080B65D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B65D8: .4byte 0x080B65E1
_080B65DC: .4byte 0x03005B60
	thumb_func_end sub_080B65A4

	thumb_func_start sub_080B65E0
sub_080B65E0: @ 0x080B65E0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B6610
	adds r4, r1, r0
	ldr r5, _080B6614
_080B65F2:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B65F2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6610: .4byte 0x03005B60
_080B6614: .4byte 0x08537090
	thumb_func_end sub_080B65E0

	thumb_func_start sub_080B6618
sub_080B6618: @ 0x080B6618
	push {r4, lr}
	adds r4, r0, #0
	bl FreezeEventObjects
	bl CameraObjectReset2
	ldrb r0, [r4, #0xa]
	bl sub_080E0AA4
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080B6618

	thumb_func_start sub_080B6638
sub_080B6638: @ 0x080B6638
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080B66A0
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B66A4
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B6662
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B6696
_080B6662:
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #8]
	strh r1, [r5, #0xc]
	strh r1, [r5, #0xe]
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	bne _080B6690
	movs r0, #4
	strh r0, [r5, #8]
_080B6690:
	movs r0, #0x50
	bl PlaySE
_080B6696:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B66A0: .4byte 0x02037230
_080B66A4: .4byte 0x02036FF0
	thumb_func_end sub_080B6638

	thumb_func_start sub_080B66A8
sub_080B66A8: @ 0x080B66A8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080B6710
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #3
	ble _080B66C2
	bl sub_080B67A8
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B66C2:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080B66A8

	thumb_func_start sub_080B66CC
sub_080B66CC: @ 0x080B66CC
	push {lr}
	bl sub_080B6710
	bl sub_080B67B8
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end sub_080B66CC

	thumb_func_start sub_080B66DC
sub_080B66DC: @ 0x080B66DC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080B675C
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #3
	ble _080B66F6
	bl sub_080B67A8
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B66F6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080B66DC

	thumb_func_start sub_080B6700
sub_080B6700: @ 0x080B6700
	push {lr}
	bl sub_080B675C
	bl sub_080B67B8
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end sub_080B6700

	thumb_func_start sub_080B6710
sub_080B6710: @ 0x080B6710
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080B6754
	ldrb r0, [r0, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B6758
	adds r4, r4, r0
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #0x84
	bl Cos
	strh r0, [r4, #0x24]
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #0x94
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B674E
	ldrh r0, [r5, #0xc]
	adds r0, #1
	strh r0, [r5, #0xc]
_080B674E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6754: .4byte 0x02037230
_080B6758: .4byte 0x020205AC
	thumb_func_end sub_080B6710

	thumb_func_start sub_080B675C
sub_080B675C: @ 0x080B675C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080B67A0
	ldrb r0, [r0, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B67A4
	adds r4, r4, r0
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #0x7c
	bl Cos
	strh r0, [r4, #0x24]
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #0x76
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B679A
	ldrh r0, [r5, #0xc]
	adds r0, #1
	strh r0, [r5, #0xc]
_080B679A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B67A0: .4byte 0x02037230
_080B67A4: .4byte 0x020205AC
	thumb_func_end sub_080B675C

	thumb_func_start sub_080B67A8
sub_080B67A8: @ 0x080B67A8
	push {lr}
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B67A8

	thumb_func_start sub_080B67B8
sub_080B67B8: @ 0x080B67B8
	push {lr}
	ldr r0, _080B67F8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B67F4
	bl BGMusicStopped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B67F4
	bl sub_080E0ABC
	bl WarpIntoMap
	ldr r1, _080B67FC
	ldr r0, _080B6800
	str r0, [r1]
	ldr r0, _080B6804
	bl SetMainCallback2
	ldr r0, _080B6808
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B67F4:
	pop {r0}
	bx r0
	.align 2, 0
_080B67F8: .4byte 0x02037C74
_080B67FC: .4byte 0x03005B0C
_080B6800: .4byte 0x080B680D
_080B6804: .4byte 0x08085935
_080B6808: .4byte 0x080B65E1
	thumb_func_end sub_080B67B8

	thumb_func_start sub_080B680C
sub_080B680C: @ 0x080B680C
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	ldr r0, _080B682C
	movs r1, #0
	bl CreateTask
	ldr r1, _080B6830
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B682C: .4byte 0x080B6835
_080B6830: .4byte 0x03005B0C
	thumb_func_end sub_080B680C

	thumb_func_start sub_080B6834
sub_080B6834: @ 0x080B6834
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080B6864
	adds r4, r1, r0
	ldr r5, _080B6868
_080B6846:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6846
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6864: .4byte 0x03005B60
_080B6868: .4byte 0x085370A8
	thumb_func_end sub_080B6834

	thumb_func_start sub_080B686C
sub_080B686C: @ 0x080B686C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl CameraObjectReset2
	ldr r0, _080B68CC
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B68D0
	adds r4, r4, r0
	movs r0, #4
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0x10
	strh r0, [r5, #0xa]
	cmp r1, #0x6b
	bne _080B68D4
	movs r1, #1
	movs r0, #3
	strh r0, [r5, #8]
	b _080B68D6
	.align 2, 0
_080B68CC: .4byte 0x02037230
_080B68D0: .4byte 0x02036FF0
_080B68D4:
	movs r1, #0
_080B68D6:
	adds r0, r1, #0
	bl sub_080E0AA4
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080B686C

	thumb_func_start sub_080B68E8
sub_080B68E8: @ 0x080B68E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080B6920
	ldrb r0, [r0, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B6924
	adds r4, r4, r0
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	movs r0, #0x84
	bl Cos
	strh r0, [r4, #0x24]
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	movs r0, #0x94
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6920: .4byte 0x02037230
_080B6924: .4byte 0x020205AC
	thumb_func_end sub_080B68E8

	thumb_func_start sub_080B6928
sub_080B6928: @ 0x080B6928
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B6980
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B6984
	adds r5, r0, r1
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0x84
	bl Cos
	strh r0, [r5, #0x24]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0x94
	bl Sin
	strh r0, [r5, #0x26]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B6966
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
_080B6966:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B6976
	strh r0, [r5, #0x24]
	strh r0, [r5, #0x26]
	movs r0, #5
	strh r0, [r4, #8]
_080B6976:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6980: .4byte 0x02037230
_080B6984: .4byte 0x020205AC
	thumb_func_end sub_080B6928

	thumb_func_start sub_080B6988
sub_080B6988: @ 0x080B6988
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080B69C0
	ldrb r0, [r0, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B69C4
	adds r4, r4, r0
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	movs r0, #0x7c
	bl Cos
	strh r0, [r4, #0x24]
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	movs r0, #0x76
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B69C0: .4byte 0x02037230
_080B69C4: .4byte 0x020205AC
	thumb_func_end sub_080B6988

	thumb_func_start sub_080B69C8
sub_080B69C8: @ 0x080B69C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B6A20
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B6A24
	adds r5, r0, r1
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0x7c
	bl Cos
	strh r0, [r5, #0x24]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0x76
	bl Sin
	strh r0, [r5, #0x26]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B6A06
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
_080B6A06:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B6A18
	strh r0, [r5, #0x24]
	strh r0, [r5, #0x26]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B6A18:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6A20: .4byte 0x02037230
_080B6A24: .4byte 0x020205AC
	thumb_func_end sub_080B69C8

	thumb_func_start sub_080B6A28
sub_080B6A28: @ 0x080B6A28
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080E0AD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6A44
	bl sub_080E0ABC
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	b _080B6A46
_080B6A44:
	movs r0, #0
_080B6A46:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080B6A28

	thumb_func_start sub_080B6A4C
sub_080B6A4C: @ 0x080B6A4C
	push {r4, lr}
	ldr r0, _080B6A98
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B6A9C
	adds r4, r0, r1
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B6A90
	bl CameraObjectReset1
	bl ScriptContext2_Disable
	movs r0, #4
	bl sub_08092CF8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldr r0, _080B6AA0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B6A90:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6A98: .4byte 0x02037230
_080B6A9C: .4byte 0x02036FF0
_080B6AA0: .4byte 0x080B6835
	thumb_func_end sub_080B6A4C

	thumb_func_start FldEff_UseWaterfall
FldEff_UseWaterfall: @ 0x080B6AA4
	push {r4, lr}
	ldr r4, _080B6AD0
	adds r0, r4, #0
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B6AD4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _080B6AD8
	ldr r2, [r2]
	strh r2, [r1, #0xa]
	bl _call_via_r4
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6AD0: .4byte 0x080B6ADD
_080B6AD4: .4byte 0x03005B60
_080B6AD8: .4byte 0x020388A8
	thumb_func_end FldEff_UseWaterfall

	thumb_func_start sub_080B6ADC
sub_080B6ADC: @ 0x080B6ADC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080B6B18
	ldr r2, _080B6B1C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_080B6AEE:
	movs r0, #8
	ldrsh r2, [r4, r0]
	lsls r2, r2, #2
	adds r2, r2, r5
	ldr r0, _080B6B20
	ldrb r0, [r0, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080B6B24
	adds r1, r1, r0
	ldr r2, [r2]
	adds r0, r4, #0
	bl _call_via_r2
	thumb_func_end sub_080B6ADC

	thumb_func_start sub_080B6B0C
sub_080B6B0C: @ 0x080B6B0C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6AEE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6B18: .4byte 0x085370C4
_080B6B1C: .4byte 0x03005B60
_080B6B20: .4byte 0x02037230
_080B6B24: .4byte 0x02036FF0
	thumb_func_end sub_080B6B0C

	thumb_func_start sub_080B6B28
sub_080B6B28: @ 0x080B6B28
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptContext2_Enable
	ldr r1, _080B6B44
	movs r0, #1
	strb r0, [r1, #6]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6B44: .4byte 0x02037230
	thumb_func_end sub_080B6B28

	thumb_func_start waterfall_1_do_anim_probably
waterfall_1_do_anim_probably: @ 0x080B6B48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ScriptContext2_Enable
	adds r0, r5, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6B78
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	ldr r1, _080B6B80
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, #0x3b
	bl FieldEffectStart
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B6B78:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6B80: .4byte 0x020388A8
	thumb_func_end waterfall_1_do_anim_probably

	thumb_func_start waterfall_2_wait_anim_finish_probably
waterfall_2_wait_anim_finish_probably: @ 0x080B6B84
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #6
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6B9E
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	b _080B6BA0
_080B6B9E:
	movs r0, #0
_080B6BA0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end waterfall_2_wait_anim_finish_probably

	thumb_func_start sub_080B6BA8
sub_080B6BA8: @ 0x080B6BA8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #2
	bl sub_08092CCC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080B6BA8

	thumb_func_start sub_080B6BD0
sub_080B6BD0: @ 0x080B6BD0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6BE6
	movs r0, #0
	b _080B6C22
_080B6BE6:
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsWaterfall
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080B6C1C
	bl ScriptContext2_Disable
	ldr r0, _080B6C14
	strb r4, [r0, #6]
	ldr r0, _080B6C18
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0x2b
	bl FieldEffectActiveListRemove
	movs r0, #0
	b _080B6C22
	.align 2, 0
_080B6C14: .4byte 0x02037230
_080B6C18: .4byte 0x080B6ADD
_080B6C1C:
	movs r0, #3
	strh r0, [r5, #8]
	movs r0, #1
_080B6C22:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080B6BD0

	thumb_func_start FldEff_UseDive
FldEff_UseDive: @ 0x080B6C28
	push {r4, lr}
	ldr r4, _080B6C58
	adds r0, r4, #0
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B6C5C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r3, _080B6C60
	ldr r2, [r3]
	strh r2, [r1, #0x26]
	ldr r2, [r3, #4]
	strh r2, [r1, #0x24]
	bl _call_via_r4
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6C58: .4byte 0x080B6C65
_080B6C5C: .4byte 0x03005B60
_080B6C60: .4byte 0x020388A8
	thumb_func_end FldEff_UseDive

	thumb_func_start Task_Dive
Task_Dive: @ 0x080B6C64
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080B6C94
	ldr r2, _080B6C98
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_080B6C76:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6C76
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6C94: .4byte 0x085370D8
_080B6C98: .4byte 0x03005B60
	thumb_func_end Task_Dive

	thumb_func_start dive_1_lock
dive_1_lock: @ 0x080B6C9C
	ldr r2, _080B6CAC
	movs r1, #1
	strb r1, [r2, #6]
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	movs r0, #0
	bx lr
	.align 2, 0
_080B6CAC: .4byte 0x02037230
	thumb_func_end dive_1_lock

	thumb_func_start dive_2_unknown
dive_2_unknown: @ 0x080B6CB0
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptContext2_Enable
	ldr r1, _080B6CD4
	movs r2, #0x26
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, #0x3b
	bl FieldEffectStart
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6CD4: .4byte 0x020388A8
	thumb_func_end dive_2_unknown

	thumb_func_start dive_3_unknown
dive_3_unknown: @ 0x080B6CD8
	push {lr}
	sub sp, #8
	mov r1, sp
	adds r1, #2
	mov r0, sp
	bl PlayerGetDestCoords
	movs r0, #6
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6D1C
	ldr r2, _080B6D24
	ldr r0, _080B6D28
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x1e]
	mov r0, sp
	bl dive_warp
	ldr r0, _080B6D2C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0x2c
	bl FieldEffectActiveListRemove
_080B6D1C:
	movs r0, #0
	add sp, #8
	pop {r1}
	bx r1
	.align 2, 0
_080B6D24: .4byte 0x02036FF0
_080B6D28: .4byte 0x02037230
_080B6D2C: .4byte 0x080B6C65
	thumb_func_end dive_3_unknown

	thumb_func_start sub_080B6D30
sub_080B6D30: @ 0x080B6D30
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080B6D44
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B6D44: .4byte 0x080B6D49
	thumb_func_end sub_080B6D30

	thumb_func_start sub_080B6D48
sub_080B6D48: @ 0x080B6D48
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _080B6D90
	ldr r2, _080B6D94
	ldr r5, _080B6D98
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_080B6D5C:
	movs r0, #8
	ldrsh r3, [r4, r0]
	lsls r3, r3, #2
	adds r3, r3, r6
	ldrb r0, [r5, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080B6D9C
	adds r1, r1, r0
	ldrb r0, [r5, #4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080B6DA0
	adds r2, r2, r0
	ldr r3, [r3]
	adds r0, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6D5C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6D90: .4byte 0x085370E4
_080B6D94: .4byte 0x03005B60
_080B6D98: .4byte 0x02037230
_080B6D9C: .4byte 0x02036FF0
_080B6DA0: .4byte 0x020205AC
	thumb_func_end sub_080B6D48

	thumb_func_start sub_080B6DA4
sub_080B6DA4: @ 0x080B6DA4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl FreezeEventObjects
	bl CameraObjectReset2
	movs r0, #0
	bl SetCameraPanningCallback
	ldr r0, _080B6DD8
	movs r2, #1
	strb r2, [r0, #6]
	ldrb r0, [r5, #3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #3]
	strh r2, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6DD8: .4byte 0x02037230
	thumb_func_end sub_080B6DA4

	thumb_func_start sub_080B6DDC
sub_080B6DDC: @ 0x080B6DDC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0
	bl SetCameraPanning
	ldrh r0, [r4, #0xa]
	rsbs r0, r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080B6E08
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B6E08:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080B6DDC

	thumb_func_start sub_080B6E10
sub_080B6E10: @ 0x080B6E10
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r2, #0x26]
	movs r0, #1
	strh r0, [r4, #0xe]
	ldr r3, _080B6E58
	movs r5, #0x10
	ldrsh r0, [r1, r5]
	str r0, [r3]
	movs r5, #0x12
	ldrsh r0, [r1, r5]
	str r0, [r3, #4]
	adds r0, r2, #0
	adds r0, #0x43
	ldrb r0, [r0]
	subs r0, #1
	str r0, [r3, #8]
	ldrb r0, [r2, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r3, #0xc]
	movs r0, #0x32
	bl FieldEffectStart
	movs r0, #0xb2
	bl PlaySE
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6E58: .4byte 0x020388A8
	thumb_func_end sub_080B6E10

	thumb_func_start sub_080B6E5C
sub_080B6E5C: @ 0x080B6E5C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0
	bl SetCameraPanning
	ldrh r0, [r4, #0xa]
	rsbs r2, r0, #0
	strh r2, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r1, r0, #1
	strh r1, [r4, #0xc]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bgt _080B6E96
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080B6EA8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bgt _080B6EA8
	lsls r0, r2, #1
	b _080B6EA6
_080B6E96:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	bne _080B6EA8
	lsls r0, r2, #0x10
	cmp r0, #0
	ble _080B6EA8
	asrs r0, r0, #0x11
_080B6EA6:
	strh r0, [r4, #0xa]
_080B6EA8:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #6
	ble _080B6EF4
	adds r0, r5, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r2, r1, #0x11
	rsbs r2, r2, #0
	movs r7, #0x26
	ldrsh r3, [r5, r7]
	movs r7, #0x22
	ldrsh r0, [r5, r7]
	adds r0, r0, r1
	ldr r1, _080B6EEC
	movs r7, #0
	ldrsh r1, [r1, r7]
	adds r0, r0, r1
	asrs r2, r2, #0x10
	adds r0, r0, r2
	cmn r3, r0
	ble _080B6EF0
	ldrh r0, [r5, #0x26]
	ldrh r1, [r4, #0xe]
	subs r0, r0, r1
	strh r0, [r5, #0x26]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _080B6EF4
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	b _080B6EF4
	.align 2, 0
_080B6EEC: .4byte 0x02021B3A
_080B6EF0:
	movs r0, #1
	strh r0, [r4, #0x10]
_080B6EF4:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B6F32
	movs r7, #0x26
	ldrsh r1, [r5, r7]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080B6F32
	adds r0, r2, #1
	strh r0, [r4, #0x12]
	ldrb r0, [r6, #3]
	movs r2, #4
	orrs r0, r2
	strb r0, [r6, #3]
	ldrb r1, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
_080B6F32:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B6F48
	movs r7, #0x10
	ldrsh r0, [r4, r7]
	cmp r0, #0
	beq _080B6F48
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B6F48:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080B6E5C

	thumb_func_start sub_080B6F50
sub_080B6F50: @ 0x080B6F50
	push {r4, lr}
	adds r4, r0, #0
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080B6F50

	thumb_func_start sub_080B6F6C
sub_080B6F6C: @ 0x080B6F6C
	push {lr}
	ldr r0, _080B6FAC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B6FA4
	bl BGMusicStopped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B6FA4
	bl WarpIntoMap
	ldr r1, _080B6FB0
	ldr r0, _080B6FB4
	str r0, [r1]
	ldr r0, _080B6FB8
	bl SetMainCallback2
	ldr r0, _080B6FBC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B6FA4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B6FAC: .4byte 0x02037C74
_080B6FB0: .4byte 0x03005B0C
_080B6FB4: .4byte 0x080B6FC1
_080B6FB8: .4byte 0x08085935
_080B6FBC: .4byte 0x080B6D49
	thumb_func_end sub_080B6F6C

	thumb_func_start mapldr_080851BC
mapldr_080851BC: @ 0x080B6FC0
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	ldr r0, _080B6FE0
	movs r1, #0
	str r1, [r0]
	ldr r0, _080B6FE4
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B6FE0: .4byte 0x03005B0C
_080B6FE4: .4byte 0x080B6FE9
	thumb_func_end mapldr_080851BC

	thumb_func_start sub_080B6FE8
sub_080B6FE8: @ 0x080B6FE8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _080B7030
	ldr r2, _080B7034
	ldr r5, _080B7038
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_080B6FFC:
	movs r0, #8
	ldrsh r3, [r4, r0]
	lsls r3, r3, #2
	adds r3, r3, r6
	ldrb r0, [r5, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080B703C
	adds r1, r1, r0
	ldrb r0, [r5, #4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080B7040
	adds r2, r2, r0
	ldr r3, [r3]
	adds r0, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B6FFC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7030: .4byte 0x085370FC
_080B7034: .4byte 0x03005B60
_080B7038: .4byte 0x02037230
_080B703C: .4byte 0x02036FF0
_080B7040: .4byte 0x020205AC
	thumb_func_end sub_080B6FE8

	thumb_func_start sub_080B7044
sub_080B7044: @ 0x080B7044
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl CameraObjectReset2
	bl FreezeEventObjects
	ldr r1, _080B7070
	movs r0, #1
	strb r0, [r1, #6]
	ldrb r0, [r4, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #1]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B7070: .4byte 0x02037230
	thumb_func_end sub_080B7044

	thumb_func_start sub_080B7074
sub_080B7074: @ 0x080B7074
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B70B4
	ldr r1, _080B70BC
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, #0x12
	ldrsh r0, [r5, r2]
	str r0, [r1, #4]
	adds r0, r6, #0
	adds r0, #0x43
	ldrb r0, [r0]
	subs r0, #1
	str r0, [r1, #8]
	ldrb r0, [r6, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r1, #0xc]
	movs r0, #0x31
	bl FieldEffectStart
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B70B4:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B70BC: .4byte 0x020388A8
	thumb_func_end sub_080B7074

	thumb_func_start sub_080B70C0
sub_080B70C0: @ 0x080B70C0
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7110
	adds r0, r0, r1
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #1
	bls _080B7108
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	bl CameraObjectReset1
	movs r0, #0xaf
	bl PlaySE
	movs r0, #4
	bl sub_08092E84
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
_080B7108:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B7110: .4byte 0x020205AC
	thumb_func_end sub_080B70C0

	thumb_func_start sub_080B7114
sub_080B7114: @ 0x080B7114
	push {lr}
	adds r0, r1, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B713E
	ldr r1, _080B7144
	movs r0, #0
	strb r0, [r1, #6]
	bl ScriptContext2_Disable
	bl UnfreezeEventObjects
	ldr r0, _080B7148
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B713E:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B7144: .4byte 0x02037230
_080B7148: .4byte 0x080B6FE9
	thumb_func_end sub_080B7114

	thumb_func_start FldEff_LavaridgeGymWarp
FldEff_LavaridgeGymWarp: @ 0x080B714C
	push {r4, lr}
	ldr r4, _080B71A4
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _080B71A8
	adds r0, #0x84
	ldr r0, [r0]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B71AC
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	movs r1, #3
	ldrb r3, [r4, #0xc]
	ands r3, r1
	lsls r3, r3, #2
	ldrb r4, [r2, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, #5]
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r3, #2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B71A4: .4byte 0x020388A8
_080B71A8: .4byte 0x084DDE4C
_080B71AC: .4byte 0x020205AC
	thumb_func_end FldEff_LavaridgeGymWarp

	thumb_func_start sub_080B71B0
sub_080B71B0: @ 0x080B71B0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B71C8
	adds r0, r2, #0
	movs r1, #0x32
	bl FieldEffectStop
_080B71C8:
	pop {r0}
	bx r0
	thumb_func_end sub_080B71B0

	thumb_func_start sub_080B71CC
sub_080B71CC: @ 0x080B71CC
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080B71E0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B71E0: .4byte 0x080B71E5
	thumb_func_end sub_080B71CC

	thumb_func_start sub_080B71E4
sub_080B71E4: @ 0x080B71E4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _080B722C
	ldr r2, _080B7230
	ldr r5, _080B7234
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_080B71F8:
	movs r0, #8
	ldrsh r3, [r4, r0]
	lsls r3, r3, #2
	adds r3, r3, r6
	ldrb r0, [r5, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080B7238
	adds r1, r1, r0
	ldrb r0, [r5, #4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080B723C
	adds r2, r2, r0
	ldr r3, [r3]
	adds r0, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B71F8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B722C: .4byte 0x0853710C
_080B7230: .4byte 0x03005B60
_080B7234: .4byte 0x02037230
_080B7238: .4byte 0x02036FF0
_080B723C: .4byte 0x020205AC
	thumb_func_end sub_080B71E4

	thumb_func_start sub_080B7240
sub_080B7240: @ 0x080B7240
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FreezeEventObjects
	bl CameraObjectReset2
	ldr r1, _080B726C
	movs r0, #1
	strb r0, [r1, #6]
	ldrb r0, [r4, #3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4, #3]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B726C: .4byte 0x02037230
	thumb_func_end sub_080B7240

	thumb_func_start sub_080B7270
sub_080B7270: @ 0x080B7270
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B72E4
	ldrh r1, [r5, #0xa]
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #3
	ble _080B72C4
	ldr r1, _080B72C0
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, #4]
	adds r0, r6, #0
	adds r0, #0x43
	ldrb r0, [r0]
	subs r0, #1
	str r0, [r1, #8]
	ldrb r0, [r6, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r1, #0xc]
	movs r0, #0x31
	bl FieldEffectStart
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _080B72E4
	.align 2, 0
_080B72C0: .4byte 0x020388A8
_080B72C4:
	adds r0, r1, #1
	strh r0, [r5, #0xa]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092F60
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	movs r0, #0x27
	bl PlaySE
_080B72E4:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080B7270

	thumb_func_start sub_080B72EC
sub_080B72EC: @ 0x080B72EC
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r2, _080B7320
	movs r0, #0xa
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #2
	bne _080B7316
	ldrb r0, [r4, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #1]
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_080B7316:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B7320: .4byte 0x020205AC
	thumb_func_end sub_080B72EC

	thumb_func_start sub_080B7324
sub_080B7324: @ 0x080B7324
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x31
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B7342
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B7342:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080B7324

	thumb_func_start sub_080B734C
sub_080B734C: @ 0x080B734C
	push {lr}
	ldr r0, _080B738C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B7384
	bl BGMusicStopped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B7384
	bl WarpIntoMap
	ldr r1, _080B7390
	ldr r0, _080B7394
	str r0, [r1]
	ldr r0, _080B7398
	bl SetMainCallback2
	ldr r0, _080B739C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B7384:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B738C: .4byte 0x02037C74
_080B7390: .4byte 0x03005B0C
_080B7394: .4byte 0x080B62C1
_080B7398: .4byte 0x08085935
_080B739C: .4byte 0x080B71E5
	thumb_func_end sub_080B734C

	thumb_func_start FldEff_PopOutOfAsh
FldEff_PopOutOfAsh: @ 0x080B73A0
	push {r4, lr}
	ldr r4, _080B73F8
	adds r1, r4, #4
	adds r0, r4, #0
	movs r2, #8
	movs r3, #8
	bl sub_08092A50
	ldr r0, _080B73FC
	adds r0, #0x80
	ldr r0, [r0]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #8]
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B7400
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	movs r1, #3
	ldrb r3, [r4, #0xc]
	ands r3, r1
	lsls r3, r3, #2
	ldrb r4, [r2, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, #5]
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r3, #2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B73F8: .4byte 0x020388A8
_080B73FC: .4byte 0x084DDE4C
_080B7400: .4byte 0x020205AC
	thumb_func_end FldEff_PopOutOfAsh

	thumb_func_start sub_080B7404
sub_080B7404: @ 0x080B7404
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B741C
	adds r0, r2, #0
	movs r1, #0x31
	bl FieldEffectStop
_080B741C:
	pop {r0}
	bx r0
	thumb_func_end sub_080B7404

	thumb_func_start StartEscapeRopeFieldEffect
StartEscapeRopeFieldEffect: @ 0x080B7420
	push {lr}
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	ldr r0, _080B7438
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B7438: .4byte 0x080B743D
	thumb_func_end StartEscapeRopeFieldEffect

	thumb_func_start DoEscapeRopeFieldEffect
DoEscapeRopeFieldEffect: @ 0x080B743C
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B7464
	ldr r2, _080B7468
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B7464: .4byte 0x08537120
_080B7468: .4byte 0x03005B60
	thumb_func_end DoEscapeRopeFieldEffect

	thumb_func_start EscapeRopeFieldEffect_Step0
EscapeRopeFieldEffect_Step0: @ 0x080B746C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0x40
	strh r0, [r4, #0x24]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EscapeRopeFieldEffect_Step0

	thumb_func_start EscapeRopeFieldEffect_Step1
EscapeRopeFieldEffect_Step1: @ 0x080B748C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080B7530
	mov r0, sp
	movs r2, #5
	bl memcpy
	ldrh r1, [r4, #0x24]
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080B74B8
	subs r0, r1, #1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B74B8
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
_080B74B8:
	ldr r0, _080B7534
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7538
	adds r5, r0, r1
	adds r0, r5, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B74DE
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B7598
_080B74DE:
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B7550
	ldr r0, _080B753C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B7550
	bl BGMusicStopped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B7550
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl SetEventObjectDirection
	bl SetWarpDestinationToEscapeWarp
	bl WarpIntoMap
	ldr r1, _080B7540
	ldr r0, _080B7544
	str r0, [r1]
	ldr r0, _080B7548
	bl SetMainCallback2
	ldr r0, _080B754C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	b _080B7598
	.align 2, 0
_080B7530: .4byte 0x08537128
_080B7534: .4byte 0x02037230
_080B7538: .4byte 0x02036FF0
_080B753C: .4byte 0x02037C74
_080B7540: .4byte 0x03005B0C
_080B7544: .4byte 0x080B75A1
_080B7548: .4byte 0x08085935
_080B754C: .4byte 0x080B743D
_080B7550:
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080B7564
	subs r0, r1, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B7598
_080B7564:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	add r0, sp
	ldrb r0, [r0]
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl EventObjectSetHeldMovement
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0xb
	bgt _080B758C
	adds r0, r1, #1
	strh r0, [r4, #0xc]
_080B758C:
	ldrh r1, [r4, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x12
	movs r0, #8
	asrs r0, r1
	strh r0, [r4, #0xa]
_080B7598:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end EscapeRopeFieldEffect_Step1

	thumb_func_start mapldr_080859D4
mapldr_080859D4: @ 0x080B75A0
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	ldr r1, _080B75DC
	movs r0, #0
	str r0, [r1]
	ldr r2, _080B75E0
	ldr r0, _080B75E4
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #1]
	ldr r0, _080B75E8
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B75DC: .4byte 0x03005B0C
_080B75E0: .4byte 0x02036FF0
_080B75E4: .4byte 0x02037230
_080B75E8: .4byte 0x080B75ED
	thumb_func_end mapldr_080859D4

	thumb_func_start ExecuteTeleportFieldEffectTask
ExecuteTeleportFieldEffectTask: @ 0x080B75EC
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B7614
	ldr r2, _080B7618
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B7614: .4byte 0x08537130
_080B7618: .4byte 0x03005B60
	thumb_func_end ExecuteTeleportFieldEffectTask

	thumb_func_start sub_080B761C
sub_080B761C: @ 0x080B761C
	push {r4, lr}
	adds r4, r0, #0
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B763A
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
_080B763A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080B761C

	thumb_func_start sub_080B7640
sub_080B7640: @ 0x080B7640
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _080B76C4
	mov r0, sp
	movs r2, #5
	bl memcpy
	ldr r0, _080B76C8
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B76CC
	adds r6, r0, r1
	ldrh r1, [r5, #0xa]
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _080B7672
	subs r0, r1, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B7704
_080B7672:
	adds r0, r6, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B768A
	adds r0, r6, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B7718
_080B768A:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0x1f
	ble _080B76D4
	movs r2, #0x26
	ldrsh r4, [r5, r2]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080B76D4
	ldrb r1, [r6, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #1]
	bl ScriptContext2_Disable
	bl UnfreezeEventObjects
	ldr r0, _080B76D0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	b _080B7718
	.align 2, 0
_080B76C4: .4byte 0x08537128
_080B76C8: .4byte 0x02037230
_080B76CC: .4byte 0x02036FF0
_080B76D0: .4byte 0x080B75ED
_080B76D4:
	ldrb r0, [r6, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	add r0, sp
	ldrb r0, [r0]
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl EventObjectSetHeldMovement
	ldrh r1, [r5, #0xc]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	cmp r0, #0x1f
	bgt _080B76FC
	adds r0, r1, #1
	strh r0, [r5, #0xc]
_080B76FC:
	ldrh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	strh r0, [r5, #0xa]
_080B7704:
	ldrb r2, [r6, #1]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #5
	subs r0, #0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #1]
_080B7718:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080B7640

	thumb_func_start sub_080B7720
sub_080B7720: @ 0x080B7720
	push {lr}
	ldr r0, _080B7730
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B7730: .4byte 0x080B7735
	thumb_func_end sub_080B7720

	thumb_func_start sub_080B7734
sub_080B7734: @ 0x080B7734
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B775C
	ldr r2, _080B7760
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B775C: .4byte 0x08537138
_080B7760: .4byte 0x03005B60
	thumb_func_end sub_080B7734

	thumb_func_start TeleportFieldEffectTask1
TeleportFieldEffectTask1: @ 0x080B7764
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	bl CameraObjectReset2
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TeleportFieldEffectTask1

	thumb_func_start TeleportFieldEffectTask2
TeleportFieldEffectTask2: @ 0x080B778C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080B7810
	mov r0, sp
	movs r2, #5
	bl memcpy
	ldr r0, _080B7814
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7818
	adds r5, r0, r1
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080B77BE
	subs r0, r1, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B77D8
_080B77BE:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	bl EventObjectTurn
	movs r0, #8
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
_080B77D8:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #7
	ble _080B7806
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r1, r0
	bne _080B7806
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #4
	strh r0, [r4, #0xa]
	movs r0, #8
	strh r0, [r4, #0xc]
	movs r0, #1
	strh r0, [r4, #0xe]
	movs r0, #0x2d
	bl PlaySE
_080B7806:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7810: .4byte 0x08537128
_080B7814: .4byte 0x02037230
_080B7818: .4byte 0x02036FF0
	thumb_func_end TeleportFieldEffectTask2

	thumb_func_start TeleportFieldEffectTask3
TeleportFieldEffectTask3: @ 0x080B781C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080B78E0
	mov r0, sp
	movs r2, #5
	bl memcpy
	ldr r2, _080B78E4
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B78E8
	adds r3, r0, r1
	ldrb r1, [r2, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B78EC
	adds r5, r0, r1
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080B7866
	movs r0, #4
	strh r0, [r4, #0xa]
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	add r0, sp
	ldrb r1, [r0]
	adds r0, r3, #0
	bl EventObjectTurn
_080B7866:
	ldrh r0, [r5, #0x22]
	ldrh r1, [r4, #0xe]
	subs r0, r0, r1
	strh r0, [r5, #0x22]
	ldrh r1, [r4, #0xe]
	ldrh r2, [r4, #0x10]
	adds r0, r1, r2
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080B7892
	movs r0, #4
	strh r0, [r4, #0xc]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _080B7892
	lsls r0, r1, #1
	strh r0, [r4, #0xe]
_080B7892:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #8
	ble _080B78C0
	ldrb r1, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #5]
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080B78C0
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
_080B78C0:
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0xa7
	ble _080B78D6
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
_080B78D6:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B78E0: .4byte 0x08537128
_080B78E4: .4byte 0x02037230
_080B78E8: .4byte 0x02036FF0
_080B78EC: .4byte 0x020205AC
	thumb_func_end TeleportFieldEffectTask3

	thumb_func_start TeleportFieldEffectTask4
TeleportFieldEffectTask4: @ 0x080B78F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B7944
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B793E
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B7910
	bl ClearMirageTowerPulseBlendEffect
	movs r0, #1
	strh r0, [r4, #0x12]
_080B7910:
	bl BGMusicStopped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B793E
	bl SetWarpDestinationToLastHealLocation
	bl WarpIntoMap
	ldr r0, _080B7948
	bl SetMainCallback2
	ldr r1, _080B794C
	ldr r0, _080B7950
	str r0, [r1]
	ldr r0, _080B7954
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B793E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7944: .4byte 0x02037C74
_080B7948: .4byte 0x08085935
_080B794C: .4byte 0x03005B0C
_080B7950: .4byte 0x080B7959
_080B7954: .4byte 0x080B7735
	thumb_func_end TeleportFieldEffectTask4

	thumb_func_start mapldr_08085D88
mapldr_08085D88: @ 0x080B7958
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	ldr r1, _080B7998
	movs r0, #0
	str r0, [r1]
	ldr r2, _080B799C
	ldr r0, _080B79A0
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #1]
	bl CameraObjectReset2
	ldr r0, _080B79A4
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B7998: .4byte 0x03005B0C
_080B799C: .4byte 0x02036FF0
_080B79A0: .4byte 0x02037230
_080B79A4: .4byte 0x080B79A9
	thumb_func_end mapldr_08085D88

	thumb_func_start sub_080B79A8
sub_080B79A8: @ 0x080B79A8
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B79D0
	ldr r2, _080B79D4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B79D0: .4byte 0x08537148
_080B79D4: .4byte 0x03005B60
	thumb_func_end sub_080B79A8

	thumb_func_start sub_080B79D8
sub_080B79D8: @ 0x080B79D8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B7A4E
	ldr r5, _080B7A54
	ldrb r0, [r5, #4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080B7A58
	adds r2, r2, r0
	adds r0, r2, #0
	adds r0, #0x29
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r0, r4, #0x11
	rsbs r0, r0, #0
	ldrh r1, [r2, #0x22]
	ldr r3, _080B7A5C
	adds r1, r1, r4
	ldrh r3, [r3]
	adds r1, r1, r3
	asrs r0, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	strh r0, [r2, #0x26]
	ldr r3, _080B7A60
	ldrb r0, [r5, #5]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r3, [r1, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1, #1]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	movs r0, #8
	strh r0, [r6, #0xa]
	movs r0, #1
	strh r0, [r6, #0xc]
	adds r2, #0x42
	ldrb r0, [r2]
	lsrs r0, r0, #6
	strh r0, [r6, #0x24]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x26]
	movs r0, #0x2d
	bl PlaySE
_080B7A4E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7A54: .4byte 0x02037230
_080B7A58: .4byte 0x020205AC
_080B7A5C: .4byte 0x02021B3A
_080B7A60: .4byte 0x02036FF0
	thumb_func_end sub_080B79D8

	thumb_func_start sub_080B7A64
sub_080B7A64: @ 0x080B7A64
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080B7ACC
	mov r0, sp
	movs r2, #5
	bl memcpy
	ldr r2, _080B7AD0
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7AD4
	adds r6, r0, r1
	ldrb r1, [r2, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7AD8
	adds r5, r0, r1
	ldrh r0, [r4, #0xa]
	ldrh r1, [r5, #0x26]
	adds r0, r0, r1
	strh r0, [r5, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	rsbs r1, r1, #0
	cmp r0, r1
	blt _080B7ADC
	ldrh r1, [r4, #0x22]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _080B7B02
	adds r0, r1, #1
	strh r0, [r4, #0x22]
	ldrb r0, [r6]
	movs r1, #4
	orrs r0, r1
	strb r0, [r6]
	ldrh r1, [r4, #0x24]
	adds r3, r5, #0
	adds r3, #0x42
	lsls r1, r1, #6
	ldrb r2, [r3]
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080B7B02
	.align 2, 0
_080B7ACC: .4byte 0x08537128
_080B7AD0: .4byte 0x02037230
_080B7AD4: .4byte 0x02036FF0
_080B7AD8: .4byte 0x020205AC
_080B7ADC:
	ldrb r1, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #5]
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080B7B02
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
_080B7B02:
	ldrh r2, [r5, #0x26]
	movs r3, #0x26
	ldrsh r1, [r5, r3]
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080B7B26
	ldrh r1, [r4, #0xa]
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	cmp r0, #1
	ble _080B7B26
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080B7B26
	subs r0, r1, #1
	strh r0, [r4, #0xa]
_080B7B26:
	ldrh r0, [r4, #0xc]
	subs r0, #1
	movs r7, #0
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B7B48
	movs r0, #4
	strh r0, [r4, #0xc]
	ldrb r0, [r6, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	add r0, sp
	ldrb r1, [r0]
	adds r0, r6, #0
	bl EventObjectTurn
_080B7B48:
	movs r1, #0x26
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _080B7B5E
	strh r7, [r5, #0x26]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #1
	strh r0, [r4, #0xa]
	strh r7, [r4, #0xc]
_080B7B5E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B7A64

	thumb_func_start sub_080B7B68
sub_080B7B68: @ 0x080B7B68
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080B7BE4
	mov r0, sp
	movs r2, #5
	bl memcpy
	ldr r0, _080B7BE8
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7BEC
	adds r5, r0, r1
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B7BDC
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	bl EventObjectTurn
	movs r0, #8
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _080B7BDC
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r1, r0
	bne _080B7BDC
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl UnfreezeEventObjects
	ldr r0, _080B7BF0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B7BDC:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7BE4: .4byte 0x08537128
_080B7BE8: .4byte 0x02037230
_080B7BEC: .4byte 0x02036FF0
_080B7BF0: .4byte 0x080B79A9
	thumb_func_end sub_080B7B68

	thumb_func_start FldEff_FieldMoveShowMon
FldEff_FieldMoveShowMon: @ 0x080B7BF4
	push {r4, lr}
	bl GetCurrentMapType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsMapTypeOutdoors
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080B7C14
	ldr r0, _080B7C10
	b _080B7C16
	.align 2, 0
_080B7C10: .4byte 0x080B7CAD
_080B7C14:
	ldr r0, _080B7C44
_080B7C16:
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _080B7C48
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [r2, #8]
	bl sub_080B83B8
	ldr r2, _080B7C4C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x26]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B7C44: .4byte 0x080B800D
_080B7C48: .4byte 0x020388A8
_080B7C4C: .4byte 0x03005B60
	thumb_func_end FldEff_FieldMoveShowMon

	thumb_func_start FldEff_FieldMoveShowMonInit
FldEff_FieldMoveShowMonInit: @ 0x080B7C50
	push {r4, r5, r6, lr}
	ldr r5, _080B7CA4
	ldr r0, [r5]
	movs r6, #0x80
	lsls r6, r6, #0x18
	ands r6, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	ldr r0, _080B7CA8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	str r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	str r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [r5, #8]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	movs r0, #6
	bl FieldEffectStart
	movs r0, #0x3b
	bl FieldEffectActiveListRemove
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B7CA4: .4byte 0x020388A8
_080B7CA8: .4byte 0x02024190
	thumb_func_end FldEff_FieldMoveShowMonInit

	thumb_func_start sub_080B7CAC
sub_080B7CAC: @ 0x080B7CAC
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B7CD4
	ldr r2, _080B7CD8
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B7CD4: .4byte 0x08537154
_080B7CD8: .4byte 0x03005B60
	thumb_func_end sub_080B7CAC

	thumb_func_start sub_080B7CDC
sub_080B7CDC: @ 0x080B7CDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B7D38
	ldrh r0, [r0]
	strh r0, [r4, #0x1e]
	ldr r0, _080B7D3C
	ldrh r0, [r0]
	strh r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x22
	ldr r1, _080B7D40
	ldr r1, [r1, #0xc]
	bl StoreWordInTwoHalfwords
	ldr r1, _080B7D44
	strh r1, [r4, #0xa]
	ldr r0, _080B7D48
	strh r0, [r4, #0xc]
	movs r0, #0x3f
	strh r0, [r4, #0xe]
	movs r0, #0x3e
	strh r0, [r4, #0x10]
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4, #0xc]
	movs r0, #0x44
	bl SetGpuReg
	ldrh r1, [r4, #0xe]
	movs r0, #0x48
	bl SetGpuReg
	ldrh r1, [r4, #0x10]
	movs r0, #0x4a
	bl SetGpuReg
	ldr r0, _080B7D4C
	bl SetVBlankCallback
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7D38: .4byte 0x04000048
_080B7D3C: .4byte 0x0400004A
_080B7D40: .4byte 0x03002360
_080B7D44: .4byte 0x0000F0F1
_080B7D48: .4byte 0x00005051
_080B7D4C: .4byte 0x080B7F65
	thumb_func_end sub_080B7CDC

	thumb_func_start sub_080B7D50
sub_080B7D50: @ 0x080B7D50
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080B7DA8
	ldrh r1, [r0]
	lsrs r1, r1, #2
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x10
	ldrh r4, [r0]
	lsrs r4, r4, #8
	lsls r4, r4, #0x1b
	lsrs r4, r4, #0x10
	ldr r0, _080B7DAC
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuSet
	movs r0, #0
	str r0, [sp]
	adds r5, r4, r5
	ldr r2, _080B7DB0
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	ldr r0, _080B7DB4
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	adds r0, r4, #0
	bl sub_080B7FCC
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7DA8: .4byte 0x04000008
_080B7DAC: .4byte 0x08535AFC
_080B7DB0: .4byte 0x05000200
_080B7DB4: .4byte 0x08535CFC
	thumb_func_end sub_080B7D50

	thumb_func_start sub_080B7DB8
sub_080B7DB8: @ 0x080B7DB8
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x12]
	subs r0, #0x10
	strh r0, [r3, #0x12]
	ldrh r6, [r3, #0xa]
	ldrh r2, [r3, #0xc]
	movs r7, #0xff
	lsrs r1, r6, #8
	subs r1, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r2, #8
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r7, #0
	ands r0, r2
	adds r5, r0, #2
	lsrs r2, r1, #0x10
	cmp r1, #0
	bge _080B7DE4
	movs r2, #0
_080B7DE4:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	bgt _080B7DEE
	movs r4, #0x28
_080B7DEE:
	cmp r5, #0x78
	ble _080B7DF4
	movs r5, #0x78
_080B7DF4:
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #8
	adds r0, r7, #0
	ands r0, r6
	orrs r1, r0
	strh r1, [r3, #0xa]
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #8
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	cmp r2, #0
	bne _080B7E34
	cmp r4, #0x28
	bne _080B7E34
	cmp r1, #0x78
	bne _080B7E34
	ldr r2, _080B7E3C
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _080B7E40
	str r1, [r0]
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_080B7E34:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7E3C: .4byte 0x020205AC
_080B7E40: .4byte 0x080B8419
	thumb_func_end sub_080B7DB8

	thumb_func_start sub_080B7E44
sub_080B7E44: @ 0x080B7E44
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x12]
	subs r0, #0x10
	strh r0, [r3, #0x12]
	ldr r2, _080B7E70
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x3c
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080B7E6A
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_080B7E6A:
	pop {r0}
	bx r0
	.align 2, 0
_080B7E70: .4byte 0x020205AC
	thumb_func_end sub_080B7E44

	thumb_func_start sub_080B7E74
sub_080B7E74: @ 0x080B7E74
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x12]
	subs r0, #0x10
	strh r0, [r3, #0x12]
	ldrh r2, [r3, #0xc]
	lsls r1, r2, #0x10
	movs r0, #0xff
	asrs r1, r1, #0x18
	adds r1, #6
	lsls r1, r1, #0x10
	ands r0, r2
	subs r0, #6
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x50
	ble _080B7E9C
	movs r4, #0x50
_080B7E9C:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	bgt _080B7EA6
	movs r2, #0x51
_080B7EA6:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	orrs r1, r2
	strh r1, [r3, #0xc]
	cmp r0, #0x50
	bne _080B7EC2
	cmp r2, #0x51
	bne _080B7EC2
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
_080B7EC2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080B7E74

	thumb_func_start sub_080B7EC8
sub_080B7EC8: @ 0x080B7EC8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080B7F08
	ldrh r1, [r0]
	lsrs r1, r1, #8
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	ldr r2, _080B7F0C
	mov r0, sp
	bl CpuSet
	movs r0, #0xf1
	strh r0, [r4, #0xa]
	movs r0, #0xa1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x1e]
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7F08: .4byte 0x04000008
_080B7F0C: .4byte 0x05000200
	thumb_func_end sub_080B7EC8

	thumb_func_start overworld_bg_setup_2
overworld_bg_setup_2: @ 0x080B7F10
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl SetVBlankCallback
	bl sub_08196DF4
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7F5C
	adds r0, r0, r1
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FreeResourcesAndDestroySprite
	movs r0, #6
	bl FieldEffectActiveListRemove
	ldr r0, _080B7F60
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7F5C: .4byte 0x020205AC
_080B7F60: .4byte 0x080B7CAD
	thumb_func_end overworld_bg_setup_2

	thumb_func_start sub_080B7F64
sub_080B7F64: @ 0x080B7F64
	push {r4, lr}
	sub sp, #4
	ldr r0, _080B7FC4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _080B7FC8
	adds r4, r4, r0
	adds r0, r4, #0
	adds r0, #0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	thumb_func_end sub_080B7F64

	thumb_func_start sub_080B7F8C
sub_080B7F8C: @ 0x080B7F8C
	ldrh r1, [r4, #0xa]
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4, #0xc]
	movs r0, #0x44
	bl SetGpuReg
	ldrh r1, [r4, #0xe]
	movs r0, #0x48
	bl SetGpuReg
	ldrh r1, [r4, #0x10]
	movs r0, #0x4a
	bl SetGpuReg
	ldrh r1, [r4, #0x12]
	movs r0, #0x10
	bl SetGpuReg
	ldrh r1, [r4, #0x14]
	movs r0, #0x12
	bl SetGpuReg
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7FC4: .4byte 0x080B7CAD
_080B7FC8: .4byte 0x03005B60
	thumb_func_end sub_080B7F8C

	thumb_func_start sub_080B7FCC
sub_080B7FCC: @ 0x080B7FCC
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080B8000
	adds r2, r0, r1
	movs r1, #0
	ldr r5, _080B8004
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r4, r0, #0
	ldr r3, _080B8008
_080B7FE2:
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	orrs r0, r4
	strh r0, [r2]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, #2
	cmp r1, r3
	bls _080B7FE2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8000: .4byte 0x06000140
_080B8004: .4byte 0x08535D1C
_080B8008: .4byte 0x0000013F
	thumb_func_end sub_080B7FCC

	thumb_func_start sub_080B800C
sub_080B800C: @ 0x080B800C
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B8034
	ldr r2, _080B8038
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B8034: .4byte 0x08537170
_080B8038: .4byte 0x03005B60
	thumb_func_end sub_080B800C

	thumb_func_start sub_080B803C
sub_080B803C: @ 0x080B803C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0xa]
	movs r0, #0x10
	bl SetGpuReg
	ldrh r1, [r4, #0xc]
	movs r0, #0x12
	bl SetGpuReg
	adds r0, r4, #0
	adds r0, #0x22
	ldr r1, _080B8070
	ldr r1, [r1, #0xc]
	bl StoreWordInTwoHalfwords
	ldr r0, _080B8074
	bl SetVBlankCallback
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8070: .4byte 0x03002360
_080B8074: .4byte 0x080B8239
	thumb_func_end sub_080B803C

	thumb_func_start sub_080B8078
sub_080B8078: @ 0x080B8078
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080B80D4
	ldrh r1, [r0]
	lsrs r1, r1, #2
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x10
	ldrh r4, [r0]
	lsrs r4, r4, #8
	lsls r4, r4, #0x1b
	lsrs r4, r4, #0x10
	movs r0, #0
	mov r8, r0
	strh r4, [r6, #0x20]
	ldr r0, _080B80D8
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	movs r2, #0x40
	bl CpuSet
	mov r0, r8
	str r0, [sp]
	adds r4, r4, r5
	ldr r2, _080B80DC
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r0, _080B80E0
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B80D4: .4byte 0x04000008
_080B80D8: .4byte 0x08535F9C
_080B80DC: .4byte 0x05000200
_080B80E0: .4byte 0x0853601C
	thumb_func_end sub_080B8078

	thumb_func_start sub_080B80E4
sub_080B80E4: @ 0x080B80E4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080B8290
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B811C
	movs r0, #0x42
	movs r1, #0xf0
	bl SetGpuReg
	ldr r1, _080B8128
	movs r0, #0x46
	bl SetGpuReg
	ldr r2, _080B812C
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _080B8130
	str r1, [r0]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B811C:
	adds r0, r4, #0
	bl sub_080B8280
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8128: .4byte 0x00002878
_080B812C: .4byte 0x020205AC
_080B8130: .4byte 0x080B8419
	thumb_func_end sub_080B80E4

	thumb_func_start sub_080B8134
sub_080B8134: @ 0x080B8134
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080B8280
	ldr r2, _080B8160
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x3c
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080B8158
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B8158:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8160: .4byte 0x020205AC
	thumb_func_end sub_080B8134

	thumb_func_start sub_080B8164
sub_080B8164: @ 0x080B8164
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080B8280
	ldrh r1, [r4, #0xa]
	movs r0, #7
	ands r0, r1
	movs r1, #0
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	ldr r5, _080B8198
	movs r0, #0x42
	adds r1, r5, #0
	bl SetGpuReg
	movs r0, #0x46
	adds r1, r5, #0
	bl SetGpuReg
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8198: .4byte 0x0000FFFF
	thumb_func_end sub_080B8164

	thumb_func_start sub_080B819C
sub_080B819C: @ 0x080B819C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080B8280
	adds r0, r4, #0
	bl sub_080B8348
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B81B6
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B81B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080B819C

	thumb_func_start sub_080B81BC
sub_080B81BC: @ 0x080B81BC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _080B8228
	ldrh r1, [r0]
	lsrs r1, r1, #8
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	ldr r2, _080B822C
	mov r0, sp
	bl CpuSet
	adds r0, r4, #0
	adds r0, #0x22
	add r1, sp, #4
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp, #4]
	bl SetVBlankCallback
	bl sub_08196DF4
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B8230
	adds r0, r0, r1
	ldrh r1, [r4, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FreeResourcesAndDestroySprite
	movs r0, #6
	bl FieldEffectActiveListRemove
	ldr r0, _080B8234
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8228: .4byte 0x04000008
_080B822C: .4byte 0x05000200
_080B8230: .4byte 0x020205AC
_080B8234: .4byte 0x080B800D
	thumb_func_end sub_080B81BC

	thumb_func_start sub_080B8238
sub_080B8238: @ 0x080B8238
	push {r4, lr}
	sub sp, #4
	ldr r0, _080B8278
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _080B827C
	adds r4, r4, r0
	adds r0, r4, #0
	adds r0, #0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	thumb_func_end sub_080B8238

	thumb_func_start sub_080B8260
sub_080B8260: @ 0x080B8260
	ldrh r1, [r4, #0xa]
	movs r0, #0x10
	bl SetGpuReg
	ldrh r1, [r4, #0xc]
	movs r0, #0x12
	bl SetGpuReg
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8278: .4byte 0x080B800D
_080B827C: .4byte 0x03005B60
	thumb_func_end sub_080B8260

	thumb_func_start sub_080B8280
sub_080B8280: @ 0x080B8280
	ldrh r1, [r0, #0xa]
	subs r1, #0x10
	strh r1, [r0, #0xa]
	ldrh r1, [r0, #0xe]
	adds r1, #0x10
	strh r1, [r0, #0xe]
	bx lr
	.align 2, 0
	thumb_func_end sub_080B8280

	thumb_func_start sub_080B8290
sub_080B8290: @ 0x080B8290
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldrh r2, [r5, #0x10]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r0, #0x1f
	ble _080B82AC
	movs r0, #1
	b _080B8330
_080B82AC:
	ldrh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x13
	movs r1, #0x1f
	ands r3, r1
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	cmp r3, r0
	blt _080B832E
	movs r0, #0x20
	subs r3, r0, r3
	ands r3, r1
	subs r0, r0, r2
	mov ip, r0
	mov r7, ip
	ands r7, r1
	mov ip, r7
	ldrh r0, [r5, #0x20]
	ldr r1, _080B8340
	adds r1, r1, r0
	mov r8, r1
	movs r4, #0
	ldr r7, _080B8344
	mov sl, r7
	movs r0, #0xf0
	lsls r0, r0, #8
	mov sb, r0
	adds r1, r3, #1
	movs r0, #0x1f
	ands r1, r0
	str r1, [sp]
	mov r6, ip
	adds r6, #1
	ands r6, r0
_080B82F0:
	lsls r1, r4, #5
	adds r2, r1, r3
	lsls r2, r2, #1
	add r2, r8
	mov r7, ip
	adds r0, r7, r1
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	mov r7, sb
	orrs r0, r7
	strh r0, [r2]
	ldr r0, [sp]
	adds r2, r1, r0
	lsls r2, r2, #1
	add r2, r8
	adds r1, r6, r1
	lsls r1, r1, #1
	add r1, sl
	ldrh r0, [r1]
	mov r1, sb
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #9
	bls _080B82F0
	ldrh r0, [r5, #0x10]
	adds r0, #2
	strh r0, [r5, #0x10]
_080B832E:
	movs r0, #0
_080B8330:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B8340: .4byte 0x06000140
_080B8344: .4byte 0x0853603C
	thumb_func_end sub_080B8290

	thumb_func_start sub_080B8348
sub_080B8348: @ 0x080B8348
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r0, #0x1f
	ble _080B8358
	movs r0, #1
	b _080B83AC
_080B8358:
	ldrh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r2, r0
	blt _080B83AA
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x13
	movs r0, #0x1f
	ands r2, r0
	ldrh r0, [r5, #0x20]
	ldr r1, _080B83B4
	adds r6, r0, r1
	movs r3, #0
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r7, r0, #0
	adds r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
_080B8388:
	lsls r0, r3, #5
	adds r1, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r6
	strh r7, [r1]
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r7, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #9
	bls _080B8388
	ldrh r0, [r5, #0x10]
	adds r0, #2
	strh r0, [r5, #0x10]
_080B83AA:
	movs r0, #0
_080B83AC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B83B4: .4byte 0x06000140
	thumb_func_end sub_080B8348

	thumb_func_start sub_080B83B8
sub_080B83B8: @ 0x080B83B8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0x80
	lsls r5, r5, #0x18
	ands r5, r6
	lsrs r5, r5, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080B840C
	ands r6, r0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0xa0
	lsls r3, r3, #1
	movs r4, #0x50
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl CreateMonSprite_FieldMove
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r1, _080B8410
	adds r2, r2, r1
	ldr r1, _080B8414
	str r1, [r2, #0x1c]
	ldrb r3, [r2, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	strb r1, [r2, #5]
	strh r6, [r2, #0x2e]
	strh r5, [r2, #0x3a]
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B840C: .4byte 0x7FFFFFFF
_080B8410: .4byte 0x020205AC
_080B8414: .4byte 0x08007141
	thumb_func_end sub_080B83B8

	thumb_func_start sub_080B8418
sub_080B8418: @ 0x080B8418
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x20]
	subs r0, #0x14
	strh r0, [r1, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	bgt _080B8458
	movs r0, #0x78
	strh r0, [r1, #0x20]
	movs r0, #0x1e
	strh r0, [r1, #0x30]
	ldr r0, _080B844C
	str r0, [r1, #0x1c]
	movs r2, #0x3a
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080B8450
	ldrh r0, [r1, #0x2e]
	movs r1, #0
	movs r2, #0x7d
	movs r3, #0xa
	bl PlayCry2
	b _080B8458
	.align 2, 0
_080B844C: .4byte 0x080B845D
_080B8450:
	ldrh r0, [r1, #0x2e]
	movs r1, #0
	bl PlayCry1
_080B8458:
	pop {r0}
	bx r0
	thumb_func_end sub_080B8418

	thumb_func_start sub_080B845C
sub_080B845C: @ 0x080B845C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	subs r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B8470
	ldr r0, _080B8474
	str r0, [r1, #0x1c]
_080B8470:
	pop {r0}
	bx r0
	.align 2, 0
_080B8474: .4byte 0x080B8479
	thumb_func_end sub_080B845C

	thumb_func_start sub_080B8478
sub_080B8478: @ 0x080B8478
	push {lr}
	adds r2, r0, #0
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080B8490
	movs r0, #1
	strh r0, [r2, #0x3c]
	b _080B8496
_080B8490:
	adds r0, r3, #0
	subs r0, #0x14
	strh r0, [r2, #0x20]
_080B8496:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B8478

	thumb_func_start FldEff_UseSurf
FldEff_UseSurf: @ 0x080B849C
	push {lr}
	ldr r0, _080B84CC
	movs r1, #0xff
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B84D0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _080B84D4
	ldr r0, [r0]
	strh r0, [r1, #0x26]
	bl Overworld_ClearSavedMusic
	ldr r0, _080B84D8
	bl Overworld_ChangeMusicTo
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B84CC: .4byte 0x080B84DD
_080B84D0: .4byte 0x03005B60
_080B84D4: .4byte 0x020388A8
_080B84D8: .4byte 0x0000016D
	thumb_func_end FldEff_UseSurf

	thumb_func_start sub_080B84DC
sub_080B84DC: @ 0x080B84DC
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B8504
	ldr r2, _080B8508
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B8504: .4byte 0x0853718C
_080B8508: .4byte 0x03005B60
	thumb_func_end sub_080B84DC

	thumb_func_start sub_080B850C
sub_080B850C: @ 0x080B850C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	ldr r5, _080B8564
	movs r0, #1
	strb r0, [r5, #6]
	movs r0, #8
	bl SetPlayerAvatarStateMask
	adds r6, r4, #0
	adds r6, #0xa
	movs r0, #0xc
	adds r0, r0, r4
	mov r8, r0
	adds r0, r6, #0
	mov r1, r8
	bl PlayerGetDestCoords
	ldr r2, _080B8568
	ldrb r1, [r5, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x18]
	lsrs r0, r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl MoveCoords
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8564: .4byte 0x02037230
_080B8568: .4byte 0x02036FF0
	thumb_func_end sub_080B850C

	thumb_func_start sub_080B856C
sub_080B856C: @ 0x080B856C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080B85B0
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B85B4
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8596
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B85A8
_080B8596:
	bl sub_0808BA78
	adds r0, r4, #0
	movs r1, #0x39
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080B85A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B85B0: .4byte 0x02037230
_080B85B4: .4byte 0x02036FF0
	thumb_func_end sub_080B856C

	thumb_func_start sub_080B85B8
sub_080B85B8: @ 0x080B85B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B85F4
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B85F8
	adds r0, r0, r1
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B85EE
	ldr r2, _080B85FC
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2]
	movs r0, #0x3b
	bl FieldEffectStart
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B85EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B85F4: .4byte 0x02037230
_080B85F8: .4byte 0x02036FF0
_080B85FC: .4byte 0x020388A8
	thumb_func_end sub_080B85B8

	thumb_func_start sub_080B8600
sub_080B8600: @ 0x080B8600
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #6
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B866A
	ldr r5, _080B8670
	ldrb r0, [r5, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B8674
	adds r4, r4, r0
	movs r0, #3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092EB0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldr r1, _080B8678
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	str r0, [r1]
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	str r0, [r1, #4]
	ldrb r0, [r5, #5]
	str r0, [r1, #8]
	movs r0, #8
	bl FieldEffectStart
	strb r0, [r4, #0x1a]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
_080B866A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8670: .4byte 0x02037230
_080B8674: .4byte 0x02036FF0
_080B8678: .4byte 0x020388A8
	thumb_func_end sub_080B8600

	thumb_func_start sub_080B867C
sub_080B867C: @ 0x080B867C
	push {r4, r5, lr}
	ldr r5, _080B86E4
	ldrb r1, [r5, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B86E8
	adds r4, r0, r1
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B86DC
	movs r0, #0
	strb r0, [r5, #6]
	ldrb r1, [r5]
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldrb r0, [r4, #0x1a]
	movs r1, #1
	bl sub_081554E8
	bl UnfreezeEventObjects
	bl ScriptContext2_Disable
	movs r0, #9
	bl FieldEffectActiveListRemove
	ldr r0, _080B86EC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B86DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B86E4: .4byte 0x02037230
_080B86E8: .4byte 0x02036FF0
_080B86EC: .4byte 0x080B84DD
	thumb_func_end sub_080B867C

	thumb_func_start sub_080B86F0
sub_080B86F0: @ 0x080B86F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080B87F4
	adds r0, #0x90
	ldr r0, [r0]
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r1, #0x78
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r0, #4
	add r1, r8
	lsls r1, r1, #2
	ldr r0, _080B87F8
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	movs r2, #0xf
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r1, #5]
	movs r2, #0
	strh r2, [r1, #0x2e]
	strh r2, [r1, #0x30]
	strh r2, [r1, #0x32]
	ldr r0, _080B87FC
	strh r0, [r1, #0x34]
	ldrh r0, [r1, #0x22]
	strh r0, [r1, #0x36]
	strh r2, [r1, #0x38]
	ldr r1, _080B8800
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _080B8804
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, _080B8808
	movs r0, #0x48
	bl SetGpuReg
	ldr r0, _080B880C
	movs r1, #0xc0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0x12
	movs r1, #0x78
	bl SetGpuReg
	movs r4, #3
	ldr r7, _080B8810
	ldr r0, _080B8814
	adds r6, r0, #0
_080B8772:
	movs r2, #0xc
	lsls r0, r4, #1
	lsls r5, r4, #5
	adds r0, r0, r4
	lsls r3, r0, #1
_080B877C:
	adds r0, r5, r2
	lsls r0, r0, #1
	adds r0, r0, r7
	adds r1, r2, r6
	adds r1, r3, r1
	adds r1, #1
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x11
	bls _080B877C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xe
	bls _080B8772
	movs r0, #0
	ldr r5, _080B8818
_080B87A2:
	movs r4, #0
	adds r7, r0, #1
	lsls r6, r0, #5
_080B87A8:
	lsls r1, r4, #2
	adds r1, r6, r1
	ldr r0, _080B881C
	adds r3, r1, r0
	adds r0, r1, #1
	adds r0, r0, r5
	ldrb r2, [r0]
	lsls r2, r2, #8
	adds r0, r1, r5
	ldrb r0, [r0]
	adds r0, r0, r2
	strh r0, [r3]
	ldr r0, _080B8820
	adds r3, r1, r0
	adds r0, r1, #3
	adds r0, r0, r5
	ldrb r2, [r0]
	lsls r2, r2, #8
	adds r1, #2
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, r0, r2
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _080B87A8
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x59
	bls _080B87A2
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B87F4: .4byte 0x084DDE4C
_080B87F8: .4byte 0x020205AC
_080B87FC: .4byte 0x0000FFFF
_080B8800: .4byte 0x00003E41
_080B8804: .4byte 0x00000E0E
_080B8808: .4byte 0x00003F3F
_080B880C: .4byte 0x085362BC
_080B8810: .4byte 0x0600F800
_080B8814: .4byte 0x0000BFF4
_080B8818: .4byte 0x085362DC
_080B881C: .4byte 0x06008020
_080B8820: .4byte 0x06008022
	thumb_func_end sub_080B86F0

	thumb_func_start FldEff_NPCFlyOut
FldEff_NPCFlyOut: @ 0x080B8824
	push {r4, lr}
	ldr r0, _080B8870
	ldr r0, [r0, #0x68]
	movs r1, #0x78
	movs r2, #0
	movs r3, #1
	bl CreateSprite
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r4, #4
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r0, _080B8874
	adds r2, r2, r0
	ldrb r1, [r2, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r0, _080B8878
	str r0, [r2, #0x1c]
	ldr r0, _080B887C
	ldr r0, [r0]
	strh r0, [r2, #0x30]
	movs r0, #0x9e
	bl PlaySE
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B8870: .4byte 0x084DDE4C
_080B8874: .4byte 0x020205AC
_080B8878: .4byte 0x080B8881
_080B887C: .4byte 0x020388A8
	thumb_func_end FldEff_NPCFlyOut

	thumb_func_start sub_080B8880
sub_080B8880: @ 0x080B8880
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0x8c
	bl Cos
	movs r5, #0
	strh r0, [r4, #0x24]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0x48
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #4
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x32]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080B88E2
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080B88F8
	adds r1, r1, r0
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, #0x24]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	subs r0, #8
	strh r0, [r1, #0x22]
	strh r5, [r1, #0x24]
	strh r5, [r1, #0x26]
_080B88E2:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	ble _080B88F2
	adds r0, r4, #0
	movs r1, #0x1e
	bl FieldEffectStop
_080B88F2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B88F8: .4byte 0x020205AC
	thumb_func_end sub_080B8880

	thumb_func_start FldEff_UseFly
FldEff_UseFly: @ 0x080B88FC
	push {lr}
	ldr r0, _080B8920
	movs r1, #0xfe
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B8924
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _080B8928
	ldr r0, [r0]
	strh r0, [r1, #0xa]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B8920: .4byte 0x080B892D
_080B8924: .4byte 0x03005B60
_080B8928: .4byte 0x020388A8
	thumb_func_end FldEff_UseFly

	thumb_func_start sub_080B892C
sub_080B892C: @ 0x080B892C
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B8954
	ldr r2, _080B8958
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B8954: .4byte 0x085371A0
_080B8958: .4byte 0x03005B60
	thumb_func_end sub_080B892C

	thumb_func_start sub_080B895C
sub_080B895C: @ 0x080B895C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080B89AC
	ldrb r1, [r6, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B89B0
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8986
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B89A4
_080B8986:
	ldrb r0, [r6]
	strh r0, [r5, #0x26]
	movs r0, #1
	strb r0, [r6, #6]
	bl SetPlayerAvatarStateMask
	bl sub_0808BA78
	adds r0, r4, #0
	movs r1, #0x39
	bl EventObjectSetHeldMovement
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080B89A4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B89AC: .4byte 0x02037230
_080B89B0: .4byte 0x02036FF0
	thumb_func_end sub_080B895C

	thumb_func_start sub_080B89B4
sub_080B89B4: @ 0x080B89B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B89EC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B89F0
	adds r0, r0, r1
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B89E4
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldr r1, _080B89F4
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, #0x3b
	bl FieldEffectStart
_080B89E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B89EC: .4byte 0x02037230
_080B89F0: .4byte 0x02036FF0
_080B89F4: .4byte 0x020388A8
	thumb_func_end sub_080B89B4

	thumb_func_start sub_080B89F8
sub_080B89F8: @ 0x080B89F8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B8A40
	ldr r0, _080B8A48
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B8A4C
	adds r5, r0, r1
	ldrh r1, [r4, #0x26]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080B8A30
	ldrb r0, [r5, #0x1a]
	movs r1, #2
	bl sub_081554E8
	ldrb r0, [r5, #0x1a]
	movs r1, #0
	bl sub_08155514
_080B8A30:
	bl sub_080B8C1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B8A40:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A48: .4byte 0x02037230
_080B8A4C: .4byte 0x02036FF0
	thumb_func_end sub_080B89F8

	thumb_func_start sub_080B8A50
sub_080B8A50: @ 0x080B8A50
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xa]
	bl sub_080B8C60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8A84
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0x10
	strh r0, [r4, #0xc]
	movs r0, #1
	bl SetPlayerAvatarTransitionFlags
	ldr r0, _080B8A8C
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B8A90
	adds r0, r0, r1
	movs r1, #2
	bl EventObjectSetHeldMovement
_080B8A84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A8C: .4byte 0x02037230
_080B8A90: .4byte 0x02036FF0
	thumb_func_end sub_080B8A50

	thumb_func_start sub_080B8A94
sub_080B8A94: @ 0x080B8A94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B8AE0
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B8AE4
	adds r2, r0, r1
	ldrh r1, [r4, #0xc]
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080B8ABA
	subs r0, r1, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B8AD8
_080B8ABA:
	adds r0, r2, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8AD8
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0x9e
	bl PlaySE
	ldrb r0, [r4, #0xa]
	bl sub_080B8C7C
_080B8AD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8AE0: .4byte 0x02037230
_080B8AE4: .4byte 0x02036FF0
	thumb_func_end sub_080B8A94

	thumb_func_start sub_080B8AE8
sub_080B8AE8: @ 0x080B8AE8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xc]
	adds r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080B8B5E
	ldr r0, _080B8B64
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B8B68
	adds r4, r0, r1
	movs r0, #3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r6, _080B8B6C
	adds r0, r0, r6
	movs r1, #0x16
	bl StartSpriteAnim
	ldrb r0, [r4, #1]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r4, #0
	movs r1, #0x48
	bl EventObjectSetHeldMovement
	ldrh r1, [r5, #0x26]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080B8B54
	ldrb r1, [r4, #0x1a]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
_080B8B54:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xc]
_080B8B5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8B64: .4byte 0x02037230
_080B8B68: .4byte 0x02036FF0
_080B8B6C: .4byte 0x020205AC
	thumb_func_end sub_080B8AE8

	thumb_func_start sub_080B8B70
sub_080B8B70: @ 0x080B8B70
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xc]
	adds r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _080B8BBC
	ldr r0, _080B8BC4
	ldrb r0, [r0, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B8BC8
	adds r4, r4, r0
	adds r0, r4, #0
	bl EventObjectClearHeldMovementIfActive
	ldrb r1, [r4, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4, #2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #2]
	ldrb r0, [r5, #0xa]
	ldrb r1, [r4, #4]
	bl sub_080B8CB8
	bl CameraObjectReset2
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080B8BBC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8BC4: .4byte 0x02037230
_080B8BC8: .4byte 0x02036FF0
	thumb_func_end sub_080B8B70

	thumb_func_start sub_080B8BCC
sub_080B8BCC: @ 0x080B8BCC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xa]
	bl sub_080B8C60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8BE6
	bl WarpFadeScreen
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B8BE6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080B8BCC

	thumb_func_start sub_080B8BEC
sub_080B8BEC: @ 0x080B8BEC
	push {lr}
	ldr r0, _080B8C14
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B8C0E
	movs r0, #0x1f
	bl FieldEffectActiveListRemove
	ldr r0, _080B8C18
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B8C0E:
	pop {r0}
	bx r0
	.align 2, 0
_080B8C14: .4byte 0x02037C74
_080B8C18: .4byte 0x080B892D
	thumb_func_end sub_080B8BEC

	thumb_func_start sub_080B8C1C
sub_080B8C1C: @ 0x080B8C1C
	push {lr}
	ldr r0, _080B8C54
	ldr r0, [r0, #0x68]
	movs r1, #0xff
	movs r2, #0xb4
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r1, _080B8C58
	adds r2, r2, r1
	ldrb r3, [r2, #5]
	movs r1, #0xf
	ands r1, r3
	movs r3, #0xd
	rsbs r3, r3, #0
	ands r1, r3
	movs r3, #4
	orrs r1, r3
	strb r1, [r2, #5]
	ldr r1, _080B8C5C
	str r1, [r2, #0x1c]
	pop {r1}
	bx r1
	.align 2, 0
_080B8C54: .4byte 0x084DDE4C
_080B8C58: .4byte 0x020205AC
_080B8C5C: .4byte 0x080B8CD5
	thumb_func_end sub_080B8C1C

	thumb_func_start sub_080B8C60
sub_080B8C60: @ 0x080B8C60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B8C78
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080B8C78: .4byte 0x020205AC
	thumb_func_end sub_080B8C60

	thumb_func_start sub_080B8C7C
sub_080B8C7C: @ 0x080B8C7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B8CB0
	adds r4, r4, r0
	ldr r0, _080B8CB4
	str r0, [r4, #0x1c]
	movs r1, #0
	movs r0, #0x78
	strh r0, [r4, #0x20]
	strh r1, [r4, #0x22]
	strh r1, [r4, #0x24]
	strh r1, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0x2e
	movs r2, #0x10
	bl memset
	movs r0, #0x40
	strh r0, [r4, #0x3a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8CB0: .4byte 0x020205AC
_080B8CB4: .4byte 0x080B8D95
	thumb_func_end sub_080B8C7C

	thumb_func_start sub_080B8CB8
sub_080B8CB8: @ 0x080B8CB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B8CD0
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	strh r1, [r2, #0x3a]
	bx lr
	.align 2, 0
_080B8CD0: .4byte 0x020205AC
	thumb_func_end sub_080B8CB8

	thumb_func_start sub_080B8CD4
sub_080B8CD4: @ 0x080B8CD4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B8D80
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B8D18
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, _080B8D88
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	movs r0, #0x76
	strh r0, [r4, #0x20]
	ldr r0, _080B8D8C
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0x40
	strh r0, [r4, #0x30]
	adds r0, #0xc0
	strh r0, [r4, #0x32]
_080B8D18:
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x30]
	adds r0, r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x78
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x78
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r2, [r4, #0x32]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	ldr r0, _080B8D90
	cmp r1, r0
	bgt _080B8D4E
	adds r0, r2, #0
	adds r0, #0x60
	strh r0, [r4, #0x32]
_080B8D4E:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x81
	ble _080B8D80
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r1, [r4, #1]
	lsrs r1, r1, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	adds r0, r4, #0
	movs r3, #0
	bl CalcCenterToCornerVec
_080B8D80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8D88: .4byte 0x085371F4
_080B8D8C: .4byte 0x0000FFD0
_080B8D90: .4byte 0x000007FF
	thumb_func_end sub_080B8CD4

	thumb_func_start sub_080B8D94
sub_080B8D94: @ 0x080B8D94
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0x8c
	bl Cos
	movs r5, #0
	strh r0, [r4, #0x24]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0x48
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #4
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x32]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	beq _080B8DF2
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080B8E04
	adds r1, r1, r0
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, #0x24]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	subs r0, #8
	strh r0, [r1, #0x22]
	strh r5, [r1, #0x24]
	strh r5, [r1, #0x26]
_080B8DF2:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	ble _080B8DFE
	movs r0, #1
	strh r0, [r4, #0x3c]
_080B8DFE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8E04: .4byte 0x020205AC
	thumb_func_end sub_080B8D94

	thumb_func_start sub_080B8E08
sub_080B8E08: @ 0x080B8E08
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B8EDC
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _080B8E52
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, _080B8EE4
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	movs r0, #0x5e
	strh r0, [r4, #0x20]
	ldr r0, _080B8EE8
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0xf0
	strh r0, [r4, #0x30]
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	movs r0, #0x80
	strh r0, [r4, #0x36]
_080B8E52:
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r2, [r4, #0x30]
	adds r2, r2, r1
	ldrh r0, [r4, #0x34]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	movs r0, #0xff
	ands r2, r0
	strh r2, [r4, #0x30]
	movs r3, #0x30
	ldrsh r0, [r4, r3]
	movs r1, #0x20
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x78
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	ble _080B8E94
	ldrh r0, [r4, #0x36]
	subs r0, r1, r0
	strh r0, [r4, #0x32]
_080B8E94:
	ldrh r1, [r4, #0x36]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	cmp r0, #0xff
	bgt _080B8EA4
	adds r0, r1, #0
	adds r0, #0x18
	strh r0, [r4, #0x36]
_080B8EA4:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0xff
	bgt _080B8EAE
	strh r2, [r4, #0x32]
_080B8EAE:
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0x3b
	ble _080B8EDC
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_080B8EDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8EE4: .4byte 0x085371F4
_080B8EE8: .4byte 0x0000FFE0
	thumb_func_end sub_080B8E08

	thumb_func_start sub_080B8EEC
sub_080B8EEC: @ 0x080B8EEC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_080B8C7C
	ldr r1, _080B8F10
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _080B8F14
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F10: .4byte 0x020205AC
_080B8F14: .4byte 0x080B8E09
	thumb_func_end sub_080B8EEC

	thumb_func_start sub_080B8F18
sub_080B8F18: @ 0x080B8F18
	push {lr}
	ldr r0, _080B8F28
	movs r1, #0xfe
	bl CreateTask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080B8F28: .4byte 0x080B8F2D
	thumb_func_end sub_080B8F18

	thumb_func_start sub_080B8F2C
sub_080B8F2C: @ 0x080B8F2C
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080B8F54
	ldr r2, _080B8F58
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B8F54: .4byte 0x085371FC
_080B8F58: .4byte 0x03005B60
	thumb_func_end sub_080B8F2C

	thumb_func_start sub_080B8F5C
sub_080B8F5C: @ 0x080B8F5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080B9004
	ldrb r1, [r6, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B9008
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8F86
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8FFE
_080B8F86:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	movs r0, #0x11
	strh r0, [r5, #0xc]
	ldrb r0, [r6]
	strh r0, [r5, #0x26]
	movs r0, #1
	strb r0, [r6, #6]
	bl SetPlayerAvatarStateMask
	ldrh r1, [r5, #0x26]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080B8FAE
	ldrb r0, [r4, #0x1a]
	movs r1, #0
	bl sub_081554E8
_080B8FAE:
	movs r0, #3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	bl CameraObjectReset2
	adds r0, r4, #0
	movs r1, #3
	bl EventObjectTurn
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B900C
	adds r0, r0, r1
	movs r1, #0x16
	bl StartSpriteAnim
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	bl sub_080B8C1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	bl sub_080B8C7C
	ldrb r0, [r5, #0xa]
	ldrb r1, [r4, #4]
	bl sub_080B8CB8
_080B8FFE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9004: .4byte 0x02037230
_080B9008: .4byte 0x02036FF0
_080B900C: .4byte 0x020205AC
	thumb_func_end sub_080B8F5C

	thumb_func_start sub_080B9010
sub_080B9010: @ 0x080B9010
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0xc]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _080B9028
	subs r0, r1, #1
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B9068
_080B9028:
	ldr r0, _080B9070
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B9074
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B9078
	adds r4, r4, r0
	ldrb r0, [r5, #0xa]
	movs r1, #0x40
	bl sub_080B8CB8
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	strh r1, [r4, #0x24]
	strh r1, [r4, #0x26]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	strh r1, [r5, #0xc]
_080B9068:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9070: .4byte 0x02037230
_080B9074: .4byte 0x02036FF0
_080B9078: .4byte 0x020205AC
	thumb_func_end sub_080B9010

	thumb_func_start sub_080B907C
sub_080B907C: @ 0x080B907C
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	ldr r1, _080B90C4
	mov r0, sp
	movs r2, #0x24
	bl memcpy
	ldr r0, _080B90C8
	ldrb r0, [r0, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080B90CC
	adds r1, r1, r0
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, #0x26]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	ble _080B90BA
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080B90BA:
	add sp, #0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B90C4: .4byte 0x08537218
_080B90C8: .4byte 0x02037230
_080B90CC: .4byte 0x020205AC
	thumb_func_end sub_080B907C

	thumb_func_start sub_080B90D0
sub_080B90D0: @ 0x080B90D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrb r0, [r6, #0xa]
	bl sub_080B8C60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9134
	ldr r0, _080B913C
	ldrb r0, [r0, #5]
	lsls r5, r0, #3
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r0, _080B9140
	adds r5, r5, r0
	ldrb r0, [r5, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B9144
	adds r4, r4, r0
	ldrb r1, [r5, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	movs r0, #0x12
	ldrsh r2, [r5, r0]
	adds r0, r5, #0
	bl MoveEventObjectToMapCoords
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	bl sub_0808BA78
	adds r0, r5, #0
	movs r1, #0x39
	bl EventObjectSetHeldMovement
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
_080B9134:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B913C: .4byte 0x02037230
_080B9140: .4byte 0x02036FF0
_080B9144: .4byte 0x020205AC
	thumb_func_end sub_080B90D0

	thumb_func_start sub_080B9148
sub_080B9148: @ 0x080B9148
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B9178
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B917C
	adds r0, r0, r1
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9170
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	bl sub_080B8EEC
_080B9170:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9178: .4byte 0x02037230
_080B917C: .4byte 0x02036FF0
	thumb_func_end sub_080B9148

	thumb_func_start sub_080B9180
sub_080B9180: @ 0x080B9180
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xa]
	bl sub_080B8C60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B91AC
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B91B4
	adds r0, r0, r1
	bl DestroySprite
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0x10
	strh r0, [r4, #0xa]
_080B91AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B91B4: .4byte 0x020205AC
	thumb_func_end sub_080B9180

	thumb_func_start sub_080B91B8
sub_080B91B8: @ 0x080B91B8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	subs r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B9222
	ldr r6, _080B9228
	ldrb r1, [r6, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B922C
	adds r4, r0, r1
	movs r7, #0
	ldrh r1, [r5, #0x26]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080B91EC
	movs r7, #3
	ldrb r0, [r4, #0x1a]
	movs r1, #1
	bl sub_081554E8
_080B91EC:
	adds r0, r7, #0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	adds r0, r4, #0
	movs r1, #1
	bl EventObjectTurn
	ldrh r0, [r5, #0x26]
	strb r0, [r6]
	movs r0, #0
	strb r0, [r6, #6]
	movs r0, #0x20
	bl FieldEffectActiveListRemove
	ldr r0, _080B9230
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080B9222:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9228: .4byte 0x02037230
_080B922C: .4byte 0x02036FF0
_080B9230: .4byte 0x080B8F2D
	thumb_func_end sub_080B91B8

	thumb_func_start sub_080B9234
sub_080B9234: @ 0x080B9234
	push {r4, lr}
	sub sp, #4
	ldr r4, _080B9278
	ldrb r0, [r4]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #8]
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9284
	ldr r0, _080B927C
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B9280
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r1, #0xc]
	ldr r0, [r4]
	strh r0, [r1, #0x14]
	ldr r0, [r4, #4]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #8]
	strh r0, [r1, #0x18]
	b _080B928A
	.align 2, 0
_080B9278: .4byte 0x020388A8
_080B927C: .4byte 0x080B9341
_080B9280: .4byte 0x03005B60
_080B9284:
	movs r0, #0x41
	bl FieldEffectActiveListRemove
_080B928A:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080B9234

	thumb_func_start sub_080B9294
sub_080B9294: @ 0x080B9294
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080B92CC
	adds r4, r0, r1
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080B92D0
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _080B92D4
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080B92D4
	subs r0, r1, #1
	b _080B92D2
	.align 2, 0
_080B92CC: .4byte 0x03005B68
_080B92D0:
	movs r0, #4
_080B92D2:
	strh r0, [r4, #0xa]
_080B92D4:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _080B930E
	movs r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B9304
	ldrh r1, [r4, #0xa]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	bl SetCameraPanning
	b _080B930E
_080B9304:
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0
	bl SetCameraPanning
_080B930E:
	bl UpdateCameraPanning
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B9320
	adds r0, r5, #0
	bl DestroyTask
_080B9320:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080B9294

	thumb_func_start sub_080B9328
sub_080B9328: @ 0x080B9328
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080B933C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1, #0x16]
	bx lr
	.align 2, 0
_080B933C: .4byte 0x03005B60
	thumb_func_end sub_080B9328

	thumb_func_start sub_080B9340
sub_080B9340: @ 0x080B9340
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _080B9378
	adds r4, r4, r0
	bl InstallCameraPanAheadCallback
	movs r0, #0
	bl SetCameraPanningCallback
	ldr r1, _080B937C
	movs r2, #2
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	thumb_func_end sub_080B9340

	thumb_func_start sub_080B9370
sub_080B9370: @ 0x080B9370
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9378: .4byte 0x03005B68
_080B937C: .4byte 0x0853723C
	thumb_func_end sub_080B9370

	thumb_func_start sub_080B9380
sub_080B9380: @ 0x080B9380
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080B93A8
	movs r1, #0x5a
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x58
	bl PlaySE
	strh r4, [r5, #0xa]
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B93A8: .4byte 0x080B9295
	thumb_func_end sub_080B9380

	thumb_func_start sub_080B93AC
sub_080B93AC: @ 0x080B93AC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #6]
	adds r0, #1
	strh r0, [r7, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble _080B941A
	ldr r2, _080B9424
	movs r1, #4
	ldrsh r0, [r7, r1]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B9428
	adds r4, r4, r0
	ldrb r0, [r1, #1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r6, _080B942C
	ldr r5, _080B9430
	adds r0, r6, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	adds r0, r4, #0
	bl sub_080B947C
	movs r0, #0x57
	bl PlaySE
	ldrb r0, [r7, #0xa]
	bl sub_080B9328
	movs r0, #0
	strh r0, [r7, #6]
	ldrh r0, [r7, #2]
	adds r0, #1
	strh r0, [r7, #2]
_080B941A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9424: .4byte 0x02036FF0
_080B9428: .4byte 0x020205AC
_080B942C: .4byte 0x0000FFFF
_080B9430: .4byte 0x00007FFF
	thumb_func_end sub_080B93AC

	thumb_func_start sub_080B9434
sub_080B9434: @ 0x080B9434
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080B9474
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B946E
	ldr r0, _080B9478
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B946E
	bl InstallCameraPanAheadCallback
	ldrb r0, [r4, #0xc]
	ldrb r1, [r4, #0xe]
	ldrb r2, [r4, #0x10]
	bl RemoveEventObjectByLocalIdAndMap
	movs r0, #0x41
	bl FieldEffectActiveListRemove
	adds r0, r5, #0
	bl DestroyTask
_080B946E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9474: .4byte 0x02037C74
_080B9478: .4byte 0x080B9295
	thumb_func_end sub_080B9434

	thumb_func_start sub_080B947C
sub_080B947C: @ 0x080B947C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _080B9500
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r3, #0x20
	ldrsh r0, [r6, r3]
	adds r2, r2, r0
	movs r1, #0x24
	ldrsh r0, [r6, r1]
	adds r2, r2, r0
	ldr r0, _080B9504
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r3, #0x22
	ldrsh r1, [r6, r3]
	adds r0, r0, r1
	movs r3, #0x26
	ldrsh r1, [r6, r3]
	adds r0, r0, r1
	subs r0, #4
	movs r5, #0
	lsls r2, r2, #0x10
	mov r8, r2
	lsls r7, r0, #0x10
_080B94B2:
	ldr r0, _080B9508
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r7, #0x10
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080B94EE
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B950C
	adds r4, r4, r0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	strh r5, [r4, #0x2e]
	ldrb r1, [r6, #5]
	lsrs r1, r1, #4
	lsls r1, r1, #4
	ldrb r2, [r4, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
_080B94EE:
	adds r5, #1
	cmp r5, #3
	ble _080B94B2
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9500: .4byte 0x03005B4C
_080B9504: .4byte 0x03005B48
_080B9508: .4byte 0x08537298
_080B950C: .4byte 0x020205AC
	thumb_func_end sub_080B947C

	thumb_func_start Fldeff_MoveDeoxysRock
Fldeff_MoveDeoxysRock: @ 0x080B9510
	push {lr}
	adds r1, r0, #0
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #1
	beq _080B953C
	cmp r0, #1
	bgt _080B9526
	cmp r0, #0
	beq _080B9530
	b _080B955A
_080B9526:
	cmp r0, #2
	beq _080B9548
	cmp r0, #3
	beq _080B954E
	b _080B955A
_080B9530:
	ldrh r0, [r1, #0x20]
	subs r0, #0x10
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x22]
	subs r0, #0xc
	b _080B9558
_080B953C:
	ldrh r0, [r1, #0x20]
	adds r0, #0x10
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x22]
	subs r0, #0xc
	b _080B9558
_080B9548:
	ldrh r0, [r1, #0x20]
	subs r0, #0x10
	b _080B9552
_080B954E:
	ldrh r0, [r1, #0x20]
	adds r0, #0x10
_080B9552:
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x22]
	adds r0, #0xc
_080B9558:
	strh r0, [r1, #0x22]
_080B955A:
	ldrh r0, [r1, #0x20]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf8
	bhi _080B9576
	movs r0, #0x22
	ldrsh r2, [r1, r0]
	movs r0, #4
	rsbs r0, r0, #0
	cmp r2, r0
	blt _080B9576
	cmp r2, #0xa4
	ble _080B957C
_080B9576:
	adds r0, r1, #0
	bl DestroySprite
_080B957C:
	pop {r0}
	bx r0
	thumb_func_end Fldeff_MoveDeoxysRock

	thumb_func_start Fldeff_MoveDeoxysRock_Step
Fldeff_MoveDeoxysRock_Step: @ 0x080B9580
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r7, _080B9620
	ldrb r0, [r7]
	ldrb r1, [r7, #4]
	ldrb r2, [r7, #8]
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9616
	mov r0, sp
	ldrb r0, [r0]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B9624
	adds r4, r4, r0
	movs r0, #0x10
	ldrsh r5, [r4, r0]
	subs r5, #7
	movs r0, #0x12
	ldrsh r6, [r4, r0]
	subs r6, #7
	ldr r1, [r7, #0xc]
	subs r5, r1, r5
	lsls r5, r5, #4
	ldr r2, [r7, #0x10]
	subs r6, r2, r6
	lsls r6, r6, #4
	adds r1, #7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, #7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl ShiftEventObjectCoords
	ldr r0, _080B9628
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B962C
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r1
	ldrb r0, [r4, #4]
	strh r0, [r2, #0xa]
	ldr r3, _080B9630
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x20]
	adds r0, r0, r5
	strh r0, [r2, #0xc]
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x22]
	adds r0, r0, r6
	strh r0, [r2, #0xe]
	ldr r0, [r7, #0x14]
	strh r0, [r2, #0x18]
	mov r0, sp
	ldrb r0, [r0]
	strh r0, [r2, #0x1a]
_080B9616:
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B9620: .4byte 0x020388A8
_080B9624: .4byte 0x02036FF0
_080B9628: .4byte 0x080B9635
_080B962C: .4byte 0x03005B60
_080B9630: .4byte 0x020205AC
	thumb_func_end Fldeff_MoveDeoxysRock_Step

	thumb_func_start sub_080B9634
sub_080B9634: @ 0x080B9634
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	ldr r1, _080B9660
	adds r5, r0, r1
	movs r0, #2
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B9664
	adds r6, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080B9668
	cmp r0, #1
	beq _080B96A6
	b _080B9704
	.align 2, 0
_080B9660: .4byte 0x03005B68
_080B9664: .4byte 0x020205AC
_080B9668:
	ldrh r0, [r6, #0x20]
	lsls r0, r0, #4
	strh r0, [r5, #8]
	ldrh r0, [r6, #0x22]
	lsls r0, r0, #4
	strh r0, [r5, #0xa]
	movs r2, #4
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	movs r2, #8
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x10
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, #0xc]
	movs r1, #6
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	movs r2, #0xa
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x10
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, #0xe]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_080B96A6:
	ldrh r1, [r5, #0x10]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _080B96D4
	subs r0, r1, #1
	strh r0, [r5, #0x10]
	ldrh r1, [r5, #0xc]
	ldrh r0, [r5, #8]
	adds r1, r1, r0
	strh r1, [r5, #8]
	ldrh r0, [r5, #0xe]
	ldrh r2, [r5, #0xa]
	adds r0, r0, r2
	strh r0, [r5, #0xa]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r6, #0x20]
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r6, #0x22]
	b _080B9704
_080B96D4:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080B970C
	adds r4, r4, r0
	ldrh r0, [r5, #4]
	strh r0, [r6, #0x20]
	ldrh r0, [r5, #6]
	strh r0, [r6, #0x22]
	adds r0, r4, #0
	bl ShiftStillEventObjectCoords
	ldrb r0, [r4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0x42
	bl FieldEffectActiveListRemove
	adds r0, r7, #0
	bl DestroyTask
_080B9704:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B970C: .4byte 0x02036FF0
	thumb_func_end sub_080B9634

