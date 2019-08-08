.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start AnimConfusionDuck
AnimConfusionDuck: @ 0x08115F7C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08115FB4
	ldrh r0, [r5]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x2e]
	ldr r0, _08115FB8
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08115FBC
	ldrh r0, [r5, #6]
	rsbs r0, r0, #0
	strh r0, [r4, #0x30]
	movs r0, #1
	strh r0, [r4, #0x36]
	b _08115FCA
	.align 2, 0
_08115FB4: .4byte 0x020380BE
_08115FB8: .4byte 0x020380D6
_08115FBC:
	ldrh r0, [r5, #6]
	strh r0, [r4, #0x30]
	strh r1, [r4, #0x36]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
_08115FCA:
	ldr r0, _08115FE0
	ldrh r0, [r0, #8]
	strh r0, [r4, #0x34]
	ldr r1, _08115FE4
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08115FE0: .4byte 0x020380BE
_08115FE4: .4byte 0x08115FE9
	thumb_func_end AnimConfusionDuck

	thumb_func_start AnimConfusionDuckStep
AnimConfusionDuckStep: @ 0x08115FE8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r1, #0x1e
	bl Cos
	strh r0, [r4, #0x24]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl Sin
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x2e]
	cmp r0, #0x7f
	bhi _0811601A
	ldrb r0, [r4, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r4, #5]
	b _08116022
_0811601A:
	ldrb r0, [r4, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #5]
_08116022:
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x2e]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08116046
	adds r0, r4, #0
	bl DestroyAnimSprite
_08116046:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AnimConfusionDuckStep

	thumb_func_start AnimSimplePaletteBlend
AnimSimplePaletteBlend: @ 0x0811604C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08116084
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl UnpackSelectedBattleAnimPalettes
	movs r1, #2
	ldrsb r1, [r4, r1]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #6]
	ldrh r4, [r4, #8]
	str r4, [sp]
	bl BeginNormalPaletteFade
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08116088
	str r0, [r5, #0x1c]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116084: .4byte 0x020380BE
_08116088: .4byte 0x081160D5
	thumb_func_end AnimSimplePaletteBlend

	thumb_func_start UnpackSelectedBattleAnimPalettes
UnpackSelectedBattleAnimPalettes: @ 0x0811608C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #1
	mov r8, r0
	mov r1, r8
	ands r1, r4
	mov r8, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x11
	ands r1, r4
	asrs r2, r0, #0x12
	ands r2, r4
	asrs r3, r0, #0x13
	ands r3, r4
	asrs r6, r0, #0x14
	ands r6, r4
	asrs r5, r0, #0x15
	ands r5, r4
	asrs r0, r0, #0x16
	ands r0, r4
	str r6, [sp]
	str r5, [sp, #4]
	str r0, [sp, #8]
	mov r0, r8
	bl sub_080A6E74
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end UnpackSelectedBattleAnimPalettes

	thumb_func_start AnimSimplePaletteBlendStep
AnimSimplePaletteBlendStep: @ 0x081160D4
	push {lr}
	adds r2, r0, #0
	ldr r0, _081160F0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081160EA
	adds r0, r2, #0
	bl DestroyAnimSprite
_081160EA:
	pop {r0}
	bx r0
	.align 2, 0
_081160F0: .4byte 0x02037C74
	thumb_func_end AnimSimplePaletteBlendStep

	thumb_func_start sub_081160F4
sub_081160F4: @ 0x081160F4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08116140
	ldrh r0, [r4, #2]
	strh r0, [r5, #0x2e]
	strh r0, [r5, #0x30]
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x32]
	ldrh r0, [r4, #6]
	strh r0, [r5, #0x34]
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x36]
	ldrh r0, [r4, #0xa]
	strh r0, [r5, #0x38]
	ldrh r0, [r4, #0xc]
	strh r0, [r5, #0x3a]
	ldrh r0, [r4]
	strh r0, [r5, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	bl UnpackSelectedBattleAnimPalettes
	ldrb r1, [r4, #8]
	ldrh r2, [r4, #6]
	bl BlendPalettes
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08116144
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116140: .4byte 0x020380BE
_08116144: .4byte 0x08116149
	thumb_func_end sub_081160F4

	thumb_func_start sub_08116148
sub_08116148: @ 0x08116148
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _0811615C
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
	b _081161CC
_0811615C:
	ldr r0, _08116178
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081161CC
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08116180
	ldr r0, _0811617C
	str r0, [r4, #0x1c]
	b _081161CC
	.align 2, 0
_08116178: .4byte 0x02037C74
_0811617C: .4byte 0x081161D5
_08116180:
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	bl UnpackSelectedBattleAnimPalettes
	adds r3, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081161A6
	ldrh r1, [r4, #0x36]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x34]
	adds r0, r3, #0
	bl BlendPalettes
	b _081161B4
_081161A6:
	ldrh r1, [r4, #0x3a]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r2, [r4, #0x38]
	adds r0, r3, #0
	bl BlendPalettes
_081161B4:
	ldrh r0, [r4, #0x30]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
_081161CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08116148

	thumb_func_start sub_081161D4
sub_081161D4: @ 0x081161D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08116200
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081161FA
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	bl UnpackSelectedBattleAnimPalettes
	movs r1, #0
	movs r2, #0
	bl BlendPalettes
	adds r0, r4, #0
	bl DestroyAnimSprite
_081161FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116200: .4byte 0x02037C74
	thumb_func_end sub_081161D4

	thumb_func_start sub_08116204
sub_08116204: @ 0x08116204
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08116248
	ldrh r0, [r1]
	ldrh r2, [r4, #0x20]
	adds r0, r0, r2
	movs r2, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #2]
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	strh r2, [r4, #0x2e]
	movs r0, #0xa
	strh r0, [r4, #0x30]
	movs r0, #8
	strh r0, [r4, #0x32]
	movs r0, #0x28
	strh r0, [r4, #0x34]
	movs r0, #0x70
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	ldr r1, _0811624C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r1, _08116250
	str r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116248: .4byte 0x020380BE
_0811624C: .4byte 0x080A6015
_08116250: .4byte 0x080A5C15
	thumb_func_end sub_08116204

	thumb_func_start sub_08116254
sub_08116254: @ 0x08116254
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08116298
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldr r3, _0811629C
	ldrh r1, [r3]
	movs r5, #0
	strh r1, [r4, #8]
	ldrh r1, [r3, #2]
	strh r1, [r4, #0xa]
	ldrh r1, [r3, #4]
	strh r1, [r4, #0xc]
	ldrh r1, [r3, #6]
	strh r1, [r4, #0xe]
	ldrh r2, [r3, #8]
	strh r2, [r4, #0x10]
	ldrh r1, [r3, #0xa]
	strh r1, [r4, #0x12]
	strh r5, [r4, #0x18]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0
	bl sub_081162A4
	ldr r0, _081162A0
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116298: .4byte 0x03005B60
_0811629C: .4byte 0x020380BE
_081162A0: .4byte 0x081162F5
	thumb_func_end sub_08116254

	thumb_func_start sub_081162A4
sub_081162A4: @ 0x081162A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r1, _081162F0
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	bl UnpackSelectedBattleAnimPalettes
	movs r1, #0xa
	ldrsb r1, [r4, r1]
	ldrh r2, [r4, #0x12]
	str r2, [sp]
	adds r2, r5, #0
	adds r3, r6, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x18]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081162F0: .4byte 0x03005B60
	thumb_func_end sub_081162A4

	thumb_func_start sub_081162F4
sub_081162F4: @ 0x081162F4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, r3, #0
	ldr r0, _0811632C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08116356
	ldr r1, _08116330
	lsls r2, r3, #2
	adds r0, r2, r3
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r5, #0xc
	ldrsh r0, [r3, r5]
	adds r6, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	ble _08116350
	movs r1, #0x18
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _08116334
	ldrb r1, [r3, #0xe]
	ldrb r2, [r3, #0x10]
	b _08116338
	.align 2, 0
_0811632C: .4byte 0x02037C74
_08116330: .4byte 0x03005B60
_08116334:
	ldrb r1, [r3, #0x10]
	ldrb r2, [r3, #0xe]
_08116338:
	adds r0, r5, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r3, #0xc
	ldrsh r0, [r0, r3]
	cmp r0, #1
	bne _08116348
	movs r2, #0
_08116348:
	adds r0, r4, #0
	bl sub_081162A4
	b _08116356
_08116350:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_08116356:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081162F4

	thumb_func_start sub_0811635C
sub_0811635C: @ 0x0811635C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	ldr r3, _08116400
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r2, _08116404
	ldrh r1, [r2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r2, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r2, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r2, #0xa]
	strh r1, [r0, #0x12]
	strh r5, [r0, #0x18]
	movs r4, #0
	ldr r0, _08116408
	ldrb r1, [r0]
	mov sb, r3
	mov r8, r2
	cmp r5, r1
	bge _081163C4
	ldr r0, _0811640C
	ldrb r3, [r0]
	ldr r7, _08116410
	movs r0, #1
	mov ip, r0
	adds r2, r1, #0
_081163AA:
	cmp r4, r3
	beq _081163BE
	ldrb r1, [r7]
	cmp r4, r1
	beq _081163BE
	adds r1, r4, #0
	adds r1, #0x10
	mov r0, ip
	lsls r0, r1
	orrs r5, r0
_081163BE:
	adds r4, #1
	cmp r4, r2
	blt _081163AA
_081163C4:
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #1
	bne _081163D2
	movs r0, #0xe
	orrs r5, r0
_081163D2:
	lsls r4, r6, #2
	adds r4, r4, r6
	lsls r4, r4, #3
	add r4, sb
	lsrs r0, r5, #0x10
	strh r0, [r4, #0x1a]
	movs r0, #0xff
	ands r5, r0
	strh r5, [r4, #0x1c]
	ldrb r2, [r4, #0x10]
	adds r0, r6, #0
	movs r1, #0
	bl sub_08116418
	ldr r0, _08116414
	str r0, [r4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116400: .4byte 0x03005B60
_08116404: .4byte 0x020380BE
_08116408: .4byte 0x02023D10
_0811640C: .4byte 0x020380D6
_08116410: .4byte 0x020380D7
_08116414: .4byte 0x08116469
	thumb_func_end sub_0811635C

	thumb_func_start sub_08116418
sub_08116418: @ 0x08116418
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r3, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r1, _08116464
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0x1c]
	orrs r0, r1
	movs r1, #0xa
	ldrsb r1, [r4, r1]
	ldrh r2, [r4, #0x12]
	str r2, [sp]
	adds r2, r5, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x18]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116464: .4byte 0x03005B60
	thumb_func_end sub_08116418

	thumb_func_start sub_08116468
sub_08116468: @ 0x08116468
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, r3, #0
	ldr r0, _081164A0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081164CA
	ldr r1, _081164A4
	lsls r2, r3, #2
	adds r0, r2, r3
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r5, #0xc
	ldrsh r0, [r3, r5]
	adds r6, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	ble _081164C4
	movs r1, #0x18
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _081164A8
	ldrb r1, [r3, #0xe]
	ldrb r2, [r3, #0x10]
	b _081164AC
	.align 2, 0
_081164A0: .4byte 0x02037C74
_081164A4: .4byte 0x03005B60
_081164A8:
	ldrb r1, [r3, #0x10]
	ldrb r2, [r3, #0xe]
_081164AC:
	adds r0, r5, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r3, #0xc
	ldrsh r0, [r0, r3]
	cmp r0, #1
	bne _081164BC
	movs r2, #0
_081164BC:
	adds r0, r4, #0
	bl sub_08116418
	b _081164CA
_081164C4:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_081164CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08116468

	thumb_func_start sub_081164D0
sub_081164D0: @ 0x081164D0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08116514
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldr r3, _08116518
	ldrh r1, [r3]
	movs r5, #0
	strh r1, [r4, #8]
	ldrh r1, [r3, #2]
	strh r1, [r4, #0xa]
	ldrh r1, [r3, #4]
	strh r1, [r4, #0xc]
	ldrh r1, [r3, #6]
	strh r1, [r4, #0xe]
	ldrh r2, [r3, #8]
	strh r2, [r4, #0x10]
	ldrh r1, [r3, #0xa]
	strh r1, [r4, #0x12]
	strh r5, [r4, #0x18]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0
	bl sub_08116520
	ldr r0, _0811651C
	str r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116514: .4byte 0x03005B60
_08116518: .4byte 0x020380BE
_0811651C: .4byte 0x0811657D
	thumb_func_end sub_081164D0

	thumb_func_start sub_08116520
sub_08116520: @ 0x08116520
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r1, _08116578
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrh r0, [r4, #8]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	movs r2, #1
	lsls r2, r0
	movs r1, #0xa
	ldrsb r1, [r4, r1]
	ldrh r0, [r4, #0x12]
	str r0, [sp]
	adds r0, r2, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	movs r1, #1
	eors r0, r1
	strh r0, [r4, #0x18]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116578: .4byte 0x03005B60
	thumb_func_end sub_08116520

	thumb_func_start sub_0811657C
sub_0811657C: @ 0x0811657C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, r3, #0
	ldr r0, _081165B4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081165DE
	ldr r1, _081165B8
	lsls r2, r3, #2
	adds r0, r2, r3
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r5, #0xc
	ldrsh r0, [r3, r5]
	adds r6, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	ble _081165D8
	movs r1, #0x18
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _081165BC
	ldrb r1, [r3, #0xe]
	ldrb r2, [r3, #0x10]
	b _081165C0
	.align 2, 0
_081165B4: .4byte 0x02037C74
_081165B8: .4byte 0x03005B60
_081165BC:
	ldrb r1, [r3, #0x10]
	ldrb r2, [r3, #0xe]
_081165C0:
	adds r0, r5, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r3, #0xc
	ldrsh r0, [r0, r3]
	cmp r0, #1
	bne _081165D0
	movs r2, #0
_081165D0:
	adds r0, r4, #0
	bl sub_08116520
	b _081165DE
_081165D8:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_081165DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0811657C

	thumb_func_start sub_081165E4
sub_081165E4: @ 0x081165E4
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08116644
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r1
	ldr r5, _08116648
	ldrh r0, [r5, #2]
	strh r0, [r4, #8]
	ldrh r0, [r5, #2]
	strh r0, [r4, #0xa]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0xc]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0xe]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x10]
	ldrh r0, [r5, #0xa]
	strh r0, [r4, #0x12]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #0x14]
	ldrh r0, [r5]
	strh r0, [r4, #0x16]
	ldrh r0, [r5]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	movs r1, #1
	lsls r1, r0
	ldrb r3, [r5, #8]
	ldrh r0, [r5, #6]
	str r0, [sp]
	adds r0, r1, #0
	movs r1, #0
	adds r2, r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0811664C
	str r0, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116644: .4byte 0x03005B60
_08116648: .4byte 0x020380BE
_0811664C: .4byte 0x08116651
	thumb_func_end sub_081165E4

	thumb_func_start sub_08116650
sub_08116650: @ 0x08116650
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08116674
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4, #8]
	movs r2, #8
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08116678
	subs r0, r1, #1
	strh r0, [r4, #8]
	b _081166FC
	.align 2, 0
_08116674: .4byte 0x03005B60
_08116678:
	ldr r0, _08116694
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081166FC
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0811669C
	ldr r0, _08116698
	str r0, [r4]
	b _081166FC
	.align 2, 0
_08116694: .4byte 0x02037C74
_08116698: .4byte 0x08116709
_0811669C:
	ldrh r0, [r4, #0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	movs r2, #1
	lsls r2, r0
	ldrh r1, [r4, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081166CA
	ldrb r3, [r4, #0x10]
	ldrh r0, [r4, #0xe]
	str r0, [sp]
	adds r0, r2, #0
	movs r1, #0
	adds r2, r3, #0
	bl BeginNormalPaletteFade
	b _081166DA
_081166CA:
	ldrb r3, [r4, #0x14]
	ldrh r0, [r4, #0x12]
	str r0, [sp]
	adds r0, r2, #0
	movs r1, #0
	adds r2, r3, #0
	bl BeginNormalPaletteFade
_081166DA:
	ldr r0, _08116704
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0xa]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	eors r0, r2
	strh r0, [r1, #0xa]
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1, #8]
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
_081166FC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116704: .4byte 0x03005B60
	thumb_func_end sub_08116650

	thumb_func_start sub_08116708
sub_08116708: @ 0x08116708
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08116758
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0811674E
	ldr r1, _0811675C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	movs r1, #1
	lsls r1, r0
	str r5, [sp]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl BeginNormalPaletteFade
	adds r0, r4, #0
	bl DestroyAnimVisualTask
_0811674E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116758: .4byte 0x02037C74
_0811675C: .4byte 0x03005B60
	thumb_func_end sub_08116708

	thumb_func_start sub_08116760
sub_08116760: @ 0x08116760
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r2, #0
	ldr r0, _081167D8
	ldrb r6, [r0]
	ldr r0, _081167DC
	ldrb r7, [r0]
	ldr r4, _081167E0
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0811679A
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r3, #0
	bl sub_080A6E74
	adds r2, r0, #0
_0811679A:
	ldrh r1, [r4, #2]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _081167AC
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r0, r6
	orrs r2, r0
_081167AC:
	ldrh r1, [r4, #4]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _081167BE
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r0, r7
	orrs r2, r0
_081167BE:
	adds r0, r2, #0
	bl InvertPlttBuffer
	mov r0, r8
	bl DestroyAnimVisualTask
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081167D8: .4byte 0x020380D6
_081167DC: .4byte 0x020380D7
_081167E0: .4byte 0x020380BE
	thumb_func_end sub_08116760

	thumb_func_start sub_081167E4
sub_081167E4: @ 0x081167E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	ldr r1, _081168D8
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08116826
	ldr r1, _081168DC
	ldrh r0, [r1]
	strh r0, [r4, #0xc]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0xe]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x10]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0xa]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x12]
	ldrh r0, [r1, #0xa]
	strh r0, [r4, #0x14]
	ldrh r0, [r1, #0xc]
	strh r0, [r4, #0x16]
_08116826:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	ldr r0, _081168E0
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, _081168E4
	ldrb r0, [r0]
	mov sl, r0
	ldrh r1, [r4, #0xc]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08116848
	ldr r5, _081168E8
_08116848:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08116878
	ldr r2, _081168EC
	ldr r0, _081168F0
	add r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	lsls r1, r0
	lsls r1, r1, #0x10
	orrs r5, r1
_08116878:
	ldrh r1, [r4, #0xe]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0811688C
	adds r0, r6, #0
	mov r2, sb
	lsls r0, r2
	lsls r0, r0, #0x10
	orrs r5, r0
_0811688C:
	ldrh r1, [r4, #0x10]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _081168A0
	adds r0, r6, #0
	mov r1, sl
	lsls r0, r1
	lsls r0, r0, #0x10
	orrs r5, r0
_081168A0:
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	movs r2, #0x14
	ldrsb r2, [r4, r2]
	movs r3, #0x16
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	bl TintPlttBuffer
	movs r2, #8
	ldrsh r1, [r4, r2]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _081168CA
	adds r0, r5, #0
	bl UnfadePlttBuffer
	mov r0, r8
	bl DestroyAnimVisualTask
_081168CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081168D8: .4byte 0x03005B60
_081168DC: .4byte 0x020380BE
_081168E0: .4byte 0x020380D6
_081168E4: .4byte 0x020380D7
_081168E8: .4byte 0x0000FFFF
_081168EC: .4byte 0x020205AC
_081168F0: .4byte 0x03005AD0
	thumb_func_end sub_081167E4

	thumb_func_start sub_081168F4
sub_081168F4: @ 0x081168F4
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08116928
	ldrh r0, [r1]
	rsbs r0, r0, #0
	strh r0, [r4, #0x2e]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x30]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x34]
	movs r2, #6
	ldrsh r0, [r1, r2]
	cmp r0, #1
	beq _0811693C
	cmp r0, #1
	bgt _0811692C
	cmp r0, #0
	beq _08116932
	b _08116954
	.align 2, 0
_08116928: .4byte 0x020380BE
_0811692C:
	cmp r0, #2
	beq _08116944
	b _08116954
_08116932:
	ldr r1, _08116938
	b _08116946
	.align 2, 0
_08116938: .4byte 0x02022AD4
_0811693C:
	ldr r1, _08116940
	b _08116946
	.align 2, 0
_08116940: .4byte 0x02022AD6
_08116944:
	ldr r1, _08116950
_08116946:
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	b _0811695C
	.align 2, 0
_08116950: .4byte 0x02021B38
_08116954:
	ldr r1, _0811698C
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
_0811695C:
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrh r0, [r1]
	strh r0, [r4, #0x36]
	ldr r0, _08116990
	ldrh r0, [r0, #6]
	strh r0, [r4, #0x38]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08116980
	bl sub_08116A44
_08116980:
	ldr r0, _08116994
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811698C: .4byte 0x02021B3A
_08116990: .4byte 0x020380BE
_08116994: .4byte 0x08116999
	thumb_func_end sub_081168F4

	thumb_func_start sub_08116998
sub_08116998: @ 0x08116998
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x34]
	movs r2, #0x34
	ldrsh r0, [r3, r2]
	cmp r0, #0
	ble _081169DA
	subs r0, r1, #1
	strh r0, [r3, #0x34]
	ldrh r1, [r3, #0x30]
	movs r2, #0x30
	ldrsh r0, [r3, r2]
	cmp r0, #0
	ble _081169BA
	subs r0, r1, #1
	strh r0, [r3, #0x30]
	b _08116A32
_081169BA:
	ldrh r0, [r3, #0x32]
	strh r0, [r3, #0x30]
	movs r0, #0x3a
	ldrsh r1, [r3, r0]
	movs r2, #0x3c
	ldrsh r0, [r3, r2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrh r0, [r3, #0x2e]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	ldrh r0, [r3, #0x2e]
	rsbs r0, r0, #0
	strh r0, [r3, #0x2e]
	b _08116A32
_081169DA:
	movs r0, #0x3a
	ldrsh r1, [r3, r0]
	movs r2, #0x3c
	ldrsh r0, [r3, r2]
	lsls r0, r0, #0x10
	orrs r1, r0
	ldrh r0, [r3, #0x36]
	strh r0, [r1]
	ldrh r0, [r3, #0x38]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08116A2C
	movs r4, #0
	ldr r5, _08116A38
	ldrb r0, [r5]
	cmp r4, r0
	bhs _08116A2C
	ldr r2, _08116A3C
	mov ip, r2
	ldr r6, _08116A40
	movs r7, #3
	rsbs r7, r7, #0
_08116A0A:
	adds r0, r4, r6
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	adds r1, #0x3e
	ldrb r2, [r1]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	cmp r4, r0
	blo _08116A0A
_08116A2C:
	adds r0, r3, #0
	bl DestroyAnimSprite
_08116A32:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116A38: .4byte 0x02023D10
_08116A3C: .4byte 0x020205AC
_08116A40: .4byte 0x02023E88
	thumb_func_end sub_08116998

	thumb_func_start sub_08116A44
sub_08116A44: @ 0x08116A44
	push {r4, r5, r6, lr}
	ldr r6, _08116AB8
	ldr r4, _08116ABC
	ldr r5, _08116AC0
	ldrb r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r1, #0x3e
	ldrb r3, [r1]
	movs r2, #3
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	strb r0, [r1]
	ldr r3, _08116AC4
	ldrb r0, [r3]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r0, _08116AC8
	movs r1, #8
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08116ACC
	ldrb r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r3]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	b _08116AE8
	.align 2, 0
_08116AB8: .4byte 0x020205AC
_08116ABC: .4byte 0x02023E88
_08116AC0: .4byte 0x020380D6
_08116AC4: .4byte 0x020380D7
_08116AC8: .4byte 0x020380BE
_08116ACC:
	cmp r0, #0
	bne _08116AD4
	ldrb r0, [r5]
	b _08116AD6
_08116AD4:
	ldrb r0, [r3]
_08116AD6:
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #2
_08116AE8:
	orrs r1, r2
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08116A44

	thumb_func_start sub_08116AF4
sub_08116AF4: @ 0x08116AF4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08116B34
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r1
	ldr r3, _08116B38
	ldrh r1, [r3]
	strh r1, [r2, #8]
	ldrh r1, [r3, #2]
	strh r1, [r2, #0xa]
	ldrh r1, [r3, #4]
	strh r1, [r2, #0xc]
	ldrh r1, [r3, #6]
	strh r1, [r2, #0xe]
	ldrh r1, [r3, #6]
	strh r1, [r2, #0x18]
	ldr r4, _08116B3C
	ldrh r1, [r3]
	strh r1, [r4]
	ldr r4, _08116B40
	ldrh r1, [r3, #2]
	strh r1, [r4]
	ldr r1, _08116B44
	str r1, [r2]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116B34: .4byte 0x03005B60
_08116B38: .4byte 0x020380BE
_08116B3C: .4byte 0x02022AD4
_08116B40: .4byte 0x02022AD6
_08116B44: .4byte 0x08116B49
	thumb_func_end sub_08116AF4

	thumb_func_start sub_08116B48
sub_08116B48: @ 0x08116B48
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08116B78
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r2, [r3, #0xe]
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	mov ip, r1
	cmp r0, #0
	bne _08116BCE
	ldr r0, _08116B7C
	ldrh r2, [r0]
	movs r7, #8
	ldrsh r1, [r3, r7]
	adds r6, r0, #0
	cmp r2, r1
	bne _08116B80
	ldrh r0, [r3, #8]
	rsbs r0, r0, #0
	b _08116B82
	.align 2, 0
_08116B78: .4byte 0x03005B60
_08116B7C: .4byte 0x02022AD4
_08116B80:
	ldrh r0, [r3, #8]
_08116B82:
	strh r0, [r6]
	ldr r2, _08116BA0
	ldrh r3, [r2]
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r0, r0, #3
	mov r7, ip
	adds r4, r0, r7
	movs r7, #0xa
	ldrsh r0, [r4, r7]
	cmn r3, r0
	bne _08116BA4
	movs r0, #0
	b _08116BA8
	.align 2, 0
_08116BA0: .4byte 0x02022AD6
_08116BA4:
	ldrh r0, [r4, #0xa]
	rsbs r0, r0, #0
_08116BA8:
	strh r0, [r2]
	adds r0, r1, r5
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0, #0x18]
	strh r1, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	subs r1, #1
	strh r1, [r0, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	bne _08116BD2
	strh r1, [r6]
	strh r1, [r2]
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	b _08116BD2
_08116BCE:
	subs r0, r2, #1
	strh r0, [r3, #0xe]
_08116BD2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08116B48

	thumb_func_start sub_08116BD8
sub_08116BD8: @ 0x08116BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08116BF8
	ldrb r1, [r4, #6]
	bl StartSpriteAffineAnim
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08116BFC
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	b _08116C04
	.align 2, 0
_08116BF8: .4byte 0x020380BE
_08116BFC:
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
_08116C04:
	ldr r0, _08116C18
	str r0, [r5, #0x1c]
	ldr r1, _08116C1C
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116C18: .4byte 0x080A6085
_08116C1C: .4byte 0x080A34C5
	thumb_func_end sub_08116BD8

	thumb_func_start sub_08116C20
sub_08116C20: @ 0x08116C20
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08116C40
	ldrb r1, [r4, #6]
	bl StartSpriteAffineAnim
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08116C44
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	b _08116C4C
	.align 2, 0
_08116C40: .4byte 0x020380BE
_08116C44:
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
_08116C4C:
	ldr r0, _08116C64
	ldrh r0, [r0, #8]
	strh r0, [r5, #0x2e]
	ldr r0, _08116C68
	str r0, [r5, #0x1c]
	ldr r1, _08116C6C
	adds r0, r5, #0
	bl StoreSpriteCallbackInData6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116C64: .4byte 0x020380BE
_08116C68: .4byte 0x080A6085
_08116C6C: .4byte 0x0810EB19
	thumb_func_end sub_08116C20

	thumb_func_start sub_08116C70
sub_08116C70: @ 0x08116C70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08116CA0
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08116C94
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08116C94
	ldr r1, _08116CA4
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_08116C94:
	adds r0, r4, #0
	bl sub_08116BD8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116CA0: .4byte 0x020380D6
_08116CA4: .4byte 0x020380BE
	thumb_func_end sub_08116C70

	thumb_func_start sub_08116CA8
sub_08116CA8: @ 0x08116CA8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08116CE0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08116CC4
	bl Random2
	movs r1, #3
	ands r1, r0
	strh r1, [r5, #2]
_08116CC4:
	ldrb r1, [r5, #2]
	adds r0, r4, #0
	bl StartSpriteAffineAnim
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08116CE4
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	b _08116CEC
	.align 2, 0
_08116CE0: .4byte 0x020380BE
_08116CE4:
	adds r0, r4, #0
	movs r1, #0
	bl InitSpritePosToAnimTarget
_08116CEC:
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x30
	bl __umodsi3
	ldr r1, _08116D30
	adds r0, r0, r1
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	bl Random2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x18
	bl __umodsi3
	ldr r1, _08116D34
	adds r0, r0, r1
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	ldr r1, _08116D38
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08116D3C
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116D30: .4byte 0x0000FFE8
_08116D34: .4byte 0x0000FFF4
_08116D38: .4byte 0x080A6015
_08116D3C: .4byte 0x080A6085
	thumb_func_end sub_08116CA8

	thumb_func_start sub_08116D40
sub_08116D40: @ 0x08116D40
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08116DA0
	ldrb r0, [r5]
	bl GetAnimBattlerSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x2e]
	ldr r2, _08116DA4
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x24]
	ldrh r0, [r0, #0x20]
	adds r1, r1, r0
	strh r1, [r4, #0x20]
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x26]
	ldrh r0, [r0, #0x22]
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	ldrh r0, [r5, #2]
	strh r0, [r4, #0x24]
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x26]
	ldrb r1, [r5, #6]
	adds r0, r4, #0
	bl StartSpriteAffineAnim
	ldr r1, _08116DA8
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08116DAC
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116DA0: .4byte 0x020380BE
_08116DA4: .4byte 0x020205AC
_08116DA8: .4byte 0x080A6015
_08116DAC: .4byte 0x080A6085
	thumb_func_end sub_08116D40

	thumb_func_start sub_08116DB0
sub_08116DB0: @ 0x08116DB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08116DC8
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08116DCC
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	b _08116DD4
	.align 2, 0
_08116DC8: .4byte 0x020380BE
_08116DCC:
	adds r0, r4, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
_08116DD4:
	ldr r0, _08116DEC
	ldrh r0, [r0, #6]
	strh r0, [r4, #0x2e]
	ldr r1, _08116DF0
	adds r0, r4, #0
	bl StoreSpriteCallbackInData6
	ldr r0, _08116DF4
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116DEC: .4byte 0x020380BE
_08116DF0: .4byte 0x080A34C5
_08116DF4: .4byte 0x080A5D79
	thumb_func_end sub_08116DB0

	thumb_func_start sub_08116DF8
sub_08116DF8: @ 0x08116DF8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08116E18
	ldrb r1, [r4, #6]
	bl StartSpriteAffineAnim
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08116E1C
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimAttacker
	b _08116E24
	.align 2, 0
_08116E18: .4byte 0x020380BE
_08116E1C:
	adds r0, r5, #0
	movs r1, #1
	bl InitSpritePosToAnimTarget
_08116E24:
	ldr r0, _08116E30
	str r0, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116E30: .4byte 0x08116E35
	thumb_func_end sub_08116DF8

	thumb_func_start sub_08116E34
sub_08116E34: @ 0x08116E34
	push {lr}
	adds r3, r0, #0
	movs r0, #0x3e
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1f
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #0x2e]
	adds r1, r0, #1
	strh r1, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _08116E6A
	adds r0, r3, #0
	bl DestroyAnimSprite
_08116E6A:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08116E34

