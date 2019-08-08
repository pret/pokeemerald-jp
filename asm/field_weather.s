.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start StartWeather
StartWeather: @ 0x080AA8A0
	push {r4, r5, r6, lr}
	ldr r0, _080AA964
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _080AA95C
	movs r0, #0x90
	lsls r0, r0, #5
	bl AllocSpritePalette
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080AA968
	lsls r1, r5, #5
	ldr r2, _080AA96C
	adds r1, r1, r2
	ldr r2, _080AA970
	bl CpuSet
	bl BuildGammaShiftTables
	ldr r4, _080AA974
	ldr r1, _080AA978
	adds r0, r4, r1
	strb r5, [r0]
	ldr r0, _080AA97C
	bl AllocSpritePalette
	ldr r2, _080AA980
	adds r1, r4, r2
	strb r0, [r1]
	ldr r1, _080AA984
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, #4
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, #4
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, #0xc
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, #0x22
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, #0x17
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, #0x24
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, #0x1b
	adds r0, r4, r2
	strb r6, [r0]
	subs r1, #0xd
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, #0x18
	adds r0, r4, r2
	strb r6, [r0]
	subs r1, #0x1d
	adds r0, r4, r1
	strb r6, [r0]
	movs r0, #0x10
	movs r1, #0
	bl Weather_SetBlendCoeffs
	movs r2, #0xda
	lsls r2, r2, #3
	adds r0, r4, r2
	strb r6, [r0]
	ldr r0, _080AA988
	adds r1, r4, r0
	movs r0, #3
	strb r0, [r1]
	movs r1, #0xd9
	lsls r1, r1, #3
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, #3
	adds r1, r4, r2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080AA98C
	movs r1, #0x50
	bl CreateTask
	ldr r1, _080AA990
	adds r4, r4, r1
	strb r0, [r4]
_080AA95C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AA964: .4byte 0x080AAAAD
_080AA968: .4byte 0x08526F0C
_080AA96C: .4byte 0x020375B4
_080AA970: .4byte 0x04000008
_080AA974: .4byte 0x020380F4
_080AA978: .4byte 0x000006D5
_080AA97C: .4byte 0x00001201
_080AA980: .4byte 0x000006D4
_080AA984: .4byte 0x000006DA
_080AA988: .4byte 0x000006C6
_080AA98C: .4byte 0x080AAA5D
_080AA990: .4byte 0x000006C9
	thumb_func_end StartWeather

	thumb_func_start SetNextWeather
SetNextWeather: @ 0x080AA994
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq _080AA9AA
	cmp r4, #5
	beq _080AA9AA
	cmp r4, #0xd
	beq _080AA9AA
	bl PlayRainStoppingSoundEffect
_080AA9AA:
	ldr r1, _080AA9EC
	ldr r2, _080AA9F0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r4
	beq _080AA9CE
	movs r3, #0xda
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _080AA9CE
	ldr r0, _080AA9F4
	lsls r1, r4, #4
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_080AA9CE:
	ldr r1, _080AA9EC
	ldr r2, _080AA9F8
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _080AA9F0
	adds r0, r1, r3
	strb r4, [r0]
	ldr r0, _080AA9FC
	adds r1, r1, r0
	strh r2, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA9EC: .4byte 0x020380F4
_080AA9F0: .4byte 0x000006D1
_080AA9F4: .4byte 0x08526DEC
_080AA9F8: .4byte 0x000006D3
_080AA9FC: .4byte 0x000006CE
	thumb_func_end SetNextWeather

	thumb_func_start SetCurrentAndNextWeather
SetCurrentAndNextWeather: @ 0x080AAA00
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl PlayRainStoppingSoundEffect
	ldr r0, _080AAA24
	movs r2, #0xda
	lsls r2, r2, #3
	adds r1, r0, r2
	strb r4, [r1]
	ldr r1, _080AAA28
	adds r0, r0, r1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAA24: .4byte 0x020380F4
_080AAA28: .4byte 0x000006D1
	thumb_func_end SetCurrentAndNextWeather

	thumb_func_start SetCurrentAndNextWeatherNoDelay
SetCurrentAndNextWeatherNoDelay: @ 0x080AAA2C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl PlayRainStoppingSoundEffect
	ldr r1, _080AAA58
	movs r2, #0xda
	lsls r2, r2, #3
	adds r0, r1, r2
	strb r4, [r0]
	adds r2, #1
	adds r0, r1, r2
	strb r4, [r0]
	movs r0, #0xd9
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAA58: .4byte 0x020380F4
	thumb_func_end SetCurrentAndNextWeatherNoDelay

	thumb_func_start Task_WeatherInit
Task_WeatherInit: @ 0x080AAA5C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _080AAA9C
	movs r1, #0xd9
	lsls r1, r1, #3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AAA94
	ldr r1, _080AAAA0
	movs r3, #0xda
	lsls r3, r3, #3
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _080AAAA4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080AAAA8
	str r1, [r0]
_080AAA94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAA9C: .4byte 0x020380F4
_080AAAA0: .4byte 0x08526DEC
_080AAAA4: .4byte 0x03005B60
_080AAAA8: .4byte 0x080AAAAD
	thumb_func_end Task_WeatherInit

	thumb_func_start Task_WeatherMain
Task_WeatherMain: @ 0x080AAAAC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r5, _080AAB14
	movs r0, #0xda
	lsls r0, r0, #3
	adds r6, r5, r0
	ldr r1, _080AAB18
	adds r7, r5, r1
	ldrb r0, [r6]
	ldrb r2, [r7]
	cmp r0, r2
	beq _080AAB28
	ldr r0, _080AAB1C
	mov sb, r0
	ldrb r0, [r6]
	lsls r0, r0, #4
	mov r1, sb
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080AAB38
	ldr r1, _080AAB20
	adds r1, r1, r5
	mov r8, r1
	ldrb r0, [r1]
	cmp r0, #2
	beq _080AAB38
	ldrb r0, [r7]
	lsls r0, r0, #4
	add r0, sb
	ldr r0, [r0]
	bl _call_via_r0
	ldr r2, _080AAB24
	adds r0, r5, r2
	strb r4, [r0]
	mov r0, r8
	strb r4, [r0]
	ldrb r0, [r7]
	strb r0, [r6]
	adds r2, #0x10
	adds r1, r5, r2
	movs r0, #1
	strb r0, [r1]
	b _080AAB38
	.align 2, 0
_080AAB14: .4byte 0x020380F4
_080AAB18: .4byte 0x000006D1
_080AAB1C: .4byte 0x08526DEC
_080AAB20: .4byte 0x000006C6
_080AAB24: .4byte 0x000006C3
_080AAB28:
	ldr r0, _080AAB58
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_080AAB38:
	ldr r1, _080AAB5C
	ldr r0, _080AAB60
	ldr r2, _080AAB64
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end Task_WeatherMain

	thumb_func_start None_Main
None_Main: @ 0x080AAB4C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAB58: .4byte 0x08526DEC
_080AAB5C: .4byte 0x08526EDC
_080AAB60: .4byte 0x020380F4
_080AAB64: .4byte 0x000006C6
	thumb_func_end None_Main

	thumb_func_start None_Init
None_Init: @ 0x080AAB68
	ldr r0, _080AAB7C
	ldr r2, _080AAB80
	adds r1, r0, r2
	movs r2, #0
	strb r2, [r1]
	ldr r1, _080AAB84
	adds r0, r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_080AAB7C: .4byte 0x020380F4
_080AAB80: .4byte 0x000006C1
_080AAB84: .4byte 0x000006C2
	thumb_func_end None_Init

	thumb_func_start SetWeatherScreenFadeOut
SetWeatherScreenFadeOut: @ 0x080AAB88
	bx lr
	.align 2, 0
	thumb_func_end SetWeatherScreenFadeOut

	thumb_func_start None_Finish
None_Finish: @ 0x080AAB8C
	movs r0, #0
	bx lr
	thumb_func_end None_Finish

	thumb_func_start BuildGammaShiftTables
BuildGammaShiftTables: @ 0x080AAB90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080AABD0
	ldr r0, _080AABD4
	str r0, [r1]
	movs r0, #0
	mov ip, r0
	ldr r1, _080AABD8
	mov sl, r1
_080AABA8:
	mov r7, sl
	mov r0, ip
	cmp r0, #0
	bne _080AABB4
	ldr r1, _080AABDC
	adds r7, r7, r1
_080AABB4:
	movs r5, #0
	movs r0, #1
	add r0, ip
	mov sb, r0
_080AABBC:
	lsls r1, r5, #8
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x10
	mov r0, ip
	cmp r0, #0
	bne _080AABE0
	adds r0, r1, #0
	lsls r0, r0, #0xc
	lsrs r4, r0, #0x10
	b _080AABE2
	.align 2, 0
_080AABD0: .4byte 0x03000F50
_080AABD4: .4byte 0x08526EEC
_080AABD8: .4byte 0x02038554
_080AABDC: .4byte 0xFFFFFDA0
_080AABE0:
	movs r4, #0
_080AABE2:
	movs r3, #0
	adds r1, r5, #1
	mov r8, r1
_080AABE8:
	subs r1, r2, r4
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	lsls r0, r3, #5
	adds r0, r0, r7
	adds r0, r0, r5
	lsrs r1, r1, #0x18
	strb r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #2
	bls _080AABE8
	adds r6, r2, #0
	movs r0, #0xf8
	lsls r0, r0, #5
	subs r0, r0, r2
	cmp r0, #0
	bge _080AAC10
	adds r0, #0xf
_080AAC10:
	lsls r0, r0, #0xc
	lsrs r4, r0, #0x10
	cmp r5, #0xb
	bhi _080AAC5A
	cmp r3, #0x12
	bhi _080AAC80
_080AAC1C:
	adds r0, r2, r4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	subs r0, r2, r6
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	ble _080AAC38
	lsrs r0, r0, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080AAC38:
	lsls r0, r3, #5
	adds r0, r0, r7
	adds r1, r0, r5
	lsrs r0, r2, #8
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080AAC4E
	movs r0, #0x1f
	strb r0, [r1]
_080AAC4E:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x12
	bls _080AAC1C
	b _080AAC80
_080AAC5A:
	cmp r3, #0x12
	bhi _080AAC80
	movs r6, #0x1f
_080AAC60:
	adds r1, r2, r4
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	lsls r0, r3, #5
	adds r0, r0, r7
	adds r0, r0, r5
	lsrs r1, r1, #0x18
	strb r1, [r0]
	cmp r1, #0x1f
	bls _080AAC76
	strb r6, [r0]
_080AAC76:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x12
	bls _080AAC60
_080AAC80:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1f
	bls _080AABBC
	mov r1, sb
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	cmp r0, #1
	bls _080AABA8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end BuildGammaShiftTables

	thumb_func_start UpdateWeatherGammaShift
UpdateWeatherGammaShift: @ 0x080AACA4
	push {r4, r5, r6, r7, lr}
	ldr r0, _080AACD4
	ldr r1, _080AACD8
	adds r2, r0, r1
	ldrb r1, [r2]
	adds r3, r0, #0
	cmp r1, #2
	beq _080AAD28
	movs r7, #0xd8
	lsls r7, r7, #3
	adds r4, r3, r7
	ldr r1, _080AACDC
	adds r0, r3, r1
	ldrb r7, [r4]
	mov ip, r7
	movs r6, #0
	ldrsb r6, [r4, r6]
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r6, r5
	bne _080AACE0
	movs r0, #3
	strb r0, [r2]
	b _080AAD28
	.align 2, 0
_080AACD4: .4byte 0x020380F4
_080AACD8: .4byte 0x000006C6
_080AACDC: .4byte 0x000006C1
_080AACE0:
	ldr r0, _080AAD08
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r7, _080AAD0C
	adds r1, r3, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _080AAD28
	movs r0, #0
	strb r0, [r2]
	mov r0, ip
	cmp r6, r5
	bge _080AAD10
	adds r0, #1
	b _080AAD14
	.align 2, 0
_080AAD08: .4byte 0x000006C3
_080AAD0C: .4byte 0x000006C2
_080AAD10:
	mov r0, ip
	subs r0, #1
_080AAD14:
	strb r0, [r4]
	movs r1, #0xd8
	lsls r1, r1, #3
	adds r0, r3, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r0, #0
	movs r1, #0x20
	bl ApplyGammaShift
_080AAD28:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateWeatherGammaShift

	thumb_func_start FadeInScreenWithWeather
FadeInScreenWithWeather: @ 0x080AAD30
	push {lr}
	ldr r2, _080AAD68
	ldr r0, _080AAD6C
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080AAD4E
	ldr r3, _080AAD70
	adds r1, r2, r3
	movs r0, #0
	strb r0, [r1]
_080AAD4E:
	movs r1, #0xda
	lsls r1, r1, #3
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #3
	cmp r0, #0xa
	bhi _080AAE18
	lsls r0, r0, #2
	ldr r1, _080AAD74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AAD68: .4byte 0x020380F4
_080AAD6C: .4byte 0x000006CB
_080AAD70: .4byte 0x000006CA
_080AAD74: .4byte 0x080AAD78
_080AAD78: @ jump table
	.4byte _080AADA4 @ case 0
	.4byte _080AADA4 @ case 1
	.4byte _080AADA4 @ case 2
	.4byte _080AADF0 @ case 3
	.4byte _080AAE18 @ case 4
	.4byte _080AAE18 @ case 5
	.4byte _080AAE18 @ case 6
	.4byte _080AAE18 @ case 7
	.4byte _080AADA4 @ case 8
	.4byte _080AADCC @ case 9
	.4byte _080AADA4 @ case 10
_080AADA4:
	bl FadeInScreen_RainShowShade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AAE38
	ldr r0, _080AADC4
	movs r2, #0xd8
	lsls r2, r2, #3
	adds r1, r0, r2
	movs r2, #3
	strb r2, [r1]
	ldr r3, _080AADC8
	adds r0, r0, r3
	strb r2, [r0]
	b _080AAE38
	.align 2, 0
_080AADC4: .4byte 0x020380F4
_080AADC8: .4byte 0x000006C6
_080AADCC:
	bl FadeInScreen_Drought
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AAE38
	ldr r1, _080AADE8
	movs r0, #0xd8
	lsls r0, r0, #3
	adds r2, r1, r0
	movs r0, #0xfa
	strb r0, [r2]
	ldr r2, _080AADEC
	adds r1, r1, r2
	b _080AAE34
	.align 2, 0
_080AADE8: .4byte 0x020380F4
_080AADEC: .4byte 0x000006C6
_080AADF0:
	bl FadeInScreen_Fog1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080AAE38
	ldr r0, _080AAE10
	movs r3, #0xd8
	lsls r3, r3, #3
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _080AAE14
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	b _080AAE38
	.align 2, 0
_080AAE10: .4byte 0x020380F4
_080AAE14: .4byte 0x000006C6
_080AAE18:
	ldr r0, _080AAE3C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080AAE38
	ldr r3, _080AAE40
	adds r0, r2, r3
	ldrb r1, [r0]
	subs r3, #1
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _080AAE44
	adds r1, r2, r0
_080AAE34:
	movs r0, #3
	strb r0, [r1]
_080AAE38:
	pop {r0}
	bx r0
	.align 2, 0
_080AAE3C: .4byte 0x02037C74
_080AAE40: .4byte 0x000006C1
_080AAE44: .4byte 0x000006C6
	thumb_func_end FadeInScreenWithWeather

	thumb_func_start FadeInScreen_RainShowShade
FadeInScreen_RainShowShade: @ 0x080AAE48
	push {r4, lr}
	sub sp, #4
	ldr r2, _080AAE84
	ldr r0, _080AAE88
	adds r4, r2, r0
	ldrb r0, [r4]
	cmp r0, #0x10
	beq _080AAE9E
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _080AAE90
	movs r3, #0x10
	subs r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _080AAE8C
	adds r0, r2, r1
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x20
	movs r2, #3
	bl ApplyGammaShiftWithBlend
	movs r0, #1
	b _080AAEA0
	.align 2, 0
_080AAE84: .4byte 0x020380F4
_080AAE88: .4byte 0x000006C7
_080AAE8C: .4byte 0x000006C4
_080AAE90:
	movs r0, #0
	movs r1, #0x20
	movs r2, #3
	bl ApplyGammaShift
	movs r0, #0x10
	strb r0, [r4]
_080AAE9E:
	movs r0, #0
_080AAEA0:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FadeInScreen_RainShowShade

	thumb_func_start FadeInScreen_Drought
FadeInScreen_Drought: @ 0x080AAEA8
	push {r4, lr}
	ldr r2, _080AAEDC
	ldr r0, _080AAEE0
	adds r4, r2, r0
	ldrb r0, [r4]
	cmp r0, #0x10
	beq _080AAEF8
	adds r3, r0, #1
	strb r3, [r4]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _080AAEE8
	movs r0, #6
	rsbs r0, r0, #0
	movs r1, #0x10
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080AAEE4
	adds r2, r2, r3
	ldrh r2, [r2]
	bl ApplyDroughtGammaShiftWithBlend
	movs r0, #1
	b _080AAEFA
	.align 2, 0
_080AAEDC: .4byte 0x020380F4
_080AAEE0: .4byte 0x000006C7
_080AAEE4: .4byte 0x000006C4
_080AAEE8:
	movs r2, #6
	rsbs r2, r2, #0
	movs r0, #0
	movs r1, #0x20
	bl ApplyGammaShift
	movs r0, #0x10
	strb r0, [r4]
_080AAEF8:
	movs r0, #0
_080AAEFA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FadeInScreen_Drought

	thumb_func_start FadeInScreen_Fog1
FadeInScreen_Fog1: @ 0x080AAF00
	push {lr}
	ldr r2, _080AAF28
	ldr r1, _080AAF2C
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0x10
	beq _080AAF34
	adds r1, #1
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080AAF30
	adds r1, r2, r3
	ldrh r1, [r1]
	bl ApplyFogBlend
	movs r0, #1
	b _080AAF36
	.align 2, 0
_080AAF28: .4byte 0x020380F4
_080AAF2C: .4byte 0x000006C7
_080AAF30: .4byte 0x000006C4
_080AAF34:
	movs r0, #0
_080AAF36:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FadeInScreen_Fog1

	thumb_func_start DoNothing
DoNothing: @ 0x080AAF3C
	bx lr
	.align 2, 0
	thumb_func_end DoNothing

	thumb_func_start ApplyGammaShift
ApplyGammaShift: @ 0x080AAF40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, r3, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	asrs r0, r2, #0x18
	cmp r0, #0
	ble _080AB050
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r6, r3, #4
	adds r0, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r4, sb
	blo _080AAF78
	b _080AB12A
_080AAF78:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x13
	str r0, [sp, #4]
_080AAF80:
	ldr r0, _080AAFB0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AAFBC
	lsls r1, r6, #1
	ldr r0, _080AAFB4
	adds r0, r1, r0
	ldr r2, _080AAFB8
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r2, sb
	lsls r2, r2, #0x10
	mov r8, r2
	adds r4, #1
	mov ip, r4
	b _080AB03A
	.align 2, 0
_080AAFB0: .4byte 0x03000F50
_080AAFB4: .4byte 0x020373B4
_080AAFB8: .4byte 0x020377B4
_080AAFBC:
	cmp r0, #2
	beq _080AAFD0
	adds r1, r4, #0
	subs r1, #0x10
	ldr r2, _080AAFD4
	ldr r3, _080AAFD8
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _080AAFE0
_080AAFD0:
	ldr r0, _080AAFDC
	b _080AAFE6
	.align 2, 0
_080AAFD4: .4byte 0x020380F4
_080AAFD8: .4byte 0x000006D5
_080AAFDC: .4byte 0x02038554
_080AAFE0:
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r2, r3
_080AAFE6:
	ldr r1, [sp, #4]
	adds r5, r1, r0
	movs r7, #0
	mov r2, sb
	lsls r2, r2, #0x10
	mov r8, r2
	adds r4, #1
	mov ip, r4
	ldr r3, _080AB048
	mov sl, r3
_080AAFFA:
	adds r2, r6, #0
	lsls r0, r2, #1
	ldr r1, _080AB04C
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1b
	adds r0, r5, r0
	ldrb r4, [r0]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	adds r1, r5, r1
	ldrb r1, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r2, r2, #1
	add r2, sl
	lsls r1, r1, #0xa
	lsls r3, r3, #5
	orrs r1, r3
	orrs r1, r4
	strh r1, [r2]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0xf
	bls _080AAFFA
_080AB03A:
	mov r2, ip
	lsls r0, r2, #0x10
	lsrs r4, r0, #0x10
	cmp r0, r8
	blo _080AAF80
	b _080AB12A
	.align 2, 0
_080AB048: .4byte 0x020377B4
_080AB04C: .4byte 0x020373B4
_080AB050:
	cmp r0, #0
	bge _080AB118
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r6, r3, #4
	adds r0, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r4, r3, #0
	cmp r4, sb
	bhs _080AB12A
_080AB06C:
	ldr r0, _080AB09C
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AB0A8
	lsls r1, r6, #1
	ldr r0, _080AB0A0
	adds r0, r1, r0
	ldr r2, _080AB0A4
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r3, sb
	lsls r3, r3, #0x10
	mov r8, r3
	adds r4, #1
	mov ip, r4
	b _080AB100
	.align 2, 0
_080AB09C: .4byte 0x03000F50
_080AB0A0: .4byte 0x020373B4
_080AB0A4: .4byte 0x020377B4
_080AB0A8:
	movs r7, #0
	mov r0, sb
	lsls r0, r0, #0x10
	mov r8, r0
	adds r4, #1
	mov ip, r4
	ldr r1, _080AB10C
	mov sl, r1
	ldr r2, [sp]
	lsls r0, r2, #0x18
	asrs r5, r0, #0xb
_080AB0BE:
	lsls r0, r6, #1
	ldr r3, _080AB110
	adds r4, r0, r3
	ldr r1, _080AB114
	adds r0, r0, r1
	ldrh r3, [r0]
	lsls r3, r3, #0x10
	lsrs r0, r3, #0x11
	movs r1, #0xf
	ands r0, r1
	lsrs r1, r3, #0x12
	movs r2, #0xf0
	ands r1, r2
	orrs r0, r1
	lsrs r3, r3, #0x13
	movs r2, #0xf0
	lsls r2, r2, #4
	adds r1, r2, #0
	ands r3, r1
	orrs r0, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	add r0, sl
	ldrh r0, [r0]
	strh r0, [r4]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0xf
	bls _080AB0BE
_080AB100:
	mov r3, ip
	lsls r0, r3, #0x10
	lsrs r4, r0, #0x10
	cmp r0, r8
	blo _080AB06C
	b _080AB12A
	.align 2, 0
_080AB10C: .4byte 0x0851ADE8
_080AB110: .4byte 0x020377B4
_080AB114: .4byte 0x020373B4
_080AB118:
	lsls r1, r4, #5
	ldr r0, _080AB13C
	adds r0, r1, r0
	ldr r2, _080AB140
	adds r1, r1, r2
	mov r3, sb
	lsls r2, r3, #3
	bl CpuFastSet
_080AB12A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB13C: .4byte 0x020373B4
_080AB140: .4byte 0x020377B4
	thumb_func_end ApplyGammaShift

	thumb_func_start ApplyGammaShiftWithBlend
ApplyGammaShiftWithBlend: @ 0x080AB144
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r4, [sp, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	mov r1, sp
	strh r4, [r1]
	ldr r1, [sp]
	lsls r3, r1, #0x1b
	lsrs r3, r3, #0x1b
	str r3, [sp, #4]
	lsls r3, r1, #0x16
	lsrs r3, r3, #0x1b
	str r3, [sp, #8]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	str r1, [sp, #0xc]
	lsls r6, r0, #4
	mov r3, sl
	adds r1, r3, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	adds r4, r0, #0
	cmp r4, sl
	bhs _080AB270
	lsls r0, r2, #0x18
	asrs r0, r0, #0x13
	str r0, [sp, #0x10]
_080AB19C:
	ldr r0, _080AB1CC
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AB1D0
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r6, #0
	movs r1, #0x10
	mov r2, r8
	bl BlendPalette
	adds r0, r6, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r3, sl
	lsls r3, r3, #0x10
	mov sb, r3
	adds r4, #1
	mov ip, r4
	b _080AB266
	.align 2, 0
_080AB1CC: .4byte 0x03000F50
_080AB1D0:
	cmp r0, #1
	bne _080AB1E0
	ldr r0, _080AB1DC
	ldr r1, [sp, #0x10]
	adds r5, r1, r0
	b _080AB1E6
	.align 2, 0
_080AB1DC: .4byte 0x020382F4
_080AB1E0:
	ldr r0, _080AB280
	ldr r3, [sp, #0x10]
	adds r5, r3, r0
_080AB1E6:
	movs r7, #0
	mov r0, sl
	lsls r0, r0, #0x10
	mov sb, r0
	adds r4, #1
	mov ip, r4
_080AB1F2:
	adds r4, r6, #0
	lsls r0, r4, #1
	ldr r1, _080AB284
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1b
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1b
	adds r0, r5, r0
	ldrb r2, [r0]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	adds r1, r5, r1
	ldrb r1, [r1]
	ldr r6, [sp, #4]
	subs r0, r6, r3
	mov r6, r8
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r6, [sp, #8]
	subs r0, r6, r2
	mov r6, r8
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #0x18
	ldr r6, [sp, #0xc]
	subs r0, r6, r1
	mov r6, r8
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r4, #1
	ldr r0, _080AB288
	adds r4, r4, r0
	lsrs r1, r1, #0xe
	lsrs r2, r2, #0x13
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0xf
	bls _080AB1F2
_080AB266:
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	cmp r0, sb
	blo _080AB19C
_080AB270:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB280: .4byte 0x02038554
_080AB284: .4byte 0x020373B4
_080AB288: .4byte 0x020377B4
	thumb_func_end ApplyGammaShiftWithBlend

	thumb_func_start ApplyDroughtGammaShiftWithBlend
ApplyDroughtGammaShiftWithBlend: @ 0x080AB28C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	mov r1, sp
	strh r2, [r1]
	lsls r0, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	eors r0, r1
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp]
	lsls r1, r0, #0x1b
	lsrs r1, r1, #0x1b
	str r1, [sp, #8]
	lsls r1, r0, #0x16
	lsrs r1, r1, #0x1b
	str r1, [sp, #0xc]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1b
	mov sl, r0
	movs r5, #0
	movs r4, #0
_080AB2C4:
	ldr r0, _080AB2EC
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AB2F0
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r6, #0
	bl BlendPalette
	adds r0, r5, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	mov r8, r4
	b _080AB386
	.align 2, 0
_080AB2EC: .4byte 0x03000F50
_080AB2F0:
	movs r0, #0
	mov ip, r0
	ldr r1, [sp, #4]
	lsls r0, r1, #0x18
	adds r4, #1
	mov r8, r4
	movs r7, #0x1e
	asrs r0, r0, #0xb
	mov sb, r0
_080AB302:
	adds r4, r5, #0
	lsls r0, r4, #1
	ldr r5, _080AB3A0
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r2, r0, #0x1b
	lsrs r2, r2, #0x1b
	lsls r1, r0, #0x16
	lsrs r1, r1, #0x1b
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1b
	ands r0, r7
	lsls r0, r0, #7
	ands r1, r7
	lsls r1, r1, #3
	orrs r0, r1
	ands r2, r7
	lsls r0, r0, #1
	orrs r0, r2
	add r0, sb
	ldr r1, _080AB3A4
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r3, r1, #0x1b
	lsrs r3, r3, #0x1b
	lsls r2, r1, #0x16
	lsrs r2, r2, #0x1b
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	ldr r5, [sp, #8]
	subs r0, r5, r3
	muls r0, r6, r0
	asrs r0, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r5, [sp, #0xc]
	subs r0, r5, r2
	muls r0, r6, r0
	asrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #0x18
	mov r5, sl
	subs r0, r5, r1
	muls r0, r6, r0
	asrs r0, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r4, r4, #1
	ldr r0, _080AB3A8
	adds r4, r4, r0
	lsrs r1, r1, #0xe
	lsrs r2, r2, #0x13
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	cmp r0, #0xf
	bls _080AB302
_080AB386:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1f
	bls _080AB2C4
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB3A0: .4byte 0x020373B4
_080AB3A4: .4byte 0x0851ADE8
_080AB3A8: .4byte 0x020377B4
	thumb_func_end ApplyDroughtGammaShiftWithBlend

	thumb_func_start ApplyFogBlend
ApplyFogBlend: @ 0x080AB3AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r0, sp
	strh r3, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	adds r2, r7, #0
	bl BlendPalette
	ldr r0, [sp]
	lsls r1, r0, #0x1b
	lsrs r1, r1, #0x1b
	str r1, [sp, #4]
	lsls r1, r0, #0x16
	lsrs r1, r1, #0x1b
	str r1, [sp, #8]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1b
	mov sl, r0
	movs r4, #0x10
_080AB3E8:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl LightenSpritePaletteInFog
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB498
	adds r0, r4, #1
	lsls r1, r0, #0x14
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r1, r4, #0x14
	lsrs r6, r1, #0x10
	mov sb, r0
	cmp r6, ip
	bhs _080AB4AC
	movs r0, #0x1c
	mov r8, r0
_080AB40C:
	lsls r5, r6, #1
	ldr r0, _080AB490
	adds r0, r5, r0
	ldr r2, [r0]
	lsls r4, r2, #0x1b
	lsrs r4, r4, #0x1b
	lsls r3, r2, #0x16
	lsrs r3, r3, #0x1b
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x1b
	mov r0, r8
	subs r1, r0, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0x1f
	subs r1, r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	subs r1, r0, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, [sp, #4]
	subs r0, r1, r4
	muls r0, r7, r0
	asrs r0, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, [sp, #8]
	subs r0, r1, r3
	muls r0, r7, r0
	asrs r0, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #0x18
	mov r1, sl
	subs r0, r1, r2
	muls r0, r7, r0
	asrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #0x18
	ldr r0, _080AB494
	adds r5, r5, r0
	lsrs r2, r2, #0xe
	lsrs r3, r3, #0x13
	orrs r2, r3
	orrs r2, r4
	strh r2, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, ip
	blo _080AB40C
	b _080AB4AC
	.align 2, 0
_080AB490: .4byte 0x020373B4
_080AB494: .4byte 0x020377B4
_080AB498:
	lsls r0, r4, #0x14
	lsrs r0, r0, #0x10
	mov r1, sp
	ldrh r3, [r1]
	movs r1, #0x10
	adds r2, r7, #0
	bl BlendPalette
	adds r4, #1
	mov sb, r4
_080AB4AC:
	mov r1, sb
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1f
	bls _080AB3E8
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ApplyFogBlend

	thumb_func_start MarkFogSpritePalToLighten
MarkFogSpritePalToLighten: @ 0x080AB4C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, _080AB4F0
	ldr r0, _080AB4F4
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, #5
	bhi _080AB4EA
	ldr r4, _080AB4F8
	adds r0, r3, r4
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080AB4EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB4F0: .4byte 0x020380F4
_080AB4F4: .4byte 0x000006FA
_080AB4F8: .4byte 0x000006F4
	thumb_func_end MarkFogSpritePalToLighten

	thumb_func_start LightenSpritePaletteInFog
LightenSpritePaletteInFog: @ 0x080AB4FC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	ldr r2, _080AB524
	ldr r4, _080AB528
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bhs _080AB53A
	ldr r5, _080AB52C
	adds r4, r2, r5
	adds r2, r0, #0
_080AB516:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080AB530
	movs r0, #1
	b _080AB53C
	.align 2, 0
_080AB524: .4byte 0x020380F4
_080AB528: .4byte 0x000006FA
_080AB52C: .4byte 0x000006F4
_080AB530:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	blo _080AB516
_080AB53A:
	movs r0, #0
_080AB53C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LightenSpritePaletteInFog

	thumb_func_start sub_080AB544
sub_080AB544: @ 0x080AB544
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _080AB570
	ldr r1, _080AB574
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _080AB56A
	lsls r2, r4, #0x18
	asrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x20
	bl ApplyGammaShift
	movs r1, #0xd8
	lsls r1, r1, #3
	adds r0, r5, r1
	strb r4, [r0]
_080AB56A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB570: .4byte 0x020380F4
_080AB574: .4byte 0x000006C6
	thumb_func_end sub_080AB544

	thumb_func_start sub_080AB578
sub_080AB578: @ 0x080AB578
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r3, _080AB5C0
	ldr r0, _080AB5C4
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, #3
	bne _080AB5B8
	movs r1, #0
	strb r1, [r2]
	movs r2, #0xd8
	lsls r2, r2, #3
	adds r0, r3, r2
	strb r4, [r0]
	adds r2, #1
	adds r0, r3, r2
	strb r5, [r0]
	adds r2, #2
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, _080AB5C8
	adds r0, r3, r1
	strb r6, [r0]
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_080AB544
_080AB5B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB5C0: .4byte 0x020380F4
_080AB5C4: .4byte 0x000006C6
_080AB5C8: .4byte 0x000006C2
	thumb_func_end sub_080AB578

	thumb_func_start FadeScreen
FadeScreen: @ 0x080AB5CC
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r0, #1
	beq _080AB604
	cmp r0, #1
	bgt _080AB5E8
	cmp r0, #0
	beq _080AB5F2
	b _080AB6E0
_080AB5E8:
	cmp r2, #2
	beq _080AB5F8
	cmp r2, #3
	beq _080AB608
	b _080AB6E0
_080AB5F2:
	movs r4, #0
	movs r1, #0
	b _080AB60C
_080AB5F8:
	ldr r4, _080AB600
	movs r1, #0
	b _080AB60C
	.align 2, 0
_080AB600: .4byte 0x0000FFFF
_080AB604:
	movs r4, #0
	b _080AB60A
_080AB608:
	ldr r4, _080AB62C
_080AB60A:
	movs r1, #1
_080AB60C:
	ldr r0, _080AB630
	movs r2, #0xda
	lsls r2, r2, #3
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #3
	blt _080AB634
	cmp r0, #6
	ble _080AB626
	cmp r0, #0xd
	bgt _080AB634
	cmp r0, #0xb
	blt _080AB634
_080AB626:
	movs r2, #1
	b _080AB636
	.align 2, 0
_080AB62C: .4byte 0x0000FFFF
_080AB630: .4byte 0x020380F4
_080AB634:
	movs r2, #0
_080AB636:
	cmp r1, #0
	beq _080AB678
	cmp r2, #0
	beq _080AB64A
	ldr r0, _080AB668
	ldr r1, _080AB66C
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
_080AB64A:
	movs r0, #1
	rsbs r0, r0, #0
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	str r4, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080AB670
	ldr r3, _080AB674
	adds r0, r0, r3
	movs r1, #2
	strb r1, [r0]
	b _080AB6E0
	.align 2, 0
_080AB668: .4byte 0x020377B4
_080AB66C: .4byte 0x020373B4
_080AB670: .4byte 0x020380F4
_080AB674: .4byte 0x000006C6
_080AB678:
	ldr r1, _080AB690
	ldr r3, _080AB694
	adds r0, r1, r3
	strh r4, [r0]
	cmp r2, #0
	beq _080AB69C
	ldr r0, _080AB698
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	b _080AB6AE
	.align 2, 0
_080AB690: .4byte 0x020380F4
_080AB694: .4byte 0x000006C4
_080AB698: .4byte 0x000006C7
_080AB69C:
	movs r0, #1
	rsbs r0, r0, #0
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	str r4, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_080AB6AE:
	ldr r4, _080AB6E8
	ldr r1, _080AB6EC
	adds r0, r4, r1
	movs r1, #0
	movs r5, #1
	strb r5, [r0]
	ldr r2, _080AB6F0
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _080AB6F4
	adds r0, r4, r3
	strb r1, [r0]
	movs r1, #0xe6
	lsls r1, r1, #3
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r2, #0x68
	adds r1, r4, r2
	ldrb r1, [r1]
	bl Weather_SetBlendCoeffs
	movs r3, #0xd9
	lsls r3, r3, #3
	adds r4, r4, r3
	strb r5, [r4]
_080AB6E0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB6E8: .4byte 0x020380F4
_080AB6EC: .4byte 0x000006C6
_080AB6F0: .4byte 0x000006CA
_080AB6F4: .4byte 0x000006CB
	thumb_func_end FadeScreen

	thumb_func_start IsWeatherNotFadingIn
IsWeatherNotFadingIn: @ 0x080AB6F8
	ldr r0, _080AB70C
	ldr r1, _080AB710
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_080AB70C: .4byte 0x020380F4
_080AB710: .4byte 0x000006C6
	thumb_func_end IsWeatherNotFadingIn

	thumb_func_start UpdateSpritePaletteWithWeather
UpdateSpritePaletteWithWeather: @ 0x080AB714
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	ldr r5, _080AB754
	ldr r2, _080AB758
	adds r0, r5, r2
	ldrb r0, [r0]
	adds r1, r5, #0
	cmp r0, #1
	beq _080AB75C
	cmp r0, #2
	beq _080AB7A8
	adds r2, #0xa
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #6
	beq _080AB7E0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	subs r2, #0x10
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #1
	bl ApplyGammaShift
	b _080AB7F0
	.align 2, 0
_080AB754: .4byte 0x020380F4
_080AB758: .4byte 0x000006C6
_080AB75C:
	ldr r2, _080AB79C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AB7F0
	adds r2, #6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #6
	bne _080AB778
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl MarkFogSpritePalToLighten
_080AB778:
	lsls r0, r4, #0x14
	lsrs r4, r0, #0x10
	movs r2, #0
	ldr r6, _080AB7A0
	ldr r0, _080AB7A4
	adds r3, r5, r0
_080AB784:
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _080AB784
	b _080AB7F0
	.align 2, 0
_080AB79C: .4byte 0x000006CA
_080AB7A0: .4byte 0x020377B4
_080AB7A4: .4byte 0x000006C4
_080AB7A8:
	lsls r0, r4, #0x14
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	ldr r0, _080AB7D4
	adds r0, r1, r0
	ldr r2, _080AB7D8
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	ldr r0, _080AB7DC
	ldrh r2, [r0, #4]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x1b
	ldrh r3, [r0, #6]
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x11
	adds r0, r4, #0
	movs r1, #0x10
	bl BlendPalette
	b _080AB7F0
	.align 2, 0
_080AB7D4: .4byte 0x020377B4
_080AB7D8: .4byte 0x020373B4
_080AB7DC: .4byte 0x02037C74
_080AB7E0:
	lsls r0, r4, #0x14
	lsrs r4, r0, #0x10
	ldr r3, _080AB7F8
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0xc
	bl BlendPalette
_080AB7F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB7F8: .4byte 0x000073FC
	thumb_func_end UpdateSpritePaletteWithWeather

	thumb_func_start ApplyWeatherGammaShiftToPal
ApplyWeatherGammaShiftToPal: @ 0x080AB7FC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080AB818
	movs r2, #0xd8
	lsls r2, r2, #3
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #1
	bl ApplyGammaShift
	pop {r0}
	bx r0
	.align 2, 0
_080AB818: .4byte 0x020380F4
	thumb_func_end ApplyWeatherGammaShiftToPal

	thumb_func_start sub_080AB81C
sub_080AB81C: @ 0x080AB81C
	push {lr}
	ldr r1, _080AB830
	ldr r2, _080AB834
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	beq _080AB838
	movs r0, #0
	b _080AB83E
	.align 2, 0
_080AB830: .4byte 0x020380F4
_080AB834: .4byte 0x000006C6
_080AB838:
	ldr r2, _080AB844
	adds r0, r1, r2
	ldrb r0, [r0]
_080AB83E:
	pop {r1}
	bx r1
	.align 2, 0
_080AB844: .4byte 0x000006CA
	thumb_func_end sub_080AB81C

	thumb_func_start LoadCustomWeatherSpritePalette
LoadCustomWeatherSpritePalette: @ 0x080AB848
	push {r4, lr}
	ldr r4, _080AB870
	ldr r1, _080AB874
	adds r4, r4, r1
	ldrb r1, [r4]
	lsls r1, r1, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	ldrb r0, [r4]
	bl UpdateSpritePaletteWithWeather
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB870: .4byte 0x020380F4
_080AB874: .4byte 0x000006D4
	thumb_func_end LoadCustomWeatherSpritePalette

	thumb_func_start LoadDroughtWeatherPalette
LoadDroughtWeatherPalette: @ 0x080AB878
	movs r2, #0x20
	strb r2, [r0]
	strb r2, [r1]
	bx lr
	thumb_func_end LoadDroughtWeatherPalette

	thumb_func_start ResetDroughtWeatherPaletteLoading
ResetDroughtWeatherPaletteLoading: @ 0x080AB880
	ldr r0, _080AB894
	ldr r2, _080AB898
	adds r1, r0, r2
	movs r2, #1
	strb r2, [r1]
	ldr r1, _080AB89C
	adds r0, r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_080AB894: .4byte 0x020380F4
_080AB898: .4byte 0x0000074D
_080AB89C: .4byte 0x0000074E
	thumb_func_end ResetDroughtWeatherPaletteLoading

	thumb_func_start LoadDroughtWeatherPalettes
LoadDroughtWeatherPalettes: @ 0x080AB8A0
	push {r4, lr}
	ldr r1, _080AB8C8
	ldr r0, _080AB8CC
	adds r4, r1, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1f
	bgt _080AB8D4
	ldr r0, _080AB8D0
	adds r1, r1, r0
	adds r0, r4, #0
	bl LoadDroughtWeatherPalette
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1f
	bgt _080AB8D4
	movs r0, #1
	b _080AB8D6
	.align 2, 0
_080AB8C8: .4byte 0x020380F4
_080AB8CC: .4byte 0x0000074D
_080AB8D0: .4byte 0x0000074E
_080AB8D4:
	movs r0, #0
_080AB8D6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LoadDroughtWeatherPalettes

	thumb_func_start sub_080AB8DC
sub_080AB8DC: @ 0x080AB8DC
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mvns r0, r0
	bl sub_080AB544
	pop {r0}
	bx r0
	thumb_func_end sub_080AB8DC

	thumb_func_start sub_080AB8EC
sub_080AB8EC: @ 0x080AB8EC
	ldr r1, _080AB90C
	ldr r2, _080AB910
	adds r0, r1, r2
	movs r2, #0
	strh r2, [r0]
	movs r3, #0xe8
	lsls r3, r3, #3
	adds r0, r1, r3
	strh r2, [r0]
	adds r3, #2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _080AB914
	adds r1, r1, r0
	strh r2, [r1]
	bx lr
	.align 2, 0
_080AB90C: .4byte 0x020380F4
_080AB910: .4byte 0x0000073C
_080AB914: .4byte 0x0000073E
	thumb_func_end sub_080AB8EC

	thumb_func_start sub_080AB918
sub_080AB918: @ 0x080AB918
	push {r4, r5, r6, r7, lr}
	ldr r5, _080AB934
	ldr r0, _080AB938
	adds r7, r5, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	cmp r1, #1
	beq _080AB98C
	cmp r1, #1
	bgt _080AB93C
	cmp r1, #0
	beq _080AB942
	b _080ABA14
	.align 2, 0
_080AB934: .4byte 0x020380F4
_080AB938: .4byte 0x00000742
_080AB93C:
	cmp r1, #2
	beq _080AB9E0
	b _080ABA14
_080AB942:
	movs r3, #0xe8
	lsls r3, r3, #3
	adds r6, r5, r3
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _080ABA14
	strh r1, [r6]
	ldr r0, _080AB984
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080AB8DC
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #5
	ble _080ABA14
	ldr r3, _080AB988
	adds r0, r5, r3
	strh r1, [r0]
	movs r0, #1
	strh r0, [r7]
	movs r0, #0x3c
	strh r0, [r6]
	b _080ABA14
	.align 2, 0
_080AB984: .4byte 0x0000073C
_080AB988: .4byte 0x0000073E
_080AB98C:
	movs r0, #0xe8
	lsls r0, r0, #3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, #3
	movs r1, #0x7f
	ands r0, r1
	strh r0, [r2]
	ldr r1, _080AB9D4
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	asrs r0, r0, #6
	adds r0, #2
	ldr r2, _080AB9D8
	adds r6, r5, r2
	adds r2, r0, #0
	strh r0, [r6]
	ldr r3, _080AB9DC
	adds r4, r5, r3
	movs r3, #0
	ldrsh r1, [r4, r3]
	cmp r0, r1
	beq _080AB9CC
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	bl sub_080AB8DC
_080AB9CC:
	ldrh r0, [r6]
	strh r0, [r4]
	b _080ABA14
	.align 2, 0
_080AB9D4: .4byte 0x082FA8CC
_080AB9D8: .4byte 0x0000073C
_080AB9DC: .4byte 0x0000073E
_080AB9E0:
	movs r0, #0xe8
	lsls r0, r0, #3
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _080ABA14
	strh r6, [r1]
	ldr r1, _080ABA1C
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080AB8DC
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #3
	bne _080ABA14
	strh r6, [r7]
_080ABA14:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABA1C: .4byte 0x0000073C
	thumb_func_end sub_080AB918

	thumb_func_start Weather_SetBlendCoeffs
Weather_SetBlendCoeffs: @ 0x080ABA20
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080ABA58
	movs r4, #0xe6
	lsls r4, r4, #3
	adds r2, r3, r4
	strh r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	strh r1, [r2]
	adds r4, #2
	adds r2, r3, r4
	strh r0, [r2]
	ldr r2, _080ABA5C
	adds r3, r3, r2
	strh r1, [r3]
	lsls r1, r1, #8
	orrs r1, r0
	movs r0, #0x52
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ABA58: .4byte 0x020380F4
_080ABA5C: .4byte 0x00000736
	thumb_func_end Weather_SetBlendCoeffs

	thumb_func_start Weather_SetTargetBlendCoeffs
Weather_SetTargetBlendCoeffs: @ 0x080ABA60
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080ABA94
	ldr r5, _080ABA98
	adds r4, r3, r5
	movs r5, #0
	strh r0, [r4]
	ldr r4, _080ABA9C
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _080ABAA0
	adds r0, r3, r1
	strb r2, [r0]
	adds r4, #3
	adds r0, r3, r4
	strb r5, [r0]
	movs r0, #0xe7
	lsls r0, r0, #3
	adds r3, r3, r0
	strb r5, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ABA94: .4byte 0x020380F4
_080ABA98: .4byte 0x00000734
_080ABA9C: .4byte 0x00000736
_080ABAA0: .4byte 0x0000073A
	thumb_func_end Weather_SetTargetBlendCoeffs

	thumb_func_start Weather_UpdateBlend
Weather_UpdateBlend: @ 0x080ABAA4
	push {r4, r5, r6, lr}
	ldr r0, _080ABAFC
	movs r1, #0xe6
	lsls r1, r1, #3
	adds r3, r0, r1
	ldr r2, [r3]
	ldr r6, _080ABB00
	adds r4, r0, r6
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r2, r1
	beq _080ABB68
	ldr r0, _080ABB04
	adds r2, r5, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r6, _080ABB08
	adds r1, r5, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bls _080ABB34
	movs r0, #0
	strb r0, [r2]
	movs r0, #0xe7
	lsls r0, r0, #3
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080ABB0C
	ldrh r1, [r3]
	adds r2, r1, #0
	ldrh r0, [r4]
	cmp r2, r0
	bhs _080ABB2C
	adds r0, r1, #1
	b _080ABB32
	.align 2, 0
_080ABAFC: .4byte 0x020380F4
_080ABB00: .4byte 0x00000734
_080ABB04: .4byte 0x00000739
_080ABB08: .4byte 0x0000073A
_080ABB0C:
	ldr r1, _080ABB24
	adds r3, r5, r1
	ldr r2, _080ABB28
	adds r0, r5, r2
	ldrh r1, [r3]
	adds r2, r1, #0
	ldrh r0, [r0]
	cmp r2, r0
	bhs _080ABB2C
	adds r0, r1, #1
	b _080ABB32
	.align 2, 0
_080ABB24: .4byte 0x00000732
_080ABB28: .4byte 0x00000736
_080ABB2C:
	cmp r2, r0
	bls _080ABB34
	subs r0, r1, #1
_080ABB32:
	strh r0, [r3]
_080ABB34:
	ldr r6, _080ABB60
	adds r0, r5, r6
	ldrh r1, [r0]
	lsls r1, r1, #8
	movs r0, #0xe6
	lsls r0, r0, #3
	adds r4, r5, r0
	ldrh r0, [r4]
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, [r4]
	ldr r2, _080ABB64
	adds r0, r5, r2
	ldr r0, [r0]
	cmp r1, r0
	beq _080ABB68
	movs r0, #0
	b _080ABB6A
	.align 2, 0
_080ABB60: .4byte 0x00000732
_080ABB64: .4byte 0x00000734
_080ABB68:
	movs r0, #1
_080ABB6A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end Weather_UpdateBlend

	thumb_func_start sub_080ABB70
sub_080ABB70: @ 0x080ABB70
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #9
	bhi _080ABC02
	lsls r0, r0, #2
	ldr r1, _080ABB88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ABB88: .4byte 0x080ABB8C
_080ABB8C: @ jump table
	.4byte _080ABBB4 @ case 0
	.4byte _080ABBBC @ case 1
	.4byte _080ABBC4 @ case 2
	.4byte _080ABBCC @ case 3
	.4byte _080ABBD4 @ case 4
	.4byte _080ABBDC @ case 5
	.4byte _080ABBE4 @ case 6
	.4byte _080ABBEC @ case 7
	.4byte _080ABBF4 @ case 8
	.4byte _080ABBFC @ case 9
_080ABBB4:
	movs r0, #1
	bl SetWeather
	b _080ABC02
_080ABBBC:
	movs r0, #2
	bl SetWeather
	b _080ABC02
_080ABBC4:
	movs r0, #3
	bl SetWeather
	b _080ABC02
_080ABBCC:
	movs r0, #4
	bl SetWeather
	b _080ABC02
_080ABBD4:
	movs r0, #5
	bl SetWeather
	b _080ABC02
_080ABBDC:
	movs r0, #6
	bl SetWeather
	b _080ABC02
_080ABBE4:
	movs r0, #9
	bl SetWeather
	b _080ABC02
_080ABBEC:
	movs r0, #7
	bl SetWeather
	b _080ABC02
_080ABBF4:
	movs r0, #8
	bl SetWeather
	b _080ABC02
_080ABBFC:
	movs r0, #0xb
	bl SetWeather
_080ABC02:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080ABB70

	thumb_func_start GetCurrentWeather
GetCurrentWeather: @ 0x080ABC08
	ldr r0, _080ABC14
	movs r1, #0xda
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080ABC14: .4byte 0x020380F4
	thumb_func_end GetCurrentWeather

	thumb_func_start SetRainStrengthFromSoundEffect
SetRainStrengthFromSoundEffect: @ 0x080ABC18
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _080ABC38
	ldr r3, _080ABC3C
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #2
	beq _080ABC6A
	cmp r2, #0x53
	beq _080ABC50
	cmp r2, #0x53
	bgt _080ABC40
	cmp r2, #0x51
	beq _080ABC5C
	b _080ABC6A
	.align 2, 0
_080ABC38: .4byte 0x020380F4
_080ABC3C: .4byte 0x000006C6
_080ABC40:
	cmp r2, #0x55
	bne _080ABC6A
	ldr r0, _080ABC4C
	adds r1, r1, r0
	movs r0, #0
	b _080ABC62
	.align 2, 0
_080ABC4C: .4byte 0x000006DD
_080ABC50:
	ldr r3, _080ABC58
	adds r1, r1, r3
	movs r0, #1
	b _080ABC62
	.align 2, 0
_080ABC58: .4byte 0x000006DD
_080ABC5C:
	ldr r0, _080ABC70
	adds r1, r1, r0
	movs r0, #2
_080ABC62:
	strb r0, [r1]
	adds r0, r2, #0
	bl PlaySE
_080ABC6A:
	pop {r0}
	bx r0
	.align 2, 0
_080ABC70: .4byte 0x000006DD
	thumb_func_end SetRainStrengthFromSoundEffect

	thumb_func_start PlayRainStoppingSoundEffect
PlayRainStoppingSoundEffect: @ 0x080ABC74
	push {lr}
	bl IsSpecialSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABCB2
	ldr r0, _080ABC9C
	ldr r1, _080ABCA0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080ABCA4
	cmp r0, #1
	bgt _080ABCAC
	cmp r0, #0
	bne _080ABCAC
	movs r0, #0x56
	bl PlaySE
	b _080ABCB2
	.align 2, 0
_080ABC9C: .4byte 0x020380F4
_080ABCA0: .4byte 0x000006DD
_080ABCA4:
	movs r0, #0x54
	bl PlaySE
	b _080ABCB2
_080ABCAC:
	movs r0, #0x52
	bl PlaySE
_080ABCB2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayRainStoppingSoundEffect

	thumb_func_start IsWeatherChangeComplete
IsWeatherChangeComplete: @ 0x080ABCB8
	ldr r0, _080ABCC4
	ldr r1, _080ABCC8
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080ABCC4: .4byte 0x020380F4
_080ABCC8: .4byte 0x000006D3
	thumb_func_end IsWeatherChangeComplete

	thumb_func_start sub_080ABCCC
sub_080ABCCC: @ 0x080ABCCC
	ldr r0, _080ABCD8
	ldr r1, _080ABCDC
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080ABCD8: .4byte 0x020380F4
_080ABCDC: .4byte 0x000006C6
	thumb_func_end sub_080ABCCC

	thumb_func_start sub_080ABCE0
sub_080ABCE0: @ 0x080ABCE0
	ldr r0, _080ABCEC
	ldr r1, _080ABCF0
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_080ABCEC: .4byte 0x020380F4
_080ABCF0: .4byte 0x000006C6
	thumb_func_end sub_080ABCE0

	thumb_func_start PreservePaletteInWeather
PreservePaletteInWeather: @ 0x080ABCF4
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080ABD18
	ldr r5, _080ABD1C
	adds r1, r5, #0
	movs r2, #0x10
	bl CpuSet
	adds r4, r4, r5
	movs r0, #0
	strb r0, [r4]
	ldr r0, _080ABD20
	str r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ABD18: .4byte 0x08526EEC
_080ABD1C: .4byte 0x02038844
_080ABD20: .4byte 0x03000F50
	thumb_func_end PreservePaletteInWeather

	thumb_func_start ResetPreservedPalettesInWeather
ResetPreservedPalettesInWeather: @ 0x080ABD24
	ldr r1, _080ABD2C
	ldr r0, _080ABD30
	str r0, [r1]
	bx lr
	.align 2, 0
_080ABD2C: .4byte 0x03000F50
_080ABD30: .4byte 0x08526EEC
	thumb_func_end ResetPreservedPalettesInWeather

