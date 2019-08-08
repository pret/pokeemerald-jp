.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetDexPokemonPokenavFlags
SetDexPokemonPokenavFlags: @ 0x0809ECF4
	push {lr}
	ldr r0, _0809ED10
	bl FlagSet
	movs r0, #0x86
	lsls r0, r0, #4
	bl FlagSet
	ldr r0, _0809ED14
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0809ED10: .4byte 0x00000861
_0809ED14: .4byte 0x00000862
	thumb_func_end SetDexPokemonPokenavFlags

	thumb_func_start BuildStartMenuActions
BuildStartMenuActions: @ 0x0809ED18
	push {lr}
	ldr r0, _0809ED30
	movs r1, #0
	strb r1, [r0]
	bl IsUpdateLinkStateCBActive
	cmp r0, #1
	bne _0809ED34
	bl BuildLinkModeStartMenu
	b _0809ED84
	.align 2, 0
_0809ED30: .4byte 0x020372AF
_0809ED34:
	bl InUnionRoom
	cmp r0, #1
	bne _0809ED42
	bl BuildUnionRoomStartMenu
	b _0809ED84
_0809ED42:
	bl GetSafariZoneFlag
	cmp r0, #1
	bne _0809ED50
	bl BuildSafariZoneStartMenu
	b _0809ED84
_0809ED50:
	bl InBattlePike
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809ED60
	bl BuildBattlePikeStartMenu
	b _0809ED84
_0809ED60:
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809ED70
	bl BuildBattlePyramidStartMenu
	b _0809ED84
_0809ED70:
	bl InMultiBattleRoom
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809ED80
	bl BuildMultiBattleRoomStartMenu
	b _0809ED84
_0809ED80:
	bl BuildNormalStartMenu
_0809ED84:
	pop {r0}
	bx r0
	thumb_func_end BuildStartMenuActions

	thumb_func_start AddStartMenuAction
AddStartMenuAction: @ 0x0809ED88
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0809ED9C
	ldr r1, _0809EDA0
	bl AppendToList
	pop {r0}
	bx r0
	.align 2, 0
_0809ED9C: .4byte 0x020372B0
_0809EDA0: .4byte 0x020372AF
	thumb_func_end AddStartMenuAction

	thumb_func_start BuildNormalStartMenu
BuildNormalStartMenu: @ 0x0809EDA4
	push {lr}
	ldr r0, _0809EE08
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EDBA
	movs r0, #0
	bl AddStartMenuAction
_0809EDBA:
	movs r0, #0x86
	lsls r0, r0, #4
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EDD0
	movs r0, #1
	bl AddStartMenuAction
_0809EDD0:
	movs r0, #2
	bl AddStartMenuAction
	ldr r0, _0809EE0C
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EDEA
	movs r0, #3
	bl AddStartMenuAction
_0809EDEA:
	movs r0, #4
	bl AddStartMenuAction
	movs r0, #5
	bl AddStartMenuAction
	movs r0, #6
	bl AddStartMenuAction
	movs r0, #7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	.align 2, 0
_0809EE08: .4byte 0x00000861
_0809EE0C: .4byte 0x00000862
	thumb_func_end BuildNormalStartMenu

	thumb_func_start BuildSafariZoneStartMenu
BuildSafariZoneStartMenu: @ 0x0809EE10
	push {lr}
	movs r0, #8
	bl AddStartMenuAction
	movs r0, #0
	bl AddStartMenuAction
	movs r0, #1
	bl AddStartMenuAction
	movs r0, #2
	bl AddStartMenuAction
	movs r0, #4
	bl AddStartMenuAction
	movs r0, #6
	bl AddStartMenuAction
	movs r0, #7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	thumb_func_end BuildSafariZoneStartMenu

	thumb_func_start BuildLinkModeStartMenu
BuildLinkModeStartMenu: @ 0x0809EE40
	push {lr}
	movs r0, #1
	bl AddStartMenuAction
	movs r0, #2
	bl AddStartMenuAction
	ldr r0, _0809EE78
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EE62
	movs r0, #3
	bl AddStartMenuAction
_0809EE62:
	movs r0, #9
	bl AddStartMenuAction
	movs r0, #6
	bl AddStartMenuAction
	movs r0, #7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	.align 2, 0
_0809EE78: .4byte 0x00000862
	thumb_func_end BuildLinkModeStartMenu

	thumb_func_start BuildUnionRoomStartMenu
BuildUnionRoomStartMenu: @ 0x0809EE7C
	push {lr}
	movs r0, #1
	bl AddStartMenuAction
	movs r0, #2
	bl AddStartMenuAction
	ldr r0, _0809EEB4
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EE9E
	movs r0, #3
	bl AddStartMenuAction
_0809EE9E:
	movs r0, #4
	bl AddStartMenuAction
	movs r0, #6
	bl AddStartMenuAction
	movs r0, #7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	.align 2, 0
_0809EEB4: .4byte 0x00000862
	thumb_func_end BuildUnionRoomStartMenu

	thumb_func_start BuildBattlePikeStartMenu
BuildBattlePikeStartMenu: @ 0x0809EEB8
	push {lr}
	movs r0, #0
	bl AddStartMenuAction
	movs r0, #1
	bl AddStartMenuAction
	movs r0, #4
	bl AddStartMenuAction
	movs r0, #6
	bl AddStartMenuAction
	movs r0, #7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	thumb_func_end BuildBattlePikeStartMenu

	thumb_func_start BuildBattlePyramidStartMenu
BuildBattlePyramidStartMenu: @ 0x0809EEDC
	push {lr}
	movs r0, #1
	bl AddStartMenuAction
	movs r0, #0xc
	bl AddStartMenuAction
	movs r0, #4
	bl AddStartMenuAction
	movs r0, #0xa
	bl AddStartMenuAction
	movs r0, #0xb
	bl AddStartMenuAction
	movs r0, #6
	bl AddStartMenuAction
	movs r0, #7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	thumb_func_end BuildBattlePyramidStartMenu

	thumb_func_start BuildMultiBattleRoomStartMenu
BuildMultiBattleRoomStartMenu: @ 0x0809EF0C
	push {lr}
	movs r0, #1
	bl AddStartMenuAction
	movs r0, #4
	bl AddStartMenuAction
	movs r0, #6
	bl AddStartMenuAction
	movs r0, #7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BuildMultiBattleRoomStartMenu

	thumb_func_start ShowSafariBallsWindow
ShowSafariBallsWindow: @ 0x0809EF2C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0809EF88
	ldr r0, _0809EF8C
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r0, _0809EF90
	ldr r1, _0809EF94
	ldrb r1, [r1]
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r5, _0809EF98
	ldr r1, _0809EF9C
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldrb r0, [r4]
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809EF88: .4byte 0x020372AC
_0809EF8C: .4byte 0x084E8B94
_0809EF90: .4byte 0x02021C40
_0809EF94: .4byte 0x02039D18
_0809EF98: .4byte 0x02021C7C
_0809EF9C: .4byte 0x084E8B84
	thumb_func_end ShowSafariBallsWindow

	thumb_func_start ShowPyramidFloorWindow
ShowPyramidFloorWindow: @ 0x0809EFA0
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _0809EFB8
	ldr r0, [r0]
	ldr r1, _0809EFBC
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #7
	bne _0809EFC8
	ldr r4, _0809EFC0
	ldr r0, _0809EFC4
	b _0809EFCC
	.align 2, 0
_0809EFB8: .4byte 0x03005AF0
_0809EFBC: .4byte 0x00000CB2
_0809EFC0: .4byte 0x020372AD
_0809EFC4: .4byte 0x084E8C24
_0809EFC8:
	ldr r4, _0809F02C
	ldr r0, _0809F030
_0809EFCC:
	bl AddWindow
	strb r0, [r4]
	ldr r4, _0809F02C
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r0, _0809F034
	ldr r2, _0809F038
	ldr r1, _0809F03C
	ldr r1, [r1]
	ldr r3, _0809F040
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r5, _0809F044
	ldr r1, _0809F048
	adds r0, r5, #0
	bl StringExpandPlaceholders
	ldrb r0, [r4]
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F02C: .4byte 0x020372AD
_0809F030: .4byte 0x084E8C1C
_0809F034: .4byte 0x02021C40
_0809F038: .4byte 0x084E8BFC
_0809F03C: .4byte 0x03005AF0
_0809F040: .4byte 0x00000CB2
_0809F044: .4byte 0x02021C7C
_0809F048: .4byte 0x084E8B9C
	thumb_func_end ShowPyramidFloorWindow

	thumb_func_start RemoveExtraStartMenuWindows
RemoveExtraStartMenuWindows: @ 0x0809F04C
	push {r4, lr}
	bl GetSafariZoneFlag
	cmp r0, #0
	beq _0809F06E
	ldr r4, _0809F090
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	movs r1, #2
	bl CopyWindowToVram
	ldrb r0, [r4]
	bl RemoveWindow
_0809F06E:
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F088
	ldr r4, _0809F094
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	ldrb r0, [r4]
	bl RemoveWindow
_0809F088:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F090: .4byte 0x020372AC
_0809F094: .4byte 0x020372AD
	thumb_func_end RemoveExtraStartMenuWindows

	thumb_func_start PrintStartMenuActions
PrintStartMenuActions: @ 0x0809F098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	adds r6, r1, #0
	ldrb r2, [r0]
	ldr r0, _0809F0F0
	mov sb, r0
	ldr r1, _0809F0F4
	mov sl, r1
_0809F0B2:
	ldr r0, _0809F0F8
	lsls r2, r2, #0x18
	asrs r4, r2, #0x18
	adds r5, r4, r0
	ldrb r0, [r5]
	lsls r3, r0, #3
	mov r0, sb
	adds r0, #4
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _0809F0FC
	adds r7, r2, #0
	cmp r1, r0
	bne _0809F100
	bl GetStartMenuWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r5]
	lsls r1, r1, #3
	add r1, sb
	ldr r1, [r1]
	lsls r3, r4, #4
	adds r3, #0xa
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r2, #8
	bl PrintPlayerNameOnWindow
	b _0809F130
	.align 2, 0
_0809F0F0: .4byte 0x084E8C2C
_0809F0F4: .4byte 0x02021C7C
_0809F0F8: .4byte 0x020372B0
_0809F0FC: .4byte 0x0809F565
_0809F100:
	mov r1, sb
	adds r0, r3, r1
	ldr r1, [r0]
	mov r0, sl
	bl StringExpandPlaceholders
	bl GetStartMenuWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #4
	adds r1, #0xa
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	mov r2, sl
	movs r3, #8
	bl AddTextPrinterParameterized
_0809F130:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r7, r0
	lsrs r2, r1, #0x18
	asrs r1, r1, #0x18
	ldr r0, _0809F150
	ldrb r0, [r0]
	cmp r1, r0
	bge _0809F154
	subs r6, #1
	cmp r6, #0
	bne _0809F0B2
	mov r1, r8
	strb r2, [r1]
	movs r0, #0
	b _0809F15A
	.align 2, 0
_0809F150: .4byte 0x020372AF
_0809F154:
	mov r0, r8
	strb r2, [r0]
	movs r0, #1
_0809F15A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PrintStartMenuActions

	thumb_func_start InitStartMenuStep
InitStartMenuStep: @ 0x0809F16C
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0809F188
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r2, r0, #0
	cmp r1, #5
	bhi _0809F264
	lsls r0, r1, #2
	ldr r1, _0809F18C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809F188: .4byte 0x020372B9
_0809F18C: .4byte 0x0809F190
_0809F190: @ jump table
	.4byte _0809F1A8 @ case 0
	.4byte _0809F1B0 @ case 1
	.4byte _0809F1BC @ case 2
	.4byte _0809F1E4 @ case 3
	.4byte _0809F208 @ case 4
	.4byte _0809F224 @ case 5
_0809F1A8:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _0809F264
_0809F1B0:
	bl BuildStartMenuActions
	ldr r1, _0809F1B8
	b _0809F218
	.align 2, 0
_0809F1B8: .4byte 0x020372B9
_0809F1BC:
	bl sub_08196F98
	ldr r0, _0809F1DC
	ldrb r0, [r0]
	bl sub_081977C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r1, _0809F1E0
	movs r0, #0
	strb r0, [r1, #1]
	b _0809F218
	.align 2, 0
_0809F1DC: .4byte 0x020372AF
_0809F1E0: .4byte 0x020372B9
_0809F1E4:
	bl GetSafariZoneFlag
	cmp r0, #0
	beq _0809F1F0
	bl ShowSafariBallsWindow
_0809F1F0:
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F1FE
	bl ShowPyramidFloorWindow
_0809F1FE:
	ldr r1, _0809F204
	b _0809F218
	.align 2, 0
_0809F204: .4byte 0x020372B9
_0809F208:
	ldr r4, _0809F220
	adds r0, r4, #0
	movs r1, #2
	bl PrintStartMenuActions
	cmp r0, #0
	beq _0809F264
	subs r1, r4, #1
_0809F218:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0809F264
	.align 2, 0
_0809F220: .4byte 0x020372BA
_0809F224:
	bl GetStartMenuWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x10
	str r1, [sp]
	ldr r1, _0809F25C
	ldrb r1, [r1]
	str r1, [sp, #4]
	ldr r4, _0809F260
	ldrb r1, [r4]
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0
	movs r3, #0xa
	bl sub_081984B0
	strb r0, [r4]
	bl GetStartMenuWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl CopyWindowToVram
	movs r0, #1
	b _0809F266
	.align 2, 0
_0809F25C: .4byte 0x020372AF
_0809F260: .4byte 0x020372AE
_0809F264:
	movs r0, #0
_0809F266:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end InitStartMenuStep

	thumb_func_start InitStartMenu
InitStartMenu: @ 0x0809F270
	push {lr}
	ldr r1, _0809F288
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
_0809F27A:
	bl InitStartMenuStep
	cmp r0, #0
	beq _0809F27A
	pop {r0}
	bx r0
	.align 2, 0
_0809F288: .4byte 0x020372B9
	thumb_func_end InitStartMenu

	thumb_func_start StartMenuTask
StartMenuTask: @ 0x0809F28C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl InitStartMenuStep
	cmp r0, #1
	bne _0809F2A0
	adds r0, r4, #0
	bl SwitchTaskToFollowupFunc
_0809F2A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartMenuTask

	thumb_func_start CreateStartMenuTask
CreateStartMenuTask: @ 0x0809F2A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0809F2D0
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	ldr r4, _0809F2D4
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetTaskFuncWithFollowupFunc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F2D0: .4byte 0x020372B9
_0809F2D4: .4byte 0x0809F28D
	thumb_func_end CreateStartMenuTask

	thumb_func_start sub_0809F2D8
sub_0809F2D8: @ 0x0809F2D8
	push {lr}
	bl InitStartMenuStep
	cmp r0, #0
	beq _0809F2EA
	bl sub_080AEF84
	movs r0, #1
	b _0809F2EC
_0809F2EA:
	movs r0, #0
_0809F2EC:
	pop {r1}
	bx r1
	thumb_func_end sub_0809F2D8

	thumb_func_start sub_0809F2F0
sub_0809F2F0: @ 0x0809F2F0
	ldr r1, _0809F300
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	ldr r1, _0809F304
	ldr r0, _0809F308
	str r0, [r1]
	bx lr
	.align 2, 0
_0809F300: .4byte 0x020372B9
_0809F304: .4byte 0x03005B10
_0809F308: .4byte 0x0809F2D9
	thumb_func_end sub_0809F2F0

	thumb_func_start sub_0809F30C
sub_0809F30C: @ 0x0809F30C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0809F32C
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0809F330
	cmp r0, #1
	beq _0809F354
	b _0809F36A
	.align 2, 0
_0809F32C: .4byte 0x03005B60
_0809F330:
	bl InUnionRoom
	cmp r0, #1
	bne _0809F33C
	bl var_800D_set_xB
_0809F33C:
	ldr r1, _0809F34C
	ldr r0, _0809F350
	str r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0809F36A
	.align 2, 0
_0809F34C: .4byte 0x03005B54
_0809F350: .4byte 0x0809F39D
_0809F354:
	ldr r0, _0809F370
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F36A
	adds r0, r5, #0
	bl DestroyTask
_0809F36A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F370: .4byte 0x03005B54
	thumb_func_end sub_0809F30C

	thumb_func_start ShowStartMenu
ShowStartMenu: @ 0x0809F374
	push {lr}
	bl IsUpdateLinkStateCBActive
	cmp r0, #0
	bne _0809F38A
	bl FreezeEventObjects
	bl sub_0808B1C8
	bl sub_0808B658
_0809F38A:
	ldr r0, _0809F398
	bl CreateStartMenuTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0809F398: .4byte 0x0809F30D
	thumb_func_end ShowStartMenu

	thumb_func_start HandleStartMenuInput
HandleStartMenuInput: @ 0x0809F39C
	push {r4, lr}
	ldr r4, _0809F448
	ldrh r1, [r4, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809F3BC
	movs r0, #5
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	bl Menu_MoveCursor
	ldr r1, _0809F44C
	strb r0, [r1]
_0809F3BC:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F3D6
	movs r0, #5
	bl PlaySE
	movs r0, #1
	bl Menu_MoveCursor
	ldr r1, _0809F44C
	strb r0, [r1]
_0809F3D6:
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809F470
	movs r0, #5
	bl PlaySE
	ldr r1, _0809F450
	ldr r2, _0809F454
	ldr r0, _0809F44C
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0809F458
	cmp r1, r0
	bne _0809F40C
	movs r0, #0
	bl GetNationalPokedexCount
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0809F478
_0809F40C:
	ldr r3, _0809F45C
	ldr r1, _0809F450
	ldr r2, _0809F454
	ldr r0, _0809F44C
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r3]
	ldr r0, _0809F460
	cmp r1, r0
	beq _0809F478
	ldr r0, _0809F464
	cmp r1, r0
	beq _0809F478
	ldr r0, _0809F468
	cmp r1, r0
	beq _0809F478
	ldr r0, _0809F46C
	cmp r1, r0
	beq _0809F478
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	b _0809F478
	.align 2, 0
_0809F448: .4byte 0x03002360
_0809F44C: .4byte 0x020372AE
_0809F450: .4byte 0x084E8C2C
_0809F454: .4byte 0x020372B0
_0809F458: .4byte 0x0809F48D
_0809F45C: .4byte 0x03005B54
_0809F460: .4byte 0x0809F5D5
_0809F464: .4byte 0x0809F63D
_0809F468: .4byte 0x0809F64D
_0809F46C: .4byte 0x0809F699
_0809F470:
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	bne _0809F47C
_0809F478:
	movs r0, #0
	b _0809F486
_0809F47C:
	bl RemoveExtraStartMenuWindows
	bl HideStartMenu
	movs r0, #1
_0809F486:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end HandleStartMenuInput

	thumb_func_start StartMenuPokedexCallback
StartMenuPokedexCallback: @ 0x0809F48C
	push {lr}
	ldr r0, _0809F4A0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F4A4
	movs r0, #0
	b _0809F4BE
	.align 2, 0
_0809F4A0: .4byte 0x02037C74
_0809F4A4:
	movs r0, #0x29
	bl IncrementGameStat
	bl PlayRainStoppingSoundEffect
	bl RemoveExtraStartMenuWindows
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0809F4C4
	bl SetMainCallback2
	movs r0, #1
_0809F4BE:
	pop {r1}
	bx r1
	.align 2, 0
_0809F4C4: .4byte 0x080BAC71
	thumb_func_end StartMenuPokedexCallback

	thumb_func_start StartMenuPokemonCallback
StartMenuPokemonCallback: @ 0x0809F4C8
	push {lr}
	ldr r0, _0809F4DC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F4E0
	movs r0, #0
	b _0809F4F4
	.align 2, 0
_0809F4DC: .4byte 0x02037C74
_0809F4E0:
	bl PlayRainStoppingSoundEffect
	bl RemoveExtraStartMenuWindows
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0809F4F8
	bl SetMainCallback2
	movs r0, #1
_0809F4F4:
	pop {r1}
	bx r1
	.align 2, 0
_0809F4F8: .4byte 0x081B7BD5
	thumb_func_end StartMenuPokemonCallback

	thumb_func_start StartMenuBagCallback
StartMenuBagCallback: @ 0x0809F4FC
	push {lr}
	ldr r0, _0809F510
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F514
	movs r0, #0
	b _0809F528
	.align 2, 0
_0809F510: .4byte 0x02037C74
_0809F514:
	bl PlayRainStoppingSoundEffect
	bl RemoveExtraStartMenuWindows
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0809F52C
	bl SetMainCallback2
	movs r0, #1
_0809F528:
	pop {r1}
	bx r1
	.align 2, 0
_0809F52C: .4byte 0x081AA915
	thumb_func_end StartMenuBagCallback

	thumb_func_start StartMenuPokeNavCallback
StartMenuPokeNavCallback: @ 0x0809F530
	push {lr}
	ldr r0, _0809F544
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F548
	movs r0, #0
	b _0809F55C
	.align 2, 0
_0809F544: .4byte 0x02037C74
_0809F548:
	bl PlayRainStoppingSoundEffect
	bl RemoveExtraStartMenuWindows
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0809F560
	bl SetMainCallback2
	movs r0, #1
_0809F55C:
	pop {r1}
	bx r1
	.align 2, 0
_0809F560: .4byte 0x081C6A11
	thumb_func_end StartMenuPokeNavCallback

	thumb_func_start StartMenuPlayerNameCallback
StartMenuPlayerNameCallback: @ 0x0809F564
	push {lr}
	ldr r0, _0809F598
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0809F5CC
	bl PlayRainStoppingSoundEffect
	bl RemoveExtraStartMenuWindows
	bl CleanupOverworldWindowsAndTilemaps
	bl IsUpdateLinkStateCBActive
	cmp r0, #0
	bne _0809F58E
	bl InUnionRoom
	cmp r0, #0
	beq _0809F5A0
_0809F58E:
	ldr r0, _0809F59C
	bl ShowPlayerTrainerCard
	b _0809F5C2
	.align 2, 0
_0809F598: .4byte 0x02037C74
_0809F59C: .4byte 0x08085AFD
_0809F5A0:
	ldr r0, _0809F5B4
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F5BC
	ldr r0, _0809F5B8
	bl ShowFrontierPass
	b _0809F5C2
	.align 2, 0
_0809F5B4: .4byte 0x000008D2
_0809F5B8: .4byte 0x08085AFD
_0809F5BC:
	ldr r0, _0809F5C8
	bl ShowPlayerTrainerCard
_0809F5C2:
	movs r0, #1
	b _0809F5CE
	.align 2, 0
_0809F5C8: .4byte 0x08085AFD
_0809F5CC:
	movs r0, #0
_0809F5CE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end StartMenuPlayerNameCallback

	thumb_func_start StartMenuSaveCallback
StartMenuSaveCallback: @ 0x0809F5D4
	push {lr}
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F5E4
	bl RemoveExtraStartMenuWindows
_0809F5E4:
	ldr r1, _0809F5F0
	ldr r0, _0809F5F4
	str r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809F5F0: .4byte 0x03005B54
_0809F5F4: .4byte 0x0809F701
	thumb_func_end StartMenuSaveCallback

	thumb_func_start StartMenuOptionCallback
StartMenuOptionCallback: @ 0x0809F5F8
	push {lr}
	ldr r0, _0809F60C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F610
	movs r0, #0
	b _0809F62A
	.align 2, 0
_0809F60C: .4byte 0x02037C74
_0809F610:
	bl PlayRainStoppingSoundEffect
	bl RemoveExtraStartMenuWindows
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0809F630
	bl SetMainCallback2
	ldr r1, _0809F634
	ldr r0, _0809F638
	str r0, [r1, #8]
	movs r0, #1
_0809F62A:
	pop {r1}
	bx r1
	.align 2, 0
_0809F630: .4byte 0x080B9C35
_0809F634: .4byte 0x03002360
_0809F638: .4byte 0x08085AFD
	thumb_func_end StartMenuOptionCallback

	thumb_func_start StartMenuExitCallback
StartMenuExitCallback: @ 0x0809F63C
	push {lr}
	bl RemoveExtraStartMenuWindows
	bl HideStartMenu
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end StartMenuExitCallback

	thumb_func_start StartMenuSafariZoneRetireCallback
StartMenuSafariZoneRetireCallback: @ 0x0809F64C
	push {lr}
	bl RemoveExtraStartMenuWindows
	bl HideStartMenu
	bl SetSafariZoneFlag
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end StartMenuSafariZoneRetireCallback

	thumb_func_start StartMenuLinkModePlayerNameCallback
StartMenuLinkModePlayerNameCallback: @ 0x0809F660
	push {lr}
	ldr r0, _0809F674
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F678
	movs r0, #0
	b _0809F68C
	.align 2, 0
_0809F674: .4byte 0x02037C74
_0809F678:
	bl PlayRainStoppingSoundEffect
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0809F690
	ldrb r0, [r0]
	ldr r1, _0809F694
	bl ShowTrainerCardInLink
	movs r0, #1
_0809F68C:
	pop {r1}
	bx r1
	.align 2, 0
_0809F690: .4byte 0x03005B14
_0809F694: .4byte 0x08085AFD
	thumb_func_end StartMenuLinkModePlayerNameCallback

	thumb_func_start StartMenuBattlePyramidRetireCallback
StartMenuBattlePyramidRetireCallback: @ 0x0809F698
	ldr r1, _0809F6A4
	ldr r0, _0809F6A8
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0809F6A4: .4byte 0x03005B54
_0809F6A8: .4byte 0x0809F775
	thumb_func_end StartMenuBattlePyramidRetireCallback

	thumb_func_start sub_0809F6AC
sub_0809F6AC: @ 0x0809F6AC
	push {lr}
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrameToTransparent
	bl ScriptUnfreezeEventObjects
	ldr r0, _0809F6C8
	bl CreateStartMenuTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0809F6C8: .4byte 0x0809F30D
	thumb_func_end sub_0809F6AC

	thumb_func_start StartMenuBattlePyramidBagCallback
StartMenuBattlePyramidBagCallback: @ 0x0809F6CC
	push {lr}
	ldr r0, _0809F6E0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F6E4
	movs r0, #0
	b _0809F6F8
	.align 2, 0
_0809F6E0: .4byte 0x02037C74
_0809F6E4:
	bl PlayRainStoppingSoundEffect
	bl RemoveExtraStartMenuWindows
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0809F6FC
	bl SetMainCallback2
	movs r0, #1
_0809F6F8:
	pop {r1}
	bx r1
	.align 2, 0
_0809F6FC: .4byte 0x081C4705
	thumb_func_end StartMenuBattlePyramidBagCallback

	thumb_func_start SaveStartCallback
SaveStartCallback: @ 0x0809F700
	push {lr}
	bl InitSave
	ldr r1, _0809F714
	ldr r0, _0809F718
	str r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809F714: .4byte 0x03005B54
_0809F718: .4byte 0x0809F71D
	thumb_func_end SaveStartCallback

	thumb_func_start SaveCallback
SaveCallback: @ 0x0809F71C
	push {lr}
	bl RunSaveCallback
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809F754
	cmp r0, #1
	ble _0809F76C
	cmp r0, #2
	beq _0809F738
	cmp r0, #3
	beq _0809F754
	b _0809F76C
_0809F738:
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrameToTransparent
	bl InitStartMenu
	ldr r1, _0809F74C
	ldr r0, _0809F750
	str r0, [r1]
	b _0809F76C
	.align 2, 0
_0809F74C: .4byte 0x03005B54
_0809F750: .4byte 0x0809F39D
_0809F754:
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrameToTransparent
	bl ScriptUnfreezeEventObjects
	bl ScriptContext2_Disable
	bl SoftResetInBattlePyramid
	movs r0, #1
	b _0809F76E
_0809F76C:
	movs r0, #0
_0809F76E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SaveCallback

	thumb_func_start BattlePyramidRetireStartCallback
BattlePyramidRetireStartCallback: @ 0x0809F774
	push {lr}
	bl InitBattlePyramidRetire
	ldr r1, _0809F788
	ldr r0, _0809F78C
	str r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809F788: .4byte 0x03005B54
_0809F78C: .4byte 0x0809F7AD
	thumb_func_end BattlePyramidRetireStartCallback

	thumb_func_start BattlePyramidRetireReturnCallback
BattlePyramidRetireReturnCallback: @ 0x0809F790
	push {lr}
	bl InitStartMenu
	ldr r1, _0809F7A4
	ldr r0, _0809F7A8
	str r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809F7A4: .4byte 0x03005B54
_0809F7A8: .4byte 0x0809F39D
	thumb_func_end BattlePyramidRetireReturnCallback

	thumb_func_start BattlePyramidRetireCallback
BattlePyramidRetireCallback: @ 0x0809F7AC
	push {lr}
	bl RunSaveCallback
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809F7C4
	cmp r0, #1
	ble _0809F7F8
	cmp r0, #2
	beq _0809F7D8
	b _0809F7F8
_0809F7C4:
	bl RemoveExtraStartMenuWindows
	ldr r1, _0809F7D0
	ldr r0, _0809F7D4
	str r0, [r1]
	b _0809F7F8
	.align 2, 0
_0809F7D0: .4byte 0x03005B54
_0809F7D4: .4byte 0x0809F791
_0809F7D8:
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrameToTransparent
	bl ScriptUnfreezeEventObjects
	bl ScriptContext2_Disable
	ldr r0, _0809F7F4
	bl ScriptContext1_SetupScript
	movs r0, #1
	b _0809F7FA
	.align 2, 0
_0809F7F4: .4byte 0x0822D751
_0809F7F8:
	movs r0, #0
_0809F7FA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end BattlePyramidRetireCallback

	thumb_func_start InitSave
InitSave: @ 0x0809F800
	push {lr}
	bl save_serialize_map
	ldr r1, _0809F818
	ldr r0, _0809F81C
	str r0, [r1]
	ldr r1, _0809F820
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809F818: .4byte 0x020372BC
_0809F81C: .4byte 0x0809F979
_0809F820: .4byte 0x020372C1
	thumb_func_end InitSave

	thumb_func_start RunSaveCallback
RunSaveCallback: @ 0x0809F824
	push {lr}
	bl RunTextPrintersAndIsPrinter0Active
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _0809F850
	ldr r1, _0809F848
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0809F84C
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0809F852
	.align 2, 0
_0809F848: .4byte 0x020372C1
_0809F84C: .4byte 0x020372BC
_0809F850:
	movs r0, #0
_0809F852:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RunSaveCallback

	thumb_func_start SaveGame
SaveGame: @ 0x0809F858
	push {lr}
	bl InitSave
	ldr r0, _0809F86C
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0809F86C: .4byte 0x0809F8A9
	thumb_func_end SaveGame

	thumb_func_start ShowSaveMessage
ShowSaveMessage: @ 0x0809F870
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0809F89C
	adds r1, r2, #0
	bl StringExpandPlaceholders
	movs r0, #0
	movs r1, #1
	bl sub_08197650
	movs r0, #1
	bl AddTextPrinterForMessage_2
	ldr r1, _0809F8A0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0809F8A4
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F89C: .4byte 0x02021C7C
_0809F8A0: .4byte 0x020372C1
_0809F8A4: .4byte 0x020372BC
	thumb_func_end ShowSaveMessage

	thumb_func_start SaveGameTask
SaveGameTask: @ 0x0809F8A8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl RunSaveCallback
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	beq _0809F8D4
	cmp r1, #1
	bgt _0809F8C4
	cmp r1, #0
	beq _0809F8E2
	b _0809F8D8
_0809F8C4:
	cmp r1, #3
	bgt _0809F8D8
	ldr r1, _0809F8D0
	movs r0, #0
	strh r0, [r1]
	b _0809F8D8
	.align 2, 0
_0809F8D0: .4byte 0x02037290
_0809F8D4:
	ldr r0, _0809F8E8
	strh r1, [r0]
_0809F8D8:
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_0809F8E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F8E8: .4byte 0x02037290
	thumb_func_end SaveGameTask

	thumb_func_start sub_0809F8EC
sub_0809F8EC: @ 0x0809F8EC
	push {lr}
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0809F8EC

	thumb_func_start HideSaveInfoWindow
HideSaveInfoWindow: @ 0x0809F8FC
	push {lr}
	bl RemoveSaveInfoWindow
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end HideSaveInfoWindow

	thumb_func_start SaveStartTimer
SaveStartTimer: @ 0x0809F908
	ldr r1, _0809F910
	movs r0, #0x3c
	strb r0, [r1]
	bx lr
	.align 2, 0
_0809F910: .4byte 0x020372C0
	thumb_func_end SaveStartTimer

	thumb_func_start SaveSuccesTimer
SaveSuccesTimer: @ 0x0809F914
	push {lr}
	ldr r1, _0809F934
	ldrb r0, [r1]
	subs r2, r0, #1
	strb r2, [r1]
	ldr r0, _0809F938
	ldrh r1, [r0, #0x2c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809F93C
	lsls r0, r2, #0x18
	cmp r0, #0
	beq _0809F942
	movs r0, #0
	b _0809F944
	.align 2, 0
_0809F934: .4byte 0x020372C0
_0809F938: .4byte 0x03002360
_0809F93C:
	movs r0, #5
	bl PlaySE
_0809F942:
	movs r0, #1
_0809F944:
	pop {r1}
	bx r1
	thumb_func_end SaveSuccesTimer

	thumb_func_start SaveErrorTimer
SaveErrorTimer: @ 0x0809F948
	push {lr}
	ldr r1, _0809F964
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809F96C
	ldr r0, _0809F968
	ldrh r1, [r0, #0x2c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809F970
	movs r0, #1
	b _0809F972
	.align 2, 0
_0809F964: .4byte 0x020372C0
_0809F968: .4byte 0x03002360
_0809F96C:
	subs r0, #1
	strb r0, [r1]
_0809F970:
	movs r0, #0
_0809F972:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SaveErrorTimer

	thumb_func_start SaveConfirmSaveCallback
SaveConfirmSaveCallback: @ 0x0809F978
	push {lr}
	bl GetStartMenuWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl DrawStdWindowFrame
	bl RemoveMapNamePopUpWindow
	bl ShowSaveInfoWindow
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F9AC
	ldr r0, _0809F9A4
	ldr r1, _0809F9A8
	bl ShowSaveMessage
	b _0809F9B4
	.align 2, 0
_0809F9A4: .4byte 0x0822D762
_0809F9A8: .4byte 0x0809F9C5
_0809F9AC:
	ldr r0, _0809F9BC
	ldr r1, _0809F9C0
	bl ShowSaveMessage
_0809F9B4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809F9BC: .4byte 0x08276F58
_0809F9C0: .4byte 0x0809F9C5
	thumb_func_end SaveConfirmSaveCallback

	thumb_func_start SaveConfirmOverwriteCallback
SaveConfirmOverwriteCallback: @ 0x0809F9C4
	push {lr}
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _0809F9D8
	ldr r0, _0809F9DC
	str r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809F9D8: .4byte 0x020372BC
_0809F9DC: .4byte 0x0809F9E1
	thumb_func_end SaveConfirmOverwriteCallback

	thumb_func_start SaveConfirmInputCallback
SaveConfirmInputCallback: @ 0x0809F9E0
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0809FA02
	cmp r1, #0
	bgt _0809F9FC
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0809FA40
	b _0809FA4C
_0809F9FC:
	cmp r1, #1
	beq _0809FA40
	b _0809FA4C
_0809FA02:
	ldr r0, _0809FA20
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809FA0E
	cmp r0, #2
	bne _0809FA16
_0809FA0E:
	ldr r0, _0809FA24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809FA30
_0809FA16:
	ldr r1, _0809FA28
	ldr r0, _0809FA2C
	str r0, [r1]
	b _0809FA4C
	.align 2, 0
_0809FA20: .4byte 0x03005F50
_0809FA24: .4byte 0x02031F74
_0809FA28: .4byte 0x020372BC
_0809FA2C: .4byte 0x0809FA55
_0809FA30:
	ldr r1, _0809FA38
	ldr r0, _0809FA3C
	str r0, [r1]
	b _0809FA4C
	.align 2, 0
_0809FA38: .4byte 0x020372BC
_0809FA3C: .4byte 0x0809FB0D
_0809FA40:
	bl HideSaveInfoWindow
	bl sub_0809F8EC
	movs r0, #2
	b _0809FA4E
_0809FA4C:
	movs r0, #0
_0809FA4E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SaveConfirmInputCallback

	thumb_func_start SaveFileExistsCallback
SaveFileExistsCallback: @ 0x0809FA54
	push {lr}
	ldr r0, _0809FA68
	ldrb r0, [r0]
	cmp r0, #1
	bne _0809FA74
	ldr r0, _0809FA6C
	ldr r1, _0809FA70
	bl ShowSaveMessage
	b _0809FA7C
	.align 2, 0
_0809FA68: .4byte 0x02031F74
_0809FA6C: .4byte 0x08276FD3
_0809FA70: .4byte 0x0809FA8D
_0809FA74:
	ldr r0, _0809FA84
	ldr r1, _0809FA88
	bl ShowSaveMessage
_0809FA7C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809FA84: .4byte 0x08276F77
_0809FA88: .4byte 0x0809FAA9
	thumb_func_end SaveFileExistsCallback

	thumb_func_start BattlePyramidRetireYesNoCallback
BattlePyramidRetireYesNoCallback: @ 0x0809FA8C
	push {lr}
	movs r0, #1
	bl DisplayYesNoMenuWithDefault
	ldr r1, _0809FAA0
	ldr r0, _0809FAA4
	str r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809FAA0: .4byte 0x020372BC
_0809FAA4: .4byte 0x0809FAC5
	thumb_func_end BattlePyramidRetireYesNoCallback

	thumb_func_start SaveYesNoCallback
SaveYesNoCallback: @ 0x0809FAA8
	push {lr}
	bl DisplayYesNoMenuDefaultYes
	ldr r1, _0809FABC
	ldr r0, _0809FAC0
	str r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809FABC: .4byte 0x020372BC
_0809FAC0: .4byte 0x0809FAC5
	thumb_func_end SaveYesNoCallback

	thumb_func_start SaveOverwriteInputCallback
SaveOverwriteInputCallback: @ 0x0809FAC4
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0809FAE6
	cmp r1, #0
	bgt _0809FAE0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0809FAF8
	b _0809FB04
_0809FAE0:
	cmp r1, #1
	beq _0809FAF8
	b _0809FB04
_0809FAE6:
	ldr r1, _0809FAF0
	ldr r0, _0809FAF4
	str r0, [r1]
	b _0809FB04
	.align 2, 0
_0809FAF0: .4byte 0x020372BC
_0809FAF4: .4byte 0x0809FB0D
_0809FAF8:
	bl HideSaveInfoWindow
	bl sub_0809F8EC
	movs r0, #2
	b _0809FB06
_0809FB04:
	movs r0, #0
_0809FB06:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SaveOverwriteInputCallback

	thumb_func_start SaveSavingMessageCallback
SaveSavingMessageCallback: @ 0x0809FB0C
	push {lr}
	ldr r0, _0809FB1C
	ldr r1, _0809FB20
	bl ShowSaveMessage
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809FB1C: .4byte 0x08276F97
_0809FB20: .4byte 0x0809FB25
	thumb_func_end SaveSavingMessageCallback

	thumb_func_start SaveDoSaveCallback
SaveDoSaveCallback: @ 0x0809FB24
	push {r4, lr}
	movs r0, #0
	bl IncrementGameStat
	bl sub_081A9C08
	ldr r4, _0809FB48
	ldrb r0, [r4]
	cmp r0, #1
	bne _0809FB4C
	movs r0, #4
	bl TrySavingData
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0
	strb r0, [r4]
	b _0809FB56
	.align 2, 0
_0809FB48: .4byte 0x02031F74
_0809FB4C:
	movs r0, #0
	bl TrySavingData
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0809FB56:
	cmp r1, #1
	bne _0809FB6C
	ldr r0, _0809FB64
	ldr r1, _0809FB68
	bl ShowSaveMessage
	b _0809FB74
	.align 2, 0
_0809FB64: .4byte 0x08276FBB
_0809FB68: .4byte 0x0809FB89
_0809FB6C:
	ldr r0, _0809FB80
	ldr r1, _0809FB84
	bl ShowSaveMessage
_0809FB74:
	bl SaveStartTimer
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809FB80: .4byte 0x08277048
_0809FB84: .4byte 0x0809FBD5
	thumb_func_end SaveDoSaveCallback

	thumb_func_start SaveSuccessCallback
SaveSuccessCallback: @ 0x0809FB88
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0809FBA2
	movs r0, #0x37
	bl PlaySE
	ldr r1, _0809FBA8
	ldr r0, _0809FBAC
	str r0, [r1]
_0809FBA2:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809FBA8: .4byte 0x020372BC
_0809FBAC: .4byte 0x0809FBB1
	thumb_func_end SaveSuccessCallback

	thumb_func_start SaveReturnSuccessCallback
SaveReturnSuccessCallback: @ 0x0809FBB0
	push {lr}
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809FBCE
	bl SaveSuccesTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FBCE
	bl HideSaveInfoWindow
	movs r0, #1
	b _0809FBD0
_0809FBCE:
	movs r0, #0
_0809FBD0:
	pop {r1}
	bx r1
	thumb_func_end SaveReturnSuccessCallback

	thumb_func_start SaveErrorCallback
SaveErrorCallback: @ 0x0809FBD4
	push {lr}
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0809FBEE
	movs r0, #0x16
	bl PlaySE
	ldr r1, _0809FBF4
	ldr r0, _0809FBF8
	str r0, [r1]
_0809FBEE:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809FBF4: .4byte 0x020372BC
_0809FBF8: .4byte 0x0809FBFD
	thumb_func_end SaveErrorCallback

	thumb_func_start SaveReturnErrorCallback
SaveReturnErrorCallback: @ 0x0809FBFC
	push {lr}
	bl SaveErrorTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FC10
	bl HideSaveInfoWindow
	movs r0, #3
	b _0809FC12
_0809FC10:
	movs r0, #0
_0809FC12:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SaveReturnErrorCallback

	thumb_func_start InitBattlePyramidRetire
InitBattlePyramidRetire: @ 0x0809FC18
	ldr r1, _0809FC28
	ldr r0, _0809FC2C
	str r0, [r1]
	ldr r1, _0809FC30
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0809FC28: .4byte 0x020372BC
_0809FC2C: .4byte 0x0809FC35
_0809FC30: .4byte 0x020372C1
	thumb_func_end InitBattlePyramidRetire

	thumb_func_start BattlePyramidConfirmRetireCallback
BattlePyramidConfirmRetireCallback: @ 0x0809FC34
	push {lr}
	bl GetStartMenuWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl DrawStdWindowFrame
	bl RemoveMapNamePopUpWindow
	ldr r0, _0809FC58
	ldr r1, _0809FC5C
	bl ShowSaveMessage
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809FC58: .4byte 0x0822D78F
_0809FC5C: .4byte 0x0809FC61
	thumb_func_end BattlePyramidConfirmRetireCallback

	thumb_func_start SaveConfirmOverwriteDefaultNoCallback
SaveConfirmOverwriteDefaultNoCallback: @ 0x0809FC60
	push {lr}
	movs r0, #1
	bl DisplayYesNoMenuWithDefault
	ldr r1, _0809FC74
	ldr r0, _0809FC78
	str r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809FC74: .4byte 0x020372BC
_0809FC78: .4byte 0x0809FC7D
	thumb_func_end SaveConfirmOverwriteDefaultNoCallback

	thumb_func_start BattlePyramidRetireInputCallback
BattlePyramidRetireInputCallback: @ 0x0809FC7C
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0809FC9E
	cmp r1, #0
	bgt _0809FC98
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0809FCA2
	b _0809FCAA
_0809FC98:
	cmp r1, #1
	beq _0809FCA2
	b _0809FCAA
_0809FC9E:
	movs r0, #2
	b _0809FCAC
_0809FCA2:
	bl sub_0809F8EC
	movs r0, #1
	b _0809FCAC
_0809FCAA:
	movs r0, #0
_0809FCAC:
	pop {r1}
	bx r1
	thumb_func_end BattlePyramidRetireInputCallback

	thumb_func_start sub_0809FCB0
sub_0809FCB0: @ 0x0809FCB0
	push {lr}
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0809FCB0

	thumb_func_start sub_0809FCBC
sub_0809FCBC: @ 0x0809FCBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #4
	bls _0809FCCE
	b _0809FDD4
_0809FCCE:
	lsls r0, r0, #2
	ldr r1, _0809FCD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809FCD8: .4byte 0x0809FCDC
_0809FCDC: @ jump table
	.4byte _0809FCF0 @ case 0
	.4byte _0809FD68 @ case 1
	.4byte _0809FD7A @ case 2
	.4byte _0809FDAC @ case 3
	.4byte _0809FDD0 @ case 4
_0809FCF0:
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl SetVBlankCallback
	bl ScanlineEffect_Stop
	movs r2, #0xa0
	lsls r2, r2, #0x13
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0809FD5C
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _0809FD60
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	movs r3, #0xc0
	lsls r3, r3, #9
	mov r4, sp
	movs r6, #0
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _0809FD64
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_0809FD32:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, r2, r5
	subs r3, r3, r5
	cmp r3, r5
	bhi _0809FD32
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	lsrs r0, r3, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0809FDD4
	.align 2, 0
_0809FD5C: .4byte 0x040000D4
_0809FD60: .4byte 0x81000200
_0809FD64: .4byte 0x81000800
_0809FD68:
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	bl ScanlineEffect_Clear
	b _0809FDD4
_0809FD7A:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0809FDA4
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	ldr r0, _0809FDA8
	bl InitWindows
	movs r0, #0
	movs r1, #8
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx_
	movs r0, #0xf0
	bl Menu_LoadStdPalAt
	b _0809FDD4
	.align 2, 0
_0809FDA4: .4byte 0x084E8C94
_0809FDA8: .4byte 0x084E8C98
_0809FDAC:
	movs r0, #0
	bl ShowBg
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _0809FDCC
	bl SetVBlankCallback
	movs r0, #1
	bl EnableInterrupts
	b _0809FDD4
	.align 2, 0
_0809FDCC: .4byte 0x0809FCB1
_0809FDD0:
	movs r0, #1
	b _0809FDDE
_0809FDD4:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
_0809FDDE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0809FCBC

	thumb_func_start sub_0809FDEC
sub_0809FDEC: @ 0x0809FDEC
	push {lr}
	ldr r0, _0809FE0C
	bl sub_0809FCBC
	cmp r0, #0
	beq _0809FE06
	ldr r0, _0809FE10
	movs r1, #0x50
	bl CreateTask
	ldr r0, _0809FE14
	bl SetMainCallback2
_0809FE06:
	pop {r0}
	bx r0
	.align 2, 0
_0809FE0C: .4byte 0x03002798
_0809FE10: .4byte 0x0809FE29
_0809FE14: .4byte 0x0809FE19
	thumb_func_end sub_0809FDEC

	thumb_func_start sub_0809FE18
sub_0809FE18: @ 0x0809FE18
	push {lr}
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0809FE18

	thumb_func_start sub_0809FE28
sub_0809FE28: @ 0x0809FE28
	push {r4, r5, r6, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0809FE5C
	adds r5, r0, r1
	ldr r0, _0809FE60
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809FE48
	b _0809FF80
_0809FE48:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #6
	bls _0809FE52
	b _0809FF80
_0809FE52:
	lsls r0, r0, #2
	ldr r1, _0809FE64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809FE5C: .4byte 0x03005B68
_0809FE60: .4byte 0x02037C74
_0809FE64: .4byte 0x0809FE68
_0809FE68: @ jump table
	.4byte _0809FE84 @ case 0
	.4byte _0809FF08 @ case 1
	.4byte _0809FF14 @ case 2
	.4byte _0809FF34 @ case 3
	.4byte _0809FF48 @ case 4
	.4byte _0809FF60 @ case 5
	.4byte _0809FF70 @ case 6
_0809FE84:
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _0809FEEC
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r6, #1
	str r6, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #0xff
	bl AddTextPrinterParameterized2
	movs r0, #0
	movs r1, #8
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0809FEF0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809FEF8
	bl InUnionRoom
	cmp r0, #0
	beq _0809FEF8
	bl sub_08009C40
	cmp r0, #0
	beq _0809FEF4
	strh r6, [r5]
	b _0809FF80
	.align 2, 0
_0809FEEC: .4byte 0x08277071
_0809FEF0: .4byte 0x0300319C
_0809FEF4:
	movs r0, #5
	b _0809FF7E
_0809FEF8:
	ldr r0, _0809FF04
	movs r1, #1
	strb r1, [r0]
	movs r0, #1
	b _0809FF7E
	.align 2, 0
_0809FF04: .4byte 0x030027A0
_0809FF08:
	bl SetContinueGameWarpStatusToDynamicWarp
	bl FullSaveGame
	movs r0, #2
	b _0809FF7E
_0809FF14:
	bl CheckSaveFile
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FF80
	bl ClearContinueGameWarpStatus
	movs r0, #3
	strh r0, [r5]
	ldr r1, _0809FF30
	movs r0, #0
	strb r0, [r1]
	b _0809FF80
	.align 2, 0
_0809FF30: .4byte 0x030027A0
_0809FF34:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #4
	b _0809FF7E
_0809FF48:
	bl FreeAllWindowBuffers
	ldr r0, _0809FF5C
	ldr r0, [r0, #8]
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
	b _0809FF80
	.align 2, 0
_0809FF5C: .4byte 0x03002360
_0809FF60:
	ldr r0, _0809FF6C
	movs r1, #5
	bl CreateTask
	movs r0, #6
	b _0809FF7E
	.align 2, 0
_0809FF6C: .4byte 0x081535C5
_0809FF70:
	ldr r0, _0809FF88
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809FF80
	movs r0, #3
_0809FF7E:
	strh r0, [r5]
_0809FF80:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF88: .4byte 0x081535C5
	thumb_func_end sub_0809FE28

	thumb_func_start ShowSaveInfoWindow
ShowSaveInfoWindow: @ 0x0809FF8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _080A00F4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, _080A00F8
	mov sl, r0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809FFC4
	add r0, sp, #0xc
	ldrb r1, [r0, #4]
	subs r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080A00FC
	ldr r0, [sp, #0x10]
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0x10]
_0809FFC4:
	ldr r6, _080A0100
	add r0, sp, #0xc
	bl AddWindow
	strb r0, [r6]
	ldrb r0, [r6]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldr r1, _080A0104
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	movs r1, #4
	mov sb, r1
	cmp r0, #0
	bne _0809FFE8
	movs r0, #8
	mov sb, r0
_0809FFE8:
	movs r4, #2
	ldr r5, _080A0108
	movs r0, #3
	adds r1, r5, #0
	movs r2, #6
	bl sub_08199FDC
	ldrb r0, [r6]
	str r4, [sp]
	movs r7, #0xff
	str r7, [sp, #4]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r4, #0x10
	ldrb r0, [r6]
	ldr r2, _080A010C
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	adds r1, r5, #0
	mov r2, sb
	bl sub_08199FDC
	movs r0, #0xff
	strb r0, [r5, #0xb]
	ldrb r0, [r6]
	adds r1, r5, #0
	movs r2, #0x48
	movs r3, #0x10
	bl PrintPlayerNameOnWindow
	movs r4, #0x1e
	ldrb r0, [r6]
	ldr r2, _080A0110
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #4
	adds r1, r5, #0
	mov r2, sb
	bl sub_08199FDC
	ldrb r0, [r6]
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x48
	bl AddTextPrinterParameterized
	movs r4, #0x2c
	mov r0, sl
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080A00B6
	ldrb r0, [r6]
	ldr r2, _080A0114
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #1
	adds r1, r5, #0
	mov r2, sb
	bl sub_08199FDC
	ldrb r0, [r6]
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x48
	bl AddTextPrinterParameterized
	movs r4, #0x3a
_080A00B6:
	ldrb r0, [r6]
	ldr r2, _080A0118
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #2
	adds r1, r5, #0
	mov r2, sb
	bl sub_08199FDC
	ldr r1, _080A0104
	ldr r0, [r1]
	ldrh r0, [r0, #0xe]
	cmp r0, #0x63
	bls _080A011C
	ldrb r0, [r6]
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x40
	bl AddTextPrinterParameterized
	b _080A0130
	.align 2, 0
_080A00F4: .4byte 0x084E8CA8
_080A00F8: .4byte 0x00000861
_080A00FC: .4byte 0xFFFFFF00
_080A0100: .4byte 0x020372C2
_080A0104: .4byte 0x03005AF0
_080A0108: .4byte 0x02021C7C
_080A010C: .4byte 0x084E8CB0
_080A0110: .4byte 0x084E8CB7
_080A0114: .4byte 0x084E8CC0
_080A0118: .4byte 0x084E8CC8
_080A011C:
	ldrb r0, [r6]
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0x48
	bl AddTextPrinterParameterized
_080A0130:
	ldr r0, _080A014C
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A014C: .4byte 0x020372C2
	thumb_func_end ShowSaveInfoWindow

	thumb_func_start RemoveSaveInfoWindow
RemoveSaveInfoWindow: @ 0x080A0150
	push {r4, lr}
	ldr r4, _080A0168
	ldrb r0, [r4]
	movs r1, #0
	bl DrawStdWindowFrame
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0168: .4byte 0x020372C2
	thumb_func_end RemoveSaveInfoWindow

	thumb_func_start sub_080A016C
sub_080A016C: @ 0x080A016C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A0190
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A0188
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_080A0188:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0190: .4byte 0x081535C5
	thumb_func_end sub_080A016C

	thumb_func_start sub_080A0194
sub_080A0194: @ 0x080A0194
	push {r4, r5, lr}
	ldr r0, _080A01D0
	movs r1, #5
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080A01D4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #1
	strh r1, [r0, #0xc]
	ldr r0, _080A01D8
	movs r1, #6
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r5
	strh r4, [r1, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A01D0: .4byte 0x081535C5
_080A01D4: .4byte 0x03005B60
_080A01D8: .4byte 0x080A016D
	thumb_func_end sub_080A0194

	thumb_func_start HideStartMenuWindow
HideStartMenuWindow: @ 0x080A01DC
	push {lr}
	bl GetStartMenuWindowId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl DrawStdWindowFrame
	bl RemoveMapNamePopUpWindow
	bl ScriptUnfreezeEventObjects
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	thumb_func_end HideStartMenuWindow

	thumb_func_start HideStartMenu
HideStartMenu: @ 0x080A01FC
	push {lr}
	movs r0, #5
	bl PlaySE
	bl HideStartMenuWindow
	pop {r0}
	bx r0
	thumb_func_end HideStartMenu

	thumb_func_start AppendToList
AppendToList: @ 0x080A020C
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
	thumb_func_end AppendToList

