.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetUpFieldMove_Flash
SetUpFieldMove_Flash: @ 0x0813716C
	push {r4, lr}
	bl ShouldDoBrailleRegisteelEffect
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081371A4
	ldr r4, _08137190
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldr r1, _08137194
	ldr r0, _08137198
	str r0, [r1]
	ldr r1, _0813719C
	ldr r0, _081371A0
	b _081371C2
	.align 2, 0
_08137190: .4byte 0x02037290
_08137194: .4byte 0x03005B10
_08137198: .4byte 0x081B53D9
_0813719C: .4byte 0x0203CBB8
_081371A0: .4byte 0x081797D1
_081371A4:
	ldr r0, _081371C8
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	bne _081371E0
	ldr r0, _081371CC
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081371E0
	ldr r1, _081371D0
	ldr r0, _081371D4
	str r0, [r1]
	ldr r1, _081371D8
	ldr r0, _081371DC
_081371C2:
	str r0, [r1]
	movs r0, #1
	b _081371E2
	.align 2, 0
_081371C8: .4byte 0x02036FB8
_081371CC: .4byte 0x00000888
_081371D0: .4byte 0x03005B10
_081371D4: .4byte 0x081B53D9
_081371D8: .4byte 0x0203CBB8
_081371DC: .4byte 0x081371E9
_081371E0:
	movs r0, #0
_081371E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Flash

	thumb_func_start hm2_flash
hm2_flash: @ 0x081371E8
	push {r4, lr}
	bl oei_task_add
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetCursorSelectionMonId
	ldr r1, _08137218
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r1]
	ldr r1, _0813721C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, _08137220
	lsrs r1, r2, #0x10
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08137218: .4byte 0x020388A8
_0813721C: .4byte 0x03005B60
_08137220: .4byte 0x08137225
	thumb_func_end hm2_flash

	thumb_func_start sub_08137224
sub_08137224: @ 0x08137224
	push {lr}
	movs r0, #0xcf
	bl PlaySE
	ldr r0, _0813723C
	bl FlagSet
	ldr r0, _08137240
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0813723C: .4byte 0x00000888
_08137240: .4byte 0x08257EE2
	thumb_func_end sub_08137224

	thumb_func_start sub_08137244
sub_08137244: @ 0x08137244
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08137244

	thumb_func_start sub_0813725C
sub_0813725C: @ 0x0813725C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0813725C

	thumb_func_start c2_change_map
c2_change_map: @ 0x08137270
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0813734C
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08137350
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	str r4, [sp, #4]
	add r0, sp, #4
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08137354
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, sp
	strh r4, [r0]
	str r0, [r1]
	ldr r0, _08137358
	str r0, [r1, #4]
	ldr r0, _0813735C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl ResetPaletteFade
	bl ResetTasks
	bl ResetSpriteData
	ldr r3, _08137360
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08137364
	ldrh r0, [r4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _08137368
	bl SetVBlankCallback
	ldr r0, _0813736C
	bl SetMainCallback2
	bl sub_08137374
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08137342
	ldr r0, _08137370
	ldr r0, [r0, #8]
	bl SetMainCallback2
_08137342:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813734C: .4byte 0x040000D4
_08137350: .4byte 0x8100C000
_08137354: .4byte 0x85000100
_08137358: .4byte 0x05000002
_0813735C: .4byte 0x810001FF
_08137360: .4byte 0x04000208
_08137364: .4byte 0x04000200
_08137368: .4byte 0x0813725D
_0813736C: .4byte 0x08137245
_08137370: .4byte 0x03002360
	thumb_func_end c2_change_map

	thumb_func_start sub_08137374
sub_08137374: @ 0x08137374
	push {r4, r5, r6, r7, lr}
	bl GetLastUsedWarpMapType
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	bl GetCurrentMapType
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r3, #0
	ldr r4, _081373B4
	ldrb r0, [r4]
	cmp r0, #0
	beq _081373C8
	adds r7, r4, #0
	adds r0, r4, #4
	mov ip, r0
_08137396:
	lsls r2, r3, #3
	adds r1, r2, r7
	ldrb r0, [r1]
	cmp r0, r6
	bne _081373B8
	ldrb r0, [r1, #1]
	cmp r0, r5
	bne _081373B8
	mov r1, ip
	adds r0, r2, r1
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, #1
	b _081373CA
	.align 2, 0
_081373B4: .4byte 0x08592214
_081373B8:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #3
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08137396
_081373C8:
	movs r0, #0
_081373CA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08137374

	thumb_func_start GetMapPairFadeToType
GetMapPairFadeToType: @ 0x081373D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r0, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	ldr r1, _081373FC
	ldrb r0, [r1]
	cmp r0, #0
	beq _08137410
	adds r6, r1, #0
_081373E6:
	lsls r0, r3, #3
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _08137400
	ldrb r0, [r2, #1]
	cmp r0, r4
	bne _08137400
	ldrb r0, [r2, #2]
	b _08137412
	.align 2, 0
_081373FC: .4byte 0x08592214
_08137400:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081373E6
_08137410:
	movs r0, #0
_08137412:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetMapPairFadeToType

	thumb_func_start GetMapPairFadeFromType
GetMapPairFadeFromType: @ 0x08137418
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r0, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	ldr r1, _08137444
	ldrb r0, [r1]
	cmp r0, #0
	beq _08137458
	adds r6, r1, #0
_0813742E:
	lsls r0, r3, #3
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _08137448
	ldrb r0, [r2, #1]
	cmp r0, r4
	bne _08137448
	ldrb r0, [r2, #3]
	b _0813745A
	.align 2, 0
_08137444: .4byte 0x08592214
_08137448:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0813742E
_08137458:
	movs r0, #0
_0813745A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetMapPairFadeFromType

	thumb_func_start sub_08137460
sub_08137460: @ 0x08137460
	push {lr}
	ldr r0, _08137470
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08137470: .4byte 0x08137475
	thumb_func_end sub_08137460

	thumb_func_start sub_08137474
sub_08137474: @ 0x08137474
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08137488
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _0813748C
	str r0, [r1]
	bx lr
	.align 2, 0
_08137488: .4byte 0x03005B60
_0813748C: .4byte 0x08137491
	thumb_func_end sub_08137474

	thumb_func_start sub_08137490
sub_08137490: @ 0x08137490
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	ldr r0, _0813750C
	ldr r1, _08137510
	bl LZ77UnCompVram
	ldr r0, _08137514
	ldr r1, _08137518
	bl LZ77UnCompVram
	ldr r0, _0813751C
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _08137520
	movs r1, #0xe0
	movs r2, #0x10
	bl LoadPalette
	ldr r1, _08137524
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r1, _08137528
	movs r0, #8
	bl SetGpuReg
	movs r1, #0x8a
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r1, _0813752C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08137530
	str r1, [r0]
	movs r2, #0
	movs r1, #0x10
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813750C: .4byte 0x085924DC
_08137510: .4byte 0x0600C000
_08137514: .4byte 0x085922FC
_08137518: .4byte 0x0600F800
_0813751C: .4byte 0x0859229C
_08137520: .4byte 0x085922EC
_08137524: .4byte 0x00003E41
_08137528: .4byte 0x00001F0C
_0813752C: .4byte 0x03005B60
_08137530: .4byte 0x08137535
	thumb_func_end sub_08137490

	thumb_func_start sub_08137534
sub_08137534: @ 0x08137534
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08137564
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r2
	ldrh r4, [r5, #0xa]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r4, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	cmp r4, #0x10
	bhi _08137568
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	b _08137570
	.align 2, 0
_08137564: .4byte 0x03005B60
_08137568:
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r0, _08137578
	str r0, [r5]
_08137570:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08137578: .4byte 0x0813757D
	thumb_func_end sub_08137534

	thumb_func_start sub_0813757C
sub_0813757C: @ 0x0813757C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _081375B8
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, _081375BC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4, #0xc]
	cmp r1, #7
	bhi _081375C4
	adds r0, r1, #1
	strh r0, [r4, #0xc]
	lsls r1, r1, #1
	ldr r0, _081375C0
	adds r0, r1, r0
	movs r2, #0x10
	subs r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0xe0
	bl LoadPalette
	b _081375D6
	.align 2, 0
_081375B8: .4byte 0x00001010
_081375BC: .4byte 0x03005B60
_081375C0: .4byte 0x085922EC
_081375C4:
	ldr r0, _081375DC
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _081375E0
	str r0, [r4]
	movs r0, #8
	strh r0, [r4, #0xc]
_081375D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081375DC: .4byte 0x0859229C
_081375E0: .4byte 0x081375E5
	thumb_func_end sub_0813757C

	thumb_func_start sub_081375E4
sub_081375E4: @ 0x081375E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08137604
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08137608
	subs r0, r2, #1
	strh r0, [r1, #0xc]
	b _08137610
	.align 2, 0
_08137604: .4byte 0x03005B60
_08137608:
	ldr r0, _08137614
	ldr r0, [r0, #8]
	bl SetMainCallback2
_08137610:
	pop {r0}
	bx r0
	.align 2, 0
_08137614: .4byte 0x03002360
	thumb_func_end sub_081375E4

	thumb_func_start sub_08137618
sub_08137618: @ 0x08137618
	push {lr}
	ldr r0, _08137628
	movs r1, #0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08137628: .4byte 0x0813762D
	thumb_func_end sub_08137618

	thumb_func_start sub_0813762C
sub_0813762C: @ 0x0813762C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08137640
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _08137644
	str r0, [r1]
	bx lr
	.align 2, 0
_08137640: .4byte 0x03005B60
_08137644: .4byte 0x08137649
	thumb_func_end sub_0813762C

	thumb_func_start sub_08137648
sub_08137648: @ 0x08137648
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	ldr r0, _081376C4
	ldr r1, _081376C8
	bl LZ77UnCompVram
	ldr r0, _081376CC
	ldr r1, _081376D0
	bl LZ77UnCompVram
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	ldr r1, _081376D4
	movs r0, #8
	bl SetGpuReg
	movs r1, #0x8a
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _081376D8
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _081376DC
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _081376E0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081376E4
	str r1, [r0]
	movs r2, #0
	movs r1, #0x10
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081376C4: .4byte 0x085924DC
_081376C8: .4byte 0x0600C000
_081376CC: .4byte 0x085922FC
_081376D0: .4byte 0x0600F800
_081376D4: .4byte 0x00001F0C
_081376D8: .4byte 0x0859229C
_081376DC: .4byte 0x085922BC
_081376E0: .4byte 0x03005B60
_081376E4: .4byte 0x081376E9
	thumb_func_end sub_08137648

	thumb_func_start sub_081376E8
sub_081376E8: @ 0x081376E8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0813771C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r1, [r4, #0xc]
	cmp r1, #0xf
	bhi _08137724
	adds r2, r1, #1
	adds r0, r2, #1
	strh r0, [r4, #0xc]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08137720
	adds r0, r0, r1
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x10
	movs r1, #0xe0
	bl LoadPalette
	b _08137738
	.align 2, 0
_0813771C: .4byte 0x03005B60
_08137720: .4byte 0x085922DC
_08137724:
	ldr r1, _08137740
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, _08137744
	movs r0, #0x50
	bl SetGpuReg
	ldr r0, _08137748
	str r0, [r4]
_08137738:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08137740: .4byte 0x00001010
_08137744: .4byte 0x00003E41
_08137748: .4byte 0x0813774D
	thumb_func_end sub_081376E8

	thumb_func_start sub_0813774C
sub_0813774C: @ 0x0813774C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08137780
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r2
	ldrh r0, [r5, #0xa]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x15
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	cmp r4, #0
	beq _08137784
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	b _08137796
	.align 2, 0
_08137780: .4byte 0x03005B60
_08137784:
	ldr r0, _0813779C
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _081377A0
	ldr r0, [r0, #8]
	bl SetMainCallback2
_08137796:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813779C: .4byte 0x085922BC
_081377A0: .4byte 0x03002360
	thumb_func_end sub_0813774C

