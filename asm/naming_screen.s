.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DoNamingScreen
DoNamingScreen: @ 0x080E2244
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	ldr r4, _080E2270
	movs r0, #0xf2
	lsls r0, r0, #5
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	bne _080E2274
	ldr r0, [sp, #0x1c]
	bl SetMainCallback2
	b _080E22AE
	.align 2, 0
_080E2270: .4byte 0x02039C34
_080E2274:
	ldr r1, _080E22B8
	adds r0, r0, r1
	strb r7, [r0]
	ldr r0, [r4]
	ldr r2, _080E22BC
	adds r1, r0, r2
	strh r5, [r1]
	adds r2, #2
	adds r1, r0, r2
	strh r6, [r1]
	ldr r1, _080E22C0
	adds r2, r0, r1
	ldr r1, [sp, #0x18]
	str r1, [r2]
	ldr r2, _080E22C4
	adds r1, r0, r2
	mov r2, r8
	str r2, [r1]
	ldr r1, _080E22C8
	adds r0, r0, r1
	ldr r2, [sp, #0x1c]
	str r2, [r0]
	cmp r7, #0
	bne _080E22A8
	bl StartTimer1
_080E22A8:
	ldr r0, _080E22CC
	bl SetMainCallback2
_080E22AE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E22B8: .4byte 0x00001E2C
_080E22BC: .4byte 0x00001E34
_080E22C0: .4byte 0x00001E38
_080E22C4: .4byte 0x00001E30
_080E22C8: .4byte 0x00001E3C
_080E22CC: .4byte 0x080E22D1
	thumb_func_end DoNamingScreen

	thumb_func_start C2_NamingScreen
C2_NamingScreen: @ 0x080E22D0
	push {lr}
	ldr r0, _080E22EC
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	bhi _080E2368
	lsls r0, r0, #2
	ldr r1, _080E22F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E22EC: .4byte 0x03002360
_080E22F0: .4byte 0x080E22F4
_080E22F4: @ jump table
	.4byte _080E2314 @ case 0
	.4byte _080E231E @ case 1
	.4byte _080E2324 @ case 2
	.4byte _080E232A @ case 3
	.4byte _080E2334 @ case 4
	.4byte _080E233A @ case 5
	.4byte _080E2340 @ case 6
	.4byte _080E2346 @ case 7
_080E2314:
	bl NamingScreen_TurnOffScreen
	bl NamingScreen_Init
	b _080E2352
_080E231E:
	bl NamingScreen_InitBGs
	b _080E2352
_080E2324:
	bl ResetPaletteFade
	b _080E2352
_080E232A:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _080E2352
_080E2334:
	bl ResetTasks
	b _080E2352
_080E233A:
	bl choose_name_or_words_screen_apply_bg_pals
	b _080E2352
_080E2340:
	bl choose_name_or_words_screen_load_bg_tile_patterns
	b _080E2352
_080E2346:
	bl sub_080E31EC
	bl UpdatePaletteFade
	bl SetCursorPos
_080E2352:
	ldr r1, _080E2364
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080E2370
	.align 2, 0
_080E2364: .4byte 0x03002360
_080E2368:
	bl sub_080E4450
	bl sub_080E265C
_080E2370:
	pop {r0}
	bx r0
	thumb_func_end C2_NamingScreen

	thumb_func_start NamingScreen_Init
NamingScreen_Init: @ 0x080E2374
	push {r4, r5, r6, lr}
	ldr r5, _080E2434
	ldr r0, [r5]
	ldr r1, _080E2438
	adds r0, r0, r1
	movs r2, #0
	strb r2, [r0]
	ldr r1, [r5]
	ldr r3, _080E243C
	adds r0, r1, r3
	movs r4, #0
	strh r2, [r0]
	adds r3, #2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _080E2440
	adds r2, r1, r0
	movs r3, #1
	movs r0, #1
	strh r0, [r2]
	ldr r0, _080E2444
	adds r2, r1, r0
	movs r0, #2
	strh r0, [r2]
	movs r2, #0xf1
	lsls r2, r2, #5
	adds r1, r1, r2
	strb r4, [r1]
	ldr r0, [r5]
	ldr r1, _080E2448
	adds r0, r0, r1
	strb r3, [r0]
	ldr r1, [r5]
	ldr r6, _080E244C
	adds r3, r1, r6
	ldr r2, _080E2450
	ldr r4, _080E2454
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r3]
	ldrb r0, [r0, #4]
	ldr r2, _080E2458
	adds r1, r1, r2
	strb r0, [r1]
	ldr r2, [r5]
	adds r0, r2, r6
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	lsrs r0, r0, #1
	movs r1, #0xe
	subs r1, r1, r0
	ldr r0, _080E245C
	adds r3, r2, r0
	strh r1, [r3]
	adds r2, r2, r4
	ldrb r0, [r2]
	cmp r0, #4
	bne _080E23F2
	adds r0, r1, #1
	strh r0, [r3]
_080E23F2:
	ldr r0, [r5]
	ldr r4, _080E2460
	ldrh r1, [r4]
	ldr r2, _080E2464
	adds r0, r0, r2
	strb r1, [r0]
	ldr r0, [r5]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r0, r0, r3
	movs r1, #0xff
	movs r2, #0x10
	bl memset
	ldr r1, [r5]
	adds r0, r1, r6
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E242A
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r1, r2
	ldr r3, _080E2468
	adds r1, r1, r3
	ldr r1, [r1]
	bl StringCopy
_080E242A:
	movs r0, #0x10
	strh r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2434: .4byte 0x02039C34
_080E2438: .4byte 0x00001E10
_080E243C: .4byte 0x00001E18
_080E2440: .4byte 0x00001E1C
_080E2444: .4byte 0x00001E1E
_080E2448: .4byte 0x00001E21
_080E244C: .4byte 0x00001E28
_080E2450: .4byte 0x08565CE8
_080E2454: .4byte 0x00001E2C
_080E2458: .4byte 0x00001E22
_080E245C: .4byte 0x00001E16
_080E2460: .4byte 0x03002350
_080E2464: .4byte 0x00001E25
_080E2468: .4byte 0x00001E30
	thumb_func_end NamingScreen_Init

	thumb_func_start sub_080E246C
sub_080E246C: @ 0x080E246C
	push {r4, r5, lr}
	movs r3, #0
	ldr r4, _080E24A8
	movs r5, #5
	rsbs r5, r5, #0
_080E2476:
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	lsls r0, r1, #0x1f
	cmp r0, #0
	beq _080E2490
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
_080E2490:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x3f
	bls _080E2476
	movs r0, #0
	bl sub_080E3320
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E24A8: .4byte 0x020205AC
	thumb_func_end sub_080E246C

	thumb_func_start NamingScreen_InitBGs
NamingScreen_InitBGs: @ 0x080E24AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #9
	add r0, sp, #0xc
	mov r8, r0
	add r2, sp, #8
	movs r6, #0
	ldr r1, _080E2640
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _080E2644
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_080E24D2:
	strh r6, [r2]
	add r0, sp, #8
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _080E24D2
	strh r6, [r2]
	add r2, sp, #8
	str r2, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #0xc]
	ldr r2, _080E2640
	mov r1, r8
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	add r0, sp, #8
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080E2648
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	bl InitStandardTextBoxWindows
	bl sub_08196DF4
_080E25A0:
	lsls r0, r4, #3
	ldr r1, _080E264C
	adds r0, r0, r1
	bl AddWindow
	ldr r5, _080E2650
	ldr r1, [r5]
	ldr r2, _080E2654
	adds r1, r1, r2
	adds r1, r1, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _080E25A0
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r1, #0xc8
	lsls r1, r1, #3
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _080E2658
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, [r5]
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r0, #3
	bl SetBgTilemapBuffer
	movs r4, #0x20
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E2640: .4byte 0x040000D4
_080E2644: .4byte 0x81000800
_080E2648: .4byte 0x085659FC
_080E264C: .4byte 0x08565A0C
_080E2650: .4byte 0x02039C34
_080E2654: .4byte 0x00001E11
_080E2658: .4byte 0x0000080C
	thumb_func_end NamingScreen_InitBGs

	thumb_func_start sub_080E265C
sub_080E265C: @ 0x080E265C
	push {lr}
	ldr r0, _080E2670
	movs r1, #2
	bl CreateTask
	ldr r0, _080E2674
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080E2670: .4byte 0x080E2679
_080E2674: .4byte 0x080E474D
	thumb_func_end sub_080E265C

	thumb_func_start sub_080E2678
sub_080E2678: @ 0x080E2678
	push {lr}
	ldr r0, _080E2694
	ldr r0, [r0]
	ldr r1, _080E2698
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #9
	bhi _080E2708
	lsls r0, r0, #2
	ldr r1, _080E269C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2694: .4byte 0x02039C34
_080E2698: .4byte 0x00001E10
_080E269C: .4byte 0x080E26A0
_080E26A0: @ jump table
	.4byte _080E26C8 @ case 0
	.4byte _080E26D6 @ case 1
	.4byte _080E26E0 @ case 2
	.4byte _080E26DC @ case 3
	.4byte _080E26E6 @ case 4
	.4byte _080E26EC @ case 5
	.4byte _080E26F2 @ case 6
	.4byte _080E26F8 @ case 7
	.4byte _080E26FE @ case 8
	.4byte _080E2704 @ case 9
_080E26C8:
	bl MainState_BeginFadeIn
	bl sub_080E246C
	bl NamingScreen_InitDisplayMode
	b _080E2708
_080E26D6:
	bl MainState_WaitFadeIn
	b _080E2708
_080E26DC:
	bl MainState_MoveToOKButton
_080E26E0:
	bl MainState_HandleInput
	b _080E2708
_080E26E6:
	bl MainState_StartPageSwap
	b _080E2708
_080E26EC:
	bl sub_080E2C14
	b _080E2708
_080E26F2:
	bl MainState_6
	b _080E2708
_080E26F8:
	bl sub_080E2B98
	b _080E2708
_080E26FE:
	bl MainState_BeginFadeInOut
	b _080E2708
_080E2704:
	bl MainState_WaitFadeOutAndExit
_080E2708:
	pop {r0}
	bx r0
	thumb_func_end sub_080E2678

	thumb_func_start sub_080E270C
sub_080E270C: @ 0x080E270C
	push {lr}
	ldr r0, _080E2724
	ldr r0, [r0]
	ldr r1, _080E2728
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E2720
	cmp r0, #4
	bne _080E272C
_080E2720:
	movs r0, #1
	b _080E272E
	.align 2, 0
_080E2724: .4byte 0x02039C34
_080E2728: .4byte 0x00001E2C
_080E272C:
	movs r0, #0
_080E272E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080E270C

	thumb_func_start GetCurrentPageColumnCount
GetCurrentPageColumnCount: @ 0x080E2734
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080E2754
	bl sub_080E270C
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r4, r4, r1
	adds r4, r4, r5
	ldrb r0, [r4]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E2754: .4byte 0x08565A3C
	thumb_func_end GetCurrentPageColumnCount

	thumb_func_start sub_080E2758
sub_080E2758: @ 0x080E2758
	push {r4, lr}
	ldr r4, _080E277C
	bl sub_080E270C
	ldr r1, _080E2780
	ldr r2, [r1]
	ldr r1, _080E2784
	adds r2, r2, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	adds r1, r1, r4
	ldrb r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E277C: .4byte 0x08565A42
_080E2780: .4byte 0x02039C34
_080E2784: .4byte 0x00001E22
	thumb_func_end sub_080E2758

	thumb_func_start sub_080E2788
sub_080E2788: @ 0x080E2788
	push {r4, lr}
	ldr r4, _080E27AC
	bl sub_080E270C
	ldr r1, _080E27B0
	ldr r2, [r1]
	ldr r1, _080E27B4
	adds r2, r2, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	adds r1, r1, r4
	ldrb r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E27AC: .4byte 0x08565A48
_080E27B0: .4byte 0x02039C34
_080E27B4: .4byte 0x00001E22
	thumb_func_end sub_080E2788

	thumb_func_start MainState_BeginFadeIn
MainState_BeginFadeIn: @ 0x080E27B8
	push {r4, lr}
	sub sp, #4
	ldr r1, _080E2818
	movs r0, #3
	bl sub_080E4490
	bl sub_080E270C
	adds r1, r0, #0
	cmp r1, #0
	beq _080E2834
	ldr r4, _080E281C
	ldr r0, [r4]
	ldr r1, _080E2820
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	ldr r1, _080E2824
	movs r0, #2
	bl sub_080E4490
	ldr r1, _080E2828
	movs r0, #1
	bl sub_080E4490
	ldr r0, [r4]
	ldr r2, _080E282C
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r1, #0
	bl sub_080E45D0
	ldr r0, [r4]
	ldr r1, _080E2830
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #1
	bl sub_080E45D0
	movs r0, #2
	movs r1, #0
	bl sub_080E44A4
	movs r0, #1
	movs r1, #1
	bl sub_080E44A4
	b _080E287A
	.align 2, 0
_080E2818: .4byte 0x08565524
_080E281C: .4byte 0x02039C34
_080E2820: .4byte 0x00001E22
_080E2824: .4byte 0x085656C8
_080E2828: .4byte 0x08565600
_080E282C: .4byte 0x00001E12
_080E2830: .4byte 0x00001E11
_080E2834:
	ldr r4, _080E28D4
	ldr r0, [r4]
	ldr r2, _080E28D8
	adds r0, r0, r2
	strb r1, [r0]
	ldr r1, _080E28DC
	movs r0, #1
	bl sub_080E4490
	ldr r1, _080E28E0
	movs r0, #2
	bl sub_080E4490
	ldr r0, [r4]
	ldr r1, _080E28E4
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl sub_080E45D0
	ldr r0, [r4]
	ldr r2, _080E28E8
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r1, #1
	bl sub_080E45D0
	movs r0, #1
	movs r1, #0
	bl sub_080E44A4
	movs r0, #2
	movs r1, #1
	bl sub_080E44A4
_080E287A:
	bl sub_080E4510
	bl sub_080E3E4C
	bl sub_080E3E24
	bl sub_080E46E4
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080E28D4
	ldr r1, [r0]
	ldr r0, _080E28EC
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E28D4: .4byte 0x02039C34
_080E28D8: .4byte 0x00001E22
_080E28DC: .4byte 0x085656C8
_080E28E0: .4byte 0x08565600
_080E28E4: .4byte 0x00001E11
_080E28E8: .4byte 0x00001E12
_080E28EC: .4byte 0x00001E10
	thumb_func_end MainState_BeginFadeIn

	thumb_func_start MainState_WaitFadeIn
MainState_WaitFadeIn: @ 0x080E28F0
	push {lr}
	ldr r0, _080E2920
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080E2918
	movs r0, #1
	bl SetInputState
	movs r0, #1
	bl sub_080E3378
	ldr r0, _080E2924
	ldr r1, [r0]
	ldr r0, _080E2928
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080E2918:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080E2920: .4byte 0x02037C74
_080E2924: .4byte 0x02039C34
_080E2928: .4byte 0x00001E10
	thumb_func_end MainState_WaitFadeIn

	thumb_func_start MainState_HandleInput
MainState_HandleInput: @ 0x080E292C
	push {lr}
	bl HandleKeyboardEvent
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MainState_HandleInput

	thumb_func_start MainState_MoveToOKButton
MainState_MoveToOKButton: @ 0x080E293C
	push {lr}
	bl IsCursorAnimFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E295E
	movs r0, #1
	bl SetInputState
	bl sub_080E3310
	ldr r0, _080E2964
	ldr r0, [r0]
	ldr r1, _080E2968
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
_080E295E:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080E2964: .4byte 0x02039C34
_080E2968: .4byte 0x00001E10
	thumb_func_end MainState_MoveToOKButton

	thumb_func_start MainState_6
MainState_6: @ 0x080E296C
	push {r4, lr}
	bl sub_080E437C
	movs r0, #0
	bl SetInputState
	movs r0, #0
	bl sub_080E3378
	movs r0, #3
	movs r1, #0
	movs r2, #1
	bl sub_080E2E78
	ldr r4, _080E29B4
	ldr r0, [r4]
	ldr r1, _080E29B8
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _080E29C0
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _080E29C0
	bl DisplaySentToPCMessage
	ldr r0, [r4]
	ldr r1, _080E29BC
	adds r0, r0, r1
	movs r1, #7
	strb r1, [r0]
	movs r0, #0
	b _080E29CE
	.align 2, 0
_080E29B4: .4byte 0x02039C34
_080E29B8: .4byte 0x00001E2C
_080E29BC: .4byte 0x00001E10
_080E29C0:
	ldr r0, _080E29D4
	ldr r0, [r0]
	ldr r1, _080E29D8
	adds r0, r0, r1
	movs r1, #8
	strb r1, [r0]
	movs r0, #1
_080E29CE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E29D4: .4byte 0x02039C34
_080E29D8: .4byte 0x00001E10
	thumb_func_end MainState_6

	thumb_func_start MainState_BeginFadeInOut
MainState_BeginFadeInOut: @ 0x080E29DC
	push {lr}
	sub sp, #4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080E2A08
	ldr r1, [r0]
	ldr r0, _080E2A0C
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080E2A08: .4byte 0x02039C34
_080E2A0C: .4byte 0x00001E10
	thumb_func_end MainState_BeginFadeInOut

	thumb_func_start MainState_WaitFadeOutAndExit
MainState_WaitFadeOutAndExit: @ 0x080E2A10
	push {r4, r5, lr}
	ldr r0, _080E2A64
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _080E2A5A
	ldr r4, _080E2A68
	ldr r0, [r4]
	ldr r1, _080E2A6C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080E2A34
	bl SeedRngAndSetTrainerId
_080E2A34:
	ldr r0, [r4]
	ldr r1, _080E2A70
	adds r0, r0, r1
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, _080E2A74
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	bl FreeAllWindowBuffers
	ldr r0, [r4]
	bl Free
	str r5, [r4]
_080E2A5A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E2A64: .4byte 0x02037C74
_080E2A68: .4byte 0x02039C34
_080E2A6C: .4byte 0x00001E2C
_080E2A70: .4byte 0x00001E3C
_080E2A74: .4byte 0x080E2679
	thumb_func_end MainState_WaitFadeOutAndExit

	thumb_func_start DisplaySentToPCMessage
DisplaySentToPCMessage: @ 0x080E2A78
	push {r4, r5, lr}
	sub sp, #0x10
	movs r5, #0
	bl sub_0813B298
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E2AC8
	ldr r4, _080E2AB4
	ldr r0, _080E2AB8
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r0, _080E2ABC
	ldr r1, _080E2AC0
	ldr r1, [r1]
	ldr r2, _080E2AC4
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	b _080E2B08
	.align 2, 0
_080E2AB4: .4byte 0x02021C40
_080E2AB8: .4byte 0x00004036
_080E2ABC: .4byte 0x02021C54
_080E2AC0: .4byte 0x02039C34
_080E2AC4: .4byte 0x00001E30
_080E2AC8:
	ldr r4, _080E2B70
	ldr r0, _080E2B74
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r0, _080E2B78
	ldr r1, _080E2B7C
	ldr r1, [r1]
	ldr r2, _080E2B80
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r4, _080E2B84
	bl get_unknown_box_id
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	movs r5, #2
_080E2B08:
	ldr r0, _080E2B88
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E2B1A
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080E2B1A:
	ldr r4, _080E2B8C
	ldr r1, _080E2B90
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _080E2B94
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	bl GetPlayerTextSpeedDelay
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	bl AddTextPrinterParameterized2
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2B70: .4byte 0x02021C40
_080E2B74: .4byte 0x00004036
_080E2B78: .4byte 0x02021C54
_080E2B7C: .4byte 0x02039C34
_080E2B80: .4byte 0x00001E30
_080E2B84: .4byte 0x02021C68
_080E2B88: .4byte 0x000008AB
_080E2B8C: .4byte 0x02021C7C
_080E2B90: .4byte 0x08565858
_080E2B94: .4byte 0x030030B4
	thumb_func_end DisplaySentToPCMessage

	thumb_func_start sub_080E2B98
sub_080E2B98: @ 0x080E2B98
	push {lr}
	bl RunTextPrinters
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080E2BC2
	ldr r0, _080E2BC8
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080E2BC2
	ldr r0, _080E2BCC
	ldr r0, [r0]
	ldr r1, _080E2BD0
	adds r0, r0, r1
	movs r1, #8
	strb r1, [r0]
_080E2BC2:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080E2BC8: .4byte 0x03002360
_080E2BCC: .4byte 0x02039C34
_080E2BD0: .4byte 0x00001E10
	thumb_func_end sub_080E2B98

	thumb_func_start MainState_StartPageSwap
MainState_StartPageSwap: @ 0x080E2BD4
	push {lr}
	movs r0, #0
	bl SetInputState
	bl sub_080E3510
	bl StartPageSwapAnim
	movs r0, #1
	bl sub_080E3320
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl sub_080E2E78
	movs r0, #6
	bl PlaySE
	ldr r0, _080E2C0C
	ldr r0, [r0]
	ldr r1, _080E2C10
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080E2C0C: .4byte 0x02039C34
_080E2C10: .4byte 0x00001E10
	thumb_func_end MainState_StartPageSwap

	thumb_func_start sub_080E2C14
sub_080E2C14: @ 0x080E2C14
	push {r4, lr}
	bl IsPageSwapAnimNotInProgress
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E2C56
	ldr r2, _080E2C60
	ldr r0, [r2]
	ldr r1, _080E2C64
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r2]
	ldr r3, _080E2C68
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r4, [r2]
	adds r4, r4, r3
	ldrb r0, [r4]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4]
	bl sub_080E4648
	movs r0, #1
	bl SetInputState
	movs r0, #0
	bl sub_080E3320
_080E2C56:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E2C60: .4byte 0x02039C34
_080E2C64: .4byte 0x00001E10
_080E2C68: .4byte 0x00001E22
	thumb_func_end sub_080E2C14

	thumb_func_start StartPageSwapAnim
StartPageSwapAnim: @ 0x080E2C6C
	push {r4, lr}
	ldr r4, _080E2C88
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2C88: .4byte 0x080E2C8D
	thumb_func_end StartPageSwapAnim

	thumb_func_start Task_HandlePageSwapAnim
Task_HandlePageSwapAnim: @ 0x080E2C8C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080E2CBC
	ldr r2, _080E2CC0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_080E2C9E:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E2C9E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2CBC: .4byte 0x08565A50
_080E2CC0: .4byte 0x03005B60
	thumb_func_end Task_HandlePageSwapAnim

	thumb_func_start IsPageSwapAnimNotInProgress
IsPageSwapAnimNotInProgress: @ 0x080E2CC4
	push {lr}
	ldr r0, _080E2CD8
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _080E2CDC
	movs r0, #0
	b _080E2CDE
	.align 2, 0
_080E2CD8: .4byte 0x080E2C8D
_080E2CDC:
	movs r0, #1
_080E2CDE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPageSwapAnimNotInProgress

	thumb_func_start PageSwapAnimState_Init
PageSwapAnimState_Init: @ 0x080E2CE4
	ldr r1, _080E2D00
	ldr r1, [r1]
	ldr r3, _080E2D04
	adds r2, r1, r3
	movs r3, #0
	strh r3, [r2]
	ldr r2, _080E2D08
	adds r1, r1, r2
	strh r3, [r1]
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	movs r0, #0
	bx lr
	.align 2, 0
_080E2D00: .4byte 0x02039C34
_080E2D04: .4byte 0x00001E18
_080E2D08: .4byte 0x00001E1A
	thumb_func_end PageSwapAnimState_Init

	thumb_func_start PageSwapAnimState_1
PageSwapAnimState_1: @ 0x080E2D0C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _080E2D8C
	ldr r0, [r5]
	ldr r2, _080E2D90
	adds r1, r0, r2
	str r1, [sp]
	ldr r1, _080E2D94
	adds r0, r0, r1
	str r0, [sp, #4]
	ldrh r0, [r4, #0xa]
	adds r0, #4
	strh r0, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	movs r1, #0x28
	bl Sin
	ldr r1, [r5]
	movs r2, #0xf1
	lsls r2, r2, #5
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	ldrh r0, [r4, #0xa]
	adds r0, #0x80
	movs r1, #0xff
	ands r0, r1
	movs r1, #0x28
	bl Sin
	ldr r1, [r5]
	ldr r2, _080E2D98
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0x3f
	ble _080E2D82
	ldr r0, [r5]
	ldr r1, _080E2D9C
	adds r2, r0, r1
	ldrb r3, [r2]
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	strh r3, [r0]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080E2D82:
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E2D8C: .4byte 0x02039C34
_080E2D90: .4byte 0x00001E1A
_080E2D94: .4byte 0x00001E18
_080E2D98: .4byte 0x00001E21
_080E2D9C: .4byte 0x00001E1C
	thumb_func_end PageSwapAnimState_1

	thumb_func_start PageSwapAnimState_2
PageSwapAnimState_2: @ 0x080E2DA0
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _080E2E24
	ldr r0, [r5]
	ldr r2, _080E2E28
	adds r1, r0, r2
	str r1, [sp]
	ldr r3, _080E2E2C
	adds r0, r0, r3
	str r0, [sp, #4]
	ldrh r0, [r4, #0xa]
	adds r0, #4
	strh r0, [r4, #0xa]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r1, #0x28
	bl Sin
	ldr r1, [r5]
	movs r2, #0xf1
	lsls r2, r2, #5
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	ldrh r0, [r4, #0xa]
	adds r0, #0x80
	movs r1, #0xff
	ands r0, r1
	movs r1, #0x28
	bl Sin
	ldr r1, [r5]
	ldr r3, _080E2E30
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	ble _080E2E1A
	ldr r0, [r5]
	movs r2, #0xf1
	lsls r2, r2, #5
	adds r1, r0, r2
	ldrb r2, [r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r0, r3
	strb r2, [r0]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080E2E1A:
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E2E24: .4byte 0x02039C34
_080E2E28: .4byte 0x00001E1A
_080E2E2C: .4byte 0x00001E18
_080E2E30: .4byte 0x00001E21
	thumb_func_end PageSwapAnimState_2

	thumb_func_start PageSwapAnimState_Done
PageSwapAnimState_Done: @ 0x080E2E34
	push {lr}
	ldr r0, _080E2E4C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080E2E4C: .4byte 0x080E2C8D
	thumb_func_end PageSwapAnimState_Done

	thumb_func_start MoveCursorToOKButton
MoveCursorToOKButton: @ 0x080E2E50
	push {lr}
	ldr r0, _080E2E70
	movs r1, #3
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080E2E74
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #3
	strh r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080E2E70: .4byte 0x080E2EED
_080E2E74: .4byte 0x03005B60
	thumb_func_end MoveCursorToOKButton

	thumb_func_start sub_080E2E78
sub_080E2E78: @ 0x080E2E78
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _080E2EB0
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080E2EB4
	adds r4, r1, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r5, r0
	bne _080E2EB8
	cmp r6, #0
	bne _080E2EB8
	strh r7, [r4, #0xa]
	movs r0, #1
	strh r0, [r4, #0xc]
	b _080E2EE4
	.align 2, 0
_080E2EB0: .4byte 0x080E2EED
_080E2EB4: .4byte 0x03005B60
_080E2EB8:
	cmp r5, #3
	bne _080E2EC8
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _080E2EC8
	cmp r6, #0
	beq _080E2EE4
_080E2EC8:
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #3
	beq _080E2EDA
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl sub_080E3018
_080E2EDA:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_080E3040
_080E2EE4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E2E78

	thumb_func_start Task_80E39BC
Task_80E39BC: @ 0x080E2EEC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080E2F54
	adds r4, r1, r0
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #3
	beq _080E2F9E
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080E2F9E
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl sub_080E2FA4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r3, [r4, #0xe]
	adds r1, r3, #0
	adds r2, r3, #0
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r1, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080E2F38
	subs r0, r1, #1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080E2F9E
_080E2F38:
	movs r0, #2
	strh r0, [r4, #0x12]
	ldrh r1, [r4, #0x10]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r0, #0
	blt _080E2F62
	ldrh r2, [r4, #0xe]
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r0, #0xd
	bgt _080E2F58
	adds r0, r2, r1
	b _080E2F66
	.align 2, 0
_080E2F54: .4byte 0x03005B60
_080E2F58:
	movs r0, #0x10
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0x14]
	adds r0, #1
	b _080E2F6C
_080E2F62:
	ldrh r3, [r4, #0xe]
	adds r0, r1, r3
_080E2F66:
	strh r0, [r4, #0xe]
	ldrh r2, [r4, #0x14]
	adds r0, r1, r2
_080E2F6C:
	strh r0, [r4, #0x14]
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	ldrh r1, [r4, #0xe]
	cmp r0, #0x10
	bne _080E2F8C
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, #0x16
	bne _080E2F8C
	ldr r0, _080E2F88
	strh r0, [r4, #0x10]
	b _080E2F9E
	.align 2, 0
_080E2F88: .4byte 0x0000FFFC
_080E2F8C:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _080E2F9E
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x14]
_080E2F9E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_80E39BC

	thumb_func_start sub_080E2FA4
sub_080E2FA4: @ 0x080E2FA4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #4
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	movs r1, #0x87
	lsls r1, r1, #1
	adds r5, r1, #0
	adds r0, r0, r5
	add r6, sp, #8
	strh r0, [r6]
	movs r0, #6
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	mov r1, sp
	adds r1, #0xa
	strh r0, [r1]
	movs r0, #7
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	add r1, sp, #0xc
	strh r0, [r1]
	movs r0, #7
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	ldr r1, _080E3014
	adds r0, r0, r1
	mov r1, sp
	adds r1, #0xe
	strh r0, [r1]
	mov r0, sp
	adds r1, r6, #0
	movs r2, #8
	bl memcpy
	lsls r4, r4, #1
	mov r1, sp
	adds r0, r1, r4
	ldrh r0, [r0]
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080E3014: .4byte 0x00000101
	thumb_func_end sub_080E2FA4

	thumb_func_start sub_080E3018
sub_080E3018: @ 0x080E3018
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080E2FA4
	lsls r0, r0, #0x10
	ldr r2, _080E3038
	lsrs r0, r0, #0xf
	adds r2, r0, r2
	ldr r1, _080E303C
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080E3038: .4byte 0x020377B4
_080E303C: .4byte 0x020373B4
	thumb_func_end sub_080E3018

	thumb_func_start sub_080E3040
sub_080E3040: @ 0x080E3040
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #0
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	movs r1, #1
	strh r1, [r0, #0xc]
	movs r2, #4
	strh r2, [r0, #0xe]
	movs r1, #2
	strh r1, [r0, #0x10]
	strh r3, [r0, #0x12]
	strh r2, [r0, #0x14]
	bx lr
	thumb_func_end sub_080E3040

	thumb_func_start sub_080E3060
sub_080E3060: @ 0x080E3060
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080E3078
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
_080E3078:
	ldrh r1, [r4, #0x36]
	movs r0, #0xff
	ands r0, r1
	adds r3, r4, #0
	adds r3, #0x3e
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	ldrb r1, [r3]
	movs r2, #5
	rsbs r2, r2, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x13
	bne _080E30A2
	movs r0, #4
	orrs r2, r0
	strb r2, [r3]
_080E30A2:
	ldrb r1, [r3]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080E30D2
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080E30D2
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E30D2
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080E30DC
_080E30D2:
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #2
	strh r0, [r4, #0x3a]
	strh r0, [r4, #0x3c]
_080E30DC:
	ldrh r0, [r4, #0x3c]
	subs r0, #1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080E3104
	ldrh r1, [r4, #0x3a]
	ldrh r2, [r4, #0x38]
	adds r0, r1, r2
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	beq _080E30FC
	cmp r0, #0
	bne _080E3100
_080E30FC:
	rsbs r0, r1, #0
	strh r0, [r4, #0x3a]
_080E3100:
	movs r0, #2
	strh r0, [r4, #0x3c]
_080E3104:
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080E313A
	ldrh r4, [r4, #0x38]
	lsls r5, r4, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #4
	ldr r2, _080E3140
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r5, #0
	bl MultiplyInvertedPaletteRGBComponents
_080E313A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3140: .4byte 0x01010000
	thumb_func_end sub_080E3060

	thumb_func_start sub_080E3144
sub_080E3144: @ 0x080E3144
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080E318C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080E3168
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080E3176
_080E3168:
	movs r0, #8
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
_080E3176:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x24]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E318C: .4byte 0x08565A60
	thumb_func_end sub_080E3144

	thumb_func_start sub_080E3190
sub_080E3190: @ 0x080E3190
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080E31B8
	mov r0, sp
	movs r2, #8
	bl memcpy
	bl GetTextCaretPosition
	lsls r0, r0, #0x18
	ldrh r1, [r4, #0x2e]
	lsls r1, r1, #0x18
	cmp r0, r1
	beq _080E31BC
	movs r0, #0
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x30]
	b _080E31E2
	.align 2, 0
_080E31B8: .4byte 0x08565A68
_080E31BC:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080E31E4
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r0, #0
_080E31E2:
	strh r0, [r4, #0x32]
_080E31E4:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080E3190

	thumb_func_start sub_080E31EC
sub_080E31EC: @ 0x080E31EC
	push {lr}
	bl CursorInit
	bl CreatePageSwitcherSprites
	bl CreateBackOkSprites
	bl CreateUnderscoreSprites
	bl CreateInputTargetIcon
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E31EC

	thumb_func_start CursorInit
CursorInit: @ 0x080E3208
	push {r4, r5, r6, lr}
	ldr r0, _080E328C
	movs r1, #0x1b
	movs r2, #0x57
	movs r3, #1
	bl CreateSprite
	ldr r5, _080E3290
	ldr r1, [r5]
	ldr r4, _080E3294
	adds r1, r1, r4
	strb r0, [r1]
	movs r0, #1
	bl sub_080E3320
	ldr r6, _080E3298
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r3, [r1, #5]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	movs r3, #4
	orrs r0, r3
	strb r0, [r1, #5]
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0, #1]
	ands r2, r1
	orrs r2, r3
	strb r2, [r0, #1]
	ldr r2, [r5]
	adds r2, r2, r4
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	strh r1, [r0, #0x3a]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #2
	strh r1, [r0, #0x3a]
	movs r0, #0
	movs r1, #0
	bl sub_080E329C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E328C: .4byte 0x08565E50
_080E3290: .4byte 0x02039C34
_080E3294: .4byte 0x00001E23
_080E3298: .4byte 0x020205AC
	thumb_func_end CursorInit

	thumb_func_start sub_080E329C
sub_080E329C: @ 0x080E329C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _080E32D8
	ldr r2, [r2]
	ldr r3, _080E32DC
	adds r2, r2, r3
	ldrb r3, [r2]
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, _080E32E0
	adds r2, r2, r3
	lsrs r4, r0, #0x10
	asrs r0, r0, #0xd
	adds r0, #0x1b
	strh r0, [r2, #0x20]
	lsrs r3, r1, #0x10
	asrs r1, r1, #0xc
	adds r1, #0x57
	strh r1, [r2, #0x22]
	ldrh r0, [r2, #0x2e]
	strh r0, [r2, #0x32]
	ldrh r0, [r2, #0x30]
	strh r0, [r2, #0x34]
	strh r4, [r2, #0x2e]
	strh r3, [r2, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E32D8: .4byte 0x02039C34
_080E32DC: .4byte 0x00001E23
_080E32E0: .4byte 0x020205AC
	thumb_func_end sub_080E329C

	thumb_func_start GetCursorPos
GetCursorPos: @ 0x080E32E4
	ldr r2, _080E3304
	ldr r2, [r2]
	ldr r3, _080E3308
	adds r2, r2, r3
	ldrb r3, [r2]
	lsls r2, r3, #4
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, _080E330C
	adds r2, r2, r3
	ldrh r3, [r2, #0x2e]
	strh r3, [r0]
	ldrh r0, [r2, #0x30]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080E3304: .4byte 0x02039C34
_080E3308: .4byte 0x00001E23
_080E330C: .4byte 0x020205AC
	thumb_func_end GetCursorPos

	thumb_func_start sub_080E3310
sub_080E3310: @ 0x080E3310
	push {lr}
	movs r0, #0x13
	movs r1, #2
	bl sub_080E329C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E3310

	thumb_func_start sub_080E3320
sub_080E3320: @ 0x080E3320
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080E3368
	ldr r1, _080E336C
	ldr r4, [r1]
	ldr r1, _080E3370
	adds r4, r4, r1
	ldrb r1, [r4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r5
	ldrh r3, [r2, #0x36]
	ldr r1, _080E3374
	ands r1, r3
	strh r1, [r2, #0x36]
	ldrb r2, [r4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r2, [r1, #0x36]
	orrs r0, r2
	strh r0, [r1, #0x36]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	bl StartSpriteAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3368: .4byte 0x020205AC
_080E336C: .4byte 0x02039C34
_080E3370: .4byte 0x00001E23
_080E3374: .4byte 0xFFFFFF00
	thumb_func_end sub_080E3320

	thumb_func_start sub_080E3378
sub_080E3378: @ 0x080E3378
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	ldr r5, _080E33B0
	ldr r1, _080E33B4
	ldr r4, [r1]
	ldr r1, _080E33B8
	adds r4, r4, r1
	ldrb r1, [r4]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r5
	ldrh r3, [r2, #0x36]
	movs r1, #0xff
	ands r1, r3
	strh r1, [r2, #0x36]
	ldrb r2, [r4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	lsrs r0, r0, #0x10
	ldrh r2, [r1, #0x36]
	orrs r0, r2
	strh r0, [r1, #0x36]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E33B0: .4byte 0x020205AC
_080E33B4: .4byte 0x02039C34
_080E33B8: .4byte 0x00001E23
	thumb_func_end sub_080E3378

	thumb_func_start sub_080E33BC
sub_080E33BC: @ 0x080E33BC
	push {lr}
	ldr r0, _080E33DC
	ldr r0, [r0]
	ldr r1, _080E33E0
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E33E4
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080E33DC: .4byte 0x02039C34
_080E33E0: .4byte 0x00001E23
_080E33E4: .4byte 0x020205AC
	thumb_func_end sub_080E33BC

	thumb_func_start IsCursorAnimFinished
IsCursorAnimFinished: @ 0x080E33E8
	ldr r2, _080E3408
	ldr r0, _080E340C
	ldr r0, [r0]
	ldr r1, _080E3410
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_080E3408: .4byte 0x020205AC
_080E340C: .4byte 0x02039C34
_080E3410: .4byte 0x00001E23
	thumb_func_end IsCursorAnimFinished

	thumb_func_start GetKeyRoleAtCursorPos
GetKeyRoleAtCursorPos: @ 0x080E3414
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetCursorPos
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x12
	ble _080E3440
	ldr r0, _080E343C
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, r1, r0
	ldrb r0, [r1]
	b _080E3442
	.align 2, 0
_080E343C: .4byte 0x08565A70
_080E3440:
	movs r0, #0
_080E3442:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetKeyRoleAtCursorPos

	thumb_func_start CreatePageSwitcherSprites
CreatePageSwitcherSprites: @ 0x080E344C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _080E34F0
	movs r1, #0xcc
	movs r2, #0x58
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080E34F4
	ldr r1, [r1]
	ldr r2, _080E34F8
	adds r1, r1, r2
	strb r0, [r1]
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r0, _080E34FC
	mov r8, r0
	add r5, r8
	ldr r1, _080E3500
	adds r0, r5, #0
	bl SetSubspriteTables
	adds r1, r5, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r6, #4
	orrs r0, r6
	strb r0, [r1]
	ldr r0, _080E3504
	movs r1, #0xcc
	movs r2, #0x54
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0x3a]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	add r4, r8
	ldr r1, _080E3508
	adds r0, r4, #0
	bl SetSubspriteTables
	adds r4, #0x3e
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	ldr r0, _080E350C
	movs r1, #0xcc
	movs r2, #0x53
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, r8
	ldrb r3, [r2, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r6
	strb r1, [r2, #5]
	strh r0, [r5, #0x3c]
	adds r2, #0x3e
	ldrb r0, [r2]
	orrs r0, r6
	strb r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E34F0: .4byte 0x08565DD8
_080E34F4: .4byte 0x02039C34
_080E34F8: .4byte 0x00001E24
_080E34FC: .4byte 0x020205AC
_080E3500: .4byte 0x08565D68
_080E3504: .4byte 0x08565E08
_080E3508: .4byte 0x08565D70
_080E350C: .4byte 0x08565DF0
	thumb_func_end CreatePageSwitcherSprites

	thumb_func_start sub_080E3510
sub_080E3510: @ 0x080E3510
	ldr r0, _080E3534
	ldr r2, [r0]
	ldr r1, _080E3538
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E353C
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0, #0x2e]
	ldr r1, _080E3540
	adds r2, r2, r1
	ldrb r1, [r2]
	strh r1, [r0, #0x30]
	bx lr
	.align 2, 0
_080E3534: .4byte 0x02039C34
_080E3538: .4byte 0x00001E24
_080E353C: .4byte 0x020205AC
_080E3540: .4byte 0x00001E22
	thumb_func_end sub_080E3510

	thumb_func_start sub_080E3544
sub_080E3544: @ 0x080E3544
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080E3568
_080E354A:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E354A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3568: .4byte 0x08565A74
	thumb_func_end sub_080E3544

	thumb_func_start sub_080E356C
sub_080E356C: @ 0x080E356C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r1, _080E35B4
	adds r5, r5, r1
	movs r2, #0x3c
	ldrsh r0, [r6, r2]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r0, _080E35B8
	ldr r0, [r0]
	ldr r1, _080E35BC
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetCurrentPageColumnCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080E3678
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080E35B4: .4byte 0x020205AC
_080E35B8: .4byte 0x02039C34
_080E35BC: .4byte 0x00001E22
	thumb_func_end sub_080E356C

	thumb_func_start sub_080E35C0
sub_080E35C0: @ 0x080E35C0
	movs r0, #0
	bx lr
	thumb_func_end sub_080E35C0

	thumb_func_start sub_080E35C4
sub_080E35C4: @ 0x080E35C4
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _080E3630
	adds r4, r0, r2
	movs r0, #0x3c
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r0, r2
	ldrh r0, [r4, #0x26]
	adds r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080E3628
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	ldr r0, _080E3634
	strh r0, [r4, #0x26]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #1
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCurrentPageColumnCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080E3678
_080E3628:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E3630: .4byte 0x020205AC
_080E3634: .4byte 0x0000FFFC
	thumb_func_end sub_080E35C4

	thumb_func_start sub_080E3638
sub_080E3638: @ 0x080E3638
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080E3674
	adds r2, r0, r1
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, #0x26]
	adds r0, #1
	strh r0, [r2, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080E366C
	movs r0, #0
	strh r0, [r2, #0x26]
	movs r0, #1
	strh r0, [r4, #0x2e]
_080E366C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E3674: .4byte 0x020205AC
	thumb_func_end sub_080E3638

	thumb_func_start sub_080E3678
sub_080E3678: @ 0x080E3678
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080E36D0
	lsls r4, r5, #1
	adds r0, r4, r0
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #4
	mov r1, r8
	ldrb r2, [r1, #5]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r0
	mov r0, r8
	strb r1, [r0, #5]
	ldr r0, _080E36D4
	adds r4, r4, r0
	ldrh r0, [r4]
	bl GetSpriteTileStartByTag
	adds r1, r6, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r6, #0x42
	movs r1, #0x3f
	ands r1, r5
	ldrb r2, [r6]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E36D0: .4byte 0x08565A84
_080E36D4: .4byte 0x08565A8A
	thumb_func_end sub_080E3678

	thumb_func_start CreateBackOkSprites
CreateBackOkSprites: @ 0x080E36D8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _080E3740
	movs r1, #0xcc
	movs r2, #0x74
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r6, _080E3744
	adds r4, r4, r6
	ldr r0, _080E3748
	mov r8, r0
	adds r0, r4, #0
	mov r1, r8
	bl SetSubspriteTables
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r5, #4
	orrs r0, r5
	strb r0, [r4]
	ldr r0, _080E374C
	movs r1, #0xcc
	movs r2, #0x8c
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r6
	adds r0, r4, #0
	mov r1, r8
	bl SetSubspriteTables
	adds r4, #0x3e
	ldrb r0, [r4]
	orrs r0, r5
	strb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3740: .4byte 0x08565E20
_080E3744: .4byte 0x020205AC
_080E3748: .4byte 0x08565D88
_080E374C: .4byte 0x08565E38
	thumb_func_end CreateBackOkSprites

	thumb_func_start CreateUnderscoreSprites
CreateUnderscoreSprites: @ 0x080E3750
	push {r4, r5, r6, lr}
	ldr r5, _080E3808
	ldr r0, [r5]
	ldr r4, _080E380C
	adds r0, r0, r4
	ldrh r1, [r0]
	subs r1, #1
	lsls r1, r1, #3
	adds r1, #4
	ldr r0, _080E3810
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x38
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080E3814
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r1, [r5]
	adds r4, r1, r4
	ldrh r0, [r4]
	lsls r0, r0, #3
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r0, _080E3818
	adds r1, r1, r0
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	cmp r5, r0
	bhs _080E3800
	adds r6, r3, #0
_080E37AE:
	lsls r1, r4, #0x10
	asrs r4, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xa
	adds r1, r1, r0
	asrs r1, r1, #0x10
	ldr r0, _080E381C
	movs r2, #0x3c
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	strh r5, [r0, #0x2e]
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #0xa
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080E3808
	ldr r0, [r0]
	ldr r1, _080E3818
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r5, r0
	blo _080E37AE
_080E3800:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3808: .4byte 0x02039C34
_080E380C: .4byte 0x00001E16
_080E3810: .4byte 0x08565E68
_080E3814: .4byte 0x020205AC
_080E3818: .4byte 0x00001E28
_080E381C: .4byte 0x08565E80
	thumb_func_end CreateUnderscoreSprites

	thumb_func_start CreateInputTargetIcon
CreateInputTargetIcon: @ 0x080E3820
	push {lr}
	ldr r1, _080E3840
	ldr r0, _080E3844
	ldr r0, [r0]
	ldr r2, _080E3848
	adds r0, r0, r2
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end CreateInputTargetIcon

	thumb_func_start TaskDummy3
TaskDummy3: @ 0x080E383C
	bx r0
	.align 2, 0
_080E3840: .4byte 0x08565A90
_080E3844: .4byte 0x02039C34
_080E3848: .4byte 0x00001E28
	thumb_func_end TaskDummy3

	thumb_func_start TaskDummy2
TaskDummy2: @ 0x080E384C
	bx lr
	.align 2, 0
	thumb_func_end TaskDummy2

	thumb_func_start NamingScreen_CreatePlayerIcon
NamingScreen_CreatePlayerIcon: @ 0x080E3850
	push {lr}
	sub sp, #4
	ldr r0, _080E389C
	ldr r0, [r0]
	ldr r1, _080E38A0
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080E38A4
	movs r2, #0
	str r2, [sp]
	movs r2, #0x38
	movs r3, #0x25
	bl AddPseudoEventObject
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080E38A8
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	movs r1, #4
	bl StartSpriteAnim
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080E389C: .4byte 0x02039C34
_080E38A0: .4byte 0x00001E34
_080E38A4: .4byte 0x08007141
_080E38A8: .4byte 0x020205AC
	thumb_func_end NamingScreen_CreatePlayerIcon

	thumb_func_start NamingScreen_CreatePCIcon
NamingScreen_CreatePCIcon: @ 0x080E38AC
	push {r4, lr}
	ldr r0, _080E38E0
	movs r1, #0x38
	movs r2, #0x29
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080E38E4
	adds r4, r4, r0
	ldr r1, _080E38E8
	adds r0, r4, #0
	bl SetSubspriteTables
	ldrb r0, [r4, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E38E0: .4byte 0x08565E98
_080E38E4: .4byte 0x020205AC
_080E38E8: .4byte 0x08565D90
	thumb_func_end NamingScreen_CreatePCIcon

	thumb_func_start NamingScreen_CreateMonIcon
NamingScreen_CreateMonIcon: @ 0x080E38EC
	push {lr}
	sub sp, #0xc
	bl LoadMonIconPalettes
	ldr r0, _080E3934
	ldr r3, [r0]
	ldr r1, _080E3938
	adds r0, r3, r1
	ldrh r0, [r0]
	ldr r1, _080E393C
	movs r2, #0
	str r2, [sp]
	ldr r2, _080E3940
	adds r3, r3, r2
	ldr r2, [r3]
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0x38
	movs r3, #0x28
	bl CreateMonIcon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080E3944
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #5]
	movs r2, #0xc
	orrs r0, r2
	strb r0, [r1, #5]
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080E3934: .4byte 0x02039C34
_080E3938: .4byte 0x00001E34
_080E393C: .4byte 0x08007141
_080E3940: .4byte 0x00001E38
_080E3944: .4byte 0x020205AC
	thumb_func_end NamingScreen_CreateMonIcon

	thumb_func_start NamingScreen_CreateWandaDadIcon
NamingScreen_CreateWandaDadIcon: @ 0x080E3948
	push {lr}
	sub sp, #4
	ldr r1, _080E3980
	movs r0, #0
	str r0, [sp]
	movs r0, #0x13
	movs r2, #0x38
	movs r3, #0x25
	bl AddPseudoEventObject
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080E3984
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	movs r2, #0xc
	orrs r1, r2
	strb r1, [r0, #5]
	movs r1, #4
	bl StartSpriteAnim
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080E3980: .4byte 0x08007141
_080E3984: .4byte 0x020205AC
	thumb_func_end NamingScreen_CreateWandaDadIcon

	thumb_func_start HandleKeyboardEvent
HandleKeyboardEvent: @ 0x080E3988
	push {r4, r5, lr}
	bl GetInputEvent
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl GetKeyRoleAtCursorPos
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #8
	bne _080E39A6
	bl sub_080E3AB8
	b _080E39CC
_080E39A6:
	cmp r4, #6
	bne _080E39B0
	bl DeleteTextCharacter
	b _080E39DC
_080E39B0:
	cmp r4, #7
	bne _080E39BA
	bl sub_080E40A8
	b _080E39DC
_080E39BA:
	cmp r5, #9
	beq _080E39D8
	ldr r1, _080E39D4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_080E39CC:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080E39DE
	.align 2, 0
_080E39D4: .4byte 0x08565AA4
_080E39D8:
	bl sub_080E3310
_080E39DC:
	movs r0, #0
_080E39DE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end HandleKeyboardEvent

	thumb_func_start KeyboardKeyHandler_Character
KeyboardKeyHandler_Character: @ 0x080E39E4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_080E2E78
	cmp r4, #5
	bne _080E3A1E
	bl sub_080E4018
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_080E33BC
	cmp r4, #0
	beq _080E3A1E
	movs r0, #2
	bl SetInputState
	ldr r0, _080E3A28
	ldr r0, [r0]
	ldr r1, _080E3A2C
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
_080E3A1E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E3A28: .4byte 0x02039C34
_080E3A2C: .4byte 0x00001E10
	thumb_func_end KeyboardKeyHandler_Character

	thumb_func_start KeyboardKeyHandler_Page
KeyboardKeyHandler_Page: @ 0x080E3A30
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl sub_080E2E78
	cmp r4, #5
	beq _080E3A4A
	movs r0, #0
	b _080E3A52
_080E3A4A:
	bl sub_080E3AB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080E3A52:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end KeyboardKeyHandler_Page

	thumb_func_start KeyboardKeyHandler_Backspace
KeyboardKeyHandler_Backspace: @ 0x080E3A58
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl sub_080E2E78
	cmp r4, #5
	bne _080E3A72
	bl DeleteTextCharacter
_080E3A72:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end KeyboardKeyHandler_Backspace

	thumb_func_start KeyboardKeyHandler_OK
KeyboardKeyHandler_OK: @ 0x080E3A7C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl sub_080E2E78
	cmp r4, #5
	beq _080E3A96
	movs r0, #0
	b _080E3AAA
_080E3A96:
	movs r0, #5
	bl PlaySE
	ldr r0, _080E3AB0
	ldr r0, [r0]
	ldr r1, _080E3AB4
	adds r0, r0, r1
	movs r1, #6
	strb r1, [r0]
	movs r0, #1
_080E3AAA:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E3AB0: .4byte 0x02039C34
_080E3AB4: .4byte 0x00001E10
	thumb_func_end KeyboardKeyHandler_OK

	thumb_func_start sub_080E3AB8
sub_080E3AB8: @ 0x080E3AB8
	ldr r0, _080E3AC8
	ldr r0, [r0]
	ldr r1, _080E3ACC
	adds r0, r0, r1
	movs r1, #4
	strb r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
_080E3AC8: .4byte 0x02039C34
_080E3ACC: .4byte 0x00001E10
	thumb_func_end sub_080E3AB8

	thumb_func_start InputInit
InputInit: @ 0x080E3AD0
	push {lr}
	ldr r0, _080E3AE0
	movs r1, #1
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080E3AE0: .4byte 0x080E3B35
	thumb_func_end InputInit

	thumb_func_start GetInputEvent
GetInputEvent: @ 0x080E3AE4
	push {lr}
	ldr r0, _080E3B00
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080E3B04
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #0xa]
	pop {r1}
	bx r1
	.align 2, 0
_080E3B00: .4byte 0x080E3B35
_080E3B04: .4byte 0x03005B60
	thumb_func_end GetInputEvent

	thumb_func_start SetInputState
SetInputState: @ 0x080E3B08
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080E3B2C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080E3B30
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E3B2C: .4byte 0x080E3B35
_080E3B30: .4byte 0x03005B60
	thumb_func_end SetInputState

	thumb_func_start sub_080E3B34
sub_080E3B34: @ 0x080E3B34
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _080E3B5C
	ldr r2, _080E3B60
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #8
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080E3B5C: .4byte 0x08565AB4
_080E3B60: .4byte 0x03005B60
	thumb_func_end sub_080E3B34

	thumb_func_start InputState_2
InputState_2: @ 0x080E3B64
	movs r1, #0
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
	thumb_func_end InputState_2

	thumb_func_start InputState_Enabled
InputState_Enabled: @ 0x080E3B6C
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	strh r0, [r1, #0xa]
	ldr r0, _080E3B88
	ldrh r2, [r0, #0x2e]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080E3B8C
	movs r0, #5
	strh r0, [r1, #0xa]
	b _080E3BCC
	.align 2, 0
_080E3B88: .4byte 0x03002360
_080E3B8C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080E3B9A
	movs r0, #6
	strh r0, [r1, #0xa]
	b _080E3BCC
_080E3B9A:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080E3BA8
	movs r0, #8
	strh r0, [r1, #0xa]
	b _080E3BCC
_080E3BA8:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080E3BB6
	movs r0, #9
	strh r0, [r1, #0xa]
	b _080E3BCC
_080E3BB6:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080E3BC6
	movs r0, #7
	strh r0, [r1, #0xa]
	b _080E3BCC
_080E3BC6:
	adds r0, r1, #0
	bl HandleDpadMovement
_080E3BCC:
	pop {r0}
	bx r0
	thumb_func_end InputState_Enabled

	thumb_func_start sub_080E3BD0
sub_080E3BD0: @ 0x080E3BD0
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r0, _080E3BF0
	ldrh r1, [r0, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080E3BEA
	movs r0, #7
	strh r0, [r2, #0xa]
_080E3BEA:
	pop {r0}
	bx r0
	.align 2, 0
_080E3BF0: .4byte 0x03002360
	thumb_func_end sub_080E3BD0

	thumb_func_start HandleDpadMovement
HandleDpadMovement: @ 0x080E3BF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	ldr r1, _080E3CB8
	mov r0, sp
	movs r2, #0xa
	bl memcpy
	add r7, sp, #0xc
	ldr r1, _080E3CBC
	adds r0, r7, #0
	movs r2, #0xa
	bl memcpy
	add r0, sp, #0x18
	mov r8, r0
	ldr r1, _080E3CC0
	movs r2, #8
	bl memcpy
	add r1, sp, #0x20
	mov sb, r1
	ldr r1, _080E3CC4
	mov r0, sb
	movs r2, #6
	bl memcpy
	add r4, sp, #0x28
	mov r5, sp
	adds r5, #0x2a
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetCursorPos
	ldr r0, _080E3CC8
	ldrh r2, [r0, #0x30]
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080E3C58
	movs r1, #2
_080E3C58:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080E3C62
	movs r1, #3
_080E3C62:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080E3C6C
	movs r1, #4
_080E3C6C:
	ldrh r3, [r4]
	lsls r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldrh r2, [r0]
	adds r0, r3, r2
	strh r0, [r4]
	adds r1, r7, r1
	ldrh r0, [r1]
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080E3C90
	movs r0, #0x13
	strh r0, [r4]
_080E3C90:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x13
	ble _080E3C9C
	movs r0, #0
	strh r0, [r4]
_080E3C9C:
	lsls r0, r2, #0x10
	cmp r0, #0
	beq _080E3CE8
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x13
	bne _080E3CCC
	ldrh r0, [r5]
	strh r0, [r6, #0xc]
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	add r0, r8
	b _080E3CE4
	.align 2, 0
_080E3CB8: .4byte 0x08565AC0
_080E3CBC: .4byte 0x08565ACA
_080E3CC0: .4byte 0x08565AD4
_080E3CC4: .4byte 0x08565ADC
_080E3CC8: .4byte 0x03002360
_080E3CCC:
	cmp r3, #0x13
	bne _080E3CE8
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #1
	bne _080E3CDC
	ldrh r0, [r6, #0xc]
	b _080E3CE6
_080E3CDC:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	add r0, sb
_080E3CE4:
	ldrh r0, [r0]
_080E3CE6:
	strh r0, [r5]
_080E3CE8:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x13
	bne _080E3D1E
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _080E3CFC
	movs r0, #2
	strh r0, [r5]
_080E3CFC:
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #2
	ble _080E3D08
	movs r0, #0
	strh r0, [r5]
_080E3D08:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080E3D16
	movs r0, #1
	strh r0, [r6, #0xc]
	b _080E3D36
_080E3D16:
	cmp r0, #2
	bne _080E3D36
	strh r0, [r6, #0xc]
	b _080E3D36
_080E3D1E:
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _080E3D2A
	movs r0, #3
	strh r0, [r5]
_080E3D2A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #3
	ble _080E3D36
	movs r0, #0
	strh r0, [r5]
_080E3D36:
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl sub_080E329C
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end HandleDpadMovement

	thumb_func_start sub_080E3D50
sub_080E3D50: @ 0x080E3D50
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _080E3D98
	ldr r0, [r5]
	ldr r4, _080E3D9C
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r1, [r5]
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _080E3DA0
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r2, [r1, #8]
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #5
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3D98: .4byte 0x02039C34
_080E3D9C: .4byte 0x00001E14
_080E3DA0: .4byte 0x00001E28
	thumb_func_end sub_080E3D50

	thumb_func_start sub_080E3DA4
sub_080E3DA4: @ 0x080E3DA4
	push {r4, r5, lr}
	sub sp, #0x2c
	ldr r5, _080E3E10
	ldr r0, [r5]
	ldr r1, _080E3E14
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080E3E18
	adds r1, r1, r0
	add r0, sp, #0xc
	bl StringCopy
	ldr r0, [r5]
	ldr r1, _080E3E1C
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [r0, #8]
	add r0, sp, #0xc
	movs r2, #0xf
	bl StringAppendN
	ldr r0, [r5]
	ldr r4, _080E3E20
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	add r2, sp, #0xc
	movs r3, #9
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, #0x2c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3E10: .4byte 0x02039C34
_080E3E14: .4byte 0x00001E34
_080E3E18: .4byte 0x082EA31C
_080E3E1C: .4byte 0x00001E28
_080E3E20: .4byte 0x00001E14
	thumb_func_end sub_080E3DA4

	thumb_func_start sub_080E3E24
sub_080E3E24: @ 0x080E3E24
	push {lr}
	ldr r1, _080E3E40
	ldr r0, _080E3E44
	ldr r0, [r0]
	ldr r2, _080E3E48
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end sub_080E3E24

	thumb_func_start nullsub_10
nullsub_10: @ 0x080E3E3C
	pop {r0}
	bx r0
	.align 2, 0
_080E3E40: .4byte 0x08565AE4
_080E3E44: .4byte 0x02039C34
_080E3E48: .4byte 0x00001E2C
	thumb_func_end nullsub_10

	thumb_func_start sub_080E3E4C
sub_080E3E4C: @ 0x080E3E4C
	push {lr}
	ldr r1, _080E3E6C
	ldr r0, _080E3E70
	ldr r0, [r0]
	ldr r2, _080E3E74
	adds r0, r0, r2
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end sub_080E3E4C

	thumb_func_start InputState_Disabled
InputState_Disabled: @ 0x080E3E68
	bx r0
	.align 2, 0
_080E3E6C: .4byte 0x08565AF8
_080E3E70: .4byte 0x02039C34
_080E3E74: .4byte 0x00001E28
	thumb_func_end InputState_Disabled

	thumb_func_start sub_080E3E78
sub_080E3E78: @ 0x080E3E78
	bx lr
	.align 2, 0
	thumb_func_end sub_080E3E78

	thumb_func_start sub_080E3E7C
sub_080E3E7C: @ 0x080E3E7C
	push {r4, r5, lr}
	sub sp, #0x10
	movs r4, #0
	ldr r1, _080E3ED4
	add r0, sp, #0xc
	bl StringCopy
	ldr r5, _080E3ED8
	ldr r0, [r5]
	ldr r1, _080E3EDC
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _080E3ECA
	cmp r0, #0xfe
	bne _080E3EA6
	ldr r1, _080E3EE0
	add r0, sp, #0xc
	bl StringCopy
	movs r4, #1
_080E3EA6:
	ldr r0, [r5]
	ldr r1, _080E3EE4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r4, #1
	adds r1, r1, r4
	ldr r2, _080E3EE8
	adds r1, r1, r2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	add r1, sp, #0xc
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #0x5b
	movs r3, #1
	bl AddTextPrinterParameterized3
_080E3ECA:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3ED4: .4byte 0x085C940A
_080E3ED8: .4byte 0x02039C34
_080E3EDC: .4byte 0x00001E36
_080E3EE0: .4byte 0x085C940C
_080E3EE4: .4byte 0x00001E13
_080E3EE8: .4byte 0x08565B00
	thumb_func_end sub_080E3E7C

	thumb_func_start GetCharAtKeyboardPos
GetCharAtKeyboardPos: @ 0x080E3EEC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_080E2788
	ldr r1, _080E3F1C
	lsls r4, r4, #0x10
	asrs r4, r4, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x14
	adds r4, r4, r0
	adds r4, r4, r1
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E3F1C: .4byte 0x08565EB0
	thumb_func_end GetCharAtKeyboardPos

	thumb_func_start GetTextCaretPosition
GetTextCaretPosition: @ 0x080E3F20
	push {r4, r5, lr}
	movs r2, #0
	ldr r0, _080E3F48
	ldr r4, [r0]
	ldr r3, _080E3F4C
	adds r1, r4, r3
	ldr r1, [r1]
	ldrb r3, [r1, #1]
	adds r5, r0, #0
	cmp r2, r3
	bhs _080E3F5A
	movs r0, #0xc0
	lsls r0, r0, #5
	adds r1, r4, r0
_080E3F3C:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080E3F50
	adds r0, r2, #0
	b _080E3F6A
	.align 2, 0
_080E3F48: .4byte 0x02039C34
_080E3F4C: .4byte 0x00001E28
_080E3F50:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r3
	blo _080E3F3C
_080E3F5A:
	ldr r0, [r5]
	ldr r1, _080E3F70
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080E3F6A:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E3F70: .4byte 0x00001E28
	thumb_func_end GetTextCaretPosition

	thumb_func_start GetPreviousTextCaretPosition
GetPreviousTextCaretPosition: @ 0x080E3F74
	push {lr}
	ldr r0, _080E3FA0
	ldr r2, [r0]
	ldr r1, _080E3FA4
	adds r0, r2, r1
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	subs r0, #1
	lsls r1, r0, #0x18
	cmp r1, #0
	ble _080E3FB0
	movs r0, #0xc0
	lsls r0, r0, #5
	adds r3, r2, r0
_080E3F90:
	asrs r2, r1, #0x18
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080E3FA8
	lsrs r0, r1, #0x18
	b _080E3FB2
	.align 2, 0
_080E3FA0: .4byte 0x02039C34
_080E3FA4: .4byte 0x00001E28
_080E3FA8:
	subs r0, r2, #1
	lsls r1, r0, #0x18
	cmp r1, #0
	bgt _080E3F90
_080E3FB0:
	movs r0, #0
_080E3FB2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPreviousTextCaretPosition

	thumb_func_start DeleteTextCharacter
DeleteTextCharacter: @ 0x080E3FB8
	push {r4, r5, r6, lr}
	bl GetPreviousTextCaretPosition
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _080E4014
	ldr r0, [r6]
	movs r5, #0xc0
	lsls r5, r5, #5
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	bl sub_080E4510
	bl sub_080E3E4C
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #0xff
	strb r1, [r0]
	bl GetKeyRoleAtCursorPos
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080E3FFC
	cmp r0, #2
	bne _080E4006
_080E3FFC:
	movs r0, #1
	movs r1, #0
	movs r2, #1
	bl sub_080E2E78
_080E4006:
	movs r0, #0x17
	bl PlaySE
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E4014: .4byte 0x02039C34
	thumb_func_end DeleteTextCharacter

	thumb_func_start sub_080E4018
sub_080E4018: @ 0x080E4018
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetCursorPos
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl GetCharAtKeyboardPos
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	movs r4, #1
	cmp r0, #0xff
	bne _080E4048
	bl sub_080E4110
	b _080E4050
_080E4048:
	cmp r0, #0xfe
	bne _080E4056
	bl sub_080E414C
_080E4050:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _080E405C
_080E4056:
	adds r0, r1, #0
	bl AddTextCharacter
_080E405C:
	bl sub_080E4510
	bl sub_080E3E4C
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r0, #5
	bl PlaySE
	cmp r4, #0
	beq _080E409C
	bl GetPreviousTextCaretPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080E4094
	ldr r1, [r1]
	ldr r2, _080E4098
	adds r1, r1, r2
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	subs r1, #1
	cmp r0, r1
	bne _080E409C
	movs r0, #1
	b _080E409E
	.align 2, 0
_080E4094: .4byte 0x02039C34
_080E4098: .4byte 0x00001E28
_080E409C:
	movs r0, #0
_080E409E:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080E4018

	thumb_func_start sub_080E40A8
sub_080E40A8: @ 0x080E40A8
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	bl GetPreviousTextCaretPosition
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r6, _080E40E0
	ldr r0, [r6]
	movs r5, #0xc0
	lsls r5, r5, #5
	adds r0, r0, r5
	adds r0, r0, r3
	ldrb r1, [r0]
	ldr r2, _080E40E4
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080E40F6
	ldr r7, _080E40E8
_080E40CC:
	ldrb r0, [r2]
	cmp r1, r0
	bne _080E40EC
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r3
	adds r1, r4, r7
	ldrb r1, [r1]
	strb r1, [r0]
	b _080E40F6
	.align 2, 0
_080E40E0: .4byte 0x02039C34
_080E40E4: .4byte 0x08565B06
_080E40E8: .4byte 0x08565BC1
_080E40EC:
	adds r2, #1
	adds r4, #1
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080E40CC
_080E40F6:
	bl sub_080E4510
	bl sub_080E3E4C
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r0, #5
	bl PlaySE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080E40A8

	thumb_func_start sub_080E4110
sub_080E4110: @ 0x080E4110
	push {r4, r5, lr}
	bl GetPreviousTextCaretPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080E4138
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_080E41B0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E413C
	movs r0, #0
	b _080E4146
	.align 2, 0
_080E4138: .4byte 0x02039C34
_080E413C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MainState_WaitPageSwap
	movs r0, #1
_080E4146:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080E4110

	thumb_func_start sub_080E414C
sub_080E414C: @ 0x080E414C
	push {r4, r5, lr}
	bl GetPreviousTextCaretPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080E4174
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_080E4208
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E4178
	movs r0, #0
	b _080E4182
	.align 2, 0
_080E4174: .4byte 0x02039C34
_080E4178:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080E4318
	movs r0, #1
_080E4182:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080E414C

	thumb_func_start AddTextCharacter
AddTextCharacter: @ 0x080E4188
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetTextCaretPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080E41AC
	ldr r1, [r1]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r1, r2
	adds r1, r1, r0
	strb r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E41AC: .4byte 0x02039C34
	thumb_func_end AddTextCharacter

	thumb_func_start sub_080E41B0
sub_080E41B0: @ 0x080E41B0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xfa
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #0xe
	bls _080E41FE
	adds r0, r1, #0
	subs r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080E41FE
	adds r0, r1, #0
	subs r0, #0x4b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080E41FE
	adds r0, r1, #0
	subs r0, #0x56
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe
	bls _080E41FE
	adds r0, r1, #0
	subs r0, #0x6a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080E41FE
	adds r0, r1, #0
	adds r0, #0x65
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4202
_080E41FE:
	movs r0, #1
	b _080E4204
_080E4202:
	movs r0, #0
_080E4204:
	pop {r1}
	bx r1
	thumb_func_end sub_080E41B0

	thumb_func_start sub_080E4208
sub_080E4208: @ 0x080E4208
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xe6
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080E423E
	adds r0, r1, #0
	subs r0, #0x46
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080E423E
	adds r0, r1, #0
	subs r0, #0x6a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080E423E
	adds r0, r1, #0
	adds r0, #0x6a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4242
_080E423E:
	movs r0, #1
	b _080E4244
_080E4242:
	movs r0, #0
_080E4244:
	pop {r1}
	bx r1
	thumb_func_end sub_080E4208

	thumb_func_start MainState_WaitPageSwap
MainState_WaitPageSwap: @ 0x080E4248
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r0, #0x18
	movs r3, #0xfa
	lsls r3, r3, #0x18
	adds r0, r0, r3
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4264
	adds r0, r2, #0
	adds r0, #0x31
	b _080E42FE
_080E4264:
	adds r0, r2, #0
	subs r0, #0xb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4276
	adds r0, r2, #0
	adds r0, #0x31
	b _080E42FE
_080E4276:
	adds r0, r2, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4288
	adds r0, r2, #0
	adds r0, #0x31
	b _080E42FE
_080E4288:
	adds r0, r2, #0
	subs r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E429A
	adds r0, r2, #0
	adds r0, #0x2c
	b _080E42FE
_080E429A:
	adds r0, r2, #0
	subs r0, #0x4b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080E42FA
	adds r0, r2, #0
	subs r0, #0x56
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E42B8
	adds r0, r2, #0
	adds r0, #0x31
	b _080E42FE
_080E42B8:
	adds r0, r2, #0
	subs r0, #0x5b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E42CA
	adds r0, r2, #0
	adds r0, #0x31
	b _080E42FE
_080E42CA:
	adds r0, r2, #0
	subs r0, #0x60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E42DC
	adds r0, r2, #0
	adds r0, #0x31
	b _080E42FE
_080E42DC:
	adds r0, r2, #0
	subs r0, #0x6a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E42EE
	adds r0, r2, #0
	adds r0, #0x2c
	b _080E42FE
_080E42EE:
	adds r0, r2, #0
	adds r0, #0x65
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4302
_080E42FA:
	adds r0, r2, #0
	adds r0, #0xfb
_080E42FE:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080E4302:
	ldr r0, _080E4314
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r0, r0, r3
	adds r0, r0, r1
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E4314: .4byte 0x02039C34
	thumb_func_end MainState_WaitPageSwap

	thumb_func_start sub_080E4318
sub_080E4318: @ 0x080E4318
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r0, #0x18
	movs r3, #0xe6
	lsls r3, r3, #0x18
	adds r0, r0, r3
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4334
	adds r0, r2, #0
	adds r0, #0x31
	b _080E4360
_080E4334:
	adds r0, r2, #0
	subs r0, #0x46
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080E435E
	adds r0, r2, #0
	subs r0, #0x6a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4352
	adds r0, r2, #0
	adds r0, #0x31
	b _080E4360
_080E4352:
	adds r0, r2, #0
	adds r0, #0x6a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _080E4364
_080E435E:
	adds r0, r2, #5
_080E4360:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080E4364:
	ldr r0, _080E4378
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r0, r0, r3
	adds r0, r0, r1
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E4378: .4byte 0x02039C34
	thumb_func_end sub_080E4318

	thumb_func_start sub_080E437C
sub_080E437C: @ 0x080E437C
	push {r4, r5, lr}
	movs r2, #0
	ldr r1, _080E4390
	ldr r0, [r1]
	ldr r4, _080E4394
	adds r0, r0, r4
	ldr r0, [r0]
	adds r5, r1, #0
	b _080E43DC
	.align 2, 0
_080E4390: .4byte 0x02039C34
_080E4394: .4byte 0x00001E28
_080E4398:
	ldr r1, [r1]
	movs r0, #0xc0
	lsls r0, r0, #5
	adds r3, r1, r0
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E43CC
	cmp r0, #0xff
	beq _080E43CC
	ldr r2, _080E43C8
	adds r0, r1, r2
	ldr r0, [r0]
	adds r1, r1, r4
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r1, r3, #0
	bl StringCopyN
	b _080E43E2
	.align 2, 0
_080E43C8: .4byte 0x00001E30
_080E43CC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r1, r5, #0
	ldr r0, [r1]
	ldr r4, _080E43E8
	adds r0, r0, r4
	ldr r0, [r0]
_080E43DC:
	ldrb r0, [r0, #1]
	cmp r2, r0
	blo _080E4398
_080E43E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E43E8: .4byte 0x00001E28
	thumb_func_end sub_080E437C

	thumb_func_start choose_name_or_words_screen_load_bg_tile_patterns
choose_name_or_words_screen_load_bg_tile_patterns: @ 0x080E43EC
	push {r4, r5, r6, lr}
	ldr r0, _080E443C
	ldr r6, _080E4440
	ldr r1, [r6]
	ldr r4, _080E4444
	adds r1, r1, r4
	bl LZ77UnCompWram
	ldr r1, [r6]
	adds r1, r1, r4
	movs r5, #0xc0
	lsls r5, r5, #3
	movs r0, #1
	adds r2, r5, #0
	movs r3, #0
	bl LoadBgTiles
	ldr r1, [r6]
	adds r1, r1, r4
	movs r0, #2
	adds r2, r5, #0
	movs r3, #0
	bl LoadBgTiles
	ldr r1, [r6]
	adds r1, r1, r4
	movs r0, #3
	adds r2, r5, #0
	movs r3, #0
	bl LoadBgTiles
	ldr r0, _080E4448
	bl LoadSpriteSheets
	ldr r0, _080E444C
	bl LoadSpritePalettes
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E443C: .4byte 0x08565318
_080E4440: .4byte 0x02039C34
_080E4444: .4byte 0x00001810
_080E4448: .4byte 0x08565EE0
_080E444C: .4byte 0x08565F48
	thumb_func_end choose_name_or_words_screen_load_bg_tile_patterns

	thumb_func_start sub_080E4450
sub_080E4450: @ 0x080E4450
	push {lr}
	bl InputInit
	bl MoveCursorToOKButton
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E4450

	thumb_func_start choose_name_or_words_screen_apply_bg_pals
choose_name_or_words_screen_apply_bg_pals: @ 0x080E4460
	push {lr}
	ldr r0, _080E4488
	movs r1, #0
	movs r2, #0xc0
	bl LoadPalette
	ldr r0, _080E448C
	movs r1, #0xa0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #2
	bl stdpal_get
	movs r1, #0xb0
	movs r2, #0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080E4488: .4byte 0x08565258
_080E448C: .4byte 0x08565218
	thumb_func_end choose_name_or_words_screen_apply_bg_pals

	thumb_func_start sub_080E4490
sub_080E4490: @ 0x080E4490
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E4490

	thumb_func_start sub_080E44A4
sub_080E44A4: @ 0x080E44A4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #2
	beq _080E4504
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	ldr r0, _080E450C
	adds r0, r1, r0
	ldrb r5, [r0]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #0x20
	movs r2, #0x13
	movs r3, #0xc
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #0x21
	movs r2, #0x14
	movs r3, #0xc
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #0x1e
	movs r2, #0x14
	movs r3, #0xa
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #0x1f
	movs r2, #0x14
	movs r3, #0xb
	bl FillBgTilemapBufferRect
_080E4504:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E450C: .4byte 0x08565C7B
	thumb_func_end sub_080E44A4

	thumb_func_start sub_080E4510
sub_080E4510: @ 0x080E4510
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r7, _080E45C0
	ldr r1, [r7]
	ldr r2, _080E45C4
	adds r0, r1, r2
	ldr r0, [r0]
	ldrb r6, [r0, #1]
	ldrb r0, [r0, #5]
	mov sl, r0
	ldr r0, _080E45C8
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r4, #0
	cmp r4, r6
	bhs _080E45A0
	add r5, sp, #0xc
	mov r8, r7
	movs r7, #0
	ldr r0, _080E45CC
	ldrb r0, [r0]
	mov sb, r0
_080E454A:
	mov r1, r8
	ldr r0, [r1]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r0, r2
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r0, [r5]
	mov r0, sb
	strb r0, [r5, #1]
	ldrb r0, [r5]
	bl sub_080E4830
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	cmp r0, #1
	bne _080E4570
	movs r1, #2
_080E4570:
	mov r2, r8
	ldr r0, [r2]
	ldr r2, _080E45C8
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r3, r3, #1
	add r3, sl
	adds r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #1
	str r1, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	add r2, sp, #0xc
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _080E454A
_080E45A0:
	ldr r0, _080E45C0
	ldr r0, [r0]
	ldr r1, _080E45C8
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E45C0: .4byte 0x02039C34
_080E45C4: .4byte 0x00001E28
_080E45C8: .4byte 0x00001E13
_080E45CC: .4byte 0x085C8C24
	thumb_func_end sub_080E4510

	thumb_func_start sub_080E45D0
sub_080E45D0: @ 0x080E45D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080E463C
	adds r0, r5, r0
	ldrb r1, [r0]
	adds r0, r6, #0
	bl FillWindowPixelBuffer
	movs r4, #0
	ldr r1, _080E4640
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r7, [r0]
	ldr r0, _080E4644
	mov r8, r0
_080E45FA:
	lsls r3, r4, #4
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	lsls r0, r4, #2
	lsls r1, r5, #4
	adds r0, r0, r1
	add r0, r8
	ldr r0, [r0]
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0
	bl AddTextPrinterParameterized3
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080E45FA
	adds r0, r6, #0
	bl PutWindowTilemap
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E463C: .4byte 0x08565C8C
_080E4640: .4byte 0x08565C90
_080E4644: .4byte 0x08565EB0
	thumb_func_end sub_080E45D0

	thumb_func_start sub_080E4648
sub_080E4648: @ 0x080E4648
	push {r4, r5, r6, r7, lr}
	movs r0, #0xa
	bl GetGpuReg
	adds r4, r0, #0
	movs r5, #3
	ands r4, r5
	movs r0, #0xc
	bl GetGpuReg
	ands r0, r5
	cmp r4, r0
	bls _080E4678
	movs r6, #1
	movs r7, #1
	ldr r0, _080E4670
	ldr r0, [r0]
	ldr r1, _080E4674
	b _080E4682
	.align 2, 0
_080E4670: .4byte 0x02039C34
_080E4674: .4byte 0x00001E11
_080E4678:
	movs r6, #2
	movs r7, #2
	ldr r0, _080E46D4
	ldr r0, [r0]
	ldr r1, _080E46D8
_080E4682:
	adds r0, r0, r1
	ldrb r5, [r0]
	ldr r4, _080E46DC
	bl sub_080E270C
	ldr r1, _080E46D4
	ldr r2, [r1]
	ldr r1, _080E46E0
	adds r2, r2, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r1, [r1]
	adds r0, r6, #0
	bl sub_080E4490
	bl sub_080E2758
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_080E45D0
	bl sub_080E2758
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl sub_080E44A4
	adds r0, r7, #0
	bl CopyBgTilemapBufferToVram
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E46D4: .4byte 0x02039C34
_080E46D8: .4byte 0x00001E12
_080E46DC: .4byte 0x08565C9C
_080E46E0: .4byte 0x00001E22
	thumb_func_end sub_080E4648

	thumb_func_start sub_080E46E4
sub_080E46E4: @ 0x080E46E4
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r1, _080E473C
	add r0, sp, #0xc
	movs r2, #3
	bl memcpy
	ldr r5, _080E4740
	ldr r0, [r5]
	ldr r4, _080E4744
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	add r1, sp, #0xc
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r1, _080E4748
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0x18
	movs r3, #0
	bl AddTextPrinterParameterized3
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E473C: .4byte 0x08565CB4
_080E4740: .4byte 0x02039C34
_080E4744: .4byte 0x00001E15
_080E4748: .4byte 0x085658A0
	thumb_func_end sub_080E46E4

	thumb_func_start sub_080E474C
sub_080E474C: @ 0x080E474C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080E474C

	thumb_func_start NamingScreen_TurnOffScreen
NamingScreen_TurnOffScreen: @ 0x080E4764
	push {lr}
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end NamingScreen_TurnOffScreen

	thumb_func_start NamingScreen_InitDisplayMode
NamingScreen_InitDisplayMode: @ 0x080E4778
	push {lr}
	ldr r0, _080E4784
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_080E4784: .4byte 0x080E4789
	thumb_func_end NamingScreen_InitDisplayMode

	thumb_func_start VBlankCB_NamingScreen
VBlankCB_NamingScreen: @ 0x080E4788
	push {r4, r5, lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r5, _080E47F8
	ldr r0, [r5]
	ldr r1, _080E47FC
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, [r5]
	ldr r1, _080E4800
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	movs r0, #0xa
	bl GetGpuReg
	ldr r4, _080E4804
	adds r1, r4, #0
	ands r1, r0
	movs r0, #0xa
	bl SetGpuReg
	ldr r0, [r5]
	ldr r1, _080E4808
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0xa
	bl SetGpuRegBits
	movs r0, #0xc
	bl GetGpuReg
	ands r4, r0
	movs r0, #0xc
	adds r1, r4, #0
	bl SetGpuReg
	ldr r0, [r5]
	ldr r1, _080E480C
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0xc
	bl SetGpuRegBits
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E47F8: .4byte 0x02039C34
_080E47FC: .4byte 0x00001E18
_080E4800: .4byte 0x00001E1A
_080E4804: .4byte 0x0000FFFC
_080E4808: .4byte 0x00001E1C
_080E480C: .4byte 0x00001E1E
	thumb_func_end VBlankCB_NamingScreen

	thumb_func_start SetCursorPos
SetCursorPos: @ 0x080E4810
	push {lr}
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetCursorPos

	thumb_func_start sub_080E4830
sub_080E4830: @ 0x080E4830
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r2, #0
	ldr r0, _080E4864
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0xff
	beq _080E485A
	adds r1, r3, #0
_080E4844:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r4, r0
	beq _080E485A
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080E4844
_080E485A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E4864: .4byte 0x085658C1
	thumb_func_end sub_080E4830

	thumb_func_start sub_080E4868
sub_080E4868: @ 0x080E4868
	push {lr}
	sub sp, #8
	ldr r0, _080E4888
	ldr r1, [r0]
	ldrb r2, [r1, #8]
	movs r0, #0
	str r0, [sp]
	ldr r0, _080E488C
	str r0, [sp, #4]
	movs r0, #0
	movs r3, #0
	bl DoNamingScreen
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080E4888: .4byte 0x03005AF0
_080E488C: .4byte 0x08085AFD
	thumb_func_end sub_080E4868

	thumb_func_start sub_080E4890
sub_080E4890: @ 0x080E4890
	push {lr}
	sub sp, #8
	ldr r0, _080E48B0
	ldr r1, [r0]
	ldrb r2, [r1, #8]
	movs r0, #0
	str r0, [sp]
	ldr r0, _080E48B4
	str r0, [sp, #4]
	movs r0, #1
	movs r3, #0
	bl DoNamingScreen
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080E48B0: .4byte 0x03005AF0
_080E48B4: .4byte 0x08085AFD
	thumb_func_end sub_080E4890

	thumb_func_start sub_080E48B8
sub_080E48B8: @ 0x080E48B8
	push {lr}
	sub sp, #8
	ldr r0, _080E48D8
	ldr r1, [r0]
	ldrb r2, [r1, #8]
	movs r0, #0
	str r0, [sp]
	ldr r0, _080E48DC
	str r0, [sp, #4]
	movs r0, #2
	movs r3, #0
	bl DoNamingScreen
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080E48D8: .4byte 0x03005AF0
_080E48DC: .4byte 0x08085AFD
	thumb_func_end sub_080E48B8

	thumb_func_start sub_080E48E0
sub_080E48E0: @ 0x080E48E0
	push {lr}
	sub sp, #8
	ldr r0, _080E4900
	ldr r1, [r0]
	ldrb r2, [r1, #8]
	movs r0, #0
	str r0, [sp]
	ldr r0, _080E4904
	str r0, [sp, #4]
	movs r0, #3
	movs r3, #0
	bl DoNamingScreen
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080E4900: .4byte 0x03005AF0
_080E4904: .4byte 0x08085AFD
	thumb_func_end sub_080E48E0

