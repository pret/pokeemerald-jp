.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CalcWordPitch
CalcWordPitch: @ 0x0817C69C
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0
	strh r3, [r0, #0x16]
	subs r1, #1
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r3, [r0, #0x1c]
	bx lr
	.align 2, 0
	thumb_func_end CalcWordPitch

	thumb_func_start GetWordPhonemes
GetWordPhonemes: @ 0x0817C6B0
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0817C6E0
	lsls r0, r1, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1]
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r2, #2
	rsbs r2, r2, #0
	cmp r1, r2
	bne _0817C6E8
	ldr r0, _0817C6E4
	bl m4aMPlayStop
	b _0817C6F0
	.align 2, 0
_0817C6E0: .4byte 0x085D2B4C
_0817C6E4: .4byte 0x03007510
_0817C6E8:
	cmp r1, r2
	blt _0817C6F8
	cmp r1, #0
	bgt _0817C6F8
_0817C6F0:
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	b _0817C6FC
_0817C6F8:
	bl m4aSongNumStart
_0817C6FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetWordPhonemes

	thumb_func_start GetWordSounds
GetWordSounds: @ 0x0817C704
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x1c
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _0817C716
	movs r0, #0
	strh r0, [r6, #0x1c]
	b _0817C74E
_0817C716:
	ldr r4, _0817C75C
	ldr r5, _0817C760
	ldrh r2, [r6, #0x14]
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayVolumeControl
	ldr r2, _0817C764
	movs r3, #0x18
	ldrsh r1, [r6, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	movs r3, #0x1a
	ldrsh r1, [r6, r3]
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	movs r2, #0x16
	ldrsh r0, [r6, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPitchControl
_0817C74E:
	ldrh r0, [r6, #0x16]
	adds r0, #1
	strh r0, [r6, #0x16]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817C75C: .4byte 0x03007510
_0817C760: .4byte 0x0000FFFF
_0817C764: .4byte 0x085D2AC0
	thumb_func_end GetWordSounds

