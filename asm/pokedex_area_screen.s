.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetDrawAreaGlowState
ResetDrawAreaGlowState: @ 0x0813CA30
	ldr r0, _0813CA40
	ldr r0, [r0]
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_0813CA40: .4byte 0x0203A848
	thumb_func_end ResetDrawAreaGlowState

	thumb_func_start DrawAreaGlow
DrawAreaGlow: @ 0x0813CA44
	push {lr}
	sub sp, #4
	ldr r0, _0813CA64
	ldr r0, [r0]
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #4
	bhi _0813CAFC
	lsls r0, r0, #2
	ldr r1, _0813CA68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813CA64: .4byte 0x0203A848
_0813CA68: .4byte 0x0813CA6C
_0813CA6C: @ jump table
	.4byte _0813CA80 @ case 0
	.4byte _0813CA90 @ case 1
	.4byte _0813CA96 @ case 2
	.4byte _0813CAC8 @ case 3
	.4byte _0813CAEC @ case 4
_0813CA80:
	ldr r0, _0813CA8C
	ldr r0, [r0]
	ldrh r0, [r0, #0xe]
	bl FindMapsWithMon
	b _0813CB00
	.align 2, 0
_0813CA8C: .4byte 0x0203A848
_0813CA90:
	bl BuildAreaGlowTilemap
	b _0813CB00
_0813CA96:
	ldr r1, _0813CAC0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _0813CAC4
	ldr r1, [r0]
	movs r0, #0x8b
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r2, #0xa0
	lsls r2, r2, #3
	movs r0, #2
	movs r3, #0
	bl LoadBgTilemap
	b _0813CB00
	.align 2, 0
_0813CAC0: .4byte 0x0859383C
_0813CAC4: .4byte 0x0203A848
_0813CAC8:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813CB10
	ldr r0, _0813CAE0
	ldr r1, _0813CAE4
	ldr r2, _0813CAE8
	bl CpuSet
	b _0813CB00
	.align 2, 0
_0813CAE0: .4byte 0x0859381C
_0813CAE4: .4byte 0x020374F4
_0813CAE8: .4byte 0x04000008
_0813CAEC:
	ldr r1, _0813CAF8
	movs r0, #2
	movs r2, #0
	bl ChangeBgY
	b _0813CB00
	.align 2, 0
_0813CAF8: .4byte 0xFFFFF800
_0813CAFC:
	movs r0, #0
	b _0813CB12
_0813CB00:
	ldr r0, _0813CB18
	ldr r1, [r0]
	movs r0, #0x8a
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0813CB10:
	movs r0, #1
_0813CB12:
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0813CB18: .4byte 0x0203A848
	thumb_func_end DrawAreaGlow

	thumb_func_start FindMapsWithMon
FindMapsWithMon: @ 0x0813CB1C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r5, _0813CBC4
	ldr r0, [r5]
	ldr r1, _0813CBC8
	adds r0, r0, r1
	movs r4, #0
	strh r4, [r0]
	ldr r0, _0813CBCC
	bl VarGet
	ldr r1, [r5]
	ldr r2, _0813CBD0
	adds r1, r1, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _0813CB4C
	strh r4, [r1]
_0813CB4C:
	ldr r0, _0813CBD4
	ldr r0, [r0]
	ldr r3, _0813CBD8
	adds r0, r0, r3
	ldrh r1, [r0, #8]
	cmp r7, r1
	bne _0813CB5C
	b _0813CC94
_0813CB5C:
	ldr r1, [r5]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r1, r2
	strh r4, [r0]
	movs r3, #0x89
	lsls r3, r3, #1
	adds r0, r1, r3
	strh r4, [r0]
	movs r6, #0
	ldr r1, _0813CBDC
_0813CB72:
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	bne _0813CB7E
	b _0813CCD4
_0813CB7E:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0813CB72
	movs r6, #0
	ldr r4, _0813CBE0
	ldrh r0, [r4]
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _0813CC20
	mov r8, r4
	adds r5, r4, #4
	mov sb, r1
_0813CB9C:
	lsls r0, r6, #1
	adds r1, r0, r6
	lsls r2, r1, #1
	mov r3, r8
	adds r1, r2, r3
	adds r3, r0, #0
	ldrh r1, [r1]
	cmp r7, r1
	bne _0813CC0A
	adds r0, r4, #2
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x18
	beq _0813CBF6
	cmp r0, #0x18
	bgt _0813CBE4
	cmp r0, #0
	beq _0813CBEA
	b _0813CC0A
	.align 2, 0
_0813CBC4: .4byte 0x0203A848
_0813CBC8: .4byte 0x000006E2
_0813CBCC: .4byte 0x0000403E
_0813CBD0: .4byte 0x000006E4
_0813CBD4: .4byte 0x03005AEC
_0813CBD8: .4byte 0x000031DC
_0813CBDC: .4byte 0x08593970
_0813CBE0: .4byte 0x08593978
_0813CBE4:
	cmp r0, #0x1a
	beq _0813CBF6
	b _0813CC0A
_0813CBEA:
	adds r0, r2, r5
	ldrh r1, [r0]
	movs r0, #0
	bl SetAreaHasMon
	b _0813CC0A
_0813CBF6:
	adds r1, r3, r6
	lsls r1, r1, #1
	mov r0, r8
	adds r0, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r1, r1, r5
	ldrh r1, [r1]
	bl SetSpecialMapHasMon
_0813CC0A:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _0813CC50
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, sb
	bne _0813CB9C
_0813CC20:
	movs r6, #0
	ldr r1, _0813CC54
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0813CCD4
_0813CC2A:
	lsls r4, r6, #2
	adds r0, r4, r6
	lsls r0, r0, #2
	adds r5, r0, r1
	adds r0, r5, #0
	adds r1, r7, #0
	bl MapHasMon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813CC78
	ldrb r0, [r5]
	cmp r0, #0x18
	beq _0813CC68
	cmp r0, #0x18
	bgt _0813CC58
	cmp r0, #0
	beq _0813CC5E
	b _0813CC78
	.align 2, 0
_0813CC50: .4byte 0x08593978
_0813CC54: .4byte 0x0852D9F4
_0813CC58:
	cmp r0, #0x1a
	beq _0813CC68
	b _0813CC78
_0813CC5E:
	ldrb r1, [r5, #1]
	movs r0, #0
	bl SetAreaHasMon
	b _0813CC78
_0813CC68:
	ldr r0, _0813CC90
	adds r1, r4, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl SetSpecialMapHasMon
_0813CC78:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _0813CC90
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0813CC2A
	b _0813CCD4
	.align 2, 0
_0813CC90: .4byte 0x0852D9F4
_0813CC94:
	ldr r2, [r5]
	movs r3, #0x89
	lsls r3, r3, #1
	adds r1, r2, r3
	strh r4, [r1]
	ldrb r1, [r0, #0x13]
	cmp r1, #0
	beq _0813CCCC
	adds r0, r2, #0
	adds r0, #0x10
	adds r1, r2, #0
	adds r1, #0x11
	bl GetRoamerLocation
	ldr r1, [r5]
	ldrb r0, [r1, #0x10]
	ldrb r1, [r1, #0x11]
	bl Overworld_GetMapHeaderByGroupAndId
	ldr r1, [r5]
	ldrb r0, [r0, #0x14]
	strh r0, [r1, #0x12]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1]
	b _0813CCD4
_0813CCCC:
	movs r3, #0x88
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
_0813CCD4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end FindMapsWithMon

	thumb_func_start SetAreaHasMon
SetAreaHasMon: @ 0x0813CCE0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r4, _0813CD3C
	ldr r2, [r4]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, #0x3f
	bhi _0813CD34
	lsls r0, r0, #2
	adds r0, r2, r0
	strb r5, [r0, #0x10]
	ldr r1, [r4]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r3, [r1, #0x11]
	adds r0, r5, #0
	adds r1, r3, #0
	bl Overworld_GetMapHeaderByGroupAndId
	ldrb r0, [r0, #0x14]
	bl CorrectSpecialMapSecId
	ldr r2, [r4]
	movs r1, #0x88
	lsls r1, r1, #1
	adds r3, r2, r1
	ldrh r1, [r3]
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2, #0x12]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_0813CD34:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813CD3C: .4byte 0x0203A848
	thumb_func_end SetAreaHasMon

	thumb_func_start SetSpecialMapHasMon
SetSpecialMapHasMon: @ 0x0813CD40
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _0813CE04
	ldr r0, [r0]
	movs r3, #0x89
	lsls r3, r3, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, #0x1f
	bhi _0813CDFE
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl GetRegionMapSectionId
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xd4
	bhi _0813CDFE
	movs r3, #0
	ldr r0, _0813CE08
_0813CD72:
	ldrh r4, [r0]
	cmp r5, r4
	beq _0813CDFE
	adds r0, #2
	adds r3, #1
	cmp r3, #2
	bls _0813CD72
	ldr r1, _0813CE0C
	ldrh r0, [r1]
	cmp r0, #0xd5
	beq _0813CDAE
	adds r4, r1, #0
	adds r7, r4, #0
	movs r6, #0
_0813CD8E:
	ldrh r0, [r4]
	cmp r5, r0
	bne _0813CDA4
	adds r0, r7, #2
	adds r0, r6, r0
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0813CDFE
_0813CDA4:
	adds r4, #4
	adds r6, #4
	ldrh r0, [r4]
	cmp r0, #0xd5
	bne _0813CD8E
_0813CDAE:
	movs r3, #0
	ldr r0, _0813CE04
	ldr r2, [r0]
	movs r4, #0x89
	lsls r4, r4, #1
	adds r1, r2, r4
	ldrh r4, [r1]
	adds r1, r0, #0
	cmp r3, r4
	bge _0813CDDE
	movs r6, #0xc4
	lsls r6, r6, #3
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r5
	beq _0813CDDE
	adds r2, r2, r6
_0813CDD0:
	adds r2, #2
	adds r3, #1
	cmp r3, r4
	bge _0813CDDE
	ldrh r0, [r2]
	cmp r0, r5
	bne _0813CDD0
_0813CDDE:
	ldr r1, [r1]
	movs r0, #0x89
	lsls r0, r0, #1
	adds r2, r1, r0
	ldrh r4, [r2]
	cmp r3, r4
	bne _0813CDFE
	lsls r0, r3, #1
	movs r6, #0xc4
	lsls r6, r6, #3
	adds r1, r1, r6
	adds r1, r1, r0
	strh r5, [r1]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_0813CDFE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813CE04: .4byte 0x0203A848
_0813CE08: .4byte 0x08593972
_0813CE0C: .4byte 0x08593984
	thumb_func_end SetSpecialMapHasMon

	thumb_func_start GetRegionMapSectionId
GetRegionMapSectionId: @ 0x0813CE10
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl Overworld_GetMapHeaderByGroupAndId
	ldrb r0, [r0, #0x14]
	pop {r1}
	bx r1
	thumb_func_end GetRegionMapSectionId

	thumb_func_start MapHasMon
MapHasMon: @ 0x0813CE24
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetRegionMapSectionId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd2
	bne _0813CE58
	ldr r0, _0813CE9C
	ldr r2, [r0]
	ldr r0, _0813CEA0
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r1, [r1]
	ldr r0, _0813CEA4
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r0, #1
	cmp r1, r0
	bne _0813CE98
_0813CE58:
	ldr r0, [r4, #4]
	adds r1, r5, #0
	movs r2, #0xc
	bl MonListHasMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813CEA8
	ldr r0, [r4, #8]
	adds r1, r5, #0
	movs r2, #5
	bl MonListHasMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813CEA8
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	movs r2, #0xc
	bl MonListHasMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813CEA8
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	movs r2, #5
	bl MonListHasMon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813CEA8
_0813CE98:
	movs r0, #0
	b _0813CEAA
	.align 2, 0
_0813CE9C: .4byte 0x0203A848
_0813CEA0: .4byte 0x000006E2
_0813CEA4: .4byte 0x000006E4
_0813CEA8:
	movs r0, #1
_0813CEAA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MapHasMon

	thumb_func_start MonListHasMon
MonListHasMon: @ 0x0813CEB0
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #0
	beq _0813CEDE
	movs r3, #0
	cmp r3, r2
	bhs _0813CEDE
	ldr r1, [r0, #4]
_0813CEC6:
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, r4
	bne _0813CED4
	movs r0, #1
	b _0813CEE0
_0813CED4:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	blo _0813CEC6
_0813CEDE:
	movs r0, #0
_0813CEE0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MonListHasMon

	thumb_func_start BuildAreaGlowTilemap
BuildAreaGlowTilemap: @ 0x0813CEE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	ldr r0, _0813D0F4
	mov sb, r0
	mov r5, sb
	movs r4, #0x8b
	lsls r4, r4, #1
	movs r3, #0
	ldr r2, _0813D0F8
_0813CF04:
	ldr r0, [r5]
	lsls r1, r7, #1
	adds r0, r0, r4
	adds r0, r0, r1
	strh r3, [r0]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, r2
	bls _0813CF04
	movs r7, #0
	mov r1, sb
	ldr r0, [r1]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r7, r0
	bhs _0813CF92
	mov r3, sb
_0813CF2C:
	movs r5, #0
	movs r6, #0
	adds r0, r7, #1
	mov r8, r0
	lsls r7, r7, #2
	mov sl, r7
_0813CF38:
	movs r4, #0
_0813CF3A:
	adds r0, r4, #0
	adds r1, r6, #0
	str r3, [sp]
	bl GetRegionMapSectionIdAt
	ldr r3, [sp]
	ldr r2, [r3]
	mov r7, sl
	adds r1, r2, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x12]
	cmp r0, r1
	bne _0813CF64
	lsls r0, r5, #1
	movs r7, #0x8b
	lsls r7, r7, #1
	adds r1, r2, r7
	adds r1, r1, r0
	ldr r0, _0813D0FC
	strh r0, [r1]
_0813CF64:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1f
	bls _0813CF3A
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x13
	bls _0813CF38
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r3]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r7, r0
	blo _0813CF2C
_0813CF92:
	movs r5, #0
	movs r6, #0
	ldr r7, _0813D0F4
	mov ip, r7
	movs r7, #0x8b
	lsls r7, r7, #1
	ldr r3, _0813D0FC
_0813CFA0:
	movs r4, #0
	adds r0, r6, #1
	mov sl, r0
_0813CFA6:
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r5, #1
	adds r2, r0, r7
	adds r1, r2, r1
	ldrh r0, [r1]
	adds r1, r5, #1
	mov r8, r1
	cmp r0, r3
	bne _0813D0B2
	cmp r4, #0
	beq _0813CFD0
	subs r0, r5, #1
	lsls r0, r0, #1
	adds r1, r2, r0
	ldrh r2, [r1]
	cmp r2, r3
	beq _0813CFD0
	movs r0, #2
	orrs r0, r2
	strh r0, [r1]
_0813CFD0:
	adds r2, r5, #1
	mov r8, r2
	cmp r4, #0x1f
	beq _0813CFEE
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r2, #1
	adds r0, r0, r7
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, r3
	beq _0813CFEE
	movs r0, #1
	orrs r0, r1
	strh r0, [r2]
_0813CFEE:
	cmp r6, #0
	beq _0813D00C
	mov r2, ip
	ldr r1, [r2]
	adds r0, r5, #0
	subs r0, #0x20
	lsls r0, r0, #1
	adds r1, r1, r7
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, r3
	beq _0813D00C
	movs r0, #8
	orrs r0, r2
	strh r0, [r1]
_0813D00C:
	cmp r6, #0x13
	beq _0813D02A
	mov r0, ip
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	lsls r0, r0, #1
	adds r1, r1, r7
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, r3
	beq _0813D02A
	movs r0, #4
	orrs r0, r2
	strh r0, [r1]
_0813D02A:
	cmp r4, #0
	beq _0813D04C
	cmp r6, #0
	beq _0813D04C
	mov r2, ip
	ldr r1, [r2]
	adds r0, r5, #0
	subs r0, #0x21
	lsls r0, r0, #1
	adds r1, r1, r7
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, r3
	beq _0813D04C
	movs r0, #0x10
	orrs r0, r2
	strh r0, [r1]
_0813D04C:
	cmp r4, #0x1f
	beq _0813D06E
	cmp r6, #0
	beq _0813D06E
	mov r0, ip
	ldr r1, [r0]
	adds r0, r5, #0
	subs r0, #0x1f
	lsls r0, r0, #1
	adds r1, r1, r7
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, r3
	beq _0813D06E
	movs r0, #0x40
	orrs r0, r2
	strh r0, [r1]
_0813D06E:
	cmp r4, #0
	beq _0813D090
	cmp r6, #0x13
	beq _0813D090
	mov r2, ip
	ldr r1, [r2]
	adds r0, r5, #0
	adds r0, #0x1f
	lsls r0, r0, #1
	adds r1, r1, r7
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, r3
	beq _0813D090
	movs r0, #0x20
	orrs r0, r2
	strh r0, [r1]
_0813D090:
	cmp r4, #0x1f
	beq _0813D0B2
	cmp r6, #0x13
	beq _0813D0B2
	mov r0, ip
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0x21
	lsls r0, r0, #1
	adds r1, r1, r7
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, r3
	beq _0813D0B2
	movs r0, #0x80
	orrs r0, r2
	strh r0, [r1]
_0813D0B2:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1f
	bhi _0813D0C4
	b _0813CFA6
_0813D0C4:
	mov r2, sl
	lsls r0, r2, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x13
	bhi _0813D0D0
	b _0813CFA0
_0813D0D0:
	movs r7, #0
_0813D0D2:
	mov r1, sb
	ldr r0, [r1]
	lsls r1, r7, #1
	movs r6, #0x8b
	lsls r6, r6, #1
	adds r0, r0, r6
	adds r3, r0, r1
	ldrh r4, [r3]
	adds r2, r4, #0
	ldr r0, _0813D0FC
	adds r5, r1, #0
	cmp r2, r0
	bne _0813D104
	ldr r0, _0813D100
	strh r0, [r3]
	b _0813D2A8
	.align 2, 0
_0813D0F4: .4byte 0x0203A848
_0813D0F8: .4byte 0x0000027F
_0813D0FC: .4byte 0x0000FFFF
_0813D100: .4byte 0x0000A010
_0813D104:
	cmp r2, #0
	bne _0813D10A
	b _0813D2A8
_0813D10A:
	movs r2, #0xa0
	lsls r2, r2, #8
	adds r0, r2, #0
	adds r1, r0, #0
	orrs r1, r4
	strh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0813D124
	ldr r0, _0813D198
	ands r1, r0
	strh r1, [r3]
_0813D124:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r6
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0813D13C
	ldr r0, _0813D19C
	ands r0, r1
	strh r0, [r2]
_0813D13C:
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r6
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0813D154
	ldr r0, _0813D1A0
	ands r0, r1
	strh r0, [r2]
_0813D154:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r6
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0813D16C
	ldr r0, _0813D1A4
	ands r0, r1
	strh r0, [r2]
_0813D16C:
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r6
	adds r4, r0, r5
	ldrh r0, [r4]
	movs r1, #0xf
	ands r1, r0
	adds r3, r1, #0
	movs r2, #0xf0
	ands r2, r0
	cmp r2, #0
	bne _0813D186
	b _0813D2A8
_0813D186:
	strh r1, [r4]
	cmp r3, #0xa
	bls _0813D18E
	b _0813D2A8
_0813D18E:
	lsls r0, r3, #2
	ldr r1, _0813D1A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813D198: .4byte 0x0000FFCF
_0813D19C: .4byte 0x0000FF3F
_0813D1A0: .4byte 0x0000FFAF
_0813D1A4: .4byte 0x0000FF5F
_0813D1A8: .4byte 0x0813D1AC
_0813D1AC: @ jump table
	.4byte _0813D1D8 @ case 0
	.4byte _0813D208 @ case 1
	.4byte _0813D1F0 @ case 2
	.4byte _0813D2A8 @ case 3
	.4byte _0813D254 @ case 4
	.4byte _0813D284 @ case 5
	.4byte _0813D284 @ case 6
	.4byte _0813D2A8 @ case 7
	.4byte _0813D224 @ case 8
	.4byte _0813D296 @ case 9
	.4byte _0813D296 @ case 10
_0813D1D8:
	cmp r2, #0
	beq _0813D2A8
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0x8b
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #0x10
	lsrs r2, r2, #4
	b _0813D21E
_0813D1F0:
	cmp r2, #0
	beq _0813D2A8
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0x8b
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #0x1e
	lsrs r2, r2, #4
	b _0813D21E
_0813D208:
	cmp r2, #0
	beq _0813D2A8
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0x8b
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #0x20
	lsrs r2, r2, #6
_0813D21E:
	adds r1, r1, r2
	strh r1, [r0]
	b _0813D2A8
_0813D224:
	cmp r2, #0
	beq _0813D2A8
	movs r0, #0x80
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r3, r0, #0x1f
	movs r0, #0x20
	ands r2, r0
	cmp r2, #0
	beq _0813D240
	movs r0, #2
	orrs r3, r0
_0813D240:
	mov r2, sb
	ldr r1, [r2]
	movs r0, #0x8b
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r5
	ldrh r0, [r1]
	adds r0, #0x20
	adds r0, r0, r3
	b _0813D2A6
_0813D254:
	cmp r2, #0
	beq _0813D2A8
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r3, r0, #0x1f
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _0813D270
	movs r0, #2
	orrs r3, r0
_0813D270:
	mov r2, sb
	ldr r1, [r2]
	movs r0, #0x8b
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r5
	ldrh r0, [r1]
	adds r0, #0x21
	adds r0, r0, r3
	b _0813D2A6
_0813D284:
	mov r2, sb
	ldr r1, [r2]
	movs r0, #0x8b
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r5
	ldrh r0, [r1]
	adds r0, #0x27
	b _0813D2A6
_0813D296:
	mov r2, sb
	ldr r1, [r2]
	movs r0, #0x8b
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r5
	ldrh r0, [r1]
	adds r0, #0x25
_0813D2A6:
	strh r0, [r1]
_0813D2A8:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0813D2C8
	cmp r7, r0
	bhi _0813D2B6
	b _0813D0D2
_0813D2B6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813D2C8: .4byte 0x0000027F
	thumb_func_end BuildAreaGlowTilemap

	thumb_func_start StartAreaGlow
StartAreaGlow: @ 0x0813D2CC
	push {lr}
	ldr r1, _0813D2F8
	ldr r2, [r1]
	movs r3, #0x89
	lsls r3, r3, #1
	adds r0, r2, r3
	ldrh r0, [r0]
	adds r3, r1, #0
	cmp r0, #0
	beq _0813D300
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _0813D300
	ldr r0, _0813D2FC
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	b _0813D30A
	.align 2, 0
_0813D2F8: .4byte 0x0203A848
_0813D2FC: .4byte 0x0000061E
_0813D300:
	ldr r0, [r3]
	ldr r1, _0813D34C
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_0813D30A:
	ldr r1, [r3]
	ldr r2, _0813D350
	adds r0, r1, r2
	movs r2, #0
	strh r2, [r0]
	movs r3, #0xc3
	lsls r3, r3, #3
	adds r0, r1, r3
	strh r2, [r0]
	adds r3, #2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _0813D354
	adds r2, r1, r0
	movs r0, #0x40
	strh r0, [r2]
	ldr r2, _0813D358
	adds r1, r1, r2
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0813D35C
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	bl DoAreaGlow
	pop {r0}
	bx r0
	.align 2, 0
_0813D34C: .4byte 0x0000061E
_0813D350: .4byte 0x00000616
_0813D354: .4byte 0x0000061C
_0813D358: .4byte 0x0000061F
_0813D35C: .4byte 0x00003F44
	thumb_func_end StartAreaGlow

	thumb_func_start DoAreaGlow
DoAreaGlow: @ 0x0813D360
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0813D39C
	ldr r2, [r0]
	ldr r3, _0813D3A0
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r7, r0, #0
	cmp r1, #0
	bne _0813D42E
	ldr r0, _0813D3A4
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _0813D428
	movs r1, #0xc3
	lsls r1, r1, #3
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0813D3A8
	subs r3, #4
	adds r0, r2, r3
	b _0813D3AC
	.align 2, 0
_0813D39C: .4byte 0x0203A848
_0813D3A0: .4byte 0x0000061E
_0813D3A4: .4byte 0x00000616
_0813D3A8:
	ldr r1, _0813D414
	adds r0, r2, r1
_0813D3AC:
	ldrh r1, [r0]
	adds r1, #4
	movs r2, #0x7f
	ands r1, r2
	strh r1, [r0]
	ldr r3, _0813D418
	ldr r1, [r7]
	ldr r2, _0813D41C
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	lsls r2, r2, #0x10
	ldr r0, _0813D414
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x18
	orrs r1, r2
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, [r7]
	ldr r2, _0813D420
	adds r0, r1, r2
	movs r3, #0
	strh r3, [r0]
	movs r0, #0xc3
	lsls r0, r0, #3
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0x40
	bne _0813D4CA
	strh r3, [r2]
	movs r2, #0x89
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _0813D4CA
	ldr r3, _0813D424
	adds r1, r1, r3
	movs r0, #1
	b _0813D4C8
	.align 2, 0
_0813D414: .4byte 0x0000061C
_0813D418: .4byte 0x082FA8CC
_0813D41C: .4byte 0x0000061A
_0813D420: .4byte 0x00000616
_0813D424: .4byte 0x0000061E
_0813D428:
	subs r0, #1
	strh r0, [r1]
	b _0813D4CA
_0813D42E:
	ldr r0, _0813D4D4
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc
	bls _0813D4CA
	movs r0, #0
	strh r0, [r1]
	ldr r3, _0813D4D8
	adds r1, r2, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r4, #0
	ldr r0, [r7]
	movs r6, #0x89
	lsls r6, r6, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r4, r0
	bhs _0813D4A4
	adds r5, r7, #0
	movs r0, #1
	mov ip, r0
	movs r1, #5
	rsbs r1, r1, #0
	mov r8, r1
_0813D46A:
	ldr r1, [r5]
	lsls r2, r4, #2
	movs r3, #0xcc
	lsls r3, r3, #3
	adds r0, r1, r3
	adds r0, r0, r2
	ldr r3, [r0]
	ldr r0, _0813D4D8
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #1
	adds r3, #0x3e
	ands r1, r0
	mov r2, ip
	ands r1, r2
	lsls r1, r1, #2
	ldrb r2, [r3]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5]
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r4, r0
	blo _0813D46A
_0813D4A4:
	ldr r0, [r7]
	ldr r3, _0813D4D8
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #4
	bls _0813D4CA
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r7]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _0813D4CA
	subs r3, #1
	adds r1, r1, r3
	movs r0, #0
_0813D4C8:
	strb r0, [r1]
_0813D4CA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813D4D4: .4byte 0x00000616
_0813D4D8: .4byte 0x0000061F
	thumb_func_end DoAreaGlow

	thumb_func_start ShowPokedexAreaScreen
ShowPokedexAreaScreen: @ 0x0813D4DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r5, _0813D520
	ldr r0, _0813D524
	bl AllocZeroed
	str r0, [r5]
	movs r1, #0
	movs r5, #0
	strh r4, [r0, #0xe]
	movs r2, #0xdd
	lsls r2, r2, #3
	adds r0, r0, r2
	str r6, [r0]
	strb r1, [r6]
	ldr r0, _0813D528
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0813D52C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813D520: .4byte 0x0203A848
_0813D524: .4byte 0x000015BC
_0813D528: .4byte 0x0813D531
_0813D52C: .4byte 0x03005B60
	thumb_func_end ShowPokedexAreaScreen

	thumb_func_start Task_PokedexAreaScreen_0
Task_PokedexAreaScreen_0: @ 0x0813D530
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0813D558
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #0xb
	bls _0813D54E
	b _0813D688
_0813D54E:
	lsls r0, r0, #2
	ldr r1, _0813D55C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813D558: .4byte 0x03005B60
_0813D55C: .4byte 0x0813D560
_0813D560: @ jump table
	.4byte _0813D590 @ case 0
	.4byte _0813D5AC @ case 1
	.4byte _0813D5D8 @ case 2
	.4byte _0813D5EA @ case 3
	.4byte _0813D5F0 @ case 4
	.4byte _0813D5FC @ case 5
	.4byte _0813D624 @ case 6
	.4byte _0813D62A @ case 7
	.4byte _0813D630 @ case 8
	.4byte _0813D636 @ case 9
	.4byte _0813D648 @ case 10
	.4byte _0813D670 @ case 11
_0813D590:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, #3
	bl HideBg
	movs r0, #2
	bl HideBg
	movs r0, #0
	bl HideBg
	b _0813D688
_0813D5AC:
	movs r0, #3
	movs r1, #1
	movs r2, #3
	bl SetBgAttribute
	ldr r0, _0813D5D0
	bl sub_081C4578
	ldr r0, _0813D5D4
	ldr r0, [r0]
	movs r1, #0xf7
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0xa
	bl StringFill
	b _0813D688
	.align 2, 0
_0813D5D0: .4byte 0x085939A0
_0813D5D4: .4byte 0x0203A848
_0813D5D8:
	bl sub_081C4698
	cmp r0, #1
	beq _0813D698
	movs r0, #8
	rsbs r0, r0, #0
	bl sub_081C46D8
	b _0813D688
_0813D5EA:
	bl ResetDrawAreaGlowState
	b _0813D688
_0813D5F0:
	bl DrawAreaGlow
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0813D698
	b _0813D688
_0813D5FC:
	ldr r0, _0813D61C
	ldr r0, [r0]
	ldr r2, _0813D620
	adds r0, r0, r2
	bl sub_08122D94
	movs r0, #1
	movs r1, #1
	bl CreateRegionMapPlayerIcon
	movs r1, #8
	rsbs r1, r1, #0
	movs r0, #0
	bl PokedexAreaScreen_UpdateRegionMapVariablesAndVideoRegs
	b _0813D688
	.align 2, 0
_0813D61C: .4byte 0x0203A848
_0813D620: .4byte 0x000006EC
_0813D624:
	bl CreateAreaMarkerSprites
	b _0813D688
_0813D62A:
	bl LoadAreaUnknownGraphics
	b _0813D688
_0813D630:
	bl CreateAreaUnknownSprites
	b _0813D688
_0813D636:
	movs r0, #0x15
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _0813D688
_0813D648:
	ldr r1, _0813D66C
	movs r0, #0x50
	bl SetGpuReg
	bl StartAreaGlow
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuRegBits
	b _0813D688
	.align 2, 0
_0813D66C: .4byte 0x00003F41
_0813D670:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _0813D684
	str r1, [r0]
	movs r1, #0
	strh r1, [r0, #8]
	b _0813D698
	.align 2, 0
_0813D684: .4byte 0x0813D6A5
_0813D688:
	ldr r0, _0813D6A0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0813D698:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D6A0: .4byte 0x03005B60
	thumb_func_end Task_PokedexAreaScreen_0

	thumb_func_start Task_PokedexAreaScreen_1
Task_PokedexAreaScreen_1: @ 0x0813D6A4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl DoAreaGlow
	ldr r1, _0813D6CC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r6, r0, r1
	movs r0, #8
	ldrsh r1, [r6, r0]
	cmp r1, #1
	beq _0813D6FC
	cmp r1, #1
	bgt _0813D6D0
	cmp r1, #0
	beq _0813D6E6
	b _0813D6D8
	.align 2, 0
_0813D6CC: .4byte 0x03005B60
_0813D6D0:
	cmp r1, #2
	beq _0813D744
	cmp r1, #3
	beq _0813D756
_0813D6D8:
	ldr r0, _0813D6F4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #8]
_0813D6E6:
	ldr r0, _0813D6F8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0813D7AC
	b _0813D79C
	.align 2, 0
_0813D6F4: .4byte 0x03005B60
_0813D6F8: .4byte 0x02037C74
_0813D6FC:
	ldr r0, _0813D714
	ldrh r2, [r0, #0x2e]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _0813D718
	strh r1, [r6, #0xa]
	movs r0, #3
	bl PlaySE
	b _0813D79C
	.align 2, 0
_0813D714: .4byte 0x03002360
_0813D718:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0813D734
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0813D7AC
	ldr r0, _0813D740
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #1
	bne _0813D7AC
_0813D734:
	strh r3, [r6, #0xa]
	movs r0, #0x6d
	bl PlaySE
	b _0813D79C
	.align 2, 0
_0813D740: .4byte 0x03005AF0
_0813D744:
	movs r0, #0x15
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _0813D79C
_0813D756:
	ldr r0, _0813D794
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	bne _0813D7AC
	bl DestroyAreaMarkerSprites
	ldr r4, _0813D798
	ldr r0, [r4]
	movs r1, #0xdd
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r6, #0xa]
	strb r0, [r1]
	bl sub_0813D7B8
	adds r0, r5, #0
	bl DestroyTask
	bl sub_081C46BC
	ldr r0, [r4]
	bl Free
	str r7, [r4]
	b _0813D7AC
	.align 2, 0
_0813D794: .4byte 0x02037C74
_0813D798: .4byte 0x0203A848
_0813D79C:
	ldr r0, _0813D7B4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0813D7AC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813D7B4: .4byte 0x03005B60
	thumb_func_end Task_PokedexAreaScreen_1

	thumb_func_start sub_0813D7B8
sub_0813D7B8: @ 0x0813D7B8
	push {lr}
	movs r0, #3
	movs r1, #1
	movs r2, #0
	bl SetBgAttribute
	movs r0, #3
	movs r1, #4
	movs r2, #0
	bl SetBgAttribute
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0813D7B8

	thumb_func_start CreateAreaMarkerSprites
CreateAreaMarkerSprites: @ 0x0813D7D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0813D8FC
	bl LoadSpriteSheet
	ldr r0, _0813D900
	bl LoadSpritePalette
	ldr r0, _0813D904
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0813D908
	strh r1, [r2]
	ldr r1, _0813D90C
	ldr r0, [r1]
	movs r3, #0x89
	lsls r3, r3, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, #0
	beq _0813D8DC
	ldr r5, _0813D910
	mov sl, r1
	adds r7, r2, #0
	ldr r0, _0813D914
	mov sb, r0
	ldr r6, _0813D918
	ldr r1, _0813D91C
	mov r8, r1
_0813D814:
	mov r2, sl
	ldr r1, [r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	lsls r0, r0, #1
	movs r2, #0xc4
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrb r1, [r0]
	adds r1, #1
	lsls r1, r1, #3
	adds r1, #4
	mov r0, sb
	strh r1, [r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrb r2, [r0, #1]
	lsls r2, r2, #3
	adds r2, #0x1c
	mov r3, r8
	strh r2, [r3]
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrb r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrb r0, [r0, #3]
	subs r0, #1
	lsls r0, r0, #2
	adds r2, r2, r0
	mov r3, r8
	strh r2, [r3]
	mov r0, sb
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r3, r0]
	ldr r0, _0813D920
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _0813D8C2
	ldr r0, _0813D924
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	mov r1, sl
	ldr r3, [r1]
	ldr r4, _0813D904
	ldrh r1, [r4]
	adds r0, r1, #1
	strh r0, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xe
	movs r0, #0xcc
	lsls r0, r0, #3
	adds r3, r3, r0
	adds r3, r3, r1
	str r2, [r3]
_0813D8C2:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	movs r2, #0
	ldrsh r1, [r7, r2]
	mov r3, sl
	ldr r0, [r3]
	movs r2, #0x89
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r1, r0
	blt _0813D814
_0813D8DC:
	ldr r0, _0813D90C
	ldr r0, [r0]
	ldr r1, _0813D904
	ldrh r1, [r1]
	movs r3, #0xdc
	lsls r3, r3, #3
	adds r0, r0, r3
	strh r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813D8FC: .4byte 0x085939A4
_0813D900: .4byte 0x085939AC
_0813D904: .4byte 0x03001204
_0813D908: .4byte 0x03001200
_0813D90C: .4byte 0x0203A848
_0813D910: .4byte 0x03001202
_0813D914: .4byte 0x030011FC
_0813D918: .4byte 0x0857CD6C
_0813D91C: .4byte 0x030011FE
_0813D920: .4byte 0x085939BC
_0813D924: .4byte 0x020205AC
	thumb_func_end CreateAreaMarkerSprites

	thumb_func_start DestroyAreaMarkerSprites
DestroyAreaMarkerSprites: @ 0x0813D928
	push {r4, r5, lr}
	movs r0, #2
	bl FreeSpriteTilesByTag
	movs r0, #2
	bl FreeSpritePaletteByTag
	movs r4, #0
	ldr r1, _0813D9A8
	ldr r0, [r1]
	movs r2, #0xdc
	lsls r2, r2, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r4, r0
	bhs _0813D970
	adds r5, r1, #0
_0813D94A:
	ldr r0, [r5]
	lsls r1, r4, #2
	movs r2, #0xcc
	lsls r2, r2, #3
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5]
	movs r1, #0xdc
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	blo _0813D94A
_0813D970:
	movs r0, #3
	bl FreeSpriteTilesByTag
	movs r0, #3
	bl FreeSpritePaletteByTag
	movs r4, #0
_0813D97E:
	ldr r0, _0813D9A8
	ldr r0, [r0]
	lsls r1, r4, #2
	movs r2, #0xfb
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0813D996
	bl DestroySprite
_0813D996:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #2
	bls _0813D97E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813D9A8: .4byte 0x0203A848
	thumb_func_end DestroyAreaMarkerSprites

	thumb_func_start LoadAreaUnknownGraphics
LoadAreaUnknownGraphics: @ 0x0813D9AC
	push {lr}
	sub sp, #8
	ldr r0, _0813D9D8
	ldr r1, [r0]
	ldr r0, _0813D9DC
	adds r1, r1, r0
	str r1, [sp]
	ldr r0, _0813D9E0
	str r0, [sp, #4]
	ldr r0, _0813D9E4
	bl LZ77UnCompWram
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _0813D9E8
	bl LoadSpritePalette
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_0813D9D8: .4byte 0x0203A848
_0813D9DC: .4byte 0x00000FBC
_0813D9E0: .4byte 0x00030600
_0813D9E4: .4byte 0x08593ABC
_0813D9E8: .4byte 0x08593A74
	thumb_func_end LoadAreaUnknownGraphics

	thumb_func_start CreateAreaUnknownSprites
CreateAreaUnknownSprites: @ 0x0813D9EC
	push {r4, r5, r6, lr}
	ldr r1, _0813DA20
	ldr r0, [r1]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _0813DA24
	movs r4, #0
	adds r5, r1, #0
	movs r3, #0xfb
	lsls r3, r3, #4
	movs r2, #0
_0813DA08:
	ldr r0, [r5]
	lsls r1, r4, #2
	adds r0, r0, r3
	adds r0, r0, r1
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #2
	bls _0813DA08
	b _0813DAA8
	.align 2, 0
_0813DA20: .4byte 0x0203A848
_0813DA24:
	movs r4, #0
	ldr r5, _0813DA78
_0813DA28:
	lsls r1, r4, #0x15
	movs r6, #0xa0
	lsls r6, r6, #0x10
	adds r1, r1, r6
	asrs r1, r1, #0x10
	ldr r0, _0813DA7C
	movs r2, #0x8c
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0813DA8C
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r3, r3, r5
	ldrh r2, [r3, #4]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x16
	lsls r1, r4, #4
	adds r0, r0, r1
	ldr r6, _0813DA80
	adds r1, r6, #0
	ands r0, r1
	ldr r6, _0813DA84
	adds r1, r6, #0
	ands r2, r1
	orrs r2, r0
	strh r2, [r3, #4]
	ldr r0, _0813DA88
	ldr r0, [r0]
	lsls r1, r4, #2
	movs r2, #0xfb
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r1
	str r3, [r0]
	b _0813DA9E
	.align 2, 0
_0813DA78: .4byte 0x020205AC
_0813DA7C: .4byte 0x08593A84
_0813DA80: .4byte 0x000003FF
_0813DA84: .4byte 0xFFFFFC00
_0813DA88: .4byte 0x0203A848
_0813DA8C:
	ldr r0, _0813DAB0
	ldr r1, [r0]
	lsls r0, r4, #2
	movs r6, #0xfb
	lsls r6, r6, #4
	adds r1, r1, r6
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_0813DA9E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #2
	bls _0813DA28
_0813DAA8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813DAB0: .4byte 0x0203A848
	thumb_func_end CreateAreaUnknownSprites

	thumb_func_start sub_0813DAB4
sub_0813DAB4: @ 0x0813DAB4
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0813DAB4

	thumb_func_start sub_0813DAC4
sub_0813DAC4: @ 0x0813DAC4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r7, #0
	ldr r1, _0813DAE8
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r6, r0, r1
	movs r1, #8
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _0813DAEC
	cmp r0, #1
	beq _0813DB04
	b _0813DB34
	.align 2, 0
_0813DAE8: .4byte 0x03005B60
_0813DAEC:
	movs r0, #1
	rsbs r0, r0, #0
	str r7, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	b _0813DB34
_0813DB04:
	ldr r0, _0813DB3C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0813DB34
	movs r0, #0x1c
	ldrsh r1, [r6, r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0813DB40
	adds r7, r1, r0
	ldrh r4, [r6, #0xc]
	ldrb r5, [r6, #0xe]
	ldrb r6, [r6, #0x1c]
	adds r0, r2, #0
	bl DestroyTask
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl EvolutionScene
_0813DB34:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813DB3C: .4byte 0x02037C74
_0813DB40: .4byte 0x02024190
	thumb_func_end sub_0813DAC4

