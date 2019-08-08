.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start unref_sub_8170478
unref_sub_8170478: @ 0x0817025C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, _08170404
	ldrb r4, [r0]
	ldr r0, _08170408
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0817040C
	strh r1, [r0]
	ldr r1, _08170410
	movs r0, #0x48
	bl SetGpuReg
	ldr r1, _08170414
	movs r0, #0x4a
	bl SetGpuReg
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #0
	bl SetGpuRegBits
	ldr r1, _08170418
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
	movs r0, #1
	movs r1, #1
	movs r2, #1
	bl SetAnimBgAttribute
	movs r0, #1
	movs r1, #3
	movs r2, #1
	bl SetAnimBgAttribute
	ldr r0, _0817041C
	adds r4, r4, r0
	ldrb r0, [r4]
	ldr r1, _08170420
	mov sb, r1
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	add r4, sb
	ldrb r7, [r4, #6]
	ldrh r6, [r4, #0x38]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _08170424
	bl CreateInvisibleSpriteWithCallback
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, _08170424
	bl CreateInvisibleSpriteWithCallback
	mov sl, r0
	mov r2, sl
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	ldrb r1, [r4, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	movs r1, #4
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	strb r0, [r4, #5]
	lsls r5, r7, #4
	adds r5, r5, r7
	lsls r5, r5, #2
	add r5, sb
	ldrb r1, [r5, #5]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	add r1, sb
	ldrb r2, [r1, #5]
	adds r0, r3, #0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #5]
	ldr r0, [sp, #0x14]
	lsls r6, r0, #4
	adds r6, r6, r0
	lsls r6, r6, #2
	mov r1, sb
	adds r7, r6, r1
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x44
	str r3, [sp, #0x18]
	bl memcpy
	mov r2, sl
	lsls r4, r2, #4
	add r4, sl
	lsls r4, r4, #2
	adds r0, r4, #0
	add r0, sb
	mov r8, r0
	adds r1, r5, #0
	movs r2, #0x44
	bl memcpy
	ldrb r1, [r7, #1]
	ldr r3, [sp, #0x18]
	adds r0, r3, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r7, #1]
	mov r2, r8
	ldrb r0, [r2, #1]
	ands r3, r0
	orrs r3, r1
	strb r3, [r2, #1]
	movs r0, #0x1c
	add sb, r0
	add r6, sb
	ldr r1, _08170424
	str r1, [r6]
	add r4, sb
	str r1, [r4]
	mov r0, sp
	bl sub_080A63F8
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _08170428
	bl AnimLoadCompressedBgTilemap
	mov r0, sp
	ldrb r0, [r0, #9]
	ldr r1, _0817042C
	mov r2, sp
	ldrh r2, [r2, #0xa]
	bl AnimLoadCompressedBgGfx
	ldr r0, _08170430
	mov r1, sp
	ldrb r1, [r1, #8]
	lsls r1, r1, #4
	movs r2, #0x20
	bl LoadCompressedPalette
	ldr r1, _08170434
	ldrh r0, [r7, #0x20]
	rsbs r0, r0, #0
	adds r0, #0x20
	strh r0, [r1]
	ldr r1, _08170438
	ldrh r0, [r7, #0x22]
	rsbs r0, r0, #0
	subs r0, #0x20
	strh r0, [r1]
	ldr r1, _0817043C
	ldr r2, [sp, #0x10]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r0, #0xa]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #8]
	mov r2, sl
	strh r2, [r0, #0xc]
	ldr r1, _08170440
	str r1, [r0]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08170404: .4byte 0x020380D6
_08170408: .4byte 0x02022AD8
_0817040C: .4byte 0x02022ADA
_08170410: .4byte 0x00003F3F
_08170414: .4byte 0x00003F3D
_08170418: .4byte 0x00003F42
_0817041C: .4byte 0x03005AD0
_08170420: .4byte 0x020205AC
_08170424: .4byte 0x08007141
_08170428: .4byte 0x08C2EB40
_0817042C: .4byte 0x08C2EAF4
_08170430: .4byte 0x08C2DE48
_08170434: .4byte 0x02022ACC
_08170438: .4byte 0x02022ACE
_0817043C: .4byte 0x03005B60
_08170440: .4byte 0x08170445
	thumb_func_end unref_sub_8170478

	thumb_func_start sub_08170444
sub_08170444: @ 0x08170444
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0817048C
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _08170490
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r1, [r5, #0xa]
	ldrh r0, [r5, #0x22]
	adds r1, r1, r0
	movs r3, #0
	strh r1, [r5, #0x22]
	ldr r2, _08170494
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x18
	ldrh r4, [r2]
	adds r0, r0, r4
	strh r0, [r2]
	movs r0, #0xff
	ands r1, r0
	strh r1, [r5, #0x22]
	movs r1, #0x26
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _081704D4
	cmp r0, #1
	bgt _08170498
	cmp r0, #0
	beq _0817049E
	b _081705F8
	.align 2, 0
_0817048C: .4byte 0x020380D6
_08170490: .4byte 0x03005B60
_08170494: .4byte 0x02022ACE
_08170498:
	cmp r0, #2
	beq _081704EC
	b _081705F8
_0817049E:
	ldrh r0, [r5, #0x1e]
	adds r1, r0, #1
	strh r1, [r5, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _081704AE
	b _081705F8
_081704AE:
	strh r3, [r5, #0x1e]
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
	ldrsh r0, [r5, r2]
	cmp r0, #8
	beq _081704D2
	b _081705F8
_081704D2:
	b _081704E4
_081704D4:
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	beq _081704E4
	b _081705F8
_081704E4:
	ldrh r0, [r5, #0x26]
	adds r0, #1
	strh r0, [r5, #0x26]
	b _081705F8
_081704EC:
	ldrh r0, [r5, #0x1e]
	adds r1, r0, #1
	strh r1, [r5, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _081705F8
	strh r3, [r5, #0x1e]
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
	bne _081705F8
	movs r0, #0
	bl sub_080A4044
	ldr r0, _08170604
	strh r4, [r0]
	ldr r0, _08170608
	strh r4, [r0]
	ldr r4, _0817060C
	movs r0, #0x48
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x4a
	adds r1, r4, #0
	bl SetGpuReg
	bl IsContest
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08170550
	movs r0, #1
	movs r1, #3
	movs r2, #0
	bl SetAnimBgAttribute
_08170550:
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
	movs r4, #8
	ldrsh r1, [r5, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r6, _08170610
	adds r0, r0, r6
	bl DestroySprite
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl DestroySprite
	movs r0, #1
	movs r1, #1
	movs r2, #0
	bl SetAnimBgAttribute
	ldr r0, _08170614
	add r0, r8
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r2, [r1, #6]
	mov r8, r2
	ldrh r4, [r1, #0x38]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r3, [r1, #5]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r3
	movs r5, #4
	orrs r0, r5
	strb r0, [r1, #5]
	mov r0, r8
	lsls r1, r0, #4
	add r1, r8
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r3, [r1, #5]
	adds r0, r2, #0
	ands r0, r3
	orrs r0, r5
	strb r0, [r1, #5]
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r1, [r0, #5]
	ands r2, r1
	orrs r2, r5
	strb r2, [r0, #5]
	adds r0, r7, #0
	bl DestroyAnimVisualTask
_081705F8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08170604: .4byte 0x02022AD8
_08170608: .4byte 0x02022ADA
_0817060C: .4byte 0x00003F3F
_08170610: .4byte 0x020205AC
_08170614: .4byte 0x03005AD0
	thumb_func_end sub_08170444

	thumb_func_start sub_08170618
sub_08170618: @ 0x08170618
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _081706F0
	adds r2, r2, r0
	ldrb r0, [r2]
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r0, _081706F4
	adds r5, r5, r0
	ldrb r1, [r5, #6]
	mov sl, r1
	ldrh r4, [r5, #0x38]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081706F8
	bl AllocSpritePalette
	mov r2, sb
	strb r0, [r2]
	ldr r0, _081706FC
	bl AllocSpritePalette
	strb r0, [r7]
	ldrb r0, [r5, #5]
	lsrs r0, r0, #4
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	adds r3, r1, #0
	orrs r0, r3
	lsls r6, r4, #4
	adds r6, r6, r4
	lsls r6, r6, #2
	ldr r2, _081706F4
	adds r6, r6, r2
	ldrb r4, [r6, #5]
	lsrs r4, r4, #4
	lsls r4, r4, #4
	orrs r4, r3
	lsls r0, r0, #1
	ldr r1, _08170700
	mov r8, r1
	add r0, r8
	mov r2, sb
	ldrb r1, [r2]
	lsls r1, r1, #4
	adds r1, r3, r1
	movs r2, #0x20
	str r3, [sp]
	bl LoadPalette
	lsls r4, r4, #1
	add r4, r8
	ldrb r0, [r7]
	lsls r0, r0, #4
	ldr r3, [sp]
	adds r3, r3, r0
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #0x20
	bl LoadPalette
	mov r0, sb
	ldrb r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r5, #5]
	movs r3, #0xf
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	mov r2, sl
	lsls r1, r2, #4
	add r1, sl
	lsls r1, r1, #2
	ldr r0, _081706F4
	adds r1, r1, r0
	mov r0, sb
	ldrb r2, [r0]
	lsls r2, r2, #4
	ldrb r4, [r1, #5]
	adds r0, r3, #0
	ands r0, r4
	orrs r0, r2
	strb r0, [r1, #5]
	ldrb r0, [r7]
	lsls r0, r0, #4
	ldrb r1, [r6, #5]
	ands r3, r1
	orrs r3, r0
	strb r3, [r6, #5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081706F0: .4byte 0x03005AD0
_081706F4: .4byte 0x020205AC
_081706F8: .4byte 0x0000D709
_081706FC: .4byte 0x0000D70A
_08170700: .4byte 0x020373B4
	thumb_func_end sub_08170618

	thumb_func_start sub_08170704
sub_08170704: @ 0x08170704
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, sp
	adds r1, #1
	ldr r0, _0817072C
	ldrb r2, [r0]
	mov r0, sp
	bl sub_08170618
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0817072C: .4byte 0x020380D6
	thumb_func_end sub_08170704

	thumb_func_start sub_08170730
sub_08170730: @ 0x08170730
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081707B8
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _081707BC
	mov r8, r1
	lsls r5, r0, #4
	adds r5, r5, r0
	lsls r5, r5, #2
	add r5, r8
	ldrb r0, [r5, #6]
	mov sb, r0
	ldrh r6, [r5, #0x38]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _081707C0
	bl FreeSpritePaletteByTag
	ldr r0, _081707C4
	bl FreeSpritePaletteByTag
	ldr r0, _081707C8
	bl IndexOfSpritePaletteTag
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081707CC
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsls r4, r4, #4
	ldrb r2, [r5, #5]
	movs r3, #0xf
	adds r1, r3, #0
	ands r1, r2
	orrs r1, r4
	strb r1, [r5, #5]
	mov r1, sb
	lsls r2, r1, #4
	add r2, sb
	lsls r2, r2, #2
	add r2, r8
	ldrb r5, [r2, #5]
	adds r1, r3, #0
	ands r1, r5
	orrs r1, r4
	strb r1, [r2, #5]
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	add r1, r8
	lsrs r0, r0, #0x14
	ldrb r2, [r1, #5]
	ands r3, r2
	orrs r3, r0
	strb r3, [r1, #5]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081707B8: .4byte 0x03005AD0
_081707BC: .4byte 0x020205AC
_081707C0: .4byte 0x0000D709
_081707C4: .4byte 0x0000D70A
_081707C8: .4byte 0x0000D6FF
_081707CC: .4byte 0x0000D704
	thumb_func_end sub_08170730

	thumb_func_start sub_081707D0
sub_081707D0: @ 0x081707D0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081707EC
	ldrb r0, [r0]
	bl sub_08170730
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081707EC: .4byte 0x020380D6
	thumb_func_end sub_081707D0

	thumb_func_start sub_081707F0
sub_081707F0: @ 0x081707F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08170810
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _08170814
	ldrh r0, [r2]
	strh r0, [r1, #0x1c]
	ldrh r0, [r2, #2]
	strh r0, [r1, #0x1e]
	ldr r0, _08170818
	str r0, [r1]
	bx lr
	.align 2, 0
_08170810: .4byte 0x03005B60
_08170814: .4byte 0x020380BE
_08170818: .4byte 0x0817081D
	thumb_func_end sub_081707F0

	thumb_func_start sub_0817081C
sub_0817081C: @ 0x0817081C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08170868
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #8]
	adds r0, #1
	movs r6, #0
	adds r1, r0, #1
	strh r1, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x1e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _081708DC
	strh r6, [r4, #8]
	ldr r0, _0817086C
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r3, #0x1c
	ldrsh r0, [r4, r3]
	movs r1, #2
	cmp r0, #0
	bne _0817085A
	movs r1, #6
_0817085A:
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08170870
	cmp r0, #1
	beq _081708AC
	b _081708DC
	.align 2, 0
_08170868: .4byte 0x03005B60
_0817086C: .4byte 0x0000D709
_08170870:
	ldrh r0, [r4, #0xc]
	adds r0, #2
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08170882
	movs r0, #0x10
	strh r0, [r4, #0xc]
_08170882:
	lsls r0, r2, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	orrs r0, r1
	ldrb r2, [r4, #0xc]
	ldr r3, _081708A8
	movs r1, #1
	bl BlendPalette
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0x10
	bne _081708DC
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	b _081708DC
	.align 2, 0
_081708A8: .4byte 0x00007F74
_081708AC:
	ldrh r0, [r4, #0xc]
	subs r0, #2
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _081708BA
	strh r6, [r4, #0xc]
_081708BA:
	lsls r0, r2, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	orrs r0, r1
	ldrb r2, [r4, #0xc]
	ldr r3, _081708E4
	movs r1, #1
	bl BlendPalette
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _081708DC
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_081708DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081708E4: .4byte 0x00007F74
	thumb_func_end sub_0817081C

	thumb_func_start sub_081708E8
sub_081708E8: @ 0x081708E8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08170914
	ldr r0, _08170918
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r5, [r0]
	ldr r1, _0817091C
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08170936
	cmp r0, #1
	bgt _08170920
	cmp r0, #0
	beq _08170926
	b _08170988
	.align 2, 0
_08170914: .4byte 0x02023E88
_08170918: .4byte 0x020380D6
_0817091C: .4byte 0x03005B60
_08170920:
	cmp r0, #2
	beq _08170968
	b _08170988
_08170926:
	adds r0, r5, #0
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	b _0817095A
_08170936:
	ldrh r0, [r4, #0x1c]
	adds r0, #0x30
	strh r0, [r4, #0x1c]
	movs r0, #0x1c
	ldrsh r2, [r4, r0]
	adds r0, r5, #0
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	adds r0, r5, #0
	bl SetBattlerSpriteYOffsetFromYScale
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	ldr r0, _08170964
	cmp r1, r0
	ble _08170988
_0817095A:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08170988
	.align 2, 0
_08170964: .4byte 0x000002CF
_08170968:
	adds r0, r5, #0
	bl ResetSpriteRotScale
	ldr r1, _08170990
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, #0
	bl DestroyAnimVisualTask
_08170988:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08170990: .4byte 0x020205AC
	thumb_func_end sub_081708E8

	thumb_func_start sub_08170994
sub_08170994: @ 0x08170994
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _081709CC
	ldr r4, _081709D0
	ldrb r0, [r4]
	adds r1, r0, r1
	ldrb r1, [r1]
	mov sb, r1
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081709DC
	ldr r1, _081709D4
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081709D8
	b _081709EC
	.align 2, 0
_081709CC: .4byte 0x02023E88
_081709D0: .4byte 0x020380D6
_081709D4: .4byte 0x02023D12
_081709D8: .4byte 0x02024190
_081709DC:
	ldr r1, _08170A1C
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08170A20
_081709EC:
	adds r0, r0, r1
	movs r1, #0x26
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIdToBallId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, _08170A24
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r6, r0, r2
	movs r0, #8
	ldrsh r7, [r6, r0]
	cmp r7, #0
	beq _08170A28
	cmp r7, #1
	beq _08170AA8
	b _08170AD2
	.align 2, 0
_08170A1C: .4byte 0x02023D12
_08170A20: .4byte 0x020243E8
_08170A24: .4byte 0x03005B60
_08170A28:
	ldr r5, _08170AA0
	ldrb r0, [r5]
	movs r1, #0
	bl GetBattlerSpriteCoord
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r5]
	movs r1, #1
	bl GetBattlerSpriteCoord
	adds r1, r0, #0
	lsls r1, r1, #0x18
	ldr r2, _08170AA4
	mov r3, sb
	lsls r0, r3, #4
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #5]
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x1e
	adds r0, #0x43
	ldrb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	mov r0, r8
	str r0, [sp]
	adds r0, r4, #0
	bl AnimateBallOpenParticles
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x1c]
	str r7, [sp]
	str r7, [sp, #4]
	str r7, [sp, #8]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A6E74
	adds r2, r0, #0
	ldrb r1, [r5]
	movs r0, #0
	mov r3, r8
	bl LaunchBallFadeMonTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x1e]
	ldrh r0, [r6, #8]
	adds r0, #1
	strh r0, [r6, #8]
	b _08170AD2
	.align 2, 0
_08170AA0: .4byte 0x020380D6
_08170AA4: .4byte 0x020205AC
_08170AA8:
	movs r1, #0x1c
	ldrsh r0, [r6, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	cmp r0, #0
	bne _08170AD2
	movs r3, #0x1e
	ldrsh r0, [r6, r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #4]
	cmp r0, #0
	bne _08170AD2
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08170AD2:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08170994

	thumb_func_start sub_08170AE0
sub_08170AE0: @ 0x08170AE0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08170B04
	ldrh r0, [r0]
	bl ItemIdToBallId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl LoadBallGfx
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08170B04: .4byte 0x02023EAC
	thumb_func_end sub_08170AE0

	thumb_func_start sub_08170B08
sub_08170B08: @ 0x08170B08
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08170B2C
	ldrh r0, [r0]
	bl ItemIdToBallId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FreeBallGfx
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08170B2C: .4byte 0x02023EAC
	thumb_func_end sub_08170B08

	thumb_func_start AnimTask_IsBallBlockedByTrainer
AnimTask_IsBallBlockedByTrainer: @ 0x08170B30
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08170B48
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #8]
	cmp r0, #5
	bne _08170B54
	ldr r1, _08170B4C
	ldr r0, _08170B50
	b _08170B58
	.align 2, 0
_08170B48: .4byte 0x02024174
_08170B4C: .4byte 0x020380BE
_08170B50: .4byte 0x0000FFFF
_08170B54:
	ldr r1, _08170B64
	movs r0, #0
_08170B58:
	strh r0, [r1, #0xe]
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08170B64: .4byte 0x020380BE
	thumb_func_end AnimTask_IsBallBlockedByTrainer

	thumb_func_start ItemIdToBallId
ItemIdToBallId: @ 0x08170B68
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r0, #1
	cmp r0, #0xb
	bhi _08170BE0
	lsls r0, r0, #2
	ldr r1, _08170B80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08170B80: .4byte 0x08170B84
_08170B84: @ jump table
	.4byte _08170BB4 @ case 0
	.4byte _08170BB8 @ case 1
	.4byte _08170BBC @ case 2
	.4byte _08170BE0 @ case 3
	.4byte _08170BC0 @ case 4
	.4byte _08170BC4 @ case 5
	.4byte _08170BC8 @ case 6
	.4byte _08170BCC @ case 7
	.4byte _08170BD0 @ case 8
	.4byte _08170BD4 @ case 9
	.4byte _08170BD8 @ case 10
	.4byte _08170BDC @ case 11
_08170BB4:
	movs r0, #4
	b _08170BE2
_08170BB8:
	movs r0, #3
	b _08170BE2
_08170BBC:
	movs r0, #1
	b _08170BE2
_08170BC0:
	movs r0, #2
	b _08170BE2
_08170BC4:
	movs r0, #5
	b _08170BE2
_08170BC8:
	movs r0, #6
	b _08170BE2
_08170BCC:
	movs r0, #7
	b _08170BE2
_08170BD0:
	movs r0, #8
	b _08170BE2
_08170BD4:
	movs r0, #9
	b _08170BE2
_08170BD8:
	movs r0, #0xa
	b _08170BE2
_08170BDC:
	movs r0, #0xb
	b _08170BE2
_08170BE0:
	movs r0, #0
_08170BE2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ItemIdToBallId

	thumb_func_start sub_08170BE8
sub_08170BE8: @ 0x08170BE8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08170CB0
	ldrh r0, [r0]
	bl ItemIdToBallId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08170CB4
	adds r0, r0, r1
	movs r1, #0x20
	movs r2, #0x50
	movs r3, #0x1d
	bl CreateSprite
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _08170CB8
	mov sb, r1
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r6, r4, r1
	movs r0, #0x22
	strh r0, [r6, #0x2e]
	ldr r2, _08170CBC
	mov r8, r2
	ldrb r0, [r2]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0x10
	strh r0, [r6, #0x32]
	mov r0, sb
	adds r0, #0x1c
	adds r4, r4, r0
	ldr r0, _08170CC0
	str r0, [r4]
	ldr r0, _08170CC4
	ldr r0, [r0]
	ldr r3, [r0, #8]
	ldr r1, _08170CC8
	mov r2, r8
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	lsls r1, r1, #1
	ldrb r2, [r3, #9]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	ldr r1, _08170CCC
	mov r2, sl
	lsls r0, r2, #2
	add r0, sl
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #8]
	ldr r1, _08170CD0
	str r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08170CB0: .4byte 0x02023EAC
_08170CB4: .4byte 0x082FCF94
_08170CB8: .4byte 0x020205AC
_08170CBC: .4byte 0x020380D7
_08170CC0: .4byte 0x08170EE9
_08170CC4: .4byte 0x02024174
_08170CC8: .4byte 0x02023E88
_08170CCC: .4byte 0x03005B60
_08170CD0: .4byte 0x08170CD5
	thumb_func_end sub_08170BE8

	thumb_func_start sub_08170CD4
sub_08170CD4: @ 0x08170CD4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _08170D04
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	ldr r2, _08170D08
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x2e]
	ldr r0, _08170D0C
	cmp r1, r0
	bne _08170CFE
	adds r0, r3, #0
	bl DestroyAnimVisualTask
_08170CFE:
	pop {r0}
	bx r0
	.align 2, 0
_08170D04: .4byte 0x03005B60
_08170D08: .4byte 0x020205AC
_08170D0C: .4byte 0x0000FFFF
	thumb_func_end sub_08170CD4

	thumb_func_start sub_08170D10
sub_08170D10: @ 0x08170D10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08170D30
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08170D34
	movs r6, #0x20
	movs r5, #0xb
	b _08170D38
	.align 2, 0
_08170D30: .4byte 0x02022C90
_08170D34:
	movs r6, #0x17
	movs r5, #5
_08170D38:
	ldr r0, _08170DF0
	ldrh r0, [r0]
	bl ItemIdToBallId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _08170DF4
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x20
	movs r2, #0x50
	orrs r5, r2
	adds r2, r5, #0
	bl CreateSprite
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08170DF8
	mov sb, r0
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r6, r4, r0
	movs r0, #0x22
	strh r0, [r6, #0x2e]
	ldr r1, _08170DFC
	mov r8, r1
	ldrb r0, [r1]
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6, #0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #0x10
	strh r0, [r6, #0x32]
	movs r0, #0x1c
	add sb, r0
	add r4, sb
	ldr r0, _08170E00
	str r0, [r4]
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r1, _08170E04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldr r1, _08170E08
	str r1, [r0]
	ldr r1, _08170E0C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0, #8]
	ldr r1, _08170E10
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08170DF0: .4byte 0x02023EAC
_08170DF4: .4byte 0x082FCF94
_08170DF8: .4byte 0x020205AC
_08170DFC: .4byte 0x020380D7
_08170E00: .4byte 0x08007141
_08170E04: .4byte 0x02023E88
_08170E08: .4byte 0x08039AC9
_08170E0C: .4byte 0x03005B60
_08170E10: .4byte 0x08170E15
	thumb_func_end sub_08170D10

	thumb_func_start sub_08170E14
sub_08170E14: @ 0x08170E14
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08170E74
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r1, _08170E78
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08170E6E
	movs r0, #0x3d
	movs r1, #0
	bl PlaySE12WithPanning
	ldr r0, _08170E7C
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r0, #8
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08170E80
	str r1, [r0]
	ldr r0, _08170E84
	movs r1, #0xa
	bl CreateTask
	ldr r0, _08170E88
	str r0, [r4]
_08170E6E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08170E74: .4byte 0x020205AC
_08170E78: .4byte 0x02023E88
_08170E7C: .4byte 0x03005B60
_08170E80: .4byte 0x08170EE9
_08170E84: .4byte 0x08170E8D
_08170E88: .4byte 0x08170CD5
	thumb_func_end sub_08170E14

	thumb_func_start sub_08170E8C
sub_08170E8C: @ 0x08170E8C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08170EE0
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r4, _08170EE4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _08170ED8
	movs r0, #0
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #0
	bl StartSpriteAnim
	adds r0, r5, #0
	bl DestroyTask
_08170ED8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08170EE0: .4byte 0x020205AC
_08170EE4: .4byte 0x02023E88
	thumb_func_end sub_08170E8C

	thumb_func_start sub_08170EE8
sub_08170EE8: @ 0x08170EE8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	ldrh r2, [r4, #0x32]
	ldrh r0, [r4, #0x20]
	strh r0, [r4, #0x30]
	strh r1, [r4, #0x32]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x34]
	strh r2, [r4, #0x36]
	ldr r0, _08170F10
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldr r0, _08170F14
	str r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08170F10: .4byte 0x0000FFD8
_08170F14: .4byte 0x08170F19
	thumb_func_end sub_08170EE8

	thumb_func_start sub_08170F18
sub_08170F18: @ 0x08170F18
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08170FB6
	ldr r0, _08170F3C
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #8]
	cmp r0, #5
	bne _08170F44
	ldr r0, _08170F40
	str r0, [r4, #0x1c]
	b _08170FB6
	.align 2, 0
_08170F3C: .4byte 0x02024174
_08170F40: .4byte 0x08171A91
_08170F44:
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAnim
	ldrh r0, [r4, #0x24]
	ldrh r1, [r4, #0x20]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x26]
	ldrh r2, [r4, #0x22]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	strh r1, [r4, #0x24]
	strh r1, [r4, #0x26]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r2, #0
	adds r0, r4, #0
	adds r0, #0x3c
_08170F6C:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _08170F6C
	movs r0, #0
	strh r0, [r4, #0x38]
	ldr r0, _08170FC0
	str r0, [r4, #0x1c]
	ldr r0, _08170FC4
	ldrh r0, [r0]
	bl ItemIdToBallId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xb
	bgt _08170FB6
	cmp r5, #0
	blt _08170FB6
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x22]
	subs r1, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r5, [sp]
	movs r2, #1
	movs r3, #0x1c
	bl AnimateBallOpenParticles
	ldr r0, _08170FC8
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0xe
	adds r3, r5, #0
	bl LaunchBallFadeMonTask
_08170FB6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08170FC0: .4byte 0x08170FCD
_08170FC4: .4byte 0x02023EAC
_08170FC8: .4byte 0x020380D7
	thumb_func_end sub_08170F18

	thumb_func_start sub_08170FCC
sub_08170FCC: @ 0x08170FCC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _08171008
	ldr r0, _08171010
	movs r1, #0x32
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, #0x38]
	ldr r0, _08171014
	str r0, [r4, #0x1c]
	ldr r2, _08171018
	ldr r1, _0817101C
	ldr r0, _08171020
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x30]
_08171008:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08171010: .4byte 0x080A8A41
_08171014: .4byte 0x08171025
_08171018: .4byte 0x020205AC
_0817101C: .4byte 0x02023E88
_08171020: .4byte 0x020380D7
	thumb_func_end sub_08170FCC

	thumb_func_start sub_08171024
sub_08171024: @ 0x08171024
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, _08171068
	ldr r0, _0817106C
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldrh r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08171070
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	bne _08171056
	movs r0, #0x3c
	bl PlaySE
_08171056:
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _081710CC
	cmp r0, #1
	bgt _08171074
	cmp r0, #0
	beq _0817107A
	b _08171138
	.align 2, 0
_08171068: .4byte 0x02023E88
_0817106C: .4byte 0x020380D7
_08171070: .4byte 0x03005B60
_08171074:
	cmp r0, #2
	beq _08171110
	b _08171138
_0817107A:
	adds r0, r4, #0
	movs r1, #0
	bl PrepareBattlerSpriteForRotScale
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1c]
	ldr r1, _081710BC
	movs r0, #0x1c
	str r0, [r1]
	ldr r2, _081710C0
	ldr r1, _081710C4
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	ldrh r0, [r0, #0x22]
	adds r1, r1, r0
	ldrh r0, [r7, #0x26]
	ldrh r7, [r7, #0x22]
	adds r0, r0, r7
	subs r1, r1, r0
	strh r1, [r2]
	ldr r4, _081710C8
	ldrh r0, [r2]
	lsls r0, r0, #8
	movs r1, #0x1c
	bl __udivsi3
	strh r0, [r4]
	strh r0, [r5, #0xc]
	b _0817112A
	.align 2, 0
_081710BC: .4byte 0x0300601C
_081710C0: .4byte 0x03006024
_081710C4: .4byte 0x020205AC
_081710C8: .4byte 0x03006020
_081710CC:
	ldrh r0, [r5, #0x1c]
	adds r0, #0x20
	strh r0, [r5, #0x1c]
	movs r0, #0x1c
	ldrsh r2, [r5, r0]
	adds r0, r4, #0
	adds r1, r2, #0
	movs r3, #0
	bl SetSpriteRotScale
	ldrh r0, [r5, #0xc]
	ldrh r1, [r5, #0xe]
	adds r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _08171108
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0xe
	ldrsh r0, [r5, r2]
	rsbs r0, r0, #0
	asrs r0, r0, #8
	strh r0, [r1, #0x26]
	movs r0, #0x1c
	ldrsh r1, [r5, r0]
	ldr r0, _0817110C
	cmp r1, r0
	ble _08171160
	b _0817112A
	.align 2, 0
_08171108: .4byte 0x020205AC
_0817110C: .4byte 0x0000047F
_08171110:
	adds r0, r4, #0
	bl ResetSpriteRotScale
	ldr r1, _08171134
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_0817112A:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	b _08171160
	.align 2, 0
_08171134: .4byte 0x020205AC
_08171138:
	ldr r0, _08171168
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #0xa
	ble _08171160
	adds r0, r6, #0
	bl DestroyTask
	adds r0, r7, #0
	movs r1, #2
	bl StartSpriteAnim
	movs r0, #0
	strh r0, [r7, #0x38]
	ldr r0, _0817116C
	str r0, [r7, #0x1c]
_08171160:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08171168: .4byte 0x03005B60
_0817116C: .4byte 0x08171171
	thumb_func_end sub_08171024

	thumb_func_start sub_08171170
sub_08171170: @ 0x08171170
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081711AA
	movs r1, #0
	strh r1, [r4, #0x34]
	movs r0, #0x28
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
	movs r0, #0
	movs r1, #0x28
	bl Cos
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r0, #0
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldr r0, _081711B0
	str r0, [r4, #0x1c]
_081711AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081711B0: .4byte 0x081711B5
	thumb_func_end sub_08171170

	thumb_func_start sub_081711B4
sub_081711B4: @ 0x081711B4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	ldrh r0, [r4, #0x34]
	movs r1, #0xff
	ands r1, r0
	cmp r1, #0
	beq _081711CA
	cmp r1, #1
	beq _0817123E
	b _0817126A
_081711CA:
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x38]
	adds r1, #4
	ldrh r2, [r4, #0x34]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x3f
	ble _0817126A
	ldrh r0, [r4, #0x36]
	subs r0, #0xa
	strh r0, [r4, #0x36]
	ldr r1, _08171214
	adds r0, r2, r1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08171206
	movs r5, #1
_08171206:
	cmp r0, #2
	beq _08171226
	cmp r0, #2
	bgt _08171218
	cmp r0, #1
	beq _0817121E
	b _08171236
	.align 2, 0
_08171214: .4byte 0x00000101
_08171218:
	cmp r0, #3
	beq _0817122E
	b _08171236
_0817121E:
	movs r0, #0x38
	bl PlaySE
	b _0817126A
_08171226:
	movs r0, #0x39
	bl PlaySE
	b _0817126A
_0817122E:
	movs r0, #0x3a
	bl PlaySE
	b _0817126A
_08171236:
	movs r0, #0x3b
	bl PlaySE
	b _0817126A
_0817123E:
	movs r2, #0x38
	ldrsh r0, [r4, r2]
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	bl Cos
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x38]
	subs r1, #4
	ldrh r2, [r4, #0x34]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	subs r1, r1, r0
	strh r1, [r4, #0x38]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _0817126A
	strh r5, [r4, #0x38]
	ldr r0, _08171298
	ands r0, r2
	strh r0, [r4, #0x34]
_0817126A:
	cmp r5, #0
	beq _081712AE
	movs r5, #0
	strh r5, [r4, #0x34]
	movs r0, #0x40
	movs r1, #0x28
	bl Cos
	ldrh r1, [r4, #0x22]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	strh r5, [r4, #0x26]
	ldr r0, _0817129C
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _081712A4
	strh r5, [r4, #0x38]
	ldr r0, _081712A0
	str r0, [r4, #0x1c]
	b _081712AE
	.align 2, 0
_08171298: .4byte 0xFFFFFF00
_0817129C: .4byte 0x02024174
_081712A0: .4byte 0x08171599
_081712A4:
	ldr r0, _081712B4
	str r0, [r4, #0x1c]
	movs r0, #1
	strh r0, [r4, #0x36]
	strh r5, [r4, #0x38]
_081712AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081712B4: .4byte 0x081712B9
	thumb_func_end sub_081711B4

	thumb_func_start sub_081712B8
sub_081712B8: @ 0x081712B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _081712F4
	strh r5, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	ldr r0, _081712FC
	ldr r0, [r0]
	ldr r0, [r0, #8]
	strh r5, [r0, #0xc]
	ldr r0, _08171300
	str r0, [r4, #0x1c]
	movs r0, #0x17
	bl PlaySE
_081712F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081712FC: .4byte 0x02024174
_08171300: .4byte 0x08171305
	thumb_func_end sub_081712B8

	thumb_func_start sub_08171304
sub_08171304: @ 0x08171304
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	movs r1, #0xff
	ands r1, r0
	cmp r1, #6
	bls _08171314
	b _0817154C
_08171314:
	lsls r0, r1, #2
	ldr r1, _08171320
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08171320: .4byte 0x08171324
_08171324: @ jump table
	.4byte _08171340 @ case 0
	.4byte _08171392 @ case 1
	.4byte _081713D8 @ case 2
	.4byte _08171438 @ case 3
	.4byte _08171488 @ case 4
	.4byte _081714EC @ case 5
	.4byte _0817154C @ case 6
_08171340:
	ldr r1, _08171364
	ldr r5, [r1]
	ldr r2, [r5, #8]
	ldrh r3, [r2, #0xc]
	movs r6, #0xc
	ldrsh r0, [r2, r6]
	adds r6, r1, #0
	cmp r0, #0xff
	ble _08171368
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	ldr r1, [r5, #8]
	ldrb r0, [r1, #0xc]
	strh r0, [r1, #0xc]
	b _0817136E
	.align 2, 0
_08171364: .4byte 0x02024174
_08171368:
	adds r0, r3, #0
	adds r0, #0xb0
	strh r0, [r2, #0xc]
_0817136E:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x38]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x38]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bhi _08171390
	b _08171592
_08171390:
	b _08171428
_08171392:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08171444
	movs r0, #0
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	movs r6, #0x36
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bge _081713CE
	adds r0, r4, #0
	movs r1, #2
	bl ChangeSpriteAffineAnim
	b _08171592
_081713CE:
	adds r0, r4, #0
	movs r1, #1
	bl ChangeSpriteAffineAnim
	b _08171592
_081713D8:
	ldr r1, _081713FC
	ldr r5, [r1]
	ldr r2, [r5, #8]
	ldrh r3, [r2, #0xc]
	movs r6, #0xc
	ldrsh r0, [r2, r6]
	adds r6, r1, #0
	cmp r0, #0xff
	ble _08171400
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	ldr r1, [r5, #8]
	ldrb r0, [r1, #0xc]
	strh r0, [r1, #0xc]
	b _08171406
	.align 2, 0
_081713FC: .4byte 0x02024174
_08171400:
	adds r0, r3, #0
	adds r0, #0xb0
	strh r0, [r2, #0xc]
_08171406:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x38]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x38]
	adds r0, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x18
	bhi _08171428
	b _08171592
_08171428:
	ldr r0, [r6]
	ldr r0, [r0, #8]
	strh r3, [r0, #0xc]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	strh r3, [r4, #0x38]
	b _08171592
_08171438:
	ldrh r0, [r4, #0x38]
	adds r1, r0, #1
	strh r1, [r4, #0x38]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08171452
_08171444:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	b _08171592
_08171452:
	movs r0, #0
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	movs r6, #0x36
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bge _08171480
	adds r0, r4, #0
	movs r1, #2
	bl ChangeSpriteAffineAnim
	b _08171488
_08171480:
	adds r0, r4, #0
	movs r1, #1
	bl ChangeSpriteAffineAnim
_08171488:
	ldr r1, _081714AC
	ldr r5, [r1]
	ldr r2, [r5, #8]
	ldrh r3, [r2, #0xc]
	movs r6, #0xc
	ldrsh r0, [r2, r6]
	adds r6, r1, #0
	cmp r0, #0xff
	ble _081714B0
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	ldr r1, [r5, #8]
	ldrb r0, [r1, #0xc]
	strh r0, [r1, #0xc]
	b _081714B6
	.align 2, 0
_081714AC: .4byte 0x02024174
_081714B0:
	adds r0, r3, #0
	adds r0, #0xb0
	strh r0, [r2, #0xc]
_081714B6:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x38]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #0x38]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _08171592
	ldr r0, [r6]
	ldr r0, [r0, #8]
	strh r3, [r0, #0xc]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	strh r3, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	rsbs r0, r0, #0
	strh r0, [r4, #0x36]
	b _08171592
_081714EC:
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r6, #0
	ldrh r1, [r4, #0x34]
	adds r0, r0, r1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x18
	ldr r0, _0817151C
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #8]
	cmp r1, r0
	bne _08171524
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08171520
	str r0, [r4, #0x1c]
	b _08171592
	.align 2, 0
_0817151C: .4byte 0x02024174
_08171520: .4byte 0x08171599
_08171524:
	cmp r0, #4
	bne _08171538
	cmp r1, #3
	bne _08171538
	ldr r0, _08171534
	str r0, [r4, #0x1c]
	b _0817153E
	.align 2, 0
_08171534: .4byte 0x081715BD
_08171538:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
_0817153E:
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	b _08171592
_0817154C:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _08171592
	movs r0, #0
	strh r0, [r4, #0x38]
	ldrh r1, [r4, #0x34]
	ldr r0, _08171580
	ands r0, r1
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #3
	bl StartSpriteAffineAnim
	movs r6, #0x36
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bge _08171584
	adds r0, r4, #0
	movs r1, #2
	bl StartSpriteAffineAnim
	b _0817158C
	.align 2, 0
_08171580: .4byte 0xFFFFFF00
_08171584:
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
_0817158C:
	movs r0, #0x17
	bl PlaySE
_08171592:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08171304

	thumb_func_start sub_08171598
sub_08171598: @ 0x08171598
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x38]
	adds r0, #1
	strh r0, [r1, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _081715B2
	movs r0, #0
	strh r0, [r1, #0x38]
	ldr r0, _081715B8
	str r0, [r1, #0x1c]
_081715B2:
	pop {r0}
	bx r0
	.align 2, 0
_081715B8: .4byte 0x081718C9
	thumb_func_end sub_08171598

	thumb_func_start sub_081715BC
sub_081715BC: @ 0x081715BC
	adds r3, r0, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _081715D8
	str r1, [r0, #0x1c]
	movs r1, #0
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	strh r1, [r0, #0x38]
	bx lr
	.align 2, 0
_081715D8: .4byte 0x081715DD
	thumb_func_end sub_081715BC

	thumb_func_start sub_081715DC
sub_081715DC: @ 0x081715DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r7, _0817161C
	ldrh r0, [r6, #0x36]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x36]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x28
	bne _08171620
	movs r0, #0xfe
	bl PlaySE
	ldrb r1, [r6, #5]
	lsrs r1, r1, #4
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r0, r1
	movs r1, #6
	movs r2, #0
	bl BlendPalettes
	adds r0, r6, #0
	bl sub_081717D0
	b _081716A0
	.align 2, 0
_0817161C: .4byte 0x020380D7
_08171620:
	cmp r1, #0x3c
	bne _0817163E
	ldrb r1, [r6, #5]
	lsrs r1, r1, #4
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r0, r1
	mov r1, r8
	str r1, [sp]
	movs r1, #2
	movs r2, #6
	movs r3, #0
	bl BeginNormalPaletteFade
	b _081716A0
_0817163E:
	cmp r1, #0x5f
	bne _08171664
	ldr r0, _0817165C
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bl UpdateOamPriorityInAllHealthboxes
	bl m4aMPlayAllStop
	ldr r0, _08171660
	bl PlaySE
	b _081716A0
	.align 2, 0
_0817165C: .4byte 0x0202415D
_08171660: .4byte 0x00000213
_08171664:
	ldr r0, _081716AC
	cmp r1, r0
	bne _081716A0
	ldr r5, _081716B0
	ldr r4, _081716B4
	ldrb r0, [r7]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r0, [r7]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	mov r0, r8
	strh r0, [r6, #0x2e]
	ldr r0, _081716B8
	str r0, [r6, #0x1c]
_081716A0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081716AC: .4byte 0x0000013B
_081716B0: .4byte 0x020205AC
_081716B4: .4byte 0x02023E88
_081716B8: .4byte 0x081716BD
	thumb_func_end sub_081715DC

	thumb_func_start sub_081716BC
sub_081716BC: @ 0x081716BC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08171728
	cmp r0, #1
	bgt _081716D4
	cmp r0, #0
	beq _081716DA
	b _0817176E
_081716D4:
	cmp r0, #2
	beq _0817175A
	b _0817176E
_081716DA:
	strh r0, [r4, #0x30]
	strh r0, [r4, #0x32]
	ldrb r1, [r4, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4, #1]
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #2]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0x10
	movs r1, #1
	lsls r1, r0
	ldr r0, _08171724
	str r0, [sp]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	b _08171766
	.align 2, 0
_08171724: .4byte 0x00007FFF
_08171728:
	ldrh r0, [r4, #0x30]
	adds r1, r0, #1
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08171794
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r2, [r4, #0x32]
	adds r2, #1
	strh r2, [r4, #0x32]
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08171794
	b _08171766
_0817175A:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_08171766:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	b _08171794
_0817176E:
	ldr r0, _0817179C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08171794
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	strh r5, [r4, #0x2e]
	ldr r0, _081717A0
	str r0, [r4, #0x1c]
_08171794:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817179C: .4byte 0x02037C74
_081717A0: .4byte 0x081717A5
	thumb_func_end sub_081716BC

	thumb_func_start sub_081717A4
sub_081717A4: @ 0x081717A4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _081717BC
	ldr r0, _081717B8
	strh r0, [r4, #0x2e]
	b _081717C8
	.align 2, 0
_081717B8: .4byte 0x0000FFFF
_081717BC:
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
_081717C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081717A4

	thumb_func_start sub_081717D0
sub_081717D0: @ 0x081717D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x43
	ldrb r0, [r1]
	cmp r0, #0
	beq _081717F0
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	b _081717F8
_081717F0:
	movs r0, #0
	mov r8, r0
	movs r0, #1
	strb r0, [r1]
_081717F8:
	movs r0, #4
	bl sub_08171B44
	movs r7, #0
	ldr r2, _0817187C
	mov sb, r2
	movs r0, #0x1c
	add r0, sb
	mov sl, r0
_0817180A:
	movs r2, #0x20
	ldrsh r1, [r6, r2]
	movs r0, #0x22
	ldrsh r2, [r6, r0]
	ldr r0, _08171880
	mov r3, r8
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _08171866
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	mov r2, sb
	adds r5, r4, r2
	movs r0, #0x18
	strh r0, [r5, #0x2e]
	ldr r0, _08171884
	lsls r1, r7, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r2, [r6, #0x20]
	adds r0, r0, r2
	strh r0, [r5, #0x32]
	movs r0, #1
	ldrsb r0, [r1, r0]
	ldrh r2, [r6, #0x22]
	adds r0, r0, r2
	strh r0, [r5, #0x36]
	movs r0, #2
	ldrsb r0, [r1, r0]
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	bl InitAnimArcTranslation
	add r4, sl
	ldr r0, _08171888
	str r0, [r4]
	ldr r0, _0817188C
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl StartSpriteAnim
_08171866:
	adds r7, #1
	cmp r7, #2
	bls _0817180A
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817187C: .4byte 0x020205AC
_08171880: .4byte 0x085C630C
_08171884: .4byte 0x085C6144
_08171888: .4byte 0x08171891
_0817188C: .4byte 0x085C6270
	thumb_func_end sub_081717D0

	thumb_func_start sub_08171890
sub_08171890: @ 0x08171890
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsrs r1, r2, #2
	movs r0, #1
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081718C0
	adds r0, r4, #0
	bl DestroySprite
_081718C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08171890

	thumb_func_start sub_081718C8
sub_081718C8: @ 0x081718C8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	bl StartSpriteAnim
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	ldr r0, _0817197C
	str r0, [r4, #0x1c]
	ldr r0, _08171980
	ldrh r0, [r0]
	bl ItemIdToBallId
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xb
	bgt _0817191A
	cmp r5, #0
	blt _0817191A
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x22]
	subs r1, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r5, [sp]
	movs r2, #1
	movs r3, #0x1c
	bl AnimateBallOpenParticles
	ldr r0, _08171984
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0xe
	adds r3, r5, #0
	bl LaunchBallFadeMonTask
_0817191A:
	ldr r6, _08171988
	ldr r5, _0817198C
	ldr r4, _08171984
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r1, #5
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	bl StartSpriteAffineAnim
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	bl AnimateSprite
	ldrb r0, [r4]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #0x80
	lsls r1, r1, #5
	strh r1, [r0, #0x30]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0817197C: .4byte 0x08171991
_08171980: .4byte 0x02023EAC
_08171984: .4byte 0x020380D7
_08171988: .4byte 0x020205AC
_0817198C: .4byte 0x02023E88
	thumb_func_end sub_081718C8

	thumb_func_start sub_08171990
sub_08171990: @ 0x08171990
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _081719AE
	adds r2, r7, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_081719AE:
	ldr r4, _081719DC
	ldr r3, _081719E0
	ldr r2, _081719E4
	ldrb r0, [r2]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _081719E8
	adds r0, r1, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	movs r5, #1
	b _08171A08
	.align 2, 0
_081719DC: .4byte 0x020205AC
_081719E0: .4byte 0x02023E88
_081719E4: .4byte 0x020380D7
_081719E8:
	ldr r6, _08171A74
	adds r0, r6, #0
	ldrh r6, [r1, #0x30]
	adds r0, r0, r6
	strh r0, [r1, #0x30]
	ldrb r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #0x26]
_08171A08:
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08171A6E
	cmp r5, #0
	beq _08171A6E
	ldr r4, _08171A78
	ldr r3, _08171A7C
	ldr r2, _08171A80
	ldrb r0, [r2]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r6, #0
	movs r5, #0
	strh r5, [r0, #0x26]
	ldrb r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	ldr r0, _08171A84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #9]
	lsls r1, r1, #0x1e
	adds r2, #0x3e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	strh r5, [r7, #0x2e]
	ldr r0, _08171A88
	str r0, [r7, #0x1c]
	ldr r0, _08171A8C
	strb r6, [r0]
	movs r0, #1
	bl UpdateOamPriorityInAllHealthboxes
_08171A6E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08171A74: .4byte 0xFFFFFEE0
_08171A78: .4byte 0x020205AC
_08171A7C: .4byte 0x02023E88
_08171A80: .4byte 0x020380D7
_08171A84: .4byte 0x02024174
_08171A88: .4byte 0x081717A5
_08171A8C: .4byte 0x0202415D
	thumb_func_end sub_08171990

	thumb_func_start sub_08171A90
sub_08171A90: @ 0x08171A90
	push {r4, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x24]
	ldrh r1, [r2, #0x20]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r2, #0x20]
	ldrh r0, [r2, #0x26]
	ldrh r3, [r2, #0x22]
	adds r0, r0, r3
	strh r0, [r2, #0x22]
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r4, _08171AC8
	movs r3, #0
	movs r1, #5
	adds r0, r2, #0
	adds r0, #0x38
_08171AB4:
	strh r3, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08171AB4
	str r4, [r2, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08171AC8: .4byte 0x08171ACD
	thumb_func_end sub_08171A90

	thumb_func_start sub_08171ACC
sub_08171ACC: @ 0x08171ACC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r1, [r4, #0x2e]
	adds r2, r2, r1
	movs r0, #0xd0
	lsls r0, r0, #3
	adds r3, r0, #0
	ldrh r1, [r4, #0x30]
	adds r3, r3, r1
	lsls r1, r3, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4, #0x24]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r4, #0x26]
	movs r0, #0xff
	ands r2, r0
	strh r2, [r4, #0x2e]
	ands r3, r0
	strh r3, [r4, #0x30]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	movs r2, #0x26
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	cmp r0, #0xa0
	bgt _08171B22
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r1, #8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08171B36
_08171B22:
	movs r0, #0
	strh r0, [r4, #0x2e]
	ldr r0, _08171B3C
	str r0, [r4, #0x1c]
	ldr r1, _08171B40
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	bl UpdateOamPriorityInAllHealthboxes
_08171B36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08171B3C: .4byte 0x081717A5
_08171B40: .4byte 0x0202415D
	thumb_func_end sub_08171ACC

	thumb_func_start sub_08171B44
sub_08171B44: @ 0x08171B44
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	ldr r1, _08171B70
	lsrs r5, r0, #0x15
	adds r4, r5, r1
	ldrh r0, [r4, #6]
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	ldr r1, _08171B74
	cmp r0, r1
	bne _08171B6A
	adds r0, r4, #0
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _08171B78
	adds r0, r5, r0
	bl LoadCompressedSpritePaletteUsingHeap
_08171B6A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08171B70: .4byte 0x085C6150
_08171B74: .4byte 0xFFFF0000
_08171B78: .4byte 0x085C61B0
	thumb_func_end sub_08171B44

	thumb_func_start AnimateBallOpenParticles
AnimateBallOpenParticles: @ 0x08171B7C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r5, [sp, #0x1c]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_08171B44
	ldr r1, _08171BFC
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #5
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08171C00
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #0xa]
	mov r1, r8
	strh r1, [r0, #0xc]
	mov r1, sb
	strh r1, [r0, #0xe]
	mov r1, sl
	strh r1, [r0, #0x10]
	strh r5, [r0, #0x26]
	movs r0, #0xf
	bl PlaySE
	adds r0, r4, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08171BFC: .4byte 0x085C627C
_08171C00: .4byte 0x03005B60
	thumb_func_end AnimateBallOpenParticles

	thumb_func_start sub_08171C04
sub_08171C04: @ 0x08171C04
	push {lr}
	ldr r0, _08171C28
	ldr r1, _08171C2C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08171C22
	ldr r0, _08171C30
	ldr r0, [r0]
	ldr r1, [r0, #8]
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
_08171C22:
	pop {r0}
	bx r0
	.align 2, 0
_08171C28: .4byte 0x03002360
_08171C2C: .4byte 0x00000439
_08171C30: .4byte 0x02024174
	thumb_func_end sub_08171C04

	thumb_func_start PokeBallOpenParticleAnimation
PokeBallOpenParticleAnimation: @ 0x08171C34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _08171D10
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r6, r0, r1
	ldrh r0, [r6, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r2, #8
	ldrsh r0, [r6, r2]
	adds r2, r1, #0
	cmp r0, #0xf
	bgt _08171D2C
	ldrb r1, [r6, #0xa]
	ldrb r2, [r6, #0xc]
	ldrb r4, [r6, #0xe]
	mov sb, r4
	ldrb r3, [r6, #0x10]
	ldr r4, [sp]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r4, _08171D14
	adds r0, r0, r4
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0x40
	beq _08171CD0
	bl sub_08171C04
	mov r0, sl
	lsls r4, r0, #4
	add r4, sl
	lsls r4, r4, #2
	ldr r5, _08171D18
	adds r7, r4, r5
	ldr r0, _08171D1C
	ldr r1, [sp]
	adds r0, r1, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	bl StartSpriteAnim
	adds r5, #0x1c
	adds r4, r4, r5
	ldr r0, _08171D20
	str r0, [r4]
	movs r0, #3
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #2
	ldrb r1, [r7, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, #5]
	ldrb r0, [r6, #8]
	cmp r0, #7
	bls _08171CCC
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08171CCC:
	lsls r0, r0, #5
	strh r0, [r7, #0x2e]
_08171CD0:
	ldr r0, _08171D10
	mov r4, r8
	lsls r1, r4, #2
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #8
	ldrsh r1, [r1, r2]
	adds r2, r0, #0
	cmp r1, #0xf
	bne _08171D2C
	ldr r0, _08171D24
	ldr r4, _08171D28
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08171D06
	ldr r0, _08171D18
	mov r2, sl
	lsls r1, r2, #4
	add r1, sl
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_08171D06:
	mov r0, r8
	bl DestroyTask
	b _08171D3C
	.align 2, 0
_08171D10: .4byte 0x03005B60
_08171D14: .4byte 0x085C62AC
_08171D18: .4byte 0x020205AC
_08171D1C: .4byte 0x085C6270
_08171D20: .4byte 0x08171D4D
_08171D24: .4byte 0x03002360
_08171D28: .4byte 0x00000439
_08171D2C:
	mov r4, r8
	lsls r0, r4, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
_08171D3C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end PokeBallOpenParticleAnimation

	thumb_func_start PokeBallOpenParticleAnimation_Step1
PokeBallOpenParticleAnimation_Step1: @ 0x08171D4C
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x30]
	movs r3, #0x30
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08171D64
	ldr r0, _08171D60
	str r0, [r1, #0x1c]
	b _08171D68
	.align 2, 0
_08171D60: .4byte 0x08171D6D
_08171D64:
	subs r0, r2, #1
	strh r0, [r1, #0x30]
_08171D68:
	pop {r0}
	bx r0
	thumb_func_end PokeBallOpenParticleAnimation_Step1

	thumb_func_start PokeBallOpenParticleAnimation_Step2
PokeBallOpenParticleAnimation_Step2: @ 0x08171D6C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #2
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	bne _08171DA0
	adds r0, r4, #0
	bl DestroyBallOpenAnimationParticle
_08171DA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PokeBallOpenParticleAnimation_Step2

	thumb_func_start TimerBallOpenParticleAnimation
TimerBallOpenParticleAnimation: @ 0x08171DA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08171E8C
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrb r3, [r1, #0xa]
	str r3, [sp]
	ldrb r0, [r1, #0xc]
	str r0, [sp, #4]
	ldrb r2, [r1, #0xe]
	str r2, [sp, #8]
	ldrb r1, [r1, #0x10]
	str r1, [sp, #0xc]
	movs r7, #0
	ldr r3, _08171E90
	mov sl, r3
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #3
	str r0, [sp, #0x10]
_08171DEE:
	ldr r0, _08171E94
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08171E4E
	bl sub_08171C04
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r3, sl
	adds r5, r4, r3
	ldr r0, _08171E98
	add r0, r8
	ldrb r1, [r0]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r0, _08171E9C
	adds r4, r4, r0
	ldr r0, _08171EA0
	str r0, [r4]
	movs r0, #3
	ldr r2, [sp, #8]
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r5, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	lsls r0, r7, #5
	strh r0, [r5, #0x2e]
	movs r0, #0xa
	strh r0, [r5, #0x36]
	movs r0, #2
	strh r0, [r5, #0x38]
	movs r0, #1
	strh r0, [r5, #0x3a]
_08171E4E:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _08171DEE
	ldr r0, _08171EA4
	ldr r1, _08171EA8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08171E76
	ldr r0, _08171E90
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_08171E76:
	mov r0, sb
	bl DestroyTask
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08171E8C: .4byte 0x03005B60
_08171E90: .4byte 0x020205AC
_08171E94: .4byte 0x085C62AC
_08171E98: .4byte 0x085C6270
_08171E9C: .4byte 0x020205C8
_08171EA0: .4byte 0x081722ED
_08171EA4: .4byte 0x03002360
_08171EA8: .4byte 0x00000439
	thumb_func_end TimerBallOpenParticleAnimation

	thumb_func_start DiveBallOpenParticleAnimation
DiveBallOpenParticleAnimation: @ 0x08171EAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08171F90
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrb r3, [r1, #0xa]
	str r3, [sp]
	ldrb r0, [r1, #0xc]
	str r0, [sp, #4]
	ldrb r2, [r1, #0xe]
	str r2, [sp, #8]
	ldrb r1, [r1, #0x10]
	str r1, [sp, #0xc]
	movs r7, #0
	ldr r3, _08171F94
	mov sl, r3
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #3
	str r0, [sp, #0x10]
_08171EF2:
	ldr r0, _08171F98
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08171F52
	bl sub_08171C04
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r3, sl
	adds r5, r4, r3
	ldr r0, _08171F9C
	add r0, r8
	ldrb r1, [r0]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r0, _08171FA0
	adds r4, r4, r0
	ldr r0, _08171FA4
	str r0, [r4]
	movs r0, #3
	ldr r2, [sp, #8]
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r5, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	lsls r0, r7, #5
	strh r0, [r5, #0x2e]
	movs r0, #0xa
	strh r0, [r5, #0x36]
	movs r0, #1
	strh r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x3a]
_08171F52:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _08171EF2
	ldr r0, _08171FA8
	ldr r1, _08171FAC
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08171F7A
	ldr r0, _08171F94
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_08171F7A:
	mov r0, sb
	bl DestroyTask
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08171F90: .4byte 0x03005B60
_08171F94: .4byte 0x020205AC
_08171F98: .4byte 0x085C62AC
_08171F9C: .4byte 0x085C6270
_08171FA0: .4byte 0x020205C8
_08171FA4: .4byte 0x081722ED
_08171FA8: .4byte 0x03002360
_08171FAC: .4byte 0x00000439
	thumb_func_end DiveBallOpenParticleAnimation

	thumb_func_start SafariBallOpenParticleAnimation
SafariBallOpenParticleAnimation: @ 0x08171FB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _08172090
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r0, #0xa]
	str r2, [sp]
	ldrb r3, [r0, #0xc]
	str r3, [sp, #4]
	ldrb r2, [r0, #0xe]
	str r2, [sp, #8]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0xc]
	movs r7, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	str r0, [sp, #0x10]
	ldr r3, _08172094
	mov r8, r3
	ldr r0, _08172098
	adds r1, r1, r0
	mov sl, r1
_08171FF6:
	ldr r0, _0817209C
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08172052
	bl sub_08171C04
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r2, r8
	adds r5, r4, r2
	mov r3, sl
	ldrb r1, [r3]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r0, _081720A0
	adds r4, r4, r0
	ldr r0, _081720A4
	str r0, [r4]
	movs r0, #3
	ldr r2, [sp, #8]
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r5, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	lsls r0, r7, #5
	strh r0, [r5, #0x2e]
	movs r0, #4
	strh r0, [r5, #0x36]
	movs r0, #1
	strh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
_08172052:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _08171FF6
	ldr r0, _081720A8
	ldr r1, _081720AC
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0817207A
	ldr r0, _08172094
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_0817207A:
	mov r0, sb
	bl DestroyTask
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08172090: .4byte 0x03005B60
_08172094: .4byte 0x020205AC
_08172098: .4byte 0x085C6270
_0817209C: .4byte 0x085C62AC
_081720A0: .4byte 0x020205C8
_081720A4: .4byte 0x081722ED
_081720A8: .4byte 0x03002360
_081720AC: .4byte 0x00000439
	thumb_func_end SafariBallOpenParticleAnimation

	thumb_func_start UltraBallOpenParticleAnimation
UltraBallOpenParticleAnimation: @ 0x081720B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08172198
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrb r3, [r1, #0xa]
	str r3, [sp]
	ldrb r0, [r1, #0xc]
	str r0, [sp, #4]
	ldrb r2, [r1, #0xe]
	str r2, [sp, #8]
	ldrb r1, [r1, #0x10]
	str r1, [sp, #0xc]
	movs r7, #0
	ldr r3, _0817219C
	mov sl, r3
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #3
	str r0, [sp, #0x10]
_081720F6:
	ldr r0, _081721A0
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _0817215A
	bl sub_08171C04
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r3, sl
	adds r5, r4, r3
	ldr r0, _081721A4
	add r0, r8
	ldrb r1, [r0]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r0, _081721A8
	adds r4, r4, r0
	ldr r0, _081721AC
	str r0, [r4]
	movs r0, #3
	ldr r2, [sp, #8]
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r5, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r7
	strh r0, [r5, #0x2e]
	movs r0, #5
	strh r0, [r5, #0x36]
	movs r0, #1
	strh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
_0817215A:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #9
	bls _081720F6
	ldr r0, _081721B0
	ldr r1, _081721B4
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08172182
	ldr r0, _0817219C
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_08172182:
	mov r0, sb
	bl DestroyTask
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08172198: .4byte 0x03005B60
_0817219C: .4byte 0x020205AC
_081721A0: .4byte 0x085C62AC
_081721A4: .4byte 0x085C6270
_081721A8: .4byte 0x020205C8
_081721AC: .4byte 0x081722ED
_081721B0: .4byte 0x03002360
_081721B4: .4byte 0x00000439
	thumb_func_end UltraBallOpenParticleAnimation

	thumb_func_start GreatBallOpenParticleAnimation
GreatBallOpenParticleAnimation: @ 0x081721B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _081721E4
	lsls r2, r0, #2
	adds r0, r2, r0
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r1, [r3, #0x16]
	movs r4, #0x16
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _081721E8
	subs r0, r1, #1
	strh r0, [r3, #0x16]
	b _081722BA
	.align 2, 0
_081721E4: .4byte 0x03005B60
_081721E8:
	ldrh r0, [r3, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r3, #0xa]
	str r1, [sp]
	ldrb r4, [r3, #0xc]
	str r4, [sp, #4]
	ldrb r1, [r3, #0xe]
	str r1, [sp, #8]
	ldrb r3, [r3, #0x10]
	str r3, [sp, #0xc]
	movs r7, #0
	str r2, [sp, #0x14]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	str r1, [sp, #0x10]
	ldr r3, _081722CC
	mov sb, r3
	ldr r1, _081722D0
	adds r0, r0, r1
	mov sl, r0
_08172214:
	ldr r0, _081722D4
	ldr r4, [sp, #0x10]
	adds r0, r4, r0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08172270
	bl sub_08171C04
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r0, sb
	adds r5, r4, r0
	mov r3, sl
	ldrb r1, [r3]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r0, _081722D8
	adds r4, r4, r0
	ldr r0, _081722DC
	str r0, [r4]
	movs r0, #3
	ldr r2, [sp, #8]
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r5, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	lsls r0, r7, #5
	strh r0, [r5, #0x2e]
	movs r0, #8
	strh r0, [r5, #0x36]
	movs r0, #2
	strh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
_08172270:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _08172214
	ldr r0, _081722E0
	ldr r1, [sp, #0x14]
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #8
	strh r0, [r1, #0x16]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #2
	bne _081722BA
	ldr r0, _081722E4
	ldr r4, _081722E8
	adds r0, r0, r4
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _081722B4
	ldr r0, _081722CC
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_081722B4:
	mov r0, r8
	bl DestroyTask
_081722BA:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081722CC: .4byte 0x020205AC
_081722D0: .4byte 0x085C6270
_081722D4: .4byte 0x085C62AC
_081722D8: .4byte 0x020205C8
_081722DC: .4byte 0x081722ED
_081722E0: .4byte 0x03005B60
_081722E4: .4byte 0x03002360
_081722E8: .4byte 0x00000439
	thumb_func_end GreatBallOpenParticleAnimation

	thumb_func_start FanOutBallOpenParticles_Step1
FanOutBallOpenParticles_Step1: @ 0x081722EC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x2e]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x2e]
	ldrh r0, [r4, #0x38]
	ldrh r2, [r4, #0x30]
	adds r0, r0, r2
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	bne _0817233C
	adds r0, r4, #0
	bl DestroyBallOpenAnimationParticle
_0817233C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FanOutBallOpenParticles_Step1

	thumb_func_start RepeatBallOpenParticleAnimation
RepeatBallOpenParticleAnimation: @ 0x08172344
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _08172420
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r0, #0xa]
	str r2, [sp]
	ldrb r3, [r0, #0xc]
	str r3, [sp, #4]
	ldrb r2, [r0, #0xe]
	str r2, [sp, #8]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0xc]
	movs r7, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	str r0, [sp, #0x10]
	ldr r3, _08172424
	mov r8, r3
	ldr r0, _08172428
	adds r1, r1, r0
	mov sl, r1
_0817238A:
	ldr r0, _0817242C
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _081723E2
	bl sub_08171C04
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r2, r8
	adds r5, r4, r2
	mov r3, sl
	ldrb r1, [r3]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r0, _08172430
	adds r4, r4, r0
	ldr r0, _08172434
	str r0, [r4]
	movs r0, #3
	ldr r2, [sp, #8]
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r5, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r7
	strh r0, [r5, #0x2e]
_081723E2:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xb
	bls _0817238A
	ldr r0, _08172438
	ldr r1, _0817243C
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0817240A
	ldr r0, _08172424
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_0817240A:
	mov r0, sb
	bl DestroyTask
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08172420: .4byte 0x03005B60
_08172424: .4byte 0x020205AC
_08172428: .4byte 0x085C6270
_0817242C: .4byte 0x085C62AC
_08172430: .4byte 0x020205C8
_08172434: .4byte 0x08172441
_08172438: .4byte 0x03002360
_0817243C: .4byte 0x00000439
	thumb_func_end RepeatBallOpenParticleAnimation

	thumb_func_start RepeatBallOpenParticleAnimation_Step1
RepeatBallOpenParticleAnimation_Step1: @ 0x08172440
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, #0x24]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	adds r0, r4, #0
	bl Sin
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl Cos
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #0x2e]
	adds r0, #6
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	bne _08172498
	adds r0, r5, #0
	bl DestroyBallOpenAnimationParticle
_08172498:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RepeatBallOpenParticleAnimation_Step1

	thumb_func_start MasterBallOpenParticleAnimation
MasterBallOpenParticleAnimation: @ 0x081724A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _08172554
	ldr r2, [sp]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldrb r3, [r1, #0xa]
	str r3, [sp, #4]
	ldrb r0, [r1, #0xc]
	str r0, [sp, #8]
	ldrb r2, [r1, #0xe]
	str r2, [sp, #0xc]
	ldrb r1, [r1, #0x10]
	str r1, [sp, #0x10]
	movs r3, #0
	mov r8, r3
	mov r1, sb
	lsls r0, r1, #1
	add r0, sb
	lsls r0, r0, #3
	str r0, [sp, #0x14]
_081724E4:
	movs r7, #0
	movs r2, #1
	add r2, r8
	mov sl, r2
_081724EC:
	ldr r0, _08172558
	ldr r3, [sp, #0x14]
	adds r0, r3, r0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0x10]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08172574
	bl sub_08171C04
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	ldr r0, _0817255C
	adds r5, r4, r0
	ldr r0, _08172560
	add r0, sb
	ldrb r1, [r0]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r1, _08172564
	adds r4, r4, r1
	ldr r0, _08172568
	str r0, [r4]
	movs r0, #3
	ldr r1, [sp, #0xc]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r0, [r5, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	lsls r0, r7, #5
	strh r0, [r5, #0x2e]
	movs r0, #8
	strh r0, [r5, #0x36]
	mov r0, r8
	cmp r0, #0
	bne _0817256C
	movs r0, #2
	strh r0, [r5, #0x38]
	movs r0, #1
	b _08172572
	.align 2, 0
_08172554: .4byte 0x03005B60
_08172558: .4byte 0x085C62AC
_0817255C: .4byte 0x020205AC
_08172560: .4byte 0x085C6270
_08172564: .4byte 0x020205C8
_08172568: .4byte 0x081722ED
_0817256C:
	movs r0, #1
	strh r0, [r5, #0x38]
	movs r0, #2
_08172572:
	strh r0, [r5, #0x3a]
_08172574:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _081724EC
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bls _081724E4
	ldr r0, _081725C0
	ldr r2, _081725C4
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _081725A8
	ldr r0, _081725C8
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_081725A8:
	ldr r0, [sp]
	bl DestroyTask
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081725C0: .4byte 0x03002360
_081725C4: .4byte 0x00000439
_081725C8: .4byte 0x020205AC
	thumb_func_end MasterBallOpenParticleAnimation

	thumb_func_start PremierBallOpenParticleAnimation
PremierBallOpenParticleAnimation: @ 0x081725CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _081726A4
	lsls r0, r0, #2
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r0, #0xa]
	str r2, [sp]
	ldrb r3, [r0, #0xc]
	str r3, [sp, #4]
	ldrb r2, [r0, #0xe]
	str r2, [sp, #8]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0xc]
	movs r7, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	str r0, [sp, #0x10]
	ldr r3, _081726A8
	mov r8, r3
	ldr r0, _081726AC
	adds r1, r1, r0
	mov sl, r1
_08172612:
	ldr r0, _081726B0
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08172664
	bl sub_08171C04
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	mov r2, r8
	adds r5, r4, r2
	mov r3, sl
	ldrb r1, [r3]
	adds r0, r5, #0
	bl StartSpriteAnim
	ldr r0, _081726B4
	adds r4, r4, r0
	ldr r0, _081726B8
	str r0, [r4]
	movs r0, #3
	ldr r2, [sp, #8]
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r5, #5]
	movs r3, #0xd
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	lsls r0, r7, #5
	strh r0, [r5, #0x2e]
_08172664:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _08172612
	ldr r0, _081726BC
	ldr r1, _081726C0
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0817268C
	ldr r0, _081726A8
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x3c]
_0817268C:
	mov r0, sb
	bl DestroyTask
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081726A4: .4byte 0x03005B60
_081726A8: .4byte 0x020205AC
_081726AC: .4byte 0x085C6270
_081726B0: .4byte 0x085C62AC
_081726B4: .4byte 0x020205C8
_081726B8: .4byte 0x081726C5
_081726BC: .4byte 0x03002360
_081726C0: .4byte 0x00000439
	thumb_func_end PremierBallOpenParticleAnimation

	thumb_func_start PremierBallOpenParticleAnimation_Step1
PremierBallOpenParticleAnimation_Step1: @ 0x081726C4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, #0x24]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	ldrh r1, [r5, #0x2e]
	movs r0, #0x3f
	ands r0, r1
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	bl Sin
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl Cos
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #0x2e]
	adds r0, #0xa
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x34]
	adds r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	bne _08172720
	adds r0, r5, #0
	bl DestroyBallOpenAnimationParticle
_08172720:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PremierBallOpenParticleAnimation_Step1

	thumb_func_start DestroyBallOpenAnimationParticle
DestroyBallOpenAnimationParticle: @ 0x08172728
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0817274C
	ldr r1, _08172750
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08172754
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	bne _081727AE
	adds r0, r7, #0
	bl DestroySpriteAndFreeResources
	b _081727C6
	.align 2, 0
_0817274C: .4byte 0x03002360
_08172750: .4byte 0x00000439
_08172754:
	ldr r2, _08172770
	ldr r0, [r2]
	ldr r1, [r0, #8]
	ldrb r0, [r1, #0xa]
	subs r0, #1
	strb r0, [r1, #0xa]
	ldr r0, [r2]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _081727C0
	movs r4, #0
	ldr r5, _08172774
	b _0817277C
	.align 2, 0
_08172770: .4byte 0x02024174
_08172774: .4byte 0x085C627C
_08172778:
	adds r5, #4
	adds r4, #1
_0817277C:
	cmp r4, #0xb
	bgt _0817278E
	ldr r0, [r5]
	bl FuncIsActiveTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08172778
_0817278E:
	cmp r4, #0xc
	bne _081727AE
	movs r6, #0
	ldr r5, _081727B8
	ldr r4, _081727BC
_08172798:
	ldrh r0, [r5, #6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4, #4]
	bl FreeSpritePaletteByTag
	adds r5, #8
	adds r4, #8
	adds r6, #1
	cmp r6, #0xb
	ble _08172798
_081727AE:
	adds r0, r7, #0
	bl DestroySprite
	b _081727C6
	.align 2, 0
_081727B8: .4byte 0x085C6150
_081727BC: .4byte 0x085C61B0
_081727C0:
	adds r0, r7, #0
	bl DestroySprite
_081727C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end DestroyBallOpenAnimationParticle

	thumb_func_start LaunchBallFadeMonTask
LaunchBallFadeMonTask: @ 0x081727CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov sb, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	ldr r0, _08172830
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _08172834
	lsls r0, r0, #2
	add r0, r8
	lsls r0, r0, #3
	adds r5, r0, r1
	strh r7, [r5, #0x26]
	strh r6, [r5, #0xe]
	mov r0, sb
	strh r0, [r5, #0x1c]
	mov r1, sb
	lsrs r0, r1, #0x10
	strh r0, [r5, #0x1e]
	cmp r4, #0
	bne _0817283C
	lsls r0, r6, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	ldr r2, _08172838
	lsls r1, r7, #1
	adds r1, r1, r2
	ldrh r3, [r1]
	movs r1, #0x10
	movs r2, #0
	bl BlendPalette
	movs r0, #1
	strh r0, [r5, #0xa]
	b _08172862
	.align 2, 0
_08172830: .4byte 0x08172895
_08172834: .4byte 0x03005B60
_08172838: .4byte 0x085C63CC
_0817283C:
	lsls r0, r6, #0x14
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	ldr r2, _08172884
	lsls r1, r7, #1
	adds r1, r1, r2
	ldrh r3, [r1]
	movs r1, #0x10
	movs r2, #0x10
	bl BlendPalette
	movs r0, #0x10
	strh r0, [r5, #8]
	ldr r0, _08172888
	strh r0, [r5, #0xa]
	ldr r0, _0817288C
	str r0, [r5]
_08172862:
	ldr r0, _08172890
	str r0, [sp]
	mov r0, sb
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	mov r0, r8
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08172884: .4byte 0x085C63CC
_08172888: .4byte 0x0000FFFF
_0817288C: .4byte 0x08172925
_08172890: .4byte 0x00007FFF
	thumb_func_end LaunchBallFadeMonTask

	thumb_func_start sub_08172894
sub_08172894: @ 0x08172894
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	ldr r1, _081728E4
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0x10
	bgt _081728EC
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	lsls r0, r0, #0x14
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	ldrb r2, [r4, #8]
	ldr r3, _081728E8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r3, [r1]
	movs r1, #0x10
	bl BlendPalette
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r4, #8]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _08172914
	.align 2, 0
_081728E4: .4byte 0x03005B60
_081728E8: .4byte 0x085C63CC
_081728EC:
	ldr r0, _0817291C
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08172914
	ldrh r0, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	lsls r1, r1, #0x10
	orrs r0, r1
	ldr r1, _08172920
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	adds r0, r5, #0
	bl DestroyTask
_08172914:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817291C: .4byte 0x02037C74
_08172920: .4byte 0x00007FFF
	thumb_func_end sub_08172894

	thumb_func_start sub_08172924
sub_08172924: @ 0x08172924
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08172964
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817295C
	ldr r0, _08172968
	lsls r4, r2, #2
	adds r4, r4, r2
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r0, [r4, #0x1c]
	ldrh r1, [r4, #0x1e]
	lsls r1, r1, #0x10
	orrs r0, r1
	ldr r1, _0817296C
	str r1, [sp]
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _08172970
	str r0, [r4]
_0817295C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08172964: .4byte 0x02037C74
_08172968: .4byte 0x03005B60
_0817296C: .4byte 0x00007FFF
_08172970: .4byte 0x08172975
	thumb_func_end sub_08172924

	thumb_func_start sub_08172974
sub_08172974: @ 0x08172974
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _081729C0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0x10
	bgt _081729C8
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	lsls r0, r0, #0x14
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	ldrb r2, [r4, #8]
	ldr r3, _081729C4
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r3, [r1]
	movs r1, #0x10
	bl BlendPalette
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r4, #8]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _081729CE
	.align 2, 0
_081729C0: .4byte 0x03005B60
_081729C4: .4byte 0x085C63CC
_081729C8:
	adds r0, r2, #0
	bl DestroyTask
_081729CE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08172974

	thumb_func_start sub_081729D4
sub_081729D4: @ 0x081729D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r0, _08172A08
	ldr r3, _08172A0C
	ldrb r2, [r3]
	adds r0, r2, r0
	ldrb r6, [r0]
	ldr r1, _08172A10
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #0x1c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _08172AAC
	cmp r0, #1
	bgt _08172A14
	cmp r0, #0
	beq _08172A1A
	b _08172B6E
	.align 2, 0
_08172A08: .4byte 0x02023E88
_08172A0C: .4byte 0x020380D6
_08172A10: .4byte 0x03005B60
_08172A14:
	cmp r0, #2
	beq _08172ABE
	b _08172B6E
_08172A1A:
	ldr r0, _08172A54
	ldrh r0, [r0]
	strh r0, [r5, #0x1e]
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r4, [r5, #8]
	adds r0, r0, r4
	strh r0, [r5, #8]
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08172A5C
	ldr r2, _08172A58
	lsls r3, r6, #4
	adds r1, r3, r6
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r4, [r1, #0x24]
	adds r0, r0, r4
	strh r0, [r1, #0x24]
	adds r4, r3, #0
	b _08172A74
	.align 2, 0
_08172A54: .4byte 0x020380BE
_08172A58: .4byte 0x020205AC
_08172A5C:
	ldr r3, _08172AA4
	lsls r4, r6, #4
	adds r2, r4, r6
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r5, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r2, #0x24]
	subs r0, r0, r1
	strh r0, [r2, #0x24]
	adds r2, r3, #0
_08172A74:
	ldr r1, _08172AA8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrb r0, [r3, #8]
	strh r0, [r3, #8]
	adds r0, r4, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r2, #0x20
	ldrsh r1, [r0, r2]
	movs r4, #0x24
	ldrsh r0, [r0, r4]
	adds r1, r1, r0
	adds r1, #0x20
	movs r0, #0x98
	lsls r0, r0, #1
	cmp r1, r0
	bls _08172B6E
	ldrh r0, [r3, #0x1c]
	adds r0, #1
	strh r0, [r3, #0x1c]
	b _08172B6E
	.align 2, 0
_08172AA4: .4byte 0x020205AC
_08172AA8: .4byte 0x03005B60
_08172AAC:
	ldrb r1, [r5, #0x1e]
	adds r0, r2, #0
	adds r2, r6, #0
	bl LoadBattleMonGfxAndAnimate
	ldrh r0, [r5, #0x1c]
	adds r0, #1
	strh r0, [r5, #0x1c]
	b _08172B6E
_08172ABE:
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r2, [r5, #8]
	adds r0, r0, r2
	strh r0, [r5, #8]
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08172AF4
	ldr r0, _08172AF0
	lsls r3, r6, #4
	adds r2, r3, r6
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrh r1, [r5, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r2, #0x24]
	subs r0, r0, r1
	strh r0, [r2, #0x24]
	adds r4, r3, #0
	b _08172B0C
	.align 2, 0
_08172AF0: .4byte 0x020205AC
_08172AF4:
	ldr r0, _08172B40
	lsls r2, r6, #4
	adds r1, r2, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r3, [r1, #0x24]
	adds r0, r0, r3
	strh r0, [r1, #0x24]
	adds r4, r2, #0
_08172B0C:
	ldr r1, _08172B44
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #8]
	strh r1, [r0, #8]
	ldr r0, _08172B48
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08172B4C
	ldr r0, _08172B40
	adds r1, r4, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r4, #0x24
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bgt _08172B62
	movs r0, #0
	strh r0, [r1, #0x24]
	b _08172B68
	.align 2, 0
_08172B40: .4byte 0x020205AC
_08172B44: .4byte 0x03005B60
_08172B48: .4byte 0x020380D6
_08172B4C:
	ldr r0, _08172B78
	adds r1, r4, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0x24
	ldrsh r0, [r1, r3]
	cmp r0, #0
	blt _08172B62
	strh r2, [r1, #0x24]
	movs r4, #1
	mov r8, r4
_08172B62:
	mov r0, r8
	cmp r0, #0
	beq _08172B6E
_08172B68:
	adds r0, r7, #0
	bl DestroyAnimVisualTask
_08172B6E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08172B78: .4byte 0x020205AC
	thumb_func_end sub_081729D4

	thumb_func_start sub_08172B7C
sub_08172B7C: @ 0x08172B7C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08172BA0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08172BF8
	cmp r0, #1
	bgt _08172BA4
	cmp r0, #0
	beq _08172BAA
	b _08172C68
	.align 2, 0
_08172BA0: .4byte 0x03005B60
_08172BA4:
	cmp r0, #2
	beq _08172C32
	b _08172C68
_08172BAA:
	ldr r0, _08172BC4
	ldrb r0, [r0]
	bl GetBattlerSpriteBGPriorityRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08172BCC
	ldr r1, _08172BC8
	movs r0, #0x50
	bl SetGpuReg
	b _08172BD4
	.align 2, 0
_08172BC4: .4byte 0x020380D6
_08172BC8: .4byte 0x00003F42
_08172BCC:
	ldr r1, _08172BF0
	movs r0, #0x50
	bl SetGpuReg
_08172BD4:
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	ldr r0, _08172BF4
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x26]
	adds r0, #1
	strh r0, [r1, #0x26]
	b _08172C68
	.align 2, 0
_08172BF0: .4byte 0x00003F44
_08172BF4: .4byte 0x03005B60
_08172BF8:
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08172C68
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r2, [r4, #8]
	adds r2, #1
	strh r2, [r4, #8]
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08172C68
	ldrh r0, [r4, #0x26]
	adds r0, #1
	strh r0, [r4, #0x26]
	b _08172C68
_08172C32:
	ldr r1, _08172C70
	ldr r4, _08172C74
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _08172C78
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r0, _08172C7C
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	movs r0, #0
	movs r3, #1
	bl RequestDma3Fill
	ldrb r0, [r4]
	bl ClearBehindSubstituteBit
	adds r0, r5, #0
	bl DestroyAnimVisualTask
_08172C68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08172C70: .4byte 0x02023E88
_08172C74: .4byte 0x020380D6
_08172C78: .4byte 0x020205AC
_08172C7C: .4byte 0x06010000
	thumb_func_end sub_08172B7C

	thumb_func_start AnimTask_IsAttackerBehindSubstitute
AnimTask_IsAttackerBehindSubstitute: @ 0x08172C80
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08172CA8
	ldr r1, _08172CAC
	ldr r2, [r1]
	ldr r1, _08172CB0
	ldrb r1, [r1]
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	strh r1, [r3, #0xe]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08172CA8: .4byte 0x020380BE
_08172CAC: .4byte 0x02024174
_08172CB0: .4byte 0x020380D6
	thumb_func_end AnimTask_IsAttackerBehindSubstitute

	thumb_func_start AnimTask_TargetToEffectBattler
AnimTask_TargetToEffectBattler: @ 0x08172CB4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08172CCC
	ldr r1, _08172CD0
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08172CCC: .4byte 0x020380D7
_08172CD0: .4byte 0x02023EB2
	thumb_func_end AnimTask_TargetToEffectBattler

	thumb_func_start sub_08172CD4
sub_08172CD4: @ 0x08172CD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r0, _08172D90
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	adds r4, r0, #0
	adds r0, r6, #0
	bl IsBattlerSpriteVisible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08172DAC
	lsrs r0, r5, #0x10
	ldr r7, _08172D94
	ands r5, r7
	eors r0, r5
	lsrs r1, r4, #0x10
	eors r0, r1
	ands r4, r7
	eors r0, r4
	cmp r0, #7
	bhi _08172D32
	movs r0, #1
	mov r8, r0
_08172D32:
	mov r0, r8
	cmp r0, #0
	beq _08172DAC
	ldr r0, _08172D98
	bl GetSpriteTileStartByTag
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r7
	bne _08172D52
	ldr r0, _08172D9C
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _08172DA0
	bl LoadCompressedSpritePaletteUsingHeap
_08172D52:
	ldr r5, _08172DA4
	adds r0, r5, #0
	movs r1, #0xa
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	movs r1, #0xa
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08172DA8
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #3
	adds r2, r2, r3
	movs r4, #0
	strh r6, [r2, #8]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r3
	strh r6, [r1, #8]
	strh r4, [r2, #0xa]
	movs r0, #1
	strh r0, [r1, #0xa]
	b _08172DC2
	.align 2, 0
_08172D90: .4byte 0x02024174
_08172D94: .4byte 0x0000FFFF
_08172D98: .4byte 0x000027F9
_08172D9C: .4byte 0x084FD998
_08172DA0: .4byte 0x084FE2A0
_08172DA4: .4byte 0x08172DD1
_08172DA8: .4byte 0x03005B60
_08172DAC:
	ldr r0, _08172DCC
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #1]
_08172DC2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08172DCC: .4byte 0x02024174
	thumb_func_end sub_08172CD4

	thumb_func_start sub_08172DD0
sub_08172DD0: @ 0x08172DD0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08172DF8
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4, #0x22]
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	cmp r0, #0x3b
	bgt _08172DFC
	adds r0, r1, #1
	strh r0, [r4, #0x22]
	b _08172F74
	.align 2, 0
_08172DF8: .4byte 0x03005B60
_08172DFC:
	ldr r0, _08172E50
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _08172E0A
	b _08172F74
_08172E0A:
	ldrh r0, [r4, #0x1c]
	adds r1, r0, #1
	strh r1, [r4, #0x1c]
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _08172E1E
	b _08172F74
_08172E1E:
	ldrb r0, [r4, #8]
	mov r8, r0
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, r8
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08172E58
	ldr r0, _08172E54
	adds r1, r5, #0
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08172EBA
	.align 2, 0
_08172E50: .4byte 0x02024174
_08172E54: .4byte 0x085AD190
_08172E58:
	cmp r0, #0
	blt _08172E8C
	cmp r0, #3
	bgt _08172E8C
	ldr r0, _08172E84
	adds r1, r5, #0
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08172E88
	lsls r2, r5, #4
	adds r2, r2, r5
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #4
	b _08172EAC
	.align 2, 0
_08172E84: .4byte 0x085AD1A8
_08172E88: .4byte 0x020205AC
_08172E8C:
	ldr r0, _08172EE4
	adds r1, r5, #0
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08172EE8
	lsls r2, r5, #4
	adds r2, r2, r5
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #5
_08172EAC:
	ldr r4, _08172EEC
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _08172EF0
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
_08172EBA:
	ldr r2, _08172EF4
	lsls r1, r7, #2
	adds r0, r1, r7
	lsls r0, r0, #3
	adds r6, r0, r2
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	mov sb, r1
	cmp r0, #0
	bne _08172EFC
	ldr r1, _08172EE8
	lsls r2, r5, #4
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08172EF8
	str r1, [r0]
	adds r4, r2, #0
	b _08172F44
	.align 2, 0
_08172EE4: .4byte 0x085AD1A8
_08172EE8: .4byte 0x020205AC
_08172EEC: .4byte 0x000003FF
_08172EF0: .4byte 0xFFFFFC00
_08172EF4: .4byte 0x03005B60
_08172EF8: .4byte 0x08172FE1
_08172EFC:
	ldr r3, _08172F80
	lsls r4, r5, #4
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r1, r0
	ldr r2, _08172F84
	str r2, [r0]
	adds r1, r1, r3
	ldr r0, _08172F88
	strh r0, [r1, #0x24]
	movs r0, #0x20
	strh r0, [r1, #0x26]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	movs r1, #0x1e
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08172F44
	mov r0, r8
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r1, #0x3f
	cmp r0, #0
	bne _08172F3A
	movs r1, #0xc0
_08172F3A:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x66
	bl PlaySE12WithPanning
_08172F44:
	ldr r1, _08172F80
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r7, [r0, #0x2e]
	ldr r1, _08172F8C
	mov r2, sb
	adds r0, r2, r7
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	cmp r5, #0x40
	beq _08172F68
	ldrh r0, [r1, #0x20]
	adds r0, #1
	strh r0, [r1, #0x20]
_08172F68:
	movs r4, #0x1e
	ldrsh r0, [r1, r4]
	cmp r0, #5
	bne _08172F74
	ldr r0, _08172F90
	str r0, [r1]
_08172F74:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08172F80: .4byte 0x020205AC
_08172F84: .4byte 0x08173035
_08172F88: .4byte 0x0000FFE0
_08172F8C: .4byte 0x03005B60
_08172F90: .4byte 0x08172F95
	thumb_func_end sub_08172DD0

	thumb_func_start sub_08172F94
sub_08172F94: @ 0x08172F94
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	ldr r1, _08172FD8
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08172FD4
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _08172FCE
	ldrb r1, [r1, #8]
	ldr r0, _08172FDC
	ldr r0, [r0]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #1]
_08172FCE:
	adds r0, r3, #0
	bl DestroyTask
_08172FD4:
	pop {r0}
	bx r0
	.align 2, 0
_08172FD8: .4byte 0x03005B60
_08172FDC: .4byte 0x02024174
	thumb_func_end sub_08172F94

	thumb_func_start sub_08172FE0
sub_08172FE0: @ 0x08172FE0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x18
	bl Sin
	strh r0, [r4, #0x24]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x18
	bl Cos
	strh r0, [r4, #0x26]
	ldrh r0, [r4, #0x30]
	adds r0, #0xc
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0817302A
	ldr r2, _08173030
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
_0817302A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08173030: .4byte 0x03005B60
	thumb_func_end sub_08172FE0

	thumb_func_start sub_08173034
sub_08173034: @ 0x08173034
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #3
	bgt _08173048
	adds r0, r1, #1
	strh r0, [r4, #0x30]
	b _0817308A
_08173048:
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r4, #0x24]
	adds r1, #5
	strh r1, [r4, #0x24]
	ldrh r0, [r4, #0x26]
	subs r0, #5
	strh r0, [r4, #0x26]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x20
	ble _0817308A
	ldr r2, _08173090
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
_0817308A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08173090: .4byte 0x03005B60
	thumb_func_end sub_08173034

	thumb_func_start AnimTask_LoadPokeblockGfx
AnimTask_LoadPokeblockGfx: @ 0x08173094
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _081730BC
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _081730C0
	bl LoadCompressedSpritePaletteUsingHeap
	ldr r0, _081730C4
	bl IndexOfSpritePaletteTag
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081730BC: .4byte 0x084FDAB8
_081730C0: .4byte 0x084FE3C0
_081730C4: .4byte 0x0000281D
	thumb_func_end AnimTask_LoadPokeblockGfx

	thumb_func_start AnimTask_FreePokeblockGfx
AnimTask_FreePokeblockGfx: @ 0x081730C8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _081730EC
	adds r0, r5, #0
	bl FreeSpriteTilesByTag
	adds r0, r5, #0
	bl FreeSpritePaletteByTag
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081730EC: .4byte 0x0000281D
	thumb_func_end AnimTask_FreePokeblockGfx

	thumb_func_start sub_081730F0
sub_081730F0: @ 0x081730F0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0
	bl InitSpritePosToAnimAttacker
	movs r0, #0x1e
	strh r0, [r4, #0x2e]
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	ldr r5, _08173164
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	strh r0, [r4, #0x32]
	movs r0, #1
	bl GetBattlerAtPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl GetBattlerSpriteCoord
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r5, [r5, #6]
	adds r0, r0, r5
	strh r0, [r4, #0x36]
	ldr r0, _08173168
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl InitAnimArcTranslation
	ldr r2, _0817316C
	ldr r1, _08173170
	ldr r0, _08173174
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08173178
	str r1, [r0]
	ldr r0, _0817317C
	str r0, [r4, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08173164: .4byte 0x020380BE
_08173168: .4byte 0x0000FFE0
_0817316C: .4byte 0x020205AC
_08173170: .4byte 0x02023E88
_08173174: .4byte 0x020380D6
_08173178: .4byte 0x08039AC9
_0817317C: .4byte 0x08173181
	thumb_func_end sub_081730F0

	thumb_func_start sub_08173180
sub_08173180: @ 0x08173180
	push {lr}
	adds r3, r0, #0
	ldr r2, _081731A8
	ldr r1, _081731AC
	ldr r0, _081731B0
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #1
	bne _081731A4
	ldr r0, _081731B4
	str r0, [r3, #0x1c]
_081731A4:
	pop {r0}
	bx r0
	.align 2, 0
_081731A8: .4byte 0x020205AC
_081731AC: .4byte 0x02023E88
_081731B0: .4byte 0x020380D6
_081731B4: .4byte 0x081731B9
	thumb_func_end sub_08173180

	thumb_func_start sub_081731B8
sub_081731B8: @ 0x081731B8
	push {r4, lr}
	adds r4, r0, #0
	bl TranslateAnimHorizontalArc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081731DA
	movs r0, #0
	strh r0, [r4, #0x2e]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _081731E0
	str r0, [r4, #0x1c]
_081731DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081731E0: .4byte 0x081731E5
	thumb_func_end sub_081731B8

	thumb_func_start sub_081731E4
sub_081731E4: @ 0x081731E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08173234
	ldr r3, _08173238
	ldr r2, _0817323C
	ldrb r0, [r2]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _0817322C
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0817322C
	ldrb r0, [r2]
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	bl DestroyAnimSprite
_0817322C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08173234: .4byte 0x020205AC
_08173238: .4byte 0x02023E88
_0817323C: .4byte 0x020380D6
	thumb_func_end sub_081731E4

	thumb_func_start sub_08173240
sub_08173240: @ 0x08173240
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08173258
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0817325C
	cmp r0, #1
	beq _08173270
	b _08173284
	.align 2, 0
_08173258: .4byte 0x020380BE
_0817325C:
	movs r0, #0
	bl GetBattlerAtPosition
	ldr r1, _0817326C
	strb r0, [r1]
	movs r0, #1
	b _0817327C
	.align 2, 0
_0817326C: .4byte 0x020380D6
_08173270:
	movs r0, #1
	bl GetBattlerAtPosition
	ldr r1, _08173290
	strb r0, [r1]
	movs r0, #0
_0817327C:
	bl GetBattlerAtPosition
	ldr r1, _08173294
	strb r0, [r1]
_08173284:
	adds r0, r4, #0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08173290: .4byte 0x020380D6
_08173294: .4byte 0x020380D7
	thumb_func_end sub_08173240

	thumb_func_start AnimTask_GetTrappedMoveAnimId
AnimTask_GetTrappedMoveAnimId: @ 0x08173298
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081732B0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrh r1, [r0]
	cmp r1, #0x53
	bne _081732B8
	ldr r1, _081732B4
	movs r0, #1
	b _081732F0
	.align 2, 0
_081732B0: .4byte 0x02024174
_081732B4: .4byte 0x020380BE
_081732B8:
	cmp r1, #0xfa
	bne _081732C8
	ldr r1, _081732C4
	movs r0, #2
	b _081732F0
	.align 2, 0
_081732C4: .4byte 0x020380BE
_081732C8:
	cmp r1, #0x80
	bne _081732D8
	ldr r1, _081732D4
	movs r0, #3
	b _081732F0
	.align 2, 0
_081732D4: .4byte 0x020380BE
_081732D8:
	movs r0, #0xa4
	lsls r0, r0, #1
	cmp r1, r0
	bne _081732EC
	ldr r1, _081732E8
	movs r0, #4
	b _081732F0
	.align 2, 0
_081732E8: .4byte 0x020380BE
_081732EC:
	ldr r1, _081732FC
	movs r0, #0
_081732F0:
	strh r0, [r1]
	adds r0, r2, #0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_081732FC: .4byte 0x020380BE
	thumb_func_end AnimTask_GetTrappedMoveAnimId

	thumb_func_start AnimTask_GetBattlersFromArg
AnimTask_GetBattlersFromArg: @ 0x08173300
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08173324
	ldr r1, _08173328
	ldr r2, [r1]
	ldr r1, [r2, #8]
	ldrh r1, [r1]
	strb r1, [r3]
	ldr r3, _0817332C
	ldr r1, [r2, #8]
	ldrh r1, [r1]
	lsrs r1, r1, #8
	strb r1, [r3]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08173324: .4byte 0x020380D6
_08173328: .4byte 0x02024174
_0817332C: .4byte 0x020380D7
	thumb_func_end AnimTask_GetBattlersFromArg

