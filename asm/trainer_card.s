.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start VblankCb_TrainerCard
VblankCb_TrainerCard: @ 0x080C1CBC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_080C41FC
	ldr r0, _080C1CF0
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080C1CEC
	ldr r1, _080C1CF4
	ldr r0, _080C1CF8
	str r0, [r1]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _080C1CFC
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080C1CEC:
	pop {r0}
	bx r0
	.align 2, 0
_080C1CF0: .4byte 0x02039988
_080C1CF4: .4byte 0x040000D4
_080C1CF8: .4byte 0x020388C8
_080C1CFC: .4byte 0x800000A0
	thumb_func_end VblankCb_TrainerCard

	thumb_func_start HblankCb_TrainerCard
HblankCb_TrainerCard: @ 0x080C1D00
	push {r4, lr}
	ldr r4, _080C1D2C
	ldrh r3, [r4]
	movs r0, #0
	strh r0, [r4]
	ldr r1, _080C1D30
	ldr r0, _080C1D34
	ldrh r2, [r0]
	movs r0, #0xff
	ands r0, r2
	lsls r0, r0, #1
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _080C1D38
	strh r1, [r0]
	strh r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C1D2C: .4byte 0x04000208
_080C1D30: .4byte 0x020388C8
_080C1D34: .4byte 0x04000006
_080C1D38: .4byte 0x04000012
	thumb_func_end HblankCb_TrainerCard

	thumb_func_start CB2_TrainerCard
CB2_TrainerCard: @ 0x080C1D3C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_TrainerCard

	thumb_func_start CloseTrainerCard
CloseTrainerCard: @ 0x080C1D54
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080C1D84
	ldr r0, [r5]
	ldr r1, _080C1D88
	adds r0, r0, r1
	ldr r0, [r0]
	bl SetMainCallback2
	bl FreeAllWindowBuffers
	ldr r0, [r5]
	bl Free
	movs r0, #0
	str r0, [r5]
	adds r0, r4, #0
	bl DestroyTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C1D84: .4byte 0x02039988
_080C1D88: .4byte 0x0000051C
	thumb_func_end CloseTrainerCard

	thumb_func_start sub_080C1D8C
sub_080C1D8C: @ 0x080C1D8C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080C1DAC
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0x10
	bls _080C1DA2
	b _080C20F6
_080C1DA2:
	lsls r0, r0, #2
	ldr r1, _080C1DB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1DAC: .4byte 0x02039988
_080C1DB0: .4byte 0x080C1DB4
_080C1DB4: @ jump table
	.4byte _080C1DF8 @ case 0
	.4byte _080C1E0E @ case 1
	.4byte _080C1E1C @ case 2
	.4byte _080C1E24 @ case 3
	.4byte _080C1E38 @ case 4
	.4byte _080C1E4C @ case 5
	.4byte _080C1E60 @ case 6
	.4byte _080C1E66 @ case 7
	.4byte _080C1EC8 @ case 8
	.4byte _080C1EF4 @ case 9
	.4byte _080C1F10 @ case 10
	.4byte _080C1FC8 @ case 11
	.4byte _080C1F9C @ case 12
	.4byte _080C20D6 @ case 13
	.4byte _080C20C4 @ case 14
	.4byte _080C2058 @ case 15
	.4byte _080C2094 @ case 16
_080C1DF8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1E04
	b _080C20F6
_080C1E04:
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	b _080C1F00
_080C1E0E:
	bl PrintAllOnCardPage1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C1E1A
	b _080C20F6
_080C1E1A:
	b _080C1F00
_080C1E1C:
	movs r0, #1
	bl PrintHofDebutStringOnCard
	b _080C1F00
_080C1E24:
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	bl sub_080C48F4
	movs r0, #2
	bl PrintHofDebutStringOnCard
	b _080C1F00
_080C1E38:
	ldr r0, [r4]
	ldr r1, _080C1E48
	adds r0, r0, r1
	bl sub_080C3E84
	ldr r1, [r4]
	b _080C1F04
	.align 2, 0
_080C1E48: .4byte 0x00000EE4
_080C1E4C:
	ldr r0, [r4]
	ldr r2, _080C1E5C
	adds r0, r0, r2
	bl sub_080C3EF4
	ldr r1, [r4]
	b _080C1F04
	.align 2, 0
_080C1E5C: .4byte 0x00000584
_080C1E60:
	bl TrainerCard_PrintStarsAndBadgesOnCard
	b _080C1F00
_080C1E66:
	ldr r0, _080C1EB8
	ldrb r0, [r0]
	cmp r0, #1
	bne _080C1E82
	ldr r0, _080C1EBC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080C1E82
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0xe6
	movs r1, #0x96
	bl CreateWirelessStatusIndicatorSprite
_080C1E82:
	movs r6, #1
	rsbs r6, r6, #0
	ldr r4, _080C1EC0
	ldr r0, [r4]
	movs r5, #0xa3
	lsls r5, r5, #3
	adds r0, r0, r5
	ldrh r2, [r0]
	adds r0, r6, #0
	movs r1, #0x10
	bl BlendPalettes
	ldr r0, [r4]
	adds r0, r0, r5
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080C1EC4
	bl SetVBlankCallback
	ldr r1, [r4]
	b _080C1F04
	.align 2, 0
_080C1EB8: .4byte 0x0300319C
_080C1EBC: .4byte 0x030031C4
_080C1EC0: .4byte 0x02039988
_080C1EC4: .4byte 0x080C1CBD
_080C1EC8:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1ED4
	b _080C20F6
_080C1ED4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1EE0
	b _080C20F6
_080C1EE0:
	movs r0, #0xfb
	bl PlaySE
	ldr r0, _080C1EF0
	ldr r1, [r0]
	movs r0, #0xa
	strb r0, [r1]
	b _080C20F6
	.align 2, 0
_080C1EF0: .4byte 0x02039988
_080C1EF4:
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1F00
	b _080C20F6
_080C1F00:
	ldr r0, _080C1F0C
	ldr r1, [r0]
_080C1F04:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C20F6
	.align 2, 0
_080C1F0C: .4byte 0x02039988
_080C1F10:
	ldr r0, _080C1F58
	ldrb r5, [r0]
	cmp r5, #0
	bne _080C1F36
	ldr r0, [r4]
	ldr r1, _080C1F5C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C1F36
	bl PrintMoneyOnCard
	movs r0, #1
	bl PrintHofDebutStringOnCard
	ldr r0, [r4]
	ldr r2, _080C1F5C
	adds r0, r0, r2
	strb r5, [r0]
_080C1F36:
	ldr r0, _080C1F60
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C1F68
	bl sub_080C424C
	movs r0, #0xf9
	bl PlaySE
	ldr r0, _080C1F64
	ldr r1, [r0]
	movs r0, #0xc
	strb r0, [r1]
	b _080C20F6
	.align 2, 0
_080C1F58: .4byte 0x030031C4
_080C1F5C: .4byte 0x00000515
_080C1F60: .4byte 0x03002360
_080C1F64: .4byte 0x02039988
_080C1F68:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080C1F72
	b _080C20F6
_080C1F72:
	ldr r0, _080C1F94
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C1F8C
	ldr r4, _080C1F98
	ldr r0, [r4]
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _080C1F8C
	bl InUnionRoom
	cmp r0, #1
	beq _080C2040
_080C1F8C:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r4, _080C1F98
	b _080C20A0
	.align 2, 0
_080C1F94: .4byte 0x030031C4
_080C1F98: .4byte 0x02039988
_080C1F9C:
	bl sub_080C4274
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C1FA8
	b _080C20F6
_080C1FA8:
	bl sub_08086EFC
	cmp r0, #1
	bne _080C1FB2
	b _080C20F6
_080C1FB2:
	movs r0, #0xfb
	bl PlaySE
	ldr r0, _080C1FC4
	ldr r1, [r0]
	movs r0, #0xb
	strb r0, [r1]
	b _080C20F6
	.align 2, 0
_080C1FC4: .4byte 0x02039988
_080C1FC8:
	ldr r0, _080C1FFC
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C2020
	ldr r0, _080C2000
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C2008
	ldr r0, [r4]
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _080C1FEC
	bl InUnionRoom
	cmp r0, #1
	beq _080C2040
_080C1FEC:
	ldr r0, _080C2000
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C2008
	movs r0, #1
	rsbs r0, r0, #0
	ldr r4, _080C2004
	b _080C20A0
	.align 2, 0
_080C1FFC: .4byte 0x03002360
_080C2000: .4byte 0x030031C4
_080C2004: .4byte 0x02039988
_080C2008:
	bl sub_080C424C
	ldr r0, _080C201C
	ldr r1, [r0]
	movs r0, #0xd
	strb r0, [r1]
	movs r0, #0xf9
	bl PlaySE
	b _080C20F6
	.align 2, 0
_080C201C: .4byte 0x02039988
_080C2020:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C20F6
	ldr r0, _080C2048
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C204C
	ldr r0, [r4]
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _080C204C
	bl InUnionRoom
	cmp r0, #1
	bne _080C204C
_080C2040:
	ldr r1, [r4]
	movs r0, #0xf
	strb r0, [r1]
	b _080C20F6
	.align 2, 0
_080C2048: .4byte 0x030031C4
_080C204C:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r4, _080C2054
	b _080C20A0
	.align 2, 0
_080C2054: .4byte 0x02039988
_080C2058:
	bl sub_0800A7F8
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrame
	ldr r2, _080C208C
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _080C2090
	ldr r1, [r0]
	movs r0, #0x10
	strb r0, [r1]
	b _080C20F6
	.align 2, 0
_080C208C: .4byte 0x085CC3A7
_080C2090: .4byte 0x02039988
_080C2094:
	ldr r0, _080C20C0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C20F6
	movs r0, #1
	rsbs r0, r0, #0
_080C20A0:
	ldr r1, [r4]
	movs r2, #0xa3
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrh r1, [r1]
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	movs r0, #0xe
	strb r0, [r1]
	b _080C20F6
	.align 2, 0
_080C20C0: .4byte 0x030031C4
_080C20C4:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C20F6
	adds r0, r5, #0
	bl CloseTrainerCard
	b _080C20F6
_080C20D6:
	bl sub_080C4274
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C20F6
	bl sub_08086EFC
	cmp r0, #1
	beq _080C20F6
	ldr r0, _080C2100
	ldr r1, [r0]
	movs r0, #0xa
	strb r0, [r1]
	movs r0, #0xfb
	bl PlaySE
_080C20F6:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C2100: .4byte 0x02039988
	thumb_func_end sub_080C1D8C

	thumb_func_start LoadCardGfx
LoadCardGfx: @ 0x080C2104
	push {lr}
	ldr r0, _080C211C
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	cmp r0, #5
	bls _080C2112
	b _080C2298
_080C2112:
	lsls r0, r0, #2
	ldr r1, _080C2120
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C211C: .4byte 0x02039988
_080C2120: .4byte 0x080C2124
_080C2124: @ jump table
	.4byte _080C213C @ case 0
	.4byte _080C2170 @ case 1
	.4byte _080C21A4 @ case 2
	.4byte _080C2204 @ case 3
	.4byte _080C2238 @ case 4
	.4byte _080C226C @ case 5
_080C213C:
	ldr r0, _080C2150
	ldr r1, [r0]
	ldr r2, _080C2154
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C2160
	ldr r0, _080C2158
	ldr r2, _080C215C
	b _080C227E
	.align 2, 0
_080C2150: .4byte 0x02039988
_080C2154: .4byte 0x00000516
_080C2158: .4byte 0x08545BFC
_080C215C: .4byte 0x00000EE4
_080C2160:
	ldr r0, _080C2168
	ldr r2, _080C216C
	b _080C227E
	.align 2, 0
_080C2168: .4byte 0x08545C94
_080C216C: .4byte 0x00000EE4
_080C2170:
	ldr r0, _080C2184
	ldr r1, [r0]
	ldr r2, _080C2188
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C2194
	ldr r0, _080C218C
	ldr r2, _080C2190
	b _080C227E
	.align 2, 0
_080C2184: .4byte 0x02039988
_080C2188: .4byte 0x00000516
_080C218C: .4byte 0x085456E8
_080C2190: .4byte 0x00000A34
_080C2194:
	ldr r0, _080C219C
	ldr r2, _080C21A0
	b _080C227E
	.align 2, 0
_080C219C: .4byte 0x085457C4
_080C21A0: .4byte 0x00000A34
_080C21A4:
	ldr r0, _080C21C0
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	cmp r0, #0
	bne _080C21DC
	ldr r2, _080C21C4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C21CC
	ldr r0, _080C21C8
	adds r2, #0x6e
	b _080C227E
	.align 2, 0
_080C21C0: .4byte 0x02039988
_080C21C4: .4byte 0x00000516
_080C21C8: .4byte 0x08545390
_080C21CC:
	ldr r0, _080C21D4
	ldr r2, _080C21D8
	b _080C227E
	.align 2, 0
_080C21D4: .4byte 0x08545530
_080C21D8: .4byte 0x00000584
_080C21DC:
	ldr r2, _080C21EC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C21F4
	ldr r0, _080C21F0
	adds r2, #0x6e
	b _080C227E
	.align 2, 0
_080C21EC: .4byte 0x00000516
_080C21F0: .4byte 0x085458F0
_080C21F4:
	ldr r0, _080C21FC
	ldr r2, _080C2200
	b _080C227E
	.align 2, 0
_080C21FC: .4byte 0x08545A70
_080C2200: .4byte 0x00000584
_080C2204:
	ldr r0, _080C2218
	ldr r1, [r0]
	ldr r2, _080C221C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C2228
	ldr r0, _080C2220
	ldr r2, _080C2224
	b _080C227E
	.align 2, 0
_080C2218: .4byte 0x02039988
_080C221C: .4byte 0x00000516
_080C2220: .4byte 0x0854622C
_080C2224: .4byte 0x00001394
_080C2228:
	ldr r0, _080C2230
	ldr r2, _080C2234
	b _080C227E
	.align 2, 0
_080C2230: .4byte 0x08546474
_080C2234: .4byte 0x00001394
_080C2238:
	ldr r0, _080C224C
	ldr r1, [r0]
	ldr r2, _080C2250
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C225C
	ldr r0, _080C2254
	ldr r2, _080C2258
	b _080C227E
	.align 2, 0
_080C224C: .4byte 0x02039988
_080C2250: .4byte 0x00000516
_080C2254: .4byte 0x0854441C
_080C2258: .4byte 0x00001994
_080C225C:
	ldr r0, _080C2264
	ldr r2, _080C2268
	b _080C227E
	.align 2, 0
_080C2264: .4byte 0x08544B5C
_080C2268: .4byte 0x00001994
_080C226C:
	ldr r0, _080C2288
	ldr r1, [r0]
	ldr r2, _080C228C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C22A0
	ldr r0, _080C2290
	ldr r2, _080C2294
_080C227E:
	adds r1, r1, r2
	bl LZ77UnCompWram
	b _080C22A0
	.align 2, 0
_080C2288: .4byte 0x02039988
_080C228C: .4byte 0x00000516
_080C2290: .4byte 0x0854521C
_080C2294: .4byte 0x00001794
_080C2298:
	movs r0, #0
	strb r0, [r1, #2]
	movs r0, #1
	b _080C22AC
_080C22A0:
	ldr r0, _080C22B0
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	movs r0, #0
_080C22AC:
	pop {r1}
	bx r1
	.align 2, 0
_080C22B0: .4byte 0x02039988
	thumb_func_end LoadCardGfx

	thumb_func_start CB2_InitTrainerCard
CB2_InitTrainerCard: @ 0x080C22B4
	push {lr}
	sub sp, #8
	ldr r1, _080C22D4
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #0xa
	bls _080C22CA
	b _080C2408
_080C22CA:
	lsls r0, r0, #2
	ldr r1, _080C22D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C22D4: .4byte 0x03002360
_080C22D8: .4byte 0x080C22DC
_080C22DC: @ jump table
	.4byte _080C2308 @ case 0
	.4byte _080C2320 @ case 1
	.4byte _080C2348 @ case 2
	.4byte _080C2380 @ case 3
	.4byte _080C239A @ case 4
	.4byte _080C23A4 @ case 5
	.4byte _080C23B8 @ case 6
	.4byte _080C23BE @ case 7
	.4byte _080C23D0 @ case 8
	.4byte _080C23D6 @ case 9
	.4byte _080C23E8 @ case 10
_080C2308:
	bl ResetGpuRegs
	bl sub_080C2A44
	ldr r1, _080C231C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080C23FC
	.align 2, 0
_080C231C: .4byte 0x03002360
_080C2320:
	movs r1, #0xe0
	lsls r1, r1, #0x13
	movs r0, #0
	str r0, [sp]
	ldr r0, _080C2340
	mov r2, sp
	str r2, [r0]
	str r1, [r0, #4]
	ldr r1, _080C2344
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r3, r0
	b _080C23FC
	.align 2, 0
_080C2340: .4byte 0x040000D4
_080C2344: .4byte 0x85000100
_080C2348:
	ldr r0, _080C2374
	ldr r0, [r0]
	movs r1, #0xa3
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080C236C
	movs r2, #0xa0
	lsls r2, r2, #0x13
	add r1, sp, #4
	strh r0, [r1]
	ldr r0, _080C2378
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _080C237C
	str r1, [r0, #8]
	ldr r0, [r0, #8]
_080C236C:
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r3, r2
	b _080C23FC
	.align 2, 0
_080C2374: .4byte 0x02039988
_080C2378: .4byte 0x040000D4
_080C237C: .4byte 0x81000200
_080C2380:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	ldr r1, _080C23A0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080C239A:
	bl InitBgsAndWindows
	b _080C23F4
	.align 2, 0
_080C23A0: .4byte 0x03002360
_080C23A4:
	bl sub_080C3B0C
	ldr r1, _080C23B4
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080C23FC
	.align 2, 0
_080C23B4: .4byte 0x03002360
_080C23B8:
	bl LoadCardGfx
	b _080C23EC
_080C23BE:
	bl sub_080C3C6C
	ldr r1, _080C23CC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080C23FC
	.align 2, 0
_080C23CC: .4byte 0x03002360
_080C23D0:
	bl HandleGpuRegs
	b _080C23F4
_080C23D6:
	bl PrintAllVariableNumsOnCardPage2
	ldr r1, _080C23E4
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080C23FC
	.align 2, 0
_080C23E4: .4byte 0x03002360
_080C23E8:
	bl SetCardBgsAndPals
_080C23EC:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080C240C
_080C23F4:
	ldr r1, _080C2404
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_080C23FC:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080C240C
	.align 2, 0
_080C2404: .4byte 0x03002360
_080C2408:
	bl SetTrainerCardCb2
_080C240C:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_InitTrainerCard

	thumb_func_start GetCappedGameStat
GetCappedGameStat: @ 0x080C2414
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetGameStat
	cmp r0, r4
	bls _080C2426
	adds r0, r4, #0
_080C2426:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetCappedGameStat

	thumb_func_start HasAllFrontierSymbols
HasAllFrontierSymbols: @ 0x080C242C
	push {r4, r5, lr}
	movs r5, #0
_080C2430:
	lsls r4, r5, #1
	ldr r1, _080C2454
	adds r0, r4, r1
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C244E
	ldr r1, _080C2458
	adds r0, r4, r1
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C245C
_080C244E:
	movs r0, #0
	b _080C2468
	.align 2, 0
_080C2454: .4byte 0x000008C4
_080C2458: .4byte 0x000008C5
_080C245C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #6
	bls _080C2430
	movs r0, #1
_080C2468:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end HasAllFrontierSymbols

	thumb_func_start CountPlayerTrainerStars
CountPlayerTrainerStars: @ 0x080C2470
	push {r4, lr}
	movs r0, #0xa
	bl GetGameStat
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	bl HasAllHoennMons
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080C248A
	adds r4, #1
_080C248A:
	bl CountPlayerContestPaintings
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080C249C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080C249C:
	bl HasAllFrontierSymbols
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C24AC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080C24AC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CountPlayerTrainerStars

	thumb_func_start GetRubyTrainerStars
GetRubyTrainerStars: @ 0x080C24B4
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _080C24C6
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _080C24C8
_080C24C6:
	movs r2, #1
_080C24C8:
	ldrb r0, [r1, #3]
	cmp r0, #0
	beq _080C24D4
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080C24D4:
	ldrh r0, [r1, #0x1a]
	cmp r0, #0x31
	bls _080C24E0
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080C24E0:
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _080C24EC
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080C24EC:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetRubyTrainerStars

	thumb_func_start SetPlayerCardData
SetPlayerCardData: @ 0x080C24F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r6, _080C25D4
	ldr r1, [r6]
	ldrb r0, [r1, #8]
	strb r0, [r5]
	ldrh r0, [r1, #0xe]
	strh r0, [r5, #0x10]
	ldrb r0, [r1, #0x10]
	strh r0, [r5, #0x12]
	movs r0, #1
	bl GetGameStat
	adds r4, r0, #0
	movs r0, #0xa
	bl GetGameStat
	cmp r0, #0
	bne _080C2526
	movs r4, #0
_080C2526:
	lsrs r0, r4, #0x10
	strh r0, [r5, #6]
	lsrs r1, r4, #8
	movs r2, #0xff
	ands r1, r2
	strh r1, [r5, #8]
	ands r4, r2
	strh r4, [r5, #0xa]
	ldr r1, _080C25D8
	cmp r0, r1
	bls _080C2544
	strh r1, [r5, #6]
	movs r0, #0x3b
	strh r0, [r5, #8]
	strh r0, [r5, #0xa]
_080C2544:
	ldr r0, _080C25DC
	bl FlagGet
	strb r0, [r5, #2]
	bl HasAllHoennMons
	strb r0, [r5, #3]
	bl GetCaughtMonsCount
	strh r0, [r5, #0xc]
	ldr r0, [r6]
	ldrb r1, [r0, #0xb]
	lsls r1, r1, #8
	ldrb r0, [r0, #0xa]
	orrs r0, r1
	strh r0, [r5, #0xe]
	ldr r4, _080C25E0
	movs r0, #0x17
	adds r1, r4, #0
	bl GetCappedGameStat
	strh r0, [r5, #0x14]
	movs r0, #0x18
	adds r1, r4, #0
	bl GetCappedGameStat
	strh r0, [r5, #0x16]
	ldr r1, _080C25E4
	movs r0, #0x15
	bl GetCappedGameStat
	strh r0, [r5, #0x20]
	ldr r4, _080C25E8
	ldr r0, [r4]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	bl GetMoney
	str r0, [r5, #0x24]
	movs r2, #0
	adds r7, r5, #0
	adds r7, #0x30
	adds r6, r5, #0
	adds r6, #0x28
	ldr r0, [r4]
	ldr r1, _080C25EC
	adds r3, r0, r1
_080C25A4:
	lsls r0, r2, #1
	adds r1, r6, r0
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080C25A4
	ldr r0, _080C25D4
	ldr r1, [r0]
	adds r0, r7, #0
	bl StringCopy
	mov r0, r8
	cmp r0, #1
	beq _080C2634
	cmp r0, #1
	bgt _080C25F0
	cmp r0, #0
	beq _080C25FC
	b _080C2644
	.align 2, 0
_080C25D4: .4byte 0x03005AF0
_080C25D8: .4byte 0x000003E7
_080C25DC: .4byte 0x00000861
_080C25E0: .4byte 0x0000270F
_080C25E4: .4byte 0x0000FFFF
_080C25E8: .4byte 0x03005AEC
_080C25EC: .4byte 0x00002BB0
_080C25F0:
	mov r1, r8
	cmp r1, #2
	bne _080C2644
	movs r0, #0
	strh r0, [r5, #0x18]
	strh r0, [r5, #0x1a]
_080C25FC:
	ldr r1, _080C262C
	movs r0, #0x23
	bl GetCappedGameStat
	strh r0, [r5, #0x1c]
	ldr r1, _080C2630
	movs r0, #0x22
	bl GetCappedGameStat
	strh r0, [r5, #0x1e]
	bl CountPlayerContestPaintings
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _080C2620
	movs r0, #1
	strb r0, [r5, #4]
_080C2620:
	adds r0, r5, #0
	bl GetRubyTrainerStars
	strb r0, [r5, #1]
	b _080C2644
	.align 2, 0
_080C262C: .4byte 0x000003E7
_080C2630: .4byte 0x0000FFFF
_080C2634:
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x18]
	strh r0, [r5, #0x1a]
	strh r0, [r5, #0x1c]
	strh r0, [r5, #0x1e]
	strb r1, [r5, #4]
	strb r1, [r5, #1]
_080C2644:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetPlayerCardData

	thumb_func_start TrainerCard_GenerateCardForLinkPlayer
TrainerCard_GenerateCardForLinkPlayer: @ 0x080C2650
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x64
	bl memset
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #2
	bl SetPlayerCardData
	bl HasAllFrontierSymbols
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
	ldr r0, _080C26A8
	ldr r0, [r0]
	ldr r2, _080C26AC
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r2, r4, #0
	adds r2, #0x62
	strh r0, [r2]
	ldrh r0, [r1]
	cmp r0, #0
	beq _080C2696
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_080C2696:
	ldrb r0, [r4]
	cmp r0, #1
	bne _080C26B4
	ldr r2, _080C26B0
	ldrh r0, [r4, #0xe]
	movs r1, #7
	ands r0, r1
	adds r0, #8
	b _080C26BC
	.align 2, 0
_080C26A8: .4byte 0x03005AF0
_080C26AC: .4byte 0x00000EBA
_080C26B0: .4byte 0x082FA6E2
_080C26B4:
	ldr r2, _080C26D0
	ldrh r0, [r4, #0xe]
	movs r1, #7
	ands r0, r1
_080C26BC:
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4f
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C26D0: .4byte 0x082FA6E2
	thumb_func_end TrainerCard_GenerateCardForLinkPlayer

	thumb_func_start TrainerCard_GenerateCardForPlayer
TrainerCard_GenerateCardForPlayer: @ 0x080C26D4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x60
	bl memset
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #2
	bl SetPlayerCardData
	bl HasAllFrontierSymbols
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x3a]
	ldr r1, _080C2724
	ldr r1, [r1]
	ldr r2, _080C2728
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r4, #0x3c]
	cmp r0, #0
	beq _080C2710
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_080C2710:
	ldrb r0, [r4]
	cmp r0, #1
	bne _080C2730
	ldr r2, _080C272C
	ldrh r0, [r4, #0xe]
	movs r1, #7
	ands r0, r1
	adds r0, #8
	b _080C2738
	.align 2, 0
_080C2724: .4byte 0x03005AF0
_080C2728: .4byte 0x00000EBA
_080C272C: .4byte 0x082FA6E2
_080C2730:
	ldr r2, _080C274C
	ldrh r0, [r4, #0xe]
	movs r1, #7
	ands r0, r1
_080C2738:
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4f
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C274C: .4byte 0x082FA6E2
	thumb_func_end TrainerCard_GenerateCardForPlayer

	thumb_func_start CopyTrainerCardData
CopyTrainerCardData: @ 0x080C2750
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	movs r2, #0x64
	bl memset
	adds r0, r5, #0
	adds r0, #0x38
	strb r4, [r0]
	adds r0, r4, #0
	bl VersionToCardType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080C2792
	cmp r0, #1
	bgt _080C2780
	cmp r0, #0
	beq _080C2786
	b _080C27BA
_080C2780:
	cmp r0, #2
	beq _080C279E
	b _080C27BA
_080C2786:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x60
	bl memcpy
	b _080C27BA
_080C2792:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x38
	bl memcpy
	b _080C27BA
_080C279E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x60
	bl memcpy
	movs r0, #0
	str r0, [r5, #0x3c]
	ldrh r1, [r6, #0x3a]
	adds r0, r5, #0
	adds r0, #0x60
	strh r1, [r0]
	ldrh r1, [r6, #0x3c]
	adds r0, #2
	strh r1, [r0]
_080C27BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end CopyTrainerCardData

	thumb_func_start SetDataFromTrainerCard
SetDataFromTrainerCard: @ 0x080C27C0
	push {r4, r5, lr}
	ldr r4, _080C288C
	ldr r0, [r4]
	movs r1, #0
	strb r1, [r0, #0xa]
	ldr r0, [r4]
	strb r1, [r0, #0xb]
	ldr r0, [r4]
	strb r1, [r0, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	strb r1, [r0, #0xe]
	ldr r0, [r4]
	strb r1, [r0, #0xf]
	ldr r0, [r4]
	strb r1, [r0, #0x10]
	ldr r0, [r4]
	adds r0, #0x11
	movs r2, #8
	bl memset
	ldr r1, [r4]
	ldr r2, _080C2890
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C27FE
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
_080C27FE:
	ldr r1, [r4]
	ldr r3, _080C2894
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _080C2816
	movs r2, #0xa5
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080C281C
_080C2816:
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_080C281C:
	ldr r2, _080C288C
	ldr r1, [r2]
	ldr r3, _080C2898
	adds r0, r1, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _080C2830
	ldrb r0, [r1, #0xc]
	adds r0, #1
	strb r0, [r1, #0xc]
_080C2830:
	ldr r1, [r2]
	movs r3, #0xa8
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C2844
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
_080C2844:
	ldr r1, [r2]
	movs r2, #0xa7
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080C2858
	ldrb r0, [r1, #0xd]
	adds r0, #1
	strb r0, [r1, #0xd]
_080C2858:
	movs r5, #0
	ldr r4, _080C289C
_080C285C:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C2878
	ldr r0, _080C288C
	ldr r1, [r0]
	adds r1, #0x11
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080C2878:
	adds r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080C28A0
	cmp r4, r0
	bls _080C285C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C288C: .4byte 0x02039988
_080C2890: .4byte 0x00000522
_080C2894: .4byte 0x00000526
_080C2898: .4byte 0x00000534
_080C289C: .4byte 0x00000867
_080C28A0: .4byte 0x0000086E
	thumb_func_end SetDataFromTrainerCard

	thumb_func_start HandleGpuRegs
HandleGpuRegs: @ 0x080C28A4
	push {lr}
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
	movs r1, #0xc1
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x1e
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0xa0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0xf0
	bl SetGpuReg
	ldr r0, _080C2908
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C290C
	movs r0, #0xc7
	bl EnableInterrupts
	b _080C2912
	.align 2, 0
_080C2908: .4byte 0x030031C4
_080C290C:
	movs r0, #3
	bl EnableInterrupts
_080C2912:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end HandleGpuRegs

	thumb_func_start sub_080C2918
sub_080C2918: @ 0x080C2918
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x28
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bgt _080C2932
	movs r2, #0
_080C2932:
	ldr r4, _080C2970
	ldr r0, [r4]
	ldr r1, _080C2974
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x54
	bl SetGpuReg
	ldr r0, [r4]
	ldr r1, _080C2978
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r1, r2, #8
	movs r0, #0xa0
	subs r0, r0, r2
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2970: .4byte 0x02039988
_080C2974: .4byte 0x00000514
_080C2978: .4byte 0x00007C94
	thumb_func_end sub_080C2918

	thumb_func_start ResetGpuRegs
ResetGpuRegs: @ 0x080C297C
	push {lr}
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl SetHBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetGpuRegs

	thumb_func_start InitBgsAndWindows
InitBgsAndWindows: @ 0x080C29B8
	push {lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080C2A2C
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
	ldr r0, _080C2A30
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl sub_08196F98
	pop {r0}
	bx r0
	.align 2, 0
_080C2A2C: .4byte 0x08546714
_080C2A30: .4byte 0x08546724
	thumb_func_end InitBgsAndWindows

	thumb_func_start SetTrainerCardCb2
SetTrainerCardCb2: @ 0x080C2A34
	push {lr}
	ldr r0, _080C2A40
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C2A40: .4byte 0x080C1D3D
	thumb_func_end SetTrainerCardCb2

	thumb_func_start sub_080C2A44
sub_080C2A44: @ 0x080C2A44
	push {lr}
	bl ResetTasks
	bl ScanlineEffect_Stop
	ldr r0, _080C2A64
	movs r1, #0
	bl CreateTask
	bl sub_080C47EC
	bl SetDataFromTrainerCard
	pop {r0}
	bx r0
	.align 2, 0
_080C2A64: .4byte 0x080C1D8D
	thumb_func_end sub_080C2A44

	thumb_func_start PrintAllOnCardPage1
PrintAllOnCardPage1: @ 0x080C2A68
	push {lr}
	ldr r0, _080C2A80
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	cmp r0, #5
	bhi _080C2AC4
	lsls r0, r0, #2
	ldr r1, _080C2A84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C2A80: .4byte 0x02039988
_080C2A84: .4byte 0x080C2A88
_080C2A88: @ jump table
	.4byte _080C2AA0 @ case 0
	.4byte _080C2AA6 @ case 1
	.4byte _080C2AAC @ case 2
	.4byte _080C2AB2 @ case 3
	.4byte _080C2AB8 @ case 4
	.4byte _080C2ABE @ case 5
_080C2AA0:
	bl sub_080C2BA4
	b _080C2ACC
_080C2AA6:
	bl PrintNameOnCard
	b _080C2ACC
_080C2AAC:
	bl PrintProfilePhraseOnCard
	b _080C2ACC
_080C2AB2:
	bl PrintPokedexOnCard
	b _080C2ACC
_080C2AB8:
	bl PrintMoneyOnCard
	b _080C2ACC
_080C2ABE:
	bl PrintString
	b _080C2ACC
_080C2AC4:
	movs r0, #0
	strb r0, [r1, #1]
	movs r0, #1
	b _080C2AD8
_080C2ACC:
	ldr r0, _080C2ADC
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	movs r0, #0
_080C2AD8:
	pop {r1}
	bx r1
	.align 2, 0
_080C2ADC: .4byte 0x02039988
	thumb_func_end PrintAllOnCardPage1

	thumb_func_start PrintStringsOnCardPage2
PrintStringsOnCardPage2: @ 0x080C2AE0
	push {lr}
	ldr r0, _080C2AF8
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	cmp r0, #7
	bhi _080C2B5C
	lsls r0, r0, #2
	ldr r1, _080C2AFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C2AF8: .4byte 0x02039988
_080C2AFC: .4byte 0x080C2B00
_080C2B00: @ jump table
	.4byte _080C2B20 @ case 0
	.4byte _080C2B26 @ case 1
	.4byte _080C2B2C @ case 2
	.4byte _080C2B32 @ case 3
	.4byte _080C2B38 @ case 4
	.4byte _080C2B42 @ case 5
	.4byte _080C2B4C @ case 6
	.4byte _080C2B56 @ case 7
_080C2B20:
	bl sub_080C323C
	b _080C2B64
_080C2B26:
	bl PrintWinsLossesStringOnCard
	b _080C2B64
_080C2B2C:
	bl PrintIdOnCard
	b _080C2B64
_080C2B32:
	bl PrintBattleFacilityStringOnCard
	b _080C2B64
_080C2B38:
	bl PrintBerryCrushStringOnCard
	bl PrintContestStringOnCard
	b _080C2B64
_080C2B42:
	bl PrintUnionStringOnCard
	bl PrintPokeblockStringOnCard
	b _080C2B64
_080C2B4C:
	bl TrainerCard_PrintPokemonIconsOnCard
	bl sub_080C395C
	b _080C2B64
_080C2B56:
	bl PrintNameOnCard2
	b _080C2B64
_080C2B5C:
	movs r0, #0
	strb r0, [r1, #1]
	movs r0, #1
	b _080C2B70
_080C2B64:
	ldr r0, _080C2B74
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	movs r0, #0
_080C2B70:
	pop {r1}
	bx r1
	.align 2, 0
_080C2B74: .4byte 0x02039988
	thumb_func_end PrintStringsOnCardPage2

	thumb_func_start PrintAllVariableNumsOnCardPage2
PrintAllVariableNumsOnCardPage2: @ 0x080C2B78
	push {lr}
	bl sub_080C31FC
	bl PrintHofTimeOnCard
	bl PrintLinkResultsNumsOnCard
	bl PrintTradesNumOnCard
	bl PrintUnionNumOnCard
	bl PrintBerryCrushNumOnCard
	bl PrintPokeblocksNumOnCard
	bl PrintContestNumOnCard
	bl PrintBattleFacilityNumsOnCard
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PrintAllVariableNumsOnCardPage2

	thumb_func_start sub_080C2BA4
sub_080C2BA4: @ 0x080C2BA4
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _080C2BD4
	ldr r0, [r0]
	ldr r1, _080C2BD8
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C2BE8
	ldr r0, _080C2BDC
	ldrb r1, [r0, #1]
	ldr r0, _080C2BE0
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	ldr r0, _080C2BE4
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x14
	movs r3, #0x1e
	bl AddTextPrinterParameterized3
	b _080C2C04
	.align 2, 0
_080C2BD4: .4byte 0x02039988
_080C2BD8: .4byte 0x00000516
_080C2BDC: .4byte 0x08546775
_080C2BE0: .4byte 0x0854676C
_080C2BE4: .4byte 0x085CC31F
_080C2BE8:
	ldr r0, _080C2C40
	ldrb r1, [r0, #1]
	ldr r0, _080C2C44
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	ldr r0, _080C2C48
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0x22
	bl AddTextPrinterParameterized3
_080C2C04:
	ldr r0, _080C2C40
	ldrb r1, [r0, #1]
	ldr r2, _080C2C4C
	ldr r0, _080C2C50
	ldr r4, [r0]
	ldr r3, _080C2C54
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r2, r0, r2
	ldrb r2, [r2]
	ldr r3, _080C2C58
	adds r0, r0, r3
	ldrb r3, [r0]
	ldr r0, _080C2C44
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	movs r0, #0xaa
	lsls r0, r0, #3
	adds r4, r4, r0
	str r4, [sp, #8]
	movs r0, #1
	bl AddTextPrinterParameterized3
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2C40: .4byte 0x08546775
_080C2C44: .4byte 0x0854676C
_080C2C48: .4byte 0x085CC31F
_080C2C4C: .4byte 0x085467A0
_080C2C50: .4byte 0x02039988
_080C2C54: .4byte 0x00000517
_080C2C58: .4byte 0x085467A2
	thumb_func_end sub_080C2BA4

	thumb_func_start PrintNameOnCard
PrintNameOnCard: @ 0x080C2C5C
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r4, _080C2CB4
	ldr r0, [r4]
	ldr r1, _080C2CB8
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #0xc
	movs r2, #2
	movs r3, #5
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _080C2CBC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C2CCC
	ldr r0, _080C2CC0
	ldrb r6, [r0, #1]
	ldr r5, _080C2CC4
	str r5, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C2CC8
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x82
	movs r3, #0xb
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	add r0, sp, #0xc
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0xa6
	movs r3, #0xb
	bl AddTextPrinterParameterized3
	b _080C2CFE
	.align 2, 0
_080C2CB4: .4byte 0x02039988
_080C2CB8: .4byte 0x0000052E
_080C2CBC: .4byte 0x00000516
_080C2CC0: .4byte 0x08546775
_080C2CC4: .4byte 0x0854676C
_080C2CC8: .4byte 0x085CC323
_080C2CCC:
	ldr r0, _080C2D08
	ldrb r6, [r0, #1]
	ldr r5, _080C2D0C
	str r5, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C2D10
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x73
	movs r3, #0xa
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	add r1, sp, #0xc
	str r1, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x99
	movs r3, #0xa
	bl AddTextPrinterParameterized3
_080C2CFE:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C2D08: .4byte 0x08546775
_080C2D0C: .4byte 0x0854676C
_080C2D10: .4byte 0x085CC323
	thumb_func_end PrintNameOnCard

	thumb_func_start PrintProfilePhraseOnCard
PrintProfilePhraseOnCard: @ 0x080C2D14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r7, _080C2D94
	ldr r4, _080C2D98
	ldr r0, [r4]
	ldr r1, _080C2D9C
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r7, #0
	movs r2, #0
	movs r3, #6
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _080C2DA0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C2DB4
	ldr r6, _080C2DA4
	ldrb r1, [r6, #1]
	ldr r5, _080C2DA8
	str r5, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C2DAC
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x14
	movs r3, #0x38
	bl AddTextPrinterParameterized3
	adds r0, r7, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	movs r1, #0x78
	rsbs r1, r1, #0
	adds r2, r1, #0
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r6, [r6]
	str r5, [sp]
	str r4, [sp, #4]
	str r7, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r3, #0x38
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	ldr r0, _080C2DB0
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x8a
	movs r3, #0x38
	bl AddTextPrinterParameterized3
	b _080C2E08
	.align 2, 0
_080C2D94: .4byte 0x02021C7C
_080C2D98: .4byte 0x02039988
_080C2D9C: .4byte 0x00000544
_080C2DA0: .4byte 0x00000517
_080C2DA4: .4byte 0x08546775
_080C2DA8: .4byte 0x0854676C
_080C2DAC: .4byte 0x085CC329
_080C2DB0: .4byte 0x085CC32F
_080C2DB4:
	ldr r6, _080C2E10
	ldrb r1, [r6, #1]
	ldr r5, _080C2E14
	str r5, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C2E18
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0x3a
	bl AddTextPrinterParameterized3
	adds r0, r7, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	movs r2, #0x6c
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r6, [r6]
	str r5, [sp]
	str r4, [sp, #4]
	str r7, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r3, #0x3a
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	ldr r0, _080C2E1C
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x6e
	movs r3, #0x3a
	bl AddTextPrinterParameterized3
_080C2E08:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2E10: .4byte 0x08546775
_080C2E14: .4byte 0x0854676C
_080C2E18: .4byte 0x085CC329
_080C2E1C: .4byte 0x085CC32F
	thumb_func_end PrintProfilePhraseOnCard

	thumb_func_start GetCaughtMonsCount
GetCaughtMonsCount: @ 0x080C2E20
	push {lr}
	bl IsNationalPokedexEnabled
	cmp r0, #0
	bne _080C2E32
	movs r0, #1
	bl GetHoennPokedexCount
	b _080C2E38
_080C2E32:
	movs r0, #1
	bl GetNationalPokedexCount
_080C2E38:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end GetCaughtMonsCount

	thumb_func_start PrintPokedexOnCard
PrintPokedexOnCard: @ 0x080C2E40
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _080C2ECC
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C2F44
	ldr r7, _080C2ED0
	ldr r4, _080C2ED4
	ldr r0, [r4]
	ldr r1, _080C2ED8
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _080C2EDC
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C2EF0
	ldr r6, _080C2EE0
	ldrb r1, [r6, #1]
	ldr r5, _080C2EE4
	str r5, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C2EE8
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x14
	movs r3, #0x48
	bl AddTextPrinterParameterized3
	adds r0, r7, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	movs r1, #0x78
	rsbs r1, r1, #0
	adds r2, r1, #0
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r6, [r6]
	str r5, [sp]
	str r4, [sp, #4]
	str r7, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r3, #0x48
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	ldr r0, _080C2EEC
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x8a
	movs r3, #0x48
	bl AddTextPrinterParameterized3
	b _080C2F44
	.align 2, 0
_080C2ECC: .4byte 0x00000861
_080C2ED0: .4byte 0x02021C7C
_080C2ED4: .4byte 0x02039988
_080C2ED8: .4byte 0x0000052C
_080C2EDC: .4byte 0x00000517
_080C2EE0: .4byte 0x08546775
_080C2EE4: .4byte 0x0854676C
_080C2EE8: .4byte 0x085CC331
_080C2EEC: .4byte 0x085CC339
_080C2EF0:
	ldr r6, _080C2F4C
	ldrb r1, [r6, #1]
	ldr r5, _080C2F50
	str r5, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C2F54
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0x4a
	bl AddTextPrinterParameterized3
	adds r0, r7, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	movs r2, #0x6c
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r6, [r6]
	str r5, [sp]
	str r4, [sp, #4]
	str r7, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r3, #0x4a
	bl AddTextPrinterParameterized3
	str r5, [sp]
	str r4, [sp, #4]
	ldr r0, _080C2F58
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x6e
	movs r3, #0x4a
	bl AddTextPrinterParameterized3
_080C2F44:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2F4C: .4byte 0x08546775
_080C2F50: .4byte 0x0854676C
_080C2F54: .4byte 0x085CC331
_080C2F58: .4byte 0x085CC339
	thumb_func_end PrintPokedexOnCard

	thumb_func_start PrintMoneyOnCard
PrintMoneyOnCard: @ 0x080C2F5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _080C2F84
	ldr r2, [r0]
	ldrb r1, [r2, #5]
	adds r6, r0, #0
	cmp r1, #0
	beq _080C2F88
	movs r1, #0xa6
	lsls r1, r1, #3
	adds r0, r2, r1
	ldrh r5, [r0]
	adds r1, #2
	adds r0, r2, r1
	ldrh r0, [r0]
	b _080C2F90
	.align 2, 0
_080C2F84: .4byte 0x02039988
_080C2F88:
	ldr r0, _080C2FF0
	ldr r0, [r0]
	ldrh r5, [r0, #0xe]
	ldrb r0, [r0, #0x10]
_080C2F90:
	mov sl, r0
	ldr r0, _080C2FF4
	cmp r5, r0
	bls _080C2F9A
	adds r5, r0, #0
_080C2F9A:
	mov r2, sl
	cmp r2, #0x3b
	bls _080C2FA4
	movs r0, #0x3b
	mov sl, r0
_080C2FA4:
	ldr r1, _080C2FF8
	ldr r0, [r6]
	ldr r4, _080C2FFC
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r2, [r1]
	ldr r1, _080C3000
	adds r0, r0, r1
	ldrb r3, [r0]
	movs r0, #0x32
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelRect
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C3010
	ldr r0, _080C3004
	ldrb r1, [r0, #1]
	ldr r0, _080C3008
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	ldr r0, _080C300C
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x14
	movs r3, #0x58
	bl AddTextPrinterParameterized3
	b _080C302C
	.align 2, 0
_080C2FF0: .4byte 0x03005AF0
_080C2FF4: .4byte 0x000003E7
_080C2FF8: .4byte 0x085467AC
_080C2FFC: .4byte 0x00000517
_080C3000: .4byte 0x085467B2
_080C3004: .4byte 0x08546775
_080C3008: .4byte 0x0854676C
_080C300C: .4byte 0x085CC341
_080C3010:
	ldr r0, _080C30DC
	ldrb r1, [r0, #1]
	ldr r0, _080C30E0
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	ldr r0, _080C30E4
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0x5a
	bl AddTextPrinterParameterized3
_080C302C:
	ldr r0, _080C30E8
	adds r1, r5, #0
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, _080C30DC
	ldrb r7, [r0]
	ldr r1, _080C30EC
	ldr r2, _080C30F0
	mov sb, r2
	ldr r0, [r2]
	ldr r2, _080C30F4
	mov r8, r2
	add r0, r8
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r2, [r1]
	ldr r6, _080C30F8
	adds r0, r0, r6
	ldrb r3, [r0]
	ldr r0, _080C30E0
	str r0, [sp]
	movs r5, #1
	rsbs r5, r5, #0
	str r5, [sp, #4]
	ldr r1, _080C30E8
	str r1, [sp, #8]
	movs r0, #1
	adds r1, r7, #0
	bl AddTextPrinterParameterized3
	ldr r1, _080C30FC
	mov r2, sb
	ldr r4, [r2]
	mov r2, r8
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r2, [r1]
	adds r0, r0, r6
	ldrb r3, [r0]
	ldr r1, _080C3100
	ldrb r0, [r4, #7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, _080C3104
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r7, #0
	bl AddTextPrinterParameterized3
	ldr r0, _080C30E8
	mov r1, sl
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r1, _080C3108
	mov r2, sb
	ldr r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r2, [r1]
	adds r0, r0, r6
	ldrb r3, [r0]
	ldr r0, _080C30E0
	str r0, [sp]
	str r5, [sp, #4]
	ldr r1, _080C30E8
	str r1, [sp, #8]
	movs r0, #1
	adds r1, r7, #0
	bl AddTextPrinterParameterized3
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C30DC: .4byte 0x08546775
_080C30E0: .4byte 0x0854676C
_080C30E4: .4byte 0x085CC341
_080C30E8: .4byte 0x02021C7C
_080C30EC: .4byte 0x085467AC
_080C30F0: .4byte 0x02039988
_080C30F4: .4byte 0x00000517
_080C30F8: .4byte 0x085467B2
_080C30FC: .4byte 0x085467AE
_080C3100: .4byte 0x085467A4
_080C3104: .4byte 0x085CC33C
_080C3108: .4byte 0x085467B0
	thumb_func_end PrintMoneyOnCard

	thumb_func_start PrintString
PrintString: @ 0x080C310C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r0, #1
	movs r1, #0
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r7, _080C31E8
	ldr r1, [r7]
	ldrb r0, [r1, #5]
	cmp r0, #0
	beq _080C31DC
	ldr r0, _080C31EC
	mov r8, r0
	ldr r4, _080C31F0
	adds r0, r1, r4
	ldrb r0, [r0]
	add r0, r8
	ldrb r3, [r0]
	ldr r0, _080C31F4
	str r0, [sp]
	movs r5, #1
	rsbs r5, r5, #0
	str r5, [sp, #4]
	adds r0, r1, #0
	adds r0, #0x19
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa
	bl AddTextPrinterParameterized3
	ldr r0, [r7]
	adds r0, #0x19
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #1
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, #0xa
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	add r0, r8
	ldrb r3, [r0]
	ldr r0, _080C31F4
	str r0, [sp]
	str r5, [sp, #4]
	adds r1, #0x21
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #1
	bl AddTextPrinterParameterized3
	ldr r0, _080C31F8
	mov r8, r0
	ldr r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	add r0, r8
	ldrb r3, [r0]
	ldr r0, _080C31F4
	str r0, [sp]
	str r5, [sp, #4]
	adds r1, #0x29
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa
	bl AddTextPrinterParameterized3
	ldr r0, [r7]
	adds r0, #0x29
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #1
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, #0xa
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, [r7]
	adds r4, r1, r4
	ldrb r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	ldr r0, _080C31F4
	str r0, [sp]
	str r5, [sp, #4]
	adds r1, #0x31
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #1
	bl AddTextPrinterParameterized3
_080C31DC:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C31E8: .4byte 0x02039988
_080C31EC: .4byte 0x085467B4
_080C31F0: .4byte 0x00000517
_080C31F4: .4byte 0x0854676C
_080C31F8: .4byte 0x085467B6
	thumb_func_end PrintString

	thumb_func_start sub_080C31FC
sub_080C31FC: @ 0x080C31FC
	push {r4, lr}
	ldr r4, _080C3230
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x39
	movs r2, #0xaa
	lsls r2, r2, #3
	adds r1, r1, r2
	bl StringCopy
	ldr r4, [r4]
	ldr r1, _080C3234
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3228
	adds r0, r4, #0
	adds r0, #0x39
	ldr r1, _080C3238
	movs r2, #0xa
	bl StringAppendN
_080C3228:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3230: .4byte 0x02039988
_080C3234: .4byte 0x00000516
_080C3238: .4byte 0x085CC350
	thumb_func_end sub_080C31FC

	thumb_func_start sub_080C323C
sub_080C323C: @ 0x080C323C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _080C3270
	ldr r2, [r5]
	ldr r1, _080C3274
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C3280
	ldr r0, _080C3278
	ldrb r1, [r0, #1]
	ldr r0, _080C327C
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r0, #0x39
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x82
	movs r3, #0xa
	bl AddTextPrinterParameterized3
	b _080C32B0
	.align 2, 0
_080C3270: .4byte 0x02039988
_080C3274: .4byte 0x00000517
_080C3278: .4byte 0x08546775
_080C327C: .4byte 0x0854676C
_080C3280:
	adds r1, r2, #0
	adds r1, #0x39
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #1
	adds r2, r4, #0
	bl GetStringWidth
	movs r2, #0xd8
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _080C32B8
	ldrb r1, [r0, #1]
	ldr r0, _080C32BC
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5]
	adds r0, #0x39
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0xa
	bl AddTextPrinterParameterized3
_080C32B0:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C32B8: .4byte 0x08546775
_080C32BC: .4byte 0x0854676C
	thumb_func_end sub_080C323C

	thumb_func_start PrintHofTimeOnCard
PrintHofTimeOnCard: @ 0x080C32C0
	push {r4, lr}
	ldr r4, _080C3314
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	beq _080C330C
	ldr r0, _080C3318
	ldr r2, _080C331C
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, _080C3320
	ldr r1, [r4]
	movs r2, #0xa5
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, _080C3324
	ldr r1, [r4]
	ldr r2, _080C3328
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #2
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	adds r0, #0x7f
	ldr r1, _080C332C
	bl StringExpandPlaceholders
_080C330C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3314: .4byte 0x02039988
_080C3318: .4byte 0x02021C40
_080C331C: .4byte 0x00000526
_080C3320: .4byte 0x02021C54
_080C3324: .4byte 0x02021C68
_080C3328: .4byte 0x0000052A
_080C332C: .4byte 0x085467B8
	thumb_func_end PrintHofTimeOnCard

	thumb_func_start PrintWinsLossesStringOnCard
PrintWinsLossesStringOnCard: @ 0x080C3330
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _080C3384
	ldr r3, [r6]
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _080C337C
	ldr r5, _080C3388
	ldrb r1, [r5, #1]
	ldr r2, _080C338C
	ldr r4, _080C3390
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _080C3394
	str r0, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C3398
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x23
	bl AddTextPrinterParameterized3
	ldrb r1, [r5]
	ldr r0, _080C339C
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r6]
	adds r0, #0x7f
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x91
	movs r3, #0x23
	bl AddTextPrinterParameterized3
_080C337C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3384: .4byte 0x02039988
_080C3388: .4byte 0x08546775
_080C338C: .4byte 0x085467C1
_080C3390: .4byte 0x00000517
_080C3394: .4byte 0x0854676C
_080C3398: .4byte 0x085CC35A
_080C339C: .4byte 0x0854676F
	thumb_func_end PrintWinsLossesStringOnCard

	thumb_func_start PrintLinkResultsNumsOnCard
PrintLinkResultsNumsOnCard: @ 0x080C33A0
	push {r4, lr}
	ldr r4, _080C33F0
	ldr r1, [r4]
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _080C33EA
	adds r0, r1, #0
	adds r0, #0xc5
	ldr r2, _080C33F4
	ldr r3, _080C33F8
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r1, [r4]
	ldr r2, _080C33FC
	adds r0, r1, r2
	ldr r3, _080C3400
	adds r1, r1, r3
	ldrh r1, [r1]
	movs r2, #0
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r1, [r4]
	ldr r2, _080C3404
	adds r0, r1, r2
	ldr r3, _080C3408
	adds r1, r1, r3
	ldrh r1, [r1]
	movs r2, #0
	movs r3, #4
	bl ConvertIntToDecimalStringN
_080C33EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C33F0: .4byte 0x02039988
_080C33F4: .4byte 0x085467C4
_080C33F8: .4byte 0x00000516
_080C33FC: .4byte 0x00000151
_080C3400: .4byte 0x00000534
_080C3404: .4byte 0x00000197
_080C3408: .4byte 0x00000536
	thumb_func_end PrintLinkResultsNumsOnCard

	thumb_func_start PrintIdOnCard
PrintIdOnCard: @ 0x080C340C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r7, _080C3494
	ldr r3, [r7]
	ldrb r0, [r3, #0xc]
	cmp r0, #0
	beq _080C348A
	ldr r5, _080C3498
	ldrb r1, [r5, #1]
	ldr r2, _080C349C
	ldr r4, _080C34A0
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r6, _080C34A4
	str r6, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	adds r0, r3, #0
	adds r0, #0xc5
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x33
	bl AddTextPrinterParameterized3
	ldrb r5, [r5]
	str r6, [sp]
	str r4, [sp, #4]
	ldr r0, _080C34A8
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r5, #0
	movs r2, #0x6e
	movs r3, #0x33
	bl AddTextPrinterParameterized3
	ldr r6, _080C34AC
	str r6, [sp]
	str r4, [sp, #4]
	ldr r0, [r7]
	ldr r1, _080C34B0
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r5, #0
	movs r2, #0x82
	movs r3, #0x33
	bl AddTextPrinterParameterized3
	str r6, [sp]
	str r4, [sp, #4]
	ldr r0, [r7]
	ldr r4, _080C34B4
	adds r0, r0, r4
	str r0, [sp, #8]
	movs r0, #1
	adds r1, r5, #0
	movs r2, #0xb9
	movs r3, #0x33
	bl AddTextPrinterParameterized3
_080C348A:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3494: .4byte 0x02039988
_080C3498: .4byte 0x08546775
_080C349C: .4byte 0x085467C1
_080C34A0: .4byte 0x00000517
_080C34A4: .4byte 0x0854676C
_080C34A8: .4byte 0x085CC379
_080C34AC: .4byte 0x0854676F
_080C34B0: .4byte 0x00000151
_080C34B4: .4byte 0x00000197
	thumb_func_end PrintIdOnCard

	thumb_func_start PrintTradesNumOnCard
PrintTradesNumOnCard: @ 0x080C34B8
	push {lr}
	ldr r0, _080C34DC
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _080C34D8
	ldr r2, _080C34E0
	adds r0, r1, r2
	movs r2, #0xa8
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
_080C34D8:
	pop {r0}
	bx r0
	.align 2, 0
_080C34DC: .4byte 0x02039988
_080C34E0: .4byte 0x00000223
	thumb_func_end PrintTradesNumOnCard

	thumb_func_start PrintBattleFacilityStringOnCard
PrintBattleFacilityStringOnCard: @ 0x080C34E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r7, _080C353C
	ldr r3, [r7]
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	beq _080C3574
	ldr r6, _080C3540
	ldrb r1, [r6, #1]
	ldr r2, _080C3544
	ldr r4, _080C3548
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _080C354C
	str r0, [sp]
	movs r5, #1
	rsbs r5, r5, #0
	str r5, [sp, #4]
	ldr r0, _080C3550
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x43
	bl AddTextPrinterParameterized3
	ldr r2, [r7]
	adds r4, r2, r4
	ldrb r0, [r4]
	cmp r0, #0
	beq _080C355C
	ldrb r1, [r6]
	ldr r0, _080C3554
	str r0, [sp]
	str r5, [sp, #4]
	ldr r3, _080C3558
	adds r0, r2, r3
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0xa8
	movs r3, #0x43
	bl AddTextPrinterParameterized3
	b _080C3574
	.align 2, 0
_080C353C: .4byte 0x02039988
_080C3540: .4byte 0x08546775
_080C3544: .4byte 0x085467C1
_080C3548: .4byte 0x00000517
_080C354C: .4byte 0x0854676C
_080C3550: .4byte 0x085CC383
_080C3554: .4byte 0x0854676F
_080C3558: .4byte 0x00000223
_080C355C:
	ldrb r1, [r6]
	ldr r0, _080C357C
	str r0, [sp]
	str r5, [sp, #4]
	ldr r3, _080C3580
	adds r0, r2, r3
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0xa0
	movs r3, #0x43
	bl AddTextPrinterParameterized3
_080C3574:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C357C: .4byte 0x0854676F
_080C3580: .4byte 0x00000223
	thumb_func_end PrintBattleFacilityStringOnCard

	thumb_func_start PrintUnionNumOnCard
PrintUnionNumOnCard: @ 0x080C3584
	push {lr}
	ldr r0, _080C35B0
	ldr r2, [r0]
	ldr r1, _080C35B4
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C35AA
	ldr r3, _080C35B8
	adds r0, r2, r3
	ldr r1, [r0]
	cmp r1, #0
	beq _080C35AA
	ldr r3, _080C35BC
	adds r0, r2, r3
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
_080C35AA:
	pop {r0}
	bx r0
	.align 2, 0
_080C35B0: .4byte 0x02039988
_080C35B4: .4byte 0x00000516
_080C35B8: .4byte 0x0000055C
_080C35BC: .4byte 0x000002AF
	thumb_func_end PrintUnionNumOnCard

	thumb_func_start PrintBerryCrushStringOnCard
PrintBerryCrushStringOnCard: @ 0x080C35C0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _080C3624
	ldr r3, [r6]
	ldr r1, _080C3628
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C361C
	ldr r2, _080C362C
	adds r0, r3, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080C361C
	ldr r5, _080C3630
	ldrb r1, [r5, #1]
	ldr r2, _080C3634
	ldr r4, _080C3638
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _080C363C
	str r0, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C3640
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x63
	bl AddTextPrinterParameterized3
	ldrb r1, [r5]
	ldr r0, _080C3644
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r6]
	ldr r2, _080C3648
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x72
	movs r3, #0x63
	bl AddTextPrinterParameterized3
_080C361C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3624: .4byte 0x02039988
_080C3628: .4byte 0x00000516
_080C362C: .4byte 0x0000055C
_080C3630: .4byte 0x08546775
_080C3634: .4byte 0x085467C1
_080C3638: .4byte 0x00000517
_080C363C: .4byte 0x0854676C
_080C3640: .4byte 0x085CC39E
_080C3644: .4byte 0x0854676F
_080C3648: .4byte 0x000002AF
	thumb_func_end PrintBerryCrushStringOnCard

	thumb_func_start PrintBerryCrushNumOnCard
PrintBerryCrushNumOnCard: @ 0x080C364C
	push {lr}
	ldr r0, _080C3678
	ldr r2, [r0]
	ldr r1, _080C367C
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C3674
	movs r3, #0xac
	lsls r3, r3, #3
	adds r0, r2, r3
	ldr r1, [r0]
	cmp r1, #0
	beq _080C3674
	ldr r3, _080C3680
	adds r0, r2, r3
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
_080C3674:
	pop {r0}
	bx r0
	.align 2, 0
_080C3678: .4byte 0x02039988
_080C367C: .4byte 0x00000516
_080C3680: .4byte 0x0000033B
	thumb_func_end PrintBerryCrushNumOnCard

	thumb_func_start PrintUnionStringOnCard
PrintUnionStringOnCard: @ 0x080C3684
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _080C36EC
	ldr r3, [r6]
	ldr r1, _080C36F0
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C36E2
	movs r2, #0xac
	lsls r2, r2, #3
	adds r0, r3, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080C36E2
	ldr r5, _080C36F4
	ldrb r1, [r5, #1]
	ldr r2, _080C36F8
	ldr r4, _080C36FC
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _080C3700
	str r0, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C3704
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x53
	bl AddTextPrinterParameterized3
	ldrb r1, [r5]
	ldr r0, _080C3708
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r6]
	ldr r2, _080C370C
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0xa0
	movs r3, #0x53
	bl AddTextPrinterParameterized3
_080C36E2:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C36EC: .4byte 0x02039988
_080C36F0: .4byte 0x00000516
_080C36F4: .4byte 0x08546775
_080C36F8: .4byte 0x085467C1
_080C36FC: .4byte 0x00000517
_080C3700: .4byte 0x0854676C
_080C3704: .4byte 0x085CC390
_080C3708: .4byte 0x0854676F
_080C370C: .4byte 0x0000033B
	thumb_func_end PrintUnionStringOnCard

	thumb_func_start PrintPokeblocksNumOnCard
PrintPokeblocksNumOnCard: @ 0x080C3710
	push {r4, lr}
	ldr r4, _080C3748
	ldr r1, [r4]
	ldr r2, _080C374C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3742
	ldr r0, _080C3750
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080C3742
	ldr r0, _080C3754
	ldrh r1, [r1]
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _080C3758
	adds r0, r0, r1
	ldr r1, _080C375C
	bl StringExpandPlaceholders
_080C3742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3748: .4byte 0x02039988
_080C374C: .4byte 0x00000516
_080C3750: .4byte 0x0000053E
_080C3754: .4byte 0x02021C40
_080C3758: .4byte 0x00000381
_080C375C: .4byte 0x085CC3CF
	thumb_func_end PrintPokeblocksNumOnCard

	thumb_func_start PrintContestStringOnCard
PrintContestStringOnCard: @ 0x080C3760
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _080C37C4
	ldr r3, [r6]
	ldr r1, _080C37C8
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C37BC
	ldr r2, _080C37CC
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C37BC
	ldr r5, _080C37D0
	ldrb r1, [r5, #1]
	ldr r2, _080C37D4
	ldr r4, _080C37D8
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _080C37DC
	str r0, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C37E0
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x53
	bl AddTextPrinterParameterized3
	ldrb r1, [r5]
	ldr r0, _080C37E4
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r6]
	ldr r2, _080C37E8
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0xa8
	movs r3, #0x53
	bl AddTextPrinterParameterized3
_080C37BC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C37C4: .4byte 0x02039988
_080C37C8: .4byte 0x00000516
_080C37CC: .4byte 0x0000053E
_080C37D0: .4byte 0x08546775
_080C37D4: .4byte 0x085467C1
_080C37D8: .4byte 0x00000517
_080C37DC: .4byte 0x0854676C
_080C37E0: .4byte 0x085CC3BF
_080C37E4: .4byte 0x0854676F
_080C37E8: .4byte 0x00000381
	thumb_func_end PrintContestStringOnCard

	thumb_func_start PrintContestNumOnCard
PrintContestNumOnCard: @ 0x080C37EC
	push {lr}
	ldr r0, _080C3818
	ldr r1, [r0]
	ldr r2, _080C381C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3814
	ldr r3, _080C3820
	adds r2, r1, r3
	ldrh r0, [r2]
	cmp r0, #0
	beq _080C3814
	ldr r3, _080C3824
	adds r0, r1, r3
	ldrh r1, [r2]
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
_080C3814:
	pop {r0}
	bx r0
	.align 2, 0
_080C3818: .4byte 0x02039988
_080C381C: .4byte 0x00000516
_080C3820: .4byte 0x0000053C
_080C3824: .4byte 0x000003C7
	thumb_func_end PrintContestNumOnCard

	thumb_func_start PrintPokeblockStringOnCard
PrintPokeblockStringOnCard: @ 0x080C3828
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _080C388C
	ldr r3, [r6]
	ldr r1, _080C3890
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3884
	ldr r2, _080C3894
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C3884
	ldr r5, _080C3898
	ldrb r1, [r5, #1]
	ldr r2, _080C389C
	ldr r4, _080C38A0
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _080C38A4
	str r0, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C38A8
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x63
	bl AddTextPrinterParameterized3
	ldrb r1, [r5]
	ldr r0, _080C38AC
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r6]
	ldr r2, _080C38B0
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0xa8
	movs r3, #0x63
	bl AddTextPrinterParameterized3
_080C3884:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C388C: .4byte 0x02039988
_080C3890: .4byte 0x00000516
_080C3894: .4byte 0x0000053C
_080C3898: .4byte 0x08546775
_080C389C: .4byte 0x085467C1
_080C38A0: .4byte 0x00000517
_080C38A4: .4byte 0x0854676C
_080C38A8: .4byte 0x085CC3D9
_080C38AC: .4byte 0x0854676F
_080C38B0: .4byte 0x000003C7
	thumb_func_end PrintPokeblockStringOnCard

	thumb_func_start PrintBattleFacilityNumsOnCard
PrintBattleFacilityNumsOnCard: @ 0x080C38B4
	push {r4, lr}
	ldr r4, _080C38D0
	ldr r1, [r4]
	ldr r2, _080C38D4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C38D8
	cmp r0, #1
	ble _080C3946
	cmp r0, #2
	beq _080C3924
	b _080C3946
	.align 2, 0
_080C38D0: .4byte 0x02039988
_080C38D4: .4byte 0x00000516
_080C38D8:
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _080C3946
	ldr r0, _080C3910
	movs r2, #0xa7
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r0, _080C3914
	ldr r1, [r4]
	ldr r2, _080C3918
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #1
	movs r3, #4
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _080C391C
	adds r0, r0, r1
	ldr r1, _080C3920
	bl StringExpandPlaceholders
	b _080C3946
	.align 2, 0
_080C3910: .4byte 0x02021C40
_080C3914: .4byte 0x02021C54
_080C3918: .4byte 0x0000053A
_080C391C: .4byte 0x0000040D
_080C3920: .4byte 0x085CC418
_080C3924:
	ldr r2, _080C394C
	adds r1, r1, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _080C3946
	ldr r0, _080C3950
	ldrh r1, [r1]
	movs r2, #1
	movs r3, #5
	bl ConvertIntToDecimalStringN
	ldr r0, [r4]
	ldr r1, _080C3954
	adds r0, r0, r1
	ldr r1, _080C3958
	bl StringExpandPlaceholders
_080C3946:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C394C: .4byte 0x00000582
_080C3950: .4byte 0x02021C40
_080C3954: .4byte 0x0000040D
_080C3958: .4byte 0x085CC3F8
	thumb_func_end PrintBattleFacilityNumsOnCard

	thumb_func_start sub_080C395C
sub_080C395C: @ 0x080C395C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r7, _080C397C
	ldr r3, [r7]
	ldr r1, _080C3980
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C3984
	cmp r0, #1
	ble _080C3A42
	cmp r0, #2
	beq _080C39F8
	b _080C3A42
	.align 2, 0
_080C397C: .4byte 0x02039988
_080C3980: .4byte 0x00000516
_080C3984:
	ldrb r0, [r3, #0xd]
	cmp r0, #0
	beq _080C3A42
	ldr r5, _080C39DC
	ldrb r1, [r5, #1]
	ldr r2, _080C39E0
	mov r8, r2
	ldr r4, _080C39E4
	adds r0, r3, r4
	ldrb r0, [r0]
	add r0, r8
	ldrb r2, [r0]
	ldr r0, _080C39E8
	str r0, [sp]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [sp, #4]
	ldr r0, _080C39EC
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x73
	bl AddTextPrinterParameterized3
	ldrb r1, [r5]
	ldr r3, [r7]
	adds r4, r3, r4
	ldrb r0, [r4]
	add r0, r8
	ldrb r2, [r0]
	adds r2, #0x50
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _080C39F0
	str r0, [sp]
	str r6, [sp, #4]
	ldr r4, _080C39F4
	adds r3, r3, r4
	str r3, [sp, #8]
	movs r0, #1
	movs r3, #0x73
	bl AddTextPrinterParameterized3
	b _080C3A42
	.align 2, 0
_080C39DC: .4byte 0x08546775
_080C39E0: .4byte 0x085467C1
_080C39E4: .4byte 0x00000517
_080C39E8: .4byte 0x0854676C
_080C39EC: .4byte 0x085CC403
_080C39F0: .4byte 0x0854676F
_080C39F4: .4byte 0x0000040D
_080C39F8:
	ldr r1, _080C3A50
	adds r0, r3, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C3A42
	ldr r5, _080C3A54
	ldrb r1, [r5, #1]
	ldr r2, _080C3A58
	ldr r4, _080C3A5C
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _080C3A60
	str r0, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	ldr r0, _080C3A64
	str r0, [sp, #8]
	movs r0, #1
	movs r3, #0x73
	bl AddTextPrinterParameterized3
	ldrb r1, [r5]
	ldr r0, _080C3A68
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r7]
	ldr r2, _080C3A6C
	adds r0, r0, r2
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0xa0
	movs r3, #0x73
	bl AddTextPrinterParameterized3
_080C3A42:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3A50: .4byte 0x00000582
_080C3A54: .4byte 0x08546775
_080C3A58: .4byte 0x085467C1
_080C3A5C: .4byte 0x00000517
_080C3A60: .4byte 0x0854676C
_080C3A64: .4byte 0x085CC3EA
_080C3A68: .4byte 0x0854676F
_080C3A6C: .4byte 0x0000040D
	thumb_func_end sub_080C395C

	thumb_func_start TrainerCard_PrintPokemonIconsOnCard
TrainerCard_PrintPokemonIconsOnCard: @ 0x080C3A70
	push {r4, r5, lr}
	sub sp, #0x20
	ldr r1, _080C3AF8
	add r0, sp, #0x10
	movs r2, #6
	bl memcpy
	add r4, sp, #0x18
	ldr r1, _080C3AFC
	adds r0, r4, #0
	movs r2, #6
	bl memcpy
	ldr r0, _080C3B00
	ldr r0, [r0]
	ldr r1, _080C3B04
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r4, #0
	cmp r0, #0
	bne _080C3AEE
	movs r4, #0
_080C3A9C:
	ldr r0, _080C3B00
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _080C3B08
	adds r0, r0, r2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	beq _080C3AE4
	bl GetMonIconPaletteIndexFromSpecies
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #0x14
	movs r2, #0xe0
	lsls r2, r2, #0x10
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	adds r2, r5, r4
	ldrb r2, [r2]
	adds r2, #3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #4
	str r3, [sp]
	str r3, [sp, #4]
	add r0, sp
	adds r0, #0x10
	ldrb r0, [r0]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #3
	movs r3, #0xf
	bl WriteSequenceToBgTilemapBuffer
_080C3AE4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _080C3A9C
_080C3AEE:
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3AF8: .4byte 0x085467D0
_080C3AFC: .4byte 0x085467D6
_080C3B00: .4byte 0x02039988
_080C3B04: .4byte 0x00000516
_080C3B08: .4byte 0x00000574
	thumb_func_end TrainerCard_PrintPokemonIconsOnCard

	thumb_func_start sub_080C3B0C
sub_080C3B0C: @ 0x080C3B0C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _080C3B3C
	ldr r4, _080C3B40
	ldr r1, [r4]
	ldr r5, _080C3B44
	adds r1, r1, r5
	movs r2, #0x60
	bl CpuSet
	ldr r4, [r4]
	ldr r1, _080C3B48
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C3B4C
	cmp r0, #1
	ble _080C3B84
	cmp r0, #2
	beq _080C3B64
	cmp r0, #3
	beq _080C3B7C
	b _080C3B84
	.align 2, 0
_080C3B3C: .4byte 0x085567A4
_080C3B40: .4byte 0x02039988
_080C3B44: .4byte 0x00000454
_080C3B48: .4byte 0x0000056E
_080C3B4C:
	ldr r2, _080C3B60
	adds r0, r4, r2
	movs r1, #0
	str r1, [sp]
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl TintPalette_CustomTone
	b _080C3B84
	.align 2, 0
_080C3B60: .4byte 0x00000454
_080C3B64:
	adds r0, r4, r5
	movs r2, #0xfa
	lsls r2, r2, #1
	movs r3, #0xa5
	lsls r3, r3, #1
	movs r1, #0x9b
	lsls r1, r1, #1
	str r1, [sp]
	movs r1, #0x60
	bl TintPalette_CustomTone
	b _080C3B84
_080C3B7C:
	adds r0, r4, r5
	movs r1, #0x60
	bl TintPalette_SepiaTone
_080C3B84:
	ldr r0, _080C3BD8
	ldr r0, [r0]
	ldr r1, _080C3BDC
	adds r0, r0, r1
	movs r1, #0x50
	movs r2, #0xc0
	bl LoadPalette
	movs r4, #0
_080C3B96:
	ldr r0, _080C3BD8
	ldr r0, [r0]
	lsls r1, r4, #1
	ldr r2, _080C3BE0
	adds r0, r0, r2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	beq _080C3BC4
	movs r1, #0
	bl GetMonIconTiles
	adds r1, r0, #0
	lsls r3, r4, #0x14
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r3, r3, r0
	lsrs r3, r3, #0x10
	movs r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	bl LoadBgTiles
_080C3BC4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _080C3B96
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3BD8: .4byte 0x02039988
_080C3BDC: .4byte 0x00000454
_080C3BE0: .4byte 0x00000574
	thumb_func_end sub_080C3B0C

	thumb_func_start PrintNameOnCard2
PrintNameOnCard2: @ 0x080C3BE4
	push {r4, lr}
	sub sp, #0x14
	ldr r1, _080C3C60
	add r0, sp, #0x10
	movs r2, #4
	bl memcpy
	ldr r0, _080C3C64
	ldr r1, [r0]
	ldr r2, _080C3C68
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C3C58
	adds r2, #0x56
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _080C3C58
	movs r4, #0
_080C3C0C:
	ldr r0, _080C3C64
	ldr r0, [r0]
	movs r1, #0xae
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r3, [r0]
	cmp r3, #0
	beq _080C3C4E
	lsls r1, r4, #0x12
	movs r2, #0xa0
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	lsls r2, r4, #1
	adds r2, r2, r4
	adds r2, #2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, r3, #1
	add r0, sp
	adds r0, #0x10
	ldrb r0, [r0]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #3
	movs r3, #2
	bl WriteSequenceToBgTilemapBuffer
_080C3C4E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080C3C0C
_080C3C58:
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3C60: .4byte 0x085467DC
_080C3C64: .4byte 0x02039988
_080C3C68: .4byte 0x00000516
	thumb_func_end PrintNameOnCard2

	thumb_func_start sub_080C3C6C
sub_080C3C6C: @ 0x080C3C6C
	push {lr}
	ldr r0, _080C3CB0
	movs r1, #0xb0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _080C3CB4
	movs r1, #0xc0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _080C3CB8
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _080C3CBC
	movs r1, #0xe0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _080C3CC0
	ldr r1, [r0]
	ldr r0, _080C3CC4
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	movs r0, #3
	movs r3, #0x80
	bl LoadBgTiles
	pop {r0}
	bx r0
	.align 2, 0
_080C3CB0: .4byte 0x085461AC
_080C3CB4: .4byte 0x085461CC
_080C3CB8: .4byte 0x085461EC
_080C3CBC: .4byte 0x0854620C
_080C3CC0: .4byte 0x02039988
_080C3CC4: .4byte 0x00001794
	thumb_func_end sub_080C3C6C

	thumb_func_start PrintHofDebutStringOnCard
PrintHofDebutStringOnCard: @ 0x080C3CC8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl PutWindowTilemap
	adds r0, r4, #0
	movs r1, #3
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PrintHofDebutStringOnCard

	thumb_func_start SetCardBgsAndPals
SetCardBgsAndPals: @ 0x080C3CE4
	push {r4, lr}
	sub sp, #8
	ldr r0, _080C3D00
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	cmp r0, #4
	bls _080C3CF4
	b _080C3E66
_080C3CF4:
	lsls r0, r0, #2
	ldr r1, _080C3D04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C3D00: .4byte 0x02039988
_080C3D04: .4byte 0x080C3D08
_080C3D08: @ jump table
	.4byte _080C3D1C @ case 0
	.4byte _080C3D34 @ case 1
	.4byte _080C3D54 @ case 2
	.4byte _080C3E0C @ case 3
	.4byte _080C3E34 @ case 4
_080C3D1C:
	ldr r0, _080C3D2C
	ldr r1, [r0]
	ldr r0, _080C3D30
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	movs r0, #3
	b _080C3D42
	.align 2, 0
_080C3D2C: .4byte 0x02039988
_080C3D30: .4byte 0x00001394
_080C3D34:
	ldr r0, _080C3D4C
	ldr r1, [r0]
	ldr r3, _080C3D50
	adds r1, r1, r3
	movs r2, #0xc0
	lsls r2, r2, #5
	movs r0, #0
_080C3D42:
	movs r3, #0
	bl LoadBgTiles
	b _080C3E6A
	.align 2, 0
_080C3D4C: .4byte 0x02039988
_080C3D50: .4byte 0x00001994
_080C3D54:
	ldr r4, _080C3D9C
	ldr r2, [r4]
	ldr r1, _080C3DA0
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3DB4
	ldr r1, _080C3DA4
	ldr r3, _080C3DA8
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x60
	bl LoadPalette
	ldr r0, _080C3DAC
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
	ldr r0, [r4]
	movs r1, #0xa4
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3DEC
	ldr r0, _080C3DB0
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	b _080C3DEC
	.align 2, 0
_080C3D9C: .4byte 0x02039988
_080C3DA0: .4byte 0x00000516
_080C3DA4: .4byte 0x08546744
_080C3DA8: .4byte 0x00000521
_080C3DAC: .4byte 0x0854614C
_080C3DB0: .4byte 0x0854610C
_080C3DB4:
	ldr r1, _080C3DF8
	ldr r3, _080C3DFC
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x60
	bl LoadPalette
	ldr r0, _080C3E00
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
	ldr r0, [r4]
	movs r1, #0xa4
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3DEC
	ldr r0, _080C3E04
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
_080C3DEC:
	ldr r0, _080C3E08
	movs r1, #0x40
	movs r2, #0x20
	bl LoadPalette
	b _080C3E6A
	.align 2, 0
_080C3DF8: .4byte 0x08546758
_080C3DFC: .4byte 0x00000521
_080C3E00: .4byte 0x0854616C
_080C3E04: .4byte 0x0854612C
_080C3E08: .4byte 0x0854618C
_080C3E0C:
	ldr r4, _080C3E28
	ldr r1, [r4]
	ldr r3, _080C3E2C
	adds r1, r1, r3
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _080C3E30
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	b _080C3E6A
	.align 2, 0
_080C3E28: .4byte 0x02039988
_080C3E2C: .4byte 0x00003C94
_080C3E30: .4byte 0x00005C94
_080C3E34:
	movs r4, #0x20
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
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
_080C3E66:
	movs r0, #1
	b _080C3E76
_080C3E6A:
	ldr r0, _080C3E80
	ldr r1, [r0]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0
_080C3E76:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C3E80: .4byte 0x02039988
	thumb_func_end SetCardBgsAndPals

	thumb_func_start sub_080C3E84
sub_080C3E84: @ 0x080C3E84
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _080C3EBC
	ldr r0, [r0]
	ldr r1, _080C3EC0
	adds r6, r0, r1
	movs r1, #0
_080C3E92:
	movs r2, #0
	lsls r5, r1, #0x10
	asrs r1, r5, #0x10
	lsls r3, r1, #5
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r4, r0, #1
_080C3EA0:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r2, r0, #0
	cmp r1, #0x1d
	bgt _080C3EC4
	adds r0, r3, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	adds r1, r4, r1
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	b _080C3ECC
	.align 2, 0
_080C3EBC: .4byte 0x02039988
_080C3EC0: .4byte 0x00005C94
_080C3EC4:
	adds r0, r3, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r7]
_080C3ECC:
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r2, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080C3EA0
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _080C3E92
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C3E84

	thumb_func_start sub_080C3EF4
sub_080C3EF4: @ 0x080C3EF4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _080C3F2C
	ldr r0, [r0]
	ldr r1, _080C3F30
	adds r6, r0, r1
	movs r1, #0
_080C3F02:
	movs r2, #0
	lsls r5, r1, #0x10
	asrs r1, r5, #0x10
	lsls r3, r1, #5
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r4, r0, #1
_080C3F10:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r2, r0, #0
	cmp r1, #0x1d
	bgt _080C3F34
	adds r0, r3, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	adds r1, r4, r1
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	b _080C3F3C
	.align 2, 0
_080C3F2C: .4byte 0x02039988
_080C3F30: .4byte 0x00003C94
_080C3F34:
	adds r0, r3, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r7]
_080C3F3C:
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r2, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080C3F10
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _080C3F02
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080C3EF4

	thumb_func_start TrainerCard_PrintStarsAndBadgesOnCard
TrainerCard_PrintStarsAndBadgesOnCard: @ 0x080C3F64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0xc0
	mov r8, r0
	movs r2, #3
	mov sl, r2
	ldr r2, _080C4070
	ldr r4, _080C4074
	ldr r1, [r4]
	ldr r3, _080C4078
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r3, [r0]
	ldr r0, _080C407C
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0x8f
	movs r2, #0xf
	bl FillBgTilemapBufferRect
	ldr r0, [r4]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _080C4058
	movs r2, #4
	mov sb, r2
	movs r2, #0
	movs r6, #1
_080C3FB2:
	ldr r0, _080C4074
	ldr r1, [r0]
	lsls r0, r2, #0x10
	asrs r7, r0, #0x10
	adds r1, #0x11
	adds r1, r1, r7
	ldrb r0, [r1]
	cmp r0, #0
	beq _080C4034
	mov r3, sb
	lsls r5, r3, #0x18
	lsrs r5, r5, #0x18
	str r6, [sp]
	str r6, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	movs r0, #3
	mov r1, r8
	adds r2, r5, #0
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r4, sb
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r6, [sp]
	str r6, [sp, #4]
	mov r2, sl
	str r2, [sp, #8]
	movs r0, #3
	adds r2, r4, #0
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r6, [sp]
	str r6, [sp, #4]
	mov r3, sl
	str r3, [sp, #8]
	movs r0, #3
	adds r2, r5, #0
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	mov r1, r8
	adds r1, #0x11
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r6, [sp]
	str r6, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r4, #0
	movs r3, #0x10
	bl FillBgTilemapBufferRect
_080C4034:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	mov r1, r8
	adds r1, #2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	mov r2, sb
	lsls r1, r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #0xa
	adds r1, r1, r3
	lsrs r1, r1, #0x10
	mov sb, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080C3FB2
_080C4058:
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4070: .4byte 0x085467E0
_080C4074: .4byte 0x02039988
_080C4078: .4byte 0x00000517
_080C407C: .4byte 0x00000521
	thumb_func_end TrainerCard_PrintStarsAndBadgesOnCard

	thumb_func_start sub_080C4080
sub_080C4080: @ 0x080C4080
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _080C4128
	ldr r1, [r6]
	ldr r2, _080C412C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080C4134
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _080C40BE
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r1, #0x8d
	movs r2, #0x1b
	movs r3, #9
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r1, #0x9d
	movs r2, #0x1b
	movs r3, #0xa
	bl FillBgTilemapBufferRect
_080C40BE:
	ldr r0, [r6]
	ldr r1, _080C4130
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080C40F0
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r1, #0x8d
	movs r2, #0x15
	movs r3, #0xd
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r1, #0x9d
	movs r2, #0x15
	movs r3, #0xe
	bl FillBgTilemapBufferRect
_080C40F0:
	ldr r0, [r6]
	movs r2, #0xac
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080C41EA
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r1, #0x8d
	movs r2, #0x1b
	movs r3, #0xb
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r1, #0x9d
	movs r2, #0x1b
	movs r3, #0xc
	bl FillBgTilemapBufferRect
	b _080C41EA
	.align 2, 0
_080C4128: .4byte 0x02039988
_080C412C: .4byte 0x00000516
_080C4130: .4byte 0x0000055C
_080C4134:
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _080C4162
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0x8d
	movs r2, #0x1b
	movs r3, #9
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0x9d
	movs r2, #0x1b
	movs r3, #0xa
	bl FillBgTilemapBufferRect
_080C4162:
	ldr r0, [r6]
	ldr r1, _080C41F8
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080C4196
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0x8d
	movs r2, #0x1b
	movs r3, #0xd
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0x9d
	movs r2, #0x1b
	movs r3, #0xe
	bl FillBgTilemapBufferRect
_080C4196:
	ldr r0, [r6]
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080C41EA
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0x8d
	movs r2, #0x11
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0x9d
	movs r2, #0x11
	movs r3, #0x10
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0x8c
	movs r2, #0x1b
	movs r3, #0xf
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0x9c
	movs r2, #0x1b
	movs r3, #0x10
	bl FillBgTilemapBufferRect
_080C41EA:
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C41F8: .4byte 0x0000053C
	thumb_func_end sub_080C4080

	thumb_func_start sub_080C41FC
sub_080C41FC: @ 0x080C41FC
	push {lr}
	ldr r3, _080C4230
	ldr r1, [r3]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bls _080C422A
	ldr r1, [r3]
	movs r0, #0
	strb r0, [r1, #6]
	ldr r2, [r3]
	ldrb r0, [r2, #7]
	movs r1, #1
	eors r0, r1
	strb r0, [r2, #7]
	ldr r0, [r3]
	ldr r1, _080C4234
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
_080C422A:
	pop {r0}
	bx r0
	.align 2, 0
_080C4230: .4byte 0x02039988
_080C4234: .4byte 0x00000515
	thumb_func_end sub_080C41FC

	thumb_func_start GetTrainerCardStars
GetTrainerCardStars: @ 0x080C4238
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080C4248
	movs r1, #0x64
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_080C4248: .4byte 0x020397F8
	thumb_func_end GetTrainerCardStars

	thumb_func_start sub_080C424C
sub_080C424C: @ 0x080C424C
	push {r4, lr}
	ldr r4, _080C426C
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	ldr r0, _080C4270
	bl SetHBlankCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C426C: .4byte 0x080C4295
_080C4270: .4byte 0x080C1D01
	thumb_func_end sub_080C424C

	thumb_func_start sub_080C4274
sub_080C4274: @ 0x080C4274
	push {lr}
	ldr r0, _080C4288
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _080C428C
	movs r0, #0
	b _080C428E
	.align 2, 0
_080C4288: .4byte 0x080C4295
_080C428C:
	movs r0, #1
_080C428E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080C4274

	thumb_func_start sub_080C4294
sub_080C4294: @ 0x080C4294
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _080C42C4
	ldr r2, _080C42C8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
_080C42A6:
	movs r1, #8
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C42A6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C42C4: .4byte 0x08546788
_080C42C8: .4byte 0x03005B60
	thumb_func_end sub_080C4294

	thumb_func_start sub_080C42CC
sub_080C42CC: @ 0x080C42CC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl HideBg
	movs r0, #3
	bl HideBg
	bl ScanlineEffect_Stop
	bl ScanlineEffect_Clear
	movs r1, #0
	ldr r0, _080C4308
	movs r2, #0
	movs r3, #0xf0
	lsls r3, r3, #3
	adds r0, r0, r3
_080C42F0:
	strh r2, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _080C42F0
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C4308: .4byte 0x020388C8
	thumb_func_end sub_080C42CC

	thumb_func_start sub_080C430C
sub_080C430C: @ 0x080C430C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _080C4338
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
	mov r0, r8
	ldrh r1, [r0, #0xa]
	movs r2, #0xa
	ldrsh r0, [r0, r2]
	cmp r0, #0x4c
	ble _080C433C
	movs r0, #0x4d
	mov r3, r8
	strh r0, [r3, #0xa]
	b _080C4342
	.align 2, 0
_080C4338: .4byte 0x02039988
_080C433C:
	adds r0, r1, #7
	mov r4, r8
	strh r0, [r4, #0xa]
_080C4342:
	ldr r0, _080C442C
	ldr r0, [r0]
	mov r2, r8
	ldrh r1, [r2, #0xa]
	ldr r3, _080C4430
	adds r0, r0, r3
	strh r1, [r0]
	ldrh r0, [r2, #0xa]
	bl sub_080C2918
	mov r4, r8
	movs r0, #0xa
	ldrsh r7, [r4, r0]
	movs r0, #0xa0
	subs r0, r0, r7
	mov sb, r0
	subs r4, r0, r7
	rsbs r0, r7, #0
	lsls r6, r0, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __udivsi3
	adds r5, r0, #0
	ldr r1, _080C4434
	adds r5, r5, r1
	adds r0, r5, #0
	muls r0, r4, r0
	adds r0, r6, r0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	bl __udivsi3
	mov sl, r0
	lsls r5, r5, #1
	movs r2, #0
	cmp r2, r7
	bhs _080C43AC
	ldr r3, _080C4438
_080C4394:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r3
	rsbs r2, r0, #0
	strh r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r7
	blo _080C4394
_080C43AC:
	lsls r1, r2, #0x10
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	ldr r4, _080C442C
	mov sb, r4
	ldr r4, [sp]
	lsrs r7, r4, #0x10
	cmp r1, r0
	bge _080C43E4
	ldr r0, _080C4438
	mov ip, r0
	adds r4, r3, #0
_080C43C6:
	lsrs r3, r6, #0x10
	adds r6, r6, r5
	mov r2, sl
	subs r5, r5, r2
	asrs r0, r1, #0x10
	lsls r1, r0, #1
	add r1, ip
	strh r3, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, r4
	blt _080C43C6
_080C43E4:
	adds r3, r7, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	bgt _080C4402
	ldr r2, _080C4438
_080C43F0:
	asrs r0, r1, #0x10
	lsls r1, r0, #1
	adds r1, r1, r2
	strh r3, [r1]
	adds r0, #1
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	ble _080C43F0
_080C4402:
	mov r3, sb
	ldr r0, [r3]
	movs r1, #1
	strb r1, [r0, #9]
	mov r4, r8
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0x4c
	ble _080C441A
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080C441A:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C442C: .4byte 0x02039988
_080C4430: .4byte 0x00007C94
_080C4434: .4byte 0xFFFF0000
_080C4438: .4byte 0x020388C8
	thumb_func_end sub_080C430C

	thumb_func_start sub_080C443C
sub_080C443C: @ 0x080C443C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _080C4468
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #9]
	bl sub_08086EFC
	adds r2, r4, #0
	cmp r0, #1
	beq _080C453C
_080C4454:
	ldr r3, [r2]
	ldrb r0, [r3, #4]
	cmp r0, #4
	bhi _080C4518
	lsls r0, r0, #2
	ldr r1, _080C446C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4468: .4byte 0x02039988
_080C446C: .4byte 0x080C4470
_080C4470: @ jump table
	.4byte _080C4484 @ case 0
	.4byte _080C44A0 @ case 1
	.4byte _080C44C0 @ case 2
	.4byte _080C44E4 @ case 3
	.4byte _080C4502 @ case 4
_080C4484:
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	b _080C452A
_080C44A0:
	ldr r0, [r2]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080C44B4
	bl PrintStringsOnCardPage2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C452A
	b _080C453C
_080C44B4:
	bl PrintAllOnCardPage1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C452A
	b _080C453C
_080C44C0:
	ldr r0, _080C44D4
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	bne _080C44DC
	ldr r2, _080C44D8
	adds r0, r1, r2
	bl sub_080C3EF4
	b _080C452A
	.align 2, 0
_080C44D4: .4byte 0x02039988
_080C44D8: .4byte 0x00000A34
_080C44DC:
	movs r0, #1
	bl PrintHofDebutStringOnCard
	b _080C452A
_080C44E4:
	ldr r0, _080C44F4
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080C44F8
	bl sub_080C4080
	b _080C452A
	.align 2, 0
_080C44F4: .4byte 0x02039988
_080C44F8:
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	b _080C452A
_080C4502:
	ldr r0, _080C4514
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _080C452A
	bl sub_080C48F4
	b _080C452A
	.align 2, 0
_080C4514: .4byte 0x02039988
_080C4518:
	ldrh r0, [r5, #8]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #8]
	movs r0, #1
	strb r0, [r3, #9]
	ldr r0, [r2]
	strb r1, [r0, #4]
	b _080C453C
_080C452A:
	ldr r2, _080C4548
	ldr r1, [r2]
	ldrb r0, [r1, #4]
	adds r0, #1
	strb r0, [r1, #4]
	ldr r0, _080C454C
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C4454
_080C453C:
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C4548: .4byte 0x02039988
_080C454C: .4byte 0x030031C4
	thumb_func_end sub_080C443C

	thumb_func_start sub_080C4550
sub_080C4550: @ 0x080C4550
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080C45AC
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #9]
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _080C4582
	movs r0, #2
	bl PrintHofDebutStringOnCard
	ldr r0, [r4]
	ldr r1, _080C45B0
	adds r0, r0, r1
	bl sub_080C3E84
	ldr r0, [r4]
	ldr r1, _080C45B4
	adds r0, r0, r1
	bl sub_080C3EF4
	bl TrainerCard_PrintStarsAndBadgesOnCard
_080C4582:
	movs r0, #1
	bl PrintHofDebutStringOnCard
	ldr r2, [r4]
	ldrb r0, [r2, #8]
	movs r1, #1
	eors r0, r1
	strb r0, [r2, #8]
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #9]
	movs r0, #0xfa
	bl PlaySE
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C45AC: .4byte 0x02039988
_080C45B0: .4byte 0x00000EE4
_080C45B4: .4byte 0x00000584
	thumb_func_end sub_080C4550

	thumb_func_start sub_080C45B8
sub_080C45B8: @ 0x080C45B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _080C45E0
	ldr r0, [r0]
	movs r2, #0
	strb r2, [r0, #9]
	mov r0, r8
	ldrh r1, [r0, #0xa]
	movs r3, #0xa
	ldrsh r0, [r0, r3]
	cmp r0, #5
	bgt _080C45E4
	mov r4, r8
	strh r2, [r4, #0xa]
	b _080C45EA
	.align 2, 0
_080C45E0: .4byte 0x02039988
_080C45E4:
	subs r0, r1, #5
	mov r1, r8
	strh r0, [r1, #0xa]
_080C45EA:
	ldr r0, _080C46D4
	ldr r0, [r0]
	mov r2, r8
	ldrh r1, [r2, #0xa]
	ldr r3, _080C46D8
	adds r0, r0, r3
	strh r1, [r0]
	ldrh r0, [r2, #0xa]
	bl sub_080C2918
	mov r4, r8
	movs r0, #0xa
	ldrsh r7, [r4, r0]
	movs r0, #0xa0
	subs r0, r0, r7
	mov sb, r0
	subs r4, r0, r7
	rsbs r0, r7, #0
	lsls r6, r0, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __udivsi3
	adds r5, r0, #0
	ldr r1, _080C46DC
	adds r5, r5, r1
	adds r0, r5, #0
	muls r0, r4, r0
	adds r0, r6, r0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	bl __udivsi3
	mov sl, r0
	lsrs r5, r5, #1
	movs r2, #0
	cmp r2, r7
	bhs _080C4654
	ldr r3, _080C46E0
_080C463C:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r3
	rsbs r2, r0, #0
	strh r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r7
	blo _080C463C
_080C4654:
	lsls r1, r2, #0x10
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	ldr r4, _080C46D4
	mov sb, r4
	ldr r4, [sp]
	lsrs r7, r4, #0x10
	cmp r1, r0
	bge _080C468A
	ldr r0, _080C46E0
	mov ip, r0
	adds r4, r3, #0
_080C466E:
	lsrs r3, r6, #0x10
	adds r6, r6, r5
	add r5, sl
	asrs r0, r1, #0x10
	lsls r1, r0, #1
	add r1, ip
	strh r3, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, r4
	blt _080C466E
_080C468A:
	adds r3, r7, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	bgt _080C46A8
	ldr r2, _080C46E0
_080C4696:
	asrs r0, r1, #0x10
	lsls r1, r0, #1
	adds r1, r1, r2
	strh r3, [r1]
	adds r0, #1
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	ble _080C4696
_080C46A8:
	mov r1, sb
	ldr r0, [r1]
	movs r1, #1
	strb r1, [r0, #9]
	mov r2, r8
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bgt _080C46C0
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_080C46C0:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C46D4: .4byte 0x02039988
_080C46D8: .4byte 0x00007C94
_080C46DC: .4byte 0xFFFF0000
_080C46E0: .4byte 0x020388C8
	thumb_func_end sub_080C45B8

	thumb_func_start sub_080C46E4
sub_080C46E4: @ 0x080C46E4
	push {lr}
	movs r0, #1
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #0
	bl SetHBlankCallback
	ldr r0, _080C470C
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080C470C: .4byte 0x080C4295
	thumb_func_end sub_080C46E4

	thumb_func_start ShowPlayerTrainerCard
ShowPlayerTrainerCard: @ 0x080C4710
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080C4738
	ldr r0, _080C473C
	bl AllocZeroed
	adds r1, r0, #0
	str r1, [r4]
	ldr r2, _080C4740
	adds r0, r1, r2
	str r5, [r0]
	ldr r0, _080C4744
	cmp r5, r0
	bne _080C474C
	movs r0, #0xa3
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _080C4748
	b _080C4754
	.align 2, 0
_080C4738: .4byte 0x02039988
_080C473C: .4byte 0x00007C98
_080C4740: .4byte 0x0000051C
_080C4744: .4byte 0x080C5165
_080C4748: .4byte 0x00007FFF
_080C474C:
	movs r2, #0xa3
	lsls r2, r2, #3
	adds r1, r1, r2
	movs r0, #0
_080C4754:
	strh r0, [r1]
	bl InUnionRoom
	adds r3, r0, #0
	cmp r3, #1
	bne _080C476C
	ldr r1, _080C4768
	ldr r0, [r1]
	strb r3, [r0, #5]
	b _080C4776
	.align 2, 0
_080C4768: .4byte 0x02039988
_080C476C:
	ldr r2, _080C4790
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #5]
	adds r1, r2, #0
_080C4776:
	ldr r0, [r1]
	movs r1, #0xa4
	lsls r1, r1, #3
	adds r0, r0, r1
	bl TrainerCard_GenerateCardForLinkPlayer
	ldr r0, _080C4794
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4790: .4byte 0x02039988
_080C4794: .4byte 0x080C22B5
	thumb_func_end ShowPlayerTrainerCard

	thumb_func_start ShowTrainerCardInLink
ShowTrainerCardInLink: @ 0x080C4798
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080C47D8
	ldr r0, _080C47DC
	bl AllocZeroed
	str r0, [r5]
	ldr r2, _080C47E0
	adds r1, r0, r2
	str r6, [r1]
	movs r1, #1
	strb r1, [r0, #5]
	ldr r0, [r5]
	movs r1, #0xa4
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r2, _080C47E4
	movs r1, #0x64
	muls r1, r4, r1
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	ldr r0, _080C47E8
	bl SetMainCallback2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C47D8: .4byte 0x02039988
_080C47DC: .4byte 0x00007C98
_080C47E0: .4byte 0x0000051C
_080C47E4: .4byte 0x020397F8
_080C47E8: .4byte 0x080C22B5
	thumb_func_end ShowTrainerCardInLink

	thumb_func_start sub_080C47EC
sub_080C47EC: @ 0x080C47EC
	push {r4, r5, lr}
	ldr r4, _080C4848
	ldr r0, [r4]
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r4]
	ldr r0, _080C484C
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	strb r0, [r2, #6]
	ldr r0, [r4]
	strb r1, [r0, #7]
	ldr r0, [r4]
	strb r1, [r0, #8]
	ldr r0, [r4]
	ldr r2, _080C4850
	adds r0, r0, r2
	strb r1, [r0]
	bl GetSetCardType
	ldr r1, [r4]
	ldr r3, _080C4854
	adds r1, r1, r3
	strb r0, [r1]
	movs r5, #0
_080C481E:
	lsls r0, r5, #3
	adds r0, #0x19
	ldr r1, [r4]
	adds r0, r1, r0
	lsls r2, r5, #1
	movs r3, #0xa9
	lsls r3, r3, #3
	adds r1, r1, r3
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CopyEasyChatWord
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _080C481E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4848: .4byte 0x02039988
_080C484C: .4byte 0x03005AF0
_080C4850: .4byte 0x00000514
_080C4854: .4byte 0x00000516
	thumb_func_end sub_080C47EC

	thumb_func_start GetSetCardType
GetSetCardType: @ 0x080C4858
	push {lr}
	ldr r0, _080C4874
	ldr r1, [r0]
	cmp r1, #0
	bne _080C4884
	ldr r0, _080C4878
	ldrb r1, [r0]
	subs r0, r1, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080C487C
	movs r0, #0
	b _080C48C6
	.align 2, 0
_080C4874: .4byte 0x02039988
_080C4878: .4byte 0x0829BDA4
_080C487C:
	cmp r1, #3
	beq _080C48C4
	movs r0, #1
	b _080C48C6
_080C4884:
	movs r2, #0xab
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r2, [r0]
	subs r0, r2, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080C48A4
	ldr r0, _080C48A0
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	b _080C48C6
	.align 2, 0
_080C48A0: .4byte 0x00000517
_080C48A4:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _080C48BC
	ldr r2, _080C48B8
	adds r1, r1, r2
	movs r0, #1
	strb r0, [r1]
	b _080C48C6
	.align 2, 0
_080C48B8: .4byte 0x00000517
_080C48BC:
	ldr r0, _080C48CC
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_080C48C4:
	movs r0, #2
_080C48C6:
	pop {r1}
	bx r1
	.align 2, 0
_080C48CC: .4byte 0x00000517
	thumb_func_end GetSetCardType

	thumb_func_start VersionToCardType
VersionToCardType: @ 0x080C48D0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xfc
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080C48E6
	movs r0, #0
	b _080C48F0
_080C48E6:
	cmp r1, #3
	beq _080C48EE
	movs r0, #1
	b _080C48F0
_080C48EE:
	movs r0, #2
_080C48F0:
	pop {r1}
	bx r1
	thumb_func_end VersionToCardType

	thumb_func_start sub_080C48F4
sub_080C48F4: @ 0x080C48F4
	push {r4, r5, r6, lr}
	sub sp, #8
	bl InUnionRoom
	cmp r0, #1
	bne _080C4960
	ldr r0, _080C494C
	ldrb r0, [r0]
	cmp r0, #1
	bne _080C4960
	ldr r5, _080C4950
	ldr r0, [r5]
	ldr r1, _080C4954
	adds r0, r0, r1
	ldrb r0, [r0]
	bl FacilityClassToPicIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080C4958
	ldr r1, [r5]
	movs r3, #0xa4
	lsls r3, r3, #3
	adds r2, r1, r3
	ldrb r3, [r2]
	lsls r3, r3, #1
	ldr r2, _080C495C
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r3, r3, r1
	adds r1, r3, r4
	ldrb r2, [r1]
	adds r4, #1
	adds r3, r3, r4
	ldrb r3, [r3]
	movs r1, #8
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #1
	bl sub_0818D664
	b _080C49B0
	.align 2, 0
_080C494C: .4byte 0x030031C4
_080C4950: .4byte 0x02039988
_080C4954: .4byte 0x0000056F
_080C4958: .4byte 0x08546778
_080C495C: .4byte 0x00000517
_080C4960:
	ldr r2, _080C49B8
	ldr r6, _080C49BC
	ldr r0, [r6]
	movs r5, #0xa4
	lsls r5, r5, #3
	adds r1, r0, r5
	ldr r3, _080C49C0
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #1
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	bl FacilityClassToPicIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080C49C4
	ldr r1, [r6]
	adds r5, r1, r5
	ldrb r3, [r5]
	lsls r3, r3, #1
	ldr r2, _080C49C8
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r3, r3, r1
	adds r1, r3, r4
	ldrb r2, [r1]
	adds r4, #1
	adds r3, r3, r4
	ldrb r3, [r3]
	movs r1, #8
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #1
	bl sub_0818D664
_080C49B0:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C49B8: .4byte 0x08546780
_080C49BC: .4byte 0x02039988
_080C49C0: .4byte 0x00000516
_080C49C4: .4byte 0x08546778
_080C49C8: .4byte 0x00000517
	thumb_func_end sub_080C48F4

