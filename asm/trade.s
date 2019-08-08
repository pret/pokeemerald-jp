.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08076B78
sub_08076B78: @ 0x08076B78
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _08076B98
	ldrb r0, [r0]
	cmp r0, #0x1d
	beq _08076B9C
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SendBlock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08076BAA
	.align 2, 0
_08076B98: .4byte 0x020228E0
_08076B9C:
	ldr r0, _08076BB0
	ldrb r0, [r0]
	movs r1, #0x54
	adds r2, r4, #0
	bl rfu_NI_setSendData
	movs r0, #1
_08076BAA:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08076BB0: .4byte 0x030041E0
	thumb_func_end sub_08076B78

	thumb_func_start sub_08076BB4
sub_08076BB4: @ 0x08076BB4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800A09C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08076BB4

	thumb_func_start sub_08076BC4
sub_08076BC4: @ 0x08076BC4
	push {r4, lr}
	ldr r0, _08076BE8
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _08076BF8
	ldr r4, _08076BEC
	ldr r0, _08076BF0
	ldrb r0, [r0]
	bl sub_0800E340
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	bne _08076BF4
	movs r0, #1
	b _08076C00
	.align 2, 0
_08076BE8: .4byte 0x020228E0
_08076BEC: .4byte 0x03007620
_08076BF0: .4byte 0x030041E0
_08076BF4:
	movs r0, #0
	b _08076C00
_08076BF8:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08076C00:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08076BC4

	thumb_func_start _GetBlockReceivedStatus
_GetBlockReceivedStatus: @ 0x08076C08
	push {lr}
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end _GetBlockReceivedStatus

	thumb_func_start sub_08076C18
sub_08076C18: @ 0x08076C18
	push {lr}
	bl sub_08076C68
	cmp r0, #0
	beq _08076C34
	ldr r0, _08076C30
	ldrb r1, [r0]
	movs r0, #0xc
	bl rfu_clearSlot
	b _08076C38
	.align 2, 0
_08076C30: .4byte 0x030041E0
_08076C34:
	bl ResetBlockReceivedFlags
_08076C38:
	pop {r0}
	bx r0
	thumb_func_end sub_08076C18

	thumb_func_start sub_08076C3C
sub_08076C3C: @ 0x08076C3C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08076C68
	cmp r0, #0
	beq _08076C58
	ldr r0, _08076C54
	ldrb r1, [r0]
	movs r0, #0xc
	bl rfu_clearSlot
	b _08076C60
	.align 2, 0
_08076C54: .4byte 0x030041E0
_08076C58:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ResetBlockReceivedFlag
_08076C60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08076C3C

	thumb_func_start sub_08076C68
sub_08076C68: @ 0x08076C68
	push {lr}
	ldr r0, _08076C80
	ldrb r0, [r0]
	cmp r0, #0
	beq _08076C88
	ldr r0, _08076C84
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _08076C88
	movs r0, #1
	b _08076C8A
	.align 2, 0
_08076C80: .4byte 0x0300319C
_08076C84: .4byte 0x020228E0
_08076C88:
	movs r0, #0
_08076C8A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08076C68

	thumb_func_start sub_08076C90
sub_08076C90: @ 0x08076C90
	push {lr}
	bl sub_0800A8D4
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08076C90

	thumb_func_start _IsLinkTaskFinished
_IsLinkTaskFinished: @ 0x08076C9C
	push {lr}
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end _IsLinkTaskFinished

	thumb_func_start sub_08076CAC
sub_08076CAC: @ 0x08076CAC
	push {r4, r5, lr}
	sub sp, #0xc
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	bl ResetPaletteFade
	ldr r2, _08076D9C
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r0, _08076DA0
	bl SetVBlankCallback
	ldr r4, _08076DA4
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0x14
	bl LoadPalette
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x14
	bl LoadPalette
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08076DA8
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r0, _08076DAC
	ldr r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #4
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r0, _08076DB0
	bl InitWindows
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08076D94
	bl DeactivateAllTextPrinters
	movs r5, #0
_08076D18:
	lsls r4, r5, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl ClearWindowTilemap
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r5, #1
	cmp r5, #0x11
	bls _08076D18
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #0
	movs r1, #0x14
	movs r2, #0xc0
	bl LoadUserWindowBorderGfx_
	movs r0, #2
	movs r1, #1
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	bl LoadMonIconPalettes
	ldr r2, _08076DAC
	ldr r0, [r2]
	adds r0, #0x69
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x6f
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x70
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x74
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x75
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x7a
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x7b
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xa8
	strb r1, [r0]
_08076D94:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076D9C: .4byte 0x02037C74
_08076DA0: .4byte 0x08077AE5
_08076DA4: .4byte 0x085D7B04
_08076DA8: .4byte 0x08300C04
_08076DAC: .4byte 0x02031F3C
_08076DB0: .4byte 0x08300C14
	thumb_func_end sub_08076CAC

	thumb_func_start sub_08076DB4
sub_08076DB4: @ 0x08076DB4
	push {lr}
	ldr r0, _08076DCC
	bl SetMainCallback2
	ldr r0, _08076DD0
	movs r1, #0
	str r1, [r0]
	ldr r0, _08076DD4
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08076DCC: .4byte 0x08076DD9
_08076DD0: .4byte 0x03002360
_08076DD4: .4byte 0x0202418E
	thumb_func_end sub_08076DB4

	thumb_func_start sub_08076DD8
sub_08076DD8: @ 0x08076DD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	ldr r1, _08076DFC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #0x16
	bls _08076DF2
	b _0807752A
_08076DF2:
	lsls r0, r0, #2
	ldr r1, _08076E00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08076DFC: .4byte 0x03002360
_08076E00: .4byte 0x08076E04
_08076E04: @ jump table
	.4byte _08076E60 @ case 0
	.4byte _08076EAC @ case 1
	.4byte _08076F68 @ case 2
	.4byte _08076F94 @ case 3
	.4byte _08076FF0 @ case 4
	.4byte _08077050 @ case 5
	.4byte _08077090 @ case 6
	.4byte _080770B0 @ case 7
	.4byte _080771F0 @ case 8
	.4byte _08077218 @ case 9
	.4byte _0807723C @ case 10
	.4byte _080772C4 @ case 11
	.4byte _080772D2 @ case 12
	.4byte _08077378 @ case 13
	.4byte _08077424 @ case 14
	.4byte _08077464 @ case 15
	.4byte _0807747E @ case 16
	.4byte _0807748C @ case 17
	.4byte _080774A0 @ case 18
	.4byte _080774C0 @ case 19
	.4byte _080774E0 @ case 20
	.4byte _080774F4 @ case 21
	.4byte _08077514 @ case 22
_08076E60:
	ldr r4, _08076E98
	ldr r0, _08076E9C
	bl AllocZeroed
	str r0, [r4]
	bl sub_08076CAC
	ldr r4, _08076EA0
	movs r0, #0xd0
	lsls r0, r0, #4
	bl AllocZeroed
	str r0, [r4]
	movs r6, #0
	ldr r2, _08076EA4
_08076E7E:
	lsls r1, r6, #8
	ldr r0, [r4]
	adds r0, r0, r1
	stm r2!, {r0}
	adds r6, #1
	cmp r6, #0xc
	ble _08076E7E
	ldr r1, _08076EA8
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08077506
	.align 2, 0
_08076E98: .4byte 0x02031F3C
_08076E9C: .4byte 0x000010F0
_08076EA0: .4byte 0x02031E28
_08076EA4: .4byte 0x02031E2C
_08076EA8: .4byte 0x03002360
_08076EAC:
	ldr r2, _08076F14
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	movs r6, #0
	movs r4, #0
_08076EBA:
	movs r0, #0x64
	muls r0, r6, r0
	ldr r1, _08076F18
	adds r0, r0, r1
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0x20
	bl CreateMon
	adds r6, #1
	cmp r6, #5
	ble _08076EBA
	movs r0, #0
	bl sub_08079BD4
	movs r0, #0
	bl ShowBg
	ldr r0, _08076F1C
	ldrb r2, [r0]
	cmp r2, #0
	bne _08076F54
	ldr r1, _08076F20
	ldr r4, _08076F24
	adds r0, r4, #0
	strh r0, [r1]
	ldr r0, _08076F28
	ldr r0, [r0]
	adds r0, #0xa8
	strb r2, [r0]
	ldr r0, _08076F2C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08076F30
	bl sub_0800AF5C
	bl OpenLink
	bl sub_08011690
	b _0807752A
	.align 2, 0
_08076F14: .4byte 0x02037C74
_08076F18: .4byte 0x020243E8
_08076F1C: .4byte 0x030031C4
_08076F20: .4byte 0x0202267E
_08076F24: .4byte 0x00001122
_08076F28: .4byte 0x02031F3C
_08076F2C: .4byte 0x0300319C
_08076F30:
	bl OpenLink
	ldr r0, _08076F4C
	movs r7, #0x87
	lsls r7, r7, #3
	adds r0, r0, r7
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, _08076F50
	movs r1, #1
	bl CreateTask
	b _0807752A
	.align 2, 0
_08076F4C: .4byte 0x03002360
_08076F50: .4byte 0x080B3189
_08076F54:
	ldr r0, _08076F64
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #4
	strb r1, [r0]
	b _0807752A
	.align 2, 0
_08076F64: .4byte 0x03002360
_08076F68:
	ldr r2, _08076F90
	ldr r1, [r2]
	adds r1, #0xa8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0xa8
	ldrb r0, [r1]
	cmp r0, #0xb
	bhi _08076F82
	b _0807752A
_08076F82:
	movs r0, #0
	strb r0, [r1]
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r3, r2
	b _08077506
	.align 2, 0
_08076F90: .4byte 0x02031F3C
_08076F94:
	bl GetLinkPlayerCount_2
	adds r4, r0, #0
	bl GetSavedPlayerCount
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bhs _08076FA8
	b _0807752A
_08076FA8:
	bl IsLinkMaster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08076FE0
	ldr r0, _08076FD8
	ldr r1, [r0]
	adds r1, #0xa8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bhi _08076FC8
	b _0807752A
_08076FC8:
	bl CheckShouldAdvanceLinkState
	ldr r1, _08076FDC
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08077506
	.align 2, 0
_08076FD8: .4byte 0x02031F3C
_08076FDC: .4byte 0x03002360
_08076FE0:
	ldr r1, _08076FEC
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _08077506
	.align 2, 0
_08076FEC: .4byte 0x03002360
_08076FF0:
	ldr r0, _08077040
	ldrb r0, [r0]
	cmp r0, #1
	beq _08076FFA
	b _0807752A
_08076FFA:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08077008
	b _0807752A
_08077008:
	bl sub_080116BC
	bl CalculatePlayerPartyCount
	ldr r1, _08077044
	movs r7, #0x87
	lsls r7, r7, #3
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	ldr r0, _08077048
	ldr r0, [r0]
	adds r0, #0xa8
	strb r2, [r0]
	ldr r0, _0807704C
	ldrb r0, [r0]
	cmp r0, #0
	bne _08077032
	b _0807752A
_08077032:
	movs r0, #1
	bl sub_0800FF8C
	bl sub_0800A8D4
	b _0807752A
	.align 2, 0
_08077040: .4byte 0x030031C4
_08077044: .4byte 0x03002360
_08077048: .4byte 0x02031F3C
_0807704C: .4byte 0x0300319C
_08077050:
	ldr r0, _08077080
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077088
	bl sub_08010000
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08077064
	b _0807752A
_08077064:
	ldr r1, _08077084
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _0807752A
	.align 2, 0
_08077080: .4byte 0x0300319C
_08077084: .4byte 0x03002360
_08077088:
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r3, r2
	b _08077506
_08077090:
	bl shedinja_maker_maybe
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807709C
	b _0807752A
_0807709C:
	bl sub_0807A028
	ldr r1, _080770AC
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08077506
	.align 2, 0
_080770AC: .4byte 0x03002360
_080770B0:
	bl CalculateEnemyPartyCount
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	ldr r2, _080771CC
	ldr r0, [r2]
	ldr r1, _080771D0
	ldrb r1, [r1]
	adds r0, #0x36
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _080771D4
	ldrb r1, [r1]
	adds r0, #0x37
	strb r1, [r0]
	movs r6, #0
	ldr r0, [r2]
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r6, r0
	bge _08077148
	mov r8, r2
	ldr r7, _080771D8
_080770EA:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _080771DC
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	ldrb r2, [r7]
	lsls r2, r2, #0x13
	movs r4, #0xe0
	lsls r4, r4, #0xc
	adds r2, r2, r4
	asrs r2, r2, #0x10
	ldrb r3, [r7, #1]
	lsls r3, r3, #0x13
	ldr r1, _080771E0
	adds r3, r3, r1
	asrs r3, r3, #0x10
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r5, #0
	ldr r1, _080771E4
	bl CreateMonIcon
	mov r2, r8
	ldr r1, [r2]
	adds r1, #0x28
	adds r1, r1, r6
	strb r0, [r1]
	adds r7, #2
	adds r6, #1
	ldr r0, [r2]
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r6, r0
	blt _080770EA
_08077148:
	movs r6, #0
	ldr r1, _080771CC
	ldr r0, [r1]
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r6, r0
	bge _080771C0
	ldr r0, _080771D8
	mov r8, r1
	adds r7, r0, #0
	adds r7, #0xc
_0807715E:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _080771E8
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	ldrb r2, [r7]
	lsls r2, r2, #0x13
	movs r3, #0xe0
	lsls r3, r3, #0xc
	adds r2, r2, r3
	asrs r2, r2, #0x10
	ldrb r3, [r7, #1]
	lsls r3, r3, #0x13
	ldr r4, _080771E0
	adds r3, r3, r4
	asrs r3, r3, #0x10
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r1, _080771E4
	bl CreateMonIcon
	mov r2, r8
	ldr r1, [r2]
	adds r1, #0x2e
	adds r1, r1, r6
	strb r0, [r1]
	adds r7, #2
	adds r6, #1
	ldr r0, [r2]
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r6, r0
	blt _0807715E
_080771C0:
	ldr r1, _080771EC
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08077506
	.align 2, 0
_080771CC: .4byte 0x02031F3C
_080771D0: .4byte 0x0202418D
_080771D4: .4byte 0x0202418E
_080771D8: .4byte 0x08300A1C
_080771DC: .4byte 0x02024190
_080771E0: .4byte 0xFFF40000
_080771E4: .4byte 0x080D28B5
_080771E8: .4byte 0x020243E8
_080771EC: .4byte 0x03002360
_080771F0:
	bl LoadHeldItemIcons
	ldr r0, _08077210
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x36
	adds r1, #0x28
	movs r2, #0
	bl sub_081B59EC
	ldr r1, _08077214
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _08077506
	.align 2, 0
_08077210: .4byte 0x02031F3C
_08077214: .4byte 0x03002360
_08077218:
	ldr r0, _08077234
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x36
	adds r1, #0x28
	movs r2, #1
	bl sub_081B59EC
	ldr r1, _08077238
	movs r7, #0x87
	lsls r7, r7, #3
	adds r1, r1, r7
	b _08077506
	.align 2, 0
_08077234: .4byte 0x02031F3C
_08077238: .4byte 0x03002360
_0807723C:
	ldr r0, _080772A8
	ldr r0, [r0]
	ldr r6, _080772AC
	ldr r1, [r6]
	ldr r5, _080772B0
	str r5, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	eors r1, r0
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080772B4
	adds r0, r0, r1
	ldr r1, [r6, #0xc]
	str r5, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	ldr r4, _080772B8
	ldr r0, [r4]
	ldr r1, [r6, #0x18]
	str r5, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	ldr r0, [r4, #4]
	ldr r1, [r6, #0x1c]
	movs r2, #0x18
	bl sub_08079D3C
	ldr r1, _080772BC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	ldr r0, _080772C0
	ldr r0, [r0]
	adds r0, #0xa8
	strb r2, [r0]
	b _0807752A
	.align 2, 0
_080772A8: .4byte 0x03005AF0
_080772AC: .4byte 0x02031E2C
_080772B0: .4byte 0x0201C000
_080772B4: .4byte 0x020226A8
_080772B8: .4byte 0x08300AFC
_080772BC: .4byte 0x03002360
_080772C0: .4byte 0x02031F3C
_080772C4:
	bl sub_08079C28
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080772D0
	b _0807752A
_080772D0:
	b _080774FE
_080772D2:
	ldr r0, _0807736C
	ldr r0, [r0]
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	movs r1, #0x4c
	subs r1, r1, r0
	movs r6, #0
	add r5, sp, #0x10
	lsls r4, r1, #0x10
_080772E8:
	add r1, sp, #0x10
	ldr r0, _08077370
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldrh r0, [r5]
	adds r0, r0, r6
	strh r0, [r5]
	asrs r1, r4, #0x10
	add r0, sp, #0x10
	movs r2, #8
	movs r3, #1
	bl CreateSprite
	movs r3, #0x80
	lsls r3, r3, #0xe
	adds r4, r4, r3
	adds r6, #1
	cmp r6, #2
	ble _080772E8
	bl GetMultiplayerId
	adds r1, r0, #0
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08077374
	adds r0, r0, r1
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	movs r1, #0xc4
	subs r1, r1, r0
	movs r6, #0
	add r5, sp, #0x10
	lsls r4, r1, #0x10
_0807733C:
	add r1, sp, #0x10
	ldr r0, _08077370
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	adds r0, r6, #3
	ldrh r7, [r5]
	adds r0, r0, r7
	strh r0, [r5]
	asrs r1, r4, #0x10
	add r0, sp, #0x10
	movs r2, #8
	movs r3, #1
	bl CreateSprite
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r4, r4, r0
	adds r6, #1
	cmp r6, #2
	ble _0807733C
	b _080774FE
	.align 2, 0
_0807736C: .4byte 0x03005AF0
_08077370: .4byte 0x083008A4
_08077374: .4byte 0x020226A8
_08077378:
	add r1, sp, #0x10
	ldr r0, _08077410
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	add r1, sp, #0x10
	adds r0, r1, #0
	ldrh r0, [r0]
	adds r0, #6
	strh r0, [r1]
	adds r0, r1, #0
	movs r1, #0xe0
	movs r2, #0x98
	movs r3, #1
	bl CreateSprite
	movs r6, #0
	add r4, sp, #0x10
	movs r5, #0xc0
	lsls r5, r5, #0xd
_080773A2:
	add r1, sp, #0x10
	ldr r0, _08077410
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	adds r0, r6, #7
	ldrh r7, [r4]
	adds r0, r0, r7
	strh r0, [r4]
	asrs r1, r5, #0x10
	add r0, sp, #0x10
	movs r2, #0x96
	movs r3, #1
	bl CreateSprite
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r5, r5, r0
	adds r6, #1
	cmp r6, #5
	ble _080773A2
	ldr r0, _08077414
	ldr r2, _08077418
	ldrb r1, [r2]
	lsls r1, r1, #0x13
	movs r3, #0x80
	lsls r3, r3, #0xe
	adds r1, r1, r3
	asrs r1, r1, #0x10
	ldrb r2, [r2, #1]
	lsls r2, r2, #3
	movs r3, #2
	bl CreateSprite
	ldr r2, _0807741C
	ldr r1, [r2]
	adds r1, #0x34
	movs r3, #0
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x35
	strb r3, [r0]
	ldr r1, _08077420
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
	bl rbox_fill_rectangle
	b _0807752A
	.align 2, 0
_08077410: .4byte 0x083008A4
_08077414: .4byte 0x0830088C
_08077418: .4byte 0x08300A1C
_0807741C: .4byte 0x02031F3C
_08077420: .4byte 0x03002360
_08077424:
	movs r0, #0
	bl sub_08079D98
	movs r0, #0
	bl sub_08079690
	ldr r2, _08077458
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #1]
	bl sub_08077D50
	ldr r1, _0807745C
	movs r7, #0x87
	lsls r7, r7, #3
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08077460
	bl PlayBGM
	b _0807752A
	.align 2, 0
_08077458: .4byte 0x02031F3C
_0807745C: .4byte 0x03002360
_08077460: .4byte 0x000001B3
_08077464:
	movs r0, #1
	bl sub_08079D98
	movs r0, #1
	bl sub_08079690
	ldr r1, _08077488
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0807747E:
	movs r0, #0
	bl sub_08077C80
	b _080774FE
	.align 2, 0
_08077488: .4byte 0x03002360
_0807748C:
	movs r0, #1
	bl sub_08077C80
	ldr r1, _0807749C
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08077506
	.align 2, 0
_0807749C: .4byte 0x03002360
_080774A0:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, _080774BC
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _08077506
	.align 2, 0
_080774BC: .4byte 0x03002360
_080774C0:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #2
	bl sub_08077C80
	ldr r1, _080774DC
	movs r7, #0x87
	lsls r7, r7, #3
	adds r1, r1, r7
	b _08077506
	.align 2, 0
_080774DC: .4byte 0x03002360
_080774E0:
	movs r0, #0
	bl sub_08079EE0
	ldr r1, _080774F0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08077506
	.align 2, 0
_080774F0: .4byte 0x03002360
_080774F4:
	movs r0, #1
	bl sub_08079EE0
	bl sub_08079FB4
_080774FE:
	ldr r1, _08077510
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_08077506:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807752A
	.align 2, 0
_08077510: .4byte 0x03002360
_08077514:
	ldr r0, _0807754C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807752A
	ldr r0, _08077550
	str r0, [r3]
	ldr r0, _08077554
	bl SetMainCallback2
_0807752A:
	bl RunTextPrinters
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807754C: .4byte 0x02037C74
_08077550: .4byte 0x08078619
_08077554: .4byte 0x08077C25
	thumb_func_end sub_08076DD8

	thumb_func_start sub_08077558
sub_08077558: @ 0x08077558
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	ldr r1, _0807757C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x16
	bls _08077572
	b _08077ABE
_08077572:
	lsls r0, r0, #2
	ldr r1, _08077580
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807757C: .4byte 0x03002360
_08077580: .4byte 0x08077584
_08077584: @ jump table
	.4byte _080775E0 @ case 0
	.4byte _080775F4 @ case 1
	.4byte _080775FC @ case 2
	.4byte _08077604 @ case 3
	.4byte _0807760C @ case 4
	.4byte _08077620 @ case 5
	.4byte _08077648 @ case 6
	.4byte _08077650 @ case 7
	.4byte _08077788 @ case 8
	.4byte _080777B0 @ case 9
	.4byte _080777D4 @ case 10
	.4byte _0807785C @ case 11
	.4byte _08077878 @ case 12
	.4byte _08077928 @ case 13
	.4byte _08077ABE @ case 14
	.4byte _08077ABE @ case 15
	.4byte _080779F4 @ case 16
	.4byte _08077A08 @ case 17
	.4byte _08077A30 @ case 18
	.4byte _08077A6C @ case 19
	.4byte _08077A8C @ case 20
	.4byte _08077A94 @ case 21
	.4byte _08077AAC @ case 22
_080775E0:
	bl sub_08076CAC
	ldr r1, _080775F0
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08077AA0
	.align 2, 0
_080775F0: .4byte 0x03002360
_080775F4:
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r2, r4
	b _0807782E
_080775FC:
	movs r5, #0x87
	lsls r5, r5, #3
	adds r1, r2, r5
	b _08077AA0
_08077604:
	movs r7, #0x87
	lsls r7, r7, #3
	adds r1, r2, r7
	b _08077AA0
_0807760C:
	bl CalculatePlayerPartyCount
	ldr r1, _0807761C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08077AA0
	.align 2, 0
_0807761C: .4byte 0x03002360
_08077620:
	ldr r0, _08077640
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077634
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
_08077634:
	ldr r1, _08077644
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08077AA0
	.align 2, 0
_08077640: .4byte 0x0300319C
_08077644: .4byte 0x03002360
_08077648:
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r2, r3
	b _08077AA0
_08077650:
	bl CalculateEnemyPartyCount
	ldr r4, _08077768
	ldr r0, [r4]
	ldr r1, _0807776C
	ldrb r1, [r1]
	adds r0, #0x36
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _08077770
	ldrb r1, [r1]
	adds r0, #0x37
	strb r1, [r0]
	movs r0, #0
	bl ClearWindowTilemap
	movs r0, #0
	bl sub_08079690
	movs r0, #1
	bl sub_08079690
	movs r6, #0
	ldr r0, [r4]
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r6, r0
	bge _080776EC
	mov r8, r4
	ldr r7, _08077774
_0807768C:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _08077778
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	ldrb r2, [r7]
	lsls r2, r2, #0x13
	movs r4, #0xe0
	lsls r4, r4, #0xc
	adds r2, r2, r4
	asrs r2, r2, #0x10
	ldrb r3, [r7, #1]
	lsls r3, r3, #0x13
	ldr r1, _0807777C
	adds r3, r3, r1
	asrs r3, r3, #0x10
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r5, #0
	ldr r1, _08077780
	bl CreateMonIcon
	mov r2, r8
	ldr r1, [r2]
	adds r1, #0x28
	adds r1, r1, r6
	strb r0, [r1]
	adds r7, #2
	adds r6, #1
	ldr r0, [r2]
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r6, r0
	blt _0807768C
_080776EC:
	movs r6, #0
	ldr r1, _08077768
	ldr r0, [r1]
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r6, r0
	blt _080776FC
	b _08077A98
_080776FC:
	ldr r0, _08077774
	mov r8, r1
	adds r7, r0, #0
	adds r7, #0xc
_08077704:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _08077784
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x41
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	ldrb r2, [r7]
	lsls r2, r2, #0x13
	movs r3, #0xe0
	lsls r3, r3, #0xc
	adds r2, r2, r3
	asrs r2, r2, #0x10
	ldrb r3, [r7, #1]
	lsls r3, r3, #0x13
	ldr r4, _0807777C
	adds r3, r3, r4
	asrs r3, r3, #0x10
	movs r1, #1
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r1, _08077780
	bl CreateMonIcon
	mov r5, r8
	ldr r1, [r5]
	adds r1, #0x2e
	adds r1, r1, r6
	strb r0, [r1]
	adds r7, #2
	adds r6, #1
	ldr r0, [r5]
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r6, r0
	blt _08077704
	b _08077A98
	.align 2, 0
_08077768: .4byte 0x02031F3C
_0807776C: .4byte 0x0202418D
_08077770: .4byte 0x0202418E
_08077774: .4byte 0x08300A1C
_08077778: .4byte 0x02024190
_0807777C: .4byte 0xFFF40000
_08077780: .4byte 0x080D28B5
_08077784: .4byte 0x020243E8
_08077788:
	bl LoadHeldItemIcons
	ldr r0, _080777A8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x36
	adds r1, #0x28
	movs r2, #0
	bl sub_081B59EC
	ldr r1, _080777AC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08077AA0
	.align 2, 0
_080777A8: .4byte 0x02031F3C
_080777AC: .4byte 0x03002360
_080777B0:
	ldr r0, _080777CC
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x36
	adds r1, #0x28
	movs r2, #1
	bl sub_081B59EC
	ldr r1, _080777D0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08077AA0
	.align 2, 0
_080777CC: .4byte 0x02031F3C
_080777D0: .4byte 0x03002360
_080777D4:
	ldr r0, _08077840
	ldr r0, [r0]
	ldr r6, _08077844
	ldr r1, [r6]
	ldr r5, _08077848
	str r5, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	eors r1, r0
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807784C
	adds r0, r0, r1
	ldr r1, [r6, #0xc]
	str r5, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	ldr r4, _08077850
	ldr r0, [r4]
	ldr r1, [r6, #0x18]
	str r5, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	ldr r0, [r4, #4]
	ldr r1, [r6, #0x1c]
	movs r2, #0x18
	bl sub_08079D3C
	ldr r1, _08077854
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
_0807782E:
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	ldr r0, _08077858
	ldr r0, [r0]
	adds r0, #0xa8
	strb r2, [r0]
	b _08077ABE
	.align 2, 0
_08077840: .4byte 0x03005AF0
_08077844: .4byte 0x02031E2C
_08077848: .4byte 0x0201C000
_0807784C: .4byte 0x020226A8
_08077850: .4byte 0x08300AFC
_08077854: .4byte 0x03002360
_08077858: .4byte 0x02031F3C
_0807785C:
	bl sub_08079C28
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08077868
	b _08077ABE
_08077868:
	ldr r1, _08077874
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _08077AA0
	.align 2, 0
_08077874: .4byte 0x03002360
_08077878:
	ldr r0, _08077918
	ldr r0, [r0]
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	movs r1, #0x4c
	subs r1, r1, r0
	movs r6, #0
	add r5, sp, #0xc
	lsls r4, r1, #0x10
_0807788E:
	add r1, sp, #0xc
	ldr r0, _0807791C
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldrh r0, [r5]
	adds r0, r0, r6
	strh r0, [r5]
	asrs r1, r4, #0x10
	add r0, sp, #0xc
	movs r2, #8
	movs r3, #1
	bl CreateSprite
	movs r7, #0x80
	lsls r7, r7, #0xe
	adds r4, r4, r7
	adds r6, #1
	cmp r6, #2
	ble _0807788E
	bl GetMultiplayerId
	adds r1, r0, #0
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08077920
	adds r0, r0, r1
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	movs r1, #0xc4
	subs r1, r1, r0
	movs r6, #0
	add r5, sp, #0xc
	lsls r4, r1, #0x10
_080778E2:
	add r1, sp, #0xc
	ldr r0, _0807791C
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	adds r0, r6, #3
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	asrs r1, r4, #0x10
	add r0, sp, #0xc
	movs r2, #8
	movs r3, #1
	bl CreateSprite
	movs r2, #0x80
	lsls r2, r2, #0xe
	adds r4, r4, r2
	adds r6, #1
	cmp r6, #2
	ble _080778E2
	ldr r1, _08077924
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08077AA0
	.align 2, 0
_08077918: .4byte 0x03005AF0
_0807791C: .4byte 0x083008A4
_08077920: .4byte 0x020226A8
_08077924: .4byte 0x03002360
_08077928:
	add r1, sp, #0xc
	ldr r0, _08077994
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	add r1, sp, #0xc
	adds r0, r1, #0
	ldrh r0, [r0]
	adds r0, #6
	strh r0, [r1]
	adds r0, r1, #0
	movs r1, #0xe0
	movs r2, #0x98
	movs r3, #1
	bl CreateSprite
	movs r6, #0
	add r4, sp, #0xc
	movs r5, #0xc0
	lsls r5, r5, #0xd
_08077952:
	add r1, sp, #0xc
	ldr r0, _08077994
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	adds r0, r6, #7
	ldrh r7, [r4]
	adds r0, r0, r7
	strh r0, [r4]
	asrs r1, r5, #0x10
	add r0, sp, #0xc
	movs r2, #0x96
	movs r3, #1
	bl CreateSprite
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r5, r5, r0
	adds r6, #1
	cmp r6, #5
	ble _08077952
	ldr r0, _08077998
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r1, [r2]
	adds r4, r0, #0
	cmp r1, #5
	bhi _080779A0
	ldr r0, _0807799C
	ldrb r0, [r0]
	b _080779A6
	.align 2, 0
_08077994: .4byte 0x083008A4
_08077998: .4byte 0x02031F3C
_0807799C: .4byte 0x0203CBEC
_080779A0:
	ldr r0, _080779E4
	ldrb r0, [r0]
	adds r0, #6
_080779A6:
	strb r0, [r2]
	ldr r0, _080779E8
	ldr r3, _080779EC
	ldr r1, [r4]
	adds r1, #0x35
	ldrb r2, [r1]
	lsls r2, r2, #1
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x13
	movs r5, #0x80
	lsls r5, r5, #0xe
	adds r1, r1, r5
	asrs r1, r1, #0x10
	adds r3, #1
	adds r2, r2, r3
	ldrb r2, [r2]
	lsls r2, r2, #3
	movs r3, #2
	bl CreateSprite
	ldr r1, [r4]
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, _080779F0
	movs r7, #0x87
	lsls r7, r7, #3
	adds r0, r0, r7
	movs r1, #0x10
	strb r1, [r0]
	b _08077ABE
	.align 2, 0
_080779E4: .4byte 0x0203CBEC
_080779E8: .4byte 0x0830088C
_080779EC: .4byte 0x08300A1C
_080779F0: .4byte 0x03002360
_080779F4:
	movs r0, #0
	bl sub_08077C80
	ldr r1, _08077A04
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _08077AA0
	.align 2, 0
_08077A04: .4byte 0x03002360
_08077A08:
	movs r0, #1
	bl sub_08077C80
	ldr r2, _08077A28
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #1]
	bl sub_08077D50
	ldr r1, _08077A2C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _08077AA0
	.align 2, 0
_08077A28: .4byte 0x02031F3C
_08077A2C: .4byte 0x03002360
_08077A30:
	ldr r2, _08077A64
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
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
	ldr r1, _08077A68
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	b _08077AA0
	.align 2, 0
_08077A64: .4byte 0x02037C74
_08077A68: .4byte 0x03002360
_08077A6C:
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #2
	bl sub_08077C80
	ldr r1, _08077A88
	movs r4, #0x87
	lsls r4, r4, #3
	adds r1, r1, r4
	b _08077AA0
	.align 2, 0
_08077A88: .4byte 0x03002360
_08077A8C:
	movs r5, #0x87
	lsls r5, r5, #3
	adds r1, r2, r5
	b _08077AA0
_08077A94:
	bl sub_08079FB4
_08077A98:
	ldr r1, _08077AA8
	movs r7, #0x87
	lsls r7, r7, #3
	adds r1, r1, r7
_08077AA0:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08077ABE
	.align 2, 0
_08077AA8: .4byte 0x03002360
_08077AAC:
	ldr r0, _08077ADC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08077ABE
	ldr r0, _08077AE0
	bl SetMainCallback2
_08077ABE:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077ADC: .4byte 0x02037C74
_08077AE0: .4byte 0x08077C25
	thumb_func_end sub_08077558

	thumb_func_start sub_08077AE4
sub_08077AE4: @ 0x08077AE4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08077AE4

	thumb_func_start sub_08077AF8
sub_08077AF8: @ 0x08077AF8
	push {r4, lr}
	sub sp, #4
	ldr r4, _08077B30
	ldr r1, [r4]
	adds r1, #0xa8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _08077B28
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #0xa
	strb r1, [r0]
_08077B28:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077B30: .4byte 0x02031F3C
	thumb_func_end sub_08077AF8

	thumb_func_start sub_08077B34
sub_08077B34: @ 0x08077B34
	push {r4, lr}
	ldr r0, _08077B6C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08077B8A
	ldr r1, _08077B70
	ldr r4, _08077B74
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	strb r0, [r1, #1]
	ldr r0, _08077B78
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077B7C
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0x10
	strb r0, [r1]
	b _08077B8A
	.align 2, 0
_08077B6C: .4byte 0x02037C74
_08077B70: .4byte 0x02031F38
_08077B74: .4byte 0x02031F3C
_08077B78: .4byte 0x0300319C
_08077B7C:
	movs r0, #0x20
	bl sub_0800A7B8
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #0xd
	strb r1, [r0]
_08077B8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08077B34

	thumb_func_start sub_08077B90
sub_08077B90: @ 0x08077B90
	push {r4, r5, lr}
	ldr r5, _08077BD0
	ldr r0, _08077BD4
	str r0, [r5, #8]
	ldr r0, _08077BD8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077BE8
	bl sub_08010000
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08077C0C
	ldr r0, _08077BDC
	ldr r0, [r0]
	bl Free
	bl FreeAllWindowBuffers
	ldr r0, _08077BE0
	ldr r0, [r0]
	bl Free
	movs r0, #0
	str r0, [r5]
	bl DestroyWirelessStatusIndicatorSprite
	ldr r0, _08077BE4
	bl SetMainCallback2
	b _08077C0C
	.align 2, 0
_08077BD0: .4byte 0x03002360
_08077BD4: .4byte 0x08076DB5
_08077BD8: .4byte 0x0300319C
_08077BDC: .4byte 0x02031E28
_08077BE0: .4byte 0x02031F3C
_08077BE4: .4byte 0x0807A8AD
_08077BE8:
	ldr r0, _08077C14
	ldrb r4, [r0]
	cmp r4, #0
	bne _08077C0C
	ldr r0, _08077C18
	ldr r0, [r0]
	bl Free
	bl FreeAllWindowBuffers
	ldr r0, _08077C1C
	ldr r0, [r0]
	bl Free
	str r4, [r5]
	ldr r0, _08077C20
	bl SetMainCallback2
_08077C0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077C14: .4byte 0x030031C4
_08077C18: .4byte 0x02031E28
_08077C1C: .4byte 0x02031F3C
_08077C20: .4byte 0x0807A8AD
	thumb_func_end sub_08077B90

	thumb_func_start sub_08077C24
sub_08077C24: @ 0x08077C24
	push {r4, lr}
	bl sub_08078FC0
	bl sub_08079AFC
	movs r0, #0
	bl sub_080790C8
	movs r0, #1
	bl sub_080790C8
	ldr r4, _08077C7C
	ldr r2, [r4]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x18
	bl SetGpuReg
	ldr r2, [r4]
	ldrb r1, [r2, #1]
	adds r0, r1, #0
	adds r0, #0xff
	strb r0, [r2, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x1c
	bl SetGpuReg
	bl RunTextPrintersAndIsPrinter0Active
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077C7C: .4byte 0x02031F3C
	thumb_func_end sub_08077C24

	thumb_func_start sub_08077C80
sub_08077C80: @ 0x08077C80
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	beq _08077CEC
	cmp r4, #1
	bgt _08077C96
	cmp r4, #0
	beq _08077C9C
	b _08077D46
_08077C96:
	cmp r4, #2
	beq _08077D14
	b _08077D46
_08077C9C:
	ldr r0, _08077CDC
	movs r1, #0
	movs r2, #0x60
	bl LoadPalette
	ldr r1, _08077CE0
	movs r2, #0x94
	lsls r2, r2, #5
	movs r0, #1
	movs r3, #0
	bl LoadBgTiles
	ldr r1, _08077CE4
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r1, _08077CE8
	movs r2, #0x80
	lsls r2, r2, #4
	movs r0, #2
	movs r3, #0
	bl LoadBgTilemap
	b _08077D46
	.align 2, 0
_08077CDC: .4byte 0x082FD0CC
_08077CE0: .4byte 0x082FD14C
_08077CE4: .4byte 0x082FE3CC
_08077CE8: .4byte 0x082FEFC8
_08077CEC:
	ldr r1, _08077D10
	movs r2, #0x80
	lsls r2, r2, #4
	movs r0, #3
	movs r3, #0
	bl LoadBgTilemap
	movs r0, #0
	bl sub_0807987C
	movs r0, #1
	bl sub_0807987C
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	b _08077D46
	.align 2, 0
_08077D10: .4byte 0x082FF7C8
_08077D14:
	movs r5, #0x80
	lsls r5, r5, #0x15
	movs r4, #3
_08077D1A:
	lsrs r0, r5, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x80
	lsls r0, r0, #0x12
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _08077D1A
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
_08077D46:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08077C80

	thumb_func_start sub_08077D50
sub_08077D50: @ 0x08077D50
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r3, #0
	ldr r5, _08077DA0
	mov r8, r5
	ldr r0, _08077DA4
	mov ip, r0
	movs r1, #5
	rsbs r1, r1, #0
	mov sb, r1
	movs r4, #6
	movs r7, #1
	movs r6, #0
_08077D6E:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r1, [r1]
	cmp r3, r1
	bge _08077DA8
	adds r0, #0x28
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	adds r1, #0x3e
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x38
	adds r0, r0, r3
	strb r7, [r0]
	b _08077DAE
	.align 2, 0
_08077DA0: .4byte 0x02031F3C
_08077DA4: .4byte 0x020205AC
_08077DA8:
	adds r0, #0x38
	adds r0, r0, r3
	strb r6, [r0]
_08077DAE:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x37
	ldrb r1, [r1]
	cmp r3, r1
	bge _08077DDE
	adds r0, #0x2e
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	adds r1, #0x3e
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x38
	adds r0, r0, r4
	strb r7, [r0]
	b _08077DE4
_08077DDE:
	adds r0, #0x38
	adds r0, r0, r4
	strb r6, [r0]
_08077DE4:
	adds r4, #1
	adds r3, #1
	cmp r3, #5
	ble _08077D6E
	ldr r0, [r5]
	adds r0, #0x44
	movs r1, #1
	strb r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08077D50

	thumb_func_start Trade_Memcpy
Trade_Memcpy: @ 0x08077E00
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0
	cmp r3, r2
	bhs _08077E1A
_08077E0C:
	adds r0, r5, r3
	adds r1, r4, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, r2
	blo _08077E0C
_08077E1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Trade_Memcpy

	thumb_func_start shedinja_maker_maybe
shedinja_maker_maybe: @ 0x08077E20
	push {r4, r5, lr}
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08077E44
	ldr r0, [r0]
	adds r0, #0x69
	ldrb r0, [r0]
	cmp r0, #0x15
	bls _08077E38
	b _08078112
_08077E38:
	lsls r0, r0, #2
	ldr r1, _08077E48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077E44: .4byte 0x02031F3C
_08077E48: .4byte 0x08077E4C
_08077E4C: @ jump table
	.4byte _08077EA4 @ case 0
	.4byte _08077ED0 @ case 1
	.4byte _080780EC @ case 2
	.4byte _08077EFC @ case 3
	.4byte _08077F10 @ case 4
	.4byte _08077F44 @ case 5
	.4byte _080780EC @ case 6
	.4byte _08077F60 @ case 7
	.4byte _08077F74 @ case 8
	.4byte _08077FA8 @ case 9
	.4byte _080780EC @ case 10
	.4byte _08077FC4 @ case 11
	.4byte _08077FD8 @ case 12
	.4byte _0807800C @ case 13
	.4byte _080780EC @ case 14
	.4byte _08078034 @ case 15
	.4byte _08078048 @ case 16
	.4byte _0807807C @ case 17
	.4byte _080780EC @ case 18
	.4byte _080780A4 @ case 19
	.4byte _080780B8 @ case 20
	.4byte _080780E8 @ case 21
_08077EA4:
	ldr r0, _08077EC4
	ldr r1, _08077EC8
	movs r2, #0xc8
	bl Trade_Memcpy
	ldr r3, _08077ECC
	ldr r1, [r3]
	adds r1, #0x69
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, #0xa8
	strb r2, [r0]
	b _08078112
	.align 2, 0
_08077EC4: .4byte 0x0202257C
_08077EC8: .4byte 0x02024190
_08077ECC: .4byte 0x02031F3C
_08077ED0:
	bl sub_08076BC4
	cmp r0, #0
	bne _08077EDA
	b _08078112
_08077EDA:
	bl _GetBlockReceivedStatus
	cmp r0, #0
	bne _08077EEC
	ldr r0, _08077EE8
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077EE8: .4byte 0x02031F3C
_08077EEC:
	bl sub_08076C18
	ldr r0, _08077EF8
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077EF8: .4byte 0x02031F3C
_08077EFC:
	cmp r5, #0
	bne _08077F06
	movs r0, #1
	bl sub_08076BB4
_08077F06:
	ldr r0, _08077F0C
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077F0C: .4byte 0x02031F3C
_08077F10:
	bl _GetBlockReceivedStatus
	cmp r0, #3
	beq _08077F1A
	b _08078112
_08077F1A:
	ldr r0, _08077F38
	movs r2, #1
	adds r1, r5, #0
	eors r1, r2
	lsls r1, r1, #8
	ldr r2, _08077F3C
	adds r1, r1, r2
	movs r2, #0xc8
	bl Trade_Memcpy
	bl sub_08076C18
	ldr r0, _08077F40
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077F38: .4byte 0x020243E8
_08077F3C: .4byte 0x0202207C
_08077F40: .4byte 0x02031F3C
_08077F44:
	ldr r0, _08077F54
	ldr r1, _08077F58
	movs r2, #0xc8
	bl Trade_Memcpy
	ldr r0, _08077F5C
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077F54: .4byte 0x0202257C
_08077F58: .4byte 0x02024258
_08077F5C: .4byte 0x02031F3C
_08077F60:
	cmp r5, #0
	bne _08077F6A
	movs r0, #1
	bl sub_08076BB4
_08077F6A:
	ldr r0, _08077F70
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077F70: .4byte 0x02031F3C
_08077F74:
	bl _GetBlockReceivedStatus
	cmp r0, #3
	beq _08077F7E
	b _08078112
_08077F7E:
	ldr r0, _08077F9C
	movs r2, #1
	adds r1, r5, #0
	eors r1, r2
	lsls r1, r1, #8
	ldr r2, _08077FA0
	adds r1, r1, r2
	movs r2, #0xc8
	bl Trade_Memcpy
	bl sub_08076C18
	ldr r0, _08077FA4
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077F9C: .4byte 0x020244B0
_08077FA0: .4byte 0x0202207C
_08077FA4: .4byte 0x02031F3C
_08077FA8:
	ldr r0, _08077FB8
	ldr r1, _08077FBC
	movs r2, #0xc8
	bl Trade_Memcpy
	ldr r0, _08077FC0
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077FB8: .4byte 0x0202257C
_08077FBC: .4byte 0x02024320
_08077FC0: .4byte 0x02031F3C
_08077FC4:
	cmp r5, #0
	bne _08077FCE
	movs r0, #1
	bl sub_08076BB4
_08077FCE:
	ldr r0, _08077FD4
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08077FD4: .4byte 0x02031F3C
_08077FD8:
	bl _GetBlockReceivedStatus
	cmp r0, #3
	beq _08077FE2
	b _08078112
_08077FE2:
	ldr r0, _08078000
	movs r2, #1
	adds r1, r5, #0
	eors r1, r2
	lsls r1, r1, #8
	ldr r2, _08078004
	adds r1, r1, r2
	movs r2, #0xc8
	bl Trade_Memcpy
	bl sub_08076C18
	ldr r0, _08078008
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08078000: .4byte 0x02024578
_08078004: .4byte 0x0202207C
_08078008: .4byte 0x02031F3C
_0807800C:
	ldr r0, _08078024
	ldr r1, _08078028
	ldr r1, [r1]
	ldr r2, _0807802C
	adds r1, r1, r2
	movs r2, #0xdc
	bl Trade_Memcpy
	ldr r0, _08078030
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08078024: .4byte 0x0202257C
_08078028: .4byte 0x03005AEC
_0807802C: .4byte 0x00002BE0
_08078030: .4byte 0x02031F3C
_08078034:
	cmp r5, #0
	bne _0807803E
	movs r0, #3
	bl sub_08076BB4
_0807803E:
	ldr r0, _08078044
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08078044: .4byte 0x02031F3C
_08078048:
	bl _GetBlockReceivedStatus
	cmp r0, #3
	bne _08078112
	ldr r0, _08078070
	movs r2, #1
	adds r1, r5, #0
	eors r1, r2
	lsls r1, r1, #8
	ldr r2, _08078074
	adds r1, r1, r2
	movs r2, #0xd8
	bl Trade_Memcpy
	bl sub_08076C18
	ldr r0, _08078078
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08078070: .4byte 0x02031E60
_08078074: .4byte 0x0202207C
_08078078: .4byte 0x02031F3C
_0807807C:
	ldr r0, _08078094
	ldr r1, _08078098
	ldr r1, [r1]
	ldr r2, _0807809C
	adds r1, r1, r2
	movs r2, #0xb
	bl Trade_Memcpy
	ldr r0, _080780A0
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_08078094: .4byte 0x0202257C
_08078098: .4byte 0x03005AEC
_0807809C: .4byte 0x000031A8
_080780A0: .4byte 0x02031F3C
_080780A4:
	cmp r5, #0
	bne _080780AE
	movs r0, #4
	bl sub_08076BB4
_080780AE:
	ldr r0, _080780B4
	ldr r1, [r0]
	b _0807810A
	.align 2, 0
_080780B4: .4byte 0x02031F3C
_080780B8:
	bl _GetBlockReceivedStatus
	cmp r0, #3
	bne _08078112
	ldr r4, _080780E0
	ldr r0, [r4]
	adds r0, #0xa9
	movs r2, #1
	adds r1, r5, #0
	eors r1, r2
	lsls r1, r1, #8
	ldr r2, _080780E4
	adds r1, r1, r2
	movs r2, #0xb
	bl Trade_Memcpy
	bl sub_08076C18
	ldr r1, [r4]
	b _0807810A
	.align 2, 0
_080780E0: .4byte 0x02031F3C
_080780E4: .4byte 0x0202207C
_080780E8:
	movs r0, #1
	b _08078114
_080780EC:
	ldr r2, _0807811C
	ldr r1, [r2]
	adds r1, #0xa8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0xa8
	ldrb r0, [r1]
	cmp r0, #0xa
	bls _08078112
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r2]
_0807810A:
	adds r1, #0x69
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08078112:
	movs r0, #0
_08078114:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807811C: .4byte 0x02031F3C
	thumb_func_end shedinja_maker_maybe

	thumb_func_start sub_08078120
sub_08078120: @ 0x08078120
	push {r4, r5, r6, lr}
	sub sp, #0x34
	ldr r5, _080781AC
	ldr r0, [r5]
	adds r0, #0x35
	ldrb r0, [r0]
	movs r4, #0x64
	muls r0, r4, r0
	ldr r1, _080781B0
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	add r6, sp, #0x1c
	adds r0, r6, #0
	mov r1, sp
	bl StringCopy10
	ldr r0, [r5]
	adds r0, #0x7e
	ldrb r0, [r0]
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r4, r0
	ldr r1, _080781B4
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	add r4, sp, #0x28
	adds r0, r4, #0
	mov r1, sp
	bl StringCopy10
	mov r0, sp
	adds r1, r6, #0
	bl StringCopy
	ldr r1, _080781B8
	mov r0, sp
	bl StringAppend
	mov r0, sp
	adds r1, r4, #0
	bl StringAppend
	ldr r1, _080781BC
	mov r0, sp
	bl StringAppend
	ldr r0, [r5]
	adds r0, #0x72
	ldrh r1, [r0]
	lsls r1, r1, #5
	ldr r0, _080781C0
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x18
	bl sub_08079D3C
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080781AC: .4byte 0x02031F3C
_080781B0: .4byte 0x02024190
_080781B4: .4byte 0x020243E8
_080781B8: .4byte 0x08300AAE
_080781BC: .4byte 0x08300AB1
_080781C0: .4byte 0x06010000
	thumb_func_end sub_08078120

	thumb_func_start sub_080781C4
sub_080781C4: @ 0x080781C4
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r2, #1
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _08078248
	ldr r0, _080781EC
	ldrh r1, [r0]
	ldr r0, _080781F0
	cmp r1, r0
	beq _08078228
	cmp r1, r0
	bgt _080781F8
	ldr r0, _080781F4
	cmp r1, r0
	beq _08078218
	b _08078242
	.align 2, 0
_080781EC: .4byte 0x0202207C
_080781F0: .4byte 0x0000BBBB
_080781F4: .4byte 0x0000AABB
_080781F8:
	ldr r0, _0807820C
	cmp r1, r0
	beq _08078238
	ldr r0, _08078210
	cmp r1, r0
	bne _08078242
	ldr r0, _08078214
	ldr r0, [r0]
	adds r0, #0x78
	b _0807823E
	.align 2, 0
_0807820C: .4byte 0x0000BBCC
_08078210: .4byte 0x0000EEAA
_08078214: .4byte 0x02031F3C
_08078218:
	ldr r0, _08078224
	ldr r0, [r0]
	adds r0, #0x78
	strb r2, [r0]
	b _08078242
	.align 2, 0
_08078224: .4byte 0x02031F3C
_08078228:
	ldr r0, _08078234
	ldr r0, [r0]
	adds r0, #0x7a
	strb r2, [r0]
	b _08078242
	.align 2, 0
_08078234: .4byte 0x02031F3C
_08078238:
	ldr r0, _08078270
	ldr r0, [r0]
	adds r0, #0x7a
_0807823E:
	movs r1, #2
	strb r1, [r0]
_08078242:
	movs r0, #0
	bl sub_08076C3C
_08078248:
	movs r2, #2
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080782DA
	ldr r3, _08078274
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	ldrh r1, [r0]
	ldr r0, _08078278
	cmp r1, r0
	beq _080782BC
	cmp r1, r0
	bgt _08078280
	ldr r0, _0807827C
	cmp r1, r0
	beq _080782A0
	b _080782D4
	.align 2, 0
_08078270: .4byte 0x02031F3C
_08078274: .4byte 0x0202207C
_08078278: .4byte 0x0000BBBB
_0807827C: .4byte 0x0000AABB
_08078280:
	ldr r0, _08078294
	cmp r1, r0
	beq _080782CC
	ldr r0, _08078298
	cmp r1, r0
	bne _080782D4
	ldr r0, _0807829C
	ldr r0, [r0]
	adds r0, #0x79
	b _080782D2
	.align 2, 0
_08078294: .4byte 0x0000BBCC
_08078298: .4byte 0x0000EEAA
_0807829C: .4byte 0x02031F3C
_080782A0:
	ldr r2, _080782B8
	ldr r1, [r2]
	movs r4, #0x81
	lsls r4, r4, #1
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, #6
	adds r1, #0x7e
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x79
	b _080782C2
	.align 2, 0
_080782B8: .4byte 0x02031F3C
_080782BC:
	ldr r0, _080782C8
	ldr r0, [r0]
	adds r0, #0x7b
_080782C2:
	movs r1, #1
	strb r1, [r0]
	b _080782D4
	.align 2, 0
_080782C8: .4byte 0x02031F3C
_080782CC:
	ldr r0, _080782E0
	ldr r0, [r0]
	adds r0, #0x7b
_080782D2:
	strb r2, [r0]
_080782D4:
	movs r0, #1
	bl sub_08076C3C
_080782DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080782E0: .4byte 0x02031F3C
	thumb_func_end sub_080781C4

	thumb_func_start sub_080782E4
sub_080782E4: @ 0x080782E4
	push {r4, r5, lr}
	sub sp, #4
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080783C6
	ldr r2, _08078310
	ldrh r1, [r2]
	ldr r0, _08078314
	cmp r1, r0
	beq _080783B0
	cmp r1, r0
	bgt _08078320
	ldr r0, _08078318
	cmp r1, r0
	beq _08078390
	ldr r0, _0807831C
	cmp r1, r0
	beq _0807835C
	b _080783C0
	.align 2, 0
_08078310: .4byte 0x0202207C
_08078314: .4byte 0x0000DDEE
_08078318: .4byte 0x0000CCDD
_0807831C: .4byte 0x0000DDDD
_08078320:
	ldr r0, _08078330
	cmp r1, r0
	beq _08078334
	adds r0, #0x11
	cmp r1, r0
	beq _08078358
	b _080783C0
	.align 2, 0
_08078330: .4byte 0x0000EEBB
_08078334:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #4
	bl sub_08079BD4
	ldr r0, _08078354
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #0xb
	b _080783BE
	.align 2, 0
_08078354: .4byte 0x02031F3C
_08078358:
	movs r0, #5
	b _080783B2
_0807835C:
	ldr r4, _0807838C
	ldr r1, [r4]
	ldrb r0, [r2, #2]
	adds r0, #6
	adds r1, #0x7e
	strb r0, [r1]
	movs r0, #0
	bl rbox_fill_rectangle
	ldr r0, [r4]
	adds r0, #0x35
	ldrb r0, [r0]
	bl sub_08079090
	ldr r0, [r4]
	adds r0, #0x7e
	ldrb r0, [r0]
	bl sub_08079090
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #7
	b _080783BE
	.align 2, 0
_0807838C: .4byte 0x02031F3C
_08078390:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080783AC
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #0xa
	b _080783BE
	.align 2, 0
_080783AC: .4byte 0x02031F3C
_080783B0:
	movs r0, #1
_080783B2:
	bl sub_08079BD4
	ldr r0, _080783DC
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #8
_080783BE:
	strb r1, [r0]
_080783C0:
	movs r0, #0
	bl sub_08076C3C
_080783C6:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080783D4
	movs r0, #1
	bl sub_08076C3C
_080783D4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080783DC: .4byte 0x02031F3C
	thumb_func_end sub_080782E4

	thumb_func_start sub_080783E0
sub_080783E0: @ 0x080783E0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0807843C
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x78
	ldrb r0, [r1]
	cmp r0, #0
	bne _080783F4
	b _08078528
_080783F4:
	adds r0, r2, #0
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #0
	bne _08078400
	b _08078528
_08078400:
	ldrh r1, [r1]
	ldr r0, _08078440
	cmp r1, r0
	bne _08078448
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #6
	strb r0, [r1]
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x80
	movs r4, #0
	ldr r0, _08078444
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r1, [r0]
	adds r0, #0x4d
	strh r1, [r0]
	movs r0, #5
	movs r1, #0
	bl sub_08079A80
	ldr r0, [r6]
	adds r2, r0, #0
	adds r2, #0x79
	strb r4, [r2]
	adds r0, #0x78
	strb r4, [r0]
	b _08078528
	.align 2, 0
_0807843C: .4byte 0x02031F3C
_08078440: .4byte 0x00000101
_08078444: .4byte 0x0000DDDD
_08078448:
	ldr r0, _08078490
	cmp r1, r0
	bne _08078498
	movs r0, #1
	bl sub_08079BD4
	ldr r1, [r6]
	adds r2, r1, #0
	adds r2, #0x80
	movs r4, #0
	movs r3, #0
	ldr r0, _08078494
	strh r0, [r2]
	adds r1, #0x82
	strh r3, [r1]
	movs r0, #5
	movs r1, #0
	bl sub_08079A80
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x7b
	strb r4, [r1]
	adds r0, #0x7a
	strb r4, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x79
	strb r4, [r1]
	adds r0, #0x78
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, #0x6f
	movs r1, #8
	b _08078526
	.align 2, 0
_08078490: .4byte 0x00000201
_08078494: .4byte 0x0000EECC
_08078498:
	movs r0, #0x81
	lsls r0, r0, #1
	cmp r1, r0
	bne _080784E4
	movs r0, #5
	bl sub_08079BD4
	ldr r1, [r6]
	adds r2, r1, #0
	adds r2, #0x80
	movs r4, #0
	movs r3, #0
	ldr r0, _080784E0
	strh r0, [r2]
	adds r1, #0x82
	strh r3, [r1]
	movs r0, #5
	movs r1, #0
	bl sub_08079A80
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x7b
	strb r4, [r1]
	adds r0, #0x7a
	strb r4, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x79
	strb r4, [r1]
	adds r0, #0x78
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, #0x6f
	movs r1, #8
	b _08078526
	.align 2, 0
_080784E0: .4byte 0x0000DDEE
_080784E4:
	ldr r0, _080785C8
	cmp r1, r0
	bne _08078528
	adds r1, r2, #0
	adds r1, #0x80
	movs r5, #0
	movs r4, #0
	ldr r0, _080785CC
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x82
	strh r4, [r0]
	movs r0, #5
	movs r1, #0
	bl sub_08079A80
	movs r0, #1
	rsbs r0, r0, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x79
	strb r5, [r1]
	adds r0, #0x78
	strb r5, [r0]
	ldr r0, [r6]
	adds r0, #0x6f
	movs r1, #0xb
_08078526:
	strb r1, [r0]
_08078528:
	ldr r5, _080785D0
	ldr r3, [r5]
	adds r1, r3, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	beq _080785C0
	adds r0, r3, #0
	adds r0, #0x7b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080785C0
	ldrh r1, [r1]
	ldr r0, _080785D4
	cmp r1, r0
	bne _08078576
	adds r1, r3, #0
	adds r1, #0x80
	movs r4, #0
	movs r2, #0
	ldr r0, _080785D8
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x82
	strh r2, [r0]
	movs r0, #5
	movs r1, #0
	bl sub_08079A80
	ldr r0, [r5]
	adds r0, #0x7a
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, #0x7b
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, #0x6f
	movs r1, #9
	strb r1, [r0]
_08078576:
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	cmp r0, #2
	beq _0807858C
	adds r0, r1, #0
	adds r0, #0x7b
	ldrb r0, [r0]
	cmp r0, #2
	bne _080785C0
_0807858C:
	movs r0, #1
	bl sub_08079BD4
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x80
	movs r4, #0
	movs r3, #0
	ldr r0, _080785DC
	strh r0, [r2]
	adds r1, #0x82
	strh r3, [r1]
	movs r0, #5
	movs r1, #0
	bl sub_08079A80
	ldr r0, [r5]
	adds r0, #0x7a
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, #0x7b
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, #0x6f
	movs r1, #8
	strb r1, [r0]
_080785C0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080785C8: .4byte 0x00000202
_080785CC: .4byte 0x0000EEBB
_080785D0: .4byte 0x02031F3C
_080785D4: .4byte 0x00000101
_080785D8: .4byte 0x0000CCDD
_080785DC: .4byte 0x0000DDEE
	thumb_func_end sub_080783E0

	thumb_func_start sub_080785E0
sub_080785E0: @ 0x080785E0
	push {lr}
	strh r1, [r0]
	strh r2, [r0, #2]
	movs r0, #5
	movs r1, #0
	bl sub_08079A80
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080785E0

	thumb_func_start sub_080785F4
sub_080785F4: @ 0x080785F4
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08078614
	ldr r0, [r0]
	adds r0, #0x80
	adds r1, r3, #0
	bl sub_080785E0
	pop {r0}
	bx r0
	.align 2, 0
_08078614: .4byte 0x02031F3C
	thumb_func_end sub_080785F4

	thumb_func_start sub_08078618
sub_08078618: @ 0x08078618
	push {r4, lr}
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl _GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08078640
	cmp r4, #0
	bne _0807863A
	movs r0, #0
	bl sub_080781C4
	b _08078640
_0807863A:
	adds r0, r4, #0
	bl sub_080782E4
_08078640:
	cmp r4, #0
	bne _08078648
	bl sub_080783E0
_08078648:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08078618

	thumb_func_start sub_08078650
sub_08078650: @ 0x08078650
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r6, #0
	movs r5, #0
	ldr r2, _08078684
	ldr r3, [r2]
	ldr r4, _08078688
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r3, #0x38
	adds r2, r2, r1
	adds r2, r2, r4
_08078676:
	ldrb r1, [r2]
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807868C
	adds r6, r1, #0
	b _08078694
	.align 2, 0
_08078684: .4byte 0x02031F3C
_08078688: .4byte 0x083008E4
_0807868C:
	adds r2, #1
	adds r5, #1
	cmp r5, #5
	ble _08078676
_08078694:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08078650

	thumb_func_start TradeMenuMoveCursor
TradeMenuMoveCursor: @ 0x0807869C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r7]
	bl sub_08078650
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xc
	bne _080786F4
	ldr r5, _080786EC
	ldr r0, [r5]
	adds r0, #0x34
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _080786F0
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	ldr r2, [r5]
	adds r2, #0x34
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xe8
	strh r1, [r0, #0x20]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xa0
	strh r1, [r0, #0x22]
	b _0807873C
	.align 2, 0
_080786EC: .4byte 0x02031F3C
_080786F0: .4byte 0x020205AC
_080786F4:
	ldr r4, _08078750
	ldr r0, [r4]
	adds r0, #0x34
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _08078754
	adds r0, r0, r5
	movs r1, #0
	bl StartSpriteAnim
	ldr r4, [r4]
	adds r4, #0x34
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r2, _08078758
	lsls r3, r6, #1
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x20
	strh r0, [r1, #0x20]
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r2, #1
	adds r3, r3, r2
	ldrb r0, [r3]
	lsls r0, r0, #3
	strh r0, [r1, #0x22]
_0807873C:
	ldrb r0, [r7]
	cmp r0, r6
	beq _08078748
	movs r0, #5
	bl PlaySE
_08078748:
	strb r6, [r7]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078750: .4byte 0x02031F3C
_08078754: .4byte 0x020205AC
_08078758: .4byte 0x08300A1C
	thumb_func_end TradeMenuMoveCursor

	thumb_func_start sub_0807875C
sub_0807875C: @ 0x0807875C
	push {r4, lr}
	movs r0, #0
	bl sub_08079BD4
	ldr r4, _08078788
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #0x64
	strb r1, [r0]
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08078790
	ldr r0, _0807878C
	ldr r1, [r4]
	adds r1, #0x35
	ldrb r1, [r1]
	bl sub_080785F4
	b _08078798
	.align 2, 0
_08078788: .4byte 0x02031F3C
_0807878C: .4byte 0x0000AABB
_08078790:
	ldr r0, [r4]
	adds r0, #0x78
	movs r1, #1
	strb r1, [r0]
_08078798:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807875C

	thumb_func_start sub_080787A0
sub_080787A0: @ 0x080787A0
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _080787C0
	ldrh r1, [r0, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080787C8
	ldr r0, _080787C4
	ldr r0, [r0]
	adds r0, #0x35
	movs r1, #0
	bl TradeMenuMoveCursor
	b _08078814
	.align 2, 0
_080787C0: .4byte 0x03002360
_080787C4: .4byte 0x02031F3C
_080787C8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080787E4
	ldr r0, _080787E0
	ldr r0, [r0]
	adds r0, #0x35
	movs r1, #1
	bl TradeMenuMoveCursor
	b _08078814
	.align 2, 0
_080787E0: .4byte 0x02031F3C
_080787E4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08078800
	ldr r0, _080787FC
	ldr r0, [r0]
	adds r0, #0x35
	movs r1, #2
	bl TradeMenuMoveCursor
	b _08078814
	.align 2, 0
_080787FC: .4byte 0x02031F3C
_08078800:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08078814
	ldr r0, _08078888
	ldr r0, [r0]
	adds r0, #0x35
	movs r1, #3
	bl TradeMenuMoveCursor
_08078814:
	ldr r0, _0807888C
	ldrh r1, [r0, #0x2e]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080788EA
	movs r0, #5
	bl PlaySE
	ldr r4, _08078888
	ldr r0, [r4]
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08078894
	movs r0, #1
	movs r1, #1
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #1
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _08078890
	str r0, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0x10
	movs r3, #2
	bl sub_08198964
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_081984B0
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #1
	strb r1, [r0]
	b _080788EA
	.align 2, 0
_08078888: .4byte 0x02031F3C
_0807888C: .4byte 0x03002360
_08078890: .4byte 0x08300B28
_08078894:
	cmp r0, #0xb
	bhi _080788B2
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #2
	strb r1, [r0]
	b _080788EA
_080788B2:
	cmp r0, #0xc
	bne _080788EA
	ldr r0, _080788F4
	str r5, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl sub_08198C08
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #4
	strb r1, [r0]
	ldr r0, _080788F8
	ldr r0, [r0, #0x10]
	ldr r1, [r4]
	adds r1, #0x72
	ldrh r1, [r1]
	lsls r1, r1, #5
	ldr r2, _080788FC
	adds r1, r1, r2
	movs r2, #0x18
	bl sub_08079D3C
_080788EA:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080788F4: .4byte 0x08300CAC
_080788F8: .4byte 0x08300AFC
_080788FC: .4byte 0x06010000
	thumb_func_end sub_080787A0

	thumb_func_start sub_08078900
sub_08078900: @ 0x08078900
	push {lr}
	bl sub_080799AC
	ldr r3, _08078948
	ldr r0, [r3]
	adds r0, #0x6f
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0807894C
	ldr r0, [r3]
	adds r0, #0x34
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08078950
	ldr r0, [r0, #4]
	ldr r1, [r3]
	adds r1, #0x72
	ldrh r1, [r1]
	lsls r1, r1, #5
	ldr r2, _08078954
	adds r1, r1, r2
	movs r2, #0x18
	bl sub_08079D3C
	pop {r0}
	bx r0
	.align 2, 0
_08078948: .4byte 0x02031F3C
_0807894C: .4byte 0x020205AC
_08078950: .4byte 0x08300AFC
_08078954: .4byte 0x06010000
	thumb_func_end sub_08078900

	thumb_func_start sub_08078958
sub_08078958: @ 0x08078958
	push {lr}
	sub sp, #4
	bl Menu_ProcessInputNoWrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0807897A
	cmp r0, r1
	ble _08078A32
	cmp r0, #0
	beq _08078986
	cmp r0, #1
	beq _080789A4
	b _08078A32
_0807897A:
	movs r0, #5
	bl PlaySE
	bl sub_08078900
	b _08078A32
_08078986:
	str r0, [sp]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080789A0
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #2
	b _08078A30
	.align 2, 0
_080789A0: .4byte 0x02031F3C
_080789A4:
	ldr r0, _080789C4
	ldr r1, _080789C8
	ldrb r1, [r1]
	ldr r2, _080789CC
	ldr r2, [r2]
	adds r2, #0x35
	ldrb r2, [r2]
	bl sub_0807A064
	cmp r0, #5
	bhi _08078A32
	lsls r0, r0, #2
	ldr r1, _080789D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080789C4: .4byte 0x02024190
_080789C8: .4byte 0x0202418D
_080789CC: .4byte 0x02031F3C
_080789D0: .4byte 0x080789D4
_080789D4: @ jump table
	.4byte _080789EC @ case 0
	.4byte _08078A14 @ case 1
	.4byte _08078A1A @ case 2
	.4byte _08078A20 @ case 3
	.4byte _08078A1A @ case 4
	.4byte _08078A20 @ case 5
_080789EC:
	bl sub_0807875C
	ldr r2, _08078A0C
	ldr r0, _08078A10
	ldr r0, [r0]
	adds r0, #0x34
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	b _08078A30
	.align 2, 0
_08078A0C: .4byte 0x020205AC
_08078A10: .4byte 0x02031F3C
_08078A14:
	movs r0, #3
	movs r1, #3
	b _08078A24
_08078A1A:
	movs r0, #3
	movs r1, #6
	b _08078A24
_08078A20:
	movs r0, #3
	movs r1, #7
_08078A24:
	bl sub_08079A80
	ldr r0, _08078A38
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #8
_08078A30:
	strb r1, [r0]
_08078A32:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08078A38: .4byte 0x02031F3C
	thumb_func_end sub_08078958

	thumb_func_start sub_08078A3C
sub_08078A3C: @ 0x08078A3C
	push {lr}
	ldr r0, _08078A60
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08078A52
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08078A5C
_08078A52:
	movs r0, #5
	bl PlaySE
	bl sub_08078900
_08078A5C:
	pop {r0}
	bx r0
	.align 2, 0
_08078A60: .4byte 0x03002360
	thumb_func_end sub_08078A3C

	thumb_func_start sub_08078A64
sub_08078A64: @ 0x08078A64
	push {lr}
	sub sp, #4
	ldr r0, _08078A9C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08078ACC
	ldr r0, _08078AA0
	ldr r0, [r0]
	adds r3, r0, #0
	adds r3, #0x35
	ldrb r2, [r3]
	cmp r2, #5
	bhi _08078AAC
	ldr r1, _08078AA4
	ldrb r2, [r3]
	adds r0, #0x36
	ldrb r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _08078AA8
	str r0, [sp]
	movs r0, #1
	bl ShowPokemonSummaryScreen
	b _08078AC8
	.align 2, 0
_08078A9C: .4byte 0x02037C74
_08078AA0: .4byte 0x02031F3C
_08078AA4: .4byte 0x02024190
_08078AA8: .4byte 0x08077559
_08078AAC:
	ldr r1, _08078AD4
	subs r2, #6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, #0x37
	ldrb r3, [r0]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _08078AD8
	str r0, [sp]
	movs r0, #1
	bl ShowPokemonSummaryScreen
_08078AC8:
	bl FreeAllWindowBuffers
_08078ACC:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08078AD4: .4byte 0x020243E8
_08078AD8: .4byte 0x08077559
	thumb_func_end sub_08078A64

	thumb_func_start sub_08078ADC
sub_08078ADC: @ 0x08078ADC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	movs r5, #0
	movs r3, #0
	ldr r7, _08078B64
	cmp r5, r1
	bge _08078B0A
_08078AF6:
	cmp r2, r3
	beq _08078B04
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r5, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08078B04:
	adds r3, #1
	cmp r3, r1
	blt _08078AF6
_08078B0A:
	adds r0, r6, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0x64
	muls r0, r6, r0
	adds r7, r0, r7
	adds r0, r7, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xcd
	lsls r0, r0, #1
	cmp r4, r0
	beq _08078B34
	cmp r4, #0x97
	bne _08078B40
_08078B34:
	adds r0, r7, #0
	movs r1, #0x50
	bl GetMonData
	cmp r0, #0
	beq _08078B60
_08078B40:
	bl IsNationalPokedexEnabled
	cmp r0, #0
	bne _08078B6C
	ldr r0, _08078B68
	ldr r0, [r0]
	adds r0, #0x57
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _08078B60
	adds r0, r4, #0
	bl IsSpeciesInHoennDex
	cmp r0, #0
	bne _08078B6C
_08078B60:
	movs r0, #2
	b _08078B74
	.align 2, 0
_08078B64: .4byte 0x020243E8
_08078B68: .4byte 0x02031F3C
_08078B6C:
	cmp r5, #0
	beq _08078B72
	movs r5, #1
_08078B72:
	adds r0, r5, #0
_08078B74:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08078ADC

	thumb_func_start sub_08078B7C
sub_08078B7C: @ 0x08078B7C
	push {r4, r5, lr}
	sub sp, #0xc
	movs r2, #0
	ldr r0, _08078BD4
	ldr r1, [r0]
	adds r3, r1, #0
	adds r3, #0x36
	adds r5, r0, #0
	ldrb r0, [r3]
	cmp r2, r0
	bge _08078BA8
	adds r4, r1, #0
	adds r4, #0x45
_08078B96:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrb r0, [r3]
	cmp r2, r0
	blt _08078B96
_08078BA8:
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r1, [r1]
	adds r2, r0, #0
	adds r2, #0x35
	ldrb r2, [r2]
	adds r0, #0x7e
	ldrb r3, [r0]
	mov r0, sp
	bl sub_08078ADC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08078BF0
	cmp r0, #1
	bgt _08078BD8
	cmp r0, #0
	beq _08078BDE
	b _08078C14
	.align 2, 0
_08078BD4: .4byte 0x02031F3C
_08078BD8:
	cmp r0, #2
	beq _08078C08
	b _08078C14
_08078BDE:
	movs r0, #3
	movs r1, #3
	bl sub_08079A80
	ldr r0, _08078BEC
	b _08078BFA
	.align 2, 0
_08078BEC: .4byte 0x0000BBCC
_08078BF0:
	movs r0, #3
	movs r1, #1
	bl sub_08079A80
	ldr r0, _08078C04
_08078BFA:
	movs r1, #0
	bl sub_080785F4
	b _08078C14
	.align 2, 0
_08078C04: .4byte 0x0000BBBB
_08078C08:
	movs r0, #3
	movs r1, #8
	bl sub_08079A80
	movs r0, #1
	b _08078C16
_08078C14:
	movs r0, #0
_08078C16:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08078B7C

	thumb_func_start sub_08078C20
sub_08078C20: @ 0x08078C20
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08078C42
	cmp r1, #0
	bgt _08078C3C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08078C70
	b _08078C98
_08078C3C:
	cmp r1, #1
	beq _08078C70
	b _08078C98
_08078C42:
	bl sub_08078B7C
	cmp r0, #0
	bne _08078C58
	ldr r0, _08078C54
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #0x64
	b _08078C60
	.align 2, 0
_08078C54: .4byte 0x02031F3C
_08078C58:
	ldr r0, _08078C6C
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #0x11
_08078C60:
	strb r1, [r0]
	movs r0, #0x11
	bl PutWindowTilemap
	b _08078C98
	.align 2, 0
_08078C6C: .4byte 0x02031F3C
_08078C70:
	movs r0, #3
	movs r1, #1
	bl sub_08079A80
	bl sub_08076BC4
	cmp r0, #0
	beq _08078C88
	ldr r0, _08078C9C
	movs r1, #0
	bl sub_080785F4
_08078C88:
	ldr r0, _08078CA0
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #0x64
	strb r1, [r0]
	movs r0, #0x11
	bl PutWindowTilemap
_08078C98:
	pop {r0}
	bx r0
	.align 2, 0
_08078C9C: .4byte 0x0000BBCC
_08078CA0: .4byte 0x02031F3C
	thumb_func_end sub_08078C20

	thumb_func_start sub_08078CA4
sub_08078CA4: @ 0x08078CA4
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _08078CE8
	ldr r0, [r0]
	adds r0, #0x37
	ldrb r0, [r0]
	subs r0, #4
	cmp r5, r0
	bge _08078CE0
	movs r6, #0xc0
	lsls r6, r6, #0x14
_08078CBA:
	lsrs r4, r6, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #1
	bl CopyWindowToVram
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r6, r6, r0
	adds r5, #1
	ldr r0, _08078CE8
	ldr r0, [r0]
	adds r0, #0x37
	ldrb r0, [r0]
	subs r0, #4
	cmp r5, r0
	blt _08078CBA
_08078CE0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078CE8: .4byte 0x02031F3C
	thumb_func_end sub_08078CA4

	thumb_func_start sub_08078CEC
sub_08078CEC: @ 0x08078CEC
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08078D0E
	cmp r1, #0
	bgt _08078D08
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08078D54
	b _08078D5E
_08078D08:
	cmp r1, #1
	beq _08078D54
	b _08078D5E
_08078D0E:
	movs r0, #4
	bl sub_08079BD4
	ldr r0, _08078D48
	movs r1, #0
	bl sub_080785F4
	ldr r2, _08078D4C
	ldr r3, _08078D50
	ldr r0, [r3]
	adds r0, #0x34
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
	ldr r0, [r3]
	adds r0, #0x6f
	movs r1, #0x64
	strb r1, [r0]
	bl sub_08078CA4
	b _08078D5E
	.align 2, 0
_08078D48: .4byte 0x0000EEAA
_08078D4C: .4byte 0x020205AC
_08078D50: .4byte 0x02031F3C
_08078D54:
	movs r0, #5
	bl PlaySE
	bl sub_08078900
_08078D5E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08078CEC

	thumb_func_start sub_08078D64
sub_08078D64: @ 0x08078D64
	push {r4, lr}
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078D8C
	movs r0, #0
	bl rbox_fill_rectangle
	ldr r4, _08078D9C
	ldr r0, [r4]
	adds r0, #0x35
	ldrb r0, [r0]
	bl sub_08079090
	ldr r0, [r4]
	adds r0, #0x7e
	ldrb r0, [r0]
	bl sub_08079090
_08078D8C:
	ldr r0, _08078D9C
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #7
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078D9C: .4byte 0x02031F3C
	thumb_func_end sub_08078D64

	thumb_func_start sub_08078DA0
sub_08078DA0: @ 0x08078DA0
	push {r4, lr}
	ldr r4, _08078DC4
	ldr r0, [r4]
	adds r0, #0x74
	ldrh r1, [r0]
	ldr r0, _08078DC8
	cmp r1, r0
	bne _08078DBC
	bl sub_08078120
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #0xe
	strb r1, [r0]
_08078DBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078DC4: .4byte 0x02031F3C
_08078DC8: .4byte 0x00000505
	thumb_func_end sub_08078DA0

	thumb_func_start Wait2SecondsAndCreateYesNoMenu
Wait2SecondsAndCreateYesNoMenu: @ 0x08078DCC
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _08078E14
	ldr r1, [r4]
	adds r1, #0xa8
	ldrb r0, [r1]
	adds r0, #1
	movs r5, #0
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0xa8
	ldrb r0, [r0]
	cmp r0, #0x78
	bls _08078E0C
	ldr r0, _08078E18
	movs r1, #1
	str r1, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl sub_08198C08
	ldr r0, [r4]
	adds r0, #0xa8
	strb r5, [r0]
	ldr r0, [r4]
	adds r0, #0x6f
	movs r1, #3
	strb r1, [r0]
_08078E0C:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078E14: .4byte 0x02031F3C
_08078E18: .4byte 0x08300CAC
	thumb_func_end Wait2SecondsAndCreateYesNoMenu

	thumb_func_start sub_08078E1C
sub_08078E1C: @ 0x08078E1C
	push {r4, r5, r6, lr}
	ldr r0, _08078E98
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08078E90
	movs r0, #5
	bl PlaySE
	movs r0, #0
	bl rbox_fill_rectangle
	movs r0, #1
	bl rbox_fill_rectangle
	movs r6, #0
	movs r5, #0xe0
	lsls r5, r5, #0x14
_08078E42:
	lsrs r4, r5, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	bl rbox_fill_rectangle
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r6, #1
	cmp r6, #3
	ble _08078E42
	movs r0, #0
	bl sub_080799C0
	movs r0, #1
	bl sub_080799C0
	ldr r2, _08078E9C
	ldr r0, [r2]
	adds r0, #0x6f
	movs r1, #0
	strb r1, [r0]
	ldr r3, _08078EA0
	ldr r0, [r2]
	adds r0, #0x34
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
_08078E90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078E98: .4byte 0x03002360
_08078E9C: .4byte 0x02031F3C
_08078EA0: .4byte 0x020205AC
	thumb_func_end sub_08078E1C

	thumb_func_start sub_08078EA4
sub_08078EA4: @ 0x08078EA4
	push {lr}
	ldr r0, _08078EC0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08078ED8
	ldr r0, _08078EC4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08078EC8
	bl sub_0800A8D4
	b _08078ECE
	.align 2, 0
_08078EC0: .4byte 0x02037C74
_08078EC4: .4byte 0x0300319C
_08078EC8:
	movs r0, #0xc
	bl sub_0800A7B8
_08078ECE:
	ldr r0, _08078EDC
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #0xc
	strb r1, [r0]
_08078ED8:
	pop {r0}
	bx r0
	.align 2, 0
_08078EDC: .4byte 0x02031F3C
	thumb_func_end sub_08078EA4

	thumb_func_start sub_08078EE0
sub_08078EE0: @ 0x08078EE0
	push {lr}
	ldr r0, _08078F1C
	ldrb r0, [r0]
	cmp r0, #0
	beq _08078F2C
	bl sub_08076BC4
	cmp r0, #0
	beq _08078F4E
	bl sub_08079AD4
	cmp r0, #0
	bne _08078F4E
	ldr r0, _08078F20
	ldr r0, [r0]
	bl Free
	ldr r0, _08078F24
	ldr r0, [r0]
	bl Free
	bl FreeAllWindowBuffers
	bl DestroyWirelessStatusIndicatorSprite
	ldr r0, _08078F28
	bl SetMainCallback2
	b _08078F4E
	.align 2, 0
_08078F1C: .4byte 0x0300319C
_08078F20: .4byte 0x02031E28
_08078F24: .4byte 0x02031F3C
_08078F28: .4byte 0x08085AA9
_08078F2C:
	ldr r0, _08078F54
	ldrb r0, [r0]
	cmp r0, #0
	bne _08078F4E
	ldr r0, _08078F58
	ldr r0, [r0]
	bl Free
	ldr r0, _08078F5C
	ldr r0, [r0]
	bl Free
	bl FreeAllWindowBuffers
	ldr r0, _08078F60
	bl SetMainCallback2
_08078F4E:
	pop {r0}
	bx r0
	.align 2, 0
_08078F54: .4byte 0x030031C4
_08078F58: .4byte 0x02031E28
_08078F5C: .4byte 0x02031F3C
_08078F60: .4byte 0x08085AA9
	thumb_func_end sub_08078EE0

	thumb_func_start sub_08078F64
sub_08078F64: @ 0x08078F64
	push {lr}
	movs r0, #0
	bl sub_0800FF8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078F88
	bl sub_08079AD4
	cmp r0, #0
	bne _08078F88
	bl sub_0800A8D4
	ldr r0, _08078F8C
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #0xd
	strb r1, [r0]
_08078F88:
	pop {r0}
	bx r0
	.align 2, 0
_08078F8C: .4byte 0x02031F3C
	thumb_func_end sub_08078F64

	thumb_func_start sub_08078F90
sub_08078F90: @ 0x08078F90
	push {lr}
	ldr r0, _08078FB4
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08078FB0
	ldr r0, _08078FB8
	movs r1, #0
	bl sub_080785F4
	ldr r0, _08078FBC
	ldr r0, [r0]
	adds r0, #0x6f
	movs r1, #0x64
	strb r1, [r0]
_08078FB0:
	pop {r0}
	bx r0
	.align 2, 0
_08078FB4: .4byte 0x03002360
_08078FB8: .4byte 0x0000BBCC
_08078FBC: .4byte 0x02031F3C
	thumb_func_end sub_08078F90

	thumb_func_start sub_08078FC0
sub_08078FC0: @ 0x08078FC0
	push {lr}
	ldr r0, _08078FD8
	ldr r0, [r0]
	adds r0, #0x6f
	ldrb r0, [r0]
	cmp r0, #0x11
	bhi _0807908C
	lsls r0, r0, #2
	ldr r1, _08078FDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078FD8: .4byte 0x02031F3C
_08078FDC: .4byte 0x08078FE0
_08078FE0: @ jump table
	.4byte _08079028 @ case 0
	.4byte _0807902E @ case 1
	.4byte _08079034 @ case 2
	.4byte _0807903A @ case 3
	.4byte _08079040 @ case 4
	.4byte _0807908C @ case 5
	.4byte _08079046 @ case 6
	.4byte _0807904C @ case 7
	.4byte _08079052 @ case 8
	.4byte _08079058 @ case 9
	.4byte _0807905E @ case 10
	.4byte _08079064 @ case 11
	.4byte _0807906A @ case 12
	.4byte _08079070 @ case 13
	.4byte _08079076 @ case 14
	.4byte _0807907C @ case 15
	.4byte _08079082 @ case 16
	.4byte _08079088 @ case 17
_08079028:
	bl sub_080787A0
	b _0807908C
_0807902E:
	bl sub_08078958
	b _0807908C
_08079034:
	bl sub_08078A64
	b _0807908C
_0807903A:
	bl sub_08078C20
	b _0807908C
_08079040:
	bl sub_08078CEC
	b _0807908C
_08079046:
	bl sub_08078D64
	b _0807908C
_0807904C:
	bl sub_08078DA0
	b _0807908C
_08079052:
	bl sub_08078E1C
	b _0807908C
_08079058:
	bl sub_08077AF8
	b _0807908C
_0807905E:
	bl sub_08077B34
	b _0807908C
_08079064:
	bl sub_08078EA4
	b _0807908C
_0807906A:
	bl sub_08078EE0
	b _0807908C
_08079070:
	bl sub_08077B90
	b _0807908C
_08079076:
	bl Wait2SecondsAndCreateYesNoMenu
	b _0807908C
_0807907C:
	bl sub_08078A3C
	b _0807908C
_08079082:
	bl sub_08078F64
	b _0807908C
_08079088:
	bl sub_08078F90
_0807908C:
	pop {r0}
	bx r0
	thumb_func_end sub_08078FC0

	thumb_func_start sub_08079090
sub_08079090: @ 0x08079090
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	movs r1, #6
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, _080790C4
	ldr r0, [r3]
	adds r0, #0x74
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _080790BC
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, #0x76
	adds r0, r0, r2
	strb r4, [r0]
_080790BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080790C4: .4byte 0x02031F3C
	thumb_func_end sub_08079090

	thumb_func_start sub_080790C8
sub_080790C8: @ 0x080790C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x5c
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08079114
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0x76
	adds r0, r0, r7
	ldrb r0, [r0]
	movs r1, #1
	str r1, [sp, #0x50]
	cmp r0, #5
	bhi _080790F0
	movs r2, #0
	str r2, [sp, #0x50]
_080790F0:
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r0, r4, #0
	adds r0, #0x74
	adds r3, r0, r7
	ldrb r0, [r3]
	cmp r0, #2
	bne _0807910A
	b _080792A0
_0807910A:
	cmp r0, #2
	bgt _08079118
	cmp r0, #1
	beq _08079126
	b _08079454
	.align 2, 0
_08079114: .4byte 0x02031F3C
_08079118:
	cmp r0, #3
	bne _0807911E
	b _080792D8
_0807911E:
	cmp r0, #4
	bne _08079124
	b _0807941C
_08079124:
	b _08079454
_08079126:
	movs r5, #0
	adds r1, r4, #0
	adds r1, #0x36
	adds r1, r1, r7
	ldr r0, [sp, #0x50]
	lsls r0, r0, #1
	mov r8, r0
	lsls r6, r7, #1
	lsls r2, r7, #4
	str r2, [sp, #0x58]
	movs r0, #0
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0807917C
	ldr r0, _0807928C
	mov sb, r0
	ldr r4, _08079290
	ldr r0, [sp, #0x50]
	add r0, r8
	lsls r2, r0, #1
	movs r3, #4
_08079150:
	ldr r0, [r4]
	adds r1, r5, r2
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4]
	adds r0, #0x36
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r5, r0
	blo _08079150
_0807917C:
	movs r5, #0
	adds r0, r6, r7
	lsls r0, r0, #1
	adds r4, r0, #2
_08079184:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ClearWindowTilemap
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08079184
	ldr r1, _08079290
	mov sb, r1
	ldr r0, [r1]
	ldr r6, [sp, #0x50]
	add r6, r8
	lsls r3, r6, #1
	add sl, r3
	adds r0, #0x28
	add r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0807928C
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	mov r0, sb
	ldr r4, [r0]
	adds r4, #0x28
	add r4, sl
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807928C
	adds r0, r0, r1
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _0807928C
	adds r2, r2, r0
	ldr r5, _08079294
	lsls r6, r6, #2
	adds r0, r6, r5
	ldrb r0, [r0]
	adds r3, #1
	lsls r3, r3, #1
	adds r3, r3, r5
	ldrb r1, [r3]
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #3
	adds r0, #0xe
	strh r0, [r2, #0x32]
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _0807928C
	adds r1, r1, r2
	adds r5, #1
	adds r6, r6, r5
	ldrb r0, [r6]
	lsls r0, r0, #3
	subs r0, #0xc
	strh r0, [r1, #0x36]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _08079298
	bl StoreSpriteCallbackInData6
	mov r0, sb
	ldr r1, [r0]
	adds r1, #0x74
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0x28
	add r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0807928C
	adds r0, r0, r2
	bl sub_080A66B4
	ldr r1, _0807929C
	ldr r0, [sp, #0x58]
	subs r2, r0, r7
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r1, [sp, #0x50]
	cmp r1, #0
	beq _08079284
	b _08079454
_08079284:
	bl sub_080799AC
	b _08079454
	.align 2, 0
_0807928C: .4byte 0x020205AC
_08079290: .4byte 0x02031F3C
_08079294: .4byte 0x08300A1C
_08079298: .4byte 0x080D28B5
_0807929C: .4byte 0x082FEDCA
_080792A0:
	ldr r2, _080792D0
	ldr r1, [sp, #0x50]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	adds r1, r4, #0
	adds r1, #0x28
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _080792D4
	cmp r1, r0
	beq _080792C8
	b _08079454
_080792C8:
	movs r0, #3
	strb r0, [r3]
	b _08079454
	.align 2, 0
_080792D0: .4byte 0x020205AC
_080792D4: .4byte 0x080D28B5
_080792D8:
	ldr r1, _08079404
	ldr r0, [sp, #0x50]
	lsls r2, r0, #4
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	movs r0, #0
	mov sb, r0
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	ldr r6, _08079408
	ldr r1, _0807940C
	ldr r4, [r1]
	ldr r2, [sp, #0x50]
	lsls r3, r2, #1
	adds r3, r3, r2
	lsls r1, r3, #1
	mov r2, sl
	adds r0, r2, r1
	adds r4, #0x28
	adds r4, r4, r0
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldr r5, _08079410
	lsls r3, r3, #2
	adds r0, r3, r5
	ldrb r0, [r0]
	adds r1, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrb r1, [r1]
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #3
	adds r0, #0xe
	strh r0, [r2, #0x20]
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r5, #1
	adds r3, r3, r5
	ldrb r0, [r3]
	lsls r0, r0, #3
	subs r0, #0xc
	strh r0, [r1, #0x22]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, sb
	strh r1, [r0, #0x24]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r2, sb
	strh r2, [r0, #0x26]
	add r0, sp, #0x14
	ldr r1, [sp, #0x50]
	mov r2, sl
	bl sub_0807946C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r4, r7, #1
	adds r5, r4, #0
	adds r5, #0xe
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r6, _08079414
	str r6, [sp]
	mov r0, sb
	str r0, [sp, #4]
	add r1, sp, #0x14
	str r1, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl AddTextPrinterParameterized3
	mov r2, sp
	adds r2, #0x28
	str r2, [sp, #0x54]
	adds r0, r2, #0
	ldr r1, [sp, #0x50]
	mov r2, sl
	bl sub_08079564
	adds r4, #0xf
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r6, [sp]
	mov r0, sb
	str r0, [sp, #4]
	ldr r0, _08079418
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl AddTextPrinterParameterized3
	mov r1, sb
	str r1, [sp]
	str r1, [sp, #4]
	str r6, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x54]
	str r2, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x18
	movs r3, #0
	bl AddTextPrinterParameterized4
	adds r0, r5, #0
	bl PutWindowTilemap
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _0807940C
	ldr r1, [r0]
	b _0807944A
	.align 2, 0
_08079404: .4byte 0x082FEBCC
_08079408: .4byte 0x020205AC
_0807940C: .4byte 0x02031F3C
_08079410: .4byte 0x08300A1C
_08079414: .4byte 0x08300C00
_08079418: .4byte 0x08300A9B
_0807941C:
	ldr r0, _08079464
	lsls r1, r7, #1
	adds r4, r1, r0
	ldrb r2, [r4]
	adds r2, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, #1
	adds r1, r1, r0
	ldrb r3, [r1]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r0, [r4]
	str r0, [sp]
	ldrb r0, [r1]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, sl
	bl sub_08079740
	ldr r2, _08079468
	ldr r1, [r2]
_0807944A:
	adds r1, #0x74
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08079454:
	add sp, #0x5c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079464: .4byte 0x08300D40
_08079468: .4byte 0x02031F3C
	thumb_func_end sub_080790C8

	thumb_func_start sub_0807946C
sub_0807946C: @ 0x0807946C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	cmp r7, #0
	bne _08079494
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _08079490
	b _0807949C
	.align 2, 0
_08079490: .4byte 0x02024190
_08079494:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _0807952C
_0807949C:
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #2
	mov r2, sp
	bl GetMonData
	adds r0, r5, #0
	mov r1, sp
	bl StringCopy10
	adds r0, r4, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08079530
	mov sl, r0
	ldr r4, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r6, r0, r1
	adds r4, #0x51
	adds r4, r4, r6
	ldrb r0, [r4]
	cmp r0, #0
	bne _080794F6
	adds r0, r5, #0
	mov r1, r8
	bl AppendGenderSymbol
_080794F6:
	ldr r1, _08079534
	adds r0, r5, #0
	bl StringAppend
	mov r1, sl
	ldr r0, [r1]
	adds r0, #0x51
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807953C
	ldr r1, _08079538
	adds r0, r5, #0
	bl StringAppend
	mov r0, sp
	mov r1, sb
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	adds r0, r5, #0
	mov r1, sp
	bl StringAppend
	b _08079544
	.align 2, 0
_0807952C: .4byte 0x020243E8
_08079530: .4byte 0x02031F3C
_08079534: .4byte 0x08300AA0
_08079538: .4byte 0x08300AA2
_0807953C:
	ldr r1, _08079560
	adds r0, r5, #0
	bl StringAppend
_08079544:
	adds r0, r5, #0
	bl StringLength
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08079560: .4byte 0x08300AA5
	thumb_func_end sub_0807946C

	thumb_func_start sub_08079564
sub_08079564: @ 0x08079564
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _080795AC
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r2, r0
	adds r1, #0x51
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807961C
	movs r4, #0
	movs r0, #0x64
	adds r5, r2, #0
	muls r5, r0, r5
	ldr r0, _080795B0
	mov sb, r0
	ldr r2, _080795B4
	mov r8, r2
_0807959E:
	cmp r7, #0
	bne _080795B8
	adds r1, r4, #0
	adds r1, #0xd
	mov r2, sb
	b _080795BE
	.align 2, 0
_080795AC: .4byte 0x02031F3C
_080795B0: .4byte 0x02024190
_080795B4: .4byte 0x020243E8
_080795B8:
	adds r1, r4, #0
	adds r1, #0xd
	mov r2, r8
_080795BE:
	adds r0, r5, r2
	movs r2, #0
	bl GetMonData
	lsls r1, r4, #1
	add r1, sp
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _0807959E
	ldr r1, _08079610
	adds r0, r6, #0
	bl StringCopy
	movs r4, #0
_080795E0:
	lsls r0, r4, #1
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080795FA
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08079614
	adds r1, r1, r0
	adds r0, r6, #0
	bl StringAppend
_080795FA:
	adds r0, r6, #0
	ldr r1, _08079618
	bl StringAppend
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _080795E0
	b _0807962C
	.align 2, 0
_08079610: .4byte 0x08300A8A
_08079614: .4byte 0x082EACC4
_08079618: .4byte 0x08300A9E
_0807961C:
	ldr r1, _0807963C
	adds r0, r6, #0
	bl StringCopy
	ldr r1, _08079640
	adds r0, r6, #0
	bl StringAppend
_0807962C:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807963C: .4byte 0x08300A8A
_08079640: .4byte 0x08300AA9
	thumb_func_end sub_08079564

	thumb_func_start sub_08079644
sub_08079644: @ 0x08079644
	push {r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, #2
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r4, r4, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0807968C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl AddTextPrinterParameterized3
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807968C: .4byte 0x08300C00
	thumb_func_end sub_08079644

	thumb_func_start sub_08079690
sub_08079690: @ 0x08079690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08079734
	mov sl, r0
	cmp r5, #0
	bne _080796AC
	ldr r1, _08079738
	mov sl, r1
_080796AC:
	movs r6, #0
	ldr r1, _0807973C
	ldr r0, [r1]
	adds r0, #0x36
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r6, r0
	bhs _08079724
	add r7, sp, #0x14
	mov r8, r1
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	mov sb, r0
_080796C8:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	add r4, sl
	adds r0, r4, #0
	movs r1, #2
	mov r2, sp
	bl GetMonData
	adds r0, r7, #0
	mov r1, sp
	bl StringCopy10
	adds r0, r4, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldr r0, [r3]
	mov r3, sb
	adds r1, r6, r3
	adds r0, #0x51
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08079706
	adds r0, r7, #0
	adds r1, r2, #0
	bl AppendGenderSymbol
_08079706:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_08079644
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x36
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r6, r0
	blo _080796C8
_08079724:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079734: .4byte 0x020243E8
_08079738: .4byte 0x02024190
_0807973C: .4byte 0x02031F3C
	thumb_func_end sub_08079690

	thumb_func_start sub_08079740
sub_08079740: @ 0x08079740
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r4, [sp, #0x30]
	ldr r5, [sp, #0x34]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0xc]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _0807979C
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r5, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	cmp r7, #0
	bne _080797A4
	movs r0, #0x64
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r1, _080797A0
	b _080797AE
	.align 2, 0
_0807979C: .4byte 0x082FFFC8
_080797A0: .4byte 0x02024190
_080797A4:
	movs r0, #0x64
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	ldr r1, _08079824
_080797AE:
	adds r0, r0, r1
	movs r1, #0x38
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08079828
	mov sl, r0
	ldr r4, [r0]
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r1, #0x51
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807982C
	adds r0, r6, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, [sp, #0xc]
	lsls r2, r1, #5
	cmp r5, #0
	beq _080797FE
	mov r3, sb
	adds r0, r3, r2
	lsls r0, r0, #1
	movs r3, #0x8f
	lsls r3, r3, #4
	adds r1, r4, r3
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x60
	strh r0, [r1]
_080797FE:
	mov r0, sl
	ldr r4, [r0]
	mov r1, sb
	adds r0, r1, r2
	adds r0, #1
	lsls r0, r0, #1
	movs r3, #0x8f
	lsls r3, r3, #4
	adds r4, r4, r3
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x70
	strh r0, [r4]
	b _0807986A
	.align 2, 0
_08079824: .4byte 0x020243E8
_08079828: .4byte 0x02031F3C
_0807982C:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #5
	mov r1, sb
	adds r3, r1, r0
	adds r1, r3, #0
	subs r1, #0x20
	lsls r1, r1, #1
	movs r0, #0x8f
	lsls r0, r0, #4
	adds r2, r4, r0
	adds r1, r2, r1
	adds r0, r3, #0
	subs r0, #0x21
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, r3, #0
	subs r1, #0x1f
	lsls r1, r1, #1
	adds r1, r2, r1
	adds r0, r3, #0
	subs r0, #0x24
	lsls r0, r0, #1
	adds r2, r2, r0
	ldrh r2, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
_0807986A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08079740

	thumb_func_start sub_0807987C
sub_0807987C: @ 0x0807987C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r7, #0
	ldr r0, _080798D4
	ldr r0, [r0]
	adds r0, #0x36
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r7, r0
	bge _080798CC
	lsls r0, r6, #1
	adds r0, r0, r6
	ldr r1, _080798D8
	lsls r0, r0, #2
	adds r5, r0, r1
	ldr r1, _080798DC
	adds r4, r0, r1
_080798A2:
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	ldrb r0, [r4]
	str r0, [sp]
	ldrb r0, [r4, #1]
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_08079740
	adds r5, #2
	adds r4, #2
	adds r7, #1
	ldr r0, _080798D4
	ldr r0, [r0]
	adds r0, #0x36
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r7, r0
	blt _080798A2
_080798CC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080798D4: .4byte 0x02031F3C
_080798D8: .4byte 0x08300A36
_080798DC: .4byte 0x08300A4E
	thumb_func_end sub_0807987C

	thumb_func_start sub_080798E0
sub_080798E0: @ 0x080798E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	movs r7, #0
	ldr r3, _080799A0
	ldr r0, [r3]
	adds r0, #0x36
	add r0, ip
	ldrb r0, [r0]
	cmp r7, r0
	bge _08079992
	ldr r6, _080799A4
	mov sb, r3
	mov r1, ip
	lsls r0, r1, #1
	add r0, ip
	lsls r2, r0, #1
	mov sl, r2
	ldr r1, _080799A8
	movs r2, #0
	mov r8, r2
	lsls r0, r0, #2
	adds r5, r0, r1
_08079918:
	mov r1, sb
	ldr r0, [r1]
	mov r2, sl
	adds r4, r7, r2
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	mov r0, sb
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x28
	adds r2, r2, r4
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r5]
	lsls r0, r0, #3
	adds r0, #0xe
	strh r0, [r1, #0x20]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	subs r0, #0xc
	strh r0, [r1, #0x22]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, r8
	strh r1, [r0, #0x24]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r2, r8
	strh r2, [r0, #0x26]
	adds r5, #2
	adds r7, #1
	adds r3, #0x36
	add r3, ip
	ldrb r3, [r3]
	cmp r7, r3
	blt _08079918
_08079992:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080799A0: .4byte 0x02031F3C
_080799A4: .4byte 0x020205AC
_080799A8: .4byte 0x08300A1C
	thumb_func_end sub_080798E0

	thumb_func_start sub_080799AC
sub_080799AC: @ 0x080799AC
	push {lr}
	movs r0, #1
	bl rbox_fill_rectangle
	movs r0, #1
	bl sub_08079690
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080799AC

	thumb_func_start sub_080799C0
sub_080799C0: @ 0x080799C0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08079A28
	lsls r2, r4, #4
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	movs r6, #0
	str r6, [sp, #8]
	movs r0, #1
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	adds r0, r4, #0
	bl sub_0807987C
	adds r0, r4, #0
	bl sub_08079690
	adds r0, r4, #0
	bl sub_080798E0
	ldr r0, _08079A2C
	ldr r0, [r0, #4]
	ldr r5, _08079A30
	ldr r1, [r5]
	adds r1, #0x72
	ldrh r1, [r1]
	lsls r1, r1, #5
	ldr r2, _08079A34
	adds r1, r1, r2
	movs r2, #0x18
	bl sub_08079D3C
	ldr r0, [r5]
	adds r0, #0x74
	adds r0, r0, r4
	strb r6, [r0]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079A28: .4byte 0x082FEDCA
_08079A2C: .4byte 0x08300AFC
_08079A30: .4byte 0x02031F3C
_08079A34: .4byte 0x06010000
	thumb_func_end sub_080799C0

	thumb_func_start sub_08079A38
sub_08079A38: @ 0x08079A38
	push {lr}
	sub sp, #8
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r0}
	bx r0
	thumb_func_end sub_08079A38

	thumb_func_start sub_08079A5C
sub_08079A5C: @ 0x08079A5C
	push {lr}
	sub sp, #8
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r0}
	bx r0
	thumb_func_end sub_08079A5C

	thumb_func_start sub_08079A80
sub_08079A80: @ 0x08079A80
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r3, #0
	ldr r4, _08079AC0
	mov ip, r4
	movs r7, #0x8d
	lsls r7, r7, #4
_08079A94:
	mov r1, ip
	ldr r0, [r1]
	lsls r1, r3, #3
	adds r2, r0, r1
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _08079AC8
	ldr r3, _08079AC4
	adds r0, r2, r3
	strh r5, [r0]
	adds r3, #2
	adds r0, r2, r3
	strb r6, [r0]
	ldr r0, [r4]
	adds r0, r0, r1
	movs r1, #0x8d
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	b _08079ACE
	.align 2, 0
_08079AC0: .4byte 0x02031F3C
_08079AC4: .4byte 0x000008D2
_08079AC8:
	adds r3, #1
	cmp r3, #3
	ble _08079A94
_08079ACE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08079A80

	thumb_func_start sub_08079AD4
sub_08079AD4: @ 0x08079AD4
	push {lr}
	movs r3, #0
	ldr r0, _08079AF8
	ldr r0, [r0]
	movs r2, #0x8d
	lsls r2, r2, #4
	adds r1, r0, r2
	movs r2, #3
_08079AE4:
	ldrb r0, [r1]
	adds r3, r3, r0
	adds r1, #8
	subs r2, #1
	cmp r2, #0
	bge _08079AE4
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_08079AF8: .4byte 0x02031F3C
	thumb_func_end sub_08079AD4

	thumb_func_start sub_08079AFC
sub_08079AFC: @ 0x08079AFC
	push {r4, r5, lr}
	movs r4, #0
	ldr r3, _08079B28
_08079B02:
	ldr r0, [r3]
	lsls r1, r4, #3
	adds r2, r0, r1
	movs r5, #0x8d
	lsls r5, r5, #4
	adds r0, r2, r5
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _08079BC4
	ldr r0, _08079B2C
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08079B30
	subs r0, #1
	strh r0, [r1]
	b _08079BC4
	.align 2, 0
_08079B28: .4byte 0x02031F3C
_08079B2C: .4byte 0x000008D2
_08079B30:
	ldr r1, _08079B44
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #8
	bhi _08079BB2
	lsls r0, r0, #2
	ldr r1, _08079B48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079B44: .4byte 0x000008D4
_08079B48: .4byte 0x08079B4C
_08079B4C: @ jump table
	.4byte _08079B70 @ case 0
	.4byte _08079B84 @ case 1
	.4byte _08079B8C @ case 2
	.4byte _08079B94 @ case 3
	.4byte _08079B94 @ case 4
	.4byte _08079B94 @ case 5
	.4byte _08079B9C @ case 6
	.4byte _08079BA4 @ case 7
	.4byte _08079BAC @ case 8
_08079B70:
	ldr r0, _08079B80
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0x14
	bl sub_08076B78
	b _08079BB2
	.align 2, 0
_08079B80: .4byte 0x02031F3C
_08079B84:
	movs r0, #0
	bl sub_08079BD4
	b _08079BB2
_08079B8C:
	movs r0, #2
	bl sub_08079BD4
	b _08079BB2
_08079B94:
	movs r0, #3
	bl sub_08079BD4
	b _08079BB2
_08079B9C:
	movs r0, #6
	bl sub_08079BD4
	b _08079BB2
_08079BA4:
	movs r0, #7
	bl sub_08079BD4
	b _08079BB2
_08079BAC:
	movs r0, #8
	bl sub_08079BD4
_08079BB2:
	ldr r0, _08079BD0
	ldr r1, [r0]
	adds r1, r1, r5
	movs r2, #0x8d
	lsls r2, r2, #4
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	adds r3, r0, #0
_08079BC4:
	adds r4, #1
	cmp r4, #3
	ble _08079B02
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079BD0: .4byte 0x02031F3C
	thumb_func_end sub_08079AFC

	thumb_func_start sub_08079BD4
sub_08079BD4: @ 0x08079BD4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, _08079C24
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r2, [r4]
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #0x14
	movs r2, #0xc
	bl DrawTextBorderOuter
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079C24: .4byte 0x08300BDC
	thumb_func_end sub_08079BD4

	thumb_func_start sub_08079C28
sub_08079C28: @ 0x08079C28
	push {r4, lr}
	sub sp, #8
	ldr r0, _08079C78
	ldr r1, [r0]
	adds r3, r1, #0
	adds r3, #0xa8
	ldrb r1, [r3]
	adds r4, r0, #0
	cmp r1, #0xc
	bhi _08079C64
	ldr r1, _08079C7C
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _08079C80
	ldr r2, [sp, #4]
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r2, r0
	str r2, [sp, #4]
	ldrb r1, [r3]
	adds r1, #0xc8
	lsls r1, r1, #0x10
	ldr r0, _08079C84
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #4]
_08079C64:
	ldr r0, [r4]
	adds r0, #0xa8
	ldrb r0, [r0]
	cmp r0, #0x10
	bhi _08079D30
	lsls r0, r0, #2
	ldr r1, _08079C88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079C78: .4byte 0x02031F3C
_08079C7C: .4byte 0x02031E2C
_08079C80: .4byte 0xFFFF0000
_08079C84: .4byte 0x0000FFFF
_08079C88: .4byte 0x08079C8C
_08079C8C: @ jump table
	.4byte _08079CD0 @ case 0
	.4byte _08079CD0 @ case 1
	.4byte _08079CD0 @ case 2
	.4byte _08079CD0 @ case 3
	.4byte _08079CD0 @ case 4
	.4byte _08079CD0 @ case 5
	.4byte _08079CD0 @ case 6
	.4byte _08079CD4 @ case 7
	.4byte _08079CEC @ case 8
	.4byte _08079CEC @ case 9
	.4byte _08079CEC @ case 10
	.4byte _08079CEC @ case 11
	.4byte _08079CEC @ case 12
	.4byte _08079CF0 @ case 13
	.4byte _08079CFC @ case 14
	.4byte _08079D08 @ case 15
	.4byte _08079D24 @ case 16
_08079CD0:
	mov r0, sp
	b _08079D0A
_08079CD4:
	mov r0, sp
	bl LoadSpriteSheet
	ldr r1, _08079CE8
	ldr r1, [r1]
	adds r2, r1, #0
	adds r2, #0x72
	strh r0, [r2]
	b _08079D12
	.align 2, 0
_08079CE8: .4byte 0x02031F3C
_08079CEC:
	mov r0, sp
	b _08079D0A
_08079CF0:
	ldr r0, _08079CF8
	bl LoadSpritePalette
	b _08079D0E
	.align 2, 0
_08079CF8: .4byte 0x083008DC
_08079CFC:
	ldr r0, _08079D04
	bl LoadSpritePalette
	b _08079D0E
	.align 2, 0
_08079D04: .4byte 0x0830083C
_08079D08:
	ldr r0, _08079D1C
_08079D0A:
	bl LoadSpriteSheet
_08079D0E:
	ldr r0, _08079D20
	ldr r1, [r0]
_08079D12:
	adds r1, #0xa8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08079D30
	.align 2, 0
_08079D1C: .4byte 0x08300834
_08079D20: .4byte 0x02031F3C
_08079D24:
	ldr r0, [r4]
	adds r0, #0xa8
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	b _08079D32
_08079D30:
	movs r0, #0
_08079D32:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08079C28

	thumb_func_start sub_08079D3C
sub_08079D3C: @ 0x08079D3C
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	add r0, sp, #4
	movs r1, #0
	adds r2, r4, #0
	bl StringFill
	movs r2, #0
	cmp r2, r4
	bge _08079D7C
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08079D7C
	add r0, sp, #4
_08079D62:
	strb r1, [r0]
	adds r2, #1
	cmp r2, r4
	bge _08079D7C
	adds r0, r5, r2
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08079D7C
	mov r0, sp
	adds r0, r0, r2
	adds r0, #4
	b _08079D62
_08079D7C:
	ldr r0, _08079D94
	str r0, [sp]
	add r0, sp, #4
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl sub_080C66A4
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079D94: .4byte 0x0201C000
	thumb_func_end sub_08079D3C

	thumb_func_start sub_08079D98
sub_08079D98: @ 0x08079D98
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0
	beq _08079DB0
	cmp r0, #1
	beq _08079E44
	b _08079ED0
_08079DB0:
	movs r7, #0
	ldr r1, _08079DF0
	ldr r0, [r1]
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r7, r0
	blt _08079DC0
	b _08079ED0
_08079DC0:
	adds r6, r1, #0
	movs r5, #0
	mov sb, r5
_08079DC6:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _08079DF4
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	adds r1, r0, #0
	cmp r1, #1
	bne _08079DF8
	ldr r0, [r6]
	adds r0, #0x45
	adds r0, r0, r5
	mov r2, sb
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, #0x51
	adds r0, r0, r5
	b _08079E28
	.align 2, 0
_08079DF0: .4byte 0x02031F3C
_08079DF4: .4byte 0x02024190
_08079DF8:
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	adds r1, r0, #0
	cmp r1, #0
	bne _08079E16
	ldr r0, [r6]
	adds r0, #0x45
	adds r0, r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #0x51
	adds r0, r0, r5
	b _08079E28
_08079E16:
	ldr r0, [r6]
	adds r0, #0x45
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #0x51
	adds r0, r0, r5
	mov r1, sb
_08079E28:
	strb r1, [r0]
	ldr r0, _08079E40
	adds r5, #1
	adds r7, #1
	ldr r0, [r0]
	adds r0, #0x36
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _08079DC6
	b _08079ED0
	.align 2, 0
_08079E40: .4byte 0x02031F3C
_08079E44:
	movs r7, #0
	ldr r1, _08079E84
	ldr r0, [r1]
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r7, r0
	bge _08079ED0
	adds r6, r1, #0
	movs r5, #6
	movs r2, #0
	mov sb, r2
_08079E5A:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _08079E88
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	adds r1, r0, #0
	cmp r1, #1
	bne _08079E8C
	ldr r0, [r6]
	adds r0, #0x45
	adds r0, r0, r5
	mov r2, sb
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, #0x51
	adds r0, r0, r5
	b _08079EBC
	.align 2, 0
_08079E84: .4byte 0x02031F3C
_08079E88: .4byte 0x020243E8
_08079E8C:
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	adds r1, r0, #0
	cmp r1, #0
	bne _08079EAA
	ldr r0, [r6]
	adds r0, #0x45
	adds r0, r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #0x51
	adds r0, r0, r5
	b _08079EBC
_08079EAA:
	ldr r0, [r6]
	adds r0, #0x45
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #0x51
	adds r0, r0, r5
	mov r1, sb
_08079EBC:
	strb r1, [r0]
	ldr r0, _08079EDC
	adds r5, #1
	adds r7, #1
	ldr r0, [r0]
	adds r0, #0x36
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _08079E5A
_08079ED0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079EDC: .4byte 0x02031F3C
	thumb_func_end sub_08079D98

	thumb_func_start sub_08079EE0
sub_08079EE0: @ 0x08079EE0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08079EF0
	cmp r0, #1
	beq _08079F50
	b _08079FA4
_08079EF0:
	movs r6, #0
	ldr r1, _08079F48
	ldr r0, [r1]
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r6, r0
	bhs _08079FA4
	adds r7, r1, #0
_08079F00:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _08079F4C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	adds r1, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl GetHPBarLevel
	ldr r1, [r7]
	adds r1, #0x5d
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r7]
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r6, r0
	blo _08079F00
	b _08079FA4
	.align 2, 0
_08079F48: .4byte 0x02031F3C
_08079F4C: .4byte 0x02024190
_08079F50:
	movs r6, #0
	ldr r1, _08079FAC
	ldr r0, [r1]
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r6, r0
	bhs _08079FA4
	adds r7, r1, #0
_08079F60:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _08079FB0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	adds r1, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl GetHPBarLevel
	ldr r1, [r7]
	adds r1, #0x63
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r7]
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r6, r0
	blo _08079F60
_08079FA4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079FAC: .4byte 0x02031F3C
_08079FB0: .4byte 0x020243E8
	thumb_func_end sub_08079EE0

	thumb_func_start sub_08079FB4
sub_08079FB4: @ 0x08079FB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
_08079FBC:
	movs r4, #0
	ldr r2, _0807A020
	ldr r0, [r2]
	adds r0, #0x36
	adds r0, r0, r5
	adds r1, r5, #1
	mov r8, r1
	ldrb r0, [r0]
	cmp r4, r0
	bge _0807A00E
	adds r6, r2, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r7, r0, #1
_08079FD8:
	ldr r2, [r6]
	adds r3, r4, r7
	adds r0, r2, #0
	adds r0, #0x28
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807A024
	adds r0, r0, r1
	adds r2, #0x5d
	adds r2, r2, r3
	ldrb r2, [r2]
	movs r1, #4
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_080D2B68
	adds r4, #1
	ldr r0, [r6]
	adds r0, #0x36
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r4, r0
	blt _08079FD8
_0807A00E:
	mov r5, r8
	cmp r5, #1
	ble _08079FBC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A020: .4byte 0x02031F3C
_0807A024: .4byte 0x020205AC
	thumb_func_end sub_08079FB4

	thumb_func_start sub_0807A028
sub_0807A028: @ 0x0807A028
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _0807A058
	ldr r4, _0807A05C
	ldr r3, _0807A060
_0807A032:
	ldr r0, [r5]
	adds r0, r0, r4
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807A04C
	ldr r0, [r3]
	adds r0, #0xa9
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A04C
	strb r0, [r1]
_0807A04C:
	adds r2, #1
	cmp r2, #0xa
	ble _0807A032
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A058: .4byte 0x03005AEC
_0807A05C: .4byte 0x000031A8
_0807A060: .4byte 0x02031F3C
	thumb_func_end sub_0807A028

	thumb_func_start sub_0807A064
sub_0807A064: @ 0x0807A064
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x30
	mov r8, r0
	adds r7, r1, #0
	mov sb, r2
	movs r5, #0
	cmp r5, r7
	bge _0807A09E
	mov r6, sp
_0807A07C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	add r4, r8
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	str r0, [r6, #0x18]
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	stm r6!, {r0}
	adds r5, #1
	cmp r5, r7
	blt _0807A07C
_0807A09E:
	bl IsNationalPokedexEnabled
	mov r1, sb
	lsls r4, r1, #2
	cmp r0, #0
	bne _0807A0CC
	add r0, sp, #0x18
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bne _0807A0BC
	movs r0, #3
	b _0807A188
_0807A0BC:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl IsSpeciesInHoennDex
	cmp r0, #0
	bne _0807A0CC
	movs r0, #2
	b _0807A188
_0807A0CC:
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0807A10C
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807A11C
	ldrb r1, [r1, #0x10]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807A11C
	add r0, sp, #0x18
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	bne _0807A110
	movs r0, #5
	b _0807A188
	.align 2, 0
_0807A10C: .4byte 0x020226A0
_0807A110:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl IsSpeciesInHoennDex
	cmp r0, #0
	beq _0807A142
_0807A11C:
	mov r1, sp
	adds r0, r1, r4
	ldr r1, [r0]
	movs r0, #0xcd
	lsls r0, r0, #1
	cmp r1, r0
	beq _0807A12E
	cmp r1, #0x97
	bne _0807A146
_0807A12E:
	movs r0, #0x64
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, r8
	movs r1, #0x50
	bl GetMonData
	cmp r0, #0
	bne _0807A146
_0807A142:
	movs r0, #4
	b _0807A188
_0807A146:
	cmp r7, #0
	ble _0807A164
	movs r3, #0xce
	lsls r3, r3, #1
	movs r2, #0
	add r1, sp, #0x18
	adds r5, r7, #0
_0807A154:
	ldr r0, [r1]
	cmp r0, r3
	bne _0807A15C
	str r2, [r1]
_0807A15C:
	adds r1, #4
	subs r5, #1
	cmp r5, #0
	bne _0807A154
_0807A164:
	movs r2, #0
	movs r5, #0
	cmp r2, r7
	bge _0807A17E
	add r1, sp, #0x18
_0807A16E:
	cmp r5, sb
	beq _0807A176
	ldr r0, [r1]
	adds r2, r2, r0
_0807A176:
	adds r1, #4
	adds r5, #1
	cmp r5, r7
	blt _0807A16E
_0807A17E:
	cmp r2, #0
	bne _0807A186
	movs r0, #1
	b _0807A188
_0807A186:
	movs r0, #0
_0807A188:
	add sp, #0x30
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0807A064

	thumb_func_start sub_0807A198
sub_0807A198: @ 0x0807A198
	push {r4, r5, r6, r7, lr}
	ldr r0, _0807A218
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A224
	movs r4, #0
	bl GetMultiplayerId
	ldr r5, _0807A21C
	movs r7, #1
	eors r0, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r1, [r1]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _0807A224
	subs r0, r1, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0807A1D2
	movs r4, #2
_0807A1D2:
	cmp r4, #0
	ble _0807A224
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r1, [r1, #0x10]
	movs r6, #0xf0
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0807A220
	cmp r4, #2
	bne _0807A224
	bl GetMultiplayerId
	eors r0, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r1, [r1, #0x10]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0807A224
	movs r0, #2
	b _0807A226
	.align 2, 0
_0807A218: .4byte 0x030031C4
_0807A21C: .4byte 0x020226A0
_0807A220:
	movs r0, #1
	b _0807A226
_0807A224:
	movs r0, #0
_0807A226:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0807A198

	thumb_func_start IsDeoxysOrMewUntradable
IsDeoxysOrMewUntradable: @ 0x0807A22C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0xcd
	lsls r0, r0, #1
	cmp r2, r0
	beq _0807A242
	cmp r2, #0x97
	bne _0807A24A
_0807A242:
	cmp r1, #0
	bne _0807A24A
	movs r0, #1
	b _0807A24C
_0807A24A:
	movs r0, #0
_0807A24C:
	pop {r1}
	bx r1
	thumb_func_end IsDeoxysOrMewUntradable

	thumb_func_start sub_0807A250
sub_0807A250: @ 0x0807A250
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x28]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r2, r0, #0x17
	lsrs r2, r2, #0x1f
	mov sb, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x1f
	lsls r0, r1, #0x17
	lsrs r0, r0, #0x1f
	mov sl, r0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x1f
	lsls r1, r1, #0x12
	lsrs r1, r1, #0x1c
	cmp r1, #3
	beq _0807A2A2
	cmp r2, #0
	bne _0807A29A
	movs r0, #8
	b _0807A330
_0807A29A:
	cmp r0, #0
	bne _0807A2A2
	movs r0, #9
	b _0807A330
_0807A2A2:
	adds r0, r5, #0
	adds r1, r6, #0
	bl IsDeoxysOrMewUntradable
	cmp r0, #0
	bne _0807A308
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r8, r0
	bne _0807A2BE
	cmp r7, r8
	beq _0807A2DC
	movs r0, #2
	b _0807A330
_0807A2BE:
	ldr r0, _0807A2D8
	lsls r1, r7, #3
	subs r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #6]
	cmp r0, r4
	beq _0807A2DC
	ldrb r0, [r1, #7]
	cmp r0, r4
	beq _0807A2DC
	movs r0, #1
	b _0807A330
	.align 2, 0
_0807A2D8: .4byte 0x082F0D54
_0807A2DC:
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r7, r0
	bne _0807A2EC
	cmp r7, r8
	beq _0807A2EC
	movs r0, #3
	b _0807A330
_0807A2EC:
	mov r0, sb
	cmp r0, #0
	bne _0807A31A
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r7, r0
	bne _0807A2FE
	movs r0, #6
	b _0807A330
_0807A2FE:
	adds r0, r7, #0
	bl IsSpeciesInHoennDex
	cmp r0, #0
	bne _0807A30C
_0807A308:
	movs r0, #4
	b _0807A330
_0807A30C:
	mov r0, r8
	bl IsSpeciesInHoennDex
	cmp r0, #0
	bne _0807A31A
	movs r0, #5
	b _0807A330
_0807A31A:
	mov r0, sl
	cmp r0, #0
	bne _0807A32E
	adds r0, r7, #0
	bl IsSpeciesInHoennDex
	cmp r0, #0
	bne _0807A32E
	movs r0, #7
	b _0807A330
_0807A32E:
	movs r0, #0
_0807A330:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0807A250

	thumb_func_start sub_0807A340
sub_0807A340: @ 0x0807A340
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r6, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x17
	lsrs r4, r0, #0x1f
	adds r0, r2, #0
	adds r1, r3, #0
	bl IsDeoxysOrMewUntradable
	cmp r0, #0
	bne _0807A37A
	cmp r4, #0
	bne _0807A37E
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r5, r0
	bne _0807A370
	movs r0, #2
	b _0807A380
_0807A370:
	adds r0, r6, #0
	bl IsSpeciesInHoennDex
	cmp r0, #0
	bne _0807A37E
_0807A37A:
	movs r0, #1
	b _0807A380
_0807A37E:
	movs r0, #0
_0807A380:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0807A340

	thumb_func_start sub_0807A388
sub_0807A388: @ 0x0807A388
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r5, #0
	ldr r0, _0807A3D4
	ldrb r0, [r0]
	cmp r5, r0
	bge _0807A3CA
	mov r4, sp
_0807A3A4:
	movs r0, #0x64
	muls r0, r5, r0
	adds r0, r6, r0
	movs r1, #0x41
	bl GetMonData
	str r0, [r4]
	movs r1, #0xce
	lsls r1, r1, #1
	cmp r0, r1
	bne _0807A3BE
	movs r0, #0
	str r0, [r4]
_0807A3BE:
	adds r4, #4
	adds r5, #1
	ldr r0, _0807A3D4
	ldrb r0, [r0]
	cmp r5, r0
	blt _0807A3A4
_0807A3CA:
	movs r7, #0
	movs r6, #1
	movs r5, #0
	ldr r4, _0807A3D8
	b _0807A3F0
	.align 2, 0
_0807A3D4: .4byte 0x0202418D
_0807A3D8: .4byte 0x020226A0
_0807A3DC:
	ldrb r0, [r4]
	subs r0, #4
	cmp r0, #1
	bhi _0807A3E8
	movs r7, #0
	b _0807A3EC
_0807A3E8:
	movs r0, #1
	orrs r7, r0
_0807A3EC:
	adds r4, #0x1c
	adds r5, #1
_0807A3F0:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blt _0807A3DC
	movs r5, #0
	movs r4, #0
	b _0807A424
_0807A402:
	ldr r0, _0807A44C
	adds r2, r4, r0
	ldrb r1, [r2, #0x10]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807A412
	movs r6, #0
_0807A412:
	cmp r7, #0
	beq _0807A420
	ldrb r0, [r2, #0x10]
	lsrs r0, r0, #4
	cmp r0, #0
	beq _0807A420
	movs r6, #0
_0807A420:
	adds r4, #0x1c
	adds r5, #1
_0807A424:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blt _0807A402
	cmp r6, #0
	bne _0807A45A
	mov r1, r8
	lsls r0, r1, #2
	mov r1, sp
	adds r4, r1, r0
	ldrh r0, [r4]
	bl IsSpeciesInHoennDex
	cmp r0, #0
	bne _0807A450
	movs r0, #2
	b _0807A48A
	.align 2, 0
_0807A44C: .4byte 0x020226A0
_0807A450:
	ldr r0, [r4]
	cmp r0, #0
	bne _0807A45A
	movs r0, #3
	b _0807A48A
_0807A45A:
	movs r2, #0
	movs r5, #0
	ldr r0, _0807A484
	ldrb r0, [r0]
	cmp r2, r0
	bge _0807A47A
	adds r3, r0, #0
	mov r1, sp
_0807A46A:
	cmp r8, r5
	beq _0807A472
	ldr r0, [r1]
	adds r2, r2, r0
_0807A472:
	adds r1, #4
	adds r5, #1
	cmp r5, r3
	blt _0807A46A
_0807A47A:
	cmp r2, #0
	beq _0807A488
	movs r0, #0
	b _0807A48A
	.align 2, 0
_0807A484: .4byte 0x0202418D
_0807A488:
	movs r0, #1
_0807A48A:
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0807A388

	thumb_func_start sub_0807A498
sub_0807A498: @ 0x0807A498
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0807A4B4
	movs r0, #0x17
	bl PlaySE
	movs r0, #0
	strh r0, [r4, #0x2e]
_0807A4B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807A498

	thumb_func_start sub_0807A4BC
sub_0807A4BC: @ 0x0807A4BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0807A4E6
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0807A4E6
	movs r0, #0xc2
	bl PlaySE
	strh r5, [r4, #0x2e]
_0807A4E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0807A4BC

	thumb_func_start sub_0807A4EC
sub_0807A4EC: @ 0x0807A4EC
	push {lr}
	adds r2, r0, #0
	movs r0, #0x30
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bne _0807A522
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0807A508
	strh r1, [r2, #0x2e]
_0807A508:
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	lsls r0, r0, #1
	ldr r1, _0807A528
	adds r0, r0, r1
	ldrb r1, [r2, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	lsls r1, r1, #4
	adds r1, #4
	movs r2, #2
	bl LoadPalette
_0807A522:
	pop {r0}
	bx r0
	.align 2, 0
_0807A528: .4byte 0x0830D0E8
	thumb_func_end sub_0807A4EC

	thumb_func_start sub_0807A52C
sub_0807A52C: @ 0x0807A52C
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x2e]
	adds r1, #1
	strh r1, [r2, #0x2e]
	ldrh r0, [r2, #0x26]
	adds r0, #1
	strh r0, [r2, #0x26]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xa
	bne _0807A54A
	adds r0, r2, #0
	bl DestroySprite
_0807A54A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807A52C

	thumb_func_start sub_0807A550
sub_0807A550: @ 0x0807A550
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x2e]
	adds r1, #1
	strh r1, [r2, #0x2e]
	ldrh r0, [r2, #0x26]
	subs r0, #1
	strh r0, [r2, #0x26]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xa
	bne _0807A56E
	adds r0, r2, #0
	bl DestroySprite
_0807A56E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807A550

	thumb_func_start sub_0807A574
sub_0807A574: @ 0x0807A574
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0807A590
	movs r0, #0xcc
	bl PlaySE
	movs r0, #0
	strh r0, [r4, #0x2e]
_0807A590:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807A574

	thumb_func_start sub_0807A598
sub_0807A598: @ 0x0807A598
	push {r4, r5, lr}
	sub sp, #0x20
	ldr r0, _0807A624
	ldr r0, [r0]
	mov ip, r0
	adds r0, #0xd4
	ldrh r1, [r0]
	lsls r1, r1, #8
	adds r0, #2
	ldrh r2, [r0]
	lsls r2, r2, #8
	adds r0, #6
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r5, #0
	ldrsh r0, [r0, r5]
	str r0, [sp]
	mov r4, ip
	adds r4, #0xe8
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp, #4]
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp, #8]
	mov r0, ip
	adds r0, #0xec
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	bl DoBgAffineSet
	add r0, sp, #0x10
	ldrh r1, [r0]
	movs r0, #0x20
	bl SetGpuReg
	add r0, sp, #0x10
	ldrh r1, [r0, #2]
	movs r0, #0x22
	bl SetGpuReg
	add r0, sp, #0x10
	ldrh r1, [r0, #4]
	movs r0, #0x24
	bl SetGpuReg
	add r0, sp, #0x10
	ldrh r1, [r0, #6]
	movs r0, #0x26
	bl SetGpuReg
	ldr r1, [sp, #0x18]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x28
	bl SetGpuReg
	ldr r1, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x2c
	bl SetGpuReg
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A624: .4byte 0x02031F40
	thumb_func_end sub_0807A598

	thumb_func_start sub_0807A628
sub_0807A628: @ 0x0807A628
	push {r4, lr}
	ldr r4, _0807A670
	ldr r0, [r4]
	adds r0, #0xe0
	ldrh r1, [r0]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, #0xe2
	ldrh r1, [r0]
	movs r0, #0x14
	bl SetGpuReg
	movs r0, #0
	bl GetGpuReg
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	cmp r1, #0
	bne _0807A674
	ldr r0, [r4]
	adds r0, #0xe4
	ldrh r1, [r0]
	movs r0, #0x1a
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, #0xe6
	ldrh r1, [r0]
	movs r0, #0x18
	bl SetGpuReg
	b _0807A678
	.align 2, 0
_0807A670: .4byte 0x02031F40
_0807A674:
	bl sub_0807A598
_0807A678:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807A628

	thumb_func_start sub_0807A680
sub_0807A680: @ 0x0807A680
	push {lr}
	bl sub_0807A628
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807A680

	thumb_func_start sub_0807A698
sub_0807A698: @ 0x0807A698
	push {r4, lr}
	ldr r3, _0807A6BC
	ldr r1, [r3]
	movs r0, #0x8a
	adds r0, r0, r1
	mov ip, r0
	movs r2, #0
	movs r0, #0
	mov r4, ip
	strh r0, [r4]
	adds r1, #0x88
	strb r2, [r1]
	ldr r0, [r3]
	adds r0, #0x89
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A6BC: .4byte 0x02031F40
	thumb_func_end sub_0807A698

	thumb_func_start sub_0807A6C0
sub_0807A6C0: @ 0x0807A6C0
	push {r4, r5, lr}
	ldr r0, _0807A6E4
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x88
	adds r3, r2, #0
	adds r3, #0x89
	ldrb r1, [r1]
	adds r5, r0, #0
	ldrb r3, [r3]
	cmp r1, r3
	bne _0807A6E8
	adds r1, r2, #0
	adds r1, #0x8a
	ldrh r0, [r1]
	adds r0, #1
	b _0807A6EE
	.align 2, 0
_0807A6E4: .4byte 0x02031F40
_0807A6E8:
	adds r1, r2, #0
	adds r1, #0x8a
	movs r0, #0
_0807A6EE:
	strh r0, [r1]
	adds r4, r5, #0
	ldr r0, [r4]
	adds r0, #0x8a
	ldrh r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	bls _0807A720
	bl CloseLink
	ldr r0, _0807A734
	bl SetMainCallback2
	ldr r1, [r4]
	adds r3, r1, #0
	adds r3, #0x8a
	movs r2, #0
	movs r0, #0
	strh r0, [r3]
	adds r1, #0x89
	strb r2, [r1]
	ldr r0, [r4]
	adds r0, #0x88
	strb r2, [r0]
_0807A720:
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x88
	ldrb r1, [r1]
	adds r0, #0x89
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A734: .4byte 0x0800AA0D
	thumb_func_end sub_0807A6C0

	thumb_func_start sub_0807A738
sub_0807A738: @ 0x0807A738
	push {lr}
	ldr r0, _0807A748
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A74C
	movs r0, #0
	b _0807A754
	.align 2, 0
_0807A748: .4byte 0x030031C4
_0807A74C:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0807A754:
	pop {r1}
	bx r1
	thumb_func_end sub_0807A738

	thumb_func_start sub_0807A758
sub_0807A758: @ 0x0807A758
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r4, #0
	mov r8, r4
	cmp r6, #0
	bne _0807A77E
	ldr r0, _0807A7A8
	ldrb r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0807A7AC
	adds r1, r1, r0
	mov r8, r1
	movs r4, #1
_0807A77E:
	cmp r6, #1
	bne _0807A79C
	ldr r0, _0807A7A8
	ldrb r0, [r0, #1]
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r1, r0, r1
	ldr r0, _0807A7B0
	adds r1, r1, r0
	mov r8, r1
	movs r4, #3
_0807A79C:
	cmp r5, #0
	beq _0807A7B4
	cmp r5, #1
	beq _0807A83C
	b _0807A892
	.align 2, 0
_0807A7A8: .4byte 0x02031F38
_0807A7AC: .4byte 0x02024190
_0807A7B0: .4byte 0x020243E8
_0807A7B4:
	mov r0, r8
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	movs r1, #0
	bl GetMonData
	adds r7, r0, #0
	cmp r6, #0
	bne _0807A7F0
	lsls r0, r5, #3
	ldr r1, _0807A7E8
	adds r0, r0, r1
	ldr r1, _0807A7EC
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r2, r5, #0
	adds r3, r7, #0
	bl HandleLoadSpecialPokePic_2
	movs r4, #0
	b _0807A80E
	.align 2, 0
_0807A7E8: .4byte 0x082DDA1C
_0807A7EC: .4byte 0x02024178
_0807A7F0:
	lsls r0, r5, #3
	ldr r1, _0807A830
	adds r0, r0, r1
	ldr r1, _0807A834
	ldr r2, [r1]
	lsls r4, r6, #1
	adds r1, r4, #1
	lsls r1, r1, #2
	adds r2, #4
	adds r2, r2, r1
	ldr r1, [r2]
	adds r2, r5, #0
	adds r3, r7, #0
	bl HandleLoadSpecialPokePic_DontHandleDeoxys
_0807A80E:
	mov r0, r8
	bl GetMonSpritePalStruct
	bl LoadCompressedSpritePalette
	ldr r0, _0807A838
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xf0
	adds r0, r0, r4
	strh r5, [r0]
	lsls r0, r6, #2
	adds r1, #0x68
	adds r1, r1, r0
	str r7, [r1]
	b _0807A892
	.align 2, 0
_0807A830: .4byte 0x082DDA1C
_0807A834: .4byte 0x02024178
_0807A838: .4byte 0x02031F40
_0807A83C:
	mov r0, r8
	bl GetMonSpritePalStruct
	ldrh r0, [r0, #4]
	adds r1, r4, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0807A89C
	movs r1, #0x78
	movs r2, #0x3c
	movs r3, #6
	bl CreateSprite
	ldr r4, _0807A8A0
	ldr r1, [r4]
	adds r1, #0x8e
	adds r1, r1, r6
	strb r0, [r1]
	ldr r3, _0807A8A4
	ldr r0, [r4]
	adds r0, #0x8e
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x8e
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, #0x1c
	adds r0, r0, r3
	ldr r1, _0807A8A8
	str r1, [r0]
_0807A892:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A89C: .4byte 0x02024640
_0807A8A0: .4byte 0x02031F40
_0807A8A4: .4byte 0x020205AC
_0807A8A8: .4byte 0x08007141
	thumb_func_end sub_0807A758

	thumb_func_start sub_0807A8AC
sub_0807A8AC: @ 0x0807A8AC
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _0807A8CC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0xc
	bls _0807A8C2
	b _0807AB72
_0807A8C2:
	lsls r0, r0, #2
	ldr r1, _0807A8D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A8CC: .4byte 0x03002360
_0807A8D0: .4byte 0x0807A8D4
_0807A8D4: @ jump table
	.4byte _0807A908 @ case 0
	.4byte _0807A9B4 @ case 1
	.4byte _0807A9F8 @ case 2
	.4byte _0807AA18 @ case 3
	.4byte _0807AA62 @ case 4
	.4byte _0807AA90 @ case 5
	.4byte _0807AAB4 @ case 6
	.4byte _0807AACC @ case 7
	.4byte _0807AAD6 @ case 8
	.4byte _0807AAF0 @ case 9
	.4byte _0807AB0C @ case 10
	.4byte _0807AB30 @ case 11
	.4byte _0807AB4C @ case 12
_0807A908:
	ldr r0, _0807A99C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A91C
	ldr r1, _0807A9A0
	ldr r2, _0807A9A4
	adds r0, r2, #0
	strh r0, [r1]
	bl CloseLink
_0807A91C:
	ldr r4, _0807A9A8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r5, #0
	bl AllocZeroed
	str r0, [r4]
	bl AllocateMonSpritesGfx
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0807A9AC
	bl SetVBlankCallback
	bl sub_0807ABCC
	bl sub_0807A698
	ldr r1, _0807A9B0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x8c
	strh r2, [r0]
	adds r0, #8
	strh r2, [r0]
	adds r1, #0xee
	movs r0, #1
	strb r0, [r1]
	ldr r3, [r4]
	adds r0, r3, #0
	adds r0, #0xd4
	movs r1, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0xdc
	movs r0, #0x78
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x50
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xe8
	strh r5, [r0]
	adds r0, #4
	strh r2, [r0]
	b _0807AB72
	.align 2, 0
_0807A99C: .4byte 0x030031C4
_0807A9A0: .4byte 0x0202267E
_0807A9A4: .4byte 0x00001144
_0807A9A8: .4byte 0x02031F40
_0807A9AC: .4byte 0x0807A681
_0807A9B0: .4byte 0x03002360
_0807A9B4:
	ldr r0, _0807A9E0
	ldrb r5, [r0]
	cmp r5, #0
	bne _0807A9EC
	ldr r4, _0807A9E4
	ldr r0, [r4]
	adds r0, #0xfa
	movs r1, #1
	strb r1, [r0]
	bl OpenLink
	ldr r1, _0807A9E8
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	str r5, [r0, #0x64]
	b _0807AB72
	.align 2, 0
_0807A9E0: .4byte 0x030031C4
_0807A9E4: .4byte 0x02031F40
_0807A9E8: .4byte 0x03002360
_0807A9EC:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	movs r0, #4
	strb r0, [r1]
	b _0807AB72
_0807A9F8:
	ldr r0, _0807AA14
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x3c
	bhi _0807AA08
	b _0807AB72
_0807AA08:
	movs r0, #0
	str r0, [r1, #0x64]
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	b _0807AB40
	.align 2, 0
_0807AA14: .4byte 0x02031F40
_0807AA18:
	bl IsLinkMaster
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807AA24
	b _0807AB38
_0807AA24:
	bl GetLinkPlayerCount_2
	adds r4, r0, #0
	bl GetSavedPlayerCount
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	blo _0807AA5C
	ldr r0, _0807AA54
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x1e
	bhi _0807AA46
	b _0807AB72
_0807AA46:
	bl CheckShouldAdvanceLinkState
	ldr r1, _0807AA58
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _0807AB40
	.align 2, 0
_0807AA54: .4byte 0x02031F40
_0807AA58: .4byte 0x03002360
_0807AA5C:
	bl sub_0807A6C0
	b _0807AB72
_0807AA62:
	bl sub_0807A6C0
	ldr r0, _0807AA88
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807AA70
	b _0807AB72
_0807AA70:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0807AA7E
	b _0807AB72
_0807AA7E:
	ldr r1, _0807AA8C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _0807AB40
	.align 2, 0
_0807AA88: .4byte 0x030031C4
_0807AA8C: .4byte 0x03002360
_0807AA90:
	ldr r2, _0807AAB0
	ldr r0, [r2]
	adds r0, #0x72
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x73
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x93
	strb r1, [r0]
	movs r0, #0
	bl sub_0807A758
	b _0807AB38
	.align 2, 0
_0807AAB0: .4byte 0x02031F40
_0807AAB4:
	movs r0, #0
	movs r1, #1
	bl sub_0807A758
	ldr r1, _0807AAC8
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _0807AB40
	.align 2, 0
_0807AAC8: .4byte 0x03002360
_0807AACC:
	movs r0, #1
	movs r1, #0
	bl sub_0807A758
	b _0807AB38
_0807AAD6:
	movs r0, #1
	movs r1, #1
	bl sub_0807A758
	bl sub_0807ABB0
	ldr r1, _0807AAEC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _0807AB40
	.align 2, 0
_0807AAEC: .4byte 0x03002360
_0807AAF0:
	bl sub_0807B4CC
	ldr r0, _0807AB04
	bl LoadSpriteSheet
	ldr r0, _0807AB08
	bl LoadSpritePalette
	b _0807AB38
	.align 2, 0
_0807AB04: .4byte 0x0830CF5C
_0807AB08: .4byte 0x0830CF64
_0807AB0C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #0
	bl ShowBg
	ldr r1, _0807AB2C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _0807AB40
	.align 2, 0
_0807AB2C: .4byte 0x03002360
_0807AB30:
	bl sub_0807AB9C
	bl SetTradeSceneStrings
_0807AB38:
	ldr r1, _0807AB48
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
_0807AB40:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807AB72
	.align 2, 0
_0807AB48: .4byte 0x03002360
_0807AB4C:
	ldr r0, _0807AB90
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807AB72
	ldr r0, _0807AB94
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807AB6C
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
_0807AB6C:
	ldr r0, _0807AB98
	bl SetMainCallback2
_0807AB72:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AB90: .4byte 0x02037C74
_0807AB94: .4byte 0x0300319C
_0807AB98: .4byte 0x0807E465
	thumb_func_end sub_0807A8AC

	thumb_func_start sub_0807AB9C
sub_0807AB9C: @ 0x0807AB9C
	push {lr}
	movs r0, #5
	bl sub_0807B064
	movs r0, #0
	bl sub_0807B064
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807AB9C

	thumb_func_start sub_0807ABB0
sub_0807ABB0: @ 0x0807ABB0
	push {lr}
	movs r0, #0
	movs r1, #0xff
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	pop {r0}
	bx r0
	thumb_func_end sub_0807ABB0

	thumb_func_start sub_0807ABCC
sub_0807ABCC: @ 0x0807ABCC
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0807ACB4
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
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r5, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #0
	bl SetBgTilemapBuffer
	adds r0, r5, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #1
	bl SetBgTilemapBuffer
	adds r0, r5, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #3
	bl SetBgTilemapBuffer
	bl DeactivateAllTextPrinters
	movs r0, #0x8c
	lsls r0, r0, #0x14
	mov sl, r0
	movs r0, #0
	mov sb, r0
	str r0, [sp]
	mov r1, sl
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r0, _0807ACB8
	mov r8, r0
	ldr r4, _0807ACBC
	adds r1, r4, #0
	bl LZDecompressVram
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r6, _0807ACC0
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r0, _0807ACC4
	bl InitWindows
	mov r0, sb
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	mov r0, r8
	adds r1, r4, #0
	bl LZDecompressVram
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x20
	bl LoadCompressedPalette
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807ACB4: .4byte 0x0830D294
_0807ACB8: .4byte 0x08C00530
_0807ACBC: .4byte 0x0201C000
_0807ACC0: .4byte 0x08C004EC
_0807ACC4: .4byte 0x0830D27C
	thumb_func_end sub_0807ABCC

	thumb_func_start sub_0807ACC8
sub_0807ACC8: @ 0x0807ACC8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0807ACE8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _0807ACDC
	b _0807AE7A
_0807ACDC:
	lsls r0, r0, #2
	ldr r1, _0807ACEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807ACE8: .4byte 0x03002360
_0807ACEC: .4byte 0x0807ACF0
_0807ACF0: @ jump table
	.4byte _0807AD24 @ case 0
	.4byte _0807AE7A @ case 1
	.4byte _0807AE7A @ case 2
	.4byte _0807AE7A @ case 3
	.4byte _0807AE7A @ case 4
	.4byte _0807ADE8 @ case 5
	.4byte _0807ADF2 @ case 6
	.4byte _0807ADFC @ case 7
	.4byte _0807AE0C @ case 8
	.4byte _0807AE2C @ case 9
	.4byte _0807AE48 @ case 10
	.4byte _0807AE50 @ case 11
	.4byte _0807AE74 @ case 12
_0807AD24:
	ldr r1, _0807ADC8
	ldr r0, _0807ADCC
	ldrh r0, [r0]
	movs r5, #0
	strb r0, [r1]
	movs r0, #6
	strb r0, [r1, #1]
	ldr r4, _0807ADD0
	ldr r0, _0807ADD4
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringCopy
	ldr r0, _0807ADD8
	movs r1, #7
	mov r2, sp
	bl GetMonData
	adds r4, #0x1c
	adds r0, r4, #0
	mov r1, sp
	bl StringCopy
	ldr r4, _0807ADDC
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r6, #0
	bl AllocZeroed
	str r0, [r4]
	bl AllocateMonSpritesGfx
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0807ADE0
	bl SetVBlankCallback
	bl sub_0807ABCC
	ldr r0, [r4]
	adds r0, #0xee
	strb r5, [r0]
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x8c
	strh r5, [r0]
	adds r0, #8
	strh r5, [r0]
	adds r0, #0x40
	movs r1, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r1, r2, #0
	adds r1, #0xdc
	movs r0, #0x78
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x50
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0xe8
	strh r6, [r0]
	adds r0, #4
	strh r5, [r0]
	str r5, [r2, #0x64]
	ldr r0, _0807ADE4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	b _0807AE7A
	.align 2, 0
_0807ADC8: .4byte 0x02031F38
_0807ADCC: .4byte 0x02037282
_0807ADD0: .4byte 0x020226A8
_0807ADD4: .4byte 0x03005AF0
_0807ADD8: .4byte 0x020243E8
_0807ADDC: .4byte 0x02031F40
_0807ADE0: .4byte 0x0807A681
_0807ADE4: .4byte 0x03002360
_0807ADE8:
	movs r0, #0
	movs r1, #0
	bl sub_0807A758
	b _0807AE60
_0807ADF2:
	movs r0, #0
	movs r1, #1
	bl sub_0807A758
	b _0807AE60
_0807ADFC:
	movs r0, #1
	movs r1, #0
	bl sub_0807A758
	movs r0, #0
	bl ShowBg
	b _0807AE60
_0807AE0C:
	movs r0, #1
	movs r1, #1
	bl sub_0807A758
	movs r0, #0
	movs r1, #0xff
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	b _0807AE60
_0807AE2C:
	bl sub_0807B4CC
	ldr r0, _0807AE40
	bl LoadSpriteSheet
	ldr r0, _0807AE44
	bl LoadSpritePalette
	b _0807AE60
	.align 2, 0
_0807AE40: .4byte 0x0830CF5C
_0807AE44: .4byte 0x0830CF64
_0807AE48:
	movs r0, #0
	bl ShowBg
	b _0807AE60
_0807AE50:
	movs r0, #5
	bl sub_0807B064
	movs r0, #0
	bl sub_0807B064
	bl SetTradeSceneStrings
_0807AE60:
	ldr r1, _0807AE70
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807AE7A
	.align 2, 0
_0807AE70: .4byte 0x03002360
_0807AE74:
	ldr r0, _0807AE98
	bl SetMainCallback2
_0807AE7A:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807AE98: .4byte 0x0807B045
	thumb_func_end sub_0807ACC8

	thumb_func_start sub_0807AE9C
sub_0807AE9C: @ 0x0807AE9C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r1, r0, r1
	ldr r0, _0807AEF8
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _0807AEF0
	adds r0, r5, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl GetMonData
	adds r5, r0, #0
	adds r0, r4, #0
	bl HoennToNationalOrder
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl GetSetPokedexFlag
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	bl HandleSetPokedexFlag
_0807AEF0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AEF8: .4byte 0x02024190
	thumb_func_end sub_0807AE9C

	thumb_func_start sub_0807AEFC
sub_0807AEFC: @ 0x0807AEFC
	push {lr}
	bl GetMultiplayerId
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807AEFC

	thumb_func_start sub_0807AF08
sub_0807AF08: @ 0x0807AF08
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #0x64
	mov r1, sb
	muls r1, r5, r1
	ldr r0, _0807AFD4
	adds r7, r1, r0
	adds r0, r7, #0
	movs r1, #0x40
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r1, r4, #0
	muls r1, r5, r1
	ldr r0, _0807AFD8
	adds r5, r1, r0
	adds r0, r5, #0
	movs r1, #0x40
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r6, #0xff
	beq _0807AF62
	ldr r0, _0807AFDC
	lsls r1, r6, #3
	adds r1, r1, r6
	lsls r1, r1, #2
	ldr r2, _0807AFE0
	adds r1, r1, r2
	ldr r0, [r0]
	adds r0, r0, r1
	bl ClearMailStruct
_0807AF62:
	ldr r4, _0807AFE4
	ldr r0, [r4]
	adds r1, r7, #0
	movs r2, #0x64
	bl memcpy
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x64
	bl memcpy
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0x64
	bl memcpy
	movs r1, #0x46
	mov r0, sp
	strb r1, [r0]
	adds r0, r7, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _0807AF9E
	adds r0, r7, #0
	movs r1, #0x20
	mov r2, sp
	bl SetMonData
_0807AF9E:
	mov r0, r8
	cmp r0, #0xff
	beq _0807AFB4
	lsls r1, r0, #3
	add r1, r8
	lsls r1, r1, #2
	ldr r0, _0807AFE8
	adds r1, r1, r0
	adds r0, r7, #0
	bl GiveMailToMon2
_0807AFB4:
	mov r0, sb
	bl sub_0807AE9C
	ldr r0, _0807AFEC
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807AFC6
	bl sub_0807AEFC
_0807AFC6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807AFD4: .4byte 0x02024190
_0807AFD8: .4byte 0x020243E8
_0807AFDC: .4byte 0x03005AEC
_0807AFE0: .4byte 0x00002BE0
_0807AFE4: .4byte 0x02031F40
_0807AFE8: .4byte 0x02031E60
_0807AFEC: .4byte 0x030031C4
	thumb_func_end sub_0807AF08

	thumb_func_start sub_0807AFF0
sub_0807AFF0: @ 0x0807AFF0
	push {r4, lr}
	ldr r4, _0807B004
	ldr r0, [r4]
	adds r0, #0x93
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807B008
	cmp r0, #2
	beq _0807B02E
	b _0807B038
	.align 2, 0
_0807B004: .4byte 0x02031F40
_0807B008:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807B02E
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	adds r1, #0x74
	movs r2, #0x14
	bl SendBlock
	ldr r1, [r4]
	adds r1, #0x93
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0807B02E:
	ldr r0, _0807B040
	ldr r0, [r0]
	adds r0, #0x93
	movs r1, #0
	strb r1, [r0]
_0807B038:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B040: .4byte 0x02031F40
	thumb_func_end sub_0807AFF0

	thumb_func_start sub_0807B044
sub_0807B044: @ 0x0807B044
	push {lr}
	bl sub_0807B600
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807B044

	thumb_func_start sub_0807B064
sub_0807B064: @ 0x0807B064
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0807B070
	b _0807B4A0
_0807B070:
	lsls r0, r0, #2
	ldr r1, _0807B07C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B07C: .4byte 0x0807B080
_0807B080: @ jump table
	.4byte _0807B0A0 @ case 0
	.4byte _0807B114 @ case 1
	.4byte _0807B1BC @ case 2
	.4byte _0807B230 @ case 3
	.4byte _0807B278 @ case 4
	.4byte _0807B344 @ case 5
	.4byte _0807B35C @ case 6
	.4byte _0807B434 @ case 7
_0807B0A0:
	ldr r0, _0807B0F8
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0xe4
	movs r0, #0
	strh r0, [r2]
	adds r1, #0xe6
	movs r0, #0xb4
	strh r0, [r1]
	movs r1, #0xaa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r1, _0807B0FC
	movs r0, #0xc
	bl SetGpuReg
	ldr r0, _0807B100
	movs r1, #0x10
	movs r2, #0x60
	bl LoadPalette
	ldr r3, _0807B104
	ldr r4, _0807B108
	movs r5, #0xa1
	lsls r5, r5, #5
	ldr r1, _0807B10C
	ldr r6, _0807B110
	movs r2, #0x80
	lsls r2, r2, #5
	movs r7, #0x80
	lsls r7, r7, #0x18
_0807B0E2:
	str r3, [r1]
	str r4, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r2
	adds r4, r4, r2
	subs r5, r5, r2
	cmp r5, r2
	bhi _0807B0E2
	b _0807B484
	.align 2, 0
_0807B0F8: .4byte 0x02031F40
_0807B0FC: .4byte 0x00005206
_0807B100: .4byte 0x08305D24
_0807B104: .4byte 0x08305D84
_0807B108: .4byte 0x06004000
_0807B10C: .4byte 0x040000D4
_0807B110: .4byte 0x80000800
_0807B114:
	ldr r4, _0807B14C
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0xe2
	movs r0, #0
	strh r0, [r1]
	adds r2, #0xe0
	movs r1, #0xae
	lsls r1, r1, #1
	strh r1, [r2]
	movs r0, #0x16
	bl SetGpuReg
	ldr r1, _0807B150
	movs r0, #0xa
	bl SetGpuReg
	ldr r1, _0807B154
	movs r0, #0xc
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, #0xfa
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B15C
	ldr r1, _0807B158
	b _0807B15E
	.align 2, 0
_0807B14C: .4byte 0x02031F40
_0807B150: .4byte 0x00008502
_0807B154: .4byte 0x00009206
_0807B158: .4byte 0x0830ABE4
_0807B15C:
	ldr r1, _0807B1A8
_0807B15E:
	ldr r2, _0807B1AC
	ldr r0, _0807B1B0
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0807B1B4
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r3, _0807B1B8
	movs r4, #0xc0
	lsls r4, r4, #0x13
	movs r5, #0xa1
	lsls r5, r5, #5
	ldr r1, _0807B1B0
	ldr r6, _0807B1B4
	movs r2, #0x80
	lsls r2, r2, #5
	movs r7, #0x80
	lsls r7, r7, #0x18
_0807B182:
	str r3, [r1]
	str r4, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r2
	adds r4, r4, r2
	subs r5, r5, r2
	cmp r5, r2
	bhi _0807B182
	str r3, [r1]
	str r4, [r1, #4]
	lsrs r0, r5, #1
	orrs r0, r7
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r1, #0x92
	lsls r1, r1, #5
	b _0807B258
	.align 2, 0
_0807B1A8: .4byte 0x08309BE4
_0807B1AC: .4byte 0x06002800
_0807B1B0: .4byte 0x040000D4
_0807B1B4: .4byte 0x80000800
_0807B1B8: .4byte 0x08305D84
_0807B1BC:
	ldr r0, _0807B1E8
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0xe0
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x18
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807B1F8
	ldr r1, _0807B1EC
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0807B1F0
	ldr r1, _0807B1F4
	bl LZ77UnCompVram
	movs r0, #8
	b _0807B212
	.align 2, 0
_0807B1E8: .4byte 0x02031F40
_0807B1EC: .4byte 0x00001241
_0807B1F0: .4byte 0x0830BBE4
_0807B1F4: .4byte 0x06002800
_0807B1F8:
	ldr r1, _0807B21C
	movs r0, #0
	bl SetGpuReg
	ldr r1, _0807B220
	ldr r2, _0807B224
	ldr r0, _0807B228
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0807B22C
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r0, #1
_0807B212:
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	b _0807B4A0
	.align 2, 0
_0807B21C: .4byte 0x00001241
_0807B220: .4byte 0x08302D64
_0807B224: .4byte 0x06002800
_0807B228: .4byte 0x040000D4
_0807B22C: .4byte 0x80000400
_0807B230:
	ldr r0, _0807B260
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0807B264
	ldr r1, _0807B268
	bl LZ77UnCompVram
	ldr r0, _0807B26C
	ldr r1, _0807B270
	bl LZ77UnCompVram
	ldr r0, _0807B274
	ldr r0, [r0]
	adds r0, #0xe4
	movs r1, #0x50
	strh r1, [r0]
	movs r1, #0xb2
	lsls r1, r1, #5
_0807B258:
	movs r0, #0
	bl SetGpuReg
	b _0807B4A0
	.align 2, 0
_0807B260: .4byte 0x0830C0E4
_0807B264: .4byte 0x0830C104
_0807B268: .4byte 0x06004000
_0807B26C: .4byte 0x0830C794
_0807B270: .4byte 0x06009000
_0807B274: .4byte 0x02031F40
_0807B278:
	ldr r1, _0807B2FC
	movs r0, #0
	bl SetGpuReg
	ldr r1, _0807B300
	movs r0, #0xc
	bl SetGpuReg
	ldr r0, _0807B304
	ldr r3, [r0]
	adds r1, r3, #0
	adds r1, #0xd4
	movs r2, #0
	movs r0, #0x40
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x5c
	strh r0, [r1]
	adds r1, #0x12
	movs r0, #0x20
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xec
	strh r2, [r0]
	ldr r3, _0807B308
	ldr r4, _0807B30C
	movs r5, #0xa1
	lsls r5, r5, #6
	ldr r1, _0807B310
	ldr r6, _0807B314
	movs r2, #0x80
	lsls r2, r2, #5
	movs r7, #0x80
	lsls r7, r7, #0x18
_0807B2C4:
	str r3, [r1]
	str r4, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r2
	adds r4, r4, r2
	subs r5, r5, r2
	cmp r5, r2
	bhi _0807B2C4
	str r3, [r1]
	str r4, [r1, #4]
	lsrs r0, r5, #1
	orrs r0, r7
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0807B304
	ldr r0, [r0]
	adds r0, #0xfa
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B324
	ldr r1, _0807B318
	ldr r2, _0807B31C
	ldr r0, _0807B310
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0807B320
	b _0807B49C
	.align 2, 0
_0807B2FC: .4byte 0x00001441
_0807B300: .4byte 0x00001287
_0807B304: .4byte 0x02031F40
_0807B308: .4byte 0x083071A4
_0807B30C: .4byte 0x06004000
_0807B310: .4byte 0x040000D4
_0807B314: .4byte 0x80000800
_0807B318: .4byte 0x083099E4
_0807B31C: .4byte 0x06009000
_0807B320: .4byte 0x80000080
_0807B324:
	ldr r1, _0807B334
	ldr r2, _0807B338
	ldr r0, _0807B33C
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0807B340
	b _0807B49C
	.align 2, 0
_0807B334: .4byte 0x08309AE4
_0807B338: .4byte 0x06009000
_0807B33C: .4byte 0x040000D4
_0807B340: .4byte 0x80000080
_0807B344:
	ldr r0, _0807B358
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0xe0
	movs r2, #0
	strh r2, [r1]
	adds r0, #0xe2
	strh r2, [r0]
	b _0807B4A0
	.align 2, 0
_0807B358: .4byte 0x02031F40
_0807B35C:
	ldr r1, _0807B3EC
	movs r0, #0
	bl SetGpuReg
	ldr r1, _0807B3F0
	movs r0, #0xc
	bl SetGpuReg
	ldr r0, _0807B3F4
	ldr r3, [r0]
	adds r1, r3, #0
	adds r1, #0xd4
	movs r2, #0
	movs r0, #0x40
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x5c
	strh r0, [r1]
	adds r1, #0x12
	adds r0, #0xa4
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x80
	strh r0, [r1]
	subs r1, #0xe
	movs r0, #0x78
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x50
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xec
	strh r2, [r0]
	ldr r3, _0807B3F8
	ldr r4, _0807B3FC
	movs r5, #0xa1
	lsls r5, r5, #6
	ldr r1, _0807B400
	ldr r6, _0807B404
	movs r2, #0x80
	lsls r2, r2, #5
	movs r7, #0x80
	lsls r7, r7, #0x18
_0807B3B2:
	str r3, [r1]
	str r4, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r2
	adds r4, r4, r2
	subs r5, r5, r2
	cmp r5, r2
	bhi _0807B3B2
	str r3, [r1]
	str r4, [r1, #4]
	lsrs r0, r5, #1
	orrs r0, r7
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0807B3F4
	ldr r0, [r0]
	adds r0, #0xfa
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B414
	ldr r1, _0807B408
	ldr r2, _0807B40C
	ldr r0, _0807B400
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0807B410
	b _0807B49C
	.align 2, 0
_0807B3EC: .4byte 0x00001441
_0807B3F0: .4byte 0x00001287
_0807B3F4: .4byte 0x02031F40
_0807B3F8: .4byte 0x083071A4
_0807B3FC: .4byte 0x06004000
_0807B400: .4byte 0x040000D4
_0807B404: .4byte 0x80000800
_0807B408: .4byte 0x083099E4
_0807B40C: .4byte 0x06009000
_0807B410: .4byte 0x80000080
_0807B414:
	ldr r1, _0807B424
	ldr r2, _0807B428
	ldr r0, _0807B42C
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0807B430
	b _0807B49C
	.align 2, 0
_0807B424: .4byte 0x08309AE4
_0807B428: .4byte 0x06009000
_0807B42C: .4byte 0x040000D4
_0807B430: .4byte 0x80000080
_0807B434:
	ldr r0, _0807B4A8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0xe4
	movs r2, #0
	strh r2, [r1]
	adds r0, #0xe6
	strh r2, [r0]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	ldr r1, _0807B4AC
	movs r0, #0xc
	bl SetGpuReg
	ldr r0, _0807B4B0
	movs r1, #0x10
	movs r2, #0x60
	bl LoadPalette
	ldr r3, _0807B4B4
	ldr r4, _0807B4B8
	movs r5, #0xa1
	lsls r5, r5, #5
	ldr r1, _0807B4BC
	ldr r6, _0807B4C0
	movs r2, #0x80
	lsls r2, r2, #5
	movs r7, #0x80
	lsls r7, r7, #0x18
_0807B472:
	str r3, [r1]
	str r4, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r2
	adds r4, r4, r2
	subs r5, r5, r2
	cmp r5, r2
	bhi _0807B472
_0807B484:
	str r3, [r1]
	str r4, [r1, #4]
	lsrs r0, r5, #1
	orrs r0, r7
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0807B4C4
	ldr r2, _0807B4C8
	ldr r0, _0807B4BC
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0807B4C0
_0807B49C:
	str r1, [r0, #8]
	ldr r0, [r0, #8]
_0807B4A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B4A8: .4byte 0x02031F40
_0807B4AC: .4byte 0x00005206
_0807B4B0: .4byte 0x08305D24
_0807B4B4: .4byte 0x08305D84
_0807B4B8: .4byte 0x06004000
_0807B4BC: .4byte 0x040000D4
_0807B4C0: .4byte 0x80000800
_0807B4C4: .4byte 0x08304D04
_0807B4C8: .4byte 0x06009000
	thumb_func_end sub_0807B064

	thumb_func_start sub_0807B4CC
sub_0807B4CC: @ 0x0807B4CC
	push {lr}
	ldr r0, _0807B4F8
	bl LoadSpriteSheet
	ldr r0, _0807B4FC
	bl LoadSpriteSheet
	ldr r0, _0807B500
	bl LoadSpriteSheet
	ldr r0, _0807B504
	bl LoadSpriteSheet
	ldr r0, _0807B508
	bl LoadSpritePalette
	ldr r0, _0807B50C
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0807B4F8: .4byte 0x0830CFB4
_0807B4FC: .4byte 0x0830D004
_0807B500: .4byte 0x0830D038
_0807B504: .4byte 0x0830D0B0
_0807B508: .4byte 0x0830CFBC
_0807B50C: .4byte 0x0830CFC4
	thumb_func_end sub_0807B4CC

	thumb_func_start SetTradeSceneStrings
SetTradeSceneStrings: @ 0x0807B510
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r0, _0807B580
	ldr r0, [r0]
	adds r0, #0xee
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B5A0
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	ldr r3, _0807B584
	movs r2, #0x80
	lsls r2, r2, #0x11
	eors r2, r0
	lsrs r2, r2, #0x18
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r0, _0807B588
	adds r1, r1, r0
	adds r0, r3, #0
	bl StringCopy
	ldr r5, _0807B58C
	ldrb r0, [r5, #1]
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x64
	muls r0, r4, r0
	ldr r1, _0807B590
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	ldr r0, _0807B594
	mov r1, sp
	bl StringCopy10
	ldrb r0, [r5]
	muls r0, r4, r0
	ldr r1, _0807B598
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	ldr r0, _0807B59C
	mov r1, sp
	bl StringCopy10
	b _0807B5DC
	.align 2, 0
_0807B580: .4byte 0x02031F40
_0807B584: .4byte 0x02021C40
_0807B588: .4byte 0x020226A8
_0807B58C: .4byte 0x02031F38
_0807B590: .4byte 0x020243E8
_0807B594: .4byte 0x02021C68
_0807B598: .4byte 0x02024190
_0807B59C: .4byte 0x02021C54
_0807B5A0:
	ldr r0, _0807B5E4
	ldrh r0, [r0]
	lsls r4, r0, #4
	subs r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0807B5E8
	adds r4, r4, r0
	ldr r0, _0807B5EC
	adds r1, r4, #0
	adds r1, #0x2b
	bl StringCopy
	ldr r0, _0807B5F0
	adds r1, r4, #0
	bl StringCopy10
	ldr r0, _0807B5F4
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0807B5F8
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	ldr r0, _0807B5FC
	mov r1, sp
	bl StringCopy10
_0807B5DC:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B5E4: .4byte 0x02037280
_0807B5E8: .4byte 0x0830D114
_0807B5EC: .4byte 0x02021C40
_0807B5F0: .4byte 0x02021C68
_0807B5F4: .4byte 0x02037282
_0807B5F8: .4byte 0x02024190
_0807B5FC: .4byte 0x02021C54
	thumb_func_end SetTradeSceneStrings

	thumb_func_start sub_0807B600
sub_0807B600: @ 0x0807B600
	push {lr}
	ldr r0, _0807B614
	ldr r0, [r0]
	adds r0, #0xfa
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807B618
	bl sub_0807CA00
	b _0807B61C
	.align 2, 0
_0807B614: .4byte 0x02031F40
_0807B618:
	bl sub_0807B624
_0807B61C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end sub_0807B600

	thumb_func_start sub_0807B624
sub_0807B624: @ 0x0807B624
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r0, _0807B648
	ldr r1, [r0]
	adds r1, #0x94
	ldrh r5, [r1]
	ldr r1, _0807B64C
	adds r7, r0, #0
	cmp r5, r1
	bls _0807B63C
	bl _0807C9EC
_0807B63C:
	lsls r0, r5, #2
	ldr r1, _0807B650
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B648: .4byte 0x02031F40
_0807B64C: .4byte 0x0000010B
_0807B650: .4byte 0x0807B654
_0807B654: @ jump table
	.4byte _0807BA84 @ case 0
	.4byte _0807BAFC @ case 1
	.4byte _0807C9EC @ case 2
	.4byte _0807C9EC @ case 3
	.4byte _0807C9EC @ case 4
	.4byte _0807C9EC @ case 5
	.4byte _0807C9EC @ case 6
	.4byte _0807C9EC @ case 7
	.4byte _0807C9EC @ case 8
	.4byte _0807C9EC @ case 9
	.4byte _0807BB58 @ case 10
	.4byte _0807BBA0 @ case 11
	.4byte _0807BC14 @ case 12
	.4byte _0807C9EC @ case 13
	.4byte _0807BC80 @ case 14
	.4byte _0807C9EC @ case 15
	.4byte _0807C9EC @ case 16
	.4byte _0807C9EC @ case 17
	.4byte _0807C9EC @ case 18
	.4byte _0807C9EC @ case 19
	.4byte _0807BCA4 @ case 20
	.4byte _0807BCD4 @ case 21
	.4byte _0807BCE6 @ case 22
	.4byte _0807BD08 @ case 23
	.4byte _0807BD50 @ case 24
	.4byte _0807BD80 @ case 25
	.4byte _0807BDC8 @ case 26
	.4byte _0807BE18 @ case 27
	.4byte _0807BE6C @ case 28
	.4byte _0807BEF0 @ case 29
	.4byte _0807BF14 @ case 30
	.4byte _0807BF60 @ case 31
	.4byte _0807BFAC @ case 32
	.4byte _0807C008 @ case 33
	.4byte _0807C068 @ case 34
	.4byte _0807C07C @ case 35
	.4byte _0807C090 @ case 36
	.4byte _0807C0A4 @ case 37
	.4byte _0807C1CC @ case 38
	.4byte _0807C29C @ case 39
	.4byte _0807C324 @ case 40
	.4byte _0807C39C @ case 41
	.4byte _0807C3AC @ case 42
	.4byte _0807C3CC @ case 43
	.4byte _0807C41C @ case 44
	.4byte _0807C43A @ case 45
	.4byte _0807C478 @ case 46
	.4byte _0807C488 @ case 47
	.4byte _0807C500 @ case 48
	.4byte _0807C9EC @ case 49
	.4byte _0807C528 @ case 50
	.4byte _0807C568 @ case 51
	.4byte _0807C5A8 @ case 52
	.4byte _0807C9EC @ case 53
	.4byte _0807C9EC @ case 54
	.4byte _0807C9EC @ case 55
	.4byte _0807C9EC @ case 56
	.4byte _0807C9EC @ case 57
	.4byte _0807C9EC @ case 58
	.4byte _0807C9EC @ case 59
	.4byte _0807C5C8 @ case 60
	.4byte _0807C5F0 @ case 61
	.4byte _0807C60C @ case 62
	.4byte _0807C62C @ case 63
	.4byte _0807C6D4 @ case 64
	.4byte _0807C708 @ case 65
	.4byte _0807C754 @ case 66
	.4byte _0807C814 @ case 67
	.4byte _0807C88C @ case 68
	.4byte _0807C8D8 @ case 69
	.4byte _0807C8E8 @ case 70
	.4byte _0807C8EE @ case 71
	.4byte _0807C914 @ case 72
	.4byte _0807C970 @ case 73
	.4byte _0807C994 @ case 74
	.4byte _0807C9EC @ case 75
	.4byte _0807C9EC @ case 76
	.4byte _0807C9EC @ case 77
	.4byte _0807C9EC @ case 78
	.4byte _0807C9EC @ case 79
	.4byte _0807C9EC @ case 80
	.4byte _0807C9EC @ case 81
	.4byte _0807C9EC @ case 82
	.4byte _0807C9EC @ case 83
	.4byte _0807C9EC @ case 84
	.4byte _0807C9EC @ case 85
	.4byte _0807C9EC @ case 86
	.4byte _0807C9EC @ case 87
	.4byte _0807C9EC @ case 88
	.4byte _0807C9EC @ case 89
	.4byte _0807C9EC @ case 90
	.4byte _0807C9EC @ case 91
	.4byte _0807C9EC @ case 92
	.4byte _0807C9EC @ case 93
	.4byte _0807C9EC @ case 94
	.4byte _0807C9EC @ case 95
	.4byte _0807C9EC @ case 96
	.4byte _0807C9EC @ case 97
	.4byte _0807C9EC @ case 98
	.4byte _0807C9EC @ case 99
	.4byte _0807C9EC @ case 100
	.4byte _0807C9EC @ case 101
	.4byte _0807C9EC @ case 102
	.4byte _0807C9EC @ case 103
	.4byte _0807C9EC @ case 104
	.4byte _0807C9EC @ case 105
	.4byte _0807C9EC @ case 106
	.4byte _0807C9EC @ case 107
	.4byte _0807C9EC @ case 108
	.4byte _0807C9EC @ case 109
	.4byte _0807C9EC @ case 110
	.4byte _0807C9EC @ case 111
	.4byte _0807C9EC @ case 112
	.4byte _0807C9EC @ case 113
	.4byte _0807C9EC @ case 114
	.4byte _0807C9EC @ case 115
	.4byte _0807C9EC @ case 116
	.4byte _0807C9EC @ case 117
	.4byte _0807C9EC @ case 118
	.4byte _0807C9EC @ case 119
	.4byte _0807C9EC @ case 120
	.4byte _0807C9EC @ case 121
	.4byte _0807C9EC @ case 122
	.4byte _0807C9EC @ case 123
	.4byte _0807C9EC @ case 124
	.4byte _0807C9EC @ case 125
	.4byte _0807C9EC @ case 126
	.4byte _0807C9EC @ case 127
	.4byte _0807C9EC @ case 128
	.4byte _0807C9EC @ case 129
	.4byte _0807C9EC @ case 130
	.4byte _0807C9EC @ case 131
	.4byte _0807C9EC @ case 132
	.4byte _0807C9EC @ case 133
	.4byte _0807C9EC @ case 134
	.4byte _0807C9EC @ case 135
	.4byte _0807C9EC @ case 136
	.4byte _0807C9EC @ case 137
	.4byte _0807C9EC @ case 138
	.4byte _0807C9EC @ case 139
	.4byte _0807C9EC @ case 140
	.4byte _0807C9EC @ case 141
	.4byte _0807C9EC @ case 142
	.4byte _0807C9EC @ case 143
	.4byte _0807C9EC @ case 144
	.4byte _0807C9EC @ case 145
	.4byte _0807C9EC @ case 146
	.4byte _0807C9EC @ case 147
	.4byte _0807C9EC @ case 148
	.4byte _0807C9EC @ case 149
	.4byte _0807C9EC @ case 150
	.4byte _0807C9EC @ case 151
	.4byte _0807C9EC @ case 152
	.4byte _0807C9EC @ case 153
	.4byte _0807C9EC @ case 154
	.4byte _0807C9EC @ case 155
	.4byte _0807C9EC @ case 156
	.4byte _0807C9EC @ case 157
	.4byte _0807C9EC @ case 158
	.4byte _0807C9EC @ case 159
	.4byte _0807C9EC @ case 160
	.4byte _0807C9EC @ case 161
	.4byte _0807C9EC @ case 162
	.4byte _0807C9EC @ case 163
	.4byte _0807C9EC @ case 164
	.4byte _0807C9EC @ case 165
	.4byte _0807C9EC @ case 166
	.4byte _0807C850 @ case 167
	.4byte _0807C9EC @ case 168
	.4byte _0807C9EC @ case 169
	.4byte _0807C9EC @ case 170
	.4byte _0807C9EC @ case 171
	.4byte _0807C9EC @ case 172
	.4byte _0807C9EC @ case 173
	.4byte _0807C9EC @ case 174
	.4byte _0807C9EC @ case 175
	.4byte _0807C9EC @ case 176
	.4byte _0807C9EC @ case 177
	.4byte _0807C9EC @ case 178
	.4byte _0807C9EC @ case 179
	.4byte _0807C9EC @ case 180
	.4byte _0807C9EC @ case 181
	.4byte _0807C9EC @ case 182
	.4byte _0807C9EC @ case 183
	.4byte _0807C9EC @ case 184
	.4byte _0807C9EC @ case 185
	.4byte _0807C9EC @ case 186
	.4byte _0807C9EC @ case 187
	.4byte _0807C9EC @ case 188
	.4byte _0807C9EC @ case 189
	.4byte _0807C9EC @ case 190
	.4byte _0807C9EC @ case 191
	.4byte _0807C9EC @ case 192
	.4byte _0807C9EC @ case 193
	.4byte _0807C9EC @ case 194
	.4byte _0807C9EC @ case 195
	.4byte _0807C9EC @ case 196
	.4byte _0807C9EC @ case 197
	.4byte _0807C9EC @ case 198
	.4byte _0807C9EC @ case 199
	.4byte _0807BE98 @ case 200
	.4byte _0807C9EC @ case 201
	.4byte _0807C9EC @ case 202
	.4byte _0807C9EC @ case 203
	.4byte _0807C9EC @ case 204
	.4byte _0807C9EC @ case 205
	.4byte _0807C9EC @ case 206
	.4byte _0807C9EC @ case 207
	.4byte _0807C9EC @ case 208
	.4byte _0807C9EC @ case 209
	.4byte _0807C9EC @ case 210
	.4byte _0807C9EC @ case 211
	.4byte _0807C9EC @ case 212
	.4byte _0807C9EC @ case 213
	.4byte _0807C9EC @ case 214
	.4byte _0807C9EC @ case 215
	.4byte _0807C9EC @ case 216
	.4byte _0807C9EC @ case 217
	.4byte _0807C9EC @ case 218
	.4byte _0807C9EC @ case 219
	.4byte _0807C9EC @ case 220
	.4byte _0807C9EC @ case 221
	.4byte _0807C9EC @ case 222
	.4byte _0807C9EC @ case 223
	.4byte _0807C9EC @ case 224
	.4byte _0807C9EC @ case 225
	.4byte _0807C9EC @ case 226
	.4byte _0807C9EC @ case 227
	.4byte _0807C9EC @ case 228
	.4byte _0807C9EC @ case 229
	.4byte _0807C9EC @ case 230
	.4byte _0807C9EC @ case 231
	.4byte _0807C9EC @ case 232
	.4byte _0807C9EC @ case 233
	.4byte _0807C9EC @ case 234
	.4byte _0807C9EC @ case 235
	.4byte _0807C9EC @ case 236
	.4byte _0807C9EC @ case 237
	.4byte _0807C9EC @ case 238
	.4byte _0807C9EC @ case 239
	.4byte _0807C9EC @ case 240
	.4byte _0807C9EC @ case 241
	.4byte _0807C9EC @ case 242
	.4byte _0807C9EC @ case 243
	.4byte _0807C9EC @ case 244
	.4byte _0807C9EC @ case 245
	.4byte _0807C9EC @ case 246
	.4byte _0807C9EC @ case 247
	.4byte _0807C9EC @ case 248
	.4byte _0807C9EC @ case 249
	.4byte _0807C9EC @ case 250
	.4byte _0807C9EC @ case 251
	.4byte _0807C9EC @ case 252
	.4byte _0807C9EC @ case 253
	.4byte _0807C9EC @ case 254
	.4byte _0807C9EC @ case 255
	.4byte _0807C9EC @ case 256
	.4byte _0807C9EC @ case 257
	.4byte _0807C9EC @ case 258
	.4byte _0807C9EC @ case 259
	.4byte _0807C9EC @ case 260
	.4byte _0807C9EC @ case 261
	.4byte _0807C9EC @ case 262
	.4byte _0807C9EC @ case 263
	.4byte _0807C9EC @ case 264
	.4byte _0807C9EC @ case 265
	.4byte _0807C9EC @ case 266
	.4byte _0807C870 @ case 267
_0807BA84:
	ldr r3, _0807BAEC
	ldr r0, [r7]
	adds r0, #0x8e
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
	ldr r4, [r7]
	adds r2, r4, #0
	adds r2, #0x8e
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, _0807BAF0
	strh r1, [r0, #0x24]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _0807BAF4
	adds r0, r4, #0
	adds r0, #0xf0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	strh r0, [r1, #0x26]
	adds r1, r4, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bl GetCurrentMapMusic
	ldr r1, [r7]
	adds r1, #0xf4
	strh r0, [r1]
	ldr r0, _0807BAF8
	bl PlayNewMapMusic
	bl _0807C9EC
	.align 2, 0
_0807BAEC: .4byte 0x020205AC
_0807BAF0: .4byte 0x0000FF4C
_0807BAF4: .4byte 0x082D45C8
_0807BAF8: .4byte 0x00000179
_0807BAFC:
	ldr r5, [r7]
	adds r6, r5, #0
	adds r6, #0xe6
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	ble _0807BB30
	ldr r2, _0807BB2C
	adds r0, r5, #0
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x24]
	adds r1, #3
	strh r1, [r0, #0x24]
	ldrh r0, [r6]
	subs r0, #3
	strh r0, [r6]
	bl _0807C9EC
	.align 2, 0
_0807BB2C: .4byte 0x020205AC
_0807BB30:
	ldr r2, _0807BB54
	adds r0, r5, #0
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x24]
	strh r1, [r6]
	adds r1, r5, #0
	adds r1, #0x94
	movs r0, #0xa
	strh r0, [r1]
	bl _0807C9EC
	.align 2, 0
_0807BB54: .4byte 0x020205AC
_0807BB58:
	ldr r4, _0807BB94
	ldr r1, _0807BB98
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	ldr r4, _0807BB9C
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0xf0
	ldrh r1, [r2]
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	beq _0807BB86
	adds r0, r1, #0
	movs r1, #0
	bl PlayCry1
_0807BB86:
	ldr r3, [r4]
	adds r1, r3, #0
	adds r1, #0x94
	movs r2, #0
	movs r0, #0xb
	bl _0807C83E
	.align 2, 0
_0807BB94: .4byte 0x02021C7C
_0807BB98: .4byte 0x0830D240
_0807BB9C: .4byte 0x02031F40
_0807BBA0:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x50
	beq _0807BBB0
	bl _0807C9EC
_0807BBB0:
	adds r0, r1, #0
	adds r0, #0x8e
	ldrb r0, [r0]
	ldr r2, _0807BC04
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #5]
	lsrs r1, r1, #4
	movs r2, #2
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0x14
	str r2, [sp, #8]
	ldr r2, _0807BC08
	str r2, [sp, #0xc]
	movs r2, #0x78
	movs r3, #0x20
	bl sub_08076124
	ldr r1, [r7]
	adds r1, #0xd2
	strb r0, [r1]
	ldr r1, [r7]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r4, _0807BC0C
	ldr r1, _0807BC10
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	bl _0807C9EC
	.align 2, 0
_0807BC04: .4byte 0x020205AC
_0807BC08: .4byte 0x000FFFFF
_0807BC0C: .4byte 0x02021C7C
_0807BC10: .4byte 0x0830D24F
_0807BC14:
	ldr r5, _0807BC70
	ldr r0, [r7]
	adds r0, #0xd2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r5, #0
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, _0807BC74
	cmp r1, r0
	beq _0807BC34
	bl _0807C9EC
_0807BC34:
	ldr r0, _0807BC78
	movs r1, #0x78
	movs r2, #0x20
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0xd3
	strb r0, [r1]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0807BC7C
	str r1, [r0]
	adds r2, #0xd2
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	ldr r1, [r7]
	bl _0807C984
	.align 2, 0
_0807BC70: .4byte 0x020205AC
_0807BC74: .4byte 0x08007141
_0807BC78: .4byte 0x0830CF6C
_0807BC7C: .4byte 0x0807E011
_0807BC80:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807BCA0
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x14
	strh r1, [r0]
	bl _0807C9EC
	.align 2, 0
_0807BCA0: .4byte 0x02031F40
_0807BCA4:
	ldr r0, _0807BCD0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807BCB4
	bl _0807C9EC
_0807BCB4:
	movs r0, #4
	bl sub_0807B064
	movs r0, #0
	movs r1, #0xff
	bl FillWindowPixelBuffer
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	bl _0807C980
	.align 2, 0
_0807BCD0: .4byte 0x02037C74
_0807BCD4:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x10
	movs r3, #0
	bl _0807C97C
_0807BCE6:
	ldr r0, _0807BD04
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807BCF6
	bl _0807C9EC
_0807BCF6:
	ldr r0, [r7]
	adds r0, #0x94
	movs r1, #0x17
	strh r1, [r0]
	bl _0807C9EC
	.align 2, 0
_0807BD04: .4byte 0x02037C74
_0807BD08:
	ldr r4, _0807BD24
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0xea
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0807BD28
	adds r0, r1, #0
	subs r0, #0x34
	strh r0, [r2]
	b _0807BD44
	.align 2, 0
_0807BD24: .4byte 0x02031F40
_0807BD28:
	movs r0, #1
	bl sub_0807B064
	ldr r3, [r4]
	adds r1, r3, #0
	adds r1, #0xea
	movs r2, #0
	movs r0, #0x80
	strh r0, [r1]
	subs r1, #0x56
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	str r2, [r3, #0x64]
_0807BD44:
	ldr r0, _0807BD4C
	ldr r4, [r0]
	bl _0807C594
	.align 2, 0
_0807BD4C: .4byte 0x02031F40
_0807BD50:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x14
	bhi _0807BD60
	bl _0807C9EC
_0807BD60:
	bl sub_0807A598
	ldr r0, _0807BD7C
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x91
	strb r0, [r1]
	ldr r1, [r7]
	bl _0807C984
	.align 2, 0
_0807BD7C: .4byte 0x0830D0B8
_0807BD80:
	ldr r2, _0807BDC0
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0807BDA0
	bl _0807C9EC
_0807BDA0:
	adds r0, r1, #0
	bl DestroySprite
	movs r1, #0xc8
	lsls r1, r1, #3
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _0807BDC4
	movs r0, #0x52
	bl SetGpuReg
	ldr r1, [r7]
	bl _0807C984
	.align 2, 0
_0807BDC0: .4byte 0x020205AC
_0807BDC4: .4byte 0x0000040C
_0807BDC8:
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xe0
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	movs r0, #0x9e
	lsls r0, r0, #0x11
	cmp r1, r0
	bne _0807BDE8
	adds r1, r2, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0807BDE8:
	ldr r0, [r7]
	adds r0, #0xe0
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xa4
	lsls r0, r0, #1
	cmp r1, r0
	beq _0807BDFC
	bl _0807C9EC
_0807BDFC:
	ldr r0, _0807BE14
	movs r1, #0x80
	movs r2, #0x41
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x92
	strb r0, [r1]
	bl _0807C9EC
	.align 2, 0
_0807BE14: .4byte 0x0830D040
_0807BE18:
	ldr r0, _0807BE5C
	movs r1, #0x80
	movs r2, #0x50
	movs r3, #3
	bl CreateSprite
	ldr r4, _0807BE60
	ldr r1, [r4]
	adds r1, #0x90
	strb r0, [r1]
	ldr r0, _0807BE64
	movs r1, #0x80
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, #0x91
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807BE68
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAnim
	ldr r1, [r4]
	bl _0807C984
	.align 2, 0
_0807BE5C: .4byte 0x0830CFCC
_0807BE60: .4byte 0x02031F40
_0807BE64: .4byte 0x0830D00C
_0807BE68: .4byte 0x020205AC
_0807BE6C:
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0xe0
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa6
	bne _0807BE86
	subs r1, #0x4c
	movs r0, #0xc8
	strh r0, [r1]
_0807BE86:
	ldr r1, _0807BE94
	movs r0, #0
	bl SetGpuReg
	bl _0807C9EC
	.align 2, 0
_0807BE94: .4byte 0x00001241
_0807BE98:
	ldr r2, _0807BEEC
	ldr r4, [r7]
	adds r3, r4, #0
	adds r3, #0x90
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	subs r1, #2
	strh r1, [r0, #0x22]
	adds r0, r4, #0
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	subs r1, #2
	strh r1, [r0, #0x22]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x22
	ldrsh r1, [r0, r3]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807BEDE
	bl _0807C9EC
_0807BEDE:
	adds r1, r4, #0
	adds r1, #0x94
	movs r0, #0x1d
	strh r0, [r1]
	bl _0807C9EC
	.align 2, 0
_0807BEEC: .4byte 0x020205AC
_0807BEF0:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807BF10
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x1e
	strh r1, [r0]
	bl _0807C9EC
	.align 2, 0
_0807BF10: .4byte 0x02031F40
_0807BF14:
	ldr r0, _0807BF58
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807BF24
	bl _0807C9EC
_0807BF24:
	ldr r0, [r7]
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0807BF5C
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	movs r0, #2
	bl sub_0807B064
	ldr r1, [r7]
	bl _0807C984
	.align 2, 0
_0807BF58: .4byte 0x02037C74
_0807BF5C: .4byte 0x020205AC
_0807BF60:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r5, _0807BFA4
	adds r0, r5, #0
	movs r1, #0x6f
	movs r2, #0xaa
	movs r3, #0
	bl CreateSprite
	ldr r4, _0807BFA8
	ldr r1, [r4]
	adds r1, #0x90
	strb r0, [r1]
	movs r2, #0xa
	rsbs r2, r2, #0
	adds r0, r5, #0
	movs r1, #0x81
	movs r3, #0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, #0x91
	strb r0, [r1]
	ldr r1, [r4]
	bl _0807C984
	.align 2, 0
_0807BFA4: .4byte 0x0830D00C
_0807BFA8: .4byte 0x02031F40
_0807BFAC:
	ldr r0, _0807BFFC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807BFCA
	movs r0, #0x2e
	bl PlaySE
	ldr r0, _0807C000
	ldr r1, [r0]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0807BFCA:
	ldr r3, _0807C004
	ldr r0, _0807C000
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x26]
	subs r1, #3
	strh r1, [r0, #0x26]
	adds r2, #0x91
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	bl _0807C9EC
	.align 2, 0
_0807BFFC: .4byte 0x02037C74
_0807C000: .4byte 0x02031F40
_0807C004: .4byte 0x020205AC
_0807C008:
	ldr r5, _0807C064
	ldr r4, [r7]
	adds r2, r4, #0
	adds r2, #0x90
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x26]
	subs r1, #3
	strh r1, [r0, #0x26]
	adds r6, r4, #0
	adds r6, #0x91
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r5
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	movs r0, #0x5a
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0807C04E
	bl _0807C9EC
_0807C04E:
	movs r2, #1
	strh r2, [r3, #0x30]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x30]
	adds r1, r4, #0
	bl _0807C984
	.align 2, 0
_0807C064: .4byte 0x020205AC
_0807C068:
	ldr r2, _0807C078
	movs r0, #1
	movs r1, #0x10
	bl BlendPalettes
	bl _0807C980
	.align 2, 0
_0807C078: .4byte 0x0000FFFF
_0807C07C:
	ldr r2, _0807C08C
	movs r0, #1
	movs r1, #0
	bl BlendPalettes
	bl _0807C980
	.align 2, 0
_0807C08C: .4byte 0x0000FFFF
_0807C090:
	ldr r2, _0807C0A0
	movs r0, #1
	movs r1, #0x10
	bl BlendPalettes
	bl _0807C980
	.align 2, 0
_0807C0A0: .4byte 0x0000FFFF
_0807C0A4:
	ldr r5, _0807C110
	ldr r0, [r5]
	adds r0, #0xf0
	ldrh r0, [r0]
	bl IsMonSpriteNotFlipped
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C11C
	ldr r4, _0807C114
	ldr r2, [r5]
	adds r2, #0x8e
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r1, _0807C118
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	movs r2, #3
	orrs r1, r2
	strb r1, [r0, #1]
	ldr r0, [r5]
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	movs r2, #3
	movs r3, #3
	bl CalcCenterToCornerVec
	ldr r0, [r5]
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAffineAnim
	b _0807C132
	.align 2, 0
_0807C110: .4byte 0x02031F40
_0807C114: .4byte 0x020205AC
_0807C118: .4byte 0x0830D110
_0807C11C:
	ldr r0, [r5]
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807C1C0
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAffineAnim
_0807C132:
	ldr r5, _0807C1C4
	ldr r0, [r5]
	adds r0, #0x8f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0807C1C0
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAffineAnim
	ldr r2, [r5]
	adds r3, r2, #0
	adds r3, #0x8e
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x3c
	strh r1, [r0, #0x20]
	adds r2, #0x8f
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xb4
	strh r1, [r0, #0x20]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xc0
	strh r1, [r0, #0x22]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0807C1C8
	strh r1, [r0, #0x22]
	ldrb r0, [r3]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x8f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r1, [r5]
	bl _0807C984
	.align 2, 0
_0807C1C0: .4byte 0x020205AC
_0807C1C4: .4byte 0x02031F40
_0807C1C8: .4byte 0x0000FFE0
_0807C1CC:
	ldr r4, _0807C294
	ldr r2, [r7]
	adds r3, r2, #0
	adds r3, #0x8e
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	subs r1, #3
	movs r5, #0
	strh r1, [r0, #0x26]
	adds r2, #0x8f
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x26]
	adds r0, #0xa3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0807C214
	movs r0, #0x2d
	bl PlaySE
_0807C214:
	ldr r2, [r7]
	adds r3, r2, #0
	adds r3, #0x8e
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r6, #0x26
	ldrsh r1, [r0, r6]
	movs r0, #0xde
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807C234
	bl _0807C9EC
_0807C234:
	adds r0, r2, #0
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #0x30]
	adds r0, r2, #0
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #0x30]
	adds r1, r2, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, #0x8f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _0807C298
	movs r0, #1
	movs r1, #0
	bl BlendPalettes
	b _0807C9EC
	.align 2, 0
_0807C294: .4byte 0x020205AC
_0807C298: .4byte 0x0000FFFF
_0807C29C:
	ldr r4, _0807C320
	ldr r2, [r7]
	adds r3, r2, #0
	adds r3, #0x90
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	subs r1, #3
	strh r1, [r0, #0x26]
	adds r2, #0x91
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0x26
	ldrsh r1, [r0, r2]
	movs r0, #0xde
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0807C2DE
	b _0807C9EC
_0807C2DE:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x90
	ldrb r1, [r1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	b _0807C9EC
	.align 2, 0
_0807C320: .4byte 0x020205AC
_0807C324:
	ldr r0, _0807C38C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807C332
	b _0807C9EC
_0807C332:
	ldr r1, [r7]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #1
	bl sub_0807B064
	ldr r0, [r7]
	adds r0, #0xe0
	movs r1, #0xa6
	strh r1, [r0]
	ldr r0, _0807C390
	movs r4, #0x14
	rsbs r4, r4, #0
	movs r1, #0x80
	adds r2, r4, #0
	movs r3, #3
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x90
	strb r0, [r1]
	ldr r0, _0807C394
	movs r1, #0x80
	adds r2, r4, #0
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x91
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807C398
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAnim
	b _0807C9EC
	.align 2, 0
_0807C38C: .4byte 0x02037C74
_0807C390: .4byte 0x0830CFCC
_0807C394: .4byte 0x0830D00C
_0807C398: .4byte 0x020205AC
_0807C39C:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x10
	movs r3, #0
	b _0807C97C
_0807C3AC:
	movs r1, #0x92
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0807C3C8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807C3C4
	b _0807C9EC
_0807C3C4:
	b _0807C980
	.align 2, 0
_0807C3C8: .4byte 0x02037C74
_0807C3CC:
	ldr r2, _0807C418
	ldr r4, [r7]
	adds r3, r4, #0
	adds r3, #0x90
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	adds r0, r4, #0
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x26
	ldrsh r1, [r0, r3]
	movs r6, #0x22
	ldrsh r0, [r0, r6]
	adds r1, r1, r0
	cmp r1, #0x40
	beq _0807C412
	b _0807C9EC
_0807C412:
	adds r1, r4, #0
	b _0807C984
	.align 2, 0
_0807C418: .4byte 0x020205AC
_0807C41C:
	ldr r1, [r7]
	adds r5, r1, #0
	adds r5, #0xe0
	ldrh r0, [r5]
	adds r0, #2
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x9e
	lsls r6, r6, #1
	cmp r0, r6
	bgt _0807C436
	b _0807C9EC
_0807C436:
	strh r6, [r5]
	b _0807C984
_0807C43A:
	ldr r0, [r7]
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0807C474
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r3, [r7]
	adds r2, r3, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	movs r1, #0
	strh r0, [r2]
	str r1, [r3, #0x64]
	b _0807C9EC
	.align 2, 0
_0807C474: .4byte 0x020205AC
_0807C478:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0xa
	beq _0807C486
	b _0807C9EC
_0807C486:
	b _0807C984
_0807C488:
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #0xe0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xae
	lsls r3, r3, #1
	cmp r0, r3
	ble _0807C4AA
	strh r3, [r2]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0807C4AA:
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xe0
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0xa4
	lsls r0, r0, #1
	cmp r1, r0
	beq _0807C4BE
	b _0807C9EC
_0807C4BE:
	adds r0, r2, #0
	adds r0, #0xfa
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807C4CA
	b _0807C9EC
_0807C4CA:
	ldr r0, _0807C4F4
	movs r1, #0x80
	movs r2, #0x41
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x92
	strb r0, [r1]
	ldr r2, _0807C4F8
	ldr r0, [r7]
	adds r0, #0x92
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _0807C4FC
	str r1, [r0]
	b _0807C9EC
	.align 2, 0
_0807C4F4: .4byte 0x0830D040
_0807C4F8: .4byte 0x020205AC
_0807C4FC: .4byte 0x0807A551
_0807C500:
	ldr r0, _0807C520
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	ldr r2, _0807C524
	ldr r1, [r2]
	adds r1, #0x91
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x94
	movs r1, #0x32
	strh r1, [r0]
	b _0807C9EC
	.align 2, 0
_0807C520: .4byte 0x0830D0B8
_0807C524: .4byte 0x02031F40
_0807C528:
	ldr r2, _0807C564
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0807C546
	b _0807C9EC
_0807C546:
	adds r0, r1, #0
	bl DestroySprite
	movs r0, #6
	bl sub_0807B064
	ldr r1, [r7]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0x9f
	bl PlaySE
	b _0807C9EC
	.align 2, 0
_0807C564: .4byte 0x020205AC
_0807C568:
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #0xea
	ldrh r3, [r2]
	ldr r0, _0807C580
	cmp r3, r0
	bhi _0807C584
	adds r0, r3, #0
	adds r0, #0x34
	strh r0, [r2]
	b _0807C592
	.align 2, 0
_0807C580: .4byte 0x000003FF
_0807C584:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0807C592:
	ldr r4, [r7]
_0807C594:
	adds r0, r4, #0
	adds r0, #0xea
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	bl __divsi3
	adds r4, #0xe8
	strh r0, [r4]
	b _0807C9EC
_0807C5A8:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807C5C4
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x3c
	strh r1, [r0]
	b _0807C9EC
	.align 2, 0
_0807C5C4: .4byte 0x02031F40
_0807C5C8:
	ldr r4, _0807C5EC
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807C5D6
	b _0807C9EC
_0807C5D6:
	movs r0, #5
	bl sub_0807B064
	movs r0, #7
	bl sub_0807B064
	ldrb r0, [r4, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #8]
	b _0807C980
	.align 2, 0
_0807C5EC: .4byte 0x02037C74
_0807C5F0:
	ldr r2, _0807C608
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	b _0807C97C
	.align 2, 0
_0807C608: .4byte 0x02037C74
_0807C60C:
	movs r1, #0xa2
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0807C628
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807C624
	b _0807C9EC
_0807C624:
	b _0807C980
	.align 2, 0
_0807C628: .4byte 0x02037C74
_0807C62C:
	ldr r0, _0807C6C0
	movs r2, #8
	rsbs r2, r2, #0
	movs r1, #0x78
	movs r3, #0
	bl CreateSprite
	ldr r5, _0807C6C4
	ldr r1, [r5]
	adds r1, #0xd3
	movs r6, #0
	strb r0, [r1]
	ldr r4, _0807C6C8
	ldr r2, [r5]
	adds r2, #0xd3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x4a
	strh r1, [r0, #0x34]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0807C6CC
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #2
	bl StartSpriteAffineAnim
	ldr r0, [r5]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	ldr r2, _0807C6D0
	movs r1, #0x10
	bl BlendPalettes
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	str r6, [r2, #0x64]
	b _0807C9EC
	.align 2, 0
_0807C6C0: .4byte 0x0830CF6C
_0807C6C4: .4byte 0x02031F40
_0807C6C8: .4byte 0x020205AC
_0807C6CC: .4byte 0x0807E0E5
_0807C6D0: .4byte 0x0000FFFF
_0807C6D4:
	ldr r2, _0807C700
	ldr r0, [r7]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	ldr r1, _0807C704
	str r1, [sp]
	movs r1, #1
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	b _0807C984
	.align 2, 0
_0807C700: .4byte 0x020205AC
_0807C704: .4byte 0x0000FFFF
_0807C708:
	ldr r2, _0807C744
	ldr r3, [r7]
	adds r0, r3, #0
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0807C748
	cmp r1, r0
	beq _0807C726
	b _0807C9EC
_0807C726:
	adds r0, r3, #0
	adds r0, #0xf2
	ldrh r2, [r0]
	lsls r0, r2, #3
	ldr r1, _0807C74C
	adds r0, r0, r1
	ldr r1, _0807C750
	ldr r1, [r1]
	ldr r1, [r1, #0x10]
	ldr r3, [r3, #0x6c]
	bl HandleLoadSpecialPokePic_2
	ldr r1, [r7]
	b _0807C984
	.align 2, 0
_0807C744: .4byte 0x020205AC
_0807C748: .4byte 0x08007141
_0807C74C: .4byte 0x082DDA1C
_0807C750: .4byte 0x02024178
_0807C754:
	ldr r4, _0807C808
	ldr r2, [r7]
	adds r6, r2, #0
	adds r6, #0x8f
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r5, #0
	movs r1, #0x78
	strh r1, [r0, #0x20]
	ldrb r0, [r6]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r3, _0807C80C
	adds r2, #0xf2
	ldrh r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	adds r0, #0x3c
	strh r0, [r1, #0x22]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #0x24]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #0x26]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAnim
	ldr r3, [r7]
	adds r0, r3, #0
	adds r0, #0x8f
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r1, [r1, #5]
	lsrs r1, r1, #4
	movs r2, #2
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0x14
	str r2, [sp, #8]
	ldr r2, _0807C810
	str r2, [sp, #0xc]
	adds r3, #0xf2
	ldrh r2, [r3]
	str r2, [sp, #0x10]
	movs r2, #0x78
	movs r3, #0x54
	bl CreatePokeballSpriteToReleaseMon
	ldr r0, [r7]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, [r7]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r1, [r7]
	b _0807C984
	.align 2, 0
_0807C808: .4byte 0x020205AC
_0807C80C: .4byte 0x082D45C8
_0807C810: .4byte 0x000FFFFF
_0807C814:
	movs r1, #0xaa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r4, _0807C844
	ldr r1, _0807C848
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	ldr r0, _0807C84C
	ldr r3, [r0]
	adds r1, r3, #0
	adds r1, #0x94
	movs r2, #0
	movs r0, #0xa7
_0807C83E:
	strh r0, [r1]
	str r2, [r3, #0x64]
	b _0807C9EC
	.align 2, 0
_0807C844: .4byte 0x02021C7C
_0807C848: .4byte 0x0830D258
_0807C84C: .4byte 0x02031F40
_0807C850:
	ldr r3, [r7]
	ldr r0, [r3, #0x64]
	adds r0, #1
	str r0, [r3, #0x64]
	cmp r0, #0x3c
	bhi _0807C85E
	b _0807C9EC
_0807C85E:
	adds r0, r3, #0
	adds r0, #0x94
	movs r2, #0
	ldr r1, _0807C86C
	strh r1, [r0]
	str r2, [r3, #0x64]
	b _0807C9EC
	.align 2, 0
_0807C86C: .4byte 0x0000010B
_0807C870:
	bl IsCryFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C87C
	b _0807C9EC
_0807C87C:
	ldr r0, _0807C888
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x44
	strh r1, [r0]
	b _0807C9EC
	.align 2, 0
_0807C888: .4byte 0x02031F40
_0807C88C:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0xa
	bne _0807C89E
	ldr r0, _0807C8CC
	bl PlayFanfare
_0807C89E:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	cmp r0, #0xfa
	beq _0807C8A8
	b _0807C9EC
_0807C8A8:
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	movs r5, #0
	strh r0, [r1]
	ldr r4, _0807C8D0
	ldr r1, _0807C8D4
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	ldr r0, [r7]
	str r5, [r0, #0x64]
	b _0807C9EC
	.align 2, 0
_0807C8CC: .4byte 0x00000173
_0807C8D0: .4byte 0x02021C7C
_0807C8D4: .4byte 0x0830D26A
_0807C8D8:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x3c
	beq _0807C8E6
	b _0807C9EC
_0807C8E6:
	b _0807C984
_0807C8E8:
	bl sub_0807EB84
	b _0807C980
_0807C8EE:
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xee
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807C8FE
	movs r0, #1
	b _0807C9EE
_0807C8FE:
	ldr r0, _0807C910
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807C9EC
	adds r1, r2, #0
	b _0807C984
	.align 2, 0
_0807C910: .4byte 0x03002360
_0807C914:
	ldr r0, _0807C958
	ldrb r0, [r0]
	movs r1, #0
	bl sub_0807AF08
	ldr r1, _0807C95C
	ldr r0, _0807C960
	str r0, [r1]
	ldr r7, _0807C964
	ldrb r0, [r7]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0807C968
	adds r0, r0, r5
	movs r1, #1
	movs r2, #0
	bl GetEvolutionTargetSpecies
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0807C980
	ldrb r3, [r7]
	adds r0, r3, #0
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, _0807C96C
	ldr r1, [r1]
	adds r1, #0x8f
	ldrb r2, [r1]
	adds r1, r4, #0
	bl TradeEvolutionScene
	b _0807C980
	.align 2, 0
_0807C958: .4byte 0x02037282
_0807C95C: .4byte 0x03005F28
_0807C960: .4byte 0x0807B045
_0807C964: .4byte 0x02031F38
_0807C968: .4byte 0x02024190
_0807C96C: .4byte 0x02031F40
_0807C970:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
_0807C97C:
	bl BeginNormalPaletteFade
_0807C980:
	ldr r0, _0807C990
	ldr r1, [r0]
_0807C984:
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0807C9EC
	.align 2, 0
_0807C990: .4byte 0x02031F40
_0807C994:
	ldr r0, _0807C9F8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0807C9EC
	ldr r0, [r7]
	adds r0, #0xf4
	ldrh r0, [r0]
	bl PlayNewMapMusic
	ldr r0, [r7]
	cmp r0, #0
	beq _0807C9E2
	bl FreeAllWindowBuffers
	movs r0, #3
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #0
	bl GetBgTilemapBuffer
	bl Free
	bl FreeMonSpritesGfx
	ldr r0, [r7]
	bl Free
	str r4, [r7]
_0807C9E2:
	ldr r0, _0807C9FC
	bl SetMainCallback2
	bl sub_0807E1C4
_0807C9EC:
	movs r0, #0
_0807C9EE:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807C9F8: .4byte 0x02037C74
_0807C9FC: .4byte 0x08085A31
	thumb_func_end sub_0807B624

	thumb_func_start sub_0807CA00
sub_0807CA00: @ 0x0807CA00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r0, _0807CA24
	ldr r1, [r0]
	adds r1, #0x94
	ldrh r5, [r1]
	ldr r1, _0807CA28
	adds r7, r0, #0
	cmp r5, r1
	bls _0807CA18
	bl _0807DE38
_0807CA18:
	lsls r0, r5, #2
	ldr r1, _0807CA2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807CA24: .4byte 0x02031F40
_0807CA28: .4byte 0x0000010B
_0807CA2C: .4byte 0x0807CA30
_0807CA30: @ jump table
	.4byte _0807CE60 @ case 0
	.4byte _0807CED8 @ case 1
	.4byte _0807DE38 @ case 2
	.4byte _0807DE38 @ case 3
	.4byte _0807DE38 @ case 4
	.4byte _0807DE38 @ case 5
	.4byte _0807DE38 @ case 6
	.4byte _0807DE38 @ case 7
	.4byte _0807DE38 @ case 8
	.4byte _0807DE38 @ case 9
	.4byte _0807CF34 @ case 10
	.4byte _0807CF7C @ case 11
	.4byte _0807CFF0 @ case 12
	.4byte _0807DE38 @ case 13
	.4byte _0807D05C @ case 14
	.4byte _0807DE38 @ case 15
	.4byte _0807DE38 @ case 16
	.4byte _0807DE38 @ case 17
	.4byte _0807DE38 @ case 18
	.4byte _0807DE38 @ case 19
	.4byte _0807D080 @ case 20
	.4byte _0807D0B0 @ case 21
	.4byte _0807D0C2 @ case 22
	.4byte _0807D0E4 @ case 23
	.4byte _0807DE38 @ case 24
	.4byte _0807DE38 @ case 25
	.4byte _0807D1DC @ case 26
	.4byte _0807D1FC @ case 27
	.4byte _0807D268 @ case 28
	.4byte _0807D2EC @ case 29
	.4byte _0807D310 @ case 30
	.4byte _0807D35C @ case 31
	.4byte _0807D3A8 @ case 32
	.4byte _0807D404 @ case 33
	.4byte _0807D470 @ case 34
	.4byte _0807D484 @ case 35
	.4byte _0807D498 @ case 36
	.4byte _0807D4AC @ case 37
	.4byte _0807D5D4 @ case 38
	.4byte _0807D6A4 @ case 39
	.4byte _0807D72C @ case 40
	.4byte _0807D7CC @ case 41
	.4byte _0807D7DC @ case 42
	.4byte _0807D7FC @ case 43
	.4byte _0807DE38 @ case 44
	.4byte _0807DE38 @ case 45
	.4byte _0807D920 @ case 46
	.4byte _0807D930 @ case 47
	.4byte _0807D94E @ case 48
	.4byte _0807DE38 @ case 49
	.4byte _0807D974 @ case 50
	.4byte _0807D9B4 @ case 51
	.4byte _0807D9F4 @ case 52
	.4byte _0807DE38 @ case 53
	.4byte _0807DE38 @ case 54
	.4byte _0807DE38 @ case 55
	.4byte _0807DE38 @ case 56
	.4byte _0807DE38 @ case 57
	.4byte _0807DE38 @ case 58
	.4byte _0807DE38 @ case 59
	.4byte _0807DA14 @ case 60
	.4byte _0807DA3C @ case 61
	.4byte _0807DA58 @ case 62
	.4byte _0807DA78 @ case 63
	.4byte _0807DB20 @ case 64
	.4byte _0807DB54 @ case 65
	.4byte _0807DBA0 @ case 66
	.4byte _0807DC60 @ case 67
	.4byte _0807DCD8 @ case 68
	.4byte _0807DD24 @ case 69
	.4byte _0807DD34 @ case 70
	.4byte _0807DD3A @ case 71
	.4byte _0807DD60 @ case 72
	.4byte _0807DDBC @ case 73
	.4byte _0807DDE0 @ case 74
	.4byte _0807DE38 @ case 75
	.4byte _0807DE38 @ case 76
	.4byte _0807DE38 @ case 77
	.4byte _0807DE38 @ case 78
	.4byte _0807DE38 @ case 79
	.4byte _0807DE38 @ case 80
	.4byte _0807DE38 @ case 81
	.4byte _0807DE38 @ case 82
	.4byte _0807DE38 @ case 83
	.4byte _0807DE38 @ case 84
	.4byte _0807DE38 @ case 85
	.4byte _0807DE38 @ case 86
	.4byte _0807DE38 @ case 87
	.4byte _0807DE38 @ case 88
	.4byte _0807DE38 @ case 89
	.4byte _0807DE38 @ case 90
	.4byte _0807DE38 @ case 91
	.4byte _0807DE38 @ case 92
	.4byte _0807DE38 @ case 93
	.4byte _0807DE38 @ case 94
	.4byte _0807DE38 @ case 95
	.4byte _0807DE38 @ case 96
	.4byte _0807DE38 @ case 97
	.4byte _0807DE38 @ case 98
	.4byte _0807DE38 @ case 99
	.4byte _0807DE38 @ case 100
	.4byte _0807DE38 @ case 101
	.4byte _0807DE38 @ case 102
	.4byte _0807DE38 @ case 103
	.4byte _0807DE38 @ case 104
	.4byte _0807DE38 @ case 105
	.4byte _0807DE38 @ case 106
	.4byte _0807DE38 @ case 107
	.4byte _0807DE38 @ case 108
	.4byte _0807DE38 @ case 109
	.4byte _0807DE38 @ case 110
	.4byte _0807DE38 @ case 111
	.4byte _0807DE38 @ case 112
	.4byte _0807DE38 @ case 113
	.4byte _0807DE38 @ case 114
	.4byte _0807DE38 @ case 115
	.4byte _0807DE38 @ case 116
	.4byte _0807DE38 @ case 117
	.4byte _0807DE38 @ case 118
	.4byte _0807DE38 @ case 119
	.4byte _0807DE38 @ case 120
	.4byte _0807DE38 @ case 121
	.4byte _0807DE38 @ case 122
	.4byte _0807DE38 @ case 123
	.4byte _0807D12C @ case 124
	.4byte _0807D160 @ case 125
	.4byte _0807D1B4 @ case 126
	.4byte _0807DE38 @ case 127
	.4byte _0807DE38 @ case 128
	.4byte _0807DE38 @ case 129
	.4byte _0807DE38 @ case 130
	.4byte _0807DE38 @ case 131
	.4byte _0807DE38 @ case 132
	.4byte _0807DE38 @ case 133
	.4byte _0807DE38 @ case 134
	.4byte _0807DE38 @ case 135
	.4byte _0807DE38 @ case 136
	.4byte _0807DE38 @ case 137
	.4byte _0807DE38 @ case 138
	.4byte _0807DE38 @ case 139
	.4byte _0807DE38 @ case 140
	.4byte _0807DE38 @ case 141
	.4byte _0807DE38 @ case 142
	.4byte _0807DE38 @ case 143
	.4byte _0807D854 @ case 144
	.4byte _0807D8BC @ case 145
	.4byte _0807D8F8 @ case 146
	.4byte _0807DE38 @ case 147
	.4byte _0807DE38 @ case 148
	.4byte _0807DE38 @ case 149
	.4byte _0807DE38 @ case 150
	.4byte _0807DE38 @ case 151
	.4byte _0807DE38 @ case 152
	.4byte _0807DE38 @ case 153
	.4byte _0807DE38 @ case 154
	.4byte _0807DE38 @ case 155
	.4byte _0807DE38 @ case 156
	.4byte _0807DE38 @ case 157
	.4byte _0807DE38 @ case 158
	.4byte _0807DE38 @ case 159
	.4byte _0807DE38 @ case 160
	.4byte _0807DE38 @ case 161
	.4byte _0807DE38 @ case 162
	.4byte _0807DE38 @ case 163
	.4byte _0807DE38 @ case 164
	.4byte _0807DE38 @ case 165
	.4byte _0807DE38 @ case 166
	.4byte _0807DC9C @ case 167
	.4byte _0807DE38 @ case 168
	.4byte _0807DE38 @ case 169
	.4byte _0807DE38 @ case 170
	.4byte _0807DE38 @ case 171
	.4byte _0807DE38 @ case 172
	.4byte _0807DE38 @ case 173
	.4byte _0807DE38 @ case 174
	.4byte _0807DE38 @ case 175
	.4byte _0807DE38 @ case 176
	.4byte _0807DE38 @ case 177
	.4byte _0807DE38 @ case 178
	.4byte _0807DE38 @ case 179
	.4byte _0807DE38 @ case 180
	.4byte _0807DE38 @ case 181
	.4byte _0807DE38 @ case 182
	.4byte _0807DE38 @ case 183
	.4byte _0807DE38 @ case 184
	.4byte _0807DE38 @ case 185
	.4byte _0807DE38 @ case 186
	.4byte _0807DE38 @ case 187
	.4byte _0807DE38 @ case 188
	.4byte _0807DE38 @ case 189
	.4byte _0807DE38 @ case 190
	.4byte _0807DE38 @ case 191
	.4byte _0807DE38 @ case 192
	.4byte _0807DE38 @ case 193
	.4byte _0807DE38 @ case 194
	.4byte _0807DE38 @ case 195
	.4byte _0807DE38 @ case 196
	.4byte _0807DE38 @ case 197
	.4byte _0807DE38 @ case 198
	.4byte _0807DE38 @ case 199
	.4byte _0807D294 @ case 200
	.4byte _0807DE38 @ case 201
	.4byte _0807DE38 @ case 202
	.4byte _0807DE38 @ case 203
	.4byte _0807DE38 @ case 204
	.4byte _0807DE38 @ case 205
	.4byte _0807DE38 @ case 206
	.4byte _0807DE38 @ case 207
	.4byte _0807DE38 @ case 208
	.4byte _0807DE38 @ case 209
	.4byte _0807DE38 @ case 210
	.4byte _0807DE38 @ case 211
	.4byte _0807DE38 @ case 212
	.4byte _0807DE38 @ case 213
	.4byte _0807DE38 @ case 214
	.4byte _0807DE38 @ case 215
	.4byte _0807DE38 @ case 216
	.4byte _0807DE38 @ case 217
	.4byte _0807DE38 @ case 218
	.4byte _0807DE38 @ case 219
	.4byte _0807DE38 @ case 220
	.4byte _0807DE38 @ case 221
	.4byte _0807DE38 @ case 222
	.4byte _0807DE38 @ case 223
	.4byte _0807DE38 @ case 224
	.4byte _0807DE38 @ case 225
	.4byte _0807DE38 @ case 226
	.4byte _0807DE38 @ case 227
	.4byte _0807DE38 @ case 228
	.4byte _0807DE38 @ case 229
	.4byte _0807DE38 @ case 230
	.4byte _0807DE38 @ case 231
	.4byte _0807DE38 @ case 232
	.4byte _0807DE38 @ case 233
	.4byte _0807DE38 @ case 234
	.4byte _0807DE38 @ case 235
	.4byte _0807DE38 @ case 236
	.4byte _0807DE38 @ case 237
	.4byte _0807DE38 @ case 238
	.4byte _0807DE38 @ case 239
	.4byte _0807DE38 @ case 240
	.4byte _0807DE38 @ case 241
	.4byte _0807DE38 @ case 242
	.4byte _0807DE38 @ case 243
	.4byte _0807DE38 @ case 244
	.4byte _0807DE38 @ case 245
	.4byte _0807DE38 @ case 246
	.4byte _0807DE38 @ case 247
	.4byte _0807DE38 @ case 248
	.4byte _0807DE38 @ case 249
	.4byte _0807DE38 @ case 250
	.4byte _0807DE38 @ case 251
	.4byte _0807DE38 @ case 252
	.4byte _0807DE38 @ case 253
	.4byte _0807DE38 @ case 254
	.4byte _0807DE38 @ case 255
	.4byte _0807DE38 @ case 256
	.4byte _0807DE38 @ case 257
	.4byte _0807DE38 @ case 258
	.4byte _0807DE38 @ case 259
	.4byte _0807DE38 @ case 260
	.4byte _0807DE38 @ case 261
	.4byte _0807DE38 @ case 262
	.4byte _0807DE38 @ case 263
	.4byte _0807DE38 @ case 264
	.4byte _0807DE38 @ case 265
	.4byte _0807DE38 @ case 266
	.4byte _0807DCBC @ case 267
_0807CE60:
	ldr r3, _0807CEC8
	ldr r0, [r7]
	adds r0, #0x8e
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
	ldr r4, [r7]
	adds r2, r4, #0
	adds r2, #0x8e
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, _0807CECC
	strh r1, [r0, #0x24]
	ldrb r0, [r2]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _0807CED0
	adds r0, r4, #0
	adds r0, #0xf0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	strh r0, [r1, #0x26]
	adds r1, r4, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bl GetCurrentMapMusic
	ldr r1, [r7]
	adds r1, #0xf4
	strh r0, [r1]
	ldr r0, _0807CED4
	bl PlayNewMapMusic
	bl _0807DE38
	.align 2, 0
_0807CEC8: .4byte 0x020205AC
_0807CECC: .4byte 0x0000FF4C
_0807CED0: .4byte 0x082D45C8
_0807CED4: .4byte 0x00000179
_0807CED8:
	ldr r5, [r7]
	adds r6, r5, #0
	adds r6, #0xe6
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	ble _0807CF0C
	ldr r2, _0807CF08
	adds r0, r5, #0
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x24]
	adds r1, #3
	strh r1, [r0, #0x24]
	ldrh r0, [r6]
	subs r0, #3
	strh r0, [r6]
	bl _0807DE38
	.align 2, 0
_0807CF08: .4byte 0x020205AC
_0807CF0C:
	ldr r2, _0807CF30
	adds r0, r5, #0
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x24]
	strh r1, [r6]
	adds r1, r5, #0
	adds r1, #0x94
	movs r0, #0xa
	strh r0, [r1]
	bl _0807DE38
	.align 2, 0
_0807CF30: .4byte 0x020205AC
_0807CF34:
	ldr r4, _0807CF70
	ldr r1, _0807CF74
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	ldr r4, _0807CF78
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0xf0
	ldrh r1, [r2]
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r1, r0
	beq _0807CF62
	adds r0, r1, #0
	movs r1, #0
	bl PlayCry1
_0807CF62:
	ldr r3, [r4]
	adds r1, r3, #0
	adds r1, #0x94
	movs r2, #0
	movs r0, #0xb
	bl _0807DC8A
	.align 2, 0
_0807CF70: .4byte 0x02021C7C
_0807CF74: .4byte 0x0830D240
_0807CF78: .4byte 0x02031F40
_0807CF7C:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x50
	beq _0807CF8C
	bl _0807DE38
_0807CF8C:
	adds r0, r1, #0
	adds r0, #0x8e
	ldrb r0, [r0]
	ldr r2, _0807CFE0
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #5]
	lsrs r1, r1, #4
	movs r2, #2
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0x14
	str r2, [sp, #8]
	ldr r2, _0807CFE4
	str r2, [sp, #0xc]
	movs r2, #0x78
	movs r3, #0x20
	bl sub_08076124
	ldr r1, [r7]
	adds r1, #0xd2
	strb r0, [r1]
	ldr r1, [r7]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r4, _0807CFE8
	ldr r1, _0807CFEC
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	bl _0807DE38
	.align 2, 0
_0807CFE0: .4byte 0x020205AC
_0807CFE4: .4byte 0x000FFFFF
_0807CFE8: .4byte 0x02021C7C
_0807CFEC: .4byte 0x0830D24F
_0807CFF0:
	ldr r5, _0807D04C
	ldr r0, [r7]
	adds r0, #0xd2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r5, #0
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, _0807D050
	cmp r1, r0
	beq _0807D010
	bl _0807DE38
_0807D010:
	ldr r0, _0807D054
	movs r1, #0x78
	movs r2, #0x20
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0xd3
	strb r0, [r1]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0807D058
	str r1, [r0]
	adds r2, #0xd2
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	ldr r1, [r7]
	bl _0807DDD0
	.align 2, 0
_0807D04C: .4byte 0x020205AC
_0807D050: .4byte 0x08007141
_0807D054: .4byte 0x0830CF6C
_0807D058: .4byte 0x0807E011
_0807D05C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807D07C
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x14
	strh r1, [r0]
	bl _0807DE38
	.align 2, 0
_0807D07C: .4byte 0x02031F40
_0807D080:
	ldr r0, _0807D0AC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D090
	bl _0807DE38
_0807D090:
	movs r0, #4
	bl sub_0807B064
	movs r0, #0
	movs r1, #0xff
	bl FillWindowPixelBuffer
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	bl _0807DDCC
	.align 2, 0
_0807D0AC: .4byte 0x02037C74
_0807D0B0:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x10
	movs r3, #0
	bl _0807DDC8
_0807D0C2:
	ldr r0, _0807D0E0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D0D2
	bl _0807DE38
_0807D0D2:
	ldr r0, [r7]
	adds r0, #0x94
	movs r1, #0x17
	strh r1, [r0]
	bl _0807DE38
	.align 2, 0
_0807D0E0: .4byte 0x02037C74
_0807D0E4:
	ldr r4, _0807D100
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0xea
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0807D104
	adds r0, r1, #0
	subs r0, #0x34
	strh r0, [r2]
	b _0807D11E
	.align 2, 0
_0807D100: .4byte 0x02031F40
_0807D104:
	movs r0, #1
	bl sub_0807B064
	ldr r3, [r4]
	adds r1, r3, #0
	adds r1, #0xea
	movs r2, #0
	movs r0, #0x80
	strh r0, [r1]
	subs r1, #0x56
	movs r0, #0x7c
	strh r0, [r1]
	str r2, [r3, #0x64]
_0807D11E:
	ldr r0, _0807D128
	ldr r4, [r0]
	bl _0807D9E0
	.align 2, 0
_0807D128: .4byte 0x02031F40
_0807D12C:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x14
	bhi _0807D13C
	bl _0807DE38
_0807D13C:
	movs r0, #3
	bl sub_0807B064
	ldr r0, _0807D15C
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x91
	strb r0, [r1]
	ldr r1, [r7]
	bl _0807DDD0
	.align 2, 0
_0807D15C: .4byte 0x0830D0D0
_0807D160:
	ldr r2, _0807D1A8
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0807D180
	bl _0807DE38
_0807D180:
	adds r0, r1, #0
	bl DestroySprite
	ldr r1, _0807D1AC
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x82
	lsls r1, r1, #3
	movs r0, #0x52
	bl SetGpuReg
	ldr r0, _0807D1B0
	movs r1, #5
	bl CreateTask
	ldr r1, [r7]
	bl _0807DDD0
	.align 2, 0
_0807D1A8: .4byte 0x020205AC
_0807D1AC: .4byte 0x00000452
_0807D1B0: .4byte 0x0807EC49
_0807D1B4:
	ldr r0, _0807D1D4
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D1C4
	bl _0807DE38
_0807D1C4:
	ldr r0, _0807D1D8
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x1a
	strh r1, [r0]
	bl _0807DE38
	.align 2, 0
_0807D1D4: .4byte 0x0807EC49
_0807D1D8: .4byte 0x02031F40
_0807D1DC:
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xe0
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	movs r0, #0x9e
	lsls r0, r0, #0x11
	cmp r1, r0
	beq _0807D1F6
	bl _0807DE38
_0807D1F6:
	adds r1, r2, #0
	bl _0807DDD0
_0807D1FC:
	ldr r0, _0807D254
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #3
	bl CreateSprite
	ldr r4, _0807D258
	ldr r1, [r4]
	adds r1, #0x90
	strb r0, [r1]
	ldr r5, _0807D25C
	ldr r0, [r4]
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0807D260
	str r1, [r0]
	ldr r0, _0807D264
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, #0x91
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #1
	bl StartSpriteAnim
	ldr r1, [r4]
	bl _0807DDD0
	.align 2, 0
_0807D254: .4byte 0x0830CFCC
_0807D258: .4byte 0x02031F40
_0807D25C: .4byte 0x020205AC
_0807D260: .4byte 0x0807A4BD
_0807D264: .4byte 0x0830D00C
_0807D268:
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0xe0
	ldrh r0, [r1]
	subs r0, #3
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa6
	bne _0807D282
	subs r1, #0x4c
	movs r0, #0xc8
	strh r0, [r1]
_0807D282:
	ldr r1, _0807D290
	movs r0, #0
	bl SetGpuReg
	bl _0807DE38
	.align 2, 0
_0807D290: .4byte 0x00001241
_0807D294:
	ldr r2, _0807D2E8
	ldr r4, [r7]
	adds r3, r4, #0
	adds r3, #0x90
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	subs r1, #2
	strh r1, [r0, #0x22]
	adds r0, r4, #0
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x22]
	subs r1, #2
	strh r1, [r0, #0x22]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r2, #0x22
	ldrsh r1, [r0, r2]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807D2DA
	bl _0807DE38
_0807D2DA:
	adds r1, r4, #0
	adds r1, #0x94
	movs r0, #0x1d
	strh r0, [r1]
	bl _0807DE38
	.align 2, 0
_0807D2E8: .4byte 0x020205AC
_0807D2EC:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807D30C
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x1e
	strh r1, [r0]
	bl _0807DE38
	.align 2, 0
_0807D30C: .4byte 0x02031F40
_0807D310:
	ldr r0, _0807D354
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D320
	bl _0807DE38
_0807D320:
	ldr r0, [r7]
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0807D358
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	movs r0, #2
	bl sub_0807B064
	ldr r1, [r7]
	bl _0807DDD0
	.align 2, 0
_0807D354: .4byte 0x02037C74
_0807D358: .4byte 0x020205AC
_0807D35C:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r5, _0807D3A0
	adds r0, r5, #0
	movs r1, #0x6f
	movs r2, #0xaa
	movs r3, #0
	bl CreateSprite
	ldr r4, _0807D3A4
	ldr r1, [r4]
	adds r1, #0x90
	strb r0, [r1]
	movs r2, #0xa
	rsbs r2, r2, #0
	adds r0, r5, #0
	movs r1, #0x81
	movs r3, #0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, #0x91
	strb r0, [r1]
	ldr r1, [r4]
	bl _0807DDD0
	.align 2, 0
_0807D3A0: .4byte 0x0830D00C
_0807D3A4: .4byte 0x02031F40
_0807D3A8:
	ldr r0, _0807D3F8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807D3C6
	movs r0, #0x2e
	bl PlaySE
	ldr r0, _0807D3FC
	ldr r1, [r0]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0807D3C6:
	ldr r3, _0807D400
	ldr r0, _0807D3FC
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x26]
	subs r1, #3
	strh r1, [r0, #0x26]
	adds r2, #0x91
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	bl _0807DE38
	.align 2, 0
_0807D3F8: .4byte 0x02037C74
_0807D3FC: .4byte 0x02031F40
_0807D400: .4byte 0x020205AC
_0807D404:
	ldr r5, _0807D468
	ldr r4, [r7]
	adds r2, r4, #0
	adds r2, #0x90
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x26]
	subs r1, #3
	strh r1, [r0, #0x26]
	adds r6, r4, #0
	adds r6, #0x91
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r5
	movs r0, #0x26
	ldrsh r1, [r3, r0]
	movs r0, #0x5a
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0807D44A
	bl _0807DE38
_0807D44A:
	movs r2, #1
	strh r2, [r3, #0x30]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x30]
	adds r1, r4, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _0807D46C
	b _0807D692
	.align 2, 0
_0807D468: .4byte 0x020205AC
_0807D46C: .4byte 0x0807ED1D
_0807D470:
	ldr r2, _0807D480
	movs r0, #8
	movs r1, #0x10
	bl BlendPalettes
	bl _0807DDCC
	.align 2, 0
_0807D480: .4byte 0x0000FFFF
_0807D484:
	ldr r2, _0807D494
	movs r0, #8
	movs r1, #0x10
	bl BlendPalettes
	bl _0807DDCC
	.align 2, 0
_0807D494: .4byte 0x0000FFFF
_0807D498:
	ldr r2, _0807D4A8
	movs r0, #8
	movs r1, #0x10
	bl BlendPalettes
	bl _0807DDCC
	.align 2, 0
_0807D4A8: .4byte 0x0000FFFF
_0807D4AC:
	ldr r5, _0807D518
	ldr r0, [r5]
	adds r0, #0xf0
	ldrh r0, [r0]
	bl IsMonSpriteNotFlipped
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D524
	ldr r4, _0807D51C
	ldr r2, [r5]
	adds r2, #0x8e
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r1, _0807D520
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	movs r2, #3
	orrs r1, r2
	strb r1, [r0, #1]
	ldr r0, [r5]
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	movs r2, #3
	movs r3, #3
	bl CalcCenterToCornerVec
	ldr r0, [r5]
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAffineAnim
	b _0807D53A
	.align 2, 0
_0807D518: .4byte 0x02031F40
_0807D51C: .4byte 0x020205AC
_0807D520: .4byte 0x0830D110
_0807D524:
	ldr r0, [r5]
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0807D5C8
	adds r0, r0, r1
	movs r1, #0
	bl StartSpriteAffineAnim
_0807D53A:
	ldr r5, _0807D5CC
	ldr r0, [r5]
	adds r0, #0x8f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0807D5C8
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAffineAnim
	ldr r2, [r5]
	adds r3, r2, #0
	adds r3, #0x8e
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x28
	strh r1, [r0, #0x20]
	adds r2, #0x8f
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xc8
	strh r1, [r0, #0x20]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xc0
	strh r1, [r0, #0x22]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0807D5D0
	strh r1, [r0, #0x22]
	ldrb r0, [r3]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x8f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r1, [r5]
	bl _0807DDD0
	.align 2, 0
_0807D5C8: .4byte 0x020205AC
_0807D5CC: .4byte 0x02031F40
_0807D5D0: .4byte 0x0000FFE0
_0807D5D4:
	ldr r4, _0807D69C
	ldr r2, [r7]
	adds r3, r2, #0
	adds r3, #0x8e
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	subs r1, #3
	movs r5, #0
	strh r1, [r0, #0x26]
	adds r2, #0x8f
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #0x26]
	adds r0, #0xa3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0807D61C
	movs r0, #0x2d
	bl PlaySE
_0807D61C:
	ldr r2, [r7]
	adds r3, r2, #0
	adds r3, #0x8e
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r6, #0x26
	ldrsh r1, [r0, r6]
	movs r0, #0xde
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807D63C
	bl _0807DE38
_0807D63C:
	adds r0, r2, #0
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #0x30]
	adds r0, r2, #0
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #0x30]
	adds r1, r2, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r7]
	adds r0, #0x8f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0807D6A0
_0807D692:
	movs r1, #5
	bl CreateTask
	b _0807DE38
	.align 2, 0
_0807D69C: .4byte 0x020205AC
_0807D6A0: .4byte 0x0807EDD5
_0807D6A4:
	ldr r4, _0807D728
	ldr r2, [r7]
	adds r3, r2, #0
	adds r3, #0x90
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	subs r1, #3
	strh r1, [r0, #0x26]
	adds r2, #0x91
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x26]
	adds r1, #3
	strh r1, [r0, #0x26]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0x26
	ldrsh r1, [r0, r2]
	movs r0, #0xde
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0807D6E6
	b _0807DE38
_0807D6E6:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x90
	ldrb r1, [r1]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	b _0807DE38
	.align 2, 0
_0807D728: .4byte 0x020205AC
_0807D72C:
	ldr r0, _0807D7B8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D73A
	b _0807DE38
_0807D73A:
	ldr r1, [r7]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #1
	bl sub_0807B064
	ldr r0, [r7]
	adds r0, #0xe0
	movs r1, #0xa6
	strh r1, [r0]
	movs r0, #3
	bl sub_0807B064
	ldr r0, [r7]
	adds r0, #0xe4
	movs r1, #0xce
	lsls r1, r1, #1
	strh r1, [r0]
	ldr r0, _0807D7BC
	movs r4, #0x14
	rsbs r4, r4, #0
	movs r1, #0x78
	adds r2, r4, #0
	movs r3, #3
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x90
	strb r0, [r1]
	ldr r5, _0807D7C0
	ldr r0, [r7]
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0807D7C4
	str r1, [r0]
	ldr r0, _0807D7C8
	movs r1, #0x78
	adds r2, r4, #0
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, #0x91
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #1
	bl StartSpriteAnim
	b _0807DE38
	.align 2, 0
_0807D7B8: .4byte 0x02037C74
_0807D7BC: .4byte 0x0830CFCC
_0807D7C0: .4byte 0x020205AC
_0807D7C4: .4byte 0x0807A4BD
_0807D7C8: .4byte 0x0830D00C
_0807D7CC:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0x10
	movs r3, #0
	b _0807DDC8
_0807D7DC:
	movs r1, #0x92
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0807D7F8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D7F4
	b _0807DE38
_0807D7F4:
	b _0807DDCC
	.align 2, 0
_0807D7F8: .4byte 0x02037C74
_0807D7FC:
	ldr r2, _0807D850
	ldr r4, [r7]
	adds r3, r4, #0
	adds r3, #0x90
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	adds r1, #4
	strh r1, [r0, #0x26]
	adds r0, r4, #0
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	adds r1, #4
	strh r1, [r0, #0x26]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r6, #0x26
	ldrsh r1, [r0, r6]
	movs r2, #0x22
	ldrsh r0, [r0, r2]
	adds r1, r1, r0
	cmp r1, #0x40
	beq _0807D842
	b _0807DE38
_0807D842:
	adds r0, r4, #0
	adds r0, #0x94
	movs r1, #0x90
	strh r1, [r0]
	movs r0, #0
	str r0, [r4, #0x64]
	b _0807DE38
	.align 2, 0
_0807D850: .4byte 0x020205AC
_0807D854:
	movs r1, #0xb2
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r4, _0807D8B0
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0xe0
	ldrh r0, [r1]
	adds r0, #3
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r1]
	adds r0, #3
	strh r0, [r1]
	ldr r0, [r2, #0x64]
	adds r0, #1
	str r0, [r2, #0x64]
	cmp r0, #0xa
	bne _0807D898
	ldr r0, _0807D8B4
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0807D8B8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1, #0xc]
_0807D898:
	ldr r1, [r4]
	adds r3, r1, #0
	adds r3, #0xe0
	movs r6, #0
	ldrsh r0, [r3, r6]
	movs r2, #0x9e
	lsls r2, r2, #1
	cmp r0, r2
	bgt _0807D8AC
	b _0807DE38
_0807D8AC:
	strh r2, [r3]
	b _0807DDD0
	.align 2, 0
_0807D8B0: .4byte 0x02031F40
_0807D8B4: .4byte 0x0807EC49
_0807D8B8: .4byte 0x03005B60
_0807D8BC:
	ldr r0, [r7]
	adds r0, #0x90
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0807D8F4
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r3, [r7]
	adds r2, r3, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	movs r1, #0
	strh r0, [r2]
	str r1, [r3, #0x64]
	b _0807DE38
	.align 2, 0
_0807D8F4: .4byte 0x020205AC
_0807D8F8:
	ldr r0, _0807D918
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _0807D908
	b _0807DE38
_0807D908:
	ldr r0, _0807D91C
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x94
	movs r0, #0x2e
	strh r0, [r1]
	str r3, [r2, #0x64]
	b _0807DE38
	.align 2, 0
_0807D918: .4byte 0x0807EC49
_0807D91C: .4byte 0x02031F40
_0807D920:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0xa
	beq _0807D92E
	b _0807DE38
_0807D92E:
	b _0807DDD0
_0807D930:
	ldr r1, [r7]
	adds r5, r1, #0
	adds r5, #0xe0
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0xae
	lsls r6, r6, #1
	cmp r0, r6
	bgt _0807D94A
	b _0807DE38
_0807D94A:
	strh r6, [r5]
	b _0807DDD0
_0807D94E:
	ldr r0, _0807D96C
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	ldr r2, _0807D970
	ldr r1, [r2]
	adds r1, #0x91
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x94
	movs r1, #0x32
	strh r1, [r0]
	b _0807DE38
	.align 2, 0
_0807D96C: .4byte 0x0830D0B8
_0807D970: .4byte 0x02031F40
_0807D974:
	ldr r2, _0807D9B0
	ldr r0, [r7]
	adds r0, #0x91
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0807D992
	b _0807DE38
_0807D992:
	adds r0, r1, #0
	bl DestroySprite
	movs r0, #6
	bl sub_0807B064
	ldr r1, [r7]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0x9f
	bl PlaySE
	b _0807DE38
	.align 2, 0
_0807D9B0: .4byte 0x020205AC
_0807D9B4:
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #0xea
	ldrh r3, [r2]
	ldr r0, _0807D9CC
	cmp r3, r0
	bhi _0807D9D0
	adds r0, r3, #0
	adds r0, #0x34
	strh r0, [r2]
	b _0807D9DE
	.align 2, 0
_0807D9CC: .4byte 0x000003FF
_0807D9D0:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2]
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0807D9DE:
	ldr r4, [r7]
_0807D9E0:
	adds r0, r4, #0
	adds r0, #0xea
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	bl __divsi3
	adds r4, #0xe8
	strh r0, [r4]
	b _0807DE38
_0807D9F4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807DA10
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x3c
	strh r1, [r0]
	b _0807DE38
	.align 2, 0
_0807DA10: .4byte 0x02031F40
_0807DA14:
	ldr r4, _0807DA38
	ldrb r1, [r4, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807DA22
	b _0807DE38
_0807DA22:
	movs r0, #5
	bl sub_0807B064
	movs r0, #7
	bl sub_0807B064
	ldrb r0, [r4, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #8]
	b _0807DDCC
	.align 2, 0
_0807DA38: .4byte 0x02037C74
_0807DA3C:
	ldr r2, _0807DA54
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	b _0807DDC8
	.align 2, 0
_0807DA54: .4byte 0x02037C74
_0807DA58:
	movs r1, #0xa2
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r0, _0807DA74
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807DA70
	b _0807DE38
_0807DA70:
	b _0807DDCC
	.align 2, 0
_0807DA74: .4byte 0x02037C74
_0807DA78:
	ldr r0, _0807DB0C
	movs r2, #8
	rsbs r2, r2, #0
	movs r1, #0x78
	movs r3, #0
	bl CreateSprite
	ldr r5, _0807DB10
	ldr r1, [r5]
	adds r1, #0xd3
	movs r6, #0
	strb r0, [r1]
	ldr r4, _0807DB14
	ldr r2, [r5]
	adds r2, #0xd3
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x4a
	strh r1, [r0, #0x34]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0807DB18
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #2
	bl StartSpriteAffineAnim
	ldr r0, [r5]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	ldr r2, _0807DB1C
	movs r1, #0x10
	bl BlendPalettes
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	str r6, [r2, #0x64]
	b _0807DE38
	.align 2, 0
_0807DB0C: .4byte 0x0830CF6C
_0807DB10: .4byte 0x02031F40
_0807DB14: .4byte 0x020205AC
_0807DB18: .4byte 0x0807E0E5
_0807DB1C: .4byte 0x0000FFFF
_0807DB20:
	ldr r2, _0807DB4C
	ldr r0, [r7]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	ldr r1, _0807DB50
	str r1, [sp]
	movs r1, #1
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r1, [r7]
	b _0807DDD0
	.align 2, 0
_0807DB4C: .4byte 0x020205AC
_0807DB50: .4byte 0x0000FFFF
_0807DB54:
	ldr r2, _0807DB90
	ldr r3, [r7]
	adds r0, r3, #0
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r0, _0807DB94
	cmp r1, r0
	beq _0807DB72
	b _0807DE38
_0807DB72:
	adds r0, r3, #0
	adds r0, #0xf2
	ldrh r2, [r0]
	lsls r0, r2, #3
	ldr r1, _0807DB98
	adds r0, r0, r1
	ldr r1, _0807DB9C
	ldr r1, [r1]
	ldr r1, [r1, #0x10]
	ldr r3, [r3, #0x6c]
	bl HandleLoadSpecialPokePic_2
	ldr r1, [r7]
	b _0807DDD0
	.align 2, 0
_0807DB90: .4byte 0x020205AC
_0807DB94: .4byte 0x08007141
_0807DB98: .4byte 0x082DDA1C
_0807DB9C: .4byte 0x02024178
_0807DBA0:
	ldr r4, _0807DC54
	ldr r2, [r7]
	adds r6, r2, #0
	adds r6, #0x8f
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r5, #0
	movs r1, #0x78
	strh r1, [r0, #0x20]
	ldrb r0, [r6]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r3, _0807DC58
	adds r2, #0xf2
	ldrh r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	adds r0, #0x3c
	strh r0, [r1, #0x22]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #0x24]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #0x26]
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	bl StartSpriteAnim
	ldr r3, [r7]
	adds r0, r3, #0
	adds r0, #0x8f
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r1, [r1, #5]
	lsrs r1, r1, #4
	movs r2, #2
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0x14
	str r2, [sp, #8]
	ldr r2, _0807DC5C
	str r2, [sp, #0xc]
	adds r3, #0xf2
	ldrh r2, [r3]
	str r2, [sp, #0x10]
	movs r2, #0x78
	movs r3, #0x54
	bl CreatePokeballSpriteToReleaseMon
	ldr r0, [r7]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, [r7]
	adds r0, #0xd3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldr r1, [r7]
	b _0807DDD0
	.align 2, 0
_0807DC54: .4byte 0x020205AC
_0807DC58: .4byte 0x082D45C8
_0807DC5C: .4byte 0x000FFFFF
_0807DC60:
	movs r1, #0xaa
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r4, _0807DC90
	ldr r1, _0807DC94
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	ldr r0, _0807DC98
	ldr r3, [r0]
	adds r1, r3, #0
	adds r1, #0x94
	movs r2, #0
	movs r0, #0xa7
_0807DC8A:
	strh r0, [r1]
	str r2, [r3, #0x64]
	b _0807DE38
	.align 2, 0
_0807DC90: .4byte 0x02021C7C
_0807DC94: .4byte 0x0830D258
_0807DC98: .4byte 0x02031F40
_0807DC9C:
	ldr r3, [r7]
	ldr r0, [r3, #0x64]
	adds r0, #1
	str r0, [r3, #0x64]
	cmp r0, #0x3c
	bhi _0807DCAA
	b _0807DE38
_0807DCAA:
	adds r0, r3, #0
	adds r0, #0x94
	movs r2, #0
	ldr r1, _0807DCB8
	strh r1, [r0]
	str r2, [r3, #0x64]
	b _0807DE38
	.align 2, 0
_0807DCB8: .4byte 0x0000010B
_0807DCBC:
	bl IsCryFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807DCC8
	b _0807DE38
_0807DCC8:
	ldr r0, _0807DCD4
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0x44
	strh r1, [r0]
	b _0807DE38
	.align 2, 0
_0807DCD4: .4byte 0x02031F40
_0807DCD8:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0xa
	bne _0807DCEA
	ldr r0, _0807DD18
	bl PlayFanfare
_0807DCEA:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	cmp r0, #0xfa
	beq _0807DCF4
	b _0807DE38
_0807DCF4:
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	movs r5, #0
	strh r0, [r1]
	ldr r4, _0807DD1C
	ldr r1, _0807DD20
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	ldr r0, [r7]
	str r5, [r0, #0x64]
	b _0807DE38
	.align 2, 0
_0807DD18: .4byte 0x00000173
_0807DD1C: .4byte 0x02021C7C
_0807DD20: .4byte 0x0830D26A
_0807DD24:
	ldr r1, [r7]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x3c
	beq _0807DD32
	b _0807DE38
_0807DD32:
	b _0807DDD0
_0807DD34:
	bl sub_0807EB84
	b _0807DDCC
_0807DD3A:
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0xee
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807DD4A
	movs r0, #1
	b _0807DE3A
_0807DD4A:
	ldr r0, _0807DD5C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807DE38
	adds r1, r2, #0
	b _0807DDD0
	.align 2, 0
_0807DD5C: .4byte 0x03002360
_0807DD60:
	ldr r0, _0807DDA4
	ldrb r0, [r0]
	movs r1, #0
	bl sub_0807AF08
	ldr r1, _0807DDA8
	ldr r0, _0807DDAC
	str r0, [r1]
	ldr r7, _0807DDB0
	ldrb r0, [r7]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0807DDB4
	adds r0, r0, r5
	movs r1, #1
	movs r2, #0
	bl GetEvolutionTargetSpecies
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0807DDCC
	ldrb r3, [r7]
	adds r0, r3, #0
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, _0807DDB8
	ldr r1, [r1]
	adds r1, #0x8f
	ldrb r2, [r1]
	adds r1, r4, #0
	bl TradeEvolutionScene
	b _0807DDCC
	.align 2, 0
_0807DDA4: .4byte 0x02037282
_0807DDA8: .4byte 0x03005F28
_0807DDAC: .4byte 0x0807B045
_0807DDB0: .4byte 0x02031F38
_0807DDB4: .4byte 0x02024190
_0807DDB8: .4byte 0x02031F40
_0807DDBC:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
_0807DDC8:
	bl BeginNormalPaletteFade
_0807DDCC:
	ldr r0, _0807DDDC
	ldr r1, [r0]
_0807DDD0:
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0807DE38
	.align 2, 0
_0807DDDC: .4byte 0x02031F40
_0807DDE0:
	ldr r0, _0807DE44
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0807DE38
	ldr r0, [r7]
	adds r0, #0xf4
	ldrh r0, [r0]
	bl PlayNewMapMusic
	ldr r0, [r7]
	cmp r0, #0
	beq _0807DE2E
	bl FreeAllWindowBuffers
	movs r0, #3
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #0
	bl GetBgTilemapBuffer
	bl Free
	bl FreeMonSpritesGfx
	ldr r0, [r7]
	bl Free
	str r4, [r7]
_0807DE2E:
	ldr r0, _0807DE48
	bl SetMainCallback2
	bl sub_0807E1C4
_0807DE38:
	movs r0, #0
_0807DE3A:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807DE44: .4byte 0x02037C74
_0807DE48: .4byte 0x08085A31
	thumb_func_end sub_0807CA00

	thumb_func_start c2_08053788
c2_08053788: @ 0x0807DE4C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0807DE68
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807DE6C
	cmp r0, #4
	beq _0807DE7C
	b _0807DEEC
	.align 2, 0
_0807DE68: .4byte 0x03002360
_0807DE6C:
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0807DE78
	movs r0, #1
	b _0807DEEA
	.align 2, 0
_0807DE78: .4byte 0x030027A0
_0807DE7C:
	ldr r0, _0807DEB8
	ldr r1, _0807DEBC
	mov r8, r1
	str r1, [r0]
	ldr r7, _0807DEC0
	ldrb r0, [r7]
	movs r6, #0x64
	muls r0, r6, r0
	ldr r5, _0807DEC4
	adds r0, r0, r5
	movs r1, #1
	movs r2, #0
	bl GetEvolutionTargetSpecies
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0807DECC
	ldrb r3, [r7]
	adds r0, r3, #0
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, _0807DEC8
	ldr r1, [r1]
	adds r1, #0x8f
	ldrb r2, [r1]
	adds r1, r4, #0
	bl TradeEvolutionScene
	b _0807DEE6
	.align 2, 0
_0807DEB8: .4byte 0x03005F28
_0807DEBC: .4byte 0x0807E589
_0807DEC0: .4byte 0x02031F38
_0807DEC4: .4byte 0x02024190
_0807DEC8: .4byte 0x02031F40
_0807DECC:
	bl sub_08076C68
	cmp r0, #0
	beq _0807DEE0
	ldr r0, _0807DEDC
	bl SetMainCallback2
	b _0807DEE6
	.align 2, 0
_0807DEDC: .4byte 0x0807EE9D
_0807DEE0:
	mov r0, r8
	bl SetMainCallback2
_0807DEE6:
	ldr r1, _0807DF10
	movs r0, #0xff
_0807DEEA:
	strb r0, [r1]
_0807DEEC:
	bl HasLinkErrorOccurred
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807DEFA
	bl RunTasks
_0807DEFA:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF10: .4byte 0x02031F38
	thumb_func_end c2_08053788

	thumb_func_start sub_0807DF14
sub_0807DF14: @ 0x0807DF14
	push {r4, r5, r6, lr}
	bl sub_0807A738
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #1
	adds r0, r5, #0
	ands r0, r6
	cmp r0, #0
	beq _0807DF52
	ldr r4, _0807DF80
	ldrh r1, [r4]
	ldr r0, _0807DF84
	cmp r1, r0
	bne _0807DF3C
	ldr r0, _0807DF88
	bl SetMainCallback2
_0807DF3C:
	ldrh r1, [r4]
	ldr r0, _0807DF8C
	cmp r1, r0
	bne _0807DF4C
	ldr r0, _0807DF90
	ldr r0, [r0]
	adds r0, #0x72
	strb r6, [r0]
_0807DF4C:
	movs r0, #0
	bl ResetBlockReceivedFlag
_0807DF52:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0807DF7A
	ldr r0, _0807DF80
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _0807DF8C
	cmp r1, r0
	bne _0807DF74
	ldr r0, _0807DF90
	ldr r0, [r0]
	adds r0, #0x73
	movs r1, #1
	strb r1, [r0]
_0807DF74:
	movs r0, #1
	bl ResetBlockReceivedFlag
_0807DF7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF80: .4byte 0x0202207C
_0807DF84: .4byte 0x0000DCBA
_0807DF88: .4byte 0x0807DE4D
_0807DF8C: .4byte 0x0000ABCD
_0807DF90: .4byte 0x02031F40
	thumb_func_end sub_0807DF14

	thumb_func_start sub_0807DF94
sub_0807DF94: @ 0x0807DF94
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	bl __divsi3
	ldrh r4, [r5, #0x22]
	adds r4, r4, r0
	strh r4, [r5, #0x22]
	ldrh r0, [r5, #0x30]
	ldrh r2, [r5, #0x38]
	adds r0, r0, r2
	strh r0, [r5, #0x38]
	movs r1, #0x38
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	bl __divsi3
	strh r0, [r5, #0x20]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0x4c
	ble _0807DFE2
	movs r0, #0x4c
	strh r0, [r5, #0x22]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	rsbs r0, r0, #0
	movs r1, #0x64
	bl __divsi3
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
_0807DFE2:
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _0807DFEE
	movs r0, #0
	strh r0, [r5, #0x30]
_0807DFEE:
	ldrh r0, [r5, #0x36]
	ldrh r2, [r5, #0x2e]
	adds r0, r0, r2
	strh r0, [r5, #0x2e]
	movs r1, #0x34
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bne _0807E006
	movs r0, #1
	strh r0, [r5, #0x3c]
	ldr r0, _0807E00C
	str r0, [r5, #0x1c]
_0807E006:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E00C: .4byte 0x08007141
	thumb_func_end sub_0807DF94

	thumb_func_start sub_0807E010
sub_0807E010: @ 0x0807E010
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0807E078
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0x16
	bne _0807E038
	movs r0, #0x38
	bl PlaySE
_0807E038:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bne _0807E06E
	movs r0, #0x8c
	bl PlaySE
	ldr r0, _0807E07C
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldrb r1, [r4, #5]
	lsrs r1, r1, #4
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _0807E080
	str r2, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0807E06E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E078: .4byte 0x0830D2A4
_0807E07C: .4byte 0x0807E085
_0807E080: .4byte 0x0000FFFF
	thumb_func_end sub_0807E010

	thumb_func_start sub_0807E084
sub_0807E084: @ 0x0807E084
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x14
	bne _0807E098
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_0807E098:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0807E0D6
	ldr r1, _0807E0DC
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r4, #0x26]
	subs r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	bne _0807E0D6
	adds r0, r4, #0
	bl DestroySprite
	ldr r0, _0807E0E0
	ldr r0, [r0]
	adds r0, #0x94
	movs r1, #0xe
	strh r1, [r0]
_0807E0D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E0DC: .4byte 0x0830D2A4
_0807E0E0: .4byte 0x02031F40
	thumb_func_end sub_0807E084

	thumb_func_start sub_0807E0E4
sub_0807E0E4: @ 0x0807E0E4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x32]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807E114
	ldrh r0, [r4, #0x22]
	adds r0, #4
	strh r0, [r4, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _0807E164
	adds r0, r2, #1
	strh r0, [r4, #0x32]
	movs r0, #0x16
	strh r0, [r4, #0x2e]
	movs r0, #0x38
	bl PlaySE
	b _0807E164
_0807E114:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0x42
	bne _0807E122
	movs r0, #0x39
	bl PlaySE
_0807E122:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0x5c
	bne _0807E130
	movs r0, #0x3a
	bl PlaySE
_0807E130:
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r0, #0x6b
	bne _0807E13E
	movs r0, #0x3b
	bl PlaySE
_0807E13E:
	ldr r1, _0807E16C
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r4, #0x26]
	adds r0, r0, r3
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6c
	bne _0807E164
	ldr r0, _0807E170
	str r0, [r4, #0x1c]
_0807E164:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E16C: .4byte 0x0830D2A4
_0807E170: .4byte 0x08007141
	thumb_func_end sub_0807E0E4

	thumb_func_start GetInGameTradeSpeciesInfo
GetInGameTradeSpeciesInfo: @ 0x0807E174
	push {r4, r5, lr}
	ldr r0, _0807E1B0
	ldrh r0, [r0]
	lsls r4, r0, #4
	subs r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0807E1B4
	adds r4, r4, r0
	ldr r0, _0807E1B8
	ldrh r2, [r4, #0x38]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r5, _0807E1BC
	adds r1, r1, r5
	bl StringCopy
	ldr r0, _0807E1C0
	ldrh r2, [r4, #0xc]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	bl StringCopy
	ldrh r0, [r4, #0x38]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807E1B0: .4byte 0x02037280
_0807E1B4: .4byte 0x0830D114
_0807E1B8: .4byte 0x02021C40
_0807E1BC: .4byte 0x082EA31C
_0807E1C0: .4byte 0x02021C54
	thumb_func_end GetInGameTradeSpeciesInfo

	thumb_func_start sub_0807E1C4
sub_0807E1C4: @ 0x0807E1C4
	push {r4, lr}
	sub sp, #0x20
	ldr r0, _0807E20C
	ldrh r0, [r0]
	lsls r4, r0, #4
	subs r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0807E210
	adds r4, r4, r0
	ldr r0, _0807E214
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0807E218
	adds r0, r0, r1
	movs r1, #2
	mov r2, sp
	bl GetMonData
	ldr r0, _0807E21C
	mov r1, sp
	bl StringCopy10
	ldr r0, _0807E220
	ldrh r2, [r4, #0xc]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _0807E224
	adds r1, r1, r2
	bl StringCopy
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E20C: .4byte 0x02037280
_0807E210: .4byte 0x0830D114
_0807E214: .4byte 0x02037282
_0807E218: .4byte 0x02024190
_0807E21C: .4byte 0x02021C40
_0807E220: .4byte 0x02021C54
_0807E224: .4byte 0x082EA31C
	thumb_func_end sub_0807E1C4

	thumb_func_start _CreateInGameTradePokemon
_CreateInGameTradePokemon: @ 0x0807E228
	push {r4, r5, r6, r7, lr}
	sub sp, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r1, #4
	subs r2, r2, r1
	lsls r2, r2, #2
	ldr r1, _0807E384
	adds r5, r2, r1
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0807E388
	adds r0, r0, r1
	movs r1, #0x38
	bl GetMonData
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	add r4, sp, #0x34
	movs r0, #0xfe
	strb r0, [r4]
	ldr r6, _0807E38C
	ldrh r1, [r5, #0xc]
	movs r3, #1
	str r3, [sp]
	ldr r0, [r5, #0x24]
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5, #0x18]
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r3, #0x20
	bl CreateMon
	adds r2, r5, #0
	adds r2, #0xe
	adds r0, r6, #0
	movs r1, #0x27
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0xf
	adds r0, r6, #0
	movs r1, #0x28
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x10
	adds r0, r6, #0
	movs r1, #0x29
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x11
	adds r0, r6, #0
	movs r1, #0x2a
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x12
	adds r0, r6, #0
	movs r1, #0x2b
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x13
	adds r0, r6, #0
	movs r1, #0x2c
	bl SetMonData
	adds r0, r6, #0
	movs r1, #2
	adds r2, r5, #0
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x2b
	adds r0, r6, #0
	movs r1, #7
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x36
	adds r0, r6, #0
	movs r1, #0x31
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x14
	adds r0, r6, #0
	movs r1, #0x2e
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x1d
	adds r0, r6, #0
	movs r1, #0x17
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x1e
	adds r0, r6, #0
	movs r1, #0x18
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x1c
	adds r0, r6, #0
	movs r1, #0x16
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x1f
	adds r0, r6, #0
	movs r1, #0x21
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x20
	adds r0, r6, #0
	movs r1, #0x2f
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x37
	adds r0, r6, #0
	movs r1, #0x30
	bl SetMonData
	adds r0, r6, #0
	movs r1, #0x23
	adds r2, r4, #0
	bl SetMonData
	mov r4, sp
	adds r4, #0x35
	movs r0, #0
	strb r0, [r4]
	ldrh r0, [r5, #0x28]
	cmp r0, #0
	beq _0807E3A0
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807E394
	add r0, sp, #0x10
	adds r1, r5, #0
	bl sub_0807E3B4
	ldr r0, _0807E390
	add r1, sp, #0x10
	ldm r1!, {r2, r3, r7}
	stm r0!, {r2, r3, r7}
	ldm r1!, {r2, r3, r7}
	stm r0!, {r2, r3, r7}
	ldm r1!, {r2, r3, r7}
	stm r0!, {r2, r3, r7}
	adds r0, r6, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl SetMonData
	adds r2, r5, #0
	adds r2, #0x28
	adds r0, r6, #0
	movs r1, #0xc
	bl SetMonData
	b _0807E3A0
	.align 2, 0
_0807E384: .4byte 0x0830D114
_0807E388: .4byte 0x02024190
_0807E38C: .4byte 0x020243E8
_0807E390: .4byte 0x02031E60
_0807E394:
	adds r2, r5, #0
	adds r2, #0x28
	adds r0, r6, #0
	movs r1, #0xc
	bl SetMonData
_0807E3A0:
	ldr r0, _0807E3B0
	bl CalculateMonStats
	add sp, #0x38
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3B0: .4byte 0x020243E8
	thumb_func_end _CreateInGameTradePokemon

	thumb_func_start sub_0807E3B4
sub_0807E3B4: @ 0x0807E3B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0807E408
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	adds r1, r4, #0
	movs r3, #8
_0807E3CE:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _0807E3CE
	adds r0, r4, #0
	adds r0, #0x12
	adds r1, r5, #0
	adds r1, #0x2b
	bl StringCopy
	ldr r1, [r5, #0x18]
	lsrs r0, r1, #0x18
	strb r0, [r4, #0x1a]
	lsrs r0, r1, #0x10
	strb r0, [r4, #0x1b]
	lsrs r0, r1, #8
	strb r0, [r4, #0x1c]
	strb r1, [r4, #0x1d]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #0x1e]
	ldrh r0, [r5, #0x28]
	strh r0, [r4, #0x20]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E408: .4byte 0x0830D204
	thumb_func_end sub_0807E3B4

	thumb_func_start GetTradeSpecies
GetTradeSpecies: @ 0x0807E40C
	push {r4, r5, r6, lr}
	ldr r6, _0807E438
	ldrh r0, [r6]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _0807E43C
	adds r0, r0, r4
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _0807E440
	ldrh r0, [r6]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0807E442
	.align 2, 0
_0807E438: .4byte 0x02037282
_0807E43C: .4byte 0x02024190
_0807E440:
	movs r0, #0
_0807E442:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetTradeSpecies

	thumb_func_start CreateInGameTradePokemon
CreateInGameTradePokemon: @ 0x0807E448
	push {lr}
	ldr r0, _0807E45C
	ldrb r0, [r0]
	ldr r1, _0807E460
	ldrb r1, [r1]
	bl _CreateInGameTradePokemon
	pop {r0}
	bx r0
	.align 2, 0
_0807E45C: .4byte 0x02037282
_0807E460: .4byte 0x02037280
	thumb_func_end CreateInGameTradePokemon

	thumb_func_start sub_0807E464
sub_0807E464: @ 0x0807E464
	push {r4, r5, r6, lr}
	bl sub_0807B600
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bne _0807E4CE
	ldr r5, _0807E4F0
	ldr r0, [r5]
	adds r0, #0x8e
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0807E4F4
	adds r0, r0, r4
	bl DestroySprite
	ldr r0, [r5]
	adds r0, #0x8f
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, _0807E4F8
	ldrb r4, [r0]
	ldrb r0, [r0, #1]
	movs r1, #6
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_0807AF08
	bl sub_08076C68
	cmp r0, #0
	bne _0807E4C8
	ldr r0, [r5]
	adds r2, r0, #0
	adds r2, #0x74
	ldr r1, _0807E4FC
	strh r1, [r2]
	adds r0, #0x93
	strb r6, [r0]
_0807E4C8:
	ldr r0, _0807E500
	bl SetMainCallback2
_0807E4CE:
	bl sub_0807AFF0
	bl sub_0807DF14
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E4F0: .4byte 0x02031F40
_0807E4F4: .4byte 0x020205AC
_0807E4F8: .4byte 0x02031F38
_0807E4FC: .4byte 0x0000ABCD
_0807E500: .4byte 0x0807E505
	thumb_func_end sub_0807E464

	thumb_func_start sub_0807E504
sub_0807E504: @ 0x0807E504
	push {r4, lr}
	bl sub_0807A738
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_08076C68
	cmp r0, #0
	beq _0807E524
	ldr r0, _0807E520
	bl SetMainCallback2
	b _0807E564
	.align 2, 0
_0807E520: .4byte 0x0807DE4D
_0807E524:
	bl sub_0807DF14
	cmp r4, #0
	bne _0807E564
	ldr r4, _0807E57C
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x72
	ldrh r1, [r0]
	ldr r0, _0807E580
	cmp r1, r0
	bne _0807E564
	adds r1, r2, #0
	adds r1, #0x74
	ldr r0, _0807E584
	strh r0, [r1]
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	adds r1, #0x74
	movs r2, #0x14
	bl SendBlock
	ldr r0, [r4]
	adds r0, #0x72
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x73
	strb r1, [r0]
_0807E564:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E57C: .4byte 0x02031F40
_0807E580: .4byte 0x00000101
_0807E584: .4byte 0x0000DCBA
	thumb_func_end sub_0807E504

	thumb_func_start sub_0807E588
sub_0807E588: @ 0x0807E588
	push {r4, lr}
	sub sp, #4
	ldr r1, _0807E5A8
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x65
	bls _0807E59E
	b _0807EA72
_0807E59E:
	lsls r0, r0, #2
	ldr r1, _0807E5AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E5A8: .4byte 0x03002360
_0807E5AC: .4byte 0x0807E5B0
_0807E5B0: @ jump table
	.4byte _0807E748 @ case 0
	.4byte _0807E764 @ case 1
	.4byte _0807E7D0 @ case 2
	.4byte _0807EA72 @ case 3
	.4byte _0807E8B0 @ case 4
	.4byte _0807E974 @ case 5
	.4byte _0807E99C @ case 6
	.4byte _0807E9B6 @ case 7
	.4byte _0807E9DC @ case 8
	.4byte _0807EA28 @ case 9
	.4byte _0807EA72 @ case 10
	.4byte _0807EA72 @ case 11
	.4byte _0807EA72 @ case 12
	.4byte _0807EA72 @ case 13
	.4byte _0807EA72 @ case 14
	.4byte _0807EA72 @ case 15
	.4byte _0807EA72 @ case 16
	.4byte _0807EA72 @ case 17
	.4byte _0807EA72 @ case 18
	.4byte _0807EA72 @ case 19
	.4byte _0807EA72 @ case 20
	.4byte _0807EA72 @ case 21
	.4byte _0807EA72 @ case 22
	.4byte _0807EA72 @ case 23
	.4byte _0807EA72 @ case 24
	.4byte _0807EA72 @ case 25
	.4byte _0807EA72 @ case 26
	.4byte _0807EA72 @ case 27
	.4byte _0807EA72 @ case 28
	.4byte _0807EA72 @ case 29
	.4byte _0807EA72 @ case 30
	.4byte _0807EA72 @ case 31
	.4byte _0807EA72 @ case 32
	.4byte _0807EA72 @ case 33
	.4byte _0807EA72 @ case 34
	.4byte _0807EA72 @ case 35
	.4byte _0807EA72 @ case 36
	.4byte _0807EA72 @ case 37
	.4byte _0807EA72 @ case 38
	.4byte _0807EA72 @ case 39
	.4byte _0807E8D4 @ case 40
	.4byte _0807E924 @ case 41
	.4byte _0807E952 @ case 42
	.4byte _0807EA72 @ case 43
	.4byte _0807EA72 @ case 44
	.4byte _0807EA72 @ case 45
	.4byte _0807EA72 @ case 46
	.4byte _0807EA72 @ case 47
	.4byte _0807EA72 @ case 48
	.4byte _0807EA72 @ case 49
	.4byte _0807E7F8 @ case 50
	.4byte _0807E854 @ case 51
	.4byte _0807E870 @ case 52
	.4byte _0807EA72 @ case 53
	.4byte _0807EA72 @ case 54
	.4byte _0807EA72 @ case 55
	.4byte _0807EA72 @ case 56
	.4byte _0807EA72 @ case 57
	.4byte _0807EA72 @ case 58
	.4byte _0807EA72 @ case 59
	.4byte _0807EA72 @ case 60
	.4byte _0807EA72 @ case 61
	.4byte _0807EA72 @ case 62
	.4byte _0807EA72 @ case 63
	.4byte _0807EA72 @ case 64
	.4byte _0807EA72 @ case 65
	.4byte _0807EA72 @ case 66
	.4byte _0807EA72 @ case 67
	.4byte _0807EA72 @ case 68
	.4byte _0807EA72 @ case 69
	.4byte _0807EA72 @ case 70
	.4byte _0807EA72 @ case 71
	.4byte _0807EA72 @ case 72
	.4byte _0807EA72 @ case 73
	.4byte _0807EA72 @ case 74
	.4byte _0807EA72 @ case 75
	.4byte _0807EA72 @ case 76
	.4byte _0807EA72 @ case 77
	.4byte _0807EA72 @ case 78
	.4byte _0807EA72 @ case 79
	.4byte _0807EA72 @ case 80
	.4byte _0807EA72 @ case 81
	.4byte _0807EA72 @ case 82
	.4byte _0807EA72 @ case 83
	.4byte _0807EA72 @ case 84
	.4byte _0807EA72 @ case 85
	.4byte _0807EA72 @ case 86
	.4byte _0807EA72 @ case 87
	.4byte _0807EA72 @ case 88
	.4byte _0807EA72 @ case 89
	.4byte _0807EA72 @ case 90
	.4byte _0807EA72 @ case 91
	.4byte _0807EA72 @ case 92
	.4byte _0807EA72 @ case 93
	.4byte _0807EA72 @ case 94
	.4byte _0807EA72 @ case 95
	.4byte _0807EA72 @ case 96
	.4byte _0807EA72 @ case 97
	.4byte _0807EA72 @ case 98
	.4byte _0807EA72 @ case 99
	.4byte _0807E77C @ case 100
	.4byte _0807E7B4 @ case 101
_0807E748:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r4, _0807E75C
	ldr r1, _0807E760
	b _0807E7DE
	.align 2, 0
_0807E75C: .4byte 0x02021C7C
_0807E760: .4byte 0x08595430
_0807E764:
	movs r0, #0
	bl sub_08076C90
	ldr r0, _0807E778
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0x64
	b _0807E8C0
	.align 2, 0
_0807E778: .4byte 0x03002360
_0807E77C:
	ldr r0, _0807E7AC
	ldr r3, [r0]
	ldr r0, [r3, #0x64]
	adds r0, #1
	str r0, [r3, #0x64]
	cmp r0, #0xb4
	bls _0807E798
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r2, #0
	movs r1, #0x65
	strb r1, [r0]
	str r2, [r3, #0x64]
_0807E798:
	bl _IsLinkTaskFinished
	cmp r0, #0
	bne _0807E7A2
	b _0807EA72
_0807E7A2:
	ldr r0, _0807E7B0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	b _0807E7C6
	.align 2, 0
_0807E7AC: .4byte 0x02031F40
_0807E7B0: .4byte 0x03002360
_0807E7B4:
	bl _IsLinkTaskFinished
	cmp r0, #0
	bne _0807E7BE
	b _0807EA72
_0807E7BE:
	ldr r0, _0807E7CC
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
_0807E7C6:
	movs r1, #2
	strb r1, [r0]
	b _0807EA72
	.align 2, 0
_0807E7CC: .4byte 0x03002360
_0807E7D0:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	movs r0, #0x32
	strb r0, [r1]
	ldr r4, _0807E7F0
	ldr r1, _0807E7F4
_0807E7DE:
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	b _0807EA72
	.align 2, 0
_0807E7F0: .4byte 0x02021C7C
_0807E7F4: .4byte 0x08277071
_0807E7F8:
	bl InUnionRoom
	cmp r0, #0
	bne _0807E806
	movs r0, #0x15
	bl IncrementGameStat
_0807E806:
	ldr r0, _0807E848
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807E82E
	ldr r4, _0807E84C
	bl GetMultiplayerId
	movs r1, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r4, #4
	adds r1, r1, r4
	ldr r1, [r1]
	movs r0, #2
	bl sub_0801B4A8
_0807E82E:
	bl SetContinueGameWarpStatusToDynamicWarp
	bl sub_081532BC
	ldr r1, _0807E850
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	b _0807E8C2
	.align 2, 0
_0807E848: .4byte 0x0300319C
_0807E84C: .4byte 0x020226A0
_0807E850: .4byte 0x03002360
_0807E854:
	ldr r0, _0807E86C
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #5
	beq _0807E864
	b _0807EA72
_0807E864:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	b _0807EA1C
	.align 2, 0
_0807E86C: .4byte 0x02031F40
_0807E870:
	bl sub_081532E8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0807E894
	bl ClearContinueGameWarpStatus
	ldr r0, _0807E890
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #4
	strb r1, [r0]
	b _0807EA72
	.align 2, 0
_0807E890: .4byte 0x03002360
_0807E894:
	ldr r0, _0807E8A8
	ldr r0, [r0]
	str r1, [r0, #0x64]
	ldr r0, _0807E8AC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #0x33
	strb r1, [r0]
	b _0807EA72
	.align 2, 0
_0807E8A8: .4byte 0x02031F40
_0807E8AC: .4byte 0x03002360
_0807E8B0:
	bl sub_0815331C
	ldr r0, _0807E8CC
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0x28
_0807E8C0:
	strb r1, [r0]
_0807E8C2:
	ldr r0, _0807E8D0
	ldr r0, [r0]
	str r2, [r0, #0x64]
	b _0807EA72
	.align 2, 0
_0807E8CC: .4byte 0x03002360
_0807E8D0: .4byte 0x02031F40
_0807E8D4:
	ldr r4, _0807E908
	ldr r1, [r4]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x32
	bhi _0807E8E4
	b _0807EA72
_0807E8E4:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807E90C
	bl Random
	ldr r4, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1e
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0x64]
	b _0807E912
	.align 2, 0
_0807E908: .4byte 0x02031F40
_0807E90C:
	ldr r1, [r4]
	movs r0, #0
	str r0, [r1, #0x64]
_0807E912:
	ldr r0, _0807E920
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #0x29
	strb r1, [r0]
	b _0807EA72
	.align 2, 0
_0807E920: .4byte 0x03002360
_0807E924:
	ldr r0, _0807E944
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	cmp r0, #0
	bne _0807E94C
	movs r0, #1
	bl sub_08076C90
	ldr r0, _0807E948
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0x2a
	strb r1, [r0]
	b _0807EA72
	.align 2, 0
_0807E944: .4byte 0x02031F40
_0807E948: .4byte 0x03002360
_0807E94C:
	subs r0, #1
	str r0, [r1, #0x64]
	b _0807EA72
_0807E952:
	bl _IsLinkTaskFinished
	cmp r0, #0
	bne _0807E95C
	b _0807EA72
_0807E95C:
	bl sub_08153344
	ldr r0, _0807E970
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #5
	strb r1, [r0]
	b _0807EA72
	.align 2, 0
_0807E970: .4byte 0x03002360
_0807E974:
	ldr r0, _0807E998
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x3c
	bls _0807EA72
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #2
	bl sub_08076C90
	b _0807EA72
	.align 2, 0
_0807E998: .4byte 0x02031F40
_0807E99C:
	bl _IsLinkTaskFinished
	cmp r0, #0
	beq _0807EA72
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _0807EA14
_0807E9B6:
	ldr r0, _0807E9D4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807EA72
	movs r0, #3
	bl FadeOutBGMTemporarily
	ldr r1, _0807E9D8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0807EA1C
	.align 2, 0
_0807E9D4: .4byte 0x02037C74
_0807E9D8: .4byte 0x03002360
_0807E9DC:
	bl IsBGMStopped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0807EA72
	ldr r0, _0807EA04
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807EA10
	ldr r0, _0807EA08
	ldr r1, [r0, #8]
	ldr r0, _0807EA0C
	cmp r1, r0
	bne _0807EA10
	movs r0, #3
	bl sub_08076C90
	b _0807EA14
	.align 2, 0
_0807EA04: .4byte 0x0300319C
_0807EA08: .4byte 0x03002360
_0807EA0C: .4byte 0x08076DB5
_0807EA10:
	bl sub_0800A7F8
_0807EA14:
	ldr r1, _0807EA24
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_0807EA1C:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807EA72
	.align 2, 0
_0807EA24: .4byte 0x03002360
_0807EA28:
	ldr r0, _0807EA50
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807EA60
	ldr r1, [r2, #8]
	ldr r0, _0807EA54
	cmp r1, r0
	bne _0807EA60
	bl _IsLinkTaskFinished
	cmp r0, #0
	beq _0807EA72
	ldr r0, _0807EA58
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807EA5C
	bl SetMainCallback2
	b _0807EA72
	.align 2, 0
_0807EA50: .4byte 0x0300319C
_0807EA54: .4byte 0x08076DB5
_0807EA58: .4byte 0x030027A0
_0807EA5C: .4byte 0x0807EAA1
_0807EA60:
	ldr r0, _0807EA94
	ldrb r1, [r0]
	cmp r1, #0
	bne _0807EA72
	ldr r0, _0807EA98
	strb r1, [r0]
	ldr r0, _0807EA9C
	bl SetMainCallback2
_0807EA72:
	bl HasLinkErrorOccurred
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807EA80
	bl RunTasks
_0807EA80:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA94: .4byte 0x030031C4
_0807EA98: .4byte 0x030027A0
_0807EA9C: .4byte 0x0807EAA1
	thumb_func_end sub_0807E588

	thumb_func_start c2_080543C4
c2_080543C4: @ 0x0807EAA0
	push {r4, r5, lr}
	ldr r0, _0807EB0C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0807EAF6
	bl FreeAllWindowBuffers
	movs r0, #3
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #1
	bl GetBgTilemapBuffer
	bl Free
	movs r0, #0
	bl GetBgTilemapBuffer
	bl Free
	bl FreeMonSpritesGfx
	ldr r4, _0807EB10
	ldr r0, [r4]
	bl Free
	str r5, [r4]
	ldr r0, _0807EB14
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807EAEE
	bl DestroyWirelessStatusIndicatorSprite
_0807EAEE:
	ldr r0, _0807EB18
	ldr r0, [r0, #8]
	bl SetMainCallback2
_0807EAF6:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EB0C: .4byte 0x02037C74
_0807EB10: .4byte 0x02031F40
_0807EB14: .4byte 0x0300319C
_0807EB18: .4byte 0x03002360
	thumb_func_end c2_080543C4

	thumb_func_start DoInGameTradeScene
DoInGameTradeScene: @ 0x0807EB1C
	push {lr}
	sub sp, #4
	bl ScriptContext2_Enable
	ldr r0, _0807EB44
	movs r1, #0xa
	bl CreateTask
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807EB44: .4byte 0x0807EB49
	thumb_func_end DoInGameTradeScene

	thumb_func_start sub_0807EB48
sub_0807EB48: @ 0x0807EB48
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0807EB74
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807EB6C
	ldr r0, _0807EB78
	bl SetMainCallback2
	ldr r1, _0807EB7C
	ldr r0, _0807EB80
	str r0, [r1]
	adds r0, r4, #0
	bl DestroyTask
_0807EB6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EB74: .4byte 0x02037C74
_0807EB78: .4byte 0x0807ACC9
_0807EB7C: .4byte 0x03005B0C
_0807EB80: .4byte 0x080AEA65
	thumb_func_end sub_0807EB48

	thumb_func_start sub_0807EB84
sub_0807EB84: @ 0x0807EB84
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_0807EB8A:
	ldr r0, _0807EBC8
	ldrb r0, [r0, #1]
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0807EBCC
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x43
	bl GetMonData
	adds r0, r5, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	bls _0807EB8A
	cmp r5, #0
	beq _0807EBC2
	ldr r0, _0807EBD0
	bl FlagSet
_0807EBC2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EBC8: .4byte 0x02031F38
_0807EBCC: .4byte 0x020243E8
_0807EBD0: .4byte 0x0000089B
	thumb_func_end sub_0807EB84

	thumb_func_start sub_0807EBD4
sub_0807EBD4: @ 0x0807EBD4
	push {lr}
	bl sub_0807ABCC
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807EBD4

	thumb_func_start sub_0807EBE0
sub_0807EBE0: @ 0x0807EBE0
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0xff
	bl FillWindowPixelBuffer
	ldr r2, _0807EC44
	ldr r0, [r2]
	adds r0, #0xf6
	movs r3, #0
	movs r1, #0xf
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xf7
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xf8
	movs r1, #6
	strb r1, [r0]
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [r2]
	adds r0, #0xf6
	str r0, [sp, #8]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r6, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized4
	adds r0, r5, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC44: .4byte 0x02031F40
	thumb_func_end sub_0807EBE0

	thumb_func_start c3_08054588
c3_08054588: @ 0x0807EC48
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0807EC80
	adds r4, r0, r1
	ldr r1, _0807EC84
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r2, r1, #0
	movs r3, #4
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0807EC8C
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _0807EC94
	lsls r0, r1, #1
	ldr r1, _0807EC88
	adds r0, r0, r1
	b _0807EC96
	.align 2, 0
_0807EC80: .4byte 0x03005B68
_0807EC84: .4byte 0x0830D310
_0807EC88: .4byte 0x0830BCE4
_0807EC8C:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _0807ECA4
_0807EC94:
	ldr r0, _0807ECA0
_0807EC96:
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
	b _0807ECB2
	.align 2, 0
_0807ECA0: .4byte 0x0830C0E4
_0807ECA4:
	lsls r0, r2, #1
	ldr r1, _0807ED08
	adds r0, r0, r1
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
_0807ECB2:
	ldr r0, _0807ED0C
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807ECD0
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0807ECD0
	movs r0, #0xc3
	bl PlaySE
_0807ECD0:
	movs r0, #2
	ldrsh r2, [r4, r0]
	ldr r1, _0807ED0C
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	bne _0807ED10
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	strh r0, [r4, #2]
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807ED16
	adds r0, r5, #0
	bl DestroyTask
	b _0807ED16
	.align 2, 0
_0807ED08: .4byte 0x0830BEE4
_0807ED0C: .4byte 0x0830D310
_0807ED10:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
_0807ED16:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end c3_08054588

	thumb_func_start c3_0805465C
c3_0805465C: @ 0x0807ED1C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0807EDCC
	adds r5, r0, r1
	movs r0, #0
	ldrsh r4, [r5, r0]
	cmp r4, #0
	bne _0807ED6E
	ldr r2, _0807EDD0
	ldr r0, [r2]
	adds r3, r0, #0
	adds r3, #0xfd
	movs r1, #0x78
	strb r1, [r3]
	adds r0, #0xfb
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xfc
	strb r4, [r0]
	ldr r0, [r2]
	adds r0, #0xfe
	movs r1, #0xa0
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuRegBits
	movs r0, #0x4a
	movs r1, #0x10
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x13
	bl SetGpuReg
_0807ED6E:
	ldr r4, _0807EDD0
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xfd
	ldrb r1, [r1]
	adds r0, #0xfb
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	movs r0, #0x40
	bl SetGpuReg
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xfe
	ldrb r1, [r1]
	adds r0, #0xfc
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	movs r0, #0x44
	bl SetGpuReg
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r1, [r4]
	adds r1, #0xfb
	ldrb r0, [r1]
	subs r0, #5
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, #0xfd
	ldrb r0, [r1]
	adds r0, #5
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0xfb
	ldrb r0, [r0]
	cmp r0, #0x4f
	bhi _0807EDC6
	adds r0, r6, #0
	bl DestroyTask
_0807EDC6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807EDCC: .4byte 0x03005B68
_0807EDD0: .4byte 0x02031F40
	thumb_func_end c3_0805465C

	thumb_func_start sub_0807EDD4
sub_0807EDD4: @ 0x0807EDD4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0807EE78
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0807EE10
	ldr r2, _0807EE7C
	ldr r0, [r2]
	adds r0, #0xfb
	movs r1, #0x50
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xfd
	movs r1, #0xa0
	strb r1, [r0]
	movs r0, #0x4a
	movs r1, #0x10
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x13
	bl SetGpuReg
_0807EE10:
	ldr r4, _0807EE7C
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xfd
	ldrb r1, [r1]
	adds r0, #0xfb
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	movs r0, #0x40
	bl SetGpuReg
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0xfe
	ldrb r1, [r1]
	adds r0, #0xfc
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	movs r0, #0x44
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, #0xfb
	ldrb r0, [r0]
	cmp r0, #0x78
	beq _0807EE84
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r1, [r4]
	adds r1, #0xfb
	ldrb r0, [r1]
	adds r0, #5
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, #0xfd
	ldrb r0, [r1]
	subs r0, #5
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0xfb
	ldrb r0, [r0]
	cmp r0, #0x73
	bls _0807EE94
	ldr r2, _0807EE80
	movs r0, #8
	movs r1, #0
	bl BlendPalettes
	b _0807EE94
	.align 2, 0
_0807EE78: .4byte 0x03005B68
_0807EE7C: .4byte 0x02031F40
_0807EE80: .4byte 0x0000FFFF
_0807EE84:
	movs r1, #0x80
	lsls r1, r1, #6
	movs r0, #0
	bl ClearGpuRegBits
	adds r0, r6, #0
	bl DestroyTask
_0807EE94:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0807EDD4

	thumb_func_start sub_0807EE9C
sub_0807EE9C: @ 0x0807EE9C
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _0807EEBC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0xc
	bls _0807EEB2
	b _0807F144
_0807EEB2:
	lsls r0, r0, #2
	ldr r1, _0807EEC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807EEBC: .4byte 0x03002360
_0807EEC0: .4byte 0x0807EEC4
_0807EEC4: @ jump table
	.4byte _0807EEF8 @ case 0
	.4byte _0807EF20 @ case 1
	.4byte _0807EF38 @ case 2
	.4byte _0807EF88 @ case 3
	.4byte _0807EFA8 @ case 4
	.4byte _0807EFE4 @ case 5
	.4byte _0807F008 @ case 6
	.4byte _0807F058 @ case 7
	.4byte _0807F086 @ case 8
	.4byte _0807F0A4 @ case 9
	.4byte _0807F0CC @ case 10
	.4byte _0807F0FC @ case 11
	.4byte _0807F130 @ case 12
_0807EEF8:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0807EF18
	ldr r1, _0807EF1C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	b _0807F144
	.align 2, 0
_0807EF18: .4byte 0x02021C7C
_0807EF1C: .4byte 0x08595430
_0807EF20:
	movs r0, #0
	bl sub_08076C90
	ldr r0, _0807EF34
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #2
	b _0807EFF4
	.align 2, 0
_0807EF34: .4byte 0x03002360
_0807EF38:
	bl _IsLinkTaskFinished
	cmp r0, #0
	bne _0807EF42
	b _0807F144
_0807EF42:
	ldr r0, _0807EF78
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r5, #0
	movs r1, #3
	strb r1, [r0]
	ldr r4, _0807EF7C
	ldr r1, _0807EF80
	adds r0, r4, #0
	bl StringExpandPlaceholders
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_0807EBE0
	movs r0, #0x15
	bl IncrementGameStat
	bl sub_081532BC
	ldr r0, _0807EF84
	ldr r0, [r0]
	str r5, [r0, #0x64]
	b _0807F144
	.align 2, 0
_0807EF78: .4byte 0x03002360
_0807EF7C: .4byte 0x02021C7C
_0807EF80: .4byte 0x08277071
_0807EF84: .4byte 0x02031F40
_0807EF88:
	ldr r0, _0807EFA4
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #5
	beq _0807EF98
	b _0807F144
_0807EF98:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	movs r0, #4
	strb r0, [r1]
	b _0807F144
	.align 2, 0
_0807EFA4: .4byte 0x02031F40
_0807EFA8:
	bl sub_081532E8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0807EFC8
	ldr r0, _0807EFC4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	b _0807F144
	.align 2, 0
_0807EFC4: .4byte 0x03002360
_0807EFC8:
	ldr r0, _0807EFDC
	ldr r0, [r0]
	str r1, [r0, #0x64]
	ldr r0, _0807EFE0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0]
	b _0807F144
	.align 2, 0
_0807EFDC: .4byte 0x02031F40
_0807EFE0: .4byte 0x03002360
_0807EFE4:
	bl sub_0815331C
	ldr r0, _0807F000
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #6
_0807EFF4:
	strb r1, [r0]
	ldr r0, _0807F004
	ldr r0, [r0]
	str r2, [r0, #0x64]
	b _0807F144
	.align 2, 0
_0807F000: .4byte 0x03002360
_0807F004: .4byte 0x02031F40
_0807F008:
	ldr r4, _0807F03C
	ldr r1, [r4]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0xa
	bhi _0807F018
	b _0807F144
_0807F018:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807F040
	bl Random
	ldr r4, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x1e
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0x64]
	b _0807F046
	.align 2, 0
_0807F03C: .4byte 0x02031F40
_0807F040:
	ldr r1, [r4]
	movs r0, #0
	str r0, [r1, #0x64]
_0807F046:
	ldr r0, _0807F054
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #7
	strb r1, [r0]
	b _0807F144
	.align 2, 0
_0807F054: .4byte 0x03002360
_0807F058:
	ldr r0, _0807F078
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	cmp r0, #0
	bne _0807F080
	movs r0, #1
	bl sub_08076C90
	ldr r0, _0807F07C
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #8
	strb r1, [r0]
	b _0807F144
	.align 2, 0
_0807F078: .4byte 0x02031F40
_0807F07C: .4byte 0x03002360
_0807F080:
	subs r0, #1
	str r0, [r1, #0x64]
	b _0807F144
_0807F086:
	bl _IsLinkTaskFinished
	cmp r0, #0
	beq _0807F144
	bl sub_08153344
	ldr r0, _0807F0A0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #9
	strb r1, [r0]
	b _0807F144
	.align 2, 0
_0807F0A0: .4byte 0x03002360
_0807F0A4:
	ldr r0, _0807F0C8
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	adds r0, #1
	str r0, [r1, #0x64]
	cmp r0, #0x3c
	bls _0807F144
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #2
	bl sub_08076C90
	b _0807F144
	.align 2, 0
_0807F0C8: .4byte 0x02031F40
_0807F0CC:
	bl _IsLinkTaskFinished
	cmp r0, #0
	beq _0807F144
	movs r0, #3
	bl FadeOutBGMTemporarily
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807F0F8
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xb
	strb r1, [r0]
	b _0807F144
	.align 2, 0
_0807F0F8: .4byte 0x03002360
_0807F0FC:
	ldr r0, _0807F128
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F144
	bl IsBGMStopped
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0807F144
	movs r0, #3
	bl sub_08076C90
	ldr r0, _0807F12C
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #0xc
	strb r1, [r0]
	b _0807F144
	.align 2, 0
_0807F128: .4byte 0x02037C74
_0807F12C: .4byte 0x03002360
_0807F130:
	bl _IsLinkTaskFinished
	cmp r0, #0
	beq _0807F144
	ldr r0, _0807F168
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807F16C
	bl SetMainCallback2
_0807F144:
	bl HasLinkErrorOccurred
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807F152
	bl RunTasks
_0807F152:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F168: .4byte 0x030027A0
_0807F16C: .4byte 0x0807EAA1
	thumb_func_end sub_0807EE9C

