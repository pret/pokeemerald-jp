.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start mapconnection_get_mapheader
mapconnection_get_mapheader: @ 0x080876A8
	push {lr}
	ldrb r2, [r0, #8]
	ldrb r1, [r0, #9]
	adds r0, r2, #0
	bl Overworld_GetMapHeaderByGroupAndId
	pop {r1}
	bx r1
	thumb_func_end mapconnection_get_mapheader

	thumb_func_start InitMap
InitMap: @ 0x080876B8
	push {r4, lr}
	ldr r4, _080876D4
	adds r0, r4, #0
	bl InitMapLayoutData
	ldr r0, [r4, #4]
	bl SetOccupiedSecretBaseEntranceMetatiles
	bl RunOnLoadMapScript
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080876D4: .4byte 0x02036FB8
	thumb_func_end InitMap

	thumb_func_start InitMapFromSavedGame
InitMapFromSavedGame: @ 0x080876D8
	push {r4, lr}
	ldr r4, _08087708
	adds r0, r4, #0
	bl InitMapLayoutData
	movs r0, #0
	bl InitSecretBaseAppearance
	ldr r0, [r4, #4]
	bl SetOccupiedSecretBaseEntranceMetatiles
	bl LoadSavedMapView
	bl RunOnLoadMapScript
	ldr r1, _0808770C
	ldr r0, [r1]
	ldr r1, [r1, #4]
	bl UpdateTVScreensOnMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087708: .4byte 0x02036FB8
_0808770C: .4byte 0x03005B20
	thumb_func_end InitMapFromSavedGame

	thumb_func_start InitBattlePyramidMap
InitBattlePyramidMap: @ 0x08087710
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0808773C
	str r0, [sp]
	ldr r5, _08087740
	ldr r2, _08087744
	mov r0, sp
	adds r1, r5, #0
	bl CpuFastSet
	adds r0, r5, #0
	adds r1, r4, #0
	bl GenerateBattlePyramidFloorLayout
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808773C: .4byte 0x03FF03FF
_08087740: .4byte 0x02031FB8
_08087744: .4byte 0x01001400
	thumb_func_end InitBattlePyramidMap

	thumb_func_start InitTrainerHillMap
InitTrainerHillMap: @ 0x08087748
	push {r4, lr}
	sub sp, #4
	ldr r0, _0808776C
	str r0, [sp]
	ldr r4, _08087770
	ldr r2, _08087774
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	bl sub_081D590C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808776C: .4byte 0x03FF03FF
_08087770: .4byte 0x02031FB8
_08087774: .4byte 0x01001400
	thumb_func_end InitTrainerHillMap

	thumb_func_start InitMapLayoutData
InitMapLayoutData: @ 0x08087778
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6]
	ldr r0, _080877C4
	str r0, [sp]
	ldr r4, _080877C8
	ldr r2, _080877CC
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	ldr r2, _080877D0
	str r4, [r2, #8]
	ldr r1, [r5]
	adds r1, #0xf
	str r1, [r2]
	ldr r0, [r5, #4]
	adds r0, #0xe
	str r0, [r2, #4]
	muls r1, r0, r1
	movs r0, #0xa0
	lsls r0, r0, #6
	cmp r1, r0
	bgt _080877BA
	ldr r0, [r5, #0xc]
	ldrh r1, [r5]
	ldrh r2, [r5, #4]
	bl InitBackupMapLayoutData
	adds r0, r6, #0
	bl InitBackupMapLayoutConnections
_080877BA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080877C4: .4byte 0x03FF03FF
_080877C8: .4byte 0x02031FB8
_080877CC: .4byte 0x01001400
_080877D0: .4byte 0x03005B20
	thumb_func_end InitMapLayoutData

	thumb_func_start InitBackupMapLayoutData
InitBackupMapLayoutData: @ 0x080877D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08087828
	ldr r4, [r0, #8]
	ldr r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, #0xe
	adds r4, r4, r0
	cmp r2, #0
	beq _0808781C
	mov r0, r8
	lsls r6, r0, #1
	adds r5, r2, #0
	movs r0, #0x1e
	adds r0, r0, r6
	mov sb, r0
_08087808:
	adds r0, r7, #0
	adds r1, r4, #0
	mov r2, r8
	bl CpuSet
	add r4, sb
	adds r7, r7, r6
	subs r5, #1
	cmp r5, #0
	bne _08087808
_0808781C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087828: .4byte 0x03005B20
	thumb_func_end InitBackupMapLayoutData

	thumb_func_start InitBackupMapLayoutConnections
InitBackupMapLayoutConnections: @ 0x0808782C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _080878B0
	ldr r1, [r0]
	ldr r5, [r0, #4]
	ldr r2, _08087864
	ldr r0, _08087868
	ldr r0, [r0]
	str r0, [r2]
	cmp r1, #0
	ble _080878B0
	adds r4, r2, #0
	adds r7, r1, #0
_0808784A:
	adds r0, r5, #0
	bl mapconnection_get_mapheader
	adds r1, r0, #0
	ldr r2, [r5, #4]
	ldrb r0, [r5]
	cmp r0, #2
	beq _08087882
	cmp r0, #2
	bgt _0808786C
	cmp r0, #1
	beq _08087876
	b _080878A8
	.align 2, 0
_08087864: .4byte 0x02036FE0
_08087868: .4byte 0x0845F318
_0808786C:
	cmp r0, #3
	beq _0808788E
	cmp r0, #4
	beq _0808789A
	b _080878A8
_08087876:
	adds r0, r6, #0
	bl FillSouthConnection
	ldrb r0, [r4]
	movs r1, #1
	b _080878A4
_08087882:
	adds r0, r6, #0
	bl FillNorthConnection
	ldrb r0, [r4]
	movs r1, #2
	b _080878A4
_0808788E:
	adds r0, r6, #0
	bl FillWestConnection
	ldrb r0, [r4]
	movs r1, #4
	b _080878A4
_0808789A:
	adds r0, r6, #0
	bl FillEastConnection
	ldrb r0, [r4]
	movs r1, #8
_080878A4:
	orrs r0, r1
	strb r0, [r4]
_080878A8:
	subs r7, #1
	adds r5, #0xc
	cmp r7, #0
	bne _0808784A
_080878B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitBackupMapLayoutConnections

	thumb_func_start sub_080878B8
sub_080878B8: @ 0x080878B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, [sp, #0x18]
	ldr r4, [r2]
	ldr r7, [r4]
	adds r2, r7, #0
	muls r2, r5, r2
	adds r2, r2, r3
	lsls r2, r2, #1
	ldr r3, [r4, #0xc]
	adds r6, r3, r2
	ldr r3, _08087914
	ldr r2, [r3]
	muls r1, r2, r1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, [r3, #8]
	adds r5, r0, r1
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _0808790A
	adds r4, r0, #0
	ldr r3, _08087918
	mov r8, r3
_080878EA:
	adds r0, r6, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x1c]
	mov r3, r8
	ands r2, r3
	bl CpuSet
	ldr r0, _08087914
	ldr r0, [r0]
	lsls r0, r0, #1
	adds r5, r5, r0
	lsls r0, r7, #1
	adds r6, r6, r0
	subs r4, #1
	cmp r4, #0
	bne _080878EA
_0808790A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087914: .4byte 0x03005B20
_08087918: .4byte 0x001FFFFF
	thumb_func_end sub_080878B8

	thumb_func_start FillSouthConnection
FillSouthConnection: @ 0x0808791C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r3, r0, #0
	adds r5, r1, #0
	cmp r5, #0
	beq _08087976
	ldr r0, [r5]
	ldr r4, [r0]
	adds r2, #7
	ldr r0, [r3]
	ldr r0, [r0, #4]
	adds r7, r0, #7
	cmp r2, #0
	bge _08087950
	rsbs r6, r2, #0
	adds r2, r2, r4
	ldr r0, _0808794C
	ldr r3, [r0]
	cmp r2, r3
	bge _08087946
	adds r3, r2, #0
_08087946:
	movs r2, #0
	b _08087960
	.align 2, 0
_0808794C: .4byte 0x03005B20
_08087950:
	movs r6, #0
	adds r0, r2, r4
	ldr r1, _08087980
	ldr r1, [r1]
	subs r3, r1, r2
	cmp r0, r1
	bge _08087960
	adds r3, r4, #0
_08087960:
	movs r0, #0
	str r0, [sp]
	str r3, [sp, #4]
	movs r0, #7
	str r0, [sp, #8]
	adds r0, r2, #0
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_080878B8
_08087976:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087980: .4byte 0x03005B20
	thumb_func_end FillSouthConnection

	thumb_func_start FillNorthConnection
FillNorthConnection: @ 0x08087984
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	cmp r5, #0
	beq _080879D8
	ldr r0, [r5]
	ldr r4, [r0]
	ldr r0, [r0, #4]
	adds r2, #7
	subs r7, r0, #7
	cmp r2, #0
	bge _080879B4
	rsbs r6, r2, #0
	adds r2, r2, r4
	ldr r0, _080879B0
	ldr r3, [r0]
	cmp r2, r3
	bge _080879AA
	adds r3, r2, #0
_080879AA:
	movs r2, #0
	b _080879C4
	.align 2, 0
_080879B0: .4byte 0x03005B20
_080879B4:
	movs r6, #0
	adds r0, r2, r4
	ldr r1, _080879E0
	ldr r1, [r1]
	subs r3, r1, r2
	cmp r0, r1
	bge _080879C4
	adds r3, r4, #0
_080879C4:
	str r7, [sp]
	str r3, [sp, #4]
	movs r0, #7
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r1, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_080878B8
_080879D8:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080879E0: .4byte 0x03005B20
	thumb_func_end FillNorthConnection

	thumb_func_start FillWestConnection
FillWestConnection: @ 0x080879E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	cmp r5, #0
	beq _08087A38
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r4, [r0, #4]
	adds r2, #7
	subs r7, r1, #7
	cmp r2, #0
	bge _08087A14
	rsbs r6, r2, #0
	adds r1, r2, r4
	ldr r0, _08087A10
	ldr r3, [r0, #4]
	cmp r1, r3
	bge _08087A0A
	adds r3, r1, #0
_08087A0A:
	movs r2, #0
	b _08087A24
	.align 2, 0
_08087A10: .4byte 0x03005B20
_08087A14:
	movs r6, #0
	adds r0, r2, r4
	ldr r1, _08087A40
	ldr r1, [r1, #4]
	subs r3, r1, r2
	cmp r0, r1
	bge _08087A24
	adds r3, r4, #0
_08087A24:
	str r6, [sp]
	movs r0, #7
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	adds r1, r2, #0
	adds r2, r5, #0
	adds r3, r7, #0
	bl sub_080878B8
_08087A38:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087A40: .4byte 0x03005B20
	thumb_func_end FillWestConnection

	thumb_func_start FillEastConnection
FillEastConnection: @ 0x08087A44
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r3, r0, #0
	adds r5, r1, #0
	cmp r5, #0
	beq _08087A9C
	ldr r0, [r5]
	ldr r4, [r0, #4]
	ldr r0, [r3]
	ldr r0, [r0]
	adds r7, r0, #7
	adds r2, #7
	cmp r2, #0
	bge _08087A78
	rsbs r6, r2, #0
	adds r1, r2, r4
	ldr r0, _08087A74
	ldr r3, [r0, #4]
	cmp r1, r3
	bge _08087A6E
	adds r3, r1, #0
_08087A6E:
	movs r2, #0
	b _08087A88
	.align 2, 0
_08087A74: .4byte 0x03005B20
_08087A78:
	movs r6, #0
	adds r0, r2, r4
	ldr r1, _08087AA4
	ldr r1, [r1, #4]
	subs r3, r1, r2
	cmp r0, r1
	bge _08087A88
	adds r3, r4, #0
_08087A88:
	str r6, [sp]
	movs r0, #8
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r7, #0
	adds r1, r2, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_080878B8
_08087A9C:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087AA4: .4byte 0x03005B20
	thumb_func_end FillEastConnection

	thumb_func_start MapGridGetZCoordAt
MapGridGetZCoordAt: @ 0x08087AA8
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	blt _08087AD8
	ldr r1, _08087AD4
	ldr r3, [r1]
	cmp r2, r3
	bge _08087AD8
	cmp r4, #0
	blt _08087AD8
	ldr r0, [r1, #4]
	cmp r4, r0
	bge _08087AD8
	adds r0, r3, #0
	muls r0, r4, r0
	adds r0, r2, r0
	ldr r1, [r1, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	b _08087AFA
	.align 2, 0
_08087AD4: .4byte 0x03005B20
_08087AD8:
	ldr r0, _08087B04
	ldr r3, [r0]
	adds r1, r2, #1
	movs r2, #1
	ands r1, r2
	adds r0, r4, #1
	ands r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r3, #8]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r1, r0
_08087AFA:
	ldr r0, _08087B08
	cmp r1, r0
	beq _08087B0C
	lsrs r0, r1, #0xc
	b _08087B0E
	.align 2, 0
_08087B04: .4byte 0x02036FB8
_08087B08: .4byte 0x000003FF
_08087B0C:
	movs r0, #0
_08087B0E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MapGridGetZCoordAt

	thumb_func_start MapGridIsImpassableAt
MapGridIsImpassableAt: @ 0x08087B14
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	blt _08087B44
	ldr r1, _08087B40
	ldr r3, [r1]
	cmp r2, r3
	bge _08087B44
	cmp r4, #0
	blt _08087B44
	ldr r0, [r1, #4]
	cmp r4, r0
	bge _08087B44
	adds r0, r3, #0
	muls r0, r4, r0
	adds r0, r2, r0
	ldr r1, [r1, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	b _08087B66
	.align 2, 0
_08087B40: .4byte 0x03005B20
_08087B44:
	ldr r0, _08087B78
	ldr r3, [r0]
	adds r1, r2, #1
	movs r2, #1
	ands r1, r2
	adds r0, r4, #1
	ands r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r3, #8]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r1, r0
_08087B66:
	ldr r0, _08087B7C
	cmp r1, r0
	beq _08087B80
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r1, r0
	lsrs r0, r1, #0xa
	b _08087B82
	.align 2, 0
_08087B78: .4byte 0x02036FB8
_08087B7C: .4byte 0x000003FF
_08087B80:
	movs r0, #1
_08087B82:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MapGridIsImpassableAt

	thumb_func_start MapGridGetMetatileIdAt
MapGridGetMetatileIdAt: @ 0x08087B88
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	blt _08087BB8
	ldr r1, _08087BB4
	ldr r2, [r1]
	cmp r5, r2
	bge _08087BB8
	cmp r6, #0
	blt _08087BB8
	ldr r0, [r1, #4]
	cmp r6, r0
	bge _08087BB8
	adds r0, r2, #0
	muls r0, r6, r0
	adds r0, r5, r0
	ldr r1, [r1, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	b _08087BDC
	.align 2, 0
_08087BB4: .4byte 0x03005B20
_08087BB8:
	ldr r0, _08087BE8
	ldr r3, [r0]
	adds r1, r5, #1
	movs r2, #1
	ands r1, r2
	adds r0, r6, #1
	ands r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r3, #8]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	adds r4, r0, #0
	orrs r4, r1
_08087BDC:
	ldr r0, _08087BEC
	cmp r4, r0
	beq _08087BF0
	ands r4, r0
	adds r0, r4, #0
	b _08087C14
	.align 2, 0
_08087BE8: .4byte 0x02036FB8
_08087BEC: .4byte 0x000003FF
_08087BF0:
	ldr r0, _08087C1C
	ldr r3, [r0]
	adds r1, r5, #1
	movs r2, #1
	ands r1, r2
	adds r0, r6, #1
	ands r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r3, #8]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	ands r0, r4
_08087C14:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08087C1C: .4byte 0x02036FB8
	thumb_func_end MapGridGetMetatileIdAt

	thumb_func_start MapGridGetMetatileBehaviorAt
MapGridGetMetatileBehaviorAt: @ 0x08087C20
	push {lr}
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBehaviorByMetatileId
	adds r1, r0, #0
	movs r0, #0xff
	ands r0, r1
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileBehaviorAt

	thumb_func_start MapGridGetMetatileLayerTypeAt
MapGridGetMetatileLayerTypeAt: @ 0x08087C38
	push {lr}
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBehaviorByMetatileId
	adds r1, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xc
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileLayerTypeAt

	thumb_func_start MapGridSetMetatileIdAt
MapGridSetMetatileIdAt: @ 0x08087C54
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	cmp r3, #0
	blt _08087C8C
	ldr r2, _08087C94
	ldr r4, [r2]
	cmp r3, r4
	bge _08087C8C
	cmp r1, #0
	blt _08087C8C
	ldr r0, [r2, #4]
	cmp r1, r0
	bge _08087C8C
	muls r1, r4, r1
	adds r1, r3, r1
	ldr r0, [r2, #8]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _08087C98
	ands r0, r5
	orrs r2, r0
	strh r2, [r1]
_08087C8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087C94: .4byte 0x03005B20
_08087C98: .4byte 0x00000FFF
	thumb_func_end MapGridSetMetatileIdAt

	thumb_func_start MapGridSetMetatileEntryAt
MapGridSetMetatileEntryAt: @ 0x08087C9C
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	cmp r3, #0
	blt _08087CC8
	ldr r2, _08087CD0
	ldr r4, [r2]
	cmp r3, r4
	bge _08087CC8
	cmp r1, #0
	blt _08087CC8
	ldr r0, [r2, #4]
	cmp r1, r0
	bge _08087CC8
	adds r0, r4, #0
	muls r0, r1, r0
	adds r0, r3, r0
	ldr r1, [r2, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
_08087CC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087CD0: .4byte 0x03005B20
	thumb_func_end MapGridSetMetatileEntryAt

	thumb_func_start GetBehaviorByMetatileId
GetBehaviorByMetatileId: @ 0x08087CD4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, r2, #0
	ldr r0, _08087CF0
	cmp r2, r0
	bhi _08087CF8
	ldr r0, _08087CF4
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	ldr r1, [r0, #0x10]
	lsls r0, r2, #1
	b _08087D16
	.align 2, 0
_08087CF0: .4byte 0x000001FF
_08087CF4: .4byte 0x02036FB8
_08087CF8:
	ldr r0, _08087D04
	cmp r2, r0
	bls _08087D08
	movs r0, #0xff
	b _08087D1A
	.align 2, 0
_08087D04: .4byte 0x000003FF
_08087D08:
	ldr r0, _08087D20
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	ldr r1, [r0, #0x10]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldr r1, _08087D24
_08087D16:
	adds r0, r0, r1
	ldrh r0, [r0]
_08087D1A:
	pop {r1}
	bx r1
	.align 2, 0
_08087D20: .4byte 0x02036FB8
_08087D24: .4byte 0xFFFFFC00
	thumb_func_end GetBehaviorByMetatileId

	thumb_func_start save_serialize_map
save_serialize_map: @ 0x08087D28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08087D90
	ldr r1, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	ldr r0, _08087D94
	ldr r0, [r0]
	mov r8, r0
	movs r0, #0
	ldrsh r6, [r1, r0]
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r1, r0, #0
	adds r1, #0xe
	cmp r0, r1
	bge _08087D84
	mov ip, r1
	ldr r1, _08087D98
	mov sb, r1
	lsls r7, r6, #1
_08087D56:
	adds r1, r6, #0
	adds r3, r1, #0
	adds r3, #0xf
	adds r5, r0, #1
	cmp r1, r3
	bge _08087D7E
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #1
	add r0, sb
	adds r2, r7, r0
	subs r1, r3, r1
_08087D70:
	ldrh r0, [r2]
	strh r0, [r4]
	adds r4, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _08087D70
_08087D7E:
	adds r0, r5, #0
	cmp r0, ip
	blt _08087D56
_08087D84:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087D90: .4byte 0x03005AEC
_08087D94: .4byte 0x03005B20
_08087D98: .4byte 0x02031FB8
	thumb_func_end save_serialize_map

	thumb_func_start SavedMapViewIsEmpty
SavedMapViewIsEmpty: @ 0x08087D9C
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r0, _08087DC8
	ldr r0, [r0]
	adds r3, r0, #0
	adds r3, #0x34
	ldr r4, _08087DCC
_08087DAC:
	lsls r0, r1, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	orrs r2, r0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	bls _08087DAC
	cmp r2, #0
	beq _08087DD0
	movs r0, #0
	b _08087DD2
	.align 2, 0
_08087DC8: .4byte 0x03005AEC
_08087DCC: .4byte 0x000001FF
_08087DD0:
	movs r0, #1
_08087DD2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SavedMapViewIsEmpty

	thumb_func_start ClearSavedMapView
ClearSavedMapView: @ 0x08087DD8
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08087DF8
	ldr r1, [r0]
	adds r1, #0x34
	ldr r2, _08087DFC
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08087DF8: .4byte 0x03005AEC
_08087DFC: .4byte 0x01000100
	thumb_func_end ClearSavedMapView

	thumb_func_start LoadSavedMapView
LoadSavedMapView: @ 0x08087E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r4, _08087E48
	ldr r0, [r4]
	adds r7, r0, #0
	adds r7, #0x34
	bl SavedMapViewIsEmpty
	cmp r0, #0
	bne _08087F10
	ldr r0, _08087E4C
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sl, r1
	movs r2, #2
	ldrsh r1, [r0, r2]
	mov r8, r1
	mov r6, r8
	adds r0, r6, #0
	adds r0, #0xe
	cmp r6, r0
	bge _08087EBE
_08087E3A:
	cmp r6, r8
	bne _08087E50
	cmp r6, #0
	beq _08087E50
	movs r0, #0
	mov sb, r0
	b _08087E6C
	.align 2, 0
_08087E48: .4byte 0x03005AEC
_08087E4C: .4byte 0x03005B20
_08087E50:
	mov r0, r8
	adds r0, #0xd
	movs r1, #0xff
	mov sb, r1
	cmp r6, r0
	bne _08087E6C
	ldr r0, _08087F20
	ldr r0, [r0]
	ldr r0, [r0, #4]
	subs r0, #1
	cmp r6, r0
	beq _08087E6C
	movs r2, #1
	mov sb, r2
_08087E6C:
	mov r5, sl
	adds r0, r5, #0
	adds r0, #0xf
	mov r1, r8
	adds r1, #0xe
	str r1, [sp, #8]
	adds r2, r6, #1
	str r2, [sp, #4]
	cmp r5, r0
	bge _08087EB6
	ldr r0, [sp]
	lsls r3, r0, #0x10
_08087E84:
	ldr r1, [sp]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r5, r0
	lsls r0, r0, #1
	ldr r1, _08087F24
	adds r4, r0, r1
	adds r0, r4, #0
	lsrs r1, r3, #0x10
	mov r2, sb
	str r3, [sp, #0xc]
	bl SkipCopyingMetatileFromSavedMap
	lsls r0, r0, #0x18
	ldr r3, [sp, #0xc]
	cmp r0, #0
	bne _08087EAA
	ldrh r0, [r7]
	strh r0, [r4]
_08087EAA:
	adds r7, #2
	adds r5, #1
	mov r0, sl
	adds r0, #0xf
	cmp r5, r0
	blt _08087E84
_08087EB6:
	ldr r6, [sp, #4]
	ldr r2, [sp, #8]
	cmp r6, r2
	blt _08087E3A
_08087EBE:
	mov r5, sl
	adds r0, r5, #0
	adds r0, #0xf
	cmp r5, r0
	bge _08087F0C
	mov r0, r8
	subs r0, #1
	lsls r0, r0, #0x10
	mov sb, r0
	lsls r4, r5, #0x10
	mov r0, r8
	adds r0, #0xd
	lsls r7, r0, #0x10
_08087ED8:
	mov r0, r8
	cmp r0, #0
	beq _08087EE8
	asrs r0, r4, #0x10
	mov r2, sb
	asrs r1, r2, #0x10
	bl FixLongGrassMetatilesWindowTop
_08087EE8:
	ldr r0, _08087F20
	ldr r0, [r0]
	ldr r0, [r0, #4]
	subs r0, #1
	cmp r6, r0
	bge _08087EFC
	asrs r0, r4, #0x10
	asrs r1, r7, #0x10
	bl FixLongGrassMetatilesWindowBottom
_08087EFC:
	movs r0, #0x80
	lsls r0, r0, #9
	adds r4, r4, r0
	adds r5, #1
	mov r0, sl
	adds r0, #0xf
	cmp r5, r0
	blt _08087ED8
_08087F0C:
	bl ClearSavedMapView
_08087F10:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087F20: .4byte 0x02036FB8
_08087F24: .4byte 0x02031FB8
	thumb_func_end LoadSavedMapView

	thumb_func_start sub_08087F28
sub_08087F28: @ 0x08087F28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, r3, #0
	ldr r0, _08087F70
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x34
	str r0, [sp, #4]
	ldr r0, _08087F74
	ldr r0, [r0]
	str r0, [sp]
	movs r4, #0
	mov sb, r4
	mov r8, r4
	movs r0, #0
	ldrsh r6, [r1, r0]
	str r6, [sp, #8]
	movs r4, #2
	ldrsh r5, [r1, r4]
	movs r7, #0xf
	movs r6, #0xe
	mov ip, r6
	cmp r3, #2
	beq _08087F82
	cmp r3, #2
	bgt _08087F78
	cmp r3, #1
	beq _08087F8A
	b _08087FA2
	.align 2, 0
_08087F70: .4byte 0x03005AEC
_08087F74: .4byte 0x03005B20
_08087F78:
	cmp r2, #3
	beq _08087F94
	cmp r2, #4
	beq _08087F9C
	b _08087FA2
_08087F82:
	adds r5, #1
	movs r0, #0xd
	mov ip, r0
	b _08087FA2
_08087F8A:
	movs r1, #1
	mov r8, r1
	movs r3, #0xd
	mov ip, r3
	b _08087FA2
_08087F94:
	ldr r4, [sp, #8]
	adds r4, #1
	str r4, [sp, #8]
	b _08087FA0
_08087F9C:
	movs r6, #1
	mov sb, r6
_08087FA0:
	movs r7, #0xe
_08087FA2:
	movs r1, #0
	cmp r1, ip
	bge _08087FE6
	ldr r0, _08087FFC
	mov sl, r0
_08087FAC:
	adds r4, r1, #1
	cmp r7, #0
	beq _08087FE0
	adds r0, r1, r5
	ldr r3, [sp]
	adds r2, r3, #0
	muls r2, r0, r2
	add r1, r8
	lsls r0, r1, #4
	subs r0, r0, r1
	add r0, sb
	ldr r6, [sp, #8]
	adds r2, r6, r2
	adds r3, r7, #0
	lsls r2, r2, #1
	add r2, sl
	lsls r0, r0, #1
	ldr r6, [sp, #4]
	adds r1, r0, r6
_08087FD2:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08087FD2
_08087FE0:
	adds r1, r4, #0
	cmp r1, ip
	blt _08087FAC
_08087FE6:
	bl ClearSavedMapView
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087FFC: .4byte 0x02031FB8
	thumb_func_end sub_08087F28

	thumb_func_start GetMapBorderIdAt
GetMapBorderIdAt: @ 0x08088000
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	blt _0808803C
	ldr r1, _08088034
	ldr r2, [r1]
	cmp r4, r2
	bge _0808803C
	cmp r5, #0
	blt _0808803C
	ldr r0, [r1, #4]
	cmp r5, r0
	bge _0808803C
	adds r0, r2, #0
	muls r0, r5, r0
	adds r0, r4, r0
	ldr r1, [r1, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08088038
	cmp r1, r0
	beq _080880D4
	b _08088064
	.align 2, 0
_08088034: .4byte 0x03005B20
_08088038: .4byte 0x000003FF
_0808803C:
	ldr r0, _08088080
	ldr r3, [r0]
	adds r1, r4, #1
	movs r2, #1
	ands r1, r2
	adds r0, r5, #1
	ands r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r3, #8]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	ldr r1, _08088084
	cmp r0, r1
	beq _080880D4
_08088064:
	ldr r1, _08088088
	ldr r0, [r1]
	subs r0, #8
	cmp r4, r0
	blt _08088090
	ldr r0, _0808808C
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080880D4
	movs r0, #4
	b _080880E6
	.align 2, 0
_08088080: .4byte 0x02036FB8
_08088084: .4byte 0x000003FF
_08088088: .4byte 0x03005B20
_0808808C: .4byte 0x02036FE0
_08088090:
	cmp r4, #6
	bgt _080880A8
	ldr r0, _080880A4
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080880D4
	movs r0, #3
	b _080880E6
	.align 2, 0
_080880A4: .4byte 0x02036FE0
_080880A8:
	ldr r0, [r1, #4]
	subs r0, #7
	cmp r5, r0
	blt _080880C4
	ldr r0, _080880C0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080880D4
	movs r0, #1
	b _080880E6
	.align 2, 0
_080880C0: .4byte 0x02036FE0
_080880C4:
	cmp r5, #6
	bgt _080880E4
	ldr r0, _080880DC
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080880E0
_080880D4:
	movs r0, #1
	rsbs r0, r0, #0
	b _080880E6
	.align 2, 0
_080880DC: .4byte 0x02036FE0
_080880E0:
	movs r0, #2
	b _080880E6
_080880E4:
	movs r0, #0
_080880E6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetMapBorderIdAt

	thumb_func_start GetPostCameraMoveMapBorderId
GetPostCameraMoveMapBorderId: @ 0x080880EC
	push {r4, lr}
	adds r3, r1, #0
	ldr r1, _08088110
	ldr r1, [r1]
	movs r4, #0
	ldrsh r2, [r1, r4]
	adds r0, #7
	adds r2, r2, r0
	movs r0, #2
	ldrsh r1, [r1, r0]
	adds r3, #7
	adds r1, r1, r3
	adds r0, r2, #0
	bl GetMapBorderIdAt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08088110: .4byte 0x03005AEC
	thumb_func_end GetPostCameraMoveMapBorderId

	thumb_func_start CanCameraMoveInDirection
CanCameraMoveInDirection: @ 0x08088114
	push {r4, r5, lr}
	ldr r1, _0808814C
	ldr r4, [r1]
	movs r1, #0
	ldrsh r3, [r4, r1]
	ldr r2, _08088150
	lsls r0, r0, #3
	adds r1, r0, r2
	ldr r1, [r1]
	adds r1, #7
	adds r3, r3, r1
	movs r5, #2
	ldrsh r1, [r4, r5]
	adds r2, #4
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, #7
	adds r1, r1, r0
	adds r0, r3, #0
	bl GetMapBorderIdAt
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08088154
	movs r0, #1
	b _08088156
	.align 2, 0
_0808814C: .4byte 0x03005AEC
_08088150: .4byte 0x0830FCB0
_08088154:
	movs r0, #0
_08088156:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CanCameraMoveInDirection

	thumb_func_start sub_0808815C
sub_0808815C: @ 0x0808815C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl mapconnection_get_mapheader
	adds r3, r0, #0
	cmp r4, #2
	beq _080881C4
	cmp r4, #2
	bgt _0808817A
	cmp r4, #1
	beq _080881B0
	b _080881D6
_0808817A:
	cmp r4, #3
	beq _08088198
	cmp r4, #4
	bne _080881D6
	ldr r0, _08088194
	ldr r1, [r0]
	rsbs r0, r6, #0
	strh r0, [r1]
	ldr r2, [r5, #4]
	ldrh r0, [r1, #2]
	subs r0, r0, r2
	b _080881D4
	.align 2, 0
_08088194: .4byte 0x03005AEC
_08088198:
	ldr r0, _080881AC
	ldr r1, [r0]
	ldr r0, [r3]
	ldr r0, [r0]
	strh r0, [r1]
	ldr r2, [r5, #4]
	ldrh r0, [r1, #2]
	subs r0, r0, r2
	b _080881D4
	.align 2, 0
_080881AC: .4byte 0x03005AEC
_080881B0:
	ldr r0, _080881C0
	ldr r1, [r0]
	ldr r2, [r5, #4]
	ldrh r0, [r1]
	subs r0, r0, r2
	strh r0, [r1]
	rsbs r0, r7, #0
	b _080881D4
	.align 2, 0
_080881C0: .4byte 0x03005AEC
_080881C4:
	ldr r0, _080881DC
	ldr r1, [r0]
	ldr r2, [r5, #4]
	ldrh r0, [r1]
	subs r0, r0, r2
	strh r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, #4]
_080881D4:
	strh r0, [r1, #2]
_080881D6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080881DC: .4byte 0x03005AEC
	thumb_func_end sub_0808815C

	thumb_func_start CameraMove
CameraMove: @ 0x080881E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov sb, r1
	ldr r1, _08088220
	ldrb r0, [r1]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r0
	ldr r2, _08088220
	strb r1, [r2]
	mov r0, sl
	mov r1, sb
	bl GetPostCameraMoveMapBorderId
	adds r7, r0, #0
	adds r0, r7, #1
	cmp r0, #1
	bhi _08088228
	ldr r0, _08088224
	ldr r1, [r0]
	ldrh r0, [r1]
	add r0, sl
	strh r0, [r1]
	ldrh r0, [r1, #2]
	add r0, sb
	strh r0, [r1, #2]
	b _08088296
	.align 2, 0
_08088220: .4byte 0x02036FD4
_08088224: .4byte 0x03005AEC
_08088228:
	bl save_serialize_map
	bl ClearMirageTowerPulseBlendEffect
	ldr r1, _080882AC
	ldr r0, [r1]
	movs r2, #0
	ldrsh r5, [r0, r2]
	movs r1, #2
	ldrsh r6, [r0, r1]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080882B4
	adds r4, r0, #0
	adds r1, r7, #0
	mov r2, sl
	mov r3, sb
	bl sub_0808815C
	ldrb r0, [r4, #8]
	ldrb r1, [r4, #9]
	bl LoadMapFromCameraTransition
	ldr r1, _080882B0
	ldrb r0, [r1]
	movs r1, #1
	orrs r0, r1
	ldr r2, _080882B0
	strb r0, [r2]
	ldr r0, _080882AC
	ldr r1, [r0]
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r5, r5, r0
	ldr r0, _080882B0
	str r5, [r0, #4]
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r6, r6, r0
	ldr r0, _080882B0
	str r6, [r0, #8]
	ldrh r0, [r1]
	add r0, sl
	strh r0, [r1]
	ldrh r0, [r1, #2]
	add r0, sb
	strh r0, [r1, #2]
	mov r0, r8
	bl sub_08087F28
_08088296:
	ldr r0, _080882B0
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080882AC: .4byte 0x03005AEC
_080882B0: .4byte 0x02036FD4
	thumb_func_end CameraMove

	thumb_func_start sub_080882B4
sub_080882B4: @ 0x080882B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r1
	mov r8, r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080882F0
	ldr r0, [r0, #0xc]
	ldr r7, [r0]
	ldr r4, [r0, #4]
	movs r5, #0
	cmp r5, r7
	bge _080882FC
_080882D2:
	ldrb r0, [r4]
	cmp r0, r6
	bne _080882F4
	adds r0, r6, #0
	mov r1, sb
	mov r2, r8
	adds r3, r4, #0
	bl sub_0808830C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080882F4
	adds r0, r4, #0
	b _080882FE
	.align 2, 0
_080882F0: .4byte 0x02036FB8
_080882F4:
	adds r5, #1
	adds r4, #0xc
	cmp r5, r7
	blt _080882D2
_080882FC:
	movs r0, #0
_080882FE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080882B4

	thumb_func_start sub_0808830C
sub_0808830C: @ 0x0808830C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	adds r0, r5, #0
	bl mapconnection_get_mapheader
	adds r2, r0, #0
	cmp r4, #1
	blt _08088364
	cmp r4, #2
	bgt _08088344
	ldr r0, _08088340
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r2]
	ldr r2, [r0]
	ldr r3, [r5, #4]
	adds r0, r7, #0
	b _08088356
	.align 2, 0
_08088340: .4byte 0x02036FB8
_08088344:
	cmp r6, #4
	bgt _08088364
	ldr r0, _08088360
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldr r0, [r2]
	ldr r2, [r0, #4]
	ldr r3, [r5, #4]
	mov r0, r8
_08088356:
	bl sub_08088370
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08088366
	.align 2, 0
_08088360: .4byte 0x02036FB8
_08088364:
	movs r0, #0
_08088366:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0808830C

	thumb_func_start sub_08088370
sub_08088370: @ 0x08088370
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	adds r2, r3, #0
	cmp r3, #0
	bge _0808837E
	movs r3, #0
_0808837E:
	adds r2, r0, r2
	cmp r2, r1
	bge _08088386
	adds r1, r2, #0
_08088386:
	cmp r3, r4
	bgt _08088392
	cmp r4, r1
	bgt _08088392
	movs r0, #1
	b _08088394
_08088392:
	movs r0, #0
_08088394:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08088370

	thumb_func_start sub_0808839C
sub_0808839C: @ 0x0808839C
	push {lr}
	cmp r0, #0
	blt _080883AA
	cmp r0, r1
	bge _080883AA
	movs r0, #1
	b _080883AC
_080883AA:
	movs r0, #0
_080883AC:
	pop {r1}
	bx r1
	thumb_func_end sub_0808839C

	thumb_func_start sub_080883B0
sub_080883B0: @ 0x080883B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl mapconnection_get_mapheader
	adds r1, r0, #0
	ldrb r0, [r4]
	cmp r0, #1
	blt _080883E8
	cmp r0, #2
	bgt _080883D6
	ldr r0, [r4, #4]
	subs r0, r5, r0
	ldr r1, [r1]
	ldr r1, [r1]
	bl sub_0808839C
	b _080883EA
_080883D6:
	cmp r0, #4
	bgt _080883E8
	ldr r0, [r4, #4]
	subs r0, r6, r0
	ldr r1, [r1]
	ldr r1, [r1, #4]
	bl sub_0808839C
	b _080883EA
_080883E8:
	movs r0, #0
_080883EA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080883B0

	thumb_func_start sub_080883F0
sub_080883F0: @ 0x080883F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08088410
	ldr r0, [r2, #0xc]
	cmp r0, #0
	bne _08088418
	b _0808848E
	.align 2, 0
_08088410: .4byte 0x02036FB8
_08088414:
	adds r0, r4, #0
	b _08088490
_08088418:
	ldr r7, [r0]
	ldr r4, [r0, #4]
	movs r6, #0
	cmp r6, r7
	bge _0808848E
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	mov sb, r2
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_08088430:
	ldrb r1, [r4]
	adds r3, r1, #0
	subs r0, r1, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08088486
	cmp r1, #2
	bne _08088446
	cmp r5, #6
	bgt _08088486
_08088446:
	cmp r1, #1
	bne _08088456
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, #7
	cmp r5, r0
	blt _08088486
_08088456:
	mov r0, r8
	lsls r2, r0, #0x10
	cmp r1, #3
	bne _08088464
	mov r1, sl
	cmp r1, #6
	bgt _08088486
_08088464:
	cmp r3, #4
	bne _08088476
	asrs r1, r2, #0x10
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
	adds r0, #7
	cmp r1, r0
	blt _08088486
_08088476:
	asrs r1, r2, #0x10
	subs r1, #7
	adds r0, r4, #0
	subs r2, r5, #7
	bl sub_080883B0
	cmp r0, #1
	beq _08088414
_08088486:
	adds r6, #1
	adds r4, #0xc
	cmp r6, r7
	blt _08088430
_0808848E:
	movs r0, #0
_08088490:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080883F0

	thumb_func_start sub_080884A0
sub_080884A0: @ 0x080884A0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _080884B8
	ldr r2, [r2]
	subs r0, #7
	strh r0, [r2]
	subs r1, #7
	strh r1, [r2, #2]
	bx lr
	.align 2, 0
_080884B8: .4byte 0x03005AEC
	thumb_func_end sub_080884A0

	thumb_func_start GetCameraFocusCoords
GetCameraFocusCoords: @ 0x080884BC
	ldr r2, _080884D0
	ldr r3, [r2]
	ldrh r2, [r3]
	adds r2, #7
	strh r2, [r0]
	ldrh r0, [r3, #2]
	adds r0, #7
	strh r0, [r1]
	bx lr
	.align 2, 0
_080884D0: .4byte 0x03005AEC
	thumb_func_end GetCameraFocusCoords

	thumb_func_start SetPlayerCoords
SetPlayerCoords: @ 0x080884D4
	ldr r2, _080884E0
	ldr r2, [r2]
	strh r0, [r2]
	strh r1, [r2, #2]
	bx lr
	.align 2, 0
_080884E0: .4byte 0x03005AEC
	thumb_func_end SetPlayerCoords

	thumb_func_start GetCameraCoords
GetCameraCoords: @ 0x080884E4
	ldr r2, _080884F4
	ldr r3, [r2]
	ldrh r2, [r3]
	strh r2, [r0]
	ldrh r0, [r3, #2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080884F4: .4byte 0x03005AEC
	thumb_func_end GetCameraCoords

	thumb_func_start sub_080884F8
sub_080884F8: @ 0x080884F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	blt _0808854A
	ldr r2, _08088534
	ldr r1, [r2]
	cmp r4, r1
	bge _0808854A
	cmp r3, #0
	blt _0808854A
	ldr r0, [r2, #4]
	cmp r3, r0
	bge _0808854A
	cmp r5, #0
	beq _08088538
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, r4, r0
	ldr r1, [r2, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	b _0808854A
	.align 2, 0
_08088534: .4byte 0x03005B20
_08088538:
	muls r1, r3, r1
	adds r1, r4, r1
	ldr r0, [r2, #8]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r2, [r1]
	ldr r0, _08088550
	ands r0, r2
	strh r0, [r1]
_0808854A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088550: .4byte 0x0000F3FF
	thumb_func_end sub_080884F8

	thumb_func_start SkipCopyingMetatileFromSavedMap
SkipCopyingMetatileFromSavedMap: @ 0x08088554
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	adds r1, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #0xff
	beq _08088588
	cmp r2, #0
	bne _08088570
	lsls r0, r0, #1
	subs r3, r3, r0
	b _08088574
_08088570:
	lsls r0, r1, #1
	adds r3, r3, r0
_08088574:
	ldrh r1, [r3]
	ldr r0, _0808858C
	ands r0, r1
	adds r1, r2, #0
	bl sub_080FB654
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08088590
_08088588:
	movs r0, #0
	b _08088592
	.align 2, 0
_0808858C: .4byte 0x000003FF
_08088590:
	movs r0, #1
_08088592:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SkipCopyingMetatileFromSavedMap

	thumb_func_start copy_tileset_patterns_to_vram
copy_tileset_patterns_to_vram: @ 0x08088598
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r6, r4, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	adds r7, r5, #0
	cmp r3, #0
	beq _080885D4
	ldrb r0, [r3]
	cmp r0, #0
	bne _080885C4
	ldr r1, [r3, #4]
	lsls r2, r4, #0x15
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r3, r5, #0
	bl LoadBgTiles
	b _080885D4
_080885C4:
	ldr r1, [r3, #4]
	lsls r2, r6, #5
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r3, r7, #0
	bl decompress_and_copy_tile_data_to_vram
_080885D4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end copy_tileset_patterns_to_vram

	thumb_func_start copy_tileset_patterns_to_vram2
copy_tileset_patterns_to_vram2: @ 0x080885DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r6, r4, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	adds r7, r5, #0
	cmp r3, #0
	beq _08088618
	ldrb r0, [r3]
	cmp r0, #0
	bne _08088608
	ldr r1, [r3, #4]
	lsls r2, r4, #0x15
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r3, r5, #0
	bl LoadBgTiles
	b _08088618
_08088608:
	ldr r1, [r3, #4]
	lsls r2, r6, #5
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r3, r7, #0
	bl DecompressAndLoadBgGfxUsingHeap
_08088618:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end copy_tileset_patterns_to_vram2

	thumb_func_start nullsub_90
nullsub_90: @ 0x08088620
	bx lr
	.align 2, 0
	thumb_func_end nullsub_90

	thumb_func_start nullsub_3
nullsub_3: @ 0x08088624
	bx lr
	.align 2, 0
	thumb_func_end nullsub_3

	thumb_func_start apply_map_tileset_palette
apply_map_tileset_palette: @ 0x08088628
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	mov r8, r5
	lsls r6, r2, #0x10
	lsrs r7, r6, #0x10
	adds r2, r7, #0
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	cmp r4, #0
	beq _080886A6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0808867C
	mov r0, sp
	adds r1, r5, #0
	movs r2, #2
	bl LoadPalette
	ldr r0, [r4, #8]
	adds r0, #2
	adds r5, #1
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	subs r4, r7, #2
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	adds r1, r5, #0
	bl LoadPalette
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl nullsub_90
	b _080886A6
_0808867C:
	cmp r0, #1
	bne _08088696
	ldr r0, [r4, #8]
	adds r0, #0xc0
	adds r1, r5, #0
	adds r2, r7, #0
	bl LoadPalette
	lsrs r1, r6, #0x11
	adds r0, r5, #0
	bl nullsub_90
	b _080886A6
_08088696:
	ldr r0, [r4, #8]
	mov r1, r8
	bl LoadCompressedPalette
	lsrs r1, r6, #0x11
	mov r0, r8
	bl nullsub_90
_080886A6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end apply_map_tileset_palette

	thumb_func_start copy_map_tileset1_to_vram
copy_map_tileset1_to_vram: @ 0x080886B4
	push {lr}
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0
	bl copy_tileset_patterns_to_vram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end copy_map_tileset1_to_vram

	thumb_func_start copy_map_tileset2_to_vram
copy_map_tileset2_to_vram: @ 0x080886C8
	push {lr}
	ldr r0, [r0, #0x14]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	bl copy_tileset_patterns_to_vram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end copy_map_tileset2_to_vram

	thumb_func_start copy_map_tileset2_to_vram_2
copy_map_tileset2_to_vram_2: @ 0x080886DC
	push {lr}
	ldr r0, [r0, #0x14]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	bl copy_tileset_patterns_to_vram2
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end copy_map_tileset2_to_vram_2

	thumb_func_start apply_map_tileset1_palette
apply_map_tileset1_palette: @ 0x080886F0
	push {lr}
	ldr r0, [r0, #0x10]
	movs r1, #0
	movs r2, #0xc0
	bl apply_map_tileset_palette
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_palette

	thumb_func_start apply_map_tileset2_palette
apply_map_tileset2_palette: @ 0x08088700
	push {lr}
	ldr r0, [r0, #0x14]
	movs r1, #0x60
	movs r2, #0xe0
	bl apply_map_tileset_palette
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset2_palette

	thumb_func_start copy_map_tileset1_tileset2_to_vram
copy_map_tileset1_tileset2_to_vram: @ 0x08088710
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r5, #0
	beq _08088730
	ldr r0, [r5, #0x10]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0
	bl copy_tileset_patterns_to_vram2
	ldr r0, [r5, #0x14]
	adds r1, r4, #0
	adds r2, r4, #0
	bl copy_tileset_patterns_to_vram2
_08088730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end copy_map_tileset1_tileset2_to_vram

	thumb_func_start apply_map_tileset1_tileset2_palette
apply_map_tileset1_tileset2_palette: @ 0x08088738
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0808874A
	bl apply_map_tileset1_palette
	adds r0, r4, #0
	bl apply_map_tileset2_palette
_0808874A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_tileset2_palette

