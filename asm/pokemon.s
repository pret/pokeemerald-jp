.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ZeroBoxMonData
ZeroBoxMonData: @ 0x08067658
	push {lr}
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_08067660:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, #1
	cmp r1, #0x4f
	bls _08067660
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ZeroBoxMonData

	thumb_func_start ZeroMonData
ZeroMonData: @ 0x08067670
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ZeroBoxMonData
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x37
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x38
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x39
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3a
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3b
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3c
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3d
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3e
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3f
	mov r2, sp
	bl SetMonData
	movs r0, #0xff
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x40
	mov r2, sp
	bl SetMonData
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ZeroMonData

	thumb_func_start ZeroPlayerPartyMons
ZeroPlayerPartyMons: @ 0x080676F0
	push {r4, r5, lr}
	ldr r4, _0806770C
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r5, r4, r0
_080676FA:
	adds r0, r4, #0
	bl ZeroMonData
	adds r4, #0x64
	cmp r4, r5
	ble _080676FA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806770C: .4byte 0x02024190
	thumb_func_end ZeroPlayerPartyMons

	thumb_func_start ZeroEnemyPartyMons
ZeroEnemyPartyMons: @ 0x08067710
	push {r4, r5, lr}
	ldr r4, _0806772C
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r5, r4, r0
_0806771A:
	adds r0, r4, #0
	bl ZeroMonData
	adds r4, #0x64
	cmp r4, r5
	ble _0806771A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806772C: .4byte 0x020243E8
	thumb_func_end ZeroEnemyPartyMons

	thumb_func_start CreateMon
CreateMon: @ 0x08067730
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	mov r8, r0
	adds r6, r1, #0
	ldr r4, [sp, #0x34]
	ldr r7, [sp, #0x38]
	ldr r5, [sp, #0x3c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	add r0, sp, #0x10
	strb r2, [r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, r8
	str r3, [sp, #0x18]
	bl ZeroMonData
	str r4, [sp]
	str r7, [sp, #4]
	str r5, [sp, #8]
	ldr r0, [sp, #0x40]
	str r0, [sp, #0xc]
	mov r0, r8
	adds r1, r6, #0
	add r2, sp, #0x10
	ldrb r2, [r2]
	ldr r3, [sp, #0x18]
	bl CreateBoxMon
	mov r0, r8
	movs r1, #0x38
	add r2, sp, #0x10
	bl SetMonData
	movs r0, #0xff
	str r0, [sp, #0x14]
	add r2, sp, #0x14
	mov r0, r8
	movs r1, #0x40
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end CreateMon

	thumb_func_start CreateBoxMon
CreateBoxMon: @ 0x080677A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	ldr r4, [sp, #0x40]
	ldr r0, [sp, #0x48]
	movs r5, #0xe
	add r5, sp
	strh r1, [r5]
	add r6, sp, #0x10
	strb r2, [r6]
	mov r5, sp
	adds r5, #0x11
	strb r3, [r5]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r0, r7, #0
	bl ZeroBoxMonData
	cmp r4, #0
	beq _080677DC
	ldr r0, [sp, #0x44]
	str r0, [sp, #0x14]
	b _080677F0
_080677DC:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	str r4, [sp, #0x14]
_080677F0:
	add r2, sp, #0x14
	adds r0, r7, #0
	movs r1, #0
	bl SetBoxMonData
	add r0, sp, #0x18
	mov sb, r0
	add r5, sp, #0xc
	mov r1, sl
	cmp r1, #2
	bne _08067848
	ldr r2, _08067840
	mov r8, r2
	ldr r6, _08067844
_0806780C:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	str r4, [sp, #0x18]
	adds r1, r4, #0
	mov r3, r8
	ands r1, r3
	lsrs r1, r1, #0x10
	ands r4, r6
	eors r1, r4
	ldr r2, [sp, #0x14]
	adds r0, r2, #0
	ands r0, r3
	lsrs r0, r0, #0x10
	eors r1, r0
	ands r2, r6
	eors r1, r2
	cmp r1, #7
	bls _0806780C
	b _0806786E
	.align 2, 0
_08067840: .4byte 0xFFFF0000
_08067844: .4byte 0x0000FFFF
_08067848:
	mov r0, sl
	cmp r0, #1
	bne _08067854
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0x18]
	b _0806786E
_08067854:
	ldr r0, _08067998
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #8
	orrs r1, r0
	ldrb r0, [r2, #0xc]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrb r0, [r2, #0xd]
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [sp, #0x18]
_0806786E:
	adds r0, r7, #0
	movs r1, #1
	mov r2, sb
	bl SetBoxMonData
	adds r0, r7, #0
	bl CalculateBoxMonChecksum
	strh r0, [r5]
	adds r0, r7, #0
	movs r1, #9
	adds r2, r5, #0
	bl SetBoxMonData
	adds r0, r7, #0
	bl EncryptBoxMon
	mov r0, sp
	ldrh r1, [r0, #0xe]
	bl GetSpeciesName
	adds r0, r7, #0
	movs r1, #2
	mov r2, sp
	bl SetBoxMonData
	ldr r2, _0806799C
	adds r0, r7, #0
	movs r1, #3
	bl SetBoxMonData
	ldr r5, _08067998
	ldr r2, [r5]
	adds r0, r7, #0
	movs r1, #7
	bl SetBoxMonData
	adds r0, r7, #0
	movs r1, #0xb
	mov r2, sp
	adds r2, #0xe
	bl SetBoxMonData
	ldr r4, _080679A0
	mov r2, sp
	ldrh r1, [r2, #0xe]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	adds r2, r1, #0
	muls r2, r0, r2
	mov r3, sp
	ldrb r0, [r3, #0x10]
	lsls r0, r0, #2
	ldr r1, _080679A4
	adds r0, r0, r1
	adds r2, r2, r0
	adds r0, r7, #0
	movs r1, #0x19
	bl SetBoxMonData
	mov r1, sp
	ldrh r0, [r1, #0xe]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r4, #0x12
	adds r2, r2, r4
	adds r0, r7, #0
	movs r1, #0x20
	bl SetBoxMonData
	bl GetCurrentRegionMapSectionId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	adds r0, r7, #0
	movs r1, #0x23
	mov r2, sb
	bl SetBoxMonData
	adds r0, r7, #0
	movs r1, #0x24
	add r2, sp, #0x10
	bl SetBoxMonData
	ldr r2, _080679A8
	adds r0, r7, #0
	movs r1, #0x25
	bl SetBoxMonData
	movs r0, #4
	str r0, [sp, #0x18]
	adds r0, r7, #0
	movs r1, #0x26
	mov r2, sb
	bl SetBoxMonData
	ldr r2, [r5]
	adds r2, #8
	adds r0, r7, #0
	movs r1, #0x31
	bl SetBoxMonData
	mov r2, sp
	ldrb r0, [r2, #0x11]
	cmp r0, #0x1f
	bhi _080679AC
	adds r0, r7, #0
	movs r1, #0x27
	adds r2, #0x11
	bl SetBoxMonData
	adds r0, r7, #0
	movs r1, #0x28
	mov r2, sp
	adds r2, #0x11
	bl SetBoxMonData
	adds r0, r7, #0
	movs r1, #0x29
	mov r2, sp
	adds r2, #0x11
	bl SetBoxMonData
	adds r0, r7, #0
	movs r1, #0x2a
	mov r2, sp
	adds r2, #0x11
	bl SetBoxMonData
	adds r0, r7, #0
	movs r1, #0x2b
	mov r2, sp
	adds r2, #0x11
	bl SetBoxMonData
	adds r0, r7, #0
	movs r1, #0x2c
	mov r2, sp
	adds r2, #0x11
	bl SetBoxMonData
	b _08067A34
	.align 2, 0
_08067998: .4byte 0x03005AF0
_0806799C: .4byte 0x0829BDA5
_080679A0: .4byte 0x082F0D54
_080679A4: .4byte 0x082F00B4
_080679A8: .4byte 0x0829BDA4
_080679AC:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	movs r3, #0x1f
	mov r8, r3
	ands r0, r3
	str r0, [sp, #0x1c]
	add r4, sp, #0x1c
	adds r0, r7, #0
	movs r1, #0x27
	adds r2, r4, #0
	bl SetBoxMonData
	ldr r0, [sp, #0x18]
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r0, r6
	lsrs r0, r0, #5
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r1, #0x28
	adds r2, r4, #0
	bl SetBoxMonData
	ldr r0, [sp, #0x18]
	movs r5, #0xf8
	lsls r5, r5, #7
	ands r0, r5
	lsrs r0, r0, #0xa
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r1, #0x29
	adds r2, r4, #0
	bl SetBoxMonData
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	mov r1, r8
	ands r0, r1
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r1, #0x2a
	adds r2, r4, #0
	bl SetBoxMonData
	ldr r0, [sp, #0x18]
	ands r0, r6
	lsrs r0, r0, #5
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r1, #0x2b
	adds r2, r4, #0
	bl SetBoxMonData
	ldr r0, [sp, #0x18]
	ands r0, r5
	lsrs r0, r0, #0xa
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r1, #0x2c
	adds r2, r4, #0
	bl SetBoxMonData
_08067A34:
	ldr r2, _08067A70
	mov r3, sp
	ldrh r1, [r3, #0xe]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x17]
	cmp r0, #0
	beq _08067A5A
	ldr r0, [sp, #0x14]
	movs r1, #1
	ands r0, r1
	str r0, [sp, #0x18]
	adds r0, r7, #0
	movs r1, #0x2e
	mov r2, sb
	bl SetBoxMonData
_08067A5A:
	adds r0, r7, #0
	bl GiveBoxMonInitialMoveset
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067A70: .4byte 0x082F0D54
	thumb_func_end CreateBoxMon

	thumb_func_start CreateMonWithNature
CreateMonWithNature: @ 0x08067A74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov sb, r0
	ldr r0, [sp, #0x2c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08067A94:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	adds r0, r4, #0
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _08067A94
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	adds r3, r6, #0
	bl CreateMon
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateMonWithNature

	thumb_func_start CreateMonWithGenderNatureLetter
CreateMonWithGenderNatureLetter: @ 0x08067ADC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	ldr r4, [sp, #0x38]
	ldr r5, [sp, #0x3c]
	ldr r0, [sp, #0x40]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r8, r4
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov sb, r1
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bhi _08067B82
_08067B1C:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	ands r0, r4
	lsrs r0, r0, #0x12
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r4
	lsrs r1, r1, #0xc
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r1, r4
	lsrs r1, r1, #6
	orrs r0, r1
	movs r1, #3
	ands r1, r4
	orrs r0, r1
	movs r1, #0x1c
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bne _08067B1C
	adds r0, r7, #0
	adds r1, r4, #0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r8, r0
	bne _08067B1C
	mov r0, sb
	subs r0, #1
	cmp r5, r0
	bne _08067B1C
	b _08067BB2
_08067B82:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	adds r0, r4, #0
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bne _08067B82
	adds r0, r7, #0
	adds r1, r4, #0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r8, r0
	bne _08067B82
_08067BB2:
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r1, r7, #0
	ldr r2, [sp, #0x14]
	mov r3, sl
	bl CreateMon
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateMonWithGenderNatureLetter

	thumb_func_start CreateMaleMon
CreateMaleMon: @ 0x08067BDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
_08067BEE:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	lsls r0, r0, #0x10
	orrs r5, r0
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08067BEE
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0x20
	bl CreateMon
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateMaleMon

	thumb_func_start CreateMonWithIVsPersonality
CreateMonWithIVsPersonality: @ 0x08067C44
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	str r3, [sp, #0x10]
	ldr r3, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	str r0, [sp]
	str r3, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r3, #0
	bl CreateMon
	adds r0, r4, #0
	movs r1, #0x42
	add r2, sp, #0x10
	bl SetMonData
	adds r0, r4, #0
	bl CalculateMonStats
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateMonWithIVsPersonality

	thumb_func_start CreateMonWithIVsOTID
CreateMonWithIVsOTID: @ 0x08067C84
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r3, #0
	ldr r3, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	movs r3, #0
	bl CreateMon
	adds r0, r5, #0
	movs r1, #0x27
	adds r2, r4, #0
	bl SetMonData
	adds r2, r4, #1
	adds r0, r5, #0
	movs r1, #0x28
	bl SetMonData
	adds r2, r4, #2
	adds r0, r5, #0
	movs r1, #0x29
	bl SetMonData
	adds r2, r4, #3
	adds r0, r5, #0
	movs r1, #0x2a
	bl SetMonData
	adds r2, r4, #4
	adds r0, r5, #0
	movs r1, #0x2b
	bl SetMonData
	adds r4, #5
	adds r0, r5, #0
	movs r1, #0x2c
	adds r2, r4, #0
	bl SetMonData
	adds r0, r5, #0
	bl CalculateMonStats
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateMonWithIVsOTID

	thumb_func_start CreateMonWithEVSpread
CreateMonWithEVSpread: @ 0x08067CF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r0, [sp, #0x2c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r6, #0
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	adds r0, r7, #0
	bl CreateMon
	mov r4, r8
	movs r1, #1
	movs r5, #5
_08067D2C:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08067D36
	adds r6, #1
_08067D36:
	lsrs r4, r4, #1
	subs r5, #1
	cmp r5, #0
	bge _08067D2C
	movs r0, #0xff
	lsls r0, r0, #1
	adds r1, r6, #0
	bl __divsi3
	add r1, sp, #0x10
	strh r0, [r1]
	movs r4, #1
	movs r5, #0
_08067D50:
	mov r0, r8
	ands r0, r4
	cmp r0, #0
	beq _08067D64
	adds r1, r5, #0
	adds r1, #0x1a
	adds r0, r7, #0
	add r2, sp, #0x10
	bl SetMonData
_08067D64:
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
	adds r5, #1
	cmp r5, #5
	ble _08067D50
	adds r0, r7, #0
	bl CalculateMonStats
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end CreateMonWithEVSpread

	thumb_func_start CreateBattleTowerMon
CreateBattleTowerMon: @ 0x08067D80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r6, r1, #0
	ldrh r1, [r6]
	ldrb r2, [r6, #0xc]
	movs r3, #1
	str r3, [sp]
	ldr r0, [r6, #0x1c]
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r6, #0x14]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	movs r3, #0
	bl CreateMon
	movs r5, #0
	adds r4, r6, #4
_08067DA6:
	ldrh r1, [r4]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	adds r0, r7, #0
	bl SetMonMoveSlot
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _08067DA6
	adds r2, r6, #0
	adds r2, #0xd
	adds r0, r7, #0
	movs r1, #0x15
	bl SetMonData
	adds r2, r6, #2
	adds r0, r7, #0
	movs r1, #0xc
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x20
	adds r0, r7, #0
	movs r1, #2
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x2b
	adds r0, r7, #0
	movs r1, #0x20
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0xe
	adds r0, r7, #0
	movs r1, #0x1a
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0xf
	adds r0, r7, #0
	movs r1, #0x1b
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x10
	adds r0, r7, #0
	movs r1, #0x1c
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x11
	adds r0, r7, #0
	movs r1, #0x1d
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x12
	adds r0, r7, #0
	movs r1, #0x1e
	bl SetMonData
	adds r2, r6, #0
	adds r2, #0x13
	adds r0, r7, #0
	movs r1, #0x1f
	bl SetMonData
	ldrb r0, [r6, #0x1b]
	lsrs r0, r0, #7
	add r1, sp, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x2e
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrb r0, [r6, #0x18]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x27
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x28
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrb r0, [r6, #0x19]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x29
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldr r0, [r6, #0x18]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x2a
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrh r0, [r6, #0x1a]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x2b
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrb r0, [r6, #0x1b]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x2c
	add r2, sp, #0x10
	bl SetMonData
	adds r0, r7, #0
	bl GiveMonInitialMoveset
	adds r0, r7, #0
	bl CalculateMonStats
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateBattleTowerMon

	thumb_func_start CreateBattleTowerMon2
CreateBattleTowerMon2: @ 0x08067ED0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _08067F04
	ldr r0, [r0]
	ldr r1, _08067F08
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08067F0C
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	bl GetFrontierEnemyMonLevel
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _08067F14
	.align 2, 0
_08067F04: .4byte 0x03005AF0
_08067F08: .4byte 0x00000CA9
_08067F0C:
	movs r3, #0x32
	cmp r2, #0
	bne _08067F14
	ldrb r3, [r5, #0xc]
_08067F14:
	ldrh r1, [r5]
	movs r2, #1
	str r2, [sp]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r2, r3, #0
	movs r3, #0
	bl CreateMon
	movs r6, #0
	movs r0, #0xd
	adds r0, r0, r5
	mov r8, r0
	adds r1, r5, #2
	mov sb, r1
	movs r0, #0x20
	adds r0, r0, r5
	mov sl, r0
	adds r1, #0x29
	str r1, [sp, #0x2c]
	adds r0, r5, #0
	adds r0, #0xe
	str r0, [sp, #0x14]
	subs r1, #0x1c
	str r1, [sp, #0x18]
	adds r0, #2
	str r0, [sp, #0x1c]
	adds r1, #2
	str r1, [sp, #0x20]
	adds r0, #2
	str r0, [sp, #0x24]
	adds r1, #2
	str r1, [sp, #0x28]
	adds r4, r5, #4
_08067F60:
	ldrh r1, [r4]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	adds r0, r7, #0
	bl SetMonMoveSlot
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _08067F60
	adds r0, r7, #0
	movs r1, #0x15
	mov r2, r8
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0xc
	mov r2, sb
	bl SetMonData
	adds r0, r7, #0
	movs r1, #2
	mov r2, sl
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x20
	ldr r2, [sp, #0x2c]
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x1a
	ldr r2, [sp, #0x14]
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x1b
	ldr r2, [sp, #0x18]
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x1c
	ldr r2, [sp, #0x1c]
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x1d
	ldr r2, [sp, #0x20]
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x1e
	ldr r2, [sp, #0x24]
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x1f
	ldr r2, [sp, #0x28]
	bl SetMonData
	ldrb r0, [r5, #0x1b]
	lsrs r0, r0, #7
	add r1, sp, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x2e
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x27
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrh r0, [r5, #0x18]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x28
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrb r0, [r5, #0x19]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x29
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldr r0, [r5, #0x18]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x2a
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrh r0, [r5, #0x1a]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x2b
	add r2, sp, #0x10
	bl SetMonData
	add r1, sp, #0x10
	ldrb r0, [r5, #0x1b]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x2c
	add r2, sp, #0x10
	bl SetMonData
	adds r0, r7, #0
	bl GiveMonInitialMoveset
	adds r0, r7, #0
	bl CalculateMonStats
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateBattleTowerMon2

	thumb_func_start CreateApprenticeMon
CreateApprenticeMon: @ 0x08068080
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r6, _08068170
	ldrb r0, [r1]
	lsls r5, r0, #0x1b
	lsrs r3, r5, #0x1b
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r1, r1, r6
	ldrh r1, [r1, #8]
	mov r8, r1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r1, r1, r6
	ldrh r4, [r1, #8]
	lsrs r4, r4, #8
	adds r5, r3, #0
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #4
	adds r1, r1, r6
	ldrb r1, [r1, #8]
	lsls r1, r1, #8
	lsls r5, r2, #1
	adds r5, r5, r2
	lsls r5, r5, #2
	mov r2, sb
	adds r6, r2, r5
	orrs r4, r1
	ldrh r1, [r6, #4]
	adds r4, r4, r1
	ldrb r1, [r2, #2]
	adds r4, r4, r1
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetFrontierEnemyMonLevel
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrh r1, [r6, #4]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r7, #0
	movs r3, #0x1f
	bl CreateMon
	mov r1, sb
	adds r2, r5, r1
	adds r2, #0xe
	adds r0, r7, #0
	movs r1, #0xc
	bl SetMonData
	movs r4, #0
	mov r6, sb
	adds r6, #6
_08068112:
	adds r0, r6, r5
	ldrh r1, [r0]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	adds r0, r7, #0
	bl SetMonMoveSlot
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _08068112
	movs r1, #0x55
	add r0, sp, #0x10
	strh r1, [r0]
	movs r4, #0
_08068130:
	adds r1, r4, #0
	adds r1, #0x1a
	adds r0, r7, #0
	add r2, sp, #0x10
	bl SetMonData
	adds r4, #1
	cmp r4, #5
	ble _08068130
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #4
	ldr r0, _08068170
	adds r2, r2, r0
	adds r0, r7, #0
	movs r1, #7
	bl SetMonData
	adds r0, r7, #0
	bl CalculateMonStats
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068170: .4byte 0x085DC21C
	thumb_func_end CreateApprenticeMon

	thumb_func_start CreateMonWithEVSpreadNatureOTID
CreateMonWithEVSpreadNatureOTID: @ 0x08068174
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r8, r4
	movs r6, #0
_080681A4:
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	orrs r4, r0
	adds r0, r4, #0
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _080681A4
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	ldr r1, [sp, #0x14]
	mov r2, sl
	mov r3, sb
	bl CreateMon
	mov r5, r8
	movs r1, #1
	movs r4, #5
_080681E2:
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080681EC
	adds r6, #1
_080681EC:
	lsrs r5, r5, #1
	subs r4, #1
	cmp r4, #0
	bge _080681E2
	movs r0, #0xff
	lsls r0, r0, #1
	adds r1, r6, #0
	bl __divsi3
	add r1, sp, #0x10
	strh r0, [r1]
	movs r5, #1
	movs r4, #0
_08068206:
	mov r0, r8
	ands r0, r5
	cmp r0, #0
	beq _0806821A
	adds r1, r4, #0
	adds r1, #0x1a
	adds r0, r7, #0
	add r2, sp, #0x10
	bl SetMonData
_0806821A:
	lsls r0, r5, #0x19
	lsrs r5, r0, #0x18
	adds r4, #1
	cmp r4, #5
	ble _08068206
	adds r0, r7, #0
	bl CalculateMonStats
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateMonWithEVSpreadNatureOTID

	thumb_func_start sub_0806823C
sub_0806823C: @ 0x0806823C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r6]
	adds r0, r7, #0
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _08068266
	movs r0, #0
_08068266:
	strh r0, [r6, #2]
	movs r5, #0
	movs r0, #0x2b
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x20
	adds r1, r1, r6
	mov sb, r1
	adds r4, r6, #4
_08068278:
	adds r1, r5, #0
	adds r1, #0xd
	adds r0, r7, #0
	movs r2, #0
	bl GetMonData
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _08068278
	adds r0, r7, #0
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	strb r0, [r6, #0xc]
	adds r0, r7, #0
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	strb r0, [r6, #0xd]
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	str r0, [r6, #0x14]
	adds r0, r7, #0
	movs r1, #0x1a
	movs r2, #0
	bl GetMonData
	strb r0, [r6, #0xe]
	adds r0, r7, #0
	movs r1, #0x1b
	movs r2, #0
	bl GetMonData
	strb r0, [r6, #0xf]
	adds r0, r7, #0
	movs r1, #0x1c
	movs r2, #0
	bl GetMonData
	strb r0, [r6, #0x10]
	adds r0, r7, #0
	movs r1, #0x1d
	movs r2, #0
	bl GetMonData
	strb r0, [r6, #0x11]
	adds r0, r7, #0
	movs r1, #0x1e
	movs r2, #0
	bl GetMonData
	strb r0, [r6, #0x12]
	adds r0, r7, #0
	movs r1, #0x1f
	movs r2, #0
	bl GetMonData
	strb r0, [r6, #0x13]
	adds r0, r7, #0
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x27
	movs r2, #0
	bl GetMonData
	movs r4, #0x1f
	ands r0, r4
	ldrb r2, [r6, #0x18]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #0x18]
	adds r0, r7, #0
	movs r1, #0x28
	movs r2, #0
	bl GetMonData
	movs r5, #0x1f
	ands r0, r5
	lsls r0, r0, #5
	ldrh r2, [r6, #0x18]
	ldr r1, _080683DC
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x18]
	adds r0, r7, #0
	movs r1, #0x29
	movs r2, #0
	bl GetMonData
	ands r0, r4
	lsls r0, r0, #2
	ldrb r2, [r6, #0x19]
	movs r1, #0x7d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #0x19]
	adds r0, r7, #0
	movs r1, #0x2a
	movs r2, #0
	bl GetMonData
	movs r1, #0x1f
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [r6, #0x18]
	ldr r2, _080683E0
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #0x18]
	adds r0, r7, #0
	movs r1, #0x2b
	movs r2, #0
	bl GetMonData
	ands r0, r5
	lsls r0, r0, #4
	ldrh r2, [r6, #0x1a]
	ldr r1, _080683E4
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x1a]
	adds r0, r7, #0
	movs r1, #0x2c
	movs r2, #0
	bl GetMonData
	ands r0, r4
	lsls r0, r0, #1
	ldrb r2, [r6, #0x1b]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #0x1b]
	adds r0, r7, #0
	movs r1, #0x2e
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #7
	ldrb r2, [r6, #0x1b]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #0x1b]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	str r0, [r6, #0x1c]
	adds r0, r7, #0
	movs r1, #2
	mov r2, sb
	bl GetMonData
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080683DC: .4byte 0xFFFFFC1F
_080683E0: .4byte 0xFFF07FFF
_080683E4: .4byte 0xFFFFFE0F
	thumb_func_end sub_0806823C

	thumb_func_start CreateObedientMon
CreateObedientMon: @ 0x080683E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r0
	ldr r4, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r7, [sp, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #1
	str r0, [sp, #0x10]
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	str r7, [sp, #0xc]
	mov r0, r8
	bl CreateMon
	mov r0, r8
	movs r1, #0x50
	add r2, sp, #0x10
	bl SetMonData
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CreateObedientMon

	thumb_func_start sub_08068438
sub_08068438: @ 0x08068438
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r0, #5
	bhi _0806850E
	lsls r0, r0, #2
	ldr r1, _08068450
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068450: .4byte 0x08068454
_08068454: @ jump table
	.4byte _0806850E @ case 0
	.4byte _0806846C @ case 1
	.4byte _08068540 @ case 2
	.4byte _08068498 @ case 3
	.4byte _08068540 @ case 4
	.4byte _080684D0 @ case 5
_0806846C:
	ldr r0, _0806848C
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806850E
	ldr r0, _08068490
	ldr r1, _08068494
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806850E
	b _080684F6
	.align 2, 0
_0806848C: .4byte 0x02022C90
_08068490: .4byte 0x03002360
_08068494: .4byte 0x00000439
_08068498:
	ldr r0, _080684C4
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806850E
	ldr r0, _080684C8
	ldr r1, _080684CC
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806850E
	cmp r5, #1
	beq _08068540
	cmp r5, #4
	beq _08068540
	cmp r5, #5
	beq _08068540
	b _0806850E
	.align 2, 0
_080684C4: .4byte 0x02022C90
_080684C8: .4byte 0x03002360
_080684CC: .4byte 0x00000439
_080684D0:
	ldr r0, _08068514
	ldr r2, [r0]
	movs r3, #2
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	beq _08068524
	ldr r0, _08068518
	ldr r1, _0806851C
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0806850E
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	beq _08068534
_080684F6:
	ldr r4, _08068520
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r1, #0x18]
	cmp r0, r5
	bne _08068540
_0806850E:
	movs r0, #0
	b _08068542
	.align 2, 0
_08068514: .4byte 0x02022C90
_08068518: .4byte 0x03002360
_0806851C: .4byte 0x00000439
_08068520: .4byte 0x020226A0
_08068524:
	ldr r0, _08068548
	ldr r1, _0806854C
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0806850E
_08068534:
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806850E
_08068540:
	movs r0, #1
_08068542:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08068548: .4byte 0x03002360
_0806854C: .4byte 0x00000439
	thumb_func_end sub_08068438

	thumb_func_start GetDeoxysStat
GetDeoxysStat: @ 0x08068550
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08068578
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08068574
	adds r0, r5, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	movs r1, #0xcd
	lsls r1, r1, #1
	cmp r0, r1
	beq _0806857C
_08068574:
	movs r0, #0
	b _080685DA
	.align 2, 0
_08068578: .4byte 0x02022C90
_0806857C:
	adds r1, r6, #0
	adds r1, #0x27
	adds r0, r5, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	adds r1, r6, #0
	adds r1, #0x1a
	adds r0, r5, #0
	movs r2, #0
	bl GetMonData
	ldr r2, _080685E0
	lsls r1, r6, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r4
	cmp r0, #0
	bge _080685A8
	adds r0, #3
_080685A8:
	asrs r0, r0, #2
	adds r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x54
	ldrb r1, [r1]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, #5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	adds r1, r4, #0
	bl ModifyStatByNature
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
_080685DA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080685E0: .4byte 0x082FA6D6
	thumb_func_end GetDeoxysStat

	thumb_func_start SetDeoxysStats
SetDeoxysStats: @ 0x080685E4
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
_080685EA:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08068684
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	movs r1, #0xcd
	lsls r1, r1, #1
	cmp r0, r1
	bne _08068674
	adds r0, r4, #0
	movs r1, #0x3b
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3b
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3c
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3d
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3d
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3e
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3f
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3f
	mov r2, sp
	bl SetMonData
_08068674:
	adds r5, #1
	cmp r5, #5
	ble _080685EA
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068684: .4byte 0x02024190
	thumb_func_end SetDeoxysStats

	thumb_func_start sub_08068688
sub_08068688: @ 0x08068688
	push {lr}
	ldr r0, _080686A4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080686AC
	ldr r0, _080686A8
	ldrb r1, [r0]
	movs r0, #1
	eors r0, r1
	b _080686B8
	.align 2, 0
_080686A4: .4byte 0x02022C90
_080686A8: .4byte 0x0203C480
_080686AC:
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080686B8:
	ldr r3, _080686E8
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r3, #4
	adds r0, r1, r0
	ldr r2, [r0]
	movs r0, #7
	ands r2, r0
	adds r1, r1, r3
	ldrb r0, [r1, #0x13]
	lsls r0, r0, #3
	orrs r2, r0
	ldr r0, _080686EC
	lsls r2, r2, #1
	adds r2, r2, r0
	ldrh r0, [r2]
	bl FacilityClassToPicIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080686E8: .4byte 0x020226A0
_080686EC: .4byte 0x082FA6E2
	thumb_func_end sub_08068688

	thumb_func_start sub_080686F0
sub_080686F0: @ 0x080686F0
	push {lr}
	ldr r0, _0806870C
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08068714
	ldr r0, _08068710
	ldrb r1, [r0]
	movs r0, #1
	eors r0, r1
	b _08068720
	.align 2, 0
_0806870C: .4byte 0x02022C90
_08068710: .4byte 0x0203C480
_08068714:
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08068720:
	ldr r3, _0806874C
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r3, #4
	adds r0, r1, r0
	ldr r2, [r0]
	movs r0, #7
	ands r2, r0
	adds r1, r1, r3
	ldrb r0, [r1, #0x13]
	lsls r0, r0, #3
	orrs r2, r0
	ldr r1, _08068750
	ldr r0, _08068754
	lsls r2, r2, #1
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0806874C: .4byte 0x020226A0
_08068750: .4byte 0x082EFF52
_08068754: .4byte 0x082FA6E2
	thumb_func_end sub_080686F0

	thumb_func_start CreateObedientEnemyMon
CreateObedientEnemyMon: @ 0x08068758
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r0, _080687A8
	ldrh r5, [r0]
	ldr r0, _080687AC
	ldrh r4, [r0]
	ldr r0, _080687B0
	ldrh r6, [r0]
	bl ZeroEnemyPartyMons
	ldr r7, _080687B4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x20
	bl CreateObedientMon
	cmp r6, #0
	beq _080687A0
	add r0, sp, #0x10
	strb r6, [r0]
	adds r1, r0, #0
	asrs r0, r6, #8
	strb r0, [r1, #1]
	adds r0, r7, #0
	movs r1, #0xc
	add r2, sp, #0x10
	bl SetMonData
_080687A0:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080687A8: .4byte 0x02037280
_080687AC: .4byte 0x02037282
_080687B0: .4byte 0x02037284
_080687B4: .4byte 0x020243E8
	thumb_func_end CreateObedientEnemyMon

	thumb_func_start CalculateBoxMonChecksum
CalculateBoxMonChecksum: @ 0x080687B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r6, #0
	ldr r1, [r4]
	movs r2, #0
	bl GetSubstruct
	adds r5, r0, #0
	ldr r1, [r4]
	adds r0, r4, #0
	movs r2, #1
	bl GetSubstruct
	adds r7, r0, #0
	ldr r1, [r4]
	adds r0, r4, #0
	movs r2, #2
	bl GetSubstruct
	mov r8, r0
	ldr r1, [r4]
	adds r0, r4, #0
	movs r2, #3
	bl GetSubstruct
	adds r3, r0, #0
	movs r1, #5
_080687F2:
	ldrh r0, [r5]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080687F2
	adds r2, r7, #0
	movs r1, #5
_08068806:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08068806
	mov r2, r8
	movs r1, #5
_0806881A:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0806881A
	adds r2, r3, #0
	movs r1, #5
_0806882E:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0806882E
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CalculateBoxMonChecksum

	thumb_func_start CalculateMonStats
CalculateMonStats: @ 0x0806884C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	adds r5, r0, #0
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	mov r8, r0
	adds r0, r5, #0
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	movs r1, #0x27
	movs r2, #0
	bl GetMonData
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0x1a
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0
	bl GetMonData
	mov sl, r0
	adds r0, r5, #0
	movs r1, #0x1b
	movs r2, #0
	bl GetMonData
	mov sb, r0
	adds r0, r5, #0
	movs r1, #0x29
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x20]
	adds r0, r5, #0
	movs r1, #0x1c
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x24]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x28]
	adds r0, r5, #0
	movs r1, #0x1d
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x2c]
	adds r0, r5, #0
	movs r1, #0x2b
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x30]
	adds r0, r5, #0
	movs r1, #0x1e
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x34]
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x38]
	adds r0, r5, #0
	movs r1, #0x1f
	movs r2, #0
	bl GetMonData
	str r0, [sp, #0x3c]
	adds r0, r5, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r5, #0
	bl GetLevelFromMonExp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x38
	mov r2, sp
	bl SetMonData
	ldr r0, _08068934
	cmp r7, r0
	bne _08068938
	movs r0, #1
	str r0, [sp, #4]
	lsls r6, r7, #3
	b _08068966
	.align 2, 0
_08068934: .4byte 0x0000012F
_08068938:
	ldr r1, _08068B04
	lsls r2, r7, #3
	subs r0, r2, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r0, r6
	adds r0, r4, #0
	adds r6, r2, #0
	cmp r0, #0
	bge _08068952
	adds r0, #3
_08068952:
	asrs r0, r0, #2
	adds r0, r1, r0
	ldr r4, [sp]
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, r0, r4
	adds r0, #0xa
	str r0, [sp, #4]
_08068966:
	ldr r1, _08068B08
	add r2, sp, #4
	ldrb r0, [r2]
	mov r3, r8
	subs r0, r0, r3
	adds r1, #0x23
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806897E
	movs r0, #1
	strb r0, [r1]
_0806897E:
	adds r0, r5, #0
	movs r1, #0x3a
	bl SetMonData
	ldr r0, _08068B04
	subs r1, r6, r7
	lsls r1, r1, #2
	adds r6, r1, r0
	ldrb r0, [r6, #1]
	lsls r0, r0, #1
	mov r2, sl
	adds r1, r0, r2
	mov r0, sb
	cmp r0, #0
	bge _0806899E
	adds r0, #3
_0806899E:
	asrs r0, r0, #2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, #5
	str r0, [sp, #8]
	adds r0, r5, #0
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r4, sp, #8
	ldrh r1, [r4]
	movs r2, #1
	bl ModifyStatByNature
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0x3b
	adds r2, r4, #0
	bl SetMonData
	ldrb r0, [r6, #2]
	lsls r0, r0, #1
	ldr r3, [sp, #0x20]
	adds r1, r0, r3
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bge _080689E4
	adds r0, #3
_080689E4:
	asrs r0, r0, #2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, #5
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r4, sp, #0xc
	ldrh r1, [r4]
	movs r2, #2
	bl ModifyStatByNature
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #0x3c
	adds r2, r4, #0
	bl SetMonData
	ldrb r0, [r6, #3]
	lsls r0, r0, #1
	ldr r2, [sp, #0x28]
	adds r1, r0, r2
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bge _08068A2A
	adds r0, #3
_08068A2A:
	asrs r0, r0, #2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, #5
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r4, sp, #0x10
	ldrh r1, [r4]
	movs r2, #3
	bl ModifyStatByNature
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #0x3d
	adds r2, r4, #0
	bl SetMonData
	ldrb r0, [r6, #4]
	lsls r0, r0, #1
	ldr r3, [sp, #0x30]
	adds r1, r0, r3
	ldr r0, [sp, #0x34]
	cmp r0, #0
	bge _08068A70
	adds r0, #3
_08068A70:
	asrs r0, r0, #2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, #5
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r4, sp, #0x14
	ldrh r1, [r4]
	movs r2, #4
	bl ModifyStatByNature
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #0x3e
	adds r2, r4, #0
	bl SetMonData
	ldrb r0, [r6, #5]
	lsls r0, r0, #1
	ldr r2, [sp, #0x38]
	adds r1, r0, r2
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bge _08068AB6
	adds r0, #3
_08068AB6:
	asrs r0, r0, #2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, #5
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r4, sp, #0x18
	ldrh r1, [r4]
	movs r2, #5
	bl ModifyStatByNature
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	adds r0, r5, #0
	movs r1, #0x3f
	adds r2, r4, #0
	bl SetMonData
	ldr r0, _08068B0C
	cmp r7, r0
	bne _08068B10
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _08068AFE
	mov r3, r8
	cmp r3, #0
	bne _08068B34
_08068AFE:
	movs r0, #1
	b _08068B28
	.align 2, 0
_08068B04: .4byte 0x082F0D54
_08068B08: .4byte 0x02024118
_08068B0C: .4byte 0x0000012F
_08068B10:
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	bne _08068B20
	mov r0, r8
	cmp r0, #0
	bne _08068B34
	ldr r0, [sp, #4]
	b _08068B28
_08068B20:
	ldr r0, [sp, #4]
	mov r2, r8
	subs r0, r0, r2
	adds r0, r1, r0
_08068B28:
	str r0, [sp, #0x1c]
	add r2, sp, #0x1c
	adds r0, r5, #0
	movs r1, #0x39
	bl SetMonData
_08068B34:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end CalculateMonStats

	thumb_func_start BoxMonToMon
BoxMonToMon: @ 0x08068B44
	push {r4, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r4, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x50
	bl memcpy
	adds r0, r4, #0
	movs r1, #0x37
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x39
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3a
	mov r2, sp
	bl SetMonData
	movs r0, #0xff
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x40
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	bl CalculateMonStats
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BoxMonToMon

	thumb_func_start GetLevelFromMonExp
GetLevelFromMonExp: @ 0x08068B94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x19
	movs r2, #0
	bl GetMonData
	adds r3, r0, #0
	movs r2, #1
	ldr r6, _08068BF8
	ldr r1, _08068BFC
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #0x13]
	movs r5, #0xca
	lsls r5, r5, #1
	muls r0, r5, r0
	adds r0, #4
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, r3
	bhi _08068BEA
	adds r4, r1, #0
_08068BD4:
	adds r2, #1
	cmp r2, #0x64
	bgt _08068BEA
	lsls r1, r2, #2
	ldrb r0, [r4, #0x13]
	muls r0, r5, r0
	adds r1, r1, r0
	adds r1, r1, r6
	ldr r0, [r1]
	cmp r0, r3
	bls _08068BD4
_08068BEA:
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068BF8: .4byte 0x082F00B4
_08068BFC: .4byte 0x082F0D54
	thumb_func_end GetLevelFromMonExp

	thumb_func_start GetLevelFromBoxMonExp
GetLevelFromBoxMonExp: @ 0x08068C00
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0xb
	movs r2, #0
	bl GetBoxMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x19
	movs r2, #0
	bl GetBoxMonData
	adds r3, r0, #0
	movs r2, #1
	ldr r6, _08068C64
	ldr r1, _08068C68
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #0x13]
	movs r5, #0xca
	lsls r5, r5, #1
	muls r0, r5, r0
	adds r0, #4
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, r3
	bhi _08068C56
	adds r4, r1, #0
_08068C40:
	adds r2, #1
	cmp r2, #0x64
	bgt _08068C56
	lsls r1, r2, #2
	ldrb r0, [r4, #0x13]
	muls r0, r5, r0
	adds r1, r1, r0
	adds r1, r1, r6
	ldr r0, [r1]
	cmp r0, r3
	bls _08068C40
_08068C56:
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068C64: .4byte 0x082F00B4
_08068C68: .4byte 0x082F0D54
	thumb_func_end GetLevelFromBoxMonExp

	thumb_func_start GiveMoveToMon
GiveMoveToMon: @ 0x08068C6C
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl GiveMoveToBoxMon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GiveMoveToMon

	thumb_func_start GiveMoveToBoxMon
GiveMoveToBoxMon: @ 0x08068C80
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	mov r0, sp
	strh r1, [r0]
	movs r5, #0
	mov r6, sp
_08068C8E:
	adds r4, r5, #0
	adds r4, #0xd
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0
	bl GetBoxMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08068CCC
	adds r0, r7, #0
	adds r1, r4, #0
	mov r2, sp
	bl SetBoxMonData
	adds r1, r5, #0
	adds r1, #0x11
	ldrh r0, [r6]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08068CC8
	adds r2, r2, r0
	adds r0, r7, #0
	bl SetBoxMonData
	ldrh r0, [r6]
	b _08068CE4
	.align 2, 0
_08068CC8: .4byte 0x082ED224
_08068CCC:
	ldrh r1, [r6]
	cmp r0, r1
	bne _08068CDC
	ldr r0, _08068CD8
	b _08068CE4
	.align 2, 0
_08068CD8: .4byte 0x0000FFFE
_08068CDC:
	adds r5, #1
	cmp r5, #3
	ble _08068C8E
	ldr r0, _08068CEC
_08068CE4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08068CEC: .4byte 0x0000FFFF
	thumb_func_end GiveMoveToBoxMon

	thumb_func_start GiveMoveToBattleMon
GiveMoveToBattleMon: @ 0x08068CF0
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r3, #0
	adds r5, r0, #0
	adds r5, #0x24
	ldr r2, _08068D1C
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r2, r1, r2
	adds r1, r0, #0
	adds r1, #0xc
_08068D0A:
	ldrh r0, [r1]
	cmp r0, #0
	bne _08068D20
	strh r4, [r1]
	adds r1, r5, r3
	ldrb r0, [r2, #4]
	strb r0, [r1]
	adds r0, r4, #0
	b _08068D2A
	.align 2, 0
_08068D1C: .4byte 0x082ED220
_08068D20:
	adds r1, #2
	adds r3, #1
	cmp r3, #3
	ble _08068D0A
	ldr r0, _08068D30
_08068D2A:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08068D30: .4byte 0x0000FFFF
	thumb_func_end GiveMoveToBattleMon

	thumb_func_start SetMonMoveSlot
SetMonMoveSlot: @ 0x08068D34
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r2, #0
	mov r0, sp
	strh r1, [r0]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r5, #0
	mov r2, sp
	bl SetMonData
	adds r4, #0x11
	mov r0, sp
	ldrh r0, [r0]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08068D70
	adds r2, r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetMonData
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068D70: .4byte 0x082ED224
	thumb_func_end SetMonMoveSlot

	thumb_func_start SetBattleMonMoveSlot
SetBattleMonMoveSlot: @ 0x08068D74
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r2, #1
	adds r3, r0, #0
	adds r3, #0xc
	adds r3, r3, r4
	strh r1, [r3]
	adds r0, #0x24
	adds r0, r0, r2
	ldr r3, _08068DA0
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrb r1, [r2, #4]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068DA0: .4byte 0x082ED220
	thumb_func_end SetBattleMonMoveSlot

	thumb_func_start MonRestorePP
MonRestorePP: @ 0x08068DA4
	push {lr}
	bl GiveBoxMonInitialMoveset
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MonRestorePP

	thumb_func_start GiveBoxMonInitialMoveset
GiveBoxMonInitialMoveset: @ 0x08068DB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	movs r1, #0xb
	movs r2, #0
	bl GetBoxMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	bl GetLevelFromBoxMonExp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08068E4C
	lsls r6, r4, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrh r1, [r0]
	ldr r2, _08068E50
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _08068E3C
	mov sb, r2
	movs r3, #0
_08068DEE:
	ldr r0, _08068E4C
	adds r7, r6, r0
	ldr r0, [r7]
	adds r0, r3, r0
	ldrh r2, [r0]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r0, r2
	mov r4, sl
	lsls r1, r4, #9
	cmp r0, r1
	bgt _08068E3C
	ldr r1, _08068E54
	adds r0, r1, #0
	adds r4, r0, #0
	ands r4, r2
	mov r0, r8
	adds r1, r4, #0
	str r3, [sp]
	bl GiveMoveToBoxMon
	lsls r0, r0, #0x10
	mov r1, sb
	lsrs r5, r1, #0x10
	ldr r3, [sp]
	cmp r0, sb
	bne _08068E30
	mov r0, r8
	adds r1, r4, #0
	bl DeleteFirstMoveAndGiveMoveToBoxMon
	ldr r3, [sp]
_08068E30:
	adds r3, #2
	ldr r0, [r7]
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, r5
	bne _08068DEE
_08068E3C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068E4C: .4byte 0x082F9D04
_08068E50: .4byte 0xFFFF0000
_08068E54: .4byte 0x000001FF
	thumb_func_end GiveBoxMonInitialMoveset

	thumb_func_start MonTryLearningNewMove
MonTryLearningNewMove: @ 0x08068E58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	str r0, [sp]
	mov r0, r8
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r0, r8
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r4, #0
	beq _08068EF0
	ldr r4, _08068EDC
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r4]
	ldr r2, _08068EE0
	mov r5, sb
	lsls r3, r5, #2
	adds r5, r3, r2
	ldr r0, [r5]
	ldrh r1, [r0]
	movs r7, #0xfe
	lsls r7, r7, #8
	adds r0, r7, #0
	ands r0, r1
	adds r6, r4, #0
	mov ip, r2
	mov r1, sl
	lsls r4, r1, #9
	cmp r0, r4
	beq _08068F18
	adds r2, r6, #0
	ldr r0, _08068EE4
	mov ip, r0
	adds r6, r7, #0
	adds r3, r5, #0
_08068EC4:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	ldr r1, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, ip
	bne _08068EE8
	movs r0, #0
	b _08068F44
	.align 2, 0
_08068EDC: .4byte 0x0202418C
_08068EE0: .4byte 0x082F9D04
_08068EE4: .4byte 0x0000FFFF
_08068EE8:
	adds r0, r6, #0
	ands r0, r1
	cmp r0, r4
	bne _08068EC4
_08068EF0:
	ldr r3, _08068F54
	mov r1, sb
	lsls r4, r1, #2
	adds r1, r4, r3
	ldr r2, _08068F58
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0xfe
	lsls r0, r0, #8
	ands r0, r1
	mov r5, sl
	lsls r1, r5, #9
	adds r6, r2, #0
	mov ip, r3
	adds r3, r4, #0
	cmp r0, r1
	bne _08068F42
_08068F18:
	ldr r2, _08068F5C
	mov r0, ip
	adds r1, r3, r0
	ldrb r0, [r6]
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08068F60
	ands r0, r1
	strh r0, [r2]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrh r1, [r2]
	mov r0, r8
	bl GiveMoveToMon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
_08068F42:
	ldr r0, [sp]
_08068F44:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08068F54: .4byte 0x082F9D04
_08068F58: .4byte 0x0202418C
_08068F5C: .4byte 0x02024186
_08068F60: .4byte 0x000001FF
	thumb_func_end MonTryLearningNewMove

	thumb_func_start DeleteFirstMoveAndGiveMoveToMon
DeleteFirstMoveAndGiveMoveToMon: @ 0x08068F64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r4, #0
	add r7, sp, #8
	add r0, sp, #0xc
	mov sb, r0
	mov r5, sp
_08068F80:
	adds r1, r4, #0
	adds r1, #0xe
	adds r0, r6, #0
	movs r2, #0
	bl GetMonData
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x12
	adds r0, r6, #0
	movs r2, #0
	bl GetMonData
	adds r1, r7, r4
	strb r0, [r1]
	adds r5, #2
	adds r4, #1
	cmp r4, #2
	ble _08068F80
	adds r0, r6, #0
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	mov r1, sb
	strb r0, [r1]
	ldrb r0, [r1]
	lsrs r0, r0, #2
	strb r0, [r1]
	mov r0, sp
	mov r2, r8
	strh r2, [r0, #6]
	ldr r1, _0806900C
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	strb r0, [r7, #3]
	movs r4, #0
	mov r5, sp
_08068FD4:
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r6, #0
	adds r2, r5, #0
	bl SetMonData
	adds r1, r4, #0
	adds r1, #0x11
	adds r2, r7, r4
	adds r0, r6, #0
	bl SetMonData
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _08068FD4
	adds r0, r6, #0
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806900C: .4byte 0x082ED220
	thumb_func_end DeleteFirstMoveAndGiveMoveToMon

	thumb_func_start DeleteFirstMoveAndGiveMoveToBoxMon
DeleteFirstMoveAndGiveMoveToBoxMon: @ 0x08069010
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r4, #0
	add r7, sp, #8
	add r0, sp, #0xc
	mov sb, r0
	mov r5, sp
_0806902C:
	adds r1, r4, #0
	adds r1, #0xe
	adds r0, r6, #0
	movs r2, #0
	bl GetBoxMonData
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x12
	adds r0, r6, #0
	movs r2, #0
	bl GetBoxMonData
	adds r1, r7, r4
	strb r0, [r1]
	adds r5, #2
	adds r4, #1
	cmp r4, #2
	ble _0806902C
	adds r0, r6, #0
	movs r1, #0x15
	movs r2, #0
	bl GetBoxMonData
	mov r1, sb
	strb r0, [r1]
	ldrb r0, [r1]
	lsrs r0, r0, #2
	strb r0, [r1]
	mov r0, sp
	mov r2, r8
	strh r2, [r0, #6]
	ldr r1, _080690B8
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	strb r0, [r7, #3]
	movs r4, #0
	mov r5, sp
_08069080:
	adds r1, r4, #0
	adds r1, #0xd
	adds r0, r6, #0
	adds r2, r5, #0
	bl SetBoxMonData
	adds r1, r4, #0
	adds r1, #0x11
	adds r2, r7, r4
	adds r0, r6, #0
	bl SetBoxMonData
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _08069080
	adds r0, r6, #0
	movs r1, #0x15
	mov r2, sb
	bl SetBoxMonData
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080690B8: .4byte 0x082ED220
	thumb_func_end DeleteFirstMoveAndGiveMoveToBoxMon

	thumb_func_start CalculateBaseDamage
CalculateBaseDamage: @ 0x080690BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r6, r0, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x58]
	ldr r4, [sp, #0x5c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0xc]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x14]
	movs r5, #0
	cmp r3, #0
	bne _08069114
	ldr r2, _0806910C
	ldr r1, _08069110
	ldr r3, [sp, #8]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	strh r0, [r2]
	b _08069118
	.align 2, 0
_0806910C: .4byte 0x02024184
_08069110: .4byte 0x082ED220
_08069114:
	ldr r0, _08069130
	strh r3, [r0]
_08069118:
	cmp r7, #0
	bne _08069138
	ldr r1, _08069134
	ldr r7, [sp, #8]
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	mov sl, r0
	b _08069142
	.align 2, 0
_08069130: .4byte 0x02024184
_08069134: .4byte 0x082ED220
_08069138:
	movs r0, #0x3f
	mov sl, r0
	mov r1, sl
	ands r1, r7
	mov sl, r1
_08069142:
	ldrh r7, [r6, #2]
	ldr r2, [sp, #4]
	ldrh r2, [r2, #4]
	str r2, [sp, #0x18]
	ldrh r3, [r6, #8]
	mov r8, r3
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0xa]
	str r0, [sp, #0x1c]
	ldrh r0, [r6, #0x2e]
	cmp r0, #0xaf
	bne _08069174
	ldr r1, _08069170
	ldr r2, [sp, #0x10]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r3, [r0, #7]
	mov sb, r3
	ldrb r0, [r0, #0x1a]
	b _0806918A
	.align 2, 0
_08069170: .4byte 0x020240A8
_08069174:
	ldrh r0, [r6, #0x2e]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldrh r0, [r6, #0x2e]
	bl sub_080D6D1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806918A:
	str r0, [sp, #0x24]
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2e]
	cmp r0, #0xaf
	bne _080691BE
	ldr r1, _080691A8
	ldr r2, [sp, #0x14]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	str r0, [sp, #0x20]
	b _080691D4
	.align 2, 0
_080691A8: .4byte 0x020240A8
_080691AC:
	ldr r0, [sp, #0x24]
	adds r0, #0x64
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _080692BC
_080691BE:
	ldr r3, [sp, #4]
	ldrh r0, [r3, #0x2e]
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2e]
	bl sub_080D6D1C
_080691D4:
	adds r0, r6, #0
	adds r0, #0x20
	ldrb r1, [r0]
	str r0, [sp, #0x28]
	cmp r1, #0x25
	beq _080691E4
	cmp r1, #0x4a
	bne _080691E8
_080691E4:
	lsls r0, r7, #0x11
	lsrs r7, r0, #0x10
_080691E8:
	ldr r0, _080692A4
	ldr r1, [sp, #0x10]
	bl ShouldGetStatBadgeBoost
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08069204
	movs r0, #0x6e
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08069204:
	ldr r0, _080692A8
	ldr r1, [sp, #0x14]
	bl ShouldGetStatBadgeBoost
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08069224
	movs r0, #0x6e
	ldr r2, [sp, #0x18]
	muls r0, r2, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
_08069224:
	ldr r4, _080692AC
	adds r0, r4, #0
	ldr r1, [sp, #0x10]
	bl ShouldGetStatBadgeBoost
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08069248
	movs r0, #0x6e
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08069248:
	adds r0, r4, #0
	ldr r1, [sp, #0x14]
	bl ShouldGetStatBadgeBoost
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08069268
	movs r0, #0x6e
	ldr r1, [sp, #0x1c]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
_08069268:
	movs r2, #0
	ldr r4, _080692B0
	ldr r3, [sp, #4]
	adds r3, #0x20
	str r3, [sp, #0x2c]
	adds r3, r4, #0
_08069274:
	lsls r1, r2, #1
	ldrb r0, [r3]
	cmp sb, r0
	bne _080692B4
	adds r0, r4, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp sl, r0
	bne _080692B4
	mov r1, sl
	cmp r1, #8
	bls _080691AC
	ldr r0, [sp, #0x24]
	adds r0, #0x64
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	b _080692BC
	.align 2, 0
_080692A4: .4byte 0x00000867
_080692A8: .4byte 0x0000086B
_080692AC: .4byte 0x0000086D
_080692B0: .4byte 0x082FA702
_080692B4:
	adds r3, #2
	adds r2, #1
	cmp r2, #0x10
	bls _08069274
_080692BC:
	mov r3, sb
	cmp r3, #0x1d
	bne _080692D0
	movs r0, #0x96
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_080692D0:
	mov r0, sb
	cmp r0, #0x22
	bne _08069306
	ldr r0, _080695B8
	ldr r0, [r0]
	ldr r1, _080695BC
	ands r0, r1
	cmp r0, #0
	bne _08069306
	ldr r1, _080695C0
	adds r0, r1, #0
	ldrh r2, [r6]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08069306
	movs r0, #0x96
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08069306:
	ldr r0, [sp, #0x20]
	cmp r0, #0x22
	bne _0806933C
	ldr r0, _080695B8
	ldr r0, [r0]
	ldr r1, _080695BC
	ands r0, r1
	cmp r0, #0
	bne _0806933C
	ldr r1, _080695C0
	adds r0, r1, #0
	ldr r2, [sp, #4]
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0806933C
	movs r0, #0x96
	ldr r3, [sp, #0x1c]
	muls r0, r3, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
_0806933C:
	mov r0, sb
	cmp r0, #0x23
	bne _08069352
	ldrh r1, [r6]
	ldr r0, _080695C4
	cmp r1, r0
	bne _08069352
	mov r1, r8
	lsls r0, r1, #0x11
	lsrs r0, r0, #0x10
	mov r8, r0
_08069352:
	ldr r2, [sp, #0x20]
	cmp r2, #0x24
	bne _0806936A
	ldr r3, [sp, #4]
	ldrh r1, [r3]
	ldr r0, _080695C4
	cmp r1, r0
	bne _0806936A
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #0x11
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
_0806936A:
	mov r2, sb
	cmp r2, #0x2d
	bne _0806937E
	ldrh r0, [r6]
	cmp r0, #0x19
	bne _0806937E
	mov r3, r8
	lsls r0, r3, #0x11
	lsrs r0, r0, #0x10
	mov r8, r0
_0806937E:
	ldr r0, [sp, #0x20]
	cmp r0, #0x40
	bne _08069394
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	cmp r0, #0x84
	bne _08069394
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x11
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
_08069394:
	mov r3, sb
	cmp r3, #0x41
	bne _080693AA
	ldrh r0, [r6]
	subs r0, #0x68
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080693AA
	lsls r0, r7, #0x11
	lsrs r7, r0, #0x10
_080693AA:
	ldr r1, [sp, #0x2c]
	ldrb r0, [r1]
	cmp r0, #0x2f
	bne _080693C2
	mov r2, sl
	cmp r2, #0xa
	beq _080693BC
	cmp r2, #0xf
	bne _080693C2
_080693BC:
	mov r3, r8
	lsrs r3, r3, #1
	mov r8, r3
_080693C2:
	ldr r0, [sp, #0x28]
	ldrb r4, [r0]
	cmp r4, #0x37
	bne _080693D8
	movs r0, #0x96
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_080693D8:
	cmp r4, #0x39
	bne _08069406
	movs r0, #0
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0x3a
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08069406
	movs r0, #0x96
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08069406:
	ldr r2, [sp, #0x28]
	ldrb r0, [r2]
	cmp r0, #0x3a
	bne _08069438
	movs r0, #0
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0x39
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08069438
	movs r0, #0x96
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08069438:
	ldr r1, [sp, #0x28]
	ldrb r0, [r1]
	cmp r0, #0x3e
	bne _08069454
	ldr r0, [r6, #0x4c]
	cmp r0, #0
	beq _08069454
	movs r0, #0x96
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08069454:
	ldr r2, [sp, #0x2c]
	ldrb r0, [r2]
	cmp r0, #0x3f
	bne _08069476
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	beq _08069476
	movs r0, #0x96
	ldr r1, [sp, #0x18]
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
_08069476:
	mov r2, sl
	cmp r2, #0xd
	bne _0806949A
	movs r0, #0
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0
	movs r3, #0xfd
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806949A
	ldr r1, _080695C8
	ldrh r0, [r1]
	lsrs r0, r0, #1
	strh r0, [r1]
_0806949A:
	mov r3, sl
	cmp r3, #0xa
	bne _080694BE
	movs r0, #0
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0
	movs r3, #0xfe
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080694BE
	ldr r1, _080695C8
	ldrh r0, [r1]
	lsrs r0, r0, #1
	strh r0, [r1]
_080694BE:
	mov r0, sl
	cmp r0, #0xc
	bne _080694EE
	ldr r1, [sp, #0x28]
	ldrb r0, [r1]
	cmp r0, #0x41
	bne _080694EE
	ldrh r0, [r6, #0x2c]
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r6, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _080694EE
	ldr r4, _080695C8
	ldrh r1, [r4]
	movs r0, #0x96
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_080694EE:
	mov r2, sl
	cmp r2, #0xa
	bne _0806951E
	ldr r3, [sp, #0x28]
	ldrb r0, [r3]
	cmp r0, #0x42
	bne _0806951E
	ldrh r0, [r6, #0x2c]
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r6, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _0806951E
	ldr r4, _080695C8
	ldrh r1, [r4]
	movs r0, #0x96
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_0806951E:
	mov r0, sl
	cmp r0, #0xb
	bne _0806954E
	ldr r1, [sp, #0x28]
	ldrb r0, [r1]
	cmp r0, #0x43
	bne _0806954E
	ldrh r0, [r6, #0x2c]
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r6, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _0806954E
	ldr r4, _080695C8
	ldrh r1, [r4]
	movs r0, #0x96
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_0806954E:
	mov r2, sl
	cmp r2, #6
	bne _0806957E
	ldr r3, [sp, #0x28]
	ldrb r0, [r3]
	cmp r0, #0x44
	bne _0806957E
	ldrh r0, [r6, #0x2c]
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r6, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _0806957E
	ldr r4, _080695C8
	ldrh r1, [r4]
	movs r0, #0x96
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_0806957E:
	ldr r2, _080695CC
	ldr r0, _080695D0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #7
	bne _08069598
	ldr r0, [sp, #0x18]
	lsrs r0, r0, #1
	str r0, [sp, #0x18]
_08069598:
	mov r1, sl
	cmp r1, #8
	bls _080695A0
	b _08069702
_080695A0:
	ldr r0, _080695D4
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #2
	bne _080695E0
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	cmp r0, #6
	ble _080695DC
	ldr r2, _080695D8
	b _080695E6
	.align 2, 0
_080695B8: .4byte 0x02022C90
_080695BC: .4byte 0x003F0100
_080695C0: .4byte 0xFFFFFE69
_080695C4: .4byte 0x00000175
_080695C8: .4byte 0x02024184
_080695CC: .4byte 0x082ED220
_080695D0: .4byte 0x02023E8E
_080695D4: .4byte 0x02023EB5
_080695D8: .4byte 0x082FA6B6
_080695DC:
	adds r5, r7, #0
	b _080695FE
_080695E0:
	ldr r2, _08069630
	movs r0, #0x19
	ldrsb r0, [r6, r0]
_080695E6:
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r5, r7, #0
	muls r5, r1, r5
	adds r2, #1
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r5, #0
	bl __divsi3
	adds r5, r0, #0
_080695FE:
	ldr r0, _08069634
	ldrh r0, [r0]
	muls r5, r0, r5
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #1
	movs r1, #5
	bl __divsi3
	adds r0, #2
	muls r5, r0, r5
	ldrb r0, [r4]
	cmp r0, #2
	bne _0806963C
	ldr r2, [sp, #4]
	movs r0, #0x1a
	ldrsb r0, [r2, r0]
	cmp r0, #5
	bgt _08069638
	ldr r2, _08069630
	ldr r3, [sp, #4]
	movs r0, #0x1a
	ldrsb r0, [r3, r0]
	b _08069644
	.align 2, 0
_08069630: .4byte 0x082FA6B6
_08069634: .4byte 0x02024184
_08069638:
	ldr r3, [sp, #0x18]
	b _0806965E
_0806963C:
	ldr r2, _080696BC
	ldr r1, [sp, #4]
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
_08069644:
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r7, [sp, #0x18]
	adds r3, r7, #0
	muls r3, r1, r3
	adds r2, #1
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r3, #0
	bl __divsi3
	adds r3, r0, #0
_0806965E:
	adds r0, r5, #0
	adds r1, r3, #0
	bl __divsi3
	adds r5, r0, #0
	movs r1, #0x32
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r6, #0x4c]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08069688
	ldr r1, [sp, #0x28]
	ldrb r0, [r1]
	cmp r0, #0x3e
	beq _08069688
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r5, r0, #1
_08069688:
	movs r0, #1
	ldr r2, [sp, #0xc]
	ands r0, r2
	cmp r0, #0
	beq _080696CA
	ldrb r1, [r4]
	cmp r1, #1
	bne _080696CA
	ldr r0, _080696C0
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080696C4
	movs r0, #2
	bl CountAliveMonsInBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _080696C4
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r5, r0, #1
	b _080696CA
	.align 2, 0
_080696BC: .4byte 0x082FA6B6
_080696C0: .4byte 0x02022C90
_080696C4:
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r5, r0, #1
_080696CA:
	ldr r0, _08069728
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080696FC
	ldr r0, _0806972C
	ldr r3, [sp, #8]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #6]
	cmp r0, #8
	bne _080696FC
	movs r0, #2
	bl CountAliveMonsInBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _080696FC
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r5, r0, #1
_080696FC:
	cmp r5, #0
	bne _08069702
	movs r5, #1
_08069702:
	mov r7, sl
	cmp r7, #9
	bne _0806970A
	movs r5, #0
_0806970A:
	mov r0, sl
	cmp r0, #9
	bhi _08069712
	b _08069914
_08069712:
	ldr r0, _08069730
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #2
	bne _0806973C
	movs r0, #0x1c
	ldrsb r0, [r6, r0]
	cmp r0, #6
	ble _08069738
	ldr r2, _08069734
	b _08069742
	.align 2, 0
_08069728: .4byte 0x02022C90
_0806972C: .4byte 0x082ED220
_08069730: .4byte 0x02023EB5
_08069734: .4byte 0x082FA6B6
_08069738:
	mov r5, r8
	b _0806975A
_0806973C:
	ldr r2, _08069788
	movs r0, #0x1c
	ldrsb r0, [r6, r0]
_08069742:
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	mov r5, r8
	muls r5, r1, r5
	adds r2, #1
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r5, #0
	bl __divsi3
	adds r5, r0, #0
_0806975A:
	ldr r0, _0806978C
	ldrh r0, [r0]
	muls r5, r0, r5
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #1
	movs r1, #5
	bl __divsi3
	adds r0, #2
	muls r5, r0, r5
	ldrb r0, [r4]
	cmp r0, #2
	bne _08069794
	ldr r1, [sp, #4]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	cmp r0, #5
	bgt _08069790
	ldr r2, _08069788
	b _0806979C
	.align 2, 0
_08069788: .4byte 0x082FA6B6
_0806978C: .4byte 0x02024184
_08069790:
	ldr r3, [sp, #0x1c]
	b _080697B6
_08069794:
	ldr r2, _080697FC
	ldr r7, [sp, #4]
	movs r0, #0x1d
	ldrsb r0, [r7, r0]
_0806979C:
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r6, [sp, #0x1c]
	adds r3, r6, #0
	muls r3, r1, r3
	adds r2, #1
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r3, #0
	bl __divsi3
	adds r3, r0, #0
_080697B6:
	adds r0, r5, #0
	adds r1, r3, #0
	bl __divsi3
	adds r5, r0, #0
	movs r1, #0x32
	bl __divsi3
	adds r5, r0, #0
	movs r0, #2
	ldr r7, [sp, #0xc]
	ands r0, r7
	cmp r0, #0
	beq _0806980A
	ldrb r1, [r4]
	cmp r1, #1
	bne _0806980A
	ldr r0, _08069800
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08069804
	movs r0, #2
	bl CountAliveMonsInBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08069804
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r5, r0, #1
	b _0806980A
	.align 2, 0
_080697FC: .4byte 0x082FA6B6
_08069800: .4byte 0x02022C90
_08069804:
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r5, r0, #1
_0806980A:
	ldr r0, _08069884
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806983C
	ldr r0, _08069888
	ldr r2, [sp, #8]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #6]
	cmp r0, #8
	bne _0806983C
	movs r0, #2
	bl CountAliveMonsInBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0806983C
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r5, r0, #1
_0806983C:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0xd
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080698EC
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0x4d
	movs r3, #0
	bl AbilityBattleEffects
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080698EC
	ldr r2, _0806988C
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _080698A4
	mov r3, sl
	cmp r3, #0xa
	beq _08069890
	cmp r3, #0xb
	beq _08069898
	b _080698A4
	.align 2, 0
_08069884: .4byte 0x02022C90
_08069888: .4byte 0x082ED220
_0806988C: .4byte 0x02024070
_08069890:
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r5, r0, #1
	b _080698A4
_08069898:
	lsls r0, r5, #4
	subs r0, r0, r5
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
_080698A4:
	ldrh r1, [r4]
	movs r0, #0x9f
	ands r0, r1
	cmp r0, #0
	beq _080698BC
	ldr r0, _080698D4
	ldrh r0, [r0]
	cmp r0, #0x4c
	bne _080698BC
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r5, r0, #1
_080698BC:
	ldrh r1, [r4]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080698EC
	mov r6, sl
	cmp r6, #0xa
	beq _080698D8
	cmp r6, #0xb
	beq _080698E6
	b _080698EC
	.align 2, 0
_080698D4: .4byte 0x02023E8E
_080698D8:
	lsls r0, r5, #4
	subs r0, r0, r5
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	b _080698EC
_080698E6:
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r5, r0, #1
_080698EC:
	ldr r0, _08069928
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldr r7, [sp, #0x10]
	lsls r1, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08069914
	mov r0, sl
	cmp r0, #0xa
	bne _08069914
	lsls r0, r5, #4
	subs r0, r0, r5
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
_08069914:
	adds r0, r5, #2
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08069928: .4byte 0x0202414C
	thumb_func_end CalculateBaseDamage

	thumb_func_start CountAliveMonsInBattle
CountAliveMonsInBattle: @ 0x0806992C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	movs r6, #0
	cmp r0, #1
	beq _08069980
	cmp r0, #1
	bgt _08069944
	cmp r0, #0
	beq _0806994A
	b _08069A02
_08069944:
	cmp r1, #2
	beq _080699C8
	b _08069A02
_0806994A:
	movs r5, #0
	ldr r0, _08069974
	ldrb r3, [r0]
	ldr r4, _08069978
	ldr r2, _0806997C
_08069954:
	cmp r5, r3
	beq _08069968
	ldrb r0, [r4]
	ldr r1, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08069968
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08069968:
	adds r2, #4
	adds r5, #1
	cmp r5, #3
	ble _08069954
	b _08069A02
	.align 2, 0
_08069974: .4byte 0x02023D08
_08069978: .4byte 0x02023EB4
_0806997C: .4byte 0x082FACB4
_08069980:
	movs r5, #0
_08069982:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r0, _080699BC
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080699B4
	ldr r0, _080699C0
	ldrb r1, [r0]
	ldr r2, _080699C4
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080699B4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080699B4:
	adds r5, #1
	cmp r5, #3
	ble _08069982
	b _08069A02
	.align 2, 0
_080699BC: .4byte 0x02023EAF
_080699C0: .4byte 0x02023EB4
_080699C4: .4byte 0x082FACB4
_080699C8:
	movs r5, #0
_080699CA:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r0, _08069A0C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _080699FC
	ldr r0, _08069A10
	ldrb r1, [r0]
	ldr r2, _08069A14
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080699FC
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080699FC:
	adds r5, #1
	cmp r5, #3
	ble _080699CA
_08069A02:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08069A0C: .4byte 0x02023EB0
_08069A10: .4byte 0x02023EB4
_08069A14: .4byte 0x082FACB4
	thumb_func_end CountAliveMonsInBattle

	thumb_func_start ShouldGetStatBadgeBoost
ShouldGetStatBadgeBoost: @ 0x08069A18
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r4, _08069A60
	ldr r0, [r4]
	ldr r1, _08069A64
	ands r0, r1
	cmp r0, #0
	bne _08069A5C
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08069A5C
	ldr r0, [r4]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08069A50
	ldr r0, _08069A68
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08069A5C
_08069A50:
	adds r0, r5, #0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08069A6C
_08069A5C:
	movs r0, #0
	b _08069A6E
	.align 2, 0
_08069A60: .4byte 0x02022C90
_08069A64: .4byte 0x023F0902
_08069A68: .4byte 0x0203886A
_08069A6C:
	movs r0, #1
_08069A6E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ShouldGetStatBadgeBoost

	thumb_func_start GetDefaultMoveTarget
GetDefaultMoveTarget: @ 0x08069A74
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	movs r1, #1
	movs r6, #1
	adds r4, r6, #0
	ands r4, r0
	eors r4, r1
	adds r5, r4, #0
	ldr r0, _08069A98
	ldr r0, [r0]
	ands r0, r6
	cmp r0, #0
	bne _08069A9C
	adds r0, r4, #0
	b _08069AE6
	.align 2, 0
_08069A98: .4byte 0x02022C90
_08069A9C:
	movs r0, #0
	bl CountAliveMonsInBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08069AC0
	bl Random
	adds r1, r6, #0
	ands r1, r0
	cmp r1, #0
	bne _08069ABC
	movs r0, #2
	eors r0, r4
	b _08069AE6
_08069ABC:
	adds r0, r4, #0
	b _08069AE6
_08069AC0:
	ldr r0, _08069AD8
	ldrb r1, [r0]
	ldr r2, _08069ADC
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08069AE0
	adds r0, r4, #0
	b _08069AE6
	.align 2, 0
_08069AD8: .4byte 0x02023EB4
_08069ADC: .4byte 0x082FACB4
_08069AE0:
	movs r0, #2
	eors r5, r0
	adds r0, r5, #0
_08069AE6:
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetDefaultMoveTarget

	thumb_func_start GetMonGender
GetMonGender: @ 0x08069AF4
	push {lr}
	bl GetBoxMonGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMonGender

	thumb_func_start GetBoxMonGender
GetBoxMonGender: @ 0x08069B04
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0xb
	movs r2, #0
	bl GetBoxMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl GetBoxMonData
	adds r2, r0, #0
	ldr r1, _08069B54
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _08069B5A
	cmp r0, #0
	blt _08069B3C
	cmp r0, #0xff
	bgt _08069B3C
	cmp r0, #0xfe
	bge _08069B5A
_08069B3C:
	ldr r1, _08069B54
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r0, #0xff
	ands r0, r2
	cmp r1, r0
	bhi _08069B58
	movs r0, #0
	b _08069B5A
	.align 2, 0
_08069B54: .4byte 0x082F0D54
_08069B58:
	movs r0, #0xfe
_08069B5A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonGender

	thumb_func_start GetGenderFromSpeciesAndPersonality
GetGenderFromSpeciesAndPersonality: @ 0x08069B60
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08069B9C
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _08069BA2
	cmp r0, #0
	blt _08069B84
	cmp r0, #0xff
	bgt _08069B84
	cmp r0, #0xfe
	bge _08069BA2
_08069B84:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r0, #0xff
	ands r0, r3
	cmp r1, r0
	bhi _08069BA0
	movs r0, #0
	b _08069BA2
	.align 2, 0
_08069B9C: .4byte 0x082F0D54
_08069BA0:
	movs r0, #0xfe
_08069BA2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetGenderFromSpeciesAndPersonality

	thumb_func_start SetMultiuseSpriteTemplateToPokemon
SetMultiuseSpriteTemplateToPokemon: @ 0x08069BA8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _08069BD4
	ldr r2, [r0]
	cmp r2, #0
	beq _08069BDC
	ldr r0, _08069BD8
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r2, r1
	adds r2, r0, #0
	adds r1, #0x14
	ldm r1!, {r3, r6, r7}
	stm r2!, {r3, r6, r7}
	ldm r1!, {r3, r6, r7}
	stm r2!, {r3, r6, r7}
	adds r3, r0, #0
	b _08069C1A
	.align 2, 0
_08069BD4: .4byte 0x02024178
_08069BD8: .4byte 0x02024640
_08069BDC:
	ldr r1, _08069BEC
	ldr r0, [r1]
	cmp r0, #0
	beq _08069BF4
	ldr r3, _08069BF0
	ldr r2, [r0, #0xc]
	b _08069C08
	.align 2, 0
_08069BEC: .4byte 0x02024658
_08069BF0: .4byte 0x02024640
_08069BF4:
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _08069C04
	ldr r3, _08069C00
	ldr r2, [r0, #0xc]
	b _08069C08
	.align 2, 0
_08069C00: .4byte 0x02024640
_08069C04:
	ldr r3, _08069C2C
	ldr r2, _08069C30
_08069C08:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r0, r0, r2
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
_08069C1A:
	adds r2, r3, #0
	strh r5, [r2, #2]
	cmp r4, #0
	beq _08069C26
	cmp r4, #2
	bne _08069C38
_08069C26:
	ldr r0, _08069C34
	str r0, [r2, #8]
	b _08069C62
	.align 2, 0
_08069C2C: .4byte 0x02024640
_08069C30: .4byte 0x082FA724
_08069C34: .4byte 0x082D2F9C
_08069C38:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r5, r0
	bls _08069C58
	ldr r0, _08069C50
	ldr r3, _08069C54
	adds r1, r5, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2, #8]
	b _08069C62
	.align 2, 0
_08069C50: .4byte 0x082DD33C
_08069C54: .4byte 0xFFFFFE0C
_08069C58:
	ldr r0, _08069C68
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r3, #8]
_08069C62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069C68: .4byte 0x082DD33C
	thumb_func_end SetMultiuseSpriteTemplateToPokemon

	thumb_func_start SetMultiuseSpriteTemplateToTrainerBack
SetMultiuseSpriteTemplateToTrainerBack: @ 0x08069C6C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r0, _08069CA4
	strh r4, [r0, #2]
	adds r5, r0, #0
	cmp r3, #0
	beq _08069C84
	cmp r3, #2
	bne _08069CB0
_08069C84:
	ldr r2, _08069CA8
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r5, #0
	adds r0, r0, r2
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r1, _08069CAC
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	b _08069CF0
	.align 2, 0
_08069CA4: .4byte 0x02024640
_08069CA8: .4byte 0x082FA784
_08069CAC: .4byte 0x082D959C
_08069CB0:
	ldr r0, _08069CD0
	ldr r1, [r0]
	cmp r1, #0
	beq _08069CD4
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r1, r0
	adds r1, r5, #0
	adds r0, #0x14
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	b _08069CE8
	.align 2, 0
_08069CD0: .4byte 0x02024178
_08069CD4:
	ldr r0, _08069CF8
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r2, r5, #0
	adds r1, r1, r0
	ldm r1!, {r0, r3, r6}
	stm r2!, {r0, r3, r6}
	ldm r1!, {r0, r3, r6}
	stm r2!, {r0, r3, r6}
_08069CE8:
	ldr r0, _08069CFC
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
_08069CF0:
	str r0, [r5, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069CF8: .4byte 0x082FA724
_08069CFC: .4byte 0x082D8BFC
	thumb_func_end SetMultiuseSpriteTemplateToTrainerBack

	thumb_func_start SetMultiuseSpriteTemplateToTrainerFront
SetMultiuseSpriteTemplateToTrainerFront: @ 0x08069D00
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _08069D2C
	ldr r2, [r0]
	cmp r2, #0
	beq _08069D34
	ldr r0, _08069D30
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r2, r1
	adds r2, r0, #0
	adds r1, #0x14
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldm r1!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	adds r3, r0, #0
	b _08069D4A
	.align 2, 0
_08069D2C: .4byte 0x02024178
_08069D30: .4byte 0x02024640
_08069D34:
	ldr r3, _08069D5C
	ldr r2, _08069D60
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r0, r0, r2
	ldm r0!, {r2, r4, r6}
	stm r1!, {r2, r4, r6}
	ldm r0!, {r2, r4, r6}
	stm r1!, {r2, r4, r6}
_08069D4A:
	strh r5, [r3, #2]
	ldr r0, _08069D64
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r3, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069D5C: .4byte 0x02024640
_08069D60: .4byte 0x082FA724
_08069D64: .4byte 0x082D8BFC
	thumb_func_end SetMultiuseSpriteTemplateToTrainerFront

	thumb_func_start EncryptBoxMon
EncryptBoxMon: @ 0x08069D68
	push {r4, lr}
	adds r3, r0, #0
	movs r4, #0
	adds r2, r3, #0
	adds r2, #0x20
_08069D72:
	ldr r0, [r2]
	ldr r1, [r3]
	eors r0, r1
	str r0, [r2]
	ldr r1, [r3, #4]
	eors r0, r1
	stm r2!, {r0}
	adds r4, #1
	cmp r4, #0xb
	bls _08069D72
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end EncryptBoxMon

	thumb_func_start DecryptBoxMon
DecryptBoxMon: @ 0x08069D8C
	push {r4, lr}
	adds r3, r0, #0
	movs r4, #0
	adds r2, r3, #0
	adds r2, #0x20
_08069D96:
	ldr r0, [r2]
	ldr r1, [r3, #4]
	eors r0, r1
	str r0, [r2]
	ldr r1, [r3]
	eors r0, r1
	stm r2!, {r0}
	adds r4, #1
	cmp r4, #0xb
	bls _08069D96
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DecryptBoxMon

	thumb_func_start GetSubstruct
GetSubstruct: @ 0x08069DB0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r6, #0
	movs r1, #0x18
	bl __umodsi3
	cmp r0, #0x17
	bls _08069DC8
	b _0806A050
_08069DC8:
	lsls r0, r0, #2
	ldr r1, _08069DD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069DD4: .4byte 0x08069DD8
_08069DD8: @ jump table
	.4byte _08069E38 @ case 0
	.4byte _08069E5C @ case 1
	.4byte _08069E78 @ case 2
	.4byte _08069E8E @ case 3
	.4byte _08069EA4 @ case 4
	.4byte _08069EC0 @ case 5
	.4byte _08069ED6 @ case 6
	.4byte _08069EEC @ case 7
	.4byte _08069EFC @ case 8
	.4byte _08069F1A @ case 9
	.4byte _08069F32 @ case 10
	.4byte _08069F42 @ case 11
	.4byte _08069F56 @ case 12
	.4byte _08069F68 @ case 13
	.4byte _08069F7A @ case 14
	.4byte _08069F8C @ case 15
	.4byte _08069F9E @ case 16
	.4byte _08069FB0 @ case 17
	.4byte _08069FC2 @ case 18
	.4byte _08069FD8 @ case 19
	.4byte _08069FEC @ case 20
	.4byte _08069FFA @ case 21
	.4byte _0806A00C @ case 22
	.4byte _0806A020 @ case 23
_08069E38:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069E42
	b _0806A048
_08069E42:
	cmp r4, #1
	bgt _08069E4E
_08069E46:
	cmp r4, #0
	bne _08069E4C
	b _0806A04E
_08069E4C:
	b _0806A050
_08069E4E:
	cmp r4, #2
	bne _08069E54
	b _0806A042
_08069E54:
	cmp r4, #3
	beq _08069E5A
	b _0806A050
_08069E5A:
	b _0806A03C
_08069E5C:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069E66
	b _0806A048
_08069E66:
	cmp r4, #1
	ble _08069E46
_08069E6A:
	cmp r4, #2
	bne _08069E70
	b _0806A03C
_08069E70:
	cmp r4, #3
	beq _08069E76
	b _0806A050
_08069E76:
	b _0806A042
_08069E78:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069E82
	b _0806A042
_08069E82:
	cmp r4, #1
	ble _08069E46
	cmp r4, #2
	bne _08069E8C
	b _0806A048
_08069E8C:
	b _08069E54
_08069E8E:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069E98
	b _0806A03C
_08069E98:
	cmp r4, #1
	ble _08069E46
	cmp r4, #2
	bne _08069EA2
	b _0806A048
_08069EA2:
	b _08069E70
_08069EA4:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069EAE
	b _0806A042
_08069EAE:
	cmp r4, #1
	ble _08069E46
_08069EB2:
	cmp r4, #2
	bne _08069EB8
	b _0806A03C
_08069EB8:
	cmp r4, #3
	beq _08069EBE
	b _0806A050
_08069EBE:
	b _0806A048
_08069EC0:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069ECA
	b _0806A03C
_08069ECA:
	cmp r4, #1
	ble _08069E46
	cmp r4, #2
	bne _08069ED4
	b _0806A042
_08069ED4:
	b _08069EB8
_08069ED6:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069EE0
	b _0806A04E
_08069EE0:
	cmp r4, #1
	bgt _08069E4E
_08069EE4:
	cmp r4, #0
	bne _08069EEA
	b _0806A048
_08069EEA:
	b _0806A050
_08069EEC:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069EF6
	b _0806A04E
_08069EF6:
	cmp r4, #1
	ble _08069EE4
	b _08069E6A
_08069EFC:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069F06
	b _0806A04E
_08069F06:
	cmp r4, #1
	bgt _08069F12
_08069F0A:
	cmp r4, #0
	bne _08069F10
	b _0806A042
_08069F10:
	b _0806A050
_08069F12:
	cmp r4, #2
	bne _08069F18
	b _0806A048
_08069F18:
	b _08069E54
_08069F1A:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069F24
	b _0806A04E
_08069F24:
	cmp r4, #1
	bgt _08069F2A
	b _0806A02C
_08069F2A:
	cmp r4, #2
	bne _08069F30
	b _0806A048
_08069F30:
	b _08069E70
_08069F32:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069F3C
	b _0806A04E
_08069F3C:
	cmp r4, #1
	ble _08069F0A
	b _08069EB2
_08069F42:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	bne _08069F4C
	b _0806A04E
_08069F4C:
	cmp r4, #1
	ble _0806A02C
	cmp r4, #2
	beq _0806A042
	b _08069EB8
_08069F56:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A042
	cmp r4, #1
	ble _08069EE4
	cmp r4, #2
	beq _0806A04E
	b _08069E54
_08069F68:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A03C
	cmp r4, #1
	ble _08069EE4
	cmp r4, #2
	beq _0806A04E
	b _08069E70
_08069F7A:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A048
	cmp r4, #1
	ble _08069F0A
	cmp r4, #2
	beq _0806A04E
	b _08069E54
_08069F8C:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A048
	cmp r4, #1
	ble _0806A02C
	cmp r4, #2
	beq _0806A04E
	b _08069E70
_08069F9E:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A03C
	cmp r4, #1
	ble _08069F0A
	cmp r4, #2
	beq _0806A04E
	b _08069EB8
_08069FB0:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A042
	cmp r4, #1
	ble _0806A02C
	cmp r4, #2
	beq _0806A04E
	b _08069EB8
_08069FC2:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A042
	cmp r4, #1
	ble _08069EE4
_08069FCE:
	cmp r4, #2
	beq _0806A03C
_08069FD2:
	cmp r4, #3
	bne _0806A050
	b _0806A04E
_08069FD8:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A03C
	cmp r4, #1
	bgt _08069FE6
	b _08069EE4
_08069FE6:
	cmp r4, #2
	beq _0806A042
	b _08069FD2
_08069FEC:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A048
	cmp r4, #1
	ble _08069F0A
	b _08069FCE
_08069FFA:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A048
	cmp r4, #1
	ble _0806A02C
	cmp r4, #2
	beq _0806A042
	b _08069FD2
_0806A00C:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A03C
	cmp r4, #1
	bgt _0806A01A
	b _08069F0A
_0806A01A:
	cmp r4, #2
	beq _0806A048
	b _08069FD2
_0806A020:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r4, #1
	beq _0806A042
	cmp r4, #1
	bgt _0806A032
_0806A02C:
	cmp r4, #0
	beq _0806A03C
	b _0806A050
_0806A032:
	cmp r4, #2
	beq _0806A048
	cmp r4, #3
	beq _0806A04E
	b _0806A050
_0806A03C:
	adds r6, r5, #0
	adds r6, #0x44
	b _0806A050
_0806A042:
	adds r6, r5, #0
	adds r6, #0x38
	b _0806A050
_0806A048:
	adds r6, r5, #0
	adds r6, #0x2c
	b _0806A050
_0806A04E:
	adds r6, r0, #0
_0806A050:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetSubstruct

	thumb_func_start GetMonData
GetMonData: @ 0x0806A058
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r0, r3, #0
	subs r0, #0x37
	cmp r0, #0x21
	bls _0806A068
	b _0806A1A6
_0806A068:
	lsls r0, r0, #2
	ldr r1, _0806A074
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A074: .4byte 0x0806A078
_0806A078: @ jump table
	.4byte _0806A100 @ case 0
	.4byte _0806A104 @ case 1
	.4byte _0806A10C @ case 2
	.4byte _0806A114 @ case 3
	.4byte _0806A11C @ case 4
	.4byte _0806A12E @ case 5
	.4byte _0806A140 @ case 6
	.4byte _0806A152 @ case 7
	.4byte _0806A164 @ case 8
	.4byte _0806A19E @ case 9
	.4byte _0806A1A6 @ case 10
	.4byte _0806A1A6 @ case 11
	.4byte _0806A1A6 @ case 12
	.4byte _0806A1A6 @ case 13
	.4byte _0806A1A6 @ case 14
	.4byte _0806A1A6 @ case 15
	.4byte _0806A1A6 @ case 16
	.4byte _0806A1A6 @ case 17
	.4byte _0806A1A6 @ case 18
	.4byte _0806A1A6 @ case 19
	.4byte _0806A1A6 @ case 20
	.4byte _0806A1A6 @ case 21
	.4byte _0806A1A6 @ case 22
	.4byte _0806A1A6 @ case 23
	.4byte _0806A1A6 @ case 24
	.4byte _0806A1A6 @ case 25
	.4byte _0806A1A6 @ case 26
	.4byte _0806A1A6 @ case 27
	.4byte _0806A1A6 @ case 28
	.4byte _0806A176 @ case 29
	.4byte _0806A17E @ case 30
	.4byte _0806A186 @ case 31
	.4byte _0806A18E @ case 32
	.4byte _0806A196 @ case 33
_0806A100:
	ldr r0, [r4, #0x50]
	b _0806A1AE
_0806A104:
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r0, [r0]
	b _0806A1AE
_0806A10C:
	adds r0, r4, #0
	adds r0, #0x56
	ldrh r0, [r0]
	b _0806A1AE
_0806A114:
	adds r0, r4, #0
	adds r0, #0x58
	ldrh r0, [r0]
	b _0806A1AE
_0806A11C:
	adds r0, r4, #0
	movs r1, #1
	bl GetDeoxysStat
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0806A1AE
	b _0806A176
_0806A12E:
	adds r0, r4, #0
	movs r1, #2
	bl GetDeoxysStat
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0806A1AE
	b _0806A17E
_0806A140:
	adds r0, r4, #0
	movs r1, #3
	bl GetDeoxysStat
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0806A1AE
	b _0806A186
_0806A152:
	adds r0, r4, #0
	movs r1, #4
	bl GetDeoxysStat
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0806A1AE
	b _0806A18E
_0806A164:
	adds r0, r4, #0
	movs r1, #5
	bl GetDeoxysStat
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0806A1AE
	b _0806A196
_0806A176:
	adds r0, r4, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	b _0806A1AE
_0806A17E:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	b _0806A1AE
_0806A186:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r0, [r0]
	b _0806A1AE
_0806A18E:
	adds r0, r4, #0
	adds r0, #0x60
	ldrh r0, [r0]
	b _0806A1AE
_0806A196:
	adds r0, r4, #0
	adds r0, #0x62
	ldrh r0, [r0]
	b _0806A1AE
_0806A19E:
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	b _0806A1AE
_0806A1A6:
	adds r0, r4, #0
	adds r1, r3, #0
	bl GetBoxMonData
_0806A1AE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonData

	thumb_func_start GetBoxMonData
GetBoxMonData: @ 0x0806A1B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	str r1, [sp]
	adds r7, r2, #0
	movs r4, #0
	mov r8, r4
	mov sl, r4
	movs r6, #0
	movs r5, #0
	cmp r1, #0xa
	ble _0806A232
	ldr r1, [r0]
	movs r2, #0
	bl GetSubstruct
	mov r8, r0
	mov r0, sb
	ldr r1, [r0]
	movs r2, #1
	bl GetSubstruct
	mov sl, r0
	mov r2, sb
	ldr r1, [r2]
	mov r0, sb
	movs r2, #2
	bl GetSubstruct
	adds r6, r0, #0
	mov r0, sb
	ldr r1, [r0]
	movs r2, #3
	bl GetSubstruct
	adds r5, r0, #0
	mov r0, sb
	bl DecryptBoxMon
	mov r0, sb
	bl CalculateBoxMonChecksum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sb
	ldrh r1, [r1, #0x1c]
	cmp r0, r1
	beq _0806A232
	mov r2, sb
	ldrb r0, [r2, #0x13]
	movs r1, #1
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #0x13]
	ldrb r0, [r5, #7]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5, #7]
_0806A232:
	ldr r0, [sp]
	cmp r0, #0x53
	bls _0806A23A
	b _0806A754
_0806A23A:
	lsls r0, r0, #2
	ldr r1, _0806A244
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A244: .4byte 0x0806A248
_0806A248: @ jump table
	.4byte _0806A398 @ case 0
	.4byte _0806A39E @ case 1
	.4byte _0806A3A4 @ case 2
	.4byte _0806A3DE @ case 3
	.4byte _0806A3E4 @ case 4
	.4byte _0806A3EA @ case 5
	.4byte _0806A3F0 @ case 6
	.4byte _0806A3F6 @ case 7
	.4byte _0806A412 @ case 8
	.4byte _0806A418 @ case 9
	.4byte _0806A41E @ case 10
	.4byte _0806A424 @ case 11
	.4byte _0806A43C @ case 12
	.4byte _0806A454 @ case 13
	.4byte _0806A454 @ case 14
	.4byte _0806A454 @ case 15
	.4byte _0806A454 @ case 16
	.4byte _0806A460 @ case 17
	.4byte _0806A460 @ case 18
	.4byte _0806A460 @ case 19
	.4byte _0806A460 @ case 20
	.4byte _0806A448 @ case 21
	.4byte _0806A482 @ case 22
	.4byte _0806A486 @ case 23
	.4byte _0806A48A @ case 24
	.4byte _0806A442 @ case 25
	.4byte _0806A46A @ case 26
	.4byte _0806A46E @ case 27
	.4byte _0806A472 @ case 28
	.4byte _0806A476 @ case 29
	.4byte _0806A47A @ case 30
	.4byte _0806A47E @ case 31
	.4byte _0806A44E @ case 32
	.4byte _0806A48E @ case 33
	.4byte _0806A49A @ case 34
	.4byte _0806A49E @ case 35
	.4byte _0806A4A2 @ case 36
	.4byte _0806A4AA @ case 37
	.4byte _0806A4B2 @ case 38
	.4byte _0806A4BC @ case 39
	.4byte _0806A4C4 @ case 40
	.4byte _0806A4CC @ case 41
	.4byte _0806A4D4 @ case 42
	.4byte _0806A4DC @ case 43
	.4byte _0806A4E4 @ case 44
	.4byte _0806A4EC @ case 45
	.4byte _0806A4F0 @ case 46
	.4byte _0806A492 @ case 47
	.4byte _0806A496 @ case 48
	.4byte _0806A4B6 @ case 49
	.4byte _0806A4F6 @ case 50
	.4byte _0806A4FE @ case 51
	.4byte _0806A506 @ case 52
	.4byte _0806A50E @ case 53
	.4byte _0806A516 @ case 54
	.4byte _0806A754 @ case 55
	.4byte _0806A754 @ case 56
	.4byte _0806A754 @ case 57
	.4byte _0806A754 @ case 58
	.4byte _0806A754 @ case 59
	.4byte _0806A754 @ case 60
	.4byte _0806A754 @ case 61
	.4byte _0806A754 @ case 62
	.4byte _0806A754 @ case 63
	.4byte _0806A754 @ case 64
	.4byte _0806A57C @ case 65
	.4byte _0806A5A2 @ case 66
	.4byte _0806A51E @ case 67
	.4byte _0806A524 @ case 68
	.4byte _0806A528 @ case 69
	.4byte _0806A52C @ case 70
	.4byte _0806A530 @ case 71
	.4byte _0806A538 @ case 72
	.4byte _0806A540 @ case 73
	.4byte _0806A548 @ case 74
	.4byte _0806A550 @ case 75
	.4byte _0806A556 @ case 76
	.4byte _0806A55E @ case 77
	.4byte _0806A566 @ case 78
	.4byte _0806A56E @ case 79
	.4byte _0806A576 @ case 80
	.4byte _0806A5DC @ case 81
	.4byte _0806A638 @ case 82
	.4byte _0806A6BA @ case 83
_0806A398:
	mov r1, sb
	ldr r4, [r1]
	b _0806A754
_0806A39E:
	mov r2, sb
	ldr r4, [r2, #4]
	b _0806A754
_0806A3A4:
	mov r0, sb
	ldrb r1, [r0, #0x13]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806A3C8
	movs r4, #0
	ldr r2, _0806A3C4
_0806A3B4:
	adds r0, r7, r4
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #4
	bls _0806A3B4
	b _0806A40A
	.align 2, 0
_0806A3C4: .4byte 0x085ABC78
_0806A3C8:
	movs r4, #0
	mov r2, sb
	adds r2, #8
_0806A3CE:
	adds r0, r7, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #9
	bls _0806A3CE
	b _0806A40A
_0806A3DE:
	mov r1, sb
	ldrb r4, [r1, #0x12]
	b _0806A754
_0806A3E4:
	mov r2, sb
	ldrb r0, [r2, #0x13]
	b _0806A558
_0806A3EA:
	mov r7, sb
	ldrb r0, [r7, #0x13]
	b _0806A560
_0806A3F0:
	mov r1, sb
	ldrb r0, [r1, #0x13]
	b _0806A568
_0806A3F6:
	movs r4, #0
	mov r2, sb
	adds r2, #0x14
_0806A3FC:
	adds r0, r7, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, #1
	cmp r4, #6
	bls _0806A3FC
_0806A40A:
	adds r1, r7, r4
	movs r0, #0xff
	strb r0, [r1]
	b _0806A754
_0806A412:
	mov r2, sb
	ldrb r4, [r2, #0x1b]
	b _0806A754
_0806A418:
	mov r7, sb
	ldrh r4, [r7, #0x1c]
	b _0806A754
_0806A41E:
	mov r0, sb
	ldrh r4, [r0, #0x1e]
	b _0806A754
_0806A424:
	mov r2, sb
	ldrb r1, [r2, #0x13]
	movs r0, #1
	ands r0, r1
	movs r4, #0xce
	lsls r4, r4, #1
	cmp r0, #0
	beq _0806A436
	b _0806A754
_0806A436:
	mov r7, r8
	ldrh r4, [r7]
	b _0806A754
_0806A43C:
	mov r0, r8
	ldrh r4, [r0, #2]
	b _0806A754
_0806A442:
	mov r1, r8
	ldr r4, [r1, #4]
	b _0806A754
_0806A448:
	mov r2, r8
	ldrb r4, [r2, #8]
	b _0806A754
_0806A44E:
	mov r7, r8
	ldrb r4, [r7, #9]
	b _0806A754
_0806A454:
	ldr r0, [sp]
	subs r0, #0xd
	lsls r0, r0, #1
	add r0, sl
	ldrh r4, [r0]
	b _0806A754
_0806A460:
	ldr r0, [sp]
	add r0, sl
	subs r0, #9
	ldrb r4, [r0]
	b _0806A754
_0806A46A:
	ldrb r4, [r6]
	b _0806A754
_0806A46E:
	ldrb r4, [r6, #1]
	b _0806A754
_0806A472:
	ldrb r4, [r6, #2]
	b _0806A754
_0806A476:
	ldrb r4, [r6, #3]
	b _0806A754
_0806A47A:
	ldrb r4, [r6, #4]
	b _0806A754
_0806A47E:
	ldrb r4, [r6, #5]
	b _0806A754
_0806A482:
	ldrb r4, [r6, #6]
	b _0806A754
_0806A486:
	ldrb r4, [r6, #7]
	b _0806A754
_0806A48A:
	ldrb r4, [r6, #8]
	b _0806A754
_0806A48E:
	ldrb r4, [r6, #9]
	b _0806A754
_0806A492:
	ldrb r4, [r6, #0xa]
	b _0806A754
_0806A496:
	ldrb r4, [r6, #0xb]
	b _0806A754
_0806A49A:
	ldrb r4, [r5]
	b _0806A754
_0806A49E:
	ldrb r4, [r5, #1]
	b _0806A754
_0806A4A2:
	ldrb r0, [r5, #2]
	lsls r0, r0, #0x19
	lsrs r4, r0, #0x19
	b _0806A754
_0806A4AA:
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x15
	lsrs r4, r0, #0x1c
	b _0806A754
_0806A4B2:
	ldrb r0, [r5, #3]
	b _0806A570
_0806A4B6:
	ldrb r0, [r5, #3]
	lsrs r4, r0, #7
	b _0806A754
_0806A4BC:
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x1b
	lsrs r4, r0, #0x1b
	b _0806A754
_0806A4C4:
	ldrh r0, [r5, #4]
	lsls r0, r0, #0x16
	lsrs r4, r0, #0x1b
	b _0806A754
_0806A4CC:
	ldrb r0, [r5, #5]
	lsls r0, r0, #0x19
	lsrs r4, r0, #0x1b
	b _0806A754
_0806A4D4:
	ldr r0, [r5, #4]
	lsls r0, r0, #0xc
	lsrs r4, r0, #0x1b
	b _0806A754
_0806A4DC:
	ldrh r0, [r5, #6]
	lsls r0, r0, #0x17
	lsrs r4, r0, #0x1b
	b _0806A754
_0806A4E4:
	ldrb r0, [r5, #7]
	lsls r0, r0, #0x1a
	lsrs r4, r0, #0x1b
	b _0806A754
_0806A4EC:
	ldrb r0, [r5, #7]
	b _0806A54A
_0806A4F0:
	ldrb r0, [r5, #7]
	lsrs r4, r0, #7
	b _0806A754
_0806A4F6:
	ldrb r0, [r5, #8]
	lsls r0, r0, #0x1d
	lsrs r4, r0, #0x1d
	b _0806A754
_0806A4FE:
	ldrb r0, [r5, #8]
	lsls r0, r0, #0x1a
	lsrs r4, r0, #0x1d
	b _0806A754
_0806A506:
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x17
	lsrs r4, r0, #0x1d
	b _0806A754
_0806A50E:
	ldrb r0, [r5, #9]
	lsls r0, r0, #0x1c
	lsrs r4, r0, #0x1d
	b _0806A754
_0806A516:
	ldrb r0, [r5, #9]
	lsls r0, r0, #0x19
	lsrs r4, r0, #0x1d
	b _0806A754
_0806A51E:
	ldrb r0, [r5, #9]
	lsrs r4, r0, #7
	b _0806A754
_0806A524:
	ldrb r0, [r5, #0xa]
	b _0806A558
_0806A528:
	ldrb r0, [r5, #0xa]
	b _0806A560
_0806A52C:
	ldrb r0, [r5, #0xa]
	b _0806A568
_0806A530:
	ldrb r0, [r5, #0xa]
	lsls r0, r0, #0x1c
	lsrs r4, r0, #0x1f
	b _0806A754
_0806A538:
	ldrb r0, [r5, #0xa]
	lsls r0, r0, #0x1b
	lsrs r4, r0, #0x1f
	b _0806A754
_0806A540:
	ldrb r0, [r5, #0xa]
	lsls r0, r0, #0x1a
	lsrs r4, r0, #0x1f
	b _0806A754
_0806A548:
	ldrb r0, [r5, #0xa]
_0806A54A:
	lsls r0, r0, #0x19
	lsrs r4, r0, #0x1f
	b _0806A754
_0806A550:
	ldrb r0, [r5, #0xa]
	lsrs r4, r0, #7
	b _0806A754
_0806A556:
	ldrb r0, [r5, #0xb]
_0806A558:
	lsls r0, r0, #0x1f
	lsrs r4, r0, #0x1f
	b _0806A754
_0806A55E:
	ldrb r0, [r5, #0xb]
_0806A560:
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1f
	b _0806A754
_0806A566:
	ldrb r0, [r5, #0xb]
_0806A568:
	lsls r0, r0, #0x1d
	lsrs r4, r0, #0x1f
	b _0806A754
_0806A56E:
	ldrb r0, [r5, #0xb]
_0806A570:
	lsls r0, r0, #0x19
	lsrs r4, r0, #0x1c
	b _0806A754
_0806A576:
	ldrb r0, [r5, #0xb]
	lsrs r4, r0, #7
	b _0806A754
_0806A57C:
	mov r0, r8
	ldrh r4, [r0]
	cmp r4, #0
	bne _0806A586
	b _0806A754
_0806A586:
	ldrb r0, [r5, #7]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0806A59C
	mov r2, sb
	ldrb r1, [r2, #0x13]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0806A59C
	b _0806A754
_0806A59C:
	movs r4, #0xce
	lsls r4, r4, #1
	b _0806A754
_0806A5A2:
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x1b
	lsrs r4, r0, #0x1b
	ldrh r1, [r5, #4]
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	orrs r4, r0
	ldrb r0, [r5, #5]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	lsls r0, r0, #0xa
	orrs r4, r0
	ldr r0, [r5, #4]
	movs r1, #0xf8
	lsls r1, r1, #0xc
	ands r0, r1
	orrs r4, r0
	ldrh r0, [r5, #6]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	lsls r0, r0, #0x14
	orrs r4, r0
	ldrb r0, [r5, #7]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	lsls r0, r0, #0x19
	orrs r4, r0
	b _0806A754
_0806A5DC:
	mov r1, r8
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806A5E6
	b _0806A754
_0806A5E6:
	ldrb r0, [r5, #7]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _0806A5F0
	b _0806A754
_0806A5F0:
	ldrh r0, [r7]
	ldr r1, _0806A630
	cmp r0, r1
	bne _0806A5FA
	b _0806A754
_0806A5FA:
	mov r2, sl
	ldrh r5, [r2]
	adds r6, r1, #0
	adds r2, r7, #0
	ldr r1, _0806A634
_0806A604:
	ldrh r3, [r2]
	cmp r5, r3
	beq _0806A61E
	mov r7, sl
	ldrh r0, [r7, #2]
	cmp r0, r3
	beq _0806A61E
	ldrh r0, [r7, #4]
	cmp r0, r3
	beq _0806A61E
	ldrh r0, [r7, #6]
	cmp r0, r3
	bne _0806A622
_0806A61E:
	ldr r0, [r1]
	orrs r4, r0
_0806A622:
	adds r2, #2
	adds r1, #4
	ldrh r0, [r2]
	cmp r0, r6
	bne _0806A604
	b _0806A754
	.align 2, 0
_0806A630: .4byte 0x00000163
_0806A634: .4byte 0x082FACB4
_0806A638:
	movs r4, #0
	mov r1, r8
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806A644
	b _0806A754
_0806A644:
	ldrb r0, [r5, #7]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _0806A64E
	b _0806A754
_0806A64E:
	ldrb r0, [r5, #8]
	lsls r1, r0, #0x1d
	lsrs r4, r1, #0x1d
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	adds r4, r4, r0
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1d
	adds r4, r4, r0
	ldrb r1, [r5, #9]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	adds r4, r4, r0
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1d
	adds r4, r4, r0
	lsrs r1, r1, #7
	adds r4, r4, r1
	ldrb r1, [r5, #0xa]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsrs r1, r1, #7
	adds r4, r4, r1
	ldrb r1, [r5, #0xb]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	adds r4, r4, r0
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	adds r4, r4, r1
	b _0806A754
_0806A6BA:
	movs r4, #0
	mov r2, r8
	ldrh r0, [r2]
	cmp r0, #0
	beq _0806A754
	ldrb r0, [r5, #7]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0806A754
	ldrb r2, [r5, #9]
	lsrs r4, r2, #7
	ldrb r1, [r5, #8]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1c
	orrs r4, r0
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	lsls r1, r1, #4
	orrs r4, r1
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1d
	lsls r0, r0, #7
	orrs r4, r0
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	lsls r0, r0, #0xa
	orrs r4, r0
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x1d
	lsls r2, r2, #0xd
	orrs r4, r2
	ldrb r1, [r5, #0xa]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x10
	orrs r4, r0
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x11
	orrs r4, r0
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x12
	orrs r4, r0
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x13
	orrs r4, r0
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x14
	orrs r4, r0
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x15
	orrs r4, r0
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x16
	orrs r4, r0
	lsrs r1, r1, #7
	lsls r1, r1, #0x17
	orrs r4, r1
	ldrb r1, [r5, #0xb]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x18
	orrs r4, r0
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x19
	orrs r4, r0
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	lsls r1, r1, #0x1a
	orrs r4, r1
_0806A754:
	ldr r7, [sp]
	cmp r7, #0xa
	ble _0806A760
	mov r0, sb
	bl EncryptBoxMon
_0806A760:
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBoxMonData

	thumb_func_start SetMonData
SetMonData: @ 0x0806A774
	push {lr}
	adds r3, r0, #0
	adds r0, r1, #0
	subs r0, #0x37
	cmp r0, #0xa
	bhi _0806A858
	lsls r0, r0, #2
	ldr r1, _0806A78C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A78C: .4byte 0x0806A790
_0806A790: @ jump table
	.4byte _0806A7BC @ case 0
	.4byte _0806A7D4 @ case 1
	.4byte _0806A7DE @ case 2
	.4byte _0806A7EE @ case 3
	.4byte _0806A7FE @ case 4
	.4byte _0806A80E @ case 5
	.4byte _0806A81E @ case 6
	.4byte _0806A82E @ case 7
	.4byte _0806A83E @ case 8
	.4byte _0806A84E @ case 9
	.4byte _0806A85E @ case 10
_0806A7BC:
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r3, #0x50]
	b _0806A85E
_0806A7D4:
	ldrb r1, [r2]
	adds r0, r3, #0
	adds r0, #0x54
	strb r1, [r0]
	b _0806A85E
_0806A7DE:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x56
	strh r0, [r1]
	b _0806A85E
_0806A7EE:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x58
	strh r0, [r1]
	b _0806A85E
_0806A7FE:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	b _0806A85E
_0806A80E:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x5c
	strh r0, [r1]
	b _0806A85E
_0806A81E:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x5e
	strh r0, [r1]
	b _0806A85E
_0806A82E:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x60
	strh r0, [r1]
	b _0806A85E
_0806A83E:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x62
	strh r0, [r1]
	b _0806A85E
_0806A84E:
	ldrb r1, [r2]
	adds r0, r3, #0
	adds r0, #0x55
	strb r1, [r0]
	b _0806A85E
_0806A858:
	adds r0, r3, #0
	bl SetBoxMonData
_0806A85E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetMonData

	thumb_func_start SetBoxMonData
SetBoxMonData: @ 0x0806A864
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	mov sl, r1
	adds r4, r2, #0
	movs r0, #0
	mov r8, r0
	mov sb, r0
	movs r6, #0
	movs r5, #0
	cmp r1, #0xa
	ble _0806A8E4
	ldr r1, [r7]
	adds r0, r7, #0
	movs r2, #0
	bl GetSubstruct
	mov r8, r0
	ldr r1, [r7]
	adds r0, r7, #0
	movs r2, #1
	bl GetSubstruct
	mov sb, r0
	ldr r1, [r7]
	adds r0, r7, #0
	movs r2, #2
	bl GetSubstruct
	adds r6, r0, #0
	ldr r1, [r7]
	adds r0, r7, #0
	movs r2, #3
	bl GetSubstruct
	adds r5, r0, #0
	adds r0, r7, #0
	bl DecryptBoxMon
	adds r0, r7, #0
	bl CalculateBoxMonChecksum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r7, #0x1c]
	cmp r0, r1
	beq _0806A8E4
	ldrb r0, [r7, #0x13]
	movs r1, #1
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r7, #0x13]
	ldrb r0, [r5, #7]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5, #7]
	adds r0, r7, #0
	bl EncryptBoxMon
	b _0806AEB4
_0806A8E4:
	mov r0, sl
	cmp r0, #0x50
	bls _0806A8EC
	b _0806AEA0
_0806A8EC:
	lsls r0, r0, #2
	ldr r1, _0806A8F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A8F8: .4byte 0x0806A8FC
_0806A8FC: @ jump table
	.4byte _0806AA40 @ case 0
	.4byte _0806AA58 @ case 1
	.4byte _0806AA70 @ case 2
	.4byte _0806AA86 @ case 3
	.4byte _0806AA8C @ case 4
	.4byte _0806AA9C @ case 5
	.4byte _0806AAAE @ case 6
	.4byte _0806AAC0 @ case 7
	.4byte _0806AAD6 @ case 8
	.4byte _0806AADC @ case 9
	.4byte _0806AAE8 @ case 10
	.4byte _0806AAF4 @ case 11
	.4byte _0806AB14 @ case 12
	.4byte _0806AB4C @ case 13
	.4byte _0806AB4C @ case 14
	.4byte _0806AB4C @ case 15
	.4byte _0806AB4C @ case 16
	.4byte _0806AB60 @ case 17
	.4byte _0806AB60 @ case 18
	.4byte _0806AB60 @ case 19
	.4byte _0806AB60 @ case 20
	.4byte _0806AB3C @ case 21
	.4byte _0806AB90 @ case 22
	.4byte _0806AB96 @ case 23
	.4byte _0806AB9C @ case 24
	.4byte _0806AB22 @ case 25
	.4byte _0806AB6C @ case 26
	.4byte _0806AB72 @ case 27
	.4byte _0806AB78 @ case 28
	.4byte _0806AB7E @ case 29
	.4byte _0806AB84 @ case 30
	.4byte _0806AB8A @ case 31
	.4byte _0806AB44 @ case 32
	.4byte _0806ABA2 @ case 33
	.4byte _0806ABB4 @ case 34
	.4byte _0806ABBA @ case 35
	.4byte _0806ABC0 @ case 36
	.4byte _0806ABD4 @ case 37
	.4byte _0806ABEC @ case 38
	.4byte _0806AC12 @ case 39
	.4byte _0806AC26 @ case 40
	.4byte _0806AC40 @ case 41
	.4byte _0806AC56 @ case 42
	.4byte _0806AC70 @ case 43
	.4byte _0806AC88 @ case 44
	.4byte _0806AC9C @ case 45
	.4byte _0806ACCC @ case 46
	.4byte _0806ABA8 @ case 47
	.4byte _0806ABAE @ case 48
	.4byte _0806AC02 @ case 49
	.4byte _0806ACDC @ case 50
	.4byte _0806ACEA @ case 51
	.4byte _0806AD00 @ case 52
	.4byte _0806AD18 @ case 53
	.4byte _0806AD28 @ case 54
	.4byte _0806AEA0 @ case 55
	.4byte _0806AEA0 @ case 56
	.4byte _0806AEA0 @ case 57
	.4byte _0806AEA0 @ case 58
	.4byte _0806AEA0 @ case 59
	.4byte _0806AEA0 @ case 60
	.4byte _0806AEA0 @ case 61
	.4byte _0806AEA0 @ case 62
	.4byte _0806AEA0 @ case 63
	.4byte _0806AEA0 @ case 64
	.4byte _0806AEA0 @ case 65
	.4byte _0806AE26 @ case 66
	.4byte _0806AD3E @ case 67
	.4byte _0806AD4E @ case 68
	.4byte _0806AD5C @ case 69
	.4byte _0806AD6C @ case 70
	.4byte _0806AD7C @ case 71
	.4byte _0806AD8C @ case 72
	.4byte _0806AD9C @ case 73
	.4byte _0806ADAC @ case 74
	.4byte _0806ADC2 @ case 75
	.4byte _0806ADD2 @ case 76
	.4byte _0806ADE0 @ case 77
	.4byte _0806ADF0 @ case 78
	.4byte _0806AE00 @ case 79
	.4byte _0806AE16 @ case 80
_0806AA40:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r4, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r7]
	b _0806AEA0
_0806AA58:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r4, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	str r1, [r7, #4]
	b _0806AEA0
_0806AA70:
	movs r2, #0
	adds r3, r7, #0
	adds r3, #8
_0806AA76:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #9
	ble _0806AA76
	b _0806AEA0
_0806AA86:
	ldrb r0, [r4]
	strb r0, [r7, #0x12]
	b _0806AEA0
_0806AA8C:
	ldrb r0, [r4]
	movs r1, #1
	ands r1, r0
	ldrb r2, [r7, #0x13]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	b _0806ACBA
_0806AA9C:
	ldrb r0, [r4]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r7, #0x13]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	b _0806ACBA
_0806AAAE:
	ldrb r0, [r4]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r7, #0x13]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	b _0806ACBA
_0806AAC0:
	movs r2, #0
	adds r3, r7, #0
	adds r3, #0x14
_0806AAC6:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _0806AAC6
	b _0806AEA0
_0806AAD6:
	ldrb r0, [r4]
	strb r0, [r7, #0x1b]
	b _0806AEA0
_0806AADC:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r7, #0x1c]
	b _0806AEA0
_0806AAE8:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r7, #0x1e]
	b _0806AEA0
_0806AAF4:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r0, r8
	strh r1, [r0]
	lsls r1, r1, #0x10
	cmp r1, #0
	beq _0806AB0C
	ldrb r0, [r7, #0x13]
	movs r1, #2
	b _0806ACBA
_0806AB0C:
	ldrb r1, [r7, #0x13]
	movs r0, #3
	rsbs r0, r0, #0
	b _0806ACC6
_0806AB14:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r0, r8
	strh r1, [r0, #2]
	b _0806AEA0
_0806AB22:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r4, #2]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	adds r1, r1, r0
	mov r0, r8
	str r1, [r0, #4]
	b _0806AEA0
_0806AB3C:
	ldrb r0, [r4]
	mov r1, r8
	strb r0, [r1, #8]
	b _0806AEA0
_0806AB44:
	ldrb r0, [r4]
	mov r1, r8
	strb r0, [r1, #9]
	b _0806AEA0
_0806AB4C:
	mov r2, sl
	subs r2, #0xd
	lsls r2, r2, #1
	add r2, sb
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
	b _0806AEA0
_0806AB60:
	mov r0, sb
	add r0, sl
	subs r0, #9
	ldrb r1, [r4]
	strb r1, [r0]
	b _0806AEA0
_0806AB6C:
	ldrb r0, [r4]
	strb r0, [r6]
	b _0806AEA0
_0806AB72:
	ldrb r0, [r4]
	strb r0, [r6, #1]
	b _0806AEA0
_0806AB78:
	ldrb r0, [r4]
	strb r0, [r6, #2]
	b _0806AEA0
_0806AB7E:
	ldrb r0, [r4]
	strb r0, [r6, #3]
	b _0806AEA0
_0806AB84:
	ldrb r0, [r4]
	strb r0, [r6, #4]
	b _0806AEA0
_0806AB8A:
	ldrb r0, [r4]
	strb r0, [r6, #5]
	b _0806AEA0
_0806AB90:
	ldrb r0, [r4]
	strb r0, [r6, #6]
	b _0806AEA0
_0806AB96:
	ldrb r0, [r4]
	strb r0, [r6, #7]
	b _0806AEA0
_0806AB9C:
	ldrb r0, [r4]
	strb r0, [r6, #8]
	b _0806AEA0
_0806ABA2:
	ldrb r0, [r4]
	strb r0, [r6, #9]
	b _0806AEA0
_0806ABA8:
	ldrb r0, [r4]
	strb r0, [r6, #0xa]
	b _0806AEA0
_0806ABAE:
	ldrb r0, [r4]
	strb r0, [r6, #0xb]
	b _0806AEA0
_0806ABB4:
	ldrb r0, [r4]
	strb r0, [r5]
	b _0806AEA0
_0806ABBA:
	ldrb r0, [r4]
	strb r0, [r5, #1]
	b _0806AEA0
_0806ABC0:
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r1, r0
	ldrb r2, [r5, #2]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #2]
	b _0806AEA0
_0806ABD4:
	ldrb r1, [r4]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r5, #2]
	ldr r0, _0806ABE8
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #2]
	b _0806AEA0
	.align 2, 0
_0806ABE8: .4byte 0xFFFFF87F
_0806ABEC:
	ldrb r1, [r4]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r5, #3]
	movs r0, #0x79
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #3]
	b _0806AEA0
_0806AC02:
	ldrb r0, [r4]
	lsls r0, r0, #7
	ldrb r2, [r5, #3]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #3]
	b _0806AEA0
_0806AC12:
	ldrb r1, [r4]
	movs r0, #0x1f
	ands r1, r0
	ldrb r2, [r5, #4]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #4]
	b _0806AEA0
_0806AC26:
	ldrb r1, [r4]
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #5
	ldrh r2, [r5, #4]
	ldr r0, _0806AC3C
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	b _0806AEA0
	.align 2, 0
_0806AC3C: .4byte 0xFFFFFC1F
_0806AC40:
	ldrb r1, [r4]
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #5]
	movs r0, #0x7d
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	b _0806AEA0
_0806AC56:
	ldrb r2, [r4]
	movs r0, #0x1f
	ands r2, r0
	lsls r2, r2, #0xf
	ldr r0, [r5, #4]
	ldr r1, _0806AC6C
	ands r0, r1
	orrs r0, r2
	str r0, [r5, #4]
	b _0806AEA0
	.align 2, 0
_0806AC6C: .4byte 0xFFF07FFF
_0806AC70:
	ldrb r1, [r4]
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #4
	ldrh r2, [r5, #6]
	ldr r0, _0806AC84
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #6]
	b _0806AEA0
	.align 2, 0
_0806AC84: .4byte 0xFFFFFE0F
_0806AC88:
	ldrb r1, [r4]
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5, #7]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	b _0806AE9E
_0806AC9C:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #6
	ldrb r2, [r5, #7]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #7]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _0806ACC0
	ldrb r0, [r7, #0x13]
	movs r1, #4
_0806ACBA:
	orrs r0, r1
	strb r0, [r7, #0x13]
	b _0806AEA0
_0806ACC0:
	ldrb r1, [r7, #0x13]
	movs r0, #5
	rsbs r0, r0, #0
_0806ACC6:
	ands r0, r1
	strb r0, [r7, #0x13]
	b _0806AEA0
_0806ACCC:
	ldrb r0, [r4]
	lsls r0, r0, #7
	ldrb r2, [r5, #7]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #7]
	b _0806AEA0
_0806ACDC:
	ldrb r1, [r4]
	movs r0, #7
	ands r1, r0
	ldrb r2, [r5, #8]
	movs r0, #8
	rsbs r0, r0, #0
	b _0806ACF8
_0806ACEA:
	ldrb r1, [r4]
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r5, #8]
	movs r0, #0x39
	rsbs r0, r0, #0
_0806ACF8:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #8]
	b _0806AEA0
_0806AD00:
	ldrb r1, [r4]
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r5, #8]
	ldr r0, _0806AD14
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #8]
	b _0806AEA0
	.align 2, 0
_0806AD14: .4byte 0xFFFFFE3F
_0806AD18:
	ldrb r1, [r4]
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5, #9]
	movs r0, #0xf
	rsbs r0, r0, #0
	b _0806AD36
_0806AD28:
	ldrb r1, [r4]
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r5, #9]
	movs r0, #0x71
	rsbs r0, r0, #0
_0806AD36:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #9]
	b _0806AEA0
_0806AD3E:
	ldrb r0, [r4]
	lsls r0, r0, #7
	ldrb r2, [r5, #9]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #9]
	b _0806AEA0
_0806AD4E:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	ldrb r2, [r5, #0xa]
	movs r0, #2
	rsbs r0, r0, #0
	b _0806ADBA
_0806AD5C:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5, #0xa]
	movs r0, #3
	rsbs r0, r0, #0
	b _0806ADBA
_0806AD6C:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #0xa]
	movs r0, #5
	rsbs r0, r0, #0
	b _0806ADBA
_0806AD7C:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r5, #0xa]
	movs r0, #9
	rsbs r0, r0, #0
	b _0806ADBA
_0806AD8C:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r5, #0xa]
	movs r0, #0x11
	rsbs r0, r0, #0
	b _0806ADBA
_0806AD9C:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #5
	ldrb r2, [r5, #0xa]
	movs r0, #0x21
	rsbs r0, r0, #0
	b _0806ADBA
_0806ADAC:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #6
	ldrb r2, [r5, #0xa]
	movs r0, #0x41
	rsbs r0, r0, #0
_0806ADBA:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #0xa]
	b _0806AEA0
_0806ADC2:
	ldrb r0, [r4]
	lsls r0, r0, #7
	ldrb r2, [r5, #0xa]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #0xa]
	b _0806AEA0
_0806ADD2:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	ldrb r2, [r5, #0xb]
	movs r0, #2
	rsbs r0, r0, #0
	b _0806AE0E
_0806ADE0:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5, #0xb]
	movs r0, #3
	rsbs r0, r0, #0
	b _0806AE0E
_0806ADF0:
	ldrb r1, [r4]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #0xb]
	movs r0, #5
	rsbs r0, r0, #0
	b _0806AE0E
_0806AE00:
	ldrb r1, [r4]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #3
	ldrb r2, [r5, #0xb]
	movs r0, #0x79
	rsbs r0, r0, #0
_0806AE0E:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #0xb]
	b _0806AEA0
_0806AE16:
	ldrb r0, [r4]
	lsls r0, r0, #7
	ldrb r2, [r5, #0xb]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #0xb]
	b _0806AEA0
_0806AE26:
	ldrb r3, [r4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #8
	orrs r3, r0
	ldrb r0, [r4, #2]
	lsls r0, r0, #0x10
	orrs r3, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	orrs r3, r0
	movs r4, #0x1f
	adds r1, r3, #0
	ands r1, r4
	ldrb r2, [r5, #4]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #4]
	lsrs r1, r3, #5
	ands r1, r4
	lsls r1, r1, #5
	ldrh r2, [r5, #4]
	ldr r0, _0806AEC4
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	lsrs r1, r3, #0xa
	ands r1, r4
	lsls r1, r1, #2
	ldrb r2, [r5, #5]
	movs r0, #0x7d
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	lsrs r1, r3, #0xf
	ands r1, r4
	lsls r1, r1, #0xf
	ldr r0, [r5, #4]
	ldr r2, _0806AEC8
	ands r0, r2
	orrs r0, r1
	str r0, [r5, #4]
	lsrs r1, r3, #0x14
	ands r1, r4
	lsls r1, r1, #4
	ldrh r2, [r5, #6]
	ldr r0, _0806AECC
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #6]
	lsrs r3, r3, #0x19
	ands r3, r4
	lsls r3, r3, #1
	ldrb r1, [r5, #7]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
_0806AE9E:
	strb r0, [r5, #7]
_0806AEA0:
	mov r0, sl
	cmp r0, #0xa
	ble _0806AEB4
	adds r0, r7, #0
	bl CalculateBoxMonChecksum
	strh r0, [r7, #0x1c]
	adds r0, r7, #0
	bl EncryptBoxMon
_0806AEB4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AEC4: .4byte 0xFFFFFC1F
_0806AEC8: .4byte 0xFFF07FFF
_0806AECC: .4byte 0xFFFFFE0F
	thumb_func_end SetBoxMonData

	thumb_func_start CopyMon
CopyMon: @ 0x0806AED0
	push {lr}
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CopyMon

	thumb_func_start GiveMonToPlayer
GiveMonToPlayer: @ 0x0806AEDC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0806AF08
	ldr r2, [r4]
	movs r1, #7
	bl SetMonData
	ldr r2, [r4]
	adds r2, #8
	adds r0, r6, #0
	movs r1, #0x31
	bl SetMonData
	ldr r2, [r4]
	adds r2, #0xa
	adds r0, r6, #0
	movs r1, #1
	bl SetMonData
	movs r5, #0
	b _0806AF0E
	.align 2, 0
_0806AF08: .4byte 0x03005AF0
_0806AF0C:
	adds r5, #1
_0806AF0E:
	cmp r5, #5
	bgt _0806AF48
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0806AF40
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0806AF0C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x64
	bl CopyMon
	ldr r1, _0806AF44
	adds r0, r5, #1
	strb r0, [r1]
	movs r0, #0
	b _0806AF52
	.align 2, 0
_0806AF40: .4byte 0x02024190
_0806AF44: .4byte 0x0202418D
_0806AF48:
	adds r0, r6, #0
	bl SendMonToPC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806AF52:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GiveMonToPlayer

	thumb_func_start SendMonToPC
SendMonToPC: @ 0x0806AF58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, _0806AFCC
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl set_unknown_box_id
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0806AF76:
	movs r6, #0
	lsls r7, r5, #0x18
_0806AF7A:
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r7, #0x18
	bl GetBoxedMonPtr
	adds r4, r0, #0
	movs r1, #0xb
	movs r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0806AFDC
	mov r0, r8
	bl GiveMonInitialMoveset
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x50
	bl CopyMon
	ldr r0, _0806AFD0
	strh r5, [r0]
	ldr r0, _0806AFD4
	strh r6, [r0]
	bl get_unknown_box_id
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	beq _0806AFBC
	ldr r0, _0806AFD8
	bl FlagClear
_0806AFBC:
	lsls r1, r5, #0x10
	ldr r0, _0806AFCC
	lsrs r1, r1, #0x10
	bl VarSet
	movs r0, #1
	b _0806AFF8
	.align 2, 0
_0806AFCC: .4byte 0x00004036
_0806AFD0: .4byte 0x02037296
_0806AFD4: .4byte 0x02037298
_0806AFD8: .4byte 0x000008D7
_0806AFDC:
	adds r6, #1
	cmp r6, #0x1d
	ble _0806AF7A
	adds r5, #1
	cmp r5, #0xe
	bne _0806AFEA
	movs r5, #0
_0806AFEA:
	bl StorageGetCurrentBox
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _0806AF76
	movs r0, #2
_0806AFF8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SendMonToPC

	thumb_func_start CalculatePlayerPartyCount
CalculatePlayerPartyCount: @ 0x0806B004
	push {r4, lr}
	ldr r0, _0806B010
	movs r1, #0
	strb r1, [r0]
	b _0806B01C
	.align 2, 0
_0806B010: .4byte 0x0202418D
_0806B014:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r4, #0
_0806B01C:
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #5
	bhi _0806B03A
	adds r1, r0, #0
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0806B044
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0806B014
_0806B03A:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B044: .4byte 0x02024190
	thumb_func_end CalculatePlayerPartyCount

	thumb_func_start CalculateEnemyPartyCount
CalculateEnemyPartyCount: @ 0x0806B048
	push {r4, lr}
	ldr r0, _0806B054
	movs r1, #0
	strb r1, [r0]
	b _0806B060
	.align 2, 0
_0806B054: .4byte 0x0202418E
_0806B058:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r4, #0
_0806B060:
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #5
	bhi _0806B07E
	adds r1, r0, #0
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0806B088
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0806B058
_0806B07E:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B088: .4byte 0x020243E8
	thumb_func_end CalculateEnemyPartyCount

	thumb_func_start GetMonsStateToDoubles
GetMonsStateToDoubles: @ 0x0806B08C
	push {r4, r5, r6, lr}
	movs r6, #0
	bl CalculatePlayerPartyCount
	ldr r1, _0806B0F8
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806B0F0
	movs r5, #0
	ldrb r1, [r1]
	cmp r6, r1
	bge _0806B0E8
_0806B0A4:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0806B0FC
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	beq _0806B0DE
	adds r0, r4, #0
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0806B0DE
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0806B0DE
	adds r6, #1
_0806B0DE:
	adds r5, #1
	ldr r0, _0806B0F8
	ldrb r0, [r0]
	cmp r5, r0
	blt _0806B0A4
_0806B0E8:
	movs r0, #0
	cmp r6, #1
	bgt _0806B0F0
	movs r0, #2
_0806B0F0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806B0F8: .4byte 0x0202418D
_0806B0FC: .4byte 0x02024190
	thumb_func_end GetMonsStateToDoubles

	thumb_func_start GetMonsStateToDoubles_2
GetMonsStateToDoubles_2: @ 0x0806B100
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0
_0806B106:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0806B148
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	beq _0806B138
	cmp r1, #0
	beq _0806B138
	adds r0, r4, #0
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0806B138
	adds r6, #1
_0806B138:
	adds r5, #1
	cmp r5, #5
	ble _0806B106
	cmp r6, #1
	bne _0806B14C
	movs r0, #1
	b _0806B154
	.align 2, 0
_0806B148: .4byte 0x02024190
_0806B14C:
	movs r0, #0
	cmp r6, #1
	bgt _0806B154
	movs r0, #2
_0806B154:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMonsStateToDoubles_2

	thumb_func_start GetAbilityBySpecies
GetAbilityBySpecies: @ 0x0806B15C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0806B180
	ldr r2, _0806B178
	ldr r1, _0806B17C
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x17]
	b _0806B18E
	.align 2, 0
_0806B178: .4byte 0x02023EAE
_0806B17C: .4byte 0x082F0D54
_0806B180:
	ldr r2, _0806B198
	ldr r1, _0806B19C
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x16]
_0806B18E:
	strb r0, [r2]
	ldrb r0, [r2]
	pop {r1}
	bx r1
	.align 2, 0
_0806B198: .4byte 0x02023EAE
_0806B19C: .4byte 0x082F0D54
	thumb_func_end GetAbilityBySpecies

	thumb_func_start GetMonAbility
GetMonAbility: @ 0x0806B1A0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x2e
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl GetAbilityBySpecies
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMonAbility

	thumb_func_start CreateSecretBaseEnemyParty
CreateSecretBaseEnemyParty: @ 0x0806B1D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	bl ZeroEnemyPartyMons
	ldr r4, _0806B2EC
	ldr r0, [r4]
	ldr r0, [r0]
	adds r1, r5, #0
	movs r2, #0xa0
	bl memcpy
	movs r0, #0
	mov sb, r0
_0806B1F8:
	ldr r1, _0806B2EC
	ldr r3, [r1]
	ldr r2, [r3]
	mov r4, sb
	lsls r7, r4, #1
	adds r0, r2, #0
	adds r0, #0x7c
	adds r1, r0, r7
	ldrh r0, [r1]
	adds r4, #1
	str r4, [sp, #0x10]
	cmp r0, #0
	beq _0806B2D2
	movs r0, #0x64
	mov r6, sb
	muls r6, r0, r6
	ldr r4, _0806B2F0
	mov r8, r4
	adds r5, r6, r4
	ldrh r1, [r1]
	adds r0, r2, #0
	adds r0, #0x94
	add r0, sb
	ldrb r2, [r0]
	movs r0, #1
	str r0, [sp]
	ldr r0, [r3]
	mov r3, sb
	lsls r4, r3, #2
	adds r0, #0x34
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r3, #0xf
	bl CreateMon
	ldr r1, _0806B2EC
	ldr r0, [r1]
	adds r1, r7, #0
	adds r1, #0x88
	ldr r2, [r0]
	adds r2, r2, r1
	adds r0, r5, #0
	movs r1, #0xc
	bl SetMonData
	movs r5, #0
	mov sl, r4
	mov r7, sb
	adds r7, #0x9a
	mov r4, r8
_0806B268:
	adds r1, r5, #0
	adds r1, #0x1a
	ldr r2, _0806B2EC
	ldr r0, [r2]
	ldr r2, [r0]
	adds r2, r2, r7
	adds r0, r6, r4
	bl SetMonData
	adds r5, #1
	cmp r5, #5
	ble _0806B268
	movs r5, #0
	movs r3, #0x64
	mov r0, sb
	muls r0, r3, r0
	ldr r1, _0806B2F0
	adds r7, r0, r1
	mov r4, sl
	lsls r0, r4, #1
	adds r6, r0, #0
	adds r6, #0x4c
	adds r4, r0, #0
_0806B296:
	adds r1, r5, #0
	adds r1, #0xd
	ldr r2, _0806B2EC
	ldr r0, [r2]
	ldr r2, [r0]
	adds r2, r2, r6
	adds r0, r7, #0
	bl SetMonData
	adds r1, r5, #0
	adds r1, #0x11
	ldr r3, _0806B2EC
	ldr r0, [r3]
	ldr r0, [r0]
	adds r0, #0x4c
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _0806B2F4
	adds r2, r2, r0
	adds r0, r7, #0
	bl SetMonData
	adds r6, #2
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _0806B296
_0806B2D2:
	ldr r4, [sp, #0x10]
	mov sb, r4
	cmp r4, #5
	ble _0806B1F8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B2EC: .4byte 0x0202414C
_0806B2F0: .4byte 0x020243E8
_0806B2F4: .4byte 0x082ED224
	thumb_func_end CreateSecretBaseEnemyParty

	thumb_func_start GetSecretBaseTrainerClass
GetSecretBaseTrainerClass: @ 0x0806B2F8
	push {r4, r5, lr}
	ldr r5, _0806B32C
	ldr r0, _0806B330
	ldr r0, [r0]
	ldr r4, [r0]
	ldrb r0, [r4, #9]
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r4, #1]
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x1f
	lsls r1, r2, #2
	adds r1, r1, r2
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0806B334
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B32C: .4byte 0x082FA844
_0806B330: .4byte 0x0202414C
_0806B334: .4byte 0x082EFF00
	thumb_func_end GetSecretBaseTrainerClass

	thumb_func_start GetSecretBaseTrainerPicIndex
GetSecretBaseTrainerPicIndex: @ 0x0806B338
	push {r4, r5, lr}
	ldr r5, _0806B36C
	ldr r0, _0806B370
	ldr r0, [r0]
	ldr r4, [r0]
	ldrb r0, [r4, #9]
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r4, #1]
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x1f
	lsls r1, r2, #2
	adds r1, r1, r2
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0806B374
	adds r0, r0, r1
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B36C: .4byte 0x082FA844
_0806B370: .4byte 0x0202414C
_0806B374: .4byte 0x082EFF52
	thumb_func_end GetSecretBaseTrainerPicIndex

	thumb_func_start IsPlayerPartyAndPokemonStorageFull
IsPlayerPartyAndPokemonStorageFull: @ 0x0806B378
	push {r4, lr}
	movs r4, #0
_0806B37C:
	movs r0, #0x64
	muls r0, r4, r0
	ldr r1, _0806B394
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0806B398
	movs r0, #0
	b _0806B3A6
	.align 2, 0
_0806B394: .4byte 0x02024190
_0806B398:
	adds r4, #1
	cmp r4, #5
	ble _0806B37C
	bl IsPokemonStorageFull
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806B3A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsPlayerPartyAndPokemonStorageFull

	thumb_func_start IsPokemonStorageFull
IsPokemonStorageFull: @ 0x0806B3AC
	push {r4, r5, r6, lr}
	movs r6, #0
_0806B3B0:
	movs r4, #0
	lsls r5, r6, #0x18
_0806B3B4:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r5, #0x18
	movs r2, #0xb
	bl GetBoxMonDataAt
	cmp r0, #0
	bne _0806B3C8
	movs r0, #0
	b _0806B3D6
_0806B3C8:
	adds r4, #1
	cmp r4, #0x1d
	ble _0806B3B4
	adds r6, #1
	cmp r6, #0xd
	ble _0806B3B0
	movs r0, #1
_0806B3D6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end IsPokemonStorageFull

	thumb_func_start GetSpeciesName
GetSpeciesName: @ 0x0806B3DC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r1, #0
	movs r7, #0xce
	lsls r7, r7, #1
	ldr r5, _0806B400
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r2, r6, #0
	adds r3, r0, r5
_0806B3F6:
	cmp r4, r7
	bls _0806B404
	adds r0, r1, r5
	ldrb r0, [r0]
	b _0806B406
	.align 2, 0
_0806B400: .4byte 0x082EA31C
_0806B404:
	ldrb r0, [r3]
_0806B406:
	strb r0, [r2]
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _0806B418
	adds r2, #1
	adds r3, #1
	adds r1, #1
	cmp r1, #0xa
	ble _0806B3F6
_0806B418:
	adds r1, r6, r1
	movs r0, #0xff
	strb r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end GetSpeciesName

	thumb_func_start CalculatePPWithBonus
CalculatePPWithBonus: @ 0x0806B424
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, _0806B464
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r3, r3, r4
	ldrb r4, [r3, #4]
	ldr r0, _0806B468
	adds r0, r2, r0
	ldrb r3, [r0]
	ands r3, r1
	lsls r2, r2, #1
	asrs r3, r2
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B464: .4byte 0x082ED220
_0806B468: .4byte 0x082FA6AA
	thumb_func_end CalculatePPWithBonus

	thumb_func_start RemoveMonPPBonus
RemoveMonPPBonus: @ 0x0806B46C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	ldr r1, _0806B4A4
	adds r4, r4, r1
	ldrb r1, [r4]
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0x15
	mov r2, sp
	bl SetMonData
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B4A4: .4byte 0x082FA6AE
	thumb_func_end RemoveMonPPBonus

	thumb_func_start RemoveBattleMonPPBonus
RemoveBattleMonPPBonus: @ 0x0806B4A8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, #0x3b
	ldr r2, _0806B4BC
	adds r1, r1, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0806B4BC: .4byte 0x082FA6AE
	thumb_func_end RemoveBattleMonPPBonus

	thumb_func_start CopyPlayerPartyMonToBattleData
CopyPlayerPartyMonToBattleData: @ 0x0806B4C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r0, #0x64
	mov r5, sb
	muls r5, r0, r5
	ldr r0, _0806B7AC
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	ldr r1, _0806B7B0
	mov r8, r1
	movs r1, #0x58
	ldr r2, [sp, #0x14]
	adds r4, r2, #0
	muls r4, r1, r4
	mov r3, r8
	adds r6, r4, r3
	strh r0, [r6]
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	strh r0, [r6, #0x2e]
	movs r6, #0
	mov r0, r8
	adds r0, #0x24
	adds r7, r4, r0
_0806B512:
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r5, #0
	movs r2, #0
	bl GetMonData
	movs r1, #0xc
	add r1, r8
	mov sl, r1
	adds r1, r4, r1
	strh r0, [r1]
	adds r1, r6, #0
	adds r1, #0x11
	adds r0, r5, #0
	movs r2, #0
	bl GetMonData
	strb r0, [r7]
	adds r7, #1
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _0806B512
	movs r0, #0x64
	mov r4, sb
	muls r4, r0, r4
	ldr r0, _0806B7AC
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	movs r2, #0xc
	rsbs r2, r2, #0
	add r2, sl
	mov sb, r2
	movs r1, #0x58
	ldr r3, [sp, #0x14]
	adds r5, r3, #0
	muls r5, r1, r5
	adds r7, r5, r2
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	adds r1, r7, #0
	adds r1, #0x2b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #0
	bl GetMonData
	mov r1, sl
	adds r1, #0x38
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0x27
	movs r2, #0
	bl GetMonData
	movs r6, #0x1f
	ands r0, r6
	ldrb r2, [r7, #0x14]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #0x14]
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #0
	bl GetMonData
	movs r1, #0x1f
	mov r8, r1
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #5
	ldrh r2, [r7, #0x14]
	ldr r1, _0806B7B4
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, #0x14]
	adds r0, r4, #0
	movs r1, #0x29
	movs r2, #0
	bl GetMonData
	ands r0, r6
	lsls r0, r0, #2
	ldrb r2, [r7, #0x15]
	movs r1, #0x7d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #0x15]
	adds r0, r4, #0
	movs r1, #0x2a
	movs r2, #0
	bl GetMonData
	movs r1, #0x1f
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [r7, #0x14]
	ldr r2, _0806B7B8
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #0x14]
	adds r0, r4, #0
	movs r1, #0x2b
	movs r2, #0
	bl GetMonData
	mov r3, r8
	ands r0, r3
	lsls r0, r0, #4
	ldrh r2, [r7, #0x16]
	ldr r1, _0806B7BC
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, #0x16]
	adds r0, r4, #0
	movs r1, #0x2c
	movs r2, #0
	bl GetMonData
	ands r0, r6
	lsls r0, r0, #1
	ldrb r2, [r7, #0x17]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #0x17]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	mov r1, sl
	adds r1, #0x3c
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0x37
	movs r2, #0
	bl GetMonData
	mov r1, sl
	adds r1, #0x40
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	adds r1, r7, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #0x28]
	adds r0, r4, #0
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #0x3b
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #2]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #4]
	adds r0, r4, #0
	movs r1, #0x3d
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #6]
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #8]
	adds r0, r4, #0
	movs r1, #0x3f
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #0xa]
	adds r0, r4, #0
	movs r1, #0x2d
	movs r2, #0
	bl GetMonData
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #6
	ldrb r2, [r7, #0x17]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #0x17]
	adds r0, r4, #0
	movs r1, #0x2e
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #7
	ldrb r2, [r7, #0x17]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #0x17]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	mov r1, sl
	adds r1, #0x48
	adds r1, r5, r1
	str r0, [r1]
	ldr r2, _0806B7C0
	ldrh r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #6]
	adds r1, r7, #0
	adds r1, #0x21
	strb r0, [r1]
	ldrh r1, [r7]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #7]
	adds r1, r7, #0
	adds r1, #0x22
	strb r0, [r1]
	ldrh r0, [r7]
	ldrb r1, [r7, #0x17]
	lsrs r1, r1, #7
	bl GetAbilityBySpecies
	adds r1, r7, #0
	adds r1, #0x20
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sl
	adds r0, #0x24
	adds r0, r5, r0
	mov r1, sp
	bl StringCopy10
	mov r2, sl
	adds r2, #0x30
	adds r2, r5, r2
	adds r0, r4, #0
	movs r1, #7
	bl GetMonData
	ldr r0, [sp, #0x14]
	bl GetBattlerSide
	ldr r1, _0806B7C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, #0xa8
	ldr r1, [r1]
	adds r1, r1, r0
	ldrh r0, [r7, #0x28]
	strh r0, [r1]
	movs r2, #6
	mov r1, sb
	movs r6, #7
	add r5, sl
	adds r0, r5, #0
	adds r0, #0x13
_0806B776:
	strb r2, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge _0806B776
	movs r2, #0
	movs r0, #0x58
	ldr r3, [sp, #0x14]
	muls r0, r3, r0
	adds r1, #0x50
	adds r0, r0, r1
	str r2, [r0]
	ldr r0, [sp, #0x14]
	bl sub_0803F6B0
	ldr r0, [sp, #0x14]
	movs r1, #0
	bl ClearTemporarySpeciesSpriteData
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B7AC: .4byte 0x02024190
_0806B7B0: .4byte 0x02023D28
_0806B7B4: .4byte 0xFFFFFC1F
_0806B7B8: .4byte 0xFFF07FFF
_0806B7BC: .4byte 0xFFFFFE0F
_0806B7C0: .4byte 0x082F0D54
_0806B7C4: .4byte 0x02024140
	thumb_func_end CopyPlayerPartyMonToBattleData

	thumb_func_start ExecuteTableBasedItemEffect
ExecuteTableBasedItemEffect: @ 0x0806B7C8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_0806B7EC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExecuteTableBasedItemEffect

	thumb_func_start sub_0806B7EC
sub_0806B7EC: @ 0x0806B7EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x44
	mov r8, r0
	ldr r0, [sp, #0x64]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x20]
	movs r1, #6
	str r1, [sp, #0x28]
	movs r2, #0
	str r2, [sp, #0x30]
	movs r3, #4
	str r3, [sp, #0x38]
	movs r5, #0
	str r5, [sp, #0x3c]
	mov r0, r8
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _0806B880
	ldr r0, _0806B85C
	ldr r1, _0806B860
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806B86C
	ldr r2, _0806B864
	ldr r0, _0806B868
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #7]
	b _0806B888
	.align 2, 0
_0806B85C: .4byte 0x03002360
_0806B860: .4byte 0x00000439
_0806B864: .4byte 0x020240A8
_0806B868: .4byte 0x0202415C
_0806B86C:
	ldr r0, _0806B878
	ldr r0, [r0]
	ldr r2, _0806B87C
	adds r0, r0, r2
	ldrb r0, [r0]
	b _0806B888
	.align 2, 0
_0806B878: .4byte 0x03005AEC
_0806B87C: .4byte 0x00003226
_0806B880:
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806B888:
	str r0, [sp, #0x34]
	ldr r1, _0806B8E4
	ldr r0, _0806B8E8
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r0, _0806B8EC
	ldr r3, _0806B8F0
	adds r0, r0, r3
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0806B928
	ldr r0, _0806B8F4
	strb r2, [r0]
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x1c]
	ldr r0, _0806B8F8
	ldr r4, [sp, #0xc]
	subs r4, #0xd
	ldrb r0, [r0]
	cmp r1, r0
	bge _0806B934
	ldr r2, _0806B8FC
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r3, [r0]
	ldr r5, [sp, #0x10]
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r3, r1
	bne _0806B900
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x38]
	b _0806B934
	.align 2, 0
_0806B8E4: .4byte 0x02023EB3
_0806B8E8: .4byte 0x0202415C
_0806B8EC: .4byte 0x03002360
_0806B8F0: .4byte 0x00000439
_0806B8F4: .4byte 0x02023D08
_0806B8F8: .4byte 0x02023D10
_0806B8FC: .4byte 0x02023D12
_0806B900:
	ldr r1, [sp, #0x1c]
	adds r1, #2
	str r1, [sp, #0x1c]
	ldr r0, _0806B924
	ldrb r0, [r0]
	cmp r1, r0
	bge _0806B934
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsrs r0, r5, #0x10
	cmp r1, r0
	bne _0806B900
	ldr r2, [sp, #0x1c]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x38]
	b _0806B934
	.align 2, 0
_0806B924: .4byte 0x02023D10
_0806B928:
	ldr r0, _0806B950
	strb r1, [r0]
	movs r3, #4
	str r3, [sp, #0x38]
	ldr r4, [sp, #0xc]
	subs r4, #0xd
_0806B934:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa5
	bhi _0806B9B4
	ldr r1, _0806B954
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0806B958
	ldr r5, [sp, #0xc]
	cmp r5, #0xaf
	beq _0806B95E
	b _0806B9B4
	.align 2, 0
_0806B950: .4byte 0x02023D08
_0806B954: .4byte 0x082EEF14
_0806B958:
	ldr r1, [sp, #0xc]
	cmp r1, #0xaf
	bne _0806B9BA
_0806B95E:
	ldr r0, _0806B980
	ldr r2, _0806B984
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806B990
	ldr r0, _0806B988
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0806B98C
	adds r0, r0, r1
	b _0806B9BA
	.align 2, 0
_0806B980: .4byte 0x03002360
_0806B984: .4byte 0x00000439
_0806B988: .4byte 0x02023D08
_0806B98C: .4byte 0x020240B0
_0806B990:
	ldr r0, _0806B99C
	ldr r0, [r0]
	ldr r3, _0806B9A0
	adds r3, r0, r3
	str r3, [sp, #0x24]
	b _0806B9BC
	.align 2, 0
_0806B99C: .4byte 0x03005AEC
_0806B9A0: .4byte 0x00003214
	thumb_func_end sub_0806B7EC

	thumb_func_start GetTrainerNameFromId
GetTrainerNameFromId: @ 0x0806B9A4
	mov r0, r8
	movs r2, #0
	ldr r3, [sp, #0x10]
	bl BeginEvolutionScene
	movs r0, #0
	bl PlayBattleBGM
_0806B9B4:
	movs r0, #1
	bl PlayBattleBGM
_0806B9BA:
	str r0, [sp, #0x24]
_0806B9BC:
	movs r5, #0
	str r5, [sp, #0x1c]
	thumb_func_end GetTrainerNameFromId

	thumb_func_start PokemonUseItemEffects
PokemonUseItemEffects: @ 0x0806B9C0
	ldr r0, [sp, #0x1c]
	cmp r0, #5
	bls _0806B9CA
	bl _0806C810
_0806B9CA:
	lsls r0, r0, #2
	ldr r1, _0806B9D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B9D4: .4byte 0x0806B9D8
_0806B9D8: @ jump table
	.4byte _0806B9F0 @ case 0
	.4byte _0806BAC0 @ case 1
	.4byte _0806BB50 @ case 2
	.4byte _0806BBE4 @ case 3
	.4byte _0806BDC4 @ case 4
	.4byte _0806C482 @ case 5
_0806B9F0:
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x1c]
	adds r2, r1, r3
	ldrb r1, [r2]
	movs r0, #0x80
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _0806BA3A
	ldr r0, _0806BAAC
	ldr r5, _0806BAB0
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806BA3A
	ldr r0, [sp, #0x38]
	cmp r0, #4
	beq _0806BA3A
	ldr r1, _0806BAB4
	movs r0, #0x58
	ldr r2, [sp, #0x38]
	muls r0, r2, r0
	adds r1, #0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0806BA3A
	ldr r0, _0806BAB8
	ands r1, r0
	str r1, [r2]
	movs r3, #0
	str r3, [sp, #0x20]
_0806BA3A:
	ldrb r1, [r6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0806BA68
	ldr r1, _0806BAB4
	ldr r0, _0806BABC
	ldrb r2, [r0]
	movs r0, #0x58
	muls r0, r2, r0
	adds r1, #0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #0xd
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0806BA68
	orrs r1, r3
	str r1, [r2]
	movs r5, #0
	str r5, [sp, #0x20]
_0806BA68:
	ldrb r0, [r6]
	movs r3, #0xf
	ands r3, r0
	cmp r3, #0
	bne _0806BA76
	bl _0806C810
_0806BA76:
	ldr r6, _0806BAB4
	ldr r5, _0806BABC
	ldrb r0, [r5]
	movs r4, #0x58
	muls r0, r4, r0
	adds r1, r0, r6
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	ble _0806BA90
	bl _0806C810
_0806BA90:
	adds r0, r2, r3
	strb r0, [r1, #0x19]
	ldrb r0, [r5]
	muls r0, r4, r0
	adds r1, r0, r6
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	bgt _0806BAA4
	b _0806BBD4
_0806BAA4:
	movs r0, #0xc
	strb r0, [r1, #0x19]
	b _0806BBD4
	.align 2, 0
_0806BAAC: .4byte 0x03002360
_0806BAB0: .4byte 0x00000439
_0806BAB4: .4byte 0x02023D28
_0806BAB8: .4byte 0xFFF0FFFF
_0806BABC: .4byte 0x02023D08
_0806BAC0:
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x1c]
	adds r2, r1, r3
	ldrb r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	lsls r3, r0, #0x18
	adds r6, r2, #0
	cmp r3, #0
	beq _0806BB06
	ldr r7, _0806BB48
	ldr r5, _0806BB4C
	ldrb r0, [r5]
	movs r4, #0x58
	muls r0, r4, r0
	adds r1, r0, r7
	ldrb r2, [r1, #0x1a]
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	bgt _0806BB06
	lsrs r0, r3, #0x1c
	adds r0, r2, r0
	strb r0, [r1, #0x1a]
	ldrb r0, [r5]
	muls r0, r4, r0
	adds r1, r0, r7
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	ble _0806BB02
	movs r0, #0xc
	strb r0, [r1, #0x1a]
_0806BB02:
	movs r5, #0
	str r5, [sp, #0x20]
_0806BB06:
	ldrb r0, [r6]
	movs r3, #0xf
	ands r3, r0
	cmp r3, #0
	bne _0806BB14
	bl _0806C810
_0806BB14:
	ldr r6, _0806BB48
	ldr r5, _0806BB4C
	ldrb r0, [r5]
	movs r4, #0x58
	muls r0, r4, r0
	adds r1, r0, r6
	ldrb r2, [r1, #0x1b]
	movs r0, #0x1b
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	ble _0806BB2E
	bl _0806C810
_0806BB2E:
	adds r0, r2, r3
	strb r0, [r1, #0x1b]
	ldrb r0, [r5]
	muls r0, r4, r0
	adds r1, r0, r6
	movs r0, #0x1b
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	ble _0806BBD4
	movs r0, #0xc
	strb r0, [r1, #0x1b]
	b _0806BBD4
	.align 2, 0
_0806BB48: .4byte 0x02023D28
_0806BB4C: .4byte 0x02023D08
_0806BB50:
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x1c]
	adds r2, r1, r3
	ldrb r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	lsls r3, r0, #0x18
	adds r6, r2, #0
	cmp r3, #0
	beq _0806BB96
	ldr r7, _0806BBDC
	ldr r5, _0806BBE0
	ldrb r0, [r5]
	movs r4, #0x58
	muls r0, r4, r0
	adds r1, r0, r7
	ldrb r2, [r1, #0x1e]
	movs r0, #0x1e
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	bgt _0806BB96
	lsrs r0, r3, #0x1c
	adds r0, r2, r0
	strb r0, [r1, #0x1e]
	ldrb r0, [r5]
	muls r0, r4, r0
	adds r1, r0, r7
	movs r0, #0x1e
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	ble _0806BB92
	movs r0, #0xc
	strb r0, [r1, #0x1e]
_0806BB92:
	movs r5, #0
	str r5, [sp, #0x20]
_0806BB96:
	ldrb r0, [r6]
	movs r3, #0xf
	ands r3, r0
	cmp r3, #0
	bne _0806BBA4
	bl _0806C810
_0806BBA4:
	ldr r6, _0806BBDC
	ldr r5, _0806BBE0
	ldrb r0, [r5]
	movs r4, #0x58
	muls r0, r4, r0
	adds r1, r0, r6
	ldrb r2, [r1, #0x1c]
	movs r0, #0x1c
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	ble _0806BBBE
	bl _0806C810
_0806BBBE:
	adds r0, r2, r3
	strb r0, [r1, #0x1c]
	ldrb r0, [r5]
	muls r0, r4, r0
	adds r1, r0, r6
	movs r0, #0x1c
	ldrsb r0, [r1, r0]
	cmp r0, #0xc
	ble _0806BBD4
	movs r0, #0xc
	strb r0, [r1, #0x1c]
_0806BBD4:
	movs r0, #0
	str r0, [sp, #0x20]
	bl _0806C810
	.align 2, 0
_0806BBDC: .4byte 0x02023D28
_0806BBE0: .4byte 0x02023D08
_0806BBE4:
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x1c]
	adds r2, r1, r3
	ldrb r1, [r2]
	movs r0, #0x80
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _0806BC2C
	ldr r5, _0806BDA0
	ldr r4, _0806BDA4
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1, #4]
	cmp r0, #0
	bne _0806BC2C
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r0, #5
	strb r0, [r1, #4]
	movs r5, #0
	str r5, [sp, #0x20]
_0806BC2C:
	ldrb r1, [r6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806BC8E
	mov r0, r8
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	cmp r0, #0x64
	beq _0806BC8E
	ldr r5, _0806BDA8
	mov r0, r8
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, #1
	lsls r4, r4, #2
	ldr r2, _0806BDAC
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r1, r0
	adds r4, r4, r0
	adds r4, r4, r5
	ldr r0, [r4]
	str r0, [sp]
	mov r0, r8
	movs r1, #0x19
	mov r2, sp
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	movs r0, #0
	str r0, [sp, #0x20]
_0806BC8E:
	ldrb r1, [r6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0806BCCA
	mov r0, r8
	ldr r1, [sp, #0x10]
	movs r2, #7
	ldr r3, [sp, #0x38]
	bl HealStatusConditions
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806BCCA
	ldr r1, [sp, #0x38]
	cmp r1, #4
	beq _0806BCC6
	ldr r1, _0806BDB0
	movs r0, #0x58
	ldr r3, [sp, #0x38]
	adds r2, r3, #0
	muls r2, r0, r2
	adds r1, #0x50
	adds r2, r2, r1
	ldr r0, [r2]
	ldr r1, _0806BDB4
	ands r0, r1
	str r0, [r2]
_0806BCC6:
	movs r5, #0
	str r5, [sp, #0x20]
_0806BCCA:
	ldrb r1, [r6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0806BCEA
	ldr r2, _0806BDB8
	mov r0, r8
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0x38]
	bl HealStatusConditions
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806BCEA
	movs r0, #0
	str r0, [sp, #0x20]
_0806BCEA:
	ldrb r1, [r6]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806BD0A
	mov r0, r8
	ldr r1, [sp, #0x10]
	movs r2, #0x10
	ldr r3, [sp, #0x38]
	bl HealStatusConditions
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806BD0A
	movs r1, #0
	str r1, [sp, #0x20]
_0806BD0A:
	ldrb r1, [r6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0806BD2A
	mov r0, r8
	ldr r1, [sp, #0x10]
	movs r2, #0x20
	ldr r3, [sp, #0x38]
	bl HealStatusConditions
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806BD2A
	movs r2, #0
	str r2, [sp, #0x20]
_0806BD2A:
	ldrb r1, [r6]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806BD4A
	mov r0, r8
	ldr r1, [sp, #0x10]
	movs r2, #0x40
	ldr r3, [sp, #0x38]
	bl HealStatusConditions
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806BD4A
	movs r3, #0
	str r3, [sp, #0x20]
_0806BD4A:
	ldrb r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0806BD58
	bl _0806C810
_0806BD58:
	ldr r0, _0806BDBC
	ldr r5, _0806BDC0
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0806BD6C
	bl _0806C810
_0806BD6C:
	ldr r0, [sp, #0x38]
	cmp r0, #4
	bne _0806BD76
	bl _0806C810
_0806BD76:
	ldr r1, _0806BDB0
	movs r0, #0x58
	ldr r2, [sp, #0x38]
	muls r0, r2, r0
	adds r1, #0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806BD90
	bl _0806C810
_0806BD90:
	movs r0, #8
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2]
	movs r3, #0
	str r3, [sp, #0x20]
	bl _0806C810
	.align 2, 0
_0806BDA0: .4byte 0x02023F38
_0806BDA4: .4byte 0x02023D08
_0806BDA8: .4byte 0x082F00B4
_0806BDAC: .4byte 0x082F0D54
_0806BDB0: .4byte 0x02023D28
_0806BDB4: .4byte 0xF7FFFFFF
_0806BDB8: .4byte 0x00000F88
_0806BDBC: .4byte 0x03002360
_0806BDC0: .4byte 0x00000439
_0806BDC4:
	ldr r5, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	adds r0, r5, r1
	ldrb r0, [r0]
	mov sl, r0
	movs r0, #0x20
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806BE9C
	movs r0, #0xdf
	ands r2, r0
	mov sl, r2
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	ldr r1, _0806BEC8
	ldr r3, [sp, #0x14]
	adds r1, r3, r1
	ldrb r1, [r1]
	ands r0, r1
	lsls r1, r3, #1
	lsrs r0, r1
	str r0, [sp]
	adds r5, r3, #0
	adds r5, #0xd
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	ldr r0, [sp]
	cmp r0, #2
	bhi _0806BE9C
	ldr r0, [sp, #0x2c]
	cmp r0, #4
	bls _0806BE9C
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	ldr r1, _0806BECC
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	mov r0, r8
	movs r1, #0x15
	mov r2, sp
	bl SetMonData
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [sp, #0x14]
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x2c]
	subs r0, r0, r3
	str r0, [sp]
	ldr r4, [sp, #0x14]
	adds r4, #0x11
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [sp]
	mov r0, r8
	adds r1, r4, #0
	mov r2, sp
	bl SetMonData
	movs r5, #0
	str r5, [sp, #0x20]
_0806BE9C:
	movs r0, #0
	str r0, [sp, #0x2c]
	mov r1, sl
	cmp r1, #0
	bne _0806BEAA
	bl _0806C810
_0806BEAA:
	movs r0, #1
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	bne _0806BEB6
	b _0806C46E
_0806BEB6:
	ldr r3, [sp, #0x2c]
	cmp r3, #7
	bls _0806BEBE
	b _0806C46E
_0806BEBE:
	lsls r0, r3, #2
	ldr r1, _0806BED0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806BEC8: .4byte 0x082FA6AA
_0806BECC: .4byte 0x082FA6B2
_0806BED0: .4byte 0x0806BED4
_0806BED4: @ jump table
	.4byte _0806BEF4 @ case 0
	.4byte _0806BEF4 @ case 1
	.4byte _0806BFA0 @ case 2
	.4byte _0806C1C4 @ case 3
	.4byte _0806C46E @ case 4
	.4byte _0806C46E @ case 5
	.4byte _0806C46E @ case 6
	.4byte _0806C458 @ case 7
_0806BEF4:
	mov r0, r8
	bl GetMonEVCount
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r5, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r5, r1
	ldrb r5, [r0]
	ldr r0, _0806BF40
	ldr r2, [sp, #0x2c]
	adds r0, r2, r0
	ldrb r1, [r0]
	mov r0, r8
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	str r1, [sp, #4]
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	ble _0806BF5C
	ldr r0, _0806BF44
	cmp r6, r0
	bls _0806BF2A
	b _0806B9B4
_0806BF2A:
	adds r3, r1, #0
	cmp r3, #0x63
	ble _0806BF32
	b _0806C46E
_0806BF32:
	adds r1, r3, r2
	cmp r1, #0x64
	ble _0806BF48
	adds r0, r2, #0
	adds r0, #0x64
	subs r5, r0, r1
	b _0806BF4A
	.align 2, 0
_0806BF40: .4byte 0x082FA84E
_0806BF44: .4byte 0x000001FD
_0806BF48:
	adds r5, r2, #0
_0806BF4A:
	adds r1, r6, r5
	movs r0, #0xff
	lsls r0, r0, #1
	cmp r1, r0
	bls _0806BF58
	adds r0, r5, r0
	subs r5, r0, r1
_0806BF58:
	adds r0, r3, r5
	b _0806BF76
_0806BF5C:
	cmp r1, #0
	bne _0806BF6C
	movs r3, #1
	str r3, [sp, #0x3c]
	ldr r0, [sp, #0x28]
	adds r0, #1
	lsls r0, r0, #0x18
	b _0806C302
_0806BF6C:
	adds r0, r1, r2
	str r0, [sp, #4]
	cmp r0, #0
	bge _0806BF78
	movs r0, #0
_0806BF76:
	str r0, [sp, #4]
_0806BF78:
	ldr r0, _0806BF9C
	ldr r5, [sp, #0x2c]
	adds r0, r5, r0
	ldrb r1, [r0]
	add r2, sp, #4
	mov r0, r8
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	ldr r0, [sp, #0x28]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	b _0806C43C
	.align 2, 0
_0806BF9C: .4byte 0x082FA84E
_0806BFA0:
	movs r0, #0x10
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _0806C060
	mov r0, r8
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0806BFC0
	ldr r0, [sp, #0x28]
	adds r0, #1
	lsls r0, r0, #0x18
	b _0806C302
_0806BFC0:
	ldr r0, _0806C008
	ldr r2, _0806C00C
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r4, #2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806C076
	ldr r3, [sp, #0x38]
	cmp r3, #4
	beq _0806C020
	ldr r2, _0806C010
	ldr r1, _0806C014
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldr r1, _0806C018
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [sp, #0x38]
	bl CopyPlayerPartyMonToBattleData
	ldr r0, _0806C01C
	ldrb r0, [r0]
	b _0806C038
	.align 2, 0
_0806C008: .4byte 0x03002360
_0806C00C: .4byte 0x00000439
_0806C010: .4byte 0x02023EB4
_0806C014: .4byte 0x082FACB4
_0806C018: .4byte 0x02023D12
_0806C01C: .4byte 0x02023D08
_0806C020:
	ldr r3, _0806C050
	ldr r1, _0806C054
	ldr r2, _0806C058
	ldrb r0, [r2]
	eors r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r3]
	bics r0, r1
	strb r0, [r3]
	ldrb r0, [r2]
_0806C038:
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806C076
	ldr r1, _0806C05C
	ldrb r0, [r1, #4]
	cmp r0, #0xfe
	bhi _0806C076
	adds r0, #1
	strb r0, [r1, #4]
	b _0806C076
	.align 2, 0
_0806C050: .4byte 0x02023EB4
_0806C054: .4byte 0x082FACB4
_0806C058: .4byte 0x02023D08
_0806C05C: .4byte 0x03005A70
_0806C060:
	mov r0, r8
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0806C076
	ldr r0, [sp, #0x28]
	adds r0, #1
	lsls r0, r0, #0x18
	b _0806C302
_0806C076:
	ldr r1, [sp, #0x28]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	ldr r5, [sp, #0x24]
	adds r1, r5, r1
	ldrb r1, [r1]
	str r1, [sp]
	adds r0, r1, #0
	cmp r0, #0xfe
	beq _0806C0B8
	cmp r0, #0xfe
	bhi _0806C098
	cmp r0, #0xfd
	beq _0806C0CE
	b _0806C0D6
_0806C098:
	cmp r1, #0xff
	bne _0806C0D6
	mov r0, r8
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	subs r4, r4, r0
	str r4, [sp]
	b _0806C0D6
_0806C0B8:
	mov r0, r8
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	lsrs r0, r0, #1
	str r0, [sp]
	cmp r0, #0
	bne _0806C0D6
	movs r0, #1
	b _0806C0D4
_0806C0CE:
	ldr r0, _0806C190
	adds r0, #0x23
	ldrb r0, [r0]
_0806C0D4:
	str r0, [sp]
_0806C0D6:
	mov r0, r8
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r4, r0
	beq _0806C1B4
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0806C1A8
	mov r0, r8
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [sp]
	mov r0, r8
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	ldr r1, [sp]
	cmp r1, r0
	bls _0806C122
	mov r0, r8
	movs r1, #0x3a
	movs r2, #0
	bl GetMonData
	str r0, [sp]
_0806C122:
	mov r0, r8
	movs r1, #0x39
	mov r2, sp
	bl SetMonData
	ldr r0, _0806C194
	ldr r1, _0806C198
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806C1B0
	ldr r2, [sp, #0x38]
	cmp r2, #4
	beq _0806C1B0
	ldr r1, _0806C19C
	movs r0, #0x58
	muls r0, r2, r0
	adds r0, r0, r1
	ldr r1, [sp]
	strh r1, [r0, #0x28]
	movs r0, #0x10
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	bne _0806C1B0
	ldr r4, _0806C1A0
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806C1B0
	ldr r1, _0806C1A4
	ldrb r0, [r1, #3]
	cmp r0, #0xfe
	bhi _0806C172
	adds r0, #1
	strb r0, [r1, #3]
_0806C172:
	ldrb r5, [r4]
	add r0, sp, #0x38
	ldrb r0, [r0]
	strb r0, [r4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BtlController_EmitGetMonData
	ldrb r0, [r4]
	bl MarkBattlerForControllerExec
	strb r5, [r4]
	b _0806C1B0
	.align 2, 0
_0806C190: .4byte 0x02024118
_0806C194: .4byte 0x03002360
_0806C198: .4byte 0x00000439
_0806C19C: .4byte 0x02023D28
_0806C1A0: .4byte 0x02023D08
_0806C1A4: .4byte 0x03005A70
_0806C1A8:
	ldr r1, _0806C1C0
	ldr r0, [sp]
	rsbs r0, r0, #0
	str r0, [r1]
_0806C1B0:
	movs r1, #0
	str r1, [sp, #0x20]
_0806C1B4:
	movs r0, #0xef
	mov r2, sl
	ands r2, r0
	mov sl, r2
	b _0806C46E
	.align 2, 0
_0806C1C0: .4byte 0x02023E94
_0806C1C4:
	movs r7, #2
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _0806C1D0
	b _0806C31C
_0806C1D0:
	movs r5, #0
	ldr r3, [sp, #0x28]
	adds r3, #1
	str r3, [sp, #0x40]
_0806C1D8:
	movs r0, #0x11
	adds r0, r0, r5
	mov sb, r0
	mov r0, r8
	mov r1, sb
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	adds r7, r5, #0
	adds r7, #0xd
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	adds r2, r6, #0
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp]
	cmp r1, r0
	beq _0806C2F6
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r1, r0
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	adds r2, r6, #0
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp]
	cmp r1, r0
	bls _0806C290
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	adds r2, r6, #0
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
_0806C290:
	mov r0, r8
	mov r1, sb
	mov r2, sp
	bl SetMonData
	ldr r0, _0806C308
	ldr r1, _0806C30C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806C2F2
	ldr r2, [sp, #0x38]
	cmp r2, #4
	beq _0806C2F2
	ldr r4, _0806C310
	movs r0, #0x58
	adds r3, r2, #0
	muls r3, r0, r3
	adds r0, r4, #0
	adds r0, #0x50
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r1, r0
	cmp r1, #0
	bne _0806C2F2
	ldr r1, _0806C314
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x18]
	lsrs r1, r1, #4
	ldr r2, _0806C318
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0806C2F2
	adds r0, r5, r3
	adds r1, r4, #0
	adds r1, #0x24
	adds r0, r0, r1
	ldr r1, [sp]
	strb r1, [r0]
_0806C2F2:
	movs r3, #0
	str r3, [sp, #0x20]
_0806C2F6:
	adds r5, #1
	cmp r5, #3
	bgt _0806C2FE
	b _0806C1D8
_0806C2FE:
	ldr r5, [sp, #0x40]
	lsls r0, r5, #0x18
_0806C302:
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	b _0806C46E
	.align 2, 0
_0806C308: .4byte 0x03002360
_0806C30C: .4byte 0x00000439
_0806C310: .4byte 0x02023D28
_0806C314: .4byte 0x02023F60
_0806C318: .4byte 0x082FACB4
_0806C31C:
	ldr r6, [sp, #0x14]
	adds r6, #0x11
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	ldr r5, [sp, #0x14]
	adds r5, #0xd
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	cmp r2, r0
	bne _0806C364
	b _0806C46E
_0806C364:
	ldr r1, [sp, #0x28]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	adds r1, r0, r1
	ldrb r0, [r1]
	adds r0, r2, r0
	str r0, [sp]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp]
	cmp r1, r0
	bls _0806C3D8
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
_0806C3D8:
	mov r0, r8
	adds r1, r6, #0
	mov r2, sp
	bl SetMonData
	ldr r0, _0806C444
	ldr r1, _0806C448
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0806C43C
	ldr r2, [sp, #0x38]
	cmp r2, #4
	beq _0806C43C
	ldr r4, _0806C44C
	movs r0, #0x58
	adds r3, r2, #0
	muls r3, r0, r3
	adds r0, r4, #0
	adds r0, #0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	bne _0806C43C
	ldr r1, _0806C450
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x18]
	lsrs r1, r1, #4
	ldr r2, _0806C454
	ldr r5, [sp, #0x14]
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0806C43C
	adds r0, r5, r3
	adds r1, r4, #0
	adds r1, #0x24
	adds r0, r0, r1
	ldr r1, [sp]
	strb r1, [r0]
_0806C43C:
	movs r0, #0
	str r0, [sp, #0x20]
	b _0806C46E
	.align 2, 0
_0806C444: .4byte 0x03002360
_0806C448: .4byte 0x00000439
_0806C44C: .4byte 0x02023D28
_0806C450: .4byte 0x02023F60
_0806C454: .4byte 0x082FACB4
_0806C458:
	mov r0, r8
	movs r1, #2
	ldr r2, [sp, #0xc]
	bl GetEvolutionTargetSpecies
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0806C46E
	bl GetTrainerNameFromId
_0806C46E:
	ldr r1, [sp, #0x2c]
	adds r1, #1
	str r1, [sp, #0x2c]
	mov r2, sl
	lsrs r2, r2, #1
	mov sl, r2
	cmp r2, #0
	beq _0806C480
	b _0806BEAA
_0806C480:
	b _0806C810
_0806C482:
	ldr r3, [sp, #0x24]
	ldr r5, [sp, #0x1c]
	adds r0, r3, r5
	ldrb r0, [r0]
	mov sl, r0
	movs r0, #0
	str r0, [sp, #0x2c]
	mov r1, sl
	cmp r1, #0
	bne _0806C498
	b _0806C810
_0806C498:
	movs r0, #1
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	bne _0806C4A4
	b _0806C7FE
_0806C4A4:
	ldr r3, [sp, #0x2c]
	cmp r3, #7
	bls _0806C4AC
	b _0806C7FE
_0806C4AC:
	lsls r0, r3, #2
	ldr r1, _0806C4B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C4B8: .4byte 0x0806C4BC
_0806C4BC: @ jump table
	.4byte _0806C4DC @ case 0
	.4byte _0806C4DC @ case 1
	.4byte _0806C4DC @ case 2
	.4byte _0806C4DC @ case 3
	.4byte _0806C57C @ case 4
	.4byte _0806C658 @ case 5
	.4byte _0806C6C4 @ case 6
	.4byte _0806C72C @ case 7
_0806C4DC:
	mov r0, r8
	bl GetMonEVCount
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r5, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r5, r1
	ldrb r5, [r0]
	ldr r0, _0806C52C
	ldr r4, [sp, #0x2c]
	adds r4, #2
	adds r0, r4, r0
	ldrb r1, [r0]
	mov r0, r8
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	str r1, [sp, #4]
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	ble _0806C548
	ldr r0, _0806C530
	cmp r6, r0
	bls _0806C516
	bl _0806B9B4
_0806C516:
	adds r3, r1, #0
	cmp r3, #0x63
	ble _0806C51E
	b _0806C7FE
_0806C51E:
	adds r1, r3, r2
	cmp r1, #0x64
	ble _0806C534
	adds r0, r2, #0
	adds r0, #0x64
	subs r5, r0, r1
	b _0806C536
	.align 2, 0
_0806C52C: .4byte 0x082FA84E
_0806C530: .4byte 0x000001FD
_0806C534:
	adds r5, r2, #0
_0806C536:
	adds r1, r6, r5
	movs r0, #0xff
	lsls r0, r0, #1
	cmp r1, r0
	bls _0806C544
	adds r0, r5, r0
	subs r5, r0, r1
_0806C544:
	adds r0, r3, r5
	b _0806C55C
_0806C548:
	cmp r1, #0
	bne _0806C552
	movs r2, #1
	str r2, [sp, #0x3c]
	b _0806C7F4
_0806C552:
	adds r0, r1, r2
	str r0, [sp, #4]
	cmp r0, #0
	bge _0806C55E
	movs r0, #0
_0806C55C:
	str r0, [sp, #4]
_0806C55E:
	ldr r0, _0806C578
	adds r0, r4, r0
	ldrb r1, [r0]
	add r2, sp, #4
	mov r0, r8
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	movs r3, #0
	str r3, [sp, #0x20]
	b _0806C7F4
	.align 2, 0
_0806C578: .4byte 0x082FA84E
_0806C57C:
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	ldr r1, _0806C64C
	ldr r5, [sp, #0x14]
	adds r1, r5, r1
	ldrb r1, [r1]
	ands r0, r1
	lsls r1, r5, #1
	lsrs r0, r1
	str r0, [sp]
	adds r6, r5, #0
	adds r6, #0xd
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [sp]
	cmp r0, #2
	bls _0806C5CE
	b _0806C7FE
_0806C5CE:
	cmp r5, #4
	bhi _0806C5D4
	b _0806C7FE
_0806C5D4:
	mov r0, r8
	movs r1, #0x15
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	ldr r1, _0806C650
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	ldrb r2, [r1]
	ands r2, r0
	str r2, [sp]
	ldr r0, _0806C654
	ldr r3, [sp, #0x14]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [sp]
	mov r0, r8
	movs r1, #0x15
	mov r2, sp
	bl SetMonData
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [sp, #0x14]
	bl CalculatePPWithBonus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, r0, r5
	str r0, [sp]
	ldr r4, [sp, #0x14]
	adds r4, #0x11
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [sp]
	mov r0, r8
	adds r1, r4, #0
	mov r2, sp
	bl SetMonData
	movs r5, #0
	str r5, [sp, #0x20]
	b _0806C7FE
	.align 2, 0
_0806C64C: .4byte 0x082FA6AA
_0806C650: .4byte 0x082FA6AE
_0806C654: .4byte 0x082FA6B2
_0806C658:
	mov r0, r8
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	cmp r0, #0x63
	bls _0806C668
	b _0806C7F4
_0806C668:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0806C676
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	bne _0806C676
	b _0806C7F4
_0806C676:
	bl sub_0806EB88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806C682
	b _0806C7F4
_0806C682:
	ldr r2, [sp, #0x30]
	cmp r2, #0
	beq _0806C68A
	b _0806C7F4
_0806C68A:
	ldr r3, [sp, #0x24]
	ldr r5, [sp, #0x28]
	adds r0, r3, r5
	ldrb r0, [r0]
	str r0, [sp, #0x30]
	mov r0, r8
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	str r5, [sp, #8]
	ldr r0, [sp, #0x30]
	lsls r4, r0, #0x18
	asrs r1, r4, #0x18
	cmp r1, #0
	ble _0806C790
	ldr r2, [sp, #0x34]
	cmp r2, #0x1b
	bne _0806C790
	movs r0, #0x96
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, r5, r0
	str r0, [sp, #8]
	adds r2, r4, #0
	b _0806C79C
_0806C6C4:
	mov r0, r8
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	cmp r0, #0x63
	bhi _0806C6D4
	b _0806C7F4
_0806C6D4:
	mov r0, r8
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	cmp r0, #0xc7
	bls _0806C6E4
	b _0806C7F4
_0806C6E4:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0806C6F2
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	bne _0806C6F2
	b _0806C7F4
_0806C6F2:
	bl sub_0806EB88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806C7F4
	ldr r2, [sp, #0x30]
	cmp r2, #0
	bne _0806C7F4
	ldr r3, [sp, #0x24]
	ldr r5, [sp, #0x28]
	adds r0, r3, r5
	ldrb r0, [r0]
	str r0, [sp, #0x30]
	mov r0, r8
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	str r4, [sp, #8]
	ldr r0, [sp, #0x30]
	lsls r5, r0, #0x18
	asrs r1, r5, #0x18
	cmp r1, #0
	ble _0806C790
	ldr r2, [sp, #0x34]
	cmp r2, #0x1b
	beq _0806C77E
	b _0806C790
_0806C72C:
	mov r0, r8
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	cmp r0, #0xc7
	bls _0806C7F4
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0806C746
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	beq _0806C7F4
_0806C746:
	bl sub_0806EB88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806C7F4
	ldr r2, [sp, #0x30]
	cmp r2, #0
	bne _0806C7F4
	ldr r3, [sp, #0x24]
	ldr r5, [sp, #0x28]
	adds r0, r3, r5
	ldrb r0, [r0]
	str r0, [sp, #0x30]
	mov r0, r8
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	str r4, [sp, #8]
	ldr r0, [sp, #0x30]
	lsls r5, r0, #0x18
	asrs r1, r5, #0x18
	cmp r1, #0
	ble _0806C790
	ldr r2, [sp, #0x34]
	cmp r2, #0x1b
	bne _0806C790
_0806C77E:
	movs r0, #0x96
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	adds r0, r4, r0
	str r0, [sp, #8]
	adds r2, r5, #0
	b _0806C79C
_0806C790:
	ldr r3, [sp, #0x30]
	lsls r2, r3, #0x18
	asrs r1, r2, #0x18
	ldr r0, [sp, #8]
	adds r0, r0, r1
	str r0, [sp, #8]
_0806C79C:
	cmp r2, #0
	ble _0806C7D2
	mov r0, r8
	movs r1, #0x26
	movs r2, #0
	bl GetMonData
	cmp r0, #0xb
	bne _0806C7B4
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
_0806C7B4:
	mov r0, r8
	movs r1, #0x23
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	bl GetCurrentRegionMapSectionId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0806C7D2
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
_0806C7D2:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _0806C7DC
	movs r0, #0
	str r0, [sp, #8]
_0806C7DC:
	ldr r0, [sp, #8]
	cmp r0, #0xff
	ble _0806C7E6
	movs r0, #0xff
	str r0, [sp, #8]
_0806C7E6:
	add r2, sp, #8
	mov r0, r8
	movs r1, #0x20
	bl SetMonData
	movs r5, #0
	str r5, [sp, #0x20]
_0806C7F4:
	ldr r0, [sp, #0x28]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
_0806C7FE:
	ldr r0, [sp, #0x2c]
	adds r0, #1
	str r0, [sp, #0x2c]
	mov r1, sl
	lsrs r1, r1, #1
	mov sl, r1
	cmp r1, #0
	beq _0806C810
	b _0806C498
_0806C810:
	ldr r2, [sp, #0x1c]
	adds r2, #1
	str r2, [sp, #0x1c]
	cmp r2, #5
	bgt _0806C81E
	bl PokemonUseItemEffects
_0806C81E:
	ldr r0, [sp, #0x20]
	thumb_func_end PokemonUseItemEffects

	thumb_func_start PlayBattleBGM
PlayBattleBGM: @ 0x0806C820
	add sp, #0x44
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end PlayBattleBGM

	thumb_func_start HealStatusConditions
HealStatusConditions: @ 0x0806C830
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r2, #0
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	movs r1, #0x37
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	str r1, [sp]
	ands r0, r4
	cmp r0, #0
	beq _0806C894
	mvns r4, r4
	ands r1, r4
	str r1, [sp]
	adds r0, r5, #0
	movs r1, #0x37
	mov r2, sp
	bl SetMonData
	ldr r0, _0806C888
	ldr r1, _0806C88C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806C882
	cmp r6, #4
	beq _0806C882
	ldr r0, _0806C890
	movs r1, #0x58
	muls r1, r6, r1
	adds r0, #0x4c
	adds r1, r1, r0
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
_0806C882:
	movs r0, #0
	b _0806C896
	.align 2, 0
_0806C888: .4byte 0x03002360
_0806C88C: .4byte 0x00000439
_0806C890: .4byte 0x02023D28
_0806C894:
	movs r0, #1
_0806C896:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HealStatusConditions

	thumb_func_start GetItemEffectParamOffset
GetItemEffectParamOffset: @ 0x0806C8A0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r7, #6
	ldr r1, _0806C8C8
	adds r0, r3, #0
	subs r0, #0xd
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0806C8CC
	cmp r3, #0xaf
	beq _0806C8D0
_0806C8C4:
	movs r0, #0
	b _0806C9E0
	.align 2, 0
_0806C8C8: .4byte 0x082EEF14
_0806C8CC:
	cmp r3, #0xaf
	bne _0806C8DE
_0806C8D0:
	ldr r0, _0806C8F0
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0806C8F4
	adds r0, r0, r1
_0806C8DE:
	mov ip, r0
	movs r2, #0
_0806C8E2:
	cmp r2, #4
	beq _0806C902
	cmp r2, #4
	ble _0806C8F8
	cmp r2, #5
	beq _0806C98C
	b _0806C9D6
	.align 2, 0
_0806C8F0: .4byte 0x02023D08
_0806C8F4: .4byte 0x020240B0
_0806C8F8:
	cmp r2, #0
	blt _0806C9D6
	cmp r2, r4
	bne _0806C9D6
	b _0806C8C4
_0806C902:
	mov r0, ip
	ldrb r3, [r0, #4]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0806C912
	movs r0, #0xdf
	ands r3, r0
_0806C912:
	movs r6, #0
	cmp r3, #0
	beq _0806C9D6
_0806C918:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0806C978
	cmp r6, #7
	bhi _0806C978
	lsls r0, r6, #2
	ldr r1, _0806C930
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C930: .4byte 0x0806C934
_0806C934: @ jump table
	.4byte _0806C960 @ case 0
	.4byte _0806C960 @ case 1
	.4byte _0806C954 @ case 2
	.4byte _0806C960 @ case 3
	.4byte _0806C978 @ case 4
	.4byte _0806C978 @ case 5
	.4byte _0806C978 @ case 6
	.4byte _0806C974 @ case 7
_0806C954:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0806C960
	movs r0, #0xef
	ands r3, r0
_0806C960:
	cmp r2, r4
	bne _0806C96C
	adds r0, r3, #0
	ands r0, r5
	cmp r0, #0
	bne _0806C9DE
_0806C96C:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _0806C978
_0806C974:
	cmp r2, r4
	beq _0806C8C4
_0806C978:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsrs r3, r3, #1
	cmp r2, r4
	bne _0806C986
	lsrs r5, r5, #1
_0806C986:
	cmp r3, #0
	bne _0806C918
	b _0806C9D6
_0806C98C:
	mov r0, ip
	ldrb r3, [r0, #5]
	movs r6, #0
_0806C992:
	cmp r3, #0
	beq _0806C9D6
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0806C9C6
	cmp r6, #0
	blt _0806C9C6
	cmp r6, #6
	ble _0806C9AC
	cmp r6, #7
	beq _0806C9C0
	b _0806C9C6
_0806C9AC:
	cmp r2, r4
	bne _0806C9B8
	adds r0, r3, #0
	ands r0, r5
	cmp r0, #0
	bne _0806C9DE
_0806C9B8:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _0806C9C6
_0806C9C0:
	cmp r2, r4
	bne _0806C9C6
	b _0806C8C4
_0806C9C6:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsrs r3, r3, #1
	cmp r2, r4
	bne _0806C992
	lsrs r5, r5, #1
	b _0806C992
_0806C9D6:
	adds r2, #1
	cmp r2, #5
	bgt _0806C9DE
	b _0806C8E2
_0806C9DE:
	adds r0, r7, #0
_0806C9E0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetItemEffectParamOffset

	thumb_func_start sub_0806C9E8
sub_0806C9E8: @ 0x0806C9E8
	push {lr}
	ldr r2, _0806CA1C
	ldr r1, _0806CA20
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r3, _0806CA24
	ldr r2, _0806CA28
	ldr r1, _0806CA2C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r3, #0
	bl StringCopy
	ldr r0, _0806CA30
	ldr r1, _0806CA34
	bl StringCopy
	ldr r0, _0806CA38
	bl TryGetStatusString
	pop {r0}
	bx r0
	.align 2, 0
_0806CA1C: .4byte 0x02023EB0
_0806CA20: .4byte 0x0202415C
_0806CA24: .4byte 0x02022C0C
_0806CA28: .4byte 0x085AB08C
_0806CA2C: .4byte 0x082FA854
_0806CA30: .4byte 0x02022C1C
_0806CA34: .4byte 0x085AA877
_0806CA38: .4byte 0x085AA894
	thumb_func_end sub_0806C9E8

	thumb_func_start sub_0806CA3C
sub_0806CA3C: @ 0x0806CA3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _0806CA90
	ldr r0, _0806CA6C
	ldr r1, _0806CA70
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806CA7C
	ldr r2, _0806CA74
	ldrb r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0806CA78
	adds r7, r0, r1
	b _0806CA9C
	.align 2, 0
_0806CA6C: .4byte 0x03002360
_0806CA70: .4byte 0x00000439
_0806CA74: .4byte 0x0202415C
_0806CA78: .4byte 0x020240B0
_0806CA7C:
	ldr r0, _0806CA88
	ldr r0, [r0]
	ldr r1, _0806CA8C
	adds r7, r0, r1
	b _0806CA9A
	.align 2, 0
_0806CA88: .4byte 0x03005AEC
_0806CA8C: .4byte 0x00003214
_0806CA90:
	ldr r1, _0806CAD4
	subs r0, #0xd
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
_0806CA9A:
	ldr r2, _0806CAD8
_0806CA9C:
	ldr r1, _0806CADC
	ldrb r0, [r2]
	strb r0, [r1]
	movs r5, #0
	ldr r0, _0806CAE0
	mov r8, r0
	movs r6, #0
_0806CAAA:
	adds r4, r7, r5
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0806CABC
	adds r0, r6, #0
	bl sub_0806C9E8
_0806CABC:
	ldrb r1, [r4]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0806CAF2
	cmp r5, #0
	beq _0806CAE4
	adds r0, r6, #1
	bl sub_0806C9E8
	b _0806CAF2
	.align 2, 0
_0806CAD4: .4byte 0x082EEF14
_0806CAD8: .4byte 0x0202415C
_0806CADC: .4byte 0x02023EB3
_0806CAE0: .4byte 0x02023EAF
_0806CAE4:
	ldr r0, _0806CB20
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0806CB24
	bl TryGetStatusString
_0806CAF2:
	adds r6, #2
	adds r5, #1
	cmp r5, #2
	ble _0806CAAA
	ldrb r1, [r7, #3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806CB12
	ldr r1, _0806CB28
	ldr r0, _0806CB20
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0806CB2C
	bl TryGetStatusString
_0806CB12:
	ldr r0, _0806CB30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806CB20: .4byte 0x0202415C
_0806CB24: .4byte 0x085A9D39
_0806CB28: .4byte 0x02023EAF
_0806CB2C: .4byte 0x085A9D15
_0806CB30: .4byte 0x02022AE0
	thumb_func_end sub_0806CA3C

	thumb_func_start GetNature
GetNature: @ 0x0806CB34
	push {lr}
	movs r1, #0
	movs r2, #0
	bl GetMonData
	movs r1, #0x19
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end GetNature

	thumb_func_start GetNatureFromPersonality
GetNatureFromPersonality: @ 0x0806CB4C
	push {lr}
	movs r1, #0x19
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end GetNatureFromPersonality

	thumb_func_start GetEvolutionTargetSpecies
GetEvolutionTargetSpecies: @ 0x0806CB5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	movs r0, #0
	mov sl, r0
	mov r0, r8
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r0, r8
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	mov r0, r8
	movs r1, #0
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0x17
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	lsrs r4, r4, #0x10
	str r4, [sp, #0x10]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #0xaf
	bne _0806CBD0
	ldr r0, _0806CBC8
	ldr r0, [r0]
	ldr r1, _0806CBCC
	adds r0, r0, r1
	ldrb r0, [r0]
	b _0806CBD8
	.align 2, 0
_0806CBC8: .4byte 0x03005AEC
_0806CBCC: .4byte 0x00003226
_0806CBD0:
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806CBD8:
	cmp r0, #0x26
	bne _0806CBE4
	cmp r5, #3
	beq _0806CBE4
	movs r0, #0
	b _0806CE74
_0806CBE4:
	cmp r5, #1
	bne _0806CBEA
	b _0806CE04
_0806CBEA:
	cmp r5, #1
	bgt _0806CBF4
	cmp r5, #0
	beq _0806CC08
	b _0806CE72
_0806CBF4:
	cmp r5, #3
	ble _0806CBFA
	b _0806CE72
_0806CBFA:
	movs r2, #0
	str r2, [sp, #4]
	ldr r3, _0806CC04
	lsls r6, r7, #2
	b _0806CE52
	.align 2, 0
_0806CC04: .4byte 0x082F5CA4
_0806CC08:
	mov r0, r8
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r0, r8
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #4]
	lsls r6, r7, #2
_0806CC2E:
	ldr r1, _0806CC54
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r2, r0
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #1
	adds r3, r1, #0
	adds r4, r2, #0
	cmp r0, #0xe
	bls _0806CC4A
	b _0806CDF6
_0806CC4A:
	lsls r0, r0, #2
	ldr r1, _0806CC58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806CC54: .4byte 0x082F5CA4
_0806CC58: .4byte 0x0806CC5C
_0806CC5C: @ jump table
	.4byte _0806CC98 @ case 0
	.4byte _0806CCAA @ case 1
	.4byte _0806CCCC @ case 2
	.4byte _0806CCFC @ case 3
	.4byte _0806CDF6 @ case 4
	.4byte _0806CDF6 @ case 5
	.4byte _0806CDF6 @ case 6
	.4byte _0806CD0C @ case 7
	.4byte _0806CD36 @ case 8
	.4byte _0806CD60 @ case 9
	.4byte _0806CD8E @ case 10
	.4byte _0806CDAE @ case 11
	.4byte _0806CDD2 @ case 12
	.4byte _0806CDF6 @ case 13
	.4byte _0806CDE2 @ case 14
_0806CC98:
	ldr r1, [sp, #8]
	cmp r1, #0xdb
	bhi _0806CCA0
	b _0806CDF6
_0806CCA0:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r0, r0, r3
	b _0806CCEC
_0806CCAA:
	bl RtcCalcLocalTime
	ldr r0, _0806CCC8
	ldrb r0, [r0, #2]
	subs r0, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bls _0806CCBE
	b _0806CDF6
_0806CCBE:
	ldr r2, [sp, #8]
	cmp r2, #0xdb
	bhi _0806CCC6
	b _0806CDF6
_0806CCC6:
	b _0806CCE2
	.align 2, 0
_0806CCC8: .4byte 0x03005A50
_0806CCCC:
	bl RtcCalcLocalTime
	ldr r0, _0806CCF4
	ldrb r0, [r0, #2]
	cmp r0, #0xb
	bls _0806CCDA
	b _0806CDF6
_0806CCDA:
	ldr r0, [sp, #8]
	cmp r0, #0xdb
	bhi _0806CCE2
	b _0806CDF6
_0806CCE2:
	ldr r1, _0806CCF8
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r0, r0, r1
_0806CCEC:
	ldrh r0, [r0, #4]
	mov sl, r0
	b _0806CDF6
	.align 2, 0
_0806CCF4: .4byte 0x03005A50
_0806CCF8: .4byte 0x082F5CA4
_0806CCFC:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, #2]
	cmp r0, sb
	bhi _0806CDF6
	b _0806CDF2
_0806CD0C:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, #2]
	cmp r0, sb
	bhi _0806CDF6
	mov r0, r8
	movs r1, #0x3b
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0x3c
	movs r2, #0
	bl GetMonData
	cmp r4, r0
	bls _0806CDF6
	b _0806CD88
_0806CD36:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, #2]
	cmp r0, sb
	bhi _0806CDF6
	mov r0, r8
	movs r1, #0x3b
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0x3c
	movs r2, #0
	bl GetMonData
	cmp r4, r0
	bne _0806CDF6
	b _0806CD88
_0806CD60:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, #2]
	cmp r0, sb
	bhi _0806CDF6
	mov r0, r8
	movs r1, #0x3b
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0x3c
	movs r2, #0
	bl GetMonData
	cmp r4, r0
	bhs _0806CDF6
_0806CD88:
	ldrh r5, [r5, #4]
	mov sl, r5
	b _0806CDF6
_0806CD8E:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r4, r0, r3
	ldrh r0, [r4, #2]
	cmp r0, sb
	bhi _0806CDF6
	ldr r0, [sp, #0x10]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bhi _0806CDF6
	b _0806CDCC
_0806CDAE:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r4, r0, r3
	ldrh r0, [r4, #2]
	cmp r0, sb
	bhi _0806CDF6
	ldr r0, [sp, #0x10]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bls _0806CDF6
_0806CDCC:
	ldrh r4, [r4, #4]
	mov sl, r4
	b _0806CDF6
_0806CDD2:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, #2]
	cmp r0, sb
	bhi _0806CDF6
	b _0806CDF2
_0806CDE2:
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, #2]
	ldr r2, [sp, #0xc]
	cmp r0, r2
	bhi _0806CDF6
_0806CDF2:
	ldrh r1, [r1, #4]
	mov sl, r1
_0806CDF6:
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
	cmp r0, #4
	bgt _0806CE02
	b _0806CC2E
_0806CE02:
	b _0806CE72
_0806CE04:
	lsls r6, r7, #2
	ldr r1, _0806CE48
	adds r0, r6, r7
	lsls r0, r0, #3
	adds r4, r0, r1
	mov r5, sp
	movs r1, #4
	str r1, [sp, #4]
_0806CE14:
	ldrh r0, [r4]
	cmp r0, #5
	beq _0806CE34
	cmp r0, #6
	bne _0806CE38
	ldrh r0, [r4, #2]
	ldrh r1, [r5]
	cmp r0, r1
	bne _0806CE38
	movs r0, #0
	strh r0, [r5]
	mov r0, r8
	movs r1, #0xc
	mov r2, sp
	bl SetMonData
_0806CE34:
	ldrh r2, [r4, #4]
	mov sl, r2
_0806CE38:
	adds r4, #8
	ldr r0, [sp, #4]
	subs r0, #1
	str r0, [sp, #4]
	cmp r0, #0
	bge _0806CE14
	b _0806CE72
	.align 2, 0
_0806CE48: .4byte 0x082F5CA4
_0806CE4C:
	ldrh r1, [r1, #4]
	mov sl, r1
	b _0806CE72
_0806CE52:
	adds r0, r6, r7
	ldr r1, [sp, #4]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, #7
	bne _0806CE68
	ldrh r0, [r1, #2]
	cmp r0, sb
	beq _0806CE4C
_0806CE68:
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #4]
	cmp r2, #4
	ble _0806CE52
_0806CE72:
	mov r0, sl
_0806CE74:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetEvolutionTargetSpecies

	thumb_func_start HoennPokedexNumToSpecies
HoennPokedexNumToSpecies: @ 0x0806CE84
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0806CEC8
	movs r1, #0
	ldr r3, _0806CEC0
	ldrh r0, [r3]
	cmp r0, r2
	beq _0806CEB0
	movs r4, #0xcd
	lsls r4, r4, #1
_0806CE9C:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	bhi _0806CEB0
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0806CE9C
_0806CEB0:
	ldr r0, _0806CEC4
	cmp r1, r0
	beq _0806CEC8
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0806CECA
	.align 2, 0
_0806CEC0: .4byte 0x082EE2D4
_0806CEC4: .4byte 0x0000019B
_0806CEC8:
	movs r0, #0
_0806CECA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end HoennPokedexNumToSpecies

	thumb_func_start NationalPokedexNumToSpecies
NationalPokedexNumToSpecies: @ 0x0806CED0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0806CF14
	movs r1, #0
	ldr r3, _0806CF0C
	ldrh r0, [r3]
	cmp r0, r2
	beq _0806CEFC
	movs r4, #0xcd
	lsls r4, r4, #1
_0806CEE8:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	bhi _0806CEFC
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0806CEE8
_0806CEFC:
	ldr r0, _0806CF10
	cmp r1, r0
	beq _0806CF14
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0806CF16
	.align 2, 0
_0806CF0C: .4byte 0x082EE60A
_0806CF10: .4byte 0x0000019B
_0806CF14:
	movs r0, #0
_0806CF16:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NationalPokedexNumToSpecies

	thumb_func_start NationalToHoennOrder
NationalToHoennOrder: @ 0x0806CF1C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0806CF60
	movs r1, #0
	ldr r3, _0806CF58
	ldrh r0, [r3]
	cmp r0, r2
	beq _0806CF48
	movs r4, #0xcd
	lsls r4, r4, #1
_0806CF34:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	bhi _0806CF48
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0806CF34
_0806CF48:
	ldr r0, _0806CF5C
	cmp r1, r0
	beq _0806CF60
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0806CF62
	.align 2, 0
_0806CF58: .4byte 0x082EE940
_0806CF5C: .4byte 0x0000019B
_0806CF60:
	movs r0, #0
_0806CF62:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NationalToHoennOrder

	thumb_func_start HoennToNationalOrder
HoennToNationalOrder: @ 0x0806CF68
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0806CF84
	ldr r0, _0806CF80
	subs r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0806CF86
	.align 2, 0
_0806CF80: .4byte 0x082EE60A
_0806CF84:
	movs r0, #0
_0806CF86:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HoennToNationalOrder

	thumb_func_start SpeciesToHoennPokedexNum
SpeciesToHoennPokedexNum: @ 0x0806CF8C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0806CFA8
	ldr r0, _0806CFA4
	subs r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0806CFAA
	.align 2, 0
_0806CFA4: .4byte 0x082EE2D4
_0806CFA8:
	movs r0, #0
_0806CFAA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SpeciesToHoennPokedexNum

	thumb_func_start SpeciesToNationalPokedexNum
SpeciesToNationalPokedexNum: @ 0x0806CFB0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0806CFCC
	ldr r0, _0806CFC8
	subs r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0806CFCE
	.align 2, 0
_0806CFC8: .4byte 0x082EE940
_0806CFCC:
	movs r0, #0
_0806CFCE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SpeciesToNationalPokedexNum

	thumb_func_start SpeciesToCryId
SpeciesToCryId: @ 0x0806CFD4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, #0xfa
	bls _0806D002
	ldr r0, _0806CFF4
	cmp r1, r0
	bls _0806D000
	ldr r0, _0806CFF8
	ldr r2, _0806CFFC
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0806D002
	.align 2, 0
_0806CFF4: .4byte 0x00000113
_0806CFF8: .4byte 0x082EFFA4
_0806CFFC: .4byte 0xFFFFFEEC
_0806D000:
	movs r0, #0xc8
_0806D002:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SpeciesToCryId

	thumb_func_start sub_0806D008
sub_0806D008: @ 0x0806D008
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r1, #0
	mov sl, r2
	lsls r0, r0, #0x10
	movs r1, #0x9a
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _0806D116
	ldr r0, _0806D0D8
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp sl, r0
	beq _0806D116
	ldr r0, [r1, #0xc]
	cmp sl, r0
	beq _0806D116
	movs r5, #0
_0806D034:
	lsls r3, r5, #3
	adds r3, r3, r5
	lsls r3, r3, #2
	ldr r0, _0806D0DC
	adds r4, r3, r0
	ldrb r1, [r4]
	adds r1, #0xf8
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	ldrb r1, [r4, #1]
	adds r1, #0xf8
	movs r0, #0xf0
	ands r0, r6
	lsrs r0, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	lsrs r6, r6, #8
	str r6, [sp, #4]
	adds r5, #1
	str r5, [sp]
	mov sb, r3
_0806D06C:
	lsls r0, r2, #1
	add r0, sb
	ldr r3, _0806D0E0
	adds r0, r0, r3
	ldrh r3, [r0]
	mov r4, ip
	adds r0, r4, #0
	adds r0, #0x10
	adds r7, r1, #1
	adds r2, #1
	mov r8, r2
	cmp r4, r0
	bge _0806D104
	lsrs r0, r1, #3
	lsls r6, r0, #8
	movs r0, #7
	ands r1, r0
	lsls r5, r1, #2
_0806D090:
	adds r0, r4, #0
	cmp r4, #0
	bge _0806D098
	adds r0, r4, #7
_0806D098:
	asrs r0, r0, #3
	lsls r2, r0, #5
	add r2, sl
	lsls r0, r0, #3
	subs r0, r4, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r2, r2, r0
	adds r2, r2, r6
	adds r2, r2, r5
	movs r1, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0806D0F8
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0806D0E4
	ldrb r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bhi _0806D0F8
	adds r0, r1, #0
	adds r0, #0x40
	b _0806D0F6
	.align 2, 0
_0806D0D8: .4byte 0x02024178
_0806D0DC: .4byte 0x082EEC78
_0806D0E0: .4byte 0x082EEC7A
_0806D0E4:
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0806D0F8
	adds r0, r1, #4
_0806D0F6:
	strb r0, [r2]
_0806D0F8:
	asrs r3, r3, #1
	adds r4, #1
	mov r0, ip
	adds r0, #0x10
	cmp r4, r0
	blt _0806D090
_0806D104:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, r8
	cmp r2, #0xf
	ble _0806D06C
	ldr r6, [sp, #4]
	ldr r5, [sp]
	cmp r5, #3
	ble _0806D034
_0806D116:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0806D008

	thumb_func_start DrawSpindaSpots
DrawSpindaSpots: @ 0x0806D128
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r1, #0
	str r2, [sp]
	lsls r0, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #0x9a
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _0806D22A
	cmp r3, #0
	beq _0806D22A
	movs r6, #0
_0806D14C:
	lsls r3, r6, #3
	adds r3, r3, r6
	lsls r3, r3, #2
	ldr r0, _0806D1F0
	adds r4, r3, r0
	ldrb r1, [r4]
	adds r1, #0xf8
	movs r2, #0xf
	adds r0, r5, #0
	ands r0, r2
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	ldrb r1, [r4, #1]
	adds r1, #0xf8
	movs r0, #0xf0
	ands r0, r5
	lsrs r0, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	lsrs r5, r5, #8
	str r5, [sp, #4]
	adds r6, #1
	mov sl, r6
	mov sb, r3
_0806D184:
	lsls r0, r2, #1
	add r0, sb
	ldr r3, _0806D1F4
	adds r0, r0, r3
	ldrh r3, [r0]
	mov r4, ip
	adds r0, r4, #0
	adds r0, #0x10
	adds r7, r1, #1
	adds r2, #1
	mov r8, r2
	cmp r4, r0
	bge _0806D218
	lsrs r0, r1, #3
	lsls r6, r0, #8
	movs r0, #7
	ands r1, r0
	lsls r5, r1, #2
_0806D1A8:
	adds r0, r4, #0
	cmp r4, #0
	bge _0806D1B0
	adds r0, r4, #7
_0806D1B0:
	asrs r0, r0, #3
	lsls r2, r0, #5
	ldr r1, [sp]
	adds r2, r1, r2
	lsls r0, r0, #3
	subs r0, r4, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r2, r2, r0
	adds r2, r2, r6
	adds r2, r2, r5
	movs r1, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0806D20C
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0806D1F8
	ldrb r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bhi _0806D20C
	adds r0, r1, #0
	adds r0, #0x40
	b _0806D20A
	.align 2, 0
_0806D1F0: .4byte 0x082EEC78
_0806D1F4: .4byte 0x082EEC7A
_0806D1F8:
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0806D20C
	adds r0, r1, #4
_0806D20A:
	strb r0, [r2]
_0806D20C:
	asrs r3, r3, #1
	adds r4, #1
	mov r0, ip
	adds r0, #0x10
	cmp r4, r0
	blt _0806D1A8
_0806D218:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, r8
	cmp r2, #0xf
	ble _0806D184
	ldr r5, [sp, #4]
	mov r6, sl
	cmp r6, #3
	ble _0806D14C
_0806D22A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DrawSpindaSpots

	thumb_func_start sub_0806D23C
sub_0806D23C: @ 0x0806D23C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r5, _0806D280
	movs r1, #2
	adds r2, r5, #0
	bl GetMonData
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r4, _0806D284
	adds r0, r0, r4
	adds r1, r5, #0
	bl StringCompare
	cmp r0, #0
	bne _0806D278
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #1
	adds r2, r2, r4
	adds r0, r7, #0
	movs r1, #2
	bl SetMonData
_0806D278:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D280: .4byte 0x02021C40
_0806D284: .4byte 0x082EA31C
	thumb_func_end sub_0806D23C

	thumb_func_start sub_0806D288
sub_0806D288: @ 0x0806D288
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806D2B0
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r1, #0x18]
	cmp r0, #2
	bgt _0806D2B4
	cmp r0, #1
	bge _0806D2BC
	cmp r0, #0
	beq _0806D2B8
	b _0806D2BE
	.align 2, 0
_0806D2B0: .4byte 0x020226A0
_0806D2B4:
	cmp r0, #3
	bne _0806D2BE
_0806D2B8:
	movs r5, #0
	b _0806D2BE
_0806D2BC:
	movs r5, #1
_0806D2BE:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0806D288

	thumb_func_start GetLinkTrainerFlankId
GetLinkTrainerFlankId: @ 0x0806D2C8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r2, _0806D2EC
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x18]
	cmp r0, #2
	bgt _0806D2F0
	cmp r0, #1
	bge _0806D2F8
	cmp r0, #0
	beq _0806D2F4
	b _0806D2FA
	.align 2, 0
_0806D2EC: .4byte 0x020226A0
_0806D2F0:
	cmp r0, #3
	bne _0806D2FA
_0806D2F4:
	movs r3, #0
	b _0806D2FA
_0806D2F8:
	movs r3, #1
_0806D2FA:
	adds r0, r3, #0
	pop {r1}
	bx r1
	thumb_func_end GetLinkTrainerFlankId

	thumb_func_start GetBattlerMultiplayerId
GetBattlerMultiplayerId: @ 0x0806D300
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r1, _0806D30C
	b _0806D318
	.align 2, 0
_0806D30C: .4byte 0x020226A0
_0806D310:
	adds r1, #0x1c
	adds r2, #1
	cmp r2, #3
	bgt _0806D31E
_0806D318:
	ldrh r0, [r1, #0x18]
	cmp r0, r3
	bne _0806D310
_0806D31E:
	adds r0, r2, #0
	pop {r1}
	bx r1
	thumb_func_end GetBattlerMultiplayerId

	thumb_func_start GetTrainerEncounterMusicId
GetTrainerEncounterMusicId: @ 0x0806D324
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806D33E
	adds r0, r4, #0
	bl GetBattlePyramindTrainerEncounterMusicId
	b _0806D362
_0806D33E:
	bl sub_081D52F0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806D35C
	ldr r1, _0806D358
	lsls r0, r4, #5
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #0x7f
	ands r0, r1
	b _0806D366
	.align 2, 0
_0806D358: .4byte 0x082E383C
_0806D35C:
	adds r0, r5, #0
	bl GetTrainerEncounterMusicIdInTrainerHill
_0806D362:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806D366:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetTrainerEncounterMusicId

	thumb_func_start ModifyStatByNature
ModifyStatByNature: @ 0x0806D36C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	cmp r2, #4
	bls _0806D38A
	adds r0, r3, #0
	b _0806D3C6
_0806D38A:
	ldr r0, _0806D3AC
	lsls r1, r4, #2
	adds r1, r1, r4
	subs r1, #1
	adds r1, r5, r1
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806D3B0
	cmp r1, #1
	bne _0806D3C4
	movs r0, #0x6e
	b _0806D3B2
	.align 2, 0
_0806D3AC: .4byte 0x082EF1A0
_0806D3B0:
	movs r0, #0x5a
_0806D3B2:
	muls r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0806D3C6
_0806D3C4:
	adds r0, r3, #0
_0806D3C6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ModifyStatByNature

	thumb_func_start AdjustFriendship
AdjustFriendship: @ 0x0806D3CC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl sub_0806EB88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806D3E2
	b _0806D556
_0806D3E2:
	adds r0, r7, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r7, #0
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _0806D438
	ldr r0, _0806D418
	ldr r1, _0806D41C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806D424
	ldr r0, _0806D420
	ldrb r4, [r0, #7]
	b _0806D440
	.align 2, 0
_0806D418: .4byte 0x03002360
_0806D41C: .4byte 0x00000439
_0806D420: .4byte 0x020240A8
_0806D424:
	ldr r0, _0806D430
	ldr r0, [r0]
	ldr r1, _0806D434
	adds r0, r0, r1
	ldrb r4, [r0]
	b _0806D440
	.align 2, 0
_0806D430: .4byte 0x03005AEC
_0806D434: .4byte 0x00003226
_0806D438:
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0806D440:
	cmp r6, #0
	bne _0806D446
	b _0806D556
_0806D446:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r6, r0
	bne _0806D450
	b _0806D556
_0806D450:
	movs r6, #0
	adds r0, r7, #0
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sp
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x63
	ble _0806D46E
	movs r6, #1
_0806D46E:
	cmp r0, #0xc7
	ble _0806D478
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0806D478:
	cmp r5, #5
	bne _0806D488
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0806D556
_0806D488:
	cmp r5, #3
	bne _0806D4B4
	ldr r0, _0806D560
	ldr r0, [r0]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0806D556
	ldr r1, _0806D564
	ldr r0, _0806D568
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	adds r0, r1, #0
	subs r0, #0x1f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0806D4B4
	cmp r1, #0x26
	bne _0806D556
_0806D4B4:
	ldr r1, _0806D56C
	lsls r0, r5, #1
	adds r0, r0, r5
	adds r0, r6, r0
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ble _0806D4DA
	cmp r4, #0x1b
	bne _0806D4DA
	movs r0, #0x96
	muls r0, r1, r0
	movs r1, #0x64
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0806D4DA:
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r0, r2
	mov r1, sp
	strh r0, [r1]
	cmp r2, #0
	ble _0806D52C
	adds r0, r7, #0
	movs r1, #0x26
	movs r2, #0
	bl GetMonData
	cmp r0, #0xb
	bne _0806D508
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #1
	mov r1, sp
	strh r0, [r1]
_0806D508:
	adds r0, r7, #0
	movs r1, #0x23
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	bl GetCurrentRegionMapSectionId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0806D52C
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #1
	mov r1, sp
	strh r0, [r1]
_0806D52C:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0806D53C
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
_0806D53C:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xff
	ble _0806D54C
	movs r1, #0xff
	mov r0, sp
	strh r1, [r0]
_0806D54C:
	adds r0, r7, #0
	movs r1, #0x20
	mov r2, sp
	bl SetMonData
_0806D556:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D560: .4byte 0x02022C90
_0806D564: .4byte 0x082E383C
_0806D568: .4byte 0x0203886A
_0806D56C: .4byte 0x082FA85A
	thumb_func_end AdjustFriendship

	thumb_func_start MonGainEVs
MonGainEVs: @ 0x0806D570
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r4, #0
	movs r7, #0
	movs r6, #0
_0806D584:
	adds r1, r6, #0
	adds r1, #0x1a
	mov r0, r8
	movs r2, #0
	bl GetMonData
	mov r2, sp
	adds r1, r2, r6
	strb r0, [r1]
	ldrb r0, [r1]
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r6, #1
	cmp r6, #5
	ble _0806D584
	movs r6, #0
	b _0806D706
_0806D5A8:
	mov r0, r8
	movs r1, #0
	bl CheckPartyHasHadPokerus
	lsls r0, r0, #0x18
	movs r2, #1
	cmp r0, #0
	beq _0806D5BA
	movs r2, #2
_0806D5BA:
	cmp r6, #5
	bhi _0806D65C
	lsls r0, r6, #2
	ldr r1, _0806D5C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806D5C8: .4byte 0x0806D5CC
_0806D5CC: @ jump table
	.4byte _0806D5E4 @ case 0
	.4byte _0806D5F8 @ case 1
	.4byte _0806D60C @ case 2
	.4byte _0806D620 @ case 3
	.4byte _0806D634 @ case 4
	.4byte _0806D648 @ case 5
_0806D5E4:
	ldr r0, _0806D5F4
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #0x1e
	b _0806D656
	.align 2, 0
_0806D5F4: .4byte 0x082F0D54
_0806D5F8:
	ldr r0, _0806D608
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0xa]
	b _0806D654
	.align 2, 0
_0806D608: .4byte 0x082F0D54
_0806D60C:
	ldr r0, _0806D61C
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0xa]
	lsls r0, r0, #0x1a
	b _0806D656
	.align 2, 0
_0806D61C: .4byte 0x082F0D54
_0806D620:
	ldr r0, _0806D630
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0xa]
	lsrs r0, r0, #6
	b _0806D658
	.align 2, 0
_0806D630: .4byte 0x082F0D54
_0806D634:
	ldr r0, _0806D644
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #0x1e
	b _0806D656
	.align 2, 0
_0806D644: .4byte 0x082F0D54
_0806D648:
	ldr r0, _0806D684
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0xb]
_0806D654:
	lsls r0, r0, #0x1c
_0806D656:
	lsrs r0, r0, #0x1e
_0806D658:
	adds r4, r0, #0
	muls r4, r2, r4
_0806D65C:
	mov r0, r8
	movs r1, #0xc
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _0806D6A8
	ldr r0, _0806D688
	ldr r1, _0806D68C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806D694
	ldr r0, _0806D690
	ldrb r0, [r0, #7]
	b _0806D6B0
	.align 2, 0
_0806D684: .4byte 0x082F0D54
_0806D688: .4byte 0x03002360
_0806D68C: .4byte 0x00000439
_0806D690: .4byte 0x020240A8
_0806D694:
	ldr r0, _0806D6A0
	ldr r0, [r0]
	ldr r2, _0806D6A4
	adds r0, r0, r2
	ldrb r0, [r0]
	b _0806D6B0
	.align 2, 0
_0806D6A0: .4byte 0x03005AEC
_0806D6A4: .4byte 0x00003226
_0806D6A8:
	bl sub_080D6CF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806D6B0:
	cmp r0, #0x18
	bne _0806D6B8
	lsls r0, r4, #0x11
	lsrs r4, r0, #0x10
_0806D6B8:
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	adds r1, r7, r2
	movs r0, #0xff
	lsls r0, r0, #1
	cmp r1, r0
	ble _0806D6D0
	adds r0, r2, r0
	adds r1, r7, r4
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0806D6D0:
	mov r0, sp
	adds r2, r0, r6
	ldrb r3, [r2]
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, r1
	cmp r0, #0xff
	ble _0806D6EC
	adds r0, r1, #0
	adds r0, #0xff
	adds r1, r3, r4
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0806D6EC:
	adds r0, r3, r4
	strb r0, [r2]
	adds r0, r7, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x1a
	mov r0, r8
	bl SetMonData
	adds r6, #1
	cmp r6, #5
	bgt _0806D70E
_0806D706:
	ldr r0, _0806D71C
	cmp r7, r0
	bhi _0806D70E
	b _0806D5A8
_0806D70E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D71C: .4byte 0x000001FD
	thumb_func_end MonGainEVs

	thumb_func_start GetMonEVCount
GetMonEVCount: @ 0x0806D720
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r4, #0
_0806D728:
	adds r1, r4, #0
	adds r1, #0x1a
	adds r0, r6, #0
	movs r2, #0
	bl GetMonData
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	cmp r4, #5
	ble _0806D728
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonEVCount

	thumb_func_start RandomlyGivePartyPokerus
RandomlyGivePartyPokerus: @ 0x0806D748
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl Random
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r5, r0
	beq _0806D76E
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r5, r0
	beq _0806D76E
	movs r0, #0xc0
	lsls r0, r0, #8
	cmp r5, r0
	bne _0806D804
_0806D76E:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x64
	muls r0, r5, r0
	adds r4, r6, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0806D76E
	adds r0, r4, #0
	movs r1, #0x2d
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0806D76E
	ldr r1, _0806D80C
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	bl CheckPartyHasHadPokerus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806D804
	movs r4, #7
_0806D7B8:
	bl Random
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	adds r2, r0, #0
	adds r1, r2, #0
	ands r1, r4
	cmp r1, #0
	beq _0806D7B8
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _0806D7DA
	mov r0, sp
	strb r1, [r0]
_0806D7DA:
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, #4
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	movs r1, #0xf3
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r0, #0x64
	muls r0, r5, r0
	adds r0, r6, r0
	movs r1, #0x22
	mov r2, sp
	bl SetMonData
_0806D804:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D80C: .4byte 0x082FACB4
	thumb_func_end RandomlyGivePartyPokerus

	thumb_func_start CheckPartyPokerus
CheckPartyPokerus: @ 0x0806D810
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	movs r6, #1
	movs r5, #0
	cmp r4, #0
	beq _0806D858
_0806D824:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0806D84C
	movs r0, #0x64
	muls r0, r3, r0
	adds r0, r7, r0
	movs r1, #0x22
	movs r2, #0
	str r3, [sp]
	bl GetMonData
	movs r1, #0xf
	ands r1, r0
	ldr r3, [sp]
	cmp r1, #0
	beq _0806D84C
	orrs r5, r6
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_0806D84C:
	adds r3, #1
	lsls r6, r6, #1
	lsrs r4, r4, #1
	cmp r4, #0
	bne _0806D824
	b _0806D86C
_0806D858:
	adds r0, r7, #0
	movs r1, #0x22
	movs r2, #0
	bl GetMonData
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0806D86C
	movs r5, #1
_0806D86C:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckPartyPokerus

	thumb_func_start CheckPartyHasHadPokerus
CheckPartyHasHadPokerus: @ 0x0806D878
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	movs r6, #1
	movs r5, #0
	cmp r4, #0
	beq _0806D8BC
_0806D88C:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0806D8B0
	movs r0, #0x64
	muls r0, r3, r0
	adds r0, r7, r0
	movs r1, #0x22
	movs r2, #0
	str r3, [sp]
	bl GetMonData
	ldr r3, [sp]
	cmp r0, #0
	beq _0806D8B0
	orrs r5, r6
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_0806D8B0:
	adds r3, #1
	lsls r6, r6, #1
	lsrs r4, r4, #1
	cmp r4, #0
	bne _0806D88C
	b _0806D8CC
_0806D8BC:
	adds r0, r7, #0
	movs r1, #0x22
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0806D8CC
	movs r5, #1
_0806D8CC:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckPartyHasHadPokerus

	thumb_func_start UpdatePartyPokerusTime
UpdatePartyPokerusTime: @ 0x0806D8D8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r6, #0
	mov r5, sp
_0806D8E4:
	movs r0, #0x64
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _0806D924
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0806D946
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strb r0, [r5]
	movs r1, #0xf
	adds r2, r0, #0
	ands r1, r2
	cmp r1, #0
	beq _0806D946
	cmp r1, r7
	blo _0806D91E
	cmp r7, #4
	bls _0806D928
_0806D91E:
	movs r0, #0xf0
	ands r0, r2
	b _0806D92A
	.align 2, 0
_0806D924: .4byte 0x02024190
_0806D928:
	subs r0, r2, r7
_0806D92A:
	strb r0, [r5]
	ldrb r0, [r5]
	cmp r0, #0
	bne _0806D936
	movs r0, #0x10
	strb r0, [r5]
_0806D936:
	movs r0, #0x64
	muls r0, r6, r0
	ldr r1, _0806D954
	adds r0, r0, r1
	movs r1, #0x22
	mov r2, sp
	bl SetMonData
_0806D946:
	adds r6, #1
	cmp r6, #5
	ble _0806D8E4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D954: .4byte 0x02024190
	thumb_func_end UpdatePartyPokerusTime

	thumb_func_start PartySpreadPokerus
PartySpreadPokerus: @ 0x0806D958
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806D9FE
	movs r5, #0
_0806D974:
	movs r0, #0x64
	adds r6, r5, #0
	muls r6, r0, r6
	adds r4, r7, r6
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0806D9F8
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov r0, sp
	strb r1, [r0]
	cmp r1, #0
	beq _0806D9F8
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0806D9F8
	cmp r5, #0
	beq _0806D9CE
	adds r0, r6, #0
	subs r0, #0x64
	adds r4, r7, r0
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #0
	bl GetMonData
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	bne _0806D9CE
	adds r0, r4, #0
	movs r1, #0x22
	mov r2, sp
	bl SetMonData
_0806D9CE:
	cmp r5, #5
	beq _0806D9F8
	movs r0, #0x64
	muls r0, r5, r0
	adds r0, #0x64
	adds r4, r7, r0
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #0
	bl GetMonData
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	bne _0806D9F8
	adds r0, r4, #0
	movs r1, #0x22
	mov r2, sp
	bl SetMonData
	adds r5, #1
_0806D9F8:
	adds r5, #1
	cmp r5, #5
	ble _0806D974
_0806D9FE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PartySpreadPokerus

	thumb_func_start TryIncrementMonLevel
TryIncrementMonLevel: @ 0x0806DA08
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	adds r0, #1
	mov r1, sp
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0x19
	movs r2, #0
	bl GetMonData
	str r0, [sp, #4]
	ldr r6, _0806DA84
	ldr r2, _0806DA88
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x13]
	movs r1, #0xca
	lsls r1, r1, #1
	adds r4, r2, #0
	muls r4, r1, r4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r1, r6, r2
	adds r1, r4, r1
	ldr r1, [r1]
	cmp r0, r1
	bls _0806DA68
	str r1, [sp, #4]
	add r2, sp, #4
	adds r0, r5, #0
	movs r1, #0x19
	bl SetMonData
_0806DA68:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0x64
	bhi _0806DA7E
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r6
	ldr r1, [sp, #4]
	ldr r0, [r0]
	cmp r1, r0
	bhs _0806DA8C
_0806DA7E:
	movs r0, #0
	b _0806DA98
	.align 2, 0
_0806DA84: .4byte 0x082F00B4
_0806DA88: .4byte 0x082F0D54
_0806DA8C:
	adds r0, r5, #0
	movs r1, #0x38
	mov r2, sp
	bl SetMonData
	movs r0, #1
_0806DA98:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end TryIncrementMonLevel

	thumb_func_start CanMonLearnTMHM
CanMonLearnTMHM: @ 0x0806DAA0
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r5, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bne _0806DAC2
	movs r0, #0
	b _0806DAEE
_0806DAC2:
	cmp r4, #0x1f
	bls _0806DAE0
	adds r0, r4, #0
	subs r0, #0x20
	movs r2, #1
	lsls r2, r0
	ldr r0, _0806DADC
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	ands r0, r2
	b _0806DAEE
	.align 2, 0
_0806DADC: .4byte 0x082EF220
_0806DAE0:
	movs r1, #1
	lsls r1, r5
	ldr r2, _0806DAF4
	lsls r0, r3, #3
	adds r0, r0, r2
	ldr r0, [r0]
	ands r0, r1
_0806DAEE:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806DAF4: .4byte 0x082EF220
	thumb_func_end CanMonLearnTMHM

	thumb_func_start CanSpeciesLearnTMHM
CanSpeciesLearnTMHM: @ 0x0806DAF8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r4, r3, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r1, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r3, r0
	bne _0806DB12
	movs r0, #0
	b _0806DB3E
_0806DB12:
	cmp r1, #0x1f
	bls _0806DB30
	adds r0, r1, #0
	subs r0, #0x20
	movs r2, #1
	lsls r2, r0
	ldr r0, _0806DB2C
	lsls r1, r3, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	ands r0, r2
	b _0806DB3E
	.align 2, 0
_0806DB2C: .4byte 0x082EF220
_0806DB30:
	movs r1, #1
	lsls r1, r2
	ldr r2, _0806DB44
	lsls r0, r4, #3
	adds r0, r0, r2
	ldr r0, [r0]
	ands r0, r1
_0806DB3E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806DB44: .4byte 0x082EF220
	thumb_func_end CanSpeciesLearnTMHM

	thumb_func_start GetMoveRelearnerMoves
GetMoveRelearnerMoves: @ 0x0806DB48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	str r1, [sp, #8]
	movs r0, #0
	mov sl, r0
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r6, #0
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	movs r5, #0
	mov r4, sp
_0806DB7E:
	adds r1, r5, #0
	adds r1, #0xd
	adds r0, r6, #0
	movs r2, #0
	bl GetMonData
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _0806DB7E
	movs r5, #0
	ldr r6, _0806DC8C
	lsls r1, r7, #2
	adds r2, r1, r6
	ldr r3, [r2]
	ldrh r0, [r3]
	ldr r4, _0806DC90
	str r1, [sp, #0x14]
	cmp r0, r4
	beq _0806DC78
	mov sb, r2
	str r3, [sp, #0x10]
_0806DBAC:
	lsls r2, r5, #1
	ldr r1, [sp, #0x10]
	adds r0, r2, r1
	ldrh r3, [r0]
	movs r0, #0xfe
	lsls r0, r0, #8
	ands r0, r3
	ldr r4, [sp, #0xc]
	lsls r1, r4, #9
	adds r7, r2, #0
	adds r5, #1
	mov ip, r5
	cmp r0, r1
	bgt _0806DC62
	movs r4, #0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _0806DC94
	ands r0, r3
	cmp r1, r0
	beq _0806DBFC
	ldr r0, [sp, #0x14]
	ldr r1, _0806DC8C
	adds r6, r0, r1
	ldr r2, _0806DC94
	mov r8, r2
	mov r3, sp
	adds r5, r7, #0
_0806DBE4:
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	bgt _0806DBFC
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _0806DBE4
_0806DBFC:
	cmp r4, #4
	bne _0806DC62
	movs r4, #0
	cmp r4, sl
	bge _0806DC40
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, #8]
	ldrh r2, [r0]
	ldr r0, _0806DC94
	ands r0, r1
	cmp r2, r0
	beq _0806DC40
	ldr r1, [sp, #0x14]
	ldr r2, _0806DC8C
	adds r6, r1, r2
	ldr r0, _0806DC94
	mov r8, r0
	ldr r3, [sp, #8]
	adds r5, r7, #0
_0806DC28:
	adds r3, #2
	adds r4, #1
	cmp r4, sl
	bge _0806DC40
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _0806DC28
_0806DC40:
	cmp r4, sl
	bne _0806DC62
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r2, r4, #1
	ldr r1, [sp, #8]
	adds r2, r2, r1
	mov r4, sb
	ldr r0, [r4]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _0806DC94
	ands r0, r1
	strh r0, [r2]
_0806DC62:
	mov r5, ip
	cmp r5, #0x13
	bgt _0806DC78
	mov r1, sb
	ldr r0, [r1]
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r2, _0806DC90
	cmp r0, r2
	bne _0806DBAC
_0806DC78:
	mov r0, sl
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806DC8C: .4byte 0x082F9D04
_0806DC90: .4byte 0x0000FFFF
_0806DC94: .4byte 0x000001FF
	thumb_func_end GetMoveRelearnerMoves

	thumb_func_start GetLevelUpMovesBySpecies
GetLevelUpMovesBySpecies: @ 0x0806DC98
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x10
	movs r5, #0
	movs r4, #0
	ldr r1, _0806DCE4
	lsrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	ldr r1, _0806DCE8
	cmp r0, r1
	beq _0806DCDC
	ldr r0, _0806DCEC
	mov ip, r0
	adds r7, r1, #0
	adds r3, r2, #0
_0806DCBA:
	adds r1, r5, #0
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r2, [r3]
	mov r0, ip
	ands r0, r2
	strh r0, [r1]
	adds r3, #2
	adds r4, #1
	cmp r4, #0x13
	bgt _0806DCDC
	ldrh r0, [r3]
	cmp r0, r7
	bne _0806DCBA
_0806DCDC:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806DCE4: .4byte 0x082F9D04
_0806DCE8: .4byte 0x0000FFFF
_0806DCEC: .4byte 0x000001FF
	thumb_func_end GetLevelUpMovesBySpecies

	thumb_func_start GetNumberOfRelearnableMoves
GetNumberOfRelearnableMoves: @ 0x0806DCF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	adds r6, r0, #0
	movs r0, #0
	mov sl, r0
	adds r0, r6, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r6, #0
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x30]
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	bne _0806DD2C
	movs r0, #0
	b _0806DE36
_0806DD2C:
	movs r5, #0
	lsls r4, r4, #2
	str r4, [sp, #0x38]
	mov r4, sp
_0806DD34:
	adds r1, r5, #0
	adds r1, #0xd
	adds r0, r6, #0
	movs r2, #0
	bl GetMonData
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _0806DD34
	movs r5, #0
	ldr r3, _0806DE48
	ldr r2, [sp, #0x38]
	adds r1, r2, r3
	ldr r0, [r1]
	ldrh r0, [r0]
	ldr r2, _0806DE4C
	cmp r0, r2
	beq _0806DE34
	mov sb, r1
	mov r4, sp
	adds r4, #8
	str r4, [sp, #0x34]
_0806DD64:
	mov r1, sb
	ldr r0, [r1]
	lsls r2, r5, #1
	adds r0, r2, r0
	ldrh r3, [r0]
	movs r0, #0xfe
	lsls r0, r0, #8
	ands r0, r3
	ldr r4, [sp, #0x30]
	lsls r1, r4, #9
	adds r7, r2, #0
	adds r5, #1
	mov ip, r5
	cmp r0, r1
	bgt _0806DE1E
	movs r4, #0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _0806DE50
	ands r0, r3
	cmp r1, r0
	beq _0806DDB6
	ldr r0, [sp, #0x38]
	ldr r1, _0806DE48
	adds r6, r0, r1
	ldr r2, _0806DE50
	mov r8, r2
	mov r3, sp
	adds r5, r7, #0
_0806DD9E:
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	bgt _0806DDB6
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _0806DD9E
_0806DDB6:
	cmp r4, #4
	bne _0806DE1E
	movs r4, #0
	cmp r4, sl
	bge _0806DDFC
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, #0x34]
	ldrh r2, [r0]
	ldr r0, _0806DE50
	ands r0, r1
	add r1, sp, #8
	cmp r2, r0
	beq _0806DDFC
	ldr r2, [sp, #0x38]
	ldr r0, _0806DE48
	adds r6, r2, r0
	ldr r2, _0806DE50
	mov r8, r2
	adds r3, r1, #0
	adds r5, r7, #0
_0806DDE4:
	adds r3, #2
	adds r4, #1
	cmp r4, sl
	bge _0806DDFC
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _0806DDE4
_0806DDFC:
	cmp r4, sl
	bne _0806DE1E
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r2, r4, #1
	ldr r4, [sp, #0x34]
	adds r2, r4, r2
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _0806DE50
	ands r0, r1
	strh r0, [r2]
_0806DE1E:
	mov r5, ip
	cmp r5, #0x13
	bgt _0806DE34
	mov r2, sb
	ldr r0, [r2]
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r4, _0806DE4C
	cmp r0, r4
	bne _0806DD64
_0806DE34:
	mov r0, sl
_0806DE36:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806DE48: .4byte 0x082F9D04
_0806DE4C: .4byte 0x0000FFFF
_0806DE50: .4byte 0x000001FF
	thumb_func_end GetNumberOfRelearnableMoves

	thumb_func_start SpeciesToPokedexNum
SpeciesToPokedexNum: @ 0x0806DE54
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl IsNationalPokedexEnabled
	cmp r0, #0
	beq _0806DE6E
	adds r0, r4, #0
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0806DE86
_0806DE6E:
	adds r0, r4, #0
	bl SpeciesToHoennPokedexNum
	adds r4, r0, #0
	cmp r4, #0xca
	bls _0806DE84
	ldr r0, _0806DE80
	b _0806DE86
	.align 2, 0
_0806DE80: .4byte 0x0000FFFF
_0806DE84:
	adds r0, r4, #0
_0806DE86:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SpeciesToPokedexNum

	thumb_func_start IsSpeciesInHoennDex
IsSpeciesInHoennDex: @ 0x0806DE8C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SpeciesToHoennPokedexNum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xca
	bhi _0806DEA2
	movs r0, #1
	b _0806DEA4
_0806DEA2:
	movs r0, #0
_0806DEA4:
	pop {r1}
	bx r1
	thumb_func_end IsSpeciesInHoennDex

	thumb_func_start ClearBattleMonForms
ClearBattleMonForms: @ 0x0806DEA8
	push {lr}
	ldr r1, _0806DEBC
	movs r2, #0
	adds r0, r1, #3
_0806DEB0:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0806DEB0
	pop {r0}
	bx r0
	.align 2, 0
_0806DEBC: .4byte 0x02024188
	thumb_func_end ClearBattleMonForms

	thumb_func_start GetBattleBGM
GetBattleBGM: @ 0x0806DEC0
	push {lr}
	ldr r0, _0806DED8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _0806DEDC
	movs r0, #0xf0
	lsls r0, r0, #1
	b _0806E0D2
	.align 2, 0
_0806DED8: .4byte 0x02022C90
_0806DEDC:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0806DEF0
	ldr r0, _0806DEEC
	b _0806E0D2
	.align 2, 0
_0806DEEC: .4byte 0x000001DF
_0806DEF0:
	ldr r0, _0806DF1C
	ands r0, r1
	cmp r0, #0
	beq _0806DEFA
	b _0806E0C8
_0806DEFA:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0806DF04
	b _0806E0CE
_0806DF04:
	ldr r0, _0806DF20
	ands r0, r1
	cmp r0, #0
	beq _0806DF28
	ldr r0, _0806DF24
	ldrh r0, [r0]
	bl GetFrontierOpponentClass
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0806DF42
	.align 2, 0
_0806DF1C: .4byte 0x02000002
_0806DF20: .4byte 0x003F0100
_0806DF24: .4byte 0x0203886A
_0806DF28:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0806DF36
	movs r0, #0xa
	b _0806DF42
_0806DF36:
	ldr r1, _0806DF54
	ldr r0, _0806DF58
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrb r0, [r0, #1]
_0806DF42:
	subs r0, #3
	cmp r0, #0x3d
	bls _0806DF4A
	b _0806E0C8
_0806DF4A:
	lsls r0, r0, #2
	ldr r1, _0806DF5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DF54: .4byte 0x082E383C
_0806DF58: .4byte 0x0203886A
_0806DF5C: .4byte 0x0806DF60
_0806DF60: @ jump table
	.4byte _0806E060 @ case 0
	.4byte _0806E0C8 @ case 1
	.4byte _0806E0C8 @ case 2
	.4byte _0806E0C8 @ case 3
	.4byte _0806E0C8 @ case 4
	.4byte _0806E0C8 @ case 5
	.4byte _0806E060 @ case 6
	.4byte _0806E0C8 @ case 7
	.4byte _0806E060 @ case 8
	.4byte _0806E0C8 @ case 9
	.4byte _0806E058 @ case 10
	.4byte _0806E0C8 @ case 11
	.4byte _0806E0C8 @ case 12
	.4byte _0806E0C8 @ case 13
	.4byte _0806E0C8 @ case 14
	.4byte _0806E0C8 @ case 15
	.4byte _0806E0C8 @ case 16
	.4byte _0806E0C8 @ case 17
	.4byte _0806E0C8 @ case 18
	.4byte _0806E0C8 @ case 19
	.4byte _0806E0C8 @ case 20
	.4byte _0806E0C8 @ case 21
	.4byte _0806E0C8 @ case 22
	.4byte _0806E0C8 @ case 23
	.4byte _0806E0C8 @ case 24
	.4byte _0806E0C8 @ case 25
	.4byte _0806E0C8 @ case 26
	.4byte _0806E0C8 @ case 27
	.4byte _0806E0B8 @ case 28
	.4byte _0806E068 @ case 29
	.4byte _0806E0C8 @ case 30
	.4byte _0806E0C8 @ case 31
	.4byte _0806E0C8 @ case 32
	.4byte _0806E0C8 @ case 33
	.4byte _0806E0C8 @ case 34
	.4byte _0806E070 @ case 35
	.4byte _0806E0C8 @ case 36
	.4byte _0806E0C8 @ case 37
	.4byte _0806E0C8 @ case 38
	.4byte _0806E0C8 @ case 39
	.4byte _0806E0C8 @ case 40
	.4byte _0806E0C8 @ case 41
	.4byte _0806E0C8 @ case 42
	.4byte _0806E0C8 @ case 43
	.4byte _0806E0C8 @ case 44
	.4byte _0806E0C8 @ case 45
	.4byte _0806E060 @ case 46
	.4byte _0806E076 @ case 47
	.4byte _0806E0C8 @ case 48
	.4byte _0806E0C8 @ case 49
	.4byte _0806E058 @ case 50
	.4byte _0806E0C8 @ case 51
	.4byte _0806E0C8 @ case 52
	.4byte _0806E0C8 @ case 53
	.4byte _0806E0C8 @ case 54
	.4byte _0806E0BE @ case 55
	.4byte _0806E0BE @ case 56
	.4byte _0806E0BE @ case 57
	.4byte _0806E0BE @ case 58
	.4byte _0806E0BE @ case 59
	.4byte _0806E0BE @ case 60
	.4byte _0806E0BE @ case 61
_0806E058:
	ldr r0, _0806E05C
	b _0806E0D2
	.align 2, 0
_0806E05C: .4byte 0x000001E3
_0806E060:
	ldr r0, _0806E064
	b _0806E0D2
	.align 2, 0
_0806E064: .4byte 0x000001DB
_0806E068:
	ldr r0, _0806E06C
	b _0806E0D2
	.align 2, 0
_0806E06C: .4byte 0x000001DD
_0806E070:
	movs r0, #0xef
	lsls r0, r0, #1
	b _0806E0D2
_0806E076:
	ldr r0, _0806E088
	ldr r0, [r0]
	ldr r1, _0806E08C
	ands r0, r1
	cmp r0, #0
	beq _0806E094
_0806E082:
	ldr r0, _0806E090
	b _0806E0D2
	.align 2, 0
_0806E088: .4byte 0x02022C90
_0806E08C: .4byte 0x003F0100
_0806E090: .4byte 0x000001E1
_0806E094:
	ldr r0, _0806E0AC
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _0806E0B0
	adds r0, r0, r1
	ldr r1, _0806E0B4
	bl StringCompare
	cmp r0, #0
	beq _0806E0C8
	b _0806E082
	.align 2, 0
_0806E0AC: .4byte 0x0203886A
_0806E0B0: .4byte 0x082E3840
_0806E0B4: .4byte 0x085ABC7E
_0806E0B8:
	movs r0, #0xf1
	lsls r0, r0, #1
	b _0806E0D2
_0806E0BE:
	ldr r0, _0806E0C4
	b _0806E0D2
	.align 2, 0
_0806E0C4: .4byte 0x000001D7
_0806E0C8:
	movs r0, #0xee
	lsls r0, r0, #1
	b _0806E0D2
_0806E0CE:
	movs r0, #0xed
	lsls r0, r0, #1
_0806E0D2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattleBGM

	thumb_func_start GetFlavorRelationByPersonality
GetFlavorRelationByPersonality: @ 0x0806E0D8
	push {lr}
	bl ResetMapMusic
	bl m4aMPlayAllStop
	bl GetBattleBGM
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl PlayBGM
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetFlavorRelationByPersonality

	thumb_func_start PlayMapChosenOrBattleBGM
PlayMapChosenOrBattleBGM: @ 0x0806E0F4
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl ResetMapMusic
	bl m4aMPlayAllStop
	cmp r4, #0
	beq _0806E10E
	adds r0, r4, #0
	bl PlayNewMapMusic
	b _0806E11A
_0806E10E:
	bl GetBattleBGM
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl PlayNewMapMusic
_0806E11A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayMapChosenOrBattleBGM

	thumb_func_start GetMonFlavorRelation
GetMonFlavorRelation: @ 0x0806E120
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl ResetMapMusic
	bl m4aMPlayAllStop
	ldr r0, _0806E150
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0806E154
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E150: .4byte 0x0806E159
_0806E154: .4byte 0x03005B60
	thumb_func_end GetMonFlavorRelation

	thumb_func_start sub_0806E158
sub_0806E158: @ 0x0806E158
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0806E178
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0806E17C
	ldrh r0, [r1, #8]
	bl PlayNewMapMusic
	b _0806E188
	.align 2, 0
_0806E178: .4byte 0x03005B60
_0806E17C:
	bl GetBattleBGM
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl PlayNewMapMusic
_0806E188:
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0806E158

	thumb_func_start GetMonFrontSpritePal
GetMonFrontSpritePal: @ 0x0806E194
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl GetMonSpritePalFromSpeciesAndPersonality
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonFrontSpritePal

	thumb_func_start GetMonSpritePalFromSpeciesAndPersonality
GetMonSpritePalFromSpeciesAndPersonality: @ 0x0806E1CC
	push {r4, r5, lr}
	adds r3, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	bls _0806E1E8
	ldr r0, _0806E1E4
	ldr r0, [r0]
	b _0806E214
	.align 2, 0
_0806E1E4: .4byte 0x082D6F08
_0806E1E8:
	lsrs r0, r1, #0x10
	ldr r2, _0806E204
	ands r1, r2
	eors r0, r1
	lsrs r1, r3, #0x10
	eors r0, r1
	ands r3, r2
	eors r0, r3
	cmp r0, #7
	bls _0806E20C
	ldr r0, _0806E208
	lsls r1, r4, #3
	b _0806E210
	.align 2, 0
_0806E204: .4byte 0x0000FFFF
_0806E208: .4byte 0x082D6F08
_0806E20C:
	ldr r0, _0806E21C
	lsls r1, r5, #3
_0806E210:
	adds r1, r1, r0
	ldr r0, [r1]
_0806E214:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806E21C: .4byte 0x082D7CC8
	thumb_func_end GetMonSpritePalFromSpeciesAndPersonality

	thumb_func_start GetMonSpritePalStruct
GetMonSpritePalStruct: @ 0x0806E220
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl GetMonSpritePalStructFromOtIdPersonality
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonSpritePalStruct

	thumb_func_start GetMonSpritePalStructFromOtIdPersonality
GetMonSpritePalStructFromOtIdPersonality: @ 0x0806E258
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r3, _0806E278
	ands r1, r3
	eors r0, r1
	lsrs r1, r2, #0x10
	eors r0, r1
	ands r2, r3
	eors r0, r2
	cmp r0, #7
	bls _0806E280
	lsls r0, r4, #3
	ldr r1, _0806E27C
	b _0806E284
	.align 2, 0
_0806E278: .4byte 0x0000FFFF
_0806E27C: .4byte 0x082D6F08
_0806E280:
	lsls r0, r4, #3
	ldr r1, _0806E28C
_0806E284:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E28C: .4byte 0x082D7CC8
	thumb_func_end GetMonSpritePalStructFromOtIdPersonality

	thumb_func_start IsHMMove2
IsHMMove2: @ 0x0806E290
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _0806E2B4
	ldrh r0, [r2]
	ldr r1, _0806E2B8
	cmp r0, r1
	beq _0806E2C2
	adds r4, r1, #0
	adds r1, r2, #0
_0806E2A4:
	ldrh r0, [r2]
	adds r1, #2
	adds r2, #2
	cmp r0, r3
	bne _0806E2BC
	movs r0, #1
	b _0806E2C4
	.align 2, 0
_0806E2B4: .4byte 0x082FA876
_0806E2B8: .4byte 0x0000FFFF
_0806E2BC:
	ldrh r0, [r1]
	cmp r0, r4
	bne _0806E2A4
_0806E2C2:
	movs r0, #0
_0806E2C4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsHMMove2

	thumb_func_start IsMonSpriteNotFlipped
IsMonSpriteNotFlipped: @ 0x0806E2CC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0806E2E0
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x19]
	lsrs r0, r0, #7
	bx lr
	.align 2, 0
_0806E2E0: .4byte 0x082F0D54
	thumb_func_end IsMonSpriteNotFlipped

	thumb_func_start sub_0806E2E4
sub_0806E2E4: @ 0x0806E2E4
	push {r4, lr}
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0806E308
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r1, r1, r4
	adds r1, r1, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E308: .4byte 0x08591FEC
	thumb_func_end sub_0806E2E4

	thumb_func_start sub_0806E30C
sub_0806E30C: @ 0x0806E30C
	push {r4, lr}
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0806E330
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r1, r1, r4
	adds r1, r1, r2
	movs r0, #0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E330: .4byte 0x08591FEC
	thumb_func_end sub_0806E30C

	thumb_func_start IsTradedMon
IsTradedMon: @ 0x0806E334
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #7
	mov r2, sp
	bl GetMonData
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	mov r1, sp
	bl IsOtherTrainer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsTradedMon

	thumb_func_start IsOtherTrainer
IsOtherTrainer: @ 0x0806E360
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _0806E3A4
	ldr r3, [r1]
	ldrb r2, [r3, #0xa]
	ldrb r1, [r3, #0xb]
	lsls r1, r1, #8
	orrs r2, r1
	ldrb r1, [r3, #0xc]
	lsls r1, r1, #0x10
	orrs r2, r1
	ldrb r1, [r3, #0xd]
	lsls r1, r1, #0x18
	orrs r2, r1
	cmp r0, r2
	bne _0806E3A8
	movs r4, #0
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _0806E39E
	adds r2, r5, #0
_0806E38A:
	adds r1, r3, r4
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0806E3A8
	adds r2, #1
	adds r4, #1
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0806E38A
_0806E39E:
	movs r0, #0
	b _0806E3AA
	.align 2, 0
_0806E3A4: .4byte 0x03005AF0
_0806E3A8:
	movs r0, #1
_0806E3AA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsOtherTrainer

	thumb_func_start GiveMonInitialMoveset
GiveMonInitialMoveset: @ 0x0806E3B0
	push {lr}
	bl BoxMonRestorePP
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GiveMonInitialMoveset

	thumb_func_start BoxMonRestorePP
BoxMonRestorePP: @ 0x0806E3BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r6, #0
_0806E3C4:
	adds r4, r6, #0
	adds r4, #0xd
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0806E410
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl GetBoxMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0x15
	movs r2, #0
	bl GetBoxMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	bl CalculatePPWithBonus
	mov r1, sp
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x11
	adds r0, r5, #0
	mov r2, sp
	bl SetBoxMonData
_0806E410:
	adds r6, #1
	cmp r6, #3
	ble _0806E3C4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BoxMonRestorePP

	thumb_func_start SetMonPreventsSwitchingString
SetMonPreventsSwitchingString: @ 0x0806E420
	push {r4, r5, lr}
	ldr r2, _0806E464
	ldr r5, _0806E468
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r4, _0806E46C
	movs r0, #0xfd
	strb r0, [r4]
	movs r0, #4
	strb r0, [r4, #1]
	adds r1, #0x49
	ldrb r0, [r1]
	strb r0, [r4, #2]
	movs r0, #0xff
	strb r0, [r4, #4]
	ldrb r0, [r1]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806E474
	ldr r1, _0806E470
	ldr r0, [r5]
	adds r0, #0x49
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	b _0806E482
	.align 2, 0
_0806E464: .4byte 0x02023EAE
_0806E468: .4byte 0x02024140
_0806E46C: .4byte 0x02022C0C
_0806E470: .4byte 0x02023D12
_0806E474:
	ldr r1, _0806E4B8
	ldr r0, [r5]
	adds r0, #0x49
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
_0806E482:
	strb r0, [r4, #3]
	ldr r4, _0806E4BC
	movs r0, #0xfd
	strb r0, [r4]
	movs r0, #4
	strb r0, [r4, #1]
	ldr r1, _0806E4C0
	ldrb r0, [r1]
	strb r0, [r4, #2]
	ldr r2, _0806E4B8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	bl pokemon_order_func
	strb r0, [r4, #3]
	movs r0, #0xff
	strb r0, [r4, #4]
	ldr r0, _0806E4C4
	ldr r1, _0806E4C8
	bl BattleStringExpandPlaceholdersToDisplayedString
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E4B8: .4byte 0x02023D12
_0806E4BC: .4byte 0x02022C1C
_0806E4C0: .4byte 0x0202415C
_0806E4C4: .4byte 0x085AA7DF
_0806E4C8: .4byte 0x02021C7C
	thumb_func_end SetMonPreventsSwitchingString

	thumb_func_start GetWildMonTableIdInAlteringCave
GetWildMonTableIdInAlteringCave: @ 0x0806E4CC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	ldr r2, _0806E4E0
_0806E4D6:
	ldrh r0, [r2]
	cmp r0, r3
	bne _0806E4E4
	adds r0, r1, #0
	b _0806E4EE
	.align 2, 0
_0806E4E0: .4byte 0x082FA888
_0806E4E4:
	adds r2, #4
	adds r1, #1
	cmp r1, #8
	ble _0806E4D6
	movs r0, #0
_0806E4EE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetWildMonTableIdInAlteringCave

	thumb_func_start SetWildMonHeldItem
SetWildMonHeldItem: @ 0x0806E4F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806E578
	ldr r0, [r0]
	ldr r1, _0806E57C
	ands r0, r1
	cmp r0, #0
	beq _0806E508
	b _0806E61C
_0806E508:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0806E580
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x2d
	mov r8, r0
	movs r7, #0x5f
	ldr r5, _0806E584
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0806E552
	adds r0, r5, #0
	bl GetMonAbility
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe
	bne _0806E552
	movs r2, #0x14
	mov r8, r2
	movs r7, #0x50
_0806E552:
	ldr r0, _0806E588
	ldrh r1, [r0, #0x12]
	movs r0, #0xd2
	lsls r0, r0, #1
	cmp r1, r0
	bne _0806E5B8
	adds r0, r4, #0
	bl GetWildMonTableIdInAlteringCave
	adds r2, r0, #0
	cmp r2, #0
	beq _0806E590
	cmp r6, r7
	blo _0806E61C
	ldr r0, _0806E580
	lsls r2, r2, #2
	ldr r1, _0806E58C
	b _0806E5F8
	.align 2, 0
_0806E578: .4byte 0x02022C90
_0806E57C: .4byte 0x00302008
_0806E580: .4byte 0x020243E8
_0806E584: .4byte 0x02024190
_0806E588: .4byte 0x02036FB8
_0806E58C: .4byte 0x082FA88A
_0806E590:
	cmp r6, r8
	blo _0806E61C
	cmp r6, r7
	bhs _0806E5A4
	ldr r0, _0806E5A0
	lsls r2, r4, #3
	b _0806E5F2
	.align 2, 0
_0806E5A0: .4byte 0x020243E8
_0806E5A4:
	ldr r0, _0806E5B0
	lsls r2, r4, #3
	subs r2, r2, r4
	lsls r2, r2, #2
	ldr r1, _0806E5B4
	b _0806E5F8
	.align 2, 0
_0806E5B0: .4byte 0x020243E8
_0806E5B4: .4byte 0x082F0D62
_0806E5B8:
	ldr r0, _0806E5E0
	mov ip, r0
	lsls r0, r4, #3
	subs r1, r0, r4
	lsls r5, r1, #2
	mov r2, ip
	adds r1, r5, r2
	ldrh r3, [r1, #0xc]
	adds r2, r0, #0
	ldrh r1, [r1, #0xe]
	cmp r3, r1
	bne _0806E5E8
	cmp r3, #0
	beq _0806E5E8
	ldr r0, _0806E5E4
	mov r2, ip
	adds r2, #0xc
	adds r2, r5, r2
	b _0806E5FA
	.align 2, 0
_0806E5E0: .4byte 0x082F0D54
_0806E5E4: .4byte 0x020243E8
_0806E5E8:
	cmp r6, r8
	blo _0806E61C
	cmp r6, r7
	bhs _0806E60C
	ldr r0, _0806E604
_0806E5F2:
	subs r2, r2, r4
	lsls r2, r2, #2
	ldr r1, _0806E608
_0806E5F8:
	adds r2, r2, r1
_0806E5FA:
	movs r1, #0xc
	bl SetMonData
	b _0806E61C
	.align 2, 0
_0806E604: .4byte 0x020243E8
_0806E608: .4byte 0x082F0D60
_0806E60C:
	ldr r0, _0806E628
	subs r2, r2, r4
	lsls r2, r2, #2
	ldr r1, _0806E62C
	adds r2, r2, r1
	movs r1, #0xc
	bl SetMonData
_0806E61C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E628: .4byte 0x020243E8
_0806E62C: .4byte 0x082F0D62
	thumb_func_end SetWildMonHeldItem

	thumb_func_start IsMonShiny
IsMonShiny: @ 0x0806E630
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #1
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	adds r0, r5, #0
	bl IsShinyOtIdPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsMonShiny

	thumb_func_start IsShinyOtIdPersonality
IsShinyOtIdPersonality: @ 0x0806E65C
	push {r4, lr}
	movs r4, #0
	lsrs r2, r0, #0x10
	ldr r3, _0806E680
	ands r0, r3
	eors r2, r0
	lsrs r0, r1, #0x10
	eors r2, r0
	ands r1, r3
	eors r2, r1
	cmp r2, #7
	bhi _0806E676
	movs r4, #1
_0806E676:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E680: .4byte 0x0000FFFF
	thumb_func_end IsShinyOtIdPersonality

	thumb_func_start GetTrainerPartnerName
GetTrainerPartnerName: @ 0x0806E684
	push {r4, lr}
	ldr r0, _0806E6A4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0806E6C8
	ldr r2, _0806E6A8
	ldrh r1, [r2]
	ldr r0, _0806E6AC
	cmp r1, r0
	bne _0806E6B4
	ldr r0, _0806E6B0
	b _0806E6F0
	.align 2, 0
_0806E6A4: .4byte 0x02022C90
_0806E6A8: .4byte 0x0203886E
_0806E6AC: .4byte 0x00000C03
_0806E6B0: .4byte 0x082E9CC0
_0806E6B4:
	ldr r4, _0806E6C4
	ldrh r1, [r2]
	adds r0, r4, #0
	bl GetFrontierTrainerName
	adds r0, r4, #0
	b _0806E6F0
	.align 2, 0
_0806E6C4: .4byte 0x02021C40
_0806E6C8:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0806E6F8
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x18]
	movs r0, #2
	eors r0, r1
	bl GetBattlerMultiplayerId
	adds r1, r0, #0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r4, #8
	adds r0, r0, r4
_0806E6F0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E6F8: .4byte 0x020226A0
	thumb_func_end GetTrainerPartnerName

	thumb_func_start Task_AnimateAfterDelay
Task_AnimateAfterDelay: @ 0x0806E6FC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0806E734
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #0xe]
	subs r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806E72C
	ldrh r0, [r2, #8]
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #0x10
	orrs r0, r1
	ldrb r1, [r2, #0xc]
	bl LaunchAnimationTaskForFrontSprite
	adds r0, r4, #0
	bl DestroyTask
_0806E72C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E734: .4byte 0x03005B60
	thumb_func_end Task_AnimateAfterDelay

	thumb_func_start Task_PokemonSummaryAnimateAfterDelay
Task_PokemonSummaryAnimateAfterDelay: @ 0x0806E738
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0806E774
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #0xe]
	subs r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806E76E
	ldrh r0, [r2, #8]
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #0x10
	orrs r0, r1
	ldrb r1, [r2, #0xc]
	bl StartMonSummaryAnimation
	movs r0, #0xff
	bl SummaryScreen_SetUnknownTaskId
	adds r0, r4, #0
	bl DestroyTask
_0806E76E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E774: .4byte 0x03005B60
	thumb_func_end Task_PokemonSummaryAnimateAfterDelay

	thumb_func_start BattleAnimateFrontSprite
BattleAnimateFrontSprite: @ 0x0806E778
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0806E7B0
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806E7BC
	ldr r0, _0806E7B4
	ldr r0, [r0]
	ldr r1, _0806E7B8
	ands r0, r1
	cmp r0, #0
	bne _0806E7BC
	movs r0, #0x80
	orrs r3, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DoMonFrontSpriteAnimation
	b _0806E7C4
	.align 2, 0
_0806E7B0: .4byte 0x02023F24
_0806E7B4: .4byte 0x02022C90
_0806E7B8: .4byte 0x02000002
_0806E7BC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl DoMonFrontSpriteAnimation
_0806E7C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleAnimateFrontSprite

	thumb_func_start DoMonFrontSpriteAnimation
DoMonFrontSpriteAnimation: @ 0x0806E7CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x7f
	ands r0, r3
	cmp r0, #0
	beq _0806E7EC
	cmp r0, #1
	beq _0806E7F0
	movs r1, #0
	b _0806E7F2
_0806E7EC:
	movs r1, #0xe7
	b _0806E7F2
_0806E7F0:
	movs r1, #0x19
_0806E7F2:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0806E810
	cmp r2, #0
	bne _0806E808
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl PlayCry1
_0806E808:
	ldr r0, _0806E80C
	b _0806E886
	.align 2, 0
_0806E80C: .4byte 0x08007141
_0806E810:
	cmp r2, #0
	bne _0806E832
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl PlayCry1
	adds r0, r4, #0
	bl HasTwoFramesAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806E832
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
_0806E832:
	ldr r0, _0806E868
	subs r4, #1
	adds r6, r4, r0
	ldrb r0, [r6]
	cmp r0, #0
	beq _0806E878
	ldr r0, _0806E86C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0806E870
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #8]
	lsrs r0, r5, #0x10
	strh r0, [r1, #0xa]
	ldr r0, _0806E874
	adds r0, r4, r0
	ldrb r0, [r0]
	strh r0, [r1, #0xc]
	ldrb r0, [r6]
	strh r0, [r1, #0xe]
	b _0806E884
	.align 2, 0
_0806E868: .4byte 0x082FA50F
_0806E86C: .4byte 0x0806E6FD
_0806E870: .4byte 0x03005B60
_0806E874: .4byte 0x082FA374
_0806E878:
	ldr r0, _0806E890
	adds r0, r4, r0
	ldrb r1, [r0]
	adds r0, r5, #0
	bl LaunchAnimationTaskForFrontSprite
_0806E884:
	ldr r0, _0806E894
_0806E886:
	str r0, [r5, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E890: .4byte 0x082FA374
_0806E894: .4byte 0x080394FD
	thumb_func_end DoMonFrontSpriteAnimation

	thumb_func_start PokemonSummaryDoMonAnimation
PokemonSummaryDoMonAnimation: @ 0x0806E898
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	cmp r2, #0
	bne _0806E8BA
	adds r0, r4, #0
	bl HasTwoFramesAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806E8BA
	adds r0, r5, #0
	movs r1, #1
	bl StartSpriteAnim
_0806E8BA:
	ldr r0, _0806E8FC
	subs r4, #1
	adds r6, r4, r0
	ldrb r0, [r6]
	cmp r0, #0
	beq _0806E90C
	ldr r0, _0806E900
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0806E904
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r1
	strh r5, [r2, #8]
	lsrs r1, r5, #0x10
	strh r1, [r2, #0xa]
	ldr r1, _0806E908
	adds r1, r4, r1
	ldrb r1, [r1]
	strh r1, [r2, #0xc]
	ldrb r1, [r6]
	strh r1, [r2, #0xe]
	bl SummaryScreen_SetUnknownTaskId
	adds r0, r5, #0
	bl SetSpriteCB_MonAnimDummy
	b _0806E918
	.align 2, 0
_0806E8FC: .4byte 0x082FA50F
_0806E900: .4byte 0x0806E739
_0806E904: .4byte 0x03005B60
_0806E908: .4byte 0x082FA374
_0806E90C:
	ldr r0, _0806E920
	adds r0, r4, r0
	ldrb r1, [r0]
	adds r0, r5, #0
	bl StartMonSummaryAnimation
_0806E918:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E920: .4byte 0x082FA374
	thumb_func_end PokemonSummaryDoMonAnimation

	thumb_func_start StopPokemonAnimationDelayTask
StopPokemonAnimationDelayTask: @ 0x0806E924
	push {lr}
	ldr r0, _0806E93C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0806E938
	bl DestroyTask
_0806E938:
	pop {r0}
	bx r0
	.align 2, 0
_0806E93C: .4byte 0x0806E739
	thumb_func_end StopPokemonAnimationDelayTask

	thumb_func_start BattleAnimateBackSprite
BattleAnimateBackSprite: @ 0x0806E940
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r0, _0806E964
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806E974
	ldr r0, _0806E968
	ldr r0, [r0]
	ldr r1, _0806E96C
	ands r0, r1
	cmp r0, #0
	bne _0806E974
	ldr r0, _0806E970
	b _0806E988
	.align 2, 0
_0806E964: .4byte 0x02023F24
_0806E968: .4byte 0x02022C90
_0806E96C: .4byte 0x02000002
_0806E970: .4byte 0x08007141
_0806E974:
	adds r0, r2, #0
	bl GetSpeciesBackAnimSet
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl LaunchAnimationTaskForBackSprite
	ldr r0, _0806E990
_0806E988:
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E990: .4byte 0x080394FD
	thumb_func_end BattleAnimateBackSprite

	thumb_func_start sub_0806E994
sub_0806E994: @ 0x0806E994
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0806E9C0
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x18]
	cmp r0, #1
	beq _0806E9D8
	cmp r0, #1
	bgt _0806E9C4
	cmp r0, #0
	beq _0806E9CE
	b _0806E9E2
	.align 2, 0
_0806E9C0: .4byte 0x020226A0
_0806E9C4:
	cmp r0, #2
	beq _0806E9CE
	cmp r0, #3
	beq _0806E9D8
	b _0806E9E2
_0806E9CE:
	movs r5, #3
	cmp r4, #0
	beq _0806E9E2
	movs r5, #1
	b _0806E9E2
_0806E9D8:
	rsbs r0, r4, #0
	orrs r0, r4
	asrs r5, r0, #0x1f
	movs r0, #2
	ands r5, r0
_0806E9E2:
	movs r2, #0
	ldr r4, _0806EA0C
	ldrh r0, [r4, #0x18]
	adds r1, r5, #0
	cmp r0, r1
	beq _0806EA00
	adds r3, r1, #0
	adds r1, r4, #0
_0806E9F2:
	adds r1, #0x1c
	adds r2, #1
	cmp r2, #3
	bgt _0806EA00
	ldrh r0, [r1, #0x18]
	cmp r0, r3
	bne _0806E9F2
_0806EA00:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806EA0C: .4byte 0x020226A0
	thumb_func_end sub_0806E994

	thumb_func_start sub_0806EA10
sub_0806EA10: @ 0x0806EA10
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r4, #0
	ldr r2, _0806EA38
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	beq _0806EA50
	cmp r0, #1
	bgt _0806EA3C
	cmp r0, #0
	beq _0806EA46
	b _0806EA5A
	.align 2, 0
_0806EA38: .4byte 0x020226A0
_0806EA3C:
	cmp r0, #2
	beq _0806EA46
	cmp r0, #3
	beq _0806EA50
	b _0806EA5A
_0806EA46:
	movs r4, #3
	cmp r3, #0
	beq _0806EA5A
	movs r4, #1
	b _0806EA5A
_0806EA50:
	rsbs r0, r3, #0
	orrs r0, r3
	asrs r4, r0, #0x1f
	movs r0, #2
	ands r4, r0
_0806EA5A:
	movs r3, #0
	ldrh r0, [r2, #0x18]
	adds r1, r4, #0
	cmp r0, r1
	beq _0806EA72
_0806EA64:
	adds r2, #0x1c
	adds r3, #1
	cmp r3, #3
	bgt _0806EA72
	ldrh r0, [r2, #0x18]
	cmp r0, r1
	bne _0806EA64
_0806EA72:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0806EA10

	thumb_func_start FacilityClassToPicIndex
FacilityClassToPicIndex: @ 0x0806EA7C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0806EA88
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806EA88: .4byte 0x082EFF00
	thumb_func_end FacilityClassToPicIndex

	thumb_func_start PlayerGenderToFrontTrainerPicId
PlayerGenderToFrontTrainerPicId: @ 0x0806EA8C
	push {lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806EA98
	movs r0, #0x3c
	b _0806EA9A
_0806EA98:
	movs r0, #0x3f
_0806EA9A:
	bl FacilityClassToPicIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end PlayerGenderToFrontTrainerPicId

	thumb_func_start HandleSetPokedexFlag
HandleSetPokedexFlag: @ 0x0806EAA8
	push {r4, r5, r6, r7, lr}
	adds r7, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, r4, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #2
	eors r0, r5
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	adds r0, r4, #0
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806EAFE
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetSetPokedexFlag
	adds r0, r4, #0
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc9
	bne _0806EAE8
	ldr r0, _0806EB04
	ldr r0, [r0]
	str r7, [r0, #0x1c]
_0806EAE8:
	adds r0, r6, #0
	bl NationalPokedexNumToSpecies
	lsls r0, r0, #0x10
	movs r1, #0x9a
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _0806EAFE
	ldr r0, _0806EB04
	ldr r0, [r0]
	str r7, [r0, #0x20]
_0806EAFE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB04: .4byte 0x03005AF0
	thumb_func_end HandleSetPokedexFlag

	thumb_func_start GetTrainerClassNameFromId
GetTrainerClassNameFromId: @ 0x0806EB08
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0806EB2C
	cmp r2, r0
	bls _0806EB16
	movs r2, #0
_0806EB16:
	ldr r1, _0806EB30
	lsls r0, r2, #5
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #0xb
	muls r0, r1, r0
	ldr r1, _0806EB34
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_0806EB2C: .4byte 0x00000356
_0806EB30: .4byte 0x082E383C
_0806EB34: .4byte 0x082E3564
	thumb_func_end GetTrainerClassNameFromId

	thumb_func_start sub_0806EB38
sub_0806EB38: @ 0x0806EB38
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0806EB50
	cmp r1, r0
	bls _0806EB46
	movs r1, #0
_0806EB46:
	lsls r0, r1, #5
	ldr r1, _0806EB54
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_0806EB50: .4byte 0x00000356
_0806EB54: .4byte 0x082E3840
	thumb_func_end sub_0806EB38

	thumb_func_start HasTwoFramesAnimation
HasTwoFramesAnimation: @ 0x0806EB58
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	ldr r0, _0806EB84
	cmp r2, r0
	beq _0806EB7C
	adds r0, #0x19
	cmp r2, r0
	beq _0806EB7C
	subs r0, #0x66
	cmp r2, r0
	beq _0806EB7C
	movs r1, #0xc9
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
_0806EB7C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0806EB84: .4byte 0x00000181
	thumb_func_end HasTwoFramesAnimation

	thumb_func_start sub_0806EB88
sub_0806EB88: @ 0x0806EB88
	push {lr}
	ldr r2, _0806EBCC
	ldr r1, _0806EBD0
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806EBA6
	ldr r0, _0806EBD4
	ldr r0, [r0]
	ldr r1, _0806EBD8
	ands r0, r1
	cmp r0, #0
	bne _0806EBC8
_0806EBA6:
	ldr r1, _0806EBD0
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0806EBDC
	bl InBattlePike
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806EBC8
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806EBDC
_0806EBC8:
	movs r0, #1
	b _0806EBDE
	.align 2, 0
_0806EBCC: .4byte 0x03002360
_0806EBD0: .4byte 0x00000439
_0806EBD4: .4byte 0x02022C90
_0806EBD8: .4byte 0x003F0100
_0806EBDC:
	movs r0, #0
_0806EBDE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0806EB88

	thumb_func_start sub_0806EBE4
sub_0806EBE4: @ 0x0806EBE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldrb r0, [r6]
	lsls r0, r0, #0x1c
	movs r4, #0
	cmp r0, #0
	beq _0806EC6E
_0806EBFA:
	ldr r0, [r6, #0xc]
	lsls r2, r4, #1
	adds r1, r2, r4
	lsls r1, r1, #3
	adds r0, r1, r0
	ldr r3, _0806EC7C
	adds r1, r1, r3
	ldm r1!, {r3, r5, r7}
	stm r0!, {r3, r5, r7}
	ldm r1!, {r3, r5, r7}
	stm r0!, {r3, r5, r7}
	movs r5, #0
	ldrb r3, [r6, #1]
	ldr r7, [r6, #0xc]
	mov sb, r7
	mov r8, r2
	ldr r0, [r6, #0x10]
	mov ip, r0
	adds r1, r4, #1
	mov sl, r1
	cmp r5, r3
	bhs _0806EC4C
	mov r7, ip
	ldr r1, [r6, #8]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r2, [r0]
_0806EC30:
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	lsls r1, r5, #0xb
	adds r1, r2, r1
	str r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r3, [r6, #1]
	cmp r5, r3
	blo _0806EC30
_0806EC4C:
	mov r3, r8
	adds r1, r3, r4
	lsls r1, r1, #3
	add r1, sb
	ldrb r0, [r6, #1]
	muls r0, r4, r0
	lsls r0, r0, #3
	add r0, ip
	str r0, [r1, #0xc]
	mov r5, sl
	lsls r0, r5, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r6]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r4, r0
	blt _0806EBFA
_0806EC6E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC7C: .4byte 0x082FA724
	thumb_func_end sub_0806EBE4

	thumb_func_start sub_0806EC80
sub_0806EC80: @ 0x0806EC80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	movs r3, #0
	cmp r0, #0
	beq _0806ED1A
	ldr r0, _0806ED28
	mov sl, r0
_0806EC9A:
	ldr r0, [r4, #0xc]
	lsls r2, r3, #1
	adds r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	mov r0, sl
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	movs r5, #0
	ldr r0, [r4, #0xc]
	mov r8, r0
	mov ip, r2
	ldr r7, [r4, #0x10]
	adds r1, r3, #1
	mov sb, r1
	ldrb r6, [r4, #1]
	cmp r5, r6
	bhs _0806ECEE
	adds r6, r7, #0
	ldr r1, [r4, #8]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r2, [r0]
_0806ECCC:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r1, r3, #0
	muls r1, r0, r1
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r6
	lsls r0, r5, #0xb
	adds r0, r2, r0
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r0, [r4, #1]
	cmp r5, r0
	blo _0806ECCC
_0806ECEE:
	mov r5, ip
	adds r1, r5, r3
	lsls r1, r1, #3
	add r1, r8
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	muls r0, r3, r0
	lsls r0, r0, #3
	adds r0, r7, r0
	str r0, [r1, #0xc]
	ldr r6, _0806ED2C
	str r6, [r1, #8]
	strh r3, [r1, #2]
	mov r7, sb
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r3, r0
	blt _0806EC9A
_0806ED1A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED28: .4byte 0x082FA8B4
_0806ED2C: .4byte 0x082D2F9C
	thumb_func_end sub_0806EC80

	thumb_func_start sub_0806ED30
sub_0806ED30: @ 0x0806ED30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r7, #0
	movs r0, #1
	ands r6, r0
	movs r0, #0x14
	bl AllocZeroed
	adds r4, r0, #0
	cmp r4, #0
	bne _0806ED54
	movs r0, #0
	b _0806EEF2
_0806ED54:
	cmp r5, #0
	beq _0806ED6A
	cmp r5, #2
	bne _0806ED6A
	movs r0, #0x77
	strb r0, [r4]
	movs r0, #4
	strb r0, [r4, #1]
	movs r0, #0x21
	strb r0, [r4, #3]
	b _0806ED92
_0806ED6A:
	ldrb r1, [r4]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r3, #0xf
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4]
	movs r0, #4
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	ands r2, r3
	strb r2, [r4, #3]
_0806ED92:
	ldrb r1, [r4, #3]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0xf
	muls r0, r1, r0
	bl AllocZeroed
	str r0, [r4, #4]
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x17
	bl AllocZeroed
	adds r1, r0, #0
	str r1, [r4, #8]
	ldr r2, [r4, #4]
	cmp r2, #0
	beq _0806EDBE
	cmp r1, #0
	bne _0806EDC8
_0806EDBE:
	movs r0, #1
	orrs r7, r0
	lsls r6, r6, #2
	mov r8, r6
	b _0806EDFC
_0806EDC8:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	movs r3, #0
	lsls r6, r6, #2
	mov r8, r6
	cmp r0, #0
	beq _0806EDFC
	adds r6, r1, #0
	adds r5, r2, #0
_0806EDDA:
	lsls r2, r3, #2
	adds r2, r2, r6
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	lsls r1, r3, #0xd
	muls r0, r1, r0
	adds r0, r5, r0
	str r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r3, r0
	blt _0806EDDA
_0806EDFC:
	ldrb r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	bl AllocZeroed
	str r0, [r4, #0xc]
	ldrb r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	muls r0, r1, r0
	bl AllocZeroed
	adds r1, r0, #0
	str r1, [r4, #0x10]
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0806EE2C
	cmp r1, #0
	bne _0806EE36
_0806EE2C:
	movs r0, #2
	orrs r7, r0
	lsls r0, r7, #0x18
	lsrs r7, r0, #0x18
	b _0806EE84
_0806EE36:
	movs r3, #0
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	muls r0, r1, r0
	cmp r3, r0
	bge _0806EE66
	movs r2, #0x80
	lsls r2, r2, #4
_0806EE4A:
	ldr r1, [r4, #0x10]
	lsls r0, r3, #3
	adds r0, r0, r1
	strh r2, [r0, #4]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r1, [r4, #1]
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	muls r0, r1, r0
	cmp r3, r0
	blt _0806EE4A
_0806EE66:
	ldrb r0, [r4, #3]
	lsrs r0, r0, #4
	cmp r0, #0
	blt _0806EE7E
	cmp r0, #1
	ble _0806EE7E
	cmp r0, #2
	bne _0806EE7E
	adds r0, r4, #0
	bl sub_0806EC80
	b _0806EE84
_0806EE7E:
	adds r0, r4, #0
	bl sub_0806EBE4
_0806EE84:
	movs r0, #2
	ands r0, r7
	cmp r0, #0
	beq _0806EEA8
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0806EE9A
	bl Free
	movs r0, #0
	str r0, [r4, #0x10]
_0806EE9A:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0806EEA8
	bl Free
	movs r0, #0
	str r0, [r4, #0xc]
_0806EEA8:
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _0806EECC
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0806EEBE
	bl Free
	movs r0, #0
	str r0, [r4, #8]
_0806EEBE:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0806EECC
	bl Free
	movs r0, #0
	str r0, [r4, #4]
_0806EECC:
	cmp r7, #0
	beq _0806EEE2
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	bl memset
	adds r0, r4, #0
	bl Free
	b _0806EEEC
_0806EEE2:
	movs r0, #0xa3
	strb r0, [r4, #2]
	ldr r0, _0806EEFC
	add r0, r8
	str r4, [r0]
_0806EEEC:
	ldr r0, _0806EEFC
	add r0, r8
	ldr r0, [r0]
_0806EEF2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806EEFC: .4byte 0x02024658
	thumb_func_end sub_0806ED30

	thumb_func_start sub_0806EF00
sub_0806EF00: @ 0x0806EF00
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	ands r0, r1
	ldr r1, _0806EF28
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _0806EF74
	ldrb r0, [r4, #2]
	cmp r0, #0xa3
	beq _0806EF2C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	bl memset
	b _0806EF74
	.align 2, 0
_0806EF28: .4byte 0x02024658
_0806EF2C:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0806EF3A
	bl Free
	movs r0, #0
	str r0, [r4, #0x10]
_0806EF3A:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0806EF48
	bl Free
	movs r0, #0
	str r0, [r4, #0xc]
_0806EF48:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0806EF56
	bl Free
	movs r0, #0
	str r0, [r4, #8]
_0806EF56:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0806EF64
	bl Free
	movs r0, #0
	str r0, [r4, #4]
_0806EF64:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	bl memset
	adds r0, r4, #0
	bl Free
_0806EF74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0806EF00

	thumb_func_start EvolutionRenameMon
EvolutionRenameMon: @ 0x0806EF7C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r2, _0806EF9C
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	cmp r0, #0xa3
	beq _0806EFA0
	movs r0, #0
	b _0806EFB4
	.align 2, 0
_0806EF9C: .4byte 0x02024658
_0806EFA0:
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r3, r0
	blt _0806EFAC
	movs r3, #0
_0806EFAC:
	ldr r0, [r1, #8]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldr r0, [r1]
_0806EFB4:
	pop {r1}
	bx r1
	thumb_func_end EvolutionRenameMon

