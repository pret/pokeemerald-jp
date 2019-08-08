.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AccessHallOfFamePC
AccessHallOfFamePC: @ 0x08137C98
	push {lr}
	ldr r0, _08137CA8
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08137CA8: .4byte 0x08173F79
	thumb_func_end AccessHallOfFamePC

	thumb_func_start ReturnFromHallOfFamePC
ReturnFromHallOfFamePC: @ 0x08137CAC
	push {lr}
	ldr r0, _08137CC0
	bl SetMainCallback2
	ldr r1, _08137CC4
	ldr r0, _08137CC8
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08137CC0: .4byte 0x08085A31
_08137CC4: .4byte 0x03005B0C
_08137CC8: .4byte 0x08137CCD
	thumb_func_end ReturnFromHallOfFamePC

	thumb_func_start ReshowPCMenuAfterHallOfFamePC
ReshowPCMenuAfterHallOfFamePC: @ 0x08137CCC
	push {lr}
	sub sp, #4
	bl ScriptContext2_Enable
	bl Overworld_PlaySpecialMapMusic
	bl sub_080E1850
	bl ScriptMenu_DisplayPCStartupPrompt
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _08137D00
	movs r1, #0xa
	bl CreateTask
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08137D00: .4byte 0x08137D05
	thumb_func_end ReshowPCMenuAfterHallOfFamePC

	thumb_func_start Task_WaitForPaletteFade
Task_WaitForPaletteFade: @ 0x08137D04
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08137D20
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08137D1C
	adds r0, r2, #0
	bl DestroyTask
_08137D1C:
	pop {r0}
	bx r0
	.align 2, 0
_08137D20: .4byte 0x02037C74
	thumb_func_end Task_WaitForPaletteFade

