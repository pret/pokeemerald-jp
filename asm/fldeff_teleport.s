.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetUpFieldMove_Teleport
SetUpFieldMove_Teleport: @ 0x0817C768
	push {lr}
	ldr r0, _0817C780
	ldrb r0, [r0, #0x17]
	bl Overworld_MapTypeAllowsTeleportAndFly
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0817C784
	movs r0, #0
	b _0817C792
	.align 2, 0
_0817C780: .4byte 0x02036FB8
_0817C784:
	ldr r1, _0817C798
	ldr r0, _0817C79C
	str r0, [r1]
	ldr r1, _0817C7A0
	ldr r0, _0817C7A4
	str r0, [r1]
	movs r0, #1
_0817C792:
	pop {r1}
	bx r1
	.align 2, 0
_0817C798: .4byte 0x03005B10
_0817C79C: .4byte 0x081B53D9
_0817C7A0: .4byte 0x0203CBB8
_0817C7A4: .4byte 0x0817C7A9
	thumb_func_end SetUpFieldMove_Teleport

	thumb_func_start FieldCallback_Teleport
FieldCallback_Teleport: @ 0x0817C7A8
	push {lr}
	bl Overworld_ResetStateAfterTeleport
	movs r0, #0x3f
	bl FieldEffectStart
	bl GetCursorSelectionMonId
	ldr r1, _0817C7C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0817C7C4: .4byte 0x020388A8
	thumb_func_end FieldCallback_Teleport

	thumb_func_start FldEff_UseTeleport
FldEff_UseTeleport: @ 0x0817C7C8
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817C7F0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _0817C7F4
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #1
	bl SetPlayerAvatarTransitionFlags
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0817C7F0: .4byte 0x03005B60
_0817C7F4: .4byte 0x0817C7F9
	thumb_func_end FldEff_UseTeleport

	thumb_func_start StartTeleportFieldEffect
StartTeleportFieldEffect: @ 0x0817C7F8
	push {lr}
	movs r0, #0x3f
	bl FieldEffectActiveListRemove
	bl sub_080B7720
	pop {r0}
	bx r0
	thumb_func_end StartTeleportFieldEffect

