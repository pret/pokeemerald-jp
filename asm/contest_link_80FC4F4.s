.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_080FCD64
sub_080FCD64: @ 0x080FCD64
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	ldr r5, _080FCD94
	adds r0, r5, #0
	adds r1, r2, #0
	adds r2, r4, #0
	bl memcpy
	bl bitmask_all_link_players_but_self
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	adds r2, r4, #0
	bl SendBlock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FCD98
	movs r0, #0
	b _080FCD9A
	.align 2, 0
_080FCD94: .4byte 0x0201C000
_080FCD98:
	movs r0, #1
_080FCD9A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_080FCD64

	thumb_func_start sub_080FCDA0
sub_080FCDA0: @ 0x080FCDA0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x80
	lsls r4, r4, #0x11
	lsls r4, r5
	lsrs r4, r4, #0x18
	bl GetBlockReceivedStatus
	ands r4, r0
	cmp r4, #0
	beq _080FCDC2
	adds r0, r5, #0
	bl ResetBlockReceivedFlag
	movs r0, #1
	b _080FCDC4
_080FCDC2:
	movs r0, #0
_080FCDC4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080FCDA0

	thumb_func_start sub_080FCDCC
sub_080FCDCC: @ 0x080FCDCC
	push {r4, lr}
	bl GetBlockReceivedStatus
	adds r4, r0, #0
	bl sub_0800A59C
	lsls r4, r4, #0x18
	lsls r0, r0, #0x18
	cmp r4, r0
	beq _080FCDE4
	movs r0, #0
	b _080FCDEA
_080FCDE4:
	bl ResetBlockReceivedFlags
	movs r0, #1
_080FCDEA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080FCDCC

	thumb_func_start sub_080FCDF0
sub_080FCDF0: @ 0x080FCDF0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r5, _080FCE24
	ldr r6, _080FCE28
	ldr r4, _080FCE2C
	movs r3, #0xff
_080FCE00:
	lsls r0, r1, #8
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080FCE00
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0, #8]
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FCE24: .4byte 0x03005B60
_080FCE28: .4byte 0x080FCE31
_080FCE2C: .4byte 0x0202207C
	thumb_func_end sub_080FCDF0

	thumb_func_start sub_080FCE30
sub_080FCE30: @ 0x080FCE30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080FCE44
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r0, _080FCE48
	str r0, [r1]
	bx lr
	.align 2, 0
_080FCE44: .4byte 0x03005B60
_080FCE48: .4byte 0x080FCE4D
	thumb_func_end sub_080FCE30

	thumb_func_start sub_080FCE4C
sub_080FCE4C: @ 0x080FCE4C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080FCEC8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080FCEC0
	bl GetMultiplayerId
	ldr r1, _080FCECC
	strb r0, [r1]
	bl GetLinkPlayerCount
	ldr r4, _080FCED0
	strb r0, [r4]
	ldr r1, _080FCED4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080FCED8
	ldrb r0, [r0]
	cmp r0, #1
	bne _080FCE7C
	movs r0, #3
	strb r0, [r1]
_080FCE7C:
	movs r3, #0
	ldrb r2, [r4]
	cmp r3, r2
	bge _080FCEBA
	ldr r1, _080FCEDC
	ldrb r0, [r1]
	subs r0, #1
	adds r6, r4, #0
	cmp r0, #1
	bls _080FCEAA
	adds r4, r2, #0
	adds r2, r1, #0
	movs r5, #0xff
_080FCE96:
	adds r2, #0x1c
	adds r3, #1
	cmp r3, r4
	bge _080FCEBA
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	subs r0, #1
	cmp r0, #1
	bhi _080FCE96
_080FCEAA:
	ldrb r6, [r6]
	cmp r3, r6
	bge _080FCEBA
	ldr r0, _080FCED4
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_080FCEBA:
	adds r0, r7, #0
	bl SwitchTaskToFollowupFunc
_080FCEC0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCEC8: .4byte 0x030031C4
_080FCECC: .4byte 0x02039BC5
_080FCED0: .4byte 0x02039BD0
_080FCED4: .4byte 0x02039BCA
_080FCED8: .4byte 0x0300319C
_080FCEDC: .4byte 0x020226A0
	thumb_func_end sub_080FCE4C

	thumb_func_start sub_080FCEE0
sub_080FCEE0: @ 0x080FCEE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080FCF0C
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080FCF08
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080FCF10
	cmp r0, #1
	beq _080FCF1E
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080FCF24
_080FCF08:
	movs r0, #1
	b _080FCF26
	.align 2, 0
_080FCF0C: .4byte 0x02039BCA
_080FCF10:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FCF24
	bl sub_0800A8D4
_080FCF1E:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080FCF24:
	movs r0, #0
_080FCF26:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_080FCEE0

	thumb_func_start sub_080FCF2C
sub_080FCF2C: @ 0x080FCF2C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r7, r5, #2
	adds r0, r7, r5
	lsls r4, r0, #3
	ldr r6, _080FCF60
	adds r0, r4, r6
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	bne _080FCF48
	b _080FD04C
_080FCF48:
	adds r0, r6, #0
	subs r0, #8
	adds r4, r4, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080FCFC4
	cmp r0, #1
	bgt _080FCF64
	cmp r0, #0
	beq _080FCF6A
	b _080FD034
	.align 2, 0
_080FCF60: .4byte 0x03005B68
_080FCF64:
	cmp r0, #0xa
	beq _080FD018
	b _080FD034
_080FCF6A:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FCFA4
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD04C
	ldr r0, _080FCF98
	ldr r1, _080FCF9C
	ldrb r1, [r1]
	lsls r1, r1, #6
	ldr r2, _080FCFA0
	adds r1, r1, r2
	movs r2, #0x40
	bl memcpy
	movs r0, #0xa
	strh r0, [r4, #8]
	b _080FD04C
	.align 2, 0
_080FCF98: .4byte 0x0202257C
_080FCF9C: .4byte 0x02039BC5
_080FCFA0: .4byte 0x02039AA0
_080FCFA4:
	ldr r0, _080FCFB8
	ldr r1, _080FCFBC
	ldrb r1, [r1]
	lsls r1, r1, #6
	ldr r2, _080FCFC0
	adds r1, r1, r2
	movs r2, #0x40
	bl memcpy
	b _080FD02E
	.align 2, 0
_080FCFB8: .4byte 0x0202257C
_080FCFBC: .4byte 0x02039BC5
_080FCFC0: .4byte 0x02039AA0
_080FCFC4:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD04C
	movs r4, #0
	ldr r0, _080FCFD8
	adds r6, r7, #0
	b _080FCFF2
	.align 2, 0
_080FCFD8: .4byte 0x02039BD0
_080FCFDC:
	lsls r0, r4, #6
	ldr r1, _080FD008
	adds r0, r0, r1
	lsls r1, r4, #8
	ldr r2, _080FD00C
	adds r1, r1, r2
	movs r2, #0x40
	bl memcpy
	adds r4, #1
	ldr r0, _080FD010
_080FCFF2:
	ldrb r0, [r0]
	cmp r4, r0
	blt _080FCFDC
	ldr r0, _080FD014
	adds r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080FD04C
	.align 2, 0
_080FD008: .4byte 0x02039AA0
_080FD00C: .4byte 0x0202207C
_080FD010: .4byte 0x02039BD0
_080FD014: .4byte 0x03005B60
_080FD018:
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	ble _080FD04C
	movs r0, #2
	bl sub_0800A09C
_080FD02E:
	movs r0, #1
	strh r0, [r4, #8]
	b _080FD04C
_080FD034:
	ldr r0, _080FD054
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0x1e]
	strh r0, [r1, #0x20]
	adds r0, r5, #0
	bl SwitchTaskToFollowupFunc
_080FD04C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD054: .4byte 0x03005B60
	thumb_func_end sub_080FCF2C

	thumb_func_start sub_080FD058
sub_080FD058: @ 0x080FD058
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080FD080
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r5, r0, r1
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080FD084
	cmp r0, #1
	beq _080FD0AC
	movs r0, #0
	strh r0, [r5, #8]
	adds r0, r2, #0
	bl SwitchTaskToFollowupFunc
	b _080FD0D4
	.align 2, 0
_080FD080: .4byte 0x03005B60
_080FD084:
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD0CE
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD0D4
	ldr r0, _080FD0A8
	movs r1, #4
	bl sub_080FCD64
	cmp r0, #1
	bne _080FD0D4
	b _080FD0CE
	.align 2, 0
_080FD0A8: .4byte 0x03005AE0
_080FD0AC:
	movs r0, #0
	bl sub_080FCDA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD0D4
	ldr r0, _080FD0DC
	ldr r4, _080FD0E0
	adds r1, r4, #0
	movs r2, #4
	bl memcpy
	ldr r0, _080FD0E4
	adds r1, r4, #0
	movs r2, #4
	bl memcpy
_080FD0CE:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
_080FD0D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FD0DC: .4byte 0x03005AE0
_080FD0E0: .4byte 0x0202207C
_080FD0E4: .4byte 0x03005E18
	thumb_func_end sub_080FD058

	thumb_func_start sub_080FD0E8
sub_080FD0E8: @ 0x080FD0E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	mov r8, r0
	adds r0, r0, r6
	lsls r5, r0, #3
	ldr r7, _080FD128
	adds r0, r5, r7
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _080FD1DA
	movs r1, #8
	rsbs r1, r1, #0
	adds r1, r1, r7
	mov sb, r1
	adds r4, r5, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080FD160
	cmp r0, #1
	bgt _080FD12C
	cmp r0, #0
	beq _080FD132
	b _080FD1C2
	.align 2, 0
_080FD128: .4byte 0x03005B68
_080FD12C:
	cmp r0, #0xa
	beq _080FD1A8
	b _080FD1C2
_080FD132:
	ldr r1, _080FD154
	ldrh r0, [r4, #0x1a]
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD158
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD1DA
	movs r0, #0xa
	strh r0, [r4, #8]
	b _080FD1DA
	.align 2, 0
_080FD154: .4byte 0x0202257C
_080FD158:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080FD1DA
_080FD160:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD1DA
	movs r3, #0
	ldr r1, _080FD1A0
	ldrb r0, [r1]
	cmp r3, r0
	bge _080FD18E
	ldr r4, _080FD1A4
	adds r0, r7, #2
	adds r2, r5, r0
	movs r5, #0x80
	lsls r5, r5, #1
_080FD17E:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, r4, r5
	adds r2, #2
	adds r3, #1
	ldrb r0, [r1]
	cmp r3, r0
	blt _080FD17E
_080FD18E:
	mov r0, r8
	adds r1, r0, r6
	lsls r1, r1, #3
	add r1, sb
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080FD1DA
	.align 2, 0
_080FD1A0: .4byte 0x02039BD0
_080FD1A4: .4byte 0x0202207C
_080FD1A8:
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _080FD1DA
	movs r0, #2
	bl sub_0800A09C
	movs r0, #1
	strh r0, [r4, #8]
	b _080FD1DA
_080FD1C2:
	ldr r0, _080FD1E8
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0x1e]
	strh r0, [r1, #0x20]
	adds r0, r6, #0
	bl SwitchTaskToFollowupFunc
_080FD1DA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD1E8: .4byte 0x03005B60
	thumb_func_end sub_080FD0E8

	thumb_func_start sub_080FD1EC
sub_080FD1EC: @ 0x080FD1EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080FD214
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080FD218
	cmp r0, #1
	beq _080FD234
	movs r0, #0
	strh r0, [r4, #8]
	adds r0, r2, #0
	bl SwitchTaskToFollowupFunc
	b _080FD244
	.align 2, 0
_080FD214: .4byte 0x03005B60
_080FD218:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD244
	ldr r0, _080FD230
	movs r1, #1
	bl sub_080FCD64
	cmp r0, #1
	bne _080FD244
	b _080FD23E
	.align 2, 0
_080FD230: .4byte 0x02039BC5
_080FD234:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD244
_080FD23E:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080FD244:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080FD1EC

	thumb_func_start sub_080FD24C
sub_080FD24C: @ 0x080FD24C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080FD280
	mov r8, r0
	lsls r7, r5, #2
	adds r0, r7, r5
	lsls r0, r0, #3
	mov r1, r8
	adds r4, r0, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080FD284
	cmp r0, #1
	beq _080FD2BC
	movs r0, #0
	strh r0, [r4, #8]
	adds r0, r5, #0
	bl SwitchTaskToFollowupFunc
	b _080FD306
	.align 2, 0
_080FD280: .4byte 0x03005B60
_080FD284:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD306
	ldr r0, _080FD2B4
	ldr r2, [r0]
	ldr r0, _080FD2B8
	ldrb r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2, #4]
	adds r0, r0, r1
	adds r0, #6
	movs r1, #2
	bl sub_080FCD64
	cmp r0, #1
	bne _080FD306
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080FD306
	.align 2, 0
_080FD2B4: .4byte 0x02039BD4
_080FD2B8: .4byte 0x02039BC5
_080FD2BC:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD306
	movs r2, #0
	ldr r6, _080FD314
	mov sb, r8
	mov ip, r7
	ldrb r0, [r6]
	cmp r2, r0
	bge _080FD2F8
	ldr r1, _080FD318
	mov r8, r1
	ldr r4, _080FD31C
	movs r3, #0
	movs r7, #0x80
	lsls r7, r7, #1
_080FD2E0:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0, #4]
	adds r0, r3, r0
	ldrh r1, [r4]
	strh r1, [r0, #6]
	adds r4, r4, r7
	adds r3, #0x1c
	adds r2, #1
	ldrb r0, [r6]
	cmp r2, r0
	blt _080FD2E0
_080FD2F8:
	mov r0, ip
	adds r1, r0, r5
	lsls r1, r1, #3
	add r1, sb
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
_080FD306:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD314: .4byte 0x02039BD0
_080FD318: .4byte 0x02039BD4
_080FD31C: .4byte 0x0202207C
	thumb_func_end sub_080FD24C

	thumb_func_start sub_080FD320
sub_080FD320: @ 0x080FD320
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080FD348
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r3, #8
	ldrsh r0, [r2, r3]
	adds r3, r1, #0
	cmp r0, #0xb
	bls _080FD33C
	b _080FD4CC
_080FD33C:
	lsls r0, r0, #2
	ldr r1, _080FD34C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FD348: .4byte 0x03005B60
_080FD34C: .4byte 0x080FD350
_080FD350: @ jump table
	.4byte _080FD380 @ case 0
	.4byte _080FD398 @ case 1
	.4byte _080FD3C0 @ case 2
	.4byte _080FD3E4 @ case 3
	.4byte _080FD3F8 @ case 4
	.4byte _080FD3C0 @ case 5
	.4byte _080FD420 @ case 6
	.4byte _080FD434 @ case 7
	.4byte _080FD3C0 @ case 8
	.4byte _080FD45C @ case 9
	.4byte _080FD48C @ case 10
	.4byte _080FD3C0 @ case 11
_080FD380:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD38C
	b _080FD4D6
_080FD38C:
	ldr r0, _080FD394
	movs r1, #8
	b _080FD46A
	.align 2, 0
_080FD394: .4byte 0x02039BA8
_080FD398:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD3A4
	b _080FD4D6
_080FD3A4:
	ldr r0, _080FD3B4
	ldr r1, _080FD3B8
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD3BC
	adds r1, r1, r2
	movs r2, #8
	b _080FD4A4
	.align 2, 0
_080FD3B4: .4byte 0x02039BA8
_080FD3B8: .4byte 0x02039BCB
_080FD3BC: .4byte 0x0202207C
_080FD3C0:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r3
	ldrh r0, [r2, #0xa]
	adds r1, r0, #1
	strh r1, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bgt _080FD3D8
	b _080FD4D6
_080FD3D8:
	movs r0, #0
	strh r0, [r2, #0xa]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _080FD4D6
_080FD3E4:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD4D6
	ldr r0, _080FD3F4
	movs r1, #8
	b _080FD46A
	.align 2, 0
_080FD3F4: .4byte 0x02039BB0
_080FD3F8:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD4D6
	ldr r0, _080FD414
	ldr r1, _080FD418
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD41C
	adds r1, r1, r2
	movs r2, #8
	b _080FD4A4
	.align 2, 0
_080FD414: .4byte 0x02039BB0
_080FD418: .4byte 0x02039BCB
_080FD41C: .4byte 0x0202207C
_080FD420:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD4D6
	ldr r0, _080FD430
	movs r1, #8
	b _080FD46A
	.align 2, 0
_080FD430: .4byte 0x02039BB8
_080FD434:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD4D6
	ldr r0, _080FD450
	ldr r1, _080FD454
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD458
	adds r1, r1, r2
	movs r2, #8
	b _080FD4A4
	.align 2, 0
_080FD450: .4byte 0x02039BB8
_080FD454: .4byte 0x02039BCB
_080FD458: .4byte 0x0202207C
_080FD45C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD4D6
	ldr r0, _080FD484
	movs r1, #4
_080FD46A:
	bl sub_080FCD64
	cmp r0, #1
	bne _080FD4D6
	ldr r0, _080FD488
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080FD4D6
	.align 2, 0
_080FD484: .4byte 0x02039BC0
_080FD488: .4byte 0x03005B60
_080FD48C:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD4D6
	ldr r0, _080FD4BC
	ldr r1, _080FD4C0
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD4C4
	adds r1, r1, r2
	movs r2, #4
_080FD4A4:
	bl memcpy
	ldr r1, _080FD4C8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _080FD4D6
	.align 2, 0
_080FD4BC: .4byte 0x02039BC0
_080FD4C0: .4byte 0x02039BCB
_080FD4C4: .4byte 0x0202207C
_080FD4C8: .4byte 0x03005B60
_080FD4CC:
	movs r0, #0
	strh r0, [r2, #8]
	adds r0, r4, #0
	bl SwitchTaskToFollowupFunc
_080FD4D6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080FD320

	thumb_func_start sub_080FD4DC
sub_080FD4DC: @ 0x080FD4DC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080FD504
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	movs r3, #8
	ldrsh r0, [r2, r3]
	adds r3, r1, #0
	cmp r0, #0xb
	bls _080FD4F8
	b _080FD68C
_080FD4F8:
	lsls r0, r0, #2
	ldr r1, _080FD508
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FD504: .4byte 0x03005B60
_080FD508: .4byte 0x080FD50C
_080FD50C: @ jump table
	.4byte _080FD53C @ case 0
	.4byte _080FD558 @ case 1
	.4byte _080FD584 @ case 2
	.4byte _080FD5A8 @ case 3
	.4byte _080FD5C0 @ case 4
	.4byte _080FD584 @ case 5
	.4byte _080FD5EC @ case 6
	.4byte _080FD604 @ case 7
	.4byte _080FD584 @ case 8
	.4byte _080FD61C @ case 9
	.4byte _080FD64C @ case 10
	.4byte _080FD584 @ case 11
_080FD53C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD548
	b _080FD696
_080FD548:
	ldr r0, _080FD554
	ldr r0, [r0]
	ldr r0, [r0, #4]
	movs r1, #0x70
	b _080FD62A
	.align 2, 0
_080FD554: .4byte 0x02039BD4
_080FD558:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD564
	b _080FD696
_080FD564:
	ldr r0, _080FD578
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldr r1, _080FD57C
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD580
	adds r1, r1, r2
	movs r2, #0x70
	b _080FD664
	.align 2, 0
_080FD578: .4byte 0x02039BD4
_080FD57C: .4byte 0x02039BCB
_080FD580: .4byte 0x0202207C
_080FD584:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r3
	ldrh r0, [r2, #0xa]
	adds r1, r0, #1
	strh r1, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bgt _080FD59C
	b _080FD696
_080FD59C:
	movs r0, #0
	strh r0, [r2, #0xa]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	b _080FD696
_080FD5A8:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD696
	ldr r0, _080FD5BC
	ldr r0, [r0]
	ldr r0, [r0, #8]
	movs r1, #0x14
	b _080FD62A
	.align 2, 0
_080FD5BC: .4byte 0x02039BD4
_080FD5C0:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD696
	ldr r0, _080FD5E0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, _080FD5E4
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD5E8
	adds r1, r1, r2
	movs r2, #0x14
	b _080FD664
	.align 2, 0
_080FD5E0: .4byte 0x02039BD4
_080FD5E4: .4byte 0x02039BCB
_080FD5E8: .4byte 0x0202207C
_080FD5EC:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD696
	ldr r0, _080FD600
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	b _080FD628
	.align 2, 0
_080FD600: .4byte 0x02039BD4
_080FD604:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD696
	ldr r0, _080FD618
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	b _080FD658
	.align 2, 0
_080FD618: .4byte 0x02039BD4
_080FD61C:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD696
	ldr r0, _080FD644
_080FD628:
	movs r1, #4
_080FD62A:
	bl sub_080FCD64
	cmp r0, #1
	bne _080FD696
	ldr r0, _080FD648
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080FD696
	.align 2, 0
_080FD644: .4byte 0x02039BC6
_080FD648: .4byte 0x03005B60
_080FD64C:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD696
	ldr r0, _080FD67C
_080FD658:
	ldr r1, _080FD680
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD684
	adds r1, r1, r2
	movs r2, #4
_080FD664:
	bl memcpy
	ldr r1, _080FD688
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	adds r1, #1
	strh r1, [r0, #8]
	b _080FD696
	.align 2, 0
_080FD67C: .4byte 0x02039BC6
_080FD680: .4byte 0x02039BCB
_080FD684: .4byte 0x0202207C
_080FD688: .4byte 0x03005B60
_080FD68C:
	movs r0, #0
	strh r0, [r2, #8]
	adds r0, r4, #0
	bl SwitchTaskToFollowupFunc
_080FD696:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_080FD4DC

	thumb_func_start sub_080FD69C
sub_080FD69C: @ 0x080FD69C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #2
	mov r8, r0
	adds r0, r0, r6
	lsls r5, r0, #3
	ldr r7, _080FD6DC
	adds r0, r5, r7
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _080FD782
	movs r1, #8
	rsbs r1, r1, #0
	adds r1, r1, r7
	mov sb, r1
	adds r4, r5, r1
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080FD714
	cmp r0, #1
	bgt _080FD6E0
	cmp r0, #0
	beq _080FD6E6
	b _080FD76A
	.align 2, 0
_080FD6DC: .4byte 0x03005B68
_080FD6E0:
	cmp r0, #0xa
	beq _080FD750
	b _080FD76A
_080FD6E6:
	ldr r1, _080FD708
	movs r0, #0x6e
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080FD70C
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD782
	movs r0, #0xa
	strh r0, [r4, #8]
	b _080FD782
	.align 2, 0
_080FD708: .4byte 0x0202257C
_080FD70C:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _080FD782
_080FD714:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD782
	mov r1, r8
	mov r8, sb
	ldr r4, _080FD74C
	adds r0, r7, #0
	adds r0, #0xa
	adds r2, r5, r0
	movs r5, #0x80
	lsls r5, r5, #1
	movs r3, #3
_080FD730:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, r4, r5
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080FD730
	adds r1, r1, r6
	lsls r1, r1, #3
	add r1, r8
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	b _080FD782
	.align 2, 0
_080FD74C: .4byte 0x0202207C
_080FD750:
	ldrh r0, [r4, #0x1e]
	adds r0, #1
	strh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _080FD782
	movs r0, #2
	bl sub_0800A09C
	movs r0, #1
	strh r0, [r4, #8]
	b _080FD782
_080FD76A:
	ldr r0, _080FD790
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0x1e]
	strh r0, [r1, #0x20]
	adds r0, r6, #0
	bl SwitchTaskToFollowupFunc
_080FD782:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD790: .4byte 0x03005B60
	thumb_func_end sub_080FD69C

	thumb_func_start sub_080FD794
sub_080FD794: @ 0x080FD794
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r4, r0, #3
	ldr r6, _080FD7D0
	adds r0, r4, r6
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _080FD812
	adds r0, r6, #0
	subs r0, #8
	adds r4, r4, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080FD7D4
	cmp r0, #1
	beq _080FD7F0
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	bl SwitchTaskToFollowupFunc
	b _080FD812
	.align 2, 0
_080FD7D0: .4byte 0x03005B68
_080FD7D4:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD812
	ldr r0, _080FD7EC
	movs r1, #8
	bl sub_080FCD64
	cmp r0, #1
	bne _080FD812
	b _080FD80C
	.align 2, 0
_080FD7EC: .4byte 0x02039BA0
_080FD7F0:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD812
	ldr r0, _080FD818
	ldr r1, _080FD81C
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD820
	adds r1, r1, r2
	movs r2, #8
	bl memcpy
_080FD80C:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080FD812:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FD818: .4byte 0x02039BA0
_080FD81C: .4byte 0x02039BCB
_080FD820: .4byte 0x0202207C
	thumb_func_end sub_080FD794

	thumb_func_start sub_080FD824
sub_080FD824: @ 0x080FD824
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r4, r0, #3
	ldr r6, _080FD860
	adds r0, r4, r6
	adds r0, #0x18
	bl sub_080FCEE0
	cmp r0, #0
	beq _080FD8A2
	adds r0, r6, #0
	subs r0, #8
	adds r4, r4, r0
	movs r1, #8
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080FD864
	cmp r0, #1
	beq _080FD880
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	bl SwitchTaskToFollowupFunc
	b _080FD8A2
	.align 2, 0
_080FD860: .4byte 0x03005B68
_080FD864:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD8A2
	ldr r0, _080FD87C
	movs r1, #4
	bl sub_080FCD64
	cmp r0, #1
	bne _080FD8A2
	b _080FD89C
	.align 2, 0
_080FD87C: .4byte 0x02039BC6
_080FD880:
	bl sub_080FCDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080FD8A2
	ldr r0, _080FD8A8
	ldr r1, _080FD8AC
	ldrb r1, [r1]
	lsls r1, r1, #8
	ldr r2, _080FD8B0
	adds r1, r1, r2
	movs r2, #4
	bl memcpy
_080FD89C:
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
_080FD8A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FD8A8: .4byte 0x02039BC6
_080FD8AC: .4byte 0x02039BCB
_080FD8B0: .4byte 0x0202207C
	thumb_func_end sub_080FD824

