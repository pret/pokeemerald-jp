.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start Clouds_InitVars
Clouds_InitVars: @ 0x080ABD34
	push {lr}
	ldr r0, _080ABD6C
	ldr r0, [r0]
	ldr r2, _080ABD70
	adds r1, r0, r2
	movs r2, #0
	strb r2, [r1]
	ldr r1, _080ABD74
	adds r3, r0, r1
	movs r1, #0x14
	strb r1, [r3]
	ldr r3, _080ABD78
	adds r1, r0, r3
	strb r2, [r1]
	subs r3, #6
	adds r1, r0, r3
	strh r2, [r1]
	ldr r1, _080ABD7C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ABD68
	movs r0, #0
	movs r1, #0x10
	bl Weather_SetBlendCoeffs
_080ABD68:
	pop {r0}
	bx r0
	.align 2, 0
_080ABD6C: .4byte 0x08526DE8
_080ABD70: .4byte 0x000006C1
_080ABD74: .4byte 0x000006C2
_080ABD78: .4byte 0x000006D2
_080ABD7C: .4byte 0x000006DE
	thumb_func_end Clouds_InitVars

	thumb_func_start Clouds_InitAll
Clouds_InitAll: @ 0x080ABD80
	push {r4, lr}
	bl Clouds_InitVars
	ldr r0, _080ABDA8
	ldr r1, [r0]
	ldr r2, _080ABDAC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ABDA0
	adds r4, r1, r2
_080ABD96:
	bl Clouds_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080ABD96
_080ABDA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ABDA8: .4byte 0x08526DE8
_080ABDAC: .4byte 0x000006D2
	thumb_func_end Clouds_InitAll

	thumb_func_start Clouds_Main
Clouds_Main: @ 0x080ABDB0
	push {r4, r5, lr}
	ldr r0, _080ABDCC
	ldr r5, [r0]
	ldr r0, _080ABDD0
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #1
	beq _080ABDE0
	cmp r0, #1
	bgt _080ABDD4
	cmp r0, #0
	beq _080ABDDA
	b _080ABE04
	.align 2, 0
_080ABDCC: .4byte 0x08526DE8
_080ABDD0: .4byte 0x000006CC
_080ABDD4:
	cmp r0, #2
	beq _080ABDEC
	b _080ABE04
_080ABDDA:
	bl CreateCloudSprites
	b _080ABDFE
_080ABDE0:
	movs r0, #0xc
	movs r1, #8
	movs r2, #1
	bl Weather_SetTargetBlendCoeffs
	b _080ABDFE
_080ABDEC:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABE04
	ldr r0, _080ABE0C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
_080ABDFE:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080ABE04:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ABE0C: .4byte 0x000006D2
	thumb_func_end Clouds_Main

	thumb_func_start Clouds_Finish
Clouds_Finish: @ 0x080ABE10
	push {r4, lr}
	ldr r0, _080ABE28
	ldr r0, [r0]
	ldr r1, _080ABE2C
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #0
	beq _080ABE30
	cmp r0, #1
	beq _080ABE3C
	movs r0, #0
	b _080ABE52
	.align 2, 0
_080ABE28: .4byte 0x08526DE8
_080ABE2C: .4byte 0x000006CE
_080ABE30:
	movs r0, #0
	movs r1, #0x10
	movs r2, #1
	bl Weather_SetTargetBlendCoeffs
	b _080ABE4A
_080ABE3C:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABE50
	bl DestroyCloudSprites
_080ABE4A:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080ABE50:
	movs r0, #1
_080ABE52:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Clouds_Finish

	thumb_func_start Sunny_InitVars
Sunny_InitVars: @ 0x080ABE58
	ldr r0, _080ABE70
	ldr r1, [r0]
	ldr r0, _080ABE74
	adds r2, r1, r0
	movs r0, #0
	strb r0, [r2]
	ldr r0, _080ABE78
	adds r1, r1, r0
	movs r0, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_080ABE70: .4byte 0x08526DE8
_080ABE74: .4byte 0x000006C1
_080ABE78: .4byte 0x000006C2
	thumb_func_end Sunny_InitVars

	thumb_func_start Sunny_InitAll
Sunny_InitAll: @ 0x080ABE7C
	push {lr}
	bl Sunny_InitVars
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Sunny_InitAll

	thumb_func_start Sunny_Main
Sunny_Main: @ 0x080ABE88
	bx lr
	.align 2, 0
	thumb_func_end Sunny_Main

	thumb_func_start Shade_Finish
Shade_Finish: @ 0x080ABE8C
	movs r0, #0
	bx lr
	thumb_func_end Shade_Finish

	thumb_func_start CreateCloudSprites
CreateCloudSprites: @ 0x080ABE90
	push {r4, r5, lr}
	ldr r0, _080ABF08
	ldr r0, [r0]
	ldr r1, _080ABF0C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080ABF4C
	ldr r0, _080ABF10
	bl LoadSpriteSheet
	ldr r0, _080ABF14
	bl LoadCustomWeatherSpritePalette
	movs r5, #0
_080ABEAE:
	ldr r0, _080ABF18
	movs r1, #0
	movs r2, #0
	movs r3, #0xff
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x40
	beq _080ABF24
	ldr r0, _080ABF08
	ldr r1, [r0]
	lsls r2, r5, #2
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	lsls r4, r3, #4
	adds r4, r4, r3
	lsls r4, r4, #2
	ldr r0, _080ABF1C
	adds r4, r4, r0
	str r4, [r1]
	ldr r0, _080ABF20
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r0, #7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r2, #2]
	adds r1, #7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	bl SetSpritePosToMapCoords
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	b _080ABF36
	.align 2, 0
_080ABF08: .4byte 0x08526DE8
_080ABF0C: .4byte 0x000006DE
_080ABF10: .4byte 0x0852A7F8
_080ABF14: .4byte 0x08526F2C
_080ABF18: .4byte 0x0852A814
_080ABF1C: .4byte 0x020205AC
_080ABF20: .4byte 0x0852A7EC
_080ABF24:
	ldr r0, _080ABF54
	ldr r1, [r0]
	lsls r0, r5, #2
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_080ABF36:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #2
	bls _080ABEAE
	ldr r0, _080ABF54
	ldr r0, [r0]
	ldr r1, _080ABF58
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
_080ABF4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ABF54: .4byte 0x08526DE8
_080ABF58: .4byte 0x000006DE
	thumb_func_end CreateCloudSprites

	thumb_func_start DestroyCloudSprites
DestroyCloudSprites: @ 0x080ABF5C
	push {r4, r5, lr}
	ldr r0, _080ABFA8
	ldr r1, [r0]
	ldr r2, _080ABFAC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080ABFA0
	movs r4, #0
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r5, r1, r0
_080ABF74:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080ABF82
	bl DestroySprite
_080ABF82:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #2
	bls _080ABF74
	movs r0, #0x90
	lsls r0, r0, #5
	bl FreeSpriteTilesByTag
	ldr r0, _080ABFA8
	ldr r0, [r0]
	ldr r1, _080ABFAC
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080ABFA0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ABFA8: .4byte 0x08526DE8
_080ABFAC: .4byte 0x000006DE
	thumb_func_end DestroyCloudSprites

	thumb_func_start UpdateCloudSprite
UpdateCloudSprite: @ 0x080ABFB0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strh r0, [r2, #0x2e]
	cmp r0, #0
	beq _080ABFC8
	ldrh r0, [r2, #0x20]
	subs r0, #1
	strh r0, [r2, #0x20]
_080ABFC8:
	pop {r0}
	bx r0
	thumb_func_end UpdateCloudSprite

	thumb_func_start Drought_InitVars
Drought_InitVars: @ 0x080ABFCC
	ldr r0, _080ABFF0
	ldr r1, [r0]
	ldr r0, _080ABFF4
	adds r3, r1, r0
	movs r2, #0
	movs r0, #0
	strh r0, [r3]
	ldr r3, _080ABFF8
	adds r0, r1, r3
	strb r2, [r0]
	subs r3, #0x11
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080ABFFC
	adds r1, r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_080ABFF0: .4byte 0x08526DE8
_080ABFF4: .4byte 0x000006CC
_080ABFF8: .4byte 0x000006D2
_080ABFFC: .4byte 0x000006C2
	thumb_func_end Drought_InitVars

	thumb_func_start Drought_InitAll
Drought_InitAll: @ 0x080AC000
	push {r4, lr}
	bl Drought_InitVars
	ldr r0, _080AC028
	ldr r1, [r0]
	ldr r2, _080AC02C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AC020
	adds r4, r1, r2
_080AC016:
	bl Drought_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080AC016
_080AC020:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC028: .4byte 0x08526DE8
_080AC02C: .4byte 0x000006D2
	thumb_func_end Drought_InitAll

	thumb_func_start Drought_Main
Drought_Main: @ 0x080AC030
	push {lr}
	ldr r1, _080AC04C
	ldr r0, [r1]
	ldr r2, _080AC050
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r2, r1, #0
	cmp r0, #4
	bhi _080AC10C
	lsls r0, r0, #2
	ldr r1, _080AC054
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AC04C: .4byte 0x08526DE8
_080AC050: .4byte 0x000006CC
_080AC054: .4byte 0x080AC058
_080AC058: @ jump table
	.4byte _080AC06C @ case 0
	.4byte _080AC088 @ case 1
	.4byte _080AC0A0 @ case 2
	.4byte _080AC0BC @ case 3
	.4byte _080AC0D4 @ case 4
_080AC06C:
	ldr r1, [r2]
	ldr r2, _080AC080
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AC110
	ldr r0, _080AC084
	adds r1, r1, r0
	b _080AC0F4
	.align 2, 0
_080AC080: .4byte 0x000006C6
_080AC084: .4byte 0x000006CC
_080AC088:
	bl ResetDroughtWeatherPaletteLoading
	ldr r0, _080AC098
	ldr r1, [r0]
	ldr r2, _080AC09C
	adds r1, r1, r2
	b _080AC0F4
	.align 2, 0
_080AC098: .4byte 0x08526DE8
_080AC09C: .4byte 0x000006CC
_080AC0A0:
	bl LoadDroughtWeatherPalettes
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AC110
	ldr r0, _080AC0B4
	ldr r1, [r0]
	ldr r0, _080AC0B8
	adds r1, r1, r0
	b _080AC0F4
	.align 2, 0
_080AC0B4: .4byte 0x08526DE8
_080AC0B8: .4byte 0x000006CC
_080AC0BC:
	bl sub_080AB8EC
	ldr r0, _080AC0CC
	ldr r1, [r0]
	ldr r2, _080AC0D0
	adds r1, r1, r2
	b _080AC0F4
	.align 2, 0
_080AC0CC: .4byte 0x08526DE8
_080AC0D0: .4byte 0x000006CC
_080AC0D4:
	bl sub_080AB918
	ldr r0, _080AC0FC
	ldr r2, [r0]
	ldr r1, _080AC100
	adds r0, r2, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #6
	bne _080AC110
	ldr r0, _080AC104
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080AC108
	adds r1, r2, r0
_080AC0F4:
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _080AC110
	.align 2, 0
_080AC0FC: .4byte 0x08526DE8
_080AC100: .4byte 0x0000073C
_080AC104: .4byte 0x000006D2
_080AC108: .4byte 0x000006CC
_080AC10C:
	bl sub_080AB918
_080AC110:
	pop {r0}
	bx r0
	thumb_func_end Drought_Main

	thumb_func_start Sunny_Finish
Sunny_Finish: @ 0x080AC114
	movs r0, #0
	bx lr
	thumb_func_end Sunny_Finish

	thumb_func_start StartDroughtWeatherBlend
StartDroughtWeatherBlend: @ 0x080AC118
	push {lr}
	ldr r0, _080AC128
	movs r1, #0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080AC128: .4byte 0x080AC12D
	thumb_func_end StartDroughtWeatherBlend

	thumb_func_start UpdateDroughtBlend
UpdateDroughtBlend: @ 0x080AC12C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080AC150
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bhi _080AC21E
	lsls r0, r0, #2
	ldr r1, _080AC154
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AC150: .4byte 0x03005B60
_080AC154: .4byte 0x080AC158
_080AC158: @ jump table
	.4byte _080AC16C @ case 0
	.4byte _080AC196 @ case 1
	.4byte _080AC1C4 @ case 2
	.4byte _080AC1F4 @ case 3
	.4byte _080AC214 @ case 4
_080AC16C:
	movs r0, #0
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	ldr r0, _080AC1BC
	ldrh r0, [r0]
	strh r0, [r4, #0xe]
	ldr r1, _080AC1C0
	movs r0, #0x48
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0x9e
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080AC196:
	ldrh r0, [r4, #0xa]
	adds r0, #3
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080AC1A8
	movs r0, #0x10
	strh r0, [r4, #0xa]
_080AC1A8:
	ldrh r1, [r4, #0xa]
	movs r0, #0x54
	bl SetGpuReg
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble _080AC21E
	b _080AC20C
	.align 2, 0
_080AC1BC: .4byte 0x04000048
_080AC1C0: .4byte 0x00003F3F
_080AC1C4:
	ldrh r0, [r4, #0xc]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _080AC21E
	strh r1, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080AC1EA
	strh r1, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080AC1EA:
	ldrh r1, [r4, #0xa]
	movs r0, #0x54
	bl SetGpuReg
	b _080AC21E
_080AC1F4:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4, #0xe]
	movs r0, #0x48
	bl SetGpuReg
_080AC20C:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080AC21E
_080AC214:
	bl EnableBothScriptContexts
	adds r0, r5, #0
	bl DestroyTask
_080AC21E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end UpdateDroughtBlend

	thumb_func_start LightRain_InitVars
LightRain_InitVars: @ 0x080AC224
	push {r4, lr}
	ldr r0, _080AC274
	ldr r1, [r0]
	ldr r2, _080AC278
	adds r0, r1, r2
	movs r3, #0
	movs r2, #0
	strh r2, [r0]
	ldr r4, _080AC27C
	adds r0, r1, r4
	strb r3, [r0]
	adds r4, #4
	adds r0, r1, r4
	strh r2, [r0]
	ldr r0, _080AC280
	adds r2, r1, r0
	movs r0, #8
	strb r0, [r2]
	ldr r2, _080AC284
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, #3
	adds r2, r1, r4
	movs r0, #0xa
	strb r0, [r2]
	ldr r0, _080AC288
	adds r2, r1, r0
	movs r0, #3
	strb r0, [r2]
	ldr r2, _080AC28C
	adds r1, r1, r2
	movs r0, #0x14
	strb r0, [r1]
	movs r0, #0x55
	bl SetRainStrengthFromSoundEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC274: .4byte 0x08526DE8
_080AC278: .4byte 0x000006CC
_080AC27C: .4byte 0x000006D2
_080AC280: .4byte 0x000006DB
_080AC284: .4byte 0x000006DC
_080AC288: .4byte 0x000006C1
_080AC28C: .4byte 0x000006C2
	thumb_func_end LightRain_InitVars

	thumb_func_start LightRain_InitAll
LightRain_InitAll: @ 0x080AC290
	push {r4, lr}
	bl LightRain_InitVars
	ldr r0, _080AC2B8
	ldr r1, [r0]
	ldr r2, _080AC2BC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AC2B0
	adds r4, r1, r2
_080AC2A6:
	bl LightRain_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080AC2A6
_080AC2B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC2B8: .4byte 0x08526DE8
_080AC2BC: .4byte 0x000006D2
	thumb_func_end LightRain_InitAll

	thumb_func_start LightRain_Main
LightRain_Main: @ 0x080AC2C0
	push {r4, r5, lr}
	ldr r0, _080AC2DC
	ldr r5, [r0]
	ldr r0, _080AC2E0
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #1
	beq _080AC2F0
	cmp r0, #1
	bgt _080AC2E4
	cmp r0, #0
	beq _080AC2EA
	b _080AC314
	.align 2, 0
_080AC2DC: .4byte 0x08526DE8
_080AC2E0: .4byte 0x000006CC
_080AC2E4:
	cmp r0, #2
	beq _080AC2FC
	b _080AC314
_080AC2EA:
	bl LoadRainSpriteSheet
	b _080AC30E
_080AC2F0:
	bl CreateRainSprite
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AC314
	b _080AC30E
_080AC2FC:
	bl UpdateVisibleRainSprites
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AC314
	ldr r0, _080AC31C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
_080AC30E:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080AC314:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC31C: .4byte 0x000006D2
	thumb_func_end LightRain_Main

	thumb_func_start LightRain_Finish
LightRain_Finish: @ 0x080AC320
	push {r4, r5, lr}
	ldr r0, _080AC33C
	ldr r2, [r0]
	ldr r1, _080AC340
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r4, r0, #0
	cmp r1, #0
	beq _080AC344
	cmp r1, #1
	beq _080AC378
	movs r0, #0
	b _080AC3A6
	.align 2, 0
_080AC33C: .4byte 0x08526DE8
_080AC340: .4byte 0x000006CE
_080AC344:
	ldr r5, _080AC364
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #3
	beq _080AC356
	cmp r0, #5
	beq _080AC356
	cmp r0, #0xd
	bne _080AC36C
_080AC356:
	ldr r0, [r4]
	ldr r1, _080AC368
	adds r0, r0, r1
	movs r1, #0xff
	strh r1, [r0]
	movs r0, #0
	b _080AC3A6
	.align 2, 0
_080AC364: .4byte 0x000006D1
_080AC368: .4byte 0x000006CE
_080AC36C:
	ldr r4, _080AC398
	adds r0, r2, r4
	strb r1, [r0]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080AC378:
	bl UpdateVisibleRainSprites
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AC3A4
	bl DestroyRainSprites
	ldr r0, _080AC39C
	ldr r1, [r0]
	ldr r5, _080AC3A0
	adds r1, r1, r5
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	b _080AC3A6
	.align 2, 0
_080AC398: .4byte 0x000006D9
_080AC39C: .4byte 0x08526DE8
_080AC3A0: .4byte 0x000006CE
_080AC3A4:
	movs r0, #1
_080AC3A6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end LightRain_Finish

	thumb_func_start StartRainSpriteFall
StartRainSpriteFall: @ 0x080AC3AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bne _080AC3C0
	ldr r0, _080AC464
	strh r0, [r7, #0x30]
_080AC3C0:
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	ldr r0, _080AC468
	muls r0, r1, r0
	ldr r3, _080AC46C
	adds r0, r0, r3
	lsls r0, r0, #1
	lsrs r0, r0, #0x11
	movs r1, #0x96
	lsls r1, r1, #2
	bl __umodsi3
	movs r1, #0
	mov r8, r1
	strh r0, [r7, #0x30]
	ldr r1, _080AC470
	ldr r0, _080AC474
	ldr r5, [r0]
	ldr r2, _080AC478
	adds r5, r5, r2
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r3, #0x30
	ldrsh r0, [r7, r3]
	movs r1, #0x1e
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #3
	strh r0, [r7, #0x32]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	movs r1, #0x1e
	bl __divsi3
	lsls r0, r0, #0x10
	lsls r4, r4, #7
	strh r4, [r7, #0x32]
	asrs r0, r0, #9
	strh r0, [r7, #0x34]
	ldr r2, _080AC47C
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	muls r1, r6, r1
	subs r4, r4, r1
	strh r4, [r7, #0x32]
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r2, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	muls r1, r6, r1
	subs r0, r0, r1
	strh r0, [r7, #0x34]
	adds r0, r7, #0
	movs r1, #0
	bl StartSpriteAnim
	mov r3, r8
	strh r3, [r7, #0x36]
	adds r2, r7, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	strh r6, [r7, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC464: .4byte 0x00000169
_080AC468: .4byte 0x41C64E6D
_080AC46C: .4byte 0x00003039
_080AC470: .4byte 0x0852A8E8
_080AC474: .4byte 0x08526DE8
_080AC478: .4byte 0x000006DC
_080AC47C: .4byte 0x0852A8E0
	thumb_func_end StartRainSpriteFall

	thumb_func_start UpdateRainSprite
UpdateRainSprite: @ 0x080AC480
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080AC55C
	ldr r3, _080AC4F4
	ldr r4, _080AC4F8
	ldr r2, [r4]
	ldr r0, _080AC4FC
	adds r2, r2, r0
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0]
	ldrh r0, [r5, #0x32]
	adds r1, r1, r0
	strh r1, [r5, #0x32]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	ldrh r2, [r5, #0x34]
	adds r0, r0, r2
	strh r0, [r5, #0x34]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r5, #0x20]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x14
	strh r2, [r5, #0x22]
	movs r3, #0x38
	ldrsh r0, [r5, r3]
	adds r3, r4, #0
	cmp r0, #0
	beq _080AC500
	adds r0, r1, #0
	adds r0, #8
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080AC500
	adds r1, r2, #0
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080AC500
	cmp r1, #0xb0
	bgt _080AC500
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	b _080AC50A
	.align 2, 0
_080AC4F4: .4byte 0x0852A8E0
_080AC4F8: .4byte 0x08526DE8
_080AC4FC: .4byte 0x000006DC
_080AC500:
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
_080AC50A:
	strb r1, [r0]
	adds r4, r0, #0
	ldrh r0, [r5, #0x2e]
	subs r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080AC57C
	ldr r0, [r3]
	ldr r1, _080AC550
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
	movs r0, #1
	strh r0, [r5, #0x36]
	ldr r1, _080AC554
	ldrh r0, [r5, #0x20]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x20]
	ldr r1, _080AC558
	ldrh r0, [r5, #0x22]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x22]
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	b _080AC57C
	.align 2, 0
_080AC550: .4byte 0x000006DC
_080AC554: .4byte 0x02021B38
_080AC558: .4byte 0x02021B3A
_080AC55C:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AC57C
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl StartRainSpriteFall
_080AC57C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateRainSprite

	thumb_func_start WaitRainSprite
WaitRainSprite: @ 0x080AC584
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _080AC5A4
	adds r0, r4, #0
	bl StartRainSpriteFall
	ldr r0, _080AC5A0
	str r0, [r4, #0x1c]
	b _080AC5A8
	.align 2, 0
_080AC5A0: .4byte 0x080AC481
_080AC5A4:
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
_080AC5A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end WaitRainSprite

	thumb_func_start InitRainSpriteMovement
InitRainSpriteMovement: @ 0x080AC5B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	ldr r2, _080AC634
	ldr r0, _080AC638
	ldr r0, [r0]
	ldr r1, _080AC63C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r1, [r1]
	mov r8, r1
	adds r2, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	add r4, r8
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080AC640
	cmp r6, r0
	beq _080AC60E
	adds r5, r0, #0
_080AC5FE:
	adds r0, r7, #0
	bl StartRainSpriteFall
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, r5
	bne _080AC5FE
_080AC60E:
	cmp r4, r8
	bhs _080AC644
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080AC640
	cmp r4, r0
	beq _080AC630
	adds r5, r0, #0
_080AC620:
	adds r0, r7, #0
	bl UpdateRainSprite
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	bne _080AC620
_080AC630:
	movs r0, #0
	b _080AC658
	.align 2, 0
_080AC634: .4byte 0x0852A8E8
_080AC638: .4byte 0x08526DE8
_080AC63C: .4byte 0x000006DC
_080AC640: .4byte 0x0000FFFF
_080AC644:
	mov r1, r8
	subs r0, r4, r1
	strh r0, [r7, #0x2e]
	adds r2, r7, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
_080AC658:
	strh r0, [r7, #0x3a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end InitRainSpriteMovement

	thumb_func_start LoadRainSpriteSheet
LoadRainSpriteSheet: @ 0x080AC664
	push {lr}
	ldr r0, _080AC670
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_080AC670: .4byte 0x0852A8F0
	thumb_func_end LoadRainSpriteSheet

	thumb_func_start CreateRainSprite
CreateRainSprite: @ 0x080AC674
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080AC720
	ldr r4, [r0]
	ldr r0, _080AC724
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, #0x18
	bne _080AC68E
	b _080AC794
_080AC68E:
	ldrb r7, [r2]
	ldr r0, _080AC728
	ldr r2, _080AC72C
	lsls r6, r7, #2
	adds r2, r6, r2
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #0x4e
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x40
	beq _080AC73C
	ldr r3, _080AC730
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r0, #0
	strh r0, [r1, #0x38]
	lsls r2, r7, #3
	adds r0, r2, r7
	lsls r0, r0, #4
	adds r0, r0, r7
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080AC734
	mov sl, r6
	mov sb, r3
	mov ip, r4
	mov r8, r2
	cmp r0, r1
	ble _080AC6F2
	adds r2, r1, #0
_080AC6DA:
	adds r0, r4, r5
	lsls r0, r0, #2
	ldr r6, _080AC730
	adds r0, r0, r6
	ldr r3, _080AC738
	ldrh r6, [r0, #0x30]
	adds r1, r3, r6
	strh r1, [r0, #0x30]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r2
	bgt _080AC6DA
_080AC6F2:
	mov r0, ip
	adds r4, r0, r5
	lsls r4, r4, #2
	add r4, sb
	adds r0, r4, #0
	bl StartRainSpriteFall
	mov r3, r8
	adds r1, r3, r7
	adds r0, r4, #0
	bl InitRainSpriteMovement
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080AC720
	ldr r0, [r0]
	add r0, sl
	str r4, [r0]
	b _080AC742
	.align 2, 0
_080AC720: .4byte 0x08526DE8
_080AC724: .4byte 0x000006DA
_080AC728: .4byte 0x0852A8C8
_080AC72C: .4byte 0x0852A82C
_080AC730: .4byte 0x020205AC
_080AC734: .4byte 0x00000257
_080AC738: .4byte 0xFFFFFDA8
_080AC73C:
	adds r1, r4, r6
	movs r0, #0
	str r0, [r1]
_080AC742:
	ldr r0, _080AC778
	ldr r2, [r0]
	ldr r6, _080AC77C
	adds r1, r2, r6
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x18
	bne _080AC798
	movs r3, #0
	adds r1, r2, #0
	ldr r5, _080AC780
	ldr r4, _080AC784
_080AC760:
	lsls r0, r3, #2
	adds r0, r1, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _080AC78A
	movs r6, #0x3a
	ldrsh r0, [r2, r6]
	cmp r0, #0
	bne _080AC788
	str r5, [r2, #0x1c]
	b _080AC78A
	.align 2, 0
_080AC778: .4byte 0x08526DE8
_080AC77C: .4byte 0x000006DA
_080AC780: .4byte 0x080AC481
_080AC784: .4byte 0x080AC585
_080AC788:
	str r4, [r2, #0x1c]
_080AC78A:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x17
	bls _080AC760
_080AC794:
	movs r0, #0
	b _080AC79A
_080AC798:
	movs r0, #1
_080AC79A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CreateRainSprite

	thumb_func_start UpdateVisibleRainSprites
UpdateVisibleRainSprites: @ 0x080AC7A8
	push {r4, r5, r6, r7, lr}
	ldr r0, _080AC7C4
	ldr r3, [r0]
	movs r0, #0xdb
	lsls r0, r0, #3
	adds r4, r3, r0
	ldr r1, _080AC7C8
	adds r5, r3, r1
	ldrb r0, [r4]
	ldrb r7, [r5]
	cmp r0, r7
	bne _080AC7CC
	movs r0, #0
	b _080AC82E
	.align 2, 0
_080AC7C4: .4byte 0x08526DE8
_080AC7C8: .4byte 0x000006D9
_080AC7CC:
	ldr r0, _080AC804
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, #1
	movs r6, #0
	strh r0, [r2]
	ldr r7, _080AC808
	adds r1, r3, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bls _080AC82C
	strh r6, [r2]
	ldrb r0, [r4]
	adds r1, r0, #0
	ldrb r5, [r5]
	cmp r1, r5
	bhs _080AC80C
	adds r0, #1
	strb r0, [r4]
	lsls r0, r1, #2
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, #1
	strh r0, [r1, #0x38]
	b _080AC82C
	.align 2, 0
_080AC804: .4byte 0x000006D6
_080AC808: .4byte 0x000006DB
_080AC80C:
	subs r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r3, r0
	ldr r0, [r0]
	strh r6, [r0, #0x38]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
_080AC82C:
	movs r0, #1
_080AC82E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end UpdateVisibleRainSprites

	thumb_func_start DestroyRainSprites
DestroyRainSprites: @ 0x080AC834
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r0, _080AC87C
	ldr r2, [r0]
	ldr r3, _080AC880
	adds r1, r2, r3
	adds r7, r0, #0
	ldrb r1, [r1]
	cmp r4, r1
	bhs _080AC866
	adds r5, r2, #0
	adds r6, r5, r3
_080AC84C:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080AC85A
	bl DestroySprite
_080AC85A:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r6]
	cmp r4, r0
	blo _080AC84C
_080AC866:
	ldr r0, [r7]
	ldr r1, _080AC880
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080AC884
	bl FreeSpriteTilesByTag
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC87C: .4byte 0x08526DE8
_080AC880: .4byte 0x000006DA
_080AC884: .4byte 0x00001206
	thumb_func_end DestroyRainSprites

	thumb_func_start Snow_InitVars
Snow_InitVars: @ 0x080AC888
	push {r4, lr}
	ldr r0, _080AC8C4
	ldr r1, [r0]
	ldr r2, _080AC8C8
	adds r0, r1, r2
	movs r2, #0
	movs r3, #0
	strh r3, [r0]
	ldr r4, _080AC8CC
	adds r0, r1, r4
	strb r2, [r0]
	ldr r0, _080AC8D0
	adds r2, r1, r0
	movs r0, #3
	strb r0, [r2]
	subs r4, #0x10
	adds r2, r1, r4
	movs r0, #0x14
	strb r0, [r2]
	ldr r0, _080AC8D4
	adds r2, r1, r0
	movs r0, #0x10
	strb r0, [r2]
	movs r2, #0xdc
	lsls r2, r2, #3
	adds r1, r1, r2
	strh r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC8C4: .4byte 0x08526DE8
_080AC8C8: .4byte 0x000006CC
_080AC8CC: .4byte 0x000006D2
_080AC8D0: .4byte 0x000006C1
_080AC8D4: .4byte 0x000006E5
	thumb_func_end Snow_InitVars

	thumb_func_start Snow_InitAll
Snow_InitAll: @ 0x080AC8D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl Snow_InitVars
	ldr r2, _080AC938
	ldr r1, [r2]
	ldr r3, _080AC93C
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AC92E
	mov r8, r2
	adds r7, r1, r3
_080AC8F4:
	bl Snow_Main
	movs r4, #0
	mov r1, r8
	ldr r0, [r1]
	ldr r3, _080AC940
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r4, r0
	bhs _080AC928
	ldr r0, _080AC938
	ldr r5, [r0]
	adds r6, r5, r3
_080AC90E:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x60
	adds r0, r0, r1
	ldr r0, [r0]
	bl UpdateSnowflakeSprite
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r6]
	cmp r4, r0
	blo _080AC90E
_080AC928:
	ldrb r0, [r7]
	cmp r0, #0
	beq _080AC8F4
_080AC92E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC938: .4byte 0x08526DE8
_080AC93C: .4byte 0x000006D2
_080AC940: .4byte 0x000006E4
	thumb_func_end Snow_InitAll

	thumb_func_start Snow_Main
Snow_Main: @ 0x080AC944
	push {r4, r5, lr}
	ldr r0, _080AC974
	ldr r5, [r0]
	ldr r0, _080AC978
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #0
	bne _080AC96C
	bl UpdateVisibleSnowflakeSprites
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AC96C
	ldr r0, _080AC97C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080AC96C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC974: .4byte 0x08526DE8
_080AC978: .4byte 0x000006CC
_080AC97C: .4byte 0x000006D2
	thumb_func_end Snow_Main

	thumb_func_start Snow_Finish
Snow_Finish: @ 0x080AC980
	push {r4, lr}
	ldr r0, _080AC998
	ldr r2, [r0]
	ldr r0, _080AC99C
	adds r3, r2, r0
	ldrh r1, [r3]
	cmp r1, #0
	beq _080AC9A0
	cmp r1, #1
	beq _080AC9B2
	movs r0, #0
	b _080AC9DE
	.align 2, 0
_080AC998: .4byte 0x08526DE8
_080AC99C: .4byte 0x000006CE
_080AC9A0:
	ldr r4, _080AC9D0
	adds r0, r2, r4
	strb r1, [r0]
	subs r4, #5
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080AC9B2:
	bl UpdateVisibleSnowflakeSprites
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AC9DC
	ldr r0, _080AC9D4
	ldr r1, [r0]
	ldr r0, _080AC9D8
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	b _080AC9DE
	.align 2, 0
_080AC9D0: .4byte 0x000006E5
_080AC9D4: .4byte 0x08526DE8
_080AC9D8: .4byte 0x000006CE
_080AC9DC:
	movs r0, #1
_080AC9DE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Snow_Finish

	thumb_func_start UpdateVisibleSnowflakeSprites
UpdateVisibleSnowflakeSprites: @ 0x080AC9E4
	push {r4, lr}
	ldr r0, _080ACA00
	ldr r1, [r0]
	ldr r0, _080ACA04
	adds r3, r1, r0
	ldr r4, _080ACA08
	adds r2, r1, r4
	ldrb r0, [r3]
	ldrb r4, [r2]
	cmp r0, r4
	bne _080ACA0C
	movs r0, #0
	b _080ACA4E
	.align 2, 0
_080ACA00: .4byte 0x08526DE8
_080ACA04: .4byte 0x000006E4
_080ACA08: .4byte 0x000006E5
_080ACA0C:
	movs r0, #0xdc
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x24
	bls _080ACA36
	movs r0, #0
	strh r0, [r1]
	ldrb r0, [r3]
	ldrb r2, [r2]
	cmp r0, r2
	bhs _080ACA32
	bl CreateSnowflakeSprite
	b _080ACA36
_080ACA32:
	bl DestroySnowflakeSprite
_080ACA36:
	ldr r0, _080ACA54
	ldr r0, [r0]
	ldr r2, _080ACA58
	adds r1, r0, r2
	ldr r4, _080ACA5C
	adds r0, r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
_080ACA4E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080ACA54: .4byte 0x08526DE8
_080ACA58: .4byte 0x000006E4
_080ACA5C: .4byte 0x000006E5
	thumb_func_end UpdateVisibleSnowflakeSprites

	thumb_func_start CreateSnowflakeSprite
CreateSnowflakeSprite: @ 0x080ACA60
	push {r4, r5, r6, lr}
	ldr r0, _080ACAB4
	movs r1, #0
	movs r2, #0
	movs r3, #0x4e
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _080ACAC4
	ldr r0, _080ACAB8
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, _080ACABC
	ldr r5, [r0]
	ldr r0, _080ACAC0
	adds r6, r5, r0
	ldrb r0, [r6]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	bl InitSnowflakeSpriteMovement
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	adds r1, r0, #1
	strb r1, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r5, #0x60
	adds r5, r5, r0
	str r4, [r5]
	movs r0, #1
	b _080ACAC6
	.align 2, 0
_080ACAB4: .4byte 0x0852A928
_080ACAB8: .4byte 0x020205AC
_080ACABC: .4byte 0x08526DE8
_080ACAC0: .4byte 0x000006E4
_080ACAC4:
	movs r0, #0
_080ACAC6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end CreateSnowflakeSprite

	thumb_func_start DestroySnowflakeSprite
DestroySnowflakeSprite: @ 0x080ACACC
	push {lr}
	ldr r0, _080ACAE0
	ldr r1, [r0]
	ldr r0, _080ACAE4
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #0
	bne _080ACAE8
	movs r0, #0
	b _080ACAFC
	.align 2, 0
_080ACAE0: .4byte 0x08526DE8
_080ACAE4: .4byte 0x000006E4
_080ACAE8:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r1, #0x60
	adds r1, r1, r0
	ldr r0, [r1]
	bl DestroySprite
	movs r0, #1
_080ACAFC:
	pop {r1}
	bx r1
	thumb_func_end DestroySnowflakeSprite

	thumb_func_start InitSnowflakeSpriteMovement
InitSnowflakeSpriteMovement: @ 0x080ACB00
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl Random
	movs r1, #0x36
	ldrsh r2, [r5, r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	movs r2, #7
	ands r1, r2
	lsls r4, r1, #4
	subs r4, r4, r1
	lsls r4, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1e
	bl __umodsi3
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _080ACBA4
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r2, #3
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	movs r7, #0
	strh r1, [r5, #0x22]
	ldr r1, _080ACBA8
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	subs r4, r4, r0
	strh r4, [r5, #0x20]
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	lsls r0, r0, #7
	strh r0, [r5, #0x2e]
	strh r7, [r5, #0x24]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r0, #0
	movs r4, #3
	ands r4, r6
	lsls r0, r4, #2
	adds r0, r0, r4
	adds r0, #0x40
	strh r0, [r5, #0x30]
	strh r0, [r5, #0x3c]
	movs r1, #1
	bics r1, r6
	adds r0, r5, #0
	bl StartSpriteAnim
	strh r7, [r5, #0x34]
	movs r0, #1
	cmp r4, #0
	bne _080ACB90
	movs r0, #2
_080ACB90:
	strh r0, [r5, #0x32]
	movs r0, #0x1f
	ands r0, r6
	adds r0, #0xd2
	strh r0, [r5, #0x3a]
	strh r7, [r5, #0x38]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ACBA4: .4byte 0x02021B3A
_080ACBA8: .4byte 0x02021B38
	thumb_func_end InitSnowflakeSpriteMovement

	thumb_func_start WaitSnowflakeSprite
WaitSnowflakeSprite: @ 0x080ACBAC
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _080ACBF8
	ldr r0, [r0]
	ldr r1, _080ACBFC
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #0x12
	bls _080ACBF2
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080ACC00
	str r0, [r3, #0x1c]
	ldr r1, _080ACC04
	adds r0, r3, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xfa
	subs r1, r1, r0
	movs r2, #0
	strh r1, [r3, #0x22]
	movs r1, #0x22
	ldrsh r0, [r3, r1]
	lsls r0, r0, #7
	strh r0, [r3, #0x2e]
	strh r2, [r4]
_080ACBF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACBF8: .4byte 0x08526DE8
_080ACBFC: .4byte 0x000006E2
_080ACC00: .4byte 0x080ACC09
_080ACC04: .4byte 0x02021B3A
	thumb_func_end WaitSnowflakeSprite

	thumb_func_start UpdateSnowflakeSprite
UpdateSnowflakeSprite: @ 0x080ACC08
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x2e]
	adds r0, r0, r1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x34]
	adds r0, r0, r2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x34]
	ldr r1, _080ACC80
	movs r3, #0x34
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080ACC3A
	adds r0, #0x3f
_080ACC3A:
	asrs r0, r0, #6
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0x28
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldrh r0, [r4, #0x20]
	adds r0, r0, r5
	ldr r1, _080ACC84
	ldrh r1, [r1]
	adds r3, r1, r0
	ldr r2, _080ACC88
	adds r0, r2, #0
	ands r3, r0
	adds r2, r3, #0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080ACC6C
	ldr r3, _080ACC8C
	adds r0, r3, #0
	orrs r2, r0
	lsls r0, r2, #0x10
	lsrs r3, r0, #0x10
_080ACC6C:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r2, #3
	rsbs r2, r2, #0
	cmp r0, r2
	bge _080ACC90
	adds r1, r1, r5
	movs r0, #0xf2
	subs r0, r0, r1
	b _080ACC98
	.align 2, 0
_080ACC80: .4byte 0x082FA8CC
_080ACC84: .4byte 0x02021B38
_080ACC88: .4byte 0x000001FF
_080ACC8C: .4byte 0xFFFFFF00
_080ACC90:
	cmp r0, #0xf2
	ble _080ACC9A
	adds r0, r1, r5
	subs r0, r2, r0
_080ACC98:
	strh r0, [r4, #0x20]
_080ACC9A:
	adds r0, r4, #0
	adds r0, #0x29
	movs r3, #0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, #0x22]
	adds r0, r0, r3
	ldr r1, _080ACCD8
	ldrh r1, [r1]
	adds r2, r1, r0
	movs r0, #0xff
	ands r2, r0
	adds r0, r2, #0
	subs r0, #0xa4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bhi _080ACCDC
	adds r1, r1, r3
	movs r0, #0xfa
	subs r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x22]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	lsls r0, r0, #7
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x38]
	movs r0, #0xdc
	strh r0, [r4, #0x3a]
	b _080ACD08
	.align 2, 0
_080ACCD8: .4byte 0x02021B3A
_080ACCDC:
	adds r0, r2, #0
	subs r0, #0xf3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bhi _080ACD08
	movs r1, #0
	movs r0, #0xa3
	strh r0, [r4, #0x22]
	lsls r0, r0, #7
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x38]
	movs r0, #0xdc
	strh r0, [r4, #0x3a]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080ACD3C
	str r0, [r4, #0x1c]
_080ACD08:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x3a
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080ACD34
	adds r0, r4, #0
	bl InitSnowflakeSpriteMovement
	movs r0, #0xfa
	strh r0, [r4, #0x22]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080ACD3C
	str r0, [r4, #0x1c]
_080ACD34:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACD3C: .4byte 0x080ACBAD
	thumb_func_end UpdateSnowflakeSprite

	thumb_func_start MedRain_InitVars
MedRain_InitVars: @ 0x080ACD40
	push {r4, r5, lr}
	ldr r0, _080ACD98
	ldr r1, [r0]
	ldr r2, _080ACD9C
	adds r0, r1, r2
	movs r3, #0
	movs r2, #0
	strh r2, [r0]
	ldr r5, _080ACDA0
	adds r4, r1, r5
	strb r3, [r4]
	adds r5, #4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _080ACDA4
	adds r2, r1, r0
	movs r0, #4
	strb r0, [r2]
	ldr r2, _080ACDA8
	adds r0, r1, r2
	strb r3, [r0]
	adds r5, #3
	adds r2, r1, r5
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _080ACDAC
	adds r2, r1, r0
	movs r0, #3
	strb r0, [r2]
	subs r5, #0x17
	adds r2, r1, r5
	movs r0, #0x14
	strb r0, [r2]
	strb r3, [r4]
	ldr r0, _080ACDB0
	adds r1, r1, r0
	strb r3, [r1]
	movs r0, #0x51
	bl SetRainStrengthFromSoundEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACD98: .4byte 0x08526DE8
_080ACD9C: .4byte 0x000006CC
_080ACDA0: .4byte 0x000006D2
_080ACDA4: .4byte 0x000006DB
_080ACDA8: .4byte 0x000006DC
_080ACDAC: .4byte 0x000006C1
_080ACDB0: .4byte 0x000006ED
	thumb_func_end MedRain_InitVars

	thumb_func_start MedRain_InitAll
MedRain_InitAll: @ 0x080ACDB4
	push {r4, lr}
	bl MedRain_InitVars
	ldr r0, _080ACDDC
	ldr r1, [r0]
	ldr r2, _080ACDE0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ACDD4
	adds r4, r1, r2
_080ACDCA:
	bl Rain_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080ACDCA
_080ACDD4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACDDC: .4byte 0x08526DE8
_080ACDE0: .4byte 0x000006D2
	thumb_func_end MedRain_InitAll

	thumb_func_start HeavyRain_InitVars
HeavyRain_InitVars: @ 0x080ACDE4
	push {r4, r5, lr}
	ldr r0, _080ACE38
	ldr r1, [r0]
	ldr r2, _080ACE3C
	adds r0, r1, r2
	movs r4, #0
	movs r2, #0
	strh r2, [r0]
	ldr r5, _080ACE40
	adds r3, r1, r5
	strb r4, [r3]
	adds r5, #4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _080ACE44
	adds r2, r1, r0
	movs r0, #4
	strb r0, [r2]
	adds r5, #6
	adds r2, r1, r5
	movs r0, #1
	strb r0, [r2]
	ldr r0, _080ACE48
	adds r2, r1, r0
	movs r0, #0x18
	strb r0, [r2]
	subs r5, #0x1b
	adds r2, r1, r5
	movs r0, #3
	strb r0, [r2]
	ldr r0, _080ACE4C
	adds r1, r1, r0
	movs r0, #0x14
	strb r0, [r1]
	strb r4, [r3]
	movs r0, #0x53
	bl SetRainStrengthFromSoundEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE38: .4byte 0x08526DE8
_080ACE3C: .4byte 0x000006CC
_080ACE40: .4byte 0x000006D2
_080ACE44: .4byte 0x000006DB
_080ACE48: .4byte 0x000006D9
_080ACE4C: .4byte 0x000006C2
	thumb_func_end HeavyRain_InitVars

	thumb_func_start HeavyRain_InitAll
HeavyRain_InitAll: @ 0x080ACE50
	push {r4, lr}
	bl HeavyRain_InitVars
	ldr r0, _080ACE78
	ldr r1, [r0]
	ldr r2, _080ACE7C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ACE70
	adds r4, r1, r2
_080ACE66:
	bl Rain_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080ACE66
_080ACE70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE78: .4byte 0x08526DE8
_080ACE7C: .4byte 0x000006D2
	thumb_func_end HeavyRain_InitAll

	thumb_func_start Rain_Main
Rain_Main: @ 0x080ACE80
	push {r4, r5, lr}
	bl UpdateThunderSound
	ldr r0, _080ACEA0
	ldr r0, [r0]
	ldr r1, _080ACEA4
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xe
	bls _080ACE96
	b _080AD1F6
_080ACE96:
	lsls r0, r0, #2
	ldr r1, _080ACEA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ACEA0: .4byte 0x08526DE8
_080ACEA4: .4byte 0x000006CC
_080ACEA8: .4byte 0x080ACEAC
_080ACEAC: @ jump table
	.4byte _080ACEE8 @ case 0
	.4byte _080ACF04 @ case 1
	.4byte _080ACF28 @ case 2
	.4byte _080ACF58 @ case 3
	.4byte _080ACF7C @ case 4
	.4byte _080ACFAC @ case 5
	.4byte _080ACFDC @ case 6
	.4byte _080AD008 @ case 7
	.4byte _080AD026 @ case 8
	.4byte _080AD084 @ case 9
	.4byte _080AD108 @ case 10
	.4byte _080AD130 @ case 11
	.4byte _080AD160 @ case 12
	.4byte _080AD1A4 @ case 13
	.4byte _080AD1D8 @ case 14
_080ACEE8:
	bl LoadRainSpriteSheet
	ldr r0, _080ACEFC
	ldr r1, [r0]
	ldr r2, _080ACF00
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	b _080AD1F4
	.align 2, 0
_080ACEFC: .4byte 0x08526DE8
_080ACF00: .4byte 0x000006CC
_080ACF04:
	bl CreateRainSprite
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ACF10
	b _080AD1F6
_080ACF10:
	ldr r0, _080ACF20
	ldr r1, [r0]
	ldr r3, _080ACF24
	adds r1, r1, r3
	ldrh r0, [r1]
	adds r0, #1
	b _080AD1F4
	.align 2, 0
_080ACF20: .4byte 0x08526DE8
_080ACF24: .4byte 0x000006CC
_080ACF28:
	bl UpdateVisibleRainSprites
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ACF34
	b _080AD1F6
_080ACF34:
	ldr r0, _080ACF4C
	ldr r1, [r0]
	ldr r0, _080ACF50
	adds r2, r1, r0
	movs r0, #1
	strb r0, [r2]
	ldr r2, _080ACF54
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	b _080AD1F4
	.align 2, 0
_080ACF4C: .4byte 0x08526DE8
_080ACF50: .4byte 0x000006D2
_080ACF54: .4byte 0x000006CC
_080ACF58:
	ldr r0, _080ACF70
	ldr r1, [r0]
	ldr r3, _080ACF74
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ACF68
	b _080AD1F6
_080ACF68:
	ldr r0, _080ACF78
	adds r1, r1, r0
	movs r0, #6
	b _080AD1F4
	.align 2, 0
_080ACF70: .4byte 0x08526DE8
_080ACF74: .4byte 0x000006C6
_080ACF78: .4byte 0x000006CC
_080ACF7C:
	ldr r0, _080ACFCC
	ldr r4, [r0]
	ldr r2, _080ACFD0
	adds r1, r4, r2
	movs r0, #1
	strb r0, [r1]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r5, #0xb4
	lsls r5, r5, #1
	adds r1, r5, #0
	bl __umodsi3
	adds r0, r0, r5
	ldr r3, _080ACFD4
	adds r1, r4, r3
	strh r0, [r1]
	ldr r0, _080ACFD8
	adds r4, r4, r0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080ACFAC:
	ldr r0, _080ACFCC
	ldr r2, [r0]
	ldr r3, _080ACFD4
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080ACFC2
	b _080AD1F6
_080ACFC2:
	ldr r0, _080ACFD8
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #1
	b _080AD1F4
	.align 2, 0
_080ACFCC: .4byte 0x08526DE8
_080ACFD0: .4byte 0x000006EA
_080ACFD4: .4byte 0x000006E6
_080ACFD8: .4byte 0x000006CC
_080ACFDC:
	ldr r0, _080ACFFC
	ldr r4, [r0]
	ldr r1, _080AD000
	adds r0, r4, r1
	movs r5, #1
	strb r5, [r0]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ands r0, r5
	ldr r2, _080AD004
	adds r1, r4, r2
	strb r0, [r1]
	b _080AD064
	.align 2, 0
_080ACFFC: .4byte 0x08526DE8
_080AD000: .4byte 0x000006EA
_080AD004: .4byte 0x000006EB
_080AD008:
	bl Random
	ldr r1, _080AD070
	ldr r2, [r1]
	movs r1, #1
	ands r1, r0
	adds r1, #1
	ldr r3, _080AD074
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _080AD078
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_080AD026:
	movs r0, #0x13
	bl sub_080AB544
	ldr r0, _080AD070
	ldr r1, [r0]
	ldr r2, _080AD07C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AD04A
	ldr r3, _080AD074
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #1
	bne _080AD04A
	movs r0, #0x14
	bl SetThunderCounter
_080AD04A:
	bl Random
	ldr r1, _080AD070
	ldr r4, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	adds r0, #6
	ldr r2, _080AD080
	adds r1, r4, r2
	strh r0, [r1]
_080AD064:
	ldr r3, _080AD078
	adds r4, r4, r3
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080AD1F6
	.align 2, 0
_080AD070: .4byte 0x08526DE8
_080AD074: .4byte 0x000006EC
_080AD078: .4byte 0x000006CC
_080AD07C: .4byte 0x000006EB
_080AD080: .4byte 0x000006E6
_080AD084:
	ldr r0, _080AD0D0
	ldr r4, [r0]
	ldr r0, _080AD0D4
	adds r5, r4, r0
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080AD09A
	b _080AD1F6
_080AD09A:
	movs r0, #3
	bl sub_080AB544
	ldr r2, _080AD0D8
	adds r1, r4, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, _080AD0DC
	adds r1, r4, r3
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AD0E4
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf
	ands r0, r1
	adds r0, #0x3c
	strh r0, [r5]
	ldr r0, _080AD0E0
	adds r1, r4, r0
	movs r0, #0xa
	b _080AD1F4
	.align 2, 0
_080AD0D0: .4byte 0x08526DE8
_080AD0D4: .4byte 0x000006E6
_080AD0D8: .4byte 0x000006EA
_080AD0DC: .4byte 0x000006EC
_080AD0E0: .4byte 0x000006CC
_080AD0E4:
	ldr r1, _080AD0F4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AD0FC
	ldr r2, _080AD0F8
	adds r1, r4, r2
	b _080AD1F2
	.align 2, 0
_080AD0F4: .4byte 0x000006EB
_080AD0F8: .4byte 0x000006CC
_080AD0FC:
	ldr r3, _080AD104
	adds r1, r4, r3
	movs r0, #0xb
	b _080AD1F4
	.align 2, 0
_080AD104: .4byte 0x000006CC
_080AD108:
	ldr r0, _080AD124
	ldr r2, [r0]
	ldr r0, _080AD128
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080AD1F6
	ldr r3, _080AD12C
	adds r1, r2, r3
	movs r0, #8
	b _080AD1F4
	.align 2, 0
_080AD124: .4byte 0x08526DE8
_080AD128: .4byte 0x000006E6
_080AD12C: .4byte 0x000006CC
_080AD130:
	bl Random
	ldr r1, _080AD154
	ldr r2, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf
	ands r0, r1
	adds r0, #0x3c
	ldr r3, _080AD158
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _080AD15C
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _080AD1F6
	.align 2, 0
_080AD154: .4byte 0x08526DE8
_080AD158: .4byte 0x000006E6
_080AD15C: .4byte 0x000006CC
_080AD160:
	ldr r0, _080AD198
	ldr r5, [r0]
	ldr r1, _080AD19C
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080AD1F6
	movs r0, #0x64
	bl SetThunderCounter
	movs r0, #0x13
	bl sub_080AB544
	bl Random
	movs r1, #0xf
	ands r1, r0
	adds r1, #0x1e
	strh r1, [r4]
	ldr r2, _080AD1A0
	adds r1, r5, r2
	ldrh r0, [r1]
	adds r0, #1
	b _080AD1F4
	.align 2, 0
_080AD198: .4byte 0x08526DE8
_080AD19C: .4byte 0x000006E6
_080AD1A0: .4byte 0x000006CC
_080AD1A4:
	ldr r0, _080AD1CC
	ldr r4, [r0]
	ldr r3, _080AD1D0
	adds r1, r4, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080AD1F6
	movs r0, #0x13
	movs r1, #3
	movs r2, #5
	bl sub_080AB578
	ldr r0, _080AD1D4
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #1
	b _080AD1F4
	.align 2, 0
_080AD1CC: .4byte 0x08526DE8
_080AD1D0: .4byte 0x000006E6
_080AD1D4: .4byte 0x000006CC
_080AD1D8:
	ldr r0, _080AD1FC
	ldr r2, [r0]
	ldr r1, _080AD200
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _080AD1F6
	ldr r3, _080AD204
	adds r1, r2, r3
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080AD208
	adds r1, r2, r0
_080AD1F2:
	movs r0, #4
_080AD1F4:
	strh r0, [r1]
_080AD1F6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD1FC: .4byte 0x08526DE8
_080AD200: .4byte 0x000006C6
_080AD204: .4byte 0x000006EA
_080AD208: .4byte 0x000006CC
	thumb_func_end Rain_Main

	thumb_func_start Rain_Finish
Rain_Finish: @ 0x080AD20C
	push {r4, r5, r6, lr}
	ldr r0, _080AD228
	ldr r6, [r0]
	ldr r0, _080AD22C
	adds r5, r6, r0
	ldrh r1, [r5]
	cmp r1, #1
	beq _080AD242
	cmp r1, #1
	bgt _080AD230
	cmp r1, #0
	beq _080AD236
	b _080AD2A8
	.align 2, 0
_080AD228: .4byte 0x08526DE8
_080AD22C: .4byte 0x000006CE
_080AD230:
	cmp r1, #2
	beq _080AD28C
	b _080AD2A8
_080AD236:
	ldr r2, _080AD27C
	adds r0, r6, r2
	strb r1, [r0]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_080AD242:
	bl Rain_Main
	ldr r0, _080AD280
	ldr r2, [r0]
	ldr r1, _080AD27C
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AD2B0
	subs r1, #0x19
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080AD2A8
	cmp r0, #5
	beq _080AD2A8
	cmp r0, #0xd
	beq _080AD2A8
	ldr r0, _080AD284
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080AD288
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _080AD2B0
	.align 2, 0
_080AD27C: .4byte 0x000006EA
_080AD280: .4byte 0x08526DE8
_080AD284: .4byte 0x000006D9
_080AD288: .4byte 0x000006CE
_080AD28C:
	bl UpdateVisibleRainSprites
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080AD2B0
	bl DestroyRainSprites
	ldr r1, _080AD2AC
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_080AD2A8:
	movs r0, #0
	b _080AD2B2
	.align 2, 0
_080AD2AC: .4byte 0x000006ED
_080AD2B0:
	movs r0, #1
_080AD2B2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end Rain_Finish

	thumb_func_start SetThunderCounter
SetThunderCounter: @ 0x080AD2B8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080AD2EC
	ldr r4, [r0]
	ldr r0, _080AD2F0
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080AD2E6
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __umodsi3
	movs r2, #0xdd
	lsls r2, r2, #3
	adds r1, r4, r2
	strh r0, [r1]
	movs r0, #1
	strb r0, [r5]
_080AD2E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AD2EC: .4byte 0x08526DE8
_080AD2F0: .4byte 0x000006ED
	thumb_func_end SetThunderCounter

	thumb_func_start UpdateThunderSound
UpdateThunderSound: @ 0x080AD2F4
	push {r4, lr}
	ldr r0, _080AD32C
	ldr r1, [r0]
	ldr r2, _080AD330
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, #1
	bne _080AD354
	movs r0, #0xdd
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _080AD350
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AD354
	bl Random
	ands r4, r0
	cmp r4, #0
	beq _080AD334
	movs r0, #0x57
	bl PlaySE
	b _080AD33A
	.align 2, 0
_080AD32C: .4byte 0x08526DE8
_080AD330: .4byte 0x000006ED
_080AD334:
	movs r0, #0x58
	bl PlaySE
_080AD33A:
	ldr r0, _080AD348
	ldr r0, [r0]
	ldr r1, _080AD34C
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _080AD354
	.align 2, 0
_080AD348: .4byte 0x08526DE8
_080AD34C: .4byte 0x000006ED
_080AD350:
	subs r0, #1
	strh r0, [r1]
_080AD354:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateThunderSound

	thumb_func_start Fog1_InitVars
Fog1_InitVars: @ 0x080AD35C
	push {lr}
	ldr r0, _080AD3A8
	ldr r3, [r0]
	ldr r0, _080AD3AC
	adds r1, r3, r0
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080AD3B0
	adds r0, r3, r1
	strb r2, [r0]
	subs r1, #0x11
	adds r0, r3, r1
	strb r2, [r0]
	ldr r2, _080AD3B4
	adds r1, r3, r2
	movs r0, #0x14
	strb r0, [r1]
	ldr r1, _080AD3B8
	adds r0, r3, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _080AD3A4
	adds r2, #0x2e
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	subs r2, #4
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, #0
	movs r1, #0x10
	bl Weather_SetBlendCoeffs
_080AD3A4:
	pop {r0}
	bx r0
	.align 2, 0
_080AD3A8: .4byte 0x08526DE8
_080AD3AC: .4byte 0x000006CC
_080AD3B0: .4byte 0x000006D2
_080AD3B4: .4byte 0x000006C2
_080AD3B8: .4byte 0x000006FB
	thumb_func_end Fog1_InitVars

	thumb_func_start Fog1_InitAll
Fog1_InitAll: @ 0x080AD3BC
	push {r4, lr}
	bl Fog1_InitVars
	ldr r0, _080AD3E4
	ldr r1, [r0]
	ldr r2, _080AD3E8
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AD3DC
	adds r4, r1, r2
_080AD3D2:
	bl Fog1_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080AD3D2
_080AD3DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD3E4: .4byte 0x08526DE8
_080AD3E8: .4byte 0x000006D2
	thumb_func_end Fog1_InitAll

	thumb_func_start Fog1_Main
Fog1_Main: @ 0x080AD3EC
	push {r4, r5, r6, lr}
	ldr r0, _080AD438
	ldr r6, [r0]
	ldr r0, _080AD43C
	ldr r1, _080AD440
	adds r2, r6, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	ldr r3, _080AD444
	adds r1, r6, r3
	strh r0, [r1]
	movs r0, #0xde
	lsls r0, r0, #3
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _080AD426
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_080AD426:
	ldr r1, _080AD448
	adds r5, r6, r1
	ldrh r4, [r5]
	cmp r4, #0
	beq _080AD44C
	cmp r4, #1
	beq _080AD48C
	b _080AD4A2
	.align 2, 0
_080AD438: .4byte 0x08526DE8
_080AD43C: .4byte 0x02021B38
_080AD440: .4byte 0x000006F2
_080AD444: .4byte 0x000006EE
_080AD448: .4byte 0x000006CC
_080AD44C:
	bl CreateFog1Sprites
	movs r3, #0xda
	lsls r3, r3, #3
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, #6
	bne _080AD468
	movs r0, #0xc
	movs r1, #8
	movs r2, #3
	bl Weather_SetTargetBlendCoeffs
	b _080AD472
_080AD468:
	movs r0, #4
	movs r1, #0x10
	movs r2, #0
	bl Weather_SetTargetBlendCoeffs
_080AD472:
	ldr r0, _080AD484
	ldr r1, [r0]
	ldr r0, _080AD488
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _080AD4A2
	.align 2, 0
_080AD484: .4byte 0x08526DE8
_080AD488: .4byte 0x000006CC
_080AD48C:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AD4A2
	ldr r1, _080AD4A8
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_080AD4A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AD4A8: .4byte 0x000006D2
	thumb_func_end Fog1_Main

	thumb_func_start Fog1_Finish
Fog1_Finish: @ 0x080AD4AC
	push {r4, lr}
	ldr r0, _080AD4FC
	ldr r2, [r0]
	ldr r0, _080AD500
	ldr r1, _080AD504
	adds r3, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	ldr r4, _080AD508
	adds r1, r2, r4
	strh r0, [r1]
	movs r0, #0xde
	lsls r0, r0, #3
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _080AD4E6
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080AD4E6:
	ldr r1, _080AD50C
	adds r4, r2, r1
	ldrh r0, [r4]
	cmp r0, #1
	beq _080AD522
	cmp r0, #1
	bgt _080AD510
	cmp r0, #0
	beq _080AD516
	b _080AD53A
	.align 2, 0
_080AD4FC: .4byte 0x08526DE8
_080AD500: .4byte 0x02021B38
_080AD504: .4byte 0x000006F2
_080AD508: .4byte 0x000006EE
_080AD50C: .4byte 0x000006CE
_080AD510:
	cmp r0, #2
	beq _080AD52E
	b _080AD53A
_080AD516:
	movs r0, #0
	movs r1, #0x10
	movs r2, #3
	bl Weather_SetTargetBlendCoeffs
	b _080AD532
_080AD522:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AD53E
	b _080AD532
_080AD52E:
	bl DestroyFog1Sprites
_080AD532:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080AD53E
_080AD53A:
	movs r0, #0
	b _080AD540
_080AD53E:
	movs r0, #1
_080AD540:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Fog1_Finish

	thumb_func_start Fog1SpriteCallback
Fog1SpriteCallback: @ 0x080AD548
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _080AD594
	ldrb r0, [r0]
	strh r0, [r3, #0x26]
	ldr r0, _080AD598
	ldr r0, [r0]
	ldr r1, _080AD59C
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, #0x20
	movs r4, #0x2e
	ldrsh r0, [r3, r4]
	lsls r0, r0, #6
	adds r1, r1, r0
	strh r1, [r3, #0x20]
	lsls r1, r1, #0x10
	ldr r0, _080AD5A0
	cmp r1, r0
	ble _080AD58C
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r1, r0, #0
	ldrh r2, [r2]
	adds r1, r1, r2
	movs r4, #0x2e
	ldrsh r2, [r3, r4]
	movs r0, #4
	subs r0, r0, r2
	lsls r0, r0, #6
	subs r1, r1, r0
	ldr r0, _080AD5A4
	ands r1, r0
	strh r1, [r3, #0x20]
_080AD58C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD594: .4byte 0x02021B3A
_080AD598: .4byte 0x08526DE8
_080AD59C: .4byte 0x000006EE
_080AD5A0: .4byte 0x010F0000
_080AD5A4: .4byte 0x000001FF
	thumb_func_end Fog1SpriteCallback

	thumb_func_start CreateFog1Sprites
CreateFog1Sprites: @ 0x080AD5A8
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080AD61C
	ldr r0, [r0]
	ldr r1, _080AD620
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AD652
	ldr r0, _080AD624
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r5, #0
_080AD5CC:
	ldr r0, _080AD628
	movs r1, #0
	movs r2, #0
	movs r3, #0xff
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080AD630
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080AD62C
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #5
	bl __umodsi3
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xa
	adds r0, #0x20
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xa
	adds r0, #0x20
	strh r0, [r4, #0x22]
	ldr r2, _080AD61C
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, #0xa0
	adds r0, r0, r1
	str r4, [r0]
	b _080AD63E
	.align 2, 0
_080AD61C: .4byte 0x08526DE8
_080AD620: .4byte 0x000006FB
_080AD624: .4byte 0x0852A9CC
_080AD628: .4byte 0x0852A9B4
_080AD62C: .4byte 0x020205AC
_080AD630:
	ldr r2, _080AD65C
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r1, #0xa0
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_080AD63E:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x13
	bls _080AD5CC
	ldr r0, [r2]
	ldr r1, _080AD660
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
_080AD652:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD65C: .4byte 0x08526DE8
_080AD660: .4byte 0x000006FB
	thumb_func_end CreateFog1Sprites

	thumb_func_start DestroyFog1Sprites
DestroyFog1Sprites: @ 0x080AD664
	push {r4, r5, lr}
	ldr r0, _080AD6AC
	ldr r1, [r0]
	ldr r2, _080AD6B0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AD6A4
	movs r4, #0
	adds r5, r1, #0
	adds r5, #0xa0
_080AD67A:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080AD688
	bl DestroySprite
_080AD688:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _080AD67A
	ldr r0, _080AD6B4
	bl FreeSpriteTilesByTag
	ldr r0, _080AD6AC
	ldr r0, [r0]
	ldr r1, _080AD6B0
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080AD6A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD6AC: .4byte 0x08526DE8
_080AD6B0: .4byte 0x000006FB
_080AD6B4: .4byte 0x00001201
	thumb_func_end DestroyFog1Sprites

	thumb_func_start Ash_InitVars
Ash_InitVars: @ 0x080AD6B8
	push {lr}
	ldr r0, _080AD704
	ldr r1, [r0]
	ldr r0, _080AD708
	adds r2, r1, r0
	movs r3, #0
	movs r0, #0
	strh r0, [r2]
	ldr r2, _080AD70C
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, #0x11
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _080AD710
	adds r0, r1, r3
	movs r2, #0x14
	strb r2, [r0]
	adds r3, #0x3c
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, #0xe0
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _080AD700
	movs r0, #0
	movs r1, #0x10
	bl Weather_SetBlendCoeffs
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x52
	bl SetGpuReg
_080AD700:
	pop {r0}
	bx r0
	.align 2, 0
_080AD704: .4byte 0x08526DE8
_080AD708: .4byte 0x000006CC
_080AD70C: .4byte 0x000006D2
_080AD710: .4byte 0x000006C2
	thumb_func_end Ash_InitVars

	thumb_func_start Ash_InitAll
Ash_InitAll: @ 0x080AD714
	push {r4, lr}
	bl Ash_InitVars
	ldr r0, _080AD73C
	ldr r1, [r0]
	ldr r2, _080AD740
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AD734
	adds r4, r1, r2
_080AD72A:
	bl Ash_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080AD72A
_080AD734:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD73C: .4byte 0x08526DE8
_080AD740: .4byte 0x000006D2
	thumb_func_end Ash_InitAll

	thumb_func_start Ash_Main
Ash_Main: @ 0x080AD744
	push {r4, r5, lr}
	ldr r2, _080AD788
	ldr r1, [r2]
	ldr r0, _080AD78C
	ldrh r0, [r0]
	ldr r3, _080AD790
	ands r3, r0
	ldr r0, _080AD794
	adds r1, r1, r0
	strh r3, [r1]
	cmp r3, #0xef
	bls _080AD770
	adds r4, r1, #0
	adds r1, r3, #0
_080AD760:
	adds r3, r1, #0
	subs r3, #0xf0
	adds r1, r3, #0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xef
	bhi _080AD760
	strh r3, [r4]
_080AD770:
	ldr r5, [r2]
	ldr r1, _080AD798
	adds r4, r5, r1
	ldrh r0, [r4]
	cmp r0, #1
	beq _080AD7A8
	cmp r0, #1
	bgt _080AD79C
	cmp r0, #0
	beq _080AD7A2
	b _080AD7E4
	.align 2, 0
_080AD788: .4byte 0x08526DE8
_080AD78C: .4byte 0x02021B38
_080AD790: .4byte 0x000001FF
_080AD794: .4byte 0x000006FC
_080AD798: .4byte 0x000006CC
_080AD79C:
	cmp r0, #2
	beq _080AD7C4
	b _080AD7E4
_080AD7A2:
	bl LoadAshSpriteSheet
	b _080AD7D6
_080AD7A8:
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AD7B8
	bl CreateAshSprites
_080AD7B8:
	movs r0, #0x10
	movs r1, #0
	movs r2, #1
	bl Weather_SetTargetBlendCoeffs
	b _080AD7D6
_080AD7C4:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AD7E8
	ldr r0, _080AD7E0
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
_080AD7D6:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080AD7E8
	.align 2, 0
_080AD7E0: .4byte 0x000006D2
_080AD7E4:
	bl Weather_UpdateBlend
_080AD7E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Ash_Main

	thumb_func_start Ash_Finish
Ash_Finish: @ 0x080AD7F0
	push {r4, lr}
	ldr r0, _080AD80C
	ldr r0, [r0]
	ldr r1, _080AD810
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #1
	beq _080AD826
	cmp r0, #1
	bgt _080AD814
	cmp r0, #0
	beq _080AD81A
	b _080AD84A
	.align 2, 0
_080AD80C: .4byte 0x08526DE8
_080AD810: .4byte 0x000006CE
_080AD814:
	cmp r0, #2
	beq _080AD83C
	b _080AD84A
_080AD81A:
	movs r0, #0
	movs r1, #0x10
	movs r2, #1
	bl Weather_SetTargetBlendCoeffs
	b _080AD834
_080AD826:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AD84E
	bl DestroyAshSprites
_080AD834:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080AD84E
_080AD83C:
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080AD84A:
	movs r0, #0
	b _080AD850
_080AD84E:
	movs r0, #1
_080AD850:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Ash_Finish

	thumb_func_start LoadAshSpriteSheet
LoadAshSpriteSheet: @ 0x080AD858
	push {lr}
	ldr r0, _080AD864
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_080AD864: .4byte 0x0852A9D4
	thumb_func_end LoadAshSpriteSheet

	thumb_func_start CreateAshSprites
CreateAshSprites: @ 0x080AD868
	push {r4, r5, lr}
	ldr r0, _080AD8D4
	ldr r0, [r0]
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AD904
	movs r5, #0
_080AD87C:
	ldr r0, _080AD8D8
	movs r1, #0
	movs r2, #0
	movs r3, #0x4e
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080AD8E0
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080AD8DC
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r0, r5, #0
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	adds r0, r5, #0
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x34]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	lsls r0, r0, #6
	adds r0, #0x20
	strh r0, [r4, #0x2e]
	ldr r2, _080AD8D4
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, #0xf0
	adds r0, r0, r1
	str r4, [r0]
	b _080AD8EE
	.align 2, 0
_080AD8D4: .4byte 0x08526DE8
_080AD8D8: .4byte 0x0852A9F4
_080AD8DC: .4byte 0x020205AC
_080AD8E0:
	ldr r2, _080AD90C
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r1, #0xf0
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_080AD8EE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x13
	bls _080AD87C
	ldr r0, [r2]
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
_080AD904:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD90C: .4byte 0x08526DE8
	thumb_func_end CreateAshSprites

	thumb_func_start DestroyAshSprites
DestroyAshSprites: @ 0x080AD910
	push {r4, r5, lr}
	ldr r0, _080AD95C
	ldr r1, [r0]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AD954
	movs r4, #0
	adds r5, r1, #0
	adds r5, #0xf0
_080AD928:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080AD936
	bl DestroySprite
_080AD936:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _080AD928
	ldr r0, _080AD960
	bl FreeSpriteTilesByTag
	ldr r0, _080AD95C
	ldr r0, [r0]
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080AD954:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD95C: .4byte 0x08526DE8
_080AD960: .4byte 0x00001202
	thumb_func_end DestroyAshSprites

	thumb_func_start UpdateAshSprite
UpdateAshSprite: @ 0x080AD964
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _080AD980
	movs r0, #0
	strh r0, [r3, #0x30]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
_080AD980:
	ldr r1, _080AD9CC
	ldrh r0, [r3, #0x2e]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #0x22]
	ldr r0, _080AD9D0
	ldr r0, [r0]
	ldr r1, _080AD9D4
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, #0x20
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	lsls r0, r0, #6
	adds r1, r1, r0
	strh r1, [r3, #0x20]
	lsls r1, r1, #0x10
	ldr r0, _080AD9D8
	cmp r1, r0
	ble _080AD9C4
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r1, r0, #0
	ldrh r2, [r2]
	adds r1, r1, r2
	movs r4, #0x32
	ldrsh r2, [r3, r4]
	movs r0, #4
	subs r0, r0, r2
	lsls r0, r0, #6
	subs r1, r1, r0
	ldr r0, _080AD9DC
	ands r1, r0
	strh r1, [r3, #0x20]
_080AD9C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD9CC: .4byte 0x02021B3A
_080AD9D0: .4byte 0x08526DE8
_080AD9D4: .4byte 0x000006FC
_080AD9D8: .4byte 0x010F0000
_080AD9DC: .4byte 0x000001FF
	thumb_func_end UpdateAshSprite

	thumb_func_start Fog2_InitVars
Fog2_InitVars: @ 0x080AD9E0
	push {r4, lr}
	ldr r0, _080ADA50
	ldr r3, [r0]
	ldr r1, _080ADA54
	adds r0, r3, r1
	movs r1, #0
	movs r2, #0
	strh r2, [r0]
	ldr r4, _080ADA58
	adds r0, r3, r4
	strb r1, [r0]
	subs r4, #0x11
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _080ADA5C
	adds r1, r3, r0
	movs r0, #0x14
	strb r0, [r1]
	movs r1, #0xde
	lsls r1, r1, #3
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, #0x31
	adds r1, r3, r4
	movs r0, #1
	strh r0, [r1]
	ldr r1, _080ADA60
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, #0
	bne _080ADA4A
	adds r4, #0x2a
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, #6
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, #4
	adds r0, r3, r4
	strh r2, [r0]
	adds r1, #4
	adds r0, r3, r1
	strh r2, [r0]
	subs r4, #8
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, #8
	adds r0, r3, r1
	strh r2, [r0]
	movs r0, #0
	movs r1, #0x10
	bl Weather_SetBlendCoeffs
_080ADA4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADA50: .4byte 0x08526DE8
_080ADA54: .4byte 0x000006CC
_080ADA58: .4byte 0x000006D2
_080ADA5C: .4byte 0x000006C2
_080ADA60: .4byte 0x00000724
	thumb_func_end Fog2_InitVars

	thumb_func_start Fog2_InitAll
Fog2_InitAll: @ 0x080ADA64
	push {r4, lr}
	bl Fog2_InitVars
	ldr r0, _080ADA8C
	ldr r1, [r0]
	ldr r2, _080ADA90
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ADA84
	adds r4, r1, r2
_080ADA7A:
	bl Fog2_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080ADA7A
_080ADA84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADA8C: .4byte 0x08526DE8
_080ADA90: .4byte 0x000006D2
	thumb_func_end Fog2_InitAll

	thumb_func_start Fog2_Main
Fog2_Main: @ 0x080ADA94
	push {r4, r5, lr}
	bl UpdateFog2Movement
	ldr r0, _080ADAB4
	ldr r5, [r0]
	ldr r0, _080ADAB8
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #1
	beq _080ADAC8
	cmp r0, #1
	bgt _080ADABC
	cmp r0, #0
	beq _080ADAC2
	b _080ADAEC
	.align 2, 0
_080ADAB4: .4byte 0x08526DE8
_080ADAB8: .4byte 0x000006CC
_080ADABC:
	cmp r0, #2
	beq _080ADAD4
	b _080ADAEC
_080ADAC2:
	bl CreateFog2Sprites
	b _080ADAE6
_080ADAC8:
	movs r0, #0xc
	movs r1, #8
	movs r2, #8
	bl Weather_SetTargetBlendCoeffs
	b _080ADAE6
_080ADAD4:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ADAEC
	ldr r0, _080ADAF4
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
_080ADAE6:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080ADAEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADAF4: .4byte 0x000006D2
	thumb_func_end Fog2_Main

	thumb_func_start Fog2_Finish
Fog2_Finish: @ 0x080ADAF8
	push {r4, lr}
	bl UpdateFog2Movement
	ldr r0, _080ADB18
	ldr r0, [r0]
	ldr r1, _080ADB1C
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #1
	beq _080ADB32
	cmp r0, #1
	bgt _080ADB20
	cmp r0, #0
	beq _080ADB26
	b _080ADB4A
	.align 2, 0
_080ADB18: .4byte 0x08526DE8
_080ADB1C: .4byte 0x000006CE
_080ADB20:
	cmp r0, #2
	beq _080ADB3E
	b _080ADB4A
_080ADB26:
	movs r0, #0
	movs r1, #0x10
	movs r2, #1
	bl Weather_SetTargetBlendCoeffs
	b _080ADB42
_080ADB32:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ADB4E
	b _080ADB42
_080ADB3E:
	bl DestroyFog2Sprites
_080ADB42:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080ADB4E
_080ADB4A:
	movs r0, #0
	b _080ADB50
_080ADB4E:
	movs r0, #1
_080ADB50:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Fog2_Finish

	thumb_func_start UpdateFog2Movement
UpdateFog2Movement: @ 0x080ADB58
	push {r4, r5, lr}
	ldr r0, _080ADBD0
	ldr r3, [r0]
	ldr r0, _080ADBD4
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, #1
	movs r5, #0
	strh r0, [r2]
	ldr r1, _080ADBD8
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080ADB84
	movs r0, #0xe4
	lsls r0, r0, #3
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	strh r5, [r2]
_080ADB84:
	ldr r1, _080ADBDC
	adds r2, r3, r1
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ands r0, r4
	cmp r0, #4
	bls _080ADBA0
	ldr r0, _080ADBE0
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	strh r5, [r2]
_080ADBA0:
	ldr r0, _080ADBE4
	movs r2, #0xe4
	lsls r2, r2, #3
	adds r1, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	subs r2, #8
	adds r1, r3, r2
	strh r0, [r1]
	ldr r1, _080ADBE8
	adds r2, #0xa
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	subs r2, #8
	adds r1, r3, r2
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADBD0: .4byte 0x08526DE8
_080ADBD4: .4byte 0x0000071C
_080ADBD8: .4byte 0x0000FFFF
_080ADBDC: .4byte 0x0000071E
_080ADBE0: .4byte 0x00000722
_080ADBE4: .4byte 0x02021B38
_080ADBE8: .4byte 0x02021B3A
	thumb_func_end UpdateFog2Movement

	thumb_func_start CreateFog2Sprites
CreateFog2Sprites: @ 0x080ADBEC
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _080ADC58
	ldr r0, [r0]
	ldr r1, _080ADC5C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ADC92
	ldr r0, _080ADC60
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r6, #0
_080ADC10:
	adds r0, r6, #0
	movs r1, #5
	bl __udivsi3
	adds r5, r0, #0
	lsls r2, r5, #0x16
	asrs r2, r2, #0x10
	ldr r0, _080ADC64
	movs r1, #0
	movs r3, #0xff
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _080ADC6C
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080ADC68
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #5
	bl __umodsi3
	strh r0, [r4, #0x2e]
	strh r5, [r4, #0x30]
	ldr r2, _080ADC58
	ldr r0, [r2]
	lsls r1, r6, #2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r0, r3
	adds r0, r0, r1
	str r4, [r0]
	b _080ADC7E
	.align 2, 0
_080ADC58: .4byte 0x08526DE8
_080ADC5C: .4byte 0x00000724
_080ADC60: .4byte 0x0852AA0C
_080ADC64: .4byte 0x0852AA28
_080ADC68: .4byte 0x020205AC
_080ADC6C:
	ldr r2, _080ADC9C
	ldr r1, [r2]
	lsls r0, r6, #2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_080ADC7E:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x13
	bls _080ADC10
	ldr r0, [r2]
	ldr r1, _080ADCA0
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
_080ADC92:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC9C: .4byte 0x08526DE8
_080ADCA0: .4byte 0x00000724
	thumb_func_end CreateFog2Sprites

	thumb_func_start DestroyFog2Sprites
DestroyFog2Sprites: @ 0x080ADCA4
	push {r4, r5, lr}
	ldr r0, _080ADCEC
	ldr r1, [r0]
	ldr r2, _080ADCF0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080ADCE6
	movs r4, #0
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r5, r1, r0
_080ADCBC:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080ADCCA
	bl DestroySprite
_080ADCCA:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _080ADCBC
	ldr r0, _080ADCF4
	bl FreeSpriteTilesByTag
	ldr r0, _080ADCEC
	ldr r0, [r0]
	ldr r1, _080ADCF0
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080ADCE6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADCEC: .4byte 0x08526DE8
_080ADCF0: .4byte 0x00000724
_080ADCF4: .4byte 0x00001203
	thumb_func_end DestroyFog2Sprites

	thumb_func_start UpdateFog2Sprite
UpdateFog2Sprite: @ 0x080ADCF8
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _080ADD48
	ldr r1, [r0]
	ldr r2, _080ADD4C
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x26]
	movs r4, #0xe3
	lsls r4, r4, #3
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, #0x20
	movs r4, #0x2e
	ldrsh r0, [r3, r4]
	lsls r0, r0, #6
	adds r1, r1, r0
	strh r1, [r3, #0x20]
	lsls r1, r1, #0x10
	ldr r0, _080ADD50
	cmp r1, r0
	ble _080ADD40
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r1, r0, #0
	ldrh r2, [r2]
	adds r1, r1, r2
	movs r4, #0x2e
	ldrsh r2, [r3, r4]
	movs r0, #4
	subs r0, r0, r2
	lsls r0, r0, #6
	subs r1, r1, r0
	ldr r0, _080ADD54
	ands r1, r0
	strh r1, [r3, #0x20]
_080ADD40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD48: .4byte 0x08526DE8
_080ADD4C: .4byte 0x0000071A
_080ADD50: .4byte 0x010F0000
_080ADD54: .4byte 0x000001FF
	thumb_func_end UpdateFog2Sprite

	thumb_func_start Sandstorm_InitVars
Sandstorm_InitVars: @ 0x080ADD58
	push {r4, lr}
	ldr r0, _080ADDBC
	ldr r3, [r0]
	ldr r0, _080ADDC0
	adds r1, r3, r0
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080ADDC4
	adds r0, r3, r1
	strb r2, [r0]
	ldr r4, _080ADDC8
	adds r0, r3, r4
	strb r2, [r0]
	ldr r0, _080ADDCC
	adds r1, r3, r0
	movs r0, #0x14
	strb r0, [r1]
	ldr r1, _080ADDD0
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, #0
	bne _080ADDB4
	adds r4, #0x43
	adds r1, r3, r4
	adds r4, #4
	adds r0, r3, r4
	str r2, [r0]
	str r2, [r1]
	ldr r0, _080ADDD4
	adds r1, r3, r0
	movs r0, #8
	strh r0, [r1]
	adds r4, #0xc
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1]
	cmp r2, #0x5f
	bls _080ADDAC
	movs r0, #0x80
	subs r0, r0, r2
	strh r0, [r1]
_080ADDAC:
	movs r0, #0
	movs r1, #0x10
	bl Weather_SetBlendCoeffs
_080ADDB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADDBC: .4byte 0x08526DE8
_080ADDC0: .4byte 0x000006CC
_080ADDC4: .4byte 0x000006D2
_080ADDC8: .4byte 0x000006C1
_080ADDCC: .4byte 0x000006C2
_080ADDD0: .4byte 0x00000716
_080ADDD4: .4byte 0x00000712
	thumb_func_end Sandstorm_InitVars

	thumb_func_start Sandstorm_InitAll
Sandstorm_InitAll: @ 0x080ADDD8
	push {r4, lr}
	bl Sandstorm_InitVars
	ldr r0, _080ADE00
	ldr r1, [r0]
	ldr r2, _080ADE04
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ADDF8
	adds r4, r1, r2
_080ADDEE:
	bl Sandstorm_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080ADDEE
_080ADDF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE00: .4byte 0x08526DE8
_080ADE04: .4byte 0x000006D2
	thumb_func_end Sandstorm_InitAll

	thumb_func_start Sandstorm_Main
Sandstorm_Main: @ 0x080ADE08
	push {r4, r5, lr}
	bl UpdateSandstormMovement
	bl UpdateSandstormWaveIndex
	ldr r0, _080ADE38
	ldr r5, [r0]
	ldr r0, _080ADE3C
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0x5f
	bls _080ADE24
	movs r0, #0x20
	strh r0, [r1]
_080ADE24:
	ldr r0, _080ADE40
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #1
	beq _080ADE54
	cmp r0, #1
	bgt _080ADE44
	cmp r0, #0
	beq _080ADE4A
	b _080ADE78
	.align 2, 0
_080ADE38: .4byte 0x08526DE8
_080ADE3C: .4byte 0x00000712
_080ADE40: .4byte 0x000006CC
_080ADE44:
	cmp r0, #2
	beq _080ADE60
	b _080ADE78
_080ADE4A:
	bl CreateSandstormSprites
	bl CreateSwirlSandstormSprites
	b _080ADE72
_080ADE54:
	movs r0, #0x10
	movs r1, #0
	movs r2, #0
	bl Weather_SetTargetBlendCoeffs
	b _080ADE72
_080ADE60:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ADE78
	ldr r0, _080ADE80
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
_080ADE72:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080ADE78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE80: .4byte 0x000006D2
	thumb_func_end Sandstorm_Main

	thumb_func_start Sandstorm_Finish
Sandstorm_Finish: @ 0x080ADE84
	push {r4, lr}
	bl UpdateSandstormMovement
	bl UpdateSandstormWaveIndex
	ldr r0, _080ADEA8
	ldr r0, [r0]
	ldr r1, _080ADEAC
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #1
	beq _080ADEC2
	cmp r0, #1
	bgt _080ADEB0
	cmp r0, #0
	beq _080ADEB6
	b _080ADEDA
	.align 2, 0
_080ADEA8: .4byte 0x08526DE8
_080ADEAC: .4byte 0x000006CE
_080ADEB0:
	cmp r0, #2
	beq _080ADECE
	b _080ADEDA
_080ADEB6:
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Weather_SetTargetBlendCoeffs
	b _080ADED2
_080ADEC2:
	bl Weather_UpdateBlend
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ADEDE
	b _080ADED2
_080ADECE:
	bl DestroySandstormSprites
_080ADED2:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080ADEDE
_080ADEDA:
	movs r0, #0
	b _080ADEE0
_080ADEDE:
	movs r0, #1
_080ADEE0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Sandstorm_Finish

	thumb_func_start UpdateSandstormWaveIndex
UpdateSandstormWaveIndex: @ 0x080ADEE8
	push {lr}
	ldr r0, _080ADF14
	ldr r2, [r0]
	ldr r0, _080ADF18
	adds r3, r2, r0
	ldrh r0, [r3]
	adds r1, r0, #1
	strh r1, [r3]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bls _080ADF0E
	ldr r1, _080ADF1C
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	strh r1, [r0]
	strh r2, [r3]
_080ADF0E:
	pop {r0}
	bx r0
	.align 2, 0
_080ADF14: .4byte 0x08526DE8
_080ADF18: .4byte 0x00000714
_080ADF1C: .4byte 0x00000712
	thumb_func_end UpdateSandstormWaveIndex

	thumb_func_start UpdateSandstormMovement
UpdateSandstormMovement: @ 0x080ADF20
	push {r4, r5, r6, lr}
	ldr r0, _080ADF84
	ldr r2, [r0]
	ldr r0, _080ADF88
	adds r4, r2, r0
	ldr r6, _080ADF8C
	ldr r1, _080ADF90
	adds r5, r2, r1
	ldrh r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r1, r1, #2
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	movs r0, #0xe1
	lsls r0, r0, #3
	adds r3, r2, r0
	ldrh r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	ldr r1, _080ADF94
	ldr r0, [r4]
	lsrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	ldr r4, _080ADF98
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _080ADF9C
	ldr r0, [r3]
	lsrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r5, #0xe2
	lsls r5, r5, #3
	adds r2, r2, r5
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADF84: .4byte 0x08526DE8
_080ADF88: .4byte 0x00000704
_080ADF8C: .4byte 0x082FA8CC
_080ADF90: .4byte 0x00000712
_080ADF94: .4byte 0x02021B38
_080ADF98: .4byte 0x0000070E
_080ADF9C: .4byte 0x02021B3A
	thumb_func_end UpdateSandstormMovement

	thumb_func_start DestroySandstormSprites
DestroySandstormSprites: @ 0x080ADFA0
	push {r4, r5, lr}
	ldr r0, _080AE024
	ldr r1, [r0]
	ldr r2, _080AE028
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080ADFE2
	movs r4, #0
	movs r0, #0xc8
	lsls r0, r0, #1
	adds r5, r1, r0
_080ADFB8:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080ADFC6
	bl DestroySprite
_080ADFC6:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _080ADFB8
	ldr r0, _080AE024
	ldr r0, [r0]
	ldr r1, _080AE028
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080AE02C
	bl FreeSpriteTilesByTag
_080ADFE2:
	ldr r0, _080AE024
	ldr r1, [r0]
	ldr r2, _080AE030
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AE01C
	movs r4, #0
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r5, r1, r0
_080ADFF8:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080AE006
	bl DestroySprite
_080AE006:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080ADFF8
	ldr r0, _080AE024
	ldr r0, [r0]
	ldr r1, _080AE030
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080AE01C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE024: .4byte 0x08526DE8
_080AE028: .4byte 0x00000716
_080AE02C: .4byte 0x00001204
_080AE030: .4byte 0x00000717
	thumb_func_end DestroySandstormSprites

	thumb_func_start CreateSandstormSprites
CreateSandstormSprites: @ 0x080AE034
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _080AE0A4
	ldr r0, [r0]
	ldr r1, _080AE0A8
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AE0E2
	ldr r0, _080AE0AC
	bl LoadSpriteSheet
	ldr r0, _080AE0B0
	bl LoadCustomWeatherSpritePalette
	movs r7, #0
_080AE054:
	adds r0, r7, #0
	movs r1, #5
	bl __udivsi3
	adds r6, r0, #0
	lsls r2, r6, #0x16
	asrs r2, r2, #0x10
	ldr r0, _080AE0B4
	movs r1, #0
	movs r3, #1
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _080AE0BC
	ldr r2, _080AE0A4
	ldr r5, [r2]
	lsls r0, r7, #2
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r5, r5, r3
	adds r5, r5, r0
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	ldr r0, _080AE0B8
	adds r4, r4, r0
	str r4, [r5]
	adds r0, r7, #0
	movs r1, #5
	str r2, [sp]
	bl __umodsi3
	strh r0, [r4, #0x2e]
	ldr r0, [r5]
	strh r6, [r0, #0x30]
	ldr r2, [sp]
	b _080AE0CE
	.align 2, 0
_080AE0A4: .4byte 0x08526DE8
_080AE0A8: .4byte 0x00000716
_080AE0AC: .4byte 0x0852AA78
_080AE0B0: .4byte 0x08526F4C
_080AE0B4: .4byte 0x0852AA60
_080AE0B8: .4byte 0x020205AC
_080AE0BC:
	ldr r2, _080AE0EC
	ldr r1, [r2]
	lsls r0, r7, #2
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_080AE0CE:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x13
	bls _080AE054
	ldr r0, [r2]
	ldr r1, _080AE0F0
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
_080AE0E2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE0EC: .4byte 0x08526DE8
_080AE0F0: .4byte 0x00000716
	thumb_func_end CreateSandstormSprites

	thumb_func_start CreateSwirlSandstormSprites
CreateSwirlSandstormSprites: @ 0x080AE0F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _080AE19C
	ldr r0, [r4]
	ldr r1, _080AE1A0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AE1E0
	movs r7, #0
	mov sb, r4
	movs r2, #0
	mov sl, r2
_080AE114:
	lsls r0, r7, #1
	mov r8, r0
	adds r6, r0, r7
	lsls r5, r6, #4
	adds r1, r5, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080AE1A4
	movs r2, #0xd0
	movs r3, #1
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _080AE1B8
	mov r2, sb
	ldr r4, [r2]
	lsls r0, r7, #2
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r4, r4, r2
	adds r4, r4, r0
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	ldr r0, _080AE1A8
	adds r2, r2, r0
	str r2, [r4]
	ldrb r1, [r2, #3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #3]
	ldr r1, [r4]
	adds r0, r6, r5
	strh r0, [r1, #0x30]
	ldr r1, [r4]
	movs r0, #8
	strh r0, [r1, #0x2e]
	ldr r0, [r4]
	mov r1, sl
	strh r1, [r0, #0x32]
	ldr r1, [r4]
	ldr r0, _080AE1AC
	strh r0, [r1, #0x36]
	ldr r1, [r4]
	ldr r0, _080AE1B0
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1, #0x34]
	ldr r0, [r4]
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, [r4]
	movs r1, #0
	movs r2, #2
	movs r3, #0
	bl CalcCenterToCornerVec
	ldr r1, [r4]
	ldr r0, _080AE1B4
	str r0, [r1, #0x1c]
	b _080AE1CA
	.align 2, 0
_080AE19C: .4byte 0x08526DE8
_080AE1A0: .4byte 0x00000717
_080AE1A4: .4byte 0x0852AA60
_080AE1A8: .4byte 0x020205AC
_080AE1AC: .4byte 0x00006730
_080AE1B0: .4byte 0x0852AA80
_080AE1B4: .4byte 0x080AE255
_080AE1B8:
	mov r2, sb
	ldr r0, [r2]
	lsls r1, r7, #2
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r0, r0, r1
	mov r1, sl
	str r1, [r0]
_080AE1CA:
	mov r2, sb
	ldr r0, [r2]
	ldr r1, _080AE1F0
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #4
	bls _080AE114
_080AE1E0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE1F0: .4byte 0x00000717
	thumb_func_end CreateSwirlSandstormSprites

	thumb_func_start UpdateSandstormSprite
UpdateSandstormSprite: @ 0x080AE1F4
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _080AE244
	ldr r1, [r0]
	movs r2, #0xe2
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x26]
	ldr r4, _080AE248
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, #0x20
	movs r4, #0x2e
	ldrsh r0, [r3, r4]
	lsls r0, r0, #6
	adds r1, r1, r0
	strh r1, [r3, #0x20]
	lsls r1, r1, #0x10
	ldr r0, _080AE24C
	cmp r1, r0
	ble _080AE23C
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r1, r0, #0
	ldrh r2, [r2]
	adds r1, r1, r2
	movs r4, #0x2e
	ldrsh r2, [r3, r4]
	movs r0, #4
	subs r0, r0, r2
	lsls r0, r0, #6
	subs r1, r1, r0
	ldr r0, _080AE250
	ands r1, r0
	strh r1, [r3, #0x20]
_080AE23C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE244: .4byte 0x08526DE8
_080AE248: .4byte 0x0000070E
_080AE24C: .4byte 0x010F0000
_080AE250: .4byte 0x000001FF
	thumb_func_end UpdateSandstormSprite

	thumb_func_start WaitSandSwirlSpriteEntrance
WaitSandSwirlSpriteEntrance: @ 0x080AE254
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x34]
	subs r0, #1
	strh r0, [r2, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080AE26E
	ldr r0, _080AE274
	str r0, [r2, #0x1c]
_080AE26E:
	pop {r0}
	bx r0
	.align 2, 0
_080AE274: .4byte 0x080AE279
	thumb_func_end WaitSandSwirlSpriteEntrance

	thumb_func_start UpdateSandstormSwirlSprite
UpdateSandstormSwirlSprite: @ 0x080AE278
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x22]
	subs r0, #1
	strh r0, [r5, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x30
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080AE296
	movs r0, #0xd0
	strh r0, [r5, #0x22]
	movs r0, #4
	strh r0, [r5, #0x2e]
_080AE296:
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	ldr r3, _080AE2E8
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r4, #0
	muls r2, r0, r2
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r4, r0
	lsrs r2, r2, #8
	strh r2, [r5, #0x24]
	lsrs r0, r0, #8
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #0x30]
	adds r0, #0xa
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080AE2E2
	movs r0, #0
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080AE2E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE2E8: .4byte 0x082FA8CC
	thumb_func_end UpdateSandstormSwirlSprite

	thumb_func_start Shade_InitVars
Shade_InitVars: @ 0x080AE2EC
	ldr r0, _080AE30C
	ldr r1, [r0]
	ldr r0, _080AE310
	adds r2, r1, r0
	movs r0, #0
	strh r0, [r2]
	ldr r0, _080AE314
	adds r2, r1, r0
	movs r0, #3
	strb r0, [r2]
	ldr r0, _080AE318
	adds r1, r1, r0
	movs r0, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_080AE30C: .4byte 0x08526DE8
_080AE310: .4byte 0x000006CC
_080AE314: .4byte 0x000006C1
_080AE318: .4byte 0x000006C2
	thumb_func_end Shade_InitVars

	thumb_func_start Shade_InitAll
Shade_InitAll: @ 0x080AE31C
	push {lr}
	bl Shade_InitVars
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Shade_InitAll

	thumb_func_start Shade_Main
Shade_Main: @ 0x080AE328
	bx lr
	.align 2, 0
	thumb_func_end Shade_Main

	thumb_func_start Drought_Finish
Drought_Finish: @ 0x080AE32C
	movs r0, #0
	bx lr
	thumb_func_end Drought_Finish

	thumb_func_start Bubbles_InitVars
Bubbles_InitVars: @ 0x080AE330
	push {r4, r5, lr}
	bl Fog1_InitVars
	ldr r0, _080AE370
	ldr r4, [r0]
	ldr r1, _080AE374
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, #0
	bne _080AE368
	ldr r0, _080AE378
	bl LoadSpriteSheet
	movs r2, #0xe5
	lsls r2, r2, #3
	adds r0, r4, r2
	strh r5, [r0]
	ldr r0, _080AE37C
	ldrb r1, [r0]
	subs r2, #2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, _080AE380
	adds r0, r4, r1
	strh r5, [r0]
	adds r2, #6
	adds r0, r4, r2
	strh r5, [r0]
_080AE368:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE370: .4byte 0x08526DE8
_080AE374: .4byte 0x0000072E
_080AE378: .4byte 0x0852AA94
_080AE37C: .4byte 0x0852AA8C
_080AE380: .4byte 0x0000072A
	thumb_func_end Bubbles_InitVars

	thumb_func_start Bubbles_InitAll
Bubbles_InitAll: @ 0x080AE384
	push {r4, lr}
	bl Bubbles_InitVars
	ldr r0, _080AE3AC
	ldr r1, [r0]
	ldr r2, _080AE3B0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AE3A4
	adds r4, r1, r2
_080AE39A:
	bl Bubbles_Main
	ldrb r0, [r4]
	cmp r0, #0
	beq _080AE39A
_080AE3A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE3AC: .4byte 0x08526DE8
_080AE3B0: .4byte 0x000006D2
	thumb_func_end Bubbles_InitAll

	thumb_func_start Bubbles_Main
Bubbles_Main: @ 0x080AE3B4
	push {r4, r5, r6, r7, lr}
	bl Fog1_Main
	ldr r0, _080AE414
	ldr r5, [r0]
	ldr r0, _080AE418
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r0, #1
	movs r6, #0
	strh r0, [r4]
	ldr r1, _080AE41C
	adds r7, r1, #0
	ldr r2, _080AE420
	movs r1, #0xe5
	lsls r1, r1, #3
	adds r3, r5, r1
	ldrh r1, [r3]
	adds r1, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bls _080AE40C
	strh r6, [r4]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	ands r0, r7
	cmp r0, #7
	bls _080AE3F4
	strh r6, [r3]
_080AE3F4:
	ldr r0, _080AE424
	adds r4, r5, r0
	ldrh r0, [r4]
	bl CreateBubbleSprite
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ands r0, r7
	cmp r0, #0xc
	bls _080AE40C
	strh r6, [r4]
_080AE40C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE414: .4byte 0x08526DE8
_080AE418: .4byte 0x00000726
_080AE41C: .4byte 0x0000FFFF
_080AE420: .4byte 0x0852AA8C
_080AE424: .4byte 0x0000072A
	thumb_func_end Bubbles_Main

	thumb_func_start Bubbles_Finish
Bubbles_Finish: @ 0x080AE428
	push {lr}
	bl Fog1_Finish
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE438
	movs r0, #1
	b _080AE43E
_080AE438:
	bl DestroyBubbleSprites
	movs r0, #0
_080AE43E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Bubbles_Finish

	thumb_func_start CreateBubbleSprite
CreateBubbleSprite: @ 0x080AE444
	push {r4, lr}
	lsls r0, r0, #0x10
	ldr r1, _080AE4B4
	lsrs r0, r0, #0xe
	adds r3, r0, r1
	adds r1, #2
	adds r0, r0, r1
	ldr r1, _080AE4B8
	ldrh r2, [r0]
	ldrh r0, [r1]
	subs r2, r2, r0
	ldr r0, _080AE4BC
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _080AE4AC
	ldr r0, _080AE4C0
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	strb r0, [r1, #5]
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r2, #2
	orrs r0, r2
	strb r0, [r3]
	movs r0, #0
	strh r0, [r1, #0x2e]
	strh r0, [r1, #0x30]
	strh r0, [r1, #0x32]
	ldr r0, _080AE4C4
	ldr r1, [r0]
	ldr r0, _080AE4C8
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080AE4AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE4B4: .4byte 0x0852AA9C
_080AE4B8: .4byte 0x02021B3A
_080AE4BC: .4byte 0x0852AAE0
_080AE4C0: .4byte 0x020205AC
_080AE4C4: .4byte 0x08526DE8
_080AE4C8: .4byte 0x0000072C
	thumb_func_end CreateBubbleSprite

	thumb_func_start DestroyBubbleSprites
DestroyBubbleSprites: @ 0x080AE4CC
	push {r4, r5, lr}
	ldr r0, _080AE51C
	ldr r0, [r0]
	ldr r1, _080AE520
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080AE516
	movs r4, #0
	ldr r5, _080AE524
_080AE4E0:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r2, r0, #2
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _080AE528
	cmp r1, r0
	bne _080AE4FA
	adds r0, r2, r5
	bl DestroySprite
_080AE4FA:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x3f
	bls _080AE4E0
	ldr r0, _080AE52C
	bl FreeSpriteTilesByTag
	ldr r0, _080AE51C
	ldr r0, [r0]
	ldr r1, _080AE520
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_080AE516:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE51C: .4byte 0x08526DE8
_080AE520: .4byte 0x0000072C
_080AE524: .4byte 0x020205AC
_080AE528: .4byte 0x0852AAE0
_080AE52C: .4byte 0x00001205
	thumb_func_end DestroyBubbleSprites

	thumb_func_start UpdateBubbleSprite
UpdateBubbleSprite: @ 0x080AE530
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2e]
	movs r2, #0
	adds r0, #2
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080AE570
	strh r2, [r1, #0x2e]
	movs r3, #0x30
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _080AE562
	ldrh r0, [r1, #0x24]
	adds r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _080AE570
	movs r0, #1
	strh r0, [r1, #0x30]
	b _080AE570
_080AE562:
	ldrh r0, [r1, #0x24]
	subs r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080AE570
	strh r2, [r1, #0x30]
_080AE570:
	ldrh r0, [r1, #0x22]
	subs r0, #3
	strh r0, [r1, #0x22]
	ldrh r0, [r1, #0x32]
	adds r0, #1
	strh r0, [r1, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	ble _080AE58A
	adds r0, r1, #0
	bl DestroySprite
_080AE58A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateBubbleSprite

	thumb_func_start UnusedSetCurrentAlternatingWeather
UnusedSetCurrentAlternatingWeather: @ 0x080AE590
	ldr r2, _080AE59C
	strb r0, [r2]
	ldr r0, _080AE5A0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080AE59C: .4byte 0x02038864
_080AE5A0: .4byte 0x02038866
	thumb_func_end UnusedSetCurrentAlternatingWeather

	thumb_func_start Task_DoAlternatingWeather
Task_DoAlternatingWeather: @ 0x080AE5A4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080AE5C4
	adds r4, r1, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080AE5C8
	cmp r0, #1
	beq _080AE5F4
	b _080AE618
	.align 2, 0
_080AE5C4: .4byte 0x03005B68
_080AE5C8:
	ldrh r0, [r4, #0x1e]
	subs r1, r0, #1
	strh r1, [r4, #0x1e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080AE618
	ldrb r0, [r4, #2]
	bl SetNextWeather
	ldr r1, _080AE5F0
	ldrh r0, [r4, #2]
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r1, #0
	strh r0, [r4, #0x1e]
	ldrh r0, [r4]
	adds r0, #1
	b _080AE616
	.align 2, 0
_080AE5F0: .4byte 0x02038864
_080AE5F4:
	ldrh r0, [r4, #0x1e]
	subs r1, r0, #1
	strh r1, [r4, #0x1e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080AE618
	ldrb r0, [r4, #4]
	bl SetNextWeather
	ldr r1, _080AE620
	ldrh r0, [r4, #4]
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r1, #0
	strh r0, [r4, #0x1e]
	movs r0, #0
_080AE616:
	strh r0, [r4]
_080AE618:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE620: .4byte 0x02038864
	thumb_func_end Task_DoAlternatingWeather

	thumb_func_start CreateAlternatingWeatherTask
CreateAlternatingWeatherTask: @ 0x080AE624
	push {lr}
	ldr r0, _080AE650
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080AE654
	adds r1, r1, r0
	movs r2, #0x96
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1, #0x1e]
	ldr r3, _080AE658
	ldrb r2, [r3]
	cmp r2, #0xd
	bne _080AE65C
	movs r0, #0xc
	b _080AE662
	.align 2, 0
_080AE650: .4byte 0x080AE5A5
_080AE654: .4byte 0x03005B68
_080AE658: .4byte 0x02038864
_080AE65C:
	cmp r2, #0xc
	bne _080AE668
	movs r0, #0xd
_080AE662:
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	b _080AE674
_080AE668:
	movs r0, #0xd
	strb r0, [r3]
	movs r0, #0xc
	strh r0, [r1, #2]
	movs r0, #0xd
	strh r0, [r1, #4]
_080AE674:
	pop {r0}
	bx r0
	thumb_func_end CreateAlternatingWeatherTask

	thumb_func_start SetSav1Weather
SetSav1Weather: @ 0x080AE678
	push {r4, r5, lr}
	ldr r4, _080AE6A4
	ldr r1, [r4]
	adds r1, #0x2e
	ldrb r5, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl TranslateWeatherNum
	ldr r1, [r4]
	adds r1, #0x2e
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, r5, #0
	bl UpdateRainCounter
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE6A4: .4byte 0x03005AEC
	thumb_func_end SetSav1Weather

	thumb_func_start GetSav1Weather
GetSav1Weather: @ 0x080AE6A8
	ldr r0, _080AE6B4
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080AE6B4: .4byte 0x03005AEC
	thumb_func_end GetSav1Weather

	thumb_func_start SetSav1WeatherFromCurrMapHeader
SetSav1WeatherFromCurrMapHeader: @ 0x080AE6B8
	push {r4, r5, lr}
	ldr r4, _080AE6E4
	ldr r0, [r4]
	adds r0, #0x2e
	ldrb r5, [r0]
	ldr r0, _080AE6E8
	ldrb r0, [r0, #0x16]
	bl TranslateWeatherNum
	ldr r1, [r4]
	adds r1, #0x2e
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, r5, #0
	bl UpdateRainCounter
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE6E4: .4byte 0x03005AEC
_080AE6E8: .4byte 0x02036FB8
	thumb_func_end SetSav1WeatherFromCurrMapHeader

	thumb_func_start SetWeather
SetWeather: @ 0x080AE6EC
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetNextWeather
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetWeather

	thumb_func_start SetWeather_Unused
SetWeather_Unused: @ 0x080AE704
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetCurrentAndNextWeather
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetWeather_Unused

	thumb_func_start DoCurrentWeather
DoCurrentWeather: @ 0x080AE71C
	push {r4, r5, lr}
	bl GetSav1Weather
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bne _080AE748
	ldr r0, _080AE740
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AE73A
	bl CreateAlternatingWeatherTask
_080AE73A:
	ldr r0, _080AE744
	ldrb r4, [r0]
	b _080AE76A
	.align 2, 0
_080AE740: .4byte 0x080AE5A5
_080AE744: .4byte 0x02038864
_080AE748:
	ldr r5, _080AE778
	adds r0, r5, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE764
	adds r0, r5, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080AE764:
	ldr r1, _080AE77C
	movs r0, #0xd
	strb r0, [r1]
_080AE76A:
	adds r0, r4, #0
	bl SetNextWeather
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE778: .4byte 0x080AE5A5
_080AE77C: .4byte 0x02038864
	thumb_func_end DoCurrentWeather

	thumb_func_start ResumePausedWeather
ResumePausedWeather: @ 0x080AE780
	push {r4, r5, lr}
	bl GetSav1Weather
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bne _080AE7AC
	ldr r0, _080AE7A4
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AE79E
	bl CreateAlternatingWeatherTask
_080AE79E:
	ldr r0, _080AE7A8
	ldrb r4, [r0]
	b _080AE7CE
	.align 2, 0
_080AE7A4: .4byte 0x080AE5A5
_080AE7A8: .4byte 0x02038864
_080AE7AC:
	ldr r5, _080AE7DC
	adds r0, r5, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE7C8
	adds r0, r5, #0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
_080AE7C8:
	ldr r1, _080AE7E0
	movs r0, #0xd
	strb r0, [r1]
_080AE7CE:
	adds r0, r4, #0
	bl SetCurrentAndNextWeather
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE7DC: .4byte 0x080AE5A5
_080AE7E0: .4byte 0x02038864
	thumb_func_end ResumePausedWeather

	thumb_func_start TranslateWeatherNum
TranslateWeatherNum: @ 0x080AE7E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x15
	bhi _080AE8B0
	lsls r0, r0, #2
	ldr r1, _080AE7F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE7F8: .4byte 0x080AE7FC
_080AE7FC: @ jump table
	.4byte _080AE8B0 @ case 0
	.4byte _080AE854 @ case 1
	.4byte _080AE858 @ case 2
	.4byte _080AE85C @ case 3
	.4byte _080AE860 @ case 4
	.4byte _080AE864 @ case 5
	.4byte _080AE868 @ case 6
	.4byte _080AE86C @ case 7
	.4byte _080AE870 @ case 8
	.4byte _080AE874 @ case 9
	.4byte _080AE878 @ case 10
	.4byte _080AE87C @ case 11
	.4byte _080AE880 @ case 12
	.4byte _080AE884 @ case 13
	.4byte _080AE888 @ case 14
	.4byte _080AE88C @ case 15
	.4byte _080AE8B0 @ case 16
	.4byte _080AE8B0 @ case 17
	.4byte _080AE8B0 @ case 18
	.4byte _080AE8B0 @ case 19
	.4byte _080AE890 @ case 20
	.4byte _080AE898 @ case 21
_080AE854:
	movs r0, #1
	b _080AE8B2
_080AE858:
	movs r0, #2
	b _080AE8B2
_080AE85C:
	movs r0, #3
	b _080AE8B2
_080AE860:
	movs r0, #4
	b _080AE8B2
_080AE864:
	movs r0, #5
	b _080AE8B2
_080AE868:
	movs r0, #6
	b _080AE8B2
_080AE86C:
	movs r0, #7
	b _080AE8B2
_080AE870:
	movs r0, #8
	b _080AE8B2
_080AE874:
	movs r0, #9
	b _080AE8B2
_080AE878:
	movs r0, #0xa
	b _080AE8B2
_080AE87C:
	movs r0, #0xb
	b _080AE8B2
_080AE880:
	movs r0, #0xc
	b _080AE8B2
_080AE884:
	movs r0, #0xd
	b _080AE8B2
_080AE888:
	movs r0, #0xe
	b _080AE8B2
_080AE88C:
	movs r0, #0xf
	b _080AE8B2
_080AE890:
	ldr r1, _080AE894
	b _080AE89A
	.align 2, 0
_080AE894: .4byte 0x0852AAF8
_080AE898:
	ldr r1, _080AE8A8
_080AE89A:
	ldr r0, _080AE8AC
	ldr r0, [r0]
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	b _080AE8B2
	.align 2, 0
_080AE8A8: .4byte 0x0852AAFC
_080AE8AC: .4byte 0x03005AEC
_080AE8B0:
	movs r0, #0
_080AE8B2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TranslateWeatherNum

	thumb_func_start UpdateWeatherPerDay
UpdateWeatherPerDay: @ 0x080AE8B8
	lsls r0, r0, #0x10
	ldr r1, _080AE8D4
	ldr r2, [r1]
	adds r2, #0x2f
	lsrs r0, r0, #0x10
	ldrb r1, [r2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r1, r1, #0x10
	strb r1, [r2]
	bx lr
	.align 2, 0
_080AE8D4: .4byte 0x03005AEC
	thumb_func_end UpdateWeatherPerDay

	thumb_func_start UpdateRainCounter
UpdateRainCounter: @ 0x080AE8D8
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r0, r1
	beq _080AE8F2
	cmp r2, #3
	beq _080AE8EC
	cmp r2, #5
	bne _080AE8F2
_080AE8EC:
	movs r0, #0x28
	bl IncrementGameStat
_080AE8F2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateRainCounter

