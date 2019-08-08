.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DoRayquazaScene
DoRayquazaScene: @ 0x081D605C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _081D609C
	ldr r0, _081D60A0
	bl AllocZeroed
	str r0, [r6]
	ldr r1, _081D60A4
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, [r6]
	mov r1, r8
	str r1, [r0]
	ldr r1, _081D60A8
	adds r0, r0, r1
	strb r5, [r0]
	ldr r0, _081D60AC
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D609C: .4byte 0x0203CC2C
_081D60A0: .4byte 0x00002018
_081D60A4: .4byte 0x00002006
_081D60A8: .4byte 0x00002007
_081D60AC: .4byte 0x081D60B1
	thumb_func_end DoRayquazaScene

	thumb_func_start CB2_InitRayquazaScene
CB2_InitRayquazaScene: @ 0x081D60B0
	push {lr}
	bl SetVBlankHBlankCallbacksToNull
	bl clear_scheduled_bg_copies_to_vram
	bl ScanlineEffect_Stop
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	movs r0, #0
	movs r1, #0xf0
	movs r2, #0x20
	bl FillPalette
	ldr r1, _081D60FC
	ldr r0, _081D6100
	ldr r0, [r0]
	ldr r2, _081D6104
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl CreateTask
	ldr r0, _081D6108
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081D60FC: .4byte 0x085FB99C
_081D6100: .4byte 0x0203CC2C
_081D6104: .4byte 0x00002006
_081D6108: .4byte 0x081D610D
	thumb_func_end CB2_InitRayquazaScene

	thumb_func_start CB2_RayquazaScene
CB2_RayquazaScene: @ 0x081D610C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl do_scheduled_bg_tilemap_copies_to_vram
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_RayquazaScene

	thumb_func_start VBlankCB_RayquazaScene
VBlankCB_RayquazaScene: @ 0x081D6128
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_RayquazaScene

	thumb_func_start Task_EndAfterFadeScreen
Task_EndAfterFadeScreen: @ 0x081D613C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081D6174
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081D616C
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r4, _081D6178
	ldr r0, [r4]
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, [r4]
	bl Free
	adds r0, r5, #0
	bl DestroyTask
_081D616C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D6174: .4byte 0x02037C74
_081D6178: .4byte 0x0203CC2C
	thumb_func_end Task_EndAfterFadeScreen

	thumb_func_start Task_SetNextAnim
Task_SetNextAnim: @ 0x081D617C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r6, r3, #0
	ldr r0, _081D61B0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _081D61EE
	ldr r2, _081D61B4
	ldr r1, [r2]
	ldr r4, _081D61B8
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _081D61C4
	ldr r0, _081D61BC
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081D61C0
	b _081D61EC
	.align 2, 0
_081D61B0: .4byte 0x02037C74
_081D61B4: .4byte 0x0203CC2C
_081D61B8: .4byte 0x00002007
_081D61BC: .4byte 0x03005B60
_081D61C0: .4byte 0x081D613D
_081D61C4:
	ldr r4, _081D61F4
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, [r2]
	ldr r1, _081D61F8
	adds r0, r2, r1
	strh r5, [r0]
	ldr r0, _081D61FC
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r3, _081D6200
	adds r2, r2, r4
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
_081D61EC:
	str r0, [r1]
_081D61EE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D61F4: .4byte 0x00002006
_081D61F8: .4byte 0x00002004
_081D61FC: .4byte 0x03005B60
_081D6200: .4byte 0x085FB99C
	thumb_func_end Task_SetNextAnim

	thumb_func_start sub_081D6204
sub_081D6204: @ 0x081D6204
	push {lr}
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	ldr r1, _081D6234
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, _081D6238
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081D623C
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_081D6234: .4byte 0x00001888
_081D6238: .4byte 0x020373B4
_081D623C: .4byte 0x020377B4
	thumb_func_end sub_081D6204

	thumb_func_start sub_081D6240
sub_081D6240: @ 0x081D6240
	push {lr}
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x3f
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D6240

	thumb_func_start Task_HandleDuoFightPre
Task_HandleDuoFightPre: @ 0x081D6258
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081D6288
	adds r5, r0, r1
	bl sub_081D6E48
	ldr r0, _081D628C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081D62BA
	movs r0, #0
	ldrsh r1, [r5, r0]
	cmp r1, #0x40
	bne _081D6290
	bl sub_081D6D74
	b _081D62B4
	.align 2, 0
_081D6288: .4byte 0x03005B68
_081D628C: .4byte 0x02037C74
_081D6290:
	cmp r1, #0x90
	bne _081D629A
	bl sub_081D6DBC
	b _081D62B4
_081D629A:
	cmp r1, #0x94
	beq _081D62B0
	movs r0, #0xa4
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D62B4
	adds r0, r4, #0
	movs r1, #0
	bl DuoFightEnd
	b _081D62BA
_081D62B0:
	bl sub_081D6E04
_081D62B4:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_081D62BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_HandleDuoFightPre

	thumb_func_start sub_081D62C0
sub_081D62C0: @ 0x081D62C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _081D6348
	mov r8, r0
	movs r1, #0x58
	movs r2, #0x48
	movs r3, #3
	bl CreateSprite
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _081D634C
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _081D6350
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x2e
	adds r4, r4, r0
	mov r0, r8
	movs r1, #0x38
	movs r2, #0x68
	movs r3, #3
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldr r0, _081D6354
	movs r1, #0x4b
	movs r2, #0x65
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #2]
	ldr r0, _081D6358
	movs r1, #0x6d
	movs r2, #0x72
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081D6348: .4byte 0x085FBA28
_081D634C: .4byte 0x020205AC
_081D6350: .4byte 0x081D635D
_081D6354: .4byte 0x085FBA4C
_081D6358: .4byte 0x085FBA70
	thumb_func_end sub_081D62C0

	thumb_func_start sub_081D635C
sub_081D635C: @ 0x081D635C
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrh r0, [r0, #0xa]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0xa]
	cmp r0, #0
	bne _081D63C0
	ldrh r1, [r3, #0x20]
	movs r2, #0x20
	ldrsh r0, [r3, r2]
	cmp r0, #0x48
	beq _081D63C0
	subs r0, r1, #1
	strh r0, [r3, #0x20]
	ldr r2, _081D63D4
	movs r4, #0x2e
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	mov r0, ip
	movs r4, #2
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	mov r0, ip
	movs r4, #4
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
_081D63C0:
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r3, [r0]
	cmp r3, #1
	beq _081D6420
	cmp r3, #1
	bgt _081D63D8
	cmp r3, #0
	beq _081D63E2
	b _081D64A4
	.align 2, 0
_081D63D4: .4byte 0x020205AC
_081D63D8:
	cmp r3, #2
	beq _081D6460
	cmp r3, #3
	beq _081D6420
	b _081D64A4
_081D63E2:
	ldr r2, _081D641C
	mov r0, ip
	movs r4, #2
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x24]
	mov r0, ip
	movs r4, #2
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x26]
	mov r0, ip
	movs r4, #4
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x24]
	mov r0, ip
	movs r4, #4
	ldrsh r1, [r0, r4]
	b _081D649A
	.align 2, 0
_081D641C: .4byte 0x020205AC
_081D6420:
	ldr r2, _081D6458
	mov r0, ip
	movs r3, #2
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081D645C
	strh r1, [r0, #0x24]
	mov r4, ip
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0
	strh r3, [r0, #0x26]
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	b _081D6494
	.align 2, 0
_081D6458: .4byte 0x020205AC
_081D645C: .4byte 0x0000FFFF
_081D6460:
	ldr r2, _081D64AC
	mov r3, ip
	movs r4, #2
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081D64B0
	strh r1, [r0, #0x24]
	movs r0, #2
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #1
	strh r3, [r0, #0x26]
	mov r4, ip
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081D64B4
_081D6494:
	strh r1, [r0, #0x24]
	movs r0, #4
	ldrsh r1, [r4, r0]
_081D649A:
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x26]
_081D64A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D64AC: .4byte 0x020205AC
_081D64B0: .4byte 0x0000FFFF
_081D64B4: .4byte 0x0000FFFE
	thumb_func_end sub_081D635C

	thumb_func_start sub_081D64B8
sub_081D64B8: @ 0x081D64B8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r5, _081D6648
	adds r0, r5, #0
	movs r1, #0x88
	movs r2, #0x60
	movs r3, #1
	bl CreateSprite
	mov r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r6, _081D664C
	lsls r4, r0, #4
	add r4, r8
	lsls r4, r4, #2
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _081D6650
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x2e
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #0xa8
	movs r2, #0x60
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #0x88
	movs r2, #0x70
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa8
	movs r2, #0x70
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4, #2]
	adds r0, r5, #0
	movs r1, #0x88
	movs r2, #0x80
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	orrs r0, r1
	strh r0, [r4, #2]
	adds r0, r5, #0
	movs r1, #0xa8
	movs r2, #0x80
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #0x68
	movs r2, #0x80
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	orrs r0, r1
	strh r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #0x88
	movs r2, #0x80
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4, #6]
	adds r0, r5, #0
	movs r1, #0xb8
	movs r2, #0x80
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #6]
	orrs r0, r1
	strh r0, [r4, #6]
	ldr r0, _081D6654
	movs r1, #0xd0
	movs r2, #0x84
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4, #8]
	ldr r0, _081D6658
	movs r1, #0xc8
	movs r2, #0x78
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #2
	bl StartSpriteAnim
	ldrh r1, [r4, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #3
	bl StartSpriteAnim
	ldrb r1, [r4, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #4
	bl StartSpriteAnim
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #5
	bl StartSpriteAnim
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #6
	bl StartSpriteAnim
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #7
	bl StartSpriteAnim
	ldrb r1, [r4, #6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #8
	bl StartSpriteAnim
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081D6648: .4byte 0x085FBB18
_081D664C: .4byte 0x020205AC
_081D6650: .4byte 0x081D665D
_081D6654: .4byte 0x085FBB48
_081D6658: .4byte 0x085FBB60
	thumb_func_end sub_081D64B8

	thumb_func_start sub_081D665C
sub_081D665C: @ 0x081D665C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x2e
	ldrh r0, [r3, #0xa]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r3, #0xa]
	ldr r7, _081D676C
	cmp r0, #0
	bne _081D674A
	ldrh r1, [r4, #0x20]
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #0x98
	beq _081D674A
	adds r0, r1, #1
	strh r0, [r4, #0x20]
	ldrh r1, [r4, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r4, #0x2e]
	movs r2, #0xff
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #2]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #4]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #6]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #8]
	ands r2, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
_081D674A:
	adds r6, r7, #0
	movs r5, #0xff
	ldrb r1, [r3, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x2b
	ldrb r2, [r0]
	cmp r2, #1
	beq _081D681C
	cmp r2, #1
	bgt _081D6770
	cmp r2, #0
	beq _081D677C
	b _081D6904
	.align 2, 0
_081D676C: .4byte 0x020205AC
_081D6770:
	cmp r2, #2
	bne _081D6776
	b _081D68A4
_081D6776:
	cmp r2, #3
	beq _081D681C
	b _081D6904
_081D677C:
	strh r2, [r4, #0x26]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r0, [r3]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #2]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #4]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #6]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #8]
	ands r1, r5
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	b _081D6902
_081D681C:
	movs r2, #1
	strh r2, [r4, #0x26]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3, #6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3, #8]
	b _081D68FA
_081D68A4:
	strh r2, [r4, #0x26]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r0, [r3]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #2]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #8]
	ands r1, r5
_081D68FA:
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
_081D6902:
	strh r2, [r0, #0x26]
_081D6904:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D665C

	thumb_func_start VBlankCB_DuoFight
VBlankCB_DuoFight: @ 0x081D690C
	push {lr}
	bl VBlankCB_RayquazaScene
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_DuoFight

	thumb_func_start sub_081D691C
sub_081D691C: @ 0x081D691C
	push {r4, lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081D6998
	movs r0, #0
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _081D699C
	ldr r1, [r4]
	adds r1, #4
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D69A0
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D69A4
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D6998: .4byte 0x085FBB84
_081D699C: .4byte 0x0203CC2C
_081D69A0: .4byte 0x00000804
_081D69A4: .4byte 0x00001004
	thumb_func_end sub_081D691C

	thumb_func_start sub_081D69A8
sub_081D69A8: @ 0x081D69A8
	push {r4, lr}
	sub sp, #4
	bl reset_temp_tile_data_buffers
	ldr r1, _081D6A30
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
_081D69BE:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D69BE
	ldr r0, _081D6A34
	ldr r4, _081D6A38
	ldr r1, [r4]
	adds r1, #4
	bl LZDecompressVram
	ldr r0, _081D6A3C
	ldr r1, [r4]
	ldr r2, _081D6A40
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D6A44
	ldr r1, [r4]
	ldr r2, _081D6A48
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D6A4C
	movs r1, #0
	movs r2, #0x40
	bl LoadCompressedPalette
	ldr r0, _081D6A50
	bl LoadCompressedSpriteSheet
	ldr r0, _081D6A54
	bl LoadCompressedSpriteSheet
	ldr r0, _081D6A58
	bl LoadCompressedSpriteSheet
	ldr r0, _081D6A5C
	bl LoadCompressedSpriteSheet
	ldr r0, _081D6A60
	bl LoadCompressedSpriteSheet
	ldr r0, _081D6A64
	bl LoadCompressedSpriteSheet
	ldr r0, _081D6A68
	bl LoadCompressedSpritePalette
	ldr r0, _081D6A6C
	bl LoadCompressedSpritePalette
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D6A30: .4byte 0x08DA3668
_081D6A34: .4byte 0x08DA3C30
_081D6A38: .4byte 0x0203CC2C
_081D6A3C: .4byte 0x08DA3ACC
_081D6A40: .4byte 0x00000804
_081D6A44: .4byte 0x08DA3D30
_081D6A48: .4byte 0x00001004
_081D6A4C: .4byte 0x08DA3A90
_081D6A50: .4byte 0x085FBBC0
_081D6A54: .4byte 0x085FBBF4
_081D6A58: .4byte 0x085FBC20
_081D6A5C: .4byte 0x085FBCD0
_081D6A60: .4byte 0x085FBD10
_081D6A64: .4byte 0x085FBD30
_081D6A68: .4byte 0x085FBBC8
_081D6A6C: .4byte 0x085FBCD8
	thumb_func_end sub_081D69A8

	thumb_func_start Task_DuoFightAnim
Task_DuoFightAnim: @ 0x081D6A70
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r6, r1, #3
	ldr r7, _081D6AE8
	adds r5, r6, r7
	bl ScanlineEffect_Clear
	bl sub_081D691C
	bl sub_081D69A8
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, _081D6AEC
	ldr r2, _081D6AF0
	add r0, sp, #4
	bl CpuFastSet
	ldr r2, _081D6AF4
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [r2, #8]
	bl ScanlineEffect_SetParams
	strh r4, [r5]
	ldr r0, _081D6AF8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #2]
	ldr r0, _081D6AFC
	ldr r0, [r0]
	ldr r1, _081D6B00
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D6B08
	bl sub_081D62C0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #4]
	bl sub_081D64B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #6]
	adds r0, r7, #0
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _081D6B04
	str r1, [r0]
	b _081D6B2A
	.align 2, 0
_081D6AE8: .4byte 0x03005B68
_081D6AEC: .4byte 0x020388C8
_081D6AF0: .4byte 0x010003C0
_081D6AF4: .4byte 0x085FBB78
_081D6AF8: .4byte 0x081D6B65
_081D6AFC: .4byte 0x0203CC2C
_081D6B00: .4byte 0x00002006
_081D6B04: .4byte 0x081D6259
_081D6B08:
	bl sub_081D6FA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #4]
	bl sub_081D71F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #6]
	adds r0, r7, #0
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _081D6B5C
	str r1, [r0]
	bl StopMapMusic
_081D6B2A:
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
	ldr r0, _081D6B60
	bl SetVBlankCallback
	movs r0, #0x53
	bl PlaySE
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D6B5C: .4byte 0x081D6CA9
_081D6B60: .4byte 0x081D690D
	thumb_func_end Task_DuoFightAnim

	thumb_func_start sub_081D6B64
sub_081D6B64: @ 0x081D6B64
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081D6B9C
	adds r3, r1, r0
	movs r1, #0x18
	ldr r7, _081D6BA0
	ldr r4, _081D6BA4
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r5, r4, r0
_081D6B80:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r6, r0, #0
	cmp r1, #0x2f
	bgt _081D6BA8
	lsls r1, r1, #1
	adds r2, r1, r4
	ldrh r0, [r3]
	lsrs r0, r0, #8
	strh r0, [r2]
	adds r1, r1, r5
	ldrh r0, [r3]
	b _081D6C06
	.align 2, 0
_081D6B9C: .4byte 0x03005B68
_081D6BA0: .4byte 0x0203CC2C
_081D6BA4: .4byte 0x020388C8
_081D6BA8:
	cmp r1, #0x3f
	bgt _081D6BBC
	lsls r1, r1, #1
	adds r2, r1, r4
	ldrh r0, [r3, #2]
	lsrs r0, r0, #8
	strh r0, [r2]
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	b _081D6C06
_081D6BBC:
	cmp r1, #0x4b
	bgt _081D6BD0
	lsls r1, r1, #1
	adds r2, r1, r4
	ldrh r0, [r3, #4]
	lsrs r0, r0, #8
	strh r0, [r2]
	adds r1, r1, r5
	ldrh r0, [r3, #4]
	b _081D6C06
_081D6BD0:
	cmp r1, #0x53
	bgt _081D6BE4
	lsls r1, r1, #1
	adds r2, r1, r4
	ldrh r0, [r3, #6]
	lsrs r0, r0, #8
	strh r0, [r2]
	adds r1, r1, r5
	ldrh r0, [r3, #6]
	b _081D6C06
_081D6BE4:
	cmp r1, #0x57
	bgt _081D6BF8
	lsls r1, r1, #1
	adds r2, r1, r4
	ldrh r0, [r3, #8]
	lsrs r0, r0, #8
	strh r0, [r2]
	adds r1, r1, r5
	ldrh r0, [r3, #8]
	b _081D6C06
_081D6BF8:
	lsls r1, r1, #1
	adds r2, r1, r4
	ldrh r0, [r3, #0xa]
	lsrs r0, r0, #8
	strh r0, [r2]
	adds r1, r1, r5
	ldrh r0, [r3, #0xa]
_081D6C06:
	lsrs r0, r0, #8
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r6, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5b
	ble _081D6B80
	ldr r0, [r7]
	ldr r1, _081D6C5C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D6C60
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3, #4]
	adds r0, r0, r1
	strh r0, [r3, #4]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3, #6]
	adds r0, r0, r1
	strh r0, [r3, #6]
	ldrh r0, [r3, #8]
	adds r0, #0xc0
	b _081D6C9A
	.align 2, 0
_081D6C5C: .4byte 0x00002006
_081D6C60:
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r1, [r3, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r1, [r3, #4]
	adds r0, r0, r1
	strh r0, [r3, #4]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3, #6]
	adds r0, r0, r1
	strh r0, [r3, #6]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3, #8]
	adds r0, r0, r1
_081D6C9A:
	strh r0, [r3, #8]
	ldrh r0, [r3, #0xa]
	adds r0, #0x80
	strh r0, [r3, #0xa]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D6B64

	thumb_func_start Task_HandleDuoFight
Task_HandleDuoFight: @ 0x081D6CA8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r7, _081D6CE0
	adds r4, r0, r7
	bl sub_081D6E48
	ldr r0, _081D6CE4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _081D6D6A
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0x20
	beq _081D6CD8
	cmp r1, #0x70
	bne _081D6CE8
_081D6CD8:
	bl sub_081D6D74
	b _081D6D64
	.align 2, 0
_081D6CE0: .4byte 0x03005B68
_081D6CE4: .4byte 0x02037C74
_081D6CE8:
	cmp r1, #0xd8
	bne _081D6CF2
	bl sub_081D6DBC
	b _081D6D64
_081D6CF2:
	cmp r1, #0xdc
	bne _081D6CFC
	bl sub_081D6E04
	b _081D6D64
_081D6CFC:
	movs r0, #0xbe
	lsls r0, r0, #1
	cmp r1, r0
	beq _081D6D14
	adds r0, #0x20
	cmp r1, r0
	bne _081D6D64
	adds r0, r5, #0
	movs r1, #2
	bl DuoFightEnd
	b _081D6D6A
_081D6D14:
	movs r1, #0x91
	lsls r1, r1, #2
	movs r0, #0x50
	bl SetGpuReg
	adds r2, r7, #0
	subs r2, #8
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _081D6D70
	str r1, [r0]
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r6, [r0, #8]
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	strh r1, [r0, #0xc]
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xe]
	bl ScanlineEffect_Stop
_081D6D64:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_081D6D6A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D6D70: .4byte 0x081D6E69
	thumb_func_end Task_HandleDuoFight

	thumb_func_start sub_081D6D74
sub_081D6D74: @ 0x081D6D74
	push {r4, lr}
	sub sp, #0xc
	movs r0, #0x57
	bl PlaySE
	ldr r0, _081D6DB0
	ldr r1, _081D6DB4
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_080A250C
	ldr r0, _081D6DB8
	str r4, [sp]
	str r4, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_080A250C
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D6DB0: .4byte 0x00007FFF
_081D6DB4: .4byte 0x0000FFFF
_081D6DB8: .4byte 0xFFFF0000
	thumb_func_end sub_081D6D74

	thumb_func_start sub_081D6DBC
sub_081D6DBC: @ 0x081D6DBC
	push {r4, lr}
	sub sp, #0xc
	movs r0, #0x57
	bl PlaySE
	ldr r0, _081D6DF8
	ldr r1, _081D6DFC
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0x10
	bl sub_080A250C
	ldr r0, _081D6E00
	str r4, [sp]
	str r4, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0x10
	bl sub_080A250C
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D6DF8: .4byte 0x00007FFF
_081D6DFC: .4byte 0x0000FFFF
_081D6E00: .4byte 0xFFFF0000
	thumb_func_end sub_081D6DBC

	thumb_func_start sub_081D6E04
sub_081D6E04: @ 0x081D6E04
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _081D6E3C
	ldr r1, _081D6E40
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r2, #0x10
	movs r3, #0
	bl sub_080A250C
	ldr r0, _081D6E44
	str r4, [sp]
	str r4, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #4
	movs r2, #0x10
	movs r3, #0
	bl sub_080A250C
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D6E3C: .4byte 0x00007FFF
_081D6E40: .4byte 0x0000FFFF
_081D6E44: .4byte 0xFFFF0000
	thumb_func_end sub_081D6E04

	thumb_func_start sub_081D6E48
sub_081D6E48: @ 0x081D6E48
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #2
	movs r2, #1
	bl ChangeBgX
	movs r1, #0x80
	lsls r1, r1, #4
	movs r0, #2
	movs r2, #2
	bl ChangeBgY
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D6E48

	thumb_func_start sub_081D6E68
sub_081D6E68: @ 0x081D6E68
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081D6EE8
	adds r5, r1, r0
	movs r0, #4
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _081D6EEC
	adds r0, r0, r4
	bl sub_081D719C
	movs r0, #6
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl sub_081D7650
	movs r0, #1
	bl GetBgY
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #1
	bl GetBgY
	cmp r0, #0
	beq _081D6EB6
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	bls _081D6EC2
_081D6EB6:
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #1
	movs r2, #2
	bl ChangeBgY
_081D6EC2:
	ldrh r2, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0x10
	beq _081D6EE2
	adds r2, #1
	strh r2, [r5]
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
_081D6EE2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D6EE8: .4byte 0x03005B68
_081D6EEC: .4byte 0x020205AC
	thumb_func_end sub_081D6E68

	thumb_func_start DuoFightEnd
DuoFightEnd: @ 0x081D6EF0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x54
	bl PlaySE
	movs r0, #1
	rsbs r0, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _081D6F34
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081D6F38
	str r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D6F34: .4byte 0x03005B60
_081D6F38: .4byte 0x081D6F3D
	thumb_func_end DuoFightEnd

	thumb_func_start Task_DuoFightEnd
Task_DuoFightEnd: @ 0x081D6F3C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r6, r1, #3
	ldr r7, _081D6F94
	adds r5, r6, r7
	bl sub_081D6E48
	ldr r0, _081D6F98
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _081D6F8E
	ldrb r0, [r5, #2]
	bl DestroyTask
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0
	bl SetVBlankCallback
	bl ScanlineEffect_Stop
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	strh r4, [r5]
	adds r0, r7, #0
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _081D6F9C
	str r1, [r0]
_081D6F8E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D6F94: .4byte 0x03005B68
_081D6F98: .4byte 0x02037C74
_081D6F9C: .4byte 0x081D617D
	thumb_func_end Task_DuoFightEnd

	thumb_func_start sub_081D6FA0
sub_081D6FA0: @ 0x081D6FA0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _081D7028
	mov r8, r0
	movs r1, #0x62
	movs r2, #0x48
	movs r3, #3
	bl CreateSprite
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _081D702C
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _081D7030
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x2e
	adds r4, r4, r0
	mov r0, r8
	movs r1, #0x42
	movs r2, #0x68
	movs r3, #3
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldr r0, _081D7034
	movs r1, #0x55
	movs r2, #0x65
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #2]
	ldr r0, _081D7038
	movs r1, #0x77
	movs r2, #0x72
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081D7028: .4byte 0x085FBBD0
_081D702C: .4byte 0x020205AC
_081D7030: .4byte 0x081D703D
_081D7034: .4byte 0x085FBBFC
_081D7038: .4byte 0x085FBC28
	thumb_func_end sub_081D6FA0

	thumb_func_start sub_081D703C
sub_081D703C: @ 0x081D703C
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrh r0, [r0, #0xa]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _081D70A4
	ldrh r1, [r3, #0x20]
	movs r2, #0x20
	ldrsh r0, [r3, r2]
	cmp r0, #0x48
	beq _081D70A4
	subs r0, r1, #1
	strh r0, [r3, #0x20]
	ldr r2, _081D70B8
	movs r4, #0x2e
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	mov r0, ip
	movs r4, #2
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	mov r0, ip
	movs r4, #4
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
_081D70A4:
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r3, [r0]
	cmp r3, #1
	beq _081D7104
	cmp r3, #1
	bgt _081D70BC
	cmp r3, #0
	beq _081D70C6
	b _081D7188
	.align 2, 0
_081D70B8: .4byte 0x020205AC
_081D70BC:
	cmp r3, #2
	beq _081D7144
	cmp r3, #3
	beq _081D7104
	b _081D7188
_081D70C6:
	ldr r2, _081D7100
	mov r0, ip
	movs r4, #2
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x24]
	mov r0, ip
	movs r4, #2
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x26]
	mov r0, ip
	movs r4, #4
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x24]
	mov r0, ip
	movs r4, #4
	ldrsh r1, [r0, r4]
	b _081D717E
	.align 2, 0
_081D7100: .4byte 0x020205AC
_081D7104:
	ldr r2, _081D713C
	mov r0, ip
	movs r3, #2
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081D7140
	strh r1, [r0, #0x24]
	mov r4, ip
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0
	strh r3, [r0, #0x26]
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	b _081D7178
	.align 2, 0
_081D713C: .4byte 0x020205AC
_081D7140: .4byte 0x0000FFFF
_081D7144:
	ldr r2, _081D7190
	mov r3, ip
	movs r4, #2
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081D7194
	strh r1, [r0, #0x24]
	movs r0, #2
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #1
	strh r3, [r0, #0x26]
	mov r4, ip
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081D7198
_081D7178:
	strh r1, [r0, #0x24]
	movs r0, #4
	ldrsh r1, [r4, r0]
_081D717E:
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x26]
_081D7188:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D7190: .4byte 0x020205AC
_081D7194: .4byte 0x0000FFFF
_081D7198: .4byte 0x0000FFFE
	thumb_func_end sub_081D703C

	thumb_func_start sub_081D719C
sub_081D719C: @ 0x081D719C
	push {r4, lr}
	adds r1, r0, #0
	adds r3, r1, #0
	adds r3, #0x2e
	ldrh r2, [r1, #0x22]
	movs r4, #0x22
	ldrsh r0, [r1, r4]
	cmp r0, #0xa0
	bgt _081D71EC
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r1, #0x22]
	ldr r2, _081D71F4
	movs r0, #0x2e
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	movs r4, #2
	ldrsh r1, [r3, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	movs r0, #4
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
_081D71EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D71F4: .4byte 0x020205AC
	thumb_func_end sub_081D719C

	thumb_func_start sub_081D71F8
sub_081D71F8: @ 0x081D71F8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r5, _081D7388
	adds r0, r5, #0
	movs r1, #0x7e
	movs r2, #0x60
	movs r3, #1
	bl CreateSprite
	mov r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r6, _081D738C
	lsls r4, r0, #4
	add r4, r8
	lsls r4, r4, #2
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _081D7390
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x2e
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #0x9e
	movs r2, #0x60
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #0x7e
	movs r2, #0x70
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #0x9e
	movs r2, #0x70
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4, #2]
	adds r0, r5, #0
	movs r1, #0x7e
	movs r2, #0x80
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #2]
	orrs r0, r1
	strh r0, [r4, #2]
	adds r0, r5, #0
	movs r1, #0x9e
	movs r2, #0x80
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #0x5e
	movs r2, #0x80
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	orrs r0, r1
	strh r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #0x7e
	movs r2, #0x80
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4, #6]
	adds r0, r5, #0
	movs r1, #0xae
	movs r2, #0x80
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #6]
	orrs r0, r1
	strh r0, [r4, #6]
	ldr r0, _081D7394
	movs r1, #0xc6
	movs r2, #0x84
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #8
	strh r0, [r4, #8]
	ldr r0, _081D7398
	movs r1, #0xbe
	movs r2, #0x78
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #2
	bl StartSpriteAnim
	ldrh r1, [r4, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #3
	bl StartSpriteAnim
	ldrb r1, [r4, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #4
	bl StartSpriteAnim
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #5
	bl StartSpriteAnim
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #6
	bl StartSpriteAnim
	ldrh r1, [r4, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #7
	bl StartSpriteAnim
	ldrb r1, [r4, #6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #8
	bl StartSpriteAnim
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081D7388: .4byte 0x085FBCE0
_081D738C: .4byte 0x020205AC
_081D7390: .4byte 0x081D739D
_081D7394: .4byte 0x085FBD18
_081D7398: .4byte 0x085FBD38
	thumb_func_end sub_081D71F8

	thumb_func_start sub_081D739C
sub_081D739C: @ 0x081D739C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x2e
	ldrh r0, [r3, #0xa]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strh r0, [r3, #0xa]
	movs r1, #7
	ands r1, r0
	ldr r7, _081D74B0
	cmp r1, #0
	bne _081D748E
	ldrh r1, [r4, #0x20]
	movs r2, #0x20
	ldrsh r0, [r4, r2]
	cmp r0, #0x98
	beq _081D748E
	adds r0, r1, #1
	strh r0, [r4, #0x20]
	ldrh r1, [r4, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r4, #0x2e]
	movs r2, #0xff
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #2]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #4]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #6]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r3, #8]
	ands r2, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
_081D748E:
	adds r6, r7, #0
	movs r5, #0xff
	ldrb r1, [r3, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x2b
	ldrb r2, [r0]
	cmp r2, #1
	beq _081D7560
	cmp r2, #1
	bgt _081D74B4
	cmp r2, #0
	beq _081D74C0
	b _081D7648
	.align 2, 0
_081D74B0: .4byte 0x020205AC
_081D74B4:
	cmp r2, #2
	bne _081D74BA
	b _081D75E8
_081D74BA:
	cmp r2, #3
	beq _081D7560
	b _081D7648
_081D74C0:
	strh r2, [r4, #0x26]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r0, [r3]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #2]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #4]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #6]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #8]
	ands r1, r5
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	b _081D7646
_081D7560:
	movs r2, #1
	strh r2, [r4, #0x26]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3, #2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3, #6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrb r1, [r3, #8]
	b _081D763E
_081D75E8:
	strh r2, [r4, #0x26]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r0, [r3]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #2]
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r2, [r0, #0x26]
	ldrh r1, [r3, #8]
	ands r1, r5
_081D763E:
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
_081D7646:
	strh r2, [r0, #0x26]
_081D7648:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D739C

	thumb_func_start sub_081D7650
sub_081D7650: @ 0x081D7650
	push {lr}
	adds r2, r0, #0
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrh r1, [r2, #0x22]
	movs r3, #0x22
	ldrsh r0, [r2, r3]
	cmp r0, #0xa0
	bgt _081D7744
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r2, #0x22]
	ldr r3, _081D7748
	ldrh r1, [r2, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	ldrh r0, [r2, #0x2e]
	movs r2, #0xff
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	mov r0, ip
	ldrh r1, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	mov r1, ip
	ldrh r0, [r1, #2]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	mov r0, ip
	ldrh r1, [r0, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	mov r1, ip
	ldrh r0, [r1, #4]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	mov r0, ip
	ldrh r1, [r0, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	mov r1, ip
	ldrh r0, [r1, #6]
	adds r1, r2, #0
	ands r1, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	mov r0, ip
	ldrh r1, [r0, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
	mov r1, ip
	ldrh r0, [r1, #8]
	ands r2, r0
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x22]
	adds r1, #8
	strh r1, [r0, #0x22]
_081D7744:
	pop {r0}
	bx r0
	.align 2, 0
_081D7748: .4byte 0x020205AC
	thumb_func_end sub_081D7650

	thumb_func_start sub_081D774C
sub_081D774C: @ 0x081D774C
	push {r4, lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081D77C8
	movs r0, #1
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _081D77CC
	ldr r1, [r4]
	adds r1, #4
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D77D0
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D77D4
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D77C8: .4byte 0x085FBD50
_081D77CC: .4byte 0x0203CC2C
_081D77D0: .4byte 0x00000804
_081D77D4: .4byte 0x00001004
	thumb_func_end sub_081D774C

	thumb_func_start sub_081D77D8
sub_081D77D8: @ 0x081D77D8
	push {r4, lr}
	sub sp, #4
	bl reset_temp_tile_data_buffers
	ldr r1, _081D7858
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081D785C
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081D7860
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
_081D780C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D780C
	ldr r0, _081D7864
	ldr r4, _081D7868
	ldr r1, [r4]
	adds r1, #4
	bl LZDecompressVram
	ldr r0, _081D786C
	ldr r1, [r4]
	ldr r2, _081D7870
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D7874
	ldr r1, [r4]
	ldr r2, _081D7878
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D787C
	movs r1, #0
	movs r2, #0x40
	bl LoadCompressedPalette
	ldr r0, _081D7880
	bl LoadCompressedSpriteSheet
	ldr r0, _081D7884
	bl LoadCompressedSpritePalette
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D7858: .4byte 0x08DA3668
_081D785C: .4byte 0x08DA5218
_081D7860: .4byte 0x08DA3F3C
_081D7864: .4byte 0x08DA3C30
_081D7868: .4byte 0x0203CC2C
_081D786C: .4byte 0x08DA6360
_081D7870: .4byte 0x00000804
_081D7874: .4byte 0x08DA5094
_081D7878: .4byte 0x00001004
_081D787C: .4byte 0x08DA5050
_081D7880: .4byte 0x085FBD8C
_081D7884: .4byte 0x085FBD94
	thumb_func_end sub_081D77D8

	thumb_func_start Task_RayTakesFlightAnim
Task_RayTakesFlightAnim: @ 0x081D7888
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _081D78E8
	adds r6, r4, r5
	movs r0, #0xe8
	lsls r0, r0, #1
	bl PlayNewMapMusic
	bl sub_081D774C
	bl sub_081D77D8
	movs r1, #0x94
	lsls r1, r1, #2
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _081D78EC
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _081D78F0
	bl SetVBlankCallback
	ldr r0, _081D78F4
	movs r1, #0
	bl CreateTask
	movs r0, #0
	strh r0, [r6]
	strh r0, [r6, #2]
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _081D78F8
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D78E8: .4byte 0x03005B68
_081D78EC: .4byte 0x00000808
_081D78F0: .4byte 0x081D6129
_081D78F4: .4byte 0x081D7AE1
_081D78F8: .4byte 0x081D78FD
	thumb_func_end Task_RayTakesFlightAnim

	thumb_func_start Task_HandleRayTakesFlight
Task_HandleRayTakesFlight: @ 0x081D78FC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081D7920
	adds r4, r0, r1
	movs r0, #0
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _081D7966
	cmp r5, #1
	bgt _081D7924
	cmp r5, #0
	beq _081D7930
	b _081D7A96
	.align 2, 0
_081D7920: .4byte 0x03005B68
_081D7924:
	cmp r5, #2
	beq _081D79E0
	cmp r5, #3
	bne _081D792E
	b _081D7A60
_081D792E:
	b _081D7A96
_081D7930:
	ldrh r1, [r4, #2]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bne _081D7960
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	strh r5, [r4, #4]
	movs r0, #0x1e
	strh r0, [r4, #6]
	strh r5, [r4, #8]
	movs r0, #7
	strh r0, [r4, #0xa]
	strh r5, [r4, #2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _081D7A96
_081D7960:
	adds r0, r1, #1
	strh r0, [r4, #2]
	b _081D7A96
_081D7966:
	ldrh r1, [r4, #6]
	ldrh r3, [r4, #4]
	adds r0, r1, r3
	strh r0, [r4, #4]
	ldrh r2, [r4, #0xa]
	ldrh r3, [r4, #8]
	adds r0, r2, r3
	strh r0, [r4, #8]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _081D7982
	subs r0, r1, #3
	strh r0, [r4, #6]
_081D7982:
	lsls r0, r2, #0x10
	cmp r0, #0
	beq _081D798C
	subs r0, r2, #1
	strh r0, [r4, #0xa]
_081D798C:
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0xff
	ble _081D79B4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r4, #4]
	movs r1, #0
	strh r1, [r4, #6]
	movs r0, #0xc
	strh r0, [r4, #0xc]
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r3, #0
	strh r0, [r4, #0xe]
	strh r1, [r4, #2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_081D79B4:
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r2, #0xc0
	lsls r2, r2, #5
	ldrh r0, [r4, #8]
	adds r0, #0x20
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r3, #4
	ldrsh r0, [r4, r3]
	str r0, [sp, #4]
	movs r3, #4
	ldrsh r0, [r4, r3]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #2
	movs r3, #0x78
	bl SetBgAffine
	b _081D7A96
_081D79E0:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r2, #0xc0
	lsls r2, r2, #5
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	adds r0, #0x20
	ldrh r3, [r4, #8]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r3, #4
	ldrsh r0, [r4, r3]
	str r0, [sp, #4]
	movs r3, #4
	ldrsh r0, [r4, r3]
	str r0, [sp, #8]
	movs r5, #0
	str r5, [sp, #0xc]
	movs r0, #2
	movs r3, #0x78
	bl SetBgAffine
	ldrh r0, [r4, #0xe]
	ldrh r1, [r4, #0xc]
	adds r0, r0, r1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xc
	beq _081D7A30
	movs r0, #0xc
	rsbs r0, r0, #0
	cmp r1, r0
	bne _081D7A96
_081D7A30:
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	strh r0, [r4, #0xe]
	movs r3, #2
	ldrsh r1, [r4, r3]
	ldr r0, _081D7A5C
	cmp r1, r0
	ble _081D7A96
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	movs r1, #6
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _081D7A96
	.align 2, 0
_081D7A5C: .4byte 0x00000127
_081D7A60:
	ldrh r0, [r4, #4]
	adds r0, #0x10
	strh r0, [r4, #4]
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r2, #0xc0
	lsls r2, r2, #5
	ldrh r0, [r4, #8]
	adds r0, #0x20
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r3, #4
	ldrsh r0, [r4, r3]
	str r0, [sp, #4]
	movs r3, #4
	ldrsh r0, [r4, r3]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #2
	movs r3, #0x78
	bl SetBgAffine
	adds r0, r6, #0
	bl Task_RayTakesFlightEnd
_081D7A96:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_HandleRayTakesFlight

	thumb_func_start Task_RayTakesFlightEnd
Task_RayTakesFlightEnd: @ 0x081D7AA0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081D7AD4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081D7ACE
	movs r0, #0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _081D7AD8
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081D7ADC
	str r0, [r1]
_081D7ACE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D7AD4: .4byte 0x02037C74
_081D7AD8: .4byte 0x03005B60
_081D7ADC: .4byte 0x081D617D
	thumb_func_end Task_RayTakesFlightEnd

	thumb_func_start sub_081D7AE0
sub_081D7AE0: @ 0x081D7AE0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081D7B7C
	adds r4, r0, r1
	ldrh r1, [r4, #2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081D7B90
	ldr r0, _081D7B80
	ldr r3, _081D7B84
	movs r1, #0
	ldrsh r2, [r4, r1]
	lsls r2, r2, #1
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x12
	movs r6, #0xf0
	lsls r6, r6, #0xf
	adds r1, r1, r6
	asrs r1, r1, #0x10
	adds r3, #1
	adds r2, r2, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r2, r2, #0x12
	movs r3, #0xa0
	lsls r3, r3, #0xf
	adds r2, r2, r3
	asrs r2, r2, #0x10
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081D7B88
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r3, r3, r1
	movs r0, #0
	ldrsb r0, [r4, r0]
	strh r0, [r3, #0x2e]
	ldrb r2, [r3, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	movs r2, #3
	orrs r0, r2
	strb r0, [r3, #1]
	ldrb r0, [r3, #5]
	ands r1, r0
	movs r0, #8
	orrs r1, r0
	strb r1, [r3, #5]
	adds r0, r3, #0
	bl InitSpriteAffineAnim
	ldrh r1, [r4]
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r0, #9
	bne _081D7B8C
	adds r0, r5, #0
	bl DestroyTask
	b _081D7B96
	.align 2, 0
_081D7B7C: .4byte 0x03005B68
_081D7B80: .4byte 0x085FBD9C
_081D7B84: .4byte 0x085FBDB4
_081D7B88: .4byte 0x020205AC
_081D7B8C:
	adds r0, r1, #1
	strh r0, [r4]
_081D7B90:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
_081D7B96:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081D7AE0

	thumb_func_start sub_081D7B9C
sub_081D7B9C: @ 0x081D7B9C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x30
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _081D7BAC
	strh r0, [r2, #0x24]
	b _081D7BD6
_081D7BAC:
	ldr r1, _081D7BE8
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r2, #0x24]
	adds r0, r0, r3
	strh r0, [r2, #0x24]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r2, #0x26]
	adds r0, r0, r1
_081D7BD6:
	strh r0, [r2, #0x26]
	ldrh r0, [r2, #0x30]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
_081D7BE8: .4byte 0x085FBDB4
	thumb_func_end sub_081D7B9C

	thumb_func_start sub_081D7BEC
sub_081D7BEC: @ 0x081D7BEC
	push {r4, lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081D7C80
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r4, _081D7C84
	ldr r1, [r4]
	adds r1, #4
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D7C88
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D7C8C
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D7C90
	adds r1, r1, r0
	movs r0, #3
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D7C80: .4byte 0x085FBDC8
_081D7C84: .4byte 0x0203CC2C
_081D7C88: .4byte 0x00000804
_081D7C8C: .4byte 0x00001004
_081D7C90: .4byte 0x00001804
	thumb_func_end sub_081D7BEC

	thumb_func_start sub_081D7C94
sub_081D7C94: @ 0x081D7C94
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl reset_temp_tile_data_buffers
	ldr r1, _081D7D40
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081D7D44
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	add r7, sp, #8
_081D7CBC:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _081D7CBC
	ldr r0, _081D7D48
	ldr r5, _081D7D4C
	ldr r1, [r5]
	adds r1, #4
	bl LZDecompressVram
	ldr r0, _081D7D50
	ldr r1, [r5]
	ldr r4, _081D7D54
	adds r1, r1, r4
	bl LZDecompressVram
	str r6, [sp, #4]
	ldr r1, [r5]
	ldr r0, _081D7D58
	adds r1, r1, r0
	ldr r2, _081D7D5C
	add r0, sp, #4
	bl CpuFastSet
	ldr r1, [r5]
	adds r4, r1, r4
	ldr r0, _081D7D60
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	bl CpuFastSet
	str r6, [sp, #8]
	ldr r1, [r5]
	ldr r0, _081D7D64
	adds r1, r1, r0
	ldr r2, _081D7D68
	adds r0, r7, #0
	bl CpuFastSet
	ldr r0, _081D7D6C
	movs r1, #0
	movs r2, #0x40
	bl LoadCompressedPalette
	ldr r0, _081D7D70
	ldr r1, _081D7D74
	strh r1, [r0]
	ldr r0, _081D7D78
	strh r1, [r0]
	ldr r0, _081D7D7C
	bl LoadCompressedSpriteSheet
	ldr r0, _081D7D80
	bl LoadCompressedSpriteSheet
	ldr r0, _081D7D84
	bl LoadCompressedSpritePalette
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D7D40: .4byte 0x08DA77D0
_081D7D44: .4byte 0x08DA6C64
_081D7D48: .4byte 0x08DA7D54
_081D7D4C: .4byte 0x0203CC2C
_081D7D50: .4byte 0x08DA7A2C
_081D7D54: .4byte 0x00001804
_081D7D58: .4byte 0x00001004
_081D7D5C: .4byte 0x01000200
_081D7D60: .4byte 0x00000804
_081D7D64: .4byte 0x00000904
_081D7D68: .4byte 0x010000D0
_081D7D6C: .4byte 0x08DA79EC
_081D7D70: .4byte 0x020373B4
_081D7D74: .4byte 0x00007FFF
_081D7D78: .4byte 0x020377B4
_081D7D7C: .4byte 0x085FBDF8
_081D7D80: .4byte 0x085FBE00
_081D7D84: .4byte 0x085FBE08
	thumb_func_end sub_081D7C94

	thumb_func_start sub_081D7D88
sub_081D7D88: @ 0x081D7D88
	push {r4, r5, lr}
	movs r0, #6
	bl GetGpuReg
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r1, r2, #0
	subs r1, #0x18
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6f
	bhi _081D7DC8
	ldr r0, _081D7DB8
	ldr r0, [r0]
	ldr r3, _081D7DBC
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bgt _081D7DC8
	ldr r1, _081D7DC0
	ldr r3, _081D7DC4
	b _081D7DCE
	.align 2, 0
_081D7DB8: .4byte 0x0203CC2C
_081D7DBC: .4byte 0x00002008
_081D7DC0: .4byte 0x04000052
_081D7DC4: .4byte 0x00000D08
_081D7DC8:
	ldr r1, _081D7DF4
	movs r3, #0x80
	lsls r3, r3, #5
_081D7DCE:
	adds r0, r3, #0
	strh r0, [r1]
	cmp r2, #0
	bne _081D7E1C
	ldr r0, _081D7DF8
	ldr r1, [r0]
	ldr r2, _081D7DFC
	adds r3, r1, r2
	ldrh r4, [r3]
	movs r1, #0
	ldrsh r2, [r3, r1]
	ldr r1, _081D7E00
	adds r5, r0, #0
	cmp r2, r1
	bgt _081D7E10
	cmp r2, #0x27
	bgt _081D7E04
	adds r0, r4, #4
	b _081D7E0E
	.align 2, 0
_081D7DF4: .4byte 0x04000052
_081D7DF8: .4byte 0x0203CC2C
_081D7DFC: .4byte 0x00002008
_081D7E00: .4byte 0x00001FFF
_081D7E04:
	cmp r2, #0x4f
	bgt _081D7E0C
	adds r0, r4, #2
	b _081D7E0E
_081D7E0C:
	adds r0, r4, #1
_081D7E0E:
	strh r0, [r3]
_081D7E10:
	ldr r1, [r5]
	ldr r2, _081D7E24
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_081D7E1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D7E24: .4byte 0x0000200A
	thumb_func_end sub_081D7D88

	thumb_func_start Task_RayDescendsAnim
Task_RayDescendsAnim: @ 0x081D7E28
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r6, _081D7E9C
	adds r5, r4, r6
	bl sub_081D7BEC
	bl sub_081D7C94
	ldr r1, _081D7EA0
	movs r0, #0x50
	bl SetGpuRegBits
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	movs r0, #0x52
	mov r1, r8
	bl SetGpuReg
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _081D7EA4
	bl SetVBlankCallback
	ldr r0, _081D7EA8
	ldr r0, [r0]
	ldr r1, _081D7EAC
	adds r2, r0, r1
	movs r1, #0
	strh r1, [r2]
	ldr r2, _081D7EB0
	adds r0, r0, r2
	strh r1, [r0]
	strh r1, [r5]
	strh r1, [r5, #2]
	strh r1, [r5, #4]
	strh r1, [r5, #6]
	mov r0, r8
	strh r0, [r5, #8]
	subs r6, #8
	adds r4, r4, r6
	ldr r0, _081D7EB4
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D7E9C: .4byte 0x03005B68
_081D7EA0: .4byte 0x00001E41
_081D7EA4: .4byte 0x081D6129
_081D7EA8: .4byte 0x0203CC2C
_081D7EAC: .4byte 0x00002008
_081D7EB0: .4byte 0x0000200A
_081D7EB4: .4byte 0x081D7EB9
	thumb_func_end Task_RayDescendsAnim

	thumb_func_start Task_HandleRayDescends
Task_HandleRayDescends: @ 0x081D7EB8
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _081D7EDC
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bhi _081D7FB0
	lsls r0, r0, #2
	ldr r1, _081D7EE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D7EDC: .4byte 0x03005B68
_081D7EE0: .4byte 0x081D7EE4
_081D7EE4: @ jump table
	.4byte _081D7EF8 @ case 0
	.4byte _081D7F18 @ case 1
	.4byte _081D7F56 @ case 2
	.4byte _081D7F76 @ case 3
	.4byte _081D7F92 @ case 4
_081D7EF8:
	ldrh r1, [r5, #2]
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #8
	bne _081D7F70
	movs r0, #1
	rsbs r0, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	strh r4, [r5, #2]
	b _081D7F8A
_081D7F18:
	ldr r0, _081D7F48
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _081D7FB0
	ldrh r2, [r5, #2]
	movs r3, #2
	ldrsh r0, [r5, r3]
	cmp r0, #0xa
	bne _081D7F50
	strh r1, [r5, #2]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, _081D7F4C
	bl SetHBlankCallback
	movs r0, #3
	bl EnableInterrupts
	b _081D7FB0
	.align 2, 0
_081D7F48: .4byte 0x02037C74
_081D7F4C: .4byte 0x081D7D89
_081D7F50:
	adds r0, r2, #1
	strh r0, [r5, #2]
	b _081D7FB0
_081D7F56:
	ldrh r1, [r5, #2]
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0x50
	bne _081D7F70
	movs r0, #0
	strh r0, [r5, #2]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	bl sub_081D8008
	b _081D7FB0
_081D7F70:
	adds r0, r1, #1
	strh r0, [r5, #2]
	b _081D7FB0
_081D7F76:
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	movs r1, #0xb8
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _081D7FB0
	movs r0, #0
	strh r0, [r5, #2]
_081D7F8A:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _081D7FB0
_081D7F92:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _081D7FB8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081D7FBC
	str r1, [r0]
_081D7FB0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D7FB8: .4byte 0x03005B60
_081D7FBC: .4byte 0x081D7FC1
	thumb_func_end Task_HandleRayDescends

	thumb_func_start Task_RayDescendsEnd
Task_RayDescendsEnd: @ 0x081D7FC0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _081D7FFC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081D7FF4
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _081D8000
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081D8004
	str r0, [r1]
_081D7FF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D7FFC: .4byte 0x02037C74
_081D8000: .4byte 0x03005B60
_081D8004: .4byte 0x081D617D
	thumb_func_end Task_RayDescendsEnd

	thumb_func_start sub_081D8008
sub_081D8008: @ 0x081D8008
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _081D8078
	movs r1, #0xa0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r6, #4
	adds r5, r5, r6
	lsls r5, r5, #2
	ldr r4, _081D807C
	adds r0, r5, r4
	mov r8, r0
	ldr r0, _081D8080
	movs r2, #0x30
	rsbs r2, r2, #0
	movs r1, #0xb8
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strh r0, [r1]
	adds r3, r4, #0
	subs r3, #0x2e
	subs r4, #0x12
	adds r4, r5, r4
	ldr r0, _081D8084
	str r0, [r4]
	adds r5, r5, r3
	ldrb r0, [r5, #5]
	movs r2, #0xc
	orrs r0, r2
	strb r0, [r5, #5]
	movs r4, #0
	ldrsh r1, [r1, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #5]
	orrs r1, r2
	strb r1, [r0, #5]
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081D8078: .4byte 0x085FBE10
_081D807C: .4byte 0x020205DA
_081D8080: .4byte 0x085FBE28
_081D8084: .4byte 0x081D8089
	thumb_func_end sub_081D8008

	thumb_func_start sub_081D8088
sub_081D8088: @ 0x081D8088
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x2e
	movs r0, #4
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _081D80A0
	movs r0, #0xc
	strh r0, [r4, #6]
	movs r0, #8
	b _081D80FE
_081D80A0:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D80B0
	movs r0, #9
	strh r0, [r4, #6]
	movs r0, #7
	b _081D80FE
_081D80B0:
	movs r0, #0x86
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D80C0
	movs r0, #8
	strh r0, [r4, #6]
	movs r0, #6
	b _081D80FE
_081D80C0:
	movs r0, #0x8c
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D80D0
	movs r0, #7
	strh r0, [r4, #6]
	movs r0, #5
	b _081D80FE
_081D80D0:
	movs r0, #0x92
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D80E0
	movs r0, #6
	strh r0, [r4, #6]
	movs r0, #4
	b _081D80FE
_081D80E0:
	movs r0, #0x98
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D80F0
	movs r0, #5
	strh r0, [r4, #6]
	movs r0, #3
	b _081D80FE
_081D80F0:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D8100
	movs r0, #4
	strh r0, [r4, #6]
	movs r0, #2
_081D80FE:
	strh r0, [r4, #8]
_081D8100:
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r2, #6
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, #0
	bne _081D812A
	ldrh r0, [r5, #0x24]
	subs r0, #1
	strh r0, [r5, #0x24]
	ldr r2, _081D8160
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x24]
	subs r1, #1
	strh r1, [r0, #0x24]
_081D812A:
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r2, #8
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, #0
	bne _081D8154
	ldrh r0, [r5, #0x26]
	adds r0, #1
	strh r0, [r5, #0x26]
	ldr r2, _081D8160
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	adds r1, #1
	strh r1, [r0, #0x26]
_081D8154:
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D8160: .4byte 0x020205AC
	thumb_func_end sub_081D8088

	thumb_func_start sub_081D8164
sub_081D8164: @ 0x081D8164
	push {r4, lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081D81F8
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r4, _081D81FC
	ldr r1, [r4]
	adds r1, #4
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D8200
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D8204
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D8208
	adds r1, r1, r0
	movs r0, #3
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #3
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0xc1
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D81F8: .4byte 0x085FBE40
_081D81FC: .4byte 0x0203CC2C
_081D8200: .4byte 0x00000804
_081D8204: .4byte 0x00001004
_081D8208: .4byte 0x00001804
	thumb_func_end sub_081D8164

	thumb_func_start sub_081D820C
sub_081D820C: @ 0x081D820C
	push {r4, lr}
	sub sp, #4
	bl reset_temp_tile_data_buffers
	ldr r1, _081D828C
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081D8290
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081D8294
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
_081D8240:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D8240
	ldr r0, _081D8298
	ldr r4, _081D829C
	ldr r1, [r4]
	adds r1, #4
	bl LZDecompressVram
	ldr r0, _081D82A0
	ldr r1, [r4]
	ldr r2, _081D82A4
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D82A8
	ldr r1, [r4]
	ldr r2, _081D82AC
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D82B0
	ldr r1, [r4]
	ldr r2, _081D82B4
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D82B8
	movs r1, #0
	movs r2, #0x80
	bl LoadCompressedPalette
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D828C: .4byte 0x08DA8364
_081D8290: .4byte 0x08DA8154
_081D8294: .4byte 0x08DA7ED8
_081D8298: .4byte 0x08DA9014
_081D829C: .4byte 0x0203CC2C
_081D82A0: .4byte 0x08DA8DE8
_081D82A4: .4byte 0x00000804
_081D82A8: .4byte 0x08DA825C
_081D82AC: .4byte 0x00001004
_081D82B0: .4byte 0x08DA8014
_081D82B4: .4byte 0x00001804
_081D82B8: .4byte 0x08DA912C
	thumb_func_end sub_081D820C

	thumb_func_start Task_RayChargesAnim
Task_RayChargesAnim: @ 0x081D82BC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _081D830C
	adds r6, r4, r5
	bl sub_081D8164
	bl sub_081D820C
	bl sub_081D6204
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _081D8310
	bl SetVBlankCallback
	movs r0, #0
	strh r0, [r6]
	strh r0, [r6, #2]
	ldr r0, _081D8314
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #4]
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _081D8318
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D830C: .4byte 0x03005B68
_081D8310: .4byte 0x081D6129
_081D8314: .4byte 0x081D8415
_081D8318: .4byte 0x081D831D
	thumb_func_end Task_RayChargesAnim

	thumb_func_start Task_HandleRayCharges
Task_HandleRayCharges: @ 0x081D831C
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _081D836C
	adds r4, r0, r1
	bl sub_081D84F0
	ldrh r1, [r4, #6]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _081D8352
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bgt _081D8352
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0x59
	bgt _081D8352
	movs r0, #0x67
	bl PlaySE
_081D8352:
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _081D8398
	cmp r5, #1
	bgt _081D8370
	cmp r5, #0
	beq _081D837A
	b _081D8402
	.align 2, 0
_081D836C: .4byte 0x03005B68
_081D8370:
	cmp r5, #2
	beq _081D83C8
	cmp r5, #3
	beq _081D83E4
	b _081D8402
_081D837A:
	ldrh r1, [r4, #2]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bne _081D83DE
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	strh r5, [r4, #2]
	b _081D83D6
_081D8398:
	ldrh r1, [r4, #2]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0x7f
	bne _081D83DE
	movs r0, #0
	strh r0, [r4, #2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r2, _081D83C0
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _081D83C4
	b _081D8400
	.align 2, 0
_081D83C0: .4byte 0x03005B60
_081D83C4: .4byte 0x081D8469
_081D83C8:
	ldrh r1, [r4, #2]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0xc
	bne _081D83DE
	movs r0, #0
	strh r0, [r4, #2]
_081D83D6:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _081D8402
_081D83DE:
	adds r0, r1, #1
	strh r0, [r4, #2]
	b _081D8402
_081D83E4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _081D840C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081D8410
_081D8400:
	str r1, [r0]
_081D8402:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D840C: .4byte 0x03005B60
_081D8410: .4byte 0x081D8529
	thumb_func_end Task_HandleRayCharges

	thumb_func_start sub_081D8414
sub_081D8414: @ 0x081D8414
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081D8464
	adds r5, r1, r0
	ldrh r1, [r5, #0x1e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081D8458
	bl Random
	movs r4, #7
	adds r1, r4, #0
	ands r1, r0
	subs r1, #4
	lsls r1, r1, #8
	movs r0, #1
	movs r2, #0
	bl ChangeBgX
	bl Random
	ands r4, r0
	subs r4, #4
	lsls r4, r4, #8
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	bl ChangeBgY
_081D8458:
	ldrh r0, [r5, #0x1e]
	adds r0, #1
	strh r0, [r5, #0x1e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D8464: .4byte 0x03005B68
	thumb_func_end sub_081D8414

	thumb_func_start sub_081D8468
sub_081D8468: @ 0x081D8468
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081D84A8
	adds r4, r1, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081D84AC
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	b _081D84E6
	.align 2, 0
_081D84A8: .4byte 0x03005B68
_081D84AC:
	cmp r0, #1
	bne _081D84E8
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r1, r1, #8
	movs r0, #1
	movs r2, #2
	bl ChangeBgX
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r1, r1, #8
	movs r0, #1
	movs r2, #1
	bl ChangeBgY
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa
	rsbs r1, r1, #0
	cmp r0, r1
	bne _081D84E8
	movs r1, #4
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
_081D84E6:
	strh r0, [r4, #4]
_081D84E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D8468

	thumb_func_start sub_081D84F0
sub_081D84F0: @ 0x081D84F0
	push {r4, lr}
	movs r4, #0x80
	lsls r4, r4, #3
	movs r0, #2
	adds r1, r4, #0
	movs r2, #2
	bl ChangeBgX
	movs r0, #2
	adds r1, r4, #0
	movs r2, #1
	bl ChangeBgY
	movs r4, #0x80
	lsls r4, r4, #4
	movs r0, #0
	adds r1, r4, #0
	movs r2, #2
	bl ChangeBgX
	movs r0, #0
	adds r1, r4, #0
	movs r2, #1
	bl ChangeBgY
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081D84F0

	thumb_func_start Task_RayChargesEnd
Task_RayChargesEnd: @ 0x081D8528
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r5, r1, #3
	ldr r6, _081D8568
	adds r4, r5, r6
	bl sub_081D84F0
	ldr r0, _081D856C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081D8562
	movs r0, #0
	bl SetVBlankCallback
	bl sub_081D6240
	ldrb r0, [r4, #4]
	bl DestroyTask
	adds r0, r6, #0
	subs r0, #8
	adds r0, r5, r0
	ldr r1, _081D8570
	str r1, [r0]
_081D8562:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D8568: .4byte 0x03005B68
_081D856C: .4byte 0x02037C74
_081D8570: .4byte 0x081D617D
	thumb_func_end Task_RayChargesEnd

	thumb_func_start sub_081D8574
sub_081D8574: @ 0x081D8574
	push {r4, lr}
	bl ResetVramOamAndBgCntRegs
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _081D85F0
	movs r0, #1
	movs r2, #3
	bl InitBgsFromTemplates
	ldr r4, _081D85F4
	ldr r1, [r4]
	adds r1, #4
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D85F8
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _081D85FC
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	bl ResetAllBgsCoordinates
	movs r0, #0
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #1
	bl schedule_bg_copy_tilemap_to_vram
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	movs r1, #0xc1
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D85F0: .4byte 0x085FC004
_081D85F4: .4byte 0x0203CC2C
_081D85F8: .4byte 0x00000804
_081D85FC: .4byte 0x00001004
	thumb_func_end sub_081D8574

	thumb_func_start sub_081D8600
sub_081D8600: @ 0x081D8600
	push {r4, lr}
	sub sp, #4
	bl reset_temp_tile_data_buffers
	ldr r1, _081D86A4
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _081D86A8
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
_081D8626:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D8626
	ldr r0, _081D86AC
	ldr r4, _081D86B0
	ldr r1, [r4]
	ldr r2, _081D86B4
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D86B8
	ldr r1, [r4]
	adds r1, #4
	bl LZDecompressVram
	ldr r0, _081D86BC
	ldr r1, [r4]
	ldr r2, _081D86C0
	adds r1, r1, r2
	bl LZDecompressVram
	ldr r0, _081D86C4
	movs r1, #0
	movs r2, #0x60
	bl LoadCompressedPalette
	ldr r0, _081D86C8
	bl LoadCompressedSpriteSheet
	ldr r0, _081D86CC
	bl LoadCompressedSpriteSheet
	ldr r0, _081D86D0
	bl LoadCompressedSpriteSheet
	ldr r0, _081D86D4
	bl LoadCompressedSpriteSheet
	ldr r0, _081D86D8
	bl LoadCompressedSpriteSheet
	ldr r0, _081D86DC
	bl LoadCompressedSpriteSheet
	ldr r0, _081D86E0
	bl LoadCompressedSpritePalette
	ldr r0, _081D86E4
	bl LoadCompressedSpritePalette
	ldr r0, _081D86E8
	bl LoadCompressedSpritePalette
	ldr r0, _081D86EC
	bl LoadCompressedSpritePalette
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D86A4: .4byte 0x08DAADCC
_081D86A8: .4byte 0x08DAAB5C
_081D86AC: .4byte 0x08DAB0FC
_081D86B0: .4byte 0x0203CC2C
_081D86B4: .4byte 0x00000804
_081D86B8: .4byte 0x08DAAEC4
_081D86BC: .4byte 0x08DAB240
_081D86C0: .4byte 0x00001004
_081D86C4: .4byte 0x08DAB294
_081D86C8: .4byte 0x085FBF24
_081D86CC: .4byte 0x085FBF2C
_081D86D0: .4byte 0x085FBF34
_081D86D4: .4byte 0x085FBF3C
_081D86D8: .4byte 0x085FBF44
_081D86DC: .4byte 0x085FBF4C
_081D86E0: .4byte 0x085FBF54
_081D86E4: .4byte 0x085FBF5C
_081D86E8: .4byte 0x085FBF64
_081D86EC: .4byte 0x085FBF6C
	thumb_func_end sub_081D8600

	thumb_func_start Task_RayChasesAwayAnim
Task_RayChasesAwayAnim: @ 0x081D86F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _081D87A4
	adds r6, r4, r5
	bl sub_081D8574
	bl sub_081D8600
	bl sub_081D6204
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl ClearGpuRegBits
	ldr r1, _081D87A8
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _081D87AC
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	ldr r0, _081D87B0
	bl SetVBlankCallback
	movs r0, #0
	strh r0, [r6]
	strh r0, [r6, #2]
	subs r5, #8
	adds r4, r4, r5
	ldr r0, _081D87B4
	str r0, [r4]
	ldr r0, _081D87B8
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #4]
	movs r0, #4
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #0
	strh r2, [r0, #8]
	movs r0, #4
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r2, [r0, #0xa]
	movs r0, #4
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r2, [r0, #0xc]
	movs r0, #4
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r2, #1
	strh r2, [r0, #0xe]
	movs r0, #4
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	strh r2, [r0, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D87A4: .4byte 0x03005B68
_081D87A8: .4byte 0x00000241
_081D87AC: .4byte 0x00000E09
_081D87B0: .4byte 0x081D6129
_081D87B4: .4byte 0x081D87BD
_081D87B8: .4byte 0x081D88ED
	thumb_func_end Task_RayChasesAwayAnim

	thumb_func_start Task_HandleRayChasesAway
Task_HandleRayChasesAway: @ 0x081D87BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r7, r0, #3
	ldr r0, _081D87E8
	mov r8, r0
	adds r4, r7, r0
	movs r1, #0
	ldrsh r5, [r4, r1]
	cmp r5, #1
	beq _081D881A
	cmp r5, #1
	bgt _081D87EC
	cmp r5, #0
	beq _081D87F6
	b _081D88DC
	.align 2, 0
_081D87E8: .4byte 0x03005B68
_081D87EC:
	cmp r5, #2
	beq _081D885A
	cmp r5, #3
	beq _081D88C0
	b _081D88DC
_081D87F6:
	ldrh r1, [r4, #2]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bne _081D8854
	adds r0, r6, #0
	bl sub_081D89E4
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	strh r5, [r4, #2]
	b _081D886C
_081D881A:
	ldr r2, _081D884C
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _081D8850
	cmp r1, r0
	bne _081D88DC
	ldrh r1, [r4, #2]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0x40
	bne _081D8854
	adds r0, r6, #0
	bl sub_081D8E10
	adds r0, r6, #0
	bl sub_081D8D14
	b _081D8868
	.align 2, 0
_081D884C: .4byte 0x020205AC
_081D8850: .4byte 0x081D911D
_081D8854:
	adds r0, r1, #1
	strh r0, [r4, #2]
	b _081D88DC
_081D885A:
	ldrh r2, [r4, #2]
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D8874
_081D8868:
	movs r0, #0
	strh r0, [r4, #2]
_081D886C:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _081D88DC
_081D8874:
	adds r0, r2, #1
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r1, #0x90
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	bne _081D88DC
	ldr r0, _081D88B4
	ldr r1, _081D88B8
	str r1, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_080A250C
	ldr r0, _081D88BC
	str r4, [sp]
	str r4, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_080A250C
	b _081D88DC
	.align 2, 0
_081D88B4: .4byte 0x0000FFFE
_081D88B8: .4byte 0x0000FFFF
_081D88BC: .4byte 0xFFFF0000
_081D88C0:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	mov r0, r8
	subs r0, #8
	adds r0, r7, r0
	ldr r1, _081D88E8
	str r1, [r0]
_081D88DC:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D88E8: .4byte 0x081D8971
	thumb_func_end Task_HandleRayChasesAway

	thumb_func_start sub_081D88EC
sub_081D88EC: @ 0x081D88EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081D896C
	adds r4, r1, r0
	ldrh r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _081D8960
	ldrh r1, [r4, #2]
	adds r1, #0xe
	lsls r1, r1, #8
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r0, r2, #0
	ands r1, r0
	ldrh r0, [r4, #4]
	adds r0, #9
	movs r2, #0xf
	ands r0, r2
	orrs r1, r0
	movs r0, #0x52
	bl SetGpuReg
	ldrh r1, [r4, #2]
	ldrh r0, [r4, #6]
	subs r1, r1, r0
	strh r1, [r4, #2]
	ldrh r0, [r4, #8]
	ldrh r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081D8944
	cmp r1, #0
	bne _081D894C
_081D8944:
	movs r1, #6
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #6]
_081D894C:
	movs r2, #4
	ldrsh r0, [r4, r2]
	cmp r0, #3
	beq _081D8958
	cmp r0, #0
	bne _081D8960
_081D8958:
	movs r1, #8
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #8]
_081D8960:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D896C: .4byte 0x03005B68
	thumb_func_end sub_081D88EC

	thumb_func_start Task_RayChasesAwayEnd
Task_RayChasesAwayEnd: @ 0x081D8970
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r6, r1, #3
	ldr r7, _081D89CC
	adds r4, r6, r7
	ldr r0, _081D89D0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _081D89DC
	bl StopMapMusic
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081D89B4
	movs r0, #0
	bl SetVBlankCallback
	bl sub_081D6240
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldrb r0, [r4, #4]
	bl DestroyTask
_081D89B4:
	ldrh r1, [r4, #2]
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0x20
	bne _081D89D8
	strh r5, [r4, #2]
	adds r0, r7, #0
	subs r0, #8
	adds r0, r6, r0
	ldr r1, _081D89D4
	str r1, [r0]
	b _081D89DC
	.align 2, 0
_081D89CC: .4byte 0x03005B68
_081D89D0: .4byte 0x02037C74
_081D89D4: .4byte 0x081D617D
_081D89D8:
	adds r0, r1, #1
	strh r0, [r4, #2]
_081D89DC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end Task_RayChasesAwayEnd

	thumb_func_start sub_081D89E4
sub_081D89E4: @ 0x081D89E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081D8B94
	adds r4, r4, r0
	ldr r0, _081D8B98
	movs r1, #0x40
	movs r2, #0x78
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #6]
	movs r0, #6
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081D8B9C
	mov sl, r1
	adds r7, r0, r1
	ldr r0, _081D8BA0
	movs r1, #0x10
	movs r2, #0x82
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7]
	movs r2, #0x2e
	rsbs r2, r2, #0
	add r2, sl
	mov r8, r2
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #5]
	movs r6, #0xd
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r2
	movs r2, #4
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1, #5]
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #5]
	adds r0, r6, #0
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r5, _081D8BA4
	adds r0, r5, #0
	movs r1, #0xa0
	movs r2, #0x80
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #8]
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sl
	adds r7, r0, r1
	adds r0, r5, #0
	movs r1, #0xc0
	movs r2, #0x80
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7]
	adds r0, r5, #0
	movs r1, #0xe0
	movs r2, #0x80
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #2]
	movs r2, #8
	ldrsh r0, [r4, r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #5]
	adds r0, r6, #0
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1, #5]
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #5]
	adds r0, r6, #0
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1, #5]
	movs r1, #2
	ldrsh r0, [r7, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #5]
	adds r0, r6, #0
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1, #5]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	movs r1, #1
	bl StartSpriteAnim
	movs r2, #2
	ldrsh r1, [r7, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	movs r1, #2
	bl StartSpriteAnim
	ldr r0, _081D8BA8
	movs r2, #0x41
	rsbs r2, r2, #0
	movs r1, #0x78
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xa]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, _081D8BAC
	movs r2, #0x71
	rsbs r2, r2, #0
	movs r1, #0x78
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #5]
	adds r0, r6, #0
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1, #5]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r0, #5]
	ands r6, r1
	orrs r6, r2
	strb r6, [r0, #5]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D8B94: .4byte 0x03005B68
_081D8B98: .4byte 0x085FBF74
_081D8B9C: .4byte 0x020205DA
_081D8BA0: .4byte 0x085FBF8C
_081D8BA4: .4byte 0x085FBFA4
_081D8BA8: .4byte 0x085FBFBC
_081D8BAC: .4byte 0x085FBFD4
	thumb_func_end sub_081D89E4

	thumb_func_start sub_081D8BB0
sub_081D8BB0: @ 0x081D8BB0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	ldr r0, _081D8C68
	adds r2, r2, r0
	ldr r3, _081D8C6C
	movs r0, #6
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x1c
	adds r1, r1, r3
	mov r8, r1
	add r0, r8
	ldr r6, _081D8C70
	str r6, [r0]
	movs r0, #6
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r4, #0
	strh r4, [r0, #0x36]
	movs r0, #6
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x38]
	movs r0, #6
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r5, #4
	strh r5, [r0, #0x3a]
	movs r0, #6
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x3c]
	movs r0, #8
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	str r6, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x36]
	movs r0, #8
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r4, [r0, #0x38]
	movs r0, #8
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r5, [r0, #0x3a]
	movs r0, #8
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #1
	strh r1, [r0, #0x3c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D8C68: .4byte 0x03005B68
_081D8C6C: .4byte 0x020205AC
_081D8C70: .4byte 0x081D8C75
	thumb_func_end sub_081D8BB0

	thumb_func_start sub_081D8C74
sub_081D8C74: @ 0x081D8C74
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x36]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _081D8D08
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081D8CAC
	ldrh r0, [r4, #0x20]
	ldrh r3, [r4, #0x3a]
	subs r0, r0, r3
	strh r0, [r4, #0x20]
	ldr r2, _081D8CA8
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, r1, r3
	b _081D8CDA
	.align 2, 0
_081D8CA8: .4byte 0x020205AC
_081D8CAC:
	ldrh r2, [r4, #0x3a]
	ldrh r1, [r4, #0x20]
	adds r0, r2, r1
	strh r0, [r4, #0x20]
	ldr r3, _081D8D00
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x20]
	adds r2, r2, r1
	strh r2, [r0, #0x20]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r4, #0x3a]
	ldrh r2, [r0, #0x20]
	adds r1, r1, r2
_081D8CDA:
	strh r1, [r0, #0x20]
	ldrh r1, [r4, #0x38]
	adds r1, #1
	movs r2, #0
	strh r1, [r4, #0x38]
	ldrh r0, [r4, #0x3a]
	subs r0, r0, r1
	strh r0, [r4, #0x3a]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #3
	bne _081D8D08
	strh r2, [r4, #0x36]
	strh r2, [r4, #0x38]
	strh r2, [r4, #0x3a]
	ldr r0, _081D8D04
	str r0, [r4, #0x1c]
	b _081D8D0E
	.align 2, 0
_081D8D00: .4byte 0x020205AC
_081D8D04: .4byte 0x08007141
_081D8D08:
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
_081D8D0E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081D8C74

	thumb_func_start sub_081D8D14
sub_081D8D14: @ 0x081D8D14
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	ldr r0, _081D8D50
	adds r2, r2, r0
	ldr r3, _081D8D54
	movs r0, #6
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _081D8D58
	str r1, [r0]
	movs r0, #6
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #1
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_081D8D50: .4byte 0x03005B68
_081D8D54: .4byte 0x020205AC
_081D8D58: .4byte 0x081D8D5D
	thumb_func_end sub_081D8D14

	thumb_func_start sub_081D8D5C
sub_081D8D5C: @ 0x081D8D5C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #1
	beq _081D8DC4
	cmp r0, #1
	bgt _081D8D72
	cmp r0, #0
	beq _081D8D7C
	b _081D8E00
_081D8D72:
	cmp r0, #2
	beq _081D8D7C
	cmp r0, #3
	beq _081D8DC4
	b _081D8E00
_081D8D7C:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	movs r1, #0xc
	bl __umodsi3
	lsls r0, r0, #0x18
	ldr r2, _081D8DC0
	cmp r0, #0
	bne _081D8DAC
	ldrh r0, [r4, #0x20]
	subs r0, #2
	strh r0, [r4, #0x20]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #2
	strh r1, [r0, #0x20]
_081D8DAC:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #0x26]
	b _081D8E00
	.align 2, 0
_081D8DC0: .4byte 0x020205AC
_081D8DC4:
	ldr r2, _081D8E08
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _081D8E0C
	strh r1, [r0, #0x26]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _081D8E00
	ldrh r0, [r4, #0x22]
	adds r0, #1
	strh r0, [r4, #0x22]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	adds r1, #1
	strh r1, [r0, #0x22]
_081D8E00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D8E08: .4byte 0x020205AC
_081D8E0C: .4byte 0x0000FFFE
	thumb_func_end sub_081D8D5C

	thumb_func_start sub_081D8E10
sub_081D8E10: @ 0x081D8E10
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081D8E58
	adds r1, r1, r0
	movs r0, #8
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _081D8E5C
	adds r4, r0, r2
	subs r2, #0x12
	adds r0, r0, r2
	ldr r3, _081D8E60
	str r3, [r0]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	str r3, [r0]
	movs r0, #2
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	str r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D8E58: .4byte 0x03005B68
_081D8E5C: .4byte 0x020205DA
_081D8E60: .4byte 0x081D8E65
	thumb_func_end sub_081D8E10

	thumb_func_start sub_081D8E64
sub_081D8E64: @ 0x081D8E64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldrh r1, [r7, #0x36]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _081D8E8C
	ldrh r1, [r7, #0x24]
	movs r2, #0x24
	ldrsh r0, [r7, r2]
	cmp r0, #1
	bne _081D8E88
	ldr r0, _081D8E84
	b _081D8E8A
	.align 2, 0
_081D8E84: .4byte 0x0000FFFF
_081D8E88:
	movs r0, #1
_081D8E8A:
	strh r0, [r7, #0x24]
_081D8E8C:
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	cmp r0, #0x80
	bne _081D8F0A
	ldr r2, _081D8F2C
	mov r8, r2
	mov r0, r8
	movs r1, #0x98
	movs r2, #0x84
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0x3c]
	ldr r5, _081D8F30
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r2, [r1, #5]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	movs r6, #4
	orrs r0, r6
	strb r0, [r1, #5]
	mov r0, r8
	movs r1, #0xe0
	movs r2, #0x84
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r7, #0x3c]
	movs r2, #0x3c
	ldrsh r1, [r7, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r0, #5]
	ands r4, r1
	orrs r4, r6
	strb r4, [r0, #5]
	movs r0, #0x3c
	ldrsh r1, [r7, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	ldrh r0, [r7, #0x38]
	adds r0, #1
	strh r0, [r7, #0x38]
_081D8F0A:
	ldrh r1, [r7, #0x38]
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	cmp r0, #0x7f
	ble _081D8F34
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	cmp r0, #0x20
	beq _081D8F38
	ldrh r0, [r7, #0x3a]
	adds r0, #1
	strh r0, [r7, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r7, #0x26]
	b _081D8F38
	.align 2, 0
_081D8F2C: .4byte 0x085FBFEC
_081D8F30: .4byte 0x020205AC
_081D8F34:
	adds r0, r1, #1
	strh r0, [r7, #0x38]
_081D8F38:
	ldrh r0, [r7, #0x36]
	movs r1, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _081D8F48
	movs r0, #0xa5
	bl PlaySE
_081D8F48:
	ldrh r0, [r7, #0x36]
	adds r0, #1
	strh r0, [r7, #0x36]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D8E64

	thumb_func_start sub_081D8F58
sub_081D8F58: @ 0x081D8F58
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	cmp r1, #0x40
	bgt _081D8FC8
	ldrh r0, [r4, #0x26]
	adds r0, #2
	strh r0, [r4, #0x26]
	ldr r5, _081D8FC0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x26]
	adds r1, #2
	strh r1, [r0, #0x26]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	beq _081D8F88
	b _081D90DA
_081D8F88:
	movs r3, #0x30
	rsbs r3, r3, #0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl sub_081D91A4
	movs r2, #5
	strh r2, [r4, #0x36]
	ldr r0, _081D8FC4
	strh r0, [r4, #0x38]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #3
	strh r1, [r0, #0x36]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x38]
	b _081D90DA
	.align 2, 0
_081D8FC0: .4byte 0x020205AC
_081D8FC4: .4byte 0x0000FFFF
_081D8FC8:
	cmp r1, #0x6f
	bgt _081D8FFA
	adds r0, r4, #0
	bl sub_081D911C
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081D8FE0
	movs r0, #0x68
	bl PlaySE
_081D8FE0:
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _081D90DA
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x30
	movs r3, #0x10
	bl sub_081D91A4
	b _081D90DA
_081D8FFA:
	cmp r1, #0x70
	bne _081D9028
	ldr r2, _081D9024
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #7
	strh r1, [r0, #0x36]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strh r1, [r0, #0x38]
	b _081D902E
	.align 2, 0
_081D9024: .4byte 0x020205AC
_081D9028:
	ldr r0, _081D9038
	cmp r1, r0
	bgt _081D903C
_081D902E:
	adds r0, r4, #0
	bl sub_081D911C
	b _081D90DA
	.align 2, 0
_081D9038: .4byte 0x00000147
_081D903C:
	movs r0, #0xa4
	lsls r0, r0, #1
	cmp r1, r0
	bne _081D9088
	adds r0, r4, #0
	bl sub_081D911C
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x30
	movs r3, #0x10
	bl sub_081D91A4
	movs r3, #1
	strh r3, [r4, #0x24]
	ldr r2, _081D9080
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x24]
	movs r0, #0xcb
	lsls r0, r0, #1
	movs r1, #0
	bl PlayCry1
	ldr r0, _081D9084
	movs r1, #0
	bl CreateTask
	b _081D90DA
	.align 2, 0
_081D9080: .4byte 0x020205AC
_081D9084: .4byte 0x081D91F1
_081D9088:
	movs r0, #0xb0
	lsls r0, r0, #1
	cmp r1, r0
	beq _081D90CC
	adds r0, #0x18
	cmp r1, r0
	bne _081D90DA
	movs r3, #0
	strh r3, [r4, #0x24]
	ldr r2, _081D90C4
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r3, [r0, #0x24]
	adds r0, r4, #0
	bl sub_081D911C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x30
	movs r3, #0x10
	bl sub_081D91A4
	ldr r0, _081D90C8
	str r0, [r4, #0x1c]
	b _081D910E
	.align 2, 0
_081D90C4: .4byte 0x020205AC
_081D90C8: .4byte 0x081D911D
_081D90CC:
	ldr r0, _081D9114
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_081D8BB0
_081D90DA:
	ldrh r2, [r4, #0x3c]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r0, #0xa4
	lsls r0, r0, #1
	cmp r1, r0
	ble _081D9108
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _081D9108
	movs r1, #0x24
	ldrsh r2, [r4, r1]
	rsbs r2, r2, #0
	strh r2, [r4, #0x24]
	ldr r3, _081D9118
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x24]
_081D9108:
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
_081D910E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D9114: .4byte 0x081D87BD
_081D9118: .4byte 0x020205AC
	thumb_func_end sub_081D8F58

	thumb_func_start sub_081D911C
sub_081D911C: @ 0x081D911C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _081D917C
	adds r4, r0, r5
	ldrh r1, [r3, #0x3a]
	ldrh r0, [r4, #0x36]
	ands r0, r1
	cmp r0, #0
	bne _081D9198
	ldrh r2, [r3, #0x36]
	ldrh r1, [r3, #0x26]
	adds r0, r2, r1
	strh r0, [r3, #0x26]
	movs r7, #0x2e
	ldrsh r1, [r3, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x26]
	adds r2, r2, r1
	strh r2, [r0, #0x26]
	ldrh r0, [r3, #0x38]
	ldrh r2, [r3, #0x36]
	adds r0, r0, r2
	strh r0, [r3, #0x36]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldrh r6, [r4, #0x38]
	movs r7, #0x38
	ldrsh r2, [r4, r7]
	cmp r5, r2
	bge _081D9172
	movs r0, #0x36
	ldrsh r1, [r3, r0]
	adds r0, r2, #0
	cmn r1, r0
	bgt _081D9198
_081D9172:
	cmp r5, r2
	ble _081D9180
	strh r6, [r3, #0x36]
	b _081D9190
	.align 2, 0
_081D917C: .4byte 0x020205AC
_081D9180:
	movs r0, #0x36
	ldrsh r1, [r3, r0]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmn r1, r0
	bge _081D9190
	rsbs r0, r6, #0
	strh r0, [r3, #0x36]
_081D9190:
	movs r7, #0x38
	ldrsh r0, [r3, r7]
	rsbs r0, r0, #0
	strh r0, [r3, #0x38]
_081D9198:
	ldrh r0, [r3, #0x3a]
	adds r0, #1
	strh r0, [r3, #0x3a]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D911C

	thumb_func_start sub_081D91A4
sub_081D91A4: @ 0x081D91A4
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r4, #0x2e
	ldrsh r1, [r0, r4]
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	ldr r1, _081D91EC
	adds r4, r4, r1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r1, [r0, #0x20]
	adds r2, r2, r1
	strh r2, [r4, #0x20]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldrh r1, [r0, #0x22]
	adds r3, r3, r1
	strh r3, [r4, #0x22]
	ldrh r1, [r0, #0x24]
	strh r1, [r4, #0x24]
	ldrh r1, [r0, #0x26]
	strh r1, [r4, #0x26]
	adds r1, r5, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartSpriteAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D91EC: .4byte 0x020205AC
	thumb_func_end sub_081D91A4

	thumb_func_start sub_081D91F0
sub_081D91F0: @ 0x081D91F0
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081D9214
	adds r4, r0, r1
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _081D9248
	cmp r1, #1
	bgt _081D9218
	cmp r1, #0
	beq _081D921E
	b _081D92F0
	.align 2, 0
_081D9214: .4byte 0x03005B68
_081D9218:
	cmp r1, #2
	beq _081D92E0
	b _081D92F0
_081D921E:
	movs r2, #0x80
	lsls r2, r2, #7
	movs r0, #0x40
	str r0, [sp]
	adds r0, #0xc0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #2
	adds r1, r2, #0
	movs r3, #0x78
	bl SetBgAffine
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl SetGpuRegBits
	movs r0, #0x10
	strh r0, [r4, #8]
	b _081D925E
_081D9248:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #8
	bne _081D9256
	movs r0, #0x12
	bl PlaySE
_081D9256:
	movs r3, #4
	ldrsh r0, [r4, r3]
	cmp r0, #2
	bne _081D9266
_081D925E:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _081D92F0
_081D9266:
	ldrh r5, [r4, #8]
	ldrh r1, [r4, #2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r3, #6
	ldrsh r0, [r4, r3]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _081D9290
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	beq _081D9290
	subs r0, r5, #2
	strh r0, [r4, #8]
_081D9290:
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
	movs r2, #0x80
	lsls r2, r2, #7
	movs r0, #0x40
	str r0, [sp]
	ldrh r0, [r4, #2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r0, [r4, #2]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #8]
	movs r5, #0
	str r5, [sp, #0xc]
	movs r0, #2
	adds r1, r2, #0
	movs r3, #0x78
	bl SetBgAffine
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0xff
	ble _081D92F0
	strh r5, [r4, #2]
	strh r5, [r4, #6]
	strh r5, [r4, #0xa]
	movs r0, #0x10
	strh r0, [r4, #8]
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	b _081D92F0
_081D92E0:
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0
	bl ClearGpuRegBits
	adds r0, r5, #0
	bl DestroyTask
_081D92F0:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_081D91F0

