.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetLandmarkName
GetLandmarkName: @ 0x08145DB4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	bl GetLandmarks
	adds r4, r0, #0
	cmp r4, #0
	bne _08145DD0
_08145DCC:
	movs r0, #0
	b _08145E02
_08145DD0:
	ldr r6, _08145DD4
	b _08145DE6
	.align 2, 0
_08145DD4: .4byte 0x0000FFFF
_08145DD8:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08145DDE:
	adds r4, #4
	ldr r0, [r4]
	cmp r0, #0
	beq _08145DCC
_08145DE6:
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	cmp r0, r6
	beq _08145DFA
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08145DDE
_08145DFA:
	cmp r5, #0
	bne _08145DD8
	ldr r0, [r4]
	ldr r0, [r0]
_08145E02:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetLandmarkName

	thumb_func_start GetLandmarks
GetLandmarks: @ 0x08145E08
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r2, #0
	ldr r0, _08145E4C
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0xd5
	beq _08145E78
	adds r1, r4, #0
_08145E20:
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, r3
	bhi _08145E78
	cmp r0, r3
	beq _08145E3E
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xd5
	bne _08145E20
_08145E3E:
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xd5
	bne _08145E58
	b _08145E78
	.align 2, 0
_08145E4C: .4byte 0x08598C68
_08145E50:
	adds r0, r4, #4
	adds r0, r1, r0
	ldr r0, [r0]
	b _08145E7A
_08145E58:
	cmp r0, r3
	bne _08145E78
	ldr r5, _08145E80
_08145E5E:
	lsls r1, r2, #3
	adds r0, r1, r5
	ldrb r0, [r0, #1]
	cmp r0, r6
	beq _08145E50
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r2, #3
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _08145E5E
_08145E78:
	movs r0, #0
_08145E7A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08145E80: .4byte 0x08598C68
	thumb_func_end GetLandmarks

