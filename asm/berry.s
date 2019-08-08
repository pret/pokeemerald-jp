.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearEnigmaBerries
ClearEnigmaBerries: @ 0x080E0B04
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080E0B24
	ldr r1, [r0]
	ldr r0, _080E0B28
	adds r1, r1, r0
	ldr r2, _080E0B2C
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080E0B24: .4byte 0x03005AEC
_080E0B28: .4byte 0x000031F8
_080E0B2C: .4byte 0x0100001A
	thumb_func_end ClearEnigmaBerries

	thumb_func_start SetEnigmaBerry
SetEnigmaBerry: @ 0x080E0B30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080E0B54
	ldr r0, [r0]
	ldr r1, _080E0B58
	adds r3, r0, r1
	movs r2, #0
_080E0B3E:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x33
	bls _080E0B3E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0B54: .4byte 0x03005AEC
_080E0B58: .4byte 0x000031F8
	thumb_func_end SetEnigmaBerry

	thumb_func_start GetEnigmaBerryChecksum
GetEnigmaBerryChecksum: @ 0x080E0B5C
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
_080E0B64:
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r1, #1
	cmp r1, #0x2f
	bls _080E0B64
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetEnigmaBerryChecksum

	thumb_func_start IsEnigmaBerryValid
IsEnigmaBerryValid: @ 0x080E0B78
	push {r4, lr}
	ldr r4, _080E0BAC
	ldr r1, [r4]
	ldr r2, _080E0BB0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E0BC0
	ldr r2, _080E0BB4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080E0BC0
	ldr r2, _080E0BB8
	adds r0, r1, r2
	bl GetEnigmaBerryChecksum
	ldr r1, [r4]
	ldr r2, _080E0BBC
	adds r1, r1, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _080E0BC0
	movs r0, #1
	b _080E0BC2
	.align 2, 0
_080E0BAC: .4byte 0x03005AEC
_080E0BB0: .4byte 0x0000320C
_080E0BB4: .4byte 0x00003202
_080E0BB8: .4byte 0x000031F8
_080E0BBC: .4byte 0x00003228
_080E0BC0:
	movs r0, #0
_080E0BC2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsEnigmaBerryValid

	thumb_func_start GetBerryInfo
GetBerryInfo: @ 0x080E0BC8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x2b
	bne _080E0BEC
	bl IsEnigmaBerryValid
	cmp r0, #0
	beq _080E0BEC
	ldr r0, _080E0BE4
	ldr r0, [r0]
	ldr r1, _080E0BE8
	b _080E0C00
	.align 2, 0
_080E0BE4: .4byte 0x03005AEC
_080E0BE8: .4byte 0x000031F8
_080E0BEC:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2a
	bls _080E0BF8
	movs r4, #1
_080E0BF8:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080E0C08
_080E0C00:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E0C08: .4byte 0x08563134
	thumb_func_end GetBerryInfo

	thumb_func_start GetBerryTreeInfo
GetBerryTreeInfo: @ 0x080E0C0C
	lsls r0, r0, #0x18
	ldr r1, _080E0C20
	lsrs r0, r0, #0x15
	ldr r2, _080E0C24
	adds r0, r0, r2
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080E0C20: .4byte 0x03005AEC
_080E0C24: .4byte 0x0000169C
	thumb_func_end GetBerryTreeInfo

	thumb_func_start EventObjectInteractionWaterBerryTree
EventObjectInteractionWaterBerryTree: @ 0x080E0C28
	push {lr}
	ldr r0, _080E0C50
	ldrb r0, [r0]
	bl EventObjectGetBerryTreeId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBerryTreeInfo
	adds r2, r0, #0
	ldrb r0, [r2, #1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #2
	beq _080E0C64
	cmp r0, #2
	bgt _080E0C54
	cmp r0, #1
	beq _080E0C5E
	b _080E0C7A
	.align 2, 0
_080E0C50: .4byte 0x03005B50
_080E0C54:
	cmp r0, #3
	beq _080E0C6A
	cmp r0, #4
	beq _080E0C70
	b _080E0C7A
_080E0C5E:
	ldrb r0, [r2, #5]
	movs r1, #0x10
	b _080E0C74
_080E0C64:
	ldrb r0, [r2, #5]
	movs r1, #0x20
	b _080E0C74
_080E0C6A:
	ldrb r0, [r2, #5]
	movs r1, #0x40
	b _080E0C74
_080E0C70:
	ldrb r0, [r2, #5]
	movs r1, #0x80
_080E0C74:
	orrs r0, r1
	strb r0, [r2, #5]
	b _080E0C7E
_080E0C7A:
	movs r0, #0
	b _080E0C80
_080E0C7E:
	movs r0, #1
_080E0C80:
	pop {r1}
	bx r1
	thumb_func_end EventObjectInteractionWaterBerryTree

	thumb_func_start IsPlayerFacingEmptyBerryTreePatch
IsPlayerFacingEmptyBerryTreePatch: @ 0x080E0C84
	push {lr}
	bl GetEventObjectScriptPointerPlayerFacing
	ldr r1, _080E0CAC
	cmp r0, r1
	bne _080E0CB4
	ldr r0, _080E0CB0
	ldrb r0, [r0]
	bl EventObjectGetBerryTreeId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetStageByBerryTreeId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080E0CB4
	movs r0, #1
	b _080E0CB6
	.align 2, 0
_080E0CAC: .4byte 0x08244D23
_080E0CB0: .4byte 0x03005B50
_080E0CB4:
	movs r0, #0
_080E0CB6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPlayerFacingEmptyBerryTreePatch

	thumb_func_start TryToWaterBerryTree
TryToWaterBerryTree: @ 0x080E0CBC
	push {lr}
	bl GetEventObjectScriptPointerPlayerFacing
	ldr r1, _080E0CD4
	cmp r0, r1
	bne _080E0CD8
	bl EventObjectInteractionWaterBerryTree
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080E0CDA
	.align 2, 0
_080E0CD4: .4byte 0x08244D23
_080E0CD8:
	movs r0, #0
_080E0CDA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryToWaterBerryTree

	thumb_func_start ClearBerryTrees
ClearBerryTrees: @ 0x080E0CE0
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _080E0D08
	ldr r5, _080E0D0C
	ldr r0, _080E0D10
	ldr r3, [r0]
	ldr r4, [r0, #4]
_080E0CEE:
	ldr r0, [r6]
	lsls r1, r2, #3
	adds r0, r0, r1
	adds r0, r0, r5
	str r3, [r0]
	str r4, [r0, #4]
	adds r2, #1
	cmp r2, #0x7f
	ble _080E0CEE
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E0D08: .4byte 0x03005AEC
_080E0D0C: .4byte 0x0000169C
_080E0D10: .4byte 0x085636B0
	thumb_func_end ClearBerryTrees

	thumb_func_start BerryTreeGrow
BerryTreeGrow: @ 0x080E0D14
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080E0D26
_080E0D22:
	movs r0, #0
	b _080E0DB2
_080E0D26:
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #5
	bhi _080E0DB0
	lsls r0, r0, #2
	ldr r1, _080E0D38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E0D38: .4byte 0x080E0D3C
_080E0D3C: @ jump table
	.4byte _080E0D22 @ case 0
	.4byte _080E0D5C @ case 1
	.4byte _080E0D5C @ case 2
	.4byte _080E0D5C @ case 3
	.4byte _080E0D54 @ case 4
	.4byte _080E0D74 @ case 5
_080E0D54:
	adds r0, r4, #0
	bl CalcBerryYield
	strb r0, [r4, #4]
_080E0D5C:
	ldrb r2, [r4, #1]
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x19
	adds r1, #1
	movs r0, #0x7f
	ands r1, r0
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	b _080E0DB0
_080E0D74:
	ldrb r0, [r4, #5]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #0x20
	ands r1, r0
	movs r0, #0x7f
	ands r1, r0
	movs r0, #0
	strb r0, [r4, #4]
	ldrb r2, [r4, #1]
	subs r0, #0x80
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #1]
	adds r1, #1
	movs r0, #0xf
	ands r1, r0
	strb r1, [r4, #5]
	cmp r1, #0xa
	bne _080E0DB0
	ldr r0, _080E0DB8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, #4]
_080E0DB0:
	movs r0, #1
_080E0DB2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E0DB8: .4byte 0x085636B0
	thumb_func_end BerryTreeGrow

	thumb_func_start BerryTreeTimeUpdate
BerryTreeTimeUpdate: @ 0x080E0DBC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r2, #0
_080E0DC2:
	ldr r1, _080E0E0C
	lsls r0, r2, #3
	ldr r3, _080E0E10
	adds r0, r0, r3
	ldr r1, [r1]
	adds r4, r1, r0
	ldrb r0, [r4]
	adds r7, r2, #1
	cmp r0, #0
	beq _080E0E5C
	ldrb r1, [r4, #1]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _080E0E5C
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080E0E5C
	ldrb r0, [r4]
	bl GetStageDurationByBerryType
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #3
	subs r1, r1, r0
	cmp r6, r1
	blt _080E0E18
	ldr r0, _080E0E14
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, #4]
	b _080E0E5C
	.align 2, 0
_080E0E0C: .4byte 0x03005AEC
_080E0E10: .4byte 0x0000169C
_080E0E14: .4byte 0x085636B0
_080E0E18:
	adds r5, r6, #0
	cmp r5, #0
	beq _080E0E5C
	ldrh r1, [r4, #2]
	cmp r1, r5
	ble _080E0E28
	subs r0, r1, r5
	b _080E0E5A
_080E0E28:
	subs r5, r5, r1
	ldrb r0, [r4]
	bl GetStageDurationByBerryType
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl BerryTreeGrow
	cmp r0, #0
	beq _080E0E5C
	ldrb r1, [r4, #1]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #5
	bne _080E0E4C
	ldrh r0, [r4, #2]
	lsls r0, r0, #2
	strh r0, [r4, #2]
_080E0E4C:
	cmp r5, #0
	beq _080E0E5C
	ldrh r0, [r4, #2]
	adds r1, r0, #0
	cmp r0, r5
	ble _080E0E28
	subs r0, r0, r5
_080E0E5A:
	strh r0, [r4, #2]
_080E0E5C:
	adds r2, r7, #0
	cmp r2, #0x7f
	ble _080E0DC2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end BerryTreeTimeUpdate

	thumb_func_start PlantBerryTree
PlantBerryTree: @ 0x080E0E68
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	bl GetBerryTreeInfo
	adds r6, r0, #0
	ldr r0, _080E0ECC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r6]
	str r1, [r6, #4]
	strb r4, [r6]
	adds r0, r4, #0
	bl GetStageDurationByBerryType
	strh r0, [r6, #2]
	movs r1, #0x7f
	ands r1, r5
	ldrb r2, [r6, #1]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #1]
	cmp r5, #5
	bne _080E0EBA
	adds r0, r6, #0
	bl CalcBerryYield
	strb r0, [r6, #4]
	ldrh r0, [r6, #2]
	lsls r0, r0, #2
	strh r0, [r6, #2]
_080E0EBA:
	cmp r7, #0
	bne _080E0EC6
	ldrb r0, [r6, #1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r6, #1]
_080E0EC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0ECC: .4byte 0x085636B0
	thumb_func_end PlantBerryTree

	thumb_func_start RemoveBerryTree
RemoveBerryTree: @ 0x080E0ED0
	lsls r0, r0, #0x18
	ldr r1, _080E0EEC
	ldr r2, [r1]
	lsrs r0, r0, #0x15
	adds r2, r2, r0
	ldr r0, _080E0EF0
	adds r2, r2, r0
	ldr r0, _080E0EF4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	bx lr
	.align 2, 0
_080E0EEC: .4byte 0x03005AEC
_080E0EF0: .4byte 0x0000169C
_080E0EF4: .4byte 0x085636B0
	thumb_func_end RemoveBerryTree

	thumb_func_start GetBerryTypeByBerryTreeId
GetBerryTypeByBerryTreeId: @ 0x080E0EF8
	lsls r0, r0, #0x18
	ldr r1, _080E0F0C
	ldr r1, [r1]
	lsrs r0, r0, #0x15
	adds r1, r1, r0
	ldr r0, _080E0F10
	adds r1, r1, r0
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080E0F0C: .4byte 0x03005AEC
_080E0F10: .4byte 0x0000169C
	thumb_func_end GetBerryTypeByBerryTreeId

	thumb_func_start GetStageByBerryTreeId
GetStageByBerryTreeId: @ 0x080E0F14
	lsls r0, r0, #0x18
	ldr r1, _080E0F2C
	ldr r1, [r1]
	lsrs r0, r0, #0x15
	adds r1, r1, r0
	ldr r0, _080E0F30
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bx lr
	.align 2, 0
_080E0F2C: .4byte 0x03005AEC
_080E0F30: .4byte 0x0000169D
	thumb_func_end GetStageByBerryTreeId

	thumb_func_start ItemIdToBerryType
ItemIdToBerryType: @ 0x080E0F34
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _080E0F50
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x2a
	bhi _080E0F54
	adds r0, r1, #0
	adds r0, #0x7c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080E0F56
	.align 2, 0
_080E0F50: .4byte 0xFF7B0000
_080E0F54:
	movs r0, #1
_080E0F56:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ItemIdToBerryType

	thumb_func_start BerryTypeToItemId
BerryTypeToItemId: @ 0x080E0F5C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _080E0F78
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x2a
	bhi _080E0F7C
	adds r0, r1, #0
	adds r0, #0x84
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080E0F7E
	.align 2, 0
_080E0F78: .4byte 0xFFFF0000
_080E0F7C:
	movs r0, #0x85
_080E0F7E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end BerryTypeToItemId

	thumb_func_start GetBerryNameByBerryType
GetBerryNameByBerryType: @ 0x080E0F84
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBerryInfo
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #6
	bl memcpy
	movs r0, #0xff
	strb r0, [r4, #6]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetBerryNameByBerryType

	thumb_func_start ResetBerryTreeSparkleFlag
ResetBerryTreeSparkleFlag: @ 0x080E0FA4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBerryTreeInfo
	ldrb r2, [r0, #1]
	movs r1, #0x7f
	ands r1, r2
	strb r1, [r0, #1]
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetBerryTreeSparkleFlag

	thumb_func_start BerryTreeGetNumStagesWatered
BerryTreeGetNumStagesWatered: @ 0x080E0FBC
	push {lr}
	ldrb r2, [r0, #5]
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080E0FD6
	adds r1, #1
_080E0FD6:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080E0FE4
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080E0FE4:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080E0FF2
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080E0FF2:
	adds r0, r1, #0
	pop {r1}
	bx r1
	thumb_func_end BerryTreeGetNumStagesWatered

	thumb_func_start GetNumStagesWateredByBerryTreeId
GetNumStagesWateredByBerryTreeId: @ 0x080E0FF8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBerryTreeInfo
	bl BerryTreeGetNumStagesWatered
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetNumStagesWateredByBerryTreeId

	thumb_func_start CalcBerryYieldInternal
CalcBerryYieldInternal: @ 0x080E1010
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #0
	bne _080E1026
	lsls r0, r6, #0x18
	b _080E105A
_080E1026:
	subs r1, r0, r6
	subs r0, r2, #1
	adds r5, r1, #0
	muls r5, r0, r5
	adds r4, r1, #0
	muls r4, r2, r4
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r4, r5
	adds r4, #1
	adds r1, r4, #0
	bl __umodsi3
	adds r5, r5, r0
	movs r0, #3
	ands r0, r5
	cmp r0, #1
	bls _080E1054
	lsrs r0, r5, #2
	adds r0, #1
	b _080E1056
_080E1054:
	lsrs r0, r5, #2
_080E1056:
	adds r0, r0, r6
	lsls r0, r0, #0x18
_080E105A:
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CalcBerryYieldInternal

	thumb_func_start CalcBerryYield
CalcBerryYield: @ 0x080E1064
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	bl GetBerryInfo
	ldrb r6, [r0, #0xb]
	ldrb r5, [r0, #0xa]
	adds r0, r4, #0
	bl BerryTreeGetNumStagesWatered
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl CalcBerryYieldInternal
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end CalcBerryYield

	thumb_func_start GetBerryCountByBerryTreeId
GetBerryCountByBerryTreeId: @ 0x080E1090
	lsls r0, r0, #0x18
	ldr r1, _080E10A4
	ldr r1, [r1]
	lsrs r0, r0, #0x15
	adds r1, r1, r0
	movs r0, #0xb5
	lsls r0, r0, #5
	adds r1, r1, r0
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080E10A4: .4byte 0x03005AEC
	thumb_func_end GetBerryCountByBerryTreeId

	thumb_func_start GetStageDurationByBerryType
GetStageDurationByBerryType: @ 0x080E10A8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBerryInfo
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end GetStageDurationByBerryType

	thumb_func_start EventObjectInteractionGetBerryTreeData
EventObjectInteractionGetBerryTreeData: @ 0x080E10C0
	push {r4, r5, r6, lr}
	ldr r0, _080E10FC
	ldrb r0, [r0]
	bl EventObjectGetBerryTreeId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl GetBerryTypeByBerryTreeId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #0
	bl ResetBerryTreeSparkleFlag
	ldr r0, _080E1100
	ldrb r0, [r0]
	ldr r1, _080E1104
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl IsBerryTreeSparkling
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080E110C
	ldr r1, _080E1108
	movs r0, #0xff
	strh r0, [r1]
	b _080E111A
	.align 2, 0
_080E10FC: .4byte 0x03005B50
_080E1100: .4byte 0x02037292
_080E1104: .4byte 0x03005AEC
_080E1108: .4byte 0x02037280
_080E110C:
	ldr r4, _080E1144
	adds r0, r5, #0
	bl GetStageByBerryTreeId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
_080E111A:
	ldr r4, _080E1148
	adds r0, r5, #0
	bl GetNumStagesWateredByBerryTreeId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldr r4, _080E114C
	adds r0, r5, #0
	bl GetBerryCountByBerryTreeId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	ldr r1, _080E1150
	adds r0, r6, #0
	bl GetBerryNameByBerryType
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1144: .4byte 0x02037280
_080E1148: .4byte 0x02037282
_080E114C: .4byte 0x02037284
_080E1150: .4byte 0x02021C40
	thumb_func_end EventObjectInteractionGetBerryTreeData

	thumb_func_start Bag_ChooseBerry
Bag_ChooseBerry: @ 0x080E1154
	push {lr}
	ldr r0, _080E1160
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080E1160: .4byte 0x081AA955
	thumb_func_end Bag_ChooseBerry

	thumb_func_start EventObjectInteractionPlantBerryTree
EventObjectInteractionPlantBerryTree: @ 0x080E1164
	push {r4, lr}
	ldr r0, _080E1194
	ldrh r0, [r0]
	bl ItemIdToBerryType
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080E1198
	ldrb r0, [r0]
	bl EventObjectGetBerryTreeId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	movs r2, #1
	movs r3, #1
	bl PlantBerryTree
	bl EventObjectInteractionGetBerryTreeData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1194: .4byte 0x0203CB48
_080E1198: .4byte 0x03005B50
	thumb_func_end EventObjectInteractionPlantBerryTree

	thumb_func_start EventObjectInteractionPickBerryTree
EventObjectInteractionPickBerryTree: @ 0x080E119C
	push {r4, r5, r6, lr}
	ldr r0, _080E11E0
	ldrb r0, [r0]
	bl EventObjectGetBerryTreeId
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl GetBerryTypeByBerryTreeId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _080E11E4
	bl BerryTypeToItemId
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl GetBerryCountByBerryTreeId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E11E0: .4byte 0x03005B50
_080E11E4: .4byte 0x02037280
	thumb_func_end EventObjectInteractionPickBerryTree

	thumb_func_start EventObjectInteractionRemoveBerryTree
EventObjectInteractionRemoveBerryTree: @ 0x080E11E8
	push {lr}
	ldr r0, _080E1210
	ldrb r0, [r0]
	bl EventObjectGetBerryTreeId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl RemoveBerryTree
	ldr r0, _080E1214
	ldrb r0, [r0]
	ldr r1, _080E1218
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl sub_08092860
	pop {r0}
	bx r0
	.align 2, 0
_080E1210: .4byte 0x03005B50
_080E1214: .4byte 0x02037292
_080E1218: .4byte 0x03005AEC
	thumb_func_end EventObjectInteractionRemoveBerryTree

	thumb_func_start PlayerHasBerries
PlayerHasBerries: @ 0x080E121C
	push {lr}
	movs r0, #4
	bl IsBagPocketNonEmpty
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end PlayerHasBerries

	thumb_func_start ResetBerryTreeSparkleFlags
ResetBerryTreeSparkleFlags: @ 0x080E122C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r4, sp
	adds r4, #2
	mov r0, sp
	adds r1, r4, #0
	bl GetCameraCoords
	mov r0, sp
	ldrh r2, [r0]
	ldrh r1, [r4]
	adds r1, #3
	adds r3, r2, #0
	adds r3, #0xe
	lsls r1, r1, #0x10
	movs r5, #0x80
	lsls r5, r5, #0xc
	adds r0, r1, r5
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r5, sp
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sb, r2
	ldr r4, _080E12C4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r8, r3
	asrs r7, r1, #0x10
	movs r6, #0xf
_080E1270:
	ldrb r0, [r4]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080E12AC
	ldrb r0, [r4, #6]
	cmp r0, #0xc
	bne _080E12AC
	ldrh r0, [r4, #0x10]
	strh r0, [r5]
	ldrh r0, [r4, #0x12]
	mov r1, sp
	strh r0, [r1, #2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	cmp sb, r1
	bgt _080E12AC
	cmp r1, r8
	bgt _080E12AC
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r7, r1
	bgt _080E12AC
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _080E12AC
	ldrb r0, [r4, #0x1d]
	bl ResetBerryTreeSparkleFlag
_080E12AC:
	adds r4, #0x24
	subs r6, #1
	cmp r6, #0
	bge _080E1270
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E12C4: .4byte 0x02036FF0
	thumb_func_end ResetBerryTreeSparkleFlags

