.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08124DF4
sub_08124DF4: @ 0x08124DF4
	push {r4, lr}
	sub sp, #4
	ldr r4, _08124E08
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _08124E0C
	cmp r1, #1
	beq _08124E26
	b _08124F02
	.align 2, 0
_08124E08: .4byte 0x02039E14
_08124E0C:
	movs r0, #1
	rsbs r0, r0, #0
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, [r4]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	b _08124F02
_08124E26:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08124F02
	bl FreeRegionMapIconResources
	ldr r1, [r4]
	ldr r2, _08124E50
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08124EE8
	ldrh r0, [r1, #8]
	cmp r0, #0xf
	beq _08124E80
	cmp r0, #0xf
	bgt _08124E54
	cmp r0, #0
	beq _08124E6C
	b _08124EA4
	.align 2, 0
_08124E50: .4byte 0x00000A72
_08124E54:
	cmp r0, #0x3a
	beq _08124E64
	cmp r0, #0x49
	bne _08124EA4
	movs r0, #0x15
	bl SetWarpDestinationToHealLocation
	b _08124EE2
_08124E64:
	movs r0, #0x16
	bl SetWarpDestinationToHealLocation
	b _08124EE2
_08124E6C:
	ldr r0, _08124E7C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	movs r1, #0xd
	cmp r0, #0
	bne _08124E98
	movs r1, #0xc
	b _08124E98
	.align 2, 0
_08124E7C: .4byte 0x03005AF0
_08124E80:
	ldr r0, _08124EA0
	bl FlagGet
	lsls r0, r0, #0x18
	movs r1, #0xb
	cmp r0, #0
	beq _08124E98
	ldr r0, [r4]
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _08124E98
	movs r1, #0x14
_08124E98:
	adds r0, r1, #0
	bl SetWarpDestinationToHealLocation
	b _08124EE2
	.align 2, 0
_08124EA0: .4byte 0x000008B4
_08124EA4:
	ldr r3, _08124EC0
	ldr r0, _08124EC4
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	lsls r0, r1, #1
	adds r2, r0, r1
	adds r0, r3, #2
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08124EC8
	bl SetWarpDestinationToHealLocation
	b _08124EE2
	.align 2, 0
_08124EC0: .4byte 0x0857D72C
_08124EC4: .4byte 0x02039E14
_08124EC8:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	bl SetWarpDestinationToMapWarp
_08124EE2:
	bl sub_080B6134
	b _08124EEE
_08124EE8:
	ldr r0, _08124F0C
	bl SetMainCallback2
_08124EEE:
	ldr r4, _08124F10
	ldr r0, [r4]
	cmp r0, #0
	beq _08124EFE
	bl Free
	movs r0, #0
	str r0, [r4]
_08124EFE:
	bl FreeAllWindowBuffers
_08124F02:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08124F0C: .4byte 0x081B5549
_08124F10: .4byte 0x02039E14
	thumb_func_end sub_08124DF4

	thumb_func_start sub_08124F14
sub_08124F14: @ 0x08124F14
	push {lr}
	ldr r2, _08124F5C
	ldr r1, [r0, #4]
	str r1, [r2]
	ldr r2, _08124F60
	ldrb r1, [r0, #0x1f]
	strb r1, [r2]
	ldr r2, _08124F64
	ldrb r1, [r0, #0x19]
	strb r1, [r2]
	ldr r2, _08124F68
	ldrb r1, [r0, #0x1a]
	strb r1, [r2]
	ldr r2, _08124F6C
	ldrb r1, [r0, #0x1b]
	strb r1, [r2]
	ldr r2, _08124F70
	ldrb r1, [r0, #0x1c]
	strb r1, [r2]
	ldr r2, _08124F74
	ldrb r1, [r0, #0x1d]
	strb r1, [r2]
	ldr r2, _08124F78
	ldrb r1, [r0, #0x1e]
	strb r1, [r2]
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #0x22
	bls _08124F50
	b _0812509C
_08124F50:
	lsls r0, r0, #2
	ldr r1, _08124F7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08124F5C: .4byte 0x03005EA4
_08124F60: .4byte 0x03005EB8
_08124F64: .4byte 0x03005EA0
_08124F68: .4byte 0x03005EB4
_08124F6C: .4byte 0x03005EB0
_08124F70: .4byte 0x03005EA8
_08124F74: .4byte 0x03005EBC
_08124F78: .4byte 0x03005EAC
_08124F7C: .4byte 0x08124F80
_08124F80: @ jump table
	.4byte _0812500C @ case 0
	.4byte _0812509C @ case 1
	.4byte _0812509C @ case 2
	.4byte _0812509C @ case 3
	.4byte _0812506C @ case 4
	.4byte _0812509C @ case 5
	.4byte _08125012 @ case 6
	.4byte _08125018 @ case 7
	.4byte _0812502C @ case 8
	.4byte _0812503E @ case 9
	.4byte _0812509C @ case 10
	.4byte _08125054 @ case 11
	.4byte _0812509C @ case 12
	.4byte _0812509C @ case 13
	.4byte _0812509C @ case 14
	.4byte _0812509C @ case 15
	.4byte _0812509C @ case 16
	.4byte _0812509C @ case 17
	.4byte _0812509C @ case 18
	.4byte _0812509C @ case 19
	.4byte _0812509C @ case 20
	.4byte _0812509C @ case 21
	.4byte _0812509C @ case 22
	.4byte _0812509C @ case 23
	.4byte _0812509C @ case 24
	.4byte _0812509C @ case 25
	.4byte _0812509C @ case 26
	.4byte _0812509C @ case 27
	.4byte _0812505A @ case 28
	.4byte _08125038 @ case 29
	.4byte _08125060 @ case 30
	.4byte _08125066 @ case 31
	.4byte _0812509C @ case 32
	.4byte _0812509C @ case 33
	.4byte _08125078 @ case 34
_0812500C:
	bl sub_08125218
	b _0812509C
_08125012:
	bl sub_081252D0
	b _0812509C
_08125018:
	bl sub_081254C8
	ldr r0, _08125028
	ldrb r0, [r0]
	bl sub_0812538C
	b _0812509C
	.align 2, 0
_08125028: .4byte 0x03005EB8
_0812502C:
	bl sub_081254C8
	bl sub_08125618
	bl sub_08125430
_08125038:
	bl sub_08125618
	b _0812509C
_0812503E:
	bl sub_081254C8
	bl sub_081257E0
	bl sub_081257E0
	bl sub_08125888
	bl sub_08125430
	b _0812509C
_08125054:
	bl sub_081256B0
	b _0812509C
_0812505A:
	bl sub_081254C8
	b _0812509C
_08125060:
	bl sub_081257E0
	b _0812509C
_08125066:
	bl sub_08125888
	b _0812509C
_0812506C:
	bl sub_08125238
	movs r0, #3
	bl sub_081250A0
	b _0812509C
_08125078:
	bl sub_081254C8
	bl sub_081257E0
	bl sub_08125888
	bl sub_08125430
	bl sub_081252D0
	bl sub_081252D0
	movs r0, #2
	bl sub_081250A0
	movs r0, #4
	bl sub_08125158
_0812509C:
	pop {r0}
	bx r0
	thumb_func_end sub_08124F14

	thumb_func_start sub_081250A0
sub_081250A0: @ 0x081250A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r2, #0
	ldr r0, _08125140
	mov r8, r0
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08125132
	ldr r1, _08125144
	mov ip, r1
	ldr r3, _08125148
	mov sl, r3
	ldr r0, _0812514C
	mov sb, r0
_081250C6:
	ldr r1, _08125150
	ldrb r0, [r1]
	adds r0, r0, r2
	mov r3, sl
	ldrb r1, [r3]
	muls r0, r1, r0
	lsls r0, r0, #1
	ldr r3, _08125154
	ldr r1, [r3]
	adds r1, r1, r0
	mov r3, sb
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r3, r1, r0
	movs r4, #0
	adds r5, r2, #1
	mov r0, ip
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08125126
	movs r6, #0x80
	lsls r6, r6, #8
_081250F2:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08125116
	movs r0, #0x1f
	ands r0, r1
	adds r0, r0, r7
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _0812510C
	movs r2, #0x1f
_0812510C:
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r3]
_08125116:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r3, #2
	mov r1, ip
	ldrb r1, [r1]
	cmp r4, r1
	blo _081250F2
_08125126:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	cmp r2, r3
	blo _081250C6
_08125132:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125140: .4byte 0x03005EA8
_08125144: .4byte 0x03005EB0
_08125148: .4byte 0x03005EBC
_0812514C: .4byte 0x03005EA0
_08125150: .4byte 0x03005EB4
_08125154: .4byte 0x03005EA4
	thumb_func_end sub_081250A0

	thumb_func_start sub_08125158
sub_08125158: @ 0x08125158
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r2, #0
	ldr r0, _08125200
	ldrb r0, [r0]
	cmp r2, r0
	bhs _081251F0
	ldr r1, _08125204
	mov sl, r1
_08125176:
	ldr r3, _08125208
	ldrb r0, [r3]
	adds r0, r0, r2
	ldr r3, _0812520C
	ldrb r1, [r3]
	muls r0, r1, r0
	lsls r0, r0, #1
	ldr r3, _08125210
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r3, _08125214
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r3, r1, r0
	movs r5, #0
	adds r7, r2, #1
	mov r0, sl
	ldrb r0, [r0]
	cmp r5, r0
	bhs _081251E4
	movs r1, #0x80
	lsls r1, r1, #8
	mov sb, r1
	movs r0, #0x1f
	mov ip, r0
	mov r1, r8
	subs r6, r0, r1
_081251AC:
	ldrh r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _081251D4
	movs r4, #0x1f
	mov r2, ip
	ands r2, r1
	cmp r2, r6
	ble _081251CA
	mov r1, r8
	lsrs r0, r1, #1
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_081251CA:
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r3]
_081251D4:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r3, #2
	mov r0, sl
	ldrb r0, [r0]
	cmp r5, r0
	blo _081251AC
_081251E4:
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08125200
	ldrb r1, [r1]
	cmp r2, r1
	blo _08125176
_081251F0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125200: .4byte 0x03005EA8
_08125204: .4byte 0x03005EB0
_08125208: .4byte 0x03005EB4
_0812520C: .4byte 0x03005EBC
_08125210: .4byte 0x03005EA4
_08125214: .4byte 0x03005EA0
	thumb_func_end sub_08125158

	thumb_func_start sub_08125218
sub_08125218: @ 0x08125218
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08125234
_0812521E:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl sub_0812593C
	adds r4, #1
	cmp r4, r5
	bls _0812521E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08125234: .4byte 0x00000C7F
	thumb_func_end sub_08125218

	thumb_func_start sub_08125238
sub_08125238: @ 0x08125238
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
	ldr r0, _081252B8
	ldrb r0, [r0]
	cmp r2, r0
	bhs _081252AA
	ldr r0, _081252BC
	mov r8, r0
	ldr r3, _081252C0
_08125250:
	ldr r0, _081252C4
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _081252C8
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r1, r0
	ldr r0, _081252CC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r5, #0
	adds r6, r2, #1
	ldrb r0, [r3]
	cmp r5, r0
	bhs _0812529E
	movs r0, #0x80
	lsls r0, r0, #8
	adds r7, r0, #0
_0812527C:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, #0
	bne _08125290
	adds r0, r4, #0
	str r3, [sp]
	bl ConvertColorToGrayscale
	strh r0, [r4]
	ldr r3, [sp]
_08125290:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #2
	ldrb r0, [r3]
	cmp r5, r0
	blo _0812527C
_0812529E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081252B8
	ldrb r0, [r0]
	cmp r2, r0
	blo _08125250
_081252AA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081252B8: .4byte 0x03005EA8
_081252BC: .4byte 0x03005EA4
_081252C0: .4byte 0x03005EB0
_081252C4: .4byte 0x03005EB4
_081252C8: .4byte 0x03005EBC
_081252CC: .4byte 0x03005EA0
	thumb_func_end sub_08125238

	thumb_func_start sub_081252D0
sub_081252D0: @ 0x081252D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r2, #0
	ldr r0, _08125374
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08125366
	ldr r0, _08125378
	mov r8, r0
	ldr r3, _0812537C
_081252E8:
	ldr r0, _08125380
	ldrb r1, [r0]
	ldrb r0, [r3]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r1, r0
	ldr r0, _08125384
	ldrb r0, [r0]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, #1
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, _08125388
	ldrb r0, [r0]
	subs r0, #1
	adds r7, r2, #1
	cmp r5, r0
	bge _0812535A
	ldr r6, _0812537C
_0812531E:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08125344
	ldrb r2, [r6]
	lsls r2, r2, #1
	adds r2, r4, r2
	mov r0, sp
	adds r1, r4, #0
	str r3, [sp, #4]
	bl sub_08125E00
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
	ldr r3, [sp, #4]
_08125344:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, _08125388
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	blt _0812531E
_0812535A:
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08125374
	ldrb r0, [r0]
	cmp r2, r0
	blo _081252E8
_08125366:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125374: .4byte 0x03005EB0
_08125378: .4byte 0x03005EA4
_0812537C: .4byte 0x03005EBC
_08125380: .4byte 0x03005EB4
_08125384: .4byte 0x03005EA0
_08125388: .4byte 0x03005EA8
	thumb_func_end sub_081252D0

	thumb_func_start sub_0812538C
sub_0812538C: @ 0x0812538C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r2, #0
	ldr r0, _08125418
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08125408
	ldr r0, _0812541C
	mov sb, r0
	ldr r3, _08125420
_081253AC:
	ldr r0, _08125424
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _08125428
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r4, sb
	ldr r1, [r4]
	adds r1, r1, r0
	ldr r0, _0812542C
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r5, #0
	adds r6, r2, #1
	ldrb r0, [r3]
	cmp r5, r0
	bhs _081253FC
	movs r0, #0x80
	lsls r0, r0, #8
	adds r7, r0, #0
_081253D8:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, #0
	bne _081253EE
	adds r0, r4, #0
	mov r1, r8
	str r3, [sp]
	bl ConvertCoolColor
	strh r0, [r4]
	ldr r3, [sp]
_081253EE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #2
	ldrb r0, [r3]
	cmp r5, r0
	blo _081253D8
_081253FC:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08125418
	ldrb r0, [r0]
	cmp r2, r0
	blo _081253AC
_08125408:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125418: .4byte 0x03005EA8
_0812541C: .4byte 0x03005EA4
_08125420: .4byte 0x03005EB0
_08125424: .4byte 0x03005EB4
_08125428: .4byte 0x03005EBC
_0812542C: .4byte 0x03005EA0
	thumb_func_end sub_0812538C

	thumb_func_start sub_08125430
sub_08125430: @ 0x08125430
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
	ldr r0, _081254B0
	ldrb r0, [r0]
	cmp r2, r0
	bhs _081254A2
	ldr r0, _081254B4
	mov r8, r0
	ldr r3, _081254B8
_08125448:
	ldr r0, _081254BC
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _081254C0
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r1, r0
	ldr r0, _081254C4
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r5, #0
	adds r6, r2, #1
	ldrb r0, [r3]
	cmp r5, r0
	bhs _08125496
	movs r0, #0x80
	lsls r0, r0, #8
	adds r7, r0, #0
_08125474:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, #0
	bne _08125488
	adds r0, r4, #0
	str r3, [sp]
	bl ConvertToBlackOrWhite
	strh r0, [r4]
	ldr r3, [sp]
_08125488:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #2
	ldrb r0, [r3]
	cmp r5, r0
	blo _08125474
_08125496:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081254B0
	ldrb r0, [r0]
	cmp r2, r0
	blo _08125448
_081254A2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081254B0: .4byte 0x03005EA8
_081254B4: .4byte 0x03005EA4
_081254B8: .4byte 0x03005EB0
_081254BC: .4byte 0x03005EB4
_081254C0: .4byte 0x03005EBC
_081254C4: .4byte 0x03005EA0
	thumb_func_end sub_08125430

	thumb_func_start sub_081254C8
sub_081254C8: @ 0x081254C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	ldr r0, _08125600
	ldrb r0, [r0]
	cmp r7, r0
	bhs _08125554
	ldr r0, _08125604
	mov r8, r0
_081254DE:
	ldr r0, _08125608
	ldrb r1, [r0]
	adds r1, r1, r7
	ldr r0, _0812560C
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r0, _08125610
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r5, r1, r0
	adds r4, r5, #2
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08125C80
	strh r0, [r5]
	movs r6, #1
	adds r5, r4, #0
	ldr r0, _08125614
	ldrb r0, [r0]
	subs r0, #1
	adds r7, #1
	cmp r6, r0
	bge _0812553E
_08125516:
	adds r4, r5, #2
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08125C80
	strh r0, [r5]
	subs r1, r5, #2
	adds r0, r5, #0
	bl sub_08125C80
	strh r0, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r5, r4, #0
	ldr r0, _08125614
	ldrb r0, [r0]
	subs r0, #1
	cmp r6, r0
	blt _08125516
_0812553E:
	subs r1, r5, #2
	adds r0, r5, #0
	bl sub_08125C80
	strh r0, [r5]
	lsls r0, r7, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08125600
	ldrb r0, [r0]
	cmp r7, r0
	blo _081254DE
_08125554:
	movs r6, #0
	ldr r0, _08125614
	ldrb r0, [r0]
	cmp r6, r0
	bhs _081255F4
	ldr r3, _08125604
	mov sb, r3
	ldr r0, _0812560C
	mov r8, r0
_08125566:
	ldr r0, _08125608
	ldrb r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r3, sb
	ldr r2, [r3]
	adds r2, r2, r0
	ldr r0, _08125610
	ldrb r0, [r0]
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r5, r2, r0
	lsls r1, r1, #1
	adds r1, r5, r1
	adds r0, r5, #0
	bl sub_08125C80
	strh r0, [r5]
	movs r7, #1
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r5, r5, r0
	ldr r0, _08125600
	ldrb r0, [r0]
	subs r0, #1
	adds r6, #1
	cmp r7, r0
	bge _081255D8
	ldr r4, _0812560C
_081255A6:
	ldrb r1, [r4]
	lsls r1, r1, #1
	adds r1, r5, r1
	adds r0, r5, #0
	bl sub_08125C80
	strh r0, [r5]
	ldrb r1, [r4]
	lsls r1, r1, #1
	subs r1, r5, r1
	adds r0, r5, #0
	bl sub_08125C80
	strh r0, [r5]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r5, r5, r0
	ldr r0, _08125600
	ldrb r0, [r0]
	subs r0, #1
	cmp r7, r0
	blt _081255A6
_081255D8:
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, r1, #1
	subs r1, r5, r1
	adds r0, r5, #0
	bl sub_08125C80
	strh r0, [r5]
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08125614
	ldrb r0, [r0]
	cmp r6, r0
	blo _08125566
_081255F4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125600: .4byte 0x03005EA8
_08125604: .4byte 0x03005EA4
_08125608: .4byte 0x03005EB4
_0812560C: .4byte 0x03005EBC
_08125610: .4byte 0x03005EA0
_08125614: .4byte 0x03005EB0
	thumb_func_end sub_081254C8

	thumb_func_start sub_08125618
sub_08125618: @ 0x08125618
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
	ldr r0, _08125698
	ldrb r0, [r0]
	cmp r2, r0
	bhs _0812568A
	ldr r0, _0812569C
	mov r8, r0
	ldr r3, _081256A0
_08125630:
	ldr r0, _081256A4
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _081256A8
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r1, r0
	ldr r0, _081256AC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r5, #0
	adds r6, r2, #1
	ldrb r0, [r3]
	cmp r5, r0
	bhs _0812567E
	movs r0, #0x80
	lsls r0, r0, #8
	adds r7, r0, #0
_0812565C:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, #0
	bne _08125670
	adds r0, r4, #0
	str r3, [sp]
	bl InvertColor
	strh r0, [r4]
	ldr r3, [sp]
_08125670:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #2
	ldrb r0, [r3]
	cmp r5, r0
	blo _0812565C
_0812567E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08125698
	ldrb r0, [r0]
	cmp r2, r0
	blo _08125630
_0812568A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125698: .4byte 0x03005EA8
_0812569C: .4byte 0x03005EA4
_081256A0: .4byte 0x03005EB0
_081256A4: .4byte 0x03005EB4
_081256A8: .4byte 0x03005EBC
_081256AC: .4byte 0x03005EA0
	thumb_func_end sub_08125618

	thumb_func_start sub_081256B0
sub_081256B0: @ 0x081256B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _081257DC
	ldr r4, [r0]
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #8
	adds r5, r0, #0
_081256C8:
	movs r7, #0
_081256CA:
	ldrh r0, [r4]
	ands r0, r5
	cmp r0, #0
	bne _081256DA
	adds r0, r4, #0
	bl InvertColor
	strh r0, [r4]
_081256DA:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r4, #2
	cmp r7, #0x3f
	bls _081256CA
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x3f
	bls _081256C8
	movs r7, #0
	ldr r1, _081257DC
	mov sl, r1
	mov r3, sp
	movs r2, #0x80
	lsls r2, r2, #8
	mov sb, r2
_081256FE:
	lsls r0, r7, #1
	mov r2, sl
	ldr r1, [r2]
	adds r4, r1, r0
	ldrh r1, [r4]
	strh r1, [r3]
	mov r1, sb
	strh r1, [r4]
	movs r6, #1
	adds r4, #0x80
	adds r5, r0, #0
_08125714:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	ands r0, r2
	cmp r0, #0
	bne _08125734
	adds r2, r4, #0
	adds r2, #0x80
	mov r0, sp
	adds r1, r4, #0
	str r3, [sp, #4]
	bl sub_08125F20
	strh r0, [r4]
	ldr r3, [sp, #4]
	strh r0, [r3]
_08125734:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, #0x80
	cmp r6, #0x3e
	bls _08125714
	mov r0, sb
	strh r0, [r4]
	mov r1, sl
	ldr r0, [r1]
	adds r4, r0, r5
	ldrh r0, [r4]
	strh r0, [r3]
	mov r2, sb
	strh r2, [r4]
	movs r6, #1
	adds r4, #0x80
	movs r0, #0x80
	lsls r0, r0, #8
	mov r8, r0
_0812575C:
	ldrh r0, [r4]
	mov r1, r8
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x80
	cmp r0, #0
	bne _0812577C
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	str r3, [sp, #4]
	bl sub_08125F20
	strh r0, [r4]
	ldr r3, [sp, #4]
	strh r0, [r3]
_0812577C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, r5, #0
	cmp r6, #0x3e
	bls _0812575C
	mov r2, sb
	strh r2, [r4]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0x3f
	bls _081256FE
	ldr r0, _081257DC
	ldr r4, [r0]
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #8
	mov r8, r0
_081257A2:
	movs r7, #0
	adds r5, r6, #1
_081257A6:
	ldrh r0, [r4]
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _081257B8
	adds r0, r4, #0
	bl InvertColor
	strh r0, [r4]
_081257B8:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r4, #2
	cmp r7, #0x3f
	bls _081257A6
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x3f
	bls _081257A2
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081257DC: .4byte 0x03005EA4
	thumb_func_end sub_081256B0

	thumb_func_start sub_081257E0
sub_081257E0: @ 0x081257E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
	ldr r0, _08125870
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08125862
	ldr r0, _08125874
	mov r8, r0
_081257F6:
	ldr r0, _08125878
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _0812587C
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, _08125880
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, #1
	adds r4, #2
	ldr r0, _08125884
	ldrb r0, [r0]
	subs r0, #1
	adds r6, r2, #1
	cmp r5, r0
	bge _08125856
	movs r0, #0x80
	lsls r0, r0, #8
	adds r7, r0, #0
_0812582E:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, #0
	bne _08125844
	mov r0, sp
	adds r1, r4, #0
	bl sub_08125CDC
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
_08125844:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #2
	ldr r0, _08125884
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	blt _0812582E
_08125856:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08125870
	ldrb r0, [r0]
	cmp r2, r0
	blo _081257F6
_08125862:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125870: .4byte 0x03005EA8
_08125874: .4byte 0x03005EA4
_08125878: .4byte 0x03005EB4
_0812587C: .4byte 0x03005EBC
_08125880: .4byte 0x03005EA0
_08125884: .4byte 0x03005EB0
	thumb_func_end sub_081257E0

	thumb_func_start sub_08125888
sub_08125888: @ 0x08125888
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r2, #0
	ldr r0, _08125924
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08125916
	ldr r0, _08125928
	mov r8, r0
	ldr r7, _0812592C
_081258A0:
	ldr r0, _08125930
	ldrb r1, [r0]
	ldrb r0, [r7]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, _08125934
	ldrb r0, [r0]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, #1
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, _08125938
	ldrb r0, [r0]
	subs r0, #1
	adds r6, r2, #1
	cmp r5, r0
	bge _0812590A
	movs r0, #0x80
	lsls r0, r0, #8
	adds r2, r0, #0
_081258DA:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, #0
	bne _081258F4
	mov r0, sp
	adds r1, r4, #0
	str r2, [sp, #4]
	bl sub_08125CDC
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
	ldr r2, [sp, #4]
_081258F4:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, _08125938
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	blt _081258DA
_0812590A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08125924
	ldrb r0, [r0]
	cmp r2, r0
	blo _081258A0
_08125916:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08125924: .4byte 0x03005EB0
_08125928: .4byte 0x03005EA4
_0812592C: .4byte 0x03005EBC
_08125930: .4byte 0x03005EB4
_08125934: .4byte 0x03005EA0
_08125938: .4byte 0x03005EA8
	thumb_func_end sub_08125888

	thumb_func_start sub_0812593C
sub_0812593C: @ 0x0812593C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r2, sp
	ldr r3, _081259A8
	lsls r1, r0, #1
	add r1, sl
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r3, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r2, #1]
	mov r5, sp
	adds r0, r3, #2
	adds r1, r1, r0
	ldrb r4, [r1]
	lsls r2, r4, #0x18
	lsrs r1, r2, #0x1b
	movs r0, #7
	ands r1, r0
	strh r1, [r5, #2]
	lsrs r2, r2, #0x19
	mov sb, r2
	movs r0, #3
	ands r2, r0
	mov sb, r2
	movs r5, #1
	ands r5, r4
	movs r4, #1
	mov r8, r4
	cmp r8, r1
	bhs _081259EE
	mov r3, sp
_0812598E:
	cmp r5, #0
	bne _081259AC
	mov r0, r8
	lsls r2, r0, #2
	mov r4, sp
	adds r1, r4, r2
	ldrb r0, [r3]
	mov r4, r8
	subs r0, r0, r4
	strb r0, [r1]
	ldrb r0, [r3, #1]
	add r0, r8
	b _081259BE
	.align 2, 0
_081259A8: .4byte 0x0857D884
_081259AC:
	mov r0, r8
	lsls r2, r0, #2
	mov r4, sp
	adds r1, r4, r2
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3, #1]
	subs r0, #1
_081259BE:
	strb r0, [r1, #1]
	add r2, sp
	ldrb r0, [r2]
	cmp r0, #0x3f
	bhi _081259CE
	ldrb r0, [r2, #1]
	cmp r0, #0x3f
	bls _081259D6
_081259CE:
	mov r0, r8
	subs r0, #1
	strh r0, [r3, #2]
	b _081259EE
_081259D6:
	ldrh r0, [r3, #2]
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r2, #2]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrh r0, [r3, #2]
	cmp r8, r0
	blo _0812598E
_081259EE:
	movs r2, #0
	mov r8, r2
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r8, r0
	blo _081259FC
	b _08125AFE
_081259FC:
	movs r3, #0x1f
_081259FE:
	ldr r1, _08125A5C
	mov r4, r8
	lsls r0, r4, #2
	mov r2, sp
	adds r6, r2, r0
	ldrb r0, [r6, #1]
	lsls r0, r0, #7
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r1, r0
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08125AEA
	movs r7, #0x1f
	ands r7, r1
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x15
	ands r5, r3
	lsrs r4, r0, #0x1a
	ands r4, r3
	mov r0, sb
	cmp r0, #0
	blt _08125AE0
	cmp r0, #1
	ble _08125A60
	cmp r0, #3
	bgt _08125AE0
	ldrh r0, [r6, #2]
	adds r1, r7, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	adds r1, r5, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r7, #0x1f
	bls _08125AD4
	movs r7, #0x1f
	b _08125AD4
	.align 2, 0
_08125A5C: .4byte 0x03005EA4
_08125A60:
	mov r1, sl
	lsls r0, r1, #1
	add r0, sl
	ldr r1, _08125A94
	adds r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r0, r0, #3
	movs r1, #7
	ands r0, r1
	movs r1, #3
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	cmp r0, #1
	beq _08125AB0
	cmp r0, #1
	bgt _08125A98
	cmp r0, #0
	beq _08125A9E
	b _08125AE0
	.align 2, 0
_08125A94: .4byte 0x0857D884
_08125A98:
	cmp r0, #2
	beq _08125AC2
	b _08125AE0
_08125A9E:
	ldrh r0, [r6, #2]
	cmp r7, r0
	blo _08125AAC
	subs r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _08125AE0
_08125AAC:
	movs r7, #0
	b _08125AE0
_08125AB0:
	ldrh r0, [r6, #2]
	cmp r5, r0
	blo _08125ABE
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _08125AE0
_08125ABE:
	movs r5, #0
	b _08125AE0
_08125AC2:
	ldrh r0, [r6, #2]
	cmp r4, r0
	blo _08125AD0
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08125AE0
_08125AD0:
	movs r4, #0
	b _08125AE0
_08125AD4:
	cmp r5, #0x1f
	bls _08125ADA
	movs r5, #0x1f
_08125ADA:
	cmp r4, #0x1f
	bls _08125AE0
	movs r4, #0x1f
_08125AE0:
	lsls r0, r4, #0xa
	lsls r1, r5, #5
	orrs r0, r1
	orrs r7, r0
	strh r7, [r2]
_08125AEA:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r8, r0
	bhs _08125AFE
	b _081259FE
_08125AFE:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812593C

	thumb_func_start ConvertColorToGrayscale
ConvertColorToGrayscale: @ 0x08125B10
	ldrh r2, [r0]
	movs r0, #0x1f
	adds r1, r2, #0
	ands r1, r0
	asrs r3, r2, #5
	ands r3, r0
	asrs r2, r2, #0xa
	ands r2, r0
	movs r0, #0x4c
	muls r1, r0, r1
	movs r0, #0x97
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r1, r1, r0
	asrs r1, r1, #8
	lsls r0, r1, #0xa
	lsls r2, r1, #5
	orrs r0, r2
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	thumb_func_end ConvertColorToGrayscale

	thumb_func_start ConvertCoolColor
ConvertCoolColor: @ 0x08125B44
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldrh r0, [r0]
	movs r2, #0x1f
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x15
	ands r3, r2
	lsrs r0, r0, #0x1a
	ands r0, r2
	cmp r1, #0x10
	bhi _08125B74
	cmp r3, #0x10
	bhi _08125B74
	cmp r0, #0x10
	bhi _08125B74
	adds r0, r4, #0
	bl GetCoolColorFromPersonality
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08125B76
_08125B74:
	ldr r0, _08125B7C
_08125B76:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08125B7C: .4byte 0x00007FFF
	thumb_func_end ConvertCoolColor

	thumb_func_start GetCoolColorFromPersonality
GetCoolColorFromPersonality: @ 0x08125B80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov r8, r0
	movs r6, #0
	movs r7, #0
	adds r0, r4, #0
	movs r1, #6
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _08125C38
	lsls r0, r0, #2
	ldr r1, _08125BC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08125BC4: .4byte 0x08125BC8
_08125BC8: @ jump table
	.4byte _08125BE0 @ case 0
	.4byte _08125BF0 @ case 1
	.4byte _08125C00 @ case 2
	.4byte _08125C0E @ case 3
	.4byte _08125C1C @ case 4
	.4byte _08125C2A @ case 5
_08125BE0:
	movs r0, #0x15
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	movs r1, #0
	mov r8, r1
	b _08125C38
_08125BF0:
	movs r7, #0
	movs r0, #0x15
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r6, r8
	b _08125C38
_08125C00:
	movs r0, #0x15
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r6, #0
	mov r8, r7
	b _08125C38
_08125C0E:
	movs r7, #0
	movs r6, #0
	movs r0, #0x17
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08125C36
_08125C1C:
	movs r0, #0x17
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r6, #0
	mov r8, r6
	b _08125C38
_08125C2A:
	movs r7, #0
	movs r0, #0x17
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
_08125C36:
	mov r8, r0
_08125C38:
	lsls r0, r7, #0xa
	lsls r1, r6, #5
	orrs r0, r1
	mov r1, r8
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetCoolColorFromPersonality

	thumb_func_start ConvertToBlackOrWhite
ConvertToBlackOrWhite: @ 0x08125C50
	push {lr}
	ldrh r0, [r0]
	movs r2, #0x1f
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x15
	ands r3, r2
	lsrs r0, r0, #0x1a
	ands r0, r2
	cmp r1, #0x10
	bhi _08125C74
	cmp r3, #0x10
	bhi _08125C74
	cmp r0, #0x10
	bhi _08125C74
	movs r0, #0
	b _08125C76
_08125C74:
	ldr r0, _08125C7C
_08125C76:
	pop {r1}
	bx r1
	.align 2, 0
_08125C7C: .4byte 0x00007FFF
	thumb_func_end ConvertToBlackOrWhite

	thumb_func_start sub_08125C80
sub_08125C80: @ 0x08125C80
	push {r4, lr}
	adds r4, r0, #0
	ldrh r3, [r4]
	cmp r3, #0
	beq _08125CA8
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	beq _08125C9A
	adds r0, r2, #0
	b _08125CAA
_08125C9A:
	ldrh r1, [r1]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08125CA8
	ldrh r0, [r4]
	b _08125CAA
_08125CA8:
	movs r0, #0
_08125CAA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_08125C80

	thumb_func_start InvertColor
InvertColor: @ 0x08125CB0
	push {r4, lr}
	ldrh r1, [r0]
	movs r0, #0x1f
	movs r3, #0x1f
	ands r3, r1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x15
	lsrs r1, r1, #0x1a
	subs r3, r0, r3
	adds r4, r0, #0
	bics r4, r2
	adds r2, r4, #0
	bics r0, r1
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end InvertColor

	thumb_func_start sub_08125CDC
sub_08125CDC: @ 0x08125CDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	ldrh r4, [r0]
	ldrh r5, [r7]
	lsls r6, r4, #0x10
	lsls r0, r5, #0x10
	mov ip, r0
	cmp r4, r5
	beq _08125D4E
	mov r2, sp
	movs r3, #0x1f
	movs r1, #0x1f
	adds r0, r1, #0
	ands r0, r4
	strh r0, [r2]
	lsrs r0, r6, #0x15
	ands r0, r3
	strh r0, [r2, #2]
	lsrs r0, r6, #0x1a
	ands r0, r3
	strh r0, [r2, #4]
	mov r0, sp
	ands r1, r5
	strh r1, [r0, #6]
	mov r1, sp
	mov r2, ip
	lsrs r0, r2, #0x15
	ands r0, r3
	strh r0, [r1, #8]
	lsrs r0, r2, #0x1a
	ands r0, r3
	strh r0, [r1, #0xa]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #0x19
	bls _08125D36
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r0, #0x19
	bls _08125D36
	mov r0, sp
	ldrh r0, [r0, #4]
	cmp r0, #0x19
	bhi _08125D4E
_08125D36:
	mov r0, sp
	ldrh r0, [r0, #6]
	cmp r0, #0x19
	bls _08125D52
	mov r0, sp
	ldrh r0, [r0, #8]
	cmp r0, #0x19
	bls _08125D52
	mov r0, sp
	ldrh r0, [r0, #0xa]
	cmp r0, #0x19
	bls _08125D52
_08125D4E:
	ldrh r0, [r7]
	b _08125DF8
_08125D52:
	movs r4, #0
	add r6, sp, #0xc
	mov r7, sp
	adds r7, #6
	adds r5, r6, #0
_08125D5C:
	lsls r2, r4, #1
	mov r1, sp
	adds r0, r1, r2
	adds r1, r7, r2
	ldrh r3, [r0]
	ldrh r0, [r1]
	cmp r3, r0
	bls _08125D72
	adds r1, r5, r2
	subs r0, r3, r0
	b _08125D76
_08125D72:
	adds r1, r5, r2
	subs r0, r0, r3
_08125D76:
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08125D5C
	adds r1, r6, #0
	ldrh r0, [r1, #2]
	ldrh r3, [r1]
	cmp r3, r0
	blo _08125D9C
	ldrh r2, [r1, #4]
	cmp r3, r2
	blo _08125D96
	adds r2, r3, #0
	b _08125DB0
_08125D96:
	cmp r0, r2
	bhs _08125DA2
	b _08125DAA
_08125D9C:
	ldrh r2, [r1, #4]
	cmp r0, r2
	blo _08125DA6
_08125DA2:
	ldrh r2, [r1, #2]
	b _08125DB0
_08125DA6:
	cmp r2, r3
	blo _08125DAE
_08125DAA:
	ldrh r2, [r1, #4]
	b _08125DB0
_08125DAE:
	ldrh r2, [r6]
_08125DB0:
	mov r0, sp
	ldrh r1, [r0, #6]
	lsrs r0, r2, #1
	movs r6, #0x1f
	subs r6, r6, r0
	adds r0, r1, #0
	muls r0, r6, r0
	movs r1, #0x1f
	bl __divsi3
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sp
	ldrh r0, [r0, #8]
	muls r0, r6, r0
	movs r1, #0x1f
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sp
	ldrh r0, [r0, #0xa]
	muls r0, r6, r0
	movs r1, #0x1f
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #6
	lsls r4, r4, #5
	orrs r0, r4
	orrs r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r5, #0
_08125DF8:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08125CDC

	thumb_func_start sub_08125E00
sub_08125E00: @ 0x08125E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r3, r0, #0
	mov sl, r1
	str r2, [sp]
	ldrh r1, [r3]
	mov r0, sl
	ldrh r0, [r0]
	cmp r1, r0
	bne _08125E28
	ldrh r0, [r2]
	cmp r0, r1
	bne _08125E28
	mov r1, sl
	ldrh r0, [r1]
	b _08125F10
_08125E28:
	mov r2, sl
	ldrh r0, [r2]
	movs r1, #0x1f
	mov sb, r1
	movs r4, #0x1f
	adds r5, r4, #0
	ands r5, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x15
	mov r1, sb
	ands r1, r2
	mov r8, r1
	lsrs r0, r0, #0x1a
	mov r2, sb
	ands r2, r0
	str r2, [sp, #4]
	ldrh r2, [r3]
	adds r0, r4, #0
	ands r0, r2
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x15
	mov r3, sb
	ands r1, r3
	adds r0, r0, r1
	lsrs r2, r2, #0x1a
	ands r2, r3
	adds r0, r0, r2
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r3, [sp]
	ldrh r1, [r3]
	ands r4, r1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, sb
	ands r0, r2
	adds r4, r4, r0
	lsrs r1, r1, #0x1a
	ands r1, r2
	adds r4, r4, r1
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r7, r6
	bne _08125EAA
	cmp r1, r6
	bne _08125EAA
	mov r3, sl
	ldrh r0, [r3]
	b _08125F10
_08125EAA:
	cmp r7, r6
	bls _08125EB2
	subs r0, r7, r6
	b _08125EB4
_08125EB2:
	subs r0, r6, r7
_08125EB4:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, r6
	bls _08125EC0
	subs r0, r1, r6
	b _08125EC2
_08125EC0:
	subs r0, r6, r1
_08125EC2:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r2, r0
	blo _08125ECC
	adds r0, r2, #0
_08125ECC:
	lsrs r0, r0, #1
	movs r4, #0x1f
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	muls r0, r4, r0
	movs r1, #0x1f
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	muls r0, r4, r0
	movs r1, #0x1f
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, [sp, #4]
	adds r0, r1, #0
	muls r0, r4, r0
	movs r1, #0x1f
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #6
	mov r2, r8
	lsls r1, r2, #5
	orrs r0, r1
	orrs r5, r0
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
_08125F10:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08125E00

	thumb_func_start sub_08125F20
sub_08125F20: @ 0x08125F20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r3, r0, #0
	mov sl, r1
	str r2, [sp]
	ldrh r1, [r3]
	mov r0, sl
	ldrh r0, [r0]
	cmp r1, r0
	bne _08125F48
	ldrh r0, [r2]
	cmp r0, r1
	bne _08125F48
	mov r1, sl
	ldrh r0, [r1]
	b _0812602E
_08125F48:
	mov r2, sl
	ldrh r0, [r2]
	movs r1, #0x1f
	mov sb, r1
	movs r4, #0x1f
	adds r5, r4, #0
	ands r5, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x15
	mov r1, sb
	ands r1, r2
	mov r8, r1
	lsrs r0, r0, #0x1a
	mov r2, sb
	ands r2, r0
	str r2, [sp, #4]
	ldrh r2, [r3]
	adds r0, r4, #0
	ands r0, r2
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x15
	mov r3, sb
	ands r1, r3
	adds r0, r0, r1
	lsrs r2, r2, #0x1a
	ands r2, r3
	adds r0, r0, r2
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r3, [sp]
	ldrh r1, [r3]
	ands r4, r1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, sb
	ands r0, r2
	adds r4, r4, r0
	lsrs r1, r1, #0x1a
	ands r1, r2
	adds r4, r4, r1
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r7, r6
	bne _08125FCA
	cmp r1, r6
	bne _08125FCA
	mov r3, sl
	ldrh r0, [r3]
	b _0812602E
_08125FCA:
	cmp r7, r6
	bls _08125FD2
	subs r0, r7, r6
	b _08125FD4
_08125FD2:
	subs r0, r6, r7
_08125FD4:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, r6
	bls _08125FE0
	subs r0, r1, r6
	b _08125FE2
_08125FE0:
	subs r0, r6, r1
_08125FE2:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r2, r0
	blo _08125FEC
	adds r0, r2, #0
_08125FEC:
	movs r4, #0x1f
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	muls r0, r4, r0
	movs r1, #0x1f
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	muls r0, r4, r0
	movs r1, #0x1f
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, [sp, #4]
	adds r0, r1, #0
	muls r0, r4, r0
	movs r1, #0x1f
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #6
	mov r2, r8
	lsls r1, r2, #5
	orrs r0, r1
	orrs r5, r0
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
_0812602E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08125F20

	thumb_func_start sub_08126040
sub_08126040: @ 0x08126040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldrb r1, [r0, #0x1d]
	lsrs r5, r1, #3
	ldrb r1, [r0, #0x1e]
	lsrs r1, r1, #3
	str r1, [sp, #8]
	ldr r1, [r0, #4]
	str r1, [sp]
	ldr r2, [r0, #0x10]
	str r2, [sp, #4]
	ldrh r0, [r0, #0x16]
	cmp r0, #2
	bne _081260F0
	movs r1, #0
	ldr r0, [sp, #8]
	cmp r1, r0
	blo _0812606E
	b _0812617C
_0812606E:
	movs r0, #0
	adds r2, r1, #1
	mov sl, r2
	cmp r0, r5
	bhs _081260E2
	adds r2, r1, #0
	muls r2, r5, r2
	mov sb, r2
	lsls r1, r1, #3
	mov r8, r1
_08126082:
	movs r4, #0
	lsls r6, r0, #4
	adds r7, r0, #1
	add r0, sb
	lsls r0, r0, #6
	ldr r1, [sp, #4]
	adds r1, r1, r0
	mov ip, r1
_08126092:
	lsls r0, r4, #3
	mov r2, ip
	adds r3, r2, r0
	mov r1, r8
	adds r0, r1, r4
	lsls r0, r0, #3
	muls r0, r5, r0
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r2, r0
	adds r2, r0, r6
	ldrh r0, [r2, #2]
	lsls r0, r0, #8
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r3]
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	ldrh r1, [r2, #4]
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r2, #0xa]
	lsls r0, r0, #8
	ldrh r1, [r2, #8]
	orrs r0, r1
	strh r0, [r3, #4]
	ldrh r0, [r2, #0xe]
	lsls r0, r0, #8
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r3, #6]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #7
	bls _08126092
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	blo _08126082
_081260E2:
	mov r1, sl
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	ldr r2, [sp, #8]
	cmp r1, r2
	blo _0812606E
	b _0812617C
_081260F0:
	movs r1, #0
	ldr r0, [sp, #8]
	cmp r1, r0
	bhs _0812617C
_081260F8:
	movs r0, #0
	adds r2, r1, #1
	mov sl, r2
	cmp r0, r5
	bhs _08126170
	adds r2, r1, #0
	muls r2, r5, r2
	mov sb, r2
	lsls r1, r1, #3
	mov r8, r1
_0812610C:
	movs r4, #0
	lsls r6, r0, #4
	adds r7, r0, #1
	add r0, sb
	lsls r0, r0, #5
	ldr r1, [sp, #4]
	adds r1, r1, r0
	mov ip, r1
_0812611C:
	lsls r0, r4, #2
	mov r2, ip
	adds r3, r2, r0
	mov r1, r8
	adds r0, r1, r4
	lsls r0, r0, #3
	muls r0, r5, r0
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r2, r0
	adds r2, r0, r6
	ldrh r1, [r2, #2]
	lsls r1, r1, #4
	ldrh r0, [r2]
	orrs r1, r0
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldrh r0, [r2, #6]
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r3]
	ldrh r1, [r2, #0xa]
	lsls r1, r1, #4
	ldrh r0, [r2, #8]
	orrs r1, r0
	ldrh r0, [r2, #0xc]
	lsls r0, r0, #8
	orrs r1, r0
	ldrh r0, [r2, #0xe]
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r3, #2]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #7
	bls _0812611C
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	blo _0812610C
_08126170:
	mov r1, sl
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	ldr r2, [sp, #8]
	cmp r1, r2
	blo _081260F8
_0812617C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08126040

	thumb_func_start sub_0812618C
sub_0812618C: @ 0x0812618C
	push {lr}
	ldr r2, _081261DC
	ldrb r1, [r0, #0x18]
	lsls r1, r1, #4
	strh r1, [r2]
	ldr r3, _081261E0
	ldrh r2, [r2]
	lsls r2, r2, #1
	ldr r1, [r0, #8]
	adds r1, r1, r2
	str r1, [r3]
	ldr r2, _081261E4
	ldr r1, [r0, #4]
	str r1, [r2]
	ldr r2, _081261E8
	ldrb r1, [r0, #0x19]
	strb r1, [r2]
	ldr r2, _081261EC
	ldrb r1, [r0, #0x1a]
	strb r1, [r2]
	ldr r2, _081261F0
	ldrb r1, [r0, #0x1b]
	strb r1, [r2]
	ldr r2, _081261F4
	ldrb r1, [r0, #0x1c]
	strb r1, [r2]
	ldr r2, _081261F8
	ldrb r1, [r0, #0x1d]
	strb r1, [r2]
	ldr r2, _081261FC
	ldrb r1, [r0, #0x1e]
	strb r1, [r2]
	ldrh r0, [r0, #0x14]
	cmp r0, #5
	bhi _08126252
	lsls r0, r0, #2
	ldr r1, _08126200
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081261DC: .4byte 0x03005EC4
_081261E0: .4byte 0x03005EC0
_081261E4: .4byte 0x03005EA4
_081261E8: .4byte 0x03005EA0
_081261EC: .4byte 0x03005EB4
_081261F0: .4byte 0x03005EB0
_081261F4: .4byte 0x03005EA8
_081261F8: .4byte 0x03005EBC
_081261FC: .4byte 0x03005EAC
_08126200: .4byte 0x08126204
_08126204: @ jump table
	.4byte _0812621C @ case 0
	.4byte _08126224 @ case 1
	.4byte _0812622C @ case 2
	.4byte _08126236 @ case 3
	.4byte _08126240 @ case 4
	.4byte _0812624A @ case 5
_0812621C:
	movs r0, #0
	bl sub_0812638C
	b _08126252
_08126224:
	movs r0, #1
	bl sub_0812638C
	b _08126252
_0812622C:
	bl sub_08126258
	bl sub_081266FC
	b _08126252
_08126236:
	bl sub_08126358
	bl sub_0812664C
	b _08126252
_08126240:
	bl sub_0812631C
	bl sub_0812659C
	b _08126252
_0812624A:
	bl sub_08126300
	bl sub_081264E4
_08126252:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0812618C

	thumb_func_start sub_08126258
sub_08126258: @ 0x08126258
	ldr r2, _081262C0
	ldr r1, [r2]
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r2]
	ldr r2, _081262C4
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r2, _081262C8
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r2, _081262CC
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r2, _081262D0
	adds r1, r2, #0
	strh r1, [r0, #8]
	ldr r2, _081262D4
	adds r1, r2, #0
	strh r1, [r0, #0xa]
	ldr r2, _081262D8
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	ldr r2, _081262DC
	adds r1, r2, #0
	strh r1, [r0, #0xe]
	ldr r2, _081262E0
	adds r1, r2, #0
	strh r1, [r0, #0x10]
	ldr r2, _081262E4
	adds r1, r2, #0
	strh r1, [r0, #0x12]
	ldr r2, _081262E8
	adds r1, r2, #0
	strh r1, [r0, #0x14]
	ldr r2, _081262EC
	adds r1, r2, #0
	strh r1, [r0, #0x16]
	ldr r2, _081262F0
	adds r1, r2, #0
	strh r1, [r0, #0x18]
	ldr r2, _081262F4
	adds r1, r2, #0
	strh r1, [r0, #0x1a]
	ldr r2, _081262F8
	adds r1, r2, #0
	strh r1, [r0, #0x1c]
	ldr r2, _081262FC
	adds r1, r2, #0
	strh r1, [r0, #0x1e]
	bx lr
	.align 2, 0
_081262C0: .4byte 0x03005EC0
_081262C4: .4byte 0x000018C6
_081262C8: .4byte 0x000077BD
_081262CC: .4byte 0x00002D6B
_081262D0: .4byte 0x000018DD
_081262D4: .4byte 0x00001BA6
_081262D8: .4byte 0x000074C6
_081262DC: .4byte 0x00001BBD
_081262E0: .4byte 0x000074DD
_081262E4: .4byte 0x000077A6
_081262E8: .4byte 0x0000197D
_081262EC: .4byte 0x00001BAB
_081262F0: .4byte 0x00007566
_081262F4: .4byte 0x00002CDD
_081262F8: .4byte 0x00002FA6
_081262FC: .4byte 0x000074CB
	thumb_func_end sub_08126258

	thumb_func_start sub_08126300
sub_08126300: @ 0x08126300
	ldr r2, _08126314
	ldr r0, [r2]
	movs r1, #0
	strh r1, [r0]
	ldr r2, [r2]
	strh r1, [r2, #2]
	ldr r1, _08126318
	adds r0, r1, #0
	strh r0, [r2, #4]
	bx lr
	.align 2, 0
_08126314: .4byte 0x03005EC0
_08126318: .4byte 0x00007FFF
	thumb_func_end sub_08126300

	thumb_func_start sub_0812631C
sub_0812631C: @ 0x0812631C
	push {r4, r5, lr}
	ldr r1, _08126354
	ldr r0, [r1]
	movs r2, #0
	strh r2, [r0]
	ldr r0, [r1]
	strh r2, [r0, #2]
	movs r4, #0
	adds r5, r1, #0
_0812632E:
	ldr r0, [r5]
	lsls r2, r4, #1
	adds r2, r2, r0
	adds r0, r4, #2
	lsls r3, r0, #1
	lsls r1, r0, #0xb
	lsls r0, r0, #6
	orrs r1, r0
	orrs r1, r3
	strh r1, [r2, #4]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xd
	bls _0812632E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126354: .4byte 0x03005EC0
	thumb_func_end sub_0812631C

	thumb_func_start sub_08126358
sub_08126358: @ 0x08126358
	push {r4, lr}
	ldr r2, _08126388
	ldr r1, [r2]
	movs r0, #0
	strh r0, [r1]
	movs r3, #0
	adds r4, r2, #0
_08126366:
	ldr r0, [r4]
	lsls r2, r3, #1
	adds r2, r2, r0
	lsls r0, r3, #0xa
	lsls r1, r3, #5
	orrs r0, r1
	orrs r0, r3
	strh r0, [r2, #2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _08126366
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126388: .4byte 0x03005EC0
	thumb_func_end sub_08126358

	thumb_func_start sub_0812638C
sub_0812638C: @ 0x0812638C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	movs r1, #0xdf
	mov sb, r1
	cmp r0, #0
	bne _081263A4
	movs r2, #0xff
	mov sb, r2
_081263A4:
	movs r6, #0
	ldr r3, _08126428
	mov ip, r3
	mov r0, sb
	lsls r4, r0, #1
	ldr r5, _0812642C
	cmp r6, sb
	bhs _081263C8
	movs r2, #0
_081263B6:
	ldr r0, [r3]
	lsls r1, r6, #1
	adds r1, r1, r0
	strh r2, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, sb
	blo _081263B6
_081263C8:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, _08126430
	adds r1, r2, #0
	strh r1, [r0]
	movs r3, #0
	ldrb r5, [r5]
	cmp r3, r5
	bhs _081264CC
_081263DC:
	ldr r2, _08126434
	ldr r0, _08126438
	ldrb r1, [r0]
	adds r1, r1, r3
	ldr r0, _0812643C
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r0, _08126440
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r6, #0
	ldr r0, _08126444
	adds r2, r0, #0
	adds r3, #1
	mov sl, r3
	ldrb r3, [r2]
	cmp r6, r3
	bhs _081264BE
	ldr r0, _08126448
	mov r8, r0
_0812640C:
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0812644C
	mov r1, r8
	ldrh r0, [r1]
	strh r0, [r4]
	adds r6, #1
	adds r7, r4, #2
	b _081264B2
	.align 2, 0
_08126428: .4byte 0x03005EC0
_0812642C: .4byte 0x03005EA8
_08126430: .4byte 0x00003DEF
_08126434: .4byte 0x03005EA4
_08126438: .4byte 0x03005EB4
_0812643C: .4byte 0x03005EBC
_08126440: .4byte 0x03005EA0
_08126444: .4byte 0x03005EB0
_08126448: .4byte 0x03005EC4
_0812644C:
	adds r0, r4, #0
	bl sub_081267AC
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r3, #1
	adds r6, #1
	adds r7, r4, #2
	cmp r3, sb
	bhs _081264A8
	ldr r0, _08126478
	ldr r2, [r0]
	ldrh r1, [r2, #2]
	mov ip, r0
	cmp r1, #0
	bne _0812647C
	strh r5, [r2, #2]
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #1
	b _081264A6
	.align 2, 0
_08126478: .4byte 0x03005EC0
_0812647C:
	mov r2, ip
	ldr r1, [r2]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _081264A0
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, sb
	bhs _081264A8
	lsls r0, r3, #1
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	bne _0812647C
	strh r5, [r1]
_081264A0:
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r0, r3
_081264A6:
	strh r0, [r4]
_081264A8:
	ldr r2, _081264DC
	cmp r3, sb
	bne _081264B2
	mov r3, sb
	strh r3, [r4]
_081264B2:
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	adds r4, r7, #0
	ldrb r0, [r2]
	cmp r6, r0
	blo _0812640C
_081264BE:
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _081264E0
	ldrb r0, [r0]
	cmp r3, r0
	blo _081263DC
_081264CC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081264DC: .4byte 0x03005EB0
_081264E0: .4byte 0x03005EA8
	thumb_func_end sub_0812638C

	thumb_func_start sub_081264E4
sub_081264E4: @ 0x081264E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r2, #0
	ldr r0, _08126538
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08126588
	ldr r0, _0812653C
	mov r8, r0
_081264F8:
	ldr r0, _08126540
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _08126544
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, _08126548
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r6, #0
	ldr r0, _0812654C
	adds r3, r0, #0
	adds r7, r2, #1
	ldrb r0, [r3]
	cmp r6, r0
	bhs _0812657C
	ldr r5, _08126550
_08126524:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08126554
	ldrh r0, [r5]
	strh r0, [r4]
	b _0812656E
	.align 2, 0
_08126538: .4byte 0x03005EA8
_0812653C: .4byte 0x03005EA4
_08126540: .4byte 0x03005EB4
_08126544: .4byte 0x03005EBC
_08126548: .4byte 0x03005EA0
_0812654C: .4byte 0x03005EB0
_08126550: .4byte 0x03005EC4
_08126554:
	adds r0, r4, #0
	bl ConvertToBlackOrWhite
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08126566
	ldrh r0, [r5]
	adds r0, #1
	b _0812656A
_08126566:
	ldrh r0, [r5]
	adds r0, #2
_0812656A:
	strh r0, [r4]
	ldr r3, _08126594
_0812656E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, #2
	ldrb r0, [r3]
	cmp r6, r0
	blo _08126524
_0812657C:
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08126598
	ldrb r0, [r0]
	cmp r2, r0
	blo _081264F8
_08126588:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126594: .4byte 0x03005EB0
_08126598: .4byte 0x03005EA8
	thumb_func_end sub_081264E4

	thumb_func_start sub_0812659C
sub_0812659C: @ 0x0812659C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
	ldr r0, _081265F0
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08126638
	ldr r0, _081265F4
	mov r8, r0
_081265B2:
	ldr r0, _081265F8
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _081265FC
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, _08126600
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r5, #0
	ldr r0, _08126604
	adds r7, r2, #1
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0812662C
	ldr r6, _08126608
	movs r0, #0x80
	lsls r0, r0, #8
	adds r2, r0, #0
_081265E2:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0812660C
	ldrh r0, [r6]
	strh r0, [r4]
	b _0812661C
	.align 2, 0
_081265F0: .4byte 0x03005EA8
_081265F4: .4byte 0x03005EA4
_081265F8: .4byte 0x03005EB4
_081265FC: .4byte 0x03005EBC
_08126600: .4byte 0x03005EA0
_08126604: .4byte 0x03005EB0
_08126608: .4byte 0x03005EC4
_0812660C:
	adds r0, r4, #0
	str r2, [sp]
	bl sub_081268F0
	ldrh r1, [r6]
	adds r0, r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_0812661C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #2
	ldr r0, _08126644
	ldrb r0, [r0]
	cmp r5, r0
	blo _081265E2
_0812662C:
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08126648
	ldrb r0, [r0]
	cmp r2, r0
	blo _081265B2
_08126638:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126644: .4byte 0x03005EB0
_08126648: .4byte 0x03005EA8
	thumb_func_end sub_0812659C

	thumb_func_start sub_0812664C
sub_0812664C: @ 0x0812664C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
	ldr r0, _081266A0
	ldrb r0, [r0]
	cmp r2, r0
	bhs _081266E8
	ldr r0, _081266A4
	mov r8, r0
_08126662:
	ldr r0, _081266A8
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _081266AC
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, _081266B0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r5, #0
	ldr r0, _081266B4
	adds r7, r2, #1
	ldrb r0, [r0]
	cmp r5, r0
	bhs _081266DC
	ldr r6, _081266B8
	movs r0, #0x80
	lsls r0, r0, #8
	adds r2, r0, #0
_08126692:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, #0
	beq _081266BC
	ldrh r0, [r6]
	strh r0, [r4]
	b _081266CC
	.align 2, 0
_081266A0: .4byte 0x03005EA8
_081266A4: .4byte 0x03005EA4
_081266A8: .4byte 0x03005EB4
_081266AC: .4byte 0x03005EBC
_081266B0: .4byte 0x03005EA0
_081266B4: .4byte 0x03005EB0
_081266B8: .4byte 0x03005EC4
_081266BC:
	adds r0, r4, #0
	str r2, [sp]
	bl sub_08126924
	ldrh r1, [r6]
	adds r0, r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_081266CC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #2
	ldr r0, _081266F4
	ldrb r0, [r0]
	cmp r5, r0
	blo _08126692
_081266DC:
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081266F8
	ldrb r0, [r0]
	cmp r2, r0
	blo _08126662
_081266E8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081266F4: .4byte 0x03005EB0
_081266F8: .4byte 0x03005EA8
	thumb_func_end sub_0812664C

	thumb_func_start sub_081266FC
sub_081266FC: @ 0x081266FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r2, #0
	ldr r0, _08126750
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08126798
	ldr r0, _08126754
	mov r8, r0
_08126712:
	ldr r0, _08126758
	ldrb r1, [r0]
	adds r1, r1, r2
	ldr r0, _0812675C
	ldrb r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, _08126760
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, r1, r0
	movs r5, #0
	ldr r0, _08126764
	adds r7, r2, #1
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0812678C
	ldr r6, _08126768
	movs r0, #0x80
	lsls r0, r0, #8
	adds r2, r0, #0
_08126742:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0812676C
	ldrh r0, [r6]
	strh r0, [r4]
	b _0812677C
	.align 2, 0
_08126750: .4byte 0x03005EA8
_08126754: .4byte 0x03005EA4
_08126758: .4byte 0x03005EB4
_0812675C: .4byte 0x03005EBC
_08126760: .4byte 0x03005EA0
_08126764: .4byte 0x03005EB0
_08126768: .4byte 0x03005EC4
_0812676C:
	adds r0, r4, #0
	str r2, [sp]
	bl sub_08126820
	ldrh r1, [r6]
	adds r0, r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_0812677C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, #2
	ldr r0, _081267A4
	ldrb r0, [r0]
	cmp r5, r0
	blo _08126742
_0812678C:
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081267A8
	ldrb r0, [r0]
	cmp r2, r0
	blo _08126712
_08126798:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081267A4: .4byte 0x03005EB0
_081267A8: .4byte 0x03005EA8
	thumb_func_end sub_081266FC

	thumb_func_start sub_081267AC
sub_081267AC: @ 0x081267AC
	push {r4, lr}
	ldrh r0, [r0]
	movs r1, #0x1f
	movs r4, #0x1f
	ands r4, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x15
	ands r3, r1
	lsrs r2, r0, #0x1a
	ands r2, r1
	movs r1, #3
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _081267D0
	movs r0, #0x1c
	ands r0, r4
	adds r4, r0, #4
_081267D0:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _081267DE
	movs r0, #0x1c
	ands r0, r3
	adds r3, r0, #4
_081267DE:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _081267EC
	movs r0, #0x1c
	ands r0, r2
	adds r2, r0, #4
_081267EC:
	cmp r4, #5
	bhi _081267F2
	movs r4, #6
_081267F2:
	cmp r4, #0x1e
	bls _081267F8
	movs r4, #0x1e
_081267F8:
	cmp r3, #5
	bhi _081267FE
	movs r3, #6
_081267FE:
	cmp r3, #0x1e
	bls _08126804
	movs r3, #0x1e
_08126804:
	cmp r2, #5
	bhi _0812680A
	movs r2, #6
_0812680A:
	cmp r2, #0x1e
	bls _08126810
	movs r2, #0x1e
_08126810:
	lsls r0, r2, #0xa
	lsls r1, r3, #5
	orrs r0, r1
	orrs r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081267AC

	thumb_func_start sub_08126820
sub_08126820: @ 0x08126820
	push {lr}
	ldrh r0, [r0]
	movs r1, #0x1f
	movs r3, #0x1f
	ands r3, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x15
	ands r2, r1
	lsrs r0, r0, #0x1a
	ands r0, r1
	cmp r3, #0xb
	bhi _08126844
	cmp r2, #0xa
	bhi _08126844
	cmp r0, #0xa
	bhi _08126844
	movs r0, #1
	b _081268EA
_08126844:
	cmp r3, #0x13
	bls _08126868
	cmp r2, #0x13
	bls _08126850
	cmp r0, #0x13
	bhi _08126874
_08126850:
	cmp r3, #0x13
	bls _08126868
	cmp r2, #0x13
	bls _0812685E
	cmp r0, #0xe
	bhi _08126874
	b _081268AC
_0812685E:
	cmp r0, #0x13
	bls _08126868
	cmp r2, #0xe
	bhi _08126874
	b _08126888
_08126868:
	cmp r2, #0x13
	bls _08126878
	cmp r0, #0x13
	bls _08126878
	cmp r3, #0xe
	bls _081268D0
_08126874:
	movs r0, #2
	b _081268EA
_08126878:
	cmp r3, #0x13
	bls _0812689C
	cmp r2, #0xb
	bls _08126890
	cmp r0, #0xb
	bls _0812688C
	cmp r2, r0
	bhs _081268AC
_08126888:
	movs r0, #8
	b _081268EA
_0812688C:
	movs r0, #0xa
	b _081268EA
_08126890:
	cmp r0, #0xb
	bls _08126898
	movs r0, #0xd
	b _081268EA
_08126898:
	movs r0, #4
	b _081268EA
_0812689C:
	cmp r2, #0x13
	bls _081268C0
	cmp r3, #0xb
	bls _081268B4
	cmp r0, #0xb
	bls _081268B0
	cmp r3, r0
	blo _081268D0
_081268AC:
	movs r0, #7
	b _081268EA
_081268B0:
	movs r0, #0xb
	b _081268EA
_081268B4:
	cmp r0, #0xb
	bls _081268BC
	movs r0, #0xe
	b _081268EA
_081268BC:
	movs r0, #5
	b _081268EA
_081268C0:
	cmp r0, #0x13
	bls _081268E8
	cmp r3, #0xb
	bls _081268D4
	cmp r2, #0xb
	bls _081268DC
	cmp r3, r2
	bhs _08126888
_081268D0:
	movs r0, #9
	b _081268EA
_081268D4:
	cmp r2, #0xb
	bls _081268DC
	movs r0, #0xc
	b _081268EA
_081268DC:
	cmp r0, #0xb
	bls _081268E4
	movs r0, #0xf
	b _081268EA
_081268E4:
	movs r0, #6
	b _081268EA
_081268E8:
	movs r0, #3
_081268EA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08126820

	thumb_func_start sub_081268F0
sub_081268F0: @ 0x081268F0
	push {lr}
	ldrh r1, [r0]
	movs r3, #0x1f
	movs r0, #0x1f
	ands r0, r1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x15
	ands r2, r3
	lsrs r1, r1, #0x1a
	ands r1, r3
	adds r0, r0, r2
	adds r0, r0, r1
	movs r1, #3
	bl __divsi3
	movs r1, #0x1e
	ands r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0812691C
	lsrs r0, r0, #0x11
	b _0812691E
_0812691C:
	movs r0, #1
_0812691E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081268F0

	thumb_func_start sub_08126924
sub_08126924: @ 0x08126924
	push {lr}
	ldrh r1, [r0]
	movs r3, #0x1f
	movs r0, #0x1f
	ands r0, r1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x15
	ands r2, r3
	lsrs r1, r1, #0x1a
	ands r1, r3
	adds r0, r0, r2
	adds r0, r0, r1
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end sub_08126924

