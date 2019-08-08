.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08024704
sub_08024704: @ 0x08024704
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _080247AC
	movs r0, #0
	str r0, [r1]
	ldr r0, _080247B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080247D8
	ldr r4, _080247B4
	ldr r0, _080247B8
	bl AllocZeroed
	str r0, [r4]
	cmp r0, #0
	beq _080247D8
	bl sub_080247E4
	ldr r0, [r4]
	bl sub_080247F8
	ldr r0, [r4]
	str r5, [r0]
	bl GetMultiplayerId
	ldr r1, [r4]
	adds r1, #0x28
	strb r0, [r1]
	ldr r1, [r4]
	ldr r2, _080247BC
	adds r0, r1, r2
	adds r2, r1, #0
	adds r2, #0x28
	ldrb r3, [r2]
	lsls r2, r3, #4
	subs r2, r2, r3
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r2, _080247C0
	adds r1, r1, r2
	movs r2, #0x3c
	bl memcpy
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r1, [r1]
	lsls r1, r1, #2
	ldr r2, _080247C4
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #0x64
	muls r1, r6, r1
	ldr r2, _080247C8
	adds r1, r1, r2
	bl sub_08025FC0
	ldr r0, _080247CC
	movs r1, #1
	bl CreateTask
	ldr r0, _080247D0
	bl SetMainCallback2
	bl sub_080271B0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x44
	adds r2, #0x48
	bl sub_0802691C
	bl StopMapMusic
	ldr r0, _080247D4
	bl PlayNewMapMusic
	b _080247DE
	.align 2, 0
_080247AC: .4byte 0x03000DB0
_080247B0: .4byte 0x030031C4
_080247B4: .4byte 0x0202294C
_080247B8: .4byte 0x00003330
_080247BC: .4byte 0x000032CC
_080247C0: .4byte 0x000031A0
_080247C4: .4byte 0x0000318C
_080247C8: .4byte 0x02024190
_080247CC: .4byte 0x08024991
_080247D0: .4byte 0x08025F95
_080247D4: .4byte 0x0000021E
_080247D8:
	adds r0, r5, #0
	bl SetMainCallback2
_080247DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08024704

	thumb_func_start sub_080247E4
sub_080247E4: @ 0x080247E4
	push {lr}
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080247E4

	thumb_func_start sub_080247F8
sub_080247F8: @ 0x080247F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r2, r0, #0
	movs r0, #0
	strb r0, [r2, #0xc]
	strb r0, [r2, #0x10]
	strb r0, [r2, #0x14]
	strb r0, [r2, #0x18]
	strb r0, [r2, #0x1c]
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r1, r2, r3
	str r0, [r1]
	movs r7, #0x90
	lsls r7, r7, #1
	adds r1, r2, r7
	str r0, [r1]
	adds r1, r2, #0
	adds r1, #0x30
	strb r0, [r1]
	adds r1, #0x10
	strb r0, [r1]
	subs r1, #4
	strb r0, [r1]
	adds r3, #0x10
	adds r1, r2, r3
	str r0, [r1]
	movs r5, #0
	adds r1, r2, #0
	adds r1, #0x98
	movs r3, #0
_0802483E:
	adds r0, r1, r5
	strb r3, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0802483E
	movs r5, #0
	adds r7, r2, #0
	adds r7, #0xa8
	str r7, [sp]
	adds r0, r2, #0
	adds r0, #0xb0
	str r0, [sp, #0xc]
	movs r1, #0x4a
	adds r1, r1, r2
	mov sl, r1
	movs r3, #0x4c
	adds r3, r3, r2
	mov sb, r3
	movs r7, #0x4e
	adds r7, r7, r2
	mov ip, r7
	subs r0, #0x60
	str r0, [sp, #0x24]
	adds r6, r2, #0
	adds r6, #0x54
	adds r1, r2, #0
	adds r1, #0xd0
	str r1, [sp, #0x1c]
	adds r3, r2, #0
	adds r3, #0xdc
	str r3, [sp, #0x20]
	adds r7, r2, #0
	adds r7, #0xc4
	str r7, [sp, #0x14]
	adds r0, #0xa4
	str r0, [sp, #4]
	adds r1, #0x25
	str r1, [sp, #8]
	subs r3, #0xbc
	str r3, [sp, #0x10]
	movs r7, #0x24
	adds r7, r7, r2
	mov r8, r7
	subs r0, #0xc0
	str r0, [sp, #0x18]
	movs r3, #0
	movs r1, #0x86
	lsls r1, r1, #1
	adds r4, r2, r1
	movs r7, #0x98
	lsls r7, r7, #1
	adds r2, r2, r7
_080248AA:
	ldr r1, [sp]
	adds r0, r1, r5
	strb r3, [r0]
	ldr r7, [sp, #0xc]
	adds r0, r7, r5
	strb r3, [r0]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	mov r7, sl
	adds r1, r7, r0
	strh r3, [r1]
	mov r7, sb
	adds r1, r7, r0
	strh r3, [r1]
	mov r7, ip
	adds r1, r7, r0
	strh r3, [r1]
	ldr r7, [sp, #0x24]
	adds r1, r7, r0
	strh r3, [r1]
	adds r0, r6, r0
	strh r3, [r0]
	adds r0, r4, r5
	strb r3, [r0]
	lsls r0, r5, #2
	adds r0, r2, r0
	str r3, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080248AA
	movs r5, #0
	movs r3, #0
	movs r4, #0xff
	ldr r6, [sp, #0x1c]
_080248F4:
	adds r0, r6, r5
	strb r3, [r0]
	ldr r1, [sp, #0x20]
	adds r0, r1, r5
	strb r3, [r0]
	ldr r7, [sp, #0x14]
	adds r0, r7, r5
	strb r3, [r0]
	lsls r1, r5, #1
	ldr r0, [sp, #4]
	adds r2, r0, r1
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	ldr r7, [sp, #8]
	adds r1, r7, r1
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xa
	bls _080248F4
	bl GetMultiplayerId
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024932
	movs r1, #1
_08024932:
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	bl GetLinkPlayerCount
	mov r1, r8
	strb r0, [r1]
	bl GetMultiplayerId
	ldr r3, [sp, #0x18]
	strb r0, [r3]
	movs r5, #1
	mov r7, r8
	ldrb r7, [r7]
	cmp r5, r7
	bhs _0802497E
	ldr r7, [sp, #0x18]
	mov r6, r8
_08024954:
	adds r4, r7, r5
	subs r0, r5, #1
	adds r0, r7, r0
	ldrb r0, [r0]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r4]
	ldrb r1, [r6]
	subs r0, r1, #1
	cmp r2, r0
	ble _08024972
	adds r0, r2, #0
	bl __umodsi3
	strb r0, [r4]
_08024972:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r6]
	cmp r5, r0
	blo _08024954
_0802497E:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080247F8

	thumb_func_start sub_08024990
sub_08024990: @ 0x08024990
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080249B0
	ldr r0, [r0]
	ldrb r0, [r0, #0xc]
	cmp r0, #7
	bls _080249A4
	b _08024AFC
_080249A4:
	lsls r0, r0, #2
	ldr r1, _080249B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080249B0: .4byte 0x0202294C
_080249B4: .4byte 0x080249B8
_080249B8: @ jump table
	.4byte _080249D8 @ case 0
	.4byte _080249EC @ case 1
	.4byte _08024A14 @ case 2
	.4byte _08024A22 @ case 3
	.4byte _08024A48 @ case 4
	.4byte _08024A9C @ case 5
	.4byte _08024AAE @ case 6
	.4byte _08024AD8 @ case 7
_080249D8:
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, _080249E8
	movs r1, #4
	bl sub_08025FD4
	b _08024AE8
	.align 2, 0
_080249E8: .4byte 0x080256D9
_080249EC:
	ldr r0, _08024A0C
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080249FA
	b _08024B08
_080249FA:
	ldr r4, _08024A10
	ldr r0, [r4]
	movs r1, #0xb0
	lsls r1, r1, #1
	adds r0, r0, r1
	bl sub_08028FA0
	ldr r1, [r4]
	b _08024AEC
	.align 2, 0
_08024A0C: .4byte 0x080256D9
_08024A10: .4byte 0x0202294C
_08024A14:
	bl sub_0802A464
	cmp r0, #0
	bne _08024B08
	bl sub_0800FF34
	b _08024AE8
_08024A22:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024B08
	ldr r0, _08024A44
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024AE8
	bl LoadWirelessStatusIndicatorSpriteGfx
	movs r0, #0
	movs r1, #0
	bl CreateWirelessStatusIndicatorSprite
	b _08024AE8
	.align 2, 0
_08024A44: .4byte 0x030031C4
_08024A48:
	ldr r0, _08024A94
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r5, [r0]
	bl sub_080280D4
	movs r4, #0
	cmp r4, r5
	bhs _08024A82
_08024A5A:
	ldr r0, _08024A94
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x34
	adds r0, r0, r4
	ldrb r2, [r0]
	lsls r0, r2, #2
	ldr r3, _08024A98
	adds r0, r0, r3
	adds r0, r1, r0
	adds r1, #0x24
	ldrb r3, [r1]
	adds r1, r4, #0
	bl sub_08028134
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08024A5A
_08024A82:
	ldr r4, _08024A94
	ldr r0, [r4]
	adds r0, #0x24
	ldrb r1, [r0]
	movs r0, #0
	bl sub_080283B8
	ldr r1, [r4]
	b _08024AEC
	.align 2, 0
_08024A94: .4byte 0x0202294C
_08024A98: .4byte 0x0000318C
_08024A9C:
	bl sub_08028760
	bl sub_080287B4
	bl sub_08028A70
	bl sub_08028460
	b _08024AE8
_08024AAE:
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
	ldr r0, _08024AD4
	bl SetVBlankCallback
	b _08024AE8
	.align 2, 0
_08024AD4: .4byte 0x08025FAD
_08024AD8:
	bl UpdatePaletteFade
	ldr r0, _08024AF4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08024B08
_08024AE8:
	ldr r0, _08024AF8
	ldr r1, [r0]
_08024AEC:
	ldrb r0, [r1, #0xc]
	adds r0, #1
	strb r0, [r1, #0xc]
	b _08024B08
	.align 2, 0
_08024AF4: .4byte 0x02037C74
_08024AF8: .4byte 0x0202294C
_08024AFC:
	adds r0, r1, #0
	bl DestroyTask
	ldr r0, _08024B10
	bl sub_08025FE4
_08024B08:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B10: .4byte 0x08025665
	thumb_func_end sub_08024990

	thumb_func_start sub_08024B14
sub_08024B14: @ 0x08024B14
	push {lr}
	bl sub_08025ACC
	ldr r1, _08024B40
	ldr r0, _08024B44
	ldr r0, [r0]
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end sub_08024B14

	thumb_func_start sub_08024B2C
sub_08024B2C: @ 0x08024B2C
	ldr r0, _08024B48
	ldr r0, [r0]
	cmp r0, #0
	bne _08024B38
	bl sub_080268B4
_08024B38:
	bl sub_08025B18
	pop {r0}
	bx r0
	.align 2, 0
_08024B40: .4byte 0x082CB350
_08024B44: .4byte 0x0202294C
_08024B48: .4byte 0x03000DB0
	thumb_func_end sub_08024B2C

	thumb_func_start sub_08024B4C
sub_08024B4C: @ 0x08024B4C
	push {lr}
	bl sub_08025BD4
	ldr r1, _08024B78
	ldr r0, _08024B7C
	ldr r0, [r0]
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end sub_08024B4C

	thumb_func_start sub_08024B64
sub_08024B64: @ 0x08024B64
	ldr r0, _08024B80
	ldr r0, [r0]
	cmp r0, #0
	bne _08024B70
	bl sub_080268E8
_08024B70:
	bl sub_08025CA0
	pop {r0}
	bx r0
	.align 2, 0
_08024B78: .4byte 0x082CB380
_08024B7C: .4byte 0x0202294C
_08024B80: .4byte 0x03000DB0
	thumb_func_end sub_08024B64

	thumb_func_start sub_08024B84
sub_08024B84: @ 0x08024B84
	push {r4, lr}
	ldr r4, _08024B98
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _08024B9C
	cmp r0, #1
	beq _08024BB2
	b _08024BC0
	.align 2, 0
_08024B98: .4byte 0x0202294C
_08024B9C:
	movs r0, #1
	bl sub_08028230
	movs r0, #1
	bl sub_0802900C
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _08024BC0
_08024BB2:
	bl sub_0802A464
	cmp r0, #0
	bne _08024BC0
	movs r0, #1
	bl sub_08026008
_08024BC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08024B84

	thumb_func_start sub_08024BC8
sub_08024BC8: @ 0x08024BC8
	push {r4, lr}
	ldr r4, _08024BE4
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _08024BE8
	bl sub_08026088
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _08024BF8
	.align 2, 0
_08024BE4: .4byte 0x0202294C
_08024BE8:
	movs r0, #0x8c
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #1
	str r0, [r1]
	movs r0, #2
	bl sub_08026008
_08024BF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08024BC8

	thumb_func_start sub_08024C00
sub_08024C00: @ 0x08024C00
	push {r4, lr}
	sub sp, #4
	ldr r1, _08024C1C
	ldr r0, [r1]
	ldrb r0, [r0, #0x10]
	adds r4, r1, #0
	cmp r0, #5
	bhi _08024CD0
	lsls r0, r0, #2
	ldr r1, _08024C20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024C1C: .4byte 0x0202294C
_08024C20: .4byte 0x08024C24
_08024C24: @ jump table
	.4byte _08024C3C @ case 0
	.4byte _08024C58 @ case 1
	.4byte _08024C68 @ case 2
	.4byte _08024C8C @ case 3
	.4byte _08024CA0 @ case 4
	.4byte _08024CC0 @ case 5
_08024C3C:
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #8
	movs r2, #0x78
	movs r3, #0x50
	bl sub_0802E788
	ldr r0, _08024C54
	ldr r1, [r0]
	b _08024CB8
	.align 2, 0
_08024C54: .4byte 0x0202294C
_08024C58:
	bl sub_0800FF34
	ldr r0, _08024C64
	ldr r1, [r0]
	b _08024CB8
	.align 2, 0
_08024C64: .4byte 0x0202294C
_08024C68:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024CD0
	ldr r2, _08024C88
	ldr r1, [r2]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	movs r3, #0
	strb r0, [r1, #0x10]
	ldr r0, [r2]
	adds r0, #0x30
	strb r3, [r0]
	b _08024CD0
	.align 2, 0
_08024C88: .4byte 0x0202294C
_08024C8C:
	bl sub_0802E7E8
	cmp r0, #0
	bne _08024CD0
	ldr r0, _08024C9C
	ldr r1, [r0]
	b _08024CB8
	.align 2, 0
_08024C9C: .4byte 0x0202294C
_08024CA0:
	ldr r1, [r4]
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _08024CD0
	bl sub_0800FF34
	ldr r1, [r4]
_08024CB8:
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _08024CD0
_08024CC0:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024CD0
	movs r0, #3
	bl sub_08026008
_08024CD0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08024C00

	thumb_func_start sub_08024CD8
sub_08024CD8: @ 0x08024CD8
	push {lr}
	ldr r0, _08024CFC
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _08024CF6
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08024CF6
	movs r0, #4
	bl sub_08026008
_08024CF6:
	pop {r0}
	bx r0
	.align 2, 0
_08024CFC: .4byte 0x0202294C
	thumb_func_end sub_08024CD8

	thumb_func_start sub_08024D00
sub_08024D00: @ 0x08024D00
	push {r4, lr}
	ldr r4, _08024D40
	ldr r2, [r4]
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	bne _08024DBE
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08024DB0
	adds r0, r2, #0
	adds r0, #0xa8
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024DB6
	ldr r0, _08024D44
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08024D50
	ldr r1, _08024D48
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _08024DB6
	ldr r3, _08024D4C
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, #2
	b _08024D8A
	.align 2, 0
_08024D40: .4byte 0x0202294C
_08024D44: .4byte 0x03002360
_08024D48: .4byte 0x000031CC
_08024D4C: .4byte 0x000031D0
_08024D50:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08024D70
	ldr r3, _08024D6C
	adds r0, r2, r3
	ldrb r1, [r0]
	cmp r1, #0
	bne _08024DB6
	adds r3, #4
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, #1
	b _08024D8A
	.align 2, 0
_08024D6C: .4byte 0x000031CC
_08024D70:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024D9C
	ldr r3, _08024D98
	adds r0, r2, r3
	ldrb r1, [r0]
	cmp r1, #0
	bne _08024DB6
	adds r3, #4
	adds r0, r2, r3
	strb r1, [r0]
	movs r0, #3
_08024D8A:
	bl sub_080272D8
	ldr r1, [r4]
	ldr r2, _08024D98
	adds r1, r1, r2
	strb r0, [r1]
	b _08024DB6
	.align 2, 0
_08024D98: .4byte 0x000031CC
_08024D9C:
	movs r0, #0
	bl sub_080272D8
	ldr r1, [r4]
	ldr r3, _08024DAC
	adds r1, r1, r3
	strb r0, [r1]
	b _08024DB6
	.align 2, 0
_08024DAC: .4byte 0x000031CC
_08024DB0:
	movs r0, #0xb
	bl sub_08026008
_08024DB6:
	bl sub_080264E4
	bl sub_08025D10
_08024DBE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08024D00

	thumb_func_start sub_08024DC4
sub_08024DC4: @ 0x08024DC4
	push {lr}
	ldr r0, _08024E04
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08024E8C
	ldr r0, _08024E08
	ldrh r1, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08024E14
	adds r0, r2, #0
	adds r0, #0x28
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	ldr r1, _08024E0C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024E92
	ldr r3, _08024E10
	adds r1, r2, r3
	movs r0, #2
	strb r0, [r1]
	b _08024E92
	.align 2, 0
_08024E04: .4byte 0x0202294C
_08024E08: .4byte 0x03002360
_08024E0C: .4byte 0x000031CC
_08024E10: .4byte 0x000032F8
_08024E14:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08024E48
	adds r0, r2, #0
	adds r0, #0x28
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	ldr r1, _08024E40
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024E92
	ldr r3, _08024E44
	adds r1, r2, r3
	movs r0, #1
	strb r0, [r1]
	b _08024E92
	.align 2, 0
_08024E40: .4byte 0x000031CC
_08024E44: .4byte 0x000032F8
_08024E48:
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08024E80
	adds r0, r2, #0
	adds r0, #0x28
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	ldr r1, _08024E78
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024E92
	ldr r3, _08024E7C
	adds r1, r2, r3
	movs r0, #3
	strb r0, [r1]
	b _08024E92
	.align 2, 0
_08024E78: .4byte 0x000031CC
_08024E7C: .4byte 0x000032F8
_08024E80:
	ldr r3, _08024E88
	adds r0, r2, r3
	strb r1, [r0]
	b _08024E92
	.align 2, 0
_08024E88: .4byte 0x000032F8
_08024E8C:
	movs r0, #0xb
	bl sub_08026008
_08024E92:
	bl sub_08025E0C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08024DC4

	thumb_func_start sub_08024E9C
sub_08024E9C: @ 0x08024E9C
	push {r4, r5, lr}
	bl sub_080264E4
	bl sub_08025D10
	bl sub_08026A10
	cmp r0, #1
	bne _08024EBA
	bl sub_08027064
	movs r0, #5
	bl sub_08026008
	b _08024F18
_08024EBA:
	ldr r0, _08024EE8
	ldr r2, [r0]
	movs r1, #0x96
	lsls r1, r1, #1
	adds r4, r2, r1
	movs r1, #1
	str r1, [r4]
	movs r3, #1
	adds r1, r2, #0
	adds r1, #0x24
	adds r5, r0, #0
	ldrb r1, [r1]
	cmp r3, r1
	bhs _08024F18
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r0, [r0]
	cmp r0, #1
	beq _08024EEC
	movs r0, #0
	str r0, [r4]
	b _08024F18
	.align 2, 0
_08024EE8: .4byte 0x0202294C
_08024EEC:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r3, r0
	bhs _08024F18
	lsls r0, r3, #2
	movs r4, #0x98
	lsls r4, r4, #1
	adds r1, r2, r4
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #1
	beq _08024EEC
	movs r0, #0x96
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0
	str r0, [r1]
_08024F18:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08024E9C

	thumb_func_start sub_08024F20
sub_08024F20: @ 0x08024F20
	push {lr}
	bl sub_08025E0C
	bl sub_08026A50
	cmp r0, #1
	bne _08024F34
	movs r0, #5
	bl sub_08026008
_08024F34:
	pop {r0}
	bx r0
	thumb_func_end sub_08024F20

	thumb_func_start sub_08024F38
sub_08024F38: @ 0x08024F38
	push {r4, lr}
	bl GetBlockReceivedStatus
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_0800A59C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	beq _08024F54
	movs r0, #0
	b _08024F5A
_08024F54:
	bl ResetBlockReceivedFlags
	movs r0, #1
_08024F5A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08024F38

	thumb_func_start sub_08024F60
sub_08024F60: @ 0x08024F60
	push {r4, r5, lr}
	ldr r5, _08024F78
	ldr r1, [r5]
	ldrb r4, [r1, #0x10]
	cmp r4, #1
	beq _08024F98
	cmp r4, #1
	bgt _08024F7C
	cmp r4, #0
	beq _08024F82
	b _08024FD4
	.align 2, 0
_08024F78: .4byte 0x0202294C
_08024F7C:
	cmp r4, #2
	beq _08024FA4
	b _08024FD4
_08024F82:
	adds r1, #0x4a
	movs r0, #0
	movs r2, #0x3c
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024FEE
	ldr r0, [r5]
	strb r4, [r0, #8]
	b _08024FCA
_08024F98:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024FEE
	b _08024FCA
_08024FA4:
	bl sub_08024F38
	cmp r0, #0
	beq _08024FB6
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	strb r1, [r0, #8]
_08024FB6:
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r2, #8]
	ldrb r1, [r1]
	cmp r0, r1
	blo _08024FEE
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
_08024FCA:
	ldr r1, [r5]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _08024FEE
_08024FD4:
	movs r0, #1
	bl WaitFanfare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024FEE
	movs r0, #6
	bl sub_08026008
	ldr r0, _08024FF4
	movs r1, #4
	bl FadeOutAndPlayNewMapMusic
_08024FEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024FF4: .4byte 0x0000020B
	thumb_func_end sub_08024F60

	thumb_func_start sub_08024FF8
sub_08024FF8: @ 0x08024FF8
	push {r4, r5, lr}
	ldr r5, _08025010
	ldr r2, [r5]
	ldrb r4, [r2, #0x10]
	cmp r4, #1
	beq _0802503C
	cmp r4, #1
	bgt _08025014
	cmp r4, #0
	beq _0802501A
	b _080250A4
	.align 2, 0
_08025010: .4byte 0x0202294C
_08025014:
	cmp r4, #2
	beq _0802504A
	b _080250A4
_0802501A:
	ldrb r0, [r2, #0x14]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x4a
	adds r1, r2, r1
	movs r0, #0
	movs r2, #0x3c
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080250DE
	ldr r0, [r5]
	strb r4, [r0, #8]
	ldr r1, [r5]
	b _08025094
_0802503C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080250DE
	ldr r1, [r5]
	b _08025094
_0802504A:
	bl sub_08024F38
	cmp r0, #0
	beq _0802507C
	movs r4, #0
	b _08025072
_08025056:
	ldr r0, [r5]
	adds r0, #0x4a
	ldr r1, _0802509C
	movs r2, #0x3c
	bl memcpy
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08025072:
	ldr r0, [r5]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r4, r0
	blo _08025056
_0802507C:
	ldr r3, _080250A0
	ldr r2, [r3]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r2, #8]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080250DE
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
	ldr r1, [r3]
_08025094:
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _080250DE
	.align 2, 0
_0802509C: .4byte 0x0202207C
_080250A0: .4byte 0x0202294C
_080250A4:
	movs r0, #1
	bl WaitFanfare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080250DE
	ldr r0, _080250E4
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x54
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0x8a
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, #6
	bl sub_08026008
	ldr r0, _080250E8
	movs r1, #4
	bl FadeOutAndPlayNewMapMusic
_080250DE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080250E4: .4byte 0x0202294C
_080250E8: .4byte 0x0000020B
	thumb_func_end sub_08024FF8

	thumb_func_start sub_080250EC
sub_080250EC: @ 0x080250EC
	push {r4, r5, lr}
	sub sp, #4
	movs r1, #1
	mov r0, sp
	strb r1, [r0]
	ldr r0, _0802510C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #4
	bls _08025102
	b _08025220
_08025102:
	lsls r0, r0, #2
	ldr r1, _08025110
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802510C: .4byte 0x0202294C
_08025110: .4byte 0x08025114
_08025114: @ jump table
	.4byte _08025128 @ case 0
	.4byte _0802514C @ case 1
	.4byte _08025164 @ case 2
	.4byte _08025184 @ case 3
	.4byte _080251A4 @ case 4
_08025128:
	bl sub_0802725C
	movs r0, #1
	bl sub_08028714
	bl sub_08028B28
	movs r0, #1
	bl sub_08028BF4
	movs r0, #2
	bl sub_0802900C
	ldr r0, _08025148
	ldr r1, [r0]
	b _08025210
	.align 2, 0
_08025148: .4byte 0x0202294C
_0802514C:
	bl sub_0802A464
	cmp r0, #0
	bne _0802522E
	movs r0, #5
	bl sub_0802900C
	ldr r0, _08025160
	ldr r1, [r0]
	b _08025210
	.align 2, 0
_08025160: .4byte 0x0202294C
_08025164:
	bl sub_0802A488
	mov r1, sp
	strb r0, [r1]
	movs r0, #0
	movs r2, #1
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802522E
	ldr r0, _08025180
	ldr r1, [r0]
	b _08025210
	.align 2, 0
_08025180: .4byte 0x0202294C
_08025184:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802522E
	ldr r3, _080251A0
	ldr r1, [r3]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	movs r2, #0
	strb r0, [r1, #0x10]
	ldr r0, [r3]
	strb r2, [r0, #8]
	b _0802522E
	.align 2, 0
_080251A0: .4byte 0x0202294C
_080251A4:
	bl sub_08024F38
	cmp r0, #0
	beq _080251EA
	movs r2, #0
	ldr r1, _08025218
	ldr r0, [r1]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r2, r0
	bhs _080251EA
	adds r3, r1, #0
	movs r5, #0x86
	lsls r5, r5, #1
	ldr r4, _0802521C
_080251C2:
	ldr r1, [r3]
	adds r1, r2, r1
	adds r1, r1, r5
	lsls r0, r2, #8
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1, #8]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r3]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r2, r0
	blo _080251C2
_080251EA:
	ldr r4, _08025218
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r2, #8]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0802522E
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x77
	bls _0802522E
	movs r0, #6
	bl sub_0802900C
	ldr r1, [r4]
_08025210:
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _0802522E
	.align 2, 0
_08025218: .4byte 0x0202294C
_0802521C: .4byte 0x0202207C
_08025220:
	bl sub_0802A464
	cmp r0, #0
	bne _0802522E
	movs r0, #7
	bl sub_08026008
_0802522E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080250EC

	thumb_func_start sub_08025238
sub_08025238: @ 0x08025238
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08025254
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	cmp r0, #7
	bls _08025248
	b _080253CE
_08025248:
	lsls r0, r0, #2
	ldr r1, _08025258
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025254: .4byte 0x0202294C
_08025258: .4byte 0x0802525C
_0802525C: @ jump table
	.4byte _0802527C @ case 0
	.4byte _0802529C @ case 1
	.4byte _080252B8 @ case 2
	.4byte _080252CC @ case 3
	.4byte _080252E8 @ case 4
	.4byte _08025304 @ case 5
	.4byte _0802532C @ case 6
	.4byte _08025340 @ case 7
_0802527C:
	bl sub_08027508
	ldr r1, _08025294
	cmp r0, r1
	bls _0802528C
	movs r0, #4
	bl sub_0802900C
_0802528C:
	ldr r0, _08025298
	ldr r1, [r0]
	b _080253B0
	.align 2, 0
_08025294: .4byte 0x00000BB7
_08025298: .4byte 0x0202294C
_0802529C:
	bl sub_0802A464
	cmp r0, #0
	beq _080252A6
	b _08025404
_080252A6:
	movs r0, #3
	bl sub_0802900C
	ldr r0, _080252B4
	ldr r1, [r0]
	b _080253B0
	.align 2, 0
_080252B4: .4byte 0x0202294C
_080252B8:
	bl sub_08028CF8
	bl sub_080270A8
	ldr r0, _080252C8
	ldr r1, [r0]
	b _080253B0
	.align 2, 0
_080252C8: .4byte 0x0202294C
_080252CC:
	bl sub_0802A488
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	strb r0, [r1]
	cmp r0, #0
	bne _080252DE
	b _08025404
_080252DE:
	ldr r0, _080252E4
	ldr r1, [r0]
	b _080253B0
	.align 2, 0
_080252E4: .4byte 0x0202294C
_080252E8:
	bl sub_0802A464
	cmp r0, #0
	beq _080252F2
	b _08025404
_080252F2:
	movs r0, #5
	bl sub_0802900C
	ldr r0, _08025300
	ldr r1, [r0]
	b _080253B0
	.align 2, 0
_08025300: .4byte 0x0202294C
_08025304:
	bl sub_0802A488
	mov r1, sp
	strb r0, [r1]
	movs r0, #0
	movs r2, #1
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025404
	ldr r2, _08025328
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #8]
	ldr r1, [r2]
	b _080253B0
	.align 2, 0
_08025328: .4byte 0x0202294C
_0802532C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025404
	ldr r0, _0802533C
	ldr r1, [r0]
	b _080253B0
	.align 2, 0
_0802533C: .4byte 0x0202294C
_08025340:
	bl sub_08024F38
	cmp r0, #0
	beq _08025386
	movs r2, #0
	ldr r1, _080253B8
	ldr r0, [r1]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08025386
	adds r3, r1, #0
	movs r5, #0x86
	lsls r5, r5, #1
	ldr r4, _080253BC
_0802535E:
	ldr r1, [r3]
	adds r1, r2, r1
	adds r1, r1, r5
	lsls r0, r2, #8
	adds r0, r0, r4
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1, #8]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r3]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r2, r0
	blo _0802535E
_08025386:
	ldr r4, _080253B8
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r2, #8]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080253C0
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x77
	bls _08025404
	bl sub_080273C8
	movs r0, #6
	bl sub_0802900C
	ldr r1, [r4]
_080253B0:
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _08025404
	.align 2, 0
_080253B8: .4byte 0x0202294C
_080253BC: .4byte 0x0202207C
_080253C0:
	bl sub_08027314
	b _08025404
_080253C6:
	movs r0, #8
	bl sub_08026008
	b _08025404
_080253CE:
	bl sub_0802A464
	cmp r0, #0
	bne _08025404
	movs r2, #0
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r2, r0
	bhs _080253FE
	movs r4, #0x86
	lsls r4, r4, #1
	adds r3, r1, r4
	adds r1, r0, #0
_080253EC:
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #2
	beq _080253C6
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blo _080253EC
_080253FE:
	movs r0, #0xa
	bl sub_08026008
_08025404:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08025238

	thumb_func_start sub_0802540C
sub_0802540C: @ 0x0802540C
	push {r4, lr}
	ldr r4, _08025424
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	beq _0802543A
	cmp r0, #1
	bgt _08025428
	cmp r0, #0
	beq _0802542E
	b _0802545A
	.align 2, 0
_08025424: .4byte 0x0202294C
_08025428:
	cmp r0, #2
	beq _08025444
	b _0802545A
_0802542E:
	bl sub_0800A7F8
	movs r0, #7
	bl sub_0802900C
	b _08025450
_0802543A:
	bl sub_0802A464
	cmp r0, #0
	bne _08025468
	b _08025450
_08025444:
	bl sub_0802A488
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bne _08025468
_08025450:
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _08025468
_0802545A:
	ldr r0, _08025470
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025468
	movs r0, #9
	bl sub_08026008
_08025468:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025470: .4byte 0x030031C4
	thumb_func_end sub_0802540C

	thumb_func_start sub_08025474
sub_08025474: @ 0x08025474
	push {r4, lr}
	sub sp, #4
	ldr r4, _0802548C
	ldr r0, [r4]
	ldrb r1, [r0, #0x10]
	cmp r1, #1
	beq _080254A8
	cmp r1, #1
	bgt _08025490
	cmp r1, #0
	beq _08025496
	b _080254F0
	.align 2, 0
_0802548C: .4byte 0x0202294C
_08025490:
	cmp r1, #2
	beq _080254C0
	b _080254F0
_08025496:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _080254E2
_080254A8:
	bl UpdatePaletteFade
	ldr r0, _080254BC
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025514
	b _080254E2
	.align 2, 0
_080254BC: .4byte 0x02037C74
_080254C0:
	bl sub_080288AC
	bl sub_08028510
	ldr r0, [r4]
	adds r0, #0x24
	ldrb r0, [r0]
	bl sub_08028340
	bl sub_08028BB0
	ldr r1, _080254EC
	movs r0, #1
	str r0, [r1]
	movs r0, #8
	bl sub_0802900C
_080254E2:
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _08025514
	.align 2, 0
_080254EC: .4byte 0x03000DB0
_080254F0:
	bl sub_0802A464
	cmp r0, #0
	bne _08025514
	ldr r4, _0802551C
	ldr r0, [r4]
	ldr r0, [r0]
	bl SetMainCallback2
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl DestroyTask
	ldr r0, [r4]
	bl Free
	bl FreeAllWindowBuffers
_08025514:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802551C: .4byte 0x0202294C
	thumb_func_end sub_08025474

	thumb_func_start sub_08025520
sub_08025520: @ 0x08025520
	push {r4, lr}
	sub sp, #4
	ldr r4, _0802553C
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	cmp r0, #6
	bls _08025530
	b _08025624
_08025530:
	lsls r0, r0, #2
	ldr r1, _08025540
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802553C: .4byte 0x0202294C
_08025540: .4byte 0x08025544
_08025544: @ jump table
	.4byte _08025560 @ case 0
	.4byte _08025600 @ case 1
	.4byte _08025578 @ case 2
	.4byte _080255CA @ case 3
	.4byte _080255D0 @ case 4
	.4byte _080255E0 @ case 5
	.4byte _08025600 @ case 6
_08025560:
	movs r0, #9
	bl sub_0802900C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _08025610
_08025578:
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
	b _08025610
_080255CA:
	bl StopMapMusic
	b _08025610
_080255D0:
	ldr r0, _080255DC
	bl PlayNewMapMusic
	bl sub_08028B78
	b _08025610
	.align 2, 0
_080255DC: .4byte 0x0000021E
_080255E0:
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
	b _08025610
_08025600:
	bl UpdatePaletteFade
	ldr r0, _0802561C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025654
_08025610:
	ldr r0, _08025620
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _08025654
	.align 2, 0
_0802561C: .4byte 0x02037C74
_08025620: .4byte 0x0202294C
_08025624:
	ldrb r0, [r1, #4]
	bl DestroyTask
	ldr r0, _0802565C
	bl sub_08025FE4
	bl sub_08028D68
	ldr r0, [r4]
	bl sub_080247F8
	ldr r0, _08025660
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802564A
	ldr r0, [r4]
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0802564A:
	bl sub_080271B0
	movs r0, #0
	bl sub_08028BF4
_08025654:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802565C: .4byte 0x08025665
_08025660: .4byte 0x030031C4
	thumb_func_end sub_08025520

	thumb_func_start sub_08025664
sub_08025664: @ 0x08025664
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08025680
	ldr r0, [r1]
	ldrb r0, [r0, #0x10]
	adds r4, r1, #0
	cmp r0, #1
	beq _08025690
	cmp r0, #1
	bgt _08025684
	cmp r0, #0
	beq _0802568A
	b _080256A8
	.align 2, 0
_08025680: .4byte 0x0202294C
_08025684:
	cmp r0, #2
	beq _08025696
	b _080256A8
_0802568A:
	bl sub_0802602C
	b _0802569A
_08025690:
	bl sub_08028410
	b _0802569E
_08025696:
	bl sub_08028554
_0802569A:
	cmp r0, #1
	bne _080256CC
_0802569E:
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	b _080256CC
_080256A8:
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _080256C0
	ldr r0, _080256BC
	bl sub_08025FE4
	b _080256C6
	.align 2, 0
_080256BC: .4byte 0x08024B15
_080256C0:
	ldr r0, _080256D4
	bl sub_08025FE4
_080256C6:
	adds r0, r5, #0
	bl DestroyTask
_080256CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080256D4: .4byte 0x08024B4D
	thumb_func_end sub_08025664

	thumb_func_start sub_080256D8
sub_080256D8: @ 0x080256D8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _080256FC
	adds r5, r0, r1
	movs r0, #0
	ldrsh r4, [r5, r0]
	cmp r4, #1
	beq _08025734
	cmp r4, #1
	bgt _08025700
	cmp r4, #0
	beq _08025706
	b _080257B0
	.align 2, 0
_080256FC: .4byte 0x03005B68
_08025700:
	cmp r4, #2
	beq _08025746
	b _080257B0
_08025706:
	ldr r6, _0802572C
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r2, _08025730
	adds r0, r0, r2
	adds r1, r1, r0
	movs r0, #0
	movs r2, #1
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080257B0
	ldr r0, [r6]
	strb r4, [r0, #8]
	b _0802573E
	.align 2, 0
_0802572C: .4byte 0x0202294C
_08025730: .4byte 0x0000318C
_08025734:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080257B0
_0802573E:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _080257B0
_08025746:
	bl sub_08024F38
	cmp r0, #0
	beq _0802578C
	movs r2, #0
	ldr r1, _080257B8
	ldr r0, [r1]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r2, r0
	bhs _0802578C
	adds r3, r1, #0
	ldr r5, _080257BC
	ldr r4, _080257C0
_08025762:
	ldr r0, [r3]
	lsls r1, r2, #2
	adds r1, r1, r0
	adds r1, r1, r4
	lsls r0, r2, #8
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1, #8]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r3]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r2, r0
	blo _08025762
_0802578C:
	ldr r4, _080257B8
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r0, [r0, #8]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080257B0
	adds r0, r6, #0
	bl DestroyTask
	movs r0, #6
	bl sub_0802900C
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
_080257B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080257B8: .4byte 0x0202294C
_080257BC: .4byte 0x0202207C
_080257C0: .4byte 0x0000318C
	thumb_func_end sub_080256D8

	thumb_func_start sub_080257C4
sub_080257C4: @ 0x080257C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	ldr r6, _080258A0
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r7, [r1]
	ldr r2, _080258A4
	adds r1, r0, r2
	ldr r3, _080258A8
	adds r2, r0, r3
	ldr r4, _080258AC
	adds r3, r0, r4
	ldr r5, _080258B0
	adds r4, r0, r5
	str r4, [sp]
	adds r5, #0x3c
	adds r4, r0, r5
	str r4, [sp, #4]
	adds r5, #0x3c
	adds r4, r0, r5
	str r4, [sp, #8]
	adds r4, r0, #0
	adds r4, #0x40
	str r4, [sp, #0xc]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r4, r0, r5
	str r4, [sp, #0x10]
	movs r4, #0x96
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [sp, #0x14]
	movs r0, #0
	bl sub_08027E90
	ldr r1, [r6]
	ldr r5, _080258B4
	adds r2, r1, r5
	str r0, [r2]
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	movs r5, #1
	cmp r5, r7
	bhs _0802586C
_08025828:
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0xa8
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025862
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r4, r0, #2
	adds r1, r4, r1
	ldr r2, _080258A8
	adds r1, r1, r2
	adds r0, r5, #0
	bl sub_08028044
	adds r1, r0, #0
	cmp r1, #0
	bne _08025862
	ldr r0, [r6]
	adds r0, r0, r4
	ldr r3, _080258A8
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r6]
	movs r4, #0x94
	lsls r4, r4, #1
	adds r0, r0, r4
	strb r1, [r0]
_08025862:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _08025828
_0802586C:
	ldr r5, _080258A0
	ldr r1, [r5]
	movs r6, #0x92
	lsls r6, r6, #1
	adds r1, r1, r6
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _080258CA
	ldr r1, [r5]
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, #0
	beq _080258B8
	bl sub_080115B4
	ldr r0, [r5]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	b _080258CA
	.align 2, 0
_080258A0: .4byte 0x0202294C
_080258A4: .4byte 0x000031A0
_080258A8: .4byte 0x000031CC
_080258AC: .4byte 0x00003208
_080258B0: .4byte 0x00003244
_080258B4: .4byte 0x000031B0
_080258B8:
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #0x46
	bls _080258CA
	bl sub_080115B4
	ldr r0, [r5]
	adds r0, r0, r6
	strb r4, [r0]
_080258CA:
	movs r5, #0
	cmp r5, r7
	bhs _080259BE
	ldr r3, _08025914
	mov ip, r3
	ldr r4, _08025918
	mov r8, r4
_080258D8:
	mov r6, r8
	ldr r2, [r6]
	lsls r0, r5, #4
	subs r1, r0, r5
	lsls r1, r1, #2
	adds r1, r2, r1
	add r1, ip
	ldrb r1, [r1]
	adds r6, r0, #0
	cmp r1, #0
	beq _080258FE
	adds r0, r2, #0
	adds r0, #0xa8
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _080258FE
	movs r0, #1
	strb r0, [r1]
_080258FE:
	adds r3, r4, #0
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0xa8
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #3
	bgt _0802591C
	cmp r0, #1
	bge _08025922
	b _080259B4
	.align 2, 0
_08025914: .4byte 0x000031CC
_08025918: .4byte 0x0202294C
_0802591C:
	cmp r0, #4
	beq _08025970
	b _080259B4
_08025922:
	adds r1, #0xb0
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _080259B4
	ldr r0, [r3]
	adds r0, #0xb0
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, #0xa8
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [r3]
	subs r1, r6, r5
	lsls r1, r1, #2
	adds r0, r0, r1
	add r0, ip
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, r0, r1
	ldr r6, _08025968
	adds r0, r0, r6
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, r0, r1
	ldr r1, _0802596C
	adds r0, r0, r1
	b _080259B2
	.align 2, 0
_08025968: .4byte 0x000031D0
_0802596C: .4byte 0x000031D4
_08025970:
	adds r1, #0xb0
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x27
	bls _080259B4
	ldr r0, [r4]
	adds r0, #0xb0
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, #0xa8
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [r4]
	subs r1, r6, r5
	lsls r1, r1, #2
	adds r0, r0, r1
	add r0, ip
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r3, _080259CC
	adds r0, r0, r3
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r6, _080259D0
	adds r0, r0, r6
_080259B2:
	strb r2, [r0]
_080259B4:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _080258D8
_080259BE:
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080259CC: .4byte 0x000031D0
_080259D0: .4byte 0x000031D4
	thumb_func_end sub_080257C4

	thumb_func_start sub_080259D4
sub_080259D4: @ 0x080259D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r5, _08025A98
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r6, [r1]
	ldr r2, _08025A9C
	adds r1, r0, r2
	ldr r3, _08025AA0
	adds r2, r0, r3
	ldr r4, _08025AA4
	adds r3, r0, r4
	ldr r7, _08025AA8
	adds r4, r0, r7
	str r4, [sp]
	adds r7, #0x3c
	adds r4, r0, r7
	str r4, [sp, #4]
	adds r7, #0x3c
	adds r4, r0, r7
	str r4, [sp, #8]
	adds r4, r0, #0
	adds r4, #0x40
	str r4, [sp, #0xc]
	movs r7, #0x90
	lsls r7, r7, #1
	adds r4, r0, r7
	str r4, [sp, #0x10]
	movs r4, #0x96
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [sp, #0x14]
	movs r0, #0
	bl sub_08027E90
	ldr r1, [r5]
	ldr r7, _08025AAC
	adds r2, r1, r7
	str r0, [r2]
	movs r0, #0x94
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	movs r4, #1
	cmp r4, r6
	bhs _08025A64
_08025A34:
	adds r0, r4, #0
	bl sub_080280A0
	cmp r0, #0
	beq _08025A5A
	ldr r0, _08025A98
	ldr r2, [r0]
	lsls r1, r4, #2
	movs r3, #0x98
	lsls r3, r3, #1
	adds r0, r2, r3
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
	movs r7, #0x94
	lsls r7, r7, #1
	adds r1, r2, r7
	movs r0, #0
	strb r0, [r1]
_08025A5A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _08025A34
_08025A64:
	ldr r5, _08025A98
	ldr r1, [r5]
	movs r6, #0x92
	lsls r6, r6, #1
	adds r1, r1, r6
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _08025AC2
	ldr r1, [r5]
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, #0
	beq _08025AB0
	bl sub_080115B4
	ldr r0, [r5]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	b _08025AC2
	.align 2, 0
_08025A98: .4byte 0x0202294C
_08025A9C: .4byte 0x000031A0
_08025AA0: .4byte 0x000031CC
_08025AA4: .4byte 0x00003208
_08025AA8: .4byte 0x00003244
_08025AAC: .4byte 0x000031B0
_08025AB0:
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #0x46
	bls _08025AC2
	bl sub_080115B4
	ldr r0, [r5]
	adds r0, r0, r6
	strb r4, [r0]
_08025AC2:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080259D4

	thumb_func_start sub_08025ACC
sub_08025ACC: @ 0x08025ACC
	push {r4, r5, lr}
	ldr r5, _08025AE4
	ldr r0, [r5]
	ldrb r0, [r0, #0x18]
	cmp r0, #4
	beq _08025B08
	cmp r0, #4
	bgt _08025AE8
	cmp r0, #3
	beq _08025AEE
	b _08025B12
	.align 2, 0
_08025AE4: .4byte 0x0202294C
_08025AE8:
	cmp r0, #0xb
	beq _08025B0E
	b _08025B12
_08025AEE:
	bl sub_08026978
	adds r4, r0, #0
	cmp r4, #1
	bne _08025B12
	bl sub_080269E8
	ldr r0, [r5]
	movs r1, #0x8e
	lsls r1, r1, #1
	adds r0, r0, r1
	str r4, [r0]
	b _08025B12
_08025B08:
	bl sub_080257C4
	b _08025B12
_08025B0E:
	bl sub_080259D4
_08025B12:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08025ACC

	thumb_func_start sub_08025B18
sub_08025B18: @ 0x08025B18
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r0, _08025B2C
	ldr r5, [r0]
	ldrb r0, [r5, #0x18]
	cmp r0, #4
	beq _08025B30
	cmp r0, #0xb
	beq _08025B80
	b _08025BBC
	.align 2, 0
_08025B2C: .4byte 0x0202294C
_08025B30:
	ldr r1, _08025B70
	adds r0, r5, r1
	ldr r2, _08025B74
	adds r1, r5, r2
	ldr r3, _08025B78
	adds r2, r5, r3
	ldr r4, _08025B7C
	adds r3, r5, r4
	movs r6, #0xca
	lsls r6, r6, #6
	adds r4, r5, r6
	str r4, [sp]
	adds r6, #0x3c
	adds r4, r5, r6
	str r4, [sp, #4]
	adds r4, r5, #0
	adds r4, #0x40
	ldrb r4, [r4]
	str r4, [sp, #8]
	movs r6, #0x90
	lsls r6, r6, #1
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, #0xc]
	adds r6, #0xc
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, #0x10]
	bl sub_08027B5C
	b _08025BBC
	.align 2, 0
_08025B70: .4byte 0x000032CC
_08025B74: .4byte 0x000031CC
_08025B78: .4byte 0x00003208
_08025B7C: .4byte 0x00003244
_08025B80:
	ldr r1, _08025BC4
	adds r0, r5, r1
	ldr r2, _08025BC8
	adds r1, r5, r2
	ldr r3, _08025BCC
	adds r2, r5, r3
	ldr r4, _08025BD0
	adds r3, r5, r4
	movs r6, #0xca
	lsls r6, r6, #6
	adds r4, r5, r6
	str r4, [sp]
	adds r6, #0x3c
	adds r4, r5, r6
	str r4, [sp, #4]
	adds r4, r5, #0
	adds r4, #0x40
	ldrb r4, [r4]
	str r4, [sp, #8]
	movs r6, #0x90
	lsls r6, r6, #1
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, #0xc]
	adds r6, #0xc
	adds r4, r5, r6
	ldr r4, [r4]
	str r4, [sp, #0x10]
	bl sub_08027B5C
_08025BBC:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025BC4: .4byte 0x000032CC
_08025BC8: .4byte 0x000031CC
_08025BCC: .4byte 0x00003208
_08025BD0: .4byte 0x00003244
	thumb_func_end sub_08025B18

	thumb_func_start sub_08025BD4
sub_08025BD4: @ 0x08025BD4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r0, _08025BE8
	ldr r5, [r0]
	ldrb r0, [r5, #0x18]
	cmp r0, #4
	beq _08025BEC
	cmp r0, #0xb
	beq _08025C44
	b _08025C88
	.align 2, 0
_08025BE8: .4byte 0x0202294C
_08025BEC:
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _08025C34
	adds r1, r1, r2
	adds r1, r5, r1
	ldr r3, _08025C38
	adds r2, r5, r3
	ldr r4, _08025C3C
	adds r3, r5, r4
	ldr r6, _08025C40
	adds r4, r5, r6
	str r4, [sp]
	adds r6, #0x3c
	adds r4, r5, r6
	str r4, [sp, #4]
	adds r6, #0x3c
	adds r4, r5, r6
	str r4, [sp, #8]
	adds r4, r5, #0
	adds r4, #0x40
	str r4, [sp, #0xc]
	movs r6, #0x90
	lsls r6, r6, #1
	adds r4, r5, r6
	str r4, [sp, #0x10]
	adds r6, #0xc
	adds r4, r5, r6
	str r4, [sp, #0x14]
	bl sub_08027E90
	b _08025C88
	.align 2, 0
_08025C34: .4byte 0x000031A0
_08025C38: .4byte 0x000031CC
_08025C3C: .4byte 0x00003208
_08025C40: .4byte 0x00003244
_08025C44:
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _08025C90
	adds r1, r1, r2
	adds r1, r5, r1
	ldr r3, _08025C94
	adds r2, r5, r3
	ldr r4, _08025C98
	adds r3, r5, r4
	ldr r6, _08025C9C
	adds r4, r5, r6
	str r4, [sp]
	adds r6, #0x3c
	adds r4, r5, r6
	str r4, [sp, #4]
	adds r6, #0x3c
	adds r4, r5, r6
	str r4, [sp, #8]
	adds r4, r5, #0
	adds r4, #0x40
	str r4, [sp, #0xc]
	movs r6, #0x90
	lsls r6, r6, #1
	adds r4, r5, r6
	str r4, [sp, #0x10]
	adds r6, #0xc
	adds r4, r5, r6
	str r4, [sp, #0x14]
	bl sub_08027E90
_08025C88:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025C90: .4byte 0x000031A0
_08025C94: .4byte 0x000031CC
_08025C98: .4byte 0x00003208
_08025C9C: .4byte 0x00003244
	thumb_func_end sub_08025BD4

	thumb_func_start sub_08025CA0
sub_08025CA0: @ 0x08025CA0
	push {r4, lr}
	ldr r4, _08025CB8
	ldr r1, [r4]
	ldrb r0, [r1, #0x18]
	cmp r0, #4
	beq _08025CD6
	cmp r0, #4
	bgt _08025CBC
	cmp r0, #3
	beq _08025CC2
	b _08025D08
	.align 2, 0
_08025CB8: .4byte 0x0202294C
_08025CBC:
	cmp r0, #0xb
	beq _08025CEC
	b _08025D08
_08025CC2:
	movs r0, #1
	bl sub_08027AFC
	ldr r0, [r4]
	movs r1, #0x8e
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
	b _08025D08
_08025CD6:
	ldr r2, _08025CE8
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _08025D08
	bl sub_08028018
	b _08025D08
	.align 2, 0
_08025CE8: .4byte 0x000032F8
_08025CEC:
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _08025D08
	adds r2, #0xc
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _08025D08
	movs r0, #1
	bl sub_0802807C
_08025D08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08025CA0

	thumb_func_start sub_08025D10
sub_08025D10: @ 0x08025D10
	push {r4, r5, r6, lr}
	ldr r6, _08025D48
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x28
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r3, _08025D4C
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025D50
	bl IsSEPlaying
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08025DB2
	ldr r0, [r6]
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r0, r2
	strb r1, [r0]
	b _08025DB2
	.align 2, 0
_08025D48: .4byte 0x0202294C
_08025D4C: .4byte 0x000031CC
_08025D50:
	ldr r3, _08025D7C
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, #1
	bne _08025D80
	movs r1, #0xa2
	lsls r1, r1, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025DB2
	movs r0, #0x1f
	bl m4aSongNumStop
	movs r0, #0x1f
	bl PlaySE
	ldr r0, [r6]
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r0, r2
	b _08025DB0
	.align 2, 0
_08025D7C: .4byte 0x000031D0
_08025D80:
	ldr r3, _08025DDC
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, #1
	bne _08025DB2
	movs r5, #0xa2
	lsls r5, r5, #1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025DB2
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08025DB2
	movs r0, #0x16
	bl PlaySE
	movs r0, #1
	bl sub_080281F8
	ldr r0, [r6]
	adds r0, r0, r5
_08025DB0:
	strb r4, [r0]
_08025DB2:
	ldr r0, _08025DE0
	ldr r2, [r0]
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r1, r2, r5
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	bne _08025DE4
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bls _08025DE4
	bl StopMapMusic
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #1
	b _08025E02
	.align 2, 0
_08025DDC: .4byte 0x000031D4
_08025DE0: .4byte 0x0202294C
_08025DE4:
	ldr r0, [r4]
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08025E04
	movs r0, #0xb
	bl PlayFanfareByFanfareNum
	ldr r0, [r4]
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #2
_08025E02:
	strb r1, [r0]
_08025E04:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08025D10

	thumb_func_start sub_08025E0C
sub_08025E0C: @ 0x08025E0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r6, _08025E58
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x44
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r2, #0
	adds r0, #0x48
	ldrb r7, [r0]
	subs r0, #0x20
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r3, _08025E5C
	adds r0, r1, r3
	ldrb r3, [r0]
	cmp r3, #0
	bne _08025E64
	ldr r4, _08025E60
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #1
	beq _08025EC6
	adds r4, #4
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #1
	beq _08025EC6
	movs r1, #0xa2
	lsls r1, r1, #1
	adds r0, r2, r1
	strb r3, [r0]
	b _08025EC6
	.align 2, 0
_08025E58: .4byte 0x0202294C
_08025E5C: .4byte 0x000031CC
_08025E60: .4byte 0x000031D0
_08025E64:
	ldr r3, _08025E90
	adds r0, r1, r3
	ldrb r4, [r0]
	cmp r4, #1
	bne _08025E94
	movs r1, #0xa2
	lsls r1, r1, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025EC6
	movs r0, #0x1f
	bl m4aSongNumStop
	movs r0, #0x1f
	bl PlaySE
	ldr r0, [r6]
	movs r3, #0xa2
	lsls r3, r3, #1
	adds r0, r0, r3
	b _08025EC4
	.align 2, 0
_08025E90: .4byte 0x000031D0
_08025E94:
	ldr r4, _08025F18
	adds r0, r1, r4
	ldrb r4, [r0]
	cmp r4, #1
	bne _08025EC6
	movs r5, #0xa2
	lsls r5, r5, #1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025EC6
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08025EC6
	movs r0, #0x16
	bl PlaySE
	movs r0, #1
	bl sub_080281F8
	ldr r0, [r6]
	adds r0, r0, r5
_08025EC4:
	strb r4, [r0]
_08025EC6:
	mov r4, r8
	cmp r4, r7
	bhs _08025F3A
	ldr r5, _08025F1C
_08025ECE:
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x28
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08025F20
	adds r0, r0, r1
	adds r0, r2, r0
	adds r1, r0, #0
	adds r1, #0x14
	adds r0, #0x1f
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #9
	bls _08025F24
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r2, r3
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025F30
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r0, #0x4a
	bl PlaySE
	ldr r0, [r5]
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #1
	b _08025F2E
	.align 2, 0
_08025F18: .4byte 0x000031D4
_08025F1C: .4byte 0x0202294C
_08025F20: .4byte 0x000031A0
_08025F24:
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r2, r3
	adds r0, r0, r4
	movs r1, #0
_08025F2E:
	strb r1, [r0]
_08025F30:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _08025ECE
_08025F3A:
	ldr r0, _08025F64
	ldr r2, [r0]
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r1, r2, r5
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	bne _08025F68
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bls _08025F68
	bl StopMapMusic
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #1
	b _08025F86
	.align 2, 0
_08025F64: .4byte 0x0202294C
_08025F68:
	ldr r0, [r4]
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08025F88
	movs r0, #0xb
	bl PlayFanfareByFanfareNum
	ldr r0, [r4]
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r0, r3
	movs r1, #2
_08025F86:
	strb r1, [r0]
_08025F88:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08025E0C

	thumb_func_start sub_08025F94
sub_08025F94: @ 0x08025F94
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08025F94

	thumb_func_start sub_08025FAC
sub_08025FAC: @ 0x08025FAC
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08025FAC

	thumb_func_start sub_08025FC0
sub_08025FC0: @ 0x08025FC0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl IsMonShiny
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08025FC0

	thumb_func_start sub_08025FD4
sub_08025FD4: @ 0x08025FD4
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08025FD4

	thumb_func_start sub_08025FE4
sub_08025FE4: @ 0x08025FE4
	push {lr}
	movs r1, #1
	bl CreateTask
	ldr r1, _08026004
	ldr r3, [r1]
	movs r2, #0
	strb r0, [r3, #4]
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldr r0, [r1]
	strb r2, [r0, #0xc]
	ldr r0, [r1]
	strb r2, [r0, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_08026004: .4byte 0x0202294C
	thumb_func_end sub_08025FE4

	thumb_func_start sub_08026008
sub_08026008: @ 0x08026008
	push {r4, lr}
	ldr r2, _08026028
	ldr r1, [r2]
	ldrb r3, [r1, #0x18]
	movs r4, #0
	strb r3, [r1, #0x1c]
	ldr r1, [r2]
	strb r0, [r1, #0x18]
	ldr r0, [r2]
	strb r4, [r0, #0x10]
	ldr r0, [r2]
	strb r4, [r0, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026028: .4byte 0x0202294C
	thumb_func_end sub_08026008

	thumb_func_start sub_0802602C
sub_0802602C: @ 0x0802602C
	push {r4, lr}
	ldr r3, _08026060
	ldr r1, [r3]
	ldrb r0, [r1, #0x14]
	lsrs r2, r0, #2
	adds r0, #1
	strb r0, [r1, #0x14]
	cmp r2, #0
	beq _08026080
	ldr r3, [r3]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08026080
	ldr r1, _08026064
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r2, r0
	blo _08026068
	movs r0, #1
	b _08026082
	.align 2, 0
_08026060: .4byte 0x0202294C
_08026064: .4byte 0x082CB320
_08026068:
	lsls r4, r2, #3
	adds r1, r4, #0
	movs r0, #0x14
	bl SetGpuReg
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0x18
	adds r1, r4, #0
	bl SetGpuReg
_08026080:
	movs r0, #0
_08026082:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0802602C

	thumb_func_start sub_08026088
sub_08026088: @ 0x08026088
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _080260E0
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x44
	adds r0, #0x48
	ldrb r5, [r0]
	ldrb r1, [r1]
	cmp r1, r5
	bhs _080260D4
	mov r8, r2
	ldr r0, _080260E4
	mov ip, r0
	movs r7, #0
	movs r6, #1
_080260AA:
	mov r2, r8
	ldr r0, [r2]
	mov r2, ip
	adds r4, r0, r2
	ldr r2, _080260E8
	adds r0, r0, r2
	adds r2, r0, r1
	movs r3, #0
	adds r0, r1, #0
	ands r0, r6
	cmp r0, #0
	bne _080260C4
	movs r3, #1
_080260C4:
	strb r3, [r2]
	adds r0, r4, r1
	strb r7, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r5
	blo _080260AA
_080260D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080260E0: .4byte 0x0202294C
_080260E4: .4byte 0x000032E0
_080260E8: .4byte 0x000032EB
	thumb_func_end sub_08026088

	thumb_func_start sub_080260EC
sub_080260EC: @ 0x080260EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _080261C0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x44
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, #0
	adds r0, #0x48
	ldrb r0, [r0]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bls _08026120
	b _080263DC
_08026120:
	movs r6, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	bhs _08026208
_08026128:
	ldr r3, _080261C0
	lsls r0, r6, #4
	subs r1, r0, r6
	lsls r1, r1, #2
	ldr r2, [r3]
	adds r1, r1, r2
	ldr r4, _080261C4
	adds r4, r4, r1
	mov r8, r4
	ldrb r1, [r4]
	mov sb, r0
	adds r0, r6, #1
	str r0, [sp, #0xc]
	cmp r1, #0
	beq _080261FC
	adds r0, r2, #0
	adds r0, #0xa8
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _080261FC
	ldr r1, [sp]
	mov sl, r1
	ldr r2, [sp, #4]
	cmp sl, r2
	bhs _080261FC
	adds r7, r3, #0
_0802615E:
	ldr r0, _080261C8
	add r0, sl
	ldrb r5, [r0]
	ldr r1, [r7]
	lsls r4, r5, #1
	adds r0, r1, #0
	adds r0, #0xf4
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _080261FC
	adds r0, r1, #0
	adds r0, #0xf5
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _080261FC
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r2, r5, #0
	bl sub_080263FC
	cmp r0, #1
	bne _080261D8
	movs r2, #0
	ldr r3, _080261C0
	mov r8, r4
_08026196:
	ldr r0, [r3]
	mov r4, r8
	adds r1, r2, r4
	adds r0, #0xf4
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080261CC
	strb r6, [r1]
	ldr r0, [r3]
	adds r0, #0xa8
	adds r0, r0, r6
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0xc4
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	b _080261FC
	.align 2, 0
_080261C0: .4byte 0x0202294C
_080261C4: .4byte 0x000031CC
_080261C8: .4byte 0x082C7D28
_080261CC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bls _08026196
	b _080261FC
_080261D8:
	ldr r0, [r7]
	mov r2, sb
	subs r1, r2, r6
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r4, _080262CC
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #1
	beq _080261FC
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, [sp, #4]
	cmp sl, r0
	blo _0802615E
_080261FC:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r2, [sp, #8]
	cmp r6, r2
	blo _08026128
_08026208:
	ldr r4, [sp]
	mov sl, r4
	ldr r0, [sp, #4]
	cmp sl, r0
	blo _08026214
	b _080263DC
_08026214:
	ldr r1, _080262D0
	mov sb, r1
_08026218:
	movs r6, #0xff
	ldr r0, _080262D4
	add r0, sl
	ldrb r5, [r0]
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0xc4
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _08026230
	b _080263CA
_08026230:
	adds r0, r5, #0
	bl sub_08026B4C
	mov r1, sb
	ldr r4, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x90
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _08026256
	movs r3, #2
_08026256:
	ldr r2, _080262D8
	ldr r0, _080262DC
	adds r1, r4, r0
	adds r1, r1, r5
	lsls r0, r3, #1
	adds r0, r0, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd0
	adds r0, r0, r5
	ldrb r0, [r0]
	subs r2, r1, r0
	cmp r2, #5
	bgt _08026284
	adds r1, r4, #0
	adds r1, #0x9c
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, r0, r2
	strb r0, [r1]
_08026284:
	mov r2, sb
	ldr r1, [r2]
	adds r1, #0x9c
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	movs r4, #0xff
	ands r0, r4
	cmp r0, #5
	bhi _0802629E
	b _080263CA
_0802629E:
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0x9c
	adds r0, r0, r5
	strb r2, [r0]
	ldr r3, [r1]
	lsls r1, r5, #1
	adds r0, r3, #0
	adds r0, #0xf4
	adds r2, r0, r1
	ldrb r0, [r2]
	mov r8, r1
	cmp r0, #0xff
	bne _080262E0
	adds r0, r3, #0
	adds r0, #0xf5
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080262C8
	b _080263CA
_080262C8:
	b _080262F0
	.align 2, 0
_080262CC: .4byte 0x000031D4
_080262D0: .4byte 0x0202294C
_080262D4: .4byte 0x082C7D28
_080262D8: .4byte 0x082CB314
_080262DC: .4byte 0x000031B4
_080262E0:
	adds r0, r3, #0
	adds r0, #0xf5
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080262F0
	ldrb r4, [r2]
	b _08026316
_080262F0:
	mov r2, sb
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0xf4
	add r0, r8
	ldrb r7, [r0]
	adds r1, #0xf5
	add r1, r8
	ldrb r6, [r1]
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08026312
	adds r4, r7, #0
	b _08026316
_08026312:
	adds r4, r6, #0
	adds r6, r7, #0
_08026316:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, _080263EC
	adds r0, r0, r2
	adds r0, r0, r5
	movs r1, #7
	strb r1, [r0]
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0xc4
	adds r0, r0, r5
	movs r1, #2
	strb r1, [r0]
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0xa8
	adds r0, r0, r4
	movs r1, #3
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xb8
	adds r0, r0, r5
	strb r4, [r0]
	ldr r1, [r2]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r2, _080263F0
	adds r1, r1, r2
	movs r0, #1
	strb r0, [r1]
	mov r2, sb
	ldr r1, [r2]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080263F4
	adds r1, r1, r0
	movs r2, #1
	strb r2, [r1]
	mov r0, sb
	ldr r1, [r0]
	lsls r0, r4, #1
	adds r1, #0x86
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_08026CDC
	movs r0, #1
	bl sub_08026FF4
	adds r0, r4, #0
	bl sub_08026ADC
	mov r1, sb
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0xe8
	adds r1, r1, r5
	ldr r2, _080263F8
	adds r0, r0, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	mov r4, sb
	ldr r0, [r4]
	adds r0, r0, r2
	adds r0, r0, r5
	movs r1, #3
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, #0xf4
	add r1, r8
	ldrb r0, [r1]
	movs r2, #0xff
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [r4]
	adds r1, #0xf5
	add r1, r8
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_080263CA:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r4, [sp, #4]
	cmp sl, r4
	bhs _080263DC
	b _08026218
_080263DC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080263EC: .4byte 0x000032EB
_080263F0: .4byte 0x000031D0
_080263F4: .4byte 0x000031D4
_080263F8: .4byte 0x000032E0
	thumb_func_end sub_080260EC

	thumb_func_start sub_080263FC
sub_080263FC: @ 0x080263FC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r7, #0
	ldr r2, _08026430
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08026434
	adds r1, r1, r0
	mov ip, r2
	cmp r3, #2
	beq _08026438
	cmp r3, #2
	bgt _0802643E
	cmp r3, #1
	beq _0802643C
	b _0802643E
	.align 2, 0
_08026430: .4byte 0x0202294C
_08026434: .4byte 0x000032E0
_08026438:
	movs r7, #1
	b _0802643E
_0802643C:
	movs r7, #2
_0802643E:
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r0, [r0]
	subs r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0802649C
	ldr r0, _08026490
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, r7, r1
	lsls r2, r5, #4
	subs r2, r2, r5
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r6, r1
	bne _080264D2
	mov r0, ip
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xc4
	adds r0, r0, r6
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08026498
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r1, _08026494
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	b _080264D2
	.align 2, 0
_08026490: .4byte 0x082C7E3B
_08026494: .4byte 0x000031D4
_08026498:
	movs r0, #1
	b _080264D4
_0802649C:
	ldr r0, _080264DC
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, r7, r1
	lsls r2, r5, #4
	subs r2, r2, r5
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r6, r1
	bne _080264D2
	mov r1, ip
	ldr r0, [r1]
	adds r0, #0xa8
	adds r0, r0, r4
	movs r1, #4
	strb r1, [r0]
	mov r0, ip
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080264E0
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_080264D2:
	movs r0, #0
_080264D4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080264DC: .4byte 0x082C7E3B
_080264E0: .4byte 0x000031D4
	thumb_func_end sub_080263FC

	thumb_func_start sub_080264E4
sub_080264E4: @ 0x080264E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _080265B8
	ldr r4, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r1, [r0]
	adds r0, #4
	ldrb r0, [r0]
	mov sb, r0
	movs r3, #0
	mov sl, r3
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r4, r5
	str r3, [r0]
	adds r5, r1, #0
	mov r0, sb
	subs r0, #1
	cmp r5, r0
	blt _08026516
	b _08026734
_08026516:
	mov r8, r2
_08026518:
	mov r0, r8
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #1
	bls _0802652A
	b _08026634
_0802652A:
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r2, #1
	str r2, [r0]
	ldr r1, _080265BC
	adds r0, r4, r1
	adds r6, r0, r5
	ldrb r0, [r6]
	cmp r0, #9
	bls _080265C4
	movs r7, #0
	movs r0, #0xa
	strb r0, [r6]
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xc4
	adds r0, r0, r5
	movs r1, #3
	strb r1, [r0]
	mov r1, r8
	ldr r0, [r1]
	movs r6, #0xa4
	lsls r6, r6, #1
	adds r0, r0, r6
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _08026574
	strb r2, [r1]
	ldr r2, _080265C0
	adds r0, r4, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	adds r0, #0x4a
	bl PlaySE
_08026574:
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bls _0802658A
	mov r2, sl
	cmp r2, #1
	beq _0802658A
	b _08026724
_0802658A:
	movs r0, #1
	mov sl, r0
	adds r0, r1, r6
	adds r0, r0, r5
	strb r7, [r0]
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #9
	bhi _080265A6
	adds r0, #1
	strb r0, [r1]
_080265A6:
	movs r0, #3
	adds r1, r5, #0
	movs r2, #0
	bl sub_08026CDC
	movs r0, #0
	bl sub_08026FF4
	b _08026724
	.align 2, 0
_080265B8: .4byte 0x0202294C
_080265BC: .4byte 0x000032EB
_080265C0: .4byte 0x000032E0
_080265C4:
	adds r0, r5, #0
	bl sub_08026B4C
	mov r2, r8
	ldr r7, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x90
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _080265EA
	movs r3, #2
_080265EA:
	ldr r2, _0802662C
	ldr r0, _08026630
	adds r1, r4, r0
	adds r1, r1, r5
	lsls r0, r3, #1
	adds r0, r0, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r2, [r0]
	adds r1, r7, #0
	adds r1, #0xd0
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	movs r3, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r2
	blo _08026624
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xd0
	adds r0, r0, r5
	strb r3, [r0]
_08026624:
	bl sub_080260EC
	b _08026724
	.align 2, 0
_0802662C: .4byte 0x082CB314
_08026630: .4byte 0x000032E0
_08026634:
	cmp r0, #2
	bne _080266B4
	adds r1, r4, #0
	adds r1, #0xdc
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	movs r3, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bls _08026724
	mov r0, r8
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0xb8
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r1, _080266A8
	adds r2, r2, r1
	strb r3, [r2]
	mov r2, r8
	ldr r0, [r2]
	adds r0, #0xdc
	adds r0, r0, r5
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, #0xd0
	adds r0, r0, r5
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, #0xc4
	adds r0, r0, r5
	strb r3, [r0]
	ldr r1, _080266AC
	adds r0, r4, r1
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_08026B4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08026B70
	ldr r2, _080266B0
	adds r1, r4, r2
	adds r1, r1, r5
	strb r0, [r1]
	b _08026724
	.align 2, 0
_080266A8: .4byte 0x000031D0
_080266AC: .4byte 0x000032EB
_080266B0: .4byte 0x000032E0
_080266B4:
	cmp r0, #3
	bne _08026724
	adds r1, r4, #0
	adds r1, #0xdc
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bls _08026724
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08026724
	adds r0, r1, #0
	adds r0, #0xdc
	adds r0, r0, r5
	strb r2, [r0]
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0xd0
	adds r0, r0, r5
	strb r2, [r0]
	ldr r0, [r1]
	adds r0, #0xc4
	adds r0, r0, r5
	strb r2, [r0]
	ldr r2, _08026744
	adds r0, r4, r2
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	mov r0, r8
	ldr r1, [r0]
	adds r1, #0xe8
	adds r1, r1, r5
	subs r2, #0xb
	adds r4, r4, r2
	adds r4, r4, r5
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_08026B4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08026B70
	strb r0, [r4]
_08026724:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, sb
	subs r0, #1
	cmp r5, r0
	bge _08026734
	b _08026518
_08026734:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026744: .4byte 0x000032EB
	thumb_func_end sub_080264E4

	thumb_func_start sub_08026748
sub_08026748: @ 0x08026748
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080267B0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x44
	adds r0, #0x48
	ldrb r0, [r0]
	mov r8, r0
	ldrb r6, [r1]
	cmp r6, r8
	bhs _0802683A
	ldr r0, _080267B4
	mov sb, r0
_08026768:
	ldr r0, _080267B0
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _080267B8
	adds r0, r0, r2
	adds r7, r3, r0
	movs r0, #0xb
	adds r2, r1, #0
	muls r2, r0, r2
	adds r2, r6, r2
	adds r3, #0x24
	ldrb r1, [r3]
	subs r1, #1
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	adds r2, r2, r0
	add r2, sb
	ldrb r4, [r2]
	adds r0, r7, #0
	adds r0, #0x1f
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080267BC
	adds r0, r6, #0
	movs r1, #0
	bl sub_08028924
	b _080267C4
	.align 2, 0
_080267B0: .4byte 0x0202294C
_080267B4: .4byte 0x082C7D28
_080267B8: .4byte 0x000031A0
_080267BC:
	adds r0, r6, #0
	movs r1, #1
	bl sub_08028924
_080267C4:
	adds r0, r7, #0
	adds r0, #0x1f
	adds r5, r0, r4
	ldrb r0, [r5]
	cmp r0, #9
	bls _080267F0
	adds r0, r7, #0
	adds r0, #0x14
	adds r0, r0, r4
	ldrb r1, [r0]
	adds r1, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl sub_080289D0
	ldrb r1, [r5]
	lsls r1, r1, #0x19
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r1, r1, r0
	b _08026812
_080267F0:
	adds r0, r7, #0
	adds r0, #0x14
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, #3
	bne _0802681C
	movs r0, #7
	strb r0, [r5]
	adds r0, r6, #0
	movs r1, #6
	bl sub_080289D0
	ldrb r1, [r5]
	lsls r1, r1, #0x19
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r1, r1, r2
_08026812:
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl sub_080289A8
	b _08026830
_0802681C:
	ldrb r1, [r3]
	adds r0, r6, #0
	bl sub_080289D0
	ldrb r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl sub_080289A8
_08026830:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r8
	blo _08026768
_0802683A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08026748

	thumb_func_start sub_08026848
sub_08026848: @ 0x08026848
	push {r4, r5, r6, lr}
	ldr r1, _08026880
	ldr r0, [r1]
	adds r0, #0x24
	ldrb r5, [r0]
	movs r4, #0
	cmp r4, r5
	bhs _0802687A
	adds r6, r1, #0
_0802685A:
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, [r6]
	adds r0, r0, r1
	ldr r1, _08026884
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080283E0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _0802685A
_0802687A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026880: .4byte 0x0202294C
_08026884: .4byte 0x000031CC
	thumb_func_end sub_08026848

	thumb_func_start sub_08026888
sub_08026888: @ 0x08026888
	push {r4, r5, lr}
	ldr r0, _080268B0
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r5, [r0]
	movs r4, #0
	cmp r4, r5
	bhs _080268AA
_08026898:
	adds r0, r4, #0
	movs r1, #4
	bl sub_080283E0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08026898
_080268AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080268B0: .4byte 0x0202294C
	thumb_func_end sub_08026888

	thumb_func_start sub_080268B4
sub_080268B4: @ 0x080268B4
	push {lr}
	bl sub_08026748
	ldr r0, _080268CC
	ldr r0, [r0]
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bls _080268D0
	bl sub_08026888
	b _080268D4
	.align 2, 0
_080268CC: .4byte 0x0202294C
_080268D0:
	bl sub_08026848
_080268D4:
	ldr r0, _080268E4
	ldr r0, [r0]
	adds r0, #0x40
	ldrb r0, [r0]
	bl sub_08028600
	pop {r0}
	bx r0
	.align 2, 0
_080268E4: .4byte 0x0202294C
	thumb_func_end sub_080268B4

	thumb_func_start sub_080268E8
sub_080268E8: @ 0x080268E8
	push {lr}
	bl sub_08026748
	ldr r0, _08026900
	ldr r0, [r0]
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #9
	bls _08026904
	bl sub_08026888
	b _08026908
	.align 2, 0
_08026900: .4byte 0x0202294C
_08026904:
	bl sub_08026848
_08026908:
	ldr r0, _08026918
	ldr r0, [r0]
	adds r0, #0x40
	ldrb r0, [r0]
	bl sub_08028600
	pop {r0}
	bx r0
	.align 2, 0
_08026918: .4byte 0x0202294C
	thumb_func_end sub_080268E8

	thumb_func_start sub_0802691C
sub_0802691C: @ 0x0802691C
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	cmp r0, #4
	bhi _08026974
	lsls r0, r0, #2
	ldr r1, _08026934
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026934: .4byte 0x08026938
_08026938: @ jump table
	.4byte _0802694C @ case 0
	.4byte _08026954 @ case 1
	.4byte _0802695C @ case 2
	.4byte _08026964 @ case 3
	.4byte _0802696C @ case 4
_0802694C:
	movs r0, #4
	strb r0, [r3]
	movs r0, #7
	b _08026972
_08026954:
	movs r0, #3
	strb r0, [r3]
	movs r0, #8
	b _08026972
_0802695C:
	movs r0, #2
	strb r0, [r3]
	movs r0, #9
	b _08026972
_08026964:
	movs r0, #1
	strb r0, [r3]
	movs r0, #0xa
	b _08026972
_0802696C:
	movs r0, #0
	strb r0, [r3]
	movs r0, #0xb
_08026972:
	strb r0, [r2]
_08026974:
	pop {r0}
	bx r0
	thumb_func_end sub_0802691C

	thumb_func_start sub_08026978
sub_08026978: @ 0x08026978
	push {r4, r5, r6, lr}
	ldr r1, _080269D0
	ldr r0, [r1]
	adds r0, #0x24
	ldrb r5, [r0]
	movs r4, #1
	cmp r4, r5
	bhs _080269DE
	adds r6, r1, #0
_0802698A:
	ldr r0, [r6]
	movs r1, #0xac
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080269AC
	adds r0, r4, #0
	bl sub_08027B28
	ldr r1, [r6]
	movs r2, #0xac
	lsls r2, r2, #1
	adds r1, r1, r2
	adds r1, r1, r4
	strb r0, [r1]
_080269AC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _0802698A
	cmp r4, r5
	bhs _080269DE
	ldr r0, _080269D0
	ldr r0, [r0]
	movs r2, #0xac
	lsls r2, r2, #1
	adds r1, r0, r2
_080269C4:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080269D4
	movs r0, #0
	b _080269E0
	.align 2, 0
_080269D0: .4byte 0x0202294C
_080269D4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _080269C4
_080269DE:
	movs r0, #1
_080269E0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08026978

	thumb_func_start sub_080269E8
sub_080269E8: @ 0x080269E8
	push {r4, lr}
	movs r1, #0
	ldr r4, _08026A0C
	movs r3, #0xac
	lsls r3, r3, #1
	movs r2, #0
_080269F4:
	ldr r0, [r4]
	adds r0, r0, r3
	adds r0, r0, r1
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _080269F4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026A0C: .4byte 0x0202294C
	thumb_func_end sub_080269E8

	thumb_func_start sub_08026A10
sub_08026A10: @ 0x08026A10
	push {r4, lr}
	ldr r3, _08026A44
	ldr r1, [r3]
	adds r2, r1, #0
	adds r2, #0x40
	ldrb r0, [r2]
	cmp r0, #9
	bls _08026A48
	movs r4, #0x90
	lsls r4, r4, #1
	adds r0, r1, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _08026A48
	movs r0, #0xa
	strb r0, [r2]
	ldr r0, [r3]
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08026A48
	movs r0, #1
	b _08026A4A
	.align 2, 0
_08026A44: .4byte 0x0202294C
_08026A48:
	movs r0, #0
_08026A4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08026A10

	thumb_func_start sub_08026A50
sub_08026A50: @ 0x08026A50
	push {r4, r5, r6, lr}
	ldr r4, _08026AC8
	ldr r1, [r4]
	adds r2, r1, #0
	adds r2, #0x40
	ldrb r0, [r2]
	cmp r0, #9
	bls _08026AD4
	adds r0, r1, #0
	adds r0, #0x44
	ldrb r3, [r0]
	adds r0, #4
	ldrb r5, [r0]
	movs r0, #0xa
	strb r0, [r2]
	ldr r4, [r4]
	mov ip, r4
	movs r0, #0x96
	lsls r0, r0, #1
	add r0, ip
	ldr r0, [r0]
	cmp r0, #0
	beq _08026AD4
	adds r4, r3, #0
	cmp r4, r5
	bhs _08026AC4
	mov r0, ip
	adds r0, #0x28
	ldrb r3, [r0]
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r1, r1, #2
	ldr r6, _08026ACC
	subs r0, #4
	ldrb r2, [r0]
	subs r2, #1
	add r1, ip
	movs r0, #0xb
	muls r3, r0, r3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	subs r2, r0, r2
	ldr r0, _08026AD0
	adds r1, r1, r0
_08026AAA:
	adds r0, r4, r3
	adds r0, r0, r2
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _08026AD4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08026AAA
_08026AC4:
	movs r0, #1
	b _08026AD6
	.align 2, 0
_08026AC8: .4byte 0x0202294C
_08026ACC: .4byte 0x082C7D28
_08026AD0: .4byte 0x000031BF
_08026AD4:
	movs r0, #0
_08026AD6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08026A50

	thumb_func_start sub_08026ADC
sub_08026ADC: @ 0x08026ADC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08026B44
	mov r8, r0
	ldr r0, _08026B48
	ldr r6, [r0]
	adds r0, r6, #0
	adds r0, #0x90
	adds r0, r0, r5
	mov sb, r0
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #7
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	add r4, r8
	adds r0, r7, #0
	movs r1, #7
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldrb r4, [r4]
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsls r5, r5, #1
	adds r6, #0x86
	adds r6, r6, r5
	ldrh r1, [r6]
	lsrs r0, r0, #0x18
	cmp r1, r0
	blo _08026B36
	adds r0, r7, #1
	mov r1, sb
	strb r0, [r1]
_08026B36:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026B44: .4byte 0x082CB328
_08026B48: .4byte 0x0202294C
	thumb_func_end sub_08026ADC

	thumb_func_start sub_08026B4C
sub_08026B4C: @ 0x08026B4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08026B68
	ldr r1, _08026B6C
	ldr r1, [r1]
	adds r1, #0x24
	ldrb r1, [r1]
	subs r1, #1
	movs r2, #0xb
	muls r1, r2, r1
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08026B68: .4byte 0x082C7ED4
_08026B6C: .4byte 0x0202294C
	thumb_func_end sub_08026B4C

	thumb_func_start sub_08026B70
sub_08026B70: @ 0x08026B70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r4, _08026BF0
	ldr r1, [r4]
	adds r1, #0x24
	ldrb r2, [r1]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08026BF4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r2, #4
	subs r0, r0, r2
	adds r1, r1, r0
	adds r0, r1, r3
	ldrb r0, [r0]
	mov ip, r0
	adds r0, r3, #1
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r3, #2
	adds r1, r1, r3
	ldrb r1, [r1]
	mov r8, r1
	movs r3, #0
	ldr r1, _08026BF8
	lsls r0, r2, #2
	adds r2, r0, r2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08026BD8
	adds r6, r1, #0
_08026BBE:
	adds r0, r3, r2
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r5, r0
	beq _08026BFC
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08026BBE
_08026BD8:
	ldr r0, [r4]
	adds r0, #0x90
	mov r1, ip
	adds r2, r0, r1
	adds r1, r0, r7
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r0, r3
	bls _08026C06
	adds r1, r0, #0
	b _08026C08
	.align 2, 0
_08026BF0: .4byte 0x0202294C
_08026BF4: .4byte 0x082C7E86
_08026BF8: .4byte 0x082C7F0B
_08026BFC:
	ldr r0, [r4]
	adds r0, #0x90
	adds r0, r0, r7
	ldrb r0, [r0]
	b _08026C1A
_08026C06:
	ldrb r1, [r1]
_08026C08:
	ldr r0, [r4]
	adds r0, #0x90
	mov r2, r8
	adds r4, r0, r2
	ldrb r0, [r4]
	cmp r0, r1
	bls _08026C18
	adds r1, r0, #0
_08026C18:
	adds r0, r1, #0
_08026C1A:
	adds r1, r5, #0
	bl sub_08026C30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08026B70

	thumb_func_start sub_08026C30
sub_08026C30: @ 0x08026C30
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08026C5C
	ldr r2, [r2]
	adds r2, #0xe8
	adds r2, r2, r1
	ldrb r4, [r2]
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bhi _08026C9E
	lsls r0, r0, #2
	ldr r1, _08026C60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026C5C: .4byte 0x0202294C
_08026C60: .4byte 0x08026C64
_08026C64: @ jump table
	.4byte _08026C9E @ case 0
	.4byte _08026C96 @ case 1
	.4byte _08026CA2 @ case 2
	.4byte _08026C80 @ case 3
	.4byte _08026C86 @ case 4
	.4byte _08026C8C @ case 5
	.4byte _08026C92 @ case 6
_08026C80:
	cmp r4, #0
	beq _08026C96
	b _08026C9E
_08026C86:
	cmp r4, #0
	beq _08026CA2
	b _08026C9E
_08026C8C:
	cmp r4, #2
	beq _08026C96
	b _08026CA2
_08026C92:
	cmp r4, #0
	bne _08026C9A
_08026C96:
	movs r0, #1
	b _08026CA4
_08026C9A:
	cmp r4, #1
	beq _08026CA2
_08026C9E:
	movs r0, #0
	b _08026CA4
_08026CA2:
	movs r0, #2
_08026CA4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08026C30

	thumb_func_start sub_08026CAC
sub_08026CAC: @ 0x08026CAC
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0
	adds r4, r0, #0
	b _08026CBE
_08026CB6:
	ldrh r0, [r4, #6]
	adds r6, r6, r0
	adds r4, #0xc
	adds r5, #1
_08026CBE:
	bl GetLinkPlayerCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	blt _08026CB6
	cmp r6, #0xa
	bgt _08026CD2
	movs r0, #0
	b _08026CD4
_08026CD2:
	movs r0, #1
_08026CD4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08026CAC

	thumb_func_start sub_08026CDC
sub_08026CDC: @ 0x08026CDC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r6, _08026D04
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r5, [r0]
	cmp r3, #0
	bge _08026CFA
	b _08026FEC
_08026CFA:
	cmp r3, #2
	ble _08026D08
	cmp r3, #3
	beq _08026D38
	b _08026FEC
	.align 2, 0
_08026D04: .4byte 0x0202294C
_08026D08:
	ldr r3, _08026D30
	adds r0, r1, r3
	adds r0, r0, r4
	ldrb r4, [r0]
	lsls r4, r4, #1
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r0, r1, #0
	adds r0, #0x4a
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r1, _08026D34
	bl IncrementWithLimit
	ldr r1, [r6]
	adds r1, #0x4a
	adds r1, r1, r4
	b _08026FEA
	.align 2, 0
_08026D30: .4byte 0x000031B4
_08026D34: .4byte 0x00004E20
_08026D38:
	adds r0, r1, #0
	adds r0, #0x4a
	bl sub_08026CAC
	cmp r0, #0
	beq _08026D46
	b _08026FEC
_08026D46:
	cmp r5, #3
	bne _08026D4C
	b _08026F14
_08026D4C:
	cmp r5, #3
	bgt _08026D58
	cmp r5, #2
	bne _08026D56
	b _08026FA8
_08026D56:
	b _08026FEC
_08026D58:
	cmp r5, #4
	bne _08026D5E
	b _08026E50
_08026D5E:
	cmp r5, #5
	beq _08026D64
	b _08026FEC
_08026D64:
	cmp r4, #9
	bls _08026D6A
	b _08026FEC
_08026D6A:
	lsls r0, r4, #2
	ldr r1, _08026D74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026D74: .4byte 0x08026D78
_08026D78: @ jump table
	.4byte _08026DA0 @ case 0
	.4byte _08026DB8 @ case 1
	.4byte _08026DC4 @ case 2
	.4byte _08026DDC @ case 3
	.4byte _08026DE8 @ case 4
	.4byte _08026E00 @ case 5
	.4byte _08026E0C @ case 6
	.4byte _08026E20 @ case 7
	.4byte _08026E2C @ case 8
	.4byte _08026E44 @ case 9
_08026DA0:
	ldr r0, _08026DB4
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x68
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x74
	b _08026FE6
	.align 2, 0
_08026DB4: .4byte 0x0202294C
_08026DB8:
	ldr r0, _08026DC0
	ldr r1, [r0]
	adds r1, #0x74
	b _08026FE6
	.align 2, 0
_08026DC0: .4byte 0x0202294C
_08026DC4:
	ldr r0, _08026DD8
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x74
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x80
	b _08026FE6
	.align 2, 0
_08026DD8: .4byte 0x0202294C
_08026DDC:
	ldr r0, _08026DE4
	ldr r1, [r0]
	adds r1, #0x80
	b _08026FE6
	.align 2, 0
_08026DE4: .4byte 0x0202294C
_08026DE8:
	ldr r0, _08026DFC
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x80
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x50
	b _08026FE6
	.align 2, 0
_08026DFC: .4byte 0x0202294C
_08026E00:
	ldr r0, _08026E08
	ldr r1, [r0]
	adds r1, #0x50
	b _08026FE6
	.align 2, 0
_08026E08: .4byte 0x0202294C
_08026E0C:
	ldr r0, _08026E1C
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x50
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _08026FE4
	.align 2, 0
_08026E1C: .4byte 0x0202294C
_08026E20:
	ldr r0, _08026E28
	ldr r1, [r0]
	b _08026FE4
	.align 2, 0
_08026E28: .4byte 0x0202294C
_08026E2C:
	ldr r0, _08026E40
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x5c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x68
	b _08026FE6
	.align 2, 0
_08026E40: .4byte 0x0202294C
_08026E44:
	ldr r0, _08026E4C
	ldr r1, [r0]
	adds r1, #0x68
	b _08026FE6
	.align 2, 0
_08026E4C: .4byte 0x0202294C
_08026E50:
	subs r0, r4, #1
	cmp r0, #7
	bls _08026E58
	b _08026FEC
_08026E58:
	lsls r0, r0, #2
	ldr r1, _08026E64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026E64: .4byte 0x08026E68
_08026E68: @ jump table
	.4byte _08026E88 @ case 0
	.4byte _08026EA0 @ case 1
	.4byte _08026EAC @ case 2
	.4byte _08026EC4 @ case 3
	.4byte _08026ED0 @ case 4
	.4byte _08026EE4 @ case 5
	.4byte _08026EF0 @ case 6
	.4byte _08026F08 @ case 7
_08026E88:
	ldr r0, _08026E9C
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x68
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x74
	b _08026FE6
	.align 2, 0
_08026E9C: .4byte 0x0202294C
_08026EA0:
	ldr r0, _08026EA8
	ldr r1, [r0]
	adds r1, #0x74
	b _08026FE6
	.align 2, 0
_08026EA8: .4byte 0x0202294C
_08026EAC:
	ldr r0, _08026EC0
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x74
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x50
	b _08026FE6
	.align 2, 0
_08026EC0: .4byte 0x0202294C
_08026EC4:
	ldr r0, _08026ECC
	ldr r1, [r0]
	adds r1, #0x50
	b _08026FE6
	.align 2, 0
_08026ECC: .4byte 0x0202294C
_08026ED0:
	ldr r0, _08026EE0
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x50
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _08026FE4
	.align 2, 0
_08026EE0: .4byte 0x0202294C
_08026EE4:
	ldr r0, _08026EEC
	ldr r1, [r0]
	b _08026FE4
	.align 2, 0
_08026EEC: .4byte 0x0202294C
_08026EF0:
	ldr r0, _08026F04
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x5c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x68
	b _08026FE6
	.align 2, 0
_08026F04: .4byte 0x0202294C
_08026F08:
	ldr r0, _08026F10
	ldr r1, [r0]
	adds r1, #0x68
	b _08026FE6
	.align 2, 0
_08026F10: .4byte 0x0202294C
_08026F14:
	subs r0, r4, #2
	cmp r0, #5
	bhi _08026FEC
	lsls r0, r0, #2
	ldr r1, _08026F24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026F24: .4byte 0x08026F28
_08026F28: @ jump table
	.4byte _08026F40 @ case 0
	.4byte _08026F58 @ case 1
	.4byte _08026F64 @ case 2
	.4byte _08026F7C @ case 3
	.4byte _08026F88 @ case 4
	.4byte _08026F9C @ case 5
_08026F40:
	ldr r0, _08026F54
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x5c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x68
	b _08026FE6
	.align 2, 0
_08026F54: .4byte 0x0202294C
_08026F58:
	ldr r0, _08026F60
	ldr r1, [r0]
	adds r1, #0x68
	b _08026FE6
	.align 2, 0
_08026F60: .4byte 0x0202294C
_08026F64:
	ldr r0, _08026F78
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x68
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, #0x50
	b _08026FE6
	.align 2, 0
_08026F78: .4byte 0x0202294C
_08026F7C:
	ldr r0, _08026F84
	ldr r1, [r0]
	adds r1, #0x50
	b _08026FE6
	.align 2, 0
_08026F84: .4byte 0x0202294C
_08026F88:
	ldr r0, _08026F98
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x50
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _08026FE4
	.align 2, 0
_08026F98: .4byte 0x0202294C
_08026F9C:
	ldr r0, _08026FA4
	ldr r1, [r0]
	b _08026FE4
	.align 2, 0
_08026FA4: .4byte 0x0202294C
_08026FA8:
	cmp r4, #4
	beq _08026FCE
	cmp r4, #4
	bgt _08026FB6
	cmp r4, #3
	beq _08026FC0
	b _08026FEC
_08026FB6:
	cmp r4, #5
	beq _08026FD4
	cmp r4, #6
	beq _08026FE2
	b _08026FEC
_08026FC0:
	ldr r1, [r6]
	adds r2, r1, #0
	adds r2, #0x50
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _08026FE4
_08026FCE:
	ldr r1, [r6]
	adds r1, #0x50
	b _08026FE6
_08026FD4:
	ldr r1, [r6]
	adds r2, r1, #0
	adds r2, #0x50
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _08026FE4
_08026FE2:
	ldr r1, [r6]
_08026FE4:
	adds r1, #0x5c
_08026FE6:
	ldrh r0, [r1]
	adds r0, #1
_08026FEA:
	strh r0, [r1]
_08026FEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08026CDC

	thumb_func_start sub_08026FF4
sub_08026FF4: @ 0x08026FF4
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r4, _08027038
	ldr r3, [r4]
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #5
	bne _0802705E
	cmp r1, #1
	bne _08027040
	movs r5, #0x89
	lsls r5, r5, #1
	adds r1, r3, r5
	ldrh r0, [r1]
	adds r2, r0, #1
	strh r2, [r1]
	movs r0, #0x8a
	lsls r0, r0, #1
	adds r1, r3, r0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r1]
	cmp r0, r3
	bls _08027028
	strh r2, [r1]
_08027028:
	ldr r0, [r4]
	adds r2, r0, r5
	ldrh r0, [r2]
	ldr r1, _0802703C
	cmp r0, r1
	bls _0802705E
	strh r1, [r2]
	b _0802705E
	.align 2, 0
_08027038: .4byte 0x0202294C
_0802703C: .4byte 0x0000270F
_08027040:
	movs r2, #0x89
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r5, #0x8a
	lsls r5, r5, #1
	adds r1, r3, r5
	ldrh r0, [r0]
	ldrh r3, [r1]
	cmp r0, r3
	bls _08027056
	strh r0, [r1]
_08027056:
	ldr r0, [r4]
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0]
_0802705E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08026FF4

	thumb_func_start sub_08027064
sub_08027064: @ 0x08027064
	push {r4, r5, lr}
	movs r3, #0
	ldr r2, _080270A4
	ldr r0, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0802709C
	adds r5, r2, #0
	movs r4, #0x8a
	lsls r4, r4, #1
_0802707A:
	ldr r2, [r5]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x54
	adds r1, r1, r0
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #0x24
	ldrb r2, [r2]
	cmp r3, r2
	blo _0802707A
_0802709C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080270A4: .4byte 0x0202294C
	thumb_func_end sub_08027064

	thumb_func_start sub_080270A8
sub_080270A8: @ 0x080270A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r5, #0
	ldr r7, _08027198
	movs r4, #0
	ldr r0, _0802719C
	mov sl, r0
_080270BC:
	movs r2, #0
	lsls r6, r5, #4
	lsls r1, r5, #1
	mov r8, r1
	lsls r0, r5, #3
	mov ip, r0
	adds r1, r5, #1
	mov sb, r1
	subs r0, r6, r5
	lsls r3, r0, #2
_080270D0:
	ldr r0, [r7]
	adds r1, r2, r3
	add r0, sl
	adds r0, r0, r1
	strb r4, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xa
	bls _080270D0
	ldr r0, [r7]
	subs r1, r6, r5
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r2, _080271A0
	adds r0, r0, r2
	strb r4, [r0]
	ldr r0, [r7]
	adds r0, r0, r1
	ldr r1, _080271A4
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, [r7]
	adds r0, #0x90
	adds r0, r0, r5
	strb r4, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x86
	add r0, r8
	strh r4, [r0]
	add r1, ip
	ldr r2, _080271A8
	adds r1, r1, r2
	strb r4, [r1]
	ldr r2, [r7]
	ldr r1, _080271AC
	adds r0, r2, r1
	add r0, ip
	str r4, [r0]
	mov r0, r8
	adds r1, r0, r5
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x4a
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #0
	adds r0, #0x4c
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #0
	adds r0, #0x4e
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #0
	adds r0, #0x50
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #0
	adds r0, #0x52
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #0
	adds r0, #0x54
	adds r0, r0, r1
	strh r4, [r0]
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080270BC
	ldr r2, _08027198
	ldr r0, [r2]
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r2, #0
	strb r2, [r0]
	ldr r1, _08027198
	ldr r0, [r1]
	movs r1, #0x89
	lsls r1, r1, #1
	adds r3, r0, r1
	movs r1, #0
	strh r2, [r3]
	adds r0, #0x40
	strb r1, [r0]
	bl sub_08026848
	bl sub_08026748
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027198: .4byte 0x0202294C
_0802719C: .4byte 0x000031BF
_080271A0: .4byte 0x000031CC
_080271A4: .4byte 0x000031D0
_080271A8: .4byte 0x00003308
_080271AC: .4byte 0x0000330C
	thumb_func_end sub_080270A8

	thumb_func_start sub_080271B0
sub_080271B0: @ 0x080271B0
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _080271C8
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #4
	beq _080271CC
	cmp r0, #5
	beq _080271D0
	b _080271D2
	.align 2, 0
_080271C8: .4byte 0x0202294C
_080271CC:
	movs r4, #1
	b _080271D2
_080271D0:
	movs r4, #2
_080271D2:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	lsls r1, r4, #2
	ldr r5, _08027214
	ldr r2, _08027218
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r2, [r0]
_080271F6:
	ldr r1, [r5]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, #0x52
	adds r1, r1, r0
	strh r2, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #4
	bls _080271F6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027214: .4byte 0x0202294C
_08027218: .4byte 0x082CB330
	thumb_func_end sub_080271B0

	thumb_func_start sub_0802721C
sub_0802721C: @ 0x0802721C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08027254
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r3, [r0]
	adds r0, r2, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, #0x4e
	adds r2, r2, r1
	adds r3, r3, r0
	ldrh r2, [r2]
	adds r0, r3, r2
	ldr r1, _08027258
	cmp r0, r1
	bls _0802724E
	adds r0, r1, #0
_0802724E:
	pop {r1}
	bx r1
	.align 2, 0
_08027254: .4byte 0x0202294C
_08027258: .4byte 0x0000270F
	thumb_func_end sub_0802721C

	thumb_func_start sub_0802725C
sub_0802725C: @ 0x0802725C
	push {r4, r5, r6, lr}
	ldr r5, _080272C4
	ldr r0, [r5]
	adds r0, #0x28
	ldrb r0, [r0]
	bl sub_0802721C
	ldr r1, _080272C8
	bl Min
	adds r4, r0, #0
	ldr r0, [r5]
	adds r0, #0x28
	ldrb r0, [r0]
	bl sub_08027480
	ldr r1, _080272CC
	bl Min
	adds r2, r0, #0
	ldr r3, _080272D0
	ldr r0, [r3]
	movs r6, #0x83
	lsls r6, r6, #2
	adds r1, r0, r6
	ldr r0, [r1]
	cmp r0, r2
	bhs _08027296
	str r2, [r1]
_08027296:
	ldr r0, [r3]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, r4
	bhs _080272A6
	strh r4, [r1]
_080272A6:
	ldr r0, [r3]
	ldr r6, _080272D4
	adds r2, r0, r6
	ldr r0, [r5]
	movs r1, #0x8a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	cmp r0, r1
	bhs _080272BE
	strh r1, [r2]
_080272BE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080272C4: .4byte 0x0202294C
_080272C8: .4byte 0x0000270F
_080272CC: .4byte 0x000F4236
_080272D0: .4byte 0x03005AF0
_080272D4: .4byte 0x00000212
	thumb_func_end sub_0802725C

	thumb_func_start sub_080272D8
sub_080272D8: @ 0x080272D8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08027310
	ldr r0, [r1]
	adds r0, #0x9b
	ldrb r6, [r0]
	movs r3, #3
	adds r5, r1, #0
	adds r4, r5, #0
_080272EC:
	ldr r0, [r4]
	adds r0, #0x98
	adds r2, r0, r3
	subs r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0
	bne _080272EC
	ldr r0, [r5]
	adds r0, #0x98
	strb r7, [r0]
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08027310: .4byte 0x0202294C
	thumb_func_end sub_080272D8

	thumb_func_start sub_08027314
sub_08027314: @ 0x08027314
	push {r4, lr}
	ldr r4, _08027348
	ldr r3, [r4]
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r1, [r0]
	adds r0, #0x88
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, #0
	bne _080273BC
	ldr r0, _0802734C
	ldrh r2, [r0, #0x2e]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08027354
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	ldr r1, _08027350
	adds r0, r0, r1
	movs r1, #2
	b _0802738A
	.align 2, 0
_08027348: .4byte 0x0202294C
_0802734C: .4byte 0x03002360
_08027350: .4byte 0x000031CC
_08027354:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08027370
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	ldr r1, _0802736C
	adds r0, r0, r1
	movs r1, #3
	b _0802738A
	.align 2, 0
_0802736C: .4byte 0x000031CC
_08027370:
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080273A8
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	ldr r1, _080273A4
	adds r0, r0, r1
	movs r1, #1
_0802738A:
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x28
	adds r0, #0xb0
	ldrb r1, [r1]
	adds r0, r0, r1
	movs r1, #6
	strb r1, [r0]
	movs r0, #0xd4
	bl PlaySE
	b _080273C0
	.align 2, 0
_080273A4: .4byte 0x000031CC
_080273A8:
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	ldr r1, _080273B8
	adds r0, r0, r1
	strb r2, [r0]
	b _080273C0
	.align 2, 0
_080273B8: .4byte 0x000031CC
_080273BC:
	subs r0, #1
	strb r0, [r2]
_080273C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08027314

	thumb_func_start sub_080273C8
sub_080273C8: @ 0x080273C8
	ldr r0, _080273E4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r2, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080273E8
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080273E4: .4byte 0x0202294C
_080273E8: .4byte 0x000031CC
	thumb_func_end sub_080273C8

	thumb_func_start sub_080273EC
sub_080273EC: @ 0x080273EC
	ldr r0, _0802740C
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #0x52
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #0x85
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0802740C: .4byte 0x0202294C
	thumb_func_end sub_080273EC

	thumb_func_start sub_08027410
sub_08027410: @ 0x08027410
	ldr r0, _0802741C
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0802741C: .4byte 0x0202294C
	thumb_func_end sub_08027410

	thumb_func_start sub_08027420
sub_08027420: @ 0x08027420
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08027440
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802744C
	ldr r0, _08027444
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _08027448
	adds r1, r1, r2
	ldr r0, [r0]
	b _08027454
	.align 2, 0
_08027440: .4byte 0x030031C4
_08027444: .4byte 0x0202294C
_08027448: .4byte 0x000031A0
_0802744C:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _0802745C
_08027454:
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_0802745C: .4byte 0x020226A8
	thumb_func_end sub_08027420

	thumb_func_start sub_08027460
sub_08027460: @ 0x08027460
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _0802747C
	ldr r3, [r2]
	lsrs r1, r1, #0x17
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r1, r1, r2
	adds r3, #0x4a
	adds r3, r3, r1
	ldrh r0, [r3]
	bx lr
	.align 2, 0
_0802747C: .4byte 0x0202294C
	thumb_func_end sub_08027460

	thumb_func_start sub_08027480
sub_08027480: @ 0x08027480
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r5, #0
	movs r3, #0
	ldr r0, _080274EC
	mov sb, r0
	ldr r2, _080274F0
	mov sl, r2
	ldr r2, [r0]
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #2
	str r0, [sp]
	adds r6, r2, #0
	adds r6, #0x4a
	mov ip, r1
	mov r8, sl
_080274AE:
	lsls r1, r3, #1
	ldr r7, [sp]
	adds r0, r1, r7
	adds r0, r6, r0
	ldrh r2, [r0]
	add r1, r8
	movs r7, #0
	ldrsh r0, [r1, r7]
	muls r0, r2, r0
	adds r5, r5, r0
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _080274AE
	mov r0, sb
	ldr r1, [r0]
	mov r2, ip
	adds r0, r2, r4
	lsls r0, r0, #2
	adds r1, #0x50
	adds r1, r1, r0
	ldrh r1, [r1]
	mov r3, sl
	movs r7, #6
	ldrsh r0, [r3, r7]
	muls r0, r1, r0
	cmp r5, r0
	bls _080274F4
	subs r0, r5, r0
	b _080274F6
	.align 2, 0
_080274EC: .4byte 0x0202294C
_080274F0: .4byte 0x082CB3B0
_080274F4:
	movs r0, #0
_080274F6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08027480

	thumb_func_start sub_08027508
sub_08027508: @ 0x08027508
	push {r4, r5, r6, lr}
	ldr r0, _08027544
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r6, [r0]
	movs r0, #0
	bl sub_08027480
	adds r5, r0, #0
	movs r4, #1
	cmp r4, r6
	bhs _08027536
_08027520:
	adds r0, r4, #0
	bl sub_08027480
	cmp r0, r5
	bls _0802752C
	adds r5, r0, #0
_0802752C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _08027520
_08027536:
	ldr r1, _08027548
	adds r0, r5, #0
	bl Min
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027544: .4byte 0x0202294C
_08027548: .4byte 0x000F4236
	thumb_func_end sub_08027508

	thumb_func_start sub_0802754C
sub_0802754C: @ 0x0802754C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	ldr r1, _0802758C
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r5, [r1]
	lsrs r4, r0, #0x17
	adds r2, #0x4a
	adds r0, r2, r4
	ldrh r3, [r0]
	movs r1, #0
	cmp r1, r5
	bhs _08027584
_08027568:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, r3
	bls _0802757A
	adds r3, r0, #0
_0802757A:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r5
	blo _08027568
_08027584:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802758C: .4byte 0x0202294C
	thumb_func_end sub_0802754C

	thumb_func_start sub_08027590
sub_08027590: @ 0x08027590
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #1
	ldr r0, _08027608
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r5, [r0]
	movs r4, #0
	cmp r4, r5
	bhs _080275BE
_080275A8:
	adds r0, r4, #0
	bl sub_08027480
	lsls r1, r4, #2
	add r1, sp
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _080275A8
_080275BE:
	lsls r7, r7, #2
	mov ip, r7
	cmp r6, #0
	beq _080275F8
	subs r7, r5, #1
_080275C8:
	movs r6, #0
	movs r4, #0
	cmp r6, r7
	bge _080275F4
	adds r5, r7, #0
_080275D2:
	lsls r0, r4, #2
	mov r2, sp
	adds r1, r2, r0
	adds r4, #1
	lsls r0, r4, #2
	adds r3, r2, r0
	ldr r0, [r1]
	ldr r2, [r3]
	cmp r0, r2
	bhs _080275EC
	str r2, [r1]
	str r0, [r3]
	movs r6, #1
_080275EC:
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blt _080275D2
_080275F4:
	cmp r6, #0
	bne _080275C8
_080275F8:
	mov r0, sp
	add r0, ip
	ldr r0, [r0]
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08027608: .4byte 0x0202294C
	thumb_func_end sub_08027590

	thumb_func_start sub_0802760C
sub_0802760C: @ 0x0802760C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	mov r8, r0
	mov sb, r0
	ldr r6, _080276EC
	ldr r0, [r6]
	adds r0, #0x24
	ldrb r5, [r0]
	bl sub_08027508
	bl sub_08027508
	cmp r0, #0
	bne _08027660
	movs r4, #0
	cmp sb, r5
	bhs _08027660
	adds r2, r6, #0
	ldr r1, _080276F0
	mov ip, r1
	movs r7, #0
	movs r6, #4
	ldr r3, _080276F4
_08027644:
	ldr r0, [r2]
	lsls r1, r4, #3
	adds r0, r0, r1
	add r0, ip
	strb r6, [r0]
	ldr r0, [r2]
	adds r0, r0, r3
	adds r0, r0, r1
	str r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08027644
_08027660:
	movs r4, #0
	cmp r4, r5
	bhs _0802768A
_08027666:
	adds r0, r4, #0
	bl sub_08027480
	ldr r1, _080276F8
	bl Min
	ldr r1, _080276EC
	ldr r1, [r1]
	lsls r2, r4, #3
	ldr r3, _080276F4
	adds r1, r1, r3
	adds r1, r1, r2
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08027666
_0802768A:
	mov r0, sl
	bl sub_08027590
	adds r6, r0, #0
	mov r3, r8
	movs r4, #0
	cmp r4, r5
	bhs _080276D6
	ldr r7, _080276EC
	mov sl, r7
_0802769E:
	mov r0, sl
	ldr r2, [r0]
	lsls r1, r4, #3
	ldr r7, _080276F4
	adds r0, r2, r7
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r6, r0
	bne _080276CC
	adds r0, r2, r1
	ldr r1, _080276F0
	adds r0, r0, r1
	strb r3, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_080276CC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _0802769E
_080276D6:
	mov sl, r8
	cmp sb, r5
	blo _0802768A
	movs r0, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080276EC: .4byte 0x0202294C
_080276F0: .4byte 0x00003308
_080276F4: .4byte 0x0000330C
_080276F8: .4byte 0x000F4236
	thumb_func_end sub_0802760C

	thumb_func_start sub_080276FC
sub_080276FC: @ 0x080276FC
	lsls r1, r1, #0x18
	ldr r2, _08027714
	ldr r2, [r2]
	lsrs r1, r1, #0x15
	ldr r3, _08027718
	adds r2, r2, r3
	adds r2, r2, r1
	ldr r1, [r2]
	ldr r2, [r2, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_08027714: .4byte 0x0202294C
_08027718: .4byte 0x00003308
	thumb_func_end sub_080276FC

	thumb_func_start sub_0802771C
sub_0802771C: @ 0x0802771C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r7, #0
	ldr r0, _08027784
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r5, [r0]
	mov r0, sp
	movs r1, #0
	movs r2, #0x14
	bl memset
	movs r4, #0
	cmp r7, r5
	bhs _08027754
_0802773E:
	adds r0, r4, #0
	bl sub_08027480
	lsls r1, r4, #2
	add r1, sp
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _0802773E
_08027754:
	lsls r0, r6, #2
	add r0, sp
	ldr r1, [r0]
	movs r4, #0
_0802775C:
	cmp r4, r6
	beq _08027770
	lsls r0, r4, #2
	add r0, sp
	ldr r0, [r0]
	cmp r1, r0
	bhs _08027770
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08027770:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0802775C
	adds r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08027784: .4byte 0x0202294C
	thumb_func_end sub_0802771C

	thumb_func_start sub_08027788
sub_08027788: @ 0x08027788
	push {r4, r5, r6, lr}
	ldr r0, _080277B0
	ldr r0, [r0]
	adds r0, #0x28
	ldrb r4, [r0]
	bl sub_080273EC
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, r5, #0
	adds r0, r4, #0
	bl sub_08027480
	adds r4, r0, #0
	bl sub_08027508
	cmp r4, r0
	beq _080277B4
	movs r0, #3
	b _080277E2
	.align 2, 0
_080277B0: .4byte 0x0202294C
_080277B4:
	adds r0, r5, #0
	movs r1, #1
	bl CheckBagHasSpace
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080277C6
	movs r0, #2
	b _080277E2
_080277C6:
	adds r0, r6, #0
	movs r1, #1
	bl AddBagItem
	adds r0, r6, #0
	movs r1, #1
	bl CheckBagHasSpace
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080277E0
	movs r0, #0
	b _080277E2
_080277E0:
	movs r0, #1
_080277E2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08027788

	thumb_func_start IncrementWithLimit
IncrementWithLimit: @ 0x080277E8
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	cmp r2, r0
	bhs _080277F4
	adds r0, r2, #1
_080277F4:
	pop {r1}
	bx r1
	thumb_func_end IncrementWithLimit

	thumb_func_start Min
Min: @ 0x080277F8
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	cmp r2, r0
	bhs _08027804
	adds r0, r2, #0
_08027804:
	pop {r1}
	bx r1
	thumb_func_end Min

	thumb_func_start sub_08027808
sub_08027808: @ 0x08027808
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08027818
	ldr r1, [r1]
	adds r1, #0x34
	adds r1, r1, r0
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08027818: .4byte 0x0202294C
	thumb_func_end sub_08027808

	thumb_func_start sub_0802781C
sub_0802781C: @ 0x0802781C
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _0802784C
_08027822:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08027850
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _08027854
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	cmp r0, #0x55
	bne _08027854
	movs r0, #1
	strh r0, [r6]
	b _08027860
	.align 2, 0
_0802784C: .4byte 0x02037290
_08027850: .4byte 0x02024190
_08027854:
	adds r5, #1
	cmp r5, #5
	ble _08027822
	ldr r1, _08027868
	movs r0, #0
	strh r0, [r1]
_08027860:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027868: .4byte 0x02037290
	thumb_func_end sub_0802781C

	thumb_func_start sub_0802786C
sub_0802786C: @ 0x0802786C
	push {r4, lr}
	ldr r4, _08027888
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
_08027888: .4byte 0x0802788D
	thumb_func_end sub_0802786C

	thumb_func_start sub_0802788C
sub_0802788C: @ 0x0802788C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _080278B0
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080278D8
	cmp r0, #1
	bgt _080278B4
	cmp r0, #0
	beq _080278BE
	b _08027926
	.align 2, 0
_080278B0: .4byte 0x03005B68
_080278B4:
	cmp r0, #2
	beq _080278E4
	cmp r0, #3
	beq _0802790C
	b _08027926
_080278BE:
	ldr r0, _080278D4
	bl AddWindow
	strh r0, [r4, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0802792C
	ldrb r0, [r4, #2]
	movs r1, #3
	b _080278FA
	.align 2, 0
_080278D4: .4byte 0x082CB3B8
_080278D8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08027926
	b _080278FE
_080278E4:
	ldr r0, _08027908
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08027926
	ldrb r0, [r4, #2]
	bl rbox_fill_rectangle
	ldrb r0, [r4, #2]
	movs r1, #1
_080278FA:
	bl CopyWindowToVram
_080278FE:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _08027926
	.align 2, 0
_08027908: .4byte 0x03002360
_0802790C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08027926
	ldrb r0, [r4, #2]
	bl RemoveWindow
	adds r0, r5, #0
	bl DestroyTask
	bl EnableBothScriptContexts
_08027926:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0802788C

	thumb_func_start sub_0802792C
sub_0802792C: @ 0x0802792C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08027A28
	ldr r1, [r0]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	subs r2, #4
	adds r0, r1, r2
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldr r0, _08027A2C
	adds r1, r1, r0
	ldrh r0, [r1]
	str r0, [sp, #0x14]
	ldr r4, _08027A30
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx_
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0xd
	bl DrawTextBorderOuter
	adds r0, r7, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _08027A34
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r6, #0
	ldr r2, _08027A38
	mov r8, r2
	movs r0, #0xff
	mov sl, r0
	mov sb, r6
	mov r2, sp
	adds r2, #0xc
	str r2, [sp, #0x18]
_080279A2:
	lsls r4, r6, #2
	ldr r0, [sp, #0x18]
	ldm r0!, {r1}
	str r0, [sp, #0x18]
	ldr r0, _08027A3C
	adds r0, r6, r0
	ldrb r3, [r0]
	mov r0, r8
	movs r2, #0
	bl ConvertIntToDecimalStringN
	movs r0, #1
	mov r1, r8
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	adds r5, r0, #0
	ldr r0, _08027A40
	adds r4, r4, r0
	ldr r2, [r4]
	ldr r0, _08027A44
	lsls r4, r6, #1
	adds r0, r4, r0
	ldrb r0, [r0]
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r3, #0xa0
	subs r3, r3, r5
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _08027A48
	adds r4, r4, r0
	ldrb r0, [r4]
	str r0, [sp]
	mov r2, sl
	str r2, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	mov r2, r8
	bl AddTextPrinterParameterized
	adds r6, #1
	cmp r6, #2
	ble _080279A2
	adds r0, r7, #0
	bl PutWindowTilemap
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027A28: .4byte 0x03005AF0
_08027A2C: .4byte 0x00000212
_08027A30: .4byte 0x0000021D
_08027A34: .4byte 0x085CCCF5
_08027A38: .4byte 0x02021C40
_08027A3C: .4byte 0x082CB3CC
_08027A40: .4byte 0x082CB3C0
_08027A44: .4byte 0x082CB3D0
_08027A48: .4byte 0x082CB3D6
	thumb_func_end sub_0802792C

	thumb_func_start sub_08027A4C
sub_08027A4C: @ 0x08027A4C
	push {lr}
	bl GetLinkPlayerCount
	ldr r1, _08027A60
	ldr r1, [r1]
	adds r1, #0x24
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08027A60: .4byte 0x0202294C
	thumb_func_end sub_08027A4C

	thumb_func_start sub_08027A64
sub_08027A64: @ 0x08027A64
	push {r4, r5, r6, r7, lr}
	ldr r0, _08027AEC
	ldr r0, [r0]
	adds r0, #0x24
	ldrb r4, [r0]
	cmp r4, #4
	bhi _08027A92
	ldr r5, _08027AF0
_08027A74:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _08027AF4
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r1, r1, r5
	ldr r1, [r1]
	bl StringCopy
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _08027A74
_08027A92:
	ldr r0, _08027AEC
	ldr r1, [r0]
	adds r1, #0x24
	movs r2, #5
	strb r2, [r1]
	movs r1, #0
	mov ip, r0
_08027AA0:
	movs r4, #0
	mov r2, ip
	ldr r0, [r2]
	adds r0, #0x24
	adds r5, r1, #1
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08027ADE
	ldr r7, _08027AEC
	lsls r3, r1, #1
	ldr r6, _08027AF8
_08027AB6:
	ldr r2, [r7]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r1, r2, #0
	adds r1, #0x4a
	adds r1, r1, r0
	lsls r0, r4, #3
	adds r0, r3, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r2, #0x24
	ldrb r2, [r2]
	cmp r4, r2
	blo _08027AB6
_08027ADE:
	lsls r0, r5, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _08027AA0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027AEC: .4byte 0x0202294C
_08027AF0: .4byte 0x082CB41C
_08027AF4: .4byte 0x020226A8
_08027AF8: .4byte 0x082CB3DC
	thumb_func_end sub_08027A64

	thumb_func_start sub_08027AFC
sub_08027AFC: @ 0x08027AFC
	push {lr}
	sub sp, #8
	ldr r3, _08027B24
	ldr r1, [sp]
	ands r1, r3
	movs r2, #1
	orrs r1, r2
	str r1, [sp]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #4]
	ands r1, r3
	orrs r1, r0
	str r1, [sp, #4]
	mov r0, sp
	bl sub_0800F934
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08027B24: .4byte 0xFFFFFF00
	thumb_func_end sub_08027AFC

	thumb_func_start sub_08027B28
sub_08027B28: @ 0x08027B28
	push {lr}
	adds r2, r0, #0
	ldr r3, _08027B50
	ldrh r0, [r3]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0xbc
	lsls r0, r0, #6
	cmp r1, r0
	bne _08027B4A
	lsls r0, r2, #4
	adds r1, r3, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #1
	beq _08027B54
_08027B4A:
	movs r0, #0
	b _08027B56
	.align 2, 0
_08027B50: .4byte 0x03003130
_08027B54:
	ldrb r0, [r1, #4]
_08027B56:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08027B28

	thumb_func_start sub_08027B5C
sub_08027B5C: @ 0x08027B5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r4, [sp, #0x48]
	lsls r4, r4, #0x18
	str r4, [sp, #0x1c]
	movs r4, #0x14
	adds r4, r4, r0
	mov sb, r4
	mov r5, sp
	movs r4, #2
	strb r4, [r5]
	mov sl, sp
	mov r5, sb
	ldrb r4, [r5, #0xb]
	movs r7, #0xf
	adds r5, r7, #0
	ands r5, r4
	mov r6, sl
	ldrb r6, [r6, #1]
	mov r8, r6
	movs r4, #0x10
	rsbs r4, r4, #0
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, sl
	strb r4, [r5, #1]
	mov r8, sp
	mov r6, sb
	ldrb r5, [r6, #0xc]
	lsls r5, r5, #4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, #1]
	ldrb r5, [r6, #0xd]
	movs r6, #0xf
	ands r5, r6
	mov r4, sl
	ldrb r4, [r4, #2]
	mov r8, r4
	movs r4, #0x10
	rsbs r4, r4, #0
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, sl
	strb r4, [r5, #2]
	mov r8, sp
	mov r6, sb
	ldrb r5, [r6, #0xe]
	lsls r5, r5, #4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, #2]
	ldrb r5, [r6, #0xf]
	movs r6, #0xf
	ands r5, r6
	mov r4, sl
	ldrb r4, [r4, #3]
	mov r8, r4
	movs r4, #0x10
	rsbs r4, r4, #0
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, sl
	strb r4, [r5, #3]
	mov r8, sp
	mov r6, sb
	ldrb r5, [r6, #0x10]
	lsls r5, r5, #4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, #3]
	ldrb r5, [r6, #0x11]
	movs r6, #0xf
	ands r5, r6
	mov r4, sl
	ldrb r4, [r4, #4]
	mov r8, r4
	movs r4, #0x10
	rsbs r4, r4, #0
	mov r6, r8
	ands r4, r6
	orrs r4, r5
	mov r5, sl
	strb r4, [r5, #4]
	mov r8, sp
	mov r6, sb
	ldrb r5, [r6, #0x12]
	lsls r5, r5, #4
	ands r4, r7
	orrs r4, r5
	mov r5, r8
	strb r4, [r5, #4]
	ldrb r4, [r6, #0x13]
	movs r6, #0xf
	ands r4, r6
	mov r6, r8
	ldrb r5, [r6, #5]
	movs r6, #0x10
	rsbs r6, r6, #0
	ands r6, r5
	orrs r6, r4
	str r6, [sp, #0xc]
	mov r4, r8
	strb r6, [r4, #5]
	mov r5, sp
	mov r6, sb
	ldrb r4, [r6, #0x14]
	lsls r4, r4, #4
	ldr r6, [sp, #0xc]
	ands r6, r7
	orrs r6, r4
	strb r6, [r5, #5]
	mov r7, sp
	movs r4, #3
	mov r8, r4
	ldrb r0, [r0, #0x14]
	mov r5, r8
	ands r0, r5
	ldrb r5, [r7, #6]
	movs r6, #4
	rsbs r6, r6, #0
	mov sl, r6
	mov r4, sl
	ands r4, r5
	orrs r4, r0
	strb r4, [r7, #6]
	mov r5, sb
	ldrb r0, [r5, #1]
	mov r6, r8
	ands r0, r6
	lsls r0, r0, #2
	movs r5, #0xd
	rsbs r5, r5, #0
	ands r5, r4
	orrs r5, r0
	strb r5, [r7, #6]
	mov r0, sb
	ldrb r4, [r0, #2]
	ands r4, r6
	lsls r4, r4, #4
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r5
	orrs r0, r4
	strb r0, [r7, #6]
	mov r5, sp
	mov r6, sb
	ldrb r4, [r6, #3]
	lsls r4, r4, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, #6]
	mov r4, sb
	ldrb r0, [r4, #4]
	mov r5, r8
	ands r0, r5
	ldrb r5, [r7, #7]
	mov r4, sl
	ands r4, r5
	orrs r4, r0
	strb r4, [r7, #7]
	mov r6, sb
	ldrb r0, [r6, #5]
	mov r5, r8
	ands r0, r5
	lsls r0, r0, #2
	movs r5, #0xd
	rsbs r5, r5, #0
	ands r5, r4
	orrs r5, r0
	strb r5, [r7, #7]
	ldrb r4, [r6, #6]
	mov r6, r8
	ands r4, r6
	lsls r4, r4, #4
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r5
	orrs r0, r4
	strb r0, [r7, #7]
	mov r5, sp
	mov r6, sb
	ldrb r4, [r6, #7]
	lsls r4, r4, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, #7]
	mov r8, sp
	mov r0, sb
	ldrb r4, [r0, #8]
	movs r7, #3
	adds r0, r7, #0
	ands r0, r4
	mov r4, r8
	ldrb r5, [r4, #8]
	mov r4, sl
	ands r4, r5
	orrs r4, r0
	mov r5, r8
	strb r4, [r5, #8]
	mov r6, sb
	ldrb r5, [r6, #9]
	adds r0, r7, #0
	ands r0, r5
	lsls r0, r0, #2
	movs r5, #0xd
	rsbs r5, r5, #0
	ands r5, r4
	orrs r5, r0
	mov r0, r8
	strb r5, [r0, #8]
	ldrb r0, [r1]
	adds r4, r7, #0
	ands r4, r0
	lsls r4, r4, #4
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r5
	orrs r0, r4
	mov r4, r8
	strb r0, [r4, #8]
	mov r5, sp
	ldrb r4, [r2]
	lsls r4, r4, #6
	movs r6, #0x3f
	ands r0, r6
	orrs r0, r4
	strb r0, [r5, #8]
	ldrb r4, [r3]
	adds r0, r7, #0
	ands r0, r4
	ldrb r4, [r5, #9]
	mov r6, sl
	ands r6, r4
	orrs r6, r0
	mov sl, r6
	strb r6, [r5, #9]
	ldr r0, [sp, #0x40]
	ldrb r4, [r0]
	adds r0, r7, #0
	ands r0, r4
	lsls r0, r0, #2
	movs r4, #0xd
	rsbs r4, r4, #0
	ands r6, r4
	orrs r6, r0
	str r6, [sp, #0x10]
	strb r6, [r5, #9]
	mov r4, sp
	ldr r5, [sp, #0x44]
	ldrb r0, [r5]
	adds r6, r7, #0
	ands r6, r0
	lsls r0, r6, #4
	subs r7, #0x34
	ldr r5, [sp, #0x10]
	ands r7, r5
	orrs r7, r0
	strb r7, [r4, #9]
	mov r5, sp
	ldrb r0, [r1, #4]
	movs r6, #1
	mov ip, r6
	mov r4, ip
	ands r4, r0
	lsls r4, r4, #6
	movs r0, #0x41
	rsbs r0, r0, #0
	mov sl, r0
	ands r0, r7
	orrs r0, r4
	strb r0, [r5, #9]
	ldrb r4, [r2, #4]
	lsls r4, r4, #7
	movs r5, #0x7f
	ands r0, r5
	orrs r0, r4
	mov r4, r8
	strb r0, [r4, #9]
	ldrb r4, [r3, #4]
	mov r0, ip
	ands r0, r4
	mov r5, r8
	ldrb r4, [r5, #0xa]
	movs r7, #2
	rsbs r7, r7, #0
	adds r5, r7, #0
	ands r5, r4
	orrs r5, r0
	mov r6, r8
	strb r5, [r6, #0xa]
	mov sb, sp
	ldr r4, [sp, #0x40]
	ldrb r0, [r4, #4]
	mov r4, ip
	ands r4, r0
	lsls r4, r4, #1
	movs r6, #3
	rsbs r6, r6, #0
	mov r8, r6
	mov r0, r8
	ands r0, r5
	orrs r0, r4
	mov r4, sb
	strb r0, [r4, #0xa]
	ldr r6, [sp, #0x44]
	ldrb r5, [r6, #4]
	mov r4, ip
	ands r4, r5
	lsls r4, r4, #2
	movs r5, #5
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r4
	mov r4, sb
	strb r0, [r4, #0xa]
	mov r4, sp
	ldrb r1, [r1, #8]
	mov r0, ip
	ands r0, r1
	lsls r0, r0, #2
	ldrb r1, [r4, #0xb]
	ands r5, r1
	orrs r5, r0
	strb r5, [r4, #0xb]
	ldrb r1, [r2, #8]
	mov r0, ip
	ands r0, r1
	lsls r0, r0, #3
	movs r1, #9
	rsbs r1, r1, #0
	ands r1, r5
	orrs r1, r0
	strb r1, [r4, #0xb]
	ldrb r2, [r3, #8]
	mov r0, ip
	ands r0, r2
	lsls r0, r0, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, #0xb]
	mov r3, sp
	ldr r5, [sp, #0x40]
	ldrb r0, [r5, #8]
	mov r1, ip
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xb]
	mov r2, sp
	ldrb r1, [r6, #8]
	mov r6, ip
	ands r6, r1
	lsls r1, r6, #6
	mov r3, sl
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0xb]
	ldr r4, [sp, #0x1c]
	lsrs r3, r4, #0x15
	ldrb r1, [r2, #0xa]
	movs r0, #7
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #0xa]
	mov r1, sp
	ldr r5, [sp, #0x4c]
	movs r6, #1
	ands r5, r6
	lsls r2, r5, #1
	ldrb r0, [r1, #0xb]
	mov r3, r8
	ands r3, r0
	orrs r3, r2
	mov r8, r3
	strb r3, [r1, #0xb]
	mov r0, sp
	ldr r4, [sp, #0x50]
	ands r4, r6
	mov r5, r8
	ands r5, r7
	orrs r5, r4
	strb r5, [r0, #0xb]
	bl sub_0800F934
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08027B5C

	thumb_func_start sub_08027E90
sub_08027E90: @ 0x08027E90
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, [sp, #0x1c]
	mov ip, r0
	ldr r1, [sp, #0x20]
	mov r8, r1
	ldr r0, [sp, #0x24]
	mov sb, r0
	adds r2, r7, #0
	adds r2, #0x14
	ldr r4, _08027ECC
	ldrh r0, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0xbc
	lsls r0, r0, #6
	cmp r1, r0
	bne _08027EC8
	adds r3, r4, #2
	ldrb r0, [r4, #2]
	cmp r0, #2
	beq _08027ED0
_08027EC8:
	movs r0, #0
	b _0802800A
	.align 2, 0
_08027ECC: .4byte 0x03003130
_08027ED0:
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r2, #0xb]
	ldrb r0, [r3, #1]
	lsrs r0, r0, #4
	strb r0, [r2, #0xc]
	ldrb r0, [r3, #2]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r2, #0xd]
	ldrb r0, [r3, #2]
	lsrs r0, r0, #4
	strb r0, [r2, #0xe]
	ldrb r0, [r3, #3]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r2, #0xf]
	ldrb r0, [r3, #3]
	lsrs r0, r0, #4
	strb r0, [r2, #0x10]
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r2, #0x11]
	ldrb r0, [r3, #4]
	lsrs r0, r0, #4
	strb r0, [r2, #0x12]
	ldrb r0, [r3, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r2, #0x13]
	ldrb r0, [r3, #5]
	lsrs r0, r0, #4
	strb r0, [r2, #0x14]
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r2, #0x15]
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	strb r0, [r7, #0x14]
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	strb r0, [r2, #1]
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r2, #2]
	ldrb r0, [r3, #6]
	lsrs r0, r0, #6
	strb r0, [r2, #3]
	ldrb r0, [r3, #7]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	strb r0, [r2, #4]
	ldrb r0, [r3, #7]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	strb r0, [r2, #5]
	ldrb r0, [r3, #7]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r2, #6]
	ldrb r0, [r3, #7]
	lsrs r0, r0, #6
	strb r0, [r2, #7]
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	strb r0, [r2, #8]
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	strb r0, [r2, #9]
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	strb r0, [r2, #0xa]
	ldrb r0, [r3, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r5]
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r5, #4]
	ldrb r0, [r3, #0xb]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r5, #8]
	ldrb r0, [r3, #8]
	lsrs r0, r0, #6
	strb r0, [r6]
	ldrb r0, [r3, #9]
	lsrs r0, r0, #7
	strb r0, [r6, #4]
	ldrb r0, [r3, #0xb]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	strb r0, [r6, #8]
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	mov r1, ip
	strb r0, [r1]
	ldrb r0, [r3, #0xa]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r1, #4]
	ldrb r0, [r3, #0xb]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	strb r0, [r1, #8]
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r3, #0xa]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	strb r0, [r1, #4]
	ldrb r0, [r3, #0xb]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	strb r0, [r1, #8]
	ldrb r0, [r3, #9]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r1, sb
	strb r0, [r1]
	ldrb r0, [r3, #0xa]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r1, #4]
	ldrb r0, [r3, #0xb]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r1, #8]
	ldrb r0, [r3, #0xa]
	lsrs r0, r0, #3
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	ldrb r0, [r3, #0xb]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	ldr r1, [sp, #0x2c]
	str r0, [r1]
	ldrb r0, [r3, #0xb]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ldr r1, [sp, #0x30]
	str r0, [r1]
	movs r0, #1
_0802800A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08027E90

	thumb_func_start sub_08028018
sub_08028018: @ 0x08028018
	push {lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08028040
	ldr r1, [sp]
	ands r1, r3
	movs r2, #3
	orrs r1, r2
	str r1, [sp]
	ldr r1, [sp, #4]
	ands r1, r3
	orrs r1, r0
	str r1, [sp, #4]
	mov r0, sp
	bl sub_0800F934
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08028040: .4byte 0xFFFFFF00
	thumb_func_end sub_08028018

	thumb_func_start sub_08028044
sub_08028044: @ 0x08028044
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r3, _0802806C
	ldrh r0, [r3]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0xbc
	lsls r0, r0, #6
	cmp r1, r0
	bne _08028068
	lsls r0, r2, #4
	adds r1, r3, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #3
	beq _08028070
_08028068:
	movs r0, #0
	b _08028076
	.align 2, 0
_0802806C: .4byte 0x03003130
_08028070:
	ldrb r0, [r1, #4]
	strb r0, [r4]
	movs r0, #1
_08028076:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08028044

	thumb_func_start sub_0802807C
sub_0802807C: @ 0x0802807C
	push {lr}
	sub sp, #8
	ldr r2, _0802809C
	ldr r1, [sp]
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, sp
	bl sub_0800F934
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_0802809C: .4byte 0xFFFFFF00
	thumb_func_end sub_0802807C

	thumb_func_start sub_080280A0
sub_080280A0: @ 0x080280A0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080280C8
	ldrh r0, [r3]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	movs r0, #0xbc
	lsls r0, r0, #6
	cmp r1, r0
	bne _080280C2
	lsls r0, r2, #4
	adds r1, r3, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #4
	beq _080280CC
_080280C2:
	movs r0, #0
	b _080280CE
	.align 2, 0
_080280C8: .4byte 0x03003130
_080280CC:
	ldr r0, [r1, #4]
_080280CE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080280A0

	thumb_func_start sub_080280D4
sub_080280D4: @ 0x080280D4
	push {r4, r5, lr}
	sub sp, #0x18
	movs r5, #0xc0
	lsls r5, r5, #6
	adds r0, r5, #0
	bl AllocZeroed
	adds r4, r0, #0
	ldr r0, _08028128
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0802812C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, _08028130
	adds r1, r4, #0
	bl LZ77UnCompWram
	cmp r4, #0
	beq _08028114
	str r4, [sp]
	str r5, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r4, #0
	bl Free
_08028114:
	add r0, sp, #8
	bl LoadSpritePalette
	add r0, sp, #0x10
	bl LoadSpritePalette
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028128: .4byte 0x082CEB64
_0802812C: .4byte 0x082CEB6C
_08028130: .4byte 0x082CD148
	thumb_func_end sub_080280D4

	thumb_func_start sub_08028134
sub_08028134: @ 0x08028134
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x30
	adds r6, r1, #0
	mov r8, r2
	adds r5, r3, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	add r1, sp, #0x18
	movs r3, #0
	strh r3, [r1]
	ldrb r2, [r0]
	mov r0, sp
	adds r0, #0x1a
	strh r2, [r0]
	ldr r0, _080281C0
	str r0, [sp, #0x1c]
	ldr r0, _080281C4
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	ldr r0, _080281C8
	str r0, [sp, #0x28]
	ldr r0, _080281CC
	str r0, [sp, #0x2c]
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	movs r0, #4
	bl AllocZeroed
	ldr r1, _080281D0
	mov r2, r8
	lsls r4, r2, #2
	adds r4, r4, r1
	str r0, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08028C40
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sp
	movs r2, #0x88
	movs r3, #3
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1]
	movs r0, #1
	mov r1, r8
	bl sub_08028380
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080281C0: .4byte 0x082CEA6C
_080281C4: .4byte 0x082CEAB4
_080281C8: .4byte 0x082BF310
_080281CC: .4byte 0x080281D5
_080281D0: .4byte 0x02022950
	thumb_func_end sub_08028134

	thumb_func_start sub_080281D4
sub_080281D4: @ 0x080281D4
	push {lr}
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	cmp r1, #1
	beq _080281E8
	cmp r1, #1
	ble _080281F2
	cmp r1, #2
	beq _080281EE
	b _080281F2
_080281E8:
	bl sub_08028268
	b _080281F2
_080281EE:
	bl sub_080282D8
_080281F2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080281D4

	thumb_func_start sub_080281F8
sub_080281F8: @ 0x080281F8
	push {lr}
	bl GetMultiplayerId
	ldr r1, _08028228
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802822C
	adds r0, r0, r1
	movs r2, #0
	movs r1, #1
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r2, [r0, #0x36]
	pop {r0}
	bx r0
	.align 2, 0
_08028228: .4byte 0x02022950
_0802822C: .4byte 0x020205AC
	thumb_func_end sub_080281F8

	thumb_func_start sub_08028230
sub_08028230: @ 0x08028230
	push {lr}
	bl GetMultiplayerId
	ldr r1, _08028260
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08028264
	adds r0, r0, r1
	movs r2, #0
	movs r1, #2
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r2, [r0, #0x36]
	pop {r0}
	bx r0
	.align 2, 0
_08028260: .4byte 0x02022950
_08028264: .4byte 0x020205AC
	thumb_func_end sub_08028230

	thumb_func_start sub_08028268
sub_08028268: @ 0x08028268
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r0, r2, r0
	asrs r1, r0, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _08028284
	adds r0, r1, #3
_08028284:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r2, #2
	ble _080282CE
	cmp r0, #2
	bgt _0802829A
	cmp r0, #1
	bge _0802829E
_0802829A:
	movs r0, #1
	b _080282A0
_0802829E:
	movs r0, #0xff
_080282A0:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	ble _080282CE
	movs r0, #0
	strh r0, [r4, #0x2e]
	bl sub_08027410
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_08028C40
	strh r0, [r4, #0x20]
_080282CE:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08028268

	thumb_func_start sub_080282D8
sub_080282D8: @ 0x080282D8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xd
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	cmp r1, #0
	bge _080282F8
	adds r0, r1, #3
_080282F8:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r1, #0xd
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802831C
	cmp r4, #0
	beq _0802831C
	movs r0, #0xd4
	bl PlaySE
_0802831C:
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #0x67
	ble _0802832A
	movs r0, #0
	strh r0, [r5, #0x2e]
	movs r4, #0
_0802832A:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_080283E0
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080282D8

	thumb_func_start sub_08028340
sub_08028340: @ 0x08028340
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _08028372
	ldr r6, _08028378
_0802834E:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802837C
	adds r0, r0, r1
	cmp r0, #0
	beq _08028368
	bl DestroySpriteAndFreeResources
_08028368:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _0802834E
_08028372:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028378: .4byte 0x02022950
_0802837C: .4byte 0x020205AC
	thumb_func_end sub_08028340

	thumb_func_start sub_08028380
sub_08028380: @ 0x08028380
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r3, _080283B0
	ldr r2, _080283B4
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	ldrh r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	adds r2, #0x3e
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	ldrb r3, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_080283B0: .4byte 0x020205AC
_080283B4: .4byte 0x02022950
	thumb_func_end sub_08028380

	thumb_func_start sub_080283B8
sub_080283B8: @ 0x080283B8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _080283DA
_080283C8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08028380
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _080283C8
_080283DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_080283B8

	thumb_func_start sub_080283E0
sub_080283E0: @ 0x080283E0
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08028404
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08028408
	adds r0, r0, r2
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_08028404: .4byte 0x02022950
_08028408: .4byte 0x020205AC
	thumb_func_end sub_080283E0

	thumb_func_start nullsub_15
nullsub_15: @ 0x0802840C
	bx lr
	.align 2, 0
	thumb_func_end nullsub_15

	thumb_func_start sub_08028410
sub_08028410: @ 0x08028410
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r0, _08028458
	mov ip, r0
	movs r6, #0
	ldr r5, _0802845C
_0802841C:
	ldr r3, [r5]
	lsls r1, r4, #1
	adds r0, r3, #0
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	lsls r0, r4, #4
	adds r0, #0x30
	strh r0, [r1, #0x20]
	lsls r2, r4, #3
	movs r7, #8
	rsbs r7, r7, #0
	adds r0, r7, #0
	subs r0, r0, r2
	strh r0, [r1, #0x22]
	adds r3, #0xc
	adds r3, r3, r4
	strb r6, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0802841C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028458: .4byte 0x020205AC
_0802845C: .4byte 0x020229A8
	thumb_func_end sub_08028410

	thumb_func_start sub_08028460
sub_08028460: @ 0x08028460
	push {r4, r5, r6, lr}
	sub sp, #0x28
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r4, #0
	bl AllocZeroed
	adds r6, r0, #0
	ldr r0, _08028500
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	ldr r0, _08028504
	adds r1, r6, #0
	bl LZ77UnCompWram
	cmp r6, #0
	beq _080284F0
	str r6, [sp, #0x18]
	add r5, sp, #0x18
	movs r0, #0x80
	lsls r0, r0, #9
	orrs r0, r4
	str r0, [r5, #4]
	mov r1, sp
	ldr r0, _08028508
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r4, _0802850C
	movs r0, #0x40
	bl AllocZeroed
	str r0, [r4]
	adds r0, r5, #0
	bl LoadSpriteSheet
	add r0, sp, #0x20
	bl LoadSpritePalette
	movs r4, #0
_080284B6:
	lsls r1, r4, #0x14
	movs r0, #0xc0
	lsls r0, r0, #0xe
	adds r1, r1, r0
	asrs r1, r1, #0x10
	lsls r0, r4, #3
	movs r3, #8
	rsbs r3, r3, #0
	adds r2, r3, #0
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sp
	movs r3, #0
	bl CreateSprite
	ldr r1, _0802850C
	ldr r1, [r1]
	lsls r2, r4, #1
	adds r1, #0x2a
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _080284B6
_080284F0:
	adds r0, r6, #0
	bl Free
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028500: .4byte 0x082CEB74
_08028504: .4byte 0x082CCF6C
_08028508: .4byte 0x082CEB7C
_0802850C: .4byte 0x020229A8
	thumb_func_end sub_08028460

	thumb_func_start sub_08028510
sub_08028510: @ 0x08028510
	push {r4, r5, lr}
	movs r4, #0
_08028514:
	ldr r5, _0802854C
	ldr r0, [r5]
	lsls r1, r4, #1
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08028550
	adds r0, r0, r1
	cmp r0, #0
	beq _08028532
	bl DestroySpriteAndFreeResources
_08028532:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _08028514
	ldr r0, [r5]
	bl Free
	movs r0, #0
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802854C: .4byte 0x020229A8
_08028550: .4byte 0x020205AC
	thumb_func_end sub_08028510

	thumb_func_start sub_08028554
sub_08028554: @ 0x08028554
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r3, #0
	movs r6, #0
	ldr r0, _080285E4
	mov sb, r0
_08028566:
	mov r7, sb
	ldr r2, [r7]
	lsls r5, r6, #1
	adds r0, r2, #0
	adds r0, #0x2a
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080285E8
	adds r4, r0, r1
	adds r0, r2, #0
	adds r0, #0x16
	adds r0, r0, r5
	movs r1, #2
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0xc
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, #0
	beq _0802859C
	movs r7, #0x22
	ldrsh r0, [r4, r7]
	cmp r0, #8
	beq _080285D2
_0802859C:
	movs r3, #1
	movs r7, #0x22
	ldrsh r0, [r4, r7]
	cmp r0, #8
	bne _080285C2
	cmp r1, #0
	bne _080285D2
	strb r3, [r2]
	mov r1, sb
	ldr r0, [r1]
	adds r0, #0x16
	adds r0, r0, r5
	ldr r1, _080285EC
	strh r1, [r0]
	movs r0, #0x24
	str r3, [sp]
	bl PlaySE
	ldr r3, [sp]
_080285C2:
	mov r7, sb
	ldr r0, [r7]
	adds r0, #0x16
	adds r0, r0, r5
	ldrh r0, [r0]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
_080285D2:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #9
	bls _08028566
	cmp r3, #0
	bne _080285F0
	movs r0, #1
	b _080285F2
	.align 2, 0
_080285E4: .4byte 0x020229A8
_080285E8: .4byte 0x020205AC
_080285EC: .4byte 0x0000FFF0
_080285F0:
	movs r0, #0
_080285F2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08028554

	thumb_func_start sub_08028600
sub_08028600: @ 0x08028600
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xa
	bls _0802863C
	movs r4, #0
_0802860C:
	ldr r0, _08028634
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08028638
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _0802860C
	b _08028706
	.align 2, 0
_08028634: .4byte 0x020229A8
_08028638: .4byte 0x020205AC
_0802863C:
	movs r4, #0
	movs r0, #0xa
	subs r0, r0, r5
	cmp r4, r0
	bge _08028702
	ldr r6, _0802866C
_08028648:
	cmp r5, #6
	bls _080286B0
	ldr r0, _08028670
	ldr r2, [r0]
	ldr r1, _08028674
	adds r0, r1, #0
	ldrh r1, [r2, #0x3e]
	adds r0, r0, r1
	adds r0, r0, r5
	movs r1, #0
	strh r0, [r2, #0x3e]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bls _08028678
	strh r1, [r2, #0x3e]
	b _080286CA
	.align 2, 0
_0802866C: .4byte 0x020205AC
_08028670: .4byte 0x020229A8
_08028674: .4byte 0x0000FFFA
_08028678:
	cmp r0, #0xa
	bls _08028696
	lsls r1, r4, #1
	adds r0, r2, #0
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #2
	bl StartSpriteAnim
	b _080286CA
_08028696:
	lsls r1, r4, #1
	adds r0, r2, #0
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #0
	bl StartSpriteAnim
	b _080286CA
_080286B0:
	ldr r0, _080286DC
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #0
	bl StartSpriteAnim
_080286CA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0xa
	subs r0, r0, r5
	cmp r4, r0
	blt _08028648
	b _08028702
	.align 2, 0
_080286DC: .4byte 0x020229A8
_080286E0:
	ldr r0, _0802870C
	ldr r0, [r0]
	lsls r1, r4, #1
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08028710
	adds r0, r0, r1
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08028702:
	cmp r4, #9
	bls _080286E0
_08028706:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802870C: .4byte 0x020229A8
_08028710: .4byte 0x020205AC
	thumb_func_end sub_08028600

	thumb_func_start sub_08028714
sub_08028714: @ 0x08028714
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r7, _08028758
	movs r1, #1
	ands r0, r1
	lsls r4, r0, #2
	movs r6, #5
	rsbs r6, r6, #0
	ldr r5, _0802875C
_0802872A:
	ldr r0, [r5]
	lsls r1, r3, #1
	adds r0, #0x2a
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #9
	bls _0802872A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028758: .4byte 0x020205AC
_0802875C: .4byte 0x020229A8
	thumb_func_end sub_08028714

	thumb_func_start sub_08028760
sub_08028760: @ 0x08028760
	push {r4, r5, lr}
	sub sp, #0x10
	movs r5, #0x90
	lsls r5, r5, #3
	adds r0, r5, #0
	bl AllocZeroed
	adds r4, r0, #0
	ldr r0, _080287AC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _080287B0
	adds r1, r4, #0
	bl LZ77UnCompWram
	cmp r4, #0
	beq _08028796
	str r4, [sp]
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r0, r5
	str r0, [sp, #4]
	mov r0, sp
	bl LoadSpriteSheet
_08028796:
	add r0, sp, #8
	bl LoadSpritePalette
	adds r0, r4, #0
	bl Free
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080287AC: .4byte 0x082CEBA0
_080287B0: .4byte 0x082CB73C
	thumb_func_end sub_08028760

	thumb_func_start sub_080287B4
sub_080287B4: @ 0x080287B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x30
	mov r1, sp
	ldr r0, _08028844
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	add r2, sp, #0x18
	adds r1, r2, #0
	ldr r0, _08028848
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	mov sb, r2
_080287DC:
	movs r0, #4
	bl AllocZeroed
	ldr r1, _0802884C
	lsls r4, r5, #2
	adds r4, r4, r1
	str r0, [r4]
	lsls r0, r5, #3
	lsls r1, r5, #4
	adds r1, r1, r0
	mov r0, sp
	movs r2, #8
	movs r3, #1
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08028924
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xa
	bls _080287DC
	movs r5, #0
	ldr r7, _08028850
	ldr r4, _08028854
	mov r8, r4
_0802881C:
	movs r0, #4
	bl AllocZeroed
	lsls r1, r5, #2
	adds r4, r1, r7
	str r0, [r4]
	adds r6, r1, #0
	cmp r5, #3
	bne _08028858
	mov r0, r8
	movs r2, #6
	ldrsh r1, [r0, r2]
	mov r0, sb
	movs r2, #0x39
	movs r3, #0
	bl CreateSprite
	ldr r1, [r7, #0xc]
	b _0802886C
	.align 2, 0
_08028844: .4byte 0x082CEBB0
_08028848: .4byte 0x082CEBC8
_0802884C: .4byte 0x0202296C
_08028850: .4byte 0x02022998
_08028854: .4byte 0x082CEBA8
_08028858:
	lsls r0, r5, #1
	add r0, r8
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r0, sb
	movs r2, #0x3c
	movs r3, #0
	bl CreateSprite
	ldr r1, [r4]
_0802886C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1]
	adds r0, r6, r7
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080288A8
	adds r0, r0, r1
	adds r1, r5, #0
	bl StartSpriteAnim
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0802881C
	movs r0, #1
	bl sub_0802895C
	add sp, #0x30
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080288A8: .4byte 0x020205AC
	thumb_func_end sub_080287B4

	thumb_func_start sub_080288AC
sub_080288AC: @ 0x080288AC
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _08028918
_080288B2:
	lsls r0, r5, #2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802891C
	adds r0, r0, r1
	cmp r0, #0
	beq _080288CC
	bl DestroySprite
_080288CC:
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xa
	bls _080288B2
	movs r5, #0
	ldr r6, _08028920
_080288E4:
	lsls r0, r5, #2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0802891C
	adds r0, r0, r1
	cmp r0, #0
	beq _080288FE
	bl DestroySprite
_080288FE:
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _080288E4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028918: .4byte 0x0202296C
_0802891C: .4byte 0x020205AC
_08028920: .4byte 0x02022998
	thumb_func_end sub_080288AC

	thumb_func_start sub_08028924
sub_08028924: @ 0x08028924
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _08028954
	ldr r2, _08028958
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	adds r2, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08028954: .4byte 0x020205AC
_08028958: .4byte 0x0202296C
	thumb_func_end sub_08028924

	thumb_func_start sub_0802895C
sub_0802895C: @ 0x0802895C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r7, _080289A0
	ldr r6, _080289A4
	movs r1, #1
	ands r0, r1
	lsls r4, r0, #2
	movs r5, #5
	rsbs r5, r5, #0
_08028972:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08028972
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080289A0: .4byte 0x020205AC
_080289A4: .4byte 0x02022998
	thumb_func_end sub_0802895C

	thumb_func_start sub_080289A8
sub_080289A8: @ 0x080289A8
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r3, _080289C8
	ldr r2, _080289CC
	lsrs r0, r0, #0x16
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	lsrs r1, r1, #0x15
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_080289C8: .4byte 0x020205AC
_080289CC: .4byte 0x0202296C
	thumb_func_end sub_080289A8

	thumb_func_start sub_080289D0
sub_080289D0: @ 0x080289D0
	push {lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080289F4
	lsrs r0, r0, #0xe
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080289F8
	adds r0, r0, r2
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080289F4: .4byte 0x0202296C
_080289F8: .4byte 0x020205AC
	thumb_func_end sub_080289D0

	thumb_func_start sub_080289FC
sub_080289FC: @ 0x080289FC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08028A1C
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x32
	strh r1, [r2, #0x20]
	movs r0, #0x32
	strh r0, [r2, #0x22]
	bx lr
	.align 2, 0
_08028A1C: .4byte 0x020205AC
	thumb_func_end sub_080289FC

	thumb_func_start sub_08028A20
sub_08028A20: @ 0x08028A20
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x42
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08028A62
	movs r3, #0
	ldr r7, _08028A68
	ldr r6, _08028A6C
	movs r5, #0
_08028A36:
	lsls r0, r3, #2
	adds r2, r0, r6
	ldr r1, [r2]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	adds r1, r3, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bls _08028A58
	ldrh r0, [r4, #0x20]
	subs r0, #1
	strh r0, [r4, #0x20]
	ldr r0, [r2]
	strh r5, [r0, #2]
_08028A58:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _08028A36
_08028A62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028A68: .4byte 0x082CEBE0
_08028A6C: .4byte 0x02022964
	thumb_func_end sub_08028A20

	thumb_func_start sub_08028A70
sub_08028A70: @ 0x08028A70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	bl AllocZeroed
	adds r6, r0, #0
	ldr r0, _08028B14
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	ldr r0, _08028B18
	adds r1, r6, #0
	bl LZ77UnCompWram
	cmp r6, #0
	beq _08028AFE
	str r6, [sp, #0x18]
	add r0, sp, #0x18
	movs r1, #0xa0
	lsls r1, r1, #0xb
	orrs r1, r4
	str r1, [r0, #4]
	mov r2, sp
	ldr r1, _08028B1C
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	bl LoadSpriteSheet
	add r0, sp, #0x20
	bl LoadSpritePalette
	movs r5, #0
	ldr r7, _08028B20
	adds r0, r7, #2
	mov sb, r0
	ldr r1, _08028B24
	mov r8, r1
_08028ACA:
	movs r0, #4
	bl AllocZeroed
	lsls r2, r5, #2
	mov r3, r8
	adds r4, r2, r3
	str r0, [r4]
	adds r0, r2, r7
	movs r3, #0
	ldrsh r1, [r0, r3]
	add r2, sb
	movs r0, #0
	ldrsh r2, [r2, r0]
	mov r0, sp
	movs r3, #4
	bl CreateSprite
	ldr r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08028ACA
_08028AFE:
	adds r0, r6, #0
	bl Free
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028B14: .4byte 0x082CEBEC
_08028B18: .4byte 0x082CD000
_08028B1C: .4byte 0x082CEBF4
_08028B20: .4byte 0x082CEBE2
_08028B24: .4byte 0x02022964
	thumb_func_end sub_08028A70

	thumb_func_start sub_08028B28
sub_08028B28: @ 0x08028B28
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r0, _08028B6C
	mov ip, r0
	ldr r4, _08028B70
	adds r7, r4, #2
	ldr r6, _08028B74
	movs r5, #1
_08028B38:
	lsls r2, r3, #2
	mov r1, ip
	adds r0, r2, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r0, r1, #0
	adds r0, #0x42
	strh r5, [r0]
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1, #0x20]
	adds r2, r2, r7
	ldrh r0, [r2]
	strh r0, [r1, #0x22]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _08028B38
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028B6C: .4byte 0x02022964
_08028B70: .4byte 0x082CEBE2
_08028B74: .4byte 0x020205AC
	thumb_func_end sub_08028B28

	thumb_func_start sub_08028B78
sub_08028B78: @ 0x08028B78
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _08028BA8
	ldr r4, _08028BAC
	movs r3, #0
_08028B82:
	lsls r0, r2, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x42
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bls _08028B82
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028BA8: .4byte 0x02022964
_08028BAC: .4byte 0x020205AC
	thumb_func_end sub_08028B78

	thumb_func_start sub_08028BB0
sub_08028BB0: @ 0x08028BB0
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _08028BEC
_08028BB6:
	lsls r0, r5, #2
	adds r4, r0, r6
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08028BF0
	adds r0, r0, r1
	cmp r0, #0
	beq _08028BD0
	bl DestroySprite
_08028BD0:
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08028BB6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028BEC: .4byte 0x02022964
_08028BF0: .4byte 0x020205AC
	thumb_func_end sub_08028BB0

	thumb_func_start sub_08028BF4
sub_08028BF4: @ 0x08028BF4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r7, _08028C38
	ldr r6, _08028C3C
	movs r1, #1
	ands r0, r1
	lsls r4, r0, #2
	movs r5, #5
	rsbs r5, r5, #0
_08028C0A:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _08028C0A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028C38: .4byte 0x020205AC
_08028C3C: .4byte 0x02022964
	thumb_func_end sub_08028BF4

	thumb_func_start sub_08028C40
sub_08028C40: @ 0x08028C40
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0
	subs r0, r1, #1
	cmp r0, #4
	bhi _08028CF2
	lsls r0, r0, #2
	ldr r1, _08028C5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028C5C: .4byte 0x08028C60
_08028C60: @ jump table
	.4byte _08028CE0 @ case 0
	.4byte _08028C74 @ case 1
	.4byte _08028C7E @ case 2
	.4byte _08028C92 @ case 3
	.4byte _08028CBA @ case 4
_08028C74:
	cmp r2, #0
	beq _08028CAA
	cmp r2, #1
	bne _08028CF2
	b _08028CAE
_08028C7E:
	cmp r2, #1
	beq _08028CE4
	cmp r2, #1
	bgt _08028C8C
	cmp r2, #0
	beq _08028CE0
	b _08028CF2
_08028C8C:
	cmp r2, #2
	bne _08028CF2
	b _08028CF0
_08028C92:
	cmp r2, #1
	beq _08028CAE
	cmp r2, #1
	bgt _08028CA0
	cmp r2, #0
	beq _08028CAA
	b _08028CF2
_08028CA0:
	cmp r2, #2
	beq _08028CB2
	cmp r2, #3
	beq _08028CB6
	b _08028CF2
_08028CAA:
	movs r3, #0xc
	b _08028CF2
_08028CAE:
	movs r3, #0x12
	b _08028CF2
_08028CB2:
	movs r3, #0x18
	b _08028CF2
_08028CB6:
	movs r3, #6
	b _08028CF2
_08028CBA:
	cmp r2, #4
	bhi _08028CF2
	lsls r0, r2, #2
	ldr r1, _08028CC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028CC8: .4byte 0x08028CCC
_08028CCC: @ jump table
	.4byte _08028CE0 @ case 0
	.4byte _08028CE4 @ case 1
	.4byte _08028CE8 @ case 2
	.4byte _08028CEC @ case 3
	.4byte _08028CF0 @ case 4
_08028CE0:
	movs r3, #0xf
	b _08028CF2
_08028CE4:
	movs r3, #0x15
	b _08028CF2
_08028CE8:
	movs r3, #0x1b
	b _08028CF2
_08028CEC:
	movs r3, #3
	b _08028CF2
_08028CF0:
	movs r3, #9
_08028CF2:
	lsls r0, r3, #3
	pop {r1}
	bx r1
	thumb_func_end sub_08028C40

	thumb_func_start sub_08028CF8
sub_08028CF8: @ 0x08028CF8
	push {r4, lr}
	movs r4, #0
_08028CFC:
	adds r0, r4, #0
	movs r1, #1
	bl sub_08028924
	adds r0, r4, #0
	movs r1, #1
	bl sub_080289A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xa
	bls _08028CFC
	movs r0, #0
	bl sub_08028714
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08028CF8

	thumb_func_start sub_08028D24
sub_08028D24: @ 0x08028D24
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl GetWindowFrameTilesPal
	ldr r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #1
	bl LoadBgTiles
	adds r0, r4, #0
	bl GetWindowFrameTilesPal
	ldr r0, [r0, #4]
	movs r1, #0xa0
	movs r2, #0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08028D24

	thumb_func_start nullsub_16
nullsub_16: @ 0x08028D58
	push {lr}
	movs r0, #0
	movs r1, #0xa
	movs r2, #0xb0
	bl LoadUserWindowBorderGfx_
	pop {r0}
	bx r0
	thumb_func_end nullsub_16

	thumb_func_start sub_08028D68
sub_08028D68: @ 0x08028D68
	ldr r3, _08028D98
	ldr r0, [r3]
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r0, r2
	movs r2, #0
	str r2, [r1]
	ldr r1, _08028D9C
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, #4
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, #8
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r1, #4
	adds r0, r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_08028D98: .4byte 0x020229AC
_08028D9C: .4byte 0x00003014
	thumb_func_end sub_08028D68

	thumb_func_start sub_08028DA0
sub_08028DA0: @ 0x08028DA0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r6, #0xa
	ldrb r2, [r4, #1]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r5, #1
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #1
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #2]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r0, [r4, #3]
	str r0, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #2
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #3]
	ldrb r0, [r4, #1]
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #3
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #1]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	str r5, [sp]
	ldrb r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #4
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #3]
	ldrb r0, [r4, #1]
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	str r5, [sp]
	ldrb r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #6
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #1]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #4]
	ldrb r0, [r4, #2]
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #7
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #4]
	ldrb r0, [r4, #2]
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r0, [r4, #3]
	str r0, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #8
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #3]
	ldrb r0, [r4, #1]
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #4]
	ldrb r4, [r4, #2]
	adds r3, r3, r4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #9
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08028DA0

	thumb_func_start sub_08028EA0
sub_08028EA0: @ 0x08028EA0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r6, #0xb
	ldrb r2, [r4, #1]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r5, #1
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0xa
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #2]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r0, [r4, #3]
	str r0, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0xb
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #3]
	ldrb r0, [r4, #1]
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	subs r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0xc
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #1]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	str r5, [sp]
	ldrb r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0xd
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #3]
	ldrb r0, [r4, #1]
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #2]
	str r5, [sp]
	ldrb r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0xf
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #1]
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #4]
	ldrb r0, [r4, #2]
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0x10
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #4]
	ldrb r0, [r4, #2]
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r0, [r4, #3]
	str r0, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0x11
	bl FillBgTilemapBufferRect
	ldrb r2, [r4, #3]
	ldrb r0, [r4, #1]
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #4]
	ldrb r4, [r4, #2]
	adds r3, r3, r4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	movs r1, #0x12
	bl FillBgTilemapBufferRect
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08028EA0

	thumb_func_start sub_08028FA0
sub_08028FA0: @ 0x08028FA0
	push {r4, lr}
	ldr r4, _08028FE8
	str r0, [r4]
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r0, r2
	movs r2, #0
	str r2, [r1]
	ldr r3, _08028FEC
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _08028FF0
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r4]
	adds r3, #0xc
	adds r0, r0, r3
	strb r2, [r0]
	ldr r0, [r4]
	adds r1, #0xc
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, _08028FF4
	movs r1, #3
	bl CreateTask
	ldr r1, [r4]
	ldr r2, _08028FF8
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, _08028FFC
	bl sub_0802A420
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08028FE8: .4byte 0x020229AC
_08028FEC: .4byte 0x00003014
_08028FF0: .4byte 0x00003018
_08028FF4: .4byte 0x08029041
_08028FF8: .4byte 0x00003004
_08028FFC: .4byte 0x08029065
	thumb_func_end sub_08028FA0

	thumb_func_start sub_08029000
sub_08029000: @ 0x08029000
	push {lr}
	bl FreeAllWindowBuffers
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08029000

	thumb_func_start sub_0802900C
sub_0802900C: @ 0x0802900C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	ldr r5, _0802903C
	adds r7, r5, #4
_08029018:
	lsls r1, r4, #3
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r6
	bne _0802902A
	adds r0, r1, r7
	ldr r0, [r0]
	bl sub_0802A420
_0802902A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _08029018
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802903C: .4byte 0x082CEC98
	thumb_func_end sub_0802900C

	thumb_func_start sub_08029040
sub_08029040: @ 0x08029040
	push {lr}
	ldr r0, _08029060
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0802905A
	bl sub_0802A450
	bl _call_via_r0
_0802905A:
	pop {r0}
	bx r0
	.align 2, 0
_08029060: .4byte 0x020229AC
	thumb_func_end sub_08029040

	thumb_func_start sub_08029064
sub_08029064: @ 0x08029064
	push {lr}
	ldr r0, _08029080
	ldr r1, [r0]
	ldr r2, _08029084
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0802915C
	lsls r0, r0, #2
	ldr r1, _08029088
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08029080: .4byte 0x020229AC
_08029084: .4byte 0x00003014
_08029088: .4byte 0x0802908C
_0802908C: @ jump table
	.4byte _080290A0 @ case 0
	.4byte _080290A6 @ case 1
	.4byte _080290C0 @ case 2
	.4byte _08029104 @ case 3
	.4byte _08029130 @ case 4
_080290A0:
	bl sub_0802A49C
	b _08029140
_080290A6:
	bl sub_0802A5DC
	cmp r0, #1
	bne _08029166
	ldr r0, _080290B8
	ldr r1, [r0]
	ldr r2, _080290BC
	adds r1, r1, r2
	b _08029148
	.align 2, 0
_080290B8: .4byte 0x020229AC
_080290BC: .4byte 0x00003014
_080290C0:
	ldr r1, _080290F8
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _080290FC
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r1, _08029100
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	b _08029140
	.align 2, 0
_080290F8: .4byte 0x082CE364
_080290FC: .4byte 0x082CE820
_08029100: .4byte 0x082CE5D0
_08029104:
	movs r0, #0
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	ldr r0, _08029128
	ldr r1, [r0]
	ldr r2, _0802912C
	adds r1, r1, r2
	b _08029148
	.align 2, 0
_08029128: .4byte 0x020229AC
_0802912C: .4byte 0x00003014
_08029130:
	ldr r0, _08029150
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	lsrs r0, r0, #3
	bl sub_08028D24
	bl nullsub_16
_08029140:
	ldr r0, _08029154
	ldr r1, [r0]
	ldr r0, _08029158
	adds r1, r1, r0
_08029148:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08029166
	.align 2, 0
_08029150: .4byte 0x03005AF0
_08029154: .4byte 0x020229AC
_08029158: .4byte 0x00003014
_0802915C:
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r0, #1
	str r0, [r1]
_08029166:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08029064

	thumb_func_start sub_0802916C
sub_0802916C: @ 0x0802916C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, _080291AC
	ldr r0, [r4]
	ldr r2, _080291B0
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080291B4
	cmp r0, #1
	bne _0802918C
	b _08029318
_0802918C:
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bhi _0802919A
	b _080293BA
_0802919A:
	bl sub_08027410
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	cmp r6, r7
	blo _080291AA
	b _08029392
_080291AA:
	b _0802936C
	.align 2, 0
_080291AC: .4byte 0x020229AC
_080291B0: .4byte 0x00003014
_080291B4:
	bl sub_08027410
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080292F0
	subs r0, r7, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r2, _080292F4
	ldr r0, [sp, #0xc]
	ands r0, r2
	ldr r1, _080292F8
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #0x13
	orrs r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _080292FC
	ands r0, r1
	movs r1, #0xd0
	lsls r1, r1, #4
	orrs r0, r1
	ldr r1, _08029300
	ands r0, r1
	movs r1, #0x98
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [sp, #0x10]
	movs r6, #0
	cmp r6, r7
	bhs _080292E4
	mov r3, sp
	adds r3, #0xc
	str r3, [sp, #0x18]
	mov sl, r4
	ldr r0, _08029304
	mov sb, r0
_08029208:
	movs r1, #0
	mov r8, r1
	adds r0, r6, #0
	bl sub_08027808
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	bl sub_08027420
	adds r1, r0, #0
	movs r0, #0
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	movs r1, #0x38
	subs r1, r1, r0
	lsrs r1, r1, #1
	str r1, [sp, #0x14]
	ldrb r0, [r5]
	lsls r0, r0, #8
	ldr r2, _080292FC
	ldr r1, [sp, #0xc]
	ands r1, r2
	orrs r1, r0
	str r1, [sp, #0xc]
	ldrb r2, [r5, #1]
	lsls r2, r2, #0x10
	ldr r0, _08029308
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	bl AddWindow
	mov r2, sl
	ldr r1, [r2]
	add r1, sb
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r2]
	add r0, sb
	adds r0, r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	mov r3, sl
	ldr r0, [r3]
	add r0, sb
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08029286
	movs r0, #2
	mov r8, r0
_08029286:
	adds r0, r4, #0
	bl sub_08027420
	adds r4, r0, #0
	mov r1, sl
	ldr r0, [r1]
	add r0, sb
	adds r0, r0, r6
	ldrb r0, [r0]
	ldr r3, [sp, #0x14]
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	mov r3, r8
	lsls r1, r3, #1
	add r1, r8
	ldr r3, _0802930C
	adds r1, r1, r3
	str r1, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0
	movs r3, #1
	bl AddTextPrinterParameterized3
	mov r2, sl
	ldr r0, [r2]
	add r0, sb
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r3, [sp, #0x18]
	ldrh r0, [r3, #6]
	adds r0, #0xe
	strh r0, [r3, #6]
	add r0, sp, #0xc
	bl sub_08028EA0
	adds r5, #4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _08029208
_080292E4:
	ldr r0, _08029310
	ldr r1, [r0]
	ldr r0, _08029314
	adds r1, r1, r0
	b _08029356
	.align 2, 0
_080292F0: .4byte 0x082CEC54
_080292F4: .4byte 0xFFFFFF00
_080292F8: .4byte 0x00FFFFFF
_080292FC: .4byte 0xFFFF00FF
_08029300: .4byte 0x0000FFFF
_08029304: .4byte 0x00003008
_08029308: .4byte 0xFF00FFFF
_0802930C: .4byte 0x082CEC0C
_08029310: .4byte 0x020229AC
_08029314: .4byte 0x00003014
_08029318:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080293BA
	bl sub_08027410
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	cmp r6, r7
	bhs _08029348
_08029330:
	ldr r0, [r4]
	ldr r1, _08029360
	adds r0, r0, r1
	adds r0, r0, r6
	ldrb r0, [r0]
	bl PutWindowTilemap
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _08029330
_08029348:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08029364
	ldr r1, [r0]
	ldr r2, _08029368
	adds r1, r1, r2
_08029356:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080293BA
	.align 2, 0
_08029360: .4byte 0x00003008
_08029364: .4byte 0x020229AC
_08029368: .4byte 0x00003014
_0802936C:
	ldr r5, _080293CC
	ldr r0, [r5]
	ldr r4, _080293D0
	adds r0, r0, r4
	adds r0, r0, r6
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, r0, r6
	ldrb r0, [r0]
	bl RemoveWindow
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _0802936C
_08029392:
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
	ldr r0, _080293CC
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #6
	adds r0, r0, r3
	movs r1, #1
	str r1, [r0]
_080293BA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080293CC: .4byte 0x020229AC
_080293D0: .4byte 0x00003008
	thumb_func_end sub_0802916C

	thumb_func_start sub_080293D4
sub_080293D4: @ 0x080293D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x68
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	movs r6, #0
	lsrs r7, r0, #0x18
	add r4, sp, #0x2c
	ldr r1, _08029588
	adds r0, r4, #0
	movs r2, #5
	bl memcpy
	movs r5, #0
	cmp r5, r7
	bhs _08029424
	add r4, sp, #0x34
_080293FE:
	mov r0, sp
	adds r0, r0, r5
	adds r0, #0x2c
	strb r5, [r0]
	add r0, sp, #0x5c
	adds r1, r5, #0
	bl sub_080276FC
	lsls r2, r5, #3
	adds r2, r4, r2
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	str r0, [r2]
	str r1, [r2, #4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _080293FE
_08029424:
	bl sub_08027508
	cmp r0, #0
	beq _0802945A
_0802942C:
	movs r5, #0
	cmp r5, r7
	bhs _08029454
	add r2, sp, #0x34
	add r1, sp, #0x2c
_08029436:
	lsls r0, r5, #3
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r8
	bne _0802944A
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0802944A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _08029436
_08029454:
	mov r8, r6
	cmp r6, r7
	blo _0802942C
_0802945A:
	movs r5, #0
	cmp r5, r7
	bhs _0802947E
	add r6, sp, #0x34
	add r3, sp, #0x38
	subs r2, r7, #1
_08029466:
	lsls r1, r5, #3
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08029474
	adds r0, r6, r1
	strb r2, [r0]
_08029474:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _08029466
_0802947E:
	movs r5, #0
	cmp r5, r7
	bhs _08029576
	mov r2, sp
	adds r2, #0x34
	str r2, [sp, #0x64]
	ldr r3, _0802958C
	mov sl, r3
_0802948E:
	movs r0, #0
	mov r8, r0
	mov r0, sp
	adds r0, r0, r5
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r4, r0, #0
	lsls r1, r4, #3
	add r0, sp, #0x38
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	ldr r2, _08029590
	ldr r0, [r2]
	add r0, sl
	ldrb r0, [r0]
	ldr r2, _08029594
	ldr r3, [sp, #0x64]
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r3, _08029598
	lsls r1, r5, #1
	adds r1, r1, r3
	ldrb r6, [r1]
	str r6, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	mov r3, r8
	str r3, [sp, #8]
	movs r1, #0
	movs r3, #8
	bl AddTextPrinterParameterized
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080294E6
	movs r0, #2
	mov r8, r0
_080294E6:
	adds r0, r4, #0
	bl sub_08027420
	adds r3, r0, #0
	ldr r1, _08029590
	ldr r0, [r1]
	add r0, sl
	ldrb r0, [r0]
	mov r2, r8
	lsls r1, r2, #1
	add r1, r8
	ldr r2, _0802959C
	adds r1, r1, r2
	str r1, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r1, #0
	movs r2, #0x1c
	adds r3, r6, #0
	bl AddTextPrinterParameterized3
	add r0, sp, #0xc
	mov r1, sb
	movs r2, #0
	movs r3, #7
	bl ConvertIntToDecimalStringN
	movs r0, #0
	add r1, sp, #0xc
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	ldr r2, _08029590
	ldr r1, [r2]
	add r1, sl
	ldrb r1, [r1]
	movs r3, #0x91
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	adds r0, r1, #0
	movs r1, #0
	add r2, sp, #0xc
	bl AddTextPrinterParameterized
	ldr r3, _08029590
	ldr r0, [r3]
	add r0, sl
	ldrb r0, [r0]
	str r6, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r1, #0
	ldr r2, _080295A0
	movs r3, #0x9b
	bl AddTextPrinterParameterized
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _0802948E
_08029576:
	add sp, #0x68
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029588: .4byte 0x082CECE8
_0802958C: .4byte 0x00003009
_08029590: .4byte 0x020229AC
_08029594: .4byte 0x082CEC68
_08029598: .4byte 0x082CEC8E
_0802959C: .4byte 0x082CEC0C
_080295A0: .4byte 0x085CCDE7
	thumb_func_end sub_080293D4

	thumb_func_start sub_080295A4
sub_080295A4: @ 0x080295A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	bl sub_08027410
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r6, _080295D4
	ldr r1, [r6]
	ldr r2, _080295D8
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _080295CA
	b _08029CC0
_080295CA:
	lsls r0, r0, #2
	ldr r1, _080295DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080295D4: .4byte 0x020229AC
_080295D8: .4byte 0x00003014
_080295DC: .4byte 0x080295E0
_080295E0: @ jump table
	.4byte _08029610 @ case 0
	.4byte _0802962C @ case 1
	.4byte _08029684 @ case 2
	.4byte _08029888 @ case 3
	.4byte _080298D4 @ case 4
	.4byte _08029918 @ case 5
	.4byte _0802997C @ case 6
	.4byte _080299B8 @ case 7
	.4byte _080299FC @ case 8
	.4byte _08029ABC @ case 9
	.4byte _08029C20 @ case 10
	.4byte _08029C74 @ case 11
_08029610:
	bl sub_0802760C
	ldr r0, _08029624
	ldr r1, [r0]
	ldr r0, _08029628
	adds r2, r1, r0
	movs r0, #0
	strh r0, [r2]
	b _08029CA2
	.align 2, 0
_08029624: .4byte 0x020229AC
_08029628: .4byte 0x0000301C
_0802962C:
	ldr r6, _08029674
	adds r0, r6, #0
	bl AddWindow
	ldr r4, _08029678
	ldr r1, [r4]
	ldr r2, _0802967C
	mov r8, r2
	add r1, r8
	strb r0, [r1]
	movs r0, #8
	adds r0, r0, r6
	mov sb, r0
	bl AddWindow
	ldr r1, [r4]
	ldr r5, _08029680
	adds r1, r1, r5
	strb r0, [r1]
	ldr r0, [r4]
	add r0, r8
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, #0
	bl sub_08028EA0
	mov r0, sb
	bl sub_08028EA0
	b _08029CA0
	.align 2, 0
_08029674: .4byte 0x082CB448
_08029678: .4byte 0x020229AC
_0802967C: .4byte 0x00003008
_08029680: .4byte 0x00003009
_08029684:
	ldr r4, _080297D0
	ldr r0, [r4]
	ldr r5, _080297D4
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _080297D8
	mov sb, r1
	add r0, sb
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _080297DC
	mov r8, r2
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	mov r1, r8
	bl GetStringWidth
	adds r1, r0, #0
	movs r0, #0xe0
	subs r0, r0, r1
	lsrs r3, r0, #1
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #2
	str r1, [sp]
	movs r6, #0xff
	str r6, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r1, #0
	mov r2, r8
	bl AddTextPrinterParameterized
	ldr r0, [r4]
	add r0, sb
	ldrb r0, [r0]
	ldr r2, _080297E0
	movs r1, #0x10
	str r1, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r3, #0x44
	bl AddTextPrinterParameterized
	movs r0, #0
	mov sb, r0
	ldr r1, [sp, #0xc]
	cmp sb, r1
	blo _080296FE
	b _08029844
_080296FE:
	movs r4, #0
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp sb, r0
	bne _0802970E
	movs r4, #2
_0802970E:
	mov r0, sb
	bl sub_08027420
	adds r6, r0, #0
	ldr r0, _080297D0
	ldr r0, [r0]
	ldr r2, _080297D8
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r1, sb
	lsls r5, r1, #1
	ldr r2, _080297E4
	adds r1, r5, r2
	ldrb r3, [r1]
	lsls r1, r4, #1
	adds r1, r1, r4
	ldr r2, _080297E8
	adds r1, r1, r2
	str r1, [sp]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r1, #0
	movs r2, #2
	bl AddTextPrinterParameterized3
	movs r7, #0
	mov r8, r5
	mov r0, sb
	adds r0, #1
	str r0, [sp, #0x10]
	ldr r1, _080297EC
	mov sl, r1
_08029752:
	mov r0, sb
	adds r1, r7, #0
	bl sub_08027460
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080297F0
	bl Min
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r7, #0
	bl sub_0802754C
	ldr r1, _080297F0
	bl Min
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, sl
	adds r1, r4, #0
	movs r2, #0
	movs r3, #4
	bl ConvertIntToDecimalStringN
	movs r0, #0
	mov r1, sl
	movs r2, #1
	rsbs r2, r2, #0
	bl GetStringWidth
	adds r5, r0, #0
	cmp r6, r4
	bne _080297FC
	cmp r6, #0
	beq _080297FC
	ldr r0, _080297D0
	ldr r0, [r0]
	ldr r2, _080297D8
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r1, r7, #1
	ldr r2, _080297F4
	adds r1, r1, r2
	ldrb r2, [r1]
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _080297E4
	add r1, r8
	ldrb r3, [r1]
	ldr r1, _080297F8
	str r1, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #4]
	mov r1, sl
	str r1, [sp, #8]
	movs r1, #0
	bl AddTextPrinterParameterized3
	b _0802982A
	.align 2, 0
_080297D0: .4byte 0x020229AC
_080297D4: .4byte 0x00003008
_080297D8: .4byte 0x00003009
_080297DC: .4byte 0x085CCD34
_080297E0: .4byte 0x085CCD45
_080297E4: .4byte 0x082CEC84
_080297E8: .4byte 0x082CEC0C
_080297EC: .4byte 0x02021C7C
_080297F0: .4byte 0x0000270F
_080297F4: .4byte 0x082CEC7C
_080297F8: .4byte 0x082CEC0F
_080297FC:
	ldr r0, _0802986C
	ldr r0, [r0]
	ldr r2, _08029870
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r1, r7, #1
	ldr r2, _08029874
	adds r1, r1, r2
	ldrb r3, [r1]
	subs r3, r3, r5
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _08029878
	add r1, r8
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r2, _0802987C
	bl AddTextPrinterParameterized
_0802982A:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _08029752
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r2, [sp, #0xc]
	cmp sb, r2
	bhs _08029844
	b _080296FE
_08029844:
	ldr r4, _0802986C
	ldr r0, [r4]
	ldr r1, _08029880
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08029870
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _08029884
	adds r1, r1, r0
	b _08029CA6
	.align 2, 0
_0802986C: .4byte 0x020229AC
_08029870: .4byte 0x00003009
_08029874: .4byte 0x082CEC7C
_08029878: .4byte 0x082CEC84
_0802987C: .4byte 0x02021C7C
_08029880: .4byte 0x00003008
_08029884: .4byte 0x00003014
_08029888:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080298AC
	ldr r4, _080298C4
	ldr r0, [r4]
	ldr r1, _080298C8
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _080298CC
	adds r0, r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_080298AC:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	bl sub_0802895C
	ldr r0, _080298C4
	ldr r1, [r0]
	ldr r0, _080298D0
	adds r1, r1, r0
	b _08029CA6
	.align 2, 0
_080298C4: .4byte 0x020229AC
_080298C8: .4byte 0x00003008
_080298CC: .4byte 0x00003009
_080298D0: .4byte 0x00003014
_080298D4:
	ldr r4, _0802990C
	ldr r0, [r4]
	ldr r1, _08029910
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _080298EC
	b _08029D10
_080298EC:
	ldr r0, _08029914
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080298FA
	b _08029D10
_080298FA:
	movs r0, #0
	strh r0, [r2]
	movs r0, #5
	bl PlaySE
	movs r0, #1
	bl sub_0802895C
	b _08029CA0
	.align 2, 0
_0802990C: .4byte 0x020229AC
_08029910: .4byte 0x0000301C
_08029914: .4byte 0x03002360
_08029918:
	ldr r4, _0802996C
	ldr r0, [r4]
	ldr r5, _08029970
	adds r0, r0, r5
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08029974
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r6, _08029978
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	adds r1, r6, #0
	bl GetStringWidth
	adds r1, r0, #0
	movs r0, #0xe0
	subs r0, r0, r1
	lsrs r3, r0, #1
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r1, #2
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	adds r2, r6, #0
	bl AddTextPrinterParameterized
	b _08029CA0
	.align 2, 0
_0802996C: .4byte 0x020229AC
_08029970: .4byte 0x00003008
_08029974: .4byte 0x00003009
_08029978: .4byte 0x085CCD5A
_0802997C:
	ldr r0, [sp, #0xc]
	bl sub_080293D4
	ldr r4, _080299A8
	ldr r0, [r4]
	ldr r1, _080299AC
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _080299B0
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _080299B4
	adds r1, r1, r0
	b _08029CA6
	.align 2, 0
_080299A8: .4byte 0x020229AC
_080299AC: .4byte 0x00003008
_080299B0: .4byte 0x00003009
_080299B4: .4byte 0x00003014
_080299B8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080299DC
	ldr r4, _080299EC
	ldr r0, [r4]
	ldr r1, _080299F0
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _080299F4
	adds r0, r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_080299DC:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _080299EC
	ldr r1, [r0]
	ldr r0, _080299F8
	adds r1, r1, r0
	b _08029CA6
	.align 2, 0
_080299EC: .4byte 0x020229AC
_080299F0: .4byte 0x00003008
_080299F4: .4byte 0x00003009
_080299F8: .4byte 0x00003014
_080299FC:
	ldr r4, _08029A44
	ldr r0, [r4]
	ldr r1, _08029A48
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _08029A14
	b _08029D10
_08029A14:
	ldr r0, _08029A4C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08029A22
	b _08029D10
_08029A22:
	movs r0, #0
	strh r0, [r2]
	movs r0, #5
	bl PlaySE
	bl sub_08027508
	ldr r1, _08029A50
	cmp r0, r1
	bhi _08029A58
	ldr r0, [r4]
	ldr r2, _08029A54
	adds r0, r0, r2
	movs r1, #0x7f
	strb r1, [r0]
	b _08029A68
	.align 2, 0
_08029A44: .4byte 0x020229AC
_08029A48: .4byte 0x0000301C
_08029A4C: .4byte 0x03002360
_08029A50: .4byte 0x00000BB7
_08029A54: .4byte 0x00003014
_08029A58:
	bl StopMapMusic
	ldr r1, [r4]
	ldr r0, _08029AAC
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08029A68:
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #5
	bl FillBgTilemapBufferRect_Palette0
	ldr r5, _08029AB0
	ldr r0, [r5]
	ldr r4, _08029AB4
	adds r0, r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r6, _08029AB8
	adds r0, r6, #0
	bl AddWindow
	ldr r1, [r5]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r6, #0
	bl sub_08028EA0
	b _08029D10
	.align 2, 0
_08029AAC: .4byte 0x00003014
_08029AB0: .4byte 0x020229AC
_08029AB4: .4byte 0x00003009
_08029AB8: .4byte 0x082CB458
_08029ABC:
	ldr r0, _08029B94
	bl PlayNewMapMusic
	ldr r4, _08029B98
	ldr r0, [r4]
	ldr r6, _08029B9C
	adds r0, r0, r6
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	ldr r1, _08029BA0
	mov sl, r1
	add r0, sl
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r5, _08029BA4
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	adds r1, r5, #0
	bl GetStringWidth
	adds r1, r0, #0
	movs r0, #0xe0
	subs r0, r0, r1
	lsrs r3, r0, #1
	ldr r0, [r4]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #2
	mov sb, r2
	str r2, [sp]
	movs r1, #0xff
	mov r8, r1
	str r1, [sp, #4]
	movs r6, #0
	str r6, [sp, #8]
	movs r1, #0
	adds r2, r5, #0
	bl AddTextPrinterParameterized
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_080273EC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r5, _08029BA8
	adds r1, r5, #0
	bl CopyItemName
	movs r0, #0
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r7, _08029BAC
	ldr r1, _08029BB0
	adds r0, r7, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	ldr r0, [r4]
	add r0, sl
	ldrb r0, [r0]
	mov r2, sb
	str r2, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r1, #0
	adds r2, r7, #0
	movs r3, #8
	bl AddTextPrinterParameterized
	bl sub_08027788
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0
	beq _08029BE2
	cmp r4, #3
	beq _08029BE2
	bl DynamicPlaceholderTextUtil_Reset
	bl sub_080273EC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl CopyItemName
	movs r0, #0
	adds r1, r5, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	cmp r4, #2
	bne _08029BB8
	ldr r1, _08029BB4
	adds r0, r7, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	b _08029BC4
	.align 2, 0
_08029B94: .4byte 0x0000016F
_08029B98: .4byte 0x020229AC
_08029B9C: .4byte 0x00003008
_08029BA0: .4byte 0x00003009
_08029BA4: .4byte 0x085CCD68
_08029BA8: .4byte 0x02021C40
_08029BAC: .4byte 0x02021C7C
_08029BB0: .4byte 0x085CCD86
_08029BB4: .4byte 0x085CCD9F
_08029BB8:
	cmp r6, #1
	bne _08029BC4
	ldr r1, _08029C08
	adds r0, r7, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
_08029BC4:
	ldr r0, _08029C0C
	ldr r0, [r0]
	ldr r2, _08029C10
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r2, _08029C14
	movs r1, #0x28
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r3, #8
	bl AddTextPrinterParameterized
_08029BE2:
	ldr r4, _08029C0C
	ldr r0, [r4]
	ldr r1, _08029C18
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, [r4]
	ldr r2, _08029C10
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r1, [r4]
	ldr r0, _08029C1C
	adds r1, r1, r0
	b _08029CA6
	.align 2, 0
_08029C08: .4byte 0x085CCDAB
_08029C0C: .4byte 0x020229AC
_08029C10: .4byte 0x00003009
_08029C14: .4byte 0x02021C7C
_08029C18: .4byte 0x00003008
_08029C1C: .4byte 0x00003014
_08029C20:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029C44
	ldr r4, _08029C60
	ldr r0, [r4]
	ldr r1, _08029C64
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r4]
	ldr r2, _08029C68
	adds r0, r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_08029C44:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r0, _08029C6C
	movs r1, #0x14
	movs r2, #0xa
	bl FadeOutAndFadeInNewMapMusic
	ldr r0, _08029C60
	ldr r1, [r0]
	ldr r0, _08029C70
	adds r1, r1, r0
	b _08029CA6
	.align 2, 0
_08029C60: .4byte 0x020229AC
_08029C64: .4byte 0x00003008
_08029C68: .4byte 0x00003009
_08029C6C: .4byte 0x0000020B
_08029C70: .4byte 0x00003014
_08029C74:
	ldr r4, _08029CB0
	ldr r0, [r4]
	ldr r1, _08029CB4
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bls _08029D10
	ldr r0, _08029CB8
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029D10
	movs r0, #0
	strh r0, [r2]
	movs r0, #5
	bl PlaySE
_08029CA0:
	ldr r1, [r4]
_08029CA2:
	ldr r2, _08029CBC
	adds r1, r1, r2
_08029CA6:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08029D10
	.align 2, 0
_08029CB0: .4byte 0x020229AC
_08029CB4: .4byte 0x0000301C
_08029CB8: .4byte 0x03002360
_08029CBC: .4byte 0x00003014
_08029CC0:
	ldr r5, _08029D20
	adds r0, r1, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	ldr r4, _08029D24
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
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
	ldr r0, [r6]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
_08029D10:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029D20: .4byte 0x00003008
_08029D24: .4byte 0x00003009
	thumb_func_end sub_080295A4

	thumb_func_start sub_08029D28
sub_08029D28: @ 0x08029D28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _08029D50
	ldr r2, [r1]
	ldr r3, _08029D54
	adds r0, r2, r3
	ldrb r7, [r0]
	adds r6, r1, #0
	cmp r7, #1
	beq _08029DDC
	cmp r7, #1
	bgt _08029D58
	cmp r7, #0
	beq _08029D66
	b _08029FF4
	.align 2, 0
_08029D50: .4byte 0x020229AC
_08029D54: .4byte 0x00003014
_08029D58:
	cmp r7, #2
	bne _08029D5E
	b _08029EA0
_08029D5E:
	cmp r7, #3
	bne _08029D64
	b _08029ED4
_08029D64:
	b _08029FF4
_08029D66:
	ldr r0, _08029DC4
	bl AddWindow
	ldr r1, [r6]
	ldr r5, _08029DC8
	adds r1, r1, r5
	strb r0, [r1]
	ldr r0, _08029DC4
	adds r0, #8
	mov r8, r0
	bl AddWindow
	ldr r1, [r6]
	ldr r4, _08029DCC
	adds r1, r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, _08029DC4
	bl sub_08028EA0
	mov r0, r8
	bl sub_08028DA0
	ldr r1, [r6]
	ldr r2, _08029DD0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	ldr r3, _08029DD4
	adds r0, r0, r3
	strb r7, [r0]
	ldr r0, [r6]
	ldr r1, _08029DD8
	adds r0, r0, r1
	strb r7, [r0]
	b _0802A054
	.align 2, 0
_08029DC4: .4byte 0x082CB460
_08029DC8: .4byte 0x00003008
_08029DCC: .4byte 0x00003009
_08029DD0: .4byte 0x00003014
_08029DD4: .4byte 0x00003020
_08029DD8: .4byte 0x00003024
_08029DDC:
	ldr r3, _08029E84
	mov r8, r3
	adds r0, r2, r3
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	ldr r7, _08029E88
	adds r0, r0, r7
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08029E8C
	movs r1, #6
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r2, _08029E90
	movs r3, #2
	mov sb, r3
	str r3, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0xc
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r2, _08029E94
	movs r1, #0x12
	str r1, [sp]
	movs r3, #0xff
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0xc
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r2, _08029E98
	mov r1, sb
	str r1, [sp]
	movs r3, #0xff
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r1, [r6]
	ldr r0, _08029E9C
	adds r1, r1, r0
	b _08029FE8
	.align 2, 0
_08029E84: .4byte 0x00003008
_08029E88: .4byte 0x00003009
_08029E8C: .4byte 0x085CCDBD
_08029E90: .4byte 0x085CAAD8
_08029E94: .4byte 0x085CAADB
_08029E98: .4byte 0x085C9421
_08029E9C: .4byte 0x00003014
_08029EA0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029EC2
	ldr r0, [r6]
	ldr r1, _08029ECC
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
	ldr r0, [r6]
	ldr r2, _08029ED0
	adds r0, r0, r2
	ldrb r0, [r0]
	bl PutWindowTilemap
_08029EC2:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	b _08029FE2
	.align 2, 0
_08029ECC: .4byte 0x00003008
_08029ED0: .4byte 0x00003009
_08029ED4:
	ldr r0, _08029F7C
	mov sl, r0
	adds r0, r2, r0
	ldrb r7, [r0]
	cmp r7, #0
	bne _08029EE2
	movs r7, #1
_08029EE2:
	ldr r1, _08029F80
	mov r8, r1
	adds r0, r2, r1
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08029F84
	movs r3, #2
	mov sb, r3
	str r3, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0xc
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08029F88
	movs r1, #0x12
	str r1, [sp]
	movs r3, #0xff
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #0xc
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08029F8C
	subs r1, r7, #1
	lsls r1, r1, #4
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	movs r1, #3
	bl CopyWindowToVram
	ldr r0, _08029F90
	ldrh r1, [r0, #0x2e]
	movs r4, #1
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029F94
	movs r0, #5
	bl PlaySE
	ldr r0, [r6]
	mov r2, sl
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08029FE2
	strb r4, [r1]
	b _08029FE2
	.align 2, 0
_08029F7C: .4byte 0x00003020
_08029F80: .4byte 0x00003009
_08029F84: .4byte 0x085CAAD8
_08029F88: .4byte 0x085CAADB
_08029F8C: .4byte 0x085C9421
_08029F90: .4byte 0x03002360
_08029F94:
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08029FCC
	movs r0, #5
	bl PlaySE
	ldr r0, [r6]
	add r0, sl
	ldrb r2, [r0]
	cmp r2, #1
	beq _08029FC2
	cmp r2, #1
	bgt _08029FB6
	cmp r2, #0
	beq _08029FBC
	b _0802A054
_08029FB6:
	cmp r2, #2
	beq _08029FC8
	b _0802A054
_08029FBC:
	mov r1, sb
	strb r1, [r0]
	b _0802A054
_08029FC2:
	mov r2, sb
	strb r2, [r0]
	b _0802A054
_08029FC8:
	strb r4, [r0]
	b _0802A054
_08029FCC:
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _0802A054
	movs r0, #5
	bl PlaySE
	ldr r0, [r6]
	add r0, sl
	movs r1, #2
	strb r1, [r0]
_08029FE2:
	ldr r1, [r6]
	ldr r3, _08029FF0
	adds r1, r1, r3
_08029FE8:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0802A054
	.align 2, 0
_08029FF0: .4byte 0x00003014
_08029FF4:
	ldr r0, [r6]
	ldr r2, _0802A064
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r3, _0802A068
	adds r0, r0, r3
	strb r1, [r0]
	ldr r0, [r6]
	ldr r7, _0802A06C
	adds r0, r0, r7
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	ldr r4, _0802A070
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	bl RemoveWindow
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
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
	ldr r0, [r6]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
_0802A054:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A064: .4byte 0x00003020
_0802A068: .4byte 0x00003024
_0802A06C: .4byte 0x00003008
_0802A070: .4byte 0x00003009
	thumb_func_end sub_08029D28

	thumb_func_start sub_0802A074
sub_0802A074: @ 0x0802A074
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0802A090
	ldr r0, [r5]
	ldr r6, _0802A094
	adds r0, r0, r6
	ldrb r4, [r0]
	cmp r4, #1
	beq _0802A0CC
	cmp r4, #1
	bgt _0802A098
	cmp r4, #0
	beq _0802A0A2
	b _0802A114
	.align 2, 0
_0802A090: .4byte 0x020229AC
_0802A094: .4byte 0x00003014
_0802A098:
	cmp r4, #2
	beq _0802A0E0
	cmp r4, #3
	beq _0802A0F8
	b _0802A114
_0802A0A2:
	movs r0, #0
	movs r1, #0
	bl ClearDialogWindowAndFrame
	ldr r2, _0802A0C8
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	movs r1, #1
	movs r3, #0
	bl AddTextPrinterParameterized2
	b _0802A104
	.align 2, 0
_0802A0C8: .4byte 0x08277071
_0802A0CC:
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _0802A0DC
	adds r1, r1, r0
	b _0802A108
	.align 2, 0
_0802A0DC: .4byte 0x00003014
_0802A0E0:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A13C
	ldr r0, _0802A0F4
	movs r1, #0
	bl CreateTask
	b _0802A104
	.align 2, 0
_0802A0F4: .4byte 0x081535C5
_0802A0F8:
	ldr r0, _0802A110
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A13C
_0802A104:
	ldr r1, [r5]
	adds r1, r1, r6
_0802A108:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0802A13C
	.align 2, 0
_0802A110: .4byte 0x081535C5
_0802A114:
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
	ldr r0, _0802A144
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
_0802A13C:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A144: .4byte 0x020229AC
	thumb_func_end sub_0802A074

	thumb_func_start sub_0802A148
sub_0802A148: @ 0x0802A148
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, _0802A168
	ldr r2, [r1]
	ldr r6, _0802A16C
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #1
	beq _0802A1A0
	cmp r0, #1
	bgt _0802A170
	cmp r0, #0
	beq _0802A176
	b _0802A214
	.align 2, 0
_0802A168: .4byte 0x020229AC
_0802A16C: .4byte 0x00003014
_0802A170:
	cmp r0, #2
	beq _0802A1E8
	b _0802A214
_0802A176:
	ldr r4, _0802A198
	adds r0, r4, #0
	bl AddWindow
	ldr r1, [r5]
	ldr r2, _0802A19C
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, #0
	bl sub_08028EA0
	b _0802A204
	.align 2, 0
_0802A198: .4byte 0x082CB478
_0802A19C: .4byte 0x00003008
_0802A1A0:
	ldr r4, _0802A1DC
	adds r0, r2, r4
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r2, _0802A1E0
	movs r1, #6
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #4
	bl AddTextPrinterParameterized
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r1, [r5]
	ldr r0, _0802A1E4
	adds r1, r1, r0
	b _0802A208
	.align 2, 0
_0802A1DC: .4byte 0x00003008
_0802A1E0: .4byte 0x085CCDEA
_0802A1E4: .4byte 0x00003014
_0802A1E8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A1FE
	ldr r0, [r5]
	ldr r1, _0802A210
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_0802A1FE:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
_0802A204:
	ldr r1, [r5]
	adds r1, r1, r6
_0802A208:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0802A220
	.align 2, 0
_0802A210: .4byte 0x00003008
_0802A214:
	ldr r0, [r5]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
_0802A220:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0802A148

	thumb_func_start sub_0802A228
sub_0802A228: @ 0x0802A228
	push {r4, r5, lr}
	sub sp, #8
	ldr r5, _0802A274
	ldr r0, [r5]
	ldr r4, _0802A278
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
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
	ldr r0, [r5]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802A274: .4byte 0x020229AC
_0802A278: .4byte 0x00003008
	thumb_func_end sub_0802A228

	thumb_func_start sub_0802A27C
sub_0802A27C: @ 0x0802A27C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0802A29C
	ldr r1, [r0]
	ldr r7, _0802A2A0
	adds r2, r1, r7
	ldrb r5, [r2]
	adds r6, r0, #0
	cmp r5, #1
	beq _0802A304
	cmp r5, #1
	bgt _0802A2A4
	cmp r5, #0
	beq _0802A2AE
	b _0802A398
	.align 2, 0
_0802A29C: .4byte 0x020229AC
_0802A2A0: .4byte 0x00003014
_0802A2A4:
	cmp r5, #2
	beq _0802A34C
	cmp r5, #3
	beq _0802A378
	b _0802A398
_0802A2AE:
	ldr r4, _0802A2F4
	adds r0, r4, #0
	bl AddWindow
	ldr r1, [r6]
	ldr r2, _0802A2F8
	adds r1, r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r0, [r0]
	bl ClearWindowTilemap
	adds r0, r4, #0
	bl sub_08028EA0
	ldr r1, [r6]
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	ldr r2, _0802A2FC
	adds r1, r0, r2
	movs r2, #0
	strh r5, [r1]
	ldr r1, _0802A300
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r6]
	adds r1, #4
	adds r0, r0, r1
	strb r2, [r0]
	b _0802A3DE
	.align 2, 0
_0802A2F4: .4byte 0x082CB470
_0802A2F8: .4byte 0x00003008
_0802A2FC: .4byte 0x0000301C
_0802A300: .4byte 0x00003020
_0802A304:
	ldr r4, _0802A340
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r2, _0802A344
	movs r1, #6
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #2
	bl AddTextPrinterParameterized
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #2
	bl CopyWindowToVram
	ldr r1, [r6]
	ldr r2, _0802A348
	adds r1, r1, r2
	b _0802A36C
	.align 2, 0
_0802A340: .4byte 0x00003008
_0802A344: .4byte 0x085CCDCB
_0802A348: .4byte 0x00003014
_0802A34C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A362
	ldr r0, [r6]
	ldr r1, _0802A374
	adds r0, r0, r1
	ldrb r0, [r0]
	bl PutWindowTilemap
_0802A362:
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	ldr r1, [r6]
	adds r1, r1, r7
_0802A36C:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0802A3DE
	.align 2, 0
_0802A374: .4byte 0x00003008
_0802A378:
	ldr r0, _0802A394
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x77
	bls _0802A3DE
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _0802A3DE
	.align 2, 0
_0802A394: .4byte 0x0000301C
_0802A398:
	ldr r0, [r6]
	ldr r1, _0802A3E8
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	ldr r0, [r6]
	ldr r4, _0802A3EC
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ClearWindowTilemap
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl RemoveWindow
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
	ldr r0, [r6]
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r0, r2
	movs r1, #1
	str r1, [r0]
_0802A3DE:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3E8: .4byte 0x00003024
_0802A3EC: .4byte 0x00003008
	thumb_func_end sub_0802A27C

	thumb_func_start sub_0802A3F0
sub_0802A3F0: @ 0x0802A3F0
	push {r4, lr}
	ldr r4, _0802A414
	ldr r0, [r4]
	ldr r1, _0802A418
	adds r0, r0, r1
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A414: .4byte 0x020229AC
_0802A418: .4byte 0x00003004
	thumb_func_end sub_0802A3F0

	thumb_func_start sub_0802A41C
sub_0802A41C: @ 0x0802A41C
	bx lr
	.align 2, 0
	thumb_func_end sub_0802A41C

	thumb_func_start sub_0802A420
sub_0802A420: @ 0x0802A420
	push {r4, lr}
	ldr r2, _0802A444
	ldr r1, [r2]
	ldr r3, _0802A448
	adds r1, r1, r3
	movs r3, #0
	strb r3, [r1]
	ldr r1, [r2]
	movs r4, #0xc0
	lsls r4, r4, #6
	adds r2, r1, r4
	str r3, [r2]
	ldr r2, _0802A44C
	adds r1, r1, r2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A444: .4byte 0x020229AC
_0802A448: .4byte 0x00003014
_0802A44C: .4byte 0x00003028
	thumb_func_end sub_0802A420

	thumb_func_start sub_0802A450
sub_0802A450: @ 0x0802A450
	ldr r0, _0802A45C
	ldr r0, [r0]
	ldr r1, _0802A460
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0802A45C: .4byte 0x020229AC
_0802A460: .4byte 0x00003028
	thumb_func_end sub_0802A450

	thumb_func_start sub_0802A464
sub_0802A464: @ 0x0802A464
	push {lr}
	ldr r0, _0802A47C
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	beq _0802A480
	movs r0, #1
	b _0802A482
	.align 2, 0
_0802A47C: .4byte 0x020229AC
_0802A480:
	movs r0, #0
_0802A482:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0802A464

	thumb_func_start sub_0802A488
sub_0802A488: @ 0x0802A488
	ldr r0, _0802A494
	ldr r0, [r0]
	ldr r1, _0802A498
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0802A494: .4byte 0x020229AC
_0802A498: .4byte 0x00003024
	thumb_func_end sub_0802A488

	thumb_func_start sub_0802A49C
sub_0802A49C: @ 0x0802A49C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #9
	add r0, sp, #4
	mov r8, r0
	mov r2, sp
	movs r6, #0
	ldr r1, _0802A5CC
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _0802A5D0
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_0802A4C2:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _0802A4C2
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #4]
	ldr r2, _0802A5CC
	mov r1, r8
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0802A5D4
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
	bl InitStandardTextBoxWindows
	bl sub_08196DF4
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	ldr r4, _0802A5D8
	ldr r1, [r4]
	movs r0, #3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5CC: .4byte 0x040000D4
_0802A5D0: .4byte 0x81000800
_0802A5D4: .4byte 0x082CB430
_0802A5D8: .4byte 0x020229AC
	thumb_func_end sub_0802A49C

	thumb_func_start sub_0802A5DC
sub_0802A5DC: @ 0x0802A5DC
	push {lr}
	sub sp, #4
	ldr r0, _0802A5F8
	ldr r0, [r0]
	ldr r2, _0802A5FC
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #5
	bhi _0802A676
	lsls r0, r0, #2
	ldr r1, _0802A600
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A5F8: .4byte 0x020229AC
_0802A5FC: .4byte 0x00003018
_0802A600: .4byte 0x0802A604
_0802A604: @ jump table
	.4byte _0802A61C @ case 0
	.4byte _0802A62C @ case 1
	.4byte _0802A632 @ case 2
	.4byte _0802A640 @ case 3
	.4byte _0802A658 @ case 4
	.4byte _0802A666 @ case 5
_0802A61C:
	ldr r0, _0802A628
	movs r1, #0
	movs r2, #0x40
	bl LoadPalette
	b _0802A67E
	.align 2, 0
_0802A628: .4byte 0x082CB67C
_0802A62C:
	bl reset_temp_tile_data_buffers
	b _0802A67E
_0802A632:
	ldr r1, _0802A63C
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	b _0802A648
	.align 2, 0
_0802A63C: .4byte 0x082CB910
_0802A640:
	ldr r1, _0802A654
	movs r0, #0
	str r0, [sp]
	movs r0, #1
_0802A648:
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	b _0802A67E
	.align 2, 0
_0802A654: .4byte 0x082CC1A0
_0802A658:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802A67E
	b _0802A68C
_0802A666:
	movs r0, #3
	bl stdpal_get
	movs r1, #0xd0
	movs r2, #0x20
	bl LoadPalette
	b _0802A67E
_0802A676:
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	b _0802A68E
_0802A67E:
	ldr r0, _0802A694
	ldr r1, [r0]
	ldr r0, _0802A698
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0802A68C:
	movs r0, #0
_0802A68E:
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0802A694: .4byte 0x020229AC
_0802A698: .4byte 0x00003018
	thumb_func_end sub_0802A5DC

