.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetSpriteData
ResetSpriteData: @ 0x0800668C
	push {r4, lr}
	movs r0, #0
	movs r1, #0x80
	bl ResetOamRange
	bl ResetAllSprites
	bl ClearSpriteCopyRequests
	bl ResetAffineAnimData
	bl FreeSpriteTileRanges
	ldr r1, _080066C8
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _080066CC
	movs r4, #0
	strh r4, [r0]
	movs r0, #0
	bl AllocSpriteTiles
	ldr r0, _080066D0
	strh r4, [r0]
	ldr r0, _080066D4
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080066C8: .4byte 0x02021AB4
_080066CC: .4byte 0x02021AB6
_080066D0: .4byte 0x02021B38
_080066D4: .4byte 0x02021B3A
	thumb_func_end ResetSpriteData

	thumb_func_start AnimateSprites
AnimateSprites: @ 0x080066D8
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	movs r7, #1
_080066DE:
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	ldr r1, _08006720
	adds r4, r0, r1
	adds r5, r4, #0
	adds r5, #0x3e
	ldrb r1, [r5]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0800670E
	ldr r1, [r4, #0x1c]
	adds r0, r4, #0
	bl _call_via_r1
	ldrb r1, [r5]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0800670E
	adds r0, r4, #0
	bl AnimateSprite
_0800670E:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x3f
	bls _080066DE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006720: .4byte 0x020205AC
	thumb_func_end AnimateSprites

	thumb_func_start BuildOamBuffer
BuildOamBuffer: @ 0x08006724
	push {r4, r5, lr}
	bl UpdateOamCoords
	bl BuildSpritePriorities
	bl SortSprites
	ldr r5, _08006764
	ldr r0, _08006768
	adds r5, r5, r0
	ldrb r0, [r5]
	lsls r4, r0, #0x1f
	lsrs r4, r4, #0x1f
	movs r1, #1
	orrs r0, r1
	strb r0, [r5]
	bl AddSpritesToOamBuffer
	bl CopyMatricesToOamBuffer
	movs r2, #1
	ldrb r1, [r5]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	orrs r4, r0
	strb r4, [r5]
	ldr r0, _0800676C
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006764: .4byte 0x03002360
_08006768: .4byte 0x00000439
_0800676C: .4byte 0x020217B0
	thumb_func_end BuildOamBuffer

	thumb_func_start UpdateOamCoords
UpdateOamCoords: @ 0x08006770
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _080067DC
	ldr r0, _080067E0
	adds r5, r0, #0
	ldr r6, _080067E4
_0800677C:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r0, r7
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #5
	ands r0, r1
	cmp r0, #1
	bne _08006822
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080067F0
	movs r2, #0x20
	ldrsh r1, [r3, r2]
	movs r2, #0x24
	ldrsh r0, [r3, r2]
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _080067E8
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, r1, r0
	ands r1, r5
	ldrh r2, [r3, #2]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r1, [r3, #0x26]
	ldrh r0, [r3, #0x22]
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x29
	ldrb r0, [r0]
	ldr r2, _080067EC
	adds r0, r0, r1
	ldrb r2, [r2]
	adds r0, r0, r2
	b _08006820
	.align 2, 0
_080067DC: .4byte 0x020205AC
_080067E0: .4byte 0x000001FF
_080067E4: .4byte 0xFFFFFE00
_080067E8: .4byte 0x02021B38
_080067EC: .4byte 0x02021B3A
_080067F0:
	movs r2, #0x20
	ldrsh r1, [r3, r2]
	movs r2, #0x24
	ldrsh r0, [r3, r2]
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ands r1, r5
	ldrh r2, [r3, #2]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r1, [r3, #0x26]
	ldrh r0, [r3, #0x22]
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x29
	ldrb r0, [r0]
	adds r0, r0, r1
_08006820:
	strb r0, [r3]
_08006822:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _0800677C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateOamCoords

	thumb_func_start BuildSpritePriorities
BuildSpritePriorities: @ 0x08006834
	push {r4, lr}
	movs r2, #0
	ldr r4, _0800686C
	ldr r3, _08006870
_0800683C:
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r0, #0
	adds r1, #0x43
	ldrb r1, [r1]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #8
	orrs r1, r0
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x3f
	bls _0800683C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800686C: .4byte 0x020205AC
_08006870: .4byte 0x020216F0
	thumb_func_end BuildSpritePriorities

	thumb_func_start SortSprites
SortSprites: @ 0x08006874
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #1
	mov ip, r0
	ldr r1, _0800693C
	mov sl, r1
	ldr r3, _08006940
	mov sb, r3
	ldr r6, _08006944
	mov r8, r6
_08006890:
	mov r5, ip
	mov r0, ip
	subs r0, #1
	add r0, sl
	ldrb r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r7, _08006948
	adds r3, r0, r7
	mov r0, ip
	add r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r7
	lsls r2, r2, #1
	ldr r0, _0800694C
	adds r2, r2, r0
	ldrh r2, [r2]
	str r2, [sp]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	ldrb r1, [r3]
	ldrb r2, [r4]
	adds r0, r1, #0
	cmp r0, #0x9f
	ble _080068D2
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080068D2:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _080068E0
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080068E0:
	ldr r0, [r3]
	mov r7, r8
	ands r0, r7
	cmp r0, r8
	bne _08006904
	ldrb r0, [r3, #1]
	lsrs r0, r0, #6
	cmp r0, #0
	beq _080068F6
	cmp r0, #2
	bne _08006904
_080068F6:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x80
	ble _08006904
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08006904:
	ldr r0, [r4]
	mov r3, r8
	ands r0, r3
	cmp r0, r8
	bne _08006928
	ldrb r0, [r4, #1]
	lsrs r0, r0, #6
	cmp r0, #0
	beq _0800691A
	cmp r0, #2
	bne _08006928
_0800691A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x80
	ble _08006928
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006928:
	movs r7, #1
	add ip, r7
	cmp r5, #0
	beq _08006A0E
	ldr r0, [sp]
	cmp r0, r6
	bhi _08006950
	cmp r0, r6
	bne _08006A0E
	b _08006A06
	.align 2, 0
_0800693C: .4byte 0x02021770
_08006940: .4byte 0xFFFFFF00
_08006944: .4byte 0xC0000300
_08006948: .4byte 0x020205AC
_0800694C: .4byte 0x020216F0
_08006950:
	mov r1, sl
	adds r3, r5, r1
	ldrb r4, [r3]
	subs r2, r5, #1
	adds r1, r2, r1
	ldrb r0, [r1]
	strb r0, [r3]
	strb r4, [r1]
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	subs r0, r5, #1
	add r0, sl
	ldrb r2, [r0]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r6, _08006A2C
	adds r3, r0, r6
	mov r7, sl
	adds r0, r5, r7
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r6
	lsls r2, r2, #1
	ldr r0, _08006A30
	adds r2, r2, r0
	ldrh r2, [r2]
	str r2, [sp]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	ldrb r1, [r3]
	ldrb r2, [r4]
	adds r0, r1, #0
	cmp r0, #0x9f
	ble _080069A2
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080069A2:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _080069B0
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080069B0:
	ldr r0, [r3]
	mov r7, r8
	ands r0, r7
	cmp r0, r8
	bne _080069D4
	ldrb r0, [r3, #1]
	lsrs r0, r0, #6
	cmp r0, #0
	beq _080069C6
	cmp r0, #2
	bne _080069D4
_080069C6:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x80
	ble _080069D4
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080069D4:
	ldr r0, [r4]
	mov r3, r8
	ands r0, r3
	cmp r0, r8
	bne _080069F8
	ldrb r0, [r4, #1]
	lsrs r0, r0, #6
	cmp r0, #0
	beq _080069EA
	cmp r0, #2
	bne _080069F8
_080069EA:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x80
	ble _080069F8
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080069F8:
	cmp r5, #0
	beq _08006A0E
	ldr r7, [sp]
	cmp r7, r6
	bhi _08006950
	cmp r7, r6
	bne _08006A0E
_08006A06:
	lsls r1, r1, #0x10
	lsls r0, r2, #0x10
	cmp r1, r0
	blt _08006950
_08006A0E:
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #0x3f
	bhi _08006A1C
	b _08006890
_08006A1C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006A2C: .4byte 0x020205AC
_08006A30: .4byte 0x020216F0
	thumb_func_end SortSprites

	thumb_func_start CopyMatricesToOamBuffer
CopyMatricesToOamBuffer: @ 0x08006A34
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _08006A78
	ldr r6, _08006A7C
_08006A3C:
	lsls r2, r4, #2
	lsls r1, r4, #5
	adds r1, r1, r5
	lsls r3, r4, #3
	adds r3, r3, r6
	ldrh r0, [r3]
	strh r0, [r1, #0x3e]
	adds r0, r2, #1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r3, #2]
	strh r1, [r0, #0x3e]
	adds r0, r2, #2
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r3, #4]
	strh r1, [r0, #0x3e]
	adds r2, #3
	lsls r2, r2, #3
	adds r2, r2, r5
	ldrh r0, [r3, #6]
	strh r0, [r2, #0x3e]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _08006A3C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006A78: .4byte 0x03002360
_08006A7C: .4byte 0x02021B3C
	thumb_func_end CopyMatricesToOamBuffer

	thumb_func_start AddSpritesToOamBuffer
AddSpritesToOamBuffer: @ 0x08006A80
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r4, #0
	mov r0, sp
	strb r4, [r0]
_08006A8A:
	ldr r0, _08006AF8
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08006AFC
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #5
	ands r0, r1
	cmp r0, #1
	bne _08006AB6
	adds r0, r2, #0
	mov r1, sp
	bl AddSpriteToOamBuffer
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08006AF0
_08006AB6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _08006A8A
	mov r0, sp
	ldr r4, _08006B00
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	bhs _08006AF0
	mov r1, sp
	ldr r5, _08006B04
	ldr r0, _08006B08
	ldr r2, [r0]
	ldr r3, [r0, #4]
_08006AD6:
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r5
	str r2, [r0]
	str r3, [r0, #4]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r6, [r4]
	cmp r0, r6
	blo _08006AD6
_08006AF0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006AF8: .4byte 0x02021770
_08006AFC: .4byte 0x020205AC
_08006B00: .4byte 0x02021AB4
_08006B04: .4byte 0x03002398
_08006B08: .4byte 0x082BF2F8
	thumb_func_end AddSpritesToOamBuffer

	thumb_func_start CreateSprite
CreateSprite: @ 0x08006B0C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	movs r3, #0
	ldr r0, _08006B48
	mov ip, r0
	lsls r5, r1, #0x10
	lsls r6, r2, #0x10
_08006B20:
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, ip
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08006B4C
	str r4, [sp]
	adds r0, r3, #0
	adds r1, r7, #0
	asrs r2, r5, #0x10
	asrs r3, r6, #0x10
	bl CreateSpriteAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08006B58
	.align 2, 0
_08006B48: .4byte 0x020205AC
_08006B4C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x3f
	bls _08006B20
	movs r0, #0x40
_08006B58:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CreateSprite

	thumb_func_start CreateSpriteAtEnd
CreateSpriteAtEnd: @ 0x08006B60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	movs r3, #0x3f
	ldr r0, _08006BAC
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	mov ip, r0
	lsls r4, r1, #0x10
	lsls r5, r2, #0x10
_08006B7E:
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08006BB0
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r6, [sp]
	adds r1, r7, #0
	asrs r2, r4, #0x10
	asrs r3, r5, #0x10
	bl CreateSpriteAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08006BBE
	.align 2, 0
_08006BAC: .4byte 0x020205AC
_08006BB0:
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, ip
	bgt _08006B7E
	movs r0, #0x40
_08006BBE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CreateSpriteAtEnd

	thumb_func_start CreateInvisibleSprite
CreateInvisibleSprite: @ 0x08006BCC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08006C04
	movs r1, #0
	movs r2, #0
	movs r3, #0x1f
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x40
	beq _08006C0C
	ldr r4, _08006C08
	lsls r1, r5, #4
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r2, r1, r4
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r3, #4
	orrs r0, r3
	strb r0, [r2]
	adds r4, #0x1c
	adds r1, r1, r4
	str r6, [r1]
	adds r0, r5, #0
	b _08006C0E
	.align 2, 0
_08006C04: .4byte 0x082BF314
_08006C08: .4byte 0x020205AC
_08006C0C:
	movs r0, #0x40
_08006C0E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end CreateInvisibleSprite

	thumb_func_start CreateSpriteAt
CreateSpriteAt: @ 0x08006C14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #4
	add r0, sl
	lsls r0, r0, #2
	ldr r1, _08006CD8
	adds r7, r0, r1
	adds r0, r7, #0
	bl ResetSprite
	adds r2, r7, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x3f
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r1, sb
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x43
	strb r4, [r0]
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r7]
	str r1, [r7, #4]
	mov r1, r8
	ldr r0, [r1, #8]
	str r0, [r7, #8]
	ldr r0, [r1, #0x10]
	str r0, [r7, #0x10]
	str r1, [r7, #0x14]
	ldr r0, [r1, #0x14]
	str r0, [r7, #0x1c]
	strh r5, [r7, #0x20]
	strh r6, [r7, #0x22]
	ldrb r3, [r7, #1]
	lsrs r1, r3, #6
	ldrb r2, [r7, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r7, #0
	bl CalcCenterToCornerVec
	mov r0, r8
	ldrh r1, [r0]
	ldr r4, _08006CDC
	lsrs r0, r4, #0x10
	cmp r1, r0
	bne _08006D10
	mov r1, r8
	ldr r0, [r1, #0xc]
	str r0, [r7, #0xc]
	ldrh r0, [r0, #4]
	lsrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl AllocSpriteTiles
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	asrs r1, r4, #0x10
	cmp r0, r1
	bne _08006CE0
	adds r0, r7, #0
	bl ResetSprite
	movs r0, #0x40
	b _08006D58
	.align 2, 0
_08006CD8: .4byte 0x020205AC
_08006CDC: .4byte 0xFFFF0000
_08006CE0:
	ldr r1, _08006D08
	adds r0, r1, #0
	ands r2, r0
	ldrh r1, [r7, #4]
	ldr r0, _08006D0C
	ands r0, r1
	orrs r0, r2
	strh r0, [r7, #4]
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, sb
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	b _08006D24
	.align 2, 0
_08006D08: .4byte 0x000003FF
_08006D0C: .4byte 0xFFFFFC00
_08006D10:
	mov r1, r8
	ldrh r0, [r1]
	bl GetSpriteTileStartByTag
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r0, r7, #0
	bl SetSpriteSheetFrameTileNum
_08006D24:
	ldrb r0, [r7, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08006D38
	adds r0, r7, #0
	bl InitSpriteAffineAnim
_08006D38:
	mov r0, r8
	ldrh r1, [r0, #2]
	ldr r0, _08006D68
	cmp r1, r0
	beq _08006D56
	mov r1, r8
	ldrh r0, [r1, #2]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #4
	ldrb r2, [r7, #5]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #5]
_08006D56:
	mov r0, sl
_08006D58:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006D68: .4byte 0x0000FFFF
	thumb_func_end CreateSpriteAt

	thumb_func_start CreateSpriteAndAnimate
CreateSpriteAndAnimate: @ 0x08006D6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	movs r3, #0
	ldr r5, _08006DDC
	lsls r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	mov r8, r2
_08006D8C:
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r6, r0, #2
	adds r4, r6, r5
	adds r7, r4, #0
	adds r7, #0x3e
	ldrb r0, [r7]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08006DE4
	mov r0, sb
	str r0, [sp]
	adds r0, r3, #0
	mov r1, sl
	mov r3, ip
	asrs r2, r3, #0x10
	mov r5, r8
	asrs r3, r5, #0x10
	bl CreateSpriteAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	cmp r5, #0x40
	beq _08006DEE
	ldr r1, _08006DE0
	adds r0, r6, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	ldrb r0, [r7]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08006DD8
	adds r0, r4, #0
	bl AnimateSprite
_08006DD8:
	adds r0, r5, #0
	b _08006DF0
	.align 2, 0
_08006DDC: .4byte 0x020205AC
_08006DE0: .4byte 0x020205C8
_08006DE4:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x3f
	bls _08006D8C
_08006DEE:
	movs r0, #0x40
_08006DF0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CreateSpriteAndAnimate

	thumb_func_start DestroySprite
DestroySprite: @ 0x08006E00
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08006E5C
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08006E56
	ldr r0, [r5, #0xc]
	ldrh r2, [r0, #4]
	lsrs r2, r2, #5
	ldrh r0, [r5, #4]
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x16
	adds r4, r1, r2
	adds r3, r1, #0
	cmp r3, r4
	bhs _08006E56
	ldr r0, _08006E64
	mov ip, r0
	movs r6, #7
	movs r7, #1
_08006E3A:
	lsrs r2, r3, #3
	add r2, ip
	adds r0, r3, #0
	ands r0, r6
	adds r1, r7, #0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blo _08006E3A
_08006E56:
	adds r0, r5, #0
	bl ResetSprite
_08006E5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006E64: .4byte 0x02021AB8
	thumb_func_end DestroySprite

	thumb_func_start ResetOamRange
ResetOamRange: @ 0x08006E68
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	bhs _08006E90
	ldr r6, _08006E98
	ldr r5, _08006E9C
_08006E7A:
	lsls r0, r3, #3
	adds r0, r0, r6
	ldr r1, [r5]
	ldr r2, [r5, #4]
	str r1, [r0]
	str r2, [r0, #4]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r4
	blo _08006E7A
_08006E90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006E98: .4byte 0x03002398
_08006E9C: .4byte 0x082BF2F8
	thumb_func_end ResetOamRange

	thumb_func_start LoadOam
LoadOam: @ 0x08006EA0
	push {lr}
	ldr r2, _08006EC4
	ldr r1, _08006EC8
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08006EC0
	adds r0, r2, #0
	adds r0, #0x38
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ldr r2, _08006ECC
	bl CpuSet
_08006EC0:
	pop {r0}
	bx r0
	.align 2, 0
_08006EC4: .4byte 0x03002360
_08006EC8: .4byte 0x00000439
_08006ECC: .4byte 0x04000100
	thumb_func_end LoadOam

	thumb_func_start ClearSpriteCopyRequests
ClearSpriteCopyRequests: @ 0x08006ED0
	push {r4, r5, lr}
	ldr r0, _08006F04
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08006F08
	strb r1, [r0]
	movs r2, #0
	ldr r4, _08006F0C
	movs r3, #0
	adds r5, r4, #4
_08006EE4:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r4
	str r3, [r1]
	adds r0, r0, r5
	str r3, [r0]
	strh r3, [r1, #8]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _08006EE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006F04: .4byte 0x020217B0
_08006F08: .4byte 0x020217B1
_08006F0C: .4byte 0x020217B4
	thumb_func_end ClearSpriteCopyRequests

	thumb_func_start ResetOamMatrices
ResetOamMatrices: @ 0x08006F10
	push {r4, lr}
	movs r1, #0
	ldr r4, _08006F38
	movs r3, #0
	movs r2, #0x80
	lsls r2, r2, #1
_08006F1C:
	lsls r0, r1, #3
	adds r0, r0, r4
	strh r2, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r2, [r0, #6]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1f
	bls _08006F1C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006F38: .4byte 0x02021B3C
	thumb_func_end ResetOamMatrices

	thumb_func_start SetOamMatrix
SetOamMatrix: @ 0x08006F3C
	push {r4, r5, lr}
	ldr r5, [sp, #0xc]
	lsls r0, r0, #0x18
	ldr r4, _08006F58
	lsrs r0, r0, #0x15
	adds r0, r0, r4
	strh r1, [r0]
	strh r2, [r0, #2]
	strh r3, [r0, #4]
	strh r5, [r0, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006F58: .4byte 0x02021B3C
	thumb_func_end SetOamMatrix

	thumb_func_start ResetSprite
ResetSprite: @ 0x08006F5C
	push {lr}
	ldr r1, _08006F6C
	movs r2, #0x44
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_08006F6C: .4byte 0x082BF2B4
	thumb_func_end ResetSprite

	thumb_func_start CalcCenterToCornerVec
CalcCenterToCornerVec: @ 0x08006F70
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r4, _08006FB0
	lsrs r2, r2, #0x17
	lsrs r1, r1, #0x15
	adds r2, r2, r1
	adds r0, r2, r4
	ldrb r5, [r0]
	adds r4, #1
	adds r2, r2, r4
	ldrb r1, [r2]
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	beq _08006F9E
	lsls r0, r5, #0x19
	lsrs r5, r0, #0x18
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_08006F9E:
	adds r0, r6, #0
	adds r0, #0x28
	strb r5, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006FB0: .4byte 0x082BF299
	thumb_func_end CalcCenterToCornerVec

	thumb_func_start AllocSpriteTiles
AllocSpriteTiles: @ 0x08006FB4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0800700A
	ldr r0, _08006FF8
	ldrh r3, [r0]
	ldr r0, _08006FFC
	cmp r3, r0
	bhi _08006FF2
	ldr r7, _08007000
	movs r6, #7
	adds r4, r0, #0
	movs r5, #1
_08006FD6:
	lsrs r2, r3, #3
	adds r2, r2, r7
	adds r0, r3, #0
	ands r0, r6
	adds r1, r5, #0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	bls _08006FD6
_08006FF2:
	movs r0, #0
	b _080070BC
	.align 2, 0
_08006FF8: .4byte 0x02021AB6
_08006FFC: .4byte 0x000003FF
_08007000: .4byte 0x02021AB8
_08007004:
	movs r0, #1
	rsbs r0, r0, #0
	b _080070BC
_0800700A:
	ldr r0, _080070C8
	ldrh r3, [r0]
	ldr r0, _080070CC
	mov sb, r0
	movs r7, #7
	movs r6, #1
_08007016:
	lsrs r0, r3, #3
	add r0, sb
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, #0
	beq _0800704A
	movs r5, #0x80
	lsls r5, r5, #3
	ldr r2, _080070CC
_0800702E:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r5
	beq _08007004
	lsrs r0, r0, #0x13
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, #0
	bne _0800702E
_0800704A:
	mov r8, r3
	movs r2, #1
	cmp r2, r4
	beq _08007084
	movs r1, #0x80
	lsls r1, r1, #3
	mov ip, r1
	ldr r5, _080070CC
_0800705A:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, ip
	beq _08007004
	lsrs r0, r0, #0x13
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, #0
	bne _08007080
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r4
	bne _0800705A
_08007080:
	cmp r2, r4
	bne _08007016
_08007084:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	asrs r1, r0, #0x10
	adds r1, r4, r1
	adds r6, r0, #0
	cmp r3, r1
	bge _080070BA
	ldr r0, _080070CC
	mov r8, r0
	movs r7, #7
	adds r4, r1, #0
	movs r5, #1
_0800709E:
	lsrs r2, r3, #3
	add r2, r8
	adds r1, r3, #0
	ands r1, r7
	adds r0, r5, #0
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blt _0800709E
_080070BA:
	asrs r0, r6, #0x10
_080070BC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080070C8: .4byte 0x02021AB6
_080070CC: .4byte 0x02021AB8
	thumb_func_end AllocSpriteTiles

	thumb_func_start SpriteTileAllocBitmapOp
SpriteTileAllocBitmapOp: @ 0x080070D0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x13
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r6, r3, #0
	movs r0, #7
	ands r2, r0
	adds r4, r2, #0
	movs r5, #0
	cmp r1, #0
	bne _08007108
	movs r0, #1
	lsls r0, r2
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08007104
	adds r0, r3, r0
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _08007134
	.align 2, 0
_08007104: .4byte 0x02021AB8
_08007108:
	cmp r1, #1
	bne _08007124
	lsls r1, r2
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08007120
	adds r0, r3, r0
	ldrb r1, [r0]
	orrs r2, r1
	strb r2, [r0]
	b _08007134
	.align 2, 0
_08007120: .4byte 0x02021AB8
_08007124:
	movs r0, #0x80
	lsls r0, r0, #0x11
	lsls r0, r4
	lsrs r5, r0, #0x18
	ldr r0, _0800713C
	adds r0, r6, r0
	ldrb r0, [r0]
	ands r5, r0
_08007134:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800713C: .4byte 0x02021AB8
	thumb_func_end SpriteTileAllocBitmapOp

	thumb_func_start SpriteCallbackDummy
SpriteCallbackDummy: @ 0x08007140
	bx lr
	.align 2, 0
	thumb_func_end SpriteCallbackDummy

	thumb_func_start ProcessSpriteCopyRequests
ProcessSpriteCopyRequests: @ 0x08007144
	push {r4, r5, r6, r7, lr}
	ldr r0, _08007194
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800718C
	movs r4, #0
	ldr r1, _08007198
	ldrb r0, [r1]
	cmp r0, #0
	beq _08007186
	ldr r6, _0800719C
	adds r7, r6, #4
	adds r5, r1, #0
_0800715E:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r2, r1, r6
	ldr r0, [r2]
	adds r1, r1, r7
	ldr r1, [r1]
	ldrh r2, [r2, #8]
	lsrs r2, r2, #1
	bl CpuSet
	ldrb r1, [r5]
	subs r1, #1
	strb r1, [r5]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _0800715E
_08007186:
	ldr r1, _08007194
	movs r0, #0
	strb r0, [r1]
_0800718C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007194: .4byte 0x020217B0
_08007198: .4byte 0x020217B1
_0800719C: .4byte 0x020217B4
	thumb_func_end ProcessSpriteCopyRequests

	thumb_func_start RequestSpriteFrameImageCopy
RequestSpriteFrameImageCopy: @ 0x080071A0
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r4, _080071F8
	ldrb r0, [r4]
	cmp r0, #0x3f
	bhi _080071F0
	ldr r3, _080071FC
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	lsls r2, r2, #3
	adds r2, r2, r5
	ldr r1, [r2]
	str r1, [r0]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r3, #4
	adds r1, r1, r0
	lsls r0, r6, #5
	ldr r5, _08007200
	adds r0, r0, r5
	str r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r2, #4]
	strh r1, [r0, #8]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_080071F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080071F8: .4byte 0x020217B1
_080071FC: .4byte 0x020217B4
_08007200: .4byte 0x06010000
	thumb_func_end RequestSpriteFrameImageCopy

	thumb_func_start RequestSpriteCopy
RequestSpriteCopy: @ 0x08007204
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r3, _0800724C
	ldrb r0, [r3]
	cmp r0, #0x3f
	bhi _08007244
	ldr r2, _08007250
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	str r4, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #4
	adds r0, r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r6, [r0, #8]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_08007244:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800724C: .4byte 0x020217B1
_08007250: .4byte 0x020217B4
	thumb_func_end RequestSpriteCopy

	thumb_func_start CopyFromSprites
CopyFromSprites: @ 0x08007254
	push {r4, lr}
	adds r1, r0, #0
	ldr r3, _08007274
	movs r2, #0
	ldr r4, _08007278
_0800725E:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	adds r2, #1
	cmp r2, r4
	bls _0800725E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007274: .4byte 0x020205AC
_08007278: .4byte 0x000010FF
	thumb_func_end CopyFromSprites

	thumb_func_start CopyToSprites
CopyToSprites: @ 0x0800727C
	push {r4, lr}
	adds r1, r0, #0
	ldr r3, _0800729C
	movs r2, #0
	ldr r4, _080072A0
_08007286:
	ldrb r0, [r1]
	strb r0, [r3]
	adds r1, #1
	adds r3, #1
	adds r2, #1
	cmp r2, r4
	bls _08007286
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800729C: .4byte 0x020205AC
_080072A0: .4byte 0x000010FF
	thumb_func_end CopyToSprites

	thumb_func_start ResetAllSprites
ResetAllSprites: @ 0x080072A4
	push {r4, r5, lr}
	movs r4, #0
_080072A8:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r5, _080072D8
	adds r0, r0, r5
	bl ResetSprite
	ldr r0, _080072DC
	adds r0, r4, r0
	strb r4, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3f
	bls _080072A8
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	bl ResetSprite
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080072D8: .4byte 0x020205AC
_080072DC: .4byte 0x02021770
	thumb_func_end ResetAllSprites

	thumb_func_start FreeSpriteTiles
FreeSpriteTiles: @ 0x080072E0
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r2]
	ldr r0, _080072F8
	cmp r1, r0
	beq _080072F2
	adds r0, r1, #0
	bl FreeSpriteTilesByTag
_080072F2:
	pop {r0}
	bx r0
	.align 2, 0
_080072F8: .4byte 0x0000FFFF
	thumb_func_end FreeSpriteTiles

	thumb_func_start FreeSpritePalette
FreeSpritePalette: @ 0x080072FC
	push {lr}
	ldr r0, [r0, #0x14]
	ldrh r0, [r0, #2]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FreeSpritePalette

	thumb_func_start FreeSpriteOamMatrix
FreeSpriteOamMatrix: @ 0x0800730C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08007332
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
_08007332:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FreeSpriteOamMatrix

	thumb_func_start DestroySpriteAndFreeResources
DestroySpriteAndFreeResources: @ 0x08007338
	push {r4, lr}
	adds r4, r0, #0
	bl FreeSpriteTiles
	adds r0, r4, #0
	bl FreeSpritePalette
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroySpriteAndFreeResources

	thumb_func_start AnimateSprite
AnimateSprite: @ 0x08007358
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08007394
	adds r5, r4, #0
	adds r5, #0x3f
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, _08007398
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800738E
	ldr r0, _0800739C
	ldrb r1, [r5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
_0800738E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007394: .4byte 0x082BF32C
_08007398: .4byte 0x02021C3C
_0800739C: .4byte 0x082BF334
	thumb_func_end AnimateSprite

	thumb_func_start BeginAnim
BeginAnim: @ 0x080073A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x2b
	movs r2, #0
	strb r2, [r3]
	adds r5, r4, #0
	adds r5, #0x3f
	ldrb r1, [r5]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x2d
	strb r2, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	ldrb r1, [r2]
	ldr r0, [r4, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	mov sb, r0
	lsls r0, r0, #0x10
	mov r8, r0
	asrs r1, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08007484
	ldrb r1, [r5]
	subs r0, #4
	ands r0, r1
	strb r0, [r5]
	ldrb r1, [r2]
	ldr r0, [r4, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r0, #0xa
	lsrs r3, r1, #0x1a
	lsls r1, r0, #9
	lsrs r7, r1, #0x1f
	lsls r0, r0, #8
	lsrs r6, r0, #0x1f
	cmp r3, #0
	beq _0800741C
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0800741C:
	adds r2, r4, #0
	adds r2, #0x2c
	movs r0, #0x3f
	ands r3, r0
	ldrb r1, [r2]
	subs r0, #0x7f
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08007446
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl SetSpriteOamFlipBits
_08007446:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08007474
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	add r1, sb
	ldr r2, _0800746C
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _08007470
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	b _08007484
	.align 2, 0
_0800746C: .4byte 0x000003FF
_08007470: .4byte 0xFFFFFC00
_08007474:
	mov r1, r8
	lsrs r0, r1, #0x10
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldr r2, [r4, #0xc]
	bl RequestSpriteFrameImageCopy
_08007484:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end BeginAnim

	thumb_func_start ContinueAnim
ContinueAnim: @ 0x08007490
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	beq _080074E0
	adds r0, r4, #0
	bl DecrementAnimDelayCounter
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	ldr r0, [r4, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r0, #9
	lsrs r3, r1, #0x1f
	lsls r0, r0, #8
	lsrs r2, r0, #0x1f
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08007526
	adds r0, r4, #0
	adds r1, r3, #0
	bl SetSpriteOamFlipBits
	b _08007526
_080074E0:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08007526
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	ldr r1, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #3
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _08007516
	adds r0, #3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08007516:
	ldr r0, _0800752C
	lsls r1, r2, #0x10
	asrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
_08007526:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800752C: .4byte 0x082BF33C
	thumb_func_end ContinueAnim

	thumb_func_start AnimCmd_frame
AnimCmd_frame: @ 0x08007530
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	ldr r0, [r4, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r7, [r0]
	mov r8, r7
	ldr r0, [r0]
	lsls r1, r0, #0xa
	lsrs r3, r1, #0x1a
	lsls r1, r0, #9
	lsrs r6, r1, #0x1f
	lsls r0, r0, #8
	lsrs r5, r0, #0x1f
	cmp r3, #0
	beq _0800756A
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0800756A:
	adds r2, r4, #0
	adds r2, #0x2c
	movs r0, #0x3f
	ands r3, r0
	ldrb r1, [r2]
	subs r0, #0x7f
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08007594
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl SetSpriteOamFlipBits
_08007594:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080075C4
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r1, r1, r7
	ldr r2, _080075BC
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _080075C0
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	b _080075D2
	.align 2, 0
_080075BC: .4byte 0x000003FF
_080075C0: .4byte 0xFFFFFC00
_080075C4:
	mov r0, r8
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldr r2, [r4, #0xc]
	bl RequestSpriteFrameImageCopy
_080075D2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AnimCmd_frame

	thumb_func_start AnimCmd_end
AnimCmd_end: @ 0x080075DC
	adds r2, r0, #0
	adds r2, #0x2b
	ldrb r1, [r2]
	subs r1, #1
	strb r1, [r2]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end AnimCmd_end

	thumb_func_start AnimCmd_jump
AnimCmd_jump: @ 0x080075F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x2a
	ldrb r1, [r3]
	ldr r0, [r4, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x1a
	strb r0, [r2]
	ldrb r0, [r3]
	ldr r1, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r7, [r1]
	mov r8, r7
	ldr r0, [r1]
	lsls r1, r0, #0xa
	lsrs r3, r1, #0x1a
	lsls r1, r0, #9
	lsrs r6, r1, #0x1f
	lsls r0, r0, #8
	lsrs r5, r0, #0x1f
	cmp r3, #0
	beq _08007648
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_08007648:
	adds r2, r4, #0
	adds r2, #0x2c
	movs r0, #0x3f
	ands r3, r0
	ldrb r1, [r2]
	subs r0, #0x7f
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08007672
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl SetSpriteOamFlipBits
_08007672:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080076A4
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r1, r1, r7
	ldr r2, _0800769C
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _080076A0
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	b _080076B2
	.align 2, 0
_0800769C: .4byte 0x000003FF
_080076A0: .4byte 0xFFFFFC00
_080076A4:
	mov r0, r8
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldr r2, [r4, #0xc]
	bl RequestSpriteFrameImageCopy
_080076B2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end AnimCmd_jump

	thumb_func_start AnimCmd_loop
AnimCmd_loop: @ 0x080076BC
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080076D0
	adds r0, r1, #0
	bl ContinueAnimLoop
	b _080076D6
_080076D0:
	adds r0, r1, #0
	bl BeginAnimLoop
_080076D6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AnimCmd_loop

	thumb_func_start BeginAnimLoop
BeginAnimLoop: @ 0x080076DC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	ldr r0, [r4, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x1a
	adds r1, r4, #0
	adds r1, #0x2d
	strb r0, [r1]
	adds r0, r4, #0
	bl JumpToTopOfAnimLoop
	adds r0, r4, #0
	bl ContinueAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BeginAnimLoop

	thumb_func_start ContinueAnimLoop
ContinueAnimLoop: @ 0x08007714
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl JumpToTopOfAnimLoop
	adds r0, r4, #0
	bl ContinueAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContinueAnimLoop

	thumb_func_start JumpToTopOfAnimLoop
JumpToTopOfAnimLoop: @ 0x08007734
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080077A0
	mov r3, ip
	adds r3, #0x2b
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	mov r5, ip
	adds r5, #0x2a
	ldrb r1, [r5]
	mov r2, ip
	ldr r0, [r2, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	subs r0, #4
	movs r7, #0
	ldrsh r0, [r0, r7]
	movs r1, #3
	rsbs r1, r1, #0
	adds r4, r3, #0
	cmp r0, r1
	beq _0800779A
	adds r6, r1, #0
	adds r2, r4, #0
_08007774:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0800779A
	subs r0, #1
	strb r0, [r3]
	ldrb r1, [r5]
	mov r7, ip
	ldr r0, [r7, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	subs r0, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r6
	bne _08007774
_0800779A:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
_080077A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end JumpToTopOfAnimLoop

	thumb_func_start BeginAffineAnim
BeginAffineAnim: @ 0x080077A8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldrb r0, [r6, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800782A
	ldr r0, [r6, #0x10]
	ldr r0, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08007834
	cmp r1, r0
	beq _0800782A
	adds r0, r6, #0
	bl GetSpriteMatrixNum
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl AffineAnimStateRestartAnim
	mov r5, sp
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r7, r6, #0
	adds r7, #0x3f
	ldrb r1, [r7]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	adds r0, r4, #0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldr r1, _08007838
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r5, #5]
	strb r1, [r0, #2]
	ldrb r1, [r7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800782A
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r0, #0x3c
	ldrsh r2, [r6, r0]
	adds r0, r6, #0
	bl obj_update_pos2
_0800782A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007834: .4byte 0x00007FFF
_08007838: .4byte 0x03000B70
	thumb_func_end BeginAffineAnim

	thumb_func_start ContinueAffineAnim
ContinueAffineAnim: @ 0x0800783C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080078DE
	adds r0, r4, #0
	bl GetSpriteMatrixNum
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r5, r2, #0
	ldr r1, _08007874
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _08007878
	adds r0, r2, #0
	adds r1, r4, #0
	bl AffineAnimDelay
	b _080078C2
	.align 2, 0
_08007874: .4byte 0x03000B70
_08007878:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080078DE
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrb r0, [r3]
	ldr r1, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r3, #1]
	ldr r0, [r0]
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #3
	movs r0, #0
	ldrsh r1, [r1, r0]
	ldr r0, _080078E4
	cmp r1, r0
	ble _080078B0
	ldr r2, _080078E8
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080078B0:
	ldr r0, _080078EC
	lsls r1, r2, #0x10
	asrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r2
_080078C2:
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080078DE
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	bl obj_update_pos2
_080078DE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080078E4: .4byte 0x00007FFC
_080078E8: .4byte 0xFFFF8003
_080078EC: .4byte 0x082BF34C
	thumb_func_end ContinueAffineAnim

	thumb_func_start AffineAnimDelay
AffineAnimDelay: @ 0x080078F0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl DecrementAffineAnimDelayCounter
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800791A
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r4, #0
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
_0800791A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end AffineAnimDelay

	thumb_func_start AffineAnimCmd_loop
AffineAnimCmd_loop: @ 0x08007924
	push {lr}
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08007948
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0800794C
	adds r0, r2, #0
	adds r1, r3, #0
	bl ContinueAffineAnimLoop
	b _08007954
	.align 2, 0
_08007948: .4byte 0x03000B70
_0800794C:
	adds r0, r2, #0
	adds r1, r3, #0
	bl BeginAffineAnimLoop
_08007954:
	pop {r0}
	bx r0
	thumb_func_end AffineAnimCmd_loop

	thumb_func_start BeginAffineAnimLoop
BeginAffineAnimLoop: @ 0x08007958
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08007990
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r3, r3, r1
	ldrb r2, [r3]
	ldr r1, [r4, #0x10]
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r1, [r3, #1]
	ldr r2, [r2]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r1, [r1, #2]
	strb r1, [r3, #3]
	adds r1, r4, #0
	bl JumpToTopOfAffineAnimLoop
	adds r0, r4, #0
	bl ContinueAffineAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007990: .4byte 0x03000B70
	thumb_func_end BeginAffineAnimLoop

	thumb_func_start ContinueAffineAnimLoop
ContinueAffineAnimLoop: @ 0x08007994
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080079C0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #3]
	subs r2, #1
	strb r2, [r1, #3]
	adds r1, r4, #0
	bl JumpToTopOfAffineAnimLoop
	adds r0, r4, #0
	bl ContinueAffineAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080079C0: .4byte 0x03000B70
	thumb_func_end ContinueAffineAnimLoop

	thumb_func_start JumpToTopOfAffineAnimLoop
JumpToTopOfAffineAnimLoop: @ 0x080079C4
	push {r4, r5, r6, r7, lr}
	mov ip, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080079E8
	lsls r3, r5, #1
	adds r0, r3, r5
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r0, [r2, #3]
	adds r6, r1, #0
	cmp r0, #0
	beq _08007A24
	ldrb r0, [r2, #1]
	subs r0, #1
	strb r0, [r2, #1]
	adds r4, r3, #0
	b _080079F4
	.align 2, 0
_080079E8: .4byte 0x03000B70
_080079EC:
	cmp r2, #0
	beq _08007A18
	subs r0, r2, #1
	strb r0, [r3, #1]
_080079F4:
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r3, r0, r6
	ldrb r0, [r3]
	mov r2, ip
	ldr r1, [r2, #0x10]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r3, #1]
	ldr r1, [r0]
	lsls r0, r2, #3
	adds r0, r0, r1
	subs r0, #8
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08007A2C
	cmp r1, r0
	bne _080079EC
_08007A18:
	adds r1, r4, r5
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
_08007A24:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007A2C: .4byte 0x00007FFD
	thumb_func_end JumpToTopOfAffineAnimLoop

	thumb_func_start AffineAnimCmd_jump
AffineAnimCmd_jump: @ 0x08007A30
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08007A78
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r2, [r4]
	ldr r0, [r1, #0x10]
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrb r0, [r4, #1]
	ldr r2, [r2]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	strb r0, [r4, #1]
	mov r6, sp
	adds r0, r5, #0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r5, #0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldrb r0, [r6, #5]
	strb r0, [r4, #2]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007A78: .4byte 0x03000B70
	thumb_func_end AffineAnimCmd_jump

	thumb_func_start AffineAnimCmd_end
AffineAnimCmd_end: @ 0x08007A7C
	push {lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	movs r3, #0
	str r2, [sp]
	str r3, [sp, #4]
	adds r1, #0x3f
	ldrb r2, [r1]
	movs r3, #0x20
	orrs r2, r3
	strb r2, [r1]
	ldr r2, _08007AB4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #1]
	subs r2, #1
	strb r2, [r1, #1]
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08007AB4: .4byte 0x03000B70
	thumb_func_end AffineAnimCmd_end

	thumb_func_start AffineAnimCmd_frame
AffineAnimCmd_frame: @ 0x08007AB8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r5, sp
	adds r0, r4, #0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r4, #0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldr r1, _08007AEC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r5, #5]
	strb r1, [r0, #2]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007AEC: .4byte 0x03000B70
	thumb_func_end AffineAnimCmd_frame

	thumb_func_start CopyOamMatrix
CopyOamMatrix: @ 0x08007AF0
	lsls r0, r0, #0x18
	ldr r2, _08007B0C
	lsrs r0, r0, #0x15
	adds r0, r0, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	strh r2, [r0, #4]
	ldrh r1, [r1, #6]
	strh r1, [r0, #6]
	bx lr
	.align 2, 0
_08007B0C: .4byte 0x02021B3C
	thumb_func_end CopyOamMatrix

	thumb_func_start GetSpriteMatrixNum
GetSpriteMatrixNum: @ 0x08007B10
	push {lr}
	adds r2, r0, #0
	movs r3, #0
	ldrb r0, [r2, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08007B2A
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x1a
	lsrs r3, r0, #0x1b
_08007B2A:
	adds r0, r3, #0
	pop {r1}
	bx r1
	thumb_func_end GetSpriteMatrixNum

	thumb_func_start sub_08007B30
sub_08007B30: @ 0x08007B30
	strh r1, [r0, #0x3a]
	strh r2, [r0, #0x3c]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_08007B30

	thumb_func_start sub_08007B40
sub_08007B40: @ 0x08007B40
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r2, #0
	subs r0, r1, r3
	cmp r0, #0
	bge _08007B52
	rsbs r0, r0, #0
	asrs r4, r0, #9
	b _08007B56
_08007B52:
	asrs r0, r0, #9
	rsbs r4, r0, #0
_08007B56:
	adds r0, r5, #0
	muls r0, r1, r0
	adds r1, r3, #0
	bl __udivsi3
	adds r0, r0, r4
	subs r0, r5, r0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08007B40

	thumb_func_start obj_update_pos2
obj_update_pos2: @ 0x08007B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldrb r1, [r5, #3]
	lsls r0, r1, #0x1a
	lsrs r7, r0, #0x1b
	movs r0, #0x80
	lsls r0, r0, #4
	mov sb, r0
	cmp r6, sb
	beq _08007BBA
	ldr r2, _08007C00
	lsrs r1, r1, #6
	lsls r1, r1, #3
	ldrb r0, [r5, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r0, [r1]
	lsls r4, r0, #8
	lsls r0, r0, #0x10
	ldr r2, _08007C04
	lsls r1, r7, #3
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r6, #0
	bl sub_08007B40
	strh r0, [r5, #0x24]
_08007BBA:
	cmp r8, sb
	beq _08007BF2
	ldr r2, _08007C00
	ldrb r1, [r5, #3]
	lsrs r1, r1, #6
	lsls r1, r1, #3
	ldrb r0, [r5, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	lsls r4, r0, #8
	lsls r0, r0, #0x10
	ldr r2, _08007C04
	lsls r1, r7, #3
	adds r1, r1, r2
	movs r2, #6
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, r8
	bl sub_08007B40
	strh r0, [r5, #0x26]
_08007BF2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007C00: .4byte 0x082BF35C
_08007C04: .4byte 0x02021B3C
	thumb_func_end obj_update_pos2

	thumb_func_start SetSpriteOamFlipBits
SetSpriteOamFlipBits: @ 0x08007C08
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r6, [r0, #3]
	lsls r3, r6, #0x1a
	lsrs r3, r3, #0x1b
	movs r4, #7
	ands r3, r4
	lsls r3, r3, #1
	subs r4, #0x46
	mov r8, r4
	mov r5, r8
	ands r5, r6
	orrs r5, r3
	strb r5, [r0, #3]
	lsls r4, r5, #0x1a
	lsrs r4, r4, #0x1b
	movs r6, #0x3f
	adds r6, r6, r0
	mov ip, r6
	ldrb r3, [r6]
	lsls r3, r3, #0x1f
	lsrs r3, r3, #0x1f
	eors r1, r3
	movs r6, #1
	ands r1, r6
	lsls r1, r1, #3
	orrs r4, r1
	lsls r4, r4, #1
	mov r3, r8
	ands r3, r5
	orrs r3, r4
	strb r3, [r0, #3]
	lsls r4, r3, #0x1a
	lsrs r4, r4, #0x1b
	mov r5, ip
	ldrb r1, [r5]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	eors r2, r1
	ands r2, r6
	lsls r2, r2, #4
	orrs r4, r2
	lsls r4, r4, #1
	mov r6, r8
	ands r3, r6
	orrs r3, r4
	strb r3, [r0, #3]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetSpriteOamFlipBits

	thumb_func_start AffineAnimStateRestartAnim
AffineAnimStateRestartAnim: @ 0x08007C7C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08007C94
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
_08007C94: .4byte 0x03000B70
	thumb_func_end AffineAnimStateRestartAnim

	thumb_func_start AffineAnimStateStartAnim
AffineAnimStateStartAnim: @ 0x08007C98
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08007CBC
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	movs r3, #0
	strb r1, [r2]
	strb r3, [r2, #1]
	strb r3, [r2, #2]
	strb r3, [r2, #3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #4]
	strh r0, [r2, #6]
	strh r3, [r2, #8]
	bx lr
	.align 2, 0
_08007CBC: .4byte 0x03000B70
	thumb_func_end AffineAnimStateStartAnim

	thumb_func_start AffineAnimStateReset
AffineAnimStateReset: @ 0x08007CC0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08007CE4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	strh r0, [r1, #8]
	bx lr
	.align 2, 0
_08007CE4: .4byte 0x03000B70
	thumb_func_end AffineAnimStateReset

	thumb_func_start ApplyAffineAnimFrameAbsolute
ApplyAffineAnimFrameAbsolute: @ 0x08007CE8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08007D08
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r0, [r1]
	strh r0, [r2, #4]
	ldrh r0, [r1, #2]
	strh r0, [r2, #6]
	ldrb r0, [r1, #4]
	lsls r0, r0, #8
	strh r0, [r2, #8]
	bx lr
	.align 2, 0
_08007D08: .4byte 0x03000B70
	thumb_func_end ApplyAffineAnimFrameAbsolute

	thumb_func_start DecrementAnimDelayCounter
DecrementAnimDelayCounter: @ 0x08007D0C
	push {lr}
	adds r3, r0, #0
	adds r3, #0x2c
	ldrb r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08007D30
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1a
	subs r0, #1
	movs r1, #0x3f
	ands r0, r1
	movs r1, #0x40
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08007D30:
	pop {r0}
	bx r0
	thumb_func_end DecrementAnimDelayCounter

	thumb_func_start DecrementAffineAnimDelayCounter
DecrementAffineAnimDelayCounter: @ 0x08007D34
	push {lr}
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	adds r3, r0, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08007D58
	ldr r0, _08007D60
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	subs r0, #1
	strb r0, [r1, #2]
_08007D58:
	ldrb r0, [r3]
	lsrs r0, r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08007D60: .4byte 0x03000B70
	thumb_func_end DecrementAffineAnimDelayCounter

	thumb_func_start ApplyAffineAnimFrameRelativeAndUpdateMatrix
ApplyAffineAnimFrameRelativeAndUpdateMatrix: @ 0x08007D64
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08007DEC
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r1]
	ldrh r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	ldrh r0, [r1, #2]
	ldrh r2, [r4, #6]
	adds r0, r0, r2
	strh r0, [r4, #6]
	ldrb r0, [r1, #4]
	lsls r0, r0, #8
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	ldr r2, _08007DF0
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	bl ConvertScaleParam
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r6, _08007DF4
	ldr r1, [sp]
	ands r1, r6
	orrs r1, r0
	str r1, [sp]
	movs r2, #6
	ldrsh r0, [r4, r2]
	bl ConvertScaleParam
	lsls r0, r0, #0x10
	ldr r2, _08007DF8
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldrh r1, [r4, #8]
	ldr r0, [sp, #4]
	ands r0, r6
	orrs r0, r1
	str r0, [sp, #4]
	add r4, sp, #8
	mov r0, sp
	adds r1, r4, #0
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	adds r0, r5, #0
	adds r1, r4, #0
	bl CopyOamMatrix
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007DEC: .4byte 0x03000B70
_08007DF0: .4byte 0xFFFFFF00
_08007DF4: .4byte 0xFFFF0000
_08007DF8: .4byte 0x0000FFFF
	thumb_func_end ApplyAffineAnimFrameRelativeAndUpdateMatrix

	thumb_func_start ConvertScaleParam
ConvertScaleParam: @ 0x08007DFC
	push {lr}
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	thumb_func_end ConvertScaleParam

	thumb_func_start GetAffineAnimFrame
GetAffineAnimFrame: @ 0x08007E14
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08007E7C
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r3
	ldrb r3, [r4]
	ldr r0, [r1, #0x10]
	lsls r3, r3, #2
	adds r3, r3, r0
	ldrb r0, [r4, #1]
	ldr r3, [r3]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r3, [r4]
	ldr r0, [r1, #0x10]
	lsls r3, r3, #2
	adds r3, r3, r0
	ldrb r0, [r4, #1]
	ldr r3, [r3]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r2, #2]
	ldrb r3, [r4]
	ldr r0, [r1, #0x10]
	lsls r3, r3, #2
	adds r3, r3, r0
	ldrb r0, [r4, #1]
	ldr r3, [r3]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	strb r0, [r2, #4]
	ldrb r3, [r4]
	ldr r0, [r1, #0x10]
	lsls r3, r3, #2
	adds r3, r3, r0
	ldrb r0, [r4, #1]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #5]
	strb r0, [r2, #5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007E7C: .4byte 0x03000B70
	thumb_func_end GetAffineAnimFrame

	thumb_func_start ApplyAffineAnimFrame
ApplyAffineAnimFrame: @ 0x08007E80
	push {r4, lr}
	sub sp, #8
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldrb r0, [r2, #5]
	cmp r0, #0
	beq _08007EA6
	subs r0, #1
	strb r0, [r2, #5]
	adds r0, r4, #0
	adds r1, r2, #0
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
	b _08007EB6
_08007EA6:
	adds r0, r4, #0
	adds r1, r2, #0
	bl ApplyAffineAnimFrameAbsolute
	adds r0, r4, #0
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
_08007EB6:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ApplyAffineAnimFrame

	thumb_func_start StartSpriteAnim
StartSpriteAnim: @ 0x08007EC0
	adds r2, r0, #0
	adds r2, #0x2a
	strb r1, [r2]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end StartSpriteAnim

	thumb_func_start StartSpriteAnimIfDifferent
StartSpriteAnimIfDifferent: @ 0x08007ED8
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r1
	beq _08007EEE
	adds r0, r2, #0
	bl StartSpriteAnim
_08007EEE:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartSpriteAnimIfDifferent

	thumb_func_start SeekSpriteAnim
SeekSpriteAnim: @ 0x08007EF4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r4, r3, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	lsls r0, r0, #0x19
	lsrs r6, r0, #0x1f
	subs r1, #1
	adds r0, r3, #0
	adds r0, #0x2b
	strb r1, [r0]
	ldrb r1, [r4]
	movs r7, #0x40
	rsbs r7, r7, #0
	adds r0, r7, #0
	ands r0, r1
	strb r0, [r4]
	adds r2, r3, #0
	adds r2, #0x3f
	ldrb r1, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	movs r5, #0x41
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4]
	adds r0, r3, #0
	bl ContinueAnim
	ldrb r2, [r4]
	movs r0, #0x3f
	ands r0, r2
	cmp r0, #0
	beq _08007F5C
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1a
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	adds r1, r7, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
_08007F5C:
	lsls r2, r6, #6
	ldrb r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SeekSpriteAnim

	thumb_func_start StartSpriteAffineAnim
StartSpriteAffineAnim: @ 0x08007F70
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl GetSpriteMatrixNum
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl AffineAnimStateStartAnim
	adds r5, #0x3f
	ldrb r0, [r5]
	movs r1, #8
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end StartSpriteAffineAnim

	thumb_func_start StartSpriteAffineAnimIfDifferent
StartSpriteAffineAnimIfDifferent: @ 0x08007F9C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl GetSpriteMatrixNum
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08007FCC
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, r4
	beq _08007FC4
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartSpriteAffineAnim
_08007FC4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007FCC: .4byte 0x03000B70
	thumb_func_end StartSpriteAffineAnimIfDifferent

	thumb_func_start ChangeSpriteAffineAnim
ChangeSpriteAffineAnim: @ 0x08007FD0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl GetSpriteMatrixNum
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08008004
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	strb r4, [r1]
	adds r5, #0x3f
	ldrb r0, [r5]
	movs r1, #8
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008004: .4byte 0x03000B70
	thumb_func_end ChangeSpriteAffineAnim

	thumb_func_start ChangeSpriteAffineAnimIfDifferent
ChangeSpriteAffineAnimIfDifferent: @ 0x08008008
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl GetSpriteMatrixNum
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08008038
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	cmp r0, r4
	beq _08008030
	adds r0, r5, #0
	adds r1, r4, #0
	bl ChangeSpriteAffineAnim
_08008030:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008038: .4byte 0x03000B70
	thumb_func_end ChangeSpriteAffineAnimIfDifferent

	thumb_func_start SetSpriteSheetFrameTileNum
SetSpriteSheetFrameTileNum: @ 0x0800803C
	push {lr}
	adds r3, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08008088
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	ldr r0, [r3, #8]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08008070
	movs r2, #0
_08008070:
	adds r0, r3, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r1, r1, r2
	ldr r2, _0800808C
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #4]
	ldr r0, _08008090
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_08008088:
	pop {r0}
	bx r0
	.align 2, 0
_0800808C: .4byte 0x000003FF
_08008090: .4byte 0xFFFFFC00
	thumb_func_end SetSpriteSheetFrameTileNum

	thumb_func_start ResetAffineAnimData
ResetAffineAnimData: @ 0x08008094
	push {r4, lr}
	ldr r1, _080080C0
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080080C4
	movs r0, #0
	str r0, [r1]
	bl ResetOamMatrices
	movs r4, #0
_080080A8:
	adds r0, r4, #0
	bl AffineAnimStateReset
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _080080A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080080C0: .4byte 0x02021C3C
_080080C4: .4byte 0x030030B8
	thumb_func_end ResetAffineAnimData

	thumb_func_start AllocOamMatrix
AllocOamMatrix: @ 0x080080C8
	push {r4, lr}
	movs r2, #0
	movs r1, #1
	ldr r0, _080080E8
	ldr r4, [r0]
	adds r3, r0, #0
_080080D4:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080080EC
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r0, r2, #0
	b _080080FA
	.align 2, 0
_080080E8: .4byte 0x030030B8
_080080EC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #1
	cmp r2, #0x1f
	bls _080080D4
	movs r0, #0xff
_080080FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AllocOamMatrix

	thumb_func_start FreeOamMatrix
FreeOamMatrix: @ 0x08008100
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0
	movs r1, #1
	ldr r3, _0800813C
	cmp r0, r2
	bhs _0800811E
_08008112:
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #1
	cmp r0, r2
	blo _08008112
_0800811E:
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl SetOamMatrix
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0800813C: .4byte 0x030030B8
	thumb_func_end FreeOamMatrix

	thumb_func_start InitSpriteAffineAnim
InitSpriteAffineAnim: @ 0x08008140
	push {r4, r5, lr}
	adds r4, r0, #0
	bl AllocOamMatrix
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xff
	beq _08008188
	ldrb r3, [r4, #1]
	lsrs r1, r3, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r0, r4, #0
	bl CalcCenterToCornerVec
	movs r0, #0x1f
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	adds r2, r4, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl AffineAnimStateReset
_08008188:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitSpriteAffineAnim

	thumb_func_start SetOamMatrixRotationScaling
SetOamMatrixRotationScaling: @ 0x08008190
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r6, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl ConvertScaleParam
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08008208
	mov r8, r1
	ldr r1, [sp]
	mov r2, r8
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl ConvertScaleParam
	lsls r0, r0, #0x10
	ldr r2, _0800820C
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldr r0, [sp, #4]
	mov r1, r8
	ands r0, r1
	orrs r0, r5
	str r0, [sp, #4]
	add r4, sp, #8
	mov r0, sp
	adds r1, r4, #0
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl CopyOamMatrix
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008208: .4byte 0xFFFF0000
_0800820C: .4byte 0x0000FFFF
	thumb_func_end SetOamMatrixRotationScaling

	thumb_func_start LoadSpriteSheet
LoadSpriteSheet: @ 0x08008210
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #4]
	lsrs r0, r0, #5
	bl AllocSpriteTiles
	lsls r4, r0, #0x10
	asrs r6, r4, #0x10
	cmp r6, #0
	blt _0800824C
	ldrh r0, [r5, #6]
	lsrs r4, r4, #0x10
	ldrh r2, [r5, #4]
	lsrs r2, r2, #5
	adds r1, r4, #0
	bl AllocSpriteTileRange
	ldr r0, [r5]
	lsls r1, r6, #5
	ldr r2, _08008248
	adds r1, r1, r2
	ldrh r2, [r5, #4]
	lsrs r2, r2, #1
	bl CpuSet
	adds r0, r4, #0
	b _0800824E
	.align 2, 0
_08008248: .4byte 0x06010000
_0800824C:
	movs r0, #0
_0800824E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end LoadSpriteSheet

	thumb_func_start LoadSpriteSheets
LoadSpriteSheets: @ 0x08008254
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _08008278
_08008260:
	lsls r0, r4, #3
	adds r0, r5, r0
	bl LoadSpriteSheet
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #3
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	bne _08008260
_08008278:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadSpriteSheets

	thumb_func_start FreeSpriteTilesByTag
FreeSpriteTilesByTag: @ 0x08008280
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl IndexOfSpriteTileTag
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xff
	beq _080082DE
	ldr r0, _080082E8
	lsls r1, r4, #2
	adds r2, r1, r0
	adds r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r3, [r2]
	adds r0, r3, r0
	ldr r1, _080082EC
	mov r8, r1
	lsls r5, r4, #1
	cmp r3, r0
	bge _080082D6
	ldr r1, _080082F0
	mov ip, r1
	movs r6, #7
	movs r7, #1
	adds r4, r0, #0
_080082BA:
	lsrs r2, r3, #3
	add r2, ip
	adds r0, r3, #0
	ands r0, r6
	adds r1, r7, #0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blt _080082BA
_080082D6:
	mov r0, r8
	adds r1, r5, r0
	ldr r0, _080082F4
	strh r0, [r1]
_080082DE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080082E8: .4byte 0x03000A70
_080082EC: .4byte 0x030009F0
_080082F0: .4byte 0x02021AB8
_080082F4: .4byte 0x0000FFFF
	thumb_func_end FreeSpriteTilesByTag

	thumb_func_start FreeSpriteTileRanges
FreeSpriteTileRanges: @ 0x080082F8
	push {r4, r5, r6, r7, lr}
	movs r2, #0
	ldr r7, _0800832C
	ldr r0, _08008330
	adds r6, r0, #0
	ldr r4, _08008334
	movs r3, #0
	adds r5, r4, #2
_08008308:
	lsls r1, r2, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	lsls r1, r2, #2
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r1, r5
	strh r3, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _08008308
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800832C: .4byte 0x030009F0
_08008330: .4byte 0x0000FFFF
_08008334: .4byte 0x03000A70
	thumb_func_end FreeSpriteTileRanges

	thumb_func_start GetSpriteTileStartByTag
GetSpriteTileStartByTag: @ 0x08008338
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl IndexOfSpriteTileTag
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _08008358
	ldr r0, _08008354
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0800835A
	.align 2, 0
_08008354: .4byte 0x03000A70
_08008358:
	ldr r0, _08008360
_0800835A:
	pop {r1}
	bx r1
	.align 2, 0
_08008360: .4byte 0x0000FFFF
	thumb_func_end GetSpriteTileStartByTag

	thumb_func_start IndexOfSpriteTileTag
IndexOfSpriteTileTag: @ 0x08008364
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	ldr r3, _0800837C
_0800836E:
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08008380
	adds r0, r1, #0
	b _0800838C
	.align 2, 0
_0800837C: .4byte 0x030009F0
_08008380:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x3f
	bls _0800836E
	movs r0, #0xff
_0800838C:
	pop {r1}
	bx r1
	thumb_func_end IndexOfSpriteTileTag

	thumb_func_start GetSpriteTileTagByTileStart
GetSpriteTileTagByTileStart: @ 0x08008390
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r6, _080083B8
	ldr r5, _080083BC
	ldr r4, _080083C0
_0800839E:
	lsls r0, r2, #1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, r5
	beq _080083C4
	lsls r0, r2, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	bne _080083C4
	ldrh r0, [r1]
	b _080083D0
	.align 2, 0
_080083B8: .4byte 0x030009F0
_080083BC: .4byte 0x0000FFFF
_080083C0: .4byte 0x03000A70
_080083C4:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _0800839E
	ldr r0, _080083D8
_080083D0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080083D8: .4byte 0x0000FFFF
	thumb_func_end GetSpriteTileTagByTileStart

	thumb_func_start AllocSpriteTileRange
AllocSpriteTileRange: @ 0x080083DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _08008418
	bl IndexOfSpriteTileTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0800841C
	lsls r1, r0, #1
	adds r1, r1, r2
	strh r4, [r1]
	ldr r1, _08008420
	lsls r0, r0, #2
	adds r2, r0, r1
	strh r5, [r2]
	adds r1, #2
	adds r0, r0, r1
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008418: .4byte 0x0000FFFF
_0800841C: .4byte 0x030009F0
_08008420: .4byte 0x03000A70
	thumb_func_end AllocSpriteTileRange

	thumb_func_start FreeAllSpritePalettes
FreeAllSpritePalettes: @ 0x08008424
	push {r4, lr}
	ldr r1, _08008450
	movs r0, #0
	strb r0, [r1]
	movs r2, #0
	ldr r4, _08008454
	ldr r0, _08008458
	adds r3, r0, #0
_08008434:
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _08008434
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008450: .4byte 0x030030BC
_08008454: .4byte 0x03000CF0
_08008458: .4byte 0x0000FFFF
	thumb_func_end FreeAllSpritePalettes

	thumb_func_start LoadSpritePalette
LoadSpritePalette: @ 0x0800845C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #4]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xff
	beq _08008472
	adds r0, r4, #0
	b _080084A2
_08008472:
	ldr r0, _08008498
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xff
	beq _080084A0
	ldr r1, _0800849C
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r5, #4]
	strh r1, [r0]
	ldr r0, [r5]
	lsls r1, r4, #4
	bl DoLoadSpritePalette
	adds r0, r4, #0
	b _080084A2
	.align 2, 0
_08008498: .4byte 0x0000FFFF
_0800849C: .4byte 0x03000CF0
_080084A0:
	movs r0, #0xff
_080084A2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end LoadSpritePalette

	thumb_func_start LoadSpritePalettes
LoadSpritePalettes: @ 0x080084A8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080084B6
_080084B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080084B6:
	lsls r0, r4, #3
	adds r1, r0, r5
	ldr r0, [r1]
	cmp r0, #0
	beq _080084CE
	adds r0, r1, #0
	bl LoadSpritePalette
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080084B0
_080084CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end LoadSpritePalettes

	thumb_func_start DoLoadSpritePalette
DoLoadSpritePalette: @ 0x080084D4
	push {lr}
	lsls r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end DoLoadSpritePalette

	thumb_func_start AllocSpritePalette
AllocSpritePalette: @ 0x080084EC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0800850C
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08008514
	ldr r1, _08008510
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r2, #0
	b _08008516
	.align 2, 0
_0800850C: .4byte 0x0000FFFF
_08008510: .4byte 0x03000CF0
_08008514:
	movs r0, #0xff
_08008516:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AllocSpritePalette

	thumb_func_start IndexOfSpritePaletteTag
IndexOfSpritePaletteTag: @ 0x0800851C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0800853C
	ldrb r1, [r0]
	cmp r1, #0xf
	bhi _0800854E
	ldr r3, _08008540
_0800852C:
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08008544
	adds r0, r1, #0
	b _08008550
	.align 2, 0
_0800853C: .4byte 0x030030BC
_08008540: .4byte 0x03000CF0
_08008544:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0800852C
_0800854E:
	movs r0, #0xff
_08008550:
	pop {r1}
	bx r1
	thumb_func_end IndexOfSpritePaletteTag

	thumb_func_start GetSpritePaletteTagByPaletteNum
GetSpritePaletteTagByPaletteNum: @ 0x08008554
	lsls r0, r0, #0x18
	ldr r1, _08008560
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08008560: .4byte 0x03000CF0
	thumb_func_end GetSpritePaletteTagByPaletteNum

	thumb_func_start FreeSpritePaletteByTag
FreeSpritePaletteByTag: @ 0x08008564
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _08008580
	ldr r0, _08008584
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, _08008588
	strh r0, [r1]
_08008580:
	pop {r0}
	bx r0
	.align 2, 0
_08008584: .4byte 0x03000CF0
_08008588: .4byte 0x0000FFFF
	thumb_func_end FreeSpritePaletteByTag

	thumb_func_start SetSubspriteTables
SetSubspriteTables: @ 0x0800858C
	str r1, [r0, #0x18]
	adds r0, #0x42
	movs r1, #0x40
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end SetSubspriteTables

	thumb_func_start AddSpriteToOamBuffer
AddSpriteToOamBuffer: @ 0x08008598
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r1, _080085AC
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080085B0
	movs r0, #1
	b _080085F8
	.align 2, 0
_080085AC: .4byte 0x02021AB4
_080085B0:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _080085C4
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080085E4
_080085C4:
	ldr r0, _080085E0
	ldrb r2, [r3]
	lsls r2, r2, #3
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	movs r0, #0
	b _080085F8
	.align 2, 0
_080085E0: .4byte 0x03002360
_080085E4:
	ldrb r1, [r3]
	lsls r1, r1, #3
	ldr r0, _08008600
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r3, #0
	bl AddSubspritesToOamBuffer
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080085F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008600: .4byte 0x03002398
	thumb_func_end AddSpriteToOamBuffer

	thumb_func_start AddSubspritesToOamBuffer
AddSubspritesToOamBuffer: @ 0x08008604
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r3, r0, #0
	str r1, [sp]
	mov r8, r2
	ldr r0, _08008624
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	blo _08008628
_08008620:
	movs r0, #1
	b _080087FE
	.align 2, 0
_08008624: .4byte 0x02021AB4
_08008628:
	adds r0, r3, #0
	adds r0, #0x42
	ldrb r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x17
	ldr r2, [r3, #0x18]
	adds r7, r2, r1
	mov ip, r3
	str r0, [sp, #0x18]
	cmp r7, #0
	beq _08008644
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0800865A
_08008644:
	mov r2, ip
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [sp]
	str r0, [r2]
	str r1, [r2, #4]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080087FC
_0800865A:
	mov r2, ip
	ldrh r0, [r2, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	str r0, [sp, #4]
	ldrb r0, [r7]
	str r0, [sp, #0xc]
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	asrs r1, r0, #3
	str r1, [sp, #0x10]
	movs r1, #1
	ldr r2, [sp, #0x10]
	ands r2, r1
	str r2, [sp, #0x10]
	asrs r0, r0, #4
	mov sl, r0
	ands r0, r1
	mov sl, r0
	mov r1, ip
	ldrh r0, [r1, #2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	adds r1, #0x28
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, ip
	ldrb r0, [r1]
	adds r1, #0x29
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	mov sb, r0
	ldr r1, [sp, #0xc]
	cmp sb, r1
	blo _080086B8
	b _080087FC
_080086B8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x14]
_080086BE:
	mov r2, r8
	ldrb r0, [r2]
	ldr r1, _08008810
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08008620
	ldr r0, [r7, #4]
	mov r2, sb
	lsls r6, r2, #2
	adds r2, r6, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #1
	ldrsb r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _08008714
	ldr r0, [r2]
	lsls r1, r0, #0xc
	lsrs r1, r1, #0x1e
	lsls r1, r1, #2
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r0, _08008814
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mvns r0, r4
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08008714:
	mov r1, sl
	cmp r1, #0
	beq _08008746
	ldr r0, [r2]
	lsls r1, r0, #0xc
	lsrs r1, r1, #0x1e
	lsls r1, r1, #2
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r2, _08008814
	adds r1, r1, r2
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mvns r0, r5
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08008746:
	mov r1, sb
	lsls r0, r1, #3
	ldr r2, [sp]
	adds r3, r0, r2
	mov r2, ip
	ldr r0, [r2]
	ldr r1, [r2, #4]
	str r0, [r3]
	str r1, [r3, #4]
	ldr r0, [r7, #4]
	adds r0, r6, r0
	ldr r1, [r0]
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x1e
	lsls r1, r1, #6
	ldrb r2, [r3, #1]
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	ldr r0, [r7, #4]
	adds r0, r6, r0
	ldr r1, [r0]
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x1e
	lsls r1, r1, #6
	ldrb r2, [r3, #3]
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r2, _08008818
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _0800881C
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldr r1, [sp, #8]
	adds r0, r1, r5
	strb r0, [r3]
	ldr r0, [r7, #4]
	adds r0, r6, r0
	ldr r1, [r0]
	lsls r1, r1, #2
	lsrs r1, r1, #0x16
	ldr r2, [sp, #4]
	adds r1, r2, r1
	ldr r2, _08008820
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r3, #4]
	ldr r0, _08008824
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldr r0, [sp, #0x18]
	ldrb r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _080087E2
	ldr r0, [r7, #4]
	adds r0, r6, r0
	ldr r1, [r0]
	lsrs r1, r1, #0x1e
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
_080087E2:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0xc]
	cmp sb, r2
	bhs _080087FC
	b _080086BE
_080087FC:
	movs r0, #0
_080087FE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008810: .4byte 0x02021AB4
_08008814: .4byte 0x082BF3BC
_08008818: .4byte 0x000001FF
_0800881C: .4byte 0xFFFFFE00
_08008820: .4byte 0x000003FF
_08008824: .4byte 0xFFFFFC00
	thumb_func_end AddSubspritesToOamBuffer

