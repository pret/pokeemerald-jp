    .include "asm/macros.inc"
    .include "constants/constants.inc"
	.text
    .syntax unified

	thumb_func_start umul3232H32
umul3232H32: @ 0x0828D5D4
	add r2, pc, #0x0
	bx r2
	thumb_func_end umul3232H32

	arm_func_start __umul3232H32
__umul3232H32: @ 0x0828D5D8
	umull r2, r3, r0, r1
	add r0, r3, #0
	bx lr
	arm_func_end __umul3232H32

	thumb_func_start SoundMain
SoundMain: @ 0x0828D5E4
	ldr r0, _0828D650
	ldr r0, [r0]
	ldr r2, _0828D654
	ldr r3, [r0]
	cmp r2, r3
	beq _0828D5F2
	bx lr
_0828D5F2:
	adds r3, #1
	str r3, [r0]
	push {r4, r5, r6, r7, lr}
	mov r1, r8
	mov r2, sb
	mov r3, sl
	mov r4, fp
	push {r0, r1, r2, r3, r4}
	sub sp, #0x18
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	beq _0828D616
	ldr r2, _0828D65C
	ldrb r2, [r2]
	cmp r2, #0xa0
	bhs _0828D614
	adds r2, #0xe4
_0828D614:
	adds r1, r1, r2
_0828D616:
	str r1, [sp, #0x14]
	ldr r3, [r0, #0x20]
	cmp r3, #0
	beq _0828D626
	ldr r0, [r0, #0x24]
	bl sub_0828DA1E
	ldr r0, [sp, #0x18]
_0828D626:
	ldr r3, [r0, #0x28]
	bl sub_0828DA1E
	ldr r0, [sp, #0x18]
	ldr r3, [r0, #0x10]
	mov r8, r3
	ldr r5, _0828D660
	adds r5, r5, r0
	ldrb r4, [r0, #4]
	subs r7, r4, #1
	bls _0828D646
	ldrb r1, [r0, #0xb]
	subs r1, r1, r7
	mov r2, r8
	muls r2, r1, r2
	adds r5, r5, r2
_0828D646:
	str r5, [sp, #8]
	ldr r6, _0828D664
	ldr r3, _0828D658
	bx r3
	.align 2, 0
_0828D650: .4byte gUnknown_3007FF0
_0828D654: .4byte 0x68736D53
_0828D658: .4byte gUnknown_3001B51
_0828D65C: .4byte 0x04000006
_0828D660: .4byte 0x00000350
_0828D664: .4byte 0x00000630
	thumb_func_end SoundMain

	thumb_func_start SoundMainRAM
SoundMainRAM: @ 0x0828D668
	ldrb r3, [r0, #5]
	cmp r3, #0
	beq _0828D6C8
	add r1, pc, #0x4
	bx r1
	.align 2, 0
	thumb_func_end SoundMainRAM

	arm_func_start SoundMainRAM_Reverb
SoundMainRAM_Reverb: @ 0x0828D674
	cmp r4, #2
	addeq r7, r0, #0x350
	addne r7, r5, r8
	mov r4, r8
_0828D684:
	ldrsb r0, [r5, r6]
	ldrsb r1, [r5]
	add r0, r0, r1
	ldrsb r1, [r7, r6]
	add r0, r0, r1
	ldrsb r1, [r7], #1
	add r0, r0, r1
	mul r1, r0, r3
	asr r0, r1, #9
	tst r0, #0x80
	addne r0, r0, #1
	strb r0, [r5, r6]
	strb r0, [r5], #1
	subs r4, r4, #1
	bgt _0828D684
	add r0, pc, #0x2f
	bx r0
	.thumb
_0828D6C8:
	movs r0, #0
	mov r1, r8
	adds r6, r6, r5
	lsrs r1, r1, #3
	blo _0828D6D6
	stm r5!, {r0}
	stm r6!, {r0}
_0828D6D6:
	lsrs r1, r1, #1
	blo _0828D6E2
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
_0828D6E2:
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	subs r1, #1
	bgt _0828D6E2
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #0x18]
	mov ip, r0
	ldrb r0, [r4, #6]
	adds r4, #0x50
_0828D700:
	str r0, [sp, #4]
	ldr r3, [r4, #0x24]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0828D720
	ldr r1, _0828D71C
	ldrb r1, [r1]
	cmp r1, #0xa0
	bhs _0828D714
	adds r1, #0xe4
_0828D714:
	cmp r1, r0
	blo _0828D720
	b _0828DA0A
	.align 2, 0
_0828D71C: .4byte 0x04000006
_0828D720:
	ldrb r6, [r4]
	movs r0, #0xc7
	tst r0, r6
	bne _0828D72A
	b _0828DA00
_0828D72A:
	movs r0, #0x80
	tst r0, r6
	beq _0828D760
	movs r0, #0x40
	tst r0, r6
	bne _0828D770
	movs r6, #3
	strb r6, [r4]
	adds r0, r3, #0
	adds r0, #0x10
	ldr r1, [r4, #0x18]
	adds r0, r0, r1
	str r0, [r4, #0x28]
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0x18]
	movs r5, #0
	strb r5, [r4, #9]
	str r5, [r4, #0x1c]
	ldrb r2, [r3, #3]
	movs r0, #0xc0
	tst r0, r2
	beq _0828D7B8
	movs r0, #0x10
	orrs r6, r0
	strb r6, [r4]
	b _0828D7B8
_0828D760:
	ldrb r5, [r4, #9]
	movs r0, #4
	tst r0, r6
	beq _0828D776
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	bhi _0828D7C6
_0828D770:
	movs r0, #0
	strb r0, [r4]
	b _0828DA00
_0828D776:
	movs r0, #0x40
	tst r0, r6
	beq _0828D796
	ldrb r0, [r4, #7]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	bhi _0828D7C6
_0828D788:
	ldrb r5, [r4, #0xc]
	cmp r5, #0
	beq _0828D770
	movs r0, #4
	orrs r6, r0
	strb r6, [r4]
	b _0828D7C6
_0828D796:
	movs r2, #3
	ands r2, r6
	cmp r2, #2
	bne _0828D7B4
	ldrb r0, [r4, #5]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #6]
	cmp r5, r0
	bhi _0828D7C6
	adds r5, r0, #0
	beq _0828D788
	subs r6, #1
	strb r6, [r4]
	b _0828D7C6
_0828D7B4:
	cmp r2, #3
	bne _0828D7C6
_0828D7B8:
	ldrb r0, [r4, #4]
	adds r5, r5, r0
	cmp r5, #0xff
	blo _0828D7C6
	movs r5, #0xff
	subs r6, #1
	strb r6, [r4]
_0828D7C6:
	strb r5, [r4, #9]
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, #7]
	adds r0, #1
	muls r0, r5, r0
	lsrs r5, r0, #4
	ldrb r0, [r4, #2]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #3]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xb]
	movs r0, #0x10
	ands r0, r6
	str r0, [sp, #0x10]
	beq _0828D7FA
	adds r0, r3, #0
	adds r0, #0x10
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [sp, #0x10]
_0828D7FA:
	ldr r5, [sp, #8]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x28]
	add r0, pc, #0x0
	bx r0
	arm_func_end SoundMainRAM_Reverb

	arm_func_start sub_0828D804
sub_0828D804: @ 0x0828D804
	str r8, [sp]
	ldr sb, [r4, #0x1c]
	ldrb sl, [r4, #0xa]
	ldrb fp, [r4, #0xb]
	ldrb r0, [r4, #1]
	tst r0, #0x30
	beq _0828D828
	bl sub_0828DA24
	b _0828D9E8
_0828D828:
	lsl sl, sl, #0x10
	lsl fp, fp, #0x10
	ldrb r0, [r4, #1]
	tst r0, #8
	beq _0828D95C
_0828D83C:
	cmp r2, #4
	ble _0828D8AC
	subs r2, r2, r8
	movgt sb, #0
	bgt _0828D868
	mov sb, r8
	add r2, r2, r8
	sub r8, r2, #4
	sub sb, sb, r8
	ands r2, r2, #3
	moveq r2, #4
_0828D868:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0828D870:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	adds r5, r5, #0x40000000
	blo _0828D870
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _0828D868
	adds r8, r8, sb
	beq _0828D9EC
_0828D8AC:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0828D8B4:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	subs r2, r2, #1
	beq _0828D924
_0828D8D8:
	adds r5, r5, #0x40000000
	blo _0828D8B4
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _0828D83C
	b _0828D9EC
_0828D8F4:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0828D918
	ldr r3, [sp, #0x14]
	rsb lr, r2, #0
_0828D908:
	adds r2, r0, r2
	bgt _0828D9BC
	sub lr, lr, r0
	b _0828D908
_0828D918:
	pop {r4, ip}
	mov r2, #0
	b _0828D934
_0828D924:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ldrne r3, [sp, #0xc]
	bne _0828D8D8
_0828D934:
	strb r2, [r4]
	lsr r0, r5, #0x1e
	bic r5, r5, #0xc0000000
	rsb r0, r0, #3
	lsl r0, r0, #3
	ror r6, r6, r0
	ror r7, r7, r0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	b _0828D9F4
_0828D95C:
	push {r4, ip}
	ldr r1, [r4, #0x20]
	mul r4, ip, r1
	ldrsb r0, [r3]
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_0828D974:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0828D97C:
	mul lr, sb, r1
	add lr, r0, lr, asr #23
	mul ip, sl, lr
	bic ip, ip, #0xff0000
	add r6, ip, r6, ror #8
	mul ip, fp, lr
	bic ip, ip, #0xff0000
	add r7, ip, r7, ror #8
	add sb, sb, r4
	lsrs lr, sb, #0x17
	beq _0828D9C8
	bic sb, sb, #0x3f800000
	subs r2, r2, lr
	ble _0828D8F4
	subs lr, lr, #1
	addeq r0, r0, r1
_0828D9BC:
	ldrsbne r0, [r3, lr]!
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_0828D9C8:
	adds r5, r5, #0x40000000
	blo _0828D97C
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _0828D974
	sub r3, r3, #1
	pop {r4, ip}
_0828D9E8:
	str sb, [r4, #0x1c]
_0828D9EC:
	str r2, [r4, #0x18]
	str r3, [r4, #0x28]
_0828D9F4:
	ldr r8, [sp]
	add r0, pc, #1
	bx r0
	.thumb
_0828DA00:
	ldr r0, [sp, #4]
	subs r0, #1
	ble _0828DA0A
	adds r4, #0x40
	b _0828D700
_0828DA0A:
	ldr r0, [sp, #0x18]
	ldr r3, _0828DA20
	str r3, [r0]
	add sp, #0x1c
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}
	arm_func_end sub_0828D804

	non_word_aligned_thumb_func_start sub_0828DA1E
sub_0828DA1E: @ 0x0828DA1E
	bx r3
	.align 2, 0
_0828DA20: .4byte 0x68736D53
	thumb_func_end sub_0828DA1E

	arm_func_start sub_0828DA24
sub_0828DA24: @ 0x0828DA24
	ldr r6, [r4, #0x24]
	ldrb r0, [r4]
	tst r0, #0x20
	bne _0828DA74
	orr r0, r0, #0x20
	strb r0, [r4]
	ldrb r0, [r4, #1]
	tst r0, #0x10
	beq _0828DA5C
	ldr r1, [r6, #0xc]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x20
	sub r3, r1, r3
	str r3, [r4, #0x28]
_0828DA5C:
	ldrh r0, [r6]
	cmp r0, #0
	beq _0828DA74
	sub r3, r3, r6
	sub r3, r3, #0x10
	str r3, [r4, #0x28]
_0828DA74:
	push {r8, ip, lr}
	lsl sl, sl, #0x10
	lsl fp, fp, #0x10
	ldr r1, [r4, #0x20]
	ldrb r0, [r4, #1]
	tst r0, #8
	movne r8, #0x800000
	muleq r8, ip, r1
	ldrh r0, [r6]
	cmp r0, #0
	beq _0828DC28
	mov r0, #-0x1000000
	str r0, [r4, #0x3c]
	ldrb r0, [r4, #1]
	tst r0, #0x10
	bne _0828DB80
	bl sub_0828DCE0
	mov r0, r1
	add r3, r3, #1
	bl sub_0828DCE0
	sub r1, r1, r0
_0828DAC8:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0828DAD0:
	mul lr, sb, r1
	add lr, r0, lr, asr #23
	mul ip, sl, lr
	bic ip, ip, #0xff0000
	add r6, ip, r6, ror #8
	mul ip, fp, lr
	bic ip, ip, #0xff0000
	add r7, ip, r7, ror #8
	add sb, sb, r8
	lsrs lr, sb, #0x17
	beq _0828DB30
	bic sb, sb, #0x3f800000
	subs r2, r2, lr
	ble _0828DB58
	subs lr, lr, #1
	bne _0828DB18
	add r0, r0, r1
	b _0828DB24
_0828DB18:
	add r3, r3, lr
	bl sub_0828DCE0
	mov r0, r1
_0828DB24:
	add r3, r3, #1
	bl sub_0828DCE0
	sub r1, r1, r0
_0828DB30:
	adds r5, r5, #0x40000000
	blo _0828DAD0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	ldr r6, [sp]
	subs r6, r6, #4
	str r6, [sp]
	bgt _0828DAC8
	sub r3, r3, #1
	b _0828DCB0
_0828DB58:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0828DCB4
	ldr r3, [r4, #0x24]
	ldr r3, [r3, #8]
	rsb lr, r2, #0
_0828DB70:
	adds r2, r2, r0
	bgt _0828DB18
	sub lr, lr, r0
	b _0828DB70
_0828DB80:
	sub r3, r3, #1
	bl sub_0828DCE0
	mov r0, r1
	sub r3, r3, #1
	bl sub_0828DCE0
	sub r1, r1, r0
_0828DB98:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0828DBA0:
	mul lr, sb, r1
	add lr, r0, lr, asr #23
	mul ip, sl, lr
	bic ip, ip, #0xff0000
	add r6, ip, r6, ror #8
	mul ip, fp, lr
	bic ip, ip, #0xff0000
	add r7, ip, r7, ror #8
	add sb, sb, r8
	lsrs lr, sb, #0x17
	beq _0828DC00
	bic sb, sb, #0x3f800000
	subs r2, r2, lr
	ble _0828DCB4
	subs lr, lr, #1
	bne _0828DBE8
	add r0, r0, r1
	b _0828DBF4
_0828DBE8:
	sub r3, r3, lr
	bl sub_0828DCE0
	mov r0, r1
_0828DBF4:
	sub r3, r3, #1
	bl sub_0828DCE0
	sub r1, r1, r0
_0828DC00:
	adds r5, r5, #0x40000000
	blo _0828DBA0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	ldr r6, [sp]
	subs r6, r6, #4
	str r6, [sp]
	bgt _0828DB98
	add r3, r3, #2
	b _0828DCB0
_0828DC28:
	ldrb r0, [r4, #1]
	tst r0, #0x10
	beq _0828DCB0
	ldrsb r0, [r3, #-1]!
	ldrsb r1, [r3, #-1]
	sub r1, r1, r0
_0828DC40:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_0828DC48:
	mul lr, sb, r1
	add lr, r0, lr, asr #23
	mul ip, sl, lr
	bic ip, ip, #0xff0000
	add r6, ip, r6, ror #8
	mul ip, fp, lr
	bic ip, ip, #0xff0000
	add r7, ip, r7, ror #8
	add sb, sb, r8
	lsrs lr, sb, #0x17
	beq _0828DC8C
	bic sb, sb, #0x3f800000
	subs r2, r2, lr
	ble _0828DCB4
	ldrsb r0, [r3, -lr]!
	ldrsb r1, [r3, #-1]
	sub r1, r1, r0
_0828DC8C:
	adds r5, r5, #0x40000000
	blo _0828DC48
	str r7, [r5, #0x630]
	str r6, [r5], #4
	ldr r6, [sp]
	subs r6, r6, #4
	str r6, [sp]
	bgt _0828DC40
	add r3, r3, #1
_0828DCB0:
	pop {r8, ip, pc}
_0828DCB4:
	mov r2, #0
	strb r2, [r4]
	lsr r0, r5, #0x1e
	bic r5, r5, #0xc0000000
	rsb r0, r0, #3
	lsl r0, r0, #3
	ror r6, r6, r0
	ror r7, r7, r0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	pop {r8, ip, pc}
	arm_func_end sub_0828DA24

	arm_func_start sub_0828DCE0
sub_0828DCE0: @ 0x0828DCE0
	push {r0, r2, r5, r6, r7, lr}
	lsr r0, r3, #6
	ldr r1, [r4, #0x3c]
	cmp r0, r1
	beq _0828DD54
	str r0, [r4, #0x3c]
	mov r1, #0x21
	mul r2, r1, r0
	ldr r1, [r4, #0x24]
	add r2, r2, r1
	add r2, r2, #0x10
	ldr r5, _0828DD64
	ldr r6, _0828DD68
	mov r7, #0x40
	ldrb lr, [r2], #1
	strb lr, [r5], #1
	ldrb r1, [r2], #1
	b _0828DD3C
_0828DD28:
	ldrb r1, [r2], #1
	lsr r0, r1, #4
	ldrsb r0, [r6, r0]
	add lr, lr, r0
	strb lr, [r5], #1
_0828DD3C:
	and r0, r1, #0xf
	ldrsb r0, [r6, r0]
	add lr, lr, r0
	strb lr, [r5], #1
	subs r7, r7, #2
	bgt _0828DD28
_0828DD54:
	ldr r5, _0828DD64
	and r0, r3, #0x3f
	ldrsb r1, [r5, r0]
	pop {r0, r2, r5, r6, r7, pc}
	.align 2, 0
_0828DD64: .4byte gUnknown_30012F8
_0828DD68: .4byte gUnknown_85FD590
	arm_func_end sub_0828DCE0

	thumb_func_start SoundMainBTM
SoundMainBTM: @ 0x0828DD6C
	mov ip, r4
	movs r1, #0
	movs r2, #0
	movs r3, #0
	movs r4, #0
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	mov r4, ip
	bx lr
	.align 2, 0
	thumb_func_end SoundMainBTM

	thumb_func_start RealClearChain
RealClearChain: @ 0x0828DD84
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _0828DDA2
	ldr r1, [r0, #0x34]
	ldr r2, [r0, #0x30]
	cmp r2, #0
	beq _0828DD96
	str r1, [r2, #0x34]
	b _0828DD98
_0828DD96:
	str r1, [r3, #0x20]
_0828DD98:
	cmp r1, #0
	beq _0828DD9E
	str r2, [r1, #0x30]
_0828DD9E:
	movs r1, #0
	str r1, [r0, #0x2c]
_0828DDA2:
	bx lr
ply_fine:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0828DDC8
_0828DDAE:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0828DDBC
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
_0828DDBC:
	adds r0, r4, #0
	bl RealClearChain
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0828DDAE
_0828DDC8:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RealClearChain

	thumb_func_start MPlayJumpTableCopy
MPlayJumpTableCopy: @ 0x0828DDD4
	mov ip, lr
	movs r1, #0x24
	ldr r2, _0828DE04
_0828DDDA:
	ldr r3, [r2]
	bl _0828DDEE
	stm r0!, {r3}
	adds r2, #4
	subs r1, #1
	bgt _0828DDDA
	bx ip
	.align 2, 0
	thumb_func_end MPlayJumpTableCopy

	thumb_func_start sub_0828DDEC
sub_0828DDEC: @ 0x0828DDEC
	ldrb r3, [r2]
_0828DDEE:
	push {r0}
	lsrs r0, r2, #0x19
	bne _0828DE00
	ldr r0, _0828DE04
	cmp r2, r0
	blo _0828DDFE
	lsrs r0, r2, #0xe
	beq _0828DE00
_0828DDFE:
	movs r3, #0
_0828DE00:
	pop {r0}
	bx lr
	.align 2, 0
_0828DE04: .4byte gUnknown_85FD500
	thumb_func_end sub_0828DDEC

	thumb_func_start ld_r3_tp_adr_i
ld_r3_tp_adr_i: @ 0x0828DE08
	ldr r2, [r1, #0x40]
	thumb_func_end ld_r3_tp_adr_i

	non_word_aligned_thumb_func_start sub_0828DE0A
sub_0828DE0A: @ 0x0828DE0A
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	b _0828DDEE
	.align 2, 0
ply_goto:
	push {lr}
_0828DE16:
	ldr r2, [r1, #0x40]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	ldrb r3, [r2, #2]
	orrs r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #1]
	orrs r0, r3
	lsls r0, r0, #8
	bl sub_0828DDEC
	orrs r0, r3
	str r0, [r1, #0x40]
	pop {r0}
	bx r0
	thumb_func_end sub_0828DE0A

	thumb_func_start ply_patt
ply_patt: @ 0x0828DE34
	ldrb r2, [r1, #2]
	cmp r2, #3
	bhs _0828DE4C
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r1, #0x40]
	adds r2, #4
	str r2, [r3, #0x44]
	ldrb r2, [r1, #2]
	adds r2, #1
	strb r2, [r1, #2]
	b ply_goto
_0828DE4C:
	b ply_fine
	.align 2, 0
	thumb_func_end ply_patt

	thumb_func_start ply_pend
ply_pend: @ 0x0828DE50
	ldrb r2, [r1, #2]
	cmp r2, #0
	beq _0828DE62
	subs r2, #1
	strb r2, [r1, #2]
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r3, #0x44]
	str r2, [r1, #0x40]
_0828DE62:
	bx lr
	thumb_func_end ply_pend

	thumb_func_start ply_rept
ply_rept: @ 0x0828DE64
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0
	bne _0828DE74
	adds r2, #1
	str r2, [r1, #0x40]
	b _0828DE16
_0828DE74:
	ldrb r3, [r1, #3]
	adds r3, #1
	strb r3, [r1, #3]
	mov ip, r3
	bl ld_r3_tp_adr_i
	cmp ip, r3
	bhs _0828DE86
	b _0828DE16
_0828DE86:
	movs r3, #0
	strb r3, [r1, #3]
	adds r2, #5
	str r2, [r1, #0x40]
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ply_rept

	thumb_func_start ply_prio
ply_prio: @ 0x0828DE94
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x1d]
	bx ip
	.align 2, 0
	thumb_func_end ply_prio

	thumb_func_start ply_tempo
ply_tempo: @ 0x0828DEA0
	mov ip, lr
	bl ld_r3_tp_adr_i
	lsls r3, r3, #1
	strh r3, [r0, #0x1c]
	ldrh r2, [r0, #0x1e]
	muls r3, r2, r3
	lsrs r3, r3, #8
	strh r3, [r0, #0x20]
	bx ip
	thumb_func_end ply_tempo

	thumb_func_start ply_keysh
ply_keysh: @ 0x0828DEB4
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0xa]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0
	thumb_func_end ply_keysh

	thumb_func_start ply_voice
ply_voice: @ 0x0828DEC8
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, [r0, #0x30]
	adds r2, r2, r3
	ldr r3, [r2]
	bl _0828DDEE
	str r3, [r1, #0x24]
	ldr r3, [r2, #4]
	bl _0828DDEE
	str r3, [r1, #0x28]
	ldr r3, [r2, #8]
	bl _0828DDEE
	str r3, [r1, #0x2c]
	bx ip
	.align 2, 0
	thumb_func_end ply_voice

	thumb_func_start ply_vol
ply_vol: @ 0x0828DEF8
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x12]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0
	thumb_func_end ply_vol

	thumb_func_start ply_pan
ply_pan: @ 0x0828DF0C
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0x14]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip
	thumb_func_end ply_pan

	thumb_func_start ply_bend
ply_bend: @ 0x0828DF20
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0xe]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	thumb_func_end ply_bend

	thumb_func_start ply_bendr
ply_bendr: @ 0x0828DF34
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0xf]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0
	thumb_func_end ply_bendr

	thumb_func_start ply_lfodl
ply_lfodl: @ 0x0828DF48
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x1b]
	bx ip
	.align 2, 0
	thumb_func_end ply_lfodl

	thumb_func_start ply_modt
ply_modt: @ 0x0828DF54
	mov ip, lr
	bl ld_r3_tp_adr_i
	ldrb r0, [r1, #0x18]
	cmp r0, r3
	beq _0828DF6A
	strb r3, [r1, #0x18]
	ldrb r3, [r1]
	movs r2, #0xf
	orrs r3, r2
	strb r3, [r1]
_0828DF6A:
	bx ip
	thumb_func_end ply_modt

	thumb_func_start ply_tune
ply_tune: @ 0x0828DF6C
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0xc]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	thumb_func_end ply_tune

	thumb_func_start ply_port
ply_port: @ 0x0828DF80
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	ldr r0, _0828DF94
	adds r0, r0, r3
	bl sub_0828DE0A
	strb r3, [r0]
	bx ip
	.align 2, 0
_0828DF94: .4byte 0x04000060
	thumb_func_end ply_port

	thumb_func_start m4aSoundVSync
m4aSoundVSync: @ 0x0828DF98
	ldr r0, _0828E244
	ldr r0, [r0]
	ldr r2, _0828E248
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _0828DFD8
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _0828DFD8
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _0828DFDC
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _0828DFBE
	ldr r1, _0828DFE0
	str r1, [r2, #8]
_0828DFBE:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _0828DFC8
	ldr r1, _0828DFE0
	str r1, [r2, #0x14]
_0828DFC8:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_0828DFD8:
	bx lr
	.align 2, 0
_0828DFDC: .4byte 0x040000BC
_0828DFE0: .4byte 0x84400004
	thumb_func_end m4aSoundVSync

	thumb_func_start MPlayMain
MPlayMain: @ 0x0828DFE4
	ldr r2, _0828E248
	ldr r3, [r0, #0x34]
	cmp r2, r3
	beq _0828DFEE
	bx lr
_0828DFEE:
	adds r3, #1
	str r3, [r0, #0x34]
	push {r0, lr}
	ldr r3, [r0, #0x38]
	cmp r3, #0
	beq _0828E000
	ldr r0, [r0, #0x3c]
	bl sub_0828E23C
_0828E000:
	pop {r0}
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0828E018
	b _0828E22C
_0828E018:
	ldr r0, _0828E244
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, #0
	bl FadeOutBody
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0828E02C
	b _0828E22C
_0828E02C:
	ldrh r0, [r7, #0x22]
	ldrh r1, [r7, #0x20]
	adds r0, r0, r1
	b _0828E17C
_0828E034:
	ldrb r6, [r7, #8]
	ldr r5, [r7, #0x2c]
	movs r3, #1
	movs r4, #0
_0828E03C:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	bne _0828E046
	b _0828E158
_0828E046:
	mov sl, r3
	orrs r4, r3
	mov fp, r4
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0828E07A
_0828E052:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0828E06E
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _0828E074
	subs r0, #1
	strb r0, [r4, #0x10]
	bne _0828E074
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
	b _0828E074
_0828E06E:
	adds r0, r4, #0
	bl ClearChain
_0828E074:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0828E052
_0828E07A:
	ldrb r3, [r5]
	movs r0, #0x40
	tst r0, r3
	beq _0828E0F8
	adds r0, r5, #0
	bl Clear64byte
	movs r0, #0x80
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #0xf]
	movs r0, #0x40
	strb r0, [r5, #0x13]
	movs r0, #0x16
	strb r0, [r5, #0x19]
	movs r0, #1
	adds r1, r5, #6
	strb r0, [r1, #0x1e]
	b _0828E0F8
_0828E0A0:
	ldr r2, [r5, #0x40]
	ldrb r1, [r2]
	cmp r1, #0x80
	bhs _0828E0AC
	ldrb r1, [r5, #7]
	b _0828E0B6
_0828E0AC:
	adds r2, #1
	str r2, [r5, #0x40]
	cmp r1, #0xbd
	blo _0828E0B6
	strb r1, [r5, #7]
_0828E0B6:
	cmp r1, #0xcf
	blo _0828E0CC
	mov r0, r8
	ldr r3, [r0, #0x38]
	adds r0, r1, #0
	subs r0, #0xcf
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_0828E23C
	b _0828E0F8
_0828E0CC:
	cmp r1, #0xb0
	bls _0828E0EE
	adds r0, r1, #0
	subs r0, #0xb1
	strb r0, [r7, #0xa]
	mov r3, r8
	ldr r3, [r3, #0x34]
	lsls r0, r0, #2
	ldr r3, [r3, r0]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_0828E23C
	ldrb r0, [r5]
	cmp r0, #0
	beq _0828E154
	b _0828E0F8
_0828E0EE:
	ldr r0, _0828E240
	subs r1, #0x80
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r5, #1]
_0828E0F8:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0828E0A0
	subs r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	beq _0828E154
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _0828E154
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _0828E11A
	subs r0, #1
	strb r0, [r5, #0x1c]
	b _0828E154
_0828E11A:
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	adds r1, r0, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	bpl _0828E12E
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	b _0828E132
_0828E12E:
	movs r0, #0x80
	subs r2, r0, r1
_0828E132:
	ldrb r0, [r5, #0x17]
	muls r0, r2, r0
	asrs r2, r0, #6
	ldrb r0, [r5, #0x16]
	eors r0, r2
	lsls r0, r0, #0x18
	beq _0828E154
	strb r2, [r5, #0x16]
	ldrb r0, [r5]
	ldrb r1, [r5, #0x18]
	cmp r1, #0
	bne _0828E14E
	movs r1, #0xc
	b _0828E150
_0828E14E:
	movs r1, #3
_0828E150:
	orrs r0, r1
	strb r0, [r5]
_0828E154:
	mov r3, sl
	mov r4, fp
_0828E158:
	subs r6, #1
	ble _0828E164
	movs r0, #0x50
	adds r5, r5, r0
	lsls r3, r3, #1
	b _0828E03C
_0828E164:
	ldr r0, [r7, #0xc]
	adds r0, #1
	str r0, [r7, #0xc]
	cmp r4, #0
	bne _0828E176
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	b _0828E22C
_0828E176:
	str r4, [r7, #4]
	ldrh r0, [r7, #0x22]
	subs r0, #0x96
_0828E17C:
	strh r0, [r7, #0x22]
	cmp r0, #0x96
	blo _0828E184
	b _0828E034
_0828E184:
	ldrb r2, [r7, #8]
	ldr r5, [r7, #0x2c]
_0828E188:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	beq _0828E222
	movs r1, #0xf
	tst r1, r0
	beq _0828E222
	mov sb, r2
	adds r0, r7, #0
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0828E218
_0828E1A6:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	bne _0828E1B6
	adds r0, r4, #0
	bl ClearChain
	b _0828E212
_0828E1B6:
	ldrb r0, [r4, #1]
	movs r6, #7
	ands r6, r0
	ldrb r3, [r5]
	movs r0, #3
	tst r0, r3
	beq _0828E1D4
	bl ChnVolSetAsm
	cmp r6, #0
	beq _0828E1D4
	ldrb r0, [r4, #0x1d]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x1d]
_0828E1D4:
	ldrb r3, [r5]
	movs r0, #0xc
	tst r0, r3
	beq _0828E212
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r2, r1, r0
	bpl _0828E1E8
	movs r2, #0
_0828E1E8:
	cmp r6, #0
	beq _0828E206
	mov r0, r8
	ldr r3, [r0, #0x30]
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	adds r0, r6, #0
	bl sub_0828E23C
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x1d]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x1d]
	b _0828E212
_0828E206:
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	ldr r0, [r4, #0x24]
	bl MidiKeyToFreq
	str r0, [r4, #0x20]
_0828E212:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0828E1A6
_0828E218:
	ldrb r0, [r5]
	movs r1, #0xf0
	ands r0, r1
	strb r0, [r5]
	mov r2, sb
_0828E222:
	subs r2, #1
	ble _0828E22C
	movs r0, #0x50
	adds r5, r5, r0
	bgt _0828E188
_0828E22C:
	ldr r0, _0828E248
	str r0, [r7, #0x34]
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}
	thumb_func_end MPlayMain

	thumb_func_start sub_0828E23C
sub_0828E23C: @ 0x0828E23C
	bx r3
	.align 2, 0
_0828E240: .4byte gUnknown_85FD784
_0828E244: .4byte gUnknown_3007FF0
_0828E248: .4byte 0x68736D53
	thumb_func_end sub_0828E23C

	thumb_func_start TrackStop
TrackStop: @ 0x0828E24C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r1, [r5]
	movs r0, #0x80
	tst r0, r1
	beq _0828E284
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _0828E282
	movs r6, #0
_0828E260:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0828E27A
	ldrb r0, [r4, #1]
	movs r3, #7
	ands r0, r3
	beq _0828E278
	ldr r3, _0828E28C
	ldr r3, [r3]
	ldr r3, [r3, #0x2c]
	bl sub_0828E23C
_0828E278:
	strb r6, [r4]
_0828E27A:
	str r6, [r4, #0x2c]
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _0828E260
_0828E282:
	str r4, [r5, #0x20]
_0828E284:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0828E28C: .4byte gUnknown_3007FF0
	thumb_func_end TrackStop

	thumb_func_start ChnVolSetAsm
ChnVolSetAsm: @ 0x0828E290
	ldrb r1, [r4, #0x12]
	movs r0, #0x14
	ldrsb r2, [r4, r0]
	movs r3, #0x80
	adds r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x10]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _0828E2A8
	movs r0, #0xff
_0828E2A8:
	strb r0, [r4, #2]
	movs r3, #0x7f
	subs r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x11]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _0828E2BC
	movs r0, #0xff
_0828E2BC:
	strb r0, [r4, #3]
	bx lr
	thumb_func_end ChnVolSetAsm

	thumb_func_start ply_note
ply_note: @ 0x0828E2C0
	push {r4, r5, r6, r7, lr}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r1, [sp]
	adds r5, r2, #0
	ldr r1, _0828E4BC
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, _0828E4C0
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #4]
	ldr r3, [r5, #0x40]
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _0828E306
	strb r0, [r5, #5]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _0828E304
	strb r0, [r5, #6]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _0828E304
	ldrb r1, [r5, #4]
	adds r1, r1, r0
	strb r1, [r5, #4]
	adds r3, #1
_0828E304:
	str r3, [r5, #0x40]
_0828E306:
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	movs r0, #0xc0
	tst r0, r2
	beq _0828E358
	ldrb r3, [r5, #5]
	movs r0, #0x40
	tst r0, r2
	beq _0828E326
	ldr r1, [r5, #0x2c]
	adds r1, r1, r3
	ldrb r0, [r1]
	b _0828E328
_0828E326:
	adds r0, r3, #0
_0828E328:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x28]
	adds r1, r1, r0
	mov sb, r1
	mov r6, sb
	ldrb r1, [r6]
	movs r0, #0xc0
	tst r0, r1
	beq _0828E340
	b _0828E4AA
_0828E340:
	movs r0, #0x80
	tst r0, r2
	beq _0828E35C
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	beq _0828E354
	subs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp, #0x14]
_0828E354:
	ldrb r3, [r6, #1]
	b _0828E35C
_0828E358:
	mov sb, r4
	ldrb r3, [r5, #5]
_0828E35C:
	str r3, [sp, #8]
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	ldrb r0, [r5, #0x1d]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _0828E36C
	movs r0, #0xff
_0828E36C:
	str r0, [sp, #0x10]
	mov r6, sb
	ldrb r0, [r6]
	movs r6, #7
	ands r6, r0
	str r6, [sp, #0xc]
	beq _0828E3AC
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _0828E384
	b _0828E4AA
_0828E384:
	subs r6, #1
	lsls r0, r6, #6
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0828E400
	movs r0, #0x40
	tst r0, r1
	bne _0828E400
	ldrb r1, [r4, #0x13]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _0828E400
	beq _0828E3A4
	b _0828E4AA
_0828E3A4:
	ldr r0, [r4, #0x2c]
	cmp r0, r5
	bhs _0828E400
	b _0828E4AA
_0828E3AC:
	ldr r6, [sp, #0x10]
	adds r7, r5, #0
	movs r2, #0
	mov r8, r2
	ldr r4, [sp, #4]
	ldrb r3, [r4, #6]
	adds r4, #0x50
_0828E3BA:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _0828E400
	movs r0, #0x40
	tst r0, r1
	beq _0828E3D4
	cmp r2, #0
	bne _0828E3D8
	adds r2, #1
	ldrb r6, [r4, #0x13]
	ldr r7, [r4, #0x2c]
	b _0828E3F2
_0828E3D4:
	cmp r2, #0
	bne _0828E3F4
_0828E3D8:
	ldrb r0, [r4, #0x13]
	cmp r0, r6
	bhs _0828E3E4
	adds r6, r0, #0
	ldr r7, [r4, #0x2c]
	b _0828E3F2
_0828E3E4:
	bhi _0828E3F4
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bls _0828E3F0
	adds r7, r0, #0
	b _0828E3F2
_0828E3F0:
	blo _0828E3F4
_0828E3F2:
	mov r8, r4
_0828E3F4:
	adds r4, #0x40
	subs r3, #1
	bgt _0828E3BA
	mov r4, r8
	cmp r4, #0
	beq _0828E4AA
_0828E400:
	adds r0, r4, #0
	bl ClearChain
	movs r1, #0
	str r1, [r4, #0x30]
	ldr r3, [r5, #0x20]
	str r3, [r4, #0x34]
	cmp r3, #0
	beq _0828E414
	str r4, [r3, #0x30]
_0828E414:
	str r4, [r5, #0x20]
	str r5, [r4, #0x2c]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	cmp r0, r1
	beq _0828E426
	adds r1, r5, #0
	bl clear_modM
_0828E426:
	ldr r0, [sp]
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r0, [r5, #4]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x10]
	strb r0, [r4, #0x13]
	ldr r0, [sp, #8]
	strb r0, [r4, #8]
	ldr r0, [sp, #0x14]
	strb r0, [r4, #0x14]
	mov r6, sb
	ldrb r0, [r6]
	strb r0, [r4, #1]
	ldr r7, [r6, #4]
	str r7, [r4, #0x24]
	ldr r0, [r6, #8]
	str r0, [r4, #4]
	ldrh r0, [r5, #0x1e]
	strh r0, [r4, #0xc]
	bl ChnVolSetAsm
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _0828E460
	movs r3, #0
_0828E460:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	beq _0828E48E
	mov r6, sb
	ldrb r0, [r6, #2]
	strb r0, [r4, #0x1e]
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	bne _0828E47A
	movs r0, #0x70
	tst r0, r1
	bne _0828E47C
_0828E47A:
	movs r1, #8
_0828E47C:
	strb r1, [r4, #0x1f]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	ldr r3, [r3, #0x30]
	bl sub_0828E23C
	b _0828E49C
_0828E48E:
	ldr r0, [r5, #0x3c]
	str r0, [r4, #0x18]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	adds r0, r7, #0
	bl MidiKeyToFreq
_0828E49C:
	str r0, [r4, #0x20]
	movs r0, #0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	strb r0, [r5]
_0828E4AA:
	add sp, #0x18
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r0}
	bx r0
	.align 2, 0
_0828E4BC: .4byte gUnknown_3007FF0
_0828E4C0: .4byte gUnknown_85FD784
	thumb_func_end ply_note

	thumb_func_start ply_endtie
ply_endtie: @ 0x0828E4C4
	push {r4, r5}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0x80
	bhs _0828E4D6
	strb r3, [r1, #5]
	adds r2, #1
	str r2, [r1, #0x40]
	b _0828E4D8
_0828E4D6:
	ldrb r3, [r1, #5]
_0828E4D8:
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _0828E500
	movs r4, #0x83
	movs r5, #0x40
_0828E4E2:
	ldrb r2, [r1]
	tst r2, r4
	beq _0828E4FA
	tst r2, r5
	bne _0828E4FA
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _0828E4FA
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r1]
	b _0828E500
_0828E4FA:
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _0828E4E2
_0828E500:
	pop {r4, r5}
	bx lr
	thumb_func_end ply_endtie

	thumb_func_start clear_modM
clear_modM: @ 0x0828E504
	movs r2, #0
	strb r2, [r1, #0x16]
	strb r2, [r1, #0x1a]
	ldrb r2, [r1, #0x18]
	cmp r2, #0
	bne _0828E514
	movs r2, #0xc
	b _0828E516
_0828E514:
	movs r2, #3
_0828E516:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	.align 2, 0
	thumb_func_end clear_modM

	thumb_func_start sub_0828E520
sub_0828E520: @ 0x0828E520
	ldr r2, [r1, #0x40]
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	bx lr
	.align 2, 0
	thumb_func_end sub_0828E520

	thumb_func_start ply_lfos
ply_lfos: @ 0x0828E52C
	mov ip, lr
	bl sub_0828E520
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _0828E53C
	bl clear_modM
_0828E53C:
	bx ip
	.align 2, 0
	thumb_func_end ply_lfos

	thumb_func_start ply_mod
ply_mod: @ 0x0828E540
	mov ip, lr
	bl sub_0828E520
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _0828E550
	bl clear_modM
_0828E550:
	bx ip
	.align 2, 0
	thumb_func_end ply_mod

	thumb_func_start MidiKeyToFreq
MidiKeyToFreq: @ 0x0828E554
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r7, r2, #0x18
	cmp r6, #0xb2
	bls _0828E568
	movs r6, #0xb2
	movs r7, #0xff
	lsls r7, r7, #0x18
_0828E568:
	ldr r3, _0828E5B0
	adds r0, r6, r3
	ldrb r5, [r0]
	ldr r4, _0828E5B4
	movs r2, #0xf
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r5, #4
	ldr r5, [r0]
	lsrs r5, r1
	adds r0, r6, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r1, #4
	ldr r0, [r0]
	lsrs r0, r1
	mov r1, ip
	ldr r4, [r1, #4]
	subs r0, r0, r5
	adds r1, r7, #0
	bl umul3232H32
	adds r1, r0, #0
	adds r1, r5, r1
	adds r0, r4, #0
	bl umul3232H32
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0828E5B0: .4byte gUnknown_85FD5A0
_0828E5B4: .4byte gUnknown_85FD654
	thumb_func_end MidiKeyToFreq

	thumb_func_start UnusedDummyFunc
UnusedDummyFunc: @ 0x0828E5B8
	bx lr
	.align 2, 0
	thumb_func_end UnusedDummyFunc

	thumb_func_start MPlayContinue
MPlayContinue: @ 0x0828E5BC
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	ldr r0, _0828E5D0
	cmp r3, r0
	bne _0828E5CE
	ldr r0, [r2, #4]
	ldr r1, _0828E5D4
	ands r0, r1
	str r0, [r2, #4]
_0828E5CE:
	bx lr
	.align 2, 0
_0828E5D0: .4byte 0x68736D53
_0828E5D4: .4byte 0x7FFFFFFF
	thumb_func_end MPlayContinue

	thumb_func_start MPlayFadeOut
MPlayFadeOut: @ 0x0828E5D8
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _0828E5F4
	cmp r3, r0
	bne _0828E5F0
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x28]
_0828E5F0:
	bx lr
	.align 2, 0
_0828E5F4: .4byte 0x68736D53
	thumb_func_end MPlayFadeOut

	thumb_func_start m4aSoundInit
m4aSoundInit: @ 0x0828E5F8
	push {r4, r5, r6, lr}
	ldr r0, _0828E678
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0828E67C
	ldr r2, _0828E680
	bl CpuSet
	ldr r0, _0828E684
	bl SoundInit
	ldr r0, _0828E688
	bl MPlayExtender
	ldr r0, _0828E68C
	bl m4aSoundMode
	ldr r0, _0828E690
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0828E646
	ldr r6, _0828E694
	adds r5, r0, #0
_0828E62A:
	ldr r4, [r6]
	ldr r1, [r6, #4]
	ldrb r2, [r6, #8]
	adds r0, r4, #0
	bl MPlayOpen
	ldrh r0, [r6, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, _0828E698
	str r0, [r4, #0x18]
	adds r6, #0xc
	subs r5, #1
	cmp r5, #0
	bne _0828E62A
_0828E646:
	ldr r0, _0828E69C
	ldr r1, _0828E6A0
	movs r2, #0x34
	bl memcpy
	movs r5, #0
	movs r6, #0
_0828E654:
	lsls r0, r5, #6
	ldr r1, _0828E6A4
	adds r0, r0, r1
	ldr r4, _0828E6A8
	adds r4, r6, r4
	adds r1, r4, #0
	movs r2, #2
	bl MPlayOpen
	movs r0, #0
	str r0, [r4, #0x20]
	adds r6, #0xa0
	adds r5, #1
	cmp r5, #1
	ble _0828E654
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0828E678: .4byte SoundMainRAM
_0828E67C: .4byte gUnknown_3001B50
_0828E680: .4byte 0x04000200
_0828E684: .4byte gUnknown_3006120
_0828E688: .4byte gUnknown_3007250
_0828E68C: .4byte 0x0094C500
_0828E690: .4byte 0x00000004
_0828E694: .4byte gUnknown_863C27C
_0828E698: .4byte gUnknown_3007590
_0828E69C: .4byte gUnknown_3007490
_0828E6A0: .4byte gUnknown_85FD7B8
_0828E6A4: .4byte gUnknown_3007140
_0828E6A8: .4byte gUnknown_3007350
	thumb_func_end m4aSoundInit

	thumb_func_start m4aSoundMain
m4aSoundMain: @ 0x0828E6AC
	push {lr}
	bl SoundMain
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end m4aSoundMain

	thumb_func_start m4aSongNumStart
m4aSongNumStart: @ 0x0828E6B8
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0828E6DC
	ldr r1, _0828E6E0
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl MPlayStart
	pop {r0}
	bx r0
	.align 2, 0
_0828E6DC: .4byte gUnknown_863C27C
_0828E6E0: .4byte gUnknown_863C2AC
	thumb_func_end m4aSongNumStart

	thumb_func_start m4aSongNumStartOrChange
m4aSongNumStartOrChange: @ 0x0828E6E4
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0828E710
	ldr r1, _0828E714
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _0828E718
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart
	b _0828E72C
	.align 2, 0
_0828E710: .4byte gUnknown_863C27C
_0828E714: .4byte gUnknown_863C2AC
_0828E718:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _0828E724
	cmp r2, #0
	bge _0828E72C
_0828E724:
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart
_0828E72C:
	pop {r0}
	bx r0
	thumb_func_end m4aSongNumStartOrChange

	thumb_func_start m4aSongNumStartOrContinue
m4aSongNumStartOrContinue: @ 0x0828E730
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0828E75C
	ldr r1, _0828E760
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _0828E764
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart
	b _0828E780
	.align 2, 0
_0828E75C: .4byte gUnknown_863C27C
_0828E760: .4byte gUnknown_863C2AC
_0828E764:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _0828E776
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart
	b _0828E780
_0828E776:
	cmp r2, #0
	bge _0828E780
	adds r0, r1, #0
	bl MPlayContinue
_0828E780:
	pop {r0}
	bx r0
	thumb_func_end m4aSongNumStartOrContinue

	thumb_func_start m4aSongNumStop
m4aSongNumStop: @ 0x0828E784
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0828E7B0
	ldr r1, _0828E7B4
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _0828E7AA
	adds r0, r2, #0
	bl m4aMPlayStop
_0828E7AA:
	pop {r0}
	bx r0
	.align 2, 0
_0828E7B0: .4byte gUnknown_863C27C
_0828E7B4: .4byte gUnknown_863C2AC
	thumb_func_end m4aSongNumStop

	thumb_func_start m4aSongNumContinue
m4aSongNumContinue: @ 0x0828E7B8
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0828E7E4
	ldr r1, _0828E7E8
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _0828E7DE
	adds r0, r2, #0
	bl MPlayContinue
_0828E7DE:
	pop {r0}
	bx r0
	.align 2, 0
_0828E7E4: .4byte gUnknown_863C27C
_0828E7E8: .4byte gUnknown_863C2AC
	thumb_func_end m4aSongNumContinue

	thumb_func_start m4aMPlayAllStop
m4aMPlayAllStop: @ 0x0828E7EC
	push {r4, r5, lr}
	ldr r0, _0828E824
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0828E80A
	ldr r5, _0828E828
	adds r4, r0, #0
_0828E7FC:
	ldr r0, [r5]
	bl m4aMPlayStop
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _0828E7FC
_0828E80A:
	ldr r5, _0828E82C
	movs r4, #1
_0828E80E:
	adds r0, r5, #0
	bl m4aMPlayStop
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0828E80E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0828E824: .4byte 0x00000004
_0828E828: .4byte gUnknown_863C27C
_0828E82C: .4byte gUnknown_3007140
	thumb_func_end m4aMPlayAllStop

	thumb_func_start m4aMPlayContinue
m4aMPlayContinue: @ 0x0828E830
	push {lr}
	bl MPlayContinue
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end m4aMPlayContinue

	thumb_func_start m4aMPlayAllContinue
m4aMPlayAllContinue: @ 0x0828E83C
	push {r4, r5, lr}
	ldr r0, _0828E874
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0828E85A
	ldr r5, _0828E878
	adds r4, r0, #0
_0828E84C:
	ldr r0, [r5]
	bl MPlayContinue
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _0828E84C
_0828E85A:
	ldr r5, _0828E87C
	movs r4, #1
_0828E85E:
	adds r0, r5, #0
	bl MPlayContinue
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0828E85E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0828E874: .4byte 0x00000004
_0828E878: .4byte gUnknown_863C27C
_0828E87C: .4byte gUnknown_3007140
	thumb_func_end m4aMPlayAllContinue

	thumb_func_start m4aMPlayFadeOut
m4aMPlayFadeOut: @ 0x0828E880
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl MPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end m4aMPlayFadeOut

	thumb_func_start m4aMPlayFadeOutTemporarily
m4aMPlayFadeOutTemporarily: @ 0x0828E890
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _0828E8A8
	cmp r3, r0
	bne _0828E8A6
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r0, _0828E8AC
	strh r0, [r2, #0x28]
_0828E8A6:
	bx lr
	.align 2, 0
_0828E8A8: .4byte 0x68736D53
_0828E8AC: .4byte 0x00000101
	thumb_func_end m4aMPlayFadeOutTemporarily

	thumb_func_start m4aMPlayFadeIn
m4aMPlayFadeIn: @ 0x0828E8B0
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _0828E8D0
	cmp r3, r0
	bne _0828E8CE
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #2
	strh r0, [r2, #0x28]
	ldr r0, [r2, #4]
	ldr r1, _0828E8D4
	ands r0, r1
	str r0, [r2, #4]
_0828E8CE:
	bx lr
	.align 2, 0
_0828E8D0: .4byte 0x68736D53
_0828E8D4: .4byte 0x7FFFFFFF
	thumb_func_end m4aMPlayFadeIn

	thumb_func_start m4aMPlayImmInit
m4aMPlayImmInit: @ 0x0828E8D8
	push {r4, r5, r6, r7, lr}
	ldrb r5, [r0, #8]
	ldr r4, [r0, #0x2c]
	cmp r5, #0
	ble _0828E91A
	movs r7, #0x80
_0828E8E4:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0828E912
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0828E912
	adds r0, r4, #0
	bl Clear64byte
	strb r7, [r4]
	movs r0, #2
	strb r0, [r4, #0xf]
	strb r6, [r4, #0x13]
	movs r0, #0x16
	strb r0, [r4, #0x19]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0828E912:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _0828E8E4
_0828E91A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end m4aMPlayImmInit

	thumb_func_start MPlayExtender
MPlayExtender: @ 0x0828E920
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0828E9E8
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _0828E9EC
	movs r2, #0
	strh r2, [r3]
	ldr r0, _0828E9F0
	movs r1, #8
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0x14
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0xd
	strb r2, [r0]
	movs r0, #0x77
	strb r0, [r3]
	ldr r0, _0828E9F4
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _0828E9F8
	cmp r6, r0
	bne _0828E9E0
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _0828E9FC
	ldr r0, _0828EA00
	str r0, [r1, #0x20]
	ldr r0, _0828EA04
	str r0, [r1, #0x44]
	ldr r0, _0828EA08
	str r0, [r1, #0x4c]
	ldr r0, _0828EA0C
	str r0, [r1, #0x70]
	ldr r0, _0828EA10
	str r0, [r1, #0x74]
	ldr r0, _0828EA14
	str r0, [r1, #0x78]
	ldr r0, _0828EA18
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _0828EA1C
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _0828EA20
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _0828EA24
	str r0, [r4, #0x28]
	ldr r0, _0828EA28
	str r0, [r4, #0x2c]
	ldr r0, _0828EA2C
	str r0, [r4, #0x30]
	ldr r0, _0828EA30
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _0828EA34
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #1
	strb r0, [r5, #1]
	movs r0, #0x11
	strb r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #2
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x44
	strb r0, [r1]
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x88
	strb r0, [r1, #0x1c]
	str r6, [r4]
_0828E9E0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0828E9E8: .4byte 0x04000084
_0828E9EC: .4byte 0x04000080
_0828E9F0: .4byte 0x04000063
_0828E9F4: .4byte gUnknown_3007FF0
_0828E9F8: .4byte 0x68736D53
_0828E9FC: .4byte gUnknown_30071C0
_0828EA00: .4byte ply_memacc
_0828EA04: .4byte ply_lfos
_0828EA08: .4byte ply_mod
_0828EA0C: .4byte ply_xcmd
_0828EA10: .4byte ply_endtie
_0828EA14: .4byte SampleFreqSet
_0828EA18: .4byte TrackStop
_0828EA1C: .4byte FadeOutBody
_0828EA20: .4byte TrkVolPitSet
_0828EA24: .4byte CgbSound
_0828EA28: .4byte CgbOscOff
_0828EA2C: .4byte MidiKeyToCgbFreq
_0828EA30: .4byte 0x00000000
_0828EA34: .4byte 0x05000040
	thumb_func_end MPlayExtender

	thumb_func_start MusicPlayerJumpTableCopy
MusicPlayerJumpTableCopy: @ 0x0828EA38
	svc #0x2a
	bx lr
	thumb_func_end MusicPlayerJumpTableCopy

	thumb_func_start ClearChain
ClearChain: @ 0x0828EA3C
	push {lr}
	ldr r1, _0828EA4C
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0828EA4C: .4byte gUnknown_3007248
	thumb_func_end ClearChain

	thumb_func_start Clear64byte
Clear64byte: @ 0x0828EA50
	push {lr}
	ldr r1, _0828EA60
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0828EA60: .4byte gUnknown_300724C
	thumb_func_end Clear64byte

	thumb_func_start SoundInit
SoundInit: @ 0x0828EA64
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _0828EB1C
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _0828EA80
	ldr r0, _0828EB20
	str r0, [r1]
_0828EA80:
	ldr r1, _0828EB24
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0828EA8E
	ldr r0, _0828EB20
	str r0, [r1]
_0828EA8E:
	ldr r0, _0828EB28
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _0828EB2C
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _0828EB30
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0828EB34
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0828EB38
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _0828EB3C
	str r0, [r1]
	adds r1, #8
	movs r2, #0x98
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _0828EB40
	str r0, [r1]
	ldr r0, _0828EB44
	str r5, [r0]
	str r3, [sp]
	ldr r2, _0828EB48
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _0828EB4C
	str r0, [r5, #0x38]
	ldr r0, _0828EB50
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _0828EB54
	adds r0, r4, #0
	bl MPlayJumpTableCopy
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl SampleFreqSet
	ldr r0, _0828EB58
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0828EB1C: .4byte 0x040000C4
_0828EB20: .4byte 0x84400004
_0828EB24: .4byte 0x040000D0
_0828EB28: .4byte 0x040000C6
_0828EB2C: .4byte 0x04000084
_0828EB30: .4byte 0x0000A90E
_0828EB34: .4byte 0x04000089
_0828EB38: .4byte 0x040000BC
_0828EB3C: .4byte 0x040000A0
_0828EB40: .4byte 0x040000A4
_0828EB44: .4byte gUnknown_3007FF0
_0828EB48: .4byte 0x050003EC
_0828EB4C: .4byte ply_note
_0828EB50: .4byte DummyFunc
_0828EB54: .4byte gUnknown_30071C0
_0828EB58: .4byte 0x68736D53
	thumb_func_end SoundInit

	thumb_func_start SampleFreqSet
SampleFreqSet: @ 0x0828EB5C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _0828EBDC
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _0828EBE0
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r1, r5, #0
	bl __divsi3
	strb r0, [r4, #0xb]
	ldr r0, _0828EBE4
	muls r0, r5, r0
	ldr r1, _0828EBE8
	adds r0, r0, r1
	ldr r1, _0828EBEC
	bl __divsi3
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl __divsi3
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _0828EBF0
	strh r6, [r0]
	ldr r4, _0828EBF4
	ldr r0, _0828EBF8
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4]
	bl m4aSoundVSyncOn
	ldr r1, _0828EBFC
_0828EBC0:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _0828EBC0
	ldr r1, _0828EBFC
_0828EBC8:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _0828EBC8
	ldr r1, _0828EBF0
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0828EBDC: .4byte gUnknown_3007FF0
_0828EBE0: .4byte gUnknown_85FD684
_0828EBE4: .4byte 0x00091D1B
_0828EBE8: .4byte 0x00001388
_0828EBEC: .4byte 0x00002710
_0828EBF0: .4byte 0x04000102
_0828EBF4: .4byte 0x04000100
_0828EBF8: .4byte 0x00044940
_0828EBFC: .4byte 0x04000006
	thumb_func_end SampleFreqSet

	thumb_func_start m4aSoundMode
m4aSoundMode: @ 0x0828EC00
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _0828EC8C
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _0828EC90
	cmp r1, r0
	bne _0828EC86
	adds r0, r1, #1
	str r0, [r5]
	movs r4, #0xff
	ands r4, r3
	cmp r4, #0
	beq _0828EC22
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r5, #5]
_0828EC22:
	movs r4, #0xf0
	lsls r4, r4, #4
	ands r4, r3
	cmp r4, #0
	beq _0828EC42
	lsrs r0, r4, #8
	strb r0, [r5, #6]
	movs r4, #0xc
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
_0828EC38:
	strb r1, [r0]
	subs r4, #1
	adds r0, #0x40
	cmp r4, #0
	bne _0828EC38
_0828EC42:
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r4, r3
	cmp r4, #0
	beq _0828EC50
	lsrs r0, r4, #0xc
	strb r0, [r5, #7]
_0828EC50:
	movs r4, #0xb0
	lsls r4, r4, #0x10
	ands r4, r3
	cmp r4, #0
	beq _0828EC6E
	movs r0, #0xc0
	lsls r0, r0, #0xe
	ands r0, r4
	lsrs r4, r0, #0xe
	ldr r2, _0828EC94
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_0828EC6E:
	movs r4, #0xf0
	lsls r4, r4, #0xc
	ands r4, r3
	cmp r4, #0
	beq _0828EC82
	bl m4aSoundVSyncOff
	adds r0, r4, #0
	bl SampleFreqSet
_0828EC82:
	ldr r0, _0828EC90
	str r0, [r5]
_0828EC86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0828EC8C: .4byte gUnknown_3007FF0
_0828EC90: .4byte 0x68736D53
_0828EC94: .4byte 0x04000089
	thumb_func_end m4aSoundMode

	thumb_func_start SoundClear
SoundClear: @ 0x0828EC98
	push {r4, r5, r6, r7, lr}
	ldr r0, _0828ECE4
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _0828ECE8
	cmp r1, r0
	bne _0828ECDE
	adds r0, r1, #1
	str r0, [r6]
	movs r5, #0xc
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
_0828ECB2:
	strb r0, [r4]
	subs r5, #1
	adds r4, #0x40
	cmp r5, #0
	bgt _0828ECB2
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	beq _0828ECDA
	movs r5, #1
	movs r7, #0
_0828ECC6:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6, #0x2c]
	bl _call_via_r1
	strb r7, [r4]
	adds r5, #1
	adds r4, #0x40
	cmp r5, #4
	ble _0828ECC6
_0828ECDA:
	ldr r0, _0828ECE8
	str r0, [r6]
_0828ECDE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0828ECE4: .4byte gUnknown_3007FF0
_0828ECE8: .4byte 0x68736D53
	thumb_func_end SoundClear

	thumb_func_start m4aSoundVSyncOff
m4aSoundVSyncOff: @ 0x0828ECEC
	push {lr}
	sub sp, #4
	ldr r0, _0828ED4C
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _0828ED50
	adds r0, r1, r3
	cmp r0, #1
	bhi _0828ED44
	adds r0, r1, #0
	adds r0, #0xa
	str r0, [r2]
	ldr r1, _0828ED54
	ldr r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x12
	ands r0, r3
	cmp r0, #0
	beq _0828ED16
	ldr r0, _0828ED58
	str r0, [r1]
_0828ED16:
	ldr r1, _0828ED5C
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _0828ED24
	ldr r0, _0828ED58
	str r0, [r1]
_0828ED24:
	ldr r0, _0828ED60
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r2, _0828ED64
	mov r0, sp
	bl CpuSet
_0828ED44:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0828ED4C: .4byte gUnknown_3007FF0
_0828ED50: .4byte 0x978C92AD
_0828ED54: .4byte 0x040000C4
_0828ED58: .4byte 0x84400004
_0828ED5C: .4byte 0x040000D0
_0828ED60: .4byte 0x040000C6
_0828ED64: .4byte 0x05000318
	thumb_func_end m4aSoundVSyncOff

	thumb_func_start m4aSoundVSyncOn
m4aSoundVSyncOn: @ 0x0828ED68
	push {r4, lr}
	ldr r0, _0828ED98
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _0828ED9C
	cmp r3, r0
	beq _0828ED90
	ldr r0, _0828EDA0
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r1, r4, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldrb r0, [r2, #4]
	movs r0, #0
	strb r0, [r2, #4]
	adds r0, r3, #0
	subs r0, #0xa
	str r0, [r2]
_0828ED90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0828ED98: .4byte gUnknown_3007FF0
_0828ED9C: .4byte 0x68736D53
_0828EDA0: .4byte 0x040000C6
	thumb_func_end m4aSoundVSyncOn

	thumb_func_start MPlayOpen
MPlayOpen: @ 0x0828EDA4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _0828EE08
	cmp r4, #0x10
	bls _0828EDB8
	movs r4, #0x10
_0828EDB8:
	ldr r0, _0828EE10
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _0828EE14
	cmp r1, r0
	bne _0828EE08
	adds r0, r1, #1
	str r0, [r5]
	adds r0, r7, #0
	bl Clear64byte
	str r6, [r7, #0x2c]
	strb r4, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	cmp r4, #0
	beq _0828EDEC
	movs r1, #0
_0828EDDE:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _0828EDDE
_0828EDEC:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _0828EDFC
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_0828EDFC:
	str r7, [r5, #0x24]
	ldr r0, _0828EE18
	str r0, [r5, #0x20]
	ldr r0, _0828EE14
	str r0, [r5]
	str r0, [r7, #0x34]
_0828EE08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0828EE10: .4byte gUnknown_3007FF0
_0828EE14: .4byte 0x68736D53
_0828EE18: .4byte MPlayMain
	thumb_func_end MPlayOpen

	thumb_func_start MPlayStart
MPlayStart: @ 0x0828EE1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _0828EEFC
	cmp r1, r0
	bne _0828EEF2
	ldrb r0, [r5, #0xb]
	ldrb r2, [r7, #2]
	cmp r0, #0
	beq _0828EE5E
	ldr r0, [r5]
	cmp r0, #0
	beq _0828EE48
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0828EE54
_0828EE48:
	ldr r1, [r5, #4]
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _0828EE5E
	cmp r1, #0
	blt _0828EE5E
_0828EE54:
	ldrb r0, [r7, #2]
	adds r2, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, r2
	bhi _0828EEF2
_0828EE5E:
	ldr r0, [r5, #0x34]
	adds r0, #1
	str r0, [r5, #0x34]
	movs r1, #0
	str r1, [r5, #4]
	str r7, [r5]
	ldr r0, [r7, #4]
	str r0, [r5, #0x30]
	strb r2, [r5, #9]
	str r1, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0x1c]
	strh r0, [r5, #0x20]
	adds r0, #0x6a
	strh r0, [r5, #0x1e]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r6, #0
	ldr r4, [r5, #0x2c]
	ldrb r1, [r7]
	cmp r6, r1
	bge _0828EEBE
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _0828EEDE
	mov r8, r6
_0828EE92:
	adds r0, r5, #0
	adds r1, r4, #0
	bl TrackStop
	movs r0, #0xc0
	strb r0, [r4]
	mov r1, r8
	str r1, [r4, #0x20]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x40]
	adds r6, #1
	adds r4, #0x50
	ldrb r0, [r7]
	cmp r6, r0
	bge _0828EEBE
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _0828EE92
_0828EEBE:
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _0828EEDE
	movs r1, #0
	mov r8, r1
_0828EEC8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl TrackStop
	mov r0, r8
	strb r0, [r4]
	adds r6, #1
	adds r4, #0x50
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _0828EEC8
_0828EEDE:
	movs r0, #0x80
	ldrb r1, [r7, #3]
	ands r0, r1
	cmp r0, #0
	beq _0828EEEE
	ldrb r0, [r7, #3]
	bl m4aSoundMode
_0828EEEE:
	ldr r0, _0828EEFC
	str r0, [r5, #0x34]
_0828EEF2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0828EEFC: .4byte 0x68736D53
	thumb_func_end MPlayStart

	thumb_func_start m4aMPlayStop
m4aMPlayStop: @ 0x0828EF00
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x34]
	ldr r0, _0828EF3C
	cmp r1, r0
	bne _0828EF36
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r6, #4]
	ldrb r4, [r6, #8]
	ldr r5, [r6, #0x2c]
	cmp r4, #0
	ble _0828EF32
_0828EF22:
	adds r0, r6, #0
	adds r1, r5, #0
	bl TrackStop
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _0828EF22
_0828EF32:
	ldr r0, _0828EF3C
	str r0, [r6, #0x34]
_0828EF36:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0828EF3C: .4byte 0x68736D53
	thumb_func_end m4aMPlayStop

	thumb_func_start FadeOutBody
FadeOutBody: @ 0x0828EF40
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x24]
	cmp r1, #0
	beq _0828F002
	ldrh r0, [r6, #0x26]
	subs r0, #1
	strh r0, [r6, #0x26]
	ldr r3, _0828EF80
	adds r2, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0828F002
	strh r1, [r6, #0x26]
	ldrh r1, [r6, #0x28]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0828EF84
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	cmp r0, #0xff
	bls _0828EFD6
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x28]
	strh r3, [r6, #0x24]
	b _0828EFD6
	.align 2, 0
_0828EF80: .4byte 0x0000FFFF
_0828EF84:
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0828EFD6
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _0828EFB6
_0828EF9A:
	adds r0, r6, #0
	adds r1, r4, #0
	bl TrackStop
	movs r0, #1
	ldrh r7, [r6, #0x28]
	ands r0, r7
	cmp r0, #0
	bne _0828EFAE
	strb r0, [r4]
_0828EFAE:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _0828EF9A
_0828EFB6:
	movs r0, #1
	ldrh r1, [r6, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _0828EFCA
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	b _0828EFCE
_0828EFCA:
	movs r0, #0x80
	lsls r0, r0, #0x18
_0828EFCE:
	str r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #0x24]
	b _0828F002
_0828EFD6:
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _0828F002
	movs r3, #0x80
	movs r7, #0
	movs r2, #3
_0828EFE4:
	ldrb r1, [r4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0828EFFA
	ldrh r7, [r6, #0x28]
	lsrs r0, r7, #2
	strb r0, [r4, #0x13]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r4]
_0828EFFA:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _0828EFE4
_0828F002:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end FadeOutBody

	thumb_func_start TrkVolPitSet
TrkVolPitSet: @ 0x0828F008
	push {r4, lr}
	adds r2, r1, #0
	movs r0, #1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0828F06C
	ldrb r3, [r2, #0x13]
	ldrb r1, [r2, #0x12]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r3, r0, #5
	ldrb r4, [r2, #0x18]
	cmp r4, #1
	bne _0828F030
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r3, r0, #7
_0828F030:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	movs r1, #0x15
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	cmp r4, #2
	bne _0828F046
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
_0828F046:
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0828F052
	adds r1, r0, #0
	b _0828F058
_0828F052:
	cmp r1, #0x7f
	ble _0828F058
	movs r1, #0x7f
_0828F058:
	adds r0, r1, #0
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x10]
	movs r0, #0x7f
	subs r0, r0, r1
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x11]
_0828F06C:
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _0828F0B0
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, #0xf]
	muls r0, r1, r0
	movs r1, #0xc
	ldrsb r1, [r2, r1]
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #0xd]
	adds r1, r0, r1
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _0828F0AA
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	adds r1, r1, r0
_0828F0AA:
	asrs r0, r1, #8
	strb r0, [r2, #8]
	strb r1, [r2, #9]
_0828F0B0:
	movs r0, #0xfa
	ands r0, r3
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TrkVolPitSet

	thumb_func_start MidiKeyToCgbFreq
MidiKeyToCgbFreq: @ 0x0828F0BC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _0828F0F4
	cmp r5, #0x14
	bhi _0828F0D8
	movs r5, #0
	b _0828F0E6
_0828F0D8:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _0828F0E6
	movs r5, #0x3b
_0828F0E6:
	ldr r0, _0828F0F0
	adds r0, r5, r0
	ldrb r0, [r0]
	b _0828F156
	.align 2, 0
_0828F0F0: .4byte gUnknown_85FD738
_0828F0F4:
	cmp r5, #0x23
	bhi _0828F100
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _0828F112
_0828F100:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _0828F112
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_0828F112:
	ldr r3, _0828F15C
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _0828F160
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	asrs r0, r6, #4
	adds r6, r1, #0
	asrs r6, r0
	adds r0, r5, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #4
	asrs r0, r1
	subs r0, r0, r6
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	adds r0, r6, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
_0828F156:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0828F15C: .4byte gUnknown_85FD69C
_0828F160: .4byte gUnknown_85FD720
	thumb_func_end MidiKeyToCgbFreq

	thumb_func_start CgbOscOff
CgbOscOff: @ 0x0828F164
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _0828F18C
	cmp r0, #2
	bgt _0828F178
	cmp r0, #1
	beq _0828F17E
	b _0828F1A0
_0828F178:
	cmp r1, #3
	beq _0828F194
	b _0828F1A0
_0828F17E:
	ldr r1, _0828F188
	movs r0, #8
	strb r0, [r1]
	adds r1, #2
	b _0828F1A8
	.align 2, 0
_0828F188: .4byte 0x04000063
_0828F18C:
	ldr r1, _0828F190
	b _0828F1A2
	.align 2, 0
_0828F190: .4byte 0x04000069
_0828F194:
	ldr r1, _0828F19C
	movs r0, #0
	b _0828F1AA
	.align 2, 0
_0828F19C: .4byte 0x04000070
_0828F1A0:
	ldr r1, _0828F1B0
_0828F1A2:
	movs r0, #8
	strb r0, [r1]
	adds r1, #4
_0828F1A8:
	movs r0, #0x80
_0828F1AA:
	strb r0, [r1]
	bx lr
	.align 2, 0
_0828F1B0: .4byte 0x04000079
	thumb_func_end CgbOscOff

	thumb_func_start CgbModVol
CgbModVol: @ 0x0828F1B4
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _0828F1E4
	ldr r1, [r0]
	movs r0, #1
	ldrb r1, [r1, #9]
	ands r0, r1
	cmp r0, #0
	bne _0828F1F4
	ldrb r0, [r2, #2]
	lsls r1, r0, #0x18
	lsrs r4, r1, #0x18
	ldrb r3, [r2, #3]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r4, r3
	blo _0828F1E8
	lsrs r0, r1, #0x19
	cmp r0, r3
	blo _0828F1F4
	movs r0, #0xf
	strb r0, [r2, #0x1b]
	b _0828F202
	.align 2, 0
_0828F1E4: .4byte gUnknown_3007FF0
_0828F1E8:
	lsrs r0, r0, #0x19
	cmp r0, r4
	blo _0828F1F4
	movs r0, #0xf0
	strb r0, [r2, #0x1b]
	b _0828F202
_0828F1F4:
	movs r0, #0xff
	strb r0, [r2, #0x1b]
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	adds r0, r1, r3
	lsrs r0, r0, #4
	b _0828F212
_0828F202:
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	adds r0, r1, r3
	lsrs r0, r0, #4
	strb r0, [r2, #0xa]
	cmp r0, #0xf
	bls _0828F214
	movs r0, #0xf
_0828F212:
	strb r0, [r2, #0xa]
_0828F214:
	ldrb r1, [r2, #6]
	ldrb r3, [r2, #0xa]
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, #0xf
	asrs r0, r0, #4
	strb r0, [r2, #0x19]
	ldrb r0, [r2, #0x1c]
	ldrb r1, [r2, #0x1b]
	ands r0, r1
	strb r0, [r2, #0x1b]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CgbModVol

	thumb_func_start CgbSound
CgbSound: @ 0x0828F230
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0828F250
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _0828F254
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _0828F25A
	.align 2, 0
_0828F250: .4byte gUnknown_3007FF0
_0828F254:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_0828F25A:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_0828F260:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _0828F276
	b _0828F660
_0828F276:
	cmp r6, #2
	beq _0828F2A8
	cmp r6, #2
	bgt _0828F284
	cmp r6, #1
	beq _0828F28A
	b _0828F2E0
_0828F284:
	cmp r6, #3
	beq _0828F2C0
	b _0828F2E0
_0828F28A:
	ldr r0, _0828F29C
	str r0, [sp, #8]
	ldr r7, _0828F2A0
	ldr r2, _0828F2A4
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _0828F2F0
	.align 2, 0
_0828F29C: .4byte 0x04000060
_0828F2A0: .4byte 0x04000062
_0828F2A4: .4byte 0x04000063
_0828F2A8:
	ldr r0, _0828F2B4
	str r0, [sp, #8]
	ldr r7, _0828F2B8
	ldr r2, _0828F2BC
	b _0828F2E8
	.align 2, 0
_0828F2B4: .4byte 0x04000061
_0828F2B8: .4byte 0x04000068
_0828F2BC: .4byte 0x04000069
_0828F2C0:
	ldr r0, _0828F2D4
	str r0, [sp, #8]
	ldr r7, _0828F2D8
	ldr r2, _0828F2DC
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _0828F2F0
	.align 2, 0
_0828F2D4: .4byte 0x04000070
_0828F2D8: .4byte 0x04000072
_0828F2DC: .4byte 0x04000073
_0828F2E0:
	ldr r0, _0828F340
	str r0, [sp, #8]
	ldr r7, _0828F344
	ldr r2, _0828F348
_0828F2E8:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_0828F2F0:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0828F3E6
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _0828F40A
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl CgbModVol
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _0828F358
	cmp r6, #2
	bgt _0828F34C
	cmp r6, #1
	beq _0828F352
	b _0828F3AC
	.align 2, 0
_0828F340: .4byte 0x04000071
_0828F344: .4byte 0x04000078
_0828F348: .4byte 0x04000079
_0828F34C:
	cmp r6, #3
	beq _0828F364
	b _0828F3AC
_0828F352:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_0828F358:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _0828F3B8
_0828F364:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _0828F38C
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _0828F3A0
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_0828F38C:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _0828F3A4
	movs r0, #0xc0
	b _0828F3C6
	.align 2, 0
_0828F3A0: .4byte 0x04000090
_0828F3A4:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _0828F3C8
_0828F3AC:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_0828F3B8:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _0828F3C6
	movs r0, #0x40
_0828F3C6:
	strb r0, [r4, #0x1a]
_0828F3C8:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _0828F3E2
	b _0828F51E
_0828F3E2:
	strb r2, [r4, #9]
	b _0828F54C
_0828F3E6:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0828F418
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _0828F40A
	b _0828F55E
_0828F40A:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl CgbOscOff
	movs r0, #0
	strb r0, [r4]
	b _0828F65C
_0828F418:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _0828F458
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0828F458
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _0828F48A
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _0828F54C
	ldrb r2, [r4, #7]
	mov r8, r2
	b _0828F54C
_0828F458:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0828F54C
	cmp r6, #3
	bne _0828F46A
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_0828F46A:
	adds r0, r4, #0
	bl CgbModVol
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _0828F4BE
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0828F4BA
_0828F48A:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0828F40A
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _0828F55E
	movs r2, #8
	mov r8, r2
	b _0828F55E
_0828F4BA:
	ldrb r0, [r4, #7]
	b _0828F54A
_0828F4BE:
	cmp r0, #1
	bne _0828F4CA
_0828F4C2:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _0828F54A
_0828F4CA:
	cmp r0, #2
	bne _0828F50E
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _0828F50A
_0828F4E2:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0828F4F2
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _0828F48A
_0828F4F2:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _0828F4C2
	movs r0, #8
	mov r8, r0
	b _0828F4C2
_0828F50A:
	ldrb r0, [r4, #5]
	b _0828F54A
_0828F50E:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _0828F548
_0828F51E:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _0828F4E2
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _0828F54C
	ldrb r2, [r4, #5]
	mov r8, r2
	b _0828F54C
_0828F548:
	ldrb r0, [r4, #4]
_0828F54A:
	strb r0, [r4, #0xb]
_0828F54C:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _0828F55E
	subs r0, #1
	str r0, [sp]
	b _0828F458
_0828F55E:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _0828F5D6
	cmp r6, #3
	bgt _0828F59E
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _0828F59E
	ldr r0, _0828F588
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _0828F590
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _0828F58C
	b _0828F59A
	.align 2, 0
_0828F588: .4byte 0x04000089
_0828F58C: .4byte 0x000007FC
_0828F590:
	cmp r0, #0x7f
	bgt _0828F59E
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _0828F5AC
_0828F59A:
	ands r0, r1
	str r0, [r4, #0x20]
_0828F59E:
	cmp r6, #4
	beq _0828F5B0
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _0828F5BE
	.align 2, 0
_0828F5AC: .4byte 0x000007FE
_0828F5B0:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_0828F5BE:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_0828F5D6:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _0828F65C
	ldr r1, _0828F620
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _0828F628
	ldr r0, _0828F624
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _0828F65C
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _0828F65C
	.align 2, 0
_0828F620: .4byte 0x04000081
_0828F624: .4byte gUnknown_85FD774
_0828F628:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _0828F65C
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0828F65C
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_0828F65C:
	movs r0, #0
	strb r0, [r4, #0x1d]
_0828F660:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _0828F66A
	b _0828F260
_0828F66A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CgbSound

	thumb_func_start m4aMPlayTempoControl
m4aMPlayTempoControl: @ 0x0828F67C
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _0828F6A0
	cmp r3, r0
	bne _0828F698
	strh r1, [r2, #0x1e]
	ldrh r4, [r2, #0x1c]
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x20]
_0828F698:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0828F6A0: .4byte 0x68736D53
	thumb_func_end m4aMPlayTempoControl

	thumb_func_start m4aMPlayVolumeControl
m4aMPlayVolumeControl: @ 0x0828F6A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _0828F708
	cmp r3, r0
	bne _0828F6FC
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _0828F6F8
	movs r0, #0x80
	mov r8, r0
	lsrs r6, r6, #0x12
	movs r0, #3
	mov ip, r0
_0828F6D4:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _0828F6EE
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _0828F6EE
	strb r6, [r1, #0x13]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_0828F6EE:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _0828F6D4
_0828F6F8:
	ldr r0, _0828F708
	str r0, [r4, #0x34]
_0828F6FC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0828F708: .4byte 0x68736D53
	thumb_func_end m4aMPlayVolumeControl

	thumb_func_start m4aMPlayPitchControl
m4aMPlayPitchControl: @ 0x0828F70C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _0828F77C
	cmp r3, r0
	bne _0828F76E
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r3, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _0828F76A
	movs r0, #0x80
	mov sb, r0
	lsls r0, r6, #0x10
	asrs r7, r0, #0x18
	movs r0, #0xc
	mov r8, r0
_0828F744:
	mov r0, ip
	ands r0, r5
	cmp r0, #0
	beq _0828F760
	ldrb r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _0828F760
	strb r7, [r3, #0xb]
	strb r6, [r3, #0xd]
	mov r0, r8
	orrs r0, r1
	strb r0, [r3]
_0828F760:
	subs r2, #1
	adds r3, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _0828F744
_0828F76A:
	ldr r0, _0828F77C
	str r0, [r4, #0x34]
_0828F76E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0828F77C: .4byte 0x68736D53
	thumb_func_end m4aMPlayPitchControl

	thumb_func_start m4aMPlayPanpotControl
m4aMPlayPanpotControl: @ 0x0828F780
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r3, [r4, #0x34]
	ldr r0, _0828F7E4
	cmp r3, r0
	bne _0828F7D8
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _0828F7D4
	movs r0, #0x80
	mov r8, r0
	movs r0, #3
	mov ip, r0
_0828F7B0:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _0828F7CA
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _0828F7CA
	strb r6, [r1, #0x15]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_0828F7CA:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _0828F7B0
_0828F7D4:
	ldr r0, _0828F7E4
	str r0, [r4, #0x34]
_0828F7D8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0828F7E4: .4byte 0x68736D53
	thumb_func_end m4aMPlayPanpotControl

	thumb_func_start ClearModM
ClearModM: @ 0x0828F7E8
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _0828F7FC
	movs r0, #0xc
	b _0828F7FE
_0828F7FC:
	movs r0, #3
_0828F7FE:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
	thumb_func_end ClearModM

	thumb_func_start m4aMPlayModDepthSet
m4aMPlayModDepthSet: @ 0x0828F808
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _0828F878
	cmp r1, r0
	bne _0828F868
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _0828F864
	mov sb, r8
_0828F838:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _0828F85A
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0828F85A
	mov r0, r8
	strb r0, [r4, #0x17]
	mov r1, sb
	cmp r1, #0
	bne _0828F85A
	adds r0, r4, #0
	bl ClearModM
_0828F85A:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _0828F838
_0828F864:
	ldr r0, _0828F878
	str r0, [r6, #0x34]
_0828F868:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0828F878: .4byte 0x68736D53
	thumb_func_end m4aMPlayModDepthSet

	thumb_func_start m4aMPlayLFOSpeedSet
m4aMPlayLFOSpeedSet: @ 0x0828F87C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _0828F8EC
	cmp r1, r0
	bne _0828F8DC
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _0828F8D8
	mov sb, r8
_0828F8AC:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _0828F8CE
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0828F8CE
	mov r0, r8
	strb r0, [r4, #0x19]
	mov r1, sb
	cmp r1, #0
	bne _0828F8CE
	adds r0, r4, #0
	bl ClearModM
_0828F8CE:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _0828F8AC
_0828F8D8:
	ldr r0, _0828F8EC
	str r0, [r6, #0x34]
_0828F8DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0828F8EC: .4byte 0x68736D53
	thumb_func_end m4aMPlayLFOSpeedSet

	thumb_func_start ply_memacc
ply_memacc: @ 0x0828F8F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r6, #0x40]
	ldrb r5, [r1]
	adds r2, r1, #1
	str r2, [r6, #0x40]
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, #1]
	adds r3, r1, r0
	adds r0, r2, #1
	str r0, [r6, #0x40]
	ldrb r2, [r2, #1]
	adds r0, #1
	str r0, [r6, #0x40]
	cmp r5, #0x11
	bls _0828F914
	b _0828FA42
_0828F914:
	lsls r0, r5, #2
	ldr r1, _0828F920
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0828F920: .4byte _0828F924
_0828F924: @ jump table
	.4byte _0828F96C @ case 0
	.4byte _0828F970 @ case 1
	.4byte _0828F978 @ case 2
	.4byte _0828F980 @ case 3
	.4byte _0828F98A @ case 4
	.4byte _0828F998 @ case 5
	.4byte _0828F9A6 @ case 6
	.4byte _0828F9AE @ case 7
	.4byte _0828F9B6 @ case 8
	.4byte _0828F9BE @ case 9
	.4byte _0828F9C6 @ case 10
	.4byte _0828F9CE @ case 11
	.4byte _0828F9D6 @ case 12
	.4byte _0828F9E4 @ case 13
	.4byte _0828F9F2 @ case 14
	.4byte _0828FA00 @ case 15
	.4byte _0828FA0E @ case 16
	.4byte _0828FA1C @ case 17
_0828F96C:
	strb r2, [r3]
	b _0828FA42
_0828F970:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _0828FA42
_0828F978:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _0828FA42
_0828F980:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _0828FA42
_0828F98A:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _0828FA42
_0828F998:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _0828FA42
_0828F9A6:
	ldrb r3, [r3]
	cmp r3, r2
	beq _0828FA28
	b _0828FA3C
_0828F9AE:
	ldrb r3, [r3]
	cmp r3, r2
	bne _0828FA28
	b _0828FA3C
_0828F9B6:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _0828FA28
	b _0828FA3C
_0828F9BE:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _0828FA28
	b _0828FA3C
_0828F9C6:
	ldrb r3, [r3]
	cmp r3, r2
	bls _0828FA28
	b _0828FA3C
_0828F9CE:
	ldrb r3, [r3]
	cmp r3, r2
	blo _0828FA28
	b _0828FA3C
_0828F9D6:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _0828FA28
	b _0828FA3C
_0828F9E4:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _0828FA28
	b _0828FA3C
_0828F9F2:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _0828FA28
	b _0828FA3C
_0828FA00:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0828FA28
	b _0828FA3C
_0828FA0E:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _0828FA28
	b _0828FA3C
_0828FA1C:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0828FA3C
_0828FA28:
	ldr r0, _0828FA38
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r2
	b _0828FA42
	.align 2, 0
_0828FA38: .4byte gUnknown_30071C4
_0828FA3C:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_0828FA42:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end ply_memacc

	thumb_func_start ply_xcmd
ply_xcmd: @ 0x0828FA48
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _0828FA64
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0828FA64: .4byte gUnknown_85FD7EC
	thumb_func_end ply_xcmd

	thumb_func_start ply_xxx
ply_xxx: @ 0x0828FA68
	push {lr}
	ldr r2, _0828FA78
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0828FA78: .4byte gUnknown_30071C0
	thumb_func_end ply_xxx

	thumb_func_start ply_xwave
ply_xwave: @ 0x0828FA7C
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _0828FAB4
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _0828FAB8
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _0828FABC
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _0828FAC0
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x28]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0828FAB4: .4byte 0xFFFFFF00
_0828FAB8: .4byte 0xFFFF00FF
_0828FABC: .4byte 0xFF00FFFF
_0828FAC0: .4byte 0x00FFFFFF
	thumb_func_end ply_xwave

	thumb_func_start ply_xtype
ply_xtype: @ 0x0828FAC4
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x24
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ply_xtype

	thumb_func_start ply_xatta
ply_xatta: @ 0x0828FAD8
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ply_xatta

	thumb_func_start ply_xdeca
ply_xdeca: @ 0x0828FAEC
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2d
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ply_xdeca

	thumb_func_start ply_xsust
ply_xsust: @ 0x0828FB00
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2e
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ply_xsust

	thumb_func_start ply_xrele
ply_xrele: @ 0x0828FB14
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ply_xrele

	thumb_func_start ply_xiecv
ply_xiecv: @ 0x0828FB28
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1e]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	thumb_func_end ply_xiecv

	thumb_func_start ply_xiecl
ply_xiecl: @ 0x0828FB34
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	thumb_func_end ply_xiecl

	thumb_func_start ply_xleng
ply_xleng: @ 0x0828FB40
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x26
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ply_xleng

	thumb_func_start ply_xswee
ply_xswee: @ 0x0828FB54
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x27
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ply_xswee

	thumb_func_start ply_xcmd_0C
ply_xcmd_0C: @ 0x0828FB68
	push {r4, lr}
	adds r3, r1, #0
	ldr r4, [r3, #0x40]
	ldr r0, _0828FB98
	ands r2, r0
	ldrb r0, [r4]
	orrs r2, r0
	ldrb r0, [r4, #1]
	lsls r1, r0, #8
	ldr r0, _0828FB9C
	ands r2, r0
	orrs r2, r1
	ldrh r1, [r3, #0x3a]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhs _0828FBA0
	adds r0, r1, #1
	strh r0, [r3, #0x3a]
	subs r0, r4, #2
	str r0, [r3, #0x40]
	movs r0, #1
	strb r0, [r3, #1]
	b _0828FBA8
	.align 2, 0
_0828FB98: .4byte 0xFFFFFF00
_0828FB9C: .4byte 0xFFFF00FF
_0828FBA0:
	movs r0, #0
	strh r0, [r3, #0x3a]
	adds r0, r4, #2
	str r0, [r3, #0x40]
_0828FBA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ply_xcmd_0C

	thumb_func_start ply_xcmd_0D
ply_xcmd_0D: @ 0x0828FBB0
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _0828FBE8
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _0828FBEC
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _0828FBF0
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _0828FBF4
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x3c]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0828FBE8: .4byte 0xFFFFFF00
_0828FBEC: .4byte 0xFFFF00FF
_0828FBF0: .4byte 0xFF00FFFF
_0828FBF4: .4byte 0x00FFFFFF
	thumb_func_end ply_xcmd_0D

	thumb_func_start DummyFunc
DummyFunc: @ 0x0828FBF8
	bx lr
	.align 2, 0
	thumb_func_end DummyFunc

	thumb_func_start SetPokemonCryTone
SetPokemonCryTone: @ 0x0828FBFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r6, #0
	movs r1, #0
	movs r4, #0
	ldr r0, _0828FCB8
	mov r8, r0
	ldr r7, _0828FCBC
	ldr r0, _0828FCC0
	mov sl, r0
	mov r5, r8
	adds r5, #0xc
	movs r3, #0
	ldr r0, _0828FCC4
	mov ip, r0
_0828FC22:
	mov r0, ip
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, #0
	bne _0828FC38
	ldr r0, [r2, #0x20]
	cmp r0, #0
	beq _0828FC4E
	ldr r0, [r0, #0x2c]
	cmp r0, r2
	bne _0828FC4E
_0828FC38:
	ldr r0, [r5]
	cmp r6, r0
	bhs _0828FC42
	adds r6, r0, #0
	adds r1, r4, #0
_0828FC42:
	adds r5, #0x40
	adds r3, #0xa0
	adds r4, #1
	cmp r4, #1
	ble _0828FC22
	adds r4, r1, #0
_0828FC4E:
	lsls r5, r4, #6
	add r5, r8
	ldr r0, [r5, #0x34]
	adds r0, #1
	str r0, [r5, #0x34]
	movs r0, #0x34
	muls r4, r0, r4
	adds r6, r4, r7
	adds r0, r6, #0
	mov r1, sl
	movs r2, #0x34
	bl memcpy
	adds r0, r7, #4
	adds r0, r4, r0
	mov r1, sb
	str r1, [r0]
	adds r1, r7, #0
	adds r1, #8
	adds r1, r4, r1
	adds r0, r7, #0
	adds r0, #0x11
	adds r0, r4, r0
	str r0, [r1]
	adds r1, r7, #0
	adds r1, #0xc
	adds r1, r4, r1
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r4, r0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x14
	adds r0, r4, r0
	adds r1, r7, #0
	adds r1, #0x1a
	adds r4, r4, r1
	str r4, [r0]
	ldr r0, _0828FCC8
	str r0, [r5, #0x34]
	adds r0, r5, #0
	adds r1, r6, #0
	bl MPlayStart
	adds r0, r5, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0828FCB8: .4byte gUnknown_3007140
_0828FCBC: .4byte gUnknown_30070D0
_0828FCC0: .4byte gUnknown_3007490
_0828FCC4: .4byte gUnknown_3007350
_0828FCC8: .4byte 0x68736D53
	thumb_func_end SetPokemonCryTone

	thumb_func_start SetPokemonCryVolume
SetPokemonCryVolume: @ 0x0828FCCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0828FCDC
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #0x1d]
	bx lr
	.align 2, 0
_0828FCDC: .4byte gUnknown_3007490
	thumb_func_end SetPokemonCryVolume

	thumb_func_start SetPokemonCryPanpot
SetPokemonCryPanpot: @ 0x0828FCE0
	ldr r2, _0828FCF4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x40
	movs r1, #0x7f
	ands r0, r1
	adds r2, #0x28
	strb r0, [r2]
	bx lr
	.align 2, 0
_0828FCF4: .4byte gUnknown_3007490
	thumb_func_end SetPokemonCryPanpot

	thumb_func_start SetPokemonCryPitch
SetPokemonCryPitch: @ 0x0828FCF8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r3, _0828FD2C
	ldrb r2, [r3, #0x19]
	ldrb r4, [r3, #0x12]
	subs r1, r2, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r6, #0x80
	lsls r6, r6, #0x10
	adds r0, r0, r6
	asrs r2, r0, #0x18
	movs r5, #0x7f
	movs r4, #0x7f
	ands r2, r4
	movs r6, #0x2a
	strb r2, [r6, r3]
	asrs r0, r0, #0x11
	ands r0, r4
	strb r0, [r3, #0x12]
	adds r1, r1, r0
	ands r1, r5
	strb r1, [r3, #0x19]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0828FD2C: .4byte gUnknown_3007490
	thumb_func_end SetPokemonCryPitch

	thumb_func_start SetPokemonCryLength
SetPokemonCryLength: @ 0x0828FD30
	ldr r1, _0828FD38
	strh r0, [r1, #0x2e]
	bx lr
	.align 2, 0
_0828FD38: .4byte gUnknown_3007490
	thumb_func_end SetPokemonCryLength

	thumb_func_start SetPokemonCryRelease
SetPokemonCryRelease: @ 0x0828FD3C
	ldr r1, _0828FD44
	adds r1, #0x26
	strb r0, [r1]
	bx lr
	.align 2, 0
_0828FD44: .4byte gUnknown_3007490
	thumb_func_end SetPokemonCryRelease

	thumb_func_start SetPokemonCryProgress
SetPokemonCryProgress: @ 0x0828FD48
	ldr r1, _0828FD50
	str r0, [r1, #0x20]
	bx lr
	.align 2, 0
_0828FD50: .4byte gUnknown_3007490
	thumb_func_end SetPokemonCryProgress

	thumb_func_start IsPokemonCryPlaying
IsPokemonCryPlaying: @ 0x0828FD54
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _0828FD66
	ldr r0, [r0, #0x2c]
	cmp r0, r1
	bne _0828FD66
	movs r0, #1
	b _0828FD68
_0828FD66:
	movs r0, #0
_0828FD68:
	bx lr
	.align 2, 0
	thumb_func_end IsPokemonCryPlaying

	thumb_func_start SetPokemonCryChorus
SetPokemonCryChorus: @ 0x0828FD6C
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	beq _0828FD8C
	ldr r2, _0828FD88
	movs r0, #2
	strb r0, [r2]
	ldrb r3, [r2, #0x12]
	adds r0, r3, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #0x19]
	b _0828FD92
	.align 2, 0
_0828FD88: .4byte gUnknown_3007490
_0828FD8C:
	ldr r1, _0828FD94
	movs r0, #1
	strb r0, [r1]
_0828FD92:
	bx lr
	.align 2, 0
_0828FD94: .4byte gUnknown_3007490
	thumb_func_end SetPokemonCryChorus

	thumb_func_start SetPokemonCryStereo
SetPokemonCryStereo: @ 0x0828FD98
	ldr r1, _0828FDB0
	ldr r2, [r1]
	cmp r0, #0
	beq _0828FDBC
	ldr r1, _0828FDB4
	ldr r3, _0828FDB8
	adds r0, r3, #0
	strh r0, [r1]
	movs r0, #0xfe
	ldrb r1, [r2, #9]
	ands r0, r1
	b _0828FDCA
	.align 2, 0
_0828FDB0: .4byte gUnknown_3007FF0
_0828FDB4: .4byte 0x04000082
_0828FDB8: .4byte 0x0000210E
_0828FDBC:
	ldr r1, _0828FDD0
	ldr r3, _0828FDD4
	adds r0, r3, #0
	strh r0, [r1]
	movs r0, #1
	ldrb r1, [r2, #9]
	orrs r0, r1
_0828FDCA:
	strb r0, [r2, #9]
	bx lr
	.align 2, 0
_0828FDD0: .4byte 0x04000082
_0828FDD4: .4byte 0x00003302
	thumb_func_end SetPokemonCryStereo

	thumb_func_start SetPokemonCryPriority
SetPokemonCryPriority: @ 0x0828FDD8
	ldr r1, _0828FDE0
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0828FDE0: .4byte gUnknown_3007490
	thumb_func_end SetPokemonCryPriority
