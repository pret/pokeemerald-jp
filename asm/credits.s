.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081753CC
sub_081753CC: @ 0x081753CC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081753CC

	thumb_func_start sub_081753E0
sub_081753E0: @ 0x081753E0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	ldr r0, _08175434
	ldrh r1, [r0, #0x2c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08175426
	ldr r0, _08175438
	ldrb r0, [r0]
	cmp r0, #0
	beq _08175426
	ldr r2, _0817543C
	ldr r0, _08175440
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _08175444
	cmp r1, r0
	bne _08175426
	bl sub_081753CC
	bl RunTasks
	bl AnimateSprites
	ldr r1, _08175448
	movs r0, #1
	strb r0, [r1]
_08175426:
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_08175434: .4byte 0x03002360
_08175438: .4byte 0x0203B9B0
_0817543C: .4byte 0x03005B60
_08175440: .4byte 0x0203B9AE
_08175444: .4byte 0x0817567D
_08175448: .4byte 0x0203B9B1
	thumb_func_end sub_081753E0

	thumb_func_start sub_0817544C
sub_0817544C: @ 0x0817544C
	push {lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0817549C
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	movs r0, #0x80
	lsls r0, r0, #4
	bl AllocZeroed
	adds r1, r0, #0
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r0, _081754A0
	movs r1, #0x80
	movs r2, #0x40
	bl LoadPalette
	ldr r0, _081754A4
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #0
	bl ShowBg
	pop {r0}
	bx r0
	.align 2, 0
_0817549C: .4byte 0x085C7914
_081754A0: .4byte 0x085C67AC
_081754A4: .4byte 0x085C7918
	thumb_func_end sub_0817544C

	thumb_func_start sub_081754A8
sub_081754A8: @ 0x081754A8
	push {lr}
	bl FreeAllWindowBuffers
	movs r0, #0
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _081754BC
	bl Free
_081754BC:
	pop {r0}
	bx r0
	thumb_func_end sub_081754A8

	thumb_func_start sub_081754C0
sub_081754C0: @ 0x081754C0
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	add r1, sp, #0x14
	movs r0, #0
	strb r0, [r1]
	cmp r3, #1
	bne _081754E0
	movs r0, #3
	strb r0, [r1, #1]
	movs r0, #4
	b _081754E8
_081754E0:
	add r1, sp, #0x14
	movs r0, #1
	strb r0, [r1, #1]
	movs r0, #2
_081754E8:
	strb r0, [r1, #2]
	movs r1, #0
	ldrb r0, [r4]
	lsls r3, r2, #3
	cmp r0, #0xff
	beq _081754FE
_081754F4:
	adds r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _081754F4
_081754FE:
	lsls r0, r1, #3
	adds r0, r0, r1
	movs r2, #0xf0
	subs r2, r2, r0
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, #2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x14
	str r0, [sp, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r0, #0
	movs r1, #1
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081754C0

	thumb_func_start sub_0817553C
sub_0817553C: @ 0x0817553C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	bl sub_08175BF0
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, _08175620
	movs r1, #0xe0
	lsls r1, r1, #9
	bl InitHeap
	bl ResetPaletteFade
	bl ResetTasks
	bl sub_0817544C
	ldr r0, _08175624
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08175628
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x1e]
	movs r1, #1
	strh r1, [r0, #0x22]
_08175582:
	movs r0, #0
	adds r1, r7, #0
	bl sub_081768B8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08175582
	ldr r4, _08175628
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r6, #0
	movs r5, #0
	movs r1, #0x28
	strh r1, [r0, #8]
	ldr r1, _0817562C
	movs r0, #0x12
	bl SetGpuReg
	ldr r0, _08175630
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	strh r7, [r1, #0xa]
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _08175634
	bl SetVBlankCallback
	ldr r0, _08175638
	bl m4aSongNumStart
	ldr r0, _0817563C
	bl SetMainCallback2
	ldr r0, _08175640
	strb r6, [r0]
	ldr r4, _08175644
	movs r0, #0xe5
	lsls r0, r0, #2
	bl AllocZeroed
	str r0, [r4]
	bl sub_08177214
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x78
	strh r5, [r1]
	adds r0, #0x7a
	strh r5, [r0]
	ldr r0, _08175648
	strh r7, [r0]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08175620: .4byte 0x02000000
_08175624: .4byte 0x0817564D
_08175628: .4byte 0x03005B60
_0817562C: .4byte 0x0000FFFC
_08175630: .4byte 0x08175CAD
_08175634: .4byte 0x081753CD
_08175638: .4byte 0x000001C7
_0817563C: .4byte 0x081753E1
_08175640: .4byte 0x0203B9B1
_08175644: .4byte 0x0203B9B4
_08175648: .4byte 0x0203B9AE
	thumb_func_end sub_0817553C

	thumb_func_start sub_0817564C
sub_0817564C: @ 0x0817564C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08175670
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817566C
	ldr r0, _08175674
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08175678
	str r0, [r1]
_0817566C:
	pop {r0}
	bx r0
	.align 2, 0
_08175670: .4byte 0x02037C74
_08175674: .4byte 0x03005B60
_08175678: .4byte 0x0817567D
	thumb_func_end sub_0817564C

	thumb_func_start sub_0817567C
sub_0817567C: @ 0x0817567C
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081756B0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _081756B8
	movs r3, #0xa
	ldrsh r1, [r4, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x1e
	strh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x20]
	ldr r0, _081756B4
	b _08175702
	.align 2, 0
_081756B0: .4byte 0x03005B60
_081756B4: .4byte 0x081759A5
_081756B8:
	ldr r0, _081756E0
	strh r1, [r0]
	ldrh r2, [r4, #0x1e]
	movs r3, #0x1e
	ldrsh r0, [r4, r3]
	cmp r0, #1
	bne _081756E8
	strh r2, [r4, #0x22]
	strh r1, [r4, #0x1e]
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _081756E4
	b _08175702
	.align 2, 0
_081756E0: .4byte 0x0203B9AC
_081756E4: .4byte 0x08175711
_081756E8:
	cmp r0, #2
	bne _08175704
	strh r2, [r4, #0x22]
	strh r1, [r4, #0x1e]
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0817570C
_08175702:
	str r0, [r4]
_08175704:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817570C: .4byte 0x081757AD
	thumb_func_end sub_0817567C

	thumb_func_start sub_08175710
sub_08175710: @ 0x08175710
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08175744
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817573E
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl sub_08176AA8
	ldr r0, _08175748
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _0817574C
	str r0, [r1]
_0817573E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08175744: .4byte 0x02037C74
_08175748: .4byte 0x03005B60
_0817574C: .4byte 0x08175751
	thumb_func_end sub_08175710

	thumb_func_start c2_080C9BFC
c2_080C9BFC: @ 0x08175750
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	bl SetVBlankCallback
	ldr r1, _081757A0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrb r0, [r5, #0x16]
	adds r1, r4, #0
	bl sub_081768B8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08175798
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _081757A4
	bl SetVBlankCallback
	ldr r0, _081757A8
	str r0, [r5]
_08175798:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081757A0: .4byte 0x03005B60
_081757A4: .4byte 0x081753CD
_081757A8: .4byte 0x0817564D
	thumb_func_end c2_080C9BFC

	thumb_func_start sub_081757AC
sub_081757AC: @ 0x081757AC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081757E0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081757DA
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl sub_08176AA8
	ldr r0, _081757E4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081757E8
	str r0, [r1]
_081757DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081757E0: .4byte 0x02037C74
_081757E4: .4byte 0x03005B60
_081757E8: .4byte 0x081757ED
	thumb_func_end sub_081757AC

	thumb_func_start sub_081757EC
sub_081757EC: @ 0x081757EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _081758B8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r1, r1, r0
	mov r8, r1
	ldrb r7, [r1]
	cmp r7, #0
	beq _0817580E
	cmp r7, #1
	beq _081758F8
_0817580E:
	bl ResetSpriteData
	bl ResetAllPicSprites
	bl FreeAllSpritePalettes
	ldr r1, _081758BC
	movs r0, #8
	strb r0, [r1]
	ldr r0, _081758C0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _081758C4
	ldr r1, _081758C8
	bl LZ77UnCompVram
	ldr r0, _081758CC
	movs r1, #1
	movs r2, #0x3e
	bl LoadPalette
	movs r1, #0
	ldr r4, _081758D0
	movs r3, #0x11
	ldr r2, _081758D4
_08175844:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	bls _08175844
	movs r1, #0
	ldr r2, _081758D8
	ldr r6, _081758DC
	ldr r0, _081758E0
	adds r5, r2, r0
	movs r4, #0x22
	ldr r3, _081758D4
_08175860:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r3
	bls _08175860
	movs r1, #0
	ldr r5, _081758E4
	movs r4, #0x33
	ldr r3, _081758D4
_08175876:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r3
	bls _08175876
	movs r0, #0
	strh r0, [r2]
	ldr r1, _081758E8
	adds r0, r1, #0
	strh r0, [r2, #2]
	ldr r1, _081758EC
	adds r0, r1, #0
	strh r0, [r2, #4]
	ldr r1, _081758F0
	adds r0, r1, #0
	strh r0, [r2, #6]
	adds r0, r6, #0
	bl LoadSpriteSheet
	ldr r0, _081758F4
	bl LoadSpritePalette
	ldr r1, _081758B8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08175982
	.align 2, 0
_081758B8: .4byte 0x03002360
_081758BC: .4byte 0x030030BC
_081758C0: .4byte 0x0858FC14
_081758C4: .4byte 0x0858FA1C
_081758C8: .4byte 0x06003800
_081758CC: .4byte 0x0858F812
_081758D0: .4byte 0x0201C000
_081758D4: .4byte 0x000007FF
_081758D8: .4byte 0x0201D800
_081758DC: .4byte 0x085C79C8
_081758E0: .4byte 0xFFFFF000
_081758E4: .4byte 0x0201D000
_081758E8: .4byte 0x000053FF
_081758EC: .4byte 0x0000529F
_081758F0: .4byte 0x00007E94
_081758F4: .4byte 0x085C79D8
_081758F8:
	ldr r0, _08175990
	movs r1, #0
	bl CreateTask
	ldr r2, _08175994
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #3
	adds r4, r4, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	mov sb, r1
	movs r5, #0
	strh r0, [r4, #0xe]
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r7, [r0, #8]
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r6, [r0, #0xa]
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r4, #0x16]
	strh r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0x20
	bl SetGpuReg
	ldr r1, _08175998
	movs r0, #0xe
	bl SetGpuReg
	movs r1, #0xca
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	mov r0, sb
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0817599C
	strh r5, [r0]
	ldr r0, _081759A0
	str r0, [r4]
_08175982:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08175990: .4byte 0x08176025
_08175994: .4byte 0x03005B60
_08175998: .4byte 0x00000703
_0817599C: .4byte 0x0203B9F4
_081759A0: .4byte 0x0817564D
	thumb_func_end sub_081757EC

	thumb_func_start sub_081759A4
sub_081759A4: @ 0x081759A4
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081759C8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #0x20]
	movs r2, #0x20
	ldrsh r1, [r4, r2]
	cmp r1, #0
	beq _081759CC
	subs r0, #1
	strh r0, [r4, #0x20]
	b _081759E0
	.align 2, 0
_081759C8: .4byte 0x03005B60
_081759CC:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0xc
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _081759E8
	str r0, [r4]
_081759E0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081759E8: .4byte 0x081759ED
	thumb_func_end sub_081759A4

	thumb_func_start sub_081759EC
sub_081759EC: @ 0x081759EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08175A18
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08175A12
	adds r0, r4, #0
	bl sub_08176AA8
	ldr r0, _08175A1C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08175A20
	str r0, [r1]
_08175A12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08175A18: .4byte 0x02037C74
_08175A1C: .4byte 0x03005B60
_08175A20: .4byte 0x08175A25
	thumb_func_end sub_081759EC

	thumb_func_start sub_08175A24
sub_08175A24: @ 0x08175A24
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_08175BF0
	bl ResetPaletteFade
	movs r1, #0xe0
	lsls r1, r1, #6
	movs r0, #0
	movs r2, #0
	bl sub_08176B24
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r1, #8
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r1, #0xe0
	lsls r1, r1, #3
	movs r0, #8
	bl SetGpuReg
	movs r0, #1
	bl EnableInterrupts
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r0, #0
	bl SetGpuReg
	ldr r1, _08175A94
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x98
	lsls r1, r1, #1
	strh r1, [r0, #8]
	ldr r1, _08175A98
	str r1, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08175A94: .4byte 0x03005B60
_08175A98: .4byte 0x08175A9D
	thumb_func_end sub_08175A24

	thumb_func_start sub_08175A9C
sub_08175A9C: @ 0x08175A9C
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08175AC0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #8]
	movs r2, #8
	ldrsh r1, [r4, r2]
	cmp r1, #0
	beq _08175AC4
	subs r0, #1
	strh r0, [r4, #8]
	b _08175AD8
	.align 2, 0
_08175AC0: .4byte 0x03005B60
_08175AC4:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #6
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08175AE0
	str r0, [r4]
_08175AD8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08175AE0: .4byte 0x08175AE5
	thumb_func_end sub_08175A9C

	thumb_func_start sub_08175AE4
sub_08175AE4: @ 0x08175AE4
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08175B34
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08175B2A
	movs r0, #0xe0
	lsls r0, r0, #6
	movs r1, #0
	bl sub_08176CCC
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, _08175B38
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xe1
	lsls r1, r1, #5
	strh r1, [r0, #8]
	ldr r1, _08175B3C
	str r1, [r0]
_08175B2A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08175B34: .4byte 0x02037C74
_08175B38: .4byte 0x03005B60
_08175B3C: .4byte 0x08175B41
	thumb_func_end sub_08175AE4

	thumb_func_start sub_08175B40
sub_08175B40: @ 0x08175B40
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08175B8C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08175BC4
	ldr r1, _08175B90
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _08175B6E
	ldr r0, _08175B94
	ldrh r0, [r0, #0x2e]
	cmp r0, #0
	beq _08175BA0
_08175B6E:
	movs r0, #4
	bl FadeOutBGMTemporarily
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _08175B98
	str r1, [sp]
	movs r1, #8
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _08175B9C
	str r0, [r4]
	b _08175BC4
	.align 2, 0
_08175B8C: .4byte 0x02037C74
_08175B90: .4byte 0x03005B60
_08175B94: .4byte 0x03002360
_08175B98: .4byte 0x0000FFFF
_08175B9C: .4byte 0x08175BD5
_08175BA0:
	ldr r0, _08175BCC
	cmp r1, r0
	bne _08175BAC
	movs r0, #8
	bl FadeOutBGMTemporarily
_08175BAC:
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, _08175BD0
	cmp r1, r0
	bne _08175BBE
	movs r0, #0xe4
	lsls r0, r0, #1
	bl m4aSongNumStart
_08175BBE:
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
_08175BC4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08175BCC: .4byte 0x00001BE8
_08175BD0: .4byte 0x00001AB8
	thumb_func_end sub_08175B40

	thumb_func_start sub_08175BD4
sub_08175BD4: @ 0x08175BD4
	push {lr}
	ldr r0, _08175BEC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08175BE8
	movs r0, #0xff
	bl SoftReset
_08175BE8:
	pop {r0}
	bx r0
	.align 2, 0
_08175BEC: .4byte 0x02037C74
	thumb_func_end sub_08175BD4

	thumb_func_start sub_08175BF0
sub_08175BF0: @ 0x08175BF0
	push {lr}
	sub sp, #8
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
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
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08175C98
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08175C9C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0
	str r2, [sp, #4]
	add r0, sp, #4
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08175CA0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, sp
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _08175CA4
	str r0, [r1, #4]
	ldr r0, _08175CA8
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08175C98: .4byte 0x040000D4
_08175C9C: .4byte 0x8100C000
_08175CA0: .4byte 0x85000100
_08175CA4: .4byte 0x05000002
_08175CA8: .4byte 0x810001FF
	thumb_func_end sub_08175BF0

	thumb_func_start sub_08175CAC
sub_08175CAC: @ 0x08175CAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08175CD8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r5, r1, #0
	cmp r0, #0xa
	bhi _08175D0C
	lsls r0, r0, #2
	ldr r1, _08175CDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08175CD8: .4byte 0x03005B60
_08175CDC: .4byte 0x08175CE0
_08175CE0: @ jump table
	.4byte _08175D0C @ case 0
	.4byte _08175D3C @ case 1
	.4byte _08175D5C @ case 2
	.4byte _08175E16 @ case 3
	.4byte _08175E3C @ case 4
	.4byte _08175EA8 @ case 5
	.4byte _08175D0C @ case 6
	.4byte _08175D0C @ case 7
	.4byte _08175D0C @ case 8
	.4byte _08175D0C @ case 9
	.4byte _08175EDC @ case 10
_08175D0C:
	ldr r0, _08175D34
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08175D1E
	b _08175F0A
_08175D1E:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #1
	strh r1, [r0, #8]
	movs r1, #0x48
	strh r1, [r0, #0xe]
	ldr r0, _08175D38
	strh r2, [r0]
	b _08175F0A
	.align 2, 0
_08175D34: .4byte 0x02037C74
_08175D38: .4byte 0x0203B9AC
_08175D3C:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r1, r0, r5
	ldrh r2, [r1, #0xe]
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08175D54
	subs r0, r2, #1
	strh r0, [r1, #0xe]
	b _08175F0A
_08175D54:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _08175F0A
_08175D5C:
	lsls r2, r6, #2
	adds r0, r2, r6
	lsls r0, r0, #3
	adds r3, r0, r5
	movs r0, #0xa
	ldrsh r1, [r3, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r1, [r0]
	ldr r0, _08175DE8
	mov r8, r2
	cmp r1, r0
	beq _08175D7C
	b _08175F0A
_08175D7C:
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	cmp r0, #0x2c
	bgt _08175E10
	movs r4, #0
	ldr r7, _08175DEC
	adds r5, r3, #0
_08175D8A:
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r3, [r0]
	ldr r0, [r3, #4]
	ldrb r1, [r3]
	lsls r2, r4, #0x19
	lsrs r2, r2, #0x18
	ldrb r3, [r3, #1]
	bl sub_081754C0
	adds r4, #1
	cmp r4, #4
	ble _08175D8A
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	ldr r2, _08175DF0
	mov r3, r8
	adds r1, r3, r6
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	movs r0, #0xa
	ldrsh r1, [r1, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x22
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _08175DF8
	movs r0, #0xc0
	lsls r0, r0, #2
	ldr r1, _08175DF4
	b _08175DFE
	.align 2, 0
_08175DE8: .4byte 0x0817567D
_08175DEC: .4byte 0x085C7590
_08175DF0: .4byte 0x03005B60
_08175DF4: .4byte 0x0000328D
_08175DF8:
	movs r0, #0xc0
	lsls r0, r0, #2
	ldr r1, _08175E0C
_08175DFE:
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	b _08175F0A
	.align 2, 0
_08175E0C: .4byte 0x00001967
_08175E10:
	movs r0, #0xa
	strh r0, [r3, #8]
	b _08175F0A
_08175E16:
	ldr r0, _08175E38
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08175F0A
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0x9c
	strh r1, [r0, #0xe]
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _08175F0A
	.align 2, 0
_08175E38: .4byte 0x02037C74
_08175E3C:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r5
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08175E54
	subs r0, r1, #1
	strh r0, [r4, #0xe]
	b _08175F0A
_08175E54:
	ldrb r0, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	bl sub_08175F1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08175E6A
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08175F0A
_08175E6A:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r3, #0xa
	ldrsh r1, [r4, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0x22
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _08175E90
	movs r0, #0xc0
	lsls r0, r0, #2
	ldr r1, _08175E8C
	b _08175E96
	.align 2, 0
_08175E8C: .4byte 0x0000328D
_08175E90:
	movs r0, #0xc0
	lsls r0, r0, #2
	ldr r1, _08175EA4
_08175E96:
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _08175F0A
	.align 2, 0
_08175EA4: .4byte 0x00001967
_08175EA8:
	ldr r0, _08175ED4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08175F0A
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, _08175ED8
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	strh r0, [r1, #8]
	b _08175F0A
	.align 2, 0
_08175ED4: .4byte 0x02037C74
_08175ED8: .4byte 0x03005B60
_08175EDC:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r5, #0
	movs r1, #1
	strh r1, [r0, #0x10]
	adds r0, r6, #0
	bl DestroyTask
	bl sub_081754A8
	ldr r4, _08175F18
	ldr r0, [r4]
	bl Free
	str r5, [r4]
_08175F0A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08175F18: .4byte 0x0203B9B4
	thumb_func_end sub_08175CAC

	thumb_func_start sub_08175F1C
sub_08175F1C: @ 0x08175F1C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r5, _08176018
	cmp r4, #1
	bne _08175F44
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r3, #0xa
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0x14
	strh r1, [r0, #8]
_08175F44:
	lsls r3, r2, #2
	cmp r4, #5
	bne _08175F56
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r4, [r0, #0x16]
	movs r1, #2
	strh r1, [r0, #0x1e]
_08175F56:
	cmp r4, #9
	bne _08175F66
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #1
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x1e]
_08175F66:
	cmp r4, #0xe
	bne _08175F78
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #4
	strh r1, [r0, #0x16]
	movs r1, #2
	strh r1, [r0, #0x1e]
_08175F78:
	cmp r4, #0x14
	bne _08175F8A
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #2
	strh r1, [r0, #0x16]
	movs r1, #1
	strh r1, [r0, #0x1e]
_08175F8A:
	cmp r4, #0x16
	bne _08175FA4
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r6, #0xa
	ldrsh r1, [r0, r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #1
	strh r1, [r0, #8]
_08175FA4:
	cmp r4, #0x19
	bne _08175FB6
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #5
	strh r1, [r0, #0x16]
	movs r1, #2
	strh r1, [r0, #0x1e]
_08175FB6:
	cmp r4, #0x1e
	bne _08175FC8
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #3
	strh r1, [r0, #0x16]
	movs r1, #1
	strh r1, [r0, #0x1e]
_08175FC8:
	cmp r4, #0x23
	bne _08175FE2
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r6, #0xa
	ldrsh r1, [r0, r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0xa
	strh r1, [r0, #8]
_08175FE2:
	cmp r4, #0x25
	bne _08175FF4
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #3
	strh r1, [r0, #0x16]
	movs r1, #2
	strh r1, [r0, #0x1e]
_08175FF4:
	cmp r4, #0x2a
	bne _08176006
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #4
	strh r1, [r0, #0x16]
	movs r1, #1
	strh r1, [r0, #0x1e]
_08176006:
	adds r0, r3, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0x1e
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0817601C
	movs r0, #0
	b _0817601E
	.align 2, 0
_08176018: .4byte 0x03005B60
_0817601C:
	movs r0, #1
_0817601E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08175F1C

	thumb_func_start sub_08176024
sub_08176024: @ 0x08176024
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _08176050
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r2, r0, r4
	movs r1, #8
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _08176054
	cmp r0, #1
	bgt _08176046
	b _08176150
_08176046:
	cmp r0, #2
	beq _0817606C
	cmp r0, #3
	beq _0817613C
	b _08176150
	.align 2, 0
_08176050: .4byte 0x03005B60
_08176054:
	ldr r0, _08176068
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08176150
	ldrh r0, [r2, #8]
	adds r0, #1
	b _0817614E
	.align 2, 0
_08176068: .4byte 0x02037C74
_0817606C:
	ldr r3, _081760E8
	mov r8, r3
	ldr r3, [r3]
	adds r6, r3, #0
	adds r6, #0x78
	ldrh r0, [r6]
	cmp r0, #0x38
	beq _08176150
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, _081760EC
	cmp r1, r0
	bne _08176150
	adds r0, r3, #0
	adds r0, #0x7a
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r5, [r0]
	ldr r4, _081760F0
	ldrh r0, [r6]
	movs r1, #3
	bl __umodsi3
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r3, #1
	adds r1, r0, r4
	ldrb r1, [r1]
	adds r4, #1
	adds r0, r0, r4
	ldrb r2, [r0]
	adds r0, r5, #0
	bl sub_081770B0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x7a
	ldrh r3, [r1]
	adds r0, #0x7c
	ldrh r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _081760F8
	adds r0, r3, #1
	strh r0, [r1]
	ldr r1, _081760F4
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x40
	b _0817610A
	.align 2, 0
_081760E8: .4byte 0x0203B9B4
_081760EC: .4byte 0x0817567D
_081760F0: .4byte 0x085C7928
_081760F4: .4byte 0x020205AC
_081760F8:
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08176130
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
_0817610A:
	strh r1, [r0, #0x34]
	ldr r0, _08176134
	ldr r1, [r0]
	adds r1, #0x78
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _08176138
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x40
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _08176150
	.align 2, 0
_08176130: .4byte 0x020205AC
_08176134: .4byte 0x0203B9B4
_08176138: .4byte 0x03005B60
_0817613C:
	ldrh r1, [r2, #0xe]
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0817614C
	subs r0, r1, #1
	strh r0, [r2, #0xe]
	b _08176150
_0817614C:
	movs r0, #1
_0817614E:
	strh r0, [r2, #8]
_08176150:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08176024

	thumb_func_start sub_0817615C
sub_0817615C: @ 0x0817615C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08176184
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r6, r1, #0
	cmp r0, #0x32
	bls _08176178
	b _08176424
_08176178:
	lsls r0, r0, #2
	ldr r1, _08176188
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08176184: .4byte 0x03005B60
_08176188: .4byte 0x0817618C
_0817618C: @ jump table
	.4byte _08176258 @ case 0
	.4byte _0817627C @ case 1
	.4byte _081762D0 @ case 2
	.4byte _081762E8 @ case 3
	.4byte _08176324 @ case 4
	.4byte _08176348 @ case 5
	.4byte _08176394 @ case 6
	.4byte _08176424 @ case 7
	.4byte _08176424 @ case 8
	.4byte _08176424 @ case 9
	.4byte _081763A0 @ case 10
	.4byte _08176424 @ case 11
	.4byte _08176424 @ case 12
	.4byte _08176424 @ case 13
	.4byte _08176424 @ case 14
	.4byte _08176424 @ case 15
	.4byte _08176424 @ case 16
	.4byte _08176424 @ case 17
	.4byte _08176424 @ case 18
	.4byte _08176424 @ case 19
	.4byte _081763C0 @ case 20
	.4byte _08176424 @ case 21
	.4byte _08176424 @ case 22
	.4byte _08176424 @ case 23
	.4byte _08176424 @ case 24
	.4byte _08176424 @ case 25
	.4byte _08176424 @ case 26
	.4byte _08176424 @ case 27
	.4byte _08176424 @ case 28
	.4byte _08176424 @ case 29
	.4byte _081763E4 @ case 30
	.4byte _08176424 @ case 31
	.4byte _08176424 @ case 32
	.4byte _08176424 @ case 33
	.4byte _08176424 @ case 34
	.4byte _08176424 @ case 35
	.4byte _08176424 @ case 36
	.4byte _08176424 @ case 37
	.4byte _08176424 @ case 38
	.4byte _08176424 @ case 39
	.4byte _08176424 @ case 40
	.4byte _08176424 @ case 41
	.4byte _08176424 @ case 42
	.4byte _08176424 @ case 43
	.4byte _08176424 @ case 44
	.4byte _08176424 @ case 45
	.4byte _08176424 @ case 46
	.4byte _08176424 @ case 47
	.4byte _08176424 @ case 48
	.4byte _08176424 @ case 49
	.4byte _08176418 @ case 50
_08176258:
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r6
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0xc
	bl Sin
	ldr r1, _08176278
	strh r0, [r1]
	b _081762A0
	.align 2, 0
_08176278: .4byte 0x0203B9F2
_0817627C:
	ldr r7, _081762A8
	movs r3, #0
	ldrsh r4, [r7, r3]
	cmp r4, #0
	beq _081762AC
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r6
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0xc
	bl Sin
	strh r0, [r7]
_081762A0:
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	b _08176424
	.align 2, 0
_081762A8: .4byte 0x0203B9F2
_081762AC:
	ldr r3, _081762CC
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r6
	movs r0, #0xc
	ldrsh r2, [r1, r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #2
	strh r2, [r0, #0x2e]
	strh r4, [r1, #0x12]
	b _08176340
	.align 2, 0
_081762CC: .4byte 0x020205AC
_081762D0:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r6
	ldrh r2, [r1, #0x12]
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0x3f
	bgt _08176340
	adds r0, r2, #1
	strh r0, [r1, #0x12]
	b _0817635E
_081762E8:
	ldr r3, _08176320
	lsls r2, r5, #2
	adds r2, r2, r5
	lsls r2, r2, #3
	adds r2, r2, r6
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #3
	strh r1, [r0, #0x2e]
	movs r0, #0xe
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #1
	strh r1, [r0, #0x2e]
	movs r0, #0x78
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _08176424
	.align 2, 0
_08176320: .4byte 0x020205AC
_08176324:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r6
	ldrh r2, [r1, #0x10]
	movs r3, #0x10
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0817633C
	subs r0, r2, #1
	strh r0, [r1, #0x10]
	b _08176424
_0817633C:
	movs r0, #0x40
	strh r0, [r1, #0x12]
_08176340:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _08176424
_08176348:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r6
	ldrh r1, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08176374
	subs r0, r1, #1
	strh r0, [r4, #0x12]
_0817635E:
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x14
	bl Sin
	ldr r1, _08176370
	strh r0, [r1]
	b _08176424
	.align 2, 0
_08176370: .4byte 0x0203B9F2
_08176374:
	ldr r2, _08176390
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #0x2e]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08176424
	.align 2, 0
_08176390: .4byte 0x020205AC
_08176394:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r1, #0x32
	b _08176422
_081763A0:
	ldr r3, _081763BC
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r6
	movs r0, #0xe
	ldrsh r2, [r1, r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #2
	b _081763D8
	.align 2, 0
_081763BC: .4byte 0x020205AC
_081763C0:
	ldr r3, _081763E0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r6
	movs r0, #0xc
	ldrsh r2, [r1, r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #4
_081763D8:
	strh r2, [r0, #0x2e]
	movs r0, #0x32
	strh r0, [r1, #8]
	b _08176424
	.align 2, 0
_081763E0: .4byte 0x020205AC
_081763E4:
	ldr r3, _08176414
	lsls r2, r5, #2
	adds r2, r2, r5
	lsls r2, r2, #3
	adds r2, r2, r6
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #5
	strh r1, [r0, #0x2e]
	movs r0, #0xe
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #3
	strh r1, [r0, #0x2e]
	movs r0, #0x32
	strh r0, [r2, #8]
	b _08176424
	.align 2, 0
_08176414: .4byte 0x020205AC
_08176418:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r1, #0
_08176422:
	strh r1, [r0, #8]
_08176424:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0817615C

	thumb_func_start sub_0817642C
sub_0817642C: @ 0x0817642C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08176450
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #4
	bhi _0817646C
	lsls r0, r0, #2
	ldr r1, _08176454
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08176450: .4byte 0x03005B60
_08176454: .4byte 0x08176458
_08176458: @ jump table
	.4byte _0817646C @ case 0
	.4byte _0817646C @ case 1
	.4byte _08176474 @ case 2
	.4byte _08176474 @ case 3
	.4byte _0817647C @ case 4
_0817646C:
	movs r0, #0
	bl sub_0817B400
	b _08176482
_08176474:
	movs r0, #1
	bl sub_0817B400
	b _08176482
_0817647C:
	movs r0, #2
	bl sub_0817B400
_08176482:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0817642C

	thumb_func_start sub_08176488
sub_08176488: @ 0x08176488
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	cmp r0, #4
	bls _0817649E
	b _0817681C
_0817649E:
	lsls r0, r0, #2
	ldr r1, _081764A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081764A8: .4byte 0x081764AC
_081764AC: @ jump table
	.4byte _081764C0 @ case 0
	.4byte _08176568 @ case 1
	.4byte _08176614 @ case 2
	.4byte _081766C0 @ case 3
	.4byte _08176770 @ case 4
_081764C0:
	ldr r5, _08176560
	ldr r0, _08176564
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r3, #0
	movs r2, #0x88
	lsls r2, r2, #1
	strh r2, [r0, #0x20]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x20]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0x2e
	strh r2, [r0, #0x22]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x22]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	movs r2, #0x20
	b _08176810
	.align 2, 0
_08176560: .4byte 0x020205AC
_08176564: .4byte 0x03005B60
_08176568:
	ldr r5, _0817660C
	ldr r0, _08176610
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r3, #0
	movs r1, #0x78
	strh r1, [r0, #0x20]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x88
	lsls r1, r1, #1
	strh r1, [r0, #0x20]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0x2e
	strh r2, [r0, #0x22]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x22]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	movs r2, #0x20
	b _08176810
	.align 2, 0
_0817660C: .4byte 0x020205AC
_08176610: .4byte 0x03005B60
_08176614:
	ldr r5, _081766B8
	ldr r0, _081766BC
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r3, #0
	movs r1, #0x78
	strh r1, [r0, #0x20]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x88
	lsls r1, r1, #1
	strh r1, [r0, #0x20]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0x2e
	strh r2, [r0, #0x22]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x22]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r2, #0x80
	lsls r2, r2, #2
	movs r0, #1
	b _08176810
	.align 2, 0
_081766B8: .4byte 0x020205AC
_081766BC: .4byte 0x03005B60
_081766C0:
	ldr r5, _08176764
	ldr r0, _08176768
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r3, #0
	movs r1, #0x78
	strh r1, [r0, #0x20]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0817676C
	strh r1, [r0, #0x20]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0x2e
	strh r2, [r0, #0x22]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x22]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r2, #0x80
	lsls r2, r2, #2
	movs r0, #1
	b _08176810
	.align 2, 0
_08176764: .4byte 0x020205AC
_08176768: .4byte 0x03005B60
_0817676C: .4byte 0x0000FFE0
_08176770:
	ldr r5, _081768A8
	ldr r0, _081768AC
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r3, #0
	movs r1, #0x58
	strh r1, [r0, #0x20]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x98
	strh r1, [r0, #0x20]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0x2e
	strh r2, [r0, #0x22]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x22]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r3, [r0, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r2, #0x80
	lsls r2, r2, #2
	movs r0, #2
_08176810:
	movs r3, #8
	bl CreateBicycleAnimationTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #8]
_0817681C:
	ldr r0, _081768B0
	movs r1, #0
	bl CreateTask
	ldr r5, _081768AC
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	strh r0, [r4, #0xc]
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #8]
	ldr r0, _081768B4
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xa]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r6, [r0, #8]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r7, [r0, #0xa]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0xc]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0xe]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r6, [r0, #0x10]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081768A8: .4byte 0x020205AC
_081768AC: .4byte 0x03005B60
_081768B0: .4byte 0x0817642D
_081768B4: .4byte 0x0817615D
	thumb_func_end sub_08176488

	thumb_func_start sub_081768B8
sub_081768B8: @ 0x081768B8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _08176934
	movs r1, #0x87
	lsls r1, r1, #3
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r0, #1
	beq _08176938
	cmp r0, #1
	ble _081768DE
	cmp r0, #2
	beq _0817695C
	cmp r0, #3
	bne _081768DE
	b _08176A88
_081768DE:
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #8
	bl SetGpuReg
	movs r0, #0x1e
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
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, #1
	strb r0, [r6]
	b _08176A9E
	.align 2, 0
_08176934: .4byte 0x03002360
_08176938:
	ldr r1, _08176954
	movs r0, #0x22
	strh r0, [r1]
	ldr r1, _08176958
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_0817B088
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _08176A9E
	.align 2, 0
_08176954: .4byte 0x0203B9F0
_08176958: .4byte 0x0203B9F2
_0817695C:
	ldr r0, _081769BC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _081769E0
	ldr r0, _081769C0
	bl LoadCompressedSpriteSheet
	ldr r0, _081769C4
	bl LoadCompressedSpriteSheet
	ldr r0, _081769C8
	bl LoadCompressedSpriteSheet
	ldr r0, _081769CC
	bl LoadSpritePalettes
	movs r0, #0x78
	movs r1, #0x2e
	bl intro_create_brendan_sprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081769D0
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	strh r2, [r4, #0x12]
	ldr r6, _081769D4
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r5, r6, #0
	adds r5, #0x1c
	adds r2, r0, r5
	ldr r1, _081769D8
	str r1, [r2]
	adds r6, #8
	adds r0, r0, r6
	ldr r1, _081769DC
	str r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #1
	movs r1, #0x2e
	bl intro_create_may_sprite
	b _08176A34
	.align 2, 0
_081769BC: .4byte 0x03005AF0
_081769C0: .4byte 0x085D2804
_081769C4: .4byte 0x085D288C
_081769C8: .4byte 0x085D2824
_081769CC: .4byte 0x085D2854
_081769D0: .4byte 0x03005B60
_081769D4: .4byte 0x020205AC
_081769D8: .4byte 0x08176D75
_081769DC: .4byte 0x085C797C
_081769E0:
	ldr r0, _08176A5C
	bl LoadCompressedSpriteSheet
	ldr r0, _08176A60
	bl LoadCompressedSpriteSheet
	ldr r0, _08176A64
	bl LoadCompressedSpriteSheet
	ldr r0, _08176A68
	bl LoadSpritePalettes
	movs r0, #0x78
	movs r1, #0x2e
	bl intro_create_may_sprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08176A6C
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	strh r2, [r4, #0x12]
	ldr r6, _08176A70
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r5, r6, #0
	adds r5, #0x1c
	adds r2, r0, r5
	ldr r1, _08176A74
	str r1, [r2]
	adds r6, #8
	adds r0, r0, r6
	ldr r1, _08176A78
	str r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #1
	movs r1, #0x2e
	bl intro_create_brendan_sprite
_08176A34:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	strh r2, [r4, #0x14]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r5, r0, r5
	ldr r1, _08176A7C
	str r1, [r5]
	adds r0, r0, r6
	ldr r1, _08176A80
	str r1, [r0]
	ldr r1, _08176A84
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08176A9E
	.align 2, 0
_08176A5C: .4byte 0x085D2814
_08176A60: .4byte 0x085D287C
_08176A64: .4byte 0x085D2824
_08176A68: .4byte 0x085D2854
_08176A6C: .4byte 0x03005B60
_08176A70: .4byte 0x020205AC
_08176A74: .4byte 0x08176D75
_08176A78: .4byte 0x085C797C
_08176A7C: .4byte 0x08176E1D
_08176A80: .4byte 0x085C79BC
_08176A84: .4byte 0x03002360
_08176A88:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08176488
	adds r0, r4, #0
	bl sub_0817B268
	movs r0, #0
	strb r0, [r6]
	movs r0, #1
	b _08176AA0
_08176A9E:
	movs r0, #0
_08176AA0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081768B8

	thumb_func_start sub_08176AA8
sub_08176AA8: @ 0x08176AA8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08176B1C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08176ACE
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	strh r0, [r4, #8]
_08176ACE:
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08176AE4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	strh r0, [r4, #0xa]
_08176AE4:
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08176AFA
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	strh r0, [r4, #0xc]
_08176AFA:
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08176B10
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	strh r0, [r4, #0xe]
_08176B10:
	ldr r1, _08176B20
	movs r0, #1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08176B1C: .4byte 0x03005B60
_08176B20: .4byte 0x0203B9F4
	thumb_func_end sub_08176AA8

	thumb_func_start sub_08176B24
sub_08176B24: @ 0x08176B24
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	ldr r0, _08176BE8
	movs r6, #0xc0
	lsls r6, r6, #0x13
	adds r3, r3, r6
	adds r1, r3, #0
	bl LZ77UnCompVram
	ldr r0, _08176BEC
	adds r1, r5, #0
	movs r2, #0x20
	bl LoadPalette
	lsrs r4, r4, #0x14
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x10
	movs r2, #0
	adds r1, r4, #1
	ldr r3, _08176BF0
_08176B5A:
	lsls r0, r2, #1
	adds r0, r0, r7
	adds r0, r0, r6
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _08176B5A
	movs r2, #0
	adds r0, r4, #2
	adds r6, r4, #0
	adds r6, #0x17
	movs r1, #0x2b
	adds r1, r1, r4
	mov ip, r1
	adds r4, #0x41
	ldr r5, _08176BF4
	adds r3, r0, #0
_08176B80:
	lsls r0, r2, #1
	adds r0, r0, r7
	adds r0, r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x14
	bls _08176B80
	movs r2, #0
	ldr r5, _08176BF8
	adds r3, r6, #0
_08176B9A:
	lsls r0, r2, #1
	adds r0, r0, r7
	adds r0, r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bls _08176B9A
	movs r2, #0
	ldr r5, _08176BFC
	mov r3, ip
_08176BB4:
	lsls r0, r2, #1
	adds r0, r0, r7
	adds r0, r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x15
	bls _08176BB4
	movs r2, #0
	ldr r3, _08176C00
_08176BCC:
	lsls r0, r2, #1
	adds r0, r0, r7
	adds r0, r0, r3
	adds r1, r2, r4
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xb
	bls _08176BCC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08176BE8: .4byte 0x085C682C
_08176BEC: .4byte 0x085C0C74
_08176BF0: .4byte 0x000003FF
_08176BF4: .4byte 0x060001C8
_08176BF8: .4byte 0x06000248
_08176BFC: .4byte 0x060002C8
_08176C00: .4byte 0x06000348
	thumb_func_end sub_08176B24

	thumb_func_start sub_08176C04
sub_08176C04: @ 0x08176C04
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r2, #0
	movs r0, #0x3f
	ands r0, r2
	adds r1, r0, #0
	adds r1, #0x50
	cmp r2, #0xff
	bne _08176C1C
	movs r0, #1
	b _08176C42
_08176C1C:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08176C2C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r1, r0
_08176C2C:
	movs r0, #0x40
	ands r3, r0
	cmp r3, #0
	beq _08176C40
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
_08176C40:
	adds r0, r1, #0
_08176C42:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08176C04

	thumb_func_start sub_08176C48
sub_08176C48: @ 0x08176C48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r5, #0
_08176C76:
	movs r4, #0
	lsls r7, r5, #1
	ldr r1, [sp, #4]
	adds r0, r1, r5
	adds r2, r5, #1
	mov r8, r2
	lsls r0, r0, #6
	ldr r1, [sp, #8]
	adds r6, r0, r1
_08176C88:
	adds r0, r7, r5
	adds r0, r0, r4
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl sub_08176C04
	mov r2, sl
	adds r1, r2, r4
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	add r0, sb
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08176C88
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08176C76
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08176C48

	thumb_func_start sub_08176CCC
sub_08176CCC: @ 0x08176CCC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsrs r1, r1, #0x14
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x10
	movs r2, #0
	ldr r7, _08176D5C
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, #1
	ldr r3, _08176D60
_08176CEA:
	lsls r0, r2, #1
	adds r0, r0, r5
	adds r0, r0, r4
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _08176CEA
	str r6, [sp]
	adds r0, r7, #0
	movs r1, #3
	movs r2, #7
	adds r3, r5, #0
	bl sub_08176C48
	ldr r0, _08176D64
	str r6, [sp]
	movs r1, #7
	movs r2, #7
	adds r3, r5, #0
	bl sub_08176C48
	ldr r4, _08176D68
	str r6, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #7
	adds r3, r5, #0
	bl sub_08176C48
	str r6, [sp]
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #7
	adds r3, r5, #0
	bl sub_08176C48
	ldr r0, _08176D6C
	str r6, [sp]
	movs r1, #0x14
	movs r2, #7
	adds r3, r5, #0
	bl sub_08176C48
	ldr r0, _08176D70
	str r6, [sp]
	movs r1, #0x18
	movs r2, #7
	adds r3, r5, #0
	bl sub_08176C48
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08176D5C: .4byte 0x085C6C68
_08176D60: .4byte 0x000003FF
_08176D64: .4byte 0x085C6C77
_08176D68: .4byte 0x085C6C86
_08176D6C: .4byte 0x085C6C95
_08176D70: .4byte 0x085C6CA4
	thumb_func_end sub_08176CCC

	thumb_func_start sub_08176D74
sub_08176D74: @ 0x08176D74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08176D8C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08176D90
	adds r0, r4, #0
	bl DestroySprite
	b _08176E14
	.align 2, 0
_08176D8C: .4byte 0x0203B9F4
_08176D90:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #5
	bhi _08176E14
	lsls r0, r0, #2
	ldr r1, _08176DA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08176DA4: .4byte 0x08176DA8
_08176DA8: @ jump table
	.4byte _08176DC0 @ case 0
	.4byte _08176DCA @ case 1
	.4byte _08176DD0 @ case 2
	.4byte _08176DDA @ case 3
	.4byte _08176DE4 @ case 4
	.4byte _08176DFA @ case 5
_08176DC0:
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	b _08176E14
_08176DCA:
	adds r0, r4, #0
	movs r1, #1
	b _08176DFE
_08176DD0:
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnimIfDifferent
	b _08176E14
_08176DDA:
	adds r0, r4, #0
	movs r1, #3
	bl StartSpriteAnimIfDifferent
	b _08176E14
_08176DE4:
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	ldrh r1, [r4, #0x20]
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #0x78
	ble _08176E14
	subs r0, r1, #1
	b _08176E12
_08176DFA:
	adds r0, r4, #0
	movs r1, #0
_08176DFE:
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, #0x20]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08176E14
	subs r0, r2, #1
_08176E12:
	strh r0, [r4, #0x20]
_08176E14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08176D74

	thumb_func_start sub_08176E1C
sub_08176E1C: @ 0x08176E1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08176E34
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08176E38
	adds r0, r4, #0
	bl DestroySprite
	b _08176ED4
	.align 2, 0
_08176E34: .4byte 0x0203B9F4
_08176E38:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08176E60
	cmp r0, #1
	bgt _08176E4A
	cmp r0, #0
	beq _08176E54
	b _08176ED4
_08176E4A:
	cmp r0, #2
	beq _08176E9C
	cmp r0, #3
	beq _08176EBA
	b _08176ED4
_08176E54:
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	b _08176ED4
_08176E60:
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	cmp r0, #0xc8
	ble _08176E72
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnimIfDifferent
	b _08176E7A
_08176E72:
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAnimIfDifferent
_08176E7A:
	ldrh r2, [r4, #0x20]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08176E8C
	subs r0, r2, #2
	strh r0, [r4, #0x20]
_08176E8C:
	ldr r0, _08176E98
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	b _08176ED4
	.align 2, 0
_08176E98: .4byte 0x0203B9F2
_08176E9C:
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	ldrh r1, [r4, #0x3c]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08176ED4
	ldrh r0, [r4, #0x20]
	adds r0, #1
	b _08176ED2
_08176EBA:
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, #0x20]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08176ED4
	subs r0, r2, #1
_08176ED2:
	strh r0, [r4, #0x20]
_08176ED4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08176E1C

	thumb_func_start sub_08176EDC
sub_08176EDC: @ 0x08176EDC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08176EF4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08176EF8
	ldrh r0, [r5, #0x3a]
	bl FreeAndDestroyMonPicSprite
	b _081770A8
	.align 2, 0
_08176EF4: .4byte 0x0203B9F4
_08176EF8:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0xa
	bhi _08176F40
	lsls r0, r0, #2
	ldr r1, _08176F10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08176F10: .4byte 0x08176F14
_08176F14: @ jump table
	.4byte _08176F40 @ case 0
	.4byte _08176F9A @ case 1
	.4byte _0817701C @ case 2
	.4byte _08177052 @ case 3
	.4byte _08176F40 @ case 4
	.4byte _08176F40 @ case 5
	.4byte _08176F40 @ case 6
	.4byte _08176F40 @ case 7
	.4byte _08176F40 @ case 8
	.4byte _0817708A @ case 9
	.4byte _08177092 @ case 10
_08176F40:
	ldrb r1, [r5, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #1]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #3]
	movs r0, #0x10
	strh r0, [r5, #0x32]
	ldrh r4, [r5, #0x30]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x80
	lsls r0, r0, #9
	movs r1, #0x10
	bl __divsi3
	adds r1, r0, #0
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r5, #0x2e]
	b _081770A8
_08176F9A:
	ldrh r1, [r5, #0x32]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	cmp r0, #0xff
	bgt _08176FD0
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r5, #0x32]
	ldrh r4, [r5, #0x30]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	b _08176FD6
_08176FD0:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_08176FD6:
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	cmp r1, #2
	beq _081770A8
	cmp r1, #2
	bgt _08176FE8
	cmp r1, #1
	beq _08176FEE
	b _081770A8
_08176FE8:
	cmp r1, #3
	beq _08177006
	b _081770A8
_08176FEE:
	ldrh r1, [r5, #0x3c]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08176FFE
	ldrh r0, [r5, #0x22]
	adds r0, #1
	strh r0, [r5, #0x22]
_08176FFE:
	ldrh r0, [r5, #0x20]
	subs r0, #2
	strh r0, [r5, #0x20]
	b _081770A8
_08177006:
	ldrh r0, [r5, #0x3c]
	ands r1, r0
	cmp r1, #0
	bne _08177014
	ldrh r0, [r5, #0x22]
	adds r0, #1
	strh r0, [r5, #0x22]
_08177014:
	ldrh r0, [r5, #0x20]
	adds r0, #2
	strh r0, [r5, #0x20]
	b _081770A8
_0817701C:
	ldrh r1, [r5, #0x34]
	movs r2, #0x34
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0817702C
	subs r0, r1, #1
	strh r0, [r5, #0x34]
	b _081770A8
_0817702C:
	movs r1, #0xf4
	lsls r1, r1, #4
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	ldrb r1, [r5, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #1]
	movs r0, #0x10
	strh r0, [r5, #0x34]
	b _0817708A
_08177052:
	ldrh r1, [r5, #0x34]
	movs r2, #0x34
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _08177078
	subs r1, #1
	strh r1, [r5, #0x34]
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	b _081770A8
_08177078:
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #9
	strh r0, [r5, #0x2e]
	b _081770A8
_0817708A:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _081770A8
_08177092:
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	ldrh r0, [r5, #0x3a]
	bl FreeAndDestroyMonPicSprite
_081770A8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08176EDC

	thumb_func_start sub_081770B0
sub_081770B0: @ 0x081770B0
	push {r4, r5, r6, r7, lr}
	adds r5, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r3, r5, #0
	bl CreateMonSpriteFromNationalDexNumber
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _08177138
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r2, r1, r6
	ldrb r3, [r2, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	movs r3, #4
	orrs r0, r3
	strb r0, [r2, #5]
	adds r0, r5, #1
	strh r0, [r2, #0x30]
	movs r0, #0x3e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	orrs r0, r3
	mov r3, ip
	strb r0, [r3]
	adds r0, r6, #0
	adds r0, #0x1c
	adds r1, r1, r0
	ldr r0, _0817713C
	str r0, [r1]
	strh r4, [r2, #0x3a]
	ldr r0, _08177140
	movs r7, #0x20
	ldrsh r1, [r2, r7]
	movs r3, #0x22
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl CreateSprite
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r4, [r0, #0x2e]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r1, r5, #0
	bl StartSpriteAnimIfDifferent
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08177138: .4byte 0x020205AC
_0817713C: .4byte 0x08176EDD
_08177140: .4byte 0x085C7A14
	thumb_func_end sub_081770B0

	thumb_func_start sub_08177144
sub_08177144: @ 0x08177144
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08177170
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r0, #0xa
	beq _08177168
	ldr r0, _08177174
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _08177178
_08177168:
	adds r0, r3, #0
	bl DestroySprite
	b _0817720C
	.align 2, 0
_08177170: .4byte 0x020205AC
_08177174: .4byte 0x0203B9F4
_08177178:
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	movs r1, #0x3e
	adds r1, r1, r3
	mov ip, r1
	movs r1, #4
	ands r1, r0
	mov r0, ip
	ldrb r2, [r0]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0x2e
	ldrsh r1, [r3, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	movs r0, #0xc
	ands r0, r1
	ldrb r2, [r3, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #1]
	movs r0, #0x2e
	ldrsh r2, [r3, r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r2, #4
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #1]
	movs r2, #0x2e
	ldrsh r1, [r3, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #3]
	movs r1, #0x3e
	ands r1, r0
	ldrb r2, [r3, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x20]
	strh r0, [r3, #0x20]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x22]
	strh r0, [r3, #0x22]
_0817720C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08177144

	thumb_func_start sub_08177214
sub_08177214: @ 0x08177214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _081772AC
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetStarterPokemon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	movs r4, #1
	movs r6, #0
	ldr r5, _081772B0
_08177240:
	adds r0, r4, #0
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08177260
	ldr r0, _081772B4
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x7e
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08177260:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	bls _08177240
	adds r4, r6, #0
	ldr r0, _081772B0
	ldr r1, _081772B4
	mov r8, r1
	lsls r7, r4, #0x10
	cmp r4, r0
	bhi _08177292
	mov r5, r8
	movs r3, #0
	adds r2, r0, #0
_0817727E:
	ldr r0, [r5]
	lsls r1, r4, #1
	adds r0, #0x7e
	adds r0, r0, r1
	strh r3, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r2
	bls _0817727E
_08177292:
	mov r2, r8
	ldr r1, [r2]
	ldr r2, _081772B8
	adds r0, r1, r2
	strh r6, [r0]
	lsrs r0, r7, #0x10
	cmp r0, #0x37
	bhi _081772BC
	adds r0, r1, #0
	adds r0, #0x7c
	strh r6, [r0]
	b _081772C2
	.align 2, 0
_081772AC: .4byte 0x00004023
_081772B0: .4byte 0x00000181
_081772B4: .4byte 0x0203B9B4
_081772B8: .4byte 0x00000382
_081772BC:
	adds r1, #0x7c
	movs r0, #0x38
	strh r0, [r1]
_081772C2:
	movs r6, #0
	ldr r0, _081772D0
	mov sb, r0
	ldr r1, _081772D4
	mov r8, r1
	movs r7, #0
	b _081772DC
	.align 2, 0
_081772D0: .4byte 0x0203B9B4
_081772D4: .4byte 0x00000382
_081772D8:
	cmp r6, #0x37
	bhi _08177338
_081772DC:
	bl Random
	mov r2, sb
	ldr r4, [r2]
	mov r1, r8
	adds r5, r4, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5]
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r6, #1
	adds r1, r4, r1
	lsls r0, r3, #1
	adds r4, #0x7e
	adds r2, r4, r0
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	strh r7, [r2]
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r3, r0
	beq _0817732C
	ldrh r0, [r5]
	lsls r0, r0, #1
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r5]
	lsls r0, r0, #1
	adds r0, r4, r0
	strh r7, [r0]
_0817732C:
	mov r2, sb
	ldr r0, [r2]
	add r0, r8
	ldrh r0, [r0]
	cmp r0, #0
	bne _081772D8
_08177338:
	ldr r1, _08177380
	ldr r2, [r1]
	adds r3, r2, #0
	adds r3, #0x7c
	ldrh r0, [r3]
	mov r8, r1
	cmp r0, #0x37
	bhi _08177384
	adds r6, r0, #0
	movs r3, #0
	cmp r6, #0x37
	bhi _0817737A
	mov r4, r8
_08177352:
	ldr r2, [r4]
	lsls r1, r6, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r2, #0x7c
	ldrh r2, [r2]
	cmp r3, r2
	bne _08177370
	movs r3, #0
_08177370:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x37
	bls _08177352
_0817737A:
	mov r1, r8
	ldr r0, [r1]
	b _081773C4
	.align 2, 0
_08177380: .4byte 0x0203B9B4
_08177384:
	movs r4, #0
	ldrh r0, [r2]
	cmp r0, sl
	beq _081773A2
	adds r1, r2, #0
_0817738E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, sl
	beq _081773A2
	cmp r4, #0x37
	bls _0817738E
_081773A2:
	mov r0, r8
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x7c
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _081773C2
	lsls r0, r4, #1
	adds r0, r2, r0
	adds r2, #0x6e
	ldrh r1, [r2]
	strh r1, [r0]
	mov r1, sl
	strh r1, [r2]
	b _081773CA
_081773C2:
	adds r0, r2, #0
_081773C4:
	adds r0, #0x6e
	mov r2, sl
	strh r2, [r0]
_081773CA:
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x7c
	movs r1, #0x38
	strh r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08177214

