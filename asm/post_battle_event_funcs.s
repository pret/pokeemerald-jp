.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GameClear
GameClear: @ 0x081377A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	bl HealPlayerParty
	ldr r4, _081377C8
	adds r0, r4, #0
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _081377D0
	ldr r0, _081377CC
	strb r1, [r0]
	b _081377DC
	.align 2, 0
_081377C8: .4byte 0x00000864
_081377CC: .4byte 0x0203B9B0
_081377D0:
	ldr r1, _08137814
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl FlagSet
_081377DC:
	movs r0, #1
	bl GetGameStat
	cmp r0, #0
	bne _081377FE
	ldr r0, _08137818
	ldr r2, [r0]
	ldrh r1, [r2, #0xe]
	lsls r1, r1, #0x10
	ldrb r0, [r2, #0x10]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #0x11]
	orrs r1, r0
	movs r0, #1
	bl SetGameStat
_081377FE:
	bl SetContinueGameWarpStatus
	ldr r0, _08137818
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0813781C
	movs r0, #1
	bl SetContinueGameWarpToHealLocation
	b _08137822
	.align 2, 0
_08137814: .4byte 0x0203B9B0
_08137818: .4byte 0x03005AF0
_0813781C:
	movs r0, #2
	bl SetContinueGameWarpToHealLocation
_08137822:
	movs r7, #0
	movs r6, #0
	add r0, sp, #0x18
	mov r8, r0
	mov r5, sp
_0813782C:
	movs r0, #0x64
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _081378E0
	adds r4, r1, r0
	movs r0, #0
	strb r6, [r5]
	strb r0, [r5, #1]
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _0813787A
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _0813787A
	adds r0, r4, #0
	movs r1, #0x43
	bl GetMonData
	cmp r0, #0
	bne _0813787A
	movs r0, #1
	mov r1, r8
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x43
	add r2, sp, #0x18
	bl SetMonData
	adds r0, r4, #0
	bl GetRibbonCount
	strb r0, [r5, #1]
	movs r7, #1
_0813787A:
	adds r5, #4
	adds r6, #1
	cmp r6, #5
	ble _0813782C
	cmp r7, #1
	bne _081378CA
	movs r0, #0x2a
	bl IncrementGameStat
	ldr r0, _081378E4
	bl FlagSet
	mov r3, sp
	add r2, sp, #4
	movs r6, #4
_08137898:
	ldrb r1, [r3, #1]
	ldrb r0, [r2, #1]
	cmp r0, r1
	bls _081378A8
	ldr r1, [sp]
	ldr r0, [r2]
	str r0, [sp]
	str r1, [r2]
_081378A8:
	adds r2, #4
	subs r6, #1
	cmp r6, #0
	bge _08137898
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r0, #4
	bls _081378CA
	mov r0, sp
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081378E0
	adds r0, r0, r1
	movs r1, #0x43
	bl sub_080EEFFC
_081378CA:
	ldr r0, _081378E8
	bl SetMainCallback2
	movs r0, #0
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081378E0: .4byte 0x02024190
_081378E4: .4byte 0x0000089B
_081378E8: .4byte 0x08173479
	thumb_func_end GameClear

	thumb_func_start sp0C8_whiteout_maybe
sp0C8_whiteout_maybe: @ 0x081378EC
	push {lr}
	ldr r0, _081378FC
	bl SetMainCallback2
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081378FC: .4byte 0x080858C1
	thumb_func_end sp0C8_whiteout_maybe

