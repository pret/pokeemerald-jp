.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ShouldDoBrailleDigEffect
ShouldDoBrailleDigEffect: @ 0x081794A0
	push {lr}
	ldr r0, _081794D4
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081794EC
	ldr r0, _081794D8
	ldr r2, [r0]
	ldrh r1, [r2, #4]
	ldr r0, _081794DC
	cmp r1, r0
	bne _081794EC
	ldr r1, [r2]
	ldr r0, _081794E0
	cmp r1, r0
	beq _081794CE
	ldr r0, _081794E4
	cmp r1, r0
	beq _081794CE
	ldr r0, _081794E8
	cmp r1, r0
	bne _081794EC
_081794CE:
	movs r0, #1
	b _081794EE
	.align 2, 0
_081794D4: .4byte 0x000008AF
_081794D8: .4byte 0x03005AEC
_081794DC: .4byte 0x00004718
_081794E0: .4byte 0x0003000A
_081794E4: .4byte 0x00030009
_081794E8: .4byte 0x0003000B
_081794EC:
	movs r0, #0
_081794EE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldDoBrailleDigEffect

	thumb_func_start DoBrailleDigEffect
DoBrailleDigEffect: @ 0x081794F4
	push {lr}
	ldr r2, _0817954C
	movs r0, #0x10
	movs r1, #8
	bl MapGridSetMetatileIdAt
	ldr r2, _08179550
	movs r0, #0x11
	movs r1, #8
	bl MapGridSetMetatileIdAt
	movs r2, #0x8b
	lsls r2, r2, #2
	movs r0, #0x12
	movs r1, #8
	bl MapGridSetMetatileIdAt
	ldr r2, _08179554
	movs r0, #0x10
	movs r1, #9
	bl MapGridSetMetatileIdAt
	ldr r2, _08179558
	movs r0, #0x11
	movs r1, #9
	bl MapGridSetMetatileIdAt
	ldr r2, _0817955C
	movs r0, #0x12
	movs r1, #9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, #0x14
	bl PlaySE
	ldr r0, _08179560
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_0817954C: .4byte 0x0000022A
_08179550: .4byte 0x0000022B
_08179554: .4byte 0x00000E32
_08179558: .4byte 0x00000233
_0817955C: .4byte 0x00000E34
_08179560: .4byte 0x000008AF
	thumb_func_end DoBrailleDigEffect

	thumb_func_start CheckRelicanthWailord
CheckRelicanthWailord: @ 0x08179564
	push {r4, lr}
	ldr r4, _081795A0
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	movs r1, #0x9d
	lsls r1, r1, #1
	cmp r0, r1
	bne _081795AC
	bl CalculatePlayerPartyCount
	ldr r0, _081795A4
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	adds r1, r4, #0
	subs r1, #0x64
	adds r0, r0, r1
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	ldr r1, _081795A8
	cmp r0, r1
	bne _081795AC
	movs r0, #1
	b _081795AE
	.align 2, 0
_081795A0: .4byte 0x02024190
_081795A4: .4byte 0x0202418D
_081795A8: .4byte 0x0000017D
_081795AC:
	movs r0, #0
_081795AE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckRelicanthWailord

	thumb_func_start ShouldDoBrailleRegirockEffectOld
ShouldDoBrailleRegirockEffectOld: @ 0x081795B4
	bx lr
	.align 2, 0
	thumb_func_end ShouldDoBrailleRegirockEffectOld

	thumb_func_start DoSealedChamberShakingEffect1
DoSealedChamberShakingEffect1: @ 0x081795B8
	push {lr}
	ldr r0, _081795EC
	movs r1, #9
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081795F0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #0xa]
	strh r0, [r1, #0xc]
	movs r0, #2
	strh r0, [r1, #0x10]
	movs r0, #5
	strh r0, [r1, #0x12]
	movs r0, #0x32
	strh r0, [r1, #0x14]
	movs r0, #0
	bl SetCameraPanningCallback
	pop {r0}
	bx r0
	.align 2, 0
_081795EC: .4byte 0x08179631
_081795F0: .4byte 0x03005B60
	thumb_func_end DoSealedChamberShakingEffect1

	thumb_func_start DoSealedChamberShakingEffect2
DoSealedChamberShakingEffect2: @ 0x081795F4
	push {lr}
	ldr r0, _08179628
	movs r1, #9
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817962C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #0xa]
	strh r0, [r1, #0xc]
	movs r0, #3
	strh r0, [r1, #0x10]
	movs r0, #5
	strh r0, [r1, #0x12]
	movs r0, #2
	strh r0, [r1, #0x14]
	movs r0, #0
	bl SetCameraPanningCallback
	pop {r0}
	bx r0
	.align 2, 0
_08179628: .4byte 0x08179631
_0817962C: .4byte 0x03005B60
	thumb_func_end DoSealedChamberShakingEffect2

	thumb_func_start SealedChamberShakingEffect
SealedChamberShakingEffect: @ 0x08179630
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08179690
	adds r4, r0, r1
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, #0
	bne _08179688
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x10]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0
	bl SetCameraPanning
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08179688
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	bl InstallCameraPanAheadCallback
_08179688:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08179690: .4byte 0x03005B60
	thumb_func_end SealedChamberShakingEffect

	thumb_func_start ShouldDoBrailleRegirockEffect
ShouldDoBrailleRegirockEffect: @ 0x08179694
	push {lr}
	movs r0, #0x8b
	lsls r0, r0, #4
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _081796E4
	ldr r0, _081796D0
	ldr r3, [r0]
	ldrh r1, [r3, #4]
	movs r0, #0xc3
	lsls r0, r0, #3
	cmp r1, r0
	bne _081796E4
	ldr r1, [r3]
	ldr r0, _081796D4
	cmp r1, r0
	beq _081796C8
	ldr r0, _081796D8
	cmp r1, r0
	beq _081796C8
	ldr r0, _081796DC
	cmp r1, r0
	bne _081796E4
_081796C8:
	ldr r0, _081796E0
	strb r2, [r0]
	movs r0, #1
	b _081796E6
	.align 2, 0
_081796D0: .4byte 0x03005AEC
_081796D4: .4byte 0x00170006
_081796D8: .4byte 0x00170005
_081796DC: .4byte 0x00170007
_081796E0: .4byte 0x0203B9E0
_081796E4:
	movs r0, #0
_081796E6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldDoBrailleRegirockEffect

	thumb_func_start SetUpPuzzleEffectRegirock
SetUpPuzzleEffectRegirock: @ 0x081796EC
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _08179704
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	movs r0, #0x3c
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08179704: .4byte 0x020388A8
	thumb_func_end SetUpPuzzleEffectRegirock

	thumb_func_start UseRegirockHm_Callback
UseRegirockHm_Callback: @ 0x08179708
	push {lr}
	movs r0, #0x3c
	bl FieldEffectActiveListRemove
	bl DoBrailleRegirockEffect
	pop {r0}
	bx r0
	thumb_func_end UseRegirockHm_Callback

	thumb_func_start DoBrailleRegirockEffect
DoBrailleRegirockEffect: @ 0x08179718
	push {lr}
	ldr r2, _08179774
	movs r0, #0xe
	movs r1, #0x1a
	bl MapGridSetMetatileIdAt
	ldr r2, _08179778
	movs r0, #0xf
	movs r1, #0x1a
	bl MapGridSetMetatileIdAt
	movs r2, #0x8b
	lsls r2, r2, #2
	movs r0, #0x10
	movs r1, #0x1a
	bl MapGridSetMetatileIdAt
	ldr r2, _0817977C
	movs r0, #0xe
	movs r1, #0x1b
	bl MapGridSetMetatileIdAt
	ldr r2, _08179780
	movs r0, #0xf
	movs r1, #0x1b
	bl MapGridSetMetatileIdAt
	ldr r2, _08179784
	movs r0, #0x10
	movs r1, #0x1b
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, #0x14
	bl PlaySE
	movs r0, #0x8b
	lsls r0, r0, #4
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08179774: .4byte 0x0000022A
_08179778: .4byte 0x0000022B
_0817977C: .4byte 0x00000E32
_08179780: .4byte 0x00000233
_08179784: .4byte 0x00000E34
	thumb_func_end DoBrailleRegirockEffect

	thumb_func_start ShouldDoBrailleRegisteelEffect
ShouldDoBrailleRegisteelEffect: @ 0x08179788
	push {lr}
	ldr r0, _081797B4
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081797C8
	ldr r0, _081797B8
	ldr r2, [r0]
	ldrh r1, [r2, #4]
	ldr r0, _081797BC
	cmp r1, r0
	bne _081797C8
	ldr r1, [r2]
	ldr r0, _081797C0
	cmp r1, r0
	bne _081797C8
	ldr r1, _081797C4
	movs r0, #1
	strb r0, [r1]
	movs r0, #1
	b _081797CA
	.align 2, 0
_081797B4: .4byte 0x000008B2
_081797B8: .4byte 0x03005AEC
_081797BC: .4byte 0x00004418
_081797C0: .4byte 0x00190008
_081797C4: .4byte 0x0203B9E0
_081797C8:
	movs r0, #0
_081797CA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldDoBrailleRegisteelEffect

	thumb_func_start SetUpPuzzleEffectRegisteel
SetUpPuzzleEffectRegisteel: @ 0x081797D0
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _081797E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	movs r0, #0x3c
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_081797E8: .4byte 0x020388A8
	thumb_func_end SetUpPuzzleEffectRegisteel

	thumb_func_start UseRegisteelHm_Callback
UseRegisteelHm_Callback: @ 0x081797EC
	push {lr}
	movs r0, #0x3c
	bl FieldEffectActiveListRemove
	bl DoBrailleRegisteelEffect
	pop {r0}
	bx r0
	thumb_func_end UseRegisteelHm_Callback

	thumb_func_start DoBrailleRegisteelEffect
DoBrailleRegisteelEffect: @ 0x081797FC
	push {lr}
	ldr r2, _08179854
	movs r0, #0xe
	movs r1, #0x1a
	bl MapGridSetMetatileIdAt
	ldr r2, _08179858
	movs r0, #0xf
	movs r1, #0x1a
	bl MapGridSetMetatileIdAt
	movs r2, #0x8b
	lsls r2, r2, #2
	movs r0, #0x10
	movs r1, #0x1a
	bl MapGridSetMetatileIdAt
	ldr r2, _0817985C
	movs r0, #0xe
	movs r1, #0x1b
	bl MapGridSetMetatileIdAt
	ldr r2, _08179860
	movs r0, #0xf
	movs r1, #0x1b
	bl MapGridSetMetatileIdAt
	ldr r2, _08179864
	movs r0, #0x10
	movs r1, #0x1b
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, #0x14
	bl PlaySE
	ldr r0, _08179868
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08179854: .4byte 0x0000022A
_08179858: .4byte 0x0000022B
_0817985C: .4byte 0x00000E32
_08179860: .4byte 0x00000233
_08179864: .4byte 0x00000E34
_08179868: .4byte 0x000008B2
	thumb_func_end DoBrailleRegisteelEffect

	thumb_func_start DoBrailleWait
DoBrailleWait: @ 0x0817986C
	bx lr
	.align 2, 0
	thumb_func_end DoBrailleWait

	thumb_func_start FldEff_UsePuzzleEffect
FldEff_UsePuzzleEffect: @ 0x08179870
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08179890
	ldrb r0, [r0]
	cmp r0, #1
	bne _0817989C
	ldr r1, _08179894
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, _08179898
	b _081798A8
	.align 2, 0
_08179890: .4byte 0x0203B9E0
_08179894: .4byte 0x03005B60
_08179898: .4byte 0x081797ED
_0817989C:
	ldr r1, _081798B4
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, _081798B8
_081798A8:
	lsrs r1, r2, #0x10
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_081798B4: .4byte 0x03005B60
_081798B8: .4byte 0x08179709
	thumb_func_end FldEff_UsePuzzleEffect

	thumb_func_start ShouldDoBrailleRegicePuzzle
ShouldDoBrailleRegicePuzzle: @ 0x081798BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08179900
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	ldr r0, _08179904
	cmp r1, r0
	beq _081798D2
	b _08179A12
_081798D2:
	ldr r0, _08179908
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081798E0
	b _08179A12
_081798E0:
	movs r0, #2
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081798EE
	b _08179A12
_081798EE:
	movs r0, #3
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08179910
	b _08179A12
	.align 2, 0
_08179900: .4byte 0x03005AEC
_08179904: .4byte 0x00004318
_08179908: .4byte 0x000008B1
_0817990C:
	movs r0, #1
	b _08179A14
_08179910:
	movs r5, #0
	mov r8, r4
	ldr r4, _0817995C
	adds r0, r4, #1
	mov ip, r0
	ldr r6, _08179960
	ldr r1, _08179964
	mov sb, r1
_08179920:
	lsls r0, r5, #1
	adds r1, r0, r4
	add r0, ip
	ldrb r3, [r0]
	mov r7, r8
	ldr r2, [r7]
	movs r7, #0
	ldrsh r0, [r2, r7]
	ldrb r1, [r1]
	cmp r0, r1
	bne _081799FC
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bne _081799FC
	cmp r5, #0xf
	bhi _08179968
	adds r0, r6, #0
	bl VarGet
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r5
	orrs r1, r0
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	bl VarSet
	b _081799A8
	.align 2, 0
_0817995C: .4byte 0x085CD314
_08179960: .4byte 0x0000403B
_08179964: .4byte 0x0000403C
_08179968:
	cmp r5, #0x1f
	bhi _0817998A
	mov r0, sb
	bl VarGet
	lsls r0, r0, #0x10
	adds r2, r5, #0
	subs r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r2
	orrs r1, r0
	lsrs r1, r1, #0x10
	mov r0, sb
	bl VarSet
	b _081799A8
_0817998A:
	ldr r4, _081799E4
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	adds r2, r5, #0
	subs r2, #0x20
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r2
	orrs r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_081799A8:
	ldr r0, _081799E8
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _081799EC
	cmp r4, r0
	bne _08179A12
	ldr r0, _081799F0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bne _08179A12
	ldr r0, _081799E4
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08179A12
	ldr r0, _081799F4
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, _081799F8
	cmp r1, r0
	beq _0817990C
	b _08179A12
	.align 2, 0
_081799E4: .4byte 0x0000403D
_081799E8: .4byte 0x0000403B
_081799EC: .4byte 0x0000FFFF
_081799F0: .4byte 0x0000403C
_081799F4: .4byte 0x03005AEC
_081799F8: .4byte 0x00150008
_081799FC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x23
	bls _08179920
	movs r0, #3
	bl FlagSet
	movs r0, #2
	bl FlagClear
_08179A12:
	movs r0, #0
_08179A14:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end ShouldDoBrailleRegicePuzzle

