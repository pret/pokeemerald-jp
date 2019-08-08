.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CheckForFlashMemory
CheckForFlashMemory: @ 0x08076570
	push {lr}
	bl IdentifyFlash
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0807658C
	ldr r1, _08076588
	movs r0, #1
	str r0, [r1]
	bl InitFlashTimer
	b _08076592
	.align 2, 0
_08076588: .4byte 0x03005AE8
_0807658C:
	ldr r1, _08076598
	movs r0, #0
	str r0, [r1]
_08076592:
	pop {r0}
	bx r0
	.align 2, 0
_08076598: .4byte 0x03005AE8
	thumb_func_end CheckForFlashMemory

	thumb_func_start ClearSav1
ClearSav1: @ 0x0807659C
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080765B8
	ldr r2, _080765BC
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080765B8: .4byte 0x020246F8
_080765BC: .4byte 0x010007D6
	thumb_func_end ClearSav1

	thumb_func_start ClearSav2
ClearSav2: @ 0x080765C0
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080765DC
	ldr r2, _080765E0
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080765DC: .4byte 0x020256A4
_080765E0: .4byte 0x01001F04
	thumb_func_end ClearSav2

	thumb_func_start SetSaveBlocksPointers
SetSaveBlocksPointers: @ 0x080765E4
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r5, _0807661C
	bl Random
	adds r4, r4, r0
	movs r0, #0x7c
	ands r4, r0
	ldr r1, _08076620
	ldr r0, _08076624
	adds r0, r4, r0
	str r0, [r1]
	ldr r0, _08076628
	adds r0, r4, r0
	str r0, [r5]
	ldr r1, _0807662C
	ldr r0, _08076630
	adds r4, r4, r0
	str r4, [r1]
	bl SetBagItemsPointers
	bl SetDecorationInventoriesPointers
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807661C: .4byte 0x03005AEC
_08076620: .4byte 0x03005AF0
_08076624: .4byte 0x020246F8
_08076628: .4byte 0x020256A4
_0807662C: .4byte 0x03005AF4
_08076630: .4byte 0x020294AC
	thumb_func_end SetSaveBlocksPointers

	thumb_func_start MoveSaveBlocks_ResetHeap
MoveSaveBlocks_ResetHeap: @ 0x08076634
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r5, _08076700
	ldr r0, [r5, #0xc]
	str r0, [sp]
	ldr r1, [r5, #0x10]
	str r1, [sp, #4]
	movs r0, #0
	str r0, [r5, #0xc]
	str r0, [r5, #0x10]
	ldr r1, _08076704
	str r0, [r1]
	ldr r4, _08076708
	ldr r0, _0807670C
	ldr r1, [r0]
	ldr r6, _08076710
	adds r0, r4, #0
	adds r2, r6, #0
	bl memcpy
	ldr r1, _08076714
	mov sl, r1
	ldr r1, [r1]
	ldr r7, _08076718
	ldr r0, _0807671C
	adds r2, r7, #0
	bl memcpy
	ldr r0, _08076720
	mov r8, r0
	ldr r1, [r0]
	ldr r0, _08076724
	mov sb, r0
	ldr r0, _08076728
	mov r2, sb
	bl memcpy
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xb]
	adds r1, r1, r0
	ldrb r0, [r4, #0xc]
	adds r1, r1, r0
	ldrb r0, [r4, #0xd]
	adds r0, r0, r1
	bl SetSaveBlocksPointers
	ldr r1, _0807670C
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r6, #0
	bl memcpy
	mov r1, sl
	ldr r0, [r1]
	ldr r1, _0807671C
	adds r2, r7, #0
	bl memcpy
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _08076728
	mov r2, sb
	bl memcpy
	movs r1, #0xe0
	lsls r1, r1, #9
	adds r0, r4, #0
	bl InitHeap
	ldr r0, [sp, #4]
	str r0, [r5, #0x10]
	ldr r1, [sp]
	str r1, [r5, #0xc]
	bl Random
	adds r4, r0, #0
	bl Random
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r4, r0
	adds r0, r4, #0
	bl ApplyNewEncryptionKeyToAllEncryptedData
	ldr r1, _0807670C
	ldr r0, [r1]
	adds r0, #0xac
	str r4, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076700: .4byte 0x03002360
_08076704: .4byte 0x0203CC28
_08076708: .4byte 0x02000000
_0807670C: .4byte 0x03005AF0
_08076710: .4byte 0x00000F2C
_08076714: .4byte 0x03005AEC
_08076718: .4byte 0x00003D88
_0807671C: .4byte 0x02000F2C
_08076720: .4byte 0x03005AF4
_08076724: .4byte 0x000083D0
_08076728: .4byte 0x02004CB4
	thumb_func_end MoveSaveBlocks_ResetHeap

	thumb_func_start UseContinueGameWarp
UseContinueGameWarp: @ 0x0807672C
	ldr r0, _08076738
	ldr r0, [r0]
	ldrb r1, [r0, #9]
	movs r0, #1
	ands r0, r1
	bx lr
	.align 2, 0
_08076738: .4byte 0x03005AF0
	thumb_func_end UseContinueGameWarp

	thumb_func_start ClearContinueGameWarpStatus2
ClearContinueGameWarpStatus2: @ 0x0807673C
	ldr r0, _0807674C
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #9]
	bx lr
	.align 2, 0
_0807674C: .4byte 0x03005AF0
	thumb_func_end ClearContinueGameWarpStatus2

	thumb_func_start SetContinueGameWarpStatus
SetContinueGameWarpStatus: @ 0x08076750
	ldr r0, _08076760
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #9]
	bx lr
	.align 2, 0
_08076760: .4byte 0x03005AF0
	thumb_func_end SetContinueGameWarpStatus

	thumb_func_start SetContinueGameWarpStatusToDynamicWarp
SetContinueGameWarpStatusToDynamicWarp: @ 0x08076764
	push {lr}
	movs r0, #0
	bl SetContinueGameWarpToDynamicWarp
	ldr r0, _0807677C
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #9]
	pop {r0}
	bx r0
	.align 2, 0
_0807677C: .4byte 0x03005AF0
	thumb_func_end SetContinueGameWarpStatusToDynamicWarp

	thumb_func_start ClearContinueGameWarpStatus
ClearContinueGameWarpStatus: @ 0x08076780
	ldr r0, _08076790
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2, #9]
	bx lr
	.align 2, 0
_08076790: .4byte 0x03005AF0
	thumb_func_end ClearContinueGameWarpStatus

	thumb_func_start SavePlayerParty
SavePlayerParty: @ 0x08076794
	push {r4, lr}
	ldr r0, _080767D0
	ldr r0, [r0]
	ldr r1, _080767D4
	ldrb r1, [r1]
	movs r2, #0x8d
	lsls r2, r2, #2
	adds r0, r0, r2
	strb r1, [r0]
	movs r4, #0
_080767A8:
	ldr r0, _080767D0
	ldr r0, [r0]
	movs r1, #0x64
	muls r1, r4, r1
	adds r0, r0, r1
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r2, _080767D8
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	adds r4, #1
	cmp r4, #5
	ble _080767A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080767D0: .4byte 0x03005AEC
_080767D4: .4byte 0x0202418D
_080767D8: .4byte 0x02024190
	thumb_func_end SavePlayerParty

	thumb_func_start LoadPlayerParty
LoadPlayerParty: @ 0x080767DC
	push {r4, r5, lr}
	ldr r1, _08076818
	ldr r0, _0807681C
	ldr r0, [r0]
	movs r2, #0x8d
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	movs r4, #0
	ldr r5, _08076820
_080767F2:
	movs r0, #0x64
	adds r2, r4, #0
	muls r2, r0, r2
	adds r0, r2, r5
	ldr r1, _0807681C
	ldr r1, [r1]
	adds r1, r1, r2
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r1, r1, r2
	movs r2, #0x64
	bl memcpy
	adds r4, #1
	cmp r4, #5
	ble _080767F2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076818: .4byte 0x0202418D
_0807681C: .4byte 0x03005AEC
_08076820: .4byte 0x02024190
	thumb_func_end LoadPlayerParty

	thumb_func_start SaveEventObjects
SaveEventObjects: @ 0x08076824
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08076864
	mov ip, r0
	movs r5, #0xa3
	lsls r5, r5, #4
	mov r8, r5
	ldr r4, _08076868
	movs r3, #0
	movs r2, #0xf
_0807683A:
	mov r6, ip
	ldr r1, [r6]
	adds r1, r1, r3
	add r1, r8
	adds r0, r4, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	adds r4, #0x24
	adds r3, #0x24
	subs r2, #1
	cmp r2, #0
	bge _0807683A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076864: .4byte 0x03005AEC
_08076868: .4byte 0x02036FF0
	thumb_func_end SaveEventObjects

	thumb_func_start LoadEventObjects
LoadEventObjects: @ 0x0807686C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080768AC
	mov ip, r0
	movs r5, #0xa3
	lsls r5, r5, #4
	mov r8, r5
	ldr r4, _080768B0
	movs r3, #0
	movs r2, #0xf
_08076882:
	mov r6, ip
	ldr r1, [r6]
	adds r1, r1, r3
	adds r0, r4, #0
	add r1, r8
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	adds r4, #0x24
	adds r3, #0x24
	subs r2, #1
	cmp r2, #0
	bge _08076882
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080768AC: .4byte 0x03005AEC
_080768B0: .4byte 0x02036FF0
	thumb_func_end LoadEventObjects

	thumb_func_start SaveSerializedGame
SaveSerializedGame: @ 0x080768B4
	push {lr}
	bl SavePlayerParty
	bl SaveEventObjects
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SaveSerializedGame

	thumb_func_start LoadSerializedGame
LoadSerializedGame: @ 0x080768C4
	push {lr}
	bl LoadPlayerParty
	bl LoadEventObjects
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadSerializedGame

	thumb_func_start LoadPlayerBag
LoadPlayerBag: @ 0x080768D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r2, #0
	ldr r0, _080769D4
	mov ip, r0
	ldr r1, _080769D8
	mov sl, r1
	ldr r5, _080769DC
	movs r3, #0xac
	lsls r3, r3, #3
	ldr r4, _080769E0
_080768F0:
	lsls r0, r2, #2
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, #1
	cmp r2, #0x1d
	ble _080768F0
	movs r2, #0
	ldr r0, _080769E0
	ldr r5, _080769DC
	movs r3, #0xbb
	lsls r3, r3, #3
	adds r4, r0, #0
	adds r4, #0x78
_08076910:
	lsls r0, r2, #2
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, #1
	cmp r2, #0x1d
	ble _08076910
	movs r2, #0
	ldr r0, _080769E0
	ldr r5, _080769DC
	movs r3, #0xca
	lsls r3, r3, #3
	adds r4, r0, #0
	adds r4, #0xf0
_08076930:
	lsls r0, r2, #2
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, #1
	cmp r2, #0xf
	ble _08076930
	movs r2, #0
	ldr r0, _080769E0
	ldr r5, _080769DC
	movs r6, #0x98
	lsls r6, r6, #1
	adds r4, r0, r6
	movs r3, #0xd2
	lsls r3, r3, #3
_08076952:
	lsls r0, r2, #2
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, #1
	cmp r2, #0x3f
	ble _08076952
	movs r2, #0
	ldr r0, _080769E0
	ldr r5, _080769DC
	movs r7, #0x8c
	lsls r7, r7, #2
	adds r4, r0, r7
	movs r3, #0xf2
	lsls r3, r3, #3
_08076974:
	lsls r0, r2, #2
	ldr r1, [r5]
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r0, [r1]
	stm r4!, {r0}
	adds r2, #1
	cmp r2, #0x2d
	ble _08076974
	ldr r0, _080769E0
	ldr r1, _080769DC
	mov r8, r1
	movs r5, #0xba
	lsls r5, r5, #2
	adds r4, r0, r5
	movs r3, #0
	ldr r6, _080769E4
	mov sb, r6
	movs r2, #0xf
_0807699A:
	mov r7, r8
	ldr r1, [r7]
	adds r1, r1, r3
	adds r0, r4, #0
	add r1, sb
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r1!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	adds r4, #0x24
	adds r3, #0x24
	subs r2, #1
	cmp r2, #0
	bge _0807699A
	mov r1, sl
	ldr r0, [r1]
	adds r0, #0xac
	ldr r0, [r0]
	mov r5, ip
	str r0, [r5]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080769D4: .4byte 0x02031E24
_080769D8: .4byte 0x03005AF0
_080769DC: .4byte 0x03005AEC
_080769E0: .4byte 0x020318FC
_080769E4: .4byte 0x00002BE0
	thumb_func_end LoadPlayerBag

	thumb_func_start SavePlayerBag
SavePlayerBag: @ 0x080769E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r2, #0
	ldr r0, _08076AF4
	mov r8, r0
	ldr r1, _08076AF8
	mov ip, r1
	ldr r5, _08076AFC
	movs r3, #0xac
	lsls r3, r3, #3
	ldr r4, _08076B00
_08076A04:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r3
	adds r0, r0, r1
	ldm r4!, {r1}
	str r1, [r0]
	adds r2, #1
	cmp r2, #0x1d
	ble _08076A04
	movs r2, #0
	ldr r5, _08076AFC
	movs r4, #0xbb
	lsls r4, r4, #3
	ldr r0, _08076B00
	adds r3, r0, #0
	adds r3, #0x78
_08076A24:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r4
	adds r0, r0, r1
	ldm r3!, {r1}
	str r1, [r0]
	adds r2, #1
	cmp r2, #0x1d
	ble _08076A24
	movs r2, #0
	ldr r5, _08076AFC
	movs r4, #0xca
	lsls r4, r4, #3
	ldr r0, _08076B00
	adds r3, r0, #0
	adds r3, #0xf0
_08076A44:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r4
	adds r0, r0, r1
	ldm r3!, {r1}
	str r1, [r0]
	adds r2, #1
	cmp r2, #0xf
	ble _08076A44
	movs r2, #0
	ldr r5, _08076AFC
	movs r4, #0xd2
	lsls r4, r4, #3
	ldr r0, _08076B00
	movs r6, #0x98
	lsls r6, r6, #1
	adds r3, r0, r6
_08076A66:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r4
	adds r0, r0, r1
	ldm r3!, {r1}
	str r1, [r0]
	adds r2, #1
	cmp r2, #0x3f
	ble _08076A66
	movs r2, #0
	ldr r5, _08076AFC
	movs r4, #0xf2
	lsls r4, r4, #3
	ldr r0, _08076B00
	movs r7, #0x8c
	lsls r7, r7, #2
	adds r3, r0, r7
_08076A88:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, r0, r4
	adds r0, r0, r1
	ldm r3!, {r1}
	str r1, [r0]
	adds r2, #1
	cmp r2, #0x2d
	ble _08076A88
	ldr r0, _08076AFC
	mov sb, r0
	ldr r1, _08076B04
	mov sl, r1
	ldr r4, _08076B00
	movs r3, #0
	movs r2, #0xf
_08076AA8:
	mov r5, sb
	ldr r1, [r5]
	adds r1, r1, r3
	add r1, sl
	movs r6, #0xba
	lsls r6, r6, #2
	adds r0, r4, r6
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	adds r4, #0x24
	adds r3, #0x24
	subs r2, #1
	cmp r2, #0
	bge _08076AA8
	mov r7, r8
	ldr r0, [r7]
	adds r0, #0xac
	ldr r4, [r0]
	mov r2, ip
	ldr r1, [r2]
	str r1, [r0]
	adds r0, r4, #0
	bl ApplyNewEncryptionKeyToBagItems
	ldr r0, [r7]
	adds r0, #0xac
	str r4, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076AF4: .4byte 0x03005AF0
_08076AF8: .4byte 0x02031E24
_08076AFC: .4byte 0x03005AEC
_08076B00: .4byte 0x020318FC
_08076B04: .4byte 0x00002BE0
	thumb_func_end SavePlayerBag

	thumb_func_start ApplyNewEncryptionKeyToHword
ApplyNewEncryptionKeyToHword: @ 0x08076B08
	ldr r2, _08076B1C
	ldr r2, [r2]
	adds r2, #0xac
	ldr r2, [r2]
	ldrh r3, [r0]
	eors r2, r3
	eors r2, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_08076B1C: .4byte 0x03005AF0
	thumb_func_end ApplyNewEncryptionKeyToHword

	thumb_func_start ApplyNewEncryptionKeyToWord
ApplyNewEncryptionKeyToWord: @ 0x08076B20
	ldr r2, _08076B34
	ldr r3, [r2]
	adds r3, #0xac
	ldr r2, [r0]
	ldr r3, [r3]
	eors r2, r3
	eors r2, r1
	str r2, [r0]
	bx lr
	.align 2, 0
_08076B34: .4byte 0x03005AF0
	thumb_func_end ApplyNewEncryptionKeyToWord

	thumb_func_start ApplyNewEncryptionKeyToAllEncryptedData
ApplyNewEncryptionKeyToAllEncryptedData: @ 0x08076B38
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ApplyNewEncryptionKeyToGameStats
	adds r0, r4, #0
	bl ApplyNewEncryptionKeyToBagItems_
	adds r0, r4, #0
	bl ApplyNewEncryptionKeyToBerryPowder
	ldr r5, _08076B70
	ldr r0, [r5]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r1, r4, #0
	bl ApplyNewEncryptionKeyToWord
	ldr r0, [r5]
	ldr r1, _08076B74
	adds r0, r0, r1
	adds r1, r4, #0
	bl ApplyNewEncryptionKeyToHword
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076B70: .4byte 0x03005AEC
_08076B74: .4byte 0x00000494
	thumb_func_end ApplyNewEncryptionKeyToAllEncryptedData

