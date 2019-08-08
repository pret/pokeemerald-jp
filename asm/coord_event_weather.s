.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CoordEventWeather_Clouds
CoordEventWeather_Clouds: @ 0x0809D094
	push {lr}
	movs r0, #1
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Clouds

	thumb_func_start CoordEventWeather_Sunny
CoordEventWeather_Sunny: @ 0x0809D0A0
	push {lr}
	movs r0, #2
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Sunny

	thumb_func_start CoordEventWeather_Dark
CoordEventWeather_Dark: @ 0x0809D0AC
	push {lr}
	movs r0, #3
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Dark

	thumb_func_start CoordEventWeather_Sandstorm
CoordEventWeather_Sandstorm: @ 0x0809D0B8
	push {lr}
	movs r0, #4
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Sandstorm

	thumb_func_start CoordEventWeather_Thunderstorm
CoordEventWeather_Thunderstorm: @ 0x0809D0C4
	push {lr}
	movs r0, #5
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Thunderstorm

	thumb_func_start CoordEventWeather_LightRain
CoordEventWeather_LightRain: @ 0x0809D0D0
	push {lr}
	movs r0, #6
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_LightRain

	thumb_func_start CoordEventWeather_Snow
CoordEventWeather_Snow: @ 0x0809D0DC
	push {lr}
	movs r0, #9
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Snow

	thumb_func_start CoordEventWeather_Ash
CoordEventWeather_Ash: @ 0x0809D0E8
	push {lr}
	movs r0, #7
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Ash

	thumb_func_start CoordEventWeather_Fog
CoordEventWeather_Fog: @ 0x0809D0F4
	push {lr}
	movs r0, #8
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Fog

	thumb_func_start CoordEventWeather_DiagonalFog
CoordEventWeather_DiagonalFog: @ 0x0809D100
	push {lr}
	movs r0, #0xb
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_DiagonalFog

	thumb_func_start CoordEventWeather_Drought
CoordEventWeather_Drought: @ 0x0809D10C
	push {lr}
	movs r0, #0xc
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Drought

	thumb_func_start CoordEventWeather_Route119Cycle
CoordEventWeather_Route119Cycle: @ 0x0809D118
	push {lr}
	movs r0, #0x14
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Route119Cycle

	thumb_func_start CoordEventWeather_Route123Cycle
CoordEventWeather_Route123Cycle: @ 0x0809D124
	push {lr}
	movs r0, #0x15
	bl SetWeather
	pop {r0}
	bx r0
	thumb_func_end CoordEventWeather_Route123Cycle

	thumb_func_start DoCoordEventWeather
DoCoordEventWeather: @ 0x0809D130
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r2, #0
	ldr r3, _0809D150
_0809D13A:
	lsls r1, r2, #3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0809D154
	adds r0, r3, #4
	adds r0, r1, r0
	ldr r0, [r0]
	bl _call_via_r0
	b _0809D15E
	.align 2, 0
_0809D150: .4byte 0x084E8924
_0809D154:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xc
	bls _0809D13A
_0809D15E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DoCoordEventWeather

