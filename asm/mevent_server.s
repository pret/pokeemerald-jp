.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start mevent_srv_init_wnews
mevent_srv_init_wnews: @ 0x0801CB24
	push {r4, lr}
	ldr r4, _0801CB40
	movs r0, #0x60
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _0801CB44
	movs r2, #0
	movs r3, #1
	bl mevent_srv_init_common
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801CB40: .4byte 0x02022930
_0801CB44: .4byte 0x082C4F60
	thumb_func_end mevent_srv_init_wnews

	thumb_func_start mevent_srv_new_wcard
mevent_srv_new_wcard: @ 0x0801CB48
	push {r4, lr}
	ldr r4, _0801CB64
	movs r0, #0x60
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _0801CB68
	movs r2, #0
	movs r3, #1
	bl mevent_srv_init_common
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801CB64: .4byte 0x02022930
_0801CB68: .4byte 0x082C4FC0
	thumb_func_end mevent_srv_new_wcard

	thumb_func_start mevent_srv_common_do_exec
mevent_srv_common_do_exec: @ 0x0801CB6C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801CB7C
	ldr r0, [r4]
	cmp r0, #0
	bne _0801CB80
	movs r0, #3
	b _0801CBA0
	.align 2, 0
_0801CB7C: .4byte 0x02022930
_0801CB80:
	bl mevent_srv_exec_common
	adds r5, r0, #0
	cmp r5, #3
	bne _0801CB9E
	ldr r0, [r4]
	ldr r1, [r0, #4]
	strh r1, [r6]
	bl mevent_srv_free_resources
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
_0801CB9E:
	adds r0, r5, #0
_0801CBA0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end mevent_srv_common_do_exec

	thumb_func_start mevent_srv_init_common
mevent_srv_init_common: @ 0x0801CBA8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	movs r5, #0
	str r5, [r4]
	str r5, [r4, #8]
	movs r0, #0xa4
	bl AllocZeroed
	str r0, [r4, #0x18]
	movs r0, #0xe0
	bl AllocZeroed
	str r0, [r4, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #3
	bl AllocZeroed
	str r0, [r4, #0x14]
	movs r0, #0x64
	bl AllocZeroed
	str r0, [r4, #0x20]
	str r6, [r4, #0x10]
	str r5, [r4, #0xc]
	adds r4, #0x38
	adds r0, r4, #0
	mov r1, r8
	mov r2, sb
	bl mevent_srv_sub_init
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end mevent_srv_init_common

	thumb_func_start mevent_srv_free_resources
mevent_srv_free_resources: @ 0x0801CBFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	bl Free
	ldr r0, [r4, #0x1c]
	bl Free
	ldr r0, [r4, #0x14]
	bl Free
	ldr r0, [r4, #0x20]
	bl Free
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end mevent_srv_free_resources

	thumb_func_start mevent_srv_common_init_send
mevent_srv_common_init_send: @ 0x0801CC20
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r4, r0
	bls _0801CC3E
	ldr r0, _0801CC54
	ldr r1, _0801CC58
	ldr r2, _0801CC5C
	movs r3, #1
	bl AGBAssert
_0801CC3E:
	adds r0, r5, #0
	adds r0, #0x38
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r4, #0
	bl mevent_srv_sub_init_send
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CC54: .4byte 0x082C4A74
_0801CC58: .4byte 0x00000101
_0801CC5C: .4byte 0x082C4A84
	thumb_func_end mevent_srv_common_init_send

	thumb_func_start mevent_first_if_not_null_else_second
mevent_first_if_not_null_else_second: @ 0x0801CC60
	push {lr}
	cmp r0, #0
	bne _0801CC68
	adds r0, r1, #0
_0801CC68:
	pop {r1}
	bx r1
	thumb_func_end mevent_first_if_not_null_else_second

	thumb_func_start mevent_compare_pointers
mevent_compare_pointers: @ 0x0801CC6C
	push {lr}
	cmp r1, r0
	bhs _0801CC76
	movs r0, #0
	b _0801CC80
_0801CC76:
	cmp r1, r0
	beq _0801CC7E
	movs r0, #2
	b _0801CC80
_0801CC7E:
	movs r0, #1
_0801CC80:
	pop {r1}
	bx r1
	thumb_func_end mevent_compare_pointers

	thumb_func_start common_mainseq_0
common_mainseq_0: @ 0x0801CC84
	movs r1, #4
	str r1, [r0, #8]
	movs r0, #0
	bx lr
	thumb_func_end common_mainseq_0

	thumb_func_start common_mainseq_1
common_mainseq_1: @ 0x0801CC8C
	movs r0, #3
	bx lr
	thumb_func_end common_mainseq_1

	thumb_func_start common_mainseq_2
common_mainseq_2: @ 0x0801CC90
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x38
	bl mevent_srv_sub_recv
	cmp r0, #0
	beq _0801CCA2
	movs r0, #4
	str r0, [r4, #8]
_0801CCA2:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end common_mainseq_2

	thumb_func_start common_mainseq_3
common_mainseq_3: @ 0x0801CCAC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x38
	bl mevent_srv_sub_send
	cmp r0, #0
	beq _0801CCBE
	movs r0, #4
	str r0, [r4, #8]
_0801CCBE:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end common_mainseq_3

	thumb_func_start common_mainseq_4
common_mainseq_4: @ 0x0801CCC8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, [r5, #0x10]
	adds r4, r2, r1
	adds r0, #1
	str r0, [r5, #0xc]
	ldr r0, [r4]
	cmp r0, #0x1e
	bls _0801CCE4
	b _0801D238
_0801CCE4:
	lsls r0, r0, #2
	ldr r1, _0801CCF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CCF0: .4byte 0x0801CCF4
_0801CCF4: @ jump table
	.4byte _0801CD70 @ case 0
	.4byte _0801CD98 @ case 1
	.4byte _0801CD9E @ case 2
	.4byte _0801CDCC @ case 3
	.4byte _0801CEB0 @ case 4
	.4byte _0801CDEC @ case 5
	.4byte _0801CE30 @ case 6
	.4byte _0801CEC4 @ case 7
	.4byte _0801CEF4 @ case 8
	.4byte _0801CF34 @ case 9
	.4byte _0801CF68 @ case 10
	.4byte _0801CF98 @ case 11
	.4byte _0801CFC0 @ case 12
	.4byte _0801D020 @ case 13
	.4byte _0801CFEC @ case 14
	.4byte _0801D088 @ case 15
	.4byte _0801D054 @ case 16
	.4byte _0801D0F2 @ case 17
	.4byte _0801D0A0 @ case 18
	.4byte _0801D0B8 @ case 19
	.4byte _0801D0E4 @ case 20
	.4byte _0801D150 @ case 21
	.4byte _0801D100 @ case 22
	.4byte _0801D12C @ case 23
	.4byte _0801D178 @ case 24
	.4byte _0801D182 @ case 25
	.4byte _0801D18C @ case 26
	.4byte _0801D1C8 @ case 27
	.4byte _0801D200 @ case 28
	.4byte _0801D22C @ case 29
	.4byte _0801CE6C @ case 30
_0801CD70:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801CD84
	ldr r0, _0801CD90
	movs r1, #0xb1
	lsls r1, r1, #1
	ldr r2, _0801CD94
	movs r3, #1
	bl AGBAssert
_0801CD84:
	movs r0, #1
	str r0, [r5, #8]
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	b _0801D238
	.align 2, 0
_0801CD90: .4byte 0x082C4A74
_0801CD94: .4byte 0x082C4AA0
_0801CD98:
	movs r0, #3
	str r0, [r5, #8]
	b _0801D238
_0801CD9E:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801CDB2
	ldr r0, _0801CDC4
	movs r1, #0xb6
	lsls r1, r1, #1
	ldr r2, _0801CDC8
	movs r3, #1
	bl AGBAssert
_0801CDB2:
	adds r0, r5, #0
	adds r0, #0x38
	ldr r1, [r4, #4]
	ldr r2, [r5, #0x14]
	bl mevent_srv_sub_init_recv
	movs r0, #2
	str r0, [r5, #8]
	b _0801D238
	.align 2, 0
_0801CDC4: .4byte 0x082C4A74
_0801CDC8: .4byte 0x082C4AA0
_0801CDCC:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CEBA
	ldr r0, _0801CDE4
	movs r1, #0xb9
	lsls r1, r1, #1
	ldr r2, _0801CDE8
	movs r3, #1
	bl AGBAssert
	b _0801CEBA
	.align 2, 0
_0801CDE4: .4byte 0x082C4A74
_0801CDE8: .4byte 0x082C4AB8
_0801CDEC:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CE00
	ldr r0, _0801CE20
	movs r1, #0xbc
	lsls r1, r1, #1
	ldr r2, _0801CE24
	movs r3, #1
	bl AGBAssert
_0801CE00:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801CE12
	ldr r0, _0801CE20
	ldr r1, _0801CE28
	ldr r2, _0801CE2C
	movs r3, #1
	bl AGBAssert
_0801CE12:
	ldr r0, [r5, #0x20]
	ldr r1, [r5, #0x14]
	movs r2, #0x64
	bl memcpy
	b _0801D238
	.align 2, 0
_0801CE20: .4byte 0x082C4A74
_0801CE24: .4byte 0x082C4AB8
_0801CE28: .4byte 0x00000179
_0801CE2C: .4byte 0x082C4AA0
_0801CE30:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CE44
	ldr r0, _0801CE5C
	movs r1, #0xbf
	lsls r1, r1, #1
	ldr r2, _0801CE60
	movs r3, #1
	bl AGBAssert
_0801CE44:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801CE56
	ldr r0, _0801CE5C
	ldr r1, _0801CE64
	ldr r2, _0801CE68
	movs r3, #1
	bl AGBAssert
_0801CE56:
	ldr r0, [r5, #0x20]
	movs r1, #0
	b _0801CE96
	.align 2, 0
_0801CE5C: .4byte 0x082C4A74
_0801CE60: .4byte 0x082C4AB8
_0801CE64: .4byte 0x0000017F
_0801CE68: .4byte 0x082C4AA0
_0801CE6C:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CE80
	ldr r0, _0801CEA0
	movs r1, #0xc2
	lsls r1, r1, #1
	ldr r2, _0801CEA4
	movs r3, #1
	bl AGBAssert
_0801CE80:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801CE92
	ldr r0, _0801CEA0
	ldr r1, _0801CEA8
	ldr r2, _0801CEAC
	movs r3, #1
	bl AGBAssert
_0801CE92:
	ldr r0, [r5, #0x20]
	movs r1, #1
_0801CE96:
	bl sub_0801B160
	str r0, [r5, #4]
	b _0801D238
	.align 2, 0
_0801CEA0: .4byte 0x082C4A74
_0801CEA4: .4byte 0x082C4AB8
_0801CEA8: .4byte 0x00000185
_0801CEAC: .4byte 0x082C4AA0
_0801CEB0:
	ldr r1, [r5, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _0801CEBA
	b _0801D238
_0801CEBA:
	movs r0, #0
	str r0, [r5, #0xc]
	ldr r0, [r4, #8]
	str r0, [r5, #0x10]
	b _0801D238
_0801CEC4:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CED8
	ldr r0, _0801CEEC
	movs r1, #0xc9
	lsls r1, r1, #1
	ldr r2, _0801CEF0
	movs r3, #1
	bl AGBAssert
_0801CED8:
	ldr r0, [r4, #8]
	ldr r1, [r5, #0x18]
	bl mevent_first_if_not_null_else_second
	adds r2, r0, #0
	ldr r1, [r5, #0x20]
	bl sub_0801B1AC
	str r0, [r5, #4]
	b _0801D238
	.align 2, 0
_0801CEEC: .4byte 0x082C4A74
_0801CEF0: .4byte 0x082C4AB8
_0801CEF4:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CF08
	ldr r0, _0801CF24
	movs r1, #0xcc
	lsls r1, r1, #1
	ldr r2, _0801CF28
	movs r3, #1
	bl AGBAssert
_0801CF08:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801CF1A
	ldr r0, _0801CF24
	ldr r1, _0801CF2C
	ldr r2, _0801CF30
	movs r3, #1
	bl AGBAssert
_0801CF1A:
	ldr r0, [r5, #0x14]
	ldr r0, [r0]
	str r0, [r5, #4]
	b _0801D238
	.align 2, 0
_0801CF24: .4byte 0x082C4A74
_0801CF28: .4byte 0x082C4AB8
_0801CF2C: .4byte 0x00000199
_0801CF30: .4byte 0x082C4AA0
_0801CF34:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CF48
	ldr r0, _0801CF60
	movs r1, #0xcf
	lsls r1, r1, #1
	ldr r2, _0801CF64
	movs r3, #1
	bl AGBAssert
_0801CF48:
	ldr r0, [r4, #8]
	adds r1, r5, #0
	adds r1, #0x34
	bl mevent_first_if_not_null_else_second
	adds r2, r0, #0
	ldr r1, [r5, #0x20]
	bl sub_0801B1C8
	str r0, [r5, #4]
	b _0801D238
	.align 2, 0
_0801CF60: .4byte 0x082C4A74
_0801CF64: .4byte 0x082C4AB8
_0801CF68:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801CF7A
	ldr r0, _0801CF8C
	ldr r1, _0801CF90
	ldr r2, _0801CF94
	movs r3, #1
	bl AGBAssert
_0801CF7A:
	ldr r0, [r5, #0x20]
	ldr r1, [r4, #4]
	bl MEventStruct_Unk1442CC_GetValueNFrom_unk_20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r5, #4]
	b _0801D238
	.align 2, 0
_0801CF8C: .4byte 0x082C4A74
_0801CF90: .4byte 0x000001A5
_0801CF94: .4byte 0x082C4AA0
_0801CF98:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CFAC
	ldr r0, _0801CFB8
	movs r1, #0xd5
	lsls r1, r1, #1
	ldr r2, _0801CFBC
	movs r3, #1
	bl AGBAssert
_0801CFAC:
	ldr r0, [r5, #0x20]
	ldr r1, [r4, #8]
	bl MEventStruct_Unk1442CC_CompareField_unk_16
	str r0, [r5, #4]
	b _0801D238
	.align 2, 0
_0801CFB8: .4byte 0x082C4A74
_0801CFBC: .4byte 0x082C4AB8
_0801CFC0:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801CFD4
	ldr r0, _0801CFE4
	movs r1, #0xd8
	lsls r1, r1, #1
	ldr r2, _0801CFE8
	movs r3, #1
	bl AGBAssert
_0801CFD4:
	ldr r0, [r4, #8]
	ldr r1, [r5, #0x14]
	ldr r1, [r1]
	bl mevent_compare_pointers
	str r0, [r5, #4]
	b _0801D238
	.align 2, 0
_0801CFE4: .4byte 0x082C4A74
_0801CFE8: .4byte 0x082C4AB8
_0801CFEC:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801D000
	ldr r0, _0801D018
	movs r1, #0xdb
	lsls r1, r1, #1
	ldr r2, _0801D01C
	movs r3, #1
	bl AGBAssert
_0801D000:
	ldr r0, [r4, #8]
	ldr r1, [r5, #0x1c]
	bl mevent_first_if_not_null_else_second
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0x17
	movs r3, #0xe0
	bl mevent_srv_common_init_send
	b _0801D238
	.align 2, 0
_0801D018: .4byte 0x082C4A74
_0801D01C: .4byte 0x082C4AB8
_0801D020:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801D034
	ldr r0, _0801D04C
	movs r1, #0xde
	lsls r1, r1, #1
	ldr r2, _0801D050
	movs r3, #1
	bl AGBAssert
_0801D034:
	ldr r0, [r4, #8]
	ldr r1, [r5, #0x18]
	bl mevent_first_if_not_null_else_second
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0x16
	movs r3, #0xa4
	bl mevent_srv_common_init_send
	b _0801D238
	.align 2, 0
_0801D04C: .4byte 0x082C4A74
_0801D050: .4byte 0x082C4AB8
_0801D054:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801D068
	ldr r0, _0801D080
	movs r1, #0xe1
	lsls r1, r1, #1
	ldr r2, _0801D084
	movs r3, #1
	bl AGBAssert
_0801D068:
	ldr r0, [r4, #8]
	adds r1, r5, #0
	adds r1, #0x34
	bl mevent_first_if_not_null_else_second
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0x18
	movs r3, #4
	bl mevent_srv_common_init_send
	b _0801D238
	.align 2, 0
_0801D080: .4byte 0x082C4A74
_0801D084: .4byte 0x082C4AB8
_0801D088:
	ldr r2, [r4, #8]
	cmp r2, #0
	bne _0801D094
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	b _0801D096
_0801D094:
	ldr r3, [r4, #4]
_0801D096:
	adds r0, r5, #0
	movs r1, #0x19
	bl mevent_srv_common_init_send
	b _0801D238
_0801D0A0:
	ldr r2, [r4, #8]
	cmp r2, #0
	bne _0801D0AC
	ldr r2, [r5, #0x2c]
	ldr r3, [r5, #0x30]
	b _0801D0AE
_0801D0AC:
	ldr r3, [r4, #4]
_0801D0AE:
	adds r0, r5, #0
	movs r1, #0x10
	bl mevent_srv_common_init_send
	b _0801D238
_0801D0B8:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801D0CC
	ldr r0, _0801D0DC
	movs r1, #0xec
	lsls r1, r1, #1
	ldr r2, _0801D0E0
	movs r3, #1
	bl AGBAssert
_0801D0CC:
	ldr r2, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x1a
	movs r3, #0xbc
	bl mevent_srv_common_init_send
	b _0801D238
	.align 2, 0
_0801D0DC: .4byte 0x082C4A74
_0801D0E0: .4byte 0x082C4AB8
_0801D0E4:
	ldr r2, [r4, #8]
	ldr r3, [r4, #4]
	adds r0, r5, #0
	movs r1, #0x15
	bl mevent_srv_common_init_send
	b _0801D238
_0801D0F2:
	ldr r2, [r4, #8]
	ldr r3, [r4, #4]
	adds r0, r5, #0
	movs r1, #0x1c
	bl mevent_srv_common_init_send
	b _0801D238
_0801D100:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801D112
	ldr r0, _0801D120
	ldr r1, _0801D124
	ldr r2, _0801D128
	movs r3, #1
	bl AGBAssert
_0801D112:
	ldr r0, [r5, #0x18]
	ldr r1, [r4, #8]
	movs r2, #0xa4
	bl memcpy
	b _0801D238
	.align 2, 0
_0801D120: .4byte 0x082C4A74
_0801D124: .4byte 0x000001E7
_0801D128: .4byte 0x082C4AB8
_0801D12C:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801D140
	ldr r0, _0801D148
	movs r1, #0xf6
	lsls r1, r1, #1
	ldr r2, _0801D14C
	movs r3, #1
	bl AGBAssert
_0801D140:
	ldr r0, [r5, #0x1c]
	ldr r1, [r4, #8]
	b _0801D1EA
	.align 2, 0
_0801D148: .4byte 0x082C4A74
_0801D14C: .4byte 0x082C4AB8
_0801D150:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801D162
	ldr r0, _0801D16C
	ldr r1, _0801D170
	ldr r2, _0801D174
	movs r3, #1
	bl AGBAssert
_0801D162:
	ldr r0, [r4, #8]
	ldr r0, [r0]
	str r0, [r5, #0x34]
	b _0801D238
	.align 2, 0
_0801D16C: .4byte 0x082C4A74
_0801D170: .4byte 0x000001F1
_0801D174: .4byte 0x082C4AB8
_0801D178:
	ldr r0, [r4, #8]
	str r0, [r5, #0x24]
	ldr r0, [r4, #4]
	str r0, [r5, #0x28]
	b _0801D238
_0801D182:
	ldr r0, [r4, #8]
	str r0, [r5, #0x2c]
	ldr r0, [r4, #4]
	str r0, [r5, #0x30]
	b _0801D238
_0801D18C:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0801D198
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801D1A6
_0801D198:
	ldr r0, _0801D1C0
	movs r1, #0x80
	lsls r1, r1, #2
	ldr r2, _0801D1C4
	movs r3, #1
	bl AGBAssert
_0801D1A6:
	ldr r4, [r5, #0x18]
	bl GetSavedWonderCard
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0xa4
	bl memcpy
	ldr r0, [r5, #0x18]
	bl WonderCard_ResetInternalReceivedFlag
	b _0801D238
	.align 2, 0
_0801D1C0: .4byte 0x082C4A74
_0801D1C4: .4byte 0x082C4ACC
_0801D1C8:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0801D1D4
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801D1E0
_0801D1D4:
	ldr r0, _0801D1F4
	ldr r1, _0801D1F8
	ldr r2, _0801D1FC
	movs r3, #1
	bl AGBAssert
_0801D1E0:
	ldr r4, [r5, #0x1c]
	bl GetSavedWonderNews
	adds r1, r0, #0
	adds r0, r4, #0
_0801D1EA:
	movs r2, #0xe0
	bl memcpy
	b _0801D238
	.align 2, 0
_0801D1F4: .4byte 0x082C4A74
_0801D1F8: .4byte 0x00000206
_0801D1FC: .4byte 0x082C4ACC
_0801D200:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0801D20C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0801D218
_0801D20C:
	ldr r0, _0801D220
	ldr r1, _0801D224
	ldr r2, _0801D228
	movs r3, #1
	bl AGBAssert
_0801D218:
	bl GetSavedRamScriptIfValid
	str r0, [r5, #0x24]
	b _0801D238
	.align 2, 0
_0801D220: .4byte 0x082C4A74
_0801D224: .4byte 0x0000020B
_0801D228: .4byte 0x082C4ACC
_0801D22C:
	ldr r2, [r4, #8]
	ldr r3, [r4, #4]
	adds r0, r5, #0
	movs r1, #0x1b
	bl mevent_srv_common_init_send
_0801D238:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end common_mainseq_4

	thumb_func_start mevent_srv_exec_common
mevent_srv_exec_common: @ 0x0801D240
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _0801D258
	ldr r0, _0801D284
	movs r1, #0x8a
	lsls r1, r1, #2
	ldr r2, _0801D288
	movs r3, #1
	bl AGBAssert
_0801D258:
	ldr r1, _0801D28C
	ldr r0, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _0801D27C
	ldr r0, _0801D284
	ldr r1, _0801D290
	ldr r2, _0801D288
	movs r3, #1
	bl AGBAssert
_0801D27C:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801D284: .4byte 0x082C4A74
_0801D288: .4byte 0x082C4B10
_0801D28C: .4byte 0x082C4AFC
_0801D290: .4byte 0x0000022A
	thumb_func_end mevent_srv_exec_common

