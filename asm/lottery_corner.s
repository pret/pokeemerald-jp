.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetLotteryCorner
ResetLotteryCorner: @ 0x081773E4
	push {r4, lr}
	bl Random
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl Random
	lsls r0, r0, #0x10
	orrs r0, r4
	bl SetLotteryNumber
	ldr r0, _0817740C
	movs r1, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817740C: .4byte 0x00004045
	thumb_func_end ResetLotteryCorner

	thumb_func_start SetRandomLotteryNumber
SetRandomLotteryNumber: @ 0x08177410
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl Random
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0817744C
	cmp r4, r0
	beq _08177440
	ldr r5, _08177450
	ldr r3, _08177454
	adds r2, r0, #0
_08177430:
	adds r0, r1, #0
	muls r0, r5, r0
	adds r1, r0, r3
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r2
	bne _08177430
_08177440:
	adds r0, r1, #0
	bl SetLotteryNumber
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817744C: .4byte 0x0000FFFF
_08177450: .4byte 0x41C64E6D
_08177454: .4byte 0x00003039
	thumb_func_end SetRandomLotteryNumber

	thumb_func_start RetrieveLotteryNumber
RetrieveLotteryNumber: @ 0x08177458
	push {lr}
	bl GetLotteryNumber
	ldr r1, _08177468
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08177468: .4byte 0x02037290
	thumb_func_end RetrieveLotteryNumber

	thumb_func_start PickLotteryCornerTicket
PickLotteryCornerTicket: @ 0x0817746C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _081775A8
	movs r0, #0
	strh r0, [r1]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp]
	movs r7, #0
_08177488:
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _081775AC
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	cmp r0, #0
	beq _081774E4
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _081774DA
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	adds r1, r0, #0
	ldr r0, _081775B0
	ldrh r0, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl GetMatchingDigits
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081775A8
	ldrh r2, [r1]
	cmp r0, r2
	bls _081774DA
	cmp r0, #1
	bls _081774DA
	subs r0, #1
	strh r0, [r1]
	movs r0, #0xe
	str r0, [sp]
	str r7, [sp, #4]
_081774DA:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #5
	bls _08177488
_081774E4:
	movs r7, #0
	ldr r1, _081775B4
	mov sb, r1
_081774EA:
	movs r6, #0
	adds r2, r7, #1
	mov sl, r2
	lsls r0, r7, #2
	adds r0, r0, r7
	mov r8, r0
_081774F6:
	mov r1, r8
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r5, r0, #4
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r5
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r4, r1, #4
	adds r0, r0, r4
	movs r1, #0xb
	bl GetBoxMonData
	cmp r0, #0
	beq _0817755E
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #0x2d
	bl GetBoxMonData
	cmp r0, #0
	bne _0817755E
	mov r2, sb
	ldr r0, [r2]
	adds r0, r0, r5
	adds r0, r0, r4
	movs r1, #1
	bl GetBoxMonData
	adds r1, r0, #0
	ldr r0, _081775B0
	ldrh r0, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl GetMatchingDigits
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081775A8
	ldrh r2, [r1]
	cmp r0, r2
	bls _0817755E
	cmp r0, #1
	bls _0817755E
	subs r0, #1
	strh r0, [r1]
	str r7, [sp]
	str r6, [sp, #4]
_0817755E:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x1d
	bls _081774F6
	mov r1, sl
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0xd
	bls _081774EA
	ldr r3, _081775A8
	ldrh r0, [r3]
	cmp r0, #0
	beq _081775FA
	ldr r2, _081775B8
	ldr r1, _081775BC
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r2, [sp]
	cmp r2, #0xe
	bne _081775C8
	ldr r1, _081775C0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x64
	ldr r1, [sp, #4]
	muls r0, r1, r0
	ldr r1, _081775AC
	adds r0, r0, r1
	ldr r2, _081775C4
	movs r1, #2
	bl GetMonData
	b _081775F4
	.align 2, 0
_081775A8: .4byte 0x02037280
_081775AC: .4byte 0x02024190
_081775B0: .4byte 0x02037290
_081775B4: .4byte 0x03005AF4
_081775B8: .4byte 0x02037282
_081775BC: .4byte 0x085C7A2C
_081775C0: .4byte 0x02037284
_081775C4: .4byte 0x02021C40
_081775C8:
	ldr r1, _0817760C
	movs r0, #1
	strh r0, [r1]
	ldr r2, _08177610
	ldr r1, [sp]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, #4
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r2, [sp, #4]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r2, _08177614
	movs r1, #2
	bl GetBoxMonData
_081775F4:
	ldr r0, _08177614
	bl StringGetEnd10
_081775FA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817760C: .4byte 0x02037284
_08177610: .4byte 0x03005AF4
_08177614: .4byte 0x02021C40
	thumb_func_end PickLotteryCornerTicket

	thumb_func_start GetMatchingDigits
GetMatchingDigits: @ 0x08177618
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov r8, r0
	movs r7, #0
	ldr r1, _08177698
	mov sl, r1
	ldr r0, _0817769C
	mov sb, r0
_08177638:
	adds r0, r6, #0
	movs r1, #0xa
	bl __umodsi3
	adds r4, r0, #0
	mov r1, sl
	strh r4, [r1]
	adds r0, r5, #0
	movs r1, #0xa
	bl __umodsi3
	mov r1, sb
	strh r0, [r1]
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bne _08177686
	adds r0, r6, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #4
	bls _08177638
_08177686:
	mov r0, r8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08177698: .4byte 0x0203B9B8
_0817769C: .4byte 0x0203B9BA
	thumb_func_end GetMatchingDigits

	thumb_func_start SetLotteryNumber
SetLotteryNumber: @ 0x081776A0
	push {r4, lr}
	adds r1, r0, #0
	lsrs r4, r1, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _081776C0
	bl VarSet
	ldr r0, _081776C4
	adds r1, r4, #0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081776C0: .4byte 0x0000404B
_081776C4: .4byte 0x0000404C
	thumb_func_end SetLotteryNumber

	thumb_func_start GetLotteryNumber
GetLotteryNumber: @ 0x081776C8
	push {r4, lr}
	ldr r0, _081776E8
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _081776EC
	bl VarGet
	lsls r0, r0, #0x10
	orrs r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081776E8: .4byte 0x0000404B
_081776EC: .4byte 0x0000404C
	thumb_func_end GetLotteryNumber

	thumb_func_start SetLotteryNumber16_Unused
SetLotteryNumber16_Unused: @ 0x081776F0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetLotteryNumber
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetLotteryNumber16_Unused

	thumb_func_start sub_08177700
sub_08177700: @ 0x08177700
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08177700

	thumb_func_start CB2_ShowDiploma
CB2_ShowDiploma: @ 0x08177714
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
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
	add r1, sp, #4
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08177868
	add r0, sp, #4
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0817786C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	str r5, [sp, #8]
	add r0, sp, #8
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08177870
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add r0, sp, #4
	strh r5, [r0]
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08177874
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	ldr r0, _08177878
	movs r1, #0
	movs r2, #0x40
	bl LoadPalette
	ldr r4, _0817787C
	movs r0, #0x80
	lsls r0, r0, #5
	bl Alloc
	str r0, [r4]
	bl InitDiplomaBg
	bl InitDiplomaWindow
	bl reset_temp_tile_data_buffers
	ldr r1, _08177880
	str r5, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
_08177808:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08177808
	ldr r0, _08177884
	ldr r1, _0817787C
	ldr r1, [r1]
	bl LZDecompressVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	bl DisplayDiplomaText
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	bl EnableInterrupts
	ldr r0, _08177888
	bl SetVBlankCallback
	ldr r0, _0817788C
	bl SetMainCallback2
	ldr r0, _08177890
	movs r1, #0
	bl CreateTask
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08177868: .4byte 0x040000D4
_0817786C: .4byte 0x8100C000
_08177870: .4byte 0x85000100
_08177874: .4byte 0x81000200
_08177878: .4byte 0x085C7A34
_0817787C: .4byte 0x0203B9BC
_08177880: .4byte 0x085C81B0
_08177884: .4byte 0x085C7A74
_08177888: .4byte 0x08177701
_0817788C: .4byte 0x08177895
_08177890: .4byte 0x081778AD
	thumb_func_end CB2_ShowDiploma

