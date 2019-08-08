.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetUpFieldMove_SweetScent
SetUpFieldMove_SweetScent: @ 0x08159E2C
	ldr r1, _08159E3C
	ldr r0, _08159E40
	str r0, [r1]
	ldr r1, _08159E44
	ldr r0, _08159E48
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_08159E3C: .4byte 0x03005B10
_08159E40: .4byte 0x081B53D9
_08159E44: .4byte 0x0203CBB8
_08159E48: .4byte 0x08159E4D
	thumb_func_end SetUpFieldMove_SweetScent

	thumb_func_start FieldCallback_SweetScent
FieldCallback_SweetScent: @ 0x08159E4C
	push {lr}
	movs r0, #0x33
	bl FieldEffectStart
	bl GetCursorSelectionMonId
	ldr r1, _08159E64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08159E64: .4byte 0x020388A8
	thumb_func_end FieldCallback_SweetScent

	thumb_func_start FldEff_SweetScent
FldEff_SweetScent: @ 0x08159E68
	push {lr}
	bl sub_080ABCCC
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08159E90
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _08159E94
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08159E90: .4byte 0x03005B60
_08159E94: .4byte 0x08159E99
	thumb_func_end FldEff_SweetScent

	thumb_func_start StartSweetScentFieldEffect
StartSweetScentFieldEffect: @ 0x08159E98
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #0xec
	bl PlaySE
	ldr r5, _08159F10
	ldr r1, _08159F14
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	ldr r0, _08159F18
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	bl GetPlayerAvatarObjectId
	ldr r2, _08159F1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	mvns r0, r0
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #4
	movs r2, #0
	movs r3, #8
	bl BeginNormalPaletteFade
	ldr r0, _08159F20
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08159F24
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	movs r0, #0x33
	bl FieldEffectActiveListRemove
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08159F10: .4byte 0x020373B4
_08159F14: .4byte 0x02037C88
_08159F18: .4byte 0x020377B4
_08159F1C: .4byte 0x020205AC
_08159F20: .4byte 0x08159F29
_08159F24: .4byte 0x03005B60
	thumb_func_end StartSweetScentFieldEffect

	thumb_func_start TrySweetScentEncounter
TrySweetScentEncounter: @ 0x08159F28
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08159F78
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _08159FC4
	bl ClearMirageTowerPulseBlendEffect
	movs r0, #0x40
	movs r1, #8
	movs r2, #0x1f
	bl BlendPalettes
	ldr r0, _08159F7C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r4, r1, r0
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #0x40
	bne _08159FC0
	strh r6, [r4, #8]
	bl SweetScentWildEncounter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08159F80
	adds r0, r5, #0
	bl DestroyTask
	b _08159FC4
	.align 2, 0
_08159F78: .4byte 0x02037C74
_08159F7C: .4byte 0x03005B60
_08159F80:
	ldr r0, _08159FB8
	str r0, [r4]
	bl GetPlayerAvatarObjectId
	ldr r2, _08159FBC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	mvns r0, r0
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #4
	movs r2, #8
	movs r3, #0
	bl BeginNormalPaletteFade
	bl TryStartMirageTowerPulseBlendEffect
	b _08159FC4
	.align 2, 0
_08159FB8: .4byte 0x08159FCD
_08159FBC: .4byte 0x020205AC
_08159FC0:
	adds r0, r1, #1
	strh r0, [r4, #8]
_08159FC4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end TrySweetScentEncounter

	thumb_func_start FailSweetScentEncounter
FailSweetScentEncounter: @ 0x08159FCC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0815A000
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08159FFA
	ldr r0, _0815A004
	ldr r1, _0815A008
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl sub_080ABCE0
	ldr r0, _0815A00C
	bl ScriptContext1_SetupScript
	adds r0, r4, #0
	bl DestroyTask
_08159FFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815A000: .4byte 0x02037C74
_0815A004: .4byte 0x02037C88
_0815A008: .4byte 0x020373B4
_0815A00C: .4byte 0x08256A14
	thumb_func_end FailSweetScentEncounter

