.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CopyFriendsApprenticeChallengeText
CopyFriendsApprenticeChallengeText: @ 0x0819F888
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _0819F914
	ldr r1, [r2]
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xde
	ldrb r1, [r1]
	movs r6, #0
	adds r7, r2, #0
	ldr r0, _0819F918
	mov r8, r0
	cmp r1, #0
	beq _0819F8C8
_0819F8AE:
	adds r0, r1, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r1, #0
	beq _0819F8C8
	cmp r6, #3
	bls _0819F8AE
_0819F8C8:
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r1, [r7]
	adds r1, r4, r1
	movs r0, #0x8a
	lsls r0, r0, #1
	adds r1, r1, r0
	mov r0, r8
	bl StringCopy7
	ldr r0, _0819F91C
	ldr r1, [r7]
	adds r1, r1, r4
	adds r1, #0xde
	ldrb r1, [r1]
	movs r2, #1
	adds r3, r6, #0
	bl ConvertIntToDecimalStringN
	ldr r1, _0819F920
	ldr r0, [r7]
	adds r0, r0, r4
	adds r0, #0xdc
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0819F924
	bl StringExpandPlaceholders
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819F914: .4byte 0x03005AF0
_0819F918: .4byte 0x02021C40
_0819F91C: .4byte 0x02021C54
_0819F920: .4byte 0x085DC95C
_0819F924: .4byte 0x02021C7C
	thumb_func_end CopyFriendsApprenticeChallengeText

	thumb_func_start Apprentice_EnableBothScriptContexts
Apprentice_EnableBothScriptContexts: @ 0x0819F928
	push {lr}
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Apprentice_EnableBothScriptContexts

	thumb_func_start ResetApprenticeStruct
ResetApprenticeStruct: @ 0x0819F934
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r2, #0
	adds r4, r3, #0
	adds r4, #0x28
	ldr r0, _0819F974
	adds r5, r0, #0
_0819F942:
	lsls r0, r2, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	orrs r1, r5
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _0819F942
	adds r1, r3, #0
	adds r1, #0x38
	movs r0, #0xff
	strb r0, [r1]
	ldrb r1, [r3]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0819F974: .4byte 0x0000FFFF
	thumb_func_end ResetApprenticeStruct

	thumb_func_start ResetAllApprenticeData
ResetAllApprenticeData: @ 0x0819F978
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _0819FA78
	ldr r1, [r3]
	adds r1, #0xb2
	ldrb r2, [r1]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	movs r0, #0
	mov ip, r0
	adds r5, r3, #0
	mov r8, r0
	ldr r1, _0819FA7C
	mov sl, r1
_0819F99E:
	movs r2, #0
	mov r3, ip
	lsls r7, r3, #4
	movs r4, #1
	add r4, ip
	mov sb, r4
	adds r0, r7, r3
	lsls r3, r0, #2
_0819F9AE:
	ldr r1, [r5]
	lsls r0, r2, #1
	adds r0, r0, r3
	movs r4, #0x82
	lsls r4, r4, #1
	adds r1, r1, r4
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r4, sl
	orrs r0, r4
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bls _0819F9AE
	ldr r2, [r5]
	mov r0, ip
	adds r3, r7, r0
	lsls r3, r3, #2
	adds r2, r2, r3
	adds r2, #0xdc
	ldrb r1, [r2]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	adds r0, r0, r3
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, #0xdc
	ldrb r2, [r1]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r0, r3
	adds r0, #0xde
	mov r4, r8
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, r0, r3
	adds r0, #0xdd
	strb r4, [r0]
	movs r2, #0
	ldr r6, _0819FA78
	movs r4, #0x88
	lsls r4, r4, #1
_0819FA20:
	ldr r0, [r6]
	adds r1, r2, r3
	adds r0, r0, r4
	adds r0, r0, r1
	mov r1, r8
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0819FA20
	ldr r0, [r5]
	mov r3, ip
	adds r2, r7, r3
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r4, _0819FA80
	ldrb r1, [r4]
	ldr r3, _0819FA84
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r5]
	movs r4, #0x8e
	lsls r4, r4, #1
	adds r0, r0, r4
	adds r0, r0, r2
	mov r1, r8
	str r1, [r0]
	mov r3, sb
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #3
	bls _0819F99E
	bl Script_ResetPlayerApprentice
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819FA78: .4byte 0x03005AF0
_0819FA7C: .4byte 0x0000FFFF
_0819FA80: .4byte 0x0829BDA5
_0819FA84: .4byte 0x0000011B
	thumb_func_end ResetAllApprenticeData

	thumb_func_start IsPlayersApprenticeActive
IsPlayersApprenticeActive: @ 0x0819FA88
	ldr r0, _0819FA9C
	ldr r0, [r0]
	adds r0, #0xb1
	ldrb r0, [r0]
	movs r1, #3
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0819FA9C: .4byte 0x03005AF0
	thumb_func_end IsPlayersApprenticeActive

	thumb_func_start sub_0819FAA0
sub_0819FAA0: @ 0x0819FAA0
	push {r4, r5, lr}
	ldr r2, _0819FAE0
	ldr r0, [r2]
	adds r0, #0xde
	ldrb r0, [r0]
	cmp r0, #0
	bne _0819FAE8
	adds r4, r2, #0
	ldr r5, _0819FAE4
_0819FAB2:
	bl Random
	ldr r2, [r4]
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	lsrs r1, r1, #0x10
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r2, #0xb0
	strb r0, [r2]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xb0
	adds r0, #0xdc
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	ldrb r1, [r1]
	lsrs r0, r0, #0x1b
	cmp r1, r0
	beq _0819FAB2
	b _0819FB10
	.align 2, 0
_0819FAE0: .4byte 0x03005AF0
_0819FAE4: .4byte 0x085DCB74
_0819FAE8:
	adds r4, r2, #0
_0819FAEA:
	bl Random
	ldr r2, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf
	ands r0, r1
	adds r2, #0xb0
	strb r0, [r2]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xb0
	adds r0, #0xdc
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	ldrb r1, [r1]
	lsrs r0, r0, #0x1b
	cmp r1, r0
	beq _0819FAEA
_0819FB10:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0819FAA0

	thumb_func_start SetPlayersApprenticeLvlMode
SetPlayersApprenticeLvlMode: @ 0x0819FB18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0819FB34
	ldr r2, [r1]
	adds r2, #0xb1
	movs r1, #3
	ands r0, r1
	ldrb r3, [r2]
	subs r1, #7
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_0819FB34: .4byte 0x03005AF0
	thumb_func_end SetPlayersApprenticeLvlMode

	thumb_func_start sub_0819FB38
sub_0819FB38: @ 0x0819FB38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r5, #0
_0819FB3E:
	mov r1, sp
	adds r0, r1, r5
	strb r5, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _0819FB3E
	movs r5, #0
_0819FB50:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r7, sp
	adds r2, r7, r4
	ldrb r3, [r2]
	adds r1, r7, r0
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x31
	bls _0819FB50
	movs r5, #0
	ldr r6, _0819FBCC
	movs r4, #0xf
_0819FB94:
	ldr r3, [r6]
	adds r3, #0xb4
	adds r3, r3, r5
	lsls r2, r5, #1
	mov r1, sp
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #4
	adds r2, #1
	mov r7, sp
	adds r0, r7, r2
	ldrb r2, [r0]
	adds r0, r4, #0
	ands r0, r2
	orrs r1, r0
	strb r1, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0819FB94
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819FBCC: .4byte 0x03005AF0
	thumb_func_end sub_0819FB38

	thumb_func_start sub_0819FBD0
sub_0819FBD0: @ 0x0819FBD0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	cmp r0, #2
	bne _0819FC24
	ldr r6, _0819FC20
_0819FBDE:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r3, #0
	movs r2, #0
	ldr r1, [r6]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r4, r0, #1
	adds r1, #2
_0819FBFE:
	lsls r0, r2, #1
	adds r0, r0, r4
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _0819FC10
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0819FC10:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _0819FBFE
	cmp r3, #3
	bhi _0819FBDE
	b _0819FC32
	.align 2, 0
_0819FC20: .4byte 0x0300602C
_0819FC24:
	cmp r0, #1
	bne _0819FC32
	ldrb r0, [r2]
	adds r1, r1, r0
	ldrb r5, [r1]
	adds r0, #1
	strb r0, [r2]
_0819FC32:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0819FBD0

	thumb_func_start sub_0819FC3C
sub_0819FC3C: @ 0x0819FC3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	movs r5, #0
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x14]
	mov r1, sp
	adds r1, #0x10
	str r1, [sp, #0x18]
	adds r1, r0, #0
_0819FC58:
	adds r0, r1, r5
	strb r5, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0819FC58
	movs r5, #0
	ldr r6, [sp, #0x14]
_0819FC6A:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r6, r4
	ldrb r3, [r2]
	adds r1, r6, r0
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _0819FC6A
	movs r5, #0
	ldr r2, _0819FE64
_0819FCA8:
	mov r4, sp
	adds r1, r4, r5
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _0819FCA8
	movs r5, #0
_0819FCBE:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r6, sp
	adds r2, r6, r4
	ldrb r3, [r2]
	adds r1, r6, r0
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x31
	bls _0819FCBE
	ldr r4, _0819FE68
	movs r0, #0x30
	bl AllocZeroed
	str r0, [r4]
	movs r1, #0
	strb r1, [r0]
	movs r5, #0
	movs r2, #4
_0819FD0C:
	movs r3, #0
_0819FD0E:
	ldr r0, [r4]
	lsls r1, r3, #2
	adds r1, r1, r3
	adds r1, r5, r1
	adds r0, #0x20
	adds r0, r0, r1
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _0819FD0E
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _0819FD0C
	movs r0, #0
	ldr r7, [sp, #0x18]
	strb r0, [r7]
	movs r5, #0
_0819FD38:
	ldr r0, _0819FE6C
	ldr r3, [r0]
	lsls r4, r5, #2
	adds r3, r3, r4
	mov r1, sp
	adds r6, r1, r5
	ldrb r0, [r6]
	adds r3, #0xb8
	movs r2, #3
	ands r2, r0
	ldrb r0, [r3]
	movs r7, #4
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	ldrb r0, [r6]
	adds r5, #1
	str r5, [sp, #0x1c]
	mov r8, r4
	cmp r0, #3
	beq _0819FE3A
	ldrb r0, [r6]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	bl sub_0819FBD0
	ldr r1, _0819FE6C
	ldr r3, [r1]
	add r3, r8
	adds r3, #0xb8
	movs r2, #3
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r3]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	ldr r7, _0819FE6C
	ldr r0, [r7]
	add r0, r8
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r7, r0, #0x1e
	ldrb r0, [r6]
	cmp r0, #2
	bne _0819FE3A
	lsls r0, r7, #2
	adds r0, r0, r7
	mov sl, r0
	ldr r0, _0819FE68
	mov sb, r0
_0819FDAA:
	bl Random
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r1, #3
	ands r4, r1
	movs r3, #0
	mov r6, sb
	ldr r2, [r6]
	ldrb r0, [r2]
	adds r1, r0, #1
	lsls r5, r7, #2
	cmp r3, r1
	bge _0819FDEA
	adds r2, #0x20
	mov r6, sl
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r4
	beq _0819FDEA
	adds r6, r1, #0
	adds r1, r5, r7
_0819FDD6:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r6
	bge _0819FDEA
	adds r0, r3, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r4
	bne _0819FDD6
_0819FDEA:
	mov r1, sb
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r0, #1
	ldr r1, _0819FE68
	cmp r3, r0
	bne _0819FDAA
	ldr r0, [r1]
	orrs r5, r7
	ldrb r2, [r0]
	adds r1, r5, r2
	adds r0, #0x20
	adds r0, r0, r1
	strb r4, [r0]
	ldr r6, _0819FE6C
	ldr r2, [r6]
	add r2, r8
	adds r2, #0xb8
	movs r7, #3
	ands r4, r7
	lsls r3, r4, #4
	ldrb r0, [r2]
	movs r4, #0x31
	rsbs r4, r4, #0
	adds r1, r4, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldr r0, [r6]
	add r0, r8
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl sub_0819FE70
	ldr r1, [r6]
	add r1, r8
	adds r1, #0xba
	strh r0, [r1]
_0819FE3A:
	ldr r6, [sp, #0x1c]
	lsls r0, r6, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bhi _0819FE46
	b _0819FD38
_0819FE46:
	ldr r4, _0819FE68
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0819FE64: .4byte 0x085DCAFF
_0819FE68: .4byte 0x0300602C
_0819FE6C: .4byte 0x03005AF0
	thumb_func_end sub_0819FC3C

	thumb_func_start sub_0819FE70
sub_0819FE70: @ 0x0819FE70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r7, #0
	ldr r1, [sp]
	cmp r1, #2
	bhi _0819FEBC
	ldr r2, _0819FEB8
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0xb4
	ldr r3, [sp]
	adds r0, r0, r3
	ldrb r4, [r0]
	adds r1, #0xb2
	ldrb r0, [r1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	asrs r4, r0
	movs r0, #0xf
	ands r4, r0
	adds r0, r2, #0
	b _0819FEC0
	.align 2, 0
_0819FEB8: .4byte 0x03005AF0
_0819FEBC:
	movs r4, #0
	ldr r0, _0819FF80
_0819FEC0:
	ldr r3, _0819FF84
	lsls r2, r4, #1
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r3, #0xc
	adds r2, r2, r3
	ldrh r2, [r2]
	str r2, [sp, #8]
	ldr r1, _0819FF88
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r6, [r0]
	movs r3, #0
	adds r4, #0xb1
	ldrb r1, [r4]
	movs r0, #3
	ands r0, r1
	movs r5, #0x3c
	cmp r0, #1
	bne _0819FEF6
	movs r5, #0x32
_0819FEF6:
	ldrh r1, [r6]
	ldr r4, _0819FF8C
	cmp r1, r4
	beq _0819FF28
	movs r2, #0xfe
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r0, r1
	lsls r1, r5, #9
	cmp r0, r1
	bgt _0819FF28
	adds r5, r2, #0
	adds r2, r1, #0
_0819FF10:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	cmp r1, r4
	beq _0819FF28
	adds r0, r5, #0
	ands r0, r1
	cmp r0, r2
	ble _0819FF10
_0819FF28:
	adds r5, r3, #0
	movs r0, #0
	str r0, [sp, #4]
_0819FF2E:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0819FF44
	ldr r1, [sp, #0xc]
	cmp r1, #1
	bne _0819FFBC
_0819FF44:
	ldr r2, _0819FF90
	mov r8, r2
_0819FF48:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x3a
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl CanSpeciesLearnTMHM
	adds r2, r0, #0
	cmp r2, #0
	beq _0819FF48
	ldr r3, _0819FF94
	adds r0, r4, r3
	bl ItemIdToBattleMoveId
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r2, #1
	cmp r5, #4
	bhi _0819FF98
	movs r3, #0
	b _0819FFA2
	.align 2, 0
_0819FF80: .4byte 0x03005AF0
_0819FF84: .4byte 0x085DC21C
_0819FF88: .4byte 0x082F9D04
_0819FF8C: .4byte 0x0000FFFF
_0819FF90: .4byte 0x000001FF
_0819FF94: .4byte 0x00000121
_0819FF98:
	subs r0, r5, #4
	b _0819FF9E
_0819FF9C:
	adds r0, r3, #1
_0819FF9E:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0819FFA2:
	cmp r3, r5
	bhs _0819FFB6
	lsls r0, r3, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	mov r1, r8
	ands r0, r1
	cmp r0, r7
	bne _0819FF9C
	movs r2, #0
_0819FFB6:
	cmp r2, #1
	bne _0819FF48
	b _081A0022
_0819FFBC:
	cmp r5, #4
	bhi _0819FFC6
	movs r2, #1
	str r2, [sp, #0xc]
	b _081A0044
_0819FFC6:
	subs r4, r5, #4
	ldr r3, _081A0000
	mov sl, r3
	mov r8, r3
	lsls r0, r4, #0x18
	mov sb, r0
_0819FFD2:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r6
	ldrh r0, [r0]
	mov r7, r8
	ands r7, r0
	movs r2, #1
	mov r1, sb
	lsrs r3, r1, #0x18
	cmp r3, r5
	bhs _081A001E
	lsls r0, r3, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	mov r0, r8
	b _081A0016
	.align 2, 0
_081A0000: .4byte 0x000001FF
_081A0004:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r5
	bhs _081A001E
	lsls r0, r3, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	mov r1, sl
_081A0016:
	ands r0, r1
	cmp r0, r7
	bne _081A0004
	movs r2, #0
_081A001E:
	cmp r2, #1
	bne _0819FFD2
_081A0022:
	ldr r0, [sp]
	adds r1, r7, #0
	bl sub_081A0070
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081A0044
	ldr r0, _081A0068
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _081A004C
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
_081A0044:
	ldr r2, [sp, #4]
	cmp r2, #4
	bhi _081A004C
	b _0819FF2E
_081A004C:
	ldr r0, _081A006C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081A0068: .4byte 0x085DC99C
_081A006C: .4byte 0x0300602C
	thumb_func_end sub_0819FE70

	thumb_func_start sub_081A0070
sub_081A0070: @ 0x081A0070
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #0
	ldr r0, _081A009C
	mov ip, r0
	ldr r2, [r0]
	lsls r1, r4, #2
	adds r0, r1, r4
	lsls r6, r0, #1
	adds r2, #2
	adds r7, r1, #0
_081A008C:
	lsls r0, r3, #1
	adds r0, r0, r6
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, r5
	bne _081A00A0
	movs r0, #0
	b _081A00BE
	.align 2, 0
_081A009C: .4byte 0x0300602C
_081A00A0:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #4
	bls _081A008C
	mov r2, ip
	ldr r1, [r2]
	adds r0, r7, r4
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, #2
	adds r1, r1, r0
	strh r5, [r1]
	movs r0, #1
_081A00BE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081A0070

	thumb_func_start GetLatestLearnedMoves
GetLatestLearnedMoves: @ 0x081A00C4
	push {r4, r5, r6, r7, lr}
	mov ip, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _081A0150
	ldr r0, [r0]
	adds r0, #0xb1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r4, #0x3c
	cmp r0, #1
	bne _081A00E0
	movs r4, #0x32
_081A00E0:
	ldr r1, _081A0154
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r6, [r0]
	movs r5, #0
	ldrh r1, [r6]
	ldr r3, _081A0158
	cmp r1, r3
	beq _081A011C
	movs r2, #0xfe
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r0, r1
	lsls r1, r4, #9
	cmp r0, r1
	bgt _081A011C
	adds r4, r2, #0
	adds r2, r1, #0
_081A0104:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	cmp r1, r3
	beq _081A011C
	adds r0, r4, #0
	ands r0, r1
	cmp r0, r2
	ble _081A0104
_081A011C:
	adds r4, r5, #0
	cmp r4, #4
	bls _081A0124
	movs r4, #4
_081A0124:
	movs r2, #0
	cmp r2, r4
	bhs _081A0148
	ldr r7, _081A015C
_081A012C:
	lsls r3, r2, #1
	add r3, ip
	adds r2, #1
	subs r0, r5, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	strh r0, [r3]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, r4
	blo _081A012C
_081A0148:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A0150: .4byte 0x03005AF0
_081A0154: .4byte 0x082F9D04
_081A0158: .4byte 0x0000FFFF
_081A015C: .4byte 0x000001FF
	thumb_func_end GetLatestLearnedMoves

	thumb_func_start sub_081A0160
sub_081A0160: @ 0x081A0160
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r1, _081A0190
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	adds r7, r1, #0
	cmp r0, #2
	bhi _081A0194
	movs r0, #0
	b _081A025A
	.align 2, 0
_081A0190: .4byte 0x03005AF0
_081A0194:
	movs r4, #0
	movs r3, #0
	adds r0, r2, #0
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	ldr r1, _081A0268
	mov ip, r1
	lsls r6, r6, #1
	lsls r5, r5, #1
	mov sb, r5
	cmp r0, #0
	beq _081A01D0
	adds r2, r7, #0
_081A01B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bhi _081A01D0
	ldr r0, [r2]
	lsls r1, r3, #2
	adds r0, r0, r1
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bne _081A01B0
_081A01D0:
	ldr r0, [r7]
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r6, r0
	mov r1, ip
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r1, sp
	bl GetLatestLearnedMoves
	movs r3, #0
	cmp r3, r4
	bhs _081A0254
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	cmp r3, r0
	bge _081A0254
	adds r6, r7, #0
	adds r5, r1, #0
_081A0208:
	lsls r0, r3, #2
	adds r2, r5, r0
	adds r0, r2, #0
	adds r0, #0xb8
	ldrb r1, [r0]
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _081A023A
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, r8
	bne _081A023A
	lsrs r0, r1, #6
	cmp r0, #0
	beq _081A023A
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #1
	mov r7, sp
	adds r1, r7, r0
	adds r0, r2, #0
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
_081A023A:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	bhs _081A0254
	ldr r0, [r6]
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	cmp r3, r0
	blt _081A0208
_081A0254:
	mov r0, sp
	add r0, sb
	ldrh r0, [r0]
_081A025A:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081A0268: .4byte 0x085DC21C
	thumb_func_end sub_081A0160

	thumb_func_start sub_081A026C
sub_081A026C: @ 0x081A026C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	ldr r7, _081A0380
	adds r6, r7, #0
	movs r4, #0
_081A0282:
	ldr r0, [r6]
	lsls r2, r5, #1
	adds r2, r2, r5
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r1, r0, #0
	adds r1, #0xe0
	strh r4, [r1]
	adds r0, #0xea
	strh r4, [r0]
	movs r3, #0
_081A0298:
	ldr r0, [r6]
	lsls r1, r3, #1
	adds r1, r1, r2
	adds r0, #0xe2
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _081A0298
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _081A0282
	ldr r0, [r7]
	adds r0, #0xb1
	ldrb r0, [r0]
	lsrs r3, r0, #6
	movs r5, #0
_081A02C2:
	lsls r0, r3, #2
	mov r1, sp
	adds r2, r1, r0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0xe0
	ldr r1, [r7]
	adds r1, r1, r0
	str r1, [r2]
	adds r0, r3, #1
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _081A02C2
	movs r5, #0
	ldr r7, _081A0380
	ldr r6, _081A0384
_081A02F2:
	ldr r0, [r7]
	mov ip, r0
	adds r0, #0xb4
	adds r0, r0, r5
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #0xb2
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	asrs r2, r0
	movs r0, #0xf
	ands r2, r0
	lsls r0, r5, #2
	mov r1, sp
	adds r3, r1, r0
	ldr r4, [r3]
	lsls r2, r2, #1
	mov r0, ip
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r2, r6
	ldrh r0, [r2]
	strh r0, [r4]
	ldr r1, [r3]
	ldrh r0, [r1]
	adds r1, #2
	bl GetLatestLearnedMoves
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _081A02F2
	movs r5, #0
	cmp r5, r8
	bhs _081A03B6
	ldr r7, _081A0380
_081A034E:
	ldr r1, [r7]
	lsls r0, r5, #2
	adds r4, r1, r0
	adds r0, r4, #0
	adds r0, #0xb8
	ldrb r2, [r0]
	lsls r0, r2, #0x1e
	lsrs r1, r0, #0x1e
	lsls r0, r2, #0x1c
	lsrs r3, r0, #0x1e
	adds r6, r3, #0
	cmp r1, #1
	bne _081A0388
	lsrs r0, r2, #6
	cmp r0, #0
	beq _081A03AC
	lsls r0, r3, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	b _081A03AC
	.align 2, 0
_081A0380: .4byte 0x03005AF0
_081A0384: .4byte 0x085DC228
_081A0388:
	cmp r1, #2
	bne _081A03AC
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _081A03AC
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1e
	lsls r0, r6, #2
	add r0, sp
	ldr r1, [r0]
	lsls r2, r2, #1
	adds r1, #2
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
_081A03AC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r8
	blo _081A034E
_081A03B6:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A026C

	thumb_func_start CreateMenuWithAnswers
CreateMenuWithAnswers: @ 0x081A03C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r7, #2
	cmp r0, #6
	bls _081A03DC
	b _081A054C
_081A03DC:
	lsls r0, r0, #2
	ldr r1, _081A03E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A03E8: .4byte 0x081A03EC
_081A03EC: @ jump table
	.4byte _081A0408 @ case 0
	.4byte _081A0424 @ case 1
	.4byte _081A04A0 @ case 2
	.4byte _081A04E8 @ case 3
	.4byte _081A0514 @ case 4
	.4byte _081A054C @ case 5
	.4byte _081A0530 @ case 6
_081A0408:
	movs r0, #0x12
	mov sl, r0
	movs r5, #8
	movs r1, #8
	str r1, [sp, #0x18]
	ldr r0, _081A041C
	str r0, [sp, #0xc]
	ldr r0, _081A0420
	str r0, [sp, #0x10]
	b _081A0556
	.align 2, 0
_081A041C: .4byte 0x085CAB0D
_081A0420: .4byte 0x085CAB13
_081A0424:
	movs r7, #3
	movs r0, #0x12
	mov sl, r0
	movs r5, #6
	movs r1, #8
	str r1, [sp, #0x18]
	movs r4, #0
	ldr r0, _081A0494
	mov sb, r0
	ldr r0, _081A0498
	ldr r3, [r0]
	movs r1, #0xb2
	adds r1, r1, r3
	mov ip, r1
	adds r6, r3, #0
	adds r6, #0xb0
	ldr r0, _081A049C
	mov r8, r0
_081A0448:
	adds r0, r3, #0
	adds r0, #0xb4
	adds r0, r0, r4
	ldrb r2, [r0]
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	asrs r2, r0
	movs r0, #0xf
	ands r2, r0
	lsls r2, r2, #1
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	add r2, r8
	ldrh r1, [r2]
	lsls r0, r4, #2
	mov r2, sp
	adds r2, r2, r0
	adds r2, #0xc
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	str r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081A0448
	b _081A0556
	.align 2, 0
_081A0494: .4byte 0x082EA31C
_081A0498: .4byte 0x03005AF0
_081A049C: .4byte 0x085DC228
_081A04A0:
	movs r0, #0x12
	mov sl, r0
	movs r5, #8
	movs r1, #8
	str r1, [sp, #0x18]
	ldr r0, _081A04DC
	ldr r0, [r0]
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #2
	bls _081A04BC
	b _081A05C2
_081A04BC:
	ldr r0, _081A04E0
	ldr r3, [r0]
	ldrh r1, [r3, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _081A04E4
	adds r0, r0, r2
	str r0, [sp, #0x10]
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	str r0, [sp, #0xc]
	b _081A0556
	.align 2, 0
_081A04DC: .4byte 0x03005AF0
_081A04E0: .4byte 0x03006030
_081A04E4: .4byte 0x082EA31C
_081A04E8:
	movs r0, #0x11
	mov sl, r0
	movs r5, #8
	movs r1, #8
	str r1, [sp, #0x18]
	ldr r0, _081A050C
	ldr r2, [r0]
	ldrh r0, [r2, #4]
	lsls r0, r0, #3
	ldr r1, _081A0510
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldrh r0, [r2, #6]
	lsls r0, r0, #3
	adds r0, r0, r1
	str r0, [sp, #0x10]
	b _081A0556
	.align 2, 0
_081A050C: .4byte 0x03006030
_081A0510: .4byte 0x082EACC4
_081A0514:
	movs r0, #0x12
	mov sl, r0
	movs r5, #8
	movs r1, #8
	str r1, [sp, #0x18]
	ldr r0, _081A0528
	str r0, [sp, #0xc]
	ldr r0, _081A052C
	str r0, [sp, #0x10]
	b _081A0556
	.align 2, 0
_081A0528: .4byte 0x085CC47F
_081A052C: .4byte 0x085CC486
_081A0530:
	movs r0, #0x14
	mov sl, r0
	movs r5, #8
	movs r1, #4
	str r1, [sp, #0x18]
	ldr r0, _081A0544
	str r0, [sp, #0xc]
	ldr r0, _081A0548
	str r0, [sp, #0x10]
	b _081A0556
	.align 2, 0
_081A0544: .4byte 0x085CAAD8
_081A0548: .4byte 0x085CAADB
_081A054C:
	movs r0, #0
	mov sl, r0
	movs r5, #0
	movs r1, #8
	str r1, [sp, #0x18]
_081A0556:
	lsls r3, r7, #1
	mov r0, sl
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl CreateAndShowWindow
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	movs r1, #0
	bl SetStandardWindowBorderStyle
	movs r4, #0
	cmp r4, r7
	bhs _081A05A2
_081A0574:
	lsls r0, r4, #2
	add r0, sp
	adds r0, #0xc
	ldr r2, [r0]
	lsls r0, r4, #4
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _081A0574
_081A05A2:
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	bl CreateChooseAnswerTask
_081A05C2:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateMenuWithAnswers

	thumb_func_start Task_ChooseAnswer
Task_ChooseAnswer: @ 0x081A05D4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081A05F4
	adds r4, r0, r1
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081A05F8
	bl Menu_ProcessInputNoWrap
	b _081A05FC
	.align 2, 0
_081A05F4: .4byte 0x03005B68
_081A05F8:
	bl Menu_ProcessInput
_081A05FC:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081A0640
	adds r0, #1
	cmp r1, r0
	bne _081A062C
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081A0640
	movs r0, #5
	bl PlaySE
	ldr r1, _081A0628
	movs r0, #0x7f
	strh r0, [r1]
	b _081A0630
	.align 2, 0
_081A0628: .4byte 0x02037290
_081A062C:
	ldr r0, _081A0648
	strh r1, [r0]
_081A0630:
	ldrb r0, [r4, #0xc]
	bl RemoveAndHideWindow
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_081A0640:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A0648: .4byte 0x02037290
	thumb_func_end Task_ChooseAnswer

	thumb_func_start CreateAndShowWindow
CreateAndShowWindow: @ 0x081A064C
	push {r4, r5, lr}
	sub sp, #0x20
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsls r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r4, r4, r0
	lsrs r4, r4, #0x18
	adds r5, r5, r0
	lsrs r5, r5, #0x18
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x5c
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl CreateWindowTemplate
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	add r0, sp, #0x18
	bl AddWindow
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	adds r0, r4, #0
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CreateAndShowWindow

	thumb_func_start RemoveAndHideWindow
RemoveAndHideWindow: @ 0x081A06B0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl ClearStdWindowAndFrameToTransparent
	adds r0, r4, #0
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RemoveAndHideWindow

	thumb_func_start CreateChooseAnswerTask
CreateChooseAnswerTask: @ 0x081A06CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _081A0700
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _081A0704
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r1
	strh r4, [r1, #0x10]
	cmp r5, #3
	bls _081A0708
	movs r0, #1
	b _081A070A
	.align 2, 0
_081A0700: .4byte 0x081A05D5
_081A0704: .4byte 0x03005B60
_081A0708:
	movs r0, #0
_081A070A:
	strh r0, [r1, #0x12]
	ldr r1, _081A0720
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #0x14]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081A0720: .4byte 0x03005B60
	thumb_func_end CreateChooseAnswerTask

	thumb_func_start CallApprenticeFunction
CallApprenticeFunction: @ 0x081A0724
	push {lr}
	ldr r1, _081A073C
	ldr r0, _081A0740
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end CallApprenticeFunction

	thumb_func_start sub_081A0738
sub_081A0738: @ 0x081A0738
	bx r0
	.align 2, 0
_081A073C: .4byte 0x085DCB0C
_081A0740: .4byte 0x02037280
	thumb_func_end sub_081A0738

	thumb_func_start Script_ResetPlayerApprentice
Script_ResetPlayerApprentice: @ 0x081A0744
	push {r4, r5, r6, r7, lr}
	bl sub_0819FAA0
	ldr r3, _081A0800
	ldr r1, [r3]
	adds r1, #0xb1
	ldrb r2, [r1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, #0xb1
	ldrb r2, [r1]
	movs r0, #0x3d
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, #0xb1
	ldrb r2, [r1]
	movs r0, #0x3f
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, #0xb2
	ldrb r2, [r1]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	movs r4, #0
	movs r1, #0
_081A0786:
	ldr r0, [r3]
	adds r0, #0xb4
	adds r0, r0, r4
	strb r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _081A0786
	movs r4, #0
	ldr r5, _081A0800
	movs r0, #4
	rsbs r0, r0, #0
	mov ip, r0
	movs r7, #0xd
	rsbs r7, r7, #0
	movs r6, #0x31
	rsbs r6, r6, #0
_081A07AA:
	ldr r1, [r5]
	lsls r3, r4, #2
	adds r1, r1, r3
	adds r1, #0xb8
	ldrb r2, [r1]
	mov r0, ip
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, #0xb8
	ldrb r2, [r1]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, #0xb8
	ldrb r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, #0xb8
	ldrb r2, [r1]
	movs r0, #0x3f
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r0, r3
	adds r0, #0xba
	movs r1, #0
	strh r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	bls _081A07AA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A0800: .4byte 0x03005AF0
	thumb_func_end Script_ResetPlayerApprentice

	thumb_func_start Script_IsPlayersApprenticeActive
Script_IsPlayersApprenticeActive: @ 0x081A0804
	push {lr}
	bl IsPlayersApprenticeActive
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _081A081C
	ldr r0, _081A0818
	strh r1, [r0]
	b _081A0822
	.align 2, 0
_081A0818: .4byte 0x02037290
_081A081C:
	ldr r1, _081A0828
	movs r0, #1
	strh r0, [r1]
_081A0822:
	pop {r0}
	bx r0
	.align 2, 0
_081A0828: .4byte 0x02037290
	thumb_func_end Script_IsPlayersApprenticeActive

	thumb_func_start Script_CreateApprenticeMenu
Script_CreateApprenticeMenu: @ 0x081A082C
	push {lr}
	ldr r0, _081A083C
	ldrb r0, [r0]
	bl SetPlayersApprenticeLvlMode
	pop {r0}
	bx r0
	.align 2, 0
_081A083C: .4byte 0x02037282
	thumb_func_end Script_CreateApprenticeMenu

	thumb_func_start sub_081A0840
sub_081A0840: @ 0x081A0840
	push {lr}
	bl sub_0819FAA0
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A0840

	thumb_func_start sub_081A084C
sub_081A084C: @ 0x081A084C
	push {lr}
	bl sub_0819FC3C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A084C

	thumb_func_start sub_081A0858
sub_081A0858: @ 0x081A0858
	ldr r0, _081A0878
	ldr r2, [r0]
	adds r2, #0xb1
	ldrb r3, [r2]
	lsls r1, r3, #0x1a
	lsrs r1, r1, #0x1c
	adds r1, #1
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0x3d
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_081A0878: .4byte 0x03005AF0
	thumb_func_end sub_081A0858

	thumb_func_start sub_081A087C
sub_081A087C: @ 0x081A087C
	ldr r1, _081A0890
	ldr r0, _081A0894
	ldr r0, [r0]
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	strh r0, [r1]
	bx lr
	.align 2, 0
_081A0890: .4byte 0x02037290
_081A0894: .4byte 0x03005AF0
	thumb_func_end sub_081A087C

	thumb_func_start sub_081A0898
sub_081A0898: @ 0x081A0898
	push {lr}
	ldr r3, _081A08B4
	ldr r0, [r3]
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r1, r0, #3
	cmp r1, #0
	bge _081A08BC
	ldr r1, _081A08B8
	movs r0, #0
	strh r0, [r1]
	b _081A08E4
	.align 2, 0
_081A08B4: .4byte 0x03005AF0
_081A08B8: .4byte 0x02037290
_081A08BC:
	ldr r2, _081A08DC
	cmp r1, #8
	ble _081A08C6
	movs r0, #1
	strh r0, [r2]
_081A08C6:
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bne _081A08E0
	movs r0, #1
	b _081A08E2
	.align 2, 0
_081A08DC: .4byte 0x02037290
_081A08E0:
	movs r0, #0
_081A08E2:
	strh r0, [r2]
_081A08E4:
	pop {r0}
	bx r0
	thumb_func_end sub_081A0898

	thumb_func_start Script_SetPlayersApprenticeLvlMode
Script_SetPlayersApprenticeLvlMode: @ 0x081A08E8
	push {lr}
	ldr r0, _081A08F8
	ldrb r0, [r0]
	bl CreateMenuWithAnswers
	pop {r0}
	bx r0
	.align 2, 0
_081A08F8: .4byte 0x02037282
	thumb_func_end Script_SetPlayersApprenticeLvlMode

	thumb_func_start Task_WaitForPrintingMessage
Task_WaitForPrintingMessage: @ 0x081A08FC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl RunTextPrintersAndIsPrinter0Active
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081A0930
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _081A0924
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A092C
	ldr r0, _081A0928
	bl ExecuteFuncAfterButtonPress
	b _081A0930
	.align 2, 0
_081A0924: .4byte 0x02037282
_081A0928: .4byte 0x080988C5
_081A092C:
	bl EnableBothScriptContexts
_081A0930:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_WaitForPrintingMessage

	thumb_func_start PrintMessage
PrintMessage: @ 0x081A0938
	push {lr}
	ldr r1, _081A0950
	ldrh r0, [r1]
	cmp r0, #6
	bne _081A095C
	ldr r1, _081A0954
	ldr r0, _081A0958
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #3
	b _081A0B2E
	.align 2, 0
_081A0950: .4byte 0x02037284
_081A0954: .4byte 0x085DC61C
_081A0958: .4byte 0x03005AF0
_081A095C:
	cmp r0, #7
	bne _081A0978
	ldr r1, _081A0970
	ldr r0, _081A0974
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	b _081A0B2E
	.align 2, 0
_081A0970: .4byte 0x085DC61C
_081A0974: .4byte 0x03005AF0
_081A0978:
	cmp r0, #8
	bne _081A0994
	ldr r1, _081A098C
	ldr r0, _081A0990
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #3
	b _081A0B2E
	.align 2, 0
_081A098C: .4byte 0x085DC7DC
_081A0990: .4byte 0x03005AF0
_081A0994:
	cmp r0, #9
	bne _081A09B0
	ldr r1, _081A09A8
	ldr r0, _081A09AC
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	b _081A0B2E
	.align 2, 0
_081A09A8: .4byte 0x085DC7DC
_081A09AC: .4byte 0x03005AF0
_081A09B0:
	cmp r0, #4
	bne _081A09CC
	ldr r1, _081A09C4
	ldr r0, _081A09C8
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #3
	b _081A0B2E
	.align 2, 0
_081A09C4: .4byte 0x085DC85C
_081A09C8: .4byte 0x03005AF0
_081A09CC:
	cmp r0, #5
	bne _081A09E8
	ldr r1, _081A09E0
	ldr r0, _081A09E4
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	b _081A0B2E
	.align 2, 0
_081A09E0: .4byte 0x085DC85C
_081A09E4: .4byte 0x03005AF0
_081A09E8:
	cmp r0, #0xa
	bne _081A0A08
	ldr r2, _081A0A00
	ldr r0, _081A0A04
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	b _081A0A9E
	.align 2, 0
_081A0A00: .4byte 0x085DC69C
_081A0A04: .4byte 0x03005AF0
_081A0A08:
	cmp r0, #0xb
	bne _081A0A24
	ldr r1, _081A0A1C
	ldr r0, _081A0A20
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #3
	b _081A0B2E
	.align 2, 0
_081A0A1C: .4byte 0x085DC8DC
_081A0A20: .4byte 0x03005AF0
_081A0A24:
	cmp r0, #0xc
	bne _081A0A44
	ldr r2, _081A0A3C
	ldr r0, _081A0A40
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0xc
	b _081A0A9E
	.align 2, 0
_081A0A3C: .4byte 0x085DC69C
_081A0A40: .4byte 0x03005AF0
_081A0A44:
	cmp r0, #0xd
	bne _081A0A64
	ldr r2, _081A0A5C
	ldr r0, _081A0A60
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #4
	b _081A0A9E
	.align 2, 0
_081A0A5C: .4byte 0x085DC69C
_081A0A60: .4byte 0x03005AF0
_081A0A64:
	ldrh r0, [r1]
	cmp r0, #0x10
	bne _081A0A88
	ldr r2, _081A0A80
	ldr r0, _081A0A84
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x10
	b _081A0A9E
	.align 2, 0
_081A0A80: .4byte 0x085DC69C
_081A0A84: .4byte 0x03005AF0
_081A0A88:
	cmp r0, #0xe
	bne _081A0AAC
	ldr r2, _081A0AA4
	ldr r0, _081A0AA8
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
_081A0A9E:
	adds r0, r0, r2
	ldr r1, [r0]
	b _081A0B42
	.align 2, 0
_081A0AA4: .4byte 0x085DC69C
_081A0AA8: .4byte 0x03005AF0
_081A0AAC:
	cmp r0, #0xf
	bne _081A0AC8
	ldr r1, _081A0AC0
	ldr r0, _081A0AC4
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, #4
	b _081A0B2E
	.align 2, 0
_081A0AC0: .4byte 0x085DC8DC
_081A0AC4: .4byte 0x03005AF0
_081A0AC8:
	cmp r0, #0
	bne _081A0AE4
	ldr r1, _081A0ADC
	ldr r0, _081A0AE0
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #4
	b _081A0B2E
	.align 2, 0
_081A0ADC: .4byte 0x085DC51C
_081A0AE0: .4byte 0x03005AF0
_081A0AE4:
	cmp r0, #1
	bne _081A0B00
	ldr r1, _081A0AF8
	ldr r0, _081A0AFC
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, #4
	b _081A0B2E
	.align 2, 0
_081A0AF8: .4byte 0x085DC51C
_081A0AFC: .4byte 0x03005AF0
_081A0B00:
	cmp r0, #2
	bne _081A0B1C
	ldr r1, _081A0B14
	ldr r0, _081A0B18
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, #8
	b _081A0B2E
	.align 2, 0
_081A0B14: .4byte 0x085DC51C
_081A0B18: .4byte 0x03005AF0
_081A0B1C:
	cmp r0, #3
	bne _081A0B3C
	ldr r1, _081A0B34
	ldr r0, _081A0B38
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, #0xc
_081A0B2E:
	adds r0, r0, r1
	ldr r1, [r0]
	b _081A0B42
	.align 2, 0
_081A0B34: .4byte 0x085DC51C
_081A0B38: .4byte 0x03005AF0
_081A0B3C:
	bl EnableBothScriptContexts
	b _081A0B56
_081A0B42:
	ldr r0, _081A0B5C
	bl StringExpandPlaceholders
	movs r0, #1
	bl AddTextPrinterForMessage
	ldr r0, _081A0B60
	movs r1, #1
	bl CreateTask
_081A0B56:
	pop {r0}
	bx r0
	.align 2, 0
_081A0B5C: .4byte 0x02021C7C
_081A0B60: .4byte 0x081A08FD
	thumb_func_end PrintMessage

	thumb_func_start Script_PrintMessage
Script_PrintMessage: @ 0x081A0B64
	push {lr}
	bl ScriptContext2_Enable
	bl FreezeEventObjects
	bl sub_0808B1C8
	bl sub_0808B658
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrame
	bl PrintMessage
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Script_PrintMessage

	thumb_func_start sub_081A0B88
sub_081A0B88: @ 0x081A0B88
	push {lr}
	ldr r0, _081A0BA4
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r1, r0, #0x1a
	lsrs r0, r1, #0x1c
	cmp r0, #2
	bhi _081A0BAC
	ldr r1, _081A0BA8
	movs r0, #2
	b _081A0BFC
	.align 2, 0
_081A0BA4: .4byte 0x03005AF0
_081A0BA8: .4byte 0x02037290
_081A0BAC:
	lsrs r0, r1, #0x1c
	cmp r0, #0xb
	bhi _081A0BF8
	lsrs r0, r1, #0x1c
	subs r0, #3
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	beq _081A0BE0
	cmp r0, #2
	bgt _081A0BD0
	cmp r0, #1
	beq _081A0BD6
	b _081A0BF8
_081A0BD0:
	cmp r0, #3
	beq _081A0BEC
	b _081A0BF8
_081A0BD6:
	ldr r1, _081A0BDC
	movs r0, #4
	b _081A0BFC
	.align 2, 0
_081A0BDC: .4byte 0x02037290
_081A0BE0:
	ldr r1, _081A0BE8
	movs r0, #3
	b _081A0BFC
	.align 2, 0
_081A0BE8: .4byte 0x02037290
_081A0BEC:
	ldr r1, _081A0BF4
	movs r0, #1
	b _081A0BFC
	.align 2, 0
_081A0BF4: .4byte 0x02037290
_081A0BF8:
	ldr r1, _081A0C04
	movs r0, #5
_081A0BFC:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081A0C04: .4byte 0x02037290
	thumb_func_end sub_081A0B88

	thumb_func_start sub_081A0C08
sub_081A0C08: @ 0x081A0C08
	push {r4, lr}
	ldr r0, _081A0C3C
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A0C36
	ldr r4, _081A0C40
	ldr r0, _081A0C44
	ldr r2, [r0]
	adds r2, #0xb2
	ldrb r3, [r2]
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1d
	movs r1, #1
	ldrb r4, [r4]
	lsls r1, r4
	orrs r1, r0
	movs r0, #7
	ands r1, r0
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_081A0C36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A0C3C: .4byte 0x02037282
_081A0C40: .4byte 0x02037284
_081A0C44: .4byte 0x03005AF0
	thumb_func_end sub_081A0C08

	thumb_func_start sub_081A0C48
sub_081A0C48: @ 0x081A0C48
	push {lr}
	ldr r0, _081A0C80
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r1, r0, #0x1a
	lsrs r0, r1, #0x1c
	cmp r0, #2
	bls _081A0C96
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081A0C84
	ldrh r0, [r0]
	cmp r0, #0
	beq _081A0C88
	lsls r2, r2, #2
	adds r2, r3, r2
	adds r2, #0xb8
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	b _081A0C96
	.align 2, 0
_081A0C80: .4byte 0x03005AF0
_081A0C84: .4byte 0x02037282
_081A0C88:
	lsls r0, r2, #2
	adds r0, r3, r0
	adds r0, #0xb8
	ldrb r2, [r0]
	movs r1, #0x3f
	ands r1, r2
	strb r1, [r0]
_081A0C96:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A0C48

	thumb_func_start sub_081A0C9C
sub_081A0C9C: @ 0x081A0C9C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	movs r2, #0
	ldr r1, _081A0D4C
	ldr r0, [r1]
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	ldr r3, _081A0D50
	mov sb, r3
	cmp r0, #0
	beq _081A0CDC
	adds r3, r1, #0
_081A0CBC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #8
	bhi _081A0CDC
	ldr r0, [r3]
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bne _081A0CBC
_081A0CDC:
	mov r4, sb
	movs r0, #8
	bl AllocZeroed
	adds r7, r0, #0
	str r7, [r4]
	ldr r0, _081A0D54
	ldrh r0, [r0]
	cmp r0, #2
	bne _081A0D5C
	ldr r0, _081A0D4C
	ldr r0, [r0]
	mov ip, r0
	mov r6, ip
	adds r6, #0xb1
	ldrb r0, [r6]
	lsls r1, r0, #0x1a
	lsrs r0, r1, #0x1c
	cmp r0, #2
	bls _081A0D06
	b _081A0EA8
_081A0D06:
	mov r3, ip
	adds r3, #0xb4
	adds r0, r3, r0
	ldrb r0, [r0]
	lsrs r5, r0, #4
	ldr r4, _081A0D58
	lsls r2, r5, #1
	mov r5, ip
	adds r5, #0xb0
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r4, #0xc
	adds r2, r2, r4
	ldrh r0, [r2]
	strh r0, [r7, #2]
	ldrb r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	adds r3, r3, r0
	ldrb r0, [r3]
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r1]
	b _081A0EA6
	.align 2, 0
_081A0D4C: .4byte 0x03005AF0
_081A0D50: .4byte 0x03006030
_081A0D54: .4byte 0x02037282
_081A0D58: .4byte 0x085DC21C
_081A0D5C:
	cmp r0, #3
	bne _081A0E2C
	ldr r0, _081A0E24
	mov r8, r0
	ldr r4, [r0]
	movs r1, #0xb1
	adds r1, r1, r4
	mov ip, r1
	ldrb r0, [r1]
	lsls r2, r0, #0x1a
	lsrs r0, r2, #0x1c
	cmp r0, #2
	bhi _081A0D78
	b _081A0EA8
_081A0D78:
	adds r1, r0, #0
	adds r0, r5, #3
	cmp r1, r0
	blt _081A0D82
	b _081A0EA8
_081A0D82:
	adds r0, r1, #0
	subs r0, #3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	beq _081A0D98
	b _081A0EA8
_081A0D98:
	adds r0, r1, #0
	subs r0, #3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r6, r0, #0x1e
	adds r0, r4, #0
	adds r0, #0xb2
	ldrb r1, [r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	asrs r1, r6
	movs r0, #1
	ands r1, r0
	adds r0, r4, #0
	adds r0, #0xb4
	adds r0, r0, r6
	ldrb r5, [r0]
	lsls r1, r1, #2
	asrs r5, r1
	movs r0, #0xf
	ands r5, r0
	ldr r3, _081A0E28
	lsls r2, r5, #1
	adds r0, r4, #0
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r3, #0xc
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r7]
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xb8
	ldrb r2, [r0]
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1e
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_081A0160
	mov r1, sb
	ldr r2, [r1]
	strh r0, [r2, #4]
	mov r3, r8
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xba
	ldrh r0, [r1]
	strh r0, [r2, #6]
	b _081A0EA8
	.align 2, 0
_081A0E24: .4byte 0x03005AF0
_081A0E28: .4byte 0x085DC21C
_081A0E2C:
	cmp r0, #4
	bne _081A0EA8
	ldr r0, _081A0EB4
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r2, r0, #0x1a
	lsrs r0, r2, #0x1c
	cmp r0, #2
	bls _081A0EA8
	adds r1, r0, #0
	adds r0, r5, #3
	cmp r1, r0
	bge _081A0EA8
	adds r0, r1, #0
	subs r0, #3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _081A0EA8
	adds r0, r1, #0
	subs r0, #3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r6, r0, #0x1e
	adds r0, r4, #0
	adds r0, #0xb2
	ldrb r1, [r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	asrs r1, r6
	movs r0, #1
	ands r1, r0
	adds r0, r4, #0
	adds r0, #0xb4
	adds r0, r0, r6
	ldrb r2, [r0]
	lsls r1, r1, #2
	asrs r2, r1
	movs r0, #0xf
	ands r2, r0
	ldr r3, _081A0EB8
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r3, #0xc
	adds r2, r2, r3
	ldrh r0, [r2]
_081A0EA6:
	strh r0, [r7]
_081A0EA8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A0EB4: .4byte 0x03005AF0
_081A0EB8: .4byte 0x085DC21C
	thumb_func_end sub_081A0C9C

	thumb_func_start sub_081A0EBC
sub_081A0EBC: @ 0x081A0EBC
	push {r4, lr}
	ldr r4, _081A0ED0
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A0ED0: .4byte 0x03006030
	thumb_func_end sub_081A0EBC

	thumb_func_start sub_081A0ED4
sub_081A0ED4: @ 0x081A0ED4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _081A0EEC
	ldrh r0, [r0]
	cmp r0, #1
	beq _081A0F00
	cmp r0, #1
	bgt _081A0EF0
	cmp r0, #0
	beq _081A0EF6
	b _081A10F2
	.align 2, 0
_081A0EEC: .4byte 0x02037282
_081A0EF0:
	cmp r0, #2
	beq _081A0F08
	b _081A10F2
_081A0EF6:
	ldr r5, _081A0EFC
	b _081A0F0A
	.align 2, 0
_081A0EFC: .4byte 0x02021C40
_081A0F00:
	ldr r5, _081A0F04
	b _081A0F0A
	.align 2, 0
_081A0F04: .4byte 0x02021C54
_081A0F08:
	ldr r5, _081A0F20
_081A0F0A:
	ldr r0, _081A0F24
	ldrh r0, [r0]
	cmp r0, #9
	bls _081A0F14
	b _081A10F2
_081A0F14:
	lsls r0, r0, #2
	ldr r1, _081A0F28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081A0F20: .4byte 0x02021C68
_081A0F24: .4byte 0x02037284
_081A0F28: .4byte 0x081A0F2C
_081A0F2C: @ jump table
	.4byte _081A0F54 @ case 0
	.4byte _081A0F70 @ case 1
	.4byte _081A0F8C @ case 2
	.4byte _081A0FA8 @ case 3
	.4byte _081A0FC0 @ case 4
	.4byte _081A0FD8 @ case 5
	.4byte _081A0FFC @ case 6
	.4byte _081A106C @ case 7
	.4byte _081A1048 @ case 8
	.4byte _081A108C @ case 9
_081A0F54:
	ldr r0, _081A0F68
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _081A0F6C
	adds r1, r1, r0
	b _081A107C
	.align 2, 0
_081A0F68: .4byte 0x03006030
_081A0F6C: .4byte 0x082EA31C
_081A0F70:
	ldr r0, _081A0F84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _081A0F88
	adds r1, r1, r0
	b _081A107C
	.align 2, 0
_081A0F84: .4byte 0x03006030
_081A0F88: .4byte 0x082EA31C
_081A0F8C:
	ldr r0, _081A0FA0
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _081A0FA4
	adds r1, r1, r0
	b _081A107C
	.align 2, 0
_081A0FA0: .4byte 0x03006030
_081A0FA4: .4byte 0x082EA31C
_081A0FA8:
	ldr r0, _081A0FB8
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	lsls r1, r1, #3
	ldr r0, _081A0FBC
	adds r1, r1, r0
	b _081A107C
	.align 2, 0
_081A0FB8: .4byte 0x03006030
_081A0FBC: .4byte 0x082EACC4
_081A0FC0:
	ldr r0, _081A0FD0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	lsls r1, r1, #3
	ldr r0, _081A0FD4
	adds r1, r1, r0
	b _081A107C
	.align 2, 0
_081A0FD0: .4byte 0x03006030
_081A0FD4: .4byte 0x082EACC4
_081A0FD8:
	ldr r0, _081A0FF8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, #0xba
	ldrh r0, [r1]
	bl ItemId_GetName
	adds r1, r0, #0
	b _081A107C
	.align 2, 0
_081A0FF8: .4byte 0x03005AF0
_081A0FFC:
	movs r3, #0
	ldr r7, _081A1040
	ldr r6, _081A1044
	ldr r0, [r7]
	adds r4, r0, #0
	adds r4, #0xb0
_081A1008:
	mov r0, sp
	adds r2, r0, r3
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r3, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r2]
	cmp r0, #0xff
	beq _081A102A
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #6
	bls _081A1008
_081A102A:
	cmp r3, #3
	bne _081A1034
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #3]
_081A1034:
	adds r0, r5, #0
	mov r1, sp
	bl StringCopy
	b _081A10F2
	.align 2, 0
_081A1040: .4byte 0x03005AF0
_081A1044: .4byte 0x085DC21C
_081A1048:
	ldr r0, _081A105C
	ldr r0, [r0]
	adds r0, #0xb1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _081A1064
	ldr r1, _081A1060
	b _081A107C
	.align 2, 0
_081A105C: .4byte 0x03005AF0
_081A1060: .4byte 0x085CAB0D
_081A1064:
	ldr r1, _081A1068
	b _081A107C
	.align 2, 0
_081A1068: .4byte 0x085CAB13
_081A106C:
	ldr r0, _081A1084
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	bl FrontierSpeechToString
	ldr r1, _081A1088
_081A107C:
	adds r0, r5, #0
	bl StringCopy
	b _081A10F2
	.align 2, 0
_081A1084: .4byte 0x03005AF0
_081A1088: .4byte 0x02021C7C
_081A108C:
	ldr r0, _081A10C4
	ldr r3, [r0]
	adds r1, r3, #0
	adds r1, #0xb1
	ldrb r1, [r1]
	lsls r4, r1, #0x18
	lsrs r1, r4, #0x1e
	adds r7, r0, #0
	cmp r1, #2
	bhi _081A10C8
	adds r0, r3, #0
	adds r0, #0xb4
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r3, #0
	adds r0, #0xb2
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	asrs r2, r0
	movs r0, #0xf
	ands r2, r0
	b _081A10CA
	.align 2, 0
_081A10C4: .4byte 0x03005AF0
_081A10C8:
	movs r2, #0
_081A10CA:
	ldr r3, _081A10FC
	lsls r2, r2, #1
	ldr r0, [r7]
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r3, #0xc
	adds r2, r2, r3
	ldrh r0, [r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _081A1100
	adds r1, r1, r0
	adds r0, r5, #0
	bl StringCopy
_081A10F2:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A10FC: .4byte 0x085DC21C
_081A1100: .4byte 0x082EA31C
	thumb_func_end sub_081A0ED4

	thumb_func_start sub_081A1104
sub_081A1104: @ 0x081A1104
	ldr r0, _081A111C
	ldr r2, [r0]
	ldr r0, _081A1120
	ldrb r1, [r0]
	adds r2, #0xb1
	lsls r1, r1, #6
	ldrb r3, [r2]
	movs r0, #0x3f
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_081A111C: .4byte 0x03005AF0
_081A1120: .4byte 0x02037282
	thumb_func_end sub_081A1104

	thumb_func_start sub_081A1124
sub_081A1124: @ 0x081A1124
	push {lr}
	bl sub_081AA9A0
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A1124

	thumb_func_start sub_081A1130
sub_081A1130: @ 0x081A1130
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _081A1208
	ldr r3, [r1]
	adds r0, r3, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	adds r7, r1, #0
	cmp r0, #2
	bhi _081A114E
	b _081A126E
_081A114E:
	movs r5, #0
	movs r2, #0
	adds r0, r3, #0
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	ldr r1, _081A120C
	mov ip, r1
	ldr r1, _081A1210
	mov r8, r1
	cmp r0, #0
	beq _081A1188
	adds r3, r7, #0
_081A1168:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #8
	bhi _081A1188
	ldr r0, [r3]
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bne _081A1168
_081A1188:
	movs r4, #0
	cmp r4, r5
	bhs _081A122E
	ldr r0, [r7]
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	cmp r4, r0
	bge _081A122E
	adds r6, r7, #0
	mov sb, r4
_081A11A2:
	ldr r3, [r6]
	lsls r0, r4, #2
	adds r2, r3, r0
	adds r0, r2, #0
	adds r0, #0xb8
	ldrb r1, [r0]
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _081A1214
	lsrs r0, r1, #6
	cmp r0, #0
	beq _081A1214
	adds r0, r2, #0
	adds r0, #0xba
	ldrh r0, [r0]
	mov r2, ip
	ldrh r2, [r2]
	cmp r0, r2
	bne _081A1214
	adds r0, r3, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r0, #0xb8
	ldrb r2, [r0]
	movs r1, #0x3f
	ands r1, r2
	strb r1, [r0]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	lsls r0, r0, #2
	adds r1, r1, r0
	mov r2, ip
	ldrh r0, [r2]
	adds r1, #0xba
	strh r0, [r1]
	mov r1, sb
	mov r0, r8
	strh r1, [r0]
	b _081A126E
	.align 2, 0
_081A1208: .4byte 0x03005AF0
_081A120C: .4byte 0x02037282
_081A1210: .4byte 0x02037290
_081A1214:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	bhs _081A122E
	ldr r0, [r6]
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	cmp r4, r0
	blt _081A11A2
_081A122E:
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r2, #0xb8
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	subs r0, #3
	lsls r0, r0, #2
	adds r1, r1, r0
	mov r2, ip
	ldrh r0, [r2]
	adds r1, #0xba
	strh r0, [r1]
	movs r0, #1
	mov r1, r8
	strh r0, [r1]
_081A126E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081A1130

	thumb_func_start sub_081A127C
sub_081A127C: @ 0x081A127C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _081A12C0
	ldr r1, [r0]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0xff
	beq _081A132E
	movs r5, #0
_081A129A:
	ldr r1, [r4]
	adds r2, r5, #1
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r1, r0
	movs r5, #0x8a
	lsls r5, r5, #1
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081A12C4
	adds r0, r3, #0
	adds r0, #0xdc
	adds r1, #0xdc
	movs r2, #0x44
	bl memcpy
	b _081A132E
	.align 2, 0
_081A12C0: .4byte 0x03005AF0
_081A12C4:
	adds r5, r2, #0
	cmp r5, #2
	ble _081A129A
	ldr r0, _081A133C
	mov sl, r0
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	movs r5, #1
	ldr r7, _081A1340
	movs r0, #0x90
	lsls r0, r0, #1
	mov r8, r0
	movs r6, #0x44
_081A12E0:
	ldr r0, [r7]
	add r0, r8
	adds r0, #0x34
	bl GetTrainerId
	adds r4, r0, #0
	ldr r0, [r7]
	adds r0, #0xa
	bl GetTrainerId
	cmp r4, r0
	bne _081A1308
	ldr r0, [r7]
	adds r0, r0, r6
	adds r0, #0xde
	ldrb r0, [r0]
	cmp r0, sl
	bge _081A1308
	mov sl, r0
	mov sb, r5
_081A1308:
	movs r2, #0x44
	add r8, r2
	adds r6, #0x44
	adds r5, #1
	cmp r5, #3
	ble _081A12E0
	mov r5, sb
	cmp r5, #0
	ble _081A132E
	ldr r0, _081A1340
	ldr r1, [r0]
	lsls r0, r5, #4
	add r0, sb
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r0, #0xdc
	adds r1, #0xdc
	bl memcpy
_081A132E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A133C: .4byte 0x0000FFFF
_081A1340: .4byte 0x03005AF0
	thumb_func_end sub_081A127C

	thumb_func_start sub_081A1344
sub_081A1344: @ 0x081A1344
	push {r4, r5, lr}
	ldr r4, _081A1384
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	adds r2, #0xdc
	movs r1, #0x1f
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	adds r2, #0xdc
	lsrs r1, r1, #0x19
	ldrb r3, [r2]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r2, #0
	ldr r0, [r4]
	b _081A1398
	.align 2, 0
_081A1384: .4byte 0x03005AF0
_081A1388:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #8
	bhi _081A13A2
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, r0, r1
_081A1398:
	adds r0, #0xb8
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bne _081A1388
_081A13A2:
	ldr r4, _081A140C
	ldr r0, [r4]
	adds r0, #0xdd
	strb r2, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xde
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _081A13BA
	adds r0, #1
	strb r0, [r1]
_081A13BA:
	ldr r0, [r4]
	adds r0, #0xdd
	ldrb r0, [r0]
	bl sub_081A026C
	movs r2, #0
	adds r3, r4, #0
	movs r4, #0x88
	lsls r4, r4, #1
	adds r5, r3, #0
_081A13CE:
	ldr r0, [r3]
	adds r1, r0, r4
	adds r1, r1, r2
	adds r0, #0xa
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _081A13CE
	ldr r1, [r5]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r0, r1, r2
	bl StringCopy
	ldr r1, [r5]
	ldr r0, _081A1410
	ldrb r0, [r0]
	ldr r2, _081A1414
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0xdc
	bl CalcApprenticeChecksum
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A140C: .4byte 0x03005AF0
_081A1410: .4byte 0x0829BDA5
_081A1414: .4byte 0x0000011B
	thumb_func_end sub_081A1344

	thumb_func_start sub_081A1418
sub_081A1418: @ 0x081A1418
	push {lr}
	ldr r2, _081A1460
	ldr r0, _081A1464
	ldr r0, [r0]
	adds r0, #0xdc
	ldrb r1, [r0]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r2, [r0, #0xa]
	movs r1, #0
	ldr r3, _081A1468
	ldrb r0, [r3]
	cmp r0, r2
	beq _081A144E
_081A143C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1d
	bhi _081A144E
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _081A143C
_081A144E:
	cmp r1, #0x1e
	beq _081A1474
	ldr r0, _081A146C
	adds r0, r1, r0
	ldrb r1, [r0]
	ldr r0, _081A1470
	bl VarSet
	b _081A14A0
	.align 2, 0
_081A1460: .4byte 0x085DC21C
_081A1464: .4byte 0x03005AF0
_081A1468: .4byte 0x085BBE20
_081A146C: .4byte 0x085BBE52
_081A1470: .4byte 0x00004010
_081A1474:
	movs r1, #0
	ldr r3, _081A14A4
	ldrb r0, [r3]
	cmp r0, r2
	beq _081A1490
_081A147E:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bhi _081A1490
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _081A147E
_081A1490:
	cmp r1, #0x14
	beq _081A14A0
	ldr r0, _081A14A8
	adds r0, r1, r0
	ldrb r1, [r0]
	ldr r0, _081A14AC
	bl VarSet
_081A14A0:
	pop {r0}
	bx r0
	.align 2, 0
_081A14A4: .4byte 0x085BBE3E
_081A14A8: .4byte 0x085BBE70
_081A14AC: .4byte 0x00004010
	thumb_func_end sub_081A1418

	thumb_func_start Script_SetPlayerApprenticeTrainerGfxId
Script_SetPlayerApprenticeTrainerGfxId: @ 0x081A14B0
	push {lr}
	ldr r2, _081A14F4
	ldr r0, _081A14F8
	ldr r0, [r0]
	adds r0, #0xb0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r2, [r0, #0xa]
	movs r1, #0
	ldr r3, _081A14FC
	ldrb r0, [r3]
	cmp r0, r2
	beq _081A14E2
_081A14D0:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1d
	bhi _081A14E2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _081A14D0
_081A14E2:
	cmp r1, #0x1e
	beq _081A1508
	ldr r0, _081A1500
	adds r0, r1, r0
	ldrb r1, [r0]
	ldr r0, _081A1504
	bl VarSet
	b _081A1534
	.align 2, 0
_081A14F4: .4byte 0x085DC21C
_081A14F8: .4byte 0x03005AF0
_081A14FC: .4byte 0x085BBE20
_081A1500: .4byte 0x085BBE52
_081A1504: .4byte 0x00004010
_081A1508:
	movs r1, #0
	ldr r3, _081A1538
	ldrb r0, [r3]
	cmp r0, r2
	beq _081A1524
_081A1512:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bhi _081A1524
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _081A1512
_081A1524:
	cmp r1, #0x14
	beq _081A1534
	ldr r0, _081A153C
	adds r0, r1, r0
	ldrb r1, [r0]
	ldr r0, _081A1540
	bl VarSet
_081A1534:
	pop {r0}
	bx r0
	.align 2, 0
_081A1538: .4byte 0x085BBE3E
_081A153C: .4byte 0x085BBE70
_081A1540: .4byte 0x00004010
	thumb_func_end Script_SetPlayerApprenticeTrainerGfxId

	thumb_func_start sub_081A1544
sub_081A1544: @ 0x081A1544
	ldr r1, _081A154C
	movs r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_081A154C: .4byte 0x02037280
	thumb_func_end sub_081A1544

	thumb_func_start sub_081A1550
sub_081A1550: @ 0x081A1550
	ldr r1, _081A1558
	movs r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_081A1558: .4byte 0x02037280
	thumb_func_end sub_081A1550

	thumb_func_start sub_081A155C
sub_081A155C: @ 0x081A155C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081A1580
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081A1576
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081A157C
_081A1576:
	adds r0, r2, #0
	bl SwitchTaskToFollowupFunc
_081A157C:
	pop {r0}
	bx r0
	.align 2, 0
_081A1580: .4byte 0x03002360
	thumb_func_end sub_081A155C

	thumb_func_start Task_ExecuteFuncAfterButtonPress
Task_ExecuteFuncAfterButtonPress: @ 0x081A1584
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081A15C8
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081A159E
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081A15C0
_081A159E:
	ldr r2, _081A15CC
	ldr r1, _081A15D0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	movs r3, #0xa
	ldrsh r0, [r0, r3]
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r2]
	bl _call_via_r1
	adds r0, r4, #0
	bl DestroyTask
_081A15C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A15C8: .4byte 0x03002360
_081A15CC: .4byte 0x03006034
_081A15D0: .4byte 0x03005B60
	thumb_func_end Task_ExecuteFuncAfterButtonPress

	thumb_func_start ExecuteFuncAfterButtonPress
ExecuteFuncAfterButtonPress: @ 0x081A15D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081A15FC
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081A1600
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	lsrs r4, r4, #0x10
	strh r4, [r1, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A15FC: .4byte 0x081A1585
_081A1600: .4byte 0x03005B60
	thumb_func_end ExecuteFuncAfterButtonPress

	thumb_func_start sub_081A1604
sub_081A1604: @ 0x081A1604
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _081A1624
	adds r0, r4, #0
	movs r1, #1
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetTaskFuncWithFollowupFunc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A1624: .4byte 0x081A155D
	thumb_func_end sub_081A1604

