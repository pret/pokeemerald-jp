.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start IsWirelessAdapterConnected
IsWirelessAdapterConnected: @ 0x08008F68
	push {lr}
	bl sub_0800AF5C
	bl sub_0800E1C4
	bl sub_0800B97C
	ldr r1, _08008F8C
	cmp r0, r1
	beq _08008F90
	bl sub_0800AF78
	bl CloseLink
	bl RestoreSerialTimer3IntrHandlers
	movs r0, #0
	b _08008F9A
	.align 2, 0
_08008F8C: .4byte 0x00008001
_08008F90:
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	movs r0, #1
_08008F9A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsWirelessAdapterConnected

	thumb_func_start Task_DestroySelf
Task_DestroySelf: @ 0x08008FA0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_DestroySelf

	thumb_func_start InitLinkTestBG
InitLinkTestBG: @ 0x08008FB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800900C
	lsls r1, r5, #4
	movs r2, #0x20
	bl LoadPalette
	ldr r3, _08009010
	ldr r0, _08009014
	str r0, [r3]
	lsls r2, r7, #0xe
	lsls r0, r4, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [r3, #4]
	ldr r0, _08009018
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _0800901C
	str r6, [r0]
	str r5, [r0, #4]
	str r4, [r0, #8]
	mov r0, r8
	cmp r0, #2
	beq _0800903A
	cmp r0, #2
	bgt _08009020
	cmp r0, #1
	beq _08009028
	b _0800905C
	.align 2, 0
_0800900C: .4byte 0x082BFB6C
_08009010: .4byte 0x040000D4
_08009014: .4byte 0x082BFB8C
_08009018: .4byte 0x80000110
_0800901C: .4byte 0x030031D0
_08009020:
	mov r0, r8
	cmp r0, #3
	beq _0800904C
	b _0800905C
_08009028:
	lsls r1, r6, #8
	movs r0, #1
	orrs r1, r0
	lsls r0, r7, #2
	orrs r1, r0
	movs r0, #0xa
	bl SetGpuReg
	b _0800905C
_0800903A:
	lsls r1, r6, #8
	movs r0, #1
	orrs r1, r0
	lsls r0, r7, #2
	orrs r1, r0
	movs r0, #0xc
	bl SetGpuReg
	b _0800905C
_0800904C:
	lsls r1, r6, #8
	movs r0, #1
	orrs r1, r0
	lsls r0, r7, #2
	orrs r1, r0
	movs r0, #0xe
	bl SetGpuReg
_0800905C:
	mov r0, r8
	lsls r4, r0, #2
	adds r0, r4, #0
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl SetGpuReg
	adds r4, #0x12
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SetGpuReg
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitLinkTestBG

	thumb_func_start sub_08009088
sub_08009088: @ 0x08009088
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080090F4
	mov r2, r8
	lsls r1, r2, #4
	movs r2, #0x20
	bl LoadPalette
	ldr r2, _080090F8
	ldr r0, _080090FC
	str r0, [r2]
	lsls r0, r5, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _08009100
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _08009104
	str r4, [r0]
	mov r1, r8
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	ldr r0, _08009108
	adds r6, r6, r0
	ldrb r0, [r6]
	lsls r4, r4, #8
	lsls r5, r5, #2
	orrs r4, r5
	adds r1, r4, #0
	bl SetGpuReg
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080090F4: .4byte 0x082BFB6C
_080090F8: .4byte 0x040000D4
_080090FC: .4byte 0x082BFB8C
_08009100: .4byte 0x80000110
_08009104: .4byte 0x030031D0
_08009108: .4byte 0x082BFF20
	thumb_func_end sub_08009088

	thumb_func_start LinkTestScreen
LinkTestScreen: @ 0x0800910C
	push {r4, lr}
	sub sp, #4
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _080091A0
	bl SetVBlankCallback
	bl ResetBlockSend
	ldr r1, _080091A4
	ldr r2, _080091A8
	adds r0, r2, #0
	strh r0, [r1]
	bl OpenLink
	ldr r0, _080091AC
	ldrh r0, [r0, #0x24]
	bl SeedRng
	movs r4, #0
_0800913C:
	bl Random
	ldr r1, _080091B0
	ldr r1, [r1]
	adds r1, #0xa
	adds r1, r1, r4
	strb r0, [r1]
	adds r4, #1
	cmp r4, #3
	ble _0800913C
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #2
	movs r2, #4
	movs r3, #0
	bl InitLinkTestBG
	movs r1, #0xaa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _080091B4
	movs r1, #0
	bl CreateTask
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _080091B8
	str r4, [r0]
	bl InitLocalLinkPlayer
	ldr r0, _080091BC
	movs r1, #0
	bl CreateTask
	ldr r0, _080091C0
	bl SetMainCallback2
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080091A0: .4byte 0x08009259
_080091A4: .4byte 0x0202267E
_080091A8: .4byte 0x00001111
_080091AC: .4byte 0x03002360
_080091B0: .4byte 0x03005AF0
_080091B4: .4byte 0x08008FA1
_080091B8: .4byte 0x03000D60
_080091BC: .4byte 0x0800A415
_080091C0: .4byte 0x08009559
	thumb_func_end LinkTestScreen

	thumb_func_start SetLocalLinkPlayerId
SetLocalLinkPlayerId: @ 0x080091C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080091D0
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_080091D0: .4byte 0x02022684
	thumb_func_end SetLocalLinkPlayerId

	thumb_func_start InitLocalLinkPlayer
InitLocalLinkPlayer: @ 0x080091D4
	push {r4, r5, lr}
	ldr r5, _08009240
	ldr r4, _08009244
	ldr r1, [r4]
	ldrb r2, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #8
	orrs r2, r0
	ldrb r0, [r1, #0xc]
	lsls r0, r0, #0x10
	orrs r2, r0
	ldrb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #4]
	adds r0, r5, #0
	adds r0, #8
	bl StringCopy
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	strb r0, [r5, #0x13]
	ldr r0, _08009248
	ldrh r0, [r0]
	str r0, [r5, #0x14]
	ldr r0, _0800924C
	ldrb r0, [r0]
	strh r0, [r5, #0x1a]
	ldr r0, _08009250
	ldrb r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r5]
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r5, #2]
	bl IsNationalPokedexEnabled
	strb r0, [r5, #0x10]
	ldr r0, _08009254
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800923A
	ldrb r0, [r5, #0x10]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #0x10]
_0800923A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009240: .4byte 0x02022684
_08009244: .4byte 0x03005AF0
_08009248: .4byte 0x0202267E
_0800924C: .4byte 0x0829BDA5
_08009250: .4byte 0x0829BDA4
_08009254: .4byte 0x0000087F
	thumb_func_end InitLocalLinkPlayer

	thumb_func_start sub_08009258
sub_08009258: @ 0x08009258
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08009258

	thumb_func_start InitLink
InitLink: @ 0x0800926C
	push {lr}
	ldr r3, _0800928C
	ldr r1, _08009290
	ldr r2, _08009294
	adds r0, r1, #0
	adds r0, #0xe
_08009278:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _08009278
	movs r0, #1
	strb r0, [r3]
	bl EnableSerial
	pop {r0}
	bx r0
	.align 2, 0
_0800928C: .4byte 0x0202267C
_08009290: .4byte 0x030031B0
_08009294: .4byte 0x0000EFFF
	thumb_func_end InitLink

	thumb_func_start Task_TriggerHandshake
Task_TriggerHandshake: @ 0x08009298
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080092C8
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _080092C2
	ldr r1, _080092CC
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	bl DestroyTask
_080092C2:
	pop {r0}
	bx r0
	.align 2, 0
_080092C8: .4byte 0x03005B60
_080092CC: .4byte 0x030031E4
	thumb_func_end Task_TriggerHandshake

	thumb_func_start OpenLink
OpenLink: @ 0x080092D0
	push {r4, r5, r6, lr}
	ldr r0, _08009318
	ldrb r4, [r0]
	cmp r4, #0
	bne _08009344
	bl ResetSerial
	bl InitLink
	ldr r1, _0800931C
	ldr r0, _08009320
	str r0, [r1]
	ldr r0, _08009324
	strb r4, [r0]
	ldr r0, _08009328
	strb r4, [r0]
	ldr r0, _0800932C
	strb r4, [r0]
	bl ResetBlockReceivedFlags
	bl ResetBlockSend
	ldr r0, _08009330
	str r4, [r0]
	ldr r0, _08009334
	strb r4, [r0]
	ldr r0, _08009338
	strb r4, [r0]
	ldr r0, _0800933C
	strh r4, [r0]
	ldr r0, _08009340
	movs r1, #2
	bl CreateTask
	b _08009348
	.align 2, 0
_08009318: .4byte 0x0300319C
_0800931C: .4byte 0x030031E0
_08009320: .4byte 0x0800A3E9
_08009324: .4byte 0x030027E8
_08009328: .4byte 0x0300310C
_0800932C: .4byte 0x03003198
_08009330: .4byte 0x03000D54
_08009334: .4byte 0x03003188
_08009338: .4byte 0x03003184
_0800933C: .4byte 0x03003194
_08009340: .4byte 0x08009299
_08009344:
	bl sub_0800E1C4
_08009348:
	ldr r1, _08009374
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	ldr r6, _08009378
	movs r2, #0
	movs r5, #1
	ldr r4, _0800937C
	ldr r3, _08009380
_0800935A:
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	ble _0800935A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009374: .4byte 0x030031C4
_08009378: .4byte 0x03003118
_0800937C: .4byte 0x03003190
_08009380: .4byte 0x0300318C
	thumb_func_end OpenLink

	thumb_func_start CloseLink
CloseLink: @ 0x08009384
	push {r4, lr}
	ldr r0, _080093A8
	movs r4, #0
	strb r4, [r0]
	ldr r0, _080093AC
	ldrb r0, [r0]
	cmp r0, #0
	beq _08009398
	bl sub_0800E894
_08009398:
	ldr r0, _080093B0
	strb r4, [r0]
	bl DisableSerial
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080093A8: .4byte 0x030031C4
_080093AC: .4byte 0x0300319C
_080093B0: .4byte 0x0202267C
	thumb_func_end CloseLink

	thumb_func_start TestBlockTransfer
TestBlockTransfer: @ 0x080093B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r5, _08009478
	ldr r4, _0800947C
	ldrb r0, [r5]
	ldrh r1, [r4]
	cmp r0, r1
	beq _080093D8
	ldrh r0, [r4]
	movs r1, #2
	movs r2, #3
	movs r3, #2
	bl LinkTest_prnthex
	ldrh r0, [r4]
	strb r0, [r5]
_080093D8:
	movs r5, #0
	ldr r7, _08009480
_080093DC:
	ldr r0, _08009484
	adds r6, r5, r0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r4, r0, r7
	ldrb r0, [r6]
	ldrh r1, [r4]
	cmp r0, r1
	beq _08009404
	ldrh r0, [r4]
	adds r2, r5, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #2
	movs r3, #2
	bl LinkTest_prnthex
	ldrh r0, [r4]
	strb r0, [r6]
_08009404:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _080093DC
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bne _0800946A
	movs r5, #0
	ldr r0, _08009480
	mov sb, r0
	ldr r1, _08009488
	mov r8, r1
_08009424:
	adds r0, r7, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08009460
	lsls r0, r5, #8
	ldr r1, _0800948C
	adds r0, r0, r1
	lsls r4, r5, #1
	adds r1, r4, r5
	lsls r1, r1, #2
	add r1, sb
	ldrh r1, [r1, #2]
	bl LinkTestCalcBlockChecksum
	ldr r1, _08009490
	adds r4, r4, r1
	movs r6, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl ResetBlockReceivedFlag
	ldrh r0, [r4]
	cmp r0, r8
	beq _08009460
	ldr r0, _08009494
	strb r6, [r0]
	ldr r0, _08009498
	strb r6, [r0]
_08009460:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08009424
_0800946A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009478: .4byte 0x03000D64
_0800947C: .4byte 0x03000D10
_08009480: .4byte 0x03000D20
_08009484: .4byte 0x03000D68
_08009488: .4byte 0x00000342
_0800948C: .4byte 0x0202207C
_08009490: .4byte 0x030031E8
_08009494: .4byte 0x02022074
_08009498: .4byte 0x02022075
	thumb_func_end TestBlockTransfer

	thumb_func_start LinkTestProcessKeyInput
LinkTestProcessKeyInput: @ 0x0800949C
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _0800953C
	ldrh r1, [r4, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080094B2
	ldr r1, _08009540
	movs r0, #1
	strb r0, [r1]
_080094B2:
	ldrh r1, [r4, #0x2c]
	movs r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080094C6
	ldr r0, _08009544
	ldr r1, _08009548
	bl InitBlockSend
_080094C6:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080094E2
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_080094E2:
	ldrh r1, [r4, #0x2e]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080094F2
	movs r0, #1
	bl SetSuppressLinkErrorMessage
_080094F2:
	ldrh r1, [r4, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009504
	movs r0, #1
	bl TrySavingData
_08009504:
	ldrh r1, [r4, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08009512
	bl sub_0800A7F8
_08009512:
	ldr r0, _0800954C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08009532
	ldr r2, [r4, #0x24]
	ldr r0, _08009550
	ldrb r1, [r0]
	ldr r0, _08009554
	ldr r0, [r0]
	cmp r0, #0
	bne _0800952C
	movs r0, #0x10
	orrs r1, r0
_0800952C:
	adds r0, r2, #0
	bl SetLinkDebugValues
_08009532:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800953C: .4byte 0x03002360
_08009540: .4byte 0x030031E4
_08009544: .4byte 0x02004000
_08009548: .4byte 0x00002004
_0800954C: .4byte 0x02022074
_08009550: .4byte 0x030027E8
_08009554: .4byte 0x030031E0
	thumb_func_end LinkTestProcessKeyInput

	thumb_func_start CB2_LinkTest
CB2_LinkTest: @ 0x08009558
	push {lr}
	bl LinkTestProcessKeyInput
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl TestBlockTransfer
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_LinkTest

	thumb_func_start LinkMain2
LinkMain2: @ 0x0800957C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0800958C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08009590
	movs r0, #0
	b _080095D8
	.align 2, 0
_0800958C: .4byte 0x0202267C
_08009590:
	movs r1, #0
	ldr r5, _080095E0
	ldr r3, _080095E4
	movs r2, #0
_08009598:
	lsls r0, r1, #1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _08009598
	ldrh r0, [r4]
	strh r0, [r5]
	ldr r0, _080095E8
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080095D4
	ldr r0, _080095EC
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	bl ProcessRecvCmds
	ldr r0, _080095F0
	ldr r0, [r0]
	cmp r0, #0
	beq _080095D0
	bl _call_via_r0
_080095D0:
	bl CheckErrorStatus
_080095D4:
	ldr r0, _080095E8
	ldrh r0, [r0]
_080095D8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080095E0: .4byte 0x03003124
_080095E4: .4byte 0x030031B0
_080095E8: .4byte 0x03003180
_080095EC: .4byte 0x04000128
_080095F0: .4byte 0x030031E0
	thumb_func_end LinkMain2

	thumb_func_start HandleReceiveRemoteLinkPlayer
HandleReceiveRemoteLinkPlayer: @ 0x080095F4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	ldr r1, _08009608
	adds r0, r0, r1
	strb r5, [r0]
	movs r4, #0
	adds r6, r1, #0
	b _08009614
	.align 2, 0
_08009608: .4byte 0x03003118
_0800960C:
	adds r0, r4, r6
	ldrb r0, [r0]
	adds r5, r5, r0
	adds r4, #1
_08009614:
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0800960C
	cmp r5, #0
	bne _08009630
	ldr r1, _08009638
	ldrb r0, [r1]
	cmp r0, #0
	bne _08009630
	movs r0, #1
	strb r0, [r1]
_08009630:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009638: .4byte 0x030031C4
	thumb_func_end HandleReceiveRemoteLinkPlayer

	thumb_func_start ProcessRecvCmds
ProcessRecvCmds: @ 0x0800963C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
_0800964A:
	ldr r0, _08009694
	lsls r1, r6, #1
	adds r3, r1, r0
	movs r0, #0
	strh r0, [r3]
	lsls r4, r6, #4
	ldr r5, _08009698
	adds r2, r4, r5
	ldrh r0, [r2]
	mov ip, r1
	adds r7, r6, #1
	str r7, [sp]
	cmp r0, #0
	bne _08009668
	b _08009906
_08009668:
	ldrh r1, [r2]
	ldr r0, _0800969C
	cmp r1, r0
	bne _08009672
	b _080098B8
_08009672:
	cmp r1, r0
	bgt _080096C0
	ldr r0, _080096A0
	cmp r1, r0
	bne _0800967E
	b _080098FC
_0800967E:
	cmp r1, r0
	bgt _080096AC
	ldr r0, _080096A4
	cmp r1, r0
	beq _08009704
	ldr r0, _080096A8
	cmp r1, r0
	bne _08009690
	b _080098C0
_08009690:
	b _08009906
	.align 2, 0
_08009694: .4byte 0x030030C0
_08009698: .4byte 0x03003130
_0800969C: .4byte 0x00005FFF
_080096A0: .4byte 0x00004444
_080096A4: .4byte 0x00002222
_080096A8: .4byte 0x00002FFE
_080096AC:
	ldr r0, _080096BC
	cmp r1, r0
	beq _08009754
	adds r0, #0x11
	cmp r1, r0
	beq _08009754
	b _08009906
	.align 2, 0
_080096BC: .4byte 0x00005555
_080096C0:
	ldr r0, _080096DC
	cmp r1, r0
	beq _08009760
	cmp r1, r0
	bgt _080096E8
	ldr r0, _080096E0
	cmp r1, r0
	beq _0800978C
	ldr r0, _080096E4
	cmp r1, r0
	bne _080096D8
	b _080098D0
_080096D8:
	b _08009906
	.align 2, 0
_080096DC: .4byte 0x0000BBBB
_080096E0: .4byte 0x00008888
_080096E4: .4byte 0x0000AAAA
_080096E8:
	ldr r0, _080096FC
	cmp r1, r0
	bne _080096F0
	b _080098FC
_080096F0:
	ldr r0, _08009700
	cmp r1, r0
	bne _080096F8
	b _080098D6
_080096F8:
	b _08009906
	.align 2, 0
_080096FC: .4byte 0x0000CAFE
_08009700: .4byte 0x0000CCCC
_08009704:
	bl InitLocalLinkPlayer
	ldr r1, _08009748
	adds r1, #0x10
	ldr r0, _0800974C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r5, r7}
	stm r1!, {r2, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r3, _08009750
	ldr r1, _08009748
	adds r0, r3, #0
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldrh r2, [r0]
	strh r2, [r1]
	ldrb r0, [r0, #2]
	strb r0, [r1, #2]
	ldr r0, _08009748
	adds r0, #0x2c
	ldm r3!, {r1, r2, r4}
	stm r0!, {r1, r2, r4}
	ldrh r1, [r3]
	strh r1, [r0]
	ldrb r1, [r3, #2]
	strb r1, [r0, #2]
	ldr r0, _08009748
	movs r1, #0x3c
	bl InitBlockSend
	b _08009906
	.align 2, 0
_08009748: .4byte 0x030030D0
_0800974C: .4byte 0x02022684
_08009750: .4byte 0x082BFF24
_08009754:
	ldr r1, _0800975C
	movs r0, #1
	strb r0, [r1]
	b _08009906
	.align 2, 0
_0800975C: .4byte 0x03003188
_08009760:
	mov r5, ip
	adds r1, r5, r6
	lsls r1, r1, #2
	ldr r7, _08009784
	adds r1, r1, r7
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08009788
	adds r0, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r0, _08009788
	adds r0, #4
	adds r0, r4, r0
	ldrh r0, [r0]
	strb r0, [r1, #9]
	b _08009906
	.align 2, 0
_08009784: .4byte 0x03000D20
_08009788: .4byte 0x03003130
_0800978C:
	mov r1, ip
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r2, _080097D0
	adds r3, r0, r2
	ldrh r1, [r3, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r2, #0
	mov sl, r5
	cmp r1, r0
	bls _080097DC
	ldr r7, _080097D4
	mov r8, r7
	movs r2, #0
	adds r5, r3, #0
	ldr r7, _080097D8
	adds r3, r4, #0
_080097B0:
	ldrh r1, [r5]
	lsrs r1, r1, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	add r1, r8
	adds r2, #1
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #6
	bls _080097B0
	b _0800980C
	.align 2, 0
_080097D0: .4byte 0x03000D20
_080097D4: .4byte 0x0201C000
_080097D8: .4byte 0x03003130
_080097DC:
	movs r2, #0
	ldr r0, _0800988C
	mov sb, r0
	adds r7, r3, #0
	ldr r1, _08009890
	mov r8, r1
	lsls r5, r6, #8
	adds r3, r4, #0
_080097EC:
	ldrh r1, [r7]
	lsrs r1, r1, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	add r1, sb
	adds r2, #1
	lsls r0, r2, #1
	adds r0, r0, r3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #6
	bls _080097EC
_0800980C:
	mov r2, ip
	adds r1, r2, r6
	lsls r1, r1, #2
	add r1, sl
	ldrh r0, [r1]
	adds r0, #0xe
	movs r3, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #2]
	cmp r0, r1
	blo _08009906
	ldr r0, _08009894
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _080098AE
	lsls r1, r6, #8
	ldr r0, _0800988C
	adds r1, r1, r0
	mov r8, r1
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	ldr r1, _08009898
	adds r2, r0, r1
	adds r1, r2, #0
	mov r0, r8
	adds r0, #0x10
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldrb r0, [r2]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08009866
	strb r3, [r2, #0x12]
	strb r3, [r2, #0x11]
	strb r3, [r2, #0x10]
_08009866:
	ldr r5, _0800989C
	mov r0, r8
	adds r1, r5, #0
	bl strcmp
	cmp r0, #0
	bne _08009882
	mov r0, r8
	adds r0, #0x2c
	adds r1, r5, #0
	bl strcmp
	cmp r0, #0
	beq _080098A4
_08009882:
	ldr r0, _080098A0
	bl SetMainCallback2
	b _08009906
	.align 2, 0
_0800988C: .4byte 0x0202207C
_08009890: .4byte 0x03003130
_08009894: .4byte 0x03003118
_08009898: .4byte 0x020226A0
_0800989C: .4byte 0x082BFF24
_080098A0: .4byte 0x0800AA0D
_080098A4:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl HandleReceiveRemoteLinkPlayer
	b _08009906
_080098AE:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl SetBlockReceivedFlag
	b _08009906
_080098B8:
	ldr r0, _080098BC
	b _080098C2
	.align 2, 0
_080098BC: .4byte 0x03003190
_080098C0:
	ldr r0, _080098CC
_080098C2:
	adds r0, r6, r0
	movs r1, #1
	strb r1, [r0]
	b _08009906
	.align 2, 0
_080098CC: .4byte 0x0300318C
_080098D0:
	bl sub_08009FDC
	b _08009906
_080098D6:
	ldr r3, _080098F4
	ldr r0, _080098F8
	adds r0, #2
	adds r0, r4, r0
	ldrh r2, [r0]
	lsls r2, r2, #3
	adds r0, r2, r3
	ldr r1, [r0]
	adds r3, #4
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r0, #0
	bl SendBlock
	b _08009906
	.align 2, 0
_080098F4: .4byte 0x082BFEF8
_080098F8: .4byte 0x03003130
_080098FC:
	ldr r0, _08009924
	adds r0, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r3]
_08009906:
	ldr r1, [sp]
	lsls r0, r1, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bhi _08009912
	b _0800964A
_08009912:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009924: .4byte 0x03003130
	thumb_func_end ProcessRecvCmds

	thumb_func_start BuildSendCmd
BuildSendCmd: @ 0x08009928
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _08009954
	cmp r2, r0
	beq _080099F8
	cmp r2, r0
	bgt _08009988
	ldr r0, _08009958
	cmp r2, r0
	beq _080099E4
	cmp r2, r0
	bgt _08009964
	ldr r0, _0800995C
	cmp r2, r0
	beq _080099D0
	ldr r0, _08009960
_0800994A:
	cmp r2, r0
	bne _08009950
	b _08009A7C
_08009950:
	b _08009A9E
	.align 2, 0
_08009954: .4byte 0x00006666
_08009958: .4byte 0x00004444
_0800995C: .4byte 0x00002222
_08009960: .4byte 0x00002FFE
_08009964:
	ldr r0, _08009974
	cmp r2, r0
	bne _0800996C
	b _08009A7C
_0800996C:
	cmp r2, r0
	bgt _08009978
	subs r0, #0x11
	b _0800994A
	.align 2, 0
_08009974: .4byte 0x00005566
_08009978:
	ldr r0, _08009984
	cmp r2, r0
	bne _08009980
	b _08009A68
_08009980:
	b _08009A9E
	.align 2, 0
_08009984: .4byte 0x00005FFF
_08009988:
	ldr r0, _0800999C
	cmp r2, r0
	beq _08009A40
	cmp r2, r0
	bgt _080099A8
	ldr r0, _080099A0
	cmp r2, r0
	beq _08009A04
	ldr r0, _080099A4
	b _0800994A
	.align 2, 0
_0800999C: .4byte 0x0000AAAB
_080099A0: .4byte 0x00007777
_080099A4: .4byte 0x0000AAAA
_080099A8:
	ldr r0, _080099BC
	cmp r2, r0
	beq _08009A88
	cmp r2, r0
	bgt _080099C4
	ldr r0, _080099C0
	cmp r2, r0
	beq _08009A24
	b _08009A9E
	.align 2, 0
_080099BC: .4byte 0x0000CAFE
_080099C0: .4byte 0x0000BBBB
_080099C4:
	ldr r0, _080099CC
	cmp r2, r0
	beq _08009A54
	b _08009A9E
	.align 2, 0
_080099CC: .4byte 0x0000CCCC
_080099D0:
	ldr r0, _080099DC
	strh r2, [r0]
	ldr r1, _080099E0
	ldrh r1, [r1]
	b _08009A9C
	.align 2, 0
_080099DC: .4byte 0x030031B0
_080099E0: .4byte 0x0202267E
_080099E4:
	ldr r0, _080099F0
	strh r2, [r0]
	ldr r1, _080099F4
	ldrh r1, [r1, #0x2c]
	b _08009A9C
	.align 2, 0
_080099F0: .4byte 0x030031B0
_080099F4: .4byte 0x03002360
_080099F8:
	ldr r0, _08009A00
	movs r1, #0
	b _08009A9A
	.align 2, 0
_08009A00: .4byte 0x030031B0
_08009A04:
	ldr r0, _08009A20
	strh r2, [r0]
	movs r1, #0
	adds r3, r0, #0
	movs r2, #0xee
_08009A0E:
	adds r1, #1
	lsls r0, r1, #1
	adds r0, r0, r3
	strh r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #4
	bls _08009A0E
	b _08009A9E
	.align 2, 0
_08009A20: .4byte 0x030031B0
_08009A24:
	ldr r1, _08009A38
	strh r2, [r1]
	ldr r2, _08009A3C
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrb r0, [r2, #9]
	adds r0, #0x80
	strh r0, [r1, #4]
	b _08009A9E
	.align 2, 0
_08009A38: .4byte 0x030031B0
_08009A3C: .4byte 0x03000D10
_08009A40:
	ldr r0, _08009A4C
	strh r2, [r0]
	ldr r1, _08009A50
	ldrh r1, [r1]
	b _08009A9C
	.align 2, 0
_08009A4C: .4byte 0x030031B0
_08009A50: .4byte 0x0203CB48
_08009A54:
	ldr r0, _08009A60
	strh r2, [r0]
	ldr r1, _08009A64
	ldrb r1, [r1]
	b _08009A9C
	.align 2, 0
_08009A60: .4byte 0x030031B0
_08009A64: .4byte 0x030031F0
_08009A68:
	ldr r0, _08009A74
	strh r2, [r0]
	ldr r1, _08009A78
	ldrh r1, [r1]
	b _08009A9C
	.align 2, 0
_08009A74: .4byte 0x030031B0
_08009A78: .4byte 0x03003194
_08009A7C:
	ldr r0, _08009A84
	strh r2, [r0]
	b _08009A9E
	.align 2, 0
_08009A84: .4byte 0x030031B0
_08009A88:
	ldr r0, _08009AA4
	ldrh r1, [r0]
	cmp r1, #0
	beq _08009A9E
	ldr r0, _08009AA8
	ldrb r0, [r0]
	cmp r0, #0
	bne _08009A9E
	ldr r0, _08009AAC
_08009A9A:
	strh r2, [r0]
_08009A9C:
	strh r1, [r0, #2]
_08009A9E:
	pop {r0}
	bx r0
	.align 2, 0
_08009AA4: .4byte 0x03005B08
_08009AA8: .4byte 0x03002354
_08009AAC: .4byte 0x030031B0
	thumb_func_end BuildSendCmd

	thumb_func_start sub_08009AB0
sub_08009AB0: @ 0x08009AB0
	push {lr}
	ldr r0, _08009AC8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08009ABE
	bl sub_0800F2C4
_08009ABE:
	ldr r1, _08009ACC
	ldr r0, _08009AD0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08009AC8: .4byte 0x0300319C
_08009ACC: .4byte 0x030031E0
_08009AD0: .4byte 0x08009B09
	thumb_func_end sub_08009AB0

	thumb_func_start IsSendingKeysToLink
IsSendingKeysToLink: @ 0x08009AD4
	push {lr}
	ldr r0, _08009AE4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08009AE8
	bl IsSendingKeysToRfu
	b _08009B02
	.align 2, 0
_08009AE4: .4byte 0x0300319C
_08009AE8:
	ldr r0, _08009AF8
	ldr r1, [r0]
	ldr r0, _08009AFC
	cmp r1, r0
	beq _08009B00
	movs r0, #0
	b _08009B02
	.align 2, 0
_08009AF8: .4byte 0x030031E0
_08009AFC: .4byte 0x08009B09
_08009B00:
	movs r0, #1
_08009B02:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsSendingKeysToLink

	thumb_func_start sub_08009B08
sub_08009B08: @ 0x08009B08
	push {lr}
	ldr r0, _08009B1C
	ldrb r0, [r0]
	cmp r0, #1
	bne _08009B18
	ldr r0, _08009B20
	bl BuildSendCmd
_08009B18:
	pop {r0}
	bx r0
	.align 2, 0
_08009B1C: .4byte 0x030031C4
_08009B20: .4byte 0x0000CAFE
	thumb_func_end sub_08009B08

	thumb_func_start ClearLinkCallback
ClearLinkCallback: @ 0x08009B24
	push {lr}
	ldr r0, _08009B34
	ldrb r1, [r0]
	cmp r1, #0
	beq _08009B38
	bl Rfu_set_zero
	b _08009B3C
	.align 2, 0
_08009B34: .4byte 0x0300319C
_08009B38:
	ldr r0, _08009B40
	str r1, [r0]
_08009B3C:
	pop {r0}
	bx r0
	.align 2, 0
_08009B40: .4byte 0x030031E0
	thumb_func_end ClearLinkCallback

	thumb_func_start ClearLinkCallback_2
ClearLinkCallback_2: @ 0x08009B44
	push {lr}
	ldr r0, _08009B54
	ldrb r1, [r0]
	cmp r1, #0
	beq _08009B58
	bl Rfu_set_zero
	b _08009B5C
	.align 2, 0
_08009B54: .4byte 0x0300319C
_08009B58:
	ldr r0, _08009B60
	str r1, [r0]
_08009B5C:
	pop {r0}
	bx r0
	.align 2, 0
_08009B60: .4byte 0x030031E0
	thumb_func_end ClearLinkCallback_2

	thumb_func_start GetLinkPlayerCount
GetLinkPlayerCount: @ 0x08009B64
	push {lr}
	ldr r0, _08009B7C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08009B84
	ldr r0, _08009B80
	ldr r0, [r0]
	movs r1, #0x1c
	ands r0, r1
	lsrs r0, r0, #2
	b _08009B8C
	.align 2, 0
_08009B7C: .4byte 0x0300319C
_08009B80: .4byte 0x03003180
_08009B84:
	bl sub_0800FFF4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08009B8C:
	pop {r1}
	bx r1
	thumb_func_end GetLinkPlayerCount

	thumb_func_start sub_08009B90
sub_08009B90: @ 0x08009B90
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r2, #0
	cmp r2, r4
	bge _08009BC8
	movs r7, #0xff
	ldr r3, _08009BBC
_08009BA8:
	ldrh r0, [r3]
	adds r1, r7, #0
	ands r1, r0
	cmp r1, r6
	beq _08009BB6
	cmp r1, r5
	bne _08009BC0
_08009BB6:
	movs r0, #1
	b _08009BCC
	.align 2, 0
_08009BBC: .4byte 0x020226A0
_08009BC0:
	adds r3, #0x1c
	adds r2, #1
	cmp r2, r4
	blt _08009BA8
_08009BC8:
	movs r0, #1
	rsbs r0, r0, #0
_08009BCC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08009B90

	thumb_func_start sub_08009BD4
sub_08009BD4: @ 0x08009BD4
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08009BDC
	b _08009BEE
	.align 2, 0
_08009BDC: .4byte 0x020226A0
_08009BE0:
	ldrh r0, [r4, #0x1a]
	cmp r0, #1
	beq _08009BEA
	movs r0, #1
	b _08009BFC
_08009BEA:
	adds r4, #0x1c
	adds r5, #1
_08009BEE:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blt _08009BE0
	movs r0, #0
_08009BFC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08009BD4

	thumb_func_start sub_08009C04
sub_08009C04: @ 0x08009C04
	push {lr}
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _08009C1E
	movs r0, #2
	movs r1, #1
	bl sub_08009B90
	cmp r0, #0
	bge _08009C22
_08009C1E:
	movs r0, #0
	b _08009C24
_08009C22:
	movs r0, #1
_08009C24:
	pop {r1}
	bx r1
	thumb_func_end sub_08009C04

	thumb_func_start Link_AnyPartnersPlayingRubyOrSapphire
Link_AnyPartnersPlayingRubyOrSapphire: @ 0x08009C28
	push {lr}
	movs r0, #2
	movs r1, #1
	bl sub_08009B90
	cmp r0, #0
	bge _08009C3A
	movs r0, #0
	b _08009C3C
_08009C3A:
	movs r0, #1
_08009C3C:
	pop {r1}
	bx r1
	thumb_func_end Link_AnyPartnersPlayingRubyOrSapphire

	thumb_func_start sub_08009C40
sub_08009C40: @ 0x08009C40
	push {lr}
	movs r0, #4
	movs r1, #5
	bl sub_08009B90
	adds r2, r0, #0
	cmp r2, #0
	blt _08009C68
	ldr r0, _08009C64
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x1a]
	cmp r0, #1
	bne _08009C68
	movs r0, #1
	b _08009C6A
	.align 2, 0
_08009C64: .4byte 0x020226A0
_08009C68:
	movs r0, #0
_08009C6A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08009C40

	thumb_func_start OpenLinkTimed
OpenLinkTimed: @ 0x08009C70
	push {lr}
	ldr r0, _08009C84
	movs r1, #0
	str r1, [r0]
	ldr r0, _08009C88
	strh r1, [r0]
	bl OpenLink
	pop {r0}
	bx r0
	.align 2, 0
_08009C84: .4byte 0x03000D5C
_08009C88: .4byte 0x02022680
	thumb_func_end OpenLinkTimed

	thumb_func_start GetLinkPlayerDataExchangeStatusTimed
GetLinkPlayerDataExchangeStatusTimed: @ 0x08009C8C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r7, #0
	ldr r0, _08009CB8
	ldrb r4, [r0]
	cmp r4, #1
	beq _08009C9E
	b _08009DD8
_08009C9E:
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bgt _08009CAE
	cmp r0, r6
	ble _08009CC0
_08009CAE:
	ldr r1, _08009CBC
	movs r0, #6
	str r0, [r1]
	b _08009DF2
	.align 2, 0
_08009CB8: .4byte 0x030031C4
_08009CBC: .4byte 0x03000D5C
_08009CC0:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08009CD2
	ldr r0, _08009CDC
	strb r4, [r0]
	bl CloseLink
_08009CD2:
	movs r6, #0
	ldr r4, _08009CE0
	movs r5, #0
	b _08009CF8
	.align 2, 0
_08009CDC: .4byte 0x0300310C
_08009CE0: .4byte 0x020226A0
_08009CE4:
	adds r0, r4, #0
	adds r0, #0x14
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _08009CF4
	adds r7, #1
_08009CF4:
	adds r5, #0x1c
	adds r6, #1
_08009CF8:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	blt _08009CE4
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne _08009D70
	ldr r0, _08009D30
	ldr r1, [r0, #0x14]
	ldr r0, _08009D34
	cmp r1, r0
	bne _08009D60
	bl sub_0807A198
	cmp r0, #1
	beq _08009D48
	cmp r0, #1
	bgt _08009D3C
	cmp r0, #0
	beq _08009D60
	ldr r3, _08009D38
	b _08009DF0
	.align 2, 0
_08009D30: .4byte 0x020226A0
_08009D34: .4byte 0x00001133
_08009D38: .4byte 0x03000D5C
_08009D3C:
	cmp r0, #2
	beq _08009D54
	ldr r3, _08009D44
	b _08009DF0
	.align 2, 0
_08009D44: .4byte 0x03000D5C
_08009D48:
	ldr r1, _08009D50
	movs r0, #4
	b _08009D64
	.align 2, 0
_08009D50: .4byte 0x03000D5C
_08009D54:
	ldr r1, _08009D5C
	movs r0, #5
	b _08009D64
	.align 2, 0
_08009D5C: .4byte 0x03000D5C
_08009D60:
	ldr r1, _08009D6C
	movs r0, #1
_08009D64:
	str r0, [r1]
	adds r3, r1, #0
	b _08009DF0
	.align 2, 0
_08009D6C: .4byte 0x03000D5C
_08009D70:
	ldr r6, _08009DC4
	movs r0, #3
	str r0, [r6]
	ldr r4, _08009DC8
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r4, #0x14
	adds r1, r1, r4
	ldr r5, [r1]
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r1, [r1]
	ldr r2, _08009DCC
	cmp r5, r2
	bne _08009DAE
	ldr r0, _08009DD0
	cmp r1, r0
	beq _08009DBA
_08009DAE:
	ldr r0, _08009DD0
	adds r3, r6, #0
	cmp r5, r0
	bne _08009DF0
	cmp r1, r2
	bne _08009DF0
_08009DBA:
	ldr r1, _08009DD4
	movs r0, #3
	strh r0, [r1]
	ldr r3, _08009DC4
	b _08009DF0
	.align 2, 0
_08009DC4: .4byte 0x03000D5C
_08009DC8: .4byte 0x020226A0
_08009DCC: .4byte 0x00002266
_08009DD0: .4byte 0x00002277
_08009DD4: .4byte 0x02037282
_08009DD8:
	ldr r0, _08009DF8
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	movs r0, #0x96
	lsls r0, r0, #0x12
	ldr r3, _08009DFC
	cmp r1, r0
	bls _08009DF0
	movs r0, #2
	str r0, [r3]
_08009DF0:
	ldrb r0, [r3]
_08009DF2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08009DF8: .4byte 0x02022680
_08009DFC: .4byte 0x03000D5C
	thumb_func_end GetLinkPlayerDataExchangeStatusTimed

	thumb_func_start IsLinkPlayerDataExchangeComplete
IsLinkPlayerDataExchangeComplete: @ 0x08009E00
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r4, #0
	ldr r5, _08009E0C
	b _08009E30
	.align 2, 0
_08009E0C: .4byte 0x020226A0
_08009E10:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r5, #0x14]
	cmp r1, r0
	bne _08009E2A
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08009E2A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08009E30:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _08009E10
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bne _08009E54
	movs r2, #1
	ldr r0, _08009E50
	str r2, [r0]
	b _08009E5C
	.align 2, 0
_08009E50: .4byte 0x03000D5C
_08009E54:
	movs r2, #0
	ldr r1, _08009E64
	movs r0, #3
	str r0, [r1]
_08009E5C:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08009E64: .4byte 0x03000D5C
	thumb_func_end IsLinkPlayerDataExchangeComplete

	thumb_func_start GetLinkPlayerTrainerId
GetLinkPlayerTrainerId: @ 0x08009E68
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08009E7C
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08009E7C: .4byte 0x020226A0
	thumb_func_end GetLinkPlayerTrainerId

	thumb_func_start ResetLinkPlayers
ResetLinkPlayers: @ 0x08009E80
	push {r4, r5, lr}
	ldr r5, _08009EA0
	movs r4, #4
_08009E86:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x1c
	bl memset
	adds r5, #0x1c
	subs r4, #1
	cmp r4, #0
	bge _08009E86
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009EA0: .4byte 0x020226A0
	thumb_func_end ResetLinkPlayers

	thumb_func_start ResetBlockSend
ResetBlockSend: @ 0x08009EA4
	ldr r1, _08009EB4
	movs r0, #0
	strb r0, [r1, #8]
	strh r0, [r1]
	strh r0, [r1, #2]
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_08009EB4: .4byte 0x03000D10
	thumb_func_end ResetBlockSend

	thumb_func_start InitBlockSend
InitBlockSend: @ 0x08009EB8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _08009ECC
	ldrb r5, [r4, #8]
	cmp r5, #0
	beq _08009ED0
	movs r0, #0
	b _08009F0E
	.align 2, 0
_08009ECC: .4byte 0x03000D10
_08009ED0:
	bl GetMultiplayerId
	strb r0, [r4, #9]
	movs r0, #1
	strb r0, [r4, #8]
	strh r6, [r4, #2]
	strh r5, [r4]
	adds r0, #0xff
	cmp r6, r0
	bls _08009EE8
	str r7, [r4, #4]
	b _08009EFA
_08009EE8:
	ldr r5, _08009F14
	cmp r7, r5
	beq _08009EF8
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl memcpy
_08009EF8:
	str r5, [r4, #4]
_08009EFA:
	ldr r0, _08009F18
	bl BuildSendCmd
	ldr r1, _08009F1C
	ldr r0, _08009F20
	str r0, [r1]
	ldr r1, _08009F24
	movs r0, #0
	str r0, [r1]
	movs r0, #1
_08009F0E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08009F14: .4byte 0x0202257C
_08009F18: .4byte 0x0000BBBB
_08009F1C: .4byte 0x030031E0
_08009F20: .4byte 0x08009F29
_08009F24: .4byte 0x03000D50
	thumb_func_end InitBlockSend

	thumb_func_start LinkCB_BlockSendBegin
LinkCB_BlockSendBegin: @ 0x08009F28
	push {lr}
	ldr r1, _08009F40
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #2
	bls _08009F3C
	ldr r1, _08009F44
	ldr r0, _08009F48
	str r0, [r1]
_08009F3C:
	pop {r0}
	bx r0
	.align 2, 0
_08009F40: .4byte 0x03000D50
_08009F44: .4byte 0x030031E0
_08009F48: .4byte 0x08009F4D
	thumb_func_end LinkCB_BlockSendBegin

	thumb_func_start LinkCB_BlockSend
LinkCB_BlockSend: @ 0x08009F4C
	push {r4, r5, r6, lr}
	ldr r0, _08009F9C
	ldr r5, [r0, #4]
	ldr r2, _08009FA0
	ldr r1, _08009FA4
	strh r1, [r2]
	movs r3, #0
	adds r4, r0, #0
	adds r6, r4, #0
	adds r2, #2
_08009F60:
	lsls r0, r3, #1
	ldrh r1, [r6]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #6
	ble _08009F60
	ldrh r0, [r4]
	adds r0, #0xe
	strh r0, [r4]
	ldrh r1, [r4, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _08009F94
	movs r0, #0
	strb r0, [r4, #8]
	ldr r1, _08009FA8
	ldr r0, _08009FAC
	str r0, [r1]
_08009F94:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009F9C: .4byte 0x03000D10
_08009FA0: .4byte 0x030031B0
_08009FA4: .4byte 0x00008888
_08009FA8: .4byte 0x030031E0
_08009FAC: .4byte 0x08009FB1
	thumb_func_end LinkCB_BlockSend

	thumb_func_start LinkCB_BlockSendEnd
LinkCB_BlockSendEnd: @ 0x08009FB0
	ldr r1, _08009FB8
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08009FB8: .4byte 0x030031E0
	thumb_func_end LinkCB_BlockSendEnd

	thumb_func_start sub_08009FBC
sub_08009FBC: @ 0x08009FBC
	push {lr}
	bl GetMultiplayerId
	ldr r0, _08009FD4
	bl BuildSendCmd
	ldr r1, _08009FD8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08009FD4: .4byte 0x00004444
_08009FD8: .4byte 0x02022078
	thumb_func_end sub_08009FBC

	thumb_func_start sub_08009FDC
sub_08009FDC: @ 0x08009FDC
	push {lr}
	ldr r1, _08009FF4
	movs r0, #0
	str r0, [r1]
	ldr r0, _08009FF8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08009FFC
	bl sub_0800F334
	b _0800A002
	.align 2, 0
_08009FF4: .4byte 0x02022078
_08009FF8: .4byte 0x0300319C
_08009FFC:
	ldr r1, _0800A008
	ldr r0, _0800A00C
	str r0, [r1]
_0800A002:
	pop {r0}
	bx r0
	.align 2, 0
_0800A008: .4byte 0x030031E0
_0800A00C: .4byte 0x08009FBD
	thumb_func_end sub_08009FDC

	thumb_func_start sub_0800A010
sub_0800A010: @ 0x0800A010
	ldr r0, _0800A018
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800A018: .4byte 0x02022078
	thumb_func_end sub_0800A010

	thumb_func_start sub_0800A01C
sub_0800A01C: @ 0x0800A01C
	push {lr}
	ldr r0, _0800A028
	bl BuildSendCmd
	pop {r0}
	bx r0
	.align 2, 0
_0800A028: .4byte 0x0000AAAA
	thumb_func_end sub_0800A01C

	thumb_func_start GetMultiplayerId
GetMultiplayerId: @ 0x0800A02C
	push {lr}
	ldr r0, _0800A040
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800A048
	ldr r0, _0800A044
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	b _0800A050
	.align 2, 0
_0800A040: .4byte 0x0300319C
_0800A044: .4byte 0x04000128
_0800A048:
	bl rfu_get_multiplayer_id
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0800A050:
	pop {r1}
	bx r1
	thumb_func_end GetMultiplayerId

	thumb_func_start bitmask_all_link_players_but_self
bitmask_all_link_players_but_self: @ 0x0800A054
	push {lr}
	bl GetMultiplayerId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	lsls r0, r1
	movs r1, #0xf
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end bitmask_all_link_players_but_self

	thumb_func_start SendBlock
SendBlock: @ 0x0800A070
	push {lr}
	adds r3, r1, #0
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	ldr r0, _0800A088
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800A08C
	adds r0, r3, #0
	bl InitBlockSend
	b _0800A092
	.align 2, 0
_0800A088: .4byte 0x0300319C
_0800A08C:
	adds r0, r3, #0
	bl sub_0800F968
_0800A092:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SendBlock

	thumb_func_start sub_0800A09C
sub_0800A09C: @ 0x0800A09C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	ldr r0, _0800A0B8
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A0BC
	adds r0, r1, #0
	bl sub_0800FC00
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0800A0D8
	.align 2, 0
_0800A0B8: .4byte 0x0300319C
_0800A0BC:
	ldr r0, _0800A0C8
	ldr r0, [r0]
	cmp r0, #0
	beq _0800A0CC
	movs r0, #0
	b _0800A0D8
	.align 2, 0
_0800A0C8: .4byte 0x030031E0
_0800A0CC:
	ldr r0, _0800A0DC
	strb r2, [r0]
	ldr r0, _0800A0E0
	bl BuildSendCmd
	movs r0, #1
_0800A0D8:
	pop {r1}
	bx r1
	.align 2, 0
_0800A0DC: .4byte 0x030031F0
_0800A0E0: .4byte 0x0000CCCC
	thumb_func_end sub_0800A09C

	thumb_func_start IsLinkTaskFinished
IsLinkTaskFinished: @ 0x0800A0E4
	push {lr}
	ldr r0, _0800A0F8
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A0FC
	bl sub_08010000
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0800A10A
	.align 2, 0
_0800A0F8: .4byte 0x0300319C
_0800A0FC:
	movs r1, #0
	ldr r0, _0800A110
	ldr r0, [r0]
	cmp r0, #0
	bne _0800A108
	movs r1, #1
_0800A108:
	adds r0, r1, #0
_0800A10A:
	pop {r1}
	bx r1
	.align 2, 0
_0800A110: .4byte 0x030031E0
	thumb_func_end IsLinkTaskFinished

	thumb_func_start GetBlockReceivedStatus
GetBlockReceivedStatus: @ 0x0800A114
	push {lr}
	ldr r0, _0800A138
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800A140
	ldr r2, _0800A13C
	ldrb r0, [r2, #3]
	lsls r0, r0, #3
	ldrb r1, [r2, #2]
	lsls r1, r1, #2
	orrs r0, r1
	ldrb r1, [r2, #1]
	lsls r1, r1, #1
	orrs r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	b _0800A144
	.align 2, 0
_0800A138: .4byte 0x0300319C
_0800A13C: .4byte 0x0300311C
_0800A140:
	bl sub_0800F7BC
_0800A144:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end GetBlockReceivedStatus

	thumb_func_start SetBlockReceivedFlag
SetBlockReceivedFlag: @ 0x0800A14C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0800A164
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A168
	adds r0, r1, #0
	bl sub_0800F1BC
	b _0800A170
	.align 2, 0
_0800A164: .4byte 0x0300319C
_0800A168:
	ldr r0, _0800A174
	adds r0, r1, r0
	movs r1, #1
	strb r1, [r0]
_0800A170:
	pop {r0}
	bx r0
	.align 2, 0
_0800A174: .4byte 0x0300311C
	thumb_func_end SetBlockReceivedFlag

	thumb_func_start ResetBlockReceivedFlags
ResetBlockReceivedFlags: @ 0x0800A178
	push {r4, lr}
	ldr r0, _0800A194
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A198
	movs r4, #0
_0800A184:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F1E8
	adds r4, #1
	cmp r4, #4
	ble _0800A184
	b _0800A1A6
	.align 2, 0
_0800A194: .4byte 0x0300319C
_0800A198:
	ldr r1, _0800A1AC
	movs r2, #0
	adds r0, r1, #3
_0800A19E:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0800A19E
_0800A1A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A1AC: .4byte 0x0300311C
	thumb_func_end ResetBlockReceivedFlags

	thumb_func_start ResetBlockReceivedFlag
ResetBlockReceivedFlag: @ 0x0800A1B0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0800A1C8
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A1CC
	adds r0, r1, #0
	bl sub_0800F1E8
	b _0800A1DA
	.align 2, 0
_0800A1C8: .4byte 0x0300319C
_0800A1CC:
	ldr r0, _0800A1E0
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800A1DA
	movs r0, #0
	strb r0, [r1]
_0800A1DA:
	pop {r0}
	bx r0
	.align 2, 0
_0800A1E0: .4byte 0x0300311C
	thumb_func_end ResetBlockReceivedFlag

	thumb_func_start CheckShouldAdvanceLinkState
CheckShouldAdvanceLinkState: @ 0x0800A1E4
	push {lr}
	ldr r0, _0800A204
	ldr r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800A200
	movs r0, #0x1c
	ands r1, r0
	cmp r1, #4
	bls _0800A200
	ldr r1, _0800A208
	movs r0, #1
	strb r0, [r1]
_0800A200:
	pop {r0}
	bx r0
	.align 2, 0
_0800A204: .4byte 0x03003180
_0800A208: .4byte 0x030031E4
	thumb_func_end CheckShouldAdvanceLinkState

	thumb_func_start LinkTestCalcBlockChecksum
LinkTestCalcBlockChecksum: @ 0x0800A20C
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	movs r3, #0
	movs r2, #0
	lsrs r1, r1, #0x11
	cmp r3, r1
	bhs _0800A232
_0800A21C:
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r1
	blo _0800A21C
_0800A232:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LinkTestCalcBlockChecksum

	thumb_func_start LinkTest_prnthexchar
LinkTest_prnthexchar: @ 0x0800A23C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r4, _0800A270
	ldr r3, [r4]
	lsls r3, r3, #0xb
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r3, r3, r5
	lsrs r2, r2, #0x13
	adds r2, r2, r1
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r3, [r4, #4]
	lsls r3, r3, #0xc
	ldr r1, [r4, #8]
	adds r1, #1
	adds r0, r0, r1
	orrs r3, r0
	strh r3, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A270: .4byte 0x030031D0
	thumb_func_end LinkTest_prnthexchar

	thumb_func_start LinkTest_prntchar
LinkTest_prntchar: @ 0x0800A274
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r4, _0800A2A8
	ldr r3, [r4]
	lsls r3, r3, #0xb
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r3, r3, r5
	lsrs r2, r2, #0x13
	adds r2, r2, r1
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r3, [r4, #4]
	lsls r3, r3, #0xc
	ldr r1, [r4, #8]
	adds r1, r1, r0
	orrs r3, r1
	strh r3, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A2A8: .4byte 0x030031D0
	thumb_func_end LinkTest_prntchar

	thumb_func_start LinkTest_prnthex
LinkTest_prnthex: @ 0x0800A2AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	cmp r4, r3
	bge _0800A2D8
	movs r2, #0xf
_0800A2C6:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r5, #0
	ands r0, r2
	strb r0, [r1]
	lsrs r5, r5, #4
	adds r4, #1
	cmp r4, r3
	blt _0800A2C6
_0800A2D8:
	subs r4, r3, #1
	cmp r4, #0
	blt _0800A2F8
_0800A2DE:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r1, r6, #0
	adds r2, r7, #0
	bl LinkTest_prnthexchar
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	subs r4, #1
	cmp r4, #0
	bge _0800A2DE
_0800A2F8:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end LinkTest_prnthex

	thumb_func_start LinkTest_prntint
LinkTest_prntint: @ 0x0800A300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x10]
	cmp r6, #0
	bge _0800A32C
	str r7, [sp, #0x10]
	rsbs r6, r6, #0
_0800A32C:
	movs r5, #0
	movs r1, #1
	rsbs r1, r1, #0
	add r1, r8
	mov sl, r1
	cmp r5, r8
	bge _0800A358
_0800A33A:
	mov r0, sp
	adds r4, r0, r5
	adds r0, r6, #0
	movs r1, #0xa
	bl __modsi3
	strb r0, [r4]
	adds r0, r6, #0
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	adds r5, #1
	cmp r5, r8
	blt _0800A33A
_0800A358:
	mov r5, sl
	cmp r5, #0
	blt _0800A378
_0800A35E:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	adds r1, r7, #0
	mov r2, sb
	bl LinkTest_prnthexchar
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	subs r5, #1
	cmp r5, #0
	bge _0800A35E
_0800A378:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x10]
	cmp r1, r0
	beq _0800A38E
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0xa
	mov r2, sb
	bl LinkTest_prnthexchar
_0800A38E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkTest_prntint

	thumb_func_start LinkTest_prntstr
LinkTest_prntstr: @ 0x0800A3A0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r6, #0
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800A3E0
	adds r4, r3, #0
	lsls r5, r2, #0x18
_0800A3B8:
	ldrb r0, [r4]
	cmp r0, #0xa
	bne _0800A3C8
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	movs r6, #0
	b _0800A3D8
_0800A3C8:
	ldrb r0, [r4]
	adds r1, r7, r6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r5, #0x18
	bl LinkTest_prntchar
	adds r6, #1
_0800A3D8:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800A3B8
_0800A3E0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LinkTest_prntstr

	thumb_func_start LinkCB_RequestPlayerDataExchange
LinkCB_RequestPlayerDataExchange: @ 0x0800A3E8
	push {lr}
	ldr r0, _0800A408
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800A3FC
	ldr r0, _0800A40C
	bl BuildSendCmd
_0800A3FC:
	ldr r1, _0800A410
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0800A408: .4byte 0x03003180
_0800A40C: .4byte 0x00002222
_0800A410: .4byte 0x030031E0
	thumb_func_end LinkCB_RequestPlayerDataExchange

	thumb_func_start Task_PrintTestData
Task_PrintTestData: @ 0x0800A414
	push {r4, r5, r6, lr}
	sub sp, #0x20
	ldr r1, _0800A534
	mov r0, sp
	bl strcpy
	mov r0, sp
	movs r1, #5
	movs r2, #2
	bl LinkTest_prntstr
	ldr r0, _0800A538
	ldrb r0, [r0]
	movs r1, #2
	movs r2, #1
	movs r3, #2
	bl LinkTest_prnthex
	ldr r4, _0800A53C
	ldr r0, [r4]
	movs r1, #0xf
	movs r2, #1
	movs r3, #8
	bl LinkTest_prnthex
	ldr r0, _0800A540
	ldrb r0, [r0, #1]
	movs r1, #2
	movs r2, #0xa
	movs r3, #2
	bl LinkTest_prnthex
	ldr r0, [r4]
	movs r1, #0x1c
	ands r0, r1
	lsrs r0, r0, #2
	movs r1, #0xf
	movs r2, #0xa
	movs r3, #2
	bl LinkTest_prnthex
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xf
	movs r2, #0xc
	movs r3, #2
	bl LinkTest_prnthex
	ldr r0, _0800A544
	ldrb r0, [r0]
	movs r1, #0x19
	movs r2, #1
	movs r3, #2
	bl LinkTest_prnthex
	ldr r0, _0800A548
	ldrb r0, [r0]
	movs r1, #0x19
	movs r2, #2
	movs r3, #2
	bl LinkTest_prnthex
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xf
	movs r2, #5
	movs r3, #2
	bl LinkTest_prnthex
	ldr r0, _0800A54C
	ldr r0, [r0]
	movs r1, #2
	movs r2, #0xc
	movs r3, #8
	bl LinkTest_prnthex
	ldr r0, _0800A550
	ldr r0, [r0]
	movs r1, #2
	movs r2, #0xd
	movs r3, #8
	bl LinkTest_prnthex
	bl GetSioMultiSI
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x19
	movs r2, #5
	movs r3, #1
	bl LinkTest_prnthex
	bl IsSioMultiMaster
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x19
	movs r2, #6
	movs r3, #1
	bl LinkTest_prnthex
	bl IsLinkConnectionEstablished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x19
	movs r2, #7
	movs r3, #1
	bl LinkTest_prnthex
	bl HasLinkErrorOccurred
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x19
	movs r2, #8
	movs r3, #1
	bl LinkTest_prnthex
	movs r6, #0
	movs r5, #0x80
	lsls r5, r5, #0x13
	ldr r4, _0800A554
_0800A512:
	ldrh r0, [r4]
	lsrs r2, r5, #0x18
	movs r1, #0xa
	movs r3, #4
	bl LinkTest_prnthex
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _0800A512
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A534: .4byte 0x082BFF34
_0800A538: .4byte 0x030031E4
_0800A53C: .4byte 0x03003180
_0800A540: .4byte 0x03003210
_0800A544: .4byte 0x03003200
_0800A548: .4byte 0x030041D0
_0800A54C: .4byte 0x030030CC
_0800A550: .4byte 0x03003110
_0800A554: .4byte 0x030031E8
	thumb_func_end Task_PrintTestData

	thumb_func_start SetLinkDebugValues
SetLinkDebugValues: @ 0x0800A558
	ldr r2, _0800A564
	str r0, [r2]
	ldr r0, _0800A568
	str r1, [r0]
	bx lr
	.align 2, 0
_0800A564: .4byte 0x030030CC
_0800A568: .4byte 0x03003110
	thumb_func_end SetLinkDebugValues

	thumb_func_start sub_0800A56C
sub_0800A56C: @ 0x0800A56C
	push {r4, lr}
	movs r1, #0
	movs r2, #0
	ldr r0, _0800A598
	ldrb r0, [r0]
	cmp r1, r0
	bge _0800A58E
	movs r4, #1
	adds r3, r0, #0
_0800A57E:
	adds r0, r4, #0
	lsls r0, r2
	orrs r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	adds r2, #1
	cmp r2, r3
	blt _0800A57E
_0800A58E:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800A598: .4byte 0x030031A0
	thumb_func_end sub_0800A56C

	thumb_func_start sub_0800A59C
sub_0800A59C: @ 0x0800A59C
	push {r4, r5, r6, lr}
	movs r4, #0
	movs r5, #0
	movs r6, #1
	b _0800A5B2
_0800A5A6:
	adds r0, r6, #0
	lsls r0, r5
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	adds r5, #1
_0800A5B2:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blt _0800A5A6
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800A59C

	thumb_func_start sub_0800A5C8
sub_0800A5C8: @ 0x0800A5C8
	push {r4, r5, r6, r7, lr}
	ldr r1, _0800A5FC
	strb r0, [r1]
	bl GetMultiplayerId
	ldr r1, _0800A600
	strb r0, [r1]
	ldr r4, _0800A604
	ldr r3, _0800A608
	movs r2, #4
_0800A5DC:
	adds r0, r3, #0
	adds r1, r4, #0
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r4, #0x1c
	adds r3, #0x1c
	subs r2, #1
	cmp r2, #0
	bge _0800A5DC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A5FC: .4byte 0x030031A0
_0800A600: .4byte 0x030031C0
_0800A604: .4byte 0x020226A0
_0800A608: .4byte 0x0202272C
	thumb_func_end sub_0800A5C8

	thumb_func_start GetSavedPlayerCount
GetSavedPlayerCount: @ 0x0800A60C
	ldr r0, _0800A614
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800A614: .4byte 0x030031A0
	thumb_func_end GetSavedPlayerCount

	thumb_func_start sub_0800A618
sub_0800A618: @ 0x0800A618
	ldr r0, _0800A620
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800A620: .4byte 0x030031C0
	thumb_func_end sub_0800A618

	thumb_func_start sub_0800A624
sub_0800A624: @ 0x0800A624
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r3, #0
	ldr r0, _0800A694
	ldrb r1, [r0]
	mov sb, r0
	cmp r3, r1
	bge _0800A678
	ldr r0, _0800A698
	mov ip, r0
	ldr r0, _0800A69C
	ldr r2, _0800A6A0
	mov r8, r2
	ldr r7, _0800A6A4
	mov r6, ip
	adds r6, #0x14
	adds r5, r0, #4
	movs r4, #0
	adds r2, r1, #0
_0800A64E:
	mov r0, ip
	adds r0, #4
	adds r0, r4, r0
	ldr r1, [r0]
	ldr r0, [r5]
	cmp r1, r0
	bne _0800A66C
	ldrh r0, [r7]
	cmp r0, r8
	bne _0800A66A
	adds r1, r0, #0
	ldr r0, [r6]
	cmp r1, r0
	bne _0800A66C
_0800A66A:
	adds r3, #1
_0800A66C:
	adds r6, #0x1c
	adds r5, #0x1c
	adds r4, #0x1c
	subs r2, #1
	cmp r2, #0
	bne _0800A64E
_0800A678:
	mov r0, sb
	ldrb r0, [r0]
	cmp r3, r0
	bne _0800A6A8
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	cmp r0, r1
	bne _0800A6A8
	movs r0, #1
	b _0800A6AA
	.align 2, 0
_0800A694: .4byte 0x030031A0
_0800A698: .4byte 0x020226A0
_0800A69C: .4byte 0x0202272C
_0800A6A0: .4byte 0x00002288
_0800A6A4: .4byte 0x0202267E
_0800A6A8:
	movs r0, #0
_0800A6AA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0800A624

	thumb_func_start sub_0800A6B8
sub_0800A6B8: @ 0x0800A6B8
	push {r4, r5, lr}
	ldr r5, _0800A6D8
	movs r4, #3
_0800A6BE:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x1c
	bl CpuSet
	adds r5, #0x1c
	subs r4, #1
	cmp r4, #0
	bge _0800A6BE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A6D8: .4byte 0x0202272C
	thumb_func_end sub_0800A6B8

	thumb_func_start sub_0800A6DC
sub_0800A6DC: @ 0x0800A6DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r0, _0800A748
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0800A73C
	ldr r6, _0800A74C
	ldr r5, _0800A750
	movs r0, #8
	adds r0, r0, r6
	mov r8, r0
	adds r7, r5, #0
	adds r7, #8
_0800A6FA:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r2, r0, #2
	adds r1, r6, #4
	adds r1, r2, r1
	adds r0, r5, #4
	adds r0, r2, r0
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _0800A71E
	mov r1, r8
	adds r0, r2, r1
	adds r1, r2, r7
	bl StringCompare
	cmp r0, #0
	beq _0800A72E
_0800A71E:
	ldr r1, _0800A754
	movs r0, #1
	strb r0, [r1]
	bl CloseLink
	ldr r0, _0800A758
	bl SetMainCallback2
_0800A72E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0800A748
	ldrb r0, [r0]
	cmp r4, r0
	blo _0800A6FA
_0800A73C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A748: .4byte 0x030031A0
_0800A74C: .4byte 0x0202272C
_0800A750: .4byte 0x020226A0
_0800A754: .4byte 0x0300310C
_0800A758: .4byte 0x0800AA0D
	thumb_func_end sub_0800A6DC

	thumb_func_start sub_0800A75C
sub_0800A75C: @ 0x0800A75C
	ldr r0, _0800A768
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800A76C
	strb r1, [r0]
	bx lr
	.align 2, 0
_0800A768: .4byte 0x030031A0
_0800A76C: .4byte 0x030031C0
	thumb_func_end sub_0800A75C

	thumb_func_start GetLinkPlayerCount_2
GetLinkPlayerCount_2: @ 0x0800A770
	ldr r0, _0800A77C
	ldr r0, [r0]
	movs r1, #0x1c
	ands r0, r1
	lsrs r0, r0, #2
	bx lr
	.align 2, 0
_0800A77C: .4byte 0x03003180
	thumb_func_end GetLinkPlayerCount_2

	thumb_func_start IsLinkMaster
IsLinkMaster: @ 0x0800A780
	push {lr}
	ldr r0, _0800A798
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800A7A0
	ldr r0, _0800A79C
	ldr r0, [r0]
	lsrs r0, r0, #5
	movs r1, #1
	ands r0, r1
	b _0800A7A8
	.align 2, 0
_0800A798: .4byte 0x0300319C
_0800A79C: .4byte 0x03003180
_0800A7A0:
	bl Rfu_IsMaster
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0800A7A8:
	pop {r1}
	bx r1
	thumb_func_end IsLinkMaster

	thumb_func_start sub_0800A7AC
sub_0800A7AC: @ 0x0800A7AC
	ldr r0, _0800A7B4
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800A7B4: .4byte 0x03000D58
	thumb_func_end sub_0800A7AC

	thumb_func_start sub_0800A7B8
sub_0800A7B8: @ 0x0800A7B8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0800A7CC
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A7D0
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	b _0800A7E4
	.align 2, 0
_0800A7CC: .4byte 0x0300319C
_0800A7D0:
	ldr r2, _0800A7E8
	ldr r1, [r2]
	cmp r1, #0
	bne _0800A7E4
	ldr r0, _0800A7EC
	str r0, [r2]
	ldr r0, _0800A7F0
	strb r1, [r0]
	ldr r0, _0800A7F4
	strh r3, [r0]
_0800A7E4:
	pop {r0}
	bx r0
	.align 2, 0
_0800A7E8: .4byte 0x030031E0
_0800A7EC: .4byte 0x0800A845
_0800A7F0: .4byte 0x03003184
_0800A7F4: .4byte 0x03003194
	thumb_func_end sub_0800A7B8

	thumb_func_start sub_0800A7F8
sub_0800A7F8: @ 0x0800A7F8
	push {lr}
	ldr r0, _0800A808
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A80C
	bl task_add_05_task_del_08FA224_when_no_RfuFunc
	b _0800A834
	.align 2, 0
_0800A808: .4byte 0x0300319C
_0800A80C:
	ldr r2, _0800A820
	ldr r1, [r2]
	cmp r1, #0
	beq _0800A828
	ldr r1, _0800A824
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0800A834
	.align 2, 0
_0800A820: .4byte 0x030031E0
_0800A824: .4byte 0x020227C0
_0800A828:
	ldr r0, _0800A838
	str r0, [r2]
	ldr r0, _0800A83C
	strb r1, [r0]
	ldr r0, _0800A840
	strh r1, [r0]
_0800A834:
	pop {r0}
	bx r0
	.align 2, 0
_0800A838: .4byte 0x0800A845
_0800A83C: .4byte 0x03003184
_0800A840: .4byte 0x03003194
	thumb_func_end sub_0800A7F8

	thumb_func_start sub_0800A844
sub_0800A844: @ 0x0800A844
	push {lr}
	ldr r0, _0800A860
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800A85A
	ldr r0, _0800A864
	bl BuildSendCmd
	ldr r1, _0800A868
	ldr r0, _0800A86C
	str r0, [r1]
_0800A85A:
	pop {r0}
	bx r0
	.align 2, 0
_0800A860: .4byte 0x030041D0
_0800A864: .4byte 0x00005FFF
_0800A868: .4byte 0x030031E0
_0800A86C: .4byte 0x0800A871
	thumb_func_end sub_0800A844

	thumb_func_start sub_0800A870
sub_0800A870: @ 0x0800A870
	push {r4, lr}
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r3, #0
	movs r1, #0
	cmp r3, r2
	bge _0800A894
	ldr r4, _0800A8C0
_0800A884:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800A88E
	adds r3, #1
_0800A88E:
	adds r1, #1
	cmp r1, r2
	blt _0800A884
_0800A894:
	cmp r3, r2
	bne _0800A8B8
	ldr r2, _0800A8C4
	ldr r0, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0800A8C8
	movs r4, #1
	strb r4, [r0]
	bl CloseLink
	ldr r1, _0800A8CC
	movs r0, #0
	str r0, [r1]
	ldr r0, _0800A8D0
	strb r4, [r0]
_0800A8B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A8C0: .4byte 0x03003190
_0800A8C4: .4byte 0x02022C90
_0800A8C8: .4byte 0x030027E8
_0800A8CC: .4byte 0x030031E0
_0800A8D0: .4byte 0x03003184
	thumb_func_end sub_0800A870

	thumb_func_start sub_0800A8D4
sub_0800A8D4: @ 0x0800A8D4
	push {lr}
	ldr r0, _0800A8E4
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A8E8
	bl sub_0800FF34
	b _0800A8FA
	.align 2, 0
_0800A8E4: .4byte 0x0300319C
_0800A8E8:
	ldr r1, _0800A900
	ldr r0, [r1]
	cmp r0, #0
	bne _0800A8F4
	ldr r0, _0800A904
	str r0, [r1]
_0800A8F4:
	ldr r1, _0800A908
	movs r0, #0
	strb r0, [r1]
_0800A8FA:
	pop {r0}
	bx r0
	.align 2, 0
_0800A900: .4byte 0x030031E0
_0800A904: .4byte 0x0800A90D
_0800A908: .4byte 0x03003184
	thumb_func_end sub_0800A8D4

	thumb_func_start sub_0800A90C
sub_0800A90C: @ 0x0800A90C
	push {lr}
	ldr r0, _0800A928
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800A922
	ldr r0, _0800A92C
	bl BuildSendCmd
	ldr r1, _0800A930
	ldr r0, _0800A934
	str r0, [r1]
_0800A922:
	pop {r0}
	bx r0
	.align 2, 0
_0800A928: .4byte 0x030041D0
_0800A92C: .4byte 0x00002FFE
_0800A930: .4byte 0x030031E0
_0800A934: .4byte 0x0800A939
	thumb_func_end sub_0800A90C

	thumb_func_start sub_0800A938
sub_0800A938: @ 0x0800A938
	push {r4, lr}
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	cmp r1, r2
	bhs _0800A962
	ldr r3, _0800A988
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800A962
_0800A950:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	bhs _0800A962
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800A950
_0800A962:
	cmp r1, r2
	bne _0800A980
	movs r1, #0
	ldr r4, _0800A98C
	ldr r3, _0800A988
	movs r2, #0
_0800A96E:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0800A96E
	movs r0, #0
	str r0, [r4]
_0800A980:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A988: .4byte 0x0300318C
_0800A98C: .4byte 0x030031E0
	thumb_func_end sub_0800A938

	thumb_func_start CheckErrorStatus
CheckErrorStatus: @ 0x0800A990
	push {lr}
	ldr r0, _0800A9D4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800A9D0
	ldr r0, _0800A9D8
	ldr r2, [r0]
	movs r0, #0xfe
	lsls r0, r0, #0xb
	ands r0, r2
	cmp r0, #0
	beq _0800A9D0
	ldr r0, _0800A9DC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800A9C6
	ldr r1, _0800A9E0
	str r2, [r1]
	ldr r0, _0800A9E4
	ldrb r0, [r0]
	strb r0, [r1, #4]
	ldr r0, _0800A9E8
	ldrb r0, [r0]
	strb r0, [r1, #5]
	ldr r0, _0800A9EC
	bl SetMainCallback2
_0800A9C6:
	ldr r1, _0800A9F0
	movs r0, #1
	strb r0, [r1]
	bl CloseLink
_0800A9D0:
	pop {r0}
	bx r0
	.align 2, 0
_0800A9D4: .4byte 0x0202267C
_0800A9D8: .4byte 0x03003180
_0800A9DC: .4byte 0x03003198
_0800A9E0: .4byte 0x020227B8
_0800A9E4: .4byte 0x030041D0
_0800A9E8: .4byte 0x03003200
_0800A9EC: .4byte 0x0800AA0D
_0800A9F0: .4byte 0x0300310C
	thumb_func_end CheckErrorStatus

	thumb_func_start sub_0800A9F4
sub_0800A9F4: @ 0x0800A9F4
	push {r4, lr}
	ldr r4, _0800AA08
	str r0, [r4]
	strb r1, [r4, #5]
	strb r2, [r4, #4]
	strb r3, [r4, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AA08: .4byte 0x020227B8
	thumb_func_end sub_0800A9F4

	thumb_func_start CB2_LinkError
CB2_LinkError: @ 0x0800AA0C
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	ldr r0, _0800AB20
	bl m4aMPlayStop
	ldr r0, _0800AB24
	bl m4aMPlayStop
	ldr r0, _0800AB28
	bl m4aMPlayStop
	ldr r0, _0800AB2C
	movs r1, #0xe0
	lsls r1, r1, #9
	bl InitHeap
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFadeControl
	movs r0, #0
	movs r1, #0
	movs r2, #2
	bl FillPalette
	bl ResetTasks
	bl ScanlineEffect_Stop
	ldr r1, _0800AB30
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800AA68
	ldr r0, _0800AB34
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0800AA64
	movs r0, #3
	strb r0, [r1]
_0800AA64:
	bl sub_0800E0C8
_0800AA68:
	ldr r0, _0800AB38
	bl SetVBlankCallback
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0800AB3C
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	ldr r4, _0800AB40
	movs r0, #0x80
	lsls r0, r0, #4
	bl Alloc
	adds r1, r0, #0
	str r1, [r4]
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r0, _0800AB44
	bl InitWindows
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800AB18
	bl DeactivateAllTextPrinters
	bl reset_temp_tile_data_buffers
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r1, #0xe0
	lsls r1, r1, #8
	movs r0, #0
	bl ClearGpuRegBits
	ldr r0, _0800AB48
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _0800AB4C
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800AB50
	movs r1, #0
	bl CreateTask
	bl StopMapMusic
	ldr r1, _0800AB54
	movs r0, #0
	str r0, [r1]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _0800AB58
	bl SetMainCallback2
_0800AB18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AB20: .4byte 0x03007510
_0800AB24: .4byte 0x03007550
_0800AB28: .4byte 0x030075A0
_0800AB2C: .4byte 0x02000000
_0800AB30: .4byte 0x0300319C
_0800AB34: .4byte 0x020227B8
_0800AB38: .4byte 0x08009259
_0800AB3C: .4byte 0x082BFF4C
_0800AB40: .4byte 0x020227C4
_0800AB44: .4byte 0x082BFF54
_0800AB48: .4byte 0x085D7B04
_0800AB4C: .4byte 0x030027A0
_0800AB50: .4byte 0x08008FA1
_0800AB54: .4byte 0x03002360
_0800AB58: .4byte 0x0800AC7D
	thumb_func_end CB2_LinkError

	thumb_func_start sub_0800AB5C
sub_0800AB5C: @ 0x0800AB5C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _0800ABF8
	movs r0, #0
	movs r2, #0x20
	movs r3, #0
	bl LoadBgTiles
	ldr r1, _0800ABFC
	movs r5, #0
	str r5, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _0800AC00
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	ldr r0, _0800AC04
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r4, _0800AC08
	str r4, [sp]
	str r5, [sp, #4]
	ldr r0, _0800AC0C
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #3
	movs r2, #0x18
	movs r3, #5
	bl AddTextPrinterParameterized3
	str r4, [sp]
	str r5, [sp, #4]
	ldr r0, _0800AC10
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #3
	movs r2, #3
	movs r3, #2
	bl AddTextPrinterParameterized3
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #0
	bl CopyWindowToVram
	movs r0, #2
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800ABF8: .4byte 0x082BFEB8
_0800ABFC: .4byte 0x082BF4D8
_0800AC00: .4byte 0x082BF980
_0800AC04: .4byte 0x082BF4B8
_0800AC08: .4byte 0x082BFF74
_0800AC0C: .4byte 0x082BFE50
_0800AC10: .4byte 0x082BFE62
	thumb_func_end sub_0800AB5C

	thumb_func_start sub_0800AC14
sub_0800AC14: @ 0x0800AC14
	push {lr}
	sub sp, #0xc
	ldr r1, _0800AC70
	movs r0, #0
	movs r2, #0x20
	movs r3, #0
	bl LoadBgTiles
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0800AC74
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0800AC78
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #3
	movs r2, #3
	movs r3, #0
	bl AddTextPrinterParameterized3
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #0
	bl CopyWindowToVram
	movs r0, #2
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0800AC70: .4byte 0x082BFEB8
_0800AC74: .4byte 0x082BFF74
_0800AC78: .4byte 0x082BFE00
	thumb_func_end sub_0800AC14

	thumb_func_start CB2_PrintErrorMessage
CB2_PrintErrorMessage: @ 0x0800AC7C
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0800AC9C
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _0800ACE8
	cmp r0, #0x1e
	bgt _0800ACA0
	cmp r0, #0
	beq _0800ACB4
	cmp r0, #2
	beq _0800ACCE
	b _0800AD3C
	.align 2, 0
_0800AC9C: .4byte 0x03002360
_0800ACA0:
	cmp r0, #0x5a
	beq _0800ACE8
	cmp r0, #0x5a
	bgt _0800ACAE
	cmp r0, #0x3c
	beq _0800ACE8
	b _0800AD3C
_0800ACAE:
	cmp r0, #0x82
	beq _0800ACF0
	b _0800AD3C
_0800ACB4:
	ldr r0, _0800ACC4
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0800ACC8
	bl sub_0800AB5C
	b _0800AD3C
	.align 2, 0
_0800ACC4: .4byte 0x020227B8
_0800ACC8:
	bl sub_0800AC14
	b _0800AD3C
_0800ACCE:
	movs r0, #0
	bl ShowBg
	ldr r0, _0800ACE4
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0800AD3C
	movs r0, #1
	bl ShowBg
	b _0800AD3C
	.align 2, 0
_0800ACE4: .4byte 0x020227B8
_0800ACE8:
	movs r0, #0x16
	bl PlaySE
	b _0800AD3C
_0800ACF0:
	ldr r0, _0800AD14
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800AD20
	ldr r0, _0800AD18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0800AD1C
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #3
	movs r2, #0x18
	movs r3, #0x12
	bl AddTextPrinterParameterized3
	b _0800AD3C
	.align 2, 0
_0800AD14: .4byte 0x0300319C
_0800AD18: .4byte 0x082BFF74
_0800AD1C: .4byte 0x082BFE9F
_0800AD20:
	cmp r0, #1
	bne _0800AD3C
	ldr r0, _0800AD70
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0800AD74
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #3
	movs r2, #0x18
	movs r3, #0x12
	bl AddTextPrinterParameterized3
_0800AD3C:
	ldr r0, _0800AD78
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r0, r2
	ldrb r1, [r1]
	cmp r1, #0xa0
	bne _0800ADAC
	ldr r4, _0800AD7C
	ldrb r2, [r4]
	cmp r2, #1
	bne _0800AD84
	ldrh r0, [r0, #0x2e]
	ands r2, r0
	cmp r2, #0
	beq _0800AD9E
	movs r0, #0x15
	bl PlaySE
	movs r0, #0
	strb r0, [r4]
	ldr r1, _0800AD80
	movs r0, #0
	strb r0, [r1, #6]
	bl sub_0816FEF0
	b _0800AD9E
	.align 2, 0
_0800AD70: .4byte 0x082BFF74
_0800AD74: .4byte 0x082BFE8D
_0800AD78: .4byte 0x03002360
_0800AD7C: .4byte 0x0300319C
_0800AD80: .4byte 0x020227B8
_0800AD84:
	cmp r2, #2
	bne _0800AD9E
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AD9E
	bl rfu_REQ_stopMode
	bl rfu_waitREQComplete
	bl DoSoftReset
_0800AD9E:
	ldr r0, _0800ADC0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r0, r2
	ldrb r1, [r1]
	cmp r1, #0xa0
	beq _0800ADB8
_0800ADAC:
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r0, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0800ADB8:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ADC0: .4byte 0x03002360
	thumb_func_end CB2_PrintErrorMessage

	thumb_func_start GetSioMultiSI
GetSioMultiSI: @ 0x0800ADC4
	ldr r0, _0800ADD0
	ldrh r0, [r0]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0800ADD0: .4byte 0x04000128
	thumb_func_end GetSioMultiSI

	thumb_func_start IsSioMultiMaster
IsSioMultiMaster: @ 0x0800ADD4
	push {lr}
	movs r3, #0
	ldr r2, _0800ADF8
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800ADF0
	ldrh r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800ADF0
	movs r3, #1
_0800ADF0:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800ADF8: .4byte 0x04000128
	thumb_func_end IsSioMultiMaster

	thumb_func_start IsLinkConnectionEstablished
IsLinkConnectionEstablished: @ 0x0800ADFC
	ldr r0, _0800AE08
	ldr r0, [r0]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0800AE08: .4byte 0x03003180
	thumb_func_end IsLinkConnectionEstablished

	thumb_func_start SetSuppressLinkErrorMessage
SetSuppressLinkErrorMessage: @ 0x0800AE0C
	ldr r1, _0800AE14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0800AE14: .4byte 0x03003198
	thumb_func_end SetSuppressLinkErrorMessage

	thumb_func_start HasLinkErrorOccurred
HasLinkErrorOccurred: @ 0x0800AE18
	ldr r0, _0800AE20
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800AE20: .4byte 0x0300310C
	thumb_func_end HasLinkErrorOccurred

	thumb_func_start sub_0800AE24
sub_0800AE24: @ 0x0800AE24
	push {r4, r5, r6, lr}
	bl InitLocalLinkPlayer
	ldr r1, _0800AE70
	adds r2, r1, #0
	adds r2, #0x10
	ldr r0, _0800AE74
	ldm r0!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r0!, {r3, r4, r6}
	stm r2!, {r3, r4, r6}
	ldr r0, [r0]
	str r0, [r2]
	ldr r3, _0800AE78
	adds r2, r1, #0
	adds r0, r3, #0
	ldm r0!, {r4, r5, r6}
	stm r2!, {r4, r5, r6}
	ldrh r4, [r0]
	strh r4, [r2]
	ldrb r0, [r0, #2]
	strb r0, [r2, #2]
	adds r0, r1, #0
	adds r0, #0x2c
	ldm r3!, {r2, r5, r6}
	stm r0!, {r2, r5, r6}
	ldrh r2, [r3]
	strh r2, [r0]
	ldrb r2, [r3, #2]
	strb r2, [r0, #2]
	ldr r0, _0800AE7C
	movs r2, #0x3c
	bl memcpy
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800AE70: .4byte 0x030030D0
_0800AE74: .4byte 0x02022684
_0800AE78: .4byte 0x082BFF24
_0800AE7C: .4byte 0x0202257C
	thumb_func_end sub_0800AE24

	thumb_func_start sub_0800AE80
sub_0800AE80: @ 0x0800AE80
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #8
	ldr r1, _0800AED0
	adds r4, r2, r1
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0800AED4
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x10
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r5, _0800AED8
	adds r0, r4, #0
	adds r1, r5, #0
	bl strcmp
	cmp r0, #0
	bne _0800AEC2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r5, #0
	bl strcmp
	cmp r0, #0
	beq _0800AEC8
_0800AEC2:
	ldr r0, _0800AEDC
	bl SetMainCallback2
_0800AEC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800AED0: .4byte 0x0202207C
_0800AED4: .4byte 0x020226A0
_0800AED8: .4byte 0x082BFF24
_0800AEDC: .4byte 0x0800AA0D
	thumb_func_end sub_0800AE80

	thumb_func_start HandleLinkConnection
HandleLinkConnection: @ 0x0800AEE0
	push {r4, r5, lr}
	ldr r0, _0800AF18
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800AF30
	ldr r0, _0800AF1C
	ldr r1, _0800AF20
	ldr r2, _0800AF24
	bl LinkMain1
	ldr r4, _0800AF28
	str r0, [r4]
	ldr r0, _0800AF2C
	bl LinkMain2
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AF54
	bl sub_08086FD0
	cmp r0, #1
	bne _0800AF54
_0800AF12:
	movs r0, #1
	b _0800AF56
	.align 2, 0
_0800AF18: .4byte 0x0300319C
_0800AF1C: .4byte 0x030031E4
_0800AF20: .4byte 0x030031B0
_0800AF24: .4byte 0x03003130
_0800AF28: .4byte 0x03003180
_0800AF2C: .4byte 0x0300238C
_0800AF30:
	bl sub_080109B0
	adds r4, r0, #0
	bl sub_08010A0C
	adds r5, r0, #0
	bl sub_08086FD0
	cmp r0, #1
	bne _0800AF54
	cmp r4, #1
	beq _0800AF12
	bl IsRfuRecvQueueEmpty
	cmp r0, #0
	bne _0800AF12
	cmp r5, #0
	bne _0800AF12
_0800AF54:
	movs r0, #0
_0800AF56:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end HandleLinkConnection

	thumb_func_start sub_0800AF5C
sub_0800AF5C: @ 0x0800AF5C
	push {lr}
	ldr r0, _0800AF70
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800AF6C
	ldr r1, _0800AF74
	movs r0, #1
	strb r0, [r1]
_0800AF6C:
	pop {r0}
	bx r0
	.align 2, 0
_0800AF70: .4byte 0x030031C4
_0800AF74: .4byte 0x0300319C
	thumb_func_end sub_0800AF5C

	thumb_func_start sub_0800AF78
sub_0800AF78: @ 0x0800AF78
	push {lr}
	ldr r0, _0800AF8C
	ldrb r1, [r0]
	cmp r1, #0
	bne _0800AF86
	ldr r0, _0800AF90
	strb r1, [r0]
_0800AF86:
	pop {r0}
	bx r0
	.align 2, 0
_0800AF8C: .4byte 0x030031C4
_0800AF90: .4byte 0x0300319C
	thumb_func_end sub_0800AF78

	thumb_func_start sub_0800AF94
sub_0800AF94: @ 0x0800AF94
	push {lr}
	ldr r0, _0800AFA8
	ldrb r1, [r0]
	cmp r1, #0
	bne _0800AFA2
	ldr r0, _0800AFAC
	strb r1, [r0]
_0800AFA2:
	pop {r0}
	bx r0
	.align 2, 0
_0800AFA8: .4byte 0x030031C4
_0800AFAC: .4byte 0x0300319C
	thumb_func_end sub_0800AF94

	thumb_func_start GetLinkRecvQueueLength
GetLinkRecvQueueLength: @ 0x0800AFB0
	push {lr}
	ldr r0, _0800AFC4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800AFD0
	ldr r0, _0800AFC8
	ldr r1, _0800AFCC
	adds r0, r0, r1
	ldrb r0, [r0]
	b _0800AFD4
	.align 2, 0
_0800AFC4: .4byte 0x0300319C
_0800AFC8: .4byte 0x03003210
_0800AFCC: .4byte 0x00000FBD
_0800AFD0:
	bl sub_08011FC0
_0800AFD4:
	pop {r1}
	bx r1
	thumb_func_end GetLinkRecvQueueLength

	thumb_func_start sub_0800AFD8
sub_0800AFD8: @ 0x0800AFD8
	push {lr}
	bl GetLinkRecvQueueLength
	cmp r0, #2
	bhi _0800AFE6
	movs r0, #0
	b _0800AFE8
_0800AFE6:
	movs r0, #1
_0800AFE8:
	pop {r1}
	bx r1
	thumb_func_end sub_0800AFD8

	thumb_func_start sub_0800AFEC
sub_0800AFEC: @ 0x0800AFEC
	ldr r0, _0800AFF4
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0800AFF4: .4byte 0x0300319C
	thumb_func_end sub_0800AFEC

	thumb_func_start DisableSerial
DisableSerial: @ 0x0800AFF8
	push {lr}
	sub sp, #4
	movs r0, #0xc0
	bl DisableInterrupts
	ldr r1, _0800B038
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0800B03C
	movs r2, #0
	strh r2, [r0]
	adds r1, #0xda
	movs r0, #0xc0
	strh r0, [r1]
	ldr r0, _0800B040
	strh r2, [r0]
	ldr r2, _0800B044
	movs r0, #0
	movs r1, #0
	str r0, [r2]
	str r1, [r2, #4]
	str r0, [sp]
	ldr r1, _0800B048
	ldr r2, _0800B04C
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0800B038: .4byte 0x04000128
_0800B03C: .4byte 0x0400010E
_0800B040: .4byte 0x0400012A
_0800B044: .4byte 0x04000120
_0800B048: .4byte 0x03003210
_0800B04C: .4byte 0x050003F0
	thumb_func_end DisableSerial

	thumb_func_start EnableSerial
EnableSerial: @ 0x0800B050
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #0xc0
	bl DisableInterrupts
	ldr r0, _0800B0B0
	movs r4, #0
	strh r4, [r0]
	ldr r2, _0800B0B4
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r3, _0800B0B8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x80
	bl EnableInterrupts
	ldr r0, _0800B0BC
	strh r4, [r0]
	movs r5, #0
	str r5, [sp]
	ldr r1, _0800B0C0
	ldr r2, _0800B0C4
	mov r0, sp
	bl CpuSet
	ldr r0, _0800B0C8
	strb r4, [r0]
	ldr r0, _0800B0CC
	strh r5, [r0]
	ldr r0, _0800B0D0
	strh r5, [r0]
	ldr r0, _0800B0D4
	strb r4, [r0]
	ldr r0, _0800B0D8
	strb r4, [r0]
	ldr r0, _0800B0DC
	strb r4, [r0]
	ldr r0, _0800B0E0
	strb r4, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B0B0: .4byte 0x04000134
_0800B0B4: .4byte 0x04000128
_0800B0B8: .4byte 0x00004003
_0800B0BC: .4byte 0x0400012A
_0800B0C0: .4byte 0x03003210
_0800B0C4: .4byte 0x050003F0
_0800B0C8: .4byte 0x03000D6C
_0800B0CC: .4byte 0x03000D6E
_0800B0D0: .4byte 0x03000D70
_0800B0D4: .4byte 0x03000D72
_0800B0D8: .4byte 0x03000D73
_0800B0DC: .4byte 0x03003200
_0800B0E0: .4byte 0x030041D0
	thumb_func_end EnableSerial

	thumb_func_start ResetSerial
ResetSerial: @ 0x0800B0E4
	push {lr}
	bl EnableSerial
	bl DisableSerial
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetSerial

	thumb_func_start LinkMain1
LinkMain1: @ 0x0800B0F4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0800B110
	ldrb r0, [r0, #1]
	cmp r0, #4
	bhi _0800B1A6
	lsls r0, r0, #2
	ldr r1, _0800B114
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B110: .4byte 0x03003210
_0800B114: .4byte 0x0800B118
_0800B118: @ jump table
	.4byte _0800B12C @ case 0
	.4byte _0800B13C @ case 1
	.4byte _0800B154 @ case 2
	.4byte _0800B190 @ case 3
	.4byte _0800B19A @ case 4
_0800B12C:
	bl DisableSerial
	ldr r1, _0800B138
	movs r0, #1
	strb r0, [r1, #1]
	b _0800B1A6
	.align 2, 0
_0800B138: .4byte 0x03003210
_0800B13C:
	ldrb r0, [r4]
	cmp r0, #1
	bne _0800B1A6
	bl EnableSerial
	ldr r1, _0800B150
	movs r0, #2
	strb r0, [r1, #1]
	b _0800B1A6
	.align 2, 0
_0800B150: .4byte 0x03003210
_0800B154:
	ldrb r1, [r4]
	cmp r1, #1
	beq _0800B164
	cmp r1, #2
	beq _0800B17C
	bl CheckMasterOrSlave
	b _0800B1A6
_0800B164:
	ldr r2, _0800B178
	ldrb r0, [r2]
	cmp r0, #8
	bne _0800B1A6
	ldrb r0, [r2, #3]
	cmp r0, #1
	bls _0800B1A6
	strb r1, [r2, #0xe]
	b _0800B1A6
	.align 2, 0
_0800B178: .4byte 0x03003210
_0800B17C:
	ldr r0, _0800B188
	movs r1, #0
	strb r1, [r0, #1]
	ldr r0, _0800B18C
	strh r1, [r0]
	b _0800B1A6
	.align 2, 0
_0800B188: .4byte 0x03003210
_0800B18C: .4byte 0x0400012A
_0800B190:
	bl InitTimer
	ldr r1, _0800B1E0
	movs r0, #4
	strb r0, [r1, #1]
_0800B19A:
	adds r0, r5, #0
	bl EnqueueSendCmd
	adds r0, r6, #0
	bl DequeueRecvCmds
_0800B1A6:
	movs r0, #0
	strb r0, [r4]
	ldr r1, _0800B1E0
	ldrb r2, [r1, #2]
	ldrb r0, [r1, #3]
	lsls r0, r0, #2
	orrs r2, r0
	ldrb r0, [r1]
	cmp r0, #8
	bne _0800B1BE
	movs r0, #0x20
	orrs r2, r0
_0800B1BE:
	ldrb r0, [r1, #0xc]
	lsls r3, r0, #8
	ldrb r0, [r1, #0xf]
	lsls r4, r0, #9
	ldrb r0, [r1, #0x10]
	lsls r5, r0, #0xc
	ldrb r0, [r1, #0x11]
	lsls r6, r0, #0xd
	ldrb r0, [r1, #0x12]
	lsls r7, r0, #0xe
	ldrb r0, [r1, #1]
	cmp r0, #4
	bne _0800B1E4
	movs r0, #0x40
	orrs r0, r3
	orrs r0, r2
	b _0800B1E8
	.align 2, 0
_0800B1E0: .4byte 0x03003210
_0800B1E4:
	adds r0, r2, #0
	orrs r0, r3
_0800B1E8:
	orrs r0, r4
	orrs r0, r5
	orrs r0, r6
	orrs r0, r7
	adds r2, r0, #0
	ldrb r3, [r1, #0x13]
	cmp r3, #1
	bne _0800B1FE
	movs r0, #0x80
	lsls r0, r0, #9
	orrs r2, r0
_0800B1FE:
	ldrb r0, [r1, #2]
	cmp r0, #3
	bls _0800B20A
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r2, r0
_0800B20A:
	adds r1, r2, #0
	cmp r3, #2
	bne _0800B216
	movs r0, #0x80
	lsls r0, r0, #0xb
	orrs r1, r0
_0800B216:
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end LinkMain1

	thumb_func_start CheckMasterOrSlave
CheckMasterOrSlave: @ 0x0800B220
	push {lr}
	ldr r0, _0800B23C
	ldr r1, [r0]
	movs r0, #0xc
	ands r1, r0
	ldr r2, _0800B240
	cmp r1, #8
	bne _0800B244
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0800B244
	strb r1, [r2]
	b _0800B248
	.align 2, 0
_0800B23C: .4byte 0x04000128
_0800B240: .4byte 0x03003210
_0800B244:
	movs r0, #0
	strb r0, [r2]
_0800B248:
	pop {r0}
	bx r0
	thumb_func_end CheckMasterOrSlave

	thumb_func_start InitTimer
InitTimer: @ 0x0800B24C
	push {lr}
	ldr r0, _0800B270
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800B26A
	ldr r1, _0800B274
	ldr r2, _0800B278
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x41
	strh r0, [r1]
	movs r0, #0x40
	bl EnableInterrupts
_0800B26A:
	pop {r0}
	bx r0
	.align 2, 0
_0800B270: .4byte 0x03003210
_0800B274: .4byte 0x0400010C
_0800B278: .4byte 0x0000FF3B
	thumb_func_end InitTimer

	thumb_func_start EnqueueSendCmd
EnqueueSendCmd: @ 0x0800B27C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	ldr r2, _0800B2F4
	ldr r1, _0800B2F8
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0800B2FC
	ldr r4, _0800B300
	adds r0, r1, r4
	ldrb r4, [r0]
	adds r6, r1, #0
	cmp r4, #0x31
	bhi _0800B30C
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x31
	bls _0800B2BA
	subs r0, #0x32
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0800B2BA:
	movs r2, #0
	ldr r4, _0800B304
	mov sb, r4
	ldr r1, _0800B308
	mov sl, r1
	lsls r5, r0, #1
	movs r0, #0x18
	adds r0, r0, r6
	mov r8, r0
	mov ip, r2
	movs r7, #0x64
_0800B2D0:
	ldrh r0, [r4]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r2, #0
	muls r0, r7, r0
	adds r0, r5, r0
	add r0, r8
	strh r1, [r0]
	mov r1, ip
	strh r1, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _0800B2D0
	b _0800B318
	.align 2, 0
_0800B2F4: .4byte 0x030041D4
_0800B2F8: .4byte 0x04000208
_0800B2FC: .4byte 0x03003210
_0800B300: .4byte 0x00000339
_0800B304: .4byte 0x03000D6E
_0800B308: .4byte 0x03003200
_0800B30C:
	movs r0, #1
	strb r0, [r6, #0x12]
	ldr r2, _0800B350
	mov sb, r2
	ldr r4, _0800B354
	mov sl, r4
_0800B318:
	mov r1, sb
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800B330
	ldr r2, _0800B358
	adds r0, r6, r2
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	mov r4, sb
	strh r2, [r4]
_0800B330:
	ldr r1, _0800B35C
	ldr r2, _0800B360
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r4, _0800B358
	adds r0, r6, r4
	ldrb r0, [r0]
	mov r1, sl
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B350: .4byte 0x03000D6E
_0800B354: .4byte 0x03003200
_0800B358: .4byte 0x00000339
_0800B35C: .4byte 0x04000208
_0800B360: .4byte 0x030041D4
	thumb_func_end EnqueueSendCmd

	thumb_func_start DequeueRecvCmds
DequeueRecvCmds: @ 0x0800B364
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	ldr r2, _0800B3C0
	ldr r1, _0800B3C4
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0800B3C8
	ldr r3, _0800B3CC
	adds r0, r1, r3
	ldrb r0, [r0]
	mov ip, r1
	cmp r0, #0
	bne _0800B3D0
	movs r3, #0
	ldrb r0, [r1, #3]
	cmp r3, r0
	bhs _0800B3B6
	movs r5, #0
	adds r6, r0, #0
_0800B396:
	movs r2, #0
	lsls r1, r3, #4
	adds r4, r3, #1
	add r1, sb
_0800B39E:
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r5, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _0800B39E
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r6
	blo _0800B396
_0800B3B6:
	movs r0, #1
	mov r7, ip
	strb r0, [r7, #0xc]
	b _0800B44C
	.align 2, 0
_0800B3C0: .4byte 0x030041D4
_0800B3C4: .4byte 0x04000208
_0800B3C8: .4byte 0x03003210
_0800B3CC: .4byte 0x00000FBD
_0800B3D0:
	movs r3, #0
	mov r0, ip
	ldrb r1, [r0, #3]
	cmp r3, r1
	bhs _0800B426
	ldr r0, _0800B464
	add r0, ip
	ldrb r0, [r0]
	lsls r6, r0, #1
	movs r2, #0xcf
	lsls r2, r2, #2
	add r2, ip
	mov r8, r2
	mov sl, r1
_0800B3EC:
	movs r2, #0
	lsls r1, r3, #4
	adds r4, r3, #1
	lsls r0, r3, #1
	mov r7, sb
	adds r5, r1, r7
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r3
	lsls r3, r0, #5
_0800B400:
	lsls r1, r2, #1
	adds r1, r1, r5
	movs r7, #0x64
	adds r0, r2, #0
	muls r0, r7, r0
	adds r0, r6, r0
	adds r0, r0, r3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _0800B400
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	cmp r3, sl
	blo _0800B3EC
_0800B426:
	mov r2, ip
	ldr r0, _0800B468
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, #1
	movs r3, #0
	strb r0, [r1]
	ldr r1, _0800B464
	adds r2, r2, r1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x31
	bls _0800B448
	strb r3, [r2]
_0800B448:
	mov r2, ip
	strb r3, [r2, #0xc]
_0800B44C:
	ldr r1, _0800B46C
	ldr r3, _0800B470
	ldrh r0, [r3]
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B464: .4byte 0x00000FBC
_0800B468: .4byte 0x00000FBD
_0800B46C: .4byte 0x04000208
_0800B470: .4byte 0x030041D4
	thumb_func_end DequeueRecvCmds

	thumb_func_start LinkVSync
LinkVSync: @ 0x0800B474
	push {r4, lr}
	ldr r3, _0800B49C
	ldrb r4, [r3]
	cmp r4, #0
	beq _0800B4B0
	ldrb r0, [r3, #1]
	cmp r0, #2
	beq _0800B4AA
	cmp r0, #4
	bne _0800B4DA
	movs r0, #0xd
	ldrsb r0, [r3, r0]
	cmp r0, #8
	bgt _0800B4A0
	ldrb r0, [r3, #0x10]
	cmp r0, #1
	beq _0800B4AA
	movs r0, #1
	strb r0, [r3, #0x13]
	b _0800B4DA
	.align 2, 0
_0800B49C: .4byte 0x03003210
_0800B4A0:
	ldrb r0, [r3, #0x13]
	cmp r0, #1
	beq _0800B4DA
	movs r0, #0
	strb r0, [r3, #0xd]
_0800B4AA:
	bl StartTransfer
	b _0800B4DA
_0800B4B0:
	ldrb r2, [r3, #1]
	cmp r2, #4
	beq _0800B4BA
	cmp r2, #2
	bne _0800B4DA
_0800B4BA:
	ldr r1, _0800B4E0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bls _0800B4DA
	cmp r2, #4
	bne _0800B4D2
	movs r0, #2
	strb r0, [r3, #0x13]
_0800B4D2:
	cmp r2, #2
	bne _0800B4DA
	strb r4, [r3, #3]
	strb r4, [r3, #0xf]
_0800B4DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B4E0: .4byte 0x03000D6C
	thumb_func_end LinkVSync

	thumb_func_start Timer3Intr
Timer3Intr: @ 0x0800B4E4
	push {lr}
	bl StopTimer
	bl StartTransfer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Timer3Intr

	thumb_func_start SerialCB
SerialCB: @ 0x0800B4F4
	push {r4, lr}
	ldr r4, _0800B520
	ldr r0, _0800B524
	ldr r1, [r0]
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	cmp r0, #2
	beq _0800B528
	cmp r0, #4
	bne _0800B546
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r4, #0x10]
	bl DoRecv
	bl DoSend
	bl SendRecvDone
	b _0800B546
	.align 2, 0
_0800B520: .4byte 0x03003210
_0800B524: .4byte 0x04000128
_0800B528:
	bl DoHandshake
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B546
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800B542
	movs r0, #3
	strb r0, [r4, #1]
	movs r0, #8
	strb r0, [r4, #0xd]
	b _0800B546
_0800B542:
	movs r0, #4
	strb r0, [r4, #1]
_0800B546:
	ldr r3, _0800B56C
	ldrb r0, [r3, #0xd]
	adds r0, #1
	movs r2, #0
	strb r0, [r3, #0xd]
	ldr r1, _0800B570
	strb r2, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #8
	bne _0800B566
	ldr r0, _0800B574
	ldr r2, _0800B578
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
_0800B566:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B56C: .4byte 0x03003210
_0800B570: .4byte 0x03000D6C
_0800B574: .4byte 0x030041D0
_0800B578: .4byte 0x00000FBD
	thumb_func_end SerialCB

	thumb_func_start StartTransfer
StartTransfer: @ 0x0800B57C
	ldr r0, _0800B588
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800B588: .4byte 0x04000128
	thumb_func_end StartTransfer

	thumb_func_start DoHandshake
DoHandshake: @ 0x0800B58C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r6, _0800B5A8
	ldr r0, _0800B5AC
	ldrb r1, [r0, #0xe]
	adds r7, r0, #0
	cmp r1, #1
	bne _0800B5B8
	ldr r1, _0800B5B0
	ldr r2, _0800B5B4
	b _0800B5BC
	.align 2, 0
_0800B5A8: .4byte 0x0000FFFF
_0800B5AC: .4byte 0x03003210
_0800B5B0: .4byte 0x0400012A
_0800B5B4: .4byte 0x00008FFF
_0800B5B8:
	ldr r1, _0800B610
	ldr r2, _0800B614
_0800B5BC:
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0800B618
	ldr r3, _0800B61C
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [r2]
	str r1, [r2, #4]
	movs r0, #0
	movs r1, #0
	str r0, [r3]
	str r1, [r3, #4]
	strb r0, [r2, #0xa]
	movs r4, #0
	ldr r0, _0800B620
	mov sb, r0
	mov r8, r2
	ldr r2, _0800B624
	ldr r1, _0800B628
	mov ip, r1
_0800B5E4:
	lsls r0, r4, #1
	add r0, r8
	ldrh r3, [r0]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r3
	ldr r1, _0800B614
	cmp r0, r1
	beq _0800B5FC
	adds r0, r3, #0
	cmp r0, r2
	bne _0800B62C
_0800B5FC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r3, #0
	cmp r6, r0
	bls _0800B634
	cmp r0, #0
	beq _0800B634
	adds r6, r3, #0
	b _0800B634
	.align 2, 0
_0800B610: .4byte 0x0400012A
_0800B614: .4byte 0x0000B9A0
_0800B618: .4byte 0x03003214
_0800B61C: .4byte 0x04000120
_0800B620: .4byte 0x03000D73
_0800B624: .4byte 0x00008FFF
_0800B628: .4byte 0x0000FFFF
_0800B62C:
	cmp r0, ip
	beq _0800B63E
	movs r5, #0
	b _0800B63E
_0800B634:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0800B5E4
_0800B63E:
	strb r5, [r7, #3]
	adds r0, r5, #0
	cmp r0, #1
	bls _0800B66E
	mov r2, sb
	ldrb r2, [r2]
	cmp r0, r2
	bne _0800B660
	ldrh r1, [r7, #4]
	ldr r0, _0800B65C
	cmp r1, r0
	bne _0800B660
	movs r0, #1
	b _0800B67A
	.align 2, 0
_0800B65C: .4byte 0x00008FFF
_0800B660:
	ldrb r0, [r7, #3]
	cmp r0, #1
	bls _0800B66E
	movs r0, #3
	ands r6, r0
	adds r0, r6, #1
	b _0800B670
_0800B66E:
	movs r0, #0
_0800B670:
	strb r0, [r7, #0xf]
	ldrb r0, [r7, #3]
	mov r1, sb
	strb r0, [r1]
	movs r0, #0
_0800B67A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DoHandshake

	thumb_func_start DoRecv
DoRecv: @ 0x0800B688
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _0800B6E0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0800B6E4
	ldrb r1, [r0, #0x16]
	adds r6, r0, #0
	cmp r1, #0
	bne _0800B6EC
	movs r4, #0
	ldr r7, _0800B6E8
	ldrb r0, [r6, #3]
	cmp r4, r0
	bhs _0800B6D6
	adds r5, r6, #0
	ldrh r1, [r6, #0x14]
	adds r3, r7, #0
	adds r2, r6, #0
_0800B6B6:
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _0800B6CA
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800B6CA
	movs r0, #1
	strb r0, [r5, #0x11]
_0800B6CA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r2, #3]
	cmp r4, r0
	blo _0800B6B6
_0800B6D6:
	movs r0, #0
	strh r0, [r6, #0x14]
	movs r0, #1
	strb r0, [r7]
	b _0800B78C
	.align 2, 0
_0800B6E0: .4byte 0x04000120
_0800B6E4: .4byte 0x03003210
_0800B6E8: .4byte 0x03000D72
_0800B6EC:
	ldr r2, _0800B75C
	adds r1, r6, r2
	adds r2, #1
	adds r0, r6, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	adds r0, r2, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x31
	bls _0800B708
	subs r0, #0x32
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0800B708:
	cmp r2, #0x31
	bhi _0800B764
	movs r4, #0
	ldrb r1, [r6, #3]
	cmp r4, r1
	bhs _0800B768
	adds r5, r6, #0
	ldr r7, _0800B760
	lsls r0, r0, #1
	mov ip, r0
	movs r2, #0xcf
	lsls r2, r2, #2
	adds r2, r2, r6
	mov r8, r2
_0800B724:
	lsls r1, r4, #1
	mov r2, sp
	adds r0, r2, r1
	ldrh r3, [r0]
	ldrh r2, [r5, #0x14]
	adds r0, r3, r2
	strh r0, [r5, #0x14]
	ldrh r0, [r7]
	orrs r0, r3
	strh r0, [r7]
	ldrb r2, [r5, #0x17]
	movs r0, #0x64
	muls r0, r2, r0
	add r0, ip
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r4
	lsls r1, r1, #5
	adds r0, r0, r1
	add r0, r8
	strh r3, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5, #3]
	cmp r4, r0
	blo _0800B724
	b _0800B768
	.align 2, 0
_0800B75C: .4byte 0x00000FBC
_0800B760: .4byte 0x03000D70
_0800B764:
	movs r0, #2
	strb r0, [r6, #0x12]
_0800B768:
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _0800B78C
	ldr r2, _0800B798
	ldrh r0, [r2]
	cmp r0, #0
	beq _0800B78C
	ldr r1, _0800B79C
	adds r0, r6, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r0, #0
	strh r0, [r2]
_0800B78C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B798: .4byte 0x03000D70
_0800B79C: .4byte 0x00000FBD
	thumb_func_end DoRecv

	thumb_func_start DoSend
DoSend: @ 0x0800B7A0
	push {r4, lr}
	ldr r0, _0800B7DC
	ldrb r1, [r0, #0x16]
	adds r4, r0, #0
	cmp r1, #8
	bne _0800B7F2
	ldr r1, _0800B7E0
	ldrh r0, [r4, #0x14]
	strh r0, [r1]
	ldr r1, _0800B7E4
	ldrb r2, [r1]
	cmp r2, #0
	bne _0800B7EC
	ldr r0, _0800B7E8
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r0, #0xce
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x31
	bls _0800B848
	strb r2, [r1]
	b _0800B848
	.align 2, 0
_0800B7DC: .4byte 0x03003210
_0800B7E0: .4byte 0x0400012A
_0800B7E4: .4byte 0x03000D6D
_0800B7E8: .4byte 0x00000339
_0800B7EC:
	movs r0, #0
	strb r0, [r1]
	b _0800B848
_0800B7F2:
	ldr r1, _0800B818
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800B80E
	ldr r2, _0800B81C
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800B808
	movs r0, #1
	strb r0, [r1]
_0800B808:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800B824
_0800B80E:
	ldr r1, _0800B820
	movs r0, #0
	strh r0, [r1]
	b _0800B842
	.align 2, 0
_0800B818: .4byte 0x03000D6D
_0800B81C: .4byte 0x00000339
_0800B820: .4byte 0x0400012A
_0800B824:
	ldr r3, _0800B850
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	ldrb r2, [r4, #0x16]
	movs r1, #0x64
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x18
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
_0800B842:
	ldrb r0, [r4, #0x16]
	adds r0, #1
	strb r0, [r4, #0x16]
_0800B848:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B850: .4byte 0x0400012A
	thumb_func_end DoSend

	thumb_func_start StopTimer
StopTimer: @ 0x0800B854
	push {lr}
	ldr r0, _0800B874
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800B870
	ldr r2, _0800B878
	ldrh r1, [r2]
	ldr r0, _0800B87C
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0800B880
	ldr r2, _0800B884
	adds r0, r2, #0
	strh r0, [r1]
_0800B870:
	pop {r0}
	bx r0
	.align 2, 0
_0800B874: .4byte 0x03003210
_0800B878: .4byte 0x0400010E
_0800B87C: .4byte 0x0000FF7F
_0800B880: .4byte 0x0400010C
_0800B884: .4byte 0x0000FF3B
	thumb_func_end StopTimer

	thumb_func_start SendRecvDone
SendRecvDone: @ 0x0800B888
	push {lr}
	ldr r1, _0800B89C
	ldrb r0, [r1, #0x17]
	cmp r0, #8
	bne _0800B8A0
	movs r0, #0
	strb r0, [r1, #0x16]
	strb r0, [r1, #0x17]
	b _0800B8B0
	.align 2, 0
_0800B89C: .4byte 0x03003210
_0800B8A0:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800B8B0
	ldr r0, _0800B8B4
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
_0800B8B0:
	pop {r0}
	bx r0
	.align 2, 0
_0800B8B4: .4byte 0x0400010E
	thumb_func_end SendRecvDone

	thumb_func_start ResetSendBuffer
ResetSendBuffer: @ 0x0800B8B8
	push {r4, r5, r6, lr}
	ldr r1, _0800B900
	ldr r2, _0800B904
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, #0
	movs r6, #0x64
	adds r5, r1, #0
	adds r5, #0x18
	ldr r4, _0800B908
_0800B8D6:
	movs r2, #0
	adds r1, r0, #1
	adds r3, r0, #0
	muls r3, r6, r3
_0800B8DE:
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r5
	strh r4, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x31
	bls _0800B8DE
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0800B8D6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B900: .4byte 0x03003210
_0800B904: .4byte 0x00000339
_0800B908: .4byte 0x0000EFFF
	thumb_func_end ResetSendBuffer

	thumb_func_start ResetRecvBuffer
ResetRecvBuffer: @ 0x0800B90C
	push {r4, r5, r6, r7, lr}
	ldr r1, _0800B96C
	ldr r2, _0800B970
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0800B974
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, #0x64
	mov ip, r0
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r7, r1, r3
	ldr r6, _0800B978
_0800B92A:
	movs r3, #0
	lsls r0, r2, #1
	adds r5, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r2
	lsls r4, r0, #5
_0800B938:
	movs r2, #0
	adds r1, r3, #1
	mov r0, ip
	muls r0, r3, r0
	adds r3, r0, #0
_0800B942:
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	adds r0, r0, r7
	strh r6, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x31
	bls _0800B942
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0800B938
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0800B92A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B96C: .4byte 0x03003210
_0800B970: .4byte 0x00000FBD
_0800B974: .4byte 0x00000FBC
_0800B978: .4byte 0x0000EFFF
	thumb_func_end ResetRecvBuffer

