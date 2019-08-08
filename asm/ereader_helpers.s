.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081D2F00
sub_081D2F00: @ 0x081D2F00
	push {lr}
	ldr r0, _081D2F20
	ldr r0, [r0]
	ldr r1, _081D2F24
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r2, r1, #1
	adds r0, r2, #0
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_081D2F20: .4byte 0x03005AEC
_081D2F24: .4byte 0x00003D6D
	thumb_func_end sub_081D2F00

	thumb_func_start Struct_Unk81D38FC_ValidateChecksum
Struct_Unk81D38FC_ValidateChecksum: @ 0x081D2F28
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0x9b
	lsls r5, r5, #2
	adds r1, r5, #0
	bl CalcByteArraySum
	adds r4, r4, r5
	ldr r1, [r4]
	cmp r0, r1
	bne _081D2F42
	movs r0, #1
	b _081D2F44
_081D2F42:
	movs r0, #0
_081D2F44:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end Struct_Unk81D38FC_ValidateChecksum

	thumb_func_start EReader_IsReceivedDataValid
EReader_IsReceivedDataValid: @ 0x081D2F4C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrb r5, [r7]
	subs r0, r5, #1
	cmp r0, #7
	bhi _081D2F94
	movs r6, #0
	cmp r6, r5
	bhs _081D2F78
	adds r4, r7, #0
	adds r4, #8
_081D2F62:
	adds r0, r4, #0
	bl Struct_Unk81D38FC_ValidateChecksum
	cmp r0, #0
	beq _081D2F94
	movs r0, #0x9c
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r6, #1
	cmp r6, r5
	blo _081D2F62
_081D2F78:
	adds r0, r7, #0
	adds r0, #8
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	subs r1, r1, r5
	lsls r1, r1, #4
	bl CalcByteArraySum
	ldr r1, [r7, #4]
	cmp r0, r1
	bne _081D2F94
	movs r0, #1
	b _081D2F96
_081D2F94:
	movs r0, #0
_081D2F96:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end EReader_IsReceivedDataValid

	thumb_func_start TrainerHill_VerifyChecksum
TrainerHill_VerifyChecksum: @ 0x081D2F9C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	subs r0, #1
	cmp r0, #7
	bhi _081D2FBE
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xec
	lsls r1, r1, #4
	bl CalcByteArraySum
	ldr r1, [r4, #4]
	cmp r0, r1
	bne _081D2FBE
	movs r0, #1
	b _081D2FC0
_081D2FBE:
	movs r0, #0
_081D2FC0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TrainerHill_VerifyChecksum

	thumb_func_start TryWriteTrainerHill_r
TryWriteTrainerHill_r: @ 0x081D2FC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _081D2FEA
	ldr r0, _081D3080
	ldr r2, _081D3084
	movs r1, #0xe1
	movs r3, #1
	bl AGBAssert
_081D2FEA:
	mov r1, r8
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _081D2FFE
	ldr r0, _081D3080
	ldr r2, _081D3088
	movs r1, #0xe2
	movs r3, #1
	bl AGBAssert
_081D2FFE:
	movs r2, #0x80
	lsls r2, r2, #5
	mov r0, sb
	movs r1, #0
	bl memset
	mov r1, r8
	ldrb r0, [r1]
	mov r1, sb
	strb r0, [r1]
	bl sub_081D2F00
	mov r1, sb
	strb r0, [r1, #1]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	asrs r0, r0, #1
	mov r1, sb
	strb r0, [r1, #2]
	movs r5, #0
	adds r1, #8
	str r1, [sp]
	mov r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	bge _081D30C6
	mov r7, r8
	adds r7, #0xc
	mov r6, r8
	movs r1, #0xa8
	lsls r1, r1, #1
	add r1, r8
	mov sl, r1
_081D3042:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _081D308C
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r0, r0, #1
	lsls r4, r0, #4
	subs r4, r4, r0
	lsls r4, r4, #2
	subs r4, r4, r0
	lsls r4, r4, #4
	add r4, sb
	ldrb r0, [r6, #8]
	strb r0, [r4, #8]
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r4, r1
	mov r1, sl
	movs r2, #0x92
	lsls r2, r2, #1
	bl memcpy
	adds r4, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0xa2
	lsls r2, r2, #1
	bl memcpy
	b _081D30B2
	.align 2, 0
_081D3080: .4byte 0x085FAEF4
_081D3084: .4byte 0x085FAF04
_081D3088: .4byte 0x085FAF18
_081D308C:
	lsrs r1, r5, #0x1f
	adds r1, r5, r1
	asrs r1, r1, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #4
	add r0, sb
	ldrb r1, [r6, #8]
	strb r1, [r0, #9]
	movs r1, #0xa8
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #0
	movs r2, #0xa2
	lsls r2, r2, #1
	bl memcpy
_081D30B2:
	movs r0, #0x9c
	lsls r0, r0, #2
	adds r7, r7, r0
	adds r6, r6, r0
	add sl, r0
	adds r5, #1
	mov r1, r8
	ldrb r1, [r1]
	cmp r5, r1
	blt _081D3042
_081D30C6:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _081D30FC
	lsrs r2, r5, #0x1f
	adds r2, r5, r2
	asrs r2, r2, #1
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #4
	add r0, sb
	movs r1, #0xa8
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r3, _081D3118
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r2, #0xa2
	lsls r2, r2, #1
	bl memcpy
_081D30FC:
	movs r1, #0xec
	lsls r1, r1, #4
	ldr r0, [sp]
	bl CalcByteArraySum
	mov r1, sb
	str r0, [r1, #4]
	movs r0, #0x1e
	bl TryWriteSpecialSaveSection
	cmp r0, #1
	bne _081D311C
	movs r0, #1
	b _081D311E
	.align 2, 0
_081D3118: .4byte 0x085FA9E4
_081D311C:
	movs r0, #0
_081D311E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryWriteTrainerHill_r

	thumb_func_start TryWriteTrainerHill
TryWriteTrainerHill: @ 0x081D3130
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	bl AllocZeroed
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl TryWriteTrainerHill_r
	adds r4, r0, #0
	adds r0, r5, #0
	bl Free
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryWriteTrainerHill

	thumb_func_start TryReadTrainerHill_r
TryReadTrainerHill_r: @ 0x081D3158
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x1e
	bl TryReadSpecialSaveSection
	cmp r0, #1
	bne _081D3184
	ldr r2, _081D3180
	adds r0, r5, #0
	adds r1, r4, #0
	bl memcpy
	adds r0, r5, #0
	bl TrainerHill_VerifyChecksum
	cmp r0, #0
	beq _081D3184
	movs r0, #1
	b _081D3186
	.align 2, 0
_081D3180: .4byte 0x00000EC8
_081D3184:
	movs r0, #0
_081D3186:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end TryReadTrainerHill_r

	thumb_func_start TryReadTrainerHill
TryReadTrainerHill: @ 0x081D318C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	bl AllocZeroed
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl TryReadTrainerHill_r
	adds r4, r0, #0
	adds r0, r5, #0
	bl Free
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryReadTrainerHill

	thumb_func_start ReadTrainerHillAndValidate
ReadTrainerHillAndValidate: @ 0x081D31B4
	push {r4, r5, lr}
	movs r0, #0x80
	lsls r0, r0, #5
	bl AllocZeroed
	adds r4, r0, #0
	bl TryReadTrainerHill
	adds r5, r0, #0
	adds r0, r4, #0
	bl Free
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ReadTrainerHillAndValidate

	thumb_func_start unref_sub_81D3B54
unref_sub_81D3B54: @ 0x081D31D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	bl sub_081D3820
	movs r7, #2
	ldr r4, _081D3214
_081D31E4:
	bl sub_081D37F0
	ldr r0, _081D3218
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081D31F6
	strb r7, [r4]
_081D31F6:
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_081D33F0
	adds r1, r0, #0
	ldr r0, _081D321C
	strh r1, [r0]
	movs r0, #0x13
	ands r0, r1
	cmp r0, #0x10
	bne _081D3220
	movs r4, #0
	b _081D3242
	.align 2, 0
_081D3214: .4byte 0x030031E4
_081D3218: .4byte 0x030012DA
_081D321C: .4byte 0x030012DC
_081D3220:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081D322C
	movs r4, #1
	b _081D3242
_081D322C:
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _081D3240
	strb r0, [r4]
	bl VBlankIntrWait
	b _081D31E4
_081D3240:
	movs r4, #2
_081D3242:
	movs r0, #0
	str r0, [sp]
	ldr r1, _081D3260
	ldr r2, _081D3264
	mov r0, sp
	bl CpuSet
	bl sub_081D3874
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081D3260: .4byte 0x030012C0
_081D3264: .4byte 0x05000006
	thumb_func_end unref_sub_81D3B54

	thumb_func_start unref_sub_81D3BE8
unref_sub_81D3BE8: @ 0x081D3268
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_081D3820
	movs r6, #2
	ldr r4, _081D32A8
_081D3276:
	bl sub_081D37F0
	ldr r0, _081D32AC
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081D3288
	strb r6, [r4]
_081D3288:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_081D33F0
	adds r1, r0, #0
	ldr r0, _081D32B0
	strh r1, [r0]
	movs r0, #0x13
	ands r0, r1
	cmp r0, #0x10
	bne _081D32B4
	movs r4, #0
	b _081D32D6
	.align 2, 0
_081D32A8: .4byte 0x030031E4
_081D32AC: .4byte 0x030012DA
_081D32B0: .4byte 0x030012DC
_081D32B4:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081D32C0
	movs r4, #1
	b _081D32D6
_081D32C0:
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _081D32D4
	strb r0, [r4]
	bl VBlankIntrWait
	b _081D3276
_081D32D4:
	movs r4, #2
_081D32D6:
	movs r0, #0
	str r0, [sp]
	ldr r1, _081D32F4
	ldr r2, _081D32F8
	mov r0, sp
	bl CpuSet
	bl sub_081D3874
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081D32F4: .4byte 0x030012C0
_081D32F8: .4byte 0x05000006
	thumb_func_end unref_sub_81D3BE8

	thumb_func_start sub_081D32FC
sub_081D32FC: @ 0x081D32FC
	push {r4, lr}
	ldr r4, _081D3328
	movs r3, #0
	strh r3, [r4]
	ldr r2, _081D332C
	ldrh r1, [r2]
	ldr r0, _081D3330
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r4]
	ldr r0, _081D3334
	strh r3, [r0]
	subs r0, #0x1a
	strh r3, [r0]
	ldr r1, _081D3338
	movs r0, #0xc0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D3328: .4byte 0x04000208
_081D332C: .4byte 0x04000200
_081D3330: .4byte 0x0000FF3F
_081D3334: .4byte 0x04000128
_081D3338: .4byte 0x04000202
	thumb_func_end sub_081D32FC

	thumb_func_start sub_081D333C
sub_081D333C: @ 0x081D333C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, _081D3394
	movs r4, #0
	strh r4, [r5]
	ldr r3, _081D3398
	ldrh r1, [r3]
	ldr r0, _081D339C
	ands r0, r1
	strh r0, [r3]
	movs r6, #1
	strh r6, [r5]
	ldr r0, _081D33A0
	strh r4, [r0]
	ldr r2, _081D33A4
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r7, _081D33A8
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	strh r4, [r5]
	ldrh r0, [r3]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r3]
	strh r6, [r5]
	ldr r1, _081D33AC
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _081D338A
	str r0, [sp]
	ldr r2, _081D33B0
	mov r0, sp
	bl CpuSet
_081D338A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081D3394: .4byte 0x04000208
_081D3398: .4byte 0x04000200
_081D339C: .4byte 0x0000FF3F
_081D33A0: .4byte 0x04000134
_081D33A4: .4byte 0x04000128
_081D33A8: .4byte 0x00004003
_081D33AC: .4byte 0x030012C0
_081D33B0: .4byte 0x05000006
	thumb_func_end sub_081D333C

	thumb_func_start sub_081D33B4
sub_081D33B4: @ 0x081D33B4
	ldr r0, _081D33DC
	movs r3, #0
	strh r3, [r0]
	ldr r2, _081D33E0
	movs r1, #0xa0
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _081D33E4
	strb r3, [r0]
	ldr r0, _081D33E8
	strh r3, [r0]
	ldr r1, _081D33EC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_081D33DC: .4byte 0x04000134
_081D33E0: .4byte 0x04000128
_081D33E4: .4byte 0x030031E4
_081D33E8: .4byte 0x030012DE
_081D33EC: .4byte 0x030012E0
	thumb_func_end sub_081D33B4

	thumb_func_start sub_081D33F0
sub_081D33F0: @ 0x081D33F0
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081D3410
	ldrb r0, [r0, #1]
	cmp r0, #6
	bls _081D3406
	b _081D354C
_081D3406:
	lsls r0, r0, #2
	ldr r1, _081D3414
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D3410: .4byte 0x030012C0
_081D3414: .4byte 0x081D3418
_081D3418: @ jump table
	.4byte _081D3434 @ case 0
	.4byte _081D3448 @ case 1
	.4byte _081D3468 @ case 2
	.4byte _081D347C @ case 3
	.4byte _081D34F4 @ case 4
	.4byte _081D3504 @ case 5
	.4byte _081D353C @ case 6
_081D3434:
	bl sub_081D333C
	ldr r1, _081D3444
	movs r0, #1
	strb r0, [r1, #2]
	strb r0, [r1, #1]
	b _081D354C
	.align 2, 0
_081D3444: .4byte 0x030012C0
_081D3448:
	adds r0, r2, #0
	bl sub_081D3568
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081D3458
	bl sub_081D37BC
_081D3458:
	ldr r0, _081D3464
	ldrb r0, [r0]
	cmp r0, #2
	beq _081D3462
	b _081D354C
_081D3462:
	b _081D3484
	.align 2, 0
_081D3464: .4byte 0x030031E4
_081D3468:
	bl sub_081D33B4
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_081D359C
	ldr r1, _081D3490
	movs r0, #3
	strb r0, [r1, #1]
_081D347C:
	ldr r0, _081D3494
	ldrb r0, [r0]
	cmp r0, #2
	bne _081D3498
_081D3484:
	ldr r1, _081D3490
	strb r0, [r1, #4]
	movs r0, #6
	strb r0, [r1, #1]
	b _081D354C
	.align 2, 0
_081D3490: .4byte 0x030012C0
_081D3494: .4byte 0x030031E4
_081D3498:
	ldr r2, _081D34D8
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ldr r1, _081D34DC
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r1, _081D34E0
	ldrb r0, [r1]
	cmp r0, #0
	bne _081D34BC
	cmp r3, #0x3c
	bls _081D34BC
	movs r0, #1
	strb r0, [r1, #4]
	movs r0, #6
	strb r0, [r1, #1]
_081D34BC:
	ldr r4, _081D34E0
	ldrb r0, [r4, #2]
	cmp r0, #2
	beq _081D354C
	ldrb r0, [r4]
	cmp r0, #0
	beq _081D34E4
	ldrh r0, [r2]
	cmp r0, #2
	bls _081D34E4
	bl sub_081D37BC
	movs r0, #2
	b _081D354A
	.align 2, 0
_081D34D8: .4byte 0x030012DE
_081D34DC: .4byte 0x030012E0
_081D34E0: .4byte 0x030012C0
_081D34E4:
	bl sub_081D37BC
	ldr r1, _081D34F0
	movs r0, #2
	strb r0, [r1, #2]
	b _081D354C
	.align 2, 0
_081D34F0: .4byte 0x030012C0
_081D34F4:
	bl sub_081D333C
	ldr r1, _081D3500
	movs r0, #5
	strb r0, [r1, #1]
	b _081D354C
	.align 2, 0
_081D3500: .4byte 0x030012C0
_081D3504:
	ldr r0, _081D3534
	ldrb r0, [r0]
	cmp r0, #1
	bne _081D3518
	ldr r0, _081D3538
	ldrh r0, [r0]
	cmp r0, #2
	bls _081D3518
	bl sub_081D37BC
_081D3518:
	ldr r1, _081D3538
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _081D354C
	ldr r0, _081D3534
	movs r1, #1
	strb r1, [r0, #4]
	movs r1, #6
	strb r1, [r0, #1]
	b _081D354C
	.align 2, 0
_081D3534: .4byte 0x030012C0
_081D3538: .4byte 0x030012DE
_081D353C:
	ldr r4, _081D3564
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _081D354C
	bl sub_081D32FC
	movs r0, #0
_081D354A:
	strb r0, [r4, #2]
_081D354C:
	ldr r2, _081D3564
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #4]
	lsls r1, r1, #2
	orrs r0, r1
	ldrb r1, [r2, #3]
	lsls r1, r1, #4
	orrs r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_081D3564: .4byte 0x030012C0
	thumb_func_end sub_081D33F0

	thumb_func_start sub_081D3568
sub_081D3568: @ 0x081D3568
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081D3584
	ldr r0, [r0]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #8
	bne _081D358C
	cmp r2, #0
	beq _081D358C
	ldr r1, _081D3588
	movs r0, #1
	b _081D3590
	.align 2, 0
_081D3584: .4byte 0x04000128
_081D3588: .4byte 0x030012C0
_081D358C:
	ldr r1, _081D3598
	movs r0, #0
_081D3590:
	strb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_081D3598: .4byte 0x030012C0
	thumb_func_end sub_081D3568

	thumb_func_start sub_081D359C
sub_081D359C: @ 0x081D359C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r3, _081D35C8
	ldrb r0, [r3]
	cmp r0, #0
	beq _081D35D4
	ldr r2, _081D35CC
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	str r5, [r3, #8]
	ldr r0, _081D35D0
	str r4, [r0]
	lsrs r0, r4, #2
	adds r0, #1
	str r0, [r3, #0x10]
	bl sub_081D35E8
	b _081D35DC
	.align 2, 0
_081D35C8: .4byte 0x030012C0
_081D35CC: .4byte 0x04000128
_081D35D0: .4byte 0x04000120
_081D35D4:
	ldr r1, _081D35E4
	ldrh r0, [r1]
	strh r0, [r1]
	str r2, [r3, #8]
_081D35DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D35E4: .4byte 0x04000128
	thumb_func_end sub_081D359C

	thumb_func_start sub_081D35E8
sub_081D35E8: @ 0x081D35E8
	ldr r1, _081D360C
	ldr r2, _081D3610
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _081D3614
	movs r2, #0x40
	strh r2, [r0]
	ldr r3, _081D3618
	movs r0, #0
	strh r0, [r3]
	adds r1, #0xf4
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	strh r0, [r3]
	bx lr
	.align 2, 0
_081D360C: .4byte 0x0400010C
_081D3610: .4byte 0x0000FDA7
_081D3614: .4byte 0x0400010E
_081D3618: .4byte 0x04000208
	thumb_func_end sub_081D35E8

	thumb_func_start sub_081D361C
sub_081D361C: @ 0x081D361C
	push {lr}
	bl sub_081D37CC
	bl sub_081D37BC
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D361C

	thumb_func_start sub_081D362C
sub_081D362C: @ 0x081D362C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r2, _081D3644
	ldrb r0, [r2, #1]
	adds r3, r2, #0
	cmp r0, #3
	beq _081D36B4
	cmp r0, #3
	bgt _081D3648
	cmp r0, #1
	beq _081D3650
	b _081D37AA
	.align 2, 0
_081D3644: .4byte 0x030012C0
_081D3648:
	cmp r0, #5
	bne _081D364E
	b _081D377C
_081D364E:
	b _081D37AA
_081D3650:
	ldr r1, _081D3680
	ldr r2, _081D3684
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _081D3688
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r4, #0
	ldr r6, _081D3684
	ldr r5, _081D368C
_081D366C:
	lsls r0, r1, #1
	add r0, sp
	ldrh r0, [r0]
	cmp r0, r6
	bne _081D3690
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _081D369A
	.align 2, 0
_081D3680: .4byte 0x0400012A
_081D3684: .4byte 0x0000CCD0
_081D3688: .4byte 0x04000120
_081D368C: .4byte 0x0000FFFF
_081D3690:
	cmp r0, r5
	beq _081D369A
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_081D369A:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #3
	bls _081D366C
	cmp r2, #2
	beq _081D36AA
	b _081D37AA
_081D36AA:
	cmp r4, #0
	beq _081D36B0
	b _081D37AA
_081D36B0:
	strb r2, [r3, #1]
	b _081D37AA
_081D36B4:
	ldr r0, _081D36F0
	ldr r4, [r0]
	ldr r0, [r2, #0xc]
	cmp r0, #0
	bne _081D36CA
	ldrb r0, [r2]
	cmp r0, #0
	bne _081D36CA
	lsrs r0, r4, #2
	adds r0, #1
	str r0, [r2, #0x10]
_081D36CA:
	ldrb r0, [r3]
	cmp r0, #1
	bne _081D3700
	ldr r1, [r3, #0xc]
	ldr r0, [r3, #0x10]
	cmp r1, r0
	bge _081D36F4
	ldr r2, _081D36F0
	ldr r0, [r3, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r3, #0x14]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r3, #0x14]
	b _081D373A
	.align 2, 0
_081D36F0: .4byte 0x04000120
_081D36F4:
	ldr r1, _081D36FC
	ldr r0, [r3, #0x14]
	b _081D3738
	.align 2, 0
_081D36FC: .4byte 0x04000120
_081D3700:
	ldr r1, [r3, #0xc]
	cmp r1, #0
	ble _081D3720
	ldr r0, [r3, #0x10]
	adds r0, #1
	cmp r1, r0
	bge _081D3720
	ldr r0, [r3, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	subs r1, #4
	str r4, [r1]
	ldr r0, [r3, #0x14]
	adds r0, r0, r4
	str r0, [r3, #0x14]
	b _081D3734
_081D3720:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq _081D3734
	ldr r0, [r3, #0x14]
	cmp r0, r4
	bne _081D3730
	movs r0, #1
	b _081D3732
_081D3730:
	movs r0, #2
_081D3732:
	strb r0, [r3, #3]
_081D3734:
	ldr r1, _081D375C
	movs r0, #0
_081D3738:
	str r0, [r1]
_081D373A:
	ldr r1, [r3, #0xc]
	adds r1, #1
	str r1, [r3, #0xc]
	ldr r0, [r3, #0x10]
	adds r0, #2
	cmp r1, r0
	bge _081D376A
	ldrb r0, [r3]
	cmp r0, #0
	beq _081D3764
	ldr r0, _081D3760
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	b _081D37AA
	.align 2, 0
_081D375C: .4byte 0x030012E0
_081D3760: .4byte 0x0400010E
_081D3764:
	bl sub_081D37BC
	b _081D37AA
_081D376A:
	movs r0, #0
	movs r1, #4
	strb r1, [r3, #1]
	ldr r1, _081D3778
	strh r0, [r1]
	b _081D37AA
	.align 2, 0
_081D3778: .4byte 0x030012DE
_081D377C:
	ldrb r3, [r2]
	cmp r3, #0
	bne _081D3788
	ldr r1, _081D37B4
	ldrb r0, [r2, #3]
	strh r0, [r1]
_081D3788:
	ldr r0, _081D37B8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sp
	ldrh r1, [r0, #2]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _081D37AA
	cmp r3, #1
	bne _081D37A6
	strb r1, [r2, #3]
_081D37A6:
	movs r0, #6
	strb r0, [r2, #1]
_081D37AA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D37B4: .4byte 0x0400012A
_081D37B8: .4byte 0x04000120
	thumb_func_end sub_081D362C

	thumb_func_start sub_081D37BC
sub_081D37BC: @ 0x081D37BC
	ldr r0, _081D37C8
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_081D37C8: .4byte 0x04000128
	thumb_func_end sub_081D37BC

	thumb_func_start sub_081D37CC
sub_081D37CC: @ 0x081D37CC
	ldr r2, _081D37E0
	ldrh r1, [r2]
	ldr r0, _081D37E4
	ands r0, r1
	strh r0, [r2]
	ldr r1, _081D37E8
	ldr r2, _081D37EC
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_081D37E0: .4byte 0x0400010E
_081D37E4: .4byte 0x0000FF7F
_081D37E8: .4byte 0x0400010C
_081D37EC: .4byte 0x0000FDA7
	thumb_func_end sub_081D37CC

	thumb_func_start sub_081D37F0
sub_081D37F0: @ 0x081D37F0
	push {r4, lr}
	ldr r0, _081D3810
	ldrh r0, [r0]
	ldr r2, _081D3814
	adds r1, r2, #0
	eors r1, r0
	ldr r4, _081D3818
	ldr r3, _081D381C
	ldrh r2, [r3]
	adds r0, r1, #0
	bics r0, r2
	strh r0, [r4]
	strh r1, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D3810: .4byte 0x04000130
_081D3814: .4byte 0x000003FF
_081D3818: .4byte 0x030012DA
_081D381C: .4byte 0x030012D8
	thumb_func_end sub_081D37F0

	thumb_func_start sub_081D3820
sub_081D3820: @ 0x081D3820
	ldr r1, _081D384C
	ldr r0, _081D3850
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081D3854
	ldr r0, _081D3858
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081D385C
	ldr r0, _081D3860
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081D3864
	ldr r0, _081D3868
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081D386C
	ldr r0, _081D3870
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_081D384C: .4byte 0x030012E4
_081D3850: .4byte 0x04000208
_081D3854: .4byte 0x030012E6
_081D3858: .4byte 0x04000200
_081D385C: .4byte 0x030012E8
_081D3860: .4byte 0x0400010E
_081D3864: .4byte 0x030012EA
_081D3868: .4byte 0x04000128
_081D386C: .4byte 0x030012EC
_081D3870: .4byte 0x04000134
	thumb_func_end sub_081D3820

	thumb_func_start sub_081D3874
sub_081D3874: @ 0x081D3874
	ldr r1, _081D38A0
	ldr r0, _081D38A4
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #8
	ldr r0, _081D38A8
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0xf2
	ldr r0, _081D38AC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x1a
	ldr r0, _081D38B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0xc
	ldr r0, _081D38B4
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_081D38A0: .4byte 0x04000208
_081D38A4: .4byte 0x030012E4
_081D38A8: .4byte 0x030012E6
_081D38AC: .4byte 0x030012E8
_081D38B0: .4byte 0x030012EA
_081D38B4: .4byte 0x030012EC
	thumb_func_end sub_081D3874

	thumb_func_start sub_081D38B8
sub_081D38B8: @ 0x081D38B8
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _081D38D0
	ldr r2, _081D38D4
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_081D38D0: .4byte 0x030012C0
_081D38D4: .4byte 0x05000006
	thumb_func_end sub_081D38B8

