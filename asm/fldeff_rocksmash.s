.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CheckObjectGraphicsInFrontOfPlayer
CheckObjectGraphicsInFrontOfPlayer: @ 0x08135478
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r4, _081354B8
	adds r1, r4, #2
	adds r0, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	bl PlayerGetZCoord
	strb r0, [r4, #4]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldrb r2, [r4, #4]
	bl GetEventObjectIdByXYZ
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081354BC
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r2
	ldrb r0, [r2, #5]
	cmp r0, r5
	bne _081354C4
	ldr r1, _081354C0
	ldrb r0, [r2, #8]
	strh r0, [r1]
	movs r0, #1
	b _081354C6
	.align 2, 0
_081354B8: .4byte 0x0203A80C
_081354BC: .4byte 0x02036FF0
_081354C0: .4byte 0x02037292
_081354C4:
	movs r0, #0
_081354C6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CheckObjectGraphicsInFrontOfPlayer

	thumb_func_start oei_task_add
oei_task_add: @ 0x081354CC
	push {lr}
	ldr r0, _081354E8
	adds r1, r0, #2
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _081354EC
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081354E8: .4byte 0x0203A80C
_081354EC: .4byte 0x081354F1
	thumb_func_end oei_task_add

	thumb_func_start task08_080C9820
task08_080C9820: @ 0x081354F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	bl ScriptContext2_Enable
	ldr r1, _08135544
	movs r0, #1
	strb r0, [r1, #6]
	ldrb r1, [r1, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08135548
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08135526
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08135572
_08135526:
	ldr r0, _0813554C
	ldrb r0, [r0, #0x17]
	cmp r0, #5
	bne _08135558
	movs r0, #0x3b
	bl FieldEffectStart
	ldr r0, _08135550
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08135554
	b _08135570
	.align 2, 0
_08135544: .4byte 0x02037230
_08135548: .4byte 0x02036FF0
_0813554C: .4byte 0x02036FB8
_08135550: .4byte 0x03005B60
_08135554: .4byte 0x081355CD
_08135558:
	bl sub_0808BA78
	adds r0, r4, #0
	movs r1, #0x39
	bl EventObjectSetHeldMovement
	ldr r0, _08135578
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0813557C
_08135570:
	str r0, [r1]
_08135572:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135578: .4byte 0x03005B60
_0813557C: .4byte 0x08135581
	thumb_func_end task08_080C9820

	thumb_func_start sub_08135580
sub_08135580: @ 0x08135580
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081355BC
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081355C0
	adds r0, r0, r1
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _081355B4
	movs r0, #0x3b
	bl FieldEffectStart
	ldr r0, _081355C4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081355C8
	str r0, [r1]
_081355B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081355BC: .4byte 0x02037230
_081355C0: .4byte 0x02036FF0
_081355C4: .4byte 0x03005B60
_081355C8: .4byte 0x081355CD
	thumb_func_end sub_08135580

	thumb_func_start sub_081355CC
sub_081355CC: @ 0x081355CC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #6
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08135650
	bl GetPlayerFacingDirection
	ldr r6, _08135658
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r6, #4]
	cmp r0, #1
	bne _081355F2
	str r4, [r6, #8]
_081355F2:
	ldr r1, [r6, #4]
	cmp r1, #2
	bne _081355FC
	movs r0, #1
	str r0, [r6, #8]
_081355FC:
	cmp r1, #3
	bne _08135604
	movs r0, #2
	str r0, [r6, #8]
_08135604:
	cmp r1, #4
	bne _0813560C
	movs r0, #3
	str r0, [r6, #8]
_0813560C:
	ldr r5, _0813565C
	ldrb r0, [r5, #5]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _08135660
	adds r4, r4, r0
	bl GetPlayerAvatarGraphicsIdByCurrentState
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetGraphicsId
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08135664
	adds r0, r0, r1
	ldrb r1, [r6, #8]
	bl StartSpriteAnim
	movs r0, #6
	bl FieldEffectActiveListRemove
	ldr r1, _08135668
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _0813566C
	str r1, [r0]
_08135650:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135658: .4byte 0x020388A8
_0813565C: .4byte 0x02037230
_08135660: .4byte 0x02036FF0
_08135664: .4byte 0x020205AC
_08135668: .4byte 0x03005B60
_0813566C: .4byte 0x08135671
	thumb_func_end sub_081355CC

	thumb_func_start sub_08135670
sub_08135670: @ 0x08135670
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _081356A0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	lsls r1, r1, #0x10
	ldrh r0, [r0, #0x1a]
	orrs r1, r0
	bl _call_via_r1
	ldr r1, _081356A4
	movs r0, #0
	strb r0, [r1, #6]
	adds r0, r4, #0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081356A0: .4byte 0x03005B60
_081356A4: .4byte 0x02037230
	thumb_func_end sub_08135670

	thumb_func_start SetUpFieldMove_RockSmash
SetUpFieldMove_RockSmash: @ 0x081356A8
	push {r4, lr}
	bl ShouldDoBrailleRegirockEffect
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081356E0
	ldr r4, _081356CC
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldr r1, _081356D0
	ldr r0, _081356D4
	str r0, [r1]
	ldr r1, _081356D8
	ldr r0, _081356DC
	b _081356FC
	.align 2, 0
_081356CC: .4byte 0x02037290
_081356D0: .4byte 0x03005B10
_081356D4: .4byte 0x081B53D9
_081356D8: .4byte 0x0203CBB8
_081356DC: .4byte 0x081796ED
_081356E0:
	movs r0, #0x56
	bl CheckObjectGraphicsInFrontOfPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081356F2
	movs r0, #0
	b _08135700
_081356F2:
	ldr r1, _08135708
	ldr r0, _0813570C
	str r0, [r1]
	ldr r1, _08135710
	ldr r0, _08135714
_081356FC:
	str r0, [r1]
	movs r0, #1
_08135700:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08135708: .4byte 0x03005B10
_0813570C: .4byte 0x081B53D9
_08135710: .4byte 0x0203CBB8
_08135714: .4byte 0x08135719
	thumb_func_end SetUpFieldMove_RockSmash

	thumb_func_start sub_08135718
sub_08135718: @ 0x08135718
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _08135730
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	ldr r0, _08135734
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_08135730: .4byte 0x020388A8
_08135734: .4byte 0x082566C6
	thumb_func_end sub_08135718

	thumb_func_start FldEff_UseRockSmash
FldEff_UseRockSmash: @ 0x08135738
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08135760
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _08135764
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0x13
	bl IncrementGameStat
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08135760: .4byte 0x03005B60
_08135764: .4byte 0x08135769
	thumb_func_end FldEff_UseRockSmash

	thumb_func_start sub_08135768
sub_08135768: @ 0x08135768
	push {lr}
	movs r0, #0x83
	bl PlaySE
	movs r0, #0x25
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08135768

	thumb_func_start sub_08135780
sub_08135780: @ 0x08135780
	push {lr}
	bl CanUseEscapeRopeOnCurrMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08135792
	movs r0, #0
	b _081357A0
_08135792:
	ldr r1, _081357A4
	ldr r0, _081357A8
	str r0, [r1]
	ldr r1, _081357AC
	ldr r0, _081357B0
	str r0, [r1]
	movs r0, #1
_081357A0:
	pop {r1}
	bx r1
	.align 2, 0
_081357A4: .4byte 0x03005B10
_081357A8: .4byte 0x081B53D9
_081357AC: .4byte 0x0203CBB8
_081357B0: .4byte 0x081357B5
	thumb_func_end sub_08135780

	thumb_func_start sub_081357B4
sub_081357B4: @ 0x081357B4
	push {lr}
	bl Overworld_ResetStateAfterFly
	movs r0, #0x26
	bl FieldEffectStart
	bl GetCursorSelectionMonId
	ldr r1, _081357D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_081357D0: .4byte 0x020388A8
	thumb_func_end sub_081357B4

	thumb_func_start sub_081357D4
sub_081357D4: @ 0x081357D4
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08135808
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _0813580C
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	bl ShouldDoBrailleDigEffect
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08135800
	movs r0, #1
	bl SetPlayerAvatarTransitionFlags
_08135800:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08135808: .4byte 0x03005B60
_0813580C: .4byte 0x08135811
	thumb_func_end sub_081357D4

	thumb_func_start sub_08135810
sub_08135810: @ 0x08135810
	push {r4, lr}
	movs r0, #0x26
	bl FieldEffectActiveListRemove
	bl ShouldDoBrailleDigEffect
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0813582A
	bl DoBrailleDigEffect
	b _08135842
_0813582A:
	ldr r0, _08135848
	movs r1, #8
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0813584C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
_08135842:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135848: .4byte 0x080FEB0D
_0813584C: .4byte 0x03005B60
	thumb_func_end sub_08135810

