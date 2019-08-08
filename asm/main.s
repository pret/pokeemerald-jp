.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AgbMain
AgbMain: @ 0x080003A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0xff
	bl RegisterRamReset
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _08000468
	adds r0, r2, #0
	strh r0, [r1]
	bl InitGpuRegManager
	ldr r1, _0800046C
	ldr r3, _08000470
	adds r0, r3, #0
	strh r0, [r1]
	bl InitKeys
	bl InitIntrHandlers
	bl m4aSoundInit
	bl EnableVCountIntrAtLine150
	bl sub_0800E194
	bl RtcInit
	bl CheckForFlashMemory
	bl InitMainCallbacks
	bl InitMapMusic
	bl ClearDma3Requests
	bl ResetBgs
	bl SetDefaultFontsPointer
	ldr r0, _08000474
	movs r1, #0xe0
	lsls r1, r1, #9
	bl InitHeap
	ldr r0, _08000478
	movs r4, #0
	strb r4, [r0]
	ldr r0, _0800047C
	ldr r0, [r0]
	cmp r0, #1
	beq _08000414
	movs r0, #0
	bl SetMainCallback2
_08000414:
	ldr r2, _08000480
	strb r4, [r2]
	ldr r1, _08000484
	movs r3, #0xfc
	lsls r3, r3, #4
	adds r0, r3, #0
	strh r0, [r1]
	ldr r7, _08000488
	movs r0, #0
	mov r8, r0
	adds r6, r2, #0
_0800042A:
	bl ReadKeys
	ldr r0, _08000478
	ldrb r0, [r0]
	cmp r0, #0
	bne _08000454
	ldrh r1, [r7, #0x28]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08000454
	movs r0, #0xe
	ands r0, r1
	cmp r0, #0xe
	bne _08000454
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	bl DoSoftReset
_08000454:
	bl sub_08086F98
	cmp r0, #1
	bne _0800048C
	strb r0, [r6]
	bl UpdateLinkAndCallCallbacks
	movs r0, #0
	strb r0, [r6]
	b _080004B2
	.align 2, 0
_08000468: .4byte 0x00007FFF
_0800046C: .4byte 0x04000204
_08000470: .4byte 0x00004014
_08000474: .4byte 0x02000000
_08000478: .4byte 0x030027A0
_0800047C: .4byte 0x03005AE8
_08000480: .4byte 0x03002354
_08000484: .4byte 0x03000000
_08000488: .4byte 0x03002360
_0800048C:
	ldr r5, _080004C0
	movs r0, #0
	strb r0, [r5]
	bl UpdateLinkAndCallCallbacks
	bl sub_08086F2C
	adds r4, r0, #0
	cmp r4, #1
	bne _080004B2
	movs r0, #0
	strh r0, [r7, #0x2e]
	bl ClearSpriteCopyRequests
	strb r4, [r5]
	bl UpdateLinkAndCallCallbacks
	mov r2, r8
	strb r2, [r5]
_080004B2:
	bl PlayTimeCounter_Update
	bl MapMusicMain
	bl WaitForVBlank
	b _0800042A
	.align 2, 0
_080004C0: .4byte 0x03002354
	thumb_func_end AgbMain

	thumb_func_start UpdateLinkAndCallCallbacks
UpdateLinkAndCallCallbacks: @ 0x080004C4
	push {lr}
	bl HandleLinkConnection
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080004D4
	bl CallCallbacks
_080004D4:
	pop {r0}
	bx r0
	thumb_func_end UpdateLinkAndCallCallbacks

	thumb_func_start InitMainCallbacks
InitMainCallbacks: @ 0x080004D8
	push {lr}
	ldr r2, _08000500
	movs r0, #0
	str r0, [r2, #0x20]
	ldr r1, _08000504
	str r0, [r1]
	str r0, [r2, #0x24]
	str r0, [r2]
	ldr r0, _08000508
	bl SetMainCallback2
	ldr r1, _0800050C
	ldr r0, _08000510
	str r0, [r1]
	ldr r1, _08000514
	ldr r0, _08000518
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08000500: .4byte 0x03002360
_08000504: .4byte 0x0203CC28
_08000508: .4byte 0x0816CC91
_0800050C: .4byte 0x03005AF0
_08000510: .4byte 0x020246F8
_08000514: .4byte 0x03005AF4
_08000518: .4byte 0x020294AC
	thumb_func_end InitMainCallbacks

	thumb_func_start CallCallbacks
CallCallbacks: @ 0x0800051C
	push {r4, lr}
	ldr r4, _0800053C
	ldr r0, [r4]
	cmp r0, #0
	beq _0800052A
	bl _call_via_r0
_0800052A:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08000534
	bl _call_via_r0
_08000534:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800053C: .4byte 0x03002360
	thumb_func_end CallCallbacks

	thumb_func_start SetMainCallback2
SetMainCallback2: @ 0x08000540
	ldr r1, _08000550
	str r0, [r1, #4]
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08000550: .4byte 0x03002360
	thumb_func_end SetMainCallback2

	thumb_func_start StartTimer1
StartTimer1: @ 0x08000554
	ldr r1, _0800055C
	movs r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_0800055C: .4byte 0x04000106
	thumb_func_end StartTimer1

	thumb_func_start SeedRngAndSetTrainerId
SeedRngAndSetTrainerId: @ 0x08000560
	push {r4, lr}
	ldr r0, _0800057C
	ldrh r4, [r0]
	adds r0, r4, #0
	bl SeedRng
	ldr r1, _08000580
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08000584
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800057C: .4byte 0x04000104
_08000580: .4byte 0x04000106
_08000584: .4byte 0x02020000
	thumb_func_end SeedRngAndSetTrainerId

	thumb_func_start GetGeneratedTrainerIdLower
GetGeneratedTrainerIdLower: @ 0x08000588
	ldr r0, _08000590
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08000590: .4byte 0x02020000
	thumb_func_end GetGeneratedTrainerIdLower

	thumb_func_start EnableVCountIntrAtLine150
EnableVCountIntrAtLine150: @ 0x08000594
	push {lr}
	movs r0, #4
	bl GetGpuReg
	movs r1, #0xff
	ands r1, r0
	movs r2, #0x96
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r1, r0
	movs r0, #0x20
	orrs r1, r0
	movs r0, #4
	bl SetGpuReg
	movs r0, #4
	bl EnableInterrupts
	pop {r0}
	bx r0
	thumb_func_end EnableVCountIntrAtLine150

	thumb_func_start InitKeys
InitKeys: @ 0x080005BC
	ldr r1, _080005D8
	movs r0, #5
	strh r0, [r1]
	ldr r1, _080005DC
	movs r0, #0x28
	strh r0, [r1]
	ldr r1, _080005E0
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
	strh r0, [r1, #0x30]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x2a]
	bx lr
	.align 2, 0
_080005D8: .4byte 0x0300279C
_080005DC: .4byte 0x03002350
_080005E0: .4byte 0x03002360
	thumb_func_end InitKeys

	thumb_func_start ReadKeys
ReadKeys: @ 0x080005E4
	push {lr}
	ldr r0, _08000620
	ldrh r1, [r0]
	ldr r2, _08000624
	adds r0, r2, #0
	adds r3, r0, #0
	eors r3, r1
	ldr r1, _08000628
	ldrh r2, [r1, #0x28]
	adds r0, r3, #0
	bics r0, r2
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x2e]
	strh r0, [r1, #0x30]
	adds r2, r1, #0
	cmp r3, #0
	beq _08000630
	ldrh r0, [r2, #0x2c]
	cmp r0, r3
	bne _08000630
	ldrh r0, [r2, #0x32]
	subs r0, #1
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08000636
	strh r3, [r2, #0x30]
	ldr r0, _0800062C
	b _08000632
	.align 2, 0
_08000620: .4byte 0x04000130
_08000624: .4byte 0x000003FF
_08000628: .4byte 0x03002360
_0800062C: .4byte 0x0300279C
_08000630:
	ldr r0, _0800067C
_08000632:
	ldrh r0, [r0]
	strh r0, [r2, #0x32]
_08000636:
	strh r3, [r2, #0x28]
	strh r3, [r2, #0x2c]
	ldr r0, _08000680
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #2
	bne _08000668
	ldrh r1, [r2, #0x2e]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08000658
	movs r0, #1
	orrs r0, r1
	strh r0, [r2, #0x2e]
_08000658:
	ldrh r1, [r2, #0x2c]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08000668
	movs r0, #1
	orrs r0, r1
	strh r0, [r2, #0x2c]
_08000668:
	ldrh r1, [r2, #0x2e]
	ldrh r0, [r2, #0x36]
	ands r0, r1
	cmp r0, #0
	beq _08000676
	movs r0, #1
	strh r0, [r2, #0x34]
_08000676:
	pop {r0}
	bx r0
	.align 2, 0
_0800067C: .4byte 0x03002350
_08000680: .4byte 0x03005AF0
	thumb_func_end ReadKeys

	thumb_func_start InitIntrHandlers
InitIntrHandlers: @ 0x08000684
	push {r4, r5, lr}
	ldr r5, _080006D0
	ldr r4, _080006D4
	ldr r3, _080006D8
	ldr r2, _080006DC
	movs r1, #0xd
_08000690:
	ldm r3!, {r0}
	stm r2!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _08000690
	ldr r0, _080006E0
	str r5, [r0]
	str r4, [r0, #4]
	ldr r1, _080006E4
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _080006E8
	str r4, [r0]
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	bl SetSerialCallback
	ldr r1, _080006EC
	movs r0, #1
	strh r0, [r1]
	movs r0, #1
	bl EnableInterrupts
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080006D0: .4byte 0x08000248
_080006D4: .4byte 0x030027F0
_080006D8: .4byte 0x0829BDBC
_080006DC: .4byte 0x030027B0
_080006E0: .4byte 0x040000D4
_080006E4: .4byte 0x84000200
_080006E8: .4byte 0x03007FFC
_080006EC: .4byte 0x04000208
	thumb_func_end InitIntrHandlers

	thumb_func_start SetVBlankCallback
SetVBlankCallback: @ 0x080006F0
	ldr r1, _080006F8
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_080006F8: .4byte 0x03002360
	thumb_func_end SetVBlankCallback

	thumb_func_start SetHBlankCallback
SetHBlankCallback: @ 0x080006FC
	ldr r1, _08000704
	str r0, [r1, #0x10]
	bx lr
	.align 2, 0
_08000704: .4byte 0x03002360
	thumb_func_end SetHBlankCallback

	thumb_func_start SetVCountCallback
SetVCountCallback: @ 0x08000708
	ldr r1, _08000710
	str r0, [r1, #0x14]
	bx lr
	.align 2, 0
_08000710: .4byte 0x03002360
	thumb_func_end SetVCountCallback

	thumb_func_start RestoreSerialTimer3IntrHandlers
RestoreSerialTimer3IntrHandlers: @ 0x08000714
	ldr r0, _08000720
	ldr r1, _08000724
	str r1, [r0, #4]
	ldr r1, _08000728
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_08000720: .4byte 0x030027B0
_08000724: .4byte 0x08000879
_08000728: .4byte 0x0800B4E5
	thumb_func_end RestoreSerialTimer3IntrHandlers

	thumb_func_start SetSerialCallback
SetSerialCallback: @ 0x0800072C
	ldr r1, _08000734
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08000734: .4byte 0x03002360
	thumb_func_end SetSerialCallback

	thumb_func_start VBlankIntr
VBlankIntr: @ 0x08000738
	push {r4, lr}
	ldr r0, _08000748
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800074C
	bl ReadU16
	b _08000758
	.align 2, 0
_08000748: .4byte 0x0300319C
_0800074C:
	ldr r0, _080007DC
	ldrb r0, [r0]
	cmp r0, #0
	bne _08000758
	bl LinkVSync
_08000758:
	ldr r0, _080007E0
	ldr r1, [r0, #0x20]
	adds r1, #1
	str r1, [r0, #0x20]
	ldr r1, _080007E4
	ldr r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _08000778
	ldr r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	bhi _08000778
	adds r0, r2, #1
	str r0, [r1]
_08000778:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08000782
	bl _call_via_r0
_08000782:
	ldr r0, [r4, #0x24]
	adds r0, #1
	str r0, [r4, #0x24]
	bl CopyBufferedValuesToGpuRegs
	bl ProcessDma3Requests
	ldr r1, _080007E8
	ldr r0, _080007EC
	ldrb r0, [r0, #4]
	strb r0, [r1]
	bl m4aSoundMain
	bl sub_080334E0
	ldr r1, _080007F0
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080007BA
	ldr r0, _080007F4
	ldr r0, [r0]
	ldr r1, _080007F8
	ands r0, r1
	cmp r0, #0
	bne _080007BE
_080007BA:
	bl Random
_080007BE:
	bl sub_0800DC40
	ldr r2, _080007FC
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080007E0
	ldrh r2, [r0, #0x1c]
	ldrh r3, [r0, #0x1c]
	orrs r1, r2
	strh r1, [r0, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080007DC: .4byte 0x030027E8
_080007E0: .4byte 0x03002360
_080007E4: .4byte 0x0203CC28
_080007E8: .4byte 0x03002FF0
_080007EC: .4byte 0x03006120
_080007F0: .4byte 0x00000439
_080007F4: .4byte 0x02022C90
_080007F8: .4byte 0x013F0102
_080007FC: .4byte 0x03007FF8
	thumb_func_end VBlankIntr

	thumb_func_start InitFlashTimer
InitFlashTimer: @ 0x08000800
	push {lr}
	ldr r1, _08000810
	movs r0, #2
	bl SetFlashTimerIntr
	pop {r0}
	bx r0
	.align 2, 0
_08000810: .4byte 0x030027CC
	thumb_func_end InitFlashTimer

	thumb_func_start HBlankIntr
HBlankIntr: @ 0x08000814
	push {r4, lr}
	ldr r4, _0800083C
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _08000822
	bl _call_via_r0
_08000822:
	ldr r2, _08000840
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0x1c]
	ldrh r2, [r4, #0x1c]
	orrs r1, r0
	strh r1, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800083C: .4byte 0x03002360
_08000840: .4byte 0x03007FF8
	thumb_func_end HBlankIntr

	thumb_func_start VCountIntr
VCountIntr: @ 0x08000844
	push {r4, lr}
	ldr r4, _08000870
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _08000852
	bl _call_via_r0
_08000852:
	bl m4aSoundVSync
	ldr r2, _08000874
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0x1c]
	ldrh r2, [r4, #0x1c]
	orrs r1, r0
	strh r1, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000870: .4byte 0x03002360
_08000874: .4byte 0x03007FF8
	thumb_func_end VCountIntr

	thumb_func_start SerialIntr
SerialIntr: @ 0x08000878
	push {r4, lr}
	ldr r4, _080008A0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08000886
	bl _call_via_r0
_08000886:
	ldr r2, _080008A4
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, #0x1c]
	ldrh r2, [r4, #0x1c]
	orrs r1, r0
	strh r1, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080008A0: .4byte 0x03002360
_080008A4: .4byte 0x03007FF8
	thumb_func_end SerialIntr

	thumb_func_start IntrDummy
IntrDummy: @ 0x080008A8
	bx lr
	.align 2, 0
	thumb_func_end IntrDummy

	thumb_func_start WaitForVBlank
WaitForVBlank: @ 0x080008AC
	push {lr}
	ldr r2, _080008D4
	ldrh r1, [r2, #0x1c]
	ldr r0, _080008D8
	ands r0, r1
	ldrh r1, [r2, #0x1c]
	strh r0, [r2, #0x1c]
	ldrh r1, [r2, #0x1c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080008D0
	movs r3, #1
_080008C6:
	ldrh r1, [r2, #0x1c]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080008C6
_080008D0:
	pop {r0}
	bx r0
	.align 2, 0
_080008D4: .4byte 0x03002360
_080008D8: .4byte 0x0000FFFE
	thumb_func_end WaitForVBlank

	thumb_func_start SetTrainerHillVBlankCounter
SetTrainerHillVBlankCounter: @ 0x080008DC
	ldr r1, _080008E4
	str r0, [r1]
	bx lr
	.align 2, 0
_080008E4: .4byte 0x0203CC28
	thumb_func_end SetTrainerHillVBlankCounter

	thumb_func_start ClearTrainerHillVBlankCounter
ClearTrainerHillVBlankCounter: @ 0x080008E8
	ldr r1, _080008F0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080008F0: .4byte 0x0203CC28
	thumb_func_end ClearTrainerHillVBlankCounter

	thumb_func_start DoSoftReset
DoSoftReset: @ 0x080008F4
	push {r4, lr}
	ldr r1, _08000950
	movs r0, #0
	strh r0, [r1]
	bl m4aSoundVSyncOff
	bl ScanlineEffect_Stop
	ldr r1, _08000954
	ldrh r2, [r1, #0xa]
	ldr r3, _08000958
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r4, [r1, #0xa]
	ldr r2, _0800095C
	adds r0, r2, #0
	ands r0, r4
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r4, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r4
	strh r0, [r1, #0xa]
	ldrh r4, [r1, #0xa]
	adds r0, r2, #0
	ands r0, r4
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _08000960
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r2, r1
	strh r2, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	bl SiiRtcProtect
	movs r0, #0xff
	bl SoftReset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000950: .4byte 0x04000208
_08000954: .4byte 0x040000BC
_08000958: .4byte 0x0000C5FF
_0800095C: .4byte 0x00007FFF
_08000960: .4byte 0x040000D4
	thumb_func_end DoSoftReset

	thumb_func_start ClearPokemonCrySongs
ClearPokemonCrySongs: @ 0x08000964
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08000980
	ldr r2, _08000984
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08000980: .4byte 0x030070D0
_08000984: .4byte 0x01000034
	thumb_func_end ClearPokemonCrySongs

