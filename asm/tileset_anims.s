.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetTilesetAnimBuffer
ResetTilesetAnimBuffer: @ 0x080A021C
	push {lr}
	sub sp, #4
	ldr r1, _080A023C
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	str r0, [sp]
	ldr r1, _080A0240
	ldr r2, _080A0244
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080A023C: .4byte 0x03000F34
_080A0240: .4byte 0x020372C4
_080A0244: .4byte 0x0500003C
	thumb_func_end ResetTilesetAnimBuffer

	thumb_func_start AppendTilesetAnimToBuffer
AppendTilesetAnimToBuffer: @ 0x080A0248
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r3, _080A0290
	ldrb r0, [r3]
	cmp r0, #0x13
	bhi _080A0288
	ldr r2, _080A0294
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	str r4, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r6, [r0, #8]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080A0288:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0290: .4byte 0x03000F34
_080A0294: .4byte 0x020372C4
	thumb_func_end AppendTilesetAnimToBuffer

	thumb_func_start TransferTilesetAnimsBuffer
TransferTilesetAnimsBuffer: @ 0x080A0298
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r4, _080A02D4
	adds r6, r4, #0
	ldrb r0, [r4]
	cmp r3, r0
	bge _080A02CA
	ldr r2, _080A02D8
	ldr r1, _080A02DC
	movs r5, #0x80
	lsls r5, r5, #0x18
_080A02AE:
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	ldrh r0, [r1, #8]
	lsrs r0, r0, #1
	orrs r0, r5
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r1, #0xc
	adds r3, #1
	ldrb r0, [r4]
	cmp r3, r0
	blt _080A02AE
_080A02CA:
	movs r0, #0
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A02D4: .4byte 0x03000F34
_080A02D8: .4byte 0x040000D4
_080A02DC: .4byte 0x020372C4
	thumb_func_end TransferTilesetAnimsBuffer

	thumb_func_start InitTilesetAnimations
InitTilesetAnimations: @ 0x080A02E0
	push {lr}
	bl ResetTilesetAnimBuffer
	bl _InitPrimaryTilesetAnimation
	bl _InitSecondaryTilesetAnimation
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitTilesetAnimations

	thumb_func_start InitSecondaryTilesetAnimation
InitSecondaryTilesetAnimation: @ 0x080A02F4
	push {lr}
	bl _InitSecondaryTilesetAnimation
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitSecondaryTilesetAnimation

	thumb_func_start UpdateTilesetAnimations
UpdateTilesetAnimations: @ 0x080A0300
	push {r4, lr}
	bl ResetTilesetAnimBuffer
	ldr r2, _080A0358
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ldr r1, _080A035C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	blo _080A031E
	movs r0, #0
	strh r0, [r2]
_080A031E:
	ldr r4, _080A0360
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r1, _080A0364
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	blo _080A0336
	movs r0, #0
	strh r0, [r4]
_080A0336:
	ldr r0, _080A0368
	ldr r1, [r0]
	cmp r1, #0
	beq _080A0344
	ldrh r0, [r2]
	bl _call_via_r1
_080A0344:
	ldr r0, _080A036C
	ldr r1, [r0]
	cmp r1, #0
	beq _080A0352
	ldrh r0, [r4]
	bl _call_via_r1
_080A0352:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0358: .4byte 0x03000F36
_080A035C: .4byte 0x03000F38
_080A0360: .4byte 0x03000F3A
_080A0364: .4byte 0x03000F3C
_080A0368: .4byte 0x03000F40
_080A036C: .4byte 0x03000F44
	thumb_func_end UpdateTilesetAnimations

	thumb_func_start _InitPrimaryTilesetAnimation
_InitPrimaryTilesetAnimation: @ 0x080A0370
	push {lr}
	ldr r0, _080A039C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A03A0
	strh r1, [r0]
	ldr r1, _080A03A4
	movs r0, #0
	str r0, [r1]
	ldr r0, _080A03A8
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _080A0396
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _080A0396
	bl _call_via_r0
_080A0396:
	pop {r0}
	bx r0
	.align 2, 0
_080A039C: .4byte 0x03000F36
_080A03A0: .4byte 0x03000F38
_080A03A4: .4byte 0x03000F40
_080A03A8: .4byte 0x02036FB8
	thumb_func_end _InitPrimaryTilesetAnimation

	thumb_func_start _InitSecondaryTilesetAnimation
_InitSecondaryTilesetAnimation: @ 0x080A03AC
	push {lr}
	ldr r0, _080A03D8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A03DC
	strh r1, [r0]
	ldr r1, _080A03E0
	movs r0, #0
	str r0, [r1]
	ldr r0, _080A03E4
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _080A03D2
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _080A03D2
	bl _call_via_r0
_080A03D2:
	pop {r0}
	bx r0
	.align 2, 0
_080A03D8: .4byte 0x03000F3A
_080A03DC: .4byte 0x03000F3C
_080A03E0: .4byte 0x03000F44
_080A03E4: .4byte 0x02036FB8
	thumb_func_end _InitSecondaryTilesetAnimation

	thumb_func_start InitTilesetAnim_General
InitTilesetAnim_General: @ 0x080A03E8
	ldr r1, _080A0400
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0404
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080A0408
	ldr r0, _080A040C
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0400: .4byte 0x03000F36
_080A0404: .4byte 0x03000F38
_080A0408: .4byte 0x03000F40
_080A040C: .4byte 0x080A0439
	thumb_func_end InitTilesetAnim_General

	thumb_func_start InitTilesetAnim_Building
InitTilesetAnim_Building: @ 0x080A0410
	ldr r1, _080A0428
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A042C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080A0430
	ldr r0, _080A0434
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0428: .4byte 0x03000F36
_080A042C: .4byte 0x03000F38
_080A0430: .4byte 0x03000F40
_080A0434: .4byte 0x080A047D
	thumb_func_end InitTilesetAnim_Building

	thumb_func_start TilesetAnim_General
TilesetAnim_General: @ 0x080A0438
	push {r4, r5, lr}
	lsls r5, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r5
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080A044E
	lsrs r0, r5, #0x14
	bl QueueAnimTiles_General_Flower
_080A044E:
	cmp r4, #1
	bne _080A0458
	lsrs r0, r5, #0x14
	bl QueueAnimTiles_General_Water
_080A0458:
	cmp r4, #2
	bne _080A0462
	lsrs r0, r5, #0x14
	bl QueueAnimTiles_General_SandWaterEdge
_080A0462:
	cmp r4, #3
	bne _080A046C
	lsrs r0, r5, #0x14
	bl QueueAnimTiles_General_Waterfall
_080A046C:
	cmp r4, #4
	bne _080A0476
	lsrs r0, r5, #0x14
	bl QueueAnimTiles_General_LandWaterEdge
_080A0476:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_General

	thumb_func_start TilesetAnim_Building
TilesetAnim_Building: @ 0x080A047C
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	bne _080A0490
	lsrs r0, r1, #0x13
	bl QueueAnimTiles_Building_TVTurnedOn
_080A0490:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_Building

	thumb_func_start QueueAnimTiles_General_Flower
QueueAnimTiles_General_Flower: @ 0x080A0494
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A04B4
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A04B8
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A04B4: .4byte 0x084E8E70
_080A04B8: .4byte 0x06003F80
	thumb_func_end QueueAnimTiles_General_Flower

	thumb_func_start QueueAnimTiles_General_Water
QueueAnimTiles_General_Water: @ 0x080A04BC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	ldr r1, _080A04DC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080A04E0
	movs r2, #0xf0
	lsls r2, r2, #2
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A04DC: .4byte 0x084EAC80
_080A04E0: .4byte 0x06003600
	thumb_func_end QueueAnimTiles_General_Water

	thumb_func_start QueueAnimTiles_General_SandWaterEdge
QueueAnimTiles_General_SandWaterEdge: @ 0x080A04E4
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	ldr r0, _080A0504
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0508
	movs r2, #0xa0
	lsls r2, r2, #1
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0504: .4byte 0x084EB560
_080A0508: .4byte 0x06003A00
	thumb_func_end QueueAnimTiles_General_SandWaterEdge

	thumb_func_start QueueAnimTiles_General_Waterfall
QueueAnimTiles_General_Waterfall: @ 0x080A050C
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A052C
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0530
	movs r2, #0xc0
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A052C: .4byte 0x084EB880
_080A0530: .4byte 0x06003E00
	thumb_func_end QueueAnimTiles_General_Waterfall

	thumb_func_start InitTilesetAnim_Fallarbor
InitTilesetAnim_Fallarbor: @ 0x080A0534
	ldr r1, _080A054C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0550
	ldr r0, _080A0554
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0558
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A054C: .4byte 0x03000F3A
_080A0550: .4byte 0x03000F3C
_080A0554: .4byte 0x03000F38
_080A0558: .4byte 0x03000F44
	thumb_func_end InitTilesetAnim_Fallarbor

	thumb_func_start InitTilesetAnim_BattleFrontierOutsideEast
InitTilesetAnim_BattleFrontierOutsideEast: @ 0x080A055C
	ldr r1, _080A0574
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0578
	ldr r0, _080A057C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0580
	ldr r0, _080A0584
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0574: .4byte 0x03000F3A
_080A0578: .4byte 0x03000F3C
_080A057C: .4byte 0x03000F38
_080A0580: .4byte 0x03000F44
_080A0584: .4byte 0x080A0905
	thumb_func_end InitTilesetAnim_BattleFrontierOutsideEast

	thumb_func_start InitTilesetAnim_BattleFrontierOutsideWest
InitTilesetAnim_BattleFrontierOutsideWest: @ 0x080A0588
	ldr r1, _080A05A0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A05A4
	ldr r0, _080A05A8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A05AC
	ldr r0, _080A05B0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A05A0: .4byte 0x03000F3A
_080A05A4: .4byte 0x03000F3C
_080A05A8: .4byte 0x03000F38
_080A05AC: .4byte 0x03000F44
_080A05B0: .4byte 0x080A0981
	thumb_func_end InitTilesetAnim_BattleFrontierOutsideWest

	thumb_func_start InitTilesetAnim_BattlePyramid
InitTilesetAnim_BattlePyramid: @ 0x080A05B4
	ldr r1, _080A05CC
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A05D0
	ldr r0, _080A05D4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A05D8
	ldr r0, _080A05DC
	str r0, [r1]
	bx lr
	.align 2, 0
_080A05CC: .4byte 0x03000F3A
_080A05D0: .4byte 0x03000F3C
_080A05D4: .4byte 0x03000F38
_080A05D8: .4byte 0x03000F44
_080A05DC: .4byte 0x080A0999
	thumb_func_end InitTilesetAnim_BattlePyramid

	thumb_func_start InitTilesetAnim_Mauville
InitTilesetAnim_Mauville: @ 0x080A05E0
	ldr r1, _080A05F8
	ldr r0, _080A05FC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0600
	ldr r0, _080A0604
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0608
	ldr r0, _080A060C
	str r0, [r1]
	bx lr
	.align 2, 0
_080A05F8: .4byte 0x03000F3A
_080A05FC: .4byte 0x03000F36
_080A0600: .4byte 0x03000F3C
_080A0604: .4byte 0x03000F38
_080A0608: .4byte 0x03000F44
_080A060C: .4byte 0x080A09B1
	thumb_func_end InitTilesetAnim_Mauville

	thumb_func_start InitTilesetAnim_BikeShop
InitTilesetAnim_BikeShop: @ 0x080A0610
	ldr r1, _080A0628
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A062C
	ldr r0, _080A0630
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0634
	ldr r0, _080A0638
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0628: .4byte 0x03000F3A
_080A062C: .4byte 0x03000F3C
_080A0630: .4byte 0x03000F38
_080A0634: .4byte 0x03000F44
_080A0638: .4byte 0x080A0A25
	thumb_func_end InitTilesetAnim_BikeShop

	thumb_func_start InitTilesetAnim_Fortree
InitTilesetAnim_Fortree: @ 0x080A063C
	ldr r1, _080A0654
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0658
	ldr r0, _080A065C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0660
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0654: .4byte 0x03000F3A
_080A0658: .4byte 0x03000F3C
_080A065C: .4byte 0x03000F38
_080A0660: .4byte 0x03000F44
	thumb_func_end InitTilesetAnim_Fortree

	thumb_func_start InitTilesetAnim_Lilycove
InitTilesetAnim_Lilycove: @ 0x080A0664
	ldr r1, _080A067C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0680
	ldr r0, _080A0684
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0688
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A067C: .4byte 0x03000F3A
_080A0680: .4byte 0x03000F3C
_080A0684: .4byte 0x03000F38
_080A0688: .4byte 0x03000F44
	thumb_func_end InitTilesetAnim_Lilycove

	thumb_func_start InitTilesetAnim_Mossdeep
InitTilesetAnim_Mossdeep: @ 0x080A068C
	ldr r1, _080A06A4
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A06A8
	ldr r0, _080A06AC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A06B0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A06A4: .4byte 0x03000F3A
_080A06A8: .4byte 0x03000F3C
_080A06AC: .4byte 0x03000F38
_080A06B0: .4byte 0x03000F44
	thumb_func_end InitTilesetAnim_Mossdeep

	thumb_func_start InitTilesetAnim_Petalburg
InitTilesetAnim_Petalburg: @ 0x080A06B4
	ldr r1, _080A06CC
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A06D0
	ldr r0, _080A06D4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A06D8
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A06CC: .4byte 0x03000F3A
_080A06D0: .4byte 0x03000F3C
_080A06D4: .4byte 0x03000F38
_080A06D8: .4byte 0x03000F44
	thumb_func_end InitTilesetAnim_Petalburg

	thumb_func_start InitTilesetAnim_Cave
InitTilesetAnim_Cave: @ 0x080A06DC
	ldr r1, _080A06F4
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A06F8
	ldr r0, _080A06FC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0700
	ldr r0, _080A0704
	str r0, [r1]
	bx lr
	.align 2, 0
_080A06F4: .4byte 0x03000F3A
_080A06F8: .4byte 0x03000F3C
_080A06FC: .4byte 0x03000F38
_080A0700: .4byte 0x03000F44
_080A0704: .4byte 0x080A0A51
	thumb_func_end InitTilesetAnim_Cave

	thumb_func_start InitTilesetAnim_Pacifidlog
InitTilesetAnim_Pacifidlog: @ 0x080A0708
	ldr r1, _080A0720
	ldr r0, _080A0724
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0728
	ldr r0, _080A072C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0730
	ldr r0, _080A0734
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0720: .4byte 0x03000F3A
_080A0724: .4byte 0x03000F36
_080A0728: .4byte 0x03000F3C
_080A072C: .4byte 0x03000F38
_080A0730: .4byte 0x03000F44
_080A0734: .4byte 0x080A0AC5
	thumb_func_end InitTilesetAnim_Pacifidlog

	thumb_func_start InitTilesetAnim_Dewford
InitTilesetAnim_Dewford: @ 0x080A0738
	ldr r1, _080A0750
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0754
	ldr r0, _080A0758
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A075C
	ldr r0, _080A0760
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0750: .4byte 0x03000F3A
_080A0754: .4byte 0x03000F3C
_080A0758: .4byte 0x03000F38
_080A075C: .4byte 0x03000F44
_080A0760: .4byte 0x080A0AF5
	thumb_func_end InitTilesetAnim_Dewford

	thumb_func_start InitTilesetAnim_EverGrande
InitTilesetAnim_EverGrande: @ 0x080A0764
	ldr r1, _080A077C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0780
	ldr r0, _080A0784
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0788
	ldr r0, _080A078C
	str r0, [r1]
	bx lr
	.align 2, 0
_080A077C: .4byte 0x03000F3A
_080A0780: .4byte 0x03000F3C
_080A0784: .4byte 0x03000F38
_080A0788: .4byte 0x03000F44
_080A078C: .4byte 0x080A0B45
	thumb_func_end InitTilesetAnim_EverGrande

	thumb_func_start InitTilesetAnim_Lavaridge
InitTilesetAnim_Lavaridge: @ 0x080A0790
	ldr r1, _080A07A8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A07AC
	ldr r0, _080A07B0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A07B4
	ldr r0, _080A07B8
	str r0, [r1]
	bx lr
	.align 2, 0
_080A07A8: .4byte 0x03000F3A
_080A07AC: .4byte 0x03000F3C
_080A07B0: .4byte 0x03000F38
_080A07B4: .4byte 0x03000F44
_080A07B8: .4byte 0x080A0B5D
	thumb_func_end InitTilesetAnim_Lavaridge

	thumb_func_start InitTilesetAnim_EliteFour
InitTilesetAnim_EliteFour: @ 0x080A07BC
	ldr r1, _080A07D0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A07D4
	movs r0, #0x80
	strh r0, [r1]
	ldr r1, _080A07D8
	ldr r0, _080A07DC
	str r0, [r1]
	bx lr
	.align 2, 0
_080A07D0: .4byte 0x03000F3A
_080A07D4: .4byte 0x03000F3C
_080A07D8: .4byte 0x03000F44
_080A07DC: .4byte 0x080A0B0D
	thumb_func_end InitTilesetAnim_EliteFour

	thumb_func_start InitTilesetAnim_SootopolisGym
InitTilesetAnim_SootopolisGym: @ 0x080A07E0
	ldr r1, _080A07F4
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A07F8
	movs r0, #0xf0
	strh r0, [r1]
	ldr r1, _080A07FC
	ldr r0, _080A0800
	str r0, [r1]
	bx lr
	.align 2, 0
_080A07F4: .4byte 0x03000F3A
_080A07F8: .4byte 0x03000F3C
_080A07FC: .4byte 0x03000F44
_080A0800: .4byte 0x080A0EA1
	thumb_func_end InitTilesetAnim_SootopolisGym

	thumb_func_start InitTilesetAnim_MauvilleGym
InitTilesetAnim_MauvilleGym: @ 0x080A0804
	ldr r1, _080A081C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0820
	ldr r0, _080A0824
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0828
	ldr r0, _080A082C
	str r0, [r1]
	bx lr
	.align 2, 0
_080A081C: .4byte 0x03000F3A
_080A0820: .4byte 0x03000F3C
_080A0824: .4byte 0x03000F38
_080A0828: .4byte 0x03000F44
_080A082C: .4byte 0x080A0B29
	thumb_func_end InitTilesetAnim_MauvilleGym

	thumb_func_start InitTilesetAnim_Underwater
InitTilesetAnim_Underwater: @ 0x080A0830
	ldr r1, _080A0844
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0848
	movs r0, #0x80
	strh r0, [r1]
	ldr r1, _080A084C
	ldr r0, _080A0850
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0844: .4byte 0x03000F3A
_080A0848: .4byte 0x03000F3C
_080A084C: .4byte 0x03000F44
_080A0850: .4byte 0x080A0EB9
	thumb_func_end InitTilesetAnim_Underwater

	thumb_func_start InitTilesetAnim_Rustboro
InitTilesetAnim_Rustboro: @ 0x080A0854
	ldr r1, _080A086C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A0870
	ldr r0, _080A0874
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A0878
	ldr r0, _080A087C
	str r0, [r1]
	bx lr
	.align 2, 0
_080A086C: .4byte 0x03000F3A
_080A0870: .4byte 0x03000F3C
_080A0874: .4byte 0x03000F38
_080A0878: .4byte 0x03000F44
_080A087C: .4byte 0x080A0E89
	thumb_func_end InitTilesetAnim_Rustboro

	thumb_func_start InitTilesetAnim_Slateport
InitTilesetAnim_Slateport: @ 0x080A0880
	ldr r1, _080A0898
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A089C
	ldr r0, _080A08A0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A08A4
	ldr r0, _080A08A8
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0898: .4byte 0x03000F3A
_080A089C: .4byte 0x03000F3C
_080A08A0: .4byte 0x03000F38
_080A08A4: .4byte 0x03000F44
_080A08A8: .4byte 0x080A0EE5
	thumb_func_end InitTilesetAnim_Slateport

	thumb_func_start InitTilesetAnim_Sootopolis
InitTilesetAnim_Sootopolis: @ 0x080A08AC
	ldr r1, _080A08C4
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A08C8
	ldr r0, _080A08CC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A08D0
	ldr r0, _080A08D4
	str r0, [r1]
	bx lr
	.align 2, 0
_080A08C4: .4byte 0x03000F3A
_080A08C8: .4byte 0x03000F3C
_080A08CC: .4byte 0x03000F38
_080A08D0: .4byte 0x03000F44
_080A08D4: .4byte 0x080A0EFD
	thumb_func_end InitTilesetAnim_Sootopolis

	thumb_func_start InitTilesetAnim_BattleDome
InitTilesetAnim_BattleDome: @ 0x080A08D8
	ldr r1, _080A08F0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A08F4
	ldr r0, _080A08F8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080A08FC
	ldr r0, _080A0900
	str r0, [r1]
	bx lr
	.align 2, 0
_080A08F0: .4byte 0x03000F3A
_080A08F4: .4byte 0x03000F3C
_080A08F8: .4byte 0x03000F38
_080A08FC: .4byte 0x03000F44
_080A0900: .4byte 0x080A0F21
	thumb_func_end InitTilesetAnim_BattleDome

	thumb_func_start TilesetAnim_Rustboro
TilesetAnim_Rustboro: @ 0x080A0904
	push {r4, r5, r6, lr}
	lsls r5, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r5
	lsrs r6, r0, #0x10
	cmp r6, #0
	bne _080A0924
	lsrs r4, r5, #0x13
	adds r0, r4, #0
	movs r1, #0
	bl QueueAnimTiles_Rustboro_WindyWater
	adds r0, r4, #0
	bl QueueAnimTiles_Rustboro_Fountain
_080A0924:
	cmp r6, #1
	bne _080A0930
	lsrs r0, r5, #0x13
	movs r1, #1
	bl QueueAnimTiles_Rustboro_WindyWater
_080A0930:
	cmp r6, #2
	bne _080A093C
	lsrs r0, r5, #0x13
	movs r1, #2
	bl QueueAnimTiles_Rustboro_WindyWater
_080A093C:
	cmp r6, #3
	bne _080A0948
	lsrs r0, r5, #0x13
	movs r1, #3
	bl QueueAnimTiles_Rustboro_WindyWater
_080A0948:
	cmp r6, #4
	bne _080A0954
	lsrs r0, r5, #0x13
	movs r1, #4
	bl QueueAnimTiles_Rustboro_WindyWater
_080A0954:
	cmp r6, #5
	bne _080A0960
	lsrs r0, r5, #0x13
	movs r1, #5
	bl QueueAnimTiles_Rustboro_WindyWater
_080A0960:
	cmp r6, #6
	bne _080A096C
	lsrs r0, r5, #0x13
	movs r1, #6
	bl QueueAnimTiles_Rustboro_WindyWater
_080A096C:
	cmp r6, #7
	bne _080A0978
	lsrs r0, r5, #0x13
	movs r1, #7
	bl QueueAnimTiles_Rustboro_WindyWater
_080A0978:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TilesetAnim_Rustboro

	thumb_func_start TilesetAnim_Dewford
TilesetAnim_Dewford: @ 0x080A0980
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	bne _080A0994
	lsrs r0, r1, #0x13
	bl QueueAnimTiles_Dewford_Flag
_080A0994:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_Dewford

	thumb_func_start TilesetAnim_Slateport
TilesetAnim_Slateport: @ 0x080A0998
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _080A09AC
	lsrs r0, r1, #0x14
	bl QueueAnimTiles_Slateport_Balloons
_080A09AC:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_Slateport

	thumb_func_start TilesetAnim_Mauville
TilesetAnim_Mauville: @ 0x080A09B0
	push {r4, r5, lr}
	lsls r4, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r4
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080A09C8
	lsrs r0, r4, #0x13
	movs r1, #0
	bl QueueAnimTiles_Mauville_Flowers
_080A09C8:
	cmp r5, #1
	bne _080A09D4
	lsrs r0, r4, #0x13
	movs r1, #1
	bl QueueAnimTiles_Mauville_Flowers
_080A09D4:
	cmp r5, #2
	bne _080A09E0
	lsrs r0, r4, #0x13
	movs r1, #2
	bl QueueAnimTiles_Mauville_Flowers
_080A09E0:
	cmp r5, #3
	bne _080A09EC
	lsrs r0, r4, #0x13
	movs r1, #3
	bl QueueAnimTiles_Mauville_Flowers
_080A09EC:
	cmp r5, #4
	bne _080A09F8
	lsrs r0, r4, #0x13
	movs r1, #4
	bl QueueAnimTiles_Mauville_Flowers
_080A09F8:
	cmp r5, #5
	bne _080A0A04
	lsrs r0, r4, #0x13
	movs r1, #5
	bl QueueAnimTiles_Mauville_Flowers
_080A0A04:
	cmp r5, #6
	bne _080A0A10
	lsrs r0, r4, #0x13
	movs r1, #6
	bl QueueAnimTiles_Mauville_Flowers
_080A0A10:
	cmp r5, #7
	bne _080A0A1C
	lsrs r0, r4, #0x13
	movs r1, #7
	bl QueueAnimTiles_Mauville_Flowers
_080A0A1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TilesetAnim_Mauville

	thumb_func_start TilesetAnim_Lavaridge
TilesetAnim_Lavaridge: @ 0x080A0A24
	push {r4, r5, lr}
	lsls r4, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r4
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080A0A3E
	lsrs r0, r4, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl QueueAnimTiles_Lavaridge_Steam
_080A0A3E:
	cmp r5, #1
	bne _080A0A48
	lsrs r0, r4, #0x14
	bl QueueAnimTiles_Lavaridge_Lava
_080A0A48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TilesetAnim_Lavaridge

	thumb_func_start TilesetAnim_EverGrande
TilesetAnim_EverGrande: @ 0x080A0A50
	push {r4, r5, lr}
	lsls r4, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r4
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080A0A68
	lsrs r0, r4, #0x13
	movs r1, #0
	bl QueueAnimTiles_EverGrande_Flowers
_080A0A68:
	cmp r5, #1
	bne _080A0A74
	lsrs r0, r4, #0x13
	movs r1, #1
	bl QueueAnimTiles_EverGrande_Flowers
_080A0A74:
	cmp r5, #2
	bne _080A0A80
	lsrs r0, r4, #0x13
	movs r1, #2
	bl QueueAnimTiles_EverGrande_Flowers
_080A0A80:
	cmp r5, #3
	bne _080A0A8C
	lsrs r0, r4, #0x13
	movs r1, #3
	bl QueueAnimTiles_EverGrande_Flowers
_080A0A8C:
	cmp r5, #4
	bne _080A0A98
	lsrs r0, r4, #0x13
	movs r1, #4
	bl QueueAnimTiles_EverGrande_Flowers
_080A0A98:
	cmp r5, #5
	bne _080A0AA4
	lsrs r0, r4, #0x13
	movs r1, #5
	bl QueueAnimTiles_EverGrande_Flowers
_080A0AA4:
	cmp r5, #6
	bne _080A0AB0
	lsrs r0, r4, #0x13
	movs r1, #6
	bl QueueAnimTiles_EverGrande_Flowers
_080A0AB0:
	cmp r5, #7
	bne _080A0ABC
	lsrs r0, r4, #0x13
	movs r1, #7
	bl QueueAnimTiles_EverGrande_Flowers
_080A0ABC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TilesetAnim_EverGrande

	thumb_func_start TilesetAnim_Pacifidlog
TilesetAnim_Pacifidlog: @ 0x080A0AC4
	push {r4, r5, lr}
	lsls r4, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r4
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080A0ADE
	lsrs r0, r4, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl QueueAnimTiles_Pacifidlog_LogBridges
_080A0ADE:
	cmp r5, #1
	bne _080A0AEC
	lsrs r0, r4, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl QueueAnimTiles_Pacifidlog_WaterCurrents
_080A0AEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TilesetAnim_Pacifidlog

	thumb_func_start TilesetAnim_Sootopolis
TilesetAnim_Sootopolis: @ 0x080A0AF4
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _080A0B08
	lsrs r0, r1, #0x14
	bl QueueAnimTiles_Sootopolis_StormyWater
_080A0B08:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_Sootopolis

	thumb_func_start TilesetAnim_Underwater
TilesetAnim_Underwater: @ 0x080A0B0C
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _080A0B24
	lsrs r0, r1, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl QueueAnimTiles_Underwater_Seaweed
_080A0B24:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_Underwater

	thumb_func_start TilesetAnim_Cave
TilesetAnim_Cave: @ 0x080A0B28
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _080A0B3E
	lsrs r0, r1, #0x14
	bl QueueAnimTiles_Cave_Lava
_080A0B3E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TilesetAnim_Cave

	thumb_func_start TilesetAnim_BattleFrontierOutsideWest
TilesetAnim_BattleFrontierOutsideWest: @ 0x080A0B44
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	bne _080A0B58
	lsrs r0, r1, #0x13
	bl QueueAnimTiles_BattleFrontierOutsideWest_Flag
_080A0B58:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_BattleFrontierOutsideWest

	thumb_func_start TilesetAnim_BattleFrontierOutsideEast
TilesetAnim_BattleFrontierOutsideEast: @ 0x080A0B5C
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	bne _080A0B70
	lsrs r0, r1, #0x13
	bl QueueAnimTiles_BattleFrontierOutsideEast_Flag
_080A0B70:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_BattleFrontierOutsideEast

	thumb_func_start QueueAnimTiles_General_LandWaterEdge
QueueAnimTiles_General_LandWaterEdge: @ 0x080A0B74
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A0B94
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0B98
	movs r2, #0xa0
	lsls r2, r2, #1
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0B94: .4byte 0x084EBD90
_080A0B98: .4byte 0x06003C00
	thumb_func_end QueueAnimTiles_General_LandWaterEdge

	thumb_func_start QueueAnimTiles_Lavaridge_Steam
QueueAnimTiles_Lavaridge_Steam: @ 0x080A0B9C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #3
	ands r0, r4
	ldr r5, _080A0BD8
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _080A0BDC
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	adds r1, r4, #2
	adds r0, r1, #0
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _080A0BE0
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0BD8: .4byte 0x084EBFA0
_080A0BDC: .4byte 0x06006400
_080A0BE0: .4byte 0x06006480
	thumb_func_end QueueAnimTiles_Lavaridge_Steam

	thumb_func_start QueueAnimTiles_Pacifidlog_LogBridges
QueueAnimTiles_Pacifidlog_LogBridges: @ 0x080A0BE4
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x12
	ands r1, r0
	ldr r0, _080A0C04
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0C08
	movs r2, #0xf0
	lsls r2, r2, #2
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0C04: .4byte 0x084ECAF0
_080A0C08: .4byte 0x06007A00
	thumb_func_end QueueAnimTiles_Pacifidlog_LogBridges

	thumb_func_start QueueAnimTiles_Underwater_Seaweed
QueueAnimTiles_Underwater_Seaweed: @ 0x080A0C0C
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x12
	ands r1, r0
	ldr r0, _080A0C2C
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0C30
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0C2C: .4byte 0x084ECD00
_080A0C30: .4byte 0x06007E00
	thumb_func_end QueueAnimTiles_Underwater_Seaweed

	thumb_func_start QueueAnimTiles_Pacifidlog_WaterCurrents
QueueAnimTiles_Pacifidlog_WaterCurrents: @ 0x080A0C34
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ands r1, r0
	ldr r0, _080A0C54
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0C58
	movs r2, #0x80
	lsls r2, r2, #1
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0C54: .4byte 0x084ED510
_080A0C58: .4byte 0x06007E00
	thumb_func_end QueueAnimTiles_Pacifidlog_WaterCurrents

	thumb_func_start QueueAnimTiles_Mauville_Flowers
QueueAnimTiles_Mauville_Flowers: @ 0x080A0C5C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	subs r0, r5, r6
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xb
	bhi _080A0CB8
	adds r0, r5, #0
	movs r1, #0xc
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	ldr r0, _080A0CA8
	lsrs r4, r4, #0xe
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _080A0CAC
	lsls r5, r6, #2
	adds r1, r5, r1
	ldr r1, [r1]
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	ldr r0, _080A0CB0
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _080A0CB4
	adds r5, r5, r1
	ldr r1, [r5]
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	b _080A0CE4
	.align 2, 0
_080A0CA8: .4byte 0x084EDA90
_080A0CAC: .4byte 0x084EDA50
_080A0CB0: .4byte 0x084EDAC0
_080A0CB4: .4byte 0x084EDA70
_080A0CB8:
	movs r0, #3
	ands r5, r0
	ldr r0, _080A0CEC
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _080A0CF0
	lsls r4, r6, #2
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	ldr r0, _080A0CF4
	adds r5, r5, r0
	ldr r0, [r5]
	ldr r1, _080A0CF8
	adds r4, r4, r1
	ldr r1, [r4]
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
_080A0CE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0CEC: .4byte 0x084EDAF0
_080A0CF0: .4byte 0x084EDA50
_080A0CF4: .4byte 0x084EDB00
_080A0CF8: .4byte 0x084EDA70
	thumb_func_end QueueAnimTiles_Mauville_Flowers

	thumb_func_start QueueAnimTiles_Rustboro_WindyWater
QueueAnimTiles_Rustboro_WindyWater: @ 0x080A0CFC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	subs r0, r0, r3
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	ldr r0, _080A0D30
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r2, [r1]
	cmp r2, #0
	beq _080A0D2C
	ldr r0, _080A0D34
	lsls r1, r3, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
_080A0D2C:
	pop {r0}
	bx r0
	.align 2, 0
_080A0D30: .4byte 0x084EDF30
_080A0D34: .4byte 0x084EDF10
	thumb_func_end QueueAnimTiles_Rustboro_WindyWater

	thumb_func_start QueueAnimTiles_Rustboro_Fountain
QueueAnimTiles_Rustboro_Fountain: @ 0x080A0D38
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	ldr r1, _080A0D58
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080A0D5C
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0D58: .4byte 0x084EE070
_080A0D5C: .4byte 0x06007800
	thumb_func_end QueueAnimTiles_Rustboro_Fountain

	thumb_func_start QueueAnimTiles_Lavaridge_Lava
QueueAnimTiles_Lavaridge_Lava: @ 0x080A0D60
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A0D80
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0D84
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0D80: .4byte 0x084EE498
_080A0D84: .4byte 0x06005400
	thumb_func_end QueueAnimTiles_Lavaridge_Lava

	thumb_func_start QueueAnimTiles_EverGrande_Flowers
QueueAnimTiles_EverGrande_Flowers: @ 0x080A0D88
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #0x10
	movs r2, #0xe0
	lsls r2, r2, #0xb
	ands r2, r0
	ldr r0, _080A0DB8
	lsrs r2, r2, #0xe
	adds r2, r2, r0
	ldr r0, [r2]
	ldr r2, _080A0DBC
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0DB8: .4byte 0x084EE8E8
_080A0DBC: .4byte 0x084EE8C8
	thumb_func_end QueueAnimTiles_EverGrande_Flowers

	thumb_func_start QueueAnimTiles_Cave_Lava
QueueAnimTiles_Cave_Lava: @ 0x080A0DC0
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A0DE0
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0DE4
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0DE0: .4byte 0x084EE498
_080A0DE4: .4byte 0x06007400
	thumb_func_end QueueAnimTiles_Cave_Lava

	thumb_func_start QueueAnimTiles_Dewford_Flag
QueueAnimTiles_Dewford_Flag: @ 0x080A0DE8
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A0E08
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0E0C
	movs r2, #0xc0
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0E08: .4byte 0x084EEC08
_080A0E0C: .4byte 0x06005540
	thumb_func_end QueueAnimTiles_Dewford_Flag

	thumb_func_start QueueAnimTiles_BattleFrontierOutsideWest_Flag
QueueAnimTiles_BattleFrontierOutsideWest_Flag: @ 0x080A0E10
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A0E30
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0E34
	movs r2, #0xc0
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0E30: .4byte 0x084EEF18
_080A0E34: .4byte 0x06005B40
	thumb_func_end QueueAnimTiles_BattleFrontierOutsideWest_Flag

	thumb_func_start QueueAnimTiles_BattleFrontierOutsideEast_Flag
QueueAnimTiles_BattleFrontierOutsideEast_Flag: @ 0x080A0E38
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A0E58
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0E5C
	movs r2, #0xc0
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0E58: .4byte 0x084EF228
_080A0E5C: .4byte 0x06005B40
	thumb_func_end QueueAnimTiles_BattleFrontierOutsideEast_Flag

	thumb_func_start QueueAnimTiles_Slateport_Balloons
QueueAnimTiles_Slateport_Balloons: @ 0x080A0E60
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A0E80
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0E84
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0E80: .4byte 0x084EF438
_080A0E84: .4byte 0x06005C00
	thumb_func_end QueueAnimTiles_Slateport_Balloons

	thumb_func_start TilesetAnim_MauvilleGym
TilesetAnim_MauvilleGym: @ 0x080A0E88
	push {lr}
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A0E9C
	lsrs r0, r2, #0x11
	bl QueueAnimTiles_MauvilleGym_ElectricGates
_080A0E9C:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_MauvilleGym

	thumb_func_start TilesetAnim_SootopolisGym
TilesetAnim_SootopolisGym: @ 0x080A0EA0
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	bne _080A0EB4
	lsrs r0, r1, #0x13
	bl QueueAnimTiles_SootopolisGym_Waterfalls
_080A0EB4:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_SootopolisGym

	thumb_func_start TilesetAnim_EliteFour
TilesetAnim_EliteFour: @ 0x080A0EB8
	push {r4, r5, lr}
	lsls r4, r0, #0x10
	lsrs r0, r4, #0x10
	adds r5, r0, #0
	movs r0, #0x3f
	ands r0, r5
	cmp r0, #1
	bne _080A0ECE
	lsrs r0, r4, #0x16
	bl QueueAnimTiles_EliteFour_GroundLights
_080A0ECE:
	movs r0, #7
	ands r0, r5
	cmp r0, #1
	bne _080A0EDC
	lsrs r0, r4, #0x13
	bl QueueAnimTiles_EliteFour_WallLights
_080A0EDC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TilesetAnim_EliteFour

	thumb_func_start TilesetAnim_BikeShop
TilesetAnim_BikeShop: @ 0x080A0EE4
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	bne _080A0EF8
	lsrs r0, r1, #0x12
	bl QueueAnimTiles_BikeShop_BlinkingLights
_080A0EF8:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_BikeShop

	thumb_func_start TilesetAnim_BattlePyramid
TilesetAnim_BattlePyramid: @ 0x080A0EFC
	push {r4, lr}
	lsls r4, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r4
	cmp r0, #0
	bne _080A0F18
	lsrs r4, r4, #0x13
	adds r0, r4, #0
	bl QueueAnimTiles_BattlePyramid_Torch
	adds r0, r4, #0
	bl QueueAnimTiles_BattlePyramid_StatueShadow
_080A0F18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TilesetAnim_BattlePyramid

	thumb_func_start TilesetAnim_BattleDome
TilesetAnim_BattleDome: @ 0x080A0F20
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	bne _080A0F34
	lsrs r0, r1, #0x12
	bl BlendAnimPalette_BattleDome_FloorLights
_080A0F34:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_BattleDome

	thumb_func_start TilesetAnim_BattleDome2
TilesetAnim_BattleDome2: @ 0x080A0F38
	push {lr}
	lsls r1, r0, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	bne _080A0F4C
	lsrs r0, r1, #0x12
	bl BlendAnimPalette_BattleDome_FloorLightsNoBlend
_080A0F4C:
	pop {r0}
	bx r0
	thumb_func_end TilesetAnim_BattleDome2

	thumb_func_start QueueAnimTiles_Building_TVTurnedOn
QueueAnimTiles_Building_TVTurnedOn: @ 0x080A0F50
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	ldr r1, _080A0F70
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080A0F74
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0F70: .4byte 0x084EF548
_080A0F74: .4byte 0x06003E00
	thumb_func_end QueueAnimTiles_Building_TVTurnedOn

	thumb_func_start QueueAnimTiles_SootopolisGym_Waterfalls
QueueAnimTiles_SootopolisGym_Waterfalls: @ 0x080A0F78
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	ldr r0, _080A0FB0
	lsrs r4, r4, #0xe
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _080A0FB4
	movs r2, #0xc0
	lsls r2, r2, #1
	bl AppendTilesetAnimToBuffer
	ldr r0, _080A0FB8
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _080A0FBC
	movs r2, #0xa0
	lsls r2, r2, #2
	bl AppendTilesetAnimToBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0FB0: .4byte 0x084F0150
_080A0FB4: .4byte 0x06007E00
_080A0FB8: .4byte 0x084F015C
_080A0FBC: .4byte 0x06007A00
	thumb_func_end QueueAnimTiles_SootopolisGym_Waterfalls

	thumb_func_start QueueAnimTiles_EliteFour_WallLights
QueueAnimTiles_EliteFour_WallLights: @ 0x080A0FC0
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	ldr r0, _080A0FE0
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A0FE4
	movs r2, #0x20
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A0FE0: .4byte 0x084F0308
_080A0FE4: .4byte 0x06007F00
	thumb_func_end QueueAnimTiles_EliteFour_WallLights

	thumb_func_start QueueAnimTiles_EliteFour_GroundLights
QueueAnimTiles_EliteFour_GroundLights: @ 0x080A0FE8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	ldr r1, _080A1008
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080A100C
	movs r2, #0x80
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A1008: .4byte 0x084F0318
_080A100C: .4byte 0x06007C00
	thumb_func_end QueueAnimTiles_EliteFour_GroundLights

	thumb_func_start QueueAnimTiles_MauvilleGym_ElectricGates
QueueAnimTiles_MauvilleGym_ElectricGates: @ 0x080A1010
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	ldr r1, _080A1030
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080A1034
	movs r2, #0x80
	lsls r2, r2, #2
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A1030: .4byte 0x084F0740
_080A1034: .4byte 0x06005200
	thumb_func_end QueueAnimTiles_MauvilleGym_ElectricGates

	thumb_func_start QueueAnimTiles_BikeShop_BlinkingLights
QueueAnimTiles_BikeShop_BlinkingLights: @ 0x080A1038
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	ldr r1, _080A1058
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080A105C
	movs r2, #0x90
	lsls r2, r2, #1
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A1058: .4byte 0x084F09A8
_080A105C: .4byte 0x06007E00
	thumb_func_end QueueAnimTiles_BikeShop_BlinkingLights

	thumb_func_start QueueAnimTiles_Sootopolis_StormyWater
QueueAnimTiles_Sootopolis_StormyWater: @ 0x080A1060
	push {lr}
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	ldr r0, _080A1080
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _080A1084
	movs r2, #0xc0
	lsls r2, r2, #4
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A1080: .4byte 0x084F89D0
_080A1084: .4byte 0x06005E00
	thumb_func_end QueueAnimTiles_Sootopolis_StormyWater

	thumb_func_start QueueAnimTiles_BattlePyramid_Torch
QueueAnimTiles_BattlePyramid_Torch: @ 0x080A1088
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	ldr r1, _080A10AC
	lsrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080A10B0
	movs r2, #0x80
	lsls r2, r2, #1
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A10AC: .4byte 0x084FCF70
_080A10B0: .4byte 0x060052E0
	thumb_func_end QueueAnimTiles_BattlePyramid_Torch

	thumb_func_start QueueAnimTiles_BattlePyramid_StatueShadow
QueueAnimTiles_BattlePyramid_StatueShadow: @ 0x080A10B4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	ldr r1, _080A10D8
	lsrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080A10DC
	movs r2, #0x80
	lsls r2, r2, #1
	bl AppendTilesetAnimToBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080A10D8: .4byte 0x084FCF7C
_080A10DC: .4byte 0x060050E0
	thumb_func_end QueueAnimTiles_BattlePyramid_StatueShadow

	thumb_func_start BlendAnimPalette_BattleDome_FloorLights
BlendAnimPalette_BattleDome_FloorLights: @ 0x080A10E0
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080A1130
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r1, r1, #0xe
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _080A1134
	movs r2, #0x10
	bl CpuSet
	ldr r0, _080A1138
	ldrh r2, [r0, #4]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x1b
	ldrh r3, [r0, #6]
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x11
	movs r0, #0x80
	movs r1, #0x10
	bl BlendPalette
	ldr r0, _080A113C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _080A112A
	ldr r1, _080A1140
	ldr r0, _080A1144
	str r0, [r1]
	ldr r1, _080A1148
	movs r0, #0x20
	strh r0, [r1]
_080A112A:
	pop {r0}
	bx r0
	.align 2, 0
_080A1130: .4byte 0x084FCF88
_080A1134: .4byte 0x020374B4
_080A1138: .4byte 0x02037C74
_080A113C: .4byte 0x08149EBD
_080A1140: .4byte 0x03000F44
_080A1144: .4byte 0x080A0F39
_080A1148: .4byte 0x03000F3C
	thumb_func_end BlendAnimPalette_BattleDome_FloorLights

	thumb_func_start BlendAnimPalette_BattleDome_FloorLightsNoBlend
BlendAnimPalette_BattleDome_FloorLightsNoBlend: @ 0x080A114C
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080A11A4
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r1, r1, #0xe
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _080A11A8
	movs r2, #0x10
	bl CpuSet
	ldr r0, _080A11AC
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080A119E
	ldr r0, _080A11B0
	ldrh r2, [r0, #4]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x1b
	ldrh r3, [r0, #6]
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x11
	movs r0, #0x80
	movs r1, #0x10
	bl BlendPalette
	ldr r1, _080A11B4
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080A119E
	ldr r0, _080A11B8
	str r1, [r0]
_080A119E:
	pop {r0}
	bx r0
	.align 2, 0
_080A11A4: .4byte 0x084FCF88
_080A11A8: .4byte 0x020374B4
_080A11AC: .4byte 0x08149EBD
_080A11B0: .4byte 0x02037C74
_080A11B4: .4byte 0x03000F3C
_080A11B8: .4byte 0x03000F44
	thumb_func_end BlendAnimPalette_BattleDome_FloorLightsNoBlend

