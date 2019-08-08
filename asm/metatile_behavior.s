.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start MetatileBehavior_IsATile
MetatileBehavior_IsATile: @ 0x08088750
	movs r0, #1
	bx lr
	thumb_func_end MetatileBehavior_IsATile

	thumb_func_start MetatileBehavior_IsEncounterTile
MetatileBehavior_IsEncounterTile: @ 0x08088754
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808876C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08088770
	movs r0, #0
	b _08088772
	.align 2, 0
_0808876C: .4byte 0x0845F31C
_08088770:
	movs r0, #1
_08088772:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsEncounterTile

	thumb_func_start MetatileBehavior_IsJumpEast
MetatileBehavior_IsJumpEast: @ 0x08088778
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x38
	beq _08088786
	movs r0, #0
	b _08088788
_08088786:
	movs r0, #1
_08088788:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpEast

	thumb_func_start MetatileBehavior_IsJumpWest
MetatileBehavior_IsJumpWest: @ 0x0808878C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x39
	beq _0808879A
	movs r0, #0
	b _0808879C
_0808879A:
	movs r0, #1
_0808879C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpWest

	thumb_func_start MetatileBehavior_IsJumpNorth
MetatileBehavior_IsJumpNorth: @ 0x080887A0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3a
	beq _080887AE
	movs r0, #0
	b _080887B0
_080887AE:
	movs r0, #1
_080887B0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpNorth

	thumb_func_start MetatileBehavior_IsJumpSouth
MetatileBehavior_IsJumpSouth: @ 0x080887B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	beq _080887C2
	movs r0, #0
	b _080887C4
_080887C2:
	movs r0, #1
_080887C4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpSouth

	thumb_func_start MetatileBehavior_IsPokeGrass
MetatileBehavior_IsPokeGrass: @ 0x080887C8
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0xfe
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080887DC
	movs r0, #0
	b _080887DE
_080887DC:
	movs r0, #1
_080887DE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsPokeGrass

	thumb_func_start MetatileBehavior_IsSandOrDeepSand
MetatileBehavior_IsSandOrDeepSand: @ 0x080887E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x21
	beq _080887F2
	cmp r0, #6
	bne _080887F6
_080887F2:
	movs r0, #1
	b _080887F8
_080887F6:
	movs r0, #0
_080887F8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSandOrDeepSand

	thumb_func_start MetatileBehavior_IsDeepSand
MetatileBehavior_IsDeepSand: @ 0x080887FC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	beq _0808880A
	movs r0, #0
	b _0808880C
_0808880A:
	movs r0, #1
_0808880C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDeepSand

	thumb_func_start MetatileBehavior_IsReflective
MetatileBehavior_IsReflective: @ 0x08088810
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _0808882E
	cmp r0, #0x16
	beq _0808882E
	cmp r0, #0x1a
	beq _0808882E
	cmp r0, #0x20
	beq _0808882E
	cmp r0, #0x14
	beq _0808882E
	cmp r0, #0x2b
	bne _08088832
_0808882E:
	movs r0, #1
	b _08088834
_08088832:
	movs r0, #0
_08088834:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsReflective

	thumb_func_start MetatileBehavior_IsIce_2
MetatileBehavior_IsIce_2: @ 0x08088838
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	beq _08088846
	movs r0, #0
	b _08088848
_08088846:
	movs r0, #1
_08088848:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce_2

	thumb_func_start MetatileBehavior_IsWarpDoor
MetatileBehavior_IsWarpDoor: @ 0x0808884C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x69
	beq _0808885A
	movs r0, #0
	b _0808885C
_0808885A:
	movs r0, #1
_0808885C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWarpDoor

	thumb_func_start MetatileBehavior_IsDoor
MetatileBehavior_IsDoor: @ 0x08088860
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x8d
	beq _0808886E
	cmp r0, #0x69
	bne _08088872
_0808886E:
	movs r0, #1
	b _08088874
_08088872:
	movs r0, #0
_08088874:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDoor

	thumb_func_start MetatileBehavior_IsEscalator
MetatileBehavior_IsEscalator: @ 0x08088878
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0x96
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0808888C
	movs r0, #0
	b _0808888E
_0808888C:
	movs r0, #1
_0808888E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsEscalator

	thumb_func_start Unref_MetatileBehavior_IsUnused04
Unref_MetatileBehavior_IsUnused04: @ 0x08088894
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _080888A2
	movs r0, #0
	b _080888A4
_080888A2:
	movs r0, #1
_080888A4:
	pop {r1}
	bx r1
	thumb_func_end Unref_MetatileBehavior_IsUnused04

	thumb_func_start MetatileBehavior_IsLadder
MetatileBehavior_IsLadder: @ 0x080888A8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x61
	beq _080888B6
	movs r0, #0
	b _080888B8
_080888B6:
	movs r0, #1
_080888B8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLadder

	thumb_func_start MetatileBehavior_IsNonAnimDoor
MetatileBehavior_IsNonAnimDoor: @ 0x080888BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x60
	beq _080888CE
	cmp r0, #0x6c
	beq _080888CE
	cmp r0, #0x6e
	bne _080888D2
_080888CE:
	movs r0, #1
	b _080888D4
_080888D2:
	movs r0, #0
_080888D4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNonAnimDoor

	thumb_func_start MetatileBehavior_IsDeepSouthWarp
MetatileBehavior_IsDeepSouthWarp: @ 0x080888D8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x6e
	beq _080888E6
	movs r0, #0
	b _080888E8
_080888E6:
	movs r0, #1
_080888E8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDeepSouthWarp

	thumb_func_start MetatileBehavior_IsSurfableWaterOrUnderwater
MetatileBehavior_IsSurfableWaterOrUnderwater: @ 0x080888EC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08088904
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08088908
	movs r0, #0
	b _0808890A
	.align 2, 0
_08088904: .4byte 0x0845F31C
_08088908:
	movs r0, #1
_0808890A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsSurfableWaterOrUnderwater

	thumb_func_start MetatileBehavior_IsEastArrowWarp
MetatileBehavior_IsEastArrowWarp: @ 0x08088910
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x62
	beq _0808891E
	movs r0, #0
	b _08088920
_0808891E:
	movs r0, #1
_08088920:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastArrowWarp

	thumb_func_start MetatileBehavior_IsWestArrowWarp
MetatileBehavior_IsWestArrowWarp: @ 0x08088924
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	beq _08088932
	movs r0, #0
	b _08088934
_08088932:
	movs r0, #1
_08088934:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestArrowWarp

	thumb_func_start MetatileBehavior_IsNorthArrowWarp
MetatileBehavior_IsNorthArrowWarp: @ 0x08088938
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	beq _08088946
	cmp r0, #0x1b
	bne _0808894A
_08088946:
	movs r0, #1
	b _0808894C
_0808894A:
	movs r0, #0
_0808894C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthArrowWarp

	thumb_func_start MetatileBehavior_IsSouthArrowWarp
MetatileBehavior_IsSouthArrowWarp: @ 0x08088950
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x65
	beq _08088962
	cmp r0, #0x6d
	beq _08088962
	cmp r0, #0x1c
	bne _08088966
_08088962:
	movs r0, #1
	b _08088968
_08088966:
	movs r0, #0
_08088968:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthArrowWarp

	thumb_func_start Unref_MetatileBehavior_IsArrowWarp
Unref_MetatileBehavior_IsArrowWarp: @ 0x0808896C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0
	adds r0, r4, #0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080889A4
	adds r0, r4, #0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080889A4
	adds r0, r4, #0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080889A4
	adds r0, r4, #0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080889A6
_080889A4:
	movs r5, #1
_080889A6:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Unref_MetatileBehavior_IsArrowWarp

	thumb_func_start MetatileBehavior_IsForcedMovementTile
MetatileBehavior_IsForcedMovementTile: @ 0x080889B0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xc0
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _080889E6
	adds r0, r1, #0
	subs r0, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _080889E6
	cmp r1, #0xd0
	beq _080889E6
	cmp r1, #0xd2
	beq _080889E6
	cmp r1, #0x13
	beq _080889E6
	cmp r1, #0x20
	beq _080889E6
	cmp r1, #0xbb
	beq _080889E6
	cmp r1, #0xbc
	bne _080889EA
_080889E6:
	movs r0, #1
	b _080889EC
_080889EA:
	movs r0, #0
_080889EC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsForcedMovementTile

	thumb_func_start MetatileBehavior_IsIce
MetatileBehavior_IsIce: @ 0x080889F0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	beq _080889FE
	movs r0, #0
	b _08088A00
_080889FE:
	movs r0, #1
_08088A00:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce

	thumb_func_start MetatileBehavior_IsTrickHouseSlipperyFloor
MetatileBehavior_IsTrickHouseSlipperyFloor: @ 0x08088A04
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x48
	beq _08088A12
	movs r0, #0
	b _08088A14
_08088A12:
	movs r0, #1
_08088A14:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTrickHouseSlipperyFloor

	thumb_func_start Unref_MetatileBehavior_IsUnused05
Unref_MetatileBehavior_IsUnused05: @ 0x08088A18
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	beq _08088A26
	movs r0, #0
	b _08088A28
_08088A26:
	movs r0, #1
_08088A28:
	pop {r1}
	bx r1
	thumb_func_end Unref_MetatileBehavior_IsUnused05

	thumb_func_start MetatileBehavior_IsWalkNorth
MetatileBehavior_IsWalkNorth: @ 0x08088A2C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x42
	beq _08088A3A
	movs r0, #0
	b _08088A3C
_08088A3A:
	movs r0, #1
_08088A3C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkNorth

	thumb_func_start MetatileBehavior_IsWalkSouth
MetatileBehavior_IsWalkSouth: @ 0x08088A40
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x43
	beq _08088A4E
	movs r0, #0
	b _08088A50
_08088A4E:
	movs r0, #1
_08088A50:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkSouth

	thumb_func_start MetatileBehavior_IsWalkWest
MetatileBehavior_IsWalkWest: @ 0x08088A54
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x41
	beq _08088A62
	movs r0, #0
	b _08088A64
_08088A62:
	movs r0, #1
_08088A64:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkWest

	thumb_func_start MetatileBehavior_IsWalkEast
MetatileBehavior_IsWalkEast: @ 0x08088A68
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08088A76
	movs r0, #0
	b _08088A78
_08088A76:
	movs r0, #1
_08088A78:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkEast

	thumb_func_start MetatileBehavior_IsNorthwardCurrent
MetatileBehavior_IsNorthwardCurrent: @ 0x08088A7C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x52
	beq _08088A8A
	movs r0, #0
	b _08088A8C
_08088A8A:
	movs r0, #1
_08088A8C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthwardCurrent

	thumb_func_start MetatileBehavior_IsSouthwardCurrent
MetatileBehavior_IsSouthwardCurrent: @ 0x08088A90
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x53
	beq _08088A9E
	movs r0, #0
	b _08088AA0
_08088A9E:
	movs r0, #1
_08088AA0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthwardCurrent

	thumb_func_start MetatileBehavior_IsWestwardCurrent
MetatileBehavior_IsWestwardCurrent: @ 0x08088AA4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x51
	beq _08088AB2
	movs r0, #0
	b _08088AB4
_08088AB2:
	movs r0, #1
_08088AB4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestwardCurrent

	thumb_func_start MetatileBehavior_IsEastwardCurrent
MetatileBehavior_IsEastwardCurrent: @ 0x08088AB8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x50
	beq _08088AC6
	movs r0, #0
	b _08088AC8
_08088AC6:
	movs r0, #1
_08088AC8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastwardCurrent

	thumb_func_start MetatileBehavior_IsSlideNorth
MetatileBehavior_IsSlideNorth: @ 0x08088ACC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x46
	beq _08088ADA
	movs r0, #0
	b _08088ADC
_08088ADA:
	movs r0, #1
_08088ADC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideNorth

	thumb_func_start MetatileBehavior_IsSlideSouth
MetatileBehavior_IsSlideSouth: @ 0x08088AE0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x47
	beq _08088AEE
	movs r0, #0
	b _08088AF0
_08088AEE:
	movs r0, #1
_08088AF0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideSouth

	thumb_func_start MetatileBehavior_IsSlideWest
MetatileBehavior_IsSlideWest: @ 0x08088AF4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x45
	beq _08088B02
	movs r0, #0
	b _08088B04
_08088B02:
	movs r0, #1
_08088B04:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideWest

	thumb_func_start MetatileBehavior_IsSlideEast
MetatileBehavior_IsSlideEast: @ 0x08088B08
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x44
	beq _08088B16
	movs r0, #0
	b _08088B18
_08088B16:
	movs r0, #1
_08088B18:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideEast

	thumb_func_start MetatileBehavior_IsCounter
MetatileBehavior_IsCounter: @ 0x08088B1C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	beq _08088B2A
	movs r0, #0
	b _08088B2C
_08088B2A:
	movs r0, #1
_08088B2C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCounter

	thumb_func_start MetatileBehavior_IsPlayerFacingTVScreen
MetatileBehavior_IsPlayerFacingTVScreen: @ 0x08088B30
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #2
	bne _08088B42
	cmp r0, #0x86
	beq _08088B46
_08088B42:
	movs r0, #0
	b _08088B48
_08088B46:
	movs r0, #1
_08088B48:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPlayerFacingTVScreen

	thumb_func_start MetatileBehavior_IsPC
MetatileBehavior_IsPC: @ 0x08088B4C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x83
	beq _08088B5A
	movs r0, #0
	b _08088B5C
_08088B5A:
	movs r0, #1
_08088B5C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPC

	thumb_func_start MetatileBehavior_IsCableBoxResults1
MetatileBehavior_IsCableBoxResults1: @ 0x08088B60
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x84
	beq _08088B6E
	movs r0, #0
	b _08088B70
_08088B6E:
	movs r0, #1
_08088B70:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCableBoxResults1

	thumb_func_start MetatileBehavior_IsOpenSecretBaseDoor
MetatileBehavior_IsOpenSecretBaseDoor: @ 0x08088B74
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x91
	beq _08088B96
	cmp r0, #0x93
	beq _08088B96
	cmp r0, #0x95
	beq _08088B96
	cmp r0, #0x97
	beq _08088B96
	cmp r0, #0x99
	beq _08088B96
	cmp r0, #0x9b
	beq _08088B96
	cmp r0, #0x9d
	bne _08088B9A
_08088B96:
	movs r0, #1
	b _08088B9C
_08088B9A:
	movs r0, #0
_08088B9C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsOpenSecretBaseDoor

	thumb_func_start MetatileBehavior_IsSecretBaseCave
MetatileBehavior_IsSecretBaseCave: @ 0x08088BA0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x90
	beq _08088BB6
	cmp r0, #0x92
	beq _08088BB6
	cmp r0, #0x94
	beq _08088BB6
	cmp r0, #0x9a
	bne _08088BBA
_08088BB6:
	movs r0, #1
	b _08088BBC
_08088BBA:
	movs r0, #0
_08088BBC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseCave

	thumb_func_start MetatileBehavior_IsSecretBaseTree
MetatileBehavior_IsSecretBaseTree: @ 0x08088BC0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x96
	beq _08088BCE
	cmp r0, #0x9c
	bne _08088BD2
_08088BCE:
	movs r0, #1
	b _08088BD4
_08088BD2:
	movs r0, #0
_08088BD4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseTree

	thumb_func_start MetatileBehavior_IsSecretBaseShrub
MetatileBehavior_IsSecretBaseShrub: @ 0x08088BD8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x98
	beq _08088BE6
	movs r0, #0
	b _08088BE8
_08088BE6:
	movs r0, #1
_08088BE8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseShrub

	thumb_func_start MetatileBehavior_IsSecretBasePC
MetatileBehavior_IsSecretBasePC: @ 0x08088BEC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb0
	beq _08088BFA
	movs r0, #0
	b _08088BFC
_08088BFA:
	movs r0, #1
_08088BFC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBasePC

	thumb_func_start MetatileBehavior_IsRecordMixingSecretBasePC
MetatileBehavior_IsRecordMixingSecretBasePC: @ 0x08088C00
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb1
	beq _08088C0E
	movs r0, #0
	b _08088C10
_08088C0E:
	movs r0, #1
_08088C10:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsRecordMixingSecretBasePC

	thumb_func_start Unref_MetatileBehavior_IsSecretBaseUnused_B2_2
Unref_MetatileBehavior_IsSecretBaseUnused_B2_2: @ 0x08088C14
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb2
	beq _08088C22
	movs r0, #0
	b _08088C24
_08088C22:
	movs r0, #1
_08088C24:
	pop {r1}
	bx r1
	thumb_func_end Unref_MetatileBehavior_IsSecretBaseUnused_B2_2

	thumb_func_start MetatileBehavior_IsBlockDecoration
MetatileBehavior_IsBlockDecoration: @ 0x08088C28
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb3
	beq _08088C36
	movs r0, #0
	b _08088C38
_08088C36:
	movs r0, #1
_08088C38:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBlockDecoration

	thumb_func_start MetatileBehavior_IsSecretBaseImpassable
MetatileBehavior_IsSecretBaseImpassable: @ 0x08088C3C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb9
	beq _08088C4A
	movs r0, #0
	b _08088C4C
_08088C4A:
	movs r0, #1
_08088C4C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseImpassable

	thumb_func_start MetatileBehavior_IsMB_C6
MetatileBehavior_IsMB_C6: @ 0x08088C50
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc6
	beq _08088C5E
	movs r0, #0
	b _08088C60
_08088C5E:
	movs r0, #1
_08088C60:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMB_C6

	thumb_func_start MetatileBehavior_IsSecretBasePoster
MetatileBehavior_IsSecretBasePoster: @ 0x08088C64
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc7
	beq _08088C72
	movs r0, #0
	b _08088C74
_08088C72:
	movs r0, #1
_08088C74:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBasePoster

	thumb_func_start MetatileBehavior_IsNormal
MetatileBehavior_IsNormal: @ 0x08088C78
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08088C84
	movs r0, #0
	b _08088C86
_08088C84:
	movs r0, #1
_08088C86:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsNormal

	thumb_func_start MetatileBehavior_IsSecretBaseNorthWall
MetatileBehavior_IsSecretBaseNorthWall: @ 0x08088C8C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb7
	beq _08088C9A
	movs r0, #0
	b _08088C9C
_08088C9A:
	movs r0, #1
_08088C9C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseNorthWall

	thumb_func_start Unref_MetatileBehavior_IsSecretBaseUnused_B2
Unref_MetatileBehavior_IsSecretBaseUnused_B2: @ 0x08088CA0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb2
	beq _08088CAE
	movs r0, #0
	b _08088CB0
_08088CAE:
	movs r0, #1
_08088CB0:
	pop {r1}
	bx r1
	thumb_func_end Unref_MetatileBehavior_IsSecretBaseUnused_B2

	thumb_func_start MetatileBehavior_HoldsSmallDecoration
MetatileBehavior_HoldsSmallDecoration: @ 0x08088CB4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb5
	beq _08088CC2
	movs r0, #0
	b _08088CC4
_08088CC2:
	movs r0, #1
_08088CC4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_HoldsSmallDecoration

	thumb_func_start MetatileBehavior_HoldsLargeDecoration
MetatileBehavior_HoldsLargeDecoration: @ 0x08088CC8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc3
	beq _08088CD6
	movs r0, #0
	b _08088CD8
_08088CD6:
	movs r0, #1
_08088CD8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_HoldsLargeDecoration

	thumb_func_start MetatileBehavior_IsSecretBaseHole
MetatileBehavior_IsSecretBaseHole: @ 0x08088CDC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc2
	beq _08088CEA
	movs r0, #0
	b _08088CEC
_08088CEA:
	movs r0, #1
_08088CEC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseHole

	thumb_func_start MetatileBehavior_IsSecretBaseBalloon
MetatileBehavior_IsSecretBaseBalloon: @ 0x08088CF0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb8
	beq _08088CFE
	movs r0, #0
	b _08088D00
_08088CFE:
	movs r0, #1
_08088D00:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseBalloon

	thumb_func_start MetatileBehavior_IsSecretBaseBreakableDoor
MetatileBehavior_IsSecretBaseBreakableDoor: @ 0x08088D04
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbe
	beq _08088D12
	movs r0, #0
	b _08088D14
_08088D12:
	movs r0, #1
_08088D14:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseBreakableDoor

	thumb_func_start MetatileBehavior_IsSecretBaseSoundMat
MetatileBehavior_IsSecretBaseSoundMat: @ 0x08088D18
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbd
	beq _08088D26
	movs r0, #0
	b _08088D28
_08088D26:
	movs r0, #1
_08088D28:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseSoundMat

	thumb_func_start MetatileBehavior_IsSecretBaseGlitterMat
MetatileBehavior_IsSecretBaseGlitterMat: @ 0x08088D2C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xba
	beq _08088D3A
	movs r0, #0
	b _08088D3C
_08088D3A:
	movs r0, #1
_08088D3C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseGlitterMat

	thumb_func_start MetatileBehavior_IsSecretBaseSandOrnament
MetatileBehavior_IsSecretBaseSandOrnament: @ 0x08088D40
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbf
	beq _08088D4E
	movs r0, #0
	b _08088D50
_08088D4E:
	movs r0, #1
_08088D50:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseSandOrnament

	thumb_func_start MetatileBehavior_IsSecretBaseShieldOrToyTV
MetatileBehavior_IsSecretBaseShieldOrToyTV: @ 0x08088D54
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	beq _08088D62
	movs r0, #0
	b _08088D64
_08088D62:
	movs r0, #1
_08088D64:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseShieldOrToyTV

	thumb_func_start MetatileBehavior_IsPlayerRoomPCOn
MetatileBehavior_IsPlayerRoomPCOn: @ 0x08088D68
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc5
	beq _08088D76
	movs r0, #0
	b _08088D78
_08088D76:
	movs r0, #1
_08088D78:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPlayerRoomPCOn

	thumb_func_start MetatileBehavior_HasRipples
MetatileBehavior_HasRipples: @ 0x08088D7C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _08088D8E
	cmp r0, #0x16
	beq _08088D8E
	cmp r0, #0x14
	bne _08088D92
_08088D8E:
	movs r0, #1
	b _08088D94
_08088D92:
	movs r0, #0
_08088D94:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_HasRipples

	thumb_func_start MetatileBehavior_IsPuddle
MetatileBehavior_IsPuddle: @ 0x08088D98
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x16
	beq _08088DA6
	movs r0, #0
	b _08088DA8
_08088DA6:
	movs r0, #1
_08088DA8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPuddle

	thumb_func_start MetatileBehavior_IsTallGrass
MetatileBehavior_IsTallGrass: @ 0x08088DAC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _08088DBA
	movs r0, #0
	b _08088DBC
_08088DBA:
	movs r0, #1
_08088DBC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTallGrass

	thumb_func_start MetatileBehavior_IsLongGrass_Duplicate
MetatileBehavior_IsLongGrass_Duplicate: @ 0x08088DC0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _08088DCE
	movs r0, #0
	b _08088DD0
_08088DCE:
	movs r0, #1
_08088DD0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLongGrass_Duplicate

	thumb_func_start MetatileBehavior_IsBerryTreeSoil
MetatileBehavior_IsBerryTreeSoil: @ 0x08088DD4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa0
	beq _08088DE2
	movs r0, #0
	b _08088DE4
_08088DE2:
	movs r0, #1
_08088DE4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBerryTreeSoil

	thumb_func_start MetatileBehavior_IsAshGrass
MetatileBehavior_IsAshGrass: @ 0x08088DE8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x24
	beq _08088DF6
	movs r0, #0
	b _08088DF8
_08088DF6:
	movs r0, #1
_08088DF8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAshGrass

	thumb_func_start MetatileBehavior_IsFootprints
MetatileBehavior_IsFootprints: @ 0x08088DFC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x25
	beq _08088E0A
	movs r0, #0
	b _08088E0C
_08088E0A:
	movs r0, #1
_08088E0C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsFootprints

	thumb_func_start MetatileBehavior_IsBridge
MetatileBehavior_IsBridge: @ 0x08088E10
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0x90
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08088E2E
	adds r0, r1, #0
	subs r0, #0x7c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08088E32
_08088E2E:
	movs r0, #1
	b _08088E34
_08088E32:
	movs r0, #0
_08088E34:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBridge

	thumb_func_start MetatileBehavior_GetBridgeType
MetatileBehavior_GetBridgeType: @ 0x08088E38
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	adds r0, r1, #0
	subs r0, #0x70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08088E6E
	adds r0, r1, #0
	subs r0, #0x7a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08088E5C
	movs r0, #2
	b _08088E6E
_08088E5C:
	adds r0, r2, #0
	subs r0, #0x7c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08088E6C
	movs r0, #0
	b _08088E6E
_08088E6C:
	movs r0, #3
_08088E6E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_GetBridgeType

	thumb_func_start MetatileBehavior_8089510
MetatileBehavior_8089510: @ 0x08088E74
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0x90
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08088E88
	movs r0, #0
	b _08088E8A
_08088E88:
	movs r0, #1
_08088E8A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_8089510

	thumb_func_start MetatileBehavior_IsLandWildEncounter
MetatileBehavior_IsLandWildEncounter: @ 0x08088E90
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08088EB4
	adds r0, r4, #0
	bl MetatileBehavior_IsEncounterTile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08088EB4
	movs r0, #1
	b _08088EB6
_08088EB4:
	movs r0, #0
_08088EB6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLandWildEncounter

	thumb_func_start MetatileBehavior_IsWaterWildEncounter
MetatileBehavior_IsWaterWildEncounter: @ 0x08088EBC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08088EE2
	adds r0, r4, #0
	bl MetatileBehavior_IsEncounterTile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08088EE2
	movs r0, #1
	b _08088EE4
_08088EE2:
	movs r0, #0
_08088EE4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsWaterWildEncounter

	thumb_func_start MetatileBehavior_IsIndoorEncounter
MetatileBehavior_IsIndoorEncounter: @ 0x08088EEC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	beq _08088EFA
	movs r0, #0
	b _08088EFC
_08088EFA:
	movs r0, #1
_08088EFC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIndoorEncounter

	thumb_func_start MetatileBehavior_IsMountain
MetatileBehavior_IsMountain: @ 0x08088F00
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	beq _08088F0E
	movs r0, #0
	b _08088F10
_08088F0E:
	movs r0, #1
_08088F10:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMountain

	thumb_func_start MetatileBehavior_IsDiveable
MetatileBehavior_IsDiveable: @ 0x08088F14
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xef
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08088F2A
	cmp r1, #0x14
	bne _08088F2E
_08088F2A:
	movs r0, #1
	b _08088F30
_08088F2E:
	movs r0, #0
_08088F30:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDiveable

	thumb_func_start MetatileBehavior_IsUnableToEmerge
MetatileBehavior_IsUnableToEmerge: @ 0x08088F34
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	beq _08088F42
	cmp r0, #0x2a
	bne _08088F46
_08088F42:
	movs r0, #1
	b _08088F48
_08088F46:
	movs r0, #0
_08088F48:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsUnableToEmerge

	thumb_func_start MetatileBehavior_IsShallowFlowingWater
MetatileBehavior_IsShallowFlowingWater: @ 0x08088F4C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x17
	beq _08088F5E
	cmp r0, #0x1b
	beq _08088F5E
	cmp r0, #0x1c
	bne _08088F62
_08088F5E:
	movs r0, #1
	b _08088F64
_08088F62:
	movs r0, #0
_08088F64:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShallowFlowingWater

	thumb_func_start MetatileBehavior_IsThinIce
MetatileBehavior_IsThinIce: @ 0x08088F68
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x26
	beq _08088F76
	movs r0, #0
	b _08088F78
_08088F76:
	movs r0, #1
_08088F78:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsThinIce

	thumb_func_start MetatileBehavior_IsCrackedIce
MetatileBehavior_IsCrackedIce: @ 0x08088F7C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x27
	beq _08088F8A
	movs r0, #0
	b _08088F8C
_08088F8A:
	movs r0, #1
_08088F8C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCrackedIce

	thumb_func_start MetatileBehavior_IsDeepOrOceanWater
MetatileBehavior_IsDeepOrOceanWater: @ 0x08088F90
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x15
	beq _08088FA2
	cmp r0, #0x11
	beq _08088FA2
	cmp r0, #0x12
	bne _08088FA6
_08088FA2:
	movs r0, #1
	b _08088FA8
_08088FA6:
	movs r0, #0
_08088FA8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDeepOrOceanWater

	thumb_func_start Unref_MetatileBehavior_IsUnusedSootopolisWater
Unref_MetatileBehavior_IsUnusedSootopolisWater: @ 0x08088FAC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x18
	beq _08088FBA
	cmp r0, #0x1a
	bne _08088FBE
_08088FBA:
	movs r0, #1
	b _08088FC0
_08088FBE:
	movs r0, #0
_08088FC0:
	pop {r1}
	bx r1
	thumb_func_end Unref_MetatileBehavior_IsUnusedSootopolisWater

	thumb_func_start MetatileBehavior_IsSurfableAndNotWaterfall
MetatileBehavior_IsSurfableAndNotWaterfall: @ 0x08088FC4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08088FE6
	adds r0, r4, #0
	bl MetatileBehavior_IsWaterfall
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08088FE6
	movs r0, #1
	b _08088FE8
_08088FE6:
	movs r0, #0
_08088FE8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsSurfableAndNotWaterfall

	thumb_func_start MetatileBehavior_IsEastBlocked
MetatileBehavior_IsEastBlocked: @ 0x08088FF0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x30
	beq _0808900A
	cmp r0, #0x34
	beq _0808900A
	cmp r0, #0x36
	beq _0808900A
	cmp r0, #0xc1
	beq _0808900A
	cmp r0, #0xbe
	bne _0808900E
_0808900A:
	movs r0, #1
	b _08089010
_0808900E:
	movs r0, #0
_08089010:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastBlocked

	thumb_func_start MetatileBehavior_IsWestBlocked
MetatileBehavior_IsWestBlocked: @ 0x08089014
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x31
	beq _0808902E
	cmp r0, #0x35
	beq _0808902E
	cmp r0, #0x37
	beq _0808902E
	cmp r0, #0xc1
	beq _0808902E
	cmp r0, #0xbe
	bne _08089032
_0808902E:
	movs r0, #1
	b _08089034
_08089032:
	movs r0, #0
_08089034:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestBlocked

	thumb_func_start MetatileBehavior_IsNorthBlocked
MetatileBehavior_IsNorthBlocked: @ 0x08089038
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x32
	beq _0808904E
	cmp r0, #0x34
	beq _0808904E
	cmp r0, #0x35
	beq _0808904E
	cmp r0, #0xc0
	bne _08089052
_0808904E:
	movs r0, #1
	b _08089054
_08089052:
	movs r0, #0
_08089054:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthBlocked

	thumb_func_start MetatileBehavior_IsSouthBlocked
MetatileBehavior_IsSouthBlocked: @ 0x08089058
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x33
	beq _0808906E
	cmp r0, #0x36
	beq _0808906E
	cmp r0, #0x37
	beq _0808906E
	cmp r0, #0xc0
	bne _08089072
_0808906E:
	movs r0, #1
	b _08089074
_08089072:
	movs r0, #0
_08089074:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthBlocked

	thumb_func_start MetatileBehavior_IsShortGrass
MetatileBehavior_IsShortGrass: @ 0x08089078
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	beq _08089086
	movs r0, #0
	b _08089088
_08089086:
	movs r0, #1
_08089088:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShortGrass

	thumb_func_start MetatileBehavior_IsHotSprings
MetatileBehavior_IsHotSprings: @ 0x0808908C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	beq _0808909A
	movs r0, #0
	b _0808909C
_0808909A:
	movs r0, #1
_0808909C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHotSprings

	thumb_func_start MetatileBehavior_IsWaterfall
MetatileBehavior_IsWaterfall: @ 0x080890A0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	beq _080890AE
	movs r0, #0
	b _080890B0
_080890AE:
	movs r0, #1
_080890B0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWaterfall

	thumb_func_start MetatileBehavior_IsFortreeBridge
MetatileBehavior_IsFortreeBridge: @ 0x080890B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	beq _080890C2
	movs r0, #0
	b _080890C4
_080890C2:
	movs r0, #1
_080890C4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsFortreeBridge

	thumb_func_start MetatileBehavior_IsPacifilogVerticalLog1
MetatileBehavior_IsPacifilogVerticalLog1: @ 0x080890C8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x74
	beq _080890D6
	movs r0, #0
	b _080890D8
_080890D6:
	movs r0, #1
_080890D8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPacifilogVerticalLog1

	thumb_func_start MetatileBehavior_IsPacifilogVerticalLog2
MetatileBehavior_IsPacifilogVerticalLog2: @ 0x080890DC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x75
	beq _080890EA
	movs r0, #0
	b _080890EC
_080890EA:
	movs r0, #1
_080890EC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPacifilogVerticalLog2

	thumb_func_start MetatileBehavior_IsPacifilogHorizontalLog1
MetatileBehavior_IsPacifilogHorizontalLog1: @ 0x080890F0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x76
	beq _080890FE
	movs r0, #0
	b _08089100
_080890FE:
	movs r0, #1
_08089100:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPacifilogHorizontalLog1

	thumb_func_start MetatileBehavior_IsPacifilogHorizontalLog2
MetatileBehavior_IsPacifilogHorizontalLog2: @ 0x08089104
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x77
	beq _08089112
	movs r0, #0
	b _08089114
_08089112:
	movs r0, #1
_08089114:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPacifilogHorizontalLog2

	thumb_func_start MetatileBehavior_IsPacifidlogLog
MetatileBehavior_IsPacifidlogLog: @ 0x08089118
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0x8c
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0808912C
	movs r0, #0
	b _0808912E
_0808912C:
	movs r0, #1
_0808912E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsPacifidlogLog

	thumb_func_start MetatileBehavior_IsTrickHousePuzzleDoor
MetatileBehavior_IsTrickHousePuzzleDoor: @ 0x08089134
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x8c
	beq _08089142
	movs r0, #0
	b _08089144
_08089142:
	movs r0, #1
_08089144:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTrickHousePuzzleDoor

	thumb_func_start MetatileBehavior_IsRegionMap
MetatileBehavior_IsRegionMap: @ 0x08089148
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x85
	beq _08089156
	movs r0, #0
	b _08089158
_08089156:
	movs r0, #1
_08089158:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsRegionMap

	thumb_func_start MetatileBehavior_IsClosedSootopolisDoor
MetatileBehavior_IsClosedSootopolisDoor: @ 0x0808915C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x8b
	beq _0808916A
	movs r0, #0
	b _0808916C
_0808916A:
	movs r0, #1
_0808916C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsClosedSootopolisDoor

	thumb_func_start MetatileBehavior_IsUnknownClosedDoor
MetatileBehavior_IsUnknownClosedDoor: @ 0x08089170
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xea
	beq _0808917E
	movs r0, #0
	b _08089180
_0808917E:
	movs r0, #1
_08089180:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsUnknownClosedDoor

	thumb_func_start MetatileBehavior_IsRoulette
MetatileBehavior_IsRoulette: @ 0x08089184
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x8a
	beq _08089192
	movs r0, #0
	b _08089194
_08089192:
	movs r0, #1
_08089194:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsRoulette

	thumb_func_start MetatileBehavior_IsPokeblockFeeder
MetatileBehavior_IsPokeblockFeeder: @ 0x08089198
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x87
	beq _080891A6
	movs r0, #0
	b _080891A8
_080891A6:
	movs r0, #1
_080891A8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPokeblockFeeder

	thumb_func_start MetatileBehavior_IsSecretBaseJumpMat
MetatileBehavior_IsSecretBaseJumpMat: @ 0x080891AC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbb
	beq _080891BA
	movs r0, #0
	b _080891BC
_080891BA:
	movs r0, #1
_080891BC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseJumpMat

	thumb_func_start MetatileBehavior_IsSecretBaseSpinMat
MetatileBehavior_IsSecretBaseSpinMat: @ 0x080891C0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbc
	beq _080891CE
	movs r0, #0
	b _080891D0
_080891CE:
	movs r0, #1
_080891D0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSecretBaseSpinMat

	thumb_func_start MetatileBehavior_IsLavaridgeB1FWarp
MetatileBehavior_IsLavaridgeB1FWarp: @ 0x080891D4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x29
	beq _080891E2
	movs r0, #0
	b _080891E4
_080891E2:
	movs r0, #1
_080891E4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLavaridgeB1FWarp

	thumb_func_start MetatileBehavior_IsLavaridge1FWarp
MetatileBehavior_IsLavaridge1FWarp: @ 0x080891E8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x68
	beq _080891F6
	movs r0, #0
	b _080891F8
_080891F6:
	movs r0, #1
_080891F8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLavaridge1FWarp

	thumb_func_start MetatileBehavior_IsAquaHideoutWarp
MetatileBehavior_IsAquaHideoutWarp: @ 0x080891FC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x67
	beq _0808920A
	movs r0, #0
	b _0808920C
_0808920A:
	movs r0, #1
_0808920C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAquaHideoutWarp

	thumb_func_start MetatileBehavior_IsWarpOrBridge
MetatileBehavior_IsWarpOrBridge: @ 0x08089210
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x70
	beq _0808921E
	movs r0, #0
	b _08089220
_0808921E:
	movs r0, #1
_08089220:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWarpOrBridge

	thumb_func_start MetatileBehavior_IsMossdeepGymWarp
MetatileBehavior_IsMossdeepGymWarp: @ 0x08089224
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe
	beq _08089232
	movs r0, #0
	b _08089234
_08089232:
	movs r0, #1
_08089234:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMossdeepGymWarp

	thumb_func_start MetatileBehavior_IsSurfableFishableWater
MetatileBehavior_IsSurfableFishableWater: @ 0x08089238
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _0808925C
	cmp r0, #0x15
	beq _0808925C
	cmp r0, #0x11
	beq _0808925C
	cmp r0, #0x12
	beq _0808925C
	cmp r0, #0x14
	beq _0808925C
	subs r0, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08089260
_0808925C:
	movs r0, #1
	b _08089262
_08089260:
	movs r0, #0
_08089262:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsSurfableFishableWater

	thumb_func_start MetatileBehavior_IsMtPyreHole
MetatileBehavior_IsMtPyreHole: @ 0x08089268
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	beq _08089276
	movs r0, #0
	b _08089278
_08089276:
	movs r0, #1
_08089278:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMtPyreHole

	thumb_func_start MetatileBehavior_IsCrackedFloorHole
MetatileBehavior_IsCrackedFloorHole: @ 0x0808927C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x66
	beq _0808928A
	movs r0, #0
	b _0808928C
_0808928A:
	movs r0, #1
_0808928C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCrackedFloorHole

	thumb_func_start MetatileBehavior_IsCrackedFloor
MetatileBehavior_IsCrackedFloor: @ 0x08089290
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd2
	beq _0808929E
	movs r0, #0
	b _080892A0
_0808929E:
	movs r0, #1
_080892A0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCrackedFloor

	thumb_func_start MetatileBehavior_IsMuddySlope
MetatileBehavior_IsMuddySlope: @ 0x080892A4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd0
	beq _080892B2
	movs r0, #0
	b _080892B4
_080892B2:
	movs r0, #1
_080892B4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMuddySlope

	thumb_func_start MetatileBehavior_IsBumpySlope
MetatileBehavior_IsBumpySlope: @ 0x080892B8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd1
	beq _080892C6
	movs r0, #0
	b _080892C8
_080892C6:
	movs r0, #1
_080892C8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBumpySlope

	thumb_func_start MetatileBehavior_IsIsolatedVerticalRail
MetatileBehavior_IsIsolatedVerticalRail: @ 0x080892CC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd3
	beq _080892DA
	movs r0, #0
	b _080892DC
_080892DA:
	movs r0, #1
_080892DC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIsolatedVerticalRail

	thumb_func_start MetatileBehavior_IsIsolatedHorizontalRail
MetatileBehavior_IsIsolatedHorizontalRail: @ 0x080892E0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd4
	beq _080892EE
	movs r0, #0
	b _080892F0
_080892EE:
	movs r0, #1
_080892F0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIsolatedHorizontalRail

	thumb_func_start MetatileBehavior_IsVerticalRail
MetatileBehavior_IsVerticalRail: @ 0x080892F4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd5
	beq _08089302
	movs r0, #0
	b _08089304
_08089302:
	movs r0, #1
_08089304:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsVerticalRail

	thumb_func_start MetatileBehavior_IsHorizontalRail
MetatileBehavior_IsHorizontalRail: @ 0x08089308
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd6
	beq _08089316
	movs r0, #0
	b _08089318
_08089316:
	movs r0, #1
_08089318:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHorizontalRail

	thumb_func_start MetatileBehavior_IsSeaweed
MetatileBehavior_IsSeaweed: @ 0x0808931C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x22
	beq _0808932A
	cmp r0, #0x2a
	bne _0808932E
_0808932A:
	movs r0, #1
	b _08089330
_0808932E:
	movs r0, #0
_08089330:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSeaweed

	thumb_func_start MetatileBehavior_IsRunningDisallowed
MetatileBehavior_IsRunningDisallowed: @ 0x08089334
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	beq _08089350
	cmp r0, #3
	beq _08089350
	cmp r0, #0x28
	beq _08089350
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089354
_08089350:
	movs r0, #1
	b _08089356
_08089354:
	movs r0, #0
_08089356:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MetatileBehavior_IsRunningDisallowed

	thumb_func_start MetatileBehavior_IsCuttableGrass
MetatileBehavior_IsCuttableGrass: @ 0x0808935C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xfe
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08089376
	cmp r1, #0x24
	beq _08089376
	cmp r1, #9
	bne _0808937A
_08089376:
	movs r0, #1
	b _0808937C
_0808937A:
	movs r0, #0
_0808937C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCuttableGrass

	thumb_func_start MetatileBehavior_IsRunningShoesManual
MetatileBehavior_IsRunningShoesManual: @ 0x08089380
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x8e
	beq _0808938E
	movs r0, #0
	b _08089390
_0808938E:
	movs r0, #1
_08089390:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsRunningShoesManual

	thumb_func_start MetatileBehavior_IsPictureBookShelf
MetatileBehavior_IsPictureBookShelf: @ 0x08089394
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe0
	beq _080893A2
	movs r0, #0
	b _080893A4
_080893A2:
	movs r0, #1
_080893A4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPictureBookShelf

	thumb_func_start MetatileBehavior_IsBookShelf
MetatileBehavior_IsBookShelf: @ 0x080893A8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe1
	beq _080893B6
	movs r0, #0
	b _080893B8
_080893B6:
	movs r0, #1
_080893B8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBookShelf

	thumb_func_start MetatileBehavior_IsPokeCenterBookShelf
MetatileBehavior_IsPokeCenterBookShelf: @ 0x080893BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe2
	beq _080893CA
	movs r0, #0
	b _080893CC
_080893CA:
	movs r0, #1
_080893CC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPokeCenterBookShelf

	thumb_func_start MetatileBehavior_IsVase
MetatileBehavior_IsVase: @ 0x080893D0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe3
	beq _080893DE
	movs r0, #0
	b _080893E0
_080893DE:
	movs r0, #1
_080893E0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsVase

	thumb_func_start MetatileBehavior_IsTrashCan
MetatileBehavior_IsTrashCan: @ 0x080893E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe4
	beq _080893F2
	movs r0, #0
	b _080893F4
_080893F2:
	movs r0, #1
_080893F4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTrashCan

	thumb_func_start MetatileBehavior_IsShopShelf
MetatileBehavior_IsShopShelf: @ 0x080893F8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe5
	beq _08089406
	movs r0, #0
	b _08089408
_08089406:
	movs r0, #1
_08089408:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShopShelf

	thumb_func_start MetatileBehavior_IsBlueprint
MetatileBehavior_IsBlueprint: @ 0x0808940C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe6
	beq _0808941A
	movs r0, #0
	b _0808941C
_0808941A:
	movs r0, #1
_0808941C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBlueprint

	thumb_func_start MetatileBehavior_IsBattlePyramidWarp
MetatileBehavior_IsBattlePyramidWarp: @ 0x08089420
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xd
	beq _0808942E
	movs r0, #0
	b _08089430
_0808942E:
	movs r0, #1
_08089430:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBattlePyramidWarp

	thumb_func_start MetatileBehavior_IsPlayerFacingWirelessBoxResults
MetatileBehavior_IsPlayerFacingWirelessBoxResults: @ 0x08089434
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #2
	bne _08089446
	cmp r0, #0xe8
	beq _0808944A
_08089446:
	movs r0, #0
	b _0808944C
_0808944A:
	movs r0, #1
_0808944C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPlayerFacingWirelessBoxResults

	thumb_func_start MetatileBehavior_IsCableBoxResults2
MetatileBehavior_IsCableBoxResults2: @ 0x08089450
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #2
	bne _08089462
	cmp r0, #0xe7
	beq _08089466
_08089462:
	movs r0, #0
	b _08089468
_08089466:
	movs r0, #1
_08089468:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCableBoxResults2

	thumb_func_start MetatileBehavior_IsQuestionnaire
MetatileBehavior_IsQuestionnaire: @ 0x0808946C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x8f
	beq _0808947A
	movs r0, #0
	b _0808947C
_0808947A:
	movs r0, #1
_0808947C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsQuestionnaire

	thumb_func_start MetatileBehavior_IsLongGrass
MetatileBehavior_IsLongGrass: @ 0x08089480
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _0808948E
	movs r0, #0
	b _08089490
_0808948E:
	movs r0, #1
_08089490:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLongGrass

	thumb_func_start MetatileBehavior_IsLongGrassSouthEdge
MetatileBehavior_IsLongGrassSouthEdge: @ 0x08089494
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	beq _080894A2
	movs r0, #0
	b _080894A4
_080894A2:
	movs r0, #1
_080894A4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLongGrassSouthEdge

	thumb_func_start MetatileBehavior_IsTrainerHillTimer
MetatileBehavior_IsTrainerHillTimer: @ 0x080894A8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _080894B6
	movs r0, #0
	b _080894B8
_080894B6:
	movs r0, #1
_080894B8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTrainerHillTimer

