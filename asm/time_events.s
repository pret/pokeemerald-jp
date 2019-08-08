.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetMirageRnd
GetMirageRnd: @ 0x08137900
	push {r4, lr}
	ldr r0, _08137924
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08137928
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	orrs r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08137924: .4byte 0x00004024
_08137928: .4byte 0x00004025
	thumb_func_end GetMirageRnd

	thumb_func_start SetMirageRnd
SetMirageRnd: @ 0x0813792C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0813794C
	lsrs r1, r4, #0x10
	bl VarSet
	ldr r0, _08137950
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813794C: .4byte 0x00004024
_08137950: .4byte 0x00004025
	thumb_func_end SetMirageRnd

	thumb_func_start InitMirageRnd
InitMirageRnd: @ 0x08137954
	push {r4, lr}
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r4, r0
	adds r0, r4, #0
	bl SetMirageRnd
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end InitMirageRnd

	thumb_func_start UpdateMirageRnd
UpdateMirageRnd: @ 0x08137974
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetMirageRnd
	adds r1, r0, #0
	cmp r4, #0
	beq _08137998
	ldr r3, _081379A4
	ldr r2, _081379A8
_08137988:
	adds r0, r1, #0
	muls r0, r3, r0
	adds r1, r0, r2
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08137988
_08137998:
	adds r0, r1, #0
	bl SetMirageRnd
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081379A4: .4byte 0x41C64E6D
_081379A8: .4byte 0x00003039
	thumb_func_end UpdateMirageRnd

	thumb_func_start IsMirageIslandPresent
IsMirageIslandPresent: @ 0x081379AC
	push {r4, r5, r6, lr}
	bl GetMirageRnd
	lsrs r6, r0, #0x10
	movs r5, #0
_081379B6:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081379E0
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081379E8
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	ldr r1, _081379E4
	ands r1, r0
	cmp r1, r6
	bne _081379E8
	movs r0, #1
	b _081379F0
	.align 2, 0
_081379E0: .4byte 0x02024190
_081379E4: .4byte 0x0000FFFF
_081379E8:
	adds r5, #1
	cmp r5, #5
	ble _081379B6
	movs r0, #0
_081379F0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsMirageIslandPresent

	thumb_func_start UpdateShoalTideFlag
UpdateShoalTideFlag: @ 0x081379F8
	push {lr}
	bl GetLastUsedWarpMapType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsMapTypeOutdoors
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08137A3E
	bl RtcCalcLocalTime
	ldr r1, _08137A2C
	ldr r0, _08137A30
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08137A38
	ldr r0, _08137A34
	bl FlagSet
	b _08137A3E
	.align 2, 0
_08137A2C: .4byte 0x08592590
_08137A30: .4byte 0x03005A50
_08137A34: .4byte 0x0000089A
_08137A38:
	ldr r0, _08137A44
	bl FlagClear
_08137A3E:
	pop {r0}
	bx r0
	.align 2, 0
_08137A44: .4byte 0x0000089A
	thumb_func_end UpdateShoalTideFlag

	thumb_func_start Task_WaitWeather
Task_WaitWeather: @ 0x08137A48
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsWeatherChangeComplete
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08137A62
	bl EnableBothScriptContexts
	adds r0, r4, #0
	bl DestroyTask
_08137A62:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_WaitWeather

	thumb_func_start WaitWeather
WaitWeather: @ 0x08137A68
	push {lr}
	ldr r0, _08137A78
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08137A78: .4byte 0x08137A49
	thumb_func_end WaitWeather

	thumb_func_start InitBirchState
InitBirchState: @ 0x08137A7C
	push {lr}
	ldr r0, _08137A8C
	bl GetVarPointer
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08137A8C: .4byte 0x00004049
	thumb_func_end InitBirchState

	thumb_func_start UpdateBirchState
UpdateBirchState: @ 0x08137A90
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08137AB8
	bl GetVarPointer
	adds r5, r0, #0
	ldrh r0, [r5]
	adds r4, r4, r0
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, #7
	bl __umodsi3
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08137AB8: .4byte 0x00004049
	thumb_func_end UpdateBirchState

