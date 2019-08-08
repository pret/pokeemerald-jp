.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0802A69C
sub_0802A69C: @ 0x0802A69C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0802A714
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802A730
	ldr r5, _0802A718
	ldr r0, _0802A71C
	bl Alloc
	str r0, [r5]
	cmp r0, #0
	beq _0802A730
	bl ResetTasks
	ldr r0, _0802A720
	movs r1, #1
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5]
	movs r1, #0
	strh r1, [r0, #8]
	str r6, [r0]
	strb r4, [r0, #4]
	bl GetMultiplayerId
	ldr r1, [r5]
	strb r0, [r1, #6]
	ldr r0, [r5]
	ldrb r2, [r0, #6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _0802A724
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #0x64
	muls r1, r7, r1
	ldr r2, _0802A728
	adds r1, r1, r2
	bl sub_0802A920
	ldr r0, [r5]
	bl sub_0802A754
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #2
	bl SetWordTaskArg
	ldr r0, _0802A72C
	bl SetMainCallback2
	b _0802A736
	.align 2, 0
_0802A714: .4byte 0x030031C4
_0802A718: .4byte 0x020229B0
_0802A71C: .4byte 0x0000839C
_0802A720: .4byte 0x0802A995
_0802A724: .4byte 0x000082A8
_0802A728: .4byte 0x02024190
_0802A72C: .4byte 0x0802A961
_0802A730:
	adds r0, r6, #0
	bl SetMainCallback2
_0802A736:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0802A69C

	thumb_func_start sub_0802A73C
sub_0802A73C: @ 0x0802A73C
	push {lr}
	bl sub_0802CDA0
	ldr r0, _0802A750
	ldr r0, [r0]
	bl Free
	pop {r0}
	bx r0
	.align 2, 0
_0802A750: .4byte 0x020229B0
	thumb_func_end sub_0802A73C

	thumb_func_start sub_0802A754
sub_0802A754: @ 0x0802A754
	push {r4, lr}
	adds r4, r0, #0
	bl GetLinkPlayerCount
	movs r2, #0
	strb r0, [r4, #5]
	adds r1, r4, #0
	adds r1, #0x70
	movs r0, #5
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x72
	strh r2, [r0]
	bl sub_0802A814
	adds r0, r4, #0
	bl sub_0802A788
	ldrb r0, [r4, #5]
	cmp r0, #5
	bne _0802A782
	bl sub_0802E0A0
_0802A782:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0802A754

	thumb_func_start sub_0802A788
sub_0802A788: @ 0x0802A788
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #6
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x4a
	movs r6, #0
	movs r5, #0
	strh r5, [r0]
	str r5, [r4, #0x1c]
	str r5, [r4, #0x5c]
	bl GetMultiplayerId
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A7AE
	movs r1, #1
_0802A7AE:
	adds r0, r4, #0
	adds r0, #0x47
	strb r1, [r0]
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0xe]
	str r5, [r4, #0x58]
	strh r5, [r4, #0x3a]
	subs r0, #3
	strb r6, [r0]
	str r5, [r4, #0x54]
	adds r0, #2
	strb r6, [r0]
	adds r0, #3
	strb r6, [r0]
	subs r0, #1
	movs r1, #1
	strb r1, [r0]
	str r5, [r4, #0x78]
	adds r0, #0x29
	strb r6, [r0]
	adds r0, #3
	strh r5, [r0]
	str r1, [r4, #0x60]
	subs r0, #0x27
	strb r6, [r0]
	str r5, [r4, #0x68]
	str r5, [r4, #0x64]
	str r5, [r4, #0x2c]
	str r5, [r4, #0x30]
	bl sub_0802A88C
	bl sub_0802BDDC
	movs r2, #0
	adds r5, r4, #0
	adds r5, #0x7c
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x9a
_0802A800:
	adds r0, r5, r2
	strb r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #4
	ble _0802A800
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0802A788

	thumb_func_start sub_0802A814
sub_0802A814: @ 0x0802A814
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0802A874
	movs r6, #0
	movs r5, #0
	ldr r0, _0802A878
	mov r8, r0
	movs r4, #4
_0802A826:
	ldr r0, [r7]
	adds r0, r0, r5
	ldr r1, _0802A87C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_0802A8F4
	lsls r0, r0, #0x10
	ldr r1, [r7]
	adds r1, r1, r6
	asrs r0, r0, #0xe
	add r0, r8
	ldrh r0, [r0, #2]
	ldr r2, _0802A880
	adds r1, r1, r2
	strh r0, [r1]
	adds r6, #0x24
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0802A826
	ldr r0, _0802A874
	ldr r1, [r0]
	ldr r0, _0802A884
	adds r3, r1, r0
	ldrb r2, [r1, #6]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0802A888
	adds r0, r0, r2
	adds r1, r1, r0
	str r1, [r3]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A874: .4byte 0x020229B0
_0802A878: .4byte 0x082CECF0
_0802A87C: .4byte 0x000082A8
_0802A880: .4byte 0x000082F0
_0802A884: .4byte 0x00008398
_0802A888: .4byte 0x000082E4
	thumb_func_end sub_0802A814

	thumb_func_start sub_0802A88C
sub_0802A88C: @ 0x0802A88C
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r6, _0802A8DC
	movs r4, #0
	movs r3, #0
_0802A896:
	ldr r2, [r6]
	adds r1, r2, r3
	ldr r7, _0802A8E0
	adds r0, r1, r7
	strh r4, [r0]
	adds r7, #2
	adds r0, r1, r7
	strh r4, [r0]
	ldr r0, _0802A8E4
	adds r1, r1, r0
	strh r4, [r1]
	ldr r1, _0802A8E8
	adds r0, r2, r1
	adds r0, r0, r3
	str r4, [r0]
	subs r7, #0xc
	adds r0, r2, r7
	adds r0, r0, r3
	ldr r1, _0802A8EC
	str r1, [r0]
	ldr r1, _0802A8F0
	adds r0, r2, r1
	adds r0, r0, r3
	str r4, [r0]
	adds r2, #0x8b
	adds r2, r2, r5
	movs r0, #9
	strb r0, [r2]
	adds r3, #0x24
	adds r5, #1
	cmp r5, #4
	ble _0802A896
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A8DC: .4byte 0x020229B0
_0802A8E0: .4byte 0x000082F2
_0802A8E4: .4byte 0x000082F6
_0802A8E8: .4byte 0x000082E4
_0802A8EC: .4byte 0x7FFFFFFF
_0802A8F0: .4byte 0x000082F8
	thumb_func_end sub_0802A88C

	thumb_func_start sub_0802A8F4
sub_0802A8F4: @ 0x0802A8F4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	ldr r2, _0802A90C
_0802A8FE:
	ldrh r0, [r2]
	cmp r0, r3
	bne _0802A910
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	b _0802A91C
	.align 2, 0
_0802A90C: .4byte 0x082CECF0
_0802A910:
	adds r2, #4
	adds r1, #1
	cmp r1, #0x63
	bls _0802A8FE
	movs r0, #1
	rsbs r0, r0, #0
_0802A91C:
	pop {r1}
	bx r1
	thumb_func_end sub_0802A8F4

	thumb_func_start sub_0802A920
sub_0802A920: @ 0x0802A920
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	str r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [r5, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802A920

	thumb_func_start sub_0802A94C
sub_0802A94C: @ 0x0802A94C
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802A94C

	thumb_func_start sub_0802A960
sub_0802A960: @ 0x0802A960
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802A960

	thumb_func_start sub_0802A978
sub_0802A978: @ 0x0802A978
	push {lr}
	movs r1, #1
	bl CreateTask
	ldr r2, _0802A990
	ldr r1, [r2]
	movs r3, #0
	strb r0, [r1, #4]
	ldr r0, [r2]
	strh r3, [r0, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0802A990: .4byte 0x020229B0
	thumb_func_end sub_0802A978

	thumb_func_start sub_0802A994
sub_0802A994: @ 0x0802A994
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0802A9B4
	ldr r0, [r1]
	ldrh r0, [r0, #8]
	adds r2, r1, #0
	cmp r0, #5
	bls _0802A9AA
	b _0802AAFC
_0802A9AA:
	lsls r0, r0, #2
	ldr r1, _0802A9B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A9B4: .4byte 0x020229B0
_0802A9B8: .4byte 0x0802A9BC
_0802A9BC: @ jump table
	.4byte _0802A9D4 @ case 0
	.4byte _0802AA00 @ case 1
	.4byte _0802AA30 @ case 2
	.4byte _0802AA5C @ case 3
	.4byte _0802AA98 @ case 4
	.4byte _0802AAC4 @ case 5
_0802A9D4:
	movs r0, #0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0802A9F8
	movs r1, #5
	bl sub_0802BB54
	movs r0, #4
	bl FadeOutMapMusic
	ldr r0, _0802A9FC
	ldr r1, [r0]
	b _0802AAB4
	.align 2, 0
_0802A9F8: .4byte 0x0802BA79
_0802A9FC: .4byte 0x020229B0
_0802AA00:
	ldr r0, _0802AA28
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802AAFC
	ldr r4, _0802AA2C
	ldr r0, [r4]
	adds r0, #0xa4
	bl sub_0802CD68
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	ldr r1, [r4]
	b _0802AAB4
	.align 2, 0
_0802AA28: .4byte 0x0802BA79
_0802AA2C: .4byte 0x020229B0
_0802AA30:
	bl sub_0802CDE4
	cmp r0, #0
	bne _0802AAFC
	bl IsNotWaitingForBGMStop
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802AAFC
	ldr r0, _0802AA54
	movs r1, #8
	bl FadeOutAndPlayNewMapMusic
	ldr r0, _0802AA58
	ldr r1, [r0]
	b _0802AAB4
	.align 2, 0
_0802AA54: .4byte 0x0000021A
_0802AA58: .4byte 0x020229B0
_0802AA5C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802AAFC
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r4, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0802AA90
	bl SetVBlankCallback
	ldr r0, _0802AA94
	ldr r1, [r0]
	b _0802AAB4
	.align 2, 0
_0802AA90: .4byte 0x0802A94D
_0802AA94: .4byte 0x020229B0
_0802AA98:
	bl UpdatePaletteFade
	ldr r0, _0802AABC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802AAFC
	ldr r1, _0802AAC0
	ldr r0, [r1]
	strb r2, [r0, #7]
	ldr r1, [r1]
_0802AAB4:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802AAFC
	.align 2, 0
_0802AABC: .4byte 0x02037C74
_0802AAC0: .4byte 0x020229B0
_0802AAC4:
	ldr r0, [r2]
	ldrb r1, [r0, #7]
	adds r1, #1
	strb r1, [r0, #7]
	ldr r1, [r2]
	ldrb r0, [r1, #7]
	cmp r0, #0x13
	bls _0802AAFC
	adds r0, r1, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802AAEC
	ldr r0, _0802AAE8
	bl sub_0802A978
	b _0802AAF2
	.align 2, 0
_0802AAE8: .4byte 0x0802AC75
_0802AAEC:
	ldr r0, _0802AB04
	bl sub_0802A978
_0802AAF2:
	bl sub_0802BB74
	adds r0, r4, #0
	bl DestroyTask
_0802AAFC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AB04: .4byte 0x0802AE89
	thumb_func_end sub_0802A994

	thumb_func_start sub_0802AB08
sub_0802AB08: @ 0x0802AB08
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0802AB28
	ldr r0, _0802AB20
	ldr r1, [r0]
	ldr r0, _0802AB24
	str r0, [r1, #0x30]
	movs r0, #1
	str r0, [r1, #0x2c]
	b _0802AB3A
	.align 2, 0
_0802AB20: .4byte 0x020229B0
_0802AB24: .4byte 0x00001111
_0802AB28:
	ldr r0, _0802AB40
	ldr r2, [r0]
	subs r1, #1
	movs r0, #1
	lsls r0, r1
	subs r0, #1
	str r0, [r2, #0x30]
	movs r0, #0
	str r0, [r2, #0x2c]
_0802AB3A:
	pop {r0}
	bx r0
	.align 2, 0
_0802AB40: .4byte 0x020229B0
	thumb_func_end sub_0802AB08

	thumb_func_start sub_0802AB44
sub_0802AB44: @ 0x0802AB44
	push {r4, r5, r6, lr}
	ldr r4, _0802AB90
	ldr r1, [r4]
	adds r1, #0x70
	movs r2, #0
	strb r0, [r1]
	ldr r0, [r4]
	movs r3, #0
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	adds r0, #0x48
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x49
	strb r3, [r0]
	movs r3, #1
	ldr r0, [r4]
	ldrb r0, [r0, #5]
	cmp r3, r0
	bge _0802AB88
	adds r6, r4, #0
	ldr r5, _0802AB94
	movs r4, #0
	movs r2, #0x24
_0802AB76:
	ldr r1, [r6]
	adds r0, r1, r5
	adds r0, r0, r2
	str r4, [r0]
	adds r2, #0x24
	adds r3, #1
	ldrb r1, [r1, #5]
	cmp r3, r1
	blt _0802AB76
_0802AB88:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AB90: .4byte 0x020229B0
_0802AB94: .4byte 0x000082FC
	thumb_func_end sub_0802AB44

	thumb_func_start sub_0802AB98
sub_0802AB98: @ 0x0802AB98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r4, #1
	movs r0, #0
	str r0, [sp, #4]
	ldr r7, _0802AC60
	ldr r0, [r7]
	ldrb r0, [r0, #5]
	cmp r4, r0
	bge _0802AC3C
	adds r1, r7, #0
	mov sl, r1
	movs r2, #2
	add r2, sp
	mov r8, r2
	ldr r3, _0802AC64
	mov sb, r3
	movs r6, #0x24
_0802ABC4:
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r6
	ldr r2, _0802AC68
	adds r1, r1, r2
	ldrh r5, [r1]
	add r0, sb
	adds r1, r4, #0
	mov r2, sp
	mov r3, r8
	bl sub_0802DF5C
	cmp r0, #0
	beq _0802AC04
	ldr r2, [r7]
	lsls r1, r4, #1
	adds r0, r2, #0
	adds r0, #0x90
	adds r0, r0, r1
	mov r3, r8
	ldrh r1, [r3]
	strh r1, [r0]
	adds r2, #0x8b
	adds r2, r2, r4
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, [r7]
	adds r0, r0, r6
	ldr r1, _0802AC6C
	adds r0, r0, r1
	strh r5, [r0]
_0802AC04:
	mov r2, sl
	ldr r1, [r2]
	ldr r3, _0802AC70
	adds r0, r1, r3
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _0802AC2A
	adds r0, r1, #0
	adds r0, #0x8b
	adds r0, r0, r4
	adds r1, #0x70
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0802AC2A
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
_0802AC2A:
	movs r1, #0x24
	add sb, r1
	adds r6, #0x24
	adds r4, #1
	ldr r7, _0802AC60
	ldr r0, [r7]
	ldrb r0, [r0, #5]
	cmp r4, r0
	blt _0802ABC4
_0802AC3C:
	ldr r2, _0802AC60
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	subs r0, #1
	ldr r3, [sp, #4]
	cmp r3, r0
	bne _0802AC50
	adds r1, #0x49
	movs r0, #1
	strb r0, [r1]
_0802AC50:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AC60: .4byte 0x020229B0
_0802AC64: .4byte 0x00008308
_0802AC68: .4byte 0x000082F4
_0802AC6C: .4byte 0x000082F6
_0802AC70: .4byte 0x000082FC
	thumb_func_end sub_0802AB98

	thumb_func_start sub_0802AC74
sub_0802AC74: @ 0x0802AC74
	push {r4, r5, lr}
	bl sub_0802AB98
	bl sub_0802C130
	ldr r0, _0802ACF0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802ACA6
	adds r0, r1, #0
	adds r0, #0x49
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802ACA6
	adds r0, r1, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	bl sub_0802AB44
	movs r0, #3
	bl sub_0802AB08
_0802ACA6:
	ldr r4, _0802ACF0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x48
	ldrb r5, [r0]
	cmp r5, #1
	bne _0802ACE2
	ldr r1, _0802ACF4
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	adds r1, r0, #0
	cmp r1, #0
	bne _0802ACE2
	ldr r0, [r4]
	adds r0, #0x48
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r2, [r1, #6]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0802ACF8
	adds r1, r1, r2
	adds r1, r1, r0
	str r5, [r1]
_0802ACE2:
	bl sub_0802BED0
	bl sub_0802ACFC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802ACF0: .4byte 0x020229B0
_0802ACF4: .4byte 0x082CEE80
_0802ACF8: .4byte 0x000082FC
	thumb_func_end sub_0802AC74

	thumb_func_start sub_0802ACFC
sub_0802ACFC: @ 0x0802ACFC
	push {r4, lr}
	ldr r4, _0802AD2C
	ldr r1, [r4]
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	bne _0802AD12
	ldr r2, _0802AD30
	adds r0, r1, r2
	adds r1, #0x70
	bl sub_0802DE30
_0802AD12:
	ldr r1, [r4]
	ldr r2, [r1, #0x30]
	ldr r0, _0802AD34
	cmp r2, r0
	beq _0802AD24
	ldr r0, [r1, #0x2c]
	adds r0, #1
	ands r0, r2
	str r0, [r1, #0x2c]
_0802AD24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AD2C: .4byte 0x020229B0
_0802AD30: .4byte 0x000082E4
_0802AD34: .4byte 0x00001111
	thumb_func_end sub_0802ACFC

	thumb_func_start sub_0802AD38
sub_0802AD38: @ 0x0802AD38
	ldr r2, _0802AD64
	ldr r1, [r2]
	adds r1, #0x70
	movs r3, #0
	strb r0, [r1]
	ldr r0, [r2]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	adds r0, #0x48
	movs r1, #1
	strb r1, [r0]
	ldr r1, [r2]
	ldrb r2, [r1, #6]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0802AD68
	adds r1, r1, r2
	adds r1, r1, r0
	str r3, [r1]
	bx lr
	.align 2, 0
_0802AD64: .4byte 0x020229B0
_0802AD68: .4byte 0x000082FC
	thumb_func_end sub_0802AD38

	thumb_func_start sub_0802AD6C
sub_0802AD6C: @ 0x0802AD6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r4, _0802ADE8
	ldr r0, [r4]
	ldr r2, _0802ADEC
	adds r1, r0, r2
	ldrh r1, [r1]
	mov r8, r1
	ldr r3, _0802ADF0
	adds r0, r0, r3
	mov r1, sp
	bl sub_0802DEB4
	cmp r0, #0
	beq _0802AE1C
	ldr r2, [r4]
	ldrb r0, [r2, #6]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r3, _0802ADF4
	adds r0, r2, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _0802ADBA
	mov r0, sp
	adds r1, r2, #0
	adds r1, #0x70
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0802ADBA
	mov r0, sp
	ldrb r0, [r0]
	bl sub_0802AD38
_0802ADBA:
	ldr r3, _0802ADE8
	ldr r2, [r3]
	ldr r0, [r2, #0x78]
	ldr r1, [sp, #8]
	cmp r0, r1
	beq _0802ADFC
	str r1, [r2, #0x78]
	movs r4, #1
	str r4, [r2, #0x5c]
	mov r0, sp
	ldrb r1, [r0, #1]
	adds r0, r2, #0
	adds r0, #0x71
	strb r1, [r0]
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x71
	ldrb r1, [r1]
	cmp r1, #0
	beq _0802ADF8
	adds r0, #0x4d
	strb r4, [r0]
	b _0802ADFC
	.align 2, 0
_0802ADE8: .4byte 0x020229B0
_0802ADEC: .4byte 0x000082F4
_0802ADF0: .4byte 0x000082E4
_0802ADF4: .4byte 0x000082FC
_0802ADF8:
	adds r0, #0x4d
	strb r1, [r0]
_0802ADFC:
	ldr r0, _0802AE78
	ldr r1, [r0]
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r2, r1, #0
	adds r2, #0x72
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r0, #4]
	adds r0, r1, #0
	adds r0, #0x74
	strh r2, [r0]
	ldr r0, _0802AE7C
	adds r1, r1, r0
	mov r2, r8
	strh r2, [r1]
_0802AE1C:
	movs r4, #1
	ldr r2, _0802AE78
	ldr r0, [r2]
	ldrb r0, [r0, #5]
	cmp r4, r0
	bge _0802AE6A
	adds r7, r2, #0
	ldr r6, _0802AE80
	movs r5, #0x24
_0802AE2E:
	ldr r1, [r7]
	ldrb r3, [r1, #6]
	cmp r4, r3
	beq _0802AE5C
	adds r0, r1, r5
	ldr r3, _0802AE84
	adds r0, r0, r3
	ldrh r0, [r0]
	mov r8, r0
	adds r0, r1, r6
	adds r1, r4, #0
	str r2, [sp, #0xc]
	bl sub_0802DFC8
	ldr r2, [sp, #0xc]
	cmp r0, #0
	beq _0802AE5C
	ldr r0, [r7]
	adds r0, r0, r5
	ldr r1, _0802AE7C
	adds r0, r0, r1
	mov r3, r8
	strh r3, [r0]
_0802AE5C:
	adds r6, #0x24
	adds r5, #0x24
	adds r4, #1
	ldr r0, [r2]
	ldrb r0, [r0, #5]
	cmp r4, r0
	blt _0802AE2E
_0802AE6A:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AE78: .4byte 0x020229B0
_0802AE7C: .4byte 0x000082F6
_0802AE80: .4byte 0x00008308
_0802AE84: .4byte 0x000082F4
	thumb_func_end sub_0802AD6C

	thumb_func_start sub_0802AE88
sub_0802AE88: @ 0x0802AE88
	push {r4, lr}
	bl sub_0802AD6C
	ldr r4, _0802AEE4
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802AED4
	ldr r1, _0802AEE8
	adds r0, r2, #0
	adds r0, #0x70
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	adds r1, r0, #0
	cmp r1, #0
	bne _0802AED4
	ldr r0, [r4]
	adds r0, #0x48
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r2, [r1, #6]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0802AEEC
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #1
	str r0, [r1]
	movs r0, #3
	bl sub_0802AB08
_0802AED4:
	bl sub_0802BED0
	bl sub_0802AEF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AEE4: .4byte 0x020229B0
_0802AEE8: .4byte 0x082CEEA4
_0802AEEC: .4byte 0x000082FC
	thumb_func_end sub_0802AE88

	thumb_func_start sub_0802AEF0
sub_0802AEF0: @ 0x0802AEF0
	push {r4, lr}
	ldr r4, _0802AF30
	ldr r2, [r4]
	ldr r0, [r2, #0x2c]
	cmp r0, #0
	bne _0802AF18
	ldrb r1, [r2, #6]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802AF34
	adds r0, r0, r1
	adds r0, r2, r0
	adds r1, r2, #0
	adds r1, #0x70
	ldrb r1, [r1]
	adds r2, #0x42
	ldrh r2, [r2]
	bl sub_0802DF2C
_0802AF18:
	ldr r1, [r4]
	ldr r2, [r1, #0x30]
	ldr r0, _0802AF38
	cmp r2, r0
	beq _0802AF2A
	ldr r0, [r1, #0x2c]
	adds r0, #1
	ands r0, r2
	str r0, [r1, #0x2c]
_0802AF2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AF30: .4byte 0x020229B0
_0802AF34: .4byte 0x000082E4
_0802AF38: .4byte 0x00001111
	thumb_func_end sub_0802AEF0

	thumb_func_start sub_0802AF3C
sub_0802AF3C: @ 0x0802AF3C
	push {r4, lr}
	ldr r4, _0802AF50
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0802AF54
	cmp r0, #1
	beq _0802AF62
	b _0802AF88
	.align 2, 0
_0802AF50: .4byte 0x020229B0
_0802AF54:
	movs r0, #3
	bl sub_0802AB08
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802AF62:
	bl sub_0802B4D4
	cmp r0, #0
	bne _0802AF88
	ldr r0, _0802AF84
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r2, r1, #0
	adds r2, #0x72
	strh r0, [r2]
	adds r1, #0x4c
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _0802AF8A
	.align 2, 0
_0802AF84: .4byte 0x020229B0
_0802AF88:
	movs r0, #1
_0802AF8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802AF3C

	thumb_func_start sub_0802AF90
sub_0802AF90: @ 0x0802AF90
	push {r4, lr}
	ldr r4, _0802AFA4
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0802AFA8
	cmp r0, #1
	beq _0802AFBE
	movs r0, #1
	b _0802AFC2
	.align 2, 0
_0802AFA4: .4byte 0x020229B0
_0802AFA8:
	movs r0, #0
	bl sub_0802AB08
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x72
	ldrh r0, [r0]
	str r0, [r1, #0x24]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802AFBE:
	bl sub_0802B4D4
_0802AFC2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802AF90

	thumb_func_start sub_0802AFC8
sub_0802AFC8: @ 0x0802AFC8
	push {r4, lr}
	ldr r4, _0802AFDC
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	beq _0802AFE0
	cmp r0, #1
	beq _0802AFF4
	b _0802B008
	.align 2, 0
_0802AFDC: .4byte 0x020229B0
_0802AFE0:
	bl sub_0802BDDC
	movs r0, #5
	bl sub_0802AB08
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802B008
_0802AFF4:
	adds r0, r1, #0
	adds r0, #0x49
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802B008
	adds r1, #0x4c
	movs r0, #2
	strb r0, [r1]
	movs r0, #0
	b _0802B00A
_0802B008:
	movs r0, #1
_0802B00A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802AFC8

	thumb_func_start sub_0802B010
sub_0802B010: @ 0x0802B010
	push {r4, lr}
	ldr r4, _0802B024
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0802B028
	cmp r0, #1
	beq _0802B046
	b _0802B052
	.align 2, 0
_0802B024: .4byte 0x020229B0
_0802B028:
	bl sub_0802BDDC
	movs r0, #0
	bl sub_0802AB08
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x72
	ldrh r0, [r0]
	adds r2, r1, #0
	adds r2, #0x4a
	strh r0, [r2]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802B046:
	bl sub_0802C400
	cmp r0, #0
	beq _0802B052
	movs r0, #0
	b _0802B054
_0802B052:
	movs r0, #1
_0802B054:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802B010

	thumb_func_start sub_0802B05C
sub_0802B05C: @ 0x0802B05C
	push {lr}
	bl sub_0802B5C0
	cmp r0, #0
	bne _0802B084
	ldr r0, _0802B080
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r2, r1, #0
	adds r2, #0x72
	strh r0, [r2]
	adds r1, #0x4c
	movs r0, #1
	strb r0, [r1]
	b _0802B09E
	.align 2, 0
_0802B080: .4byte 0x020229B0
_0802B084:
	bl sub_0802C22C
	cmp r0, #0
	beq _0802B090
	movs r0, #1
	b _0802B0A0
_0802B090:
	bl sub_0802BDAC
	ldr r0, _0802B0A4
	ldr r0, [r0]
	adds r0, #0x4c
	movs r1, #3
	strb r1, [r0]
_0802B09E:
	movs r0, #0
_0802B0A0:
	pop {r1}
	bx r1
	.align 2, 0
_0802B0A4: .4byte 0x020229B0
	thumb_func_end sub_0802B05C

	thumb_func_start sub_0802B0A8
sub_0802B0A8: @ 0x0802B0A8
	push {lr}
	bl sub_0802B5C0
	cmp r0, #0
	beq _0802B0C2
	bl sub_0802C22C
	cmp r0, #0
	beq _0802B0BE
	movs r0, #1
	b _0802B0C4
_0802B0BE:
	bl sub_0802BDAC
_0802B0C2:
	movs r0, #0
_0802B0C4:
	pop {r1}
	bx r1
	thumb_func_end sub_0802B0A8

	thumb_func_start sub_0802B0C8
sub_0802B0C8: @ 0x0802B0C8
	push {r4, lr}
	ldr r4, _0802B0E0
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	cmp r0, #1
	beq _0802B100
	cmp r0, #1
	bgt _0802B0E4
	cmp r0, #0
	beq _0802B0EA
	b _0802B15C
	.align 2, 0
_0802B0E0: .4byte 0x020229B0
_0802B0E4:
	cmp r0, #2
	beq _0802B154
	b _0802B15C
_0802B0EA:
	bl sub_0802C22C
	bl sub_0802C2D0
	cmp r0, #0
	beq _0802B15C
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802B15C
_0802B100:
	bl sub_0802B658
	cmp r0, #0
	bne _0802B15C
	bl sub_0802C4B0
	cmp r0, #0
	beq _0802B122
	bl sub_0802C4D4
	ldr r1, [r4]
	adds r2, r1, #0
	adds r2, #0x72
	strh r0, [r2]
	adds r1, #0x4c
	movs r0, #7
	b _0802B148
_0802B122:
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x74
	ldrh r0, [r0]
	cmp r0, #0xc7
	bls _0802B13C
	ldrh r0, [r1, #0xe]
	adds r2, r1, #0
	adds r2, #0x72
	strh r0, [r2]
	adds r1, #0x4c
	movs r0, #8
	b _0802B148
_0802B13C:
	ldrh r0, [r1, #0xe]
	adds r2, r1, #0
	adds r2, #0x72
	strh r0, [r2]
	adds r1, #0x4c
	movs r0, #4
_0802B148:
	strb r0, [r1]
	ldr r0, _0802B158
	ldr r1, [r0]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802B154:
	movs r0, #0
	b _0802B15E
	.align 2, 0
_0802B158: .4byte 0x020229B0
_0802B15C:
	movs r0, #1
_0802B15E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B0C8

	thumb_func_start sub_0802B164
sub_0802B164: @ 0x0802B164
	push {r4, lr}
	ldr r4, _0802B17C
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	cmp r0, #1
	beq _0802B1A4
	cmp r0, #1
	bgt _0802B180
	cmp r0, #0
	beq _0802B186
	b _0802B1B8
	.align 2, 0
_0802B17C: .4byte 0x020229B0
_0802B180:
	cmp r0, #2
	beq _0802B1B4
	b _0802B1B8
_0802B186:
	bl sub_0802C22C
	cmp r0, #0
	bne _0802B192
	bl sub_0802BDAC
_0802B192:
	bl sub_0802C2D0
	cmp r0, #0
	beq _0802B1B8
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802B1B8
_0802B1A4:
	bl sub_0802B658
	cmp r0, #0
	bne _0802B1B8
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802B1B4:
	movs r0, #0
	b _0802B1BA
_0802B1B8:
	movs r0, #1
_0802B1BA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B164

	thumb_func_start sub_0802B1C0
sub_0802B1C0: @ 0x0802B1C0
	push {r4, lr}
	ldr r4, _0802B1D8
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	cmp r1, #1
	beq _0802B1F4
	cmp r1, #1
	bgt _0802B1DC
	cmp r1, #0
	beq _0802B1E6
	b _0802B254
	.align 2, 0
_0802B1D8: .4byte 0x020229B0
_0802B1DC:
	cmp r1, #2
	beq _0802B220
	cmp r1, #3
	beq _0802B24A
	b _0802B254
_0802B1E6:
	movs r0, #4
	bl sub_0802AB08
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802B1F4:
	bl sub_0802B878
	cmp r0, #0
	bne _0802B254
	ldr r4, _0802B21C
	ldr r2, [r4]
	ldr r0, [r2, #0x78]
	adds r1, r2, #0
	adds r1, #0x74
	ldrh r1, [r1]
	adds r2, #0x72
	ldrh r2, [r2]
	bl sub_0802E04C
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802B254
	.align 2, 0
_0802B21C: .4byte 0x020229B0
_0802B220:
	adds r0, #0x49
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802B254
	bl sub_0802C344
	cmp r0, #0
	beq _0802B238
	ldr r0, [r4]
	adds r0, #0x4c
	movs r1, #5
	b _0802B23E
_0802B238:
	ldr r0, [r4]
	adds r0, #0x4c
	movs r1, #6
_0802B23E:
	strb r1, [r0]
	ldr r0, _0802B250
	ldr r1, [r0]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802B24A:
	movs r0, #0
	b _0802B256
	.align 2, 0
_0802B250: .4byte 0x020229B0
_0802B254:
	movs r0, #1
_0802B256:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B1C0

	thumb_func_start sub_0802B25C
sub_0802B25C: @ 0x0802B25C
	push {r4, lr}
	ldr r4, _0802B270
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0802B274
	cmp r0, #1
	beq _0802B282
	b _0802B2B4
	.align 2, 0
_0802B270: .4byte 0x020229B0
_0802B274:
	movs r0, #0
	bl sub_0802AB08
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802B282:
	bl sub_0802B878
	cmp r0, #0
	bne _0802B2B4
	ldr r4, _0802B2B0
	ldr r2, [r4]
	ldr r0, [r2, #0x78]
	adds r1, r2, #0
	adds r1, #0x74
	ldrh r1, [r1]
	adds r2, #0x72
	ldrh r2, [r2]
	bl sub_0802E04C
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x45
	ldrb r1, [r1]
	adds r0, #0x42
	strh r1, [r0]
	movs r0, #0
	b _0802B2B6
	.align 2, 0
_0802B2B0: .4byte 0x020229B0
_0802B2B4:
	movs r0, #1
_0802B2B6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B25C

	thumb_func_start sub_0802B2BC
sub_0802B2BC: @ 0x0802B2BC
	push {r4, lr}
	ldr r4, _0802B2D0
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	beq _0802B2D4
	cmp r0, #1
	beq _0802B2E6
	b _0802B312
	.align 2, 0
_0802B2D0: .4byte 0x020229B0
_0802B2D4:
	bl sub_0802BA24
	cmp r0, #0
	bne _0802B312
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802B312
_0802B2E6:
	adds r0, r1, #0
	adds r0, #0x49
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802B312
	adds r0, r1, #0
	bl sub_0802A788
	bl Random
	ldr r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1, #0x24]
	adds r3, r1, #0
	adds r3, #0x72
	movs r2, #0
	strh r0, [r3]
	adds r1, #0x4c
	strb r2, [r1]
	movs r0, #0
	b _0802B314
_0802B312:
	movs r0, #1
_0802B314:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802B2BC

	thumb_func_start sub_0802B31C
sub_0802B31C: @ 0x0802B31C
	push {r4, lr}
	ldr r4, _0802B330
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0802B334
	cmp r0, #1
	beq _0802B34A
	b _0802B34E
	.align 2, 0
_0802B330: .4byte 0x020229B0
_0802B334:
	bl sub_0802BA24
	cmp r0, #0
	bne _0802B34E
	ldr r0, [r4]
	bl sub_0802A788
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0802B34A:
	movs r0, #0
	b _0802B350
_0802B34E:
	movs r0, #1
_0802B350:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802B31C

	thumb_func_start sub_0802B358
sub_0802B358: @ 0x0802B358
	push {r4, lr}
	ldr r4, _0802B370
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	cmp r0, #1
	beq _0802B380
	cmp r0, #1
	bgt _0802B374
	cmp r0, #0
	beq _0802B37A
	b _0802B3A4
	.align 2, 0
_0802B370: .4byte 0x020229B0
_0802B374:
	cmp r0, #2
	beq _0802B390
	b _0802B3A4
_0802B37A:
	movs r0, #1
	strh r0, [r1, #8]
	b _0802B3A4
_0802B380:
	movs r0, #0
	bl sub_0802AB08
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802B3A4
_0802B390:
	bl sub_0802B954
	cmp r0, #0
	bne _0802B3A4
	ldr r0, [r4]
	ldr r0, [r0]
	bl SetMainCallback2
	bl sub_0802A73C
_0802B3A4:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B358

	thumb_func_start sub_0802B3AC
sub_0802B3AC: @ 0x0802B3AC
	push {r4, lr}
	ldr r4, _0802B3C0
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0802B3C4
	cmp r0, #1
	beq _0802B3D4
	b _0802B3F0
	.align 2, 0
_0802B3C0: .4byte 0x020229B0
_0802B3C4:
	movs r0, #4
	bl sub_0802AB08
	ldr r1, [r4]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802B3F0
_0802B3D4:
	bl sub_0802B74C
	cmp r0, #0
	bne _0802B3F0
	ldr r0, [r4]
	ldrh r1, [r0, #0xe]
	adds r2, r0, #0
	adds r2, #0x72
	strh r1, [r2]
	adds r0, #0x4c
	movs r1, #8
	strb r1, [r0]
	movs r0, #0
	b _0802B3F2
_0802B3F0:
	movs r0, #1
_0802B3F2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B3AC

	thumb_func_start sub_0802B3F8
sub_0802B3F8: @ 0x0802B3F8
	push {lr}
	movs r0, #0
	bl sub_0802AB08
	bl sub_0802B74C
	cmp r0, #0
	beq _0802B40C
	movs r0, #1
	b _0802B40E
_0802B40C:
	movs r0, #0
_0802B40E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802B3F8

	thumb_func_start sub_0802B414
sub_0802B414: @ 0x0802B414
	push {r4, lr}
	ldr r1, _0802B42C
	ldr r0, [r1]
	ldrh r0, [r0, #8]
	adds r4, r1, #0
	cmp r0, #4
	bhi _0802B4CC
	lsls r0, r0, #2
	ldr r1, _0802B430
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B42C: .4byte 0x020229B0
_0802B430: .4byte 0x0802B434
_0802B434: @ jump table
	.4byte _0802B448 @ case 0
	.4byte _0802B464 @ case 1
	.4byte _0802B474 @ case 2
	.4byte _0802B48C @ case 3
	.4byte _0802B4B0 @ case 4
_0802B448:
	ldr r2, [r4]
	ldr r0, [r2, #0x78]
	adds r1, r2, #0
	adds r1, #0x74
	ldrh r1, [r1]
	adds r2, #0x72
	ldrh r2, [r2]
	bl sub_0802E04C
	movs r0, #5
	bl sub_0802CDBC
	ldr r1, [r4]
	b _0802B4A0
_0802B464:
	bl sub_0802CDE4
	cmp r0, #0
	bne _0802B4CC
	movs r0, #0
	bl sub_0802AB08
	b _0802B49C
_0802B474:
	bl sub_0802C400
	cmp r0, #0
	beq _0802B4CC
	ldr r0, _0802B488
	movs r1, #6
	bl CreateTask
	b _0802B49C
	.align 2, 0
_0802B488: .4byte 0x081535C5
_0802B48C:
	ldr r0, _0802B4A8
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B4CC
	bl sub_0802D704
_0802B49C:
	ldr r0, _0802B4AC
	ldr r1, [r0]
_0802B4A0:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0802B4CC
	.align 2, 0
_0802B4A8: .4byte 0x081535C5
_0802B4AC: .4byte 0x020229B0
_0802B4B0:
	bl sub_0802D734
	cmp r0, #0
	bne _0802B4CC
	ldr r0, _0802B4C8
	ldr r0, [r0]
	adds r0, #0x4c
	movs r1, #4
	strb r1, [r0]
	movs r0, #0
	b _0802B4CE
	.align 2, 0
_0802B4C8: .4byte 0x020229B0
_0802B4CC:
	movs r0, #1
_0802B4CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B414

	thumb_func_start sub_0802B4D4
sub_0802B4D4: @ 0x0802B4D4
	push {r4, r5, lr}
	ldr r1, _0802B4EC
	ldr r0, [r1]
	ldrh r0, [r0, #0xa]
	adds r4, r1, #0
	cmp r0, #7
	bhi _0802B5B8
	lsls r0, r0, #2
	ldr r1, _0802B4F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B4EC: .4byte 0x020229B0
_0802B4F0: .4byte 0x0802B4F4
_0802B4F4: @ jump table
	.4byte _0802B514 @ case 0
	.4byte _0802B520 @ case 1
	.4byte _0802B540 @ case 2
	.4byte _0802B55A @ case 3
	.4byte _0802B56C @ case 4
	.4byte _0802B574 @ case 5
	.4byte _0802B594 @ case 6
	.4byte _0802B5AE @ case 7
_0802B514:
	movs r0, #2
	bl sub_0802CDBC
	bl sub_0802DAD8
	b _0802B584
_0802B520:
	bl sub_0802CDE4
	adds r5, r0, #0
	cmp r5, #0
	bne _0802B5B8
	ldr r4, _0802B53C
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	bl sub_0802DAEC
	ldr r1, [r4]
	strh r5, [r1, #0x3c]
	b _0802B588
	.align 2, 0
_0802B53C: .4byte 0x020229B0
_0802B540:
	ldr r1, [r4]
	ldrh r0, [r1, #0x3c]
	adds r0, #1
	strh r0, [r1, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x78
	bls _0802B5B8
	movs r0, #3
	bl sub_0802CDBC
	ldr r1, [r4]
	b _0802B588
_0802B55A:
	bl sub_0802CDE4
	cmp r0, #1
	beq _0802B5B8
	bl sub_0802DB00
	cmp r0, #1
	beq _0802B5B8
	b _0802B584
_0802B56C:
	movs r0, #9
	bl sub_0802CDBC
	b _0802B584
_0802B574:
	bl sub_0802CDE4
	cmp r0, #0
	bne _0802B5B8
	bl sub_0802BF54
	bl sub_0802D458
_0802B584:
	ldr r0, _0802B590
	ldr r1, [r0]
_0802B588:
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	b _0802B5B8
	.align 2, 0
_0802B590: .4byte 0x020229B0
_0802B594:
	bl sub_0802D47C
	cmp r0, #0
	bne _0802B5B8
	bl sub_0802BF64
	bl sub_0802BB94
	ldr r0, _0802B5B4
	ldr r1, [r0]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
_0802B5AE:
	movs r0, #0
	b _0802B5BA
	.align 2, 0
_0802B5B4: .4byte 0x020229B0
_0802B5B8:
	movs r0, #1
_0802B5BA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B4D4

	thumb_func_start sub_0802B5C0
sub_0802B5C0: @ 0x0802B5C0
	push {r4, r5, lr}
	bl sub_0802BBD8
	ldr r5, _0802B5D8
	ldr r1, [r5]
	ldrh r4, [r1, #0x36]
	cmp r4, #0
	beq _0802B5DC
	movs r0, #0
	strh r0, [r1, #0x36]
	b _0802B650
	.align 2, 0
_0802B5D8: .4byte 0x020229B0
_0802B5DC:
	ldrh r0, [r1, #0xa]
	cmp r0, #1
	beq _0802B608
	cmp r0, #1
	bgt _0802B5EC
	cmp r0, #0
	beq _0802B5F6
	b _0802B64E
_0802B5EC:
	cmp r0, #2
	beq _0802B62C
	cmp r0, #3
	beq _0802B640
	b _0802B64E
_0802B5F6:
	movs r0, #0
	bl sub_0802BE24
	cmp r0, #0
	beq _0802B64E
	ldr r1, [r5]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
_0802B608:
	ldr r0, _0802B624
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B64E
	bl sub_0802BE58
	movs r0, #3
	bl sub_0802AB08
	ldr r0, _0802B628
	ldr r1, [r0]
	b _0802B638
	.align 2, 0
_0802B624: .4byte 0x03002360
_0802B628: .4byte 0x020229B0
_0802B62C:
	movs r0, #1
	bl sub_0802BE24
	cmp r0, #1
	bne _0802B64E
	ldr r1, [r5]
_0802B638:
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	b _0802B64E
_0802B640:
	movs r0, #0
	bl sub_0802BE24
	cmp r0, #1
	bne _0802B64E
	ldr r0, [r5]
	strh r4, [r0, #0xa]
_0802B64E:
	movs r0, #1
_0802B650:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802B5C0

	thumb_func_start sub_0802B658
sub_0802B658: @ 0x0802B658
	push {r4, r5, r6, lr}
	ldr r1, _0802B670
	ldr r0, [r1]
	ldrh r0, [r0, #0xa]
	adds r5, r1, #0
	cmp r0, #4
	bhi _0802B744
	lsls r0, r0, #2
	ldr r1, _0802B674
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B670: .4byte 0x020229B0
_0802B674: .4byte 0x0802B678
_0802B678: @ jump table
	.4byte _0802B68C @ case 0
	.4byte _0802B6B0 @ case 1
	.4byte _0802B6F4 @ case 2
	.4byte _0802B718 @ case 3
	.4byte _0802B73A @ case 4
_0802B68C:
	movs r4, #0
	ldr r0, [r5]
	ldrb r0, [r0, #5]
	cmp r4, r0
	bge _0802B6AC
	adds r6, r5, #0
_0802B698:
	adds r0, r4, #0
	bl sub_0802DAB0
	cmp r0, #1
	beq _0802B744
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #5]
	cmp r4, r0
	blt _0802B698
_0802B6AC:
	ldr r1, [r5]
	b _0802B710
_0802B6B0:
	movs r4, #0
	ldr r0, [r5]
	ldrb r0, [r0, #5]
	cmp r4, r0
	bge _0802B6E0
	adds r6, r5, #0
	movs r5, #0
_0802B6BE:
	ldr r0, [r6]
	adds r0, r0, r5
	ldr r1, _0802B6EC
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #2
	bne _0802B6D4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0802DA98
_0802B6D4:
	adds r5, #0x24
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #5]
	cmp r4, r0
	blt _0802B6BE
_0802B6E0:
	movs r0, #1
	bl sub_0802CDBC
	ldr r0, _0802B6F0
	ldr r1, [r0]
	b _0802B70C
	.align 2, 0
_0802B6EC: .4byte 0x000082F4
_0802B6F0: .4byte 0x020229B0
_0802B6F4:
	ldr r1, [r5]
	ldrh r0, [r1, #0x3c]
	adds r0, #1
	strh r0, [r1, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x64
	bls _0802B744
	movs r0, #3
	bl sub_0802CDBC
	ldr r1, [r5]
_0802B70C:
	movs r0, #0
	strh r0, [r1, #0x3c]
_0802B710:
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	b _0802B744
_0802B718:
	bl sub_0802CDE4
	adds r5, r0, #0
	cmp r5, #0
	bne _0802B744
	bl sub_0802DAC4
	ldr r4, _0802B740
	ldr r0, [r4]
	adds r0, #0x71
	strb r5, [r0]
	bl sub_0802BE08
	ldr r1, [r4]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
_0802B73A:
	movs r0, #0
	b _0802B746
	.align 2, 0
_0802B740: .4byte 0x020229B0
_0802B744:
	movs r0, #1
_0802B746:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B658

	thumb_func_start sub_0802B74C
sub_0802B74C: @ 0x0802B74C
	push {r4, lr}
	ldr r1, _0802B768
	ldr r0, [r1]
	ldrh r0, [r0, #0xa]
	adds r4, r1, #0
	cmp r0, #6
	bls _0802B75C
	b _0802B870
_0802B75C:
	lsls r0, r0, #2
	ldr r1, _0802B76C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B768: .4byte 0x020229B0
_0802B76C: .4byte 0x0802B770
_0802B770: @ jump table
	.4byte _0802B78C @ case 0
	.4byte _0802B7AC @ case 1
	.4byte _0802B7C4 @ case 2
	.4byte _0802B7F4 @ case 3
	.4byte _0802B7AC @ case 4
	.4byte _0802B7C4 @ case 5
	.4byte _0802B864 @ case 6
_0802B78C:
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x72
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x3e
	adds r2, #0x40
	bl sub_0802C4FC
	ldr r1, [r4]
	ldrh r0, [r1, #0x3e]
	adds r1, #0x40
	ldrh r1, [r1]
	bl sub_0802D4DC
	b _0802B7E4
_0802B7AC:
	bl sub_0802D664
	adds r2, r0, #0
	cmp r2, #0
	bne _0802B870
	ldr r0, _0802B7C0
	ldr r1, [r0]
	strh r2, [r1, #0x3c]
	b _0802B7E6
	.align 2, 0
_0802B7C0: .4byte 0x020229B0
_0802B7C4:
	ldr r1, [r4]
	ldrh r0, [r1, #0x3c]
	adds r2, r0, #1
	strh r2, [r1, #0x3c]
	ldr r0, _0802B7F0
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0802B7E0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb4
	bls _0802B870
_0802B7E0:
	bl sub_0802D704
_0802B7E4:
	ldr r1, [r4]
_0802B7E6:
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	b _0802B870
	.align 2, 0
_0802B7F0: .4byte 0x03002360
_0802B7F4:
	bl sub_0802D734
	cmp r0, #0
	bne _0802B870
	ldr r4, _0802B840
	ldr r1, [r4]
	ldrh r0, [r1, #0x3e]
	adds r1, #0x40
	ldrh r1, [r1]
	bl sub_0802C574
	ldr r1, [r4]
	adds r2, r1, #0
	adds r2, #0x40
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0802B84C
	ldrh r0, [r1, #0x3e]
	ldrh r1, [r2]
	bl AddBagItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B84C
	ldr r0, [r4]
	ldrh r0, [r0, #0x3e]
	movs r1, #1
	bl CheckBagHasSpace
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B844
	ldr r0, [r4]
	ldrh r0, [r0, #0x3e]
	bl sub_0802D574
	b _0802B856
	.align 2, 0
_0802B840: .4byte 0x020229B0
_0802B844:
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #0xa]
	b _0802B870
_0802B84C:
	ldr r4, _0802B860
	ldr r0, [r4]
	ldrh r0, [r0, #0x3e]
	bl sub_0802D5EC
_0802B856:
	ldr r1, [r4]
	movs r0, #4
	strh r0, [r1, #0xa]
	b _0802B870
	.align 2, 0
_0802B860: .4byte 0x020229B0
_0802B864:
	bl sub_0802D734
	cmp r0, #0
	bne _0802B870
	movs r0, #0
	b _0802B872
_0802B870:
	movs r0, #1
_0802B872:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B74C

	thumb_func_start sub_0802B878
sub_0802B878: @ 0x0802B878
	push {r4, lr}
	ldr r0, _0802B890
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	cmp r0, #6
	bhi _0802B94C
	lsls r0, r0, #2
	ldr r1, _0802B894
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B890: .4byte 0x020229B0
_0802B894: .4byte 0x0802B898
_0802B898: @ jump table
	.4byte _0802B8B4 @ case 0
	.4byte _0802B8B8 @ case 1
	.4byte _0802B8C2 @ case 2
	.4byte _0802B910 @ case 3
	.4byte _0802B91A @ case 4
	.4byte _0802B930 @ case 5
	.4byte _0802B942 @ case 6
_0802B8B4:
	movs r0, #4
	b _0802B91C
_0802B8B8:
	bl sub_0802CDE4
	cmp r0, #0
	bne _0802B94C
	b _0802B920
_0802B8C2:
	bl sub_0802D77C
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0802B8F8
	cmp r1, #0
	bgt _0802B8DC
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0802B8E0
	b _0802B94C
_0802B8DC:
	cmp r1, #1
	bne _0802B94C
_0802B8E0:
	ldr r4, _0802B8F4
	ldr r0, [r4]
	adds r0, #0x45
	movs r1, #1
	strb r1, [r0]
	movs r0, #6
	bl sub_0802CDBC
	ldr r1, [r4]
	b _0802B924
	.align 2, 0
_0802B8F4: .4byte 0x020229B0
_0802B8F8:
	ldr r4, _0802B90C
	ldr r0, [r4]
	adds r0, #0x45
	movs r1, #2
	strb r1, [r0]
	movs r0, #6
	bl sub_0802CDBC
	ldr r1, [r4]
	b _0802B924
	.align 2, 0
_0802B90C: .4byte 0x020229B0
_0802B910:
	bl sub_0802CDE4
	cmp r0, #0
	bne _0802B94C
	b _0802B920
_0802B91A:
	movs r0, #8
_0802B91C:
	bl sub_0802CDBC
_0802B920:
	ldr r0, _0802B92C
	ldr r1, [r0]
_0802B924:
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	b _0802B94C
	.align 2, 0
_0802B92C: .4byte 0x020229B0
_0802B930:
	bl sub_0802CDE4
	cmp r0, #0
	bne _0802B94C
	ldr r0, _0802B948
	ldr r1, [r0]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
_0802B942:
	movs r0, #0
	b _0802B94E
	.align 2, 0
_0802B948: .4byte 0x020229B0
_0802B94C:
	movs r0, #1
_0802B94E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802B878

	thumb_func_start sub_0802B954
sub_0802B954: @ 0x0802B954
	push {r4, lr}
	sub sp, #4
	ldr r1, _0802B970
	ldr r0, [r1]
	ldrh r0, [r0, #0xa]
	adds r4, r1, #0
	cmp r0, #5
	bhi _0802BA18
	lsls r0, r0, #2
	ldr r1, _0802B974
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B970: .4byte 0x020229B0
_0802B974: .4byte 0x0802B978
_0802B978: @ jump table
	.4byte _0802B990 @ case 0
	.4byte _0802B996 @ case 1
	.4byte _0802B9A6 @ case 2
	.4byte _0802B9BC @ case 3
	.4byte _0802B9E2 @ case 4
	.4byte _0802BA08 @ case 5
_0802B990:
	bl sub_0802D704
	b _0802B9F2
_0802B996:
	bl sub_0802D734
	cmp r0, #0
	bne _0802BA18
	movs r0, #7
	bl sub_0802CDBC
	b _0802B9F2
_0802B9A6:
	bl sub_0802CDE4
	adds r2, r0, #0
	cmp r2, #0
	bne _0802BA18
	ldr r0, _0802B9B8
	ldr r1, [r0]
	strh r2, [r1, #0x3c]
	b _0802B9F6
	.align 2, 0
_0802B9B8: .4byte 0x020229B0
_0802B9BC:
	ldr r1, [r4]
	ldrh r0, [r1, #0x3c]
	adds r0, #1
	strh r0, [r1, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x78
	bls _0802BA18
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	b _0802B9F6
_0802B9E2:
	ldr r0, _0802BA00
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802BA18
	bl sub_0800A7F8
_0802B9F2:
	ldr r0, _0802BA04
	ldr r1, [r0]
_0802B9F6:
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	b _0802BA18
	.align 2, 0
_0802BA00: .4byte 0x02037C74
_0802BA04: .4byte 0x020229B0
_0802BA08:
	ldr r0, _0802BA14
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802BA18
	movs r0, #0
	b _0802BA1A
	.align 2, 0
_0802BA14: .4byte 0x030031C4
_0802BA18:
	movs r0, #1
_0802BA1A:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802B954

	thumb_func_start sub_0802BA24
sub_0802BA24: @ 0x0802BA24
	push {r4, lr}
	ldr r4, _0802BA3C
	ldr r0, [r4]
	ldrh r0, [r0, #0xa]
	cmp r0, #1
	beq _0802BA5A
	cmp r0, #1
	bgt _0802BA40
	cmp r0, #0
	beq _0802BA46
	b _0802BA6E
	.align 2, 0
_0802BA3C: .4byte 0x020229B0
_0802BA40:
	cmp r0, #2
	beq _0802BA6A
	b _0802BA6E
_0802BA46:
	bl sub_0802D704
	movs r0, #0
	bl sub_0802DA5C
	ldr r1, [r4]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
	b _0802BA6E
_0802BA5A:
	bl sub_0802D734
	cmp r0, #0
	bne _0802BA6E
	ldr r1, [r4]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xa]
_0802BA6A:
	movs r0, #0
	b _0802BA70
_0802BA6E:
	movs r0, #1
_0802BA70:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802BA24

	thumb_func_start sub_0802BA78
sub_0802BA78: @ 0x0802BA78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r0, r0, #2
	add r0, sl
	lsls r0, r0, #3
	ldr r1, _0802BAAC
	adds r6, r0, r1
	mov r0, sl
	movs r1, #0xe
	bl GetWordTaskArg
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _0802BABC
	cmp r0, #1
	beq _0802BAD0
	b _0802BB3C
	.align 2, 0
_0802BAAC: .4byte 0x03005B68
_0802BAB0:
	bl sub_0802A814
	mov r0, sl
	bl DestroyTask
	b _0802BB3C
_0802BABC:
	movs r1, #0
	adds r0, r6, #0
	adds r0, #8
_0802BAC2:
	strh r1, [r0, #4]
	subs r0, #2
	cmp r0, r6
	bge _0802BAC2
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
_0802BAD0:
	mov r3, r8
	ldrb r1, [r3, #6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0802BB4C
	adds r0, r0, r4
	add r0, r8
	bl sub_0802DDA4
	movs r2, #0
	adds r5, r6, #4
	mov sb, r2
	movs r7, #0x83
	lsls r7, r7, #8
	add r7, r8
	add r4, r8
_0802BAF2:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0802BB2C
	adds r0, r2, #0
	adds r1, r4, #0
	str r2, [sp]
	bl sub_0802DDC8
	ldr r2, [sp]
	cmp r0, #0
	beq _0802BB2C
	ldr r1, _0802BB50
	add r1, sb
	adds r0, r7, #0
	bl StringCopy
	movs r0, #1
	strh r0, [r5]
	ldrh r0, [r6, #2]
	adds r0, #1
	strh r0, [r6, #2]
	movs r3, #2
	ldrsh r0, [r6, r3]
	ldr r2, [sp]
	mov r1, r8
	ldrb r1, [r1, #5]
	cmp r0, r1
	beq _0802BAB0
_0802BB2C:
	adds r5, #2
	movs r3, #0x1c
	add sb, r3
	adds r7, #0x24
	adds r4, #0xc
	adds r2, #1
	cmp r2, #4
	ble _0802BAF2
_0802BB3C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BB4C: .4byte 0x000082A8
_0802BB50: .4byte 0x020226A8
	thumb_func_end sub_0802BA78

	thumb_func_start sub_0802BB54
sub_0802BB54: @ 0x0802BB54
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0802BB70
	ldr r2, [r1]
	movs r1, #0xe
	bl SetWordTaskArg
	pop {r0}
	bx r0
	.align 2, 0
_0802BB70: .4byte 0x020229B0
	thumb_func_end sub_0802BB54

	thumb_func_start sub_0802BB74
sub_0802BB74: @ 0x0802BB74
	ldr r0, _0802BB90
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x4a
	movs r1, #0
	strh r1, [r0]
	movs r0, #6
	str r0, [r2, #0x14]
	strh r1, [r2, #0x34]
	str r1, [r2, #0x1c]
	strh r1, [r2, #0x36]
	str r1, [r2, #0x10]
	bx lr
	.align 2, 0
_0802BB90: .4byte 0x020229B0
	thumb_func_end sub_0802BB74

	thumb_func_start sub_0802BB94
sub_0802BB94: @ 0x0802BB94
	push {r4, lr}
	ldr r3, _0802BBD0
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x4a
	movs r4, #0
	movs r2, #0
	strh r2, [r1]
	ldr r1, _0802BBD4
	strh r1, [r0, #0x34]
	movs r1, #7
	str r1, [r0, #0x14]
	strh r2, [r0, #0x36]
	str r2, [r0, #0x10]
	adds r0, #0x51
	strb r4, [r0]
	ldr r0, [r3]
	adds r0, #0x50
	strb r4, [r0]
	ldr r0, [r3]
	str r2, [r0, #0x20]
	adds r1, r0, #0
	adds r1, #0x4e
	strh r2, [r1]
	str r2, [r0, #0x6c]
	bl sub_0802BC70
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BBD0: .4byte 0x020229B0
_0802BBD4: .4byte 0x000006FF
	thumb_func_end sub_0802BB94

	thumb_func_start sub_0802BBD8
sub_0802BBD8: @ 0x0802BBD8
	push {r4, lr}
	ldr r4, _0802BC30
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802BC28
	adds r1, #0x4a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bl sub_0802BC3C
	ldr r3, [r4]
	ldrh r1, [r3, #0x34]
	adds r2, r1, r0
	strh r2, [r3, #0x34]
	lsls r1, r2, #0x10
	ldr r0, _0802BC34
	cmp r1, r0
	bls _0802BC0A
	ldr r1, _0802BC38
	adds r0, r2, r1
	strh r0, [r3, #0x34]
_0802BC0A:
	ldr r1, [r4]
	ldr r2, [r1, #0x14]
	str r2, [r1, #0x18]
	ldrh r0, [r1, #0x34]
	lsrs r0, r0, #8
	str r0, [r1, #0x14]
	cmp r0, #6
	bls _0802BC28
	cmp r2, #6
	bhi _0802BC28
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
	bl sub_0802BC70
_0802BC28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BC30: .4byte 0x020229B0
_0802BC34: .4byte 0x09FE0000
_0802BC38: .4byte 0xFFFFF601
	thumb_func_end sub_0802BBD8

	thumb_func_start sub_0802BC3C
sub_0802BC3C: @ 0x0802BC3C
	push {lr}
	ldr r0, _0802BC4C
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	beq _0802BC50
	movs r0, #0
	b _0802BC66
	.align 2, 0
_0802BC4C: .4byte 0x020229B0
_0802BC50:
	ldr r3, [r2, #0x1c]
	ldrh r1, [r2, #0x34]
	ldr r0, _0802BC6C
	cmp r1, r0
	bhi _0802BC64
	ldr r0, [r2, #0x20]
	adds r0, #0x50
	str r0, [r2, #0x20]
	lsrs r0, r0, #8
	adds r3, r3, r0
_0802BC64:
	adds r0, r3, #0
_0802BC66:
	pop {r1}
	bx r1
	.align 2, 0
_0802BC6C: .4byte 0x000005FF
	thumb_func_end sub_0802BC3C

	thumb_func_start sub_0802BC70
sub_0802BC70: @ 0x0802BC70
	push {r4, lr}
	ldr r4, _0802BCA0
	ldr r3, [r4]
	movs r0, #0
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x4e
	ldrh r0, [r1]
	cmp r0, #0
	beq _0802BCB4
	subs r0, #1
	strh r0, [r1]
	ldr r0, [r3, #0x6c]
	cmp r0, #0
	beq _0802BD7E
	bl sub_0802BD8C
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0802BCA4
	ldr r1, [r4]
	b _0802BD7A
	.align 2, 0
_0802BCA0: .4byte 0x020229B0
_0802BCA4:
	ldr r1, [r4]
	ldr r0, [r1, #0x28]
	cmp r0, #0x36
	bls _0802BCB0
	movs r0, #0x1e
	b _0802BD7C
_0802BCB0:
	movs r0, #0x52
	b _0802BD7C
_0802BCB4:
	adds r2, r3, #0
	adds r2, #0x50
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0802BD08
	ldr r0, _0802BD00
	ldrb r1, [r2]
	lsls r1, r1, #1
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x51
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [r3, #0x28]
	bl sub_0802BD8C
	ldr r2, [r4]
	ldr r3, _0802BD04
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	adds r0, #2
	adds r1, r2, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r2, #0x50
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _0802BD76
	.align 2, 0
_0802BD00: .4byte 0x082CEEC8
_0802BD04: .4byte 0x082CEED8
_0802BD08:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _0802BD24
	adds r1, r3, #0
	adds r1, #0x51
	ldrb r0, [r1]
	cmp r0, #2
	bhi _0802BD20
	adds r0, #1
	strb r0, [r1]
	b _0802BD24
_0802BD20:
	movs r0, #1
	str r0, [r3, #0x6c]
_0802BD24:
	ldr r2, _0802BD84
	ldr r4, _0802BD88
	ldr r0, [r4]
	mov ip, r0
	mov r3, ip
	adds r3, #0x50
	ldrb r0, [r3]
	movs r1, #0xf
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r0, ip
	adds r0, #0x51
	ldrb r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	mov r1, ip
	str r0, [r1, #0x28]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _0802BD76
	bl sub_0802BD8C
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0802BD6E
	ldr r1, [r4]
	ldr r0, [r1, #0x28]
	subs r0, #5
	str r0, [r1, #0x28]
_0802BD6E:
	ldr r0, [r4]
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
_0802BD76:
	ldr r0, _0802BD88
	ldr r1, [r0]
_0802BD7A:
	ldr r0, [r1, #0x28]
_0802BD7C:
	str r0, [r1, #0x1c]
_0802BD7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BD84: .4byte 0x082CEEC8
_0802BD88: .4byte 0x020229B0
	thumb_func_end sub_0802BC70

	thumb_func_start sub_0802BD8C
sub_0802BD8C: @ 0x0802BD8C
	ldr r0, _0802BDA0
	ldr r2, [r0]
	ldr r1, [r2, #0x24]
	ldr r0, _0802BDA4
	muls r0, r1, r0
	ldr r1, _0802BDA8
	adds r0, r0, r1
	str r0, [r2, #0x24]
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0802BDA0: .4byte 0x020229B0
_0802BDA4: .4byte 0x41C64E6D
_0802BDA8: .4byte 0x00006073
	thumb_func_end sub_0802BD8C

	thumb_func_start sub_0802BDAC
sub_0802BDAC: @ 0x0802BDAC
	push {lr}
	ldr r0, _0802BDC8
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x10]
	movs r0, #6
	str r0, [r1, #0x14]
	ldr r0, _0802BDCC
	strh r0, [r1, #0x34]
	bl sub_0802BF64
	pop {r0}
	bx r0
	.align 2, 0
_0802BDC8: .4byte 0x020229B0
_0802BDCC: .4byte 0x000005FF
	thumb_func_end sub_0802BDAC

	thumb_func_start sub_0802BDD0
sub_0802BDD0: @ 0x0802BDD0
	ldr r0, _0802BDD8
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
_0802BDD8: .4byte 0x020229B0
	thumb_func_end sub_0802BDD0

	thumb_func_start sub_0802BDDC
sub_0802BDDC: @ 0x0802BDDC
	push {r4, r5, lr}
	ldr r5, _0802BE00
	ldr r4, _0802BE04
	movs r3, #0
	movs r2, #0
	movs r1, #4
_0802BDE8:
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, r0, r2
	str r3, [r0]
	adds r2, #0x24
	subs r1, #1
	cmp r1, #0
	bge _0802BDE8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE00: .4byte 0x020229B0
_0802BE04: .4byte 0x000082F8
	thumb_func_end sub_0802BDDC

	thumb_func_start sub_0802BE08
sub_0802BE08: @ 0x0802BE08
	ldr r0, _0802BE1C
	ldr r0, [r0]
	ldr r1, _0802BE20
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0
	strh r2, [r1, #0x10]
	ldr r0, [r0]
	strh r2, [r0, #0x12]
	bx lr
	.align 2, 0
_0802BE1C: .4byte 0x020229B0
_0802BE20: .4byte 0x00008398
	thumb_func_end sub_0802BE08

	thumb_func_start sub_0802BE24
sub_0802BE24: @ 0x0802BE24
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0802BE48
	ldr r2, [r1]
	ldrb r3, [r2, #6]
	lsls r1, r3, #3
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r2, r2, r1
	ldr r1, _0802BE4C
	adds r2, r2, r1
	ldrh r1, [r2]
	cmp r1, r0
	beq _0802BE50
	movs r0, #0
	b _0802BE52
	.align 2, 0
_0802BE48: .4byte 0x020229B0
_0802BE4C: .4byte 0x000082F4
_0802BE50:
	movs r0, #1
_0802BE52:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802BE24

	thumb_func_start sub_0802BE58
sub_0802BE58: @ 0x0802BE58
	ldr r0, _0802BE78
	ldr r0, [r0]
	ldr r1, _0802BE7C
	adds r2, r0, r1
	ldr r1, [r2]
	adds r0, #0x4a
	ldrh r0, [r0]
	strh r0, [r1, #0xe]
	ldr r1, [r2]
	ldrh r0, [r1, #0x10]
	strh r0, [r1, #0x12]
	ldr r1, [r2]
	movs r0, #1
	strh r0, [r1, #0x10]
	bx lr
	.align 2, 0
_0802BE78: .4byte 0x020229B0
_0802BE7C: .4byte 0x00008398
	thumb_func_end sub_0802BE58

	thumb_func_start sub_0802BE80
sub_0802BE80: @ 0x0802BE80
	push {r4, lr}
	ldr r0, _0802BEA8
	ldr r2, [r0]
	ldr r0, _0802BEAC
	adds r3, r2, r0
	ldr r1, [r3]
	ldrh r0, [r1, #0x10]
	strh r0, [r1, #0x12]
	ldr r0, [r3]
	movs r4, #2
	strh r4, [r0, #0x10]
	ldr r1, [r3]
	adds r2, #0x4a
	ldrh r0, [r2]
	strh r0, [r1, #0xe]
	ldr r0, [r3]
	str r4, [r0, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BEA8: .4byte 0x020229B0
_0802BEAC: .4byte 0x00008398
	thumb_func_end sub_0802BE80

	thumb_func_start sub_0802BEB0
sub_0802BEB0: @ 0x0802BEB0
	ldr r0, _0802BEC8
	ldr r0, [r0]
	ldr r1, _0802BECC
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r2, [r1, #0x10]
	movs r3, #0
	strh r2, [r1, #0x12]
	ldr r0, [r0]
	strh r3, [r0, #0x10]
	bx lr
	.align 2, 0
_0802BEC8: .4byte 0x020229B0
_0802BECC: .4byte 0x00008398
	thumb_func_end sub_0802BEB0

	thumb_func_start sub_0802BED0
sub_0802BED0: @ 0x0802BED0
	push {r4, r5, lr}
	ldr r4, _0802BF2C
	ldr r1, [r4]
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _0802BF10
	ldr r0, [r1, #0x78]
	bl sub_0802DA5C
	ldr r1, [r4]
	movs r5, #0
	str r5, [r1, #0x5c]
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802BF10
	adds r0, r1, #0
	adds r0, #0x71
	ldrb r0, [r0]
	bl sub_0802D9C4
	ldr r1, _0802BF30
	subs r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl PlaySE
	ldr r0, [r4]
	adds r0, #0x4d
	strb r5, [r0]
_0802BF10:
	ldr r0, _0802BF2C
	ldr r0, [r0]
	adds r0, #0x74
	ldrh r0, [r0]
	bl sub_0802DA6C
	bl sub_0802BF74
	bl sub_0802BF34
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BF2C: .4byte 0x020229B0
_0802BF30: .4byte 0x082CEEE0
	thumb_func_end sub_0802BED0

	thumb_func_start sub_0802BF34
sub_0802BF34: @ 0x0802BF34
	push {lr}
	ldr r0, _0802BF50
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802BF4A
	ldr r0, [r1, #0x14]
	bl sub_0802D994
_0802BF4A:
	pop {r0}
	bx r0
	.align 2, 0
_0802BF50: .4byte 0x020229B0
	thumb_func_end sub_0802BF34

	thumb_func_start sub_0802BF54
sub_0802BF54: @ 0x0802BF54
	ldr r0, _0802BF60
	ldr r0, [r0]
	adds r0, #0x46
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BF60: .4byte 0x020229B0
	thumb_func_end sub_0802BF54

	thumb_func_start sub_0802BF64
sub_0802BF64: @ 0x0802BF64
	ldr r0, _0802BF70
	ldr r0, [r0]
	adds r0, #0x46
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802BF70: .4byte 0x020229B0
	thumb_func_end sub_0802BF64

	thumb_func_start sub_0802BF74
sub_0802BF74: @ 0x0802BF74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r2, _0802BFB0
	ldr r0, [r2]
	ldrb r0, [r0, #5]
	mov sb, r0
	movs r5, #0
	cmp r6, sb
	bge _0802C054
	mov sl, r2
	mov r8, r5
	movs r7, #0
_0802BF96:
	mov r0, sl
	ldr r3, [r0]
	adds r1, r3, r7
	ldr r2, _0802BFB4
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r2, #1
	beq _0802BFC8
	cmp r2, #1
	bgt _0802BFB8
	cmp r2, #0
	beq _0802BFBE
	b _0802C048
	.align 2, 0
_0802BFB0: .4byte 0x020229B0
_0802BFB4: .4byte 0x000082F4
_0802BFB8:
	cmp r2, #2
	beq _0802C02C
	b _0802C048
_0802BFBE:
	adds r0, r5, #0
	movs r1, #0
	bl sub_0802D978
	b _0802C048
_0802BFC8:
	ldr r0, _0802C01C
	adds r4, r1, r0
	ldrh r0, [r4]
	cmp r0, #1
	bne _0802BFEA
	ldr r0, _0802C020
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x9a
	add r1, r8
	str r1, [sp]
	ldrh r1, [r0]
	mov ip, r1
	ldr r0, [sp]
	ldrh r0, [r0]
	cmp ip, r0
	beq _0802C012
_0802BFEA:
	ldrb r3, [r3, #6]
	cmp r5, r3
	bne _0802BFF2
	strh r2, [r4]
_0802BFF2:
	orrs r6, r2
	mov r1, sl
	ldr r2, [r1]
	ldr r1, _0802C024
	adds r0, r2, r1
	adds r0, r0, r7
	ldr r1, _0802C028
	str r1, [r0]
	adds r1, r2, #0
	adds r1, #0x9a
	add r1, r8
	adds r2, r2, r7
	ldr r0, _0802C020
	adds r2, r2, r0
	ldrh r0, [r2]
	strh r0, [r1]
_0802C012:
	adds r0, r5, #0
	bl sub_0802C08C
	b _0802C048
	.align 2, 0
_0802C01C: .4byte 0x000082F6
_0802C020: .4byte 0x000082F2
_0802C024: .4byte 0x000082E8
_0802C028: .4byte 0x7FFFFFFF
_0802C02C:
	ldr r0, _0802C068
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #2
	beq _0802C048
	ldrb r3, [r3, #6]
	cmp r5, r3
	bne _0802C03E
	strh r2, [r1]
_0802C03E:
	orrs r6, r2
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_0802DA80
_0802C048:
	movs r1, #2
	add r8, r1
	adds r7, #0x24
	adds r5, #1
	cmp r5, sb
	blt _0802BF96
_0802C054:
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _0802C06C
	movs r0, #0x83
	lsls r0, r0, #1
	bl PlaySE
	b _0802C07A
	.align 2, 0
_0802C068: .4byte 0x000082F6
_0802C06C:
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	beq _0802C07A
	movs r0, #0xa
	bl PlaySE
_0802C07A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802BF74

	thumb_func_start sub_0802C08C
sub_0802C08C: @ 0x0802C08C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0802C0B8
	ldr r2, [r0]
	ldr r0, [r2, #0x68]
	cmp r0, #0
	bne _0802C126
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	ldr r1, _0802C0BC
	adds r0, r0, r1
	adds r5, r2, r0
	ldr r1, [r5, #4]
	ldr r0, _0802C0C0
	cmp r1, r0
	beq _0802C0C4
	adds r0, r1, #1
	str r0, [r5, #4]
	adds r3, r0, #0
	b _0802C0DC
	.align 2, 0
_0802C0B8: .4byte 0x020229B0
_0802C0BC: .4byte 0x000082E4
_0802C0C0: .4byte 0x7FFFFFFF
_0802C0C4:
	adds r0, r2, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	ldrh r0, [r5, #0xe]
	subs r3, r1, r0
	ldr r0, _0802C0FC
	cmp r3, r0
	ble _0802C0DA
	ldr r0, _0802C100
	adds r3, r3, r0
	adds r3, r3, r1
_0802C0DA:
	str r3, [r5, #4]
_0802C0DC:
	cmp r3, #3
	ble _0802C126
	subs r3, #4
	cmp r3, #0x2f
	bgt _0802C108
	ldr r2, _0802C104
	ldrh r1, [r5, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r3, r0
	adds r0, r0, r2
	movs r4, #0
	ldrsb r4, [r0, r4]
	b _0802C10A
	.align 2, 0
_0802C0FC: .4byte 0x0000FDE7
_0802C100: .4byte 0xFFFF0218
_0802C104: .4byte 0x082CEEE8
_0802C108:
	movs r4, #0
_0802C10A:
	adds r1, r4, #0
	adds r0, r6, #0
	bl sub_0802D978
	cmp r4, #0
	bne _0802C124
	ldr r0, _0802C12C
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r6, r0
	bne _0802C124
	bl sub_0802BEB0
_0802C124:
	str r4, [r5]
_0802C126:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C12C: .4byte 0x020229B0
	thumb_func_end sub_0802C08C

	thumb_func_start sub_0802C130
sub_0802C130: @ 0x0802C130
	push {r4, r5, lr}
	ldr r5, _0802C15C
	ldr r1, [r5]
	ldr r0, [r1, #0x14]
	cmp r0, #8
	bne _0802C1C2
	ldr r0, [r1, #0x18]
	cmp r0, #7
	bne _0802C1C2
	ldr r4, [r1, #0x58]
	cmp r4, #0
	bne _0802C160
	bl sub_0802C474
	ldr r0, [r5]
	str r4, [r0, #0x54]
	movs r1, #1
	str r1, [r0, #0x58]
	adds r0, #0x71
	strb r4, [r0]
	b _0802C1C2
	.align 2, 0
_0802C15C: .4byte 0x020229B0
_0802C160:
	ldr r0, [r1, #0x54]
	cmp r0, #5
	bne _0802C174
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0xc]
	bl sub_0802C494
	b _0802C178
_0802C174:
	movs r0, #0
	strh r0, [r1, #0xc]
_0802C178:
	ldr r4, _0802C224
	ldr r1, [r4]
	ldr r0, [r1, #0x54]
	cmp r0, #1
	ble _0802C192
	movs r0, #1
	str r0, [r1, #0x64]
	adds r0, r1, #0
	adds r0, #0x86
	adds r1, #0x81
	movs r2, #5
	bl memcpy
_0802C192:
	bl sub_0802C474
	ldr r0, [r4]
	movs r2, #0
	str r2, [r0, #0x54]
	movs r1, #1
	str r1, [r0, #0x58]
	adds r0, #0x71
	strb r2, [r0]
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0x74
	ldrh r1, [r2]
	ldr r0, _0802C228
	cmp r1, r0
	bhi _0802C1B6
	adds r0, r1, #1
	strh r0, [r2]
_0802C1B6:
	movs r0, #0xa
	bl sub_0802C37C
	movs r0, #3
	bl sub_0802AB08
_0802C1C2:
	ldr r4, _0802C224
	ldr r0, [r4]
	ldr r0, [r0, #0x64]
	cmp r0, #0
	beq _0802C1F8
	bl sub_0802C30C
	cmp r0, #1
	beq _0802C1DC
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0802C1F8
_0802C1DC:
	ldr r0, [r4]
	adds r0, #0x86
	bl sub_0802C430
	bl sub_0802C484
	bl sub_0802C37C
	movs r0, #3
	bl sub_0802AB08
	ldr r1, [r4]
	movs r0, #0
	str r0, [r1, #0x64]
_0802C1F8:
	ldr r4, _0802C224
	ldr r0, [r4]
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _0802C21E
	bl sub_0802C3A4
	adds r2, r0, #0
	ldr r1, [r4]
	ldr r0, [r1, #0x54]
	cmp r2, r0
	ble _0802C21E
	str r2, [r1, #0x54]
	adds r0, r1, #0
	adds r0, #0x81
	adds r1, #0x7c
	movs r2, #5
	bl memcpy
_0802C21E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C224: .4byte 0x020229B0
_0802C228: .4byte 0x0000270E
	thumb_func_end sub_0802C130

	thumb_func_start sub_0802C22C
sub_0802C22C: @ 0x0802C22C
	push {r4, r5, lr}
	ldr r5, _0802C260
	ldr r1, [r5]
	ldr r0, [r1, #0x14]
	cmp r0, #6
	bne _0802C276
	ldr r4, _0802C264
	adds r0, r1, r4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _0802C276
	ldrh r0, [r1, #0x12]
	cmp r0, #1
	bne _0802C26C
	bl sub_0802BDD0
	adds r1, r0, #0
	cmp r1, #1
	bne _0802C26C
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0802C276
	.align 2, 0
_0802C260: .4byte 0x020229B0
_0802C264: .4byte 0x00008398
_0802C268:
	movs r0, #0
	b _0802C2BE
_0802C26C:
	bl sub_0802BE80
	movs r0, #3
	bl sub_0802AB08
_0802C276:
	ldr r0, _0802C2C4
	ldr r1, [r0]
	ldr r0, [r1, #0x14]
	cmp r0, #7
	bne _0802C29C
	ldr r0, [r1, #0x18]
	cmp r0, #6
	bne _0802C29C
	ldr r2, _0802C2C8
	adds r0, r1, r2
	ldr r1, [r0]
	ldrh r0, [r1, #0x10]
	cmp r0, #2
	beq _0802C29C
	movs r0, #1
	str r0, [r1, #0x14]
	movs r0, #3
	bl sub_0802AB08
_0802C29C:
	movs r2, #0
	ldr r0, _0802C2C4
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	cmp r2, r1
	bge _0802C2BC
	adds r3, r1, #0
	ldr r4, _0802C2CC
	adds r1, r0, r4
_0802C2AE:
	ldrh r0, [r1]
	cmp r0, #2
	beq _0802C268
	adds r1, #0x24
	adds r2, #1
	cmp r2, r3
	blt _0802C2AE
_0802C2BC:
	movs r0, #1
_0802C2BE:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802C2C4: .4byte 0x020229B0
_0802C2C8: .4byte 0x00008398
_0802C2CC: .4byte 0x000082F4
	thumb_func_end sub_0802C22C

	thumb_func_start sub_0802C2D0
sub_0802C2D0: @ 0x0802C2D0
	push {r4, lr}
	ldr r0, _0802C304
	ldr r0, [r0]
	ldrb r3, [r0, #5]
	movs r4, #0
	cmp r4, r3
	bge _0802C2F4
	ldr r1, _0802C308
	adds r2, r0, r1
	adds r1, r3, #0
_0802C2E4:
	ldr r0, [r2]
	cmp r0, #0
	beq _0802C2EC
	adds r4, #1
_0802C2EC:
	adds r2, #0x24
	subs r1, #1
	cmp r1, #0
	bne _0802C2E4
_0802C2F4:
	movs r0, #0
	cmp r4, r3
	bne _0802C2FC
	movs r0, #1
_0802C2FC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802C304: .4byte 0x020229B0
_0802C308: .4byte 0x000082F8
	thumb_func_end sub_0802C2D0

	thumb_func_start sub_0802C30C
sub_0802C30C: @ 0x0802C30C
	push {r4, lr}
	movs r2, #0
	ldr r0, _0802C32C
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	cmp r2, r1
	bge _0802C33C
	adds r3, r1, #0
	ldr r4, _0802C330
	adds r1, r0, r4
_0802C320:
	ldr r0, [r1]
	cmp r0, #1
	beq _0802C334
	movs r0, #0
	b _0802C33E
	.align 2, 0
_0802C32C: .4byte 0x020229B0
_0802C330: .4byte 0x000082F8
_0802C334:
	adds r1, #0x24
	adds r2, #1
	cmp r2, r3
	blt _0802C320
_0802C33C:
	movs r0, #1
_0802C33E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802C30C

	thumb_func_start sub_0802C344
sub_0802C344: @ 0x0802C344
	push {lr}
	ldr r0, _0802C358
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x45
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802C35C
_0802C354:
	movs r0, #0
	b _0802C378
	.align 2, 0
_0802C358: .4byte 0x020229B0
_0802C35C:
	movs r2, #1
	ldrb r0, [r1, #5]
	cmp r2, r0
	bge _0802C376
	adds r3, r0, #0
	adds r1, #0x92
_0802C368:
	ldrh r0, [r1]
	cmp r0, #1
	beq _0802C354
	adds r1, #2
	adds r2, #1
	cmp r2, r3
	blt _0802C368
_0802C376:
	movs r0, #1
_0802C378:
	pop {r1}
	bx r1
	thumb_func_end sub_0802C344

	thumb_func_start sub_0802C37C
sub_0802C37C: @ 0x0802C37C
	push {lr}
	ldr r1, _0802C39C
	ldr r2, [r1]
	ldr r1, [r2, #0x78]
	adds r1, r1, r0
	str r1, [r2, #0x78]
	movs r0, #1
	str r0, [r2, #0x5c]
	ldr r0, _0802C3A0
	cmp r1, r0
	bls _0802C396
	adds r0, #1
	str r0, [r2, #0x78]
_0802C396:
	pop {r0}
	bx r0
	.align 2, 0
_0802C39C: .4byte 0x020229B0
_0802C3A0: .4byte 0x00018695
	thumb_func_end sub_0802C37C

	thumb_func_start sub_0802C3A4
sub_0802C3A4: @ 0x0802C3A4
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r1, _0802C3DC
	ldr r0, [r1]
	ldrb r4, [r0, #5]
	movs r2, #0
	cmp r5, r4
	bge _0802C3F6
	mov ip, r1
	movs r3, #0
	ldr r7, _0802C3E0
	movs r6, #0x1e
	rsbs r6, r6, #0
_0802C3BE:
	mov r0, ip
	ldr r1, [r0]
	adds r0, r1, r7
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, r6
	bne _0802C3E4
	adds r0, r1, #0
	adds r0, #0x7c
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	adds r5, #1
	b _0802C3EE
	.align 2, 0
_0802C3DC: .4byte 0x020229B0
_0802C3E0: .4byte 0x000082E4
_0802C3E4:
	adds r0, r1, #0
	adds r0, #0x7c
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
_0802C3EE:
	adds r3, #0x24
	adds r2, #1
	cmp r2, r4
	blt _0802C3BE
_0802C3F6:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802C3A4

	thumb_func_start sub_0802C400
sub_0802C400: @ 0x0802C400
	push {lr}
	movs r2, #0
	ldr r1, _0802C424
	ldr r3, _0802C428
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802C41C
	ldr r3, _0802C42C
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802C41C
	movs r2, #1
_0802C41C:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802C424: .4byte 0x030050A0
_0802C428: .4byte 0x0000069E
_0802C42C: .4byte 0x000008D2
	thumb_func_end sub_0802C400

	thumb_func_start sub_0802C430
sub_0802C430: @ 0x0802C430
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	ldr r6, _0802C470
	movs r5, #1
_0802C43E:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C44E
	adds r0, r5, #0
	lsls r0, r1
	orrs r2, r0
	adds r3, #1
_0802C44E:
	adds r1, #1
	cmp r1, #4
	ble _0802C43E
	ldr r0, [r6]
	adds r0, #0x71
	strb r2, [r0]
	cmp r2, #0
	beq _0802C466
	ldr r0, [r6]
	adds r0, #0x4d
	movs r1, #1
	strb r1, [r0]
_0802C466:
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802C470: .4byte 0x020229B0
	thumb_func_end sub_0802C430

	thumb_func_start sub_0802C474
sub_0802C474: @ 0x0802C474
	ldr r0, _0802C480
	ldr r0, [r0]
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802C480: .4byte 0x020229B0
	thumb_func_end sub_0802C474

	thumb_func_start sub_0802C484
sub_0802C484: @ 0x0802C484
	ldr r1, _0802C490
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0802C490: .4byte 0x082CEF78
	thumb_func_end sub_0802C484

	thumb_func_start sub_0802C494
sub_0802C494: @ 0x0802C494
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0802C4AC
	ldr r0, [r0]
	ldrh r2, [r0, #0xe]
	cmp r1, r2
	bls _0802C4A6
	strh r1, [r0, #0xe]
_0802C4A6:
	pop {r0}
	bx r0
	.align 2, 0
_0802C4AC: .4byte 0x020229B0
	thumb_func_end sub_0802C494

	thumb_func_start sub_0802C4B0
sub_0802C4B0: @ 0x0802C4B0
	push {lr}
	ldr r0, _0802C4C4
	ldr r0, [r0]
	ldr r1, _0802C4C8
	ldr r2, [r0, #0x78]
	ldr r0, [r1]
	cmp r2, r0
	bhs _0802C4CC
	movs r0, #0
	b _0802C4CE
	.align 2, 0
_0802C4C4: .4byte 0x020229B0
_0802C4C8: .4byte 0x082CEFA0
_0802C4CC:
	movs r0, #1
_0802C4CE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802C4B0

	thumb_func_start sub_0802C4D4
sub_0802C4D4: @ 0x0802C4D4
	push {r4, lr}
	bl sub_0802C50C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_0802C52C
	lsls r0, r0, #0x10
	lsrs r0, r0, #4
	ldr r1, _0802C4F8
	ands r4, r1
	orrs r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802C4F8: .4byte 0x00000FFF
	thumb_func_end sub_0802C4D4

	thumb_func_start sub_0802C4FC
sub_0802C4FC: @ 0x0802C4FC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x1c
	strh r3, [r2]
	lsls r0, r0, #4
	lsrs r0, r0, #0x14
	strh r0, [r1]
	bx lr
	.align 2, 0
	thumb_func_end sub_0802C4FC

	thumb_func_start sub_0802C50C
sub_0802C50C: @ 0x0802C50C
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r1, r0
	ldr r0, _0802C528
	lsrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0802C528: .4byte 0x082CEF90
	thumb_func_end sub_0802C50C

	thumb_func_start sub_0802C52C
sub_0802C52C: @ 0x0802C52C
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r4, #0
	ldr r3, _0802C560
	ldr r0, [r3]
	ldr r2, _0802C564
	ldr r1, [r0, #0x78]
	ldr r0, [r2]
	cmp r1, r0
	blo _0802C568
	ldr r5, [r2, #4]
	adds r6, r3, #0
	adds r3, r2, #4
_0802C546:
	adds r3, #8
	adds r2, #8
	adds r4, #1
	cmp r4, #4
	bhi _0802C568
	ldr r0, [r6]
	ldr r1, [r0, #0x78]
	ldr r0, [r2]
	cmp r1, r0
	blo _0802C568
	ldr r5, [r3]
	b _0802C546
	.align 2, 0
_0802C560: .4byte 0x020229B0
_0802C564: .4byte 0x082CEFA0
_0802C568:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802C52C

	thumb_func_start sub_0802C574
sub_0802C574: @ 0x0802C574
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	b _0802C586
_0802C580:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0802C586:
	cmp r4, #0
	beq _0802C598
	adds r0, r5, #0
	adds r1, r4, #0
	bl CheckBagHasSpace
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C580
_0802C598:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0802C574

	thumb_func_start sub_0802C5A0
sub_0802C5A0: @ 0x0802C5A0
	push {lr}
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802C5A0

	thumb_func_start sub_0802C5B0
sub_0802C5B0: @ 0x0802C5B0
	ldr r0, _0802C5B8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	bx lr
	.align 2, 0
_0802C5B8: .4byte 0x020229B0
	thumb_func_end sub_0802C5B0

	thumb_func_start sub_0802C5BC
sub_0802C5BC: @ 0x0802C5BC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0802C5D4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0802C5D8
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802C5D4: .4byte 0x020229B0
_0802C5D8: .4byte 0x000082A8
	thumb_func_end sub_0802C5BC

	thumb_func_start sub_0802C5DC
sub_0802C5DC: @ 0x0802C5DC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0802C5F8
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	movs r1, #0x83
	lsls r1, r1, #8
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802C5F8: .4byte 0x020229B0
	thumb_func_end sub_0802C5DC

	thumb_func_start sub_0802C5FC
sub_0802C5FC: @ 0x0802C5FC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0802A8F4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mvns r0, r0
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802C5FC

	thumb_func_start sub_0802C614
sub_0802C614: @ 0x0802C614
	push {r4, r5, lr}
	movs r5, #0
_0802C618:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0802C648
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _0802C650
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0802C5FC
	cmp r0, #0
	beq _0802C650
	ldr r1, _0802C64C
	movs r0, #1
	b _0802C65A
	.align 2, 0
_0802C648: .4byte 0x02024190
_0802C64C: .4byte 0x02037290
_0802C650:
	adds r5, #1
	cmp r5, #5
	ble _0802C618
	ldr r1, _0802C664
	movs r0, #0
_0802C65A:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C664: .4byte 0x02037290
	thumb_func_end sub_0802C614

	thumb_func_start sub_0802C668
sub_0802C668: @ 0x0802C668
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r5, _0802C6A8
_0802C670:
	adds r0, r5, #0
	bl LoadCompressedSpriteSheet
	adds r5, #8
	adds r4, #1
	cmp r4, #4
	bls _0802C670
	movs r4, #0
	ldr r5, _0802C6AC
_0802C682:
	adds r0, r5, #0
	bl LoadSpritePalette
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0802C682
	movs r0, #5
	bl IndexOfSpritePaletteTag
	strb r0, [r6, #0xe]
	movs r0, #6
	bl IndexOfSpritePaletteTag
	strb r0, [r6, #0xf]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C6A8: .4byte 0x082CF694
_0802C6AC: .4byte 0x082CF6BC
	thumb_func_end sub_0802C668

	thumb_func_start sub_0802C6B0
sub_0802C6B0: @ 0x0802C6B0
	push {lr}
	movs r2, #0
	movs r1, #7
	adds r0, #0x3c
_0802C6B8:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _0802C6B8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802C6B0

	thumb_func_start sub_0802C6C8
sub_0802C6C8: @ 0x0802C6C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov sb, r0
	adds r7, r1, #0
	ldr r0, [sp, #0x54]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x28]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x2c]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, sp
	ldr r0, _0802C71C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #0x80
	lsls r0, r0, #6
	bl Alloc
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #4
	bl Alloc
	mov sl, r0
	bl sub_0802C5B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r6, r0
	bne _0802C720
	movs r0, #3
	b _0802C726
	.align 2, 0
_0802C71C: .4byte 0x082CF6CC
_0802C720:
	adds r0, r6, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0802C726:
	str r0, [sp, #0x30]
	mov r1, r8
	cmp r1, #0
	beq _0802C7E8
	mov r2, sl
	cmp r2, #0
	beq _0802C7E8
	ldrh r2, [r7]
	lsls r0, r2, #3
	ldr r1, _0802C7D4
	adds r0, r0, r1
	ldr r3, [r7, #8]
	mov r1, r8
	bl HandleLoadSpecialPokePic
	mov r3, r8
	str r3, [sp, #0x18]
	adds r4, r6, #0
	add r0, sp, #0x18
	ldr r5, _0802C7D8
	lsls r1, r4, #0x10
	movs r2, #0x80
	lsls r2, r2, #4
	orrs r1, r2
	str r1, [r0, #4]
	bl LoadSpriteSheet
	ldrh r0, [r7]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	bl GetMonSpritePalFromSpeciesAndPersonality
	str r0, [sp, #0x20]
	add r0, sp, #0x20
	ldr r1, [r0, #4]
	ands r1, r5
	orrs r1, r4
	str r1, [r0, #4]
	bl LoadCompressedSpritePalette
	mov r0, r8
	bl Free
	mov r0, sl
	bl Free
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	adds r0, r0, r6
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r0, r0, r6
	strh r0, [r1, #2]
	ldr r4, [sp, #0x28]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #0x2c]
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	mov r0, sp
	ldr r3, [sp, #0x30]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _0802C7E8
	lsls r0, r6, #2
	ldr r2, _0802C7DC
	add r2, sb
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802C7E0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0802C7E4
	add r0, sb
	adds r0, r0, r6
	add r1, sp, #0x30
	ldrb r1, [r1]
	strb r1, [r0]
	b _0802C7F4
	.align 2, 0
_0802C7D4: .4byte 0x082D4CA8
_0802C7D8: .4byte 0xFFFF0000
_0802C7DC: .4byte 0x000081A8
_0802C7E0: .4byte 0x020205AC
_0802C7E4: .4byte 0x000081FC
_0802C7E8:
	lsls r0, r6, #2
	ldr r1, _0802C804
	add r1, sb
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
_0802C7F4:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C804: .4byte 0x000081A8
	thumb_func_end sub_0802C6C8

	thumb_func_start sub_0802C808
sub_0802C808: @ 0x0802C808
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r6, r1, #2
	ldr r0, _0802C860
	adds r5, r4, r0
	adds r5, r5, r6
	ldr r0, [r5]
	bl sub_0802C6B0
	ldr r2, [r5]
	ldr r0, _0802C864
	adds r4, r4, r0
	adds r4, r4, r6
	ldr r1, [r4]
	ldr r0, _0802C868
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #2
	strh r0, [r2, #0x3c]
	ldr r1, [r5]
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, [r5]
	movs r0, #0x60
	strh r0, [r1, #0x22]
	ldr r0, [r5]
	ldr r1, _0802C86C
	str r1, [r0, #0x1c]
	movs r1, #1
	bl StartSpriteAnim
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C860: .4byte 0x000081BC
_0802C864: .4byte 0x000081A8
_0802C868: .4byte 0x020205AC
_0802C86C: .4byte 0x0802C871
	thumb_func_end sub_0802C808

	thumb_func_start sub_0802C870
sub_0802C870: @ 0x0802C870
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _0802C89C
	cmp r0, #1
	bgt _0802C886
	cmp r0, #0
	beq _0802C88C
	b _0802C8DA
_0802C886:
	cmp r0, #2
	beq _0802C8BC
	b _0802C8DA
_0802C88C:
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802C8DA
	b _0802C8CA
_0802C89C:
	ldrh r1, [r2, #0x22]
	subs r1, #1
	strh r1, [r2, #0x22]
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x48
	bgt _0802C8DA
	movs r0, #0x48
	strh r0, [r2, #0x22]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	b _0802C8DA
_0802C8BC:
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2f
	ble _0802C8DA
_0802C8CA:
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0802C8E0
	str r0, [r2, #0x1c]
_0802C8DA:
	pop {r0}
	bx r0
	.align 2, 0
_0802C8E0: .4byte 0x08007141
	thumb_func_end sub_0802C870

	thumb_func_start sub_0802C8E4
sub_0802C8E4: @ 0x0802C8E4
	push {lr}
	lsls r1, r1, #2
	ldr r2, _0802C904
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, _0802C908
	str r1, [r2, #0x1c]
	movs r1, #0
	strh r1, [r2, #0x26]
	ldr r0, [r0]
	bl sub_0802C6B0
	pop {r0}
	bx r0
	.align 2, 0
_0802C904: .4byte 0x000081A8
_0802C908: .4byte 0x0802C935
	thumb_func_end sub_0802C8E4

	thumb_func_start sub_0802C90C
sub_0802C90C: @ 0x0802C90C
	push {lr}
	movs r2, #0
	lsls r1, r1, #2
	ldr r3, _0802C92C
	adds r0, r0, r3
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [r0, #0x1c]
	ldr r0, _0802C930
	cmp r1, r0
	bne _0802C924
	movs r2, #1
_0802C924:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802C92C: .4byte 0x000081A8
_0802C930: .4byte 0x0802C935
	thumb_func_end sub_0802C90C

	thumb_func_start sub_0802C934
sub_0802C934: @ 0x0802C934
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	adds r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0802C960
	ldrh r0, [r2, #0x32]
	adds r0, #1
	strh r0, [r2, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802C958
	movs r0, #2
	b _0802C95A
_0802C958:
	ldr r0, _0802C974
_0802C95A:
	strh r0, [r2, #0x26]
	movs r0, #0
	strh r0, [r2, #0x30]
_0802C960:
	movs r1, #0x32
	ldrsh r0, [r2, r1]
	cmp r0, #0xc
	ble _0802C970
	movs r0, #0
	strh r0, [r2, #0x26]
	ldr r0, _0802C978
	str r0, [r2, #0x1c]
_0802C970:
	pop {r0}
	bx r0
	.align 2, 0
_0802C974: .4byte 0x0000FFFE
_0802C978: .4byte 0x08007141
	thumb_func_end sub_0802C934

	thumb_func_start sub_0802C97C
sub_0802C97C: @ 0x0802C97C
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, _0802C99C
	adds r4, r4, r0
	adds r4, r4, r1
	ldr r0, [r4]
	bl sub_0802C6B0
	ldr r1, [r4]
	ldr r0, _0802C9A0
	str r0, [r1, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C99C: .4byte 0x000081A8
_0802C9A0: .4byte 0x0802C9FD
	thumb_func_end sub_0802C97C

	thumb_func_start sub_0802C9A4
sub_0802C9A4: @ 0x0802C9A4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_0802C5A0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0802C9E8
	movs r1, #5
	rsbs r1, r1, #0
	mov ip, r1
	ldr r1, _0802C9F0
	adds r3, r4, r1
	ldr r7, _0802C9F4
	ldr r6, _0802C9F8
	movs r5, #0xa
	adds r4, r0, #0
_0802C9C6:
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	cmp r0, r7
	bne _0802C9E0
	adds r2, #0x3e
	ldrb r1, [r2]
	mov r0, ip
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	str r6, [r0, #0x1c]
	adds r0, #0x43
	strb r5, [r0]
_0802C9E0:
	adds r3, #4
	subs r4, #1
	cmp r4, #0
	bne _0802C9C6
_0802C9E8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C9F0: .4byte 0x000081A8
_0802C9F4: .4byte 0x0802C9FD
_0802C9F8: .4byte 0x08007141
	thumb_func_end sub_0802C9A4

	thumb_func_start sub_0802C9FC
sub_0802C9FC: @ 0x0802C9FC
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0802CA2A
	movs r0, #0
	strh r0, [r3, #0x2e]
	adds r3, #0x3e
	ldrb r2, [r3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0802CA2A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802C9FC

	thumb_func_start sub_0802CA30
sub_0802CA30: @ 0x0802CA30
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0802C5A0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	cmp r2, r3
	bge _0802CA5A
	ldr r0, _0802CA60
	adds r5, r4, r0
	subs r0, #0x54
	adds r4, r4, r0
_0802CA4A:
	ldm r4!, {r0}
	adds r1, r5, r2
	ldrb r1, [r1]
	adds r0, #0x43
	strb r1, [r0]
	adds r2, #1
	cmp r2, r3
	blt _0802CA4A
_0802CA5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CA60: .4byte 0x000081FC
	thumb_func_end sub_0802CA30

	thumb_func_start sub_0802CA64
sub_0802CA64: @ 0x0802CA64
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, _0802CA84
	adds r4, r4, r0
	adds r4, r4, r1
	ldr r0, [r4]
	bl sub_0802C6B0
	ldr r1, [r4]
	ldr r0, _0802CA88
	str r0, [r1, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CA84: .4byte 0x000081A8
_0802CA88: .4byte 0x0802CAC9
	thumb_func_end sub_0802CA64

	thumb_func_start sub_0802CA8C
sub_0802CA8C: @ 0x0802CA8C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0802C5A0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	cmp r2, r3
	bge _0802CAC0
	ldr r5, _0802CAB0
	ldr r0, _0802CAB4
	adds r1, r4, r0
_0802CAA4:
	ldr r0, [r1]
	ldr r0, [r0, #0x1c]
	cmp r0, r5
	bne _0802CAB8
	movs r0, #1
	b _0802CAC2
	.align 2, 0
_0802CAB0: .4byte 0x0802CAC9
_0802CAB4: .4byte 0x000081A8
_0802CAB8:
	adds r1, #4
	adds r2, #1
	cmp r2, r3
	blt _0802CAA4
_0802CAC0:
	movs r0, #0
_0802CAC2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0802CA8C

	thumb_func_start sub_0802CAC8
sub_0802CAC8: @ 0x0802CAC8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	cmp r4, #0
	beq _0802CADA
	cmp r4, #1
	beq _0802CAE8
	b _0802CB30
_0802CADA:
	movs r0, #0x22
	bl PlaySE
	strh r4, [r5, #0x30]
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0802CAE8:
	ldrh r0, [r5, #0x30]
	adds r0, #4
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _0802CAFA
	movs r0, #0
	strh r0, [r5, #0x30]
_0802CAFA:
	ldr r1, _0802CB28
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	rsbs r0, r0, #0
	strh r0, [r5, #0x26]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bne _0802CB30
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _0802CB2C
	strh r1, [r5, #0x2e]
	b _0802CB30
	.align 2, 0
_0802CB28: .4byte 0x082FA8CC
_0802CB2C:
	ldr r0, _0802CB38
	str r0, [r5, #0x1c]
_0802CB30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CB38: .4byte 0x08007141
	thumb_func_end sub_0802CAC8

	thumb_func_start sub_0802CB3C
sub_0802CB3C: @ 0x0802CB3C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r0, _0802CB84
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _0802CB7C
	ldr r0, _0802CB88
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r3, r1, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r2, #4
	orrs r0, r2
	strb r0, [r3]
	lsls r2, r4, #2
	ldr r3, _0802CB8C
	adds r0, r5, r3
	adds r0, r0, r2
	str r1, [r0]
_0802CB7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CB84: .4byte 0x082CF898
_0802CB88: .4byte 0x020205AC
_0802CB8C: .4byte 0x000081BC
	thumb_func_end sub_0802CB3C

	thumb_func_start sub_0802CB90
sub_0802CB90: @ 0x0802CB90
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r5, #0
	movs r4, #0
	ldr r6, _0802CC30
_0802CB9A:
	ldr r1, _0802CC34
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, _0802CC38
	lsls r1, r5, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r6, r3]
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r5, #2
	ldr r3, _0802CC3C
	adds r2, r7, r3
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802CC40
	adds r0, r0, r1
	str r0, [r2]
	adds r5, #1
	adds r6, #0x14
	adds r4, #1
	cmp r4, #3
	ble _0802CB9A
	movs r4, #3
	movs r6, #0x3c
_0802CBDC:
	ldr r1, _0802CC34
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, _0802CC38
	lsls r1, r5, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r2, _0802CC30
	adds r2, r6, r2
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r5, #2
	ldr r3, _0802CC3C
	adds r2, r7, r3
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802CC40
	adds r0, r0, r1
	str r0, [r2]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	adds r5, #1
	subs r6, #0x14
	subs r4, #1
	cmp r4, #0
	bge _0802CBDC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC30: .4byte 0x082CF6E4
_0802CC34: .4byte 0x082CF744
_0802CC38: .4byte 0x082CF734
_0802CC3C: .4byte 0x000081D0
_0802CC40: .4byte 0x020205AC
	thumb_func_end sub_0802CB90

	thumb_func_start sub_0802CC44
sub_0802CC44: @ 0x0802CC44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	cmp r1, #5
	ble _0802CC64
	movs r0, #0xa
	subs r1, r0, r1
	movs r0, #3
	str r0, [sp]
	ldr r2, [sp, #8]
	ldrb r0, [r2, #0xf]
	b _0802CC6C
_0802CC64:
	movs r3, #2
	str r3, [sp]
	ldr r7, [sp, #8]
	ldrb r0, [r7, #0xe]
_0802CC6C:
	movs r6, #0
	lsls r2, r1, #1
	str r2, [sp, #4]
	lsls r0, r0, #4
	mov sb, r0
	lsls r1, r1, #0x18
	mov r8, r1
	ldr r0, _0802CD30
	adds r4, r2, r0
	ldr r3, [sp]
	lsls r3, r3, #2
	mov sl, r3
	movs r5, #3
_0802CC86:
	lsls r0, r6, #2
	ldr r7, [sp, #8]
	ldr r1, _0802CD34
	adds r2, r7, r1
	adds r2, r2, r0
	ldr r1, [r2]
	ldrh r0, [r4]
	strh r0, [r1, #0x22]
	ldr r3, [r2]
	ldrb r0, [r3, #5]
	movs r7, #0xd
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r3, [r2]
	ldrb r1, [r3, #5]
	movs r0, #0xf
	ands r0, r1
	mov r7, sb
	orrs r0, r7
	strb r0, [r3, #5]
	ldr r0, [r2]
	mov r2, r8
	lsrs r1, r2, #0x18
	bl StartSpriteAnim
	adds r6, #1
	adds r4, #0x14
	subs r5, #1
	cmp r5, #0
	bge _0802CC86
	movs r5, #3
	ldr r0, _0802CD30
	ldr r3, [sp, #4]
	adds r0, r3, r0
	adds r4, r0, #0
	adds r4, #0x3c
	ldr r7, [sp]
	lsls r7, r7, #2
	mov sl, r7
_0802CCDC:
	lsls r0, r6, #2
	ldr r1, [sp, #8]
	ldr r3, _0802CD34
	adds r2, r1, r3
	adds r2, r2, r0
	ldr r1, [r2]
	ldrh r0, [r4]
	strh r0, [r1, #0x22]
	ldr r3, [r2]
	ldrb r0, [r3, #5]
	movs r7, #0xd
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r3, [r2]
	ldrb r1, [r3, #5]
	movs r0, #0xf
	ands r0, r1
	mov r7, sb
	orrs r0, r7
	strb r0, [r3, #5]
	ldr r0, [r2]
	mov r2, r8
	lsrs r1, r2, #0x18
	bl StartSpriteAnim
	adds r6, #1
	subs r4, #0x14
	subs r5, #1
	cmp r5, #0
	bge _0802CCDC
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD30: .4byte 0x082CF6E4
_0802CD34: .4byte 0x000081D0
	thumb_func_end sub_0802CC44

	thumb_func_start sub_0802CD38
sub_0802CD38: @ 0x0802CD38
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #7
	movs r2, #0x78
	movs r3, #0x50
	bl sub_0802E788
	adds r0, r4, #0
	bl sub_0802CA30
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0802CD38

	thumb_func_start sub_0802CD5C
sub_0802CD5C: @ 0x0802CD5C
	push {lr}
	bl sub_0802E7E8
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802CD5C

	thumb_func_start sub_0802CD68
sub_0802CD68: @ 0x0802CD68
	push {r4, lr}
	ldr r4, _0802CD94
	str r0, [r4]
	bl sub_0802CDB0
	ldr r0, _0802CD98
	movs r1, #3
	bl CreateTask
	ldr r1, [r4]
	strb r0, [r1, #6]
	ldr r2, [r4]
	ldrb r0, [r2, #6]
	movs r1, #2
	bl SetWordTaskArg
	ldr r0, _0802CD9C
	bl sub_0802CDFC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD94: .4byte 0x020229B4
_0802CD98: .4byte 0x0802CE21
_0802CD9C: .4byte 0x0802CE45
	thumb_func_end sub_0802CD68

	thumb_func_start sub_0802CDA0
sub_0802CDA0: @ 0x0802CDA0
	push {lr}
	bl FreeAllWindowBuffers
	bl sub_08034B20
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802CDA0

	thumb_func_start sub_0802CDB0
sub_0802CDB0: @ 0x0802CDB0
	movs r1, #0
	strh r1, [r0, #4]
	str r1, [r0]
	movs r1, #0xff
	strh r1, [r0, #0x12]
	bx lr
	thumb_func_end sub_0802CDB0

	thumb_func_start sub_0802CDBC
sub_0802CDBC: @ 0x0802CDBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _0802CDE0
_0802CDC4:
	ldr r0, [r4]
	cmp r0, r6
	bne _0802CDD0
	ldr r0, [r4, #4]
	bl sub_0802CDFC
_0802CDD0:
	adds r4, #8
	adds r5, #1
	cmp r5, #9
	bls _0802CDC4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CDE0: .4byte 0x082D1A18
	thumb_func_end sub_0802CDBC

	thumb_func_start sub_0802CDE4
sub_0802CDE4: @ 0x0802CDE4
	ldr r0, _0802CDF8
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #1
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0802CDF8: .4byte 0x020229B4
	thumb_func_end sub_0802CDE4

	thumb_func_start sub_0802CDFC
sub_0802CDFC: @ 0x0802CDFC
	push {r4, lr}
	adds r2, r0, #0
	ldr r4, _0802CE1C
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	movs r1, #0
	bl SetWordTaskArg
	ldr r1, [r4]
	movs r0, #0
	strh r0, [r1, #4]
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CE1C: .4byte 0x020229B4
	thumb_func_end sub_0802CDFC

	thumb_func_start sub_0802CE20
sub_0802CE20: @ 0x0802CE20
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0802CE40
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _0802CE3C
	adds r0, r1, #0
	movs r1, #0
	bl GetWordTaskArg
	bl _call_via_r0
_0802CE3C:
	pop {r0}
	bx r0
	.align 2, 0
_0802CE40: .4byte 0x020229B4
	thumb_func_end sub_0802CE20

	thumb_func_start sub_0802CE44
sub_0802CE44: @ 0x0802CE44
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r6, _0802CE60
	ldr r1, [r6]
	ldrh r5, [r1, #4]
	cmp r5, #1
	bne _0802CE54
	b _0802CF8C
_0802CE54:
	cmp r5, #1
	bgt _0802CE64
	cmp r5, #0
	beq _0802CE6C
	b _0802CFCE
	.align 2, 0
_0802CE60: .4byte 0x020229B4
_0802CE64:
	cmp r5, #2
	bne _0802CE6A
	b _0802CFCA
_0802CE6A:
	b _0802CFCE
_0802CE6C:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0802CF5C
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r0, _0802CF60
	bl InitWindows
	bl reset_temp_tile_data_buffers
	ldr r0, [r6]
	bl sub_0802C668
	bl sub_0802DA00
	ldr r0, _0802CF64
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _0802CF68
	str r5, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _0802CF6C
	movs r4, #1
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _0802CF70
	movs r1, #0x30
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _0802CF74
	str r5, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _0802CF78
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _0802CF7C
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _0802CF80
	str r5, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _0802CF84
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r0, _0802CF88
	movs r1, #0x20
	movs r2, #0x20
	bl LoadPalette
	ldr r1, [r6]
	movs r0, #0xd3
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #0
	bl SetBgTilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect_Palette0
	bl sub_0802D884
	movs r0, #0
	bl sub_0802DA5C
	movs r0, #0
	movs r1, #1
	movs r2, #0xe0
	bl sub_080985F4
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	bl ResetBgPositions
	b _0802CFC0
	.align 2, 0
_0802CF5C: .4byte 0x082D19F0
_0802CF60: .4byte 0x082D1A00
_0802CF64: .4byte 0x082CF8D0
_0802CF68: .4byte 0x082CF8F0
_0802CF6C: .4byte 0x082CFB1C
_0802CF70: .4byte 0x082CFCCC
_0802CF74: .4byte 0x082CFCEC
_0802CF78: .4byte 0x082D063C
_0802CF7C: .4byte 0x082D09F4
_0802CF80: .4byte 0x082D0A14
_0802CF84: .4byte 0x082D14C4
_0802CF88: .4byte 0x082CF8B0
_0802CF8C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802CFCE
	bl sub_0802D8F0
	ldr r0, [r6]
	bl sub_0802CB90
	ldr r0, [r6]
	movs r1, #6
	bl sub_0802CC44
	movs r0, #3
	bl ShowBg
	movs r0, #0
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #1
	bl HideBg
_0802CFC0:
	ldr r1, [r6]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802CFCE
_0802CFCA:
	movs r0, #1
	str r0, [r1]
_0802CFCE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802CE44

	thumb_func_start sub_0802CFD8
sub_0802CFD8: @ 0x0802CFD8
	push {r4, lr}
	ldr r4, _0802CFF0
	ldr r0, [r4]
	ldrh r0, [r0, #4]
	cmp r0, #1
	beq _0802D004
	cmp r0, #1
	bgt _0802CFF4
	cmp r0, #0
	beq _0802CFFE
	b _0802D03E
	.align 2, 0
_0802CFF0: .4byte 0x020229B4
_0802CFF4:
	cmp r0, #2
	beq _0802D016
	cmp r0, #3
	beq _0802D02E
	b _0802D03E
_0802CFFE:
	bl sub_0802DB14
	b _0802D024
_0802D004:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D03E
	movs r0, #0
	bl sub_0802DC68
	b _0802D024
_0802D016:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D03E
	bl sub_0802DCCC
_0802D024:
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D03E
_0802D02E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D03E
	ldr r1, [r4]
	movs r0, #1
	str r0, [r1]
_0802D03E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0802CFD8

	thumb_func_start sub_0802D044
sub_0802D044: @ 0x0802D044
	push {r4, lr}
	ldr r4, _0802D05C
	ldr r0, [r4]
	ldrh r0, [r0, #4]
	cmp r0, #1
	beq _0802D070
	cmp r0, #1
	bgt _0802D060
	cmp r0, #0
	beq _0802D06A
	b _0802D0AA
	.align 2, 0
_0802D05C: .4byte 0x020229B4
_0802D060:
	cmp r0, #2
	beq _0802D082
	cmp r0, #3
	beq _0802D09A
	b _0802D0AA
_0802D06A:
	bl sub_0802DB14
	b _0802D090
_0802D070:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D0AA
	movs r0, #1
	bl sub_0802DC68
	b _0802D090
_0802D082:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D0AA
	bl sub_0802DCCC
_0802D090:
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D0AA
_0802D09A:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D0AA
	ldr r1, [r4]
	movs r0, #1
	str r0, [r1]
_0802D0AA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0802D044

	thumb_func_start sub_0802D0B0
sub_0802D0B0: @ 0x0802D0B0
	push {r4, r5, lr}
	bl sub_0802C5A0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0802D0CC
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0802D0D0
	cmp r0, #1
	beq _0802D104
	b _0802D132
	.align 2, 0
_0802D0CC: .4byte 0x020229B4
_0802D0D0:
	movs r4, #0
	cmp r4, r5
	bge _0802D0EC
_0802D0D6:
	ldr r0, _0802D100
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r4, #1
	cmp r4, r5
	blt _0802D0D6
_0802D0EC:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _0802D100
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D132
	.align 2, 0
_0802D100: .4byte 0x020229B4
_0802D104:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D132
	movs r4, #0
	cmp r4, r5
	bge _0802D12A
_0802D114:
	ldr r0, _0802D138
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrb r0, [r0]
	bl RemoveWindow
	adds r4, #1
	cmp r4, r5
	blt _0802D114
_0802D12A:
	ldr r0, _0802D138
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1]
_0802D132:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D138: .4byte 0x020229B4
	thumb_func_end sub_0802D0B0

	thumb_func_start sub_0802D13C
sub_0802D13C: @ 0x0802D13C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _0802D154
	ldr r0, [r5]
	ldrh r4, [r0, #4]
	cmp r4, #1
	beq _0802D198
	cmp r4, #1
	bgt _0802D158
	cmp r4, #0
	beq _0802D15E
	b _0802D1E0
	.align 2, 0
_0802D154: .4byte 0x020229B4
_0802D158:
	cmp r4, #2
	beq _0802D1D0
	b _0802D1E0
_0802D15E:
	movs r0, #1
	movs r1, #8
	movs r2, #0x14
	movs r3, #2
	bl sub_0802D78C
	ldr r1, [r5]
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0802D194
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	b _0802D1C6
	.align 2, 0
_0802D194: .4byte 0x085CCE71
_0802D198:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D1E0
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #1
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #0x17
	movs r1, #7
	movs r2, #0
	bl sub_0802D808
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_0802D1C6:
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D1E0
_0802D1D0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D1E0
	ldr r1, [r5]
	movs r0, #1
	str r0, [r1]
_0802D1E0:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0802D13C

	thumb_func_start sub_0802D1E8
sub_0802D1E8: @ 0x0802D1E8
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _0802D200
	ldr r0, [r5]
	ldrh r4, [r0, #4]
	cmp r4, #1
	beq _0802D244
	cmp r4, #1
	bgt _0802D204
	cmp r4, #0
	beq _0802D20A
	b _0802D282
	.align 2, 0
_0802D200: .4byte 0x020229B4
_0802D204:
	cmp r4, #2
	beq _0802D272
	b _0802D282
_0802D20A:
	movs r0, #2
	movs r1, #7
	movs r2, #0x1a
	movs r3, #4
	bl sub_0802D78C
	ldr r1, [r5]
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0802D240
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	b _0802D268
	.align 2, 0
_0802D240: .4byte 0x08277071
_0802D244:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D282
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #1
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_0802D268:
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D282
_0802D272:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D282
	ldr r1, [r5]
	movs r0, #1
	str r0, [r1]
_0802D282:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802D1E8

	thumb_func_start sub_0802D28C
sub_0802D28C: @ 0x0802D28C
	push {r4, r5, lr}
	ldr r5, _0802D2A0
	ldr r0, [r5]
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _0802D2A4
	cmp r4, #1
	beq _0802D2BC
	b _0802D2D2
	.align 2, 0
_0802D2A0: .4byte 0x020229B4
_0802D2A4:
	bl sub_0802D704
	bl sub_08198D88
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D2D2
_0802D2BC:
	bl sub_0802D734
	cmp r0, #0
	bne _0802D2D2
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D2D2
	ldr r0, [r5]
	str r4, [r0]
_0802D2D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0802D28C

	thumb_func_start sub_0802D2D8
sub_0802D2D8: @ 0x0802D2D8
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _0802D2F0
	ldr r0, [r5]
	ldrh r4, [r0, #4]
	cmp r4, #1
	beq _0802D334
	cmp r4, #1
	bgt _0802D2F4
	cmp r4, #0
	beq _0802D2FA
	b _0802D372
	.align 2, 0
_0802D2F0: .4byte 0x020229B4
_0802D2F4:
	cmp r4, #2
	beq _0802D362
	b _0802D372
_0802D2FA:
	movs r0, #2
	movs r1, #8
	movs r2, #0x16
	movs r3, #4
	bl sub_0802D78C
	ldr r1, [r5]
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0802D330
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	b _0802D358
	.align 2, 0
_0802D330: .4byte 0x085CCE7F
_0802D334:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D372
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #1
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_0802D358:
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D372
_0802D362:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D372
	ldr r1, [r5]
	movs r0, #1
	str r0, [r1]
_0802D372:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802D2D8

	thumb_func_start sub_0802D37C
sub_0802D37C: @ 0x0802D37C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _0802D394
	ldr r0, [r5]
	ldrh r4, [r0, #4]
	cmp r4, #1
	beq _0802D3D8
	cmp r4, #1
	bgt _0802D398
	cmp r4, #0
	beq _0802D39E
	b _0802D416
	.align 2, 0
_0802D394: .4byte 0x020229B4
_0802D398:
	cmp r4, #2
	beq _0802D406
	b _0802D416
_0802D39E:
	movs r0, #7
	movs r1, #0xa
	movs r2, #0x10
	movs r3, #2
	bl sub_0802D78C
	ldr r1, [r5]
	strh r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0802D3D4
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	b _0802D3FC
	.align 2, 0
_0802D3D4: .4byte 0x085CCE99
_0802D3D8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D416
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	bl PutWindowTilemap
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #1
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_0802D3FC:
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D416
_0802D406:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D416
	ldr r1, [r5]
	movs r0, #1
	str r0, [r1]
_0802D416:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802D37C

	thumb_func_start sub_0802D420
sub_0802D420: @ 0x0802D420
	push {r4, r5, lr}
	ldr r5, _0802D434
	ldr r0, [r5]
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _0802D438
	cmp r4, #1
	beq _0802D446
	b _0802D452
	.align 2, 0
_0802D434: .4byte 0x020229B4
_0802D438:
	bl sub_0802CD38
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _0802D452
_0802D446:
	bl sub_0802CD5C
	cmp r0, #0
	bne _0802D452
	ldr r0, [r5]
	str r4, [r0]
_0802D452:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0802D420

	thumb_func_start sub_0802D458
sub_0802D458: @ 0x0802D458
	push {lr}
	ldr r1, _0802D478
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #0xa]
	ldr r0, [r1]
	strb r2, [r0, #0xb]
	ldr r2, [r1]
	movs r0, #6
	strb r0, [r2, #0xc]
	ldr r0, [r1]
	ldrb r0, [r0, #0xc]
	bl sub_0802D994
	pop {r0}
	bx r0
	.align 2, 0
_0802D478: .4byte 0x020229B4
	thumb_func_end sub_0802D458

	thumb_func_start sub_0802D47C
sub_0802D47C: @ 0x0802D47C
	push {r4, lr}
	ldr r0, _0802D490
	ldr r2, [r0]
	ldrb r3, [r2, #0xa]
	adds r4, r0, #0
	cmp r3, #0
	beq _0802D494
	cmp r3, #1
	beq _0802D4CE
	b _0802D4D2
	.align 2, 0
_0802D490: .4byte 0x020229B4
_0802D494:
	ldrb r0, [r2, #0xb]
	adds r0, #1
	strb r0, [r2, #0xb]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	cmp r0, #0xa
	bls _0802D4BE
	strb r3, [r1, #0xb]
	ldr r0, [r4]
	ldrb r1, [r0, #0xc]
	adds r1, #1
	strb r1, [r0, #0xc]
	ldr r1, [r4]
	ldrb r0, [r1, #0xc]
	cmp r0, #9
	bls _0802D4BE
	strb r3, [r1, #0xc]
	ldr r1, [r4]
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
_0802D4BE:
	ldr r0, [r4]
	ldrb r0, [r0, #0xc]
	bl sub_0802D994
	ldr r0, [r4]
	ldrb r0, [r0, #0xc]
	cmp r0, #7
	bne _0802D4D2
_0802D4CE:
	movs r0, #0
	b _0802D4D4
_0802D4D2:
	movs r0, #1
_0802D4D4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802D47C

	thumb_func_start sub_0802D4DC
sub_0802D4DC: @ 0x0802D4DC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r5, _0802D568
	ldr r1, [r5]
	adds r1, #0x26
	bl CopyItemName
	ldr r0, [r5]
	adds r0, #0x66
	adds r1, r4, #0
	movs r2, #0
	movs r3, #1
	bl ConvertIntToDecimalStringN
	bl DynamicPlaceholderTextUtil_Reset
	ldr r1, [r5]
	adds r1, #0x26
	movs r0, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, [r5]
	adds r1, #0x66
	movs r0, #1
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r5]
	adds r0, #0xa6
	ldr r1, _0802D56C
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, #4
	movs r1, #8
	movs r2, #0x16
	movs r3, #4
	bl sub_0802D78C
	ldr r2, [r5]
	movs r4, #0
	movs r3, #0
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, #0xa6
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r1, #1
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	ldrb r0, [r0, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _0802D570
	strh r0, [r1, #0x14]
	strb r4, [r1, #0xd]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D568: .4byte 0x020229B4
_0802D56C: .4byte 0x085CCE36
_0802D570: .4byte 0x0000016F
	thumb_func_end sub_0802D4DC

	thumb_func_start sub_0802D574
sub_0802D574: @ 0x0802D574
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0802D5E4
	ldr r1, [r4]
	adds r1, #0x26
	bl CopyItemName
	bl DynamicPlaceholderTextUtil_Reset
	ldr r1, [r4]
	adds r1, #0x26
	movs r0, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r4]
	adds r0, #0xa6
	ldr r1, _0802D5E8
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, #4
	movs r1, #8
	movs r2, #0x16
	movs r3, #4
	bl sub_0802D78C
	ldr r2, [r4]
	movs r6, #0
	movs r5, #0
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, #0xa6
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, [r4]
	strh r5, [r0, #0x14]
	strb r6, [r0, #0xd]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D5E4: .4byte 0x020229B4
_0802D5E8: .4byte 0x085CCE52
	thumb_func_end sub_0802D574

	thumb_func_start sub_0802D5EC
sub_0802D5EC: @ 0x0802D5EC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0802D65C
	ldr r1, [r4]
	adds r1, #0x26
	bl CopyItemName
	bl DynamicPlaceholderTextUtil_Reset
	ldr r1, [r4]
	adds r1, #0x26
	movs r0, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r0, [r4]
	adds r0, #0xa6
	ldr r1, _0802D660
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	movs r0, #4
	movs r1, #9
	movs r2, #0x16
	movs r3, #2
	bl sub_0802D78C
	ldr r2, [r4]
	movs r6, #0
	movs r5, #0
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, #0xa6
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, [r4]
	strh r5, [r0, #0x14]
	strb r6, [r0, #0xd]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D65C: .4byte 0x020229B4
_0802D660: .4byte 0x085CCE65
	thumb_func_end sub_0802D5EC

	thumb_func_start sub_0802D664
sub_0802D664: @ 0x0802D664
	push {r4, lr}
	ldr r4, _0802D67C
	ldr r0, [r4]
	ldrb r0, [r0, #0xd]
	cmp r0, #1
	beq _0802D6B8
	cmp r0, #1
	bgt _0802D680
	cmp r0, #0
	beq _0802D68A
	b _0802D6FC
	.align 2, 0
_0802D67C: .4byte 0x020229B4
_0802D680:
	cmp r0, #2
	beq _0802D6DE
	cmp r0, #3
	beq _0802D6F2
	b _0802D6FC
_0802D68A:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D6FC
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	movs r1, #1
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r4]
	ldrb r0, [r1, #0xd]
	adds r0, #1
	strb r0, [r1, #0xd]
	b _0802D6FC
_0802D6B8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D6FC
	ldr r1, [r4]
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	bne _0802D6D0
	ldrb r0, [r1, #0xd]
	adds r0, #2
	b _0802D6F0
_0802D6D0:
	ldrh r0, [r1, #0x14]
	bl PlayFanfare
	ldr r1, [r4]
	ldrb r0, [r1, #0xd]
	adds r0, #1
	strb r0, [r1, #0xd]
_0802D6DE:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802D6FC
	ldr r0, _0802D6F8
	ldr r1, [r0]
	ldrb r0, [r1, #0xd]
	adds r0, #1
_0802D6F0:
	strb r0, [r1, #0xd]
_0802D6F2:
	movs r0, #0
	b _0802D6FE
	.align 2, 0
_0802D6F8: .4byte 0x020229B4
_0802D6FC:
	movs r0, #1
_0802D6FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802D664

	thumb_func_start sub_0802D704
sub_0802D704: @ 0x0802D704
	push {r4, lr}
	ldr r4, _0802D730
	ldr r0, [r4]
	ldrh r0, [r0, #0x12]
	cmp r0, #0xff
	beq _0802D728
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl rbox_fill_rectangle
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	movs r1, #1
	bl CopyWindowToVram
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0xd]
_0802D728:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D730: .4byte 0x020229B4
	thumb_func_end sub_0802D704

	thumb_func_start sub_0802D734
sub_0802D734: @ 0x0802D734
	push {r4, lr}
	ldr r4, _0802D744
	ldr r1, [r4]
	ldrh r0, [r1, #0x12]
	cmp r0, #0xff
	bne _0802D748
_0802D740:
	movs r0, #0
	b _0802D774
	.align 2, 0
_0802D744: .4byte 0x020229B4
_0802D748:
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _0802D76E
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D772
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	bl RemoveWindow
	ldr r1, [r4]
	movs r0, #0xff
	strh r0, [r1, #0x12]
	ldrb r0, [r1, #0xd]
	adds r0, #1
	strb r0, [r1, #0xd]
	b _0802D740
_0802D76E:
	cmp r0, #1
	beq _0802D740
_0802D772:
	movs r0, #1
_0802D774:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802D734

	thumb_func_start sub_0802D77C
sub_0802D77C: @ 0x0802D77C
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802D77C

	thumb_func_start sub_0802D78C
sub_0802D78C: @ 0x0802D78C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r6, _0802D7F4
	ldr r4, [sp]
	ands r4, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r5, _0802D7F8
	ands r4, r5
	orrs r4, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #8
	ldr r0, _0802D7FC
	ands r4, r0
	orrs r4, r1
	lsls r2, r2, #0x18
	ldr r0, _0802D800
	ands r4, r0
	orrs r4, r2
	str r4, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [sp, #4]
	ands r0, r6
	orrs r0, r3
	ands r0, r5
	movs r1, #0xf0
	lsls r1, r1, #4
	orrs r0, r1
	ldr r1, _0802D804
	ands r0, r1
	movs r1, #0xcc
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl AddWindow
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x11
	bl FillWindowPixelBuffer
	adds r0, r4, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802D7F4: .4byte 0xFFFFFF00
_0802D7F8: .4byte 0xFFFF00FF
_0802D7FC: .4byte 0xFF00FFFF
_0802D800: .4byte 0x00FFFFFF
_0802D804: .4byte 0x0000FFFF
	thumb_func_end sub_0802D78C

	thumb_func_start sub_0802D808
sub_0802D808: @ 0x0802D808
	push {r4, r5, lr}
	sub sp, #0x14
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r5, _0802D870
	ldr r3, [sp, #0xc]
	ands r3, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r4, _0802D874
	ands r3, r4
	orrs r3, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #8
	ldr r0, _0802D878
	ands r3, r0
	orrs r3, r1
	ldr r0, _0802D87C
	ands r3, r0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	orrs r3, r0
	str r3, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ands r0, r5
	movs r1, #4
	orrs r0, r1
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	ldr r1, _0802D880
	ands r0, r1
	movs r1, #0xd8
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [sp, #0x10]
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r0, sp, #0xc
	movs r1, #1
	movs r2, #2
	movs r3, #2
	bl sub_08198C08
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D870: .4byte 0xFFFFFF00
_0802D874: .4byte 0xFFFF00FF
_0802D878: .4byte 0xFF00FFFF
_0802D87C: .4byte 0x00FFFFFF
_0802D880: .4byte 0x0000FFFF
	thumb_func_end sub_0802D808

	thumb_func_start sub_0802D884
sub_0802D884: @ 0x0802D884
	push {r4, lr}
	sub sp, #0x10
	ldr r1, _0802D8E4
	add r0, sp, #0xc
	movs r2, #3
	bl memcpy
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	add r0, sp, #0xc
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r0, _0802D8E8
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	add r0, sp, #0xc
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, _0802D8EC
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D8E4: .4byte 0x082D1A68
_0802D8E8: .4byte 0x085CCDF8
_0802D8EC: .4byte 0x085CCDFB
	thumb_func_end sub_0802D884

	thumb_func_start sub_0802D8F0
sub_0802D8F0: @ 0x0802D8F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	bl sub_0802C5A0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r1, _0802D96C
	subs r0, #2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	movs r6, #0
	cmp r6, sl
	bge _0802D95A
	ldr r0, _0802D970
	mov sb, r0
	ldr r1, _0802D974
	mov r8, r1
_0802D91E:
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_0802C5BC
	adds r1, r0, #0
	ldrh r0, [r1]
	lsls r0, r0, #2
	add r0, sb
	ldrb r3, [r0, #1]
	mov r2, r8
	ldr r0, [r2]
	movs r7, #0
	ldrsh r2, [r5, r7]
	adds r3, #0x70
	str r4, [sp]
	bl sub_0802C6C8
	mov r1, r8
	ldr r0, [r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r2, #0x70
	adds r3, r4, #0
	bl sub_0802CB3C
	adds r5, #2
	adds r6, #1
	cmp r6, sl
	blt _0802D91E
_0802D95A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D96C: .4byte 0x082D1AEC
_0802D970: .4byte 0x082D45C8
_0802D974: .4byte 0x020229B4
	thumb_func_end sub_0802D8F0

	thumb_func_start sub_0802D978
sub_0802D978: @ 0x0802D978
	ldr r2, _0802D98C
	ldr r2, [r2]
	lsls r0, r0, #2
	ldr r3, _0802D990
	adds r2, r2, r3
	adds r2, r2, r0
	ldr r0, [r2]
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
_0802D98C: .4byte 0x020229B4
_0802D990: .4byte 0x000081A8
	thumb_func_end sub_0802D978

	thumb_func_start sub_0802D994
sub_0802D994: @ 0x0802D994
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802D9BC
	ldr r0, [r0]
	adds r1, r4, #0
	bl sub_0802CC44
	ldr r0, _0802D9C0
	adds r4, r4, r0
	ldrb r0, [r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #2
	movs r2, #0
	bl ChangeBgY
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D9BC: .4byte 0x020229B4
_0802D9C0: .4byte 0x082D1A6B
	thumb_func_end sub_0802D994

	thumb_func_start sub_0802D9C4
sub_0802D9C4: @ 0x0802D9C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0
	movs r6, #0
_0802D9CE:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0802D9E2
	ldr r0, _0802D9FC
	ldr r0, [r0]
	adds r1, r5, #0
	bl sub_0802C808
	adds r6, #1
_0802D9E2:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #4
	ble _0802D9CE
	subs r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0802DD04
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802D9FC: .4byte 0x020229B4
	thumb_func_end sub_0802D9C4

	thumb_func_start sub_0802DA00
sub_0802DA00: @ 0x0802DA00
	push {r4, lr}
	sub sp, #0x10
	mov r1, sp
	movs r0, #0x40
	strb r0, [r1]
	movs r0, #5
	strb r0, [r1, #1]
	movs r0, #8
	strb r0, [r1, #2]
	movs r0, #0x6c
	strh r0, [r1, #4]
	movs r4, #6
	strh r4, [r1, #6]
	ldr r0, _0802DA54
	str r0, [sp, #8]
	ldr r0, _0802DA58
	str r0, [sp, #0xc]
	movs r0, #2
	bl sub_08034AAC
	movs r0, #0
	movs r1, #0
	mov r2, sp
	bl sub_08034B6C
	mov r1, sp
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x1e
	strh r0, [r1, #4]
	mov r0, sp
	strh r4, [r0, #6]
	movs r0, #1
	movs r1, #0
	mov r2, sp
	bl sub_08034B6C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA54: .4byte 0x082D1A78
_0802DA58: .4byte 0x082D1A80
	thumb_func_end sub_0802DA00

	thumb_func_start sub_0802DA5C
sub_0802DA5C: @ 0x0802DA5C
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_08034E9C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802DA5C

	thumb_func_start sub_0802DA6C
sub_0802DA6C: @ 0x0802DA6C
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	bl sub_08034E9C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802DA6C

	thumb_func_start sub_0802DA80
sub_0802DA80: @ 0x0802DA80
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802DA94
	ldr r0, [r0]
	bl sub_0802C8E4
	pop {r0}
	bx r0
	.align 2, 0
_0802DA94: .4byte 0x020229B4
	thumb_func_end sub_0802DA80

	thumb_func_start sub_0802DA98
sub_0802DA98: @ 0x0802DA98
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802DAAC
	ldr r0, [r0]
	bl sub_0802C97C
	pop {r0}
	bx r0
	.align 2, 0
_0802DAAC: .4byte 0x020229B4
	thumb_func_end sub_0802DA98

	thumb_func_start sub_0802DAB0
sub_0802DAB0: @ 0x0802DAB0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802DAC0
	ldr r0, [r0]
	bl sub_0802C90C
	pop {r1}
	bx r1
	.align 2, 0
_0802DAC0: .4byte 0x020229B4
	thumb_func_end sub_0802DAB0

	thumb_func_start sub_0802DAC4
sub_0802DAC4: @ 0x0802DAC4
	push {lr}
	ldr r0, _0802DAD4
	ldr r0, [r0]
	bl sub_0802C9A4
	pop {r0}
	bx r0
	.align 2, 0
_0802DAD4: .4byte 0x020229B4
	thumb_func_end sub_0802DAC4

	thumb_func_start sub_0802DAD8
sub_0802DAD8: @ 0x0802DAD8
	push {lr}
	ldr r0, _0802DAE8
	ldr r0, [r0]
	bl sub_0802CA30
	pop {r0}
	bx r0
	.align 2, 0
_0802DAE8: .4byte 0x020229B4
	thumb_func_end sub_0802DAD8

	thumb_func_start sub_0802DAEC
sub_0802DAEC: @ 0x0802DAEC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802DAFC
	ldr r0, [r0]
	bl sub_0802CA64
	pop {r0}
	bx r0
	.align 2, 0
_0802DAFC: .4byte 0x020229B4
	thumb_func_end sub_0802DAEC

	thumb_func_start sub_0802DB00
sub_0802DB00: @ 0x0802DB00
	push {lr}
	ldr r0, _0802DB10
	ldr r0, [r0]
	bl sub_0802CA8C
	pop {r1}
	bx r1
	.align 2, 0
_0802DB10: .4byte 0x020229B4
	thumb_func_end sub_0802DB00

	thumb_func_start sub_0802DB14
sub_0802DB14: @ 0x0802DB14
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	bl sub_0802C5A0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _0802DBB4
	subs r0, r7, #2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r2, _0802DBB8
	ldr r0, [sp]
	ands r0, r2
	ldr r1, _0802DBBC
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x14
	orrs r0, r1
	str r0, [sp]
	ldr r0, [sp, #4]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _0802DBC0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	ldr r1, _0802DBC4
	ands r0, r1
	movs r1, #0xd8
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [sp, #4]
	movs r5, #0
	cmp r5, r7
	bge _0802DBA4
	mov r6, sp
_0802DB62:
	ldrb r0, [r4]
	lsls r0, r0, #8
	ldr r2, _0802DBC0
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldrb r2, [r4, #2]
	lsls r2, r2, #0x10
	ldr r0, _0802DBC8
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	mov r0, sp
	bl AddWindow
	ldr r1, _0802DBCC
	ldr r1, [r1]
	lsls r2, r5, #1
	adds r1, #0x1c
	adds r1, r1, r2
	strh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ClearWindowTilemap
	ldrh r0, [r6, #6]
	adds r0, #0x10
	strh r0, [r6, #6]
	adds r4, #4
	adds r5, #1
	cmp r5, r7
	blt _0802DB62
_0802DBA4:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DBB4: .4byte 0x082D1AC0
_0802DBB8: .4byte 0xFFFFFF00
_0802DBBC: .4byte 0x00FFFFFF
_0802DBC0: .4byte 0xFFFF00FF
_0802DBC4: .4byte 0x0000FFFF
_0802DBC8: .4byte 0xFF00FFFF
_0802DBCC: .4byte 0x020229B4
	thumb_func_end sub_0802DB14

	thumb_func_start sub_0802DBD0
sub_0802DBD0: @ 0x0802DBD0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r5, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	add r0, sp, #0xc
	strb r1, [r0]
	strb r2, [r0, #1]
	strb r3, [r0, #2]
	ldr r6, _0802DC64
	ldr r0, [r6]
	lsls r1, r5, #1
	mov r8, r1
	adds r0, #0x1c
	add r0, r8
	ldrb r0, [r0]
	movs r1, #0
	bl FillWindowPixelBuffer
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_0802C5DC
	adds r1, r0, #0
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	movs r0, #0
	bl GetStringWidth
	movs r4, #0x40
	subs r4, r4, r0
	lsrs r4, r4, #1
	adds r0, r5, #0
	bl sub_0802C5DC
	adds r1, r0, #0
	ldr r0, [r6]
	adds r0, #0x1c
	add r0, r8
	ldrb r0, [r0]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	add r2, sp, #0xc
	str r2, [sp]
	mov r2, sb
	str r2, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0
	adds r2, r4, #0
	movs r3, #2
	bl AddTextPrinterParameterized3
	ldr r0, [r6]
	adds r0, #0x1c
	add r0, r8
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DC64: .4byte 0x020229B4
	thumb_func_end sub_0802DBD0

	thumb_func_start sub_0802DC68
sub_0802DC68: @ 0x0802DC68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0802C5A0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r4, #0
	bne _0802DC92
	movs r4, #0
	cmp r4, r5
	bge _0802DCC4
_0802DC7E:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	movs r3, #3
	bl sub_0802DBD0
	adds r4, #1
	cmp r4, r5
	blt _0802DC7E
	b _0802DCC4
_0802DC92:
	bl sub_0802C5B0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r4, #0
	cmp r4, r5
	bge _0802DCC4
_0802DCA0:
	cmp r6, r4
	beq _0802DCB2
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	movs r3, #3
	bl sub_0802DBD0
	b _0802DCBE
_0802DCB2:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #5
	bl sub_0802DBD0
_0802DCBE:
	adds r4, #1
	cmp r4, r5
	blt _0802DCA0
_0802DCC4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802DC68

	thumb_func_start sub_0802DCCC
sub_0802DCCC: @ 0x0802DCCC
	push {r4, r5, lr}
	bl sub_0802C5A0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #0
	cmp r4, r5
	bge _0802DCF2
_0802DCDC:
	ldr r0, _0802DD00
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x1c
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	adds r4, #1
	cmp r4, r5
	blt _0802DCDC
_0802DCF2:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD00: .4byte 0x020229B4
	thumb_func_end sub_0802DCCC

	thumb_func_start sub_0802DD04
sub_0802DD04: @ 0x0802DD04
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _0802DD48
	ldr r2, [r0]
	movs r0, #0
	str r0, [r2, #0x18]
	lsrs r1, r1, #0x19
	lsls r1, r1, #0x10
	movs r0, #1
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	ands r4, r0
	lsls r4, r4, #8
	subs r4, #0x28
	lsls r4, r4, #8
	adds r1, r4, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	bl ShowBg
	ldr r0, _0802DD4C
	movs r1, #4
	bl CreateTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD48: .4byte 0x020229B4
_0802DD4C: .4byte 0x0802DD89
	thumb_func_end sub_0802DD04

	thumb_func_start sub_0802DD50
sub_0802DD50: @ 0x0802DD50
	push {r4, lr}
	ldr r4, _0802DD60
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	cmp r0, #0x1f
	bls _0802DD64
	movs r0, #0
	b _0802DD82
	.align 2, 0
_0802DD60: .4byte 0x020229B4
_0802DD64:
	movs r0, #1
	movs r1, #0x80
	movs r2, #1
	bl ChangeBgY
	ldr r1, [r4]
	ldr r0, [r1, #0x18]
	adds r0, #1
	str r0, [r1, #0x18]
	cmp r0, #0x1f
	bls _0802DD80
	movs r0, #1
	bl HideBg
_0802DD80:
	movs r0, #1
_0802DD82:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802DD50

	thumb_func_start sub_0802DD88
sub_0802DD88: @ 0x0802DD88
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_0802DD50
	cmp r0, #0
	bne _0802DD9C
	adds r0, r4, #0
	bl DestroyTask
_0802DD9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802DD88

	thumb_func_start sub_0802DDA4
sub_0802DDA4: @ 0x0802DDA4
	push {lr}
	sub sp, #0xc
	mov r2, sp
	movs r1, #1
	strb r1, [r2]
	ldrh r1, [r0]
	strh r1, [r2, #2]
	ldr r1, [r0, #4]
	str r1, [sp, #8]
	ldr r0, [r0, #8]
	str r0, [sp, #4]
	mov r0, sp
	bl sub_0800F934
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802DDA4

	thumb_func_start sub_0802DDC8
sub_0802DDC8: @ 0x0802DDC8
	push {r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldr r3, _0802DDFC
	lsls r2, r0, #4
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	movs r1, #0xbc
	lsls r1, r1, #6
	cmp r0, r1
	bne _0802DDF8
	adds r1, r3, #2
	adds r1, r2, r1
	mov r0, sp
	movs r2, #0xc
	bl memcpy
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #1
	beq _0802DE00
_0802DDF8:
	movs r0, #0
	b _0802DE10
	.align 2, 0
_0802DDFC: .4byte 0x03003130
_0802DE00:
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r4]
	ldr r0, [sp, #8]
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	str r0, [r4, #8]
	movs r0, #1
_0802DE10:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802DDC8

	thumb_func_start sub_0802DE18
sub_0802DE18: @ 0x0802DE18
	push {lr}
	sub sp, #0xc
	mov r2, sp
	movs r1, #2
	strb r1, [r2]
	str r0, [sp, #4]
	mov r0, sp
	bl sub_0800F934
	add sp, #0xc
	pop {r0}
	bx r0
	thumb_func_end sub_0802DE18

	thumb_func_start sub_0802DE30
sub_0802DE30: @ 0x0802DE30
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	mov r3, sp
	movs r2, #3
	strb r2, [r3]
	ldr r3, [r1, #8]
	lsls r3, r3, #0xf
	ldr r2, [sp, #8]
	ldr r4, _0802DEAC
	mov r8, r4
	ands r2, r4
	orrs r2, r3
	str r2, [sp, #8]
	mov r6, sp
	ldrb r2, [r1, #1]
	movs r5, #0x1f
	adds r3, r5, #0
	ands r3, r2
	ldrb r4, [r6, #3]
	movs r2, #0x20
	rsbs r2, r2, #0
	ands r2, r4
	orrs r2, r3
	strb r2, [r6, #3]
	mov r3, sp
	ldrb r2, [r1]
	strb r2, [r3, #1]
	ldrh r2, [r1, #2]
	strh r2, [r3, #6]
	mov r4, sp
	ldrh r2, [r1, #4]
	mov r1, r8
	ands r2, r1
	ldrh r3, [r4, #8]
	ldr r1, _0802DEB0
	ands r1, r3
	orrs r1, r2
	strh r1, [r4, #8]
	mov r2, sp
	ldrh r1, [r0, #0x10]
	strb r1, [r2, #2]
	mov r3, sp
	ldr r1, [r0, #0x14]
	lsls r1, r1, #5
	ldrb r2, [r3, #3]
	ands r5, r2
	orrs r5, r1
	strb r5, [r3, #3]
	mov r1, sp
	ldrh r0, [r0, #0xe]
	strh r0, [r1, #4]
	mov r0, sp
	bl sub_0800F934
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DEAC: .4byte 0x00007FFF
_0802DEB0: .4byte 0xFFFF8000
	thumb_func_end sub_0802DE30

	thumb_func_start sub_0802DEB4
sub_0802DEB4: @ 0x0802DEB4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, _0802DF1C
	ldrh r0, [r2]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0xbc
	lsls r0, r0, #6
	cmp r1, r0
	bne _0802DF20
	adds r1, r2, #2
	mov r0, sp
	movs r2, #0xc
	bl memcpy
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #3
	bne _0802DF20
	ldr r0, [sp, #8]
	lsrs r0, r0, #0xf
	str r0, [r4, #8]
	mov r0, sp
	ldrb r1, [r0, #3]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r4, #1]
	mov r0, sp
	ldrb r0, [r0, #1]
	strb r0, [r4]
	mov r0, sp
	ldrh r0, [r0, #6]
	strh r0, [r4, #2]
	mov r0, sp
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x11
	strh r0, [r4, #4]
	mov r0, sp
	ldrb r0, [r0, #2]
	strh r0, [r5, #0x10]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	str r1, [r5, #0x14]
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r5, #0xe]
	movs r0, #1
	b _0802DF22
	.align 2, 0
_0802DF1C: .4byte 0x03003130
_0802DF20:
	movs r0, #0
_0802DF22:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802DEB4

	thumb_func_start sub_0802DF2C
sub_0802DF2C: @ 0x0802DF2C
	push {r4, lr}
	sub sp, #0xc
	mov r4, sp
	movs r3, #4
	strb r3, [r4]
	ldrh r3, [r0, #0x10]
	strb r3, [r4, #1]
	ldr r3, [r0, #0x14]
	strb r3, [r4, #2]
	ldr r3, [r0, #0x18]
	strb r3, [r4, #3]
	mov r3, sp
	ldrh r0, [r0, #0xe]
	strh r0, [r3, #4]
	mov r0, sp
	strb r1, [r0, #6]
	strh r2, [r0, #8]
	bl sub_0800F934
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802DF2C

	thumb_func_start sub_0802DF5C
sub_0802DF5C: @ 0x0802DF5C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r3, _0802DFB8
	lsls r2, r1, #4
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	movs r1, #0xbc
	lsls r1, r1, #6
	cmp r0, r1
	bne _0802DFBC
	adds r1, r3, #2
	adds r1, r2, r1
	mov r0, sp
	movs r2, #0xc
	bl memcpy
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #4
	bne _0802DFBC
	mov r0, sp
	ldrb r0, [r0, #1]
	strh r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #2]
	str r0, [r4, #0x14]
	mov r0, sp
	ldrb r0, [r0, #3]
	str r0, [r4, #0x18]
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xe]
	mov r0, sp
	ldrb r0, [r0, #6]
	strb r0, [r5]
	mov r0, sp
	ldrh r0, [r0, #8]
	strh r0, [r6]
	movs r0, #1
	b _0802DFBE
	.align 2, 0
_0802DFB8: .4byte 0x03003130
_0802DFBC:
	movs r0, #0
_0802DFBE:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802DF5C

	thumb_func_start sub_0802DFC8
sub_0802DFC8: @ 0x0802DFC8
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r3, _0802E014
	lsls r2, r1, #4
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	movs r1, #0xbc
	lsls r1, r1, #6
	cmp r0, r1
	bne _0802E018
	adds r1, r3, #2
	adds r1, r2, r1
	mov r0, sp
	movs r2, #0xc
	bl memcpy
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #4
	bne _0802E018
	mov r0, sp
	ldrb r0, [r0, #1]
	strh r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #2]
	str r0, [r4, #0x14]
	mov r0, sp
	ldrb r0, [r0, #3]
	str r0, [r4, #0x18]
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xe]
	movs r0, #1
	b _0802E01A
	.align 2, 0
_0802E014: .4byte 0x03003130
_0802E018:
	movs r0, #0
_0802E01A:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802DFC8

	thumb_func_start sub_0802E024
sub_0802E024: @ 0x0802E024
	ldr r0, _0802E030
	ldr r0, [r0]
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802E030: .4byte 0x03005AF0
	thumb_func_end sub_0802E024

	thumb_func_start ResetPokeJumpResults
ResetPokeJumpResults: @ 0x0802E034
	push {lr}
	bl sub_0802E024
	movs r1, #0
	strh r1, [r0]
	str r1, [r0, #0xc]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	str r1, [r0, #8]
	strh r1, [r0, #2]
	pop {r0}
	bx r0
	thumb_func_end ResetPokeJumpResults

	thumb_func_start sub_0802E04C
sub_0802E04C: @ 0x0802E04C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	bl sub_0802E024
	adds r1, r0, #0
	movs r2, #0
	ldr r0, [r1, #0xc]
	cmp r0, r4
	bhs _0802E070
	ldr r0, _0802E098
	cmp r4, r0
	bhi _0802E070
	str r4, [r1, #0xc]
	movs r2, #1
_0802E070:
	ldrh r0, [r1]
	cmp r0, r5
	bhs _0802E080
	ldr r0, _0802E09C
	cmp r5, r0
	bhi _0802E080
	strh r5, [r1]
	movs r2, #1
_0802E080:
	ldrh r0, [r1, #4]
	cmp r0, r6
	bhs _0802E090
	ldr r0, _0802E09C
	cmp r6, r0
	bhi _0802E090
	strh r6, [r1, #4]
	movs r2, #1
_0802E090:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802E098: .4byte 0x00018696
_0802E09C: .4byte 0x0000270F
	thumb_func_end sub_0802E04C

	thumb_func_start sub_0802E0A0
sub_0802E0A0: @ 0x0802E0A0
	push {lr}
	bl sub_0802E024
	adds r2, r0, #0
	ldrh r1, [r2, #6]
	ldr r0, _0802E0B8
	cmp r1, r0
	bhi _0802E0B4
	adds r0, r1, #1
	strh r0, [r2, #6]
_0802E0B4:
	pop {r0}
	bx r0
	.align 2, 0
_0802E0B8: .4byte 0x0000270E
	thumb_func_end sub_0802E0A0

	thumb_func_start sub_0802E0BC
sub_0802E0BC: @ 0x0802E0BC
	push {r4, lr}
	ldr r4, _0802E0D8
	adds r0, r4, #0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E0D8: .4byte 0x0802E0DD
	thumb_func_end sub_0802E0BC

	thumb_func_start sub_0802E0DC
sub_0802E0DC: @ 0x0802E0DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0802E100
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0802E128
	cmp r0, #1
	bgt _0802E104
	cmp r0, #0
	beq _0802E10E
	b _0802E176
	.align 2, 0
_0802E100: .4byte 0x03005B68
_0802E104:
	cmp r0, #2
	beq _0802E134
	cmp r0, #3
	beq _0802E15C
	b _0802E176
_0802E10E:
	ldr r0, _0802E124
	bl AddWindow
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	bl sub_0802E17C
	ldrb r0, [r4, #2]
	movs r1, #3
	b _0802E14A
	.align 2, 0
_0802E124: .4byte 0x082D1AFC
_0802E128:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E176
	b _0802E14E
_0802E134:
	ldr r0, _0802E158
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0802E176
	ldrb r0, [r4, #2]
	bl rbox_fill_rectangle
	ldrb r0, [r4, #2]
	movs r1, #1
_0802E14A:
	bl CopyWindowToVram
_0802E14E:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _0802E176
	.align 2, 0
_0802E158: .4byte 0x03002360
_0802E15C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E176
	ldrb r0, [r4, #2]
	bl RemoveWindow
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_0802E176:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0802E0DC

	thumb_func_start sub_0802E17C
sub_0802E17C: @ 0x0802E17C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	bl sub_0802E024
	ldrh r1, [r0]
	str r1, [sp, #0xc]
	ldr r1, [r0, #0xc]
	str r1, [sp, #0x10]
	ldrh r0, [r0, #4]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	lsls r4, r0, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _0802E274
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx_
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl DrawTextBorderOuter
	adds r0, r4, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _0802E278
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r6, #0
	adds r7, r4, #0
	movs r1, #0xff
	mov sl, r1
	mov sb, r6
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x1c]
	movs r1, #0xd0
	lsls r1, r1, #0x15
	mov r8, r1
	ldr r5, _0802E27C
_0802E1F2:
	ldr r1, _0802E280
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	mov r0, r8
	lsrs r4, r0, #0x18
	str r4, [sp]
	mov r1, sl
	str r1, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x1c]
	ldm r0!, {r1}
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #5
	bl ConvertIntToDecimalStringN
	adds r0, r5, #0
	bl TruncateToFirstWordOnly
	movs r0, #1
	adds r1, r5, #0
	movs r2, #0
	bl GetStringWidth
	movs r3, #0xa0
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r4, [sp]
	mov r1, sl
	str r1, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	adds r2, r5, #0
	bl AddTextPrinterParameterized
	movs r1, #0x80
	lsls r1, r1, #0x15
	add r8, r1
	adds r6, #1
	ldr r1, [sp, #0x18]
	lsls r0, r1, #0x18
	cmp r6, #2
	bls _0802E1F2
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E274: .4byte 0x0000021D
_0802E278: .4byte 0x085CCDFE
_0802E27C: .4byte 0x02021C40
_0802E280: .4byte 0x082D1B04
	thumb_func_end sub_0802E17C

	thumb_func_start TruncateToFirstWordOnly
TruncateToFirstWordOnly: @ 0x0802E284
	push {lr}
	adds r1, r0, #0
	b _0802E28C
_0802E28A:
	adds r1, #1
_0802E28C:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0802E29A
	cmp r0, #0
	bne _0802E28A
	movs r0, #0xff
	strb r0, [r1]
_0802E29A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TruncateToFirstWordOnly

	thumb_func_start sub_0802E2A0
sub_0802E2A0: @ 0x0802E2A0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802E2E0
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0802E2E4
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0, #8]
	strh r5, [r0, #0xa]
	ldr r0, _0802E2E8
	lsls r5, r5, #4
	adds r5, r5, r0
	ldr r1, [r5]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802E2E0: .4byte 0x0802E335
_0802E2E4: .4byte 0x03005B60
_0802E2E8: .4byte 0x082D1FD4
	thumb_func_end sub_0802E2A0

	thumb_func_start sub_0802E2EC
sub_0802E2EC: @ 0x0802E2EC
	push {lr}
	ldr r0, _0802E310
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _0802E318
	ldr r0, _0802E314
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	strh r0, [r1, #8]
	movs r0, #1
	b _0802E31A
	.align 2, 0
_0802E310: .4byte 0x0802E335
_0802E314: .4byte 0x03005B60
_0802E318:
	movs r0, #0
_0802E31A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802E2EC

	thumb_func_start sub_0802E320
sub_0802E320: @ 0x0802E320
	push {lr}
	ldr r0, _0802E330
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0802E330: .4byte 0x0802E335
	thumb_func_end sub_0802E320

	thumb_func_start sub_0802E334
sub_0802E334: @ 0x0802E334
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0802E358
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #3
	beq _0802E380
	cmp r0, #3
	bgt _0802E35C
	cmp r0, #2
	beq _0802E362
	b _0802E3B6
	.align 2, 0
_0802E358: .4byte 0x03005B68
_0802E35C:
	cmp r0, #4
	beq _0802E39C
	b _0802E3B6
_0802E362:
	ldr r1, _0802E37C
	movs r2, #2
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, #8
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	movs r0, #3
	strh r0, [r4]
	b _0802E3B6
	.align 2, 0
_0802E37C: .4byte 0x082D1FD4
_0802E380:
	ldr r0, _0802E398
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r1, r1, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl _call_via_r1
	b _0802E3B6
	.align 2, 0
_0802E398: .4byte 0x082D1FD4
_0802E39C:
	ldr r0, _0802E3BC
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r1, r1, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r5, #0
	bl DestroyTask
_0802E3B6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E3BC: .4byte 0x082D1FD4
	thumb_func_end sub_0802E334

	thumb_func_start sub_0802E3C0
sub_0802E3C0: @ 0x0802E3C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #3
	ldr r1, _0802E490
	adds r0, r0, r1
	bl LoadCompressedSpriteSheet
	movs r2, #8
	ldrsh r0, [r4, r2]
	lsls r0, r0, #3
	ldr r1, _0802E494
	adds r0, r0, r1
	bl LoadSpritePalette
	movs r5, #0
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r5, r0
	bge _0802E428
_0802E3F4:
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0802E498
	adds r0, r0, r1
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	movs r3, #0x14
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, #0xe]
	bl CreateSprite
	lsls r1, r5, #1
	adds r1, r1, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x1a]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _0802E3F4
_0802E428:
	movs r5, #0
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r5, r0
	bge _0802E484
	movs r7, #3
	movs r3, #0xd
	rsbs r3, r3, #0
	mov ip, r3
	ldr r6, _0802E49C
_0802E43C:
	lsls r0, r5, #1
	adds r0, r0, r4
	movs r1, #0x1a
	ldrsh r0, [r0, r1]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrb r1, [r4, #0xc]
	ands r1, r7
	lsls r1, r1, #2
	ldrb r3, [r2, #5]
	mov r0, ip
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	adds r3, r2, #0
	adds r3, #0x3e
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, #0xa]
	strh r0, [r2, #0x30]
	mov r3, r8
	strh r3, [r2, #0x34]
	strh r5, [r2, #0x36]
	ldrh r0, [r4, #0x1a]
	strh r0, [r2, #0x38]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _0802E43C
_0802E484:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E490: .4byte 0x082D1F54
_0802E494: .4byte 0x082D1F64
_0802E498: .4byte 0x082D1FBC
_0802E49C: .4byte 0x020205AC
	thumb_func_end sub_0802E3C0

	thumb_func_start sub_0802E4A0
sub_0802E4A0: @ 0x0802E4A0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r1, _0802E520
	adds r4, r4, r1
	movs r5, #0
	strh r5, [r4, #4]
	strh r5, [r4, #6]
	strh r5, [r4, #8]
	movs r1, #0x3c
	strh r1, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0xe]
	movs r1, #3
	strh r1, [r4, #0x10]
	movs r1, #0x78
	strh r1, [r4, #0x12]
	movs r1, #0x58
	strh r1, [r4, #0x14]
	adds r1, r4, #0
	bl sub_0802E3C0
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _0802E524
	adds r0, r0, r5
	movs r1, #4
	bl StartSpriteAnim
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0802E528
	strh r1, [r0, #0x24]
	movs r0, #0x1e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #5
	bl StartSpriteAnim
	movs r0, #0x1e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x20
	strh r1, [r0, #0x24]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E520: .4byte 0x03005B68
_0802E524: .4byte 0x020205AC
_0802E528: .4byte 0x0000FFE0
	thumb_func_end sub_0802E4A0

	thumb_func_start sub_0802E52C
sub_0802E52C: @ 0x0802E52C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0802E540
	adds r4, r1, r0
	b _0802E560
	.align 2, 0
_0802E540: .4byte 0x03005B68
_0802E544:
	lsls r0, r5, #1
	adds r0, r0, r4
	movs r2, #0x1a
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802E590
	adds r0, r0, r1
	bl DestroySprite
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E560:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _0802E544
	ldr r1, _0802E594
	movs r2, #6
	ldrsh r0, [r4, r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	bl FreeSpriteTilesByTag
	ldr r1, _0802E598
	movs r2, #8
	ldrsh r0, [r4, r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	bl FreeSpritePaletteByTag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E590: .4byte 0x020205AC
_0802E594: .4byte 0x082D1F54
_0802E598: .4byte 0x082D1F64
	thumb_func_end sub_0802E52C

	thumb_func_start sub_0802E59C
sub_0802E59C: @ 0x0802E59C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x34
	ldrsh r1, [r6, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0802E5E0
	adds r5, r0, r1
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	movs r2, #0xa
	ldrsh r1, [r5, r2]
	bl __modsi3
	cmp r0, #0
	bne _0802E6AE
	ldrh r2, [r5, #0x16]
	movs r3, #0x16
	ldrsh r1, [r5, r3]
	movs r3, #0x14
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0802E6AE
	strh r2, [r5, #0x14]
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0802E6A8
	lsls r0, r0, #2
	ldr r1, _0802E5E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E5E0: .4byte 0x03005B68
_0802E5E4: .4byte 0x0802E5E8
_0802E5E8: @ jump table
	.4byte _0802E5FC @ case 0
	.4byte _0802E60A @ case 1
	.4byte _0802E60A @ case 2
	.4byte _0802E61E @ case 3
	.4byte _0802E668 @ case 4
_0802E5FC:
	adds r2, r6, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0802E60A:
	movs r0, #0x38
	bl PlaySE
	ldrh r1, [r6, #0x32]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl StartSpriteAnim
	b _0802E6A8
_0802E61E:
	movs r0, #0x15
	bl PlaySE
	ldrh r1, [r6, #0x32]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl StartSpriteAnim
	ldr r4, _0802E664
	movs r2, #0x1c
	ldrsh r0, [r5, r2]
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
	movs r3, #0x1e
	ldrsh r1, [r5, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _0802E6A8
	.align 2, 0
_0802E664: .4byte 0x020205AC
_0802E668:
	adds r1, r6, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _0802E6A4
	movs r0, #0x1c
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0x1e
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	movs r0, #4
	strh r0, [r5]
	b _0802E6AE
	.align 2, 0
_0802E6A4: .4byte 0x020205AC
_0802E6A8:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
_0802E6AE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0802E59C

	thumb_func_start sub_0802E6B4
sub_0802E6B4: @ 0x0802E6B4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r5, _0802E708
	adds r6, r4, r5
	movs r0, #0x38
	bl PlaySE
	ldr r2, _0802E70C
	movs r0, #0x1a
	ldrsh r1, [r6, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _0802E710
	str r1, [r0]
	movs r0, #0x1a
	ldrsh r1, [r6, r0]
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
	subs r5, #8
	adds r4, r4, r5
	movs r0, #3
	strh r0, [r4, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E708: .4byte 0x03005B68
_0802E70C: .4byte 0x020205AC
_0802E710: .4byte 0x0802E59D
	thumb_func_end sub_0802E6B4

	thumb_func_start sub_0802E714
sub_0802E714: @ 0x0802E714
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0802E768
	adds r4, r1, r0
	ldr r0, _0802E76C
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802E778
	ldr r1, _0802E770
	ldrh r0, [r1, #2]
	ldr r5, _0802E774
	cmp r0, r5
	bne _0802E73C
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x16]
_0802E73C:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E77E
	ldrh r0, [r4, #0x18]
	adds r0, #1
	strh r0, [r4, #0x18]
	mov r0, sp
	movs r1, #0
	movs r2, #0xc
	bl memset
	mov r0, sp
	strh r5, [r0]
	mov r1, sp
	ldrh r0, [r4, #0x18]
	strh r0, [r1, #2]
	mov r0, sp
	bl sub_0800F934
	b _0802E77E
	.align 2, 0
_0802E768: .4byte 0x03005B68
_0802E76C: .4byte 0x030031C4
_0802E770: .4byte 0x03003130
_0802E774: .4byte 0x00007FFF
_0802E778:
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
_0802E77E:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0802E714

	thumb_func_start sub_0802E788
sub_0802E788: @ 0x0802E788
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, [sp, #0x18]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0802E7E0
	movs r1, #0x50
	str r3, [sp]
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0802E7E4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xc]
	strh r5, [r1, #0xe]
	strh r6, [r1, #0x10]
	ldr r3, [sp]
	strh r3, [r1, #0x12]
	mov r0, r8
	strh r0, [r1, #0x14]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E7E0: .4byte 0x0802E7FD
_0802E7E4: .4byte 0x03005B60
	thumb_func_end sub_0802E788

	thumb_func_start sub_0802E7E8
sub_0802E7E8: @ 0x0802E7E8
	push {lr}
	ldr r0, _0802E7F8
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0802E7F8: .4byte 0x0802E7FD
	thumb_func_end sub_0802E7E8

	thumb_func_start sub_0802E7FC
sub_0802E7FC: @ 0x0802E7FC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0802E820
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _0802E86C
	cmp r0, #1
	bgt _0802E824
	cmp r0, #0
	beq _0802E82A
	b _0802E8EE
	.align 2, 0
_0802E820: .4byte 0x03005B68
_0802E824:
	cmp r0, #2
	beq _0802E8B0
	b _0802E8EE
_0802E82A:
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #6]
	bl sub_0802EBB4
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #6]
	movs r3, #8
	ldrsh r2, [r5, r3]
	movs r4, #0xa
	ldrsh r3, [r5, r4]
	ldrb r4, [r5, #0xc]
	str r4, [sp]
	bl sub_0802EC0C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5, #0xe]
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #6]
	movs r3, #8
	ldrsh r2, [r5, r3]
	movs r4, #0xa
	ldrsh r3, [r5, r4]
	ldrb r4, [r5, #0xc]
	str r4, [sp]
	adds r4, r5, #0
	adds r4, #0x10
	str r4, [sp, #4]
	adds r4, #2
	str r4, [sp, #8]
	bl sub_0802EC60
	b _0802E8A2
_0802E86C:
	ldrb r0, [r5, #0xe]
	bl sub_0802E8FC
	cmp r0, #0
	bne _0802E8EE
	ldrb r0, [r5, #0xe]
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x12]
	bl sub_0802EA30
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0802E8AC
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
_0802E8A2:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _0802E8EE
	.align 2, 0
_0802E8AC: .4byte 0x020205AC
_0802E8B0:
	ldrb r0, [r5, #0x10]
	bl sub_0802EA94
	cmp r0, #0
	bne _0802E8EE
	movs r4, #0x10
	ldrsh r1, [r5, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0802E8F8
	adds r0, r0, r4
	bl DestroySprite
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldrh r0, [r5, #4]
	bl FreeSpriteTilesByTag
	ldrh r0, [r5, #6]
	bl FreeSpritePaletteByTag
	adds r0, r6, #0
	bl DestroyTask
_0802E8EE:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E8F8: .4byte 0x020205AC
	thumb_func_end sub_0802E7FC

	thumb_func_start sub_0802E8FC
sub_0802E8FC: @ 0x0802E8FC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0802E920
	adds r4, r1, r0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #7
	bls _0802E916
	b _0802EA28
_0802E916:
	lsls r0, r0, #2
	ldr r1, _0802E924
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E920: .4byte 0x020205AC
_0802E924: .4byte 0x0802E928
_0802E928: @ jump table
	.4byte _0802E948 @ case 0
	.4byte _0802E95A @ case 1
	.4byte _0802E980 @ case 2
	.4byte _0802E990 @ case 3
	.4byte _0802E9B2 @ case 4
	.4byte _0802E9EA @ case 5
	.4byte _0802EA10 @ case 6
	.4byte _0802E9E6 @ case 7
_0802E948:
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, #0
	movs r2, #0x1a
	bl sub_08007B30
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_0802E95A:
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _0802E968
	movs r0, #0x39
	bl PlaySE
_0802E968:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _0802EA28
	movs r0, #0
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	movs r1, #1
	b _0802EA06
_0802E980:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802EA28
	b _0802EA0A
_0802E990:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0802EA28
	movs r0, #0
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	b _0802EA28
_0802E9B2:
	ldrh r0, [r4, #0x22]
	subs r0, #4
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0802EA28
	ldrh r1, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bgt _0802E9E2
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	movs r0, #0
	strh r0, [r4, #0x32]
	b _0802EA0A
_0802E9E2:
	movs r0, #7
	strh r0, [r4, #0x2e]
_0802E9E6:
	movs r0, #0
	b _0802EA2A
_0802E9EA:
	ldrh r0, [r4, #0x22]
	adds r0, #4
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0802EA28
	movs r0, #0
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	movs r1, #3
_0802EA06:
	bl StartSpriteAffineAnim
_0802EA0A:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	b _0802EA26
_0802EA10:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802EA28
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	movs r0, #1
_0802EA26:
	strh r0, [r4, #0x2e]
_0802EA28:
	movs r0, #1
_0802EA2A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802E8FC

	thumb_func_start sub_0802EA30
sub_0802EA30: @ 0x0802EA30
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0802EA88
	mov r8, r0
	lsls r4, r1, #4
	adds r4, r4, r1
	lsls r4, r4, #2
	adds r5, r4, r0
	ldr r0, _0802EA8C
	strh r0, [r5, #0x26]
	lsls r3, r2, #4
	adds r3, r3, r2
	lsls r3, r3, #2
	mov r1, r8
	adds r2, r3, r1
	strh r0, [r2, #0x26]
	adds r5, #0x3e
	ldrb r6, [r5]
	movs r1, #5
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r6
	strb r0, [r5]
	adds r2, #0x3e
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	movs r0, #0x1c
	add r8, r0
	add r4, r8
	ldr r0, _0802EA90
	str r0, [r4]
	add r3, r8
	str r0, [r3]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA88: .4byte 0x020205AC
_0802EA8C: .4byte 0x0000FFD8
_0802EA90: .4byte 0x0802EAC1
	thumb_func_end sub_0802EA30

	thumb_func_start sub_0802EA94
sub_0802EA94: @ 0x0802EA94
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r2, _0802EAB8
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, #0x1c
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r0, _0802EABC
	cmp r1, r0
	bne _0802EAB2
	movs r3, #1
_0802EAB2:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802EAB8: .4byte 0x020205AC
_0802EABC: .4byte 0x0802EAC1
	thumb_func_end sub_0802EA94

	thumb_func_start sub_0802EAC0
sub_0802EAC0: @ 0x0802EAC0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x2e
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bhi _0802EBAA
	lsls r0, r0, #2
	ldr r1, _0802EADC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802EADC: .4byte 0x0802EAE0
_0802EAE0: @ jump table
	.4byte _0802EAF4 @ case 0
	.4byte _0802EB04 @ case 1
	.4byte _0802EB2C @ case 2
	.4byte _0802EB60 @ case 3
	.4byte _0802EB98 @ case 4
_0802EAF4:
	movs r0, #0x40
	strh r0, [r4, #8]
	ldrh r0, [r5, #0x26]
	lsls r0, r0, #4
	strh r0, [r4, #0xa]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_0802EB04:
	ldrh r1, [r4, #8]
	ldrh r2, [r4, #0xa]
	adds r0, r1, r2
	strh r0, [r4, #0xa]
	adds r1, #1
	strh r1, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r5, #0x26]
	cmp r0, #0
	blt _0802EBAA
	movs r0, #0x39
	bl PlaySE
	movs r0, #0
	strh r0, [r5, #0x26]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _0802EBAA
_0802EB2C:
	ldrh r0, [r4, #2]
	adds r0, #0xc
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _0802EB4A
	movs r0, #0x39
	bl PlaySE
	movs r0, #0
	strh r0, [r4, #2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_0802EB4A:
	ldr r0, _0802EB5C
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r0, r0, #4
	b _0802EB8E
	.align 2, 0
_0802EB5C: .4byte 0x082FA8CC
_0802EB60:
	ldrh r0, [r4, #2]
	adds r0, #0x10
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _0802EB7E
	movs r0, #0x39
	bl PlaySE
	movs r0, #0
	strh r0, [r4, #2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_0802EB7E:
	ldr r1, _0802EB94
	movs r2, #2
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
_0802EB8E:
	rsbs r0, r0, #0
	strh r0, [r5, #0x26]
	b _0802EBAA
	.align 2, 0
_0802EB94: .4byte 0x082FA8CC
_0802EB98:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0802EBAA
	ldr r0, _0802EBB0
	str r0, [r5, #0x1c]
_0802EBAA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EBB0: .4byte 0x08007141
	thumb_func_end sub_0802EAC0

	thumb_func_start sub_0802EBB4
sub_0802EBB4: @ 0x0802EBB4
	push {r4, lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0802EBFC
	ldr r3, [r2, #4]
	ldr r2, [r2]
	str r2, [sp]
	str r3, [sp, #4]
	ldr r2, _0802EC00
	ldr r3, [r2, #4]
	ldr r2, [r2]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	lsls r0, r0, #0x10
	ldr r3, _0802EC04
	ldr r2, [sp, #4]
	ands r2, r3
	orrs r2, r0
	str r2, [sp, #4]
	ldr r2, _0802EC08
	add r4, sp, #8
	ldr r0, [r4, #4]
	ands r0, r2
	orrs r0, r1
	str r0, [r4, #4]
	mov r0, sp
	bl LoadCompressedSpriteSheet
	adds r0, r4, #0
	bl LoadSpritePalette
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EBFC: .4byte 0x082D2458
_0802EC00: .4byte 0x082D2460
_0802EC04: .4byte 0x0000FFFF
_0802EC08: .4byte 0xFFFF0000
	thumb_func_end sub_0802EBB4

	thumb_func_start sub_0802EC0C
sub_0802EC0C: @ 0x0802EC0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	mov ip, r3
	ldr r3, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	mov r5, sp
	ldr r4, _0802EC5C
	ldm r4!, {r3, r6, r7}
	stm r5!, {r3, r6, r7}
	ldm r4!, {r3, r6, r7}
	stm r5!, {r3, r6, r7}
	mov r4, sp
	strh r0, [r4]
	mov r0, sp
	strh r1, [r0, #2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, ip
	lsls r6, r0, #0x10
	asrs r6, r6, #0x10
	mov r0, sp
	adds r1, r2, #0
	adds r2, r6, #0
	mov r3, r8
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802EC5C: .4byte 0x082D251C
	thumb_func_end sub_0802EC0C

	thumb_func_start sub_0802EC60
sub_0802EC60: @ 0x0802EC60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov ip, r3
	ldr r6, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	mov sb, r3
	ldr r4, [sp, #0x40]
	mov r8, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov sl, r6
	mov r4, sp
	ldr r3, _0802ED24
	ldm r3!, {r5, r6, r7}
	stm r4!, {r5, r6, r7}
	ldm r3!, {r5, r6, r7}
	stm r4!, {r5, r6, r7}
	mov r3, sp
	strh r0, [r3]
	mov r0, sp
	strh r1, [r0, #2]
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	ldr r0, _0802ED28
	adds r2, r2, r0
	asrs r2, r2, #0x10
	mov r1, ip
	lsls r5, r1, #0x10
	asrs r5, r5, #0x10
	mov r0, sp
	adds r1, r2, #0
	adds r2, r5, #0
	mov r3, sl
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r3, sb
	strh r0, [r3]
	adds r4, #0x20
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sl
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, r8
	strh r0, [r4]
	ldr r2, _0802ED2C
	mov r5, sb
	movs r6, #0
	ldrsh r1, [r5, r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r3, #4
	orrs r1, r3
	strb r1, [r0]
	movs r7, #0
	ldrsh r1, [r4, r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	bl StartSpriteAnim
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802ED24: .4byte 0x082D2534
_0802ED28: .4byte 0xFFE00000
_0802ED2C: .4byte 0x020205AC
	thumb_func_end sub_0802EC60

