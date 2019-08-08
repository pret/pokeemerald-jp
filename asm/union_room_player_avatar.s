.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start is_walking_or_running
is_walking_or_running: @ 0x08019350
	push {lr}
	ldr r0, _08019364
	ldrb r0, [r0, #3]
	cmp r0, #2
	beq _0801935E
	cmp r0, #0
	bne _08019368
_0801935E:
	movs r0, #1
	b _0801936A
	.align 2, 0
_08019364: .4byte 0x02037230
_08019368:
	movs r0, #0
_0801936A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end is_walking_or_running

	thumb_func_start sub_08019370
sub_08019370: @ 0x08019370
	ldr r3, _08019384
	movs r2, #7
	ands r2, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r2, r2, r1
	adds r2, r2, r3
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_08019384: .4byte 0x082C2B7C
	thumb_func_end sub_08019370

	thumb_func_start sub_08019388
sub_08019388: @ 0x08019388
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _080193D0
	mov r8, r4
	lsls r0, r0, #2
	adds r4, r0, r4
	movs r6, #0
	ldrsh r5, [r4, r6]
	ldr r6, _080193D4
	lsls r1, r1, #1
	adds r4, r1, r6
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r5, r5, r4
	adds r5, #7
	str r5, [r2]
	movs r2, #2
	add r8, r2
	add r0, r8
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r6, #1
	adds r1, r1, r6
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	adds r0, #7
	str r0, [r3]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080193D0: .4byte 0x082C2B90
_080193D4: .4byte 0x082C2BB0
	thumb_func_end sub_08019388

	thumb_func_start sub_080193D8
sub_080193D8: @ 0x080193D8
	push {r4, r5, r6, r7, lr}
	mov ip, r3
	ldr r7, _08019418
	lsls r5, r0, #2
	adds r0, r5, r7
	movs r4, #0
	ldrsh r3, [r0, r4]
	ldr r6, _0801941C
	lsls r4, r1, #1
	adds r0, r4, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	adds r3, #7
	cmp r3, r2
	bne _08019420
	adds r0, r7, #2
	adds r0, r5, r0
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r6, #1
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r1, #7
	cmp r1, ip
	bne _08019420
	movs r0, #1
	b _08019422
	.align 2, 0
_08019418: .4byte 0x082C2B90
_0801941C: .4byte 0x082C2BB0
_08019420:
	movs r0, #0
_08019422:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_080193D8

	thumb_func_start IsUnionRoomPlayerHidden
IsUnionRoomPlayerHidden: @ 0x08019428
	push {lr}
	ldr r1, _08019440
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08019440: .4byte 0x000002BF
	thumb_func_end IsUnionRoomPlayerHidden

	thumb_func_start HideUnionRoomPlayer
HideUnionRoomPlayer: @ 0x08019444
	push {lr}
	ldr r1, _08019458
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08019458: .4byte 0x000002BF
	thumb_func_end HideUnionRoomPlayer

	thumb_func_start ShowUnionRoomPlayer
ShowUnionRoomPlayer: @ 0x0801945C
	push {lr}
	ldr r1, _08019470
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_08019470: .4byte 0x000002BF
	thumb_func_end ShowUnionRoomPlayer

	thumb_func_start SetUnionRoomPlayerGfx
SetUnionRoomPlayerGfx: @ 0x08019474
	push {lr}
	ldr r2, _0801948C
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0801948C: .4byte 0x00004010
	thumb_func_end SetUnionRoomPlayerGfx

	thumb_func_start CreateUnionRoomPlayerEventObject
CreateUnionRoomPlayerEventObject: @ 0x08019490
	push {lr}
	ldr r1, _080194A8
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _080194AC
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl TrySpawnEventObject
	pop {r0}
	bx r0
	.align 2, 0
_080194A8: .4byte 0x082C2BC4
_080194AC: .4byte 0x03005AEC
	thumb_func_end CreateUnionRoomPlayerEventObject

	thumb_func_start RemoveUnionRoomPlayerEventObject
RemoveUnionRoomPlayerEventObject: @ 0x080194B0
	push {lr}
	ldr r1, _080194C8
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _080194CC
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl RemoveEventObjectByLocalIdAndMap
	pop {r0}
	bx r0
	.align 2, 0
_080194C8: .4byte 0x082C2BC4
_080194CC: .4byte 0x03005AEC
	thumb_func_end RemoveUnionRoomPlayerEventObject

	thumb_func_start SetUnionRoomPlayerEnterExitMovement
SetUnionRoomPlayerEnterExitMovement: @ 0x080194D0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r1, #0
	ldr r1, _0801951C
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _08019520
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019536
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08019524
	adds r4, r0, r1
	adds r0, r4, #0
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019536
	ldrb r1, [r5]
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019528
	movs r0, #1
	b _08019538
	.align 2, 0
_0801951C: .4byte 0x082C2BC4
_08019520: .4byte 0x03005AEC
_08019524: .4byte 0x02036FF0
_08019528:
	ldr r0, _08019540
	movs r1, #0xc1
	lsls r1, r1, #1
	ldr r2, _08019544
	movs r3, #1
	bl AGBAssert
_08019536:
	movs r0, #0
_08019538:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08019540: .4byte 0x082C2BDC
_08019544: .4byte 0x082C2BF0
	thumb_func_end SetUnionRoomPlayerEnterExitMovement

