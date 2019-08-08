.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetUpFieldMove_Strength
SetUpFieldMove_Strength: @ 0x08145E84
	push {r4, lr}
	movs r0, #0x57
	bl CheckObjectGraphicsInFrontOfPlayer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08145E98
	movs r0, #0
	b _08145EB2
_08145E98:
	ldr r4, _08145EB8
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldr r1, _08145EBC
	ldr r0, _08145EC0
	str r0, [r1]
	ldr r1, _08145EC4
	ldr r0, _08145EC8
	str r0, [r1]
	movs r0, #1
_08145EB2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08145EB8: .4byte 0x02037290
_08145EBC: .4byte 0x03005B10
_08145EC0: .4byte 0x081B53D9
_08145EC4: .4byte 0x0203CBB8
_08145EC8: .4byte 0x08145ECD
	thumb_func_end SetUpFieldMove_Strength

	thumb_func_start FldEff_UseStrength
FldEff_UseStrength: @ 0x08145ECC
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _08145EE4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	ldr r0, _08145EE8
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_08145EE4: .4byte 0x020388A8
_08145EE8: .4byte 0x08256797
	thumb_func_end FldEff_UseStrength

	thumb_func_start sub_08145EEC
sub_08145EEC: @ 0x08145EEC
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08145F20
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _08145F24
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	ldr r0, _08145F28
	ldr r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08145F2C
	adds r0, r0, r1
	ldr r1, _08145F30
	bl GetMonNickname
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08145F20: .4byte 0x03005B60
_08145F24: .4byte 0x08145F35
_08145F28: .4byte 0x020388A8
_08145F2C: .4byte 0x02024190
_08145F30: .4byte 0x02021C40
	thumb_func_end sub_08145EEC

	thumb_func_start sub_08145F34
sub_08145F34: @ 0x08145F34
	push {lr}
	movs r0, #0x28
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_08145F34

