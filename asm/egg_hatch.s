.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CreatedHatchedMon
CreatedHatchedMon: @ 0x08070D68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x3c]
	movs r4, #0
	add r7, sp, #0x18
	add r0, sp, #0x30
	mov sb, r0
	movs r1, #0x31
	add r1, sp
	mov sl, r1
	mov r0, sp
	adds r0, #0x32
	str r0, [sp, #0x40]
	mov r1, sp
	adds r1, #0x34
	str r1, [sp, #0x48]
	adds r0, #1
	str r0, [sp, #0x44]
	adds r1, #4
	str r1, [sp, #0x4c]
_08070DA6:
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r5, #0
	bl GetMonData
	lsls r1, r4, #1
	add r1, sp
	adds r1, #0x10
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08070DA6
	adds r0, r5, #0
	movs r1, #0
	bl GetMonData
	mov r8, r0
	movs r4, #0
_08070DCE:
	adds r1, r4, #0
	adds r1, #0x27
	adds r0, r5, #0
	bl GetMonData
	lsls r1, r4, #2
	adds r1, r7, r1
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _08070DCE
	adds r0, r5, #0
	movs r1, #3
	bl GetMonData
	mov r1, sb
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0x25
	bl GetMonData
	mov r1, sl
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #8
	bl GetMonData
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0x22
	bl GetMonData
	str r0, [sp, #0x38]
	adds r0, r5, #0
	movs r1, #0x50
	bl GetMonData
	ldr r1, [sp, #0x48]
	strb r0, [r1]
	movs r0, #1
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r6, #0
	ldr r1, [sp, #0x3c]
	movs r2, #5
	movs r3, #0x20
	bl CreateMon
	movs r4, #0
_08070E3E:
	adds r1, r4, #0
	adds r1, #0xd
	lsls r0, r4, #1
	mov r2, sp
	adds r2, r2, r0
	adds r2, #0x10
	adds r0, r6, #0
	bl SetMonData
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08070E3E
	movs r4, #0
_08070E5C:
	adds r1, r4, #0
	adds r1, #0x27
	lsls r2, r4, #2
	adds r2, r7, r2
	adds r0, r6, #0
	bl SetMonData
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _08070E5C
	adds r0, r6, #0
	movs r1, #3
	mov r2, sb
	bl SetMonData
	adds r0, r6, #0
	movs r1, #0x25
	mov r2, sl
	bl SetMonData
	adds r0, r6, #0
	movs r1, #8
	ldr r2, [sp, #0x40]
	bl SetMonData
	movs r0, #0x78
	ldr r1, [sp, #0x44]
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0x20
	ldr r2, [sp, #0x44]
	bl SetMonData
	adds r0, r6, #0
	movs r1, #0x22
	ldr r2, [sp, #0x4c]
	bl SetMonData
	adds r0, r6, #0
	movs r1, #0x50
	ldr r2, [sp, #0x48]
	bl SetMonData
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x64
	bl memcpy
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end CreatedHatchedMon

	thumb_func_start AddHatchedMonToParty
AddHatchedMonToParty: @ 0x08070ED0
	push {r4, r5, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r4, sp, #0xc
	movs r1, #0x46
	strb r1, [r4]
	movs r1, #0x64
	adds r5, r0, #0
	muls r5, r1, r5
	ldr r0, _08070F84
	adds r5, r5, r0
	ldr r1, _08070F88
	adds r0, r5, #0
	bl CreatedHatchedMon
	adds r0, r5, #0
	movs r1, #0x2d
	adds r2, r4, #0
	bl SetMonData
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sp
	adds r1, r4, #0
	bl GetSpeciesName
	adds r0, r5, #0
	movs r1, #2
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	bl HoennToNationalOrder
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl GetSetPokedexFlag
	adds r0, r4, #0
	movs r1, #3
	bl GetSetPokedexFlag
	ldr r1, _08070F8C
	adds r0, r5, #0
	bl GetBoxMonNick
	mov r2, sp
	adds r2, #0xe
	movs r0, #4
	strh r0, [r2]
	adds r0, r5, #0
	movs r1, #0x26
	bl SetMonData
	add r2, sp, #0x10
	movs r0, #0
	strh r0, [r2]
	adds r0, r5, #0
	movs r1, #0x24
	bl SetMonData
	bl GetCurrentRegionMapSectionId
	mov r2, sp
	adds r2, #0x12
	strb r0, [r2]
	adds r0, r5, #0
	movs r1, #0x23
	bl SetMonData
	adds r0, r5, #0
	bl GiveMonInitialMoveset
	adds r0, r5, #0
	bl CalculateMonStats
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070F84: .4byte 0x02024190
_08070F88: .4byte 0x020243E8
_08070F8C: .4byte 0x02021C40
	thumb_func_end AddHatchedMonToParty

	thumb_func_start ScriptHatchMon
ScriptHatchMon: @ 0x08070F90
	push {lr}
	ldr r0, _08070FA0
	ldrb r0, [r0]
	bl AddHatchedMonToParty
	pop {r0}
	bx r0
	.align 2, 0
_08070FA0: .4byte 0x02037280
	thumb_func_end ScriptHatchMon

	thumb_func_start sub_08070FA4
sub_08070FA4: @ 0x08070FA4
	push {r4, r5, lr}
	sub sp, #0x20
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x8c
	muls r1, r2, r1
	adds r4, r0, r1
	adds r0, r4, #0
	mov r1, sp
	bl GetMonNick
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	beq _08071010
	adds r5, r4, #0
	adds r5, #0x7c
	mov r0, sp
	adds r1, r5, #0
	bl StringCompare
	adds r4, #0x74
	cmp r0, #0
	bne _08070FE4
	ldr r0, _08071000
	ldr r0, [r0]
	adds r1, r4, #0
	bl StringCompare
	cmp r0, #0
	beq _08071010
_08070FE4:
	ldr r0, _08071004
	mov r1, sp
	bl StringCopy
	ldr r0, _08071008
	adds r1, r4, #0
	bl StringCopy
	ldr r0, _0807100C
	adds r1, r5, #0
	bl StringCopy
	movs r0, #1
	b _08071012
	.align 2, 0
_08071000: .4byte 0x03005AF0
_08071004: .4byte 0x02021C40
_08071008: .4byte 0x02021C54
_0807100C: .4byte 0x02021C68
_08071010:
	movs r0, #0
_08071012:
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08070FA4

	thumb_func_start sub_0807101C
sub_0807101C: @ 0x0807101C
	push {lr}
	ldr r0, _08071038
	ldr r0, [r0]
	ldr r1, _0807103C
	adds r0, r0, r1
	ldr r1, _08071040
	ldrb r1, [r1]
	bl sub_08070FA4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08071038: .4byte 0x03005AEC
_0807103C: .4byte 0x00003030
_08071040: .4byte 0x02037280
	thumb_func_end sub_0807101C

	thumb_func_start EggHatchCreateMonSprite
EggHatchCreateMonSprite: @ 0x08071044
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r8, r3
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r1, r2, #0x18
	adds r2, r1, #0
	movs r4, #0
	movs r7, #0
	movs r5, #0
	cmp r3, #0
	bne _08071072
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0807108C
	adds r5, r1, r0
	movs r4, #1
_08071072:
	cmp r3, #1
	bne _08071082
	movs r0, #0x64
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r0, _0807108C
	adds r5, r1, r0
	movs r4, #3
_08071082:
	cmp r6, #0
	beq _08071090
	cmp r6, #1
	beq _080710E0
	b _0807111A
	.align 2, 0
_0807108C: .4byte 0x02024190
_08071090:
	adds r0, r5, #0
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0
	bl GetMonData
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _080710D8
	adds r0, r0, r1
	ldr r1, _080710DC
	ldr r2, [r1]
	mov r6, r8
	lsls r1, r6, #1
	adds r1, #1
	lsls r1, r1, #2
	adds r2, #4
	adds r2, r2, r1
	ldr r1, [r2]
	adds r2, r4, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
	adds r0, r5, #0
	bl GetMonSpritePalStruct
	bl LoadCompressedSpritePalette
	mov r0, sb
	strh r4, [r0]
	b _0807111A
	.align 2, 0
_080710D8: .4byte 0x082DDA1C
_080710DC: .4byte 0x02024178
_080710E0:
	adds r0, r5, #0
	bl GetMonSpritePalStruct
	ldrh r0, [r0, #4]
	adds r1, r4, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _08071128
	movs r1, #0x78
	movs r2, #0x4b
	movs r3, #6
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _0807112C
	lsls r1, r7, #4
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r2, r1, r4
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r3, #4
	orrs r0, r3
	strb r0, [r2]
	adds r4, #0x1c
	adds r1, r1, r4
	ldr r0, _08071130
	str r0, [r1]
_0807111A:
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08071128: .4byte 0x02024640
_0807112C: .4byte 0x020205AC
_08071130: .4byte 0x08007141
	thumb_func_end EggHatchCreateMonSprite

	thumb_func_start VBlankCB_EggHatch
VBlankCB_EggHatch: @ 0x08071134
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_EggHatch

	thumb_func_start EggHatch
EggHatch: @ 0x08071148
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _08071164
	movs r1, #0xa
	bl CreateTask
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	pop {r0}
	bx r0
	.align 2, 0
_08071164: .4byte 0x08071169
	thumb_func_end EggHatch

	thumb_func_start Task_EggHatch
Task_EggHatch: @ 0x08071168
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08071198
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08071190
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0807119C
	bl SetMainCallback2
	ldr r1, _080711A0
	ldr r0, _080711A4
	str r0, [r1]
	adds r0, r4, #0
	bl DestroyTask
_08071190:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071198: .4byte 0x02037C74
_0807119C: .4byte 0x080711A9
_080711A0: .4byte 0x03005B0C
_080711A4: .4byte 0x080AEA65
	thumb_func_end Task_EggHatch

	thumb_func_start CB2_EggHatch_0
CB2_EggHatch_0: @ 0x080711A8
	push {r4, lr}
	sub sp, #4
	ldr r0, _080711C8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	bls _080711BC
	b _080713DA
_080711BC:
	lsls r0, r0, #2
	ldr r1, _080711CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080711C8: .4byte 0x03002360
_080711CC: .4byte 0x080711D0
_080711D0: @ jump table
	.4byte _080711F4 @ case 0
	.4byte _080712C0 @ case 1
	.4byte _080712D8 @ case 2
	.4byte _08071308 @ case 3
	.4byte _08071328 @ case 4
	.4byte _08071340 @ case 5
	.4byte _08071358 @ case 6
	.4byte _08071374 @ case 7
	.4byte _080713CC @ case 8
_080711F4:
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	ldr r4, _080712AC
	movs r0, #0x14
	bl Alloc
	str r0, [r4]
	bl AllocateMonSpritesGfx
	ldr r2, [r4]
	ldr r0, _080712B0
	ldrh r0, [r0]
	movs r1, #0
	strb r0, [r2, #4]
	ldr r0, [r4]
	strb r1, [r0, #7]
	ldr r0, _080712B4
	bl SetVBlankCallback
	bl GetCurrentMapMusic
	ldr r1, _080712B8
	strh r0, [r1]
	bl reset_temp_tile_data_buffers
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080712BC
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #7
	movs r2, #2
	bl SetBgAttribute
	movs r0, #0x80
	lsls r0, r0, #5
	bl Alloc
	adds r1, r0, #0
	movs r0, #1
	bl SetBgTilemapBuffer
	movs r0, #0x80
	lsls r0, r0, #6
	bl Alloc
	adds r1, r0, #0
	movs r0, #0
	bl SetBgTilemapBuffer
	bl DeactivateAllTextPrinters
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	bl ResetSpriteData
	bl ResetTasks
	bl ScanlineEffect_Stop
	bl m4aSoundVSyncOn
	b _080713AA
	.align 2, 0
_080712AC: .4byte 0x03000DE0
_080712B0: .4byte 0x02037280
_080712B4: .4byte 0x08071135
_080712B8: .4byte 0x02037282
_080712BC: .4byte 0x082FCA5C
_080712C0:
	ldr r0, _080712D0
	bl InitWindows
	ldr r0, _080712D4
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #8]
	b _080713AA
	.align 2, 0
_080712D0: .4byte 0x082FCA64
_080712D4: .4byte 0x03000DE0
_080712D8:
	movs r1, #0x8c
	lsls r1, r1, #0x14
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _08071300
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r0, _08071304
	movs r1, #0
	movs r2, #0x20
	bl LoadCompressedPalette
	b _080713AA
	.align 2, 0
_08071300: .4byte 0x08C00530
_08071304: .4byte 0x08C004EC
_08071308:
	ldr r0, _0807131C
	bl LoadSpriteSheet
	ldr r0, _08071320
	bl LoadSpriteSheet
	ldr r0, _08071324
	bl LoadSpritePalette
	b _080713AA
	.align 2, 0
_0807131C: .4byte 0x082FC9DC
_08071320: .4byte 0x082FC9E4
_08071324: .4byte 0x082FC9EC
_08071328:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _0807133C
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl AddHatchedMonToParty
	b _080713AA
	.align 2, 0
_0807133C: .4byte 0x03000DE0
_08071340:
	ldr r0, _08071354
	ldr r3, [r0]
	ldrb r2, [r3, #4]
	adds r3, #0xc
	movs r0, #0
	movs r1, #0
	bl EggHatchCreateMonSprite
	b _080713AA
	.align 2, 0
_08071354: .4byte 0x03000DE0
_08071358:
	ldr r4, _08071370
	ldr r3, [r4]
	ldrb r2, [r3, #4]
	adds r3, #0xc
	movs r0, #0
	movs r1, #1
	bl EggHatchCreateMonSprite
	ldr r1, [r4]
	strb r0, [r1, #1]
	b _080713AA
	.align 2, 0
_08071370: .4byte 0x03000DE0
_08071374:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _080713BC
	movs r1, #0x10
	movs r2, #0xa0
	bl LoadPalette
	ldr r1, _080713C0
	movs r2, #0x98
	lsls r2, r2, #5
	movs r0, #1
	movs r3, #0
	bl LoadBgTiles
	ldr r1, _080713C4
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #1
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
_080713AA:
	ldr r1, _080713C8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080713DA
	.align 2, 0
_080713BC: .4byte 0x08305D24
_080713C0: .4byte 0x08305D84
_080713C4: .4byte 0x08304D04
_080713C8: .4byte 0x03002360
_080713CC:
	ldr r0, _080713F8
	bl SetMainCallback2
	ldr r0, _080713FC
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #2]
_080713DA:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080713F8: .4byte 0x08071499
_080713FC: .4byte 0x03000DE0
	thumb_func_end CB2_EggHatch_0

	thumb_func_start EggHatchSetMonNickname
EggHatchSetMonNickname: @ 0x08071400
	push {lr}
	ldr r0, _0807142C
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08071430
	adds r0, r0, r1
	ldr r2, _08071434
	movs r1, #2
	bl SetMonData
	bl FreeMonSpritesGfx
	ldr r0, _08071438
	ldr r0, [r0]
	bl Free
	ldr r0, _0807143C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0807142C: .4byte 0x02037280
_08071430: .4byte 0x02024190
_08071434: .4byte 0x02021C68
_08071438: .4byte 0x03000DE0
_0807143C: .4byte 0x08085A31
	thumb_func_end EggHatchSetMonNickname

	thumb_func_start Task_EggHatchPlayBGM
Task_EggHatchPlayBGM: @ 0x08071440
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08071490
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08071460
	bl StopMapMusic
	bl PlayRainStoppingSoundEffect
_08071460:
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08071470
	movs r0, #0xbc
	lsls r0, r0, #1
	bl PlayBGM
_08071470:
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0x3c
	ble _08071484
	ldr r0, _08071494
	bl PlayBGM
	adds r0, r5, #0
	bl DestroyTask
_08071484:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071490: .4byte 0x03005B60
_08071494: .4byte 0x00000179
	thumb_func_end Task_EggHatchPlayBGM

	thumb_func_start CB2_EggHatch_1
CB2_EggHatch_1: @ 0x08071498
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r1, _080714BC
	ldr r0, [r1]
	ldrb r0, [r0, #2]
	adds r5, r1, #0
	cmp r0, #0xc
	bls _080714B0
	b _08071816
_080714B0:
	lsls r0, r0, #2
	ldr r1, _080714C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080714BC: .4byte 0x03000DE0
_080714C0: .4byte 0x080714C4
_080714C4: @ jump table
	.4byte _080714F8 @ case 0
	.4byte _08071544 @ case 1
	.4byte _0807156C @ case 2
	.4byte _080715A4 @ case 3
	.4byte _080715FC @ case 4
	.4byte _08071628 @ case 5
	.4byte _0807168C @ case 6
	.4byte _0807169A @ case 7
	.4byte _080716A8 @ case 8
	.4byte _080716EC @ case 9
	.4byte _0807172C @ case 10
	.4byte _080717C4 @ case 11
	.4byte _080717E4 @ case 12
_080714F8:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _08071538
	movs r1, #0x78
	movs r2, #0x4b
	movs r3, #5
	bl CreateSprite
	ldr r4, _0807153C
	ldr r1, [r4]
	strb r0, [r1]
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	ldr r1, [r4]
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	ldr r0, _08071540
	movs r1, #5
	bl CreateTask
	b _08071816
	.align 2, 0
_08071538: .4byte 0x082FC9F4
_0807153C: .4byte 0x03000DE0
_08071540: .4byte 0x08071441
_08071544:
	ldr r0, _08071568
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08071556
	b _08071816
_08071556:
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	strb r4, [r0, #3]
	ldr r1, [r5]
	b _080717D8
	.align 2, 0
_08071568: .4byte 0x02037C74
_0807156C:
	ldr r1, [r5]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bhi _0807157E
	b _08071816
_0807157E:
	ldr r1, [r5]
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	ldr r2, _0807159C
	ldr r0, [r5]
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _080715A0
	str r1, [r0]
	b _08071816
	.align 2, 0
_0807159C: .4byte 0x020205AC
_080715A0: .4byte 0x08071845
_080715A4:
	ldr r4, _080715F0
	ldr r2, [r5]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080715F4
	cmp r1, r0
	beq _080715C0
	b _08071816
_080715C0:
	ldrb r1, [r2, #4]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080715F8
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r5]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	bl DoMonFrontSpriteAnimation
	ldr r1, [r5]
	b _080717D8
	.align 2, 0
_080715F0: .4byte 0x020205AC
_080715F4: .4byte 0x08007141
_080715F8: .4byte 0x02024190
_080715FC:
	ldr r2, _08071620
	ldr r3, [r5]
	ldrb r1, [r3, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08071624
	cmp r1, r0
	beq _08071616
	b _08071816
_08071616:
	ldrb r0, [r3, #2]
	adds r0, #1
	strb r0, [r3, #2]
	b _08071816
	.align 2, 0
_08071620: .4byte 0x020205AC
_08071624: .4byte 0x08007141
_08071628:
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08071678
	adds r0, r0, r1
	ldr r1, _0807167C
	bl GetBoxMonNick
	ldr r4, _08071680
	ldr r1, _08071684
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	movs r1, #0xff
	str r1, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #3
	bl EggHatchPrintMessage
	ldr r0, _08071688
	bl PlayFanfare
	ldr r1, [r5]
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	movs r1, #3
	bl CopyWindowToVram
	b _08071816
	.align 2, 0
_08071678: .4byte 0x02024190
_0807167C: .4byte 0x02021C40
_08071680: .4byte 0x02021C7C
_08071684: .4byte 0x085CC874
_08071688: .4byte 0x00000173
_0807168C:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08071698
	b _08071816
_08071698:
	b _080717D4
_0807169A:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080716A6
	b _08071816
_080716A6:
	b _080717D4
_080716A8:
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080716DC
	adds r0, r0, r1
	ldr r1, _080716E0
	bl GetBoxMonNick
	ldr r4, _080716E4
	ldr r1, _080716E8
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	movs r1, #1
	str r1, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl EggHatchPrintMessage
	ldr r1, [r5]
	b _080717D8
	.align 2, 0
_080716DC: .4byte 0x02024190
_080716E0: .4byte 0x02021C40
_080716E4: .4byte 0x02021C7C
_080716E8: .4byte 0x085CC888
_080716EC:
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080716FE
	b _08071816
_080716FE:
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	movs r4, #0xa0
	lsls r4, r4, #1
	adds r1, r4, #0
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	ldr r0, _08071728
	str r4, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl sub_08198C08
	ldr r1, [r5]
	b _080717D8
	.align 2, 0
_08071728: .4byte 0x082FCA74
_0807172C:
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0807174C
	cmp r1, #0
	bgt _08071746
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080717D4
	b _08071816
_08071746:
	cmp r1, #1
	beq _080717D4
	b _08071816
_0807174C:
	ldr r0, _080717B4
	mov r8, r0
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080717B8
	adds r0, r0, r5
	ldr r1, _080717BC
	mov sb, r1
	bl GetBoxMonNick
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	muls r0, r6, r0
	adds r0, r0, r5
	bl GetMonGender
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	ldr r0, _080717C0
	str r0, [sp, #4]
	movs r0, #3
	mov r1, sb
	adds r2, r7, #0
	adds r3, r4, #0
	bl DoNamingScreen
	b _08071816
	.align 2, 0
_080717B4: .4byte 0x03000DE0
_080717B8: .4byte 0x02024190
_080717BC: .4byte 0x02021C68
_080717C0: .4byte 0x08071401
_080717C4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_080717D4:
	ldr r0, _080717E0
	ldr r1, [r0]
_080717D8:
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	b _08071816
	.align 2, 0
_080717E0: .4byte 0x03000DE0
_080717E4:
	ldr r0, _08071838
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08071816
	bl FreeMonSpritesGfx
	ldr r4, _0807183C
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	bl RemoveWindow
	movs r0, #0
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	ldr r0, [r4]
	bl Free
	ldr r0, _08071840
	bl SetMainCallback2
_08071816:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071838: .4byte 0x02037C74
_0807183C: .4byte 0x03000DE0
_08071840: .4byte 0x08085A31
	thumb_func_end CB2_EggHatch_1

	thumb_func_start SpriteCB_Egg_0
SpriteCB_Egg_0: @ 0x08071844
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08071864
	ldr r0, _08071860
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x2e]
	b _08071894
	.align 2, 0
_08071860: .4byte 0x0807189D
_08071864:
	ldrh r0, [r4, #0x30]
	adds r0, #0x14
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #1
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	bne _08071894
	movs r0, #0x17
	bl PlaySE
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	bl CreateRandomEggShardSprite
_08071894:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_Egg_0

	thumb_func_start SpriteCB_Egg_1
SpriteCB_Egg_1: @ 0x0807189C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _080718F8
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _080718CC
	ldr r0, _080718C8
	str r0, [r4, #0x1c]
	strh r1, [r4, #0x2e]
	strh r1, [r4, #0x32]
	b _080718F8
	.align 2, 0
_080718C8: .4byte 0x08071901
_080718CC:
	ldrh r0, [r4, #0x30]
	adds r0, #0x14
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #2
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	bne _080718F8
	movs r0, #0x17
	bl PlaySE
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
_080718F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_Egg_1

	thumb_func_start SpriteCB_Egg_2
SpriteCB_Egg_2: @ 0x08071900
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _080719AE
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x26
	ble _0807196C
	ldr r0, _0807195C
	str r0, [r4, #0x1c]
	strh r5, [r4, #0x2e]
	ldr r4, _08071960
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08071964
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	ldr r3, _08071968
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r5, [r0, #0x24]
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r5, [r0, #0x26]
	b _080719AE
	.align 2, 0
_0807195C: .4byte 0x080719B5
_08071960: .4byte 0x03000DE0
_08071964: .4byte 0x02024190
_08071968: .4byte 0x020205AC
_0807196C:
	ldrh r0, [r4, #0x30]
	adds r0, #0x14
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #2
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	bne _080719A0
	movs r0, #0x17
	bl PlaySE
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnim
	bl CreateRandomEggShardSprite
	bl CreateRandomEggShardSprite
_080719A0:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x1e
	bne _080719AE
	movs r0, #0x17
	bl PlaySE
_080719AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_Egg_2

	thumb_func_start SpriteCB_Egg_3
SpriteCB_Egg_3: @ 0x080719B4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _080719CE
	ldr r0, _080719D4
	str r0, [r1, #0x1c]
	movs r0, #0
	strh r0, [r1, #0x2e]
_080719CE:
	pop {r0}
	bx r0
	.align 2, 0
_080719D4: .4byte 0x080719D9
	thumb_func_end SpriteCB_Egg_3

	thumb_func_start SpriteCB_Egg_4
SpriteCB_Egg_4: @ 0x080719D8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080719F8
	movs r1, #1
	rsbs r1, r1, #0
	ldr r0, _08071A4C
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_080719F8:
	ldrh r0, [r5, #0x2e]
	cmp r0, #3
	bhi _08071A14
	movs r4, #0
_08071A00:
	bl CreateRandomEggShardSprite
	lsls r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _08071A00
_08071A14:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	ldr r0, _08071A50
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08071A42
	movs r0, #0x71
	bl PlaySE
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08071A54
	str r0, [r5, #0x1c]
	strh r4, [r5, #0x2e]
_08071A42:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071A4C: .4byte 0x0000FFFF
_08071A50: .4byte 0x02037C74
_08071A54: .4byte 0x08071A59
	thumb_func_end SpriteCB_Egg_4

	thumb_func_start SpriteCB_Egg_5
SpriteCB_Egg_5: @ 0x08071A58
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08071A94
	ldr r4, _08071AE8
	ldr r3, _08071AEC
	ldr r0, [r3]
	ldrb r1, [r0, #1]
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
	ldr r0, [r3]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAffineAnim
_08071A94:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #8
	bne _08071AAE
	movs r1, #1
	rsbs r1, r1, #0
	ldr r0, _08071AF0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_08071AAE:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #9
	bgt _08071ACC
	ldr r2, _08071AE8
	ldr r0, _08071AEC
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	subs r1, #1
	strh r1, [r0, #0x22]
_08071ACC:
	ldrh r1, [r5, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0x28
	ble _08071ADA
	ldr r0, _08071AF4
	str r0, [r5, #0x1c]
_08071ADA:
	adds r0, r1, #1
	strh r0, [r5, #0x2e]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071AE8: .4byte 0x020205AC
_08071AEC: .4byte 0x03000DE0
_08071AF0: .4byte 0x0000FFFF
_08071AF4: .4byte 0x08007141
	thumb_func_end SpriteCB_Egg_5

	thumb_func_start SpriteCB_EggShard
SpriteCB_EggShard: @ 0x08071AF8
	push {r4, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	ldrh r1, [r2, #0x36]
	adds r0, r0, r1
	strh r0, [r2, #0x36]
	ldrh r1, [r2, #0x32]
	ldrh r3, [r2, #0x38]
	adds r0, r1, r3
	strh r0, [r2, #0x38]
	movs r4, #0x36
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _08071B16
	adds r0, #0xff
_08071B16:
	asrs r0, r0, #8
	strh r0, [r2, #0x24]
	movs r3, #0x38
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _08071B24
	adds r0, #0xff
_08071B24:
	asrs r0, r0, #8
	strh r0, [r2, #0x26]
	ldrh r0, [r2, #0x34]
	adds r3, r1, r0
	strh r3, [r2, #0x32]
	movs r4, #0x22
	ldrsh r1, [r2, r4]
	movs r4, #0x26
	ldrsh r0, [r2, r4]
	adds r0, r1, r0
	adds r1, #0x14
	cmp r0, r1
	ble _08071B4A
	lsls r0, r3, #0x10
	cmp r0, #0
	ble _08071B4A
	adds r0, r2, #0
	bl DestroySprite
_08071B4A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_EggShard

	thumb_func_start CreateRandomEggShardSprite
CreateRandomEggShardSprite: @ 0x08071B50
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r2, _08071B9C
	ldr r0, _08071BA0
	ldr r6, [r0]
	ldrb r3, [r6, #7]
	lsls r0, r3, #2
	adds r1, r0, r2
	ldrh r5, [r1]
	adds r2, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	adds r3, #1
	strb r3, [r6, #7]
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0x64
	str r0, [sp]
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r0, #0x78
	movs r1, #0x3c
	adds r2, r5, #0
	adds r3, r4, #0
	bl CreateEggShardSprite
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071B9C: .4byte 0x082FCA7C
_08071BA0: .4byte 0x03000DE0
	thumb_func_end CreateRandomEggShardSprite

	thumb_func_start CreateEggShardSprite
CreateEggShardSprite: @ 0x08071BA4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	mov sb, r0
	ldr r1, [sp, #0x20]
	mov sl, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08071C1C
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl CreateSprite
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08071C20
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r6, [r0, #0x30]
	mov r1, r8
	strh r1, [r0, #0x32]
	mov r1, sb
	strh r1, [r0, #0x34]
	mov r1, sl
	bl StartSpriteAnim
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071C1C: .4byte 0x082FCA44
_08071C20: .4byte 0x020205AC
	thumb_func_end CreateEggShardSprite

	thumb_func_start EggHatchPrintMessage
EggHatchPrintMessage: @ 0x08071C24
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x14
	adds r5, r0, #0
	mov sb, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x2c]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0xff
	bl FillWindowPixelBuffer
	ldr r3, _08071C98
	ldr r0, [r3]
	movs r2, #0
	strb r2, [r0, #0xe]
	ldr r1, [r3]
	movs r0, #5
	strb r0, [r1, #0xf]
	ldr r1, [r3]
	movs r0, #6
	strb r0, [r1, #0x10]
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r3]
	adds r0, #0xe
	str r0, [sp, #8]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp, #0xc]
	mov r0, sb
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	mov r3, r8
	bl AddTextPrinterParameterized4
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071C98: .4byte 0x03000DE0
	thumb_func_end EggHatchPrintMessage

	thumb_func_start GetEggStepsToSubtract
GetEggStepsToSubtract: @ 0x08071C9C
	push {r4, r5, r6, lr}
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	cmp r5, r6
	bhs _08071CE6
_08071CAC:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08071CD8
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _08071CDC
	adds r0, r4, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	beq _08071CD4
	cmp r0, #0x31
	bne _08071CDC
_08071CD4:
	movs r0, #2
	b _08071CE8
	.align 2, 0
_08071CD8: .4byte 0x02024190
_08071CDC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r6
	blo _08071CAC
_08071CE6:
	movs r0, #1
_08071CE8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetEggStepsToSubtract

	thumb_func_start sub_08071CF0
sub_08071CF0: @ 0x08071CF0
	push {r4, lr}
	bl CountStorageNonEggMons
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #6
	bl CountPartyAliveNonEggMonsExcept
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08071CF0

