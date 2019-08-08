.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08019548
sub_08019548: @ 0x08019548
	push {r4, lr}
	sub sp, #4
	ldr r1, _08019584
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _08019588
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080195A8
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0801958C
	adds r4, r0, r1
	adds r0, r4, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019590
	movs r0, #0
	b _080195AA
	.align 2, 0
_08019584: .4byte 0x082C2BC4
_08019588: .4byte 0x03005AEC
_0801958C: .4byte 0x02036FF0
_08019590:
	bl ScriptContext2_IsEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080195A2
	adds r0, r4, #0
	bl UnfreezeEventObject
	b _080195A8
_080195A2:
	adds r0, r4, #0
	bl FreezeEventObject
_080195A8:
	movs r0, #1
_080195AA:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08019548

	thumb_func_start sub_080195B4
sub_080195B4: @ 0x080195B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080195F8
	movs r1, #0
	str r1, [r0]
	ldr r0, _080195FC
	str r4, [r0]
	cmp r4, #0
	bne _080195D2
	ldr r0, _08019600
	ldr r1, _08019604
	ldr r2, _08019608
	movs r3, #1
	bl AGBAssert
_080195D2:
	movs r1, #0
	adds r0, r4, #0
	movs r2, #7
_080195D8:
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	adds r0, #4
	subs r2, #1
	cmp r2, #0
	bge _080195D8
	bl sub_08019878
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080195F8: .4byte 0x0202291C
_080195FC: .4byte 0x02022918
_08019600: .4byte 0x082C2BDC
_08019604: .4byte 0x000001B9
_08019608: .4byte 0x082C2BF4
	thumb_func_end sub_080195B4

	thumb_func_start sub_0801960C
sub_0801960C: @ 0x0801960C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08019620
	cmp r0, #1
	beq _08019640
	b _0801965E
_08019620:
	ldr r1, _0801963C
	adds r0, r4, #0
	bl SetUnionRoomPlayerEnterExitMovement
	cmp r0, #1
	bne _0801965E
	adds r0, r4, #0
	bl HideUnionRoomPlayer
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0801965E
	.align 2, 0
_0801963C: .4byte 0x082C2C09
_08019640:
	adds r0, r4, #0
	bl sub_08019548
	cmp r0, #0
	beq _0801965E
	adds r0, r4, #0
	bl RemoveUnionRoomPlayerEventObject
	adds r0, r4, #0
	bl HideUnionRoomPlayer
	movs r0, #0
	strb r0, [r5]
	movs r0, #1
	b _08019660
_0801965E:
	movs r0, #0
_08019660:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801960C

	thumb_func_start sub_08019668
sub_08019668: @ 0x08019668
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #2
	beq _08019704
	cmp r0, #2
	bgt _08019684
	cmp r0, #0
	beq _0801968A
	b _08019716
_08019684:
	cmp r0, #3
	beq _080196EC
	b _08019716
_0801968A:
	bl is_walking_or_running
	cmp r0, #0
	beq _08019716
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0
	ldrsh r3, [r4, r0]
	adds r0, r5, #0
	movs r1, #0
	bl sub_080193D8
	cmp r0, #1
	beq _08019716
	mov r0, sp
	adds r1, r4, #0
	bl player_get_pos_including_state_based_drift
	mov r0, sp
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0
	ldrsh r3, [r4, r0]
	adds r0, r5, #0
	movs r1, #0
	bl sub_080193D8
	cmp r0, #1
	beq _08019716
	ldrb r1, [r7, #1]
	adds r0, r5, #0
	bl SetUnionRoomPlayerGfx
	adds r0, r5, #0
	bl CreateUnionRoomPlayerEventObject
	adds r0, r5, #0
	bl ShowUnionRoomPlayer
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_080196EC:
	ldr r1, _08019700
	adds r0, r5, #0
	bl SetUnionRoomPlayerEnterExitMovement
	cmp r0, #1
	bne _08019716
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _08019716
	.align 2, 0
_08019700: .4byte 0x082C2C0B
_08019704:
	adds r0, r5, #0
	bl sub_08019548
	cmp r0, #0
	beq _08019716
	movs r0, #0
	strb r0, [r6]
	movs r0, #1
	b _08019718
_08019716:
	movs r0, #0
_08019718:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08019668

	thumb_func_start sub_08019720
sub_08019720: @ 0x08019720
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, _08019758
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r4, r1, r0
	cmp r1, #0
	bne _08019740
	ldr r0, _0801975C
	movs r1, #0x8c
	lsls r1, r1, #2
	ldr r2, _08019760
	movs r3, #1
	bl AGBAssert
_08019740:
	movs r0, #1
	strb r0, [r4, #3]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08019370
	strb r0, [r4, #1]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08019764
	movs r0, #0
	b _08019766
	.align 2, 0
_08019758: .4byte 0x02022918
_0801975C: .4byte 0x082C2BDC
_08019760: .4byte 0x082C2BF4
_08019764:
	movs r0, #1
_08019766:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_08019720

	thumb_func_start sub_0801976C
sub_0801976C: @ 0x0801976C
	push {r4, lr}
	ldr r1, _08019798
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r4, r1, r0
	cmp r1, #0
	bne _08019788
	ldr r0, _0801979C
	movs r1, #0x90
	lsls r1, r1, #2
	ldr r2, _080197A0
	movs r3, #1
	bl AGBAssert
_08019788:
	movs r0, #2
	strb r0, [r4, #3]
	ldrb r0, [r4]
	cmp r0, #1
	beq _080197A4
	movs r0, #0
	b _080197A6
	.align 2, 0
_08019798: .4byte 0x02022918
_0801979C: .4byte 0x082C2BDC
_080197A0: .4byte 0x082C2BF4
_080197A4:
	movs r0, #1
_080197A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0801976C

	thumb_func_start sub_080197AC
sub_080197AC: @ 0x080197AC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r4]
	cmp r1, #1
	beq _0801980E
	cmp r1, #1
	bgt _080197C2
	cmp r1, #0
	beq _080197CC
	b _0801982E
_080197C2:
	cmp r1, #2
	beq _080197D8
	cmp r1, #3
	beq _0801981C
	b _0801982E
_080197CC:
	ldrb r0, [r4, #3]
	cmp r0, #1
	bne _0801982E
	movs r0, #2
	strb r0, [r4]
	strb r1, [r4, #2]
_080197D8:
	adds r0, r5, #0
	movs r1, #0
	bl sub_08019A28
	adds r1, r0, #0
	cmp r1, #0
	bne _080197FE
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _080197FE
	strb r1, [r4]
	strb r1, [r4, #2]
	adds r0, r5, #0
	bl RemoveUnionRoomPlayerEventObject
	adds r0, r5, #0
	bl HideUnionRoomPlayer
	b _0801982E
_080197FE:
	adds r0, r4, #2
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_08019668
	cmp r0, #1
	bne _0801982E
	b _0801982C
_0801980E:
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _0801982E
	movs r1, #0
	movs r0, #3
	strb r0, [r4]
	strb r1, [r4, #2]
_0801981C:
	adds r0, r4, #2
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0801960C
	cmp r0, #1
	bne _0801982E
	movs r0, #0
_0801982C:
	strb r0, [r4]
_0801982E:
	movs r0, #0
	strb r0, [r4, #3]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080197AC

	thumb_func_start sub_08019838
sub_08019838: @ 0x08019838
	push {r4, r5, lr}
	ldr r5, _08019868
	ldr r0, [r5]
	cmp r0, #0
	bne _0801984E
	ldr r0, _0801986C
	ldr r1, _08019870
	ldr r2, _08019874
	movs r3, #1
	bl AGBAssert
_0801984E:
	movs r4, #0
_08019850:
	lsls r0, r4, #2
	ldr r1, [r5]
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_080197AC
	adds r4, #1
	cmp r4, #7
	ble _08019850
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019868: .4byte 0x02022918
_0801986C: .4byte 0x082C2BDC
_08019870: .4byte 0x00000282
_08019874: .4byte 0x082C2BF4
	thumb_func_end sub_08019838

	thumb_func_start sub_08019878
sub_08019878: @ 0x08019878
	push {r4, lr}
	ldr r4, _08019898
	adds r0, r4, #0
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0801989C
	adds r0, r4, #0
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080198AA
	.align 2, 0
_08019898: .4byte 0x08019839
_0801989C:
	ldr r0, _080198B0
	ldr r1, _080198B4
	ldr r2, _080198B8
	movs r3, #1
	bl AGBAssert
	movs r0, #0x10
_080198AA:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080198B0: .4byte 0x082C2BDC
_080198B4: .4byte 0x0000028E
_080198B8: .4byte 0x082C2BF0
	thumb_func_end sub_08019878

	thumb_func_start sub_080198BC
sub_080198BC: @ 0x080198BC
	push {lr}
	ldr r0, _080198D4
	bl FindTaskIdByFunc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _080198D0
	bl DestroyTask
_080198D0:
	pop {r0}
	bx r0
	.align 2, 0
_080198D4: .4byte 0x08019839
	thumb_func_end sub_080198BC

	thumb_func_start sub_080198D8
sub_080198D8: @ 0x080198D8
	push {r4, lr}
	movs r4, #0
_080198DC:
	adds r0, r4, #0
	bl IsUnionRoomPlayerHidden
	cmp r0, #0
	bne _080198F2
	adds r0, r4, #0
	bl RemoveUnionRoomPlayerEventObject
	adds r0, r4, #0
	bl HideUnionRoomPlayer
_080198F2:
	adds r4, #1
	cmp r4, #7
	ble _080198DC
	ldr r1, _08019908
	movs r0, #0
	str r0, [r1]
	bl sub_080198BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019908: .4byte 0x02022918
	thumb_func_end sub_080198D8

	thumb_func_start sub_0801990C
sub_0801990C: @ 0x0801990C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #8]
	mov sb, r1
	movs r7, #0
	mov r0, sb
	lsls r0, r0, #2
	mov r8, r0
	ldr r0, _08019998
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	mov r2, sp
	strh r1, [r2, #0xc]
	adds r0, #2
	add r0, r8
	ldrh r0, [r0]
	mov sl, r0
	ldr r6, _0801999C
_0801993A:
	mov r5, r8
	add r5, sb
	adds r5, r5, r7
	adds r4, r5, #0
	subs r4, #0x38
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r2, #0
	ldrsb r2, [r6, r2]
	mov r0, sp
	ldrh r0, [r0, #0xc]
	adds r2, r0, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #1
	ldrsb r3, [r6, r3]
	add r3, sl
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x41
	adds r1, r4, #0
	bl sprite_new
	ldr r1, [sp, #8]
	adds r5, r1, r5
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl sub_080975B4
	adds r6, #2
	adds r7, #1
	cmp r7, #4
	ble _0801993A
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019998: .4byte 0x082C2B90
_0801999C: .4byte 0x082C2BB0
	thumb_func_end sub_0801990C

	thumb_func_start sub_080199A0
sub_080199A0: @ 0x080199A0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r6, _080199C4
_080199A8:
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	adds r4, #1
	cmp r4, #0x27
	ble _080199A8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080199C4: .4byte 0x020205AC
	thumb_func_end sub_080199A0

	thumb_func_start sub_080199C8
sub_080199C8: @ 0x080199C8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r5, #0
	add r7, sp, #4
_080199D0:
	movs r4, #0
	adds r6, r5, #1
_080199D4:
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sp
	adds r3, r7, #0
	bl sub_08019388
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #0
	bl sub_080884F8
	adds r4, #1
	cmp r4, #4
	ble _080199D4
	adds r5, r6, #0
	cmp r5, #7
	ble _080199D0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080199C8

	thumb_func_start sub_08019A00
sub_08019A00: @ 0x08019A00
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08019A14
	ldr r0, _08019A10
	adds r0, r1, r0
	ldrb r0, [r0]
	b _08019A24
	.align 2, 0
_08019A10: .4byte 0x082C2BBF
_08019A14:
	ldrb r1, [r2, #0xa]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x45
	beq _08019A22
	movs r0, #4
	b _08019A24
_08019A22:
	movs r0, #1
_08019A24:
	pop {r1}
	bx r1
	thumb_func_end sub_08019A00

	thumb_func_start sub_08019A28
sub_08019A28: @ 0x08019A28
	push {lr}
	adds r2, r0, #0
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r0, r1
	subs r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080975FC
	pop {r1}
	bx r1
	thumb_func_end sub_08019A28

	thumb_func_start sub_08019A40
sub_08019A40: @ 0x08019A40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov sb, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r7, r0, r6
	adds r0, r5, #0
	bl sub_08019A28
	cmp r0, #1
	bne _08019A7E
	adds r4, r7, #0
	subs r4, #0x38
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl sub_080975B4
	adds r0, r4, #0
	movs r1, #1
	bl sub_08097634
_08019A7E:
	adds r0, r7, #0
	subs r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	bl sub_08097524
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sb
	bl sub_08019A00
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08019E68
	add r3, sp, #4
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, sp
	bl sub_08019388
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #1
	bl sub_080884F8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08019A40

	thumb_func_start sub_08019AC8
sub_08019AC8: @ 0x08019AC8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	adds r0, r0, r5
	subs r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #2
	bl sub_08097634
	add r3, sp, #4
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl sub_08019388
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #0
	bl sub_080884F8
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08019AC8

	thumb_func_start sub_08019B00
sub_08019B00: @ 0x08019B00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	mov r6, sp
	adds r6, #2
	mov r0, sp
	adds r1, r6, #0
	bl PlayerGetDestCoords
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r0, r4, #0
	adds r1, r5, #0
	bl player_get_pos_including_state_based_drift
	lsls r0, r7, #2
	adds r0, r0, r7
	subs r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080975FC
	mov sl, r6
	mov sb, r4
	adds r6, r5, #0
	cmp r0, #1
	bne _08019B8C
	mov r0, sp
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r0, sl
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r7, #0
	movs r1, #0
	bl sub_080193D8
	cmp r0, #1
	beq _08019BF8
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r1, #0
	ldrsh r3, [r6, r1]
	adds r0, r7, #0
	movs r1, #0
	bl sub_080193D8
	cmp r0, #1
	beq _08019BF8
	mov r2, r8
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ldrb r1, [r2, #2]
	bl sub_08019370
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r7, #0
	movs r1, #0
	mov r3, r8
	bl sub_08019A40
_08019B8C:
	movs r5, #1
	mov r4, r8
	adds r4, #4
_08019B92:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08019BA2
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08019AC8
	b _08019BF0
_08019BA2:
	mov r0, sp
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r0, sl
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_080193D8
	cmp r0, #0
	bne _08019BF0
	mov r0, sb
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0
	ldrsh r3, [r6, r0]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_080193D8
	cmp r0, #0
	bne _08019BF0
	ldrb r2, [r4]
	lsrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	movs r1, #7
	ands r1, r2
	bl sub_08019370
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r7, #0
	adds r1, r5, #0
	mov r3, r8
	bl sub_08019A40
_08019BF0:
	adds r4, #1
	adds r5, #1
	cmp r5, #4
	ble _08019B92
_08019BF8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08019B00

	thumb_func_start sub_08019C08
sub_08019C08: @ 0x08019C08
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4, #0xa]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	subs r0, #0x40
	cmp r0, #0x14
	bhi _08019CAC
	lsls r0, r0, #2
	ldr r1, _08019C24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019C24: .4byte 0x08019C28
_08019C28: @ jump table
	.4byte _08019C7C @ case 0
	.4byte _08019C9C @ case 1
	.4byte _08019CAC @ case 2
	.4byte _08019CAC @ case 3
	.4byte _08019C9C @ case 4
	.4byte _08019C9C @ case 5
	.4byte _08019CAC @ case 6
	.4byte _08019CAC @ case 7
	.4byte _08019C9C @ case 8
	.4byte _08019CAC @ case 9
	.4byte _08019CAC @ case 10
	.4byte _08019CAC @ case 11
	.4byte _08019CAC @ case 12
	.4byte _08019CAC @ case 13
	.4byte _08019CAC @ case 14
	.4byte _08019CAC @ case 15
	.4byte _08019CAC @ case 16
	.4byte _08019C9C @ case 17
	.4byte _08019C9C @ case 18
	.4byte _08019C9C @ case 19
	.4byte _08019C7C @ case 20
_08019C7C:
	ldrb r1, [r4, #0xb]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	ldrb r2, [r4, #2]
	adds r0, r5, #0
	bl sub_08019720
	movs r4, #0
_08019C8C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08019AC8
	adds r4, #1
	cmp r4, #4
	bls _08019C8C
	b _08019CB8
_08019C9C:
	adds r0, r5, #0
	bl sub_0801976C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08019B00
	b _08019CB8
_08019CAC:
	ldr r0, _08019CC0
	ldr r1, _08019CC4
	ldr r2, _08019CC8
	movs r3, #1
	bl AGBAssert
_08019CB8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019CC0: .4byte 0x082C2BDC
_08019CC4: .4byte 0x000003D3
_08019CC8: .4byte 0x082C2BF0
	thumb_func_end sub_08019C08

	thumb_func_start sub_08019CCC
sub_08019CCC: @ 0x08019CCC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0801976C
	movs r4, #0
_08019CD6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08019AC8
	adds r4, #1
	cmp r4, #4
	ble _08019CD6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08019CCC

	thumb_func_start sub_08019CEC
sub_08019CEC: @ 0x08019CEC
	push {r4, r5, lr}
	ldr r2, _08019D0C
	movs r1, #0
	str r1, [r2]
	movs r5, #0
	ldr r4, [r0]
_08019CF8:
	ldrb r0, [r4, #0x1a]
	movs r1, #3
	ands r1, r0
	cmp r1, #1
	bne _08019D10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08019C08
	b _08019D1C
	.align 2, 0
_08019D0C: .4byte 0x0202291C
_08019D10:
	cmp r1, #2
	bne _08019D1C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08019CCC
_08019D1C:
	adds r4, #0x20
	adds r5, #1
	cmp r5, #7
	ble _08019CF8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08019CEC

	thumb_func_start sub_08019D2C
sub_08019D2C: @ 0x08019D2C
	ldr r1, _08019D38
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08019D38: .4byte 0x0202291C
	thumb_func_end sub_08019D2C

	thumb_func_start sub_08019D3C
sub_08019D3C: @ 0x08019D3C
	push {lr}
	adds r2, r0, #0
	ldr r0, _08019D5C
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	bls _08019D56
	adds r0, r2, #0
	bl sub_08019CEC
_08019D56:
	pop {r0}
	bx r0
	.align 2, 0
_08019D5C: .4byte 0x0202291C
	thumb_func_end sub_08019D3C

	thumb_func_start sub_08019D60
sub_08019D60: @ 0x08019D60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	bl is_walking_or_running
	cmp r0, #0
	bne _08019DA8
	b _08019E4E
_08019D7C:
	ldr r4, _08019DA4
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r2, [r0]
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl sub_08019E68
	ldr r0, [sp, #4]
	strh r6, [r0]
	mov r1, sp
	ldrh r2, [r1, #0xc]
	ldr r1, [sp, #8]
	strh r2, [r1]
	movs r0, #1
	b _08019E50
	.align 2, 0
_08019DA4: .4byte 0x082C2BBA
_08019DA8:
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _08019E60
	adds r7, r5, #0
	movs r1, #0
	mov sl, r1
	adds r2, r0, #2
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
_08019DC6:
	movs r6, #0
	ldr r4, [sp, #0x14]
	movs r0, #0
	ldrsh r4, [r4, r0]
	mov sb, r4
	ldr r1, [sp, #0x10]
	mov r8, r1
	ldr r5, _08019E64
_08019DD6:
	mov r2, sl
	adds r3, r2, r6
	mov r0, sp
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #0
	ldrsb r0, [r5, r0]
	add r0, sb
	adds r0, #7
	cmp r1, r0
	bne _08019E2A
	mov r1, sp
	movs r2, #2
	ldrsh r0, [r1, r2]
	mov r4, r8
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #1
	ldrsb r2, [r5, r2]
	adds r1, r1, r2
	adds r1, #7
	cmp r0, r1
	bne _08019E2A
	adds r0, r3, #0
	subs r0, #0x38
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_080975FC
	cmp r0, #0
	bne _08019E2A
	adds r0, r4, #0
	bl sub_08097724
	cmp r0, #0
	bne _08019E2A
	ldrb r1, [r7, #0x1a]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	beq _08019D7C
_08019E2A:
	adds r5, #2
	adds r6, #1
	cmp r6, #4
	ble _08019DD6
	adds r7, #0x20
	movs r4, #5
	add sl, r4
	ldr r0, [sp, #0x10]
	adds r0, #4
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	adds r1, #4
	str r1, [sp, #0x14]
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	cmp r2, #7
	ble _08019DC6
_08019E4E:
	movs r0, #0
_08019E50:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08019E60: .4byte 0x082C2B90
_08019E64: .4byte 0x082C2BB0
	thumb_func_end sub_08019D60

	thumb_func_start sub_08019E68
sub_08019E68: @ 0x08019E68
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	subs r0, #0x38
	adds r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080974E8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08019E68

	thumb_func_start sub_08019E88
sub_08019E88: @ 0x08019E88
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r3, r4, #5
	adds r3, r3, r2
	adds r2, r3, #0
	bl sub_08019A00
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08019E68
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08019E88

	thumb_func_start sub_08019EAC
sub_08019EAC: @ 0x08019EAC
	push {lr}
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019ECC
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
_08019ECC:
	pop {r0}
	bx r0
	thumb_func_end sub_08019EAC

	thumb_func_start sub_08019ED0
sub_08019ED0: @ 0x08019ED0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08019ED0

	thumb_func_start sub_08019EE4
sub_08019EE4: @ 0x08019EE4
	push {lr}
	ldr r0, _08019EF0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08019EF0: .4byte 0x08019EF5
	thumb_func_end sub_08019EE4

	thumb_func_start sub_08019EF4
sub_08019EF4: @ 0x08019EF4
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	ldr r5, _0801A018
	movs r0, #0x6c
	bl AllocZeroed
	str r0, [r5]
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0801A01C
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r4, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #1
	bl SetBgTilemapBuffer
	adds r0, r4, #0
	bl Alloc
	adds r1, r0, #0
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, _0801A020
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _0801A024
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	ldr r0, _0801A028
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl ScanlineEffect_Stop
	bl m4aSoundVSyncOn
	ldr r0, _0801A02C
	bl SetVBlankCallback
	ldr r0, _0801A030
	movs r1, #0
	bl CreateTask
	ldr r1, [r5]
	adds r1, #0x60
	strb r0, [r1]
	bl sub_08013748
	ldr r1, [r5]
	adds r1, #0x61
	strb r0, [r1]
	ldr r1, [r5]
	movs r0, #1
	str r0, [r1, #0x1c]
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
	ldr r0, _0801A034
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0xf0
	bl Menu_LoadStdPalAt
	bl DynamicPlaceholderTextUtil_Reset
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	ldr r0, _0801A038
	bl SetMainCallback2
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A018: .4byte 0x03000DAC
_0801A01C: .4byte 0x082C31B4
_0801A020: .4byte 0x082C2E10
_0801A024: .4byte 0x082C3020
_0801A028: .4byte 0x082C31BC
_0801A02C: .4byte 0x08019ED1
_0801A030: .4byte 0x0801A169
_0801A034: .4byte 0x082C2C10
_0801A038: .4byte 0x08019EAD
	thumb_func_end sub_08019EF4

	thumb_func_start sub_0801A03C
sub_0801A03C: @ 0x0801A03C
	push {r4, lr}
	bl FreeAllWindowBuffers
	movs r4, #0
_0801A044:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl GetBgTilemapBuffer
	bl Free
	adds r4, #1
	cmp r4, #1
	ble _0801A044
	ldr r0, _0801A06C
	ldr r0, [r0]
	bl Free
	ldr r0, _0801A070
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A06C: .4byte 0x03000DAC
_0801A070: .4byte 0x08085B35
	thumb_func_end sub_0801A03C

	thumb_func_start sub_0801A074
sub_0801A074: @ 0x0801A074
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0801A09C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe
	bne _0801A098
	movs r0, #0
	strh r0, [r1]
_0801A098:
	movs r0, #0
	strh r0, [r2]
_0801A09C:
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, #2
	lsls r0, r0, #5
	ldr r1, _0801A0B4
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x10
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_0801A0B4: .4byte 0x082C2C10
	thumb_func_end sub_0801A074

	thumb_func_start sub_0801A0B8
sub_0801A0B8: @ 0x0801A0B8
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #1
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	ldr r4, _0801A164
	ldr r2, [r4]
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r3, #2
	bl sub_0801A384
	movs r1, #0
	adds r5, r4, #0
_0801A0EE:
	adds r4, r1, #1
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #0x19
	movs r1, #0xa0
	lsls r1, r1, #0x14
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #1
	movs r3, #0
	bl sub_0801A384
	adds r1, r4, #0
	cmp r4, #2
	ble _0801A0EE
	ldr r1, _0801A164
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #0x19
	movs r1, #0xa0
	lsls r1, r1, #0x14
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl sub_0801A384
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #2
	bl CopyWindowToVram
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A164: .4byte 0x082C3238
	thumb_func_end sub_0801A0B8

	thumb_func_start sub_0801A168
sub_0801A168: @ 0x0801A168
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0801A198
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	cmp r0, #5
	bls _0801A18C
	b _0801A36C
_0801A18C:
	lsls r0, r0, #2
	ldr r1, _0801A19C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A198: .4byte 0x03005B60
_0801A19C: .4byte 0x0801A1A0
_0801A1A0: @ jump table
	.4byte _0801A1B8 @ case 0
	.4byte _0801A1D4 @ case 1
	.4byte _0801A1F8 @ case 2
	.4byte _0801A214 @ case 3
	.4byte _0801A32C @ case 4
	.4byte _0801A354 @ case 5
_0801A1B8:
	bl sub_0801A0B8
	ldr r0, _0801A1D0
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _0801A36C
	.align 2, 0
_0801A1D0: .4byte 0x03005B60
_0801A1D4:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #1
	bl ShowBg
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	bl ShowBg
	b _0801A33C
_0801A1F8:
	ldr r0, _0801A210
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801A206
	b _0801A36C
_0801A206:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	b _0801A346
	.align 2, 0
_0801A210: .4byte 0x02037C74
_0801A214:
	ldr r0, _0801A28C
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x10
	adds r2, r0, #0
	adds r2, #0x20
	adds r3, r0, #0
	adds r3, #0x61
	ldrb r3, [r3]
	bl sub_0801A504
	lsls r1, r5, #2
	mov sb, r1
	cmp r0, #0
	beq _0801A2C6
	movs r0, #2
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r4, #0
	ldr r7, _0801A290
	movs r2, #0xa0
	lsls r2, r2, #0x14
	mov r8, r2
	movs r6, #0
_0801A246:
	ldr r0, _0801A28C
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	add r0, sp, #8
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	add r1, sp, #8
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	ldr r1, _0801A294
	adds r1, r6, r1
	adds r0, r7, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	cmp r4, #3
	beq _0801A298
	mov r1, r8
	lsrs r0, r1, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #1
	adds r2, r7, #0
	movs r3, #0
	bl sub_0801A384
	b _0801A2AA
	.align 2, 0
_0801A28C: .4byte 0x03000DAC
_0801A290: .4byte 0x02021C7C
_0801A294: .4byte 0x082C3220
_0801A298:
	movs r0, #0x64
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #1
	adds r2, r7, #0
	movs r3, #0
	bl sub_0801A384
_0801A2AA:
	movs r2, #0xf0
	lsls r2, r2, #0x15
	add r8, r2
	adds r6, #6
	adds r4, #1
	cmp r4, #3
	ble _0801A246
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #2
	movs r1, #3
	bl CopyWindowToVram
_0801A2C6:
	ldr r0, _0801A31C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801A2DA
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A304
_0801A2DA:
	movs r0, #5
	bl PlaySE
	ldr r2, _0801A320
	ldr r0, _0801A324
	ldr r0, [r0]
	adds r0, #0x61
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0xff
	strh r1, [r0, #0x26]
	mov r0, sb
	adds r1, r0, r5
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0801A304:
	mov r2, sb
	adds r1, r2, r5
	lsls r1, r1, #3
	ldr r0, _0801A328
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0xe
	adds r1, #0x10
	bl sub_0801A074
	b _0801A36C
	.align 2, 0
_0801A31C: .4byte 0x03002360
_0801A320: .4byte 0x03005B60
_0801A324: .4byte 0x03000DAC
_0801A328: .4byte 0x03005B68
_0801A32C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
_0801A33C:
	ldr r1, _0801A350
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
_0801A346:
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _0801A36C
	.align 2, 0
_0801A350: .4byte 0x03005B60
_0801A354:
	ldr r0, _0801A37C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0801A36C
	ldr r0, _0801A380
	bl SetMainCallback2
	adds r0, r5, #0
	bl DestroyTask
_0801A36C:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A37C: .4byte 0x02037C74
_0801A380: .4byte 0x0801A03D
	thumb_func_end sub_0801A168

	thumb_func_start sub_0801A384
sub_0801A384: @ 0x0801A384
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov ip, r2
	ldr r2, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r0, r4, #0x18
	cmp r0, #4
	bhi _0801A40E
	lsls r0, r0, #2
	ldr r1, _0801A3B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A3B0: .4byte 0x0801A3B4
_0801A3B4: @ jump table
	.4byte _0801A3C8 @ case 0
	.4byte _0801A3D6 @ case 1
	.4byte _0801A3E4 @ case 2
	.4byte _0801A3F2 @ case 3
	.4byte _0801A400 @ case 4
_0801A3C8:
	add r1, sp, #0x14
	movs r0, #0
	strb r0, [r1]
	movs r0, #2
	strb r0, [r1, #1]
	movs r0, #3
	b _0801A40C
_0801A3D6:
	add r1, sp, #0x14
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r1, #1]
	movs r0, #3
	b _0801A40C
_0801A3E4:
	add r1, sp, #0x14
	movs r0, #0
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #5
	b _0801A40C
_0801A3F2:
	add r1, sp, #0x14
	movs r0, #0
	strb r0, [r1]
	movs r0, #7
	strb r0, [r1, #1]
	movs r0, #6
	b _0801A40C
_0801A400:
	add r1, sp, #0x14
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strb r0, [r1, #1]
	movs r0, #2
_0801A40C:
	strb r0, [r1, #2]
_0801A40E:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, sp, #0x14
	str r0, [sp, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	mov r0, ip
	str r0, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0801A384

	thumb_func_start sub_0801A434
sub_0801A434: @ 0x0801A434
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	adds r7, r1, #0
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r8, r0
	movs r4, #0
	ldr r0, _0801A4AC
	mov sb, r0
	movs r1, #1
	add r1, sb
	mov sl, r1
	mov r3, ip
	adds r3, #4
	str r3, [sp]
_0801A45E:
	lsls r0, r4, #1
	adds r2, r0, r4
	mov r3, sb
	adds r1, r2, r3
	adds r5, r0, #0
	adds r6, r4, #1
	ldrb r1, [r1]
	cmp r8, r1
	bne _0801A4C2
	mov r0, ip
	ldrb r1, [r0, #0x1a]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _0801A4C2
	mov r0, sb
	adds r0, #2
	adds r3, r2, r0
	ldrb r0, [r3]
	cmp r0, #0
	bne _0801A4B0
	movs r2, #0
	movs r1, #0
	ldr r3, [sp]
_0801A48E:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801A498
	adds r2, #1
_0801A498:
	adds r1, #1
	cmp r1, #3
	ble _0801A48E
	adds r2, #1
	adds r0, r5, r4
	add r0, sl
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r7
	b _0801A4BC
	.align 2, 0
_0801A4AC: .4byte 0x082C324C
_0801A4B0:
	mov r1, sl
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r7
	ldrb r2, [r3]
_0801A4BC:
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_0801A4C2:
	adds r4, r6, #0
	cmp r4, #0x1e
	bls _0801A45E
	mov r0, r8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801A434

	thumb_func_start sub_0801A4DC
sub_0801A4DC: @ 0x0801A4DC
	push {r4, lr}
	movs r4, #0
	adds r3, r1, #0
	adds r2, r0, #0
_0801A4E4:
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	beq _0801A4F0
	movs r0, #1
	b _0801A4FC
_0801A4F0:
	adds r3, #4
	adds r2, #4
	adds r4, #1
	cmp r4, #3
	ble _0801A4E4
	movs r0, #0
_0801A4FC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801A4DC

	thumb_func_start sub_0801A504
sub_0801A504: @ 0x0801A504
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	adds r5, r2, #0
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov r8, r0
	mov r0, sp
	movs r1, #0
	movs r2, #0x10
	bl memset
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _0801A56C
	adds r7, r0, r1
	movs r4, #0
_0801A532:
	lsls r1, r4, #5
	ldr r0, [r7]
	adds r0, r0, r1
	mov r1, sp
	bl sub_0801A434
	adds r1, r0, #0
	ldr r0, [r5]
	cmp r1, r0
	beq _0801A54C
	str r1, [r5]
	movs r2, #1
	mov r8, r2
_0801A54C:
	adds r5, #4
	adds r4, #1
	cmp r4, #0xf
	ble _0801A532
	mov r0, sp
	mov r1, sb
	bl sub_0801A4DC
	cmp r0, #0
	bne _0801A570
	mov r3, r8
	cmp r3, #1
	beq _0801A598
	movs r0, #0
	b _0801A59A
	.align 2, 0
_0801A56C: .4byte 0x03005B68
_0801A570:
	adds r1, r6, #0
	mov r0, sp
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	mov r1, sb
	mov r0, sp
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6]
	ldr r1, [r6, #4]
	adds r0, r0, r1
	ldr r1, [r6, #8]
	adds r0, r0, r1
	ldr r1, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
_0801A598:
	movs r0, #1
_0801A59A:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0801A504

	thumb_func_start sub_0801A5A8
sub_0801A5A8: @ 0x0801A5A8
	push {r4, r5, r6, r7, lr}
	movs r0, #0xa
	bl sub_08013D18
	movs r4, #0
	movs r7, #0x64
	ldr r6, _0801A628
	ldr r5, _0801A62C
_0801A5B8:
	ldr r0, _0801A630
	adds r0, r4, r0
	ldrb r0, [r0]
	subs r0, #1
	adds r1, r0, #0
	muls r1, r7, r1
	adds r1, r1, r6
	adds r0, r5, #0
	movs r2, #0x64
	bl memcpy
	adds r5, #0x64
	adds r4, #1
	cmp r4, #1
	ble _0801A5B8
	ldr r4, _0801A628
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r5, r4, r0
_0801A5DE:
	adds r0, r4, #0
	bl ZeroMonData
	adds r4, #0x64
	cmp r4, r5
	ble _0801A5DE
	ldr r4, _0801A628
	movs r5, #0
	adds r6, r4, #0
	adds r6, #0x64
_0801A5F2:
	ldr r1, _0801A62C
	adds r1, r5, r1
	adds r0, r4, #0
	movs r2, #0x64
	bl memcpy
	adds r4, #0x64
	adds r5, #0x64
	cmp r4, r6
	ble _0801A5F2
	movs r0, #0x32
	bl IncrementGameStat
	bl CalculatePlayerPartyCount
	ldr r0, _0801A634
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0801A638
	bl SetMainCallback2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A628: .4byte 0x02024190
_0801A62C: .4byte 0x020243E8
_0801A630: .4byte 0x0203CBC4
_0801A634: .4byte 0x0203886A
_0801A638: .4byte 0x080365B5
	thumb_func_end sub_0801A5A8

	thumb_func_start sub_0801A63C
sub_0801A63C: @ 0x0801A63C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x38]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0
	mov sb, r0
	movs r1, #1
	mov sl, r1
	ldr r0, _0801A6AC
	mov r8, r0
	ldrb r0, [r0]
	lsls r1, r0, #4
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	str r3, [sp, #0x14]
	bl FillWindowPixelBuffer
	mov r1, sb
	str r1, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r7, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	ldr r3, [sp, #0x14]
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A6AC: .4byte 0x082C32C0
	thumb_func_end sub_0801A63C

	thumb_func_start sub_0801A6B0
sub_0801A6B0: @ 0x0801A6B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801A6C8
	cmp r0, #1
	beq _0801A6F6
	b _0801A70A
_0801A6C8:
	movs r0, #0
	movs r1, #1
	movs r2, #0xd
	bl DrawTextBorderOuter
	str r5, [sp]
	movs r0, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A63C
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _0801A70A
_0801A6F6:
	movs r0, #0
	bl IsTextPrinterActive
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0801A70A
	strh r0, [r4]
	movs r0, #1
	b _0801A70C
_0801A70A:
	movs r0, #0
_0801A70C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0801A6B0

	thumb_func_start sub_0801A714
sub_0801A714: @ 0x0801A714
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0801A714

	thumb_func_start sub_0801A728
sub_0801A728: @ 0x0801A728
	push {r4, lr}
	sub sp, #0xc
	ldr r1, _0801A748
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x33
	bls _0801A73E
	b _0801AA82
_0801A73E:
	lsls r0, r0, #2
	ldr r1, _0801A74C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A748: .4byte 0x03002360
_0801A74C: .4byte 0x0801A750
_0801A750: @ jump table
	.4byte _0801A820 @ case 0
	.4byte _0801A8D0 @ case 1
	.4byte _0801A8F8 @ case 2
	.4byte _0801A91C @ case 3
	.4byte _0801A96C @ case 4
	.4byte _0801AA82 @ case 5
	.4byte _0801AA50 @ case 6
	.4byte _0801AA2C @ case 7
	.4byte _0801AA50 @ case 8
	.4byte _0801AA6C @ case 9
	.4byte _0801AA82 @ case 10
	.4byte _0801AA82 @ case 11
	.4byte _0801AA82 @ case 12
	.4byte _0801AA82 @ case 13
	.4byte _0801AA82 @ case 14
	.4byte _0801AA82 @ case 15
	.4byte _0801AA82 @ case 16
	.4byte _0801AA82 @ case 17
	.4byte _0801AA82 @ case 18
	.4byte _0801AA82 @ case 19
	.4byte _0801AA82 @ case 20
	.4byte _0801AA82 @ case 21
	.4byte _0801AA82 @ case 22
	.4byte _0801AA82 @ case 23
	.4byte _0801AA82 @ case 24
	.4byte _0801AA82 @ case 25
	.4byte _0801AA82 @ case 26
	.4byte _0801AA82 @ case 27
	.4byte _0801AA82 @ case 28
	.4byte _0801AA82 @ case 29
	.4byte _0801AA82 @ case 30
	.4byte _0801AA82 @ case 31
	.4byte _0801AA82 @ case 32
	.4byte _0801AA82 @ case 33
	.4byte _0801AA82 @ case 34
	.4byte _0801AA82 @ case 35
	.4byte _0801AA82 @ case 36
	.4byte _0801AA82 @ case 37
	.4byte _0801AA82 @ case 38
	.4byte _0801AA82 @ case 39
	.4byte _0801AA82 @ case 40
	.4byte _0801AA82 @ case 41
	.4byte _0801AA82 @ case 42
	.4byte _0801AA82 @ case 43
	.4byte _0801AA82 @ case 44
	.4byte _0801AA82 @ case 45
	.4byte _0801AA82 @ case 46
	.4byte _0801AA82 @ case 47
	.4byte _0801AA82 @ case 48
	.4byte _0801AA82 @ case 49
	.4byte _0801A9F8 @ case 50
	.4byte _0801AA14 @ case 51
_0801A820:
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	ldr r4, _0801A8BC
	movs r0, #4
	bl AllocZeroed
	str r0, [r4]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0801A8C0
	movs r0, #0
	movs r2, #1
	bl InitBgsFromTemplates
	bl reset_temp_tile_data_buffers
	ldr r0, _0801A8C4
	bl InitWindows
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0801A860
	b _0801AA96
_0801A860:
	bl DeactivateAllTextPrinters
	movs r0, #0
	bl ClearWindowTilemap
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
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
	movs r1, #1
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx
	movs r0, #0
	movs r1, #1
	movs r2, #0xd0
	bl LoadUserWindowBorderGfx_
	bl sub_08197680
	ldr r0, _0801A8C8
	bl SetVBlankCallback
	ldr r1, _0801A8CC
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0801AA5E
	.align 2, 0
_0801A8BC: .4byte 0x02022920
_0801A8C0: .4byte 0x082C32AC
_0801A8C4: .4byte 0x082C32B0
_0801A8C8: .4byte 0x0801A715
_0801A8CC: .4byte 0x03002360
_0801A8D0:
	ldr r0, _0801A8EC
	ldr r0, [r0]
	ldr r1, _0801A8F0
	movs r2, #0
	bl sub_0801A6B0
	cmp r0, #0
	bne _0801A8E2
	b _0801AA82
_0801A8E2:
	ldr r1, _0801A8F4
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _0801AA5E
	.align 2, 0
_0801A8EC: .4byte 0x02022920
_0801A8F0: .4byte 0x082C32C3
_0801A8F4: .4byte 0x03002360
_0801A8F8:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #0
	bl ShowBg
	ldr r1, _0801A918
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _0801AA5E
	.align 2, 0
_0801A918: .4byte 0x03002360
_0801A91C:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801A928
	b _0801AA82
_0801A928:
	ldr r4, _0801A944
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl memset
	ldr r0, _0801A948
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	cmn r1, r0
	bne _0801A94C
	movs r0, #0x52
	b _0801A94E
	.align 2, 0
_0801A944: .4byte 0x0202257C
_0801A948: .4byte 0x0203CBC4
_0801A94C:
	movs r0, #0x51
_0801A94E:
	strb r0, [r4]
	ldr r1, _0801A964
	movs r0, #0
	movs r2, #0x20
	bl SendBlock
	ldr r1, _0801A968
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _0801AA5E
	.align 2, 0
_0801A964: .4byte 0x0202257C
_0801A968: .4byte 0x03002360
_0801A96C:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _0801A97A
	b _0801AA82
_0801A97A:
	ldr r1, _0801A9AC
	ldrh r0, [r1]
	cmp r0, #0x51
	bne _0801A9B4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #0x51
	bne _0801A9B4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0801A9B0
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0x32
	b _0801A9EA
	.align 2, 0
_0801A9AC: .4byte 0x0202207C
_0801A9B0: .4byte 0x03002360
_0801A9B4:
	bl sub_0800A7F8
	ldr r4, _0801A9D8
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x52
	bne _0801A9E0
	ldr r0, _0801A9DC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r0, r2
	movs r1, #6
	b _0801A9EA
	.align 2, 0
_0801A9D8: .4byte 0x0202207C
_0801A9DC: .4byte 0x03002360
_0801A9E0:
	ldr r0, _0801A9F4
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #8
_0801A9EA:
	strb r1, [r0]
	bl ResetBlockReceivedFlags
	b _0801AA82
	.align 2, 0
_0801A9F4: .4byte 0x03002360
_0801A9F8:
	bl UpdatePaletteFade
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801AA82
	bl sub_0800A8D4
	ldr r1, _0801AA10
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	b _0801AA5E
	.align 2, 0
_0801AA10: .4byte 0x03002360
_0801AA14:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801AA82
	ldr r0, _0801AA28
	bl SetMainCallback2
	b _0801AA82
	.align 2, 0
_0801AA28: .4byte 0x0801A5A9
_0801AA2C:
	ldr r0, _0801AA44
	ldr r0, [r0]
	ldr r1, _0801AA48
	movs r2, #1
	bl sub_0801A6B0
	cmp r0, #0
	beq _0801AA82
	ldr r0, _0801AA4C
	bl SetMainCallback2
	b _0801AA82
	.align 2, 0
_0801AA44: .4byte 0x02022920
_0801AA48: .4byte 0x082C32F3
_0801AA4C: .4byte 0x08085A31
_0801AA50:
	ldr r0, _0801AA68
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA82
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
_0801AA5E:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0801AA82
	.align 2, 0
_0801AA68: .4byte 0x030031C4
_0801AA6C:
	ldr r0, _0801AAA0
	ldr r0, [r0]
	ldr r1, _0801AAA4
	movs r2, #1
	bl sub_0801A6B0
	cmp r0, #0
	beq _0801AA82
	ldr r0, _0801AAA8
	bl SetMainCallback2
_0801AA82:
	bl RunTasks
	bl RunTextPrinters
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
_0801AA96:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801AAA0: .4byte 0x02022920
_0801AAA4: .4byte 0x082C32E1
_0801AAA8: .4byte 0x08085A31
	thumb_func_end sub_0801A728

	thumb_func_start sub_0801AAAC
sub_0801AAAC: @ 0x0801AAAC
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r0, _0801AAD4
	ldr r1, [r0]
	ldr r0, _0801AAD8
	adds r1, r1, r0
	ldr r2, _0801AADC
	mov r0, sp
	bl CpuSet
	bl sub_0801AC50
	bl sub_0811FE10
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801AAD4: .4byte 0x03005AEC
_0801AAD8: .4byte 0x0000322C
_0801AADC: .4byte 0x0500007A
	thumb_func_end sub_0801AAAC

