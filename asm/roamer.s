.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearRoamerData
ClearRoamerData: @ 0x08161A48
	push {r4, r5, lr}
	ldr r5, _08161A68
	ldr r0, [r5]
	ldr r4, _08161A6C
	adds r0, r0, r4
	movs r1, #0
	movs r2, #0x1c
	bl memset
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _08161A70
	strh r1, [r0, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08161A68: .4byte 0x03005AEC
_08161A6C: .4byte 0x000031DC
_08161A70: .4byte 0x00000197
	thumb_func_end ClearRoamerData

	thumb_func_start ClearRoamerLocationData
ClearRoamerLocationData: @ 0x08161A74
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _08161AA0
	ldr r4, _08161AA4
	movs r3, #0
	adds r5, r4, #1
_08161A80:
	lsls r1, r2, #1
	adds r0, r1, r4
	strb r3, [r0]
	adds r1, r1, r5
	strb r3, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _08161A80
	movs r0, #0
	strb r0, [r6]
	strb r0, [r6, #1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08161AA0: .4byte 0x0203B952
_08161AA4: .4byte 0x0203B94C
	thumb_func_end ClearRoamerLocationData

	thumb_func_start CreateInitialRoamerMon
CreateInitialRoamerMon: @ 0x08161AA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08161AD0
	ldr r0, _08161AC4
	ldr r1, [r0]
	ldr r2, _08161AC8
	adds r1, r1, r2
	ldr r2, _08161ACC
	b _08161ADC
	.align 2, 0
_08161AC4: .4byte 0x03005AEC
_08161AC8: .4byte 0x000031DC
_08161ACC: .4byte 0x00000197
_08161AD0:
	ldr r0, _08161BBC
	ldr r1, [r0]
	ldr r2, _08161BC0
	adds r1, r1, r2
	movs r2, #0xcc
	lsls r2, r2, #1
_08161ADC:
	strh r2, [r1, #8]
	adds r7, r0, #0
	ldr r6, _08161BC4
	ldr r0, [r7]
	ldr r5, _08161BC0
	adds r0, r0, r5
	ldrh r1, [r0, #8]
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r0, r6, #0
	movs r2, #0x28
	movs r3, #0x20
	bl CreateMon
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #0x28
	strb r1, [r0, #0xc]
	ldr r0, [r7]
	adds r0, r0, r5
	strb r4, [r0, #0xd]
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0, #0x13]
	adds r0, r6, #0
	movs r1, #0x42
	bl GetMonData
	ldr r1, [r7]
	adds r1, r1, r5
	str r0, [r1]
	adds r0, r6, #0
	movs r1, #0
	bl GetMonData
	ldr r1, [r7]
	adds r1, r1, r5
	str r0, [r1, #4]
	adds r0, r6, #0
	movs r1, #0x3a
	bl GetMonData
	ldr r1, [r7]
	adds r1, r1, r5
	movs r2, #0
	mov r8, r2
	strh r0, [r1, #0xa]
	adds r0, r6, #0
	movs r1, #0x16
	bl GetMonData
	ldr r1, [r7]
	adds r1, r1, r5
	strb r0, [r1, #0xe]
	adds r0, r6, #0
	movs r1, #0x17
	bl GetMonData
	ldr r1, [r7]
	adds r1, r1, r5
	strb r0, [r1, #0xf]
	adds r0, r6, #0
	movs r1, #0x18
	bl GetMonData
	ldr r1, [r7]
	adds r1, r1, r5
	strb r0, [r1, #0x10]
	adds r0, r6, #0
	movs r1, #0x21
	bl GetMonData
	ldr r1, [r7]
	adds r1, r1, r5
	strb r0, [r1, #0x11]
	adds r0, r6, #0
	movs r1, #0x2f
	bl GetMonData
	ldr r1, [r7]
	adds r1, r1, r5
	strb r0, [r1, #0x12]
	ldr r4, _08161BC8
	mov r0, r8
	strb r0, [r4]
	bl Random
	ldr r5, _08161BCC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrb r0, [r1]
	strb r0, [r4, #1]
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08161BBC: .4byte 0x03005AEC
_08161BC0: .4byte 0x000031DC
_08161BC4: .4byte 0x020243E8
_08161BC8: .4byte 0x0203B952
_08161BCC: .4byte 0x085ADB74
	thumb_func_end CreateInitialRoamerMon

	thumb_func_start InitRoamer
InitRoamer: @ 0x08161BD0
	push {lr}
	bl ClearRoamerData
	bl ClearRoamerLocationData
	ldr r0, _08161BE8
	ldrh r0, [r0]
	bl CreateInitialRoamerMon
	pop {r0}
	bx r0
	.align 2, 0
_08161BE8: .4byte 0x02037280
	thumb_func_end InitRoamer

	thumb_func_start UpdateLocationHistoryForRoamer
UpdateLocationHistoryForRoamer: @ 0x08161BEC
	ldr r0, _08161C0C
	ldrb r1, [r0, #2]
	strb r1, [r0, #4]
	ldrb r1, [r0, #3]
	strb r1, [r0, #5]
	ldrb r1, [r0]
	strb r1, [r0, #2]
	ldrb r1, [r0, #1]
	strb r1, [r0, #3]
	ldr r1, _08161C10
	ldr r2, [r1]
	ldrb r1, [r2, #4]
	strb r1, [r0]
	ldrb r1, [r2, #5]
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_08161C0C: .4byte 0x0203B94C
_08161C10: .4byte 0x03005AEC
	thumb_func_end UpdateLocationHistoryForRoamer

	thumb_func_start RoamerMoveToOtherLocationSet
RoamerMoveToOtherLocationSet: @ 0x08161C14
	push {r4, r5, lr}
	movs r1, #0
	ldr r0, _08161C58
	ldr r0, [r0]
	ldr r2, _08161C5C
	adds r0, r0, r2
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	beq _08161C52
	ldr r0, _08161C60
	strb r1, [r0]
	ldr r5, _08161C64
	adds r4, r0, #0
_08161C2E:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrb r1, [r1]
	ldrb r0, [r4, #1]
	cmp r0, r1
	beq _08161C2E
	strb r1, [r4, #1]
_08161C52:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08161C58: .4byte 0x03005AEC
_08161C5C: .4byte 0x000031DC
_08161C60: .4byte 0x0203B952
_08161C64: .4byte 0x085ADB74
	thumb_func_end RoamerMoveToOtherLocationSet

	thumb_func_start RoamerMove
RoamerMove: @ 0x08161C68
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _08161C82
	bl RoamerMoveToOtherLocationSet
	b _08161CF6
_08161C82:
	ldr r0, _08161CD8
	ldr r0, [r0]
	ldr r1, _08161CDC
	adds r0, r0, r1
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	beq _08161CF6
	ldr r7, _08161CE0
	ldr r3, _08161CE4
_08161C94:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #1
	adds r1, r2, r3
	ldrb r0, [r7, #1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08161CEC
	ldr r6, _08161CE4
	adds r5, r2, #1
	ldr r4, _08161CE8
_08161CAA:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, r0, r5
	adds r0, r0, r6
	ldrb r1, [r0]
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _08161CCE
	ldrb r0, [r4, #5]
	cmp r0, r1
	beq _08161CAA
_08161CCE:
	cmp r1, #0xff
	beq _08161CAA
	strb r1, [r7, #1]
	b _08161CF6
	.align 2, 0
_08161CD8: .4byte 0x03005AEC
_08161CDC: .4byte 0x000031DC
_08161CE0: .4byte 0x0203B952
_08161CE4: .4byte 0x085ADB74
_08161CE8: .4byte 0x0203B94C
_08161CEC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _08161C94
_08161CF6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end RoamerMove

	thumb_func_start IsRoamerAt
IsRoamerAt: @ 0x08161CFC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _08161D28
	ldr r0, [r0]
	ldr r3, _08161D2C
	adds r0, r0, r3
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	beq _08161D34
	ldr r0, _08161D30
	ldrb r3, [r0]
	cmp r2, r3
	bne _08161D34
	ldrb r0, [r0, #1]
	cmp r1, r0
	bne _08161D34
	movs r0, #1
	b _08161D36
	.align 2, 0
_08161D28: .4byte 0x03005AEC
_08161D2C: .4byte 0x000031DC
_08161D30: .4byte 0x0203B952
_08161D34:
	movs r0, #0
_08161D36:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsRoamerAt

	thumb_func_start CreateRoamerMonInstance
CreateRoamerMonInstance: @ 0x08161D3C
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _08161DC8
	bl ZeroEnemyPartyMons
	ldr r4, _08161DCC
	ldr r0, [r4]
	ldr r1, _08161DD0
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	ldrb r2, [r0, #0xc]
	ldr r3, [r0]
	ldr r0, [r0, #4]
	str r0, [sp]
	adds r0, r5, #0
	bl CreateMonWithIVsPersonality
	ldr r2, [r4]
	ldr r0, _08161DD4
	adds r2, r2, r0
	adds r0, r5, #0
	movs r1, #0x37
	bl SetMonData
	ldr r2, [r4]
	ldr r1, _08161DD8
	adds r2, r2, r1
	adds r0, r5, #0
	movs r1, #0x39
	bl SetMonData
	ldr r2, [r4]
	ldr r0, _08161DDC
	adds r2, r2, r0
	adds r0, r5, #0
	movs r1, #0x16
	bl SetMonData
	ldr r2, [r4]
	ldr r1, _08161DE0
	adds r2, r2, r1
	adds r0, r5, #0
	movs r1, #0x17
	bl SetMonData
	ldr r2, [r4]
	ldr r0, _08161DE4
	adds r2, r2, r0
	adds r0, r5, #0
	movs r1, #0x18
	bl SetMonData
	ldr r2, [r4]
	ldr r1, _08161DE8
	adds r2, r2, r1
	adds r0, r5, #0
	movs r1, #0x21
	bl SetMonData
	ldr r2, [r4]
	ldr r0, _08161DEC
	adds r2, r2, r0
	adds r0, r5, #0
	movs r1, #0x2f
	bl SetMonData
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08161DC8: .4byte 0x020243E8
_08161DCC: .4byte 0x03005AEC
_08161DD0: .4byte 0x000031DC
_08161DD4: .4byte 0x000031E9
_08161DD8: .4byte 0x000031E6
_08161DDC: .4byte 0x000031EA
_08161DE0: .4byte 0x000031EB
_08161DE4: .4byte 0x000031EC
_08161DE8: .4byte 0x000031ED
_08161DEC: .4byte 0x000031EE
	thumb_func_end CreateRoamerMonInstance

	thumb_func_start TryStartRoamerEncounter
TryStartRoamerEncounter: @ 0x08161DF0
	push {lr}
	ldr r0, _08161E20
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	ldrb r1, [r1, #5]
	bl IsRoamerAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08161E24
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	bne _08161E24
	bl CreateRoamerMonInstance
	movs r0, #1
	b _08161E26
	.align 2, 0
_08161E20: .4byte 0x03005AEC
_08161E24:
	movs r0, #0
_08161E26:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryStartRoamerEncounter

	thumb_func_start UpdateRoamerHPStatus
UpdateRoamerHPStatus: @ 0x08161E2C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x39
	bl GetMonData
	ldr r5, _08161E58
	ldr r1, [r5]
	ldr r4, _08161E5C
	adds r1, r1, r4
	strh r0, [r1, #0xa]
	adds r0, r6, #0
	movs r1, #0x37
	bl GetMonData
	ldr r1, [r5]
	adds r1, r1, r4
	strb r0, [r1, #0xd]
	bl RoamerMoveToOtherLocationSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08161E58: .4byte 0x03005AEC
_08161E5C: .4byte 0x000031DC
	thumb_func_end UpdateRoamerHPStatus

	thumb_func_start SetRoamerInactive
SetRoamerInactive: @ 0x08161E60
	ldr r0, _08161E70
	ldr r0, [r0]
	ldr r1, _08161E74
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0, #0x13]
	bx lr
	.align 2, 0
_08161E70: .4byte 0x03005AEC
_08161E74: .4byte 0x000031DC
	thumb_func_end SetRoamerInactive

	thumb_func_start GetRoamerLocation
GetRoamerLocation: @ 0x08161E78
	ldr r3, _08161E84
	ldrb r2, [r3]
	strb r2, [r0]
	ldrb r0, [r3, #1]
	strb r0, [r1]
	bx lr
	.align 2, 0
_08161E84: .4byte 0x0203B952
	thumb_func_end GetRoamerLocation

