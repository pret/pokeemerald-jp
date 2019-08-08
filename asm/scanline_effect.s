.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ScanlineEffect_Stop
ScanlineEffect_Stop: @ 0x080B9710
	push {r4, lr}
	ldr r4, _080B9740
	movs r0, #0
	strb r0, [r4, #0x15]
	ldr r1, _080B9744
	ldrh r2, [r1, #0xa]
	ldr r0, _080B9748
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _080B974C
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldrb r0, [r4, #0x18]
	cmp r0, #0xff
	beq _080B973A
	bl DestroyTask
	movs r0, #0xff
	strb r0, [r4, #0x18]
_080B973A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9740: .4byte 0x020397C8
_080B9744: .4byte 0x040000B0
_080B9748: .4byte 0x0000C5FF
_080B974C: .4byte 0x00007FFF
	thumb_func_end ScanlineEffect_Stop

	thumb_func_start ScanlineEffect_Clear
ScanlineEffect_Clear: @ 0x080B9750
	push {r4, lr}
	sub sp, #4
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r1, _080B9784
	ldr r2, _080B9788
	bl CpuSet
	ldr r0, _080B978C
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r4, [r0, #0x14]
	strb r4, [r0, #0x15]
	strb r4, [r0, #0x16]
	strb r4, [r0, #0x17]
	movs r1, #0xff
	strb r1, [r0, #0x18]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9784: .4byte 0x020388C8
_080B9788: .4byte 0x01000780
_080B978C: .4byte 0x020397C8
	thumb_func_end ScanlineEffect_Clear

	thumb_func_start ScanlineEffect_SetParams
ScanlineEffect_SetParams: @ 0x080B9790
	push {lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	ldr r0, _080B97B4
	cmp r1, r0
	bne _080B97C4
	ldr r0, _080B97B8
	ldr r1, _080B97BC
	str r1, [r0]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	str r1, [r0, #4]
	ldr r1, _080B97C0
	b _080B97D4
	.align 2, 0
_080B97B4: .4byte 0xA2600001
_080B97B8: .4byte 0x020397C8
_080B97BC: .4byte 0x020388CA
_080B97C0: .4byte 0x080B988D
_080B97C4:
	ldr r0, _080B97F4
	ldr r1, _080B97F8
	str r1, [r0]
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	str r1, [r0, #4]
	ldr r1, _080B97FC
_080B97D4:
	str r1, [r0, #0x10]
	adds r1, r0, #0
	ldr r0, [sp, #4]
	str r0, [r1, #0xc]
	ldr r0, [sp]
	str r0, [r1, #8]
	mov r0, sp
	ldrb r0, [r0, #8]
	strb r0, [r1, #0x15]
	mov r0, sp
	ldrb r0, [r0, #9]
	strb r0, [r1, #0x16]
	strb r0, [r1, #0x17]
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080B97F4: .4byte 0x020397C8
_080B97F8: .4byte 0x020388CC
_080B97FC: .4byte 0x080B98AD
	thumb_func_end ScanlineEffect_SetParams

	thumb_func_start ScanlineEffect_InitHBlankDmaTransfer
ScanlineEffect_InitHBlankDmaTransfer: @ 0x080B9800
	push {r4, lr}
	ldr r4, _080B9830
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _080B987A
	cmp r0, #3
	bne _080B9844
	movs r0, #0
	strb r0, [r4, #0x15]
	ldr r1, _080B9834
	ldrh r2, [r1, #0xa]
	ldr r0, _080B9838
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _080B983C
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r1, _080B9840
	movs r0, #1
	strb r0, [r1]
	b _080B987A
	.align 2, 0
_080B9830: .4byte 0x020397C8
_080B9834: .4byte 0x040000B0
_080B9838: .4byte 0x0000C5FF
_080B983C: .4byte 0x00007FFF
_080B9840: .4byte 0x020397E4
_080B9844:
	ldr r1, _080B9880
	ldrh r2, [r1, #0xa]
	ldr r0, _080B9884
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r0, _080B9888
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldrb r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, #8]
	str r0, [r1, #4]
	ldr r0, [r4, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, [r4, #0x10]
	bl _call_via_r0
	ldrb r0, [r4, #0x14]
	movs r1, #1
	eors r0, r1
	strb r0, [r4, #0x14]
_080B987A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9880: .4byte 0x040000B0
_080B9884: .4byte 0x0000C5FF
_080B9888: .4byte 0x00007FFF
	thumb_func_end ScanlineEffect_InitHBlankDmaTransfer

	thumb_func_start CopyValue16Bit
CopyValue16Bit: @ 0x080B988C
	ldr r0, _080B98A4
	ldr r2, [r0, #8]
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	ldr r1, _080B98A8
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080B98A4: .4byte 0x020397C8
_080B98A8: .4byte 0x020388C8
	thumb_func_end CopyValue16Bit

	thumb_func_start CopyValue32Bit
CopyValue32Bit: @ 0x080B98AC
	ldr r0, _080B98C4
	ldr r2, [r0, #8]
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	ldr r1, _080B98C8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_080B98C4: .4byte 0x020397C8
_080B98C8: .4byte 0x020388C8
	thumb_func_end CopyValue32Bit

	thumb_func_start TaskFunc_UpdateWavePerFrame
TaskFunc_UpdateWavePerFrame: @ 0x080B98CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	movs r6, #0
	ldr r0, _080B98F4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B98FC
	mov r0, ip
	bl DestroyTask
	ldr r1, _080B98F8
	movs r0, #0xff
	strb r0, [r1, #0x18]
	b _080B9A7C
	.align 2, 0
_080B98F4: .4byte 0x020397E4
_080B98F8: .4byte 0x020397C8
_080B98FC:
	ldr r1, _080B9928
	mov r0, ip
	lsls r2, r0, #2
	adds r0, r2, r0
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r4, #0x16
	ldrsh r0, [r3, r4]
	mov sl, r1
	mov sb, r2
	cmp r0, #0
	beq _080B99A8
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	cmp r0, #0xe
	bhi _080B99A8
	lsls r0, r0, #2
	ldr r1, _080B992C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B9928: .4byte 0x03005B60
_080B992C: .4byte 0x080B9930
_080B9930: @ jump table
	.4byte _080B996C @ case 0
	.4byte _080B99A8 @ case 1
	.4byte _080B9974 @ case 2
	.4byte _080B99A8 @ case 3
	.4byte _080B997C @ case 4
	.4byte _080B99A8 @ case 5
	.4byte _080B9984 @ case 6
	.4byte _080B99A8 @ case 7
	.4byte _080B998C @ case 8
	.4byte _080B99A8 @ case 9
	.4byte _080B9994 @ case 10
	.4byte _080B99A8 @ case 11
	.4byte _080B999C @ case 12
	.4byte _080B99A8 @ case 13
	.4byte _080B99A4 @ case 14
_080B996C:
	ldr r0, _080B9970
	b _080B99A6
	.align 2, 0
_080B9970: .4byte 0x02022AC8
_080B9974:
	ldr r0, _080B9978
	b _080B99A6
	.align 2, 0
_080B9978: .4byte 0x02022ACA
_080B997C:
	ldr r0, _080B9980
	b _080B99A6
	.align 2, 0
_080B9980: .4byte 0x02022ACC
_080B9984:
	ldr r0, _080B9988
	b _080B99A6
	.align 2, 0
_080B9988: .4byte 0x02022ACE
_080B998C:
	ldr r0, _080B9990
	b _080B99A6
	.align 2, 0
_080B9990: .4byte 0x02022AD0
_080B9994:
	ldr r0, _080B9998
	b _080B99A6
	.align 2, 0
_080B9998: .4byte 0x02022AD2
_080B999C:
	ldr r0, _080B99A0
	b _080B99A6
	.align 2, 0
_080B99A0: .4byte 0x02022AD4
_080B99A4:
	ldr r0, _080B9A08
_080B99A6:
	ldrh r6, [r0]
_080B99A8:
	mov r0, sb
	add r0, ip
	lsls r0, r0, #3
	mov r2, sl
	adds r1, r0, r2
	ldrh r2, [r1, #0x10]
	movs r3, #0x10
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080B9A14
	subs r0, r2, #1
	strh r0, [r1, #0x10]
	movs r4, #0xe
	ldrsh r0, [r1, r4]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r0, r3
	movs r4, #8
	ldrsh r3, [r1, r4]
	movs r4, #0xa
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _080B9A7C
	ldr r5, _080B9A0C
	ldr r0, _080B9A10
	mov r8, r0
	adds r7, r1, #0
	lsls r0, r2, #1
	adds r4, r0, r5
_080B99E2:
	lsls r2, r3, #1
	mov r0, r8
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r5
	ldrh r0, [r4]
	adds r0, r0, r6
	strh r0, [r2]
	adds r4, #2
	adds r3, #1
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _080B99E2
	b _080B9A7C
	.align 2, 0
_080B9A08: .4byte 0x02022AD6
_080B9A0C: .4byte 0x020388C8
_080B9A10: .4byte 0x020397C8
_080B9A14:
	ldrh r0, [r1, #0x12]
	strh r0, [r1, #0x10]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r0, r3
	movs r4, #8
	ldrsh r3, [r1, r4]
	movs r4, #0xa
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _080B9A5C
	ldr r5, _080B9A8C
	adds r7, r1, #0
	lsls r0, r2, #1
	adds r4, r0, r5
	ldr r0, _080B9A90
	mov r8, r0
_080B9A3A:
	lsls r2, r3, #1
	mov r0, r8
	ldrb r1, [r0, #0x14]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	adds r2, r2, r0
	adds r2, r2, r5
	ldrh r0, [r4]
	adds r0, r0, r6
	strh r0, [r2]
	adds r4, #2
	adds r3, #1
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _080B9A3A
_080B9A5C:
	mov r0, sb
	add r0, ip
	lsls r0, r0, #3
	mov r3, sl
	adds r2, r0, r3
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bne _080B9A7C
	movs r0, #0
	strh r0, [r2, #0xe]
_080B9A7C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9A8C: .4byte 0x020388C8
_080B9A90: .4byte 0x020397C8
	thumb_func_end TaskFunc_UpdateWavePerFrame

	thumb_func_start GenerateWave
GenerateWave: @ 0x080B9A94
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r1, #0
	movs r2, #0
	ldr r0, _080B9AD8
	mov ip, r0
_080B9AA8:
	lsls r0, r1, #1
	adds r3, r0, r6
	lsls r0, r2, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r4, r0
	cmp r0, #0
	bge _080B9ABC
	adds r0, #0xff
_080B9ABC:
	asrs r0, r0, #8
	strh r0, [r3]
	adds r0, r2, r5
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xff
	bls _080B9AA8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9AD8: .4byte 0x082FA8CC
	thumb_func_end GenerateWave

	thumb_func_start ScanlineEffect_InitWave
ScanlineEffect_InitWave: @ 0x080B9ADC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x40]
	mov r8, r0
	ldr r1, [sp, #0x44]
	mov sb, r1
	ldr r0, [sp, #0x48]
	mov sl, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, [sp, #0x10]
	lsls r1, r1, #0x18
	str r1, [sp, #0x14]
	lsrs r0, r1, #0x18
	str r0, [sp, #0xc]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x1c]
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r3, sb
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	bl ScanlineEffect_Clear
	ldr r0, _080B9BE8
	add r0, sb
	str r0, [sp]
	ldr r0, _080B9BEC
	str r0, [sp, #4]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #8]
	mov r0, sp
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ScanlineEffect_SetParams
	ldr r0, _080B9BF0
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080B9BF4
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #3
	adds r4, r4, r0
	strh r5, [r4, #8]
	mov r3, sp
	ldrh r3, [r3, #0xc]
	strh r3, [r4, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp, #0x18]
	bl __divsi3
	strh r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0xe]
	mov r1, r8
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x12]
	mov r3, sb
	strh r3, [r4, #0x14]
	mov r0, sl
	strh r0, [r4, #0x16]
	ldr r0, _080B9BF8
	strb r7, [r0, #0x18]
	ldr r0, _080B9BFC
	movs r1, #0
	strb r1, [r0]
	ldr r4, _080B9C00
	ldr r3, [sp, #0xc]
	subs r6, r3, r5
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	bl GenerateWave
	ldr r0, [sp, #0xc]
	cmp r5, r0
	bge _080B9BD6
	ldr r1, _080B9C04
	adds r2, r4, r1
	lsls r1, r5, #1
	movs r3, #0xf0
	lsls r3, r3, #3
	adds r0, r1, r3
	adds r3, r0, r2
	adds r1, r1, r2
	adds r2, r4, #0
	adds r5, r6, #0
_080B9BC2:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bne _080B9BC2
_080B9BD6:
	adds r0, r7, #0
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B9BE8: .4byte 0x04000010
_080B9BEC: .4byte 0xA2600001
_080B9BF0: .4byte 0x080B98CD
_080B9BF4: .4byte 0x03005B60
_080B9BF8: .4byte 0x020397C8
_080B9BFC: .4byte 0x020397E4
_080B9C00: .4byte 0x02038B48
_080B9C04: .4byte 0xFFFFFD80
	thumb_func_end ScanlineEffect_InitWave

	thumb_func_start BattleScene_ProcessInput
BattleScene_ProcessInput: @ 0x080B9C08
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleScene_ProcessInput

	thumb_func_start BattleStyle_ProcessInput
BattleStyle_ProcessInput: @ 0x080B9C20
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end BattleStyle_ProcessInput

	thumb_func_start CB2_InitOptionMenu
CB2_InitOptionMenu: @ 0x080B9C34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r1, _080B9C58
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0xb
	bhi _080B9C90
	lsls r0, r0, #2
	ldr r1, _080B9C5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B9C58: .4byte 0x03002360
_080B9C5C: .4byte 0x080B9C60
_080B9C60: @ jump table
	.4byte _080B9C90 @ case 0
	.4byte _080B9CA4 @ case 1
	.4byte _080B9DF4 @ case 2
	.4byte _080B9E14 @ case 3
	.4byte _080B9E38 @ case 4
	.4byte _080B9E70 @ case 5
	.4byte _080B9E80 @ case 6
	.4byte _080B9E98 @ case 7
	.4byte _080B9EA0 @ case 8
	.4byte _080B9EB8 @ case 9
	.4byte _080B9ECC @ case 10
	.4byte _080B9F64 @ case 11
_080B9C90:
	movs r0, #0
	bl SetVBlankCallback
	ldr r1, _080B9CA0
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080B9F4C
	.align 2, 0
_080B9CA0: .4byte 0x03002360
_080B9CA4:
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #9
	add r1, sp, #8
	mov r8, r1
	add r2, sp, #4
	movs r6, #0
	ldr r1, _080B9DE4
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _080B9DE8
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_080B9CC2:
	strh r6, [r2]
	add r0, sp, #4
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _080B9CC2
	strh r6, [r2]
	add r2, sp, #4
	str r2, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #8]
	ldr r2, _080B9DE4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	add r0, sp, #4
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _080B9DEC
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	ldr r0, _080B9DF0
	bl InitWindows
	bl DeactivateAllTextPrinters
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x48
	movs r1, #1
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x23
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0xc1
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #4
	bl SetGpuReg
	movs r1, #0xc1
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	b _080B9F44
	.align 2, 0
_080B9DE4: .4byte 0x040000D4
_080B9DE8: .4byte 0x81000800
_080B9DEC: .4byte 0x08537414
_080B9DF0: .4byte 0x085373FC
_080B9DF4:
	bl ResetPaletteFade
	bl ScanlineEffect_Stop
	bl ResetTasks
	bl ResetSpriteData
	ldr r1, _080B9E10
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080B9F4C
	.align 2, 0
_080B9E10: .4byte 0x03002360
_080B9E14:
	ldr r0, _080B9E34
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	lsrs r0, r0, #3
	bl GetWindowFrameTilesPal
	ldr r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #1
	movs r3, #0xd1
	lsls r3, r3, #1
	movs r0, #1
	bl LoadBgTiles
	b _080B9F44
	.align 2, 0
_080B9E34: .4byte 0x03005AF0
_080B9E38:
	ldr r0, _080B9E64
	movs r1, #0
	movs r2, #2
	bl LoadPalette
	ldr r0, _080B9E68
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	lsrs r0, r0, #3
	bl GetWindowFrameTilesPal
	ldr r0, [r0, #4]
	movs r1, #0x70
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _080B9E6C
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080B9F4C
	.align 2, 0
_080B9E64: .4byte 0x0853741C
_080B9E68: .4byte 0x03005AF0
_080B9E6C: .4byte 0x03002360
_080B9E70:
	ldr r0, _080B9E7C
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	b _080B9F44
	.align 2, 0
_080B9E7C: .4byte 0x085372B0
_080B9E80:
	movs r0, #0
	bl PutWindowTilemap
	bl DrawTextOption
	ldr r1, _080B9E94
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080B9F4C
	.align 2, 0
_080B9E94: .4byte 0x03002360
_080B9E98:
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r2, r0
	b _080B9F4C
_080B9EA0:
	movs r0, #1
	bl PutWindowTilemap
	bl sub_080BA834
	ldr r1, _080B9EC8
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080B9EB8:
	bl sub_080BA890
	ldr r1, _080B9EC8
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	b _080B9F4C
	.align 2, 0
_080B9EC8: .4byte 0x03002360
_080B9ECC:
	ldr r0, _080B9F54
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B9F58
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, _080B9F5C
	ldr r2, [r0]
	ldrb r0, [r2, #0x14]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	strh r0, [r4, #0xa]
	ldrb r1, [r2, #0x15]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	strh r1, [r4, #0xc]
	ldrb r1, [r2, #0x15]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strh r1, [r4, #0xe]
	ldrb r1, [r2, #0x15]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	strh r1, [r4, #0x10]
	ldrb r1, [r2, #0x13]
	strh r1, [r4, #0x12]
	ldrb r1, [r2, #0x14]
	lsrs r1, r1, #3
	strh r1, [r4, #0x14]
	bl BattleScene_DrawChoices
	ldrb r0, [r4, #0xc]
	bl Sound_DrawChoices
	ldrb r0, [r4, #0xe]
	bl TextSpeed_ProcessInput
	ldrb r0, [r4, #0x10]
	bl TextSpeed_DrawChoices
	ldrb r0, [r4, #0x12]
	bl sub_080BA780
	ldrb r0, [r4, #0x14]
	bl FrameType_DrawChoices
	ldrb r0, [r4, #8]
	bl HighlightOptionMenuItem
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
_080B9F44:
	ldr r1, _080B9F60
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
_080B9F4C:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080B9F80
	.align 2, 0
_080B9F54: .4byte 0x080B9F95
_080B9F58: .4byte 0x03005B60
_080B9F5C: .4byte 0x03005AF0
_080B9F60: .4byte 0x03002360
_080B9F64:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _080B9F8C
	bl SetVBlankCallback
	ldr r0, _080B9F90
	bl SetMainCallback2
_080B9F80:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F8C: .4byte 0x080B9C21
_080B9F90: .4byte 0x080B9C09
	thumb_func_end CB2_InitOptionMenu

	thumb_func_start Task_OptionMenuFadeIn
Task_OptionMenuFadeIn: @ 0x080B9F94
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080B9FB8
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080B9FB4
	ldr r0, _080B9FBC
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _080B9FC0
	str r0, [r1]
_080B9FB4:
	pop {r0}
	bx r0
	.align 2, 0
_080B9FB8: .4byte 0x02037C74
_080B9FBC: .4byte 0x03005B60
_080B9FC0: .4byte 0x080B9FC5
	thumb_func_end Task_OptionMenuFadeIn

	thumb_func_start Task_OptionMenuProcessInput
Task_OptionMenuProcessInput: @ 0x080B9FC4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080B9FEC
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B9FF4
	ldr r0, _080B9FF0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #6
	beq _080B9FEA
	b _080BA1B2
_080B9FEA:
	b _080BA006
	.align 2, 0
_080B9FEC: .4byte 0x03002360
_080B9FF0: .4byte 0x03005B60
_080B9FF4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BA014
	ldr r0, _080BA00C
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
_080BA006:
	ldr r0, _080BA010
	str r0, [r1]
	b _080BA1B2
	.align 2, 0
_080BA00C: .4byte 0x03005B60
_080BA010: .4byte 0x080BA1BD
_080BA014:
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080BA044
	ldr r1, _080BA03C
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r5, [r3, #8]
	movs r6, #8
	ldrsh r0, [r3, r6]
	adds r7, r1, #0
	cmp r0, #0
	ble _080BA040
	subs r0, r5, #1
	b _080BA064
	.align 2, 0
_080BA03C: .4byte 0x03005B60
_080BA040:
	movs r0, #6
	b _080BA064
_080BA044:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BA07C
	ldr r1, _080BA068
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r5, [r3, #8]
	movs r7, #8
	ldrsh r0, [r3, r7]
	adds r7, r1, #0
	cmp r0, #5
	bgt _080BA06C
	adds r0, r5, #1
_080BA064:
	strh r0, [r3, #8]
	b _080BA06E
	.align 2, 0
_080BA068: .4byte 0x03005B60
_080BA06C:
	strh r6, [r3, #8]
_080BA06E:
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrb r0, [r0, #8]
	bl HighlightOptionMenuItem
	b _080BA1B2
_080BA07C:
	ldr r0, _080BA09C
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r3, #8
	ldrsh r1, [r1, r3]
	adds r7, r0, #0
	cmp r1, #5
	bls _080BA092
	b _080BA1B2
_080BA092:
	lsls r0, r1, #2
	ldr r1, _080BA0A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA09C: .4byte 0x03005B60
_080BA0A0: .4byte 0x080BA0A4
_080BA0A4: @ jump table
	.4byte _080BA0BC @ case 0
	.4byte _080BA0E2 @ case 1
	.4byte _080BA108 @ case 2
	.4byte _080BA12E @ case 3
	.4byte _080BA154 @ case 4
	.4byte _080BA17A @ case 5
_080BA0BC:
	adds r4, r2, r4
	lsls r4, r4, #3
	adds r4, r4, r7
	ldrb r5, [r4, #0xa]
	adds r0, r5, #0
	bl ButtonMode_ProcessInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	strh r0, [r4, #0xa]
	movs r6, #0xa
	ldrsh r0, [r4, r6]
	cmp r5, r0
	beq _080BA19E
	adds r0, r1, #0
	bl BattleScene_DrawChoices
	b _080BA19E
_080BA0E2:
	adds r4, r2, r4
	lsls r4, r4, #3
	adds r4, r4, r7
	ldrb r5, [r4, #0xc]
	adds r0, r5, #0
	bl BattleStyle_DrawChoices
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	strh r0, [r4, #0xc]
	movs r7, #0xc
	ldrsh r0, [r4, r7]
	cmp r5, r0
	beq _080BA19E
	adds r0, r1, #0
	bl Sound_DrawChoices
	b _080BA19E
_080BA108:
	adds r4, r2, r4
	lsls r4, r4, #3
	adds r4, r4, r7
	ldrb r5, [r4, #0xe]
	adds r0, r5, #0
	bl DrawOptionMenuTexts
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	strh r0, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r5, r0
	beq _080BA19E
	adds r0, r1, #0
	bl TextSpeed_ProcessInput
	b _080BA19E
_080BA12E:
	adds r4, r2, r4
	lsls r4, r4, #3
	adds r4, r4, r7
	ldrb r5, [r4, #0x10]
	adds r0, r5, #0
	bl Sound_ProcessInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	strh r0, [r4, #0x10]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r5, r0
	beq _080BA19E
	adds r0, r1, #0
	bl TextSpeed_DrawChoices
	b _080BA19E
_080BA154:
	adds r4, r2, r4
	lsls r4, r4, #3
	adds r4, r4, r7
	ldrb r5, [r4, #0x12]
	adds r0, r5, #0
	bl ButtonMode_DrawChoices
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	strh r0, [r4, #0x12]
	movs r6, #0x12
	ldrsh r0, [r4, r6]
	cmp r5, r0
	beq _080BA19E
	adds r0, r1, #0
	bl sub_080BA780
	b _080BA19E
_080BA17A:
	adds r4, r2, r4
	lsls r4, r4, #3
	adds r4, r4, r7
	ldrb r5, [r4, #0x14]
	adds r0, r5, #0
	bl FrameType_ProcessInput
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	strh r0, [r4, #0x14]
	movs r7, #0x14
	ldrsh r0, [r4, r7]
	cmp r5, r0
	beq _080BA19E
	adds r0, r1, #0
	bl FrameType_DrawChoices
_080BA19E:
	ldr r1, _080BA1B8
	ldrb r0, [r1]
	cmp r0, #0
	beq _080BA1B2
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	movs r1, #2
	bl CopyWindowToVram
_080BA1B2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA1B8: .4byte 0x020397E8
	thumb_func_end Task_OptionMenuProcessInput

	thumb_func_start Task_OptionMenuSave
Task_OptionMenuSave: @ 0x080BA1BC
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _080BA254
	ldr r3, [r6]
	ldr r1, _080BA258
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r0, #7
	ldrb r1, [r4, #0xa]
	ands r1, r0
	ldrb r2, [r3, #0x14]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldr r3, [r6]
	movs r5, #1
	ldrb r1, [r4, #0xc]
	ands r1, r5
	lsls r1, r1, #2
	ldrb r2, [r3, #0x15]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x15]
	ldr r3, [r6]
	ldrb r1, [r4, #0xe]
	ands r1, r5
	lsls r1, r1, #1
	ldrb r2, [r3, #0x15]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x15]
	ldr r3, [r6]
	ldrb r1, [r4, #0x10]
	ands r1, r5
	ldrb r2, [r3, #0x15]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x15]
	ldr r1, [r6]
	ldrh r0, [r4, #0x12]
	movs r5, #0
	strb r0, [r1, #0x13]
	ldr r3, [r6]
	ldrb r1, [r4, #0x14]
	lsls r1, r1, #3
	ldrb r2, [r3, #0x14]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	movs r0, #1
	rsbs r0, r0, #0
	str r5, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _080BA25C
	str r0, [r4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA254: .4byte 0x03005AF0
_080BA258: .4byte 0x03005B60
_080BA25C: .4byte 0x080BA261
	thumb_func_end Task_OptionMenuSave

	thumb_func_start Task_OptionMenuFadeOut
Task_OptionMenuFadeOut: @ 0x080BA260
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080BA288
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080BA284
	adds r0, r2, #0
	bl DestroyTask
	bl FreeAllWindowBuffers
	ldr r0, _080BA28C
	ldr r0, [r0, #8]
	bl SetMainCallback2
_080BA284:
	pop {r0}
	bx r0
	.align 2, 0
_080BA288: .4byte 0x02037C74
_080BA28C: .4byte 0x03002360
	thumb_func_end Task_OptionMenuFadeOut

	thumb_func_start HighlightOptionMenuItem
HighlightOptionMenuItem: @ 0x080BA290
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0x87
	lsls r1, r1, #5
	movs r0, #0x40
	bl SetGpuReg
	lsls r4, r4, #4
	adds r1, r4, #0
	adds r1, #0x28
	lsls r1, r1, #8
	adds r4, #0x38
	orrs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x44
	bl SetGpuReg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end HighlightOptionMenuItem

	thumb_func_start DrawOptionMenuChoice
DrawOptionMenuChoice: @ 0x080BA2C0
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080BA2F8
_080BA2DC:
	mov r0, sp
	adds r0, r0, r2
	adds r0, #0xc
	strb r1, [r0]
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrb r1, [r4]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080BA2F8
	cmp r2, #0xe
	bls _080BA2DC
_080BA2F8:
	cmp r3, #0
	beq _080BA306
	add r1, sp, #0xc
	movs r0, #4
	strb r0, [r1, #2]
	movs r0, #5
	strb r0, [r1, #5]
_080BA306:
	mov r1, sp
	adds r1, r1, r2
	adds r1, #0xc
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	add r2, sp, #0xc
	adds r3, r6, #0
	bl AddTextPrinterParameterized
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end DrawOptionMenuChoice

	thumb_func_start ButtonMode_ProcessInput
ButtonMode_ProcessInput: @ 0x080BA334
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _080BA354
	ldrh r1, [r2, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BA360
	cmp r3, #1
	bhi _080BA358
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _080BA35A
	.align 2, 0
_080BA354: .4byte 0x03002360
_080BA358:
	movs r3, #0
_080BA35A:
	ldr r1, _080BA378
	movs r0, #1
	strb r0, [r1]
_080BA360:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080BA384
	cmp r3, #0
	beq _080BA37C
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _080BA37E
	.align 2, 0
_080BA378: .4byte 0x020397E8
_080BA37C:
	movs r3, #2
_080BA37E:
	ldr r1, _080BA38C
	movs r0, #1
	strb r0, [r1]
_080BA384:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_080BA38C: .4byte 0x020397E8
	thumb_func_end ButtonMode_ProcessInput

	thumb_func_start BattleScene_DrawChoices
BattleScene_DrawChoices: @ 0x080BA390
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	movs r2, #0
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080BA3D8
	mov r1, sp
	ldrb r3, [r1]
	movs r1, #0x68
	bl DrawOptionMenuChoice
	ldr r0, _080BA3DC
	mov r1, sp
	ldrb r3, [r1, #1]
	movs r1, #0x88
	movs r2, #0
	bl DrawOptionMenuChoice
	ldr r0, _080BA3E0
	mov r1, sp
	ldrb r3, [r1, #2]
	movs r1, #0xa8
	movs r2, #0
	bl DrawOptionMenuChoice
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BA3D8: .4byte 0x0853736C
_080BA3DC: .4byte 0x08537376
_080BA3E0: .4byte 0x08537380
	thumb_func_end BattleScene_DrawChoices

	thumb_func_start BattleStyle_DrawChoices
BattleStyle_DrawChoices: @ 0x080BA3E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080BA404
	ldrh r1, [r0, #0x2e]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080BA3FE
	movs r1, #1
	eors r2, r1
	ldr r0, _080BA408
	strb r1, [r0]
_080BA3FE:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080BA404: .4byte 0x03002360
_080BA408: .4byte 0x020397E8
	thumb_func_end BattleStyle_DrawChoices

	thumb_func_start Sound_DrawChoices
Sound_DrawChoices: @ 0x080BA40C
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	movs r2, #0
	strb r2, [r1]
	strb r2, [r1, #1]
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r4, _080BA460
	movs r1, #1
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0]
	adds r0, r4, #0
	movs r1, #0x68
	bl DrawOptionMenuChoice
	ldr r4, _080BA464
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0, #1]
	adds r0, r4, #0
	movs r1, #0xa8
	bl DrawOptionMenuChoice
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA460: .4byte 0x0853738A
_080BA464: .4byte 0x08537393
	thumb_func_end Sound_DrawChoices

	thumb_func_start DrawOptionMenuTexts
DrawOptionMenuTexts: @ 0x080BA468
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080BA488
	ldrh r1, [r0, #0x2e]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080BA482
	movs r1, #1
	eors r2, r1
	ldr r0, _080BA48C
	strb r1, [r0]
_080BA482:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080BA488: .4byte 0x03002360
_080BA48C: .4byte 0x020397E8
	thumb_func_end DrawOptionMenuTexts

	thumb_func_start TextSpeed_ProcessInput
TextSpeed_ProcessInput: @ 0x080BA490
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	movs r2, #0
	strb r2, [r1]
	strb r2, [r1, #1]
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r4, _080BA4E4
	movs r1, #1
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0]
	adds r0, r4, #0
	movs r1, #0x68
	bl DrawOptionMenuChoice
	ldr r4, _080BA4E8
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0, #1]
	adds r0, r4, #0
	movs r1, #0xa0
	bl DrawOptionMenuChoice
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA4E4: .4byte 0x0853739D
_080BA4E8: .4byte 0x085373A8
	thumb_func_end TextSpeed_ProcessInput

	thumb_func_start Sound_ProcessInput
Sound_ProcessInput: @ 0x080BA4EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080BA514
	ldrh r1, [r0, #0x2e]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080BA50C
	movs r4, #1
	eors r5, r4
	adds r0, r5, #0
	bl SetPokemonCryStereo
	ldr r0, _080BA518
	strb r4, [r0]
_080BA50C:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BA514: .4byte 0x03002360
_080BA518: .4byte 0x020397E8
	thumb_func_end Sound_ProcessInput

	thumb_func_start TextSpeed_DrawChoices
TextSpeed_DrawChoices: @ 0x080BA51C
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	movs r2, #0
	strb r2, [r1]
	strb r2, [r1, #1]
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r4, _080BA57C
	movs r1, #1
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0]
	adds r0, r4, #0
	movs r1, #0x68
	bl DrawOptionMenuChoice
	ldr r4, _080BA580
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0, #1]
	adds r0, r4, #0
	movs r1, #0xa0
	bl DrawOptionMenuChoice
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA57C: .4byte 0x085373B3
_080BA580: .4byte 0x085373BE
	thumb_func_end TextSpeed_DrawChoices

	thumb_func_start FrameType_ProcessInput
FrameType_ProcessInput: @ 0x080BA584
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080BA5A4
	ldrh r1, [r0, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BA5D6
	cmp r4, #0x12
	bhi _080BA5A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _080BA5AA
	.align 2, 0
_080BA5A4: .4byte 0x03002360
_080BA5A8:
	movs r4, #0
_080BA5AA:
	adds r0, r4, #0
	bl GetWindowFrameTilesPal
	ldr r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #1
	movs r3, #0xd1
	lsls r3, r3, #1
	movs r0, #1
	bl LoadBgTiles
	adds r0, r4, #0
	bl GetWindowFrameTilesPal
	ldr r0, [r0, #4]
	movs r1, #0x70
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _080BA5F0
	movs r0, #1
	strb r0, [r1]
_080BA5D6:
	ldr r0, _080BA5F4
	ldrh r1, [r0, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080BA626
	cmp r4, #0
	beq _080BA5F8
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _080BA5FA
	.align 2, 0
_080BA5F0: .4byte 0x020397E8
_080BA5F4: .4byte 0x03002360
_080BA5F8:
	movs r4, #0x13
_080BA5FA:
	adds r0, r4, #0
	bl GetWindowFrameTilesPal
	ldr r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #1
	movs r3, #0xd1
	lsls r3, r3, #1
	movs r0, #1
	bl LoadBgTiles
	adds r0, r4, #0
	bl GetWindowFrameTilesPal
	ldr r0, [r0, #4]
	movs r1, #0x70
	movs r2, #0x20
	bl LoadPalette
	ldr r1, _080BA630
	movs r0, #1
	strb r0, [r1]
_080BA626:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BA630: .4byte 0x020397E8
	thumb_func_end FrameType_ProcessInput

	thumb_func_start FrameType_DrawChoices
FrameType_DrawChoices: @ 0x080BA634
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	movs r5, #0
	ldr r1, _080BA6A8
	ldrb r0, [r1]
	ldr r2, _080BA6AC
	mov r8, r2
	cmp r0, #0xff
	beq _080BA672
	adds r2, r1, #0
_080BA656:
	mov r0, sp
	adds r1, r0, r5
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080BA672
	cmp r5, #5
	bls _080BA656
_080BA672:
	adds r0, r7, #0
	movs r1, #0xa
	bl __udivsi3
	adds r2, r0, #0
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _080BA6B0
	mov r0, sp
	adds r1, r0, r5
	adds r0, r2, #0
	adds r0, #0xa1
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sp
	adds r4, r1, r5
	adds r0, r7, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r4]
	b _080BA6CC
	.align 2, 0
_080BA6A8: .4byte 0x085373D3
_080BA6AC: .4byte 0x085373C9
_080BA6B0:
	mov r2, sp
	adds r4, r2, r5
	adds r0, r7, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0xa1
	strb r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
_080BA6CC:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r2, sp
	adds r1, r2, r5
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, r8
	movs r1, #0x68
	movs r3, #0
	bl DrawOptionMenuChoice
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, sp
	movs r1, #0x80
	movs r3, #1
	bl DrawOptionMenuChoice
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FrameType_DrawChoices

	thumb_func_start ButtonMode_DrawChoices
ButtonMode_DrawChoices: @ 0x080BA724
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _080BA744
	ldrh r1, [r2, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BA750
	cmp r3, #1
	bhi _080BA748
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _080BA74A
	.align 2, 0
_080BA744: .4byte 0x03002360
_080BA748:
	movs r3, #0
_080BA74A:
	ldr r1, _080BA768
	movs r0, #1
	strb r0, [r1]
_080BA750:
	ldrh r1, [r2, #0x2e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080BA774
	cmp r3, #0
	beq _080BA76C
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _080BA76E
	.align 2, 0
_080BA768: .4byte 0x020397E8
_080BA76C:
	movs r3, #2
_080BA76E:
	ldr r1, _080BA77C
	movs r0, #1
	strb r0, [r1]
_080BA774:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_080BA77C: .4byte 0x020397E8
	thumb_func_end ButtonMode_DrawChoices

	thumb_func_start sub_080BA780
sub_080BA780: @ 0x080BA780
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sp
	movs r2, #0
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	ldr r4, _080BA7F4
	movs r1, #1
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0]
	adds r0, r4, #0
	movs r1, #0x68
	bl DrawOptionMenuChoice
	ldr r4, _080BA7F8
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0, #1]
	adds r0, r4, #0
	movs r1, #0x90
	bl DrawOptionMenuChoice
	ldr r4, _080BA7FC
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	adds r2, r0, #0
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x18
	mov r0, sp
	ldrb r3, [r0, #2]
	adds r0, r4, #0
	movs r1, #0xa8
	bl DrawOptionMenuChoice
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA7F4: .4byte 0x085373DA
_080BA7F8: .4byte 0x085373E5
_080BA7FC: .4byte 0x085373EE
	thumb_func_end sub_080BA780

	thumb_func_start DrawTextOption
DrawTextOption: @ 0x080BA800
	push {lr}
	sub sp, #0xc
	movs r0, #0
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, _080BA830
	movs r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080BA830: .4byte 0x08537310
	thumb_func_end DrawTextOption

	thumb_func_start sub_080BA834
sub_080BA834: @ 0x080BA834
	push {r4, lr}
	sub sp, #0xc
	movs r0, #1
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r4, #0
_080BA842:
	movs r0, #1
	movs r1, #1
	bl GetFontAttribute
	adds r1, r4, #0
	muls r1, r0, r1
	adds r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080BA88C
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r2, [r0]
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #8
	bl AddTextPrinterParameterized
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _080BA842
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA88C: .4byte 0x08537350
	thumb_func_end sub_080BA834

	thumb_func_start sub_080BA890
sub_080BA890: @ 0x080BA890
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r5, #7
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #0xd1
	lsls r1, r1, #1
	movs r2, #1
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #0x1b
	mov r8, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	ldr r1, _080BA9FC
	movs r2, #2
	movs r3, #0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #0xd2
	lsls r1, r1, #1
	movs r2, #0x1c
	movs r3, #0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	movs r6, #2
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	ldr r1, _080BAA00
	movs r2, #1
	movs r3, #1
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	ldr r1, _080BAA04
	movs r2, #0x1c
	movs r3, #1
	bl FillBgTilemapBufferRect
	movs r7, #0xd4
	lsls r7, r7, #1
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	adds r1, r7, #0
	movs r2, #1
	movs r3, #3
	bl FillBgTilemapBufferRect
	ldr r0, _080BAA08
	mov sl, r0
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	mov r1, sl
	movs r2, #2
	movs r3, #3
	bl FillBgTilemapBufferRect
	movs r0, #0xd5
	lsls r0, r0, #1
	mov sb, r0
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	mov r1, sb
	movs r2, #0x1c
	movs r3, #3
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #0xd1
	lsls r1, r1, #1
	movs r2, #1
	movs r3, #4
	bl FillBgTilemapBufferRect
	movs r0, #0x1a
	mov r8, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	ldr r1, _080BA9FC
	movs r2, #2
	movs r3, #4
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #0xd2
	lsls r1, r1, #1
	movs r2, #0x1c
	movs r3, #4
	bl FillBgTilemapBufferRect
	str r4, [sp]
	movs r6, #0x12
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	ldr r1, _080BAA00
	movs r2, #1
	movs r3, #5
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	ldr r1, _080BAA04
	movs r2, #0x1c
	movs r3, #5
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	mov r0, r8
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	mov r1, sl
	movs r2, #2
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	mov r1, sb
	movs r2, #0x1c
	movs r3, #0x13
	bl FillBgTilemapBufferRect
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA9FC: .4byte 0x000001A3
_080BAA00: .4byte 0x000001A5
_080BAA04: .4byte 0x000001A7
_080BAA08: .4byte 0x000001A9
	thumb_func_end sub_080BA890

