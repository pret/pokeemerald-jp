.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetHealLocationIndexByMap
GetHealLocationIndexByMap: @ 0x08122C68
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0
	ldr r2, _08122C8C
_08122C76:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, r4
	bne _08122C90
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r0, r1
	bne _08122C90
	adds r0, r3, #1
	b _08122C9A
	.align 2, 0
_08122C8C: .4byte 0x0857B10C
_08122C90:
	adds r2, #8
	adds r3, #1
	cmp r3, #0x15
	bls _08122C76
	movs r0, #0
_08122C9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetHealLocationIndexByMap

	thumb_func_start GetHealLocationByMap
GetHealLocationByMap: @ 0x08122CA0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl GetHealLocationIndexByMap
	cmp r0, #0
	beq _08122CC0
	lsls r0, r0, #3
	ldr r1, _08122CBC
	adds r0, r0, r1
	b _08122CC2
	.align 2, 0
_08122CBC: .4byte 0x0857B104
_08122CC0:
	movs r0, #0
_08122CC2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetHealLocationByMap

	thumb_func_start GetHealLocation
GetHealLocation: @ 0x08122CC8
	push {lr}
	cmp r0, #0
	beq _08122CE0
	cmp r0, #0x16
	bhi _08122CE0
	lsls r0, r0, #3
	ldr r1, _08122CDC
	adds r0, r0, r1
	b _08122CE2
	.align 2, 0
_08122CDC: .4byte 0x0857B104
_08122CE0:
	movs r0, #0
_08122CE2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetHealLocation

