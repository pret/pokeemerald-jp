.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetSafariZoneFlag
GetSafariZoneFlag: @ 0x080FC910
	push {lr}
	ldr r0, _080FC920
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080FC920: .4byte 0x0000088C
	thumb_func_end GetSafariZoneFlag

	thumb_func_start ResetSafariZoneFlag
ResetSafariZoneFlag: @ 0x080FC924
	push {lr}
	ldr r0, _080FC930
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080FC930: .4byte 0x0000088C
	thumb_func_end ResetSafariZoneFlag

	thumb_func_start SafariZoneRetirePrompt
SafariZoneRetirePrompt: @ 0x080FC934
	push {lr}
	ldr r0, _080FC940
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_080FC940: .4byte 0x0000088C
	thumb_func_end SafariZoneRetirePrompt

	thumb_func_start EnterSafariMode
EnterSafariMode: @ 0x080FC944
	push {lr}
	movs r0, #0x11
	bl IncrementGameStat
	bl ResetSafariZoneFlag
	bl ClearAllPokeblockFeeders
	ldr r1, _080FC974
	movs r0, #0x1e
	strb r0, [r1]
	ldr r1, _080FC978
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080FC97C
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080FC980
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080FC974: .4byte 0x02039D18
_080FC978: .4byte 0x02039D1A
_080FC97C: .4byte 0x02039D1C
_080FC980: .4byte 0x02039D1D
	thumb_func_end EnterSafariMode

	thumb_func_start ExitSafariMode
ExitSafariMode: @ 0x080FC984
	push {lr}
	ldr r0, _080FC9AC
	ldrb r0, [r0]
	ldr r1, _080FC9B0
	ldrb r1, [r1]
	bl sub_080EEF6C
	bl SafariZoneRetirePrompt
	bl ClearAllPokeblockFeeders
	ldr r1, _080FC9B4
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080FC9B8
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080FC9AC: .4byte 0x02039D1C
_080FC9B0: .4byte 0x02039D1D
_080FC9B4: .4byte 0x02039D18
_080FC9B8: .4byte 0x02039D1A
	thumb_func_end ExitSafariMode

	thumb_func_start SafariZoneTakeStep
SafariZoneTakeStep: @ 0x080FC9BC
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, #0
	beq _080FC9D8
	bl DecrementFeederStepCounters
	ldr r1, _080FC9DC
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080FC9E0
_080FC9D8:
	movs r0, #0
	b _080FC9E8
	.align 2, 0
_080FC9DC: .4byte 0x02039D1A
_080FC9E0:
	ldr r0, _080FC9EC
	bl ScriptContext1_SetupScript
	movs r0, #1
_080FC9E8:
	pop {r1}
	bx r1
	.align 2, 0
_080FC9EC: .4byte 0x082623E8
	thumb_func_end SafariZoneTakeStep

	thumb_func_start SetSafariZoneFlag
SetSafariZoneFlag: @ 0x080FC9F0
	push {lr}
	ldr r0, _080FC9FC
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080FC9FC: .4byte 0x082623CD
	thumb_func_end SetSafariZoneFlag

	thumb_func_start CB2_EndSafariBattle
CB2_EndSafariBattle: @ 0x080FCA00
	push {lr}
	ldr r1, _080FCA30
	ldr r0, _080FCA34
	ldrb r0, [r0, #0x1f]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	ldr r2, _080FCA38
	ldrb r0, [r2]
	cmp r0, #7
	bne _080FCA1E
	ldr r1, _080FCA3C
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080FCA1E:
	ldr r0, _080FCA40
	ldrb r0, [r0]
	cmp r0, #0
	beq _080FCA48
	ldr r0, _080FCA44
	bl SetMainCallback2
	b _080FCA8C
	.align 2, 0
_080FCA30: .4byte 0x02039D1D
_080FCA34: .4byte 0x03005A70
_080FCA38: .4byte 0x02023FDE
_080FCA3C: .4byte 0x02039D1C
_080FCA40: .4byte 0x02039D18
_080FCA44: .4byte 0x08085A31
_080FCA48:
	ldrb r0, [r2]
	cmp r0, #8
	bne _080FCA78
	ldr r0, _080FCA68
	bl ScriptContext2_RunNewScript
	bl WarpIntoMap
	ldr r1, _080FCA6C
	ldr r0, _080FCA70
	str r0, [r1]
	ldr r0, _080FCA74
	bl SetMainCallback2
	b _080FCA8C
	.align 2, 0
_080FCA68: .4byte 0x082623AA
_080FCA6C: .4byte 0x03005B0C
_080FCA70: .4byte 0x080AEFED
_080FCA74: .4byte 0x08085935
_080FCA78:
	cmp r0, #7
	bne _080FCA8C
	ldr r0, _080FCA90
	bl ScriptContext1_SetupScript
	bl ScriptContext1_Stop
	ldr r0, _080FCA94
	bl SetMainCallback2
_080FCA8C:
	pop {r0}
	bx r0
	.align 2, 0
_080FCA90: .4byte 0x082623F9
_080FCA94: .4byte 0x08085B35
	thumb_func_end CB2_EndSafariBattle

	thumb_func_start ClearPokeblockFeeder
ClearPokeblockFeeder: @ 0x080FCA98
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	ldr r1, _080FCAB0
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080FCAB0: .4byte 0x02039D20
	thumb_func_end ClearPokeblockFeeder

	thumb_func_start ClearAllPokeblockFeeders
ClearAllPokeblockFeeders: @ 0x080FCAB4
	push {lr}
	ldr r0, _080FCAC4
	movs r1, #0
	movs r2, #0xa0
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080FCAC4: .4byte 0x02039D20
	thumb_func_end ClearAllPokeblockFeeders

	thumb_func_start GetPokeblockFeederInFront
GetPokeblockFeederInFront: @ 0x080FCAC8
	push {r4, r5, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r5, #0
_080FCADA:
	ldr r0, _080FCB20
	ldr r2, [r0]
	ldr r1, _080FCB24
	lsls r0, r5, #4
	adds r3, r0, r1
	movs r1, #5
	ldrsb r1, [r2, r1]
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne _080FCB34
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r3, r2]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _080FCB34
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080FCB34
	ldr r0, _080FCB28
	strh r5, [r0]
	ldr r1, _080FCB2C
	ldrb r0, [r3, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080FCB30
	bl StringCopy
	b _080FCB46
	.align 2, 0
_080FCB20: .4byte 0x03005AEC
_080FCB24: .4byte 0x02039D20
_080FCB28: .4byte 0x02037290
_080FCB2C: .4byte 0x08592078
_080FCB30: .4byte 0x02021C40
_080FCB34:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #9
	bls _080FCADA
	ldr r1, _080FCB50
	ldr r2, _080FCB54
	adds r0, r2, #0
	strh r0, [r1]
_080FCB46:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FCB50: .4byte 0x02037290
_080FCB54: .4byte 0x0000FFFF
	thumb_func_end GetPokeblockFeederInFront

	thumb_func_start GetPokeblockFeederWithinRange
GetPokeblockFeederWithinRange: @ 0x080FCB58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	movs r5, #0
	adds r6, r4, #0
	ldr r0, _080FCBC8
	ldr r7, [r0]
	mov r4, sp
	ldr r0, _080FCBCC
	mov ip, r0
_080FCB76:
	lsls r0, r5, #4
	mov r1, ip
	adds r3, r0, r1
	movs r1, #5
	ldrsb r1, [r7, r1]
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne _080FCBD4
	ldrh r0, [r4]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r4]
	adds r2, r6, #0
	ldrh r0, [r2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080FCBA6
	rsbs r0, r0, #0
	strh r0, [r4]
_080FCBA6:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _080FCBB2
	rsbs r0, r0, #0
	strh r0, [r2]
_080FCBB2:
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r2, #0
	ldrsh r1, [r6, r2]
	adds r0, r0, r1
	cmp r0, #5
	bgt _080FCBD4
	ldr r0, _080FCBD0
	strh r5, [r0]
	b _080FCBE6
	.align 2, 0
_080FCBC8: .4byte 0x03005AEC
_080FCBCC: .4byte 0x02039D20
_080FCBD0: .4byte 0x02037290
_080FCBD4:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #9
	bls _080FCB76
	ldr r1, _080FCBF0
	ldr r2, _080FCBF4
	adds r0, r2, #0
	strh r0, [r1]
_080FCBE6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCBF0: .4byte 0x02037290
_080FCBF4: .4byte 0x0000FFFF
	thumb_func_end GetPokeblockFeederWithinRange

	thumb_func_start SafariZoneGetPokeblockInFront
SafariZoneGetPokeblockInFront: @ 0x080FCBF8
	push {lr}
	bl GetPokeblockFeederInFront
	ldr r2, _080FCC14
	ldrh r1, [r2]
	ldr r0, _080FCC18
	cmp r1, r0
	beq _080FCC20
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r1, _080FCC1C
	adds r0, r0, r1
	b _080FCC22
	.align 2, 0
_080FCC14: .4byte 0x02037290
_080FCC18: .4byte 0x0000FFFF
_080FCC1C: .4byte 0x02039D28
_080FCC20:
	movs r0, #0
_080FCC22:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SafariZoneGetPokeblockInFront

	thumb_func_start SafariZoneGetActivePokeblock
SafariZoneGetActivePokeblock: @ 0x080FCC28
	push {lr}
	bl GetPokeblockFeederWithinRange
	ldr r2, _080FCC44
	ldrh r1, [r2]
	ldr r0, _080FCC48
	cmp r1, r0
	beq _080FCC50
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r1, _080FCC4C
	adds r0, r0, r1
	b _080FCC52
	.align 2, 0
_080FCC44: .4byte 0x02037290
_080FCC48: .4byte 0x0000FFFF
_080FCC4C: .4byte 0x02039D28
_080FCC50:
	movs r0, #0
_080FCC52:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SafariZoneGetActivePokeblock

	thumb_func_start SafariZoneActivatePokeblockFeeder
SafariZoneActivatePokeblockFeeder: @ 0x080FCC58
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r1, #0
	ldr r2, _080FCCCC
	mov r6, sp
	adds r6, #2
	movs r0, #8
	adds r0, r0, r2
	mov sb, r0
	ldr r7, _080FCCD0
_080FCC78:
	lsls r5, r1, #4
	adds r4, r5, r2
	movs r0, #4
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080FCCD8
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _080FCCD8
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _080FCCD8
	mov r0, sp
	adds r1, r6, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, [r7]
	ldrb r0, [r0, #5]
	strb r0, [r4, #4]
	mov r0, sb
	adds r2, r5, r0
	ldr r0, [r7]
	mov r3, r8
	lsls r1, r3, #3
	ldr r3, _080FCCD4
	adds r0, r0, r3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	movs r0, #0x64
	strb r0, [r4, #5]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r6]
	strh r0, [r4, #2]
	b _080FCCE2
	.align 2, 0
_080FCCCC: .4byte 0x02039D20
_080FCCD0: .4byte 0x03005AEC
_080FCCD4: .4byte 0x00000848
_080FCCD8:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	bls _080FCC78
_080FCCE2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SafariZoneActivatePokeblockFeeder

	thumb_func_start DecrementFeederStepCounters
DecrementFeederStepCounters: @ 0x080FCCF0
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _080FCD20
_080FCCF6:
	lsls r0, r4, #4
	adds r1, r0, r5
	ldrb r0, [r1, #5]
	cmp r0, #0
	beq _080FCD10
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FCD10
	adds r0, r4, #0
	bl ClearPokeblockFeeder
_080FCD10:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _080FCCF6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FCD20: .4byte 0x02039D20
	thumb_func_end DecrementFeederStepCounters

	thumb_func_start GetInFrontFeederPokeblockAndSteps
GetInFrontFeederPokeblockAndSteps: @ 0x080FCD24
	push {lr}
	bl GetPokeblockFeederInFront
	ldr r3, _080FCD4C
	ldrh r1, [r3]
	ldr r0, _080FCD50
	cmp r1, r0
	beq _080FCD5C
	ldr r0, _080FCD54
	ldr r2, _080FCD58
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrb r1, [r1, #5]
	movs r2, #2
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r0, #1
	b _080FCD5E
	.align 2, 0
_080FCD4C: .4byte 0x02037290
_080FCD50: .4byte 0x0000FFFF
_080FCD54: .4byte 0x02021C54
_080FCD58: .4byte 0x02039D20
_080FCD5C:
	movs r0, #0
_080FCD5E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetInFrontFeederPokeblockAndSteps

