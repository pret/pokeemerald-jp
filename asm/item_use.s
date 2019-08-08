.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetUpItemUseCallback
SetUpItemUseCallback: @ 0x080FD8B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080FD8D0
	ldrh r0, [r1]
	cmp r0, #0xaf
	bne _080FD8D8
	ldr r0, _080FD8D4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #0x10]
	b _080FD8DE
	.align 2, 0
_080FD8D0: .4byte 0x0203CB48
_080FD8D4: .4byte 0x03005B60
_080FD8D8:
	ldrh r0, [r1]
	bl ItemId_GetPocket
_080FD8DE:
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD90C
	ldr r0, _080FD904
	ldr r2, [r0]
	ldr r1, _080FD908
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	adds r0, r5, #0
	bl unknown_ItemMenu_Confirm
	b _080FD920
	.align 2, 0
_080FD904: .4byte 0x0203CB20
_080FD908: .4byte 0x0856DCBC
_080FD90C:
	ldr r0, _080FD928
	ldr r2, [r0]
	ldr r1, _080FD92C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	adds r0, r5, #0
	bl sub_081C5310
_080FD920:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FD928: .4byte 0x0203CBF8
_080FD92C: .4byte 0x0856DCBC
	thumb_func_end SetUpItemUseCallback

	thumb_func_start SetUpItemUseOnFieldCallback
SetUpItemUseOnFieldCallback: @ 0x080FD930
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080FD958
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _080FD964
	ldr r1, _080FD95C
	ldr r0, _080FD960
	str r0, [r1]
	adds r0, r2, #0
	bl SetUpItemUseCallback
	b _080FD96E
	.align 2, 0
_080FD958: .4byte 0x03005B60
_080FD95C: .4byte 0x03005B0C
_080FD960: .4byte 0x080FD979
_080FD964:
	ldr r0, _080FD974
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
_080FD96E:
	pop {r0}
	bx r0
	.align 2, 0
_080FD974: .4byte 0x02039DC0
	thumb_func_end SetUpItemUseOnFieldCallback

	thumb_func_start MapPostLoadHook_UseItem
MapPostLoadHook_UseItem: @ 0x080FD978
	push {lr}
	bl pal_fill_black
	ldr r0, _080FD98C
	movs r1, #8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080FD98C: .4byte 0x080FD991
	thumb_func_end MapPostLoadHook_UseItem

	thumb_func_start Task_CallItemUseOnFieldCallback
Task_CallItemUseOnFieldCallback: @ 0x080FD990
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FD9AC
	ldr r0, _080FD9B4
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_080FD9AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FD9B4: .4byte 0x02039DC0
	thumb_func_end Task_CallItemUseOnFieldCallback

	thumb_func_start DisplayCannotUseItemMessage
DisplayCannotUseItemMessage: @ 0x080FD9B8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _080FD9EC
	adds r0, r6, #0
	bl StringExpandPlaceholders
	cmp r4, #0
	bne _080FDA08
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD9F4
	ldr r3, _080FD9F0
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl DisplayItemMessage
	b _080FDA12
	.align 2, 0
_080FD9EC: .4byte 0x02021C7C
_080FD9F0: .4byte 0x081AB969
_080FD9F4:
	ldr r1, _080FDA00
	ldr r2, _080FDA04
	adds r0, r5, #0
	bl DisplayItemMessageInBattlePyramid
	b _080FDA12
	.align 2, 0
_080FDA00: .4byte 0x085C9556
_080FDA04: .4byte 0x081C5F25
_080FDA08:
	ldr r2, _080FDA18
	adds r0, r5, #0
	adds r1, r6, #0
	bl DisplayItemMessageOnField
_080FDA12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FDA18: .4byte 0x080FDA4D
	thumb_func_end DisplayCannotUseItemMessage

	thumb_func_start DisplayDadsAdviceCannotUseItemMessage
DisplayDadsAdviceCannotUseItemMessage: @ 0x080FDA1C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080FDA30
	bl DisplayCannotUseItemMessage
	pop {r0}
	bx r0
	.align 2, 0
_080FDA30: .4byte 0x085C9556
	thumb_func_end DisplayDadsAdviceCannotUseItemMessage

	thumb_func_start DisplayCannotDismountBikeMessage
DisplayCannotDismountBikeMessage: @ 0x080FDA34
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080FDA48
	bl DisplayCannotUseItemMessage
	pop {r0}
	bx r0
	.align 2, 0
_080FDA48: .4byte 0x085C957F
	thumb_func_end DisplayCannotDismountBikeMessage

	thumb_func_start CleanUpAfterFailingToUseRegisteredKeyItemOnField
CleanUpAfterFailingToUseRegisteredKeyItemOnField: @ 0x080FDA4C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	adds r0, r4, #0
	bl DestroyTask
	bl ScriptUnfreezeEventObjects
	bl ScriptContext2_Disable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CleanUpAfterFailingToUseRegisteredKeyItemOnField

	thumb_func_start CheckIfItemIsTMHMOrEvolutionStone
CheckIfItemIsTMHMOrEvolutionStone: @ 0x080FDA70
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl sub_080D6DF8
	ldr r1, _080FDA88
	cmp r0, r1
	bne _080FDA8C
	movs r0, #1
	b _080FDAA2
	.align 2, 0
_080FDA88: .4byte 0x080FE79D
_080FDA8C:
	adds r0, r4, #0
	bl sub_080D6DF8
	ldr r1, _080FDA9C
	cmp r0, r1
	beq _080FDAA0
	movs r0, #0
	b _080FDAA2
	.align 2, 0
_080FDA9C: .4byte 0x080FEBC9
_080FDAA0:
	movs r0, #2
_080FDAA2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckIfItemIsTMHMOrEvolutionStone

	thumb_func_start sub_080FDAA8
sub_080FDAA8: @ 0x080FDAA8
	push {lr}
	sub sp, #0x24
	mov r1, sp
	ldr r0, _080FDAC4
	ldrh r0, [r0]
	strh r0, [r1, #0x20]
	ldr r1, _080FDAC8
	mov r0, sp
	movs r2, #0
	bl ReadMail
	add sp, #0x24
	pop {r0}
	bx r0
	.align 2, 0
_080FDAC4: .4byte 0x0203CB48
_080FDAC8: .4byte 0x081AD205
	thumb_func_end sub_080FDAA8

	thumb_func_start ItemUseOutOfBattle_Mail
ItemUseOutOfBattle_Mail: @ 0x080FDACC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080FDAE4
	ldr r2, [r1]
	ldr r1, _080FDAE8
	str r1, [r2]
	bl unknown_ItemMenu_Confirm
	pop {r0}
	bx r0
	.align 2, 0
_080FDAE4: .4byte 0x0203CB20
_080FDAE8: .4byte 0x080FDAA9
	thumb_func_end ItemUseOutOfBattle_Mail

	thumb_func_start ItemUseOutOfBattle_Bike
ItemUseOutOfBattle_Bike: @ 0x080FDAEC
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080FDB6C
	adds r6, r0, r1
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
	lsrs r4, r0, #0x18
	ldr r0, _080FDB70
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080FDB62
	adds r0, r4, #0
	bl MetatileBehavior_IsVerticalRail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080FDB62
	adds r0, r4, #0
	bl MetatileBehavior_IsHorizontalRail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080FDB62
	adds r0, r4, #0
	bl MetatileBehavior_IsIsolatedVerticalRail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080FDB62
	adds r0, r4, #0
	bl MetatileBehavior_IsIsolatedHorizontalRail
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FDB74
_080FDB62:
	ldrb r1, [r6, #6]
	adds r0, r5, #0
	bl DisplayCannotDismountBikeMessage
	b _080FDBA4
	.align 2, 0
_080FDB6C: .4byte 0x03005B68
_080FDB70: .4byte 0x0000088B
_080FDB74:
	bl Overworld_IsBikingAllowed
	cmp r0, #1
	bne _080FDB9C
	bl IsBikingDisallowedByPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FDB9C
	ldr r1, _080FDB94
	ldr r0, _080FDB98
	str r0, [r1]
	adds r0, r5, #0
	bl SetUpItemUseOnFieldCallback
	b _080FDBA4
	.align 2, 0
_080FDB94: .4byte 0x02039DC0
_080FDB98: .4byte 0x080FDBAD
_080FDB9C:
	ldrb r1, [r6, #6]
	adds r0, r5, #0
	bl DisplayDadsAdviceCannotUseItemMessage
_080FDBA4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ItemUseOutOfBattle_Bike

	thumb_func_start ItemUseOnFieldCB_Bike
ItemUseOnFieldCB_Bike: @ 0x080FDBAC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080FDBC8
	ldrh r0, [r0]
	bl sub_080D6E6C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FDBCC
	movs r0, #2
	bl GetOnOffBike
	b _080FDBD2
	.align 2, 0
_080FDBC8: .4byte 0x0203CB48
_080FDBCC:
	movs r0, #4
	bl GetOnOffBike
_080FDBD2:
	bl ScriptUnfreezeEventObjects
	bl ScriptContext2_Disable
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ItemUseOnFieldCB_Bike

	thumb_func_start CanFish
CanFish: @ 0x080FDBE8
	push {r4, r5, r6, lr}
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
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl MetatileBehavior_IsWaterfall
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FDC70
	movs r0, #0x10
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FDC70
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FDC40
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FDC70
_080FDC3C:
	movs r0, #1
	b _080FDC72
_080FDC40:
	adds r0, r5, #0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FDC60
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridIsImpassableAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FDC3C
_080FDC60:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_8089510
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080FDC3C
_080FDC70:
	movs r0, #0
_080FDC72:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanFish

	thumb_func_start ItemUseOutOfBattle_Rod
ItemUseOutOfBattle_Rod: @ 0x080FDC7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl CanFish
	cmp r0, #1
	bne _080FDCA0
	ldr r1, _080FDC98
	ldr r0, _080FDC9C
	str r0, [r1]
	adds r0, r4, #0
	bl SetUpItemUseOnFieldCallback
	b _080FDCB2
	.align 2, 0
_080FDC98: .4byte 0x02039DC0
_080FDC9C: .4byte 0x080FDCBD
_080FDCA0:
	ldr r0, _080FDCB8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r1, [r1, #0xe]
	adds r0, r4, #0
	bl DisplayDadsAdviceCannotUseItemMessage
_080FDCB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FDCB8: .4byte 0x03005B60
	thumb_func_end ItemUseOutOfBattle_Rod

	thumb_func_start ItemUseOnFieldCB_Rod
ItemUseOnFieldCB_Rod: @ 0x080FDCBC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080FDCE0
	ldrh r0, [r0]
	bl sub_080D6E6C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl StartFishing
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FDCE0: .4byte 0x0203CB48
	thumb_func_end ItemUseOnFieldCB_Rod

	thumb_func_start ItemUseOutOfBattle_Itemfinder
ItemUseOutOfBattle_Itemfinder: @ 0x080FDCE4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x27
	bl IncrementGameStat
	ldr r1, _080FDD04
	ldr r0, _080FDD08
	str r0, [r1]
	adds r0, r4, #0
	bl SetUpItemUseOnFieldCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FDD04: .4byte 0x02039DC0
_080FDD08: .4byte 0x080FDD0D
	thumb_func_end ItemUseOutOfBattle_Itemfinder

	thumb_func_start ItemUseOnFieldCB_Itemfinder
ItemUseOnFieldCB_Itemfinder: @ 0x080FDD0C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080FDD34
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl ItemfinderCheckForHiddenItems
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FDD40
	ldr r0, _080FDD38
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080FDD3C
	str r0, [r1]
	b _080FDD4A
	.align 2, 0
_080FDD34: .4byte 0x02036FB8
_080FDD38: .4byte 0x03005B60
_080FDD3C: .4byte 0x080FDD59
_080FDD40:
	ldr r1, _080FDD50
	ldr r2, _080FDD54
	adds r0, r4, #0
	bl DisplayItemMessageOnField
_080FDD4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FDD50: .4byte 0x085C95D3
_080FDD54: .4byte 0x080FDE21
	thumb_func_end ItemUseOnFieldCB_Itemfinder

	thumb_func_start sub_080FDD58
sub_080FDD58: @ 0x080FDD58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r6, r5, #2
	adds r0, r6, r5
	lsls r7, r0, #3
	ldr r0, _080FDDAC
	mov r8, r0
	adds r4, r7, r0
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080FDE0C
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #4
	bne _080FDE00
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl sub_080FE204
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080FDDB8
	ldr r1, _080FDDB0
	subs r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_080FE278
	mov r0, r8
	subs r0, #8
	adds r0, r7, r0
	ldr r1, _080FDDB4
	str r1, [r0]
	b _080FDE16
	.align 2, 0
_080FDDAC: .4byte 0x03005B68
_080FDDB0: .4byte 0x0856DCC8
_080FDDB4: .4byte 0x080FE2E9
_080FDDB8:
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	adds r3, r6, #0
	ldr r7, _080FDDF4
	movs r6, #3
_080FDDC8:
	adds r0, r1, r7
	adds r1, #1
	ldrb r0, [r0]
	cmp r2, r0
	bne _080FDDD8
	adds r0, r1, #0
	ands r0, r6
	strh r0, [r4, #0xa]
_080FDDD8:
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080FDDC8
	ldr r1, _080FDDF8
	adds r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080FDDFC
	str r1, [r0]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r4, #4]
	b _080FDE16
	.align 2, 0
_080FDDF4: .4byte 0x0856DCC8
_080FDDF8: .4byte 0x03005B60
_080FDDFC: .4byte 0x080FE331
_080FDE00:
	movs r0, #0x48
	bl PlaySE
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080FDE0C:
	ldrh r0, [r4, #6]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r4, #6]
_080FDE16:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080FDD58

	thumb_func_start sub_080FDE20
sub_080FDE20: @ 0x080FDE20
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #1
	bl DrawDialogueFrame
	bl ScriptUnfreezeEventObjects
	bl ScriptContext2_Disable
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080FDE20

	thumb_func_start ItemfinderCheckForHiddenItems
ItemfinderCheckForHiddenItems: @ 0x080FDE44
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	ldr r1, _080FDF14
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	movs r3, #0
	mov sb, r4
	ldrb r0, [r5, #3]
	cmp r3, r0
	bge _080FDEF8
	subs r1, #5
	mov r8, r1
_080FDE7C:
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	ldr r2, [r5, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r4, r0, #2
	adds r1, r4, r2
	ldrb r0, [r1, #5]
	adds r7, r3, #0
	cmp r0, #7
	bne _080FDEE8
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r1, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FDEE8
	ldr r1, [r5, #0x10]
	adds r1, r4, r1
	ldrh r2, [r1]
	adds r2, #7
	mov r0, sp
	ldrh r0, [r0]
	subs r2, r2, r0
	ldrh r0, [r1, #2]
	adds r0, #7
	mov r3, sb
	ldrh r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	movs r3, #0xe0
	lsls r3, r3, #0xb
	adds r2, r2, r3
	lsrs r2, r2, #0x10
	cmp r2, #0xe
	bhi _080FDEE8
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, r8
	blt _080FDEE8
	cmp r2, #5
	bgt _080FDEE8
	adds r0, r6, #0
	bl sub_080FE134
_080FDEE8:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r7, r1
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	ldrb r2, [r5, #3]
	cmp r0, r2
	blt _080FDE7C
_080FDEF8:
	adds r0, r6, #0
	bl sub_080FE01C
	ldr r0, _080FDF14
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #1
	beq _080FDF18
	movs r0, #0
	b _080FDF1A
	.align 2, 0
_080FDF14: .4byte 0x03005B60
_080FDF18:
	movs r0, #1
_080FDF1A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end ItemfinderCheckForHiddenItems

	thumb_func_start sub_080FDF28
sub_080FDF28: @ 0x080FDF28
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldrb r2, [r0, #3]
	ldr r5, [r0, #0x10]
	movs r1, #0
	cmp r1, r2
	bge _080FDF7C
	lsls r0, r3, #0x10
	asrs r6, r0, #0x10
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	adds r3, r5, #0
_080FDF46:
	ldrb r0, [r3, #5]
	cmp r0, #7
	bne _080FDF74
	ldrh r0, [r3]
	cmp r6, r0
	bne _080FDF74
	ldrh r0, [r3, #2]
	cmp r4, r0
	bne _080FDF74
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r3, [r3, #0xa]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FDF7C
	movs r0, #1
	b _080FDF7E
_080FDF74:
	adds r3, #0xc
	adds r1, #1
	cmp r1, r2
	blt _080FDF46
_080FDF7C:
	movs r0, #0
_080FDF7E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080FDF28

	thumb_func_start sub_080FDF84
sub_080FDF84: @ 0x080FDF84
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl mapconnection_get_mapheader
	adds r3, r0, #0
	ldrb r0, [r4]
	cmp r0, #2
	beq _080FDFAC
	cmp r0, #2
	bgt _080FDFA2
	cmp r0, #1
	beq _080FDFC0
	b _080FE000
_080FDFA2:
	cmp r0, #3
	beq _080FDFD8
	cmp r0, #4
	beq _080FDFE2
	b _080FE000
_080FDFAC:
	ldr r0, [r4, #4]
	adds r0, #7
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, [r3]
	ldr r0, [r0, #4]
	subs r0, #7
	adds r0, r0, r6
	b _080FDFF6
_080FDFC0:
	ldr r0, [r4, #4]
	adds r0, #7
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080FDFD4
	ldr r0, [r0]
	ldr r0, [r0, #4]
	b _080FDFF2
	.align 2, 0
_080FDFD4: .4byte 0x02036FB8
_080FDFD8:
	ldr r0, [r3]
	ldr r0, [r0]
	subs r0, #7
	adds r0, r0, r5
	b _080FDFEC
_080FDFE2:
	ldr r0, _080FDFFC
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #7
	subs r0, r5, r0
_080FDFEC:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, [r4, #4]
_080FDFF2:
	adds r0, #7
	subs r0, r6, r0
_080FDFF6:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080FE004
	.align 2, 0
_080FDFFC: .4byte 0x02036FB8
_080FE000:
	movs r0, #0
	b _080FE016
_080FE004:
	ldr r0, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080FDF28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080FE016:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080FDF84

	thumb_func_start sub_080FE01C
sub_080FE01C: @ 0x080FE01C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, _080FE130
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r1, #4]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	mov r1, sp
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r1, #7
	cmp r0, r1
	bgt _080FE120
_080FE06A:
	mov r5, sp
	ldrh r0, [r5, #2]
	subs r0, #5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	movs r6, #2
	ldrsh r0, [r5, r6]
	adds r0, #5
	lsls r3, r3, #0x10
	mov r8, r3
	cmp r1, r0
	bgt _080FE10A
	movs r0, #7
	str r0, [sp, #0x10]
	mov r1, r8
	asrs r1, r1, #0x10
	mov sb, r1
	mov sl, r0
_080FE092:
	ldr r3, [sp, #0x10]
	cmp r3, sb
	bgt _080FE0B4
	ldr r5, [sp, #8]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp sb, r0
	bge _080FE0B4
	asrs r1, r2, #0x10
	cmp sl, r1
	bgt _080FE0B4
	ldr r6, [sp, #0xc]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r7, r4, #0x10
	cmp r1, r0
	blt _080FE0F2
_080FE0B4:
	mov r0, r8
	asrs r5, r0, #0x10
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080883F0
	adds r7, r4, #0
	cmp r0, #0
	beq _080FE0F2
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080FDF84
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FE0F2
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r5, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r0, #2]
	subs r2, r6, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, [sp, #4]
	bl sub_080FE134
_080FE0F2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r7, r1
	lsrs r4, r0, #0x10
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	mov r3, sp
	movs r5, #2
	ldrsh r0, [r3, r5]
	adds r0, #5
	cmp r1, r0
	ble _080FE092
_080FE10A:
	movs r1, #0x80
	lsls r1, r1, #9
	add r1, r8
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sp
	movs r6, #0
	ldrsh r0, [r0, r6]
	adds r0, #7
	cmp r1, r0
	ble _080FE06A
_080FE120:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE130: .4byte 0x02036FB8
	thumb_func_end sub_080FE01C

	thumb_func_start sub_080FE134
sub_080FE134: @ 0x080FE134
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov ip, r2
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080FE168
	adds r3, r1, r0
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _080FE16C
	strh r7, [r3]
	mov r0, ip
	strh r0, [r3, #2]
	movs r0, #1
	strh r0, [r3, #4]
	b _080FE1F6
	.align 2, 0
_080FE168: .4byte 0x03005B68
_080FE16C:
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080FE17C
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _080FE17E
_080FE17C:
	ldrh r4, [r3]
_080FE17E:
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldrh r1, [r3, #2]
	mov sb, r1
	cmp r0, #0
	bge _080FE192
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080FE194
_080FE192:
	ldrh r2, [r3, #2]
_080FE194:
	lsls r1, r7, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _080FE1A4
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _080FE1A6
_080FE1A4:
	lsrs r6, r1, #0x10
_080FE1A6:
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	mov r8, r0
	cmp r1, #0
	bge _080FE1B8
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	b _080FE1BA
_080FE1B8:
	mov r0, r8
_080FE1BA:
	lsrs r5, r0, #0x10
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	asrs r2, r1, #0x10
	adds r4, r0, r2
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r1
	cmp r4, r0
	ble _080FE1DC
	strh r7, [r3]
	mov r1, ip
	strh r1, [r3, #2]
	b _080FE1F6
_080FE1DC:
	cmp r4, r0
	bne _080FE1F6
	cmp r2, r1
	bgt _080FE1F0
	cmp r2, r1
	bne _080FE1F6
	mov r1, sb
	lsls r0, r1, #0x10
	cmp r0, r8
	bge _080FE1F6
_080FE1F0:
	strh r7, [r3]
	mov r0, ip
	strh r0, [r3, #2]
_080FE1F6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080FE134

	thumb_func_start sub_080FE204
sub_080FE204: @ 0x080FE204
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bne _080FE216
	cmp r1, #0
	beq _080FE270
_080FE216:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	cmp r2, #0
	bge _080FE228
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _080FE22A
_080FE228:
	lsrs r4, r5, #0x10
_080FE22A:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r1, r0, #0
	cmp r2, #0
	bge _080FE23C
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _080FE23E
_080FE23C:
	lsrs r3, r1, #0x10
_080FE23E:
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	ble _080FE256
	cmp r5, #0
	bge _080FE252
	movs r0, #4
	b _080FE272
_080FE252:
	movs r0, #2
	b _080FE272
_080FE256:
	cmp r2, r0
	bge _080FE260
	cmp r1, #0
	blt _080FE268
	b _080FE26C
_080FE260:
	cmp r2, r0
	bne _080FE270
	cmp r1, #0
	bge _080FE26C
_080FE268:
	movs r0, #1
	b _080FE272
_080FE26C:
	movs r0, #3
	b _080FE272
_080FE270:
	movs r0, #0
_080FE272:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080FE204

	thumb_func_start sub_080FE278
sub_080FE278: @ 0x080FE278
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080FE2E4
	adds r0, r0, r4
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl EventObjectClearHeldMovement
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl UnfreezeEventObject
	adds r0, r5, #0
	bl PlayerTurnInPlace
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE2E4: .4byte 0x02036FF0
	thumb_func_end sub_080FE278

	thumb_func_start sub_080FE2E8
sub_080FE2E8: @ 0x080FE2E8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080FE324
	adds r0, r0, r1
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FE31E
	ldr r1, _080FE328
	ldr r2, _080FE32C
	adds r0, r4, #0
	bl DisplayItemMessageOnField
_080FE31E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE324: .4byte 0x02036FF0
_080FE328: .4byte 0x085C958E
_080FE32C: .4byte 0x080FDE21
	thumb_func_end sub_080FE2E8

	thumb_func_start sub_080FE330
sub_080FE330: @ 0x080FE330
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080FE3AC
	adds r4, r0, r1
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080FE3B0
	adds r0, r0, r1
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080FE370
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080FE3A4
_080FE370:
	ldr r1, _080FE3B4
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_080FE278
	movs r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _080FE3A4
	ldr r1, _080FE3B8
	ldr r2, _080FE3BC
	adds r0, r5, #0
	bl DisplayItemMessageOnField
_080FE3A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE3AC: .4byte 0x03005B68
_080FE3B0: .4byte 0x02036FF0
_080FE3B4: .4byte 0x0856DCC8
_080FE3B8: .4byte 0x085C95B6
_080FE3BC: .4byte 0x080FDE21
	thumb_func_end sub_080FE330

	thumb_func_start ItemUseOutOfBattle_PokeblockCase
ItemUseOutOfBattle_PokeblockCase: @ 0x080FE3C0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081221B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FE3EC
	ldr r0, _080FE3E8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r1, [r1, #0xe]
	adds r0, r4, #0
	bl DisplayDadsAdviceCannotUseItemMessage
	b _080FE42E
	.align 2, 0
_080FE3E8: .4byte 0x03005B60
_080FE3EC:
	ldr r0, _080FE410
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r5, r1, r0
	movs r1, #0xe
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _080FE41C
	ldr r0, _080FE414
	ldr r1, [r0]
	ldr r0, _080FE418
	str r0, [r1]
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	b _080FE42E
	.align 2, 0
_080FE410: .4byte 0x03005B60
_080FE414: .4byte 0x0203CB20
_080FE418: .4byte 0x080FE441
_080FE41C:
	ldr r0, _080FE434
	ldr r1, _080FE438
	str r1, [r0]
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	ldr r0, _080FE43C
	str r0, [r5]
_080FE42E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE434: .4byte 0x03005B0C
_080FE438: .4byte 0x080AEFD1
_080FE43C: .4byte 0x080FE455
	thumb_func_end ItemUseOutOfBattle_PokeblockCase

	thumb_func_start sub_080FE440
sub_080FE440: @ 0x080FE440
	push {lr}
	ldr r1, _080FE450
	movs r0, #0
	bl sub_08135850
	pop {r0}
	bx r0
	.align 2, 0
_080FE450: .4byte 0x081AD205
	thumb_func_end sub_080FE440

	thumb_func_start sub_080FE454
sub_080FE454: @ 0x080FE454
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080FE480
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080FE478
	bl CleanupOverworldWindowsAndTilemaps
	ldr r1, _080FE484
	movs r0, #0
	bl sub_08135850
	adds r0, r4, #0
	bl DestroyTask
_080FE478:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE480: .4byte 0x02037C74
_080FE484: .4byte 0x08085A31
	thumb_func_end sub_080FE454

	thumb_func_start ItemUseOutOfBattle_CoinCase
ItemUseOutOfBattle_CoinCase: @ 0x080FE488
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080FE4D0
	bl GetCoins
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r4, _080FE4D4
	ldr r1, _080FE4D8
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r1, _080FE4DC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080FE4E4
	ldr r3, _080FE4E0
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl DisplayItemMessage
	b _080FE4EE
	.align 2, 0
_080FE4D0: .4byte 0x02021C40
_080FE4D4: .4byte 0x02021C7C
_080FE4D8: .4byte 0x085C95F0
_080FE4DC: .4byte 0x03005B60
_080FE4E0: .4byte 0x081AB969
_080FE4E4:
	ldr r2, _080FE4F4
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
_080FE4EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE4F4: .4byte 0x080FDA4D
	thumb_func_end ItemUseOutOfBattle_CoinCase

	thumb_func_start ItemUseOutOfBattle_PowderJar
ItemUseOutOfBattle_PowderJar: @ 0x080FE4F8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080FE53C
	bl GetBerryPowder
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #5
	bl ConvertIntToDecimalStringN
	ldr r4, _080FE540
	ldr r1, _080FE544
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r1, _080FE548
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080FE550
	ldr r3, _080FE54C
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl DisplayItemMessage
	b _080FE55A
	.align 2, 0
_080FE53C: .4byte 0x02021C40
_080FE540: .4byte 0x02021C7C
_080FE544: .4byte 0x085C96CE
_080FE548: .4byte 0x03005B60
_080FE54C: .4byte 0x081AB969
_080FE550:
	ldr r2, _080FE560
	adds r0, r5, #0
	adds r1, r4, #0
	bl DisplayItemMessageOnField
_080FE55A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE560: .4byte 0x080FDA4D
	thumb_func_end ItemUseOutOfBattle_PowderJar

	thumb_func_start sub_080FE564
sub_080FE564: @ 0x080FE564
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsPlayerFacingEmptyBerryTreePatch
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FE5AC
	ldr r1, _080FE594
	ldr r0, _080FE598
	str r0, [r1]
	ldr r1, _080FE59C
	ldr r0, _080FE5A0
	str r0, [r1]
	ldr r0, _080FE5A4
	ldr r1, [r0]
	ldr r0, _080FE5A8
	str r0, [r1]
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	b _080FE5BC
	.align 2, 0
_080FE594: .4byte 0x02039DC0
_080FE598: .4byte 0x080FE5C9
_080FE59C: .4byte 0x03005B0C
_080FE5A0: .4byte 0x080FD979
_080FE5A4: .4byte 0x0203CB20
_080FE5A8: .4byte 0x08085A31
_080FE5AC:
	ldr r0, _080FE5C4
	ldrh r0, [r0]
	bl sub_080D6DF8
	adds r1, r0, #0
	adds r0, r4, #0
	bl _call_via_r1
_080FE5BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE5C4: .4byte 0x0203CB48
	thumb_func_end sub_080FE564

	thumb_func_start sub_080FE5C8
sub_080FE5C8: @ 0x080FE5C8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080FE5F0
	ldrh r0, [r0]
	movs r1, #1
	bl RemoveBagItem
	bl ScriptContext2_Enable
	ldr r0, _080FE5F4
	bl ScriptContext1_SetupScript
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE5F0: .4byte 0x0203CB48
_080FE5F4: .4byte 0x08244E9D
	thumb_func_end sub_080FE5C8

	thumb_func_start ItemUseOutOfBattle_WailmerPail
ItemUseOutOfBattle_WailmerPail: @ 0x080FE5F8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl sub_080FE680
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FE61C
	ldr r1, _080FE614
	ldr r0, _080FE618
	b _080FE62C
	.align 2, 0
_080FE614: .4byte 0x02039DC0
_080FE618: .4byte 0x080FE6D1
_080FE61C:
	bl TryToWaterBerryTree
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FE640
	ldr r1, _080FE638
	ldr r0, _080FE63C
_080FE62C:
	str r0, [r1]
	adds r0, r4, #0
	bl SetUpItemUseOnFieldCallback
	b _080FE652
	.align 2, 0
_080FE638: .4byte 0x02039DC0
_080FE63C: .4byte 0x080FE65D
_080FE640:
	ldr r0, _080FE658
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r1, [r1, #0xe]
	adds r0, r5, #0
	bl DisplayDadsAdviceCannotUseItemMessage
_080FE652:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE658: .4byte 0x03005B60
	thumb_func_end ItemUseOutOfBattle_WailmerPail

	thumb_func_start sub_080FE65C
sub_080FE65C: @ 0x080FE65C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ScriptContext2_Enable
	ldr r0, _080FE67C
	bl ScriptContext1_SetupScript
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE67C: .4byte 0x08244ED8
	thumb_func_end sub_080FE65C

	thumb_func_start sub_080FE680
sub_080FE680: @ 0x080FE680
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	bl PlayerGetZCoord
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrh r0, [r0]
	ldrh r1, [r4]
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x10
	beq _080FE6BC
	ldr r0, _080FE6C0
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #5]
	cmp r0, #0xe4
	beq _080FE6C4
_080FE6BC:
	movs r0, #0
	b _080FE6C6
	.align 2, 0
_080FE6C0: .4byte 0x02036FF0
_080FE6C4:
	movs r0, #1
_080FE6C6:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080FE680

	thumb_func_start sub_080FE6D0
sub_080FE6D0: @ 0x080FE6D0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ScriptContext2_Enable
	ldr r0, _080FE6F0
	bl ScriptContext1_SetupScript
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE6F0: .4byte 0x08222A99
	thumb_func_end sub_080FE6D0

	thumb_func_start ItemUseOutOfBattle_Medicine
ItemUseOutOfBattle_Medicine: @ 0x080FE6F4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FE708
	ldr r1, _080FE70C
	str r1, [r2]
	bl SetUpItemUseCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FE708: .4byte 0x03006068
_080FE70C: .4byte 0x081B6229
	thumb_func_end ItemUseOutOfBattle_Medicine

	thumb_func_start ItemUseOutOfBattle_ReduceEV
ItemUseOutOfBattle_ReduceEV: @ 0x080FE710
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FE724
	ldr r1, _080FE728
	str r1, [r2]
	bl SetUpItemUseCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FE724: .4byte 0x03006068
_080FE728: .4byte 0x081B6469
	thumb_func_end ItemUseOutOfBattle_ReduceEV

	thumb_func_start ItemUseOutOfBattle_SacredAsh
ItemUseOutOfBattle_SacredAsh: @ 0x080FE72C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FE740
	ldr r1, _080FE744
	str r1, [r2]
	bl SetUpItemUseCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FE740: .4byte 0x03006068
_080FE744: .4byte 0x081B768D
	thumb_func_end ItemUseOutOfBattle_SacredAsh

	thumb_func_start ItemUseOutOfBattle_PPRecovery
ItemUseOutOfBattle_PPRecovery: @ 0x080FE748
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FE75C
	ldr r1, _080FE760
	str r1, [r2]
	bl SetUpItemUseCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FE75C: .4byte 0x03006068
_080FE760: .4byte 0x081B67C5
	thumb_func_end ItemUseOutOfBattle_PPRecovery

	thumb_func_start ItemUseOutOfBattle_PPUp
ItemUseOutOfBattle_PPUp: @ 0x080FE764
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FE778
	ldr r1, _080FE77C
	str r1, [r2]
	bl SetUpItemUseCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FE778: .4byte 0x03006068
_080FE77C: .4byte 0x081B6979
	thumb_func_end ItemUseOutOfBattle_PPUp

	thumb_func_start ItemUseOutOfBattle_RareCandy
ItemUseOutOfBattle_RareCandy: @ 0x080FE780
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FE794
	ldr r1, _080FE798
	str r1, [r2]
	bl SetUpItemUseCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FE794: .4byte 0x03006068
_080FE798: .4byte 0x081B70B1
	thumb_func_end ItemUseOutOfBattle_RareCandy

	thumb_func_start ItemUseOutOfBattle_TMHM
ItemUseOutOfBattle_TMHM: @ 0x080FE79C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080FE7BC
	ldrh r1, [r0]
	movs r0, #0xa9
	lsls r0, r0, #1
	cmp r1, r0
	bls _080FE7C8
	ldr r2, _080FE7C0
	ldr r3, _080FE7C4
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
	b _080FE7D4
	.align 2, 0
_080FE7BC: .4byte 0x0203CB48
_080FE7C0: .4byte 0x085C960E
_080FE7C4: .4byte 0x080FE7E5
_080FE7C8:
	ldr r2, _080FE7DC
	ldr r3, _080FE7E0
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
_080FE7D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE7DC: .4byte 0x085C9600
_080FE7E0: .4byte 0x080FE7E5
	thumb_func_end ItemUseOutOfBattle_TMHM

	thumb_func_start sub_080FE7E4
sub_080FE7E4: @ 0x080FE7E4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	bl PlaySE
	ldr r1, _080FE808
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080FE80C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE808: .4byte 0x03005B60
_080FE80C: .4byte 0x080FE811
	thumb_func_end sub_080FE7E4

	thumb_func_start task08_0809AD8C
task08_0809AD8C: @ 0x080FE810
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080FE858
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080FE852
	ldr r4, _080FE85C
	ldr r0, _080FE860
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xd
	ldr r0, _080FE864
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	ldr r4, _080FE868
	ldr r1, _080FE86C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	ldr r3, _080FE870
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl DisplayItemMessage
_080FE852:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE858: .4byte 0x03002360
_080FE85C: .4byte 0x02021C40
_080FE860: .4byte 0x0203CB48
_080FE864: .4byte 0x082EACC4
_080FE868: .4byte 0x02021C7C
_080FE86C: .4byte 0x085C961D
_080FE870: .4byte 0x080FE875
	thumb_func_end task08_0809AD8C

	thumb_func_start sub_080FE874
sub_080FE874: @ 0x080FE874
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FE888
	movs r1, #6
	bl BagMenu_YesNo
	pop {r0}
	bx r0
	.align 2, 0
_080FE888: .4byte 0x0856DCCC
	thumb_func_end sub_080FE874

	thumb_func_start sub_080FE88C
sub_080FE88C: @ 0x080FE88C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FE8A0
	ldr r1, _080FE8A4
	str r1, [r2]
	bl SetUpItemUseCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FE8A0: .4byte 0x03006068
_080FE8A4: .4byte 0x081B6A7D
	thumb_func_end sub_080FE88C

	thumb_func_start sub_080FE8A8
sub_080FE8A8: @ 0x080FE8A8
	push {r4, lr}
	ldr r4, _080FE8EC
	ldrh r0, [r4]
	movs r1, #1
	bl RemoveBagItem
	ldrh r0, [r4]
	ldr r1, _080FE8F0
	bl CopyItemName
	ldr r0, _080FE8F4
	ldr r1, _080FE8F8
	bl StringExpandPlaceholders
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FE8FC
	ldrh r0, [r4]
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081AB754
	ldrh r0, [r4]
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetInitialScrollAndCursorPositions
	b _080FE904
	.align 2, 0
_080FE8EC: .4byte 0x0203CB48
_080FE8F0: .4byte 0x02021C54
_080FE8F4: .4byte 0x02021C7C
_080FE8F8: .4byte 0x085C9644
_080FE8FC:
	bl sub_081C5120
	bl sub_081C51B8
_080FE904:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080FE8A8

	thumb_func_start ItemUseOutOfBattle_Repel
ItemUseOutOfBattle_Repel: @ 0x080FE90C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r0, _080FE930
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080FE93C
	ldr r0, _080FE934
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080FE938
	str r0, [r1]
	b _080FE966
	.align 2, 0
_080FE930: .4byte 0x00004021
_080FE934: .4byte 0x03005B60
_080FE938: .4byte 0x080FE975
_080FE93C:
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FE95C
	ldr r2, _080FE954
	ldr r3, _080FE958
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
	b _080FE966
	.align 2, 0
_080FE954: .4byte 0x085C9654
_080FE958: .4byte 0x081AB969
_080FE95C:
	ldr r1, _080FE96C
	ldr r2, _080FE970
	adds r0, r5, #0
	bl DisplayItemMessageInBattlePyramid
_080FE966:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE96C: .4byte 0x085C9654
_080FE970: .4byte 0x081C5F25
	thumb_func_end ItemUseOutOfBattle_Repel

	thumb_func_start sub_080FE974
sub_080FE974: @ 0x080FE974
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r4, r1, #3
	ldr r5, _080FE9AC
	adds r1, r4, r5
	ldrh r0, [r1, #0x10]
	adds r0, #1
	strh r0, [r1, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080FE9A6
	movs r0, #0
	strh r0, [r1, #0x10]
	movs r0, #0x2f
	bl PlaySE
	adds r0, r5, #0
	subs r0, #8
	adds r0, r4, r0
	ldr r1, _080FE9B0
	str r1, [r0]
_080FE9A6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE9AC: .4byte 0x03005B68
_080FE9B0: .4byte 0x080FE9B5
	thumb_func_end sub_080FE974

	thumb_func_start sub_080FE9B4
sub_080FE9B4: @ 0x080FE9B4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEA12
	ldr r4, _080FE9F8
	ldr r0, _080FE9FC
	ldrh r0, [r0]
	bl sub_080D6D1C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl VarSet
	bl sub_080FE8A8
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEA08
	ldr r2, _080FEA00
	ldr r3, _080FEA04
	adds r0, r5, #0
	movs r1, #1
	bl DisplayItemMessage
	b _080FEA12
	.align 2, 0
_080FE9F8: .4byte 0x00004021
_080FE9FC: .4byte 0x0203CB48
_080FEA00: .4byte 0x02021C7C
_080FEA04: .4byte 0x081AB969
_080FEA08:
	ldr r1, _080FEA18
	ldr r2, _080FEA1C
	adds r0, r6, #0
	bl DisplayItemMessageInBattlePyramid
_080FEA12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FEA18: .4byte 0x02021C7C
_080FEA1C: .4byte 0x081C5F25
	thumb_func_end sub_080FE9B4

	thumb_func_start sub_080FEA20
sub_080FEA20: @ 0x080FEA20
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r0, _080FEA60
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080FEA76
	movs r0, #0x75
	bl PlaySE
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEA6C
	ldr r2, _080FEA64
	ldr r3, _080FEA68
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
	b _080FEA76
	.align 2, 0
_080FEA60: .4byte 0x03005B60
_080FEA64: .4byte 0x02021C7C
_080FEA68: .4byte 0x081AB969
_080FEA6C:
	ldr r1, _080FEA7C
	ldr r2, _080FEA80
	adds r0, r5, #0
	bl DisplayItemMessageInBattlePyramid
_080FEA76:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FEA7C: .4byte 0x02021C7C
_080FEA80: .4byte 0x081C5F25
	thumb_func_end sub_080FEA20

	thumb_func_start ItemUseOutOfBattle_BlackWhiteFlute
ItemUseOutOfBattle_BlackWhiteFlute: @ 0x080FEA84
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _080FEAB0
	ldrh r0, [r4]
	ldr r1, _080FEAB4
	bl CopyItemName
	ldrh r0, [r4]
	cmp r0, #0x2b
	bne _080FEAC8
	ldr r0, _080FEAB8
	bl FlagSet
	ldr r0, _080FEABC
	bl FlagClear
	ldr r0, _080FEAC0
	ldr r1, _080FEAC4
	bl StringExpandPlaceholders
	b _080FEADC
	.align 2, 0
_080FEAB0: .4byte 0x0203CB48
_080FEAB4: .4byte 0x02021C54
_080FEAB8: .4byte 0x000008AD
_080FEABC: .4byte 0x000008AE
_080FEAC0: .4byte 0x02021C7C
_080FEAC4: .4byte 0x085C9675
_080FEAC8:
	ldr r0, _080FEAF4
	bl FlagSet
	ldr r0, _080FEAF8
	bl FlagClear
	ldr r0, _080FEAFC
	ldr r1, _080FEB00
	bl StringExpandPlaceholders
_080FEADC:
	ldr r1, _080FEB04
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x18]
	ldr r1, _080FEB08
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FEAF4: .4byte 0x000008AE
_080FEAF8: .4byte 0x000008AD
_080FEAFC: .4byte 0x02021C7C
_080FEB00: .4byte 0x085C9699
_080FEB04: .4byte 0x03005B60
_080FEB08: .4byte 0x080FEA21
	thumb_func_end ItemUseOutOfBattle_BlackWhiteFlute

	thumb_func_start task08_080A1C44
task08_080A1C44: @ 0x080FEB0C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ResetInitialPlayerAvatarState
	bl StartEscapeRopeFieldEffect
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task08_080A1C44

	thumb_func_start re_escape_rope
re_escape_rope: @ 0x080FEB28
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Overworld_ResetStateAfterFly
	bl sub_080FE8A8
	ldr r1, _080FEB58
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	ldr r1, _080FEB5C
	ldr r2, _080FEB60
	adds r0, r4, #0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEB58: .4byte 0x03005B60
_080FEB5C: .4byte 0x02021C7C
_080FEB60: .4byte 0x080FEB0D
	thumb_func_end re_escape_rope

	thumb_func_start CanUseEscapeRopeOnCurrMap
CanUseEscapeRopeOnCurrMap: @ 0x080FEB64
	push {lr}
	ldr r0, _080FEB78
	ldrb r1, [r0, #0x1a]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080FEB7C
	movs r0, #0
	b _080FEB7E
	.align 2, 0
_080FEB78: .4byte 0x02036FB8
_080FEB7C:
	movs r0, #1
_080FEB7E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanUseEscapeRopeOnCurrMap

	thumb_func_start ItemUseOutOfBattle_EscapeRope
ItemUseOutOfBattle_EscapeRope: @ 0x080FEB84
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl CanUseEscapeRopeOnCurrMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FEBAC
	ldr r1, _080FEBA4
	ldr r0, _080FEBA8
	str r0, [r1]
	adds r0, r4, #0
	bl SetUpItemUseOnFieldCallback
	b _080FEBBE
	.align 2, 0
_080FEBA4: .4byte 0x02039DC0
_080FEBA8: .4byte 0x080FEB29
_080FEBAC:
	ldr r0, _080FEBC4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r1, [r1, #0xe]
	adds r0, r4, #0
	bl DisplayDadsAdviceCannotUseItemMessage
_080FEBBE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEBC4: .4byte 0x03005B60
	thumb_func_end ItemUseOutOfBattle_EscapeRope

	thumb_func_start ItemUseOutOfBattle_EvolutionStone
ItemUseOutOfBattle_EvolutionStone: @ 0x080FEBC8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FEBDC
	ldr r1, _080FEBE0
	str r1, [r2]
	bl SetUpItemUseCallback
	pop {r0}
	bx r0
	.align 2, 0
_080FEBDC: .4byte 0x03006068
_080FEBE0: .4byte 0x081B7919
	thumb_func_end ItemUseOutOfBattle_EvolutionStone

	thumb_func_start ItemUseInBattle_PokeBall
ItemUseInBattle_PokeBall: @ 0x080FEBE4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl IsPlayerPartyAndPokemonStorageFull
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEC20
	ldr r0, _080FEC14
	ldrh r0, [r0]
	movs r1, #1
	bl RemoveBagItem
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEC18
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	b _080FEC4A
	.align 2, 0
_080FEC14: .4byte 0x0203CB48
_080FEC18:
	adds r0, r4, #0
	bl sub_081C5310
	b _080FEC4A
_080FEC20:
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEC40
	ldr r2, _080FEC38
	ldr r3, _080FEC3C
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
	b _080FEC4A
	.align 2, 0
_080FEC38: .4byte 0x085C96BD
_080FEC3C: .4byte 0x081AB969
_080FEC40:
	ldr r1, _080FEC50
	ldr r2, _080FEC54
	adds r0, r5, #0
	bl DisplayItemMessageInBattlePyramid
_080FEC4A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FEC50: .4byte 0x085C96BD
_080FEC54: .4byte 0x081C5F25
	thumb_func_end ItemUseInBattle_PokeBall

	thumb_func_start sub_080FEC58
sub_080FEC58: @ 0x080FEC58
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r0, _080FEC80
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080FEC8A
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEC84
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	b _080FEC8A
	.align 2, 0
_080FEC80: .4byte 0x03002360
_080FEC84:
	adds r0, r5, #0
	bl sub_081C5310
_080FEC8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080FEC58

	thumb_func_start sub_080FEC90
sub_080FEC90: @ 0x080FEC90
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	ldr r0, _080FECE0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080FECFC
	movs r0, #1
	bl PlaySE
	ldr r4, _080FECE4
	ldrh r0, [r4]
	movs r1, #1
	bl RemoveBagItem
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FECEC
	ldrh r0, [r4]
	bl sub_0806CA3C
	adds r2, r0, #0
	ldr r3, _080FECE8
	adds r0, r5, #0
	movs r1, #1
	bl DisplayItemMessage
	b _080FECFC
	.align 2, 0
_080FECE0: .4byte 0x03005B60
_080FECE4: .4byte 0x0203CB48
_080FECE8: .4byte 0x080FEC59
_080FECEC:
	ldrh r0, [r4]
	bl sub_0806CA3C
	adds r1, r0, #0
	ldr r2, _080FED04
	adds r0, r6, #0
	bl DisplayItemMessageInBattlePyramid
_080FECFC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FED04: .4byte 0x080FEC59
	thumb_func_end sub_080FEC90

	thumb_func_start ItemUseInBattle_StatIncrease
ItemUseInBattle_StatIncrease: @ 0x080FED08
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080FED50
	ldr r0, _080FED54
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, _080FED58
	adds r0, r0, r1
	ldr r1, _080FED5C
	ldrh r1, [r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #0
	bl ExecuteTableBasedItemEffect
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _080FED7C
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FED68
	ldr r2, _080FED60
	ldr r3, _080FED64
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
	b _080FED8C
	.align 2, 0
_080FED50: .4byte 0x02023D12
_080FED54: .4byte 0x0202415C
_080FED58: .4byte 0x02024190
_080FED5C: .4byte 0x0203CB48
_080FED60: .4byte 0x085C9AF7
_080FED64: .4byte 0x081AB969
_080FED68:
	ldr r1, _080FED74
	ldr r2, _080FED78
	adds r0, r4, #0
	bl DisplayItemMessageInBattlePyramid
	b _080FED8C
	.align 2, 0
_080FED74: .4byte 0x085C9AF7
_080FED78: .4byte 0x081C5F25
_080FED7C:
	ldr r0, _080FED94
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080FED98
	str r0, [r1]
	strh r2, [r1, #0x18]
_080FED8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FED94: .4byte 0x03005B60
_080FED98: .4byte 0x080FEC91
	thumb_func_end ItemUseInBattle_StatIncrease

	thumb_func_start sub_080FED9C
sub_080FED9C: @ 0x080FED9C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEDC4
	ldr r0, _080FEDBC
	ldr r1, [r0]
	ldr r0, _080FEDC0
	str r0, [r1]
	adds r0, r4, #0
	bl unknown_ItemMenu_Confirm
	b _080FEDD2
	.align 2, 0
_080FEDBC: .4byte 0x0203CB20
_080FEDC0: .4byte 0x081B8691
_080FEDC4:
	ldr r0, _080FEDD8
	ldr r1, [r0]
	ldr r0, _080FEDDC
	str r0, [r1]
	adds r0, r4, #0
	bl sub_081C5310
_080FEDD2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEDD8: .4byte 0x0203CBF8
_080FEDDC: .4byte 0x081B8691
	thumb_func_end sub_080FED9C

	thumb_func_start ItemUseInBattle_Medicine
ItemUseInBattle_Medicine: @ 0x080FEDE0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FEDF4
	ldr r1, _080FEDF8
	str r1, [r2]
	bl sub_080FED9C
	pop {r0}
	bx r0
	.align 2, 0
_080FEDF4: .4byte 0x03006068
_080FEDF8: .4byte 0x081B6229
	thumb_func_end ItemUseInBattle_Medicine

	thumb_func_start sub_080FEDFC
sub_080FEDFC: @ 0x080FEDFC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FEE10
	ldr r1, _080FEE14
	str r1, [r2]
	bl sub_080FED9C
	pop {r0}
	bx r0
	.align 2, 0
_080FEE10: .4byte 0x03006068
_080FEE14: .4byte 0x081B768D
	thumb_func_end sub_080FEDFC

	thumb_func_start ItemUseInBattle_PPRecovery
ItemUseInBattle_PPRecovery: @ 0x080FEE18
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FEE2C
	ldr r1, _080FEE30
	str r1, [r2]
	bl sub_080FED9C
	pop {r0}
	bx r0
	.align 2, 0
_080FEE2C: .4byte 0x03006068
_080FEE30: .4byte 0x081B67C5
	thumb_func_end ItemUseInBattle_PPRecovery

	thumb_func_start ItemUseInBattle_Escape
ItemUseInBattle_Escape: @ 0x080FEE34
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080FEE64
	ldr r0, [r0]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080FEE84
	bl sub_080FE8A8
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FEE70
	ldr r2, _080FEE68
	ldr r3, _080FEE6C
	adds r0, r4, #0
	movs r1, #1
	bl DisplayItemMessage
	b _080FEE96
	.align 2, 0
_080FEE64: .4byte 0x02022C90
_080FEE68: .4byte 0x02021C7C
_080FEE6C: .4byte 0x081AB6A5
_080FEE70:
	ldr r1, _080FEE7C
	ldr r2, _080FEE80
	adds r0, r4, #0
	bl DisplayItemMessageInBattlePyramid
	b _080FEE96
	.align 2, 0
_080FEE7C: .4byte 0x02021C7C
_080FEE80: .4byte 0x081C5311
_080FEE84:
	ldr r0, _080FEE9C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r1, [r1, #0xe]
	adds r0, r4, #0
	bl DisplayDadsAdviceCannotUseItemMessage
_080FEE96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEE9C: .4byte 0x03005B60
	thumb_func_end ItemUseInBattle_Escape

	thumb_func_start ItemUseOutOfBattle_EnigmaBerry
ItemUseOutOfBattle_EnigmaBerry: @ 0x080FEEA0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080FEEC4
	ldrh r0, [r0]
	bl GetItemEffectType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #0x14
	bls _080FEEBA
	b _080FEFAC
_080FEEBA:
	lsls r0, r0, #2
	ldr r1, _080FEEC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FEEC4: .4byte 0x0203CB48
_080FEEC8: .4byte 0x080FEECC
_080FEECC: @ jump table
	.4byte _080FEF58 @ case 0
	.4byte _080FEF20 @ case 1
	.4byte _080FEF20 @ case 2
	.4byte _080FEF20 @ case 3
	.4byte _080FEF20 @ case 4
	.4byte _080FEF20 @ case 5
	.4byte _080FEF20 @ case 6
	.4byte _080FEFAC @ case 7
	.4byte _080FEFAC @ case 8
	.4byte _080FEF3C @ case 9
	.4byte _080FEF20 @ case 10
	.4byte _080FEF20 @ case 11
	.4byte _080FEF20 @ case 12
	.4byte _080FEF20 @ case 13
	.4byte _080FEF20 @ case 14
	.4byte _080FEF20 @ case 15
	.4byte _080FEF20 @ case 16
	.4byte _080FEFAC @ case 17
	.4byte _080FEF74 @ case 18
	.4byte _080FEF74 @ case 19
	.4byte _080FEF90 @ case 20
_080FEF20:
	ldr r0, _080FEF38
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x10]
	adds r0, r4, #0
	bl ItemUseOutOfBattle_Medicine
	b _080FEFC0
	.align 2, 0
_080FEF38: .4byte 0x03005B60
_080FEF3C:
	ldr r0, _080FEF54
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x10]
	adds r0, r4, #0
	bl ItemUseOutOfBattle_SacredAsh
	b _080FEFC0
	.align 2, 0
_080FEF54: .4byte 0x03005B60
_080FEF58:
	ldr r0, _080FEF70
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x10]
	adds r0, r4, #0
	bl ItemUseOutOfBattle_RareCandy
	b _080FEFC0
	.align 2, 0
_080FEF70: .4byte 0x03005B60
_080FEF74:
	ldr r0, _080FEF8C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x10]
	adds r0, r4, #0
	bl ItemUseOutOfBattle_PPUp
	b _080FEFC0
	.align 2, 0
_080FEF8C: .4byte 0x03005B60
_080FEF90:
	ldr r0, _080FEFA8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x10]
	adds r0, r4, #0
	bl ItemUseOutOfBattle_PPRecovery
	b _080FEFC0
	.align 2, 0
_080FEFA8: .4byte 0x03005B60
_080FEFAC:
	ldr r0, _080FEFC8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	strh r0, [r1, #0x10]
	adds r0, r4, #0
	bl ItemUseOutOfBattle_CannotUse
_080FEFC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEFC8: .4byte 0x03005B60
	thumb_func_end ItemUseOutOfBattle_EnigmaBerry

	thumb_func_start ItemUseInBattle_EnigmaBerry
ItemUseInBattle_EnigmaBerry: @ 0x080FEFCC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080FEFEC
	ldrh r0, [r0]
	bl GetItemEffectType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x15
	bhi _080FF064
	lsls r0, r0, #2
	ldr r1, _080FEFF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FEFEC: .4byte 0x0203CB48
_080FEFF0: .4byte 0x080FEFF4
_080FEFF4: @ jump table
	.4byte _080FF04C @ case 0
	.4byte _080FF064 @ case 1
	.4byte _080FF054 @ case 2
	.4byte _080FF054 @ case 3
	.4byte _080FF054 @ case 4
	.4byte _080FF054 @ case 5
	.4byte _080FF054 @ case 6
	.4byte _080FF054 @ case 7
	.4byte _080FF054 @ case 8
	.4byte _080FF054 @ case 9
	.4byte _080FF064 @ case 10
	.4byte _080FF054 @ case 11
	.4byte _080FF064 @ case 12
	.4byte _080FF064 @ case 13
	.4byte _080FF064 @ case 14
	.4byte _080FF064 @ case 15
	.4byte _080FF064 @ case 16
	.4byte _080FF064 @ case 17
	.4byte _080FF064 @ case 18
	.4byte _080FF064 @ case 19
	.4byte _080FF064 @ case 20
	.4byte _080FF05C @ case 21
_080FF04C:
	adds r0, r4, #0
	bl ItemUseInBattle_StatIncrease
	b _080FF06A
_080FF054:
	adds r0, r4, #0
	bl ItemUseInBattle_Medicine
	b _080FF06A
_080FF05C:
	adds r0, r4, #0
	bl ItemUseInBattle_PPRecovery
	b _080FF06A
_080FF064:
	adds r0, r4, #0
	bl ItemUseOutOfBattle_CannotUse
_080FF06A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ItemUseInBattle_EnigmaBerry

	thumb_func_start ItemUseOutOfBattle_CannotUse
ItemUseOutOfBattle_CannotUse: @ 0x080FF070
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FF08C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r1, [r1, #0xe]
	bl DisplayDadsAdviceCannotUseItemMessage
	pop {r0}
	bx r0
	.align 2, 0
_080FF08C: .4byte 0x03005B60
	thumb_func_end ItemUseOutOfBattle_CannotUse

