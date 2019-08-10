.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GameCubeMultiBoot_Hash
GameCubeMultiBoot_Hash: @ 0x0828D2F8
	push {r4, lr}
	ldr r4, _0828D400
	eors r3, r1
	movs r2, #0x20
_0828D300:
	lsrs r3, r3, #1
	blo _0828D306
	eors r3, r4
_0828D306:
	subs r2, #1
	bne _0828D300
	pop {r4, pc}
	thumb_func_end GameCubeMultiBoot_Hash

	thumb_func_start sGameCubeMultiBoot_Main
sGameCubeMultiBoot_Main: @ 0x0828D30C
	ldr r1, [r0, #0x28]
	cmp r1, #0
	beq _0828D332
	ldrb r1, [r0, #1]
	adds r1, #1
	strb r1, [r0, #1]
	ldrb r1, [r0, #2]
	cmp r1, #2
	beq _0828D37C
	ldr r3, _0828D5C0
	ldrh r2, [r3, #8]
	movs r1, #0
	strh r1, [r3, #8]
	ldrb r1, [r0]
	cmp r1, #0xa
	bgt _0828D330
	adds r1, #1
	strb r1, [r0]
_0828D330:
	strh r2, [r3, #8]
_0828D332:
	bhs GameCubeMultiBoot_Init
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _0828D37E
	ldr r1, [r0, #0x24]
	ldr r2, [r0, #0x20]
	subs r1, r1, r2
	beq _0828D3FE
	cmp r1, #0xa0
	blo _0828D3FE
	push {r4, r5, r6}
	movs r1, #0x98
	adds r2, #4
	ldr r4, _0828D408
_0828D34E:
	ldm r2!, {r5}
	ldm r4!, {r6}
	cmp r5, r6
	bne _0828D364
	subs r1, #4
	bne _0828D34E
	ldm r2!, {r5}
	ldm r4!, {r6}
	eors r5, r6
	lsrs r5, r5, #8
	str r2, [r0, #0x20]
_0828D364:
	pop {r4, r5, r6}
	bne GameCubeMultiBoot_Init
	movs r1, #1
	strb r1, [r0, #2]
	ldr r1, [r0, #4]
	ldr r2, [r0, #8]
	eors r1, r2
	str r1, [r0, #0x18]
	ldr r2, _0828D404
	muls r1, r2, r1
	adds r1, #1
	str r1, [r0, #0x14]
_0828D37C:
	bx lr
_0828D37E:
	ldr r1, [r0, #0x24]
	mov ip, r1
	ldr r3, [r0, #0x18]
	push {r4, r5, r6, r7}
	ldr r4, [r0, #0x20]
	ldr r5, _0828D404
	ldr r6, [r0, #0x14]
	ldr r7, _0828D400
_0828D38E:
	cmp r4, ip
	bhs _0828D3AE
	ldr r1, [r4]
	eors r1, r6
	adds r1, r1, r3
	stm r4!, {r1}
	eors r3, r1
	movs r2, #0x20
_0828D39E:
	lsrs r3, r3, #1
	blo _0828D3A4
	eors r3, r7
_0828D3A4:
	subs r2, #1
	bne _0828D39E
	muls r6, r5, r6
	adds r6, #1
	b _0828D38E
_0828D3AE:
	str r4, [r0, #0x20]
	str r6, [r0, #0x14]
	pop {r4, r5, r6, r7}
	str r3, [r0, #0x18]
	ldrh r1, [r0, #0x12]
	cmp r1, #0
	bne _0828D3FE
	ldr r1, [r0, #0x24]
	ldr r2, [r0, #0x20]
	cmp r1, r2
	bne _0828D3FE
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _0828D3E8
	ldrh r1, [r0, #0x10]
	cmp r1, #0
	beq _0828D37C
	mov ip, lr
	movs r1, #0xbb
	ldr r3, [r0, #0xc]
	bl GameCubeMultiBoot_Hash
	ldrh r1, [r0, #0x10]
	mov lr, ip
	subs r1, r1, r3
	bne GameCubeMultiBoot_Init
	movs r1, #2
	strb r1, [r0, #2]
	bx lr
_0828D3E8:
	mov ip, lr
	ldrb r1, [r0, #3]
	lsls r1, r1, #0x18
	subs r1, #1
	str r1, [r0, #0xc]
	bl GameCubeMultiBoot_Hash
	lsls r3, r3, #8
	adds r3, #0xff
	str r3, [r0, #0x1c]
	bx ip
_0828D3FE:
	bx lr
	.align 2, 0
_0828D400: .4byte 0x0000A1C1
_0828D404: .4byte 0x6177614B
_0828D408: .4byte 0x08000004
	thumb_func_end sGameCubeMultiBoot_Main

	thumb_func_start GameCubeMultiBoot_ExecuteProgram
GameCubeMultiBoot_ExecuteProgram: @ 0x0828D40C
	ldrb r1, [r0, #2]
	cmp r1, #2
	bne _0828D41E
	ldr r3, _0828D5C0
	movs r1, #0
	strh r1, [r3, #8]
	ldr r1, _0828D5D0
	adds r1, #0xc0
	bx r1
_0828D41E:
	bx lr
	thumb_func_end GameCubeMultiBoot_ExecuteProgram
	
	thumb_func_start GameCubeMultiBoot_Init
GameCubeMultiBoot_Init:
	ldr r3, _0828D5C0
	ldrh r2, [r3, #8]
	movs r1, #0
	strh r1, [r3, #8]
	add r3, pc, #0x54
	str r3, [r0, #0x28]
	ldrb r3, [r0, #3]
	push {r3}
	ldrb r3, [r0, #1]
	push {r0, r3}
	adds r3, r0, #0
	adds r3, #0x20
_0828D438:
	stm r0!, {r1}
	cmp r0, r3
	blo _0828D438
	pop {r0, r3}
	lsrs r3, r3, #1
	strb r3, [r0, #3]
	pop {r3}
	strb r3, [r0, #1]
	ldr r3, _0828D5C4
	lsls r0, r3, #0xa
	strh r0, [r3, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #8
	strh r0, [r3, #0x14]
	movs r0, #0x47
	strh r0, [r3, #0x20]
	strh r1, [r3, #0x38]
	ldr r3, _0828D5C0
	movs r0, #0x80
	strh r0, [r3, #2]
	ldrh r1, [r3]
	orrs r1, r0
	strh r1, [r3]
	strh r2, [r3, #8]
	bx lr
	thumb_func_end GameCubeMultiBoot_Init

	non_word_aligned_thumb_func_start GameCubeMultiBoot_HandleSerialInterrupt
GameCubeMultiBoot_HandleSerialInterrupt: @ 0x0828D46A
	ldr r3, _0828D5C4
	ldrh r1, [r3, #0x20]
	strh r1, [r3, #0x20]
	movs r2, #0
	strb r2, [r0]
	ldr r2, [r0, #0x28]
	cmp r2, #0
	beq _0828D48C
	lsrs r1, r1, #1
	bhs _0828D48E
	mov pc, r2
_0828D480:
	movs r2, #0
	strh r2, [r3, #0x38]
_0828D484:
	str r2, [r0, #0x28]
_0828D486:
	ldr r3, _0828D5C8
	ldrh r1, [r3, #2]
	strb r1, [r0, #3]
_0828D48C:
	bx lr
_0828D48E:
	ldr r1, [r3, #0x30]
	ldr r1, _0828D5CC
	str r1, [r3, #0x34]
	movs r1, #0x10
	strh r1, [r3, #0x38]
	ldrb r1, [r0, #3]
	strb r1, [r0, #9]
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _0828D480
	ldr r1, _0828D5D0
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	add r2, pc, #0x0
	b _0828D484
	thumb_func_end GameCubeMultiBoot_HandleSerialInterrupt

	thumb_func_start GcMbIntrHandler_CheckGameCodeSent
GcMbIntrHandler_CheckGameCodeSent: @ 0x0828D4AC
	lsls r1, r1, #0x1f
	blo _0828D480
	bmi _0828D4BC
	add r2, pc, #0x4
	b _0828D484
	.align 2, 0
	thumb_func_end GcMbIntrHandler_CheckGameCodeSent

	thumb_func_start GcMbIntrHandler_CheckHandshakeResponse
GcMbIntrHandler_CheckHandshakeResponse: @ 0x0828D4B8
	lsrs r1, r1, #1
	blo _0828D480
_0828D4BC:
	ldr r1, [r3, #0x30]
	ldr r2, _0828D5CC
	cmp r1, r2
	bne _0828D480
	ldrb r1, [r0, #3]
	strb r1, [r0, #0xb]
	add r2, pc, #0x0
	b _0828D484
	thumb_func_end GcMbIntrHandler_CheckHandshakeResponse

	thumb_func_start GcMbIntrHandler_ReceiveKeyA
GcMbIntrHandler_ReceiveKeyA: @ 0x0828D4CC
	lsrs r1, r1, #1
	blo _0828D480
	ldr r1, [r3, #0x30]
	lsrs r2, r1, #0x18
	cmp r2, #0xdd
	bne _0828D480
	str r1, [r0, #4]
	ldrb r1, [r0, #1]
	strb r1, [r0, #0xa]
	movs r2, #0
	movs r3, #0
	ldr r1, [r0, #8]
	lsrs r1, r1, #8
_0828D4E6:
	lsrs r1, r1, #1
	adcs r2, r3
	cmp r1, #0
	bne _0828D4E6
	cmp r2, #0xe
	bgt _0828D4F8
	cmp r2, #7
	bge _0828D4FA
	movs r1, #0xff
_0828D4F8:
	strb r1, [r0, #0xa]
_0828D4FA:
	ldr r1, [r0, #8]
	adds r1, #0xee
	ldr r3, _0828D5C4
	str r1, [r3, #0x34]
	movs r1, #0x30
	strh r1, [r3, #0x38]
	add r2, pc, #0x4
	b _0828D484
	.align 2, 0
	thumb_func_end GcMbIntrHandler_ReceiveKeyA

	thumb_func_start GcMbIntrHandler_CheckKeyBSent
GcMbIntrHandler_CheckKeyBSent: @ 0x0828D50C
	lsls r1, r1, #0x1f
	blo _0828D480
	bmi _0828D51C
	add r2, pc, #0x4
	b _0828D484
	.align 2, 0
	thumb_func_end GcMbIntrHandler_CheckKeyBSent

	thumb_func_start GcMbIntrHandler_CheckImageSizeResponse
GcMbIntrHandler_CheckImageSizeResponse: @ 0x0828D518
	lsrs r1, r1, #1
	blo _0828D480
_0828D51C:
	ldr r1, [r3, #0x30]
	ldr r2, _0828D5BC
	cmp r1, r2
	bhs _0828D480
	adds r1, #1
	adds r1, r1, r1
	strh r1, [r0, #0x12]
	ldrb r1, [r0, #2]
	cmp r1, #0
_0828D52E:
	bne _0828D480
	ldr r1, _0828D5D0
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	add r2, pc, #0x4
	b _0828D484
	.align 2, 0
	thumb_func_end GcMbIntrHandler_CheckImageSizeResponse

	thumb_func_start GcMbIntrHandler_CheckImageResponse
GcMbIntrHandler_CheckImageResponse: @ 0x0828D53C
	lsrs r1, r1, #1
	blo _0828D480
	ldr r2, [r0, #0x24]
	movs r1, #4
	ands r1, r2
	adds r1, #8
	lsls r1, r1, #2
	strh r1, [r3, #0x38]
	ldr r1, [r3, #0x30]
	stm r2!, {r1}
	str r2, [r0, #0x24]
	ldrh r1, [r0, #0x12]
	subs r1, #1
	strh r1, [r0, #0x12]
	bne _0828D486
_0828D55A:
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	adds r1, #0xcc
	str r1, [r3, #0x34]
	add r2, pc, #0x4
	b _0828D484
	.align 2, 0
	thumb_func_end GcMbIntrHandler_CheckImageResponse

	thumb_func_start GcMbIntrHandler_CheckCounter2Sent
GcMbIntrHandler_CheckCounter2Sent: @ 0x0828D568
	lsls r1, r1, #0x1f
_0828D56A:
	blo _0828D480
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _0828D55A
	str r1, [r3, #0x34]
	add r2, pc, #0x0
	b _0828D484
	thumb_func_end GcMbIntrHandler_CheckCounter2Sent

	thumb_func_start GcMbIntrHandler_CheckKeyCDerivationSent
GcMbIntrHandler_CheckKeyCDerivationSent: @ 0x0828D578
	lsls r1, r1, #0x1f
	blo _0828D56A
	bmi _0828D588
	add r2, pc, #0x4
	b _0828D484
	.align 2, 0
	thumb_func_end GcMbIntrHandler_CheckKeyCDerivationSent

	thumb_func_start GcMbIntrHandler_CheckBootKeyResponse
GcMbIntrHandler_CheckBootKeyResponse: @ 0x0828D584
	lsrs r1, r1, #1
	blo _0828D56A
_0828D588:
	ldr r1, [r3, #0x30]
	lsrs r2, r1, #0x18
	cmp r2, #0xbb
	bne _0828D52E
	strh r1, [r0, #0x10]
	add r2, pc, #0x4
	b _0828D484
	.align 2, 0
	thumb_func_end GcMbIntrHandler_CheckBootKeyResponse

	thumb_func_start GcMbIntrHandler_StopUnconditionally
GcMbIntrHandler_StopUnconditionally: @ 0x0828D598
	b _0828D480
	thumb_func_end GcMbIntrHandler_StopUnconditionally

	non_word_aligned_thumb_func_start GameCubeMultiBoot_Quit
GameCubeMultiBoot_Quit: @ 0x0828D59A
	ldr r3, _0828D5C0
	ldrh r2, [r3, #8]
	movs r1, #0
	strh r1, [r3, #8]
	ldr r3, _0828D5C4
	movs r0, #7
	strh r0, [r3, #0x20]
	lsls r0, r3, #0xa
	strh r0, [r3, #0x14]
	ldr r3, _0828D5C0
	movs r0, #0x80
	strh r0, [r3, #2]
	ldrh r1, [r3]
	bics r1, r0
	strh r1, [r3]
	strh r2, [r3, #8]
	bx lr
	.align 2, 0
_0828D5BC: .4byte 0x00004000
_0828D5C0: .4byte 0x04000200
_0828D5C4: .4byte 0x04000120
_0828D5C8: .4byte 0x04000004
_0828D5CC: .4byte 0x4A565841
_0828D5D0: .4byte 0x02000000
	thumb_func_end GameCubeMultiBoot_Quit

