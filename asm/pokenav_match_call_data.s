.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start MatchCallGetFunctionIndex
MatchCallGetFunctionIndex: @ 0x081D0C90
	push {lr}
	ldrb r0, [r0]
	cmp r0, #5
	bhi _081D0CC0
	lsls r0, r0, #2
	ldr r1, _081D0CA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D0CA4: .4byte 0x081D0CA8
_081D0CA8: @ jump table
	.4byte _081D0CC0 @ case 0
	.4byte _081D0CC4 @ case 1
	.4byte _081D0CC8 @ case 2
	.4byte _081D0CD0 @ case 3
	.4byte _081D0CCC @ case 4
	.4byte _081D0CC4 @ case 5
_081D0CC0:
	movs r0, #0
	b _081D0CD2
_081D0CC4:
	movs r0, #1
	b _081D0CD2
_081D0CC8:
	movs r0, #2
	b _081D0CD2
_081D0CCC:
	movs r0, #3
	b _081D0CD2
_081D0CD0:
	movs r0, #4
_081D0CD2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MatchCallGetFunctionIndex

	thumb_func_start GetTrainerIdxByRematchIdx
GetTrainerIdxByRematchIdx: @ 0x081D0CD8
	ldr r1, _081D0CE4
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_081D0CE4: .4byte 0x0852AD40
	thumb_func_end GetTrainerIdxByRematchIdx

	thumb_func_start GetRematchIdxByTrainerIdx
GetRematchIdxByTrainerIdx: @ 0x081D0CE8
	push {lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _081D0CFC
_081D0CF0:
	ldrh r0, [r2]
	cmp r0, r3
	bne _081D0D00
	adds r0, r1, #0
	b _081D0D0C
	.align 2, 0
_081D0CFC: .4byte 0x0852AD40
_081D0D00:
	adds r2, #0x10
	adds r1, #1
	cmp r1, #0x4d
	ble _081D0CF0
	movs r0, #1
	rsbs r0, r0, #0
_081D0D0C:
	pop {r1}
	bx r1
	thumb_func_end GetRematchIdxByTrainerIdx

	thumb_func_start MatchCallFlagGetByIndex
MatchCallFlagGetByIndex: @ 0x081D0D10
	push {r4, lr}
	cmp r0, #0x14
	bhi _081D0D3C
	ldr r1, _081D0D34
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r4, #0
	bl MatchCallGetFunctionIndex
	ldr r1, _081D0D38
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	b _081D0D3E
	.align 2, 0
_081D0D34: .4byte 0x085F79B4
_081D0D38: .4byte 0x085F7A08
_081D0D3C:
	movs r0, #0
_081D0D3E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MatchCallFlagGetByIndex

	thumb_func_start MatchCallGetFlag_Type0
MatchCallGetFlag_Type0: @ 0x081D0D44
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #2]
	ldr r0, _081D0D5C
	cmp r1, r0
	beq _081D0D60
	adds r0, r1, #0
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081D0D62
	.align 2, 0
_081D0D5C: .4byte 0x0000FFFF
_081D0D60:
	movs r0, #1
_081D0D62:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MatchCallGetFlag_Type0

	thumb_func_start MatchCallGetFlag_Type1
MatchCallGetFlag_Type1: @ 0x081D0D68
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #2]
	ldr r0, _081D0D80
	cmp r1, r0
	beq _081D0D84
	adds r0, r1, #0
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081D0D86
	.align 2, 0
_081D0D80: .4byte 0x0000FFFF
_081D0D84:
	movs r0, #1
_081D0D86:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MatchCallGetFlag_Type1

	thumb_func_start MatchCallGetFlag_Type2
MatchCallGetFlag_Type2: @ 0x081D0D8C
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #2]
	ldr r0, _081D0DA4
	cmp r1, r0
	beq _081D0DA8
	adds r0, r1, #0
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081D0DAA
	.align 2, 0
_081D0DA4: .4byte 0x0000FFFF
_081D0DA8:
	movs r0, #1
_081D0DAA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MatchCallGetFlag_Type2

	thumb_func_start MatchCallGetFlag_Type4
MatchCallGetFlag_Type4: @ 0x081D0DB0
	push {lr}
	adds r2, r0, #0
	ldr r0, _081D0DC4
	ldr r1, [r0]
	ldrb r0, [r2, #1]
	ldrb r1, [r1, #8]
	cmp r0, r1
	beq _081D0DC8
	movs r0, #0
	b _081D0DE2
	.align 2, 0
_081D0DC4: .4byte 0x03005AF0
_081D0DC8:
	ldrh r1, [r2, #2]
	ldr r0, _081D0DDC
	cmp r1, r0
	beq _081D0DE0
	adds r0, r1, #0
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081D0DE2
	.align 2, 0
_081D0DDC: .4byte 0x0000FFFF
_081D0DE0:
	movs r0, #1
_081D0DE2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MatchCallGetFlag_Type4

	thumb_func_start MatchCallGetFlag_Type3
MatchCallGetFlag_Type3: @ 0x081D0DE8
	push {lr}
	ldrh r0, [r0, #2]
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end MatchCallGetFlag_Type3

	thumb_func_start MatchCallMapSecGetByIndex
MatchCallMapSecGetByIndex: @ 0x081D0DF8
	push {r4, lr}
	cmp r0, #0x14
	bhi _081D0E28
	ldr r1, _081D0E20
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r4, #0
	bl MatchCallGetFunctionIndex
	ldr r1, _081D0E24
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _081D0E2A
	.align 2, 0
_081D0E20: .4byte 0x085F79B4
_081D0E24: .4byte 0x085F7A1C
_081D0E28:
	movs r0, #0
_081D0E2A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MatchCallMapSecGetByIndex

	thumb_func_start MatchCallGetMapSec_Type0
MatchCallGetMapSec_Type0: @ 0x081D0E30
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end MatchCallGetMapSec_Type0

	thumb_func_start MatchCallGetMapSec_Type1
MatchCallGetMapSec_Type1: @ 0x081D0E34
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end MatchCallGetMapSec_Type1

	thumb_func_start MatchCallGetMapSec_Type2
MatchCallGetMapSec_Type2: @ 0x081D0E38
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r7, _081D0E44
	b _081D0E4A
	.align 2, 0
_081D0E44: .4byte 0x0000FFFF
_081D0E48:
	adds r6, #1
_081D0E4A:
	ldr r0, [r5, #0x10]
	lsls r4, r6, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, r7
	beq _081D0E60
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D0E48
_081D0E60:
	ldr r0, [r5, #0x10]
	adds r0, r4, r0
	ldrb r0, [r0, #2]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end MatchCallGetMapSec_Type2

	thumb_func_start MatchCallGetMapSec_Type4
MatchCallGetMapSec_Type4: @ 0x081D0E6C
	movs r0, #0xd5
	bx lr
	thumb_func_end MatchCallGetMapSec_Type4

	thumb_func_start MatchCallGetMapSec_Type3
MatchCallGetMapSec_Type3: @ 0x081D0E70
	movs r0, #0xd5
	bx lr
	thumb_func_end MatchCallGetMapSec_Type3

	thumb_func_start MatchCall_IsRematchable
MatchCall_IsRematchable: @ 0x081D0E74
	push {r4, lr}
	cmp r0, #0x14
	bhi _081D0EA0
	ldr r1, _081D0E98
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r4, #0
	bl MatchCallGetFunctionIndex
	ldr r1, _081D0E9C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	b _081D0EA2
	.align 2, 0
_081D0E98: .4byte 0x085F79B4
_081D0E9C: .4byte 0x085F7A30
_081D0EA0:
	movs r0, #0
_081D0EA2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MatchCall_IsRematchable

	thumb_func_start MatchCall_IsRematchable_Type3
MatchCall_IsRematchable_Type3: @ 0x081D0EA8
	movs r0, #0
	bx lr
	thumb_func_end MatchCall_IsRematchable_Type3

	thumb_func_start MatchCall_IsRematchable_Type1
MatchCall_IsRematchable_Type1: @ 0x081D0EAC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x48
	bhi _081D0ED4
	ldr r0, _081D0ECC
	ldr r0, [r0]
	ldr r2, _081D0ED0
	adds r0, r0, r2
	ldrh r1, [r1, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _081D0ED6
	.align 2, 0
_081D0ECC: .4byte 0x03005AEC
_081D0ED0: .4byte 0x000009CA
_081D0ED4:
	movs r0, #0
_081D0ED6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MatchCall_IsRematchable_Type1

	thumb_func_start MatchCall_IsRematchable_Type2
MatchCall_IsRematchable_Type2: @ 0x081D0EDC
	ldr r1, _081D0EF4
	ldr r1, [r1]
	ldr r2, _081D0EF8
	adds r1, r1, r2
	ldrh r0, [r0, #4]
	adds r1, r1, r0
	ldrb r1, [r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_081D0EF4: .4byte 0x03005AEC
_081D0EF8: .4byte 0x000009CA
	thumb_func_end MatchCall_IsRematchable_Type2

	thumb_func_start MatchCall_IsRematchable_Type4
MatchCall_IsRematchable_Type4: @ 0x081D0EFC
	movs r0, #0
	bx lr
	thumb_func_end MatchCall_IsRematchable_Type4

	thumb_func_start sub_081D0F00
sub_081D0F00: @ 0x081D0F00
	movs r0, #0
	bx lr
	thumb_func_end sub_081D0F00

	thumb_func_start sub_081D0F04
sub_081D0F04: @ 0x081D0F04
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r5, #0x14
	bhi _081D0F4E
	ldr r1, _081D0F34
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r4, #0
	bl MatchCallGetFunctionIndex
	adds r2, r0, #0
	ldr r1, _081D0F38
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	cmp r0, #0
	beq _081D0F3C
_081D0F2E:
	movs r0, #1
	b _081D0F50
	.align 2, 0
_081D0F34: .4byte 0x085F79B4
_081D0F38: .4byte 0x085F7A44
_081D0F3C:
	movs r2, #0
	ldr r1, _081D0F58
_081D0F40:
	ldrh r0, [r1]
	cmp r0, r5
	beq _081D0F2E
	adds r1, #0x18
	adds r2, #1
	cmp r2, #3
	bls _081D0F40
_081D0F4E:
	movs r0, #0
_081D0F50:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081D0F58: .4byte 0x085F7A94
	thumb_func_end sub_081D0F04

	thumb_func_start sub_081D0F5C
sub_081D0F5C: @ 0x081D0F5C
	movs r0, #0
	bx lr
	thumb_func_end sub_081D0F5C

	thumb_func_start sub_081D0F60
sub_081D0F60: @ 0x081D0F60
	movs r0, #1
	bx lr
	thumb_func_end sub_081D0F60

	thumb_func_start sub_081D0F64
sub_081D0F64: @ 0x081D0F64
	movs r0, #1
	bx lr
	thumb_func_end sub_081D0F64

	thumb_func_start sub_081D0F68
sub_081D0F68: @ 0x081D0F68
	movs r0, #0
	bx lr
	thumb_func_end sub_081D0F68

	thumb_func_start MatchCall_IsRematchable_Type0
MatchCall_IsRematchable_Type0: @ 0x081D0F6C
	movs r0, #0
	bx lr
	thumb_func_end MatchCall_IsRematchable_Type0

	thumb_func_start MatchCall_GetRematchTableIdx
MatchCall_GetRematchTableIdx: @ 0x081D0F70
	push {r4, lr}
	cmp r0, #0x14
	bhi _081D0F9C
	ldr r1, _081D0F94
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r4, #0
	bl MatchCallGetFunctionIndex
	ldr r1, _081D0F98
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	b _081D0F9E
	.align 2, 0
_081D0F94: .4byte 0x085F79B4
_081D0F98: .4byte 0x085F7A58
_081D0F9C:
	movs r0, #0x4e
_081D0F9E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MatchCall_GetRematchTableIdx

	thumb_func_start MatchCall_GetRematchTableIdx_Type3
MatchCall_GetRematchTableIdx_Type3: @ 0x081D0FA4
	movs r0, #0x4e
	bx lr
	thumb_func_end MatchCall_GetRematchTableIdx_Type3

	thumb_func_start MatchCall_GetRematchTableIdx_Type1
MatchCall_GetRematchTableIdx_Type1: @ 0x081D0FA8
	ldrh r0, [r0, #4]
	bx lr
	thumb_func_end MatchCall_GetRematchTableIdx_Type1

	thumb_func_start MatchCall_GetRematchTableIdx_Type2
MatchCall_GetRematchTableIdx_Type2: @ 0x081D0FAC
	ldrh r0, [r0, #4]
	bx lr
	thumb_func_end MatchCall_GetRematchTableIdx_Type2

	thumb_func_start MatchCall_GetRematchTableIdx_Type4
MatchCall_GetRematchTableIdx_Type4: @ 0x081D0FB0
	movs r0, #0x4e
	bx lr
	thumb_func_end MatchCall_GetRematchTableIdx_Type4

	thumb_func_start MatchCall_GetRematchTableIdx_Type0
MatchCall_GetRematchTableIdx_Type0: @ 0x081D0FB4
	movs r0, #0x4e
	bx lr
	thumb_func_end MatchCall_GetRematchTableIdx_Type0

	thumb_func_start MatchCall_GetMessage
MatchCall_GetMessage: @ 0x081D0FB8
	push {r4, r5, lr}
	adds r5, r1, #0
	cmp r0, #0x14
	bhi _081D0FDE
	ldr r1, _081D0FE4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r4, #0
	bl MatchCallGetFunctionIndex
	ldr r1, _081D0FE8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
_081D0FDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D0FE4: .4byte 0x085F79B4
_081D0FE8: .4byte 0x085F7A6C
	thumb_func_end MatchCall_GetMessage

	thumb_func_start MatchCall_GetMessage_Type0
MatchCall_GetMessage_Type0: @ 0x081D0FEC
	push {lr}
	ldr r0, [r0, #0xc]
	bl sub_081D103C
	pop {r0}
	bx r0
	thumb_func_end MatchCall_GetMessage_Type0

	thumb_func_start MatchCall_GetMessage_Type1
MatchCall_GetMessage_Type1: @ 0x081D0FF8
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldrb r0, [r3]
	cmp r0, #5
	beq _081D100C
	ldr r0, [r3, #0x10]
	bl sub_081D103C
	b _081D1014
_081D100C:
	ldr r0, [r3, #0x10]
	ldrh r1, [r3, #4]
	bl sub_081D109C
_081D1014:
	pop {r0}
	bx r0
	thumb_func_end MatchCall_GetMessage_Type1

	thumb_func_start MatchCall_GetMessage_Type2
MatchCall_GetMessage_Type2: @ 0x081D1018
	push {lr}
	ldr r0, [r0, #0xc]
	bl sub_081D103C
	pop {r0}
	bx r0
	thumb_func_end MatchCall_GetMessage_Type2

	thumb_func_start MatchCall_GetMessage_Type4
MatchCall_GetMessage_Type4: @ 0x081D1024
	push {lr}
	ldr r0, [r0, #0xc]
	bl sub_081D103C
	pop {r0}
	bx r0
	thumb_func_end MatchCall_GetMessage_Type4

	thumb_func_start MatchCall_GetMessage_Type3
MatchCall_GetMessage_Type3: @ 0x081D1030
	push {lr}
	adds r0, r1, #0
	bl sub_08196C74
	pop {r0}
	bx r0
	thumb_func_end MatchCall_GetMessage_Type3

	thumb_func_start sub_081D103C
sub_081D103C: @ 0x081D103C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	movs r5, #0
	ldr r7, _081D1050
	adds r4, r6, #0
	b _081D1058
	.align 2, 0
_081D1050: .4byte 0x0000FFFF
_081D1054:
	adds r4, #8
	adds r5, #1
_081D1058:
	ldr r0, [r4]
	cmp r0, #0
	beq _081D106E
	ldrh r0, [r4, #4]
	cmp r0, r7
	beq _081D1054
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D1054
_081D106E:
	cmp r5, #0
	beq _081D1074
	subs r5, #1
_081D1074:
	lsls r0, r5, #3
	adds r4, r0, r6
	ldrh r1, [r4, #6]
	ldr r0, _081D1098
	cmp r1, r0
	beq _081D1086
	adds r0, r1, #0
	bl FlagSet
_081D1086:
	ldr r1, [r4]
	mov r0, r8
	bl StringExpandPlaceholders
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D1098: .4byte 0x0000FFFF
	thumb_func_end sub_081D103C

	thumb_func_start sub_081D109C
sub_081D109C: @ 0x081D109C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sl, r2
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r5, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _081D10E6
	ldrh r0, [r6, #4]
	ldr r1, _081D1114
	cmp r0, r1
	beq _081D1124
	ldr r0, _081D1118
	mov sb, r0
	mov r8, r1
	adds r4, r6, #0
_081D10C6:
	ldrh r0, [r4, #4]
	cmp r0, sb
	beq _081D10D6
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D10E6
_081D10D6:
	adds r4, #8
	adds r5, #1
	ldr r0, [r4]
	cmp r0, #0
	beq _081D10E6
	ldrh r0, [r4, #4]
	cmp r0, r8
	bne _081D10C6
_081D10E6:
	lsls r0, r5, #3
	adds r0, r0, r6
	ldrh r1, [r0, #4]
	ldr r0, _081D1114
	cmp r1, r0
	beq _081D1124
	cmp r5, #0
	beq _081D10F8
	subs r5, #1
_081D10F8:
	lsls r0, r5, #3
	adds r4, r0, r6
	ldrh r1, [r4, #6]
	ldr r0, _081D1118
	cmp r1, r0
	beq _081D110A
	adds r0, r1, #0
	bl FlagSet
_081D110A:
	ldr r1, [r4]
	mov r0, sl
	bl StringExpandPlaceholders
	b _081D115C
	.align 2, 0
_081D1114: .4byte 0x0000FFFE
_081D1118: .4byte 0x0000FFFF
_081D111C:
	adds r5, #2
	b _081D1150
_081D1120:
	adds r5, #3
	b _081D1150
_081D1124:
	ldr r0, _081D116C
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D1150
	ldr r0, _081D1170
	ldr r0, [r0]
	ldr r1, _081D1174
	adds r0, r0, r1
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D111C
	adds r0, r7, #0
	bl CountBattledRematchTeams
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _081D1120
	adds r5, #1
_081D1150:
	lsls r0, r5, #3
	adds r0, r0, r6
	ldr r1, [r0]
	mov r0, sl
	bl StringExpandPlaceholders
_081D115C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D116C: .4byte 0x00000864
_081D1170: .4byte 0x03005AEC
_081D1174: .4byte 0x000009CA
	thumb_func_end sub_081D109C

	thumb_func_start sub_081D1178
sub_081D1178: @ 0x081D1178
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r2, #0
	cmp r0, #0x14
	bhi _081D11A2
	ldr r1, _081D11A8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r4, #0
	bl MatchCallGetFunctionIndex
	ldr r1, _081D11AC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
_081D11A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D11A8: .4byte 0x085F79B4
_081D11AC: .4byte 0x085F7A80
	thumb_func_end sub_081D1178

	thumb_func_start MatchCall_GetNameAndDesc_Type3
MatchCall_GetNameAndDesc_Type3: @ 0x081D11B0
	ldr r3, [r0, #4]
	str r3, [r1]
	ldr r0, [r0, #8]
	str r0, [r2]
	bx lr
	.align 2, 0
	thumb_func_end MatchCall_GetNameAndDesc_Type3

	thumb_func_start MatchCall_GetNameAndDesc_Type1
MatchCall_GetNameAndDesc_Type1: @ 0x081D11BC
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _081D11D0
	ldrh r0, [r4, #4]
	bl MatchCall_GetNameAndDescByRematchIdx
	b _081D11D2
_081D11D0:
	str r0, [r2]
_081D11D2:
	ldr r0, [r4, #8]
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end MatchCall_GetNameAndDesc_Type1

	thumb_func_start MatchCall_GetNameAndDesc_Type2
MatchCall_GetNameAndDesc_Type2: @ 0x081D11DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrh r0, [r4, #4]
	bl MatchCall_GetNameAndDescByRematchIdx
	ldr r0, [r4, #8]
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MatchCall_GetNameAndDesc_Type2

	thumb_func_start MatchCall_GetNameAndDesc_Type4
MatchCall_GetNameAndDesc_Type4: @ 0x081D11F4
	ldr r3, [r0, #4]
	str r3, [r1]
	ldr r0, [r0, #8]
	str r0, [r2]
	bx lr
	.align 2, 0
	thumb_func_end MatchCall_GetNameAndDesc_Type4

	thumb_func_start MatchCall_GetNameAndDesc_Type0
MatchCall_GetNameAndDesc_Type0: @ 0x081D1200
	ldr r3, [r0, #4]
	str r3, [r1]
	ldr r0, [r0, #8]
	str r0, [r2]
	bx lr
	.align 2, 0
	thumb_func_end MatchCall_GetNameAndDesc_Type0

	thumb_func_start MatchCall_GetNameAndDescByRematchIdx
MatchCall_GetNameAndDescByRematchIdx: @ 0x081D120C
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	bl GetTrainerIdxByRematchIdx
	lsls r0, r0, #5
	ldr r1, _081D1234
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	movs r1, #0xb
	muls r1, r2, r1
	ldr r2, _081D1238
	adds r1, r1, r2
	str r1, [r4]
	adds r0, #4
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D1234: .4byte 0x082E383C
_081D1238: .4byte 0x082E3564
	thumb_func_end MatchCall_GetNameAndDescByRematchIdx

	thumb_func_start sub_081D123C
sub_081D123C: @ 0x081D123C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _081D12B4
	movs r0, #8
	adds r0, r0, r2
	mov sb, r0
_081D1250:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, r6
	bne _081D12B8
	adds r4, r5, #1
	lsls r1, r1, #2
	mov r8, r1
	cmp r4, #3
	bhi _081D12A4
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, r6
	bne _081D12A4
	ldr r7, _081D12B4
_081D1278:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r7, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D12A4
	adds r5, r4, #0
	adds r4, r5, #1
	cmp r4, #3
	bhi _081D12A4
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, r6
	beq _081D1278
_081D12A4:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	add r0, r8
	add r0, sb
	ldr r0, [r0]
	b _081D12C0
	.align 2, 0
_081D12B4: .4byte 0x085F7A94
_081D12B8:
	adds r5, #1
	cmp r5, #3
	bls _081D1250
	movs r0, #0
_081D12C0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_081D123C

	thumb_func_start sub_081D12CC
sub_081D12CC: @ 0x081D12CC
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _081D12E0
_081D12D4:
	ldrh r0, [r1]
	cmp r0, r3
	bne _081D12E4
	ldrh r0, [r1, #2]
	b _081D12F0
	.align 2, 0
_081D12E0: .4byte 0x085F7A94
_081D12E4:
	adds r1, #0x18
	adds r2, #1
	cmp r2, #3
	bls _081D12D4
	movs r0, #1
	rsbs r0, r0, #0
_081D12F0:
	pop {r1}
	bx r1
	thumb_func_end sub_081D12CC

	thumb_func_start sub_081D12F4
sub_081D12F4: @ 0x081D12F4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_081D12FA:
	adds r0, r4, #0
	bl MatchCall_GetRematchTableIdx
	cmp r0, #0x4e
	beq _081D130C
	cmp r0, r5
	bne _081D130C
	movs r0, #1
	b _081D1314
_081D130C:
	adds r4, #1
	cmp r4, #0x14
	ble _081D12FA
	movs r0, #0
_081D1314:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D12F4

	thumb_func_start SetMatchCallRegisteredFlag
SetMatchCallRegisteredFlag: @ 0x081D131C
	push {lr}
	ldr r0, _081D133C
	ldrh r0, [r0]
	bl GetRematchIdxByTrainerIdx
	cmp r0, #0
	blt _081D1338
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagSet
_081D1338:
	pop {r0}
	bx r0
	.align 2, 0
_081D133C: .4byte 0x02037280
	thumb_func_end SetMatchCallRegisteredFlag

