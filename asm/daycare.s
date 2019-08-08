.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetBoxMonNick
GetBoxMonNick: @ 0x0806F4B0
	push {r4, lr}
	sub sp, #0x14
	adds r4, r1, #0
	movs r1, #2
	mov r2, sp
	bl GetMonData
	adds r0, r4, #0
	mov r1, sp
	bl StringCopy10
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBoxMonNick

	thumb_func_start GetMonNick
GetMonNick: @ 0x0806F4D0
	push {r4, lr}
	sub sp, #0x14
	adds r4, r1, #0
	movs r1, #2
	mov r2, sp
	bl GetBoxMonData
	adds r0, r4, #0
	mov r1, sp
	bl StringCopy10
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetMonNick

	thumb_func_start CountPokemonInDaycare
CountPokemonInDaycare: @ 0x0806F4F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r4, #0
_0806F4F8:
	movs r0, #0x8c
	muls r0, r4, r0
	adds r0, r6, r0
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	beq _0806F50E
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0806F50E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0806F4F8
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end CountPokemonInDaycare

	thumb_func_start InitDaycareMailRecordMixing
InitDaycareMailRecordMixing: @ 0x0806F520
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	movs r7, #0
	movs r5, #0
	mov r6, sl
	adds r6, #0x74
	movs r0, #1
	mov r8, r0
_0806F53A:
	movs r0, #0x8c
	muls r0, r5, r0
	mov r1, sb
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	beq _0806F568
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	movs r1, #0xc
	bl GetBoxMonData
	adds r1, r0, #0
	cmp r1, #0
	bne _0806F568
	lsls r0, r5, #1
	adds r0, r6, r0
	b _0806F56E
_0806F568:
	lsls r0, r5, #1
	adds r0, r6, r0
	mov r1, r8
_0806F56E:
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _0806F53A
	mov r0, sl
	str r7, [r0, #0x70]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end InitDaycareMailRecordMixing

	thumb_func_start Daycare_FindEmptySpot
Daycare_FindEmptySpot: @ 0x0806F58C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0806F592:
	movs r0, #0x8c
	muls r0, r4, r0
	adds r0, r5, r0
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	bne _0806F5A8
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	b _0806F5B6
_0806F5A8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0806F592
	movs r0, #1
	rsbs r0, r0, #0
_0806F5B6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end Daycare_FindEmptySpot

	thumb_func_start StorePokemonInDaycare
StorePokemonInDaycare: @ 0x0806F5BC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl MonHasMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806F614
	adds r0, r4, #0
	adds r0, #0x74
	ldr r1, _0806F640
	ldr r1, [r1]
	bl StringCopy
	adds r1, r4, #0
	adds r1, #0x7c
	adds r0, r5, #0
	bl GetBoxMonNick
	adds r0, r5, #0
	movs r1, #0x40
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0806F644
	ldr r1, [r1]
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x50
	ldr r2, _0806F648
	adds r1, r1, r2
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	adds r0, r5, #0
	bl TakeMailFromMon
_0806F614:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x50
	bl memcpy
	adds r0, r4, #0
	bl BoxMonRestorePP
	adds r1, r4, #0
	adds r1, #0x88
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	bl ZeroMonData
	bl CompactPartySlots
	bl CalculatePlayerPartyCount
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F640: .4byte 0x03005AF0
_0806F644: .4byte 0x03005AEC
_0806F648: .4byte 0x00002BE0
	thumb_func_end StorePokemonInDaycare

	thumb_func_start StorePokemonInEmptyDaycareSlot
StorePokemonInEmptyDaycareSlot: @ 0x0806F64C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl Daycare_FindEmptySpot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x8c
	muls r0, r1, r0
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl StorePokemonInDaycare
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end StorePokemonInEmptyDaycareSlot

	thumb_func_start StoreSelectedPokemonInDaycare
StoreSelectedPokemonInDaycare: @ 0x0806F670
	push {lr}
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0806F694
	adds r0, r0, r1
	ldr r1, _0806F698
	ldr r1, [r1]
	ldr r2, _0806F69C
	adds r1, r1, r2
	bl StorePokemonInEmptyDaycareSlot
	pop {r0}
	bx r0
	.align 2, 0
_0806F694: .4byte 0x02024190
_0806F698: .4byte 0x03005AEC
_0806F69C: .4byte 0x00003030
	thumb_func_end StoreSelectedPokemonInDaycare

	thumb_func_start ShiftDaycareSlots
ShiftDaycareSlots: @ 0x0806F6A0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x8c
	adds r0, r4, #0
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	beq _0806F6F6
	adds r0, r5, #0
	movs r1, #0xb
	bl GetBoxMonData
	adds r6, r0, #0
	cmp r6, #0
	bne _0806F6F6
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x50
	bl memcpy
	adds r0, r4, #0
	bl ZeroBoxMonData
	adds r4, #0x50
	adds r0, r5, #0
	adds r0, #0x50
	adds r1, r4, #0
	movs r2, #0x38
	bl memcpy
	adds r2, r5, #0
	adds r2, #0x88
	movs r0, #0x8a
	lsls r0, r0, #1
	adds r1, r5, r0
	ldr r0, [r1]
	str r0, [r2]
	str r6, [r1]
	adds r0, r4, #0
	bl ClearDaycareMonMail
_0806F6F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ShiftDaycareSlots

	thumb_func_start ApplyDaycareExperience
ApplyDaycareExperience: @ 0x0806F6FC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r7, _0806F718
_0806F704:
	adds r0, r4, #0
	bl TryIncrementMonLevel
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806F740
	movs r6, #1
	adds r5, #1
	b _0806F72C
	.align 2, 0
_0806F718: .4byte 0x0000FFFF
_0806F71C:
	movs r6, #0
	cmp r0, r7
	bne _0806F72C
	ldr r0, _0806F74C
	ldrh r1, [r0]
	adds r0, r4, #0
	bl DeleteFirstMoveAndGiveMoveToMon
_0806F72C:
	adds r0, r4, #0
	adds r1, r6, #0
	bl MonTryLearningNewMove
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0806F71C
	cmp r5, #0x63
	ble _0806F704
_0806F740:
	adds r0, r4, #0
	bl CalculateMonStats
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F74C: .4byte 0x02024186
	thumb_func_end ApplyDaycareExperience

	thumb_func_start TakeSelectedPokemonFromDaycare
TakeSelectedPokemonFromDaycare: @ 0x0806F750
	push {r4, r5, r6, r7, lr}
	sub sp, #0x68
	adds r5, r0, #0
	ldr r1, _0806F7EC
	bl GetMonNick
	adds r0, r5, #0
	movs r1, #0xb
	bl GetBoxMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r5, #0
	mov r1, sp
	bl BoxMonToMon
	mov r0, sp
	movs r1, #0x38
	bl GetMonData
	cmp r0, #0x64
	beq _0806F79E
	mov r0, sp
	movs r1, #0x19
	bl GetMonData
	adds r1, r5, #0
	adds r1, #0x88
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [sp, #0x64]
	add r2, sp, #0x64
	mov r0, sp
	movs r1, #0x19
	bl SetMonData
	mov r0, sp
	bl ApplyDaycareExperience
_0806F79E:
	ldr r0, _0806F7F0
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r6, r0, r1
	adds r0, r6, #0
	mov r1, sp
	movs r2, #0x64
	bl memcpy
	adds r0, r5, #0
	adds r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	beq _0806F7CC
	adds r4, r5, #0
	adds r4, #0x50
	adds r0, r6, #0
	adds r1, r4, #0
	bl GiveMailToMon2
	adds r0, r4, #0
	bl ClearDaycareMonMail
_0806F7CC:
	adds r0, r5, #0
	bl ZeroBoxMonData
	adds r1, r5, #0
	adds r1, #0x88
	movs r0, #0
	str r0, [r1]
	bl CompactPartySlots
	bl CalculatePlayerPartyCount
	adds r0, r7, #0
	add sp, #0x68
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806F7EC: .4byte 0x02021C40
_0806F7F0: .4byte 0x02024190
	thumb_func_end TakeSelectedPokemonFromDaycare

	thumb_func_start TakeSelectedPokemonMonFromDaycareShiftSlots
TakeSelectedPokemonMonFromDaycareShiftSlots: @ 0x0806F7F4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r5, r0
	bl TakeSelectedPokemonFromDaycare
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ShiftDaycareSlots
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TakeSelectedPokemonMonFromDaycareShiftSlots

	thumb_func_start TakePokemonFromDaycare
TakePokemonFromDaycare: @ 0x0806F81C
	push {lr}
	ldr r0, _0806F838
	ldr r0, [r0]
	ldr r1, _0806F83C
	adds r0, r0, r1
	ldr r1, _0806F840
	ldrb r1, [r1]
	bl TakeSelectedPokemonMonFromDaycareShiftSlots
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_0806F838: .4byte 0x03005AEC
_0806F83C: .4byte 0x00003030
_0806F840: .4byte 0x02037280
	thumb_func_end TakePokemonFromDaycare

	thumb_func_start GetLevelAfterDaycareSteps
GetLevelAfterDaycareSteps: @ 0x0806F844
	push {r4, r5, lr}
	sub sp, #0x54
	adds r4, r0, #0
	adds r5, r1, #0
	mov r0, sp
	adds r1, r4, #0
	movs r2, #0x50
	bl memcpy
	adds r0, r4, #0
	movs r1, #0x19
	bl GetBoxMonData
	adds r0, r0, r5
	str r0, [sp, #0x50]
	add r2, sp, #0x50
	mov r0, sp
	movs r1, #0x19
	bl SetBoxMonData
	mov r0, sp
	bl GetLevelFromBoxMonExp
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0x54
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetLevelAfterDaycareSteps

	thumb_func_start GetNumLevelsGainedFromSteps
GetNumLevelsGainedFromSteps: @ 0x0806F880
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetLevelFromBoxMonExp
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r0, #0x88
	ldr r1, [r0]
	adds r0, r5, #0
	bl GetLevelAfterDaycareSteps
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetNumLevelsGainedFromSteps

	thumb_func_start GetNumLevelsGainedForDaycareMon
GetNumLevelsGainedForDaycareMon: @ 0x0806F8AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetNumLevelsGainedFromSteps
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0806F8D8
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r1, _0806F8DC
	adds r0, r5, #0
	bl GetMonNick
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806F8D8: .4byte 0x02021C54
_0806F8DC: .4byte 0x02021C40
	thumb_func_end GetNumLevelsGainedForDaycareMon

	thumb_func_start GetDaycareCostForSelectedMon
GetDaycareCostForSelectedMon: @ 0x0806F8E0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetNumLevelsGainedFromSteps
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0806F910
	adds r0, r5, #0
	bl GetMonNick
	movs r0, #0x64
	muls r4, r0, r4
	adds r4, #0x64
	ldr r0, _0806F914
	adds r1, r4, #0
	movs r2, #0
	movs r3, #5
	bl ConvertIntToDecimalStringN
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806F910: .4byte 0x02021C40
_0806F914: .4byte 0x02021C54
	thumb_func_end GetDaycareCostForSelectedMon

	thumb_func_start GetDaycareCostForMon
GetDaycareCostForMon: @ 0x0806F918
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x8c
	muls r1, r2, r1
	adds r0, r0, r1
	bl GetDaycareCostForSelectedMon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end GetDaycareCostForMon

	thumb_func_start GetDaycareCost
GetDaycareCost: @ 0x0806F930
	push {lr}
	ldr r0, _0806F94C
	ldr r0, [r0]
	ldr r1, _0806F950
	adds r0, r0, r1
	ldr r1, _0806F954
	ldrb r1, [r1]
	bl GetDaycareCostForMon
	ldr r1, _0806F958
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806F94C: .4byte 0x03005AEC
_0806F950: .4byte 0x00003030
_0806F954: .4byte 0x02037280
_0806F958: .4byte 0x02037282
	thumb_func_end GetDaycareCost

	thumb_func_start Debug_AddDaycareSteps
Debug_AddDaycareSteps: @ 0x0806F95C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0806F97C
	ldr r2, [r1]
	ldr r1, _0806F980
	adds r3, r2, r1
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r3]
	ldr r1, _0806F984
	adds r2, r2, r1
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	bx lr
	.align 2, 0
_0806F97C: .4byte 0x03005AEC
_0806F980: .4byte 0x000030B8
_0806F984: .4byte 0x00003144
	thumb_func_end Debug_AddDaycareSteps

	thumb_func_start GetNumLevelsGainedFromDaycare
GetNumLevelsGainedFromDaycare: @ 0x0806F988
	push {r4, r5, r6, lr}
	ldr r6, _0806F9AC
	ldr r5, _0806F9B0
	ldrh r0, [r5]
	movs r4, #0x8c
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r0, _0806F9B4
	adds r1, r1, r0
	ldr r0, [r6]
	adds r0, r0, r1
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	bne _0806F9B8
	movs r0, #0
	b _0806F9CE
	.align 2, 0
_0806F9AC: .4byte 0x03005AEC
_0806F9B0: .4byte 0x02037280
_0806F9B4: .4byte 0x00003030
_0806F9B8:
	ldrh r0, [r5]
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r0, _0806F9D4
	adds r1, r1, r0
	ldr r0, [r6]
	adds r0, r0, r1
	bl GetNumLevelsGainedForDaycareMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0806F9CE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806F9D4: .4byte 0x00003030
	thumb_func_end GetNumLevelsGainedFromDaycare

	thumb_func_start ClearDaycareMonMail
ClearDaycareMonMail: @ 0x0806F9D8
	push {lr}
	movs r3, #0
	movs r2, #7
	adds r1, r0, #0
	adds r1, #0x2b
_0806F9E2:
	strb r3, [r1]
	subs r1, #1
	subs r2, #1
	cmp r2, #0
	bge _0806F9E2
	adds r2, r0, #0
	adds r2, #0x2c
	movs r3, #0
	adds r1, r0, #0
	adds r1, #0x36
_0806F9F6:
	strb r3, [r1]
	subs r1, #1
	cmp r1, r2
	bge _0806F9F6
	bl ClearMailStruct
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearDaycareMonMail

	thumb_func_start ClearDaycareMon
ClearDaycareMon: @ 0x0806FA08
	push {r4, lr}
	adds r4, r0, #0
	bl ZeroBoxMonData
	adds r1, r4, #0
	adds r1, #0x88
	movs r0, #0
	str r0, [r1]
	adds r4, #0x50
	adds r0, r4, #0
	bl ClearDaycareMonMail
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearDaycareMon

	thumb_func_start ClearAllDaycareData
ClearAllDaycareData: @ 0x0806FA28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r6, #0x8c
_0806FA30:
	adds r0, r4, #0
	muls r0, r6, r0
	adds r0, r5, r0
	bl ClearDaycareMon
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0806FA30
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0
	str r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ClearAllDaycareData

	thumb_func_start GetEggSpecies
GetEggSpecies: @ 0x0806FA5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, _0806FA88
	mov ip, r0
_0806FA6E:
	movs r7, #0
	movs r6, #1
	movs r4, #0x80
	lsls r4, r4, #9
	movs r5, #0x28
	mov r3, ip
	adds r3, #0x28
_0806FA7C:
	movs r1, #0
	ldrh r0, [r3, #4]
	cmp r0, r2
	bne _0806FA8C
	lsrs r2, r4, #0x10
	b _0806FAB8
	.align 2, 0
_0806FA88: .4byte 0x082F5CA4
_0806FA8C:
	adds r1, #1
	cmp r1, #4
	bgt _0806FAA2
	lsls r0, r1, #3
	adds r0, r0, r5
	add r0, ip
	ldrh r0, [r0, #4]
	cmp r0, r2
	bne _0806FA8C
	lsrs r2, r4, #0x10
	movs r7, #1
_0806FAA2:
	cmp r7, #0
	bne _0806FAB8
	movs r0, #0x80
	lsls r0, r0, #9
	adds r4, r4, r0
	adds r5, #0x28
	adds r3, #0x28
	adds r6, #1
	ldr r0, _0806FAD8
	cmp r6, r0
	ble _0806FA7C
_0806FAB8:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r6, r0
	beq _0806FACA
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #4
	ble _0806FA6E
_0806FACA:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806FAD8: .4byte 0x0000019B
	thumb_func_end GetEggSpecies

	thumb_func_start GetSlotToInheritNature
GetSlotToInheritNature: @ 0x0806FADC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r7, #1
	rsbs r7, r7, #0
	movs r4, #0
_0806FAE8:
	movs r0, #0x8c
	muls r0, r4, r0
	adds r0, r6, r0
	bl GetBoxMonGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xfe
	bne _0806FAFC
	adds r7, r4, #0
_0806FAFC:
	adds r4, #1
	cmp r4, #1
	ble _0806FAE8
	movs r5, #0
	movs r4, #0
_0806FB06:
	movs r0, #0x8c
	muls r0, r4, r0
	adds r0, r6, r0
	movs r1, #0xb
	bl GetBoxMonData
	lsls r1, r4, #2
	add r1, sp
	str r0, [r1]
	cmp r0, #0x84
	bne _0806FB20
	adds r5, #1
	adds r7, r4, #0
_0806FB20:
	adds r4, #1
	cmp r4, #1
	ble _0806FB06
	cmp r5, #2
	bne _0806FB3A
	bl Random
	lsls r0, r0, #0x10
	ldr r1, _0806FB5C
	movs r7, #1
	cmp r0, r1
	bls _0806FB3A
	movs r7, #0
_0806FB3A:
	movs r0, #0x8c
	muls r0, r7, r0
	adds r0, r6, r0
	movs r1, #0xc
	bl GetBoxMonData
	cmp r0, #0xc3
	bne _0806FB56
	bl Random
	lsls r0, r0, #0x10
	ldr r1, _0806FB5C
	cmp r0, r1
	bls _0806FB60
_0806FB56:
	movs r0, #1
	rsbs r0, r0, #0
	b _0806FB62
	.align 2, 0
_0806FB5C: .4byte 0x7FFE0000
_0806FB60:
	adds r0, r7, #0
_0806FB62:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetSlotToInheritNature

	thumb_func_start _TriggerPendingDaycareEgg
_TriggerPendingDaycareEgg: @ 0x0806FB6C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r0, _0806FBB0
	ldrh r0, [r0, #0x24]
	bl SeedRng2
	adds r0, r5, #0
	bl GetSlotToInheritNature
	adds r1, r0, #0
	cmp r1, #0
	bge _0806FBB8
	bl Random2
	adds r4, r0, #0
	bl Random
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r5, r5, r1
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0806FBB4
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #1
	orrs r4, r0
	str r4, [r5]
	b _0806FC04
	.align 2, 0
_0806FBB0: .4byte 0x03002360
_0806FBB4: .4byte 0x0000FFFE
_0806FBB8:
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r5, r0
	movs r1, #0
	movs r2, #0
	bl GetBoxMonData
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0806FBCE:
	bl Random2
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r4, r0
	adds r0, r4, #0
	bl GetNatureFromPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne _0806FBF2
	cmp r4, #0
	bne _0806FBFC
_0806FBF2:
	adds r6, #1
	movs r0, #0x96
	lsls r0, r0, #4
	cmp r6, r0
	ble _0806FBCE
_0806FBFC:
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r5, r1
	str r4, [r0]
_0806FC04:
	movs r0, #0x86
	bl FlagSet
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end _TriggerPendingDaycareEgg

	thumb_func_start _TriggerPendingDaycareMaleEgg
_TriggerPendingDaycareMaleEgg: @ 0x0806FC10
	push {r4, lr}
	adds r4, r0, #0
	bl Random
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r4, r4, r1
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4]
	movs r0, #0x86
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end _TriggerPendingDaycareMaleEgg

	thumb_func_start TriggerPendingDaycareEgg
TriggerPendingDaycareEgg: @ 0x0806FC38
	push {lr}
	ldr r0, _0806FC4C
	ldr r0, [r0]
	ldr r1, _0806FC50
	adds r0, r0, r1
	bl _TriggerPendingDaycareEgg
	pop {r0}
	bx r0
	.align 2, 0
_0806FC4C: .4byte 0x03005AEC
_0806FC50: .4byte 0x00003030
	thumb_func_end TriggerPendingDaycareEgg

	thumb_func_start TriggerPendingDaycareMaleEgg
TriggerPendingDaycareMaleEgg: @ 0x0806FC54
	push {lr}
	ldr r0, _0806FC68
	ldr r0, [r0]
	ldr r1, _0806FC6C
	adds r0, r0, r1
	bl _TriggerPendingDaycareMaleEgg
	pop {r0}
	bx r0
	.align 2, 0
_0806FC68: .4byte 0x03005AEC
_0806FC6C: .4byte 0x00003030
	thumb_func_end TriggerPendingDaycareMaleEgg

	thumb_func_start RemoveIVIndexFromList
RemoveIVIndexFromList: @ 0x0806FC70
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r1, r4, r1
	movs r0, #0xff
	strb r0, [r1]
	movs r2, #0
_0806FC82:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #5
	ble _0806FC82
	movs r3, #0
	movs r2, #0
_0806FC96:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0806FCA8
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, #1
_0806FCA8:
	adds r2, #1
	cmp r2, #5
	ble _0806FC96
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RemoveIVIndexFromList

	thumb_func_start InheritIVs
InheritIVs: @ 0x0806FCB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	mov sb, r0
	mov r8, r1
	movs r5, #0
	add r1, sp, #4
	add r7, sp, #0xc
	adds r2, r1, #0
_0806FCCE:
	adds r0, r2, r5
	strb r5, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0806FCCE
	movs r5, #0
	adds r6, r1, #0
_0806FCE0:
	bl Random
	mov r1, sp
	adds r4, r1, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	subs r1, r1, r5
	bl __modsi3
	adds r0, r6, r0
	ldrb r0, [r0]
	strb r0, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl RemoveIVIndexFromList
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0806FCE0
	movs r5, #0
	movs r4, #1
_0806FD10:
	bl Random
	adds r1, r7, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ands r0, r4
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0806FD10
	movs r5, #0
_0806FD2A:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0806FE06
	lsls r0, r0, #2
	ldr r1, _0806FD40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806FD40: .4byte 0x0806FD44
_0806FD44: @ jump table
	.4byte _0806FD5C @ case 0
	.4byte _0806FD7A @ case 1
	.4byte _0806FD94 @ case 2
	.4byte _0806FDAE @ case 3
	.4byte _0806FDC8 @ case 4
	.4byte _0806FDE8 @ case 5
_0806FD5C:
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	add r0, r8
	movs r1, #0x27
	bl GetBoxMonData
	add r2, sp, #0x10
	strb r0, [r2]
	mov r0, sb
	movs r1, #0x27
	bl SetMonData
	b _0806FE06
_0806FD7A:
	add r4, sp, #0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	add r0, r8
	movs r1, #0x28
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, sb
	movs r1, #0x28
	b _0806FDE0
_0806FD94:
	add r4, sp, #0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	add r0, r8
	movs r1, #0x29
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, sb
	movs r1, #0x29
	b _0806FDE0
_0806FDAE:
	add r4, sp, #0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	add r0, r8
	movs r1, #0x2a
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, sb
	movs r1, #0x2a
	b _0806FDE0
_0806FDC8:
	add r4, sp, #0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	add r0, r8
	movs r1, #0x2b
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, sb
	movs r1, #0x2b
_0806FDE0:
	adds r2, r4, #0
	bl SetMonData
	b _0806FE06
_0806FDE8:
	add r4, sp, #0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	add r0, r8
	movs r1, #0x2c
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, sb
	movs r1, #0x2c
	adds r2, r4, #0
	bl SetMonData
_0806FE06:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0806FD2A
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InheritIVs

	thumb_func_start GetEggMoves
GetEggMoves: @ 0x0806FE20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r6, #0
	movs r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r5, _0806FE48
	ldrh r1, [r5]
	ldr r7, _0806FE4C
	adds r0, r3, r7
	cmp r1, r0
	bne _0806FE50
	movs r4, #1
	b _0806FE72
	.align 2, 0
_0806FE48: .4byte 0x082FB764
_0806FE4C: .4byte 0x00004E20
_0806FE50:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0806FEBC
	ldr r5, _0806FEC0
	cmp r2, r0
	bhi _0806FE72
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r7, _0806FEC4
	adds r0, r3, r7
	cmp r1, r0
	bne _0806FE50
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0806FE72:
	movs r2, #0
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r1, _0806FEC4
	cmp r0, r1
	bhi _0806FEAE
	adds r7, r5, #0
	adds r3, r1, #0
_0806FE84:
	lsls r1, r2, #1
	add r1, r8
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #9
	bhi _0806FEAE
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, r3
	bls _0806FE84
_0806FEAE:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806FEBC: .4byte 0x00000471
_0806FEC0: .4byte 0x082FB764
_0806FEC4: .4byte 0x00004E20
	thumb_func_end GetEggMoves

	thumb_func_start BuildEggMoveset
BuildEggMoveset: @ 0x0806FEC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	mov sl, r1
	mov sb, r2
	movs r0, #0
	str r0, [sp]
	movs r6, #0
	ldr r5, _0806FFCC
	movs r2, #0
	ldr r4, _0806FFD0
	ldr r3, _0806FFD4
_0806FEE8:
	lsls r1, r6, #1
	adds r0, r1, r5
	strh r2, [r0]
	adds r0, r1, r4
	strh r2, [r0]
	adds r1, r1, r3
	strh r2, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bls _0806FEE8
	movs r6, #0
	ldr r2, _0806FFD8
	movs r1, #0
_0806FF06:
	lsls r0, r6, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #9
	bls _0806FF06
	movs r6, #0
	ldr r2, _0806FFDC
	movs r1, #0
_0806FF1C:
	lsls r0, r6, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x31
	bls _0806FF1C
	adds r0, r7, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0806FFDC
	bl GetLevelUpMovesBySpecies
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r6, #0
	ldr r1, _0806FFD0
	mov r8, r1
_0806FF4A:
	adds r5, r6, #0
	adds r5, #0xd
	mov r0, sl
	adds r1, r5, #0
	bl GetBoxMonData
	lsls r4, r6, #1
	mov r2, r8
	adds r1, r4, r2
	strh r0, [r1]
	mov r0, sb
	adds r1, r5, #0
	bl GetBoxMonData
	ldr r1, _0806FFCC
	adds r4, r4, r1
	strh r0, [r4]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bls _0806FF4A
	ldr r1, _0806FFD8
	adds r0, r7, #0
	bl GetEggMoves
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r6, #0
_0806FF86:
	ldr r0, _0806FFD0
	lsls r1, r6, #1
	adds r2, r1, r0
	ldrh r1, [r2]
	mov sb, r0
	cmp r1, #0
	beq _0806FFFC
	movs r5, #0
	cmp r5, r8
	bhs _0806FFEE
	adds r4, r2, #0
	ldr r2, _0806FFE0
_0806FF9E:
	ldr r0, _0806FFD8
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0806FFE4
	adds r1, r0, #0
	adds r0, r7, #0
	str r2, [sp, #8]
	bl GiveMoveToMon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp, #8]
	cmp r0, r2
	bne _0806FFEE
	ldrh r1, [r4]
	adds r0, r7, #0
	bl DeleteFirstMoveAndGiveMoveToMon
	b _0806FFEE
	.align 2, 0
_0806FFCC: .4byte 0x020246F0
_0806FFD0: .4byte 0x020246CC
_0806FFD4: .4byte 0x020246D4
_0806FFD8: .4byte 0x020246DC
_0806FFDC: .4byte 0x02024668
_0806FFE0: .4byte 0x0000FFFF
_0806FFE4:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	blo _0806FF9E
_0806FFEE:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r3, _08070118
	mov sb, r3
	cmp r6, #3
	bls _0806FF86
_0806FFFC:
	movs r6, #0
_0806FFFE:
	lsls r0, r6, #1
	mov r2, sb
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r0, #0
	adds r6, #1
	mov r8, r6
	cmp r1, #0
	beq _08070060
	movs r5, #0
	ldr r0, _08070118
	adds r4, r2, r0
	ldr r6, _0807011C
	mov sb, r0
_0807001A:
	ldr r3, _08070120
	adds r0, r5, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIdToBattleMoveId
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _08070056
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r7, #0
	bl CanMonLearnTMHM
	cmp r0, #0
	beq _08070056
	ldrh r1, [r4]
	adds r0, r7, #0
	bl GiveMoveToMon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r6
	bne _08070056
	ldrh r1, [r4]
	adds r0, r7, #0
	bl DeleteFirstMoveAndGiveMoveToMon
_08070056:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x39
	bls _0807001A
_08070060:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bls _0806FFFE
	movs r6, #0
	mov r2, sb
	ldrh r0, [r2]
	ldr r3, _08070124
	mov sl, r3
	cmp r0, #0
	beq _080700CA
	mov r4, sb
	ldr r0, _08070128
	mov sb, r0
	mov ip, sl
_08070080:
	movs r5, #0
	lsls r2, r6, #1
	adds r6, #1
	mov r8, r6
	adds r3, r2, r4
_0807008A:
	lsls r0, r5, #1
	add r0, sb
	ldrh r2, [r3]
	adds r1, r2, #0
	ldrh r0, [r0]
	cmp r1, r0
	bne _080700AC
	cmp r1, #0
	beq _080700AC
	ldr r1, [sp]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #1
	add r1, ip
	strh r2, [r1]
_080700AC:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _0807008A
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bhi _080700CA
	lsls r0, r6, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08070080
_080700CA:
	movs r6, #0
	mov r2, sl
	ldrh r0, [r2]
	cmp r0, #0
	beq _08070154
_080700D4:
	movs r5, #0
	adds r3, r6, #1
	mov r8, r3
	ldr r0, [sp, #4]
	cmp r5, r0
	bhs _0807013C
	ldr r2, _0807011C
_080700E2:
	ldr r1, _0807012C
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _08070130
	lsls r0, r6, #1
	mov r3, sl
	adds r4, r0, r3
	ldrh r0, [r4]
	cmp r0, r1
	bne _08070130
	adds r1, r0, #0
	adds r0, r7, #0
	str r2, [sp, #8]
	bl GiveMoveToMon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp, #8]
	cmp r0, r2
	bne _0807013C
	ldrh r1, [r4]
	adds r0, r7, #0
	bl DeleteFirstMoveAndGiveMoveToMon
	b _0807013C
	.align 2, 0
_08070118: .4byte 0x020246CC
_0807011C: .4byte 0x0000FFFF
_08070120: .4byte 0x00000121
_08070124: .4byte 0x020246D4
_08070128: .4byte 0x020246F0
_0807012C: .4byte 0x02024668
_08070130:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [sp, #4]
	cmp r5, r0
	blo _080700E2
_0807013C:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bhi _08070154
	ldr r0, _08070164
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r0
	cmp r1, #0
	bne _080700D4
_08070154:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070164: .4byte 0x020246D4
	thumb_func_end BuildEggMoveset

	thumb_func_start RemoveEggFromDayCare
RemoveEggFromDayCare: @ 0x08070168
	adds r2, r0, #0
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r2, r1
	movs r1, #0
	str r1, [r0]
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r0, r2, r3
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end RemoveEggFromDayCare

	thumb_func_start RejectEggFromDayCare
RejectEggFromDayCare: @ 0x08070180
	push {lr}
	ldr r0, _08070194
	ldr r0, [r0]
	ldr r1, _08070198
	adds r0, r0, r1
	bl RemoveEggFromDayCare
	pop {r0}
	bx r0
	.align 2, 0
_08070194: .4byte 0x03005AEC
_08070198: .4byte 0x00003030
	thumb_func_end RejectEggFromDayCare

	thumb_func_start AlterEggSpeciesWithIncenseItem
AlterEggSpeciesWithIncenseItem: @ 0x0807019C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrh r1, [r4]
	movs r7, #0xb4
	lsls r7, r7, #1
	cmp r1, r7
	beq _080701B4
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bne _080701F6
_080701B4:
	adds r0, r5, #0
	movs r1, #0xc
	bl GetBoxMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x8c
	movs r1, #0xc
	bl GetBoxMonData
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r4]
	cmp r0, r7
	bne _080701E0
	cmp r6, #0xdd
	beq _080701E0
	cmp r2, #0xdd
	beq _080701E0
	movs r0, #0xca
	strh r0, [r4]
_080701E0:
	ldrh r1, [r4]
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bne _080701F6
	cmp r6, #0xdc
	beq _080701F6
	cmp r2, #0xdc
	beq _080701F6
	movs r0, #0xb7
	strh r0, [r4]
_080701F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AlterEggSpeciesWithIncenseItem

	thumb_func_start GiveVoltTackleIfLightBall
GiveVoltTackleIfLightBall: @ 0x080701FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #0xc
	bl GetBoxMonData
	adds r5, r0, #0
	adds r4, #0x8c
	adds r0, r4, #0
	movs r1, #0xc
	bl GetBoxMonData
	cmp r5, #0xca
	beq _0807021E
	cmp r0, #0xca
	bne _0807023A
_0807021E:
	movs r4, #0xac
	lsls r4, r4, #1
	adds r0, r6, #0
	adds r1, r4, #0
	bl GiveMoveToMon
	lsls r0, r0, #0x10
	ldr r1, _08070240
	cmp r0, r1
	bne _0807023A
	adds r0, r6, #0
	adds r1, r4, #0
	bl DeleteFirstMoveAndGiveMoveToMon
_0807023A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070240: .4byte 0xFFFF0000
	thumb_func_end GiveVoltTackleIfLightBall

	thumb_func_start DetermineEggSpeciesAndParentSlots
DetermineEggSpeciesAndParentSlots: @ 0x08070244
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	movs r4, #0
	movs r0, #1
	mov r8, r0
_08070256:
	movs r0, #0x8c
	muls r0, r4, r0
	adds r5, r7, r0
	adds r0, r5, #0
	movs r1, #0xb
	bl GetBoxMonData
	lsls r1, r4, #1
	add r1, sp
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x84
	bne _0807027E
	adds r0, r4, #0
	mov r1, r8
	eors r0, r1
	strb r0, [r6]
	strb r4, [r6, #1]
	b _08070296
_0807027E:
	adds r0, r5, #0
	bl GetBoxMonGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xfe
	bne _08070296
	strb r4, [r6]
	adds r0, r4, #0
	mov r1, r8
	eors r0, r1
	strb r0, [r6, #1]
_08070296:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bls _08070256
	ldrb r0, [r6]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	bl GetEggSpecies
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1d
	bne _080702C8
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080702C8
	movs r4, #0x20
_080702C8:
	ldr r0, _0807031C
	cmp r4, r0
	bne _080702E4
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080702E4
	movs r4, #0xc1
	lsls r4, r4, #1
_080702E4:
	ldrb r0, [r6, #1]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	cmp r0, #0x84
	bne _0807030C
	ldrb r1, [r6]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r7, r0
	bl GetBoxMonGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xfe
	beq _0807030C
	ldrb r1, [r6, #1]
	ldrb r0, [r6]
	strb r0, [r6, #1]
	strb r1, [r6]
_0807030C:
	adds r0, r4, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807031C: .4byte 0x00000183
	thumb_func_end DetermineEggSpeciesAndParentSlots

	thumb_func_start _GiveEggFromDaycare
_GiveEggFromDaycare: @ 0x08070320
	push {r4, r5, r6, lr}
	sub sp, #0x6c
	adds r6, r0, #0
	add r5, sp, #0x64
	adds r1, r5, #0
	bl DetermineEggSpeciesAndParentSlots
	add r4, sp, #0x68
	strh r0, [r4]
	adds r0, r4, #0
	adds r1, r6, #0
	bl AlterEggSpeciesWithIncenseItem
	ldrh r1, [r4]
	mov r0, sp
	adds r2, r6, #0
	bl SetInitialEggData
	mov r0, sp
	adds r1, r6, #0
	bl InheritIVs
	ldrb r0, [r5, #1]
	movs r2, #0x8c
	adds r1, r0, #0
	muls r1, r2, r1
	adds r1, r6, r1
	ldrb r0, [r5]
	muls r2, r0, r2
	adds r2, r6, r2
	mov r0, sp
	bl BuildEggMoveset
	ldrh r0, [r4]
	cmp r0, #0xac
	bne _08070370
	mov r0, sp
	adds r1, r6, #0
	bl GiveVoltTackleIfLightBall
_08070370:
	mov r2, sp
	adds r2, #0x6a
	movs r0, #1
	strb r0, [r2]
	mov r0, sp
	movs r1, #0x2d
	bl SetMonData
	ldr r0, _080703A8
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r1, sp
	movs r2, #0x64
	bl memcpy
	bl CompactPartySlots
	bl CalculatePlayerPartyCount
	adds r0, r6, #0
	bl RemoveEggFromDayCare
	add sp, #0x6c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080703A8: .4byte 0x02024190
	thumb_func_end _GiveEggFromDaycare

	thumb_func_start CreateEgg
CreateEgg: @ 0x080703AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r1, r5, #0
	movs r2, #5
	movs r3, #0x20
	bl CreateMon
	movs r0, #0x12
	add r0, sp
	mov r8, r0
	strb r4, [r0]
	movs r1, #4
	add r0, sp, #0x10
	strh r1, [r0]
	adds r0, r7, #0
	movs r1, #0x26
	add r2, sp, #0x10
	bl SetMonData
	ldr r2, _08070444
	adds r0, r7, #0
	movs r1, #2
	bl SetMonData
	lsls r2, r5, #3
	subs r2, r2, r5
	lsls r2, r2, #2
	ldr r0, _08070448
	adds r2, r2, r0
	adds r0, r7, #0
	movs r1, #0x20
	bl SetMonData
	adds r0, r7, #0
	movs r1, #0x24
	mov r2, r8
	bl SetMonData
	cmp r6, #0
	beq _08070428
	mov r2, sp
	adds r2, #0x13
	movs r0, #0xfd
	strb r0, [r2]
	adds r0, r7, #0
	movs r1, #0x23
	bl SetMonData
_08070428:
	add r2, sp, #0x14
	movs r0, #1
	strb r0, [r2]
	adds r0, r7, #0
	movs r1, #0x2d
	bl SetMonData
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070444: .4byte 0x085C8C62
_08070448: .4byte 0x082F0D65
	thumb_func_end CreateEgg

	thumb_func_start SetInitialEggData
SetInitialEggData: @ 0x0807044C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r0, #0x8c
	lsls r0, r0, #1
	adds r2, r2, r0
	ldr r1, [r2]
	movs r0, #1
	str r0, [sp]
	str r1, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #5
	movs r3, #0x20
	bl CreateMon
	movs r0, #0x12
	add r0, sp
	mov r8, r0
	strb r4, [r0]
	movs r1, #4
	add r0, sp, #0x10
	strh r1, [r0]
	adds r0, r6, #0
	movs r1, #0x26
	add r2, sp, #0x10
	bl SetMonData
	ldr r2, _080704C8
	adds r0, r6, #0
	movs r1, #2
	bl SetMonData
	lsls r2, r5, #3
	subs r2, r2, r5
	lsls r2, r2, #2
	ldr r0, _080704CC
	adds r2, r2, r0
	adds r0, r6, #0
	movs r1, #0x20
	bl SetMonData
	adds r0, r6, #0
	movs r1, #0x24
	mov r2, r8
	bl SetMonData
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080704C8: .4byte 0x085C8C62
_080704CC: .4byte 0x082F0D65
	thumb_func_end SetInitialEggData

	thumb_func_start GiveEggFromDaycare
GiveEggFromDaycare: @ 0x080704D0
	push {lr}
	ldr r0, _080704E4
	ldr r0, [r0]
	ldr r1, _080704E8
	adds r0, r0, r1
	bl _GiveEggFromDaycare
	pop {r0}
	bx r0
	.align 2, 0
_080704E4: .4byte 0x03005AEC
_080704E8: .4byte 0x00003030
	thumb_func_end GiveEggFromDaycare

	thumb_func_start _DoEggActions_CheckHatch
_DoEggActions_CheckHatch: @ 0x080704EC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	movs r5, #0
_080704F6:
	movs r0, #0x8c
	adds r4, r5, #0
	muls r4, r0, r4
	adds r0, r6, r4
	movs r1, #5
	bl GetBoxMonData
	cmp r0, #0
	beq _08070516
	adds r1, r6, #0
	adds r1, #0x88
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	adds r7, #1
_08070516:
	adds r5, #1
	cmp r5, #1
	bls _080704F6
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0807055C
	cmp r7, #2
	bne _0807055C
	subs r1, #4
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807055C
	adds r0, r6, #0
	bl GetDaycareCompatibilityScore
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _080705B4
	bl __udivsi3
	cmp r4, r0
	bls _0807055C
	bl TriggerPendingDaycareEgg
_0807055C:
	movs r0, #0x8e
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080705E8
	bl GetEggStepsToSubtract
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	ldr r0, _080705B8
	ldrb r0, [r0]
	cmp r5, r0
	bhs _080705E8
	ldr r4, _080705BC
_08070584:
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	beq _080705DC
	adds r0, r4, #0
	movs r1, #4
	bl GetMonData
	cmp r0, #0
	bne _080705DC
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	adds r1, r0, #0
	str r1, [sp]
	cmp r0, #0
	beq _080705D0
	cmp r0, r6
	blo _080705C0
	subs r0, r0, r6
	b _080705C2
	.align 2, 0
_080705B4: .4byte 0x0000FFFF
_080705B8: .4byte 0x0202418D
_080705BC: .4byte 0x02024190
_080705C0:
	subs r0, r1, #1
_080705C2:
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x20
	mov r2, sp
	bl SetMonData
	b _080705DC
_080705D0:
	ldr r0, _080705D8
	strh r5, [r0]
	movs r0, #1
	b _080705EA
	.align 2, 0
_080705D8: .4byte 0x02037280
_080705DC:
	adds r4, #0x64
	adds r5, #1
	ldr r0, _080705F4
	ldrb r0, [r0]
	cmp r5, r0
	blo _08070584
_080705E8:
	movs r0, #0
_080705EA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080705F4: .4byte 0x0202418D
	thumb_func_end _DoEggActions_CheckHatch

	thumb_func_start ShouldEggHatch
ShouldEggHatch: @ 0x080705F8
	push {lr}
	ldr r0, _08070610
	ldr r0, [r0]
	ldr r1, _08070614
	adds r0, r0, r1
	bl _DoEggActions_CheckHatch
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08070610: .4byte 0x03005AEC
_08070614: .4byte 0x00003030
	thumb_func_end ShouldEggHatch

	thumb_func_start IsEggPending
IsEggPending: @ 0x08070618
	push {lr}
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08070628
	movs r0, #1
_08070628:
	pop {r1}
	bx r1
	thumb_func_end IsEggPending

	thumb_func_start _GetDaycareMonNicknames
_GetDaycareMonNicknames: @ 0x0807062C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	beq _08070656
	ldr r1, _08070674
	adds r0, r4, #0
	bl GetMonNick
	adds r0, r4, #0
	movs r1, #7
	mov r2, sp
	bl GetBoxMonData
	ldr r0, _08070678
	mov r1, sp
	bl StringCopy
_08070656:
	adds r4, #0x8c
	adds r0, r4, #0
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	beq _0807066C
	ldr r1, _0807067C
	adds r0, r4, #0
	bl GetMonNick
_0807066C:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070674: .4byte 0x02021C40
_08070678: .4byte 0x02021C68
_0807067C: .4byte 0x02021C54
	thumb_func_end _GetDaycareMonNicknames

	thumb_func_start GetSelectedMonNickAndSpecies
GetSelectedMonNickAndSpecies: @ 0x08070680
	push {r4, r5, lr}
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _080706B4
	adds r0, r0, r4
	ldr r1, _080706B8
	bl GetMonNick
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0xb
	bl GetBoxMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080706B4: .4byte 0x02024190
_080706B8: .4byte 0x02021C40
	thumb_func_end GetSelectedMonNickAndSpecies

	thumb_func_start GetDaycareMonNicknames
GetDaycareMonNicknames: @ 0x080706BC
	push {lr}
	ldr r0, _080706D0
	ldr r0, [r0]
	ldr r1, _080706D4
	adds r0, r0, r1
	bl _GetDaycareMonNicknames
	pop {r0}
	bx r0
	.align 2, 0
_080706D0: .4byte 0x03005AEC
_080706D4: .4byte 0x00003030
	thumb_func_end GetDaycareMonNicknames

	thumb_func_start GetDaycareState
GetDaycareState: @ 0x080706D8
	push {r4, lr}
	ldr r4, _080706F0
	ldr r0, [r4]
	ldr r1, _080706F4
	adds r0, r0, r1
	bl IsEggPending
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080706F8
	movs r0, #1
	b _0807071A
	.align 2, 0
_080706F0: .4byte 0x03005AEC
_080706F4: .4byte 0x00003030
_080706F8:
	ldr r0, [r4]
	ldr r1, _08070710
	adds r0, r0, r1
	bl CountPokemonInDaycare
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08070714
	movs r0, #0
	b _0807071A
	.align 2, 0
_08070710: .4byte 0x00003030
_08070714:
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0807071A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetDaycareState

	thumb_func_start GetDaycarePokemonCount
GetDaycarePokemonCount: @ 0x08070720
	push {lr}
	ldr r0, _0807073C
	ldr r0, [r0]
	ldr r1, _08070740
	adds r0, r0, r1
	bl CountPokemonInDaycare
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08070738
	movs r0, #0
_08070738:
	pop {r1}
	bx r1
	.align 2, 0
_0807073C: .4byte 0x03005AEC
_08070740: .4byte 0x00003030
	thumb_func_end GetDaycarePokemonCount

	thumb_func_start EggGroupsOverlap
EggGroupsOverlap: @ 0x08070744
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r4, #0
	adds r1, r0, #0
_0807074C:
	movs r3, #0
	ldrh r0, [r1]
	adds r2, r5, #0
_08070752:
	ldrh r6, [r2]
	cmp r0, r6
	bne _0807075C
	movs r0, #1
	b _0807076E
_0807075C:
	adds r2, #2
	adds r3, #1
	cmp r3, #1
	ble _08070752
	adds r1, #2
	adds r4, #1
	cmp r4, #1
	ble _0807074C
	movs r0, #0
_0807076E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end EggGroupsOverlap

	thumb_func_start GetDaycareCompatibilityScore
GetDaycareCompatibilityScore: @ 0x08070774
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	str r0, [sp, #0x1c]
	movs r7, #0
	mov r0, sp
	adds r0, #8
	str r0, [sp, #0x20]
	add r1, sp, #0xc
	mov sb, r1
	mov r2, sp
	adds r2, #0x14
	str r2, [sp, #0x24]
	subs r0, #6
	ldr r1, _08070828
	mov sl, r1
	ldr r5, [sp, #0x20]
	mov r8, r0
	mov r6, sp
	str r2, [sp, #0x28]
	mov r2, sb
	str r2, [sp, #0x2c]
_080707A6:
	movs r0, #0x8c
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r0, [sp, #0x1c]
	adds r4, r0, r4
	adds r0, r4, #0
	movs r1, #0xb
	bl GetBoxMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl GetBoxMonData
	ldr r1, [sp, #0x2c]
	stm r1!, {r0}
	str r1, [sp, #0x2c]
	adds r0, r4, #0
	movs r1, #0
	bl GetBoxMonData
	adds r1, r0, #0
	ldrh r0, [r5]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x28]
	stm r2!, {r0}
	str r2, [sp, #0x28]
	ldrh r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0, #0x14]
	strh r0, [r6]
	ldrh r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0, #0x15]
	mov r1, r8
	strh r0, [r1]
	adds r5, #2
	movs r2, #4
	add r8, r2
	adds r6, #4
	adds r7, #1
	cmp r7, #1
	bls _080707A6
	mov r0, sp
	ldrh r1, [r0]
	cmp r1, #0xf
	beq _08070824
	ldrh r0, [r0, #4]
	cmp r0, #0xf
	beq _08070824
	cmp r1, #0xd
	bne _0807082C
	cmp r0, #0xd
	bne _08070830
_08070824:
	movs r0, #0
	b _08070884
	.align 2, 0
_08070828: .4byte 0x082F0D54
_0807082C:
	cmp r0, #0xd
	bne _0807083C
_08070830:
	ldr r1, [sp, #0xc]
	mov r2, sb
	ldr r0, [r2, #4]
	cmp r1, r0
	beq _0807087E
	b _08070882
_0807083C:
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x24]
	ldr r1, [r2, #4]
	cmp r0, r1
	beq _08070824
	cmp r0, #0xff
	beq _08070824
	cmp r1, #0xff
	beq _08070824
	add r1, sp, #4
	mov r0, sp
	bl EggGroupsOverlap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08070824
	ldr r0, [sp, #0x20]
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	cmp r0, r1
	bne _08070874
	ldr r1, [sp, #0xc]
	mov r2, sb
	ldr r0, [r2, #4]
	cmp r1, r0
	beq _08070882
	movs r0, #0x46
	b _08070884
_08070874:
	ldr r1, [sp, #0xc]
	mov r2, sb
	ldr r0, [r2, #4]
	cmp r1, r0
	bne _08070882
_0807087E:
	movs r0, #0x14
	b _08070884
_08070882:
	movs r0, #0x32
_08070884:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetDaycareCompatibilityScore

	thumb_func_start GetDaycareCompatibilityScoreFromSave
GetDaycareCompatibilityScoreFromSave: @ 0x08070894
	push {lr}
	ldr r0, _080708AC
	ldr r0, [r0]
	ldr r1, _080708B0
	adds r0, r0, r1
	bl GetDaycareCompatibilityScore
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080708AC: .4byte 0x03005AEC
_080708B0: .4byte 0x00003030
	thumb_func_end GetDaycareCompatibilityScoreFromSave

	thumb_func_start SetDaycareCompatibilityString
SetDaycareCompatibilityString: @ 0x080708B4
	push {lr}
	bl GetDaycareCompatibilityScoreFromSave
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	movs r1, #0
	cmp r0, #0
	bne _080708C8
	movs r1, #3
_080708C8:
	cmp r0, #0x14
	bne _080708CE
	movs r1, #2
_080708CE:
	cmp r0, #0x32
	bne _080708D4
	movs r1, #1
_080708D4:
	cmp r2, #0x46
	bne _080708DA
	movs r1, #0
_080708DA:
	ldr r0, _080708EC
	ldr r2, _080708F0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080708EC: .4byte 0x02021C7C
_080708F0: .4byte 0x082FC0E8
	thumb_func_end SetDaycareCompatibilityString

	thumb_func_start NameHasGenderSymbol
NameHasGenderSymbol: @ 0x080708F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	mov r2, sp
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #1]
	strb r0, [r2]
	movs r3, #0
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08070938
_08070910:
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, #0xb5
	bne _0807091E
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_0807091E:
	ldrb r0, [r1]
	cmp r0, #0xb6
	bne _0807092A
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
_0807092A:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08070910
_08070938:
	cmp r5, #0
	bne _0807094C
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807094C
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _08070960
_0807094C:
	cmp r5, #0xfe
	bne _08070964
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _08070964
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070964
_08070960:
	movs r0, #1
	b _08070966
_08070964:
	movs r0, #0
_08070966:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end NameHasGenderSymbol

	thumb_func_start AppendGenderSymbol
AppendGenderSymbol: @ 0x08070970
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0
	bne _08070990
	movs r1, #0
	bl NameHasGenderSymbol
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080709AC
	ldr r1, _0807098C
	b _080709AE
	.align 2, 0
_0807098C: .4byte 0x08300A95
_08070990:
	cmp r1, #0xfe
	bne _080709AC
	adds r0, r4, #0
	movs r1, #0xfe
	bl NameHasGenderSymbol
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080709AC
	ldr r1, _080709A8
	b _080709AE
	.align 2, 0
_080709A8: .4byte 0x08300A97
_080709AC:
	ldr r1, _080709BC
_080709AE:
	adds r0, r4, #0
	bl StringAppend
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080709BC: .4byte 0x08300A99
	thumb_func_end AppendGenderSymbol

	thumb_func_start AppendMonGenderSymbol
AppendMonGenderSymbol: @ 0x080709C0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetBoxMonGender
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl AppendGenderSymbol
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AppendMonGenderSymbol

	thumb_func_start GetDaycareLevelMenuText
GetDaycareLevelMenuText: @ 0x080709DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	adds r7, r1, #0
	movs r0, #0xff
	strb r0, [r7]
	movs r6, #0
	add r0, sp, #0x14
	mov sb, r0
_080709F4:
	movs r0, #0x8c
	adds r4, r6, #0
	muls r4, r0, r4
	add r4, r8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	mov r1, sp
	adds r5, r1, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetMonNick
	adds r0, r5, #0
	adds r1, r4, #0
	bl AppendMonGenderSymbol
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _080709F4
	adds r0, r7, #0
	mov r1, sp
	bl StringCopy
	ldr r4, _08070A58
	adds r0, r7, #0
	adds r1, r4, #0
	bl StringAppend
	adds r0, r7, #0
	mov r1, sb
	bl StringAppend
	adds r0, r7, #0
	adds r1, r4, #0
	bl StringAppend
	ldr r1, _08070A5C
	adds r0, r7, #0
	bl StringAppend
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070A58: .4byte 0x082FC0F8
_08070A5C: .4byte 0x082FC0FA
	thumb_func_end GetDaycareLevelMenuText

	thumb_func_start GetDaycareLevelMenuLevelText
GetDaycareLevelMenuLevelText: @ 0x08070A60
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r4, r1, #0
	movs r0, #0xff
	strb r0, [r4]
	movs r5, #0
_08070A6E:
	adds r0, r4, #0
	ldr r1, _08070ABC
	bl StringAppend
	movs r0, #0x8c
	adds r2, r5, #0
	muls r2, r0, r2
	adds r0, r6, r2
	adds r1, r6, #0
	adds r1, #0x88
	adds r1, r1, r2
	ldr r1, [r1]
	bl GetLevelAfterDaycareSteps
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, sp
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r4, #0
	mov r1, sp
	bl StringAppend
	adds r0, r4, #0
	ldr r1, _08070AC0
	bl StringAppend
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08070A6E
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070ABC: .4byte 0x082FC0FE
_08070AC0: .4byte 0x082FC0F8
	thumb_func_end GetDaycareLevelMenuLevelText

	thumb_func_start DaycareAddTextPrinter
DaycareAddTextPrinter: @ 0x08070AC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	str r1, [sp]
	mov r1, sp
	movs r5, #0
	strb r0, [r1, #4]
	mov r0, sp
	movs r6, #1
	movs r4, #1
	strb r4, [r0, #5]
	strb r2, [r0, #6]
	strb r3, [r0, #7]
	strb r2, [r0, #8]
	strb r3, [r0, #9]
	mov r3, sp
	ldrb r1, [r3, #0xc]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #0xc]
	ldr r3, _08070B34
	ldrb r1, [r3]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	mov r0, sp
	strb r5, [r0, #0xa]
	strb r4, [r0, #0xb]
	mov r3, sp
	ldrb r1, [r3, #0xc]
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r3, #0xc]
	mov r1, sp
	ldrb r0, [r1, #0xd]
	ands r2, r0
	orrs r2, r6
	strb r2, [r1, #0xd]
	ands r2, r4
	movs r0, #0x30
	orrs r2, r0
	strb r2, [r1, #0xd]
	mov r0, sp
	movs r1, #0xff
	movs r2, #0
	bl AddTextPrinter
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070B34: .4byte 0x030030B4
	thumb_func_end DaycareAddTextPrinter

	thumb_func_start DaycarePrintMonNick
DaycarePrintMonNick: @ 0x08070B38
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x8c
	muls r0, r2, r0
	adds r5, r5, r0
	adds r0, r5, #0
	mov r1, sp
	bl GetMonNick
	mov r0, sp
	adds r1, r5, #0
	bl AppendMonGenderSymbol
	adds r6, #2
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0xc
	adds r3, r6, #0
	bl DaycareAddTextPrinter
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DaycarePrintMonNick

	thumb_func_start DaycarePrintMonLvl
DaycarePrintMonLvl: @ 0x08070B74
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _08070BD4
	mov r0, sp
	bl strcpy
	movs r0, #0x8c
	adds r1, r6, #0
	muls r1, r0, r1
	adds r0, r4, r1
	adds r4, #0x88
	adds r4, r4, r1
	ldr r1, [r4]
	bl GetLevelAfterDaycareSteps
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	add r4, sp, #0xc
	adds r0, r4, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	adds r1, r4, #0
	bl StringAppend
	adds r0, r5, #0
	mov r1, sp
	movs r2, #0x59
	mov r3, r8
	bl DaycareAddTextPrinter
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070BD4: .4byte 0x082FC0FE
	thumb_func_end DaycarePrintMonLvl

	thumb_func_start DaycarePrintMonInfo
DaycarePrintMonInfo: @ 0x08070BD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	cmp r6, #1
	bhi _08070C10
	ldr r0, _08070C1C
	mov r8, r0
	ldr r0, [r0]
	ldr r4, _08070C20
	adds r0, r0, r4
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl DaycarePrintMonNick
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl DaycarePrintMonLvl
_08070C10:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070C1C: .4byte 0x03005AEC
_08070C20: .4byte 0x00003030
	thumb_func_end DaycarePrintMonInfo

	thumb_func_start Task_HandleDaycareLevelMenuInput
Task_HandleDaycareLevelMenuInput: @ 0x08070C24
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _08070C54
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrb r0, [r4, #8]
	bl ListMenu_ProcessInput
	adds r1, r0, #0
	ldr r0, _08070C58
	ldrh r2, [r0, #0x2e]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08070CA4
	cmp r1, #1
	bls _08070C5C
	cmp r1, #5
	beq _08070C68
	b _08070C6E
	.align 2, 0
_08070C54: .4byte 0x03005B60
_08070C58: .4byte 0x03002360
_08070C5C:
	ldr r0, _08070C64
	strh r1, [r0]
	b _08070C6E
	.align 2, 0
_08070C64: .4byte 0x02037290
_08070C68:
	ldr r1, _08070C9C
	movs r0, #2
	strh r0, [r1]
_08070C6E:
	ldr r0, _08070CA0
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrb r0, [r4, #8]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r4, #0xa]
	movs r1, #1
	bl DrawStdWindowFrame
	ldrb r0, [r4, #0xa]
	bl RemoveWindow
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	b _08070CD4
	.align 2, 0
_08070C9C: .4byte 0x02037290
_08070CA0: .4byte 0x03005B60
_08070CA4:
	movs r1, #2
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08070CD4
	ldr r0, _08070CDC
	strh r1, [r0]
	ldrb r0, [r4, #8]
	movs r1, #0
	movs r2, #0
	bl DestroyListMenuTask
	ldrb r0, [r4, #0xa]
	movs r1, #1
	bl DrawStdWindowFrame
	ldrb r0, [r4, #0xa]
	bl RemoveWindow
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_08070CD4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070CDC: .4byte 0x02037290
	thumb_func_end Task_HandleDaycareLevelMenuInput

	thumb_func_start ShowDaycareLevelMenu
ShowDaycareLevelMenu: @ 0x08070CE0
	push {r4, r5, lr}
	sub sp, #0x18
	ldr r0, _08070D40
	bl AddWindow
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl ClearStdWindowAndFrame
	mov r1, sp
	ldr r0, _08070D44
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	mov r0, sp
	strb r4, [r0, #0x10]
	movs r1, #0
	movs r2, #0
	bl ListMenuInit
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _08070D48
	movs r1, #3
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08070D4C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r5, [r1, #8]
	strh r4, [r1, #0xa]
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070D40: .4byte 0x082FC04C
_08070D44: .4byte 0x082FC06C
_08070D48: .4byte 0x08070C25
_08070D4C: .4byte 0x03005B60
	thumb_func_end ShowDaycareLevelMenu

	thumb_func_start ChooseSendDaycareMon
ChooseSendDaycareMon: @ 0x08070D50
	push {lr}
	bl sub_081B8FC8
	ldr r1, _08070D60
	ldr r0, _08070D64
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08070D60: .4byte 0x03002360
_08070D64: .4byte 0x08085A31
	thumb_func_end ChooseSendDaycareMon

