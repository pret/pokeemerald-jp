.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_08116E70
sub_08116E70: @ 0x08116E70
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r4, _08116EB0
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl UnpackSelectedBattleAnimPalettes
	adds r6, r0, #0
	ldrh r3, [r4]
	lsls r3, r3, #0x10
	asrs r0, r3, #0x17
	movs r4, #1
	ands r0, r4
	asrs r1, r3, #0x18
	ands r1, r4
	asrs r2, r3, #0x19
	ands r2, r4
	asrs r3, r3, #0x1a
	ands r3, r4
	bl sub_080A6F8C
	orrs r6, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl StartBlendAnimSpriteColor
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116EB0: .4byte 0x020380BE
	thumb_func_end sub_08116E70

	thumb_func_start sub_08116EB4
sub_08116EB4: @ 0x08116EB4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #1]
	movs r0, #1
	bl UnpackSelectedBattleAnimPalettes
	adds r5, r0, #0
	ldr r0, _08116EE0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #7
	bhi _08116F5E
	lsls r0, r0, #2
	ldr r1, _08116EE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116EE0: .4byte 0x020380BE
_08116EE4: .4byte 0x08116EE8
_08116EE8: @ jump table
	.4byte _08116F0A @ case 0
	.4byte _08116F16 @ case 1
	.4byte _08116F08 @ case 2
	.4byte _08116F14 @ case 3
	.4byte _08116F24 @ case 4
	.4byte _08116F3C @ case 5
	.4byte _08116F44 @ case 6
	.4byte _08116F50 @ case 7
_08116F08:
	movs r5, #0
_08116F0A:
	mov r0, sp
	ldr r1, _08116F10
	b _08116F1A
	.align 2, 0
_08116F10: .4byte 0x020380D6
_08116F14:
	movs r5, #0
_08116F16:
	mov r0, sp
	ldr r1, _08116F20
_08116F1A:
	ldrb r1, [r1]
	strb r1, [r0]
	b _08116F5E
	.align 2, 0
_08116F20: .4byte 0x020380D7
_08116F24:
	mov r1, sp
	ldr r0, _08116F34
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08116F38
	ldrb r0, [r0]
	strb r0, [r1, #1]
	b _08116F5E
	.align 2, 0
_08116F34: .4byte 0x020380D6
_08116F38: .4byte 0x020380D7
_08116F3C:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1]
	b _08116F5E
_08116F44:
	movs r5, #0
	mov r2, sp
	ldr r0, _08116F4C
	b _08116F56
	.align 2, 0
_08116F4C: .4byte 0x020380D6
_08116F50:
	movs r5, #0
	mov r2, sp
	ldr r0, _08116FA8
_08116F56:
	ldrb r0, [r0]
	movs r1, #2
	eors r0, r1
	strb r0, [r2]
_08116F5E:
	movs r4, #0
	mov r6, sp
_08116F62:
	ldrb r0, [r6]
	cmp r4, r0
	beq _08116F8C
	ldrb r0, [r6, #1]
	cmp r4, r0
	beq _08116F8C
	adds r0, r4, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08116F8C
	adds r0, r4, #0
	bl sub_080A7074
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r0
	orrs r5, r1
_08116F8C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08116F62
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartBlendAnimSpriteColor
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116FA8: .4byte 0x020380D7
	thumb_func_end sub_08116EB4

	thumb_func_start AnimTask_SetCamouflageBlend
AnimTask_SetCamouflageBlend: @ 0x08116FAC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08116FD0
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl UnpackSelectedBattleAnimPalettes
	adds r2, r0, #0
	ldr r0, _08116FD4
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08117082
	lsls r0, r0, #2
	ldr r1, _08116FD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08116FD0: .4byte 0x020380BE
_08116FD4: .4byte 0x02022C94
_08116FD8: .4byte 0x08116FDC
_08116FDC: @ jump table
	.4byte _08117004 @ case 0
	.4byte _08117014 @ case 1
	.4byte _08117020 @ case 2
	.4byte _08117030 @ case 3
	.4byte _0811703C @ case 4
	.4byte _0811704C @ case 5
	.4byte _0811705C @ case 6
	.4byte _0811706C @ case 7
	.4byte _0811707C @ case 8
	.4byte _0811707C @ case 9
_08117004:
	ldr r1, _0811700C
	ldr r0, _08117010
	b _08117080
	.align 2, 0
_0811700C: .4byte 0x020380BE
_08117010: .4byte 0x00000B0C
_08117014:
	ldr r1, _0811701C
	movs r0, #0x9e
	lsls r0, r0, #4
	b _08117080
	.align 2, 0
_0811701C: .4byte 0x020380BE
_08117020:
	ldr r1, _08117028
	ldr r0, _0811702C
	b _08117080
	.align 2, 0
_08117028: .4byte 0x020380BE
_0811702C: .4byte 0x00002F1E
_08117030:
	ldr r1, _08117038
	movs r0, #0x90
	lsls r0, r0, #7
	b _08117080
	.align 2, 0
_08117038: .4byte 0x020380BE
_0811703C:
	ldr r1, _08117044
	ldr r0, _08117048
	b _08117080
	.align 2, 0
_08117044: .4byte 0x020380BE
_08117048: .4byte 0x00007ECB
_0811704C:
	ldr r1, _08117054
	ldr r0, _08117058
	b _08117080
	.align 2, 0
_08117054: .4byte 0x020380BE
_08117058: .4byte 0x00007ECB
_0811705C:
	ldr r1, _08117064
	ldr r0, _08117068
	b _08117080
	.align 2, 0
_08117064: .4byte 0x020380BE
_08117068: .4byte 0x00002A16
_0811706C:
	ldr r1, _08117074
	ldr r0, _08117078
	b _08117080
	.align 2, 0
_08117074: .4byte 0x020380BE
_08117078: .4byte 0x00000D2E
_0811707C:
	ldr r1, _08117090
	ldr r0, _08117094
_08117080:
	strh r0, [r1, #8]
_08117082:
	adds r0, r4, #0
	adds r1, r2, #0
	bl StartBlendAnimSpriteColor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117090: .4byte 0x020380BE
_08117094: .4byte 0x00007FFF
	thumb_func_end AnimTask_SetCamouflageBlend

	thumb_func_start AnimTask_BlendParticle
AnimTask_BlendParticle: @ 0x08117098
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081170C0
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	movs r1, #1
	lsls r1, r0
	adds r0, r4, #0
	bl StartBlendAnimSpriteColor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081170C0: .4byte 0x020380BE
	thumb_func_end AnimTask_BlendParticle

	thumb_func_start StartBlendAnimSpriteColor
StartBlendAnimSpriteColor: @ 0x081170C4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _081170FC
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	strh r1, [r2, #8]
	lsrs r1, r1, #0x10
	strh r1, [r2, #0xa]
	ldr r3, _08117100
	ldrh r1, [r3, #2]
	strh r1, [r2, #0xc]
	ldrh r1, [r3, #4]
	strh r1, [r2, #0xe]
	ldrh r1, [r3, #6]
	strh r1, [r2, #0x10]
	ldrh r1, [r3, #8]
	strh r1, [r2, #0x12]
	ldrh r1, [r3, #4]
	strh r1, [r2, #0x1c]
	ldr r1, _08117104
	str r1, [r2]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_081170FC: .4byte 0x03005B60
_08117100: .4byte 0x020380BE
_08117104: .4byte 0x08117109
	thumb_func_end StartBlendAnimSpriteColor

	thumb_func_start AnimTask_BlendSpriteColor_Step2
AnimTask_BlendSpriteColor_Step2: @ 0x08117108
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	ldr r2, _08117188
	lsls r5, r7, #2
	adds r0, r5, r7
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrh r0, [r3, #0x1a]
	mov r8, r0
	movs r4, #0x1a
	ldrsh r1, [r3, r4]
	movs r4, #0xc
	ldrsh r0, [r3, r4]
	mov sb, r2
	cmp r1, r0
	bne _0811719E
	strh r6, [r3, #0x1a]
	movs r0, #8
	ldrsh r4, [r3, r0]
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	lsls r0, r0, #0x10
	orrs r4, r0
	mov r8, r5
	cmp r4, #0
	beq _0811716A
	adds r5, r3, #0
_08117148:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0811715C
	ldrb r2, [r5, #0x1c]
	ldrh r3, [r5, #0x12]
	adds r0, r6, #0
	movs r1, #0x10
	bl BlendPalette
_0811715C:
	adds r0, r6, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsrs r4, r4, #1
	cmp r4, #0
	bne _08117148
_0811716A:
	mov r4, r8
	adds r0, r4, r7
	lsls r0, r0, #3
	mov r1, sb
	adds r2, r0, r1
	ldrh r0, [r2, #0x1c]
	movs r4, #0x1c
	ldrsh r3, [r2, r4]
	movs r4, #0x10
	ldrsh r1, [r2, r4]
	cmp r3, r1
	bge _0811718C
	adds r0, #1
	strh r0, [r2, #0x1c]
	b _081171A4
	.align 2, 0
_08117188: .4byte 0x03005B60
_0811718C:
	cmp r3, r1
	ble _08117196
	subs r0, #1
	strh r0, [r2, #0x1c]
	b _081171A4
_08117196:
	adds r0, r7, #0
	bl DestroyAnimVisualTask
	b _081171A4
_0811719E:
	mov r0, r8
	adds r0, #1
	strh r0, [r3, #0x1a]
_081171A4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AnimTask_BlendSpriteColor_Step2

	thumb_func_start sub_081171B0
sub_081171B0: @ 0x081171B0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r4, _081171E4
	ldrb r0, [r4]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #6]
	ldrb r4, [r4, #8]
	str r4, [sp]
	bl BeginHardwarePaletteFade
	ldr r1, _081171E8
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _081171EC
	str r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081171E4: .4byte 0x020380BE
_081171E8: .4byte 0x03005B60
_081171EC: .4byte 0x081171F1
	thumb_func_end sub_081171B0

	thumb_func_start sub_081171F0
sub_081171F0: @ 0x081171F0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0811720C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08117208
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08117208:
	pop {r0}
	bx r0
	.align 2, 0
_0811720C: .4byte 0x02037C74
	thumb_func_end sub_081171F0

	thumb_func_start sub_08117210
sub_08117210: @ 0x08117210
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0811723C
	adds r1, r1, r0
	ldr r2, _08117240
	ldrh r0, [r2]
	movs r3, #0
	strh r0, [r1, #8]
	strh r3, [r1, #0xa]
	ldrh r0, [r2, #2]
	strh r0, [r1, #0xc]
	ldrh r0, [r2, #4]
	strh r0, [r1, #0xe]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x10]
	strh r3, [r1, #0x12]
	ldr r0, _08117244
	str r0, [r1]
	bx lr
	.align 2, 0
_0811723C: .4byte 0x03005B60
_08117240: .4byte 0x020380BE
_08117244: .4byte 0x08117249
	thumb_func_end sub_08117210

	thumb_func_start sub_08117248
sub_08117248: @ 0x08117248
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, r5, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _08117274
	adds r4, r0, r1
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0811730C
	ldrh r1, [r4, #0xa]
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08117278
	subs r0, r1, #1
	strh r0, [r4, #0xa]
	b _0811731A
	.align 2, 0
_08117274: .4byte 0x03005B60
_08117278:
	ldrb r0, [r4, #8]
	bl CloneBattlerSpriteWithBlend
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _081172F6
	ldr r6, _08117304
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r3, r1, r6
	movs r2, #8
	ldrsh r0, [r4, r2]
	movs r2, #2
	cmp r0, #0
	beq _081172A0
	movs r2, #1
_081172A0:
	lsls r2, r2, #2
	ldrb r1, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #5]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r4, #0xe]
	strh r1, [r0, #0x2e]
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r5, [r0, #0x30]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #5
	strh r1, [r0, #0x32]
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08117308
	str r1, [r0]
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
_081172F6:
	ldrh r0, [r4, #0x10]
	subs r0, #1
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0xa]
	b _0811731A
	.align 2, 0
_08117304: .4byte 0x020205AC
_08117308: .4byte 0x08117321
_0811730C:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0811731A
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_0811731A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08117248

	thumb_func_start sub_08117320
sub_08117320: @ 0x08117320
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08117334
	subs r0, r1, #1
	strh r0, [r4, #0x2e]
	b _08117358
_08117334:
	ldr r3, _08117360
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	lsls r1, r1, #1
	movs r0, #0x30
	ldrsh r2, [r4, r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r3, #8
	adds r1, r1, r3
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	bl obj_delete_but_dont_free_vram
_08117358:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117360: .4byte 0x03005B60
	thumb_func_end sub_08117320

	thumb_func_start sub_08117364
sub_08117364: @ 0x08117364
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r7, #0
	ldr r0, _0811748C
	strh r7, [r0]
	ldr r0, _08117490
	strh r7, [r0]
	ldr r1, _08117494
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _08117498
	movs r0, #0x4a
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #0
	bl SetGpuRegBits
	ldr r1, _0811749C
	movs r0, #0x50
	bl SetGpuReg
	ldr r1, _081174A0
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0xa
	bl GetGpuReg
	add r4, sp, #0x10
	strh r0, [r4]
	ldrb r1, [r4]
	movs r0, #4
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r1
	strb r0, [r4]
	mov r2, sp
	adds r2, #0x11
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r4]
	movs r0, #0xa
	bl SetGpuReg
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081173F2
	ldrb r1, [r4]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldrh r1, [r4]
	movs r0, #0xa
	bl SetGpuReg
_081173F2:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08117476
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08117476
	ldr r5, _081174A4
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _08117422
	ldrb r0, [r5]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08117476
_08117422:
	ldrb r0, [r5]
	movs r6, #2
	eors r0, r6
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08117476
	ldr r3, _081174A8
	ldr r1, _081174AC
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrb r3, [r2, #5]
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1e
	subs r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
	ldrh r1, [r4]
	movs r0, #0xa
	bl SetGpuReg
	movs r7, #1
_08117476:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081174B4
	ldr r0, _081174B0
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r5, [r0]
	b _081174FC
	.align 2, 0
_0811748C: .4byte 0x02022AD8
_08117490: .4byte 0x02022ADA
_08117494: .4byte 0x00003F3F
_08117498: .4byte 0x00003F3D
_0811749C: .4byte 0x00003F42
_081174A0: .4byte 0x00000C08
_081174A4: .4byte 0x020380D6
_081174A8: .4byte 0x020205AC
_081174AC: .4byte 0x02023E88
_081174B0: .4byte 0x02039BD4
_081174B4:
	ldr r4, _081174D4
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081174E0
	ldr r1, _081174D8
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081174DC
	b _081174F0
	.align 2, 0
_081174D4: .4byte 0x020380D6
_081174D8: .4byte 0x02023D12
_081174DC: .4byte 0x020243E8
_081174E0:
	ldr r1, _08117588
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0811758C
_081174F0:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_081174FC:
	movs r0, #0
	bl GetAnimBattlerSpriteId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08117590
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080A8290
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, sp
	bl sub_080A63F8
	ldr r1, _08117594
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _08117598
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r0, _0811759C
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	adds r1, #1
	movs r2, #2
	bl LoadPalette
	ldr r2, _081175A0
	ldr r0, _081175A4
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x20]
	rsbs r0, r0, #0
	adds r0, #0x20
	strh r0, [r2]
	ldr r2, _081175A8
	ldrh r0, [r1, #0x22]
	rsbs r0, r0, #0
	adds r0, #0x20
	strh r0, [r2]
	ldr r1, _081175AC
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #8]
	strh r7, [r0, #0x14]
	ldr r1, _081175B0
	str r1, [r0]
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117588: .4byte 0x02023D12
_0811758C: .4byte 0x02024190
_08117590: .4byte 0x020380D6
_08117594: .4byte 0x08C20728
_08117598: .4byte 0x08C2070C
_0811759C: .4byte 0x08572FFC
_081175A0: .4byte 0x02022ACC
_081175A4: .4byte 0x020205AC
_081175A8: .4byte 0x02022ACE
_081175AC: .4byte 0x03005B60
_081175B0: .4byte 0x081175B5
	thumb_func_end sub_08117364

	thumb_func_start sub_081175B4
sub_081175B4: @ 0x081175B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r0, #0
	ldr r1, _081176E4
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #0x1c]
	adds r0, #4
	movs r1, #0
	mov r8, r1
	strh r0, [r5, #0x1c]
	ldr r7, _081176E8
	ldrh r2, [r7]
	subs r1, r2, #4
	strh r1, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _081176D6
	mov r0, r8
	strh r0, [r5, #0x1c]
	adds r0, r2, #0
	adds r0, #0x3c
	strh r0, [r7]
	ldrh r0, [r5, #0x1e]
	adds r0, #1
	strh r0, [r5, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _081176D6
	movs r0, #0
	bl sub_080A4044
	ldr r0, _081176EC
	mov r1, r8
	strh r1, [r0]
	ldr r0, _081176F0
	strh r1, [r0]
	ldr r4, _081176F4
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08117646
	movs r0, #0xa
	bl GetGpuReg
	add r1, sp, #0x10
	strh r0, [r1]
	ldrb r2, [r1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldrh r1, [r1]
	movs r0, #0xa
	bl SetGpuReg
_08117646:
	movs r0, #0
	bl GetGpuReg
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	bl GetAnimBattlerSpriteId
	ldr r4, _081176F8
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	bl sub_080A6530
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _081176CC
	ldr r2, _081176FC
	ldr r0, _08117700
	ldrb r1, [r0]
	movs r0, #2
	eors r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrb r3, [r2, #5]
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
_081176CC:
	mov r2, r8
	strh r2, [r7]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_081176D6:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081176E4: .4byte 0x03005B60
_081176E8: .4byte 0x02022ACE
_081176EC: .4byte 0x02022AD8
_081176F0: .4byte 0x02022ADA
_081176F4: .4byte 0x00003F3F
_081176F8: .4byte 0x020205AC
_081176FC: .4byte 0x02023E88
_08117700: .4byte 0x020380D6
	thumb_func_end sub_081175B4

	thumb_func_start sub_08117704
sub_08117704: @ 0x08117704
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _08117744
	movs r0, #0x18
	bl AllocZeroed
	str r0, [r4]
	movs r2, #0
	ldr r3, _08117748
_08117718:
	ldr r1, [r4]
	lsls r0, r2, #1
	adds r1, #4
	adds r1, r1, r0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _08117718
	ldr r0, _0811774C
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08117750
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08117744: .4byte 0x02039DDC
_08117748: .4byte 0x020380BE
_0811774C: .4byte 0x03005B60
_08117750: .4byte 0x08117755
	thumb_func_end sub_08117704

	thumb_func_start sub_08117754
sub_08117754: @ 0x08117754
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0811776C
	ldr r1, [r0]
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08117774
	ldr r0, _08117770
	b _08117776
	.align 2, 0
_0811776C: .4byte 0x02039DDC
_08117770: .4byte 0x020380D6
_08117774:
	ldr r0, _081178A0
_08117776:
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r4, _081178A4
	ldr r2, [r4]
	ldrb r0, [r2]
	movs r1, #2
	eors r0, r1
	strb r0, [r2, #1]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081177A6
	ldr r1, [r4]
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _081177AC
	ldrb r0, [r1, #1]
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081177AC
_081177A6:
	ldr r1, [r4]
	movs r0, #0
	strh r0, [r1, #0xa]
_081177AC:
	ldr r0, _081178A8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081178AC
	strh r1, [r0]
	ldr r1, _081178B0
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _081178B4
	movs r0, #0x4a
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #0
	bl SetGpuRegBits
	ldr r1, _081178B8
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetAnimBgAttribute
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811780A
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
_0811780A:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08117886
	ldr r4, _081178A4
	ldr r1, [r4]
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08117886
	ldrb r0, [r1]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _0811783C
	ldr r0, [r4]
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08117886
_0811783C:
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _08117886
	ldr r3, _081178BC
	ldr r1, _081178C0
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrb r3, [r2, #5]
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1e
	subs r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
	movs r0, #1
	movs r1, #4
	movs r2, #1
	bl SetAnimBgAttribute
	ldr r0, [r4]
	strb r5, [r0, #2]
_08117886:
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081178C8
	ldr r0, _081178A4
	ldr r1, [r0]
	ldr r0, _081178C4
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r0, [r0]
	b _08117914
	.align 2, 0
_081178A0: .4byte 0x020380D7
_081178A4: .4byte 0x02039DDC
_081178A8: .4byte 0x02022AD8
_081178AC: .4byte 0x02022ADA
_081178B0: .4byte 0x00003F3F
_081178B4: .4byte 0x00003F3D
_081178B8: .4byte 0x00003F42
_081178BC: .4byte 0x020205AC
_081178C0: .4byte 0x02023E88
_081178C4: .4byte 0x02039BD4
_081178C8:
	ldr r4, _081178EC
	ldr r0, [r4]
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081178F8
	ldr r1, _081178F0
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081178F4
	b _0811790A
	.align 2, 0
_081178EC: .4byte 0x02039DDC
_081178F0: .4byte 0x02023D12
_081178F4: .4byte 0x020243E8
_081178F8:
	ldr r1, _0811792C
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08117930
_0811790A:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	ldr r1, [r4]
_08117914:
	strh r0, [r1, #0x14]
	ldr r0, _08117934
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08117938
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811792C: .4byte 0x02023D12
_08117930: .4byte 0x02024190
_08117934: .4byte 0x03005B60
_08117938: .4byte 0x0811793D
	thumb_func_end sub_08117754

	thumb_func_start sub_0811793C
sub_0811793C: @ 0x0811793C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r6, _0811799C
	ldr r4, _081179A0
	ldr r2, [r4]
	ldrb r0, [r2]
	adds r1, r0, r6
	ldrb r1, [r1]
	ldrh r2, [r2, #0x14]
	bl sub_080A8290
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, [r4]
	movs r1, #0xa
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0811797E
	ldrb r0, [r2, #1]
	adds r1, r0, r6
	ldrb r1, [r1]
	ldrh r2, [r2, #0x14]
	bl sub_080A8290
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0811797E:
	mov r0, sp
	bl sub_080A63F8
	ldr r0, [r4]
	movs r4, #4
	ldrsh r0, [r0, r4]
	cmp r0, #0
	bne _081179A8
	ldr r1, _081179A4
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
	b _081179B2
	.align 2, 0
_0811799C: .4byte 0x02023E88
_081179A0: .4byte 0x02039DDC
_081179A4: .4byte 0x08C2D9D4
_081179A8:
	ldr r1, _081179D8
	mov r0, sp
	movs r2, #0
	bl sub_080A6628
_081179B2:
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _081179DC
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r0, _081179E0
	ldr r0, [r0]
	movs r1, #6
	ldrsh r0, [r0, r1]
	cmp r0, #6
	bhi _08117A48
	lsls r0, r0, #2
	ldr r1, _081179E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081179D8: .4byte 0x08C2DAF0
_081179DC: .4byte 0x08C2D7C4
_081179E0: .4byte 0x02039DDC
_081179E4: .4byte 0x081179E8
_081179E8: @ jump table
	.4byte _08117A04 @ case 0
	.4byte _08117A0C @ case 1
	.4byte _08117A14 @ case 2
	.4byte _08117A1C @ case 3
	.4byte _08117A24 @ case 4
	.4byte _08117A2C @ case 5
	.4byte _08117A34 @ case 6
_08117A04:
	ldr r0, _08117A08
	b _08117A36
	.align 2, 0
_08117A08: .4byte 0x08C2DC2C
_08117A0C:
	ldr r0, _08117A10
	b _08117A36
	.align 2, 0
_08117A10: .4byte 0x08C2DC0C
_08117A14:
	ldr r0, _08117A18
	b _08117A36
	.align 2, 0
_08117A18: .4byte 0x08C2DC4C
_08117A1C:
	ldr r0, _08117A20
	b _08117A36
	.align 2, 0
_08117A20: .4byte 0x08C2DC6C
_08117A24:
	ldr r0, _08117A28
	b _08117A36
	.align 2, 0
_08117A28: .4byte 0x08C2DCAC
_08117A2C:
	ldr r0, _08117A30
	b _08117A36
	.align 2, 0
_08117A30: .4byte 0x08C2DCCC
_08117A34:
	ldr r0, _08117A44
_08117A36:
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	b _08117A56
	.align 2, 0
_08117A44: .4byte 0x08C2DCEC
_08117A48:
	ldr r0, _08117A80
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
_08117A56:
	ldr r3, _08117A84
	movs r2, #0
	strh r2, [r3]
	ldr r0, _08117A88
	strh r2, [r0]
	ldr r1, _08117A8C
	ldr r0, [r1]
	movs r4, #4
	ldrsh r0, [r0, r4]
	adds r4, r1, #0
	cmp r0, #1
	bne _08117A98
	movs r0, #0x40
	strh r0, [r3]
	ldr r2, _08117A90
	lsls r3, r5, #2
	adds r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08117A94
	b _08117AA4
	.align 2, 0
_08117A80: .4byte 0x08C2DC8C
_08117A84: .4byte 0x02022ACC
_08117A88: .4byte 0x02022ACE
_08117A8C: .4byte 0x02039DDC
_08117A90: .4byte 0x03005B60
_08117A94: .4byte 0x0000FFFD
_08117A98:
	ldr r2, _08117AC0
	lsls r3, r5, #2
	adds r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #3
_08117AA4:
	strh r1, [r0, #0xa]
	ldr r0, [r4]
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08117AC4
	adds r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0xa
	strh r1, [r0, #0x10]
	movs r1, #0x14
	b _08117AD0
	.align 2, 0
_08117AC0: .4byte 0x03005B60
_08117AC4:
	adds r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0xd
	strh r1, [r0, #0x10]
	movs r1, #0x1e
_08117AD0:
	strh r1, [r0, #0x12]
	adds r1, r3, r5
	lsls r1, r1, #3
	adds r1, r1, r2
	strh r7, [r1, #8]
	ldr r3, [r4]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #0xc]
	mov r4, r8
	strh r4, [r1, #0xe]
	ldrb r0, [r3, #2]
	strh r0, [r1, #0x14]
	ldr r2, _08117B14
	ldrb r0, [r3, #1]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x16]
	ldr r0, _08117B18
	str r0, [r1]
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _08117B1C
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning2
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xef
	bl PlaySE12WithPanning
	b _08117B30
	.align 2, 0
_08117B14: .4byte 0x02023E88
_08117B18: .4byte 0x08117B3D
_08117B1C:
	movs r0, #0x40
	rsbs r0, r0, #0
	bl BattleAnimAdjustPanning2
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0xf5
	bl PlaySE12WithPanning
_08117B30:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0811793C

	thumb_func_start sub_08117B3C
sub_08117B3C: @ 0x08117B3C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _08117B68
	ldr r1, _08117B6C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #0xa]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #0x26
	ldrsh r2, [r5, r0]
	cmp r2, #1
	beq _08117BB2
	cmp r2, #1
	bgt _08117B70
	cmp r2, #0
	beq _08117B7A
	b _08117CC8
	.align 2, 0
_08117B68: .4byte 0x02022ACE
_08117B6C: .4byte 0x03005B60
_08117B70:
	cmp r2, #2
	beq _08117BC8
	cmp r2, #3
	beq _08117C06
	b _08117CC8
_08117B7A:
	ldrh r0, [r5, #0x1e]
	adds r1, r0, #1
	strh r1, [r5, #0x1e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08117B88
	b _08117CC8
_08117B88:
	strh r2, [r5, #0x1e]
	ldrh r1, [r5, #0x20]
	adds r1, #1
	strh r1, [r5, #0x20]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r2, #0x20
	ldrsh r1, [r5, r2]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	beq _08117BB0
	b _08117CC8
_08117BB0:
	b _08117BFE
_08117BB2:
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _08117BC6
	b _08117CC8
_08117BC6:
	b _08117BFE
_08117BC8:
	ldrh r0, [r5, #0x1e]
	adds r1, r0, #1
	strh r1, [r5, #0x1e]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08117CC8
	movs r0, #0
	strh r0, [r5, #0x1e]
	ldrh r1, [r5, #0x20]
	subs r1, #1
	strh r1, [r5, #0x20]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08117CC8
	movs r0, #0
	bl sub_080A4044
_08117BFE:
	ldrh r0, [r5, #0x26]
	adds r0, #1
	strh r0, [r5, #0x26]
	b _08117CC8
_08117C06:
	ldr r0, _08117CD0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08117CD4
	strh r1, [r0]
	ldr r4, _08117CD8
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08117C36
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_08117C36:
	movs r0, #0
	bl GetGpuReg
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08117CDC
	adds r0, r0, r4
	bl DestroySprite
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08117C8A
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
_08117C8A:
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _08117CB6
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrb r3, [r2, #5]
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1e
	adds r1, #1
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #5]
_08117CB6:
	ldr r4, _08117CE0
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_08117CC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08117CD0: .4byte 0x02022AD8
_08117CD4: .4byte 0x02022ADA
_08117CD8: .4byte 0x00003F3F
_08117CDC: .4byte 0x020205AC
_08117CE0: .4byte 0x02039DDC
	thumb_func_end sub_08117B3C

	thumb_func_start sub_08117CE4
sub_08117CE4: @ 0x08117CE4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_080A6F8C
	adds r6, r0, #0
	movs r1, #0
	bl sub_08117E14
	ldr r0, _08117D44
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	lsrs r0, r6, #0x10
	movs r5, #0
	strh r0, [r4, #0x24]
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A6E74
	adds r6, r0, #0
	ldr r1, _08117D48
	ands r6, r1
	adds r0, r6, #0
	bl sub_08117E14
	strh r6, [r4, #0x26]
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
	ldr r0, _08117D4C
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08117D44: .4byte 0x03005B60
_08117D48: .4byte 0x0000FFFF
_08117D4C: .4byte 0x08117D51
	thumb_func_end sub_08117CE4

	thumb_func_start sub_08117D50
sub_08117D50: @ 0x08117D50
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08117D74
	adds r4, r0, r1
	movs r0, #8
	ldrsh r1, [r4, r0]
	cmp r1, #1
	beq _08117D94
	cmp r1, #1
	bgt _08117D78
	cmp r1, #0
	beq _08117D7E
	b _08117E0E
	.align 2, 0
_08117D74: .4byte 0x03005B60
_08117D78:
	cmp r1, #2
	beq _08117E08
	b _08117E0E
_08117D7E:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08117E0E
	strh r1, [r4, #0xa]
	movs r0, #0x10
	strh r0, [r4, #0xc]
	b _08117DFC
_08117D94:
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08117E0E
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	movs r5, #0
	movs r6, #1
_08117DB0:
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, #0
	beq _08117DCA
	lsls r0, r5, #0x14
	lsrs r0, r0, #0x10
	ldrb r2, [r4, #0xc]
	movs r1, #0x10
	ldr r3, _08117E04
	bl BlendPalette
_08117DCA:
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, #0
	beq _08117DEA
	lsls r0, r5, #0x14
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	ldrb r2, [r4, #0xc]
	movs r1, #0x10
	movs r3, #0
	bl BlendPalette
_08117DEA:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _08117DB0
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08117E0E
_08117DFC:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08117E0E
	.align 2, 0
_08117E04: .4byte 0x0000FFFF
_08117E08:
	adds r0, r2, #0
	bl DestroyAnimVisualTask
_08117E0E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08117D50

	thumb_func_start sub_08117E14
sub_08117E14: @ 0x08117E14
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r2, #0
_08117E1E:
	movs r0, #1
	ands r0, r3
	lsrs r4, r3, #1
	adds r5, r2, #1
	cmp r0, #0
	beq _08117E4A
	lsls r0, r2, #0x14
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x10
	cmp r2, r0
	bge _08117E4A
	ldr r1, _08117E5C
	adds r3, r0, #0
_08117E3A:
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r6, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	blt _08117E3A
_08117E4A:
	adds r3, r4, #0
	lsls r0, r5, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _08117E1E
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08117E5C: .4byte 0x020377B4
	thumb_func_end sub_08117E14

	thumb_func_start sub_08117E60
sub_08117E60: @ 0x08117E60
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	movs r2, #0
	ldr r0, _08117EA8
	ldrb r3, [r0]
	movs r5, #1
_08117E70:
	cmp r3, r2
	beq _08117E7E
	adds r1, r2, #0
	adds r1, #0x10
	adds r0, r5, #0
	lsls r0, r1
	orrs r4, r0
_08117E7E:
	adds r2, #1
	cmp r2, #3
	bls _08117E70
	movs r2, #5
	ldr r0, _08117EAC
	adds r1, r0, #0
	adds r1, #8
_08117E8C:
	ldrh r0, [r1]
	strh r0, [r1, #2]
	subs r1, #2
	subs r2, #1
	cmp r2, #0
	bne _08117E8C
	adds r0, r6, #0
	adds r1, r4, #0
	bl StartBlendAnimSpriteColor
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08117EA8: .4byte 0x020380D6
_08117EAC: .4byte 0x020380BE
	thumb_func_end sub_08117E60

	thumb_func_start sub_08117EB0
sub_08117EB0: @ 0x08117EB0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	bl sub_080A6674
	ldr r0, _08117F18
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _08117F1C
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08117EEC
	ldr r0, _08117F20
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08117EEC
	ldrh r0, [r4]
	rsbs r0, r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_08117EEC:
	ldr r0, _08117F24
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r2, _08117F1C
	ldrh r0, [r2]
	strh r0, [r1, #0xa]
	ldrh r0, [r2, #2]
	strh r0, [r1, #0xc]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08117F18: .4byte 0x08117F29
_08117F1C: .4byte 0x020380BE
_08117F20: .4byte 0x020380D6
_08117F24: .4byte 0x03005B60
	thumb_func_end sub_08117EB0

	thumb_func_start sub_08117F28
sub_08117F28: @ 0x08117F28
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08117F94
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r3, [r1, #0xa]
	ldrh r0, [r1, #0x1c]
	adds r3, r3, r0
	movs r4, #0
	mov ip, r4
	strh r3, [r1, #0x1c]
	ldrh r2, [r1, #0xc]
	ldrh r7, [r1, #0x1e]
	adds r2, r2, r7
	strh r2, [r1, #0x1e]
	ldr r6, _08117F98
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	ldrh r4, [r6]
	adds r0, r0, r4
	strh r0, [r6]
	ldr r4, _08117F9C
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	ldrh r7, [r4]
	adds r0, r0, r7
	strh r0, [r4]
	movs r0, #0xff
	ands r3, r0
	strh r3, [r1, #0x1c]
	ands r2, r0
	strh r2, [r1, #0x1e]
	ldr r0, _08117FA0
	movs r3, #0xe
	ldrsh r2, [r0, r3]
	movs r7, #0xe
	ldrsh r0, [r1, r7]
	cmp r2, r0
	bne _08117F8E
	mov r0, ip
	strh r0, [r6]
	strh r0, [r4]
	movs r0, #1
	bl sub_080A6674
	adds r0, r5, #0
	bl DestroyTask
_08117F8E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117F94: .4byte 0x03005B60
_08117F98: .4byte 0x02022AD4
_08117F9C: .4byte 0x02022AD6
_08117FA0: .4byte 0x020380BE
	thumb_func_end sub_08117F28

	thumb_func_start AnimTask_GetAttackerSide
AnimTask_GetAttackerSide: @ 0x08117FA4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08117FC8
	ldrb r0, [r0]
	bl GetBattlerSide
	ldr r1, _08117FCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0xe]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117FC8: .4byte 0x020380D6
_08117FCC: .4byte 0x020380BE
	thumb_func_end AnimTask_GetAttackerSide

	thumb_func_start AnimTask_GetTargetSide
AnimTask_GetTargetSide: @ 0x08117FD0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08117FF4
	ldrb r0, [r0]
	bl GetBattlerSide
	ldr r1, _08117FF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0xe]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117FF4: .4byte 0x020380D7
_08117FF8: .4byte 0x020380BE
	thumb_func_end AnimTask_GetTargetSide

	thumb_func_start AnimTask_GetTargetIsAttackerPartner
AnimTask_GetTargetIsAttackerPartner: @ 0x08117FFC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r5, _08118028
	movs r4, #0
	ldr r0, _0811802C
	ldrb r2, [r0]
	movs r0, #2
	ldr r1, _08118030
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bne _08118018
	movs r4, #1
_08118018:
	strh r4, [r5, #0xe]
	adds r0, r3, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08118028: .4byte 0x020380BE
_0811802C: .4byte 0x020380D6
_08118030: .4byte 0x020380D7
	thumb_func_end AnimTask_GetTargetIsAttackerPartner

	thumb_func_start sub_08118034
sub_08118034: @ 0x08118034
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r6, _08118094
_0811803E:
	ldr r0, _08118098
	ldrb r0, [r0]
	cmp r4, r0
	beq _0811807C
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811807C
	ldr r0, _0811809C
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldr r1, _081180A0
	adds r2, #0x3e
	movs r0, #1
	ldrb r3, [r1]
	ands r3, r0
	lsls r3, r3, #2
	ldrb r0, [r2]
	movs r7, #5
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_0811807C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _0811803E
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118094: .4byte 0x020205AC
_08118098: .4byte 0x020380D6
_0811809C: .4byte 0x02023E88
_081180A0: .4byte 0x020380BE
	thumb_func_end sub_08118034

	thumb_func_start sub_081180A4
sub_081180A4: @ 0x081180A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r1, [sp, #0x44]
	ldr r4, [sp, #0x48]
	ldr r5, [sp, #0x4c]
	ldr r6, [sp, #0x50]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x18]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x1c]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov sl, r6
	movs r0, #0
	str r0, [sp, #0x20]
	movs r0, #2
	adds r6, r7, #0
	eors r6, r0
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08118106
	mov r1, r8
	cmp r1, #0
	beq _0811810A
	adds r0, r6, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811810A
_08118106:
	movs r2, #0
	mov r8, r2
_0811810A:
	ldr r0, _0811819C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081181A0
	strh r1, [r0]
	ldr r1, _081181A4
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _081181A8
	movs r0, #0x4a
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #0
	bl SetGpuRegBits
	ldr r1, _081181AC
	movs r0, #0x50
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0xa
	bl GetGpuReg
	add r4, sp, #0x10
	strh r0, [r4]
	ldrb r1, [r4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	mov r2, sp
	adds r2, #0x11
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08118180
	ldrb r0, [r4]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r4]
_08118180:
	ldrh r1, [r4]
	movs r0, #0xa
	bl SetGpuReg
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081181B4
	ldr r0, _081181B0
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	ldrh r4, [r0]
	b _081181F2
	.align 2, 0
_0811819C: .4byte 0x02022AD8
_081181A0: .4byte 0x02022ADA
_081181A4: .4byte 0x00003F3F
_081181A8: .4byte 0x00003F3D
_081181AC: .4byte 0x00003F42
_081181B0: .4byte 0x02039BD4
_081181B4:
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081181D8
	ldr r1, _081181D0
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081181D4
	b _081181E6
	.align 2, 0
_081181D0: .4byte 0x02023D12
_081181D4: .4byte 0x020243E8
_081181D8:
	ldr r1, _08118294
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08118298
_081181E6:
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_081181F2:
	ldr r5, _0811829C
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r0, r7, #0
	adds r2, r4, #0
	bl sub_080A8290
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r0, r8
	cmp r0, #0
	beq _0811821C
	adds r0, r6, r5
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_080A8290
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
_0811821C:
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldr r1, [sp, #0x58]
	movs r2, #0
	bl sub_080A6628
	mov r0, sp
	ldrb r0, [r0, #9]
	mov r1, sp
	ldrh r2, [r1, #0xa]
	ldr r1, [sp, #0x54]
	bl AnimLoadCompressedBgGfx
	mov r0, sp
	ldrb r1, [r0, #8]
	lsls r1, r1, #4
	ldr r0, [sp, #0x5c]
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r0, _081182A0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _081182A4
	strh r1, [r0]
	ldr r1, _081182A8
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0xa]
	mov r2, sp
	ldrh r2, [r2, #0x18]
	strh r2, [r0, #0x10]
	mov r1, sl
	strh r1, [r0, #0x12]
	mov r2, sp
	ldrh r2, [r2, #0x1c]
	strh r2, [r0, #0x14]
	strh r7, [r0, #8]
	mov r1, r8
	strh r1, [r0, #0xc]
	mov r2, sp
	ldrh r2, [r2, #0x20]
	strh r2, [r0, #0xe]
	ldr r1, _081182AC
	str r1, [r0]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118294: .4byte 0x02023D12
_08118298: .4byte 0x02024190
_0811829C: .4byte 0x02023E88
_081182A0: .4byte 0x02022ACC
_081182A4: .4byte 0x02022ACE
_081182A8: .4byte 0x03005B60
_081182AC: .4byte 0x081182B1
	thumb_func_end sub_081180A4

	thumb_func_start sub_081182B0
sub_081182B0: @ 0x081182B0
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _081182EC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r3, r0, r1
	movs r0, #0xa
	ldrsh r2, [r3, r0]
	adds r5, r1, #0
	cmp r2, #0
	bge _081182CE
	rsbs r2, r2, #0
_081182CE:
	ldrh r0, [r3, #0x22]
	adds r4, r0, r2
	strh r4, [r3, #0x22]
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _081182F4
	ldr r2, _081182F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
	b _08118300
	.align 2, 0
_081182EC: .4byte 0x03005B60
_081182F0: .4byte 0x02022ACE
_081182F4:
	ldr r1, _08118324
	lsls r0, r4, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_08118300:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r5
	ldrh r1, [r5, #0x22]
	movs r0, #0xff
	ands r0, r1
	movs r2, #0
	strh r0, [r5, #0x22]
	movs r3, #0x26
	ldrsh r0, [r5, r3]
	cmp r0, #1
	beq _0811836A
	cmp r0, #1
	bgt _08118328
	cmp r0, #0
	beq _0811832E
	b _0811845C
	.align 2, 0
_08118324: .4byte 0x02022ACE
_08118328:
	cmp r0, #2
	beq _08118384
	b _0811845C
_0811832E:
	ldrh r0, [r5, #0x1e]
	adds r1, r0, #1
	strh r1, [r5, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x14
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bge _08118342
	b _0811845C
_08118342:
	strh r2, [r5, #0x1e]
	ldrh r1, [r5, #0x20]
	adds r1, #1
	strh r1, [r5, #0x20]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x20
	ldrsh r1, [r5, r0]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0811845C
	b _0811837C
_0811836A:
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bne _0811845C
_0811837C:
	ldrh r0, [r5, #0x26]
	adds r0, #1
	strh r0, [r5, #0x26]
	b _0811845C
_08118384:
	ldrh r0, [r5, #0x1e]
	adds r1, r0, #1
	strh r1, [r5, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x14
	ldrsh r1, [r5, r3]
	cmp r0, r1
	blt _0811845C
	strh r2, [r5, #0x1e]
	ldrh r1, [r5, #0x20]
	subs r1, #1
	strh r1, [r5, #0x20]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r0, #0x20
	ldrsh r4, [r5, r0]
	cmp r4, #0
	bne _0811845C
	movs r0, #0
	bl sub_080A4044
	ldr r0, _08118464
	strh r4, [r0]
	ldr r0, _08118468
	strh r4, [r0]
	ldr r4, _0811846C
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08118402
	movs r0, #0xa
	bl GetGpuReg
	mov r1, sp
	strh r0, [r1]
	mov r2, sp
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #0xa
	bl SetGpuReg
_08118402:
	movs r0, #0
	bl GetGpuReg
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r3, #8
	ldrsh r1, [r5, r3]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08118470
	adds r0, r0, r4
	bl DestroySprite
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08118456
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
_08118456:
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_0811845C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08118464: .4byte 0x02022AD8
_08118468: .4byte 0x02022ADA
_0811846C: .4byte 0x00003F3F
_08118470: .4byte 0x020205AC
	thumb_func_end sub_081182B0

	thumb_func_start AnimTask_GetBattleTerrain
AnimTask_GetBattleTerrain: @ 0x08118474
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0811848C
	ldr r1, _08118490
	ldrb r1, [r1]
	strh r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_0811848C: .4byte 0x020380BE
_08118490: .4byte 0x02022C94
	thumb_func_end AnimTask_GetBattleTerrain

	thumb_func_start sub_08118494
sub_08118494: @ 0x08118494
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0x80
	lsls r0, r0, #6
	bl AllocZeroed
	ldr r1, _081184BC
	ldr r1, [r1]
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081184BC: .4byte 0x02024178
	thumb_func_end sub_08118494

	thumb_func_start sub_081184C0
sub_081184C0: @ 0x081184C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _081184EC
	ldr r0, [r6]
	movs r5, #0xbe
	lsls r5, r5, #1
	adds r0, r0, r5
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r0, r0, r5
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081184EC: .4byte 0x02024178
	thumb_func_end sub_081184C0

	thumb_func_start sub_081184F0
sub_081184F0: @ 0x081184F0
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r0, _08118530
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08118534
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A6E74
	adds r1, r0, #0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0811854C
	movs r2, #1
_08118522:
	lsrs r1, r1, #1
	adds r4, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08118522
	b _0811854C
	.align 2, 0
_08118530: .4byte 0x020380BE
_08118534:
	cmp r0, #1
	bne _08118540
	ldr r0, _0811853C
	b _08118546
	.align 2, 0
_0811853C: .4byte 0x020380D6
_08118540:
	cmp r0, #2
	bne _0811854C
	ldr r0, _0811857C
_08118546:
	ldrb r0, [r0]
	adds r4, r0, #0
	adds r4, #0x10
_0811854C:
	ldr r0, _08118580
	ldr r1, [r0]
	ldr r0, _08118584
	movs r2, #2
	ldrsh r0, [r0, r2]
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r1, [r1]
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r1, r4, #5
	ldr r2, _08118588
	adds r1, r1, r2
	movs r2, #0x20
	bl memcpy
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811857C: .4byte 0x020380D7
_08118580: .4byte 0x02024178
_08118584: .4byte 0x020380BE
_08118588: .4byte 0x020373B4
	thumb_func_end sub_081184F0

	thumb_func_start sub_0811858C
sub_0811858C: @ 0x0811858C
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r0, _081185CC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _081185D0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A6E74
	adds r1, r0, #0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _081185E8
	movs r2, #1
_081185BE:
	lsrs r1, r1, #1
	adds r4, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _081185BE
	b _081185E8
	.align 2, 0
_081185CC: .4byte 0x020380BE
_081185D0:
	cmp r0, #1
	bne _081185DC
	ldr r0, _081185D8
	b _081185E2
	.align 2, 0
_081185D8: .4byte 0x020380D6
_081185DC:
	cmp r0, #2
	bne _081185E8
	ldr r0, _08118618
_081185E2:
	ldrb r0, [r0]
	adds r4, r0, #0
	adds r4, #0x10
_081185E8:
	lsls r0, r4, #5
	ldr r1, _0811861C
	adds r0, r0, r1
	ldr r1, _08118620
	ldr r2, [r1]
	ldr r1, _08118624
	movs r3, #2
	ldrsh r1, [r1, r3]
	movs r3, #0xbe
	lsls r3, r3, #1
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r1, r1, #5
	adds r1, r1, r2
	movs r2, #0x20
	bl memcpy
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08118618: .4byte 0x020380D7
_0811861C: .4byte 0x020373B4
_08118620: .4byte 0x02024178
_08118624: .4byte 0x020380BE
	thumb_func_end sub_0811858C

	thumb_func_start sub_08118628
sub_08118628: @ 0x08118628
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r0, _08118668
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0811866C
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A6E74
	adds r1, r0, #0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08118684
	movs r2, #1
_0811865A:
	lsrs r1, r1, #1
	adds r4, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0811865A
	b _08118684
	.align 2, 0
_08118668: .4byte 0x020380BE
_0811866C:
	cmp r0, #1
	bne _08118678
	ldr r0, _08118674
	b _0811867E
	.align 2, 0
_08118674: .4byte 0x020380D6
_08118678:
	cmp r0, #2
	bne _08118684
	ldr r0, _081186A4
_0811867E:
	ldrb r0, [r0]
	adds r4, r0, #0
	adds r4, #0x10
_08118684:
	lsls r1, r4, #5
	ldr r0, _081186A8
	adds r0, r1, r0
	ldr r2, _081186AC
	adds r1, r1, r2
	movs r2, #0x20
	bl memcpy
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081186A4: .4byte 0x020380D7
_081186A8: .4byte 0x020373B4
_081186AC: .4byte 0x020377B4
	thumb_func_end sub_08118628

	thumb_func_start AnimTask_IsContest
AnimTask_IsContest: @ 0x081186B0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _081186D0
	ldr r1, _081186CC
	movs r0, #1
	strh r0, [r1, #0xe]
	b _081186D4
	.align 2, 0
_081186CC: .4byte 0x020380BE
_081186D0:
	ldr r0, _081186E0
	strh r1, [r0, #0xe]
_081186D4:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081186E0: .4byte 0x020380BE
	thumb_func_end AnimTask_IsContest

	thumb_func_start sub_081186E4
sub_081186E4: @ 0x081186E4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08118704
	ldr r1, _08118708
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _0811870C
	ldr r1, _08118710
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08118704: .4byte 0x020380D6
_08118708: .4byte 0x02023EB0
_0811870C: .4byte 0x020380D7
_08118710: .4byte 0x02023EB2
	thumb_func_end sub_081186E4

	thumb_func_start AnimTask_IsTargetSameSide
AnimTask_IsTargetSameSide: @ 0x08118714
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0811873C
	ldrb r0, [r0]
	bl GetBattlerSide
	adds r4, r0, #0
	ldr r0, _08118740
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	bne _08118748
	ldr r1, _08118744
	movs r0, #1
	b _0811874C
	.align 2, 0
_0811873C: .4byte 0x020380D6
_08118740: .4byte 0x020380D7
_08118744: .4byte 0x020380BE
_08118748:
	ldr r1, _0811875C
	movs r0, #0
_0811874C:
	strh r0, [r1, #0xe]
	adds r0, r5, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811875C: .4byte 0x020380BE
	thumb_func_end AnimTask_IsTargetSameSide

	thumb_func_start sub_08118760
sub_08118760: @ 0x08118760
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08118778
	ldr r1, _0811877C
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08118778: .4byte 0x020380D7
_0811877C: .4byte 0x02023EB0
	thumb_func_end sub_08118760

	thumb_func_start sub_08118780
sub_08118780: @ 0x08118780
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _081187A0
	ldr r1, _081187A4
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _081187A8
	ldr r1, _081187AC
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_081187A0: .4byte 0x020380D6
_081187A4: .4byte 0x02023EAF
_081187A8: .4byte 0x020380D7
_081187AC: .4byte 0x02023EB2
	thumb_func_end sub_08118780

	thumb_func_start sub_081187B0
sub_081187B0: @ 0x081187B0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081187C8
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	b _08118804
_081187C8:
	ldr r0, _0811880C
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r3, r3, #3
	adds r3, r3, r0
	ldr r0, _08118810
	ldr r4, [r0]
	ldr r2, _08118814
	ldrb r0, [r2]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	strh r0, [r3, #8]
	ldrb r1, [r2]
	ldr r0, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08118818
	str r0, [r3]
	ldr r1, _0811881C
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_08118804:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811880C: .4byte 0x03005B60
_08118810: .4byte 0x02024174
_08118814: .4byte 0x020380D6
_08118818: .4byte 0x08118821
_0811881C: .4byte 0x0203809E
	thumb_func_end sub_081187B0

	thumb_func_start sub_08118820
sub_08118820: @ 0x08118820
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0811886C
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r1, r0
	bne _08118864
	ldr r0, _08118870
	ldr r1, [r0]
	ldr r0, _08118874
	ldrb r3, [r0]
	ldr r0, [r1]
	lsls r3, r3, #2
	adds r3, r3, r0
	ldr r1, _08118878
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	movs r1, #1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, #0
	bl DestroyTask
_08118864:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811886C: .4byte 0x020380BE
_08118870: .4byte 0x02024174
_08118874: .4byte 0x020380D6
_08118878: .4byte 0x03005B60
	thumb_func_end sub_08118820

