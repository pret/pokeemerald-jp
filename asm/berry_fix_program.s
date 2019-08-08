.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start berry_fix_text_update
berry_fix_text_update: @ 0x081BEEE4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _081BEEFC
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	cmp r0, #0xff
	bls _081BEF04
	ldr r0, _081BEF00
	str r0, [r5, #0x1c]
	b _081BEF4C
	.align 2, 0
_081BEEFC: .4byte 0x0203CBD8
_081BEF00: .4byte 0x08007141
_081BEF04:
	ldrh r1, [r5, #0x22]
	movs r2, #0x22
	ldrsh r0, [r5, r2]
	cmp r0, #0x5f
	ble _081BEF48
	movs r4, #0
_081BEF10:
	ldr r0, _081BEF44
	ldr r3, [r0]
	ldr r0, [r3]
	ldrh r1, [r3, #0x10]
	adds r2, r1, #1
	strh r2, [r3, #0x10]
	lsls r1, r1, #0x10
	ldr r2, [r3, #0xc]
	lsrs r1, r1, #0xf
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0
	str r2, [sp]
	movs r3, #0x10
	bl CB2_InitBerryFixProgram
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _081BEF10
	adds r0, r5, #0
	movs r1, #0
	bl StartSpriteAnim
	b _081BEF4C
	.align 2, 0
_081BEF44: .4byte 0x0203CBD8
_081BEF48:
	adds r0, r1, #1
	strh r0, [r5, #0x22]
_081BEF4C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end berry_fix_text_update

	thumb_func_start CB2_InitBerryFixProgram
CB2_InitBerryFixProgram: @ 0x081BEF54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sl, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x28]
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	mov r8, r0
	lsrs r7, r0, #0x18
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sl
	adds r1, r7, #0
	bl __divsi3
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r4, r5, #0x18
	ldr r3, _081BF01C
	strh r4, [r3]
	mov r0, sl
	adds r1, r7, #0
	str r3, [sp, #4]
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, [sp, #4]
	strh r2, [r3, #2]
	movs r1, #7
	ands r4, r1
	ands r2, r1
	strh r4, [r3, #4]
	strh r2, [r3, #6]
	lsrs r0, r0, #0x1b
	lsrs r5, r5, #0x1b
	strh r0, [r3, #8]
	strh r5, [r3, #0xa]
	mov r1, r8
	lsrs r1, r1, #0x1b
	lsls r1, r1, #6
	mov r8, r1
	mov r1, r8
	muls r1, r5, r1
	lsls r0, r0, #6
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r3, #0xc]
	lsls r4, r4, #3
	adds r4, r4, r2
	adds r1, r1, r4
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x11
	strh r1, [r3, #0xe]
	movs r1, #1
	mov r0, sl
	ands r1, r0
	movs r2, #1
	eors r1, r2
	lsls r0, r1, #2
	lsls r6, r0
	eors r1, r2
	lsls r1, r1, #2
	movs r0, #0xf
	lsls r0, r1
	orrs r6, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r1, sb
	lsls r1, r1, #5
	mov sb, r1
	add sb, r4
	ldr r1, [sp]
	add r1, sb
	ldrb r0, [r1]
	ands r6, r0
	strb r6, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081BF01C: .4byte 0x030012A0
	thumb_func_end CB2_InitBerryFixProgram

	thumb_func_start berry_fix_bg_hide
berry_fix_bg_hide: @ 0x081BF020
	push {r4, lr}
	sub sp, #4
	ldr r0, _081BF094
	bl DisableInterrupts
	movs r0, #1
	bl EnableInterrupts
	bl m4aSoundVSyncOff
	movs r0, #0
	bl SetVBlankCallback
	movs r4, #0
	str r4, [sp]
	ldr r0, _081BF098
	mov r1, sp
	str r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _081BF09C
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r4, [sp]
	mov r1, sp
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _081BF0A0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bl ResetSpriteData
	bl ResetTasks
	bl ScanlineEffect_Stop
	ldr r0, _081BF0A4
	movs r1, #0
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081BF0A8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r4, [r1, #8]
	ldr r0, _081BF0AC
	bl SetMainCallback2
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081BF094: .4byte 0x0000FFFF
_081BF098: .4byte 0x040000D4
_081BF09C: .4byte 0x85006000
_081BF0A0: .4byte 0x85000100
_081BF0A4: .4byte 0x081BF0BD
_081BF0A8: .4byte 0x03005B60
_081BF0AC: .4byte 0x081BF0B1
	thumb_func_end berry_fix_bg_hide

	thumb_func_start berry_fix_text_print
berry_fix_text_print: @ 0x081BF0B0
	push {lr}
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end berry_fix_text_print

	thumb_func_start berry_fix_main
berry_fix_main: @ 0x081BF0BC
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081BF0E4
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0xa
	bls _081BF0D8
	b _081BF272
_081BF0D8:
	lsls r0, r0, #2
	ldr r1, _081BF0E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081BF0E4: .4byte 0x03005B68
_081BF0E8: .4byte 0x081BF0EC
_081BF0EC: @ jump table
	.4byte _081BF118 @ case 0
	.4byte _081BF122 @ case 1
	.4byte _081BF140 @ case 2
	.4byte _081BF272 @ case 3
	.4byte _081BF15C @ case 4
	.4byte _081BF194 @ case 5
	.4byte _081BF200 @ case 6
	.4byte _081BF236 @ case 7
	.4byte _081BF23A @ case 8
	.4byte _081BF258 @ case 9
	.4byte _081BF262 @ case 10
_081BF118:
	movs r0, #5
	bl sub_081BAA20
	movs r0, #1
	b _081BF270
_081BF122:
	ldr r0, _081BF13C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081BF130
	b _081BF272
_081BF130:
	movs r0, #0
	bl sub_081BAA20
	movs r0, #2
	b _081BF270
	.align 2, 0
_081BF13C: .4byte 0x03002360
_081BF140:
	ldr r0, _081BF158
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081BF14E
	b _081BF272
_081BF14E:
	movs r0, #1
	bl sub_081BAA20
	movs r0, #4
	b _081BF270
	.align 2, 0
_081BF158: .4byte 0x03002360
_081BF15C:
	ldr r0, _081BF180
	ldr r1, _081BF184
	str r1, [r0]
	ldr r2, _081BF188
	ldr r0, _081BF18C
	subs r0, r0, r1
	str r0, [r2]
	ldr r0, _081BF190
	str r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x4b
	movs r4, #0
	strb r4, [r1]
	bl GetGlyphWidthFont6
	strh r4, [r5, #2]
	movs r0, #5
	b _081BF270
	.align 2, 0
_081BF180: .4byte 0x03006070
_081BF184: .4byte 0x08912454
_081BF188: .4byte 0x03006078
_081BF18C: .4byte 0x089158E0
_081BF190: .4byte 0x03006080
_081BF194:
	ldr r0, _081BF1DC
	ldrb r6, [r0, #0x18]
	adds r4, r0, #0
	cmp r6, #0
	bne _081BF1EC
	ldr r0, [r4, #0x1c]
	ldr r1, _081BF1E0
	ands r0, r1
	cmp r0, r1
	bne _081BF1EC
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb4
	ble _081BF1F0
	movs r0, #2
	bl sub_081BAA20
	ldr r0, _081BF1E4
	ldr r1, [r0]
	adds r1, #0xc0
	ldr r0, _081BF1E8
	ldr r2, [r0]
	subs r2, #0xc0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #4
	bl sub_081BA808
	strh r6, [r5, #2]
	movs r0, #6
	b _081BF270
	.align 2, 0
_081BF1DC: .4byte 0x03006080
_081BF1E0: .4byte 0x00020200
_081BF1E4: .4byte 0x03006070
_081BF1E8: .4byte 0x03006078
_081BF1EC:
	movs r0, #0
	strh r0, [r5, #2]
_081BF1F0:
	adds r0, r4, #0
	bl sub_081BA3A8
	ldr r1, _081BF1FC
	str r0, [r1]
	b _081BF272
	.align 2, 0
_081BF1FC: .4byte 0x03006074
_081BF200:
	ldr r4, _081BF220
	adds r0, r4, #0
	bl sub_081BA3A8
	ldr r1, _081BF224
	str r0, [r1]
	adds r0, r4, #0
	bl sub_081BA8CC
	cmp r0, #0
	beq _081BF228
	movs r0, #3
	bl sub_081BAA20
	movs r0, #7
	b _081BF270
	.align 2, 0
_081BF220: .4byte 0x03006080
_081BF224: .4byte 0x03006074
_081BF228:
	ldrb r1, [r4, #0x1e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081BF272
	movs r0, #9
	b _081BF270
_081BF236:
	movs r0, #8
	b _081BF270
_081BF23A:
	ldr r0, _081BF254
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081BF272
	adds r0, r2, #0
	bl DestroyTask
	bl DoSoftReset
	b _081BF272
	.align 2, 0
_081BF254: .4byte 0x03002360
_081BF258:
	movs r0, #4
	bl sub_081BAA20
	movs r0, #0xa
	b _081BF270
_081BF262:
	ldr r0, _081BF27C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _081BF272
	movs r0, #0
_081BF270:
	strh r0, [r5]
_081BF272:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081BF27C: .4byte 0x03002360
	thumb_func_end berry_fix_main

