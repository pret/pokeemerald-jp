.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DoWhiteOut
DoWhiteOut: @ 0x08083FA8
	push {r4, lr}
	ldr r0, _08083FE0
	bl ScriptContext2_RunNewScript
	ldr r0, _08083FE4
	ldr r4, [r0]
	movs r0, #0x92
	lsls r0, r0, #3
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetMoney
	adds r1, r0, #0
	lsrs r1, r1, #1
	adds r0, r4, #0
	bl SetMoney
	bl HealPlayerParty
	bl Overworld_ResetStateAfterWhiteOut
	bl SetWarpDestinationToLastHealLocation
	bl WarpIntoMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083FE0: .4byte 0x082428F1
_08083FE4: .4byte 0x03005AEC
	thumb_func_end DoWhiteOut

	thumb_func_start Overworld_ResetStateAfterDigEscRope
Overworld_ResetStateAfterDigEscRope: @ 0x08083FE8
	push {lr}
	bl ResetInitialPlayerAvatarState
	ldr r0, _08084010
	bl FlagClear
	ldr r0, _08084014
	bl FlagClear
	ldr r0, _08084018
	bl FlagClear
	ldr r0, _0808401C
	bl FlagClear
	ldr r0, _08084020
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_08084010: .4byte 0x0000088B
_08084014: .4byte 0x0000088D
_08084018: .4byte 0x0000088C
_0808401C: .4byte 0x00000889
_08084020: .4byte 0x00000888
	thumb_func_end Overworld_ResetStateAfterDigEscRope

	thumb_func_start Overworld_ResetStateAfterTeleport
Overworld_ResetStateAfterTeleport: @ 0x08084024
	push {lr}
	bl ResetInitialPlayerAvatarState
	ldr r0, _08084054
	bl FlagClear
	ldr r0, _08084058
	bl FlagClear
	ldr r0, _0808405C
	bl FlagClear
	ldr r0, _08084060
	bl FlagClear
	ldr r0, _08084064
	bl FlagClear
	ldr r0, _08084068
	bl ScriptContext2_RunNewScript
	pop {r0}
	bx r0
	.align 2, 0
_08084054: .4byte 0x0000088B
_08084058: .4byte 0x0000088D
_0808405C: .4byte 0x0000088C
_08084060: .4byte 0x00000889
_08084064: .4byte 0x00000888
_08084068: .4byte 0x082428FC
	thumb_func_end Overworld_ResetStateAfterTeleport

	thumb_func_start Overworld_ResetStateAfterFly
Overworld_ResetStateAfterFly: @ 0x0808406C
	push {lr}
	bl ResetInitialPlayerAvatarState
	ldr r0, _08084094
	bl FlagClear
	ldr r0, _08084098
	bl FlagClear
	ldr r0, _0808409C
	bl FlagClear
	ldr r0, _080840A0
	bl FlagClear
	ldr r0, _080840A4
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_08084094: .4byte 0x0000088B
_08084098: .4byte 0x0000088D
_0808409C: .4byte 0x0000088C
_080840A0: .4byte 0x00000889
_080840A4: .4byte 0x00000888
	thumb_func_end Overworld_ResetStateAfterFly

	thumb_func_start Overworld_ResetStateAfterWhiteOut
Overworld_ResetStateAfterWhiteOut: @ 0x080840A8
	push {r4, lr}
	bl ResetInitialPlayerAvatarState
	ldr r0, _080840F4
	bl FlagClear
	ldr r0, _080840F8
	bl FlagClear
	ldr r0, _080840FC
	bl FlagClear
	ldr r0, _08084100
	bl FlagClear
	ldr r0, _08084104
	bl FlagClear
	ldr r4, _08084108
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _080840EC
	adds r0, r4, #0
	movs r1, #0
	bl VarSet
	ldr r0, _0808410C
	movs r1, #0
	bl VarSet
_080840EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080840F4: .4byte 0x0000088B
_080840F8: .4byte 0x0000088D
_080840FC: .4byte 0x0000088C
_08084100: .4byte 0x00000889
_08084104: .4byte 0x00000888
_08084108: .4byte 0x00004039
_0808410C: .4byte 0x00004037
	thumb_func_end Overworld_ResetStateAfterWhiteOut

	thumb_func_start sub_08084110
sub_08084110: @ 0x08084110
	push {lr}
	ldr r0, _0808412C
	bl FlagClear
	bl ChooseAmbientCrySpecies
	bl ResetCyclingRoadChallengeData
	bl UpdateLocationHistoryForRoamer
	bl RoamerMoveToOtherLocationSet
	pop {r0}
	bx r0
	.align 2, 0
_0808412C: .4byte 0x0000088C
	thumb_func_end sub_08084110

	thumb_func_start ResetGameStats
ResetGameStats: @ 0x08084130
	push {r4, lr}
	movs r4, #0
_08084134:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl SetGameStat
	adds r4, #1
	cmp r4, #0x3f
	ble _08084134
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetGameStats

	thumb_func_start IncrementGameStat
IncrementGameStat: @ 0x0808414C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x33
	bhi _08084174
	adds r0, r4, #0
	bl GetGameStat
	adds r1, r0, #0
	ldr r0, _08084168
	cmp r1, r0
	bhi _0808416C
	adds r1, #1
	b _0808416E
	.align 2, 0
_08084168: .4byte 0x00FFFFFE
_0808416C:
	ldr r1, _0808417C
_0808416E:
	adds r0, r4, #0
	bl SetGameStat
_08084174:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808417C: .4byte 0x00FFFFFF
	thumb_func_end IncrementGameStat

	thumb_func_start GetGameStat
GetGameStat: @ 0x08084180
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x33
	bhi _080841B0
	ldr r0, _080841A4
	ldr r2, [r0]
	lsls r0, r1, #2
	ldr r1, _080841A8
	adds r2, r2, r1
	adds r2, r2, r0
	ldr r0, _080841AC
	ldr r1, [r0]
	adds r1, #0xac
	ldr r0, [r2]
	ldr r1, [r1]
	eors r0, r1
	b _080841B2
	.align 2, 0
_080841A4: .4byte 0x03005AEC
_080841A8: .4byte 0x0000159C
_080841AC: .4byte 0x03005AF0
_080841B0:
	movs r0, #0
_080841B2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetGameStat

	thumb_func_start SetGameStat
SetGameStat: @ 0x080841B8
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x33
	bhi _080841DC
	ldr r0, _080841E0
	ldr r1, [r0]
	lsls r0, r2, #2
	ldr r2, _080841E4
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r0, _080841E8
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	eors r0, r3
	str r0, [r1]
_080841DC:
	pop {r0}
	bx r0
	.align 2, 0
_080841E0: .4byte 0x03005AEC
_080841E4: .4byte 0x0000159C
_080841E8: .4byte 0x03005AF0
	thumb_func_end SetGameStat

	thumb_func_start ApplyNewEncryptionKeyToGameStats
ApplyNewEncryptionKeyToGameStats: @ 0x080841EC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r6, _08084214
_080841F4:
	lsls r1, r4, #2
	ldr r0, _08084218
	adds r1, r1, r0
	ldr r0, [r6]
	adds r0, r0, r1
	adds r1, r5, #0
	bl ApplyNewEncryptionKeyToWord
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _080841F4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084214: .4byte 0x03005AEC
_08084218: .4byte 0x0000159C
	thumb_func_end ApplyNewEncryptionKeyToGameStats

	thumb_func_start LoadEventObjTemplatesFromHeader
LoadEventObjTemplatesFromHeader: @ 0x0808421C
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r5, _0808425C
	ldr r1, [r5]
	movs r4, #0xc7
	lsls r4, r4, #4
	adds r1, r1, r4
	ldr r2, _08084260
	mov r0, sp
	bl CpuSet
	ldr r0, _08084264
	ldr r2, [r0, #4]
	ldr r0, [r2, #4]
	ldr r1, [r5]
	adds r1, r1, r4
	ldrb r3, [r2]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #0x13
	orrs r2, r3
	bl CpuSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808425C: .4byte 0x03005AEC
_08084260: .4byte 0x05000180
_08084264: .4byte 0x02036FB8
	thumb_func_end LoadEventObjTemplatesFromHeader

	thumb_func_start LoadSaveblockEventObjScripts
LoadSaveblockEventObjScripts: @ 0x08084268
	push {lr}
	ldr r0, _08084290
	ldr r1, [r0, #4]
	ldr r0, _08084294
	ldr r0, [r0]
	ldr r2, [r1, #4]
	movs r3, #0xc7
	lsls r3, r3, #4
	adds r1, r0, r3
	movs r3, #0x3f
_0808427C:
	ldr r0, [r2, #0x10]
	str r0, [r1, #0x10]
	adds r2, #0x18
	adds r1, #0x18
	subs r3, #1
	cmp r3, #0
	bge _0808427C
	pop {r0}
	bx r0
	.align 2, 0
_08084290: .4byte 0x02036FB8
_08084294: .4byte 0x03005AEC
	thumb_func_end LoadSaveblockEventObjScripts

	thumb_func_start Overworld_SetEventObjTemplateCoords
Overworld_SetEventObjTemplateCoords: @ 0x08084298
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080842C0
	ldr r0, [r0]
	movs r1, #0
	movs r6, #0xc7
	lsls r6, r6, #4
	adds r3, r0, r6
_080842B2:
	ldrb r0, [r3]
	cmp r0, r5
	bne _080842C4
	strh r4, [r3, #4]
	strh r2, [r3, #6]
	b _080842CC
	.align 2, 0
_080842C0: .4byte 0x03005AEC
_080842C4:
	adds r3, #0x18
	adds r1, #1
	cmp r1, #0x3f
	ble _080842B2
_080842CC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Overworld_SetEventObjTemplateCoords

	thumb_func_start Overworld_SetEventObjTemplateMovementType
Overworld_SetEventObjTemplateMovementType: @ 0x080842D4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080842F4
	ldr r0, [r0]
	movs r3, #0
	movs r5, #0xc7
	lsls r5, r5, #4
	adds r2, r0, r5
_080842EA:
	ldrb r0, [r2]
	cmp r0, r4
	bne _080842F8
	strb r1, [r2, #9]
	b _08084300
	.align 2, 0
_080842F4: .4byte 0x03005AEC
_080842F8:
	adds r2, #0x18
	adds r3, #1
	cmp r3, #0x3f
	ble _080842EA
_08084300:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Overworld_SetEventObjTemplateMovementType

	thumb_func_start mapdata_load_assets_to_gpu_and_full_redraw
mapdata_load_assets_to_gpu_and_full_redraw: @ 0x08084308
	push {r4, lr}
	bl move_tilemap_camera_to_upper_left_corner
	ldr r4, _0808432C
	ldr r0, [r4]
	bl copy_map_tileset1_tileset2_to_vram
	ldr r0, [r4]
	bl apply_map_tileset1_tileset2_palette
	bl DrawWholeMapView
	bl InitTilesetAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808432C: .4byte 0x02036FB8
	thumb_func_end mapdata_load_assets_to_gpu_and_full_redraw

	thumb_func_start GetMapLayout
GetMapLayout: @ 0x08084330
	push {lr}
	ldr r0, _08084340
	ldr r0, [r0]
	ldrh r1, [r0, #0x32]
	cmp r1, #0
	bne _08084344
	movs r0, #0
	b _0808434E
	.align 2, 0
_08084340: .4byte 0x03005AEC
_08084344:
	ldr r0, _08084354
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
_0808434E:
	pop {r1}
	bx r1
	.align 2, 0
_08084354: .4byte 0x0845A1F4
	thumb_func_end GetMapLayout

	thumb_func_start ApplyCurrentWarp
ApplyCurrentWarp: @ 0x08084358
	ldr r3, _08084384
	ldr r0, _08084388
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	str r0, [r3]
	str r1, [r3, #4]
	ldr r0, _0808438C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2, #4]
	str r1, [r2, #8]
	ldr r2, _08084390
	ldr r0, _08084394
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r2, _08084398
	str r0, [r2]
	str r1, [r2, #4]
	bx lr
	.align 2, 0
_08084384: .4byte 0x02031F7C
_08084388: .4byte 0x03005AEC
_0808438C: .4byte 0x02031F84
_08084390: .4byte 0x02031F8C
_08084394: .4byte 0x0830FC88
_08084398: .4byte 0x02031F94
	thumb_func_end ApplyCurrentWarp

	thumb_func_start SetWarpData
SetWarpData: @ 0x0808439C
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [sp, #0x10]
	strb r1, [r0]
	strb r2, [r0, #1]
	strb r3, [r0, #2]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r0, #4]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	strh r5, [r0, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetWarpData

	thumb_func_start IsDummyWarp
IsDummyWarp: @ 0x080843BC
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080843F0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _080843F0
	movs r2, #2
	ldrsb r2, [r1, r2]
	cmp r2, r0
	bne _080843F0
	movs r0, #4
	ldrsh r3, [r1, r0]
	cmp r3, r2
	bne _080843F0
	movs r2, #6
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bne _080843F0
	movs r0, #1
	b _080843F2
_080843F0:
	movs r0, #0
_080843F2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsDummyWarp

	thumb_func_start Overworld_GetMapHeaderByGroupAndId
Overworld_GetMapHeaderByGroupAndId: @ 0x080843F8
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _0808440C
	lsrs r0, r0, #0xe
	adds r0, r0, r2
	ldr r0, [r0]
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_0808440C: .4byte 0x0845E998
	thumb_func_end Overworld_GetMapHeaderByGroupAndId

	thumb_func_start GetDestinationWarpMapHeader
GetDestinationWarpMapHeader: @ 0x08084410
	push {lr}
	ldr r1, _08084430
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	pop {r1}
	bx r1
	.align 2, 0
_08084430: .4byte 0x02031F84
	thumb_func_end GetDestinationWarpMapHeader

	thumb_func_start LoadCurrentMapData
LoadCurrentMapData: @ 0x08084434
	push {r4, r5, r6, lr}
	ldr r1, _08084478
	ldr r4, _0808447C
	ldrb r0, [r4, #0x14]
	strh r0, [r1]
	ldr r5, _08084480
	ldr r1, [r5]
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	adds r1, r4, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, [r5]
	ldrh r0, [r4, #0x12]
	strh r0, [r1, #0x32]
	bl GetMapLayout
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084478: .4byte 0x02031F9C
_0808447C: .4byte 0x02036FB8
_08084480: .4byte 0x03005AEC
	thumb_func_end LoadCurrentMapData

	thumb_func_start LoadSaveblockMapHeader
LoadSaveblockMapHeader: @ 0x08084484
	push {r4, r5, lr}
	ldr r4, _080844BC
	ldr r0, _080844C0
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	adds r1, r4, #0
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	bl GetMapLayout
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080844BC: .4byte 0x02036FB8
_080844C0: .4byte 0x03005AEC
	thumb_func_end LoadSaveblockMapHeader

	thumb_func_start SetPlayerCoordsFromWarp
SetPlayerCoordsFromWarp: @ 0x080844C4
	push {r4, r5, lr}
	ldr r0, _080844F4
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	adds r4, r0, #0
	cmp r1, #0
	blt _080844FC
	ldr r3, _080844F8
	ldr r0, [r3, #4]
	ldrb r5, [r0, #1]
	cmp r1, r5
	bge _080844FC
	ldr r0, [r0, #8]
	lsls r1, r1, #3
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, [r3, #4]
	ldr r0, [r0, #8]
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	b _08084534
	.align 2, 0
_080844F4: .4byte 0x03005AEC
_080844F8: .4byte 0x02036FB8
_080844FC:
	ldr r1, [r4]
	ldrh r3, [r1, #8]
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	blt _08084518
	ldrh r2, [r1, #0xa]
	movs r5, #0xa
	ldrsh r0, [r1, r5]
	cmp r0, #0
	blt _08084518
	strh r3, [r1]
	strh r2, [r1, #2]
	b _08084534
_08084518:
	ldr r3, [r4]
	ldr r2, _0808453C
	ldr r0, [r2]
	ldr r0, [r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #4]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r3, #2]
_08084534:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808453C: .4byte 0x02036FB8
	thumb_func_end SetPlayerCoordsFromWarp

	thumb_func_start WarpIntoMap
WarpIntoMap: @ 0x08084540
	push {lr}
	bl ApplyCurrentWarp
	bl LoadCurrentMapData
	bl SetPlayerCoordsFromWarp
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WarpIntoMap

	thumb_func_start SetWarpDestination
SetWarpDestination: @ 0x08084554
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [sp, #0x18]
	ldr r0, _0808458C
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetWarpData
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808458C: .4byte 0x02031F84
	thumb_func_end SetWarpDestination

	thumb_func_start SetWarpDestinationToMapWarp
SetWarpDestinationToMapWarp: @ 0x08084590
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp]
	bl SetWarpDestination
	add sp, #4
	pop {r0}
	bx r0
	thumb_func_end SetWarpDestinationToMapWarp

	thumb_func_start SetDynamicWarp
SetDynamicWarp: @ 0x080845B0
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080845E0
	ldr r5, [r0]
	adds r0, r5, #0
	adds r0, #0x14
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r4, #0
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, #2
	ldrsb r4, [r5, r4]
	str r4, [sp, #4]
	bl SetWarpData
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080845E0: .4byte 0x03005AEC
	thumb_func_end SetDynamicWarp

	thumb_func_start SetDynamicWarpWithCoords
SetDynamicWarpWithCoords: @ 0x080845E4
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, [sp, #0x14]
	ldr r5, [sp, #0x18]
	ldr r0, _08084618
	ldr r0, [r0]
	adds r0, #0x14
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	str r5, [sp, #4]
	bl SetWarpData
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084618: .4byte 0x03005AEC
	thumb_func_end SetDynamicWarpWithCoords

	thumb_func_start SetWarpDestinationToDynamicWarp
SetWarpDestinationToDynamicWarp: @ 0x0808461C
	ldr r2, _0808462C
	ldr r0, _08084630
	ldr r0, [r0]
	ldr r1, [r0, #0x18]
	ldr r0, [r0, #0x14]
	str r0, [r2]
	str r1, [r2, #4]
	bx lr
	.align 2, 0
_0808462C: .4byte 0x02031F84
_08084630: .4byte 0x03005AEC
	thumb_func_end SetWarpDestinationToDynamicWarp

	thumb_func_start SetWarpDestinationToHealLocation
SetWarpDestinationToHealLocation: @ 0x08084634
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetHealLocation
	adds r4, r0, #0
	cmp r4, #0
	beq _08084662
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	movs r2, #1
	rsbs r2, r2, #0
	movs r3, #2
	ldrsb r3, [r4, r3]
	ldrb r4, [r4, #4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl SetWarpDestination
_08084662:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetWarpDestinationToHealLocation

	thumb_func_start SetWarpDestinationToLastHealLocation
SetWarpDestinationToLastHealLocation: @ 0x0808466C
	ldr r2, _0808467C
	ldr r0, _08084680
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	ldr r0, [r0, #0x1c]
	str r0, [r2]
	str r1, [r2, #4]
	bx lr
	.align 2, 0
_0808467C: .4byte 0x02031F84
_08084680: .4byte 0x03005AEC
	thumb_func_end SetWarpDestinationToLastHealLocation

	thumb_func_start SetLastHealLocationWarp
SetLastHealLocationWarp: @ 0x08084684
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetHealLocation
	adds r5, r0, #0
	cmp r5, #0
	beq _080846B8
	ldr r0, _080846C0
	ldr r0, [r0]
	adds r0, #0x1c
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r2, #1
	ldrsb r2, [r5, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r4, #2
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, #4
	ldrsb r4, [r5, r4]
	str r4, [sp, #4]
	bl SetWarpData
_080846B8:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080846C0: .4byte 0x03005AEC
	thumb_func_end SetLastHealLocationWarp

	thumb_func_start UpdateEscapeWarp
UpdateEscapeWarp: @ 0x080846C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	bl GetCurrentMapType
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08084734
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapTypeByGroupAndId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl IsMapTypeOutdoors
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808472C
	adds r0, r5, #0
	bl IsMapTypeOutdoors
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0808472C
	ldr r0, _08084738
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	subs r3, r6, #7
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	subs r4, r7, #6
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl SetEscapeWarp
_0808472C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084734: .4byte 0x02031F84
_08084738: .4byte 0x03005AEC
	thumb_func_end UpdateEscapeWarp

	thumb_func_start SetEscapeWarp
SetEscapeWarp: @ 0x0808473C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [sp, #0x18]
	ldr r0, _08084778
	ldr r0, [r0]
	adds r0, #0x24
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetWarpData
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084778: .4byte 0x03005AEC
	thumb_func_end SetEscapeWarp

	thumb_func_start SetWarpDestinationToEscapeWarp
SetWarpDestinationToEscapeWarp: @ 0x0808477C
	ldr r2, _0808478C
	ldr r0, _08084790
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	ldr r0, [r0, #0x24]
	str r0, [r2]
	str r1, [r2, #4]
	bx lr
	.align 2, 0
_0808478C: .4byte 0x02031F84
_08084790: .4byte 0x03005AEC
	thumb_func_end SetWarpDestinationToEscapeWarp

	thumb_func_start SetFixedDiveWarp
SetFixedDiveWarp: @ 0x08084794
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [sp, #0x18]
	ldr r0, _080847CC
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetWarpData
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080847CC: .4byte 0x02031F8C
	thumb_func_end SetFixedDiveWarp

	thumb_func_start SetWarpDestinationToDiveWarp
SetWarpDestinationToDiveWarp: @ 0x080847D0
	ldr r2, _080847E0
	ldr r0, _080847E4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	bx lr
	.align 2, 0
_080847E0: .4byte 0x02031F84
_080847E4: .4byte 0x02031F8C
	thumb_func_end SetWarpDestinationToDiveWarp

	thumb_func_start SetFixedHoleWarp
SetFixedHoleWarp: @ 0x080847E8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [sp, #0x18]
	ldr r0, _08084820
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetWarpData
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084820: .4byte 0x02031F94
	thumb_func_end SetFixedHoleWarp

	thumb_func_start SetWarpDestinationToFixedHoleWarp
SetWarpDestinationToFixedHoleWarp: @ 0x08084824
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r4, _0808484C
	adds r0, r4, #0
	bl IsDummyWarp
	cmp r0, #1
	bne _08084858
	ldr r2, _08084850
	ldr r0, _08084854
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	b _08084872
	.align 2, 0
_0808484C: .4byte 0x02031F94
_08084850: .4byte 0x02031F84
_08084854: .4byte 0x02031F7C
_08084858:
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	movs r2, #1
	rsbs r2, r2, #0
	lsls r3, r5, #0x18
	asrs r3, r3, #0x18
	lsls r4, r6, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl SetWarpDestination
_08084872:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetWarpDestinationToFixedHoleWarp

	thumb_func_start SetWarpDestinationToContinueGameWarp
SetWarpDestinationToContinueGameWarp: @ 0x0808487C
	ldr r2, _0808488C
	ldr r0, _08084890
	ldr r0, [r0]
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0xc]
	str r0, [r2]
	str r1, [r2, #4]
	bx lr
	.align 2, 0
_0808488C: .4byte 0x02031F84
_08084890: .4byte 0x03005AEC
	thumb_func_end SetWarpDestinationToContinueGameWarp

	thumb_func_start SetContinueGameWarp
SetContinueGameWarp: @ 0x08084894
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [sp, #0x18]
	ldr r0, _080848D0
	ldr r0, [r0]
	adds r0, #0xc
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetWarpData
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080848D0: .4byte 0x03005AEC
	thumb_func_end SetContinueGameWarp

	thumb_func_start SetContinueGameWarpToHealLocation
SetContinueGameWarpToHealLocation: @ 0x080848D4
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetHealLocation
	adds r5, r0, #0
	cmp r5, #0
	beq _08084908
	ldr r0, _08084910
	ldr r0, [r0]
	adds r0, #0xc
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r2, #1
	ldrsb r2, [r5, r2]
	movs r3, #1
	rsbs r3, r3, #0
	movs r4, #2
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, #4
	ldrsb r4, [r5, r4]
	str r4, [sp, #4]
	bl SetWarpData
_08084908:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084910: .4byte 0x03005AEC
	thumb_func_end SetContinueGameWarpToHealLocation

	thumb_func_start SetContinueGameWarpToDynamicWarp
SetContinueGameWarpToDynamicWarp: @ 0x08084914
	ldr r0, _08084924
	ldr r2, [r0]
	ldr r0, [r2, #0x14]
	ldr r1, [r2, #0x18]
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
	bx lr
	.align 2, 0
_08084924: .4byte 0x03005AEC
	thumb_func_end SetContinueGameWarpToDynamicWarp

	thumb_func_start GetMapConnection
GetMapConnection: @ 0x08084928
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808493C
	ldr r0, [r0, #0xc]
	ldr r3, [r0]
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _08084944
	b _08084958
	.align 2, 0
_0808493C: .4byte 0x02036FB8
_08084940:
	adds r0, r1, #0
	b _0808495A
_08084944:
	movs r2, #0
	cmp r2, r3
	bge _08084958
_0808494A:
	ldrb r0, [r1]
	cmp r0, r4
	beq _08084940
	adds r2, #1
	adds r1, #0xc
	cmp r2, r3
	blt _0808494A
_08084958:
	movs r0, #0
_0808495A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMapConnection

	thumb_func_start SetDiveWarp
SetDiveWarp: @ 0x08084960
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	bl GetMapConnection
	adds r1, r0, #0
	cmp r1, #0
	beq _08084998
	movs r0, #8
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #9]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	lsls r3, r4, #0x18
	asrs r3, r3, #0x18
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl SetWarpDestination
	b _080849B4
_08084998:
	bl RunOnDiveWarpMapScript
	ldr r0, _080849AC
	bl IsDummyWarp
	cmp r0, #0
	beq _080849B0
	movs r0, #0
	b _080849B6
	.align 2, 0
_080849AC: .4byte 0x02031F8C
_080849B0:
	bl SetWarpDestinationToDiveWarp
_080849B4:
	movs r0, #1
_080849B6:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetDiveWarp

	thumb_func_start SetDiveWarpEmerge
SetDiveWarpEmerge: @ 0x080849C0
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r3, #0
	bl SetDiveWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetDiveWarpEmerge

	thumb_func_start SetDiveWarpDive
SetDiveWarpDive: @ 0x080849E0
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #5
	adds r1, r3, #0
	bl SetDiveWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetDiveWarpDive

	thumb_func_start LoadMapFromCameraTransition
LoadMapFromCameraTransition: @ 0x08084A00
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp]
	adds r2, r3, #0
	bl SetWarpDestination
	ldr r4, _08084AC0
	ldrb r0, [r4, #0x14]
	cmp r0, #0x3a
	beq _08084A30
	bl sub_08085178
_08084A30:
	bl ApplyCurrentWarp
	bl LoadCurrentMapData
	bl LoadEventObjTemplatesFromHeader
	bl TrySetMapSaveWarpStatus
	bl ClearTempFieldEventData
	bl ResetCyclingRoadChallengeData
	bl RestartWildEncounterImmunitySteps
	adds r0, r6, #0
	adds r1, r5, #0
	bl TryUpdateRandomTrainerRematches
	bl DoTimeBasedEvents
	bl SetSav1WeatherFromCurrMapHeader
	bl ChooseAmbientCrySpecies
	bl SetDefaultFlashLevel
	bl Overworld_ClearSavedMusic
	bl RunOnTransitionMapScript
	bl InitMap
	ldr r0, [r4]
	bl copy_map_tileset2_to_vram_2
	ldr r0, [r4]
	bl apply_map_tileset2_palette
	movs r4, #6
_08084A7E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ApplyWeatherGammaShiftToPal
	adds r4, #1
	cmp r4, #0xc
	ble _08084A7E
	bl InitSecondaryTilesetAnimation
	bl UpdateLocationHistoryForRoamer
	bl RoamerMove
	bl DoCurrentWeather
	bl ResetFieldTasksArgs
	bl RunOnResumeMapScript
	ldr r2, _08084AC0
	ldrb r0, [r2, #0x14]
	cmp r0, #0x3a
	bne _08084AB4
	ldr r1, _08084AC4
	ldrh r1, [r1]
	cmp r0, r1
	beq _08084AB8
_08084AB4:
	bl ShowMapNamePopup
_08084AB8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084AC0: .4byte 0x02036FB8
_08084AC4: .4byte 0x02031F9C
	thumb_func_end LoadMapFromCameraTransition

	thumb_func_start mli0_load_map
mli0_load_map: @ 0x08084AC8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl LoadCurrentMapData
	ldr r0, _08084AEC
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08084B0A
	ldr r0, _08084AF0
	ldrh r1, [r0, #0x12]
	ldr r0, _08084AF4
	cmp r1, r0
	bne _08084AF8
	bl LoadBattlePyramidEventObjectTemplates
	b _08084B0A
	.align 2, 0
_08084AEC: .4byte 0x02031F78
_08084AF0: .4byte 0x02036FB8
_08084AF4: .4byte 0x00000169
_08084AF8:
	bl InTrainerHill
	cmp r0, #0
	beq _08084B06
	bl sub_081D56F0
	b _08084B0A
_08084B06:
	bl LoadEventObjTemplatesFromHeader
_08084B0A:
	ldr r4, _08084B8C
	ldrb r0, [r4, #0x17]
	bl IsMapTypeOutdoors
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4, #0x17]
	bl IsMapTypeIndoors
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl sub_080EBDB8
	bl TrySetMapSaveWarpStatus
	bl ClearTempFieldEventData
	bl ResetCyclingRoadChallengeData
	bl RestartWildEncounterImmunitySteps
	ldr r0, _08084B90
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl TryUpdateRandomTrainerRematches
	cmp r7, #1
	beq _08084B56
	bl DoTimeBasedEvents
_08084B56:
	bl SetSav1WeatherFromCurrMapHeader
	bl ChooseAmbientCrySpecies
	cmp r5, #0
	beq _08084B68
	ldr r0, _08084B94
	bl FlagClear
_08084B68:
	bl SetDefaultFlashLevel
	bl Overworld_ClearSavedMusic
	bl RunOnTransitionMapScript
	bl UpdateLocationHistoryForRoamer
	bl RoamerMoveToOtherLocationSet
	ldrh r1, [r4, #0x12]
	ldr r0, _08084B98
	cmp r1, r0
	bne _08084B9C
	movs r0, #0
	bl InitBattlePyramidMap
	b _08084BAE
	.align 2, 0
_08084B8C: .4byte 0x02036FB8
_08084B90: .4byte 0x03005AEC
_08084B94: .4byte 0x00000888
_08084B98: .4byte 0x00000169
_08084B9C:
	bl InTrainerHill
	cmp r0, #0
	beq _08084BAA
	bl InitTrainerHillMap
	b _08084BAE
_08084BAA:
	bl InitMap
_08084BAE:
	cmp r7, #1
	beq _08084BC6
	cmp r6, #0
	beq _08084BC6
	ldr r1, _08084BCC
	ldr r0, [r1]
	ldr r1, [r1, #4]
	bl UpdateTVScreensOnMap
	movs r0, #1
	bl InitSecretBaseAppearance
_08084BC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084BCC: .4byte 0x03005B20
	thumb_func_end mli0_load_map

	thumb_func_start ResetInitialPlayerAvatarState
ResetInitialPlayerAvatarState: @ 0x08084BD0
	ldr r1, _08084BDC
	movs r0, #1
	strb r0, [r1, #1]
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084BDC: .4byte 0x02031FA0
	thumb_func_end ResetInitialPlayerAvatarState

	thumb_func_start StoreInitialPlayerAvatarState
StoreInitialPlayerAvatarState: @ 0x08084BE0
	push {r4, lr}
	bl GetPlayerFacingDirection
	ldr r4, _08084BFC
	strb r0, [r4, #1]
	movs r0, #2
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084C00
	movs r0, #2
	b _08084C32
	.align 2, 0
_08084BFC: .4byte 0x02031FA0
_08084C00:
	movs r0, #4
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084C10
	movs r0, #4
	b _08084C32
_08084C10:
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084C20
	movs r0, #8
	b _08084C32
_08084C20:
	movs r0, #0x10
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084C30
	movs r0, #0x10
	b _08084C32
_08084C30:
	movs r0, #1
_08084C32:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StoreInitialPlayerAvatarState

	thumb_func_start GetInitialPlayerAvatarState
GetInitialPlayerAvatarState: @ 0x08084C3C
	push {r4, r5, r6, r7, lr}
	bl GetCurrentMapType
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	bl GetCenterScreenMetatileBehavior
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r6, _08084C88
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl GetAdjustedInitialTransitionFlags
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _08084C8C
	ands r7, r0
	orrs r7, r1
	adds r0, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl GetAdjustedInitialDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _08084C90
	ands r7, r1
	orrs r7, r0
	str r7, [r6]
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08084C88: .4byte 0x02031FA0
_08084C8C: .4byte 0xFFFFFF00
_08084C90: .4byte 0xFFFF00FF
	thumb_func_end GetInitialPlayerAvatarState

	thumb_func_start GetAdjustedInitialTransitionFlags
GetAdjustedInitialTransitionFlags: @ 0x08084C94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #8
	beq _08084CB0
	ldr r0, _08084CB8
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08084CEA
_08084CB0:
	cmp r4, #5
	bne _08084CBC
	movs r0, #0x10
	b _08084CEC
	.align 2, 0
_08084CB8: .4byte 0x0000088D
_08084CBC:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08084CD0
	movs r0, #8
	b _08084CEC
_08084CD0:
	bl Overworld_IsBikingAllowed
	cmp r0, #1
	bne _08084CEA
	ldrb r0, [r6]
	cmp r0, #2
	bne _08084CE2
	movs r0, #2
	b _08084CEC
_08084CE2:
	cmp r0, #4
	bne _08084CEA
	movs r0, #4
	b _08084CEC
_08084CEA:
	movs r0, #1
_08084CEC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetAdjustedInitialTransitionFlags

	thumb_func_start GetAdjustedInitialDirection
GetAdjustedInitialDirection: @ 0x08084CF4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _08084D54
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084D14
	cmp r5, #6
	beq _08084D74
_08084D14:
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	adds r0, r5, #0
	bl MetatileBehavior_IsDeepSouthWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08084D50
	adds r0, r5, #0
	bl MetatileBehavior_IsNonAnimDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08084DAA
	adds r0, r5, #0
	bl MetatileBehavior_IsDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08084DAA
	adds r0, r5, #0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08084D58
_08084D50:
	movs r0, #2
	b _08084DB0
	.align 2, 0
_08084D54: .4byte 0x0000088D
_08084D58:
	adds r0, r5, #0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08084DAA
	adds r0, r5, #0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08084D78
_08084D74:
	movs r0, #4
	b _08084DB0
_08084D78:
	adds r0, r5, #0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08084D8A
	movs r0, #3
	b _08084DB0
_08084D8A:
	ldrb r0, [r6]
	cmp r0, #0x10
	bne _08084D94
	cmp r7, #8
	beq _08084DAE
_08084D94:
	cmp r0, #8
	bne _08084D9C
	cmp r7, #0x10
	beq _08084DAE
_08084D9C:
	lsrs r0, r4, #0x18
	bl MetatileBehavior_IsLadder
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08084DAE
_08084DAA:
	movs r0, #1
	b _08084DB0
_08084DAE:
	ldrb r0, [r6, #1]
_08084DB0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetAdjustedInitialDirection

	thumb_func_start GetCenterScreenMetatileBehavior
GetCenterScreenMetatileBehavior: @ 0x08084DB8
	push {lr}
	ldr r0, _08084DD8
	ldr r1, [r0]
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, #7
	movs r2, #2
	ldrsh r1, [r1, r2]
	adds r1, #7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08084DD8: .4byte 0x03005AEC
	thumb_func_end GetCenterScreenMetatileBehavior

	thumb_func_start Overworld_IsBikingAllowed
Overworld_IsBikingAllowed: @ 0x08084DDC
	push {lr}
	ldr r0, _08084DF0
	ldrb r1, [r0, #0x1a]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08084DF4
	movs r0, #1
	b _08084DF6
	.align 2, 0
_08084DF0: .4byte 0x02036FB8
_08084DF4:
	movs r0, #0
_08084DF6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Overworld_IsBikingAllowed

	thumb_func_start SetDefaultFlashLevel
SetDefaultFlashLevel: @ 0x08084DFC
	push {lr}
	ldr r0, _08084E10
	ldrb r1, [r0, #0x15]
	cmp r1, #0
	bne _08084E18
	ldr r0, _08084E14
	ldr r0, [r0]
	adds r0, #0x30
	strb r1, [r0]
	b _08084E46
	.align 2, 0
_08084E10: .4byte 0x02036FB8
_08084E14: .4byte 0x03005AEC
_08084E18:
	ldr r0, _08084E30
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084E38
	ldr r0, _08084E34
	ldr r0, [r0]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	b _08084E46
	.align 2, 0
_08084E30: .4byte 0x00000888
_08084E34: .4byte 0x03005AEC
_08084E38:
	ldr r0, _08084E4C
	ldr r1, [r0]
	ldr r0, _08084E50
	ldr r0, [r0]
	subs r0, #1
	adds r1, #0x30
	strb r0, [r1]
_08084E46:
	pop {r0}
	bx r0
	.align 2, 0
_08084E4C: .4byte 0x03005AEC
_08084E50: .4byte 0x0852AB14
	thumb_func_end SetDefaultFlashLevel

	thumb_func_start Overworld_SetFlashLevel
Overworld_SetFlashLevel: @ 0x08084E54
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	blt _08084E64
	ldr r0, _08084E74
	ldr r0, [r0]
	cmp r1, r0
	ble _08084E66
_08084E64:
	movs r1, #0
_08084E66:
	ldr r0, _08084E78
	ldr r0, [r0]
	adds r0, #0x30
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08084E74: .4byte 0x0852AB14
_08084E78: .4byte 0x03005AEC
	thumb_func_end Overworld_SetFlashLevel

	thumb_func_start Overworld_GetFlashLevel
Overworld_GetFlashLevel: @ 0x08084E7C
	ldr r0, _08084E88
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08084E88: .4byte 0x03005AEC
	thumb_func_end Overworld_GetFlashLevel

	thumb_func_start SetCurrentMapLayout
SetCurrentMapLayout: @ 0x08084E8C
	push {lr}
	ldr r1, _08084EA0
	ldr r1, [r1]
	strh r0, [r1, #0x32]
	bl GetMapLayout
	ldr r1, _08084EA4
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08084EA0: .4byte 0x03005AEC
_08084EA4: .4byte 0x02036FB8
	thumb_func_end SetCurrentMapLayout

	thumb_func_start sub_08084EA8
sub_08084EA8: @ 0x08084EA8
	ldr r1, _08084EB0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084EB0: .4byte 0x02031F78
	thumb_func_end sub_08084EA8

	thumb_func_start sub_08084EB4
sub_08084EB4: @ 0x08084EB4
	ldr r0, _08084EBC
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08084EBC: .4byte 0x02031F78
	thumb_func_end sub_08084EB4

	thumb_func_start ShouldLegendaryMusicPlayAtLocation
ShouldLegendaryMusicPlayAtLocation: @ 0x08084EC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08084F0C
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084F14
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08084F14
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #5
	blt _08084EEC
	cmp r0, #8
	ble _08084F06
	cmp r0, #0x2b
	bgt _08084EEC
	cmp r0, #0x27
	bge _08084F06
_08084EEC:
	ldr r0, _08084F10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _08084F14
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0x2e
	bgt _08084F14
	cmp r0, #0x2c
	blt _08084F14
_08084F06:
	movs r0, #1
	b _08084F16
	.align 2, 0
_08084F0C: .4byte 0x0000088A
_08084F10: .4byte 0x0000405E
_08084F14:
	movs r0, #0
_08084F16:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ShouldLegendaryMusicPlayAtLocation

	thumb_func_start NoMusicInSotopolisWithLegendaries
NoMusicInSotopolisWithLegendaries: @ 0x08084F1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08084F44
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08084F3E
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08084F3E
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #7
	beq _08084F48
_08084F3E:
	movs r0, #0
	b _08084F4A
	.align 2, 0
_08084F44: .4byte 0x000040CA
_08084F48:
	movs r0, #1
_08084F4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NoMusicInSotopolisWithLegendaries

	thumb_func_start IsInfiltratedWeatherInstitute
IsInfiltratedWeatherInstitute: @ 0x08084F50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08084F74
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08084F6E
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x20
	bne _08084F6E
	ldrb r0, [r4, #1]
	cmp r0, #1
	bls _08084F78
_08084F6E:
	movs r0, #0
	b _08084F7A
	.align 2, 0
_08084F74: .4byte 0x000040B3
_08084F78:
	movs r0, #1
_08084F7A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsInfiltratedWeatherInstitute

	thumb_func_start IsInflitratedSpaceCenter
IsInflitratedSpaceCenter: @ 0x08084F80
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08084FB8
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084FB4
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08084FB4
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0xe
	bne _08084FB4
	ldrb r0, [r5, #1]
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08084FBC
_08084FB4:
	movs r0, #0
	b _08084FBE
	.align 2, 0
_08084FB8: .4byte 0x0000405D
_08084FBC:
	movs r0, #1
_08084FBE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsInflitratedSpaceCenter

	thumb_func_start GetLocationMusic
GetLocationMusic: @ 0x08084FC4
	push {r4, lr}
	adds r4, r0, #0
	bl NoMusicInSotopolisWithLegendaries
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08084FDC
	ldr r0, _08084FD8
	b _08085036
	.align 2, 0
_08084FD8: .4byte 0x0000FFFF
_08084FDC:
	adds r0, r4, #0
	bl ShouldLegendaryMusicPlayAtLocation
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08084FF4
	ldr r0, _08084FF0
	b _08085036
	.align 2, 0
_08084FF0: .4byte 0x000001BB
_08084FF4:
	adds r0, r4, #0
	bl IsInflitratedSpaceCenter
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _0808500C
	ldr r0, _08085008
	b _08085036
	.align 2, 0
_08085008: .4byte 0x000001B9
_0808500C:
	adds r0, r4, #0
	bl IsInfiltratedWeatherInstitute
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _08085032
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ldrsb r1, [r4, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	ldrh r0, [r0, #0x10]
	b _08085036
_08085032:
	movs r0, #0xcb
	lsls r0, r0, #1
_08085036:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLocationMusic

	thumb_func_start GetCurrLocationDefaultMusic
GetCurrLocationDefaultMusic: @ 0x0808503C
	push {r4, lr}
	ldr r0, _0808505C
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xd0
	lsls r0, r0, #5
	cmp r1, r0
	bne _08085064
	bl GetSav1Weather
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _08085064
	ldr r0, _08085060
	b _08085098
	.align 2, 0
_0808505C: .4byte 0x03005AEC
_08085060: .4byte 0x00000199
_08085064:
	ldr r4, _0808507C
	ldr r0, [r4]
	adds r0, #4
	bl GetLocationMusic
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08085080
	cmp r1, r0
	beq _08085084
	adds r0, r1, #0
	b _08085098
	.align 2, 0
_0808507C: .4byte 0x03005AEC
_08085080: .4byte 0x00007FFF
_08085084:
	ldr r0, [r4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x17
	ble _08085094
	movs r0, #0xc9
	lsls r0, r0, #1
	b _08085098
_08085094:
	movs r0, #0xb4
	lsls r0, r0, #1
_08085098:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetCurrLocationDefaultMusic

	thumb_func_start GetWarpDestinationMusic
GetWarpDestinationMusic: @ 0x080850A0
	push {lr}
	ldr r0, _080850B8
	bl GetLocationMusic
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080850BC
	cmp r1, r0
	beq _080850C0
	adds r0, r1, #0
	b _080850DC
	.align 2, 0
_080850B8: .4byte 0x02031F84
_080850BC: .4byte 0x00007FFF
_080850C0:
	ldr r0, _080850D4
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _080850D8
	subs r0, #0x6e
	b _080850DC
	.align 2, 0
_080850D4: .4byte 0x03005AEC
_080850D8:
	movs r0, #0xb4
	lsls r0, r0, #1
_080850DC:
	pop {r1}
	bx r1
	thumb_func_end GetWarpDestinationMusic

	thumb_func_start Overworld_ResetMapMusic
Overworld_ResetMapMusic: @ 0x080850E0
	push {lr}
	bl ResetMapMusic
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Overworld_ResetMapMusic

	thumb_func_start Overworld_PlaySpecialMapMusic
Overworld_PlaySpecialMapMusic: @ 0x080850EC
	push {r4, lr}
	bl GetCurrLocationDefaultMusic
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08085110
	cmp r4, r0
	beq _0808513E
	ldr r0, _08085114
	cmp r4, r0
	beq _0808513E
	ldr r0, _08085118
	ldr r1, [r0]
	ldrh r0, [r1, #0x2c]
	cmp r0, #0
	beq _0808511C
	adds r4, r0, #0
	b _0808513E
	.align 2, 0
_08085110: .4byte 0x000001BB
_08085114: .4byte 0x0000FFFF
_08085118: .4byte 0x03005AEC
_0808511C:
	bl GetCurrentMapType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bne _08085130
	ldr r4, _0808512C
	b _0808513E
	.align 2, 0
_0808512C: .4byte 0x0000019B
_08085130:
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808513E
	ldr r4, _08085158
_0808513E:
	bl GetCurrentMapMusic
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	beq _08085150
	adds r0, r4, #0
	bl PlayNewMapMusic
_08085150:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085158: .4byte 0x0000016D
	thumb_func_end Overworld_PlaySpecialMapMusic

	thumb_func_start Overworld_SetSavedMusic
Overworld_SetSavedMusic: @ 0x0808515C
	ldr r1, _08085164
	ldr r1, [r1]
	strh r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_08085164: .4byte 0x03005AEC
	thumb_func_end Overworld_SetSavedMusic

	thumb_func_start Overworld_ClearSavedMusic
Overworld_ClearSavedMusic: @ 0x08085168
	ldr r0, _08085174
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_08085174: .4byte 0x03005AEC
	thumb_func_end Overworld_ClearSavedMusic

	thumb_func_start sub_08085178
sub_08085178: @ 0x08085178
	push {r4, r5, r6, lr}
	ldr r0, _080851DC
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080851F8
	bl GetWarpDestinationMusic
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetCurrentMapMusic
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080851E0
	cmp r4, r0
	beq _080851BE
	ldr r0, _080851E4
	cmp r4, r0
	beq _080851BE
	ldr r0, _080851E8
	cmp r5, r0
	beq _080851F8
	ldr r6, _080851EC
	cmp r5, r6
	beq _080851F8
	movs r0, #8
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080851BE
	adds r4, r6, #0
_080851BE:
	cmp r4, r5
	beq _080851F8
	movs r0, #6
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080851F0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #4
	bl FadeOutAndFadeInNewMapMusic
	b _080851F8
	.align 2, 0
_080851DC: .4byte 0x00004001
_080851E0: .4byte 0x000001BB
_080851E4: .4byte 0x0000FFFF
_080851E8: .4byte 0x0000019B
_080851EC: .4byte 0x0000016D
_080851F0:
	adds r0, r4, #0
	movs r1, #8
	bl FadeOutAndPlayNewMapMusic
_080851F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08085178

	thumb_func_start Overworld_ChangeMusicToDefault
Overworld_ChangeMusicToDefault: @ 0x08085200
	push {r4, lr}
	bl GetCurrentMapMusic
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetCurrLocationDefaultMusic
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	beq _08085226
	bl GetCurrLocationDefaultMusic
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #8
	bl FadeOutAndPlayNewMapMusic
_08085226:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Overworld_ChangeMusicToDefault

	thumb_func_start Overworld_ChangeMusicTo
Overworld_ChangeMusicTo: @ 0x0808522C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetCurrentMapMusic
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	beq _0808524C
	ldr r0, _08085254
	cmp r1, r0
	beq _0808524C
	adds r0, r4, #0
	movs r1, #8
	bl FadeOutAndPlayNewMapMusic
_0808524C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085254: .4byte 0x000001BB
	thumb_func_end Overworld_ChangeMusicTo

	thumb_func_start GetMapMusicFadeoutSpeed
GetMapMusicFadeoutSpeed: @ 0x08085258
	push {lr}
	bl GetDestinationWarpMapHeader
	ldrb r0, [r0, #0x17]
	bl IsMapTypeIndoors
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08085270
	movs r0, #4
	b _08085272
_08085270:
	movs r0, #2
_08085272:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMapMusicFadeoutSpeed

	thumb_func_start TryFadeOutOldMapMusic
TryFadeOutOldMapMusic: @ 0x08085278
	push {r4, r5, lr}
	bl GetCurrentMapMusic
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	bl GetWarpDestinationMusic
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080852EC
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080852E6
	bl GetCurrentMapMusic
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	beq _080852E6
	ldr r0, _080852F0
	cmp r5, r0
	bne _080852DA
	ldr r0, _080852F4
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _080852DA
	ldr r0, _080852F8
	ldr r0, [r0]
	ldr r1, _080852FC
	ldrh r2, [r0, #4]
	movs r0, #0xe0
	lsls r0, r0, #3
	cmp r2, r0
	bne _080852DA
	ldr r3, _08085300
	ldrh r0, [r3]
	ands r1, r0
	cmp r1, r2
	bne _080852DA
	ldr r1, [r3, #4]
	ldr r0, _08085304
	cmp r1, r0
	beq _080852E6
_080852DA:
	bl GetMapMusicFadeoutSpeed
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FadeOutMapMusic
_080852E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080852EC: .4byte 0x00004001
_080852F0: .4byte 0x0000016D
_080852F4: .4byte 0x000040CA
_080852F8: .4byte 0x03005AEC
_080852FC: .4byte 0x0000FFFF
_08085300: .4byte 0x02031F84
_08085304: .4byte 0x0035001D
	thumb_func_end TryFadeOutOldMapMusic

	thumb_func_start BGMusicStopped
BGMusicStopped: @ 0x08085308
	push {lr}
	bl IsNotWaitingForBGMStop
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end BGMusicStopped

	thumb_func_start Overworld_FadeOutMapMusic
Overworld_FadeOutMapMusic: @ 0x08085318
	push {lr}
	movs r0, #4
	bl FadeOutMapMusic
	pop {r0}
	bx r0
	thumb_func_end Overworld_FadeOutMapMusic

	thumb_func_start PlayAmbientCry
PlayAmbientCry: @ 0x08085324
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	ldr r0, _0808539C
	ldrb r0, [r0]
	cmp r0, #1
	bne _08085358
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085394
_08085358:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x58
	bl __umodsi3
	adds r4, r0, #0
	adds r4, #0xd4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1e
	bl __umodsi3
	adds r2, r0, #0
	adds r2, #0x32
	ldr r0, _080853A0
	ldrh r0, [r0]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r4, #0
	movs r3, #1
	bl PlayCry2
_08085394:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808539C: .4byte 0x02031FA6
_080853A0: .4byte 0x02031FA4
	thumb_func_end PlayAmbientCry

	thumb_func_start UpdateAmbientCry
UpdateAmbientCry: @ 0x080853A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _08085488
	lsls r0, r0, #2
	ldr r1, _080853C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080853C4: .4byte 0x080853C8
_080853C8: @ jump table
	.4byte _080853DC @ case 0
	.4byte _080853F0 @ case 1
	.4byte _0808540C @ case 2
	.4byte _08085474 @ case 3
	.4byte _08085488 @ case 4
_080853DC:
	ldr r0, _080853E8
	ldrh r0, [r0]
	cmp r0, #0
	bne _080853EC
	movs r0, #4
	b _08085486
	.align 2, 0
_080853E8: .4byte 0x02031FA4
_080853EC:
	movs r0, #1
	b _08085486
_080853F0:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #4
	bl __umodsi3
	movs r1, #0x96
	lsls r1, r1, #3
	adds r0, r0, r1
	strh r0, [r7]
	movs r0, #3
	b _08085486
_0808540C:
	movs r0, #1
	mov sb, r0
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	b _08085424
_0808541E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08085424:
	cmp r5, r8
	bhs _0808544C
	movs r0, #0x64
	muls r0, r5, r0
	ldr r4, _08085470
	adds r0, r0, r4
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _0808541E
	adds r0, r4, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x44
	bne _0808541E
	movs r1, #2
	mov sb, r1
_0808544C:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0x96
	lsls r4, r4, #3
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, r0, r4
	mov r1, sb
	bl __divsi3
	strh r0, [r7]
	movs r0, #3
	b _08085486
	.align 2, 0
_08085470: .4byte 0x02024190
_08085474:
	ldrh r0, [r7]
	subs r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08085488
	bl PlayAmbientCry
	movs r0, #2
_08085486:
	strh r0, [r6]
_08085488:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end UpdateAmbientCry

	thumb_func_start ChooseAmbientCrySpecies
ChooseAmbientCrySpecies: @ 0x08085494
	push {lr}
	ldr r0, _080854BC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xb4
	lsls r0, r0, #6
	cmp r1, r0
	bne _080854C4
	bl IsMirageIslandPresent
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080854C4
	ldr r1, _080854C0
	movs r0, #1
	strb r0, [r1]
	bl GetLocalWaterMon
	b _080854CA
	.align 2, 0
_080854BC: .4byte 0x03005AEC
_080854C0: .4byte 0x02031FA6
_080854C4:
	ldr r0, _080854D4
	bl GetLocalWildMon
_080854CA:
	ldr r1, _080854D8
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080854D4: .4byte 0x02031FA6
_080854D8: .4byte 0x02031FA4
	thumb_func_end ChooseAmbientCrySpecies

	thumb_func_start GetMapTypeByGroupAndId
GetMapTypeByGroupAndId: @ 0x080854DC
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	asrs r1, r1, #8
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	ldrb r0, [r0, #0x17]
	pop {r1}
	bx r1
	thumb_func_end GetMapTypeByGroupAndId

	thumb_func_start GetMapTypeByWarpData
GetMapTypeByWarpData: @ 0x080854F4
	push {lr}
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #1
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl GetMapTypeByGroupAndId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end GetMapTypeByWarpData

	thumb_func_start GetCurrentMapType
GetCurrentMapType: @ 0x0808550C
	push {lr}
	ldr r0, _08085520
	ldr r0, [r0]
	adds r0, #4
	bl GetMapTypeByWarpData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08085520: .4byte 0x03005AEC
	thumb_func_end GetCurrentMapType

	thumb_func_start GetLastUsedWarpMapType
GetLastUsedWarpMapType: @ 0x08085524
	push {lr}
	ldr r0, _08085534
	bl GetMapTypeByWarpData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08085534: .4byte 0x02031F7C
	thumb_func_end GetLastUsedWarpMapType

	thumb_func_start IsMapTypeOutdoors
IsMapTypeOutdoors: @ 0x08085538
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _08085552
	cmp r0, #1
	beq _08085552
	cmp r0, #5
	beq _08085552
	cmp r0, #2
	beq _08085552
	cmp r0, #6
	bne _08085556
_08085552:
	movs r0, #1
	b _08085558
_08085556:
	movs r0, #0
_08085558:
	pop {r1}
	bx r1
	thumb_func_end IsMapTypeOutdoors

	thumb_func_start Overworld_MapTypeAllowsTeleportAndFly
Overworld_MapTypeAllowsTeleportAndFly: @ 0x0808555C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _08085572
	cmp r0, #1
	beq _08085572
	cmp r0, #6
	beq _08085572
	cmp r0, #2
	bne _08085576
_08085572:
	movs r0, #1
	b _08085578
_08085576:
	movs r0, #0
_08085578:
	pop {r1}
	bx r1
	thumb_func_end Overworld_MapTypeAllowsTeleportAndFly

	thumb_func_start IsMapTypeIndoors
IsMapTypeIndoors: @ 0x0808557C
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0xf8
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08085590
	movs r0, #0
	b _08085592
_08085590:
	movs r0, #1
_08085592:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsMapTypeIndoors

	thumb_func_start GetSavedWarpRegionMapSectionId
GetSavedWarpRegionMapSectionId: @ 0x08085598
	push {lr}
	ldr r0, _080855BC
	ldr r1, [r0]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	ldrb r0, [r0, #0x14]
	pop {r1}
	bx r1
	.align 2, 0
_080855BC: .4byte 0x03005AEC
	thumb_func_end GetSavedWarpRegionMapSectionId

	thumb_func_start GetCurrentRegionMapSectionId
GetCurrentRegionMapSectionId: @ 0x080855C0
	push {lr}
	ldr r0, _080855E4
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	ldrb r0, [r0, #0x14]
	pop {r1}
	bx r1
	.align 2, 0
_080855E4: .4byte 0x03005AEC
	thumb_func_end GetCurrentRegionMapSectionId

	thumb_func_start GetCurrentMapBattleScene
GetCurrentMapBattleScene: @ 0x080855E8
	push {lr}
	ldr r0, _0808560C
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl Overworld_GetMapHeaderByGroupAndId
	ldrb r0, [r0, #0x1b]
	pop {r1}
	bx r1
	.align 2, 0
_0808560C: .4byte 0x03005AEC
	thumb_func_end GetCurrentMapBattleScene

	thumb_func_start InitOverworldBgs
InitOverworldBgs: @ 0x08085610
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r1, _0808568C
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r0, #1
	movs r1, #5
	movs r2, #1
	bl SetBgAttribute
	movs r0, #2
	movs r1, #5
	movs r2, #1
	bl SetBgAttribute
	movs r0, #3
	movs r1, #5
	movs r2, #1
	bl SetBgAttribute
	ldr r0, _08085690
	mov r8, r0
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl AllocZeroed
	mov r1, r8
	str r0, [r1]
	ldr r6, _08085694
	adds r0, r4, #0
	bl AllocZeroed
	str r0, [r6]
	ldr r5, _08085698
	adds r0, r4, #0
	bl AllocZeroed
	str r0, [r5]
	mov r0, r8
	ldr r1, [r0]
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r6]
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r5]
	movs r0, #3
	bl SetBgTilemapBuffer
	bl InitStandardTextBoxWindows
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808568C: .4byte 0x0830FCF8
_08085690: .4byte 0x03005B00
_08085694: .4byte 0x03005AFC
_08085698: .4byte 0x03005B04
	thumb_func_end InitOverworldBgs

	thumb_func_start CleanupOverworldWindowsAndTilemaps
CleanupOverworldWindowsAndTilemaps: @ 0x0808569C
	push {r4, lr}
	bl ClearMirageTowerPulseBlendEffect
	bl FreeAllOverworldWindowBuffers
	ldr r4, _080856DC
	ldr r0, [r4]
	cmp r0, #0
	beq _080856B6
	bl Free
	movs r0, #0
	str r0, [r4]
_080856B6:
	ldr r4, _080856E0
	ldr r0, [r4]
	cmp r0, #0
	beq _080856C6
	bl Free
	movs r0, #0
	str r0, [r4]
_080856C6:
	ldr r4, _080856E4
	ldr r0, [r4]
	cmp r0, #0
	beq _080856D6
	bl Free
	movs r0, #0
	str r0, [r4]
_080856D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080856DC: .4byte 0x03005B04
_080856E0: .4byte 0x03005AFC
_080856E4: .4byte 0x03005B00
	thumb_func_end CleanupOverworldWindowsAndTilemaps

	thumb_func_start CB2_OverworldBasic
CB2_OverworldBasic: @ 0x080856E8
	push {lr}
	bl SafariZoneRetirePrompt
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_OverworldBasic

	thumb_func_start IsUpdateLinkStateCBActive
IsUpdateLinkStateCBActive: @ 0x080856F4
	push {lr}
	ldr r0, _08085704
	ldr r1, [r0]
	ldr r0, _08085708
	cmp r1, r0
	beq _0808570C
	movs r0, #0
	b _0808570E
	.align 2, 0
_08085704: .4byte 0x03002360
_08085708: .4byte 0x0808653D
_0808570C:
	movs r0, #1
_0808570E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsUpdateLinkStateCBActive

	thumb_func_start DoCB1_Overworld
DoCB1_Overworld: @ 0x08085714
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r4, r1, #0
	bl sub_0808AEDC
	mov r6, sp
	mov r0, sp
	bl FieldClearPlayerInput
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl FieldGetPlayerInput
	bl ScriptContext2_IsEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08085762
	mov r0, sp
	bl ProcessPlayerFieldInput
	cmp r0, #1
	bne _08085758
	bl ScriptContext2_Enable
	bl HideMapNamePopUpWindow
	b _08085762
_08085758:
	ldrb r0, [r6, #2]
	adds r1, r5, #0
	adds r2, r4, #0
	bl player_step
_08085762:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DoCB1_Overworld

	thumb_func_start CB1_Overworld
CB1_Overworld: @ 0x0808576C
	push {lr}
	ldr r2, _08085784
	ldr r1, [r2, #4]
	ldr r0, _08085788
	cmp r1, r0
	bne _08085780
	ldrh r0, [r2, #0x2e]
	ldrh r1, [r2, #0x2c]
	bl DoCB1_Overworld
_08085780:
	pop {r0}
	bx r0
	.align 2, 0
_08085784: .4byte 0x03002360
_08085788: .4byte 0x080857C5
	thumb_func_end CB1_Overworld

	thumb_func_start OverworldBasic
OverworldBasic: @ 0x0808578C
	push {lr}
	bl ScriptContext2_RunScript
	bl RunTasks
	bl AnimateSprites
	bl CameraUpdate
	bl UpdateCameraPanning
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl UpdateTilesetAnimations
	bl do_scheduled_bg_tilemap_copies_to_vram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end OverworldBasic

	thumb_func_start ResetSafariZoneFlag_
ResetSafariZoneFlag_: @ 0x080857B8
	push {lr}
	bl OverworldBasic
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetSafariZoneFlag_

	thumb_func_start CB2_Overworld
CB2_Overworld: @ 0x080857C4
	push {r4, lr}
	ldr r0, _080857EC
	ldrb r0, [r0, #7]
	lsrs r0, r0, #7
	adds r4, r0, #0
	cmp r4, #0
	beq _080857D8
	movs r0, #0
	bl SetVBlankCallback
_080857D8:
	bl OverworldBasic
	cmp r4, #0
	beq _080857E4
	bl SetFieldVBlankCallback
_080857E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080857EC: .4byte 0x02037C74
	thumb_func_end CB2_Overworld

	thumb_func_start SetMainCallback1
SetMainCallback1: @ 0x080857F0
	ldr r1, _080857F8
	str r0, [r1]
	bx lr
	.align 2, 0
_080857F8: .4byte 0x03002360
	thumb_func_end SetMainCallback1

	thumb_func_start SetUnusedCallback
SetUnusedCallback: @ 0x080857FC
	ldr r1, _08085804
	str r0, [r1]
	bx lr
	.align 2, 0
_08085804: .4byte 0x03000E0C
	thumb_func_end SetUnusedCallback

	thumb_func_start map_post_load_hook_exec
map_post_load_hook_exec: @ 0x08085808
	push {r4, lr}
	ldr r4, _08085820
	ldr r0, [r4]
	cmp r0, #0
	beq _08085834
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08085824
	movs r0, #0
	b _08085854
	.align 2, 0
_08085820: .4byte 0x03005B10
_08085824:
	movs r1, #0
	str r1, [r4]
	ldr r0, _08085830
	str r1, [r0]
	b _08085852
	.align 2, 0
_08085830: .4byte 0x03005B0C
_08085834:
	ldr r0, _08085844
	ldr r0, [r0]
	cmp r0, #0
	beq _08085848
	bl _call_via_r0
	b _0808584C
	.align 2, 0
_08085844: .4byte 0x03005B0C
_08085848:
	bl mapldr_default
_0808584C:
	ldr r1, _0808585C
	movs r0, #0
	str r0, [r1]
_08085852:
	movs r0, #1
_08085854:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808585C: .4byte 0x03005B0C
	thumb_func_end map_post_load_hook_exec

	thumb_func_start CB2_NewGame
CB2_NewGame: @ 0x08085860
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl CB2_OverworldBasic
	bl NewGameInitData
	bl ResetInitialPlayerAvatarState
	bl PlayTimeCounter_Start
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _080858A8
	ldr r0, _080858AC
	str r0, [r1]
	ldr r1, _080858B0
	movs r0, #0
	str r0, [r1]
	ldr r0, _080858B4
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _080858B8
	bl SetMainCallback1
	ldr r0, _080858BC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080858A8: .4byte 0x03005B0C
_080858AC: .4byte 0x080FBD51
_080858B0: .4byte 0x03005B10
_080858B4: .4byte 0x03002798
_080858B8: .4byte 0x0808576D
_080858BC: .4byte 0x080857C5
	thumb_func_end CB2_NewGame

	thumb_func_start CB2_WhiteOut
CB2_WhiteOut: @ 0x080858C0
	push {lr}
	sub sp, #4
	ldr r1, _08085920
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x77
	bls _08085918
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl CB2_OverworldBasic
	bl DoWhiteOut
	bl ResetInitialPlayerAvatarState
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _08085924
	ldr r0, _08085928
	str r0, [r1]
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	mov r0, sp
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _0808592C
	bl SetMainCallback1
	ldr r0, _08085930
	bl SetMainCallback2
_08085918:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08085920: .4byte 0x03002360
_08085924: .4byte 0x03005B0C
_08085928: .4byte 0x080AECC5
_0808592C: .4byte 0x0808576D
_08085930: .4byte 0x080857C5
	thumb_func_end CB2_WhiteOut

	thumb_func_start CB2_LoadMap
CB2_LoadMap: @ 0x08085934
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, #0
	bl SetMainCallback1
	ldr r0, _08085958
	bl SetMainCallback2
	ldr r1, _0808595C
	ldr r0, _08085960
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08085958: .4byte 0x08137271
_0808595C: .4byte 0x03002360
_08085960: .4byte 0x08085965
	thumb_func_end CB2_LoadMap

	thumb_func_start CB2_LoadMap2
CB2_LoadMap2: @ 0x08085964
	push {lr}
	ldr r0, _08085980
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _08085984
	bl SetMainCallback1
	ldr r0, _08085988
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08085980: .4byte 0x03002798
_08085984: .4byte 0x0808576D
_08085988: .4byte 0x080857C5
	thumb_func_end CB2_LoadMap2

	thumb_func_start sub_0808598C
sub_0808598C: @ 0x0808598C
	push {r4, lr}
	ldr r0, _080859D0
	movs r1, #0x87
	lsls r1, r1, #3
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _080859AE
	bl FieldClearVBlankHBlankCallbacks
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, #0
	bl SetMainCallback1
_080859AE:
	adds r0, r4, #0
	movs r1, #1
	bl load_map_stuff
	cmp r0, #0
	beq _080859CA
	bl SetFieldVBlankCallback
	ldr r0, _080859D4
	bl SetMainCallback1
	ldr r0, _080859D8
	bl SetMainCallback2
_080859CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080859D0: .4byte 0x03002360
_080859D4: .4byte 0x0808576D
_080859D8: .4byte 0x080857C5
	thumb_func_end sub_0808598C

	thumb_func_start sub_080859DC
sub_080859DC: @ 0x080859DC
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r0, _080859F4
	ldr r1, _080859F8
	str r1, [r0]
	ldr r0, _080859FC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080859F4: .4byte 0x03005B0C
_080859F8: .4byte 0x080AEC11
_080859FC: .4byte 0x08085A01
	thumb_func_end sub_080859DC

	thumb_func_start c2_80567AC
c2_80567AC: @ 0x08085A00
	push {lr}
	ldr r0, _08085A24
	bl map_loading_iteration_3
	cmp r0, #0
	beq _08085A20
	bl SetFieldVBlankCallback
	ldr r0, _08085A28
	bl SetMainCallback1
	bl ResetAllMultiplayerState
	ldr r0, _08085A2C
	bl SetMainCallback2
_08085A20:
	pop {r0}
	bx r0
	.align 2, 0
_08085A24: .4byte 0x03002798
_08085A28: .4byte 0x0808653D
_08085A2C: .4byte 0x080857C5
	thumb_func_end c2_80567AC

	thumb_func_start CB2_ReturnToField
CB2_ReturnToField: @ 0x08085A30
	push {lr}
	bl IsUpdateLinkStateCBActive
	cmp r0, #1
	bne _08085A48
	ldr r0, _08085A44
	bl SetMainCallback2
	b _08085A52
	.align 2, 0
_08085A44: .4byte 0x08085A81
_08085A48:
	bl FieldClearVBlankHBlankCallbacks
	ldr r0, _08085A58
	bl SetMainCallback2
_08085A52:
	pop {r0}
	bx r0
	.align 2, 0
_08085A58: .4byte 0x08085A5D
	thumb_func_end CB2_ReturnToField

	thumb_func_start CB2_ReturnToFieldLocal
CB2_ReturnToFieldLocal: @ 0x08085A5C
	push {lr}
	ldr r0, _08085A78
	bl sub_08085F9C
	cmp r0, #0
	beq _08085A72
	bl SetFieldVBlankCallback
	ldr r0, _08085A7C
	bl SetMainCallback2
_08085A72:
	pop {r0}
	bx r0
	.align 2, 0
_08085A78: .4byte 0x03002798
_08085A7C: .4byte 0x080857C5
	thumb_func_end CB2_ReturnToFieldLocal

	thumb_func_start CB2_ReturnToFieldLink
CB2_ReturnToFieldLink: @ 0x08085A80
	push {lr}
	bl sub_08086EFC
	cmp r0, #0
	bne _08085A9A
	ldr r0, _08085AA0
	bl map_loading_iteration_2_link
	cmp r0, #0
	beq _08085A9A
	ldr r0, _08085AA4
	bl SetMainCallback2
_08085A9A:
	pop {r0}
	bx r0
	.align 2, 0
_08085AA0: .4byte 0x03002798
_08085AA4: .4byte 0x080857C5
	thumb_func_end CB2_ReturnToFieldLink

	thumb_func_start CB2_ReturnToFieldFromMultiplayer
CB2_ReturnToFieldFromMultiplayer: @ 0x08085AA8
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	ldr r0, _08085ACC
	bl SetMainCallback1
	bl ResetAllMultiplayerState
	ldr r0, _08085AD0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08085ADC
	ldr r1, _08085AD4
	ldr r0, _08085AD8
	b _08085AE0
	.align 2, 0
_08085ACC: .4byte 0x0808653D
_08085AD0: .4byte 0x0300319C
_08085AD4: .4byte 0x03005B0C
_08085AD8: .4byte 0x080AEC11
_08085ADC:
	ldr r1, _08085AF4
	ldr r0, _08085AF8
_08085AE0:
	str r0, [r1]
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl CB2_ReturnToField
	pop {r0}
	bx r0
	.align 2, 0
_08085AF4: .4byte 0x03005B0C
_08085AF8: .4byte 0x080AEB11
	thumb_func_end CB2_ReturnToFieldFromMultiplayer

	thumb_func_start CB2_ReturnToFieldWithOpenMenu
CB2_ReturnToFieldWithOpenMenu: @ 0x08085AFC
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _08085B10
	ldr r0, _08085B14
	str r0, [r1]
	bl CB2_ReturnToField
	pop {r0}
	bx r0
	.align 2, 0
_08085B10: .4byte 0x03005B10
_08085B14: .4byte 0x080AEFA1
	thumb_func_end CB2_ReturnToFieldWithOpenMenu

	thumb_func_start CB2_ReturnToFieldContinueScript
CB2_ReturnToFieldContinueScript: @ 0x08085B18
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _08085B2C
	ldr r0, _08085B30
	str r0, [r1]
	bl CB2_ReturnToField
	pop {r0}
	bx r0
	.align 2, 0
_08085B2C: .4byte 0x03005B0C
_08085B30: .4byte 0x080AEA85
	thumb_func_end CB2_ReturnToFieldContinueScript

	thumb_func_start CB2_ReturnToFieldContinueScriptPlayMapMusic
CB2_ReturnToFieldContinueScriptPlayMapMusic: @ 0x08085B34
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _08085B48
	ldr r0, _08085B4C
	str r0, [r1]
	bl CB2_ReturnToField
	pop {r0}
	bx r0
	.align 2, 0
_08085B48: .4byte 0x03005B0C
_08085B4C: .4byte 0x080AEA65
	thumb_func_end CB2_ReturnToFieldContinueScriptPlayMapMusic

	thumb_func_start sub_08085B50
sub_08085B50: @ 0x08085B50
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _08085B64
	ldr r0, _08085B68
	str r0, [r1]
	bl CB2_ReturnToField
	pop {r0}
	bx r0
	.align 2, 0
_08085B64: .4byte 0x03005B0C
_08085B68: .4byte 0x080AECC5
	thumb_func_end sub_08085B50

	thumb_func_start sub_08085B6C
sub_08085B6C: @ 0x08085B6C
	push {lr}
	ldr r0, _08085B94
	ldrb r1, [r0, #0x1a]
	movs r0, #0xf8
	ands r0, r1
	cmp r0, #8
	bne _08085B8A
	bl SecretBaseMapPopupEnabled
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08085B8A
	bl ShowMapNamePopup
_08085B8A:
	bl sub_080AECC4
	pop {r0}
	bx r0
	.align 2, 0
_08085B94: .4byte 0x02036FB8
	thumb_func_end sub_08085B6C

	thumb_func_start CB2_ContinueSavedGame
CB2_ContinueSavedGame: @ 0x08085B98
	push {r4, lr}
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl CB2_OverworldBasic
	ldr r0, _08085BD0
	ldrh r0, [r0]
	cmp r0, #0xff
	bne _08085BB2
	bl sub_081A36A0
_08085BB2:
	bl LoadSaveblockMapHeader
	bl GetCurrentTrainerHillMapId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08085BD4
	ldrh r1, [r0, #0x12]
	ldr r0, _08085BD8
	cmp r1, r0
	bne _08085BDC
	bl LoadBattlePyramidFloorEventObjectScripts
	b _08085BEE
	.align 2, 0
_08085BD0: .4byte 0x03005F50
_08085BD4: .4byte 0x02036FB8
_08085BD8: .4byte 0x00000169
_08085BDC:
	cmp r4, #0
	beq _08085BEA
	cmp r4, #6
	beq _08085BEA
	bl sub_081D5840
	b _08085BEE
_08085BEA:
	bl LoadSaveblockEventObjScripts
_08085BEE:
	bl UnfreezeEventObjects
	bl DoTimeBasedEvents
	bl sub_08084110
	ldr r0, _08085C0C
	ldrh r1, [r0, #0x12]
	ldr r0, _08085C10
	cmp r1, r0
	bne _08085C14
	movs r0, #1
	bl InitBattlePyramidMap
	b _08085C22
	.align 2, 0
_08085C0C: .4byte 0x02036FB8
_08085C10: .4byte 0x00000169
_08085C14:
	cmp r4, #0
	beq _08085C1E
	bl InitTrainerHillMap
	b _08085C22
_08085C1E:
	bl InitMapFromSavedGame
_08085C22:
	bl PlayTimeCounter_Start
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl InitMatchCallCounters
	bl UseContinueGameWarp
	cmp r0, #1
	bne _08085C58
	bl ClearContinueGameWarpStatus2
	bl SetWarpDestinationToContinueGameWarp
	bl WarpIntoMap
	bl sub_080EE664
	ldr r0, _08085C54
	bl SetMainCallback2
	b _08085C6C
	.align 2, 0
_08085C54: .4byte 0x08085935
_08085C58:
	bl sub_080EE664
	ldr r0, _08085C74
	ldr r1, _08085C78
	str r1, [r0]
	ldr r0, _08085C7C
	bl SetMainCallback1
	bl CB2_ReturnToField
_08085C6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085C74: .4byte 0x03005B0C
_08085C78: .4byte 0x08085B6D
_08085C7C: .4byte 0x0808576D
	thumb_func_end CB2_ContinueSavedGame

	thumb_func_start FieldClearVBlankHBlankCallbacks
FieldClearVBlankHBlankCallbacks: @ 0x08085C80
	push {r4, lr}
	bl warp0_in_pokecenter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08085C92
	bl CloseLink
_08085C92:
	ldr r0, _08085CA8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08085CAC
	movs r0, #0xc5
	bl EnableInterrupts
	movs r0, #2
	bl DisableInterrupts
	b _08085CC6
	.align 2, 0
_08085CA8: .4byte 0x0300319C
_08085CAC:
	ldr r4, _08085CD8
	ldrh r3, [r4]
	strh r0, [r4]
	ldr r2, _08085CDC
	ldrh r1, [r2]
	ldr r0, _08085CE0
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	strh r3, [r4]
_08085CC6:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085CD8: .4byte 0x04000208
_08085CDC: .4byte 0x04000200
_08085CE0: .4byte 0x0000FFFD
	thumb_func_end FieldClearVBlankHBlankCallbacks

	thumb_func_start SetFieldVBlankCallback
SetFieldVBlankCallback: @ 0x08085CE4
	push {lr}
	ldr r0, _08085CF0
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_08085CF0: .4byte 0x08085CF5
	thumb_func_end SetFieldVBlankCallback

	thumb_func_start VBlankCB_Field
VBlankCB_Field: @ 0x08085CF4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl ScanlineEffect_InitHBlankDmaTransfer
	bl FieldUpdateBgTilemapScroll
	bl TransferPlttBuffer
	bl TransferTilesetAnimsBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_Field

	thumb_func_start InitCurrentFlashLevelScanlineEffect
InitCurrentFlashLevelScanlineEffect: @ 0x08085D14
	push {lr}
	bl InBattlePyramid_
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085D38
	bl WriteBattlePyramidViewScanlineEffectBuffer
	ldr r2, _08085D34
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [r2, #8]
	bl ScanlineEffect_SetParams
	b _08085D54
	.align 2, 0
_08085D34: .4byte 0x0830FD08
_08085D38:
	bl Overworld_GetFlashLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08085D54
	bl WriteFlashScanlineEffectBuffer
	ldr r2, _08085D58
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [r2, #8]
	bl ScanlineEffect_SetParams
_08085D54:
	pop {r0}
	bx r0
	.align 2, 0
_08085D58: .4byte 0x0830FD08
	thumb_func_end InitCurrentFlashLevelScanlineEffect

	thumb_func_start map_loading_iteration_3
map_loading_iteration_3: @ 0x08085D5C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0xd
	bls _08085D68
	b _08085E76
_08085D68:
	lsls r0, r0, #2
	ldr r1, _08085D74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085D74: .4byte 0x08085D78
_08085D78: @ jump table
	.4byte _08085DB0 @ case 0
	.4byte _08085DC6 @ case 1
	.4byte _08085DCE @ case 2
	.4byte _08085DD6 @ case 3
	.4byte _08085DE8 @ case 4
	.4byte _08085DF6 @ case 5
	.4byte _08085DFC @ case 6
	.4byte _08085E0C @ case 7
	.4byte _08085E1C @ case 8
	.4byte _08085E38 @ case 9
	.4byte _08085E3E @ case 10
	.4byte _08085E44 @ case 11
	.4byte _08085E60 @ case 12
	.4byte _08085E72 @ case 13
_08085DB0:
	bl InitOverworldBgs
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl sub_0808612C
	bl sub_0808613C
	b _08085E6A
_08085DC6:
	movs r0, #1
	bl mli0_load_map
	b _08085E6A
_08085DCE:
	movs r0, #1
	bl sub_080862EC
	b _08085E6A
_08085DD6:
	bl sub_08086448
	bl sub_08086340
	bl sub_08086478
	bl SetCameraToTrackGuestPlayer
	b _08085E6A
_08085DE8:
	bl InitCurrentFlashLevelScanlineEffect
	bl InitOverworldGraphicsRegisters
	bl sub_08196DF4
	b _08085E6A
_08085DF6:
	bl move_tilemap_camera_to_upper_left_corner
	b _08085E6A
_08085DFC:
	ldr r0, _08085E08
	ldr r0, [r0]
	bl copy_map_tileset1_to_vram
	b _08085E6A
	.align 2, 0
_08085E08: .4byte 0x02036FB8
_08085E0C:
	ldr r0, _08085E18
	ldr r0, [r0]
	bl copy_map_tileset2_to_vram
	b _08085E6A
	.align 2, 0
_08085E18: .4byte 0x02036FB8
_08085E1C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08085E76
	ldr r0, _08085E34
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08085E6A
	.align 2, 0
_08085E34: .4byte 0x02036FB8
_08085E38:
	bl DrawWholeMapView
	b _08085E6A
_08085E3E:
	bl InitTilesetAnimations
	b _08085E6A
_08085E44:
	ldr r0, _08085E5C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08085E6A
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _08085E6A
	.align 2, 0
_08085E5C: .4byte 0x0300319C
_08085E60:
	bl map_post_load_hook_exec
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085E76
_08085E6A:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08085E76
_08085E72:
	movs r0, #1
	b _08085E78
_08085E76:
	movs r0, #0
_08085E78:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end map_loading_iteration_3

	thumb_func_start load_map_stuff
load_map_stuff: @ 0x08085E80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4]
	cmp r0, #0xd
	bls _08085E8E
	b _08085F92
_08085E8E:
	lsls r0, r0, #2
	ldr r1, _08085E98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085E98: .4byte 0x08085E9C
_08085E9C: @ jump table
	.4byte _08085ED4 @ case 0
	.4byte _08085EE0 @ case 1
	.4byte _08085EEA @ case 2
	.4byte _08085EF2 @ case 3
	.4byte _08085EFC @ case 4
	.4byte _08085F0A @ case 5
	.4byte _08085F10 @ case 6
	.4byte _08085F20 @ case 7
	.4byte _08085F30 @ case 8
	.4byte _08085F4C @ case 9
	.4byte _08085F52 @ case 10
	.4byte _08085F58 @ case 11
	.4byte _08085F7C @ case 12
	.4byte _08085F8E @ case 13
_08085ED4:
	bl FieldClearVBlankHBlankCallbacks
	adds r0, r5, #0
	bl mli0_load_map
	b _08085F86
_08085EE0:
	bl sub_0808612C
	bl sub_0808613C
	b _08085F86
_08085EEA:
	adds r0, r5, #0
	bl sub_080862EC
	b _08085F86
_08085EF2:
	bl mli4_mapscripts_and_other
	bl sub_080863E4
	b _08085F86
_08085EFC:
	bl InitCurrentFlashLevelScanlineEffect
	bl InitOverworldGraphicsRegisters
	bl sub_08196DF4
	b _08085F86
_08085F0A:
	bl move_tilemap_camera_to_upper_left_corner
	b _08085F86
_08085F10:
	ldr r0, _08085F1C
	ldr r0, [r0]
	bl copy_map_tileset1_to_vram
	b _08085F86
	.align 2, 0
_08085F1C: .4byte 0x02036FB8
_08085F20:
	ldr r0, _08085F2C
	ldr r0, [r0]
	bl copy_map_tileset2_to_vram
	b _08085F86
	.align 2, 0
_08085F2C: .4byte 0x02036FB8
_08085F30:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08085F92
	ldr r0, _08085F48
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08085F86
	.align 2, 0
_08085F48: .4byte 0x02036FB8
_08085F4C:
	bl DrawWholeMapView
	b _08085F86
_08085F52:
	bl InitTilesetAnimations
	b _08085F86
_08085F58:
	ldr r0, _08085F78
	ldrb r1, [r0, #0x1a]
	movs r0, #0xf8
	ands r0, r1
	cmp r0, #8
	bne _08085F86
	bl SecretBaseMapPopupEnabled
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08085F86
	bl ShowMapNamePopup
	b _08085F86
	.align 2, 0
_08085F78: .4byte 0x02036FB8
_08085F7C:
	bl map_post_load_hook_exec
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085F92
_08085F86:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08085F92
_08085F8E:
	movs r0, #1
	b _08085F94
_08085F92:
	movs r0, #0
_08085F94:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end load_map_stuff

	thumb_func_start sub_08085F9C
sub_08085F9C: @ 0x08085F9C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #1
	beq _08085FD2
	cmp r0, #1
	bgt _08085FB0
	cmp r0, #0
	beq _08085FBA
	b _08085FF2
_08085FB0:
	cmp r0, #2
	beq _08085FDC
	cmp r0, #3
	beq _08085FEE
	b _08085FF2
_08085FBA:
	bl sub_0808612C
	bl sub_0808613C
	movs r0, #0
	bl sub_080862EC
	bl sub_080863CC
	bl sub_080863E4
	b _08085FE6
_08085FD2:
	bl sub_080861C4
	bl sub_081D5E60
	b _08085FE6
_08085FDC:
	bl map_post_load_hook_exec
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085FF2
_08085FE6:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08085FF2
_08085FEE:
	movs r0, #1
	b _08085FF4
_08085FF2:
	movs r0, #0
_08085FF4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08085F9C

	thumb_func_start map_loading_iteration_2_link
map_loading_iteration_2_link: @ 0x08085FFC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0xd
	bls _08086008
	b _0808610C
_08086008:
	lsls r0, r0, #2
	ldr r1, _08086014
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086014: .4byte 0x08086018
_08086018: @ jump table
	.4byte _08086050 @ case 0
	.4byte _0808605E @ case 1
	.4byte _08086066 @ case 2
	.4byte _08086074 @ case 3
	.4byte _08086082 @ case 4
	.4byte _08086088 @ case 5
	.4byte _08086098 @ case 6
	.4byte _080860A8 @ case 7
	.4byte _080860C4 @ case 8
	.4byte _080860CA @ case 9
	.4byte _080860F6 @ case 10
	.4byte _080860D0 @ case 11
	.4byte _080860EC @ case 12
	.4byte _080860FE @ case 13
_08086050:
	bl FieldClearVBlankHBlankCallbacks
	bl sub_0808612C
	bl sub_0808613C
	b _080860F6
_0808605E:
	movs r0, #1
	bl sub_080862EC
	b _080860F6
_08086066:
	bl CreateLinkPlayerSprites
	bl sub_080863CC
	bl SetCameraToTrackGuestPlayer_2
	b _080860F6
_08086074:
	bl InitCurrentFlashLevelScanlineEffect
	bl InitOverworldGraphicsRegisters
	bl sub_08196DF4
	b _080860F6
_08086082:
	bl move_tilemap_camera_to_upper_left_corner
	b _080860F6
_08086088:
	ldr r0, _08086094
	ldr r0, [r0]
	bl copy_map_tileset1_to_vram
	b _080860F6
	.align 2, 0
_08086094: .4byte 0x02036FB8
_08086098:
	ldr r0, _080860A4
	ldr r0, [r0]
	bl copy_map_tileset2_to_vram
	b _080860F6
	.align 2, 0
_080860A4: .4byte 0x02036FB8
_080860A8:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0808610C
	ldr r0, _080860C0
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _080860F6
	.align 2, 0
_080860C0: .4byte 0x02036FB8
_080860C4:
	bl DrawWholeMapView
	b _080860F6
_080860CA:
	bl InitTilesetAnimations
	b _080860F6
_080860D0:
	ldr r0, _080860E8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080860F6
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _080860F6
	.align 2, 0
_080860E8: .4byte 0x0300319C
_080860EC:
	bl map_post_load_hook_exec
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808610C
_080860F6:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _0808610C
_080860FE:
	bl SetFieldVBlankCallback
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #1
	b _0808610E
_0808610C:
	movs r0, #0
_0808610E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end map_loading_iteration_2_link

	thumb_func_start do_load_map_stuff_loop
do_load_map_stuff_loop: @ 0x08086114
	push {r4, lr}
	adds r4, r0, #0
_08086118:
	adds r0, r4, #0
	movs r1, #0
	bl load_map_stuff
	cmp r0, #0
	beq _08086118
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end do_load_map_stuff_loop

	thumb_func_start sub_0808612C
sub_0808612C: @ 0x0808612C
	push {lr}
	bl ClearMirageTowerPulseBlend
	bl MoveSaveBlocks_ResetHeap
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0808612C

	thumb_func_start sub_0808613C
sub_0808613C: @ 0x0808613C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	bl ScanlineEffect_Stop
	ldr r2, _080861B4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080861B8
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _080861BC
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
	ldr r7, _080861C0
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_0808617A:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, r2, r5
	subs r3, r3, r5
	cmp r3, r5
	bhi _0808617A
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	lsrs r0, r3, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	movs r1, #0x80
	bl ResetOamRange
	bl LoadOam
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080861B4: .4byte 0x05000002
_080861B8: .4byte 0x040000D4
_080861BC: .4byte 0x810001FF
_080861C0: .4byte 0x81000800
	thumb_func_end sub_0808613C

	thumb_func_start sub_080861C4
sub_080861C4: @ 0x080861C4
	push {lr}
	bl InitCurrentFlashLevelScanlineEffect
	bl InitOverworldGraphicsRegisters
	bl sub_08196DF4
	bl mapdata_load_assets_to_gpu_and_full_redraw
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080861C4

	thumb_func_start InitOverworldGraphicsRegisters
InitOverworldGraphicsRegisters: @ 0x080861DC
	push {r4, lr}
	bl clear_scheduled_bg_copies_to_vram
	bl reset_temp_tile_data_buffers
	movs r0, #0x4c
	movs r1, #0
	bl SetGpuReg
	ldr r1, _080862D4
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _080862D8
	movs r0, #0x4a
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0xff
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0xff
	bl SetGpuReg
	ldr r4, _080862DC
	movs r0, #0x42
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x46
	adds r1, r4, #0
	bl SetGpuReg
	ldr r0, _080862E0
	ldrh r1, [r0, #2]
	ldrh r2, [r0, #4]
	orrs r1, r2
	ldrh r0, [r0, #6]
	orrs r1, r0
	movs r2, #0x82
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r1, r0
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _080862E4
	movs r0, #0x52
	bl SetGpuReg
	bl InitOverworldBgs
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
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
	ldr r1, _080862E8
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
	bl InitFieldMessageBox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080862D4: .4byte 0x00001F1F
_080862D8: .4byte 0x00000101
_080862DC: .4byte 0x0000FFFF
_080862E0: .4byte 0x082BF42C
_080862E4: .4byte 0x0000070D
_080862E8: .4byte 0x00007060
	thumb_func_end InitOverworldGraphicsRegisters

	thumb_func_start sub_080862EC
sub_080862EC: @ 0x080862EC
	push {r4, lr}
	adds r4, r0, #0
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl ScanlineEffect_Clear
	bl ResetAllPicSprites
	bl ResetCameraUpdateInfo
	bl InstallCameraPanAheadCallback
	cmp r4, #0
	bne _08086318
	movs r0, #0
	bl InitEventObjectPalettes
	b _0808631E
_08086318:
	movs r0, #1
	bl InitEventObjectPalettes
_0808631E:
	bl FieldEffectActiveListClear
	bl StartWeather
	bl ResumePausedWeather
	cmp r4, #0
	bne _08086332
	bl SetUpFieldTasks
_08086332:
	bl RunOnResumeMapScript
	bl TryStartMirageTowerPulseBlendEffect
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080862EC

	thumb_func_start sub_08086340
sub_08086340: @ 0x08086340
	push {lr}
	ldr r0, _08086360
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08086364
	strh r1, [r0]
	bl ResetEventObjects
	movs r0, #0
	movs r1, #0
	bl TrySpawnEventObjects
	bl TryRunOnWarpIntoMapScript
	pop {r0}
	bx r0
	.align 2, 0
_08086360: .4byte 0x03005B4C
_08086364: .4byte 0x03005B48
	thumb_func_end sub_08086340

	thumb_func_start mli4_mapscripts_and_other
mli4_mapscripts_and_other: @ 0x08086368
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _080863C0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080863C4
	strh r1, [r0]
	bl ResetEventObjects
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetCameraFocusCoords
	bl GetInitialPlayerAvatarState
	adds r5, r0, #0
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldrb r2, [r5, #1]
	ldr r3, _080863C8
	ldr r3, [r3]
	ldrb r3, [r3, #8]
	bl InitPlayerAvatar
	ldrb r0, [r5]
	bl SetPlayerAvatarTransitionFlags
	bl ResetInitialPlayerAvatarState
	movs r0, #0
	movs r1, #0
	bl TrySpawnEventObjects
	bl TryRunOnWarpIntoMapScript
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080863C0: .4byte 0x03005B4C
_080863C4: .4byte 0x03005B48
_080863C8: .4byte 0x03005AF0
	thumb_func_end mli4_mapscripts_and_other

	thumb_func_start sub_080863CC
sub_080863CC: @ 0x080863CC
	push {lr}
	movs r0, #0
	movs r1, #0
	bl sub_0808DADC
	bl RotatingGate_InitPuzzleAndGraphics
	bl RunOnReturnToFieldMapScript
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080863CC

	thumb_func_start sub_080863E4
sub_080863E4: @ 0x080863E4
	push {lr}
	ldr r2, _08086408
	ldr r3, _0808640C
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r0, [r3, #4]
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08086408: .4byte 0x02036FF0
_0808640C: .4byte 0x02037230
	thumb_func_end sub_080863E4

	thumb_func_start SetCameraToTrackGuestPlayer
SetCameraToTrackGuestPlayer: @ 0x08086410
	push {lr}
	ldr r0, _08086428
	ldrb r0, [r0]
	bl GetSpriteForLinkedPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08086428: .4byte 0x03005B14
	thumb_func_end SetCameraToTrackGuestPlayer

	thumb_func_start SetCameraToTrackGuestPlayer_2
SetCameraToTrackGuestPlayer_2: @ 0x0808642C
	push {lr}
	ldr r0, _08086444
	ldrb r0, [r0]
	bl GetSpriteForLinkedPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08086444: .4byte 0x03005B14
	thumb_func_end SetCameraToTrackGuestPlayer_2

	thumb_func_start sub_08086448
sub_08086448: @ 0x08086448
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetCameraFocusCoords
	mov r2, sp
	ldr r0, _08086474
	ldrb r1, [r0]
	ldrh r0, [r2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	bl sub_080884A0
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086474: .4byte 0x03005B14
	thumb_func_end sub_08086448

	thumb_func_start sub_08086478
sub_08086478: @ 0x08086478
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetCameraFocusCoords
	mov r3, sp
	mov r2, sp
	ldr r0, _080864F4
	ldrb r1, [r0]
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r3]
	movs r6, #0
	ldr r0, _080864F8
	mov r8, r4
	ldrb r0, [r0]
	cmp r6, r0
	bhs _080864E2
	ldr r7, _080864FC
_080864A8:
	lsls r5, r6, #0x18
	lsrs r5, r5, #0x18
	mov r0, sp
	ldrh r1, [r0]
	adds r1, r6, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r4, r6, #3
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r4, r4, r7
	ldrb r3, [r4, #0x13]
	adds r0, r5, #0
	bl SpawnLinkPlayerEventObject
	ldrb r1, [r4]
	adds r0, r5, #0
	bl CreateLinkPlayerSprite
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080864F8
	ldrb r0, [r0]
	cmp r6, r0
	blo _080864A8
_080864E2:
	bl ClearAllPlayerKeys
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080864F4: .4byte 0x03005B14
_080864F8: .4byte 0x03005B18
_080864FC: .4byte 0x020226A0
	thumb_func_end sub_08086478

	thumb_func_start CreateLinkPlayerSprites
CreateLinkPlayerSprites: @ 0x08086500
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _08086534
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0808652E
	ldr r5, _08086538
_0808650E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r1, [r1]
	bl CreateLinkPlayerSprite
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08086534
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808650E
_0808652E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086534: .4byte 0x03005B18
_08086538: .4byte 0x020226A0
	thumb_func_end CreateLinkPlayerSprites

	thumb_func_start CB1_UpdateLinkState
CB1_UpdateLinkState: @ 0x0808653C
	push {r4, lr}
	ldr r0, _08086580
	ldrb r0, [r0]
	cmp r0, #0
	beq _08086556
	bl IsRfuRecvQueueEmpty
	cmp r0, #0
	beq _08086556
	bl IsSendingKeysToLink
	cmp r0, #0
	bne _08086578
_08086556:
	ldr r0, _08086584
	ldrb r4, [r0]
	ldr r0, _08086588
	adds r1, r4, #0
	bl UpdateAllLinkPlayers
	ldr r0, _0808658C
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl UpdateHeldKeyCode
	bl ClearAllPlayerKeys
_08086578:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086580: .4byte 0x0300319C
_08086584: .4byte 0x03005B14
_08086588: .4byte 0x030030C0
_0808658C: .4byte 0x03000E14
	thumb_func_end CB1_UpdateLinkState

	thumb_func_start ResetAllMultiplayerState
ResetAllMultiplayerState: @ 0x08086590
	push {lr}
	bl ResetAllTradingStates
	ldr r0, _080865A0
	bl SetKeyInterceptCallback
	pop {r0}
	bx r0
	.align 2, 0
_080865A0: .4byte 0x08086A15
	thumb_func_end ResetAllMultiplayerState

	thumb_func_start ClearAllPlayerKeys
ClearAllPlayerKeys: @ 0x080865A4
	push {lr}
	ldr r0, _080865B0
	bl ResetPlayerHeldKeys
	pop {r0}
	bx r0
	.align 2, 0
_080865B0: .4byte 0x030030C0
	thumb_func_end ClearAllPlayerKeys

	thumb_func_start SetKeyInterceptCallback
SetKeyInterceptCallback: @ 0x080865B4
	ldr r2, _080865C0
	movs r1, #0
	strb r1, [r2]
	ldr r1, _080865C4
	str r0, [r1]
	bx lr
	.align 2, 0
_080865C0: .4byte 0x03000E19
_080865C4: .4byte 0x03000E14
	thumb_func_end SetKeyInterceptCallback

	thumb_func_start CheckRfuKeepAliveTimer
CheckRfuKeepAliveTimer: @ 0x080865C8
	push {lr}
	ldr r0, _080865EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _080865E6
	ldr r1, _080865F0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bls _080865E6
	bl LinkRfu_FatalError
_080865E6:
	pop {r0}
	bx r0
	.align 2, 0
_080865EC: .4byte 0x0300319C
_080865F0: .4byte 0x03000E19
	thumb_func_end CheckRfuKeepAliveTimer

	thumb_func_start ResetAllTradingStates
ResetAllTradingStates: @ 0x080865F4
	push {lr}
	ldr r1, _08086608
	movs r2, #0x80
	adds r0, r1, #3
_080865FC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080865FC
	pop {r0}
	bx r0
	.align 2, 0
_08086608: .4byte 0x03000E10
	thumb_func_end ResetAllTradingStates

	thumb_func_start AreAllPlayersInTradingState
AreAllPlayersInTradingState: @ 0x0808660C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0808662C
	ldrb r2, [r0]
	movs r1, #0
	cmp r1, r2
	bge _0808663A
	ldr r4, _08086630
_0808661E:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _08086634
	movs r0, #0
	b _0808663C
	.align 2, 0
_0808662C: .4byte 0x03005B18
_08086630: .4byte 0x03000E10
_08086634:
	adds r1, #1
	cmp r1, r2
	blt _0808661E
_0808663A:
	movs r0, #1
_0808663C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AreAllPlayersInTradingState

	thumb_func_start IsAnyPlayerInTradingState
IsAnyPlayerInTradingState: @ 0x08086644
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08086664
	ldrb r2, [r0]
	movs r1, #0
	cmp r1, r2
	bge _08086672
	ldr r4, _08086668
_08086656:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _0808666C
	movs r0, #1
	b _08086674
	.align 2, 0
_08086664: .4byte 0x03005B18
_08086668: .4byte 0x03000E10
_0808666C:
	adds r1, #1
	cmp r1, r2
	blt _08086656
_08086672:
	movs r0, #0
_08086674:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsAnyPlayerInTradingState

	thumb_func_start HandleLinkPlayerKeyInput
HandleLinkPlayerKeyInput: @ 0x0808667C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r2, #0
	mov sb, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r0, _080866CC
	adds r5, r7, r0
	ldrb r0, [r5]
	cmp r0, #0x80
	beq _0808669C
	b _08086816
_0808669C:
	adds r0, r6, #0
	bl TryGetTileEventScript
	adds r4, r0, #0
	cmp r4, #0
	beq _080866D4
	bl GetDirectionForEventScript
	mov r1, sb
	strh r0, [r1]
	movs r0, #0x81
	strb r0, [r5]
	ldrb r0, [r6, #1]
	cmp r0, #0
	bne _080866BC
	b _0808688A
_080866BC:
	ldr r0, _080866D0
	bl SetKeyInterceptCallback
	adds r0, r4, #0
	bl InitMenuBasedScript
	b _0808688A
	.align 2, 0
_080866CC: .4byte 0x03000E10
_080866D0: .4byte 0x08086A5D
_080866D4:
	movs r0, #0x83
	bl IsAnyPlayerInTradingState
	cmp r0, #1
	bne _080866FC
	movs r0, #0x81
	strb r0, [r5]
	ldrb r0, [r6, #1]
	cmp r0, #0
	bne _080866EA
	b _0808688A
_080866EA:
	ldr r0, _080866F8
	bl SetKeyInterceptCallback
	bl sub_08086EE8
	b _0808688A
	.align 2, 0
_080866F8: .4byte 0x08086A5D
_080866FC:
	mov r0, r8
	subs r0, #0x12
	cmp r0, #0xa
	bls _08086706
	b _08086816
_08086706:
	lsls r0, r0, #2
	ldr r1, _08086710
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086710: .4byte 0x08086714
_08086714: @ jump table
	.4byte _0808676C @ case 0
	.4byte _08086816 @ case 1
	.4byte _08086816 @ case 2
	.4byte _08086816 @ case 3
	.4byte _08086816 @ case 4
	.4byte _08086816 @ case 5
	.4byte _08086740 @ case 6
	.4byte _08086798 @ case 7
	.4byte _08086816 @ case 8
	.4byte _080867C8 @ case 9
	.4byte _080867F4 @ case 10
_08086740:
	adds r0, r6, #0
	bl sub_08086CBC
	cmp r0, #0
	beq _08086816
	ldr r0, _08086764
	adds r0, r7, r0
	movs r1, #0x81
	strb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08086816
	ldr r0, _08086768
	bl SetKeyInterceptCallback
	bl InitLinkRoomStartMenuScript
	b _08086816
	.align 2, 0
_08086764: .4byte 0x03000E10
_08086768: .4byte 0x08086A5D
_0808676C:
	adds r0, r6, #0
	bl PlayerIsAtSouthExit
	cmp r0, #1
	bne _08086816
	ldr r0, _08086790
	adds r0, r7, r0
	movs r1, #0x81
	strb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08086816
	ldr r0, _08086794
	bl SetKeyInterceptCallback
	bl CreateConfirmLeaveTradeRoomPrompt
	b _08086816
	.align 2, 0
_08086790: .4byte 0x03000E10
_08086794: .4byte 0x08086A5D
_08086798:
	adds r0, r6, #0
	bl TryInteractWithPlayer
	adds r4, r0, #0
	cmp r4, #0
	beq _08086816
	ldr r0, _080867C0
	adds r0, r7, r0
	movs r1, #0x81
	strb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08086816
	ldr r0, _080867C4
	bl SetKeyInterceptCallback
	adds r0, r4, #0
	bl sub_08086ECC
	b _08086816
	.align 2, 0
_080867C0: .4byte 0x03000E10
_080867C4: .4byte 0x08086A5D
_080867C8:
	adds r0, r6, #0
	bl sub_08086CA4
	cmp r0, #0
	beq _08086816
	ldr r0, _080867EC
	adds r0, r7, r0
	movs r1, #0x81
	strb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08086816
	ldr r0, _080867F0
	bl SetKeyInterceptCallback
	bl sub_08086E74
	b _08086816
	.align 2, 0
_080867EC: .4byte 0x03000E10
_080867F0: .4byte 0x08086A81
_080867F4:
	adds r0, r6, #0
	bl sub_08086CA4
	cmp r0, #0
	beq _08086816
	ldr r0, _08086828
	adds r0, r7, r0
	movs r1, #0x81
	strb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08086816
	ldr r0, _0808682C
	bl SetKeyInterceptCallback
	bl sub_08086E74
_08086816:
	mov r0, r8
	cmp r0, #0x17
	beq _0808683C
	cmp r0, #0x17
	bgt _08086830
	cmp r0, #0x16
	beq _0808684C
	b _0808688A
	.align 2, 0
_08086828: .4byte 0x03000E10
_0808682C: .4byte 0x08086AA5
_08086830:
	mov r1, r8
	cmp r1, #0x1a
	beq _0808685C
	cmp r1, #0x1d
	beq _0808687C
	b _0808688A
_0808683C:
	ldr r0, _08086848
	adds r0, r7, r0
	movs r1, #0x83
	strb r1, [r0]
	b _0808688A
	.align 2, 0
_08086848: .4byte 0x03000E10
_0808684C:
	ldr r0, _08086858
	adds r0, r7, r0
	movs r1, #0x82
	strb r1, [r0]
	b _0808688A
	.align 2, 0
_08086858: .4byte 0x03000E10
_0808685C:
	ldr r0, _08086874
	adds r0, r7, r0
	movs r1, #0x80
	strb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _0808688A
	ldr r0, _08086878
	bl SetKeyInterceptCallback
	b _0808688A
	.align 2, 0
_08086874: .4byte 0x03000E10
_08086878: .4byte 0x08086A15
_0808687C:
	ldr r0, _08086898
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, #0x82
	bne _0808688A
	movs r0, #0x81
	strb r0, [r1]
_0808688A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086898: .4byte 0x03000E10
	thumb_func_end HandleLinkPlayerKeyInput

	thumb_func_start UpdateAllLinkPlayers
UpdateAllLinkPlayers: @ 0x0808689C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	mov r8, r1
	movs r6, #0
	add r5, sp, #0x10
	mov sb, r5
	adds r7, r0, #0
_080868B0:
	ldrb r4, [r7]
	movs r0, #0
	strh r0, [r5]
	adds r0, r6, #0
	mov r1, r8
	mov r2, sp
	bl LoadTradeRoomPlayer
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, sp
	adds r3, r5, #0
	bl HandleLinkPlayerKeyInput
	ldr r0, _08086900
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0x80
	bne _080868E0
	adds r0, r4, #0
	bl GetDirectionForDpadKey
	mov r1, sb
	strh r0, [r1]
_080868E0:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r5]
	bl SetPlayerFacingDirection
	adds r7, #2
	adds r6, #1
	cmp r6, #3
	ble _080868B0
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086900: .4byte 0x03000E10
	thumb_func_end UpdateAllLinkPlayers

	thumb_func_start UpdateHeldKeyCode
UpdateHeldKeyCode: @ 0x08086904
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _0808691C
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xc
	bhi _08086924
	ldr r0, _08086920
	strh r4, [r0]
	b _0808692A
	.align 2, 0
_0808691C: .4byte 0xFFEF0000
_08086920: .4byte 0x03005B08
_08086924:
	ldr r1, _08086968
	movs r0, #0x11
	strh r0, [r1]
_0808692A:
	ldr r0, _0808696C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08086960
	bl GetLinkSendQueueLength
	cmp r0, #1
	bls _08086960
	bl IsUpdateLinkStateCBActive
	cmp r0, #1
	bne _08086960
	bl IsSendingKeysToLink
	cmp r0, #1
	bne _08086960
	cmp r4, #0x11
	blt _08086960
	cmp r4, #0x15
	ble _0808695A
	cmp r4, #0x19
	bgt _08086960
	cmp r4, #0x18
	blt _08086960
_0808695A:
	ldr r1, _08086968
	movs r0, #0
	strh r0, [r1]
_08086960:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086968: .4byte 0x03005B08
_0808696C: .4byte 0x0300319C
	thumb_func_end UpdateHeldKeyCode

	thumb_func_start KeyInterCB_ReadButtons
KeyInterCB_ReadButtons: @ 0x08086970
	push {lr}
	ldr r2, _08086984
	ldrh r1, [r2, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08086988
	movs r0, #0x13
	b _080869C8
	.align 2, 0
_08086984: .4byte 0x03002360
_08086988:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08086994
	movs r0, #0x12
	b _080869C8
_08086994:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080869A0
	movs r0, #0x14
	b _080869C8
_080869A0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080869AC
	movs r0, #0x15
	b _080869C8
_080869AC:
	ldrh r1, [r2, #0x2e]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080869BA
	movs r0, #0x18
	b _080869C8
_080869BA:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080869C6
	movs r0, #0x11
	b _080869C8
_080869C6:
	movs r0, #0x19
_080869C8:
	pop {r1}
	bx r1
	thumb_func_end KeyInterCB_ReadButtons

	thumb_func_start GetDirectionForDpadKey
GetDirectionForDpadKey: @ 0x080869CC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, #0x13
	beq _080869F2
	cmp r0, #0x13
	bgt _080869E2
	cmp r0, #0x12
	beq _080869F6
	b _080869FA
_080869E2:
	cmp r1, #0x14
	beq _080869EE
	cmp r1, #0x15
	bne _080869FA
	movs r0, #4
	b _080869FC
_080869EE:
	movs r0, #3
	b _080869FC
_080869F2:
	movs r0, #1
	b _080869FC
_080869F6:
	movs r0, #2
	b _080869FC
_080869FA:
	movs r0, #0
_080869FC:
	pop {r1}
	bx r1
	thumb_func_end GetDirectionForDpadKey

	thumb_func_start ResetPlayerHeldKeys
ResetPlayerHeldKeys: @ 0x08086A00
	push {lr}
	movs r2, #0x11
	adds r1, r0, #6
_08086A06:
	strh r2, [r1]
	subs r1, #2
	cmp r1, r0
	bge _08086A06
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetPlayerHeldKeys

	thumb_func_start KeyInterCB_SelfIdle
KeyInterCB_SelfIdle: @ 0x08086A14
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptContext2_IsEnabled
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08086A28
	movs r0, #0x11
	b _08086A4A
_08086A28:
	bl GetLinkRecvQueueLength
	cmp r0, #4
	bls _08086A34
	movs r0, #0x1b
	b _08086A4A
_08086A34:
	bl GetLinkSendQueueLength
	cmp r0, #4
	bls _08086A40
	movs r0, #0x1c
	b _08086A4A
_08086A40:
	adds r0, r4, #0
	bl KeyInterCB_ReadButtons
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08086A4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end KeyInterCB_SelfIdle

	thumb_func_start sub_08086A50
sub_08086A50: @ 0x08086A50
	push {lr}
	bl CheckRfuKeepAliveTimer
	movs r0, #0x11
	pop {r1}
	bx r1
	thumb_func_end sub_08086A50

	thumb_func_start KeyInterCB_DeferToEventScript
KeyInterCB_DeferToEventScript: @ 0x08086A5C
	push {r4, lr}
	bl ScriptContext2_IsEnabled
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x11
	cmp r0, #1
	beq _08086A74
	movs r4, #0x1a
	ldr r0, _08086A7C
	bl SetKeyInterceptCallback
_08086A74:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086A7C: .4byte 0x08086A51
	thumb_func_end KeyInterCB_DeferToEventScript

	thumb_func_start KeyInterCB_DeferToRecvQueue
KeyInterCB_DeferToRecvQueue: @ 0x08086A80
	push {r4, lr}
	bl GetLinkRecvQueueLength
	movs r4, #0x11
	cmp r0, #2
	bhi _08086A98
	movs r4, #0x1a
	bl ScriptContext2_Disable
	ldr r0, _08086AA0
	bl SetKeyInterceptCallback
_08086A98:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086AA0: .4byte 0x08086A51
	thumb_func_end KeyInterCB_DeferToRecvQueue

	thumb_func_start KeyInterCB_DeferToSendQueue
KeyInterCB_DeferToSendQueue: @ 0x08086AA4
	push {r4, lr}
	bl GetLinkSendQueueLength
	movs r4, #0x11
	cmp r0, #2
	bhi _08086ABC
	movs r4, #0x1a
	bl ScriptContext2_Disable
	ldr r0, _08086AC4
	bl SetKeyInterceptCallback
_08086ABC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086AC4: .4byte 0x08086A51
	thumb_func_end KeyInterCB_DeferToSendQueue

	thumb_func_start KeyInterCB_DoNothingAndKeepAlive
KeyInterCB_DoNothingAndKeepAlive: @ 0x08086AC8
	push {lr}
	bl CheckRfuKeepAliveTimer
	movs r0, #0x11
	pop {r1}
	bx r1
	thumb_func_end KeyInterCB_DoNothingAndKeepAlive

	thumb_func_start sub_08086AD4
sub_08086AD4: @ 0x08086AD4
	push {lr}
	ldr r1, _08086AF8
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x82
	bne _08086B04
	ldr r0, _08086AFC
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08086B08
	ldr r0, _08086B00
	bl SetKeyInterceptCallback
	movs r0, #0x1d
	b _08086B0A
	.align 2, 0
_08086AF8: .4byte 0x03000E10
_08086AFC: .4byte 0x03002360
_08086B00: .4byte 0x08086AC9
_08086B04:
	bl CheckRfuKeepAliveTimer
_08086B08:
	movs r0, #0x11
_08086B0A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08086AD4

	thumb_func_start sub_08086B10
sub_08086B10: @ 0x08086B10
	push {lr}
	ldr r0, _08086B20
	bl SetKeyInterceptCallback
	movs r0, #0x16
	pop {r1}
	bx r1
	.align 2, 0
_08086B20: .4byte 0x08086AD5
	thumb_func_end sub_08086B10

	thumb_func_start KeyInterCB_SendNothing_2
KeyInterCB_SendNothing_2: @ 0x08086B24
	movs r0, #0x11
	bx lr
	thumb_func_end KeyInterCB_SendNothing_2

	thumb_func_start KeyInterCB_WaitForPlayersToExit
KeyInterCB_WaitForPlayersToExit: @ 0x08086B28
	push {lr}
	ldr r1, _08086B54
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x83
	beq _08086B38
	bl CheckRfuKeepAliveTimer
_08086B38:
	movs r0, #0x83
	bl AreAllPlayersInTradingState
	cmp r0, #1
	bne _08086B4E
	ldr r0, _08086B58
	bl ScriptContext1_SetupScript
	ldr r0, _08086B5C
	bl SetKeyInterceptCallback
_08086B4E:
	movs r0, #0x11
	pop {r1}
	bx r1
	.align 2, 0
_08086B54: .4byte 0x03000E10
_08086B58: .4byte 0x082471F2
_08086B5C: .4byte 0x08086B25
	thumb_func_end KeyInterCB_WaitForPlayersToExit

	thumb_func_start KeyInterCB_SendExitRoomKey
KeyInterCB_SendExitRoomKey: @ 0x08086B60
	push {lr}
	ldr r0, _08086B70
	bl SetKeyInterceptCallback
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08086B70: .4byte 0x08086B29
	thumb_func_end KeyInterCB_SendExitRoomKey

	thumb_func_start KeyInterCB_SendNothing
KeyInterCB_SendNothing: @ 0x08086B74
	movs r0, #0x11
	bx lr
	thumb_func_end KeyInterCB_SendNothing

	thumb_func_start sub_08086B78
sub_08086B78: @ 0x08086B78
	push {lr}
	movs r0, #0x83
	bl IsAnyPlayerInTradingState
	cmp r0, #1
	beq _08086BB4
	ldr r0, _08086BB8
	ldr r2, [r0]
	ldr r1, _08086BBC
	adds r3, r0, #0
	cmp r2, r1
	bne _08086B9E
	ldr r1, _08086BC0
	ldr r0, _08086BC4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x82
	bne _08086BD6
_08086B9E:
	ldr r1, [r3]
	ldr r0, _08086BC8
	cmp r1, r0
	bne _08086BCC
	ldr r1, _08086BC0
	ldr r0, _08086BC4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x81
	bne _08086BCC
_08086BB4:
	movs r0, #2
	b _08086BDC
	.align 2, 0
_08086BB8: .4byte 0x03000E14
_08086BBC: .4byte 0x08086AD5
_08086BC0: .4byte 0x03000E10
_08086BC4: .4byte 0x03005B14
_08086BC8: .4byte 0x08086AC9
_08086BCC:
	movs r0, #0x82
	bl AreAllPlayersInTradingState
	cmp r0, #0
	bne _08086BDA
_08086BD6:
	movs r0, #0
	b _08086BDC
_08086BDA:
	movs r0, #1
_08086BDC:
	pop {r1}
	bx r1
	thumb_func_end sub_08086B78

	thumb_func_start sub_08086BE0
sub_08086BE0: @ 0x08086BE0
	push {lr}
	movs r0, #0x83
	bl IsAnyPlayerInTradingState
	pop {r1}
	bx r1
	thumb_func_end sub_08086BE0

	thumb_func_start sub_08086BEC
sub_08086BEC: @ 0x08086BEC
	push {lr}
	ldr r0, _08086BFC
	bl SetKeyInterceptCallback
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08086BFC: .4byte 0x08086B11
	thumb_func_end sub_08086BEC

	thumb_func_start sub_08086C00
sub_08086C00: @ 0x08086C00
	push {lr}
	ldr r0, _08086C10
	bl SetKeyInterceptCallback
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08086C10: .4byte 0x08086A5D
	thumb_func_end sub_08086C00

	thumb_func_start QueueExitLinkRoomKey
QueueExitLinkRoomKey: @ 0x08086C14
	push {lr}
	ldr r0, _08086C24
	bl SetKeyInterceptCallback
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08086C24: .4byte 0x08086B61
	thumb_func_end QueueExitLinkRoomKey

	thumb_func_start sub_08086C28
sub_08086C28: @ 0x08086C28
	push {lr}
	ldr r0, _08086C38
	bl SetKeyInterceptCallback
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08086C38: .4byte 0x08086B75
	thumb_func_end sub_08086C28

	thumb_func_start LoadTradeRoomPlayer
LoadTradeRoomPlayer: @ 0x08086C3C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r2, #0
	strb r4, [r6]
	movs r0, #0
	cmp r4, r1
	bne _08086C4E
	movs r0, #1
_08086C4E:
	strb r0, [r6, #1]
	ldr r1, _08086CA0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	strb r0, [r6, #2]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl GetLinkPlayerFacingDirection
	strb r0, [r6, #3]
	mov r5, sp
	adds r5, #2
	adds r0, r4, #0
	mov r1, sp
	adds r2, r5, #0
	bl GetLinkPlayerCoords
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, #4]
	ldrh r0, [r5]
	strh r0, [r6, #6]
	adds r0, r4, #0
	bl GetLinkPlayerElevation
	strb r0, [r6, #8]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	strh r0, [r6, #0xc]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086CA0: .4byte 0x02031FA8
	thumb_func_end LoadTradeRoomPlayer

	thumb_func_start sub_08086CA4
sub_08086CA4: @ 0x08086CA4
	push {lr}
	ldrb r0, [r0, #2]
	cmp r0, #2
	beq _08086CB0
	cmp r0, #0
	bne _08086CB4
_08086CB0:
	movs r0, #1
	b _08086CB6
_08086CB4:
	movs r0, #0
_08086CB6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08086CA4

	thumb_func_start sub_08086CBC
sub_08086CBC: @ 0x08086CBC
	push {lr}
	ldrb r0, [r0, #2]
	cmp r0, #2
	beq _08086CC8
	cmp r0, #0
	bne _08086CCC
_08086CC8:
	movs r0, #1
	b _08086CCE
_08086CCC:
	movs r0, #0
_08086CCE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08086CBC

	thumb_func_start TryGetTileEventScript
TryGetTileEventScript: @ 0x08086CD4
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #2]
	cmp r0, #2
	bne _08086CE6
	adds r0, r1, #4
	bl GetCoordEventScriptAtMapPosition
	b _08086CE8
_08086CE6:
	movs r0, #0
_08086CE8:
	pop {r1}
	bx r1
	thumb_func_end TryGetTileEventScript

	thumb_func_start PlayerIsAtSouthExit
PlayerIsAtSouthExit: @ 0x08086CEC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #2
	beq _08086CFA
	cmp r0, #0
	bne _08086D10
_08086CFA:
	ldrb r0, [r4, #0xc]
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08086D10
	ldrb r0, [r4, #3]
	cmp r0, #1
	bne _08086D10
	movs r0, #1
	b _08086D12
_08086D10:
	movs r0, #0
_08086D12:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end PlayerIsAtSouthExit

	thumb_func_start TryInteractWithPlayer
TryInteractWithPlayer: @ 0x08086D18
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08086D2C
	cmp r0, #2
	beq _08086D2C
	movs r0, #0
	b _08086DDA
_08086D2C:
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _08086D9C
	ldrb r0, [r4, #3]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r0, [r0]
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08086DA0
	ldr r2, [sp]
	ands r2, r1
	orrs r2, r0
	str r2, [sp]
	asrs r1, r2, #0x10
	ldrb r0, [r4, #3]
	lsls r0, r0, #3
	adds r3, #4
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08086DA4
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldr r2, _08086DA8
	ldr r0, [sp, #4]
	ands r0, r2
	str r0, [sp, #4]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #0x10
	bl GetLinkPlayerIdAt
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	cmp r1, #4
	beq _08086DD0
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _08086D98
	ldr r0, _08086DAC
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0x80
	beq _08086DB4
_08086D98:
	ldr r0, _08086DB0
	b _08086DDA
	.align 2, 0
_08086D9C: .4byte 0x0830FCB0
_08086DA0: .4byte 0xFFFF0000
_08086DA4: .4byte 0x0000FFFF
_08086DA8: .4byte 0xFFFFFF00
_08086DAC: .4byte 0x03000E10
_08086DB0: .4byte 0x0824717B
_08086DB4:
	adds r0, r2, #0
	bl GetLinkTrainerCardColor
	cmp r0, #0
	bne _08086DC8
	ldr r0, _08086DC4
	b _08086DDA
	.align 2, 0
_08086DC4: .4byte 0x0824715D
_08086DC8:
	ldr r0, _08086DCC
	b _08086DDA
	.align 2, 0
_08086DCC: .4byte 0x0824716C
_08086DD0:
	ldrb r1, [r4, #0xc]
	ldrb r2, [r4, #3]
	mov r0, sp
	bl GetInteractedLinkPlayerScript
_08086DDA:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryInteractWithPlayer

	thumb_func_start GetDirectionForEventScript
GetDirectionForEventScript: @ 0x08086DE4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08086E30
	cmp r1, r0
	beq _08086E2A
	ldr r0, _08086E34
	cmp r1, r0
	beq _08086E6C
	ldr r0, _08086E38
	cmp r1, r0
	beq _08086E2A
	ldr r0, _08086E3C
	cmp r1, r0
	beq _08086E6C
	ldr r0, _08086E40
	cmp r1, r0
	beq _08086E2A
	ldr r0, _08086E44
	cmp r1, r0
	beq _08086E6C
	ldr r0, _08086E48
	cmp r1, r0
	beq _08086E2A
	ldr r0, _08086E4C
	cmp r1, r0
	beq _08086E6C
	ldr r0, _08086E50
	cmp r1, r0
	beq _08086E2A
	ldr r0, _08086E54
	cmp r1, r0
	beq _08086E6C
	ldr r0, _08086E58
	cmp r1, r0
	bne _08086E5C
_08086E2A:
	movs r0, #0xa
	b _08086E6E
	.align 2, 0
_08086E30: .4byte 0x08247067
_08086E34: .4byte 0x08247082
_08086E38: .4byte 0x0824709D
_08086E3C: .4byte 0x082470B8
_08086E40: .4byte 0x082470FC
_08086E44: .4byte 0x08247111
_08086E48: .4byte 0x08247126
_08086E4C: .4byte 0x0824713B
_08086E50: .4byte 0x08247053
_08086E54: .4byte 0x0824705D
_08086E58: .4byte 0x082470D4
_08086E5C:
	ldr r0, _08086E68
	cmp r1, r0
	beq _08086E6C
	movs r0, #0
	b _08086E6E
	.align 2, 0
_08086E68: .4byte 0x082470DE
_08086E6C:
	movs r0, #9
_08086E6E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetDirectionForEventScript

	thumb_func_start sub_08086E74
sub_08086E74: @ 0x08086E74
	push {lr}
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08086E74

	thumb_func_start InitLinkRoomStartMenuScript
InitLinkRoomStartMenuScript: @ 0x08086E80
	push {lr}
	movs r0, #6
	bl PlaySE
	bl ShowStartMenu
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end InitLinkRoomStartMenuScript

	thumb_func_start InitMenuBasedScript
InitMenuBasedScript: @ 0x08086E94
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitMenuBasedScript

	thumb_func_start CreateConfirmLeaveTradeRoomPrompt
CreateConfirmLeaveTradeRoomPrompt: @ 0x08086EB0
	push {lr}
	movs r0, #6
	bl PlaySE
	ldr r0, _08086EC8
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08086EC8: .4byte 0x082471CE
	thumb_func_end CreateConfirmLeaveTradeRoomPrompt

	thumb_func_start sub_08086ECC
sub_08086ECC: @ 0x08086ECC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl PlaySE
	adds r0, r4, #0
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08086ECC

	thumb_func_start sub_08086EE8
sub_08086EE8: @ 0x08086EE8
	push {lr}
	ldr r0, _08086EF8
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08086EF8: .4byte 0x082471E8
	thumb_func_end sub_08086EE8

	thumb_func_start sub_08086EFC
sub_08086EFC: @ 0x08086EFC
	push {lr}
	bl IsUpdateLinkStateCBActive
	cmp r0, #0
	bne _08086F0A
	movs r0, #0
	b _08086F24
_08086F0A:
	bl GetLinkRecvQueueLength
	cmp r0, #2
	bls _08086F1C
	ldr r1, _08086F18
	movs r0, #1
	b _08086F20
	.align 2, 0
_08086F18: .4byte 0x03000E18
_08086F1C:
	ldr r1, _08086F28
	movs r0, #0
_08086F20:
	strb r0, [r1]
	ldrb r0, [r1]
_08086F24:
	pop {r1}
	bx r1
	.align 2, 0
_08086F28: .4byte 0x03000E18
	thumb_func_end sub_08086EFC

	thumb_func_start sub_08086F2C
sub_08086F2C: @ 0x08086F2C
	push {lr}
	bl GetLinkRecvQueueLength
	cmp r0, #1
	bls _08086F90
	bl IsUpdateLinkStateCBActive
	cmp r0, #1
	bne _08086F90
	bl IsSendingKeysToLink
	cmp r0, #1
	bne _08086F90
	ldr r0, _08086F7C
	ldr r1, [r0]
	ldr r0, _08086F80
	cmp r1, r0
	beq _08086F78
	ldr r0, _08086F84
	cmp r1, r0
	bne _08086F90
	ldr r0, _08086F88
	ldrb r2, [r0]
	movs r1, #0
	strb r1, [r0]
	cmp r2, #1
	beq _08086F78
	ldr r2, _08086F8C
	ldrb r1, [r2, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08086F90
	ldrb r1, [r2, #0xa]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08086F90
_08086F78:
	movs r0, #1
	b _08086F92
	.align 2, 0
_08086F7C: .4byte 0x03000E14
_08086F80: .4byte 0x08086A81
_08086F84: .4byte 0x08086A5D
_08086F88: .4byte 0x03000E18
_08086F8C: .4byte 0x02037C74
_08086F90:
	movs r0, #0
_08086F92:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08086F2C

	thumb_func_start sub_08086F98
sub_08086F98: @ 0x08086F98
	push {lr}
	bl GetLinkSendQueueLength
	cmp r0, #1
	bls _08086FBC
	bl IsUpdateLinkStateCBActive
	cmp r0, #1
	bne _08086FBC
	bl IsSendingKeysToLink
	cmp r0, #1
	bne _08086FBC
	ldr r0, _08086FC0
	ldr r1, [r0]
	ldr r0, _08086FC4
	cmp r1, r0
	beq _08086FC8
_08086FBC:
	movs r0, #0
	b _08086FCA
	.align 2, 0
_08086FC0: .4byte 0x03000E14
_08086FC4: .4byte 0x08086AA5
_08086FC8:
	movs r0, #1
_08086FCA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08086F98

	thumb_func_start sub_08086FD0
sub_08086FD0: @ 0x08086FD0
	push {lr}
	ldr r0, _08086FE8
	ldrb r0, [r0]
	cmp r0, #0
	bne _08086FEC
	bl IsSendingKeysToLink
	cmp r0, #0
	beq _08086FEC
	movs r0, #1
	b _08086FEE
	.align 2, 0
_08086FE8: .4byte 0x0300319C
_08086FEC:
	movs r0, #0
_08086FEE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08086FD0

	thumb_func_start GetLinkSendQueueLength
GetLinkSendQueueLength: @ 0x08086FF4
	push {lr}
	ldr r0, _08087008
	ldrb r0, [r0]
	cmp r0, #0
	bne _08087014
	ldr r0, _0808700C
	ldr r1, _08087010
	adds r0, r0, r1
	ldrb r0, [r0]
	b _0808701C
	.align 2, 0
_08087008: .4byte 0x0300319C
_0808700C: .4byte 0x03003210
_08087010: .4byte 0x00000339
_08087014:
	ldr r0, _08087020
	ldr r1, _08087024
	adds r0, r0, r1
	ldrb r0, [r0]
_0808701C:
	pop {r1}
	bx r1
	.align 2, 0
_08087020: .4byte 0x030050A0
_08087024: .4byte 0x000008D2
	thumb_func_end GetLinkSendQueueLength

	thumb_func_start ZeroLinkPlayerEventObject
ZeroLinkPlayerEventObject: @ 0x08087028
	movs r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ZeroLinkPlayerEventObject

	thumb_func_start ClearLinkPlayerEventObjects
ClearLinkPlayerEventObjects: @ 0x08087030
	push {lr}
	ldr r0, _08087040
	movs r1, #0
	movs r2, #0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08087040: .4byte 0x02031FA8
	thumb_func_end ClearLinkPlayerEventObjects

	thumb_func_start ZeroEventObject
ZeroEventObject: @ 0x08087044
	push {lr}
	movs r1, #0
	movs r2, #0x24
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ZeroEventObject

	thumb_func_start SpawnLinkPlayerEventObject
SpawnLinkPlayerEventObject: @ 0x08087054
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r1
	mov sl, r2
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r1, sl
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	mov r2, r8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	bl GetFirstInactiveEventObjectId
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r7, #2
	ldr r0, _080870F8
	adds r4, r4, r0
	lsls r5, r6, #3
	adds r5, r5, r6
	lsls r5, r5, #2
	ldr r0, _080870FC
	adds r5, r5, r0
	adds r0, r4, #0
	bl ZeroLinkPlayerEventObject
	adds r0, r5, #0
	bl ZeroEventObject
	movs r2, #0
	movs r1, #1
	movs r0, #1
	strb r0, [r4]
	strb r7, [r4, #1]
	strb r6, [r4, #2]
	strb r2, [r4, #3]
	ldrb r0, [r5]
	orrs r0, r1
	mov r2, r8
	ands r2, r1
	lsls r2, r2, #1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #0x19]
	movs r0, #0x40
	strb r0, [r5, #4]
	mov r0, sb
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	mov r1, sl
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov sl, r1
	adds r0, r5, #0
	mov r1, sb
	mov r2, sl
	bl InitLinkPlayerEventObjectPos
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080870F8: .4byte 0x02031FA8
_080870FC: .4byte 0x02036FF0
	thumb_func_end SpawnLinkPlayerEventObject

	thumb_func_start InitLinkPlayerEventObjectPos
InitLinkPlayerEventObjectPos: @ 0x08087100
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	strh r0, [r4, #0x14]
	strh r1, [r4, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	adds r2, #0xc
	adds r3, r4, #0
	adds r3, #0xe
	bl SetSpritePosToMapCoords
	ldrh r0, [r4, #0xc]
	adds r0, #8
	strh r0, [r4, #0xc]
	adds r0, r4, #0
	bl EventObjectUpdateZCoord
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitLinkPlayerEventObjectPos

	thumb_func_start sub_08087140
sub_08087140: @ 0x08087140
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _08087168
	lsrs r0, r0, #0x16
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08087162
	ldrb r0, [r1, #2]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0808716C
	adds r1, r1, r0
	strb r2, [r1, #0x19]
_08087162:
	pop {r0}
	bx r0
	.align 2, 0
_08087168: .4byte 0x02031FA8
_0808716C: .4byte 0x02036FF0
	thumb_func_end sub_08087140

	thumb_func_start sub_08087170
sub_08087170: @ 0x08087170
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, _080871B0
	adds r5, r0, r1
	ldrb r1, [r5, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080871B4
	adds r4, r0, r1
	ldrb r0, [r4, #4]
	cmp r0, #0x40
	beq _0808719C
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080871B8
	adds r0, r0, r1
	bl DestroySprite
_0808719C:
	movs r0, #0
	strb r0, [r5]
	ldrb r1, [r4]
	subs r0, #2
	ands r0, r1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080871B0: .4byte 0x02031FA8
_080871B4: .4byte 0x02036FF0
_080871B8: .4byte 0x020205AC
	thumb_func_end sub_08087170

	thumb_func_start GetSpriteForLinkedPlayer
GetSpriteForLinkedPlayer: @ 0x080871BC
	lsls r0, r0, #0x18
	ldr r1, _080871D4
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080871D8
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	bx lr
	.align 2, 0
_080871D4: .4byte 0x02031FA8
_080871D8: .4byte 0x02036FF0
	thumb_func_end GetSpriteForLinkedPlayer

	thumb_func_start GetLinkPlayerCoords
GetLinkPlayerCoords: @ 0x080871DC
	lsls r0, r0, #0x18
	ldr r3, _080871FC
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldrb r3, [r0, #2]
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r3, _08087200
	adds r0, r0, r3
	ldrh r3, [r0, #0x10]
	strh r3, [r1]
	ldrh r0, [r0, #0x12]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080871FC: .4byte 0x02031FA8
_08087200: .4byte 0x02036FF0
	thumb_func_end GetLinkPlayerCoords

	thumb_func_start GetLinkPlayerFacingDirection
GetLinkPlayerFacingDirection: @ 0x08087204
	lsls r0, r0, #0x18
	ldr r1, _0808721C
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08087220
	adds r0, r0, r1
	ldrb r0, [r0, #0x19]
	bx lr
	.align 2, 0
_0808721C: .4byte 0x02031FA8
_08087220: .4byte 0x02036FF0
	thumb_func_end GetLinkPlayerFacingDirection

	thumb_func_start GetLinkPlayerElevation
GetLinkPlayerElevation: @ 0x08087224
	lsls r0, r0, #0x18
	ldr r1, _08087240
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08087244
	adds r0, r0, r1
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bx lr
	.align 2, 0
_08087240: .4byte 0x02031FA8
_08087244: .4byte 0x02036FF0
	thumb_func_end GetLinkPlayerElevation

	thumb_func_start sub_08087248
sub_08087248: @ 0x08087248
	lsls r0, r0, #0x18
	ldr r1, _08087268
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808726C
	adds r0, r0, r1
	adds r0, #0x21
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0x10
	subs r0, r0, r1
	bx lr
	.align 2, 0
_08087268: .4byte 0x02031FA8
_0808726C: .4byte 0x02036FF0
	thumb_func_end sub_08087248

	thumb_func_start GetLinkPlayerIdAt
GetLinkPlayerIdAt: @ 0x08087270
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r5, _080872B4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
_0808727E:
	lsls r0, r2, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _080872BC
	ldrb r0, [r1, #3]
	cmp r0, #0
	beq _08087292
	cmp r0, #2
	bne _080872BC
_08087292:
	ldrb r1, [r1, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080872B8
	adds r1, r0, r1
	movs r6, #0x10
	ldrsh r0, [r1, r6]
	cmp r0, r4
	bne _080872BC
	movs r6, #0x12
	ldrsh r0, [r1, r6]
	cmp r0, r3
	bne _080872BC
	adds r0, r2, #0
	b _080872C8
	.align 2, 0
_080872B4: .4byte 0x02031FA8
_080872B8: .4byte 0x02036FF0
_080872BC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0808727E
	movs r0, #4
_080872C8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetLinkPlayerIdAt

	thumb_func_start SetPlayerFacingDirection
SetPlayerFacingDirection: @ 0x080872D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r2, r3, #0
	lsrs r0, r0, #0x16
	ldr r1, _08087300
	adds r5, r0, r1
	ldrb r1, [r5, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08087304
	adds r6, r0, r1
	ldrb r0, [r5]
	cmp r0, #0
	beq _0808732C
	cmp r3, #0xa
	bls _08087308
	ldrb r0, [r6]
	movs r1, #4
	orrs r0, r1
	strb r0, [r6]
	b _0808732C
	.align 2, 0
_08087300: .4byte 0x02031FA8
_08087304: .4byte 0x02036FF0
_08087308:
	ldr r4, _08087334
	ldr r1, _08087338
	ldrb r0, [r5, #3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl _call_via_r2
_0808732C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087334: .4byte 0x0830FD4C
_08087338: .4byte 0x0830FD14
	thumb_func_end SetPlayerFacingDirection

	thumb_func_start MovementEventModeCB_Normal
MovementEventModeCB_Normal: @ 0x0808733C
	push {r4, lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, _08087358
	lsls r3, r2, #2
	adds r3, r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087358: .4byte 0x0830FD20
	thumb_func_end MovementEventModeCB_Normal

	thumb_func_start MovementEventModeCB_Ignored
MovementEventModeCB_Ignored: @ 0x0808735C
	movs r0, #1
	bx lr
	thumb_func_end MovementEventModeCB_Ignored

	thumb_func_start MovementEventModeCB_Normal_2
MovementEventModeCB_Normal_2: @ 0x08087360
	push {r4, lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, _0808737C
	lsls r3, r2, #2
	adds r3, r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808737C: .4byte 0x0830FD20
	thumb_func_end MovementEventModeCB_Normal_2

	thumb_func_start FacingHandler_DoNothing
FacingHandler_DoNothing: @ 0x08087380
	movs r0, #0
	bx lr
	thumb_func_end FacingHandler_DoNothing

	thumb_func_start FacingHandler_DpadMovement
FacingHandler_DpadMovement: @ 0x08087384
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r5, #0x19]
	bl FlipVerticalAndClearForced
	strb r0, [r5, #0x19]
	ldrb r1, [r5, #0x19]
	mov r6, sp
	adds r6, #2
	adds r0, r5, #0
	mov r2, sp
	adds r3, r6, #0
	bl EventObjectMoveDestCoords
	ldrb r0, [r4, #2]
	ldrb r1, [r5, #0x19]
	mov r2, sp
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	bl LinkPlayerDetectCollision
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080873E2
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r2, [r6, r3]
	adds r0, r5, #0
	bl ShiftEventObjectCoords
	adds r0, r5, #0
	bl EventObjectUpdateZCoord
	movs r0, #1
	b _080873E4
_080873E2:
	movs r0, #0
_080873E4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end FacingHandler_DpadMovement

	thumb_func_start FacingHandler_ForcedFacingChange
FacingHandler_ForcedFacingChange: @ 0x080873EC
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4, #0x19]
	bl FlipVerticalAndClearForced
	strb r0, [r4, #0x19]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FacingHandler_ForcedFacingChange

	thumb_func_start MovementStatusHandler_EnterFreeMode
MovementStatusHandler_EnterFreeMode: @ 0x08087404
	movs r1, #0
	strb r1, [r0, #3]
	bx lr
	.align 2, 0
	thumb_func_end MovementStatusHandler_EnterFreeMode

	thumb_func_start MovementStatusHandler_TryAdvanceScript
MovementStatusHandler_TryAdvanceScript: @ 0x0808740C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x21
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	movs r0, #1
	strb r0, [r6, #3]
	ldrb r0, [r4, #0x19]
	adds r1, #0xc
	adds r2, r4, #0
	adds r2, #0xe
	bl MoveCoords
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808743C
	adds r0, r4, #0
	bl ShiftStillEventObjectCoords
	movs r0, #2
	strb r0, [r6, #3]
_0808743C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MovementStatusHandler_TryAdvanceScript

	thumb_func_start FlipVerticalAndClearForced
FlipVerticalAndClearForced: @ 0x08087444
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	subs r0, #1
	cmp r0, #9
	bhi _0808749C
	lsls r0, r0, #2
	ldr r1, _08087460
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08087460: .4byte 0x08087464
_08087464: @ jump table
	.4byte _0808748C @ case 0
	.4byte _08087490 @ case 1
	.4byte _08087494 @ case 2
	.4byte _08087498 @ case 3
	.4byte _0808749C @ case 4
	.4byte _0808749C @ case 5
	.4byte _0808748C @ case 6
	.4byte _08087490 @ case 7
	.4byte _08087494 @ case 8
	.4byte _08087498 @ case 9
_0808748C:
	movs r0, #2
	b _0808749E
_08087490:
	movs r0, #1
	b _0808749E
_08087494:
	movs r0, #3
	b _0808749E
_08087498:
	movs r0, #4
	b _0808749E
_0808749C:
	adds r0, r2, #0
_0808749E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FlipVerticalAndClearForced

	thumb_func_start LinkPlayerDetectCollision
LinkPlayerDetectCollision: @ 0x080874A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov ip, r2
	lsls r3, r3, #0x10
	movs r4, #0
	ldr r0, _08087508
	mov sb, r0
	lsrs r2, r3, #0x10
	mov sl, r2
	asrs r6, r3, #0x10
_080874C8:
	mov r7, ip
	lsls r3, r7, #0x10
	mov r0, sl
	lsls r5, r0, #0x10
	cmp r4, r8
	beq _0808750C
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	mov r2, sb
	adds r1, r0, r2
	movs r7, #0x10
	ldrsh r0, [r1, r7]
	asrs r2, r3, #0x10
	cmp r0, r2
	bne _080874F0
	movs r7, #0x12
	ldrsh r0, [r1, r7]
	cmp r0, r6
	beq _08087502
_080874F0:
	movs r7, #0x14
	ldrsh r0, [r1, r7]
	cmp r0, r2
	bne _0808750C
	movs r0, #0x16
	ldrsh r1, [r1, r0]
	asrs r0, r5, #0x10
	cmp r1, r0
	bne _0808750C
_08087502:
	movs r0, #1
	b _08087522
	.align 2, 0
_08087508: .4byte 0x02036FF0
_0808750C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080874C8
	asrs r0, r3, #0x10
	asrs r1, r5, #0x10
	bl MapGridIsImpassableAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08087522:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end LinkPlayerDetectCollision

	thumb_func_start CreateLinkPlayerSprite
CreateLinkPlayerSprite: @ 0x08087530
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r5, #2
	ldr r0, _08087564
	adds r2, r2, r0
	ldrb r1, [r2, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08087568
	adds r4, r0, r1
	ldrb r0, [r2]
	cmp r0, #0
	beq _080875DE
	subs r0, r3, #1
	cmp r0, #4
	bhi _080875BA
	lsls r0, r0, #2
	ldr r1, _0808756C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08087564: .4byte 0x02031FA8
_08087568: .4byte 0x02036FF0
_0808756C: .4byte 0x08087570
_08087570: @ jump table
	.4byte _08087590 @ case 0
	.4byte _08087590 @ case 1
	.4byte _0808759C @ case 2
	.4byte _08087584 @ case 3
	.4byte _08087584 @ case 4
_08087584:
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bl sub_0808B6D0
	b _080875A8
_08087590:
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bl GetFRLGAvatarGraphicsIdByGender
	b _080875A8
_0808759C:
	ldrb r1, [r4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	movs r0, #0
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
_080875A8:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080875E8
	movs r2, #0
	str r2, [sp]
	movs r3, #0
	bl AddPseudoEventObject
	strb r0, [r4, #4]
_080875BA:
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080875EC
	adds r0, r0, r1
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, #0x2e]
	ldrb r1, [r4]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
_080875DE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080875E8: .4byte 0x080875F1
_080875EC: .4byte 0x020205AC
	thumb_func_end CreateLinkPlayerSprite

	thumb_func_start SpriteCB_LinkPlayer
SpriteCB_LinkPlayer: @ 0x080875F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	lsls r4, r4, #2
	ldr r0, _08087654
	adds r4, r4, r0
	ldrb r1, [r4, #2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08087658
	adds r6, r0, r1
	ldrh r0, [r6, #0xc]
	strh r0, [r5, #0x20]
	ldrh r0, [r6, #0xe]
	strh r0, [r5, #0x22]
	ldrb r0, [r6, #0xb]
	lsrs r0, r0, #4
	adds r1, r5, #0
	movs r2, #1
	bl SetObjectSubpriorityByZCoord
	ldrb r0, [r6, #0xb]
	lsrs r0, r0, #4
	bl sub_08096718
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _0808765C
	ldrb r0, [r6, #0x19]
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
	b _0808766E
	.align 2, 0
_08087654: .4byte 0x02031FA8
_08087658: .4byte 0x02036FF0
_0808765C:
	ldrb r0, [r6, #0x19]
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnimIfDifferent
_0808766E:
	adds r0, r5, #0
	movs r1, #0
	bl UpdateEventObjectSpriteVisibility
	ldrb r0, [r6]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _080876A0
	ldrh r0, [r5, #0x3c]
	movs r1, #4
	ands r1, r0
	lsls r1, r1, #0x10
	adds r3, r5, #0
	adds r3, #0x3e
	lsrs r1, r1, #0x12
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
_080876A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_LinkPlayer

