.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start IsCurMapInLocationList
IsCurMapInLocationList: @ 0x081AF95C
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _081AF98C
	ldr r0, [r0]
	movs r1, #4
	ldrsb r1, [r0, r1]
	lsls r1, r1, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r2]
	ldr r1, _081AF990
	cmp r0, r1
	beq _081AF99C
	adds r4, r1, #0
	adds r1, r2, #0
_081AF982:
	ldrh r0, [r1]
	cmp r0, r3
	bne _081AF994
	movs r0, #1
	b _081AF99E
	.align 2, 0
_081AF98C: .4byte 0x03005AEC
_081AF990: .4byte 0x0000FFFF
_081AF994:
	adds r1, #2
	ldrh r0, [r1]
	cmp r0, r4
	bne _081AF982
_081AF99C:
	movs r0, #0
_081AF99E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsCurMapInLocationList

	thumb_func_start IsCurMapPokeCenter
IsCurMapPokeCenter: @ 0x081AF9A4
	push {lr}
	ldr r0, _081AF9B0
	bl IsCurMapInLocationList
	pop {r1}
	bx r1
	.align 2, 0
_081AF9B0: .4byte 0x085DFC74
	thumb_func_end IsCurMapPokeCenter

	thumb_func_start IsCurMapReloadLocation
IsCurMapReloadLocation: @ 0x081AF9B4
	push {lr}
	ldr r0, _081AF9C0
	bl IsCurMapInLocationList
	pop {r1}
	bx r1
	.align 2, 0
_081AF9C0: .4byte 0x085DFCC2
	thumb_func_end IsCurMapReloadLocation

	thumb_func_start sub_081AF9C4
sub_081AF9C4: @ 0x081AF9C4
	push {lr}
	ldr r0, _081AF9D0
	bl IsCurMapInLocationList
	pop {r1}
	bx r1
	.align 2, 0
_081AF9D0: .4byte 0x085DFCC6
	thumb_func_end sub_081AF9C4

	thumb_func_start TrySetPokeCenterWarpStatus
TrySetPokeCenterWarpStatus: @ 0x081AF9D4
	push {lr}
	bl IsCurMapPokeCenter
	cmp r0, #0
	bne _081AF9F0
	ldr r0, _081AF9EC
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #0xfd
	ands r0, r1
	b _081AF9FA
	.align 2, 0
_081AF9EC: .4byte 0x03005AF0
_081AF9F0:
	ldr r0, _081AFA00
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #2
	orrs r0, r1
_081AF9FA:
	strb r0, [r2, #9]
	pop {r0}
	bx r0
	.align 2, 0
_081AFA00: .4byte 0x03005AF0
	thumb_func_end TrySetPokeCenterWarpStatus

	thumb_func_start TrySetReloadWarpStatus
TrySetReloadWarpStatus: @ 0x081AFA04
	push {lr}
	bl IsCurMapReloadLocation
	cmp r0, #0
	bne _081AFA20
	ldr r0, _081AFA1C
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #0xfb
	ands r0, r1
	b _081AFA2A
	.align 2, 0
_081AFA1C: .4byte 0x03005AF0
_081AFA20:
	ldr r0, _081AFA30
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #4
	orrs r0, r1
_081AFA2A:
	strb r0, [r2, #9]
	pop {r0}
	bx r0
	.align 2, 0
_081AFA30: .4byte 0x03005AF0
	thumb_func_end TrySetReloadWarpStatus

	thumb_func_start sub_081AFA34
sub_081AFA34: @ 0x081AFA34
	push {lr}
	bl sub_081AF9C4
	cmp r0, #0
	bne _081AFA50
	ldr r0, _081AFA4C
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #0xf7
	ands r0, r1
	b _081AFA5A
	.align 2, 0
_081AFA4C: .4byte 0x03005AF0
_081AFA50:
	ldr r0, _081AFA60
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #8
	orrs r0, r1
_081AFA5A:
	strb r0, [r2, #9]
	pop {r0}
	bx r0
	.align 2, 0
_081AFA60: .4byte 0x03005AF0
	thumb_func_end sub_081AFA34

	thumb_func_start TrySetMapSaveWarpStatus
TrySetMapSaveWarpStatus: @ 0x081AFA64
	push {lr}
	bl TrySetPokeCenterWarpStatus
	bl TrySetReloadWarpStatus
	bl sub_081AFA34
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TrySetMapSaveWarpStatus

	thumb_func_start sub_081AFA78
sub_081AFA78: @ 0x081AFA78
	ldr r0, _081AFAA4
	ldr r2, [r0]
	adds r2, #0xa8
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_081AFAA4: .4byte 0x03005AF0
	thumb_func_end sub_081AFA78

	thumb_func_start sub_081AFAA8
sub_081AFAA8: @ 0x081AFAA8
	ldr r0, _081AFAB8
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2, #9]
	bx lr
	.align 2, 0
_081AFAB8: .4byte 0x03005AF0
	thumb_func_end sub_081AFAA8

