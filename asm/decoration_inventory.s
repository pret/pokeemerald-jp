.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start SetDecorationInventoriesPointers
SetDecorationInventoriesPointers: @ 0x081616F8
	push {r4, lr}
	ldr r0, _0816176C
	mov ip, r0
	ldr r0, _08161770
	ldr r1, [r0]
	ldr r2, _08161774
	adds r0, r1, r2
	mov r4, ip
	str r0, [r4]
	movs r3, #0xa
	strb r3, [r4, #4]
	adds r2, #0xa
	adds r0, r1, r2
	str r0, [r4, #8]
	strb r3, [r4, #0xc]
	ldr r4, _08161778
	adds r0, r1, r4
	mov r2, ip
	str r0, [r2, #0x10]
	strb r3, [r2, #0x14]
	adds r4, #0xa
	adds r0, r1, r4
	str r0, [r2, #0x18]
	movs r2, #0x1e
	mov r0, ip
	strb r2, [r0, #0x1c]
	adds r4, #0x1e
	adds r0, r1, r4
	mov r4, ip
	str r0, [r4, #0x20]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	ldr r2, _0816177C
	adds r0, r1, r2
	str r0, [r4, #0x28]
	mov r0, ip
	adds r0, #0x2c
	strb r3, [r0]
	ldr r4, _08161780
	adds r0, r1, r4
	mov r2, ip
	str r0, [r2, #0x30]
	adds r2, #0x34
	movs r0, #0x28
	strb r0, [r2]
	adds r4, #0x28
	adds r1, r1, r4
	mov r0, ip
	str r1, [r0, #0x38]
	adds r0, #0x3c
	strb r3, [r0]
	bl InitDecorationContextItems
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0816176C: .4byte 0x0203B90C
_08161770: .4byte 0x03005AEC
_08161774: .4byte 0x00002734
_08161778: .4byte 0x00002748
_0816177C: .4byte 0x0000278E
_08161780: .4byte 0x00002798
	thumb_func_end SetDecorationInventoriesPointers

	thumb_func_start ClearDecorationInventory
ClearDecorationInventory: @ 0x08161784
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	movs r3, #0
	ldr r1, _081617B4
	lsrs r2, r0, #0x15
	adds r0, r2, r1
	ldrb r0, [r0, #4]
	cmp r3, r0
	bhs _081617AE
	adds r5, r1, #0
	movs r4, #0
_0816179A:
	adds r0, r2, r5
	ldr r1, [r0]
	adds r1, r1, r3
	strb r4, [r1]
	adds r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldrb r0, [r0, #4]
	cmp r3, r0
	blo _0816179A
_081617AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081617B4: .4byte 0x0203B90C
	thumb_func_end ClearDecorationInventory

	thumb_func_start ClearDecorationInventories
ClearDecorationInventories: @ 0x081617B8
	push {r4, lr}
	movs r4, #0
_081617BC:
	adds r0, r4, #0
	bl ClearDecorationInventory
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _081617BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ClearDecorationInventories

	thumb_func_start GetFirstEmptyDecorSlot
GetFirstEmptyDecorSlot: @ 0x081617D4
	push {r4, lr}
	lsls r0, r0, #0x18
	movs r2, #0
	ldr r1, _08161800
	lsrs r0, r0, #0x15
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	cmp r2, r1
	bge _08161810
	adds r4, r0, #0
	adds r3, r1, #0
_081617EC:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	ldr r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08161804
	adds r0, r1, #0
	b _08161814
	.align 2, 0
_08161800: .4byte 0x0203B90C
_08161804:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r3
	blt _081617EC
_08161810:
	movs r0, #1
	rsbs r0, r0, #0
_08161814:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetFirstEmptyDecorSlot

	thumb_func_start CheckHasDecoration
CheckHasDecoration: @ 0x0816181C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _0816184C
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xe]
	movs r2, #0
	ldr r1, _08161850
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #4]
	cmp r2, r1
	bhs _0816185E
	ldr r4, [r0]
_0816183E:
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, r3
	bne _08161854
	movs r0, #1
	b _08161860
	.align 2, 0
_0816184C: .4byte 0x08580CD0
_08161850: .4byte 0x0203B90C
_08161854:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blo _0816183E
_0816185E:
	movs r0, #0
_08161860:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckHasDecoration

	thumb_func_start DecorationAdd
DecorationAdd: @ 0x08161868
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0
	beq _081618AC
	ldr r1, _081618A4
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0, #0xe]
	adds r0, r5, #0
	bl GetFirstEmptyDecorSlot
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _081618AC
	ldr r0, _081618A8
	lsls r1, r5, #3
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	strb r4, [r0]
	movs r0, #1
	b _081618AE
	.align 2, 0
_081618A4: .4byte 0x08580CD0
_081618A8: .4byte 0x0203B90C
_081618AC:
	movs r0, #0
_081618AE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end DecorationAdd

	thumb_func_start DecorationCheckSpace
DecorationCheckSpace: @ 0x081618B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _081618E4
	ldr r1, _081618E0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xe]
	bl GetFirstEmptyDecorSlot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _081618E4
	movs r0, #1
	b _081618E6
	.align 2, 0
_081618E0: .4byte 0x08580CD0
_081618E4:
	movs r0, #0
_081618E6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DecorationCheckSpace

	thumb_func_start DecorationRemove
DecorationRemove: @ 0x081618EC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	cmp r4, #0
	bne _08161908
	b _0816193A
_081618FA:
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	bl CondenseDecorationsInCategory
	movs r0, #1
	b _0816193C
_08161908:
	ldr r2, _08161944
	ldr r1, _08161948
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0, #0xe]
	lsls r0, r5, #3
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	cmp r3, r1
	bhs _0816193A
	adds r6, r5, #0
	adds r5, r0, #0
	adds r2, r1, #0
_08161926:
	ldr r0, [r5]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, r4
	beq _081618FA
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _08161926
_0816193A:
	movs r0, #0
_0816193C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08161944: .4byte 0x0203B90C
_08161948: .4byte 0x08580CD0
	thumb_func_end DecorationRemove

	thumb_func_start CondenseDecorationsInCategory
CondenseDecorationsInCategory: @ 0x0816194C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	movs r6, #0
	ldr r2, _081619E0
	lsrs r0, r0, #0x15
	adds r1, r0, r2
	ldrb r3, [r1, #4]
	cmp r6, r3
	bhs _081619D0
	adds r7, r0, #0
	mov sl, r1
	mov r0, sl
	str r0, [sp]
_08161970:
	adds r1, r6, #1
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	adds r2, r7, #0
	mov ip, r1
	mov r1, sl
	ldrb r1, [r1, #4]
	cmp r3, r1
	bhs _081619C2
	ldr r0, _081619E0
	mov sb, r0
	adds r1, r0, #0
	mov r8, r1
_0816198A:
	mov r0, sb
	adds r5, r2, r0
	ldr r1, [r5]
	adds r0, r1, r3
	ldrb r4, [r0]
	adds r2, r4, #0
	cmp r2, #0
	beq _081619B0
	adds r0, r1, r6
	ldrb r1, [r0]
	cmp r1, #0
	beq _081619A6
	cmp r1, r2
	bls _081619B0
_081619A6:
	ldrb r1, [r0]
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, r0, r3
	strb r1, [r0]
_081619B0:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, r7, #0
	mov r1, r8
	adds r0, r2, r1
	ldrb r0, [r0, #4]
	cmp r3, r0
	blo _0816198A
_081619C2:
	mov r3, ip
	lsls r0, r3, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [sp]
	ldrb r0, [r0, #4]
	cmp r6, r0
	blo _08161970
_081619D0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081619E0: .4byte 0x0203B90C
	thumb_func_end CondenseDecorationsInCategory

	thumb_func_start GetNumOwnedDecorationsInCategory
GetNumOwnedDecorationsInCategory: @ 0x081619E4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	movs r4, #0
	movs r3, #0
	ldr r2, _08161A20
	lsrs r1, r0, #0x15
	adds r0, r1, r2
	ldrb r0, [r0, #4]
	cmp r4, r0
	bhs _08161A18
	adds r5, r2, #0
_081619FA:
	adds r2, r1, r5
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08161A0C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08161A0C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r2, [r2, #4]
	cmp r3, r2
	blo _081619FA
_08161A18:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08161A20: .4byte 0x0203B90C
	thumb_func_end GetNumOwnedDecorationsInCategory

	thumb_func_start GetNumOwnedDecorations
GetNumOwnedDecorations: @ 0x08161A24
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_08161A2A:
	adds r0, r4, #0
	bl GetNumOwnedDecorationsInCategory
	adds r0, r5, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _08161A2A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetNumOwnedDecorations

