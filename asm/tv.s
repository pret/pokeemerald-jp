.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearTVShowData
ClearTVShowData: @ 0x080ECA80
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r6, _080ECAD0
	movs r5, #0
	ldr r7, _080ECAD4
_080ECA8A:
	ldr r0, [r6]
	lsls r1, r3, #3
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r2, _080ECAD8
	adds r0, r0, r2
	strb r5, [r0]
	ldr r0, [r6]
	adds r0, r0, r1
	adds r2, #1
	adds r0, r0, r2
	strb r5, [r0]
	movs r2, #0
	adds r4, r3, #1
	adds r3, r1, #0
_080ECAAA:
	ldr r0, [r6]
	adds r1, r2, r3
	adds r0, r0, r7
	adds r0, r0, r1
	strb r5, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x21
	bls _080ECAAA
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x18
	bls _080ECA8A
	bl ClearPokemonNews
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ECAD0: .4byte 0x03005AEC
_080ECAD4: .4byte 0x000027CE
_080ECAD8: .4byte 0x000027CC
	thumb_func_end ClearTVShowData

	thumb_func_start special_0x44
special_0x44: @ 0x080ECADC
	push {r4, r5, r6, r7, lr}
	movs r4, #5
	ldr r1, _080ECB50
	ldr r0, [r1]
	movs r2, #0xa2
	lsls r2, r2, #6
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080ECB10
	adds r3, r1, #0
	subs r2, #0xb4
_080ECAF4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bhi _080ECB10
	ldr r0, [r3]
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ECAF4
_080ECB10:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r5, #0
	ldr r6, _080ECB50
_080ECB26:
	ldr r1, [r6]
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r4, r0, #2
	adds r1, r1, r4
	ldr r0, _080ECB54
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetTVChannelByShowType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _080ECB5C
	ldr r0, [r6]
	adds r0, r0, r4
	ldr r1, _080ECB58
	adds r0, r0, r1
	ldrb r0, [r0]
	b _080ECB6C
	.align 2, 0
_080ECB50: .4byte 0x03005AEC
_080ECB54: .4byte 0x000027CC
_080ECB58: .4byte 0x000027CD
_080ECB5C:
	ldr r2, _080ECB74
	adds r0, r4, r2
	ldr r1, [r6]
	adds r1, r1, r0
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _080ECB78
	ldrb r0, [r1, #1]
_080ECB6C:
	cmp r0, #1
	bne _080ECB78
	adds r0, r5, #0
	b _080ECB8C
	.align 2, 0
_080ECB74: .4byte 0x000027CC
_080ECB78:
	cmp r5, #0
	bne _080ECB80
	movs r5, #0x17
	b _080ECB86
_080ECB80:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080ECB86:
	cmp r5, r7
	bne _080ECB26
	movs r0, #0xff
_080ECB8C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end special_0x44

	thumb_func_start FindAnyTVShowOnTheAir
FindAnyTVShowOnTheAir: @ 0x080ECB94
	push {lr}
	bl special_0x44
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	bne _080ECBA6
	movs r0, #0xff
	b _080ECBDE
_080ECBA6:
	ldr r0, _080ECBD0
	ldr r2, [r0]
	ldr r3, _080ECBD4
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, #0
	beq _080ECBDC
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	ldr r2, _080ECBD8
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x29
	bne _080ECBDC
	bl FindFirstActiveTVShowThatIsNotAMassOutbreak
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080ECBDE
	.align 2, 0
_080ECBD0: .4byte 0x03005AEC
_080ECBD4: .4byte 0x00002B90
_080ECBD8: .4byte 0x000027CC
_080ECBDC:
	adds r0, r1, #0
_080ECBDE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FindAnyTVShowOnTheAir

	thumb_func_start UpdateTVScreensOnMap
UpdateTVScreensOnMap: @ 0x080ECBE4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080ECC18
	bl FlagSet
	bl CheckForBigMovieOrEmergencyNewsOnTV
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080ECC0A
	cmp r0, #2
	beq _080ECC5E
	ldr r0, _080ECC1C
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0xd
	bne _080ECC20
_080ECC0A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl SetTVMetatilesOnMap
	b _080ECC5E
	.align 2, 0
_080ECC18: .4byte 0x00000891
_080ECC1C: .4byte 0x03005AEC
_080ECC20:
	ldr r0, _080ECC64
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ECC5E
	bl FindAnyTVShowOnTheAir
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080ECC4E
	bl FindAnyTVNewsOnTheAir
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080ECC4E
	bl IsTVShowInSearchOfTrainersAiring
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ECC5E
_080ECC4E:
	ldr r0, _080ECC68
	bl FlagClear
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl SetTVMetatilesOnMap
_080ECC5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ECC64: .4byte 0x00000892
_080ECC68: .4byte 0x00000891
	thumb_func_end UpdateTVScreensOnMap

	thumb_func_start SetTVMetatilesOnMap
SetTVMetatilesOnMap: @ 0x080ECC6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r5, #0
	cmp r5, sl
	bge _080ECCC0
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	mov r8, r2
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_080ECC92:
	movs r4, #0
	adds r7, r5, #1
	cmp r4, sb
	bge _080ECCBA
	mov r0, r8
	lsls r6, r0, #0x10
_080ECC9E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapGridGetMetatileBehaviorAt
	cmp r0, #0x86
	bne _080ECCB4
	adds r0, r4, #0
	adds r1, r5, #0
	lsrs r2, r6, #0x10
	bl MapGridSetMetatileIdAt
_080ECCB4:
	adds r4, #1
	cmp r4, sb
	blt _080ECC9E
_080ECCBA:
	adds r5, r7, #0
	cmp r5, sl
	blt _080ECC92
_080ECCC0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetTVMetatilesOnMap

	thumb_func_start TurnOffTVScreen
TurnOffTVScreen: @ 0x080ECCD0
	push {lr}
	ldr r1, _080ECCE8
	ldr r0, [r1]
	ldr r1, [r1, #4]
	movs r2, #2
	bl SetTVMetatilesOnMap
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_080ECCE8: .4byte 0x03005B20
	thumb_func_end TurnOffTVScreen

	thumb_func_start TurnOnTVScreen
TurnOnTVScreen: @ 0x080ECCEC
	push {lr}
	ldr r1, _080ECD04
	ldr r0, [r1]
	ldr r1, [r1, #4]
	movs r2, #3
	bl SetTVMetatilesOnMap
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_080ECD04: .4byte 0x03005B20
	thumb_func_end TurnOnTVScreen

	thumb_func_start special_0x45
special_0x45: @ 0x080ECD08
	ldr r0, _080ECD20
	ldr r1, [r0]
	ldr r0, _080ECD24
	ldrh r2, [r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080ECD28
	adds r1, r1, r0
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080ECD20: .4byte 0x03005AEC
_080ECD24: .4byte 0x02037280
_080ECD28: .4byte 0x000027CC
	thumb_func_end special_0x45

	thumb_func_start FindFirstActiveTVShowThatIsNotAMassOutbreak
FindFirstActiveTVShowThatIsNotAMassOutbreak: @ 0x080ECD2C
	push {r4, lr}
	movs r2, #0
	ldr r0, _080ECD58
	ldr r3, [r0]
_080ECD34:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r3, r0
	ldr r4, _080ECD5C
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080ECD60
	cmp r0, #0x29
	beq _080ECD60
	adds r4, #1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _080ECD60
	adds r0, r2, #0
	b _080ECD6C
	.align 2, 0
_080ECD58: .4byte 0x03005AEC
_080ECD5C: .4byte 0x000027CC
_080ECD60:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x17
	bls _080ECD34
	movs r0, #0xff
_080ECD6C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FindFirstActiveTVShowThatIsNotAMassOutbreak

	thumb_func_start special_0x4a
special_0x4a: @ 0x080ECD74
	push {lr}
	ldr r3, _080ECDA4
	ldr r2, _080ECDA8
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080ECDAC
	adds r0, r0, r1
	ldr r3, [r3]
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0x29
	bne _080ECDB4
	ldr r1, _080ECDB0
	adds r0, r3, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080ECDB4
	bl FindFirstActiveTVShowThatIsNotAMassOutbreak
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080ECDB6
	.align 2, 0
_080ECDA4: .4byte 0x03005AEC
_080ECDA8: .4byte 0x02037280
_080ECDAC: .4byte 0x000027CC
_080ECDB0: .4byte 0x00002B90
_080ECDB4:
	ldrb r0, [r2]
_080ECDB6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end special_0x4a

	thumb_func_start ResetGabbyAndTy
ResetGabbyAndTy: @ 0x080ECDBC
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r3, _080ECEA0
	ldr r2, [r3]
	ldr r1, _080ECEA4
	adds r0, r2, r1
	movs r4, #0
	mov sl, r4
	movs r1, #0
	strh r1, [r0]
	ldr r4, _080ECEA8
	adds r0, r2, r4
	strh r1, [r0]
	adds r4, #2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _080ECEAC
	adds r1, r2, r0
	ldr r0, _080ECEB0
	strh r0, [r1]
	adds r4, #6
	adds r2, r2, r4
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
	ands r0, r1
	strb r0, [r2]
	ldr r1, [r3]
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r6, #5
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r5, #9
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, r1, r4
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r2, _080ECEB4
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r4, sb
	ands r4, r1
	strb r4, [r0]
	ldr r0, [r3]
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r4, r8
	ands r4, r1
	strb r4, [r0]
	ldr r0, [r3]
	adds r0, r0, r2
	ldrb r1, [r0]
	ands r6, r1
	strb r6, [r0]
	ldr r0, [r3]
	adds r0, r0, r2
	ldrb r1, [r0]
	ands r5, r1
	strb r5, [r0]
	ldr r1, [r3]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	ldr r1, _080ECEB8
	adds r0, r0, r1
	mov r4, sl
	strb r4, [r0]
	ldr r0, [r3]
	adds r1, #1
	adds r0, r0, r1
	strb r4, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ECEA0: .4byte 0x03005AEC
_080ECEA4: .4byte 0x00002BA4
_080ECEA8: .4byte 0x00002BA6
_080ECEAC: .4byte 0x00002BAA
_080ECEB0: .4byte 0x0000FFFF
_080ECEB4: .4byte 0x00002BAF
_080ECEB8: .4byte 0x00002BAC
	thumb_func_end ResetGabbyAndTy

	thumb_func_start GabbyAndTyBeforeInterview
GabbyAndTyBeforeInterview: @ 0x080ECEBC
	push {r4, lr}
	ldr r3, _080ECF24
	ldr r2, [r3]
	ldr r0, _080ECF28
	mov ip, r0
	ldrh r1, [r0, #6]
	ldr r4, _080ECF2C
	adds r0, r2, r4
	strh r1, [r0]
	mov r0, ip
	ldrh r1, [r0, #0x26]
	adds r4, #2
	adds r0, r2, r4
	strh r1, [r0]
	mov r0, ip
	ldrh r1, [r0, #0x22]
	adds r4, #2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _080ECF30
	adds r2, r2, r0
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r4, r3, #0
	cmp r0, #0xff
	beq _080ECEF4
	adds r0, r1, #1
	strb r0, [r2]
_080ECEF4:
	ldr r2, [r4]
	mov r0, ip
	ldrb r1, [r0, #5]
	lsls r1, r1, #0x1f
	ldr r0, _080ECF34
	adds r2, r2, r0
	lsrs r1, r1, #0x1f
	ldrb r3, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	beq _080ECF38
	ldr r0, [r4]
	ldr r1, _080ECF34
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	b _080ECF46
	.align 2, 0
_080ECF24: .4byte 0x03005AEC
_080ECF28: .4byte 0x03005A70
_080ECF2C: .4byte 0x00002BA4
_080ECF30: .4byte 0x00002BAD
_080ECF34: .4byte 0x00002BAE
_080ECF38:
	ldr r0, [r4]
	ldr r1, _080ECF60
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
_080ECF46:
	strb r1, [r0]
	mov r1, ip
	ldrb r0, [r1, #3]
	cmp r0, #0
	beq _080ECF64
	ldr r0, [r4]
	ldr r1, _080ECF60
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _080ECF72
	.align 2, 0
_080ECF60: .4byte 0x00002BAE
_080ECF64:
	ldr r0, [r4]
	ldr r1, _080ECFAC
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
_080ECF72:
	strb r1, [r0]
	mov r0, ip
	ldrb r1, [r0, #5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080ECFB0
	movs r1, #0
	mov r0, ip
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne _080ECFB0
_080ECF8C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xa
	bhi _080ECFBE
	mov r0, ip
	adds r0, #0x36
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080ECF8C
	ldr r0, [r4]
	ldr r4, _080ECFAC
	adds r0, r0, r4
	b _080ECFB6
	.align 2, 0
_080ECFAC: .4byte 0x00002BAE
_080ECFB0:
	ldr r0, [r4]
	ldr r1, _080ECFDC
	adds r0, r0, r1
_080ECFB6:
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0]
_080ECFBE:
	bl TakeTVShowInSearchOfTrainersOffTheAir
	ldr r0, _080ECFE0
	ldr r0, [r0]
	ldr r4, _080ECFE4
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _080ECFD6
	movs r0, #1
	bl FlagSet
_080ECFD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ECFDC: .4byte 0x00002BAE
_080ECFE0: .4byte 0x03005AEC
_080ECFE4: .4byte 0x00002BA8
	thumb_func_end GabbyAndTyBeforeInterview

	thumb_func_start GabbyAndTyAfterInterview
GabbyAndTyAfterInterview: @ 0x080ECFE8
	push {r4, r5, r6, lr}
	ldr r5, _080ED074
	ldr r2, [r5]
	ldr r6, _080ED078
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r1, r1, #0x1f
	ldr r4, _080ED07C
	adds r2, r2, r4
	lsrs r1, r1, #0x1f
	ldrb r3, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r5]
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r2, r2, r4
	movs r1, #2
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r5]
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r2, r2, r4
	movs r1, #4
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r2, [r5]
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r2, r2, r4
	movs r1, #8
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r5]
	adds r1, r1, r6
	ldrb r0, [r1]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	ldr r1, _080ED080
	ldrb r1, [r1, #0x14]
	ldr r2, _080ED084
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #6
	bl IncrementGameStat
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ED074: .4byte 0x03005AEC
_080ED078: .4byte 0x00002BAE
_080ED07C: .4byte 0x00002BAF
_080ED080: .4byte 0x02036FB8
_080ED084: .4byte 0x00002BAC
	thumb_func_end GabbyAndTyAfterInterview

	thumb_func_start TakeTVShowInSearchOfTrainersOffTheAir
TakeTVShowInSearchOfTrainersOffTheAir: @ 0x080ED088
	ldr r0, _080ED09C
	ldr r1, [r0]
	ldr r0, _080ED0A0
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080ED09C: .4byte 0x03005AEC
_080ED0A0: .4byte 0x00002BAE
	thumb_func_end TakeTVShowInSearchOfTrainersOffTheAir

	thumb_func_start GabbyAndTyGetBattleNum
GabbyAndTyGetBattleNum: @ 0x080ED0A4
	push {lr}
	ldr r0, _080ED0C8
	ldr r0, [r0]
	ldr r2, _080ED0CC
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #5
	bls _080ED0C2
	ldrb r0, [r1]
	movs r1, #3
	bl __umodsi3
	adds r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080ED0C2:
	pop {r1}
	bx r1
	.align 2, 0
_080ED0C8: .4byte 0x03005AEC
_080ED0CC: .4byte 0x00002BAD
	thumb_func_end GabbyAndTyGetBattleNum

	thumb_func_start IsTVShowInSearchOfTrainersAiring
IsTVShowInSearchOfTrainersAiring: @ 0x080ED0D0
	ldr r0, _080ED0E0
	ldr r0, [r0]
	ldr r1, _080ED0E4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_080ED0E0: .4byte 0x03005AEC
_080ED0E4: .4byte 0x00002BAE
	thumb_func_end IsTVShowInSearchOfTrainersAiring

	thumb_func_start GabbyAndTyGetLastQuote
GabbyAndTyGetLastQuote: @ 0x080ED0E8
	push {r4, r5, lr}
	ldr r5, _080ED114
	ldr r0, [r5]
	ldr r2, _080ED118
	adds r1, r0, r2
	ldrh r0, [r1]
	ldr r4, _080ED11C
	cmp r0, r4
	beq _080ED124
	ldr r0, _080ED120
	ldrh r1, [r1]
	bl CopyEasyChatWord
	ldr r1, [r5]
	ldr r0, _080ED118
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	b _080ED126
	.align 2, 0
_080ED114: .4byte 0x03005AEC
_080ED118: .4byte 0x00002BAA
_080ED11C: .4byte 0x0000FFFF
_080ED120: .4byte 0x02021C40
_080ED124:
	movs r0, #0
_080ED126:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GabbyAndTyGetLastQuote

	thumb_func_start GabbyAndTyGetLastBattleTrivia
GabbyAndTyGetLastBattleTrivia: @ 0x080ED12C
	push {lr}
	ldr r0, _080ED144
	ldr r0, [r0]
	ldr r1, _080ED148
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080ED14C
	movs r0, #1
	b _080ED172
	.align 2, 0
_080ED144: .4byte 0x03005AEC
_080ED148: .4byte 0x00002BAF
_080ED14C:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080ED158
	movs r0, #2
	b _080ED172
_080ED158:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080ED164
	movs r0, #3
	b _080ED172
_080ED164:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080ED170
	movs r0, #0
	b _080ED172
_080ED170:
	movs r0, #4
_080ED172:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GabbyAndTyGetLastBattleTrivia

	thumb_func_start GabbyAndTySetScriptVarsToEventObjectLocalIds
GabbyAndTySetScriptVarsToEventObjectLocalIds: @ 0x080ED178
	push {lr}
	bl GabbyAndTyGetBattleNum
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #7
	bhi _080ED250
	lsls r0, r0, #2
	ldr r1, _080ED194
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED194: .4byte 0x080ED198
_080ED198: @ jump table
	.4byte _080ED1B8 @ case 0
	.4byte _080ED1CC @ case 1
	.4byte _080ED1E0 @ case 2
	.4byte _080ED1F4 @ case 3
	.4byte _080ED208 @ case 4
	.4byte _080ED21C @ case 5
	.4byte _080ED230 @ case 6
	.4byte _080ED244 @ case 7
_080ED1B8:
	ldr r1, _080ED1C4
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _080ED1C8
	movs r0, #0xd
	b _080ED24E
	.align 2, 0
_080ED1C4: .4byte 0x02037280
_080ED1C8: .4byte 0x02037282
_080ED1CC:
	ldr r1, _080ED1D8
	movs r0, #5
	strh r0, [r1]
	ldr r1, _080ED1DC
	movs r0, #6
	b _080ED24E
	.align 2, 0
_080ED1D8: .4byte 0x02037280
_080ED1DC: .4byte 0x02037282
_080ED1E0:
	ldr r1, _080ED1EC
	movs r0, #0x12
	strh r0, [r1]
	ldr r1, _080ED1F0
	movs r0, #0x11
	b _080ED24E
	.align 2, 0
_080ED1EC: .4byte 0x02037280
_080ED1F0: .4byte 0x02037282
_080ED1F4:
	ldr r1, _080ED200
	movs r0, #0x15
	strh r0, [r1]
	ldr r1, _080ED204
	movs r0, #0x16
	b _080ED24E
	.align 2, 0
_080ED200: .4byte 0x02037280
_080ED204: .4byte 0x02037282
_080ED208:
	ldr r1, _080ED214
	movs r0, #8
	strh r0, [r1]
	ldr r1, _080ED218
	movs r0, #9
	b _080ED24E
	.align 2, 0
_080ED214: .4byte 0x02037280
_080ED218: .4byte 0x02037282
_080ED21C:
	ldr r1, _080ED228
	movs r0, #0x13
	strh r0, [r1]
	ldr r1, _080ED22C
	movs r0, #0x14
	b _080ED24E
	.align 2, 0
_080ED228: .4byte 0x02037280
_080ED22C: .4byte 0x02037282
_080ED230:
	ldr r1, _080ED23C
	movs r0, #0x17
	strh r0, [r1]
	ldr r1, _080ED240
	movs r0, #0x18
	b _080ED24E
	.align 2, 0
_080ED23C: .4byte 0x02037280
_080ED240: .4byte 0x02037282
_080ED244:
	ldr r1, _080ED254
	movs r0, #0xa
	strh r0, [r1]
	ldr r1, _080ED258
	movs r0, #0xb
_080ED24E:
	strh r0, [r1]
_080ED250:
	pop {r0}
	bx r0
	.align 2, 0
_080ED254: .4byte 0x02037280
_080ED258: .4byte 0x02037282
	thumb_func_end GabbyAndTySetScriptVarsToEventObjectLocalIds

	thumb_func_start InterviewAfter
InterviewAfter: @ 0x080ED25C
	push {lr}
	ldr r0, _080ED274
	ldrh r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _080ED2C4
	lsls r0, r0, #2
	ldr r1, _080ED278
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED274: .4byte 0x02037282
_080ED278: .4byte 0x080ED27C
_080ED27C: @ jump table
	.4byte _080ED29C @ case 0
	.4byte _080ED2A2 @ case 1
	.4byte _080ED2A8 @ case 2
	.4byte _080ED2AE @ case 3
	.4byte _080ED2C4 @ case 4
	.4byte _080ED2B4 @ case 5
	.4byte _080ED2BA @ case 6
	.4byte _080ED2C0 @ case 7
_080ED29C:
	bl InterviewAfter_FanClubLetter
	b _080ED2C4
_080ED2A2:
	bl InterviewAfter_RecentHappenings
	b _080ED2C4
_080ED2A8:
	bl InterviewAfter_PkmnFanClubOpinions
	b _080ED2C4
_080ED2AE:
	bl InterviewAfter_DummyShow4
	b _080ED2C4
_080ED2B4:
	bl InterviewAfter_BravoTrainerPokemonProfile
	b _080ED2C4
_080ED2BA:
	bl InterviewAfter_BravoTrainerBattleTowerProfile
	b _080ED2C4
_080ED2C0:
	bl InterviewAfter_ContestLiveUpdates
_080ED2C4:
	pop {r0}
	bx r0
	thumb_func_end InterviewAfter

	thumb_func_start PutPokemonTodayCaughtOnAir
PutPokemonTodayCaughtOnAir: @ 0x080ED2C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	bl sub_080EF88C
	bl sub_080EE238
	ldr r5, _080ED2E8
	ldrh r0, [r5, #0x28]
	cmp r0, #0
	bne _080ED2EC
	bl PutPokemonTodayFailedOnTheAir
	b _080ED41E
	.align 2, 0
_080ED2E8: .4byte 0x03005A70
_080ED2EC:
	bl UpdateWorldOfMastersAndPutItOnTheAir
	ldr r0, _080ED3A8
	bl TV_BernoulliTrial
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ED2FE
	b _080ED41E
_080ED2FE:
	ldrh r1, [r5, #0x28]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080ED3AC
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x2a
	bl StringCompare
	cmp r0, #0
	bne _080ED318
	b _080ED41E
_080ED318:
	ldr r0, _080ED3B0
	ldr r0, [r0]
	ldr r1, _080ED3B4
	adds r0, r0, r1
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r1, _080ED3B8
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080ED41E
	movs r0, #0x15
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080ED41E
	movs r2, #0
	adds r7, r5, #0
	adds r1, r7, #0
	adds r1, #0x36
_080ED34C:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xa
	bls _080ED34C
	cmp r4, #0
	bne _080ED36E
	ldrb r1, [r7, #5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080ED41E
_080ED36E:
	movs r4, #0
	ldr r2, _080ED3B0
	ldr r0, _080ED3B8
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080ED3B4
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	movs r0, #0x15
	strb r0, [r5]
	strb r4, [r5, #1]
	ldrb r1, [r7, #5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080ED3C0
	movs r4, #1
	movs r0, #1
	adds r3, r5, #0
	adds r3, #0x13
	ldr r1, _080ED3BC
	mov r8, r1
	adds r6, r5, #4
	b _080ED3F2
	.align 2, 0
_080ED3A8: .4byte 0x0000FFFF
_080ED3AC: .4byte 0x082EA31C
_080ED3B0: .4byte 0x03005AEC
_080ED3B4: .4byte 0x000027CC
_080ED3B8: .4byte 0x03005E20
_080ED3BC: .4byte 0x03005AF0
_080ED3C0:
	movs r2, #0
	ldr r0, _080ED428
	mov ip, r0
	adds r3, r5, #0
	adds r3, #0x13
	ldr r1, _080ED42C
	mov r8, r1
	adds r6, r5, #4
	adds r1, r7, #0
	adds r1, #0x36
_080ED3D4:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xa
	bls _080ED3D4
	cmp r4, #0xff
	bls _080ED3EE
	movs r4, #0xff
_080ED3EE:
	mov r1, ip
	ldrh r0, [r1]
_080ED3F2:
	strb r4, [r5, #0x12]
	strb r0, [r5, #0xf]
	mov r0, r8
	ldr r1, [r0]
	adds r0, r3, #0
	bl StringCopy
	ldr r4, _080ED430
	adds r0, r6, #0
	adds r1, r4, #0
	bl StringCopy
	subs r4, #0x2a
	ldrh r0, [r4, #0x28]
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	bl tv_store_id_3x
	ldr r0, _080ED434
	ldrb r0, [r0]
	strb r0, [r5, #2]
	strb r0, [r5, #3]
_080ED41E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ED428: .4byte 0x02023EAC
_080ED42C: .4byte 0x03005AF0
_080ED430: .4byte 0x03005A9A
_080ED434: .4byte 0x0829BDA5
	thumb_func_end PutPokemonTodayCaughtOnAir

	thumb_func_start UpdateWorldOfMastersAndPutItOnTheAir
UpdateWorldOfMastersAndPutItOnTheAir: @ 0x080ED438
	push {r4, lr}
	ldr r0, _080ED47C
	ldr r1, [r0]
	ldr r0, _080ED480
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0x19
	beq _080ED45E
	ldr r2, _080ED484
	adds r0, r1, r2
	movs r1, #0x18
	bl DeleteTVShowInArrayByIdx
	movs r0, #5
	bl GetGameStat
	strh r0, [r4, #6]
	movs r0, #0x19
	strb r0, [r4]
_080ED45E:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	ldr r1, _080ED488
	ldrh r0, [r1, #0x28]
	strh r0, [r4, #4]
	ldrh r0, [r1, #6]
	strh r0, [r4, #8]
	ldr r0, _080ED48C
	ldrb r0, [r0, #0x14]
	strb r0, [r4, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ED47C: .4byte 0x03005AEC
_080ED480: .4byte 0x00002B2C
_080ED484: .4byte 0x000027CC
_080ED488: .4byte 0x03005A70
_080ED48C: .4byte 0x02036FB8
	thumb_func_end UpdateWorldOfMastersAndPutItOnTheAir

	thumb_func_start PutPokemonTodayFailedOnTheAir
PutPokemonTodayFailedOnTheAir: @ 0x080ED490
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080ED554
	bl TV_BernoulliTrial
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080ED548
	movs r1, #0
	movs r5, #0
	ldr r2, _080ED558
_080ED4A8:
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xa
	bls _080ED4A8
	cmp r5, #0xff
	bls _080ED4C2
	movs r5, #0xff
_080ED4C2:
	cmp r5, #2
	bls _080ED548
	ldr r0, _080ED55C
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #6
	beq _080ED4D4
	cmp r0, #1
	bne _080ED548
_080ED4D4:
	ldr r7, _080ED560
	ldr r0, [r7]
	ldr r6, _080ED564
	adds r0, r0, r6
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080ED568
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080ED548
	movs r0, #0x17
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080ED548
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r4, [r7]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x17
	strb r0, [r4]
	strb r1, [r4, #1]
	ldr r1, _080ED56C
	ldrh r0, [r1, #6]
	strh r0, [r4, #0xc]
	ldrh r0, [r1, #0x20]
	strh r0, [r4, #0xe]
	strb r5, [r4, #0x10]
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r4, #0x11]
	ldr r0, _080ED570
	ldrb r0, [r0, #0x14]
	strb r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080ED574
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080ED578
	ldrb r0, [r0]
	strb r0, [r4, #2]
_080ED548:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ED554: .4byte 0x0000FFFF
_080ED558: .4byte 0x03005AA6
_080ED55C: .4byte 0x02023FDE
_080ED560: .4byte 0x03005AEC
_080ED564: .4byte 0x000027CC
_080ED568: .4byte 0x03005E20
_080ED56C: .4byte 0x03005A70
_080ED570: .4byte 0x02036FB8
_080ED574: .4byte 0x03005AF0
_080ED578: .4byte 0x0829BDA5
	thumb_func_end PutPokemonTodayFailedOnTheAir

	thumb_func_start tv_store_id_3x
tv_store_id_3x: @ 0x080ED57C
	push {r4, lr}
	adds r4, r0, #0
	bl GetPlayerIDAsU32
	strb r0, [r4, #0x1e]
	lsrs r2, r0, #8
	strb r2, [r4, #0x1f]
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x23
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end tv_store_id_3x

	thumb_func_start tv_store_id_2x
tv_store_id_2x: @ 0x080ED5A4
	push {r4, lr}
	adds r4, r0, #0
	bl GetPlayerIDAsU32
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
	lsrs r1, r0, #8
	adds r2, r4, #0
	adds r2, #0x21
	strb r1, [r2]
	adds r2, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x23
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end tv_store_id_2x

	thumb_func_start InterviewAfter_ContestLiveUpdates
InterviewAfter_ContestLiveUpdates: @ 0x080ED5CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080ED66C
	mov r8, r0
	ldr r7, [r0]
	ldr r1, _080ED670
	adds r6, r7, r1
	ldrb r1, [r6]
	cmp r1, #8
	bne _080ED662
	ldr r0, _080ED674
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r5, _080ED678
	adds r4, r4, r5
	adds r4, r7, r4
	strb r1, [r4]
	movs r0, #1
	strb r0, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x14
	ldr r1, _080ED67C
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _080ED680
	ldrh r0, [r0]
	strb r0, [r4, #0x1c]
	ldr r0, _080ED684
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080ED688
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r4, #0x12]
	ldrh r0, [r6, #2]
	strh r0, [r4, #2]
	ldrb r0, [r6, #0xc]
	strb r0, [r4, #0xc]
	ldrb r0, [r6, #0xd]
	strb r0, [r4, #0xd]
	ldrb r0, [r6, #0xe]
	strb r0, [r4, #0xe]
	ldrh r0, [r6, #0x10]
	strh r0, [r4, #0x10]
	ldrb r0, [r6, #0xf]
	strb r0, [r4, #0xf]
	adds r0, r4, #4
	ldr r2, _080ED68C
	adds r1, r7, r2
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080ED690
	ldrb r0, [r0]
	strb r0, [r4, #0x1d]
	ldrb r0, [r6, #0x1e]
	strb r0, [r4, #0x1e]
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r5
	movs r1, #0x18
	bl DeleteTVShowInArrayByIdx
_080ED662:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ED66C: .4byte 0x03005AEC
_080ED670: .4byte 0x00002B2C
_080ED674: .4byte 0x03005E20
_080ED678: .4byte 0x000027CC
_080ED67C: .4byte 0x03005AF0
_080ED680: .4byte 0x02039BCC
_080ED684: .4byte 0x02039BC4
_080ED688: .4byte 0x02024190
_080ED68C: .4byte 0x00002B30
_080ED690: .4byte 0x0829BDA5
	thumb_func_end InterviewAfter_ContestLiveUpdates

	thumb_func_start PutBattleUpdateOnTheAir
PutBattleUpdateOnTheAir: @ 0x080ED694
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	ldr r6, _080ED718
	ldr r0, [r6]
	ldr r5, _080ED71C
	adds r0, r0, r5
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r4, _080ED720
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080ED76E
	movs r0, #0xa
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080ED724
	ldrh r0, [r0]
	cmp r0, #1
	beq _080ED76E
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r6]
	adds r4, r1, r0
	movs r0, #0xa
	strb r0, [r4]
	movs r5, #1
	strb r5, [r4, #1]
	adds r0, r4, #4
	ldr r1, _080ED728
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _080ED72C
	ldr r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080ED730
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080ED732
	strb r5, [r4, #0x18]
	b _080ED734
	.align 2, 0
_080ED718: .4byte 0x03005AEC
_080ED71C: .4byte 0x000027CC
_080ED720: .4byte 0x03005E20
_080ED724: .4byte 0x02037290
_080ED728: .4byte 0x03005AF0
_080ED72C: .4byte 0x02022C90
_080ED730:
	movs r0, #2
_080ED732:
	strb r0, [r4, #0x18]
_080ED734:
	mov r0, sl
	strh r0, [r4, #0x14]
	mov r0, sb
	strh r0, [r4, #0x16]
	mov r0, r8
	strh r0, [r4, #2]
	adds r0, r4, #0
	adds r0, #0xc
	lsls r1, r7, #3
	subs r1, r1, r7
	lsls r5, r1, #2
	ldr r6, _080ED77C
	adds r1, r5, r6
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080ED780
	ldrb r0, [r0]
	strb r0, [r4, #0x19]
	cmp r0, #1
	beq _080ED76A
	adds r0, r6, r5
	ldrh r0, [r0, #0x12]
	cmp r0, #1
	bne _080ED76C
_080ED76A:
	movs r0, #1
_080ED76C:
	strb r0, [r4, #0x1a]
_080ED76E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ED77C: .4byte 0x020226A8
_080ED780: .4byte 0x0829BDA5
	thumb_func_end PutBattleUpdateOnTheAir

	thumb_func_start Put3CheersForPokeblocksOnTheAir
Put3CheersForPokeblocksOnTheAir: @ 0x080ED784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldr r0, [sp, #0x24]
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _080ED7D8
	mov r8, r0
	ldr r0, [r0]
	ldr r7, _080ED7DC
	adds r0, r0, r7
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r4, _080ED7E0
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080ED7D4
	movs r0, #9
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080ED7E4
	ldrh r0, [r0]
	cmp r0, #1
	bne _080ED7E8
_080ED7D4:
	movs r0, #0
	b _080ED85E
	.align 2, 0
_080ED7D8: .4byte 0x03005AEC
_080ED7DC: .4byte 0x000027CC
_080ED7E0: .4byte 0x03005E20
_080ED7E4: .4byte 0x02037290
_080ED7E8:
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r2, r8
	ldr r1, [r2]
	adds r4, r1, r0
	movs r0, #9
	strb r0, [r4]
	movs r7, #1
	strb r7, [r4, #1]
	adds r0, r4, #0
	adds r0, #0xc
	ldr r1, _080ED850
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #4
	mov r1, sl
	bl StringCopy
	movs r0, #7
	ands r5, r0
	ldrb r1, [r4, #3]
	subs r0, #0xf
	ands r0, r1
	orrs r0, r5
	movs r1, #3
	ands r6, r1
	lsls r2, r6, #3
	subs r1, #0x1c
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r4, #2]
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080ED854
	ldrb r0, [r0]
	strb r0, [r4, #0x14]
	cmp r0, #1
	beq _080ED84C
	mov r1, sb
	cmp r1, #1
	bne _080ED858
_080ED84C:
	strb r7, [r4, #0x15]
	b _080ED85C
	.align 2, 0
_080ED850: .4byte 0x03005AF0
_080ED854: .4byte 0x0829BDA5
_080ED858:
	mov r2, sb
	strb r2, [r4, #0x15]
_080ED85C:
	movs r0, #1
_080ED85E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Put3CheersForPokeblocksOnTheAir

	thumb_func_start PutFanClubSpecialOnTheAir
PutFanClubSpecialOnTheAir: @ 0x080ED870
	push {r4, r5, r6, lr}
	ldr r6, _080ED8D8
	ldr r0, _080ED8DC
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080ED8E0
	adds r0, r0, r1
	ldr r1, [r6]
	adds r4, r1, r0
	ldr r0, _080ED8E4
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	strb r0, [r4, #0x16]
	adds r0, r4, #2
	ldr r1, _080ED8E8
	ldr r1, [r1]
	bl StringCopy
	movs r0, #0xb
	strb r0, [r4]
	movs r5, #1
	strb r5, [r4, #1]
	bl GetPlayerIDAsU32
	strb r0, [r4, #0xa]
	lsrs r0, r0, #8
	strb r0, [r4, #0xb]
	adds r0, r4, #0
	adds r0, #0xc
	ldr r1, _080ED8EC
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080ED8F0
	ldrb r0, [r0]
	strb r0, [r4, #0x17]
	cmp r0, #1
	beq _080ED8D4
	ldr r0, [r6]
	ldr r1, _080ED8F4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080ED8F8
_080ED8D4:
	strb r5, [r4, #0x18]
	b _080ED8FA
	.align 2, 0
_080ED8D8: .4byte 0x03005AEC
_080ED8DC: .4byte 0x02037284
_080ED8E0: .4byte 0x000027CC
_080ED8E4: .4byte 0x02037282
_080ED8E8: .4byte 0x03005AF0
_080ED8EC: .4byte 0x02021C40
_080ED8F0: .4byte 0x0829BDA5
_080ED8F4: .4byte 0x000031A0
_080ED8F8:
	strb r0, [r4, #0x18]
_080ED8FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end PutFanClubSpecialOnTheAir

	thumb_func_start ContestLiveUpdates_BeforeInterview_1
ContestLiveUpdates_BeforeInterview_1: @ 0x080ED900
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _080ED940
	ldr r0, [r5]
	ldr r4, _080ED944
	adds r0, r0, r4
	movs r1, #0x18
	bl DeleteTVShowInArrayByIdx
	ldr r0, [r5]
	adds r0, r0, r4
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080ED948
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080ED938
	ldr r0, [r5]
	ldr r1, _080ED94C
	adds r0, r0, r1
	strb r6, [r0, #0xd]
	movs r1, #8
	strb r1, [r0]
_080ED938:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ED940: .4byte 0x03005AEC
_080ED944: .4byte 0x000027CC
_080ED948: .4byte 0x03005E20
_080ED94C: .4byte 0x00002B2C
	thumb_func_end ContestLiveUpdates_BeforeInterview_1

	thumb_func_start ContestLiveUpdates_BeforeInterview_2
ContestLiveUpdates_BeforeInterview_2: @ 0x080ED950
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080ED980
	ldr r0, [r0]
	ldr r1, _080ED984
	adds r4, r0, r1
	ldr r1, _080ED988
	adds r0, r0, r1
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080ED98C
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080ED978
	strb r5, [r4, #0xe]
_080ED978:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ED980: .4byte 0x03005AEC
_080ED984: .4byte 0x00002B2C
_080ED988: .4byte 0x000027CC
_080ED98C: .4byte 0x03005E20
	thumb_func_end ContestLiveUpdates_BeforeInterview_2

	thumb_func_start ContestLiveUpdates_BeforeInterview_3
ContestLiveUpdates_BeforeInterview_3: @ 0x080ED990
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080ED9C0
	ldr r0, [r0]
	ldr r1, _080ED9C4
	adds r4, r0, r1
	ldr r1, _080ED9C8
	adds r0, r0, r1
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080ED9CC
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080ED9B8
	strb r5, [r4, #0xf]
_080ED9B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ED9C0: .4byte 0x03005AEC
_080ED9C4: .4byte 0x00002B2C
_080ED9C8: .4byte 0x000027CC
_080ED9CC: .4byte 0x03005E20
	thumb_func_end ContestLiveUpdates_BeforeInterview_3

	thumb_func_start ContestLiveUpdates_BeforeInterview_4
ContestLiveUpdates_BeforeInterview_4: @ 0x080ED9D0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080EDA00
	ldr r0, [r0]
	ldr r1, _080EDA04
	adds r4, r0, r1
	ldr r1, _080EDA08
	adds r0, r0, r1
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080EDA0C
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080ED9F8
	strh r5, [r4, #0x10]
_080ED9F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EDA00: .4byte 0x03005AEC
_080EDA04: .4byte 0x00002B2C
_080EDA08: .4byte 0x000027CC
_080EDA0C: .4byte 0x03005E20
	thumb_func_end ContestLiveUpdates_BeforeInterview_4

	thumb_func_start ContestLiveUpdates_BeforeInterview_5
ContestLiveUpdates_BeforeInterview_5: @ 0x080EDA10
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080EDA64
	ldr r4, [r0]
	ldr r0, _080EDA68
	adds r6, r4, r0
	ldr r1, _080EDA6C
	adds r0, r4, r1
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080EDA70
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EDAA0
	ldr r2, _080EDA74
	lsls r1, r5, #6
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #2]
	ldr r3, _080EDA78
	adds r0, r4, r3
	adds r2, #0xd
	adds r1, r1, r2
	bl StringCopy
	strb r7, [r6, #0xc]
	adds r1, r5, #1
	ldr r0, _080EDA7C
	ldrb r0, [r0]
	cmp r1, r0
	ble _080EDA84
	ldr r0, _080EDA80
	ldrb r0, [r0]
	b _080EDA9E
	.align 2, 0
_080EDA64: .4byte 0x03005AEC
_080EDA68: .4byte 0x00002B2C
_080EDA6C: .4byte 0x000027CC
_080EDA70: .4byte 0x03005E20
_080EDA74: .4byte 0x02039AA0
_080EDA78: .4byte 0x00002B30
_080EDA7C: .4byte 0x02039BD0
_080EDA80: .4byte 0x0829BDA5
_080EDA84:
	ldr r0, _080EDAA8
	ldrb r0, [r0]
	cmp r0, #1
	beq _080EDA9C
	ldr r1, _080EDAAC
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x1a]
	cmp r0, #1
	bne _080EDA9E
_080EDA9C:
	movs r0, #1
_080EDA9E:
	strb r0, [r6, #0x1e]
_080EDAA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDAA8: .4byte 0x0829BDA5
_080EDAAC: .4byte 0x020226A0
	thumb_func_end ContestLiveUpdates_BeforeInterview_5

	thumb_func_start InterviewAfter_BravoTrainerPokemonProfile
InterviewAfter_BravoTrainerPokemonProfile: @ 0x080EDAB0
	push {r4, r5, r6, r7, lr}
	ldr r0, _080EDB54
	ldr r6, [r0]
	ldr r0, _080EDB58
	adds r5, r6, r0
	ldrb r2, [r5]
	cmp r2, #6
	bne _080EDB80
	ldr r0, _080EDB5C
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EDB60
	adds r0, r0, r1
	adds r4, r6, r0
	strb r2, [r4]
	movs r7, #1
	strb r7, [r4, #1]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x16
	ldr r1, _080EDB64
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #0
	adds r0, #8
	ldr r2, _080EDB68
	adds r1, r6, r2
	bl StringCopy
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	ldrb r2, [r4, #0x13]
	movs r3, #8
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #0x13]
	ldrb r2, [r5, #0x13]
	movs r0, #0x18
	ands r0, r2
	movs r2, #0x19
	rsbs r2, r2, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, #0x13]
	ldrh r0, [r5, #0x14]
	strh r0, [r4, #0x14]
	ldrb r0, [r5, #0x13]
	movs r1, #0x60
	ands r1, r0
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x13]
	ldrb r1, [r5, #0x13]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, #0x13]
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080EDB6C
	ldrb r0, [r0]
	strb r0, [r4, #0x1e]
	cmp r0, #1
	beq _080EDB4E
	ldrb r0, [r5, #0x1f]
	cmp r0, #1
	bne _080EDB70
_080EDB4E:
	strb r7, [r4, #0x1f]
	b _080EDB72
	.align 2, 0
_080EDB54: .4byte 0x03005AEC
_080EDB58: .4byte 0x00002B2C
_080EDB5C: .4byte 0x03005E20
_080EDB60: .4byte 0x000027CC
_080EDB64: .4byte 0x03005AF0
_080EDB68: .4byte 0x00002B34
_080EDB6C: .4byte 0x0829BDA5
_080EDB70:
	strb r0, [r4, #0x1f]
_080EDB72:
	ldr r0, _080EDB88
	ldr r0, [r0]
	ldr r1, _080EDB8C
	adds r0, r0, r1
	movs r1, #0x18
	bl DeleteTVShowInArrayByIdx
_080EDB80:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDB88: .4byte 0x03005AEC
_080EDB8C: .4byte 0x000027CC
	thumb_func_end InterviewAfter_BravoTrainerPokemonProfile

	thumb_func_start BravoTrainerPokemonProfile_BeforeInterview1
BravoTrainerPokemonProfile_BeforeInterview1: @ 0x080EDB90
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _080EDBD4
	ldr r0, [r4]
	ldr r1, _080EDBD8
	adds r5, r0, r1
	bl InterviewBefore_BravoTrainerPkmnProfile
	ldr r0, [r4]
	ldr r1, _080EDBDC
	adds r0, r0, r1
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080EDBE0
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EDBCE
	ldr r0, [r4]
	ldr r1, _080EDBDC
	adds r0, r0, r1
	movs r1, #0x18
	bl DeleteTVShowInArrayByIdx
	strh r6, [r5, #0x14]
	movs r0, #6
	strb r0, [r5]
_080EDBCE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EDBD4: .4byte 0x03005AEC
_080EDBD8: .4byte 0x00002B2C
_080EDBDC: .4byte 0x000027CC
_080EDBE0: .4byte 0x03005E20
	thumb_func_end BravoTrainerPokemonProfile_BeforeInterview1

	thumb_func_start BravoTrainerPokemonProfile_BeforeInterview2
BravoTrainerPokemonProfile_BeforeInterview2: @ 0x080EDBE4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080EDC88
	ldr r0, [r0]
	mov r8, r0
	ldr r7, _080EDC8C
	add r7, r8
	ldr r0, _080EDC90
	add r0, r8
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080EDC94
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EDC7C
	movs r3, #3
	adds r0, r4, #0
	ands r0, r3
	lsls r0, r0, #5
	ldrb r1, [r7, #0x13]
	movs r2, #0x61
	rsbs r2, r2, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r7, #0x13]
	ldr r0, _080EDC98
	ldrb r0, [r0]
	movs r1, #7
	ands r1, r0
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #0x13]
	ldr r1, _080EDC9C
	ldrb r1, [r1]
	ands r3, r1
	lsls r3, r3, #3
	movs r1, #0x19
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r7, #0x13]
	ldr r6, _080EDCA0
	ldrb r0, [r6]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _080EDCA4
	adds r0, r0, r4
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #2]
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	ldr r2, _080EDCA8
	add r2, r8
	movs r1, #2
	bl GetMonData
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #3
	bl GetMonData
	strb r0, [r7, #0x1f]
_080EDC7C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDC88: .4byte 0x03005AEC
_080EDC8C: .4byte 0x00002B2C
_080EDC90: .4byte 0x000027CC
_080EDC94: .4byte 0x03005E20
_080EDC98: .4byte 0x02039BCC
_080EDC9C: .4byte 0x02039BCE
_080EDCA0: .4byte 0x02039BC4
_080EDCA4: .4byte 0x02024190
_080EDCA8: .4byte 0x00002B34
	thumb_func_end BravoTrainerPokemonProfile_BeforeInterview2

	thumb_func_start InterviewAfter_BravoTrainerBattleTowerProfile
InterviewAfter_BravoTrainerBattleTowerProfile: @ 0x080EDCAC
	push {r4, r5, r6, lr}
	ldr r2, _080EDD1C
	ldr r0, _080EDD20
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EDD24
	adds r0, r0, r1
	ldr r1, [r2]
	adds r6, r1, r0
	movs r0, #7
	strb r0, [r6]
	movs r0, #1
	strb r0, [r6, #1]
	adds r0, r6, #2
	ldr r4, _080EDD28
	ldr r1, [r4]
	bl StringCopy
	adds r0, r6, #0
	adds r0, #0xc
	ldr r1, [r4]
	ldr r2, _080EDD2C
	adds r1, r1, r2
	bl StringCopy
	ldr r1, [r4]
	ldr r2, _080EDD30
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r2, #2
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0x14]
	ldr r5, _080EDD34
	adds r1, r1, r5
	ldrb r0, [r1]
	movs r1, #0
	bl GetCurrentBattleTowerWinStreak
	strh r0, [r6, #0x16]
	ldr r0, [r4]
	ldr r1, _080EDD38
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r6, #0x1c]
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080EDD3C
	movs r0, #0x32
	b _080EDD3E
	.align 2, 0
_080EDD1C: .4byte 0x03005AEC
_080EDD20: .4byte 0x03005E20
_080EDD24: .4byte 0x000027CC
_080EDD28: .4byte 0x03005AF0
_080EDD2C: .4byte 0x00000BD8
_080EDD30: .4byte 0x00000BD4
_080EDD34: .4byte 0x00000D07
_080EDD38: .4byte 0x00000D06
_080EDD3C:
	movs r0, #0x64
_080EDD3E:
	strb r0, [r6, #0x1a]
	ldr r0, _080EDD70
	ldrh r0, [r0]
	strb r0, [r6, #0x1b]
	adds r0, r6, #0
	bl tv_store_id_2x
	ldr r0, _080EDD74
	ldrb r0, [r0]
	strb r0, [r6, #0x1d]
	cmp r0, #1
	beq _080EDD64
	ldr r0, _080EDD78
	ldr r0, [r0]
	ldr r2, _080EDD7C
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _080EDD66
_080EDD64:
	movs r0, #1
_080EDD66:
	strb r0, [r6, #0x1e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EDD70: .4byte 0x02037280
_080EDD74: .4byte 0x0829BDA5
_080EDD78: .4byte 0x03005AF0
_080EDD7C: .4byte 0x00000BEB
	thumb_func_end InterviewAfter_BravoTrainerBattleTowerProfile

	thumb_func_start SaveRecordedItemPurchasesForTVShow
SaveRecordedItemPurchasesForTVShow: @ 0x080EDD80
	push {r4, r5, r6, r7, lr}
	ldr r5, _080EDE40
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	ldr r0, _080EDE44
	cmp r1, r0
	beq _080EDE3A
	ldr r0, _080EDE48
	cmp r1, r0
	beq _080EDE3A
	ldr r0, _080EDE4C
	bl TV_BernoulliTrial
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080EDE3A
	ldr r0, [r5]
	ldr r7, _080EDE50
	adds r0, r0, r7
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r6, _080EDE54
	strb r0, [r6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EDE3A
	movs r0, #0x16
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EDE3A
	bl TV_SortPurchasesByQuantity
	ldr r2, _080EDE58
	ldrh r0, [r2, #2]
	cmp r0, #0x13
	bls _080EDE3A
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r5]
	adds r5, r1, r0
	movs r0, #0x16
	strb r0, [r5]
	strb r4, [r5, #1]
	ldr r0, _080EDE5C
	ldrb r0, [r0, #0x14]
	strb r0, [r5, #0x12]
	movs r4, #0
	adds r7, r5, #6
	mov ip, r2
	adds r6, r5, #0
	adds r6, #0xc
_080EDDFE:
	lsls r2, r4, #1
	adds r3, r7, r2
	lsls r1, r4, #2
	add r1, ip
	ldrh r0, [r1]
	strh r0, [r3]
	adds r2, r6, r2
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080EDDFE
	movs r0, #1
	bl GetPriceReduction
	strb r0, [r5, #2]
	adds r0, r5, #0
	adds r0, #0x13
	ldr r1, _080EDE60
	ldr r1, [r1]
	bl StringCopy
	adds r0, r5, #0
	bl tv_store_id_3x
	ldr r0, _080EDE64
	ldrb r0, [r0]
	strb r0, [r5, #3]
_080EDE3A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDE40: .4byte 0x03005AEC
_080EDE44: .4byte 0x00003C1A
_080EDE48: .4byte 0x0000371A
_080EDE4C: .4byte 0x00005555
_080EDE50: .4byte 0x000027CC
_080EDE54: .4byte 0x03005E20
_080EDE58: .4byte 0x02039C20
_080EDE5C: .4byte 0x02036FB8
_080EDE60: .4byte 0x03005AF0
_080EDE64: .4byte 0x0829BDA5
	thumb_func_end SaveRecordedItemPurchasesForTVShow

	thumb_func_start PutNameRaterShowOnTheAir
PutNameRaterShowOnTheAir: @ 0x080EDE68
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl InterviewBefore_NameRater
	ldr r0, _080EDF40
	ldrh r0, [r0]
	cmp r0, #1
	beq _080EDF32
	ldr r0, _080EDF44
	mov r8, r0
	ldrh r0, [r0]
	movs r7, #0x64
	muls r0, r7, r0
	ldr r6, _080EDF48
	adds r0, r0, r6
	ldr r4, _080EDF4C
	movs r1, #2
	adds r2, r4, #0
	bl GetMonData
	ldr r1, _080EDF50
	mov sb, r1
	ldr r0, [r1]
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080EDF32
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080EDF32
	ldr r2, _080EDF54
	ldr r0, _080EDF58
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EDF5C
	adds r0, r0, r1
	ldr r4, [r2]
	adds r4, r4, r0
	movs r0, #5
	strb r0, [r4]
	movs r5, #1
	strb r5, [r4, #1]
	mov r2, r8
	ldrh r0, [r2]
	muls r0, r7, r0
	adds r0, r0, r6
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r4, #2]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	strb r0, [r4, #0x1a]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ands r0, r5
	strb r0, [r4, #0x1b]
	ldrh r0, [r4, #2]
	bl TV_GetSomeOtherSpeciesAlreadySeenByPlayer
	strh r0, [r4, #0x1c]
	adds r0, r4, #0
	adds r0, #0xf
	mov r2, sb
	ldr r1, [r2]
	bl StringCopy
	mov r1, r8
	ldrh r0, [r1]
	muls r0, r7, r0
	adds r0, r0, r6
	adds r2, r4, #4
	movs r1, #2
	bl GetMonData
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080EDF60
	ldrb r0, [r0]
	strb r0, [r4, #0x1e]
	strb r0, [r4, #0x1f]
_080EDF32:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDF40: .4byte 0x02037290
_080EDF44: .4byte 0x02037280
_080EDF48: .4byte 0x02024190
_080EDF4C: .4byte 0x02021C40
_080EDF50: .4byte 0x03005AF0
_080EDF54: .4byte 0x03005AEC
_080EDF58: .4byte 0x03005E20
_080EDF5C: .4byte 0x000027CC
_080EDF60: .4byte 0x0829BDA5
	thumb_func_end PutNameRaterShowOnTheAir

	thumb_func_start StartMassOutbreak
StartMassOutbreak: @ 0x080EDF64
	push {r4, r5, lr}
	ldr r4, _080EDFF4
	ldr r0, _080EDFF8
	ldrh r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080EDFFC
	adds r1, r1, r0
	ldr r2, [r4]
	adds r1, r2, r1
	ldrh r3, [r1, #0xc]
	ldr r5, _080EE000
	adds r0, r2, r5
	strh r3, [r0]
	ldrb r0, [r1, #0x10]
	ldr r3, _080EE004
	adds r2, r2, r3
	strb r0, [r2]
	ldr r0, [r4]
	ldrb r2, [r1, #0x11]
	adds r5, #3
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [r4]
	ldrb r2, [r1, #0x14]
	adds r3, #2
	adds r0, r0, r3
	strb r2, [r0]
	ldr r0, [r4]
	ldrb r2, [r1, #2]
	adds r5, #2
	adds r0, r0, r5
	strb r2, [r0]
	ldr r2, [r4]
	ldrh r3, [r1, #0xe]
	adds r5, #1
	adds r0, r2, r5
	strh r3, [r0]
	ldrh r3, [r1, #4]
	adds r5, #2
	adds r0, r2, r5
	strh r3, [r0]
	ldrh r3, [r1, #6]
	adds r5, #2
	adds r0, r2, r5
	strh r3, [r0]
	ldrh r3, [r1, #8]
	adds r5, #2
	adds r0, r2, r5
	strh r3, [r0]
	ldrh r3, [r1, #0xa]
	adds r5, #2
	adds r0, r2, r5
	strh r3, [r0]
	ldrb r0, [r1, #3]
	ldr r3, _080EE008
	adds r2, r2, r3
	strb r0, [r2]
	ldr r0, [r4]
	ldrb r1, [r1, #0x13]
	adds r5, #3
	adds r0, r0, r5
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _080EE00C
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EDFF4: .4byte 0x03005AEC
_080EDFF8: .4byte 0x02037280
_080EDFFC: .4byte 0x000027CC
_080EE000: .4byte 0x00002B90
_080EE004: .4byte 0x00002B92
_080EE008: .4byte 0x00002BA0
_080EE00C: .4byte 0x00002BA2
	thumb_func_end StartMassOutbreak

	thumb_func_start PutLilycoveContestLadyShowOnTheAir
PutLilycoveContestLadyShowOnTheAir: @ 0x080EE010
	push {r4, lr}
	bl sub_080F0578
	ldr r0, _080EE06C
	ldrh r0, [r0]
	cmp r0, #1
	beq _080EE066
	ldr r2, _080EE070
	ldr r0, _080EE074
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EE078
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	adds r0, r4, #0
	adds r0, #0x17
	bl sub_0818E4A4
	ldrb r0, [r4, #0x17]
	strb r0, [r4, #0x18]
	movs r0, #0xc
	strb r0, [r4]
	movs r0, #1
	strb r0, [r4, #1]
	adds r0, r4, #2
	bl sub_0818E478
	adds r0, r4, #0
	adds r0, #0xa
	adds r1, r4, #0
	adds r1, #0xb
	bl sub_0818E43C
	bl sub_0818E4DC
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl tv_store_id_2x
_080EE066:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE06C: .4byte 0x02037290
_080EE070: .4byte 0x03005AEC
_080EE074: .4byte 0x03005E20
_080EE078: .4byte 0x000027CC
	thumb_func_end PutLilycoveContestLadyShowOnTheAir

	thumb_func_start InterviewAfter_FanClubLetter
InterviewAfter_FanClubLetter: @ 0x080EE07C
	push {r4, lr}
	ldr r2, _080EE0D4
	ldr r0, _080EE0D8
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EE0DC
	adds r0, r0, r1
	ldr r4, [r2]
	adds r4, r4, r0
	movs r0, #1
	strb r0, [r4]
	strb r0, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x10
	ldr r1, _080EE0E0
	ldr r1, [r1]
	bl StringCopy
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _080EE0E4
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080EE0E8
	ldrb r0, [r0]
	strb r0, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE0D4: .4byte 0x03005AEC
_080EE0D8: .4byte 0x03005E20
_080EE0DC: .4byte 0x000027CC
_080EE0E0: .4byte 0x03005AF0
_080EE0E4: .4byte 0x02024190
_080EE0E8: .4byte 0x0829BDA5
	thumb_func_end InterviewAfter_FanClubLetter

	thumb_func_start InterviewAfter_RecentHappenings
InterviewAfter_RecentHappenings: @ 0x080EE0EC
	push {r4, r5, lr}
	ldr r2, _080EE130
	ldr r0, _080EE134
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EE138
	adds r0, r0, r1
	ldr r4, [r2]
	adds r4, r4, r0
	movs r5, #0
	movs r0, #2
	strb r0, [r4]
	movs r0, #1
	strb r0, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x10
	ldr r1, _080EE13C
	ldr r1, [r1]
	bl StringCopy
	strh r5, [r4, #2]
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080EE140
	ldrb r0, [r0]
	strb r0, [r4, #0x18]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE130: .4byte 0x03005AEC
_080EE134: .4byte 0x03005E20
_080EE138: .4byte 0x000027CC
_080EE13C: .4byte 0x03005AF0
_080EE140: .4byte 0x0829BDA5
	thumb_func_end InterviewAfter_RecentHappenings

	thumb_func_start InterviewAfter_PkmnFanClubOpinions
InterviewAfter_PkmnFanClubOpinions: @ 0x080EE144
	push {r4, r5, r6, r7, lr}
	ldr r2, _080EE1FC
	ldr r0, _080EE200
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EE204
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	movs r0, #3
	strb r0, [r4]
	movs r7, #1
	strb r7, [r4, #1]
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _080EE208
	adds r0, r0, r5
	movs r1, #0x20
	movs r2, #0
	bl GetMonData
	lsrs r0, r0, #4
	movs r1, #0xf
	ands r0, r1
	ldrb r2, [r4, #4]
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #4]
	ldr r0, _080EE20C
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r2, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #4]
	adds r0, r4, #5
	ldr r1, _080EE210
	ldr r1, [r1]
	bl StringCopy
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	adds r0, r0, r5
	adds r2, r4, #0
	adds r2, #0x10
	movs r1, #2
	bl GetMonData
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080EE214
	ldrb r0, [r0]
	strb r0, [r4, #0xd]
	cmp r0, #1
	beq _080EE1F8
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #3
	bl GetMonData
	cmp r0, #1
	bne _080EE218
_080EE1F8:
	strb r7, [r4, #0xe]
	b _080EE22C
	.align 2, 0
_080EE1FC: .4byte 0x03005AEC
_080EE200: .4byte 0x03005E20
_080EE204: .4byte 0x000027CC
_080EE208: .4byte 0x02024190
_080EE20C: .4byte 0x02037286
_080EE210: .4byte 0x03005AF0
_080EE214: .4byte 0x0829BDA5
_080EE218:
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	adds r0, r0, r5
	movs r1, #3
	bl GetMonData
	strb r0, [r4, #0xe]
_080EE22C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InterviewAfter_PkmnFanClubOpinions

	thumb_func_start InterviewAfter_DummyShow4
InterviewAfter_DummyShow4: @ 0x080EE234
	bx lr
	.align 2, 0
	thumb_func_end InterviewAfter_DummyShow4

	thumb_func_start sub_080EE238
sub_080EE238: @ 0x080EE238
	push {r4, r5, r6, lr}
	ldr r0, _080EE30C
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080EE304
	movs r1, #0
	ldr r0, _080EE310
	ldr r2, [r0]
	ldr r3, _080EE314
_080EE24E:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x29
	beq _080EE304
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x17
	bls _080EE24E
	ldr r0, _080EE318
	bl TV_BernoulliTrial
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _080EE304
	ldr r6, _080EE310
	ldr r0, [r6]
	ldr r1, _080EE314
	adds r0, r0, r1
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r4, _080EE31C
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EE304
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _080EE314
	adds r1, r1, r2
	ldr r4, [r6]
	adds r4, r4, r1
	movs r1, #0x29
	strb r1, [r4]
	movs r3, #1
	strb r3, [r4, #1]
	ldr r2, _080EE320
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0xa]
	strb r0, [r4, #0x14]
	strb r5, [r4, #2]
	strb r5, [r4, #3]
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4, #0xc]
	strh r5, [r4, #0xe]
	ldrh r0, [r1, #2]
	strh r0, [r4, #4]
	ldrh r0, [r1, #4]
	strh r0, [r4, #6]
	ldrh r0, [r1, #6]
	strh r0, [r4, #8]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0xa]
	ldrb r0, [r1, #0xb]
	strb r0, [r4, #0x10]
	strb r2, [r4, #0x11]
	strb r2, [r4, #0x12]
	movs r0, #0x32
	strb r0, [r4, #0x13]
	strb r2, [r4, #0x15]
	strh r3, [r4, #0x16]
	adds r0, r4, #0
	bl tv_store_id_2x
	ldr r0, _080EE324
	ldrb r0, [r0]
	strb r0, [r4, #0x18]
_080EE304:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE30C: .4byte 0x00000864
_080EE310: .4byte 0x03005AEC
_080EE314: .4byte 0x000027CC
_080EE318: .4byte 0x00000147
_080EE31C: .4byte 0x03005E20
_080EE320: .4byte 0x08568B40
_080EE324: .4byte 0x0829BDA5
	thumb_func_end sub_080EE238

	thumb_func_start EndMassOutbreak
EndMassOutbreak: @ 0x080EE328
	push {r4, r5, lr}
	ldr r3, _080EE394
	ldr r0, [r3]
	ldr r2, _080EE398
	adds r1, r0, r2
	movs r4, #0
	movs r2, #0
	strh r2, [r1]
	ldr r5, _080EE39C
	adds r0, r0, r5
	strb r4, [r0]
	ldr r0, [r3]
	ldr r1, _080EE3A0
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, [r3]
	adds r5, #2
	adds r0, r0, r5
	strb r4, [r0]
	ldr r0, [r3]
	adds r1, #2
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, [r3]
	adds r5, #2
	adds r1, r0, r5
	strh r2, [r1]
	adds r5, #2
	adds r1, r0, r5
	strh r2, [r1]
	adds r5, #2
	adds r1, r0, r5
	strh r2, [r1]
	adds r5, #2
	adds r1, r0, r5
	strh r2, [r1]
	adds r5, #2
	adds r1, r0, r5
	strh r2, [r1]
	ldr r1, _080EE3A4
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, [r3]
	adds r5, #3
	adds r0, r0, r5
	strb r4, [r0]
	ldr r0, [r3]
	adds r1, #2
	adds r0, r0, r1
	strh r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE394: .4byte 0x03005AEC
_080EE398: .4byte 0x00002B90
_080EE39C: .4byte 0x00002B92
_080EE3A0: .4byte 0x00002B93
_080EE3A4: .4byte 0x00002BA0
	thumb_func_end EndMassOutbreak

	thumb_func_start UpdateTVShowsPerDay
UpdateTVShowsPerDay: @ 0x080EE3A8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	bl sub_080EE3D4
	adds r0, r4, #0
	bl UpdateMassOutbreakTimeLeft
	adds r0, r4, #0
	bl sub_080EFC24
	adds r0, r4, #0
	bl sub_080EE568
	adds r0, r4, #0
	bl sub_080EF69C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdateTVShowsPerDay

	thumb_func_start sub_080EE3D4
sub_080EE3D4: @ 0x080EE3D4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _080EE41C
	ldr r0, [r1]
	ldr r2, _080EE420
	adds r0, r0, r2
	ldrh r0, [r0]
	mov ip, r1
	cmp r0, #0
	bne _080EE43C
	movs r1, #0
	ldr r6, _080EE424
_080EE3EE:
	mov r7, ip
	ldr r4, [r7]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r2, r4, r3
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, #0x29
	bne _080EE432
	ldr r7, _080EE428
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, #1
	bne _080EE432
	adds r0, r3, r6
	adds r1, r4, r0
	ldrh r0, [r1, #0x16]
	cmp r0, r5
	bhs _080EE42C
	movs r0, #0
	strh r0, [r1, #0x16]
	b _080EE43C
	.align 2, 0
_080EE41C: .4byte 0x03005AEC
_080EE420: .4byte 0x00002B90
_080EE424: .4byte 0x000027CC
_080EE428: .4byte 0x000027CD
_080EE42C:
	subs r0, r0, r5
	strh r0, [r1, #0x16]
	b _080EE43C
_080EE432:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x17
	bls _080EE3EE
_080EE43C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080EE3D4

	thumb_func_start UpdateMassOutbreakTimeLeft
UpdateMassOutbreakTimeLeft: @ 0x080EE444
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _080EE460
	ldr r0, [r0]
	ldr r3, _080EE464
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, r2
	bhi _080EE468
	bl EndMassOutbreak
	b _080EE46C
	.align 2, 0
_080EE460: .4byte 0x03005AEC
_080EE464: .4byte 0x00002BA2
_080EE468:
	subs r0, r0, r2
	strh r0, [r1]
_080EE46C:
	pop {r0}
	bx r0
	thumb_func_end UpdateMassOutbreakTimeLeft

	thumb_func_start sub_080EE470
sub_080EE470: @ 0x080EE470
	push {r4, lr}
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080EE498
	ldr r4, _080EE494
	ldrh r0, [r4]
	lsrs r0, r0, #8
	cmp r0, #4
	bls _080EE486
	bl PutFishingAdviceShowOnTheAir
_080EE486:
	ldrb r0, [r4]
	strh r0, [r4]
	cmp r0, #0xff
	beq _080EE4BC
	adds r0, #1
	b _080EE4BA
	.align 2, 0
_080EE494: .4byte 0x02039CF2
_080EE498:
	ldr r4, _080EE4C4
	ldrb r0, [r4]
	cmp r0, #4
	bls _080EE4A4
	bl PutFishingAdviceShowOnTheAir
_080EE4A4:
	ldrh r0, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	strh r1, [r4]
	lsrs r0, r1, #8
	cmp r0, #0xff
	beq _080EE4BC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
_080EE4BA:
	strh r0, [r4]
_080EE4BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE4C4: .4byte 0x02039CF2
	thumb_func_end sub_080EE470

	thumb_func_start PutFishingAdviceShowOnTheAir
PutFishingAdviceShowOnTheAir: @ 0x080EE4C8
	push {r4, r5, r6, lr}
	ldr r6, _080EE540
	ldr r0, [r6]
	ldr r5, _080EE544
	adds r0, r0, r5
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EE548
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EE538
	movs r0, #0x18
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EE538
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r6]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x18
	strb r0, [r4]
	strb r1, [r4, #1]
	ldr r1, _080EE54C
	ldrh r0, [r1]
	strb r0, [r4, #2]
	ldrh r0, [r1]
	lsrs r0, r0, #8
	strb r0, [r4, #3]
	ldr r0, _080EE550
	ldrh r0, [r0]
	strh r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EE554
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EE558
	ldrb r0, [r0]
	strb r0, [r4, #6]
_080EE538:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE540: .4byte 0x03005AEC
_080EE544: .4byte 0x000027CC
_080EE548: .4byte 0x03005E20
_080EE54C: .4byte 0x02039CF2
_080EE550: .4byte 0x02039CF0
_080EE554: .4byte 0x03005AF0
_080EE558: .4byte 0x0829BDA5
	thumb_func_end PutFishingAdviceShowOnTheAir

	thumb_func_start SetPokemonAnglerSpecies
SetPokemonAnglerSpecies: @ 0x080EE55C
	ldr r1, _080EE564
	strh r0, [r1]
	bx lr
	.align 2, 0
_080EE564: .4byte 0x02039CF0
	thumb_func_end SetPokemonAnglerSpecies

	thumb_func_start sub_080EE568
sub_080EE568: @ 0x080EE568
	push {r4, lr}
	ldr r4, _080EE594
	ldr r0, [r4]
	ldr r2, _080EE598
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0x19
	bne _080EE58E
	ldrh r0, [r1, #2]
	cmp r0, #0x13
	bls _080EE582
	bl sub_080EE5A0
_080EE582:
	ldr r0, [r4]
	ldr r1, _080EE59C
	adds r0, r0, r1
	movs r1, #0x18
	bl DeleteTVShowInArrayByIdx
_080EE58E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE594: .4byte 0x03005AEC
_080EE598: .4byte 0x00002B2C
_080EE59C: .4byte 0x000027CC
	thumb_func_end sub_080EE568

	thumb_func_start sub_080EE5A0
sub_080EE5A0: @ 0x080EE5A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _080EE648
	ldr r0, [r7]
	ldr r1, _080EE64C
	adds r5, r0, r1
	ldr r0, _080EE650
	bl TV_BernoulliTrial
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _080EE63C
	ldr r0, [r7]
	ldr r1, _080EE654
	mov r8, r1
	add r0, r8
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EE658
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EE63C
	movs r0, #0x19
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EE63C
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldr r4, [r7]
	adds r4, r4, r0
	movs r0, #0x19
	strb r0, [r4]
	strb r6, [r4, #1]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	movs r0, #5
	bl GetGameStat
	ldrh r1, [r5, #6]
	subs r0, r0, r1
	strh r0, [r4, #6]
	ldrh r0, [r5, #4]
	strh r0, [r4, #4]
	ldrh r0, [r5, #8]
	strh r0, [r4, #8]
	ldrb r0, [r5, #0xa]
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EE65C
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EE660
	ldrb r0, [r0]
	strb r0, [r4, #0xb]
	ldr r0, [r7]
	add r0, r8
	movs r1, #0x18
	bl DeleteTVShowInArrayByIdx
_080EE63C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE648: .4byte 0x03005AEC
_080EE64C: .4byte 0x00002B2C
_080EE650: .4byte 0x0000FFFF
_080EE654: .4byte 0x000027CC
_080EE658: .4byte 0x03005E20
_080EE65C: .4byte 0x03005AF0
_080EE660: .4byte 0x0829BDA5
	thumb_func_end sub_080EE5A0

	thumb_func_start sub_080EE664
sub_080EE664: @ 0x080EE664
	push {r4, r5, r6, r7, lr}
	movs r0, #0x1a
	movs r1, #1
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	ldr r4, _080EE6D8
	ldr r0, [r4]
	ldr r1, _080EE6DC
	adds r0, r0, r1
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r2, _080EE6E0
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EE760
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _080EE6DC
	adds r0, r0, r2
	ldr r1, [r4]
	adds r4, r1, r0
	movs r1, #0
	movs r0, #0x1a
	strb r0, [r4]
	strb r1, [r4, #1]
	ldr r6, _080EE6E4
	movs r5, #0
_080EE6A8:
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080EE6BC
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080EE6BC:
	adds r6, #1
	ldr r0, _080EE6E8
	cmp r6, r0
	bls _080EE6A8
	strb r5, [r4, #4]
	bl IsNationalPokedexEnabled
	cmp r0, #0
	beq _080EE6EC
	movs r0, #1
	bl GetNationalPokedexCount
	b _080EE6F2
	.align 2, 0
_080EE6D8: .4byte 0x03005AEC
_080EE6DC: .4byte 0x000027CC
_080EE6E0: .4byte 0x03005E20
_080EE6E4: .4byte 0x00000867
_080EE6E8: .4byte 0x0000086E
_080EE6EC:
	movs r0, #1
	bl GetHoennPokedexCount
_080EE6F2:
	strh r0, [r4, #2]
	ldr r1, _080EE768
	ldrb r0, [r1, #0x14]
	strb r0, [r4, #7]
	ldrh r0, [r1, #0x12]
	movs r1, #0
	strh r0, [r4, #0xa]
	strb r1, [r4, #5]
	strb r1, [r4, #6]
	movs r6, #0
	adds r7, r4, #0
	adds r7, #0x13
_080EE70A:
	ldr r0, _080EE76C
	lsls r5, r6, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EE724
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
_080EE724:
	ldr r0, _080EE770
	adds r0, r5, r0
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EE73C
	ldrb r0, [r4, #6]
	adds r0, #1
	strb r0, [r4, #6]
_080EE73C:
	adds r6, #1
	cmp r6, #6
	bls _080EE70A
	ldr r0, _080EE774
	ldr r1, [r0]
	ldr r2, _080EE778
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r4, #8]
	adds r0, r7, #0
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EE77C
	ldrb r0, [r0]
	strb r0, [r4, #0xc]
_080EE760:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE768: .4byte 0x02036FB8
_080EE76C: .4byte 0x08568B8A
_080EE770: .4byte 0x08568B7C
_080EE774: .4byte 0x03005AF0
_080EE778: .4byte 0x00000EB8
_080EE77C: .4byte 0x0829BDA5
	thumb_func_end sub_080EE664

	thumb_func_start sub_080EE780
sub_080EE780: @ 0x080EE780
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _080EE7F4
	ldr r0, [r7]
	ldr r6, _080EE7F8
	adds r0, r0, r6
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EE7FC
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EE7EE
	movs r0, #0x1b
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EE7EE
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r4, [r7]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x1b
	strb r0, [r4]
	strb r1, [r4, #1]
	ldr r1, _080EE800
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	strb r0, [r4, #8]
	ldrh r0, [r5]
	strh r0, [r4, #4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #6]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EE804
	ldrb r0, [r0]
	strb r0, [r4, #9]
_080EE7EE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE7F4: .4byte 0x03005AEC
_080EE7F8: .4byte 0x000027CC
_080EE7FC: .4byte 0x03005E20
_080EE800: .4byte 0x03005AF0
_080EE804: .4byte 0x0829BDA5
	thumb_func_end sub_080EE780

	thumb_func_start sub_080EE808
sub_080EE808: @ 0x080EE808
	push {r4, r5, r6, lr}
	ldr r6, _080EE87C
	ldr r0, [r6]
	ldr r5, _080EE880
	adds r0, r0, r5
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EE884
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EE876
	movs r0, #0x1c
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EE876
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r6]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x1c
	strb r0, [r4]
	strb r1, [r4, #1]
	ldr r0, _080EE888
	ldrh r0, [r0]
	strh r0, [r4, #2]
	ldr r1, _080EE88C
	ldrb r0, [r1, #0x14]
	strb r0, [r4, #4]
	ldrh r0, [r1, #0x12]
	strh r0, [r4, #6]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EE890
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EE894
	ldrb r0, [r0]
	strb r0, [r4, #5]
_080EE876:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE87C: .4byte 0x03005AEC
_080EE880: .4byte 0x000027CC
_080EE884: .4byte 0x03005E20
_080EE888: .4byte 0x02037282
_080EE88C: .4byte 0x02036FB8
_080EE890: .4byte 0x03005AF0
_080EE894: .4byte 0x0829BDA5
	thumb_func_end sub_080EE808

	thumb_func_start AlertTVOfNewCoinTotal
AlertTVOfNewCoinTotal: @ 0x080EE898
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080EE8DC
	ldr r0, [r0]
	ldr r1, _080EE8E0
	adds r0, r0, r1
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r1, _080EE8E4
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EE974
	movs r0, #0x1d
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EE974
	movs r5, #0
	ldr r0, _080EE8E8
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _080EE8EC
	cmp r1, #1
	beq _080EE90E
	b _080EE974
	.align 2, 0
_080EE8DC: .4byte 0x03005AEC
_080EE8E0: .4byte 0x000027CC
_080EE8E4: .4byte 0x03005E20
_080EE8E8: .4byte 0x02039CF6
_080EE8EC:
	ldr r0, _080EE900
	ldrh r1, [r0]
	adds r0, r1, #0
	adds r0, #0xc8
	cmp r4, r0
	blt _080EE904
	movs r5, #1
	subs r0, r4, r1
	b _080EE932
	.align 2, 0
_080EE900: .4byte 0x02039CF4
_080EE904:
	cmp r1, #0x63
	bls _080EE974
	adds r0, r1, #0
	subs r0, #0x64
	b _080EE92C
_080EE90E:
	ldr r0, _080EE920
	ldrh r1, [r0]
	adds r0, r1, #0
	adds r0, #0x32
	cmp r4, r0
	blt _080EE924
	movs r5, #1
	subs r0, r4, r1
	b _080EE932
	.align 2, 0
_080EE920: .4byte 0x02039CF4
_080EE924:
	cmp r1, #0x31
	bls _080EE974
	adds r0, r1, #0
	subs r0, #0x32
_080EE92C:
	cmp r4, r0
	bgt _080EE974
	subs r0, r1, r4
_080EE932:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _080EE97C
	ldr r0, _080EE980
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EE984
	adds r0, r0, r1
	ldr r4, [r2]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x1d
	strb r0, [r4]
	strb r1, [r4, #1]
	strh r3, [r4, #4]
	ldrb r0, [r6]
	strb r0, [r4, #3]
	strb r5, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EE988
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EE98C
	ldrb r0, [r0]
	strb r0, [r4, #8]
_080EE974:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EE97C: .4byte 0x03005AEC
_080EE980: .4byte 0x03005E20
_080EE984: .4byte 0x000027CC
_080EE988: .4byte 0x03005AF0
_080EE98C: .4byte 0x0829BDA5
	thumb_func_end AlertTVOfNewCoinTotal

	thumb_func_start AlertTVThatPlayerPlayedSlotMachine
AlertTVThatPlayerPlayedSlotMachine: @ 0x080EE990
	ldr r2, _080EE99C
	movs r1, #0
	strb r1, [r2]
	ldr r1, _080EE9A0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080EE99C: .4byte 0x02039CF6
_080EE9A0: .4byte 0x02039CF4
	thumb_func_end AlertTVThatPlayerPlayedSlotMachine

	thumb_func_start AlertTVThatPlayerPlayedRoulette
AlertTVThatPlayerPlayedRoulette: @ 0x080EE9A4
	ldr r2, _080EE9B0
	movs r1, #1
	strb r1, [r2]
	ldr r1, _080EE9B4
	strh r0, [r1]
	bx lr
	.align 2, 0
_080EE9B0: .4byte 0x02039CF6
_080EE9B4: .4byte 0x02039CF4
	thumb_func_end AlertTVThatPlayerPlayedRoulette

	thumb_func_start sub_080EE9B8
sub_080EE9B8: @ 0x080EE9B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	movs r3, #0
	ldr r6, _080EE9FC
	ldr r7, _080EEA00
	adds r2, r6, #0
	movs r1, #0
_080EE9CC:
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _080EE9CC
	movs r3, #0
	movs r5, #0
_080EE9DE:
	ldr r0, [r7]
	ldr r1, _080EEA04
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r4, [r0]
	adds r3, #1
	cmp r4, #0
	beq _080EEA2A
	movs r1, #0
	ldrb r0, [r6]
	cmp r0, #0
	bne _080EEA08
	strb r4, [r6]
	b _080EEA24
	.align 2, 0
_080EE9FC: .4byte 0x03005E40
_080EEA00: .4byte 0x03005AEC
_080EEA04: .4byte 0x00001AAE
_080EEA08:
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, r4
	beq _080EEA2A
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bhi _080EEA2A
	adds r2, r1, r6
	ldrb r0, [r2]
	cmp r0, #0
	bne _080EEA08
	strb r4, [r2]
_080EEA24:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080EEA2A:
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _080EE9DE
	cmp r5, #4
	bls _080EEA3E
	movs r0, #4
	mov r1, r8
	strb r0, [r1, #3]
	b _080EEA42
_080EEA3E:
	mov r0, r8
	strb r5, [r0, #3]
_080EEA42:
	mov r1, r8
	ldrb r0, [r1, #3]
	cmp r0, #0
	beq _080EEAC4
	cmp r0, #1
	bne _080EEA54
	ldrb r0, [r6]
	strb r0, [r1, #4]
	b _080EEAC4
_080EEA54:
	movs r6, #0
	adds r7, r5, #0
	muls r7, r5, r7
	cmp r6, r7
	bge _080EEA9E
	ldr r0, _080EEAD0
	mov sb, r0
_080EEA62:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov r0, sb
	adds r2, r4, r0
	ldrb r3, [r2]
	add r1, sb
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, r7
	blt _080EEA62
_080EEA9E:
	movs r3, #0
	mov r1, r8
	ldrb r1, [r1, #3]
	cmp r3, r1
	bhs _080EEAC4
	mov r2, r8
	adds r2, #4
	ldr r4, _080EEAD0
_080EEAAE:
	adds r1, r2, r3
	adds r0, r3, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, r8
	ldrb r0, [r0, #3]
	cmp r3, r0
	blo _080EEAAE
_080EEAC4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EEAD0: .4byte 0x03005E40
	thumb_func_end sub_080EE9B8

	thumb_func_start sub_080EEAD4
sub_080EEAD4: @ 0x080EEAD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r7, #0
	movs r0, #0
	mov sb, r0
	ldr r1, _080EEC18
	mov r8, r1
_080EEAEA:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _080EEC1C
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _080EEBB4
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _080EEBB4
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	ldr r2, _080EEC20
	mov r3, sb
	lsls r1, r3, #3
	adds r6, r1, r2
	strb r0, [r6]
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	strh r0, [r6, #2]
	movs r5, #0
	adds r0, r4, #0
	movs r1, #0xd
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080EEB40
	mov r0, r8
	strh r1, [r0]
	movs r5, #1
_080EEB40:
	adds r0, r4, #0
	movs r1, #0xe
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080EEB5C
	lsls r0, r5, #1
	add r0, r8
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080EEB5C:
	adds r0, r4, #0
	movs r1, #0xf
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080EEB78
	lsls r0, r5, #1
	add r0, r8
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080EEB78:
	adds r0, r4, #0
	movs r1, #0x10
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080EEB94
	lsls r0, r5, #1
	add r0, r8
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080EEB94:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __modsi3
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r6, #4]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_080EEBB4:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #5
	bls _080EEAEA
	movs r7, #0
	movs r1, #0
	cmp r1, sb
	bhs _080EEBDE
	ldr r2, _080EEC20
_080EEBC8:
	lsls r0, r7, #3
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, sb
	blo _080EEBC8
_080EEBDE:
	adds r0, r1, #0
	mov r1, sb
	bl __divsi3
	mov r1, sl
	strb r0, [r1, #2]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sb
	bl __modsi3
	lsls r0, r0, #0x10
	ldr r1, _080EEC20
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r1, [r0, #2]
	mov r2, sl
	strh r1, [r2, #8]
	ldrh r0, [r0, #4]
	strh r0, [r2, #0xa]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EEC18: .4byte 0x03005E30
_080EEC1C: .4byte 0x02024190
_080EEC20: .4byte 0x03005E50
	thumb_func_end sub_080EEAD4

	thumb_func_start TV_PutSecretBaseVisitOnTheAir
TV_PutSecretBaseVisitOnTheAir: @ 0x080EEC24
	push {r4, lr}
	movs r0, #0x1f
	movs r1, #1
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	ldr r4, _080EEC90
	ldr r0, [r4]
	ldr r1, _080EEC94
	adds r0, r0, r1
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r2, _080EEC98
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EEC88
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EEC94
	adds r0, r0, r1
	ldr r4, [r4]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x1f
	strb r0, [r4]
	strb r1, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EEC9C
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #0
	bl sub_080EE9B8
	adds r0, r4, #0
	bl sub_080EEAD4
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EECA0
	ldrb r0, [r0]
	strb r0, [r4, #0xc]
_080EEC88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EEC90: .4byte 0x03005AEC
_080EEC94: .4byte 0x000027CC
_080EEC98: .4byte 0x03005E20
_080EEC9C: .4byte 0x03005AF0
_080EECA0: .4byte 0x0829BDA5
	thumb_func_end TV_PutSecretBaseVisitOnTheAir

	thumb_func_start sub_080EECA4
sub_080EECA4: @ 0x080EECA4
	push {r4, r5, r6, r7, lr}
	ldr r6, _080EED44
	ldr r0, [r6]
	ldr r5, _080EED48
	adds r0, r0, r5
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EED4C
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080EECC4
	b _080EEDE2
_080EECC4:
	movs r0, #0x1e
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EECD6
	b _080EEDE2
_080EECD6:
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r6]
	adds r4, r1, r0
	movs r1, #0
	movs r0, #0x1e
	strb r0, [r4]
	strb r1, [r4, #1]
	movs r5, #0
	ldr r6, _080EED50
	ldr r3, _080EED54
	ldr r7, _080EED58
	adds r2, r6, #0
	adds r2, #0x36
_080EECFA:
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xa
	bls _080EECFA
	ldrb r1, [r6, #5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080EED1E
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080EED1E:
	ldrb r0, [r3, #0x14]
	strb r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, [r7]
	bl StringCopy
	ldrh r0, [r6, #6]
	strh r0, [r4, #0xa]
	ldr r0, _080EED5C
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #9
	bhi _080EEDA2
	lsls r0, r0, #2
	ldr r1, _080EED60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EED44: .4byte 0x03005AEC
_080EED48: .4byte 0x000027CC
_080EED4C: .4byte 0x03005E20
_080EED50: .4byte 0x03005A70
_080EED54: .4byte 0x02036FB8
_080EED58: .4byte 0x03005AF0
_080EED5C: .4byte 0x02023FDE
_080EED60: .4byte 0x080EED64
_080EED64: @ jump table
	.4byte _080EED96 @ case 0
	.4byte _080EED8C @ case 1
	.4byte _080EED8C @ case 2
	.4byte _080EED9A @ case 3
	.4byte _080EED9A @ case 4
	.4byte _080EED9E @ case 5
	.4byte _080EED92 @ case 6
	.4byte _080EED9A @ case 7
	.4byte _080EEDA2 @ case 8
	.4byte _080EED9E @ case 9
_080EED8C:
	movs r0, #0
	strb r0, [r4]
	b _080EEDE2
_080EED92:
	movs r0, #0
	b _080EEDA0
_080EED96:
	movs r0, #1
	b _080EEDA0
_080EED9A:
	movs r0, #2
	b _080EEDA0
_080EED9E:
	movs r0, #3
_080EEDA0:
	strb r0, [r4, #5]
_080EEDA2:
	ldr r1, _080EEDC4
	ldrh r0, [r1, #0x20]
	strh r0, [r4, #2]
	ldrb r0, [r4, #5]
	cmp r0, #1
	beq _080EEDD2
	cmp r0, #1
	bgt _080EEDD6
	cmp r0, #0
	bne _080EEDD6
	ldrb r1, [r1, #5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080EEDC8
	movs r0, #1
	b _080EEDCC
	.align 2, 0
_080EEDC4: .4byte 0x03005A70
_080EEDC8:
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1c
_080EEDCC:
	strh r0, [r4, #6]
	strh r5, [r4, #8]
	b _080EEDD6
_080EEDD2:
	ldrh r0, [r1, #0x22]
	strh r0, [r4, #0xc]
_080EEDD6:
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EEDE8
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
_080EEDE2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EEDE8: .4byte 0x0829BDA5
	thumb_func_end sub_080EECA4

	thumb_func_start sub_080EEDEC
sub_080EEDEC: @ 0x080EEDEC
	push {r4, r5, r6, lr}
	ldr r6, _080EEE60
	ldr r0, [r6]
	ldr r5, _080EEE64
	adds r0, r0, r5
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EEE68
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EEE5A
	movs r0, #0x20
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EEE5A
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r6]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x20
	strb r0, [r4]
	strb r1, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EEE6C
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _080EEE70
	ldrb r1, [r0]
	movs r0, #4
	subs r0, r0, r1
	strb r0, [r4, #4]
	ldr r0, _080EEE74
	ldrh r0, [r0]
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EEE78
	ldrb r0, [r0]
	strb r0, [r4, #5]
_080EEE5A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EEE60: .4byte 0x03005AEC
_080EEE64: .4byte 0x000027CC
_080EEE68: .4byte 0x03005E20
_080EEE6C: .4byte 0x03005AF0
_080EEE70: .4byte 0x02037280
_080EEE74: .4byte 0x02037282
_080EEE78: .4byte 0x0829BDA5
	thumb_func_end sub_080EEDEC

	thumb_func_start sub_080EEE7C
sub_080EEE7C: @ 0x080EEE7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r3, #0
	ldr r3, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	ldr r0, _080EEF58
	mov r8, r0
	ldr r0, [r0]
	ldr r5, _080EEF5C
	adds r0, r0, r5
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EEF60
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EEF46
	movs r0, #0x21
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EEF46
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r2, r8
	ldr r1, [r2]
	adds r4, r1, r0
	movs r1, #0
	movs r0, #0x21
	strb r0, [r4]
	strb r1, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EEF64
	ldr r1, [r1]
	bl StringCopy
	mov r0, sl
	strh r0, [r4, #4]
	mov r1, sb
	strh r1, [r4, #6]
	lsls r0, r6, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r4, #2]
	movs r2, #0
	movs r3, #0
	adds r5, r4, #0
	adds r5, #8
_080EEF0E:
	cmp r2, r6
	beq _080EEF28
	lsls r0, r2, #1
	adds r0, r0, r7
	ldrh r1, [r0]
	cmp r1, #0
	beq _080EEF28
	lsls r0, r3, #1
	adds r0, r5, r0
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_080EEF28:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080EEF0E
	strb r3, [r4, #0x10]
	mov r2, sp
	ldrh r2, [r2]
	strh r2, [r4, #0xe]
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EEF68
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
_080EEF46:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EEF58: .4byte 0x03005AEC
_080EEF5C: .4byte 0x000027CC
_080EEF60: .4byte 0x03005E20
_080EEF64: .4byte 0x03005AF0
_080EEF68: .4byte 0x0829BDA5
	thumb_func_end sub_080EEE7C

	thumb_func_start sub_080EEF6C
sub_080EEF6C: @ 0x080EEF6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r6, _080EEFE8
	ldr r0, [r6]
	ldr r5, _080EEFEC
	adds r0, r0, r5
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EEFF0
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EEFDE
	movs r0, #0x27
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EEFDE
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r6]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x27
	strb r0, [r4]
	strb r1, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EEFF4
	ldr r1, [r1]
	bl StringCopy
	mov r0, r8
	strb r0, [r4, #2]
	strb r7, [r4, #3]
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EEFF8
	ldrb r0, [r0]
	strb r0, [r4, #4]
_080EEFDE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EEFE8: .4byte 0x03005AEC
_080EEFEC: .4byte 0x000027CC
_080EEFF0: .4byte 0x03005E20
_080EEFF4: .4byte 0x03005AF0
_080EEFF8: .4byte 0x0829BDA5
	thumb_func_end sub_080EEF6C

	thumb_func_start sub_080EEFFC
sub_080EEFFC: @ 0x080EEFFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r7, _080EF094
	ldr r0, [r7]
	ldr r6, _080EF098
	adds r0, r0, r6
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EF09C
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EF0B2
	movs r0, #0x23
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EF0B2
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r7]
	adds r4, r1, r0
	movs r1, #0
	movs r0, #0x23
	strb r0, [r4]
	strb r1, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EF0A0
	ldr r1, [r1]
	bl StringCopy
	adds r2, r4, #4
	adds r0, r5, #0
	movs r1, #2
	bl GetMonData
	adds r0, r5, #0
	bl GetRibbonCount
	strb r0, [r4, #2]
	mov r0, r8
	bl TV_MonDataIdxToRibbon
	strb r0, [r4, #3]
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EF0A4
	ldrb r0, [r0]
	strb r0, [r4, #0xf]
	cmp r0, #1
	beq _080EF090
	adds r0, r5, #0
	movs r1, #3
	bl GetMonData
	cmp r0, #1
	bne _080EF0A8
_080EF090:
	movs r0, #1
	b _080EF0B0
	.align 2, 0
_080EF094: .4byte 0x03005AEC
_080EF098: .4byte 0x000027CC
_080EF09C: .4byte 0x03005E20
_080EF0A0: .4byte 0x03005AF0
_080EF0A4: .4byte 0x0829BDA5
_080EF0A8:
	adds r0, r5, #0
	movs r1, #3
	bl GetMonData
_080EF0B0:
	strb r0, [r4, #0x10]
_080EF0B2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080EEFFC

	thumb_func_start GetRibbonCount
GetRibbonCount: @ 0x080EF0BC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x32
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x33
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x34
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x35
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x36
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x43
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x44
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x45
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x46
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x47
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x48
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x49
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x4a
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x4b
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x4c
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x4d
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0x4e
	bl GetMonData
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetRibbonCount

	thumb_func_start TV_MonDataIdxToRibbon
TV_MonDataIdxToRibbon: @ 0x080EF1B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x43
	beq _080EF23A
	cmp r0, #0x32
	bne _080EF1C6
	movs r0, #1
	b _080EF240
_080EF1C6:
	cmp r0, #0x33
	bne _080EF1CE
	movs r0, #5
	b _080EF240
_080EF1CE:
	cmp r0, #0x34
	bne _080EF1D6
	movs r0, #9
	b _080EF240
_080EF1D6:
	cmp r0, #0x35
	bne _080EF1DE
	movs r0, #0xd
	b _080EF240
_080EF1DE:
	cmp r0, #0x36
	bne _080EF1E6
	movs r0, #0x11
	b _080EF240
_080EF1E6:
	cmp r0, #0x44
	bne _080EF1EE
	movs r0, #0x15
	b _080EF240
_080EF1EE:
	cmp r0, #0x45
	bne _080EF1F6
	movs r0, #0x16
	b _080EF240
_080EF1F6:
	cmp r0, #0x46
	bne _080EF1FE
	movs r0, #0x17
	b _080EF240
_080EF1FE:
	cmp r0, #0x47
	bne _080EF206
	movs r0, #0x18
	b _080EF240
_080EF206:
	cmp r0, #0x48
	bne _080EF20E
	movs r0, #0x19
	b _080EF240
_080EF20E:
	cmp r0, #0x49
	bne _080EF216
	movs r0, #0x1a
	b _080EF240
_080EF216:
	cmp r0, #0x4a
	bne _080EF21E
	movs r0, #0x1b
	b _080EF240
_080EF21E:
	cmp r0, #0x4b
	bne _080EF226
	movs r0, #0x1c
	b _080EF240
_080EF226:
	cmp r0, #0x4c
	bne _080EF22E
	movs r0, #0x1d
	b _080EF240
_080EF22E:
	cmp r0, #0x4d
	bne _080EF236
	movs r0, #0x1e
	b _080EF240
_080EF236:
	cmp r0, #0x4e
	beq _080EF23E
_080EF23A:
	movs r0, #0
	b _080EF240
_080EF23E:
	movs r0, #0x1f
_080EF240:
	pop {r1}
	bx r1
	thumb_func_end TV_MonDataIdxToRibbon

	thumb_func_start sub_080EF244
sub_080EF244: @ 0x080EF244
	push {r4, r5, r6, lr}
	ldr r5, _080EF2BC
	ldr r0, [r5]
	ldr r6, _080EF2C0
	adds r0, r0, r6
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r4, _080EF2C4
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EF2B4
	movs r0, #0x22
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EF2B4
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r4, [r5]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x22
	strb r0, [r4]
	strb r1, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EF2C8
	ldr r1, [r1]
	bl StringCopy
	ldr r0, [r5]
	ldr r2, _080EF2CC
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r4, #4]
	ldr r1, _080EF2D0
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #6]
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EF2D4
	ldrb r0, [r0]
	strb r0, [r4, #8]
_080EF2B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EF2BC: .4byte 0x03005AEC
_080EF2C0: .4byte 0x000027CC
_080EF2C4: .4byte 0x03005E20
_080EF2C8: .4byte 0x03005AF0
_080EF2CC: .4byte 0x00002BB0
_080EF2D0: .4byte 0x00002BB2
_080EF2D4: .4byte 0x0829BDA5
	thumb_func_end sub_080EF244

	thumb_func_start sub_080EF2D8
sub_080EF2D8: @ 0x080EF2D8
	push {r4, lr}
	ldr r4, _080EF314
	ldr r0, [r4]
	ldr r1, _080EF318
	adds r0, r0, r1
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080EF31C
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EF328
	movs r0, #0xb
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080EF320
	ldrh r0, [r0]
	cmp r0, #1
	beq _080EF328
	ldr r0, [r4]
	ldr r1, _080EF324
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080EF328
	movs r0, #0
	b _080EF32A
	.align 2, 0
_080EF314: .4byte 0x03005AEC
_080EF318: .4byte 0x000027CC
_080EF31C: .4byte 0x03005E20
_080EF320: .4byte 0x02037290
_080EF324: .4byte 0x00003150
_080EF328:
	movs r0, #1
_080EF32A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080EF2D8

	thumb_func_start sub_080EF330
sub_080EF330: @ 0x080EF330
	push {r4, r5, r6, r7, lr}
	movs r0, #0x24
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080EF388
	ldr r0, _080EF3A8
	ldr r0, [r0]
	ldr r1, _080EF3AC
	adds r7, r0, r1
	bl GetPlayerIDAsU32
	adds r4, r0, #0
	movs r6, #5
	lsrs r5, r4, #8
_080EF354:
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0x24
	bne _080EF37E
	movs r3, #0xff
	adds r0, r4, #0
	ands r0, r3
	adds r2, r1, #0
	adds r2, #0x22
	ldrb r2, [r2]
	cmp r0, r2
	bne _080EF37E
	adds r0, r5, #0
	ands r0, r3
	adds r1, #0x23
	ldrb r1, [r1]
	cmp r0, r1
	beq _080EF3B4
_080EF37E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x17
	bls _080EF354
_080EF388:
	ldr r0, _080EF3A8
	ldr r0, [r0]
	ldr r1, _080EF3AC
	adds r0, r0, r1
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r1, _080EF3B0
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EF3D8
	movs r0, #1
	b _080EF3DA
	.align 2, 0
_080EF3A8: .4byte 0x03005AEC
_080EF3AC: .4byte 0x000027CC
_080EF3B0: .4byte 0x03005E20
_080EF3B4:
	ldr r5, _080EF3D0
	ldr r0, [r5]
	ldr r4, _080EF3D4
	adds r0, r0, r4
	adds r1, r6, #0
	bl DeleteTVShowInArrayByIdx
	ldr r0, [r5]
	adds r0, r0, r4
	bl sub_080F0428
	movs r0, #1
	b _080EF3DA
	.align 2, 0
_080EF3D0: .4byte 0x03005AEC
_080EF3D4: .4byte 0x000027CC
_080EF3D8:
	movs r0, #0
_080EF3DA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080EF330

	thumb_func_start sub_080EF3E0
sub_080EF3E0: @ 0x080EF3E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r5, _080EF448
	ldr r0, [r5]
	ldr r1, _080EF44C
	adds r0, r0, r1
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r2, _080EF450
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080EF40C
	b _080EF56A
_080EF40C:
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _080EF44C
	adds r0, r0, r2
	ldr r1, [r5]
	adds r7, r1, r0
	movs r1, #0
	movs r0, #0x24
	strb r0, [r7]
	strb r1, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x13
	ldr r1, _080EF454
	ldr r1, [r1]
	bl StringCopy
	strh r6, [r7, #2]
	strb r4, [r7, #0xd]
	subs r0, r4, #1
	cmp r0, #0xc
	bls _080EF43E
	b _080EF55E
_080EF43E:
	lsls r0, r0, #2
	ldr r1, _080EF458
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EF448: .4byte 0x03005AEC
_080EF44C: .4byte 0x000027CC
_080EF450: .4byte 0x03005E20
_080EF454: .4byte 0x03005AF0
_080EF458: .4byte 0x080EF45C
_080EF45C: @ jump table
	.4byte _080EF490 @ case 0
	.4byte _080EF4C0 @ case 1
	.4byte _080EF500 @ case 2
	.4byte _080EF518 @ case 3
	.4byte _080EF490 @ case 4
	.4byte _080EF490 @ case 5
	.4byte _080EF490 @ case 6
	.4byte _080EF490 @ case 7
	.4byte _080EF490 @ case 8
	.4byte _080EF490 @ case 9
	.4byte _080EF490 @ case 10
	.4byte _080EF490 @ case 11
	.4byte _080EF490 @ case 12
_080EF490:
	ldr r4, _080EF4BC
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #4]
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #6]
	adds r4, #0xc8
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #8]
	b _080EF55E
	.align 2, 0
_080EF4BC: .4byte 0x02024190
_080EF4C0:
	ldr r4, _080EF4FC
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #4]
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #6]
	adds r0, r4, #0
	adds r0, #0xc8
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #8]
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #0xa]
	b _080EF55E
	.align 2, 0
_080EF4FC: .4byte 0x02024190
_080EF500:
	ldr r4, _080EF514
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #4]
	adds r4, #0x64
	adds r0, r4, #0
	b _080EF554
	.align 2, 0
_080EF514: .4byte 0x02024190
_080EF518:
	ldr r2, _080EF574
	mov r8, r2
	ldr r6, _080EF578
	ldr r0, [r6]
	ldr r1, _080EF57C
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r5, #0x64
	adds r1, r0, #0
	muls r1, r5, r1
	movs r4, #0xea
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #4]
	ldr r0, [r6]
	ldr r2, _080EF580
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r1
_080EF554:
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	strh r0, [r7, #6]
_080EF55E:
	adds r0, r7, #0
	bl tv_store_id_3x
	ldr r0, _080EF584
	ldrb r0, [r0]
	strb r0, [r7, #0xc]
_080EF56A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF574: .4byte 0x03005AEC
_080EF578: .4byte 0x03005AF0
_080EF57C: .4byte 0x00000CAA
_080EF580: .4byte 0x00000CAC
_080EF584: .4byte 0x0829BDA5
	thumb_func_end sub_080EF3E0

	thumb_func_start sub_080EF588
sub_080EF588: @ 0x080EF588
	push {r4, r5, r6, r7, lr}
	movs r0, #0x26
	movs r1, #0
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EF690
	ldr r7, _080EF644
	ldr r0, [r7]
	ldr r1, _080EF648
	adds r0, r0, r1
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r2, _080EF64C
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EF690
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EF648
	adds r0, r0, r1
	ldr r1, [r7]
	adds r5, r1, r0
	movs r1, #0
	movs r0, #0x26
	strb r0, [r5]
	strb r1, [r5, #1]
	adds r0, r5, #0
	adds r0, #0x13
	ldr r1, _080EF650
	ldr r1, [r1]
	bl StringCopy
	ldr r0, _080EF654
	bl VarGet
	strh r0, [r5, #2]
	bl DeleteRegistry_Yes
	adds r0, r5, #4
	ldr r1, _080EF658
	bl StringCopy
	ldr r0, _080EF65C
	bl VarGet
	strh r0, [r5, #0x10]
	ldr r0, _080EF660
	bl VarGet
	adds r4, r0, #0
	ldr r0, _080EF664
	bl VarGet
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	adds r4, r4, r0
	str r4, [r5, #0xc]
	adds r0, r5, #0
	bl tv_store_id_3x
	ldr r0, _080EF668
	ldrb r0, [r0]
	strb r0, [r5, #0x1b]
	cmp r0, #1
	beq _080EF640
	ldr r4, [r7]
	ldr r6, _080EF66C
	adds r0, r6, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r4, r4, r1
	ldr r0, _080EF670
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #1
	bne _080EF674
_080EF640:
	movs r0, #1
	b _080EF68E
	.align 2, 0
_080EF644: .4byte 0x03005AEC
_080EF648: .4byte 0x000027CC
_080EF64C: .4byte 0x03005E20
_080EF650: .4byte 0x03005AF0
_080EF654: .4byte 0x000040EC
_080EF658: .4byte 0x02021C40
_080EF65C: .4byte 0x000040ED
_080EF660: .4byte 0x000040EE
_080EF664: .4byte 0x000040EF
_080EF668: .4byte 0x0829BDA5
_080EF66C: .4byte 0x00004054
_080EF670: .4byte 0x00001AA9
_080EF674:
	adds r0, r6, #0
	bl VarGet
	ldr r2, [r7]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r2, r2, r1
	ldr r1, _080EF698
	adds r2, r2, r1
	ldrb r0, [r2]
_080EF68E:
	strb r0, [r5, #0x1c]
_080EF690:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF698: .4byte 0x00001AA9
	thumb_func_end sub_080EF588

	thumb_func_start sub_080EF69C
sub_080EF69C: @ 0x080EF69C
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r6, _080EF6A8
	adds r7, r6, #2
	b _080EF6B2
	.align 2, 0
_080EF6A8: .4byte 0x08568B98
_080EF6AC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080EF6B2:
	cmp r5, #6
	bhi _080EF6D2
	lsls r4, r5, #2
	adds r0, r4, r6
	ldrh r0, [r0]
	bl VarGet
	adds r4, r4, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r0, r4
	blo _080EF6AC
	adds r0, r5, #0
	bl sub_080EF6F8
_080EF6D2:
	movs r5, #0
	ldr r4, _080EF6F4
_080EF6D6:
	lsls r0, r5, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r1, #0
	bl VarSet
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #6
	bls _080EF6D6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF6F4: .4byte 0x08568B98
	thumb_func_end sub_080EF69C

	thumb_func_start sub_080EF6F8
sub_080EF6F8: @ 0x080EF6F8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0x25
	movs r1, #1
	bl HasMixableShowAlreadyBeenSpawnedWithPlayerID
	ldr r4, _080EF76C
	ldr r0, [r4]
	ldr r1, _080EF770
	adds r0, r0, r1
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r2, _080EF774
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EF764
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EF770
	adds r0, r0, r1
	ldr r4, [r4]
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0x25
	strb r0, [r4]
	strb r1, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x13
	ldr r1, _080EF778
	ldr r1, [r1]
	bl StringCopy
	strb r5, [r4, #4]
	ldr r1, _080EF77C
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	bl VarGet
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl tv_store_id_3x
	ldr r0, _080EF780
	ldrb r0, [r0]
	strb r0, [r4, #5]
_080EF764:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EF76C: .4byte 0x03005AEC
_080EF770: .4byte 0x000027CC
_080EF774: .4byte 0x03005E20
_080EF778: .4byte 0x03005AF0
_080EF77C: .4byte 0x08568B98
_080EF780: .4byte 0x0829BDA5
	thumb_func_end sub_080EF6F8

	thumb_func_start sub_080EF784
sub_080EF784: @ 0x080EF784
	push {r4, lr}
	ldr r4, _080EF7A4
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF7A4: .4byte 0x000040E6
	thumb_func_end sub_080EF784

	thumb_func_start sub_080EF7A8
sub_080EF7A8: @ 0x080EF7A8
	push {r4, lr}
	ldr r4, _080EF7C8
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF7C8: .4byte 0x000040EB
	thumb_func_end sub_080EF7A8

	thumb_func_start sub_080EF7CC
sub_080EF7CC: @ 0x080EF7CC
	push {r4, lr}
	ldr r4, _080EF7EC
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF7EC: .4byte 0x000040E7
	thumb_func_end sub_080EF7CC

	thumb_func_start sub_080EF7F0
sub_080EF7F0: @ 0x080EF7F0
	push {r4, lr}
	ldr r4, _080EF810
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF810: .4byte 0x000040E8
	thumb_func_end sub_080EF7F0

	thumb_func_start sub_080EF814
sub_080EF814: @ 0x080EF814
	push {r4, lr}
	ldr r4, _080EF834
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF834: .4byte 0x000040E9
	thumb_func_end sub_080EF814

	thumb_func_start sub_080EF838
sub_080EF838: @ 0x080EF838
	push {r4, lr}
	ldr r4, _080EF85C
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	ldr r0, _080EF860
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF85C: .4byte 0x000040EA
_080EF860: .4byte 0x02037284
	thumb_func_end sub_080EF838

	thumb_func_start sub_080EF864
sub_080EF864: @ 0x080EF864
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r5, _080EF888
	adds r0, r5, #0
	bl VarGet
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl VarSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EF888: .4byte 0x000040F1
	thumb_func_end sub_080EF864

	thumb_func_start sub_080EF88C
sub_080EF88C: @ 0x080EF88C
	push {r4, r5, r6, r7, lr}
	ldr r0, _080EF918
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080EF910
	ldr r6, _080EF91C
	ldr r0, [r6]
	ldr r7, _080EF920
	adds r0, r0, r7
	bl sub_080EF934
	ldr r5, _080EF924
	strb r0, [r5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080EF910
	ldr r0, _080EF928
	bl TV_BernoulliTrial
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EF910
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	ands r0, r1
	adds r4, r0, #1
	adds r0, r4, #0
	bl sub_080EFBE8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EF910
	ldr r1, [r6]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r7
	strb r4, [r1]
	ldr r2, [r6]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r2, r0
	ldr r1, _080EF92C
	adds r0, r0, r1
	movs r1, #4
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, _080EF930
	adds r2, r2, r0
	movs r0, #1
	strb r0, [r2]
_080EF910:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF918: .4byte 0x00000864
_080EF91C: .4byte 0x03005AEC
_080EF920: .4byte 0x00002B50
_080EF924: .4byte 0x03005E20
_080EF928: .4byte 0x0000028F
_080EF92C: .4byte 0x00002B52
_080EF930: .4byte 0x00002B51
	thumb_func_end sub_080EF88C

	thumb_func_start sub_080EF934
sub_080EF934: @ 0x080EF934
	push {lr}
	adds r2, r0, #0
	movs r1, #0
_080EF93A:
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080EF94C
	adds r0, r1, #0
	b _080EF95C
_080EF94C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xf
	ble _080EF93A
	movs r0, #1
	rsbs r0, r0, #0
_080EF95C:
	pop {r1}
	bx r1
	thumb_func_end sub_080EF934

	thumb_func_start ClearPokemonNews
ClearPokemonNews: @ 0x080EF960
	push {r4, lr}
	movs r4, #0
_080EF964:
	adds r0, r4, #0
	bl ClearPokemonNewsI
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080EF964
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearPokemonNews

	thumb_func_start ClearPokemonNewsI
ClearPokemonNewsI: @ 0x080EF97C
	push {r4, lr}
	lsls r0, r0, #0x18
	ldr r3, _080EF9AC
	ldr r1, [r3]
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r2, _080EF9B0
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r4, _080EF9B4
	adds r1, r1, r4
	strb r2, [r1]
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, _080EF9B8
	adds r1, r1, r0
	strh r2, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF9AC: .4byte 0x03005AEC
_080EF9B0: .4byte 0x00002B50
_080EF9B4: .4byte 0x00002B51
_080EF9B8: .4byte 0x00002B52
	thumb_func_end ClearPokemonNewsI

	thumb_func_start sub_080EF9BC
sub_080EF9BC: @ 0x080EF9BC
	push {r4, r5, r6, r7, lr}
	movs r2, #0
	ldr r6, _080EF9DC
_080EF9C2:
	ldr r0, _080EF9DC
	ldr r0, [r0]
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r3, _080EF9E0
	adds r0, r0, r3
	ldrb r0, [r0]
	adds r5, r2, #1
	cmp r0, #0
	bne _080EFA16
	lsls r0, r5, #0x18
	b _080EFA10
	.align 2, 0
_080EF9DC: .4byte 0x03005AEC
_080EF9E0: .4byte 0x00002B50
_080EF9E4:
	ldr r3, [r6]
	lsls r4, r2, #2
	adds r0, r3, r4
	ldr r7, _080EFA08
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080EFA0C
	adds r0, r3, r7
	adds r1, r0, r1
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r2, #0
	bl ClearPokemonNewsI
	b _080EFA16
	.align 2, 0
_080EFA08: .4byte 0x00002B50
_080EFA0C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
_080EFA10:
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080EF9E4
_080EFA16:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xe
	bls _080EF9C2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080EF9BC

	thumb_func_start FindAnyTVNewsOnTheAir
FindAnyTVNewsOnTheAir: @ 0x080EFA24
	push {r4, lr}
	movs r2, #0
	ldr r0, _080EFA54
	ldr r3, [r0]
_080EFA2C:
	lsls r0, r2, #2
	adds r1, r3, r0
	ldr r4, _080EFA58
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080EFA5C
	adds r4, #1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _080EFA5C
	adds r4, #1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, #2
	bhi _080EFA5C
	adds r0, r2, #0
	b _080EFA68
	.align 2, 0
_080EFA54: .4byte 0x03005AEC
_080EFA58: .4byte 0x00002B50
_080EFA5C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080EFA2C
	movs r0, #0xff
_080EFA68:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FindAnyTVNewsOnTheAir

	thumb_func_start DoPokeNews
DoPokeNews: @ 0x080EFA70
	push {r4, r5, lr}
	bl FindAnyTVNewsOnTheAir
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _080EFA88
	ldr r1, _080EFA84
	movs r0, #0
	b _080EFB1E
	.align 2, 0
_080EFA84: .4byte 0x02037290
_080EFA88:
	ldr r5, _080EFAB8
	ldr r0, [r5]
	lsls r4, r2, #2
	adds r1, r0, r4
	ldr r0, _080EFABC
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _080EFAEC
	ldr r2, _080EFAC0
	adds r1, r1, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080EFAC4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x13
	bgt _080EFACC
	ldr r1, _080EFAC8
	ldr r0, [r5]
	adds r0, r0, r4
	subs r2, #1
	b _080EFAD4
	.align 2, 0
_080EFAB8: .4byte 0x03005AEC
_080EFABC: .4byte 0x00002B52
_080EFAC0: .4byte 0x00002B51
_080EFAC4: .4byte 0x03005A50
_080EFAC8: .4byte 0x08568BC8
_080EFACC:
	ldr r1, _080EFAE4
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r2, _080EFAE8
_080EFAD4:
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	b _080EFB1A
	.align 2, 0
_080EFAE4: .4byte 0x08568BDC
_080EFAE8: .4byte 0x00002B50
_080EFAEC:
	ldrh r1, [r2]
	ldr r0, _080EFB28
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _080EFB2C
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r1, _080EFB30
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r2, _080EFB34
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
_080EFB1A:
	ldr r1, _080EFB38
	movs r0, #1
_080EFB1E:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EFB28: .4byte 0x02021C40
_080EFB2C: .4byte 0x00002B51
_080EFB30: .4byte 0x08568BB4
_080EFB34: .4byte 0x00002B50
_080EFB38: .4byte 0x02037290
	thumb_func_end DoPokeNews

	thumb_func_start GetPriceReduction
GetPriceReduction: @ 0x080EFB3C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _080EFB4C
	b _080EFB8E
_080EFB48:
	movs r0, #1
	b _080EFB90
_080EFB4C:
	movs r2, #0
	ldr r4, _080EFB78
_080EFB50:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r1, r1, r0
	ldr r5, _080EFB7C
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r3
	bne _080EFB84
	ldr r2, _080EFB80
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _080EFB8E
	adds r0, r3, #0
	bl IsPriceDiscounted
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080EFB48
	b _080EFB8E
	.align 2, 0
_080EFB78: .4byte 0x03005AEC
_080EFB7C: .4byte 0x00002B50
_080EFB80: .4byte 0x00002B51
_080EFB84:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080EFB50
_080EFB8E:
	movs r0, #0
_080EFB90:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPriceReduction

	thumb_func_start IsPriceDiscounted
IsPriceDiscounted: @ 0x080EFB98
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080EFBAA
	cmp r0, #3
	beq _080EFBCC
_080EFBA6:
	movs r0, #1
	b _080EFBDA
_080EFBAA:
	ldr r0, _080EFBC4
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080EFBD8
	ldr r0, _080EFBC8
	ldrh r0, [r0]
	cmp r0, #0x19
	beq _080EFBA6
	b _080EFBD8
	.align 2, 0
_080EFBC4: .4byte 0x03005AEC
_080EFBC8: .4byte 0x02037292
_080EFBCC:
	ldr r0, _080EFBE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _080EFBE4
	cmp r1, r0
	beq _080EFBA6
_080EFBD8:
	movs r0, #0
_080EFBDA:
	pop {r1}
	bx r1
	.align 2, 0
_080EFBE0: .4byte 0x03005AEC
_080EFBE4: .4byte 0x0000150D
	thumb_func_end IsPriceDiscounted

	thumb_func_start sub_080EFBE8
sub_080EFBE8: @ 0x080EFBE8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080EFBF6
_080EFBF2:
	movs r0, #1
	b _080EFC16
_080EFBF6:
	movs r1, #0
	ldr r0, _080EFC1C
	ldr r3, [r0]
	ldr r4, _080EFC20
_080EFBFE:
	lsls r0, r1, #2
	adds r0, r3, r0
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r2
	beq _080EFBF2
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _080EFBFE
	movs r0, #0
_080EFC16:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EFC1C: .4byte 0x03005AEC
_080EFC20: .4byte 0x00002B50
	thumb_func_end sub_080EFBE8

	thumb_func_start sub_080EFC24
sub_080EFC24: @ 0x080EFC24
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r6, #0
	ldr r0, _080EFC5C
	mov r8, r0
_080EFC34:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #2
	adds r2, r0, r1
	ldr r3, _080EFC60
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	beq _080EFC9A
	ldr r1, _080EFC64
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r7
	bhs _080EFC68
	adds r0, r6, #0
	bl ClearPokemonNewsI
	b _080EFC9A
	.align 2, 0
_080EFC5C: .4byte 0x03005AEC
_080EFC60: .4byte 0x00002B50
_080EFC64: .4byte 0x00002B52
_080EFC68:
	ldr r5, _080EFCB4
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080EFC8A
	ldr r0, _080EFCB8
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080EFC8A
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r4
	adds r0, r0, r5
	strb r1, [r0]
_080EFC8A:
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r4
	ldr r0, _080EFCBC
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, r0, r7
	strh r0, [r1]
_080EFC9A:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _080EFC34
	bl sub_080EF9BC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EFCB4: .4byte 0x00002B51
_080EFCB8: .4byte 0x00000864
_080EFCBC: .4byte 0x00002B52
	thumb_func_end sub_080EFC24

	thumb_func_start CopyContestRankToStringVar
CopyContestRankToStringVar: @ 0x080EFCC0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r1, #0
	cmp r1, #1
	beq _080EFD00
	cmp r1, #1
	bgt _080EFCDA
	cmp r1, #0
	beq _080EFCE4
	b _080EFD48
_080EFCDA:
	cmp r2, #2
	beq _080EFD1C
	cmp r2, #3
	beq _080EFD38
	b _080EFD48
_080EFCE4:
	ldr r1, _080EFCF8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFCFC
	ldr r1, [r1, #0x14]
	bl StringCopy
	b _080EFD48
	.align 2, 0
_080EFCF8: .4byte 0x08568BF0
_080EFCFC: .4byte 0x085645A0
_080EFD00:
	ldr r1, _080EFD14
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFD18
	ldr r1, [r1, #0x18]
	bl StringCopy
	b _080EFD48
	.align 2, 0
_080EFD14: .4byte 0x08568BF0
_080EFD18: .4byte 0x085645A0
_080EFD1C:
	ldr r1, _080EFD30
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFD34
	ldr r1, [r1, #0x1c]
	bl StringCopy
	b _080EFD48
	.align 2, 0
_080EFD30: .4byte 0x08568BF0
_080EFD34: .4byte 0x085645A0
_080EFD38:
	ldr r1, _080EFD4C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFD50
	ldr r1, [r1, #0x20]
	bl StringCopy
_080EFD48:
	pop {r0}
	bx r0
	.align 2, 0
_080EFD4C: .4byte 0x08568BF0
_080EFD50: .4byte 0x085645A0
	thumb_func_end CopyContestRankToStringVar

	thumb_func_start CopyContestCategoryToStringVar
CopyContestCategoryToStringVar: @ 0x080EFD54
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #4
	bhi _080EFE04
	lsls r0, r0, #2
	ldr r1, _080EFD6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EFD6C: .4byte 0x080EFD70
_080EFD70: @ jump table
	.4byte _080EFD84 @ case 0
	.4byte _080EFDA0 @ case 1
	.4byte _080EFDBC @ case 2
	.4byte _080EFDD8 @ case 3
	.4byte _080EFDF4 @ case 4
_080EFD84:
	ldr r1, _080EFD98
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFD9C
	ldr r1, [r1]
	bl StringCopy
	b _080EFE04
	.align 2, 0
_080EFD98: .4byte 0x08568BF0
_080EFD9C: .4byte 0x085645A0
_080EFDA0:
	ldr r1, _080EFDB4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFDB8
	ldr r1, [r1, #4]
	bl StringCopy
	b _080EFE04
	.align 2, 0
_080EFDB4: .4byte 0x08568BF0
_080EFDB8: .4byte 0x085645A0
_080EFDBC:
	ldr r1, _080EFDD0
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFDD4
	ldr r1, [r1, #8]
	bl StringCopy
	b _080EFE04
	.align 2, 0
_080EFDD0: .4byte 0x08568BF0
_080EFDD4: .4byte 0x085645A0
_080EFDD8:
	ldr r1, _080EFDEC
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFDF0
	ldr r1, [r1, #0xc]
	bl StringCopy
	b _080EFE04
	.align 2, 0
_080EFDEC: .4byte 0x08568BF0
_080EFDF0: .4byte 0x085645A0
_080EFDF4:
	ldr r1, _080EFE08
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EFE0C
	ldr r1, [r1, #0x10]
	bl StringCopy
_080EFE04:
	pop {r0}
	bx r0
	.align 2, 0
_080EFE08: .4byte 0x08568BF0
_080EFE0C: .4byte 0x085645A0
	thumb_func_end CopyContestCategoryToStringVar

	thumb_func_start SetContestCategoryStringVarForInterview
SetContestCategoryStringVarForInterview: @ 0x080EFE10
	push {lr}
	ldr r2, _080EFE38
	ldr r0, _080EFE3C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080EFE40
	adds r0, r0, r1
	ldr r1, [r2]
	adds r1, r1, r0
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	movs r0, #1
	bl CopyContestCategoryToStringVar
	pop {r0}
	bx r0
	.align 2, 0
_080EFE38: .4byte 0x03005AEC
_080EFE3C: .4byte 0x02037280
_080EFE40: .4byte 0x000027CC
	thumb_func_end SetContestCategoryStringVarForInterview

	thumb_func_start TV_PrintIntToStringVar
TV_PrintIntToStringVar: @ 0x080EFE44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	bl CountDigits
	adds r3, r0, #0
	ldr r0, _080EFE70
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r1, r5, #0
	movs r2, #0
	bl ConvertIntToDecimalStringN
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EFE70: .4byte 0x08568BF0
	thumb_func_end TV_PrintIntToStringVar

	thumb_func_start CountDigits
CountDigits: @ 0x080EFE74
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xa
	bl __divsi3
	cmp r0, #0
	beq _080EFF00
	adds r0, r4, #0
	movs r1, #0x64
	bl __divsi3
	cmp r0, #0
	bne _080EFE92
	movs r0, #2
	b _080EFF0A
_080EFE92:
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r4, #0
	bl __divsi3
	cmp r0, #0
	bne _080EFEA4
	movs r0, #3
	b _080EFF0A
_080EFEA4:
	ldr r1, _080EFEB4
	adds r0, r4, #0
	bl __divsi3
	cmp r0, #0
	bne _080EFEB8
	movs r0, #4
	b _080EFF0A
	.align 2, 0
_080EFEB4: .4byte 0x00002710
_080EFEB8:
	ldr r1, _080EFEC8
	adds r0, r4, #0
	bl __divsi3
	cmp r0, #0
	bne _080EFECC
	movs r0, #5
	b _080EFF0A
	.align 2, 0
_080EFEC8: .4byte 0x000186A0
_080EFECC:
	ldr r1, _080EFEDC
	adds r0, r4, #0
	bl __divsi3
	cmp r0, #0
	bne _080EFEE0
	movs r0, #6
	b _080EFF0A
	.align 2, 0
_080EFEDC: .4byte 0x000F4240
_080EFEE0:
	ldr r1, _080EFEF0
	adds r0, r4, #0
	bl __divsi3
	cmp r0, #0
	bne _080EFEF4
	movs r0, #7
	b _080EFF0A
	.align 2, 0
_080EFEF0: .4byte 0x00989680
_080EFEF4:
	ldr r1, _080EFF04
	adds r0, r4, #0
	bl __divsi3
	cmp r0, #0
	beq _080EFF08
_080EFF00:
	movs r0, #1
	b _080EFF0A
	.align 2, 0
_080EFF04: .4byte 0x05F5E100
_080EFF08:
	movs r0, #8
_080EFF0A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CountDigits

	thumb_func_start sub_080EFF10
sub_080EFF10: @ 0x080EFF10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r7, #0
	movs r5, #0
_080EFF22:
	lsls r4, r5, #1
	adds r0, r6, #6
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, #0
	beq _080EFF42
	bl sub_080D6CD4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0xc
	adds r1, r1, r4
	ldrh r1, [r1]
	muls r0, r1, r0
	adds r7, r7, r0
_080EFF42:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080EFF22
	ldrb r0, [r6, #2]
	cmp r0, #1
	bne _080EFF5C
	asrs r1, r7, #1
	mov r0, r8
	bl TV_PrintIntToStringVar
	b _080EFF64
_080EFF5C:
	mov r0, r8
	adds r1, r7, #0
	bl TV_PrintIntToStringVar
_080EFF64:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080EFF10

	thumb_func_start HasMixableShowAlreadyBeenSpawnedWithPlayerID
HasMixableShowAlreadyBeenSpawnedWithPlayerID: @ 0x080EFF70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r5, _080EFFE0
	ldr r0, [r5]
	ldr r4, _080EFFE4
	adds r0, r0, r4
	mov r8, r0
	bl GetPlayerIDAsU32
	adds r7, r0, #0
	movs r6, #5
_080EFF98:
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, sl
	bne _080EFFE8
	movs r3, #0xff
	adds r0, r7, #0
	ands r0, r3
	adds r2, r1, #0
	adds r2, #0x22
	ldrb r2, [r2]
	cmp r0, r2
	bne _080EFFE8
	lsrs r0, r7, #8
	ands r0, r3
	adds r1, #0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080EFFE8
	mov r0, sb
	cmp r0, #1
	bne _080EFFDC
	ldr r0, [r5]
	adds r0, r0, r4
	adds r1, r6, #0
	bl DeleteTVShowInArrayByIdx
	ldr r0, [r5]
	adds r0, r0, r4
	bl sub_080F0428
_080EFFDC:
	movs r0, #1
	b _080EFFF4
	.align 2, 0
_080EFFE0: .4byte 0x03005AEC
_080EFFE4: .4byte 0x000027CC
_080EFFE8:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x17
	bls _080EFF98
	movs r0, #0
_080EFFF4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HasMixableShowAlreadyBeenSpawnedWithPlayerID

	thumb_func_start TV_SortPurchasesByQuantity
TV_SortPurchasesByQuantity: @ 0x080F0004
	push {r4, r5, r6, r7, lr}
	movs r2, #0
_080F0008:
	adds r1, r2, #1
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	adds r7, r1, #0
	cmp r5, #2
	bhi _080F0040
	ldr r6, _080F0050
	lsls r0, r2, #2
	adds r4, r0, r6
_080F001A:
	lsls r0, r5, #2
	adds r3, r0, r6
	ldrh r0, [r4, #2]
	ldrh r1, [r3, #2]
	cmp r0, r1
	bhs _080F0036
	ldrh r1, [r4]
	adds r2, r0, #0
	ldrh r0, [r3]
	strh r0, [r4]
	ldrh r0, [r3, #2]
	strh r0, [r4, #2]
	strh r1, [r3]
	strh r2, [r3, #2]
_080F0036:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080F001A
_080F0040:
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bls _080F0008
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0050: .4byte 0x02039C20
	thumb_func_end TV_SortPurchasesByQuantity

	thumb_func_start FindActiveBroadcastByShowType_SetScriptResult
FindActiveBroadcastByShowType_SetScriptResult: @ 0x080F0054
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r1, #0
	ldr r5, _080F0084
	ldr r4, _080F0088
_080F0060:
	ldr r3, [r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r3, r0
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, r6
	bne _080F00A8
	ldr r6, _080F008C
	adds r0, r2, r6
	ldrb r2, [r0]
	cmp r2, #1
	bne _080F0094
	ldr r0, _080F0090
	strh r2, [r0]
	b _080F00B6
	.align 2, 0
_080F0084: .4byte 0x03005AEC
_080F0088: .4byte 0x000027CC
_080F008C: .4byte 0x000027CD
_080F0090: .4byte 0x02037290
_080F0094:
	adds r0, r3, r4
	bl DeleteTVShowInArrayByIdx
	ldr r0, [r5]
	adds r0, r0, r4
	bl sub_080F0428
	bl sub_080F0578
	b _080F00B6
_080F00A8:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _080F0060
	bl sub_080F0578
_080F00B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end FindActiveBroadcastByShowType_SetScriptResult

	thumb_func_start InterviewBefore
InterviewBefore: @ 0x080F00BC
	push {lr}
	ldr r1, _080F00D8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F00DC
	ldrh r0, [r0]
	subs r0, #1
	cmp r0, #0xa
	bhi _080F014A
	lsls r0, r0, #2
	ldr r1, _080F00E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F00D8: .4byte 0x02037290
_080F00DC: .4byte 0x02037282
_080F00E0: .4byte 0x080F00E4
_080F00E4: @ jump table
	.4byte _080F0110 @ case 0
	.4byte _080F0116 @ case 1
	.4byte _080F011C @ case 2
	.4byte _080F0122 @ case 3
	.4byte _080F0128 @ case 4
	.4byte _080F012E @ case 5
	.4byte _080F0134 @ case 6
	.4byte _080F013A @ case 7
	.4byte _080F0140 @ case 8
	.4byte _080F014A @ case 9
	.4byte _080F0146 @ case 10
_080F0110:
	bl InterviewBefore_FanClubLetter
	b _080F014A
_080F0116:
	bl InterviewBefore_RecentHappenings
	b _080F014A
_080F011C:
	bl InterviewBefore_PkmnFanClubOpinions
	b _080F014A
_080F0122:
	bl InterviewBefore_Dummy
	b _080F014A
_080F0128:
	bl InterviewBefore_NameRater
	b _080F014A
_080F012E:
	bl InterviewBefore_BravoTrainerPkmnProfile
	b _080F014A
_080F0134:
	bl InterviewBefore_BravoTrainerBTProfile
	b _080F014A
_080F013A:
	bl InterviewBefore_ContestLiveUpdates
	b _080F014A
_080F0140:
	bl InterviewBefore_3CheersForPokeblocks
	b _080F014A
_080F0146:
	bl InterviewBefore_FanClubSpecial
_080F014A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InterviewBefore

	thumb_func_start InterviewBefore_FanClubLetter
InterviewBefore_FanClubLetter: @ 0x080F0150
	push {r4, lr}
	movs r0, #1
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080F01AC
	ldrh r0, [r0]
	cmp r0, #0
	bne _080F01A6
	ldr r4, _080F01B0
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _080F01B4
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080F01B8
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	ldr r2, _080F01BC
	ldr r0, _080F01C0
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _080F01C4
	adds r0, r0, r1
	movs r1, #6
	bl InitializeEasyChatWordArray
_080F01A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F01AC: .4byte 0x02037290
_080F01B0: .4byte 0x02021C40
_080F01B4: .4byte 0x02024190
_080F01B8: .4byte 0x082EA31C
_080F01BC: .4byte 0x03005AEC
_080F01C0: .4byte 0x03005E20
_080F01C4: .4byte 0x000027D0
	thumb_func_end InterviewBefore_FanClubLetter

	thumb_func_start InterviewBefore_RecentHappenings
InterviewBefore_RecentHappenings: @ 0x080F01C8
	push {lr}
	movs r0, #2
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080F01F8
	ldrh r0, [r0]
	cmp r0, #0
	bne _080F01F4
	ldr r2, _080F01FC
	ldr r0, _080F0200
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _080F0204
	adds r0, r0, r1
	movs r1, #6
	bl InitializeEasyChatWordArray
_080F01F4:
	pop {r0}
	bx r0
	.align 2, 0
_080F01F8: .4byte 0x02037290
_080F01FC: .4byte 0x03005AEC
_080F0200: .4byte 0x03005E20
_080F0204: .4byte 0x000027D0
	thumb_func_end InterviewBefore_RecentHappenings

	thumb_func_start InterviewBefore_PkmnFanClubOpinions
InterviewBefore_PkmnFanClubOpinions: @ 0x080F0208
	push {r4, r5, r6, lr}
	movs r0, #3
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080F0280
	ldrh r0, [r0]
	cmp r0, #0
	bne _080F027A
	ldr r6, _080F0284
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _080F0288
	adds r0, r0, r4
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080F028C
	adds r1, r1, r0
	adds r0, r6, #0
	bl StringCopy
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r5, r0
	adds r0, r0, r4
	ldr r4, _080F0290
	movs r1, #2
	adds r2, r4, #0
	bl GetMonData
	adds r0, r4, #0
	bl StringGetEnd10
	ldr r2, _080F0294
	ldr r0, _080F0298
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _080F029C
	adds r0, r0, r1
	movs r1, #2
	bl InitializeEasyChatWordArray
_080F027A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F0280: .4byte 0x02037290
_080F0284: .4byte 0x02021C40
_080F0288: .4byte 0x02024190
_080F028C: .4byte 0x082EA31C
_080F0290: .4byte 0x02021C54
_080F0294: .4byte 0x03005AEC
_080F0298: .4byte 0x03005E20
_080F029C: .4byte 0x000027E8
	thumb_func_end InterviewBefore_PkmnFanClubOpinions

	thumb_func_start InterviewBefore_Dummy
InterviewBefore_Dummy: @ 0x080F02A0
	ldr r1, _080F02A8
	movs r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_080F02A8: .4byte 0x02037290
	thumb_func_end InterviewBefore_Dummy

	thumb_func_start InterviewBefore_NameRater
InterviewBefore_NameRater: @ 0x080F02AC
	push {lr}
	movs r0, #5
	bl FindActiveBroadcastByShowType_SetScriptResult
	pop {r0}
	bx r0
	thumb_func_end InterviewBefore_NameRater

	thumb_func_start InterviewBefore_BravoTrainerPkmnProfile
InterviewBefore_BravoTrainerPkmnProfile: @ 0x080F02B8
	push {lr}
	movs r0, #6
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080F02E8
	ldrh r0, [r0]
	cmp r0, #0
	bne _080F02E4
	ldr r2, _080F02EC
	ldr r0, _080F02F0
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _080F02F4
	adds r0, r0, r1
	movs r1, #2
	bl InitializeEasyChatWordArray
_080F02E4:
	pop {r0}
	bx r0
	.align 2, 0
_080F02E8: .4byte 0x02037290
_080F02EC: .4byte 0x03005AEC
_080F02F0: .4byte 0x03005E20
_080F02F4: .4byte 0x000027D0
	thumb_func_end InterviewBefore_BravoTrainerPkmnProfile

	thumb_func_start InterviewBefore_ContestLiveUpdates
InterviewBefore_ContestLiveUpdates: @ 0x080F02F8
	push {lr}
	movs r0, #8
	bl FindActiveBroadcastByShowType_SetScriptResult
	pop {r0}
	bx r0
	thumb_func_end InterviewBefore_ContestLiveUpdates

	thumb_func_start InterviewBefore_3CheersForPokeblocks
InterviewBefore_3CheersForPokeblocks: @ 0x080F0304
	push {lr}
	movs r0, #9
	bl FindActiveBroadcastByShowType_SetScriptResult
	pop {r0}
	bx r0
	thumb_func_end InterviewBefore_3CheersForPokeblocks

	thumb_func_start InterviewBefore_BravoTrainerBTProfile
InterviewBefore_BravoTrainerBTProfile: @ 0x080F0310
	push {lr}
	movs r0, #7
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080F0340
	ldrh r0, [r0]
	cmp r0, #0
	bne _080F033C
	ldr r2, _080F0344
	ldr r0, _080F0348
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _080F034C
	adds r0, r0, r1
	movs r1, #1
	bl InitializeEasyChatWordArray
_080F033C:
	pop {r0}
	bx r0
	.align 2, 0
_080F0340: .4byte 0x02037290
_080F0344: .4byte 0x03005AEC
_080F0348: .4byte 0x03005E20
_080F034C: .4byte 0x000027E4
	thumb_func_end InterviewBefore_BravoTrainerBTProfile

	thumb_func_start InterviewBefore_FanClubSpecial
InterviewBefore_FanClubSpecial: @ 0x080F0350
	push {lr}
	movs r0, #0xb
	bl FindActiveBroadcastByShowType_SetScriptResult
	ldr r0, _080F0380
	ldrh r0, [r0]
	cmp r0, #0
	bne _080F037C
	ldr r2, _080F0384
	ldr r0, _080F0388
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _080F038C
	adds r0, r0, r1
	movs r1, #1
	bl InitializeEasyChatWordArray
_080F037C:
	pop {r0}
	bx r0
	.align 2, 0
_080F0380: .4byte 0x02037290
_080F0384: .4byte 0x03005AEC
_080F0388: .4byte 0x03005E20
_080F038C: .4byte 0x000027E0
	thumb_func_end InterviewBefore_FanClubSpecial

	thumb_func_start sub_080F0390
sub_080F0390: @ 0x080F0390
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	ldr r0, _080F03D0
	adds r4, r4, r0
	ldr r5, _080F03D4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl GetMonData
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080F03D8
	adds r0, r0, r1
	adds r1, r5, #0
	bl StringCompare
	cmp r0, #0
	beq _080F03DC
	movs r0, #1
	b _080F03DE
	.align 2, 0
_080F03D0: .4byte 0x02024190
_080F03D4: .4byte 0x02021C40
_080F03D8: .4byte 0x082EA31C
_080F03DC:
	movs r0, #0
_080F03DE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080F0390

	thumb_func_start sub_080F03E4
sub_080F03E4: @ 0x080F03E4
	push {lr}
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080F0390
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080F03E4

	thumb_func_start DeleteTVShowInArrayByIdx
DeleteTVShowInArrayByIdx: @ 0x080F03FC
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r0
	movs r0, #0
	strb r0, [r2]
	strb r0, [r2, #1]
	movs r1, #0
	adds r2, #2
	movs r3, #0
_080F0416:
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x21
	bls _080F0416
	pop {r0}
	bx r0
	thumb_func_end DeleteTVShowInArrayByIdx

	thumb_func_start sub_080F0428
sub_080F0428: @ 0x080F0428
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r5, #0
_080F042E:
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r1, r0, #2
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F0472
	adds r0, r5, #1
	b _080F046A
_080F0440:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F0468
	adds r1, r1, r4
	adds r0, r3, #0
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	adds r0, r4, #0
	adds r1, r2, #0
	bl DeleteTVShowInArrayByIdx
	b _080F0472
_080F0468:
	adds r0, r2, #1
_080F046A:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _080F0440
_080F0472:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _080F042E
	movs r5, #5
_080F047E:
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r1, r0, #2
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r5, #1
	cmp r0, #0
	bne _080F04C4
	lsls r0, r5, #0x18
	b _080F04BE
_080F0492:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F04BA
	adds r1, r1, r4
	adds r0, r3, #0
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	adds r0, r4, #0
	adds r1, r2, #0
	bl DeleteTVShowInArrayByIdx
	b _080F04C4
_080F04BA:
	adds r0, r2, #1
	lsls r0, r0, #0x18
_080F04BE:
	lsrs r2, r0, #0x18
	cmp r2, #0x17
	bls _080F0492
_080F04C4:
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _080F047E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080F0428

	thumb_func_start TV_GetSomeOtherSpeciesAlreadySeenByPlayer_AndPrintName
TV_GetSomeOtherSpeciesAlreadySeenByPlayer_AndPrintName: @ 0x080F04D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl TV_GetSomeOtherSpeciesAlreadySeenByPlayer
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080F050C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r2, _080F0510
	adds r1, r1, r2
	bl StringCopy
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F050C: .4byte 0x08568BF0
_080F0510: .4byte 0x082EA31C
	thumb_func_end TV_GetSomeOtherSpeciesAlreadySeenByPlayer_AndPrintName

	thumb_func_start TV_GetSomeOtherSpeciesAlreadySeenByPlayer
TV_GetSomeOtherSpeciesAlreadySeenByPlayer: @ 0x080F0514
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080F0534
	bl __umodsi3
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, r4, #0
	b _080F0552
	.align 2, 0
_080F0534: .4byte 0x0000019B
_080F0538:
	cmp r4, #1
	bne _080F0544
	ldr r4, _080F0540
	b _080F054A
	.align 2, 0
_080F0540: .4byte 0x0000019B
_080F0544:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080F054A:
	cmp r4, r6
	bne _080F0552
	adds r4, r5, #0
	b _080F056E
_080F0552:
	adds r0, r4, #0
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080F0538
	cmp r4, r5
	beq _080F0538
_080F056E:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TV_GetSomeOtherSpeciesAlreadySeenByPlayer

	thumb_func_start sub_080F0578
sub_080F0578: @ 0x080F0578
	push {lr}
	ldr r0, _080F05A8
	ldr r0, [r0]
	ldr r1, _080F05AC
	adds r0, r0, r1
	bl FindEmptyTVSlotWithinFirstFiveShowsOfArray
	ldr r1, _080F05B0
	strb r0, [r1]
	ldr r2, _080F05B4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080F05BC
	ldr r1, _080F05B8
	movs r0, #1
	b _080F05C0
	.align 2, 0
_080F05A8: .4byte 0x03005AEC
_080F05AC: .4byte 0x000027CC
_080F05B0: .4byte 0x03005E20
_080F05B4: .4byte 0x02037284
_080F05B8: .4byte 0x02037290
_080F05BC:
	ldr r1, _080F05C8
	movs r0, #0
_080F05C0:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F05C8: .4byte 0x02037290
	thumb_func_end sub_080F0578

	thumb_func_start FindEmptyTVSlotWithinFirstFiveShowsOfArray
FindEmptyTVSlotWithinFirstFiveShowsOfArray: @ 0x080F05CC
	push {lr}
	adds r2, r0, #0
	movs r1, #0
_080F05D2:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F05E6
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	b _080F05F4
_080F05E6:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _080F05D2
	movs r0, #1
	rsbs r0, r0, #0
_080F05F4:
	pop {r1}
	bx r1
	thumb_func_end FindEmptyTVSlotWithinFirstFiveShowsOfArray

	thumb_func_start FindEmptyTVSlotBeyondFirstFiveShowsOfArray
FindEmptyTVSlotBeyondFirstFiveShowsOfArray: @ 0x080F05F8
	push {lr}
	adds r2, r0, #0
	movs r1, #5
_080F05FE:
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F0614
	adds r0, r1, #0
	b _080F0624
_080F0614:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x17
	ble _080F05FE
	movs r0, #1
	rsbs r0, r0, #0
_080F0624:
	pop {r1}
	bx r1
	thumb_func_end FindEmptyTVSlotBeyondFirstFiveShowsOfArray

	thumb_func_start TV_BernoulliTrial
TV_BernoulliTrial: @ 0x080F0628
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bls _080F0640
	movs r0, #1
	b _080F0642
_080F0640:
	movs r0, #0
_080F0642:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TV_BernoulliTrial

	thumb_func_start TV_FanClubLetter_RandomWordToStringVar3
TV_FanClubLetter_RandomWordToStringVar3: @ 0x080F0648
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r5, r4, #4
	ldr r6, _080F0664
	b _080F066E
	.align 2, 0
_080F0664: .4byte 0x0000FFFF
_080F0668:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080F066E:
	cmp r2, #6
	bne _080F0674
	movs r2, #0
_080F0674:
	lsls r1, r2, #1
	adds r0, r5, r1
	ldrh r0, [r0]
	adds r3, r4, #4
	cmp r0, r6
	beq _080F0668
	ldr r0, _080F0690
	adds r1, r3, r1
	ldrh r1, [r1]
	bl CopyEasyChatWord
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F0690: .4byte 0x02021C68
	thumb_func_end TV_FanClubLetter_RandomWordToStringVar3

	thumb_func_start TV_GetNicknameSumMod8
TV_GetNicknameSumMod8: @ 0x080F0694
	push {lr}
	adds r2, r0, #0
	movs r3, #0
	movs r1, #0
	ldrb r0, [r2, #4]
	cmp r0, #0xff
	beq _080F06C0
	adds r2, #4
_080F06A4:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xa
	bhi _080F06C0
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080F06A4
_080F06C0:
	movs r0, #7
	ands r3, r0
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TV_GetNicknameSumMod8

	thumb_func_start TV_GetNicknameSubstring
TV_GetNicknameSubstring: @ 0x080F06CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r4, [sp, #0x1c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r2, #0
	movs r7, #0xff
_080F06F0:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bls _080F06F0
	cmp r3, #0
	bne _080F0752
	ldr r4, [sp, #0x20]
	adds r4, #0xf
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r6, #0
	bne _080F0720
	mov r0, sp
	adds r1, r4, r5
	b _080F07CC
_080F0720:
	cmp r6, #1
	bne _080F072C
	mov r0, sp
	subs r1, r2, r5
	adds r1, r4, r1
	b _080F07CC
_080F072C:
	cmp r6, #2
	bne _080F073E
	mov r1, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #1
	adds r0, r4, r0
	b _080F07FC
_080F073E:
	mov r1, sp
	subs r0, r2, #2
	subs r0, r0, r5
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, #1
	subs r0, r0, r5
	adds r0, r4, r0
	b _080F07FC
_080F0752:
	cmp r3, #1
	bne _080F07A0
	ldr r4, [sp, #0x20]
	adds r4, #4
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r6, #0
	bne _080F076E
	mov r0, sp
	adds r1, r4, r5
	b _080F07CC
_080F076E:
	cmp r6, #1
	bne _080F077A
	mov r0, sp
	subs r1, r2, r5
	adds r1, r4, r1
	b _080F07CC
_080F077A:
	cmp r6, #2
	bne _080F078C
	mov r1, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #1
	adds r0, r4, r0
	b _080F07FC
_080F078C:
	mov r1, sp
	subs r0, r2, #2
	subs r0, r0, r5
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, #1
	subs r0, r0, r5
	adds r0, r4, r0
	b _080F07FC
_080F07A0:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #1
	ldr r7, _080F07BC
	adds r0, r4, r7
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r6, #0
	bne _080F07C0
	mov r0, sp
	adds r1, r5, r4
	b _080F07CA
	.align 2, 0
_080F07BC: .4byte 0x082EA31C
_080F07C0:
	cmp r6, #1
	bne _080F07D2
	mov r0, sp
	subs r1, r2, r5
	adds r1, r1, r4
_080F07CA:
	adds r1, r1, r7
_080F07CC:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080F0800
_080F07D2:
	cmp r6, #2
	bne _080F07E6
	mov r1, sp
	adds r0, r5, r4
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #1
	adds r0, r5, r0
	b _080F07FA
_080F07E6:
	mov r1, sp
	subs r0, r2, #2
	subs r0, r0, r5
	adds r0, r0, r4
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, #1
	subs r0, r0, r5
	adds r0, r0, r4
_080F07FA:
	adds r0, r0, r7
_080F07FC:
	ldrb r0, [r0]
	strb r0, [r1, #1]
_080F0800:
	ldr r0, _080F081C
	mov r2, r8
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	mov r1, sp
	bl StringCopy
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F081C: .4byte 0x08568BF0
	thumb_func_end TV_GetNicknameSubstring

	thumb_func_start TV_IsScriptShowKindAlreadyInQueue
TV_IsScriptShowKindAlreadyInQueue: @ 0x080F0820
	push {r4, lr}
	movs r1, #0
	ldr r0, _080F0844
	ldr r3, [r0]
	ldr r0, _080F0848
	ldrh r2, [r0]
	ldr r4, _080F084C
_080F082E:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _080F0850
	movs r0, #1
	b _080F085C
	.align 2, 0
_080F0844: .4byte 0x03005AEC
_080F0848: .4byte 0x02037280
_080F084C: .4byte 0x000027CC
_080F0850:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _080F082E
	movs r0, #0
_080F085C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TV_IsScriptShowKindAlreadyInQueue

	thumb_func_start TV_PutNameRaterShowOnTheAirIfNicknameChanged
TV_PutNameRaterShowOnTheAirIfNicknameChanged: @ 0x080F0864
	push {r4, lr}
	ldr r0, _080F0890
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080F0894
	adds r0, r0, r1
	ldr r4, _080F0898
	movs r1, #2
	adds r2, r4, #0
	bl GetMonData
	ldr r0, _080F089C
	adds r1, r4, #0
	bl StringCompare
	cmp r0, #0
	beq _080F08A0
	bl PutNameRaterShowOnTheAir
	movs r0, #1
	b _080F08A2
	.align 2, 0
_080F0890: .4byte 0x02037280
_080F0894: .4byte 0x02024190
_080F0898: .4byte 0x02021C40
_080F089C: .4byte 0x02021C68
_080F08A0:
	movs r0, #0
_080F08A2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TV_PutNameRaterShowOnTheAirIfNicknameChanged

	thumb_func_start ChangePokemonNickname
ChangePokemonNickname: @ 0x080F08A8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	ldr r0, _080F0950
	mov sb, r0
	ldrh r0, [r0]
	movs r1, #0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r6, _080F0954
	adds r0, r0, r6
	ldr r2, _080F0958
	movs r1, #2
	bl GetMonData
	mov r1, sb
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r6
	ldr r1, _080F095C
	mov sl, r1
	movs r1, #2
	mov r2, sl
	bl GetMonData
	mov r1, sb
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r6
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r1, sb
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r6
	bl GetMonGender
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, sb
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r6
	movs r1, #0
	movs r2, #0
	bl GetMonData
	str r0, [sp]
	ldr r0, _080F0960
	str r0, [sp, #4]
	movs r0, #3
	mov r1, sl
	adds r2, r5, #0
	adds r3, r4, #0
	bl DoNamingScreen
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F0950: .4byte 0x02037280
_080F0954: .4byte 0x02024190
_080F0958: .4byte 0x02021C68
_080F095C: .4byte 0x02021C54
_080F0960: .4byte 0x080F0965
	thumb_func_end ChangePokemonNickname

	thumb_func_start ChangePokemonNickname_CB
ChangePokemonNickname_CB: @ 0x080F0964
	push {lr}
	ldr r0, _080F0984
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080F0988
	adds r0, r0, r1
	ldr r2, _080F098C
	movs r1, #2
	bl SetMonData
	bl CB2_ReturnToFieldContinueScriptPlayMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_080F0984: .4byte 0x02037280
_080F0988: .4byte 0x02024190
_080F098C: .4byte 0x02021C54
	thumb_func_end ChangePokemonNickname_CB

	thumb_func_start ChangeBoxPokemonNickname
ChangeBoxPokemonNickname: @ 0x080F0990
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	ldr r0, _080F0A00
	ldrb r0, [r0]
	ldr r1, _080F0A04
	ldrb r1, [r1]
	bl GetBoxedMonPtr
	adds r6, r0, #0
	ldr r2, _080F0A08
	movs r1, #2
	bl GetBoxMonData
	ldr r0, _080F0A0C
	mov r8, r0
	adds r0, r6, #0
	movs r1, #2
	mov r2, r8
	bl GetBoxMonData
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #0
	bl GetBoxMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	bl GetBoxMonGender
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	bl GetBoxMonData
	str r0, [sp]
	ldr r0, _080F0A10
	str r0, [sp, #4]
	movs r0, #3
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl DoNamingScreen
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F0A00: .4byte 0x02037296
_080F0A04: .4byte 0x02037298
_080F0A08: .4byte 0x02021C68
_080F0A0C: .4byte 0x02021C54
_080F0A10: .4byte 0x080F0A15
	thumb_func_end ChangeBoxPokemonNickname

	thumb_func_start ChangeBoxPokemonNickname_CB
ChangeBoxPokemonNickname_CB: @ 0x080F0A14
	push {lr}
	ldr r0, _080F0A2C
	ldrb r0, [r0]
	ldr r1, _080F0A30
	ldrb r1, [r1]
	ldr r2, _080F0A34
	bl SetBoxMonNickAt
	bl CB2_ReturnToFieldContinueScriptPlayMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_080F0A2C: .4byte 0x02037296
_080F0A30: .4byte 0x02037298
_080F0A34: .4byte 0x02021C54
	thumb_func_end ChangeBoxPokemonNickname_CB

	thumb_func_start TV_CopyNicknameToStringVar1AndEnsureTerminated
TV_CopyNicknameToStringVar1AndEnsureTerminated: @ 0x080F0A38
	push {r4, lr}
	ldr r0, _080F0A5C
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080F0A60
	adds r0, r0, r1
	ldr r4, _080F0A64
	movs r1, #2
	adds r2, r4, #0
	bl GetMonData
	adds r0, r4, #0
	bl StringGetEnd10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0A5C: .4byte 0x02037280
_080F0A60: .4byte 0x02024190
_080F0A64: .4byte 0x02021C40
	thumb_func_end TV_CopyNicknameToStringVar1AndEnsureTerminated

	thumb_func_start TV_CheckMonOTIDEqualsPlayerID
TV_CheckMonOTIDEqualsPlayerID: @ 0x080F0A68
	push {r4, lr}
	bl GetPlayerIDAsU32
	adds r4, r0, #0
	ldr r0, _080F0A90
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080F0A94
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0
	bl GetMonData
	cmp r4, r0
	bne _080F0A9C
	ldr r1, _080F0A98
	movs r0, #0
	b _080F0AA0
	.align 2, 0
_080F0A90: .4byte 0x02037280
_080F0A94: .4byte 0x02024190
_080F0A98: .4byte 0x02037290
_080F0A9C:
	ldr r1, _080F0AA8
	movs r0, #1
_080F0AA0:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0AA8: .4byte 0x02037290
	thumb_func_end TV_CheckMonOTIDEqualsPlayerID

	thumb_func_start GetTVChannelByShowType
GetTVChannelByShowType: @ 0x080F0AAC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	cmp r1, #0
	beq _080F0AE2
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _080F0AC6
	movs r0, #2
	b _080F0AE8
_080F0AC6:
	adds r0, r1, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _080F0AD6
	movs r0, #3
	b _080F0AE8
_080F0AD6:
	adds r0, r2, #0
	subs r0, #0x29
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bls _080F0AE6
_080F0AE2:
	movs r0, #0
	b _080F0AE8
_080F0AE6:
	movs r0, #4
_080F0AE8:
	pop {r1}
	bx r1
	thumb_func_end GetTVChannelByShowType

	thumb_func_start GetPlayerIDAsU32
GetPlayerIDAsU32: @ 0x080F0AEC
	ldr r0, _080F0B08
	ldr r2, [r0]
	ldrb r0, [r2, #0xd]
	lsls r0, r0, #0x18
	ldrb r1, [r2, #0xc]
	lsls r1, r1, #0x10
	orrs r0, r1
	ldrb r1, [r2, #0xb]
	lsls r1, r1, #8
	orrs r0, r1
	ldrb r1, [r2, #0xa]
	orrs r0, r1
	bx lr
	.align 2, 0
_080F0B08: .4byte 0x03005AF0
	thumb_func_end GetPlayerIDAsU32

	thumb_func_start CheckForBigMovieOrEmergencyNewsOnTV
CheckForBigMovieOrEmergencyNewsOnTV: @ 0x080F0B0C
	push {lr}
	ldr r0, _080F0B30
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _080F0B2C
	ldr r0, _080F0B34
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080F0B38
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080F0B40
_080F0B2C:
	movs r0, #0
	b _080F0B6A
	.align 2, 0
_080F0B30: .4byte 0x03005AEC
_080F0B34: .4byte 0x03005AF0
_080F0B38:
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #2
	bne _080F0B2C
_080F0B40:
	ldr r0, _080F0B64
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080F0B5E
	movs r0, #0x89
	lsls r0, r0, #4
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080F0B68
_080F0B5E:
	movs r0, #1
	b _080F0B6A
	.align 2, 0
_080F0B64: .4byte 0x000008BD
_080F0B68:
	movs r0, #2
_080F0B6A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckForBigMovieOrEmergencyNewsOnTV

	thumb_func_start GetMomOrDadStringForTVMessage
GetMomOrDadStringForTVMessage: @ 0x080F0B70
	push {r4, lr}
	ldr r0, _080F0BA4
	ldr r1, [r0]
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _080F0BD0
	ldr r0, _080F0BA8
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080F0BB8
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080F0BD0
	ldr r0, _080F0BAC
	ldr r1, _080F0BB0
	bl StringCopy
	ldr r0, _080F0BB4
	movs r1, #1
	bl VarSet
	b _080F0BD0
	.align 2, 0
_080F0BA4: .4byte 0x03005AEC
_080F0BA8: .4byte 0x03005AF0
_080F0BAC: .4byte 0x02021C40
_080F0BB0: .4byte 0x085CA9E1
_080F0BB4: .4byte 0x00004003
_080F0BB8:
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #2
	bne _080F0BD0
	ldr r0, _080F0C18
	ldr r1, _080F0C1C
	bl StringCopy
	ldr r0, _080F0C20
	movs r1, #1
	bl VarSet
_080F0BD0:
	ldr r4, _080F0C20
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _080F0C0E
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	beq _080F0C24
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080F0C38
	adds r0, r4, #0
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080F0C24
_080F0C0E:
	ldr r0, _080F0C18
	ldr r1, _080F0C1C
	bl StringCopy
	b _080F0C74
	.align 2, 0
_080F0C18: .4byte 0x02021C40
_080F0C1C: .4byte 0x085CA9E1
_080F0C20: .4byte 0x00004003
_080F0C24:
	ldr r0, _080F0C30
	ldr r1, _080F0C34
	bl StringCopy
	b _080F0C74
	.align 2, 0
_080F0C30: .4byte 0x02021C40
_080F0C34: .4byte 0x085CA9DE
_080F0C38:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080F0C64
	ldr r0, _080F0C5C
	ldr r1, _080F0C60
	bl StringCopy
	adds r0, r4, #0
	movs r1, #1
	bl VarSet
	b _080F0C74
	.align 2, 0
_080F0C5C: .4byte 0x02021C40
_080F0C60: .4byte 0x085CA9E1
_080F0C64:
	ldr r0, _080F0C7C
	ldr r1, _080F0C80
	bl StringCopy
	adds r0, r4, #0
	movs r1, #2
	bl VarSet
_080F0C74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0C7C: .4byte 0x02021C40
_080F0C80: .4byte 0x085CA9DE
	thumb_func_end GetMomOrDadStringForTVMessage

	thumb_func_start sub_080F0C84
sub_080F0C84: @ 0x080F0C84
	push {lr}
	ldr r0, _080F0CA8
	movs r1, #0
	bl VarSet
	ldr r0, _080F0CAC
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	movs r0, #5
	bl RemoveEventObjectByLocalIdAndMap
	ldr r0, _080F0CB0
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080F0CA8: .4byte 0x000040BC
_080F0CAC: .4byte 0x03005AEC
_080F0CB0: .4byte 0x00000396
	thumb_func_end sub_080F0C84

	thumb_func_start ReceiveTvShowsData
ReceiveTvShowsData: @ 0x080F0CB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r0, #0xe1
	lsls r0, r0, #4
	bl Alloc
	mov sb, r0
	cmp r0, #0
	bne _080F0CD8
	b _080F0E1C
_080F0CD8:
	movs r4, #0
_080F0CDA:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #5
	adds r0, r0, r4
	lsls r0, r0, #2
	add r0, sb
	adds r1, r4, #0
	muls r1, r6, r1
	adds r1, r7, r1
	movs r2, #0xe1
	lsls r2, r2, #2
	bl memcpy
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080F0CDA
	mov r5, sb
	movs r4, #0
	ldr r0, _080F0D08
	mov sl, r0
	b _080F0D48
	.align 2, 0
_080F0D08: .4byte 0x020226A0
_080F0D0C:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	mov r2, sl
	adds r1, r0, r2
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080F0D42
	ldrh r0, [r1, #0x1a]
	cmp r0, #1
	bne _080F0D36
	adds r0, r4, #0
	muls r0, r6, r0
	adds r0, r7, r0
	movs r1, #2
	bl sub_080F1A40
	b _080F0D42
_080F0D36:
	adds r0, r4, #0
	muls r0, r6, r0
	adds r0, r7, r0
	ldrh r1, [r1, #0x1a]
	bl sub_080F1A40
_080F0D42:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080F0D48:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _080F0D0C
	mov r3, r8
	cmp r3, #1
	beq _080F0D9C
	cmp r3, #1
	bgt _080F0D64
	cmp r3, #0
	beq _080F0D70
	b _080F0DF6
_080F0D64:
	mov r4, r8
	cmp r4, #2
	beq _080F0DB4
	cmp r4, #3
	beq _080F0DDC
	b _080F0DF6
_080F0D70:
	ldr r0, _080F0D90
	ldr r0, [r0]
	ldr r1, _080F0D94
	adds r0, r0, r1
	movs r2, #0xe1
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r3, #0xe1
	lsls r3, r3, #3
	adds r2, r5, r3
	ldr r4, _080F0D98
	adds r3, r5, r4
	bl sub_080F0E34
	b _080F0DF6
	.align 2, 0
_080F0D90: .4byte 0x03005AEC
_080F0D94: .4byte 0x000027CC
_080F0D98: .4byte 0x00000A8C
_080F0D9C:
	ldr r0, _080F0DAC
	ldr r1, [r0]
	ldr r0, _080F0DB0
	adds r1, r1, r0
	movs r3, #0xe1
	lsls r3, r3, #3
	adds r2, r5, r3
	b _080F0DC2
	.align 2, 0
_080F0DAC: .4byte 0x03005AEC
_080F0DB0: .4byte 0x000027CC
_080F0DB4:
	movs r0, #0xe1
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _080F0DD0
	ldr r2, [r0]
	ldr r3, _080F0DD4
	adds r2, r2, r3
_080F0DC2:
	ldr r4, _080F0DD8
	adds r3, r5, r4
	adds r0, r5, #0
	bl sub_080F0E34
	b _080F0DF6
	.align 2, 0
_080F0DD0: .4byte 0x03005AEC
_080F0DD4: .4byte 0x000027CC
_080F0DD8: .4byte 0x00000A8C
_080F0DDC:
	movs r0, #0xe1
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r3, #0xe1
	lsls r3, r3, #3
	adds r2, r5, r3
	ldr r0, _080F0E2C
	ldr r3, [r0]
	ldr r4, _080F0E30
	adds r3, r3, r4
	adds r0, r5, #0
	bl sub_080F0E34
_080F0DF6:
	ldr r5, _080F0E2C
	ldr r0, [r5]
	ldr r4, _080F0E30
	adds r0, r0, r4
	bl sub_080F0428
	bl sub_080F16E0
	ldr r0, [r5]
	adds r0, r0, r4
	bl sub_080F0428
	bl sub_080F11E4
	bl sub_080F1640
	mov r0, sb
	bl Free
_080F0E1C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0E2C: .4byte 0x03005AEC
_080F0E30: .4byte 0x000027CC
	thumb_func_end ReceiveTvShowsData

	thumb_func_start sub_080F0E34
sub_080F0E34: @ 0x080F0E34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	add r0, sp, #0x10
	str r0, [sp]
	add r0, sp, #0x14
	str r0, [sp, #4]
	add r0, sp, #0x18
	str r0, [sp, #8]
	add r0, sp, #0x1c
	str r0, [sp, #0xc]
	bl GetLinkPlayerCount
	ldr r1, _080F0EB0
	strb r0, [r1]
_080F0E60:
	movs r6, #0
	ldr r0, _080F0EB0
	ldrb r1, [r0]
	cmp r6, r1
	bhs _080F0E60
	mov sl, r0
_080F0E6C:
	cmp r6, #0
	bne _080F0E74
	ldr r2, _080F0EB4
	strb r6, [r2]
_080F0E74:
	lsls r4, r6, #2
	mov r3, sp
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_080F11AC
	ldr r1, _080F0EB8
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	adds r7, r4, #0
	cmp r0, r1
	bne _080F0EBC
	ldr r1, _080F0EB4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, sl
	ldrb r2, [r2]
	cmp r0, r2
	beq _080F0F68
	adds r6, #1
	mov sb, r6
	b _080F0F4C
	.align 2, 0
_080F0EB0: .4byte 0x03001174
_080F0EB4: .4byte 0x02039CF8
_080F0EB8: .4byte 0x03001176
_080F0EBC:
	movs r5, #0
	mov r3, sl
	ldrb r0, [r3]
	subs r0, #1
	adds r2, r6, #1
	mov sb, r2
	cmp r5, r0
	bge _080F0F32
	ldr r3, _080F0F5C
	mov r8, r3
_080F0ED0:
	adds r0, r6, r5
	adds r4, r0, #1
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r4, #0
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	ldr r0, [r0]
	bl FindEmptyTVSlotBeyondFirstFiveShowsOfArray
	ldr r1, _080F0F60
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080F0F22
	mov r2, r8
	ldrb r1, [r2]
	adds r0, r4, #0
	bl __modsi3
	adds r2, r0, #0
	lsls r0, r2, #2
	add r0, sp
	ldr r0, [r0]
	mov r3, sp
	adds r1, r3, r7
	ldr r1, [r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_080F0F78
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080F0F32
_080F0F22:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r1, r8
	ldrb r0, [r1]
	subs r0, #1
	cmp r5, r0
	blt _080F0ED0
_080F0F32:
	mov r2, sl
	ldrb r0, [r2]
	subs r0, #1
	cmp r5, r0
	bne _080F0F4C
	mov r3, sp
	adds r0, r3, r7
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, _080F0F64
	ldrb r1, [r1]
	bl DeleteTVShowInArrayByIdx
_080F0F4C:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	mov r2, sl
	ldrb r2, [r2]
	cmp r6, r2
	blo _080F0E6C
	b _080F0E60
	.align 2, 0
_080F0F5C: .4byte 0x03001174
_080F0F60: .4byte 0x03005E20
_080F0F64: .4byte 0x03001176
_080F0F68:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080F0E34

	thumb_func_start sub_080F0F78
sub_080F0F78: @ 0x080F0F78
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, [r0]
	ldr r6, [r1]
	movs r5, #0
	ldr r2, _080F0FB4
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0]
	str r2, [sp]
	bl GetTVChannelByShowType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	ldr r2, [sp]
	cmp r0, #3
	beq _080F0FE8
	cmp r0, #3
	bgt _080F0FB8
	cmp r0, #2
	beq _080F0FBE
	b _080F1036
	.align 2, 0
_080F0FB4: .4byte 0x03001176
_080F0FB8:
	cmp r1, #4
	beq _080F1010
	b _080F1036
_080F0FBE:
	ldr r0, _080F0FE4
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r6, r1
	adds r2, r7, #0
	bl sub_080F105C
	b _080F1032
	.align 2, 0
_080F0FE4: .4byte 0x03005E20
_080F0FE8:
	ldr r0, _080F100C
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r6, r1
	adds r2, r7, #0
	bl sub_080F10C4
	b _080F1032
	.align 2, 0
_080F100C: .4byte 0x03005E20
_080F1010:
	ldr r0, _080F1040
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r6, r1
	adds r2, r7, #0
	bl sub_080F1144
_080F1032:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080F1036:
	cmp r5, #1
	beq _080F1044
	movs r0, #0
	b _080F1050
	.align 2, 0
_080F1040: .4byte 0x03005E20
_080F1044:
	ldr r0, _080F1058
	ldrb r1, [r0]
	adds r0, r6, #0
	bl DeleteTVShowInArrayByIdx
	movs r0, #1
_080F1050:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F1058: .4byte 0x03001176
	thumb_func_end sub_080F0F78

	thumb_func_start sub_080F105C
sub_080F105C: @ 0x080F105C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl GetLinkPlayerTrainerId
	adds r5, r0, #0
	movs r2, #0xff
	ands r0, r2
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F108C
	lsrs r0, r5, #8
	ands r0, r2
	adds r1, r4, #0
	adds r1, #0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F108C
	movs r0, #0
	b _080F10BC
_080F108C:
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x22
	strb r0, [r2]
	adds r3, r4, #0
	adds r3, #0x21
	ldrb r0, [r3]
	adds r2, #1
	strb r0, [r2]
	strb r5, [r1]
	lsrs r0, r5, #8
	strb r0, [r3]
	adds r1, r6, #0
	adds r0, r4, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
	strb r0, [r6, #1]
_080F10BC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080F105C

	thumb_func_start sub_080F10C4
sub_080F10C4: @ 0x080F10C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl GetLinkPlayerTrainerId
	adds r2, r0, #0
	movs r3, #0xff
	ands r0, r3
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F10F0
	lsrs r0, r2, #8
	ands r0, r3
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F1110
_080F10F0:
	movs r3, #0xff
	adds r0, r2, #0
	ands r0, r3
	adds r1, r4, #0
	adds r1, #0x22
	lsrs r5, r2, #8
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F1114
	adds r0, r5, #0
	ands r0, r3
	adds r1, r4, #0
	adds r1, #0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F1114
_080F1110:
	movs r0, #0
	b _080F113C
_080F1114:
	ldrb r1, [r4, #0x1e]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	ldrb r0, [r4, #0x1f]
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	strb r2, [r4, #0x1e]
	strb r5, [r4, #0x1f]
	adds r1, r6, #0
	adds r0, r4, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
	strb r0, [r6, #1]
_080F113C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080F10C4

	thumb_func_start sub_080F1144
sub_080F1144: @ 0x080F1144
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl GetLinkPlayerTrainerId
	adds r5, r0, #0
	movs r2, #0xff
	ands r0, r2
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F1174
	lsrs r0, r5, #8
	ands r0, r2
	adds r1, r4, #0
	adds r1, #0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F1174
	movs r0, #0
	b _080F11A6
_080F1174:
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x22
	strb r0, [r2]
	adds r3, r4, #0
	adds r3, #0x21
	ldrb r0, [r3]
	adds r2, #1
	strb r0, [r2]
	strb r5, [r1]
	lsrs r0, r5, #8
	strb r0, [r3]
	adds r1, r6, #0
	adds r0, r4, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
	strb r0, [r6, #1]
	strh r0, [r6, #0x16]
_080F11A6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080F1144

	thumb_func_start sub_080F11AC
sub_080F11AC: @ 0x080F11AC
	push {lr}
	adds r3, r0, #0
	movs r2, #0
_080F11B2:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r3
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _080F11D2
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bhi _080F11D2
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	b _080F11E0
_080F11D2:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x17
	bls _080F11B2
	movs r0, #1
	rsbs r0, r0, #0
_080F11E0:
	pop {r1}
	bx r1
	thumb_func_end sub_080F11AC

	thumb_func_start sub_080F11E4
sub_080F11E4: @ 0x080F11E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
_080F11F2:
	ldr r3, _080F1218
	ldr r1, [r3]
	mov r4, sb
	lsls r2, r4, #3
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080F121C
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r7, r2, #0
	cmp r0, #0x29
	bls _080F120E
	b _080F15B4
_080F120E:
	lsls r0, r0, #2
	ldr r1, _080F1220
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1218: .4byte 0x03005AEC
_080F121C: .4byte 0x000027CC
_080F1220: .4byte 0x080F1224
_080F1224: @ jump table
	.4byte _080F15BE @ case 0
	.4byte _080F1324 @ case 1
	.4byte _080F15BE @ case 2
	.4byte _080F133C @ case 3
	.4byte _080F1354 @ case 4
	.4byte _080F136C @ case 5
	.4byte _080F1398 @ case 6
	.4byte _080F13B0 @ case 7
	.4byte _080F12CC @ case 8
	.4byte _080F15BE @ case 9
	.4byte _080F12F8 @ case 10
	.4byte _080F15BE @ case 11
	.4byte _080F15BE @ case 12
	.4byte _080F15B4 @ case 13
	.4byte _080F15B4 @ case 14
	.4byte _080F15B4 @ case 15
	.4byte _080F15B4 @ case 16
	.4byte _080F15B4 @ case 17
	.4byte _080F15B4 @ case 18
	.4byte _080F15B4 @ case 19
	.4byte _080F15B4 @ case 20
	.4byte _080F13DC @ case 21
	.4byte _080F15BE @ case 22
	.4byte _080F13F4 @ case 23
	.4byte _080F1420 @ case 24
	.4byte _080F1438 @ case 25
	.4byte _080F15BE @ case 26
	.4byte _080F15BE @ case 27
	.4byte _080F15BE @ case 28
	.4byte _080F15BE @ case 29
	.4byte _080F1450 @ case 30
	.4byte _080F147C @ case 31
	.4byte _080F15BE @ case 32
	.4byte _080F149C @ case 33
	.4byte _080F15BE @ case 34
	.4byte _080F15BE @ case 35
	.4byte _080F14D0 @ case 36
	.4byte _080F15BE @ case 37
	.4byte _080F15BE @ case 38
	.4byte _080F15BE @ case 39
	.4byte _080F15B4 @ case 40
	.4byte _080F15BE @ case 41
_080F12CC:
	ldr r0, [r3]
	mov r1, sb
	adds r4, r7, r1
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r6, _080F12F4
	adds r0, r0, r6
	ldrh r0, [r0, #0x12]
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	adds r1, r5, #0
	str r3, [sp, #4]
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #2]
	b _080F14C2
	.align 2, 0
_080F12F4: .4byte 0x000027CC
_080F12F8:
	ldr r0, [r3]
	mov r2, sb
	adds r4, r7, r2
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r6, _080F1320
	adds r0, r0, r6
	ldrh r0, [r0, #0x16]
	lsls r5, r2, #0x18
	lsrs r5, r5, #0x18
	adds r1, r5, #0
	str r3, [sp, #4]
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #2]
	b _080F14C2
	.align 2, 0
_080F1320: .4byte 0x000027CC
_080F1324:
	ldr r0, [r3]
	mov r4, sb
	adds r1, r7, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _080F1338
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	b _080F148C
	.align 2, 0
_080F1338: .4byte 0x000027CC
_080F133C:
	ldr r0, [r3]
	mov r2, sb
	adds r1, r7, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r4, _080F1350
	adds r1, r1, r4
	ldrh r0, [r1, #2]
	lsls r1, r2, #0x18
	b _080F148E
	.align 2, 0
_080F1350: .4byte 0x000027CC
_080F1354:
	ldr r0, [r3]
	mov r2, sb
	adds r1, r7, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r4, _080F1368
	adds r1, r1, r4
	ldrh r0, [r1, #6]
	lsls r1, r2, #0x18
	b _080F148E
	.align 2, 0
_080F1368: .4byte 0x000027CC
_080F136C:
	ldr r0, [r3]
	mov r1, sb
	adds r4, r7, r1
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r6, _080F1394
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	adds r1, r5, #0
	str r3, [sp, #4]
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #0x1c]
	b _080F14C2
	.align 2, 0
_080F1394: .4byte 0x000027CC
_080F1398:
	ldr r0, [r3]
	mov r2, sb
	adds r1, r7, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r4, _080F13AC
	adds r1, r1, r4
	ldrh r0, [r1, #2]
	lsls r1, r2, #0x18
	b _080F148E
	.align 2, 0
_080F13AC: .4byte 0x000027CC
_080F13B0:
	ldr r0, [r3]
	mov r1, sb
	adds r4, r7, r1
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r6, _080F13D8
	adds r0, r0, r6
	ldrh r0, [r0, #0xa]
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	adds r1, r5, #0
	str r3, [sp, #4]
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #0x14]
	b _080F14C2
	.align 2, 0
_080F13D8: .4byte 0x000027CC
_080F13DC:
	ldr r0, [r3]
	mov r2, sb
	adds r1, r7, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r4, _080F13F0
	adds r1, r1, r4
	ldrh r0, [r1, #0x10]
	lsls r1, r2, #0x18
	b _080F148E
	.align 2, 0
_080F13F0: .4byte 0x000027CC
_080F13F4:
	ldr r0, [r3]
	mov r1, sb
	adds r4, r7, r1
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r6, _080F141C
	adds r0, r0, r6
	ldrh r0, [r0, #0xc]
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	adds r1, r5, #0
	str r3, [sp, #4]
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #0xe]
	b _080F14C2
	.align 2, 0
_080F141C: .4byte 0x000027CC
_080F1420:
	ldr r0, [r3]
	mov r2, sb
	adds r1, r7, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r4, _080F1434
	adds r1, r1, r4
	ldrh r0, [r1, #4]
	lsls r1, r2, #0x18
	b _080F148E
	.align 2, 0
_080F1434: .4byte 0x000027CC
_080F1438:
	ldr r0, [r3]
	mov r1, sb
	adds r4, r7, r1
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r6, _080F144C
	adds r0, r0, r6
	ldrh r0, [r0, #8]
	b _080F14AC
	.align 2, 0
_080F144C: .4byte 0x000027CC
_080F1450:
	ldr r0, [r3]
	mov r2, sb
	adds r4, r7, r2
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r6, _080F1478
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	lsls r5, r2, #0x18
	lsrs r5, r5, #0x18
	adds r1, r5, #0
	str r3, [sp, #4]
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #0xa]
	b _080F14C2
	.align 2, 0
_080F1478: .4byte 0x000027CC
_080F147C:
	ldr r0, [r3]
	mov r4, sb
	adds r1, r7, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _080F1498
	adds r1, r1, r0
	ldrh r0, [r1, #8]
_080F148C:
	lsls r1, r4, #0x18
_080F148E:
	lsrs r1, r1, #0x18
	bl sub_080F1600
	b _080F15BE
	.align 2, 0
_080F1498: .4byte 0x000027CC
_080F149C:
	ldr r0, [r3]
	mov r1, sb
	adds r4, r7, r1
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r6, _080F14CC
	adds r0, r0, r6
	ldrh r0, [r0, #6]
_080F14AC:
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	adds r1, r5, #0
	str r3, [sp, #4]
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #4]
_080F14C2:
	adds r1, r5, #0
	bl sub_080F1600
	b _080F15BE
	.align 2, 0
_080F14CC: .4byte 0x000027CC
_080F14D0:
	ldr r0, [r3]
	mov r2, sb
	adds r4, r7, r2
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r5, _080F151C
	adds r0, r0, r5
	ldrh r0, [r0, #4]
	lsls r2, r2, #0x18
	mov r8, r2
	lsrs r6, r2, #0x18
	adds r1, r6, #0
	str r3, [sp, #4]
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r0, r4, r0
	adds r0, r0, r5
	ldrh r0, [r0, #6]
	adds r1, r6, #0
	bl sub_080F1600
	ldr r3, [sp, #4]
	ldr r0, [r3]
	adds r4, r4, r0
	adds r4, r4, r5
	ldrb r0, [r4, #0xd]
	subs r0, #1
	mov r6, r8
	cmp r0, #0xc
	bhi _080F15BE
	lsls r0, r0, #2
	ldr r1, _080F1520
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F151C: .4byte 0x000027CC
_080F1520: .4byte 0x080F1524
_080F1524: @ jump table
	.4byte _080F1558 @ case 0
	.4byte _080F157C @ case 1
	.4byte _080F15BE @ case 2
	.4byte _080F15BE @ case 3
	.4byte _080F1558 @ case 4
	.4byte _080F1558 @ case 5
	.4byte _080F1558 @ case 6
	.4byte _080F1558 @ case 7
	.4byte _080F1558 @ case 8
	.4byte _080F1558 @ case 9
	.4byte _080F1558 @ case 10
	.4byte _080F1558 @ case 11
	.4byte _080F1558 @ case 12
_080F1558:
	ldr r0, _080F1574
	ldr r1, [r0]
	mov r4, sb
	adds r0, r7, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080F1578
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	lsrs r1, r6, #0x18
	bl sub_080F1600
	b _080F15BE
	.align 2, 0
_080F1574: .4byte 0x03005AEC
_080F1578: .4byte 0x000027CC
_080F157C:
	ldr r2, _080F15AC
	ldr r0, [r2]
	mov r1, sb
	adds r4, r7, r1
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r5, _080F15B0
	adds r0, r0, r5
	ldrh r0, [r0, #8]
	lsrs r6, r6, #0x18
	adds r1, r6, #0
	str r2, [sp]
	bl sub_080F1600
	ldr r2, [sp]
	ldr r0, [r2]
	adds r4, r4, r0
	adds r4, r4, r5
	ldrh r0, [r4, #0xa]
	adds r1, r6, #0
	bl sub_080F1600
	b _080F15BE
	.align 2, 0
_080F15AC: .4byte 0x03005AEC
_080F15B0: .4byte 0x000027CC
_080F15B4:
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl SetTvShowInactive
_080F15BE:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0x17
	bhi _080F15CE
	b _080F11F2
_080F15CE:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080F11E4

	thumb_func_start SetTvShowInactive
SetTvShowInactive: @ 0x080F15DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080F15F8
	ldr r2, [r1]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r2, r1
	ldr r0, _080F15FC
	adds r2, r2, r0
	movs r0, #0
	strb r0, [r2]
	bx lr
	.align 2, 0
_080F15F8: .4byte 0x03005AEC
_080F15FC: .4byte 0x000027CD
	thumb_func_end SetTvShowInactive

	thumb_func_start sub_080F1600
sub_080F1600: @ 0x080F1600
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	bne _080F1632
	ldr r0, _080F1638
	ldr r1, [r0]
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080F163C
	adds r1, r1, r0
	strb r2, [r1]
_080F1632:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1638: .4byte 0x03005AEC
_080F163C: .4byte 0x000027CD
	thumb_func_end sub_080F1600

	thumb_func_start sub_080F1640
sub_080F1640: @ 0x080F1640
	push {r4, r5, r6, lr}
	ldr r0, _080F1684
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080F167E
	movs r2, #0
	ldr r4, _080F1688
	movs r3, #0
	ldr r5, _080F168C
_080F1658:
	ldr r0, [r5]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r0, r1
	ldr r6, _080F1690
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #7
	beq _080F1670
	cmp r0, #0x29
	bne _080F1674
_080F1670:
	adds r0, r1, r4
	strb r3, [r0]
_080F1674:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x17
	bls _080F1658
_080F167E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F1684: .4byte 0x00000864
_080F1688: .4byte 0x000027CD
_080F168C: .4byte 0x03005AEC
_080F1690: .4byte 0x000027CC
	thumb_func_end sub_080F1640

	thumb_func_start sub_080F1694
sub_080F1694: @ 0x080F1694
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _080F16D4
_080F169A:
	ldr r1, [r6]
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r4, r0, #2
	adds r1, r1, r4
	ldr r0, _080F16D8
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetTVChannelByShowType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _080F16C2
	ldr r0, [r6]
	adds r0, r0, r4
	ldr r1, _080F16DC
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
_080F16C2:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080F169A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F16D4: .4byte 0x03005AEC
_080F16D8: .4byte 0x000027CC
_080F16DC: .4byte 0x000027CD
	thumb_func_end sub_080F1694

	thumb_func_start sub_080F16E0
sub_080F16E0: @ 0x080F16E0
	push {r4, r5, lr}
	movs r3, #0
	movs r2, #5
	ldr r0, _080F1750
	ldr r4, [r0]
	ldr r5, _080F1754
_080F16EC:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F170A
	lsls r0, r3, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r3, r0, #0x18
_080F170A:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x17
	ble _080F16EC
	movs r2, #0
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	movs r1, #5
	subs r0, r1, r0
	cmp r2, r0
	bge _080F174A
	adds r5, r0, #0
_080F1726:
	ldr r0, _080F1750
	ldr r0, [r0]
	ldr r1, _080F1754
	adds r0, r0, r1
	lsls r1, r2, #0x18
	asrs r4, r1, #0x18
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	bl DeleteTVShowInArrayByIdx
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r2, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, r5
	blt _080F1726
_080F174A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1750: .4byte 0x03005AEC
_080F1754: .4byte 0x000027CC
	thumb_func_end sub_080F16E0

	thumb_func_start ReceivePokeNewsData
ReceivePokeNewsData: @ 0x080F1758
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r0, #0x80
	lsls r0, r0, #1
	bl Alloc
	adds r5, r0, #0
	cmp r5, #0
	beq _080F1828
	movs r4, #0
_080F1776:
	lsls r0, r4, #6
	adds r0, r0, r5
	adds r1, r4, #0
	muls r1, r7, r1
	add r1, r8
	movs r2, #0x40
	bl memcpy
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080F1776
	cmp r6, #1
	beq _080F17CC
	cmp r6, #1
	bgt _080F179E
	cmp r6, #0
	beq _080F17A8
	b _080F181A
_080F179E:
	cmp r6, #2
	beq _080F17E4
	cmp r6, #3
	beq _080F1804
	b _080F181A
_080F17A8:
	ldr r0, _080F17C4
	ldr r0, [r0]
	ldr r1, _080F17C8
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x40
	adds r2, r5, #0
	adds r2, #0x80
	adds r3, r5, #0
	adds r3, #0xc0
	bl sub_080F183C
	b _080F181A
	.align 2, 0
_080F17C4: .4byte 0x03005AEC
_080F17C8: .4byte 0x00002B50
_080F17CC:
	ldr r0, _080F17DC
	ldr r1, [r0]
	ldr r0, _080F17E0
	adds r1, r1, r0
	adds r2, r5, #0
	adds r2, #0x80
	b _080F17F0
	.align 2, 0
_080F17DC: .4byte 0x03005AEC
_080F17E0: .4byte 0x00002B50
_080F17E4:
	adds r1, r5, #0
	adds r1, #0x40
	ldr r0, _080F17FC
	ldr r2, [r0]
	ldr r0, _080F1800
	adds r2, r2, r0
_080F17F0:
	adds r3, r5, #0
	adds r3, #0xc0
	adds r0, r5, #0
	bl sub_080F183C
	b _080F181A
	.align 2, 0
_080F17FC: .4byte 0x03005AEC
_080F1800: .4byte 0x00002B50
_080F1804:
	adds r1, r5, #0
	adds r1, #0x40
	adds r2, r5, #0
	adds r2, #0x80
	ldr r0, _080F1834
	ldr r3, [r0]
	ldr r0, _080F1838
	adds r3, r3, r0
	adds r0, r5, #0
	bl sub_080F183C
_080F181A:
	bl sub_080F19C8
	bl TVShowGetFlagCount
	adds r0, r5, #0
	bl Free
_080F1828:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1834: .4byte 0x03005AEC
_080F1838: .4byte 0x00002B50
	thumb_func_end ReceivePokeNewsData

	thumb_func_start sub_080F183C
sub_080F183C: @ 0x080F183C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	add r0, sp, #0x10
	str r0, [sp]
	add r0, sp, #0x14
	str r0, [sp, #4]
	add r0, sp, #0x18
	str r0, [sp, #8]
	add r0, sp, #0x1c
	str r0, [sp, #0xc]
	bl GetLinkPlayerCount
	ldr r1, _080F1878
	strb r0, [r1]
	movs r0, #0
	mov sl, r0
_080F186C:
	movs r7, #0
	mov r1, sl
	adds r1, #1
	str r1, [sp, #0x20]
	b _080F1904
	.align 2, 0
_080F1878: .4byte 0x03001175
_080F187C:
	lsls r4, r7, #2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, sl
	bl sub_080F19A8
	ldr r1, _080F1928
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r4
	adds r1, r7, #1
	mov sb, r1
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080F18FE
	movs r5, #0
	ldr r1, _080F192C
	ldrb r0, [r1]
	subs r0, #1
	cmp r5, r0
	bge _080F18FE
	adds r6, r1, #0
_080F18B0:
	adds r0, r7, r5
	adds r4, r0, #1
	ldrb r1, [r6]
	adds r0, r4, #0
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_080EF934
	ldr r1, _080F1930
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080F18F0
	ldrb r1, [r6]
	adds r0, r4, #0
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	mov r1, sp
	add r1, r8
	ldr r1, [r1]
	bl sub_080F1934
_080F18F0:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r6]
	subs r0, #1
	cmp r5, r0
	blt _080F18B0
_080F18FE:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
_080F1904:
	ldr r0, _080F192C
	ldrb r0, [r0]
	cmp r7, r0
	blo _080F187C
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0xf
	bls _080F186C
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1928: .4byte 0x03001176
_080F192C: .4byte 0x03001175
_080F1930: .4byte 0x03005E20
	thumb_func_end sub_080F183C

	thumb_func_start sub_080F1934
sub_080F1934: @ 0x080F1934
	push {lr}
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _080F1958
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r2, _080F195C
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_080F1960
	pop {r0}
	bx r0
	.align 2, 0
_080F1958: .4byte 0x03001176
_080F195C: .4byte 0x03005E20
	thumb_func_end sub_080F1934

	thumb_func_start sub_080F1960
sub_080F1960: @ 0x080F1960
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldrb r3, [r5]
	adds r0, r3, #0
	cmp r0, #0
	bne _080F1976
_080F1972:
	movs r0, #0
	b _080F19A2
_080F1976:
	movs r1, #0
	adds r2, r3, #0
	adds r3, r0, #0
_080F197C:
	lsls r0, r1, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _080F1972
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _080F197C
	lsls r0, r6, #0x18
	asrs r0, r0, #0x16
	adds r0, r0, r4
	strb r2, [r0]
	movs r1, #1
	strb r1, [r0, #1]
	ldrh r1, [r5, #2]
	strh r1, [r0, #2]
	movs r0, #1
_080F19A2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080F1960

	thumb_func_start sub_080F19A8
sub_080F19A8: @ 0x080F19A8
	push {lr}
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080F19BE
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	b _080F19C2
_080F19BE:
	movs r0, #1
	rsbs r0, r0, #0
_080F19C2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080F19A8

	thumb_func_start sub_080F19C8
sub_080F19C8: @ 0x080F19C8
	push {r4, lr}
	movs r4, #0
_080F19CC:
	ldr r0, _080F19F8
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r1, _080F19FC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	bls _080F19E4
	adds r0, r4, #0
	bl ClearPokemonNewsI
_080F19E4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080F19CC
	bl sub_080EF9BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F19F8: .4byte 0x03005AEC
_080F19FC: .4byte 0x00002B50
	thumb_func_end sub_080F19C8

	thumb_func_start TVShowGetFlagCount
TVShowGetFlagCount: @ 0x080F1A00
	push {r4, r5, lr}
	ldr r0, _080F1A34
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080F1A2C
	movs r2, #0
	ldr r5, _080F1A38
	ldr r4, _080F1A3C
	movs r3, #0
_080F1A18:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r0, r0, r4
	strb r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080F1A18
_080F1A2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1A34: .4byte 0x00000864
_080F1A38: .4byte 0x03005AEC
_080F1A3C: .4byte 0x00002B51
	thumb_func_end TVShowGetFlagCount

	thumb_func_start sub_080F1A40
sub_080F1A40: @ 0x080F1A40
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x2c
	bl AllocZeroed
	adds r4, r0, #0
	movs r7, #0
_080F1A50:
	lsls r0, r7, #3
	adds r1, r0, r7
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r1, [r1]
	subs r1, #1
	adds r2, r0, #0
	cmp r1, #0x28
	bls _080F1A64
	b _080F1CD0
_080F1A64:
	lsls r0, r1, #2
	ldr r1, _080F1A70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1A70: .4byte 0x080F1A74
_080F1A74: @ jump table
	.4byte _080F1B18 @ case 0
	.4byte _080F1B18 @ case 1
	.4byte _080F1B36 @ case 2
	.4byte _080F1CD0 @ case 3
	.4byte _080F1C2E @ case 4
	.4byte _080F1BFA @ case 5
	.4byte _080F1BC2 @ case 6
	.4byte _080F1CD0 @ case 7
	.4byte _080F1CD0 @ case 8
	.4byte _080F1CD0 @ case 9
	.4byte _080F1CD0 @ case 10
	.4byte _080F1CD0 @ case 11
	.4byte _080F1CD0 @ case 12
	.4byte _080F1CD0 @ case 13
	.4byte _080F1CD0 @ case 14
	.4byte _080F1CD0 @ case 15
	.4byte _080F1CD0 @ case 16
	.4byte _080F1CD0 @ case 17
	.4byte _080F1CD0 @ case 18
	.4byte _080F1CD0 @ case 19
	.4byte _080F1B6E @ case 20
	.4byte _080F1BA2 @ case 21
	.4byte _080F1C66 @ case 22
	.4byte _080F1C86 @ case 23
	.4byte _080F1CA6 @ case 24
	.4byte _080F1CD0 @ case 25
	.4byte _080F1CD0 @ case 26
	.4byte _080F1CD0 @ case 27
	.4byte _080F1CD0 @ case 28
	.4byte _080F1CD0 @ case 29
	.4byte _080F1CD0 @ case 30
	.4byte _080F1CD0 @ case 31
	.4byte _080F1CD0 @ case 32
	.4byte _080F1CD0 @ case 33
	.4byte _080F1CD0 @ case 34
	.4byte _080F1CD0 @ case 35
	.4byte _080F1CD0 @ case 36
	.4byte _080F1CD0 @ case 37
	.4byte _080F1CD0 @ case 38
	.4byte _080F1CD0 @ case 39
	.4byte _080F1CC6 @ case 40
_080F1B18:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4]
	adds r0, #0x10
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1B32
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #0x18]
	b _080F1CD0
_080F1B32:
	ldr r0, [r4]
	b _080F1CCE
_080F1B36:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #4]
	adds r0, #5
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1B50
	ldr r1, [r4, #4]
	movs r0, #1
	strb r0, [r1, #0xd]
	b _080F1B54
_080F1B50:
	ldr r0, [r4, #4]
	strb r5, [r0, #0xd]
_080F1B54:
	ldr r0, [r4, #4]
	adds r0, #0x10
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1B68
	ldr r1, [r4, #4]
	movs r0, #1
	strb r0, [r1, #0xe]
	b _080F1CD0
_080F1B68:
	ldr r0, [r4, #4]
	strb r5, [r0, #0xe]
	b _080F1CD0
_080F1B6E:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #0x18]
	adds r0, #0x13
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1B88
	ldr r1, [r4, #0x18]
	movs r0, #1
	strb r0, [r1, #2]
	b _080F1B8C
_080F1B88:
	ldr r0, [r4, #0x18]
	strb r5, [r0, #2]
_080F1B8C:
	ldr r0, [r4, #0x18]
	adds r0, #4
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1B9C
	ldr r1, [r4, #0x18]
	b _080F1BB6
_080F1B9C:
	ldr r0, [r4, #0x18]
	strb r5, [r0, #3]
	b _080F1CD0
_080F1BA2:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #0x1c]
	adds r0, #0x13
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1BBC
	ldr r1, [r4, #0x1c]
_080F1BB6:
	movs r0, #1
	strb r0, [r1, #3]
	b _080F1CD0
_080F1BBC:
	ldr r0, [r4, #0x1c]
	strb r5, [r0, #3]
	b _080F1CD0
_080F1BC2:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #0x14]
	adds r0, #2
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1BDC
	ldr r1, [r4, #0x14]
	movs r0, #1
	strb r0, [r1, #0x1d]
	b _080F1BE0
_080F1BDC:
	ldr r0, [r4, #0x14]
	strb r5, [r0, #0x1d]
_080F1BE0:
	ldr r0, [r4, #0x14]
	adds r0, #0xc
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1BF4
	ldr r1, [r4, #0x14]
	movs r0, #1
	strb r0, [r1, #0x1e]
	b _080F1CD0
_080F1BF4:
	ldr r0, [r4, #0x14]
	strb r5, [r0, #0x1e]
	b _080F1CD0
_080F1BFA:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #0x10]
	adds r0, #0x16
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1C14
	ldr r1, [r4, #0x10]
	movs r0, #1
	strb r0, [r1, #0x1e]
	b _080F1C18
_080F1C14:
	ldr r0, [r4, #0x10]
	strb r5, [r0, #0x1e]
_080F1C18:
	ldr r0, [r4, #0x10]
	adds r0, #8
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1C28
	ldr r1, [r4, #0x10]
	b _080F1C5A
_080F1C28:
	ldr r0, [r4, #0x10]
	strb r5, [r0, #0x1f]
	b _080F1CD0
_080F1C2E:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #0xc]
	adds r0, #0xf
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1C48
	ldr r1, [r4, #0xc]
	movs r0, #1
	strb r0, [r1, #0x1e]
	b _080F1C4C
_080F1C48:
	ldr r0, [r4, #0xc]
	strb r5, [r0, #0x1e]
_080F1C4C:
	ldr r0, [r4, #0xc]
	adds r0, #4
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1C60
	ldr r1, [r4, #0xc]
_080F1C5A:
	movs r0, #1
	strb r0, [r1, #0x1f]
	b _080F1CD0
_080F1C60:
	ldr r0, [r4, #0xc]
	strb r5, [r0, #0x1f]
	b _080F1CD0
_080F1C66:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #8]
	adds r0, #0x13
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1C80
	ldr r1, [r4, #8]
	movs r0, #1
	strb r0, [r1, #2]
	b _080F1CD0
_080F1C80:
	ldr r0, [r4, #8]
	strb r5, [r0, #2]
	b _080F1CD0
_080F1C86:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #0x20]
	adds r0, #0x13
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1CA0
	ldr r1, [r4, #0x20]
	movs r0, #1
	strb r0, [r1, #6]
	b _080F1CD0
_080F1CA0:
	ldr r0, [r4, #0x20]
	strb r5, [r0, #6]
	b _080F1CD0
_080F1CA6:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #0x24]
	adds r0, #0x13
	bl IsStringJapanese
	cmp r0, #0
	beq _080F1CC0
	ldr r1, [r4, #0x24]
	movs r0, #1
	strb r0, [r1, #0xb]
	b _080F1CD0
_080F1CC0:
	ldr r0, [r4, #0x24]
	strb r5, [r0, #0xb]
	b _080F1CD0
_080F1CC6:
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [r4, #0x28]
_080F1CCE:
	strb r5, [r0, #0x18]
_080F1CD0:
	adds r7, #1
	cmp r7, #0x17
	bgt _080F1CD8
	b _080F1A50
_080F1CD8:
	adds r0, r4, #0
	bl Free
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080F1A40

	thumb_func_start sub_080F1CE4
sub_080F1CE4: @ 0x080F1CE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	movs r6, #0x17
_080F1CEC:
	ldrb r0, [r4]
	cmp r0, #0x17
	beq _080F1D08
	cmp r0, #0x19
	bne _080F1D18
	ldrb r0, [r4, #0xa]
	cmp r0, #0x58
	bls _080F1D18
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x24
	bl memset
	b _080F1D18
_080F1D08:
	ldrb r0, [r4, #0x12]
	cmp r0, #0x58
	bls _080F1D18
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x24
	bl memset
_080F1D18:
	adds r4, #0x24
	adds r5, #0x24
	subs r6, #1
	cmp r6, #0
	bge _080F1CEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080F1CE4

	thumb_func_start DoTVShow
DoTVShow: @ 0x080F1D28
	push {lr}
	ldr r0, _080F1D60
	ldr r2, [r0]
	ldr r0, _080F1D64
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r1, _080F1D68
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F1D46
	b _080F1ED2
_080F1D46:
	subs r1, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x28
	bls _080F1D54
	b _080F1ED2
_080F1D54:
	lsls r0, r0, #2
	ldr r1, _080F1D6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1D60: .4byte 0x03005AEC
_080F1D64: .4byte 0x02037280
_080F1D68: .4byte 0x000027CD
_080F1D6C: .4byte 0x080F1D70
_080F1D70: @ jump table
	.4byte _080F1E14 @ case 0
	.4byte _080F1E1A @ case 1
	.4byte _080F1E20 @ case 2
	.4byte _080F1E26 @ case 3
	.4byte _080F1E4A @ case 4
	.4byte _080F1E32 @ case 5
	.4byte _080F1E38 @ case 6
	.4byte _080F1E50 @ case 7
	.4byte _080F1E5C @ case 8
	.4byte _080F1E56 @ case 9
	.4byte _080F1EA4 @ case 10
	.4byte _080F1ECE @ case 11
	.4byte _080F1ED2 @ case 12
	.4byte _080F1ED2 @ case 13
	.4byte _080F1ED2 @ case 14
	.4byte _080F1ED2 @ case 15
	.4byte _080F1ED2 @ case 16
	.4byte _080F1ED2 @ case 17
	.4byte _080F1ED2 @ case 18
	.4byte _080F1ED2 @ case 19
	.4byte _080F1E3E @ case 20
	.4byte _080F1E44 @ case 21
	.4byte _080F1E62 @ case 22
	.4byte _080F1E68 @ case 23
	.4byte _080F1E6E @ case 24
	.4byte _080F1E74 @ case 25
	.4byte _080F1E7A @ case 26
	.4byte _080F1E80 @ case 27
	.4byte _080F1E86 @ case 28
	.4byte _080F1E8C @ case 29
	.4byte _080F1E92 @ case 30
	.4byte _080F1E98 @ case 31
	.4byte _080F1E9E @ case 32
	.4byte _080F1EAA @ case 33
	.4byte _080F1EB0 @ case 34
	.4byte _080F1EB6 @ case 35
	.4byte _080F1EBC @ case 36
	.4byte _080F1EC2 @ case 37
	.4byte _080F1EC8 @ case 38
	.4byte _080F1ED2 @ case 39
	.4byte _080F1E2C @ case 40
_080F1E14:
	bl DoTVShowPokemonFanClubLetter
	b _080F1ED2
_080F1E1A:
	bl DoTVShowRecentHappenings
	b _080F1ED2
_080F1E20:
	bl DoTVShowPokemonFanClubOpinions
	b _080F1ED2
_080F1E26:
	bl DoTVShowDummiedOut
	b _080F1ED2
_080F1E2C:
	bl DoTVShowPokemonNewsMassOutbreak
	b _080F1ED2
_080F1E32:
	bl DoTVShowBravoTrainerPokemonProfile
	b _080F1ED2
_080F1E38:
	bl DoTVShowBravoTrainerBattleTower
	b _080F1ED2
_080F1E3E:
	bl DoTVShowPokemonTodaySuccessfulCapture
	b _080F1ED2
_080F1E44:
	bl DoTVShowTodaysSmartShopper
	b _080F1ED2
_080F1E4A:
	bl DoTVShowTheNameRaterShow
	b _080F1ED2
_080F1E50:
	bl DoTVShowPokemonContestLiveUpdates
	b _080F1ED2
_080F1E56:
	bl DoTVShowPokemonBattleUpdate
	b _080F1ED2
_080F1E5C:
	bl DoTVShow3CheersForPokeblocks
	b _080F1ED2
_080F1E62:
	bl DoTVShowPokemonTodayFailedCapture
	b _080F1ED2
_080F1E68:
	bl DoTVShowPokemonAngler
	b _080F1ED2
_080F1E6E:
	bl DoTVShowTheWorldOfMasters
	b _080F1ED2
_080F1E74:
	bl DoTVShowTodaysRivalTrainer
	b _080F1ED2
_080F1E7A:
	bl DoTVShowDewfordTrendWatcherNetwork
	b _080F1ED2
_080F1E80:
	bl DoTVShowHoennTreasureInvestigators
	b _080F1ED2
_080F1E86:
	bl DoTVShowFindThatGamer
	b _080F1ED2
_080F1E8C:
	bl DoTVShowBreakingNewsTV
	b _080F1ED2
_080F1E92:
	bl DoTVShowSecretBaseVisit
	b _080F1ED2
_080F1E98:
	bl DoTVShowPokemonLotteryWinnerFlashReport
	b _080F1ED2
_080F1E9E:
	bl DoTVShowThePokemonBattleSeminar
	b _080F1ED2
_080F1EA4:
	bl DoTVShowTrainerFanClubSpecial
	b _080F1ED2
_080F1EAA:
	bl DoTVShowTrainerFanClub
	b _080F1ED2
_080F1EB0:
	bl DoTVShowSpotTheCuties
	b _080F1ED2
_080F1EB6:
	bl DoTVShowPokemonNewsBattleFrontier
	b _080F1ED2
_080F1EBC:
	bl DoTVShowWhatsNo1InHoennToday
	b _080F1ED2
_080F1EC2:
	bl DoTVShowSecretBaseSecrets
	b _080F1ED2
_080F1EC8:
	bl DoTVShowSafariFanClub
	b _080F1ED2
_080F1ECE:
	bl DoTVShowPokemonContestLiveUpdates2
_080F1ED2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DoTVShow

	thumb_func_start DoTVShowBravoTrainerPokemonProfile
DoTVShowBravoTrainerPokemonProfile: @ 0x080F1ED8
	push {r4, r5, lr}
	ldr r2, _080F1F08
	ldr r0, _080F1F0C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F1F10
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F1F14
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F1F18
	ldrb r5, [r0]
	cmp r5, #8
	bls _080F1EFE
	b _080F2140
_080F1EFE:
	lsls r0, r5, #2
	ldr r1, _080F1F1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1F08: .4byte 0x03005AEC
_080F1F0C: .4byte 0x02037280
_080F1F10: .4byte 0x000027CC
_080F1F14: .4byte 0x02037290
_080F1F18: .4byte 0x02039CFC
_080F1F1C: .4byte 0x080F1F20
_080F1F20: @ jump table
	.4byte _080F1F44 @ case 0
	.4byte _080F1F9C @ case 1
	.4byte _080F1FD4 @ case 2
	.4byte _080F2004 @ case 3
	.4byte _080F2038 @ case 4
	.4byte _080F206C @ case 5
	.4byte _080F20B0 @ case 6
	.4byte _080F20F8 @ case 7
	.4byte _080F2128 @ case 8
_080F1F44:
	ldr r0, _080F1F84
	adds r1, r4, #0
	adds r1, #0x16
	bl StringCopy
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	movs r0, #1
	bl CopyContestCategoryToStringVar
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1e
	movs r0, #2
	bl CopyContestRankToStringVar
	ldrh r1, [r4, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080F1F88
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #8
	bl StringCompare
	cmp r0, #0
	bne _080F1F90
	ldr r1, _080F1F8C
	movs r0, #8
	b _080F213E
	.align 2, 0
_080F1F84: .4byte 0x02021C40
_080F1F88: .4byte 0x082EA31C
_080F1F8C: .4byte 0x02039CFC
_080F1F90:
	ldr r1, _080F1F98
	movs r0, #1
	b _080F213E
	.align 2, 0
_080F1F98: .4byte 0x02039CFC
_080F1F9C:
	ldr r0, _080F1FC8
	ldrh r2, [r4, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F1FCC
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F1FD0
	adds r1, r4, #0
	adds r1, #8
	bl StringCopy10
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	movs r0, #2
	bl CopyContestCategoryToStringVar
	b _080F213A
	.align 2, 0
_080F1FC8: .4byte 0x02021C40
_080F1FCC: .4byte 0x082EA31C
_080F1FD0: .4byte 0x02021C54
_080F1FD4:
	ldr r0, _080F1FF0
	adds r1, r4, #0
	adds r1, #0x16
	bl StringCopy
	ldrb r1, [r4, #0x13]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	bne _080F1FF8
	ldr r1, _080F1FF4
	movs r0, #3
	b _080F213E
	.align 2, 0
_080F1FF0: .4byte 0x02021C40
_080F1FF4: .4byte 0x02039CFC
_080F1FF8:
	ldr r1, _080F2000
	movs r0, #4
	b _080F213E
	.align 2, 0
_080F2000: .4byte 0x02039CFC
_080F2004:
	ldr r0, _080F202C
	adds r1, r4, #0
	adds r1, #0x16
	bl StringCopy
	ldr r0, _080F2030
	ldrh r1, [r4, #4]
	bl CopyEasyChatWord
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldr r1, _080F2034
	movs r0, #5
	b _080F213E
	.align 2, 0
_080F202C: .4byte 0x02021C40
_080F2030: .4byte 0x02021C54
_080F2034: .4byte 0x02039CFC
_080F2038:
	ldr r0, _080F2060
	adds r1, r4, #0
	adds r1, #0x16
	bl StringCopy
	ldr r0, _080F2064
	ldrh r1, [r4, #4]
	bl CopyEasyChatWord
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldr r1, _080F2068
	movs r0, #5
	b _080F213E
	.align 2, 0
_080F2060: .4byte 0x02021C40
_080F2064: .4byte 0x02021C54
_080F2068: .4byte 0x02039CFC
_080F206C:
	ldr r0, _080F2098
	adds r1, r4, #0
	adds r1, #0x16
	bl StringCopy
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	movs r0, #1
	bl CopyContestCategoryToStringVar
	ldr r0, _080F209C
	ldrh r1, [r4, #6]
	bl CopyEasyChatWord
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _080F20A4
	ldr r1, _080F20A0
	movs r0, #6
	b _080F213E
	.align 2, 0
_080F2098: .4byte 0x02021C40
_080F209C: .4byte 0x02021C68
_080F20A0: .4byte 0x02039CFC
_080F20A4:
	ldr r1, _080F20AC
	movs r0, #7
	b _080F213E
	.align 2, 0
_080F20AC: .4byte 0x02039CFC
_080F20B0:
	ldr r0, _080F20E0
	ldrh r2, [r4, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F20E4
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F20E8
	ldrh r1, [r4, #0x14]
	lsls r1, r1, #3
	ldr r2, _080F20EC
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F20F0
	ldrh r1, [r4, #6]
	bl CopyEasyChatWord
	ldr r1, _080F20F4
	movs r0, #7
	b _080F213E
	.align 2, 0
_080F20E0: .4byte 0x02021C40
_080F20E4: .4byte 0x082EA31C
_080F20E8: .4byte 0x02021C54
_080F20EC: .4byte 0x082EACC4
_080F20F0: .4byte 0x02021C68
_080F20F4: .4byte 0x02039CFC
_080F20F8:
	ldr r0, _080F211C
	adds r1, r4, #0
	adds r1, #0x16
	bl StringCopy
	ldr r0, _080F2120
	ldrh r2, [r4, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2124
	adds r1, r1, r2
	bl StringCopy
	bl TVShowDone
	b _080F2140
	.align 2, 0
_080F211C: .4byte 0x02021C40
_080F2120: .4byte 0x02021C54
_080F2124: .4byte 0x082EA31C
_080F2128:
	ldr r0, _080F2154
	ldrh r2, [r4, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2158
	adds r1, r1, r2
	bl StringCopy
_080F213A:
	ldr r1, _080F215C
	movs r0, #2
_080F213E:
	strb r0, [r1]
_080F2140:
	ldr r0, _080F2160
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F2154: .4byte 0x02021C40
_080F2158: .4byte 0x082EA31C
_080F215C: .4byte 0x02039CFC
_080F2160: .4byte 0x08568CB0
	thumb_func_end DoTVShowBravoTrainerPokemonProfile

	thumb_func_start DoTVShowBravoTrainerBattleTower
DoTVShowBravoTrainerBattleTower: @ 0x080F2164
	push {r4, r5, lr}
	ldr r2, _080F2198
	ldr r0, _080F219C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F21A0
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F21A4
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F21A8
	ldrb r5, [r0]
	adds r2, r0, #0
	cmp r5, #0xe
	bls _080F218C
	b _080F23CA
_080F218C:
	lsls r0, r5, #2
	ldr r1, _080F21AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2198: .4byte 0x03005AEC
_080F219C: .4byte 0x02037280
_080F21A0: .4byte 0x000027CC
_080F21A4: .4byte 0x02037290
_080F21A8: .4byte 0x02039CFC
_080F21AC: .4byte 0x080F21B0
_080F21B0: @ jump table
	.4byte _080F21EC @ case 0
	.4byte _080F2230 @ case 1
	.4byte _080F2280 @ case 2
	.4byte _080F22A0 @ case 3
	.4byte _080F22CC @ case 4
	.4byte _080F2314 @ case 5
	.4byte _080F2320 @ case 6
	.4byte _080F232C @ case 7
	.4byte _080F2332 @ case 8
	.4byte _080F2332 @ case 9
	.4byte _080F2332 @ case 10
	.4byte _080F234C @ case 11
	.4byte _080F2378 @ case 12
	.4byte _080F2378 @ case 13
	.4byte _080F23AC @ case 14
_080F21EC:
	ldr r0, _080F2214
	adds r1, r4, #2
	bl StringCopy
	ldr r0, _080F2218
	ldrh r2, [r4, #0xa]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F221C
	adds r1, r1, r2
	bl StringCopy
	ldrh r0, [r4, #0x16]
	cmp r0, #6
	bls _080F2224
	ldr r1, _080F2220
	movs r0, #1
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F2214: .4byte 0x02021C40
_080F2218: .4byte 0x02021C54
_080F221C: .4byte 0x082EA31C
_080F2220: .4byte 0x02039CFC
_080F2224:
	ldr r1, _080F222C
	movs r0, #2
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F222C: .4byte 0x02039CFC
_080F2230:
	ldrb r0, [r4, #0x1a]
	cmp r0, #0x32
	bne _080F2248
	ldr r0, _080F2240
	ldr r1, _080F2244
	bl StringCopy
	b _080F2250
	.align 2, 0
_080F2240: .4byte 0x02021C40
_080F2244: .4byte 0x085CAB0D
_080F2248:
	ldr r0, _080F2268
	ldr r1, _080F226C
	bl StringCopy
_080F2250:
	ldrh r1, [r4, #0x16]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _080F2274
	ldr r1, _080F2270
	movs r0, #3
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F2268: .4byte 0x02021C40
_080F226C: .4byte 0x085CAB13
_080F2270: .4byte 0x02039CFC
_080F2274:
	ldr r1, _080F227C
	movs r0, #4
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F227C: .4byte 0x02039CFC
_080F2280:
	ldr r0, _080F229C
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldrh r1, [r4, #0x16]
	adds r1, #1
	movs r0, #1
	bl TV_PrintIntToStringVar
_080F2294:
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _080F22EE
	b _080F2308
	.align 2, 0
_080F229C: .4byte 0x02021C40
_080F22A0:
	ldr r0, _080F22C0
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r0, _080F22C4
	ldrh r2, [r4, #0x14]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F22C8
	adds r1, r1, r2
	bl StringCopy
	b _080F2294
	.align 2, 0
_080F22C0: .4byte 0x02021C40
_080F22C4: .4byte 0x02021C54
_080F22C8: .4byte 0x082EA31C
_080F22CC:
	ldr r0, _080F22F8
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r0, _080F22FC
	ldrh r2, [r4, #0x14]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2300
	adds r1, r1, r2
	bl StringCopy
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	bne _080F2308
_080F22EE:
	ldr r1, _080F2304
	movs r0, #5
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F22F8: .4byte 0x02021C40
_080F22FC: .4byte 0x02021C54
_080F2300: .4byte 0x082EA31C
_080F2304: .4byte 0x02039CFC
_080F2308:
	ldr r1, _080F2310
	movs r0, #6
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F2310: .4byte 0x02039CFC
_080F2314:
	ldr r0, _080F231C
	adds r1, r4, #0
	adds r1, #0xc
	b _080F2336
	.align 2, 0
_080F231C: .4byte 0x02021C40
_080F2320:
	ldr r0, _080F2328
	adds r1, r4, #0
	adds r1, #0xc
	b _080F2336
	.align 2, 0
_080F2328: .4byte 0x02021C40
_080F232C:
	movs r0, #0xb
	strb r0, [r2]
	b _080F23CA
_080F2332:
	ldr r0, _080F2344
	adds r1, r4, #2
_080F2336:
	bl StringCopy
	ldr r1, _080F2348
	movs r0, #0xb
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F2344: .4byte 0x02021C40
_080F2348: .4byte 0x02039CFC
_080F234C:
	ldr r0, _080F2364
	ldrh r1, [r4, #0x18]
	bl CopyEasyChatWord
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	bne _080F236C
	ldr r1, _080F2368
	movs r0, #0xc
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F2364: .4byte 0x02021C40
_080F2368: .4byte 0x02039CFC
_080F236C:
	ldr r1, _080F2374
	movs r0, #0xd
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F2374: .4byte 0x02039CFC
_080F2378:
	ldr r0, _080F239C
	ldrh r1, [r4, #0x18]
	bl CopyEasyChatWord
	ldr r0, _080F23A0
	adds r1, r4, #2
	bl StringCopy
	ldr r0, _080F23A4
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r1, _080F23A8
	movs r0, #0xe
	strb r0, [r1]
	b _080F23CA
	.align 2, 0
_080F239C: .4byte 0x02021C40
_080F23A0: .4byte 0x02021C54
_080F23A4: .4byte 0x02021C68
_080F23A8: .4byte 0x02039CFC
_080F23AC:
	ldr r0, _080F23DC
	adds r1, r4, #2
	bl StringCopy
	ldr r0, _080F23E0
	ldrh r2, [r4, #0xa]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F23E4
	adds r1, r1, r2
	bl StringCopy
	bl TVShowDone
_080F23CA:
	ldr r0, _080F23E8
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F23DC: .4byte 0x02021C40
_080F23E0: .4byte 0x02021C54
_080F23E4: .4byte 0x082EA31C
_080F23E8: .4byte 0x08568CEC
	thumb_func_end DoTVShowBravoTrainerBattleTower

	thumb_func_start DoTVShowTodaysSmartShopper
DoTVShowTodaysSmartShopper: @ 0x080F23EC
	push {r4, r5, r6, lr}
	ldr r2, _080F2420
	ldr r0, _080F2424
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F2428
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F242C
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F2430
	ldrb r6, [r0]
	adds r2, r0, #0
	cmp r6, #0xc
	bls _080F2414
	b _080F2606
_080F2414:
	lsls r0, r6, #2
	ldr r1, _080F2434
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2420: .4byte 0x03005AEC
_080F2424: .4byte 0x02037280
_080F2428: .4byte 0x000027CC
_080F242C: .4byte 0x02037290
_080F2430: .4byte 0x02039CFC
_080F2434: .4byte 0x080F2438
_080F2438: @ jump table
	.4byte _080F246C @ case 0
	.4byte _080F24A8 @ case 1
	.4byte _080F24F0 @ case 2
	.4byte _080F2502 @ case 3
	.4byte _080F24F0 @ case 4
	.4byte _080F24F0 @ case 5
	.4byte _080F252C @ case 6
	.4byte _080F255C @ case 7
	.4byte _080F258C @ case 8
	.4byte _080F2598 @ case 9
	.4byte _080F25A6 @ case 10
	.4byte _080F25B8 @ case 11
	.4byte _080F25F8 @ case 12
_080F246C:
	ldr r0, _080F2490
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F2494
	ldrb r1, [r5, #0x12]
	movs r2, #0
	bl GetMapName
	ldrh r0, [r5, #0xc]
	cmp r0, #0xfe
	bls _080F249C
	ldr r1, _080F2498
	movs r0, #0xb
	strb r0, [r1]
	b _080F2606
	.align 2, 0
_080F2490: .4byte 0x02021C40
_080F2494: .4byte 0x02021C54
_080F2498: .4byte 0x02039CFC
_080F249C:
	ldr r1, _080F24A4
	movs r0, #1
	strb r0, [r1]
	b _080F2606
	.align 2, 0
_080F24A4: .4byte 0x02039CFC
_080F24A8:
	ldr r0, _080F24E4
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r4, _080F24E8
	ldrh r0, [r5, #6]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrh r1, [r5, #0xc]
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldr r4, _080F24EC
	bl Random
	ldrb r2, [r4]
	adds r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	ands r0, r1
	adds r0, r0, r2
	strb r0, [r4]
	b _080F2606
	.align 2, 0
_080F24E4: .4byte 0x02021C40
_080F24E8: .4byte 0x02021C54
_080F24EC: .4byte 0x02039CFC
_080F24F0:
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _080F24FC
	movs r0, #6
	strb r0, [r2]
	b _080F2606
_080F24FC:
	movs r0, #0xa
	strb r0, [r2]
	b _080F2606
_080F2502:
	ldrh r1, [r5, #0xc]
	adds r1, #1
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _080F2520
	ldr r1, _080F251C
	movs r0, #6
	strb r0, [r1]
	b _080F2606
	.align 2, 0
_080F251C: .4byte 0x02039CFC
_080F2520:
	ldr r1, _080F2528
	movs r0, #0xa
	strb r0, [r1]
	b _080F2606
	.align 2, 0
_080F2528: .4byte 0x02039CFC
_080F252C:
	ldr r4, _080F2554
	ldrh r0, [r5, #8]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrh r1, [r5, #0xe]
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldrh r0, [r5, #0xa]
	cmp r0, #0
	beq _080F2574
	ldr r1, _080F2558
	movs r0, #7
	strb r0, [r1]
	b _080F2606
	.align 2, 0
_080F2554: .4byte 0x02021C54
_080F2558: .4byte 0x02039CFC
_080F255C:
	ldr r4, _080F2584
	ldrh r0, [r5, #0xa]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrh r1, [r5, #0x10]
	movs r0, #2
	bl TV_PrintIntToStringVar
_080F2574:
	ldrb r0, [r5, #2]
	cmp r0, #1
	beq _080F25D8
	ldr r1, _080F2588
	movs r0, #9
	strb r0, [r1]
	b _080F2606
	.align 2, 0
_080F2584: .4byte 0x02021C54
_080F2588: .4byte 0x02039CFC
_080F258C:
	ldrh r0, [r5, #0xc]
	cmp r0, #0xfe
	bls _080F25B2
	movs r0, #0xc
	strb r0, [r2]
	b _080F2606
_080F2598:
	movs r0, #1
	adds r1, r5, #0
	bl sub_080EFF10
	bl TVShowDone
	b _080F2606
_080F25A6:
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _080F25B2
	movs r0, #8
	strb r0, [r2]
	b _080F2606
_080F25B2:
	movs r0, #9
	strb r0, [r2]
	b _080F2606
_080F25B8:
	ldr r0, _080F25E0
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r4, _080F25E4
	ldrh r0, [r5, #6]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _080F25EC
_080F25D8:
	ldr r1, _080F25E8
	movs r0, #8
	strb r0, [r1]
	b _080F2606
	.align 2, 0
_080F25E0: .4byte 0x02021C40
_080F25E4: .4byte 0x02021C54
_080F25E8: .4byte 0x02039CFC
_080F25EC:
	ldr r1, _080F25F4
	movs r0, #0xc
	strb r0, [r1]
	b _080F2606
	.align 2, 0
_080F25F4: .4byte 0x02039CFC
_080F25F8:
	ldr r0, _080F2618
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	bl TVShowDone
_080F2606:
	ldr r0, _080F261C
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F2618: .4byte 0x02021C40
_080F261C: .4byte 0x08568C7C
	thumb_func_end DoTVShowTodaysSmartShopper

	thumb_func_start DoTVShowTheNameRaterShow
DoTVShowTheNameRaterShow: @ 0x080F2620
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r2, _080F2654
	ldr r0, _080F2658
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F265C
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F2660
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F2664
	ldrb r6, [r0]
	adds r2, r0, #0
	cmp r6, #0x12
	bls _080F264A
	b _080F28E0
_080F264A:
	lsls r0, r6, #2
	ldr r1, _080F2668
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2654: .4byte 0x03005AEC
_080F2658: .4byte 0x02037280
_080F265C: .4byte 0x000027CC
_080F2660: .4byte 0x02037290
_080F2664: .4byte 0x02039CFC
_080F2668: .4byte 0x080F266C
_080F266C: @ jump table
	.4byte _080F26B8 @ case 0
	.4byte _080F2700 @ case 1
	.4byte _080F2722 @ case 2
	.4byte _080F2700 @ case 3
	.4byte _080F2700 @ case 4
	.4byte _080F2700 @ case 5
	.4byte _080F2700 @ case 6
	.4byte _080F2700 @ case 7
	.4byte _080F2700 @ case 8
	.4byte _080F2768 @ case 9
	.4byte _080F2768 @ case 10
	.4byte _080F2768 @ case 11
	.4byte _080F27A4 @ case 12
	.4byte _080F27B6 @ case 13
	.4byte _080F27F4 @ case 14
	.4byte _080F2814 @ case 15
	.4byte _080F285C @ case 16
	.4byte _080F288C @ case 17
	.4byte _080F28D4 @ case 18
_080F26B8:
	ldr r0, _080F26EC
	adds r1, r5, #0
	adds r1, #0xf
	bl StringCopy
	ldr r0, _080F26F0
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F26F4
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F26F8
	adds r1, r5, #4
	bl StringCopy10
	ldr r4, _080F26FC
	adds r0, r5, #0
	bl TV_GetNicknameSumMod8
	adds r0, #1
	strb r0, [r4]
	b _080F28E0
	.align 2, 0
_080F26EC: .4byte 0x02021C40
_080F26F0: .4byte 0x02021C54
_080F26F4: .4byte 0x082EA31C
_080F26F8: .4byte 0x02021C68
_080F26FC: .4byte 0x02039CFC
_080F2700:
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	bne _080F270C
	movs r0, #9
	strb r0, [r2]
	b _080F28E0
_080F270C:
	cmp r0, #1
	bne _080F2716
	movs r0, #0xa
	strb r0, [r2]
	b _080F28E0
_080F2716:
	cmp r0, #2
	beq _080F271C
	b _080F28E0
_080F271C:
	movs r0, #0xb
	strb r0, [r2]
	b _080F28E0
_080F2722:
	ldr r0, _080F273C
	adds r1, r5, #0
	adds r1, #0xf
	bl StringCopy
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	bne _080F2744
	ldr r1, _080F2740
	movs r0, #9
	strb r0, [r1]
	b _080F28E0
	.align 2, 0
_080F273C: .4byte 0x02021C40
_080F2740: .4byte 0x02039CFC
_080F2744:
	cmp r0, #1
	bne _080F2754
	ldr r1, _080F2750
	movs r0, #0xa
	strb r0, [r1]
	b _080F28E0
	.align 2, 0
_080F2750: .4byte 0x02039CFC
_080F2754:
	cmp r0, #2
	beq _080F275A
	b _080F28E0
_080F275A:
	ldr r1, _080F2764
	movs r0, #0xb
	strb r0, [r1]
	b _080F28E0
	.align 2, 0
_080F2764: .4byte 0x02039CFC
_080F2768:
	ldr r0, _080F279C
	adds r1, r5, #4
	bl StringCopy10
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl TV_GetNicknameSubstring
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #2
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl TV_GetNicknameSubstring
	ldr r1, _080F27A0
	movs r0, #0xc
	strb r0, [r1]
	b _080F28E0
	.align 2, 0
_080F279C: .4byte 0x02021C40
_080F27A0: .4byte 0x02039CFC
_080F27A4:
	ldrb r0, [r5, #0x1b]
	cmp r0, #0
	bne _080F27B0
	movs r0, #0xd
	strb r0, [r2]
	b _080F28E0
_080F27B0:
	movs r0, #0xf
	strb r0, [r2]
	b _080F28E0
_080F27B6:
	ldr r0, _080F27EC
	adds r1, r5, #0
	adds r1, #0xf
	bl StringCopy
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #2
	movs r3, #0
	bl TV_GetNicknameSubstring
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #3
	movs r3, #1
	bl TV_GetNicknameSubstring
	ldr r1, _080F27F0
	movs r0, #0xe
	strb r0, [r1]
	b _080F28E0
	.align 2, 0
_080F27EC: .4byte 0x02021C40
_080F27F0: .4byte 0x02039CFC
_080F27F4:
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #2
	movs r3, #1
	bl TV_GetNicknameSubstring
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #3
	movs r3, #0
	b _080F28BC
_080F2814:
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r1, #0
	movs r2, #2
	movs r3, #1
	bl TV_GetNicknameSubstring
	ldr r0, _080F2850
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2854
	adds r1, r1, r2
	bl StringCopy
	ldrh r0, [r5, #2]
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #3
	movs r3, #2
	bl TV_GetNicknameSubstring
	ldr r1, _080F2858
	movs r0, #0x10
	strb r0, [r1]
	b _080F28E0
	.align 2, 0
_080F2850: .4byte 0x02021C54
_080F2854: .4byte 0x082EA31C
_080F2858: .4byte 0x02039CFC
_080F285C:
	ldrh r0, [r5, #2]
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #2
	movs r3, #2
	bl TV_GetNicknameSubstring
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #3
	movs r3, #1
	bl TV_GetNicknameSubstring
	ldr r1, _080F2888
	movs r0, #0x11
	strb r0, [r1]
	b _080F28E0
	.align 2, 0
_080F2888: .4byte 0x02039CFC
_080F288C:
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r1, #0
	movs r2, #2
	movs r3, #1
	bl TV_GetNicknameSubstring
	ldr r0, _080F28C8
	ldrh r2, [r5, #0x1c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F28CC
	adds r1, r1, r2
	bl StringCopy
	ldrh r0, [r5, #0x1c]
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #3
	movs r3, #2
_080F28BC:
	bl TV_GetNicknameSubstring
	ldr r1, _080F28D0
	movs r0, #0x12
	strb r0, [r1]
	b _080F28E0
	.align 2, 0
_080F28C8: .4byte 0x02021C54
_080F28CC: .4byte 0x082EA31C
_080F28D0: .4byte 0x02039CFC
_080F28D4:
	ldr r0, _080F28F4
	adds r1, r5, #4
	bl StringCopy10
	bl TVShowDone
_080F28E0:
	ldr r0, _080F28F8
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F28F4: .4byte 0x02021C40
_080F28F8: .4byte 0x08568DE4
	thumb_func_end DoTVShowTheNameRaterShow

	thumb_func_start DoTVShowPokemonTodaySuccessfulCapture
DoTVShowPokemonTodaySuccessfulCapture: @ 0x080F28FC
	push {r4, r5, r6, lr}
	ldr r2, _080F2930
	ldr r0, _080F2934
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F2938
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F293C
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F2940
	ldrb r6, [r0]
	adds r2, r0, #0
	cmp r6, #0xb
	bls _080F2924
	b _080F2B38
_080F2924:
	lsls r0, r6, #2
	ldr r1, _080F2944
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2930: .4byte 0x03005AEC
_080F2934: .4byte 0x02037280
_080F2938: .4byte 0x000027CC
_080F293C: .4byte 0x02037290
_080F2940: .4byte 0x02039CFC
_080F2944: .4byte 0x080F2948
_080F2948: @ jump table
	.4byte _080F2978 @ case 0
	.4byte _080F29CC @ case 1
	.4byte _080F29D2 @ case 2
	.4byte _080F2A0C @ case 3
	.4byte _080F2A44 @ case 4
	.4byte _080F2A4A @ case 5
	.4byte _080F2A80 @ case 6
	.4byte _080F2AD0 @ case 7
	.4byte _080F2AD0 @ case 8
	.4byte _080F2B00 @ case 9
	.4byte _080F2B00 @ case 10
	.4byte _080F2B34 @ case 11
_080F2978:
	ldr r0, _080F29AC
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F29B0
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F29B4
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F29B8
	adds r1, r5, #4
	bl StringCopy10
	ldrb r0, [r5, #0xf]
	cmp r0, #1
	bne _080F29C0
	ldr r1, _080F29BC
	movs r0, #5
	strb r0, [r1]
	b _080F2B38
	.align 2, 0
_080F29AC: .4byte 0x02021C40
_080F29B0: .4byte 0x02021C54
_080F29B4: .4byte 0x082EA31C
_080F29B8: .4byte 0x02021C68
_080F29BC: .4byte 0x02039CFC
_080F29C0:
	ldr r1, _080F29C8
	movs r0, #1
	strb r0, [r1]
	b _080F2B38
	.align 2, 0
_080F29C8: .4byte 0x02039CFC
_080F29CC:
	movs r0, #2
	strb r0, [r2]
	b _080F2B38
_080F29D2:
	ldr r4, _080F29F8
	ldrb r0, [r5, #0xf]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrb r1, [r5, #0x12]
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldrb r0, [r5, #0x12]
	cmp r0, #3
	bhi _080F2A00
	ldr r1, _080F29FC
	movs r0, #3
	strb r0, [r1]
	b _080F2B38
	.align 2, 0
_080F29F8: .4byte 0x02021C54
_080F29FC: .4byte 0x02039CFC
_080F2A00:
	ldr r1, _080F2A08
	movs r0, #4
	strb r0, [r1]
	b _080F2B38
	.align 2, 0
_080F2A08: .4byte 0x02039CFC
_080F2A0C:
	ldr r0, _080F2A34
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F2A38
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2A3C
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F2A40
	adds r1, r5, #4
	bl StringCopy10
	b _080F2A66
	.align 2, 0
_080F2A34: .4byte 0x02021C40
_080F2A38: .4byte 0x02021C54
_080F2A3C: .4byte 0x082EA31C
_080F2A40: .4byte 0x02021C68
_080F2A44:
	movs r0, #6
	strb r0, [r2]
	b _080F2B38
_080F2A4A:
	ldr r0, _080F2A70
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F2A74
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2A78
	adds r1, r1, r2
	bl StringCopy
_080F2A66:
	ldr r1, _080F2A7C
	movs r0, #6
	strb r0, [r1]
	b _080F2B38
	.align 2, 0
_080F2A70: .4byte 0x02021C40
_080F2A74: .4byte 0x02021C54
_080F2A78: .4byte 0x082EA31C
_080F2A7C: .4byte 0x02039CFC
_080F2A80:
	ldr r0, _080F2ABC
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F2AC0
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2AC4
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F2AC8
	adds r1, r5, #4
	bl StringCopy10
	ldr r4, _080F2ACC
	bl Random
	ldrb r2, [r4]
	adds r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	ands r0, r1
	adds r0, r0, r2
	strb r0, [r4]
	b _080F2B38
	.align 2, 0
_080F2ABC: .4byte 0x02021C40
_080F2AC0: .4byte 0x02021C54
_080F2AC4: .4byte 0x082EA31C
_080F2AC8: .4byte 0x02021C68
_080F2ACC: .4byte 0x02039CFC
_080F2AD0:
	ldr r0, _080F2AF4
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2AF8
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F2AFC
	adds r1, r5, #4
	bl StringCopy10
	ldrh r1, [r5, #0x10]
	movs r0, #2
	bl TV_GetSomeOtherSpeciesAlreadySeenByPlayer_AndPrintName
	b _080F2B1A
	.align 2, 0
_080F2AF4: .4byte 0x02021C40
_080F2AF8: .4byte 0x082EA31C
_080F2AFC: .4byte 0x02021C54
_080F2B00:
	ldr r0, _080F2B24
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2B28
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F2B2C
	adds r1, r5, #4
	bl StringCopy10
_080F2B1A:
	ldr r1, _080F2B30
	movs r0, #0xb
	strb r0, [r1]
	b _080F2B38
	.align 2, 0
_080F2B24: .4byte 0x02021C40
_080F2B28: .4byte 0x082EA31C
_080F2B2C: .4byte 0x02021C54
_080F2B30: .4byte 0x02039CFC
_080F2B34:
	bl TVShowDone
_080F2B38:
	ldr r0, _080F2B4C
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F2B4C: .4byte 0x08568C4C
	thumb_func_end DoTVShowPokemonTodaySuccessfulCapture

	thumb_func_start DoTVShowPokemonTodayFailedCapture
DoTVShowPokemonTodayFailedCapture: @ 0x080F2B50
	push {r4, r5, lr}
	ldr r2, _080F2B80
	ldr r0, _080F2B84
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F2B88
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F2B8C
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F2B90
	ldrb r5, [r0]
	cmp r5, #6
	bls _080F2B76
	b _080F2CA0
_080F2B76:
	lsls r0, r5, #2
	ldr r1, _080F2B94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2B80: .4byte 0x03005AEC
_080F2B84: .4byte 0x02037280
_080F2B88: .4byte 0x000027CC
_080F2B8C: .4byte 0x02037290
_080F2B90: .4byte 0x02039CFC
_080F2B94: .4byte 0x080F2B98
_080F2B98: @ jump table
	.4byte _080F2BB4 @ case 0
	.4byte _080F2BE8 @ case 1
	.4byte _080F2C3C @ case 2
	.4byte _080F2C3C @ case 3
	.4byte _080F2C80 @ case 4
	.4byte _080F2C80 @ case 5
	.4byte _080F2C9C @ case 6
_080F2BB4:
	ldr r0, _080F2BD8
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F2BDC
	ldrh r2, [r4, #0xc]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2BE0
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _080F2BE4
	movs r0, #1
	strb r0, [r1]
	b _080F2CA0
	.align 2, 0
_080F2BD8: .4byte 0x02021C40
_080F2BDC: .4byte 0x02021C54
_080F2BE0: .4byte 0x082EA31C
_080F2BE4: .4byte 0x02039CFC
_080F2BE8:
	ldr r0, _080F2C1C
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F2C20
	ldrb r1, [r4, #0x12]
	movs r2, #0
	bl GetMapName
	ldr r0, _080F2C24
	ldrh r2, [r4, #0xe]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2C28
	adds r1, r1, r2
	bl StringCopy
	ldrb r0, [r4, #0x11]
	cmp r0, #1
	bne _080F2C30
	ldr r1, _080F2C2C
	movs r0, #3
	strb r0, [r1]
	b _080F2CA0
	.align 2, 0
_080F2C1C: .4byte 0x02021C40
_080F2C20: .4byte 0x02021C54
_080F2C24: .4byte 0x02021C68
_080F2C28: .4byte 0x082EA31C
_080F2C2C: .4byte 0x02039CFC
_080F2C30:
	ldr r1, _080F2C38
	movs r0, #2
	strb r0, [r1]
	b _080F2CA0
	.align 2, 0
_080F2C38: .4byte 0x02039CFC
_080F2C3C:
	ldr r0, _080F2C6C
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r1, [r4, #0x10]
	movs r0, #1
	bl TV_PrintIntToStringVar
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080F2C74
	ldr r1, _080F2C70
	movs r0, #5
	strb r0, [r1]
	b _080F2CA0
	.align 2, 0
_080F2C6C: .4byte 0x02021C40
_080F2C70: .4byte 0x02039CFC
_080F2C74:
	ldr r1, _080F2C7C
	movs r0, #4
	strb r0, [r1]
	b _080F2CA0
	.align 2, 0
_080F2C7C: .4byte 0x02039CFC
_080F2C80:
	ldr r0, _080F2C94
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r1, _080F2C98
	movs r0, #6
	strb r0, [r1]
	b _080F2CA0
	.align 2, 0
_080F2C94: .4byte 0x02021C40
_080F2C98: .4byte 0x02039CFC
_080F2C9C:
	bl TVShowDone
_080F2CA0:
	ldr r0, _080F2CB4
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F2CB4: .4byte 0x08568E40
	thumb_func_end DoTVShowPokemonTodayFailedCapture

	thumb_func_start DoTVShowPokemonFanClubLetter
DoTVShowPokemonFanClubLetter: @ 0x080F2CB8
	push {r4, r5, r6, r7, lr}
	ldr r2, _080F2CEC
	ldr r0, _080F2CF0
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F2CF4
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F2CF8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F2CFC
	ldrb r7, [r0]
	adds r6, r0, #0
	cmp r7, #0x33
	bls _080F2CE0
	b _080F2ED0
_080F2CE0:
	lsls r0, r7, #2
	ldr r1, _080F2D00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2CEC: .4byte 0x03005AEC
_080F2CF0: .4byte 0x02037280
_080F2CF4: .4byte 0x000027CC
_080F2CF8: .4byte 0x02037290
_080F2CFC: .4byte 0x02039CFC
_080F2D00: .4byte 0x080F2D04
_080F2D04: @ jump table
	.4byte _080F2DD4 @ case 0
	.4byte _080F2E08 @ case 1
	.4byte _080F2E34 @ case 2
	.4byte _080F2E3A @ case 3
	.4byte _080F2E52 @ case 4
	.4byte _080F2E52 @ case 5
	.4byte _080F2E52 @ case 6
	.4byte _080F2E64 @ case 7
	.4byte _080F2ED0 @ case 8
	.4byte _080F2ED0 @ case 9
	.4byte _080F2ED0 @ case 10
	.4byte _080F2ED0 @ case 11
	.4byte _080F2ED0 @ case 12
	.4byte _080F2ED0 @ case 13
	.4byte _080F2ED0 @ case 14
	.4byte _080F2ED0 @ case 15
	.4byte _080F2ED0 @ case 16
	.4byte _080F2ED0 @ case 17
	.4byte _080F2ED0 @ case 18
	.4byte _080F2ED0 @ case 19
	.4byte _080F2ED0 @ case 20
	.4byte _080F2ED0 @ case 21
	.4byte _080F2ED0 @ case 22
	.4byte _080F2ED0 @ case 23
	.4byte _080F2ED0 @ case 24
	.4byte _080F2ED0 @ case 25
	.4byte _080F2ED0 @ case 26
	.4byte _080F2ED0 @ case 27
	.4byte _080F2ED0 @ case 28
	.4byte _080F2ED0 @ case 29
	.4byte _080F2ED0 @ case 30
	.4byte _080F2ED0 @ case 31
	.4byte _080F2ED0 @ case 32
	.4byte _080F2ED0 @ case 33
	.4byte _080F2ED0 @ case 34
	.4byte _080F2ED0 @ case 35
	.4byte _080F2ED0 @ case 36
	.4byte _080F2ED0 @ case 37
	.4byte _080F2ED0 @ case 38
	.4byte _080F2ED0 @ case 39
	.4byte _080F2ED0 @ case 40
	.4byte _080F2ED0 @ case 41
	.4byte _080F2ED0 @ case 42
	.4byte _080F2ED0 @ case 43
	.4byte _080F2ED0 @ case 44
	.4byte _080F2ED0 @ case 45
	.4byte _080F2ED0 @ case 46
	.4byte _080F2ED0 @ case 47
	.4byte _080F2ED0 @ case 48
	.4byte _080F2ED0 @ case 49
	.4byte _080F2E86 @ case 50
	.4byte _080F2EAC @ case 51
_080F2DD4:
	ldr r0, _080F2DF8
	adds r1, r5, #0
	adds r1, #0x10
	bl StringCopy
	ldr r0, _080F2DFC
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F2E00
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _080F2E04
	movs r0, #0x32
	strb r0, [r1]
	b _080F2ED0
	.align 2, 0
_080F2DF8: .4byte 0x02021C40
_080F2DFC: .4byte 0x02021C54
_080F2E00: .4byte 0x082EA31C
_080F2E04: .4byte 0x02039CFC
_080F2E08:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	ands r0, r1
	adds r2, r0, #1
	cmp r2, #1
	bne _080F2E28
	ldr r1, _080F2E24
	movs r0, #2
	strb r0, [r1]
	b _080F2ED0
	.align 2, 0
_080F2E24: .4byte 0x02039CFC
_080F2E28:
	ldr r1, _080F2E30
	adds r0, r2, #2
	strb r0, [r1]
	b _080F2ED0
	.align 2, 0
_080F2E30: .4byte 0x02039CFC
_080F2E34:
	movs r0, #0x33
	strb r0, [r6]
	b _080F2ED0
_080F2E3A:
	bl Random
	ldrb r4, [r6]
	adds r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	adds r0, r0, r4
	strb r0, [r6]
	b _080F2ED0
_080F2E52:
	adds r0, r5, #0
	bl TV_FanClubLetter_RandomWordToStringVar3
	ldr r1, _080F2E60
	movs r0, #7
	strb r0, [r1]
	b _080F2ED0
	.align 2, 0
_080F2E60: .4byte 0x02039CFC
_080F2E64:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1f
	bl __umodsi3
	adds r0, #0x46
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	adds r1, r2, #0
	bl TV_PrintIntToStringVar
	bl TVShowDone
	b _080F2ED0
_080F2E86:
	ldr r4, _080F2EA4
	adds r1, r5, #4
	adds r0, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertEasyChatWordsToString
	adds r0, r4, #0
	bl ShowFieldMessage
	ldr r1, _080F2EA8
	movs r0, #1
	strb r0, [r1]
	b _080F2EDC
	.align 2, 0
_080F2EA4: .4byte 0x02021C7C
_080F2EA8: .4byte 0x02039CFC
_080F2EAC:
	ldr r4, _080F2EC8
	adds r1, r5, #4
	adds r0, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertEasyChatWordsToString
	adds r0, r4, #0
	bl ShowFieldMessage
	ldr r1, _080F2ECC
	movs r0, #3
	strb r0, [r1]
	b _080F2EDC
	.align 2, 0
_080F2EC8: .4byte 0x02021C7C
_080F2ECC: .4byte 0x02039CFC
_080F2ED0:
	ldr r0, _080F2EE4
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_080F2EDC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2EE4: .4byte 0x08568BFC
	thumb_func_end DoTVShowPokemonFanClubLetter

	thumb_func_start DoTVShowRecentHappenings
DoTVShowRecentHappenings: @ 0x080F2EE8
	push {r4, r5, r6, r7, lr}
	ldr r2, _080F2F1C
	ldr r0, _080F2F20
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F2F24
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F2F28
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F2F2C
	ldrb r6, [r0]
	adds r7, r0, #0
	cmp r6, #0x32
	bls _080F2F10
	b _080F3068
_080F2F10:
	lsls r0, r6, #2
	ldr r1, _080F2F30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2F1C: .4byte 0x03005AEC
_080F2F20: .4byte 0x02037280
_080F2F24: .4byte 0x000027CC
_080F2F28: .4byte 0x02037290
_080F2F2C: .4byte 0x02039CFC
_080F2F30: .4byte 0x080F2F34
_080F2F34: @ jump table
	.4byte _080F3000 @ case 0
	.4byte _080F3020 @ case 1
	.4byte _080F3038 @ case 2
	.4byte _080F3038 @ case 3
	.4byte _080F3038 @ case 4
	.4byte _080F303E @ case 5
	.4byte _080F3068 @ case 6
	.4byte _080F3068 @ case 7
	.4byte _080F3068 @ case 8
	.4byte _080F3068 @ case 9
	.4byte _080F3068 @ case 10
	.4byte _080F3068 @ case 11
	.4byte _080F3068 @ case 12
	.4byte _080F3068 @ case 13
	.4byte _080F3068 @ case 14
	.4byte _080F3068 @ case 15
	.4byte _080F3068 @ case 16
	.4byte _080F3068 @ case 17
	.4byte _080F3068 @ case 18
	.4byte _080F3068 @ case 19
	.4byte _080F3068 @ case 20
	.4byte _080F3068 @ case 21
	.4byte _080F3068 @ case 22
	.4byte _080F3068 @ case 23
	.4byte _080F3068 @ case 24
	.4byte _080F3068 @ case 25
	.4byte _080F3068 @ case 26
	.4byte _080F3068 @ case 27
	.4byte _080F3068 @ case 28
	.4byte _080F3068 @ case 29
	.4byte _080F3068 @ case 30
	.4byte _080F3068 @ case 31
	.4byte _080F3068 @ case 32
	.4byte _080F3068 @ case 33
	.4byte _080F3068 @ case 34
	.4byte _080F3068 @ case 35
	.4byte _080F3068 @ case 36
	.4byte _080F3068 @ case 37
	.4byte _080F3068 @ case 38
	.4byte _080F3068 @ case 39
	.4byte _080F3068 @ case 40
	.4byte _080F3068 @ case 41
	.4byte _080F3068 @ case 42
	.4byte _080F3068 @ case 43
	.4byte _080F3068 @ case 44
	.4byte _080F3068 @ case 45
	.4byte _080F3068 @ case 46
	.4byte _080F3068 @ case 47
	.4byte _080F3068 @ case 48
	.4byte _080F3068 @ case 49
	.4byte _080F3044 @ case 50
_080F3000:
	ldr r0, _080F3018
	adds r1, r5, #0
	adds r1, #0x10
	bl StringCopy
	adds r0, r5, #0
	bl TV_FanClubLetter_RandomWordToStringVar3
	ldr r1, _080F301C
	movs r0, #0x32
	strb r0, [r1]
	b _080F3068
	.align 2, 0
_080F3018: .4byte 0x02021C40
_080F301C: .4byte 0x02039CFC
_080F3020:
	bl Random
	ldrb r4, [r7]
	adds r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	adds r0, r0, r4
	strb r0, [r7]
	b _080F3068
_080F3038:
	movs r0, #5
	strb r0, [r7]
	b _080F3068
_080F303E:
	bl TVShowDone
	b _080F3068
_080F3044:
	ldr r4, _080F3060
	adds r1, r5, #4
	adds r0, r4, #0
	movs r2, #2
	movs r3, #2
	bl ConvertEasyChatWordsToString
	adds r0, r4, #0
	bl ShowFieldMessage
	ldr r1, _080F3064
	movs r0, #1
	strb r0, [r1]
	b _080F3074
	.align 2, 0
_080F3060: .4byte 0x02021C7C
_080F3064: .4byte 0x02039CFC
_080F3068:
	ldr r0, _080F307C
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_080F3074:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F307C: .4byte 0x08568C1C
	thumb_func_end DoTVShowRecentHappenings

	thumb_func_start DoTVShowPokemonFanClubOpinions
DoTVShowPokemonFanClubOpinions: @ 0x080F3080
	push {r4, r5, r6, lr}
	ldr r2, _080F30B0
	ldr r0, _080F30B4
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F30B8
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F30BC
	movs r0, #0
	strh r0, [r1]
	ldr r6, _080F30C0
	ldrb r5, [r6]
	cmp r5, #3
	bgt _080F30C4
	cmp r5, #1
	bge _080F3108
	cmp r5, #0
	beq _080F30CA
	b _080F3154
	.align 2, 0
_080F30B0: .4byte 0x03005AEC
_080F30B4: .4byte 0x02037280
_080F30B8: .4byte 0x000027CC
_080F30BC: .4byte 0x02037290
_080F30C0: .4byte 0x02039CFC
_080F30C4:
	cmp r5, #4
	beq _080F3140
	b _080F3154
_080F30CA:
	ldr r0, _080F30F8
	adds r1, r4, #5
	bl StringCopy
	ldr r0, _080F30FC
	ldrh r2, [r4, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3100
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F3104
	adds r1, r4, #0
	adds r1, #0x10
	bl StringCopy10
	ldrb r0, [r4, #4]
	lsrs r0, r0, #4
	adds r0, #1
	strb r0, [r6]
	b _080F3154
	.align 2, 0
_080F30F8: .4byte 0x02021C40
_080F30FC: .4byte 0x02021C54
_080F3100: .4byte 0x082EA31C
_080F3104: .4byte 0x02021C68
_080F3108:
	ldr r0, _080F3130
	adds r1, r4, #5
	bl StringCopy
	ldr r0, _080F3134
	ldrh r2, [r4, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3138
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F313C
	ldrh r1, [r4, #0x1c]
	bl CopyEasyChatWord
	movs r0, #4
	strb r0, [r6]
	b _080F3154
	.align 2, 0
_080F3130: .4byte 0x02021C40
_080F3134: .4byte 0x02021C54
_080F3138: .4byte 0x082EA31C
_080F313C: .4byte 0x02021C68
_080F3140:
	ldr r0, _080F3168
	adds r1, r4, #5
	bl StringCopy
	ldr r0, _080F316C
	ldrh r1, [r4, #0x1e]
	bl CopyEasyChatWord
	bl TVShowDone
_080F3154:
	ldr r0, _080F3170
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F3168: .4byte 0x02021C40
_080F316C: .4byte 0x02021C68
_080F3170: .4byte 0x08568C34
	thumb_func_end DoTVShowPokemonFanClubOpinions

	thumb_func_start DoTVShowDummiedOut
DoTVShowDummiedOut: @ 0x080F3174
	bx lr
	.align 2, 0
	thumb_func_end DoTVShowDummiedOut

	thumb_func_start DoTVShowPokemonNewsMassOutbreak
DoTVShowPokemonNewsMassOutbreak: @ 0x080F3178
	push {r4, lr}
	ldr r2, _080F31C8
	ldr r0, _080F31CC
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F31D0
	adds r0, r0, r1
	ldr r4, [r2]
	adds r4, r4, r0
	ldr r0, _080F31D4
	ldrb r1, [r4, #0x10]
	movs r2, #0
	bl GetMapName
	ldr r0, _080F31D8
	ldrh r2, [r4, #0xc]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F31DC
	adds r1, r1, r2
	bl StringCopy
	bl TVShowDone
	bl StartMassOutbreak
	ldr r1, _080F31E0
	ldr r0, _080F31E4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F31C8: .4byte 0x03005AEC
_080F31CC: .4byte 0x02037280
_080F31D0: .4byte 0x000027CC
_080F31D4: .4byte 0x02021C40
_080F31D8: .4byte 0x02021C54
_080F31DC: .4byte 0x082EA31C
_080F31E0: .4byte 0x08568C48
_080F31E4: .4byte 0x02039CFC
	thumb_func_end DoTVShowPokemonNewsMassOutbreak

	thumb_func_start DoTVShowPokemonContestLiveUpdates
DoTVShowPokemonContestLiveUpdates: @ 0x080F31E8
	push {r4, r5, r6, lr}
	ldr r2, _080F321C
	ldr r0, _080F3220
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F3224
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F3228
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F322C
	ldrb r6, [r0]
	adds r2, r0, #0
	cmp r6, #0x20
	bls _080F3212
	bl _080F39A8
_080F3212:
	lsls r0, r6, #2
	ldr r1, _080F3230
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F321C: .4byte 0x03005AEC
_080F3220: .4byte 0x02037280
_080F3224: .4byte 0x000027CC
_080F3228: .4byte 0x02037290
_080F322C: .4byte 0x02039CFC
_080F3230: .4byte 0x080F3234
_080F3234: @ jump table
	.4byte _080F32B8 @ case 0
	.4byte _080F33A8 @ case 1
	.4byte _080F33F6 @ case 2
	.4byte _080F3420 @ case 3
	.4byte _080F3448 @ case 4
	.4byte _080F3584 @ case 5
	.4byte _080F359C @ case 6
	.4byte _080F35B4 @ case 7
	.4byte _080F35CC @ case 8
	.4byte _080F364C @ case 9
	.4byte _080F3664 @ case 10
	.4byte _080F367C @ case 11
	.4byte _080F3694 @ case 12
	.4byte _080F36AC @ case 13
	.4byte _080F36C4 @ case 14
	.4byte _080F3744 @ case 15
	.4byte _080F375C @ case 16
	.4byte _080F3774 @ case 17
	.4byte _080F378C @ case 18
	.4byte _080F37A4 @ case 19
	.4byte _080F37BC @ case 20
	.4byte _080F37D4 @ case 21
	.4byte _080F37EC @ case 22
	.4byte _080F3828 @ case 23
	.4byte _080F38FC @ case 24
	.4byte _080F3914 @ case 25
	.4byte _080F3970 @ case 26
	.4byte _080F3970 @ case 27
	.4byte _080F3938 @ case 28
	.4byte _080F393E @ case 29
	.4byte _080F3970 @ case 30
	.4byte _080F3970 @ case 31
	.4byte _080F3988 @ case 32
_080F32B8:
	ldrb r0, [r5, #0x1c]
	cmp r0, #4
	bhi _080F3338
	lsls r0, r0, #2
	ldr r1, _080F32C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F32C8: .4byte 0x080F32CC
_080F32CC: @ jump table
	.4byte _080F32E0 @ case 0
	.4byte _080F32F4 @ case 1
	.4byte _080F3308 @ case 2
	.4byte _080F331C @ case 3
	.4byte _080F3330 @ case 4
_080F32E0:
	ldr r0, _080F32EC
	ldr r1, _080F32F0
	bl StringCopy
	b _080F3338
	.align 2, 0
_080F32EC: .4byte 0x02021C40
_080F32F0: .4byte 0x085CAC84
_080F32F4:
	ldr r0, _080F3300
	ldr r1, _080F3304
	bl StringCopy
	b _080F3338
	.align 2, 0
_080F3300: .4byte 0x02021C40
_080F3304: .4byte 0x085CAC8A
_080F3308:
	ldr r0, _080F3314
	ldr r1, _080F3318
	bl StringCopy
	b _080F3338
	.align 2, 0
_080F3314: .4byte 0x02021C40
_080F3318: .4byte 0x085CAC90
_080F331C:
	ldr r0, _080F3328
	ldr r1, _080F332C
	bl StringCopy
	b _080F3338
	.align 2, 0
_080F3328: .4byte 0x02021C40
_080F332C: .4byte 0x085CAC95
_080F3330:
	ldr r0, _080F3368
	ldr r1, _080F336C
	bl StringCopy
_080F3338:
	ldr r0, _080F3370
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3374
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F3378
	adds r1, r5, #0
	adds r1, #0x14
	bl StringCopy
	ldrb r0, [r5, #0xd]
	ldrb r1, [r5, #0xe]
	cmp r0, r1
	bne _080F338C
	cmp r0, #0
	bne _080F3380
	ldr r1, _080F337C
	movs r0, #1
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3368: .4byte 0x02021C40
_080F336C: .4byte 0x085CAC9A
_080F3370: .4byte 0x02021C54
_080F3374: .4byte 0x082EA31C
_080F3378: .4byte 0x02021C68
_080F337C: .4byte 0x02039CFC
_080F3380:
	ldr r1, _080F3388
	movs r0, #3
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3388: .4byte 0x02039CFC
_080F338C:
	cmp r0, r1
	bls _080F339C
	ldr r1, _080F3398
	movs r0, #2
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3398: .4byte 0x02039CFC
_080F339C:
	ldr r1, _080F33A4
	movs r0, #4
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F33A4: .4byte 0x02039CFC
_080F33A8:
	ldr r0, _080F33D4
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F33D8
	adds r1, r1, r2
	bl StringCopy
	ldrb r1, [r5, #0xf]
	cmp r1, #8
	bne _080F33C2
	b _080F3548
_080F33C2:
	cmp r1, #8
	bgt _080F33DC
_080F33C6:
	cmp r1, #2
	bne _080F33CC
	b _080F3530
_080F33CC:
	cmp r1, #2
	bgt _080F33D2
	b _080F34EC
_080F33D2:
	b _080F3504
	.align 2, 0
_080F33D4: .4byte 0x02021C54
_080F33D8: .4byte 0x082EA31C
_080F33DC:
	cmp r1, #0x20
	bne _080F33E2
	b _080F3560
_080F33E2:
	cmp r1, #0x20
	bgt _080F33E8
	b _080F3512
_080F33E8:
	cmp r1, #0x40
	bne _080F33EE
	b _080F356C
_080F33EE:
	cmp r1, #0x80
	beq _080F33F4
	b _080F39A8
_080F33F4:
	b _080F3578
_080F33F6:
	ldr r0, _080F3418
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F341C
	adds r1, r1, r2
_080F3404:
	bl StringCopy
	ldrb r1, [r5, #0xf]
	cmp r1, #8
	bne _080F3410
	b _080F3548
_080F3410:
	cmp r1, #8
	ble _080F33C6
	b _080F33DC
	.align 2, 0
_080F3418: .4byte 0x02021C54
_080F341C: .4byte 0x082EA31C
_080F3420:
	ldr r0, _080F343C
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3440
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F3444
	adds r1, r5, #0
	adds r1, #0x14
	b _080F3404
	.align 2, 0
_080F343C: .4byte 0x02021C54
_080F3440: .4byte 0x082EA31C
_080F3444: .4byte 0x02021C68
_080F3448:
	ldrb r0, [r5, #0x1c]
	cmp r0, #4
	bhi _080F34C8
	lsls r0, r0, #2
	ldr r1, _080F3458
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F3458: .4byte 0x080F345C
_080F345C: @ jump table
	.4byte _080F3470 @ case 0
	.4byte _080F3484 @ case 1
	.4byte _080F3498 @ case 2
	.4byte _080F34AC @ case 3
	.4byte _080F34C0 @ case 4
_080F3470:
	ldr r0, _080F347C
	ldr r1, _080F3480
	bl StringCopy
	b _080F34C8
	.align 2, 0
_080F347C: .4byte 0x02021C40
_080F3480: .4byte 0x085CAC84
_080F3484:
	ldr r0, _080F3490
	ldr r1, _080F3494
	bl StringCopy
	b _080F34C8
	.align 2, 0
_080F3490: .4byte 0x02021C40
_080F3494: .4byte 0x085CAC8A
_080F3498:
	ldr r0, _080F34A4
	ldr r1, _080F34A8
	bl StringCopy
	b _080F34C8
	.align 2, 0
_080F34A4: .4byte 0x02021C40
_080F34A8: .4byte 0x085CAC90
_080F34AC:
	ldr r0, _080F34B8
	ldr r1, _080F34BC
	bl StringCopy
	b _080F34C8
	.align 2, 0
_080F34B8: .4byte 0x02021C40
_080F34BC: .4byte 0x085CAC95
_080F34C0:
	ldr r0, _080F34F4
	ldr r1, _080F34F8
	bl StringCopy
_080F34C8:
	ldr r0, _080F34FC
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3500
	adds r1, r1, r2
	bl StringCopy
	ldrb r1, [r5, #0xf]
	cmp r1, #8
	beq _080F3548
	cmp r1, #8
	bgt _080F350A
	cmp r1, #2
	beq _080F3530
	cmp r1, #2
	bgt _080F3504
_080F34EC:
	cmp r1, #1
	beq _080F3522
	b _080F39A8
	.align 2, 0
_080F34F4: .4byte 0x02021C40
_080F34F8: .4byte 0x085CAC9A
_080F34FC: .4byte 0x02021C54
_080F3500: .4byte 0x082EA31C
_080F3504:
	cmp r1, #4
	beq _080F353C
	b _080F39A8
_080F350A:
	cmp r1, #0x20
	beq _080F3560
	cmp r1, #0x20
	bgt _080F3518
_080F3512:
	cmp r1, #0x10
	beq _080F3554
	b _080F39A8
_080F3518:
	cmp r1, #0x40
	beq _080F356C
	cmp r1, #0x80
	beq _080F3578
	b _080F39A8
_080F3522:
	ldr r1, _080F352C
	movs r0, #8
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F352C: .4byte 0x02039CFC
_080F3530:
	ldr r1, _080F3538
	movs r0, #5
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3538: .4byte 0x02039CFC
_080F353C:
	ldr r1, _080F3544
	movs r0, #0xe
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3544: .4byte 0x02039CFC
_080F3548:
	ldr r1, _080F3550
	movs r0, #7
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3550: .4byte 0x02039CFC
_080F3554:
	ldr r1, _080F355C
	movs r0, #6
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F355C: .4byte 0x02039CFC
_080F3560:
	ldr r1, _080F3568
	movs r0, #0x14
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3568: .4byte 0x02039CFC
_080F356C:
	ldr r1, _080F3574
	movs r0, #0x15
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3574: .4byte 0x02039CFC
_080F3578:
	ldr r1, _080F3580
	movs r0, #0x16
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3580: .4byte 0x02039CFC
_080F3584:
	ldr r0, _080F3594
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3598
	b _080F3806
	.align 2, 0
_080F3594: .4byte 0x02021C54
_080F3598: .4byte 0x082EA31C
_080F359C:
	ldr r0, _080F35AC
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F35B0
	b _080F3806
	.align 2, 0
_080F35AC: .4byte 0x02021C54
_080F35B0: .4byte 0x082EA31C
_080F35B4:
	ldr r0, _080F35C4
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F35C8
	b _080F3806
	.align 2, 0
_080F35C4: .4byte 0x02021C54
_080F35C8: .4byte 0x082EA31C
_080F35CC:
	ldr r0, _080F35F0
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F35F4
	adds r1, r1, r2
	bl StringCopy
	ldrb r0, [r5, #0x1c]
	cmp r0, #4
	bls _080F35E6
	b _080F39A8
_080F35E6:
	lsls r0, r0, #2
	ldr r1, _080F35F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F35F0: .4byte 0x02021C54
_080F35F4: .4byte 0x082EA31C
_080F35F8: .4byte 0x080F35FC
_080F35FC: @ jump table
	.4byte _080F3610 @ case 0
	.4byte _080F361C @ case 1
	.4byte _080F3628 @ case 2
	.4byte _080F3634 @ case 3
	.4byte _080F3640 @ case 4
_080F3610:
	ldr r1, _080F3618
	movs r0, #9
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3618: .4byte 0x02039CFC
_080F361C:
	ldr r1, _080F3624
	movs r0, #0xa
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3624: .4byte 0x02039CFC
_080F3628:
	ldr r1, _080F3630
	movs r0, #0xb
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3630: .4byte 0x02039CFC
_080F3634:
	ldr r1, _080F363C
	movs r0, #0xc
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F363C: .4byte 0x02039CFC
_080F3640:
	ldr r1, _080F3648
	movs r0, #0xd
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3648: .4byte 0x02039CFC
_080F364C:
	ldr r0, _080F365C
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3660
	b _080F3806
	.align 2, 0
_080F365C: .4byte 0x02021C54
_080F3660: .4byte 0x082EA31C
_080F3664:
	ldr r0, _080F3674
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3678
	b _080F3806
	.align 2, 0
_080F3674: .4byte 0x02021C54
_080F3678: .4byte 0x082EA31C
_080F367C:
	ldr r0, _080F368C
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3690
	b _080F3806
	.align 2, 0
_080F368C: .4byte 0x02021C54
_080F3690: .4byte 0x082EA31C
_080F3694:
	ldr r0, _080F36A4
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F36A8
	b _080F3806
	.align 2, 0
_080F36A4: .4byte 0x02021C54
_080F36A8: .4byte 0x082EA31C
_080F36AC:
	ldr r0, _080F36BC
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F36C0
	b _080F3806
	.align 2, 0
_080F36BC: .4byte 0x02021C54
_080F36C0: .4byte 0x082EA31C
_080F36C4:
	ldr r0, _080F36E8
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F36EC
	adds r1, r1, r2
	bl StringCopy
	ldrb r0, [r5, #0x1c]
	cmp r0, #4
	bls _080F36DE
	b _080F39A8
_080F36DE:
	lsls r0, r0, #2
	ldr r1, _080F36F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F36E8: .4byte 0x02021C54
_080F36EC: .4byte 0x082EA31C
_080F36F0: .4byte 0x080F36F4
_080F36F4: @ jump table
	.4byte _080F3708 @ case 0
	.4byte _080F3714 @ case 1
	.4byte _080F3720 @ case 2
	.4byte _080F372C @ case 3
	.4byte _080F3738 @ case 4
_080F3708:
	ldr r1, _080F3710
	movs r0, #0xf
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3710: .4byte 0x02039CFC
_080F3714:
	ldr r1, _080F371C
	movs r0, #0x10
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F371C: .4byte 0x02039CFC
_080F3720:
	ldr r1, _080F3728
	movs r0, #0x11
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3728: .4byte 0x02039CFC
_080F372C:
	ldr r1, _080F3734
	movs r0, #0x12
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3734: .4byte 0x02039CFC
_080F3738:
	ldr r1, _080F3740
	movs r0, #0x13
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3740: .4byte 0x02039CFC
_080F3744:
	ldr r0, _080F3754
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3758
	b _080F3806
	.align 2, 0
_080F3754: .4byte 0x02021C54
_080F3758: .4byte 0x082EA31C
_080F375C:
	ldr r0, _080F376C
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3770
	b _080F3806
	.align 2, 0
_080F376C: .4byte 0x02021C54
_080F3770: .4byte 0x082EA31C
_080F3774:
	ldr r0, _080F3784
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3788
	b _080F3806
	.align 2, 0
_080F3784: .4byte 0x02021C54
_080F3788: .4byte 0x082EA31C
_080F378C:
	ldr r0, _080F379C
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F37A0
	b _080F3806
	.align 2, 0
_080F379C: .4byte 0x02021C54
_080F37A0: .4byte 0x082EA31C
_080F37A4:
	ldr r0, _080F37B4
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F37B8
	b _080F3806
	.align 2, 0
_080F37B4: .4byte 0x02021C54
_080F37B8: .4byte 0x082EA31C
_080F37BC:
	ldr r0, _080F37CC
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F37D0
	b _080F3806
	.align 2, 0
_080F37CC: .4byte 0x02021C54
_080F37D0: .4byte 0x082EA31C
_080F37D4:
	ldr r0, _080F37E4
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F37E8
	b _080F3806
	.align 2, 0
_080F37E4: .4byte 0x02021C54
_080F37E8: .4byte 0x082EA31C
_080F37EC:
	ldr r0, _080F3814
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3818
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F381C
	ldrh r1, [r5, #0x10]
	lsls r1, r1, #3
	ldr r2, _080F3820
_080F3806:
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _080F3824
	movs r0, #0x17
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3814: .4byte 0x02021C54
_080F3818: .4byte 0x082EA31C
_080F381C: .4byte 0x02021C68
_080F3820: .4byte 0x082EACC4
_080F3824: .4byte 0x02039CFC
_080F3828:
	ldr r0, _080F386C
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _080F3870
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F3874
	adds r1, r5, #4
	bl StringCopy
	ldr r0, _080F3878
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl StringCopy
	ldrb r0, [r5, #0xc]
	cmp r0, #8
	beq _080F38C0
	cmp r0, #8
	bgt _080F3882
	cmp r0, #2
	beq _080F38A8
	cmp r0, #2
	bgt _080F387C
	cmp r0, #1
	beq _080F389A
	b _080F39A8
	.align 2, 0
_080F386C: .4byte 0x02021C40
_080F3870: .4byte 0x082EA31C
_080F3874: .4byte 0x02021C54
_080F3878: .4byte 0x02021C68
_080F387C:
	cmp r0, #4
	beq _080F38B4
	b _080F39A8
_080F3882:
	cmp r0, #0x20
	beq _080F38D8
	cmp r0, #0x20
	bgt _080F3890
	cmp r0, #0x10
	beq _080F38CC
	b _080F39A8
_080F3890:
	cmp r0, #0x40
	beq _080F38E4
	cmp r0, #0x80
	beq _080F38F0
	b _080F39A8
_080F389A:
	ldr r1, _080F38A4
	movs r0, #0x1f
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F38A4: .4byte 0x02039CFC
_080F38A8:
	ldr r1, _080F38B0
	movs r0, #0x1e
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F38B0: .4byte 0x02039CFC
_080F38B4:
	ldr r1, _080F38BC
	movs r0, #0x1d
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F38BC: .4byte 0x02039CFC
_080F38C0:
	ldr r1, _080F38C8
	movs r0, #0x1c
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F38C8: .4byte 0x02039CFC
_080F38CC:
	ldr r1, _080F38D4
	movs r0, #0x1b
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F38D4: .4byte 0x02039CFC
_080F38D8:
	ldr r1, _080F38E0
	movs r0, #0x1a
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F38E0: .4byte 0x02039CFC
_080F38E4:
	ldr r1, _080F38EC
	movs r0, #0x19
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F38EC: .4byte 0x02039CFC
_080F38F0:
	ldr r1, _080F38F8
	movs r0, #0x18
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F38F8: .4byte 0x02039CFC
_080F38FC:
	ldr r0, _080F390C
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3910
	adds r1, r1, r2
	b _080F3974
	.align 2, 0
_080F390C: .4byte 0x02021C40
_080F3910: .4byte 0x082EA31C
_080F3914:
	ldr r0, _080F392C
	adds r1, r5, #4
	bl StringCopy
	ldr r0, _080F3930
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3934
	adds r1, r1, r2
	b _080F3974
	.align 2, 0
_080F392C: .4byte 0x02021C40
_080F3930: .4byte 0x02021C54
_080F3934: .4byte 0x082EA31C
_080F3938:
	movs r0, #0x20
	strb r0, [r2]
	b _080F39A8
_080F393E:
	ldr r0, _080F3960
	adds r1, r5, #0
	adds r1, #0x14
	bl StringCopy
	ldr r0, _080F3964
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3968
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F396C
	b _080F3972
	.align 2, 0
_080F3960: .4byte 0x02021C40
_080F3964: .4byte 0x02021C54
_080F3968: .4byte 0x082EA31C
_080F396C: .4byte 0x02021C68
_080F3970:
	ldr r0, _080F3980
_080F3972:
	adds r1, r5, #4
_080F3974:
	bl StringCopy
	ldr r1, _080F3984
	movs r0, #0x20
	strb r0, [r1]
	b _080F39A8
	.align 2, 0
_080F3980: .4byte 0x02021C40
_080F3984: .4byte 0x02039CFC
_080F3988:
	ldr r0, _080F39BC
	adds r1, r5, #0
	adds r1, #0x14
	bl StringCopy
	ldr r0, _080F39C0
	ldrh r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F39C4
	adds r1, r1, r2
	bl StringCopy
	bl TVShowDone
_080F39A8:
	ldr r0, _080F39C8
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F39BC: .4byte 0x02021C40
_080F39C0: .4byte 0x02021C54
_080F39C4: .4byte 0x082EA31C
_080F39C8: .4byte 0x08568D28
	thumb_func_end DoTVShowPokemonContestLiveUpdates

	thumb_func_start DoTVShowPokemonBattleUpdate
DoTVShowPokemonBattleUpdate: @ 0x080F39CC
	push {r4, r5, lr}
	ldr r2, _080F3A00
	ldr r0, _080F3A04
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F3A08
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F3A0C
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F3A10
	ldrb r5, [r0]
	adds r2, r0, #0
	cmp r5, #7
	bls _080F39F4
	b _080F3BD8
_080F39F4:
	lsls r0, r5, #2
	ldr r1, _080F3A14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F3A00: .4byte 0x03005AEC
_080F3A04: .4byte 0x02037280
_080F3A08: .4byte 0x000027CC
_080F3A0C: .4byte 0x02037290
_080F3A10: .4byte 0x02039CFC
_080F3A14: .4byte 0x080F3A18
_080F3A18: @ jump table
	.4byte _080F3A38 @ case 0
	.4byte _080F3A56 @ case 1
	.4byte _080F3AA4 @ case 2
	.4byte _080F3AEC @ case 3
	.4byte _080F3B20 @ case 4
	.4byte _080F3B40 @ case 5
	.4byte _080F3B68 @ case 6
	.4byte _080F3BB0 @ case 7
_080F3A38:
	ldrb r1, [r4, #0x18]
	cmp r1, #0
	bge _080F3A40
	b _080F3BD8
_080F3A40:
	cmp r1, #1
	ble _080F3A4A
	cmp r1, #2
	beq _080F3A50
	b _080F3BD8
_080F3A4A:
	movs r0, #1
	strb r0, [r2]
	b _080F3BD8
_080F3A50:
	movs r0, #5
	strb r0, [r2]
	b _080F3BD8
_080F3A56:
	ldr r0, _080F3A78
	adds r1, r4, #4
	bl StringCopy
	ldr r0, _080F3A7C
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080F3A88
	ldr r0, _080F3A80
	ldr r1, _080F3A84
	bl StringCopy
	b _080F3A90
	.align 2, 0
_080F3A78: .4byte 0x02021C40
_080F3A7C: .4byte 0x02021C54
_080F3A80: .4byte 0x02021C68
_080F3A84: .4byte 0x085CBFE3
_080F3A88:
	ldr r0, _080F3A98
	ldr r1, _080F3A9C
	bl StringCopy
_080F3A90:
	ldr r1, _080F3AA0
	movs r0, #2
	strb r0, [r1]
	b _080F3BD8
	.align 2, 0
_080F3A98: .4byte 0x02021C68
_080F3A9C: .4byte 0x085CBFE8
_080F3AA0: .4byte 0x02039CFC
_080F3AA4:
	ldr r0, _080F3AD4
	adds r1, r4, #4
	bl StringCopy
	ldr r0, _080F3AD8
	ldrh r2, [r4, #0x16]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3ADC
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F3AE0
	ldrh r1, [r4, #0x14]
	lsls r1, r1, #3
	ldr r2, _080F3AE4
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _080F3AE8
	movs r0, #3
	strb r0, [r1]
	b _080F3BD8
	.align 2, 0
_080F3AD4: .4byte 0x02021C40
_080F3AD8: .4byte 0x02021C54
_080F3ADC: .4byte 0x082EA31C
_080F3AE0: .4byte 0x02021C68
_080F3AE4: .4byte 0x082EACC4
_080F3AE8: .4byte 0x02039CFC
_080F3AEC:
	ldr r0, _080F3B10
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r0, _080F3B14
	ldrh r2, [r4, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3B18
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _080F3B1C
	movs r0, #4
	strb r0, [r1]
	b _080F3BD8
	.align 2, 0
_080F3B10: .4byte 0x02021C40
_080F3B14: .4byte 0x02021C54
_080F3B18: .4byte 0x082EA31C
_080F3B1C: .4byte 0x02039CFC
_080F3B20:
	ldr r0, _080F3B38
	adds r1, r4, #4
	bl StringCopy
	ldr r0, _080F3B3C
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	bl TVShowDone
	b _080F3BD8
	.align 2, 0
_080F3B38: .4byte 0x02021C40
_080F3B3C: .4byte 0x02021C54
_080F3B40:
	ldr r0, _080F3B5C
	adds r1, r4, #4
	bl StringCopy
	ldr r0, _080F3B60
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r1, _080F3B64
	movs r0, #6
	strb r0, [r1]
	b _080F3BD8
	.align 2, 0
_080F3B5C: .4byte 0x02021C40
_080F3B60: .4byte 0x02021C54
_080F3B64: .4byte 0x02039CFC
_080F3B68:
	ldr r0, _080F3B98
	adds r1, r4, #4
	bl StringCopy
	ldr r0, _080F3B9C
	ldrh r2, [r4, #0x16]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3BA0
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F3BA4
	ldrh r1, [r4, #0x14]
	lsls r1, r1, #3
	ldr r2, _080F3BA8
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _080F3BAC
	movs r0, #7
	strb r0, [r1]
	b _080F3BD8
	.align 2, 0
_080F3B98: .4byte 0x02021C40
_080F3B9C: .4byte 0x02021C54
_080F3BA0: .4byte 0x082EA31C
_080F3BA4: .4byte 0x02021C68
_080F3BA8: .4byte 0x082EACC4
_080F3BAC: .4byte 0x02039CFC
_080F3BB0:
	ldr r0, _080F3BEC
	adds r1, r4, #4
	bl StringCopy
	ldr r0, _080F3BF0
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r0, _080F3BF4
	ldrh r2, [r4, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F3BF8
	adds r1, r1, r2
	bl StringCopy
	bl TVShowDone
_080F3BD8:
	ldr r0, _080F3BFC
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F3BEC: .4byte 0x02021C40
_080F3BF0: .4byte 0x02021C54
_080F3BF4: .4byte 0x02021C68
_080F3BF8: .4byte 0x082EA31C
_080F3BFC: .4byte 0x08568DAC
	thumb_func_end DoTVShowPokemonBattleUpdate

	thumb_func_start DoTVShow3CheersForPokeblocks
DoTVShow3CheersForPokeblocks: @ 0x080F3C00
	push {r4, r5, lr}
	ldr r2, _080F3C30
	ldr r0, _080F3C34
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F3C38
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F3C3C
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F3C40
	ldrb r5, [r0]
	cmp r5, #5
	bls _080F3C26
	b _080F3E94
_080F3C26:
	lsls r0, r5, #2
	ldr r1, _080F3C44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F3C30: .4byte 0x03005AEC
_080F3C34: .4byte 0x02037280
_080F3C38: .4byte 0x000027CC
_080F3C3C: .4byte 0x02037290
_080F3C40: .4byte 0x02039CFC
_080F3C44: .4byte 0x080F3C48
_080F3C48: @ jump table
	.4byte _080F3C60 @ case 0
	.4byte _080F3C8C @ case 1
	.4byte _080F3D74 @ case 2
	.4byte _080F3D80 @ case 3
	.4byte _080F3E68 @ case 4
	.4byte _080F3E90 @ case 5
_080F3C60:
	ldr r0, _080F3C78
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldrb r0, [r4, #2]
	cmp r0, #0x14
	bls _080F3C80
	ldr r1, _080F3C7C
	movs r0, #1
	strb r0, [r1]
	b _080F3E94
	.align 2, 0
_080F3C78: .4byte 0x02021C40
_080F3C7C: .4byte 0x02039CFC
_080F3C80:
	ldr r1, _080F3C88
	movs r0, #3
	strb r0, [r1]
	b _080F3E94
	.align 2, 0
_080F3C88: .4byte 0x02039CFC
_080F3C8C:
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #4
	bhi _080F3D10
	lsls r0, r0, #2
	ldr r1, _080F3CA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F3CA0: .4byte 0x080F3CA4
_080F3CA4: @ jump table
	.4byte _080F3CB8 @ case 0
	.4byte _080F3CCC @ case 1
	.4byte _080F3CE0 @ case 2
	.4byte _080F3CF4 @ case 3
	.4byte _080F3D08 @ case 4
_080F3CB8:
	ldr r0, _080F3CC4
	ldr r1, _080F3CC8
	bl StringCopy
	b _080F3D10
	.align 2, 0
_080F3CC4: .4byte 0x02021C40
_080F3CC8: .4byte 0x085CBFD3
_080F3CCC:
	ldr r0, _080F3CD8
	ldr r1, _080F3CDC
	bl StringCopy
	b _080F3D10
	.align 2, 0
_080F3CD8: .4byte 0x02021C40
_080F3CDC: .4byte 0x085CBFD6
_080F3CE0:
	ldr r0, _080F3CEC
	ldr r1, _080F3CF0
	bl StringCopy
	b _080F3D10
	.align 2, 0
_080F3CEC: .4byte 0x02021C40
_080F3CF0: .4byte 0x085CBFD9
_080F3CF4:
	ldr r0, _080F3D00
	ldr r1, _080F3D04
	bl StringCopy
	b _080F3D10
	.align 2, 0
_080F3D00: .4byte 0x02021C40
_080F3D04: .4byte 0x085CBFDC
_080F3D08:
	ldr r0, _080F3D20
	ldr r1, _080F3D24
	bl StringCopy
_080F3D10:
	ldrb r0, [r4, #2]
	cmp r0, #0x18
	bls _080F3D30
	ldr r0, _080F3D28
	ldr r1, _080F3D2C
	bl StringCopy
	b _080F3D50
	.align 2, 0
_080F3D20: .4byte 0x02021C40
_080F3D24: .4byte 0x085CBFDF
_080F3D28: .4byte 0x02021C54
_080F3D2C: .4byte 0x085CBFC0
_080F3D30:
	cmp r0, #0x16
	bls _080F3D48
	ldr r0, _080F3D40
	ldr r1, _080F3D44
	bl StringCopy
	b _080F3D50
	.align 2, 0
_080F3D40: .4byte 0x02021C54
_080F3D44: .4byte 0x085CBFBB
_080F3D48:
	ldr r0, _080F3D64
	ldr r1, _080F3D68
	bl StringCopy
_080F3D50:
	ldr r0, _080F3D6C
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r1, _080F3D70
	movs r0, #2
	strb r0, [r1]
	b _080F3E94
	.align 2, 0
_080F3D64: .4byte 0x02021C54
_080F3D68: .4byte 0x085CBFB8
_080F3D6C: .4byte 0x02021C68
_080F3D70: .4byte 0x02039CFC
_080F3D74:
	ldr r0, _080F3D7C
	adds r1, r4, #4
	b _080F3E76
	.align 2, 0
_080F3D7C: .4byte 0x02021C40
_080F3D80:
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #4
	bhi _080F3E04
	lsls r0, r0, #2
	ldr r1, _080F3D94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F3D94: .4byte 0x080F3D98
_080F3D98: @ jump table
	.4byte _080F3DAC @ case 0
	.4byte _080F3DC0 @ case 1
	.4byte _080F3DD4 @ case 2
	.4byte _080F3DE8 @ case 3
	.4byte _080F3DFC @ case 4
_080F3DAC:
	ldr r0, _080F3DB8
	ldr r1, _080F3DBC
	bl StringCopy
	b _080F3E04
	.align 2, 0
_080F3DB8: .4byte 0x02021C40
_080F3DBC: .4byte 0x085CBFD3
_080F3DC0:
	ldr r0, _080F3DCC
	ldr r1, _080F3DD0
	bl StringCopy
	b _080F3E04
	.align 2, 0
_080F3DCC: .4byte 0x02021C40
_080F3DD0: .4byte 0x085CBFD6
_080F3DD4:
	ldr r0, _080F3DE0
	ldr r1, _080F3DE4
	bl StringCopy
	b _080F3E04
	.align 2, 0
_080F3DE0: .4byte 0x02021C40
_080F3DE4: .4byte 0x085CBFD9
_080F3DE8:
	ldr r0, _080F3DF4
	ldr r1, _080F3DF8
	bl StringCopy
	b _080F3E04
	.align 2, 0
_080F3DF4: .4byte 0x02021C40
_080F3DF8: .4byte 0x085CBFDC
_080F3DFC:
	ldr r0, _080F3E14
	ldr r1, _080F3E18
	bl StringCopy
_080F3E04:
	ldrb r0, [r4, #2]
	cmp r0, #0x10
	bls _080F3E24
	ldr r0, _080F3E1C
	ldr r1, _080F3E20
	bl StringCopy
	b _080F3E44
	.align 2, 0
_080F3E14: .4byte 0x02021C40
_080F3E18: .4byte 0x085CBFDF
_080F3E1C: .4byte 0x02021C54
_080F3E20: .4byte 0x085CBFC5
_080F3E24:
	cmp r0, #0xd
	bls _080F3E3C
	ldr r0, _080F3E34
	ldr r1, _080F3E38
	bl StringCopy
	b _080F3E44
	.align 2, 0
_080F3E34: .4byte 0x02021C54
_080F3E38: .4byte 0x085CBFCA
_080F3E3C:
	ldr r0, _080F3E58
	ldr r1, _080F3E5C
	bl StringCopy
_080F3E44:
	ldr r0, _080F3E60
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r1, _080F3E64
	movs r0, #4
	strb r0, [r1]
	b _080F3E94
	.align 2, 0
_080F3E58: .4byte 0x02021C54
_080F3E5C: .4byte 0x085CBFCE
_080F3E60: .4byte 0x02021C68
_080F3E64: .4byte 0x02039CFC
_080F3E68:
	ldr r0, _080F3E84
	adds r1, r4, #4
	bl StringCopy
	ldr r0, _080F3E88
	adds r1, r4, #0
	adds r1, #0xc
_080F3E76:
	bl StringCopy
	ldr r1, _080F3E8C
	movs r0, #5
	strb r0, [r1]
	b _080F3E94
	.align 2, 0
_080F3E84: .4byte 0x02021C40
_080F3E88: .4byte 0x02021C54
_080F3E8C: .4byte 0x02039CFC
_080F3E90:
	bl TVShowDone
_080F3E94:
	ldr r0, _080F3EA8
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F3EA8: .4byte 0x08568CD4
	thumb_func_end DoTVShow3CheersForPokeblocks

	thumb_func_start DoTVShowInSearchOfTrainers
DoTVShowInSearchOfTrainers: @ 0x080F3EAC
	push {r4, r5, r6, lr}
	ldr r0, _080F3ECC
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080F3ED0
	ldrb r6, [r0]
	adds r2, r0, #0
	cmp r6, #8
	bls _080F3EC0
	b _080F4064
_080F3EC0:
	lsls r0, r6, #2
	ldr r1, _080F3ED4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F3ECC: .4byte 0x02037290
_080F3ED0: .4byte 0x02039CFC
_080F3ED4: .4byte 0x080F3ED8
_080F3ED8: @ jump table
	.4byte _080F3EFC @ case 0
	.4byte _080F3F44 @ case 1
	.4byte _080F3F4A @ case 2
	.4byte _080F3F9C @ case 3
	.4byte _080F4010 @ case 4
	.4byte _080F4010 @ case 5
	.4byte _080F4010 @ case 6
	.4byte _080F4010 @ case 7
	.4byte _080F4016 @ case 8
_080F3EFC:
	ldr r0, _080F3F24
	ldr r4, _080F3F28
	ldr r1, [r4]
	ldr r2, _080F3F2C
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl GetMapName
	ldr r0, [r4]
	ldr r1, _080F3F30
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bls _080F3F38
	ldr r1, _080F3F34
	movs r0, #1
	strb r0, [r1]
	b _080F4064
	.align 2, 0
_080F3F24: .4byte 0x02021C40
_080F3F28: .4byte 0x03005AEC
_080F3F2C: .4byte 0x00002BAC
_080F3F30: .4byte 0x00002BAD
_080F3F34: .4byte 0x02039CFC
_080F3F38:
	ldr r1, _080F3F40
	movs r0, #2
	strb r0, [r1]
	b _080F4064
	.align 2, 0
_080F3F40: .4byte 0x02039CFC
_080F3F44:
	movs r0, #2
	strb r0, [r2]
	b _080F4064
_080F3F4A:
	ldr r0, _080F3F64
	ldr r0, [r0]
	ldr r1, _080F3F68
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080F3F6C
	movs r0, #4
	strb r0, [r2]
	b _080F4064
	.align 2, 0
_080F3F64: .4byte 0x03005AEC
_080F3F68: .4byte 0x00002BAE
_080F3F6C:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080F3F7A
	movs r0, #5
	strb r0, [r2]
	b _080F4064
_080F3F7A:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080F3F88
	movs r0, #6
	strb r0, [r2]
	b _080F4064
_080F3F88:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080F3F96
	movs r0, #7
	strb r0, [r2]
	b _080F4064
_080F3F96:
	movs r0, #3
	strb r0, [r2]
	b _080F4064
_080F3F9C:
	ldr r0, _080F3FE8
	ldr r4, _080F3FEC
	ldr r1, [r4]
	ldr r2, _080F3FF0
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r5, _080F3FF4
	adds r1, r1, r5
	bl StringCopy
	ldr r0, _080F3FF8
	ldr r1, [r4]
	ldr r2, _080F3FFC
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #3
	ldr r2, _080F4000
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F4004
	ldr r1, [r4]
	ldr r2, _080F4008
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	bl StringCopy
	ldr r1, _080F400C
	movs r0, #8
	strb r0, [r1]
	b _080F4064
	.align 2, 0
_080F3FE8: .4byte 0x02021C40
_080F3FEC: .4byte 0x03005AEC
_080F3FF0: .4byte 0x00002BA4
_080F3FF4: .4byte 0x082EA31C
_080F3FF8: .4byte 0x02021C54
_080F3FFC: .4byte 0x00002BA8
_080F4000: .4byte 0x082EACC4
_080F4004: .4byte 0x02021C68
_080F4008: .4byte 0x00002BA6
_080F400C: .4byte 0x02039CFC
_080F4010:
	movs r0, #8
	strb r0, [r2]
	b _080F4064
_080F4016:
	ldr r0, _080F4078
	ldr r4, _080F407C
	ldr r1, [r4]
	ldr r2, _080F4080
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CopyEasyChatWord
	ldr r0, _080F4084
	ldr r1, [r4]
	ldr r2, _080F4088
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r5, _080F408C
	adds r1, r1, r5
	bl StringCopy
	ldr r0, _080F4090
	ldr r1, [r4]
	ldr r2, _080F4094
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	bl StringCopy
	ldr r1, _080F4098
	movs r0, #1
	strh r0, [r1]
	ldr r1, _080F409C
	movs r0, #0
	strb r0, [r1]
	bl TakeTVShowInSearchOfTrainersOffTheAir
_080F4064:
	ldr r0, _080F40A0
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F4078: .4byte 0x02021C40
_080F407C: .4byte 0x03005AEC
_080F4080: .4byte 0x00002BAA
_080F4084: .4byte 0x02021C54
_080F4088: .4byte 0x00002BA4
_080F408C: .4byte 0x082EA31C
_080F4090: .4byte 0x02021C68
_080F4094: .4byte 0x00002BA6
_080F4098: .4byte 0x02037290
_080F409C: .4byte 0x02039CFC
_080F40A0: .4byte 0x08569118
	thumb_func_end DoTVShowInSearchOfTrainers

	thumb_func_start DoTVShowPokemonAngler
DoTVShowPokemonAngler: @ 0x080F40A4
	push {r4, r5, lr}
	ldr r2, _080F40D0
	ldr r0, _080F40D4
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F40D8
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r0, _080F40DC
	movs r1, #0
	strh r1, [r0]
	ldrb r0, [r4, #2]
	ldrb r2, [r4, #3]
	cmp r0, r2
	bhs _080F40E4
	ldr r0, _080F40E0
	strb r1, [r0]
	b _080F40EC
	.align 2, 0
_080F40D0: .4byte 0x03005AEC
_080F40D4: .4byte 0x02037280
_080F40D8: .4byte 0x000027CC
_080F40DC: .4byte 0x02037290
_080F40E0: .4byte 0x02039CFC
_080F40E4:
	ldr r1, _080F40F8
	movs r0, #1
	strb r0, [r1]
	adds r0, r1, #0
_080F40EC:
	ldrb r5, [r0]
	cmp r5, #0
	beq _080F40FC
	cmp r5, #1
	beq _080F4134
	b _080F415C
	.align 2, 0
_080F40F8: .4byte 0x02039CFC
_080F40FC:
	ldr r0, _080F4128
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F412C
	ldrh r2, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4130
	adds r1, r1, r2
	bl StringCopy
	ldrb r1, [r4, #3]
	movs r0, #2
	bl TV_PrintIntToStringVar
	bl TVShowDone
	b _080F415C
	.align 2, 0
_080F4128: .4byte 0x02021C40
_080F412C: .4byte 0x02021C54
_080F4130: .4byte 0x082EA31C
_080F4134:
	ldr r0, _080F4170
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4174
	ldrh r2, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4178
	adds r1, r1, r2
	bl StringCopy
	ldrb r1, [r4, #2]
	movs r0, #2
	bl TV_PrintIntToStringVar
	bl TVShowDone
_080F415C:
	ldr r0, _080F417C
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F4170: .4byte 0x02021C40
_080F4174: .4byte 0x02021C54
_080F4178: .4byte 0x082EA31C
_080F417C: .4byte 0x08568E5C
	thumb_func_end DoTVShowPokemonAngler

	thumb_func_start DoTVShowTheWorldOfMasters
DoTVShowTheWorldOfMasters: @ 0x080F4180
	push {r4, r5, r6, lr}
	ldr r2, _080F41B0
	ldr r0, _080F41B4
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F41B8
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F41BC
	movs r0, #0
	strh r0, [r1]
	ldr r6, _080F41C0
	ldrb r5, [r6]
	cmp r5, #1
	beq _080F41F0
	cmp r5, #1
	bgt _080F41C4
	cmp r5, #0
	beq _080F41CA
	b _080F423A
	.align 2, 0
_080F41B0: .4byte 0x03005AEC
_080F41B4: .4byte 0x02037280
_080F41B8: .4byte 0x000027CC
_080F41BC: .4byte 0x02037290
_080F41C0: .4byte 0x02039CFC
_080F41C4:
	cmp r5, #2
	beq _080F4210
	b _080F423A
_080F41CA:
	ldr r0, _080F41EC
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r4, #6]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldrh r1, [r4, #2]
	movs r0, #2
	bl TV_PrintIntToStringVar
	movs r0, #1
	strb r0, [r6]
	b _080F423A
	.align 2, 0
_080F41EC: .4byte 0x02021C40
_080F41F0:
	ldr r0, _080F4208
	ldrh r2, [r4, #8]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F420C
	adds r1, r1, r2
	bl StringCopy
	movs r0, #2
	strb r0, [r6]
	b _080F423A
	.align 2, 0
_080F4208: .4byte 0x02021C40
_080F420C: .4byte 0x082EA31C
_080F4210:
	ldr r0, _080F424C
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4250
	ldrb r1, [r4, #0xa]
	movs r2, #0
	bl GetMapName
	ldr r0, _080F4254
	ldrh r2, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4258
	adds r1, r1, r2
	bl StringCopy
	bl TVShowDone
_080F423A:
	ldr r0, _080F425C
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F424C: .4byte 0x02021C40
_080F4250: .4byte 0x02021C54
_080F4254: .4byte 0x02021C68
_080F4258: .4byte 0x082EA31C
_080F425C: .4byte 0x08568E64
	thumb_func_end DoTVShowTheWorldOfMasters

	thumb_func_start DoTVShowTodaysRivalTrainer
DoTVShowTodaysRivalTrainer: @ 0x080F4260
	push {r4, r5, lr}
	ldr r2, _080F4294
	ldr r0, _080F4298
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F429C
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F42A0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F42A4
	ldrb r5, [r0]
	adds r2, r0, #0
	cmp r5, #0xa
	bls _080F4288
	b _080F4456
_080F4288:
	lsls r0, r5, #2
	ldr r1, _080F42A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F4294: .4byte 0x03005AEC
_080F4298: .4byte 0x02037280
_080F429C: .4byte 0x000027CC
_080F42A0: .4byte 0x02037290
_080F42A4: .4byte 0x02039CFC
_080F42A8: .4byte 0x080F42AC
_080F42AC: @ jump table
	.4byte _080F42D8 @ case 0
	.4byte _080F43A0 @ case 1
	.4byte _080F43C8 @ case 2
	.4byte _080F4400 @ case 3
	.4byte _080F4412 @ case 4
	.4byte _080F4434 @ case 5
	.4byte _080F4448 @ case 6
	.4byte _080F430E @ case 7
	.4byte _080F433C @ case 8
	.4byte _080F4354 @ case 9
	.4byte _080F436C @ case 10
_080F42D8:
	ldrb r0, [r4, #7]
	cmp r0, #0x56
	beq _080F42E8
	cmp r0, #0x57
	beq _080F42EE
	movs r0, #7
	strb r0, [r2]
	b _080F4456
_080F42E8:
	movs r0, #8
	strb r0, [r2]
	b _080F4456
_080F42EE:
	ldrh r1, [r4, #0xa]
	ldr r0, _080F4304
	cmp r1, r0
	bgt _080F4308
	subs r0, #2
	cmp r1, r0
	blt _080F4308
	movs r0, #0xa
	strb r0, [r2]
	b _080F4456
	.align 2, 0
_080F4304: .4byte 0x00000117
_080F4308:
	movs r0, #9
	strb r0, [r2]
	b _080F4456
_080F430E:
	ldr r0, _080F4334
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r4, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldr r0, _080F4338
	ldrb r1, [r4, #7]
	movs r2, #0
	bl GetMapName
_080F432A:
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _080F4384
	b _080F4394
	.align 2, 0
_080F4334: .4byte 0x02021C40
_080F4338: .4byte 0x02021C68
_080F433C:
	ldr r0, _080F4350
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r4, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	b _080F432A
	.align 2, 0
_080F4350: .4byte 0x02021C40
_080F4354:
	ldr r0, _080F4368
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r4, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	b _080F432A
	.align 2, 0
_080F4368: .4byte 0x02021C40
_080F436C:
	ldr r0, _080F438C
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r4, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _080F4394
_080F4384:
	ldr r1, _080F4390
	movs r0, #1
	strb r0, [r1]
	b _080F4456
	.align 2, 0
_080F438C: .4byte 0x02021C40
_080F4390: .4byte 0x02039CFC
_080F4394:
	ldr r1, _080F439C
	movs r0, #2
	strb r0, [r1]
	b _080F4456
	.align 2, 0
_080F439C: .4byte 0x02039CFC
_080F43A0:
	ldrb r1, [r4, #4]
	movs r0, #0
	bl TV_PrintIntToStringVar
	ldr r0, _080F43C0
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080F443C
	ldr r0, [r4, #4]
	ldr r1, _080F43C4
	ands r0, r1
	cmp r0, #0
	bne _080F43DE
	b _080F43F4
	.align 2, 0
_080F43C0: .4byte 0x000008A8
_080F43C4: .4byte 0x00FFFF00
_080F43C8:
	ldr r0, _080F43E8
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080F443C
	ldr r0, [r4, #4]
	ldr r1, _080F43EC
	ands r0, r1
	cmp r0, #0
	beq _080F43F4
_080F43DE:
	ldr r1, _080F43F0
	movs r0, #4
	strb r0, [r1]
	b _080F4456
	.align 2, 0
_080F43E8: .4byte 0x000008A8
_080F43EC: .4byte 0x00FFFF00
_080F43F0: .4byte 0x02039CFC
_080F43F4:
	ldr r1, _080F43FC
	movs r0, #3
	strb r0, [r1]
	b _080F4456
	.align 2, 0
_080F43FC: .4byte 0x02039CFC
_080F4400:
	ldrh r0, [r4, #8]
	cmp r0, #0
	bne _080F440C
	movs r0, #6
	strb r0, [r2]
	b _080F4456
_080F440C:
	movs r0, #5
	strb r0, [r2]
	b _080F4456
_080F4412:
	ldrb r1, [r4, #6]
	movs r0, #0
	bl TV_PrintIntToStringVar
	ldrb r1, [r4, #5]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldrh r0, [r4, #8]
	cmp r0, #0
	beq _080F443C
	ldr r1, _080F4430
	movs r0, #5
	strb r0, [r1]
	b _080F4456
	.align 2, 0
_080F4430: .4byte 0x02039CFC
_080F4434:
	ldrh r1, [r4, #8]
	movs r0, #0
	bl TV_PrintIntToStringVar
_080F443C:
	ldr r1, _080F4444
	movs r0, #6
	strb r0, [r1]
	b _080F4456
	.align 2, 0
_080F4444: .4byte 0x02039CFC
_080F4448:
	ldr r0, _080F4468
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	bl TVShowDone
_080F4456:
	ldr r0, _080F446C
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F4468: .4byte 0x02021C40
_080F446C: .4byte 0x08568E70
	thumb_func_end DoTVShowTodaysRivalTrainer

	thumb_func_start DoTVShowDewfordTrendWatcherNetwork
DoTVShowDewfordTrendWatcherNetwork: @ 0x080F4470
	push {r4, r5, lr}
	ldr r2, _080F44A0
	ldr r0, _080F44A4
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F44A8
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F44AC
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F44B0
	ldrb r5, [r0]
	cmp r5, #6
	bls _080F4496
	b _080F45C0
_080F4496:
	lsls r0, r5, #2
	ldr r1, _080F44B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F44A0: .4byte 0x03005AEC
_080F44A4: .4byte 0x02037280
_080F44A8: .4byte 0x000027CC
_080F44AC: .4byte 0x02037290
_080F44B0: .4byte 0x02039CFC
_080F44B4: .4byte 0x080F44B8
_080F44B8: @ jump table
	.4byte _080F44D4 @ case 0
	.4byte _080F450C @ case 1
	.4byte _080F450C @ case 2
	.4byte _080F4540 @ case 3
	.4byte _080F4578 @ case 4
	.4byte _080F4578 @ case 5
	.4byte _080F45AC @ case 6
_080F44D4:
	ldr r0, _080F44F4
	ldrh r1, [r4, #4]
	bl CopyEasyChatWord
	ldr r0, _080F44F8
	ldrh r1, [r4, #6]
	bl CopyEasyChatWord
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _080F4500
	ldr r1, _080F44FC
	movs r0, #1
	strb r0, [r1]
	b _080F45C0
	.align 2, 0
_080F44F4: .4byte 0x02021C40
_080F44F8: .4byte 0x02021C54
_080F44FC: .4byte 0x02039CFC
_080F4500:
	ldr r1, _080F4508
	movs r0, #2
	strb r0, [r1]
	b _080F45C0
	.align 2, 0
_080F4508: .4byte 0x02039CFC
_080F450C:
	ldr r0, _080F4530
	ldrh r1, [r4, #4]
	bl CopyEasyChatWord
	ldr r0, _080F4534
	ldrh r1, [r4, #6]
	bl CopyEasyChatWord
	ldr r0, _080F4538
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r1, _080F453C
	movs r0, #3
	strb r0, [r1]
	b _080F45C0
	.align 2, 0
_080F4530: .4byte 0x02021C40
_080F4534: .4byte 0x02021C54
_080F4538: .4byte 0x02021C68
_080F453C: .4byte 0x02039CFC
_080F4540:
	ldr r0, _080F4560
	ldrh r1, [r4, #4]
	bl CopyEasyChatWord
	ldr r0, _080F4564
	ldrh r1, [r4, #6]
	bl CopyEasyChatWord
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _080F456C
	ldr r1, _080F4568
	movs r0, #4
	strb r0, [r1]
	b _080F45C0
	.align 2, 0
_080F4560: .4byte 0x02021C40
_080F4564: .4byte 0x02021C54
_080F4568: .4byte 0x02039CFC
_080F456C:
	ldr r1, _080F4574
	movs r0, #5
	strb r0, [r1]
	b _080F45C0
	.align 2, 0
_080F4574: .4byte 0x02039CFC
_080F4578:
	ldr r0, _080F459C
	ldrh r1, [r4, #4]
	bl CopyEasyChatWord
	ldr r0, _080F45A0
	ldrh r1, [r4, #6]
	bl CopyEasyChatWord
	ldr r0, _080F45A4
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r1, _080F45A8
	movs r0, #6
	strb r0, [r1]
	b _080F45C0
	.align 2, 0
_080F459C: .4byte 0x02021C40
_080F45A0: .4byte 0x02021C54
_080F45A4: .4byte 0x02021C68
_080F45A8: .4byte 0x02039CFC
_080F45AC:
	ldr r0, _080F45D4
	ldrh r1, [r4, #4]
	bl CopyEasyChatWord
	ldr r0, _080F45D8
	ldrh r1, [r4, #6]
	bl CopyEasyChatWord
	bl TVShowDone
_080F45C0:
	ldr r0, _080F45DC
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F45D4: .4byte 0x02021C40
_080F45D8: .4byte 0x02021C54
_080F45DC: .4byte 0x08568E9C
	thumb_func_end DoTVShowDewfordTrendWatcherNetwork

	thumb_func_start DoTVShowHoennTreasureInvestigators
DoTVShowHoennTreasureInvestigators: @ 0x080F45E0
	push {r4, r5, r6, r7, lr}
	ldr r2, _080F4610
	ldr r0, _080F4614
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F4618
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F461C
	movs r0, #0
	strh r0, [r1]
	ldr r7, _080F4620
	ldrb r6, [r7]
	cmp r6, #1
	beq _080F466E
	cmp r6, #1
	bgt _080F4624
	cmp r6, #0
	beq _080F462A
	b _080F46C2
	.align 2, 0
_080F4610: .4byte 0x03005AEC
_080F4614: .4byte 0x02037280
_080F4618: .4byte 0x000027CC
_080F461C: .4byte 0x02037290
_080F4620: .4byte 0x02039CFC
_080F4624:
	cmp r6, #2
	beq _080F46A4
	b _080F46C2
_080F462A:
	ldr r4, _080F4654
	ldrh r0, [r5, #2]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrb r0, [r5, #4]
	cmp r0, #0x57
	bne _080F4668
	ldrh r1, [r5, #6]
	ldr r0, _080F4658
	cmp r1, r0
	bgt _080F465C
	subs r0, #2
	cmp r1, r0
	blt _080F465C
	movs r0, #2
	strb r0, [r7]
	b _080F46C2
	.align 2, 0
_080F4654: .4byte 0x02021C40
_080F4658: .4byte 0x00000117
_080F465C:
	ldr r1, _080F4664
	movs r0, #1
	strb r0, [r1]
	b _080F46C2
	.align 2, 0
_080F4664: .4byte 0x02039CFC
_080F4668:
	movs r0, #1
	strb r0, [r7]
	b _080F46C2
_080F466E:
	ldr r4, _080F4698
	ldrh r0, [r5, #2]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r0, _080F469C
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F46A0
	ldrb r1, [r5, #4]
	movs r2, #0
	bl GetMapName
	bl TVShowDone
	b _080F46C2
	.align 2, 0
_080F4698: .4byte 0x02021C40
_080F469C: .4byte 0x02021C54
_080F46A0: .4byte 0x02021C68
_080F46A4:
	ldr r4, _080F46D4
	ldrh r0, [r5, #2]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r0, _080F46D8
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	bl TVShowDone
_080F46C2:
	ldr r0, _080F46DC
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F46D4: .4byte 0x02021C40
_080F46D8: .4byte 0x02021C54
_080F46DC: .4byte 0x08568EB8
	thumb_func_end DoTVShowHoennTreasureInvestigators

	thumb_func_start DoTVShowFindThatGamer
DoTVShowFindThatGamer: @ 0x080F46E0
	push {r4, r5, lr}
	ldr r2, _080F4710
	ldr r0, _080F4714
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F4718
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F471C
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F4720
	ldrb r5, [r0]
	cmp r5, #1
	beq _080F478C
	cmp r5, #1
	bgt _080F4724
	cmp r5, #0
	beq _080F4730
	b _080F486C
	.align 2, 0
_080F4710: .4byte 0x03005AEC
_080F4714: .4byte 0x02037280
_080F4718: .4byte 0x000027CC
_080F471C: .4byte 0x02037290
_080F4720: .4byte 0x02039CFC
_080F4724:
	cmp r5, #2
	beq _080F47DC
	cmp r5, #3
	bne _080F472E
	b _080F4830
_080F472E:
	b _080F486C
_080F4730:
	ldr r0, _080F4748
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _080F474C
	cmp r0, #1
	beq _080F4760
	b _080F4768
	.align 2, 0
_080F4748: .4byte 0x02021C40
_080F474C:
	ldr r0, _080F4758
	ldr r1, _080F475C
	bl StringCopy
	b _080F4768
	.align 2, 0
_080F4758: .4byte 0x02021C54
_080F475C: .4byte 0x085CBFAD
_080F4760:
	ldr r0, _080F4774
	ldr r1, _080F4778
	bl StringCopy
_080F4768:
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _080F4780
	ldr r0, _080F477C
	strb r1, [r0]
	b _080F486C
	.align 2, 0
_080F4774: .4byte 0x02021C54
_080F4778: .4byte 0x085CBFB2
_080F477C: .4byte 0x02039CFC
_080F4780:
	ldr r1, _080F4788
	movs r0, #2
	strb r0, [r1]
	b _080F486C
	.align 2, 0
_080F4788: .4byte 0x02039CFC
_080F478C:
	ldr r0, _080F47A4
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _080F47A8
	cmp r0, #1
	beq _080F47BC
	b _080F47C4
	.align 2, 0
_080F47A4: .4byte 0x02021C40
_080F47A8:
	ldr r0, _080F47B4
	ldr r1, _080F47B8
	bl StringCopy
	b _080F47C4
	.align 2, 0
_080F47B4: .4byte 0x02021C54
_080F47B8: .4byte 0x085CBFAD
_080F47BC:
	ldr r0, _080F47D4
	ldr r1, _080F47D8
	bl StringCopy
_080F47C4:
	ldrh r1, [r4, #4]
	movs r0, #2
	bl TV_PrintIntToStringVar
	bl TVShowDone
	b _080F486C
	.align 2, 0
_080F47D4: .4byte 0x02021C54
_080F47D8: .4byte 0x085CBFB2
_080F47DC:
	ldr r0, _080F47F4
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _080F47F8
	cmp r0, #1
	beq _080F480C
	b _080F4814
	.align 2, 0
_080F47F4: .4byte 0x02021C40
_080F47F8:
	ldr r0, _080F4804
	ldr r1, _080F4808
	bl StringCopy
	b _080F4814
	.align 2, 0
_080F4804: .4byte 0x02021C54
_080F4808: .4byte 0x085CBFAD
_080F480C:
	ldr r0, _080F4824
	ldr r1, _080F4828
	bl StringCopy
_080F4814:
	ldrh r1, [r4, #4]
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldr r1, _080F482C
	movs r0, #3
	strb r0, [r1]
	b _080F486C
	.align 2, 0
_080F4824: .4byte 0x02021C54
_080F4828: .4byte 0x085CBFB2
_080F482C: .4byte 0x02039CFC
_080F4830:
	ldr r0, _080F4848
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r1, [r4, #3]
	cmp r1, #0
	beq _080F484C
	cmp r1, #1
	beq _080F4860
	b _080F4868
	.align 2, 0
_080F4848: .4byte 0x02021C40
_080F484C:
	ldr r0, _080F4858
	ldr r1, _080F485C
	bl StringCopy
	b _080F4868
	.align 2, 0
_080F4858: .4byte 0x02021C54
_080F485C: .4byte 0x085CBFB2
_080F4860:
	ldr r0, _080F4880
	ldr r1, _080F4884
	bl StringCopy
_080F4868:
	bl TVShowDone
_080F486C:
	ldr r0, _080F4888
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F4880: .4byte 0x02021C54
_080F4884: .4byte 0x085CBFAD
_080F4888: .4byte 0x08568EC4
	thumb_func_end DoTVShowFindThatGamer

	thumb_func_start DoTVShowBreakingNewsTV
DoTVShowBreakingNewsTV: @ 0x080F488C
	push {r4, r5, r6, lr}
	ldr r2, _080F48C0
	ldr r0, _080F48C4
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F48C8
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F48CC
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F48D0
	ldrb r6, [r0]
	adds r2, r0, #0
	cmp r6, #0xc
	bls _080F48B4
	b _080F4BA2
_080F48B4:
	lsls r0, r6, #2
	ldr r1, _080F48D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F48C0: .4byte 0x03005AEC
_080F48C4: .4byte 0x02037280
_080F48C8: .4byte 0x000027CC
_080F48CC: .4byte 0x02037290
_080F48D0: .4byte 0x02039CFC
_080F48D4: .4byte 0x080F48D8
_080F48D8: @ jump table
	.4byte _080F490C @ case 0
	.4byte _080F491E @ case 1
	.4byte _080F4960 @ case 2
	.4byte _080F49A8 @ case 3
	.4byte _080F49D0 @ case 4
	.4byte _080F49F4 @ case 5
	.4byte _080F4A38 @ case 6
	.4byte _080F4AC0 @ case 7
	.4byte _080F4B38 @ case 8
	.4byte _080F4B50 @ case 9
	.4byte _080F4B50 @ case 10
	.4byte _080F4B94 @ case 11
	.4byte _080F4AF0 @ case 12
_080F490C:
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _080F4918
	movs r0, #1
	strb r0, [r2]
	b _080F4BA2
_080F4918:
	movs r0, #5
	strb r0, [r2]
	b _080F4BA2
_080F491E:
	ldr r0, _080F494C
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4950
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4954
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F4958
	ldrb r1, [r5, #4]
	movs r2, #0
	bl GetMapName
	ldr r1, _080F495C
	movs r0, #2
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F494C: .4byte 0x02021C40
_080F4950: .4byte 0x02021C54
_080F4954: .4byte 0x082EA31C
_080F4958: .4byte 0x02021C68
_080F495C: .4byte 0x02039CFC
_080F4960:
	ldr r0, _080F4994
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4998
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _080F499C
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F49A0
	ldrh r2, [r5, #0xa]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl StringCopy
	ldr r1, _080F49A4
	movs r0, #3
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F4994: .4byte 0x02021C40
_080F4998: .4byte 0x02021C54
_080F499C: .4byte 0x082EA31C
_080F49A0: .4byte 0x02021C68
_080F49A4: .4byte 0x02039CFC
_080F49A8:
	ldrh r1, [r5, #8]
	movs r0, #0
	bl TV_PrintIntToStringVar
	ldr r4, _080F49C8
	ldrh r0, [r5, #6]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _080F49CC
	movs r0, #4
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F49C8: .4byte 0x02021C54
_080F49CC: .4byte 0x02039CFC
_080F49D0:
	ldr r0, _080F49EC
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F49F0
	ldrb r1, [r5, #4]
	movs r2, #0
	bl GetMapName
	bl TVShowDone
	b _080F4BA2
	.align 2, 0
_080F49EC: .4byte 0x02021C40
_080F49F0: .4byte 0x02021C54
_080F49F4:
	ldr r0, _080F4A24
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4A28
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4A2C
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F4A30
	ldrb r1, [r5, #4]
	movs r2, #0
	bl GetMapName
	ldr r1, _080F4A34
	movs r0, #6
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F4A24: .4byte 0x02021C40
_080F4A28: .4byte 0x02021C54
_080F4A2C: .4byte 0x082EA31C
_080F4A30: .4byte 0x02021C68
_080F4A34: .4byte 0x02039CFC
_080F4A38:
	ldr r0, _080F4A74
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4A78
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _080F4A7C
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F4A80
	ldrh r2, [r5, #0xa]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl StringCopy
	ldrb r0, [r5, #5]
	cmp r0, #2
	beq _080F4AA8
	cmp r0, #2
	bgt _080F4A84
	cmp r0, #1
	beq _080F4A8A
	b _080F4BA2
	.align 2, 0
_080F4A74: .4byte 0x02021C40
_080F4A78: .4byte 0x02021C54
_080F4A7C: .4byte 0x082EA31C
_080F4A80: .4byte 0x02021C68
_080F4A84:
	cmp r0, #3
	beq _080F4AB4
	b _080F4BA2
_080F4A8A:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _080F4A9C
	ldr r1, _080F4A98
	movs r0, #0xc
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F4A98: .4byte 0x02039CFC
_080F4A9C:
	ldr r1, _080F4AA4
	movs r0, #7
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F4AA4: .4byte 0x02039CFC
_080F4AA8:
	ldr r1, _080F4AB0
	movs r0, #9
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F4AB0: .4byte 0x02039CFC
_080F4AB4:
	ldr r1, _080F4ABC
	movs r0, #0xa
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F4ABC: .4byte 0x02039CFC
_080F4AC0:
	ldr r0, _080F4AE0
	ldrh r1, [r5, #0xc]
	lsls r1, r1, #3
	ldr r2, _080F4AE4
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F4AE8
	ldrh r2, [r5, #0xa]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4AEC
	adds r1, r1, r2
	b _080F4B18
	.align 2, 0
_080F4AE0: .4byte 0x02021C40
_080F4AE4: .4byte 0x082EACC4
_080F4AE8: .4byte 0x02021C54
_080F4AEC: .4byte 0x082EA31C
_080F4AF0:
	ldr r0, _080F4B24
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4B28
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _080F4B2C
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F4B30
	ldrh r2, [r5, #0xa]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
_080F4B18:
	bl StringCopy
	ldr r1, _080F4B34
	movs r0, #8
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F4B24: .4byte 0x02021C40
_080F4B28: .4byte 0x02021C54
_080F4B2C: .4byte 0x082EA31C
_080F4B30: .4byte 0x02021C68
_080F4B34: .4byte 0x02039CFC
_080F4B38:
	ldr r0, _080F4B48
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4B4C
	b _080F4B6E
	.align 2, 0
_080F4B48: .4byte 0x02021C40
_080F4B4C: .4byte 0x02021C54
_080F4B50:
	ldr r0, _080F4B80
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4B84
	ldrh r2, [r5, #2]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4B88
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F4B8C
_080F4B6E:
	ldrb r1, [r5, #4]
	movs r2, #0
	bl GetMapName
	ldr r1, _080F4B90
	movs r0, #0xb
	strb r0, [r1]
	b _080F4BA2
	.align 2, 0
_080F4B80: .4byte 0x02021C40
_080F4B84: .4byte 0x02021C54
_080F4B88: .4byte 0x082EA31C
_080F4B8C: .4byte 0x02021C68
_080F4B90: .4byte 0x02039CFC
_080F4B94:
	ldr r0, _080F4BB4
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	bl TVShowDone
_080F4BA2:
	ldr r0, _080F4BB8
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F4BB4: .4byte 0x02021C40
_080F4BB8: .4byte 0x08568ED4
	thumb_func_end DoTVShowBreakingNewsTV

	thumb_func_start DoTVShowSecretBaseVisit
DoTVShowSecretBaseVisit: @ 0x080F4BBC
	push {r4, r5, r6, lr}
	ldr r2, _080F4BF0
	ldr r0, _080F4BF4
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F4BF8
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F4BFC
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F4C00
	ldrb r6, [r0]
	adds r2, r0, #0
	cmp r6, #0xd
	bls _080F4BE4
	b _080F4DF4
_080F4BE4:
	lsls r0, r6, #2
	ldr r1, _080F4C04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F4BF0: .4byte 0x03005AEC
_080F4BF4: .4byte 0x02037280
_080F4BF8: .4byte 0x000027CC
_080F4BFC: .4byte 0x02037290
_080F4C00: .4byte 0x02039CFC
_080F4C04: .4byte 0x080F4C08
_080F4C08: @ jump table
	.4byte _080F4C40 @ case 0
	.4byte _080F4C6C @ case 1
	.4byte _080F4D50 @ case 2
	.4byte _080F4CA4 @ case 3
	.4byte _080F4D50 @ case 4
	.4byte _080F4CFC @ case 5
	.4byte _080F4D28 @ case 6
	.4byte _080F4D50 @ case 7
	.4byte _080F4D56 @ case 8
	.4byte _080F4DA4 @ case 9
	.4byte _080F4DA4 @ case 10
	.4byte _080F4DA4 @ case 11
	.4byte _080F4DA4 @ case 12
	.4byte _080F4DF0 @ case 13
_080F4C40:
	ldr r0, _080F4C58
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r0, [r5, #3]
	cmp r0, #0
	bne _080F4C60
	ldr r1, _080F4C5C
	movs r0, #2
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4C58: .4byte 0x02021C40
_080F4C5C: .4byte 0x02039CFC
_080F4C60:
	ldr r1, _080F4C68
	movs r0, #1
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4C68: .4byte 0x02039CFC
_080F4C6C:
	ldr r0, _080F4C8C
	ldrb r2, [r5, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _080F4C90
	adds r1, r1, r2
	bl StringCopy
	ldrb r0, [r5, #3]
	cmp r0, #1
	bne _080F4C98
	ldr r1, _080F4C94
	movs r0, #4
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4C8C: .4byte 0x02021C54
_080F4C90: .4byte 0x08580CD1
_080F4C94: .4byte 0x02039CFC
_080F4C98:
	ldr r1, _080F4CA0
	movs r0, #3
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4CA0: .4byte 0x02039CFC
_080F4CA4:
	ldr r0, _080F4CC8
	ldrb r2, [r5, #5]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _080F4CCC
	adds r1, r1, r2
	bl StringCopy
	ldrb r1, [r5, #3]
	cmp r1, #3
	beq _080F4CE4
	cmp r1, #3
	bgt _080F4CD0
	cmp r1, #2
	beq _080F4CD6
	b _080F4DF4
	.align 2, 0
_080F4CC8: .4byte 0x02021C54
_080F4CCC: .4byte 0x08580CD1
_080F4CD0:
	cmp r1, #4
	beq _080F4CF0
	b _080F4DF4
_080F4CD6:
	ldr r1, _080F4CE0
	movs r0, #7
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4CE0: .4byte 0x02039CFC
_080F4CE4:
	ldr r1, _080F4CEC
	movs r0, #6
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4CEC: .4byte 0x02039CFC
_080F4CF0:
	ldr r1, _080F4CF8
	movs r0, #5
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4CF8: .4byte 0x02039CFC
_080F4CFC:
	ldr r0, _080F4D1C
	ldrb r2, [r5, #6]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r4, _080F4D20
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F4D24
	ldrb r2, [r5, #7]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	b _080F4D36
	.align 2, 0
_080F4D1C: .4byte 0x02021C54
_080F4D20: .4byte 0x08580CD1
_080F4D24: .4byte 0x02021C68
_080F4D28:
	ldr r0, _080F4D44
	ldrb r2, [r5, #6]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _080F4D48
	adds r1, r1, r2
_080F4D36:
	bl StringCopy
	ldr r1, _080F4D4C
	movs r0, #8
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4D44: .4byte 0x02021C54
_080F4D48: .4byte 0x08580CD1
_080F4D4C: .4byte 0x02039CFC
_080F4D50:
	movs r0, #8
	strb r0, [r2]
	b _080F4DF4
_080F4D56:
	ldr r0, _080F4D70
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r1, [r5, #2]
	cmp r1, #0x18
	bhi _080F4D78
	ldr r1, _080F4D74
	movs r0, #0xc
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4D70: .4byte 0x02021C40
_080F4D74: .4byte 0x02039CFC
_080F4D78:
	cmp r1, #0x31
	bhi _080F4D88
	ldr r1, _080F4D84
	movs r0, #0xb
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4D84: .4byte 0x02039CFC
_080F4D88:
	cmp r1, #0x45
	bhi _080F4D98
	ldr r1, _080F4D94
	movs r0, #0xa
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4D94: .4byte 0x02039CFC
_080F4D98:
	ldr r1, _080F4DA0
	movs r0, #9
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4DA0: .4byte 0x02039CFC
_080F4DA4:
	ldr r0, _080F4DD8
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4DDC
	ldrh r2, [r5, #8]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4DE0
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F4DE4
	ldrh r1, [r5, #0xa]
	lsls r1, r1, #3
	ldr r2, _080F4DE8
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _080F4DEC
	movs r0, #0xd
	strb r0, [r1]
	b _080F4DF4
	.align 2, 0
_080F4DD8: .4byte 0x02021C40
_080F4DDC: .4byte 0x02021C54
_080F4DE0: .4byte 0x082EA31C
_080F4DE4: .4byte 0x02021C68
_080F4DE8: .4byte 0x082EACC4
_080F4DEC: .4byte 0x02039CFC
_080F4DF0:
	bl TVShowDone
_080F4DF4:
	ldr r0, _080F4E08
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F4E08: .4byte 0x08568F08
	thumb_func_end DoTVShowSecretBaseVisit

	thumb_func_start DoTVShowPokemonLotteryWinnerFlashReport
DoTVShowPokemonLotteryWinnerFlashReport: @ 0x080F4E0C
	push {r4, r5, r6, lr}
	ldr r2, _080F4E48
	ldr r0, _080F4E4C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F4E50
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F4E54
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F4E58
	ldrb r6, [r0]
	ldr r0, _080F4E5C
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _080F4E68
	ldr r0, _080F4E60
	ldr r1, _080F4E64
	bl StringCopy
	b _080F4E70
	.align 2, 0
_080F4E48: .4byte 0x03005AEC
_080F4E4C: .4byte 0x02037280
_080F4E50: .4byte 0x000027CC
_080F4E54: .4byte 0x02037290
_080F4E58: .4byte 0x02039CFC
_080F4E5C: .4byte 0x02021C40
_080F4E60: .4byte 0x02021C54
_080F4E64: .4byte 0x085CBFEC
_080F4E68:
	ldrb r1, [r5, #4]
	movs r0, #1
	bl TV_PrintIntToStringVar
_080F4E70:
	ldr r4, _080F4E98
	ldrh r0, [r5, #2]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	bl TVShowDone
	ldr r1, _080F4E9C
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F4E98: .4byte 0x02021C68
_080F4E9C: .4byte 0x08568F40
	thumb_func_end DoTVShowPokemonLotteryWinnerFlashReport

	thumb_func_start DoTVShowThePokemonBattleSeminar
DoTVShowThePokemonBattleSeminar: @ 0x080F4EA0
	push {r4, r5, r6, lr}
	ldr r2, _080F4ED0
	ldr r0, _080F4ED4
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F4ED8
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F4EDC
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F4EE0
	ldrb r6, [r0]
	cmp r6, #6
	bls _080F4EC6
	b _080F508A
_080F4EC6:
	lsls r0, r6, #2
	ldr r1, _080F4EE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F4ED0: .4byte 0x03005AEC
_080F4ED4: .4byte 0x02037280
_080F4ED8: .4byte 0x000027CC
_080F4EDC: .4byte 0x02037290
_080F4EE0: .4byte 0x02039CFC
_080F4EE4: .4byte 0x080F4EE8
_080F4EE8: @ jump table
	.4byte _080F4F04 @ case 0
	.4byte _080F4F4C @ case 1
	.4byte _080F4F98 @ case 2
	.4byte _080F4FF0 @ case 3
	.4byte _080F5024 @ case 4
	.4byte _080F5048 @ case 5
	.4byte _080F506C @ case 6
_080F4F04:
	ldr r0, _080F4F38
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4F3C
	ldrh r2, [r5, #6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _080F4F40
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F4F44
	ldrh r2, [r5, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl StringCopy
	ldr r1, _080F4F48
	movs r0, #1
	strb r0, [r1]
	b _080F508A
	.align 2, 0
_080F4F38: .4byte 0x02021C40
_080F4F3C: .4byte 0x02021C54
_080F4F40: .4byte 0x082EA31C
_080F4F44: .4byte 0x02021C68
_080F4F48: .4byte 0x02039CFC
_080F4F4C:
	ldr r0, _080F4F80
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F4F84
	ldrh r2, [r5, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4F88
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080F4F8C
	ldrh r1, [r5, #2]
	lsls r1, r1, #3
	ldr r2, _080F4F90
	adds r1, r1, r2
	bl StringCopy
	ldr r1, _080F4F94
	movs r0, #2
	strb r0, [r1]
	b _080F508A
	.align 2, 0
_080F4F80: .4byte 0x02021C40
_080F4F84: .4byte 0x02021C54
_080F4F88: .4byte 0x082EA31C
_080F4F8C: .4byte 0x02021C68
_080F4F90: .4byte 0x082EACC4
_080F4F94: .4byte 0x02039CFC
_080F4F98:
	ldr r0, _080F4FBC
	ldrh r2, [r5, #6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F4FC0
	adds r1, r1, r2
	bl StringCopy
	ldrb r1, [r5, #0x10]
	cmp r1, #2
	beq _080F4FD8
	cmp r1, #2
	bgt _080F4FC4
	cmp r1, #1
	beq _080F4FCA
	b _080F5056
	.align 2, 0
_080F4FBC: .4byte 0x02021C40
_080F4FC0: .4byte 0x082EA31C
_080F4FC4:
	cmp r1, #3
	beq _080F4FE4
	b _080F5056
_080F4FCA:
	ldr r1, _080F4FD4
	movs r0, #5
	strb r0, [r1]
	b _080F508A
	.align 2, 0
_080F4FD4: .4byte 0x02039CFC
_080F4FD8:
	ldr r1, _080F4FE0
	movs r0, #4
	strb r0, [r1]
	b _080F508A
	.align 2, 0
_080F4FE0: .4byte 0x02039CFC
_080F4FE4:
	ldr r0, _080F4FEC
	strb r1, [r0]
	b _080F508A
	.align 2, 0
_080F4FEC: .4byte 0x02039CFC
_080F4FF0:
	ldr r0, _080F5014
	ldrh r1, [r5, #8]
	lsls r1, r1, #3
	ldr r4, _080F5018
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F501C
	ldrh r1, [r5, #0xa]
	lsls r1, r1, #3
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F5020
	ldrh r1, [r5, #0xc]
	lsls r1, r1, #3
	adds r1, r1, r4
	b _080F5052
	.align 2, 0
_080F5014: .4byte 0x02021C40
_080F5018: .4byte 0x082EACC4
_080F501C: .4byte 0x02021C54
_080F5020: .4byte 0x02021C68
_080F5024:
	ldr r0, _080F503C
	ldrh r1, [r5, #8]
	lsls r1, r1, #3
	ldr r4, _080F5040
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F5044
	ldrh r1, [r5, #0xa]
	lsls r1, r1, #3
	adds r1, r1, r4
	b _080F5052
	.align 2, 0
_080F503C: .4byte 0x02021C40
_080F5040: .4byte 0x082EACC4
_080F5044: .4byte 0x02021C54
_080F5048:
	ldr r0, _080F5060
	ldrh r1, [r5, #8]
	lsls r1, r1, #3
	ldr r2, _080F5064
	adds r1, r1, r2
_080F5052:
	bl StringCopy
_080F5056:
	ldr r1, _080F5068
	movs r0, #6
	strb r0, [r1]
	b _080F508A
	.align 2, 0
_080F5060: .4byte 0x02021C54
_080F5064: .4byte 0x082EACC4
_080F5068: .4byte 0x02039CFC
_080F506C:
	ldr r0, _080F509C
	ldrh r1, [r5, #0xe]
	lsls r1, r1, #3
	ldr r4, _080F50A0
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F50A4
	ldrh r1, [r5, #2]
	lsls r1, r1, #3
	adds r1, r1, r4
	bl StringCopy
	bl TVShowDone
_080F508A:
	ldr r0, _080F50A8
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F509C: .4byte 0x02021C40
_080F50A0: .4byte 0x082EACC4
_080F50A4: .4byte 0x02021C54
_080F50A8: .4byte 0x08568F44
	thumb_func_end DoTVShowThePokemonBattleSeminar

	thumb_func_start DoTVShowTrainerFanClubSpecial
DoTVShowTrainerFanClubSpecial: @ 0x080F50AC
	push {r4, r5, lr}
	ldr r2, _080F50DC
	ldr r0, _080F50E0
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F50E4
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F50E8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F50EC
	ldrb r5, [r0]
	cmp r5, #5
	bls _080F50D2
	b _080F51BE
_080F50D2:
	lsls r0, r5, #2
	ldr r1, _080F50F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F50DC: .4byte 0x03005AEC
_080F50E0: .4byte 0x02037280
_080F50E4: .4byte 0x000027CC
_080F50E8: .4byte 0x02037290
_080F50EC: .4byte 0x02039CFC
_080F50F0: .4byte 0x080F50F4
_080F50F4: @ jump table
	.4byte _080F510C @ case 0
	.4byte _080F5170 @ case 1
	.4byte _080F5170 @ case 2
	.4byte _080F5170 @ case 3
	.4byte _080F5170 @ case 4
	.4byte _080F51A0 @ case 5
_080F510C:
	ldr r0, _080F5134
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r0, _080F5138
	adds r1, r4, #2
	bl StringCopy
	ldr r0, _080F513C
	ldrh r1, [r4, #0x14]
	bl CopyEasyChatWord
	ldrb r1, [r4, #0x16]
	cmp r1, #0x59
	bls _080F5144
	ldr r1, _080F5140
	movs r0, #1
	strb r0, [r1]
	b _080F51BE
	.align 2, 0
_080F5134: .4byte 0x02021C40
_080F5138: .4byte 0x02021C54
_080F513C: .4byte 0x02021C68
_080F5140: .4byte 0x02039CFC
_080F5144:
	cmp r1, #0x45
	bls _080F5154
	ldr r1, _080F5150
	movs r0, #2
	strb r0, [r1]
	b _080F51BE
	.align 2, 0
_080F5150: .4byte 0x02039CFC
_080F5154:
	cmp r1, #0x1d
	bls _080F5164
	ldr r1, _080F5160
	movs r0, #3
	strb r0, [r1]
	b _080F51BE
	.align 2, 0
_080F5160: .4byte 0x02039CFC
_080F5164:
	ldr r1, _080F516C
	movs r0, #4
	strb r0, [r1]
	b _080F51BE
	.align 2, 0
_080F516C: .4byte 0x02039CFC
_080F5170:
	ldr r0, _080F5194
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r0, _080F5198
	adds r1, r4, #2
	bl StringCopy
	ldrb r1, [r4, #0x16]
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldr r1, _080F519C
	movs r0, #5
	strb r0, [r1]
	b _080F51BE
	.align 2, 0
_080F5194: .4byte 0x02021C40
_080F5198: .4byte 0x02021C54
_080F519C: .4byte 0x02039CFC
_080F51A0:
	ldr r0, _080F51D0
	adds r1, r4, #0
	adds r1, #0xc
	bl StringCopy
	ldr r0, _080F51D4
	adds r1, r4, #2
	bl StringCopy
	ldr r0, _080F51D8
	ldrh r1, [r4, #0x14]
	bl CopyEasyChatWord
	bl TVShowDone
_080F51BE:
	ldr r0, _080F51DC
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F51D0: .4byte 0x02021C40
_080F51D4: .4byte 0x02021C54
_080F51D8: .4byte 0x02021C68
_080F51DC: .4byte 0x08568DCC
	thumb_func_end DoTVShowTrainerFanClubSpecial

	thumb_func_start DoTVShowTrainerFanClub
DoTVShowTrainerFanClub: @ 0x080F51E0
	push {r4, r5, lr}
	ldr r2, _080F5214
	ldr r0, _080F5218
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F521C
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F5220
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F5224
	ldrb r5, [r0]
	adds r2, r0, #0
	cmp r5, #0xb
	bls _080F5208
	b _080F5358
_080F5208:
	lsls r0, r5, #2
	ldr r1, _080F5228
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F5214: .4byte 0x03005AEC
_080F5218: .4byte 0x02037280
_080F521C: .4byte 0x000027CC
_080F5220: .4byte 0x02037290
_080F5224: .4byte 0x02039CFC
_080F5228: .4byte 0x080F522C
_080F522C: @ jump table
	.4byte _080F525C @ case 0
	.4byte _080F5334 @ case 1
	.4byte _080F5334 @ case 2
	.4byte _080F5334 @ case 3
	.4byte _080F5334 @ case 4
	.4byte _080F5334 @ case 5
	.4byte _080F5334 @ case 6
	.4byte _080F5334 @ case 7
	.4byte _080F5334 @ case 8
	.4byte _080F5334 @ case 9
	.4byte _080F5334 @ case 10
	.4byte _080F533A @ case 11
_080F525C:
	ldr r0, _080F528C
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	lsls r0, r0, #8
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r1, [r1]
	adds r0, r0, r1
	movs r1, #0xa
	bl __umodsi3
	cmp r0, #9
	bls _080F5282
	b _080F5358
_080F5282:
	lsls r0, r0, #2
	ldr r1, _080F5290
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F528C: .4byte 0x02021C40
_080F5290: .4byte 0x080F5294
_080F5294: @ jump table
	.4byte _080F52BC @ case 0
	.4byte _080F52C8 @ case 1
	.4byte _080F52D4 @ case 2
	.4byte _080F52E0 @ case 3
	.4byte _080F52EC @ case 4
	.4byte _080F52F8 @ case 5
	.4byte _080F5304 @ case 6
	.4byte _080F5310 @ case 7
	.4byte _080F531C @ case 8
	.4byte _080F5328 @ case 9
_080F52BC:
	ldr r1, _080F52C4
	movs r0, #1
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F52C4: .4byte 0x02039CFC
_080F52C8:
	ldr r1, _080F52D0
	movs r0, #2
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F52D0: .4byte 0x02039CFC
_080F52D4:
	ldr r1, _080F52DC
	movs r0, #3
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F52DC: .4byte 0x02039CFC
_080F52E0:
	ldr r1, _080F52E8
	movs r0, #4
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F52E8: .4byte 0x02039CFC
_080F52EC:
	ldr r1, _080F52F4
	movs r0, #5
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F52F4: .4byte 0x02039CFC
_080F52F8:
	ldr r1, _080F5300
	movs r0, #6
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F5300: .4byte 0x02039CFC
_080F5304:
	ldr r1, _080F530C
	movs r0, #7
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F530C: .4byte 0x02039CFC
_080F5310:
	ldr r1, _080F5318
	movs r0, #8
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F5318: .4byte 0x02039CFC
_080F531C:
	ldr r1, _080F5324
	movs r0, #9
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F5324: .4byte 0x02039CFC
_080F5328:
	ldr r1, _080F5330
	movs r0, #0xa
	strb r0, [r1]
	b _080F5358
	.align 2, 0
_080F5330: .4byte 0x02039CFC
_080F5334:
	movs r0, #0xb
	strb r0, [r2]
	b _080F5358
_080F533A:
	ldr r0, _080F536C
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F5370
	ldrh r1, [r4, #4]
	bl CopyEasyChatWord
	ldr r0, _080F5374
	ldrh r1, [r4, #6]
	bl CopyEasyChatWord
	bl TVShowDone
_080F5358:
	ldr r0, _080F5378
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F536C: .4byte 0x02021C40
_080F5370: .4byte 0x02021C54
_080F5374: .4byte 0x02021C68
_080F5378: .4byte 0x08568F60
	thumb_func_end DoTVShowTrainerFanClub

	thumb_func_start DoTVShowSpotTheCuties
DoTVShowSpotTheCuties: @ 0x080F537C
	push {r4, r5, lr}
	ldr r2, _080F53AC
	ldr r0, _080F53B0
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F53B4
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F53B8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F53BC
	ldrb r5, [r0]
	cmp r5, #0xf
	bls _080F53A2
	b _080F5598
_080F53A2:
	lsls r0, r5, #2
	ldr r1, _080F53C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F53AC: .4byte 0x03005AEC
_080F53B0: .4byte 0x02037280
_080F53B4: .4byte 0x000027CC
_080F53B8: .4byte 0x02037290
_080F53BC: .4byte 0x02039CFC
_080F53C0: .4byte 0x080F53C4
_080F53C4: @ jump table
	.4byte _080F5404 @ case 0
	.4byte _080F544C @ case 1
	.4byte _080F544C @ case 2
	.4byte _080F544C @ case 3
	.4byte _080F547C @ case 4
	.4byte _080F557C @ case 5
	.4byte _080F557C @ case 6
	.4byte _080F557C @ case 7
	.4byte _080F557C @ case 8
	.4byte _080F557C @ case 9
	.4byte _080F557C @ case 10
	.4byte _080F557C @ case 11
	.4byte _080F557C @ case 12
	.4byte _080F557C @ case 13
	.4byte _080F557C @ case 14
	.4byte _080F5594 @ case 15
_080F5404:
	ldr r0, _080F5424
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F5428
	adds r1, r4, #4
	bl StringCopy
	ldrb r1, [r4, #2]
	cmp r1, #9
	bhi _080F5430
	ldr r1, _080F542C
	movs r0, #1
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5424: .4byte 0x02021C40
_080F5428: .4byte 0x02021C54
_080F542C: .4byte 0x02039CFC
_080F5430:
	cmp r1, #0x13
	bhi _080F5440
	ldr r1, _080F543C
	movs r0, #2
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F543C: .4byte 0x02039CFC
_080F5440:
	ldr r1, _080F5448
	movs r0, #3
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5448: .4byte 0x02039CFC
_080F544C:
	ldr r0, _080F5470
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r0, _080F5474
	adds r1, r4, #4
	bl StringCopy
	ldrb r1, [r4, #2]
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldr r1, _080F5478
	movs r0, #4
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5470: .4byte 0x02021C40
_080F5474: .4byte 0x02021C54
_080F5478: .4byte 0x02039CFC
_080F547C:
	ldr r0, _080F5498
	adds r1, r4, #4
	bl StringCopy
	ldrb r0, [r4, #3]
	cmp r0, #0x18
	bls _080F548C
	b _080F5598
_080F548C:
	lsls r0, r0, #2
	ldr r1, _080F549C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F5498: .4byte 0x02021C54
_080F549C: .4byte 0x080F54A0
_080F54A0: @ jump table
	.4byte _080F5504 @ case 0
	.4byte _080F5510 @ case 1
	.4byte _080F5510 @ case 2
	.4byte _080F5510 @ case 3
	.4byte _080F5510 @ case 4
	.4byte _080F551C @ case 5
	.4byte _080F551C @ case 6
	.4byte _080F551C @ case 7
	.4byte _080F551C @ case 8
	.4byte _080F5528 @ case 9
	.4byte _080F5528 @ case 10
	.4byte _080F5528 @ case 11
	.4byte _080F5528 @ case 12
	.4byte _080F5534 @ case 13
	.4byte _080F5534 @ case 14
	.4byte _080F5534 @ case 15
	.4byte _080F5534 @ case 16
	.4byte _080F5540 @ case 17
	.4byte _080F5540 @ case 18
	.4byte _080F5540 @ case 19
	.4byte _080F5540 @ case 20
	.4byte _080F554C @ case 21
	.4byte _080F5558 @ case 22
	.4byte _080F5564 @ case 23
	.4byte _080F5570 @ case 24
_080F5504:
	ldr r1, _080F550C
	movs r0, #5
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F550C: .4byte 0x02039CFC
_080F5510:
	ldr r1, _080F5518
	movs r0, #6
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5518: .4byte 0x02039CFC
_080F551C:
	ldr r1, _080F5524
	movs r0, #7
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5524: .4byte 0x02039CFC
_080F5528:
	ldr r1, _080F5530
	movs r0, #8
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5530: .4byte 0x02039CFC
_080F5534:
	ldr r1, _080F553C
	movs r0, #9
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F553C: .4byte 0x02039CFC
_080F5540:
	ldr r1, _080F5548
	movs r0, #0xa
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5548: .4byte 0x02039CFC
_080F554C:
	ldr r1, _080F5554
	movs r0, #0xb
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5554: .4byte 0x02039CFC
_080F5558:
	ldr r1, _080F5560
	movs r0, #0xc
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5560: .4byte 0x02039CFC
_080F5564:
	ldr r1, _080F556C
	movs r0, #0xd
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F556C: .4byte 0x02039CFC
_080F5570:
	ldr r1, _080F5578
	movs r0, #0xe
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F5578: .4byte 0x02039CFC
_080F557C:
	ldr r0, _080F558C
	adds r1, r4, #4
	bl StringCopy
	ldr r1, _080F5590
	movs r0, #0xf
	strb r0, [r1]
	b _080F5598
	.align 2, 0
_080F558C: .4byte 0x02021C54
_080F5590: .4byte 0x02039CFC
_080F5594:
	bl TVShowDone
_080F5598:
	ldr r0, _080F55AC
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F55AC: .4byte 0x08568F90
	thumb_func_end DoTVShowSpotTheCuties

	thumb_func_start DoTVShowPokemonNewsBattleFrontier
DoTVShowPokemonNewsBattleFrontier: @ 0x080F55B0
	push {r4, r5, r6, lr}
	ldr r2, _080F55E4
	ldr r0, _080F55E8
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F55EC
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F55F0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F55F4
	ldrb r6, [r0]
	adds r2, r0, #0
	cmp r6, #0x12
	bls _080F55D8
	b _080F583E
_080F55D8:
	lsls r0, r6, #2
	ldr r1, _080F55F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F55E4: .4byte 0x03005AEC
_080F55E8: .4byte 0x02037280
_080F55EC: .4byte 0x000027CC
_080F55F0: .4byte 0x02037290
_080F55F4: .4byte 0x02039CFC
_080F55F8: .4byte 0x080F55FC
_080F55FC: @ jump table
	.4byte _080F5648 @ case 0
	.4byte _080F5728 @ case 1
	.4byte _080F56E2 @ case 2
	.4byte _080F5704 @ case 3
	.4byte _080F5704 @ case 4
	.4byte _080F5728 @ case 5
	.4byte _080F5728 @ case 6
	.4byte _080F5728 @ case 7
	.4byte _080F5728 @ case 8
	.4byte _080F5728 @ case 9
	.4byte _080F5728 @ case 10
	.4byte _080F5728 @ case 11
	.4byte _080F5728 @ case 12
	.4byte _080F5728 @ case 13
	.4byte _080F574C @ case 14
	.4byte _080F578C @ case 15
	.4byte _080F57B8 @ case 16
	.4byte _080F5808 @ case 17
	.4byte _080F5830 @ case 18
_080F5648:
	ldrb r0, [r5, #0xd]
	subs r0, #1
	cmp r0, #0xc
	bls _080F5652
	b _080F583E
_080F5652:
	lsls r0, r0, #2
	ldr r1, _080F565C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F565C: .4byte 0x080F5660
_080F5660: @ jump table
	.4byte _080F5694 @ case 0
	.4byte _080F569A @ case 1
	.4byte _080F56A0 @ case 2
	.4byte _080F56A6 @ case 3
	.4byte _080F56AC @ case 4
	.4byte _080F56B2 @ case 5
	.4byte _080F56B8 @ case 6
	.4byte _080F56BE @ case 7
	.4byte _080F56C4 @ case 8
	.4byte _080F56CA @ case 9
	.4byte _080F56D0 @ case 10
	.4byte _080F56D6 @ case 11
	.4byte _080F56DC @ case 12
_080F5694:
	movs r0, #1
	strb r0, [r2]
	b _080F583E
_080F569A:
	movs r0, #2
	strb r0, [r2]
	b _080F583E
_080F56A0:
	movs r0, #3
	strb r0, [r2]
	b _080F583E
_080F56A6:
	movs r0, #4
	strb r0, [r2]
	b _080F583E
_080F56AC:
	movs r0, #5
	strb r0, [r2]
	b _080F583E
_080F56B2:
	movs r0, #6
	strb r0, [r2]
	b _080F583E
_080F56B8:
	movs r0, #7
	strb r0, [r2]
	b _080F583E
_080F56BE:
	movs r0, #8
	strb r0, [r2]
	b _080F583E
_080F56C4:
	movs r0, #9
	strb r0, [r2]
	b _080F583E
_080F56CA:
	movs r0, #0xa
	strb r0, [r2]
	b _080F583E
_080F56D0:
	movs r0, #0xb
	strb r0, [r2]
	b _080F583E
_080F56D6:
	movs r0, #0xc
	strb r0, [r2]
	b _080F583E
_080F56DC:
	movs r0, #0xd
	strb r0, [r2]
	b _080F583E
_080F56E2:
	ldr r0, _080F56FC
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r5, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldr r1, _080F5700
	movs r0, #0x10
	strb r0, [r1]
	b _080F583E
	.align 2, 0
_080F56FC: .4byte 0x02021C40
_080F5700: .4byte 0x02039CFC
_080F5704:
	ldr r0, _080F5720
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r5, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldr r1, _080F5724
	movs r0, #0xf
	strb r0, [r1]
	b _080F583E
	.align 2, 0
_080F5720: .4byte 0x02021C40
_080F5724: .4byte 0x02039CFC
_080F5728:
	ldr r0, _080F5744
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r5, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldr r1, _080F5748
	movs r0, #0xe
	strb r0, [r1]
	b _080F583E
	.align 2, 0
_080F5744: .4byte 0x02021C40
_080F5748: .4byte 0x02039CFC
_080F574C:
	ldr r0, _080F577C
	ldrh r2, [r5, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _080F5780
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F5784
	ldrh r2, [r5, #6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F5788
	ldrh r2, [r5, #8]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	b _080F5816
	.align 2, 0
_080F577C: .4byte 0x02021C40
_080F5780: .4byte 0x082EA31C
_080F5784: .4byte 0x02021C54
_080F5788: .4byte 0x02021C68
_080F578C:
	ldr r0, _080F57AC
	ldrh r2, [r5, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _080F57B0
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F57B4
	ldrh r2, [r5, #6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	b _080F5816
	.align 2, 0
_080F57AC: .4byte 0x02021C40
_080F57B0: .4byte 0x082EA31C
_080F57B4: .4byte 0x02021C54
_080F57B8:
	ldr r0, _080F57F4
	ldrh r2, [r5, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _080F57F8
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F57FC
	ldrh r2, [r5, #6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080F5800
	ldrh r2, [r5, #8]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl StringCopy
	ldr r1, _080F5804
	movs r0, #0x11
	strb r0, [r1]
	b _080F583E
	.align 2, 0
_080F57F4: .4byte 0x02021C40
_080F57F8: .4byte 0x082EA31C
_080F57FC: .4byte 0x02021C54
_080F5800: .4byte 0x02021C68
_080F5804: .4byte 0x02039CFC
_080F5808:
	ldr r0, _080F5824
	ldrh r2, [r5, #0xa]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080F5828
	adds r1, r1, r2
_080F5816:
	bl StringCopy
	ldr r1, _080F582C
	movs r0, #0x12
	strb r0, [r1]
	b _080F583E
	.align 2, 0
_080F5824: .4byte 0x02021C40
_080F5828: .4byte 0x082EA31C
_080F582C: .4byte 0x02039CFC
_080F5830:
	ldr r0, _080F5850
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	bl TVShowDone
_080F583E:
	ldr r0, _080F5854
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F5850: .4byte 0x02021C40
_080F5854: .4byte 0x08568FD0
	thumb_func_end DoTVShowPokemonNewsBattleFrontier

	thumb_func_start DoTVShowWhatsNo1InHoennToday
DoTVShowWhatsNo1InHoennToday: @ 0x080F5858
	push {r4, r5, lr}
	ldr r2, _080F5888
	ldr r0, _080F588C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F5890
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F5894
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F5898
	ldrb r5, [r0]
	cmp r5, #8
	bls _080F587E
	b _080F598A
_080F587E:
	lsls r0, r5, #2
	ldr r1, _080F589C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F5888: .4byte 0x03005AEC
_080F588C: .4byte 0x02037280
_080F5890: .4byte 0x000027CC
_080F5894: .4byte 0x02037290
_080F5898: .4byte 0x02039CFC
_080F589C: .4byte 0x080F58A0
_080F58A0: @ jump table
	.4byte _080F58C4 @ case 0
	.4byte _080F5958 @ case 1
	.4byte _080F5958 @ case 2
	.4byte _080F5958 @ case 3
	.4byte _080F5958 @ case 4
	.4byte _080F5958 @ case 5
	.4byte _080F5958 @ case 6
	.4byte _080F5958 @ case 7
	.4byte _080F597C @ case 8
_080F58C4:
	ldr r0, _080F58E0
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r0, [r4, #4]
	cmp r0, #6
	bhi _080F598A
	lsls r0, r0, #2
	ldr r1, _080F58E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F58E0: .4byte 0x02021C40
_080F58E4: .4byte 0x080F58E8
_080F58E8: @ jump table
	.4byte _080F5904 @ case 0
	.4byte _080F5910 @ case 1
	.4byte _080F591C @ case 2
	.4byte _080F5928 @ case 3
	.4byte _080F5934 @ case 4
	.4byte _080F5940 @ case 5
	.4byte _080F594C @ case 6
_080F5904:
	ldr r1, _080F590C
	movs r0, #1
	strb r0, [r1]
	b _080F598A
	.align 2, 0
_080F590C: .4byte 0x02039CFC
_080F5910:
	ldr r1, _080F5918
	movs r0, #2
	strb r0, [r1]
	b _080F598A
	.align 2, 0
_080F5918: .4byte 0x02039CFC
_080F591C:
	ldr r1, _080F5924
	movs r0, #3
	strb r0, [r1]
	b _080F598A
	.align 2, 0
_080F5924: .4byte 0x02039CFC
_080F5928:
	ldr r1, _080F5930
	movs r0, #4
	strb r0, [r1]
	b _080F598A
	.align 2, 0
_080F5930: .4byte 0x02039CFC
_080F5934:
	ldr r1, _080F593C
	movs r0, #5
	strb r0, [r1]
	b _080F598A
	.align 2, 0
_080F593C: .4byte 0x02039CFC
_080F5940:
	ldr r1, _080F5948
	movs r0, #6
	strb r0, [r1]
	b _080F598A
	.align 2, 0
_080F5948: .4byte 0x02039CFC
_080F594C:
	ldr r1, _080F5954
	movs r0, #7
	strb r0, [r1]
	b _080F598A
	.align 2, 0
_080F5954: .4byte 0x02039CFC
_080F5958:
	ldr r0, _080F5974
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r4, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldr r1, _080F5978
	movs r0, #8
	strb r0, [r1]
	b _080F598A
	.align 2, 0
_080F5974: .4byte 0x02021C40
_080F5978: .4byte 0x02039CFC
_080F597C:
	ldr r0, _080F599C
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	bl TVShowDone
_080F598A:
	ldr r0, _080F59A0
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F599C: .4byte 0x02021C40
_080F59A0: .4byte 0x0856901C
	thumb_func_end DoTVShowWhatsNo1InHoennToday

	thumb_func_start sub_080F59A4
sub_080F59A4: @ 0x080F59A4
	push {r4, lr}
	movs r1, #0
	movs r2, #0
	ldr r3, [r0, #0xc]
	movs r4, #1
_080F59AE:
	adds r0, r3, #0
	lsrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _080F59BE
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080F59BE:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1f
	bls _080F59AE
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080F59A4

	thumb_func_start SecretBaseSecrets_GetStateForFlagNumber
SecretBaseSecrets_GetStateForFlagNumber: @ 0x080F59D0
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r2, #0
	movs r3, #0
	ldr r1, [r0, #0xc]
	movs r5, #1
	ldr r6, _080F59F4
_080F59E0:
	adds r0, r1, #0
	lsrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _080F59FE
	cmp r3, r4
	bne _080F59F8
	adds r0, r2, r6
	ldrb r0, [r0]
	b _080F5A0A
	.align 2, 0
_080F59F4: .4byte 0x0856913C
_080F59F8:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_080F59FE:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _080F59E0
	movs r0, #0
_080F5A0A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end SecretBaseSecrets_GetStateForFlagNumber

	thumb_func_start DoTVShowSecretBaseSecrets
DoTVShowSecretBaseSecrets: @ 0x080F5A10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _080F5A4C
	ldr r0, _080F5A50
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F5A54
	adds r0, r0, r1
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _080F5A58
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F5A5C
	ldrb r2, [r0]
	mov sb, r2
	adds r2, r0, #0
	mov r0, sb
	cmp r0, #0x2b
	bls _080F5A42
	b _080F5D36
_080F5A42:
	lsls r0, r0, #2
	ldr r1, _080F5A60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F5A4C: .4byte 0x03005AEC
_080F5A50: .4byte 0x02037280
_080F5A54: .4byte 0x000027CC
_080F5A58: .4byte 0x02037290
_080F5A5C: .4byte 0x02039CFC
_080F5A60: .4byte 0x080F5A64
_080F5A64: @ jump table
	.4byte _080F5B14 @ case 0
	.4byte _080F5B68 @ case 1
	.4byte _080F5BE0 @ case 2
	.4byte _080F5C5C @ case 3
	.4byte _080F5CAC @ case 4
	.4byte _080F5CAC @ case 5
	.4byte _080F5CAC @ case 6
	.4byte _080F5CD4 @ case 7
	.4byte _080F5CF4 @ case 8
	.4byte _080F5CF8 @ case 9
	.4byte _080F5D32 @ case 10
	.4byte _080F5D32 @ case 11
	.4byte _080F5D32 @ case 12
	.4byte _080F5D32 @ case 13
	.4byte _080F5D32 @ case 14
	.4byte _080F5D32 @ case 15
	.4byte _080F5D32 @ case 16
	.4byte _080F5D32 @ case 17
	.4byte _080F5D32 @ case 18
	.4byte _080F5CFC @ case 19
	.4byte _080F5D1C @ case 20
	.4byte _080F5D32 @ case 21
	.4byte _080F5D32 @ case 22
	.4byte _080F5D32 @ case 23
	.4byte _080F5D32 @ case 24
	.4byte _080F5D32 @ case 25
	.4byte _080F5D32 @ case 26
	.4byte _080F5D32 @ case 27
	.4byte _080F5D32 @ case 28
	.4byte _080F5D32 @ case 29
	.4byte _080F5D32 @ case 30
	.4byte _080F5D32 @ case 31
	.4byte _080F5D32 @ case 32
	.4byte _080F5D32 @ case 33
	.4byte _080F5D32 @ case 34
	.4byte _080F5D32 @ case 35
	.4byte _080F5D32 @ case 36
	.4byte _080F5D32 @ case 37
	.4byte _080F5D32 @ case 38
	.4byte _080F5D32 @ case 39
	.4byte _080F5D32 @ case 40
	.4byte _080F5D32 @ case 41
	.4byte _080F5D32 @ case 42
	.4byte _080F5D32 @ case 43
_080F5B14:
	ldr r0, _080F5B3C
	adds r1, r5, #4
	bl StringCopy
	ldr r0, _080F5B40
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	adds r0, r5, #0
	bl sub_080F59A4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _080F5B48
	ldr r1, _080F5B44
	movs r0, #8
	strb r0, [r1]
	b _080F5D36
	.align 2, 0
_080F5B3C: .4byte 0x02021C40
_080F5B40: .4byte 0x02021C54
_080F5B44: .4byte 0x02039CFC
_080F5B48:
	movs r0, #1
	strb r0, [r5, #0x12]
	bl Random
	ldr r4, _080F5B64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	b _080F5C42
	.align 2, 0
_080F5B64: .4byte 0x02039CFD
_080F5B68:
	ldr r0, _080F5B88
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	adds r0, r5, #0
	bl sub_080F59A4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	beq _080F5BF8
	cmp r6, #2
	beq _080F5B8C
	movs r4, #0
	b _080F5BA6
	.align 2, 0
_080F5B88: .4byte 0x02021C54
_080F5B8C:
	strb r6, [r5, #0x12]
	ldr r0, _080F5B9C
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F5BA0
	adds r0, r5, #0
	movs r1, #1
	b _080F5C44
	.align 2, 0
_080F5B9C: .4byte 0x02039CFD
_080F5BA0:
	adds r0, r5, #0
	movs r1, #0
	b _080F5C44
_080F5BA6:
	bl Random
	ldr r7, _080F5BD8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	strb r0, [r7, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r7]
	cmp r0, r1
	bne _080F5BCE
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080F5BDC
	cmp r4, r0
	bls _080F5BA6
_080F5BCE:
	movs r0, #2
	strb r0, [r5, #0x12]
	ldrb r1, [r7, #1]
	b _080F5C42
	.align 2, 0
_080F5BD8: .4byte 0x02039CFD
_080F5BDC: .4byte 0x0000FFFE
_080F5BE0:
	ldr r0, _080F5C00
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	adds r0, r5, #0
	bl sub_080F59A4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bne _080F5C08
_080F5BF8:
	ldr r1, _080F5C04
	movs r0, #9
	strb r0, [r1]
	b _080F5D36
	.align 2, 0
_080F5C00: .4byte 0x02021C54
_080F5C04: .4byte 0x02039CFC
_080F5C08:
	movs r4, #0
	ldr r7, _080F5C50
	ldr r2, _080F5C54
	mov r8, r2
_080F5C10:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	strb r0, [r7, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r7]
	cmp r0, r1
	beq _080F5C30
	ldrb r2, [r7, #1]
	cmp r0, r2
	bne _080F5C3A
_080F5C30:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r8
	bls _080F5C10
_080F5C3A:
	movs r0, #3
	strb r0, [r5, #0x12]
	ldr r0, _080F5C50
	ldrb r1, [r0, #2]
_080F5C42:
	adds r0, r5, #0
_080F5C44:
	bl SecretBaseSecrets_GetStateForFlagNumber
	ldr r1, _080F5C58
	strb r0, [r1]
	b _080F5D36
	.align 2, 0
_080F5C50: .4byte 0x02039CFD
_080F5C54: .4byte 0x0000FFFE
_080F5C58: .4byte 0x02039CFC
_080F5C5C:
	ldr r0, _080F5C84
	adds r1, r5, #4
	bl StringCopy
	ldr r0, _080F5C88
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldrh r1, [r5, #2]
	movs r0, #2
	bl TV_PrintIntToStringVar
	ldrh r0, [r5, #2]
	cmp r0, #0x1e
	bhi _080F5C90
	ldr r1, _080F5C8C
	movs r0, #4
	strb r0, [r1]
	b _080F5D36
	.align 2, 0
_080F5C84: .4byte 0x02021C40
_080F5C88: .4byte 0x02021C54
_080F5C8C: .4byte 0x02039CFC
_080F5C90:
	cmp r0, #0x64
	bhi _080F5CA0
	ldr r1, _080F5C9C
	movs r0, #5
	strb r0, [r1]
	b _080F5D36
	.align 2, 0
_080F5C9C: .4byte 0x02039CFC
_080F5CA0:
	ldr r1, _080F5CA8
	movs r0, #6
	strb r0, [r1]
	b _080F5D36
	.align 2, 0
_080F5CA8: .4byte 0x02039CFC
_080F5CAC:
	ldr r0, _080F5CC8
	adds r1, r5, #4
	bl StringCopy
	ldr r0, _080F5CCC
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	ldr r1, _080F5CD0
	movs r0, #7
	strb r0, [r1]
	b _080F5D36
	.align 2, 0
_080F5CC8: .4byte 0x02021C40
_080F5CCC: .4byte 0x02021C54
_080F5CD0: .4byte 0x02039CFC
_080F5CD4:
	ldr r0, _080F5CEC
	adds r1, r5, #4
	bl StringCopy
	ldr r0, _080F5CF0
	adds r1, r5, #0
	adds r1, #0x13
	bl StringCopy
	bl TVShowDone
	b _080F5D36
	.align 2, 0
_080F5CEC: .4byte 0x02021C40
_080F5CF0: .4byte 0x02021C54
_080F5CF4:
	movs r0, #3
	b _080F5D34
_080F5CF8:
	movs r0, #3
	b _080F5D34
_080F5CFC:
	ldr r4, _080F5D14
	ldrh r0, [r5, #0x10]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _080F5D18
	ldrb r0, [r5, #0x12]
	strb r0, [r1]
	b _080F5D36
	.align 2, 0
_080F5D14: .4byte 0x02021C54
_080F5D18: .4byte 0x02039CFC
_080F5D1C:
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080F5D2E
	movs r0, #0x16
	b _080F5D34
_080F5D2E:
	movs r0, #0x15
	b _080F5D34
_080F5D32:
	ldrb r0, [r5, #0x12]
_080F5D34:
	strb r0, [r2]
_080F5D36:
	ldr r0, _080F5D50
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5D50: .4byte 0x08569040
	thumb_func_end DoTVShowSecretBaseSecrets

	thumb_func_start DoTVShowSafariFanClub
DoTVShowSafariFanClub: @ 0x080F5D54
	push {r4, r5, lr}
	ldr r2, _080F5D88
	ldr r0, _080F5D8C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F5D90
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F5D94
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080F5D98
	ldrb r5, [r0]
	adds r2, r0, #0
	cmp r5, #0xa
	bls _080F5D7C
	b _080F5EB8
_080F5D7C:
	lsls r0, r5, #2
	ldr r1, _080F5D9C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F5D88: .4byte 0x03005AEC
_080F5D8C: .4byte 0x02037280
_080F5D90: .4byte 0x000027CC
_080F5D94: .4byte 0x02037290
_080F5D98: .4byte 0x02039CFC
_080F5D9C: .4byte 0x080F5DA0
_080F5DA0: @ jump table
	.4byte _080F5DCC @ case 0
	.4byte _080F5DE8 @ case 1
	.4byte _080F5E1C @ case 2
	.4byte _080F5E30 @ case 3
	.4byte _080F5E9A @ case 4
	.4byte _080F5E36 @ case 5
	.4byte _080F5E54 @ case 6
	.4byte _080F5E80 @ case 7
	.4byte _080F5E94 @ case 8
	.4byte _080F5E9A @ case 9
	.4byte _080F5EB4 @ case 10
_080F5DCC:
	ldrb r1, [r4, #2]
	cmp r1, #0
	bne _080F5DD8
	movs r0, #6
	strb r0, [r2]
	b _080F5EB8
_080F5DD8:
	cmp r1, #3
	bhi _080F5DE2
	movs r0, #5
	strb r0, [r2]
	b _080F5EB8
_080F5DE2:
	movs r0, #1
	strb r0, [r2]
	b _080F5EB8
_080F5DE8:
	ldr r0, _080F5E08
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r1, [r4, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _080F5E10
	ldr r1, _080F5E0C
	movs r0, #3
	strb r0, [r1]
	b _080F5EB8
	.align 2, 0
_080F5E08: .4byte 0x02021C40
_080F5E0C: .4byte 0x02039CFC
_080F5E10:
	ldr r1, _080F5E18
	movs r0, #2
	strb r0, [r1]
	b _080F5EB8
	.align 2, 0
_080F5E18: .4byte 0x02039CFC
_080F5E1C:
	ldrb r1, [r4, #3]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldr r1, _080F5E2C
	movs r0, #4
	strb r0, [r1]
	b _080F5EB8
	.align 2, 0
_080F5E2C: .4byte 0x02039CFC
_080F5E30:
	movs r0, #4
	strb r0, [r2]
	b _080F5EB8
_080F5E36:
	ldr r0, _080F5E50
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r1, [r4, #2]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _080F5E64
	b _080F5E74
	.align 2, 0
_080F5E50: .4byte 0x02021C40
_080F5E54:
	ldr r0, _080F5E6C
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _080F5E74
_080F5E64:
	ldr r1, _080F5E70
	movs r0, #8
	strb r0, [r1]
	b _080F5EB8
	.align 2, 0
_080F5E6C: .4byte 0x02021C40
_080F5E70: .4byte 0x02039CFC
_080F5E74:
	ldr r1, _080F5E7C
	movs r0, #7
	strb r0, [r1]
	b _080F5EB8
	.align 2, 0
_080F5E7C: .4byte 0x02039CFC
_080F5E80:
	ldrb r1, [r4, #3]
	movs r0, #1
	bl TV_PrintIntToStringVar
	ldr r1, _080F5E90
	movs r0, #9
	strb r0, [r1]
	b _080F5EB8
	.align 2, 0
_080F5E90: .4byte 0x02039CFC
_080F5E94:
	movs r0, #9
	strb r0, [r2]
	b _080F5EB8
_080F5E9A:
	ldr r0, _080F5EAC
	adds r1, r4, #0
	adds r1, #0x13
	bl StringCopy
	ldr r1, _080F5EB0
	movs r0, #0xa
	strb r0, [r1]
	b _080F5EB8
	.align 2, 0
_080F5EAC: .4byte 0x02021C40
_080F5EB0: .4byte 0x02039CFC
_080F5EB4:
	bl TVShowDone
_080F5EB8:
	ldr r0, _080F5ECC
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F5ECC: .4byte 0x085690EC
	thumb_func_end DoTVShowSafariFanClub

	thumb_func_start DoTVShowPokemonContestLiveUpdates2
DoTVShowPokemonContestLiveUpdates2: @ 0x080F5ED0
	push {r4, r5, r6, lr}
	ldr r2, _080F5F00
	ldr r0, _080F5F04
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080F5F08
	adds r0, r0, r1
	ldr r1, [r2]
	adds r4, r1, r0
	ldr r1, _080F5F0C
	movs r0, #0
	strh r0, [r1]
	ldr r6, _080F5F10
	ldrb r5, [r6]
	cmp r5, #2
	bgt _080F5F14
	cmp r5, #1
	bge _080F5F40
	cmp r5, #0
	beq _080F5F1A
	b _080F5F56
	.align 2, 0
_080F5F00: .4byte 0x03005AEC
_080F5F04: .4byte 0x02037280
_080F5F08: .4byte 0x000027CC
_080F5F0C: .4byte 0x02037290
_080F5F10: .4byte 0x02039CFC
_080F5F14:
	cmp r5, #3
	beq _080F5F48
	b _080F5F56
_080F5F1A:
	ldr r0, _080F5F2C
	ldrb r1, [r4, #0xa]
	bl sub_0818E4C4
	ldrb r1, [r4, #0x16]
	cmp r1, #1
	bne _080F5F30
	strb r1, [r6]
	b _080F5F56
	.align 2, 0
_080F5F2C: .4byte 0x02021C40
_080F5F30:
	cmp r1, #0
	bne _080F5F3A
	movs r0, #2
	strb r0, [r6]
	b _080F5F56
_080F5F3A:
	movs r0, #3
	strb r0, [r6]
	b _080F5F56
_080F5F40:
	ldr r0, _080F5F68
	adds r1, r4, #2
	bl StringCopy7
_080F5F48:
	ldr r0, _080F5F6C
	adds r1, r4, #0
	adds r1, #0xb
	bl StringCopy10
	bl TVShowDone
_080F5F56:
	ldr r0, _080F5F70
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F5F68: .4byte 0x02021C68
_080F5F6C: .4byte 0x02021C54
_080F5F70: .4byte 0x08568E30
	thumb_func_end DoTVShowPokemonContestLiveUpdates2

	thumb_func_start TVShowDone
TVShowDone: @ 0x080F5F74
	ldr r1, _080F5F9C
	movs r0, #1
	strh r0, [r1]
	ldr r1, _080F5FA0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080F5FA4
	ldr r2, [r0]
	ldr r0, _080F5FA8
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, _080F5FAC
	adds r2, r2, r0
	movs r0, #0
	strb r0, [r2]
	bx lr
	.align 2, 0
_080F5F9C: .4byte 0x02037290
_080F5FA0: .4byte 0x02039CFC
_080F5FA4: .4byte 0x03005AEC
_080F5FA8: .4byte 0x02037280
_080F5FAC: .4byte 0x000027CD
	thumb_func_end TVShowDone

	thumb_func_start ResetTVShowState
ResetTVShowState: @ 0x080F5FB0
	ldr r1, _080F5FB8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080F5FB8: .4byte 0x02039CFC
	thumb_func_end ResetTVShowState

