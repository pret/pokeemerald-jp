.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DummiedOutFunction
DummiedOutFunction: @ 0x08071D14
	movs r0, #9
	bx lr
	thumb_func_end DummiedOutFunction

	thumb_func_start sub_08071D18
sub_08071D18: @ 0x08071D18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	movs r3, #0
	movs r2, #0
_08071D34:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	mov r3, sp
	adds r1, r3, r0
	strb r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08071D34
	movs r3, #3
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	mov r8, sp
_08071D54:
	lsls r0, r5, #0x10
	asrs r6, r0, #0x10
	cmp r6, #0
	ble _08071D82
	lsls r4, r3, #0x18
	asrs r4, r4, #0x18
	mov r1, sp
	adds r5, r1, r4
	adds r0, r6, #0
	movs r1, #0xa
	bl __modsi3
	strb r0, [r5]
	adds r0, r6, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r3, r4, #0x18
	b _08071D54
_08071D82:
	lsls r1, r3, #0x18
	asrs r0, r1, #0x18
	cmp r0, sb
	ble _08071DA6
	movs r4, #0xff
	movs r3, #1
	rsbs r3, r3, #0
_08071D90:
	asrs r2, r1, #0x18
	mov r5, sp
	adds r1, r5, r2
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	subs r2, #1
	lsls r1, r2, #0x18
	asrs r0, r1, #0x18
	cmp r0, r3
	bgt _08071D90
_08071DA6:
	mov r1, r8
	ldrb r0, [r1, #3]
	cmp r0, #0xff
	bne _08071DB2
	movs r0, #0
	strb r0, [r1, #3]
_08071DB2:
	mov r2, sl
	cmp r2, #0
	bne _08071E42
	movs r3, #0
	movs r1, #0
	movs r6, #0xfc
	lsls r6, r6, #8
	movs r5, #0x1e
	mov ip, r5
_08071DC4:
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	mov r0, sp
	adds r5, r0, r2
	ldrb r0, [r5]
	mov r8, r1
	cmp r0, #0xff
	bne _08071DFA
	lsls r1, r2, #1
	adds r1, r1, r7
	ldrh r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	mov r2, ip
	orrs r0, r2
	strh r0, [r1]
	lsls r3, r3, #0x18
	asrs r1, r3, #0x17
	adds r1, r1, r7
	adds r1, #0x40
	ldrh r2, [r1]
	adds r0, r6, #0
	ands r0, r2
	mov r5, ip
	orrs r0, r5
	strh r0, [r1]
	b _08071E2A
_08071DFA:
	lsls r2, r2, #1
	adds r2, r2, r7
	ldrh r0, [r2]
	adds r1, r6, #0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, #0x14
	orrs r1, r0
	strh r1, [r2]
	lsls r4, r3, #0x18
	asrs r3, r4, #0x18
	lsls r2, r3, #1
	adds r2, r2, r7
	adds r2, #0x40
	ldrh r0, [r2]
	adds r1, r6, #0
	ands r1, r0
	mov r5, sp
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, #0x34
	orrs r1, r0
	strh r1, [r2]
	adds r3, r4, #0
_08071E2A:
	movs r0, #0x80
	lsls r0, r0, #0x11
	add r0, r8
	lsrs r1, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r3, r2
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08071DC4
	b _08071EA6
_08071E42:
	movs r3, #0
	movs r4, #0xfc
	lsls r4, r4, #8
	movs r6, #0x1e
_08071E4A:
	lsls r1, r3, #0x18
	asrs r2, r1, #0x18
	mov r3, sp
	adds r5, r3, r2
	ldrb r0, [r5]
	adds r3, r1, #0
	cmp r0, #0xff
	bne _08071E76
	lsls r1, r2, #1
	adds r1, r1, r7
	ldrh r2, [r1]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	adds r1, #0x40
	ldrh r2, [r1]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	b _08071E98
_08071E76:
	lsls r2, r2, #1
	adds r2, r2, r7
	ldrh r0, [r2]
	adds r1, r4, #0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, #0x14
	orrs r1, r0
	strh r1, [r2]
	adds r2, #0x40
	ldrh r0, [r2]
	adds r1, r4, #0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, #0x34
	orrs r1, r0
	strh r1, [r2]
_08071E98:
	movs r5, #0x80
	lsls r5, r5, #0x11
	adds r0, r3, r5
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08071E4A
_08071EA6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08071D18

	thumb_func_start sub_08071EB8
sub_08071EB8: @ 0x08071EB8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r1, #0x1e
	strh r1, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	movs r2, #0
	bl sub_08071D18
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r5, #0xa
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08071D18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08071EB8

	thumb_func_start CreateBattlerHealthboxSprites
CreateBattlerHealthboxSprites: @ 0x08071EEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r0, #0
	str r0, [sp]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072000
	mov r0, sl
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08071F84
	ldr r4, _08071F74
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _08071F78
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r2, [r1, #1]
	movs r3, #0x3f
	adds r0, r3, #0
	ands r0, r2
	strb r0, [r1, #1]
	lsls r2, r7, #4
	adds r2, r2, r7
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrb r0, [r2, #1]
	ands r3, r0
	strb r3, [r2, #1]
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x40
	ldr r4, _08071F7C
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _08071F80
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
	b _08071FCA
	.align 2, 0
_08071F74: .4byte 0x082FCB38
_08071F78: .4byte 0x020205AC
_08071F7C: .4byte 0x000003FF
_08071F80: .4byte 0xFFFFFC00
_08071F84:
	ldr r4, _08071FEC
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08071FF0
	lsls r2, r7, #4
	adds r2, r2, r7
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x20
	ldr r5, _08071FF4
	adds r0, r5, #0
	ands r1, r0
	ldr r0, _08071FF8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
	movs r0, #2
	str r0, [sp]
_08071FCA:
	ldr r2, _08071FF0
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r7, [r0, #6]
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r1, r0, r2
	strh r6, [r1, #0x38]
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _08071FFC
	str r1, [r0]
	b _08072128
	.align 2, 0
_08071FEC: .4byte 0x082FCB68
_08071FF0: .4byte 0x020205AC
_08071FF4: .4byte 0x000003FF
_08071FF8: .4byte 0xFFFFFC00
_08071FFC: .4byte 0x08072335
_08072000:
	mov r0, sl
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080720A4
	mov r0, sl
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, _08072090
	adds r0, r0, r4
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r0, sl
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _08072094
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r7, [r0, #6]
	lsls r2, r7, #4
	adds r2, r2, r7
	lsls r2, r2, #2
	adds r3, r2, r4
	strh r6, [r3, #0x38]
	ldrh r1, [r3, #4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x20
	ldr r5, _08072098
	adds r0, r5, #0
	ands r1, r0
	ldr r0, _0807209C
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, #4]
	adds r4, #0x1c
	adds r2, r2, r4
	ldr r0, _080720A0
	str r0, [r2]
	movs r0, #1
	b _08072126
	.align 2, 0
_08072090: .4byte 0x082FCB38
_08072094: .4byte 0x020205AC
_08072098: .4byte 0x000003FF
_0807209C: .4byte 0xFFFFFC00
_080720A0: .4byte 0x08072335
_080720A4:
	mov r0, sl
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, _080721EC
	adds r0, r0, r4
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r0, sl
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, _080721F0
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r7, [r0, #6]
	lsls r2, r7, #4
	adds r2, r2, r7
	lsls r2, r2, #2
	adds r3, r2, r4
	strh r6, [r3, #0x38]
	ldrh r1, [r3, #4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, #0x16
	lsrs r1, r1, #0x16
	adds r1, #0x20
	ldr r5, _080721F4
	adds r0, r5, #0
	ands r1, r0
	ldr r0, _080721F8
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, #4]
	adds r4, #0x1c
	adds r2, r2, r4
	ldr r0, _080721FC
	str r0, [r2]
	movs r0, #2
_08072126:
	str r0, [sp]
_08072128:
	ldr r0, _08072200
	add r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08072204
	adds r0, r0, r1
	movs r1, #0x8c
	movs r2, #0x3c
	movs r3, #0
	bl CreateSpriteAtEnd
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r1, _080721F0
	mov r8, r1
	add r4, r8
	mov r0, sl
	bl GetBattlerSide
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	ldr r0, _08072208
	adds r1, r1, r0
	adds r0, r4, #0
	bl SetSubspriteTables
	adds r2, r4, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r2, #4
	mov sb, r2
	mov r1, sb
	orrs r0, r1
	strb r0, [r4, #5]
	movs r0, #1
	bl GetHealthboxElementGfxPtr
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r2, _0807220C
	adds r1, r1, r2
	ldr r2, _08072210
	bl CpuSet
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	add r0, r8
	strh r5, [r0, #0x38]
	mov r2, sl
	strh r2, [r0, #0x3a]
	adds r0, #0x3e
	ldrb r1, [r0]
	mov r5, sb
	orrs r1, r5
	strb r1, [r0]
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	add r0, r8
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	strh r6, [r4, #0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x3a]
	adds r4, #0x3e
	ldrb r0, [r4]
	orrs r0, r5
	strb r0, [r4]
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080721EC: .4byte 0x082FCB68
_080721F0: .4byte 0x020205AC
_080721F4: .4byte 0x000003FF
_080721F8: .4byte 0xFFFFFC00
_080721FC: .4byte 0x08072335
_08072200: .4byte 0x02023D1A
_08072204: .4byte 0x082FCBB8
_08072208: .4byte 0x082FCC84
_0807220C: .4byte 0x06010000
_08072210: .4byte 0x04000010
	thumb_func_end CreateBattlerHealthboxSprites

	thumb_func_start CreateSafariPlayerHealthboxSprites
CreateSafariPlayerHealthboxSprites: @ 0x08072214
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _080722A0
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSprite
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0xa0
	movs r3, #1
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080722A4
	mov sb, r1
	lsls r4, r6, #4
	adds r4, r4, r6
	lsls r4, r4, #2
	add r4, sb
	ldrb r3, [r4, #1]
	movs r2, #0x3f
	adds r1, r2, #0
	ands r1, r3
	strb r1, [r4, #1]
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	mov r7, sb
	adds r5, r3, r7
	ldrb r1, [r5, #1]
	ands r2, r1
	strb r2, [r5, #1]
	ldrh r1, [r5, #4]
	mov r8, r1
	mov r7, r8
	lsls r2, r7, #0x16
	lsrs r2, r2, #0x16
	adds r2, #0x40
	ldr r7, _080722A8
	adds r1, r7, #0
	ands r2, r1
	ldr r1, _080722AC
	mov r7, r8
	ands r1, r7
	orrs r1, r2
	strh r1, [r5, #4]
	strh r0, [r4, #6]
	strh r6, [r5, #0x38]
	movs r0, #0x1c
	add sb, r0
	add r3, sb
	ldr r0, _080722B0
	str r0, [r3]
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080722A0: .4byte 0x082FCB98
_080722A4: .4byte 0x020205AC
_080722A8: .4byte 0x000003FF
_080722AC: .4byte 0xFFFFFC00
_080722B0: .4byte 0x08072335
	thumb_func_end CreateSafariPlayerHealthboxSprites

	thumb_func_start GetHealthboxElementGfxPtr
GetHealthboxElementGfxPtr: @ 0x080722B4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	ldr r1, _080722C0
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080722C0: .4byte 0x08C11BE4
	thumb_func_end GetHealthboxElementGfxPtr

	thumb_func_start SpriteCB_HealthBar
SpriteCB_HealthBar: @ 0x080722C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080722F4
	cmp r0, #1
	bgt _08072308
	cmp r0, #0
	bne _08072308
	ldr r2, _080722F0
	lsls r3, r5, #4
	adds r1, r3, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x20]
	adds r0, #0x10
	b _08072316
	.align 2, 0
_080722F0: .4byte 0x020205AC
_080722F4:
	ldr r2, _08072304
	lsls r3, r5, #4
	adds r1, r3, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x20]
	adds r0, #0x10
	b _08072316
	.align 2, 0
_08072304: .4byte 0x020205AC
_08072308:
	ldr r2, _08072330
	lsls r3, r5, #4
	adds r1, r3, r5
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #0x20]
	adds r0, #8
_08072316:
	strh r0, [r4, #0x20]
	ldrh r0, [r1, #0x22]
	strh r0, [r4, #0x22]
	adds r0, r3, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x24]
	strh r1, [r4, #0x24]
	ldrh r0, [r0, #0x26]
	strh r0, [r4, #0x26]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072330: .4byte 0x020205AC
	thumb_func_end SpriteCB_HealthBar

	thumb_func_start SpriteCB_HealthBoxOther
SpriteCB_HealthBoxOther: @ 0x08072334
	ldrh r1, [r0, #0x38]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _08072358
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r1, [r2, #0x20]
	adds r1, #0x40
	strh r1, [r0, #0x20]
	ldrh r1, [r2, #0x22]
	strh r1, [r0, #0x22]
	ldrh r1, [r2, #0x24]
	strh r1, [r0, #0x24]
	ldrh r1, [r2, #0x26]
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
_08072358: .4byte 0x020205AC
	thumb_func_end SpriteCB_HealthBoxOther

	thumb_func_start SetBattleBarStruct
SetBattleBarStruct: @ 0x0807235C
	push {r4, r5, r6, r7, lr}
	ldr r7, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r6, _0807238C
	ldr r4, [r6]
	ldr r5, [r4, #0xc]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r5, r4, r5
	strb r1, [r5]
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	adds r4, r4, r0
	str r2, [r4, #4]
	str r3, [r4, #8]
	str r7, [r4, #0xc]
	ldr r0, _08072390
	str r0, [r4, #0x10]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807238C: .4byte 0x02024174
_08072390: .4byte 0xFFFF8000
	thumb_func_end SetBattleBarStruct

	thumb_func_start SetHealthboxSpriteInvisible
SetHealthboxSpriteInvisible: @ 0x08072394
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _080723DC
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	adds r1, r2, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r3, #4
	orrs r0, r3
	strb r0, [r1]
	movs r0, #0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	ldrh r1, [r2, #6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x3e
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080723DC: .4byte 0x020205AC
	thumb_func_end SetHealthboxSpriteInvisible

	thumb_func_start SetHealthboxSpriteVisible
SetHealthboxSpriteVisible: @ 0x080723E0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08072430
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r5
	adds r4, r2, #0
	adds r4, #0x3e
	ldrb r1, [r4]
	movs r3, #5
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r4, [r0]
	adds r1, r3, #0
	ands r1, r4
	strb r1, [r0]
	ldrh r1, [r2, #6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072430: .4byte 0x020205AC
	thumb_func_end SetHealthboxSpriteVisible

	thumb_func_start UpdateSpritePos
UpdateSpritePos: @ 0x08072434
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _08072450
	lsls r3, r0, #4
	adds r3, r3, r0
	lsls r3, r3, #2
	adds r3, r3, r4
	strh r1, [r3, #0x20]
	strh r2, [r3, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072450: .4byte 0x020205AC
	thumb_func_end UpdateSpritePos

	thumb_func_start DestoryHealthboxSprite
DestoryHealthboxSprite: @ 0x08072454
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08072490
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r5
	ldrh r1, [r4, #6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	adds r0, r4, #0
	bl DestroySprite
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072490: .4byte 0x020205AC
	thumb_func_end DestoryHealthboxSprite

	thumb_func_start DummyBattleInterfaceFunc
DummyBattleInterfaceFunc: @ 0x08072494
	bx lr
	.align 2, 0
	thumb_func_end DummyBattleInterfaceFunc

	thumb_func_start UpdateOamPriorityInAllHealthboxes
UpdateOamPriorityInAllHealthboxes: @ 0x08072498
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r1, _0807251C
	mov r8, r1
	ldrb r2, [r1]
	cmp r6, r2
	bge _08072510
	ldr r1, _08072520
	mov ip, r1
	movs r1, #3
	ands r0, r1
	lsls r5, r0, #2
	movs r7, #0xd
	rsbs r7, r7, #0
	ldr r2, _08072524
	mov sb, r2
_080724C2:
	mov r1, sb
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	ldrb r4, [r1, #6]
	ldrh r3, [r1, #0x38]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldrb r2, [r1, #5]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, #5]
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	add r1, ip
	ldrb r2, [r1, #5]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, #5]
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r1, r1, #2
	add r1, ip
	ldrb r2, [r1, #5]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, #5]
	adds r6, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r6, r2
	blt _080724C2
_08072510:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807251C: .4byte 0x02023D10
_08072520: .4byte 0x020205AC
_08072524: .4byte 0x03005AD0
	thumb_func_end UpdateOamPriorityInAllHealthboxes

	thumb_func_start InitBattlerHealthboxCoords
InitBattlerHealthboxCoords: @ 0x08072528
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	movs r4, #0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072554
	adds r0, r6, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807254E
	movs r5, #0x2c
	movs r4, #0x1e
	b _0807258C
_0807254E:
	movs r5, #0x9e
	movs r4, #0x58
	b _0807258C
_08072554:
	adds r0, r6, #0
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08072582
	cmp r0, #1
	bgt _0807256C
	cmp r0, #0
	beq _08072576
	b _0807258C
_0807256C:
	cmp r0, #2
	beq _0807257C
	cmp r0, #3
	beq _08072588
	b _0807258C
_08072576:
	movs r5, #0x9f
	movs r4, #0x4c
	b _0807258C
_0807257C:
	movs r5, #0xab
	movs r4, #0x65
	b _0807258C
_08072582:
	movs r5, #0x2c
	movs r4, #0x13
	b _0807258C
_08072588:
	movs r5, #0x20
	movs r4, #0x2c
_0807258C:
	ldr r0, _080725A0
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r2, r4, #0
	bl UpdateSpritePos
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080725A0: .4byte 0x03005AD0
	thumb_func_end InitBattlerHealthboxCoords

	thumb_func_start UpdateLvlInHealthbox
UpdateLvlInHealthbox: @ 0x080725A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r1, _080725EC
	mov r0, sp
	movs r2, #0x1e
	bl memcpy
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080725F4
	ldr r1, _080725F0
	lsls r4, r6, #4
	adds r0, r4, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r5, #0x28
	adds r7, r4, #0
	cmp r0, #0
	bne _08072614
	movs r5, #0x49
	b _08072614
	.align 2, 0
_080725EC: .4byte 0x082FCDBC
_080725F0: .4byte 0x020205AC
_080725F4:
	ldr r1, _08072630
	lsls r4, r6, #4
	adds r0, r4, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r5, #0x28
	adds r7, r4, #0
	cmp r0, #0
	bne _08072614
	movs r5, #0x29
_08072614:
	mov r0, r8
	cmp r0, #0x64
	bne _08072634
	mov r0, sp
	adds r0, #6
	movs r1, #0x64
	movs r2, #0
	movs r3, #3
	bl ConvertIntToDecimalStringN
	movs r1, #3
	mov r8, r1
	b _0807267E
	.align 2, 0
_08072630: .4byte 0x020205AC
_08072634:
	movs r0, #0x2a
	bl GetHealthboxElementGfxPtr
	ldr r2, _080726E0
	adds r1, r7, r6
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r1, r1, r5
	lsls r1, r1, #5
	ldr r2, _080726E4
	adds r1, r1, r2
	ldr r2, _080726E8
	bl CpuSet
	mov r0, sp
	adds r0, #6
	mov r1, r8
	movs r2, #0
	movs r3, #2
	bl ConvertIntToDecimalStringN
	mov r2, r8
	cmp r2, #9
	bhi _08072674
	mov r0, sp
	adds r0, #7
	ldr r1, _080726EC
	bl StringCopy
_08072674:
	movs r0, #2
	mov r8, r0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0807267E:
	ldr r0, _080726F0
	ldr r0, [r0]
	movs r1, #0xba
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #7
	mov r2, sp
	bl RenderTextFont9
	movs r4, #0
	cmp r4, r8
	bhs _080726D2
	ldr r1, _080726E0
	adds r0, r7, r6
	lsls r0, r0, #2
	adds r6, r0, r1
_080726A0:
	ldr r0, _080726F0
	ldr r0, [r0]
	movs r2, #0xba
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r1, r4, #6
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #0x20
	ldrh r1, [r6, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r1, r1, r5
	adds r1, r1, r4
	lsls r1, r1, #5
	ldr r2, _080726E4
	adds r1, r1, r2
	ldr r2, _080726E8
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r8
	blo _080726A0
_080726D2:
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080726E0: .4byte 0x020205AC
_080726E4: .4byte 0x06010000
_080726E8: .4byte 0x04000008
_080726EC: .4byte 0x085CC4EE
_080726F0: .4byte 0x02024178
	thumb_func_end UpdateLvlInHealthbox

	thumb_func_start sub_080726F4
sub_080726F4: @ 0x080726F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r1, _08072750
	mov r0, sp
	movs r2, #0x14
	bl memcpy
	ldr r1, _08072754
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r7, r0, r1
	ldrh r0, [r7, #0x3a]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0807273E
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08072758
_0807273E:
	mov r0, r8
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	adds r2, r5, #0
	bl UpdateHpTextInHealthboxInDoubles
	b _080727DE
	.align 2, 0
_08072750: .4byte 0x082FCDDA
_08072754: .4byte 0x020205AC
_08072758:
	ldrh r0, [r7, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072772
	movs r7, #0x59
	cmp r5, #0
	bne _0807277A
	movs r7, #0x1d
	b _0807277A
_08072772:
	movs r7, #0x30
	cmp r5, #0
	bne _0807277A
	movs r7, #0x14
_0807277A:
	mov r0, sp
	adds r0, #6
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	ldr r0, _080727EC
	ldr r0, [r0]
	movs r1, #0xba
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #7
	mov r2, sp
	bl RenderTextFont9
	movs r4, #0
	lsls r0, r6, #4
	ldr r1, _080727F0
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r5, r0, r1
_080727AC:
	ldr r0, _080727EC
	ldr r0, [r0]
	movs r2, #0xba
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r1, r4, #6
	adds r1, #0x20
	ldr r0, [r0]
	adds r0, r0, r1
	ldrh r1, [r5, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r1, r1, r7
	adds r1, r1, r4
	lsls r1, r1, #5
	ldr r2, _080727F4
	adds r1, r1, r2
	ldr r2, _080727F8
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _080727AC
_080727DE:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080727EC: .4byte 0x02024178
_080727F0: .4byte 0x020205AC
_080727F4: .4byte 0x06010000
_080727F8: .4byte 0x04000008
	thumb_func_end sub_080726F4

	thumb_func_start UpdateHpTextInHealthboxInDoubles
UpdateHpTextInHealthboxInDoubles: @ 0x080727FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, _080728D0
	mov r0, sp
	movs r2, #0x14
	bl memcpy
	ldr r5, _080728D4
	mov r1, sb
	lsls r0, r1, #4
	add r0, sb
	lsls r0, r0, #2
	adds r2, r0, r5
	ldrh r0, [r2, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _080728D8
	ldr r0, [r0]
	ldr r1, [r0]
	mov r3, sl
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0807284E
	b _080729B4
_0807284E:
	movs r6, #4
	mov r1, r8
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	ands r6, r0
	ldrh r0, [r2, #0x38]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r0, sp
	adds r0, #6
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	movs r3, #3
	bl ConvertIntToDecimalStringN
	mov r2, r8
	cmp r2, #0
	bne _0807287C
	ldr r1, _080728DC
	bl StringCopy
_0807287C:
	ldr r0, _080728E0
	ldr r0, [r0]
	movs r3, #0xba
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r0, [r0]
	movs r1, #7
	mov r2, sp
	bl RenderTextFont9
	adds r4, r6, #0
	adds r0, r4, #3
	cmp r4, r0
	bge _08072920
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r5, r0, r5
_080728A0:
	cmp r4, #2
	bhi _080728EC
	ldr r0, _080728E0
	ldr r0, [r0]
	movs r1, #0xba
	lsls r1, r1, #1
	adds r0, r0, r1
	subs r1, r4, r6
	lsls r1, r1, #6
	adds r1, #0x20
	ldr r0, [r0]
	adds r0, r0, r1
	ldrh r1, [r5, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r4, #1
	adds r1, r1, r4
	lsls r1, r1, #5
	ldr r2, _080728E4
	adds r1, r1, r2
	ldr r2, _080728E8
	bl CpuSet
	b _08072916
	.align 2, 0
_080728D0: .4byte 0x082FCDEE
_080728D4: .4byte 0x020205AC
_080728D8: .4byte 0x02024174
_080728DC: .4byte 0x085C93FF
_080728E0: .4byte 0x02024178
_080728E4: .4byte 0x06010000
_080728E8: .4byte 0x04000008
_080728EC:
	ldr r0, _08072968
	ldr r0, [r0]
	movs r3, #0xba
	lsls r3, r3, #1
	adds r0, r0, r3
	subs r1, r4, r6
	lsls r1, r1, #6
	adds r1, #0x20
	ldr r0, [r0]
	adds r0, r0, r1
	ldrh r1, [r5, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r2, _0807296C
	adds r1, r1, r2
	ldr r2, _08072970
	bl CpuSet
	adds r4, #1
_08072916:
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #3
	cmp r4, r0
	blt _080728A0
_08072920:
	mov r3, r8
	cmp r3, #0
	bne _08072980
	ldr r0, _08072968
	ldr r0, [r0]
	movs r1, #0xba
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0xe0
	ldr r1, _08072974
	lsls r4, r7, #4
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r1
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	adds r1, #0x80
	ldr r5, _08072978
	adds r1, r1, r5
	ldr r2, _08072970
	bl CpuSet
	mov r2, r8
	str r2, [sp, #0x14]
	add r0, sp, #0x14
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	adds r1, r1, r5
	ldr r2, _0807297C
	bl CpuSet
	b _080729B4
	.align 2, 0
_08072968: .4byte 0x02024178
_0807296C: .4byte 0x06010020
_08072970: .4byte 0x04000008
_08072974: .4byte 0x020205AC
_08072978: .4byte 0x06010000
_0807297C: .4byte 0x05000008
_08072980:
	mov r0, sl
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080729B4
	movs r0, #0x74
	bl GetHealthboxElementGfxPtr
	ldr r2, _080729C4
	mov r3, sb
	lsls r1, r3, #4
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	movs r2, #0xd0
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r2, _080729C8
	adds r1, r1, r2
	ldr r2, _080729CC
	bl CpuSet
_080729B4:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080729C4: .4byte 0x020205AC
_080729C8: .4byte 0x06010000
_080729CC: .4byte 0x04000008
	thumb_func_end UpdateHpTextInHealthboxInDoubles

	thumb_func_start PrintSafariMonInfo
PrintSafariMonInfo: @ 0x080729D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r1, _08072A78
	mov r0, sp
	movs r2, #0x14
	bl memcpy
	ldr r1, _08072A7C
	ldr r2, [sp, #0x14]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	ldr r1, _08072A80
	ldr r2, [r1]
	movs r3, #0xba
	lsls r3, r3, #1
	adds r2, r2, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	movs r0, #0xa4
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, [r2]
	adds r6, r0, r1
	movs r1, #5
	mov r8, r1
	adds r0, r4, #0
	bl GetNature
	lsls r0, r0, #0x18
	mov r4, sp
	adds r4, #6
	ldr r1, _08072A84
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl StringCopy
	adds r0, r6, #0
	movs r1, #7
	mov r2, sp
	bl RenderTextFont9
	movs r7, #6
	movs r5, #0
	mov r2, sp
	adds r2, #9
	str r2, [sp, #0x1c]
_08072A54:
	mov r3, sp
	adds r0, r3, r7
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x37
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bls _08072A72
	adds r0, r1, #0
	adds r0, #0x79
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _08072A88
_08072A72:
	movs r0, #0x2c
	b _08072AA6
	.align 2, 0
_08072A78: .4byte 0x082FCDDA
_08072A7C: .4byte 0x020205AC
_08072A80: .4byte 0x02024178
_08072A84: .4byte 0x085ECE24
_08072A88:
	adds r0, r1, #0
	subs r0, #0x4b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08072AA0
	adds r0, r1, #0
	adds r0, #0x65
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _08072AA4
_08072AA0:
	movs r0, #0x2d
	b _08072AA6
_08072AA4:
	movs r0, #0x2b
_08072AA6:
	bl GetHealthboxElementGfxPtr
	lsls r1, r5, #6
	adds r1, r6, r1
	ldr r2, _08072BBC
	bl CpuSet
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, #1
	cmp r5, r8
	blo _08072A54
	movs r7, #1
	ldr r0, [sp, #0x14]
	lsls r0, r0, #4
	str r0, [sp, #0x18]
	movs r1, #1
	add r1, r8
	mov sb, r1
	cmp r7, sb
	bge _08072B32
	ldr r1, _08072BC0
	ldr r2, _08072BBC
	mov sl, r2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r8, r0
_08072AE2:
	mov r1, r8
	ldrh r0, [r1, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r5, r7, #0
	cmp r7, #0
	bge _08072AF2
	adds r5, r7, #7
_08072AF2:
	asrs r5, r5, #3
	lsls r4, r5, #3
	subs r4, r7, r4
	adds r0, r0, r4
	lsls r5, r5, #6
	adds r0, r0, r5
	lsls r0, r0, #5
	ldr r2, _08072BC4
	adds r1, r0, r2
	adds r0, r6, #0
	mov r2, sl
	bl CpuSet
	adds r6, #0x20
	mov r3, r8
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r4, #8
	adds r0, r0, r4
	adds r0, r0, r5
	lsls r0, r0, #5
	ldr r2, _08072BC4
	adds r1, r0, r2
	adds r0, r6, #0
	mov r2, sl
	bl CpuSet
	adds r6, #0x20
	adds r7, #1
	cmp r7, sb
	blt _08072AE2
_08072B32:
	ldr r6, _08072BC0
	ldr r3, [sp, #0x18]
	ldr r1, [sp, #0x14]
	adds r0, r3, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r4, [r0, #0x38]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _08072BC8
	ldr r0, [r5]
	adds r0, #0x7c
	ldrb r1, [r0]
	mov r0, sp
	adds r0, #6
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	ldr r0, [r5]
	adds r0, #0x7b
	ldrb r1, [r0]
	ldr r0, [sp, #0x1c]
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #5]
	movs r0, #0xba
	strb r0, [r1, #8]
	ldr r5, _08072BCC
	ldr r0, [r5]
	movs r2, #0xba
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #7
	mov r2, sp
	bl RenderTextFont9
	movs r7, #0
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r6, r0, r6
	movs r4, #0x20
_08072B92:
	cmp r7, #1
	bgt _08072BD0
	ldr r0, [r5]
	movs r3, #0xba
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r4
	ldrh r1, [r6, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r2, r7, #2
	adds r1, r1, r2
	lsls r1, r1, #5
	ldr r2, _08072BC4
	adds r1, r1, r2
	ldr r2, _08072BBC
	bl CpuSet
	b _08072BF0
	.align 2, 0
_08072BBC: .4byte 0x04000008
_08072BC0: .4byte 0x020205AC
_08072BC4: .4byte 0x06010000
_08072BC8: .4byte 0x02024140
_08072BCC: .4byte 0x02024178
_08072BD0:
	ldr r0, [r5]
	movs r3, #0xba
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r4
	ldrh r1, [r6, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r1, r7, r1
	lsls r1, r1, #5
	ldr r2, _08072C08
	adds r1, r1, r2
	ldr r2, _08072C0C
	bl CpuSet
_08072BF0:
	adds r4, #0x40
	adds r7, #1
	cmp r7, #4
	ble _08072B92
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072C08: .4byte 0x060100C0
_08072C0C: .4byte 0x04000008
	thumb_func_end PrintSafariMonInfo

	thumb_func_start SwapHpBarsWithHpText
SwapHpBarsWithHpText: @ 0x08072C10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	mov sb, r0
	ldr r0, _08072D3C
	ldrb r0, [r0]
	cmp sb, r0
	blt _08072C2A
	b _08072EB6
_08072C2A:
	ldr r1, _08072D40
	mov sl, r1
	ldr r2, _08072D44
	mov r8, r2
_08072C32:
	ldr r0, _08072D48
	mov r1, sb
	adds r6, r1, r0
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sl
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08072D4C
	cmp r1, r0
	beq _08072C50
	b _08072EA4
_08072C50:
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r7, r0, #0x18
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08072C66
	b _08072EA4
_08072C66:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072C7E
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072C7E
	b _08072EA4
_08072C7E:
	ldr r5, _08072D50
	ldr r0, [r5]
	ldr r3, [r0]
	mov r0, sb
	lsls r4, r0, #2
	adds r3, r4, r3
	ldr r0, [r3]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	movs r2, #1
	eors r2, r0
	lsls r2, r2, #4
	mov ip, r2
	ldrb r0, [r3]
	movs r2, #0x11
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	mov r1, ip
	orrs r0, r1
	strb r0, [r3]
	ldr r0, [r5]
	ldr r0, [r0]
	adds r4, r4, r0
	ldr r0, [r4]
	lsls r0, r0, #0x1b
	lsrs r4, r0, #0x1f
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072DAC
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072CCC
	b _08072EA4
_08072CCC:
	ldr r0, _08072D54
	ldr r2, [r0]
	movs r0, #0x80
	ands r2, r0
	cmp r2, #0
	beq _08072CDA
	b _08072EA4
_08072CDA:
	cmp r4, #1
	bne _08072D64
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrh r0, [r0, #0x38]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	str r2, [sp]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrh r1, [r0, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r2, _08072D58
	adds r1, r1, r2
	mov r0, sp
	ldr r2, _08072D5C
	bl CpuSet
	ldrb r4, [r6]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0x64
	muls r0, r2, r0
	ldr r1, _08072D60
	adds r0, r0, r1
	movs r1, #0x39
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl UpdateHpTextInHealthboxInDoubles
	ldrb r4, [r6]
	mov r2, r8
	ldrh r0, [r2]
	movs r1, #0x64
	muls r0, r1, r0
	ldr r2, _08072D60
	b _08072E32
	.align 2, 0
_08072D3C: .4byte 0x02023D10
_08072D40: .4byte 0x020205AC
_08072D44: .4byte 0x02023D12
_08072D48: .4byte 0x03005AD0
_08072D4C: .4byte 0x08007141
_08072D50: .4byte 0x02024174
_08072D54: .4byte 0x02022C90
_08072D58: .4byte 0x06010000
_08072D5C: .4byte 0x05000040
_08072D60: .4byte 0x02024190
_08072D64:
	ldrb r0, [r6]
	bl UpdateStatusIconInHealthbox
	ldrb r0, [r6]
	mov r2, r8
	ldrh r1, [r2]
	movs r2, #0x64
	muls r1, r2, r1
	ldr r2, _08072DA0
	adds r1, r1, r2
	movs r2, #5
	bl UpdateHealthboxAttribute
	movs r0, #0x75
	bl GetHealthboxElementGfxPtr
	ldrb r2, [r6]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, sl
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r2, _08072DA4
	adds r1, r1, r2
	ldr r2, _08072DA8
	bl CpuSet
	b _08072E8E
	.align 2, 0
_08072DA0: .4byte 0x02024190
_08072DA4: .4byte 0x06010680
_08072DA8: .4byte 0x04000008
_08072DAC:
	cmp r4, #1
	bne _08072E58
	ldr r0, _08072DD0
	ldr r2, [r0]
	movs r0, #0x80
	ands r2, r0
	cmp r2, #0
	beq _08072DD8
	ldrb r0, [r6]
	mov r2, r8
	ldrh r1, [r2]
	movs r2, #0x64
	muls r1, r2, r1
	ldr r2, _08072DD4
	adds r1, r1, r2
	bl PrintSafariMonInfo
	b _08072E8E
	.align 2, 0
_08072DD0: .4byte 0x02022C90
_08072DD4: .4byte 0x020243E8
_08072DD8:
	ldrb r1, [r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrh r0, [r0, #0x38]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	str r2, [sp]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrh r1, [r0, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r0, _08072E4C
	adds r1, r1, r0
	mov r0, sp
	ldr r2, _08072E50
	bl CpuSet
	ldrb r4, [r6]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0x64
	muls r0, r2, r0
	ldr r1, _08072E54
	adds r0, r0, r1
	movs r1, #0x39
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl UpdateHpTextInHealthboxInDoubles
	ldrb r4, [r6]
	mov r2, r8
	ldrh r0, [r2]
	movs r1, #0x64
	muls r0, r1, r0
	ldr r2, _08072E54
_08072E32:
	adds r0, r0, r2
	movs r1, #0x3a
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #1
	bl UpdateHpTextInHealthboxInDoubles
	b _08072E8E
	.align 2, 0
_08072E4C: .4byte 0x06010000
_08072E50: .4byte 0x05000040
_08072E54: .4byte 0x020243E8
_08072E58:
	ldrb r0, [r6]
	bl UpdateStatusIconInHealthbox
	ldrb r0, [r6]
	mov r2, r8
	ldrh r1, [r2]
	movs r5, #0x64
	muls r1, r5, r1
	ldr r4, _08072EC8
	adds r1, r1, r4
	movs r2, #5
	bl UpdateHealthboxAttribute
	ldr r0, _08072ECC
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08072E8E
	ldrb r0, [r6]
	mov r2, r8
	ldrh r1, [r2]
	muls r1, r5, r1
	adds r1, r1, r4
	movs r2, #4
	bl UpdateHealthboxAttribute
_08072E8E:
	ldr r0, _08072ED0
	add r0, sb
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldrh r1, [r0, #0x3c]
	movs r2, #1
	eors r1, r2
	strh r1, [r0, #0x3c]
_08072EA4:
	movs r0, #2
	add r8, r0
	movs r1, #1
	add sb, r1
	ldr r0, _08072ED4
	ldrb r0, [r0]
	cmp sb, r0
	bge _08072EB6
	b _08072C32
_08072EB6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072EC8: .4byte 0x020243E8
_08072ECC: .4byte 0x02022C90
_08072ED0: .4byte 0x03005AD0
_08072ED4: .4byte 0x02023D10
	thumb_func_end SwapHpBarsWithHpText

	thumb_func_start CreatePartyStatusSummarySprites
CreatePartyStatusSummarySprites: @ 0x08072ED8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r1, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r4, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x10]
	cmp r4, #0
	beq _08072F08
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _08072F58
_08072F08:
	ldr r0, [sp, #8]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072F2C
	movs r0, #0
	mov sb, r0
	movs r5, #0x88
	movs r4, #0x60
	movs r1, #0x64
	mov sl, r1
	ldr r2, _08072F28
	mov r8, r2
	b _08072F68
	.align 2, 0
_08072F28: .4byte 0x0000FFFB
_08072F2C:
	movs r3, #1
	mov sb, r3
	cmp r4, #0
	beq _08072F3E
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08072F44
_08072F3E:
	movs r5, #0x68
	movs r4, #0x28
	b _08072F48
_08072F44:
	movs r5, #0x68
	movs r4, #0x10
_08072F48:
	ldr r6, _08072F54
	mov sl, r6
	movs r0, #5
	mov r8, r0
	b _08072F68
	.align 2, 0
_08072F54: .4byte 0x0000FF9C
_08072F58:
	movs r1, #1
	mov sb, r1
	movs r5, #0x68
	movs r4, #0x28
	ldr r2, _08072FDC
	mov sl, r2
	movs r3, #5
	mov r8, r3
_08072F68:
	ldr r0, _08072FE0
	bl LoadCompressedSpriteSheetUsingHeap
	ldr r0, _08072FE4
	bl LoadSpriteSheet
	ldr r0, _08072FE8
	bl LoadSpritePalette
	ldr r0, _08072FEC
	bl LoadSpritePalette
	mov r0, sb
	lsls r6, r0, #1
	adds r0, r6, r0
	lsls r0, r0, #3
	ldr r1, _08072FF0
	adds r0, r0, r1
	lsls r5, r5, #0x10
	asrs r1, r5, #0x10
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	movs r3, #0xa
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	lsls r0, r0, #4
	ldr r1, [sp, #0x14]
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08072FF4
	adds r7, r0, r1
	ldr r1, _08072FF8
	adds r0, r7, #0
	bl SetSubspriteTables
	mov r2, sl
	strh r2, [r7, #0x24]
	mov r3, r8
	strh r3, [r7, #0x2e]
	str r5, [sp, #0x1c]
	str r4, [sp, #0x20]
	mov r5, sb
	cmp r5, #0
	beq _08072FFC
	ldrh r0, [r7, #0x20]
	subs r0, #0x60
	strh r0, [r7, #0x20]
	ldrb r1, [r7, #3]
	movs r0, #0x3f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #3]
	b _08073002
	.align 2, 0
_08072FDC: .4byte 0x0000FF9C
_08072FE0: .4byte 0x082FCD2C
_08072FE4: .4byte 0x082FCD44
_08072FE8: .4byte 0x082FCD34
_08072FEC: .4byte 0x082FCD3C
_08072FF0: .4byte 0x082FCD5C
_08072FF4: .4byte 0x020205AC
_08072FF8: .4byte 0x082FCCBC
_08072FFC:
	ldrh r0, [r7, #0x20]
	adds r0, #0x60
	strh r0, [r7, #0x20]
_08073002:
	movs r0, #0
	mov r8, r0
	ldr r1, _080730B0
	mov sl, r1
	mov r7, sp
	mov r2, sb
	adds r0, r6, r2
	lsls r0, r0, #3
	str r0, [sp, #0x18]
	movs r6, #0xa
	movs r5, #0
_08073018:
	ldr r0, _080730B4
	ldr r3, [sp, #0x20]
	ldr r1, _080730B8
	adds r2, r3, r1
	ldr r3, [sp, #0x18]
	adds r0, r3, r0
	ldr r3, [sp, #0x1c]
	asrs r1, r3, #0x10
	asrs r2, r2, #0x10
	movs r3, #9
	bl CreateSpriteAtEnd
	strb r0, [r7]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _08073048
	ldrb r0, [r7]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, _080730BC
	adds r1, r1, r2
	ldr r0, _080730C0
	str r0, [r1]
_08073048:
	ldr r4, _080730B0
	mov r3, sb
	cmp r3, #0
	bne _0807306A
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	strh r3, [r0, #0x24]
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	mov r1, sb
	strh r1, [r0, #0x26]
_0807306A:
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	mov r2, sp
	ldrh r2, [r2, #0x14]
	strh r2, [r0, #0x2e]
	mov r3, sb
	cmp r3, #0
	bne _080730C4
	ldrb r0, [r7]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r0, [r1, #0x20]
	adds r0, #0x18
	adds r0, r0, r5
	strh r0, [r1, #0x20]
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r6, [r0, #0x30]
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x78
	b _08073106
	.align 2, 0
_080730B0: .4byte 0x020205AC
_080730B4: .4byte 0x082FCD8C
_080730B8: .4byte 0xFFFC0000
_080730BC: .4byte 0x020205C8
_080730C0: .4byte 0x08073AC5
_080730C4:
	ldrb r0, [r7]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r3, [r2, #0x20]
	subs r3, #0x18
	movs r1, #5
	mov r0, r8
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r3, r3, r0
	strh r3, [r2, #0x20]
	ldrb r0, [r7]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r1, #6
	mov r3, r8
	subs r1, r1, r3
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, #0xa
	strh r0, [r2, #0x30]
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _0807318C
_08073106:
	strh r1, [r0, #0x24]
	ldrb r1, [r7]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r1, sb
	strh r1, [r0, #0x32]
	adds r7, #1
	adds r6, #7
	adds r5, #0xa
	movs r2, #1
	add r8, r2
	mov r3, r8
	cmp r3, #5
	bgt _08073128
	b _08073018
_08073128:
	ldr r0, [sp, #8]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08073136
	b _080732E4
_08073136:
	ldr r0, _08073190
	ldr r1, [r0]
	movs r2, #0x40
	ands r1, r2
	cmp r1, #0
	beq _080731F0
	ldr r5, _08073194
	mov sl, r5
	ldr r6, _08073198
	ldr r0, _0807319C
	adds r7, r0, #0
	ldr r1, _080731A0
	mov sb, r1
	mov r4, sp
	ldr r5, [sp, #0xc]
	movs r2, #5
	mov r8, r2
_08073158:
	ldrh r0, [r5]
	cmp r0, sl
	bne _080731A4
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #1
	ands r1, r7
	mov r0, sb
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	strh r1, [r0, #0x3c]
	b _080731DE
	.align 2, 0
_0807318C: .4byte 0x0000FF88
_08073190: .4byte 0x02022C90
_08073194: .4byte 0x0000FFFF
_08073198: .4byte 0x020205AC
_0807319C: .4byte 0x000003FF
_080731A0: .4byte 0xFFFFFC00
_080731A4:
	cmp r0, #0
	bne _080731BC
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #3
	b _080731D4
_080731BC:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _080731DE
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #2
_080731D4:
	ands r1, r7
	mov r0, sb
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
_080731DE:
	adds r4, #1
	adds r5, #8
	movs r3, #1
	rsbs r3, r3, #0
	add r8, r3
	mov r0, r8
	cmp r0, #0
	bge _08073158
	b _08073496
_080731F0:
	movs r1, #5
	mov sl, r1
	movs r7, #0
	ldr r2, _08073244
	mov r8, r2
	ldr r3, _08073248
	mov sb, r3
	ldr r5, _0807324C
	mov ip, r5
	ldr r6, [sp, #0xc]
	mov r5, sp
_08073206:
	ldrh r0, [r6]
	ldr r1, _08073250
	cmp r0, r1
	bne _08073254
	mov r4, sp
	add r4, sl
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, r8
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #1
	mov r0, sb
	ands r1, r0
	mov r0, ip
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	movs r1, #1
	strh r1, [r0, #0x3c]
	subs r1, #2
	add sl, r1
	b _080732DA
	.align 2, 0
_08073244: .4byte 0x020205AC
_08073248: .4byte 0x000003FF
_0807324C: .4byte 0xFFFFFC00
_08073250: .4byte 0x0000FFFF
_08073254:
	cmp r0, #0
	bne _0807326C
	ldrb r0, [r5]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, r8
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #3
	b _080732CC
_0807326C:
	ldr r1, _080732A8
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080732B4
	ldr r0, _080732AC
	ldr r0, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	ldr r2, _080732B0
	lsls r0, r7, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080732B4
	ldrb r0, [r5]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, r8
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #3
	b _080732CC
	.align 2, 0
_080732A8: .4byte 0x02022C90
_080732AC: .4byte 0x02024140
_080732B0: .4byte 0x082FACB4
_080732B4:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _080732D8
	ldrb r0, [r5]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, r8
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #2
_080732CC:
	mov r0, sb
	ands r1, r0
	mov r0, ip
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
_080732D8:
	adds r5, #1
_080732DA:
	adds r6, #8
	adds r7, #1
	cmp r7, #5
	ble _08073206
	b _08073496
_080732E4:
	ldr r0, _0807333C
	ldr r1, [r0]
	ldr r2, _08073340
	ands r1, r2
	cmp r1, #0
	beq _080733A0
	ldr r1, _08073344
	mov sl, r1
	ldr r6, _08073348
	ldr r2, _0807334C
	adds r7, r2, #0
	ldr r3, _08073350
	mov sb, r3
	ldr r5, [sp, #0xc]
	mov r4, sp
	adds r4, #5
	movs r0, #5
	mov r8, r0
_08073308:
	ldrh r0, [r5]
	cmp r0, sl
	bne _08073354
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #1
	ands r1, r7
	mov r0, sb
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #1
	strh r1, [r0, #0x3c]
	b _0807338E
	.align 2, 0
_0807333C: .4byte 0x02022C90
_08073340: .4byte 0x00008040
_08073344: .4byte 0x0000FFFF
_08073348: .4byte 0x020205AC
_0807334C: .4byte 0x000003FF
_08073350: .4byte 0xFFFFFC00
_08073354:
	cmp r0, #0
	bne _0807336C
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #3
	b _08073384
_0807336C:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0807338E
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r6
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #2
_08073384:
	ands r1, r7
	mov r0, sb
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
_0807338E:
	subs r4, #1
	adds r5, #8
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _08073308
	b _08073496
_080733A0:
	movs r3, #0
	mov r8, r3
	movs r7, #0
	ldr r5, _080733F4
	mov sb, r5
	ldr r6, _080733F8
	mov ip, r6
	ldr r0, _080733FC
	mov sl, r0
	ldr r6, [sp, #0xc]
	mov r5, sp
	adds r5, #5
_080733B8:
	ldrh r0, [r6]
	ldr r1, _08073400
	cmp r0, r1
	bne _08073404
	mov r4, sp
	add r4, r8
	ldrb r0, [r4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, sb
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #1
	mov r0, ip
	ands r1, r0
	mov r0, sl
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	movs r1, #1
	strh r1, [r0, #0x3c]
	add r8, r1
	b _0807348E
	.align 2, 0
_080733F4: .4byte 0x020205AC
_080733F8: .4byte 0x000003FF
_080733FC: .4byte 0xFFFFFC00
_08073400: .4byte 0x0000FFFF
_08073404:
	cmp r0, #0
	bne _0807341C
	ldrb r0, [r5]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, sb
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #3
	b _08073480
_0807341C:
	ldr r1, _08073458
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08073468
	ldr r2, _0807345C
	ldr r0, [r2]
	ldr r3, _08073460
	adds r0, r0, r3
	ldrb r1, [r0]
	lsls r0, r7, #2
	ldr r2, _08073464
	adds r0, r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08073468
	ldrb r0, [r5]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, sb
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #3
	b _08073480
	.align 2, 0
_08073458: .4byte 0x02022C90
_0807345C: .4byte 0x02024140
_08073460: .4byte 0x000002A1
_08073464: .4byte 0x082FACB4
_08073468:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _0807348C
	ldrb r0, [r5]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, sb
	ldrh r3, [r2, #4]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	adds r1, #2
_08073480:
	mov r0, ip
	ands r1, r0
	mov r0, sl
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #4]
_0807348C:
	subs r5, #1
_0807348E:
	adds r6, #8
	adds r7, #1
	cmp r7, #5
	ble _080733B8
_08073496:
	ldr r0, _08073520
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _08073524
	lsls r3, r4, #2
	adds r1, r3, r4
	lsls r1, r1, #3
	adds r0, r1, r2
	mov r5, sp
	ldrh r5, [r5, #8]
	strh r5, [r0, #8]
	mov r6, sp
	ldrh r6, [r6, #0x14]
	strh r6, [r0, #0xa]
	movs r0, #0
	mov r8, r0
	adds r0, r2, #0
	adds r0, #0xe
	adds r1, r1, r0
_080734C2:
	mov r0, sp
	add r0, r8
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, #2
	movs r5, #1
	add r8, r5
	mov r6, r8
	cmp r6, #5
	ble _080734C2
	adds r0, r3, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	mov r1, sp
	ldrh r1, [r1, #0x10]
	strh r1, [r0, #0x1c]
	ldr r2, [sp, #0x10]
	cmp r2, #0
	beq _08073506
	ldr r0, _08073528
	ldr r0, [r0]
	ldr r3, [r0, #8]
	ldrb r2, [r3, #9]
	lsls r1, r2, #0x1b
	lsrs r1, r1, #0x1d
	adds r1, #1
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0x1d
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
_08073506:
	movs r0, #0x72
	movs r1, #0
	bl PlaySE12WithPanning
	adds r0, r4, #0
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08073520: .4byte 0x080A8A41
_08073524: .4byte 0x03005B60
_08073528: .4byte 0x02024174
	thumb_func_end CreatePartyStatusSummarySprites

	thumb_func_start Task_HidePartyStatusSummary
Task_HidePartyStatusSummary: @ 0x0807352C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, _0807363C
	lsls r3, r0, #2
	adds r1, r3, r0
	lsls r1, r1, #3
	adds r0, r1, r2
	ldrb r7, [r0, #0x1c]
	ldrb r4, [r0, #0xa]
	mov sl, r4
	ldrb r0, [r0, #8]
	str r0, [sp, #8]
	movs r5, #0
	str r3, [sp, #0xc]
	adds r2, #0xe
	adds r2, r1, r2
_0807355A:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, #2
	adds r5, #1
	cmp r5, #5
	ble _0807355A
	movs r1, #0xfd
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0x10
	bl SetGpuReg
	ldr r1, _0807363C
	ldr r0, [sp, #0xc]
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x10
	strh r1, [r0, #0x26]
	movs r5, #0
	mov r1, sl
	lsls r1, r1, #4
	str r1, [sp, #0x10]
	ldr r3, _08073640
	movs r6, #0xd
	rsbs r6, r6, #0
	mov ip, r3
	movs r4, #4
_0807359C:
	mov r2, sp
	adds r0, r2, r5
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r1, #1]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, #1]
	adds r5, #1
	cmp r5, #5
	ble _0807359C
	ldr r2, [sp, #0x10]
	add r2, sl
	lsls r2, r2, #2
	add r2, ip
	ldrb r1, [r2, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2, #1]
	cmp r7, #0
	bne _080735D6
	b _080736DC
_080735D6:
	movs r5, #0
	mov r6, ip
	mov sb, r5
	adds r3, r6, #0
	adds r3, #0x1c
	mov r4, sp
	movs r7, #0
_080735E4:
	ldr r0, [sp, #8]
	str r3, [sp, #0x14]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r2, #0
	beq _08073648
	movs r0, #5
	subs r0, r0, r5
	mov r1, sp
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r7, [r0, #0x30]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, sb
	strh r1, [r0, #0x34]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, sb
	strh r1, [r0, #0x36]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, _08073644
	str r1, [r0]
	ldr r2, _08073640
	mov ip, r2
	b _0807367E
	.align 2, 0
_0807363C: .4byte 0x03005B60
_08073640: .4byte 0x020205AC
_08073644: .4byte 0x08073A55
_08073648:
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r7, [r0, #0x30]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x34]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strh r2, [r0, #0x36]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, _080736C4
	str r1, [r0]
	ldr r0, _080736C8
	mov ip, r0
_0807367E:
	adds r4, #1
	adds r7, #7
	adds r5, #1
	cmp r5, #5
	ble _080735E4
	ldr r3, [sp, #0x10]
	add r3, sl
	lsls r3, r3, #2
	mov r1, ip
	adds r0, r3, r1
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	movs r2, #0
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	mov r1, ip
	adds r1, #0x1c
	adds r3, r3, r1
	ldr r1, _080736CC
	str r1, [r3]
	ldr r1, _080736D0
	bl SetSubspriteTables
	ldr r1, _080736D4
	ldr r0, [sp, #0xc]
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _080736D8
	str r1, [r0]
	b _080736EA
	.align 2, 0
_080736C4: .4byte 0x08073A55
_080736C8: .4byte 0x020205AC
_080736CC: .4byte 0x0807398D
_080736D0: .4byte 0x082FCCC4
_080736D4: .4byte 0x03005B60
_080736D8: .4byte 0x08073705
_080736DC:
	ldr r0, _080736FC
	ldr r1, [sp, #0xc]
	add r1, r8
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _08073700
	str r0, [r1]
_080736EA:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080736FC: .4byte 0x03005B60
_08073700: .4byte 0x08073895
	thumb_func_end Task_HidePartyStatusSummary

	thumb_func_start sub_08073704
sub_08073704: @ 0x08073704
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08073758
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	ldrh r0, [r4, #0x1e]
	adds r1, r0, #1
	strh r1, [r4, #0x1e]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08073744
	ldrh r0, [r4, #0x26]
	subs r1, r0, #1
	strh r1, [r4, #0x26]
	lsls r0, r1, #0x10
	cmp r0, #0
	blt _08073750
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
_08073744:
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08073750
	ldr r0, _0807375C
	str r0, [r4]
_08073750:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073758: .4byte 0x03005B60
_0807375C: .4byte 0x08073761
	thumb_func_end sub_08073704

	thumb_func_start sub_08073760
sub_08073760: @ 0x08073760
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r7, _080737EC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r3, r0, #3
	adds r4, r3, r7
	ldrb r2, [r4, #8]
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08073850
	ldrb r5, [r4, #0xa]
	movs r4, #0
	ldr r6, _080737F0
	adds r0, r7, #0
	adds r0, #0xe
	adds r2, r3, r0
_08073792:
	mov r0, sp
	adds r1, r0, r4
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, #2
	adds r4, #1
	cmp r4, #5
	ble _08073792
	ldr r0, [r6]
	ldr r3, [r0, #8]
	ldrb r2, [r3, #9]
	lsls r1, r2, #0x1b
	lsrs r1, r1, #0x1d
	subs r1, #1
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0x1d
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	ldr r0, [r6]
	ldr r0, [r0, #8]
	ldrb r1, [r0, #9]
	movs r0, #0x1c
	ands r0, r1
	cmp r0, #0
	bne _080737F8
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r4, _080737F4
	adds r0, r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySpriteAndFreeResources
	b _0807382E
	.align 2, 0
_080737EC: .4byte 0x03005B60
_080737F0: .4byte 0x02024174
_080737F4: .4byte 0x020205AC
_080737F8:
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r5, _0807384C
	adds r4, r4, r5
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl FreeSpriteOamMatrix
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
_0807382E:
	movs r4, #1
	ldr r5, _0807384C
_08073832:
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	bl DestroySprite
	adds r4, #1
	cmp r4, #5
	ble _08073832
	b _08073886
	.align 2, 0
_0807384C: .4byte 0x020205AC
_08073850:
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08073886
	ldr r0, _08073890
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r5, #0
	bl DestroyTask
_08073886:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073890: .4byte 0x02024174
	thumb_func_end sub_08073760

	thumb_func_start sub_08073894
sub_08073894: @ 0x08073894
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	ldr r7, _080738CC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r6, r0, #3
	adds r3, r6, r7
	ldrb r5, [r3, #8]
	ldrh r0, [r3, #0x26]
	subs r1, r0, #1
	strh r1, [r3, #0x26]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080738D0
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x52
	bl SetGpuReg
	b _08073966
	.align 2, 0
_080738CC: .4byte 0x03005B60
_080738D0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08073930
	ldrb r3, [r3, #0xa]
	movs r5, #0
	adds r0, r7, #0
	adds r0, #0xe
	adds r2, r6, r0
_080738E2:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, #2
	adds r5, #1
	cmp r5, #5
	ble _080738E2
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r4, _0807392C
	adds r0, r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, #1
_08073912:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	adds r5, #1
	cmp r5, #5
	ble _08073912
	b _08073966
	.align 2, 0
_0807392C: .4byte 0x020205AC
_08073930:
	movs r0, #3
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08073966
	ldr r0, _08073970
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	adds r0, r4, #0
	bl DestroyTask
_08073966:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073970: .4byte 0x02024174
	thumb_func_end sub_08073894

	thumb_func_start SpriteCB_StatusSummaryBar
SpriteCB_StatusSummaryBar: @ 0x08073974
	push {lr}
	adds r1, r0, #0
	ldrh r2, [r1, #0x24]
	movs r3, #0x24
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08073988
	ldrh r0, [r1, #0x2e]
	adds r0, r2, r0
	strh r0, [r1, #0x24]
_08073988:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_StatusSummaryBar

	thumb_func_start sub_0807398C
sub_0807398C: @ 0x0807398C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x30]
	adds r1, r0, #0
	adds r1, #0x20
	strh r1, [r2, #0x30]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _080739AA
	lsls r0, r1, #0x10
	asrs r0, r0, #0x14
	ldrh r1, [r2, #0x24]
	adds r0, r0, r1
	b _080739B2
_080739AA:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	ldrh r0, [r2, #0x24]
	subs r0, r0, r1
_080739B2:
	strh r0, [r2, #0x24]
	ldrh r1, [r2, #0x30]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x30]
	pop {r0}
	bx r0
	thumb_func_end sub_0807398C

	thumb_func_start SpriteCB_StatusSummaryBallsOnBattleStart
SpriteCB_StatusSummaryBallsOnBattleStart: @ 0x080739C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080739D4
	subs r0, r1, #1
	strh r0, [r4, #0x30]
	b _08073A4A
_080739D4:
	ldrh r0, [r4, #0x32]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r2, [r4, #0x34]
	adds r0, r2, #0
	adds r0, #0x38
	lsls r1, r0, #0x10
	lsrs r2, r1, #0x10
	ldr r0, _08073A04
	ands r2, r0
	strh r2, [r4, #0x34]
	cmp r3, #0
	beq _08073A08
	lsrs r0, r1, #0x14
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08073A18
	movs r0, #0
	strh r0, [r4, #0x24]
	b _08073A18
	.align 2, 0
_08073A04: .4byte 0x0000FFF0
_08073A08:
	lsrs r1, r1, #0x14
	ldrh r0, [r4, #0x24]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08073A18
	strh r3, [r4, #0x24]
_08073A18:
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08073A4A
	movs r1, #0x3f
	cmp r3, #0
	beq _08073A28
	movs r1, #0xc0
_08073A28:
	movs r2, #0x3c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08073A3C
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x74
	bl PlaySE2WithPanning
	b _08073A46
_08073A3C:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x73
	bl PlaySE1WithPanning
_08073A46:
	ldr r0, _08073A50
	str r0, [r4, #0x1c]
_08073A4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073A50: .4byte 0x08007141
	thumb_func_end SpriteCB_StatusSummaryBallsOnBattleStart

	thumb_func_start sub_08073A54
sub_08073A54: @ 0x08073A54
	push {r4, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x30]
	movs r2, #0x30
	ldrsh r0, [r3, r2]
	cmp r0, #0
	ble _08073A68
	subs r0, r1, #1
	strh r0, [r3, #0x30]
	b _08073AB8
_08073A68:
	ldrh r0, [r3, #0x32]
	lsls r0, r0, #0x18
	ldrh r2, [r3, #0x34]
	adds r1, r2, #0
	adds r1, #0x38
	lsls r4, r1, #0x10
	lsrs r2, r4, #0x10
	ldr r1, _08073A88
	ands r2, r1
	strh r2, [r3, #0x34]
	cmp r0, #0
	beq _08073A8C
	lsrs r0, r4, #0x14
	ldrh r1, [r3, #0x24]
	adds r0, r0, r1
	b _08073A92
	.align 2, 0
_08073A88: .4byte 0x0000FFF0
_08073A8C:
	lsrs r1, r4, #0x14
	ldrh r0, [r3, #0x24]
	subs r0, r0, r1
_08073A92:
	strh r0, [r3, #0x24]
	movs r2, #0x24
	ldrsh r0, [r3, r2]
	movs r2, #0x20
	ldrsh r1, [r3, r2]
	adds r0, r0, r1
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bls _08073AB8
	adds r2, r3, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08073AC0
	str r0, [r3, #0x1c]
_08073AB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073AC0: .4byte 0x08007141
	thumb_func_end sub_08073A54

	thumb_func_start SpriteCB_StatusSummaryBallsOnSwitchout
SpriteCB_StatusSummaryBallsOnSwitchout: @ 0x08073AC4
	ldrh r2, [r0, #0x2e]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08073AE0
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r2, [r1, #0x24]
	strh r2, [r0, #0x24]
	ldrh r1, [r1, #0x26]
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
_08073AE0: .4byte 0x020205AC
	thumb_func_end SpriteCB_StatusSummaryBallsOnSwitchout

	thumb_func_start UpdateNickInHealthbox
UpdateNickInHealthbox: @ 0x08073AE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r5, _08073B64
	ldr r1, _08073B68
	adds r0, r5, #0
	bl StringCopy
	adds r0, r4, #0
	movs r1, #2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r0, r5, #0
	mov r1, sp
	bl StringAppend
	adds r7, r0, #0
	adds r0, r4, #0
	bl GetMonGender
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	cmp r0, #0x1d
	beq _08073B40
	cmp r0, #0x20
	bne _08073B56
_08073B40:
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r0, _08073B6C
	adds r1, r1, r0
	mov r0, sp
	bl StringCompare
	cmp r0, #0
	bne _08073B56
	movs r5, #0x64
_08073B56:
	cmp r5, #0
	beq _08073B74
	cmp r5, #0xfe
	beq _08073B7C
	ldr r1, _08073B70
	b _08073B7E
	.align 2, 0
_08073B64: .4byte 0x02022AE0
_08073B68: .4byte 0x085CC4EA
_08073B6C: .4byte 0x082EA31C
_08073B70: .4byte 0x085CC4FA
_08073B74:
	ldr r1, _08073B78
	b _08073B7E
	.align 2, 0
_08073B78: .4byte 0x085CC4F0
_08073B7C:
	ldr r1, _08073C20
_08073B7E:
	adds r0, r7, #0
	bl StringCopy
	ldr r1, _08073C24
	mov r2, sl
	lsls r5, r2, #4
	adds r0, r5, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	ldr r1, _08073C28
	ldr r2, [r1]
	movs r1, #0xba
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	movs r0, #0xa4
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, [r2]
	adds r7, r0, r1
	ldr r4, _08073C2C
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r6, r8
	subs r6, #6
	movs r1, #0
	mov sb, r1
	mov r2, r8
	adds r0, r2, r4
	movs r2, #6
	subs r2, r2, r6
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl StringFill
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	ldr r1, _08073C30
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r7, #0
	movs r1, #7
	adds r2, r4, #0
	bl RenderTextFont9
	movs r6, #3
	cmp sb, r8
	bhs _08073C72
_08073BFE:
	ldr r0, _08073C2C
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x37
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bls _08073C1C
	adds r0, r1, #0
	adds r0, #0x79
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _08073C34
_08073C1C:
	movs r0, #0x2c
	b _08073C52
	.align 2, 0
_08073C20: .4byte 0x085CC4F5
_08073C24: .4byte 0x020205AC
_08073C28: .4byte 0x02024178
_08073C2C: .4byte 0x02022AE0
_08073C30: .4byte 0xFFFA0000
_08073C34:
	adds r0, r1, #0
	subs r0, #0x4b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08073C4C
	adds r0, r1, #0
	adds r0, #0x65
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _08073C50
_08073C4C:
	movs r0, #0x2d
	b _08073C52
_08073C50:
	movs r0, #0x2b
_08073C52:
	bl GetHealthboxElementGfxPtr
	mov r2, sb
	lsls r1, r2, #6
	adds r1, r7, r1
	ldr r2, _08073CE8
	bl CpuSet
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r6, #1
	cmp sb, r8
	blo _08073BFE
_08073C72:
	ldr r1, _08073CEC
	mov r2, sl
	adds r0, r5, r2
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08073CF4
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08073CF4
	movs r6, #0
	cmp r6, r8
	bge _08073D64
	ldr r0, _08073CF0
	mov sb, r0
	ldr r5, _08073CE8
_08073CA2:
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r1, r6, #2
	adds r0, r0, r1
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #5
	mov r2, sb
	adds r1, r0, r2
	adds r0, r7, #0
	adds r2, r5, #0
	bl CpuSet
	adds r7, #0x20
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r1, r6, #0
	adds r1, #0xa
	adds r0, r0, r1
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #5
	mov r2, sb
	adds r1, r0, r2
	adds r0, r7, #0
	adds r2, r5, #0
	bl CpuSet
	adds r7, #0x20
	adds r6, #1
	cmp r6, r8
	blt _08073CA2
	b _08073D64
	.align 2, 0
_08073CE8: .4byte 0x04000008
_08073CEC: .4byte 0x020205AC
_08073CF0: .4byte 0x06010000
_08073CF4:
	ldr r1, _08073D74
	mov r2, sl
	adds r0, r5, r2
	lsls r0, r0, #2
	adds r5, r0, r1
	ldrh r0, [r5, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08073D12
	movs r0, #1
	str r0, [sp, #0xc]
_08073D12:
	movs r6, #0
	cmp r6, r8
	bge _08073D64
	ldr r1, _08073D78
	mov sl, r1
	ldr r2, _08073D7C
	mov sb, r2
_08073D20:
	ldrh r0, [r5, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r4, r6, #1
	adds r0, r0, r4
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #5
	mov r2, sl
	adds r1, r0, r2
	adds r0, r7, #0
	mov r2, sb
	bl CpuSet
	adds r7, #0x20
	ldrh r0, [r5, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r1, r6, #0
	adds r1, #9
	adds r0, r0, r1
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #5
	mov r2, sl
	adds r1, r0, r2
	adds r0, r7, #0
	mov r2, sb
	bl CpuSet
	adds r7, #0x20
	adds r6, r4, #0
	cmp r6, r8
	blt _08073D20
_08073D64:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073D74: .4byte 0x020205AC
_08073D78: .4byte 0x06010000
_08073D7C: .4byte 0x04000008
	thumb_func_end UpdateNickInHealthbox

	thumb_func_start TryAddPokeballIconToHealthbox
TryAddPokeballIconToHealthbox: @ 0x08073D80
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r0, _08073E1C
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08073E56
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	bne _08073E56
	ldr r6, _08073E20
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r5, r0, r6
	ldrh r0, [r5, #0x3a]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08073E56
	ldr r1, _08073E24
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08073E28
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08073E56
	ldrh r0, [r5, #0x38]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r7, #0
	beq _08073E34
	movs r0, #0x46
	bl GetHealthboxElementGfxPtr
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r2, _08073E2C
	adds r1, r1, r2
	ldr r2, _08073E30
	bl CpuSet
	b _08073E56
	.align 2, 0
_08073E1C: .4byte 0x02022C90
_08073E20: .4byte 0x020205AC
_08073E24: .4byte 0x02023D12
_08073E28: .4byte 0x020243E8
_08073E2C: .4byte 0x06010000
_08073E30: .4byte 0x04000008
_08073E34:
	str r7, [sp]
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r0, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, _08073E60
	adds r1, r1, r0
	ldr r2, _08073E64
	mov r0, sp
	bl CpuSet
_08073E56:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073E60: .4byte 0x06010000
_08073E64: .4byte 0x05000008
	thumb_func_end TryAddPokeballIconToHealthbox

	thumb_func_start UpdateStatusIconInHealthbox
UpdateStatusIconInHealthbox: @ 0x08073E68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _08073ECC
	mov r2, sb
	lsls r1, r2, #4
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x3a]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r1, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08073ED8
	ldr r1, _08073ED0
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08073ED4
	adds r0, r0, r1
	movs r1, #0x37
	bl GetMonData
	adds r4, r0, #0
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	movs r3, #0x12
	mov r8, r3
	cmp r0, #0
	bne _08073EF4
	movs r0, #0x1a
	mov r8, r0
	b _08073EF4
	.align 2, 0
_08073ECC: .4byte 0x020205AC
_08073ED0: .4byte 0x02023D12
_08073ED4: .4byte 0x02024190
_08073ED8:
	ldr r1, _08073F14
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08073F18
	adds r0, r0, r1
	movs r1, #0x37
	bl GetMonData
	adds r4, r0, #0
	movs r1, #0x11
	mov r8, r1
_08073EF4:
	movs r0, #7
	ands r0, r4
	cmp r0, #0
	beq _08073F1C
	movs r0, #0x1b
	adds r1, r7, #0
	bl GetStatusIconForBattlerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetHealthboxElementGfxPtr
	adds r6, r0, #0
	movs r0, #2
	b _08074028
	.align 2, 0
_08073F14: .4byte 0x02023D12
_08073F18: .4byte 0x020243E8
_08073F1C:
	movs r0, #0x88
	ands r0, r4
	cmp r0, #0
	beq _08073F3A
	movs r0, #0x15
	adds r1, r7, #0
	bl GetStatusIconForBattlerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetHealthboxElementGfxPtr
	adds r6, r0, #0
	movs r0, #0
	b _08074028
_08073F3A:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _08073F58
	movs r0, #0x21
	adds r1, r7, #0
	bl GetStatusIconForBattlerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetHealthboxElementGfxPtr
	adds r6, r0, #0
	movs r0, #4
	b _08074028
_08073F58:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _08073F76
	movs r0, #0x1e
	adds r1, r7, #0
	bl GetStatusIconForBattlerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetHealthboxElementGfxPtr
	adds r6, r0, #0
	movs r0, #3
	b _08074028
_08073F76:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _08073F94
	movs r0, #0x18
	adds r1, r7, #0
	bl GetStatusIconForBattlerId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetHealthboxElementGfxPtr
	adds r6, r0, #0
	movs r0, #1
	b _08074028
_08073F94:
	movs r0, #0x27
	bl GetHealthboxElementGfxPtr
	adds r6, r0, #0
	movs r4, #0
	mov r2, sb
	lsls r0, r2, #4
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	lsls r7, r7, #2
	ldr r1, _08074014
	add r0, sb
	lsls r0, r0, #2
	adds r5, r0, r1
_08073FB2:
	ldrh r1, [r5, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	mov r2, r8
	asrs r0, r2, #0x10
	adds r1, r1, r0
	adds r1, r1, r4
	lsls r1, r1, #5
	ldr r3, _08074018
	adds r1, r1, r3
	adds r0, r6, #0
	ldr r2, _0807401C
	bl CpuSet
	adds r4, #1
	cmp r4, #2
	ble _08073FB2
	ldr r0, _08074020
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08074008
	movs r0, #1
	bl GetHealthboxElementGfxPtr
	ldr r2, _08074014
	mov r3, sl
	lsls r1, r3, #4
	add r1, sl
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	ldr r2, _08074018
	adds r1, r1, r2
	ldr r2, _08074024
	bl CpuSet
_08074008:
	mov r0, sb
	movs r1, #1
	bl TryAddPokeballIconToHealthbox
	b _080740EA
	.align 2, 0
_08074014: .4byte 0x020205AC
_08074018: .4byte 0x06010000
_0807401C: .4byte 0x04000008
_08074020: .4byte 0x02024174
_08074024: .4byte 0x04000010
_08074028:
	mov r1, sb
	lsls r5, r1, #4
	add r5, sb
	lsls r5, r5, #2
	ldr r2, _080740F8
	adds r5, r5, r2
	ldrb r4, [r5, #5]
	lsrs r4, r4, #4
	lsls r4, r4, #4
	adds r4, #0xc
	adds r4, r4, r7
	ldr r1, _080740FC
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r4, r3
	movs r2, #2
	bl FillPalette
	lsls r4, r4, #1
	ldr r0, _08074100
	adds r0, r4, r0
	ldr r1, _08074104
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #1
	bl CpuSet
	ldrh r1, [r5, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	add r1, r8
	lsls r1, r1, #5
	ldr r2, _08074108
	mov r8, r2
	add r1, r8
	ldr r2, _0807410C
	adds r0, r6, #0
	bl CpuSet
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08074096
	adds r0, r7, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080740E2
_08074096:
	ldr r0, _08074110
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080740E2
	movs r0, #0
	bl GetHealthboxElementGfxPtr
	mov r3, sl
	lsls r4, r3, #4
	add r4, sl
	lsls r4, r4, #2
	ldr r1, _080740F8
	adds r4, r4, r1
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	add r1, r8
	ldr r5, _08074114
	adds r2, r5, #0
	bl CpuSet
	movs r0, #0x41
	bl GetHealthboxElementGfxPtr
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x11
	adds r1, #0x20
	add r1, r8
	adds r2, r5, #0
	bl CpuSet
_080740E2:
	mov r0, sb
	movs r1, #0
	bl TryAddPokeballIconToHealthbox
_080740EA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080740F8: .4byte 0x020205AC
_080740FC: .4byte 0x082FCE02
_08074100: .4byte 0x020375B4
_08074104: .4byte 0x05000200
_08074108: .4byte 0x06010000
_0807410C: .4byte 0x04000018
_08074110: .4byte 0x02024174
_08074114: .4byte 0x04000008
	thumb_func_end UpdateStatusIconInHealthbox

	thumb_func_start GetStatusIconForBattlerId
GetStatusIconForBattlerId: @ 0x08074118
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x15
	cmp r0, #0xc
	bhi _080741D8
	lsls r0, r0, #2
	ldr r1, _08074134
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08074134: .4byte 0x08074138
_08074138: @ jump table
	.4byte _0807416C @ case 0
	.4byte _080741D8 @ case 1
	.4byte _080741D8 @ case 2
	.4byte _08074182 @ case 3
	.4byte _080741D8 @ case 4
	.4byte _080741D8 @ case 5
	.4byte _08074198 @ case 6
	.4byte _080741D8 @ case 7
	.4byte _080741D8 @ case 8
	.4byte _080741AE @ case 9
	.4byte _080741D8 @ case 10
	.4byte _080741D8 @ case 11
	.4byte _080741C4 @ case 12
_0807416C:
	movs r2, #0x15
	cmp r3, #0
	beq _080741D8
	movs r2, #0x47
	cmp r3, #1
	beq _080741D8
	movs r2, #0x65
	cmp r3, #2
	bne _080741D8
	movs r2, #0x56
	b _080741D8
_08074182:
	movs r2, #0x18
	cmp r3, #0
	beq _080741D8
	movs r2, #0x4a
	cmp r3, #1
	beq _080741D8
	movs r2, #0x68
	cmp r3, #2
	bne _080741D8
	movs r2, #0x59
	b _080741D8
_08074198:
	movs r2, #0x1b
	cmp r3, #0
	beq _080741D8
	movs r2, #0x4d
	cmp r3, #1
	beq _080741D8
	movs r2, #0x6b
	cmp r3, #2
	bne _080741D8
	movs r2, #0x5c
	b _080741D8
_080741AE:
	movs r2, #0x1e
	cmp r3, #0
	beq _080741D8
	movs r2, #0x50
	cmp r3, #1
	beq _080741D8
	movs r2, #0x6e
	cmp r3, #2
	bne _080741D8
	movs r2, #0x5f
	b _080741D8
_080741C4:
	movs r2, #0x21
	cmp r3, #0
	beq _080741D8
	movs r2, #0x53
	cmp r3, #1
	beq _080741D8
	movs r2, #0x71
	cmp r3, #2
	bne _080741D8
	movs r2, #0x62
_080741D8:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetStatusIconForBattlerId

	thumb_func_start AddTextPrinterAndCreateWindowOnHealthbox
AddTextPrinterAndCreateWindowOnHealthbox: @ 0x080741E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _08074254
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	ldr r1, _08074258
	ldr r2, [r1]
	movs r1, #0xba
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	movs r0, #0xa4
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, [r2]
	adds r6, r0, r1
	movs r1, #7
	mov r8, r1
	ldr r2, _0807425C
	adds r0, r6, #0
	bl RenderTextFont9
	movs r7, #3
	movs r4, #0
_08074230:
	ldr r0, _0807425C
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x37
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bls _0807424E
	adds r0, r1, #0
	adds r0, #0x79
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _08074260
_0807424E:
	movs r0, #0x2c
	b _0807427E
	.align 2, 0
_08074254: .4byte 0x020205AC
_08074258: .4byte 0x02024178
_0807425C: .4byte 0x085ABC38
_08074260:
	adds r0, r1, #0
	subs r0, #0x4b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08074278
	adds r0, r1, #0
	adds r0, #0x65
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _0807427C
_08074278:
	movs r0, #0x2d
	b _0807427E
_0807427C:
	movs r0, #0x2b
_0807427E:
	bl GetHealthboxElementGfxPtr
	lsls r1, r4, #6
	adds r1, r6, r1
	ldr r2, _08074314
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, #1
	cmp r4, r8
	blo _08074230
	movs r7, #3
	movs r2, #3
	add r2, r8
	mov sb, r2
	cmp r7, sb
	bge _08074304
	ldr r1, _08074318
	ldr r0, _08074314
	mov sl, r0
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r8, r0
_080742B4:
	mov r1, r8
	ldrh r0, [r1, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r5, r7, #0
	cmp r7, #0
	bge _080742C4
	adds r5, r7, #7
_080742C4:
	asrs r5, r5, #3
	lsls r4, r5, #3
	subs r4, r7, r4
	adds r0, r0, r4
	lsls r5, r5, #6
	adds r0, r0, r5
	lsls r0, r0, #5
	ldr r2, _0807431C
	adds r1, r0, r2
	adds r0, r6, #0
	mov r2, sl
	bl CpuSet
	adds r6, #0x20
	mov r1, r8
	ldrh r0, [r1, #4]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r4, #8
	adds r0, r0, r4
	adds r0, r0, r5
	lsls r0, r0, #5
	ldr r2, _0807431C
	adds r1, r0, r2
	adds r0, r6, #0
	mov r2, sl
	bl CpuSet
	adds r6, #0x20
	adds r7, #1
	cmp r7, sb
	blt _080742B4
_08074304:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074314: .4byte 0x04000008
_08074318: .4byte 0x020205AC
_0807431C: .4byte 0x06010000
	thumb_func_end AddTextPrinterAndCreateWindowOnHealthbox

	thumb_func_start sub_08074320
sub_08074320: @ 0x08074320
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080743D0
	mov r8, r0
	ldr r1, _080743D4
	bl StringCopy
	adds r7, r0, #0
	ldr r0, _080743D8
	ldrb r1, [r0]
	adds r0, r7, #0
	movs r2, #1
	movs r3, #2
	bl ConvertIntToDecimalStringN
	adds r7, r0, #0
	ldr r1, _080743DC
	bl StringAppend
	ldr r0, _080743E0
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerPosition
	ldr r1, _080743E4
	ldr r2, [r1]
	movs r1, #0xba
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	movs r0, #0xa4
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, [r2]
	adds r7, r0, r1
	movs r6, #7
	adds r0, r7, #0
	movs r1, #7
	mov r2, r8
	bl RenderTextFont9
	adds r7, #0x20
	movs r5, #4
_08074390:
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x16
	lsrs r2, r0, #0x16
	adds r0, r5, #0
	cmp r5, #0
	bge _0807439E
	adds r0, r5, #7
_0807439E:
	asrs r0, r0, #3
	lsls r1, r0, #3
	subs r1, r5, r1
	adds r1, #0x18
	adds r1, r2, r1
	lsls r0, r0, #6
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r0, _080743E8
	adds r1, r1, r0
	adds r0, r7, #0
	ldr r2, _080743EC
	bl CpuSet
	adds r7, #0x40
	adds r5, #1
	adds r0, r6, #4
	cmp r5, r0
	blt _08074390
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080743D0: .4byte 0x02022AE0
_080743D4: .4byte 0x085ABC43
_080743D8: .4byte 0x02039D18
_080743DC: .4byte 0x085ABC4B
_080743E0: .4byte 0x020205AC
_080743E4: .4byte 0x02024178
_080743E8: .4byte 0x06010000
_080743EC: .4byte 0x04000008
	thumb_func_end sub_08074320

	thumb_func_start UpdateHealthboxAttribute
UpdateHealthboxAttribute: @ 0x080743F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r1, _0807459C
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r7, #0
	bne _0807442C
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807442C
	mov r0, sb
	bl GetBattlerSide
_0807442C:
	ldr r1, _0807459C
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08074448
	b _080745A8
_08074448:
	cmp r7, #3
	beq _08074450
	cmp r7, #0
	bne _08074464
_08074450:
	mov r0, r8
	movs r1, #0x38
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl UpdateLvlInHealthbox
_08074464:
	cmp r7, #1
	bhi _0807447E
	mov r0, r8
	movs r1, #0x39
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	movs r2, #0
	bl sub_080726F4
_0807447E:
	cmp r7, #2
	beq _08074486
	cmp r7, #0
	bne _0807449C
_08074486:
	mov r0, r8
	movs r1, #0x3a
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	movs r2, #1
	bl sub_080726F4
_0807449C:
	cmp r7, #5
	beq _080744A4
	cmp r7, #0
	bne _080744D8
_080744A4:
	movs r0, #0
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, #0x3a
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0x39
	bl GetMonData
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r4, #0
	bl SetBattleBarStruct
	mov r0, sb
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl MoveBattleBar
_080744D8:
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0
	bne _0807455E
	cmp r7, #6
	beq _080744EE
	cmp r7, #0
	bne _0807455E
_080744EE:
	movs r0, #3
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, #0xb
	bl GetMonData
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	movs r1, #0x38
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, r8
	movs r1, #0x19
	bl GetMonData
	adds r3, r0, #0
	ldr r0, _080745A0
	mov ip, r0
	lsls r1, r4, #2
	ldr r2, _080745A4
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #0x13]
	movs r0, #0xca
	lsls r0, r0, #1
	muls r0, r2, r0
	adds r1, r1, r0
	add r1, ip
	ldr r1, [r1]
	subs r3, r3, r1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r0
	add r4, ip
	ldr r2, [r4]
	subs r2, r2, r1
	mov r0, sl
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	bl SetBattleBarStruct
	mov r0, sb
	adds r1, r6, #0
	movs r2, #1
	movs r3, #0
	bl MoveBattleBar
_0807455E:
	cmp r7, #4
	beq _08074566
	cmp r7, #0
	bne _0807456E
_08074566:
	adds r0, r6, #0
	mov r1, r8
	bl UpdateNickInHealthbox
_0807456E:
	cmp r7, #9
	beq _08074576
	cmp r7, #0
	bne _0807457C
_08074576:
	adds r0, r6, #0
	bl UpdateStatusIconInHealthbox
_0807457C:
	cmp r7, #0xa
	bne _08074586
	adds r0, r6, #0
	bl AddTextPrinterAndCreateWindowOnHealthbox
_08074586:
	adds r0, r7, #0
	subs r0, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0807461E
	adds r0, r6, #0
	bl sub_08074320
	b _0807461E
	.align 2, 0
_0807459C: .4byte 0x020205AC
_080745A0: .4byte 0x082F00B4
_080745A4: .4byte 0x082F0D54
_080745A8:
	cmp r7, #3
	beq _080745B0
	cmp r7, #0
	bne _080745C4
_080745B0:
	mov r0, r8
	movs r1, #0x38
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl UpdateLvlInHealthbox
_080745C4:
	cmp r7, #5
	beq _080745CC
	cmp r7, #0
	bne _08074600
_080745CC:
	movs r0, #0
	bl LoadBattleBarGfx
	mov r0, r8
	movs r1, #0x3a
	bl GetMonData
	adds r4, r0, #0
	mov r0, r8
	movs r1, #0x39
	bl GetMonData
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r4, #0
	bl SetBattleBarStruct
	mov r0, sb
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl MoveBattleBar
_08074600:
	cmp r7, #4
	beq _08074608
	cmp r7, #0
	bne _08074610
_08074608:
	adds r0, r6, #0
	mov r1, r8
	bl UpdateNickInHealthbox
_08074610:
	cmp r7, #9
	beq _08074618
	cmp r7, #0
	bne _0807461E
_08074618:
	adds r0, r6, #0
	bl UpdateStatusIconInHealthbox
_0807461E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateHealthboxAttribute

	thumb_func_start MoveBattleBar
MoveBattleBar: @ 0x08074630
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	cmp r2, #0
	bne _0807467C
	ldr r0, _08074678
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	mov r1, r8
	lsls r5, r1, #2
	adds r3, r5, r1
	lsls r3, r3, #2
	adds r3, r3, r0
	ldr r0, [r3, #4]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	adds r3, #0x10
	movs r4, #6
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	bl CalcNewBarValue
	adds r4, r0, #0
	adds r7, r5, #0
	b _080746D8
	.align 2, 0
_08074678: .4byte 0x02024174
_0807467C:
	ldr r2, _08074728
	mov sl, r2
	ldr r0, [r2]
	ldr r2, [r0, #0xc]
	mov r0, r8
	lsls r4, r0, #2
	adds r0, r4, r0
	lsls r6, r0, #2
	adds r2, r6, r2
	ldr r0, [r2, #8]
	ldr r1, [r2, #0xc]
	ldr r2, [r2, #4]
	movs r3, #8
	bl GetScaledExpFraction
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r4, #0
	cmp r5, #0
	bne _080746A6
	movs r5, #1
_080746A6:
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	adds r4, r6, r0
	ldr r6, [r4, #0xc]
	adds r0, r6, #0
	adds r1, r5, #0
	bl __divsi3
	cmp r0, #0
	bge _080746BE
	rsbs r0, r0, #0
_080746BE:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	adds r3, r4, #0
	adds r3, #0x10
	movs r2, #8
	str r2, [sp]
	str r5, [sp, #4]
	adds r2, r6, #0
	bl CalcNewBarValue
	adds r4, r0, #0
_080746D8:
	mov r2, sb
	cmp r2, #1
	beq _080746F4
	cmp r2, #0
	bne _080746FC
	ldr r0, _08074728
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080746FC
_080746F4:
	mov r0, r8
	mov r1, sb
	bl MoveBattleBarGraphically
_080746FC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08074716
	ldr r0, _08074728
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	mov r2, r8
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0, #0x10]
_08074716:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074728: .4byte 0x02024174
	thumb_func_end MoveBattleBar

	thumb_func_start MoveBattleBarGraphically
MoveBattleBarGraphically: @ 0x0807472C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0
	beq _08074748
	cmp r1, #1
	beq _08074830
	b _0807492E
_08074748:
	ldr r0, _080747DC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	lsls r5, r6, #2
	adds r3, r5, r6
	lsls r3, r3, #2
	adds r3, r3, r0
	ldr r0, [r3, #4]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	adds r3, #0x10
	add r4, sp, #8
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	bl CalcBarFilledPixels
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	mov sb, r1
	adds r7, r5, #0
	cmp r0, #0x18
	bhi _08074784
	movs r2, #0x38
	mov sb, r2
	cmp r0, #9
	bls _08074784
	movs r4, #0x2f
	mov sb, r4
_08074784:
	movs r5, #0
	ldr r0, _080747E0
	mov r8, r0
_0807478A:
	ldr r0, _080747DC
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r7, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #0x38]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r5, #1
	bhi _080747EC
	mov r0, sb
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r1, r5
	adds r1, #8
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r0, r0, r1
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	add r1, r8
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r2, r5, #2
	adds r1, r1, r2
	lsls r1, r1, #5
	ldr r2, _080747E4
	adds r1, r1, r2
	ldr r2, _080747E8
	bl CpuSet
	b _0807481A
	.align 2, 0
_080747DC: .4byte 0x02024174
_080747E0: .4byte 0x020205AC
_080747E4: .4byte 0x06010000
_080747E8: .4byte 0x04000008
_080747EC:
	mov r0, sb
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r1, r5
	adds r1, #8
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r0, r0, r1
	lsls r1, r4, #4
	adds r1, r1, r4
	lsls r1, r1, #2
	add r1, r8
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r1, r5, r1
	lsls r1, r1, #5
	ldr r4, _08074828
	adds r1, r1, r4
	ldr r2, _0807482C
	bl CpuSet
_0807481A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0807478A
	b _0807492E
	.align 2, 0
_08074828: .4byte 0x06010040
_0807482C: .4byte 0x04000008
_08074830:
	ldr r0, _080748D4
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	lsls r5, r6, #2
	adds r3, r5, r6
	lsls r3, r3, #2
	adds r3, r3, r0
	ldr r0, [r3, #4]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	adds r3, #0x10
	add r4, sp, #8
	str r4, [sp]
	movs r4, #8
	str r4, [sp, #4]
	bl CalcBarFilledPixels
	ldr r1, _080748D8
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _080748DC
	adds r0, r0, r1
	movs r1, #0x38
	bl GetMonData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r5, #0
	cmp r0, #0x64
	bne _08074888
	movs r5, #0
	movs r1, #0
_08074876:
	mov r0, sp
	adds r0, r0, r5
	adds r0, #8
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _08074876
_08074888:
	movs r5, #0
	ldr r0, _080748E0
	mov r8, r0
	adds r0, r7, r6
	lsls r4, r0, #2
_08074892:
	cmp r5, #3
	bhi _080748EC
	movs r0, #0xc
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r1, r5
	adds r1, #8
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080748D4
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	adds r1, r4, r1
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r2, r5, #0
	adds r2, #0x24
	adds r1, r1, r2
	lsls r1, r1, #5
	ldr r2, _080748E4
	adds r1, r1, r2
	ldr r2, _080748E8
	bl CpuSet
	b _08074924
	.align 2, 0
_080748D4: .4byte 0x02024174
_080748D8: .4byte 0x02023D12
_080748DC: .4byte 0x02024190
_080748E0: .4byte 0x020205AC
_080748E4: .4byte 0x06010000
_080748E8: .4byte 0x04000008
_080748EC:
	movs r0, #0xc
	bl GetHealthboxElementGfxPtr
	mov r1, sp
	adds r1, r1, r5
	adds r1, #8
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _0807493C
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	adds r1, r4, r1
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	ldrh r1, [r1, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	adds r1, r5, r1
	lsls r1, r1, #5
	ldr r2, _08074940
	adds r1, r1, r2
	ldr r2, _08074944
	bl CpuSet
_08074924:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _08074892
_0807492E:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807493C: .4byte 0x02024174
_08074940: .4byte 0x06010B80
_08074944: .4byte 0x04000008
	thumb_func_end MoveBattleBarGraphically

	thumb_func_start CalcNewBarValue
CalcNewBarValue: @ 0x08074948
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x1b
	lsrs r2, r1, #0x18
	ldr r1, [r5]
	ldr r0, _08074974
	cmp r1, r0
	bne _0807497A
	cmp r7, r2
	bge _08074978
	lsls r0, r4, #8
	str r0, [r5]
	b _0807497A
	.align 2, 0
_08074974: .4byte 0xFFFF8000
_08074978:
	str r4, [r5]
_0807497A:
	mov r0, r8
	subs r4, r4, r0
	cmp r4, #0
	bge _08074986
	movs r4, #0
	b _0807498C
_08074986:
	cmp r4, r7
	ble _0807498C
	adds r4, r7, #0
_0807498C:
	cmp r7, r2
	bge _080749A8
	ldr r0, [r5]
	asrs r1, r0, #8
	adds r6, r0, #0
	cmp r4, r1
	bne _080749B4
	movs r0, #0xff
	ands r0, r6
	cmp r0, #0
	bne _080749B4
	movs r0, #1
	rsbs r0, r0, #0
	b _08074A10
_080749A8:
	ldr r6, [r5]
	cmp r4, r6
	bne _080749B4
	movs r0, #1
	rsbs r0, r0, #0
	b _08074A10
_080749B4:
	cmp r7, r2
	bge _080749EE
	lsls r0, r7, #8
	adds r1, r2, #0
	bl __divsi3
	mov r1, r8
	cmp r1, #0
	bge _080749D2
	adds r0, r6, r0
	str r0, [r5]
	asrs r2, r0, #8
	cmp r2, r4
	blt _08074A0E
	b _080749E6
_080749D2:
	subs r0, r6, r0
	str r0, [r5]
	asrs r2, r0, #8
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0
	ble _080749E2
	adds r2, #1
_080749E2:
	cmp r2, r4
	bgt _08074A0E
_080749E6:
	lsls r0, r4, #8
	str r0, [r5]
	adds r2, r4, #0
	b _08074A0E
_080749EE:
	mov r0, r8
	cmp r0, #0
	bge _08074A00
	ldr r0, [r5]
	adds r0, r0, r3
	str r0, [r5]
	cmp r0, r4
	ble _08074A0C
	b _08074A0A
_08074A00:
	ldr r0, [r5]
	subs r0, r0, r3
	str r0, [r5]
	cmp r0, r4
	bge _08074A0C
_08074A0A:
	str r4, [r5]
_08074A0C:
	ldr r2, [r5]
_08074A0E:
	adds r0, r2, #0
_08074A10:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CalcNewBarValue

	thumb_func_start CalcBarFilledPixels
CalcBarFilledPixels: @ 0x08074A1C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	mov ip, r3
	ldr r7, [sp, #0x14]
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	subs r5, r1, r2
	cmp r5, #0
	bge _08074A34
	movs r5, #0
	b _08074A3A
_08074A34:
	cmp r5, r4
	ble _08074A3A
	adds r5, r4, #0
_08074A3A:
	lsls r0, r6, #0x1b
	lsrs r3, r0, #0x18
	movs r1, #0
	cmp r1, r6
	bhs _08074A54
	movs r2, #0
_08074A46:
	adds r0, r7, r1
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r6
	blo _08074A46
_08074A54:
	cmp r4, r3
	bge _08074A68
	mov r1, ip
	ldr r0, [r1]
	muls r0, r3, r0
	adds r1, r4, #0
	bl __divsi3
	asrs r0, r0, #8
	b _08074A74
_08074A68:
	mov r1, ip
	ldr r0, [r1]
	muls r0, r3, r0
	adds r1, r4, #0
	bl __divsi3
_08074A74:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r2, #0
	cmp r3, #0
	bne _08074A8A
	cmp r5, #0
	ble _08074A8A
	movs r0, #1
	strb r0, [r7]
	movs r3, #1
	b _08074AAE
_08074A8A:
	movs r1, #0
	movs r4, #8
_08074A8E:
	cmp r1, r6
	bhs _08074AAE
	cmp r2, #7
	bls _08074AAA
	adds r0, r7, r1
	strb r4, [r0]
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _08074A8E
_08074AAA:
	adds r0, r7, r1
	strb r2, [r0]
_08074AAE:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CalcBarFilledPixels

	thumb_func_start sub_08074AB8
sub_08074AB8: @ 0x08074AB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	movs r3, #6
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	adds r3, r6, #0
	bl CalcNewBarValue
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_08074B18
	ldr r0, [r5]
	cmp r0, #0x2f
	bgt _08074AF8
	ldr r0, [r6]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	b _08074AFA
_08074AF8:
	ldrh r1, [r6]
_08074AFA:
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	bl DummiedOutFunction
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_08074AB8

	thumb_func_start sub_08074B18
sub_08074B18: @ 0x08074B18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r3, r1, #0
	mov r8, r2
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r4, sp, #8
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	bl CalcBarFilledPixels
	movs r3, #0
	add r7, sp, #0x10
	mov ip, r7
	ldrb r0, [r5, #0xc]
	lsls r6, r0, #0x1b
	ldr r4, [r5, #0x10]
_08074B44:
	lsls r2, r3, #1
	add r2, ip
	lsrs r1, r6, #0xf
	mov r0, sp
	adds r0, r0, r3
	adds r0, #8
	ldrb r0, [r0]
	adds r0, r4, r0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08074B44
	adds r0, r7, #0
	mov r1, r8
	movs r2, #6
	bl CpuSet
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_08074B18

	thumb_func_start GetScaledExpFraction
GetScaledExpFraction: @ 0x08074B78
	push {r4, r5, r6, r7, lr}
	adds r6, r2, #0
	lsls r3, r3, #0x1b
	lsrs r7, r3, #0x18
	subs r5, r0, r1
	cmp r5, #0
	bge _08074B8A
	movs r5, #0
	b _08074B90
_08074B8A:
	cmp r5, r6
	ble _08074B90
	adds r5, r6, #0
_08074B90:
	muls r0, r7, r0
	adds r1, r6, #0
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	muls r0, r7, r0
	adds r1, r6, #0
	bl __divsi3
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r4, r0
	cmp r0, #0
	bge _08074BB8
	rsbs r0, r0, #0
_08074BB8:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetScaledExpFraction

	thumb_func_start GetScaledHPFraction
GetScaledHPFraction: @ 0x08074BC4
	push {r4, lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	muls r0, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08074BE8
	cmp r4, #0
	ble _08074BE8
	movs r0, #1
_08074BE8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetScaledHPFraction

	thumb_func_start GetHPBarLevel
GetHPBarLevel: @ 0x08074BF0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bne _08074C02
	movs r0, #4
	b _08074C1E
_08074C02:
	movs r2, #0x30
	bl GetScaledHPFraction
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	cmp r1, #0x18
	bhi _08074C1E
	movs r0, #2
	cmp r1, #9
	bhi _08074C1E
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
_08074C1E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetHPBarLevel

