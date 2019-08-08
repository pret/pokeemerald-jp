.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start MonAnimDummySpriteCallback
MonAnimDummySpriteCallback: @ 0x0817F298
	bx lr
	.align 2, 0
	thumb_func_end MonAnimDummySpriteCallback

	thumb_func_start sub_0817F29C
sub_0817F29C: @ 0x0817F29C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r5, r2, #0
	adds r4, r3, #0
	lsls r5, r5, #0x10
	rsbs r5, r5, #0
	lsls r4, r4, #0x10
	rsbs r4, r4, #0
	lsrs r4, r4, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	asrs r5, r5, #0x10
	adds r1, r5, #0
	bl Cos
	adds r6, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl Sin
	subs r6, r6, r0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl Cos
	adds r2, r0, #0
	mov r0, r8
	adds r1, r5, #0
	str r2, [sp]
	bl Sin
	ldr r2, [sp]
	adds r2, r2, r0
	rsbs r5, r5, #0
	rsbs r4, r4, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r6, r6, r5
	mov r0, sb
	strh r6, [r0, #0x24]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r2, r2, r4
	strh r2, [r0, #0x26]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0817F29C

	thumb_func_start GetSpeciesBackAnimSet
GetSpeciesBackAnimSet: @ 0x0817F320
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0817F334
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0817F338
	movs r0, #0
	b _0817F33E
	.align 2, 0
_0817F334: .4byte 0x085D3328
_0817F338:
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0817F33E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetSpeciesBackAnimSet

	thumb_func_start Task_HandleMonAnimation
Task_HandleMonAnimation: @ 0x0817F344
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0817F3E0
	lsls r6, r5, #2
	adds r0, r6, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	lsls r3, r0, #0x10
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	orrs r3, r0
	movs r0, #8
	ldrsh r4, [r2, r0]
	mov r8, r1
	ldr r0, _0817F3E4
	mov ip, r0
	cmp r4, #0
	bne _0817F3B4
	ldrh r0, [r3, #0x2e]
	strh r0, [r2, #0x10]
	ldrh r0, [r3, #0x32]
	strh r0, [r2, #0x12]
	movs r0, #1
	strh r0, [r3, #0x30]
	strh r4, [r3, #0x2e]
	movs r0, #2
	adds r1, r6, #0
	ldr r6, _0817F3E8
	ldr r7, _0817F3EC
	movs r4, #0
	adds r2, r3, #0
	adds r2, #0x32
_0817F38E:
	strh r4, [r2]
	adds r2, #2
	adds r0, #1
	cmp r0, #7
	bls _0817F38E
	adds r1, r1, r5
	lsls r1, r1, #3
	add r1, r8
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r3, #0x1c]
	movs r0, #0
	str r0, [r7]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_0817F3B4:
	ldr r0, [r3, #0x1c]
	cmp r0, ip
	bne _0817F3D4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #0x10]
	movs r2, #0
	strh r1, [r3, #0x2e]
	ldrh r0, [r0, #0x12]
	strh r0, [r3, #0x32]
	strh r2, [r3, #0x30]
	adds r0, r5, #0
	bl DestroyTask
_0817F3D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817F3E0: .4byte 0x03005B60
_0817F3E4: .4byte 0x08007141
_0817F3E8: .4byte 0x085D34E8
_0817F3EC: .4byte 0x03001274
	thumb_func_end Task_HandleMonAnimation

	thumb_func_start LaunchAnimationTaskForFrontSprite
LaunchAnimationTaskForFrontSprite: @ 0x0817F3F0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0817F41C
	movs r1, #0x80
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817F420
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	lsrs r0, r5, #0x10
	strh r0, [r1, #0xa]
	strh r5, [r1, #0xc]
	strh r4, [r1, #0xe]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817F41C: .4byte 0x0817F345
_0817F420: .4byte 0x03005B60
	thumb_func_end LaunchAnimationTaskForFrontSprite

	thumb_func_start StartMonSummaryAnimation
StartMonSummaryAnimation: @ 0x0817F424
	lsls r1, r1, #0x18
	ldr r3, _0817F438
	movs r2, #1
	str r2, [r3]
	ldr r2, _0817F43C
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_0817F438: .4byte 0x03001274
_0817F43C: .4byte 0x085D34E8
	thumb_func_end StartMonSummaryAnimation

	thumb_func_start LaunchAnimationTaskForBackSprite
LaunchAnimationTaskForBackSprite: @ 0x0817F440
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r6, r1, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0817F4A0
	movs r1, #0x80
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0817F4A4
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	lsrs r0, r5, #0x10
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldrh r0, [r5, #0x2e]
	lsls r0, r0, #0x18
	ldr r1, _0817F4A8
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0817F4AC
	adds r0, r0, r1
	bl GetNature
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r6, #1
	ldr r2, _0817F4B0
	adds r0, r0, r2
	adds r1, r1, r6
	ldrb r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0817F4B4
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r4, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817F4A0: .4byte 0x0817F345
_0817F4A4: .4byte 0x03005B60
_0817F4A8: .4byte 0x02023D12
_0817F4AC: .4byte 0x02024190
_0817F4B0: .4byte 0x085D378F
_0817F4B4: .4byte 0x085D3744
	thumb_func_end LaunchAnimationTaskForBackSprite

	thumb_func_start SetSpriteCB_MonAnimDummy
SetSpriteCB_MonAnimDummy: @ 0x0817F4B8
	ldr r1, _0817F4C0
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_0817F4C0: .4byte 0x0817F299
	thumb_func_end SetSpriteCB_MonAnimDummy

	thumb_func_start SetAffineData
SetAffineData: @ 0x0817F4C4
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r4, _0817F514
	lsls r2, r2, #0x10
	lsrs r1, r1, #0x10
	orrs r1, r2
	str r1, [sp]
	ldr r1, [sp, #4]
	ands r1, r4
	orrs r1, r3
	str r1, [sp, #4]
	ldrb r4, [r0, #3]
	lsls r4, r4, #0x1a
	lsrs r4, r4, #0x1b
	add r5, sp, #8
	mov r0, sp
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldr r0, _0817F518
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	ldrh r0, [r5, #4]
	strh r0, [r4, #4]
	ldrh r0, [r5, #6]
	strh r0, [r4, #6]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817F514: .4byte 0xFFFF0000
_0817F518: .4byte 0x02021B3C
	thumb_func_end SetAffineData

	thumb_func_start HandleStartAffineAnim
HandleStartAffineAnim: @ 0x0817F51C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, _0817F54C
	str r0, [r4, #0x10]
	ldr r0, _0817F550
	ldr r0, [r0]
	cmp r0, #1
	bne _0817F53A
	adds r0, r4, #0
	bl InitSpriteAffineAnim
_0817F53A:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0817F554
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	b _0817F55C
	.align 2, 0
_0817F54C: .4byte 0x085D37C8
_0817F550: .4byte 0x03001274
_0817F554:
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAffineAnim
_0817F55C:
	ldrb r3, [r4, #1]
	lsrs r1, r3, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r4, #0
	bl CalcCenterToCornerVec
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end HandleStartAffineAnim

	thumb_func_start HandleSetAffineData
HandleSetAffineData: @ 0x0817F580
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bne _0817F5A4
	lsls r0, r1, #0x10
	rsbs r0, r0, #0
	lsrs r1, r0, #0x10
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0817F5A4:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl SetAffineData
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end HandleSetAffineData

	thumb_func_start sub_0817F5B8
sub_0817F5B8: @ 0x0817F5B8
	push {lr}
	adds r1, r0, #0
	movs r2, #0x30
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0817F5CC
	movs r2, #0x24
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #0x24]
_0817F5CC:
	pop {r0}
	bx r0
	thumb_func_end sub_0817F5B8

	thumb_func_start sub_0817F5D0
sub_0817F5D0: @ 0x0817F5D0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0817F5FC
	ldr r1, _0817F5F8
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	strh r2, [r0, #6]
	strh r2, [r0]
	movs r1, #1
	strh r1, [r0, #4]
	strh r2, [r0, #2]
	strh r2, [r0, #8]
	movs r0, #1
	b _0817F5FE
	.align 2, 0
_0817F5F8: .4byte 0x03001240
_0817F5FC:
	movs r0, #0
_0817F5FE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0817F5D0

	thumb_func_start sub_0817F604
sub_0817F604: @ 0x0817F604
	push {r4, lr}
	ldr r4, _0817F624
	ldrb r1, [r4]
	adds r2, r1, #1
	adds r0, r2, #0
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r2, r0
	strb r0, [r4]
	ldrb r0, [r4]
	bl sub_0817F5D0
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0817F624: .4byte 0x03001270
	thumb_func_end sub_0817F604

	thumb_func_start sub_0817F628
sub_0817F628: @ 0x0817F628
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #1]
	movs r3, #4
	rsbs r3, r3, #0
	ands r3, r0
	movs r5, #1
	orrs r3, r5
	strb r3, [r4, #1]
	lsrs r1, r3, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r4, #0
	bl CalcCenterToCornerVec
	ldr r0, _0817F668
	ldr r0, [r0]
	cmp r0, #1
	bne _0817F6AC
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0817F66C
	adds r1, r4, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r5, r1, #0
	b _0817F67C
	.align 2, 0
_0817F668: .4byte 0x03001274
_0817F66C:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	adds r5, r0, #0
_0817F67C:
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r2, [r4, #3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1b
	ldrb r0, [r5]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	orrs r1, r0
	lsls r1, r1, #1
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
_0817F6AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0817F628

	thumb_func_start pokemonanimfunc_01
pokemonanimfunc_01: @ 0x0817F6B4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0817F6C6
	adds r0, r6, #0
	bl HandleStartAffineAnim
_0817F6C6:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0x28
	ble _0817F6EC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _0817F6E8
	str r0, [r6, #0x1c]
	b _0817F738
	.align 2, 0
_0817F6E8: .4byte 0x08184C35
_0817F6EC:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	lsls r0, r0, #9
	movs r1, #0x28
	bl __divsi3
	adds r4, r0, #0
	cmp r0, #0
	bge _0817F700
	adds r4, #0xff
_0817F700:
	asrs r4, r4, #8
	lsls r4, r4, #8
	subs r4, r0, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x20
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r5, r1, #0
	adds r0, r0, r5
	strh r0, [r6, #0x36]
	adds r0, r4, #0
	movs r1, #0x20
	bl Cos
	adds r0, r0, r5
	strh r0, [r6, #0x38]
	movs r0, #0x36
	ldrsh r1, [r6, r0]
	movs r0, #0x38
	ldrsh r2, [r6, r0]
	adds r0, r6, #0
	movs r3, #0
	bl HandleSetAffineData
_0817F738:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_01

	thumb_func_start pokemonanimfunc_02
pokemonanimfunc_02: @ 0x0817F744
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	ble _0817F760
	ldr r0, _0817F75C
	str r0, [r4, #0x1c]
	movs r0, #0
	b _0817F79A
	.align 2, 0
_0817F75C: .4byte 0x08184C35
_0817F760:
	movs r0, #1
	ands r0, r1
	movs r5, #0xff
	cmp r0, #0
	bne _0817F76C
	movs r5, #1
_0817F76C:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	lsls r0, r0, #7
	movs r1, #0x28
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0817F780
	adds r0, #0xff
_0817F780:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #6
	bl Sin
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
_0817F79A:
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_02

	thumb_func_start sub_0817F7A8
sub_0817F7A8: @ 0x0817F7A8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0817F7C8
	ldr r0, _0817F7C4
	str r0, [r4, #0x1c]
	movs r0, #0
	b _0817F7F2
	.align 2, 0
_0817F7C4: .4byte 0x08184C35
_0817F7C8:
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #7
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0817F7E2
	adds r0, #0xff
_0817F7E2:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #6
	bl Sin
_0817F7F2:
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0817F7A8

	thumb_func_start pokemonanimfunc_03
pokemonanimfunc_03: @ 0x0817F808
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817F7A8
	ldr r0, _0817F820
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817F820: .4byte 0x0817F7A9
	thumb_func_end pokemonanimfunc_03

	thumb_func_start sub_0817F824
sub_0817F824: @ 0x0817F824
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0817F844
	ldr r0, _0817F840
	str r0, [r4, #0x1c]
	movs r0, #0
	b _0817F870
	.align 2, 0
_0817F840: .4byte 0x08184C35
_0817F844:
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #7
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0817F85E
	adds r0, #0xff
_0817F85E:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #6
	bl Sin
	rsbs r0, r0, #0
_0817F870:
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0817F824

	thumb_func_start pokemonanimfunc_04
pokemonanimfunc_04: @ 0x0817F884
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817F824
	ldr r0, _0817F89C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817F89C: .4byte 0x0817F825
	thumb_func_end pokemonanimfunc_04

	thumb_func_start sub_0817F8A0
sub_0817F8A0: @ 0x0817F8A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	cmp r1, r0
	ble _0817F8C0
	ldr r0, _0817F8BC
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x24]
	b _0817F90A
	.align 2, 0
_0817F8BC: .4byte 0x08184C35
_0817F8C0:
	adds r0, r1, #0
	cmp r1, #0
	bge _0817F8C8
	adds r0, #0x7f
_0817F8C8:
	asrs r2, r0, #7
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0817F90C
	cmp r0, #1
	ble _0817F8F4
	cmp r0, #3
	bgt _0817F90C
	ldr r2, _0817F8F0
	adds r1, r1, r2
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #0x10
	b _0817F902
	.align 2, 0
_0817F8F0: .4byte 0xFFFFFF00
_0817F8F4:
	lsls r0, r2, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	lsls r1, r1, #0x11
_0817F902:
	asrs r1, r1, #0x10
	bl Sin
	rsbs r0, r0, #0
_0817F90A:
	strh r0, [r4, #0x26]
_0817F90C:
	ldrh r0, [r4, #0x32]
	adds r0, #0xc
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0817F8A0

	thumb_func_start pokemonanimfunc_1E
pokemonanimfunc_1E: @ 0x0817F918
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #4
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817F8A0
	ldr r0, _0817F930
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817F930: .4byte 0x0817F8A1
	thumb_func_end pokemonanimfunc_1E

	thumb_func_start pokemonanimfunc_06
pokemonanimfunc_06: @ 0x0817F934
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble _0817F954
	ldr r0, _0817F950
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x24]
	b _0817FA02
	.align 2, 0
_0817F950: .4byte 0x08184C35
_0817F954:
	adds r0, r2, #0
	cmp r2, #0
	bge _0817F95C
	adds r0, #0x7f
_0817F95C:
	lsls r0, r0, #9
	asrs r0, r0, #0x10
	cmp r0, #5
	bhi _0817F9E8
	lsls r0, r0, #2
	ldr r1, _0817F970
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0817F970: .4byte 0x0817F974
_0817F974: @ jump table
	.4byte _0817F98C @ case 0
	.4byte _0817F98C @ case 1
	.4byte _0817F990 @ case 2
	.4byte _0817F994 @ case 3
	.4byte _0817F9B0 @ case 4
	.4byte _0817F9CA @ case 5
_0817F98C:
	movs r0, #0
	b _0817F9E6
_0817F990:
	movs r2, #0
	b _0817F9E8
_0817F994:
	adds r0, r2, #0
	cmp r2, #0
	bge _0817F99C
	adds r0, #0x7f
_0817F99C:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r2, r0
	lsls r0, r0, #3
	rsbs r0, r0, #0
	cmp r0, #0
	bge _0817F9AC
	adds r0, #0x7f
_0817F9AC:
	asrs r0, r0, #7
	b _0817F9E6
_0817F9B0:
	adds r0, r2, #0
	cmp r2, #0
	bge _0817F9B8
	adds r0, #0x7f
_0817F9B8:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r2, r0
	cmp r0, #0
	bge _0817F9C4
	adds r0, #7
_0817F9C4:
	asrs r0, r0, #3
	subs r0, #8
	b _0817F9E6
_0817F9CA:
	adds r0, r2, #0
	cmp r2, #0
	bge _0817F9D2
	adds r0, #0x7f
_0817F9D2:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r2, r0
	lsls r0, r0, #3
	rsbs r0, r0, #0
	cmp r0, #0
	bge _0817F9E2
	adds r0, #0x7f
_0817F9E2:
	asrs r0, r0, #7
	adds r0, #8
_0817F9E6:
	strh r0, [r4, #0x24]
_0817F9E8:
	adds r0, r2, #0
	cmp r2, #0
	bge _0817F9F0
	adds r0, #0x7f
_0817F9F0:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
_0817FA02:
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #0xc
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_06

	thumb_func_start pokemonanimfunc_09
pokemonanimfunc_09: @ 0x0817FA10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0817FA22
	adds r0, r6, #0
	bl HandleStartAffineAnim
_0817FA22:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0x28
	ble _0817FA48
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _0817FA44
	str r0, [r6, #0x1c]
	b _0817FABE
	.align 2, 0
_0817FA44: .4byte 0x08184C35
_0817FA48:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	lsls r0, r0, #8
	movs r1, #0x28
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0817FA5C
	adds r0, #0xff
_0817FA5C:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r6, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0817FA8C
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x20
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r5, r1, #0
	adds r0, r0, r5
	strh r0, [r6, #0x36]
	adds r0, r4, #0
	movs r1, #0x20
	b _0817FAA6
_0817FA8C:
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #8
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r5, r1, #0
	adds r0, r0, r5
	strh r0, [r6, #0x36]
	adds r0, r4, #0
	movs r1, #8
_0817FAA6:
	bl Sin
	adds r0, r0, r5
	strh r0, [r6, #0x38]
	movs r0, #0x36
	ldrsh r1, [r6, r0]
	movs r0, #0x38
	ldrsh r2, [r6, r0]
	adds r0, r6, #0
	movs r3, #0
	bl HandleSetAffineData
_0817FABE:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_09

	thumb_func_start sub_0817FACC
sub_0817FACC: @ 0x0817FACC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0817FADE
	strh r0, [r4, #0x34]
_0817FADE:
	ldr r2, _0817FB04
	movs r5, #0x34
	ldrsh r1, [r4, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r2, #2
	adds r3, r0, r1
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r5, #0x32
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bne _0817FB16
	adds r0, r1, #0
	cmp r0, #0
	bne _0817FB0C
	ldr r0, _0817FB08
	str r0, [r4, #0x1c]
	b _0817FB16
	.align 2, 0
_0817FB04: .4byte 0x085D37D0
_0817FB08: .4byte 0x08184C35
_0817FB0C:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x34]
	strh r1, [r4, #0x32]
_0817FB16:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r1, r0, r1
	adds r0, r2, #2
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0817FB38
	ldr r0, _0817FB34
	str r0, [r4, #0x1c]
	b _0817FB6A
	.align 2, 0
_0817FB34: .4byte 0x08184C35
_0817FB38:
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r5, #0x34
	ldrsh r1, [r4, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_0817F5B8
_0817FB6A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0817FACC

	thumb_func_start pokemonanimfunc_0A
pokemonanimfunc_0A: @ 0x0817FB70
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817FACC
	ldr r0, _0817FB84
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817FB84: .4byte 0x0817FACD
	thumb_func_end pokemonanimfunc_0A

	thumb_func_start sub_0817FB88
sub_0817FB88: @ 0x0817FB88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r1, r0
	ble _0817FBA4
	ldr r0, _0817FBA0
	str r0, [r4, #0x1c]
	movs r0, #0
	b _0817FBBE
	.align 2, 0
_0817FBA0: .4byte 0x08184C35
_0817FBA4:
	adds r0, r1, #0
	cmp r1, #0
	bge _0817FBAC
	adds r0, #0xff
_0817FBAC:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	bl Sin
_0817FBBE:
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0817FB88

	thumb_func_start pokemonanimfunc_0F
pokemonanimfunc_0F: @ 0x0817FBD0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3c
	strh r0, [r4, #0x2e]
	movs r0, #3
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_0817FB88
	ldr r0, _0817FBEC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817FBEC: .4byte 0x0817FB89
	thumb_func_end pokemonanimfunc_0F

	thumb_func_start sub_0817FBF0
sub_0817FBF0: @ 0x0817FBF0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r1, r0
	ble _0817FC0C
	ldr r0, _0817FC08
	str r0, [r4, #0x1c]
	movs r0, #0
	b _0817FC24
	.align 2, 0
_0817FC08: .4byte 0x08184C35
_0817FC0C:
	adds r0, r1, #0
	cmp r1, #0
	bge _0817FC14
	adds r0, #0xff
_0817FC14:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #3
	bl Sin
_0817FC24:
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0817FBF0

	thumb_func_start pokemonanimfunc_10
pokemonanimfunc_10: @ 0x0817FC34
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3c
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817FBF0
	ldr r0, _0817FC4C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817FC4C: .4byte 0x0817FBF1
	thumb_func_end pokemonanimfunc_10

	thumb_func_start pokemonanimfunc_11
pokemonanimfunc_11: @ 0x0817FC50
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrh r2, [r7, #0x32]
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _0817FC74
	ldr r0, _0817FC70
	str r0, [r7, #0x1c]
	movs r0, #0
	strh r0, [r7, #0x24]
	strh r0, [r7, #0x26]
	b _0817FCD0
	.align 2, 0
_0817FC70: .4byte 0x08184C35
_0817FC74:
	movs r0, #1
	ands r0, r2
	movs r5, #0xff
	cmp r0, #0
	bne _0817FC80
	movs r5, #1
_0817FC80:
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bge _0817FC8A
	adds r0, #3
_0817FC8A:
	asrs r0, r0, #2
	movs r1, #8
	bl Sin
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	adds r4, r1, #0
	cmp r1, #0
	bge _0817FCA2
	adds r4, #0xff
_0817FCA2:
	asrs r4, r4, #8
	lsls r4, r4, #8
	subs r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	bl Sin
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r1, #0
	strh r0, [r7, #0x26]
	adds r0, r4, #0
	adds r1, r6, #0
	bl Cos
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r1, #0
	strh r0, [r7, #0x24]
_0817FCD0:
	ldrh r0, [r7, #0x32]
	adds r0, #9
	strh r0, [r7, #0x32]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_11

	thumb_func_start sub_0817FCDC
sub_0817FCDC: @ 0x0817FCDC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0817FCFC
	ldrh r6, [r4, #0x2e]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r0, r2
	ldrh r0, [r5]
	cmp r0, #0
	beq _0817FD00
	subs r0, #1
	strh r0, [r5]
	b _0817FDA4
	.align 2, 0
_0817FCFC: .4byte 0x03001240
_0817FD00:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0817FD1C
	movs r2, #8
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0817FD1C
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_0817FD1C:
	ldr r2, _0817FD5C
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r0, r2
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r2, #6
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0817FD70
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	ldrh r1, [r5, #4]
	movs r2, #4
	ldrsh r0, [r5, r2]
	cmp r0, #1
	ble _0817FD60
	subs r0, r1, #1
	movs r1, #0
	strh r0, [r5, #4]
	movs r0, #0xa
	strh r0, [r5]
	strh r1, [r4, #0x32]
	b _0817FD9E
	.align 2, 0
_0817FD5C: .4byte 0x03001240
_0817FD60:
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _0817FD6C
	str r0, [r4, #0x1c]
	b _0817FD9E
	.align 2, 0
_0817FD6C: .4byte 0x08184C35
_0817FD70:
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _0817FD7C
	adds r0, #0xff
_0817FD7C:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	bl Sin
	strh r0, [r4, #0x3a]
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3a]
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
_0817FD9E:
	ldrh r0, [r4, #0x32]
	adds r0, #0x10
	strh r0, [r4, #0x32]
_0817FDA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0817FCDC

	thumb_func_start pokemonanimfunc_12
pokemonanimfunc_12: @ 0x0817FDAC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	strh r0, [r4, #0x2e]
	ldr r2, _0817FDE0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #6]
	strh r3, [r1]
	adds r0, r4, #0
	bl sub_0817FCDC
	ldr r0, _0817FDE4
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817FDE0: .4byte 0x03001240
_0817FDE4: .4byte 0x0817FCDD
	thumb_func_end pokemonanimfunc_12

	thumb_func_start sub_0817FDE8
sub_0817FDE8: @ 0x0817FDE8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0817FE00
	adds r0, r4, #0
	bl HandleStartAffineAnim
_0817FE00:
	movs r2, #0x32
	ldrsh r6, [r4, r2]
	ldr r1, _0817FE30
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r6, r1
	ble _0817FE38
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _0817FE34
	str r0, [r4, #0x1c]
	b _0817FE56
	.align 2, 0
_0817FE30: .4byte 0x03001240
_0817FE34: .4byte 0x08184C35
_0817FE38:
	movs r2, #8
	ldrsh r1, [r0, r2]
	movs r0, #0x80
	lsls r0, r0, #9
	bl __divsi3
	muls r0, r6, r0
	strh r0, [r4, #0x3a]
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3a]
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
_0817FE56:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0817FDE8

	thumb_func_start pokemonanimfunc_1F
pokemonanimfunc_1F: @ 0x0817FE64
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _0817FE94
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x3c
	strh r0, [r1]
	movs r0, #0x14
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_0817FDE8
	ldr r0, _0817FE98
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817FE94: .4byte 0x03001240
_0817FE98: .4byte 0x0817FDE9
	thumb_func_end pokemonanimfunc_1F

	thumb_func_start sub_0817FE9C
sub_0817FE9C: @ 0x0817FE9C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r5, #0
	bl sub_0817F5B8
	ldr r1, _0817FED0
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r6, r0, r1
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r2, #6
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _0817FED8
	movs r0, #0
	strh r0, [r5, #0x24]
	strh r0, [r5, #0x26]
	ldr r0, _0817FED4
	str r0, [r5, #0x1c]
	b _0817FF16
	.align 2, 0
_0817FED0: .4byte 0x03001240
_0817FED4: .4byte 0x08184C35
_0817FED8:
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	adds r0, r1, #0
	adds r0, #0xc0
	adds r4, r0, #0
	cmp r0, #0
	bge _0817FEEA
	ldr r2, _0817FF34
	adds r4, r1, r2
_0817FEEA:
	asrs r4, r4, #8
	lsls r4, r4, #8
	subs r4, r0, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #0x11
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r5, #0x24]
	movs r2, #8
	ldrsh r1, [r6, r2]
	adds r0, r4, #0
	bl Sin
	ldrh r1, [r6, #8]
	adds r0, r0, r1
	strh r0, [r5, #0x26]
_0817FF16:
	ldr r0, _0817FF38
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	ldrh r1, [r5, #0x32]
	adds r0, r0, r1
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	bl sub_0817F5B8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817FF34: .4byte 0x000001BF
_0817FF38: .4byte 0x03001240
	thumb_func_end sub_0817FE9C

	thumb_func_start pokemonanimfunc_14
pokemonanimfunc_14: @ 0x0817FF3C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _0817FF74
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #6]
	movs r0, #6
	strh r0, [r1, #8]
	movs r0, #0x18
	strh r0, [r1, #2]
	adds r0, r4, #0
	bl sub_0817FE9C
	ldr r0, _0817FF78
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817FF74: .4byte 0x03001240
_0817FF78: .4byte 0x0817FE9D
	thumb_func_end pokemonanimfunc_14

	thumb_func_start pokemonanimfunc_15
pokemonanimfunc_15: @ 0x0817FF7C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0817FF98
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
_0817FF98:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _0817FFB8
	ldrh r0, [r4, #0x3c]
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl BlendPalette
	ldr r0, _0817FFB4
	str r0, [r4, #0x1c]
	b _0817FFD4
	.align 2, 0
_0817FFB4: .4byte 0x08184C35
_0817FFB8:
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0x10
	bl Sin
	adds r2, r0, #0
	strh r2, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0x10
	movs r3, #0
	bl BlendPalette
_0817FFD4:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_15

	thumb_func_start pokemonanimfunc_16
pokemonanimfunc_16: @ 0x0817FFE0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0817FFF4
	adds r0, r6, #0
	bl HandleStartAffineAnim
_0817FFF4:
	ldrh r5, [r6, #0x32]
	movs r2, #0x32
	ldrsh r0, [r6, r2]
	cmp r0, #0x28
	ble _0818001C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _08180018
	str r0, [r6, #0x1c]
	b _081800B0
	.align 2, 0
_08180018: .4byte 0x08184C35
_0818001C:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	lsls r0, r0, #7
	movs r1, #0x28
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _08180042
	ldrh r0, [r6, #0x3c]
	adds r0, #0x33
	strh r0, [r6, #0x3c]
	movs r7, #0xff
	ands r7, r0
_08180042:
	movs r2, #0x30
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bne _08180070
	lsls r5, r4, #0x10
	asrs r0, r5, #0x10
	movs r1, #0x28
	bl Sin
	adds r4, r0, #0
	adds r0, r7, #0
	movs r1, #0x10
	bl Sin
	ldr r1, _0818006C
	adds r0, r0, r1
	adds r4, r4, r0
	strh r4, [r6, #0x36]
	adds r4, r5, #0
	b _08180090
	.align 2, 0
_0818006C: .4byte 0xFFFFFF00
_08180070:
	adds r0, r7, #0
	movs r1, #0x10
	bl Sin
	adds r5, r0, #0
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	movs r1, #0x28
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r5
	subs r1, r1, r0
	strh r1, [r6, #0x36]
_08180090:
	asrs r0, r4, #0x10
	movs r1, #0x10
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r6, #0x38]
	movs r2, #0x36
	ldrsh r1, [r6, r2]
	movs r0, #0x38
	ldrsh r2, [r6, r0]
	adds r0, r6, #0
	movs r3, #0
	bl SetAffineData
_081800B0:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_16

	thumb_func_start pokemonanimfunc_17
pokemonanimfunc_17: @ 0x081800BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _081800D8
	adds r0, r5, #0
	bl HandleStartAffineAnim
_081800D8:
	ldrh r6, [r5, #0x32]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	cmp r0, #0x28
	ble _08180104
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r5, #0
	bl sub_0817F628
	ldr r0, _08180100
	str r0, [r5, #0x1c]
	mov r0, r8
	strh r0, [r5, #0x26]
	b _081801B6
	.align 2, 0
_08180100: .4byte 0x08184C35
_08180104:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	lsls r0, r0, #7
	movs r1, #0x28
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r6, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _0818012A
	ldrh r0, [r5, #0x3c]
	adds r0, #0x33
	strh r0, [r5, #0x3c]
	movs r7, #0xff
	ands r7, r0
_0818012A:
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0818014C
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	movs r1, #0x10
	bl Sin
	ldr r2, _08180148
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r5, #0x36]
	b _0818015E
	.align 2, 0
_08180148: .4byte 0xFFFFFF00
_0818014C:
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	movs r1, #0x10
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r5, #0x36]
_0818015E:
	adds r6, r4, #0
	adds r0, r7, #0
	movs r1, #8
	bl Sin
	adds r4, r0, #0
	asrs r0, r6, #0x10
	movs r1, #0x28
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r4, r1, r4
	subs r4, r4, r0
	strh r4, [r5, #0x38]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r4, r1
	beq _0818019C
	movs r2, #0x38
	ldrsh r0, [r5, r2]
	subs r0, r1, r0
	cmp r0, #0
	bge _08180196
	adds r0, #7
_08180196:
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x10
	mov r8, r0
_0818019C:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r5, #0x26]
	movs r2, #0x36
	ldrsh r1, [r5, r2]
	movs r0, #0x38
	ldrsh r2, [r5, r0]
	adds r0, r5, #0
	movs r3, #0
	bl SetAffineData
_081801B6:
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_17

	thumb_func_start sub_081801C8
sub_081801C8: @ 0x081801C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _08180214
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r5, [r1]
	adds r2, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	movs r1, #0
	cmp r5, #0xfe
	beq _08180204
	subs r0, r6, r7
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08180204:
	cmp r5, #0xff
	bne _0818021C
	ldr r0, _08180218
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x26]
	b _08180240
	.align 2, 0
_08180214: .4byte 0x085D34E0
_08180218: .4byte 0x08184C35
_0818021C:
	mov r0, r8
	bl Sin
	strh r0, [r4, #0x26]
	cmp r7, r6
	bne _08180232
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	movs r0, #0
	b _0818023E
_08180232:
	ldrh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x3a]
	adds r0, #1
_0818023E:
	strh r0, [r4, #0x3a]
_08180240:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081801C8

	thumb_func_start pokemonanimfunc_19
pokemonanimfunc_19: @ 0x0818024C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x30
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_081801C8
	ldr r0, _08180264
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180264: .4byte 0x081801C9
	thumb_func_end pokemonanimfunc_19

	thumb_func_start pokemonanimfunc_1A
pokemonanimfunc_1A: @ 0x08180268
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x32]
	lsls r7, r0, #0x18
	lsrs r5, r7, #0x18
	mov r8, r5
	cmp r0, #0
	bne _08180286
	adds r0, r4, #0
	bl HandleStartAffineAnim
_08180286:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x23
	ble _081802B0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _081802AC
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x24]
	b _0818030A
	.align 2, 0
_081802AC: .4byte 0x08184C35
_081802B0:
	adds r6, r5, #0
	subs r6, #0xa
	lsls r0, r6, #7
	movs r1, #0x14
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #9
	bhi _081802D6
	movs r2, #0x80
	lsls r2, r2, #1
	lsrs r3, r7, #0x19
	lsls r3, r3, #9
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	b _0818030A
_081802D6:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _081802EE
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #5
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	b _0818030A
_081802EE:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x23
	mov r0, r8
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
_0818030A:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_1A

	thumb_func_start pokemonanimfunc_1B
pokemonanimfunc_1B: @ 0x08180320
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08180332
	adds r0, r6, #0
	bl HandleStartAffineAnim
_08180332:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0x64
	ble _0818035C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r0, #0
	strh r0, [r6, #0x26]
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _08180358
	str r0, [r6, #0x1c]
	b _08180394
	.align 2, 0
_08180358: .4byte 0x08184C35
_0818035C:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	lsls r0, r0, #8
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Sin
	strh r0, [r6, #0x26]
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r1, _081803A0
	adds r0, r4, #0
	bl Sin
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r5, #0
	bl HandleSetAffineData
_08180394:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081803A0: .4byte 0x00000CCC
	thumb_func_end pokemonanimfunc_1B

	thumb_func_start sub_081803A4
sub_081803A4: @ 0x081803A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _081803B8
	adds r0, r6, #0
	bl HandleStartAffineAnim
_081803B8:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0x64
	ble _081803E0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	strh r5, [r6, #0x26]
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _081803DC
	str r0, [r6, #0x1c]
	b _0818042E
	.align 2, 0
_081803DC: .4byte 0x08184C35
_081803E0:
	movs r0, #0x32
	ldrsh r5, [r6, r0]
	lsls r0, r5, #8
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #9
	adds r0, r5, #0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r0, #0xff
	ands r5, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0x2e
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	bl Sin
	strh r0, [r6, #0x26]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r5, #0
	ldr r1, _0818043C
	bl Sin
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl HandleSetAffineData
_0818042E:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818043C: .4byte 0x00000CCC
	thumb_func_end sub_081803A4

	thumb_func_start pokemonanimfunc_1C
pokemonanimfunc_1C: @ 0x08180440
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_081803A4
	ldr r0, _08180458
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180458: .4byte 0x081803A5
	thumb_func_end pokemonanimfunc_1C

	thumb_func_start sub_0818045C
sub_0818045C: @ 0x0818045C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08180470
	adds r0, r6, #0
	bl HandleStartAffineAnim
_08180470:
	movs r2, #0x32
	ldrsh r0, [r6, r2]
	cmp r0, #0x64
	ble _08180498
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	strh r5, [r6, #0x26]
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _08180494
	str r0, [r6, #0x1c]
	b _081804F0
	.align 2, 0
_08180494: .4byte 0x08184C35
_08180498:
	movs r0, #0x32
	ldrsh r5, [r6, r0]
	lsls r0, r5, #8
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #9
	adds r0, r5, #0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r0, #0xff
	ands r5, r0
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	lsrs r4, r4, #0x1f
	adds r0, r0, r4
	asrs r0, r0, #1
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	lsls r1, r1, #0x11
	asrs r1, r1, #0x10
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r6, #0x26]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r5, #0
	ldr r1, _081804FC
	bl Sin
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl HandleSetAffineData
_081804F0:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081804FC: .4byte 0x00000CCC
	thumb_func_end sub_0818045C

	thumb_func_start pokemonanimfunc_18
pokemonanimfunc_18: @ 0x08180500
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0818045C
	ldr r0, _08180518
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180518: .4byte 0x0818045D
	thumb_func_end pokemonanimfunc_18

	thumb_func_start pokemonanimfunc_1D
pokemonanimfunc_1D: @ 0x0818051C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_0817F5B8
	movs r5, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08180534
	adds r0, r6, #0
	bl HandleStartAffineAnim
_08180534:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0x64
	ble _0818055C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	strh r5, [r6, #0x24]
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _08180558
	str r0, [r6, #0x1c]
	b _081805A8
	.align 2, 0
_08180558: .4byte 0x08184C35
_0818055C:
	movs r0, #0x32
	ldrsh r5, [r6, r0]
	lsls r0, r5, #8
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #9
	adds r0, r5, #0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r0, #0xff
	ands r5, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #8
	bl Sin
	strh r0, [r6, #0x24]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r5, #0
	ldr r1, _081805BC
	bl Sin
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl HandleSetAffineData
_081805A8:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	adds r0, r6, #0
	bl sub_0817F5B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081805BC: .4byte 0x00000CCC
	thumb_func_end pokemonanimfunc_1D

	thumb_func_start sub_081805C0
sub_081805C0: @ 0x081805C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081805D6
	adds r0, r4, #0
	bl HandleStartAffineAnim
	strh r6, [r4, #0x34]
_081805D6:
	adds r0, r4, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r2, r0
	ble _0818060C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	strh r6, [r4, #0x26]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08180608
	str r0, [r4, #0x1c]
	b _081806AA
	.align 2, 0
_08180608: .4byte 0x08184C35
_0818060C:
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #0x20
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _08180642
	adds r2, r0, #0
	lsls r0, r2, #1
	cmp r1, r0
	bge _08180642
	movs r0, #0x80
	adds r1, r2, #0
	bl __divsi3
	ldrh r1, [r4, #0x34]
	adds r1, r1, r0
	strh r1, [r4, #0x34]
_08180642:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r5, r0, #0
	cmp r1, r2
	ble _0818065C
	subs r0, r2, r1
	cmp r0, #0
	bge _08180658
	adds r0, #7
_08180658:
	lsls r0, r0, #0xd
	lsrs r6, r0, #0x10
_0818065C:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Sin
	rsbs r0, r0, #0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x26]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	movs r1, #0x20
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r2, r5, #0x10
	adds r0, r4, #0
	movs r3, #0
	bl HandleSetAffineData
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	bl __divsi3
	ldrh r1, [r4, #0x36]
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	strh r1, [r4, #0x36]
_081806AA:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081805C0

	thumb_func_start pokemonanimfunc_00
pokemonanimfunc_00: @ 0x081806B8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_081805C0
	ldr r0, _081806D0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081806D0: .4byte 0x081805C1
	thumb_func_end pokemonanimfunc_00

	thumb_func_start sub_081806D4
sub_081806D4: @ 0x081806D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r0, #0x32
	ldrsh r4, [r5, r0]
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	movs r0, #0x80
	bl __divsi3
	movs r2, #0x3c
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	cmp r4, r0
	ble _08180714
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	strh r6, [r5, #0x26]
	adds r0, r5, #0
	bl sub_0817F628
	ldr r0, _08180710
	str r0, [r5, #0x1c]
	b _0818077C
	.align 2, 0
_08180710: .4byte 0x08184C35
_08180714:
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	movs r1, #0x20
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	ble _08180740
	subs r0, r1, r0
	cmp r0, #0
	bge _0818073C
	adds r0, #7
_0818073C:
	lsls r0, r0, #0xd
	lsrs r6, r0, #0x10
_08180740:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	strh r0, [r5, #0x26]
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	movs r1, #0x30
	bl Sin
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	movs r3, #0
	bl HandleSetAffineData
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x3a]
	ldrh r1, [r5, #0x36]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x36]
_0818077C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081806D4

	thumb_func_start pokemonanimfunc_13
pokemonanimfunc_13: @ 0x08180784
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0818079E
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #3
	strh r0, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x3a]
_0818079E:
	adds r0, r4, #0
	bl sub_081806D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_13

	thumb_func_start sub_081807AC
sub_081807AC: @ 0x081807AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08180850
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	str r1, [sp]
	ldr r5, _08180854
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	lsls r1, r2, #1
	adds r1, r1, r2
	movs r3, #8
	ldrsh r2, [r0, r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r6, r0, #3
	adds r1, r1, r6
	adds r2, r1, r5
	adds r0, r5, #1
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov sb, r2
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r7, [r4, #0x34]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08180818
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_08180818:
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, r0, r6
	adds r5, #2
	mov r8, r5
	adds r1, r0, r5
	movs r5, #0
	ldrsb r5, [r1, r5]
	cmp r5, #0
	bne _0818085C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	strh r5, [r4, #0x24]
	strh r5, [r4, #0x26]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08180858
	str r0, [r4, #0x1c]
	b _081808E6
	.align 2, 0
_08180850: .4byte 0x03001240
_08180854: .4byte 0x085D37EE
_08180858: .4byte 0x08184C35
_0818085C:
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	lsls r0, r5, #7
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	muls r0, r5, r0
	movs r1, #0x36
	ldrsh r2, [r4, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	adds r1, r1, r6
	add r1, r8
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	add r0, sb
	strh r0, [r4, #0x24]
	ldr r2, [sp]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x24
	ldrsh r1, [r4, r3]
	muls r0, r1, r0
	rsbs r0, r0, #0
	cmp r0, #0
	bge _081808B0
	adds r0, #7
_081808B0:
	lsls r3, r0, #0xd
	lsrs r3, r3, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, r0, r6
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bne _081808E0
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	movs r0, #0
	b _081808E4
_081808E0:
	ldrh r0, [r4, #0x34]
	adds r0, #1
_081808E4:
	strh r0, [r4, #0x34]
_081808E6:
	adds r0, r4, #0
	bl sub_0817F5B8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081807AC

	thumb_func_start pokemonanimfunc_05
pokemonanimfunc_05: @ 0x081808FC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08180930
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1, #6]
	ldrh r0, [r4, #0x3a]
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_081807AC
	ldr r0, _08180934
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180930: .4byte 0x03001240
_08180934: .4byte 0x081807AD
	thumb_func_end pokemonanimfunc_05

	thumb_func_start pokemonanimfunc_20
pokemonanimfunc_20: @ 0x08180938
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08180954
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
_08180954:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _08180978
	ldrh r0, [r4, #0x3c]
	ldr r3, _08180970
	movs r1, #0x10
	movs r2, #0
	bl BlendPalette
	ldr r0, _08180974
	str r0, [r4, #0x1c]
	b _08180994
	.align 2, 0
_08180970: .4byte 0x000002DF
_08180974: .4byte 0x08184C35
_08180978:
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0xc
	bl Sin
	adds r2, r0, #0
	strh r2, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _081809A0
	movs r1, #0x10
	bl BlendPalette
_08180994:
	ldrh r0, [r4, #0x32]
	adds r0, #2
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081809A0: .4byte 0x000002DF
	thumb_func_end pokemonanimfunc_20

	thumb_func_start pokemonanimfunc_21
pokemonanimfunc_21: @ 0x081809A4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081809C0
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
_081809C0:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _081809E0
	ldrh r0, [r4, #0x3c]
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x1f
	bl BlendPalette
	ldr r0, _081809DC
	str r0, [r4, #0x1c]
	b _081809FC
	.align 2, 0
_081809DC: .4byte 0x08184C35
_081809E0:
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0xc
	bl Sin
	adds r2, r0, #0
	strh r2, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0x10
	movs r3, #0x1f
	bl BlendPalette
_081809FC:
	ldrh r0, [r4, #0x32]
	adds r0, #2
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_21

	thumb_func_start pokemonanimfunc_22
pokemonanimfunc_22: @ 0x08180A08
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08180A24
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
_08180A24:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _08180A44
	ldrh r0, [r4, #0x3c]
	movs r3, #0xf8
	lsls r3, r3, #7
	movs r1, #0x10
	movs r2, #0
	bl BlendPalette
	ldr r0, _08180A40
	str r0, [r4, #0x1c]
	b _08180A62
	.align 2, 0
_08180A40: .4byte 0x08184C35
_08180A44:
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0xc
	bl Sin
	adds r2, r0, #0
	strh r2, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #0xf8
	lsls r3, r3, #7
	movs r1, #0x10
	bl BlendPalette
_08180A62:
	ldrh r0, [r4, #0x32]
	adds r0, #2
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_22

	thumb_func_start pokemonanimfunc_23
pokemonanimfunc_23: @ 0x08180A70
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08180A8C
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
_08180A8C:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _08180AB0
	ldrh r0, [r4, #0x3c]
	ldr r3, _08180AA8
	movs r1, #0x10
	movs r2, #0
	bl BlendPalette
	ldr r0, _08180AAC
	str r0, [r4, #0x1c]
	b _08180ACC
	.align 2, 0
_08180AA8: .4byte 0x000003FF
_08180AAC: .4byte 0x08184C35
_08180AB0:
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0xc
	bl Sin
	adds r2, r0, #0
	strh r2, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08180AD8
	movs r1, #0x10
	bl BlendPalette
_08180ACC:
	ldrh r0, [r4, #0x32]
	adds r0, #2
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180AD8: .4byte 0x000003FF
	thumb_func_end pokemonanimfunc_23

	thumb_func_start pokemonanimfunc_24
pokemonanimfunc_24: @ 0x08180ADC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08180AF8
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
_08180AF8:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _08180B1C
	ldrh r0, [r4, #0x3c]
	ldr r3, _08180B14
	movs r1, #0x10
	movs r2, #0
	bl BlendPalette
	ldr r0, _08180B18
	str r0, [r4, #0x1c]
	b _08180B38
	.align 2, 0
_08180B14: .4byte 0x00006018
_08180B18: .4byte 0x08184C35
_08180B1C:
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #0xc
	bl Sin
	adds r2, r0, #0
	strh r2, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08180B44
	movs r1, #0x10
	bl BlendPalette
_08180B38:
	ldrh r0, [r4, #0x32]
	adds r0, #2
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180B44: .4byte 0x00006018
	thumb_func_end pokemonanimfunc_24

	thumb_func_start pokemonanimfunc_25
pokemonanimfunc_25: @ 0x08180B48
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	ldr r0, _08180B5C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180B5C: .4byte 0x08180B61
	thumb_func_end pokemonanimfunc_25

	thumb_func_start sub_08180B60
sub_08180B60: @ 0x08180B60
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x24]
	adds r0, #1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _08180B82
	movs r0, #8
	strh r0, [r4, #0x24]
	movs r0, #2
	strh r0, [r4, #0x3c]
	ldr r0, _08180B90
	str r0, [r4, #0x1c]
_08180B82:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180B90: .4byte 0x08180B95
	thumb_func_end sub_08180B60

	thumb_func_start sub_08180B94
sub_08180B94: @ 0x08180B94
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x24]
	ldrh r0, [r4, #0x3c]
	subs r1, r1, r0
	strh r1, [r4, #0x24]
	adds r0, #1
	adds r2, r0, #0
	strh r0, [r4, #0x3c]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _08180BDE
	lsls r0, r2, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0
	strh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x24]
	ldr r5, _08180BEC
	movs r3, #8
	rsbs r3, r3, #0
_08180BC0:
	subs r0, r1, r2
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0x3a]
	adds r1, #1
	strh r1, [r4, #0x3a]
	adds r1, r2, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	bgt _08180BC0
	movs r0, #1
	strh r0, [r4, #0x38]
	str r5, [r4, #0x1c]
_08180BDE:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08180BEC: .4byte 0x08180BF1
	thumb_func_end sub_08180B94

	thumb_func_start sub_08180BF0
sub_08180BF0: @ 0x08180BF0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x3c]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	adds r1, #1
	strh r1, [r4, #0x3c]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #0x3a]
	movs r3, #0x3a
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _08180C30
	strh r2, [r4, #0x38]
_08180C30:
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r5, #8
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	movs r1, #8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08180C5A
	strh r1, [r4, #0x24]
	movs r0, #2
	strh r0, [r4, #0x36]
	movs r0, #0
	strh r0, [r4, #0x34]
	strh r5, [r4, #0x32]
	ldr r0, _08180C68
	str r0, [r4, #0x1c]
_08180C5A:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08180C68: .4byte 0x08180C6D
	thumb_func_end sub_08180BF0

	thumb_func_start sub_08180C6C
sub_08180C6C: @ 0x08180C6C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0xb
	ble _08180CB4
	ldrh r0, [r4, #0x32]
	subs r0, #2
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08180C8E
	movs r0, #0
	strh r0, [r4, #0x32]
_08180C8E:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x32]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08180CC8
	ldr r0, _08180CB0
	str r0, [r4, #0x1c]
	b _08180CC8
	.align 2, 0
_08180CB0: .4byte 0x08180CD5
_08180CB4:
	ldrh r0, [r4, #0x36]
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	strh r0, [r4, #0x24]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	adds r0, r1, #1
	strh r0, [r4, #0x34]
_08180CC8:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08180C6C

	thumb_func_start sub_08180CD4
sub_08180CD4: @ 0x08180CD4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x24]
	adds r0, #2
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08180CF6
	movs r0, #0
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08180D04
	str r0, [r4, #0x1c]
_08180CF6:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180D04: .4byte 0x08184C35
	thumb_func_end sub_08180CD4

	thumb_func_start pokemonanimfunc_26
pokemonanimfunc_26: @ 0x08180D08
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	movs r0, #0
	strh r0, [r4, #0x34]
	ldr r0, _08180D20
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180D20: .4byte 0x08180D25
	thumb_func_end pokemonanimfunc_26

	thumb_func_start sub_08180D24
sub_08180D24: @ 0x08180D24
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x24]
	adds r0, #1
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x24]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08180D4E
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _08180D4E
	movs r0, #0xa
	strh r0, [r4, #0x34]
_08180D4E:
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	cmp r0, #7
	ble _08180D66
	movs r1, #0
	movs r0, #8
	strh r0, [r4, #0x24]
	ldr r0, _08180D74
	strh r0, [r4, #0x26]
	strh r1, [r4, #0x36]
	ldr r0, _08180D78
	str r0, [r4, #0x1c]
_08180D66:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180D74: .4byte 0x0000FFF8
_08180D78: .4byte 0x08180D7D
	thumb_func_end sub_08180D24

	thumb_func_start sub_08180D7C
sub_08180D7C: @ 0x08180D7C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #0x10
	bl Cos
	subs r0, #8
	strh r0, [r4, #0x24]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	movs r1, #0x10
	bl Sin
	subs r0, #8
	strh r0, [r4, #0x26]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0x3f
	ble _08180DB4
	movs r0, #0xa0
	strh r0, [r4, #0x32]
	movs r0, #0xa
	strh r0, [r4, #0x34]
	ldr r0, _08180DD4
	str r0, [r4, #0x1c]
_08180DB4:
	ldrh r0, [r4, #0x36]
	adds r0, #8
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble _08180DC6
	movs r0, #0x40
	strh r0, [r4, #0x36]
_08180DC6:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180DD4: .4byte 0x08180DD9
	thumb_func_end sub_08180D7C

	thumb_func_start sub_08180DD8
sub_08180DD8: @ 0x08180DD8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08180DF0
	subs r0, r1, #1
	strh r0, [r4, #0x34]
	b _08180E42
_08180DF0:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #5
	bl Cos
	subs r0, #4
	movs r5, #0
	strh r0, [r4, #0x24]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	movs r1, #5
	bl Sin
	rsbs r0, r0, #0
	adds r0, #4
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	subs r0, #4
	strh r0, [r4, #0x32]
	movs r0, #0x32
	ldrsh r3, [r4, r0]
	subs r3, #0x20
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x19
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bgt _08180E42
	strh r5, [r4, #0x24]
	strh r5, [r4, #0x26]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08180E50
	str r0, [r4, #0x1c]
_08180E42:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08180E50: .4byte 0x08184C35
	thumb_func_end sub_08180DD8

	thumb_func_start pokemonanimfunc_27
pokemonanimfunc_27: @ 0x08180E54
	push {r4, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x34]
	movs r2, #0x34
	ldrsh r0, [r3, r2]
	cmp r0, #0
	ble _08180E66
	subs r0, r1, #1
	b _08180EAA
_08180E66:
	movs r2, #0
	movs r1, #0x36
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _08180E72
	movs r2, #1
_08180E72:
	strh r2, [r3, #0x36]
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	lsls r2, r2, #2
	ldrb r1, [r0]
	movs r4, #5
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	orrs r0, r2
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #0x32]
	adds r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x13
	ble _08180EA8
	ldrb r0, [r1]
	adds r1, r4, #0
	ands r1, r0
	mov r2, ip
	strb r1, [r2]
	ldr r0, _08180EB4
	str r0, [r3, #0x1c]
_08180EA8:
	movs r0, #2
_08180EAA:
	strh r0, [r3, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180EB4: .4byte 0x08184C35
	thumb_func_end pokemonanimfunc_27

	thumb_func_start pokemonanimfunc_28
pokemonanimfunc_28: @ 0x08180EB8
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	ldr r0, _08180ECC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180ECC: .4byte 0x08180ED1
	thumb_func_end pokemonanimfunc_28

	thumb_func_start sub_08180ED0
sub_08180ED0: @ 0x08180ED0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x24]
	subs r0, #1
	strh r0, [r4, #0x24]
	ldrh r1, [r4, #0x26]
	adds r1, #1
	strh r1, [r4, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _08180F00
	ldr r0, _08180F0C
	strh r0, [r4, #0x24]
	movs r0, #0x10
	strh r0, [r4, #0x26]
	ldr r0, _08180F10
	str r0, [r4, #0x1c]
	movs r0, #0xa0
	strh r0, [r4, #0x32]
_08180F00:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180F0C: .4byte 0x0000FFF0
_08180F10: .4byte 0x08180F15
	thumb_func_end sub_08180ED0

	thumb_func_start sub_08180F14
sub_08180F14: @ 0x08180F14
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x32]
	subs r0, #4
	strh r0, [r4, #0x32]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0x16
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0x16
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r0, #0x32
	ldrsh r3, [r4, r0]
	subs r3, #0x20
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x19
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bgt _08180F5E
	ldr r0, _08180F6C
	str r0, [r4, #0x1c]
_08180F5E:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180F6C: .4byte 0x08180F71
	thumb_func_end sub_08180F14

	thumb_func_start sub_08180F70
sub_08180F70: @ 0x08180F70
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x24]
	subs r1, #1
	strh r1, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	adds r0, #1
	strh r0, [r4, #0x26]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _08180F94
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08180FA0
	str r0, [r4, #0x1c]
_08180F94:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180FA0: .4byte 0x08184C35
	thumb_func_end sub_08180F70

	thumb_func_start pokemonanimfunc_29
pokemonanimfunc_29: @ 0x08180FA4
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	ldr r0, _08180FB8
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180FB8: .4byte 0x08180FBD
	thumb_func_end pokemonanimfunc_29

	thumb_func_start sub_08180FBC
sub_08180FBC: @ 0x08180FBC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x24]
	adds r1, #1
	strh r1, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xf
	ble _08180FE0
	movs r0, #0
	strh r0, [r4, #0x32]
	ldr r0, _08180FEC
	str r0, [r4, #0x1c]
_08180FE0:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08180FEC: .4byte 0x08180FF1
	thumb_func_end sub_08180FBC

	thumb_func_start sub_08180FF0
sub_08180FF0: @ 0x08180FF0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x32]
	adds r0, #0x10
	strh r0, [r4, #0x32]
	ldrh r2, [r4, #0x24]
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _08181028
	ldr r0, _08181020
	strh r0, [r4, #0x24]
	movs r0, #0x10
	strh r0, [r4, #0x26]
	movs r0, #0
	strh r0, [r4, #0x32]
	ldr r0, _08181024
	str r0, [r4, #0x1c]
	b _08181032
	.align 2, 0
_08181020: .4byte 0x0000FFF0
_08181024: .4byte 0x08181051
_08181028:
	subs r0, r2, #2
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	adds r0, #2
	strh r0, [r4, #0x26]
_08181032:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x32]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08180FF0

	thumb_func_start sub_08181050
sub_08181050: @ 0x08181050
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x24]
	adds r1, #1
	movs r2, #0
	strh r1, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r1, r1, #0x10
	cmp r1, #0
	blt _0818107A
	strh r2, [r4, #0x24]
	strh r2, [r4, #0x26]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08181088
	str r0, [r4, #0x1c]
_0818107A:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181088: .4byte 0x08184C35
	thumb_func_end sub_08181050

	thumb_func_start pokemonanimfunc_2A
pokemonanimfunc_2A: @ 0x0818108C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _081810B8
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #2
	strh r0, [r1, #2]
	adds r0, r4, #0
	bl sub_081810C0
	ldr r0, _081810BC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081810B8: .4byte 0x03001240
_081810BC: .4byte 0x081810C1
	thumb_func_end pokemonanimfunc_2A

	thumb_func_start sub_081810C0
sub_081810C0: @ 0x081810C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _081810E0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, #0
	beq _081810E4
	subs r0, #1
	strh r0, [r1]
	b _081811F6
	.align 2, 0
_081810E0: .4byte 0x03001240
_081810E4:
	adds r0, r4, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x32]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	bne _0818111C
	adds r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r0, [r0, #2]
	strh r0, [r4, #0x3c]
	ldr r0, _08181160
	strh r0, [r4, #0x34]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	strh r5, [r4, #0x38]
	strh r5, [r4, #0x3a]
_0818111C:
	movs r3, #0x3c
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	muls r1, r0, r1
	ldrh r0, [r4, #0x24]
	adds r1, r1, r0
	strh r1, [r4, #0x24]
	ldrh r2, [r4, #0x3c]
	ldrh r0, [r4, #0x36]
	adds r3, r0, #0
	muls r3, r2, r3
	adds r0, r3, #0
	ldrh r6, [r4, #0x26]
	adds r2, r0, r6
	strh r2, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	adds r0, #8
	strh r0, [r4, #0x3a]
	adds r1, #0xf
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x1e
	bls _08181164
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	strh r0, [r4, #0x24]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	strh r0, [r4, #0x34]
	b _08181180
	.align 2, 0
_08181160: .4byte 0x0000FFFF
_08181164:
	adds r0, r2, #0
	adds r0, #0xf
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bls _08181186
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	strh r0, [r4, #0x26]
	movs r6, #0x36
	ldrsh r0, [r4, r6]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
_08181180:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08181186:
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #5
	ble _081811DE
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _081811DE
	movs r3, #0
	strh r3, [r4, #0x24]
	strh r3, [r4, #0x26]
	ldr r5, _081811D0
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrh r2, [r1, #4]
	movs r6, #4
	ldrsh r0, [r1, r6]
	cmp r0, #1
	ble _081811D4
	subs r0, r2, #1
	strh r0, [r1, #4]
	strh r3, [r4, #0x38]
	strh r3, [r4, #0x3a]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0xa
	strh r1, [r0]
	b _081811DE
	.align 2, 0
_081811D0: .4byte 0x03001240
_081811D4:
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _081811FC
	str r0, [r4, #0x1c]
_081811DE:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3a]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F5B8
_081811F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081811FC: .4byte 0x08184C35
	thumb_func_end sub_081810C0

	thumb_func_start pokemonanimfunc_2B
pokemonanimfunc_2B: @ 0x08181200
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	movs r0, #0
	strh r0, [r4, #0x3a]
	strh r0, [r4, #0x3c]
	ldr r0, _08181218
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181218: .4byte 0x0818121D
	thumb_func_end pokemonanimfunc_2B

	thumb_func_start sub_0818121C
sub_0818121C: @ 0x0818121C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x3a]
	adds r0, #4
	strh r0, [r4, #0x3a]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	movs r1, #0x10
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	movs r1, #0xff
	ands r0, r1
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0xc0
	ble _08181266
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08181266
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	b _0818127E
_08181266:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	ble _0818128A
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0818128A
	ldr r1, _081812BC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
_0818127E:
	movs r3, #0
	bl HandleSetAffineData
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
_0818128A:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #0xff
	ble _081812B0
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _081812C0
	str r0, [r4, #0x1c]
_081812B0:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081812BC: .4byte 0xFFFFFF00
_081812C0: .4byte 0x08184C35
	thumb_func_end sub_0818121C

	thumb_func_start pokemonanimfunc_2C
pokemonanimfunc_2C: @ 0x081812C4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _081812EE
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	strh r2, [r4, #0x3a]
	strh r2, [r4, #0x38]
	strh r2, [r4, #0x36]
_081812EE:
	ldr r1, _08181308
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	lsls r2, r0, #1
	adds r0, r1, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08181310
	ldr r0, _0818130C
	str r0, [r4, #0x1c]
	b _0818137A
	.align 2, 0
_08181308: .4byte 0x085D34C4
_0818130C: .4byte 0x08184C35
_08181310:
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	cmp r0, #1
	bne _08181346
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08181334
	ldrh r0, [r4, #0x3c]
	ldr r3, _08181330
	movs r1, #0x10
	movs r2, #0x10
	bl BlendPalette
	b _08181340
	.align 2, 0
_08181330: .4byte 0x000003FF
_08181334:
	ldrh r0, [r4, #0x3c]
	ldr r3, _0818136C
	movs r1, #0x10
	movs r2, #0
	bl BlendPalette
_08181340:
	movs r0, #0
	strh r0, [r4, #0x36]
	ldr r1, _08181370
_08181346:
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08181374
	movs r1, #0
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
	ldrh r0, [r4, #0x3a]
	adds r0, #1
	strh r0, [r4, #0x3a]
	b _0818137A
	.align 2, 0
_0818136C: .4byte 0x000003FF
_08181370: .4byte 0x085D34C4
_08181374:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0818137A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_2C

	thumb_func_start sub_08181380
sub_08181380: @ 0x08181380
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08181392
	adds r0, r6, #0
	bl HandleStartAffineAnim
_08181392:
	adds r0, r6, #0
	bl sub_0817F5B8
	ldr r4, _081813E4
	movs r3, #0x2e
	ldrsh r1, [r6, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r4
	movs r0, #0x32
	ldrsh r1, [r6, r0]
	movs r3, #8
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _081813F8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r3, #0
	strh r3, [r6, #0x24]
	movs r0, #0x2e
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrh r2, [r1, #4]
	movs r4, #4
	ldrsh r0, [r1, r4]
	cmp r0, #1
	ble _081813E8
	subs r0, r2, #1
	strh r0, [r1, #4]
	strh r3, [r6, #0x32]
	b _08181434
	.align 2, 0
_081813E4: .4byte 0x03001240
_081813E8:
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _081813F4
	str r0, [r6, #0x1c]
	b _08181434
	.align 2, 0
_081813F4: .4byte 0x08184C35
_081813F8:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	lsls r0, r0, #8
	movs r3, #8
	ldrsh r1, [r2, r3]
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r6, #0x24]
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r1, _08181448
	adds r0, r4, #0
	bl Sin
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r5, #0
	bl HandleSetAffineData
_08181434:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	adds r0, r6, #0
	bl sub_0817F5B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08181448: .4byte 0x00000CCC
	thumb_func_end sub_08181380

	thumb_func_start pokemonanimfunc_2D
pokemonanimfunc_2D: @ 0x0818144C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08181478
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x32
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_08181380
	ldr r0, _0818147C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181478: .4byte 0x03001240
_0818147C: .4byte 0x08181381
	thumb_func_end pokemonanimfunc_2D

	thumb_func_start sub_08181480
sub_08181480: @ 0x08181480
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08181492
	adds r0, r6, #0
	bl HandleStartAffineAnim
_08181492:
	adds r0, r6, #0
	bl sub_0817F5B8
	ldr r4, _081814E4
	movs r3, #0x2e
	ldrsh r1, [r6, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r4
	movs r0, #0x32
	ldrsh r1, [r6, r0]
	movs r3, #8
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _081814F8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r3, #0
	strh r3, [r6, #0x24]
	movs r0, #0x2e
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrh r2, [r1, #4]
	movs r4, #4
	ldrsh r0, [r1, r4]
	cmp r0, #1
	ble _081814E8
	subs r0, r2, #1
	strh r0, [r1, #4]
	strh r3, [r6, #0x32]
	b _08181536
	.align 2, 0
_081814E4: .4byte 0x03001240
_081814E8:
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _081814F4
	str r0, [r6, #0x1c]
	b _08181536
	.align 2, 0
_081814F4: .4byte 0x08184C35
_081814F8:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	lsls r0, r0, #8
	movs r3, #8
	ldrsh r1, [r2, r3]
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r6, #0x24]
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r1, _08181548
	adds r0, r4, #0
	bl Sin
	adds r3, r0, #0
	rsbs r3, r3, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r5, #0
	bl HandleSetAffineData
_08181536:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	adds r0, r6, #0
	bl sub_0817F5B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08181548: .4byte 0x00000CCC
	thumb_func_end sub_08181480

	thumb_func_start pokemonanimfunc_2E
pokemonanimfunc_2E: @ 0x0818154C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08181578
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x32
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_08181480
	ldr r0, _0818157C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181578: .4byte 0x03001240
_0818157C: .4byte 0x08181481
	thumb_func_end pokemonanimfunc_2E

	thumb_func_start pokemonanimfunc_2F
pokemonanimfunc_2F: @ 0x08181580
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xa
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4, #0x3a]
	movs r0, #0x80
	strh r0, [r4, #0x3c]
	ldr r0, _081815B0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081815B0: .4byte 0x081815B5
	thumb_func_end pokemonanimfunc_2F

	thumb_func_start sub_081815B4
sub_081815B4: @ 0x081815B4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x3c]
	subs r0, #1
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	bl Cos
	ldrh r1, [r4, #0x3a]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3c]
	subs r3, #0x80
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bgt _0818160C
	movs r0, #0x78
	strh r0, [r4, #0x3c]
	movs r0, #0
	strh r0, [r4, #0x34]
	ldr r0, _08181618
	str r0, [r4, #0x1c]
_0818160C:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181618: .4byte 0x0818161D
	thumb_func_end sub_081815B4

	thumb_func_start sub_0818161C
sub_0818161C: @ 0x0818161C
	push {lr}
	adds r1, r0, #0
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #0x14
	bne _08181630
	ldr r0, _0818163C
	str r0, [r1, #0x1c]
	movs r0, #0
	strh r0, [r1, #0x34]
_08181630:
	ldrh r0, [r1, #0x34]
	adds r0, #1
	strh r0, [r1, #0x34]
	pop {r0}
	bx r0
	.align 2, 0
_0818163C: .4byte 0x08181641
	thumb_func_end sub_0818161C

	thumb_func_start sub_08181640
sub_08181640: @ 0x08181640
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x3c]
	adds r0, #2
	movs r6, #0
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	bl Cos
	ldrh r1, [r4, #0x3a]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r5, #0x80
	lsls r5, r5, #1
	ldrh r3, [r4, #0x3c]
	subs r3, #0x80
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r5, #0
	bl HandleSetAffineData
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	ble _081816AC
	strh r6, [r4, #0x24]
	strh r6, [r4, #0x26]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r5, #0
	movs r3, #0
	bl HandleSetAffineData
	strh r6, [r4, #0x32]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _081816B8
	str r0, [r4, #0x1c]
_081816AC:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081816B8: .4byte 0x0817FC35
	thumb_func_end sub_08181640

	thumb_func_start sub_081816BC
sub_081816BC: @ 0x081816BC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _081816DC
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrh r0, [r1]
	adds r6, r0, #0
	cmp r6, #0
	beq _081816E0
	subs r0, #1
	strh r0, [r1]
	b _081817FC
	.align 2, 0
_081816DC: .4byte 0x03001240
_081816E0:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _081816F6
	adds r0, r5, #0
	bl HandleStartAffineAnim
	strh r6, [r5, #0x36]
	strh r6, [r5, #0x38]
	movs r0, #1
	strh r0, [r5, #0x32]
_081816F6:
	movs r3, #0x38
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bne _0818174E
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	bl Sin
	strh r0, [r5, #0x3c]
	movs r3, #0x36
	ldrsh r0, [r5, r3]
	movs r1, #0x10
	bl Sin
	strh r0, [r5, #0x26]
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	movs r1, #0x20
	bl Sin
	adds r1, r0, #0
	strh r1, [r5, #0x3a]
	subs r1, r4, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x3c]
	adds r2, r2, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r3, #0x36
	ldrsh r0, [r5, r3]
	cmp r0, #0x80
	bne _081817E6
	strh r6, [r5, #0x36]
	movs r0, #1
	strh r0, [r5, #0x38]
	b _081817E6
_0818174E:
	cmp r0, #1
	bne _081817E6
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	movs r1, #0x20
	bl Sin
	strh r0, [r5, #0x3c]
	movs r3, #0x36
	ldrsh r0, [r5, r3]
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r5, #0x26]
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	movs r1, #0x80
	bl Sin
	adds r1, r0, #0
	strh r1, [r5, #0x3a]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r5, #0x3c]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	cmp r0, #0x80
	bne _081817E6
	movs r3, #0x2e
	ldrsh r0, [r5, r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r2, [r1, #4]
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, #1
	ble _081817CE
	subs r0, r2, #1
	strh r0, [r1, #4]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0xa
	strh r1, [r0]
	strh r6, [r5, #0x36]
	strh r6, [r5, #0x38]
	b _081817E6
_081817CE:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r5, #0
	bl sub_0817F628
	ldr r0, _08181804
	str r0, [r5, #0x1c]
_081817E6:
	ldr r2, _08181808
	movs r3, #0x2e
	ldrsh r1, [r5, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	ldrh r1, [r5, #0x36]
	adds r0, r0, r1
	strh r0, [r5, #0x36]
_081817FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08181804: .4byte 0x08184C35
_08181808: .4byte 0x03001240
	thumb_func_end sub_081816BC

	thumb_func_start pokemonanimfunc_30
pokemonanimfunc_30: @ 0x0818180C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08181838
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #4
	strh r0, [r1, #6]
	adds r0, r4, #0
	bl sub_081816BC
	ldr r0, _0818183C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181838: .4byte 0x03001240
_0818183C: .4byte 0x081816BD
	thumb_func_end pokemonanimfunc_30

	thumb_func_start pokemonanimfunc_31
pokemonanimfunc_31: @ 0x08181840
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r4, [r5, r0]
	adds r0, r5, #0
	bl sub_0817F5B8
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	ble _08181864
	ldr r0, _08181860
	str r0, [r5, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x24]
	b _0818190E
	.align 2, 0
_08181860: .4byte 0x08184C35
_08181864:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0818186E
	adds r0, #0x7f
_0818186E:
	asrs r0, r0, #7
	cmp r0, #1
	beq _081818A4
	cmp r0, #1
	bgt _0818187E
	cmp r0, #0
	beq _08181888
	b _081818F4
_0818187E:
	cmp r0, #2
	beq _081818BE
	cmp r0, #3
	beq _081818D6
	b _081818F4
_08181888:
	adds r0, r4, #0
	cmp r4, #0
	bge _08181890
	adds r0, #0x7f
_08181890:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r4, r0
	lsls r0, r0, #3
	rsbs r0, r0, #0
	cmp r0, #0
	bge _081818A0
	adds r0, #0x7f
_081818A0:
	asrs r0, r0, #7
	b _081818F2
_081818A4:
	adds r0, r4, #0
	cmp r4, #0
	bge _081818AC
	adds r0, #0x7f
_081818AC:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r4, r0
	cmp r0, #0
	bge _081818B8
	adds r0, #0xf
_081818B8:
	asrs r0, r0, #4
	subs r0, #8
	b _081818F2
_081818BE:
	adds r0, r4, #0
	cmp r4, #0
	bge _081818C6
	adds r0, #0x7f
_081818C6:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r4, r0
	cmp r0, #0
	bge _081818D2
	adds r0, #0xf
_081818D2:
	asrs r0, r0, #4
	b _081818F2
_081818D6:
	adds r0, r4, #0
	cmp r4, #0
	bge _081818DE
	adds r0, #0x7f
_081818DE:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r4, r0
	lsls r0, r0, #3
	rsbs r0, r0, #0
	cmp r0, #0
	bge _081818EE
	adds r0, #0x7f
_081818EE:
	asrs r0, r0, #7
	adds r0, #8
_081818F2:
	strh r0, [r5, #0x24]
_081818F4:
	adds r0, r4, #0
	cmp r4, #0
	bge _081818FC
	adds r0, #0x7f
_081818FC:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
_0818190E:
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #0x32]
	adds r0, #0xc
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_31

	thumb_func_start pokemonanimfunc_32
pokemonanimfunc_32: @ 0x08181924
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #0x2e]
	ldr r2, _0818195C
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, _08181960
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl HandleStartAffineAnim
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	bl sub_08181968
	ldr r0, _08181964
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818195C: .4byte 0x03001240
_08181960: .4byte 0x0000FFFF
_08181964: .4byte 0x08181969
	thumb_func_end pokemonanimfunc_32

	thumb_func_start sub_08181968
sub_08181968: @ 0x08181968
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _08181988
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	ldrh r0, [r1]
	adds r5, r0, #0
	cmp r5, #0
	beq _0818198C
	subs r0, #1
	strh r0, [r1]
	b _081819F0
	.align 2, 0
_08181988: .4byte 0x03001240
_0818198C:
	adds r0, r4, #0
	bl sub_0817F5B8
	movs r1, #0x32
	ldrsh r2, [r4, r1]
	adds r0, r2, #0
	cmp r0, #0x80
	ble _081819A8
	strh r5, [r4, #0x32]
	ldr r0, _081819A4
	str r0, [r4, #0x1c]
	b _081819EA
	.align 2, 0
_081819A4: .4byte 0x081819F9
_081819A8:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r3, #8
	ldrsh r0, [r1, r3]
	lsls r3, r0, #3
	adds r0, r2, #0
	cmp r2, #0
	bge _081819C2
	adds r0, #0x7f
_081819C2:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r1, r2, r0
	adds r0, r3, #0
	muls r0, r1, r0
	cmp r0, #0
	bge _081819D2
	adds r0, #0x7f
_081819D2:
	asrs r0, r0, #7
	strh r0, [r4, #0x24]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #0xc
	strh r0, [r4, #0x32]
_081819EA:
	adds r0, r4, #0
	bl sub_0817F5B8
_081819F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08181968

	thumb_func_start sub_081819F8
sub_081819F8: @ 0x081819F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x30
	ble _08181A28
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r0, #0
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x32]
	ldr r0, _08181A24
	str r0, [r4, #0x1c]
	b _08181AC6
	.align 2, 0
_08181A24: .4byte 0x08181AD9
_08181A28:
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	movs r1, #0x40
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r6, r1, #0
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r4, #0x32]
	subs r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _08181A66
	ldrh r0, [r4, #0x34]
	adds r0, #8
	strh r0, [r4, #0x34]
	ldr r2, _08181AD4
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r4, #0x24]
	ldrh r0, [r0, #8]
	subs r1, r1, r0
	strh r1, [r4, #0x24]
_08181A66:
	movs r5, #0
	lsls r1, r3, #0x10
	asrs r2, r1, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r6, r1, #0
	cmp r2, r0
	ble _08181A82
	subs r0, r0, r2
	cmp r0, #0
	bge _08181A7E
	adds r0, #7
_08181A7E:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
_08181A82:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Sin
	rsbs r0, r0, #0
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x26]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	movs r1, #0x20
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r2, r6, #0x10
	adds r0, r4, #0
	movs r3, #0
	bl HandleSetAffineData
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x36]
	adds r0, #8
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x36]
_08181AC6:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08181AD4: .4byte 0x03001240
	thumb_func_end sub_081819F8

	thumb_func_start sub_08181AD8
sub_08181AD8: @ 0x08181AD8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r3, [r4, r0]
	cmp r3, #0x80
	ble _08181B3C
	ldr r3, _08181B20
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r2, [r1, #4]
	movs r5, #4
	ldrsh r0, [r1, r5]
	cmp r0, #1
	ble _08181B28
	subs r0, r2, #1
	movs r2, #0
	strh r0, [r1, #4]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0xa
	strh r1, [r0]
	strh r2, [r4, #0x34]
	strh r2, [r4, #0x32]
	strh r2, [r4, #0x36]
	ldr r0, _08181B24
	b _08181B30
	.align 2, 0
_08181B20: .4byte 0x03001240
_08181B24: .4byte 0x08181969
_08181B28:
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08181B38
_08181B30:
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x24]
	b _08181B7C
	.align 2, 0
_08181B38: .4byte 0x08184C35
_08181B3C:
	ldr r2, _08181B90
	movs r5, #0x2e
	ldrsh r1, [r4, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #8
	ldrsh r5, [r0, r1]
	lsls r1, r5, #3
	adds r0, r3, #0
	cmp r3, #0
	bge _08181B58
	adds r0, #0x7f
_08181B58:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r2, r3, r0
	adds r0, r1, #0
	muls r0, r2, r0
	cmp r0, #0
	bge _08181B68
	adds r0, #0x7f
_08181B68:
	asrs r0, r0, #7
	lsls r1, r5, #3
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
_08181B7C:
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #0xc
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08181B90: .4byte 0x03001240
	thumb_func_end sub_08181AD8

	thumb_func_start sub_08181B94
sub_08181B94: @ 0x08181B94
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08181BAC
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_08181BAC:
	adds r0, r4, #0
	bl sub_0817F5B8
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	cmp r0, #0xfe
	ble _08181C0C
	movs r5, #0
	strh r5, [r4, #0x24]
	strh r5, [r4, #0x26]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	ldr r2, _08181BF0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r2, [r1, #4]
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, #1
	ble _08181BF4
	subs r0, r2, #1
	strh r0, [r1, #4]
	strh r5, [r4, #0x32]
	strh r5, [r4, #0x3c]
	b _08181BFE
	.align 2, 0
_08181BF0: .4byte 0x03001240
_08181BF4:
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08181C08
	str r0, [r4, #0x1c]
_08181BFE:
	adds r0, r4, #0
	bl sub_0817F5B8
	b _08181C52
	.align 2, 0
_08181C08: .4byte 0x08184C35
_08181C0C:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0x10
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	movs r1, #0x20
	bl Sin
	adds r3, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	ldr r2, _08181C58
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_0817F5B8
_08181C52:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08181C58: .4byte 0x03001240
	thumb_func_end sub_08181B94

	thumb_func_start pokemonanimfunc_33
pokemonanimfunc_33: @ 0x08181C5C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08181C88
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #4
	strh r0, [r1, #6]
	adds r0, r4, #0
	bl sub_08181B94
	ldr r0, _08181C8C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181C88: .4byte 0x03001240
_08181C8C: .4byte 0x08181B95
	thumb_func_end pokemonanimfunc_33

	thumb_func_start pokemonanimfunc_34
pokemonanimfunc_34: @ 0x08181C90
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08181CA8
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_08181CA8:
	adds r0, r4, #0
	bl sub_0817F5B8
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0xfe
	ble _08181CE0
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08181CDC
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl sub_0817F5B8
	b _08181D36
	.align 2, 0
_08181CDC: .4byte 0x08184C35
_08181CE0:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0x10
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08181CFA
	adds r0, #0x7f
_08181CFA:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0x20
	bl Sin
	adds r3, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_0817F5B8
_08181D36:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_34

	thumb_func_start pokemonanimfunc_35
pokemonanimfunc_35: @ 0x08181D3C
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0x32
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _08181D4A
	strh r0, [r3, #0x3c]
_08181D4A:
	ldrh r4, [r3, #0x32]
	movs r5, #0x32
	ldrsh r1, [r3, r5]
	ldrh r2, [r3, #0x3c]
	movs r5, #0x3c
	ldrsh r0, [r3, r5]
	cmp r1, r0
	bne _08181D74
	movs r0, #0
	strh r0, [r3, #0x3c]
	adds r0, r4, #1
	strh r0, [r3, #0x32]
	adds r1, r3, #0
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	adds r2, r1, #0
	b _08181D84
_08181D74:
	adds r0, r2, #1
	strh r0, [r3, #0x3c]
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_08181D84:
	movs r1, #0x32
	ldrsh r0, [r3, r1]
	cmp r0, #0xa
	ble _08181D9A
	ldrb r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2]
	ldr r0, _08181DA0
	str r0, [r3, #0x1c]
_08181D9A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08181DA0: .4byte 0x08184C35
	thumb_func_end pokemonanimfunc_35

	thumb_func_start pokemonanimfunc_36
pokemonanimfunc_36: @ 0x08181DA4
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _08181DBC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181DBC: .4byte 0x08181DC1
	thumb_func_end pokemonanimfunc_36

	thumb_func_start sub_08181DC0
sub_08181DC0: @ 0x08181DC0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0x1f
	ble _08181DE0
	movs r0, #0
	movs r1, #0x20
	strh r1, [r4, #0x3c]
	strh r0, [r4, #0x32]
	ldr r0, _08181DDC
	str r0, [r4, #0x1c]
	b _08181DE4
	.align 2, 0
_08181DDC: .4byte 0x08181DFD
_08181DE0:
	adds r0, r1, #4
	strh r0, [r4, #0x3c]
_08181DE4:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3c]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08181DC0

	thumb_func_start sub_08181DFC
sub_08181DFC: @ 0x08181DFC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _08181E20
	ldr r0, _08181E1C
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x3a]
	b _08181E5A
	.align 2, 0
_08181E1C: .4byte 0x08181E6D
_08181E20:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	rsbs r0, r0, #0
	cmp r0, #0
	bge _08181E30
	ldr r1, _08181E68
	adds r0, r0, r1
_08181E30:
	asrs r0, r0, #9
	strh r0, [r4, #0x24]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08181E40
	adds r0, #0x7f
_08181E40:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #0xc
	strh r0, [r4, #0x32]
_08181E5A:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181E68: .4byte 0x000001FF
	thumb_func_end sub_08181DFC

	thumb_func_start sub_08181E6C
sub_08181E6C: @ 0x08181E6C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x3c]
	subs r0, #2
	movs r1, #0
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08181E98
	strh r1, [r4, #0x3c]
	strh r1, [r4, #0x24]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08181E94
	str r0, [r4, #0x1c]
	b _08181EAA
	.align 2, 0
_08181E94: .4byte 0x08184C35
_08181E98:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x11
	asrs r0, r0, #0x10
	movs r1, #0x10
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
_08181EAA:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3c]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08181E6C

	thumb_func_start pokemonanimfunc_37
pokemonanimfunc_37: @ 0x08181EC8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08181EE2
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
_08181EE2:
	adds r0, r4, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0xff
	ble _08181F0C
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08181F08
	str r0, [r4, #0x1c]
	b _08181F52
	.align 2, 0
_08181F08: .4byte 0x08184C35
_08181F0C:
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r4, #0x3c]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08181F1E
	adds r0, #0x7f
_08181F1E:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _08181F3E
	adds r0, #0x7f
_08181F3E:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_08181F52:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08181F5E
	adds r0, #0x7f
_08181F5E:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	bl Sin
	adds r3, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_37

	thumb_func_start pokemonanimfunc_38
pokemonanimfunc_38: @ 0x08181F8C
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	movs r0, #0
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x36]
	ldr r0, _08181FA4
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08181FA4: .4byte 0x08181FA9
	thumb_func_end pokemonanimfunc_38

	thumb_func_start sub_08181FA8
sub_08181FA8: @ 0x08181FA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0x18
	ble _08181FD8
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08181FF6
	movs r0, #0
	strh r0, [r4, #0x36]
	ldr r0, _08181FD4
	str r0, [r4, #0x1c]
	b _08181FF6
	.align 2, 0
_08181FD4: .4byte 0x08182019
_08181FD8:
	adds r0, r1, #2
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x24]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_08181FF6:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3c]
	rsbs r3, r3, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08181FA8

	thumb_func_start sub_08182018
sub_08182018: @ 0x08182018
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0x20
	ble _08182038
	movs r0, #1
	strh r0, [r4, #0x3a]
	ldr r0, _08182034
	str r0, [r4, #0x1c]
	b _08182056
	.align 2, 0
_08182034: .4byte 0x08182079
_08182038:
	adds r0, r1, #2
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x24]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_08182056:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3c]
	rsbs r3, r3, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08182018

	thumb_func_start sub_08182078
sub_08182078: @ 0x08182078
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #9
	ble _0818209C
	movs r0, #0x20
	strh r0, [r4, #0x3c]
	ldr r0, _081820F0
	str r0, [r4, #0x1c]
_0818209C:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3c]
	subs r0, #0x1d
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bls _081820D0
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0x3a]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_081820D0:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3c]
	rsbs r3, r3, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081820F0: .4byte 0x081820F5
	thumb_func_end sub_08182078

	thumb_func_start sub_081820F4
sub_081820F4: @ 0x081820F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _0818211C
	movs r0, #0
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08182118
	str r0, [r4, #0x1c]
	b _0818213A
	.align 2, 0
_08182118: .4byte 0x08184C35
_0818211C:
	subs r0, r1, #2
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x24]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_0818213A:
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3c]
	rsbs r3, r3, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081820F4

	thumb_func_start pokemonanimfunc_39
pokemonanimfunc_39: @ 0x0818215C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	ble _0818217C
	ldr r0, _08182178
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x24]
	b _08182208
	.align 2, 0
_08182178: .4byte 0x08184C35
_0818217C:
	movs r0, #1
	ands r0, r1
	movs r5, #0xff
	cmp r0, #0
	bne _08182188
	movs r5, #1
_08182188:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	adds r0, r2, #0
	cmp r2, #0
	bge _08182194
	adds r0, r2, #3
_08182194:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r1, #0
	bne _081821D8
	lsls r0, r2, #7
	movs r1, #0x28
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _081821B8
	adds r0, #0xff
_081821B8:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	bl Sin
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
	strh r0, [r4, #0x24]
	rsbs r0, r0, #0
	b _08182206
_081821D8:
	lsls r0, r2, #7
	movs r1, #0x28
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _081821E8
	adds r0, #0xff
_081821E8:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	bl Sin
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	muls r0, r1, r0
	strh r0, [r4, #0x24]
_08182206:
	strh r0, [r4, #0x26]
_08182208:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_39

	thumb_func_start pokemonanimfunc_3A
pokemonanimfunc_3A: @ 0x0818221C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _0818223E
	adds r0, r4, #0
	bl HandleStartAffineAnim
	strh r5, [r4, #0x38]
	strh r5, [r4, #0x3a]
	strh r5, [r4, #0x3c]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_0818223E:
	ldrh r1, [r4, #0x3a]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08182290
	subs r0, r1, #1
	strh r0, [r4, #0x3a]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #3
	beq _08182340
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	lsls r0, r0, #3
	movs r1, #0x14
	bl __divsi3
	adds r1, r0, #0
	ldrh r0, [r4, #0x3c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x40
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	b _08182340
_08182290:
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #3
	bne _081822D0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0x3f
	ble _081822BC
	movs r0, #0x40
	strh r0, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _081822CC
	str r0, [r4, #0x1c]
_081822BC:
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r1, #0x40
	bl Cos
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _08182320
	.align 2, 0
_081822CC: .4byte 0x08184C35
_081822D0:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0x40
	bl Sin
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0x3f
	ble _081822F4
	movs r0, #0
	movs r1, #3
	strh r1, [r4, #0x38]
	movs r1, #0xa
	strh r1, [r4, #0x3a]
	strh r0, [r4, #0x3c]
	b _08182320
_081822F4:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x30
	ble _08182308
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _08182308
	movs r0, #2
	b _0818231A
_08182308:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08182320
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08182320
	movs r0, #1
_0818231A:
	strh r0, [r4, #0x38]
	movs r0, #0x14
	strh r0, [r4, #0x3a]
_08182320:
	ldrh r0, [r4, #0x3c]
	adds r0, #2
	strh r0, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r0, #0
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
_08182340:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_3A

	thumb_func_start pokemonanimfunc_3B
pokemonanimfunc_3B: @ 0x0818234C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08182366
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
_08182366:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _08182394
	movs r0, #0
	strh r0, [r4, #0x26]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08182390
	str r0, [r4, #0x1c]
	b _081823EC
	.align 2, 0
_08182390: .4byte 0x08184C35
_08182394:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _081823A0
	adds r0, #0xff
_081823A0:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _081823C4
	adds r0, #0x7f
_081823C4:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x60
	bl Sin
	adds r2, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	movs r3, #0
	bl HandleSetAffineData
_081823EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_3B

	thumb_func_start pokemonanimfunc_3C
pokemonanimfunc_3C: @ 0x081823F4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _0818240E
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
_0818240E:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _0818243C
	movs r0, #0
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r5, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08182438
	str r0, [r4, #0x1c]
	b _08182480
	.align 2, 0
_08182438: .4byte 0x08184C35
_0818243C:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0x10
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3c]
	adds r0, #4
	strh r0, [r4, #0x3c]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _0818245A
	adds r0, #0x3f
_0818245A:
	asrs r0, r0, #6
	lsls r0, r0, #6
	subs r0, r1, r0
	lsls r0, r0, #0x11
	asrs r0, r0, #0x10
	movs r1, #0x80
	bl Sin
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl HandleSetAffineData
_08182480:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_3C

	thumb_func_start pokemonanimfunc_3D
pokemonanimfunc_3D: @ 0x08182488
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	ldr r0, _081824A0
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081824A0: .4byte 0x081824A5
	thumb_func_end pokemonanimfunc_3D

	thumb_func_start sub_081824A4
sub_081824A4: @ 0x081824A4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	movs r1, #0
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _081824C8
	strh r1, [r4, #0x3c]
	strh r1, [r4, #0x3a]
	ldr r0, _081824C4
	str r0, [r4, #0x1c]
	movs r0, #0x40
	b _081824CC
	.align 2, 0
_081824C4: .4byte 0x081824F5
_081824C8:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
_081824CC:
	movs r1, #0x80
	bl Sin
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	movs r3, #0
	bl HandleSetAffineData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081824A4

	thumb_func_start sub_081824F4
sub_081824F4: @ 0x081824F4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	adds r0, #4
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5f
	ble _0818251E
	movs r0, #0
	movs r1, #0x80
	bl Cos
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x3a]
	adds r0, #1
	strh r0, [r4, #0x3a]
	b _08182574
_0818251E:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Sin
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	lsls r1, r1, #2
	rsbs r1, r1, #0
	subs r1, r1, r0
	strh r1, [r4, #0x26]
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0x3f
	ble _08182550
	ldr r5, _0818254C
	adds r0, r1, #0
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08182554
	.align 2, 0
_0818254C: .4byte 0x0000FFFF
_08182550:
	movs r5, #1
	movs r0, #0
_08182554:
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	bl Cos
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08182574:
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _0818259A
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _081825A0
	str r0, [r4, #0x1c]
_0818259A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081825A0: .4byte 0x081825A5
	thumb_func_end sub_081824F4

	thumb_func_start sub_081825A4
sub_081825A4: @ 0x081825A4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	bl Cos
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #0xc
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0x3f
	ble _081825EE
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _0818260C
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x26]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
_081825EE:
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	movs r3, #0
	bl HandleSetAffineData
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818260C: .4byte 0x08184C35
	thumb_func_end sub_081825A4

	thumb_func_start sub_08182610
sub_08182610: @ 0x08182610
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _08182644
	movs r0, #0
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08182640
	str r0, [r4, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	b _081826A0
	.align 2, 0
_08182640: .4byte 0x08184C35
_08182644:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08182650
	adds r0, #0xff
_08182650:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _08182678
	adds r0, #0x7f
_08182678:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x60
	bl Sin
	adds r1, r0, #0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r1, r0
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	movs r3, #0
	bl HandleSetAffineData
_081826A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08182610

	thumb_func_start pokemonanimfunc_3E
pokemonanimfunc_3E: @ 0x081826A8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _081826CE
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
	movs r1, #8
	strh r1, [r4, #0x3a]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x38]
	strh r1, [r4, #0x36]
_081826CE:
	adds r0, r4, #0
	bl sub_08182610
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_3E

	thumb_func_start sub_081826DC
sub_081826DC: @ 0x081826DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _08182710
	movs r0, #0
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _0818270C
	str r0, [r4, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	b _0818276C
	.align 2, 0
_0818270C: .4byte 0x08184C35
_08182710:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _0818271C
	adds r0, #0xff
_0818271C:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _08182744
	adds r0, #0x3f
_08182744:
	asrs r0, r0, #6
	lsls r0, r0, #6
	subs r0, r1, r0
	lsls r0, r0, #0x11
	asrs r0, r0, #0x10
	movs r1, #0x80
	bl Sin
	adds r1, r0, #0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r1, r0
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	movs r3, #0
	bl HandleSetAffineData
_0818276C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081826DC

	thumb_func_start pokemonanimfunc_3F
pokemonanimfunc_3F: @ 0x08182774
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _0818279A
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
	movs r0, #4
	strh r0, [r4, #0x3a]
	adds r0, #0xfc
	strh r0, [r4, #0x38]
	movs r0, #0x10
	strh r0, [r4, #0x36]
_0818279A:
	adds r0, r4, #0
	bl sub_081826DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_3F

	thumb_func_start pokemonanimfunc_40
pokemonanimfunc_40: @ 0x081827A8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _081827C6
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
_081827C6:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _081827F4
	movs r0, #0
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	bl sub_0817F628
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	ldr r0, _081827F0
	str r0, [r4, #0x1c]
	b _0818284A
	.align 2, 0
_081827F0: .4byte 0x08184C35
_081827F4:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08182800
	adds r0, #0xff
_08182800:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08182824
	adds r0, #0x7f
_08182824:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x60
	bl Sin
	adds r2, r0, #0
	lsls r2, r2, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r2, r2, r0
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
_0818284A:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_40

	thumb_func_start pokemonanimfunc_41
pokemonanimfunc_41: @ 0x08182858
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08182876
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
_08182876:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _081828A4
	movs r0, #0
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	bl sub_0817F628
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	ldr r0, _081828A0
	str r0, [r4, #0x1c]
	b _0818290A
	.align 2, 0
_081828A0: .4byte 0x08184C35
_081828A4:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	cmp r0, #0
	bge _081828B0
	adds r1, #0xff
_081828B0:
	asrs r1, r1, #8
	lsls r1, r1, #8
	subs r1, r0, r1
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	lsrs r1, r1, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x10
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	cmp r0, #0
	bge _081828DC
	adds r1, #0xff
_081828DC:
	asrs r1, r1, #8
	lsls r1, r1, #8
	subs r1, r0, r1
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	lsrs r1, r1, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x40
	bl Sin
	adds r2, r0, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r2, r2, r0
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
_0818290A:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_41

	thumb_func_start pokemonanimfunc_42
pokemonanimfunc_42: @ 0x08182918
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08182936
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
_08182936:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _08182964
	movs r0, #0
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	bl sub_0817F628
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	ldr r0, _08182960
	str r0, [r4, #0x1c]
	b _081829C2
	.align 2, 0
_08182960: .4byte 0x08184C35
_08182964:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08182970
	adds r0, #0xff
_08182970:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	cmp r0, #0
	bge _08182996
	adds r1, #0xff
_08182996:
	asrs r1, r1, #8
	lsls r1, r1, #8
	subs r1, r0, r1
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	lsrs r1, r1, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x60
	bl Sin
	adds r2, r0, #0
	lsls r2, r2, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r2, r2, r0
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
_081829C2:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_42

	thumb_func_start pokemonanimfunc_43
pokemonanimfunc_43: @ 0x081829D0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	ble _081829F4
	ldr r0, _081829F0
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x3a]
	b _08182AB4
	.align 2, 0
_081829F0: .4byte 0x08184C35
_081829F4:
	movs r1, #0x32
	ldrsh r2, [r4, r1]
	adds r0, r2, #0
	cmp r2, #0
	bge _08182A02
	ldr r1, _08182A28
	adds r0, r2, r1
_08182A02:
	asrs r3, r0, #9
	adds r1, r3, #0
	adds r0, r1, #0
	cmp r1, #0
	bge _08182A0E
	adds r0, r1, #3
_08182A0E:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08182A50
	cmp r0, #1
	bgt _08182A2C
	cmp r0, #0
	beq _08182A36
	b _08182A8E
	.align 2, 0
_08182A28: .4byte 0x000001FF
_08182A2C:
	cmp r0, #2
	beq _08182A64
	cmp r0, #3
	beq _08182A76
	b _08182A8E
_08182A36:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	rsbs r0, r0, #0
	cmp r0, #0
	bge _08182A48
	ldr r1, _08182A4C
	adds r0, r0, r1
_08182A48:
	asrs r0, r0, #9
	b _08182A8C
	.align 2, 0
_08182A4C: .4byte 0x000001FF
_08182A50:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08182A5E
	adds r0, #0x1f
_08182A5E:
	asrs r0, r0, #5
	subs r0, #0x10
	b _08182A8C
_08182A64:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08182A72
	adds r0, #0x1f
_08182A72:
	asrs r0, r0, #5
	b _08182A8C
_08182A76:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	rsbs r0, r0, #0
	cmp r0, #0
	bge _08182A88
	ldr r1, _08182AC0
	adds r0, r0, r1
_08182A88:
	asrs r0, r0, #9
	adds r0, #0x10
_08182A8C:
	strh r0, [r4, #0x24]
_08182A8E:
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08182A9A
	adds r0, #0x7f
_08182A9A:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #0x18
	strh r0, [r4, #0x32]
_08182AB4:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182AC0: .4byte 0x000001FF
	thumb_func_end pokemonanimfunc_43

	thumb_func_start pokemonanimfunc_44
pokemonanimfunc_44: @ 0x08182AC4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08182AE0
	strh r0, [r4, #0x3a]
	movs r0, #0x40
	strh r0, [r4, #0x3c]
	adds r0, r1, #1
	strh r0, [r4, #0x32]
_08182AE0:
	ldrh r0, [r4, #0x3c]
	adds r1, r0, #0
	adds r1, #8
	movs r3, #0
	strh r1, [r4, #0x3c]
	ldrh r2, [r4, #0x3a]
	movs r5, #0x3a
	ldrsh r0, [r4, r5]
	cmp r0, #4
	bne _08182AFE
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _08182B0C
	b _08182B06
_08182AFE:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _08182B0C
_08182B06:
	strh r3, [r4, #0x3c]
	adds r0, r2, #1
	strh r0, [r4, #0x3a]
_08182B0C:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bhi _08182BB4
	lsls r0, r0, #2
	ldr r1, _08182B20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08182B20: .4byte 0x08182B24
_08182B24: @ jump table
	.4byte _08182B98 @ case 0
	.4byte _08182B38 @ case 1
	.4byte _08182B56 @ case 2
	.4byte _08182B78 @ case 3
	.4byte _08182B98 @ case 4
_08182B38:
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r1, #8
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	movs r5, #0x3c
	ldrsh r0, [r4, r5]
	movs r1, #8
	bl Sin
	subs r0, #8
	strh r0, [r4, #0x26]
	b _08182BBE
_08182B56:
	ldrh r0, [r4, #0x3c]
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	adds r0, #8
	strh r0, [r4, #0x24]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	b _08182BBE
_08182B78:
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	movs r1, #8
	bl Cos
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x3c]
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	adds r0, #8
	strh r0, [r4, #0x26]
	b _08182BBE
_08182B98:
	movs r5, #0x3c
	ldrsh r0, [r4, r5]
	movs r1, #8
	bl Sin
	subs r0, #8
	strh r0, [r4, #0x24]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r1, #8
	bl Cos
	strh r0, [r4, #0x26]
	b _08182BBE
_08182BB4:
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	ldr r0, _08182BCC
	str r0, [r4, #0x1c]
_08182BBE:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08182BCC: .4byte 0x08184C35
	thumb_func_end pokemonanimfunc_44

	thumb_func_start pokemonanimfunc_45
pokemonanimfunc_45: @ 0x08182BD0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_081805C0
	ldr r0, _08182BE8
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182BE8: .4byte 0x081805C1
	thumb_func_end pokemonanimfunc_45

	thumb_func_start pokemonanimfunc_46
pokemonanimfunc_46: @ 0x08182BEC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x50
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817F7A8
	ldr r0, _08182C04
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182C04: .4byte 0x0817F7A9
	thumb_func_end pokemonanimfunc_46

	thumb_func_start pokemonanimfunc_47
pokemonanimfunc_47: @ 0x08182C08
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x50
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817F824
	ldr r0, _08182C20
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182C20: .4byte 0x0817F825
	thumb_func_end pokemonanimfunc_47

	thumb_func_start pokemonanimfunc_48
pokemonanimfunc_48: @ 0x08182C24
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182C58
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r1, #6]
	ldrh r0, [r4, #0x3a]
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_081807AC
	ldr r0, _08182C5C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182C58: .4byte 0x03001240
_08182C5C: .4byte 0x081807AD
	thumb_func_end pokemonanimfunc_48

	thumb_func_start pokemonanimfunc_49
pokemonanimfunc_49: @ 0x08182C60
	push {lr}
	movs r1, #1
	strh r1, [r0, #0x3a]
	bl pokemonanimfunc_05
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_49

	thumb_func_start pokemonanimfunc_4A
pokemonanimfunc_4A: @ 0x08182C70
	push {lr}
	movs r1, #1
	strh r1, [r0, #0x3a]
	bl pokemonanimfunc_48
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_4A

	thumb_func_start pokemonanimfunc_4B
pokemonanimfunc_4B: @ 0x08182C80
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08182C8E
	strh r0, [r4, #0x2e]
_08182C8E:
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _08182CA2
	adds r0, r4, #0
	bl sub_0817FACC
	movs r0, #1
	b _08182CA4
_08182CA2:
	subs r0, r1, #1
_08182CA4:
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_4B

	thumb_func_start pokemonanimfunc_4C
pokemonanimfunc_4C: @ 0x08182CAC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1e
	strh r0, [r4, #0x2e]
	movs r0, #3
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_0817FB88
	ldr r0, _08182CC8
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182CC8: .4byte 0x0817FB89
	thumb_func_end pokemonanimfunc_4C

	thumb_func_start pokemonanimfunc_4D
pokemonanimfunc_4D: @ 0x08182CCC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1e
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817FBF0
	ldr r0, _08182CE4
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182CE4: .4byte 0x0817FBF1
	thumb_func_end pokemonanimfunc_4D

	thumb_func_start pokemonanimfunc_4E
pokemonanimfunc_4E: @ 0x08182CE8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	strh r0, [r4, #0x2e]
	ldr r2, _08182D20
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #6]
	strh r3, [r1]
	movs r0, #2
	strh r0, [r1, #4]
	adds r0, r4, #0
	bl sub_0817FCDC
	ldr r0, _08182D24
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182D20: .4byte 0x03001240
_08182D24: .4byte 0x0817FCDD
	thumb_func_end pokemonanimfunc_4E

	thumb_func_start pokemonanimfunc_4F
pokemonanimfunc_4F: @ 0x08182D28
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182D60
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #6]
	movs r0, #3
	strh r0, [r1, #8]
	movs r0, #0xc
	strh r0, [r1, #2]
	adds r0, r4, #0
	bl sub_0817FE9C
	ldr r0, _08182D64
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182D60: .4byte 0x03001240
_08182D64: .4byte 0x0817FE9D
	thumb_func_end pokemonanimfunc_4F

	thumb_func_start pokemonanimfunc_50
pokemonanimfunc_50: @ 0x08182D68
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x18
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_081801C8
	ldr r0, _08182D80
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182D80: .4byte 0x081801C9
	thumb_func_end pokemonanimfunc_50

	thumb_func_start pokemonanimfunc_51
pokemonanimfunc_51: @ 0x08182D84
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_081803A4
	ldr r0, _08182D9C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182D9C: .4byte 0x081803A5
	thumb_func_end pokemonanimfunc_51

	thumb_func_start pokemonanimfunc_52
pokemonanimfunc_52: @ 0x08182DA0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817F8A0
	ldr r0, _08182DB8
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182DB8: .4byte 0x0817F8A1
	thumb_func_end pokemonanimfunc_52

	thumb_func_start pokemonanimfunc_53
pokemonanimfunc_53: @ 0x08182DBC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182DEC
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x3c
	strh r0, [r1]
	movs r0, #0x1e
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_0817FDE8
	ldr r0, _08182DF0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182DEC: .4byte 0x03001240
_08182DF0: .4byte 0x0817FDE9
	thumb_func_end pokemonanimfunc_53

	thumb_func_start pokemonanimfunc_54
pokemonanimfunc_54: @ 0x08182DF4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182E24
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1, #2]
	movs r0, #2
	strh r0, [r1, #4]
	adds r0, r4, #0
	bl sub_081810C0
	ldr r0, _08182E28
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182E24: .4byte 0x03001240
_08182E28: .4byte 0x081810C1
	thumb_func_end pokemonanimfunc_54

	thumb_func_start pokemonanimfunc_55
pokemonanimfunc_55: @ 0x08182E2C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182E5C
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #4
	strh r0, [r1, #6]
	movs r0, #2
	strh r0, [r1, #4]
	adds r0, r4, #0
	bl sub_081816BC
	ldr r0, _08182E60
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182E5C: .4byte 0x03001240
_08182E60: .4byte 0x081816BD
	thumb_func_end pokemonanimfunc_55

	thumb_func_start pokemonanimfunc_56
pokemonanimfunc_56: @ 0x08182E64
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	strh r0, [r4, #0x2e]
	ldr r2, _08182EA0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1, #8]
	movs r0, #2
	strh r0, [r1, #4]
	adds r0, r4, #0
	bl HandleStartAffineAnim
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	bl sub_08181968
	ldr r0, _08182EA4
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08182EA0: .4byte 0x03001240
_08182EA4: .4byte 0x08181969
	thumb_func_end pokemonanimfunc_56

	thumb_func_start pokemonanimfunc_07
pokemonanimfunc_07: @ 0x08182EA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182ED4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #2
	strh r0, [r1, #6]
	adds r0, r4, #0
	bl sub_08181B94
	ldr r0, _08182ED8
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182ED4: .4byte 0x03001240
_08182ED8: .4byte 0x08181B95
	thumb_func_end pokemonanimfunc_07

	thumb_func_start pokemonanimfunc_08
pokemonanimfunc_08: @ 0x08182EDC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182F0C
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #4
	strh r0, [r1, #6]
	movs r0, #2
	strh r0, [r1, #4]
	adds r0, r4, #0
	bl sub_08181B94
	ldr r0, _08182F10
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182F0C: .4byte 0x03001240
_08182F10: .4byte 0x08181B95
	thumb_func_end pokemonanimfunc_08

	thumb_func_start pokemonanimfunc_0B
pokemonanimfunc_0B: @ 0x08182F14
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182F40
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x64
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_08181380
	ldr r0, _08182F44
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182F40: .4byte 0x03001240
_08182F44: .4byte 0x08181381
	thumb_func_end pokemonanimfunc_0B

	thumb_func_start pokemonanimfunc_0C
pokemonanimfunc_0C: @ 0x08182F48
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182F78
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x32
	strh r0, [r1, #8]
	movs r0, #2
	strh r0, [r1, #4]
	adds r0, r4, #0
	bl sub_08181380
	ldr r0, _08182F7C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182F78: .4byte 0x03001240
_08182F7C: .4byte 0x08181381
	thumb_func_end pokemonanimfunc_0C

	thumb_func_start pokemonanimfunc_0D
pokemonanimfunc_0D: @ 0x08182F80
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182FAC
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x64
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_08181480
	ldr r0, _08182FB0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182FAC: .4byte 0x03001240
_08182FB0: .4byte 0x08181481
	thumb_func_end pokemonanimfunc_0D

	thumb_func_start pokemonanimfunc_0E
pokemonanimfunc_0E: @ 0x08182FB4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08182FE4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x32
	strh r0, [r1, #8]
	movs r0, #2
	strh r0, [r1, #4]
	adds r0, r4, #0
	bl sub_08181480
	ldr r0, _08182FE8
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08182FE4: .4byte 0x03001240
_08182FE8: .4byte 0x08181481
	thumb_func_end pokemonanimfunc_0E

	thumb_func_start sub_08182FEC
sub_08182FEC: @ 0x08182FEC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	ble _08183008
	ldr r0, _08183004
	str r0, [r4, #0x1c]
	movs r0, #0
	b _0818302C
	.align 2, 0
_08183004: .4byte 0x08184C35
_08183008:
	adds r1, r2, #0
	adds r1, #0xc0
	adds r0, r1, #0
	cmp r1, #0
	bge _08183016
	ldr r3, _0818303C
	adds r0, r2, r3
_08183016:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, #0x3c]
	adds r0, r0, r1
_0818302C:
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	ldrh r3, [r4, #0x32]
	adds r0, r0, r3
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818303C: .4byte 0x000001BF
	thumb_func_end sub_08182FEC

	thumb_func_start pokemonanimfunc_57
pokemonanimfunc_57: @ 0x08183040
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3c
	strh r0, [r4, #0x2e]
	movs r0, #3
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_08182FEC
	ldr r0, _0818305C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818305C: .4byte 0x08182FED
	thumb_func_end pokemonanimfunc_57

	thumb_func_start pokemonanimfunc_58
pokemonanimfunc_58: @ 0x08183060
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1e
	strh r0, [r4, #0x2e]
	movs r0, #3
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_08182FEC
	ldr r0, _0818307C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818307C: .4byte 0x08182FED
	thumb_func_end pokemonanimfunc_58

	thumb_func_start pokemonanimfunc_59
pokemonanimfunc_59: @ 0x08183080
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	ble _081830A4
	ldr r0, _081830A0
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x3a]
	b _08183168
	.align 2, 0
_081830A0: .4byte 0x08184C35
_081830A4:
	movs r1, #0x32
	ldrsh r2, [r4, r1]
	adds r0, r2, #0
	cmp r2, #0
	bge _081830B2
	ldr r1, _081830D8
	adds r0, r2, r1
_081830B2:
	asrs r3, r0, #9
	adds r1, r3, #0
	adds r0, r1, #0
	cmp r1, #0
	bge _081830BE
	adds r0, r1, #3
_081830BE:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08183114
	cmp r0, #1
	bgt _081830DC
	cmp r0, #0
	beq _081830E6
	b _08183144
	.align 2, 0
_081830D8: .4byte 0x000001FF
_081830DC:
	cmp r0, #2
	beq _081830F8
	cmp r0, #3
	beq _08183130
	b _08183144
_081830E6:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _081830F4
	adds r0, #0x1f
_081830F4:
	asrs r0, r0, #5
	b _08183142
_081830F8:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	rsbs r0, r0, #0
	cmp r0, #0
	bge _0818310A
	ldr r1, _08183110
	adds r0, r0, r1
_0818310A:
	asrs r0, r0, #9
	b _08183142
	.align 2, 0
_08183110: .4byte 0x000001FF
_08183114:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	rsbs r0, r0, #0
	cmp r0, #0
	bge _08183126
	ldr r1, _0818312C
	adds r0, r0, r1
_08183126:
	asrs r0, r0, #9
	adds r0, #0x10
	b _08183142
	.align 2, 0
_0818312C: .4byte 0x000001FF
_08183130:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0818313E
	adds r0, #0x1f
_0818313E:
	asrs r0, r0, #5
	subs r0, #0x10
_08183142:
	strh r0, [r4, #0x24]
_08183144:
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08183150
	adds r0, #0x7f
_08183150:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #0x18
	strh r0, [r4, #0x32]
_08183168:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_59

	thumb_func_start sub_08183174
sub_08183174: @ 0x08183174
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	movs r2, #0x38
	ldrsh r1, [r6, r2]
	movs r2, #0x3a
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _081831C6
	mov r0, r8
	strh r0, [r6, #0x26]
	strh r0, [r6, #0x38]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	ldrh r1, [r6, #0x36]
	movs r2, #0x36
	ldrsh r0, [r6, r2]
	cmp r0, #1
	bgt _081831BC
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _081831B8
	str r0, [r6, #0x1c]
	b _08183288
	.align 2, 0
_081831B8: .4byte 0x08184C35
_081831BC:
	subs r0, r1, #1
	strh r0, [r6, #0x36]
	mov r0, r8
	strh r0, [r6, #0x3c]
	b _08183288
_081831C6:
	movs r1, #0x38
	ldrsh r5, [r6, r1]
	lsls r0, r5, #7
	movs r2, #0x3a
	ldrsh r4, [r6, r2]
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r4, #0
	bge _081831E0
	adds r4, #3
_081831E0:
	asrs r1, r4, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r1
	blt _08183204
	cmp r5, r0
	bge _08183204
	ldrh r0, [r6, #0x3c]
	adds r0, #0x33
	strh r0, [r6, #0x3c]
	movs r1, #0xff
	mov r8, r1
	ands r1, r0
	mov r8, r1
_08183204:
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08183228
	lsls r4, r2, #0x10
	asrs r0, r4, #0x10
	movs r1, #0x10
	bl Sin
	ldr r2, _08183224
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	b _0818323E
	.align 2, 0
_08183224: .4byte 0xFFFFFF00
_08183228:
	lsls r4, r2, #0x10
	asrs r0, r4, #0x10
	movs r1, #0x10
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
_0818323E:
	adds r7, r4, #0
	ldrh r4, [r6, #0x34]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r5, r8
	adds r0, r4, #0
	movs r1, #5
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl Sin
	adds r5, r0, #0
	asrs r0, r7, #0x10
	adds r1, r4, #0
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r1, #0
	subs r2, r2, r5
	subs r2, r2, r0
	mov r0, sb
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	movs r3, #0
	bl SetAffineData
	ldrh r0, [r6, #0x38]
	adds r0, #1
	strh r0, [r6, #0x38]
_08183288:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08183174

	thumb_func_start pokemonanimfunc_5A
pokemonanimfunc_5A: @ 0x08183294
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r6, [r5, r0]
	cmp r6, #0
	bne _081832B6
	movs r4, #1
	strh r4, [r5, #0x32]
	adds r0, r5, #0
	bl HandleStartAffineAnim
	strh r4, [r5, #0x36]
	movs r0, #0x28
	strh r0, [r5, #0x3a]
	strh r0, [r5, #0x34]
	strh r6, [r5, #0x38]
	strh r6, [r5, #0x3c]
_081832B6:
	adds r0, r5, #0
	bl sub_08183174
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_5A

	thumb_func_start sub_081832C4
sub_081832C4: @ 0x081832C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	movs r2, #0x38
	ldrsh r1, [r6, r2]
	movs r2, #0x3a
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _08183316
	mov r0, r8
	strh r0, [r6, #0x38]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	ldrh r1, [r6, #0x36]
	movs r2, #0x36
	ldrsh r0, [r6, r2]
	cmp r0, #1
	bgt _0818330C
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _08183308
	str r0, [r6, #0x1c]
	b _081833E4
	.align 2, 0
_08183308: .4byte 0x08184C35
_0818330C:
	subs r0, r1, #1
	strh r0, [r6, #0x36]
	mov r0, r8
	strh r0, [r6, #0x3c]
	b _081833E4
_08183316:
	movs r1, #0x38
	ldrsh r5, [r6, r1]
	lsls r0, r5, #7
	movs r2, #0x3a
	ldrsh r4, [r6, r2]
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r4, #0
	bge _08183332
	adds r4, #3
_08183332:
	asrs r1, r4, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r1
	blt _08183358
	cmp r5, r0
	bge _08183358
	ldrh r0, [r6, #0x3c]
	adds r0, #0x33
	strh r0, [r6, #0x3c]
	movs r1, #0xff
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
_08183358:
	ldrh r0, [r6, #0x34]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0818339C
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	bl Sin
	adds r4, r0, #0
	mov r5, r8
	adds r0, r7, #0
	movs r1, #5
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r0, r5, #0
	bl Sin
	ldr r1, _08183398
	adds r0, r0, r1
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	b _081833CE
	.align 2, 0
_08183398: .4byte 0xFFFFFF00
_0818339C:
	mov r4, r8
	adds r0, r7, #0
	movs r1, #5
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r0, r4, #0
	bl Sin
	adds r4, r0, #0
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r4
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
_081833CE:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	movs r3, #0
	bl SetAffineData
	ldrh r0, [r6, #0x38]
	adds r0, #1
	strh r0, [r6, #0x38]
_081833E4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081832C4

	thumb_func_start pokemonanimfunc_5B
pokemonanimfunc_5B: @ 0x081833F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r6, [r5, r0]
	cmp r6, #0
	bne _08183412
	movs r4, #1
	strh r4, [r5, #0x32]
	adds r0, r5, #0
	bl HandleStartAffineAnim
	strh r4, [r5, #0x36]
	movs r0, #0x28
	strh r0, [r5, #0x3a]
	strh r0, [r5, #0x34]
	strh r6, [r5, #0x38]
	strh r6, [r5, #0x3c]
_08183412:
	adds r0, r5, #0
	bl sub_081832C4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_5B

	thumb_func_start sub_08183420
sub_08183420: @ 0x08183420
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r3, _0818347C
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r0, r1, r3
	ldrb r5, [r0]
	adds r2, r5, #0
	cmp r5, #0xff
	beq _08183452
	ldrh r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08183452:
	adds r0, r3, #1
	adds r0, r1, r0
	ldrb r6, [r0]
	movs r7, #0
	cmp r2, #0xfe
	beq _0818346E
	mov r1, sb
	subs r0, r6, r1
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0818346E:
	cmp r5, #0xff
	bne _08183484
	ldr r0, _08183480
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x26]
	b _081834B6
	.align 2, 0
_0818347C: .4byte 0x085D34E0
_08183480: .4byte 0x08184C35
_08183484:
	mov r1, r8
	adds r1, #0xc0
	adds r0, r1, #0
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	adds r1, r7, #0
	bl Sin
	adds r0, r0, r7
	strh r0, [r4, #0x26]
	cmp sb, r6
	bne _081834A8
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	movs r0, #0
	b _081834B4
_081834A8:
	ldrh r0, [r4, #0x2e]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x3a]
	adds r0, #1
_081834B4:
	strh r0, [r4, #0x3a]
_081834B6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08183420

	thumb_func_start pokemonanimfunc_5C
pokemonanimfunc_5C: @ 0x081834C4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	movs r0, #6
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_08183420
	ldr r0, _081834E0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081834E0: .4byte 0x08183421
	thumb_func_end pokemonanimfunc_5C

	thumb_func_start pokemonanimfunc_5D
pokemonanimfunc_5D: @ 0x081834E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x46
	strh r0, [r4, #0x2e]
	movs r0, #6
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_0817FB88
	ldr r0, _08183500
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183500: .4byte 0x0817FB89
	thumb_func_end pokemonanimfunc_5D

	thumb_func_start pokemonanimfunc_5E
pokemonanimfunc_5E: @ 0x08183504
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_0817F7A8
	ldr r0, _0818351C
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818351C: .4byte 0x0817F7A9
	thumb_func_end pokemonanimfunc_5E

	thumb_func_start pokemonanimfunc_5F
pokemonanimfunc_5F: @ 0x08183520
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	ble _0818353C
	ldr r0, _08183538
	str r0, [r4, #0x1c]
	movs r0, #0
	b _08183576
	.align 2, 0
_08183538: .4byte 0x08184C35
_0818353C:
	movs r0, #1
	ands r0, r1
	movs r5, #0xff
	cmp r0, #0
	bne _08183548
	movs r5, #1
_08183548:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	lsls r0, r0, #7
	movs r1, #0x28
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0818355C
	adds r0, #0xff
_0818355C:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #9
	bl Sin
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
_08183576:
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_5F

	thumb_func_start pokemonanimfunc_60
pokemonanimfunc_60: @ 0x08183584
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x32]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	ble _081835A0
	ldr r0, _0818359C
	str r0, [r4, #0x1c]
	movs r0, #0
	b _081835DA
	.align 2, 0
_0818359C: .4byte 0x08184C35
_081835A0:
	movs r0, #1
	ands r0, r1
	movs r5, #0xff
	cmp r0, #0
	bne _081835AC
	movs r5, #1
_081835AC:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	lsls r0, r0, #7
	movs r1, #0x28
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _081835C0
	adds r0, #0xff
_081835C0:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc
	bl Sin
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
_081835DA:
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_60

	thumb_func_start pokemonanimfunc_61
pokemonanimfunc_61: @ 0x081835E8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x46
	strh r0, [r4, #0x2e]
	movs r0, #6
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_08182FEC
	ldr r0, _08183604
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183604: .4byte 0x08182FED
	thumb_func_end pokemonanimfunc_61

	thumb_func_start pokemonanimfunc_62
pokemonanimfunc_62: @ 0x08183608
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x18
	strh r0, [r4, #0x2e]
	movs r0, #6
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_08183420
	ldr r0, _08183624
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183624: .4byte 0x08183421
	thumb_func_end pokemonanimfunc_62

	thumb_func_start pokemonanimfunc_63
pokemonanimfunc_63: @ 0x08183628
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x38
	strh r0, [r4, #0x2e]
	movs r0, #9
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	bl sub_08183420
	ldr r0, _08183644
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183644: .4byte 0x08183421
	thumb_func_end pokemonanimfunc_63

	thumb_func_start pokemonanimfunc_64
pokemonanimfunc_64: @ 0x08183648
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F604
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08183680
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #6]
	movs r0, #6
	strh r0, [r1, #8]
	movs r0, #0x18
	strh r0, [r1, #2]
	adds r0, r4, #0
	bl sub_0817FE9C
	ldr r0, _08183684
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183680: .4byte 0x03001240
_08183684: .4byte 0x0817FE9D
	thumb_func_end pokemonanimfunc_64

	thumb_func_start sub_08183688
sub_08183688: @ 0x08183688
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r5, #0
	movs r0, #0x38
	ldrsh r1, [r7, r0]
	movs r2, #0x3a
	ldrsh r0, [r7, r2]
	cmp r1, r0
	ble _081836D8
	strh r5, [r7, #0x26]
	strh r5, [r7, #0x38]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r7, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	ldrh r1, [r7, #0x36]
	movs r2, #0x36
	ldrsh r0, [r7, r2]
	cmp r0, #1
	bgt _081836D0
	adds r0, r7, #0
	bl sub_0817F628
	ldr r0, _081836CC
	str r0, [r7, #0x1c]
	b _081837D8
	.align 2, 0
_081836CC: .4byte 0x08184C35
_081836D0:
	subs r0, r1, #1
	strh r0, [r7, #0x36]
	strh r5, [r7, #0x3c]
	b _081837D8
_081836D8:
	movs r0, #0x38
	ldrsh r6, [r7, r0]
	lsls r0, r6, #7
	movs r1, #0x3a
	ldrsh r4, [r7, r1]
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r4, #0
	bge _081836F2
	adds r4, #3
_081836F2:
	asrs r1, r4, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r1
	blt _08183712
	cmp r6, r0
	bge _08183712
	ldrh r0, [r7, #0x3c]
	adds r0, #0x33
	strh r0, [r7, #0x3c]
	movs r5, #0xff
	ands r5, r0
_08183712:
	ldrh r0, [r7, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bne _0818375C
	lsls r2, r2, #0x10
	mov r8, r2
	asrs r0, r2, #0x10
	mov r1, sb
	bl Sin
	adds r4, r0, #0
	lsls r6, r5, #0x10
	asrs r5, r6, #0x10
	mov r0, sb
	movs r1, #5
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r0, r5, #0
	bl Sin
	ldr r2, _08183758
	adds r4, r4, r2
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, r8
	b _08183796
	.align 2, 0
_08183758: .4byte 0xFFFFFF00
_0818375C:
	lsls r2, r2, #0x10
	mov r8, r2
	asrs r0, r2, #0x10
	mov r1, sb
	bl Sin
	adds r6, r0, #0
	lsls r5, r5, #0x10
	asrs r4, r5, #0x10
	mov r0, sb
	movs r1, #5
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r0, r4, #0
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r6
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	mov r0, r8
	adds r6, r5, #0
_08183796:
	asrs r0, r0, #0x10
	mov r1, sb
	bl Sin
	adds r5, r0, #0
	asrs r4, r6, #0x10
	mov r0, sb
	movs r1, #5
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r1, #0
	subs r2, r2, r5
	subs r2, r2, r0
	mov r0, sl
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r7, #0
	movs r3, #0
	bl SetAffineData
	ldrh r0, [r7, #0x38]
	adds r0, #1
	strh r0, [r7, #0x38]
_081837D8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08183688

	thumb_func_start pokemonanimfunc_65
pokemonanimfunc_65: @ 0x081837E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r6, [r5, r0]
	cmp r6, #0
	bne _0818380A
	movs r4, #1
	strh r4, [r5, #0x32]
	adds r0, r5, #0
	bl HandleStartAffineAnim
	strh r4, [r5, #0x36]
	movs r0, #0x28
	strh r0, [r5, #0x3a]
	strh r0, [r5, #0x34]
	strh r6, [r5, #0x38]
	strh r6, [r5, #0x3c]
_0818380A:
	adds r0, r5, #0
	bl sub_08183688
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_65

	thumb_func_start pokemonanimfunc_66
pokemonanimfunc_66: @ 0x08183818
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	ble _0818383C
	ldr r0, _08183838
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x3a]
	b _08183900
	.align 2, 0
_08183838: .4byte 0x08184C35
_0818383C:
	movs r1, #0x32
	ldrsh r2, [r4, r1]
	adds r0, r2, #0
	cmp r2, #0
	bge _0818384A
	ldr r1, _08183870
	adds r0, r2, r1
_0818384A:
	asrs r3, r0, #9
	adds r1, r3, #0
	adds r0, r1, #0
	cmp r1, #0
	bge _08183856
	adds r0, r1, #3
_08183856:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _081838AC
	cmp r0, #1
	bgt _08183874
	cmp r0, #0
	beq _0818387E
	b _081838DC
	.align 2, 0
_08183870: .4byte 0x000001FF
_08183874:
	cmp r0, #2
	beq _08183890
	cmp r0, #3
	beq _081838C8
	b _081838DC
_0818387E:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0818388C
	adds r0, #0x1f
_0818388C:
	asrs r0, r0, #5
	b _081838DA
_08183890:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	rsbs r0, r0, #0
	cmp r0, #0
	bge _081838A2
	ldr r1, _081838A8
	adds r0, r0, r1
_081838A2:
	asrs r0, r0, #9
	b _081838DA
	.align 2, 0
_081838A8: .4byte 0x000001FF
_081838AC:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	rsbs r0, r0, #0
	cmp r0, #0
	bge _081838BE
	ldr r1, _081838C4
	adds r0, r0, r1
_081838BE:
	asrs r0, r0, #9
	adds r0, #0x10
	b _081838DA
	.align 2, 0
_081838C4: .4byte 0x000001FF
_081838C8:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _081838D6
	adds r0, #0x1f
_081838D6:
	asrs r0, r0, #5
	subs r0, #0x10
_081838DA:
	strh r0, [r4, #0x24]
_081838DC:
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _081838E8
	adds r0, #0x7f
_081838E8:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #0x30
	strh r0, [r4, #0x32]
_08183900:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_66

	thumb_func_start pokemonanimfunc_67
pokemonanimfunc_67: @ 0x0818390C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	ble _08183930
	ldr r0, _0818392C
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x3a]
	b _081839EC
	.align 2, 0
_0818392C: .4byte 0x08184C35
_08183930:
	movs r1, #0x32
	ldrsh r2, [r4, r1]
	adds r0, r2, #0
	cmp r2, #0
	bge _0818393E
	ldr r1, _08183964
	adds r0, r2, r1
_0818393E:
	asrs r3, r0, #9
	adds r1, r3, #0
	adds r0, r1, #0
	cmp r1, #0
	bge _0818394A
	adds r0, r1, #3
_0818394A:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _081839A0
	cmp r0, #1
	bgt _08183968
	cmp r0, #0
	beq _08183972
	b _081839D0
	.align 2, 0
_08183964: .4byte 0x000001FF
_08183968:
	cmp r0, #2
	beq _08183984
	cmp r0, #3
	beq _081839BC
	b _081839D0
_08183972:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08183980
	adds r0, #0x1f
_08183980:
	asrs r0, r0, #5
	b _081839CE
_08183984:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	rsbs r0, r0, #0
	cmp r0, #0
	bge _08183996
	ldr r1, _0818399C
	adds r0, r0, r1
_08183996:
	asrs r0, r0, #9
	b _081839CE
	.align 2, 0
_0818399C: .4byte 0x000001FF
_081839A0:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	rsbs r0, r0, #0
	cmp r0, #0
	bge _081839B2
	ldr r1, _081839B8
	adds r0, r0, r1
_081839B2:
	asrs r0, r0, #9
	adds r0, #0x10
	b _081839CE
	.align 2, 0
_081839B8: .4byte 0x000001FF
_081839BC:
	lsls r0, r3, #9
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _081839CA
	adds r0, #0x1f
_081839CA:
	asrs r0, r0, #5
	subs r0, #0x10
_081839CE:
	strh r0, [r4, #0x24]
_081839D0:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0x60
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #0x40
	strh r0, [r4, #0x32]
_081839EC:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_67

	thumb_func_start sub_081839F8
sub_081839F8: @ 0x081839F8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08183A0A
	strh r0, [r4, #0x34]
_08183A0A:
	ldr r7, _08183A6C
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r5, r7, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl __divsi3
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08183A38
	ldrh r0, [r4, #0x34]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x34]
	strh r1, [r4, #0x32]
_08183A38:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r6, r0, r1
	adds r0, r6, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x38
	ldrsh r5, [r4, r1]
	adds r1, r5, #0
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bne _08183A78
	ldrh r0, [r4, #0x3a]
	subs r0, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08183A74
	ldr r0, _08183A70
	str r0, [r4, #0x1c]
	b _08183AB2
	.align 2, 0
_08183A6C: .4byte 0x085D381E
_08183A70: .4byte 0x08184C35
_08183A74:
	strh r1, [r4, #0x32]
	b _08183AB2
_08183A78:
	adds r0, r6, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r5, r0
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	strh r0, [r4, #0x24]
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r7, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r4, #0x38]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_0817F5B8
_08183AB2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081839F8

	thumb_func_start pokemonanimfunc_68
pokemonanimfunc_68: @ 0x08183AB8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	strh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl sub_081839F8
	ldr r0, _08183AD4
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183AD4: .4byte 0x081839F9
	thumb_func_end pokemonanimfunc_68

	thumb_func_start pokemonanimfunc_69
pokemonanimfunc_69: @ 0x08183AD8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	strh r0, [r4, #0x38]
	movs r0, #1
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl sub_081839F8
	ldr r0, _08183AF4
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183AF4: .4byte 0x081839F9
	thumb_func_end pokemonanimfunc_69

	thumb_func_start pokemonanimfunc_6A
pokemonanimfunc_6A: @ 0x08183AF8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	strh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl sub_081839F8
	ldr r0, _08183B14
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183B14: .4byte 0x081839F9
	thumb_func_end pokemonanimfunc_6A

	thumb_func_start sub_08183B18
sub_08183B18: @ 0x08183B18
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0xff
	ble _08183B5A
	ldrh r1, [r4, #0x38]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bgt _08183B50
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08183B4C
	str r0, [r4, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	b _08183B94
	.align 2, 0
_08183B4C: .4byte 0x08184C35
_08183B50:
	subs r0, r1, #1
	movs r1, #0
	strh r0, [r4, #0x38]
	strh r1, [r4, #0x3c]
	b _08183B94
_08183B5A:
	ldrh r0, [r4, #0x3a]
	adds r0, r1, r0
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _08183B6E
	strh r5, [r4, #0x3c]
_08183B6E:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x40
	bl Sin
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r5, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
_08183B94:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08183B18

	thumb_func_start pokemonanimfunc_6B
pokemonanimfunc_6B: @ 0x08183B9C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183BC2
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
	movs r0, #4
	strh r0, [r4, #0x3a]
	movs r0, #1
	strh r0, [r4, #0x38]
_08183BC2:
	adds r0, r4, #0
	bl sub_08183B18
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_6B

	thumb_func_start pokemonanimfunc_6C
pokemonanimfunc_6C: @ 0x08183BD4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183BFA
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x3a]
	movs r0, #2
	strh r0, [r4, #0x38]
_08183BFA:
	adds r0, r4, #0
	bl sub_08183B18
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_6C

	thumb_func_start pokemonanimfunc_6D
pokemonanimfunc_6D: @ 0x08183C0C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183C34
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x3a]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x38]
	movs r0, #0x10
	strh r0, [r4, #0x36]
_08183C34:
	adds r0, r4, #0
	bl sub_08182610
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_6D

	thumb_func_start pokemonanimfunc_6E
pokemonanimfunc_6E: @ 0x08183C40
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183C66
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
	movs r0, #4
	strh r0, [r4, #0x3a]
	adds r0, #0xfc
	strh r0, [r4, #0x38]
	movs r0, #0x10
	strh r0, [r4, #0x36]
_08183C66:
	adds r0, r4, #0
	bl sub_08182610
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_6E

	thumb_func_start pokemonanimfunc_6F
pokemonanimfunc_6F: @ 0x08183C74
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183C9C
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x3a]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x38]
	movs r0, #0x10
	strh r0, [r4, #0x36]
_08183C9C:
	adds r0, r4, #0
	bl sub_081826DC
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_6F

	thumb_func_start pokemonanimfunc_70
pokemonanimfunc_70: @ 0x08183CA8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183CCE
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	strh r5, [r4, #0x3c]
	movs r1, #8
	strh r1, [r4, #0x3a]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x38]
	strh r1, [r4, #0x36]
_08183CCE:
	adds r0, r4, #0
	bl sub_081826DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_70

	thumb_func_start pokemonanimfunc_71
pokemonanimfunc_71: @ 0x08183CDC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08183CF6
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #5
	strh r0, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x3a]
_08183CF6:
	adds r0, r4, #0
	bl sub_081806D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_71

	thumb_func_start pokemonanimfunc_72
pokemonanimfunc_72: @ 0x08183D04
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08183D1E
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #3
	strh r0, [r4, #0x3c]
	movs r0, #4
	strh r0, [r4, #0x3a]
_08183D1E:
	adds r0, r4, #0
	bl sub_081806D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_72

	thumb_func_start pokemonanimfunc_73
pokemonanimfunc_73: @ 0x08183D2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r6, [r5, r0]
	cmp r6, #0
	bne _08183D4E
	movs r4, #1
	strh r4, [r5, #0x32]
	adds r0, r5, #0
	bl HandleStartAffineAnim
	strh r4, [r5, #0x36]
	movs r0, #0x1e
	strh r0, [r5, #0x3a]
	movs r0, #0x3c
	strh r0, [r5, #0x34]
	strh r6, [r5, #0x3c]
_08183D4E:
	adds r0, r5, #0
	bl sub_08183174
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_73

	thumb_func_start pokemonanimfunc_74
pokemonanimfunc_74: @ 0x08183D5C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183D80
	movs r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #2
	strh r0, [r4, #0x36]
	movs r0, #0x14
	strh r0, [r4, #0x3a]
	movs r0, #0x46
	strh r0, [r4, #0x34]
	strh r5, [r4, #0x3c]
_08183D80:
	adds r0, r4, #0
	bl sub_08183174
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_74

	thumb_func_start pokemonanimfunc_75
pokemonanimfunc_75: @ 0x08183D8C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183DB2
	movs r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #2
	strh r0, [r4, #0x36]
	movs r0, #0x14
	strh r0, [r4, #0x3a]
	movs r0, #0x46
	strh r0, [r4, #0x34]
	strh r5, [r4, #0x38]
	strh r5, [r4, #0x3c]
_08183DB2:
	adds r0, r4, #0
	bl sub_081832C4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_75

	thumb_func_start pokemonanimfunc_76
pokemonanimfunc_76: @ 0x08183DC0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r6, [r5, r0]
	cmp r6, #0
	bne _08183DE4
	movs r4, #1
	strh r4, [r5, #0x32]
	adds r0, r5, #0
	bl HandleStartAffineAnim
	strh r4, [r5, #0x36]
	movs r0, #0x1e
	strh r0, [r5, #0x3a]
	movs r0, #0x3c
	strh r0, [r5, #0x34]
	strh r6, [r5, #0x38]
	strh r6, [r5, #0x3c]
_08183DE4:
	adds r0, r5, #0
	bl sub_081832C4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_76

	thumb_func_start pokemonanimfunc_77
pokemonanimfunc_77: @ 0x08183DF0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08183E16
	movs r0, #1
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #2
	strh r0, [r4, #0x36]
	movs r0, #0x14
	strh r0, [r4, #0x3a]
	movs r0, #0x46
	strh r0, [r4, #0x34]
	strh r5, [r4, #0x38]
	strh r5, [r4, #0x3c]
_08183E16:
	adds r0, r4, #0
	bl sub_08183688
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_77

	thumb_func_start pokemonanimfunc_78
pokemonanimfunc_78: @ 0x08183E24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r6, [r5, r0]
	cmp r6, #0
	bne _08183E48
	movs r4, #1
	strh r4, [r5, #0x32]
	adds r0, r5, #0
	bl HandleStartAffineAnim
	strh r4, [r5, #0x36]
	movs r0, #0x1e
	strh r0, [r5, #0x3a]
	movs r0, #0x3c
	strh r0, [r5, #0x34]
	strh r6, [r5, #0x38]
	strh r6, [r5, #0x3c]
_08183E48:
	adds r0, r5, #0
	bl sub_08183688
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_78

	thumb_func_start sub_08183E54
sub_08183E54: @ 0x08183E54
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	cmp r0, #0xff
	ble _08183E96
	ldrh r2, [r4, #0x3a]
	movs r3, #0x3a
	ldrsh r0, [r4, r3]
	cmp r0, #1
	bgt _08183E7C
	ldr r0, _08183E78
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	b _08183EEA
	.align 2, 0
_08183E78: .4byte 0x08184C35
_08183E7C:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08183E88
	adds r0, #0xff
_08183E88:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	strh r0, [r4, #0x3c]
	subs r0, r2, #1
	strh r0, [r4, #0x3a]
	b _08183EEA
_08183E96:
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	adds r1, r2, #0
	adds r1, #0xc0
	adds r0, r1, #0
	cmp r1, #0
	bge _08183EB8
	ldr r3, _08183EF0
	adds r0, r2, r3
_08183EB8:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08183EDA
	movs r3, #0x26
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
_08183EDA:
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x34]
	ldrh r2, [r4, #0x3c]
	adds r0, r0, r2
	strh r0, [r4, #0x3c]
_08183EEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08183EF0: .4byte 0x000001BF
	thumb_func_end sub_08183E54

	thumb_func_start pokemonanimfunc_79
pokemonanimfunc_79: @ 0x08183EF4
	push {lr}
	adds r1, r0, #0
	movs r0, #0x32
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bne _08183F12
	movs r0, #1
	strh r0, [r1, #0x32]
	strh r0, [r1, #0x3a]
	strh r2, [r1, #0x3c]
	movs r0, #0xc
	strh r0, [r1, #0x38]
	strh r0, [r1, #0x36]
	movs r0, #4
	strh r0, [r1, #0x34]
_08183F12:
	adds r0, r1, #0
	bl sub_08183E54
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_79

	thumb_func_start pokemonanimfunc_7A
pokemonanimfunc_7A: @ 0x08183F1C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x32
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bne _08183F3A
	movs r0, #1
	strh r0, [r1, #0x32]
	strh r0, [r1, #0x3a]
	strh r2, [r1, #0x3c]
	movs r0, #0xc
	strh r0, [r1, #0x38]
	strh r0, [r1, #0x36]
	movs r0, #6
	strh r0, [r1, #0x34]
_08183F3A:
	adds r0, r1, #0
	bl sub_08183E54
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_7A

	thumb_func_start pokemonanimfunc_7B
pokemonanimfunc_7B: @ 0x08183F44
	push {lr}
	adds r1, r0, #0
	movs r0, #0x32
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bne _08183F64
	movs r0, #1
	strh r0, [r1, #0x32]
	movs r0, #2
	strh r0, [r1, #0x3a]
	strh r2, [r1, #0x3c]
	movs r0, #0xc
	strh r0, [r1, #0x38]
	strh r0, [r1, #0x36]
	movs r0, #8
	strh r0, [r1, #0x34]
_08183F64:
	adds r0, r1, #0
	bl sub_08183E54
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_7B

	thumb_func_start sub_08183F70
sub_08183F70: @ 0x08183F70
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _08183FA8
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	ldrh r2, [r5, #0x36]
	movs r3, #0x36
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bgt _08183F98
	ldr r0, _08183F94
	str r0, [r5, #0x1c]
	b _08183FA0
	.align 2, 0
_08183F94: .4byte 0x08184C35
_08183F98:
	adds r0, r2, #1
	movs r1, #0
	strh r0, [r5, #0x36]
	strh r1, [r5, #0x3c]
_08183FA0:
	movs r0, #0
	strh r0, [r5, #0x24]
	strh r0, [r5, #0x26]
	b _08184034
_08183FA8:
	cmp r0, #0x9f
	ble _08183FD2
	cmp r0, r1
	ble _08183FB2
	strh r1, [r5, #0x3c]
_08183FB2:
	movs r0, #0x3c
	ldrsh r1, [r5, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08183FBE
	adds r0, #0xff
_08183FBE:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	bl Sin
	rsbs r0, r0, #0
	b _08184000
_08183FD2:
	cmp r0, #0x5f
	ble _08183FF6
	movs r0, #0x60
	movs r1, #6
	bl Sin
	adds r4, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	subs r0, #0x60
	lsls r0, r0, #0x11
	asrs r0, r0, #0x10
	movs r1, #4
	bl Sin
	subs r4, r4, r0
	strh r4, [r5, #0x26]
	b _08184002
_08183FF6:
	movs r2, #0x3c
	ldrsh r0, [r5, r2]
	movs r1, #6
	bl Sin
_08184000:
	strh r0, [r5, #0x26]
_08184002:
	movs r3, #0x3c
	ldrsh r0, [r5, r3]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl Sin
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r5, #0x36]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0818402A
	lsls r0, r2, #0x10
	rsbs r0, r0, #0
	lsrs r2, r0, #0x10
_0818402A:
	strh r2, [r5, #0x24]
	ldrh r0, [r5, #0x34]
	ldrh r3, [r5, #0x3c]
	adds r0, r0, r3
	strh r0, [r5, #0x3c]
_08184034:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08183F70

	thumb_func_start pokemonanimfunc_7C
pokemonanimfunc_7C: @ 0x0818403C
	push {lr}
	adds r2, r0, #0
	movs r0, #0x32
	ldrsh r3, [r2, r0]
	cmp r3, #0
	bne _0818405C
	movs r1, #1
	strh r1, [r2, #0x32]
	movs r0, #2
	strh r0, [r2, #0x3a]
	strh r3, [r2, #0x3c]
	movs r0, #0x10
	strh r0, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #4
	strh r0, [r2, #0x34]
_0818405C:
	adds r0, r2, #0
	bl sub_08183F70
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_7C

	thumb_func_start pokemonanimfunc_7D
pokemonanimfunc_7D: @ 0x08184068
	push {lr}
	adds r2, r0, #0
	movs r0, #0x32
	ldrsh r3, [r2, r0]
	cmp r3, #0
	bne _08184088
	movs r1, #1
	strh r1, [r2, #0x32]
	movs r0, #2
	strh r0, [r2, #0x3a]
	strh r3, [r2, #0x3c]
	movs r0, #0x10
	strh r0, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #6
	strh r0, [r2, #0x34]
_08184088:
	adds r0, r2, #0
	bl sub_08183F70
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_7D

	thumb_func_start pokemonanimfunc_7E
pokemonanimfunc_7E: @ 0x08184094
	push {lr}
	adds r2, r0, #0
	movs r0, #0x32
	ldrsh r3, [r2, r0]
	cmp r3, #0
	bne _081840B4
	movs r1, #1
	strh r1, [r2, #0x32]
	movs r0, #3
	strh r0, [r2, #0x3a]
	strh r3, [r2, #0x3c]
	movs r0, #0x10
	strh r0, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #8
	strh r0, [r2, #0x34]
_081840B4:
	adds r0, r2, #0
	bl sub_08183F70
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_7E

	thumb_func_start pokemonanimfunc_7F
pokemonanimfunc_7F: @ 0x081840C0
	push {lr}
	adds r2, r0, #0
	movs r0, #0x32
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bne _081840DE
	movs r0, #1
	strh r0, [r2, #0x32]
	strh r0, [r2, #0x3a]
	strh r1, [r2, #0x3c]
	movs r1, #4
	strh r1, [r2, #0x38]
	movs r0, #6
	strh r0, [r2, #0x36]
	strh r1, [r2, #0x34]
_081840DE:
	adds r0, r2, #0
	bl sub_08183E54
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_7F

	thumb_func_start pokemonanimfunc_80
pokemonanimfunc_80: @ 0x081840E8
	push {lr}
	adds r1, r0, #0
	movs r0, #0x32
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bne _08184106
	movs r0, #1
	strh r0, [r1, #0x32]
	strh r0, [r1, #0x3a]
	strh r2, [r1, #0x3c]
	movs r0, #4
	strh r0, [r1, #0x38]
	movs r0, #6
	strh r0, [r1, #0x36]
	strh r0, [r1, #0x34]
_08184106:
	adds r0, r1, #0
	bl sub_08183E54
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_80

	thumb_func_start pokemonanimfunc_81
pokemonanimfunc_81: @ 0x08184110
	push {lr}
	adds r1, r0, #0
	movs r0, #0x32
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bne _08184132
	movs r0, #1
	strh r0, [r1, #0x32]
	movs r0, #2
	strh r0, [r1, #0x3a]
	strh r2, [r1, #0x3c]
	movs r0, #4
	strh r0, [r1, #0x38]
	movs r0, #6
	strh r0, [r1, #0x36]
	movs r0, #8
	strh r0, [r1, #0x34]
_08184132:
	adds r0, r1, #0
	bl sub_08183E54
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_81

	thumb_func_start sub_0818413C
sub_0818413C: @ 0x0818413C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	lsls r0, r0, #7
	movs r2, #0x3c
	ldrsh r1, [r4, r2]
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r1, #8
	rsbs r0, r0, #0
	strh r0, [r4, #0x3a]
	movs r0, #0x36
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	movs r3, #0
	bl sub_0817F29C
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x3a]
	adds r0, r4, #0
	adds r1, r2, #0
	bl HandleSetAffineData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818413C

	thumb_func_start pokemonanimfunc_82
pokemonanimfunc_82: @ 0x08184188
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _081841AC
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #0x3c
	strh r0, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x38]
	ldr r0, _081841EC
	strh r0, [r4, #0x36]
	movs r0, #1
	strh r0, [r4, #0x34]
	strh r5, [r4, #0x2e]
_081841AC:
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _081841F8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r2, #0
	strh r2, [r4, #0x24]
	strh r2, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _081841F4
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _081841F0
	str r0, [r4, #0x1c]
	b _08184204
	.align 2, 0
_081841EC: .4byte 0x0000FFE0
_081841F0: .4byte 0x08184C35
_081841F4:
	strh r2, [r4, #0x32]
	b _081841FE
_081841F8:
	adds r0, r4, #0
	bl sub_0818413C
_081841FE:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_08184204:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_82

	thumb_func_start pokemonanimfunc_83
pokemonanimfunc_83: @ 0x0818420C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _08184230
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #0x5a
	strh r0, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x38]
	ldr r0, _08184270
	strh r0, [r4, #0x36]
	movs r0, #1
	strh r0, [r4, #0x34]
	strh r5, [r4, #0x2e]
_08184230:
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _0818427C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r2, #0
	strh r2, [r4, #0x24]
	strh r2, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _08184278
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08184274
	str r0, [r4, #0x1c]
	b _08184288
	.align 2, 0
_08184270: .4byte 0x0000FFE0
_08184274: .4byte 0x08184C35
_08184278:
	strh r2, [r4, #0x32]
	b _08184282
_0818427C:
	adds r0, r4, #0
	bl sub_0818413C
_08184282:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_08184288:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_83

	thumb_func_start pokemonanimfunc_84
pokemonanimfunc_84: @ 0x08184290
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r5, [r4, r0]
	cmp r5, #0
	bne _081842B4
	adds r0, r4, #0
	bl HandleStartAffineAnim
	movs r0, #0x1e
	strh r0, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x38]
	ldr r0, _081842F4
	strh r0, [r4, #0x36]
	movs r0, #2
	strh r0, [r4, #0x34]
	strh r5, [r4, #0x2e]
_081842B4:
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _08184300
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	movs r2, #0
	strh r2, [r4, #0x24]
	strh r2, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _081842FC
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _081842F8
	str r0, [r4, #0x1c]
	b _0818430C
	.align 2, 0
_081842F4: .4byte 0x0000FFE0
_081842F8: .4byte 0x08184C35
_081842FC:
	strh r2, [r4, #0x32]
	b _08184306
_08184300:
	adds r0, r4, #0
	bl sub_0818413C
_08184306:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
_0818430C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_84

	thumb_func_start sub_08184314
sub_08184314: @ 0x08184314
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x32
	ldrsh r1, [r6, r0]
	movs r2, #0x3c
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _08184348
	movs r0, #0
	strh r0, [r6, #0x26]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r1, r2, #0
	movs r3, #0
	bl HandleSetAffineData
	adds r0, r6, #0
	bl sub_0817F628
	ldr r0, _08184344
	str r0, [r6, #0x1c]
	b _081843F0
	.align 2, 0
_08184344: .4byte 0x08184C35
_08184348:
	movs r1, #0x32
	ldrsh r0, [r6, r1]
	movs r2, #0x3a
	ldrsh r4, [r6, r2]
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _08184368
	adds r0, #0xff
_08184368:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r6, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _081843A4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x20
	bl Sin
	movs r1, #0x80
	lsls r1, r1, #1
	adds r5, r1, #0
	adds r0, r0, r5
	strh r0, [r6, #0x36]
	adds r0, r4, #0
	movs r1, #0x20
	bl Sin
	adds r0, r0, r5
	strh r0, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #0x20
	b _081843CA
_081843A4:
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #8
	bl Sin
	movs r2, #0x80
	lsls r2, r2, #1
	adds r5, r2, #0
	adds r0, r0, r5
	strh r0, [r6, #0x36]
	adds r0, r4, #0
	movs r1, #8
	bl Sin
	adds r0, r0, r5
	strh r0, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #8
_081843CA:
	bl Sin
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _081843DC
	adds r0, #7
_081843DC:
	lsrs r0, r0, #3
	strh r0, [r6, #0x26]
	movs r0, #0x36
	ldrsh r1, [r6, r0]
	movs r0, #0x38
	ldrsh r2, [r6, r0]
	adds r0, r6, #0
	movs r3, #0
	bl HandleSetAffineData
_081843F0:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08184314

	thumb_func_start pokemonanimfunc_85
pokemonanimfunc_85: @ 0x081843FC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0818441C
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x26]
	adds r0, #2
	strh r0, [r4, #0x26]
	movs r0, #0x28
	strh r0, [r4, #0x3a]
	movs r0, #0x50
	strh r0, [r4, #0x3c]
_0818441C:
	adds r0, r4, #0
	bl sub_08184314
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_85

	thumb_func_start pokemonanimfunc_86
pokemonanimfunc_86: @ 0x08184428
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08184446
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x26]
	adds r0, #2
	strh r0, [r4, #0x26]
	movs r0, #0x28
	strh r0, [r4, #0x3a]
	strh r0, [r4, #0x3c]
_08184446:
	adds r0, r4, #0
	bl sub_08184314
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_86

	thumb_func_start pokemonanimfunc_87
pokemonanimfunc_87: @ 0x08184454
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08184472
	adds r0, r4, #0
	bl HandleStartAffineAnim
	ldrh r0, [r4, #0x26]
	adds r0, #2
	strh r0, [r4, #0x26]
	movs r0, #0x50
	strh r0, [r4, #0x3a]
	strh r0, [r4, #0x3c]
_08184472:
	adds r0, r4, #0
	bl sub_08184314
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_87

	thumb_func_start sub_08184480
sub_08184480: @ 0x08184480
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x32]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmn r1, r0
	bgt _081844AA
	ldrh r0, [r4, #0x3a]
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	movs r0, #2
	strh r0, [r4, #0x3c]
	ldr r0, _081844B8
	str r0, [r4, #0x1c]
_081844AA:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081844B8: .4byte 0x081844BD
	thumb_func_end sub_08184480

	thumb_func_start sub_081844BC
sub_081844BC: @ 0x081844BC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x3c]
	ldrh r2, [r4, #0x24]
	adds r1, r0, r2
	strh r1, [r4, #0x24]
	adds r0, #1
	strh r0, [r4, #0x3c]
	lsls r1, r1, #0x10
	cmp r1, #0
	blt _081844DA
	ldr r0, _081844E8
	str r0, [r4, #0x1c]
_081844DA:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081844E8: .4byte 0x081844ED
	thumb_func_end sub_081844BC

	thumb_func_start sub_081844EC
sub_081844EC: @ 0x081844EC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x3c]
	ldrh r2, [r4, #0x24]
	adds r1, r0, r2
	strh r1, [r4, #0x24]
	adds r0, #1
	strh r0, [r4, #0x3c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x3a]
	movs r3, #0x3a
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _08184514
	strh r2, [r4, #0x24]
	ldr r0, _08184520
	str r0, [r4, #0x1c]
_08184514:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08184520: .4byte 0x08184525
	thumb_func_end sub_081844EC

	thumb_func_start sub_08184524
sub_08184524: @ 0x08184524
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r2, [r4, #0x34]
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08184544
	ldr r0, _08184540
	str r0, [r4, #0x1c]
	b _08184558
	.align 2, 0
_08184540: .4byte 0x08184565
_08184544:
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	adds r0, r2, #1
	strh r0, [r4, #0x34]
_08184558:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08184524

	thumb_func_start sub_08184564
sub_08184564: @ 0x08184564
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0817F5B8
	ldrh r0, [r4, #0x24]
	subs r0, #2
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08184586
	movs r0, #0
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	bl sub_0817F628
	ldr r0, _08184594
	str r0, [r4, #0x1c]
_08184586:
	adds r0, r4, #0
	bl sub_0817F5B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08184594: .4byte 0x08184C35
	thumb_func_end sub_08184564

	thumb_func_start pokemonanimfunc_88
pokemonanimfunc_88: @ 0x08184598
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	movs r2, #0
	movs r1, #4
	strh r1, [r4, #0x3c]
	movs r0, #0xc
	strh r0, [r4, #0x3a]
	movs r0, #0x10
	strh r0, [r4, #0x38]
	strh r1, [r4, #0x36]
	strh r2, [r4, #0x34]
	movs r0, #2
	strh r0, [r4, #0x32]
	ldr r0, _081845C0
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081845C0: .4byte 0x08184481
	thumb_func_end pokemonanimfunc_88

	thumb_func_start pokemonanimfunc_89
pokemonanimfunc_89: @ 0x081845C4
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	movs r2, #0
	movs r1, #2
	strh r1, [r4, #0x3c]
	movs r0, #8
	strh r0, [r4, #0x3a]
	movs r0, #0xc
	strh r0, [r4, #0x38]
	strh r1, [r4, #0x36]
	strh r2, [r4, #0x34]
	movs r0, #1
	strh r0, [r4, #0x32]
	ldr r0, _081845EC
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081845EC: .4byte 0x08184481
	thumb_func_end pokemonanimfunc_89

	thumb_func_start pokemonanimfunc_8A
pokemonanimfunc_8A: @ 0x081845F0
	push {r4, lr}
	adds r4, r0, #0
	bl HandleStartAffineAnim
	movs r1, #0
	strh r1, [r4, #0x3c]
	movs r0, #6
	strh r0, [r4, #0x3a]
	strh r0, [r4, #0x38]
	movs r0, #2
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x34]
	movs r0, #1
	strh r0, [r4, #0x32]
	ldr r0, _08184618
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08184618: .4byte 0x08184481
	thumb_func_end pokemonanimfunc_8A

	thumb_func_start sub_0818461C
sub_0818461C: @ 0x0818461C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x30]
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	cmp r0, #1
	ble _0818463A
	movs r2, #0x30
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	strh r0, [r1, #0x30]
	movs r0, #0
	b _0818463C
_0818463A:
	adds r0, r2, #1
_0818463C:
	strh r0, [r1, #0x2e]
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818461C

	thumb_func_start BackAnimBlendYellow
BackAnimBlendYellow: @ 0x08184644
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08184674
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r4, #0
	bl sub_0818461C
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r1, r0, r5
	ldrb r0, [r1, #1]
	cmp r0, #0xff
	bne _0818467C
	movs r0, #0
	strh r0, [r4, #0x24]
	ldr r0, _08184678
	str r0, [r4, #0x1c]
	b _081846DA
	.align 2, 0
_08184674: .4byte 0x085D38DC
_08184678: .4byte 0x08184C35
_0818467C:
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bne _081846AC
	ldrb r0, [r1]
	cmp r0, #0
	beq _0818469C
	ldrh r0, [r4, #0x3c]
	ldr r3, _08184698
	movs r1, #0x10
	movs r2, #0x10
	bl BlendPalette
	b _081846A8
	.align 2, 0
_08184698: .4byte 0x000003FF
_0818469C:
	ldrh r0, [r4, #0x3c]
	ldr r3, _081846D0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalette
_081846A8:
	movs r0, #0
	strh r0, [r4, #0x36]
_081846AC:
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r0, #1]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _081846D4
	movs r1, #0
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
	ldrh r0, [r4, #0x3a]
	adds r0, #1
	strh r0, [r4, #0x3a]
	b _081846DA
	.align 2, 0
_081846D0: .4byte 0x000003FF
_081846D4:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_081846DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BackAnimBlendYellow

	thumb_func_start pokemonanimfunc_8B
pokemonanimfunc_8B: @ 0x081846E0
	push {r4, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x32]
	adds r0, #1
	movs r3, #0
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0818470C
	ldrb r0, [r2, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	adds r0, r0, r1
	strh r0, [r2, #0x3c]
	strh r3, [r2, #0x3a]
	strh r3, [r2, #0x38]
	strh r3, [r2, #0x36]
	strh r3, [r2, #0x34]
_0818470C:
	adds r0, r2, #0
	bl BackAnimBlendYellow
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_8B

	thumb_func_start pokemonanimfunc_8C
pokemonanimfunc_8C: @ 0x08184718
	push {r4, r5, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x32]
	adds r0, #1
	movs r3, #0
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #1
	bne _08184744
	ldrb r0, [r2, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	adds r0, r0, r1
	strh r0, [r2, #0x3c]
	strh r3, [r2, #0x3a]
	strh r3, [r2, #0x38]
	strh r3, [r2, #0x36]
	strh r4, [r2, #0x34]
_08184744:
	adds r0, r2, #0
	bl BackAnimBlendYellow
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_8C

	thumb_func_start pokemonanimfunc_8D
pokemonanimfunc_8D: @ 0x08184750
	push {r4, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x32]
	adds r0, #1
	movs r3, #0
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0818477E
	ldrb r0, [r2, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	adds r0, r0, r1
	strh r0, [r2, #0x3c]
	strh r3, [r2, #0x3a]
	strh r3, [r2, #0x38]
	strh r3, [r2, #0x36]
	movs r0, #2
	strh r0, [r2, #0x34]
_0818477E:
	adds r0, r2, #0
	bl BackAnimBlendYellow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_8D

	thumb_func_start BackAnimBlend
BackAnimBlend: @ 0x0818478C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	ble _081847B0
	ldrh r0, [r4, #0x3c]
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x1f
	bl BlendPalette
	ldr r0, _081847AC
	str r0, [r4, #0x1c]
	b _081847D6
	.align 2, 0
_081847AC: .4byte 0x08184C35
_081847B0:
	movs r5, #0x32
	ldrsh r0, [r4, r5]
	movs r1, #0xc
	bl Sin
	adds r2, r0, #0
	strh r2, [r4, #0x3a]
	ldrh r0, [r4, #0x3c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _081847DC
	movs r5, #0x30
	ldrsh r1, [r4, r5]
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r3, [r1]
	movs r1, #0x10
	bl BlendPalette
_081847D6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081847DC: .4byte 0x085D38E8
	thumb_func_end BackAnimBlend

	thumb_func_start sub_081847E0
sub_081847E0: @ 0x081847E0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _08184878
	adds r0, r4, #0
	bl sub_0817F5B8
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0818481C
	ldrh r0, [r4, #0x34]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _08184818
	strh r2, [r4, #0x38]
_08184818:
	strh r2, [r4, #0x24]
	b _08184872
_0818481C:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	movs r0, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #7
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _08184850
	adds r0, #0xff
_08184850:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #6
	bl Sin
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r2, #0
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08184872:
	adds r0, r4, #0
	bl sub_0817F5B8
_08184878:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081847E0

	thumb_func_start pokemonanimfunc_8E
pokemonanimfunc_8E: @ 0x08184880
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _081848AA
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #2
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	strh r2, [r4, #0x30]
_081848AA:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _081848BA
	adds r0, r4, #0
	bl BackAnimBlend
_081848BA:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _081848DC
	adds r0, r4, #0
	bl sub_081847E0
_081848DC:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_8E

	thumb_func_start pokemonanimfunc_8F
pokemonanimfunc_8F: @ 0x081848E8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _08184912
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	strh r2, [r4, #0x30]
_08184912:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08184922
	adds r0, r4, #0
	bl BackAnimBlend
_08184922:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08184944
	adds r0, r4, #0
	bl sub_081847E0
_08184944:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_8F

	thumb_func_start pokemonanimfunc_90
pokemonanimfunc_90: @ 0x08184950
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _0818497A
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x50
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	strh r2, [r4, #0x30]
_0818497A:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0818498A
	adds r0, r4, #0
	bl BackAnimBlend
_0818498A:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _081849AC
	adds r0, r4, #0
	bl sub_081847E0
_081849AC:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_90

	thumb_func_start pokemonanimfunc_91
pokemonanimfunc_91: @ 0x081849B8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _081849E4
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #2
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	movs r0, #1
	strh r0, [r4, #0x30]
_081849E4:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _081849F4
	adds r0, r4, #0
	bl BackAnimBlend
_081849F4:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08184A16
	adds r0, r4, #0
	bl sub_081847E0
_08184A16:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_91

	thumb_func_start pokemonanimfunc_92
pokemonanimfunc_92: @ 0x08184A24
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _08184A4E
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	strh r0, [r4, #0x30]
_08184A4E:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08184A5E
	adds r0, r4, #0
	bl BackAnimBlend
_08184A5E:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08184A80
	adds r0, r4, #0
	bl sub_081847E0
_08184A80:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_92

	thumb_func_start pokemonanimfunc_93
pokemonanimfunc_93: @ 0x08184A8C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _08184AB6
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x50
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	strh r0, [r4, #0x30]
_08184AB6:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08184AC6
	adds r0, r4, #0
	bl BackAnimBlend
_08184AC6:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08184AE8
	adds r0, r4, #0
	bl sub_081847E0
_08184AE8:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_93

	thumb_func_start pokemonanimfunc_94
pokemonanimfunc_94: @ 0x08184AF4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _08184B1E
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0xa
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #2
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	strh r0, [r4, #0x30]
_08184B1E:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08184B2E
	adds r0, r4, #0
	bl BackAnimBlend
_08184B2E:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08184B50
	adds r0, r4, #0
	bl sub_081847E0
_08184B50:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pokemonanimfunc_94

	thumb_func_start pokemonanimfunc_95
pokemonanimfunc_95: @ 0x08184B5C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _08184B88
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	movs r0, #2
	strh r0, [r4, #0x30]
_08184B88:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08184B98
	adds r0, r4, #0
	bl BackAnimBlend
_08184B98:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08184BBA
	adds r0, r4, #0
	bl sub_081847E0
_08184BBA:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_95

	thumb_func_start pokemonanimfunc_96
pokemonanimfunc_96: @ 0x08184BC8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bne _08184BF4
	ldrb r0, [r4, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x50
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x38]
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x34]
	movs r0, #2
	strh r0, [r4, #0x30]
_08184BF4:
	ldrh r0, [r4, #0x32]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08184C04
	adds r0, r4, #0
	bl BackAnimBlend
_08184C04:
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r1, r0, r1
	movs r0, #0x80
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08184C26
	adds r0, r4, #0
	bl sub_081847E0
_08184C26:
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end pokemonanimfunc_96

	thumb_func_start SpriteCB_SetDummyOnAnimEnd
SpriteCB_SetDummyOnAnimEnd: @ 0x08184C34
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08184C48
	ldr r0, _08184C4C
	str r0, [r2, #0x1c]
_08184C48:
	pop {r0}
	bx r0
	.align 2, 0
_08184C4C: .4byte 0x08007141
	thumb_func_end SpriteCB_SetDummyOnAnimEnd

