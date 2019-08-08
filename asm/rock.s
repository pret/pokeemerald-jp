.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08111240
sub_08111240: @ 0x08111240
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _081112AC
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _08111260
	ldr r0, _081112B0
	ldrb r0, [r0]
	adds r2, r5, #0
	adds r2, #0x20
	adds r3, r5, #0
	adds r3, #0x22
	movs r1, #0
	bl SetAverageBattlerPositions
_08111260:
	ldrh r0, [r6]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	movs r4, #0
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x22]
	adds r0, #0xe
	strh r0, [r5, #0x22]
	ldrb r1, [r6, #2]
	adds r0, r5, #0
	bl StartSpriteAnim
	adds r0, r5, #0
	bl AnimateSprite
	strh r4, [r5, #0x2e]
	strh r4, [r5, #0x30]
	movs r0, #4
	strh r0, [r5, #0x32]
	movs r0, #0x10
	strh r0, [r5, #0x34]
	ldr r0, _081112B4
	strh r0, [r5, #0x36]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x38]
	ldr r1, _081112B8
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	ldr r1, _081112BC
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081112AC: .4byte 0x020380BE
_081112B0: .4byte 0x020380D7
_081112B4: .4byte 0x0000FFBA
_081112B8: .4byte 0x081112C1
_081112BC: .4byte 0x080A5D19
	thumb_func_end sub_08111240

	thumb_func_start sub_081112C0
sub_081112C0: @ 0x081112C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x38]
	ldrh r2, [r4, #0x20]
	adds r0, r1, r2
	strh r0, [r4, #0x20]
	movs r0, #0xc0
	strh r0, [r4, #0x2e]
	strh r1, [r4, #0x30]
	movs r0, #4
	strh r0, [r4, #0x32]
	movs r0, #0x20
	strh r0, [r4, #0x34]
	ldr r0, _081112F8
	strh r0, [r4, #0x36]
	ldr r1, _081112FC
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r1, _08111300
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081112F8: .4byte 0x0000FFE8
_081112FC: .4byte 0x080A6015
_08111300: .4byte 0x080A5D19
	thumb_func_end sub_081112C0

	thumb_func_start sub_08111304
sub_08111304: @ 0x08111304
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0811132C
	ldrb r1, [r4, #0xa]
	bl StartSpriteAnim
	adds r0, r5, #0
	bl AnimateSprite
	ldr r0, _08111330
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08111334
	ldrh r0, [r5, #0x20]
	ldrh r1, [r4]
	subs r0, r0, r1
	b _0811133A
	.align 2, 0
_0811132C: .4byte 0x020380BE
_08111330: .4byte 0x020380D6
_08111334:
	ldrh r0, [r4]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
_0811133A:
	strh r0, [r5, #0x20]
	ldr r3, _0811137C
	ldrh r2, [r3, #2]
	ldrh r0, [r5, #0x22]
	adds r2, r2, r0
	movs r4, #0
	strh r2, [r5, #0x22]
	ldrh r0, [r3, #8]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x20]
	strh r0, [r5, #0x30]
	ldrh r1, [r3, #4]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	strh r2, [r5, #0x34]
	ldrh r0, [r3, #6]
	adds r2, r2, r0
	strh r2, [r5, #0x36]
	adds r0, r5, #0
	bl InitSpriteDataForLinearTranslation
	strh r4, [r5, #0x34]
	strh r4, [r5, #0x36]
	ldr r0, _08111380
	str r0, [r5, #0x1c]
	ldr r1, _08111384
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811137C: .4byte 0x020380BE
_08111380: .4byte 0x080A5E35
_08111384: .4byte 0x080A6015
	thumb_func_end sub_08111304

	thumb_func_start sub_08111388
sub_08111388: @ 0x08111388
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _081113A0
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _081113A4
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	b _081113AC
	.align 2, 0
_081113A0: .4byte 0x020380BE
_081113A4:
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
_081113AC:
	ldr r1, _081113C8
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #0xa]
	strh r0, [r4, #0x34]
	ldr r0, _081113CC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081113C8: .4byte 0x020380BE
_081113CC: .4byte 0x081113D1
	thumb_func_end sub_08111388

	thumb_func_start sub_081113D0
sub_081113D0: @ 0x081113D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	ldrh r1, [r4, #0x38]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08111416
	adds r0, r4, #0
	bl DestroyAnimSprite
_08111416:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_081113D0

	thumb_func_start AnimTask_LoadSandstormBackground
AnimTask_LoadSandstormBackground: @ 0x0811141C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	ldr r1, _081114D8
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08111460
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_08111460:
	ldr r0, _081114DC
	strh r5, [r0]
	ldr r4, _081114E0
	strh r5, [r4]
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x16
	bl SetGpuReg
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _081114E4
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r1, _081114E8
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	ldr r0, _081114EC
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r0, _081114F0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _081114BE
	ldr r0, _081114F4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081114BE
	movs r5, #1
_081114BE:
	ldr r0, _081114F8
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r5, [r1, #8]
	ldr r0, _081114FC
	str r0, [r1]
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081114D8: .4byte 0x00003F42
_081114DC: .4byte 0x02022ACC
_081114E0: .4byte 0x02022ACE
_081114E4: .4byte 0x08D8D570
_081114E8: .4byte 0x08D8D3F4
_081114EC: .4byte 0x08D8DA9C
_081114F0: .4byte 0x020380BE
_081114F4: .4byte 0x020380D6
_081114F8: .4byte 0x03005B60
_081114FC: .4byte 0x08111501
	thumb_func_end AnimTask_LoadSandstormBackground

	thumb_func_start sub_08111500
sub_08111500: @ 0x08111500
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08111528
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #0
	bne _08111534
	ldr r1, _0811152C
	ldr r3, _08111530
	adds r0, r3, #0
	ldrh r3, [r1]
	adds r0, r0, r3
	b _0811153A
	.align 2, 0
_08111528: .4byte 0x03005B60
_0811152C: .4byte 0x02022ACC
_08111530: .4byte 0x0000FFFA
_08111534:
	ldr r1, _08111568
	ldrh r0, [r1]
	adds r0, #6
_0811153A:
	strh r0, [r1]
	ldr r1, _0811156C
	ldr r3, _08111570
	adds r0, r3, #0
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r3, #0x20
	ldrsh r0, [r0, r3]
	adds r4, r1, #0
	cmp r0, #4
	bls _0811155C
	b _0811168A
_0811155C:
	lsls r0, r0, #2
	ldr r1, _08111574
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08111568: .4byte 0x02022ACC
_0811156C: .4byte 0x02022ACE
_08111570: .4byte 0x0000FFFF
_08111574: .4byte 0x08111578
_08111578: @ jump table
	.4byte _0811158C @ case 0
	.4byte _081115CE @ case 1
	.4byte _081115E8 @ case 2
	.4byte _0811162A @ case 3
	.4byte _0811164C @ case 4
_0811158C:
	adds r0, r4, r5
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0811168A
	strh r5, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	adds r1, #1
	strh r1, [r4, #0x1e]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #7
	bne _0811168A
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r5, [r4, #0x1e]
	b _0811168A
_081115CE:
	adds r0, r4, r5
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x65
	bne _0811168A
	movs r0, #7
	strh r0, [r1, #0x1e]
	b _08111640
_081115E8:
	adds r0, r4, r5
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0811168A
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	subs r1, #1
	strh r1, [r4, #0x1e]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r2, #0x1e
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bne _0811168A
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	strh r1, [r4, #0x1e]
	b _0811168A
_0811162A:
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	bl sub_080A6530
	ldr r0, _08111648
	adds r1, r4, r5
	lsls r1, r1, #3
	adds r1, r1, r0
_08111640:
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
	b _0811168A
	.align 2, 0
_08111648: .4byte 0x03005B60
_0811164C:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08111660
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_08111660:
	ldr r0, _08111694
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08111698
	strh r1, [r0]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_0811168A:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111694: .4byte 0x02022ACC
_08111698: .4byte 0x02022ACE
	thumb_func_end sub_08111500

	thumb_func_start AnimDirtParticleAcrossScreen
AnimDirtParticleAcrossScreen: @ 0x0811169C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08111718
	ldr r4, _081116E0
	movs r2, #6
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _081116E8
	ldr r0, _081116E4
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081116E8
	movs r0, #0x98
	lsls r0, r0, #1
	strh r0, [r5, #0x20]
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
	movs r0, #1
	strh r0, [r5, #0x38]
	ldrb r1, [r5, #3]
	subs r0, #0x40
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #3]
	b _081116EC
	.align 2, 0
_081116E0: .4byte 0x020380BE
_081116E4: .4byte 0x020380D6
_081116E8:
	ldr r0, _0811170C
	strh r0, [r5, #0x20]
_081116EC:
	ldr r4, _08111710
	ldrh r0, [r4]
	strh r0, [r5, #0x22]
	ldr r1, _08111714
	adds r0, r5, #0
	bl SetSubspriteTables
	ldrh r0, [r4, #2]
	strh r0, [r5, #0x30]
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	b _08111774
	.align 2, 0
_0811170C: .4byte 0x0000FFC0
_08111710: .4byte 0x020380BE
_08111714: .4byte 0x085727A4
_08111718:
	ldrh r1, [r5, #0x30]
	ldrh r3, [r5, #0x34]
	adds r1, r1, r3
	ldrh r2, [r5, #0x32]
	ldrh r0, [r5, #0x36]
	adds r2, r2, r0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	ldrh r3, [r5, #0x24]
	adds r0, r0, r3
	strh r0, [r5, #0x24]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	ldrh r3, [r5, #0x26]
	adds r0, r0, r3
	strh r0, [r5, #0x26]
	movs r0, #0xff
	ands r1, r0
	strh r1, [r5, #0x34]
	ands r2, r0
	strh r2, [r5, #0x36]
	movs r1, #0x38
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0811175E
	movs r2, #0x20
	ldrsh r0, [r5, r2]
	movs r3, #0x24
	ldrsh r1, [r5, r3]
	adds r0, r0, r1
	movs r1, #0x88
	lsls r1, r1, #1
	cmp r0, r1
	ble _08111774
	b _08111770
_0811175E:
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	movs r2, #0x24
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08111774
_08111770:
	ldr r0, _0811177C
	str r0, [r5, #0x1c]
_08111774:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811177C: .4byte 0x080A34C5
	thumb_func_end AnimDirtParticleAcrossScreen

	thumb_func_start AnimRaiseSprite
AnimRaiseSprite: @ 0x08111780
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _081117B8
	ldrb r1, [r5, #8]
	bl StartSpriteAnim
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x32]
	ldrh r0, [r5, #4]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	ldr r0, _081117BC
	str r0, [r4, #0x1c]
	ldr r1, _081117C0
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081117B8: .4byte 0x020380BE
_081117BC: .4byte 0x080A67B5
_081117C0: .4byte 0x080A34C5
	thumb_func_end AnimRaiseSprite

	thumb_func_start sub_081117C4
sub_081117C4: @ 0x081117C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08111844
	adds r6, r1, r0
	ldr r5, _08111848
	ldrb r0, [r5]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	movs r1, #0xc0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	ldr r4, _0811184C
	ldrb r0, [r4]
	movs r1, #2
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldrb r0, [r4]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	movs r2, #0xc0
	lsls r2, r2, #0xd
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r1, [r5]
	movs r0, #2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _08111834
	mov r8, r7
_08111834:
	bl sub_08111BAC
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _08111850
	movs r0, #0x20
	b _08111856
	.align 2, 0
_08111844: .4byte 0x03005B60
_08111848: .4byte 0x020380D6
_0811184C: .4byte 0x020380D7
_08111850:
	lsls r1, r5, #3
	movs r0, #0x30
	subs r0, r0, r1
_08111856:
	strh r0, [r6, #0x18]
	movs r4, #0
	strh r4, [r6, #8]
	strh r4, [r6, #0x1e]
	strh r4, [r6, #0x1a]
	movs r0, #1
	strh r0, [r6, #0x20]
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _0811186E
	adds r0, #7
_0811186E:
	asrs r0, r0, #3
	subs r0, #1
	strh r0, [r6, #0x1c]
	mov r2, sb
	lsls r0, r2, #3
	strh r0, [r6, #0xc]
	lsls r0, r7, #3
	strh r0, [r6, #0xe]
	mov r1, sl
	subs r0, r1, r2
	lsls r0, r0, #3
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, #0x10]
	mov r1, r8
	subs r0, r1, r7
	lsls r0, r0, #3
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, #0x12]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x16]
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #8
	lsrs r4, r4, #0x10
	movs r0, #0x3f
	bl BattleAnimAdjustPanning
	lsls r0, r0, #0x18
	strh r4, [r6, #0x22]
	asrs r0, r0, #0x18
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r0, r0, r4
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, #0x24]
	strh r5, [r6, #0xa]
	movs r0, #0
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x26]
	ldr r0, _081118F0
	str r0, [r6]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081118F0: .4byte 0x081118F5
	thumb_func_end sub_081117C4

	thumb_func_start sub_081118F4
sub_081118F4: @ 0x081118F4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08111918
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bls _0811190E
	b _08111A5C
_0811190E:
	lsls r0, r0, #2
	ldr r1, _0811191C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08111918: .4byte 0x03005B60
_0811191C: .4byte 0x08111920
_08111920: @ jump table
	.4byte _08111934 @ case 0
	.4byte _08111998 @ case 1
	.4byte _081119A0 @ case 2
	.4byte _081119FC @ case 3
	.4byte _08111A4E @ case 4
_08111934:
	ldrh r2, [r4, #0x14]
	ldrh r0, [r4, #0x10]
	subs r2, r2, r0
	strh r2, [r4, #0x14]
	ldrh r0, [r4, #0x16]
	ldrh r1, [r4, #0x12]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r3, _08111994
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	strh r2, [r0, #0x24]
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r0, [r4, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	strh r0, [r1, #0x26]
	ldrh r0, [r4, #0x1a]
	adds r0, #1
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _08111984
	movs r0, #0x14
	strh r0, [r4, #0x1e]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_08111984:
	ldrh r1, [r4, #0x22]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xa2
	bl PlaySE12WithPanning
	b _08111A5C
	.align 2, 0
_08111994: .4byte 0x020205AC
_08111998:
	ldrh r0, [r4, #0x1e]
	subs r0, #1
	strh r0, [r4, #0x1e]
	b _08111A40
_081119A0:
	ldrh r0, [r4, #0x1a]
	subs r0, #1
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _081119C0
	ldrh r0, [r4, #0x10]
	ldrh r2, [r4, #0x14]
	adds r0, r0, r2
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x12]
	ldrh r1, [r4, #0x16]
	adds r0, r0, r1
	strh r0, [r4, #0x16]
	b _081119CA
_081119C0:
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x16]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_081119CA:
	ldr r2, _081119F8
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	strh r0, [r1, #0x24]
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r4, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	strh r0, [r1, #0x26]
	b _08111A5C
	.align 2, 0
_081119F8: .4byte 0x020205AC
_081119FC:
	ldrh r0, [r4, #0x10]
	ldrh r2, [r4, #0xc]
	adds r0, r0, r2
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x12]
	ldrh r1, [r4, #0xe]
	adds r0, r0, r1
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0x1a]
	adds r0, #1
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x1c
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08111A3A
	movs r0, #0
	strh r0, [r4, #0x1a]
	adds r0, r4, #0
	bl sub_08111A64
	ldrh r1, [r4, #0x24]
	ldrh r0, [r4, #0x22]
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xaf
	bl PlaySE12WithPanning
_08111A3A:
	ldrh r0, [r4, #0x18]
	subs r0, #1
	strh r0, [r4, #0x18]
_08111A40:
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08111A5C
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08111A5C
_08111A4E:
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08111A5C
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08111A5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081118F4

	thumb_func_start sub_08111A64
sub_08111A64: @ 0x08111A64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _08111B54
	lsls r0, r0, #2
	ldr r1, _08111A80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08111A80: .4byte 0x08111A84
_08111A84: @ jump table
	.4byte _08111A98 @ case 0
	.4byte _08111AA4 @ case 1
	.4byte _08111AA4 @ case 2
	.4byte _08111AB0 @ case 3
	.4byte _08111ABC @ case 4
_08111A98:
	ldr r3, _08111AA0
	movs r5, #0
	b _08111AC0
	.align 2, 0
_08111AA0: .4byte 0x0857280C
_08111AA4:
	ldr r3, _08111AAC
	movs r5, #0x50
	b _08111AC0
	.align 2, 0
_08111AAC: .4byte 0x08572824
_08111AB0:
	ldr r3, _08111AB8
	movs r5, #0x40
	b _08111AC0
	.align 2, 0
_08111AB8: .4byte 0x08572824
_08111ABC:
	ldr r3, _08111B5C
	movs r5, #0x30
_08111AC0:
	ldrh r1, [r4, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x13
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	lsls r2, r2, #0x10
	movs r6, #0x20
	ldrsh r0, [r4, r6]
	lsls r0, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	lsrs r7, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	movs r3, #0x23
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _08111B4C
	ldr r1, _08111B60
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x12
	strh r1, [r0, #0x2e]
	movs r2, #0x20
	ldrsh r1, [r4, r2]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r6, r2
	movs r6, #0xa
	ldrsh r3, [r4, r6]
	lsls r1, r3, #1
	adds r1, r1, r3
	adds r2, r2, r1
	strh r2, [r0, #0x32]
	strh r7, [r0, #0x36]
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	lsls r2, r2, #1
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r1, r3, #0
	subs r1, r1, r2
	strh r1, [r0, #0x38]
	ldrh r3, [r0, #4]
	lsls r2, r3, #0x16
	lsrs r2, r2, #0x16
	adds r2, r2, r5
	ldr r5, _08111B64
	adds r1, r5, #0
	ands r2, r1
	ldr r1, _08111B68
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, #4]
	bl InitAnimArcTranslation
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
_08111B4C:
	movs r6, #0x20
	ldrsh r0, [r4, r6]
	rsbs r0, r0, #0
	strh r0, [r4, #0x20]
_08111B54:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111B5C: .4byte 0x08572824
_08111B60: .4byte 0x020205AC
_08111B64: .4byte 0x000003FF
_08111B68: .4byte 0xFFFFFC00
	thumb_func_end sub_08111A64

	thumb_func_start sub_08111B6C
sub_08111B6C: @ 0x08111B6C
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08111B9E
	ldr r0, _08111BA4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08111B98
	ldr r0, _08111BA8
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x1e]
	subs r0, #1
	strh r0, [r1, #0x1e]
_08111B98:
	adds r0, r4, #0
	bl DestroySprite
_08111B9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111BA4: .4byte 0x081118F5
_08111BA8: .4byte 0x03005B60
	thumb_func_end sub_08111B6C

	thumb_func_start sub_08111BAC
sub_08111BAC: @ 0x08111BAC
	push {lr}
	ldr r0, _08111BD4
	ldr r0, [r0]
	ldrb r1, [r0, #0x11]
	lsrs r0, r1, #4
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08111BCE
	movs r1, #1
_08111BCE:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08111BD4: .4byte 0x020380A0
	thumb_func_end sub_08111BAC

	thumb_func_start sub_08111BD8
sub_08111BD8: @ 0x08111BD8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08111C10
	ldrb r1, [r5, #8]
	bl StartSpriteAnim
	ldrh r0, [r5]
	strh r0, [r4, #0x24]
	ldrh r0, [r5, #2]
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x34]
	ldrh r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x34]
	movs r0, #3
	strh r0, [r4, #0x2e]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x30]
	ldr r0, _08111C14
	str r0, [r4, #0x1c]
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111C10: .4byte 0x020380BE
_08111C14: .4byte 0x08111C19
	thumb_func_end sub_08111BD8

	thumb_func_start sub_08111C18
sub_08111C18: @ 0x08111C18
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, #0x34]
	movs r3, #0x34
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08111C50
	ldrh r3, [r2, #0x32]
	adds r0, r1, r3
	strh r0, [r2, #0x26]
	ldrh r0, [r2, #0x2e]
	adds r1, r1, r0
	strh r1, [r2, #0x34]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r1, r1, #0x10
	cmp r1, #0
	ble _08111C62
	movs r0, #0
	strh r0, [r2, #0x34]
	b _08111C62
_08111C50:
	ldrh r0, [r2, #0x30]
	subs r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08111C62
	adds r0, r2, #0
	bl DestroyAnimSprite
_08111C62:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08111C18

	thumb_func_start sub_08111C68
sub_08111C68: @ 0x08111C68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08111C90
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08111C84
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_08111C84:
	adds r0, r4, #0
	bl TranslateAnimSpriteToTargetMonLocation
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08111C90: .4byte 0x020380D6
	thumb_func_end sub_08111C68

	thumb_func_start sub_08111C94
sub_08111C94: @ 0x08111C94
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08111CE0
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08111CE4
	ldrh r3, [r2]
	ldrh r5, [r4, #0x20]
	adds r1, r3, r5
	strh r1, [r4, #0x20]
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	strh r3, [r4, #0x30]
	strh r1, [r4, #0x32]
	ldrh r0, [r2, #4]
	strh r0, [r4, #0x38]
	ldrb r1, [r2, #6]
	adds r0, r4, #0
	bl StartSpriteAnim
	ldr r0, _08111CE8
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111CE0: .4byte 0x020380D7
_08111CE4: .4byte 0x020380BE
_08111CE8: .4byte 0x08111CED
	thumb_func_end sub_08111C94

	thumb_func_start sub_08111CEC
sub_08111CEC: @ 0x08111CEC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #8
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x34]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	ldrh r2, [r4, #0x36]
	adds r0, r0, r2
	strh r0, [r4, #0x36]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r1, #0x28
	bl __divsi3
	ldrh r1, [r4, #0x24]
	adds r1, r1, r0
	strh r1, [r4, #0x24]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x26]
	subs r1, r1, r0
	strh r1, [r4, #0x26]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x8c
	ble _08111D36
	adds r0, r4, #0
	bl DestroyAnimSprite
_08111D36:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08111CEC

	thumb_func_start AnimTask_GetSeismicTossDamageLevel
AnimTask_GetSeismicTossDamageLevel: @ 0x08111D3C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _08111D74
	ldr r0, [r2]
	cmp r0, #0x20
	bgt _08111D50
	ldr r1, _08111D78
	movs r0, #0
	strh r0, [r1, #0xe]
_08111D50:
	ldr r2, [r2]
	adds r0, r2, #0
	subs r0, #0x21
	cmp r0, #0x20
	bhi _08111D60
	ldr r1, _08111D78
	movs r0, #1
	strh r0, [r1, #0xe]
_08111D60:
	cmp r2, #0x41
	ble _08111D6A
	ldr r1, _08111D78
	movs r0, #2
	strh r0, [r1, #0xe]
_08111D6A:
	adds r0, r3, #0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08111D74: .4byte 0x020380A4
_08111D78: .4byte 0x020380BE
	thumb_func_end AnimTask_GetSeismicTossDamageLevel

	thumb_func_start sub_08111D7C
sub_08111D7C: @ 0x08111D7C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08111DD8
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08111D9E
	movs r0, #0
	bl sub_080A6674
	movs r0, #0xc8
	strh r0, [r5, #0xa]
_08111D9E:
	ldr r4, _08111DDC
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r4]
	ldrh r0, [r5, #0xa]
	subs r0, #3
	strh r0, [r5, #0xa]
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _08111DCA
	movs r0, #1
	bl sub_080A6674
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_08111DCA:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08111DD8: .4byte 0x03005B60
_08111DDC: .4byte 0x02022AD6
	thumb_func_end sub_08111D7C

	thumb_func_start sub_08111DE0
sub_08111DE0: @ 0x08111DE0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _08111E4C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08111E0C
	movs r0, #0
	bl sub_080A6674
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldr r0, _08111E50
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
_08111E0C:
	ldrh r0, [r4, #0xa]
	adds r0, #0x50
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0xa]
	ldr r6, _08111E50
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	movs r0, #4
	bl Cos
	ldrh r4, [r4, #0xc]
	adds r0, r0, r4
	strh r0, [r6]
	ldr r0, _08111E54
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	ldr r0, _08111E58
	cmp r1, r0
	bne _08111E44
	movs r0, #0
	strh r0, [r6]
	movs r0, #1
	bl sub_080A6674
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08111E44:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08111E4C: .4byte 0x03005B60
_08111E50: .4byte 0x02022AD6
_08111E54: .4byte 0x020380BE
_08111E58: .4byte 0x00000FFF
	thumb_func_end sub_08111DE0

