.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_081D43D0
sub_081D43D0: @ 0x081D43D0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov r1, sp
	ldr r4, _081D4424
	ldrh r0, [r4]
	strh r0, [r1]
	movs r0, #0
	strh r0, [r4]
	ldr r1, _081D4428
	ldr r0, _081D442C
	str r0, [r1, #4]
	ldr r0, _081D4430
	str r0, [r1, #8]
	bl sub_081D3820
	bl sub_081D38B8
	ldr r2, _081D4434
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4]
	movs r0, #0
	strh r0, [r5]
	str r6, [r5, #4]
	mov r0, r8
	str r0, [r5, #8]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D4424: .4byte 0x04000208
_081D4428: .4byte 0x030027B0
_081D442C: .4byte 0x081D362D
_081D4430: .4byte 0x081D361D
_081D4434: .4byte 0x04000200
	thumb_func_end sub_081D43D0

	thumb_func_start sub_081D4438
sub_081D4438: @ 0x081D4438
	push {r4, lr}
	sub sp, #4
	mov r1, sp
	ldr r4, _081D4464
	ldrh r0, [r4]
	strh r0, [r1]
	movs r0, #0
	strh r0, [r4]
	bl sub_081D38B8
	bl sub_081D3874
	bl RestoreSerialTimer3IntrHandlers
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D4464: .4byte 0x04000208
	thumb_func_end sub_081D4438

	thumb_func_start sub_081D4468
sub_081D4468: @ 0x081D4468
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	movs r0, #1
	movs r3, #0
	bl sub_081D33F0
	adds r1, r0, #0
	strh r1, [r4]
	movs r0, #0x13
	ands r0, r1
	cmp r0, #0x10
	bne _081D4488
	movs r5, #1
_081D4488:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _081D4492
	movs r5, #2
_081D4492:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _081D449C
	movs r5, #3
_081D449C:
	ldr r1, _081D44AC
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081D44AC: .4byte 0x030031E4
	thumb_func_end sub_081D4468

	thumb_func_start sub_081D44B0
sub_081D44B0: @ 0x081D44B0
	push {lr}
	ldr r0, _081D44D4
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	bl memset
	ldr r1, _081D44D8
	ldr r2, _081D44DC
	adds r0, r2, #0
	strh r0, [r1]
	bl OpenLink
	movs r0, #1
	bl SetSuppressLinkErrorMessage
	pop {r0}
	bx r0
	.align 2, 0
_081D44D4: .4byte 0x0201C000
_081D44D8: .4byte 0x0202267E
_081D44DC: .4byte 0x00005503
	thumb_func_end sub_081D44B0

	thumb_func_start sub_081D44E0
sub_081D44E0: @ 0x081D44E0
	push {lr}
	sub sp, #0xc
	mov r1, sp
	ldr r2, _081D4524
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0
	strh r0, [r2]
	ldr r0, _081D4528
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r2]
	add r2, sp, #4
	ldrh r1, [r2]
	ldr r0, _081D452C
	cmp r1, r0
	bne _081D4538
	ldrh r1, [r2, #2]
	ldr r0, _081D4530
	cmp r1, r0
	bne _081D4538
	ldrh r1, [r2, #4]
	ldr r0, _081D4534
	cmp r1, r0
	bne _081D4538
	ldrh r0, [r2, #6]
	cmp r0, r1
	bne _081D4538
	movs r0, #1
	b _081D453A
	.align 2, 0
_081D4524: .4byte 0x04000208
_081D4528: .4byte 0x03003214
_081D452C: .4byte 0x0000B9A0
_081D4530: .4byte 0x0000CCD0
_081D4534: .4byte 0x0000FFFF
_081D4538:
	movs r0, #0
_081D453A:
	add sp, #0xc
	pop {r1}
	bx r1
	thumb_func_end sub_081D44E0

	thumb_func_start sub_081D4540
sub_081D4540: @ 0x081D4540
	push {lr}
	bl IsLinkMaster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D455C
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _081D455C
	movs r0, #1
	b _081D455E
_081D455C:
	movs r0, #0
_081D455E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081D4540

	thumb_func_start sub_081D4564
sub_081D4564: @ 0x081D4564
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4]
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _081D4588
	bl HasLinkErrorOccurred
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D4588
	movs r0, #0
	strb r0, [r4]
	movs r0, #3
	b _081D468E
_081D4588:
	ldrb r0, [r4]
	cmp r0, #5
	bls _081D4590
	b _081D468C
_081D4590:
	lsls r0, r0, #2
	ldr r1, _081D459C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D459C: .4byte 0x081D45A0
_081D45A0: @ jump table
	.4byte _081D45B8 @ case 0
	.4byte _081D45D4 @ case 1
	.4byte _081D45EC @ case 2
	.4byte _081D4620 @ case 3
	.4byte _081D466C @ case 4
	.4byte _081D4678 @ case 5
_081D45B8:
	bl IsLinkMaster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D4608
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _081D4608
	movs r0, #1
	strb r0, [r4]
	b _081D468C
_081D45D4:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bls _081D468C
	movs r0, #0
	strh r0, [r5]
	movs r0, #2
	strb r0, [r4]
	b _081D468C
_081D45EC:
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _081D4608
	movs r0, #0x49
	bl PlaySE
	bl CheckShouldAdvanceLinkState
	movs r0, #0
	strh r0, [r5]
	b _081D4666
_081D4608:
	ldr r0, _081D461C
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081D468C
	movs r0, #0
	strb r0, [r4]
	movs r0, #1
	b _081D468E
	.align 2, 0
_081D461C: .4byte 0x03002360
_081D4620:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bls _081D4636
	movs r0, #0
	strb r0, [r4]
	movs r0, #5
	b _081D468E
_081D4636:
	bl IsLinkConnectionEstablished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D468C
	ldr r0, _081D465C
	ldrb r0, [r0]
	cmp r0, #0
	beq _081D4666
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D4660
	movs r0, #0
	strb r0, [r4]
	movs r0, #2
	b _081D468E
	.align 2, 0
_081D465C: .4byte 0x030031C4
_081D4660:
	movs r0, #4
	strb r0, [r4]
	b _081D468C
_081D4666:
	movs r0, #3
	strb r0, [r4]
	b _081D468C
_081D466C:
	movs r0, #0
	bl sub_0800A7B8
	movs r0, #5
	strb r0, [r4]
	b _081D468C
_081D4678:
	ldr r0, _081D4688
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D468C
	strb r0, [r4]
	movs r0, #4
	b _081D468E
	.align 2, 0
_081D4688: .4byte 0x030031C4
_081D468C:
	movs r0, #0
_081D468E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_081D4564

	thumb_func_start task_add_00_ereader
task_add_00_ereader: @ 0x081D4694
	push {r4, lr}
	ldr r0, _081D46D4
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	ldr r0, _081D46D8
	adds r4, r4, r0
	movs r0, #0
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	movs r1, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strb r1, [r4, #0xe]
	movs r0, #0x40
	bl AllocZeroed
	str r0, [r4, #0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D46D4: .4byte 0x081D4705
_081D46D8: .4byte 0x03005B68
	thumb_func_end task_add_00_ereader

	thumb_func_start sub_081D46DC
sub_081D46DC: @ 0x081D46DC
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end sub_081D46DC

	thumb_func_start sub_081D46E4
sub_081D46E4: @ 0x081D46E4
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, r1
	bhi _081D46FA
	movs r0, #0
	b _081D4700
_081D46FA:
	movs r0, #0
	strh r0, [r2]
	movs r0, #1
_081D4700:
	pop {r1}
	bx r1
	thumb_func_end sub_081D46E4

	thumb_func_start sub_081D4704
sub_081D4704: @ 0x081D4704
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081D4728
	adds r4, r0, r1
	ldrb r0, [r4, #8]
	cmp r0, #0x1a
	bls _081D471C
	b _081D4B0A
_081D471C:
	lsls r0, r0, #2
	ldr r1, _081D472C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D4728: .4byte 0x03005B68
_081D472C: .4byte 0x081D4730
_081D4730: @ jump table
	.4byte _081D479C @ case 0
	.4byte _081D47B8 @ case 1
	.4byte _081D47C8 @ case 2
	.4byte _081D47DC @ case 3
	.4byte _081D47EC @ case 4
	.4byte _081D4818 @ case 5
	.4byte _081D4850 @ case 6
	.4byte _081D48CC @ case 7
	.4byte _081D48E8 @ case 8
	.4byte _081D4910 @ case 9
	.4byte _081D492C @ case 10
	.4byte _081D495C @ case 11
	.4byte _081D4972 @ case 12
	.4byte _081D4988 @ case 13
	.4byte _081D49EA @ case 14
	.4byte _081D4A10 @ case 15
	.4byte _081D4A28 @ case 16
	.4byte _081D4A46 @ case 17
	.4byte _081D4A72 @ case 18
	.4byte _081D4A98 @ case 19
	.4byte _081D4AC8 @ case 20
	.4byte _081D4AD4 @ case 21
	.4byte _081D4AE0 @ case 22
	.4byte _081D4AB0 @ case 23
	.4byte _081D4B0A @ case 24
	.4byte _081D4B0A @ case 25
	.4byte _081D4AF8 @ case 26
_081D479C:
	adds r0, r4, #0
	adds r0, #9
	ldr r1, _081D47B4
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	bne _081D47AC
	b _081D4B0A
_081D47AC:
	movs r0, #1
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D47B4: .4byte 0x085CCEEC
_081D47B8:
	bl sub_081D44B0
	adds r0, r4, #0
	bl sub_081D46DC
	movs r0, #2
	strb r0, [r4, #8]
	b _081D4B0A
_081D47C8:
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_081D46E4
	cmp r0, #0
	bne _081D47D6
	b _081D4B0A
_081D47D6:
	movs r0, #3
	strb r0, [r4, #8]
	b _081D4B0A
_081D47DC:
	bl sub_081D4540
	cmp r0, #0
	beq _081D47E6
	b _081D497C
_081D47E6:
	bl CloseLink
	b _081D48DC
_081D47EC:
	adds r0, r4, #0
	adds r0, #9
	ldr r1, _081D4810
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	bne _081D47FC
	b _081D4B0A
_081D47FC:
	ldr r0, _081D4814
	bl AddTextPrinterToWindow1
	adds r0, r4, #0
	bl sub_081D46DC
	movs r0, #5
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4810: .4byte 0x085CCF0B
_081D4814: .4byte 0x085CCF2A
_081D4818:
	adds r0, r4, #0
	movs r1, #0x5a
	bl sub_081D46E4
	cmp r0, #0
	beq _081D482E
	bl sub_081D44B0
	movs r0, #6
	strb r0, [r4, #8]
	b _081D4B0A
_081D482E:
	ldr r0, _081D484C
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081D483C
	b _081D4B0A
_081D483C:
	adds r0, r4, #0
	bl sub_081D46DC
	movs r0, #5
	bl PlaySE
	b _081D49DA
	.align 2, 0
_081D484C: .4byte 0x03002360
_081D4850:
	ldr r0, _081D4870
	ldrh r1, [r0, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _081D4874
	movs r0, #5
	bl PlaySE
	bl CloseLink
	adds r0, r4, #0
	bl sub_081D46DC
	b _081D49DA
	.align 2, 0
_081D4870: .4byte 0x03002360
_081D4874:
	bl GetLinkPlayerCount_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _081D4890
	adds r0, r4, #0
	bl sub_081D46DC
	bl CloseLink
	movs r0, #7
	strb r0, [r4, #8]
	b _081D4B0A
_081D4890:
	bl sub_081D44E0
	cmp r0, #0
	beq _081D48AE
	movs r0, #5
	bl PlaySE
	bl CloseLink
	adds r0, r4, #0
	bl sub_081D46DC
	movs r0, #8
	strb r0, [r4, #8]
	b _081D4B0A
_081D48AE:
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_081D46E4
	cmp r0, #0
	bne _081D48BC
	b _081D4B0A
_081D48BC:
	bl CloseLink
	bl sub_081D44B0
	adds r0, r4, #0
	bl sub_081D46DC
	b _081D4B0A
_081D48CC:
	adds r0, r4, #0
	adds r0, #9
	ldr r1, _081D48E4
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	bne _081D48DC
	b _081D4B0A
_081D48DC:
	movs r0, #4
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D48E4: .4byte 0x085CCF72
_081D48E8:
	ldr r0, _081D4900
	bl AddTextPrinterToWindow1
	ldr r0, _081D4904
	ldr r1, _081D4908
	ldr r2, _081D490C
	subs r1, r1, r2
	bl sub_081D43D0
	movs r0, #9
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4900: .4byte 0x085CCFAD
_081D4904: .4byte 0x03006110
_081D4908: .4byte 0x08912454
_081D490C: .4byte 0x0890F374
_081D4910:
	ldr r0, _081D4928
	bl sub_081D4468
	strb r0, [r4, #0xe]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D4920
	b _081D4B0A
_081D4920:
	movs r0, #0xa
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4928: .4byte 0x03006110
_081D492C:
	ldr r0, _081D4954
	bl sub_081D4438
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	bne _081D493A
	b _081D4A40
_081D493A:
	cmp r0, #1
	beq _081D4940
	b _081D4AEE
_081D4940:
	adds r0, r4, #0
	bl sub_081D46DC
	ldr r0, _081D4958
	bl AddTextPrinterToWindow1
	movs r0, #0xb
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4954: .4byte 0x03006110
_081D4958: .4byte 0x085CD036
_081D495C:
	movs r1, #0xd2
	lsls r1, r1, #2
	adds r0, r4, #0
	bl sub_081D46E4
	cmp r0, #0
	bne _081D496C
	b _081D4B0A
_081D496C:
	movs r0, #0xc
	strb r0, [r4, #8]
	b _081D4B0A
_081D4972:
	bl sub_081D44B0
	ldr r0, _081D4984
	bl AddTextPrinterToWindow1
_081D497C:
	movs r0, #0xd
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4984: .4byte 0x085CCFF2
_081D4988:
	adds r0, r4, #0
	adds r0, #9
	adds r1, r4, #0
	bl sub_081D4564
	cmp r0, #5
	bls _081D4998
	b _081D4B0A
_081D4998:
	lsls r0, r0, #2
	ldr r1, _081D49A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D49A4: .4byte 0x081D49A8
_081D49A8: @ jump table
	.4byte _081D4B0A @ case 0
	.4byte _081D49D0 @ case 1
	.4byte _081D49C0 @ case 2
	.4byte _081D49F4 @ case 3
	.4byte _081D49F4 @ case 4
	.4byte _081D49E0 @ case 5
_081D49C0:
	ldr r0, _081D49CC
	bl AddTextPrinterToWindow1
	movs r0, #0xe
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D49CC: .4byte 0x085CCFAD
_081D49D0:
	movs r0, #5
	bl PlaySE
	bl CloseLink
_081D49DA:
	movs r0, #0x17
	strb r0, [r4, #8]
	b _081D4B0A
_081D49E0:
	bl CloseLink
	movs r0, #0x15
	strb r0, [r4, #8]
	b _081D4B0A
_081D49EA:
	bl HasLinkErrorOccurred
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D49FA
_081D49F4:
	bl CloseLink
	b _081D4A40
_081D49FA:
	bl GetBlockReceivedStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D4A06
	b _081D4B0A
_081D4A06:
	bl ResetBlockReceivedFlags
	movs r0, #0xf
	strb r0, [r4, #8]
	b _081D4B0A
_081D4A10:
	ldr r0, _081D4A24
	bl EReader_IsReceivedDataValid
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xe]
	bl sub_0800A7B8
	movs r0, #0x10
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4A24: .4byte 0x0201C000
_081D4A28:
	ldr r0, _081D4A3C
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D4B0A
	ldrb r0, [r4, #0xe]
	cmp r0, #1
	bne _081D4A40
	movs r0, #0x11
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4A3C: .4byte 0x030031C4
_081D4A40:
	movs r0, #0x14
	strb r0, [r4, #8]
	b _081D4B0A
_081D4A46:
	ldr r0, _081D4A64
	bl TryWriteTrainerHill
	cmp r0, #0
	beq _081D4A6C
	ldr r0, _081D4A68
	bl AddTextPrinterToWindow1
	adds r0, r4, #0
	bl sub_081D46DC
	movs r0, #0x12
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4A64: .4byte 0x0201C000
_081D4A68: .4byte 0x085CD010
_081D4A6C:
	movs r0, #0x16
	strb r0, [r4, #8]
	b _081D4B0A
_081D4A72:
	adds r0, r4, #0
	movs r1, #0x78
	bl sub_081D46E4
	cmp r0, #0
	beq _081D4B0A
	ldr r0, _081D4A94
	bl AddTextPrinterToWindow1
	movs r0, #0xb9
	lsls r0, r0, #1
	bl PlayFanfare
	movs r0, #0x13
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4A94: .4byte 0x085CD01D
_081D4A98:
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D4B0A
	ldr r0, _081D4AAC
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	b _081D4ABA
	.align 2, 0
_081D4AAC: .4byte 0x03002360
_081D4AB0:
	adds r0, r4, #0
	adds r0, #9
	ldr r1, _081D4AC4
	bl MG_PrintTextOnWindow1AndWaitButton
_081D4ABA:
	cmp r0, #0
	beq _081D4B0A
	movs r0, #0x1a
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4AC4: .4byte 0x085CCF81
_081D4AC8:
	adds r0, r4, #0
	adds r0, #9
	ldr r1, _081D4AD0
	b _081D4AE6
	.align 2, 0
_081D4AD0: .4byte 0x085CCFB9
_081D4AD4:
	adds r0, r4, #0
	adds r0, #9
	ldr r1, _081D4ADC
	b _081D4AE6
	.align 2, 0
_081D4ADC: .4byte 0x085CCFD5
_081D4AE0:
	adds r0, r4, #0
	adds r0, #9
	ldr r1, _081D4AF4
_081D4AE6:
	bl MG_PrintTextOnWindow1AndWaitButton
	cmp r0, #0
	beq _081D4B0A
_081D4AEE:
	movs r0, #0
	strb r0, [r4, #8]
	b _081D4B0A
	.align 2, 0
_081D4AF4: .4byte 0x085CD043
_081D4AF8:
	ldr r0, [r4, #0x10]
	bl Free
	adds r0, r5, #0
	bl DestroyTask
	ldr r0, _081D4B10
	bl SetMainCallback2
_081D4B0A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D4B10: .4byte 0x08018139
	thumb_func_end sub_081D4704

