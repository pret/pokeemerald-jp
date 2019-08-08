.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_080FA43C
sub_080FA43C: @ 0x080FA43C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _080FA460
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080FA4B4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA460: .4byte 0x080FA501
	thumb_func_end sub_080FA43C

	thumb_func_start sub_080FA464
sub_080FA464: @ 0x080FA464
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _080FA488
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080FA4B4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA488: .4byte 0x080FA66D
	thumb_func_end sub_080FA464

	thumb_func_start sub_080FA48C
sub_080FA48C: @ 0x080FA48C
	push {lr}
	ldr r0, _080FA49C
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080FA49C: .4byte 0x080FA501
	thumb_func_end sub_080FA48C

	thumb_func_start FldEffPoison_IsActive
FldEffPoison_IsActive: @ 0x080FA4A0
	push {lr}
	ldr r0, _080FA4B0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080FA4B0: .4byte 0x080FA66D
	thumb_func_end FldEffPoison_IsActive

	thumb_func_start sub_080FA4B4
sub_080FA4B4: @ 0x080FA4B4
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r5, r4, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r1, r3, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	ldr r1, _080FA4FC
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #0
	strh r0, [r1, #8]
	movs r0, #0x10
	cmp r4, #0
	beq _080FA4E2
	adds r0, r4, #0
_080FA4E2:
	strh r0, [r1, #0xa]
	movs r0, #0x14
	cmp r5, #0
	beq _080FA4EC
	adds r0, r5, #0
_080FA4EC:
	strh r0, [r1, #0xc]
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA4FC: .4byte 0x03005B60
	thumb_func_end sub_080FA4B4

	thumb_func_start sub_080FA500
sub_080FA500: @ 0x080FA500
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080FA524
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080FA580
	cmp r0, #1
	bgt _080FA528
	cmp r0, #0
	beq _080FA532
	b _080FA64E
	.align 2, 0
_080FA524: .4byte 0x03005B60
_080FA528:
	cmp r0, #2
	beq _080FA5A2
	cmp r0, #3
	beq _080FA604
	b _080FA64E
_080FA532:
	movs r0, #0x78
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	movs r0, #0x50
	strh r0, [r4, #0x12]
	movs r0, #0x51
	strh r0, [r4, #0x14]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x14]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	b _080FA65E
_080FA580:
	movs r0, #0x50
	bl GetGpuReg
	strh r0, [r4, #0x16]
	movs r0, #0x54
	bl GetGpuReg
	strh r0, [r4, #0x18]
	movs r0, #0x50
	movs r1, #0xbf
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0x10
	bl SetGpuReg
	b _080FA65E
_080FA5A2:
	ldrh r0, [r4, #0xe]
	ldrh r1, [r4, #0xa]
	subs r0, r0, r1
	movs r5, #0
	strh r0, [r4, #0xe]
	ldrh r2, [r4, #0x10]
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _080FA5C0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xef
	ble _080FA5E6
_080FA5C0:
	strh r5, [r4, #0xe]
	movs r0, #0xf0
	strh r0, [r4, #0x10]
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4, #0x16]
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	movs r2, #0
	bl BlendPalettes
	ldr r0, _080FA600
	strh r5, [r0]
_080FA5E6:
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	b _080FA648
	.align 2, 0
_080FA600: .4byte 0x020377B4
_080FA604:
	ldrh r0, [r4, #0x12]
	ldrh r1, [r4, #0xc]
	subs r0, r0, r1
	strh r0, [r4, #0x12]
	ldrh r2, [r4, #0x14]
	adds r1, r1, r2
	strh r1, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _080FA620
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _080FA632
_080FA620:
	movs r0, #0
	strh r0, [r4, #0x12]
	movs r0, #0xa0
	strh r0, [r4, #0x14]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
_080FA632:
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x14]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r1, #0x12
	ldrsh r0, [r4, r1]
_080FA648:
	cmp r0, #0
	bne _080FA664
	b _080FA65E
_080FA64E:
	ldrh r1, [r4, #0x16]
	movs r0, #0x50
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyTask
	b _080FA664
_080FA65E:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080FA664:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080FA500

	thumb_func_start sub_080FA66C
sub_080FA66C: @ 0x080FA66C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080FA690
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _080FA6A8
	cmp r1, #1
	bgt _080FA694
	cmp r1, #0
	beq _080FA69E
	b _080FA79C
	.align 2, 0
_080FA690: .4byte 0x03005B60
_080FA694:
	cmp r1, #2
	beq _080FA6F6
	cmp r1, #3
	beq _080FA748
	b _080FA79C
_080FA69E:
	ldr r0, _080FA6A4
	strh r1, [r0]
	b _080FA7BE
	.align 2, 0
_080FA6A4: .4byte 0x020377B4
_080FA6A8:
	movs r1, #0
	strh r1, [r4, #0xe]
	movs r0, #0xf0
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	movs r0, #0xa0
	strh r0, [r4, #0x14]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x14]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	b _080FA7BE
_080FA6F6:
	ldrh r0, [r4, #0xc]
	ldrh r2, [r4, #0x12]
	adds r1, r0, r2
	strh r1, [r4, #0x12]
	ldrh r2, [r4, #0x14]
	subs r0, r2, r0
	strh r0, [r4, #0x14]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x4f
	bgt _080FA714
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x51
	bgt _080FA72C
_080FA714:
	movs r0, #0x50
	strh r0, [r4, #0x12]
	movs r0, #0x51
	strh r0, [r4, #0x14]
	movs r0, #0x50
	movs r1, #0xbf
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0x10
	bl SetGpuReg
_080FA72C:
	ldrh r1, [r4, #0x12]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x14]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	bne _080FA7C4
	b _080FA7BE
_080FA748:
	ldrh r0, [r4, #0xa]
	ldrh r2, [r4, #0xe]
	adds r1, r0, r2
	strh r1, [r4, #0xe]
	ldrh r2, [r4, #0x10]
	subs r0, r2, r0
	strh r0, [r4, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x77
	bgt _080FA766
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	bgt _080FA77C
_080FA766:
	movs r0, #0x78
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	subs r0, #0x79
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r1, _080FA798
	movs r0, #0
	strh r0, [r1]
_080FA77C:
	ldrh r1, [r4, #0xe]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x40
	bl SetGpuReg
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bne _080FA7C4
	b _080FA7BE
	.align 2, 0
_080FA798: .4byte 0x020377B4
_080FA79C:
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyTask
	b _080FA7C4
_080FA7BE:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080FA7C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080FA66C

	thumb_func_start SetCurrentSecretBase
SetCurrentSecretBase: @ 0x080FA7CC
	push {lr}
	ldr r0, _080FA7E0
	ldr r1, _080FA7E4
	ldr r1, [r1, #4]
	bl SetCurSecretBaseIdFromPosition
	bl TrySetCurSecretBaseIndex
	pop {r0}
	bx r0
	.align 2, 0
_080FA7E0: .4byte 0x0203A80C
_080FA7E4: .4byte 0x02036FB8
	thumb_func_end SetCurrentSecretBase

	thumb_func_start AdjustSecretPowerSpritePixelOffsets
AdjustSecretPowerSpritePixelOffsets: @ 0x080FA7E8
	push {lr}
	ldr r0, _080FA808
	ldrb r1, [r0]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080FA830
	ldr r1, _080FA80C
	ldr r0, [r1, #4]
	cmp r0, #2
	beq _080FA81E
	cmp r0, #2
	bgt _080FA810
	cmp r0, #1
	beq _080FA816
	b _080FA86E
	.align 2, 0
_080FA808: .4byte 0x02037230
_080FA80C: .4byte 0x020388A8
_080FA810:
	cmp r0, #3
	beq _080FA826
	b _080FA84C
_080FA816:
	movs r0, #0x10
	str r0, [r1, #0x14]
	movs r0, #0x28
	b _080FA86C
_080FA81E:
	movs r0, #0x10
	str r0, [r1, #0x14]
	movs r0, #8
	b _080FA86C
_080FA826:
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [r1, #0x14]
	movs r0, #0x18
	b _080FA86C
_080FA830:
	ldr r1, _080FA844
	ldr r0, [r1, #4]
	cmp r0, #2
	beq _080FA85A
	cmp r0, #2
	bgt _080FA848
	cmp r0, #1
	beq _080FA852
	b _080FA86E
	.align 2, 0
_080FA844: .4byte 0x020388A8
_080FA848:
	cmp r0, #3
	beq _080FA85E
_080FA84C:
	cmp r0, #4
	beq _080FA868
	b _080FA86E
_080FA852:
	movs r0, #8
	str r0, [r1, #0x14]
	movs r0, #0x28
	b _080FA86C
_080FA85A:
	movs r0, #8
	b _080FA86A
_080FA85E:
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [r1, #0x14]
	movs r0, #0x18
	b _080FA86C
_080FA868:
	movs r0, #0x18
_080FA86A:
	str r0, [r1, #0x14]
_080FA86C:
	str r0, [r1, #0x18]
_080FA86E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AdjustSecretPowerSpritePixelOffsets

	thumb_func_start SetUpFieldMove_SecretPower
SetUpFieldMove_SecretPower: @ 0x080FA874
	push {r4, lr}
	bl CheckPlayerHasSecretBase
	ldr r0, _080FA8C8
	ldrh r0, [r0]
	cmp r0, #1
	beq _080FA91E
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _080FA91E
	ldr r4, _080FA8CC
	adds r1, r4, #2
	adds r0, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsSecretBaseCave
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FA8E0
	bl SetCurrentSecretBase
	ldr r1, _080FA8D0
	ldr r0, _080FA8D4
	str r0, [r1]
	ldr r1, _080FA8D8
	ldr r0, _080FA8DC
	b _080FA930
	.align 2, 0
_080FA8C8: .4byte 0x02037290
_080FA8CC: .4byte 0x0203A80C
_080FA8D0: .4byte 0x03005B10
_080FA8D4: .4byte 0x081B53D9
_080FA8D8: .4byte 0x0203CBB8
_080FA8DC: .4byte 0x080FA94D
_080FA8E0:
	adds r0, r4, #0
	bl MetatileBehavior_IsSecretBaseTree
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FA910
	bl SetCurrentSecretBase
	ldr r1, _080FA900
	ldr r0, _080FA904
	str r0, [r1]
	ldr r1, _080FA908
	ldr r0, _080FA90C
	b _080FA930
	.align 2, 0
_080FA900: .4byte 0x03005B10
_080FA904: .4byte 0x081B53D9
_080FA908: .4byte 0x0203CBB8
_080FA90C: .4byte 0x080FAA59
_080FA910:
	adds r0, r4, #0
	bl MetatileBehavior_IsSecretBaseShrub
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080FA922
_080FA91E:
	movs r0, #0
	b _080FA934
_080FA922:
	bl SetCurrentSecretBase
	ldr r1, _080FA93C
	ldr r0, _080FA940
	str r0, [r1]
	ldr r1, _080FA944
	ldr r0, _080FA948
_080FA930:
	str r0, [r1]
	movs r0, #1
_080FA934:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FA93C: .4byte 0x03005B10
_080FA940: .4byte 0x081B53D9
_080FA944: .4byte 0x0203CBB8
_080FA948: .4byte 0x080FABBD
	thumb_func_end SetUpFieldMove_SecretPower

	thumb_func_start FieldCallback_SecretBaseCave
FieldCallback_SecretBaseCave: @ 0x080FA94C
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _080FA964
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	ldr r0, _080FA968
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080FA964: .4byte 0x020388A8
_080FA968: .4byte 0x08245B35
	thumb_func_end FieldCallback_SecretBaseCave

	thumb_func_start FldEff_UseSecretPowerCave
FldEff_UseSecretPowerCave: @ 0x080FA96C
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FA990
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _080FA994
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080FA990: .4byte 0x03005B60
_080FA994: .4byte 0x080FA999
	thumb_func_end FldEff_UseSecretPowerCave

	thumb_func_start StartSecretBaseCaveFieldEffect
StartSecretBaseCaveFieldEffect: @ 0x080FA998
	push {lr}
	movs r0, #0xb
	bl FieldEffectActiveListRemove
	movs r0, #0x37
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartSecretBaseCaveFieldEffect

	thumb_func_start FldEff_SecretPowerCave
FldEff_SecretPowerCave: @ 0x080FA9AC
	push {r4, lr}
	bl AdjustSecretPowerSpritePixelOffsets
	ldr r0, _080FA9EC
	ldr r3, _080FA9F0
	ldr r1, _080FA9F4
	ldrb r1, [r1, #4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r2, #2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #0x17
	ldr r4, _080FA9F8
	ldr r3, [r4, #0x14]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r2, [r2]
	ldr r3, [r4, #0x18]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0x94
	bl CreateSprite
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FA9EC: .4byte 0x0856A1E4
_080FA9F0: .4byte 0x020205AC
_080FA9F4: .4byte 0x02037230
_080FA9F8: .4byte 0x020388A8
	thumb_func_end FldEff_SecretPowerCave

	thumb_func_start CaveEntranceSpriteCallback1
CaveEntranceSpriteCallback1: @ 0x080FA9FC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x83
	bl PlaySE
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r0, _080FAA14
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAA14: .4byte 0x080FAA19
	thumb_func_end CaveEntranceSpriteCallback1

	thumb_func_start ShrubEntranceSpriteCallback2
ShrubEntranceSpriteCallback2: @ 0x080FAA18
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	cmp r0, #0x27
	bgt _080FAA38
	adds r0, r2, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _080FAA40
	bl ToggleSecretBaseEntranceMetatile
	b _080FAA40
_080FAA38:
	movs r0, #0
	strh r0, [r1, #0x2e]
	ldr r0, _080FAA44
	str r0, [r1, #0x1c]
_080FAA40:
	pop {r0}
	bx r0
	.align 2, 0
_080FAA44: .4byte 0x080FAA49
	thumb_func_end ShrubEntranceSpriteCallback2

	thumb_func_start CaveEntranceSpriteCallbackEnd
CaveEntranceSpriteCallbackEnd: @ 0x080FAA48
	push {lr}
	movs r1, #0x37
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end CaveEntranceSpriteCallbackEnd

	thumb_func_start FieldCallback_SecretBaseShrub
FieldCallback_SecretBaseShrub: @ 0x080FAA58
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _080FAA70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	ldr r0, _080FAA74
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080FAA70: .4byte 0x020388A8
_080FAA74: .4byte 0x08245B8E
	thumb_func_end FieldCallback_SecretBaseShrub

	thumb_func_start FldEff_UseSecretPowerShrub
FldEff_UseSecretPowerShrub: @ 0x080FAA78
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FAA9C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _080FAAA0
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080FAA9C: .4byte 0x03005B60
_080FAAA0: .4byte 0x080FAAA5
	thumb_func_end FldEff_UseSecretPowerShrub

	thumb_func_start StartSecretBaseTreeFieldEffect
StartSecretBaseTreeFieldEffect: @ 0x080FAAA4
	push {lr}
	movs r0, #0x1a
	bl FieldEffectActiveListRemove
	movs r0, #0x38
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartSecretBaseTreeFieldEffect

	thumb_func_start FldEff_SecretPowerTree
FldEff_SecretPowerTree: @ 0x080FAAB8
	push {r4, lr}
	ldr r1, _080FAB30
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r2, r0, #0
	ldr r1, _080FAB34
	adds r0, r1, #0
	ands r2, r0
	cmp r2, #0x96
	bne _080FAADA
	ldr r1, _080FAB38
	movs r0, #0
	str r0, [r1, #0x1c]
_080FAADA:
	cmp r2, #0x9c
	bne _080FAAE4
	ldr r1, _080FAB38
	movs r0, #2
	str r0, [r1, #0x1c]
_080FAAE4:
	bl AdjustSecretPowerSpritePixelOffsets
	ldr r0, _080FAB3C
	ldr r3, _080FAB40
	ldr r1, _080FAB44
	ldrb r1, [r1, #4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r2, #2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #0x17
	ldr r4, _080FAB38
	ldr r3, [r4, #0x14]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r2, [r2]
	ldr r3, [r4, #0x18]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0x94
	bl CreateSprite
	ldr r0, [r4, #0x1c]
	cmp r0, #1
	beq _080FAB22
	cmp r0, #3
	bne _080FAB26
_080FAB22:
	bl ToggleSecretBaseEntranceMetatile
_080FAB26:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FAB30: .4byte 0x0203A80C
_080FAB34: .4byte 0x00000FFF
_080FAB38: .4byte 0x020388A8
_080FAB3C: .4byte 0x0856A1FC
_080FAB40: .4byte 0x020205AC
_080FAB44: .4byte 0x02037230
	thumb_func_end FldEff_SecretPowerTree

	thumb_func_start TreeEntranceSpriteCallback1
TreeEntranceSpriteCallback1: @ 0x080FAB48
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x9b
	bl PlaySE
	ldr r0, _080FAB6C
	ldr r1, [r0, #0x1c]
	adds r2, r4, #0
	adds r2, #0x2a
	movs r0, #0
	strb r1, [r2]
	strh r0, [r4, #0x2e]
	ldr r0, _080FAB70
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAB6C: .4byte 0x020388A8
_080FAB70: .4byte 0x080FAB75
	thumb_func_end TreeEntranceSpriteCallback1

	thumb_func_start TreeEntranceSpriteCallback2
TreeEntranceSpriteCallback2: @ 0x080FAB74
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	ble _080FAB9E
	ldr r0, _080FABA4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _080FAB92
	cmp r0, #2
	bne _080FAB96
_080FAB92:
	bl ToggleSecretBaseEntranceMetatile
_080FAB96:
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r0, _080FABA8
	str r0, [r4, #0x1c]
_080FAB9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FABA4: .4byte 0x020388A8
_080FABA8: .4byte 0x080FABAD
	thumb_func_end TreeEntranceSpriteCallback2

	thumb_func_start TreeEntranceSpriteCallbackEnd
TreeEntranceSpriteCallbackEnd: @ 0x080FABAC
	push {lr}
	movs r1, #0x38
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end TreeEntranceSpriteCallbackEnd

	thumb_func_start FieldCallback_SecretBaseTree
FieldCallback_SecretBaseTree: @ 0x080FABBC
	push {lr}
	bl GetCursorSelectionMonId
	ldr r1, _080FABD4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	ldr r0, _080FABD8
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080FABD4: .4byte 0x020388A8
_080FABD8: .4byte 0x08245BE7
	thumb_func_end FieldCallback_SecretBaseTree

	thumb_func_start FldEff_UseSecretPowerTree
FldEff_UseSecretPowerTree: @ 0x080FABDC
	push {lr}
	bl oei_task_add
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FAC00
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _080FAC04
	lsrs r0, r2, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080FAC00: .4byte 0x03005B60
_080FAC04: .4byte 0x080FAC09
	thumb_func_end FldEff_UseSecretPowerTree

	thumb_func_start StartSecretBaseShrubFieldEffect
StartSecretBaseShrubFieldEffect: @ 0x080FAC08
	push {lr}
	movs r0, #0x1b
	bl FieldEffectActiveListRemove
	movs r0, #0x39
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartSecretBaseShrubFieldEffect

	thumb_func_start FldEff_SecretPowerShrub
FldEff_SecretPowerShrub: @ 0x080FAC1C
	push {r4, lr}
	bl AdjustSecretPowerSpritePixelOffsets
	ldr r0, _080FAC5C
	ldr r3, _080FAC60
	ldr r1, _080FAC64
	ldrb r1, [r1, #4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r2, #2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #0x17
	ldr r4, _080FAC68
	ldr r3, [r4, #0x14]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r2, [r2]
	ldr r3, [r4, #0x18]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0x94
	bl CreateSprite
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FAC5C: .4byte 0x0856A214
_080FAC60: .4byte 0x020205AC
_080FAC64: .4byte 0x02037230
_080FAC68: .4byte 0x020388A8
	thumb_func_end FldEff_SecretPowerShrub

	thumb_func_start ShrubEntranceSpriteCallback1
ShrubEntranceSpriteCallback1: @ 0x080FAC6C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa9
	bl PlaySE
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r0, _080FAC84
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAC84: .4byte 0x080FAC89
	thumb_func_end ShrubEntranceSpriteCallback1

	thumb_func_start CaveEntranceSpriteCallback2
CaveEntranceSpriteCallback2: @ 0x080FAC88
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	cmp r0, #0x27
	bgt _080FACA8
	adds r0, r2, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _080FACB0
	bl ToggleSecretBaseEntranceMetatile
	b _080FACB0
_080FACA8:
	movs r0, #0
	strh r0, [r1, #0x2e]
	ldr r0, _080FACB4
	str r0, [r1, #0x1c]
_080FACB0:
	pop {r0}
	bx r0
	.align 2, 0
_080FACB4: .4byte 0x080FACB9
	thumb_func_end CaveEntranceSpriteCallback2

	thumb_func_start ShrubEntranceSpriteCallbackEnd
ShrubEntranceSpriteCallbackEnd: @ 0x080FACB8
	push {lr}
	movs r1, #0x39
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end ShrubEntranceSpriteCallbackEnd

	thumb_func_start FldEff_SecretBasePCTurnOn
FldEff_SecretBasePCTurnOn: @ 0x080FACC8
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _080FAD08
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FAD0C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	mov r0, sp
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r1, #8]
	ldrh r0, [r4]
	strh r0, [r1, #0xa]
	strh r2, [r1, #0xc]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FAD08: .4byte 0x080FAD11
_080FAD0C: .4byte 0x03005B60
	thumb_func_end FldEff_SecretBasePCTurnOn

	thumb_func_start Task_SecretBasePCTurnOn
Task_SecretBasePCTurnOn: @ 0x080FAD10
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080FAD38
	adds r4, r0, r1
	ldrh r0, [r4, #4]
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bhi _080FADDE
	lsls r0, r0, #2
	ldr r1, _080FAD3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FAD38: .4byte 0x03005B68
_080FAD3C: .4byte 0x080FAD40
_080FAD40: @ jump table
	.4byte _080FAD84 @ case 0
	.4byte _080FADDE @ case 1
	.4byte _080FADDE @ case 2
	.4byte _080FADDE @ case 3
	.4byte _080FAD92 @ case 4
	.4byte _080FADDE @ case 5
	.4byte _080FADDE @ case 6
	.4byte _080FADDE @ case 7
	.4byte _080FAD84 @ case 8
	.4byte _080FADDE @ case 9
	.4byte _080FADDE @ case 10
	.4byte _080FADDE @ case 11
	.4byte _080FAD92 @ case 12
	.4byte _080FADDE @ case 13
	.4byte _080FADDE @ case 14
	.4byte _080FADDE @ case 15
	.4byte _080FADB0 @ case 16
_080FAD84:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0x89
	lsls r2, r2, #2
	b _080FAD9E
_080FAD92:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0x88
	lsls r2, r2, #2
_080FAD9E:
	bl MapGridSetMetatileIdAt
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	b _080FADDE
_080FADB0:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0x89
	lsls r2, r2, #2
	bl MapGridSetMetatileIdAt
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r0, #0x3d
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	adds r0, r5, #0
	bl DestroyTask
	b _080FADE4
_080FADDE:
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
_080FADE4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_SecretBasePCTurnOn

	thumb_func_start DoSecretBasePCTurnOffEffect
DoSecretBasePCTurnOffEffect: @ 0x080FADEC
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r0, #3
	bl PlaySE
	ldr r0, _080FAE24
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080FAE28
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0xe2
	lsls r2, r2, #4
	bl MapGridSetMetatileIdAt
	b _080FAE38
	.align 2, 0
_080FAE24: .4byte 0x00004054
_080FAE28:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r2, _080FAE50
	bl MapGridSetMetatileIdAt
_080FAE38:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAE50: .4byte 0x00000E21
	thumb_func_end DoSecretBasePCTurnOffEffect

	thumb_func_start PopSecretBaseBalloon
PopSecretBaseBalloon: @ 0x080FAE54
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080FAE94
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FAE98
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r4, [r1, #8]
	strh r5, [r1, #0xa]
	strh r6, [r1, #0xc]
	strh r0, [r1, #0xe]
	movs r0, #1
	strh r0, [r1, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FAE94: .4byte 0x080FAE9D
_080FAE98: .4byte 0x03005B60
	thumb_func_end PopSecretBaseBalloon

	thumb_func_start Task_PopSecretBaseBalloon
Task_PopSecretBaseBalloon: @ 0x080FAE9C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080FAEBC
	adds r4, r0, r1
	ldrh r1, [r4, #6]
	movs r2, #6
	ldrsh r0, [r4, r2]
	cmp r0, #6
	bne _080FAEC0
	movs r0, #0
	b _080FAEC2
	.align 2, 0
_080FAEBC: .4byte 0x03005B68
_080FAEC0:
	adds r0, r1, #1
_080FAEC2:
	strh r0, [r4, #6]
	movs r3, #6
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _080FAF14
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne _080FAEDC
	movs r2, #0
	ldrsh r0, [r4, r2]
	bl DoBalloonSoundEffect
_080FAEDC:
	movs r3, #2
	ldrsh r0, [r4, r3]
	movs r2, #4
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #8]
	ldrh r3, [r4]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl MapGridSetMetatileIdAt
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r2, #4
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldrh r1, [r4, #8]
	movs r3, #8
	ldrsh r0, [r4, r3]
	cmp r0, #3
	bne _080FAF10
	adds r0, r5, #0
	bl DestroyTask
	b _080FAF14
_080FAF10:
	adds r0, r1, #1
	strh r0, [r4, #8]
_080FAF14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_PopSecretBaseBalloon

	thumb_func_start DoBalloonSoundEffect
DoBalloonSoundEffect: @ 0x080FAF1C
	push {lr}
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #0xce
	lsls r0, r0, #2
	cmp r1, r0
	beq _080FAF48
	cmp r1, r0
	bgt _080FAF38
	movs r0, #0x8a
	lsls r0, r0, #2
	cmp r1, r0
	beq _080FAF60
	b _080FAF66
_080FAF38:
	movs r0, #0xcf
	lsls r0, r0, #2
	cmp r1, r0
	beq _080FAF50
	adds r0, #4
	cmp r1, r0
	beq _080FAF58
	b _080FAF66
_080FAF48:
	movs r0, #0x4a
	bl PlaySE
	b _080FAF66
_080FAF50:
	movs r0, #0x4b
	bl PlaySE
	b _080FAF66
_080FAF58:
	movs r0, #0x4c
	bl PlaySE
	b _080FAF66
_080FAF60:
	movs r0, #0x4e
	bl PlaySE
_080FAF66:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DoBalloonSoundEffect

	thumb_func_start FldEff_NopA700
FldEff_NopA700: @ 0x080FAF6C
	movs r0, #0
	bx lr
	thumb_func_end FldEff_NopA700

	thumb_func_start FldEff_NopA6FC
FldEff_NopA6FC: @ 0x080FAF70
	movs r0, #0
	bx lr
	thumb_func_end FldEff_NopA6FC

	thumb_func_start DoSecretBaseBreakableDoorEffect
DoSecretBaseBreakableDoorEffect: @ 0x080FAF74
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0x4d
	bl PlaySE
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _080FAFBC
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridSetMetatileIdAt
	subs r6, r4, #1
	ldr r2, _080FAFC0
	adds r0, r5, #0
	adds r1, r6, #0
	bl MapGridSetMetatileIdAt
	adds r0, r5, #0
	adds r1, r4, #0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, #0
	adds r1, r6, #0
	bl CurrentMapDrawMetatileAt
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FAFBC: .4byte 0x00000276
_080FAFC0: .4byte 0x0000026E
	thumb_func_end DoSecretBaseBreakableDoorEffect

	thumb_func_start Task_ShatterSecretBaseBreakableDoor
Task_ShatterSecretBaseBreakableDoor: @ 0x080FAFC4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080FAFF4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #8]
	movs r3, #8
	ldrsh r0, [r1, r3]
	cmp r0, #7
	bne _080FAFF8
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	movs r3, #0xc
	ldrsh r1, [r1, r3]
	bl DoSecretBaseBreakableDoorEffect
	adds r0, r4, #0
	bl DestroyTask
	b _080FAFFC
	.align 2, 0
_080FAFF4: .4byte 0x03005B60
_080FAFF8:
	adds r0, r2, #1
	strh r0, [r1, #8]
_080FAFFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_ShatterSecretBaseBreakableDoor

	thumb_func_start ShatterSecretBaseBreakableDoor
ShatterSecretBaseBreakableDoor: @ 0x080FB004
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r7, r5, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r6, r4, #0
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FB02C
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl DoSecretBaseBreakableDoorEffect
	b _080FB04E
_080FB02C:
	cmp r0, #2
	bne _080FB04E
	ldr r0, _080FB054
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FB058
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	strh r7, [r1, #0xa]
	strh r6, [r1, #0xc]
_080FB04E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB054: .4byte 0x080FAFC5
_080FB058: .4byte 0x03005B60
	thumb_func_end ShatterSecretBaseBreakableDoor

	thumb_func_start Task_SecretBaseMusicNoteMatSound
Task_SecretBaseMusicNoteMatSound: @ 0x080FB05C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080FB094
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0xa]
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #7
	beq _080FB078
	b _080FB1D6
_080FB078:
	ldr r2, _080FB098
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	bls _080FB08A
	b _080FB1CE
_080FB08A:
	lsls r0, r0, #2
	ldr r1, _080FB09C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FB094: .4byte 0x03005B60
_080FB098: .4byte 0xFFFFFD88
_080FB09C: .4byte 0x080FB0A0
_080FB0A0: @ jump table
	.4byte _080FB190 @ case 0
	.4byte _080FB198 @ case 1
	.4byte _080FB1A0 @ case 2
	.4byte _080FB1A8 @ case 3
	.4byte _080FB1B0 @ case 4
	.4byte _080FB1B8 @ case 5
	.4byte _080FB1C0 @ case 6
	.4byte _080FB1CE @ case 7
	.4byte _080FB1CE @ case 8
	.4byte _080FB1CE @ case 9
	.4byte _080FB1CE @ case 10
	.4byte _080FB1CE @ case 11
	.4byte _080FB1CE @ case 12
	.4byte _080FB1CE @ case 13
	.4byte _080FB1CE @ case 14
	.4byte _080FB1CE @ case 15
	.4byte _080FB1CE @ case 16
	.4byte _080FB1CE @ case 17
	.4byte _080FB1CE @ case 18
	.4byte _080FB1CE @ case 19
	.4byte _080FB1CE @ case 20
	.4byte _080FB1CE @ case 21
	.4byte _080FB1CE @ case 22
	.4byte _080FB1CE @ case 23
	.4byte _080FB1CE @ case 24
	.4byte _080FB1CE @ case 25
	.4byte _080FB1CE @ case 26
	.4byte _080FB1CE @ case 27
	.4byte _080FB1CE @ case 28
	.4byte _080FB1CE @ case 29
	.4byte _080FB1CE @ case 30
	.4byte _080FB1CE @ case 31
	.4byte _080FB1CE @ case 32
	.4byte _080FB1CE @ case 33
	.4byte _080FB1CE @ case 34
	.4byte _080FB1CE @ case 35
	.4byte _080FB1CE @ case 36
	.4byte _080FB1CE @ case 37
	.4byte _080FB1CE @ case 38
	.4byte _080FB1CE @ case 39
	.4byte _080FB1CE @ case 40
	.4byte _080FB1CE @ case 41
	.4byte _080FB1CE @ case 42
	.4byte _080FB1CE @ case 43
	.4byte _080FB1CE @ case 44
	.4byte _080FB1CE @ case 45
	.4byte _080FB1CE @ case 46
	.4byte _080FB1CE @ case 47
	.4byte _080FB1CE @ case 48
	.4byte _080FB1CE @ case 49
	.4byte _080FB1CE @ case 50
	.4byte _080FB1CE @ case 51
	.4byte _080FB1CE @ case 52
	.4byte _080FB1CE @ case 53
	.4byte _080FB1CE @ case 54
	.4byte _080FB1CE @ case 55
	.4byte _080FB1CE @ case 56
	.4byte _080FB1CE @ case 57
	.4byte _080FB1CE @ case 58
	.4byte _080FB1C8 @ case 59
_080FB190:
	movs r0, #0x3e
	bl PlaySE
	b _080FB1CE
_080FB198:
	movs r0, #0x3f
	bl PlaySE
	b _080FB1CE
_080FB1A0:
	movs r0, #0x40
	bl PlaySE
	b _080FB1CE
_080FB1A8:
	movs r0, #0x41
	bl PlaySE
	b _080FB1CE
_080FB1B0:
	movs r0, #0x42
	bl PlaySE
	b _080FB1CE
_080FB1B8:
	movs r0, #0x43
	bl PlaySE
	b _080FB1CE
_080FB1C0:
	movs r0, #0x44
	bl PlaySE
	b _080FB1CE
_080FB1C8:
	movs r0, #0x45
	bl PlaySE
_080FB1CE:
	adds r0, r4, #0
	bl DestroyTask
	b _080FB1DA
_080FB1D6:
	adds r0, r2, #1
	strh r0, [r1, #0xa]
_080FB1DA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_SecretBaseMusicNoteMatSound

	thumb_func_start PlaySecretBaseMusicNoteMatSound
PlaySecretBaseMusicNoteMatSound: @ 0x080FB1E0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080FB20C
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FB210
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r4, [r1, #8]
	strh r0, [r1, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FB20C: .4byte 0x080FB05D
_080FB210: .4byte 0x03005B60
	thumb_func_end PlaySecretBaseMusicNoteMatSound

	thumb_func_start SpriteCB_GlitterMatSparkle
SpriteCB_GlitterMatSparkle: @ 0x080FB214
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _080FB22C
	movs r0, #0xc3
	bl PlaySE
_080FB22C:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x1f
	ble _080FB23A
	adds r0, r4, #0
	bl DestroySprite
_080FB23A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_GlitterMatSparkle

	thumb_func_start DoSecretBaseGlitterMatSparkle
DoSecretBaseGlitterMatSparkle: @ 0x080FB240
	push {r4, lr}
	sub sp, #4
	ldr r3, _080FB2D8
	ldr r2, _080FB2DC
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x10]
	mov r0, sp
	strh r1, [r0]
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #0x12]
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #8
	movs r3, #4
	bl sub_08092A50
	ldr r0, _080FB2E0
	ldr r0, [r0, #0x58]
	mov r1, sp
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080FB2CE
	ldr r3, _080FB2E4
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r4, r2, r3
	movs r0, #0x3e
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	movs r1, #2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #0xf
	ands r0, r1
	movs r1, #0x50
	orrs r0, r1
	strb r0, [r4, #5]
	adds r3, #0x1c
	adds r2, r2, r3
	ldr r0, _080FB2E8
	str r0, [r2]
	movs r0, #0
	strh r0, [r4, #0x2e]
_080FB2CE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FB2D8: .4byte 0x02036FF0
_080FB2DC: .4byte 0x02037230
_080FB2E0: .4byte 0x084DDE4C
_080FB2E4: .4byte 0x020205AC
_080FB2E8: .4byte 0x080FB215
	thumb_func_end DoSecretBaseGlitterMatSparkle

	thumb_func_start FldEff_SandPillar
FldEff_SandPillar: @ 0x080FB2EC
	push {r4, lr}
	sub sp, #4
	bl ScriptContext2_Enable
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r1, _080FB328
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1, #0x14]
	movs r3, #0
	ldrsh r0, [r4, r3]
	str r0, [r1, #0x18]
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _080FB36C
	cmp r0, #2
	bgt _080FB32C
	cmp r0, #1
	beq _080FB336
	b _080FB3FC
	.align 2, 0
_080FB328: .4byte 0x020388A8
_080FB32C:
	cmp r0, #3
	beq _080FB39C
	cmp r0, #4
	beq _080FB3D4
	b _080FB3FC
_080FB336:
	ldr r0, _080FB360
	ldr r3, _080FB364
	ldr r1, _080FB368
	ldrb r1, [r1, #4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r2, #2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #7
	movs r3, #0x80
	lsls r3, r3, #0xc
	adds r1, r1, r3
	asrs r1, r1, #0x10
	ldrb r2, [r2]
	adds r2, #0x20
	movs r3, #0
	bl CreateSprite
	b _080FB3FC
	.align 2, 0
_080FB360: .4byte 0x0856A270
_080FB364: .4byte 0x020205AC
_080FB368: .4byte 0x02037230
_080FB36C:
	ldr r0, _080FB390
	ldr r3, _080FB394
	ldr r1, _080FB398
	ldrb r1, [r1, #4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r2, #2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #7
	movs r3, #0x80
	lsls r3, r3, #0xc
	adds r1, r1, r3
	asrs r1, r1, #0x10
	ldrb r2, [r2]
	b _080FB3BC
	.align 2, 0
_080FB390: .4byte 0x0856A270
_080FB394: .4byte 0x020205AC
_080FB398: .4byte 0x02037230
_080FB39C:
	ldr r0, _080FB3C4
	ldr r3, _080FB3C8
	ldr r1, _080FB3CC
	ldrb r1, [r1, #4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r2, #2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #7
	ldr r3, _080FB3D0
	adds r1, r1, r3
	asrs r1, r1, #0x10
	ldrb r2, [r2]
	adds r2, #0x10
_080FB3BC:
	movs r3, #0x94
	bl CreateSprite
	b _080FB3FC
	.align 2, 0
_080FB3C4: .4byte 0x0856A270
_080FB3C8: .4byte 0x020205AC
_080FB3CC: .4byte 0x02037230
_080FB3D0: .4byte 0xFFF80000
_080FB3D4:
	ldr r0, _080FB408
	ldr r3, _080FB40C
	ldr r1, _080FB410
	ldrb r1, [r1, #4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r2, #2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #7
	movs r3, #0xc0
	lsls r3, r3, #0xd
	adds r1, r1, r3
	asrs r1, r1, #0x10
	ldrb r2, [r2]
	adds r2, #0x10
	movs r3, #0x94
	bl CreateSprite
_080FB3FC:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FB408: .4byte 0x0856A270
_080FB40C: .4byte 0x020205AC
_080FB410: .4byte 0x02037230
	thumb_func_end FldEff_SandPillar

	thumb_func_start SpriteCB_SandPillar_0
SpriteCB_SandPillar_0: @ 0x080FB414
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x83
	bl PlaySE
	ldr r4, _080FB440
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	subs r1, #1
	bl MapGridGetMetatileIdAt
	ldr r1, _080FB444
	cmp r0, r1
	bne _080FB44C
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	subs r1, #1
	ldr r2, _080FB448
	bl MapGridSetMetatileIdAt
	b _080FB45A
	.align 2, 0
_080FB440: .4byte 0x020388A8
_080FB444: .4byte 0x00000286
_080FB448: .4byte 0x00000E02
_080FB44C:
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	subs r1, #1
	movs r2, #0xa1
	lsls r2, r2, #2
	bl MapGridSetMetatileIdAt
_080FB45A:
	ldr r4, _080FB488
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, _080FB48C
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	subs r1, #1
	bl CurrentMapDrawMetatileAt
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, #0
	strh r0, [r5, #0x2e]
	ldr r0, _080FB490
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FB488: .4byte 0x020388A8
_080FB48C: .4byte 0x0000020A
_080FB490: .4byte 0x080FB495
	thumb_func_end SpriteCB_SandPillar_0

	thumb_func_start SpriteCB_SandPillar_1
SpriteCB_SandPillar_1: @ 0x080FB494
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0x11
	bgt _080FB4A8
	adds r0, r1, #1
	strh r0, [r5, #0x2e]
	b _080FB4C4
_080FB4A8:
	ldr r4, _080FB4CC
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, _080FB4D0
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, #0
	strh r0, [r5, #0x2e]
	ldr r0, _080FB4D4
	str r0, [r5, #0x1c]
_080FB4C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FB4CC: .4byte 0x020388A8
_080FB4D0: .4byte 0x00000E8C
_080FB4D4: .4byte 0x080FB4D9
	thumb_func_end SpriteCB_SandPillar_1

	thumb_func_start SpriteCB_SandPillar_2
SpriteCB_SandPillar_2: @ 0x080FB4D8
	push {lr}
	movs r1, #0x34
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_SandPillar_2

	thumb_func_start GetShieldToyTVDecorationInfo
GetShieldToyTVDecorationInfo: @ 0x080FB4E8
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	adds r1, r0, #0
	ldr r0, _080FB520
	cmp r1, r0
	beq _080FB5DC
	cmp r1, r0
	bgt _080FB524
	subs r0, #0x17
	cmp r1, r0
	beq _080FB584
	adds r0, #0x16
	cmp r1, r0
	beq _080FB5D0
	b _080FB63E
	.align 2, 0
_080FB520: .4byte 0x000002F5
_080FB524:
	ldr r0, _080FB568
	cmp r1, r0
	beq _080FB614
	adds r0, #0x40
	cmp r1, r0
	beq _080FB532
	b _080FB63E
_080FB532:
	ldr r0, _080FB56C
	movs r1, #0x64
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, _080FB570
	ldr r1, _080FB574
	bl StringCopy
	ldr r1, _080FB578
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080FB57C
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080FB63E
	ldr r4, _080FB580
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x10
	b _080FB5FA
	.align 2, 0
_080FB568: .4byte 0x000002F6
_080FB56C: .4byte 0x02021C40
_080FB570: .4byte 0x02021C54
_080FB574: .4byte 0x085CA73F
_080FB578: .4byte 0x02037290
_080FB57C: .4byte 0x00004054
_080FB580: .4byte 0x000040EE
_080FB584:
	ldr r0, _080FB5B8
	movs r1, #0x32
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _080FB5BC
	ldr r1, _080FB5C0
	bl StringCopy
	ldr r1, _080FB5C4
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080FB5C8
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080FB63E
	ldr r4, _080FB5CC
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x20
	b _080FB5FA
	.align 2, 0
_080FB5B8: .4byte 0x02021C40
_080FB5BC: .4byte 0x02021C54
_080FB5C0: .4byte 0x085CA742
_080FB5C4: .4byte 0x02037290
_080FB5C8: .4byte 0x00004054
_080FB5CC: .4byte 0x000040EE
_080FB5D0:
	ldr r1, _080FB5D8
	movs r0, #1
	b _080FB5E0
	.align 2, 0
_080FB5D8: .4byte 0x02037290
_080FB5DC:
	ldr r1, _080FB608
	movs r0, #2
_080FB5E0:
	strh r0, [r1]
	ldr r0, _080FB60C
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080FB63E
	ldr r4, _080FB610
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x80
_080FB5FA:
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	b _080FB63E
	.align 2, 0
_080FB608: .4byte 0x02037290
_080FB60C: .4byte 0x00004054
_080FB610: .4byte 0x000040EE
_080FB614:
	ldr r1, _080FB648
	movs r0, #3
	strh r0, [r1]
	ldr r0, _080FB64C
	bl VarGet
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080FB63E
	ldr r4, _080FB650
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r0, #0x80
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
_080FB63E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FB648: .4byte 0x02037290
_080FB64C: .4byte 0x00004054
_080FB650: .4byte 0x000040EE
	thumb_func_end GetShieldToyTVDecorationInfo

	thumb_func_start sub_080FB654
sub_080FB654: @ 0x080FB654
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, r4, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl CurMapIsSecretBase
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FB698
	cmp r5, #0
	bne _080FB68C
	ldr r1, _080FB684
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080FB680
	ldr r0, _080FB688
	cmp r4, r0
	bne _080FB698
_080FB680:
	movs r0, #1
	b _080FB69A
	.align 2, 0
_080FB684: .4byte 0xFFFFFD7B
_080FB688: .4byte 0x00000237
_080FB68C:
	ldr r0, _080FB6A0
	cmp r4, r0
	beq _080FB680
	ldr r0, _080FB6A4
	cmp r6, r0
	beq _080FB680
_080FB698:
	movs r0, #0
_080FB69A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080FB6A0: .4byte 0x0000028D
_080FB6A4: .4byte 0x0000023F
	thumb_func_end sub_080FB654

	thumb_func_start Task_FieldPoisonEffect
Task_FieldPoisonEffect: @ 0x080FB6A8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080FB6CC
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #1
	beq _080FB6E6
	cmp r0, #1
	bgt _080FB6D0
	cmp r0, #0
	beq _080FB6D6
	b _080FB702
	.align 2, 0
_080FB6CC: .4byte 0x03005B68
_080FB6D0:
	cmp r0, #2
	beq _080FB6FA
	b _080FB702
_080FB6D6:
	ldrh r0, [r1, #2]
	adds r0, #2
	strh r0, [r1, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080FB702
	b _080FB6F2
_080FB6E6:
	ldrh r0, [r1, #2]
	subs r0, #2
	strh r0, [r1, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080FB702
_080FB6F2:
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _080FB702
_080FB6FA:
	adds r0, r2, #0
	bl DestroyTask
	b _080FB712
_080FB702:
	ldrh r0, [r1, #2]
	lsls r1, r0, #4
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x4c
	bl SetGpuReg
_080FB712:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_FieldPoisonEffect

	thumb_func_start FldEffPoison_Start
FldEffPoison_Start: @ 0x080FB718
	push {lr}
	movs r0, #0x4f
	bl PlaySE
	ldr r0, _080FB72C
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080FB72C: .4byte 0x080FB6A9
	thumb_func_end FldEffPoison_Start

	thumb_func_start sub_080FB730
sub_080FB730: @ 0x080FB730
	push {lr}
	ldr r0, _080FB740
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080FB740: .4byte 0x080FB6A9
	thumb_func_end sub_080FB730

	thumb_func_start Task_WateringBerryTreeAnim_0
Task_WateringBerryTreeAnim_0: @ 0x080FB744
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FB758
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _080FB75C
	str r0, [r1]
	bx lr
	.align 2, 0
_080FB758: .4byte 0x03005B60
_080FB75C: .4byte 0x080FB761
	thumb_func_end Task_WateringBerryTreeAnim_0

	thumb_func_start Task_WateringBerryTreeAnim_1
Task_WateringBerryTreeAnim_1: @ 0x080FB760
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080FB7C4
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080FB7C8
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FB78C
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FB7BE
_080FB78C:
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0808BB8C
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092F08
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	ldr r1, _080FB7CC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080FB7D0
	str r1, [r0]
_080FB7BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FB7C4: .4byte 0x02037230
_080FB7C8: .4byte 0x02036FF0
_080FB7CC: .4byte 0x03005B60
_080FB7D0: .4byte 0x080FB7D5
	thumb_func_end Task_WateringBerryTreeAnim_1

	thumb_func_start Task_WateringBerryTreeAnim_2
Task_WateringBerryTreeAnim_2: @ 0x080FB7D4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080FB828
	ldrb r1, [r0, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080FB82C
	adds r5, r0, r1
	adds r0, r5, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FB838
	ldr r1, _080FB830
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #0xa]
	adds r1, r0, #1
	strh r1, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bgt _080FB834
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092F08
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl EventObjectSetHeldMovement
	b _080FB838
	.align 2, 0
_080FB828: .4byte 0x02037230
_080FB82C: .4byte 0x02036FF0
_080FB830: .4byte 0x03005B60
_080FB834:
	ldr r0, _080FB840
	str r0, [r2]
_080FB838:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FB840: .4byte 0x080FB845
	thumb_func_end Task_WateringBerryTreeAnim_2

	thumb_func_start Task_WateringBerryTreeAnim_3
Task_WateringBerryTreeAnim_3: @ 0x080FB844
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_0808B634
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetPlayerAvatarTransitionFlags
	adds r0, r4, #0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_WateringBerryTreeAnim_3

	thumb_func_start DoWateringBerryTreeAnim
DoWateringBerryTreeAnim: @ 0x080FB868
	push {lr}
	ldr r0, _080FB878
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080FB878: .4byte 0x080FB745
	thumb_func_end DoWateringBerryTreeAnim

	thumb_func_start CreateRecordMixingSprite
CreateRecordMixingSprite: @ 0x080FB87C
	push {r4, r5, lr}
	ldr r0, _080FB8D0
	bl LoadSpritePalette
	ldr r0, _080FB8D4
	movs r1, #0
	movs r2, #0
	movs r3, #0x52
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x40
	beq _080FB8DC
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _080FB8D8
	adds r4, r0, r1
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	movs r0, #0x10
	movs r1, #0xd
	bl sub_08092960
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x20]
	adds r0, #0x10
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x22]
	adds r0, #2
	strh r0, [r4, #0x22]
	adds r0, r5, #0
	b _080FB8DE
	.align 2, 0
_080FB8D0: .4byte 0x0856A448
_080FB8D4: .4byte 0x0856A464
_080FB8D8: .4byte 0x020205AC
_080FB8DC:
	movs r0, #0x40
_080FB8DE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CreateRecordMixingSprite

	thumb_func_start DestroyRecordMixingSprite
DestroyRecordMixingSprite: @ 0x080FB8E4
	push {r4, r5, r6, r7, lr}
	ldr r4, _080FB918
	adds r7, r4, #0
	movs r6, #0
	movs r5, #0x3f
_080FB8EE:
	adds r0, r7, #0
	adds r0, #0x14
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, _080FB91C
	cmp r1, r0
	bne _080FB908
	adds r0, r4, #0
	bl FreeSpritePalette
	adds r0, r4, #0
	bl DestroySprite
_080FB908:
	adds r4, #0x44
	adds r6, #0x44
	subs r5, #1
	cmp r5, #0
	bge _080FB8EE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB918: .4byte 0x020205AC
_080FB91C: .4byte 0x0856A464
	thumb_func_end DestroyRecordMixingSprite

