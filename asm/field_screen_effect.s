.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start palette_bg_faded_fill_white
palette_bg_faded_fill_white: @ 0x080AE8F8
	push {lr}
	sub sp, #4
	ldr r0, _080AE910
	str r0, [sp]
	ldr r1, _080AE914
	ldr r2, _080AE918
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080AE910: .4byte 0x7FFF7FFF
_080AE914: .4byte 0x020377B4
_080AE918: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_white

	thumb_func_start palette_bg_faded_fill_black
palette_bg_faded_fill_black: @ 0x080AE91C
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080AE934
	ldr r2, _080AE938
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080AE934: .4byte 0x020377B4
_080AE938: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_black

	thumb_func_start pal_fill_for_maplights
pal_fill_for_maplights: @ 0x080AE93C
	push {r4, lr}
	bl GetLastUsedWarpMapType
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetCurrentMapType
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl GetMapPairFadeFromType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE966
	cmp r0, #1
	beq _080AE974
	b _080AE980
_080AE966:
	bl palette_bg_faded_fill_black
	movs r0, #0
	movs r1, #0
	bl FadeScreen
	b _080AE980
_080AE974:
	bl palette_bg_faded_fill_white
	movs r0, #2
	movs r1, #0
	bl FadeScreen
_080AE980:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pal_fill_for_maplights

	thumb_func_start sub_080AE988
sub_080AE988: @ 0x080AE988
	push {lr}
	bl palette_bg_faded_fill_white
	movs r0, #2
	movs r1, #8
	bl FadeScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080AE988

	thumb_func_start pal_fill_black
pal_fill_black: @ 0x080AE99C
	push {lr}
	bl palette_bg_faded_fill_black
	movs r0, #0
	movs r1, #0
	bl FadeScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pal_fill_black

	thumb_func_start WarpFadeScreen
WarpFadeScreen: @ 0x080AE9B0
	push {r4, lr}
	bl GetCurrentMapType
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetDestinationWarpMapHeader
	ldrb r1, [r0, #0x17]
	adds r0, r4, #0
	bl GetMapPairFadeToType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE9D6
	cmp r0, #1
	beq _080AE9E0
	b _080AE9E8
_080AE9D6:
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	b _080AE9E8
_080AE9E0:
	movs r0, #3
	movs r1, #0
	bl FadeScreen
_080AE9E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WarpFadeScreen

	thumb_func_start sub_080AE9F0
sub_080AE9F0: @ 0x080AE9F0
	push {lr}
	lsls r0, r0, #0x18
	movs r1, #0
	cmp r0, #0
	bne _080AE9FC
	movs r1, #1
_080AE9FC:
	adds r0, r1, #0
	bl sub_0808BA0C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080AE9F0

	thumb_func_start task0A_nop_for_a_while
task0A_nop_for_a_while: @ 0x080AEA08
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl WaitForWeatherFadeIn
	cmp r0, #1
	bne _080AEA1C
	adds r0, r4, #0
	bl DestroyTask
_080AEA1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end task0A_nop_for_a_while

	thumb_func_start sub_080AEA24
sub_080AEA24: @ 0x080AEA24
	push {lr}
	bl ScriptContext2_Enable
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_black
	ldr r0, _080AEA40
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AEA40: .4byte 0x080AEA09
	thumb_func_end sub_080AEA24

	thumb_func_start task0A_asap_script_env_2_enable_and_set_ctx_running
task0A_asap_script_env_2_enable_and_set_ctx_running: @ 0x080AEA44
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl WaitForWeatherFadeIn
	cmp r0, #1
	bne _080AEA5C
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_080AEA5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end task0A_asap_script_env_2_enable_and_set_ctx_running

	thumb_func_start FieldCallback_ReturnToEventScript2
FieldCallback_ReturnToEventScript2: @ 0x080AEA64
	push {lr}
	bl ScriptContext2_Enable
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_black
	ldr r0, _080AEA80
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AEA80: .4byte 0x080AEA45
	thumb_func_end FieldCallback_ReturnToEventScript2

	thumb_func_start sub_080AEA84
sub_080AEA84: @ 0x080AEA84
	push {lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _080AEA9C
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AEA9C: .4byte 0x080AEA45
	thumb_func_end sub_080AEA84

	thumb_func_start task_mpl_807DD60
task_mpl_807DD60: @ 0x080AEAA0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r2, _080AEAC4
	adds r4, r0, r2
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AEADA
	cmp r0, #1
	bgt _080AEAC8
	cmp r0, #0
	beq _080AEACE
	b _080AEB0A
	.align 2, 0
_080AEAC4: .4byte 0x03005B60
_080AEAC8:
	cmp r0, #2
	beq _080AEAF8
	b _080AEB0A
_080AEACE:
	bl sub_080B27FC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xa]
	b _080AEAF0
_080AEADA:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	cmp r0, #1
	beq _080AEB0A
	bl pal_fill_for_maplights
_080AEAF0:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AEB0A
_080AEAF8:
	bl WaitForWeatherFadeIn
	cmp r0, #1
	bne _080AEB0A
	bl ScriptContext2_Disable
	adds r0, r5, #0
	bl DestroyTask
_080AEB0A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807DD60

	thumb_func_start sub_080AEB10
sub_080AEB10: @ 0x080AEB10
	push {lr}
	bl ScriptContext2_Enable
	bl Overworld_PlaySpecialMapMusic
	bl palette_bg_faded_fill_black
	ldr r0, _080AEB2C
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AEB2C: .4byte 0x080AEAA1
	thumb_func_end sub_080AEB10

	thumb_func_start sub_080AEB30
sub_080AEB30: @ 0x080AEB30
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AEB54
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AEB64
	cmp r0, #1
	bgt _080AEB58
	cmp r0, #0
	beq _080AEB5E
	b _080AEBAA
	.align 2, 0
_080AEB54: .4byte 0x03005B60
_080AEB58:
	cmp r0, #2
	beq _080AEB94
	b _080AEBAA
_080AEB5E:
	bl sub_0800A8D4
	b _080AEB8C
_080AEB64:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AEB88
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	movs r1, #0xe1
	lsls r1, r1, #0x13
	cmp r0, r1
	ble _080AEBAA
	movs r0, #0xc0
	lsls r0, r0, #7
	bl sub_08010C60
	b _080AEBAA
_080AEB88:
	bl pal_fill_for_maplights
_080AEB8C:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AEBAA
_080AEB94:
	bl WaitForWeatherFadeIn
	cmp r0, #1
	bne _080AEBAA
	bl sub_08009AB0
	bl ScriptContext2_Disable
	adds r0, r5, #0
	bl DestroyTask
_080AEBAA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080AEB30

	thumb_func_start sub_080AEBB0
sub_080AEBB0: @ 0x080AEBB0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AEBD4
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AEBE4
	cmp r0, #1
	bgt _080AEBD8
	cmp r0, #0
	beq _080AEBDE
	b _080AEC08
	.align 2, 0
_080AEBD4: .4byte 0x03005B60
_080AEBD8:
	cmp r0, #2
	beq _080AEBF6
	b _080AEC08
_080AEBDE:
	bl sub_0800A8D4
	b _080AEBEE
_080AEBE4:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AEC08
_080AEBEE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AEC08
_080AEBF6:
	bl sub_08009AB0
	bl ResetAllMultiplayerState
	bl ScriptContext2_Disable
	adds r0, r5, #0
	bl DestroyTask
_080AEC08:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080AEBB0

	thumb_func_start sub_080AEC10
sub_080AEC10: @ 0x080AEC10
	push {lr}
	bl ScriptContext2_Enable
	bl Overworld_PlaySpecialMapMusic
	bl palette_bg_faded_fill_black
	ldr r0, _080AEC2C
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AEC2C: .4byte 0x080AEB31
	thumb_func_end sub_080AEC10

	thumb_func_start sub_080AEC30
sub_080AEC30: @ 0x080AEC30
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080AEC68
	ldr r1, _080AEC64
	b _080AEC7A
	.align 2, 0
_080AEC64: .4byte 0x080AED35
_080AEC68:
	adds r0, r4, #0
	bl MetatileBehavior_IsNonAnimDoor
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080AEC8C
	cmp r0, #1
	bne _080AEC7A
	ldr r1, _080AEC90
_080AEC7A:
	adds r0, r1, #0
	movs r1, #0xa
	bl CreateTask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEC8C: .4byte 0x080AEF0D
_080AEC90: .4byte 0x080AEE4D
	thumb_func_end sub_080AEC30

	thumb_func_start mapldr_default
mapldr_default: @ 0x080AEC94
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	bl sub_080AEC30
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end mapldr_default

	thumb_func_start sub_080AECAC
sub_080AECAC: @ 0x080AECAC
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl sub_080AE988
	bl sub_080AEC30
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080AECAC

	thumb_func_start sub_080AECC4
sub_080AECC4: @ 0x080AECC4
	push {lr}
	bl sub_081D5ED4
	cmp r0, #0
	bne _080AECD2
	bl Overworld_PlaySpecialMapMusic
_080AECD2:
	bl pal_fill_black
	bl sub_080AEC30
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080AECC4

	thumb_func_start sub_080AECE4
sub_080AECE4: @ 0x080AECE4
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	movs r0, #0x2e
	bl PlaySE
	ldr r0, _080AED04
	movs r1, #0xa
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_080AED04: .4byte 0x080AFA5D
	thumb_func_end sub_080AECE4

	thumb_func_start sub_080AED08
sub_080AED08: @ 0x080AED08
	push {lr}
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_for_maplights
	movs r0, #0x2e
	bl PlaySE
	ldr r0, _080AED30
	movs r1, #0xa
	bl CreateTask
	bl ScriptContext2_Enable
	movs r0, #0xe
	bl sub_08084EA8
	pop {r0}
	bx r0
	.align 2, 0
_080AED30: .4byte 0x080AEF0D
	thumb_func_end sub_080AED08

	thumb_func_start sub_080AED34
sub_080AED34: @ 0x080AED34
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080AED60
	adds r5, r0, r1
	adds r6, r5, #0
	adds r6, #0xc
	adds r7, r5, #0
	adds r7, #0xe
	movs r2, #8
	ldrsh r0, [r5, r2]
	adds r2, r1, #0
	cmp r0, #4
	bhi _080AEE46
	lsls r0, r0, #2
	ldr r1, _080AED64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AED60: .4byte 0x03005B60
_080AED64: .4byte 0x080AED68
_080AED68: @ jump table
	.4byte _080AED7C @ case 0
	.4byte _080AEDA0 @ case 1
	.4byte _080AEDD8 @ case 2
	.4byte _080AEE1C @ case 3
	.4byte _080AEE3C @ case 4
_080AED7C:
	movs r0, #0
	bl sub_080AE9F0
	bl FreezeEventObjects
	adds r0, r6, #0
	adds r1, r7, #0
	bl PlayerGetDestCoords
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r2, #0
	ldrsh r1, [r7, r2]
	bl FieldSetDoorOpened
	movs r0, #1
	strh r0, [r5, #8]
	b _080AEE46
_080AEDA0:
	bl WaitForWeatherFadeIn
	cmp r0, #0
	beq _080AEE46
	movs r0, #1
	bl sub_080AE9F0
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080AEDD4
	adds r0, r0, r1
	movs r1, #8
	bl EventObjectSetHeldMovement
	movs r0, #2
	strh r0, [r5, #8]
	b _080AEE46
	.align 2, 0
_080AEDD4: .4byte 0x02036FF0
_080AEDD8:
	bl walkrun_is_standing_still
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AEE46
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r2, #0
	ldrsh r1, [r7, r2]
	bl FieldAnimateDoorClose
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080AEE18
	adds r0, r0, r1
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	movs r0, #3
	strh r0, [r5, #8]
	b _080AEE46
	.align 2, 0
_080AEE18: .4byte 0x02036FF0
_080AEE1C:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _080AEE32
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	cmp r0, #1
	beq _080AEE46
_080AEE32:
	bl UnfreezeEventObjects
	movs r0, #4
	strh r0, [r5, #8]
	b _080AEE46
_080AEE3C:
	bl ScriptContext2_Disable
	adds r0, r4, #0
	bl DestroyTask
_080AEE46:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080AED34

	thumb_func_start task_map_chg_seq_0807E20C
task_map_chg_seq_0807E20C: @ 0x080AEE4C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080AEE78
	adds r5, r0, r1
	adds r6, r5, #0
	adds r6, #0xc
	adds r7, r5, #0
	adds r7, #0xe
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _080AEE9E
	cmp r0, #1
	bgt _080AEE7C
	cmp r0, #0
	beq _080AEE86
	b _080AEF06
	.align 2, 0
_080AEE78: .4byte 0x03005B60
_080AEE7C:
	cmp r0, #2
	beq _080AEEE8
	cmp r0, #3
	beq _080AEEFC
	b _080AEF06
_080AEE86:
	movs r0, #0
	bl sub_080AE9F0
	bl FreezeEventObjects
	adds r0, r6, #0
	adds r1, r7, #0
	bl PlayerGetDestCoords
	movs r0, #1
	strh r0, [r5, #8]
	b _080AEF06
_080AEE9E:
	bl WaitForWeatherFadeIn
	cmp r0, #0
	beq _080AEF06
	movs r0, #1
	bl sub_080AE9F0
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080AEEE4
	adds r4, r4, r0
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CF8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	movs r0, #2
	strh r0, [r5, #8]
	b _080AEF06
	.align 2, 0
_080AEEE4: .4byte 0x02036FF0
_080AEEE8:
	bl walkrun_is_standing_still
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AEF06
	bl UnfreezeEventObjects
	movs r0, #3
	strh r0, [r5, #8]
	b _080AEF06
_080AEEFC:
	bl ScriptContext2_Disable
	adds r0, r4, #0
	bl DestroyTask
_080AEF06:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E20C

	thumb_func_start task_map_chg_seq_0807E2CC
task_map_chg_seq_0807E2CC: @ 0x080AEF0C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080AEF2C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080AEF30
	cmp r0, #1
	beq _080AEF40
	b _080AEF56
	.align 2, 0
_080AEF2C: .4byte 0x03005B60
_080AEF30:
	bl FreezeEventObjects
	bl ScriptContext2_Enable
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AEF56
_080AEF40:
	bl WaitForWeatherFadeIn
	cmp r0, #0
	beq _080AEF56
	bl UnfreezeEventObjects
	bl ScriptContext2_Disable
	adds r0, r5, #0
	bl DestroyTask
_080AEF56:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E2CC

	thumb_func_start sub_080AEF5C
sub_080AEF5C: @ 0x080AEF5C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl WaitForWeatherFadeIn
	cmp r0, #1
	bne _080AEF78
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _080AEF80
	movs r1, #0x50
	bl CreateTask
_080AEF78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF80: .4byte 0x0809F30D
	thumb_func_end sub_080AEF5C

	thumb_func_start sub_080AEF84
sub_080AEF84: @ 0x080AEF84
	push {lr}
	bl pal_fill_black
	ldr r0, _080AEF9C
	movs r1, #0x50
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_080AEF9C: .4byte 0x080AEF5D
	thumb_func_end sub_080AEF84

	thumb_func_start sub_080AEFA0
sub_080AEFA0: @ 0x080AEFA0
	push {lr}
	bl sub_0809F2F0
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end sub_080AEFA0

	thumb_func_start task_mpl_807E3C8
task_mpl_807E3C8: @ 0x080AEFAC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl WaitForWeatherFadeIn
	cmp r0, #1
	bne _080AEFC8
	bl ScriptContext2_Disable
	adds r0, r4, #0
	bl DestroyTask
	bl ScriptUnfreezeEventObjects
_080AEFC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end task_mpl_807E3C8

	thumb_func_start sub_080AEFD0
sub_080AEFD0: @ 0x080AEFD0
	push {lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _080AEFE8
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AEFE8: .4byte 0x080AEFAD
	thumb_func_end sub_080AEFD0

	thumb_func_start sub_080AEFEC
sub_080AEFEC: @ 0x080AEFEC
	push {lr}
	bl ScriptContext2_Enable
	bl Overworld_PlaySpecialMapMusic
	bl pal_fill_black
	ldr r0, _080AF008
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AF008: .4byte 0x080AEFAD
	thumb_func_end sub_080AEFEC

	thumb_func_start PaletteFadeActive
PaletteFadeActive: @ 0x080AF00C
	ldr r0, _080AF014
	ldrb r0, [r0, #7]
	lsrs r0, r0, #7
	bx lr
	.align 2, 0
_080AF014: .4byte 0x02037C74
	thumb_func_end PaletteFadeActive

	thumb_func_start WaitForWeatherFadeIn
WaitForWeatherFadeIn: @ 0x080AF018
	push {lr}
	bl IsWeatherNotFadingIn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080AF02A
	movs r0, #0
	b _080AF02C
_080AF02A:
	movs r0, #1
_080AF02C:
	pop {r1}
	bx r1
	thumb_func_end WaitForWeatherFadeIn

	thumb_func_start DoWarp
DoWarp: @ 0x080AF030
	push {lr}
	bl ScriptContext2_Enable
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	bl PlayRainStoppingSoundEffect
	movs r0, #9
	bl PlaySE
	ldr r0, _080AF05C
	ldr r1, _080AF060
	str r1, [r0]
	ldr r0, _080AF064
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AF05C: .4byte 0x03005B0C
_080AF060: .4byte 0x080AEC95
_080AF064: .4byte 0x080AF309
	thumb_func_end DoWarp

	thumb_func_start DoDiveWarp
DoDiveWarp: @ 0x080AF068
	push {lr}
	bl ScriptContext2_Enable
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	bl PlayRainStoppingSoundEffect
	ldr r0, _080AF08C
	ldr r1, _080AF090
	str r1, [r0]
	ldr r0, _080AF094
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AF08C: .4byte 0x03005B0C
_080AF090: .4byte 0x080AEC95
_080AF094: .4byte 0x080AF309
	thumb_func_end DoDiveWarp

	thumb_func_start sub_080AF098
sub_080AF098: @ 0x080AF098
	push {lr}
	bl ScriptContext2_Enable
	bl TryFadeOutOldMapMusic
	movs r0, #3
	movs r1, #8
	bl FadeScreen
	bl PlayRainStoppingSoundEffect
	ldr r0, _080AF0C0
	ldr r1, _080AF0C4
	str r1, [r0]
	ldr r0, _080AF0C8
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AF0C0: .4byte 0x03005B0C
_080AF0C4: .4byte 0x080AECAD
_080AF0C8: .4byte 0x080AF309
	thumb_func_end sub_080AF098

	thumb_func_start DoDoorWarp
DoDoorWarp: @ 0x080AF0CC
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _080AF0E4
	ldr r1, _080AF0E8
	str r1, [r0]
	ldr r0, _080AF0EC
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AF0E4: .4byte 0x03005B0C
_080AF0E8: .4byte 0x080AEC95
_080AF0EC: .4byte 0x080AF385
	thumb_func_end DoDoorWarp

	thumb_func_start DoFallWarp
DoFallWarp: @ 0x080AF0F0
	push {lr}
	bl DoDiveWarp
	ldr r1, _080AF100
	ldr r0, _080AF104
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080AF100: .4byte 0x03005B0C
_080AF104: .4byte 0x080B62C1
	thumb_func_end DoFallWarp

	thumb_func_start sub_080AF108
sub_080AF108: @ 0x080AF108
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl ScriptContext2_Enable
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_080B65A4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080AF108

	thumb_func_start sub_080AF124
sub_080AF124: @ 0x080AF124
	push {lr}
	bl ScriptContext2_Enable
	movs r0, #0xa
	bl sub_080B6D30
	pop {r0}
	bx r0
	thumb_func_end sub_080AF124

	thumb_func_start sub_080AF134
sub_080AF134: @ 0x080AF134
	push {lr}
	bl ScriptContext2_Enable
	movs r0, #0xa
	bl sub_080B71CC
	pop {r0}
	bx r0
	thumb_func_end sub_080AF134

	thumb_func_start sub_080AF144
sub_080AF144: @ 0x080AF144
	push {lr}
	bl ScriptContext2_Enable
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	movs r0, #0x2d
	bl PlaySE
	ldr r0, _080AF16C
	movs r1, #0xa
	bl CreateTask
	ldr r1, _080AF170
	ldr r0, _080AF174
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080AF16C: .4byte 0x080AF309
_080AF170: .4byte 0x03005B0C
_080AF174: .4byte 0x080AECE5
	thumb_func_end sub_080AF144

	thumb_func_start sub_080AF178
sub_080AF178: @ 0x080AF178
	push {lr}
	movs r0, #1
	bl sub_08084EA8
	bl ScriptContext2_Enable
	bl SaveEventObjects
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	movs r0, #0x2d
	bl PlaySE
	ldr r0, _080AF1A8
	movs r1, #0xa
	bl CreateTask
	ldr r1, _080AF1AC
	ldr r0, _080AF1B0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080AF1A8: .4byte 0x080AF309
_080AF1AC: .4byte 0x03005B0C
_080AF1B0: .4byte 0x080AED09
	thumb_func_end sub_080AF178

	thumb_func_start sub_080AF1B4
sub_080AF1B4: @ 0x080AF1B4
	push {lr}
	bl ScriptContext2_Enable
	bl WarpFadeScreen
	ldr r0, _080AF1D0
	movs r1, #0xa
	bl CreateTask
	ldr r1, _080AF1D4
	ldr r0, _080AF1D8
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080AF1D0: .4byte 0x080AF309
_080AF1D4: .4byte 0x03005B0C
_080AF1D8: .4byte 0x080FBFD9
	thumb_func_end sub_080AF1B4

	thumb_func_start sub_080AF1DC
sub_080AF1DC: @ 0x080AF1DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AF200
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AF210
	cmp r0, #1
	bgt _080AF204
	cmp r0, #0
	beq _080AF20A
	b _080AF23A
	.align 2, 0
_080AF200: .4byte 0x03005B60
_080AF204:
	cmp r0, #2
	beq _080AF22A
	b _080AF23A
_080AF20A:
	bl ScriptContext2_Enable
	b _080AF222
_080AF210:
	bl PaletteFadeActive
	cmp r0, #0
	bne _080AF23A
	bl BGMusicStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF23A
_080AF222:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AF23A
_080AF22A:
	bl WarpIntoMap
	ldr r0, _080AF240
	bl SetMainCallback2
	adds r0, r5, #0
	bl DestroyTask
_080AF23A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF240: .4byte 0x080859DD
	thumb_func_end sub_080AF1DC

	thumb_func_start sub_080AF244
sub_080AF244: @ 0x080AF244
	push {lr}
	bl ScriptContext2_Enable
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	movs r0, #9
	bl PlaySE
	ldr r0, _080AF264
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AF264: .4byte 0x080AF1DD
	thumb_func_end sub_080AF244

	thumb_func_start Task_ReturnToWorldFromLinkRoom
Task_ReturnToWorldFromLinkRoom: @ 0x080AF268
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AF28C
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AF2AE
	cmp r0, #1
	bgt _080AF290
	cmp r0, #0
	beq _080AF296
	b _080AF2E4
	.align 2, 0
_080AF28C: .4byte 0x03005B68
_080AF290:
	cmp r0, #2
	beq _080AF2CC
	b _080AF2E4
_080AF296:
	bl ClearLinkCallback_2
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	bl TryFadeOutOldMapMusic
	movs r0, #9
	bl PlaySE
	b _080AF2C4
_080AF2AE:
	bl PaletteFadeActive
	cmp r0, #0
	bne _080AF2E4
	bl BGMusicStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF2E4
	bl sub_0800A7F8
_080AF2C4:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080AF2E4
_080AF2CC:
	ldr r0, _080AF2EC
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AF2E4
	bl WarpIntoMap
	ldr r0, _080AF2F0
	bl SetMainCallback2
	adds r0, r5, #0
	bl DestroyTask
_080AF2E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF2EC: .4byte 0x030031C4
_080AF2F0: .4byte 0x08085935
	thumb_func_end Task_ReturnToWorldFromLinkRoom

	thumb_func_start sub_080AF2F4
sub_080AF2F4: @ 0x080AF2F4
	push {lr}
	ldr r0, _080AF304
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AF304: .4byte 0x080AF269
	thumb_func_end sub_080AF2F4

	thumb_func_start sub_080AF308
sub_080AF308: @ 0x080AF308
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _080AF32C
	adds r4, r0, r1
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _080AF340
	cmp r5, #1
	bgt _080AF330
	cmp r5, #0
	beq _080AF336
	b _080AF378
	.align 2, 0
_080AF32C: .4byte 0x03005B60
_080AF330:
	cmp r5, #2
	beq _080AF368
	b _080AF378
_080AF336:
	bl FreezeEventObjects
	bl ScriptContext2_Enable
	b _080AF360
_080AF340:
	bl PaletteFadeActive
	cmp r0, #0
	bne _080AF378
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080AF356
	bl ClearMirageTowerPulseBlendEffect
	strh r5, [r4, #0xa]
_080AF356:
	bl BGMusicStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF378
_080AF360:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AF378
_080AF368:
	bl WarpIntoMap
	ldr r0, _080AF380
	bl SetMainCallback2
	adds r0, r6, #0
	bl DestroyTask
_080AF378:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF380: .4byte 0x08085935
	thumb_func_end sub_080AF308

	thumb_func_start sub_080AF384
sub_080AF384: @ 0x080AF384
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080AF3B4
	adds r5, r1, r0
	adds r4, r5, #0
	adds r4, #0xc
	adds r6, r5, #0
	adds r6, #0xe
	movs r2, #8
	ldrsh r1, [r5, r2]
	adds r2, r0, #0
	cmp r1, #4
	bls _080AF3A8
	b _080AF4E4
_080AF3A8:
	lsls r0, r1, #2
	ldr r1, _080AF3B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AF3B4: .4byte 0x03005B60
_080AF3B8: .4byte 0x080AF3BC
_080AF3BC: @ jump table
	.4byte _080AF3D0 @ case 0
	.4byte _080AF40C @ case 1
	.4byte _080AF468 @ case 2
	.4byte _080AF4B4 @ case 3
	.4byte _080AF4D0 @ case 4
_080AF3D0:
	bl FreezeEventObjects
	adds r0, r4, #0
	adds r1, r6, #0
	bl PlayerGetDestCoords
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #0
	ldrsh r1, [r6, r2]
	subs r1, #1
	bl GetDoorSoundEffect
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl PlaySE
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #0
	ldrsh r1, [r6, r2]
	subs r1, #1
	bl FieldAnimateDoorOpen
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	movs r0, #1
	strh r0, [r5, #8]
	b _080AF4E4
_080AF40C:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _080AF422
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	cmp r0, #1
	beq _080AF4E4
_080AF422:
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080AF464
	adds r0, r0, r4
	bl EventObjectClearHeldMovementIfActive
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #9
	bl EventObjectSetHeldMovement
	movs r0, #2
	strh r0, [r5, #8]
	b _080AF4E4
	.align 2, 0
_080AF464: .4byte 0x02036FF0
_080AF468:
	bl walkrun_is_standing_still
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF4E4
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r2, #0
	ldrsh r1, [r6, r2]
	subs r1, #1
	bl FieldAnimateDoorClose
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0xa]
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080AF4B0
	adds r0, r0, r1
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	movs r0, #0
	bl sub_080AE9F0
	movs r0, #3
	strh r0, [r5, #8]
	b _080AF4E4
	.align 2, 0
_080AF4B0: .4byte 0x02036FF0
_080AF4B4:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _080AF4CA
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	cmp r0, #1
	beq _080AF4E4
_080AF4CA:
	movs r0, #4
	strh r0, [r5, #8]
	b _080AF4E4
_080AF4D0:
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	bl PlayRainStoppingSoundEffect
	movs r0, #0
	strh r0, [r5, #8]
	ldr r0, _080AF4EC
	str r0, [r5]
_080AF4E4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF4EC: .4byte 0x080AF309
	thumb_func_end sub_080AF384

	thumb_func_start task0A_fade_n_map_maybe
task0A_fade_n_map_maybe: @ 0x080AF4F0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AF514
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AF528
	cmp r0, #1
	bgt _080AF518
	cmp r0, #0
	beq _080AF51E
	b _080AF552
	.align 2, 0
_080AF514: .4byte 0x03005B60
_080AF518:
	cmp r0, #2
	beq _080AF542
	b _080AF552
_080AF51E:
	bl FreezeEventObjects
	bl ScriptContext2_Enable
	b _080AF53A
_080AF528:
	bl PaletteFadeActive
	cmp r0, #0
	bne _080AF552
	bl BGMusicStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF552
_080AF53A:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AF552
_080AF542:
	bl WarpIntoMap
	ldr r0, _080AF558
	bl SetMainCallback2
	adds r0, r5, #0
	bl DestroyTask
_080AF552:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF558: .4byte 0x0808598D
	thumb_func_end task0A_fade_n_map_maybe

	thumb_func_start sub_080AF55C
sub_080AF55C: @ 0x080AF55C
	push {lr}
	bl ScriptContext2_Enable
	bl TryFadeOutOldMapMusic
	bl WarpFadeScreen
	bl PlayRainStoppingSoundEffect
	movs r0, #9
	bl PlaySE
	ldr r0, _080AF588
	ldr r1, _080AF58C
	str r1, [r0]
	ldr r0, _080AF590
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AF588: .4byte 0x03005B0C
_080AF58C: .4byte 0x080AECC5
_080AF590: .4byte 0x080AF4F1
	thumb_func_end sub_080AF55C

	thumb_func_start SetFlashScanlineEffectWindowBoundary
SetFlashScanlineEffectWindowBoundary: @ 0x080AF594
	push {lr}
	cmp r1, #0xa0
	bhi _080AF5BC
	cmp r2, #0
	bge _080AF5A0
	movs r2, #0
_080AF5A0:
	cmp r2, #0xff
	ble _080AF5A6
	movs r2, #0xff
_080AF5A6:
	cmp r3, #0
	bge _080AF5AC
	movs r3, #0
_080AF5AC:
	cmp r3, #0xff
	ble _080AF5B2
	movs r3, #0xff
_080AF5B2:
	lsls r1, r1, #1
	adds r1, r1, r0
	lsls r0, r2, #8
	orrs r0, r3
	strh r0, [r1]
_080AF5BC:
	pop {r0}
	bx r0
	thumb_func_end SetFlashScanlineEffectWindowBoundary

	thumb_func_start SetFlashScanlineEffectWindowBoundaries
SetFlashScanlineEffectWindowBoundaries: @ 0x080AF5C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	mov sb, r2
	adds r6, r3, #0
	mov r8, r6
	movs r7, #0
	cmp r6, #0
	blt _080AF63C
_080AF5DC:
	mov r0, sb
	subs r1, r0, r7
	mov r0, sl
	subs r4, r0, r6
	adds r5, r0, r6
	ldr r0, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl SetFlashScanlineEffectWindowBoundary
	mov r0, sb
	adds r1, r0, r7
	ldr r0, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl SetFlashScanlineEffectWindowBoundary
	mov r0, sb
	subs r1, r0, r6
	mov r0, sl
	subs r4, r0, r7
	adds r5, r0, r7
	ldr r0, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl SetFlashScanlineEffectWindowBoundary
	mov r0, sb
	adds r1, r0, r6
	ldr r0, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl SetFlashScanlineEffectWindowBoundary
	mov r1, r8
	adds r1, #1
	lsls r0, r7, #1
	subs r1, r1, r0
	mov r8, r1
	adds r7, #1
	cmp r1, #0
	bge _080AF638
	subs r1, r6, #1
	lsls r0, r1, #1
	add r8, r0
	adds r6, r1, #0
_080AF638:
	cmp r6, r7
	bge _080AF5DC
_080AF63C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SetFlashScanlineEffectWindowBoundaries

	thumb_func_start SetFlash2ScanlineEffectWindowBoundary
SetFlash2ScanlineEffectWindowBoundary: @ 0x080AF64C
	push {lr}
	cmp r1, #0xa0
	bhi _080AF674
	cmp r2, #0
	bge _080AF658
	movs r2, #0
_080AF658:
	cmp r2, #0xf0
	ble _080AF65E
	movs r2, #0xf0
_080AF65E:
	cmp r3, #0
	bge _080AF664
	movs r3, #0
_080AF664:
	cmp r3, #0xf0
	ble _080AF66A
	movs r3, #0xf0
_080AF66A:
	lsls r1, r1, #1
	adds r1, r1, r0
	lsls r0, r2, #8
	orrs r0, r3
	strh r0, [r1]
_080AF674:
	pop {r0}
	bx r0
	thumb_func_end SetFlash2ScanlineEffectWindowBoundary

	thumb_func_start SetFlash2ScanlineEffectWindowBoundaries
SetFlash2ScanlineEffectWindowBoundaries: @ 0x080AF678
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	mov sb, r2
	adds r6, r3, #0
	mov r8, r6
	movs r7, #0
	cmp r6, #0
	blt _080AF6F4
_080AF694:
	mov r0, sb
	subs r1, r0, r7
	mov r0, sl
	subs r4, r0, r6
	adds r5, r0, r6
	ldr r0, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl SetFlash2ScanlineEffectWindowBoundary
	mov r0, sb
	adds r1, r0, r7
	ldr r0, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl SetFlash2ScanlineEffectWindowBoundary
	mov r0, sb
	subs r1, r0, r6
	mov r0, sl
	subs r4, r0, r7
	adds r5, r0, r7
	ldr r0, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl SetFlash2ScanlineEffectWindowBoundary
	mov r0, sb
	adds r1, r0, r6
	ldr r0, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl SetFlash2ScanlineEffectWindowBoundary
	mov r1, r8
	adds r1, #1
	lsls r0, r7, #1
	subs r1, r1, r0
	mov r8, r1
	adds r7, #1
	cmp r1, #0
	bge _080AF6F0
	subs r1, r6, #1
	lsls r0, r1, #1
	add r8, r0
	adds r6, r1, #0
_080AF6F0:
	cmp r6, r7
	bge _080AF694
_080AF6F4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SetFlash2ScanlineEffectWindowBoundaries

	thumb_func_start UpdateFlashLevelEffect
UpdateFlashLevelEffect: @ 0x080AF704
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AF728
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AF760
	cmp r0, #1
	bgt _080AF72C
	cmp r0, #0
	beq _080AF732
	b _080AF7C2
	.align 2, 0
_080AF728: .4byte 0x03005B68
_080AF72C:
	cmp r0, #2
	beq _080AF7B8
	b _080AF7C2
_080AF732:
	ldr r0, _080AF758
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	ldr r1, _080AF75C
	adds r0, r0, r1
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r5, #6
	ldrsh r3, [r4, r5]
	bl SetFlashScanlineEffectWindowBoundaries
	movs r0, #1
	strh r0, [r4]
	b _080AF7C2
	.align 2, 0
_080AF758: .4byte 0x020397C8
_080AF75C: .4byte 0x020388C8
_080AF760:
	ldr r0, _080AF7A8
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	ldr r1, _080AF7AC
	adds r0, r0, r1
	movs r6, #2
	ldrsh r1, [r4, r6]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r6, #6
	ldrsh r3, [r4, r6]
	bl SetFlashScanlineEffectWindowBoundaries
	movs r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #6]
	adds r0, r0, r1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080AF7C2
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #1
	bne _080AF7B0
	bl ScanlineEffect_Stop
	movs r0, #2
	strh r0, [r4]
	b _080AF7C2
	.align 2, 0
_080AF7A8: .4byte 0x020397C8
_080AF7AC: .4byte 0x020388C8
_080AF7B0:
	adds r0, r5, #0
	bl DestroyTask
	b _080AF7C2
_080AF7B8:
	bl ScanlineEffect_Clear
	adds r0, r5, #0
	bl DestroyTask
_080AF7C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end UpdateFlashLevelEffect

	thumb_func_start UpdateFlash2LevelEffect
UpdateFlash2LevelEffect: @ 0x080AF7C8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AF7EC
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AF824
	cmp r0, #1
	bgt _080AF7F0
	cmp r0, #0
	beq _080AF7F6
	b _080AF886
	.align 2, 0
_080AF7EC: .4byte 0x03005B68
_080AF7F0:
	cmp r0, #2
	beq _080AF87C
	b _080AF886
_080AF7F6:
	ldr r0, _080AF81C
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	ldr r1, _080AF820
	adds r0, r0, r1
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r5, #6
	ldrsh r3, [r4, r5]
	bl SetFlash2ScanlineEffectWindowBoundaries
	movs r0, #1
	strh r0, [r4]
	b _080AF886
	.align 2, 0
_080AF81C: .4byte 0x020397C8
_080AF820: .4byte 0x020388C8
_080AF824:
	ldr r0, _080AF86C
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	ldr r1, _080AF870
	adds r0, r0, r1
	movs r6, #2
	ldrsh r1, [r4, r6]
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r6, #6
	ldrsh r3, [r4, r6]
	bl SetFlash2ScanlineEffectWindowBoundaries
	movs r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #6]
	adds r0, r0, r1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080AF886
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #1
	bne _080AF874
	bl ScanlineEffect_Stop
	movs r0, #2
	strh r0, [r4]
	b _080AF886
	.align 2, 0
_080AF86C: .4byte 0x020397C8
_080AF870: .4byte 0x020388C8
_080AF874:
	adds r0, r5, #0
	bl DestroyTask
	b _080AF886
_080AF87C:
	bl ScanlineEffect_Clear
	adds r0, r5, #0
	bl DestroyTask
_080AF886:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end UpdateFlash2LevelEffect

	thumb_func_start sub_080AF88C
sub_080AF88C: @ 0x080AF88C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080AF8B0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AF8A8
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_080AF8A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF8B0: .4byte 0x080AF705
	thumb_func_end sub_080AF88C

	thumb_func_start sub_080AF8B4
sub_080AF8B4: @ 0x080AF8B4
	push {r4, lr}
	ldr r4, _080AF8D4
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AF8CC
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
_080AF8CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF8D4: .4byte 0x080AF88D
	thumb_func_end sub_080AF8B4

	thumb_func_start sub_080AF8D8
sub_080AF8D8: @ 0x080AF8D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080AF91C
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080AF920
	adds r1, r0, r1
	strh r5, [r1, #6]
	strh r4, [r1, #8]
	mov r0, r8
	strh r0, [r1, #2]
	mov r0, sb
	strh r0, [r1, #4]
	strh r6, [r1, #0xc]
	cmp r5, r4
	bge _080AF924
	strh r7, [r1, #0xa]
	b _080AF928
	.align 2, 0
_080AF91C: .4byte 0x080AF705
_080AF920: .4byte 0x03005B68
_080AF924:
	rsbs r0, r7, #0
	strh r0, [r1, #0xa]
_080AF928:
	adds r0, r2, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080AF8D8

	thumb_func_start sub_080AF938
sub_080AF938: @ 0x080AF938
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080AF97C
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080AF980
	adds r1, r0, r1
	strh r5, [r1, #6]
	strh r4, [r1, #8]
	mov r0, r8
	strh r0, [r1, #2]
	mov r0, sb
	strh r0, [r1, #4]
	strh r6, [r1, #0xc]
	cmp r5, r4
	bge _080AF984
	strh r7, [r1, #0xa]
	b _080AF988
	.align 2, 0
_080AF97C: .4byte 0x080AF7C9
_080AF980: .4byte 0x03005B68
_080AF984:
	rsbs r0, r7, #0
	strh r0, [r1, #0xa]
_080AF988:
	adds r0, r2, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080AF938

	thumb_func_start sub_080AF998
sub_080AF998: @ 0x080AF998
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	bl Overworld_GetFlashLevel
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	cmp r4, #0
	bne _080AF9B2
	movs r5, #1
_080AF9B2:
	ldr r1, _080AF9E0
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	str r5, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x78
	movs r1, #0x50
	bl sub_080AF8D8
	bl sub_080AF8B4
	bl ScriptContext2_Enable
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF9E0: .4byte 0x0852AB00
	thumb_func_end sub_080AF998

	thumb_func_start WriteFlashScanlineEffectBuffer
WriteFlashScanlineEffectBuffer: @ 0x080AF9E4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080AFA12
	ldr r4, _080AFA18
	ldr r1, _080AFA1C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0x50
	bl SetFlashScanlineEffectWindowBoundaries
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r1, r4, r0
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
_080AFA12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AFA18: .4byte 0x020388C8
_080AFA1C: .4byte 0x0852AB00
	thumb_func_end WriteFlashScanlineEffectBuffer

	thumb_func_start WriteBattlePyramidViewScanlineEffectBuffer
WriteBattlePyramidViewScanlineEffectBuffer: @ 0x080AFA20
	push {r4, lr}
	ldr r4, _080AFA50
	ldr r0, _080AFA54
	ldr r0, [r0]
	ldr r1, _080AFA58
	adds r0, r0, r1
	ldrb r3, [r0]
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0x50
	bl SetFlashScanlineEffectWindowBoundaries
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r1, r4, r0
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AFA50: .4byte 0x020388C8
_080AFA54: .4byte 0x03005AF0
_080AFA58: .4byte 0x00000E68
	thumb_func_end WriteBattlePyramidViewScanlineEffectBuffer

	thumb_func_start task0A_mpl_807E31C
task0A_mpl_807E31C: @ 0x080AFA5C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080AFA7C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080AFA80
	cmp r0, #1
	beq _080AFA94
	b _080AFAB2
	.align 2, 0
_080AFA7C: .4byte 0x03005B60
_080AFA80:
	bl FreezeEventObjects
	bl ScriptContext2_Enable
	bl sub_0808CB04
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AFAB2
_080AFA94:
	bl WaitForWeatherFadeIn
	cmp r0, #0
	beq _080AFAB2
	bl sub_0808CB24
	cmp r0, #1
	beq _080AFAB2
	bl UnfreezeEventObjects
	bl ScriptContext2_Disable
	adds r0, r5, #0
	bl DestroyTask
_080AFAB2:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end task0A_mpl_807E31C

	thumb_func_start sub_080AFAB8
sub_080AFAB8: @ 0x080AFAB8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AFADC
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080AFAFE
	cmp r0, #1
	bgt _080AFAE0
	cmp r0, #0
	beq _080AFAEA
	b _080AFB36
	.align 2, 0
_080AFADC: .4byte 0x03005B60
_080AFAE0:
	cmp r0, #2
	beq _080AFB0C
	cmp r0, #3
	beq _080AFB26
	b _080AFB36
_080AFAEA:
	bl FreezeEventObjects
	bl ScriptContext2_Enable
	movs r0, #0x2d
	bl PlaySE
	bl sub_0808CB38
	b _080AFB1E
_080AFAFE:
	bl sub_0808CB58
	cmp r0, #0
	bne _080AFB36
	bl WarpFadeScreen
	b _080AFB1E
_080AFB0C:
	bl PaletteFadeActive
	cmp r0, #0
	bne _080AFB36
	bl BGMusicStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AFB36
_080AFB1E:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AFB36
_080AFB26:
	bl WarpIntoMap
	ldr r0, _080AFB3C
	bl SetMainCallback2
	adds r0, r5, #0
	bl DestroyTask
_080AFB36:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFB3C: .4byte 0x08085935
	thumb_func_end sub_080AFAB8

	thumb_func_start sub_080AFB40
sub_080AFB40: @ 0x080AFB40
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _080AFB58
	movs r1, #0xa
	bl CreateTask
	ldr r1, _080AFB5C
	ldr r0, _080AFB60
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080AFB58: .4byte 0x080AF309
_080AFB5C: .4byte 0x03005B0C
_080AFB60: .4byte 0x080AECE5
	thumb_func_end sub_080AFB40

	thumb_func_start sub_080AFB64
sub_080AFB64: @ 0x080AFB64
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _080AFB7C
	ldr r1, _080AFB80
	str r1, [r0]
	ldr r0, _080AFB84
	movs r1, #0xa
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AFB7C: .4byte 0x03005B0C
_080AFB80: .4byte 0x080AEC95
_080AFB84: .4byte 0x080AFAB9
	thumb_func_end sub_080AFB64

	thumb_func_start sub_080AFB88
sub_080AFB88: @ 0x080AFB88
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AFB96
	movs r1, #0x1f
	b _080AFB9C
_080AFB96:
	movs r0, #0xf8
	lsls r0, r0, #7
	adds r1, r0, #0
_080AFB9C:
	mov r0, sp
	strh r1, [r0]
	movs r5, #0
	movs r4, #0xf0
	lsls r4, r4, #0x10
_080AFBA6:
	lsrs r1, r4, #0x10
	mov r0, sp
	movs r2, #2
	bl LoadPalette
	movs r0, #0x80
	lsls r0, r0, #9
	adds r4, r4, r0
	adds r5, #1
	cmp r5, #0xf
	ble _080AFBA6
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080AFB88

	thumb_func_start sub_080AFBC4
sub_080AFBC4: @ 0x080AFBC4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	ldr r2, _080AFBE4
	ldrh r1, [r2]
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldrh r1, [r2]
	lsrs r4, r1, #8
	cmp r0, #0
	beq _080AFBE8
	cmp r5, #0
	beq _080AFBF2
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080AFBF2
	.align 2, 0
_080AFBE4: .4byte 0x04000052
_080AFBE8:
	cmp r4, #0xf
	bhi _080AFBF2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080AFBF2:
	lsls r1, r4, #8
	orrs r1, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	cmp r5, #0
	bne _080AFC0C
	cmp r4, #0x10
	bne _080AFC0C
	movs r0, #1
	b _080AFC0E
_080AFC0C:
	movs r0, #0
_080AFC0E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080AFBC4

	thumb_func_start sub_080AFC14
sub_080AFC14: @ 0x080AFC14
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080AFC3C
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #7
	bls _080AFC30
	b _080AFE28
_080AFC30:
	lsls r0, r0, #2
	ldr r1, _080AFC40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AFC3C: .4byte 0x03005B68
_080AFC40: .4byte 0x080AFC44
_080AFC44: @ jump table
	.4byte _080AFC64 @ case 0
	.4byte _080AFD20 @ case 1
	.4byte _080AFD4C @ case 2
	.4byte _080AFD68 @ case 3
	.4byte _080AFD7E @ case 4
	.4byte _080AFDEE @ case 5
	.4byte _080AFDA8 @ case 6
	.4byte _080AFDB6 @ case 7
_080AFC64:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r0, [r0]
	strh r0, [r5, #0xc]
	ldr r0, _080AFD00
	ldrh r0, [r0]
	strh r0, [r5, #0xe]
	ldr r0, _080AFD04
	ldrh r0, [r0]
	strh r0, [r5, #0x10]
	ldr r0, _080AFD08
	ldrh r0, [r0]
	strh r0, [r5, #0x12]
	ldr r0, _080AFD0C
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0
	bl ClearGpuRegBits
	ldr r0, _080AFD10
	ldrh r1, [r0]
	movs r0, #0x50
	bl SetGpuRegBits
	ldr r1, _080AFD14
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x1e
	bl SetGpuReg
	movs r0, #0x14
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0x1e
	bl sub_081998C8
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	ldr r4, _080AFD18
	movs r2, #4
	ldrsh r1, [r5, r2]
	movs r0, #6
	ldrsh r2, [r5, r0]
	adds r0, r4, #0
	movs r3, #1
	bl SetFlash2ScanlineEffectWindowBoundaries
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r4, r2
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	ldr r2, _080AFD1C
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [r2, #8]
	bl ScanlineEffect_SetParams
	movs r0, #1
	strh r0, [r5]
	b _080AFE28
	.align 2, 0
_080AFD00: .4byte 0x04000050
_080AFD04: .4byte 0x04000052
_080AFD08: .4byte 0x04000048
_080AFD0C: .4byte 0x0400004A
_080AFD10: .4byte 0x082BF434
_080AFD14: .4byte 0x0000070C
_080AFD18: .4byte 0x020388C8
_080AFD1C: .4byte 0x0852AB18
_080AFD20:
	movs r0, #0
	movs r1, #0x11
	movs r2, #0
	movs r3, #1
	bl sub_08199A88
	ldrb r0, [r5, #2]
	bl sub_080AFB88
	movs r1, #4
	ldrsh r0, [r5, r1]
	movs r2, #6
	ldrsh r1, [r5, r2]
	movs r2, #1
	str r2, [sp]
	movs r4, #2
	str r4, [sp, #4]
	movs r3, #0xa0
	bl sub_080AF938
	strh r4, [r5]
	b _080AFE28
_080AFD4C:
	ldr r0, _080AFD64
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AFE28
	bl EnableBothScriptContexts
	movs r0, #3
	strh r0, [r5]
	b _080AFE28
	.align 2, 0
_080AFD64: .4byte 0x080AF7C9
_080AFD68:
	bl InstallCameraPanAheadCallback
	movs r0, #0
	bl SetCameraPanningCallback
	movs r0, #0
	strh r0, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #8]
	strh r0, [r5]
	b _080AFE28
_080AFD7E:
	ldrh r0, [r5, #8]
	subs r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080AFE28
	movs r0, #4
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	movs r1, #1
	eors r0, r1
	strh r0, [r5, #0xa]
	movs r1, #4
	rsbs r1, r1, #0
	cmp r0, #0
	beq _080AFDA0
	movs r1, #4
_080AFDA0:
	movs r0, #0
	bl SetCameraPanning
	b _080AFE28
_080AFDA8:
	bl InstallCameraPanAheadCallback
	movs r0, #8
	strh r0, [r5, #8]
	movs r0, #7
	strh r0, [r5]
	b _080AFE28
_080AFDB6:
	ldrh r0, [r5, #8]
	subs r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080AFE28
	movs r0, #8
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	movs r1, #1
	eors r0, r1
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #0xa]
	bl sub_080AFBC4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080AFE28
	movs r0, #5
	strh r0, [r5]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_08199A88
	b _080AFE28
_080AFDEE:
	movs r0, #0x40
	movs r1, #0xff
	bl SetGpuReg
	ldrh r1, [r5, #0xc]
	movs r0, #0
	bl SetGpuReg
	ldrh r1, [r5, #0xe]
	movs r0, #0x50
	bl SetGpuReg
	ldrh r1, [r5, #0x10]
	movs r0, #0x52
	bl SetGpuReg
	ldrh r1, [r5, #0x12]
	movs r0, #0x48
	bl SetGpuReg
	ldrh r1, [r5, #0x14]
	movs r0, #0x4a
	bl SetGpuReg
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_080AFE28:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080AFC14

	thumb_func_start sub_080AFE30
sub_080AFE30: @ 0x080AFE30
	push {lr}
	ldr r0, _080AFE58
	movs r1, #0x50
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080AFE5C
	adds r1, r1, r0
	ldr r0, _080AFE60
	ldrh r0, [r0]
	cmp r0, #0
	bne _080AFE64
	strh r0, [r1, #2]
	movs r0, #0x68
	b _080AFE7C
	.align 2, 0
_080AFE58: .4byte 0x080AFC15
_080AFE5C: .4byte 0x03005B68
_080AFE60: .4byte 0x02037290
_080AFE64:
	cmp r0, #1
	bne _080AFE6E
	strh r0, [r1, #2]
	movs r0, #0x88
	b _080AFE7C
_080AFE6E:
	cmp r0, #2
	bne _080AFE76
	movs r0, #0
	b _080AFE78
_080AFE76:
	movs r0, #1
_080AFE78:
	strh r0, [r1, #2]
	movs r0, #0x78
_080AFE7C:
	strh r0, [r1, #4]
	movs r0, #0x50
	strh r0, [r1, #6]
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080AFE30

	thumb_func_start sub_080AFE88
sub_080AFE88: @ 0x080AFE88
	push {lr}
	ldr r0, _080AFEA8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080AFEAC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #6
	strh r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080AFEA8: .4byte 0x080AFC15
_080AFEAC: .4byte 0x03005B60
	thumb_func_end sub_080AFE88

	thumb_func_start sub_080AFEB0
sub_080AFEB0: @ 0x080AFEB0
	push {lr}
	bl Overworld_FadeOutMapMusic
	ldr r0, _080AFEC4
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AFEC4: .4byte 0x080AFEC9
	thumb_func_end sub_080AFEB0

	thumb_func_start task50_0807F0C8
task50_0807F0C8: @ 0x080AFEC8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl BGMusicStopped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080AFEE4
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_080AFEE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end task50_0807F0C8

