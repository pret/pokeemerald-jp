.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start TaskDummy1
TaskDummy1: @ 0x080D6E94
	bx lr
	.align 2, 0
	thumb_func_end TaskDummy1

	thumb_func_start ResetLinkContestBoolean
ResetLinkContestBoolean: @ 0x080D6E98
	ldr r1, _080D6EA0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080D6EA0: .4byte 0x02039BCA
	thumb_func_end ResetLinkContestBoolean

	thumb_func_start SetupContestGpuRegs
SetupContestGpuRegs: @ 0x080D6EA4
	push {r4, lr}
	movs r0, #0
	movs r1, #0x40
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
	ldr r4, _080D6F1C
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	movs r1, #0xfe
	lsls r1, r1, #7
	movs r0, #0
	bl SetGpuRegBits
	ldr r0, _080D6F20
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080D6F24
	strh r1, [r0]
	ldr r0, _080D6F28
	strh r1, [r0]
	ldr r0, _080D6F2C
	strh r1, [r0]
	ldr r0, _080D6F30
	strh r1, [r0]
	ldr r0, _080D6F34
	strh r1, [r0]
	ldr r0, _080D6F38
	strh r1, [r0]
	ldr r0, _080D6F3C
	strh r1, [r0]
	ldr r0, _080D6F40
	strh r1, [r0]
	ldr r0, _080D6F44
	strh r1, [r0]
	ldr r0, _080D6F48
	strh r1, [r0]
	ldr r0, _080D6F4C
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6F1C: .4byte 0x00003F3F
_080D6F20: .4byte 0x02022AC8
_080D6F24: .4byte 0x02022ACA
_080D6F28: .4byte 0x02022ACC
_080D6F2C: .4byte 0x02022ACE
_080D6F30: .4byte 0x02022AD0
_080D6F34: .4byte 0x02022AD2
_080D6F38: .4byte 0x02022AD4
_080D6F3C: .4byte 0x02022AD6
_080D6F40: .4byte 0x02022AD8
_080D6F44: .4byte 0x02022ADA
_080D6F48: .4byte 0x02022ADC
_080D6F4C: .4byte 0x02022ADE
	thumb_func_end SetupContestGpuRegs

	thumb_func_start LoadContestBgAfterMoveAnim
LoadContestBgAfterMoveAnim: @ 0x080D6F50
	push {r4, r5, lr}
	ldr r0, _080D6FAC
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZDecompressWram
	ldr r0, _080D6FB0
	ldr r1, _080D6FB4
	bl LZDecompressWram
	ldr r1, _080D6FB8
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	ldr r0, _080D6FBC
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl LoadCompressedPalette
	bl sub_080D7058
	movs r4, #0
	movs r5, #0xa0
_080D6F8A:
	ldr r0, _080D6FC0
	adds r0, r5, r0
	ldr r1, _080D6FC4
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadPalette
	adds r5, #0x20
	adds r4, #1
	cmp r4, #3
	ble _080D6F8A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6FAC: .4byte 0x08C17AB8
_080D6FB0: .4byte 0x08C18650
_080D6FB4: .4byte 0x06002000
_080D6FB8: .4byte 0x08C16FB0
_080D6FBC: .4byte 0x08C16E98
_080D6FC0: .4byte 0x0201A004
_080D6FC4: .4byte 0x02039BC6
	thumb_func_end LoadContestBgAfterMoveAnim

	thumb_func_start InitContestInfoBgs
InitContestInfoBgs: @ 0x080D6FC8
	push {r4, lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080D7008
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	movs r0, #3
	movs r1, #6
	movs r2, #1
	bl SetBgAttribute
	movs r4, #0
_080D6FE6:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080D700C
	ldr r1, [r1]
	lsls r2, r4, #2
	adds r1, #0x24
	adds r1, r1, r2
	ldr r1, [r1]
	bl SetBgTilemapBuffer
	adds r4, #1
	cmp r4, #3
	ble _080D6FE6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7008: .4byte 0x08560E98
_080D700C: .4byte 0x02039BD4
	thumb_func_end InitContestInfoBgs

	thumb_func_start InitContestWindows
InitContestWindows: @ 0x080D7010
	push {lr}
	ldr r0, _080D7038
	bl InitWindows
	bl DeactivateAllTextPrinters
	ldr r0, _080D703C
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D7044
	ldr r2, _080D7040
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _080D704E
	.align 2, 0
_080D7038: .4byte 0x08560EA8
_080D703C: .4byte 0x02039BCA
_080D7040: .4byte 0x030030B4
_080D7044:
	ldr r0, _080D7054
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
_080D704E:
	pop {r0}
	bx r0
	.align 2, 0
_080D7054: .4byte 0x030030B4
	thumb_func_end InitContestWindows

	thumb_func_start sub_080D7058
sub_080D7058: @ 0x080D7058
	push {r4, r5, lr}
	ldr r0, _080D709C
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	movs r1, #0
	movs r2, #2
	bl FillPalette
	movs r5, #0xa
	movs r4, #0xfa
	lsls r4, r4, #0x10
_080D7074:
	lsrs r1, r4, #0x10
	ldr r0, _080D70A0
	movs r2, #2
	bl LoadPalette
	movs r0, #0x80
	lsls r0, r0, #9
	adds r4, r4, r0
	adds r5, #1
	cmp r5, #0xd
	ble _080D7074
	ldr r0, _080D70A4
	movs r1, #0xf3
	movs r2, #2
	bl FillPalette
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D709C: .4byte 0x08560B94
_080D70A0: .4byte 0x02037596
_080D70A4: .4byte 0x00007E3F
	thumb_func_end sub_080D7058

	thumb_func_start InitContestResources
InitContestResources: @ 0x080D70A8
	push {r4, r5, r6, r7, lr}
	ldr r4, _080D71A8
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x5c
	bl memset
	movs r5, #0
	movs r2, #0xff
_080D70BC:
	ldr r0, [r4]
	ldr r1, [r0]
	adds r1, #2
	adds r1, r1, r5
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble _080D70BC
	movs r4, #0
	ldr r6, _080D71A8
	movs r5, #3
_080D70D6:
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	movs r1, #0
	movs r2, #0x1c
	bl memset
	adds r4, #0x1c
	subs r5, #1
	cmp r5, #0
	bge _080D70D6
	ldr r4, _080D71A8
	movs r7, #4
	rsbs r7, r7, #0
	movs r6, #0xff
	movs r3, #0
	movs r5, #3
_080D70F8:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	adds r1, r3, r1
	ldrb r2, [r1, #0xb]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1, #0xb]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	adds r1, r3, r1
	ldrb r0, [r1, #0x13]
	orrs r0, r6
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	adds r1, r3, r1
	ldrb r0, [r1, #0x14]
	orrs r0, r6
	strb r0, [r1, #0x14]
	adds r3, #0x1c
	subs r5, #1
	cmp r5, #0
	bge _080D70F8
	ldr r4, _080D71A8
	ldr r0, [r4]
	ldr r0, [r0, #8]
	movs r1, #0
	movs r2, #0x14
	bl memset
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0
	movs r2, #0x44
	bl memset
	ldr r2, [r4]
	ldr r1, [r2, #0x10]
	movs r0, #0
	str r0, [r1]
	ldr r0, [r2, #0x14]
	movs r1, #0
	movs r2, #0x10
	bl memset
	ldr r0, _080D71AC
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080D7164
	movs r0, #0
	bl SortContestants
_080D7164:
	movs r5, #0
	adds r2, r4, #0
	movs r6, #0xff
	movs r3, #0
	ldr r4, _080D71B0
_080D716E:
	ldr r0, [r2]
	ldr r1, [r0, #4]
	adds r1, r3, r1
	ldrb r0, [r1, #0x19]
	orrs r0, r6
	strb r0, [r1, #0x19]
	ldr r0, [r2]
	ldr r1, [r0]
	adds r1, #0x14
	adds r1, r1, r5
	adds r0, r5, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, #0x1c
	adds r5, #1
	cmp r5, #3
	ble _080D716E
	bl ApplyNextTurnOrder
	ldr r0, _080D71A8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0
	movs r2, #0x40
	bl memset
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D71A8: .4byte 0x02039BD4
_080D71AC: .4byte 0x02039BCA
_080D71B0: .4byte 0x02039BC6
	thumb_func_end InitContestResources

	thumb_func_start AllocContestResources
AllocContestResources: @ 0x080D71B4
	push {r4, r5, lr}
	ldr r4, _080D727C
	movs r0, #0x40
	bl AllocZeroed
	str r0, [r4]
	movs r0, #0x5c
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
	movs r0, #0x70
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #4]
	movs r0, #0x14
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #8]
	movs r0, #0x44
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0xc]
	movs r0, #0x10
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x10]
	movs r0, #0x10
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x14]
	movs r0, #0x14
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x18]
	movs r0, #0x40
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x1c]
	movs r0, #0xc
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x20]
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x24]
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x28]
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x2c]
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x30]
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x34]
	adds r0, r5, #0
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1, #0x38]
	movs r0, #0x80
	lsls r0, r0, #6
	bl AllocZeroed
	ldr r2, [r4]
	str r0, [r2, #0x3c]
	ldr r1, _080D7280
	str r0, [r1]
	ldr r1, _080D7284
	ldr r0, [r2, #0x28]
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D727C: .4byte 0x02039BD4
_080D7280: .4byte 0x02022D00
_080D7284: .4byte 0x02022D04
	thumb_func_end AllocContestResources

	thumb_func_start FreeContestResources
FreeContestResources: @ 0x080D7288
	push {r4, r5, lr}
	ldr r5, _080D7344
	ldr r0, [r5]
	ldr r0, [r0]
	bl Free
	ldr r0, [r5]
	movs r4, #0
	str r4, [r0]
	ldr r0, [r0, #4]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #4]
	ldr r0, [r0, #8]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #8]
	ldr r0, [r0, #0xc]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0xc]
	ldr r0, [r0, #0x10]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x10]
	ldr r0, [r0, #0x14]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x14]
	ldr r0, [r0, #0x18]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x18]
	ldr r0, [r0, #0x1c]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x1c]
	ldr r0, [r0, #0x20]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x20]
	ldr r0, [r0, #0x24]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x24]
	ldr r0, [r0, #0x28]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x28]
	ldr r0, [r0, #0x2c]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x2c]
	ldr r0, [r0, #0x30]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x30]
	ldr r0, [r0, #0x34]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x34]
	ldr r0, [r0, #0x38]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x38]
	ldr r0, [r0, #0x3c]
	bl Free
	ldr r0, [r5]
	str r4, [r0, #0x3c]
	bl Free
	str r4, [r5]
	ldr r0, _080D7348
	str r4, [r0]
	ldr r0, _080D734C
	str r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7344: .4byte 0x02039BD4
_080D7348: .4byte 0x02022D00
_080D734C: .4byte 0x02022D04
	thumb_func_end FreeContestResources

	thumb_func_start CB2_StartContest
CB2_StartContest: @ 0x080D7350
	push {r4, r5, r6, lr}
	ldr r0, _080D736C
	movs r1, #0x87
	lsls r1, r1, #3
	adds r6, r0, r1
	ldrb r5, [r6]
	cmp r5, #1
	beq _080D7400
	cmp r5, #1
	bgt _080D7370
	cmp r5, #0
	beq _080D737A
	b _080D7482
	.align 2, 0
_080D736C: .4byte 0x03002360
_080D7370:
	cmp r5, #2
	beq _080D7406
	cmp r5, #3
	beq _080D7430
	b _080D7482
_080D737A:
	ldr r0, _080D73EC
	strb r5, [r0]
	bl AllocContestResources
	bl AllocateMonSpritesGfx
	ldr r4, _080D73F0
	ldr r0, [r4]
	ldr r0, [r0]
	bl Free
	ldr r0, [r4]
	str r5, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	bl AllocZeroed
	ldr r1, [r4]
	str r0, [r1]
	movs r0, #0
	bl SetVBlankCallback
	bl InitContestInfoBgs
	bl InitContestWindows
	bl SetupContestGpuRegs
	bl ScanlineEffect_Clear
	bl ResetPaletteFade
	ldr r2, _080D73F4
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r1, _080D73F8
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080D73FC
	movs r1, #0xd0
	lsls r1, r1, #9
	adds r0, r0, r1
	strb r5, [r0]
	bl ClearBattleMonForms
	bl InitContestResources
	b _080D7422
	.align 2, 0
_080D73EC: .4byte 0x02039BD8
_080D73F0: .4byte 0x02024178
_080D73F4: .4byte 0x02037C74
_080D73F8: .4byte 0x030030BC
_080D73FC: .4byte 0x02000000
_080D7400:
	movs r0, #2
	strb r0, [r6]
	b _080D7482
_080D7406:
	ldr r4, _080D742C
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x59
	bl SetupContestGraphics
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D7482
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x59
	movs r1, #0
	strb r1, [r0]
_080D7422:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _080D7482
	.align 2, 0
_080D742C: .4byte 0x02039BD4
_080D7430:
	bl sub_080DD988
	ldr r0, _080D7488
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080D748C
	strh r1, [r0]
	movs r0, #2
	bl BeginFastPaletteFade
	ldr r2, _080D7490
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	ldr r0, _080D7494
	bl SetVBlankCallback
	ldr r0, _080D7498
	movs r1, #0xa
	bl CreateTask
	ldr r1, _080D749C
	ldr r1, [r1]
	ldr r1, [r1]
	strb r0, [r1, #8]
	ldr r0, _080D74A0
	bl SetMainCallback2
	ldr r0, _080D74A4
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D7482
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #8
	movs r1, #8
	bl CreateWirelessStatusIndicatorSprite
_080D7482:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D7488: .4byte 0x02022ACC
_080D748C: .4byte 0x02022ACE
_080D7490: .4byte 0x02037C74
_080D7494: .4byte 0x080D7AA9
_080D7498: .4byte 0x080D74A9
_080D749C: .4byte 0x02039BD4
_080D74A0: .4byte 0x080D7A69
_080D74A4: .4byte 0x02039BCA
	thumb_func_end CB2_StartContest

	thumb_func_start sub_080D74A8
sub_080D74A8: @ 0x080D74A8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080D74D4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080D74CE
	ldr r0, _080D74D8
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r2, [r1, #8]
	ldr r0, _080D74DC
	str r0, [r1]
_080D74CE:
	pop {r0}
	bx r0
	.align 2, 0
_080D74D4: .4byte 0x02037C74
_080D74D8: .4byte 0x03005B60
_080D74DC: .4byte 0x080D74E1
	thumb_func_end sub_080D74A8

	thumb_func_start sub_080D74E0
sub_080D74E0: @ 0x080D74E0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080D7518
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D75BC
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D7566
	ldr r2, _080D751C
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r0, r0, #3
	adds r4, r0, r2
	movs r2, #8
	ldrsh r0, [r4, r2]
	adds r6, r1, #0
	cmp r0, #1
	beq _080D7530
	cmp r0, #1
	bgt _080D7520
	cmp r0, #0
	beq _080D7526
	b _080D7566
	.align 2, 0
_080D7518: .4byte 0x02039BCA
_080D751C: .4byte 0x03005B60
_080D7520:
	cmp r0, #2
	beq _080D7554
	b _080D7566
_080D7526:
	bl ContestPrintLinkStandby
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080D7530:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D75CA
	bl sub_0800A8D4
	ldr r0, _080D7550
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080D75CA
	.align 2, 0
_080D7550: .4byte 0x03005B60
_080D7554:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D75CA
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080D7566:
	ldr r2, _080D75A8
	ldrb r1, [r2, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080D75CA
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	ldr r0, _080D75AC
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080D758E
	bl ContestPrintLinkStandby
_080D758E:
	ldr r0, _080D75B0
	movs r1, #0
	bl CreateTask
	ldr r1, _080D75B4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #8]
	ldr r1, _080D75B8
	str r1, [r0]
	b _080D75CA
	.align 2, 0
_080D75A8: .4byte 0x02037C74
_080D75AC: .4byte 0x02039BCA
_080D75B0: .4byte 0x080D75D9
_080D75B4: .4byte 0x03005B60
_080D75B8: .4byte 0x080D6E95
_080D75BC:
	ldr r0, _080D75D0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D75D4
	str r0, [r1]
_080D75CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D75D0: .4byte 0x03005B60
_080D75D4: .4byte 0x080D78F5
	thumb_func_end sub_080D74E0

	thumb_func_start sub_080D75D8
sub_080D75D8: @ 0x080D75D8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080D75EC
	ldr r2, _080D75F0
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080D75EC: .4byte 0x080FD1ED
_080D75F0: .4byte 0x080D75F5
	thumb_func_end sub_080D75D8

	thumb_func_start sub_080D75F4
sub_080D75F4: @ 0x080D75F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D760C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1, #8]
	ldr r0, _080D7610
	str r0, [r1]
	bx lr
	.align 2, 0
_080D760C: .4byte 0x03005B60
_080D7610: .4byte 0x080D7615
	thumb_func_end sub_080D75F4

	thumb_func_start sub_080D7614
sub_080D7614: @ 0x080D7614
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _080D765C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r0, #8]
	subs r1, #1
	strh r1, [r0, #8]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _080D7656
	bl GetMultiplayerId
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _080D7660
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r1, _080D7664
	str r1, [r0]
	ldr r1, _080D7668
	ldr r0, _080D766C
	ldr r0, [r0]
	str r0, [r1]
_080D7656:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D765C: .4byte 0x03005B60
_080D7660: .4byte 0x02039BD4
_080D7664: .4byte 0x080D78F5
_080D7668: .4byte 0x03005AE0
_080D766C: .4byte 0x03005E18
	thumb_func_end sub_080D7614

	thumb_func_start SetupContestGraphics
SetupContestGraphics: @ 0x080D7670
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	mov sl, r0
	ldrb r0, [r0]
	cmp r0, #6
	bls _080D7686
	b _080D78D0
_080D7686:
	lsls r0, r0, #2
	ldr r1, _080D7690
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D7690: .4byte 0x080D7694
_080D7694: @ jump table
	.4byte _080D76B0 @ case 0
	.4byte _080D76F4 @ case 1
	.4byte _080D7704 @ case 2
	.4byte _080D7754 @ case 3
	.4byte _080D776C @ case 4
	.4byte _080D77A8 @ case 5
	.4byte _080D7830 @ case 6
_080D76B0:
	ldr r2, _080D76E8
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r4, #0x80
	lsls r4, r4, #8
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl RequestDma3Fill
	ldr r1, _080D76EC
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl RequestDma3Fill
	ldr r1, _080D76F0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl RequestDma3Fill
	b _080D78DA
	.align 2, 0
_080D76E8: .4byte 0x02037C74
_080D76EC: .4byte 0x06008000
_080D76F0: .4byte 0x06010000
_080D76F4:
	ldr r0, _080D7700
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZDecompressWram
	b _080D78DA
	.align 2, 0
_080D7700: .4byte 0x08C17AB8
_080D7704:
	ldr r0, _080D7740
	ldr r4, _080D7744
	adds r1, r4, #0
	bl LZDecompressWram
	ldr r3, _080D7748
	movs r5, #0x80
	lsls r5, r5, #6
	ldr r1, _080D774C
	ldr r6, _080D7750
	movs r2, #0x80
	lsls r2, r2, #5
	movs r7, #0x84
	lsls r7, r7, #0x18
_080D7720:
	str r4, [r1]
	str r3, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r4, r4, r2
	adds r3, r3, r2
	subs r5, r5, r2
	cmp r5, r2
	bhi _080D7720
	str r4, [r1]
	str r3, [r1, #4]
	lsrs r0, r5, #2
	orrs r0, r7
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _080D78DA
	.align 2, 0
_080D7740: .4byte 0x08C18650
_080D7744: .4byte 0x06002000
_080D7748: .4byte 0x02018000
_080D774C: .4byte 0x040000D4
_080D7750: .4byte 0x84000400
_080D7754:
	ldr r1, _080D7768
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _080D78DA
	.align 2, 0
_080D7768: .4byte 0x08C16FB0
_080D776C:
	ldr r1, _080D7794
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	ldr r0, _080D7798
	ldr r0, [r0]
	ldr r1, [r0, #0x2c]
	ldr r2, _080D779C
	ldr r0, _080D77A0
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _080D77A4
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _080D78DA
	.align 2, 0
_080D7794: .4byte 0x08C17178
_080D7798: .4byte 0x02039BD4
_080D779C: .4byte 0x0201AA04
_080D77A0: .4byte 0x040000D4
_080D77A4: .4byte 0x84000200
_080D77A8:
	ldr r0, _080D7810
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl LoadCompressedPalette
	ldr r5, _080D7814
	ldr r6, _080D7818
	adds r0, r5, #0
	mov r1, sp
	adds r2, r6, #0
	bl CpuSet
	ldr r0, _080D781C
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #5
	lsls r0, r0, #5
	ldr r1, _080D7820
	adds r1, r1, r5
	mov r8, r1
	add r0, r8
	add r4, sp, #0x20
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuSet
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CpuSet
	mov r2, sb
	ldrb r1, [r2]
	adds r1, #5
	lsls r1, r1, #5
	add r1, r8
	mov r0, sp
	adds r2, r6, #0
	bl CpuSet
	ldr r1, _080D7824
	ldr r0, _080D7828
	mov r2, r8
	str r2, [r0]
	str r1, [r0, #4]
	ldr r1, _080D782C
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bl sub_080D7058
	b _080D78DA
	.align 2, 0
_080D7810: .4byte 0x08C16E98
_080D7814: .4byte 0x020374B4
_080D7818: .4byte 0x04000008
_080D781C: .4byte 0x02039BC5
_080D7820: .4byte 0xFFFFFF00
_080D7824: .4byte 0x0201A004
_080D7828: .4byte 0x040000D4
_080D782C: .4byte 0x84000080
_080D7830:
	bl DrawContestantWindows
	bl FillContestantWindowBgs
	bl SwapMoveDescAndContestTilemaps
	bl sub_080DA884
	ldr r1, _080D78B8
	ldr r1, [r1]
	ldr r1, [r1]
	movs r4, #0
	strb r0, [r1, #0x12]
	bl sub_080DBA20
	bl sub_080DBC54
	bl CreateApplauseMeterSprite
	bl sub_080DBD4C
	bl sub_080DBF50
	ldr r1, _080D78BC
	strb r4, [r1]
	movs r0, #1
	strb r0, [r1, #1]
	movs r3, #3
	strb r3, [r1, #2]
	movs r2, #2
	strb r2, [r1, #3]
	ldr r0, _080D78C0
	str r4, [r0]
	ldr r4, _080D78C4
	strb r2, [r4]
	ldr r0, _080D78C8
	strb r3, [r0]
	bl sub_080DA828
	ldr r2, _080D78CC
	ldrb r1, [r4]
	adds r1, r1, r2
	strb r0, [r1]
	bl sub_080DE184
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	b _080D78DA
	.align 2, 0
_080D78B8: .4byte 0x02039BD4
_080D78BC: .4byte 0x02023D1A
_080D78C0: .4byte 0x02022C90
_080D78C4: .4byte 0x02023EAF
_080D78C8: .4byte 0x02023EB0
_080D78CC: .4byte 0x02023E88
_080D78D0:
	movs r0, #0
	mov r1, sl
	strb r0, [r1]
	movs r0, #1
	b _080D78E4
_080D78DA:
	mov r2, sl
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r0, #0
_080D78E4:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end SetupContestGraphics

	thumb_func_start sub_080D78F4
sub_080D78F4: @ 0x080D78F4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _080D7928
	ldrb r2, [r1, #8]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1, #8]
	ldrb r1, [r1, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080D7924
	ldr r0, _080D792C
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r2, [r1, #8]
	strh r2, [r1, #0xa]
	ldr r0, _080D7930
	str r0, [r1]
_080D7924:
	pop {r0}
	bx r0
	.align 2, 0
_080D7928: .4byte 0x02037C74
_080D792C: .4byte 0x03005B60
_080D7930: .4byte 0x080D7935
	thumb_func_end sub_080D78F4

	thumb_func_start sub_080D7934
sub_080D7934: @ 0x080D7934
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080D795C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #4
	bhi _080D7A34
	lsls r0, r0, #2
	ldr r1, _080D7960
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D795C: .4byte 0x03005B60
_080D7960: .4byte 0x080D7964
_080D7964: @ jump table
	.4byte _080D7978 @ case 0
	.4byte _080D79A2 @ case 1
	.4byte _080D79C0 @ case 2
	.4byte _080D79DC @ case 3
	.4byte _080D7A34 @ case 4
_080D7978:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080D7A58
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #0x61
	movs r1, #0
	bl PlaySE12WithPanning
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080D7A58
_080D79A2:
	ldr r1, _080D79BC
	ldrh r0, [r1]
	adds r0, #7
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _080D7A58
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	b _080D7A26
	.align 2, 0
_080D79BC: .4byte 0x02022ACE
_080D79C0:
	bl sub_080DDAB4
	ldr r0, _080D79D8
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080D7A58
	.align 2, 0
_080D79D8: .4byte 0x03005B60
_080D79DC:
	movs r0, #8
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	movs r0, #0xc
	bl GetGpuReg
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	mov r3, sp
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldrb r0, [r4]
	ands r1, r0
	strb r1, [r4]
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #8
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0xc
	bl SetGpuReg
	bl StartMoveApplauseMeterOnscreen
	ldr r1, _080D7A30
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
_080D7A26:
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _080D7A58
	.align 2, 0
_080D7A30: .4byte 0x03005B60
_080D7A34:
	ldr r0, _080D7A60
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080D7A58
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	ldr r1, _080D7A64
	str r1, [r0]
_080D7A58:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7A60: .4byte 0x02039BD4
_080D7A64: .4byte 0x080D7B69
	thumb_func_end sub_080D7934

	thumb_func_start CB2_ContestMain
CB2_ContestMain: @ 0x080D7A68
	push {r4, r5, lr}
	bl AnimateSprites
	bl RunTasks
	bl BuildOamBuffer
	bl UpdatePaletteFade
	movs r4, #0
_080D7A7C:
	ldr r5, _080D7AA4
	ldrb r0, [r5]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080D7A92
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl CopyBgTilemapBufferToVram
_080D7A92:
	adds r4, #1
	cmp r4, #3
	ble _080D7A7C
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7AA4: .4byte 0x02039BD8
	thumb_func_end CB2_ContestMain

	thumb_func_start vblank_cb_battle
vblank_cb_battle: @ 0x080D7AA8
	push {lr}
	ldr r0, _080D7B38
	ldrh r1, [r0]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, _080D7B3C
	ldrh r1, [r0]
	movs r0, #0x12
	bl SetGpuReg
	ldr r0, _080D7B40
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, _080D7B44
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, _080D7B48
	ldrh r1, [r0]
	movs r0, #0x18
	bl SetGpuReg
	ldr r0, _080D7B4C
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, _080D7B50
	ldrh r1, [r0]
	movs r0, #0x1c
	bl SetGpuReg
	ldr r0, _080D7B54
	ldrh r1, [r0]
	movs r0, #0x1e
	bl SetGpuReg
	ldr r0, _080D7B58
	ldrh r1, [r0]
	movs r0, #0x40
	bl SetGpuReg
	ldr r0, _080D7B5C
	ldrh r1, [r0]
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, _080D7B60
	ldrh r1, [r0]
	movs r0, #0x42
	bl SetGpuReg
	ldr r0, _080D7B64
	ldrh r1, [r0]
	movs r0, #0x46
	bl SetGpuReg
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl ScanlineEffect_InitHBlankDmaTransfer
	pop {r0}
	bx r0
	.align 2, 0
_080D7B38: .4byte 0x02022AC8
_080D7B3C: .4byte 0x02022ACA
_080D7B40: .4byte 0x02022ACC
_080D7B44: .4byte 0x02022ACE
_080D7B48: .4byte 0x02022AD0
_080D7B4C: .4byte 0x02022AD2
_080D7B50: .4byte 0x02022AD4
_080D7B54: .4byte 0x02022AD6
_080D7B58: .4byte 0x02022AD8
_080D7B5C: .4byte 0x02022ADA
_080D7B60: .4byte 0x02022ADC
_080D7B64: .4byte 0x02022ADE
	thumb_func_end vblank_cb_battle

	thumb_func_start sub_080D7B68
sub_080D7B68: @ 0x080D7B68
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080D7BCC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bne _080D7C38
	ldr r0, _080D7BD0
	strh r1, [r0]
	ldr r0, _080D7BD4
	strh r1, [r0]
	bl ContestDebugDoPrint
	ldr r1, _080D7BD8
	ldr r2, _080D7BDC
	ldr r0, _080D7BE0
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _080D7BE4
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _080D7BE8
	ldr r1, _080D7BEC
	ldr r1, [r1]
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	adds r1, #1
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	adds r4, r0, #0
	ldr r0, _080D7BF0
	ldrb r0, [r0]
	bl Contest_IsMonsTurnDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D7BF8
	ldr r1, _080D7BF4
	adds r0, r4, #0
	bl StringCopy
	b _080D7C00
	.align 2, 0
_080D7BCC: .4byte 0x03005B60
_080D7BD0: .4byte 0x02022ACA
_080D7BD4: .4byte 0x02022AD2
_080D7BD8: .4byte 0x020373B4
_080D7BDC: .4byte 0x0201A204
_080D7BE0: .4byte 0x040000D4
_080D7BE4: .4byte 0x84000100
_080D7BE8: .4byte 0x02022AE0
_080D7BEC: .4byte 0x02039BD4
_080D7BF0: .4byte 0x02039BC5
_080D7BF4: .4byte 0x0824B317
_080D7BF8:
	ldr r1, _080D7C28
	adds r0, r4, #0
	bl StringCopy
_080D7C00:
	bl sub_080DB000
	ldr r4, _080D7C2C
	ldr r1, _080D7C30
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r1, _080D7C34
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _080D7C46
	.align 2, 0
_080D7C28: .4byte 0x0824B32D
_080D7C2C: .4byte 0x02021C7C
_080D7C30: .4byte 0x02022AE0
_080D7C34: .4byte 0x03005B60
_080D7C38:
	bl Contest_RunTextPrinters
	cmp r0, #0
	bne _080D7C46
	strh r0, [r4, #8]
	ldr r0, _080D7C4C
	str r0, [r4]
_080D7C46:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7C4C: .4byte 0x080D7C51
	thumb_func_end sub_080D7B68

	thumb_func_start sub_080D7C50
sub_080D7C50: @ 0x080D7C50
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r0, _080D7C90
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080D7C68
	cmp r1, #2
	bne _080D7CAE
_080D7C68:
	movs r0, #5
	bl PlaySE
	ldr r0, _080D7C94
	ldrb r0, [r0]
	bl Contest_IsMonsTurnDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D7CA0
	movs r0, #1
	bl sub_080DBBF4
	ldr r0, _080D7C98
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D7C9C
	b _080D7CAC
	.align 2, 0
_080D7C90: .4byte 0x03002360
_080D7C94: .4byte 0x02039BC5
_080D7C98: .4byte 0x03005B60
_080D7C9C: .4byte 0x080D7CBD
_080D7CA0:
	ldr r0, _080D7CB4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D7CB8
_080D7CAC:
	str r0, [r1]
_080D7CAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7CB4: .4byte 0x03005B60
_080D7CB8: .4byte 0x080D8091
	thumb_func_end sub_080D7C50

	thumb_func_start sub_080D7CBC
sub_080D7CBC: @ 0x080D7CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _080D7D60
	movs r1, #0xa0
	strh r1, [r0]
	ldr r0, _080D7D64
	strh r1, [r0]
	movs r7, #0
	ldr r0, _080D7D68
	mov sb, r0
	ldr r1, _080D7D6C
	mov r8, r1
_080D7CE2:
	lsls r1, r7, #1
	mov r0, sb
	ldrb r2, [r0]
	lsls r0, r2, #6
	adds r1, r1, r0
	ldr r0, _080D7D70
	adds r1, r1, r0
	ldrh r5, [r1]
	mov r6, sp
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _080D7D78
	adds r0, r2, #0
	bl sub_080DD94C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D7D78
	mov r2, r8
	ldr r0, [r2]
	mov r2, sb
	ldrb r1, [r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	adds r1, r5, #0
	bl AreMovesContestCombo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D7D78
	mov r1, r8
	ldr r0, [r1]
	mov r2, sb
	ldrb r1, [r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080D7D78
	mov r0, sp
	ldr r1, _080D7D74
	bl StringCopy
	adds r6, r0, #0
	lsls r4, r5, #3
	b _080D7DAA
	.align 2, 0
_080D7D60: .4byte 0x02022ACA
_080D7D64: .4byte 0x02022AD2
_080D7D68: .4byte 0x02039BC5
_080D7D6C: .4byte 0x02039BD4
_080D7D70: .4byte 0x02039ABE
_080D7D74: .4byte 0x085CC48C
_080D7D78:
	lsls r4, r5, #3
	cmp r5, #0
	beq _080D7DAA
	mov r1, r8
	ldr r0, [r1]
	mov r2, sb
	ldrb r1, [r2]
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	cmp r0, r5
	bne _080D7DAA
	ldr r0, _080D7E20
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #3
	beq _080D7DAA
	mov r0, sp
	ldr r1, _080D7E24
	bl StringCopy
	adds r6, r0, #0
_080D7DAA:
	ldr r1, _080D7E28
	adds r1, r4, r1
	adds r0, r6, #0
	bl StringCopy
	adds r4, r7, #0
	adds r4, #9
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	mov r1, sp
	bl Contest_PrintTextToBg0WindowStd
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _080D7CE2
	ldr r4, _080D7E2C
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080D8038
	ldr r2, _080D7E30
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, r1, #1
	ldr r0, _080D7E34
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r0, [r1]
	bl sub_080DAAD4
	ldr r1, _080D7E38
	mov r2, sl
	lsls r0, r2, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080D7E3C
	str r1, [r0]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D7E20: .4byte 0x08565FCC
_080D7E24: .4byte 0x085CC493
_080D7E28: .4byte 0x082EACC4
_080D7E2C: .4byte 0x02039BD4
_080D7E30: .4byte 0x02039AA0
_080D7E34: .4byte 0x02039BC5
_080D7E38: .4byte 0x03005B60
_080D7E3C: .4byte 0x080D7E41
	thumb_func_end sub_080D7CBC

	thumb_func_start sub_080D7E40
sub_080D7E40: @ 0x080D7E40
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	ldr r3, _080D7E8C
	ldr r1, _080D7E90
	ldr r0, _080D7E94
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, #0x1e
	adds r1, r0, r1
	movs r2, #3
_080D7E58:
	ldrh r0, [r1]
	cmp r0, #0
	beq _080D7E64
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080D7E64:
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080D7E58
	ldrh r0, [r3, #0x2e]
	movs r5, #1
	ands r5, r0
	cmp r5, #0
	beq _080D7EA0
	movs r0, #5
	bl PlaySE
	ldr r0, _080D7E98
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D7E9C
	str r0, [r1]
	b _080D8026
	.align 2, 0
_080D7E8C: .4byte 0x03002360
_080D7E90: .4byte 0x02039AA0
_080D7E94: .4byte 0x02039BC5
_080D7E98: .4byte 0x03005B60
_080D7E9C: .4byte 0x080D8091
_080D7EA0:
	ldrh r0, [r3, #0x30]
	cmp r0, #0x20
	bne _080D7EA8
	b _080D8026
_080D7EA8:
	cmp r0, #0x20
	bgt _080D7EB2
	cmp r0, #2
	beq _080D7EBE
	b _080D8026
_080D7EB2:
	cmp r0, #0x40
	beq _080D7F5C
	cmp r0, #0x80
	bne _080D7EBC
	b _080D7FC8
_080D7EBC:
	b _080D8026
_080D7EBE:
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl sub_080DBBF4
	ldr r0, _080D7EF8
	ldr r1, _080D7EFC
	ldr r1, [r1]
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	adds r1, #1
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	adds r4, r0, #0
	ldr r0, _080D7F00
	ldrb r0, [r0]
	bl Contest_IsMonsTurnDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D7F08
	ldr r1, _080D7F04
	adds r0, r4, #0
	bl StringCopy
	b _080D7F10
	.align 2, 0
_080D7EF8: .4byte 0x02022AE0
_080D7EFC: .4byte 0x02039BD4
_080D7F00: .4byte 0x02039BC5
_080D7F04: .4byte 0x0824B317
_080D7F08:
	ldr r1, _080D7F40
	adds r0, r4, #0
	bl StringCopy
_080D7F10:
	bl sub_080DB000
	ldr r4, _080D7F44
	ldr r1, _080D7F48
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #0
	bl Contest_StartTextPrinter
	ldr r0, _080D7F4C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080D7F50
	strh r1, [r0]
	ldr r1, _080D7F54
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080D7F58
	str r1, [r0]
	b _080D8026
	.align 2, 0
_080D7F40: .4byte 0x0824B32D
_080D7F44: .4byte 0x02021C7C
_080D7F48: .4byte 0x02022AE0
_080D7F4C: .4byte 0x02022ACA
_080D7F50: .4byte 0x02022AD2
_080D7F54: .4byte 0x03005B60
_080D7F58: .4byte 0x080D7C51
_080D7F5C:
	ldr r4, _080D7F7C
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080D8064
	ldr r0, [r4]
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	bne _080D7F80
	subs r0, r6, #1
	b _080D7F82
	.align 2, 0
_080D7F7C: .4byte 0x02039BD4
_080D7F80:
	subs r0, #1
_080D7F82:
	strb r0, [r1]
	ldr r4, _080D7FBC
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080D8038
	ldr r2, _080D7FC0
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, r1, #1
	ldr r0, _080D7FC4
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r0, [r1]
	bl sub_080DAAD4
	cmp r6, #1
	bls _080D8026
	movs r0, #5
	bl PlaySE
	b _080D8026
	.align 2, 0
_080D7FBC: .4byte 0x02039BD4
_080D7FC0: .4byte 0x02039AA0
_080D7FC4: .4byte 0x02039BC5
_080D7FC8:
	ldr r4, _080D7FE8
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080D8064
	ldr r0, [r4]
	ldr r1, [r0]
	ldrb r2, [r1]
	subs r0, r6, #1
	cmp r2, r0
	bne _080D7FEC
	strb r5, [r1]
	b _080D7FF0
	.align 2, 0
_080D7FE8: .4byte 0x02039BD4
_080D7FEC:
	adds r0, r2, #1
	strb r0, [r1]
_080D7FF0:
	ldr r4, _080D802C
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080D8038
	ldr r2, _080D8030
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, r1, #1
	ldr r0, _080D8034
	ldrb r0, [r0]
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, #0x1e
	adds r1, r1, r2
	ldrh r0, [r1]
	bl sub_080DAAD4
	cmp r6, #1
	bls _080D8026
	movs r0, #5
	bl PlaySE
_080D8026:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D802C: .4byte 0x02039BD4
_080D8030: .4byte 0x02039AA0
_080D8034: .4byte 0x02039BC5
	thumb_func_end sub_080D7E40

	thumb_func_start sub_080D8038
sub_080D8038: @ 0x080D8038
	push {lr}
	sub sp, #0x10
	adds r3, r0, #0
	lsls r3, r3, #0x19
	movs r0, #0xf8
	lsls r0, r0, #0x15
	adds r3, r3, r0
	lsrs r3, r3, #0x18
	movs r1, #1
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #2
	movs r2, #1
	bl ContestBG_FillBoxWithIncrementingTile
	add sp, #0x10
	pop {r0}
	bx r0
	thumb_func_end sub_080D8038

	thumb_func_start sub_080D8064
sub_080D8064: @ 0x080D8064
	push {lr}
	sub sp, #0xc
	adds r3, r0, #0
	lsls r3, r3, #0x19
	movs r0, #0xf8
	lsls r0, r0, #0x15
	adds r3, r3, r0
	lsrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #0xc
	movs r2, #1
	bl ContestBG_FillBoxWithTile
	add sp, #0xc
	pop {r0}
	bx r0
	thumb_func_end sub_080D8064

	thumb_func_start sub_080D8090
sub_080D8090: @ 0x080D8090
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080D80EC
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D8108
	ldr r4, _080D80F0
	ldrb r0, [r4]
	bl GetChosenMove
	ldr r1, _080D80F4
	ldr r1, [r1]
	ldrb r2, [r4]
	ldr r3, [r1, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	strh r0, [r1, #6]
	ldr r4, _080D80F8
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D80FC
	adds r1, r4, #0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080D8100
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080D8104
	str r1, [r0]
	bl ContestPrintLinkStandby
	movs r0, #0
	bl sub_080DBBF4
	b _080D811A
	.align 2, 0
_080D80EC: .4byte 0x02039BCA
_080D80F0: .4byte 0x02039BC5
_080D80F4: .4byte 0x02039BD4
_080D80F8: .4byte 0x080FD24D
_080D80FC: .4byte 0x080D8129
_080D8100: .4byte 0x03005B60
_080D8104: .4byte 0x080D6E95
_080D8108:
	bl GetAllChosenMoves
	ldr r0, _080D8120
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D8124
	str r0, [r1]
_080D811A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D8120: .4byte 0x03005B60
_080D8124: .4byte 0x080D8159
	thumb_func_end sub_080D8090

	thumb_func_start sub_080D8128
sub_080D8128: @ 0x080D8128
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	ldr r2, _080D814C
	ldr r0, _080D8150
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _080D8154
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080D814C: .4byte 0x03005B60
_080D8150: .4byte 0x02039BD4
_080D8154: .4byte 0x080D8159
	thumb_func_end sub_080D8128

	thumb_func_start sub_080D8158
sub_080D8158: @ 0x080D8158
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	bl sub_080DB000
	ldr r0, _080D81E0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080D81E4
	strh r1, [r0]
	movs r0, #0
	bl sub_080DBBF4
	movs r6, #0
	movs r5, #0x90
	lsls r5, r5, #0x14
_080D8178:
	lsrs r4, r5, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r6, #1
	cmp r6, #3
	ble _080D8178
	movs r0, #0
	bl Contest_SetBgCopyFlags
	ldr r1, _080D81E8
	ldr r0, _080D81EC
	movs r2, #0x80
	lsls r2, r2, #3
	ldr r4, _080D81F0
	str r1, [r4]
	str r0, [r4, #4]
	lsrs r1, r2, #2
	movs r3, #0x84
	lsls r3, r3, #0x18
	orrs r1, r3
	str r1, [r4, #8]
	ldr r1, [r4, #8]
	ldr r1, _080D81F4
	adds r0, r0, r1
	movs r1, #0
	bl LoadPalette
	ldr r1, _080D81F8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	ldr r1, _080D81FC
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D81E0: .4byte 0x02022ACA
_080D81E4: .4byte 0x02022AD2
_080D81E8: .4byte 0x020377B4
_080D81EC: .4byte 0x0201A604
_080D81F0: .4byte 0x040000D4
_080D81F4: .4byte 0xFFFFFC00
_080D81F8: .4byte 0x03005B60
_080D81FC: .4byte 0x080D8201
	thumb_func_end sub_080D8158

	thumb_func_start sub_080D8200
sub_080D8200: @ 0x080D8200
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D8244
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080D823E
	movs r0, #0
	strh r0, [r4, #8]
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _080D823E
	bl TryMoveApplauseMeterOffscreen
	movs r0, #1
	bl sub_080DDE00
	ldr r0, _080D8248
	str r0, [r4]
_080D823E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D8244: .4byte 0x03005B60
_080D8248: .4byte 0x080D824D
	thumb_func_end sub_080D8200

	thumb_func_start sub_080D824C
sub_080D824C: @ 0x080D824C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080D8278
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x90
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080D8272
	ldr r0, _080D827C
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D8280
	str r0, [r1]
_080D8272:
	pop {r0}
	bx r0
	.align 2, 0
_080D8278: .4byte 0x02039BD4
_080D827C: .4byte 0x03005B60
_080D8280: .4byte 0x080D8285
	thumb_func_end sub_080D824C

	thumb_func_start sub_080D8284
sub_080D8284: @ 0x080D8284
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080D831C
	lsls r3, r6, #2
	adds r1, r3, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _080D8314
	ldr r2, _080D8320
	ldr r0, [r2]
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #0x10]
	ldr r0, [r2]
	ldr r1, [r0]
	ldr r0, _080D8324
	ldr r0, [r0]
	str r0, [r1, #0x18]
	ldr r0, _080D8328
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	adds r7, r3, #0
	cmp r0, #0
	beq _080D8304
	bl sub_080DA094
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D8304
	movs r4, #0
	ldr r1, _080D832C
	ldrb r0, [r1]
	cmp r0, #3
	bgt _080D8304
	adds r5, r1, #0
_080D82DA:
	ldrb r0, [r5]
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetChosenMove
	ldr r1, _080D8320
	ldr r1, [r1]
	ldrb r2, [r5]
	adds r2, r2, r4
	ldr r3, [r1, #4]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	strh r0, [r1, #6]
	adds r4, #1
	ldrb r0, [r5]
	adds r0, r4, r0
	cmp r0, #3
	ble _080D82DA
_080D8304:
	ldr r1, _080D831C
	adds r0, r7, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	ldr r1, _080D8330
	str r1, [r0]
_080D8314:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D831C: .4byte 0x03005B60
_080D8320: .4byte 0x02039BD4
_080D8324: .4byte 0x03005AE0
_080D8328: .4byte 0x02039BCA
_080D832C: .4byte 0x02039BD0
_080D8330: .4byte 0x080D8335
	thumb_func_end sub_080D8284

	thumb_func_start sub_080D8334
sub_080D8334: @ 0x080D8334
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, _080D8374
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r6, [r0, #0x11]
	ldr r1, _080D8378
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r4, #8
	ldrsh r0, [r0, r4]
	mov sb, r2
	adds r4, r1, #0
	cmp r0, #0x3b
	bls _080D836A
	bl _080D98F0
_080D836A:
	lsls r0, r0, #2
	ldr r1, _080D837C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D8374: .4byte 0x02039BD4
_080D8378: .4byte 0x03005B60
_080D837C: .4byte 0x080D8380
_080D8380: @ jump table
	.4byte _080D8470 @ case 0
	.4byte _080D852C @ case 1
	.4byte _080D8552 @ case 2
	.4byte _080D85C0 @ case 3
	.4byte _080D8678 @ case 4
	.4byte _080D86C4 @ case 5
	.4byte _080D877C @ case 6
	.4byte _080D87B0 @ case 7
	.4byte _080D8808 @ case 8
	.4byte _080D8884 @ case 9
	.4byte _080D97B0 @ case 10
	.4byte _080D97DC @ case 11
	.4byte _080D8A30 @ case 12
	.4byte _080D8A64 @ case 13
	.4byte _080D8F6C @ case 14
	.4byte _080D905C @ case 15
	.4byte _080D90CC @ case 16
	.4byte _080D90FC @ case 17
	.4byte _080D91E4 @ case 18
	.4byte _080D9196 @ case 19
	.4byte _080D9814 @ case 20
	.4byte _080D9890 @ case 21
	.4byte _080D98B2 @ case 22
	.4byte _080D88AC @ case 23
	.4byte _080D8978 @ case 24
	.4byte _080D8B80 @ case 25
	.4byte _080D8B96 @ case 26
	.4byte _080D8C74 @ case 27
	.4byte _080D8C98 @ case 28
	.4byte _080D8D00 @ case 29
	.4byte _080D8DE4 @ case 30
	.4byte _080D9828 @ case 31
	.4byte _080D9870 @ case 32
	.4byte _080D96B0 @ case 33
	.4byte _080D9738 @ case 34
	.4byte _080D8A92 @ case 35
	.4byte _080D8AC8 @ case 36
	.4byte _080D8AEE @ case 37
	.4byte _080D8B2C @ case 38
	.4byte _080D8D54 @ case 39
	.4byte _080D8DBC @ case 40
	.4byte _080D9224 @ case 41
	.4byte _080D98F0 @ case 42
	.4byte _080D95A4 @ case 43
	.4byte _080D98F0 @ case 44
	.4byte _080D9028 @ case 45
	.4byte _080D9174 @ case 46
	.4byte _080D8A12 @ case 47
	.4byte _080D899C @ case 48
	.4byte _080D89EC @ case 49
	.4byte _080D8B54 @ case 50
	.4byte _080D8E88 @ case 51
	.4byte _080D8F14 @ case 52
	.4byte _080D93A2 @ case 53
	.4byte _080D9460 @ case 54
	.4byte _080D9758 @ case 55
	.4byte _080D9774 @ case 56
	.4byte _080D95CC @ case 57
	.4byte _080D9654 @ case 58
	.4byte _080D9694 @ case 59
_080D8470:
	bl ContestDebugDoPrint
	movs r7, #0
	ldr r0, _080D84FC
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #8]
	ldrb r1, [r1, #0x10]
	mov r5, r8
	lsls r5, r5, #2
	mov sl, r5
	ldrb r2, [r0]
	cmp r1, r2
	beq _080D8498
	adds r2, r0, #0
_080D848E:
	adds r7, #1
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r1, r0
	bne _080D848E
_080D8498:
	ldr r4, _080D84FC
	ldr r0, [r4]
	ldr r0, [r0]
	strb r7, [r0, #0x11]
	ldr r0, [r4]
	ldr r2, [r0]
	ldrb r6, [r2, #0x11]
	ldr r0, _080D8500
	ldrb r1, [r0]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080D8510
	ldrb r0, [r2, #7]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #7]
	bl sub_080DA094
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D84D0
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl sub_080DC7E4
_080D84D0:
	ldr r4, _080D8504
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D8508
	adds r1, r4, #0
	bl SetTaskFuncWithFollowupFunc
	bl ContestPrintLinkStandby
	ldr r1, _080D850C
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D84FC: .4byte 0x02039BD4
_080D8500: .4byte 0x02039BCA
_080D8504: .4byte 0x080FD4DD
_080D8508: .4byte 0x080D9901
_080D850C: .4byte 0x03005B60
_080D8510:
	adds r0, r6, #0
	bl sub_080DC7E4
	ldr r0, _080D8528
	mov r1, sl
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8528: .4byte 0x03005B60
_080D852C:
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080D8540
	bl _080D98F0
_080D8540:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #2
	strh r1, [r0, #8]
	bl _080D98F0
_080D8552:
	adds r0, r6, #0
	bl sub_080DE788
	bl ContestDebugPrintBitStrings
	ldr r0, _080D8598
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r1, [r2, #0xc]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080D8582
	ldrb r1, [r2, #0xb]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _080D85A0
_080D8582:
	ldr r0, _080D859C
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x1f
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8598: .4byte 0x02039BD4
_080D859C: .4byte 0x03005B60
_080D85A0:
	bl sub_080DB000
	ldr r0, _080D85BC
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r6, [r1, #0x1c]
	movs r0, #3
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D85BC: .4byte 0x03005B60
_080D85C0:
	mov r4, r8
	lsls r4, r4, #2
	mov sl, r4
	ldr r1, _080D865C
	movs r2, #0
	adds r0, r1, #3
_080D85CC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080D85CC
	movs r7, #4
	mov r5, sb
	ldr r0, [r5]
	ldr r0, [r0, #0x18]
	movs r1, #0
	movs r2, #0x14
	bl memset
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl sub_080DE140
	ldr r4, _080D8660
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r3, [r0, #0x11]
	lsls r2, r3, #6
	adds r0, r2, r4
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r2, r1
	ldr r1, [r1]
	adds r4, #0x38
	adds r2, r2, r4
	ldr r2, [r2]
	bl sub_080DA8D8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _080D8664
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r3, r0, r2
	movs r1, #0x78
	strh r1, [r3, #0x24]
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _080D8668
	str r1, [r0]
	ldr r0, _080D866C
	mov r4, sl
	add r4, r8
	lsls r4, r4, #3
	adds r4, r4, r0
	strh r5, [r4, #0xc]
	ldr r1, _080D8670
	ldr r0, _080D8674
	ldrb r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl sub_080DC150
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_080DC34C
	strh r7, [r4, #8]
	bl _080D98F0
	.align 2, 0
_080D865C: .4byte 0x02024188
_080D8660: .4byte 0x02039AA0
_080D8664: .4byte 0x020205AC
_080D8668: .4byte 0x080D9925
_080D866C: .4byte 0x03005B60
_080D8670: .4byte 0x02023E88
_080D8674: .4byte 0x02023EAF
_080D8678:
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrb r5, [r2, #0xc]
	ldr r1, _080D86BC
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080D86C0
	cmp r1, r0
	beq _080D869C
	bl _080D98F0
_080D869C:
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D86B4
	bl _080D98F0
_080D86B4:
	movs r0, #5
	strh r0, [r2, #8]
	bl _080D98F0
	.align 2, 0
_080D86BC: .4byte 0x020205AC
_080D86C0: .4byte 0x08007141
_080D86C4:
	mov r5, sb
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r5, r0, #2
	adds r1, r5, r1
	ldrb r1, [r1, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D86EE
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x21
	strh r1, [r0, #8]
	bl _080D98F0
_080D86EE:
	bl sub_080DB000
	ldr r0, _080D8720
	lsls r1, r6, #6
	ldr r2, _080D8724
	adds r1, r1, r2
	bl StringCopy
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r3, r5, r0
	ldrh r1, [r3, #6]
	movs r0, #0xb1
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080D8730
	ldr r0, _080D8728
	lsls r1, r1, #3
	ldr r2, _080D872C
	adds r1, r1, r2
	bl StringCopy
	b _080D8740
	.align 2, 0
_080D8720: .4byte 0x02021C40
_080D8724: .4byte 0x02039AA2
_080D8728: .4byte 0x02021C54
_080D872C: .4byte 0x082EACC4
_080D8730:
	ldr r0, _080D8768
	ldr r2, _080D876C
	ldrb r1, [r3, #0xa]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
_080D8740:
	ldr r4, _080D8770
	ldr r1, _080D8774
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r1, _080D8778
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #6
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D8768: .4byte 0x02021C54
_080D876C: .4byte 0x08560E80
_080D8770: .4byte 0x02021C7C
_080D8774: .4byte 0x0824B346
_080D8778: .4byte 0x03005B60
_080D877C:
	bl Contest_RunTextPrinters
	adds r1, r0, #0
	cmp r1, #0
	beq _080D878A
	bl _080D98F0
_080D878A:
	ldr r0, _080D87A8
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x5a
	strb r1, [r0]
	ldr r1, _080D87AC
	mov r4, r8
	lsls r0, r4, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #7
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D87A8: .4byte 0x02039BD4
_080D87AC: .4byte 0x03005B60
_080D87B0:
	mov r5, sb
	ldr r1, [r5]
	ldr r0, [r1]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	bl SanitizeMove
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl sub_080DDFC8
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl sub_080DE140
	adds r0, r4, #0
	bl SelectContestMoveBankTarget
	adds r0, r4, #0
	bl DoMoveAnim
	ldr r1, _080D8804
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #8
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D8804: .4byte 0x03005B60
_080D8808:
	ldr r0, _080D8848
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080D884C
	ldrb r4, [r0]
	cmp r4, #0
	beq _080D881C
	bl _080D98F0
_080D881C:
	adds r0, r6, #0
	bl sub_080DE114
	ldr r0, _080D8850
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D8858
	ldr r0, _080D8854
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r4, [r1, #0x1c]
	movs r0, #9
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8848: .4byte 0x02038098
_080D884C: .4byte 0x0203809D
_080D8850: .4byte 0x02039BD4
_080D8854: .4byte 0x03005B60
_080D8858:
	ldr r1, [r1, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080D8872
	adds r0, r6, #0
	bl sub_080DBDD8
_080D8872:
	bl sub_080DD890
	ldr r0, _080D8880
	mov r4, r8
	lsls r1, r4, #2
	b _080D898A
	.align 2, 0
_080D8880: .4byte 0x03005B60
_080D8884:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrh r0, [r2, #0x1c]
	adds r1, r0, #1
	strh r1, [r2, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bgt _080D88A0
	bl _080D98F0
_080D88A0:
	movs r0, #0
	strh r0, [r2, #0x1c]
	movs r0, #7
	strh r0, [r2, #8]
	bl _080D98F0
_080D88AC:
	mov r0, r8
	lsls r2, r0, #2
	adds r0, r2, r0
	lsls r0, r0, #3
	adds r7, r0, r4
	movs r0, #0
	strh r0, [r7, #0xa]
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0, #4]
	mov ip, r0
	lsls r1, r6, #3
	subs r0, r1, r6
	lsls r5, r0, #2
	mov r0, ip
	adds r3, r5, r0
	ldrb r0, [r3, #0x13]
	mov sl, r2
	str r1, [sp, #4]
	cmp r0, #0xff
	beq _080D88F2
	ldrb r1, [r3, #0x13]
	adds r0, r6, #0
	bl sub_080DCBC0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0, #4]
	adds r0, r5, r0
	movs r1, #0xff
	strb r1, [r0, #0x13]
	movs r0, #0x18
	strh r0, [r7, #8]
	bl _080D98F0
_080D88F2:
	ldrb r0, [r3, #0x14]
	cmp r0, #0xff
	beq _080D8970
	movs r7, #0
	cmp r7, r6
	beq _080D8906
	mov r2, ip
	ldrb r0, [r2, #0x13]
	cmp r0, #0xff
	bne _080D8924
_080D8906:
	adds r7, #1
	cmp r7, #3
	bgt _080D8924
	cmp r7, r6
	beq _080D8906
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #4]
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x13]
	cmp r0, #0xff
	beq _080D8906
_080D8924:
	cmp r7, #4
	bne _080D8960
	mov r4, sb
	ldr r0, [r4]
	ldr r0, [r0, #4]
	ldr r5, [sp, #4]
	subs r4, r5, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	ldrb r1, [r0, #0x14]
	adds r0, r6, #0
	bl sub_080DCBC0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0, #4]
	adds r4, r4, r0
	movs r0, #0xff
	strb r0, [r4, #0x14]
	ldr r1, _080D895C
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D895C: .4byte 0x03005B60
_080D8960:
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x30
	strh r1, [r0, #8]
	bl _080D98F0
_080D8970:
	movs r0, #0x30
	strh r0, [r7, #8]
	bl _080D98F0
_080D8978:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D8984
	bl _080D98F0
_080D8984:
	ldr r0, _080D8998
	mov r2, r8
	lsls r1, r2, #2
_080D898A:
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x17
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8998: .4byte 0x03005B60
_080D899C:
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x11]
	movs r3, #3
	ands r3, r0
	cmp r3, #1
	bne _080D89BC
	movs r0, #5
	bl sub_080DCE84
	b _080D89D2
_080D89BC:
	cmp r3, #2
	bne _080D89C8
	movs r0, #6
	bl sub_080DCE84
	b _080D89D2
_080D89C8:
	cmp r3, #3
	bne _080D8A00
	movs r0, #7
	bl sub_080DCE84
_080D89D2:
	ldr r0, _080D89E8
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x31
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D89E8: .4byte 0x03005B60
_080D89EC:
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
	ldrb r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080D8A00
	bl _080D98F0
_080D8A00:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x2f
	strh r1, [r0, #8]
	bl _080D98F0
_080D8A12:
	movs r0, #1
	bl sub_080DD76C
	ldr r0, _080D8A2C
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xc
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8A2C: .4byte 0x03005B60
_080D8A30:
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r0, #0
	adds r2, r6, #0
	bl sub_080DB78C
	ldr r1, _080D8A60
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xd
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D8A60: .4byte 0x03005B60
_080D8A64:
	mov r0, sb
	ldr r1, [r0]
	ldr r0, [r1]
	ldrb r0, [r0, #0x11]
	ldr r1, [r1, #0x14]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080D8A80
	bl _080D98F0
_080D8A80:
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x23
	strh r1, [r0, #8]
	bl _080D98F0
_080D8A92:
	mov r2, sb
	ldr r0, [r2]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x10
	bne _080D8AB0
	movs r0, #8
	bl sub_080DCE84
_080D8AB0:
	ldr r0, _080D8AC4
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x24
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8AC4: .4byte 0x03005B60
_080D8AC8:
	mov r5, sb
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080D8ADC
	bl _080D98F0
_080D8ADC:
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x25
	strh r1, [r0, #8]
	bl _080D98F0
_080D8AEE:
	adds r0, r6, #0
	movs r1, #1
	bl sub_080DAD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D8B18
	ldr r1, _080D8B14
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x1c]
	movs r1, #0x26
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D8B14: .4byte 0x03005B60
_080D8B18:
	ldr r0, _080D8B28
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	b _080D8B4C
	.align 2, 0
_080D8B28: .4byte 0x03005B60
_080D8B2C:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r4
	ldrh r0, [r1, #0x1c]
	adds r0, #1
	strh r0, [r1, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bgt _080D8B48
	bl _080D98F0
_080D8B48:
	movs r0, #0
	strh r0, [r1, #0x1c]
_080D8B4C:
	movs r0, #0x32
	strh r0, [r1, #8]
	bl _080D98F0
_080D8B54:
	adds r0, r6, #0
	bl sub_080DAEFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D8B66
	movs r0, #0x63
	bl PlaySE
_080D8B66:
	ldr r0, _080D8B7C
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x19
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8B7C: .4byte 0x03005B60
_080D8B80:
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0
	strh r1, [r0, #0xa]
	movs r1, #0x1a
	strh r1, [r0, #8]
	bl _080D98F0
_080D8B96:
	movs r3, #0
	movs r5, #0
	str r5, [sp]
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r2, #0xa
	ldrsh r7, [r0, r2]
	mov sl, r1
	cmp r7, #3
	bgt _080D8C10
	ldr r5, _080D8BD4
	ldr r2, _080D8BD8
_080D8BB4:
	movs r3, #0
	str r3, [sp]
	adds r0, r3, #0
	cmp r0, r6
	beq _080D8BDC
	ldrb r0, [r5]
	cmp r0, r7
	bne _080D8BDC
	ldr r0, [r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x13]
	cmp r0, #0xff
	beq _080D8BDC
	movs r1, #1
	str r1, [sp]
	b _080D8C04
	.align 2, 0
_080D8BD4: .4byte 0x02039BC6
_080D8BD8: .4byte 0x02039BD4
_080D8BDC:
	adds r3, #1
	cmp r3, #3
	bgt _080D8C04
	cmp r3, r6
	beq _080D8BDC
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, r7
	bne _080D8BDC
	ldr r0, [r2]
	ldr r1, [r0, #4]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x13]
	cmp r0, #0xff
	beq _080D8BDC
	movs r0, #1
	str r0, [sp]
_080D8C04:
	ldr r1, [sp]
	cmp r1, #0
	bne _080D8C1A
	adds r7, #1
	cmp r7, #3
	ble _080D8BB4
_080D8C10:
	ldr r2, [sp]
	lsls r0, r2, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080D8C5C
_080D8C1A:
	mov r5, sl
	add r5, r8
	lsls r5, r5, #3
	adds r5, r5, r4
	ldr r0, _080D8C58
	adds r0, r3, r0
	ldrb r0, [r0]
	strh r0, [r5, #0xa]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov r4, sb
	ldr r1, [r4]
	ldr r1, [r1, #4]
	lsls r4, r3, #3
	subs r4, r4, r3
	lsls r4, r4, #2
	adds r1, r4, r1
	ldrb r1, [r1, #0x13]
	bl sub_080DCBC0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0, #4]
	adds r4, r4, r0
	movs r0, #0xff
	strb r0, [r4, #0x13]
	movs r0, #0x1b
	strh r0, [r5, #8]
	bl _080D98F0
	.align 2, 0
_080D8C58: .4byte 0x02039BC6
_080D8C5C:
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r2, [r0, #0xa]
	strh r2, [r0, #0x1c]
	movs r1, #0x33
	strh r1, [r0, #8]
	bl sub_080DAFE8
	bl _080D98F0
_080D8C74:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D8C80
	bl _080D98F0
_080D8C80:
	ldr r0, _080D8C94
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x1c
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8C94: .4byte 0x03005B60
_080D8C98:
	movs r7, #0
	mov r3, r8
	lsls r0, r3, #2
	adds r1, r0, r3
	lsls r1, r1, #3
	adds r1, r1, r4
	movs r4, #0xa
	ldrsh r2, [r1, r4]
	ldr r1, _080D8CF8
	mov sl, r0
	adds r5, r1, #0
	ldrb r0, [r5]
	cmp r2, r0
	beq _080D8CC2
	adds r1, r2, #0
	adds r2, r5, #0
_080D8CB8:
	adds r7, #1
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _080D8CB8
_080D8CC2:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #4]
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xe]
	ldrh r0, [r0, #2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r1, #0
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	bl sub_080DB78C
	ldr r1, _080D8CFC
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x1d
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D8CF8: .4byte 0x02039BC6
_080D8CFC: .4byte 0x03005B60
_080D8D00:
	movs r7, #0
	mov r2, r8
	lsls r0, r2, #2
	adds r1, r0, r2
	lsls r1, r1, #3
	adds r1, r1, r4
	movs r5, #0xa
	ldrsh r3, [r1, r5]
	ldr r1, _080D8D50
	mov sl, r0
	adds r5, r1, #0
	ldrb r0, [r5]
	cmp r3, r0
	beq _080D8D26
_080D8D1C:
	adds r7, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r3, r0
	bne _080D8D1C
_080D8D26:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080D8D3E
	bl _080D98F0
_080D8D3E:
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x27
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D8D50: .4byte 0x02039BC6
_080D8D54:
	movs r7, #0
	mov r2, r8
	lsls r0, r2, #2
	adds r1, r0, r2
	lsls r1, r1, #3
	adds r1, r1, r4
	movs r3, #0xa
	ldrsh r2, [r1, r3]
	ldr r1, _080D8DA4
	mov sl, r0
	adds r5, r1, #0
	ldrb r4, [r5]
	cmp r2, r4
	beq _080D8D7E
	adds r1, r2, #0
	adds r2, r5, #0
_080D8D74:
	adds r7, #1
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _080D8D74
_080D8D7E:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_080DAD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D8DAC
	ldr r1, _080D8DA8
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x1c]
	movs r1, #0x28
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D8DA4: .4byte 0x02039BC6
_080D8DA8: .4byte 0x03005B60
_080D8DAC:
	ldr r0, _080D8DB8
	mov r1, sl
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	b _080D8DDC
	.align 2, 0
_080D8DB8: .4byte 0x03005B60
_080D8DBC:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r4
	ldrh r0, [r1, #0x1c]
	adds r0, #1
	strh r0, [r1, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bgt _080D8DD8
	bl _080D98F0
_080D8DD8:
	movs r0, #0
	strh r0, [r1, #0x1c]
_080D8DDC:
	movs r0, #0x1e
	strh r0, [r1, #8]
	bl _080D98F0
_080D8DE4:
	movs r7, #0
	ldr r2, _080D8E30
	ldrb r3, [r2]
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r4, r0, r4
	movs r5, #0xa
	ldrsh r0, [r4, r5]
	mov sl, r1
	adds r5, r2, #0
	cmp r3, r0
	beq _080D8E16
	adds r3, r5, #0
	adds r2, r4, #0
_080D8E04:
	adds r7, #1
	cmp r7, #3
	bgt _080D8E16
	adds r0, r7, r3
	ldrb r1, [r0]
	movs r4, #0xa
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _080D8E04
_080D8E16:
	lsls r4, r7, #0x18
	lsrs r0, r4, #0x18
	bl sub_080DAEFC
	lsls r0, r0, #0x18
	adds r6, r4, #0
	cmp r0, #0
	beq _080D8E34
	movs r0, #0x63
	bl PlaySE
	b _080D8E3A
	.align 2, 0
_080D8E30: .4byte 0x02039BC6
_080D8E34:
	movs r0, #0x64
	bl PlaySE
_080D8E3A:
	ldr r5, _080D8E80
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r4, r0, #2
	adds r1, r4, r1
	ldrb r1, [r1, #0x15]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080D8E68
	lsrs r0, r6, #0x18
	bl sub_080DBDD8
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x15]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x15]
_080D8E68:
	ldr r0, _080D8E84
	mov r1, sl
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	movs r0, #0x1a
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8E80: .4byte 0x02039BD4
_080D8E84: .4byte 0x03005B60
_080D8E88:
	mov r5, r8
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r4, r0, r4
	ldrh r0, [r4, #0x1c]
	adds r1, r0, #1
	strh r1, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r2
	cmp r0, #9
	bgt _080D8EA6
	bl _080D98F0
_080D8EA6:
	movs r0, #0
	strh r0, [r4, #0x1c]
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r1, [r2, #0xc]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080D8ECC
	ldrb r1, [r2, #0x11]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080D8EEE
_080D8ECC:
	bl sub_080DB000
	ldr r0, _080D8F00
	lsls r1, r6, #6
	ldr r2, _080D8F04
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _080D8F08
	ldr r1, _080D8F0C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
_080D8EEE:
	ldr r0, _080D8F10
	mov r1, sl
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x34
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8F00: .4byte 0x02021C40
_080D8F04: .4byte 0x02039AA2
_080D8F08: .4byte 0x02021C7C
_080D8F0C: .4byte 0x0824C04A
_080D8F10: .4byte 0x03005B60
_080D8F14:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D8F20
	bl _080D98F0
_080D8F20:
	ldr r0, _080D8F4C
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x15]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080D8F54
	ldr r0, _080D8F50
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x11
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8F4C: .4byte 0x02039BD4
_080D8F50: .4byte 0x03005B60
_080D8F54:
	ldr r0, _080D8F68
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xe
	strh r0, [r1, #8]
	bl _080D98F0
	.align 2, 0
_080D8F68: .4byte 0x03005B60
_080D8F6C:
	mov r4, sb
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x16]
	lsls r4, r0, #0x18
	lsrs r5, r4, #0x18
	cmp r5, #0
	beq _080D8FD4
	bl sub_080DB000
	asrs r0, r4, #0x18
	cmp r0, #1
	bne _080D8F98
	ldr r0, _080D8F94
	b _080D8F9E
	.align 2, 0
_080D8F94: .4byte 0x0824BCF2
_080D8F98:
	cmp r0, #2
	bne _080D8FAC
	ldr r0, _080D8FA8
_080D8F9E:
	movs r1, #1
	bl Contest_StartTextPrinter
	b _080D8FB4
	.align 2, 0
_080D8FA8: .4byte 0x0824BD18
_080D8FAC:
	ldr r0, _080D8FCC
	movs r1, #1
	bl Contest_StartTextPrinter
_080D8FB4:
	movs r0, #3
	bl sub_080DCE84
	ldr r1, _080D8FD0
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x1c]
	b _080D900A
	.align 2, 0
_080D8FCC: .4byte 0x0824BD3E
_080D8FD0: .4byte 0x03005B60
_080D8FD4:
	bl sub_080DB000
	ldr r0, _080D9014
	lsls r1, r6, #6
	ldr r2, _080D9018
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _080D901C
	ldr r1, _080D9020
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	movs r0, #2
	bl sub_080DCE84
	ldr r1, _080D9024
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #0x1c]
_080D900A:
	movs r1, #0x2d
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D9014: .4byte 0x02021C40
_080D9018: .4byte 0x02039AA2
_080D901C: .4byte 0x02021C7C
_080D9020: .4byte 0x0824BCCF
_080D9024: .4byte 0x03005B60
_080D9028:
	mov r3, sb
	ldr r0, [r3]
	ldr r2, [r0]
	ldrb r1, [r2, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080D903C
	bl _080D98F0
_080D903C:
	ldrb r0, [r2, #0x11]
	bl sub_080DC118
	ldr r1, _080D9058
	mov r4, r8
	lsls r0, r4, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xf
	strh r1, [r0, #8]
	bl _080D98F0
	.align 2, 0
_080D9058: .4byte 0x03005B60
_080D905C:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D9068
	bl _080D98F0
_080D9068:
	ldr r1, _080D90C4
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	bgt _080D9086
	bl _080D98F0
_080D9086:
	ldr r7, _080D90C8
	ldr r0, [r7]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r5, r0, #2
	adds r2, r5, r1
	ldrb r1, [r2, #0x15]
	movs r0, #0x10
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	bne _080D90BA
	movs r1, #2
	ldrsh r0, [r2, r1]
	ldrb r1, [r2, #0x17]
	adds r2, r6, #0
	bl sub_080DB78C
	ldr r0, [r7]
	ldr r1, [r0, #4]
	adds r1, r5, r1
	ldrh r0, [r1, #2]
	ldrb r2, [r1, #0x17]
	adds r0, r0, r2
	strh r0, [r1, #2]
_080D90BA:
	mov r3, r8
	strh r3, [r4, #8]
	bl _080D98F0
	.align 2, 0
_080D90C4: .4byte 0x03005B60
_080D90C8: .4byte 0x02039BD4
_080D90CC:
	mov r5, sb
	ldr r0, [r5]
	ldr r1, [r0, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080D90E8
	bl _080D98F0
_080D90E8:
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r1, [r0, #0x1c]
	movs r1, #0x11
	strh r1, [r0, #8]
	bl _080D98F0
_080D90FC:
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x15]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D9164
	bl sub_080DB000
	ldr r0, _080D9150
	lsls r1, r6, #6
	ldr r2, _080D9154
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _080D9158
	ldr r1, _080D915C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r0, _080D9160
	mov r5, r8
	lsls r4, r5, #2
	add r4, r8
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #0x1c]
	bl sub_080DCE84
	movs r0, #0x2e
	strh r0, [r4, #8]
	b _080D98F0
	.align 2, 0
_080D9150: .4byte 0x02021C40
_080D9154: .4byte 0x02039AA2
_080D9158: .4byte 0x02021C7C
_080D915C: .4byte 0x0824BFBE
_080D9160: .4byte 0x03005B60
_080D9164:
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x29
	strh r1, [r0, #8]
	b _080D98F0
_080D9174:
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080D9186
	b _080D98F0
_080D9186:
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x13
	strh r1, [r0, #8]
	b _080D98F0
_080D9196:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D91A0
	b _080D98F0
_080D91A0:
	ldr r5, _080D91DC
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r4, r6, #3
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r1, r4, r1
	movs r2, #2
	ldrsh r0, [r1, r2]
	ldrb r1, [r1, #0x18]
	rsbs r1, r1, #0
	adds r2, r6, #0
	bl sub_080DB78C
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r4, r4, r0
	ldrb r1, [r4, #0x18]
	ldrh r0, [r4, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
	ldr r1, _080D91E0
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x12
	strh r1, [r0, #8]
	b _080D98F0
	.align 2, 0
_080D91DC: .4byte 0x02039BD4
_080D91E0: .4byte 0x03005B60
_080D91E4:
	bl ContestDebugDoPrint
	ldr r0, _080D921C
	ldr r0, [r0]
	ldr r1, [r0, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _080D9202
	b _080D98F0
_080D9202:
	ldr r0, _080D9220
	mov r5, r8
	lsls r4, r5, #2
	add r4, r8
	lsls r4, r4, #3
	adds r4, r4, r0
	strh r3, [r4, #0x1c]
	bl sub_080DB000
	movs r0, #0x29
	strh r0, [r4, #8]
	b _080D98F0
	.align 2, 0
_080D921C: .4byte 0x02039BD4
_080D9220: .4byte 0x03005B60
_080D9224:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r0, #0x10]
	ldrb r1, [r2, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D924E
	ldr r0, [r2]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1d
	cmp r6, r0
	beq _080D924E
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0x39
	strh r1, [r0, #8]
	b _080D98F0
_080D924E:
	mov r3, sb
	ldr r1, [r3]
	ldr r0, [r1, #0x10]
	ldrb r0, [r0]
	str r0, [sp]
	ldr r1, [r1, #4]
	lsls r2, r6, #3
	subs r0, r2, r6
	lsls r0, r0, #2
	adds r5, r0, r1
	ldrb r1, [r5, #0x11]
	movs r0, #0x10
	ands r0, r1
	str r2, [sp, #4]
	cmp r0, #0
	beq _080D928C
	movs r4, #1
	str r4, [sp]
	ldr r0, _080D9284
	ldrh r1, [r5, #6]
	lsls r1, r1, #3
	ldr r2, _080D9288
	adds r1, r1, r2
	bl StringCopy
	b _080D92A6
	.align 2, 0
_080D9284: .4byte 0x02021C68
_080D9288: .4byte 0x082EACC4
_080D928C:
	ldr r0, _080D930C
	ldr r3, _080D9310
	ldr r2, _080D9314
	ldrh r1, [r5, #6]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1b
	adds r1, r1, r3
	ldr r1, [r1]
	bl StringCopy
_080D92A6:
	ldr r5, [sp]
	lsls r0, r5, #0x18
	cmp r0, #0
	ble _080D92CA
	ldr r0, _080D9318
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldr r2, [sp, #4]
	subs r0, r2, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x15]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D92CA
	movs r3, #0
	str r3, [sp]
_080D92CA:
	bl sub_080DB000
	ldr r0, _080D931C
	lsls r1, r6, #6
	ldr r2, _080D9320
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _080D9318
	ldr r0, [r4]
	ldr r1, [r0]
	ldrb r0, [r1, #0x13]
	ldr r5, [sp]
	lsls r2, r5, #0x18
	asrs r3, r2, #0x18
	adds r0, r3, r0
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	adds r5, r2, #0
	cmp r0, #0
	bge _080D92FE
	movs r0, #0
	strb r0, [r1, #0x13]
_080D92FE:
	cmp r3, #0
	bne _080D9328
	ldr r0, _080D9324
	mov r2, r8
	lsls r1, r2, #2
	b _080D9748
	.align 2, 0
_080D930C: .4byte 0x02021C68
_080D9310: .4byte 0x08560E6C
_080D9314: .4byte 0x08565FCC
_080D9318: .4byte 0x02039BD4
_080D931C: .4byte 0x02021C40
_080D9320: .4byte 0x02039AA2
_080D9324: .4byte 0x03005B60
_080D9328:
	cmp r3, #0
	bge _080D9340
	ldr r0, _080D9338
	ldr r1, _080D933C
	bl StringExpandPlaceholders
	b _080D936C
	.align 2, 0
_080D9338: .4byte 0x02021C7C
_080D933C: .4byte 0x0824C008
_080D9340:
	cmp r3, #0
	ble _080D9364
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bgt _080D9364
	ldr r0, _080D935C
	ldr r1, _080D9360
	bl StringExpandPlaceholders
	b _080D936C
	.align 2, 0
_080D935C: .4byte 0x02021C7C
_080D9360: .4byte 0x0824BFE6
_080D9364:
	ldr r0, _080D9390
	ldr r1, _080D9394
	bl StringExpandPlaceholders
_080D936C:
	ldr r0, _080D9390
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r1, _080D9398
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #0
	strh r0, [r1, #0x1c]
	strh r0, [r1, #0x1e]
	cmp r5, #0
	bge _080D939C
	movs r0, #0x35
	strh r0, [r1, #8]
	b _080D98F0
	.align 2, 0
_080D9390: .4byte 0x02021C7C
_080D9394: .4byte 0x0824C029
_080D9398: .4byte 0x03005B60
_080D939C:
	movs r0, #0x36
	strh r0, [r1, #8]
	b _080D98F0
_080D93A2:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r4, r0, r4
	movs r0, #0x1c
	ldrsh r3, [r4, r0]
	cmp r3, #1
	beq _080D93E0
	cmp r3, #1
	bgt _080D93BE
	cmp r3, #0
	beq _080D93C8
	b _080D98F0
_080D93BE:
	cmp r3, #2
	beq _080D9404
	cmp r3, #3
	beq _080D943E
	b _080D98F0
_080D93C8:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #1
	bl sub_080DD634
	ldr r0, _080D93DC
	bl PlayFanfare
	b _080D9436
	.align 2, 0
_080D93DC: .4byte 0x00000187
_080D93E0:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	ands r3, r0
	cmp r3, #0
	beq _080D93F0
	b _080D98F0
_080D93F0:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D93FA
	b _080D98F0
_080D93FA:
	movs r0, #1
	rsbs r0, r0, #0
	bl ShowAndUpdateApplauseMeter
	b _080D9436
_080D9404:
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _080D941A
	b _080D98F0
_080D941A:
	ldrh r0, [r4, #0x1e]
	adds r1, r0, #1
	strh r1, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _080D942A
	b _080D98F0
_080D942A:
	strh r2, [r4, #0x1e]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl sub_080DD634
_080D9436:
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	b _080D98F0
_080D943E:
	ldr r0, _080D945C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080D9450
	b _080D98F0
_080D9450:
	strh r0, [r4, #0x1c]
	strh r0, [r4, #0x1e]
	movs r0, #0x2b
	strh r0, [r4, #8]
	b _080D98F0
	.align 2, 0
_080D945C: .4byte 0x02037C74
_080D9460:
	mov r3, r8
	lsls r1, r3, #2
	adds r0, r1, r3
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r5, #0x1c
	ldrsh r0, [r0, r5]
	mov sl, r1
	cmp r0, #4
	bls _080D9476
	b _080D98F0
_080D9476:
	lsls r0, r0, #2
	ldr r1, _080D9480
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D9480: .4byte 0x080D9484
_080D9484: @ jump table
	.4byte _080D9498 @ case 0
	.4byte _080D94A8 @ case 1
	.4byte _080D94CC @ case 2
	.4byte _080D9536 @ case 3
	.4byte _080D957C @ case 4
_080D9498:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D94A2
	b _080D98F0
_080D94A2:
	movs r0, #1
	movs r1, #1
	b _080D9560
_080D94A8:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D94BA
	b _080D98F0
_080D94BA:
	bl sub_080DD570
	movs r0, #0xdf
	bl PlaySE
	movs r0, #1
	bl ShowAndUpdateApplauseMeter
	b _080D9564
_080D94CC:
	mov r3, sb
	ldr r2, [r3]
	ldr r0, [r2]
	ldrb r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _080D94E2
	b _080D98F0
_080D94E2:
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r5, r0, r4
	ldrh r0, [r5, #0x1e]
	adds r1, r0, #1
	strh r1, [r5, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _080D94FA
	b _080D98F0
_080D94FA:
	strh r3, [r5, #0x1e]
	ldr r0, [r2, #4]
	lsls r4, r6, #3
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	movs r1, #2
	ldrsh r0, [r0, r1]
	ldr r1, [r2, #0x10]
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r6, #0
	bl sub_080DB78C
	mov r2, sb
	ldr r1, [r2]
	ldr r0, [r1, #4]
	adds r4, r4, r0
	ldr r0, [r1, #0x10]
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
	b _080D98F0
_080D9536:
	mov r4, sb
	ldr r2, [r4]
	ldr r1, [r2, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080D954C
	b _080D98F0
_080D954C:
	ldr r0, [r2]
	ldrb r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080D955A
	b _080D98F0
_080D955A:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #1
_080D9560:
	bl sub_080DD634
_080D9564:
	ldr r0, _080D9578
	mov r1, sl
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x1c]
	adds r0, #1
	strh r0, [r1, #0x1c]
	b _080D98F0
	.align 2, 0
_080D9578: .4byte 0x03005B60
_080D957C:
	ldr r0, _080D95A0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _080D958E
	b _080D98F0
_080D958E:
	mov r0, sl
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r3, [r0, #0x1c]
	strh r3, [r0, #0x1e]
	movs r1, #0x2b
	strh r1, [r0, #8]
	b _080D98F0
	.align 2, 0
_080D95A0: .4byte 0x02037C74
_080D95A4:
	mov r5, sb
	ldr r0, [r5]
	ldr r1, [r0, #0x14]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080D95BA
	b _080D98F0
_080D95BA:
	bl sub_080DB000
	ldr r0, _080D95C8
	mov r2, r8
	lsls r1, r2, #2
	b _080D9748
	.align 2, 0
_080D95C8: .4byte 0x03005B60
_080D95CC:
	bl sub_080DB000
	ldr r0, _080D9630
	ldr r5, _080D9634
	ldr r1, [r5]
	ldr r1, [r1, #0x10]
	ldr r1, [r1]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1d
	lsls r1, r1, #6
	ldr r4, _080D9638
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080D963C
	lsls r1, r6, #6
	adds r1, r1, r4
	bl StringCopy
	ldr r0, _080D9640
	ldr r1, [r5]
	ldr r2, [r1, #4]
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r1, [r1, #6]
	lsls r1, r1, #3
	ldr r2, _080D9644
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _080D9648
	ldr r1, _080D964C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r1, _080D9650
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x3a
	strh r1, [r0, #8]
	b _080D98F0
	.align 2, 0
_080D9630: .4byte 0x02021C68
_080D9634: .4byte 0x02039BD4
_080D9638: .4byte 0x02039AA2
_080D963C: .4byte 0x02021C40
_080D9640: .4byte 0x02021C54
_080D9644: .4byte 0x082EACC4
_080D9648: .4byte 0x02021C7C
_080D964C: .4byte 0x0824C091
_080D9650: .4byte 0x03005B60
_080D9654:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D965E
	b _080D98F0
_080D965E:
	bl sub_080DB000
	ldr r4, _080D9688
	ldr r1, _080D968C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r1, _080D9690
	mov r4, r8
	lsls r0, r4, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x3b
	strh r1, [r0, #8]
	b _080D98F0
	.align 2, 0
_080D9688: .4byte 0x02021C7C
_080D968C: .4byte 0x0824C0B1
_080D9690: .4byte 0x03005B60
_080D9694:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D969E
	b _080D98F0
_080D969E:
	bl sub_080DB000
	ldr r0, _080D96AC
	mov r5, r8
	lsls r1, r5, #2
	b _080D9748
	.align 2, 0
_080D96AC: .4byte 0x03005B60
_080D96B0:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r4, r0, #2
	adds r2, r4, r1
	ldrb r1, [r2, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080D96D0
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x15]
_080D96D0:
	adds r0, r6, #0
	bl sub_080DC118
	ldr r0, _080D971C
	lsls r1, r6, #6
	ldr r2, _080D9720
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080D9724
	mov r2, sb
	ldr r1, [r2]
	ldr r1, [r1, #4]
	adds r1, r4, r1
	ldrh r1, [r1, #6]
	lsls r1, r1, #3
	ldr r2, _080D9728
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _080D972C
	ldr r1, _080D9730
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r1, _080D9734
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x22
	strh r1, [r0, #8]
	b _080D98F0
	.align 2, 0
_080D971C: .4byte 0x02021C40
_080D9720: .4byte 0x02039AA2
_080D9724: .4byte 0x02021C54
_080D9728: .4byte 0x082EACC4
_080D972C: .4byte 0x02021C7C
_080D9730: .4byte 0x0824BEC1
_080D9734: .4byte 0x03005B60
_080D9738:
	bl Contest_RunTextPrinters
	cmp r0, #0
	beq _080D9742
	b _080D98F0
_080D9742:
	ldr r0, _080D9754
	mov r4, r8
	lsls r1, r4, #2
_080D9748:
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x37
	strh r0, [r1, #8]
	b _080D98F0
	.align 2, 0
_080D9754: .4byte 0x03005B60
_080D9758:
	bl TryMoveApplauseMeterOffscreen
	ldr r0, _080D9770
	mov r5, r8
	lsls r1, r5, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x38
	strh r0, [r1, #8]
	b _080D98F0
	.align 2, 0
_080D9770: .4byte 0x03005B60
_080D9774:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r0]
	ldrb r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080D978A
	b _080D98F0
_080D978A:
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	cmp r0, #4
	ble _080D9798
	strb r1, [r2, #0x13]
	bl UpdateApplauseMeter
_080D9798:
	ldr r0, _080D97AC
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xa
	strh r0, [r1, #8]
	b _080D98F0
	.align 2, 0
_080D97AC: .4byte 0x03005B60
_080D97B0:
	mov r3, r8
	lsls r2, r3, #2
	add r2, r8
	lsls r2, r2, #3
	adds r2, r2, r4
	ldrb r5, [r2, #0xc]
	ldr r1, _080D97D4
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _080D97D8
	str r1, [r0]
	movs r0, #0xb
	strh r0, [r2, #8]
	b _080D98F0
	.align 2, 0
_080D97D4: .4byte 0x020205AC
_080D97D8: .4byte 0x080D9955
_080D97DC:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r4, r0, r4
	ldrb r5, [r4, #0xc]
	ldr r1, _080D9810
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r6, r0, r1
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _080D98F0
	adds r0, r6, #0
	bl FreeSpriteOamMatrix
	adds r0, r6, #0
	bl DestroySprite
	movs r0, #0x14
	strh r0, [r4, #8]
	b _080D98F0
	.align 2, 0
_080D9810: .4byte 0x020205AC
_080D9814:
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0
	strh r1, [r0, #0x1c]
	movs r1, #0x15
	strh r1, [r0, #8]
	b _080D98F0
_080D9828:
	bl sub_080DB000
	ldr r0, _080D985C
	lsls r1, r6, #6
	ldr r2, _080D9860
	adds r1, r1, r2
	bl StringCopy
	ldr r4, _080D9864
	ldr r1, _080D9868
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r1, _080D986C
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x20
	strh r1, [r0, #8]
	b _080D98F0
	.align 2, 0
_080D985C: .4byte 0x02021C40
_080D9860: .4byte 0x02039AA2
_080D9864: .4byte 0x02021C7C
_080D9868: .4byte 0x0824B354
_080D986C: .4byte 0x03005B60
_080D9870:
	bl Contest_RunTextPrinters
	cmp r0, #0
	bne _080D98F0
	ldr r0, _080D988C
	mov r3, r8
	lsls r1, r3, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x15
	strh r0, [r1, #8]
	b _080D98F0
	.align 2, 0
_080D988C: .4byte 0x03005B60
_080D9890:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r1, r0, r4
	ldrh r0, [r1, #0x1c]
	adds r0, #1
	strh r0, [r1, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _080D98F0
	movs r0, #0
	strh r0, [r1, #0x1c]
	movs r0, #0x16
	strh r0, [r1, #8]
	b _080D98F0
_080D98B2:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	movs r2, #0
	strb r0, [r1, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080D98E4
	mov r3, r8
	lsls r0, r3, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	ldr r1, _080D98E0
	str r1, [r0]
	b _080D98F0
	.align 2, 0
_080D98E0: .4byte 0x080D9989
_080D98E4:
	mov r5, r8
	lsls r0, r5, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r4
	strh r2, [r0, #8]
_080D98F0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080D8334

	thumb_func_start sub_080D9900
sub_080D9900: @ 0x080D9900
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080D9920
	ldr r1, [r1]
	ldr r3, [r1]
	ldrb r2, [r3, #7]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r3, #7]
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_080D9920: .4byte 0x02039BD4
	thumb_func_end sub_080D9900

	thumb_func_start sub_080D9924
sub_080D9924: @ 0x080D9924
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x24]
	movs r3, #0x24
	ldrsh r2, [r1, r3]
	cmp r2, #0
	beq _080D9938
	subs r0, #2
	strh r0, [r1, #0x24]
	b _080D994C
_080D9938:
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _080D994C
	strh r2, [r1, #0x2e]
	ldr r0, _080D9950
	str r0, [r1, #0x1c]
_080D994C:
	pop {r0}
	bx r0
	.align 2, 0
_080D9950: .4byte 0x08007141
	thumb_func_end sub_080D9924

	thumb_func_start sub_080D9954
sub_080D9954: @ 0x080D9954
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x24]
	subs r0, #6
	strh r0, [r2, #0x24]
	movs r1, #0x20
	ldrsh r0, [r2, r1]
	movs r3, #0x24
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080D997E
	ldr r0, _080D9984
	str r0, [r2, #0x1c]
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_080D997E:
	pop {r0}
	bx r0
	.align 2, 0
_080D9984: .4byte 0x08007141
	thumb_func_end sub_080D9954

	thumb_func_start sub_080D9988
sub_080D9988: @ 0x080D9988
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D99AC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r5, r1, r2
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _080D9A1E
	cmp r0, #1
	bgt _080D99B0
	cmp r0, #0
	beq _080D99B6
	b _080D9A40
	.align 2, 0
_080D99AC: .4byte 0x03005B60
_080D99B0:
	cmp r0, #2
	beq _080D9A38
	b _080D9A40
_080D99B6:
	ldr r0, _080D9A04
	ldrb r1, [r0]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080D9A14
	ldr r0, _080D9A08
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r0, [r2, #7]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #7]
	bl sub_080DA094
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D99E4
	bl RankContestants
	bl sub_080DB17C
_080D99E4:
	ldr r4, _080D9A0C
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D9A10
	adds r1, r4, #0
	bl SetTaskFuncWithFollowupFunc
	bl ContestPrintLinkStandby
	strh r6, [r5, #8]
	b _080D9A40
	.align 2, 0
_080D9A04: .4byte 0x02039BCA
_080D9A08: .4byte 0x02039BD4
_080D9A0C: .4byte 0x080FD4DD
_080D9A10: .4byte 0x080D9901
_080D9A14:
	bl RankContestants
	bl sub_080DB17C
	b _080D9A2E
_080D9A1E:
	ldr r0, _080D9A34
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080D9A40
_080D9A2E:
	movs r0, #2
	strh r0, [r5, #8]
	b _080D9A40
	.align 2, 0
_080D9A34: .4byte 0x02039BD4
_080D9A38:
	movs r0, #0
	strh r0, [r5, #8]
	ldr r0, _080D9A48
	str r0, [r5]
_080D9A40:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9A48: .4byte 0x080D9A4D
	thumb_func_end sub_080D9988

	thumb_func_start sub_080D9A4C
sub_080D9A4C: @ 0x080D9A4C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	bl sub_080DD76C
	ldr r1, _080D9A74
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	ldr r1, _080D9A78
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9A74: .4byte 0x03005B60
_080D9A78: .4byte 0x080D9A7D
	thumb_func_end sub_080D9A4C

	thumb_func_start sub_080D9A7C
sub_080D9A7C: @ 0x080D9A7C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D9AA0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r0, #8
	ldrsh r5, [r4, r0]
	cmp r5, #1
	beq _080D9AC2
	cmp r5, #1
	bgt _080D9AA4
	cmp r5, #0
	beq _080D9AAA
	b _080D9B02
	.align 2, 0
_080D9AA0: .4byte 0x03005B60
_080D9AA4:
	cmp r5, #2
	beq _080D9AF4
	b _080D9B02
_080D9AAA:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _080D9B02
	movs r0, #2
	bl sub_080DDE00
	strh r5, [r4, #0xa]
	b _080D9AE6
_080D9AC2:
	ldr r0, _080D9AF0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080D9B02
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _080D9B02
	strh r1, [r4, #0xa]
_080D9AE6:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080D9B02
	.align 2, 0
_080D9AF0: .4byte 0x02039BD4
_080D9AF4:
	bl sub_080DBB10
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	ldr r0, _080D9B08
	str r0, [r4]
_080D9B02:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9B08: .4byte 0x080D9B0D
	thumb_func_end sub_080D9A7C

	thumb_func_start sub_080D9B0C
sub_080D9B0C: @ 0x080D9B0C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_080DBB28
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D9B2A
	ldr r0, _080D9B30
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D9B34
	str r0, [r1]
_080D9B2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9B30: .4byte 0x03005B60
_080D9B34: .4byte 0x080D9B39
	thumb_func_end sub_080D9B0C

	thumb_func_start sub_080D9B38
sub_080D9B38: @ 0x080D9B38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D9B64
	ldr r3, _080D9B68
	ldr r1, _080D9B6C
	str r2, [r1]
	str r3, [r1, #4]
	ldr r2, _080D9B70
	str r2, [r1, #8]
	ldr r1, [r1, #8]
	ldr r2, _080D9B74
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #8]
	movs r0, #2
	strh r0, [r1, #0xa]
	ldr r0, _080D9B78
	str r0, [r1]
	bx lr
	.align 2, 0
_080D9B64: .4byte 0x0201A204
_080D9B68: .4byte 0x020373B4
_080D9B6C: .4byte 0x040000D4
_080D9B70: .4byte 0x84000100
_080D9B74: .4byte 0x03005B60
_080D9B78: .4byte 0x080D9B7D
	thumb_func_end sub_080D9B38

	thumb_func_start sub_080D9B7C
sub_080D9B7C: @ 0x080D9B7C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D9BB4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080D9BAE
	movs r0, #0
	strh r0, [r1, #8]
	ldrh r0, [r1, #0xa]
	subs r0, #1
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080D9BAE
	ldr r0, _080D9BB8
	str r0, [r1]
_080D9BAE:
	pop {r0}
	bx r0
	.align 2, 0
_080D9BB4: .4byte 0x03005B60
_080D9BB8: .4byte 0x080D9BBD
	thumb_func_end sub_080D9B7C

	thumb_func_start sub_080D9BBC
sub_080D9BBC: @ 0x080D9BBC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D9C1C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r6, r1, r2
	movs r1, #8
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080D9C38
	ldr r0, _080D9C20
	ldr r0, [r0]
	ldr r5, _080D9C24
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r4, [r0, #0x1a]
	bl sub_080DB000
	ldr r0, _080D9C28
	ldrb r1, [r5]
	lsls r1, r1, #6
	ldr r2, _080D9C2C
	adds r1, r1, r2
	bl StringCopy
	ldr r5, _080D9C30
	ldr r0, _080D9C34
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r1, [r4]
	adds r0, r5, #0
	bl StringExpandPlaceholders
	adds r0, r5, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	b _080D9C4A
	.align 2, 0
_080D9C1C: .4byte 0x03005B60
_080D9C20: .4byte 0x02039BD4
_080D9C24: .4byte 0x02039BC5
_080D9C28: .4byte 0x02021C40
_080D9C2C: .4byte 0x02039AA2
_080D9C30: .4byte 0x02021C7C
_080D9C34: .4byte 0x08560CF4
_080D9C38:
	bl Contest_RunTextPrinters
	cmp r0, #0
	bne _080D9C4A
	strh r0, [r6, #8]
	ldr r0, _080D9C50
	str r0, [r6]
	bl ContestDebugDoPrint
_080D9C4A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9C50: .4byte 0x080D9C55
	thumb_func_end sub_080D9BBC

	thumb_func_start sub_080D9C54
sub_080D9C54: @ 0x080D9C54
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D9C84
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #8]
	adds r1, r0, #1
	strh r1, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _080D9C7E
	movs r0, #0
	strh r0, [r4, #8]
	bl sub_080DBB10
	ldr r0, _080D9C88
	str r0, [r4]
_080D9C7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9C84: .4byte 0x03005B60
_080D9C88: .4byte 0x080D9C8D
	thumb_func_end sub_080D9C54

	thumb_func_start sub_080D9C8C
sub_080D9C8C: @ 0x080D9C8C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_080DBB28
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D9CAE
	ldr r1, _080D9CB4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #8]
	ldr r1, _080D9CB8
	str r1, [r0]
_080D9CAE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9CB4: .4byte 0x03005B60
_080D9CB8: .4byte 0x080D9CBD
	thumb_func_end sub_080D9C8C

	thumb_func_start sub_080D9CBC
sub_080D9CBC: @ 0x080D9CBC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_080DD988
	ldr r1, _080D9CDC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080D9CE0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9CDC: .4byte 0x03005B60
_080D9CE0: .4byte 0x080DDB89
	thumb_func_end sub_080D9CBC

	thumb_func_start sub_080D9CE4
sub_080D9CE4: @ 0x080D9CE4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_080DDAB4
	ldr r1, _080D9D04
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080D9D08
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9D04: .4byte 0x03005B60
_080D9D08: .4byte 0x080D9D0D
	thumb_func_end sub_080D9CE4

	thumb_func_start sub_080D9D0C
sub_080D9D0C: @ 0x080D9D0C
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #8
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	movs r0, #0xc
	bl GetGpuReg
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	mov r3, sp
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldrb r0, [r4]
	ands r1, r0
	strb r1, [r4]
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #8
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0xc
	bl SetGpuReg
	ldr r2, _080D9D74
	ldr r0, [r2]
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	cmp r0, #5
	bne _080D9D80
	ldr r0, _080D9D78
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D9D7C
	b _080D9D90
	.align 2, 0
_080D9D74: .4byte 0x02039BD4
_080D9D78: .4byte 0x03005B60
_080D9D7C: .4byte 0x080D9DD9
_080D9D80:
	bl StartMoveApplauseMeterOnscreen
	ldr r0, _080D9D9C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D9DA0
_080D9D90:
	str r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9D9C: .4byte 0x03005B60
_080D9DA0: .4byte 0x080D9DA5
	thumb_func_end sub_080D9D0C

	thumb_func_start sub_080D9DA4
sub_080D9DA4: @ 0x080D9DA4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080D9DCC
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080D9DC8
	ldr r0, _080D9DD0
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D9DD4
	str r0, [r1]
_080D9DC8:
	pop {r0}
	bx r0
	.align 2, 0
_080D9DCC: .4byte 0x02039BD4
_080D9DD0: .4byte 0x03005B60
_080D9DD4: .4byte 0x080D7B69
	thumb_func_end sub_080D9DA4

	thumb_func_start sub_080D9DD8
sub_080D9DD8: @ 0x080D9DD8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080D9E34
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080D9E38
	strh r1, [r0]
	ldr r4, _080D9E3C
	movs r3, #0
	ldr r2, _080D9E40
	movs r1, #3
_080D9DF0:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	adds r0, r3, r0
	ldrh r0, [r0, #4]
	strh r0, [r2]
	adds r3, #0x1c
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _080D9DF0
	bl sub_080DB47C
	bl sub_080DB000
	ldr r0, _080D9E44
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080D9E4C
	ldr r0, _080D9E3C
	ldr r2, [r0]
	ldr r0, _080D9E48
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	bl BravoTrainerPokemonProfile_BeforeInterview1
	b _080D9E58
	.align 2, 0
_080D9E34: .4byte 0x02022ACA
_080D9E38: .4byte 0x02022AD2
_080D9E3C: .4byte 0x02039BD4
_080D9E40: .4byte 0x02039BB0
_080D9E44: .4byte 0x02039BCA
_080D9E48: .4byte 0x02039BC5
_080D9E4C:
	bl sub_080DE958
	bl sub_080DEC00
	bl ContestDebugPrintBitStrings
_080D9E58:
	ldr r1, _080D9E8C
	ldr r0, _080D9E90
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _080D9E94
	ldr r1, _080D9E98
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	ldr r1, _080D9E9C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _080D9EA0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9E8C: .4byte 0x03005E18
_080D9E90: .4byte 0x03005AE0
_080D9E94: .4byte 0x02021C7C
_080D9E98: .4byte 0x0824B36F
_080D9E9C: .4byte 0x03005B60
_080D9EA0: .4byte 0x080D9EA5
	thumb_func_end sub_080D9DD8

	thumb_func_start sub_080D9EA4
sub_080D9EA4: @ 0x080D9EA4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl Contest_RunTextPrinters
	adds r4, r0, #0
	cmp r4, #0
	bne _080D9EDA
	bl sub_080DD988
	ldr r0, _080D9EE0
	strh r4, [r0]
	ldr r1, _080D9EE4
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0x62
	movs r1, #0
	bl PlaySE12WithPanning
	ldr r1, _080D9EE8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r4, [r0, #8]
	ldr r1, _080D9EEC
	str r1, [r0]
_080D9EDA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9EE0: .4byte 0x02022ACC
_080D9EE4: .4byte 0x02022ACE
_080D9EE8: .4byte 0x03005B60
_080D9EEC: .4byte 0x080D9EF1
	thumb_func_end sub_080D9EA4

	thumb_func_start sub_080D9EF0
sub_080D9EF0: @ 0x080D9EF0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _080D9F24
	ldrh r0, [r1]
	subs r0, #7
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080D9F08
	movs r0, #0
	strh r0, [r1]
_080D9F08:
	ldrh r2, [r1]
	cmp r2, #0
	bne _080D9F1E
	ldr r0, _080D9F28
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080D9F2C
	str r0, [r1]
	strh r2, [r1, #8]
_080D9F1E:
	pop {r0}
	bx r0
	.align 2, 0
_080D9F24: .4byte 0x02022ACE
_080D9F28: .4byte 0x03005B60
_080D9F2C: .4byte 0x080D9F31
	thumb_func_end sub_080D9EF0

	thumb_func_start sub_080D9F30
sub_080D9F30: @ 0x080D9F30
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D9F64
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #8]
	adds r1, r0, #1
	strh r1, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x31
	ble _080D9F84
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, _080D9F68
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080D9F70
	ldr r0, _080D9F6C
	b _080D9F82
	.align 2, 0
_080D9F64: .4byte 0x03005B60
_080D9F68: .4byte 0x02039BCA
_080D9F6C: .4byte 0x080D9F91
_080D9F70:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080D9F8C
_080D9F82:
	str r0, [r4]
_080D9F84:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9F8C: .4byte 0x080DA021
	thumb_func_end sub_080D9F30

	thumb_func_start sub_080D9F90
sub_080D9F90: @ 0x080D9F90
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080D9FCC
	adds r0, r5, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080D9FD0
	adds r1, r5, #0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080D9FD4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080D9FD8
	str r1, [r0]
	bl ContestPrintLinkStandby
	movs r0, #0
	bl sub_080DBBF4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9FCC: .4byte 0x080FD321
_080D9FD0: .4byte 0x080D9FDD
_080D9FD4: .4byte 0x03005B60
_080D9FD8: .4byte 0x080D6E95
	thumb_func_end sub_080D9F90

	thumb_func_start sub_080D9FDC
sub_080D9FDC: @ 0x080D9FDC
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r2, _080DA014
	ldr r0, _080DA018
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _080DA01C
	str r1, [r0]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080DA014: .4byte 0x03005B60
_080DA018: .4byte 0x02039BD4
_080DA01C: .4byte 0x080DA021
	thumb_func_end sub_080D9FDC

	thumb_func_start sub_080DA020
sub_080DA020: @ 0x080DA020
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080DA054
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080DA050
	adds r0, r2, #0
	bl DestroyTask
	ldr r0, _080DA058
	ldr r1, _080DA05C
	str r1, [r0]
	bl FreeAllWindowBuffers
	bl FreeContestResources
	bl FreeMonSpritesGfx
	ldr r0, _080DA060
	bl SetMainCallback2
_080DA050:
	pop {r0}
	bx r0
	.align 2, 0
_080DA054: .4byte 0x02037C74
_080DA058: .4byte 0x03005B0C
_080DA05C: .4byte 0x080DA065
_080DA060: .4byte 0x08085A31
	thumb_func_end sub_080DA020

	thumb_func_start sub_080DA064
sub_080DA064: @ 0x080DA064
	push {lr}
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080DA064

	thumb_func_start TryPutPlayerLast
TryPutPlayerLast: @ 0x080DA074
	push {lr}
	ldr r0, _080DA08C
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080DA088
	ldr r1, _080DA090
	movs r0, #3
	strb r0, [r1]
_080DA088:
	pop {r0}
	bx r0
	.align 2, 0
_080DA08C: .4byte 0x02039BCA
_080DA090: .4byte 0x02039BC5
	thumb_func_end TryPutPlayerLast

	thumb_func_start sub_080DA094
sub_080DA094: @ 0x080DA094
	push {lr}
	ldr r0, _080DA0A8
	ldr r1, _080DA0AC
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080DA0B0
	movs r0, #0
	b _080DA0B2
	.align 2, 0
_080DA0A8: .4byte 0x02039BC5
_080DA0AC: .4byte 0x02039BCB
_080DA0B0:
	movs r0, #1
_080DA0B2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080DA094

	thumb_func_start sub_080DA0B8
sub_080DA0B8: @ 0x080DA0B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _080DA0F0
	ldr r1, [r4]
	mov r0, sp
	bl StringCopy
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #5]
	ldr r6, _080DA0F4
	ldrb r0, [r6]
	lsls r0, r0, #6
	ldr r5, _080DA0F8
	adds r0, r0, r5
	bl StringCopy
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080DA0FC
	ldrb r0, [r6]
	lsls r0, r0, #6
	adds r0, r5, r0
	movs r1, #0xd8
	b _080DA104
	.align 2, 0
_080DA0F0: .4byte 0x03005AF0
_080DA0F4: .4byte 0x02039BC5
_080DA0F8: .4byte 0x02039AAD
_080DA0FC:
	ldrb r0, [r6]
	lsls r0, r0, #6
	adds r0, r5, r0
	movs r1, #0xd9
_080DA104:
	strb r1, [r0, #8]
	ldr r6, _080DA260
	ldr r5, _080DA264
	ldrb r0, [r5]
	lsls r0, r0, #6
	adds r1, r6, #0
	adds r1, #0x18
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldrb r0, [r5]
	lsls r0, r0, #6
	adds r0, r0, r6
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0x64
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r0, _080DA268
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	ldrb r0, [r5]
	lsls r0, r0, #6
	adds r1, r6, #2
	adds r0, r0, r1
	mov r1, sp
	bl StringCopy
	adds r0, r4, #0
	movs r1, #0x16
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	adds r1, #0x26
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x17
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	adds r1, #0x27
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x18
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	adds r1, #0x28
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x21
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	adds r1, #0x29
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2f
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x30
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	adds r1, #0x2b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xd
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	strh r0, [r1, #0x1e]
	adds r0, r4, #0
	movs r1, #0xe
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	strh r0, [r1, #0x20]
	adds r0, r4, #0
	movs r1, #0xf
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	strh r0, [r1, #0x22]
	adds r0, r4, #0
	movs r1, #0x10
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r1, r1, r6
	strh r0, [r1, #0x24]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r2, r6, #0
	adds r2, #0x38
	adds r1, r1, r2
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, r1, #6
	adds r2, r6, #0
	adds r2, #0x3c
	adds r1, r1, r2
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov ip, r2
	ldrb r0, [r5]
	lsls r0, r0, #6
	adds r1, r0, r6
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r3, [r0]
	adds r0, #1
	ldrb r4, [r0]
	adds r0, #1
	ldrb r5, [r0]
	adds r0, #1
	ldrb r6, [r0]
	adds r0, #1
	ldrb r7, [r0]
	cmp r2, #0xfe
	bne _080DA26C
	adds r3, #0x14
	b _080DA2BA
	.align 2, 0
_080DA260: .4byte 0x02039AA0
_080DA264: .4byte 0x02039BC5
_080DA268: .4byte 0x02024190
_080DA26C:
	cmp r2, #0xff
	bne _080DA27C
	lsls r0, r4, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	b _080DA2BA
_080DA27C:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	bne _080DA290
	lsls r0, r5, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	b _080DA2BA
_080DA290:
	ldr r0, _080DA2A4
	cmp r2, r0
	bne _080DA2A8
	lsls r0, r6, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	b _080DA2BA
	.align 2, 0
_080DA2A4: .4byte 0x00000101
_080DA2A8:
	movs r0, #0x81
	lsls r0, r0, #1
	cmp ip, r0
	bne _080DA2BA
	lsls r0, r7, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r7, r0, #0x10
_080DA2BA:
	cmp r3, #0xff
	ble _080DA2C0
	movs r3, #0xff
_080DA2C0:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080DA2CA
	movs r4, #0xff
_080DA2CA:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080DA2D4
	movs r5, #0xff
_080DA2D4:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080DA2DE
	movs r6, #0xff
_080DA2DE:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080DA2E8
	movs r7, #0xff
_080DA2E8:
	ldr r2, _080DA328
	ldr r1, _080DA32C
	ldrb r0, [r1]
	lsls r0, r0, #6
	adds r0, r0, r2
	adds r0, #0x26
	strb r3, [r0]
	ldrb r0, [r1]
	lsls r0, r0, #6
	adds r0, r0, r2
	adds r0, #0x27
	strb r4, [r0]
	ldrb r0, [r1]
	lsls r0, r0, #6
	adds r0, r0, r2
	adds r0, #0x28
	strb r5, [r0]
	ldrb r0, [r1]
	lsls r0, r0, #6
	adds r0, r0, r2
	adds r0, #0x29
	strb r6, [r0]
	ldrb r0, [r1]
	lsls r0, r0, #6
	adds r0, r0, r2
	adds r0, #0x2a
	strb r7, [r0]
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DA328: .4byte 0x02039AA0
_080DA32C: .4byte 0x02039BC5
	thumb_func_end sub_080DA0B8

	thumb_func_start sub_080DA330
sub_080DA330: @ 0x080DA330
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x64
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r6, #0
	movs r7, #0
	bl TryPutPlayerLast
	ldr r0, _080DA380
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080DA364
	ldr r0, _080DA384
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080DA364
	movs r7, #1
_080DA364:
	movs r5, #0
	ldr r2, _080DA388
	ldr r3, _080DA38C
_080DA36A:
	ldrb r0, [r2, #0x1c]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r8, r0
	bne _080DA3DE
	cmp r7, #1
	bne _080DA390
	ldrb r0, [r3]
	cmp r0, #1
	beq _080DA3DE
	b _080DA396
	.align 2, 0
_080DA380: .4byte 0x00000864
_080DA384: .4byte 0x02039BCA
_080DA388: .4byte 0x08561028
_080DA38C: .4byte 0x08562828
_080DA390:
	ldrb r0, [r3]
	cmp r0, #2
	beq _080DA3DE
_080DA396:
	cmp r4, #0
	bne _080DA3A2
	ldrb r0, [r2, #0x1c]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _080DA3D2
_080DA3A2:
	cmp r4, #1
	bne _080DA3AE
	ldrb r0, [r2, #0x1c]
	lsls r0, r0, #0x1c
	cmp r0, #0
	blt _080DA3D2
_080DA3AE:
	cmp r4, #2
	bne _080DA3BA
	ldrb r0, [r2, #0x1c]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _080DA3D2
_080DA3BA:
	cmp r4, #3
	bne _080DA3C6
	ldrb r0, [r2, #0x1c]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080DA3D2
_080DA3C6:
	cmp r4, #4
	bne _080DA3DE
	ldrb r0, [r2, #0x1c]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _080DA3DE
_080DA3D2:
	adds r0, r6, #0
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	add r0, sp
	strb r5, [r0]
_080DA3DE:
	adds r2, #0x40
	adds r3, #1
	adds r5, #1
	cmp r5, #0x5f
	bls _080DA36A
	mov r0, sp
	adds r1, r0, r6
	movs r0, #0xff
	strb r0, [r1]
	movs r5, #0
	ldr r7, _080DA454
_080DA3F4:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080DA458
	lsls r2, r5, #6
	adds r2, r2, r1
	mov r1, sp
	adds r4, r1, r0
	ldrb r1, [r4]
	lsls r1, r1, #6
	adds r1, r1, r7
	adds r0, r2, #0
	movs r2, #0x40
	bl memcpy
	ldrb r0, [r4]
	adds r2, r5, #1
	subs r1, r6, #1
	cmp r0, #0xff
	beq _080DA436
	adds r3, r4, #0
_080DA42A:
	ldrb r0, [r3, #1]
	strb r0, [r3]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _080DA42A
_080DA436:
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	adds r5, r2, #0
	cmp r5, #2
	ble _080DA3F4
	ldr r0, _080DA45C
	ldrb r0, [r0]
	bl sub_080DA0B8
	add sp, #0x64
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DA454: .4byte 0x08561028
_080DA458: .4byte 0x02039AA0
_080DA45C: .4byte 0x02039BC4
	thumb_func_end sub_080DA330

	thumb_func_start sub_080DA460
sub_080DA460: @ 0x080DA460
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x64
	mov ip, r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r6, #0
	ldr r0, _080DA49C
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #4
	beq _080DA572
	movs r5, #0
	ldr r3, _080DA4A0
	ldr r2, _080DA4A4
_080DA484:
	ldrb r0, [r3, #0x1c]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r7, r0
	bne _080DA4F6
	mov r0, ip
	cmp r0, #1
	bne _080DA4A8
	ldrb r0, [r2]
	cmp r0, #1
	beq _080DA4F6
	b _080DA4AE
	.align 2, 0
_080DA49C: .4byte 0x02039BD0
_080DA4A0: .4byte 0x08561028
_080DA4A4: .4byte 0x08562828
_080DA4A8:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080DA4F6
_080DA4AE:
	cmp r4, #0
	bne _080DA4BA
	ldrb r0, [r3, #0x1c]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _080DA4EA
_080DA4BA:
	cmp r4, #1
	bne _080DA4C6
	ldrb r0, [r3, #0x1c]
	lsls r0, r0, #0x1c
	cmp r0, #0
	blt _080DA4EA
_080DA4C6:
	cmp r4, #2
	bne _080DA4D2
	ldrb r0, [r3, #0x1c]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _080DA4EA
_080DA4D2:
	cmp r4, #3
	bne _080DA4DE
	ldrb r0, [r3, #0x1c]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080DA4EA
_080DA4DE:
	cmp r4, #4
	bne _080DA4F6
	ldrb r0, [r3, #0x1c]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _080DA4F6
_080DA4EA:
	adds r0, r6, #0
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	add r0, sp
	strb r5, [r0]
_080DA4F6:
	adds r3, #0x40
	adds r2, #1
	adds r5, #1
	cmp r5, #0x5f
	bls _080DA484
	mov r3, sp
	adds r1, r3, r6
	movs r0, #0xff
	strb r0, [r1]
	movs r5, #0
	mov r0, r8
	ldrb r1, [r0]
	movs r0, #4
	subs r0, r0, r1
	cmp r5, r0
	bge _080DA572
	ldr r7, _080DA580
_080DA518:
	bl sub_080F98CC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _080DA584
	ldrb r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #6
	adds r0, r0, r7
	ldr r2, _080DA588
	mov r3, sp
	adds r4, r3, r1
	ldrb r1, [r4]
	lsls r1, r1, #6
	adds r1, r1, r2
	movs r2, #0x40
	bl memcpy
	ldrb r0, [r4]
	adds r3, r5, #1
	subs r1, r6, #1
	cmp r0, #0xff
	beq _080DA560
	adds r2, r4, #0
_080DA554:
	ldrb r0, [r2, #1]
	strb r0, [r2]
	adds r2, #1
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080DA554
_080DA560:
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	adds r5, r3, #0
	ldr r0, _080DA584
	ldrb r1, [r0]
	movs r0, #4
	subs r0, r0, r1
	cmp r5, r0
	blt _080DA518
_080DA572:
	add sp, #0x64
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DA580: .4byte 0x02039AA0
_080DA584: .4byte 0x02039BD0
_080DA588: .4byte 0x08561028
	thumb_func_end sub_080DA460

	thumb_func_start sub_080DA58C
sub_080DA58C: @ 0x080DA58C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	beq _080DA59E
	movs r0, #3
	b _080DA61A
_080DA59E:
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	cmp r0, #0
	bne _080DA5AE
	movs r0, #4
	b _080DA61A
_080DA5AE:
	ldr r0, _080DA5C0
	ldrh r0, [r0]
	cmp r0, #4
	bhi _080DA602
	lsls r0, r0, #2
	ldr r1, _080DA5C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DA5C0: .4byte 0x02039BCC
_080DA5C4: .4byte 0x080DA5C8
_080DA5C8: @ jump table
	.4byte _080DA5DC @ case 0
	.4byte _080DA5E2 @ case 1
	.4byte _080DA5E8 @ case 2
	.4byte _080DA5EE @ case 3
	.4byte _080DA5F4 @ case 4
_080DA5DC:
	adds r0, r4, #0
	movs r1, #0x32
	b _080DA5F8
_080DA5E2:
	adds r0, r4, #0
	movs r1, #0x33
	b _080DA5F8
_080DA5E8:
	adds r0, r4, #0
	movs r1, #0x34
	b _080DA5F8
_080DA5EE:
	adds r0, r4, #0
	movs r1, #0x35
	b _080DA5F8
_080DA5F4:
	adds r0, r4, #0
	movs r1, #0x36
_080DA5F8:
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _080DA606
_080DA602:
	movs r0, #0
	b _080DA61A
_080DA606:
	ldr r0, _080DA620
	adds r2, r1, #0
	ldrh r1, [r0]
	movs r0, #2
	cmp r2, r1
	bhi _080DA61A
	movs r0, #0
	cmp r2, r1
	blo _080DA61A
	movs r0, #1
_080DA61A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080DA620: .4byte 0x02039BCE
	thumb_func_end sub_080DA58C

	thumb_func_start DrawContestantWindowText
DrawContestantWindowText: @ 0x080DA624
	push {r4, r5, lr}
	movs r5, #0
_080DA628:
	ldr r4, _080DA660
	adds r4, r5, r4
	ldrb r0, [r4]
	movs r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	lsls r4, r5, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PrintContestantMonName
	adds r0, r4, #0
	bl PrintContestantTrainerName
	adds r5, #1
	cmp r5, #3
	ble _080DA628
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA660: .4byte 0x02039BC6
	thumb_func_end DrawContestantWindowText

	thumb_func_start Contest_CopyStringWithColor
Contest_CopyStringWithColor: @ 0x080DA664
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080DA684
	ldr r1, _080DA688
	bl StringCopy
	strb r4, [r0]
	adds r0, #1
	adds r1, r5, #0
	bl StringCopy
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DA684: .4byte 0x02022AE0
_080DA688: .4byte 0x085CC497
	thumb_func_end Contest_CopyStringWithColor

	thumb_func_start PrintContestantMonName
PrintContestantMonName: @ 0x080DA68C
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	movs r2, #0xa0
	lsls r2, r2, #0x14
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	bl PrintContestantMonNameWithColor
	pop {r0}
	bx r0
	thumb_func_end PrintContestantMonName

	thumb_func_start PrintContestantMonNameWithColor
PrintContestantMonNameWithColor: @ 0x080DA6A4
	push {r4, r5, lr}
	sub sp, #0x20
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080DA6E8
	mov r0, sp
	bl StringCopy
	lsls r1, r4, #6
	ldr r0, _080DA6EC
	adds r1, r1, r0
	mov r0, sp
	bl StringAppend
	mov r0, sp
	adds r1, r5, #0
	bl Contest_CopyStringWithColor
	ldr r0, _080DA6F0
	adds r4, r4, r0
	ldrb r0, [r4]
	adds r0, #4
	ldr r1, _080DA6F4
	bl Contest_PrintTextToBg0WindowStd
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA6E8: .4byte 0x085C93FF
_080DA6EC: .4byte 0x02039AAD
_080DA6F0: .4byte 0x02039BC6
_080DA6F4: .4byte 0x02022AE0
	thumb_func_end PrintContestantMonNameWithColor

	thumb_func_start PrintContestantTrainerName
PrintContestantTrainerName: @ 0x080DA6F8
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	movs r2, #0xa0
	lsls r2, r2, #0x14
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	bl sub_080DA710
	pop {r0}
	bx r0
	thumb_func_end PrintContestantTrainerName

	thumb_func_start sub_080DA710
sub_080DA710: @ 0x080DA710
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r4, #6
	ldr r2, _080DA738
	adds r0, r0, r2
	bl Contest_CopyStringWithColor
	ldr r0, _080DA73C
	adds r4, r4, r0
	ldrb r0, [r4]
	ldr r1, _080DA740
	bl Contest_PrintTextToBg0WindowStd
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA738: .4byte 0x02039AA2
_080DA73C: .4byte 0x02039BC6
_080DA740: .4byte 0x02022AE0
	thumb_func_end sub_080DA710

	thumb_func_start sub_080DA744
sub_080DA744: @ 0x080DA744
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #4
	bhi _080DA7D0
	lsls r0, r0, #2
	ldr r1, _080DA75C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DA75C: .4byte 0x080DA760
_080DA760: @ jump table
	.4byte _080DA774 @ case 0
	.4byte _080DA78C @ case 1
	.4byte _080DA7A4 @ case 2
	.4byte _080DA7B4 @ case 3
	.4byte _080DA7D0 @ case 4
_080DA774:
	ldr r0, _080DA788
	lsls r2, r2, #6
	adds r1, r2, r0
	adds r3, r1, #0
	adds r3, #0x26
	ldrb r5, [r3]
	adds r3, #4
	ldrb r4, [r3]
	adds r1, #0x27
	b _080DA7E2
	.align 2, 0
_080DA788: .4byte 0x02039AA0
_080DA78C:
	ldr r0, _080DA7A0
	lsls r2, r2, #6
	adds r1, r2, r0
	adds r3, r1, #0
	adds r3, #0x27
	ldrb r5, [r3]
	subs r3, #1
	ldrb r4, [r3]
	adds r1, #0x28
	b _080DA7E2
	.align 2, 0
_080DA7A0: .4byte 0x02039AA0
_080DA7A4:
	ldr r1, _080DA7B0
	lsls r2, r2, #6
	adds r3, r2, r1
	adds r0, r3, #0
	adds r0, #0x28
	b _080DA7BE
	.align 2, 0
_080DA7B0: .4byte 0x02039AA0
_080DA7B4:
	ldr r1, _080DA7CC
	lsls r2, r2, #6
	adds r3, r2, r1
	adds r0, r3, #0
	adds r0, #0x29
_080DA7BE:
	ldrb r5, [r0]
	subs r0, #1
	ldrb r4, [r0]
	adds r0, #2
	ldrb r3, [r0]
	adds r0, r1, #0
	b _080DA7E4
	.align 2, 0
_080DA7CC: .4byte 0x02039AA0
_080DA7D0:
	ldr r0, _080DA7FC
	lsls r2, r2, #6
	adds r1, r2, r0
	adds r3, r1, #0
	adds r3, #0x2a
	ldrb r5, [r3]
	subs r3, #1
	ldrb r4, [r3]
	adds r1, #0x26
_080DA7E2:
	ldrb r3, [r1]
_080DA7E4:
	adds r1, r2, r0
	adds r1, #0x2b
	adds r0, r4, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DA7FC: .4byte 0x02039AA0
	thumb_func_end sub_080DA744

	thumb_func_start sub_080DA800
sub_080DA800: @ 0x080DA800
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	ldr r5, _080DA824
_080DA80A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_080DA744
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, #3
	ble _080DA80A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DA824: .4byte 0x02039BA0
	thumb_func_end sub_080DA800

	thumb_func_start sub_080DA828
sub_080DA828: @ 0x080DA828
	push {r4, r5, lr}
	ldr r0, _080DA870
	bl LoadCompressedSpriteSheet
	ldr r0, _080DA874
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r0, _080DA878
	movs r1, #0x70
	movs r2, #0x24
	movs r3, #0x1e
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080DA87C
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r5, r2, r4
	ldrb r3, [r5, #5]
	movs r1, #0xf
	ands r1, r3
	movs r3, #0x10
	orrs r1, r3
	strb r1, [r5, #5]
	adds r4, #0x1c
	adds r2, r2, r4
	ldr r1, _080DA880
	str r1, [r2]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DA870: .4byte 0x08560B64
_080DA874: .4byte 0x08C1C700
_080DA878: .4byte 0x08560B4C
_080DA87C: .4byte 0x020205AC
_080DA880: .4byte 0x08007141
	thumb_func_end sub_080DA828

	thumb_func_start sub_080DA884
sub_080DA884: @ 0x080DA884
	push {lr}
	ldr r0, _080DA8C8
	bl LoadCompressedSpriteSheet
	ldr r0, _080DA8CC
	bl LoadCompressedSpritePalette
	ldr r0, _080DA8D0
	movs r1, #0x60
	movs r2, #0xa
	movs r3, #0x1d
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080DA8D4
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	movs r1, #0x3e
	adds r1, r1, r2
	mov ip, r1
	ldrb r1, [r1]
	movs r3, #4
	orrs r1, r3
	mov r3, ip
	strb r1, [r3]
	ldrh r1, [r2, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	strh r1, [r2, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_080DA8C8: .4byte 0x08560B6C
_080DA8CC: .4byte 0x08560B74
_080DA8D0: .4byte 0x08560B7C
_080DA8D4: .4byte 0x020205AC
	thumb_func_end sub_080DA884

	thumb_func_start sub_080DA8D8
sub_080DA8D8: @ 0x080DA8D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r1, #0
	adds r6, r2, #0
	adds r4, r3, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	bl SanitizeSpecies
	adds r5, r0, #0
	ldr r0, _080DA910
	ldrb r0, [r0]
	cmp r4, r0
	bne _080DA91C
	lsls r0, r5, #3
	ldr r1, _080DA914
	adds r0, r0, r1
	ldr r1, _080DA918
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r2, r5, #0
	adds r3, r6, #0
	bl HandleLoadSpecialPokePic_2
	b _080DA930
	.align 2, 0
_080DA910: .4byte 0x02039BC5
_080DA914: .4byte 0x082D6148
_080DA918: .4byte 0x02024178
_080DA91C:
	lsls r0, r5, #3
	ldr r1, _080DA9C4
	adds r0, r0, r1
	ldr r1, _080DA9C8
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r2, r5, #0
	adds r3, r6, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
_080DA930:
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl GetMonSpritePalFromSpeciesAndPersonality
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl LoadCompressedPalette
	adds r0, r5, #0
	movs r1, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r4, _080DA9CC
	movs r0, #2
	adds r1, r5, #0
	movs r2, #0
	bl GetBattlerSpriteFinal_Y
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	movs r1, #0x70
	movs r3, #0x1e
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080DA9D0
	mov r8, r0
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r6, r0, #2
	mov r0, r8
	adds r4, r6, r0
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #5]
	movs r0, #2
	bl GetBattlerSpriteSubpriority
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _080DA9D4
	str r1, [r0]
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	strh r0, [r4, #0x2e]
	strh r5, [r4, #0x32]
	adds r0, r5, #0
	bl IsSpeciesNotUnown
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080DA9DC
	mov r0, r8
	adds r0, #0x10
	adds r0, r6, r0
	ldr r1, _080DA9D8
	b _080DA9E4
	.align 2, 0
_080DA9C4: .4byte 0x082D6148
_080DA9C8: .4byte 0x02024178
_080DA9CC: .4byte 0x02024640
_080DA9D0: .4byte 0x020205AC
_080DA9D4: .4byte 0x08007141
_080DA9D8: .4byte 0x082D2F50
_080DA9DC:
	mov r0, r8
	adds r0, #0x10
	adds r0, r6, r0
	ldr r1, _080DAA04
_080DA9E4:
	str r1, [r0]
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _080DAA08
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAffineAnim
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DAA04: .4byte 0x082D2F24
_080DAA08: .4byte 0x020205AC
	thumb_func_end sub_080DA8D8

	thumb_func_start IsSpeciesNotUnown
IsSpeciesNotUnown: @ 0x080DAA0C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc9
	beq _080DAA1A
	movs r0, #1
	b _080DAA1C
_080DAA1A:
	movs r0, #0
_080DAA1C:
	pop {r1}
	bx r1
	thumb_func_end IsSpeciesNotUnown

	thumb_func_start SwapMoveDescAndContestTilemaps
SwapMoveDescAndContestTilemaps: @ 0x080DAA20
	push {r4, r5, r6, lr}
	ldr r5, _080DAA4C
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r1, r0, r4
	movs r6, #0xa0
	lsls r6, r6, #1
	adds r2, r6, #0
	bl CpuSet
	ldr r0, [r5]
	ldr r0, [r0, #0x2c]
	adds r4, r0, r4
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DAA4C: .4byte 0x02039BD4
	thumb_func_end SwapMoveDescAndContestTilemaps

	thumb_func_start sub_080DAA50
sub_080DAA50: @ 0x080DAA50
	push {lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r2, _080DAA78
	ldr r1, _080DAA7C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080DAAB8
	lsls r0, r0, #2
	ldr r1, _080DAA80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DAA78: .4byte 0x08566AE4
_080DAA7C: .4byte 0x08565FCC
_080DAA80: .4byte 0x080DAA84
_080DAA84: @ jump table
	.4byte _080DAAA8 @ case 0
	.4byte _080DAAA8 @ case 1
	.4byte _080DAAB0 @ case 2
	.4byte _080DAAB0 @ case 3
	.4byte _080DAAB8 @ case 4
	.4byte _080DAAB8 @ case 5
	.4byte _080DAAB8 @ case 6
	.4byte _080DAAB8 @ case 7
	.4byte _080DAAA8 @ case 8
_080DAAA8:
	ldr r0, _080DAAAC
	b _080DAABA
	.align 2, 0
_080DAAAC: .4byte 0x00009082
_080DAAB0:
	ldr r0, _080DAAB4
	b _080DAABA
	.align 2, 0
_080DAAB4: .4byte 0x00009088
_080DAAB8:
	ldr r0, _080DAAD0
_080DAABA:
	lsls r1, r3, #0xc
	movs r2, #0x90
	lsls r2, r2, #8
	adds r1, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080DAAD0: .4byte 0x00009086
	thumb_func_end sub_080DAA50

	thumb_func_start sub_080DAAD4
sub_080DAAD4: @ 0x080DAAD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, _080DAB54
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	ldr r7, _080DAB58
	cmp r0, #0
	beq _080DAB08
	adds r7, #5
	cmp r0, #1
	beq _080DAB08
	adds r7, #5
	cmp r0, #2
	beq _080DAB08
	adds r7, #0x40
	cmp r0, #3
	bne _080DAB08
	subs r7, #0x20
_080DAB08:
	movs r6, #5
	str r6, [sp]
	movs r4, #1
	str r4, [sp, #4]
	movs r5, #0x11
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0
	adds r1, r7, #0
	movs r2, #0xb
	movs r3, #0x1f
	bl ContestBG_FillBoxWithIncrementingTile
	adds r1, r7, #0
	adds r1, #0x10
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0
	movs r2, #0xb
	movs r3, #0x20
	bl ContestBG_FillBoxWithIncrementingTile
	ldr r2, _080DAB5C
	ldr r0, _080DAB54
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r0, [r2, #1]
	adds r7, r1, #0
	cmp r0, #0xff
	bne _080DAB60
	movs r6, #0
	b _080DAB6C
	.align 2, 0
_080DAB54: .4byte 0x08565FCC
_080DAB58: .4byte 0x00004040
_080DAB5C: .4byte 0x08566AE4
_080DAB60:
	ldrb r0, [r2, #1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080DAB6C:
	cmp r6, #8
	bls _080DAB72
	movs r6, #8
_080DAB72:
	ldr r1, _080DABB4
	movs r0, #8
	str r0, [sp]
	movs r5, #1
	str r5, [sp, #4]
	movs r4, #0x11
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0x15
	movs r3, #0x1f
	bl ContestBG_FillBoxWithTile
	ldr r1, _080DABB8
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0x15
	movs r3, #0x1f
	bl ContestBG_FillBoxWithTile
	ldr r1, _080DABBC
	ldr r0, _080DABC0
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #2]
	cmp r0, #0xff
	bne _080DABC4
	movs r6, #0
	b _080DABD0
	.align 2, 0
_080DABB4: .4byte 0x00005035
_080DABB8: .4byte 0x00005012
_080DABBC: .4byte 0x08566AE4
_080DABC0: .4byte 0x08565FCC
_080DABC4:
	ldrb r0, [r1, #2]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080DABD0:
	cmp r6, #8
	bls _080DABD6
	movs r6, #8
_080DABD6:
	ldr r1, _080DAC30
	movs r0, #8
	str r0, [sp]
	movs r5, #1
	str r5, [sp, #4]
	movs r4, #0x11
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0x15
	movs r3, #0x20
	bl ContestBG_FillBoxWithTile
	ldr r1, _080DAC34
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0x15
	movs r3, #0x20
	bl ContestBG_FillBoxWithTile
	movs r0, #0xe
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _080DAC38
	ldr r0, _080DAC3C
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xe
	bl Contest_PrintTextToBg0WindowStd
	ldr r1, _080DAC40
	movs r0, #0xd
	bl Contest_PrintTextToBg0WindowStd
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAC30: .4byte 0x00005036
_080DAC34: .4byte 0x00005014
_080DAC38: .4byte 0x08560BB4
_080DAC3C: .4byte 0x08565FCC
_080DAC40: .4byte 0x085C93FF
	thumb_func_end sub_080DAAD4

	thumb_func_start sub_080DAC44
sub_080DAC44: @ 0x080DAC44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _080DACC0
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl Contest_IsMonsTurnDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080DACC4
	cmp r5, #0
	beq _080DACC4
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080DAA50
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #2
	mov r8, r0
	str r0, [sp]
	movs r5, #1
	str r5, [sp, #4]
	movs r6, #0x11
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x14
	adds r3, r7, #0
	bl ContestBG_FillBoxWithIncrementingTile
	adds r4, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r3, r7, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	str r0, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x14
	bl ContestBG_FillBoxWithIncrementingTile
	b _080DACDA
	.align 2, 0
_080DACC0: .4byte 0x02039BC6
_080DACC4:
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x14
	adds r3, r7, #0
	bl ContestBG_FillBoxWithTile
_080DACDA:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080DAC44

	thumb_func_start sub_080DACE8
sub_080DACE8: @ 0x080DACE8
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #0
_080DACEE:
	ldr r0, _080DAD10
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r5, r0
	ldrh r0, [r0, #6]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl sub_080DAC44
	adds r5, #0x1c
	adds r4, #1
	cmp r4, #3
	ble _080DACEE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DAD10: .4byte 0x02039BD4
	thumb_func_end sub_080DACE8

	thumb_func_start sub_080DAD14
sub_080DAD14: @ 0x080DAD14
	ldr r0, _080DAD18
	bx lr
	.align 2, 0
_080DAD18: .4byte 0x00002034
	thumb_func_end sub_080DAD14

	thumb_func_start sub_080DAD1C
sub_080DAD1C: @ 0x080DAD1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov sl, r8
	ldr r0, _080DAD54
	mov sb, r0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r7, r0, #2
	adds r3, r7, r1
	ldrb r0, [r3, #0x10]
	movs r5, #0x30
	ands r5, r0
	cmp r5, #0
	bne _080DAD58
	movs r0, #0
	b _080DADEE
	.align 2, 0
_080DAD54: .4byte 0x02039BD4
_080DAD58:
	ldr r0, _080DADA8
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0xd
	ldrsb r0, [r3, r0]
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r5, #0x10
	bne _080DADAC
	bl sub_080DAD14
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	str r0, [sp]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r2, #0x13
	adds r3, r6, #0
	bl ContestBG_FillBoxWithTile
	mov r1, r8
	cmp r1, #0
	beq _080DADEC
	movs r0, #0x5b
	b _080DADD6
	.align 2, 0
_080DADA8: .4byte 0x02039BC6
_080DADAC:
	adds r3, r6, r4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	subs r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x13
	bl ContestBG_FillBoxWithTile
	mov r0, sl
	cmp r0, #0
	beq _080DADEC
	movs r0, #0x26
_080DADD6:
	bl PlaySE
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #4]
	adds r1, r7, r1
	ldrb r2, [r1, #0x10]
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x10]
_080DADEC:
	movs r0, #1
_080DADEE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080DAD1C

	thumb_func_start sub_080DAE00
sub_080DAE00: @ 0x080DAE00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r7, #0
	movs r0, #1
	mov sl, r0
	movs r1, #0x11
	mov sb, r1
	movs r0, #0
	mov r8, r0
_080DAE1A:
	ldr r0, _080DAEA4
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r4, r0, #2
	adds r4, r4, r0
	adds r4, #2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_080DAD14
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080DAEA8
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r8
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	mov r1, sl
	str r1, [sp]
	asrs r6, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x13
	adds r3, r4, #0
	bl ContestBG_FillBoxWithTile
	adds r4, r4, r6
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, sl
	str r1, [sp]
	movs r0, #3
	subs r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x13
	adds r3, r4, #0
	bl ContestBG_FillBoxWithTile
	movs r1, #0x1c
	add r8, r1
	adds r7, #1
	cmp r7, #3
	ble _080DAE1A
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAEA4: .4byte 0x02039BC6
_080DAEA8: .4byte 0x02039BD4
	thumb_func_end sub_080DAE00

	thumb_func_start sub_080DAEAC
sub_080DAEAC: @ 0x080DAEAC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0
	cmp r1, #4
	bhi _080DAEEE
	lsls r0, r1, #2
	ldr r1, _080DAEC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DAEC4: .4byte 0x080DAEC8
_080DAEC8: @ jump table
	.4byte _080DAEDC @ case 0
	.4byte _080DAEE0 @ case 1
	.4byte _080DAEE4 @ case 2
	.4byte _080DAEE8 @ case 3
	.4byte _080DAEEC @ case 4
_080DAEDC:
	movs r0, #0x80
	b _080DAEEE
_080DAEE0:
	movs r0, #0x84
	b _080DAEEE
_080DAEE4:
	movs r0, #0x86
	b _080DAEEE
_080DAEE8:
	movs r0, #0x88
	b _080DAEEE
_080DAEEC:
	movs r0, #0x82
_080DAEEE:
	movs r1, #0x90
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end sub_080DAEAC

	thumb_func_start sub_080DAEFC
sub_080DAEFC: @ 0x080DAEFC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	mov sb, r1
	movs r1, #0
	mov r8, r1
	ldr r1, _080DAF44
	adds r1, r0, r1
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r1, _080DAF48
	ldr r1, [r1]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r2
	ldr r0, [r2, #0x10]
	ldr r1, _080DAF4C
	ands r0, r1
	cmp r0, #0
	bne _080DAF40
	ldrb r0, [r2, #0xf]
	cmp r0, #0
	beq _080DAF50
_080DAF40:
	movs r0, #0
	b _080DAF72
	.align 2, 0
_080DAF44: .4byte 0x02039BC6
_080DAF48: .4byte 0x02039BD4
_080DAF4C: .4byte 0x00FF0003
_080DAF50:
	ldrb r1, [r2, #0xc]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _080DAF5E
	movs r0, #1
	b _080DAF72
_080DAF5E:
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080DAF70
	ldrb r1, [r2, #0xb]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080DAF7E
_080DAF70:
	movs r0, #2
_080DAF72:
	bl sub_080DAEAC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	b _080DAF82
_080DAF7E:
	movs r0, #0
	mov sb, r0
_080DAF82:
	mov r1, sb
	cmp r1, #0
	beq _080DAFC2
	movs r6, #2
	str r6, [sp]
	movs r4, #1
	str r4, [sp, #4]
	movs r5, #0x11
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0
	mov r1, r8
	movs r2, #0x14
	adds r3, r7, #0
	bl ContestBG_FillBoxWithIncrementingTile
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r3, r7, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0
	movs r2, #0x14
	bl ContestBG_FillBoxWithIncrementingTile
	b _080DAFD8
_080DAFC2:
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x14
	adds r3, r7, #0
	bl ContestBG_FillBoxWithTile
_080DAFD8:
	mov r0, sb
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080DAEFC

	thumb_func_start sub_080DAFE8
sub_080DAFE8: @ 0x080DAFE8
	push {r4, lr}
	movs r4, #0
_080DAFEC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080DAEFC
	adds r4, #1
	cmp r4, #3
	ble _080DAFEC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080DAFE8

	thumb_func_start sub_080DB000
sub_080DB000: @ 0x080DB000
	push {lr}
	movs r0, #8
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #8
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #0
	bl Contest_SetBgCopyFlags
	pop {r0}
	bx r0
	thumb_func_end sub_080DB000

	thumb_func_start GetChosenMove
GetChosenMove: @ 0x080DB01C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	adds r0, r4, #0
	bl Contest_IsMonsTurnDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080DB034
	movs r0, #0
	b _080DB06E
_080DB034:
	ldr r0, _080DB050
	ldrb r0, [r0]
	cmp r4, r0
	beq _080DB058
	adds r0, r4, #0
	bl ContestAI_ResetAI
	bl ContestAI_GetActionToUse
	lsls r0, r0, #0x18
	ldr r2, _080DB054
	lsrs r0, r0, #0x17
	lsls r1, r4, #6
	b _080DB066
	.align 2, 0
_080DB050: .4byte 0x02039BC5
_080DB054: .4byte 0x02039AA0
_080DB058:
	ldr r2, _080DB074
	ldr r0, _080DB078
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #1
	lsls r1, r5, #6
_080DB066:
	adds r0, r0, r1
	adds r2, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
_080DB06E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DB074: .4byte 0x02039AA0
_080DB078: .4byte 0x02039BD4
	thumb_func_end GetChosenMove

	thumb_func_start GetAllChosenMoves
GetAllChosenMoves: @ 0x080DB07C
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #0
_080DB082:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetChosenMove
	ldr r1, _080DB0A4
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r1, r5, r1
	strh r0, [r1, #6]
	adds r5, #0x1c
	adds r4, #1
	cmp r4, #3
	ble _080DB082
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB0A4: .4byte 0x02039BD4
	thumb_func_end GetAllChosenMoves

	thumb_func_start RankContestants
RankContestants: @ 0x080DB0A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r5, _080DB150
	mov r4, sp
	movs r3, #0
	movs r6, #3
_080DB0BA:
	ldr r2, [r5]
	ldr r1, [r2, #4]
	adds r1, r3, r1
	ldrh r0, [r1, #2]
	ldrh r7, [r1, #4]
	adds r0, r0, r7
	strh r0, [r1, #4]
	ldr r0, [r2, #4]
	adds r0, r3, r0
	ldrh r0, [r0, #4]
	strh r0, [r4]
	adds r4, #2
	adds r3, #0x1c
	subs r6, #1
	cmp r6, #0
	bge _080DB0BA
	movs r6, #0
_080DB0DC:
	movs r4, #3
	cmp r4, r6
	ble _080DB108
_080DB0E2:
	subs r5, r4, #1
	lsls r0, r5, #1
	mov r1, sp
	adds r3, r1, r0
	lsls r0, r4, #1
	adds r2, r1, r0
	ldrh r4, [r3]
	movs r7, #0
	ldrsh r1, [r3, r7]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080DB102
	ldrh r0, [r2]
	strh r4, [r2]
	strh r0, [r3]
_080DB102:
	adds r4, r5, #0
	cmp r4, r6
	bgt _080DB0E2
_080DB108:
	adds r6, #1
	cmp r6, #2
	ble _080DB0DC
	movs r6, #0
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
	ldr r1, _080DB150
	mov r8, r1
	movs r7, #3
	mov ip, r7
_080DB11E:
	movs r4, #0
	lsls r0, r6, #3
	adds r7, r6, #1
	subs r0, r0, r6
	lsls r5, r0, #2
	mov r3, sp
_080DB12A:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #4]
	adds r2, r5, r0
	movs r6, #4
	ldrsh r1, [r2, r6]
	movs r6, #0
	ldrsh r0, [r3, r6]
	cmp r1, r0
	bne _080DB154
	mov r0, ip
	ands r4, r0
	ldrb r1, [r2, #0xb]
	mov r0, sb
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0xb]
	b _080DB15C
	.align 2, 0
_080DB150: .4byte 0x02039BD4
_080DB154:
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble _080DB12A
_080DB15C:
	adds r6, r7, #0
	cmp r6, #3
	ble _080DB11E
	movs r0, #1
	bl SortContestants
	bl ApplyNextTurnOrder
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RankContestants

	thumb_func_start sub_080DB17C
sub_080DB17C: @ 0x080DB17C
	push {r4, r5, lr}
	ldr r4, _080DB194
	movs r2, #0
	movs r3, #3
_080DB184:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	adds r1, r2, r0
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _080DB198
	movs r1, #5
	b _080DB1B6
	.align 2, 0
_080DB194: .4byte 0x02039BD4
_080DB198:
	movs r5, #2
	ldrsh r0, [r1, r5]
	movs r1, #0
	cmp r0, #0
	ble _080DB1B6
	movs r1, #1
	cmp r0, #0x1d
	ble _080DB1B6
	movs r1, #2
	cmp r0, #0x3b
	ble _080DB1B6
	movs r1, #4
	cmp r0, #0x4f
	bgt _080DB1B6
	movs r1, #3
_080DB1B6:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	adds r0, r2, r0
	strb r1, [r0, #0x1a]
	adds r2, #0x1c
	subs r3, #1
	cmp r3, #0
	bge _080DB184
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080DB17C

	thumb_func_start ContestantCanUseTurn
ContestantCanUseTurn: @ 0x080DB1CC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080DB1F8
	ldr r1, [r1]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r2
	ldrb r1, [r2, #0xc]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080DB1F4
	ldrb r1, [r2, #0xb]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080DB1FC
_080DB1F4:
	movs r0, #0
	b _080DB1FE
	.align 2, 0
_080DB1F8: .4byte 0x02039BD4
_080DB1FC:
	movs r0, #1
_080DB1FE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ContestantCanUseTurn

	thumb_func_start sub_080DB204
sub_080DB204: @ 0x080DB204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, _080DB408
	movs r0, #0
	mov r8, r0
	movs r1, #7
	rsbs r1, r1, #0
	mov sl, r1
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
	movs r4, #0
	movs r6, #3
_080DB224:
	ldr r1, [r5]
	ldr r0, [r1, #4]
	adds r0, r4, r0
	movs r2, #0
	strh r2, [r0, #2]
	ldr r0, [r1, #4]
	adds r0, r4, r0
	strh r2, [r0]
	ldr r0, [r1, #4]
	adds r0, r4, r0
	mov r1, r8
	strb r1, [r0, #0x12]
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r3, r4, r0
	ldrb r2, [r3, #0xc]
	movs r0, #6
	ands r0, r2
	cmp r0, #0
	beq _080DB260
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1e
	subs r0, #1
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #1
	mov r1, sl
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xc]
_080DB260:
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	mov r1, r8
	strb r1, [r0, #0xe]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x10]
	mov r0, sb
	ands r0, r2
	strb r0, [r1, #0x10]
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	mov r1, r8
	strb r1, [r0, #0xf]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x10]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x10]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x10]
	movs r7, #5
	rsbs r7, r7, #0
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1, #0x10]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x10]
	movs r0, #9
	rsbs r0, r0, #0
	mov ip, r0
	ands r0, r2
	strb r0, [r1, #0x10]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0xc]
	mov r0, sb
	ands r0, r2
	strb r0, [r1, #0xc]
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	movs r1, #0xff
	strb r1, [r0, #0x13]
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #0x14]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x10]
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x10]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	adds r2, r4, r2
	ldrb r3, [r2, #0x15]
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	adds r0, r7, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x15]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x15]
	mov r0, sb
	ands r0, r2
	strb r0, [r1, #0x15]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x11]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x11]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x11]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x11]
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r2, r4, r0
	ldrb r1, [r2, #0x11]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080DB358
	ldrb r1, [r2, #0xc]
	mov r0, sl
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x11]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1, #0x11]
_080DB358:
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r2, r4, r0
	ldrb r1, [r2, #0x11]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080DB37E
	ldrb r0, [r2, #0xb]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #0xb]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x11]
	mov r0, ip
	ands r0, r2
	strb r0, [r1, #0x11]
_080DB37E:
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x11]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x11]
	adds r4, #0x1c
	subs r6, #1
	cmp r6, #0
	blt _080DB398
	b _080DB224
_080DB398:
	movs r6, #0
	ldr r5, _080DB408
	movs r7, #0
	movs r4, #0
_080DB3A0:
	ldr r3, [r5]
	ldr r0, [r3, #4]
	adds r0, r4, r0
	ldrh r1, [r0, #6]
	strh r1, [r0, #8]
	ldr r2, [r3]
	lsls r1, r6, #1
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r2, #0x1c
	adds r2, r2, r1
	ldr r0, [r3, #4]
	adds r0, r4, r0
	ldrh r0, [r0, #6]
	strh r0, [r2]
	ldr r0, [r3, #4]
	adds r0, r4, r0
	ldrh r0, [r0, #6]
	bl Contest_GetMoveExcitement
	ldr r1, [r5]
	ldr r2, [r1]
	ldrb r1, [r2, #1]
	lsls r1, r1, #2
	adds r1, r6, r1
	adds r2, #0x44
	adds r2, r2, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	strh r7, [r0, #6]
	adds r4, #0x1c
	adds r6, #1
	cmp r6, #3
	ble _080DB3A0
	ldr r0, _080DB408
	ldr r0, [r0]
	ldr r2, [r0, #0x10]
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB408: .4byte 0x02039BD4
	thumb_func_end sub_080DB204

	thumb_func_start Contest_IsMonsTurnDisabled
Contest_IsMonsTurnDisabled: @ 0x080DB40C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080DB438
	ldr r1, [r1]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r2
	ldrb r1, [r2, #0xc]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080DB434
	ldrb r1, [r2, #0xb]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080DB43C
_080DB434:
	movs r0, #1
	b _080DB43E
	.align 2, 0
_080DB438: .4byte 0x02039BD4
_080DB43C:
	movs r0, #0
_080DB43E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Contest_IsMonsTurnDisabled

	thumb_func_start sub_080DB444
sub_080DB444: @ 0x080DB444
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_080DB498
	ldr r1, _080DB470
	lsls r4, r4, #1
	adds r1, r4, r1
	strh r0, [r1]
	ldr r2, _080DB474
	adds r2, r4, r2
	ldr r1, _080DB478
	adds r4, r4, r1
	ldrh r4, [r4]
	adds r0, r0, r4
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB470: .4byte 0x02039BB8
_080DB474: .4byte 0x02039BA8
_080DB478: .4byte 0x02039BA0
	thumb_func_end sub_080DB444

	thumb_func_start sub_080DB47C
sub_080DB47C: @ 0x080DB47C
	push {r4, lr}
	movs r4, #0
_080DB480:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080DB444
	adds r4, #1
	cmp r4, #3
	ble _080DB480
	bl DetermineFinalStandings
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080DB47C

	thumb_func_start sub_080DB498
sub_080DB498: @ 0x080DB498
	lsls r0, r0, #0x18
	ldr r1, _080DB4AC
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #0x11
	asrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080DB4AC: .4byte 0x02039BB0
	thumb_func_end sub_080DB498

	thumb_func_start DetermineFinalStandings
DetermineFinalStandings: @ 0x080DB4B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x70
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r0, #0
	mov sb, r0
	mov r1, sp
	adds r1, #8
	str r1, [sp, #0x64]
	mov r3, sp
	adds r3, #0xc
	str r3, [sp, #0x68]
	mov r6, sp
	adds r6, #0x14
	str r6, [sp, #0x6c]
	mov r4, sp
_080DB4DE:
	bl Random
	strh r0, [r4]
	movs r2, #0
	cmp r2, sb
	bge _080DB51C
	mov r1, sp
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bne _080DB500
	subs r4, #2
	movs r7, #1
	rsbs r7, r7, #0
	add sb, r7
	b _080DB51C
_080DB500:
	adds r2, #1
	cmp r2, sb
	bge _080DB51C
	lsls r0, r2, #1
	mov r3, sp
	adds r1, r3, r0
	ldrh r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080DB500
	subs r4, #2
	movs r6, #1
	rsbs r6, r6, #0
	add sb, r6
_080DB51C:
	adds r4, #2
	movs r7, #1
	add sb, r7
	mov r0, sb
	cmp r0, #3
	ble _080DB4DE
	movs r1, #0
	mov sb, r1
	mov r4, sp
	ldr r6, _080DB62C
	ldr r2, [sp, #0x64]
	ldr r5, _080DB630
	ldr r3, [sp, #0x68]
_080DB536:
	mov r7, sb
	lsls r1, r7, #4
	movs r7, #0
	ldrsh r0, [r6, r7]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [r3]
	ldrh r0, [r4]
	str r0, [r2, #8]
	ldr r0, [sp, #0x6c]
	adds r1, r0, r1
	mov r7, sb
	str r7, [r1]
	adds r4, #2
	adds r6, #2
	adds r2, #0x10
	adds r5, #2
	adds r3, #0x10
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #3
	ble _080DB536
	movs r3, #0
	mov sb, r3
_080DB56A:
	movs r4, #3
	cmp r4, sb
	ble _080DB5F4
	add r7, sp, #0x48
	ldr r6, [sp, #0x68]
	str r6, [sp, #0x58]
	ldr r0, [sp, #0x64]
	adds r0, #8
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x6c]
	str r1, [sp, #0x60]
_080DB580:
	subs r3, r4, #1
	mov sl, r3
	mov r0, sl
	adds r1, r4, #0
	ldr r2, [sp, #0x64]
	bl sub_080DB694
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080DB5EE
	mov r6, sl
	lsls r2, r6, #4
	ldr r0, [sp, #0x64]
	adds r3, r0, r2
	ldr r0, [r3]
	str r0, [sp, #0x48]
	ldr r1, [sp, #0x58]
	adds r6, r1, r2
	ldr r0, [r6]
	str r0, [r7, #4]
	ldr r0, [sp, #0x5c]
	adds r0, r0, r2
	mov r8, r0
	ldr r0, [r0]
	str r0, [r7, #8]
	ldr r1, [sp, #0x60]
	adds r2, r1, r2
	ldr r0, [r2]
	str r0, [r7, #0xc]
	lsls r1, r4, #4
	ldr r0, [sp, #0x64]
	adds r5, r0, r1
	ldr r0, [r5]
	str r0, [r3]
	ldr r3, [sp, #0x58]
	adds r4, r3, r1
	ldr r0, [r4]
	str r0, [r6]
	ldr r6, [sp, #0x5c]
	adds r3, r6, r1
	ldr r0, [r3]
	mov r6, r8
	str r0, [r6]
	ldr r0, [sp, #0x60]
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [sp, #0x48]
	str r0, [r5]
	ldr r0, [r7, #4]
	str r0, [r4]
	ldr r0, [r7, #8]
	str r0, [r3]
	ldr r0, [r7, #0xc]
	str r0, [r1]
_080DB5EE:
	mov r4, sl
	cmp r4, sb
	bgt _080DB580
_080DB5F4:
	movs r1, #1
	add sb, r1
	mov r3, sb
	cmp r3, #2
	ble _080DB56A
	movs r6, #0
	mov sb, r6
	ldr r2, _080DB634
	ldr r1, [sp, #0x6c]
_080DB606:
	ldr r0, [r1]
	adds r0, r0, r2
	mov r7, sb
	strb r7, [r0]
	adds r1, #0x10
	movs r0, #1
	add sb, r0
	mov r3, sb
	cmp r3, #3
	ble _080DB606
	add sp, #0x70
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB62C: .4byte 0x02039BA8
_080DB630: .4byte 0x02039BA0
_080DB634: .4byte 0x02039BC0
	thumb_func_end DetermineFinalStandings

	thumb_func_start SaveLinkContestResults
SaveLinkContestResults: @ 0x080DB638
	push {lr}
	ldr r0, _080DB678
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080DB672
	ldr r0, _080DB67C
	ldr r2, [r0]
	ldr r1, _080DB680
	ldr r0, _080DB684
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #1
	ldr r0, _080DB688
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _080DB68C
	adds r2, r2, r0
	adds r2, r2, r1
	ldrh r0, [r2]
	adds r0, #1
	ldr r1, _080DB690
	cmp r0, r1
	ble _080DB670
	adds r0, r1, #0
_080DB670:
	strh r0, [r2]
_080DB672:
	pop {r0}
	bx r0
	.align 2, 0
_080DB678: .4byte 0x02039BCA
_080DB67C: .4byte 0x03005AF0
_080DB680: .4byte 0x02039BC0
_080DB684: .4byte 0x02039BC5
_080DB688: .4byte 0x02039BCC
_080DB68C: .4byte 0x00000624
_080DB690: .4byte 0x0000270F
	thumb_func_end SaveLinkContestResults

	thumb_func_start sub_080DB694
sub_080DB694: @ 0x080DB694
	push {lr}
	lsls r0, r0, #4
	adds r0, r0, r2
	lsls r1, r1, #4
	adds r3, r1, r2
	ldr r2, [r0]
	ldr r1, [r3]
	cmp r2, r1
	blt _080DB6C4
	cmp r2, r1
	bgt _080DB6B6
	ldr r2, [r0, #4]
	ldr r1, [r3, #4]
	cmp r2, r1
	blt _080DB6C4
	cmp r2, r1
	ble _080DB6BA
_080DB6B6:
	movs r2, #0
	b _080DB6C6
_080DB6BA:
	ldr r1, [r0, #8]
	ldr r0, [r3, #8]
	movs r2, #0
	cmp r1, r0
	bge _080DB6C6
_080DB6C4:
	movs r2, #1
_080DB6C6:
	adds r0, r2, #0
	pop {r1}
	bx r1
	thumb_func_end sub_080DB694

	thumb_func_start ContestPrintLinkStandby
ContestPrintLinkStandby: @ 0x080DB6CC
	push {lr}
	ldr r0, _080DB6E8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080DB6EC
	strh r1, [r0]
	bl sub_080DB000
	ldr r0, _080DB6F0
	movs r1, #0
	bl Contest_StartTextPrinter
	pop {r0}
	bx r0
	.align 2, 0
_080DB6E8: .4byte 0x02022ACA
_080DB6EC: .4byte 0x02022AD2
_080DB6F0: .4byte 0x0824C140
	thumb_func_end ContestPrintLinkStandby

	thumb_func_start FillContestantWindowBgs
FillContestantWindowBgs: @ 0x080DB6F4
	push {r4, r5, lr}
	sub sp, #0xc
	movs r5, #0x80
	lsls r5, r5, #0x12
	movs r4, #3
_080DB6FE:
	lsrs r3, r5, #0x18
	movs r0, #8
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x16
	bl ContestBG_FillBoxWithTile
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080DB6FE
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FillContestantWindowBgs

	thumb_func_start sub_080DB72C
sub_080DB72C: @ 0x080DB72C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080DB750
	cmp r0, #0
	beq _080DB746
	ldr r1, _080DB754
	cmp r0, #1
	beq _080DB746
	ldr r1, _080DB758
	cmp r0, #2
	bne _080DB746
	ldr r1, _080DB75C
_080DB746:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080DB750: .4byte 0x00005011
_080DB754: .4byte 0x00006011
_080DB758: .4byte 0x00008011
_080DB75C: .4byte 0x00007011
	thumb_func_end sub_080DB72C

	thumb_func_start sub_080DB760
sub_080DB760: @ 0x080DB760
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0x10
	ble _080DB77A
	movs r1, #0x10
	b _080DB784
_080DB77A:
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r2, r0
	bge _080DB784
	movs r1, #0xf0
_080DB784:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end sub_080DB760

	thumb_func_start sub_080DB78C
sub_080DB78C: @ 0x080DB78C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r0, _080DB820
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1, #2]
	ldr r0, _080DB824
	movs r1, #0x14
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	bl sub_080DB760
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r5, r5, r6
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	bl sub_080DB760
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	subs r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, r8
	bl sub_080DB72C
	ldr r2, _080DB828
	lsls r3, r7, #2
	adds r0, r3, r7
	lsls r0, r0, #3
	adds r1, r0, r2
	adds r0, r4, #0
	cmp r4, #0
	bge _080DB804
	rsbs r0, r4, #0
_080DB804:
	strh r0, [r1, #8]
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0xa]
	cmp r4, #0
	bgt _080DB818
	cmp r4, #0
	bne _080DB82C
	cmp r0, #0
	ble _080DB82C
_080DB818:
	movs r0, #1
	strh r0, [r1, #0xc]
	b _080DB83A
	.align 2, 0
_080DB820: .4byte 0x02039BD4
_080DB824: .4byte 0x080DB859
_080DB828: .4byte 0x03005B60
_080DB82C:
	ldr r2, _080DB850
	lsls r3, r7, #2
	adds r0, r3, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _080DB854
	strh r1, [r0, #0xc]
_080DB83A:
	adds r0, r3, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	mov r1, r8
	strh r1, [r0, #0xe]
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DB850: .4byte 0x03005B60
_080DB854: .4byte 0x0000FFFF
	thumb_func_end sub_080DB78C

	thumb_func_start sub_080DB858
sub_080DB858: @ 0x080DB858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080DB8B8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrb r0, [r4, #0xe]
	mov sb, r0
	ldrh r3, [r4, #8]
	ldrh r1, [r4, #0xa]
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe
	bgt _080DB88A
	b _080DBA0C
_080DB88A:
	movs r0, #0
	strh r0, [r4, #0x1c]
	ldrh r2, [r4, #0xa]
	movs r5, #0xa
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bne _080DB8C0
	adds r0, r7, #0
	bl DestroyTask
	ldr r0, _080DB8BC
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r2, [r1, #2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #2]
	b _080DBA0C
	.align 2, 0
_080DB8B8: .4byte 0x03005B60
_080DB8BC: .4byte 0x02039BD4
_080DB8C0:
	cmp r3, #0
	bne _080DB908
	lsls r0, r1, #0x10
	mov r8, r0
	cmp r0, #0
	bge _080DB8DE
	mov r0, sb
	bl sub_080DB72C
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r4, #0xa]
	adds r0, #1
	b _080DB8EC
_080DB8DE:
	mov r0, sb
	bl sub_080DB72C
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r4, #0xa]
	subs r0, #1
_080DB8EC:
	strh r0, [r4, #0xa]
	ldr r1, _080DB904
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r2, r1, #1
	strh r2, [r0, #8]
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	b _080DB974
	.align 2, 0
_080DB904: .4byte 0x03005B60
_080DB908:
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _080DB942
	lsls r0, r1, #0x10
	mov r8, r0
	cmp r0, #0
	bge _080DB930
	ldrh r0, [r4, #8]
	adds r1, r0, #1
	strh r1, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r2, #1
	strh r0, [r4, #0xa]
	mov r0, sb
	bl sub_080DB72C
	adds r0, #2
	b _080DB970
_080DB930:
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	subs r0, r2, #1
	strh r0, [r4, #0xa]
	b _080DB974
_080DB942:
	lsls r0, r1, #0x10
	mov r8, r0
	cmp r0, #0
	bge _080DB95C
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	adds r0, r2, #1
	strh r0, [r4, #0xa]
	b _080DB974
_080DB95C:
	ldrh r0, [r4, #8]
	adds r1, r0, #1
	strh r1, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	subs r0, r2, #1
	strh r0, [r4, #0xa]
	mov r0, sb
	bl sub_080DB72C
_080DB970:
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080DB974:
	str r5, [sp, #0xc]
	movs r0, #0
	mov sl, r0
	cmp r5, #7
	bls _080DB98A
	movs r2, #1
	mov sl, r2
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080DB98A:
	adds r2, r5, #0
	adds r2, #0x16
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _080DB9DC
	add r0, sb
	ldrb r0, [r0]
	lsls r3, r0, #2
	adds r3, r3, r0
	adds r3, #2
	add r3, sl
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r6, #0
	bl ContestBG_FillBoxWithTile
	mov r3, r8
	cmp r3, #0
	ble _080DB9E8
	movs r0, #0x60
	bl PlaySE
	ldr r4, _080DB9E0
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r1, _080DB9E4
	ldr r0, [sp, #0xc]
	lsls r2, r0, #0x18
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl m4aMPlayPitchControl
	b _080DB9EE
	.align 2, 0
_080DB9DC: .4byte 0x02039BC6
_080DB9E0: .4byte 0x03007510
_080DB9E4: .4byte 0x0000FFFF
_080DB9E8:
	movs r0, #0x16
	bl PlaySE
_080DB9EE:
	mov r2, sl
	cmp r2, #0
	bne _080DBA0C
	cmp r5, #0
	bne _080DBA0C
	cmp r6, #0
	bne _080DBA0C
	ldr r0, _080DBA1C
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xc]
	rsbs r0, r0, #0
	strh r0, [r1, #0xc]
_080DBA0C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBA1C: .4byte 0x03005B60
	thumb_func_end sub_080DB858

	thumb_func_start sub_080DBA20
sub_080DBA20: @ 0x080DBA20
	push {r4, r5, lr}
	ldr r0, _080DBA58
	bl LoadSpriteSheet
	movs r4, #0
	ldr r5, _080DBA5C
_080DBA2C:
	ldr r0, _080DBA60
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r0, _080DBA64
	movs r1, #0xb4
	movs r3, #1
	bl CreateSprite
	ldr r1, _080DBA68
	ldr r1, [r1]
	ldr r2, [r1, #0x14]
	lsls r1, r4, #2
	adds r1, r1, r2
	strb r0, [r1]
	adds r4, #1
	cmp r4, #3
	ble _080DBA2C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBA58: .4byte 0x085609D8
_080DBA5C: .4byte 0x085609D0
_080DBA60: .4byte 0x02039BC6
_080DBA64: .4byte 0x08560A34
_080DBA68: .4byte 0x02039BD4
	thumb_func_end sub_080DBA20

	thumb_func_start sub_080DBA6C
sub_080DBA6C: @ 0x080DBA6C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _080DBAB0
	ldr r0, [r4]
	ldr r2, [r0, #0x14]
	lsls r3, r6, #2
	adds r2, r3, r2
	ldrb r0, [r2, #2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #2]
	ldr r1, [r4]
	ldr r0, [r1, #0x14]
	adds r3, r3, r0
	ldrb r7, [r3]
	ldr r1, [r1, #4]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #4
	ldrsh r0, [r0, r1]
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x11
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x38
	ble _080DBAB4
	movs r5, #0x38
	b _080DBABA
	.align 2, 0
_080DBAB0: .4byte 0x02039BD4
_080DBAB4:
	cmp r0, #0
	bge _080DBABA
	movs r5, #0
_080DBABA:
	ldr r2, _080DBAEC
	lsls r3, r7, #4
	adds r0, r3, r7
	lsls r0, r0, #2
	adds r4, r0, r2
	movs r0, #0x3e
	adds r0, r0, r4
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
	strh r6, [r4, #0x2e]
	strh r5, [r4, #0x30]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x24
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080DBAF0
	movs r0, #1
	b _080DBAF2
	.align 2, 0
_080DBAEC: .4byte 0x020205AC
_080DBAF0:
	ldr r0, _080DBB08
_080DBAF2:
	strh r0, [r4, #0x32]
	adds r0, r3, r7
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _080DBB0C
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBB08: .4byte 0x0000FFFF
_080DBB0C: .4byte 0x080DBB6D
	thumb_func_end sub_080DBA6C

	thumb_func_start sub_080DBB10
sub_080DBB10: @ 0x080DBB10
	push {r4, lr}
	movs r4, #0
_080DBB14:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080DBA6C
	adds r4, #1
	cmp r4, #3
	ble _080DBB14
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080DBB10

	thumb_func_start sub_080DBB28
sub_080DBB28: @ 0x080DBB28
	push {r4, lr}
	movs r2, #0
	ldr r3, _080DBB60
	ldr r0, [r3]
	ldr r0, [r0, #0x14]
	ldrb r1, [r0, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080DBB56
	movs r4, #1
_080DBB3E:
	adds r2, #1
	cmp r2, #3
	bgt _080DBB56
	ldr r0, [r3]
	ldr r1, [r0, #0x14]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080DBB3E
_080DBB56:
	cmp r2, #4
	beq _080DBB64
	movs r0, #0
	b _080DBB66
	.align 2, 0
_080DBB60: .4byte 0x02039BD4
_080DBB64:
	movs r0, #1
_080DBB66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080DBB28

	thumb_func_start sub_080DBB6C
sub_080DBB6C: @ 0x080DBB6C
	push {r4, lr}
	adds r3, r0, #0
	ldrh r2, [r3, #0x24]
	movs r0, #0x24
	ldrsh r1, [r3, r0]
	movs r4, #0x30
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne _080DBBA4
	ldr r0, _080DBB9C
	ldr r0, [r0]
	movs r2, #0x2e
	ldrsh r1, [r3, r2]
	ldr r0, [r0, #0x14]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #2]
	ldr r0, _080DBBA0
	str r0, [r3, #0x1c]
	b _080DBBAA
	.align 2, 0
_080DBB9C: .4byte 0x02039BD4
_080DBBA0: .4byte 0x08007141
_080DBBA4:
	ldrh r0, [r3, #0x32]
	adds r0, r2, r0
	strh r0, [r3, #0x24]
_080DBBAA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080DBB6C

	thumb_func_start sub_080DBBB0
sub_080DBBB0: @ 0x080DBBB0
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _080DBBE4
	ldr r5, _080DBBE8
	ldr r4, _080DBBEC
	ldr r3, _080DBBF0
_080DBBBC:
	ldr r0, [r5]
	ldr r1, [r0, #0x14]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	strh r0, [r1, #0x22]
	adds r2, #1
	cmp r2, #3
	ble _080DBBBC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DBBE4: .4byte 0x020205AC
_080DBBE8: .4byte 0x02039BD4
_080DBBEC: .4byte 0x085609D0
_080DBBF0: .4byte 0x02039BC6
	thumb_func_end sub_080DBBB0

	thumb_func_start sub_080DBBF4
sub_080DBBF4: @ 0x080DBBF4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r3, #0
	ldr r7, _080DBC24
	ldr r5, _080DBC28
	ldr r4, _080DBC2C
	movs r2, #0
_080DBC04:
	adds r0, r3, r7
	ldrb r0, [r0]
	cmp r0, #1
	bls _080DBC46
	cmp r6, #0
	bne _080DBC30
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0xb4
	b _080DBC44
	.align 2, 0
_080DBC24: .4byte 0x02039BC6
_080DBC28: .4byte 0x020205AC
_080DBC2C: .4byte 0x02039BD4
_080DBC30:
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x80
	lsls r1, r1, #1
_080DBC44:
	strh r1, [r0, #0x20]
_080DBC46:
	adds r2, #4
	adds r3, #1
	cmp r3, #3
	ble _080DBC04
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080DBBF4

	thumb_func_start sub_080DBC54
sub_080DBC54: @ 0x080DBC54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080DBCD8
	bl LoadSpritePalette
	movs r5, #0
	ldr r7, _080DBCDC
	ldr r0, _080DBCE0
	mov r8, r0
	movs r6, #0
_080DBC6A:
	lsls r0, r5, #3
	ldr r1, _080DBCE4
	adds r0, r0, r1
	bl LoadCompressedSpriteSheet
	ldr r0, _080DBCE8
	adds r0, r6, r0
	ldr r2, _080DBCEC
	ldr r1, _080DBCF0
	adds r1, r5, r1
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r1, #0xcc
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	ldr r1, [r1, #0x14]
	lsls r4, r5, #2
	adds r1, r4, r1
	strb r0, [r1, #1]
	ldr r0, [r7]
	ldr r0, [r0, #0x14]
	adds r0, r4, r0
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _080DBCF4
	bl SetSubspriteTables
	ldr r0, [r7]
	ldr r0, [r0, #0x14]
	adds r4, r4, r0
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	adds r6, #0x18
	adds r5, #1
	cmp r5, #3
	ble _080DBC6A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBCD8: .4byte 0x08560A6C
_080DBCDC: .4byte 0x02039BD4
_080DBCE0: .4byte 0x020205AC
_080DBCE4: .4byte 0x08560A4C
_080DBCE8: .4byte 0x08560A7C
_080DBCEC: .4byte 0x085609D4
_080DBCF0: .4byte 0x02039BC6
_080DBCF4: .4byte 0x08560AE4
	thumb_func_end sub_080DBC54

	thumb_func_start CreateApplauseMeterSprite
CreateApplauseMeterSprite: @ 0x080DBCF8
	push {lr}
	ldr r0, _080DBD38
	bl LoadCompressedSpriteSheet
	ldr r0, _080DBD3C
	bl LoadSpritePalette
	ldr r0, _080DBD40
	movs r1, #0x1e
	movs r2, #0x2c
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DBD44
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r3, #4
	orrs r2, r3
	strb r2, [r1]
	ldr r1, _080DBD48
	ldr r1, [r1]
	ldr r1, [r1]
	adds r1, #0x58
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080DBD38: .4byte 0x08560B14
_080DBD3C: .4byte 0x08560B1C
_080DBD40: .4byte 0x08560B2C
_080DBD44: .4byte 0x020205AC
_080DBD48: .4byte 0x02039BD4
	thumb_func_end CreateApplauseMeterSprite

	thumb_func_start sub_080DBD4C
sub_080DBD4C: @ 0x080DBD4C
	push {r4, lr}
	ldr r0, _080DBD88
	movs r1, #0x1e
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080DBD8C
	ldr r1, [r1]
	ldr r1, [r1]
	strb r0, [r1, #0xd]
	movs r2, #0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r4, _080DBD90
	movs r3, #0xff
_080DBD6E:
	lsls r0, r2, #3
	adds r0, r0, r1
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080DBD6E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBD88: .4byte 0x080DBE8D
_080DBD8C: .4byte 0x02039BD4
_080DBD90: .4byte 0x03005B68
	thumb_func_end sub_080DBD4C

	thumb_func_start sub_080DBD94
sub_080DBD94: @ 0x080DBD94
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080DBDD0
	ldr r1, _080DBDD4
	ldr r5, [r1]
	ldr r1, [r5]
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #2
	adds r1, r1, r2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r3, #8
	adds r1, r1, r3
	movs r4, #0
	strh r4, [r1]
	lsls r0, r0, #2
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, [r5]
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	strh r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBDD0: .4byte 0x03005B60
_080DBDD4: .4byte 0x02039BD4
	thumb_func_end sub_080DBD94

	thumb_func_start sub_080DBDD8
sub_080DBDD8: @ 0x080DBDD8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080DBE00
	movs r1, #0x1f
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DBE04
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBE00: .4byte 0x080DBE09
_080DBE04: .4byte 0x03005B60
	thumb_func_end sub_080DBDD8

	thumb_func_start sub_080DBE08
sub_080DBE08: @ 0x080DBE08
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r2, _080DBE80
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	adds r5, r0, #0
	ldr r0, _080DBE84
	ldr r4, [r0]
	ldr r0, [r4]
	ldrb r1, [r0, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r7, r2, #0
	adds r7, #8
	adds r1, r0, r7
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080DBE40
	cmp r0, #0xff
	bne _080DBE7A
_080DBE40:
	movs r3, #0
	movs r0, #0xff
	strh r0, [r1]
	lsls r1, r5, #2
	adds r1, #1
	lsls r1, r1, #1
	ldr r0, [r4]
	ldrb r2, [r0, #0xd]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r7
	strh r3, [r1]
	ldr r0, [r4]
	adds r0, #0x14
	adds r0, r0, r5
	ldrb r0, [r0]
	adds r0, #5
	lsls r0, r0, #4
	adds r0, #6
	ldr r3, _080DBE88
	movs r1, #2
	movs r2, #0
	bl BlendPalette
	adds r0, r6, #0
	bl DestroyTask
_080DBE7A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBE80: .4byte 0x03005B60
_080DBE84: .4byte 0x02039BD4
_080DBE88: .4byte 0x00004BFF
	thumb_func_end sub_080DBE08

	thumb_func_start sub_080DBE8C
sub_080DBE8C: @ 0x080DBE8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	lsls r1, r0, #2
	adds r1, r1, r0
	mov sb, r1
	lsls r7, r1, #3
	ldr r0, _080DBEDC
	mov r8, r0
	movs r1, #8
	rsbs r1, r1, #0
	add r1, r8
	mov sl, r1
_080DBEB0:
	lsls r0, r6, #0x1a
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	adds r0, r0, r7
	mov r4, r8
	adds r2, r0, r4
	ldrh r4, [r2]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0xff
	beq _080DBF2E
	adds r0, r3, #1
	lsls r1, r0, #1
	adds r1, r1, r7
	add r1, r8
	movs r5, #0
	ldrsh r1, [r1, r5]
	adds r5, r0, #0
	cmp r1, #0
	bne _080DBEE0
	adds r0, r4, #1
	b _080DBEE2
	.align 2, 0
_080DBEDC: .4byte 0x03005B68
_080DBEE0:
	subs r0, r4, #1
_080DBEE2:
	strh r0, [r2]
	lsls r1, r3, #1
	mov r0, sb
	lsls r2, r0, #3
	adds r0, r1, r2
	mov r3, sl
	adds r3, #8
	adds r0, r0, r3
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r1, #0
	cmp r0, #0x10
	beq _080DBF00
	cmp r0, #0
	bne _080DBF0E
_080DBF00:
	lsls r0, r5, #1
	adds r0, r0, r2
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r2, #1
	eors r1, r2
	strh r1, [r0]
_080DBF0E:
	ldr r0, _080DBF48
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x14
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, #5
	lsls r0, r0, #4
	adds r0, #6
	adds r1, r4, r7
	add r1, r8
	ldrb r2, [r1]
	movs r1, #2
	ldr r3, _080DBF4C
	bl BlendPalette
_080DBF2E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _080DBEB0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBF48: .4byte 0x02039BD4
_080DBF4C: .4byte 0x00004BFF
	thumb_func_end sub_080DBE8C

	thumb_func_start sub_080DBF50
sub_080DBF50: @ 0x080DBF50
	push {r4, lr}
	ldr r0, _080DBF78
	movs r1, #0x1e
	bl CreateTask
	ldr r1, _080DBF7C
	ldr r1, [r1]
	ldr r1, [r1]
	strb r0, [r1, #0xe]
	movs r4, #0
_080DBF64:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080DBF80
	adds r4, #1
	cmp r4, #3
	ble _080DBF64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBF78: .4byte 0x080DC035
_080DBF7C: .4byte 0x02039BD4
	thumb_func_end sub_080DBF50

	thumb_func_start sub_080DBF80
sub_080DBF80: @ 0x080DBF80
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080DBFC0
	ldr r1, _080DBFC4
	ldr r4, [r1]
	ldr r1, [r4]
	ldrb r2, [r1, #0xe]
	lsls r1, r2, #2
	adds r1, r1, r2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r3, #8
	adds r1, r1, r3
	movs r5, #0
	movs r2, #0xff
	strh r2, [r1]
	lsls r0, r0, #2
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, [r4]
	ldrb r2, [r1, #0xe]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBFC0: .4byte 0x03005B60
_080DBFC4: .4byte 0x02039BD4
	thumb_func_end sub_080DBF80

	thumb_func_start sub_080DBFC8
sub_080DBFC8: @ 0x080DBFC8
	push {r4, lr}
	movs r4, #0
_080DBFCC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080DBFE0
	adds r4, #1
	cmp r4, #3
	ble _080DBFCC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080DBFC8

	thumb_func_start sub_080DBFE0
sub_080DBFE0: @ 0x080DBFE0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_080DBF80
	adds r0, r4, #5
	lsls r2, r0, #5
	ldr r3, _080DC024
	adds r6, r2, r3
	ldr r5, _080DC028
	adds r2, r2, r5
	ldr r1, _080DC02C
	str r6, [r1]
	str r2, [r1, #4]
	ldr r2, _080DC030
	str r2, [r1, #8]
	ldr r6, [r1, #8]
	lsls r0, r0, #4
	adds r4, #0xc
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r3, #0x14
	adds r3, r0, r3
	subs r5, #0x14
	adds r0, r0, r5
	str r3, [r1]
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC024: .4byte 0x020373C8
_080DC028: .4byte 0x020377C8
_080DC02C: .4byte 0x040000D4
_080DC030: .4byte 0x80000001
	thumb_func_end sub_080DBFE0

	thumb_func_start sub_080DC034
sub_080DC034: @ 0x080DC034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r7, #0
	lsls r1, r0, #2
	adds r1, r1, r0
	mov sb, r1
	lsls r6, r1, #3
	ldr r0, _080DC09C
	mov r8, r0
	ldr r1, _080DC0A0
	mov sl, r1
_080DC054:
	lsls r0, r7, #0x1a
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	adds r0, r0, r6
	mov r4, r8
	adds r2, r0, r4
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0xff
	beq _080DC0FA
	adds r0, r3, #2
	lsls r0, r0, #1
	adds r0, r0, r6
	adds r1, r0, r4
	ldrh r0, [r1]
	adds r0, #1
	movs r4, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _080DC0FA
	strh r4, [r1]
	adds r0, r3, #1
	lsls r1, r0, #1
	adds r1, r1, r6
	add r1, r8
	movs r4, #0
	ldrsh r1, [r1, r4]
	adds r4, r0, #0
	cmp r1, #0
	bne _080DC0A4
	ldrh r0, [r2]
	adds r0, #1
	b _080DC0A8
	.align 2, 0
_080DC09C: .4byte 0x03005B68
_080DC0A0: .4byte 0x00004BFF
_080DC0A4:
	ldrh r0, [r2]
	subs r0, #1
_080DC0A8:
	strh r0, [r2]
	lsls r1, r3, #1
	mov r5, sb
	lsls r2, r5, #3
	adds r0, r1, r2
	ldr r3, _080DC114
	adds r3, #8
	adds r0, r0, r3
	movs r5, #0
	ldrsh r0, [r0, r5]
	adds r5, r1, #0
	cmp r0, #0x10
	beq _080DC0C6
	cmp r0, #0
	bne _080DC0D4
_080DC0C6:
	lsls r0, r4, #1
	adds r0, r0, r2
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r2, #1
	eors r1, r2
	strh r1, [r0]
_080DC0D4:
	adds r4, r7, #5
	lsls r4, r4, #4
	adds r0, r4, #0
	adds r0, #0xa
	adds r5, r5, r6
	add r5, r8
	ldrb r2, [r5]
	movs r1, #1
	mov r3, sl
	bl BlendPalette
	adds r4, #0xc
	adds r4, r4, r7
	ldrb r2, [r5]
	adds r0, r4, #0
	movs r1, #1
	mov r3, sl
	bl BlendPalette
_080DC0FA:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _080DC054
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DC114: .4byte 0x03005B60
	thumb_func_end sub_080DC034

	thumb_func_start sub_080DC118
sub_080DC118: @ 0x080DC118
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080DC140
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080DC144
	adds r0, r2, #0
	bl sub_080DBD94
	b _080DC14A
	.align 2, 0
_080DC140: .4byte 0x02039BD4
_080DC144:
	adds r0, r2, #0
	bl sub_080DBDD8
_080DC14A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080DC118

	thumb_func_start sub_080DC150
sub_080DC150: @ 0x080DC150
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r6, _080DC2AC
	adds r6, r0, r6
	ldrb r0, [r6]
	lsls r5, r0, #2
	adds r5, r5, r0
	lsls r5, r5, #0x1b
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r5, r5, r0
	lsrs r5, r5, #0x18
	ldr r1, [sp, #0xc]
	lsls r4, r1, #3
	ldr r0, _080DC2B0
	adds r0, r4, r0
	bl LoadCompressedSpriteSheet
	ldr r0, _080DC2B4
	adds r4, r4, r0
	adds r0, r4, #0
	bl LoadSpritePalette
	ldr r2, [sp, #0xc]
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r4, r4, #3
	ldr r0, _080DC2B8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb8
	adds r2, r5, #0
	movs r3, #0x1d
	bl CreateSprite
	mov sb, r0
	mov r3, sb
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	adds r0, r4, #0
	movs r1, #0xf8
	adds r2, r5, #0
	movs r3, #0x1d
	bl CreateSprite
	mov r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r0, #4
	add r5, r8
	lsls r5, r5, #2
	ldr r1, _080DC2BC
	adds r5, r5, r1
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x40
	ldr r3, _080DC2C0
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _080DC2C4
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r4, #0xc0
	lsls r4, r4, #0x13
	ldrb r0, [r6]
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #6
	ldr r0, _080DC2C8
	adds r3, r3, r0
	ldr r7, _080DC2CC
	ldr r0, [r7]
	ldr r0, [r0, #0x34]
	str r0, [sp]
	movs r0, #0
	movs r1, #3
	adds r2, r4, #0
	bl CopySpriteTiles
	ldrb r0, [r6]
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #6
	ldr r1, _080DC2D0
	adds r3, r3, r1
	ldr r0, [r7]
	ldr r0, [r0, #0x38]
	str r0, [sp]
	movs r0, #0
	movs r1, #3
	adds r2, r4, #0
	bl CopySpriteTiles
	movs r4, #0
	str r4, [sp, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	movs r6, #0xa0
	lsls r6, r6, #3
	adds r1, r1, r6
	ldr r2, _080DC2D4
	mov sl, r2
	add r0, sp, #4
	bl CpuSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r1, [r7]
	ldr r1, [r1, #0x38]
	adds r1, r1, r6
	mov r2, sl
	bl CpuSet
	ldr r0, [r7]
	ldr r0, [r0, #0x34]
	mov r3, sb
	lsls r4, r3, #4
	add r4, sb
	lsls r4, r4, #2
	ldr r1, _080DC2BC
	adds r4, r4, r1
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r6, _080DC2D8
	adds r1, r1, r6
	movs r2, #0x80
	lsls r2, r2, #4
	mov sl, r2
	movs r3, #1
	bl RequestDma3Copy
	ldr r0, [r7]
	ldr r0, [r0, #0x38]
	ldrh r1, [r5, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	adds r1, r1, r6
	mov r2, sl
	movs r3, #1
	bl RequestDma3Copy
	mov r3, r8
	strh r3, [r4, #0x2e]
	mov r0, sb
	strh r0, [r5, #0x2e]
	mov r1, sp
	ldrh r1, [r1, #0xc]
	strh r1, [r4, #0x30]
	mov r2, sp
	ldrh r2, [r2, #0xc]
	strh r2, [r5, #0x30]
	mov r0, sb
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DC2AC: .4byte 0x02039BC6
_080DC2B0: .4byte 0x08562888
_080DC2B4: .4byte 0x085628A8
_080DC2B8: .4byte 0x08562910
_080DC2BC: .4byte 0x020205AC
_080DC2C0: .4byte 0x000003FF
_080DC2C4: .4byte 0xFFFFFC00
_080DC2C8: .4byte 0x0600E026
_080DC2CC: .4byte 0x02039BD4
_080DC2D0: .4byte 0x0600E036
_080DC2D4: .4byte 0x050000C0
_080DC2D8: .4byte 0x06010000
	thumb_func_end sub_080DC150

	thumb_func_start sub_080DC2DC
sub_080DC2DC: @ 0x080DC2DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080DC314
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r5, r5, r1
	ldrh r0, [r5, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r1
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	adds r0, r5, #0
	bl DestroySpriteAndFreeResources
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC314: .4byte 0x020205AC
	thumb_func_end sub_080DC2DC

	thumb_func_start sub_080DC318
sub_080DC318: @ 0x080DC318
	push {lr}
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _080DC330
	movs r0, #0x52
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080DC330: .4byte 0x00000907
	thumb_func_end sub_080DC318

	thumb_func_start sub_080DC334
sub_080DC334: @ 0x080DC334
	push {lr}
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080DC334

	thumb_func_start sub_080DC34C
sub_080DC34C: @ 0x080DC34C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov sb, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	bl sub_080DC318
	ldr r0, _080DC3C4
	ldr r1, [r0]
	ldr r2, _080DC3C8
	mov r8, r2
	lsls r6, r4, #4
	adds r6, r6, r4
	lsls r6, r6, #2
	adds r0, r6, r2
	movs r3, #0x30
	ldrsh r2, [r0, r3]
	ldr r1, [r1, #0x14]
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r1, [r2, #2]
	movs r3, #2
	orrs r1, r3
	strb r1, [r2, #2]
	ldrh r5, [r0, #0x2e]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r1, #1
	bl StartSpriteAffineAnim
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	mov r1, r8
	adds r0, r4, r1
	movs r1, #1
	bl StartSpriteAffineAnim
	movs r2, #0x1c
	add r8, r2
	add r6, r8
	ldr r0, _080DC3CC
	str r0, [r6]
	add r4, r8
	ldr r0, _080DC3D0
	str r0, [r4]
	mov r3, sb
	cmp r3, #0
	bne _080DC3D4
	movs r0, #0x65
	bl PlaySE
	b _080DC3DA
	.align 2, 0
_080DC3C4: .4byte 0x02039BD4
_080DC3C8: .4byte 0x020205AC
_080DC3CC: .4byte 0x080DC3E9
_080DC3D0: .4byte 0x08007141
_080DC3D4:
	movs r0, #2
	bl PlaySE
_080DC3DA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080DC34C

	thumb_func_start sub_080DC3E8
sub_080DC3E8: @ 0x080DC3E8
	push {lr}
	mov ip, r0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080DC430
	mov r0, ip
	ldrh r1, [r0, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080DC434
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _080DC430
	mov r3, ip
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r2, #4
	orrs r0, r2
	strb r0, [r3]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080DC438
	mov r1, ip
	str r0, [r1, #0x1c]
_080DC430:
	pop {r0}
	bx r0
	.align 2, 0
_080DC434: .4byte 0x020205AC
_080DC438: .4byte 0x080DC43D
	thumb_func_end sub_080DC3E8

	thumb_func_start sub_080DC43C
sub_080DC43C: @ 0x080DC43C
	push {lr}
	ldr r1, _080DC468
	ldr r1, [r1]
	movs r3, #0x30
	ldrsh r2, [r0, r3]
	ldr r1, [r1, #0x14]
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r3, [r2, #2]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r3
	strb r1, [r2, #2]
	ldrh r0, [r0, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080DC2DC
	bl sub_080DC334
	pop {r0}
	bx r0
	.align 2, 0
_080DC468: .4byte 0x02039BD4
	thumb_func_end sub_080DC43C

	thumb_func_start ContestDebugTogglePointTotal
ContestDebugTogglePointTotal: @ 0x080DC46C
	push {lr}
	ldr r0, _080DC484
	movs r1, #0xd0
	lsls r1, r1, #9
	adds r2, r0, r1
	ldrb r1, [r2]
	adds r3, r0, #0
	cmp r1, #1
	bne _080DC488
	movs r0, #0
	b _080DC48A
	.align 2, 0
_080DC484: .4byte 0x02000000
_080DC488:
	movs r0, #1
_080DC48A:
	strb r0, [r2]
	movs r1, #0xd0
	lsls r1, r1, #9
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080DC4A2
	bl DrawContestantWindowText
	bl SwapMoveDescAndContestTilemaps
	b _080DC4A6
_080DC4A2:
	bl ContestDebugDoPrint
_080DC4A6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestDebugTogglePointTotal

	thumb_func_start ContestDebugDoPrint
ContestDebugDoPrint: @ 0x080DC4AC
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080DC4D8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080DC5A6
	ldr r0, _080DC4DC
	movs r1, #0xd0
	lsls r1, r1, #9
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080DC5A6
	cmp r0, #0
	blt _080DC4E0
	cmp r0, #3
	bgt _080DC4E0
	cmp r0, #2
	blt _080DC4E0
	bl ContestDebugPrintBitStrings
	b _080DC5A6
	.align 2, 0
_080DC4D8: .4byte 0x02031F75
_080DC4DC: .4byte 0x02000000
_080DC4E0:
	movs r4, #0
_080DC4E2:
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080DC4E2
	movs r4, #0
_080DC502:
	ldr r0, _080DC5B0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sp
	ldrh r5, [r0, #4]
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080DC52C
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sp
	ldr r1, _080DC5B4
	bl StringCopy
	adds r2, r0, #0
_080DC52C:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	movs r2, #0
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r0, _080DC5B8
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r0, #4
	mov r1, sp
	bl Contest_PrintTextToBg0WindowStd
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080DC502
	movs r4, #0
_080DC554:
	ldr r0, _080DC5B0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sp
	ldrh r5, [r0, #2]
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080DC57E
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sp
	ldr r1, _080DC5B4
	bl StringCopy
	adds r2, r0, #0
_080DC57E:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	movs r2, #0
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r0, _080DC5B8
	adds r0, r4, r0
	ldrb r0, [r0]
	mov r1, sp
	bl Contest_PrintTextToBg0WindowStd
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080DC554
	bl SwapMoveDescAndContestTilemaps
_080DC5A6:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC5B0: .4byte 0x02039BD4
_080DC5B4: .4byte 0x085C9401
_080DC5B8: .4byte 0x02039BC6
	thumb_func_end ContestDebugDoPrint

	thumb_func_start SortContestants
SortContestants: @ 0x080DC5BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	add r4, sp, #4
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl memset
	movs r5, #0
	add r4, sp, #4
	adds r6, r4, #0
	movs r7, #0
_080DC5E2:
	bl Random
	adds r1, r0, #0
	mov r0, sp
	adds r0, r0, r7
	adds r0, #4
	strh r1, [r0]
	movs r2, #0
	cmp r2, r5
	bge _080DC61A
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov r1, sp
	ldrh r1, [r1, #4]
	cmp r0, r1
	beq _080DC614
_080DC602:
	adds r2, #1
	cmp r2, r5
	bge _080DC61A
	lsls r0, r2, #1
	adds r0, r4, r0
	ldrh r1, [r6]
	ldrh r0, [r0]
	cmp r1, r0
	bne _080DC602
_080DC614:
	subs r6, #2
	subs r7, #2
	subs r5, #1
_080DC61A:
	adds r6, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #3
	ble _080DC5E2
	mov r2, r8
	cmp r2, #0
	bne _080DC6E4
	movs r5, #0
	ldr r3, _080DC69C
	mov r8, r3
_080DC630:
	mov r6, r8
	strb r5, [r6]
	movs r4, #0
	cmp r4, r5
	bge _080DC6AC
	ldr r7, _080DC6A0
	mov sb, r7
	lsls r0, r5, #1
	adds r1, r0, #0
	add r1, sb
	mov ip, r1
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0xc]
	add r0, sp
	adds r0, #4
	str r0, [sp, #0x10]
	ldr r3, _080DC69C
	adds r6, r3, #0
	mov sl, r6
_080DC658:
	ldrb r0, [r3]
	lsls r2, r0, #1
	mov r7, sb
	adds r0, r2, r7
	movs r6, #0
	ldrsh r1, [r0, r6]
	mov r7, ip
	movs r6, #0
	ldrsh r0, [r7, r6]
	cmp r1, r0
	blt _080DC680
	cmp r1, r0
	bne _080DC6A4
	ldr r7, [sp, #0xc]
	adds r0, r7, r2
	ldrh r0, [r0]
	ldr r1, [sp, #0x10]
	ldrh r1, [r1]
	cmp r0, r1
	bhs _080DC6A4
_080DC680:
	adds r2, r5, #0
	cmp r5, r4
	ble _080DC698
	subs r0, r5, #1
	mov r6, sl
	adds r1, r0, r6
_080DC68C:
	ldrb r0, [r1]
	strb r0, [r1, #1]
	subs r1, #1
	subs r2, #1
	cmp r2, r4
	bgt _080DC68C
_080DC698:
	strb r5, [r3]
	b _080DC6AC
	.align 2, 0
_080DC69C: .4byte 0x02039BC6
_080DC6A0: .4byte 0x02039BA0
_080DC6A4:
	adds r3, #1
	adds r4, #1
	cmp r4, r5
	blt _080DC658
_080DC6AC:
	cmp r4, r5
	bne _080DC6B4
	mov r7, r8
	strb r5, [r7]
_080DC6B4:
	movs r0, #1
	add r8, r0
	adds r5, #1
	cmp r5, #3
	ble _080DC630
	ldr r4, _080DC6E0
	mov r0, sp
	adds r1, r4, #0
	movs r2, #4
	bl memcpy
	movs r5, #0
_080DC6CC:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	adds r0, r0, r4
	strb r5, [r0]
	adds r5, #1
	cmp r5, #3
	ble _080DC6CC
	b _080DC798
	.align 2, 0
_080DC6E0: .4byte 0x02039BC6
_080DC6E4:
	mov r0, sp
	movs r1, #0xff
	movs r2, #4
	bl memset
	movs r5, #0
	ldr r3, _080DC708
	movs r6, #0
_080DC6F4:
	ldr r0, _080DC70C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r6, r0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x1e
	lsrs r2, r0, #0x1e
	mov r7, sp
	adds r1, r7, r2
	b _080DC71A
	.align 2, 0
_080DC708: .4byte 0x02039BC6
_080DC70C: .4byte 0x02039BD4
_080DC710:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r0, sp
	adds r1, r0, r2
_080DC71A:
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080DC710
	strb r5, [r1]
	strb r2, [r3]
	adds r3, #1
	adds r6, #0x1c
	adds r5, #1
	cmp r5, #3
	ble _080DC6F4
	movs r5, #0
_080DC730:
	movs r4, #3
	adds r1, r5, #1
	mov sl, r1
	cmp r4, r5
	ble _080DC792
	mov sb, r4
	ldr r2, _080DC7A8
	mov r8, r2
	add r3, sp, #4
	mov ip, r3
_080DC744:
	ldr r6, _080DC7AC
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r1, r0, #0
	subs r1, #0x1c
	ldrb r2, [r1, #0xb]
	ldrb r3, [r0, #0xb]
	mov r1, sb
	ands r1, r2
	mov r0, sb
	ands r0, r3
	subs r3, r4, #1
	cmp r1, r0
	bne _080DC78C
	mov r0, r8
	adds r7, r3, r0
	adds r2, r4, r0
	ldrb r6, [r7]
	ldrb r1, [r2]
	cmp r6, r1
	bhs _080DC78C
	lsls r0, r3, #1
	add r0, ip
	lsls r1, r4, #1
	add r1, ip
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bhs _080DC78C
	ldrb r0, [r2]
	strb r6, [r2]
	strb r0, [r7]
_080DC78C:
	adds r4, r3, #0
	cmp r4, r5
	bgt _080DC744
_080DC792:
	mov r5, sl
	cmp r5, #2
	ble _080DC730
_080DC798:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DC7A8: .4byte 0x02039BC6
_080DC7AC: .4byte 0x02039BD4
	thumb_func_end SortContestants

	thumb_func_start DrawContestantWindows
DrawContestantWindows: @ 0x080DC7B0
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #0xa0
_080DC7B6:
	ldr r0, _080DC7DC
	adds r0, r5, r0
	ldr r1, _080DC7E0
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadPalette
	adds r5, #0x20
	adds r4, #1
	cmp r4, #3
	ble _080DC7B6
	bl DrawContestantWindowText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC7DC: .4byte 0x0201A004
_080DC7E0: .4byte 0x02039BC6
	thumb_func_end DrawContestantWindows

	thumb_func_start sub_080DC7E4
sub_080DC7E4: @ 0x080DC7E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _080DC86C
	ldr r3, [r4]
	ldr r1, [r3, #4]
	lsls r7, r6, #3
	subs r0, r7, r6
	lsls r5, r0, #2
	adds r1, r5, r1
	movs r2, #0
	strh r2, [r1, #2]
	ldr r0, [r3, #4]
	adds r0, r5, r0
	strh r2, [r0]
	adds r0, r6, #0
	bl ContestantCanUseTurn
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	bne _080DC818
	b _080DCB28
_080DC818:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	adds r1, r5, r1
	ldrh r0, [r1, #6]
	ldr r2, _080DC870
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r2, [r0]
	mov sb, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	strb r0, [r1, #0xa]
	ldr r0, [r4]
	ldr r0, [r0, #4]
	adds r2, r5, r0
	ldrh r0, [r2, #6]
	ldrh r1, [r2, #8]
	cmp r0, r1
	bne _080DC874
	cmp r0, #0
	beq _080DC874
	ldrb r0, [r2, #0x15]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x15]
	ldr r0, [r4]
	ldr r2, [r0, #4]
	adds r2, r5, r2
	ldrb r3, [r2, #0xb]
	lsls r1, r3, #0x19
	lsrs r1, r1, #0x1d
	adds r1, #1
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x71
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0xb]
	b _080DC890
	.align 2, 0
_080DC86C: .4byte 0x02039BD4
_080DC870: .4byte 0x08565FCC
_080DC874:
	ldr r4, _080DC944
	ldr r0, [r4]
	ldr r0, [r0, #4]
	lsls r3, r6, #3
	subs r1, r3, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0xb]
	movs r0, #0x71
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0xb]
	mov r8, r4
	adds r7, r3, #0
_080DC890:
	mov r2, r8
	ldr r4, [r2]
	ldr r2, [r4, #4]
	subs r0, r7, r6
	lsls r0, r0, #2
	adds r2, r0, r2
	ldr r3, _080DC948
	mov r1, sb
	lsls r5, r1, #2
	adds r3, r5, r3
	ldrb r1, [r3, #1]
	strh r1, [r2]
	ldr r1, [r4, #4]
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r0, #2]
	ldr r1, [r4, #8]
	ldrb r0, [r3, #2]
	strh r0, [r1, #4]
	ldr r1, [r4, #8]
	ldrh r0, [r1, #4]
	strh r0, [r1, #6]
	ldr r0, [r4, #8]
	strb r6, [r0, #0x11]
	movs r2, #0
	mov sb, r5
	mov r4, r8
	movs r3, #0
	movs r1, #0
_080DC8CA:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	strb r3, [r0, #0xe]
	ldr r0, [r4]
	ldr r0, [r0, #8]
	adds r0, #0xd
	adds r0, r0, r2
	strb r3, [r0]
	adds r1, #0x1c
	adds r2, #1
	cmp r2, #3
	ble _080DC8CA
	ldr r5, _080DC944
	ldr r0, [r5]
	ldr r1, [r0, #4]
	subs r0, r7, r6
	lsls r4, r0, #2
	adds r2, r4, r1
	ldrb r1, [r2, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080DC918
	ldrh r0, [r2, #8]
	ldrh r1, [r2, #6]
	bl AreMovesContestCombo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080DC918
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x15]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x15]
_080DC918:
	ldr r0, _080DC94C
	add r0, sb
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080DC944
	ldr r0, [r0]
	ldr r1, [r0, #4]
	subs r0, r7, r6
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r1, [r2, #0x10]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x10
	bne _080DC950
	ldrh r1, [r2, #2]
	subs r1, #0xa
	movs r0, #0xd
	ldrsb r0, [r2, r0]
	b _080DC96A
	.align 2, 0
_080DC944: .4byte 0x02039BD4
_080DC948: .4byte 0x08566AE4
_080DC94C: .4byte 0x08566BE4
_080DC950:
	ldrb r1, [r2, #0x11]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080DC964
	movs r1, #0xd
	ldrsb r1, [r2, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	b _080DC968
_080DC964:
	movs r0, #0xd
	ldrsb r0, [r2, r0]
_080DC968:
	ldrh r1, [r2, #2]
_080DC96A:
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldr r5, _080DC9FC
	ldr r0, [r5]
	ldr r1, [r0, #4]
	subs r0, r7, r6
	lsls r4, r0, #2
	adds r1, r4, r1
	movs r0, #0
	strb r0, [r1, #0x16]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x15]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x15]
	adds r0, r6, #0
	bl sub_080DD94C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080DCA46
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #6]
	bl AreMovesContestCombo
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _080DCA00
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r2, r4, r0
	ldrb r1, [r2, #0x15]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080DCA00
	strb r3, [r2, #0x16]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r0, [r1, #0x15]
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r1, #0x15]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r2, [r1, #0x15]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #0x15]
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldrb r1, [r0, #0x16]
	muls r1, r2, r1
	strb r1, [r0, #0x17]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r0, [r1, #0x15]
	movs r2, #8
	b _080DCA2C
	.align 2, 0
_080DC9FC: .4byte 0x02039BD4
_080DCA00:
	ldr r2, _080DCA34
	ldr r5, _080DCA38
	ldr r0, [r5]
	ldr r1, [r0, #4]
	subs r0, r7, r6
	lsls r4, r0, #2
	adds r3, r4, r1
	ldrh r0, [r3, #6]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _080DCA3C
	ldrb r0, [r3, #0x15]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #0x15]
	ldr r0, [r5]
	ldr r1, [r0, #4]
	adds r1, r4, r1
	ldrb r0, [r1, #0x15]
	movs r2, #0x40
_080DCA2C:
	orrs r0, r2
	strb r0, [r1, #0x15]
	b _080DCA46
	.align 2, 0
_080DCA34: .4byte 0x08565FCC
_080DCA38: .4byte 0x02039BD4
_080DCA3C:
	ldrb r1, [r3, #0x15]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x15]
_080DCA46:
	ldr r5, _080DCAE4
	ldr r0, [r5]
	ldr r1, [r0, #4]
	subs r0, r7, r6
	lsls r4, r0, #2
	adds r2, r4, r1
	ldrb r1, [r2, #0x15]
	movs r0, #1
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	beq _080DCA6E
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	adds r0, #1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	strb r1, [r2, #0x18]
_080DCA6E:
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r2, r4, r0
	ldrb r1, [r2, #0xc]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _080DCA98
	ldrb r1, [r2, #0x15]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	strh r1, [r0]
_080DCA98:
	ldr r0, [r5]
	ldr r0, [r0, #4]
	adds r0, r4, r0
	ldrh r0, [r0, #6]
	bl Contest_GetMoveExcitement
	ldr r1, [r5]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	adds r0, r4, r0
	ldrb r1, [r0, #0x11]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080DCAC0
	ldr r0, [r2, #0x10]
	mov r1, r8
	strb r1, [r0]
_080DCAC0:
	ldr r1, [r5]
	ldr r3, [r1, #0x10]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	ble _080DCAEC
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	cmp r0, #4
	ble _080DCAE8
	movs r0, #0x3c
	b _080DCAEE
	.align 2, 0
_080DCAE4: .4byte 0x02039BD4
_080DCAE8:
	movs r0, #0xa
	b _080DCAEE
_080DCAEC:
	movs r0, #0
_080DCAEE:
	strb r0, [r3, #2]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	b _080DCB12
_080DCB06:
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080DCB0C:
	adds r2, #1
	cmp r2, #3
	bgt _080DCB1A
_080DCB12:
	cmp r2, r6
	beq _080DCB0C
	cmp r0, #0
	bne _080DCB06
_080DCB1A:
	ldr r0, _080DCB34
	ldr r0, [r0]
	ldr r1, [r0, #4]
	subs r0, r7, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r2, [r0, #0x1b]
_080DCB28:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DCB34: .4byte 0x02039BD4
	thumb_func_end sub_080DC7E4

	thumb_func_start SetContestantEffectStringID
SetContestantEffectStringID: @ 0x080DCB38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DCB50
	ldr r2, [r2]
	ldr r3, [r2, #4]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	strb r1, [r2, #0x13]
	bx lr
	.align 2, 0
_080DCB50: .4byte 0x02039BD4
	thumb_func_end SetContestantEffectStringID

	thumb_func_start SetContestantEffectStringID2
SetContestantEffectStringID2: @ 0x080DCB54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DCB6C
	ldr r2, [r2]
	ldr r3, [r2, #4]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	strb r1, [r2, #0x14]
	bx lr
	.align 2, 0
_080DCB6C: .4byte 0x02039BD4
	thumb_func_end SetContestantEffectStringID2

	thumb_func_start SetStartledString
SetStartledString: @ 0x080DCB70
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r1, #0
	cmp r1, #0x3b
	bls _080DCB8A
	movs r1, #0x35
	bl SetContestantEffectStringID
	b _080DCBBA
_080DCB8A:
	cmp r1, #0x27
	bls _080DCB96
	movs r1, #0x34
	bl SetContestantEffectStringID
	b _080DCBBA
_080DCB96:
	cmp r1, #0x1d
	bls _080DCBA2
	movs r1, #0x33
	bl SetContestantEffectStringID
	b _080DCBBA
_080DCBA2:
	cmp r1, #0x13
	bls _080DCBAE
	movs r1, #0x32
	bl SetContestantEffectStringID
	b _080DCBBA
_080DCBAE:
	cmp r2, #9
	bls _080DCBBA
	adds r0, r3, #0
	movs r1, #0x31
	bl SetContestantEffectStringID
_080DCBBA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetStartledString

	thumb_func_start sub_080DCBC0
sub_080DCBC0: @ 0x080DCBC0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, _080DCC20
	lsls r1, r4, #6
	ldr r2, _080DCC24
	adds r1, r1, r2
	bl StringCopy
	ldr r0, _080DCC28
	ldr r5, _080DCC2C
	ldr r1, [r5]
	ldr r2, [r1, #4]
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r1, [r1, #6]
	lsls r1, r1, #3
	ldr r2, _080DCC30
	adds r1, r1, r2
	bl StringCopy
	ldr r3, _080DCC34
	ldr r1, [r5]
	ldr r0, [r1, #8]
	ldrb r2, [r0, #0x11]
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r1, r0, #0x1d
	cmp r1, #0
	bne _080DCC40
	ldr r0, _080DCC38
	ldr r1, _080DCC3C
	bl StringCopy
	b _080DCC90
	.align 2, 0
_080DCC20: .4byte 0x02021C40
_080DCC24: .4byte 0x02039AA2
_080DCC28: .4byte 0x02021C54
_080DCC2C: .4byte 0x02039BD4
_080DCC30: .4byte 0x082EACC4
_080DCC34: .4byte 0x08565FCC
_080DCC38: .4byte 0x02021C68
_080DCC3C: .4byte 0x0824C0D2
_080DCC40:
	lsrs r0, r1, #0x1d
	cmp r0, #1
	bne _080DCC58
	ldr r0, _080DCC50
	ldr r1, _080DCC54
	bl StringCopy
	b _080DCC90
	.align 2, 0
_080DCC50: .4byte 0x02021C68
_080DCC54: .4byte 0x0824C0D7
_080DCC58:
	lsrs r0, r1, #0x1d
	cmp r0, #2
	bne _080DCC70
	ldr r0, _080DCC68
	ldr r1, _080DCC6C
	bl StringCopy
	b _080DCC90
	.align 2, 0
_080DCC68: .4byte 0x02021C68
_080DCC6C: .4byte 0x0824C0DC
_080DCC70:
	lsrs r0, r1, #0x1d
	cmp r0, #3
	bne _080DCC88
	ldr r0, _080DCC80
	ldr r1, _080DCC84
	bl StringCopy
	b _080DCC90
	.align 2, 0
_080DCC80: .4byte 0x02021C68
_080DCC84: .4byte 0x0824C0E1
_080DCC88:
	ldr r0, _080DCCB4
	ldr r1, _080DCCB8
	bl StringCopy
_080DCC90:
	ldr r4, _080DCCBC
	ldr r1, _080DCCC0
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringExpandPlaceholders
	bl sub_080DB000
	adds r0, r4, #0
	movs r1, #1
	bl Contest_StartTextPrinter
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DCCB4: .4byte 0x02021C68
_080DCCB8: .4byte 0x0824C0E6
_080DCCBC: .4byte 0x02021C7C
_080DCCC0: .4byte 0x08560D74
	thumb_func_end sub_080DCBC0

	thumb_func_start MakeContestantNervous
MakeContestantNervous: @ 0x080DCCC4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080DCCF0
	ldr r1, [r4]
	ldr r3, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r3, r1, r3
	ldrb r0, [r3, #0xc]
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DCCF0: .4byte 0x02039BD4
	thumb_func_end MakeContestantNervous

	thumb_func_start ApplyNextTurnOrder
ApplyNextTurnOrder: @ 0x080DCCF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	mov ip, r0
	movs r4, #0
	ldr r1, _080DCD60
	mov sb, r1
	add r2, sp, #4
	mov r6, sb
	movs r5, #0
	adds r3, r2, #0
_080DCD10:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r4, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, r4
	strb r5, [r0]
	adds r4, #1
	cmp r4, #3
	ble _080DCD10
	movs r4, #0
	ldr r7, _080DCD64
	ldr r1, [r7]
	mov r8, r1
	adds r5, r2, #0
_080DCD2E:
	movs r2, #0
	mov r0, r8
	ldr r1, [r0, #4]
_080DCD34:
	ldrb r0, [r1, #0x19]
	cmp r0, r4
	beq _080DCD68
	adds r1, #0x1c
	adds r2, #1
	cmp r2, #3
	ble _080DCD34
_080DCD42:
	cmp r2, #4
	bne _080DCDE8
	movs r2, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080DCD76
	ldr r0, [r7]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x19]
	cmp r0, #0xff
	bne _080DCD76
	mov ip, r2
	movs r2, #1
	b _080DCD9E
	.align 2, 0
_080DCD60: .4byte 0x02039BC6
_080DCD64: .4byte 0x02039BD4
_080DCD68:
	mov r1, sp
	adds r0, r1, r2
	strb r4, [r0]
	adds r1, r5, r2
	movs r0, #1
	strb r0, [r1]
	b _080DCD42
_080DCD76:
	adds r2, #1
	cmp r2, #3
	bgt _080DCDDA
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080DCD76
	ldr r0, [r7]
	ldr r1, [r0, #4]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x19]
	cmp r0, #0xff
	bne _080DCD76
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	adds r2, #1
_080DCD9E:
	cmp r2, #3
	bgt _080DCDDA
	ldr r6, _080DCE38
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r3, r0, #2
_080DCDAA:
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080DCDD2
	ldr r0, [r7]
	ldr r0, [r0, #4]
	adds r0, r3, r0
	ldrb r0, [r0, #0x19]
	cmp r0, #0xff
	bne _080DCDD2
	mov r1, ip
	adds r0, r1, r6
	adds r1, r2, r6
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080DCDD2
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_080DCDD2:
	adds r3, #0x1c
	adds r2, #1
	cmp r2, #3
	ble _080DCDAA
_080DCDDA:
	mov r0, sp
	add r0, ip
	strb r4, [r0]
	mov r0, ip
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
_080DCDE8:
	adds r4, #1
	cmp r4, #3
	ble _080DCD2E
	movs r4, #0
	ldr r6, _080DCE3C
	movs r5, #0
_080DCDF4:
	ldr r0, [r6]
	ldr r1, [r0, #8]
	adds r1, r1, r4
	mov r0, sp
	adds r3, r0, r4
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r0, [r6]
	ldr r0, [r0, #4]
	adds r0, r5, r0
	movs r1, #0xff
	strb r1, [r0, #0x19]
	ldr r0, [r6]
	ldr r1, [r0, #4]
	adds r1, r5, r1
	ldrb r2, [r1, #0x10]
	movs r0, #0x3f
	ands r0, r2
	strb r0, [r1, #0x10]
	mov r0, sb
	adds r1, r4, r0
	ldrb r0, [r3]
	strb r0, [r1]
	adds r5, #0x1c
	adds r4, #1
	cmp r4, #3
	ble _080DCDF4
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DCE38: .4byte 0x02039BC6
_080DCE3C: .4byte 0x02039BD4
	thumb_func_end ApplyNextTurnOrder

	thumb_func_start sub_080DCE40
sub_080DCE40: @ 0x080DCE40
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	adds r1, r0, #1
	strh r1, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x54
	ble _080DCE76
	movs r0, #0
	strh r0, [r2, #0x30]
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080DCE7C
	str r0, [r2, #0x1c]
	ldr r0, _080DCE80
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r1, [r2, #6]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #6]
_080DCE76:
	pop {r0}
	bx r0
	.align 2, 0
_080DCE7C: .4byte 0x08007141
_080DCE80: .4byte 0x02039BD4
	thumb_func_end sub_080DCE40

	thumb_func_start sub_080DCE84
sub_080DCE84: @ 0x080DCE84
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080DCEA4
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r5, [r0, #0x12]
	cmp r1, #8
	bls _080DCE98
	b _080DD038
_080DCE98:
	lsls r0, r1, #2
	ldr r1, _080DCEA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DCEA4: .4byte 0x02039BD4
_080DCEA8: .4byte 0x080DCEAC
_080DCEAC: @ jump table
	.4byte _080DCED0 @ case 0
	.4byte _080DCED0 @ case 1
	.4byte _080DCF00 @ case 2
	.4byte _080DCF34 @ case 3
	.4byte _080DCF68 @ case 4
	.4byte _080DCF9C @ case 5
	.4byte _080DCFD0 @ case 6
	.4byte _080DD038 @ case 7
	.4byte _080DD004 @ case 8
_080DCED0:
	ldr r0, _080DCEF4
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x2e]
	ldr r2, _080DCEF8
	ands r2, r0
	ldrh r3, [r1, #4]
	ldr r0, _080DCEFC
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, #4]
	movs r0, #0x20
	bl PlaySE
	b _080DD05C
	.align 2, 0
_080DCEF4: .4byte 0x020205AC
_080DCEF8: .4byte 0x000003FF
_080DCEFC: .4byte 0xFFFFFC00
_080DCF00:
	ldr r0, _080DCF28
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r1, #0x2e]
	adds r2, #4
	ldr r3, _080DCF2C
	adds r0, r3, #0
	ands r2, r0
	ldrh r3, [r1, #4]
	ldr r0, _080DCF30
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, #4]
	movs r0, #0x1f
	bl PlaySE
	b _080DD05C
	.align 2, 0
_080DCF28: .4byte 0x020205AC
_080DCF2C: .4byte 0x000003FF
_080DCF30: .4byte 0xFFFFFC00
_080DCF34:
	ldr r0, _080DCF5C
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r1, #0x2e]
	adds r2, #8
	ldr r3, _080DCF60
	adds r0, r3, #0
	ands r2, r0
	ldrh r3, [r1, #4]
	ldr r0, _080DCF64
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, #4]
	movs r0, #0x1f
	bl PlaySE
	b _080DD05C
	.align 2, 0
_080DCF5C: .4byte 0x020205AC
_080DCF60: .4byte 0x000003FF
_080DCF64: .4byte 0xFFFFFC00
_080DCF68:
	ldr r0, _080DCF90
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r1, #0x2e]
	adds r2, #0xc
	ldr r3, _080DCF94
	adds r0, r3, #0
	ands r2, r0
	ldrh r3, [r1, #4]
	ldr r0, _080DCF98
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, #4]
	movs r0, #0x2d
	bl PlaySE
	b _080DD05C
	.align 2, 0
_080DCF90: .4byte 0x020205AC
_080DCF94: .4byte 0x000003FF
_080DCF98: .4byte 0xFFFFFC00
_080DCF9C:
	ldr r0, _080DCFC4
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r1, #0x2e]
	adds r2, #0xc
	ldr r3, _080DCFC8
	adds r0, r3, #0
	ands r2, r0
	ldrh r3, [r1, #4]
	ldr r0, _080DCFCC
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, #4]
	movs r0, #0x2d
	bl PlaySE
	b _080DD05C
	.align 2, 0
_080DCFC4: .4byte 0x020205AC
_080DCFC8: .4byte 0x000003FF
_080DCFCC: .4byte 0xFFFFFC00
_080DCFD0:
	ldr r0, _080DCFF8
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r1, #0x2e]
	adds r2, #0x10
	ldr r3, _080DCFFC
	adds r0, r3, #0
	ands r2, r0
	ldrh r3, [r1, #4]
	ldr r0, _080DD000
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, #4]
	movs r0, #0x2d
	bl PlaySE
	b _080DD05C
	.align 2, 0
_080DCFF8: .4byte 0x020205AC
_080DCFFC: .4byte 0x000003FF
_080DD000: .4byte 0xFFFFFC00
_080DD004:
	ldr r0, _080DD02C
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r1, #0x2e]
	adds r2, #0x18
	ldr r3, _080DD030
	adds r0, r3, #0
	ands r2, r0
	ldrh r3, [r1, #4]
	ldr r0, _080DD034
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, #4]
	movs r0, #0xc3
	bl PlaySE
	b _080DD05C
	.align 2, 0
_080DD02C: .4byte 0x020205AC
_080DD030: .4byte 0x000003FF
_080DD034: .4byte 0xFFFFFC00
_080DD038:
	ldr r0, _080DD090
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r2, [r1, #0x2e]
	adds r2, #0x14
	ldr r3, _080DD094
	adds r0, r3, #0
	ands r2, r0
	ldrh r3, [r1, #4]
	ldr r0, _080DD098
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, #4]
	movs r0, #0x2d
	bl PlaySE
_080DD05C:
	adds r2, r4, #0
	ldr r4, _080DD090
	adds r2, r2, r5
	lsls r2, r2, #2
	adds r1, r2, r4
	movs r0, #0
	strh r0, [r1, #0x30]
	adds r1, #0x3e
	ldrb r3, [r1]
	subs r0, #5
	ands r0, r3
	strb r0, [r1]
	adds r4, #0x1c
	adds r2, r2, r4
	ldr r0, _080DD09C
	str r0, [r2]
	ldr r0, _080DD0A0
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD090: .4byte 0x020205AC
_080DD094: .4byte 0x000003FF
_080DD098: .4byte 0xFFFFFC00
_080DD09C: .4byte 0x080DCE41
_080DD0A0: .4byte 0x02039BD4
	thumb_func_end sub_080DCE84

	thumb_func_start UpdateApplauseMeter
UpdateApplauseMeter: @ 0x080DD0A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r6, _080DD140
	ldr r0, _080DD144
	mov sb, r0
	ldr r0, _080DD148
	mov r8, r0
	ldr r7, _080DD14C
_080DD0BA:
	ldr r0, [r6]
	ldr r1, [r0]
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	ldr r4, _080DD150
	cmp r5, r0
	bge _080DD0CA
	adds r4, #0x40
_080DD0CA:
	adds r0, r1, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldrh r1, [r0, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r0, r5, #0
	adds r0, #0x11
	adds r1, r1, r0
	lsls r1, r1, #5
	add r1, r8
	adds r0, r4, #0
	adds r2, r7, #0
	bl CpuSet
	adds r0, r4, #0
	adds r0, #0x20
	ldr r1, [r6]
	ldr r1, [r1]
	adds r1, #0x58
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, sb
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r2, r5, #0
	adds r2, #0x19
	adds r1, r1, r2
	lsls r1, r1, #5
	add r1, r8
	adds r2, r7, #0
	bl CpuSet
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	ble _080DD12C
	bl StartApplauseOverflowAnimation
_080DD12C:
	adds r5, #1
	cmp r5, #4
	ble _080DD0BA
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD140: .4byte 0x02039BD4
_080DD144: .4byte 0x020205AC
_080DD148: .4byte 0x06010000
_080DD14C: .4byte 0x04000008
_080DD150: .4byte 0x08D8EBD8
	thumb_func_end UpdateApplauseMeter

	thumb_func_start Contest_GetMoveExcitement
Contest_GetMoveExcitement: @ 0x080DD154
	lsls r0, r0, #0x10
	ldr r3, _080DD178
	ldr r1, _080DD17C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	ldr r0, _080DD180
	ldrh r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r1, r1, r0
	adds r1, r1, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_080DD178: .4byte 0x08562970
_080DD17C: .4byte 0x08565FCC
_080DD180: .4byte 0x02039BCC
	thumb_func_end Contest_GetMoveExcitement

	thumb_func_start StartApplauseOverflowAnimation
StartApplauseOverflowAnimation: @ 0x080DD184
	push {r4, r5, lr}
	ldr r0, _080DD1B8
	movs r1, #0xa
	bl CreateTask
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080DD1BC
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r0, #1
	strh r0, [r4, #0xa]
	ldr r0, _080DD1C0
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080DD1B8: .4byte 0x080DD1C5
_080DD1BC: .4byte 0x03005B60
_080DD1C0: .4byte 0x0000ABE2
	thumb_func_end StartApplauseOverflowAnimation

	thumb_func_start Task_ApplauseOverflowAnimation
Task_ApplauseOverflowAnimation: @ 0x080DD1C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080DD1F4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080DD262
	movs r0, #0
	strh r0, [r2, #8]
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _080DD1F8
	ldrh r0, [r2, #0x10]
	adds r0, #1
	b _080DD1FC
	.align 2, 0
_080DD1F4: .4byte 0x03005B60
_080DD1F8:
	ldrh r0, [r2, #0x10]
	subs r0, #1
_080DD1FC:
	strh r0, [r2, #0x10]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r3, #0x84
	lsls r3, r3, #1
	adds r6, r3, #0
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r4, #0x10]
	ldr r3, _080DD268
	movs r1, #1
	bl BlendPalette
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080DD22E
	cmp r0, #0x10
	bne _080DD262
_080DD22E:
	ldrh r0, [r4, #0xe]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0xe]
	ldr r0, _080DD26C
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bgt _080DD262
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	movs r2, #0
	movs r3, #0x1f
	bl BlendPalette
	adds r0, r5, #0
	bl DestroyTask
_080DD262:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DD268: .4byte 0x00007FFF
_080DD26C: .4byte 0x02039BD4
	thumb_func_end Task_ApplauseOverflowAnimation

	thumb_func_start StartMoveApplauseMeterOnscreen
StartMoveApplauseMeterOnscreen: @ 0x080DD270
	push {r4, lr}
	ldr r0, _080DD2C0
	movs r1, #0xa
	bl CreateTask
	ldr r3, _080DD2C4
	ldr r4, _080DD2C8
	ldr r2, [r4]
	ldr r0, [r2]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, _080DD2CC
	strh r1, [r0, #0x24]
	ldr r0, [r2]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD2C0: .4byte 0x080DD2D1
_080DD2C4: .4byte 0x020205AC
_080DD2C8: .4byte 0x02039BD4
_080DD2CC: .4byte 0x0000FFBA
	thumb_func_end StartMoveApplauseMeterOnscreen

	thumb_func_start Task_MoveApplauseMeterOnscreen
Task_MoveApplauseMeterOnscreen: @ 0x080DD2D0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	ldr r4, _080DD340
	ldr r0, [r4]
	ldr r0, [r0]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080DD344
	adds r2, r0, r1
	ldr r0, _080DD348
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r5, #0xd0
	lsls r5, r5, #3
	adds r0, r5, #0
	ldrh r5, [r1, #0x1c]
	adds r0, r0, r5
	strh r0, [r1, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r5, [r2, #0x24]
	adds r0, r0, r5
	strh r0, [r2, #0x24]
	ldrb r0, [r1, #0x1c]
	strh r0, [r1, #0x1c]
	movs r1, #0x24
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _080DD31C
	movs r0, #0
	strh r0, [r2, #0x24]
_080DD31C:
	movs r5, #0x24
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _080DD338
	ldr r0, [r4]
	ldr r2, [r0]
	ldrb r1, [r2, #6]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #6]
	adds r0, r3, #0
	bl DestroyTask
_080DD338:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD340: .4byte 0x02039BD4
_080DD344: .4byte 0x020205AC
_080DD348: .4byte 0x03005B60
	thumb_func_end Task_MoveApplauseMeterOnscreen

	thumb_func_start TryMoveApplauseMeterOffscreen
TryMoveApplauseMeterOffscreen: @ 0x080DD34C
	push {r4, r5, lr}
	ldr r5, _080DD378
	ldr r4, _080DD37C
	ldr r0, [r4]
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _080DD380
	ldrb r1, [r2, #6]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	b _080DD3A4
	.align 2, 0
_080DD378: .4byte 0x020205AC
_080DD37C: .4byte 0x02039BD4
_080DD380:
	ldr r0, _080DD3AC
	movs r1, #0xa
	bl CreateTask
	ldr r2, [r4]
	ldr r0, [r2]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0, #0x24]
	ldr r2, [r2]
	ldrb r0, [r2, #6]
	movs r1, #0x40
	orrs r0, r1
_080DD3A4:
	strb r0, [r2, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD3AC: .4byte 0x080DD3B1
	thumb_func_end TryMoveApplauseMeterOffscreen

	thumb_func_start Task_MoveApplauseMeterOffscreen
Task_MoveApplauseMeterOffscreen: @ 0x080DD3B0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	ldr r5, _080DD430
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080DD434
	adds r3, r0, r1
	ldr r0, _080DD438
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #3
	adds r2, r2, r0
	movs r1, #0xd0
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r1, [r2, #0x1c]
	adds r0, r0, r1
	strh r0, [r2, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r3, #0x24]
	subs r1, r1, r0
	strh r1, [r3, #0x24]
	ldrb r0, [r2, #0x1c]
	strh r0, [r2, #0x1c]
	movs r2, #0x24
	ldrsh r0, [r3, r2]
	movs r1, #0x46
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080DD400
	ldr r0, _080DD43C
	strh r0, [r3, #0x24]
_080DD400:
	movs r2, #0x24
	ldrsh r0, [r3, r2]
	cmp r0, r1
	bne _080DD428
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5]
	ldr r2, [r0]
	ldrb r1, [r2, #6]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #6]
	adds r0, r4, #0
	bl DestroyTask
_080DD428:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD430: .4byte 0x02039BD4
_080DD434: .4byte 0x020205AC
_080DD438: .4byte 0x03005B60
_080DD43C: .4byte 0x0000FFBA
	thumb_func_end Task_MoveApplauseMeterOffscreen

	thumb_func_start ShowAndUpdateApplauseMeter
ShowAndUpdateApplauseMeter: @ 0x080DD440
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080DD478
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DD47C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	strh r4, [r1, #8]
	ldr r0, _080DD480
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD478: .4byte 0x080DD485
_080DD47C: .4byte 0x03005B60
_080DD480: .4byte 0x02039BD4
	thumb_func_end ShowAndUpdateApplauseMeter

	thumb_func_start Task_ShowAndUpdateApplauseMeter
Task_ShowAndUpdateApplauseMeter: @ 0x080DD484
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080DD4A8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080DD4B8
	cmp r0, #1
	bgt _080DD4AC
	cmp r0, #0
	beq _080DD4B2
	b _080DD500
	.align 2, 0
_080DD4A8: .4byte 0x03005B60
_080DD4AC:
	cmp r0, #2
	beq _080DD4D4
	b _080DD500
_080DD4B2:
	bl StartMoveApplauseMeterOnscreen
	b _080DD4C8
_080DD4B8:
	ldr r0, _080DD4D0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080DD500
_080DD4C8:
	ldrh r0, [r4, #0x1c]
	adds r0, #1
	strh r0, [r4, #0x1c]
	b _080DD500
	.align 2, 0
_080DD4D0: .4byte 0x02039BD4
_080DD4D4:
	ldrh r0, [r4, #0x1e]
	adds r1, r0, #1
	strh r1, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _080DD500
	movs r0, #0
	strh r0, [r4, #0x1e]
	bl UpdateApplauseMeter
	ldr r0, _080DD508
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r1, [r2, #6]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #6]
	adds r0, r5, #0
	bl DestroyTask
_080DD500:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD508: .4byte 0x02039BD4
	thumb_func_end Task_ShowAndUpdateApplauseMeter

	thumb_func_start HideApplauseMeterNoAnim
HideApplauseMeterNoAnim: @ 0x080DD50C
	ldr r3, _080DD540
	ldr r0, _080DD544
	ldr r2, [r0]
	ldr r0, [r2]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x24]
	ldr r0, [r2]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080DD540: .4byte 0x020205AC
_080DD544: .4byte 0x02039BD4
	thumb_func_end HideApplauseMeterNoAnim

	thumb_func_start ShowApplauseMeterNoAnim
ShowApplauseMeterNoAnim: @ 0x080DD548
	ldr r2, _080DD568
	ldr r0, _080DD56C
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080DD568: .4byte 0x020205AC
_080DD56C: .4byte 0x02039BD4
	thumb_func_end ShowApplauseMeterNoAnim

	thumb_func_start sub_080DD570
sub_080DD570: @ 0x080DD570
	push {lr}
	ldr r0, _080DD58C
	movs r1, #0xf
	bl CreateTask
	ldr r0, _080DD590
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #6]
	pop {r0}
	bx r0
	.align 2, 0
_080DD58C: .4byte 0x080DD595
_080DD590: .4byte 0x02039BD4
	thumb_func_end sub_080DD570

	thumb_func_start sub_080DD594
sub_080DD594: @ 0x080DD594
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080DD5D0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x1c]
	adds r1, r0, #1
	strh r1, [r4, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _080DD61E
	movs r0, #0
	strh r0, [r4, #0x1c]
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080DD5DC
	ldr r0, _080DD5D4
	ldr r1, _080DD5D8
	movs r2, #0x80
	lsls r2, r2, #5
	movs r3, #1
	bl RequestDma3Copy
	b _080DD5F0
	.align 2, 0
_080DD5D0: .4byte 0x03005B60
_080DD5D4: .4byte 0x02019000
_080DD5D8: .4byte 0x06002000
_080DD5DC:
	ldr r0, _080DD624
	ldr r1, _080DD628
	movs r2, #0x80
	lsls r2, r2, #5
	movs r3, #1
	bl RequestDma3Copy
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
_080DD5F0:
	ldr r1, _080DD62C
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x1e]
	movs r2, #1
	eors r1, r2
	strh r1, [r0, #0x1e]
	movs r1, #0x20
	ldrsh r0, [r0, r1]
	cmp r0, #9
	bne _080DD61E
	ldr r0, _080DD630
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r1, [r2, #6]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #6]
	adds r0, r5, #0
	bl DestroyTask
_080DD61E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD624: .4byte 0x02018000
_080DD628: .4byte 0x06002000
_080DD62C: .4byte 0x03005B60
_080DD630: .4byte 0x02039BD4
	thumb_func_end sub_080DD594

	thumb_func_start sub_080DD634
sub_080DD634: @ 0x080DD634
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080DD674
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r4, r4, #0x18
	cmp r4, #0
	ble _080DD69C
	ldr r7, _080DD678
	lsls r0, r5, #0x18
	adds r4, r0, #0
	cmp r4, #0
	ble _080DD680
	movs r5, #0
	ldr r2, _080DD67C
	ldr r0, [r2]
	ldr r0, [r0]
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _080DD6B2
	.align 2, 0
_080DD674: .4byte 0x080DD6E5
_080DD678: .4byte 0x0000237E
_080DD67C: .4byte 0x02039BD4
_080DD680:
	ldr r2, _080DD698
	ldr r0, [r2]
	ldr r0, [r0]
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r3, #0
	b _080DD6B2
	.align 2, 0
_080DD698: .4byte 0x02039BD4
_080DD69C:
	movs r7, #0
	lsls r0, r5, #0x18
	adds r4, r0, #0
	cmp r4, #0
	ble _080DD6AC
	movs r5, #0
	movs r3, #0xc
	b _080DD6B0
_080DD6AC:
	movs r5, #0xc
	movs r3, #0
_080DD6B0:
	ldr r2, _080DD6DC
_080DD6B2:
	ldr r1, _080DD6E0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r7, [r0, #8]
	strh r5, [r0, #0xa]
	asrs r1, r4, #0x18
	strh r1, [r0, #0xc]
	strh r3, [r0, #0xe]
	ldr r0, [r2]
	ldr r2, [r0]
	ldrb r1, [r2, #7]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #7]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD6DC: .4byte 0x02039BD4
_080DD6E0: .4byte 0x03005B60
	thumb_func_end sub_080DD634

	thumb_func_start sub_080DD6E4
sub_080DD6E4: @ 0x080DD6E4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _080DD714
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrh r0, [r3, #0x1c]
	adds r1, r0, #1
	strh r1, [r3, #0x1c]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080DD760
	movs r0, #0
	strh r0, [r3, #0x1c]
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	cmp r0, #0
	ble _080DD718
	ldrh r0, [r3, #0xa]
	adds r0, #1
	b _080DD71C
	.align 2, 0
_080DD714: .4byte 0x03005B60
_080DD718:
	ldrh r0, [r3, #0xa]
	subs r0, #1
_080DD71C:
	strh r0, [r3, #0xa]
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r2
	ldrb r2, [r4, #0xa]
	ldrh r3, [r4, #8]
	movs r0, #0x11
	movs r1, #1
	bl BlendPalette
	ldrb r2, [r4, #0xa]
	ldrh r3, [r4, #8]
	movs r0, #0x1a
	movs r1, #1
	bl BlendPalette
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080DD760
	adds r0, r5, #0
	bl DestroyTask
	ldr r0, _080DD768
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r1, [r2, #7]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #7]
_080DD760:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD768: .4byte 0x02039BD4
	thumb_func_end sub_080DD6E4

	thumb_func_start sub_080DD76C
sub_080DD76C: @ 0x080DD76C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r5, #0
	ldr r0, _080DD808
	mov sb, r0
	mov r8, sb
	ldr r6, _080DD80C
	movs r4, #0
	movs r7, #0
_080DD78A:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #4]
	adds r0, r7, r0
	ldrb r1, [r0, #0x10]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080DD820
	mov r2, sl
	cmp r2, #0
	beq _080DD820
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetTurnOrderNumberGfx
	mov r3, r8
	ldr r1, [r3]
	ldr r1, [r1, #0x14]
	adds r1, r4, r1
	ldrb r2, [r1, #1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r2, _080DD810
	adds r1, r1, r2
	ldr r2, _080DD814
	bl CpuSet
	mov r0, r8
	ldr r3, [r0]
	ldr r0, [r3, #0x14]
	adds r0, r4, r0
	ldrb r0, [r0, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldr r2, _080DD818
	ldr r0, _080DD81C
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x22]
	ldr r0, [r3, #0x14]
	adds r0, r4, r0
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r3, #5
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	b _080DD83A
	.align 2, 0
_080DD808: .4byte 0x02039BD4
_080DD80C: .4byte 0x020205AC
_080DD810: .4byte 0x06010040
_080DD814: .4byte 0x04000008
_080DD818: .4byte 0x085609D4
_080DD81C: .4byte 0x02039BC6
_080DD820:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0, #0x14]
	adds r0, r4, r0
	ldrb r1, [r0, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
_080DD83A:
	strb r1, [r0]
	adds r4, #4
	adds r7, #0x1c
	adds r5, #1
	cmp r5, #3
	ble _080DD78A
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080DD76C

	thumb_func_start GetTurnOrderNumberGfx
GetTurnOrderNumberGfx: @ 0x080DD854
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080DD87C
	ldr r1, [r1]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r2
	ldrb r1, [r2, #0x10]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne _080DD884
	ldrb r0, [r2, #0x19]
	lsls r0, r0, #5
	ldr r1, _080DD880
	adds r0, r0, r1
	b _080DD886
	.align 2, 0
_080DD87C: .4byte 0x02039BD4
_080DD880: .4byte 0x08D8E97C
_080DD884:
	ldr r0, _080DD88C
_080DD886:
	pop {r1}
	bx r1
	.align 2, 0
_080DD88C: .4byte 0x08D8E9FC
	thumb_func_end GetTurnOrderNumberGfx

	thumb_func_start sub_080DD890
sub_080DD890: @ 0x080DD890
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r7, #0
	movs r0, #2
	mov sl, r0
	movs r0, #1
	mov r8, r0
	movs r0, #0x11
	mov sb, r0
_080DD8AA:
	ldr r0, _080DD944
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, #0xd
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080DD92E
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl Contest_IsMonsTurnDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080DD92E
	ldr r0, _080DD948
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r5, r0, #2
	adds r5, r5, r0
	adds r6, r5, #2
	movs r0, #3
	bl sub_080DAEAC
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, sl
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x14
	adds r3, r6, #0
	bl ContestBG_FillBoxWithIncrementingTile
	adds r4, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r5, #3
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, sl
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x14
	adds r3, r5, #0
	bl ContestBG_FillBoxWithIncrementingTile
	movs r0, #0x63
	bl PlaySE
_080DD92E:
	adds r7, #1
	cmp r7, #3
	ble _080DD8AA
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD944: .4byte 0x02039BD4
_080DD948: .4byte 0x02039BC6
	thumb_func_end sub_080DD890

	thumb_func_start sub_080DD94C
sub_080DD94C: @ 0x080DD94C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080DD97C
	ldr r1, [r1]
	ldr r2, [r1, #4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r2, r1, r2
	ldrb r1, [r2, #0x15]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080DD976
	ldrb r1, [r2, #0xc]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080DD980
_080DD976:
	movs r0, #0
	b _080DD982
	.align 2, 0
_080DD97C: .4byte 0x02039BD4
_080DD980:
	movs r0, #1
_080DD982:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080DD94C

	thumb_func_start sub_080DD988
sub_080DD988: @ 0x080DD988
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r0, #0xa
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	mov r2, sp
	ldrb r1, [r2]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #0xa
	bl SetGpuReg
	movs r0, #8
	bl GetGpuReg
	mov r6, sp
	adds r6, #2
	strh r0, [r6]
	movs r0, #0xc
	bl GetGpuReg
	add r5, sp, #4
	strh r0, [r5]
	ldrb r1, [r6]
	adds r0, r4, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	ands r4, r0
	orrs r4, r1
	strb r4, [r5]
	ldrh r1, [r6]
	movs r0, #8
	bl SetGpuReg
	ldrh r1, [r5]
	movs r0, #0xc
	bl SetGpuReg
	ldr r1, _080DDA9C
	movs r0, #0xf0
	strh r0, [r1]
	ldr r4, _080DDAA0
	movs r0, #0xa0
	strh r0, [r4]
	movs r0, #0x14
	movs r1, #0xf0
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x16
	bl SetGpuReg
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r4, _080DDAA4
	ldr r1, [r4]
	ldr r1, [r1, #0x28]
	ldr r2, _080DDAA8
	bl CpuSet
	ldr r1, _080DDAAC
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #1
	bl Contest_SetBgCopyFlags
	movs r5, #0
	ldr r7, _080DDAB0
	movs r6, #4
_080DDA54:
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	lsls r3, r5, #2
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #5]
	mov r0, r8
	ands r0, r2
	orrs r0, r6
	strb r0, [r1, #5]
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	adds r3, r3, r0
	ldrb r0, [r3, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #5]
	mov r0, r8
	ands r0, r2
	orrs r0, r6
	strb r0, [r1, #5]
	adds r5, #1
	cmp r5, #3
	ble _080DDA54
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DDA9C: .4byte 0x02022ACC
_080DDAA0: .4byte 0x02022ACE
_080DDAA4: .4byte 0x02039BD4
_080DDAA8: .4byte 0x05000400
_080DDAAC: .4byte 0x08C17988
_080DDAB0: .4byte 0x020205AC
	thumb_func_end sub_080DD988

	thumb_func_start sub_080DDAB4
sub_080DDAB4: @ 0x080DDAB4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _080DDB70
	movs r2, #0x80
	lsls r2, r2, #6
	movs r0, #0
	movs r3, #1
	bl RequestDma3Fill
	movs r5, #0
	str r5, [sp]
	ldr r6, _080DDB74
	ldr r0, [r6]
	ldr r1, [r0, #0x28]
	ldr r2, _080DDB78
	mov r0, sp
	bl CpuSet
	movs r0, #1
	bl Contest_SetBgCopyFlags
	movs r0, #0xa
	bl GetGpuReg
	add r3, sp, #4
	strh r0, [r3]
	ldrb r1, [r3]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3]
	mov r1, sp
	adds r1, #5
	ldrb r2, [r1]
	movs r0, #0x3f
	ands r0, r2
	strb r0, [r1]
	ldrb r2, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r3]
	movs r4, #0xd
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	movs r0, #0xa
	bl SetGpuReg
	ldr r0, _080DDB7C
	strh r5, [r0]
	ldr r0, _080DDB80
	strh r5, [r0]
	ldr r7, _080DDB84
_080DDB2E:
	ldr r0, [r6]
	ldr r0, [r0, #0x14]
	lsls r3, r5, #2
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #5]
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1, #5]
	ldr r0, [r6]
	ldr r0, [r0, #0x14]
	adds r3, r3, r0
	ldrb r0, [r3, #1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r1, #5]
	adds r0, r4, #0
	ands r0, r2
	strb r0, [r1, #5]
	adds r5, #1
	cmp r5, #3
	ble _080DDB2E
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DDB70: .4byte 0x06008000
_080DDB74: .4byte 0x02039BD4
_080DDB78: .4byte 0x05000400
_080DDB7C: .4byte 0x02022ACC
_080DDB80: .4byte 0x02022ACE
_080DDB84: .4byte 0x020205AC
	thumb_func_end sub_080DDAB4

	thumb_func_start sub_080DDB88
sub_080DDB88: @ 0x080DDB88
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _080DDBB8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080DDBBC
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0x62
	movs r1, #0
	bl PlaySE12WithPanning
	ldr r1, _080DDBC0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080DDBC4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDBB8: .4byte 0x02022ACC
_080DDBBC: .4byte 0x02022ACE
_080DDBC0: .4byte 0x03005B60
_080DDBC4: .4byte 0x080DDBC9
	thumb_func_end sub_080DDB88

	thumb_func_start sub_080DDBC8
sub_080DDBC8: @ 0x080DDBC8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _080DDC00
	ldrh r0, [r1]
	subs r0, #7
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080DDBE0
	movs r0, #0
	strh r0, [r1]
_080DDBE0:
	ldrh r2, [r1]
	cmp r2, #0
	bne _080DDBFA
	ldr r0, _080DDC04
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	strh r2, [r1, #8]
	strh r2, [r1, #0xa]
	strh r2, [r1, #0xc]
	ldr r0, _080DDC08
	str r0, [r1]
_080DDBFA:
	pop {r0}
	bx r0
	.align 2, 0
_080DDC00: .4byte 0x02022ACE
_080DDC04: .4byte 0x03005B60
_080DDC08: .4byte 0x080DDC0D
	thumb_func_end sub_080DDBC8

	thumb_func_start sub_080DDC0C
sub_080DDC0C: @ 0x080DDC0C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080DDC30
	lsls r3, r4, #2
	adds r0, r3, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r0, #8
	ldrsh r1, [r5, r0]
	cmp r1, #1
	beq _080DDC90
	cmp r1, #1
	bgt _080DDC34
	cmp r1, #0
	beq _080DDC3E
	b _080DDD18
	.align 2, 0
_080DDC30: .4byte 0x03005B60
_080DDC34:
	cmp r1, #2
	beq _080DDCEE
	cmp r1, #3
	beq _080DDD08
	b _080DDD18
_080DDC3E:
	movs r2, #0
	adds r6, r3, #0
	ldr r5, _080DDC84
	ldr r3, _080DDC88
_080DDC46:
	ldr r0, [r5]
	ldr r1, [r0]
	adds r1, #0x14
	adds r1, r1, r2
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, #1
	cmp r2, #3
	ble _080DDC46
	bl FillContestantWindowBgs
	bl sub_080DBFC8
	bl sub_080DAE00
	bl DrawContestantWindows
	movs r0, #1
	bl sub_080DD76C
	bl sub_080DBBB0
	ldr r0, _080DDC8C
	adds r1, r6, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #8]
	b _080DDD18
	.align 2, 0
_080DDC84: .4byte 0x02039BD4
_080DDC88: .4byte 0x02039BC6
_080DDC8C: .4byte 0x03005B60
_080DDC90:
	ldr r0, _080DDCD8
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080DDCE8
	ldr r0, _080DDCDC
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r0, [r2, #7]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #7]
	bl sub_080DA094
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080DDCB6
	bl sub_080DB204
_080DDCB6:
	ldr r4, _080DDCE0
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DDCE4
	adds r1, r4, #0
	bl SetTaskFuncWithFollowupFunc
	bl ContestPrintLinkStandby
	movs r0, #2
	strh r0, [r5, #8]
	b _080DDD18
	.align 2, 0
_080DDCD8: .4byte 0x02039BCA
_080DDCDC: .4byte 0x02039BD4
_080DDCE0: .4byte 0x080FD4DD
_080DDCE4: .4byte 0x080D9901
_080DDCE8:
	bl sub_080DB204
	b _080DDCFE
_080DDCEE:
	ldr r0, _080DDD04
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080DDD18
_080DDCFE:
	movs r0, #3
	strh r0, [r5, #8]
	b _080DDD18
	.align 2, 0
_080DDD04: .4byte 0x02039BD4
_080DDD08:
	bl sub_080DAFE8
	bl SwapMoveDescAndContestTilemaps
	movs r0, #0
	strh r0, [r5, #8]
	ldr r0, _080DDD20
	str r0, [r5]
_080DDD18:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDD20: .4byte 0x080DDD59
	thumb_func_end sub_080DDC0C

	thumb_func_start sub_080DDD24
sub_080DDD24: @ 0x080DDD24
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080DDD4C
	ldrh r0, [r1]
	adds r0, #7
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _080DDD48
	ldr r0, _080DDD50
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080DDD54
	str r0, [r1]
_080DDD48:
	pop {r0}
	bx r0
	.align 2, 0
_080DDD4C: .4byte 0x02022ACE
_080DDD50: .4byte 0x03005B60
_080DDD54: .4byte 0x080D9CE5
	thumb_func_end sub_080DDD24

	thumb_func_start sub_080DDD58
sub_080DDD58: @ 0x080DDD58
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DDD78
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #9
	bgt _080DDD7C
	adds r0, r2, #1
	strh r0, [r1, #0xc]
	b _080DDDB8
	.align 2, 0
_080DDD78: .4byte 0x03005B60
_080DDD7C:
	ldrh r3, [r1, #0xa]
	movs r4, #0xa
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _080DDD9A
	ldrh r2, [r1, #8]
	movs r4, #8
	ldrsh r0, [r1, r4]
	cmp r0, #0x10
	bne _080DDD96
	adds r0, r3, #1
	strh r0, [r1, #0xa]
	b _080DDDB8
_080DDD96:
	adds r0, r2, #1
	b _080DDDB6
_080DDD9A:
	ldrh r0, [r1, #8]
	movs r3, #8
	ldrsh r2, [r1, r3]
	cmp r2, #0
	bne _080DDDB4
	strh r2, [r1, #0xa]
	strh r2, [r1, #0xc]
	ldr r0, _080DDDB0
	str r0, [r1]
	b _080DDDB8
	.align 2, 0
_080DDDB0: .4byte 0x080DDDC1
_080DDDB4:
	subs r0, #1
_080DDDB6:
	strh r0, [r1, #8]
_080DDDB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080DDD58

	thumb_func_start sub_080DDDC0
sub_080DDDC0: @ 0x080DDDC0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DDDE0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #9
	bgt _080DDDE4
	adds r0, r1, #1
	strh r0, [r4, #0xc]
	b _080DDDF4
	.align 2, 0
_080DDDE0: .4byte 0x03005B60
_080DDDE4:
	movs r0, #0
	strh r0, [r4, #0xc]
	movs r0, #0x61
	movs r1, #0
	bl PlaySE12WithPanning
	ldr r0, _080DDDFC
	str r0, [r4]
_080DDDF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDDFC: .4byte 0x080DDD25
	thumb_func_end sub_080DDDC0

	thumb_func_start sub_080DDE00
sub_080DDE00: @ 0x080DDE00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r7, #0
	ldr r6, _080DDEE8
	ldr r5, _080DDEEC
_080DDE12:
	bl AllocOamMatrix
	ldr r1, [r5]
	ldr r1, [r1, #0x14]
	lsls r4, r7, #2
	adds r1, r4, r1
	ldrb r1, [r1]
	lsls r3, r1, #4
	adds r3, r3, r1
	lsls r3, r3, #2
	adds r3, r3, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #1
	ldrb r1, [r3, #3]
	movs r2, #0x3f
	rsbs r2, r2, #0
	mov ip, r2
	mov r2, ip
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r2, [r0, #1]
	movs r3, #4
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r2, r1
	movs r1, #1
	orrs r2, r1
	strb r2, [r0, #1]
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, r8
	bl StartSpriteAffineAnim
	mov r0, r8
	cmp r0, #2
	bne _080DDEB0
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl AnimateSprite
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r3, #5
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	strb r1, [r0]
_080DDEB0:
	adds r7, #1
	cmp r7, #3
	ble _080DDE12
	ldr r0, _080DDEF0
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080DDEF4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	mov r0, r8
	strh r0, [r1, #8]
	ldr r0, _080DDEEC
	ldr r0, [r0]
	ldr r2, [r0]
	ldrb r0, [r2, #7]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DDEE8: .4byte 0x020205AC
_080DDEEC: .4byte 0x02039BD4
_080DDEF0: .4byte 0x080DDEF9
_080DDEF4: .4byte 0x03005B60
	thumb_func_end sub_080DDE00

	thumb_func_start sub_080DDEF8
sub_080DDEF8: @ 0x080DDEF8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _080DDF8C
	ldr r3, _080DDF90
	ldr r0, [r3]
	ldr r0, [r0, #0x14]
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _080DDF86
	ldr r0, _080DDF94
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #8]
	cmp r0, #1
	bne _080DDF50
	movs r4, #0
	adds r5, r2, #0
	movs r2, #4
_080DDF30:
	ldr r0, [r3]
	ldr r1, [r0, #0x14]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r4, #1
	cmp r4, #3
	ble _080DDF30
_080DDF50:
	movs r4, #0
_080DDF52:
	ldr r5, _080DDF90
	ldr r0, [r5]
	ldr r1, [r0, #0x14]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080DDF8C
	adds r0, r0, r1
	bl FreeSpriteOamMatrix
	adds r4, #1
	cmp r4, #3
	ble _080DDF52
	ldr r0, [r5]
	ldr r2, [r0]
	ldrb r1, [r2, #7]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #7]
	adds r0, r6, #0
	bl DestroyTask
_080DDF86:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDF8C: .4byte 0x020205AC
_080DDF90: .4byte 0x02039BD4
_080DDF94: .4byte 0x03005B60
	thumb_func_end sub_080DDEF8

	thumb_func_start SanitizeMove
SanitizeMove: @ 0x080DDF98
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xb1
	lsls r0, r0, #1
	cmp r1, r0
	bls _080DDFA8
	movs r1, #1
_080DDFA8:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end SanitizeMove

	thumb_func_start SanitizeSpecies
SanitizeSpecies: @ 0x080DDFB0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080DDFC4
	cmp r1, r0
	bls _080DDFBE
	movs r1, #0
_080DDFBE:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080DDFC4: .4byte 0x0000019B
	thumb_func_end SanitizeSpecies

	thumb_func_start sub_080DDFC8
sub_080DDFC8: @ 0x080DDFC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _080DE02C
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	bl SanitizeMove
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _080DE030
	lsls r0, r7, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	bl SanitizeSpecies
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	movs r1, #0
	movs r2, #0x14
	bl memset
	bl ClearBattleAnimationVars
	ldr r1, _080DE034
	movs r2, #0
	adds r0, r1, #3
_080DE00C:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080DE00C
	cmp r5, #0x90
	beq _080DE084
	cmp r5, #0x90
	bgt _080DE042
	cmp r5, #0x4c
	beq _080DE0DC
	cmp r5, #0x4c
	bgt _080DE038
	cmp r5, #0xd
	beq _080DE0DC
	b _080DE106
	.align 2, 0
_080DE02C: .4byte 0x02039BD4
_080DE030: .4byte 0x02039AA0
_080DE034: .4byte 0x02024188
_080DE038:
	cmp r5, #0x82
	beq _080DE0DC
	cmp r5, #0x8f
	beq _080DE0DC
	b _080DE106
_080DE042:
	cmp r5, #0xd8
	beq _080DE0C4
	cmp r5, #0xd8
	bgt _080DE050
	cmp r5, #0xae
	beq _080DE05E
	b _080DE106
_080DE050:
	cmp r5, #0xda
	beq _080DE0D0
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r5, r0
	beq _080DE084
	b _080DE106
_080DE05E:
	ldr r0, _080DE07C
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #6]
	cmp r0, #7
	beq _080DE074
	ldrb r0, [r1, #7]
	cmp r0, #7
	bne _080DE100
_080DE074:
	ldr r1, _080DE080
	movs r0, #0
	b _080DE104
	.align 2, 0
_080DE07C: .4byte 0x082F0D54
_080DE080: .4byte 0x020380D2
_080DE084:
	ldr r6, _080DE0BC
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0, #0x1b]
	ldr r5, _080DE0C0
	lsls r4, r4, #6
	adds r0, r4, r5
	ldrh r0, [r0]
	bl SanitizeSpecies
	ldr r2, [r6]
	ldr r1, [r2, #0x18]
	strh r0, [r1, #2]
	ldr r2, [r2, #0x18]
	adds r5, #0x38
	adds r4, r4, r5
	ldr r0, [r4]
	str r0, [r2, #0x10]
	ldrb r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #4]
	b _080DE106
	.align 2, 0
_080DE0BC: .4byte 0x02039BD4
_080DE0C0: .4byte 0x02039AA0
_080DE0C4:
	ldr r1, _080DE0CC
	movs r0, #0xff
	b _080DE104
	.align 2, 0
_080DE0CC: .4byte 0x020380BA
_080DE0D0:
	ldr r1, _080DE0D8
	movs r0, #0
	b _080DE104
	.align 2, 0
_080DE0D8: .4byte 0x020380BA
_080DE0DC:
	ldr r0, _080DE0F8
	ldr r0, [r0]
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x5a
	ldrb r1, [r2]
	cmp r1, #0
	bne _080DE100
	movs r0, #2
	strb r0, [r2]
	ldr r0, _080DE0FC
	strb r1, [r0]
	b _080DE106
	.align 2, 0
_080DE0F8: .4byte 0x02039BD4
_080DE0FC: .4byte 0x020380D2
_080DE100:
	ldr r1, _080DE110
	movs r0, #1
_080DE104:
	strb r0, [r1]
_080DE106:
	bl sub_080DE1C0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DE110: .4byte 0x020380D2
	thumb_func_end sub_080DDFC8

	thumb_func_start sub_080DE114
sub_080DE114: @ 0x080DE114
	push {r4, lr}
	ldr r4, _080DE13C
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	movs r1, #0
	movs r2, #0x14
	bl memset
	ldr r0, [r4]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x5a
	ldrb r0, [r1]
	cmp r0, #0
	beq _080DE136
	subs r0, #1
	strb r0, [r1]
_080DE136:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE13C: .4byte 0x02039BD4
	thumb_func_end sub_080DE114

	thumb_func_start sub_080DE140
sub_080DE140: @ 0x080DE140
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _080DE17C
	ldr r0, [r6]
	ldr r0, [r0, #0x18]
	strb r4, [r0, #5]
	ldr r5, _080DE180
	lsls r4, r4, #6
	adds r0, r4, r5
	ldrh r0, [r0]
	bl SanitizeSpecies
	ldr r2, [r6]
	ldr r1, [r2, #0x18]
	strh r0, [r1]
	ldr r1, [r2, #0x18]
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r1, #8]
	adds r5, #0x3c
	adds r4, r4, r5
	ldr r0, [r4]
	str r0, [r1, #0xc]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DE17C: .4byte 0x02039BD4
_080DE180: .4byte 0x02039AA0
	thumb_func_end sub_080DE140

	thumb_func_start sub_080DE184
sub_080DE184: @ 0x080DE184
	push {lr}
	ldr r0, _080DE1B0
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _080DE1B4
	strb r0, [r1, #3]
	ldr r0, _080DE1B8
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080DE1BC
	adds r0, r0, r1
	bl InitSpriteAffineAnim
	bl sub_080DE1C0
	pop {r0}
	bx r0
	.align 2, 0
_080DE1B0: .4byte 0x08007141
_080DE1B4: .4byte 0x02023E88
_080DE1B8: .4byte 0x02023EB0
_080DE1BC: .4byte 0x020205AC
	thumb_func_end sub_080DE184

	thumb_func_start sub_080DE1C0
sub_080DE1C0: @ 0x080DE1C0
	push {r4, lr}
	ldr r0, _080DE204
	ldrb r0, [r0, #3]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080DE208
	adds r4, r4, r0
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r0, #3
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x20]
	movs r0, #3
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x22]
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE204: .4byte 0x02023E88
_080DE208: .4byte 0x020205AC
	thumb_func_end sub_080DE1C0

	thumb_func_start SelectContestMoveBankTarget
SelectContestMoveBankTarget: @ 0x080DE20C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080DE22C
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #6]
	cmp r0, #0x20
	bhi _080DE2C4
	lsls r0, r0, #2
	ldr r1, _080DE230
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DE22C: .4byte 0x082ED220
_080DE230: .4byte 0x080DE234
_080DE234: @ jump table
	.4byte _080DE2C4 @ case 0
	.4byte _080DE2C4 @ case 1
	.4byte _080DE2B8 @ case 2
	.4byte _080DE2C4 @ case 3
	.4byte _080DE2C4 @ case 4
	.4byte _080DE2C4 @ case 5
	.4byte _080DE2C4 @ case 6
	.4byte _080DE2C4 @ case 7
	.4byte _080DE2C4 @ case 8
	.4byte _080DE2C4 @ case 9
	.4byte _080DE2C4 @ case 10
	.4byte _080DE2C4 @ case 11
	.4byte _080DE2C4 @ case 12
	.4byte _080DE2C4 @ case 13
	.4byte _080DE2C4 @ case 14
	.4byte _080DE2C4 @ case 15
	.4byte _080DE2B8 @ case 16
	.4byte _080DE2C4 @ case 17
	.4byte _080DE2C4 @ case 18
	.4byte _080DE2C4 @ case 19
	.4byte _080DE2C4 @ case 20
	.4byte _080DE2C4 @ case 21
	.4byte _080DE2C4 @ case 22
	.4byte _080DE2C4 @ case 23
	.4byte _080DE2C4 @ case 24
	.4byte _080DE2C4 @ case 25
	.4byte _080DE2C4 @ case 26
	.4byte _080DE2C4 @ case 27
	.4byte _080DE2C4 @ case 28
	.4byte _080DE2C4 @ case 29
	.4byte _080DE2C4 @ case 30
	.4byte _080DE2C4 @ case 31
	.4byte _080DE2C4 @ case 32
_080DE2B8:
	ldr r1, _080DE2C0
	movs r0, #2
	b _080DE2C8
	.align 2, 0
_080DE2C0: .4byte 0x02023EB0
_080DE2C4:
	ldr r1, _080DE2D0
	movs r0, #3
_080DE2C8:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080DE2D0: .4byte 0x02023EB0
	thumb_func_end SelectContestMoveBankTarget

	thumb_func_start Contest_PrintTextToBg0WindowStd
Contest_PrintTextToBg0WindowStd: @ 0x080DE2D4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	str r1, [sp]
	mov r0, sp
	movs r2, #0
	strb r4, [r0, #4]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #5]
	mov r0, sp
	strb r2, [r0, #6]
	movs r1, #2
	strb r1, [r0, #7]
	strb r2, [r0, #8]
	strb r1, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	mov r3, sp
	ldrb r2, [r3, #0xc]
	subs r1, #0x12
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	mov r2, sp
	movs r0, #0xf0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	ands r1, r0
	strb r1, [r2, #0xd]
	mov r1, sp
	movs r0, #0x80
	strb r0, [r1, #0xd]
	mov r0, sp
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	movs r0, #0
	bl Contest_SetBgCopyFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Contest_PrintTextToBg0WindowStd

	thumb_func_start Contest_StartTextPrinter
Contest_StartTextPrinter: @ 0x080DE338
	push {r4, r5, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r2, sp
	movs r3, #0
	movs r0, #8
	strb r0, [r2, #4]
	mov r0, sp
	movs r5, #1
	strb r5, [r0, #5]
	strb r3, [r0, #6]
	movs r2, #2
	strb r2, [r0, #7]
	strb r3, [r0, #8]
	strb r2, [r0, #9]
	strb r3, [r0, #0xa]
	strb r3, [r0, #0xb]
	mov r4, sp
	ldrb r3, [r4, #0xc]
	subs r2, #0x12
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r4, #0xc]
	mov r3, sp
	movs r0, #0x10
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0xd]
	ands r2, r0
	strb r2, [r3, #0xd]
	mov r2, sp
	movs r0, #0x80
	strb r0, [r2, #0xd]
	cmp r1, #0
	bne _080DE388
	mov r0, sp
	movs r1, #0
	movs r2, #0
	bl AddTextPrinter
	b _080DE3AC
_080DE388:
	ldr r0, _080DE398
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080DE39C
	movs r1, #4
	b _080DE3A4
	.align 2, 0
_080DE398: .4byte 0x02039BCA
_080DE39C:
	bl GetPlayerTextSpeedDelay
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080DE3A4:
	mov r0, sp
	movs r2, #0
	bl AddTextPrinter
_080DE3AC:
	movs r0, #8
	bl PutWindowTilemap
	movs r0, #0
	bl Contest_SetBgCopyFlags
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Contest_StartTextPrinter

	thumb_func_start ContestBG_FillBoxWithIncrementingTile
ContestBG_FillBoxWithIncrementingTile: @ 0x080DE3C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	mov r8, r0
	ldr r0, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	mov r7, r8
	lsls r7, r7, #0x18
	lsrs r7, r7, #0x18
	mov r8, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0xc]
	mov r0, r8
	bl WriteSequenceToBgTilemapBuffer
	mov r0, r8
	bl Contest_SetBgCopyFlags
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ContestBG_FillBoxWithIncrementingTile

	thumb_func_start ContestBG_FillBoxWithTile
ContestBG_FillBoxWithTile: @ 0x080DE418
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	bl ContestBG_FillBoxWithIncrementingTile
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ContestBG_FillBoxWithTile

	thumb_func_start Contest_RunTextPrinters
Contest_RunTextPrinters: @ 0x080DE454
	push {lr}
	bl RunTextPrinters
	movs r0, #8
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end Contest_RunTextPrinters

	thumb_func_start Contest_SetBgCopyFlags
Contest_SetBgCopyFlags: @ 0x080DE468
	ldr r2, _080DE478
	movs r1, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_080DE478: .4byte 0x02039BD8
	thumb_func_end Contest_SetBgCopyFlags

	thumb_func_start ResetContestLinkResults
ResetContestLinkResults: @ 0x080DE47C
	push {r4, r5, r6, lr}
	movs r0, #0
	ldr r6, _080DE4A8
	ldr r5, _080DE4AC
	movs r4, #0
_080DE486:
	adds r3, r0, #1
	lsls r1, r0, #3
	movs r2, #3
_080DE48C:
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, r0, r1
	strh r4, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080DE48C
	adds r0, r3, #0
	cmp r0, #4
	ble _080DE486
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DE4A8: .4byte 0x03005AF0
_080DE4AC: .4byte 0x00000624
	thumb_func_end ResetContestLinkResults

	thumb_func_start sub_080DE4B0
sub_080DE4B0: @ 0x080DE4B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	ldr r1, _080DE500
	ldrb r0, [r1]
	cmp r0, #0
	beq _080DE4EE
_080DE4E0:
	adds r5, #1
	cmp r5, #2
	bgt _080DE4EE
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080DE4E0
_080DE4EE:
	ldr r0, [sp]
	cmp r0, #0xff
	bne _080DE508
	ldr r0, _080DE504
	ldrb r0, [r0]
	cmp r5, r0
	beq _080DE508
	movs r0, #0
	b _080DE698
	.align 2, 0
_080DE500: .4byte 0x02039BC0
_080DE504: .4byte 0x02039BC5
_080DE508:
	ldr r0, _080DE51C
	ldrh r0, [r0]
	cmp r0, #4
	bhi _080DE554
	lsls r0, r0, #2
	ldr r1, _080DE520
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DE51C: .4byte 0x02039BCC
_080DE520: .4byte 0x080DE524
_080DE524: @ jump table
	.4byte _080DE554 @ case 0
	.4byte _080DE538 @ case 1
	.4byte _080DE53E @ case 2
	.4byte _080DE544 @ case 3
	.4byte _080DE54A @ case 4
_080DE538:
	mov r0, r8
	adds r0, #3
	b _080DE54E
_080DE53E:
	mov r0, r8
	adds r0, #6
	b _080DE54E
_080DE544:
	mov r0, r8
	adds r0, #9
	b _080DE54E
_080DE54A:
	mov r0, r8
	adds r0, #0xc
_080DE54E:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080DE554:
	ldr r1, [sp]
	cmp r1, #0xfe
	bne _080DE55C
	b _080DE658
_080DE55C:
	adds r0, r1, #0
	movs r1, #1
	bl sub_080DE6B0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r2, _080DE5E0
	mov sl, r2
	ldr r0, [r2]
	mov r3, sb
	lsls r7, r3, #5
	ldr r6, _080DE5E4
	adds r2, r0, r6
	adds r2, r2, r7
	ldr r4, _080DE5E8
	lsls r5, r5, #6
	adds r1, r4, #0
	adds r1, #0x38
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r2]
	adds r1, r0, r7
	adds r2, r5, r4
	ldrh r2, [r2]
	ldr r3, _080DE5EC
	adds r1, r1, r3
	strh r2, [r1]
	ldr r1, _080DE5F0
	adds r2, r0, r1
	adds r2, r2, r7
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r5, r1
	ldr r1, [r1]
	str r1, [r2]
	adds r6, r7, r6
	adds r0, r0, r6
	adds r0, #0xb
	adds r1, r4, #2
	adds r1, r5, r1
	bl StringCopy
	mov r2, sl
	ldr r0, [r2]
	adds r0, r0, r6
	adds r0, #0x16
	adds r4, #0xd
	adds r5, r5, r4
	adds r1, r5, #0
	bl StringCopy
	ldr r0, _080DE5F4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080DE5FC
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r7
	ldr r1, _080DE5F8
	adds r0, r0, r1
	movs r1, #4
	b _080DE60A
	.align 2, 0
_080DE5E0: .4byte 0x03005AEC
_080DE5E4: .4byte 0x00002E90
_080DE5E8: .4byte 0x02039AA0
_080DE5EC: .4byte 0x00002E98
_080DE5F0: .4byte 0x00002E94
_080DE5F4: .4byte 0x02039BCA
_080DE5F8: .4byte 0x00002EAE
_080DE5FC:
	mov r2, sl
	ldr r0, [r2]
	adds r0, r0, r7
	ldr r1, _080DE628
	ldrh r1, [r1]
	ldr r3, _080DE62C
	adds r0, r0, r3
_080DE60A:
	strb r1, [r0]
	ldr r0, [sp]
	cmp r0, #0xff
	beq _080DE63C
	ldr r0, _080DE630
	ldr r0, [r0]
	mov r2, sb
	lsls r1, r2, #5
	adds r0, r0, r1
	ldr r1, _080DE634
	ldrh r1, [r1]
	ldr r3, _080DE638
	adds r0, r0, r3
	strb r1, [r0]
	b _080DE696
	.align 2, 0
_080DE628: .4byte 0x02039BCE
_080DE62C: .4byte 0x00002EAE
_080DE630: .4byte 0x03005AEC
_080DE634: .4byte 0x02039BCC
_080DE638: .4byte 0x00002E9A
_080DE63C:
	ldr r0, _080DE650
	ldr r0, [r0]
	mov r2, sb
	lsls r1, r2, #5
	adds r0, r0, r1
	ldr r3, _080DE654
	adds r0, r0, r3
	mov r1, r8
	strb r1, [r0]
	b _080DE696
	.align 2, 0
_080DE650: .4byte 0x03005AEC
_080DE654: .4byte 0x00002E9A
_080DE658:
	ldr r6, _080DE6A8
	ldr r4, _080DE6AC
	lsls r5, r5, #6
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [r6]
	adds r0, r4, #0
	adds r0, #0x3c
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [r6, #4]
	adds r0, r5, r4
	ldrh r0, [r0]
	strh r0, [r6, #8]
	adds r0, r6, #0
	adds r0, #0xb
	adds r1, r4, #2
	adds r1, r5, r1
	bl StringCopy
	adds r0, r6, #0
	adds r0, #0x16
	adds r4, #0xd
	adds r5, r5, r4
	adds r1, r5, #0
	bl StringCopy
	mov r2, r8
	strb r2, [r6, #0xa]
_080DE696:
	movs r0, #1
_080DE698:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080DE6A8: .4byte 0x02039BDC
_080DE6AC: .4byte 0x02039AA0
	thumb_func_end sub_080DE4B0

	thumb_func_start sub_080DE6B0
sub_080DE6B0: @ 0x080DE6B0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, #3
	bgt _080DE700
	cmp r0, #0
	blt _080DE700
	cmp r1, #0
	beq _080DE6EE
	movs r2, #5
	ldr r0, _080DE6F4
	mov ip, r0
	ldr r4, _080DE6F8
	ldr r3, _080DE6FC
_080DE6D0:
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r2, #5
	adds r1, r1, r0
	adds r0, r1, r4
	adds r1, r1, r3
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6}
	stm r0!, {r5, r6}
	subs r2, #1
	cmp r2, #0
	bgt _080DE6D0
_080DE6EE:
	movs r0, #0
	b _080DE742
	.align 2, 0
_080DE6F4: .4byte 0x03005AEC
_080DE6F8: .4byte 0x00002E90
_080DE6FC: .4byte 0x00002E70
_080DE700:
	ldr r0, _080DE714
	ldrh r0, [r0]
	cmp r0, #4
	bhi _080DE740
	lsls r0, r0, #2
	ldr r1, _080DE718
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DE714: .4byte 0x02039BCC
_080DE718: .4byte 0x080DE71C
_080DE71C: @ jump table
	.4byte _080DE730 @ case 0
	.4byte _080DE734 @ case 1
	.4byte _080DE738 @ case 2
	.4byte _080DE73C @ case 3
	.4byte _080DE740 @ case 4
_080DE730:
	movs r0, #8
	b _080DE742
_080DE734:
	movs r0, #9
	b _080DE742
_080DE738:
	movs r0, #0xa
	b _080DE742
_080DE73C:
	movs r0, #0xb
	b _080DE742
_080DE740:
	movs r0, #0xc
_080DE742:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080DE6B0

	thumb_func_start ClearContestWinnerPicsInContestHall
ClearContestWinnerPicsInContestHall: @ 0x080DE748
	push {r4, r5, r6, r7, lr}
	movs r2, #0
	ldr r0, _080DE77C
	mov ip, r0
	ldr r4, _080DE780
	ldr r3, _080DE784
_080DE754:
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r2, #5
	adds r0, r0, r1
	adds r0, r0, r4
	adds r1, r3, #0
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6}
	stm r0!, {r5, r6}
	adds r3, #0x20
	adds r2, #1
	cmp r2, #7
	ble _080DE754
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DE77C: .4byte 0x03005AEC
_080DE780: .4byte 0x00002E90
_080DE784: .4byte 0x08560F28
	thumb_func_end ClearContestWinnerPicsInContestHall

	thumb_func_start sub_080DE788
sub_080DE788: @ 0x080DE788
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _080DE8C0
	ldr r3, [r2]
	ldr r5, [r3, #0x10]
	ldrb r1, [r5, #1]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _080DE7DA
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _080DE7DA
	ldr r1, [r3, #4]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x15]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _080DE7DA
	ldr r1, [r3, #0x1c]
	lsls r2, r4, #4
	adds r1, r2, r1
	ldrb r3, [r1, #0xc]
	movs r0, #1
	orrs r0, r3
	strb r0, [r1, #0xc]
	ldr r0, [r6]
	ldr r0, [r0, #0x1c]
	adds r2, r2, r0
	ldrb r0, [r2, #0xe]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0xe]
_080DE7DA:
	ldr r3, [r6]
	ldr r1, [r3, #4]
	lsls r2, r4, #3
	subs r0, r2, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xc]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _080DE802
	ldr r0, [r3, #0x1c]
	lsls r1, r4, #4
	adds r1, r1, r0
	ldrb r2, [r1, #0xc]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1, #0xc]
_080DE802:
	ldr r3, [r6]
	ldr r2, [r3, #0x10]
	ldrb r1, [r2, #1]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _080DE82E
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080DE82E
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0x3c
	bne _080DE82E
	ldr r0, [r3, #0x1c]
	lsls r1, r4, #4
	adds r1, r1, r0
	ldrb r2, [r1, #0xc]
	movs r0, #4
	orrs r0, r2
	strb r0, [r1, #0xc]
_080DE82E:
	ldr r3, [r6]
	ldr r1, [r3, #4]
	subs r0, r7, r4
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r1, [r2, #0x15]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080DE856
	ldrb r0, [r2, #0x16]
	cmp r0, #0
	beq _080DE856
	ldr r0, [r3, #0x1c]
	lsls r1, r4, #4
	adds r1, r1, r0
	ldrb r2, [r1, #0xc]
	movs r0, #8
	orrs r0, r2
	strb r0, [r1, #0xc]
_080DE856:
	movs r3, #0
	movs r5, #0
_080DE85A:
	cmp r3, r4
	beq _080DE888
	ldr r1, [r6]
	ldr r0, [r1, #4]
	adds r0, r5, r0
	ldrb r0, [r0, #0xe]
	cmp r0, #0
	beq _080DE888
	ldr r0, [r1, #0x1c]
	lsls r2, r4, #4
	adds r2, r2, r0
	ldrb r0, [r2, #0xc]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldr r0, [r6]
	ldr r0, [r0, #0x1c]
	lsls r2, r3, #4
	adds r2, r2, r0
	ldrb r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #0xc]
_080DE888:
	adds r5, #0x1c
	adds r3, #1
	cmp r3, #3
	ble _080DE85A
	ldr r2, [r6]
	ldr r1, [r2, #4]
	subs r0, r7, r4
	lsls r5, r0, #2
	adds r1, r5, r1
	ldrb r3, [r1, #0xc]
	movs r0, #6
	ands r0, r3
	cmp r0, #0
	bne _080DE8AE
	ldrb r1, [r1, #0xb]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080DE8C4
_080DE8AE:
	ldr r0, [r2, #0x1c]
	lsls r1, r4, #4
	adds r1, r1, r0
	ldrb r2, [r1, #0xc]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1, #0xc]
	b _080DE8FE
	.align 2, 0
_080DE8C0: .4byte 0x02039BD4
_080DE8C4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080DE8FE
	ldr r2, [r2, #0x1c]
	lsls r3, r4, #4
	adds r2, r3, r2
	ldrb r0, [r2, #0xc]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldr r0, [r6]
	ldr r1, [r0, #0x1c]
	adds r1, r3, r1
	ldrb r0, [r1, #0xe]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1, #0xe]
	ldr r1, [r6]
	ldr r0, [r1, #0x1c]
	adds r3, r3, r0
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	lsls r0, r0, #1
	adds r3, r3, r0
	ldr r0, [r1, #4]
	adds r0, r5, r0
	ldrh r0, [r0, #6]
	strh r0, [r3]
_080DE8FE:
	ldr r2, [r6]
	ldr r1, [r2, #4]
	subs r0, r7, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x15]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080DE922
	ldr r0, [r2, #0x1c]
	lsls r1, r4, #4
	adds r1, r1, r0
	ldrb r2, [r1, #0xd]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1, #0xd]
_080DE922:
	ldr r2, [r6]
	ldr r0, [r2]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _080DE952
	ldr r3, [r2, #0x10]
	ldrb r1, [r3, #1]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _080DE952
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _080DE952
	ldr r0, [r2, #0x1c]
	lsls r1, r4, #4
	adds r1, r1, r0
	ldrb r2, [r1, #0xd]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1, #0xd]
_080DE952:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_080DE788

	thumb_func_start sub_080DE958
sub_080DE958: @ 0x080DE958
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	movs r1, #0
	movs r0, #0
	str r0, [sp, #0x20]
	movs r4, #0
	ldr r6, _080DE998
	mov r2, sp
	adds r2, #0xc
	str r2, [sp, #0x28]
	mov r3, sp
	adds r3, #0x14
	str r3, [sp, #0x2c]
	mov r7, sp
	adds r7, #2
	str r7, [sp, #0x24]
	ldr r5, _080DE99C
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #0x11
_080DE988:
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080DE9A0
	lsrs r0, r2, #0x18
	str r0, [sp, #0x20]
	b _080DE9A6
	.align 2, 0
_080DE998: .4byte 0x02039BD4
_080DE99C: .4byte 0x02039BC0
_080DE9A0:
	cmp r0, #3
	bne _080DE9A6
	lsrs r1, r2, #0x18
_080DE9A6:
	adds r2, r2, r3
	adds r4, #1
	cmp r4, #3
	ble _080DE988
	ldr r0, [r6]
	ldr r0, [r0, #0x1c]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r2, [r1, #0xd]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0xd]
	movs r4, #0
	ldr r1, [sp, #0x20]
	lsls r1, r1, #4
	str r1, [sp, #0x30]
	mov sb, r4
	mov sl, r4
_080DE9CA:
	ldr r2, [sp, #0x20]
	cmp r4, r2
	beq _080DE9F6
	ldr r1, _080DEB94
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	add r1, sl
	movs r6, #0
	ldrsh r0, [r1, r6]
	subs r2, r2, r0
	cmp r2, #0x32
	bgt _080DE9F6
	ldr r7, _080DEB98
	ldr r0, [r7]
	ldr r2, [r0, #0x1c]
	add r2, sb
	ldrb r0, [r2, #0xd]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #0xd]
_080DE9F6:
	ldr r1, _080DEB98
	ldr r0, [r1]
	ldr r0, [r0, #0x1c]
	mov r3, sb
	adds r2, r3, r0
	ldrb r1, [r2, #0xe]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080DEA12
	ldrb r0, [r2, #0xd]
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #0xd]
_080DEA12:
	movs r5, #0
	ldr r2, _080DEB9C
	add r2, sl
	movs r6, #0
	ldrsh r1, [r2, r6]
	ldr r7, _080DEB9C
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	blt _080DEA3E
	adds r3, r2, #0
	adds r2, r7, #0
_080DEA2A:
	adds r2, #2
	adds r5, #1
	cmp r5, #3
	bgt _080DEA3E
	movs r6, #0
	ldrsh r1, [r3, r6]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080DEA2A
_080DEA3E:
	cmp r5, #4
	bne _080DEA5C
	ldr r1, _080DEBA0
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080DEA5C
	ldr r2, _080DEB98
	ldr r0, [r2]
	ldr r2, [r0, #0x1c]
	add r2, sb
	ldrb r0, [r2, #0xd]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #0xd]
_080DEA5C:
	movs r3, #0
	mov ip, r3
	mov r8, r3
	movs r5, #0
	ldr r0, _080DEB9C
	add r0, sl
	movs r7, #0
	ldrsh r6, [r0, r7]
	str r6, [sp, #0x34]
	ldr r2, _080DEB9C
	ldr r0, _080DEBA4
	mov r1, sl
	adds r6, r1, r0
	adds r3, r0, #0
_080DEA78:
	movs r7, #0
	ldrsh r0, [r2, r7]
	ldr r1, [sp, #0x34]
	cmp r1, r0
	ble _080DEA86
	movs r7, #1
	mov ip, r7
_080DEA86:
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r7, #0
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _080DEA96
	movs r0, #1
	mov r8, r0
_080DEA96:
	adds r2, #2
	adds r3, #2
	adds r5, #1
	cmp r5, #3
	ble _080DEA78
	mov r1, ip
	cmp r1, #0
	bne _080DEABC
	mov r2, r8
	cmp r2, #0
	bne _080DEABC
	ldr r3, _080DEB98
	ldr r0, [r3]
	ldr r2, [r0, #0x1c]
	add r2, sb
	ldrb r0, [r2, #0xd]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #0xd]
_080DEABC:
	ldr r6, _080DEB98
	ldr r0, [r6]
	ldr r0, [r0, #0x1c]
	mov r7, sb
	adds r2, r7, r0
	ldrb r1, [r2, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080DEAD8
	ldrb r0, [r2, #0xd]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #0xd]
_080DEAD8:
	movs r0, #0x10
	add sb, r0
	movs r1, #2
	add sl, r1
	adds r4, #1
	cmp r4, #3
	bgt _080DEAE8
	b _080DE9CA
_080DEAE8:
	movs r4, #0
	movs r5, #0
	movs r3, #0
	ldr r2, [sp, #0x28]
	mov r1, sp
_080DEAF2:
	strh r3, [r1]
	adds r0, r2, r4
	strb r5, [r0]
	adds r1, #2
	adds r4, #1
	cmp r4, #4
	ble _080DEAF2
	mov r1, sp
	ldr r0, _080DEBA8
	strh r0, [r1, #0xa]
	movs r0, #0
	ldr r2, [sp, #0x28]
	strb r0, [r2, #5]
	movs r4, #0
	ldr r0, _080DEB98
	ldr r0, [r0]
	mov r8, r0
	ldr r7, [sp, #0x30]
_080DEB16:
	mov r3, r8
	ldr r0, [r3, #0x1c]
	adds r0, r7, r0
	lsls r1, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, #1
	mov ip, r4
	cmp r0, #0
	beq _080DEB58
	ldr r0, _080DEB98
	ldr r6, [r0]
	ldr r3, [sp, #0x28]
	mov r4, sp
	movs r5, #4
_080DEB34:
	ldr r0, [r6, #0x1c]
	adds r0, r7, r0
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r2, [r4]
	cmp r0, r2
	beq _080DEB48
	cmp r2, #0
	bne _080DEB4E
	strh r0, [r4]
_080DEB48:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080DEB4E:
	adds r3, #1
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080DEB34
_080DEB58:
	mov r4, ip
	cmp r4, #4
	ble _080DEB16
	mov r0, sp
	ldrh r0, [r0]
	ldr r6, [sp, #0x2c]
	strh r0, [r6]
	ldr r7, [sp, #0x28]
	ldrb r3, [r7]
	movs r6, #0
	movs r4, #1
	ldr r1, [sp, #0x24]
	ldrh r0, [r1]
	ldr r1, _080DEBA8
	cmp r0, r1
	beq _080DEBC8
	ldr r5, [sp, #0x2c]
	adds r7, r1, #0
	mov r2, sp
	adds r2, #2
_080DEB80:
	ldr r0, [sp, #0x28]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r3, r0
	bhs _080DEBAC
	ldrh r0, [r2]
	strh r0, [r5]
	ldrb r3, [r1]
	movs r6, #1
	b _080DEBBE
	.align 2, 0
_080DEB94: .4byte 0x02039BA8
_080DEB98: .4byte 0x02039BD4
_080DEB9C: .4byte 0x02039BA0
_080DEBA0: .4byte 0x02039BC0
_080DEBA4: .4byte 0x02039BB8
_080DEBA8: .4byte 0x0000FFFF
_080DEBAC:
	cmp r3, r0
	bne _080DEBBE
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r1, [r2]
	strh r1, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080DEBBE:
	adds r2, #2
	adds r4, #1
	ldrh r0, [r2]
	cmp r0, r7
	bne _080DEB80
_080DEBC8:
	bl Random
	ldr r1, _080DEBFC
	ldr r1, [r1]
	ldr r4, [r1, #0x1c]
	ldr r1, [sp, #0x30]
	adds r4, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	lsls r0, r0, #1
	ldr r2, [sp, #0x2c]
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DEBFC: .4byte 0x02039BD4
	thumb_func_end sub_080DE958

	thumb_func_start sub_080DEC00
sub_080DEC00: @ 0x080DEC00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, _080DED34
	ldr r0, _080DED38
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080DEC1C
	b _080DEDCC
_080DEC1C:
	movs r1, #0
	movs r3, #0
	ldr r0, _080DED3C
	mov sb, r0
_080DEC24:
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080DEC30
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
_080DEC30:
	adds r3, #1
	cmp r3, #3
	ble _080DEC24
	movs r2, #0
	mov sl, r2
	movs r4, #0
	str r4, [sp, #4]
	movs r3, #0
	lsls r2, r1, #1
	lsls r1, r1, #4
	mov r8, r1
	ldr r1, _080DED40
	adds r0, r2, r1
	movs r7, #0
	ldrsh r6, [r0, r7]
	adds r5, r1, #0
	ldr r0, _080DED44
	adds r2, r2, r0
	adds r4, r0, #0
_080DEC56:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r6, r0
	bge _080DEC68
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_080DEC68:
	movs r7, #0
	ldrsh r1, [r2, r7]
	movs r7, #0
	ldrsh r0, [r4, r7]
	cmp r1, r0
	bge _080DEC7E
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
_080DEC7E:
	adds r5, #2
	adds r4, #2
	adds r3, #1
	cmp r3, #3
	ble _080DEC56
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0, #0x1c]
	add r0, r8
	ldrb r1, [r0, #0xc]
	movs r4, #0
	movs r2, #1
	movs r3, #7
_080DEC98:
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080DECA6
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080DECA6:
	lsrs r1, r1, #1
	subs r3, #1
	cmp r3, #0
	bge _080DEC98
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080DED3C
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	add r0, r8
	ldrb r1, [r0, #0xc]
	movs r4, #0
	movs r2, #0
	movs r3, #0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080DECE2
	cmp r5, #0
	beq _080DECFC
_080DECDC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080DECE2:
	lsrs r1, r1, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, #1
	cmp r3, #7
	bgt _080DECFC
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080DECE2
	cmp r5, r4
	bne _080DECDC
_080DECFC:
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r0, r2
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080DED3C
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	ldrb r4, [r0, #0xd]
	movs r5, #1
	movs r3, #1
	mov r6, sp
_080DED1A:
	ldr r0, [r1, #0x1c]
	lsls r2, r3, #4
	adds r0, r2, r0
	ldrb r0, [r0, #0xd]
	cmp r4, r0
	bhs _080DED48
	strb r3, [r6]
	ldr r0, [r1, #0x1c]
	adds r0, r2, r0
	ldrb r4, [r0, #0xd]
	movs r5, #1
	b _080DED58
	.align 2, 0
_080DED34: .4byte 0x02039BC0
_080DED38: .4byte 0x02039BC5
_080DED3C: .4byte 0x02039BD4
_080DED40: .4byte 0x02039BA0
_080DED44: .4byte 0x02039BB8
_080DED48:
	cmp r4, r0
	bne _080DED58
	mov r2, sp
	adds r0, r2, r5
	strb r3, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080DED58:
	adds r3, #1
	cmp r3, #3
	ble _080DED1A
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __modsi3
	add r0, sp
	ldrb r7, [r0]
	movs r2, #0x80
	movs r3, #0
	ldr r5, _080DEDDC
	ldr r0, [r5]
	ldr r0, [r0, #0x1c]
	lsls r1, r7, #4
	adds r0, r1, r0
	ldrb r0, [r0, #0xd]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, sb
	lsls r6, r0, #0x18
	cmp r4, #0
	bne _080DEDA4
_080DED8E:
	lsrs r2, r2, #1
	adds r3, #1
	cmp r3, #7
	bgt _080DEDA4
	ldr r0, [r5]
	ldr r0, [r0, #0x1c]
	adds r0, r1, r0
	ldrb r4, [r0, #0xd]
	ands r4, r2
	cmp r4, #0
	beq _080DED8E
_080DEDA4:
	mov r0, sl
	bl ContestLiveUpdates_BeforeInterview_1
	ldr r0, [sp, #4]
	bl ContestLiveUpdates_BeforeInterview_2
	lsrs r0, r6, #0x18
	bl ContestLiveUpdates_BeforeInterview_3
	ldr r0, _080DEDDC
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	add r0, r8
	ldrh r0, [r0, #0xa]
	bl ContestLiveUpdates_BeforeInterview_4
	adds r0, r4, #0
	adds r1, r7, #0
	bl ContestLiveUpdates_BeforeInterview_5
_080DEDCC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DEDDC: .4byte 0x02039BD4
	thumb_func_end sub_080DEC00

	thumb_func_start ContestDebugToggleBitfields
ContestDebugToggleBitfields: @ 0x080DEDE0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080DEE00
	movs r1, #0xd0
	lsls r1, r1, #9
	adds r2, r0, r1
	ldrb r1, [r2]
	adds r4, r0, #0
	cmp r1, #0
	bne _080DEE08
	cmp r3, #0
	bne _080DEE04
	movs r0, #2
	b _080DEE0A
	.align 2, 0
_080DEE00: .4byte 0x02000000
_080DEE04:
	movs r0, #3
	b _080DEE0A
_080DEE08:
	movs r0, #0
_080DEE0A:
	strb r0, [r2]
	movs r1, #0xd0
	lsls r1, r1, #9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080DEE22
	bl DrawContestantWindowText
	bl SwapMoveDescAndContestTilemaps
	b _080DEE26
_080DEE22:
	bl ContestDebugPrintBitStrings
_080DEE26:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestDebugToggleBitfields

	thumb_func_start ContestDebugPrintBitStrings
ContestDebugPrintBitStrings: @ 0x080DEE2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r0, _080DEF28
	ldrb r0, [r0]
	cmp r0, #0
	bne _080DEE42
	b _080DEFD4
_080DEE42:
	ldr r0, _080DEF2C
	movs r1, #0xd0
	lsls r1, r1, #9
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080DEE58
	b _080DEFD4
_080DEE58:
	movs r7, #0
	add r2, sp, #0x14
	mov sl, r2
_080DEE5E:
	adds r0, r7, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r7, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _080DEE5E
	ldr r0, _080DEF2C
	movs r4, #0xd0
	lsls r4, r4, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #2
	bne _080DEF3C
	movs r7, #0
	mov sb, sl
_080DEE8E:
	mov r0, sp
	ldr r1, _080DEF30
	bl StringCopy
	adds r6, r0, #0
	ldr r0, _080DEF34
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r1, sp
	bl Contest_PrintTextToBg0WindowStd
	ldr r0, _080DEF38
	ldr r0, [r0]
	ldr r1, [r0, #0x1c]
	lsls r0, r7, #4
	adds r0, r0, r1
	ldrb r5, [r0, #0xc]
	movs r4, #7
	adds r0, r7, #1
	mov r8, r0
_080DEEB6:
	movs r1, #1
	ands r1, r5
	adds r0, r6, #0
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	adds r6, r0, #0
	lsrs r5, r5, #1
	lsls r0, r4, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r4, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bgt _080DEEB6
	movs r4, #0
	ldr r6, _080DEF34
	mov r3, sl
_080DEEE2:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	adds r2, r3, r0
	mov r4, sp
	adds r1, r4, r0
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #4
	ble _080DEEE2
	mov r0, sb
	adds r1, r0, r5
	movs r0, #0xff
	strb r0, [r1]
	adds r4, r7, r6
	ldrb r0, [r4]
	mov r1, sb
	bl Contest_PrintTextToBg0WindowStd
	ldrb r0, [r4]
	adds r0, #4
	mov r2, sp
	adds r1, r2, r5
	bl Contest_PrintTextToBg0WindowStd
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _080DEE8E
	b _080DEFD0
	.align 2, 0
_080DEF28: .4byte 0x02031F75
_080DEF2C: .4byte 0x02000000
_080DEF30: .4byte 0x085CC49D
_080DEF34: .4byte 0x02039BC6
_080DEF38: .4byte 0x02039BD4
_080DEF3C:
	movs r7, #0
	mov r0, sp
	adds r0, #2
	str r0, [sp, #0x28]
	mov sb, sl
_080DEF46:
	mov r0, sp
	ldr r1, _080DEFE4
	bl StringCopy
	ldr r0, _080DEFE8
	ldr r0, [r0]
	ldr r1, [r0, #0x1c]
	lsls r0, r7, #4
	adds r0, r0, r1
	ldrb r5, [r0, #0xd]
	ldr r6, [sp, #0x28]
	movs r4, #7
	adds r1, r7, #1
	mov r8, r1
_080DEF62:
	movs r1, #1
	ands r1, r5
	adds r0, r6, #0
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	adds r6, r0, #0
	lsrs r5, r5, #1
	lsls r0, r4, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r4, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _080DEF62
	movs r4, #0
	ldr r6, _080DEFEC
	mov r3, sl
_080DEF8E:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	adds r2, r3, r0
	mov r4, sp
	adds r1, r4, r0
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #4
	ble _080DEF8E
	mov r0, sb
	adds r1, r0, r5
	movs r0, #0xff
	strb r0, [r1]
	adds r4, r7, r6
	ldrb r0, [r4]
	mov r1, sb
	bl Contest_PrintTextToBg0WindowStd
	ldrb r0, [r4]
	adds r0, #4
	mov r2, sp
	adds r1, r2, r5
	bl Contest_PrintTextToBg0WindowStd
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _080DEF46
_080DEFD0:
	bl SwapMoveDescAndContestTilemaps
_080DEFD4:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DEFE4: .4byte 0x085CC4A0
_080DEFE8: .4byte 0x02039BD4
_080DEFEC: .4byte 0x02039BC6
	thumb_func_end ContestDebugPrintBitStrings

