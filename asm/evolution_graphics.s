.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start PokeEvoSprite_DummySpriteCB
PokeEvoSprite_DummySpriteCB: @ 0x0817B900
	bx lr
	.align 2, 0
	thumb_func_end PokeEvoSprite_DummySpriteCB

	thumb_func_start SetEvoSparklesMatrices
SetEvoSparklesMatrices: @ 0x0817B904
	push {r4, r5, lr}
	sub sp, #4
	movs r4, #0
	ldr r5, _0817B938
_0817B90C:
	adds r0, r4, #0
	adds r0, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xb
	bls _0817B90C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817B938: .4byte 0x085D2928
	thumb_func_end SetEvoSparklesMatrices

	thumb_func_start SpriteCB_PreEvoSparkleSet1
SpriteCB_PreEvoSparkleSet1: @ 0x0817B93C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	cmp r0, #8
	ble _0817B9EA
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x50
	bl __divsi3
	movs r1, #0x58
	subs r1, r1, r0
	strh r1, [r4, #0x22]
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0817B976
	adds r0, #3
_0817B976:
	asrs r0, r0, #2
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x3a]
	adds r0, #4
	strh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x3c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0817B9A0
	ldrh r0, [r4, #0x38]
	subs r0, #1
	strh r0, [r4, #0x38]
_0817B9A0:
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0817B9B6
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #1
	b _0817B9BC
_0817B9B6:
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x14
_0817B9BC:
	strb r0, [r1]
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bge _0817B9C8
	adds r0, #3
_0817B9C8:
	asrs r0, r0, #2
	adds r0, #0x14
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _0817B9D6
	movs r2, #0x1f
_0817B9D6:
	movs r0, #0x1f
	ands r2, r0
	lsls r2, r2, #1
	ldrb r1, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #3]
	b _0817B9F0
_0817B9EA:
	adds r0, r4, #0
	bl DestroySprite
_0817B9F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_PreEvoSparkleSet1

	thumb_func_start CreatePreEvoSparkleSet1
CreatePreEvoSparkleSet1: @ 0x0817B9F8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0817BA48
	movs r1, #0x78
	movs r2, #0x58
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0817BA42
	ldr r4, _0817BA4C
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r2, r3, r4
	movs r1, #0
	movs r0, #0x30
	strh r0, [r2, #0x38]
	strh r5, [r2, #0x3a]
	strh r1, [r2, #0x3c]
	ldrb r1, [r2, #1]
	subs r0, #0x34
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r2, #3]
	movs r1, #0x3e
	orrs r0, r1
	strb r0, [r2, #3]
	adds r4, #0x1c
	adds r3, r3, r4
	ldr r0, _0817BA50
	str r0, [r3]
_0817BA42:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817BA48: .4byte 0x085D2910
_0817BA4C: .4byte 0x020205AC
_0817BA50: .4byte 0x0817B93D
	thumb_func_end CreatePreEvoSparkleSet1

	thumb_func_start SpriteCB_PreEvoSparkleSet2
SpriteCB_PreEvoSparkleSet2: @ 0x0817BA54
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	cmp r0, #0x57
	bgt _0817BABA
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #5
	bl __divsi3
	adds r0, #8
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0817BA8C
	adds r0, #3
_0817BA8C:
	asrs r0, r0, #2
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x24]
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	movs r1, #0x28
	bl Sin
	adds r0, #8
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	b _0817BAC0
_0817BABA:
	adds r0, r4, #0
	bl DestroySprite
_0817BAC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SpriteCB_PreEvoSparkleSet2

	thumb_func_start CreatePreEvoSparkleSet2
CreatePreEvoSparkleSet2: @ 0x0817BAC8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0817BB24
	movs r1, #0x78
	movs r2, #8
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0817BB1E
	ldr r4, _0817BB28
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r2, r3, r4
	movs r1, #0
	movs r0, #8
	strh r0, [r2, #0x38]
	strh r5, [r2, #0x3a]
	strh r1, [r2, #0x3c]
	ldrb r1, [r2, #1]
	subs r0, #0xc
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r1, [r2, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x32
	orrs r0, r1
	strb r0, [r2, #3]
	adds r2, #0x43
	movs r0, #1
	strb r0, [r2]
	adds r4, #0x1c
	adds r3, r3, r4
	ldr r0, _0817BB2C
	str r0, [r3]
_0817BB1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817BB24: .4byte 0x085D2910
_0817BB28: .4byte 0x020205AC
_0817BB2C: .4byte 0x0817BA55
	thumb_func_end CreatePreEvoSparkleSet2

	thumb_func_start SpriteCB_PostEvoSparkleSet1
SpriteCB_PostEvoSparkleSet1: @ 0x0817BB30
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #8
	ble _0817BB6C
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x34]
	subs r0, r0, r1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3a]
	adds r0, #4
	strh r0, [r4, #0x3a]
	b _0817BB72
_0817BB6C:
	adds r0, r4, #0
	bl DestroySprite
_0817BB72:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PostEvoSparkleSet1

	thumb_func_start CreatePostEvoSparkleSet1
CreatePostEvoSparkleSet1: @ 0x0817BB78
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _0817BBD4
	movs r1, #0x78
	movs r2, #0x38
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0817BBCE
	ldr r4, _0817BBD8
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r2, r3, r4
	movs r1, #0
	strh r5, [r2, #0x34]
	movs r0, #0x78
	strh r0, [r2, #0x38]
	strh r6, [r2, #0x3a]
	strh r1, [r2, #0x3c]
	ldrb r1, [r2, #1]
	subs r0, #0x7c
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r2, #3]
	movs r1, #0x3e
	orrs r0, r1
	strb r0, [r2, #3]
	adds r2, #0x43
	movs r0, #1
	strb r0, [r2]
	adds r4, #0x1c
	adds r3, r3, r4
	ldr r0, _0817BBDC
	str r0, [r3]
_0817BBCE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817BBD4: .4byte 0x085D2910
_0817BBD8: .4byte 0x020205AC
_0817BBDC: .4byte 0x0817BB31
	thumb_func_end CreatePostEvoSparkleSet1

	thumb_func_start SpriteCB_PostEvoSparkleSet2
SpriteCB_PostEvoSparkleSet2: @ 0x0817BBE0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0817BBF4
	ldrh r0, [r4, #0x22]
	adds r0, #1
	strh r0, [r4, #0x22]
_0817BBF4:
	ldrh r1, [r4, #0x3a]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	cmp r0, #0x7f
	bgt _0817BCA4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x38
	ldrsh r1, [r4, r5]
	bl Sin
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	movs r1, #3
	bl __divsi3
	adds r0, #0x78
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x3a]
	adds r3, r0, #1
	strh r3, [r4, #0x3a]
	movs r5, #0x3a
	ldrsh r1, [r4, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _0817BC38
	adds r0, #0x7f
_0817BC38:
	asrs r0, r0, #7
	movs r1, #0x1f
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble _0817BC54
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #1
	strb r0, [r1]
	b _0817BC84
_0817BC54:
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x43
	movs r0, #0x14
	strb r0, [r1]
	ldrh r1, [r4, #0x3a]
	movs r5, #0x3a
	ldrsh r0, [r4, r5]
	cmp r0, #0x70
	ble _0817BC84
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0817BC84
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
_0817BC84:
	cmp r2, #0x13
	bhi _0817BC8A
	movs r2, #0x14
_0817BC8A:
	movs r0, #0x1f
	ands r2, r0
	lsls r2, r2, #1
	ldrb r1, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #3]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	b _0817BCAA
_0817BCA4:
	adds r0, r4, #0
	bl DestroySprite
_0817BCAA:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PostEvoSparkleSet2

	thumb_func_start CreatePostEvoSparkleSet2
CreatePostEvoSparkleSet2: @ 0x0817BCB0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _0817BD2C
	movs r1, #0x78
	movs r2, #0x38
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x40
	beq _0817BD20
	bl Random
	ldr r6, _0817BD30
	lsls r5, r4, #4
	adds r5, r5, r4
	lsls r5, r5, #2
	adds r4, r5, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #7
	bl __umodsi3
	movs r1, #3
	subs r1, r1, r0
	movs r0, #0
	mov r8, r0
	strh r1, [r4, #0x34]
	bl Random
	movs r1, #0x3f
	ands r1, r0
	adds r1, #0x30
	strh r1, [r4, #0x38]
	mov r0, r8
	strh r0, [r4, #0x3c]
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	movs r1, #0x3e
	orrs r0, r1
	strb r0, [r4, #3]
	adds r4, #0x43
	movs r0, #0x14
	strb r0, [r4]
	adds r6, #0x1c
	adds r5, r5, r6
	ldr r0, _0817BD34
	str r0, [r5]
_0817BD20:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817BD2C: .4byte 0x085D2910
_0817BD30: .4byte 0x020205AC
_0817BD34: .4byte 0x0817BBE1
	thumb_func_end CreatePostEvoSparkleSet2

	thumb_func_start LoadEvoSparkleSpriteAndPal
LoadEvoSparkleSpriteAndPal: @ 0x0817BD38
	push {lr}
	ldr r0, _0817BD4C
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _0817BD50
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_0817BD4C: .4byte 0x085D28DC
_0817BD50: .4byte 0x085D28EC
	thumb_func_end LoadEvoSparkleSpriteAndPal

	thumb_func_start LaunchTask_PreEvoSparklesSet1
LaunchTask_PreEvoSparklesSet1: @ 0x0817BD54
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0817BD7C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817BD80
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xa]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0817BD7C: .4byte 0x0817BD85
_0817BD80: .4byte 0x03005B60
	thumb_func_end LaunchTask_PreEvoSparklesSet1

	thumb_func_start EvoTask_BeginPreSet1_FadeAndPlaySE
EvoTask_BeginPreSet1_FadeAndPlaySE: @ 0x0817BD84
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SetEvoSparklesMatrices
	ldr r0, _0817BDC8
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	adds r5, r5, r0
	movs r0, #0
	strh r0, [r5, #0x26]
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	movs r0, #3
	lsls r0, r1
	ldr r1, _0817BDCC
	str r1, [sp]
	movs r1, #0xa
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0817BDD0
	str r0, [r5]
	movs r0, #0x8c
	bl PlaySE
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817BDC8: .4byte 0x03005B60
_0817BDCC: .4byte 0x00007FFF
_0817BDD0: .4byte 0x0817BDD5
	thumb_func_end EvoTask_BeginPreSet1_FadeAndPlaySE

	thumb_func_start EvoTask_CreatePreEvoSparkleSet1
EvoTask_CreatePreEvoSparkleSet1: @ 0x0817BDD4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0817BE2C
	lsls r3, r5, #2
	adds r0, r3, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r2, [r1, #0x26]
	movs r4, #0x26
	ldrsh r0, [r1, r4]
	cmp r0, #0x3f
	bgt _0817BE30
	movs r0, #7
	ands r0, r2
	adds r7, r3, #0
	cmp r0, #0
	bne _0817BE1A
	movs r4, #0
	adds r6, r1, #0
_0817BDFC:
	ldrh r1, [r6, #0x26]
	movs r0, #0x78
	ands r0, r1
	lsls r0, r0, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl CreatePreEvoSparkleSet1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0817BDFC
_0817BE1A:
	ldr r0, _0817BE2C
	adds r1, r7, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _0817BE38
	.align 2, 0
_0817BE2C: .4byte 0x03005B60
_0817BE30:
	movs r0, #0x60
	strh r0, [r1, #0x26]
	ldr r0, _0817BE40
	str r0, [r1]
_0817BE38:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817BE40: .4byte 0x0817BE45
	thumb_func_end EvoTask_CreatePreEvoSparkleSet1

	thumb_func_start EvoTask_WaitForPre1SparklesToGoUp
EvoTask_WaitForPre1SparklesToGoUp: @ 0x0817BE44
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0817BE64
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r3, [r1, #0x26]
	movs r4, #0x26
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0817BE68
	subs r0, r3, #1
	strh r0, [r1, #0x26]
	b _0817BE6E
	.align 2, 0
_0817BE64: .4byte 0x03005B60
_0817BE68:
	adds r0, r2, #0
	bl DestroyTask
_0817BE6E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end EvoTask_WaitForPre1SparklesToGoUp

	thumb_func_start LaunchTask_PostEvoSparklesSet1
LaunchTask_PostEvoSparklesSet1: @ 0x0817BE74
	push {lr}
	ldr r0, _0817BE88
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0817BE88: .4byte 0x0817BE8D
	thumb_func_end LaunchTask_PostEvoSparklesSet1

	thumb_func_start EvoTask_BeginPreSparklesSet2
EvoTask_BeginPreSparklesSet2: @ 0x0817BE8C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SetEvoSparklesMatrices
	ldr r1, _0817BEB8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x26]
	ldr r1, _0817BEBC
	str r1, [r0]
	movs r0, #0xb7
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817BEB8: .4byte 0x03005B60
_0817BEBC: .4byte 0x0817BEC1
	thumb_func_end EvoTask_BeginPreSparklesSet2

	thumb_func_start EvoTask_CreatePreEvoSparklesSet2
EvoTask_CreatePreEvoSparklesSet2: @ 0x0817BEC0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0817BF04
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	cmp r0, #0x5f
	bgt _0817BF08
	adds r6, r2, #0
	cmp r0, #5
	bgt _0817BEF2
	movs r4, #0
_0817BEE0:
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x18
	bl CreatePreEvoSparkleSet2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	bls _0817BEE0
_0817BEF2:
	ldr r0, _0817BF04
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _0817BF0C
	.align 2, 0
_0817BF04: .4byte 0x03005B60
_0817BF08:
	ldr r0, _0817BF14
	str r0, [r1]
_0817BF0C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817BF14: .4byte 0x0817BF19
	thumb_func_end EvoTask_CreatePreEvoSparklesSet2

	thumb_func_start EvoTask_DestroyPreSet2Task
EvoTask_DestroyPreSet2Task: @ 0x0817BF18
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EvoTask_DestroyPreSet2Task

	thumb_func_start LaunchTask_PreEvoSparklesSet2
LaunchTask_PreEvoSparklesSet2: @ 0x0817BF28
	push {lr}
	ldr r0, _0817BF3C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0817BF3C: .4byte 0x0817BF41
	thumb_func_end LaunchTask_PreEvoSparklesSet2

	thumb_func_start EvoTask_BeginPostSparklesSet1
EvoTask_BeginPostSparklesSet1: @ 0x0817BF40
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SetEvoSparklesMatrices
	ldr r1, _0817BF6C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x26]
	ldr r1, _0817BF70
	str r1, [r0]
	movs r0, #0x66
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817BF6C: .4byte 0x03005B60
_0817BF70: .4byte 0x0817BF75
	thumb_func_end EvoTask_BeginPostSparklesSet1

	thumb_func_start EvoTask_CreatePostEvoSparklesSet1
EvoTask_CreatePostEvoSparklesSet1: @ 0x0817BF74
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0817BFE0
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	cmp r0, #0x2f
	bgt _0817BFE4
	adds r6, r2, #0
	cmp r0, #0
	bne _0817BFA8
	movs r4, #0
_0817BF94:
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x18
	movs r1, #4
	bl CreatePostEvoSparkleSet1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0817BF94
_0817BFA8:
	ldr r0, _0817BFE0
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0x26
	ldrsh r0, [r1, r2]
	cmp r0, #0x20
	bne _0817BFCE
	movs r4, #0
_0817BFBA:
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x18
	movs r1, #8
	bl CreatePostEvoSparkleSet1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0817BFBA
_0817BFCE:
	ldr r0, _0817BFE0
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _0817BFE8
	.align 2, 0
_0817BFE0: .4byte 0x03005B60
_0817BFE4:
	ldr r0, _0817BFF0
	str r0, [r1]
_0817BFE8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817BFF0: .4byte 0x0817BFF5
	thumb_func_end EvoTask_CreatePostEvoSparklesSet1

	thumb_func_start EvoTask_DestroyPostSet1Task
EvoTask_DestroyPostSet1Task: @ 0x0817BFF4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EvoTask_DestroyPostSet1Task

	thumb_func_start LaunchTask_PostEvoSparklesSet2AndFlash
LaunchTask_PostEvoSparklesSet2AndFlash: @ 0x0817C004
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0817C02C
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817C030
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xc]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0817C02C: .4byte 0x0817C035
_0817C030: .4byte 0x03005B60
	thumb_func_end LaunchTask_PostEvoSparklesSet2AndFlash

	thumb_func_start EvoTask_BeginPostSparklesSet2_AndFlash
EvoTask_BeginPostSparklesSet2_AndFlash: @ 0x0817C034
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SetEvoSparklesMatrices
	ldr r0, _0817C07C
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	adds r5, r5, r0
	movs r0, #0
	strh r0, [r5, #0x26]
	ldr r0, _0817C080
	ldr r1, _0817C084
	movs r2, #0x30
	bl CpuSet
	ldr r0, _0817C088
	ldr r1, _0817C08C
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0817C090
	str r0, [r5]
	movs r0, #0xca
	bl PlaySE
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817C07C: .4byte 0x03005B60
_0817C080: .4byte 0x020377F4
_0817C084: .4byte 0x020373F4
_0817C088: .4byte 0xFFF9041C
_0817C08C: .4byte 0x00007FFF
_0817C090: .4byte 0x0817C095
	thumb_func_end EvoTask_BeginPostSparklesSet2_AndFlash

	thumb_func_start EvoTask_CreatePostEvoSparklesSet2_AndFlash
EvoTask_CreatePostEvoSparklesSet2_AndFlash: @ 0x0817C094
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0817C0CC
	lsls r5, r6, #2
	adds r0, r5, r6
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #0x26
	ldrsh r2, [r1, r0]
	cmp r2, #0x7f
	bgt _0817C110
	adds r0, r2, #0
	cmp r0, #0
	beq _0817C0D0
	cmp r0, #0x20
	beq _0817C0E4
	cmp r2, #0x31
	bgt _0817C0F4
	bl Random
	movs r1, #7
	ands r0, r1
	bl CreatePostEvoSparkleSet2
	b _0817C0F4
	.align 2, 0
_0817C0CC: .4byte 0x03005B60
_0817C0D0:
	movs r4, #0
_0817C0D2:
	adds r0, r4, #0
	bl CreatePostEvoSparkleSet2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0817C0D2
	b _0817C0F4
_0817C0E4:
	ldr r0, _0817C104
	ldr r1, _0817C108
	str r1, [sp]
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_0817C0F4:
	ldr r0, _0817C10C
	adds r1, r5, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _0817C114
	.align 2, 0
_0817C104: .4byte 0xFFFF041C
_0817C108: .4byte 0x00007FFF
_0817C10C: .4byte 0x03005B60
_0817C110:
	ldr r0, _0817C11C
	str r0, [r1]
_0817C114:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817C11C: .4byte 0x0817C121
	thumb_func_end EvoTask_CreatePostEvoSparklesSet2_AndFlash

	thumb_func_start EvoTask_DestroyPostSet2AndFlashTask
EvoTask_DestroyPostSet2AndFlashTask: @ 0x0817C120
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0817C13C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817C138
	adds r0, r2, #0
	bl DestroyTask
_0817C138:
	pop {r0}
	bx r0
	.align 2, 0
_0817C13C: .4byte 0x02037C74
	thumb_func_end EvoTask_DestroyPostSet2AndFlashTask

	thumb_func_start LaunchTask_PostEvoSparklesSet2AndFlash_Trade
LaunchTask_PostEvoSparklesSet2AndFlash_Trade: @ 0x0817C140
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0817C168
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817C16C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #0xc]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0817C168: .4byte 0x0817C171
_0817C16C: .4byte 0x03005B60
	thumb_func_end LaunchTask_PostEvoSparklesSet2AndFlash_Trade

	thumb_func_start EvoTask_BeginPostSparklesSet2_AndFlash_Trade
EvoTask_BeginPostSparklesSet2_AndFlash_Trade: @ 0x0817C170
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SetEvoSparklesMatrices
	ldr r0, _0817C1B8
	lsls r5, r4, #2
	adds r5, r5, r4
	lsls r5, r5, #3
	adds r5, r5, r0
	movs r0, #0
	strh r0, [r5, #0x26]
	ldr r0, _0817C1BC
	ldr r1, _0817C1C0
	movs r2, #0x30
	bl CpuSet
	ldr r0, _0817C1C4
	ldr r1, _0817C1C8
	str r1, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r0, _0817C1CC
	str r0, [r5]
	movs r0, #0xca
	bl PlaySE
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817C1B8: .4byte 0x03005B60
_0817C1BC: .4byte 0x020377F4
_0817C1C0: .4byte 0x020373F4
_0817C1C4: .4byte 0xFFF90400
_0817C1C8: .4byte 0x00007FFF
_0817C1CC: .4byte 0x0817C1D1
	thumb_func_end EvoTask_BeginPostSparklesSet2_AndFlash_Trade

	thumb_func_start EvoTask_CreatePostEvoSparklesSet2_AndFlash_Trade
EvoTask_CreatePostEvoSparklesSet2_AndFlash_Trade: @ 0x0817C1D0
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0817C208
	lsls r5, r6, #2
	adds r0, r5, r6
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #0x26
	ldrsh r2, [r1, r0]
	cmp r2, #0x7f
	bgt _0817C24C
	adds r0, r2, #0
	cmp r0, #0
	beq _0817C20C
	cmp r0, #0x20
	beq _0817C220
	cmp r2, #0x31
	bgt _0817C230
	bl Random
	movs r1, #7
	ands r0, r1
	bl CreatePostEvoSparkleSet2
	b _0817C230
	.align 2, 0
_0817C208: .4byte 0x03005B60
_0817C20C:
	movs r4, #0
_0817C20E:
	adds r0, r4, #0
	bl CreatePostEvoSparkleSet2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0817C20E
	b _0817C230
_0817C220:
	ldr r0, _0817C240
	ldr r1, _0817C244
	str r1, [sp]
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
_0817C230:
	ldr r0, _0817C248
	adds r1, r5, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _0817C250
	.align 2, 0
_0817C240: .4byte 0xFFFF0400
_0817C244: .4byte 0x00007FFF
_0817C248: .4byte 0x03005B60
_0817C24C:
	ldr r0, _0817C258
	str r0, [r1]
_0817C250:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817C258: .4byte 0x0817C121
	thumb_func_end EvoTask_CreatePostEvoSparklesSet2_AndFlash_Trade

	thumb_func_start EvoSparkle_DummySpriteCb
EvoSparkle_DummySpriteCb: @ 0x0817C25C
	bx lr
	.align 2, 0
	thumb_func_end EvoSparkle_DummySpriteCb

	thumb_func_start sub_0817C260
sub_0817C260: @ 0x0817C260
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r1, #0
	ldr r3, _0817C394
	ldr r2, _0817C398
_0817C27A:
	lsls r0, r1, #1
	add r0, sp
	adds r0, #4
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xf
	bls _0817C27A
	adds r0, r3, #0
	movs r1, #0
	bl CreateTask
	mov r8, r0
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0817C39C
	mov r1, r8
	lsls r6, r1, #2
	add r6, r8
	lsls r6, r6, #3
	adds r6, r6, r0
	strh r5, [r6, #0xa]
	strh r7, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r6, #0xe]
	movs r0, #0x10
	strh r0, [r6, #0x10]
	movs r4, #0x80
	lsls r4, r4, #9
	str r1, [sp]
	movs r0, #0x1e
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r0, #0x1f
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	ldr r1, _0817C3A0
	mov sb, r1
	lsls r2, r5, #4
	adds r2, r2, r5
	lsls r2, r2, #2
	mov r3, sb
	adds r3, #0x1c
	adds r0, r2, r3
	ldr r1, _0817C3A4
	str r1, [r0]
	add r2, sb
	ldrb r1, [r2, #1]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r1, [r2, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x3c
	orrs r0, r1
	strb r0, [r2, #3]
	movs r0, #0x3e
	adds r0, r0, r2
	mov sl, r0
	ldrb r1, [r0]
	movs r5, #5
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	mov r1, sl
	strb r0, [r1]
	ldrb r1, [r2, #5]
	lsrs r1, r1, #4
	lsls r1, r1, #5
	ldr r0, _0817C3A8
	mov sl, r0
	add r1, sl
	add r0, sp, #4
	movs r2, #0x10
	str r3, [sp, #0x24]
	bl CpuSet
	lsls r1, r7, #4
	adds r1, r1, r7
	lsls r1, r1, #2
	ldr r3, [sp, #0x24]
	adds r3, r1, r3
	ldr r0, _0817C3A4
	str r0, [r3]
	add r1, sb
	ldrb r0, [r1, #1]
	ands r4, r0
	movs r0, #1
	orrs r4, r0
	strb r4, [r1, #1]
	ldrb r0, [r1, #3]
	movs r2, #0x3e
	orrs r0, r2
	strb r0, [r1, #3]
	adds r2, r1, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	ands r5, r0
	strb r5, [r2]
	ldrb r1, [r1, #5]
	lsrs r1, r1, #4
	lsls r1, r1, #5
	add r1, sl
	add r0, sp, #4
	movs r2, #0x10
	bl CpuSet
	movs r1, #0
	strh r1, [r6, #0x18]
	mov r0, r8
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0817C394: .4byte 0x0817C3AD
_0817C398: .4byte 0x00007FFF
_0817C39C: .4byte 0x03005B60
_0817C3A0: .4byte 0x020205AC
_0817C3A4: .4byte 0x0817C25D
_0817C3A8: .4byte 0x020379B4
	thumb_func_end sub_0817C260

	thumb_func_start sub_0817C3AC
sub_0817C3AC: @ 0x0817C3AC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0817C3C8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1, #0x12]
	movs r0, #8
	strh r0, [r1, #0x14]
	ldr r0, _0817C3CC
	str r0, [r1]
	bx lr
	.align 2, 0
_0817C3C8: .4byte 0x03005B60
_0817C3CC: .4byte 0x0817C3D1
	thumb_func_end sub_0817C3AC

	thumb_func_start sub_0817C3D0
sub_0817C3D0: @ 0x0817C3D0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _0817C3F0
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r1, #0x18
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0817C3F4
	adds r0, r3, #0
	bl PreEvoVisible_PostEvoInvisible_KillTask
	b _0817C416
	.align 2, 0
_0817C3F0: .4byte 0x03005B60
_0817C3F4:
	ldrh r1, [r2, #0x14]
	movs r4, #0x14
	ldrsh r0, [r2, r4]
	cmp r0, #0x80
	bne _0817C406
	adds r0, r3, #0
	bl PreEvoInvisible_PostEvoVisible_KillTask
	b _0817C416
_0817C406:
	adds r0, r1, #2
	strh r0, [r2, #0x14]
	ldrh r0, [r2, #0x12]
	movs r1, #1
	eors r0, r1
	strh r0, [r2, #0x12]
	ldr r0, _0817C41C
	str r0, [r2]
_0817C416:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817C41C: .4byte 0x0817C421
	thumb_func_end sub_0817C3D0

	thumb_func_start sub_0817C420
sub_0817C420: @ 0x0817C420
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0817C444
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r5, r1, #0
	cmp r0, #0
	beq _0817C44C
	ldr r0, _0817C448
	str r0, [r2]
	b _0817C530
	.align 2, 0
_0817C444: .4byte 0x03005B60
_0817C448: .4byte 0x0817C5ED
_0817C44C:
	movs r6, #0
	movs r7, #0x12
	ldrsh r0, [r2, r7]
	cmp r0, #0
	bne _0817C49C
	movs r0, #0xe
	ldrsh r1, [r2, r0]
	movs r3, #0x14
	ldrsh r0, [r2, r3]
	movs r3, #0x80
	lsls r3, r3, #1
	subs r0, r3, r0
	cmp r1, r0
	bge _0817C472
	ldrh r0, [r2, #0x14]
	ldrh r7, [r2, #0xe]
	adds r0, r0, r7
	strh r0, [r2, #0xe]
	b _0817C476
_0817C472:
	strh r3, [r2, #0xe]
	movs r6, #1
_0817C476:
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r3, r0, r5
	movs r0, #0x10
	ldrsh r1, [r3, r0]
	movs r7, #0x14
	ldrsh r0, [r3, r7]
	adds r0, #0x10
	cmp r1, r0
	ble _0817C496
	ldrh r0, [r3, #0x10]
	ldrh r1, [r3, #0x14]
	subs r0, r0, r1
	strh r0, [r3, #0x10]
	b _0817C4E6
_0817C496:
	movs r0, #0x10
	strh r0, [r3, #0x10]
	b _0817C4E0
_0817C49C:
	movs r0, #0x10
	ldrsh r1, [r2, r0]
	movs r3, #0x14
	ldrsh r0, [r2, r3]
	movs r3, #0x80
	lsls r3, r3, #1
	subs r0, r3, r0
	cmp r1, r0
	bge _0817C4B8
	ldrh r0, [r2, #0x14]
	ldrh r7, [r2, #0x10]
	adds r0, r0, r7
	strh r0, [r2, #0x10]
	b _0817C4BC
_0817C4B8:
	strh r3, [r2, #0x10]
	movs r6, #1
_0817C4BC:
	lsls r2, r4, #2
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r3, r0, r5
	movs r0, #0xe
	ldrsh r1, [r3, r0]
	movs r7, #0x14
	ldrsh r0, [r3, r7]
	adds r0, #0x10
	cmp r1, r0
	ble _0817C4DC
	ldrh r0, [r3, #0xe]
	ldrh r1, [r3, #0x14]
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	b _0817C4E6
_0817C4DC:
	movs r0, #0x10
	strh r0, [r3, #0xe]
_0817C4E0:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0817C4E6:
	adds r0, r2, r4
	lsls r0, r0, #3
	adds r5, r0, r5
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r4, #0
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r0, #0x1e
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	adds r0, r4, #0
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r0, #0x1f
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	cmp r6, #2
	bne _0817C530
	ldr r0, _0817C538
	str r0, [r5]
_0817C530:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817C538: .4byte 0x0817C3D1
	thumb_func_end sub_0817C420

	thumb_func_start PreEvoInvisible_PostEvoVisible_KillTask
PreEvoInvisible_PostEvoVisible_KillTask: @ 0x0817C53C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0817C5E4
	mov r8, r1
	ldr r1, _0817C5E8
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	add r2, r8
	ldrb r3, [r2, #1]
	movs r6, #4
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r1, r3
	strb r1, [r2, #1]
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	add r2, r8
	ldrb r3, [r2, #3]
	movs r5, #0x3f
	rsbs r5, r5, #0
	adds r1, r5, #0
	ands r1, r3
	strb r1, [r2, #3]
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r3, #4
	orrs r2, r3
	strb r2, [r1]
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #1]
	ands r6, r2
	strb r6, [r1, #1]
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #3]
	ands r5, r2
	strb r5, [r1, #3]
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	ands r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817C5E4: .4byte 0x020205AC
_0817C5E8: .4byte 0x03005B60
	thumb_func_end PreEvoInvisible_PostEvoVisible_KillTask

	thumb_func_start PreEvoVisible_PostEvoInvisible_KillTask
PreEvoVisible_PostEvoInvisible_KillTask: @ 0x0817C5EC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0817C694
	mov r8, r1
	ldr r1, _0817C698
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	add r2, r8
	ldrb r3, [r2, #1]
	movs r6, #4
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r1, r3
	strb r1, [r2, #1]
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	add r2, r8
	ldrb r3, [r2, #3]
	movs r5, #0x3f
	rsbs r5, r5, #0
	adds r1, r5, #0
	ands r1, r3
	strb r1, [r2, #3]
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #5
	rsbs r2, r2, #0
	ands r2, r3
	strb r2, [r1]
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #1]
	ands r6, r2
	strb r6, [r1, #1]
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	ldrb r2, [r1, #3]
	ands r5, r2
	strb r5, [r1, #3]
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	adds r1, #0x3e
	ldrb r2, [r1]
	movs r3, #4
	orrs r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817C694: .4byte 0x020205AC
_0817C698: .4byte 0x03005B60
	thumb_func_end PreEvoVisible_PostEvoInvisible_KillTask

