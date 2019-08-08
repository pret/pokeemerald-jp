.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetSavedWonderNews
GetSavedWonderNews: @ 0x0801AAE0
	ldr r0, _0801AAEC
	ldr r0, [r0]
	ldr r1, _0801AAF0
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0801AAEC: .4byte 0x03005AEC
_0801AAF0: .4byte 0x00003230
	thumb_func_end GetSavedWonderNews

	thumb_func_start GetSavedWonderCard
GetSavedWonderCard: @ 0x0801AAF4
	ldr r0, _0801AB00
	ldr r0, [r0]
	ldr r1, _0801AB04
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0801AB00: .4byte 0x03005AEC
_0801AB04: .4byte 0x00003314
	thumb_func_end GetSavedWonderCard

	thumb_func_start sav1_get_mevent_buffer_2
sav1_get_mevent_buffer_2: @ 0x0801AB08
	ldr r0, _0801AB14
	ldr r0, [r0]
	ldr r1, _0801AB18
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0801AB14: .4byte 0x03005AEC
_0801AB18: .4byte 0x000033BC
	thumb_func_end sav1_get_mevent_buffer_2

	thumb_func_start sub_0801AB1C
sub_0801AB1C: @ 0x0801AB1C
	ldr r0, _0801AB28
	ldr r0, [r0]
	ldr r1, _0801AB2C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0801AB28: .4byte 0x03005AEC
_0801AB2C: .4byte 0x000033E8
	thumb_func_end sub_0801AB1C

	thumb_func_start sub_0801AB30
sub_0801AB30: @ 0x0801AB30
	ldr r0, _0801AB3C
	ldr r0, [r0]
	ldr r1, _0801AB40
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0801AB3C: .4byte 0x03005AEC
_0801AB40: .4byte 0x000033E0
	thumb_func_end sub_0801AB30

	thumb_func_start DestroyWonderNews
DestroyWonderNews: @ 0x0801AB44
	push {lr}
	bl s_DestroyWonderNews
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DestroyWonderNews

	thumb_func_start sub_0801AB50
sub_0801AB50: @ 0x0801AB50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_0801ABE4
	cmp r0, #0
	beq _0801AB98
	bl s_DestroyWonderNews
	ldr r4, _0801AB8C
	ldr r0, [r4]
	ldr r5, _0801AB90
	adds r0, r0, r5
	adds r1, r6, #0
	movs r2, #0xe0
	bl memcpy
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0xe0
	bl CalcCRC16WithTable
	ldr r1, [r4]
	ldr r2, _0801AB94
	adds r1, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1]
	movs r0, #1
	b _0801AB9A
	.align 2, 0
_0801AB8C: .4byte 0x03005AEC
_0801AB90: .4byte 0x00003230
_0801AB94: .4byte 0x0000322C
_0801AB98:
	movs r0, #0
_0801AB9A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0801AB50

	thumb_func_start ValidateReceivedWonderNews
ValidateReceivedWonderNews: @ 0x0801ABA0
	push {r4, lr}
	ldr r4, _0801ABD0
	ldr r0, [r4]
	ldr r1, _0801ABD4
	adds r0, r0, r1
	movs r1, #0xe0
	bl CalcCRC16WithTable
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, [r4]
	ldr r2, _0801ABD8
	adds r1, r4, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _0801ABDC
	ldr r1, _0801ABD4
	adds r0, r4, r1
	bl sub_0801ABE4
	cmp r0, #0
	beq _0801ABDC
	movs r0, #1
	b _0801ABDE
	.align 2, 0
_0801ABD0: .4byte 0x03005AEC
_0801ABD4: .4byte 0x00003230
_0801ABD8: .4byte 0x0000322C
_0801ABDC:
	movs r0, #0
_0801ABDE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ValidateReceivedWonderNews

	thumb_func_start sub_0801ABE4
sub_0801ABE4: @ 0x0801ABE4
	push {lr}
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801ABF0
	movs r0, #1
	b _0801ABF2
_0801ABF0:
	movs r0, #0
_0801ABF2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801ABE4

	thumb_func_start WonderNews_Test_Unk_02
WonderNews_Test_Unk_02: @ 0x0801ABF8
	push {lr}
	ldr r0, _0801AC0C
	ldr r0, [r0]
	ldr r1, _0801AC10
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0801AC14
	movs r0, #1
	b _0801AC16
	.align 2, 0
_0801AC0C: .4byte 0x03005AEC
_0801AC10: .4byte 0x00003230
_0801AC14:
	movs r0, #0
_0801AC16:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WonderNews_Test_Unk_02

	thumb_func_start s_DestroyWonderNews
s_DestroyWonderNews: @ 0x0801AC1C
	push {r4, lr}
	sub sp, #4
	movs r4, #0
	str r4, [sp]
	bl GetSavedWonderNews
	adds r1, r0, #0
	ldr r2, _0801AC44
	mov r0, sp
	bl CpuSet
	ldr r0, _0801AC48
	ldr r0, [r0]
	ldr r1, _0801AC4C
	adds r0, r0, r1
	str r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801AC44: .4byte 0x05000038
_0801AC48: .4byte 0x03005AEC
_0801AC4C: .4byte 0x0000322C
	thumb_func_end s_DestroyWonderNews

	thumb_func_start sub_0801AC50
sub_0801AC50: @ 0x0801AC50
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	bl sub_0801AB1C
	adds r1, r0, #0
	ldr r2, _0801AC70
	mov r0, sp
	bl CpuSet
	bl sub_0801D9D0
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801AC70: .4byte 0x05000001
	thumb_func_end sub_0801AC50

	thumb_func_start sub_0801AC74
sub_0801AC74: @ 0x0801AC74
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801AC8C
	ldr r0, [r0]
	ldr r1, _0801AC90
	adds r4, r0, r1
	bl ValidateReceivedWonderNews
	cmp r0, #0
	bne _0801AC94
_0801AC88:
	movs r0, #0
	b _0801ACAA
	.align 2, 0
_0801AC8C: .4byte 0x03005AEC
_0801AC90: .4byte 0x00003230
_0801AC94:
	movs r2, #0
_0801AC96:
	adds r0, r4, r2
	adds r1, r5, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801AC88
	adds r2, #1
	cmp r2, #0xdf
	bls _0801AC96
	movs r0, #1
_0801ACAA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0801AC74

	thumb_func_start DestroyWonderCard
DestroyWonderCard: @ 0x0801ACB0
	push {lr}
	bl sub_0801ADF0
	bl sub_0801AE28
	bl sub_0801B524
	bl ClearRamScript
	bl sub_0809CDB0
	bl sub_0809CE48
	ldr r0, _0801ACDC
	ldr r0, [r0]
	ldr r1, _0801ACE0
	adds r0, r0, r1
	bl ClearEReaderTrainer
	pop {r0}
	bx r0
	.align 2, 0
_0801ACDC: .4byte 0x03005AF0
_0801ACE0: .4byte 0x00000BEC
	thumb_func_end DestroyWonderCard

	thumb_func_start sub_0801ACE4
sub_0801ACE4: @ 0x0801ACE4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_0801AD8C
	cmp r0, #0
	beq _0801AD38
	bl DestroyWonderCard
	ldr r4, _0801AD28
	ldr r0, [r4]
	ldr r5, _0801AD2C
	adds r0, r0, r5
	adds r1, r6, #0
	movs r2, #0xa4
	bl memcpy
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0xa4
	bl CalcCRC16WithTable
	ldr r1, [r4]
	ldr r3, _0801AD30
	adds r2, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r2]
	ldr r0, _0801AD34
	adds r2, r1, r0
	adds r1, r1, r5
	ldrh r0, [r1, #2]
	strh r0, [r2, #6]
	movs r0, #1
	b _0801AD3A
	.align 2, 0
_0801AD28: .4byte 0x03005AEC
_0801AD2C: .4byte 0x00003314
_0801AD30: .4byte 0x00003310
_0801AD34: .4byte 0x000033BC
_0801AD38:
	movs r0, #0
_0801AD3A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0801ACE4

	thumb_func_start ValidateReceivedWonderCard
ValidateReceivedWonderCard: @ 0x0801AD40
	push {r4, r5, lr}
	ldr r5, _0801AD78
	ldr r0, [r5]
	ldr r1, _0801AD7C
	adds r4, r0, r1
	adds r1, #4
	adds r0, r0, r1
	movs r1, #0xa4
	bl CalcCRC16WithTable
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [r4]
	cmp r1, r0
	bne _0801AD84
	ldr r0, [r5]
	ldr r1, _0801AD80
	adds r0, r0, r1
	bl sub_0801AD8C
	cmp r0, #0
	beq _0801AD84
	bl ValidateSavedRamScript
	cmp r0, #0
	beq _0801AD84
	movs r0, #1
	b _0801AD86
	.align 2, 0
_0801AD78: .4byte 0x03005AEC
_0801AD7C: .4byte 0x00003310
_0801AD80: .4byte 0x00003314
_0801AD84:
	movs r0, #0
_0801AD86:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ValidateReceivedWonderCard

	thumb_func_start sub_0801AD8C
sub_0801AD8C: @ 0x0801AD8C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2]
	cmp r0, #0
	beq _0801ADC2
	ldrb r1, [r2, #8]
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bhi _0801ADC2
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0801ADB0
	cmp r0, #0x40
	beq _0801ADB0
	cmp r0, #0x80
	bne _0801ADC2
_0801ADB0:
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #7
	bhi _0801ADC2
	ldrb r0, [r2, #9]
	cmp r0, #7
	bhi _0801ADC2
	movs r0, #1
	b _0801ADC4
_0801ADC2:
	movs r0, #0
_0801ADC4:
	pop {r1}
	bx r1
	thumb_func_end sub_0801AD8C

	thumb_func_start WonderCard_Test_Unk_08_6
WonderCard_Test_Unk_08_6: @ 0x0801ADC8
	push {lr}
	ldr r0, _0801ADE0
	ldr r0, [r0]
	ldr r1, _0801ADE4
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0801ADE8
	movs r0, #1
	b _0801ADEA
	.align 2, 0
_0801ADE0: .4byte 0x03005AEC
_0801ADE4: .4byte 0x00003314
_0801ADE8:
	movs r0, #0
_0801ADEA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WonderCard_Test_Unk_08_6

	thumb_func_start sub_0801ADF0
sub_0801ADF0: @ 0x0801ADF0
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	str r5, [sp]
	ldr r4, _0801AE18
	ldr r1, [r4]
	ldr r0, _0801AE1C
	adds r1, r1, r0
	ldr r2, _0801AE20
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	ldr r1, _0801AE24
	adds r0, r0, r1
	str r5, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801AE18: .4byte 0x03005AEC
_0801AE1C: .4byte 0x00003314
_0801AE20: .4byte 0x05000029
_0801AE24: .4byte 0x00003310
	thumb_func_end sub_0801ADF0

	thumb_func_start sub_0801AE28
sub_0801AE28: @ 0x0801AE28
	push {r4, lr}
	sub sp, #4
	movs r4, #0
	str r4, [sp]
	bl sav1_get_mevent_buffer_2
	adds r1, r0, #0
	ldr r2, _0801AE50
	mov r0, sp
	bl CpuSet
	ldr r0, _0801AE54
	ldr r0, [r0]
	ldr r1, _0801AE58
	adds r0, r0, r1
	str r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801AE50: .4byte 0x05000009
_0801AE54: .4byte 0x03005AEC
_0801AE58: .4byte 0x000033B8
	thumb_func_end sub_0801AE28

	thumb_func_start GetWonderCardFlagID
GetWonderCardFlagID: @ 0x0801AE5C
	push {lr}
	bl ValidateReceivedWonderCard
	cmp r0, #0
	bne _0801AE6A
	movs r0, #0
	b _0801AE74
_0801AE6A:
	ldr r0, _0801AE78
	ldr r0, [r0]
	ldr r1, _0801AE7C
	adds r0, r0, r1
	ldrh r0, [r0]
_0801AE74:
	pop {r1}
	bx r1
	.align 2, 0
_0801AE78: .4byte 0x03005AEC
_0801AE7C: .4byte 0x00003314
	thumb_func_end GetWonderCardFlagID

	thumb_func_start WonderCard_ResetInternalReceivedFlag
WonderCard_ResetInternalReceivedFlag: @ 0x0801AE80
	push {lr}
	adds r2, r0, #0
	ldrb r1, [r2, #8]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne _0801AE94
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2, #8]
_0801AE94:
	pop {r0}
	bx r0
	thumb_func_end WonderCard_ResetInternalReceivedFlag

	thumb_func_start IsWonderCardFlagIDInValidRange
IsWonderCardFlagIDInValidRange: @ 0x0801AE98
	push {lr}
	lsls r0, r0, #0x10
	ldr r1, _0801AEAC
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bls _0801AEB0
	movs r0, #0
	b _0801AEB2
	.align 2, 0
_0801AEAC: .4byte 0xFC180000
_0801AEB0:
	movs r0, #1
_0801AEB2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsWonderCardFlagIDInValidRange

	thumb_func_start CheckReceivedGiftFromWonderCard
CheckReceivedGiftFromWonderCard: @ 0x0801AEB8
	push {r4, lr}
	bl GetWonderCardFlagID
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl IsWonderCardFlagIDInValidRange
	cmp r0, #0
	beq _0801AEF0
	ldr r1, _0801AEE8
	ldr r2, _0801AEEC
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0801AEF0
	movs r0, #1
	b _0801AEF2
	.align 2, 0
_0801AEE8: .4byte 0x082C3304
_0801AEEC: .4byte 0xFFFFFC18
_0801AEF0:
	movs r0, #0
_0801AEF2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckReceivedGiftFromWonderCard

	thumb_func_start sub_0801AEF8
sub_0801AEF8: @ 0x0801AEF8
	push {lr}
	movs r3, #0
	cmp r3, r1
	bge _0801AF1A
	adds r2, r0, #0
	adds r2, #8
_0801AF04:
	ldrh r0, [r2, #0xe]
	cmp r0, #0
	beq _0801AF12
	ldrh r0, [r2]
	cmp r0, #0
	beq _0801AF12
	adds r3, #1
_0801AF12:
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _0801AF04
_0801AF1A:
	adds r0, r3, #0
	pop {r1}
	bx r1
	thumb_func_end sub_0801AEF8

	thumb_func_start sub_0801AF20
sub_0801AF20: @ 0x0801AF20
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	cmp r1, r2
	bge _0801AF5A
	ldrh r6, [r4, #2]
	movs r0, #0x16
	adds r0, r0, r5
	mov ip, r0
_0801AF34:
	lsls r3, r1, #1
	mov r7, ip
	ldrh r0, [r7]
	cmp r0, r6
	beq _0801AF4C
	adds r0, r5, #0
	adds r0, #8
	adds r0, r0, r3
	ldrh r0, [r0]
	ldrh r3, [r4]
	cmp r0, r3
	bne _0801AF50
_0801AF4C:
	movs r0, #1
	b _0801AF5C
_0801AF50:
	movs r7, #2
	add ip, r7
	adds r1, #1
	cmp r1, r2
	blt _0801AF34
_0801AF5A:
	movs r0, #0
_0801AF5C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801AF20

	thumb_func_start sub_0801AF64
sub_0801AF64: @ 0x0801AF64
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0801AF84
	ldrh r1, [r1]
	cmp r1, #0
	beq _0801AF84
	ldr r0, _0801AF80
	cmp r1, r0
	bhi _0801AF84
	movs r0, #1
	b _0801AF86
	.align 2, 0
_0801AF80: .4byte 0x0000019B
_0801AF84:
	movs r0, #0
_0801AF86:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801AF64

	thumb_func_start sub_0801AF8C
sub_0801AF8C: @ 0x0801AF8C
	push {lr}
	bl ValidateReceivedWonderCard
	cmp r0, #0
	beq _0801AFC0
	ldr r0, _0801AFB4
	ldr r3, [r0]
	ldr r0, _0801AFB8
	adds r2, r3, r0
	ldrb r1, [r2, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _0801AFC0
	ldr r1, _0801AFBC
	adds r0, r3, r1
	ldrb r1, [r2, #9]
	bl sub_0801AEF8
	b _0801AFC2
	.align 2, 0
_0801AFB4: .4byte 0x03005AEC
_0801AFB8: .4byte 0x00003314
_0801AFBC: .4byte 0x000033BC
_0801AFC0:
	movs r0, #0
_0801AFC2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801AF8C

	thumb_func_start sub_0801AFC8
sub_0801AFC8: @ 0x0801AFC8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0801AFF4
	ldr r0, [r6]
	ldr r1, _0801AFF8
	adds r0, r0, r1
	ldrb r4, [r0, #9]
	adds r0, r5, #0
	bl sub_0801AF64
	cmp r0, #0
	beq _0801B032
	ldr r0, [r6]
	ldr r1, _0801AFFC
	adds r0, r0, r1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0801AF20
	cmp r0, #0
	beq _0801B00C
	b _0801B032
	.align 2, 0
_0801AFF4: .4byte 0x03005AEC
_0801AFF8: .4byte 0x00003314
_0801AFFC: .4byte 0x000033BC
_0801B000:
	ldrh r0, [r5, #2]
	strh r0, [r1]
	ldrh r0, [r5]
	strh r0, [r2]
	movs r0, #1
	b _0801B034
_0801B00C:
	movs r3, #0
	cmp r3, r4
	bge _0801B032
	ldr r0, [r6]
	ldr r6, _0801B03C
	adds r2, r0, r6
	adds r6, #0xe
	adds r1, r0, r6
_0801B01C:
	ldrh r0, [r2, #0xe]
	cmp r0, #0
	bne _0801B028
	ldrh r0, [r2]
	cmp r0, #0
	beq _0801B000
_0801B028:
	adds r2, #2
	adds r1, #2
	adds r3, #1
	cmp r3, r4
	blt _0801B01C
_0801B032:
	movs r0, #0
_0801B034:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B03C: .4byte 0x000033C4
	thumb_func_end sub_0801AFC8

	thumb_func_start sub_0801B040
sub_0801B040: @ 0x0801B040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	str r0, [sp]
	ldr r2, _0801B074
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	ldr r0, _0801B078
	str r0, [r5]
	movs r0, #1
	strh r0, [r5, #4]
	str r0, [r5, #8]
	cmp r4, #0
	beq _0801B080
	movs r0, #5
	strh r0, [r5, #0xc]
	ldr r0, _0801B07C
	b _0801B088
	.align 2, 0
_0801B074: .4byte 0x05000019
_0801B078: .4byte 0x00000101
_0801B07C: .4byte 0x00000201
_0801B080:
	movs r0, #4
	strh r0, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
_0801B088:
	str r0, [r5, #0x10]
	bl ValidateReceivedWonderCard
	cmp r0, #0
	beq _0801B0BC
	bl GetSavedWonderCard
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	bl sav1_get_mevent_buffer_2
	adds r1, r5, #0
	adds r1, #0x20
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	bl GetSavedWonderCard
	ldrb r1, [r0, #9]
	adds r0, r5, #0
	adds r0, #0x44
	strb r1, [r0]
	b _0801B0BE
_0801B0BC:
	strh r0, [r5, #0x14]
_0801B0BE:
	adds r4, r5, #0
	adds r4, #0x4c
	ldr r0, _0801B148
	mov r8, r0
	adds r6, r5, #0
	adds r6, #0x45
	adds r7, r5, #0
	adds r7, #0x50
	movs r1, #0x5c
	adds r1, r1, r5
	mov sb, r1
	movs r2, #0x60
	adds r2, r2, r5
	mov sl, r2
	ldr r0, _0801B14C
	ldr r0, [r0]
	ldr r3, _0801B150
	adds r2, r0, r3
	adds r1, r5, #0
	adds r1, #0x16
	movs r3, #3
_0801B0E8:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _0801B0E8
	mov r0, r8
	ldr r1, [r0]
	adds r1, #0xa
	adds r0, r4, #0
	bl CopyTrainerId
	mov r2, r8
	ldr r1, [r2]
	adds r0, r6, #0
	bl StringCopy
	ldr r0, _0801B14C
	ldr r0, [r0]
	ldr r3, _0801B154
	adds r2, r0, r3
	adds r1, r7, #0
	movs r3, #5
_0801B118:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _0801B118
	ldr r1, _0801B158
	mov r0, sb
	movs r2, #4
	bl memcpy
	ldr r0, _0801B15C
	ldrb r0, [r0]
	mov r4, sl
	strb r0, [r4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B148: .4byte 0x03005AF0
_0801B14C: .4byte 0x03005AEC
_0801B150: .4byte 0x000033E0
_0801B154: .4byte 0x00002BB0
_0801B158: .4byte 0x080000AC
_0801B15C: .4byte 0x080000BC
	thumb_func_end sub_0801B040

	thumb_func_start sub_0801B160
sub_0801B160: @ 0x0801B160
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r1, [r2]
	ldr r0, _0801B1A0
	cmp r1, r0
	bne _0801B19C
	ldrh r1, [r2, #4]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0801B19C
	ldr r0, [r2, #8]
	ands r0, r3
	cmp r0, #0
	beq _0801B19C
	cmp r4, #0
	bne _0801B1A4
	ldrh r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801B19C
	ldr r0, [r2, #0x10]
	movs r1, #0xe0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0801B1A4
_0801B19C:
	movs r0, #0
	b _0801B1A6
	.align 2, 0
_0801B1A0: .4byte 0x00000101
_0801B1A4:
	movs r0, #1
_0801B1A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0801B160

	thumb_func_start sub_0801B1AC
sub_0801B1AC: @ 0x0801B1AC
	push {lr}
	ldrh r1, [r1, #0x14]
	cmp r1, #0
	bne _0801B1B8
	movs r0, #0
	b _0801B1C4
_0801B1B8:
	ldrh r0, [r0]
	cmp r0, r1
	beq _0801B1C2
	movs r0, #2
	b _0801B1C4
_0801B1C2:
	movs r0, #1
_0801B1C4:
	pop {r1}
	bx r1
	thumb_func_end sub_0801B1AC

	thumb_func_start sub_0801B1C8
sub_0801B1C8: @ 0x0801B1C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x20
	adds r4, #0x44
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_0801AEF8
	ldrb r2, [r4]
	subs r4, r2, r0
	cmp r4, #0
	bne _0801B1E8
	movs r0, #1
	b _0801B202
_0801B1E8:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0801AF20
	cmp r0, #0
	beq _0801B1F8
	movs r0, #3
	b _0801B202
_0801B1F8:
	cmp r4, #1
	beq _0801B200
	movs r0, #2
	b _0801B202
_0801B200:
	movs r0, #4
_0801B202:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0801B1C8

	thumb_func_start MEventStruct_Unk1442CC_CompareField_unk_16
MEventStruct_Unk1442CC_CompareField_unk_16: @ 0x0801B208
	push {r4, lr}
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x16
_0801B210:
	ldrh r0, [r2]
	ldrh r4, [r1]
	cmp r0, r4
	beq _0801B21C
	movs r0, #0
	b _0801B228
_0801B21C:
	adds r1, #2
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _0801B210
	movs r0, #1
_0801B228:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MEventStruct_Unk1442CC_CompareField_unk_16

	thumb_func_start sub_0801B230
sub_0801B230: @ 0x0801B230
	push {lr}
	adds r2, r0, #0
	adds r2, #0x20
	adds r0, #0x44
	ldrb r1, [r0]
	adds r0, r2, #0
	bl sub_0801AEF8
	pop {r1}
	bx r1
	thumb_func_end sub_0801B230

	thumb_func_start MEventStruct_Unk1442CC_GetValueNFrom_unk_20
MEventStruct_Unk1442CC_GetValueNFrom_unk_20: @ 0x0801B244
	push {lr}
	adds r2, r0, #0
	cmp r1, #4
	bhi _0801B290
	lsls r0, r1, #2
	ldr r1, _0801B258
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B258: .4byte 0x0801B25C
_0801B25C: @ jump table
	.4byte _0801B270 @ case 0
	.4byte _0801B274 @ case 1
	.4byte _0801B278 @ case 2
	.4byte _0801B27C @ case 3
	.4byte _0801B288 @ case 4
_0801B270:
	ldrh r0, [r2, #0x20]
	b _0801B29E
_0801B274:
	ldrh r0, [r2, #0x22]
	b _0801B29E
_0801B278:
	ldrh r0, [r2, #0x24]
	b _0801B29E
_0801B27C:
	adds r0, r2, #0
	bl sub_0801B230
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0801B29E
_0801B288:
	adds r0, r2, #0
	adds r0, #0x44
	ldrb r0, [r0]
	b _0801B29E
_0801B290:
	ldr r0, _0801B2A4
	ldr r1, _0801B2A8
	ldr r2, _0801B2AC
	movs r3, #1
	bl AGBAssert
	movs r0, #0
_0801B29E:
	pop {r1}
	bx r1
	.align 2, 0
_0801B2A4: .4byte 0x082C332C
_0801B2A8: .4byte 0x0000034F
_0801B2AC: .4byte 0x082C3338
	thumb_func_end MEventStruct_Unk1442CC_GetValueNFrom_unk_20

	thumb_func_start sub_0801B2B0
sub_0801B2B0: @ 0x0801B2B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0801B2D8
	ldr r0, [r2]
	ldr r1, _0801B2DC
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #2
	bne _0801B34A
	movs r2, #0
	cmp r4, #4
	bhi _0801B318
	lsls r0, r4, #2
	ldr r1, _0801B2E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B2D8: .4byte 0x03005AEC
_0801B2DC: .4byte 0x00003314
_0801B2E0: .4byte 0x0801B2E4
_0801B2E4: @ jump table
	.4byte _0801B2F8 @ case 0
	.4byte _0801B304 @ case 1
	.4byte _0801B310 @ case 2
	.4byte _0801B318 @ case 3
	.4byte _0801B318 @ case 4
_0801B2F8:
	ldr r0, [r3]
	ldr r1, _0801B300
	b _0801B316
	.align 2, 0
_0801B300: .4byte 0x000033BC
_0801B304:
	ldr r0, [r3]
	ldr r1, _0801B30C
	b _0801B316
	.align 2, 0
_0801B30C: .4byte 0x000033BE
_0801B310:
	ldr r0, [r3]
	movs r1, #0xcf
	lsls r1, r1, #6
_0801B316:
	adds r2, r0, r1
_0801B318:
	cmp r2, #0
	bne _0801B338
	ldr r0, _0801B32C
	ldr r1, _0801B330
	ldr r2, _0801B334
	movs r3, #1
	bl AGBAssert
	b _0801B34A
	.align 2, 0
_0801B32C: .4byte 0x082C332C
_0801B330: .4byte 0x0000037A
_0801B334: .4byte 0x082C3338
_0801B338:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0801B350
	cmp r0, r1
	bls _0801B34A
	strh r1, [r2]
_0801B34A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B350: .4byte 0x000003E7
	thumb_func_end sub_0801B2B0

	thumb_func_start mevent_081445C0
mevent_081445C0: @ 0x0801B354
	push {lr}
	cmp r0, #4
	bhi _0801B438
	lsls r0, r0, #2
	ldr r1, _0801B364
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B364: .4byte 0x0801B368
_0801B368: @ jump table
	.4byte _0801B37C @ case 0
	.4byte _0801B3A4 @ case 1
	.4byte _0801B3CC @ case 2
	.4byte _0801B3F4 @ case 3
	.4byte _0801B418 @ case 4
_0801B37C:
	ldr r0, _0801B398
	ldr r2, [r0]
	ldr r1, _0801B39C
	adds r0, r2, r1
	ldrb r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _0801B438
	ldr r1, _0801B3A0
	adds r0, r2, r1
	ldrh r0, [r0]
	b _0801B446
	.align 2, 0
_0801B398: .4byte 0x03005AEC
_0801B39C: .4byte 0x00003314
_0801B3A0: .4byte 0x000033BC
_0801B3A4:
	ldr r0, _0801B3C0
	ldr r2, [r0]
	ldr r1, _0801B3C4
	adds r0, r2, r1
	ldrb r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _0801B438
	ldr r1, _0801B3C8
	adds r0, r2, r1
	ldrh r0, [r0, #2]
	b _0801B446
	.align 2, 0
_0801B3C0: .4byte 0x03005AEC
_0801B3C4: .4byte 0x00003314
_0801B3C8: .4byte 0x000033BC
_0801B3CC:
	ldr r0, _0801B3E8
	ldr r2, [r0]
	ldr r1, _0801B3EC
	adds r0, r2, r1
	ldrb r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _0801B438
	ldr r1, _0801B3F0
	adds r0, r2, r1
	ldrh r0, [r0, #4]
	b _0801B446
	.align 2, 0
_0801B3E8: .4byte 0x03005AEC
_0801B3EC: .4byte 0x00003314
_0801B3F0: .4byte 0x000033BC
_0801B3F4:
	ldr r0, _0801B410
	ldr r0, [r0]
	ldr r1, _0801B414
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _0801B438
	bl sub_0801AF8C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0801B446
	.align 2, 0
_0801B410: .4byte 0x03005AEC
_0801B414: .4byte 0x00003314
_0801B418:
	ldr r0, _0801B430
	ldr r0, [r0]
	ldr r1, _0801B434
	adds r2, r0, r1
	ldrb r1, [r2, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _0801B438
	ldrb r0, [r2, #9]
	b _0801B446
	.align 2, 0
_0801B430: .4byte 0x03005AEC
_0801B434: .4byte 0x00003314
_0801B438:
	ldr r0, _0801B44C
	ldr r1, _0801B450
	ldr r2, _0801B454
	movs r3, #1
	bl AGBAssert
	movs r0, #0
_0801B446:
	pop {r1}
	bx r1
	.align 2, 0
_0801B44C: .4byte 0x082C332C
_0801B450: .4byte 0x000003A7
_0801B454: .4byte 0x082C3338
	thumb_func_end mevent_081445C0

	thumb_func_start sub_0801B458
sub_0801B458: @ 0x0801B458
	ldr r1, _0801B460
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0801B460: .4byte 0x02022924
	thumb_func_end sub_0801B458

	thumb_func_start sub_0801B464
sub_0801B464: @ 0x0801B464
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	ldr r5, _0801B494
	movs r0, #0
	str r0, [r5]
	cmp r4, #0
	beq _0801B4A2
	bl ValidateReceivedWonderCard
	cmp r0, #0
	beq _0801B4A0
	ldr r0, _0801B498
	ldr r0, [r0]
	ldr r1, _0801B49C
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0801B4A0
	movs r0, #1
	str r0, [r5]
	b _0801B4A2
	.align 2, 0
_0801B494: .4byte 0x02022924
_0801B498: .4byte 0x03005AEC
_0801B49C: .4byte 0x00003314
_0801B4A0:
	movs r0, #0
_0801B4A2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0801B464

	thumb_func_start sub_0801B4A8
sub_0801B4A8: @ 0x0801B4A8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801B4D0
	ldr r0, [r0]
	cmp r0, #0
	beq _0801B514
	cmp r2, #1
	beq _0801B4EC
	cmp r2, #1
	blo _0801B4D8
	cmp r2, #2
	bne _0801B508
	ldr r0, _0801B4D4
	ldr r2, [r0]
	movs r0, #0xd0
	lsls r0, r0, #6
	adds r2, r2, r0
	movs r0, #2
	b _0801B4F6
	.align 2, 0
_0801B4D0: .4byte 0x02022924
_0801B4D4: .4byte 0x03005AEC
_0801B4D8:
	ldr r0, _0801B4E4
	ldr r2, [r0]
	ldr r0, _0801B4E8
	adds r2, r2, r0
	movs r0, #0
	b _0801B4F6
	.align 2, 0
_0801B4E4: .4byte 0x03005AEC
_0801B4E8: .4byte 0x000033EC
_0801B4EC:
	ldr r0, _0801B500
	ldr r2, [r0]
	ldr r0, _0801B504
	adds r2, r2, r0
	movs r0, #1
_0801B4F6:
	movs r3, #5
	bl sub_0801B5B8
	b _0801B514
	.align 2, 0
_0801B500: .4byte 0x03005AEC
_0801B504: .4byte 0x000033EC
_0801B508:
	ldr r0, _0801B518
	ldr r1, _0801B51C
	ldr r2, _0801B520
	movs r3, #1
	bl AGBAssert
_0801B514:
	pop {r0}
	bx r0
	.align 2, 0
_0801B518: .4byte 0x082C332C
_0801B51C: .4byte 0x000003F2
_0801B520: .4byte 0x082C3338
	thumb_func_end sub_0801B4A8

	thumb_func_start sub_0801B524
sub_0801B524: @ 0x0801B524
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r0, _0801B544
	ldr r1, [r0]
	ldr r0, _0801B548
	adds r1, r1, r0
	ldr r2, _0801B54C
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801B544: .4byte 0x03005AEC
_0801B548: .4byte 0x000033EC
_0801B54C: .4byte 0x0500000A
	thumb_func_end sub_0801B524

	thumb_func_start sub_0801B550
sub_0801B550: @ 0x0801B550
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	cmp r1, r2
	bge _0801B572
	ldr r0, [r4]
	cmp r0, r5
	beq _0801B572
	adds r3, r4, #0
_0801B564:
	adds r3, #4
	adds r1, #1
	cmp r1, r2
	bge _0801B572
	ldr r0, [r3]
	cmp r0, r5
	bne _0801B564
_0801B572:
	cmp r1, r2
	bne _0801B594
	subs r3, r1, #1
	cmp r3, #0
	ble _0801B58E
	lsls r0, r3, #2
	subs r0, #4
	adds r2, r0, r4
_0801B582:
	ldr r0, [r2]
	str r0, [r2, #4]
	subs r2, #4
	subs r3, #1
	cmp r3, #0
	bgt _0801B582
_0801B58E:
	str r5, [r4]
	movs r0, #1
	b _0801B5B0
_0801B594:
	adds r3, r1, #0
	cmp r3, #0
	ble _0801B5AC
	lsls r0, r3, #2
	subs r0, #4
	adds r2, r0, r4
_0801B5A0:
	ldr r0, [r2]
	str r0, [r2, #4]
	subs r2, #4
	subs r3, #1
	cmp r3, #0
	bgt _0801B5A0
_0801B5AC:
	str r5, [r4]
	movs r0, #0
_0801B5B0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0801B550

	thumb_func_start sub_0801B5B8
sub_0801B5B8: @ 0x0801B5B8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	bl sub_0801B550
	cmp r0, #0
	beq _0801B5D0
	adds r0, r4, #0
	bl sub_0801B2B0
_0801B5D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0801B5B8

