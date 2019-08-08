.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetUpFieldMove_SoftBoiled
SetUpFieldMove_SoftBoiled: @ 0x0816140C
	push {r4, r5, r6, lr}
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0x64
	muls r0, r6, r0
	ldr r4, _08161458
	adds r0, r0, r4
	movs r1, #0x3a
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	adds r0, r0, r4
	movs r1, #0x39
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bhi _0816145C
	movs r0, #0
	b _0816145E
	.align 2, 0
_08161458: .4byte 0x02024190
_0816145C:
	movs r0, #1
_0816145E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_SoftBoiled

	thumb_func_start sub_08161464
sub_08161464: @ 0x08161464
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081614A0
	movs r1, #0xa
	strb r1, [r0, #0xb]
	ldrb r1, [r0, #9]
	strb r1, [r0, #0xa]
	bl GetCursorSelectionMonId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_081B0C9C
	movs r0, #5
	bl display_pokemon_menu_message
	ldr r1, _081614A4
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081614A8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081614A0: .4byte 0x0203CB94
_081614A4: .4byte 0x03005B60
_081614A8: .4byte 0x081B1041
	thumb_func_end sub_08161464

	thumb_func_start sub_081614AC
sub_081614AC: @ 0x081614AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp, #4]
	ldr r1, _081614E4
	ldrb r7, [r1, #9]
	mov r8, r7
	ldrb r0, [r1, #0xa]
	adds r5, r0, #0
	cmp r5, #6
	bls _081614F0
	movs r0, #0
	strb r0, [r1, #0xb]
	bl display_pokemon_menu_message
	ldr r1, _081614E8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081614EC
	str r1, [r0]
	b _0816155C
	.align 2, 0
_081614E4: .4byte 0x0203CB94
_081614E8: .4byte 0x03005B60
_081614EC: .4byte 0x081B1041
_081614F0:
	movs r0, #0x64
	mov sl, r0
	mov r0, sl
	muls r0, r5, r0
	ldr r1, _08161528
	mov sb, r1
	adds r6, r0, r1
	adds r0, r6, #0
	movs r1, #0x39
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0816151E
	cmp r7, r5
	beq _0816151E
	adds r0, r6, #0
	movs r1, #0x3a
	bl GetMonData
	cmp r0, r4
	bne _0816152C
_0816151E:
	ldr r0, [sp, #4]
	bl sub_081616BC
	b _0816155C
	.align 2, 0
_08161528: .4byte 0x02024190
_0816152C:
	movs r0, #1
	bl PlaySE
	mov r1, sl
	mov r0, r8
	muls r0, r1, r0
	add r0, sb
	movs r1, #0x3a
	bl GetMonData
	movs r1, #5
	bl __udivsi3
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	ldr r0, _0816156C
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, r8
	bl sub_081B1BE8
_0816155C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0816156C: .4byte 0x08161571
	thumb_func_end sub_081614AC

	thumb_func_start sub_08161570
sub_08161570: @ 0x08161570
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl PlaySE
	ldr r5, _081615B8
	movs r1, #9
	ldrsb r1, [r5, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081615BC
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	movs r1, #5
	bl __udivsi3
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldrb r1, [r5, #0xa]
	ldr r0, _081615C0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	bl sub_081B1BE8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081615B8: .4byte 0x0203CB94
_081615BC: .4byte 0x02024190
_081615C0: .4byte 0x081615C5
	thumb_func_end sub_08161570

	thumb_func_start sub_081615C4
sub_081615C4: @ 0x081615C4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0816160C
	movs r1, #0xa
	ldrsb r1, [r0, r1]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08161610
	adds r0, r0, r1
	ldr r1, _08161614
	bl GetMonNickname
	ldr r4, _08161618
	ldr r1, _0816161C
	adds r0, r4, #0
	bl StringExpandPlaceholders
	adds r0, r4, #0
	movs r1, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _08161620
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08161624
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816160C: .4byte 0x0203CB94
_08161610: .4byte 0x02024190
_08161614: .4byte 0x02021C40
_08161618: .4byte 0x02021C7C
_0816161C: .4byte 0x085C9E8F
_08161620: .4byte 0x03005B60
_08161624: .4byte 0x08161629
	thumb_func_end sub_081615C4

	thumb_func_start sub_08161628
sub_08161628: @ 0x08161628
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08161676
	ldr r4, _0816167C
	movs r0, #0
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #9]
	movs r1, #0
	bl sub_081B0C9C
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	ldrb r0, [r4, #0xa]
	movs r1, #1
	bl sub_081B0C9C
	movs r0, #6
	movs r1, #0
	bl ClearStdWindowAndFrameToTransparent
	movs r0, #6
	bl ClearWindowTilemap
	movs r0, #0
	bl display_pokemon_menu_message
	ldr r1, _08161680
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08161684
	str r1, [r0]
_08161676:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816167C: .4byte 0x0203CB94
_08161680: .4byte 0x03005B60
_08161684: .4byte 0x081B1041
	thumb_func_end sub_08161628

	thumb_func_start sub_08161688
sub_08161688: @ 0x08161688
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_081B18A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _081616AE
	movs r0, #5
	bl display_pokemon_menu_message
	ldr r0, _081616B4
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081616B8
	str r0, [r1]
_081616AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081616B4: .4byte 0x03005B60
_081616B8: .4byte 0x081B1041
	thumb_func_end sub_08161688

	thumb_func_start sub_081616BC
sub_081616BC: @ 0x081616BC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #5
	bl PlaySE
	ldr r0, _081616EC
	movs r1, #0
	bl sub_081B182C
	movs r0, #2
	bl schedule_bg_copy_tilemap_to_vram
	ldr r1, _081616F0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081616F4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081616EC: .4byte 0x085C9B07
_081616F0: .4byte 0x03005B60
_081616F4: .4byte 0x08161689
	thumb_func_end sub_081616BC

