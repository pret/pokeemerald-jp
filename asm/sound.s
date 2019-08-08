.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitMapMusic
InitMapMusic: @ 0x080A269C
	push {lr}
	ldr r1, _080A26AC
	movs r0, #0
	strb r0, [r1]
	bl ResetMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_080A26AC: .4byte 0x03005B58
	thumb_func_end InitMapMusic

	thumb_func_start MapMusicMain
MapMusicMain: @ 0x080A26B0
	push {r4, r5, lr}
	ldr r0, _080A26C8
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #7
	bhi _080A2792
	lsls r0, r1, #2
	ldr r1, _080A26CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A26C8: .4byte 0x03000F4C
_080A26CC: .4byte 0x080A26D0
_080A26D0: @ jump table
	.4byte _080A2792 @ case 0
	.4byte _080A26F0 @ case 1
	.4byte _080A2792 @ case 2
	.4byte _080A2792 @ case 3
	.4byte _080A2792 @ case 4
	.4byte _080A2704 @ case 5
	.4byte _080A2724 @ case 6
	.4byte _080A2760 @ case 7
_080A26F0:
	movs r0, #2
	strb r0, [r2]
	ldr r0, _080A2700
	ldrh r0, [r0]
	bl PlayBGM
	b _080A2792
	.align 2, 0
_080A2700: .4byte 0x03000F48
_080A2704:
	bl IsBGMStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2792
	ldr r0, _080A271C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A2720
	strb r1, [r0]
	b _080A2792
	.align 2, 0
_080A271C: .4byte 0x03000F4A
_080A2720: .4byte 0x03000F4C
_080A2724:
	bl IsBGMStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2792
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2792
	ldr r2, _080A2754
	ldr r1, _080A2758
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A275C
	movs r0, #2
	strb r0, [r1]
	ldrh r0, [r2]
	bl PlayBGM
	b _080A2792
	.align 2, 0
_080A2754: .4byte 0x03000F48
_080A2758: .4byte 0x03000F4A
_080A275C: .4byte 0x03000F4C
_080A2760:
	bl IsBGMStopped
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2792
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2792
	ldr r4, _080A2798
	ldrh r0, [r4]
	ldr r5, _080A279C
	ldrb r1, [r5]
	bl FadeInNewBGM
	ldr r1, _080A27A0
	ldrh r0, [r4]
	strh r0, [r1]
	movs r2, #0
	strh r2, [r4]
	ldr r1, _080A27A4
	movs r0, #2
	strb r0, [r1]
	strb r2, [r5]
_080A2792:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2798: .4byte 0x03000F4A
_080A279C: .4byte 0x03000F4D
_080A27A0: .4byte 0x03000F48
_080A27A4: .4byte 0x03000F4C
	thumb_func_end MapMusicMain

	thumb_func_start ResetMapMusic
ResetMapMusic: @ 0x080A27A8
	ldr r0, _080A27BC
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A27C0
	strh r1, [r0]
	ldr r0, _080A27C4
	strb r1, [r0]
	ldr r0, _080A27C8
	strb r1, [r0]
	bx lr
	.align 2, 0
_080A27BC: .4byte 0x03000F48
_080A27C0: .4byte 0x03000F4A
_080A27C4: .4byte 0x03000F4C
_080A27C8: .4byte 0x03000F4D
	thumb_func_end ResetMapMusic

	thumb_func_start GetCurrentMapMusic
GetCurrentMapMusic: @ 0x080A27CC
	ldr r0, _080A27D4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080A27D4: .4byte 0x03000F48
	thumb_func_end GetCurrentMapMusic

	thumb_func_start PlayNewMapMusic
PlayNewMapMusic: @ 0x080A27D8
	ldr r1, _080A27EC
	strh r0, [r1]
	ldr r1, _080A27F0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A27F4
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A27EC: .4byte 0x03000F48
_080A27F0: .4byte 0x03000F4A
_080A27F4: .4byte 0x03000F4C
	thumb_func_end PlayNewMapMusic

	thumb_func_start StopMapMusic
StopMapMusic: @ 0x080A27F8
	ldr r0, _080A280C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A2810
	strh r1, [r0]
	ldr r1, _080A2814
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A280C: .4byte 0x03000F48
_080A2810: .4byte 0x03000F4A
_080A2814: .4byte 0x03000F4C
	thumb_func_end StopMapMusic

	thumb_func_start FadeOutMapMusic
FadeOutMapMusic: @ 0x080A2818
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsNotWaitingForBGMStop
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A282E
	adds r0, r4, #0
	bl FadeOutBGMTemporarily
_080A282E:
	ldr r0, _080A2844
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080A2848
	strh r1, [r0]
	ldr r1, _080A284C
	movs r0, #5
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2844: .4byte 0x03000F48
_080A2848: .4byte 0x03000F4A
_080A284C: .4byte 0x03000F4C
	thumb_func_end FadeOutMapMusic

	thumb_func_start FadeOutAndPlayNewMapMusic
FadeOutAndPlayNewMapMusic: @ 0x080A2850
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FadeOutMapMusic
	ldr r1, _080A2878
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080A287C
	strh r4, [r0]
	ldr r1, _080A2880
	movs r0, #6
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2878: .4byte 0x03000F48
_080A287C: .4byte 0x03000F4A
_080A2880: .4byte 0x03000F4C
	thumb_func_end FadeOutAndPlayNewMapMusic

	thumb_func_start FadeOutAndFadeInNewMapMusic
FadeOutAndFadeInNewMapMusic: @ 0x080A2884
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	bl FadeOutMapMusic
	ldr r1, _080A28B8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080A28BC
	strh r4, [r0]
	ldr r1, _080A28C0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _080A28C4
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A28B8: .4byte 0x03000F48
_080A28BC: .4byte 0x03000F4A
_080A28C0: .4byte 0x03000F4C
_080A28C4: .4byte 0x03000F4D
	thumb_func_end FadeOutAndFadeInNewMapMusic

	thumb_func_start FadeInNewMapMusic
FadeInNewMapMusic: @ 0x080A28C8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl FadeInNewBGM
	ldr r0, _080A28F4
	strh r4, [r0]
	ldr r0, _080A28F8
	movs r2, #0
	strh r2, [r0]
	ldr r1, _080A28FC
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080A2900
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A28F4: .4byte 0x03000F48
_080A28F8: .4byte 0x03000F4A
_080A28FC: .4byte 0x03000F4C
_080A2900: .4byte 0x03000F4D
	thumb_func_end FadeInNewMapMusic

	thumb_func_start IsNotWaitingForBGMStop
IsNotWaitingForBGMStop: @ 0x080A2904
	push {lr}
	ldr r0, _080A291C
	ldrb r0, [r0]
	cmp r0, #6
	beq _080A2920
	cmp r0, #5
	beq _080A2920
	cmp r0, #7
	beq _080A2920
	movs r0, #1
	b _080A2922
	.align 2, 0
_080A291C: .4byte 0x03000F4C
_080A2920:
	movs r0, #0
_080A2922:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsNotWaitingForBGMStop

	thumb_func_start PlayFanfareByFanfareNum
PlayFanfareByFanfareNum: @ 0x080A2928
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A2950
	bl m4aMPlayStop
	ldr r0, _080A2954
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4]
	ldr r2, _080A2958
	ldrh r1, [r4, #2]
	strh r1, [r2]
	bl m4aSongNumStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2950: .4byte 0x030074D0
_080A2954: .4byte 0x084FCFC8
_080A2958: .4byte 0x03000F4E
	thumb_func_end PlayFanfareByFanfareNum

	thumb_func_start WaitFanfare
WaitFanfare: @ 0x080A295C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080A2974
	ldrh r0, [r2]
	cmp r0, #0
	beq _080A2978
	subs r0, #1
	strh r0, [r2]
	movs r0, #0
	b _080A2990
	.align 2, 0
_080A2974: .4byte 0x03000F4E
_080A2978:
	cmp r1, #0
	bne _080A2988
	ldr r0, _080A2984
	bl m4aMPlayContinue
	b _080A298E
	.align 2, 0
_080A2984: .4byte 0x030074D0
_080A2988:
	movs r0, #0
	bl m4aSongNumStart
_080A298E:
	movs r0, #1
_080A2990:
	pop {r1}
	bx r1
	thumb_func_end WaitFanfare

	thumb_func_start StopFanfareByFanfareNum
StopFanfareByFanfareNum: @ 0x080A2994
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _080A29A8
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_080A29A8: .4byte 0x084FCFC8
	thumb_func_end StopFanfareByFanfareNum

	thumb_func_start PlayFanfare
PlayFanfare: @ 0x080A29AC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	ldr r2, _080A29CC
_080A29B6:
	ldrh r0, [r2]
	cmp r0, r3
	bne _080A29D0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl PlayFanfareByFanfareNum
	bl CreateFanfareTask
	b _080A29E2
	.align 2, 0
_080A29CC: .4byte 0x084FCFC8
_080A29D0:
	adds r2, #4
	adds r1, #1
	cmp r1, #0x11
	bls _080A29B6
	movs r0, #0
	bl PlayFanfareByFanfareNum
	bl CreateFanfareTask
_080A29E2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlayFanfare

	thumb_func_start IsFanfareTaskInactive
IsFanfareTaskInactive: @ 0x080A29E8
	push {lr}
	ldr r0, _080A29FC
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080A2A00
	movs r0, #1
	b _080A2A02
	.align 2, 0
_080A29FC: .4byte 0x080A2A09
_080A2A00:
	movs r0, #0
_080A2A02:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsFanfareTaskInactive

	thumb_func_start Task_Fanfare
Task_Fanfare: @ 0x080A2A08
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080A2A1C
	ldrh r0, [r1]
	cmp r0, #0
	beq _080A2A20
	subs r0, #1
	strh r0, [r1]
	b _080A2A2C
	.align 2, 0
_080A2A1C: .4byte 0x03000F4E
_080A2A20:
	ldr r0, _080A2A34
	bl m4aMPlayContinue
	adds r0, r4, #0
	bl DestroyTask
_080A2A2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A34: .4byte 0x030074D0
	thumb_func_end Task_Fanfare

	thumb_func_start CreateFanfareTask
CreateFanfareTask: @ 0x080A2A38
	push {r4, lr}
	ldr r4, _080A2A58
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080A2A52
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
_080A2A52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A58: .4byte 0x080A2A09
	thumb_func_end CreateFanfareTask

	thumb_func_start FadeInNewBGM
FadeInNewBGM: @ 0x080A2A5C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r0, _080A2AA4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2A70
	movs r5, #0
_080A2A70:
	ldr r6, _080A2AA8
	cmp r5, r6
	bne _080A2A78
	movs r5, #0
_080A2A78:
	adds r0, r5, #0
	bl m4aSongNumStart
	ldr r4, _080A2AAC
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	adds r0, r5, #0
	bl m4aSongNumStop
	adds r0, r4, #0
	adds r1, r7, #0
	bl m4aMPlayFadeIn
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2AA4: .4byte 0x03005B58
_080A2AA8: .4byte 0x0000FFFF
_080A2AAC: .4byte 0x030074D0
	thumb_func_end FadeInNewBGM

	thumb_func_start FadeInBGM
FadeInBGM: @ 0x080A2AB0
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080A2AC4
	bl m4aMPlayFadeOutTemporarily
	pop {r0}
	bx r0
	.align 2, 0
_080A2AC4: .4byte 0x030074D0
	thumb_func_end FadeInBGM

	thumb_func_start IsBGMPausedOrStopped
IsBGMPausedOrStopped: @ 0x080A2AC8
	push {lr}
	ldr r0, _080A2AE0
	ldr r1, [r0, #4]
	cmp r1, #0
	blt _080A2AE8
	ldr r0, _080A2AE4
	ands r1, r0
	cmp r1, #0
	beq _080A2AE8
	movs r0, #0
	b _080A2AEA
	.align 2, 0
_080A2AE0: .4byte 0x030074D0
_080A2AE4: .4byte 0x0000FFFF
_080A2AE8:
	movs r0, #1
_080A2AEA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsBGMPausedOrStopped

	thumb_func_start FadeOutBGM
FadeOutBGM: @ 0x080A2AF0
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080A2B04
	bl m4aMPlayFadeIn
	pop {r0}
	bx r0
	.align 2, 0
_080A2B04: .4byte 0x030074D0
	thumb_func_end FadeOutBGM

	thumb_func_start FadeOutBGMTemporarily
FadeOutBGMTemporarily: @ 0x080A2B08
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _080A2B1C
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_080A2B1C: .4byte 0x030074D0
	thumb_func_end FadeOutBGMTemporarily

	thumb_func_start IsBGMStopped
IsBGMStopped: @ 0x080A2B20
	push {lr}
	ldr r0, _080A2B30
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _080A2B34
	movs r0, #0
	b _080A2B36
	.align 2, 0
_080A2B30: .4byte 0x030074D0
_080A2B34:
	movs r0, #1
_080A2B36:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsBGMStopped

	thumb_func_start PlayCry1
PlayCry1: @ 0x080A2B3C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A2B7C
	ldr r1, _080A2B80
	movs r2, #0x55
	bl m4aMPlayVolumeControl
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
	ldr r1, _080A2B84
	movs r0, #2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2B7C: .4byte 0x030074D0
_080A2B80: .4byte 0x0000FFFF
_080A2B84: .4byte 0x0203808C
	thumb_func_end PlayCry1

	thumb_func_start PlayCry2
PlayCry2: @ 0x080A2B88
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r4, #0
	str r4, [sp]
	bl PlayCryInternal
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayCry2

	thumb_func_start PlayCry3
PlayCry3: @ 0x080A2BAC
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #1
	bne _080A2BD2
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	str r4, [sp]
	adds r0, r6, #0
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
	b _080A2BF6
_080A2BD2:
	ldr r0, _080A2C00
	ldr r1, _080A2C04
	movs r2, #0x55
	bl m4aMPlayVolumeControl
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	str r4, [sp]
	adds r0, r6, #0
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
	ldr r1, _080A2C08
	movs r0, #2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
_080A2BF6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C00: .4byte 0x030074D0
_080A2C04: .4byte 0x0000FFFF
_080A2C08: .4byte 0x0203808C
	thumb_func_end PlayCry3

	thumb_func_start PlayCry4
PlayCry4: @ 0x080A2C0C
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r4, r2, #0
	cmp r2, #1
	bne _080A2C36
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r2, [sp]
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
	b _080A2C5C
_080A2C36:
	ldr r0, _080A2C64
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A2C4C
	ldr r0, _080A2C68
	ldr r1, _080A2C6C
	movs r2, #0x55
	bl m4aMPlayVolumeControl
_080A2C4C:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	str r4, [sp]
	adds r0, r6, #0
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
_080A2C5C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C64: .4byte 0x02022C90
_080A2C68: .4byte 0x030074D0
_080A2C6C: .4byte 0x0000FFFF
	thumb_func_end PlayCry4

	thumb_func_start PlayCry6
PlayCry6: @ 0x080A2C70
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #1
	bne _080A2C96
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	str r4, [sp]
	adds r0, r6, #0
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
	b _080A2CB6
_080A2C96:
	ldr r0, _080A2CC0
	ldr r1, _080A2CC4
	movs r2, #0x55
	bl m4aMPlayVolumeControl
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	str r4, [sp]
	adds r0, r6, #0
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
	ldr r1, _080A2CC8
	movs r0, #2
	strb r0, [r1]
_080A2CB6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2CC0: .4byte 0x030074D0
_080A2CC4: .4byte 0x0000FFFF
_080A2CC8: .4byte 0x0203808C
	thumb_func_end PlayCry6

	thumb_func_start PlayCry5
PlayCry5: @ 0x080A2CCC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A2D08
	ldr r1, _080A2D0C
	movs r2, #0x55
	bl m4aMPlayVolumeControl
	str r4, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x78
	movs r3, #0xa
	bl PlayCryInternal
	ldr r1, _080A2D10
	movs r0, #2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2D08: .4byte 0x030074D0
_080A2D0C: .4byte 0x0000FFFF
_080A2D10: .4byte 0x0203808C
	thumb_func_end PlayCry5

	thumb_func_start PlayCryInternal
PlayCryInternal: @ 0x080A2D14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	ldr r3, _080A2D5C
	adds r0, r0, r3
	lsrs r7, r0, #0x10
	movs r6, #0x8c
	movs r0, #0
	mov sb, r0
	movs r5, #0
	movs r4, #0xf0
	lsls r4, r4, #6
	mov r8, r5
	cmp r1, #0xc
	bhi _080A2E2A
	lsls r0, r1, #2
	ldr r1, _080A2D60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A2D5C: .4byte 0xFFFF0000
_080A2D60: .4byte 0x080A2D64
_080A2D64: @ jump table
	.4byte _080A2E2A @ case 0
	.4byte _080A2D98 @ case 1
	.4byte _080A2D9E @ case 2
	.4byte _080A2DAC @ case 3
	.4byte _080A2DC0 @ case 4
	.4byte _080A2DD8 @ case 5
	.4byte _080A2DE4 @ case 6
	.4byte _080A2DF4 @ case 7
	.4byte _080A2DFE @ case 8
	.4byte _080A2E08 @ case 9
	.4byte _080A2E18 @ case 10
	.4byte _080A2E28 @ case 11
	.4byte _080A2E24 @ case 12
_080A2D98:
	movs r6, #0x14
	movs r5, #0xe1
	b _080A2E2A
_080A2D9E:
	movs r5, #0xe1
	ldr r4, _080A2DA8
	movs r1, #0x14
	b _080A2DCC
	.align 2, 0
_080A2DA8: .4byte 0x00003CF0
_080A2DAC:
	movs r6, #0x32
	movs r5, #0xc8
	ldr r4, _080A2DBC
	movs r3, #0x14
	mov r8, r3
	movs r2, #0x5a
	b _080A2E2A
	.align 2, 0
_080A2DBC: .4byte 0x00003DB8
_080A2DC0:
	movs r6, #0x19
	movs r0, #1
	mov sb, r0
	movs r5, #0x64
	ldr r4, _080A2DD4
	movs r1, #0xc0
_080A2DCC:
	mov r8, r1
	movs r2, #0x5a
	b _080A2E2A
	.align 2, 0
_080A2DD4: .4byte 0x00003CF0
_080A2DD8:
	movs r5, #0xc8
	ldr r4, _080A2DE0
	b _080A2E2A
	.align 2, 0
_080A2DE0: .4byte 0x00003868
_080A2DE4:
	movs r5, #0xdc
	ldr r4, _080A2DF0
	movs r3, #0xc0
	mov r8, r3
	movs r2, #0x46
	b _080A2E2A
	.align 2, 0
_080A2DF0: .4byte 0x00003CC3
_080A2DF4:
	movs r6, #0xa
	movs r5, #0x64
	movs r4, #0xe8
	lsls r4, r4, #6
	b _080A2E2A
_080A2DFE:
	movs r6, #0x3c
	movs r5, #0xe1
	movs r4, #0xf4
	lsls r4, r4, #6
	b _080A2E2A
_080A2E08:
	movs r6, #0xf
	movs r0, #1
	mov sb, r0
	movs r5, #0x7d
	ldr r4, _080A2E14
	b _080A2E2A
	.align 2, 0
_080A2E14: .4byte 0x00003B60
_080A2E18:
	movs r6, #0x64
	movs r5, #0xe1
	ldr r4, _080A2E20
	b _080A2E2A
	.align 2, 0
_080A2E20: .4byte 0x00003B60
_080A2E24:
	movs r6, #0x14
	movs r5, #0xe1
_080A2E28:
	ldr r4, _080A2E84
_080A2E2A:
	adds r0, r2, #0
	bl SetPokemonCryVolume
	mov r1, sl
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	bl SetPokemonCryPanpot
	adds r0, r4, #0
	bl SetPokemonCryPitch
	adds r0, r6, #0
	bl SetPokemonCryLength
	movs r0, #0
	bl SetPokemonCryProgress
	adds r0, r5, #0
	bl SetPokemonCryRelease
	mov r3, r8
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	bl SetPokemonCryChorus
	ldr r0, [sp]
	bl SetPokemonCryPriority
	adds r0, r7, #0
	bl SpeciesToCryId
	adds r7, r0, #0
	movs r1, #0x7f
	ands r1, r7
	lsrs r0, r7, #7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	cmp r0, #1
	beq _080A2EB8
	cmp r0, #1
	bgt _080A2E88
	cmp r0, #0
	beq _080A2E92
	b _080A2F26
	.align 2, 0
_080A2E84: .4byte 0x00003A98
_080A2E88:
	cmp r2, #2
	beq _080A2EDC
	cmp r2, #3
	beq _080A2F00
	b _080A2F26
_080A2E92:
	mov r0, sb
	cmp r0, #0
	beq _080A2EA8
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080A2EA4
	b _080A2F1C
	.align 2, 0
_080A2EA4: .4byte 0x08626A44
_080A2EA8:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080A2EB4
	b _080A2F1C
	.align 2, 0
_080A2EB4: .4byte 0x08625814
_080A2EB8:
	mov r3, sb
	cmp r3, #0
	beq _080A2ECC
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080A2EC8
	b _080A2F1C
	.align 2, 0
_080A2EC8: .4byte 0x08627044
_080A2ECC:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080A2ED8
	b _080A2F1C
	.align 2, 0
_080A2ED8: .4byte 0x08625E14
_080A2EDC:
	mov r0, sb
	cmp r0, #0
	beq _080A2EF0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080A2EEC
	b _080A2F1C
	.align 2, 0
_080A2EEC: .4byte 0x08627644
_080A2EF0:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080A2EFC
	b _080A2F1C
	.align 2, 0
_080A2EFC: .4byte 0x08626414
_080A2F00:
	mov r3, sb
	cmp r3, #0
	beq _080A2F14
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080A2F10
	b _080A2F1C
	.align 2, 0
_080A2F10: .4byte 0x08627C44
_080A2F14:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080A2F38
_080A2F1C:
	adds r0, r0, r1
	bl SetPokemonCryTone
	ldr r1, _080A2F3C
	str r0, [r1]
_080A2F26:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2F38: .4byte 0x08626A14
_080A2F3C: .4byte 0x02038088
	thumb_func_end PlayCryInternal

	thumb_func_start IsCryFinished
IsCryFinished: @ 0x080A2F40
	push {lr}
	ldr r0, _080A2F58
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080A2F5C
	bl ClearPokemonCrySongs
	movs r0, #1
	b _080A2F5E
	.align 2, 0
_080A2F58: .4byte 0x080A2FD5
_080A2F5C:
	movs r0, #0
_080A2F5E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsCryFinished

	thumb_func_start StopCryAndClearCrySongs
StopCryAndClearCrySongs: @ 0x080A2F64
	push {lr}
	ldr r0, _080A2F78
	ldr r0, [r0]
	bl m4aMPlayStop
	bl ClearPokemonCrySongs
	pop {r0}
	bx r0
	.align 2, 0
_080A2F78: .4byte 0x02038088
	thumb_func_end StopCryAndClearCrySongs

	thumb_func_start StopCry
StopCry: @ 0x080A2F7C
	push {lr}
	ldr r0, _080A2F8C
	ldr r0, [r0]
	bl m4aMPlayStop
	pop {r0}
	bx r0
	.align 2, 0
_080A2F8C: .4byte 0x02038088
	thumb_func_end StopCry

	thumb_func_start IsCryPlayingOrClearCrySongs
IsCryPlayingOrClearCrySongs: @ 0x080A2F90
	push {lr}
	ldr r0, _080A2FA8
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, #0
	bne _080A2FAC
	bl ClearPokemonCrySongs
	movs r0, #0
	b _080A2FAE
	.align 2, 0
_080A2FA8: .4byte 0x02038088
_080A2FAC:
	movs r0, #1
_080A2FAE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsCryPlayingOrClearCrySongs

	thumb_func_start IsCryPlaying
IsCryPlaying: @ 0x080A2FB4
	push {lr}
	ldr r0, _080A2FC8
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, #0
	bne _080A2FCC
	movs r0, #0
	b _080A2FCE
	.align 2, 0
_080A2FC8: .4byte 0x02038088
_080A2FCC:
	movs r0, #1
_080A2FCE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsCryPlaying

	thumb_func_start Task_DuckBGMForPokemonCry
Task_DuckBGMForPokemonCry: @ 0x080A2FD4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080A2FE8
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A2FEC
	subs r0, #1
	strb r0, [r1]
	b _080A300A
	.align 2, 0
_080A2FE8: .4byte 0x0203808C
_080A2FEC:
	ldr r0, _080A3010
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, #0
	bne _080A300A
	ldr r0, _080A3014
	ldr r1, _080A3018
	movs r2, #0x80
	lsls r2, r2, #1
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	bl DestroyTask
_080A300A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3010: .4byte 0x02038088
_080A3014: .4byte 0x030074D0
_080A3018: .4byte 0x0000FFFF
	thumb_func_end Task_DuckBGMForPokemonCry

	thumb_func_start RestoreBGMVolumeAfterPokemonCry
RestoreBGMVolumeAfterPokemonCry: @ 0x080A301C
	push {r4, lr}
	ldr r4, _080A303C
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080A3036
	adds r0, r4, #0
	movs r1, #0x50
	bl CreateTask
_080A3036:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A303C: .4byte 0x080A2FD5
	thumb_func_end RestoreBGMVolumeAfterPokemonCry

	thumb_func_start PlayBGM
PlayBGM: @ 0x080A3040
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080A3064
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3050
	movs r1, #0
_080A3050:
	ldr r0, _080A3068
	cmp r1, r0
	bne _080A3058
	movs r1, #0
_080A3058:
	adds r0, r1, #0
	bl m4aSongNumStart
	pop {r0}
	bx r0
	.align 2, 0
_080A3064: .4byte 0x03005B58
_080A3068: .4byte 0x0000FFFF
	thumb_func_end PlayBGM

	thumb_func_start PlaySE
PlaySE: @ 0x080A306C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PlaySE

	thumb_func_start PlaySE12WithPanning
PlaySE12WithPanning: @ 0x080A307C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl m4aSongNumStart
	ldr r6, _080A30C4
	adds r0, r6, #0
	bl m4aMPlayImmInit
	ldr r0, _080A30C8
	mov r8, r0
	bl m4aMPlayImmInit
	ldr r5, _080A30CC
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayPanpotControl
	mov r0, r8
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayPanpotControl
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A30C4: .4byte 0x03007510
_080A30C8: .4byte 0x03007550
_080A30CC: .4byte 0x0000FFFF
	thumb_func_end PlaySE12WithPanning

	thumb_func_start PlaySE1WithPanning
PlaySE1WithPanning: @ 0x080A30D0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl m4aSongNumStart
	ldr r5, _080A30FC
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r1, _080A3100
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, r5, #0
	adds r2, r4, #0
	bl m4aMPlayPanpotControl
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A30FC: .4byte 0x03007510
_080A3100: .4byte 0x0000FFFF
	thumb_func_end PlaySE1WithPanning

	thumb_func_start PlaySE2WithPanning
PlaySE2WithPanning: @ 0x080A3104
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl m4aSongNumStart
	ldr r5, _080A3130
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r1, _080A3134
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, r5, #0
	adds r2, r4, #0
	bl m4aMPlayPanpotControl
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3130: .4byte 0x03007550
_080A3134: .4byte 0x0000FFFF
	thumb_func_end PlaySE2WithPanning

	thumb_func_start SE12PanpotControl
SE12PanpotControl: @ 0x080A3138
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A315C
	ldr r5, _080A3160
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayPanpotControl
	ldr r0, _080A3164
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayPanpotControl
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A315C: .4byte 0x03007510
_080A3160: .4byte 0x0000FFFF
_080A3164: .4byte 0x03007550
	thumb_func_end SE12PanpotControl

	thumb_func_start IsSEPlaying
IsSEPlaying: @ 0x080A3168
	push {lr}
	ldr r0, _080A3198
	ldr r1, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #0x18
	adds r3, r0, #0
	cmp r1, #0
	bge _080A3182
	ldr r0, _080A319C
	ldr r0, [r0, #4]
	ands r0, r2
	cmp r0, #0
	bne _080A3194
_080A3182:
	ldr r1, _080A31A0
	ldrh r0, [r3, #4]
	cmp r0, #0
	bne _080A31A4
	ldr r0, _080A319C
	ldr r0, [r0, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A31A4
_080A3194:
	movs r0, #0
	b _080A31A6
	.align 2, 0
_080A3198: .4byte 0x03007510
_080A319C: .4byte 0x03007550
_080A31A0: .4byte 0x0000FFFF
_080A31A4:
	movs r0, #1
_080A31A6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsSEPlaying

	thumb_func_start IsBGMPlaying
IsBGMPlaying: @ 0x080A31AC
	push {lr}
	ldr r0, _080A31C4
	ldr r1, [r0, #4]
	cmp r1, #0
	blt _080A31CC
	ldr r0, _080A31C8
	ands r1, r0
	cmp r1, #0
	beq _080A31CC
	movs r0, #1
	b _080A31CE
	.align 2, 0
_080A31C4: .4byte 0x030074D0
_080A31C8: .4byte 0x0000FFFF
_080A31CC:
	movs r0, #0
_080A31CE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsBGMPlaying

	thumb_func_start IsSpecialSEPlaying
IsSpecialSEPlaying: @ 0x080A31D4
	push {lr}
	ldr r0, _080A31EC
	ldr r1, [r0, #4]
	cmp r1, #0
	blt _080A31F4
	ldr r0, _080A31F0
	ands r1, r0
	cmp r1, #0
	beq _080A31F4
	movs r0, #1
	b _080A31F6
	.align 2, 0
_080A31EC: .4byte 0x030075A0
_080A31F0: .4byte 0x0000FFFF
_080A31F4:
	movs r0, #0
_080A31F6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsSpecialSEPlaying

