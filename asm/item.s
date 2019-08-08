.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetBagItemQuantity
GetBagItemQuantity: @ 0x080D5DD8
	adds r1, r0, #0
	ldr r0, _080D5DEC
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	ldrh r1, [r1]
	eors r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080D5DEC: .4byte 0x03005AF0
	thumb_func_end GetBagItemQuantity

	thumb_func_start SetBagItemQuantity
SetBagItemQuantity: @ 0x080D5DF0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _080D5E04
	ldr r2, [r2]
	adds r2, #0xac
	ldr r2, [r2]
	eors r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_080D5E04: .4byte 0x03005AF0
	thumb_func_end SetBagItemQuantity

	thumb_func_start GetPCItemQuantity
GetPCItemQuantity: @ 0x080D5E08
	ldrh r0, [r0]
	bx lr
	thumb_func_end GetPCItemQuantity

	thumb_func_start SetPCItemQuantity
SetPCItemQuantity: @ 0x080D5E0C
	strh r1, [r0]
	bx lr
	thumb_func_end SetPCItemQuantity

	thumb_func_start ApplyNewEncryptionKeyToBagItems
ApplyNewEncryptionKeyToBagItems: @ 0x080D5E10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	movs r1, #0
	ldr r0, _080D5E64
	mov sb, r0
_080D5E22:
	movs r6, #0
	lsls r5, r1, #3
	mov r2, sb
	adds r0, r5, r2
	adds r7, r1, #1
	ldrb r0, [r0, #4]
	cmp r6, r0
	bhs _080D5E50
	ldr r2, _080D5E64
_080D5E34:
	adds r4, r5, r2
	lsls r1, r6, #2
	ldr r0, [r4]
	adds r0, r0, r1
	adds r0, #2
	mov r1, r8
	str r2, [sp]
	bl ApplyNewEncryptionKeyToHword
	adds r6, #1
	ldr r2, [sp]
	ldrb r4, [r4, #4]
	cmp r6, r4
	blo _080D5E34
_080D5E50:
	adds r1, r7, #0
	cmp r1, #4
	bls _080D5E22
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5E64: .4byte 0x02039A78
	thumb_func_end ApplyNewEncryptionKeyToBagItems

	thumb_func_start ApplyNewEncryptionKeyToBagItems_
ApplyNewEncryptionKeyToBagItems_: @ 0x080D5E68
	push {lr}
	bl ApplyNewEncryptionKeyToBagItems
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ApplyNewEncryptionKeyToBagItems_

	thumb_func_start SetBagItemsPointers
SetBagItemsPointers: @ 0x080D5E74
	push {r4, lr}
	ldr r1, _080D5EC0
	ldr r0, _080D5EC4
	ldr r2, [r0]
	movs r3, #0xac
	lsls r3, r3, #3
	adds r0, r2, r3
	str r0, [r1]
	movs r3, #0x1e
	strb r3, [r1, #4]
	movs r4, #0xbb
	lsls r4, r4, #3
	adds r0, r2, r4
	str r0, [r1, #0x20]
	adds r0, r1, #0
	adds r0, #0x24
	strb r3, [r0]
	movs r3, #0xca
	lsls r3, r3, #3
	adds r0, r2, r3
	str r0, [r1, #8]
	movs r0, #0x10
	strb r0, [r1, #0xc]
	adds r4, #0xb8
	adds r0, r2, r4
	str r0, [r1, #0x10]
	movs r0, #0x40
	strb r0, [r1, #0x14]
	movs r0, #0xf2
	lsls r0, r0, #3
	adds r2, r2, r0
	str r2, [r1, #0x18]
	movs r0, #0x2e
	strb r0, [r1, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5EC0: .4byte 0x02039A78
_080D5EC4: .4byte 0x03005AEC
	thumb_func_end SetBagItemsPointers

	thumb_func_start CopyItemName
CopyItemName: @ 0x080D5EC8
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bne _080D5EF0
	movs r0, #0x2b
	bl GetBerryInfo
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _080D5EEC
	adds r0, r4, #0
	bl StringAppend
	b _080D5EFC
	.align 2, 0
_080D5EEC: .4byte 0x085C9440
_080D5EF0:
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
_080D5EFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CopyItemName

	thumb_func_start IsBagPocketNonEmpty
IsBagPocketNonEmpty: @ 0x080D5F04
	push {lr}
	lsls r0, r0, #0x18
	movs r2, #0
	ldr r1, _080D5F28
	lsrs r0, r0, #0x15
	subs r0, #8
	adds r0, r0, r1
	ldrb r1, [r0, #4]
	cmp r2, r1
	bhs _080D5F36
	ldr r3, [r0]
_080D5F1A:
	lsls r0, r2, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, #0
	beq _080D5F2C
	movs r0, #1
	b _080D5F38
	.align 2, 0
_080D5F28: .4byte 0x02039A78
_080D5F2C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blo _080D5F1A
_080D5F36:
	movs r0, #0
_080D5F38:
	pop {r1}
	bx r1
	thumb_func_end IsBagPocketNonEmpty

	thumb_func_start CheckBagHasItem
CheckBagHasItem: @ 0x080D5F3C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r7, #0
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D5FCE
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D5F6A
	ldr r0, _080D5F78
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D5F80
_080D5F6A:
	adds r0, r7, #0
	adds r1, r5, #0
	bl CheckPyramidBagHasItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080D5FD0
	.align 2, 0
_080D5F78: .4byte 0x00004004
_080D5F7C:
	movs r0, #1
	b _080D5FD0
_080D5F80:
	adds r0, r7, #0
	bl ItemId_GetImportance
	subs r0, #1
	lsls r0, r0, #0x18
	movs r6, #0
	ldr r1, _080D5F94
	lsrs r4, r0, #0x15
	b _080D5FC6
	.align 2, 0
_080D5F94: .4byte 0x02039A78
_080D5F98:
	adds r0, r4, r1
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r7
	bne _080D5FBE
	adds r0, r1, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	bhs _080D5F7C
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080D5F7C
_080D5FBE:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080D5FD8
_080D5FC6:
	adds r0, r4, r1
	ldrb r0, [r0, #4]
	cmp r6, r0
	blo _080D5F98
_080D5FCE:
	movs r0, #0
_080D5FD0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D5FD8: .4byte 0x02039A78
	thumb_func_end CheckBagHasItem

	thumb_func_start HasAtLeastOneBerry
HasAtLeastOneBerry: @ 0x080D5FDC
	push {r4, lr}
	movs r4, #0x85
_080D5FE0:
	adds r0, r4, #0
	movs r1, #1
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080D5FFC
	ldr r0, _080D5FF8
	strh r1, [r0]
	movs r0, #1
	b _080D600E
	.align 2, 0
_080D5FF8: .4byte 0x02037290
_080D5FFC:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xb2
	bls _080D5FE0
	ldr r1, _080D6014
	movs r0, #0
	strh r0, [r1]
	movs r0, #0
_080D600E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6014: .4byte 0x02037290
	thumb_func_end HasAtLeastOneBerry

	thumb_func_start CheckBagHasSpace
CheckBagHasSpace: @ 0x080D6018
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D611E
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D6050
	ldr r0, _080D6060
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D6064
_080D6050:
	mov r0, r8
	adds r1, r5, #0
	bl CheckPyramidBagHasSpace
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080D612E
	.align 2, 0
_080D6060: .4byte 0x00004004
_080D6064:
	mov r0, r8
	bl ItemId_GetImportance
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r7, _080D6124
	cmp r2, #3
	beq _080D6078
	movs r7, #0x63
_080D6078:
	movs r6, #0
	ldr r1, _080D6128
	lsls r4, r2, #3
	adds r0, r4, r1
	mov sb, r4
	ldrb r0, [r0, #4]
	cmp r6, r0
	bhs _080D60D4
	subs r0, r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_080D6090:
	adds r0, r4, r1
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r8
	bne _080D60C4
	adds r0, r1, #2
	str r2, [sp]
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, r5
	ldr r2, [sp]
	cmp r0, r7
	ble _080D612C
	mov r0, sl
	cmp r0, #1
	bls _080D611E
	subs r0, r7, r1
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080D612C
_080D60C4:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080D6128
	adds r0, r4, r1
	ldrb r0, [r0, #4]
	cmp r6, r0
	blo _080D6090
_080D60D4:
	cmp r5, #0
	beq _080D612C
	movs r6, #0
	ldr r3, _080D6128
	mov r1, sb
	adds r0, r1, r3
	ldrb r0, [r0, #4]
	cmp r6, r0
	bhs _080D611A
	adds r4, r3, #0
	subs r0, r2, #2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080D60EE:
	adds r0, r1, r4
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080D610A
	cmp r5, r7
	bls _080D612C
	cmp r2, #1
	bls _080D611E
	subs r0, r5, r7
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080D610A:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, sb
	adds r0, r1, r3
	ldrb r0, [r0, #4]
	cmp r6, r0
	blo _080D60EE
_080D611A:
	cmp r5, #0
	beq _080D612C
_080D611E:
	movs r0, #0
	b _080D612E
	.align 2, 0
_080D6124: .4byte 0x000003E7
_080D6128: .4byte 0x02039A78
_080D612C:
	movs r0, #1
_080D612E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckBagHasSpace

	thumb_func_start AddBagItem
AddBagItem: @ 0x080D6140
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D6164
	movs r0, #0
	b _080D62AA
_080D6164:
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D617C
	ldr r0, _080D618C
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D6190
_080D617C:
	mov r0, sb
	adds r1, r5, #0
	bl AddPyramidBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080D62AA
	.align 2, 0
_080D618C: .4byte 0x00004004
_080D6190:
	mov r0, sb
	bl ItemId_GetImportance
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r0, #3
	ldr r0, _080D6250
	adds r7, r1, r0
	ldrb r0, [r7, #4]
	lsls r0, r0, #2
	bl AllocZeroed
	mov r8, r0
	ldr r1, [r7]
	ldrb r2, [r7, #4]
	lsls r2, r2, #2
	bl memcpy
	ldr r2, _080D6254
	mov r0, sl
	cmp r0, #3
	beq _080D61C2
	movs r2, #0x63
_080D61C2:
	movs r6, #0
	ldrb r0, [r7, #4]
	cmp r6, r0
	bhs _080D621E
	mov r0, sl
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
_080D61D4:
	lsls r0, r6, #2
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, sb
	bne _080D6212
	adds r4, r1, #2
	adds r0, r4, #0
	str r2, [sp, #4]
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, r5
	ldr r2, [sp, #4]
	cmp r1, r2
	ble _080D6280
	ldr r1, [sp]
	cmp r1, #1
	bls _080D628C
	subs r0, r2, r0
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl SetBagItemQuantity
	ldr r2, [sp, #4]
	cmp r5, #0
	beq _080D6296
_080D6212:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r7, #4]
	cmp r6, r0
	blo _080D61D4
_080D621E:
	cmp r5, #0
	beq _080D6296
	movs r6, #0
	cmp r6, r0
	bhs _080D627A
	mov r0, sl
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080D6230:
	lsls r0, r6, #2
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, #0
	bne _080D626E
	mov r0, sb
	strh r0, [r1]
	cmp r5, r2
	bhi _080D6258
	adds r0, r1, #2
	adds r1, r5, #0
	bl SetBagItemQuantity
	b _080D6296
	.align 2, 0
_080D6250: .4byte 0x02039A78
_080D6254: .4byte 0x000003E7
_080D6258:
	cmp r4, #1
	bls _080D628C
	subs r0, r5, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r1, #2
	adds r1, r2, #0
	str r2, [sp, #4]
	bl SetBagItemQuantity
	ldr r2, [sp, #4]
_080D626E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r1, [r7, #4]
	cmp r6, r1
	blo _080D6230
_080D627A:
	cmp r5, #0
	beq _080D6296
	b _080D628C
_080D6280:
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBagItemQuantity
	b _080D6296
_080D628C:
	mov r0, r8
	bl Free
	movs r0, #0
	b _080D62AA
_080D6296:
	ldr r0, [r7]
	ldrb r2, [r7, #4]
	lsls r2, r2, #2
	mov r1, r8
	bl memcpy
	mov r0, r8
	bl Free
	movs r0, #1
_080D62AA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AddBagItem

	thumb_func_start RemoveBagItem
RemoveBagItem: @ 0x080D62BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r4, #0
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D6350
	mov r0, r8
	cmp r0, #0
	beq _080D6350
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D62F8
	ldr r0, _080D6308
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D630C
_080D62F8:
	mov r0, r8
	adds r1, r7, #0
	bl RemovePyramidBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080D6472
	.align 2, 0
_080D6308: .4byte 0x00004004
_080D630C:
	mov r0, r8
	bl ItemId_GetImportance
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r0, #3
	ldr r0, _080D6354
	adds r5, r1, r0
	movs r6, #0
	ldrb r2, [r5, #4]
	cmp r6, r2
	bhs _080D634C
_080D6328:
	ldr r0, [r5]
	lsls r1, r6, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, r8
	bne _080D6340
	adds r0, r1, #2
	bl GetBagItemQuantity
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080D6340:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r5, #4]
	cmp r6, r0
	blo _080D6328
_080D634C:
	cmp r4, r7
	bhs _080D6358
_080D6350:
	movs r0, #0
	b _080D6472
	.align 2, 0
_080D6354: .4byte 0x02039A78
_080D6358:
	bl CurMapIsSecretBase
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080D6388
	ldr r4, _080D63C8
	adds r0, r4, #0
	bl VarGet
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl VarSet
	ldr r0, _080D63CC
	mov r1, r8
	bl VarSet
_080D6388:
	mov r0, sb
	bl GetItemListPosition
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r5, #4]
	cmp r0, r1
	bls _080D63FE
	ldr r0, [r5]
	lsls r1, r1, #2
	adds r2, r1, r0
	ldrh r0, [r2]
	adds r4, r1, #0
	cmp r0, r8
	bne _080D63FE
	adds r0, r2, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r7
	blo _080D63D0
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #2
	subs r1, r1, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SetBagItemQuantity
	movs r7, #0
	b _080D63E2
	.align 2, 0
_080D63C8: .4byte 0x000040EE
_080D63CC: .4byte 0x000040ED
_080D63D0:
	subs r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #2
	movs r1, #0
	bl SetBagItemQuantity
_080D63E2:
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _080D63FA
	ldr r0, [r5]
	adds r0, r4, r0
	strh r2, [r0]
_080D63FA:
	cmp r7, #0
	beq _080D6470
_080D63FE:
	movs r6, #0
	ldrb r0, [r5, #4]
	cmp r6, r0
	bhs _080D6470
_080D6406:
	ldr r0, [r5]
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrh r0, [r2]
	adds r4, r1, #0
	cmp r0, r8
	bne _080D6464
	adds r0, r2, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r7
	blo _080D6436
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #2
	subs r1, r1, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SetBagItemQuantity
	movs r7, #0
	b _080D6448
_080D6436:
	subs r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #2
	movs r1, #0
	bl SetBagItemQuantity
_080D6448:
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _080D6460
	ldr r0, [r5]
	adds r0, r4, r0
	strh r2, [r0]
_080D6460:
	cmp r7, #0
	beq _080D6470
_080D6464:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r2, [r5, #4]
	cmp r6, r2
	blo _080D6406
_080D6470:
	movs r0, #1
_080D6472:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RemoveBagItem

	thumb_func_start GetPocketByItemId
GetPocketByItemId: @ 0x080D6480
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetPocketByItemId

	thumb_func_start ClearItemSlots
ClearItemSlots: @ 0x080D6494
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	movs r4, #0
	lsrs r1, r1, #0x18
	cmp r4, r1
	bhs _080D64BE
	adds r5, r1, #0
	movs r7, #0
_080D64A6:
	lsls r0, r4, #2
	adds r0, r0, r6
	strh r7, [r0]
	adds r0, #2
	movs r1, #0
	bl SetBagItemQuantity
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	blo _080D64A6
_080D64BE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end ClearItemSlots

	thumb_func_start FindFreePCItemSlot
FindFreePCItemSlot: @ 0x080D64C4
	push {lr}
	movs r1, #0
	ldr r0, _080D64E4
	ldr r2, [r0]
	movs r3, #0x93
	lsls r3, r3, #3
_080D64D0:
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsls r0, r1, #2
	adds r0, r2, r0
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _080D64E8
	adds r0, r1, #0
	b _080D64F8
	.align 2, 0
_080D64E4: .4byte 0x03005AEC
_080D64E8:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x31
	ble _080D64D0
	movs r0, #1
	rsbs r0, r0, #0
_080D64F8:
	pop {r1}
	bx r1
	thumb_func_end FindFreePCItemSlot

	thumb_func_start CountUsedPCItemSlots
CountUsedPCItemSlots: @ 0x080D64FC
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r0, _080D6530
	ldr r3, [r0]
	movs r4, #0x93
	lsls r4, r4, #3
_080D650A:
	lsls r0, r1, #2
	adds r0, r3, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	beq _080D651C
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080D651C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x31
	bls _080D650A
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6530: .4byte 0x03005AEC
	thumb_func_end CountUsedPCItemSlots

	thumb_func_start CheckPCHasItem
CheckPCHasItem: @ 0x080D6534
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r4, #0
_080D6540:
	ldr r0, _080D656C
	ldr r2, [r0]
	lsls r1, r4, #2
	adds r0, r2, r1
	movs r3, #0x93
	lsls r3, r3, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r6
	bne _080D6574
	adds r0, r1, r2
	ldr r1, _080D6570
	adds r0, r0, r1
	bl GetPCItemQuantity
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	blo _080D6574
	movs r0, #1
	b _080D6580
	.align 2, 0
_080D656C: .4byte 0x03005AEC
_080D6570: .4byte 0x0000049A
_080D6574:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x31
	bls _080D6540
	movs r0, #0
_080D6580:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckPCHasItem

	thumb_func_start AddPCItem
AddPCItem: @ 0x080D6588
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0xc8
	bl AllocZeroed
	adds r7, r0, #0
	ldr r0, _080D6610
	ldr r1, [r0]
	movs r0, #0x93
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r7, #0
	movs r2, #0xc8
	bl memcpy
	movs r6, #0
_080D65B4:
	lsls r0, r6, #2
	adds r1, r0, r7
	ldrh r0, [r1]
	cmp r0, r8
	bne _080D65E8
	adds r4, r1, #2
	adds r0, r4, #0
	bl GetPCItemQuantity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r1, r2, r5
	ldr r3, _080D6614
	cmp r1, r3
	ble _080D661C
	ldr r1, _080D6618
	adds r0, r5, r1
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	adds r1, r3, #0
	bl SetPCItemQuantity
	cmp r5, #0
	beq _080D6638
_080D65E8:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x31
	bls _080D65B4
	cmp r5, #0
	beq _080D6638
	bl FindFreePCItemSlot
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D6628
	adds r0, r7, #0
	bl Free
	movs r0, #0
	b _080D6652
	.align 2, 0
_080D6610: .4byte 0x03005AEC
_080D6614: .4byte 0x000003E7
_080D6618: .4byte 0x0000FC19
_080D661C:
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetPCItemQuantity
	b _080D6638
_080D6628:
	lsls r0, r1, #2
	adds r0, r0, r7
	mov r1, r8
	strh r1, [r0]
	adds r0, #2
	adds r1, r5, #0
	bl SetPCItemQuantity
_080D6638:
	ldr r0, _080D665C
	ldr r0, [r0]
	movs r1, #0x93
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r1, r7, #0
	movs r2, #0xc8
	bl memcpy
	adds r0, r7, #0
	bl Free
	movs r0, #1
_080D6652:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D665C: .4byte 0x03005AEC
	thumb_func_end AddPCItem

	thumb_func_start RemovePCItem
RemovePCItem: @ 0x080D6660
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _080D6694
	ldr r2, [r2]
	lsrs r0, r0, #0x16
	adds r3, r2, r0
	ldr r0, _080D6698
	adds r2, r3, r0
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080D668E
	movs r2, #0x93
	lsls r2, r2, #3
	adds r0, r3, r2
	strh r1, [r0]
	bl CompactPCItems
_080D668E:
	pop {r0}
	bx r0
	.align 2, 0
_080D6694: .4byte 0x03005AEC
_080D6698: .4byte 0x0000049A
	thumb_func_end RemovePCItem

	thumb_func_start CompactPCItems
CompactPCItems: @ 0x080D669C
	push {r4, r5, r6, r7, lr}
	movs r2, #0
_080D66A0:
	adds r1, r2, #1
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	adds r6, r1, #0
	cmp r4, #0x31
	bhi _080D66E2
	ldr r0, _080D66F0
	mov ip, r0
	lsls r5, r2, #2
	movs r7, #0x93
	lsls r7, r7, #3
_080D66B6:
	mov r0, ip
	ldr r1, [r0]
	adds r0, r1, r5
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, #0
	bne _080D66D8
	movs r0, #0x93
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r2, r1, r5
	ldr r3, [r2]
	lsls r0, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
_080D66D8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x31
	bls _080D66B6
_080D66E2:
	lsls r0, r6, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x30
	bls _080D66A0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D66F0: .4byte 0x03005AEC
	thumb_func_end CompactPCItems

	thumb_func_start SwapRegisteredBike
SwapRegisteredBike: @ 0x080D66F4
	push {lr}
	ldr r0, _080D6710
	ldr r0, [r0]
	ldr r2, _080D6714
	adds r1, r0, r2
	ldrh r2, [r1]
	ldr r3, _080D6718
	cmp r2, r3
	beq _080D671C
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r2, r0
	beq _080D6724
	b _080D6726
	.align 2, 0
_080D6710: .4byte 0x03005AEC
_080D6714: .4byte 0x00000496
_080D6718: .4byte 0x00000103
_080D671C:
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	b _080D6726
_080D6724:
	strh r3, [r1]
_080D6726:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SwapRegisteredBike

	thumb_func_start BagGetItemIdByPocketPosition
BagGetItemIdByPocketPosition: @ 0x080D672C
	lsls r0, r0, #0x18
	lsls r1, r1, #0x10
	ldr r2, _080D6744
	lsrs r0, r0, #0x15
	subs r0, #8
	adds r0, r0, r2
	ldr r0, [r0]
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_080D6744: .4byte 0x02039A78
	thumb_func_end BagGetItemIdByPocketPosition

	thumb_func_start BagGetQuantityByPocketPosition
BagGetQuantityByPocketPosition: @ 0x080D6748
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x10
	ldr r2, _080D676C
	lsrs r0, r0, #0x15
	subs r0, #8
	adds r0, r0, r2
	lsrs r1, r1, #0xe
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080D676C: .4byte 0x02039A78
	thumb_func_end BagGetQuantityByPocketPosition

	thumb_func_start SwapItemSlots
SwapItemSlots: @ 0x080D6770
	ldr r3, [r0]
	ldr r2, [r1]
	str r2, [r0]
	str r3, [r1]
	bx lr
	.align 2, 0
	thumb_func_end SwapItemSlots

	thumb_func_start CompactItemsInBagPocket
CompactItemsInBagPocket: @ 0x080D677C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r3, #0
	b _080D67BE
_080D6784:
	adds r1, r3, #1
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	adds r7, r1, #0
	cmp r4, r2
	bhs _080D67BA
	lsls r5, r3, #2
_080D6792:
	ldr r0, [r6]
	adds r0, r0, r5
	adds r0, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080D67AE
	ldr r1, [r6]
	adds r0, r1, r5
	lsls r2, r4, #2
	adds r1, r1, r2
	bl SwapItemSlots
_080D67AE:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r6, #4]
	cmp r4, r0
	blo _080D6792
_080D67BA:
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
_080D67BE:
	ldrb r2, [r6, #4]
	subs r0, r2, #1
	cmp r3, r0
	blt _080D6784
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end CompactItemsInBagPocket

	thumb_func_start SortBerriesOrTMHMs
SortBerriesOrTMHMs: @ 0x080D67CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r3, #0
	b _080D6832
_080D67D8:
	adds r1, r3, #1
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	mov r8, r1
	cmp r5, r2
	bhs _080D682C
	lsls r7, r3, #2
_080D67E6:
	ldr r0, [r6]
	adds r0, r0, r7
	adds r0, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	lsls r4, r5, #2
	cmp r0, #0
	beq _080D6816
	ldr r0, [r6]
	adds r0, r0, r4
	adds r0, #2
	bl GetBagItemQuantity
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080D6820
	ldr r0, [r6]
	adds r1, r7, r0
	adds r0, r4, r0
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bls _080D6820
_080D6816:
	ldr r1, [r6]
	adds r0, r1, r7
	adds r1, r1, r4
	bl SwapItemSlots
_080D6820:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r0, [r6, #4]
	cmp r5, r0
	blo _080D67E6
_080D682C:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
_080D6832:
	ldrb r2, [r6, #4]
	subs r0, r2, #1
	cmp r3, r0
	blt _080D67D8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SortBerriesOrTMHMs

	thumb_func_start MoveItemSlotInList
MoveItemSlotInList: @ 0x080D6844
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	cmp r1, r3
	beq _080D68A4
	lsls r0, r1, #2
	adds r0, r0, r4
	ldr r6, [r0]
	cmp r3, r1
	bls _080D687C
	subs r3, #1
	lsls r1, r1, #0x10
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	cmp r1, r0
	bge _080D689E
	adds r5, r2, #0
_080D6866:
	asrs r2, r1, #0x10
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r1, [r0, #4]
	str r1, [r0]
	adds r2, #1
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, r5
	blt _080D6866
	b _080D689E
_080D687C:
	lsls r1, r1, #0x10
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	cmp r1, r0
	ble _080D689E
	adds r5, r2, #0
_080D6888:
	asrs r2, r1, #0x10
	lsls r1, r2, #2
	adds r1, r1, r4
	subs r0, r1, #4
	ldr r0, [r0]
	str r0, [r1]
	subs r2, #1
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, r5
	bgt _080D6888
_080D689E:
	lsls r0, r3, #2
	adds r0, r0, r4
	str r6, [r0]
_080D68A4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MoveItemSlotInList

	thumb_func_start ClearBag
ClearBag: @ 0x080D68AC
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _080D68D0
_080D68B2:
	lsls r1, r4, #3
	adds r1, r1, r5
	ldr r0, [r1]
	ldrb r1, [r1, #4]
	bl ClearItemSlots
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080D68B2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D68D0: .4byte 0x02039A78
	thumb_func_end ClearBag

	thumb_func_start CountTotalItemQuantityInBag
CountTotalItemQuantityInBag: @ 0x080D68D4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r7, #0
	adds r0, r6, #0
	bl ItemId_GetImportance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	ldr r1, _080D6920
	adds r5, r0, r1
	movs r4, #0
	ldrb r0, [r5, #4]
	cmp r7, r0
	bhs _080D6916
_080D68F2:
	ldr r0, [r5]
	lsls r1, r4, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, r6
	bne _080D690A
	adds r0, r1, #2
	bl GetBagItemQuantity
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_080D690A:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r5, #4]
	cmp r4, r0
	blo _080D68F2
_080D6916:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D6920: .4byte 0x02039A70
	thumb_func_end CountTotalItemQuantityInBag

	thumb_func_start CheckPyramidBagHasItem
CheckPyramidBagHasItem: @ 0x080D6924
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _080D6978
	ldr r3, [r0]
	ldr r1, _080D697C
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080D6980
	adds r0, r0, r2
	adds r2, r3, r0
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080D6984
	adds r0, r0, r1
	adds r3, r3, r0
	movs r1, #0
_080D6958:
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, r5
	bne _080D6988
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, r4
	bhs _080D6974
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080D6988
_080D6974:
	movs r0, #1
	b _080D6994
	.align 2, 0
_080D6978: .4byte 0x03005AF0
_080D697C: .4byte 0x00000CA9
_080D6980: .4byte 0x00000E2C
_080D6984: .4byte 0x00000E54
_080D6988:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	bls _080D6958
	movs r0, #0
_080D6994:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckPyramidBagHasItem

	thumb_func_start CheckPyramidBagHasSpace
CheckPyramidBagHasSpace: @ 0x080D699C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _080D69F8
	ldr r3, [r0]
	ldr r1, _080D69FC
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080D6A00
	adds r0, r0, r2
	adds r2, r3, r0
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080D6A04
	adds r0, r0, r1
	adds r3, r3, r0
	movs r1, #0
_080D69D0:
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, r5
	beq _080D69DE
	cmp r0, #0
	bne _080D6A08
_080D69DE:
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r0, r0, r4
	cmp r0, #0x63
	ble _080D69F2
	subs r0, #0x63
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080D6A08
_080D69F2:
	movs r0, #1
	b _080D6A14
	.align 2, 0
_080D69F8: .4byte 0x03005AF0
_080D69FC: .4byte 0x00000CA9
_080D6A00: .4byte 0x00000E2C
_080D6A04: .4byte 0x00000E54
_080D6A08:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #9
	bls _080D69D0
	movs r0, #0
_080D6A14:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CheckPyramidBagHasSpace

	thumb_func_start AddPyramidBagItem
AddPyramidBagItem: @ 0x080D6A1C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _080D6AAC
	ldr r3, [r0]
	ldr r1, _080D6AB0
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080D6AB4
	adds r0, r0, r2
	adds r0, r0, r3
	mov sb, r0
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080D6AB8
	adds r0, r0, r1
	adds r3, r3, r0
	mov r8, r3
	movs r0, #0x14
	bl Alloc
	adds r5, r0, #0
	movs r0, #0xa
	bl Alloc
	adds r6, r0, #0
	adds r0, r5, #0
	mov r1, sb
	movs r2, #0x14
	bl memcpy
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0xa
	bl memcpy
	movs r2, #0
_080D6A7E:
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, r7
	bne _080D6AC2
	adds r1, r6, r2
	ldrb r0, [r1]
	cmp r0, #0x62
	bhi _080D6AC2
	adds r0, r0, r4
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bls _080D6ABC
	ldrb r0, [r1]
	subs r0, #0x63
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x63
	strb r0, [r1]
	b _080D6ABE
	.align 2, 0
_080D6AAC: .4byte 0x03005AF0
_080D6AB0: .4byte 0x00000CA9
_080D6AB4: .4byte 0x00000E2C
_080D6AB8: .4byte 0x00000E54
_080D6ABC:
	movs r4, #0
_080D6ABE:
	cmp r4, #0
	beq _080D6B1C
_080D6AC2:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #9
	bls _080D6A7E
	cmp r4, #0
	beq _080D6B1C
	movs r2, #0
_080D6AD2:
	lsls r0, r2, #1
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, #0
	bne _080D6AFE
	strh r7, [r1]
	adds r1, r6, r2
	strb r4, [r1]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bls _080D6AF8
	ldrb r0, [r1]
	subs r0, #0x63
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x63
	strb r0, [r1]
	b _080D6AFA
_080D6AF8:
	movs r4, #0
_080D6AFA:
	cmp r4, #0
	beq _080D6B1C
_080D6AFE:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #9
	bls _080D6AD2
	cmp r4, #0
	beq _080D6B1C
	adds r0, r5, #0
	bl Free
	adds r0, r6, #0
	bl Free
	movs r0, #0
	b _080D6B3E
_080D6B1C:
	mov r0, sb
	adds r1, r5, #0
	movs r2, #0x14
	bl memcpy
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0xa
	bl memcpy
	adds r0, r5, #0
	bl Free
	adds r0, r6, #0
	bl Free
	movs r0, #1
_080D6B3E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end AddPyramidBagItem

	thumb_func_start RemovePyramidBagItem
RemovePyramidBagItem: @ 0x080D6B4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _080D6BB8
	ldr r3, [r0]
	ldr r1, _080D6BBC
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #0x1e
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080D6BC0
	adds r0, r0, r2
	adds r0, r0, r3
	mov r8, r0
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080D6BC4
	adds r0, r0, r1
	adds r7, r3, r0
	ldr r1, _080D6BC8
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r2, #1
	mov r1, r8
	adds r3, r0, r1
	ldrh r0, [r3]
	cmp r0, sb
	bne _080D6BCC
	adds r1, r7, r2
	ldrb r0, [r1]
	cmp r0, r4
	blo _080D6BCC
	subs r0, r0, r4
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080D6C64
	strh r0, [r3]
	b _080D6C64
	.align 2, 0
_080D6BB8: .4byte 0x03005AF0
_080D6BBC: .4byte 0x00000CA9
_080D6BC0: .4byte 0x00000E2C
_080D6BC4: .4byte 0x00000E54
_080D6BC8: .4byte 0x0203CBFC
_080D6BCC:
	movs r0, #0x14
	bl Alloc
	adds r5, r0, #0
	movs r0, #0xa
	bl Alloc
	adds r6, r0, #0
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0x14
	bl memcpy
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xa
	bl memcpy
	movs r2, #0
_080D6BF2:
	lsls r0, r2, #1
	adds r3, r0, r5
	ldrh r0, [r3]
	cmp r0, sb
	bne _080D6C26
	adds r1, r6, r2
	ldrb r0, [r1]
	cmp r0, r4
	blo _080D6C14
	subs r0, r0, r4
	strb r0, [r1]
	movs r4, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080D6C22
	strh r4, [r3]
	b _080D6C22
_080D6C14:
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	strh r0, [r3]
_080D6C22:
	cmp r4, #0
	beq _080D6C44
_080D6C26:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #9
	bls _080D6BF2
	cmp r4, #0
	beq _080D6C44
	adds r0, r5, #0
	bl Free
	adds r0, r6, #0
	bl Free
	movs r0, #0
	b _080D6C66
_080D6C44:
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0x14
	bl memcpy
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0xa
	bl memcpy
	adds r0, r5, #0
	bl Free
	adds r0, r6, #0
	bl Free
_080D6C64:
	movs r0, #1
_080D6C66:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RemovePyramidBagItem

	thumb_func_start SanitizeItemId
SanitizeItemId: @ 0x080D6C74
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xbc
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080D6C86
	adds r0, r1, #0
	b _080D6C88
_080D6C86:
	movs r0, #0
_080D6C88:
	pop {r1}
	bx r1
	thumb_func_end SanitizeItemId

	thumb_func_start ItemId_GetName
ItemId_GetName: @ 0x080D6C8C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SanitizeItemId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _080D6CAC
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080D6CAC: .4byte 0x0855CEE8
	thumb_func_end ItemId_GetName

	thumb_func_start sub_080D6CB0
sub_080D6CB0: @ 0x080D6CB0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6CD0
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #0xa]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6CD0: .4byte 0x0855CEE8
	thumb_func_end sub_080D6CB0

	thumb_func_start sub_080D6CD4
sub_080D6CD4: @ 0x080D6CD4
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6CF4
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #0xc]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6CF4: .4byte 0x0855CEE8
	thumb_func_end sub_080D6CD4

	thumb_func_start sub_080D6CF8
sub_080D6CF8: @ 0x080D6CF8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6D18
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0xe]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6D18: .4byte 0x0855CEE8
	thumb_func_end sub_080D6CF8

	thumb_func_start sub_080D6D1C
sub_080D6D1C: @ 0x080D6D1C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6D3C
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0xf]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6D3C: .4byte 0x0855CEE8
	thumb_func_end sub_080D6D1C

	thumb_func_start ItemId_GetHoldEffect
ItemId_GetHoldEffect: @ 0x080D6D40
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6D64
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, #0x10
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6D64: .4byte 0x0855CEE8
	thumb_func_end ItemId_GetHoldEffect

	thumb_func_start ItemId_GetHoldEffectParam
ItemId_GetHoldEffectParam: @ 0x080D6D68
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6D88
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0x14]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6D88: .4byte 0x0855CEE8
	thumb_func_end ItemId_GetHoldEffectParam

	thumb_func_start sub_080D6D8C
sub_080D6D8C: @ 0x080D6D8C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6DAC
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0x15]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6DAC: .4byte 0x0855CEE8
	thumb_func_end sub_080D6D8C

	thumb_func_start ItemId_GetImportance
ItemId_GetImportance: @ 0x080D6DB0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6DD0
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0x16]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6DD0: .4byte 0x0855CEE8
	thumb_func_end ItemId_GetImportance

	thumb_func_start ItemId_GetPocket
ItemId_GetPocket: @ 0x080D6DD4
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6DF4
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0x17]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6DF4: .4byte 0x0855CEE8
	thumb_func_end ItemId_GetPocket

	thumb_func_start sub_080D6DF8
sub_080D6DF8: @ 0x080D6DF8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6E1C
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, #0x18
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6E1C: .4byte 0x0855CEE8
	thumb_func_end sub_080D6DF8

	thumb_func_start ItemId_GetSecondaryId
ItemId_GetSecondaryId: @ 0x080D6E20
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6E40
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0x1c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6E40: .4byte 0x0855CEE8
	thumb_func_end ItemId_GetSecondaryId

	thumb_func_start sub_080D6E44
sub_080D6E44: @ 0x080D6E44
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6E68
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, #0x20
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6E68: .4byte 0x0855CEE8
	thumb_func_end sub_080D6E44

	thumb_func_start sub_080D6E6C
sub_080D6E6C: @ 0x080D6E6C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080D6E90
	bl SanitizeItemId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	adds r1, #0x24
	ldrb r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080D6E90: .4byte 0x0855CEE8
	thumb_func_end sub_080D6E6C

