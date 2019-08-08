.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetCurrentMapRotatingGatePuzzleType
GetCurrentMapRotatingGatePuzzleType: @ 0x080FC058
	push {lr}
	ldr r0, _080FC06C
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x86
	lsls r0, r0, #1
	cmp r1, r0
	bne _080FC070
	movs r0, #1
	b _080FC082
	.align 2, 0
_080FC06C: .4byte 0x03005AEC
_080FC070:
	ldr r0, _080FC07C
	cmp r1, r0
	beq _080FC080
	movs r0, #0
	b _080FC082
	.align 2, 0
_080FC07C: .4byte 0x0000081D
_080FC080:
	movs r0, #2
_080FC082:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetCurrentMapRotatingGatePuzzleType

	thumb_func_start RotatingGate_ResetAllGateOrientations
RotatingGate_ResetAllGateOrientations: @ 0x080FC088
	push {r4, r5, r6, lr}
	movs r0, #0x80
	lsls r0, r0, #7
	bl GetVarPointer
	adds r5, r0, #0
	movs r3, #0
	ldr r4, _080FC0BC
	ldrb r0, [r4]
	cmp r3, r0
	bge _080FC0B4
	ldr r6, _080FC0C0
_080FC0A0:
	adds r2, r5, r3
	ldr r1, [r6]
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	strb r0, [r2]
	adds r3, #1
	ldrb r0, [r4]
	cmp r3, r0
	blt _080FC0A0
_080FC0B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FC0BC: .4byte 0x02039D14
_080FC0C0: .4byte 0x02039D10
	thumb_func_end RotatingGate_ResetAllGateOrientations

	thumb_func_start RotatingGate_GetGateOrientation
RotatingGate_GetGateOrientation: @ 0x080FC0C4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x80
	lsls r0, r0, #7
	bl GetVarPointer
	adds r0, r0, r4
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RotatingGate_GetGateOrientation

	thumb_func_start RotatingGate_SetGateOrientation
RotatingGate_SetGateOrientation: @ 0x080FC0E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0x80
	lsls r0, r0, #7
	bl GetVarPointer
	adds r0, r0, r4
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end RotatingGate_SetGateOrientation

	thumb_func_start RotatingGate_RotateInDirection
RotatingGate_RotateInDirection: @ 0x080FC100
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl RotatingGate_GetGateOrientation
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r4, #1
	bne _080FC124
	cmp r1, #0
	beq _080FC120
	subs r0, r1, #1
	lsls r0, r0, #0x18
	b _080FC12E
_080FC120:
	movs r1, #3
	b _080FC130
_080FC124:
	adds r1, #1
	lsls r1, r1, #0x18
	movs r0, #0xc0
	lsls r0, r0, #0x12
	ands r0, r1
_080FC12E:
	lsrs r1, r0, #0x18
_080FC130:
	adds r0, r5, #0
	bl RotatingGate_SetGateOrientation
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end RotatingGate_RotateInDirection

	thumb_func_start RotatingGate_LoadPuzzleConfig
RotatingGate_LoadPuzzleConfig: @ 0x080FC13C
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, #1
	beq _080FC150
	cmp r0, #1
	ble _080FC184
	cmp r0, #2
	beq _080FC168
	b _080FC184
_080FC150:
	ldr r1, _080FC15C
	ldr r0, _080FC160
	str r0, [r1]
	ldr r1, _080FC164
	movs r0, #8
	b _080FC172
	.align 2, 0
_080FC15C: .4byte 0x02039D10
_080FC160: .4byte 0x0856A494
_080FC164: .4byte 0x02039D14
_080FC168:
	ldr r1, _080FC188
	ldr r0, _080FC18C
	str r0, [r1]
	ldr r1, _080FC190
	movs r0, #0xb
_080FC172:
	strb r0, [r1]
	movs r1, #0
	ldr r3, _080FC194
	movs r2, #0x40
_080FC17A:
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #0xa
	bls _080FC17A
_080FC184:
	pop {r0}
	bx r0
	.align 2, 0
_080FC188: .4byte 0x02039D10
_080FC18C: .4byte 0x0856A4D4
_080FC190: .4byte 0x02039D14
_080FC194: .4byte 0x02039D04
	thumb_func_end RotatingGate_LoadPuzzleConfig

	thumb_func_start RotatingGate_CreateGatesWithinViewport
RotatingGate_CreateGatesWithinViewport: @ 0x080FC198
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldr r0, _080FC25C
	ldr r2, [r0]
	ldrh r1, [r2]
	subs r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r1, #0x11
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldrh r1, [r2, #2]
	subs r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r1, #0xe
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r5, #0
	ldr r0, _080FC260
	ldrb r0, [r0]
	cmp r5, r0
	bhs _080FC24A
	lsls r0, r2, #0x10
	asrs r7, r0, #0x10
	lsls r0, r3, #0x10
	asrs r6, r0, #0x10
_080FC1E6:
	ldr r0, _080FC264
	ldr r0, [r0]
	lsls r1, r5, #3
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r1, #2]
	adds r0, #7
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r7, r1
	bgt _080FC23C
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	blt _080FC23C
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	cmp r6, r1
	bgt _080FC23C
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	blt _080FC23C
	ldr r0, _080FC268
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, #0x40
	bne _080FC23C
	ldr r3, [sp]
	lsls r1, r3, #0x10
	mov r0, sl
	lsls r2, r0, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl RotatingGate_CreateGate
	strb r0, [r4]
_080FC23C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080FC260
	ldrb r0, [r0]
	cmp r5, r0
	blo _080FC1E6
_080FC24A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC25C: .4byte 0x03005AEC
_080FC260: .4byte 0x02039D14
_080FC264: .4byte 0x02039D10
_080FC268: .4byte 0x02039D04
	thumb_func_end RotatingGate_CreateGatesWithinViewport

	thumb_func_start RotatingGate_CreateGate
RotatingGate_CreateGate: @ 0x080FC26C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r0, _080FC29C
	lsls r1, r6, #3
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _080FC294
	cmp r0, #4
	bne _080FC2A4
_080FC294:
	mov r1, sp
	ldr r0, _080FC2A0
	b _080FC2A8
	.align 2, 0
_080FC29C: .4byte 0x02039D10
_080FC2A0: .4byte 0x0856DBC4
_080FC2A4:
	mov r1, sp
	ldr r0, _080FC33C
_080FC2A8:
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	mov r2, sp
	ldrb r0, [r4, #4]
	movs r3, #0x98
	lsls r3, r3, #5
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r2]
	mov r0, sp
	movs r1, #0
	movs r2, #0
	movs r3, #0x94
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x40
	beq _080FC344
	ldrh r0, [r4]
	adds r0, #7
	ldrh r1, [r4, #2]
	adds r1, #7
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r2, _080FC340
	adds r4, r4, r2
	strh r6, [r4, #0x2e]
	movs r2, #0x3e
	adds r2, r2, r4
	mov ip, r2
	ldrb r2, [r2]
	movs r3, #2
	orrs r2, r3
	mov r3, ip
	strb r2, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	bl sub_08092960
	adds r0, r4, #0
	bl RotatingGate_HideGatesOutsideViewport
	adds r0, r6, #0
	bl RotatingGate_GetGateOrientation
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAffineAnim
	adds r0, r5, #0
	b _080FC346
	.align 2, 0
_080FC33C: .4byte 0x0856DBAC
_080FC340: .4byte 0x020205AC
_080FC344:
	movs r0, #0x40
_080FC346:
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RotatingGate_CreateGate

	thumb_func_start SpriteCallback_RotatingGate
SpriteCallback_RotatingGate: @ 0x080FC354
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x30]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	adds r0, r6, #0
	bl RotatingGate_HideGatesOutsideViewport
	cmp r5, #1
	bne _080FC39A
	adds r0, r4, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl GetPlayerSpeed
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080FC38A
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080FC38A:
	movs r0, #0x30
	bl PlaySE
	adds r0, r6, #0
	adds r1, r4, #0
	bl StartSpriteAffineAnim
	b _080FC3C8
_080FC39A:
	cmp r5, #2
	bne _080FC3C8
	adds r0, r7, #0
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl GetPlayerSpeed
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080FC3BA
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080FC3BA:
	movs r0, #0x30
	bl PlaySE
	adds r0, r6, #0
	adds r1, r4, #0
	bl StartSpriteAffineAnim
_080FC3C8:
	movs r0, #0
	strh r0, [r6, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCallback_RotatingGate

	thumb_func_start RotatingGate_HideGatesOutsideViewport
RotatingGate_HideGatesOutsideViewport: @ 0x080FC3D4
	push {r4, r5, r6, lr}
	mov ip, r0
	mov r4, ip
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r5, #5
	rsbs r5, r5, #0
	ands r5, r0
	strb r5, [r4]
	mov r0, ip
	ldrh r1, [r0, #0x24]
	ldrh r2, [r0, #0x20]
	adds r1, r1, r2
	adds r0, #0x28
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080FC468
	adds r2, r2, r1
	ldrh r0, [r0]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	mov r3, ip
	ldrh r1, [r3, #0x26]
	ldrh r0, [r3, #0x22]
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _080FC46C
	adds r0, r0, r1
	ldrh r3, [r3]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #0xf
	adds r1, r2, r3
	lsrs r1, r1, #0x10
	lsrs r6, r0, #0x10
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0xff
	bgt _080FC43A
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080FC442
_080FC43A:
	movs r1, #4
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4]
_080FC442:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xaf
	bgt _080FC456
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080FC462
_080FC456:
	mov r0, ip
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080FC462:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FC468: .4byte 0x02021B38
_080FC46C: .4byte 0x02021B3A
	thumb_func_end RotatingGate_HideGatesOutsideViewport

	thumb_func_start LoadRotatingGatePics
LoadRotatingGatePics: @ 0x080FC470
	push {lr}
	ldr r0, _080FC47C
	bl LoadSpriteSheets
	pop {r0}
	bx r0
	.align 2, 0
_080FC47C: .4byte 0x0856D93C
	thumb_func_end LoadRotatingGatePics

	thumb_func_start RotatingGate_DestroyGatesOutsideViewport
RotatingGate_DestroyGatesOutsideViewport: @ 0x080FC480
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080FC4B4
	ldr r2, [r0]
	ldrh r1, [r2]
	subs r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	adds r1, #0x11
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldrh r1, [r2, #2]
	subs r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r1, #0xe
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r6, #0
	b _080FC526
	.align 2, 0
_080FC4B4: .4byte 0x03005AEC
_080FC4B8:
	ldr r0, _080FC53C
	ldr r0, [r0]
	lsls r1, r6, #3
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r1, #2]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080FC540
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0x40
	beq _080FC524
	lsls r0, r2, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r2, r0, #0x10
	cmp r0, r1
	blt _080FC504
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bgt _080FC504
	lsls r0, r3, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r2, r0, #0x10
	cmp r0, r1
	blt _080FC504
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	ble _080FC524
_080FC504:
	ldr r0, _080FC540
	adds r5, r6, r0
	ldrb r0, [r5]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080FC544
	adds r4, r4, r0
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	movs r0, #0x40
	strb r0, [r5]
_080FC524:
	adds r6, #1
_080FC526:
	ldr r0, _080FC548
	ldrb r0, [r0]
	cmp r6, r0
	blt _080FC4B8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC53C: .4byte 0x02039D10
_080FC540: .4byte 0x02039D04
_080FC544: .4byte 0x020205AC
_080FC548: .4byte 0x02039D14
	thumb_func_end RotatingGate_DestroyGatesOutsideViewport

	thumb_func_start RotatingGate_CanRotate
RotatingGate_CanRotate: @ 0x080FC54C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #1
	bne _080FC56C
	ldr r0, _080FC568
	mov sl, r0
	b _080FC578
	.align 2, 0
_080FC568: .4byte 0x0856DC3C
_080FC56C:
	cmp r1, #2
	beq _080FC574
_080FC570:
	movs r0, #0
	b _080FC608
_080FC574:
	ldr r1, _080FC618
	mov sl, r1
_080FC578:
	adds r0, r4, #0
	bl RotatingGate_GetGateOrientation
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _080FC61C
	ldr r1, [r0]
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	ldrh r1, [r0]
	adds r1, #7
	ldrh r0, [r0, #2]
	adds r0, #7
	movs r3, #0
	lsls r2, r2, #3
	str r2, [sp, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov sb, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_080FC5A8:
	movs r6, #0
	ldr r2, [sp]
	adds r7, r2, r3
	lsls r0, r3, #1
	adds r5, r7, #0
	ldr r1, [sp, #4]
	adds r0, r0, r1
	ldr r2, _080FC620
	adds r4, r0, r2
_080FC5BA:
	adds r0, r5, #0
	cmp r5, #0
	bge _080FC5C2
	adds r0, r7, #3
_080FC5C2:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r4]
	cmp r0, #0
	beq _080FC5F8
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	add r0, sb
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	add r1, r8
	str r3, [sp, #8]
	bl MapGridIsImpassableAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #8]
	cmp r0, #1
	beq _080FC570
_080FC5F8:
	adds r4, #1
	adds r6, #1
	cmp r6, #1
	ble _080FC5BA
	adds r3, #1
	cmp r3, #3
	ble _080FC5A8
	movs r0, #1
_080FC608:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FC618: .4byte 0x0856DC1C
_080FC61C: .4byte 0x02039D10
_080FC620: .4byte 0x0856DC5C
	thumb_func_end RotatingGate_CanRotate

	thumb_func_start RotatingGate_HasArm
RotatingGate_HasArm: @ 0x080FC624
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	lsrs r4, r4, #0x19
	movs r0, #1
	ands r5, r0
	adds r0, r6, #0
	bl RotatingGate_GetGateOrientation
	subs r4, r4, r0
	adds r1, r4, #4
	adds r0, r1, #0
	cmp r1, #0
	bge _080FC64A
	adds r0, r4, #7
_080FC64A:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	ldr r1, _080FC670
	ldr r2, [r1]
	lsls r1, r6, #3
	adds r1, r1, r2
	ldrb r1, [r1, #4]
	ldr r2, _080FC674
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	adds r0, r0, r5
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080FC670: .4byte 0x02039D10
_080FC674: .4byte 0x0856DC5C
	thumb_func_end RotatingGate_HasArm

	thumb_func_start RotatingGate_TriggerRotationAnimation
RotatingGate_TriggerRotationAnimation: @ 0x080FC678
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080FC6A4
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, #0x40
	beq _080FC69C
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080FC6A8
	adds r4, r4, r0
	strh r1, [r4, #0x30]
	adds r0, r3, #0
	bl RotatingGate_GetGateOrientation
	strh r0, [r4, #0x32]
_080FC69C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC6A4: .4byte 0x02039D04
_080FC6A8: .4byte 0x020205AC
	thumb_func_end RotatingGate_TriggerRotationAnimation

	thumb_func_start RotatingGate_GetRotationInfo
RotatingGate_GetRotationInfo: @ 0x080FC6AC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #2
	bne _080FC6C8
	ldr r3, _080FC6C4
	b _080FC6EA
	.align 2, 0
_080FC6C4: .4byte 0x0856DBDC
_080FC6C8:
	cmp r0, #1
	bne _080FC6D4
	ldr r3, _080FC6D0
	b _080FC6EA
	.align 2, 0
_080FC6D0: .4byte 0x0856DBEC
_080FC6D4:
	cmp r0, #3
	bne _080FC6E0
	ldr r3, _080FC6DC
	b _080FC6EA
	.align 2, 0
_080FC6DC: .4byte 0x0856DBFC
_080FC6E0:
	cmp r3, #4
	beq _080FC6E8
	movs r0, #0xff
	b _080FC6F8
_080FC6E8:
	ldr r3, _080FC6FC
_080FC6EA:
	lsls r0, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r0, r0, #0xe
	adds r0, r0, r1
	adds r0, r3, r0
	ldrb r0, [r0]
_080FC6F8:
	pop {r1}
	bx r1
	.align 2, 0
_080FC6FC: .4byte 0x0856DC0C
	thumb_func_end RotatingGate_GetRotationInfo

	thumb_func_start RotatingGate_InitPuzzle
RotatingGate_InitPuzzle: @ 0x080FC700
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, #0
	beq _080FC712
	bl RotatingGate_LoadPuzzleConfig
	bl RotatingGate_ResetAllGateOrientations
_080FC712:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RotatingGate_InitPuzzle

	thumb_func_start RotatingGatePuzzleCameraUpdate
RotatingGatePuzzleCameraUpdate: @ 0x080FC718
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, #0
	beq _080FC73A
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl RotatingGate_CreateGatesWithinViewport
	bl RotatingGate_DestroyGatesOutsideViewport
_080FC73A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end RotatingGatePuzzleCameraUpdate

	thumb_func_start RotatingGate_InitPuzzleAndGraphics
RotatingGate_InitPuzzleAndGraphics: @ 0x080FC740
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, #0
	beq _080FC75A
	bl LoadRotatingGatePics
	bl RotatingGate_LoadPuzzleConfig
	movs r0, #0
	movs r1, #0
	bl RotatingGate_CreateGatesWithinViewport
_080FC75A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RotatingGate_InitPuzzleAndGraphics

	thumb_func_start CheckForRotatingGatePuzzleCollision
CheckForRotatingGatePuzzleCollision: @ 0x080FC760
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, #0
	bne _080FC794
	b _080FC832
_080FC782:
	adds r0, r4, #0
	adds r1, r5, #0
	bl RotatingGate_TriggerRotationAnimation
	adds r0, r4, #0
	adds r1, r5, #0
	bl RotatingGate_RotateInDirection
	b _080FC832
_080FC794:
	movs r6, #0
	ldr r0, _080FC820
	ldrb r0, [r0]
	cmp r6, r0
	bge _080FC832
	lsls r0, r4, #0x10
	asrs r7, r0, #0x10
_080FC7A2:
	ldr r0, _080FC824
	ldr r1, [r0]
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #7
	ldrh r0, [r0, #2]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	subs r0, r4, #2
	cmp r0, r7
	bgt _080FC828
	adds r0, r4, #1
	cmp r7, r0
	bgt _080FC828
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	subs r1, r3, #2
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _080FC828
	adds r0, r3, #1
	cmp r2, r0
	bgt _080FC828
	subs r1, r7, r4
	adds r1, #2
	subs r2, r2, r3
	adds r2, #2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sb
	bl RotatingGate_GetRotationInfo
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _080FC828
	lsrs r5, r0, #4
	movs r1, #0xf
	ands r1, r0
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl RotatingGate_HasArm
	cmp r0, #0
	beq _080FC828
	adds r0, r4, #0
	adds r1, r5, #0
	bl RotatingGate_CanRotate
	cmp r0, #0
	bne _080FC782
	movs r0, #1
	b _080FC834
	.align 2, 0
_080FC820: .4byte 0x02039D14
_080FC824: .4byte 0x02039D10
_080FC828:
	adds r6, #1
	ldr r0, _080FC840
	ldrb r0, [r0]
	cmp r6, r0
	blt _080FC7A2
_080FC832:
	movs r0, #0
_080FC834:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FC840: .4byte 0x02039D14
	thumb_func_end CheckForRotatingGatePuzzleCollision

	thumb_func_start CheckForRotatingGatePuzzleCollisionWithoutAnimation
CheckForRotatingGatePuzzleCollisionWithoutAnimation: @ 0x080FC844
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, #0
	bne _080FC86A
	b _080FC8FA
_080FC866:
	movs r0, #1
	b _080FC8FC
_080FC86A:
	movs r6, #0
	ldr r0, _080FC908
	ldrb r0, [r0]
	cmp r6, r0
	bge _080FC8FA
	lsls r0, r4, #0x10
	asrs r7, r0, #0x10
_080FC878:
	ldr r0, _080FC90C
	ldr r1, [r0]
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #7
	ldrh r0, [r0, #2]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	subs r0, r4, #2
	cmp r0, r7
	bgt _080FC8F0
	adds r0, r4, #1
	cmp r7, r0
	bgt _080FC8F0
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	subs r1, r3, #2
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _080FC8F0
	adds r0, r3, #1
	cmp r2, r0
	bgt _080FC8F0
	subs r1, r7, r4
	adds r1, #2
	subs r2, r2, r3
	adds r2, #2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sb
	bl RotatingGate_GetRotationInfo
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _080FC8F0
	lsrs r5, r0, #4
	movs r1, #0xf
	ands r1, r0
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl RotatingGate_HasArm
	cmp r0, #0
	beq _080FC8F0
	adds r0, r4, #0
	adds r1, r5, #0
	bl RotatingGate_CanRotate
	cmp r0, #0
	beq _080FC866
_080FC8F0:
	adds r6, #1
	ldr r0, _080FC908
	ldrb r0, [r0]
	cmp r6, r0
	blt _080FC878
_080FC8FA:
	movs r0, #0
_080FC8FC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080FC908: .4byte 0x02039D14
_080FC90C: .4byte 0x02039D10
	thumb_func_end CheckForRotatingGatePuzzleCollisionWithoutAnimation

