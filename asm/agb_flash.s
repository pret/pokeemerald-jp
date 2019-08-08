    .include "asm/macros.inc"
    .include "constants/constants.inc"
	.text
    .syntax unified

	thumb_func_start SwitchFlashBank
SwitchFlashBank: @ 0x0828FDE4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0828FE00
	movs r1, #0xaa
	strb r1, [r3]
	ldr r2, _0828FE04
	movs r1, #0x55
	strb r1, [r2]
	movs r1, #0xb0
	strb r1, [r3]
	movs r1, #0xe0
	lsls r1, r1, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0828FE00: .4byte 0x0E005555
_0828FE04: .4byte 0x0E002AAA
	thumb_func_end SwitchFlashBank

	thumb_func_start ReadFlashId
ReadFlashId: @ 0x0828FE08
	push {r4, r5, lr}
	sub sp, #0x44
	mov r0, sp
	bl SetReadFlash1
	mov r5, sp
	adds r5, #1
	ldr r2, _0828FE30
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _0828FE34
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0x90
	strb r0, [r2]
	add r1, sp, #0x40
	ldr r2, _0828FE38
	adds r0, r2, #0
	b _0828FE40
	.align 2, 0
_0828FE30: .4byte 0x0E005555
_0828FE34: .4byte 0x0E002AAA
_0828FE38: .4byte 0x00004E20
_0828FE3C:
	ldrh r0, [r1]
	subs r0, #1
_0828FE40:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _0828FE3C
	ldr r0, _0828FE7C
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0x14
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r4, r0
	ldr r1, _0828FE80
	movs r0, #0xaa
	strb r0, [r1]
	ldr r2, _0828FE84
	movs r0, #0x55
	strb r0, [r2]
	movs r0, #0xf0
	strb r0, [r1]
	strb r0, [r1]
	add r1, sp, #0x40
	ldr r2, _0828FE88
	adds r0, r2, #0
	b _0828FE90
	.align 2, 0
_0828FE7C: .4byte 0x0E000001
_0828FE80: .4byte 0x0E005555
_0828FE84: .4byte 0x0E002AAA
_0828FE88: .4byte 0x00004E20
_0828FE8C:
	ldrh r0, [r1]
	subs r0, #1
_0828FE90:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _0828FE8C
	adds r0, r4, #0
	add sp, #0x44
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ReadFlashId

	thumb_func_start FlashTimerIntr
FlashTimerIntr: @ 0x0828FEA4
	push {lr}
	ldr r1, _0828FEC4
	ldrh r0, [r1]
	cmp r0, #0
	beq _0828FEC0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0828FEC0
	ldr r1, _0828FEC8
	movs r0, #1
	strb r0, [r1]
_0828FEC0:
	pop {r0}
	bx r0
	.align 2, 0
_0828FEC4: .4byte gUnknown_3001A6A
_0828FEC8: .4byte gUnknown_30075E0
	thumb_func_end FlashTimerIntr

	thumb_func_start SetFlashTimerIntr
SetFlashTimerIntr: @ 0x0828FECC
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _0828FF00
	ldr r0, _0828FEF0
	strb r1, [r0]
	ldr r1, _0828FEF4
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r3, _0828FEF8
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _0828FEFC
	str r0, [r2]
	movs r0, #0
	b _0828FF02
	.align 2, 0
_0828FEF0: .4byte gUnknown_3001A68
_0828FEF4: .4byte gUnknown_3001A6C
_0828FEF8: .4byte 0x04000100
_0828FEFC: .4byte FlashTimerIntr
_0828FF00:
	movs r0, #1
_0828FF02:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SetFlashTimerIntr

	thumb_func_start StartFlashTimer
StartFlashTimer: @ 0x0828FF08
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0828FF8C
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, [r1]
	adds r2, r2, r0
	ldr r1, _0828FF90
	ldr r0, _0828FF94
	mov sb, r0
	ldrh r0, [r0]
	strh r0, [r1]
	movs r3, #0
	mov r1, sb
	strh r3, [r1]
	ldr r0, _0828FF98
	mov r8, r0
	ldr r4, [r0]
	strh r3, [r4, #2]
	ldr r6, _0828FF9C
	ldr r1, _0828FFA0
	mov sl, r1
	ldrb r1, [r1]
	movs r5, #8
	adds r0, r5, #0
	lsls r0, r1
	adds r1, r0, #0
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	ldr r0, _0828FFA4
	strb r3, [r0]
	ldr r1, _0828FFA8
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	ldrh r0, [r2]
	strh r0, [r4]
	adds r0, r4, #2
	mov r1, r8
	str r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	str r4, [r1]
	ldr r1, _0828FFAC
	mov r2, sl
	ldrb r0, [r2]
	lsls r5, r0
	strh r5, [r1]
	movs r0, #1
	mov r3, sb
	strh r0, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0828FF8C: .4byte gUnknown_3007604
_0828FF90: .4byte gUnknown_3001A70
_0828FF94: .4byte 0x04000208
_0828FF98: .4byte gUnknown_3001A6C
_0828FF9C: .4byte 0x04000200
_0828FFA0: .4byte gUnknown_3001A68
_0828FFA4: .4byte gUnknown_30075E0
_0828FFA8: .4byte gUnknown_3001A6A
_0828FFAC: .4byte 0x04000202
	thumb_func_end StartFlashTimer

	thumb_func_start StopFlashTimer
StopFlashTimer: @ 0x0828FFB0
	ldr r3, _0828FFE0
	movs r1, #0
	strh r1, [r3]
	ldr r2, _0828FFE4
	ldr r0, [r2]
	strh r1, [r0]
	adds r0, #2
	str r0, [r2]
	strh r1, [r0]
	subs r0, #2
	str r0, [r2]
	ldr r2, _0828FFE8
	ldr r0, _0828FFEC
	ldrb r0, [r0]
	movs r1, #8
	lsls r1, r0
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	ldr r0, _0828FFF0
	ldrh r0, [r0]
	strh r0, [r3]
	bx lr
	.align 2, 0
_0828FFE0: .4byte 0x04000208
_0828FFE4: .4byte gUnknown_3001A6C
_0828FFE8: .4byte 0x04000200
_0828FFEC: .4byte gUnknown_3001A68
_0828FFF0: .4byte gUnknown_3001A70
	thumb_func_end StopFlashTimer

	thumb_func_start ReadFlash1
ReadFlash1: @ 0x0828FFF4
	ldrb r0, [r0]
	bx lr
	thumb_func_end ReadFlash1

	thumb_func_start SetReadFlash1
SetReadFlash1: @ 0x0828FFF8
	push {lr}
	adds r2, r0, #0
	ldr r1, _08290014
	adds r0, r2, #1
	str r0, [r1]
	ldr r3, _08290018
	movs r0, #1
	eors r3, r0
	ldr r0, _0829001C
	ldr r1, _08290018
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _0829002C
	.align 2, 0
_08290014: .4byte gUnknown_30075E4
_08290018: .4byte ReadFlash1
_0829001C: .4byte SetReadFlash1
_08290020:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_0829002C:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08290020
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetReadFlash1

	thumb_func_start ReadFlash_Core
ReadFlash_Core: @ 0x08290038
	push {r4, lr}
	adds r4, r0, #0
	subs r3, r2, #1
	cmp r2, #0
	beq _08290054
	movs r2, #1
	rsbs r2, r2, #0
_08290046:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #1
	adds r1, #1
	subs r3, #1
	cmp r3, r2
	bne _08290046
_08290054:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ReadFlash_Core

	thumb_func_start ReadFlash
ReadFlash: @ 0x0829005C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x80
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	lsls r3, r0, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _082900A8
	ldrh r0, [r2]
	ldr r1, _082900AC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _082900B0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _08290094
	lsrs r0, r3, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SwitchFlashBank
	movs r0, #0xf
	ands r4, r0
_08290094:
	ldr r3, _082900B4
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _082900B8
	ldr r1, _082900B4
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _082900C8
	.align 2, 0
_082900A8: .4byte 0x04000204
_082900AC: .4byte 0x0000FFFC
_082900B0: .4byte gUnknown_30075F0
_082900B4: .4byte ReadFlash_Core
_082900B8: .4byte ReadFlash
_082900BC:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_082900C8:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _082900BC
	mov r3, sp
	adds r3, #1
	ldr r0, _082900F4
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r4, r0
	adds r0, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r5, r2
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl _call_via_r3
	add sp, #0x80
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_082900F4: .4byte gUnknown_30075F0
	thumb_func_end ReadFlash

	thumb_func_start VerifyFlashSector_Core
VerifyFlashSector_Core: @ 0x082900F8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	subs r4, r2, #1
	cmp r2, #0
	beq _0829011E
	movs r2, #1
	rsbs r2, r2, #0
_08290108:
	ldrb r1, [r3]
	ldrb r0, [r5]
	adds r5, #1
	adds r3, #1
	cmp r1, r0
	beq _08290118
	subs r0, r3, #1
	b _08290120
_08290118:
	subs r4, #1
	cmp r4, r2
	bne _08290108
_0829011E:
	movs r0, #0
_08290120:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end VerifyFlashSector_Core

	thumb_func_start VerifyFlashSector
VerifyFlashSector: @ 0x08290128
	push {r4, r5, lr}
	sub sp, #0x100
	adds r5, r1, #0
	lsls r3, r0, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _08290170
	ldrh r0, [r2]
	ldr r1, _08290174
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08290178
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _0829015C
	lsrs r0, r3, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SwitchFlashBank
	movs r0, #0xf
	ands r4, r0
_0829015C:
	ldr r3, _0829017C
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08290180
	ldr r1, _0829017C
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08290190
	.align 2, 0
_08290170: .4byte 0x04000204
_08290174: .4byte 0x0000FFFC
_08290178: .4byte gUnknown_30075F0
_0829017C: .4byte VerifyFlashSector_Core
_08290180: .4byte VerifyFlashSector
_08290184:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08290190:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08290184
	mov r3, sp
	adds r3, #1
	ldr r0, _082901BC
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r4, r1
	adds r1, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r1, r2
	ldrh r2, [r0, #4]
	adds r0, r5, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_082901BC: .4byte gUnknown_30075F0
	thumb_func_end VerifyFlashSector

	thumb_func_start VerifyFlashSectorNBytes
VerifyFlashSectorNBytes: @ 0x082901C0
	push {r4, r5, r6, lr}
	sub sp, #0x100
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r2, r0, #0x10
	lsrs r4, r2, #0x10
	ldr r0, _08290208
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _082901E8
	lsrs r0, r2, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SwitchFlashBank
	movs r0, #0xf
	ands r4, r0
_082901E8:
	ldr r2, _0829020C
	ldrh r0, [r2]
	ldr r1, _08290210
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _08290214
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08290218
	ldr r1, _08290214
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08290228
	.align 2, 0
_08290208: .4byte gUnknown_30075F0
_0829020C: .4byte 0x04000204
_08290210: .4byte 0x0000FFFC
_08290214: .4byte VerifyFlashSector_Core
_08290218: .4byte VerifyFlashSector
_0829021C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08290228:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0829021C
	mov r3, sp
	adds r3, #1
	ldr r0, _08290254
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r4, r1
	adds r1, r4, #0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r1, r1, r0
	adds r0, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08290254: .4byte gUnknown_30075F0
	thumb_func_end VerifyFlashSectorNBytes

	thumb_func_start ProgramFlashSectorAndVerify
ProgramFlashSectorAndVerify: @ 0x08290258
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _0829026A
_08290264:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0829026A:
	cmp r6, #2
	bhi _08290290
	ldr r0, _08290298
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08290264
	adds r0, r4, #0
	adds r1, r5, #0
	bl VerifyFlashSector
	adds r2, r0, #0
	cmp r2, #0
	bne _08290264
_08290290:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08290298: .4byte gUnknown_30075EC
	thumb_func_end ProgramFlashSectorAndVerify

	thumb_func_start ProgramFlashSectorAndVerifyNBytes
ProgramFlashSectorAndVerifyNBytes: @ 0x0829029C
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _082902B0
_082902AA:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_082902B0:
	cmp r6, #2
	bhi _082902D8
	ldr r0, _082902E0
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _082902AA
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl VerifyFlashSectorNBytes
	adds r3, r0, #0
	cmp r3, #0
	bne _082902AA
_082902D8:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_082902E0: .4byte gUnknown_30075EC
	thumb_func_end ProgramFlashSectorAndVerifyNBytes

	thumb_func_start IdentifyFlash
IdentifyFlash: @ 0x082902E4
	push {r4, lr}
	ldr r2, _08290304
	ldrh r0, [r2]
	ldr r1, _08290308
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	bl ReadFlashId
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _0829030C
	movs r4, #1
	b _08290312
	.align 2, 0
_08290304: .4byte 0x04000204
_08290308: .4byte 0x0000FFFC
_0829030C: .4byte gUnknown_890ED54
_08290310:
	adds r2, #4
_08290312:
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	beq _08290326
	ldrh r0, [r1, #0x2c]
	cmp r3, r0
	bne _08290310
	movs r4, #0
_08290326:
	ldr r1, _08290368
	ldr r0, [r2]
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _0829036C
	ldr r0, [r2]
	ldr r0, [r0, #4]
	str r0, [r1]
	ldr r1, _08290370
	ldr r0, [r2]
	ldr r0, [r0, #8]
	str r0, [r1]
	ldr r1, _08290374
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	str r0, [r1]
	ldr r1, _08290378
	ldr r0, [r2]
	ldr r0, [r0, #0x10]
	str r0, [r1]
	ldr r1, _0829037C
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	str r0, [r1]
	ldr r1, _08290380
	ldr r0, [r2]
	adds r0, #0x18
	str r0, [r1]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08290368: .4byte gUnknown_30075F4
_0829036C: .4byte gUnknown_30075EC
_08290370: .4byte gUnknown_30075FC
_08290374: .4byte gUnknown_3007600
_08290378: .4byte gUnknown_30075E8
_0829037C: .4byte gUnknown_3007604
_08290380: .4byte gUnknown_30075F0
	thumb_func_end IdentifyFlash

	thumb_func_start WaitForFlashWrite_Common
WaitForFlashWrite_Common: @ 0x08290384
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r0, #0
	mov r8, r0
	adds r0, r7, #0
	bl StartFlashTimer
	ldr r6, _082903A8
	ldr r1, _082903AC
	mov sb, r1
	b _082903E8
	.align 2, 0
_082903A8: .4byte gUnknown_30075E4
_082903AC: .4byte 0x0E005555
_082903B0:
	movs r0, #0xf0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #8
	b _082903DE
_082903BC:
	ldr r0, _082903E4
	ldrb r0, [r0]
	cmp r0, #0
	beq _082903E8
	ldr r1, [r6]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	beq _08290410
	movs r0, #0xf0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #8
_082903DE:
	orrs r7, r0
	mov r8, r7
	b _08290410
	.align 2, 0
_082903E4: .4byte gUnknown_30075E0
_082903E8:
	ldr r1, [r6]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r5
	beq _08290410
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _082903BC
	ldr r1, [r6]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bne _082903B0
_08290410:
	bl StopFlashTimer
	mov r0, r8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WaitForFlashWrite_Common

	thumb_func_start EraseFlashChip_MX
EraseFlashChip_MX: @ 0x08290424
	push {r4, r5, r6, lr}
	sub sp, #0x40
	ldr r5, _08290480
	ldrh r1, [r5]
	ldr r6, _08290484
	ands r1, r6
	ldr r0, _08290488
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	orrs r1, r0
	strh r1, [r5]
	ldr r1, _0829048C
	movs r4, #0xaa
	strb r4, [r1]
	ldr r3, _08290490
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r4, [r1]
	strb r2, [r3]
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sp
	bl SetReadFlash1
	ldr r0, _08290494
	movs r1, #0xe0
	lsls r1, r1, #0x14
	ldr r3, [r0]
	movs r0, #3
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5]
	ands r1, r6
	movs r2, #3
	orrs r1, r2
	strh r1, [r5]
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08290480: .4byte 0x04000204
_08290484: .4byte 0x0000FFFC
_08290488: .4byte gUnknown_30075F0
_0829048C: .4byte 0x0E005555
_08290490: .4byte 0x0E002AAA
_08290494: .4byte gUnknown_30075E8
	thumb_func_end EraseFlashChip_MX

	thumb_func_start EraseFlashSector_MX
EraseFlashSector_MX: @ 0x08290498
	push {r4, r5, r6, r7, lr}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _082904B0
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	cmp r6, r0
	blo _082904B8
	ldr r0, _082904B4
	b _08290558
	.align 2, 0
_082904B0: .4byte gUnknown_30075F0
_082904B4: .4byte 0x000080FF
_082904B8:
	lsrs r0, r6, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SwitchFlashBank
	movs r0, #0xf
	ands r6, r0
	movs r7, #0
_082904C8:
	ldr r3, _08290530
	ldrh r1, [r3]
	ldr r0, _08290534
	ands r1, r0
	ldr r0, _08290538
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldrb r4, [r2, #8]
	adds r0, r6, #0
	lsls r0, r4
	adds r4, r0, #0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r4, r4, r0
	ldr r1, _0829053C
	movs r5, #0xaa
	strb r5, [r1]
	ldr r3, _08290540
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r5, [r1]
	strb r2, [r3]
	movs r0, #0x30
	strb r0, [r4]
	mov r0, sp
	bl SetReadFlash1
	ldr r0, _08290544
	ldr r3, [r0]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0xa0
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08290548
	cmp r7, #3
	bhi _08290548
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _082904C8
	.align 2, 0
_08290530: .4byte 0x04000204
_08290534: .4byte 0x0000FFFC
_08290538: .4byte gUnknown_30075F0
_0829053C: .4byte 0x0E005555
_08290540: .4byte 0x0E002AAA
_08290544: .4byte gUnknown_30075E8
_08290548:
	ldr r2, _08290560
	ldrh r0, [r2]
	ldr r1, _08290564
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	adds r0, r3, #0
_08290558:
	add sp, #0x40
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08290560: .4byte 0x04000204
_08290564: .4byte 0x0000FFFC
	thumb_func_end EraseFlashSector_MX

	thumb_func_start ProgramFlashByte_MX
ProgramFlashByte_MX: @ 0x08290568
	push {r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r6, r1, #0
	lsls r1, r0, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r5, _082905D8
	ldr r0, [r5]
	ldr r0, [r0, #4]
	cmp r6, r0
	bhs _082905F0
	lsrs r0, r1, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SwitchFlashBank
	movs r0, #0xf
	ldr r1, [r5]
	ands r4, r0
	ldrb r1, [r1, #8]
	lsls r4, r1
	movs r1, #0xe0
	lsls r1, r1, #0x14
	adds r0, r6, r1
	adds r4, r4, r0
	mov r0, sp
	bl SetReadFlash1
	ldr r2, _082905DC
	ldrh r0, [r2]
	ldr r1, _082905E0
	ands r0, r1
	ldr r1, [r5]
	ldrh r1, [r1, #0x10]
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _082905E4
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _082905E8
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0xa0
	strb r0, [r2]
	strb r7, [r4]
	ldr r0, _082905EC
	ldr r3, [r0]
	movs r0, #1
	adds r1, r4, #0
	adds r2, r7, #0
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _082905F4
	.align 2, 0
_082905D8: .4byte gUnknown_30075F0
_082905DC: .4byte 0x04000204
_082905E0: .4byte 0x0000FFFC
_082905E4: .4byte 0x0E005555
_082905E8: .4byte 0x0E002AAA
_082905EC: .4byte gUnknown_30075E8
_082905F0:
	movs r0, #0x80
	lsls r0, r0, #8
_082905F4:
	add sp, #0x40
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end ProgramFlashByte_MX

	thumb_func_start sub_082905FC
sub_082905FC: @ 0x082905FC
	push {r4, lr}
	ldr r4, _08290628
	movs r2, #0xaa
	strb r2, [r4]
	ldr r3, _0829062C
	movs r2, #0x55
	strb r2, [r3]
	movs r2, #0xa0
	strb r2, [r4]
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r3, _08290630
	ldrb r2, [r0]
	ldr r3, [r3]
	movs r0, #1
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08290628: .4byte 0x0E005555
_0829062C: .4byte 0x0E002AAA
_08290630: .4byte gUnknown_30075E8
	thumb_func_end sub_082905FC

	thumb_func_start ProgramFlashSector_MX
ProgramFlashSector_MX: @ 0x08290634
	push {r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0829064C
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	cmp r4, r0
	blo _08290654
	ldr r0, _08290650
	b _082906CE
	.align 2, 0
_0829064C: .4byte gUnknown_30075F0
_08290650: .4byte 0x000080FF
_08290654:
	adds r0, r4, #0
	bl EraseFlashSector_MX
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _082906CC
	lsrs r0, r4, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SwitchFlashBank
	movs r0, #0xf
	ands r4, r0
	mov r0, sp
	bl SetReadFlash1
	ldr r3, _0829069C
	ldrh r1, [r3]
	ldr r0, _082906A0
	ands r1, r0
	ldr r0, _082906A4
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _082906A8
	ldr r0, [r2, #4]
	strh r0, [r1]
	ldrb r0, [r2, #8]
	lsls r4, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r4, r4, r0
	adds r6, r1, #0
	b _082906B6
	.align 2, 0
_0829069C: .4byte 0x04000204
_082906A0: .4byte 0x0000FFFC
_082906A4: .4byte gUnknown_30075F0
_082906A8: .4byte gUnknown_30075F8
_082906AC:
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	adds r7, #1
	adds r4, #1
_082906B6:
	ldrh r0, [r6]
	cmp r0, #0
	beq _082906CC
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_082905FC
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _082906AC
_082906CC:
	adds r0, r5, #0
_082906CE:
	add sp, #0x40
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ProgramFlashSector_MX
