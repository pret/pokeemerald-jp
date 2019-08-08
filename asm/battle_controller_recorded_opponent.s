.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start RecordedOpponentBufferExecCompleted
RecordedOpponentBufferExecCompleted: @ 0x08186ED8
	push {r4, lr}
	sub sp, #4
	ldr r1, _08186F18
	ldr r4, _08186F1C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08186F20
	str r1, [r0]
	ldr r0, _08186F24
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08186F2C
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, #2
	movs r1, #4
	mov r2, sp
	bl PrepareBufferDataTransferLink
	ldr r1, _08186F28
	ldrb r0, [r4]
	lsls r0, r0, #9
	adds r0, r0, r1
	movs r1, #0x38
	strb r1, [r0]
	b _08186F3E
	.align 2, 0
_08186F18: .4byte 0x03005AC0
_08186F1C: .4byte 0x02023D08
_08186F20: .4byte 0x08186235
_08186F24: .4byte 0x02022C90
_08186F28: .4byte 0x02022D08
_08186F2C:
	ldr r2, _08186F48
	ldr r1, _08186F4C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_08186F3E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08186F48: .4byte 0x02023D0C
_08186F4C: .4byte 0x082FACB4
	thumb_func_end RecordedOpponentBufferExecCompleted

	thumb_func_start RecordedOpponentHandleGetMonData
RecordedOpponentHandleGetMonData: @ 0x08186F50
	push {r4, r5, r6, lr}
	sub sp, #0x100
	movs r6, #0
	ldr r1, _08186F7C
	ldr r0, _08186F80
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08186F88
	ldr r0, _08186F84
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl CopyRecordedOpponentMonData
	adds r6, r0, #0
	b _08186FAA
	.align 2, 0
_08186F7C: .4byte 0x02022D08
_08186F80: .4byte 0x02023D08
_08186F84: .4byte 0x02023D12
_08186F88:
	ldrb r4, [r1]
	movs r5, #0
_08186F8C:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08186FA2
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	mov r2, sp
	adds r1, r2, r6
	bl CopyRecordedOpponentMonData
	adds r6, r6, r0
_08186FA2:
	lsrs r4, r4, #1
	adds r5, #1
	cmp r5, #5
	ble _08186F8C
_08186FAA:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	mov r2, sp
	bl BtlController_EmitDataTransfer
	bl RecordedOpponentBufferExecCompleted
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleGetMonData

	thumb_func_start CopyRecordedOpponentMonData
CopyRecordedOpponentMonData: @ 0x08186FC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	ldr r2, _08186FF8
	ldr r3, _08186FFC
	ldrb r0, [r3]
	lsls r0, r0, #9
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _08186FEE
	bl _0818775A
_08186FEE:
	lsls r0, r0, #2
	ldr r1, _08187000
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08186FF8: .4byte 0x02022D08
_08186FFC: .4byte 0x02023D08
_08187000: .4byte 0x08187004
_08187004: @ jump table
	.4byte _081870F4 @ case 0
	.4byte _08187318 @ case 1
	.4byte _08187328 @ case 2
	.4byte _08187338 @ case 3
	.4byte _081873A0 @ case 4
	.4byte _081873A0 @ case 5
	.4byte _081873A0 @ case 6
	.4byte _081873A0 @ case 7
	.4byte _081873BC @ case 8
	.4byte _081873F8 @ case 9
	.4byte _081873F8 @ case 10
	.4byte _081873F8 @ case 11
	.4byte _081873F8 @ case 12
	.4byte _0818775A @ case 13
	.4byte _0818775A @ case 14
	.4byte _0818775A @ case 15
	.4byte _0818775A @ case 16
	.4byte _08187414 @ case 17
	.4byte _08187424 @ case 18
	.4byte _08187454 @ case 19
	.4byte _08187464 @ case 20
	.4byte _08187474 @ case 21
	.4byte _08187484 @ case 22
	.4byte _08187494 @ case 23
	.4byte _081874A4 @ case 24
	.4byte _081874B4 @ case 25
	.4byte _081874C4 @ case 26
	.4byte _081874D4 @ case 27
	.4byte _081874E4 @ case 28
	.4byte _081874F4 @ case 29
	.4byte _08187504 @ case 30
	.4byte _08187514 @ case 31
	.4byte _08187564 @ case 32
	.4byte _08187574 @ case 33
	.4byte _08187584 @ case 34
	.4byte _08187594 @ case 35
	.4byte _081875A4 @ case 36
	.4byte _081875B4 @ case 37
	.4byte _081875C4 @ case 38
	.4byte _081875D4 @ case 39
	.4byte _081875E4 @ case 40
	.4byte _08187618 @ case 41
	.4byte _08187628 @ case 42
	.4byte _08187638 @ case 43
	.4byte _08187648 @ case 44
	.4byte _08187658 @ case 45
	.4byte _08187668 @ case 46
	.4byte _08187678 @ case 47
	.4byte _08187688 @ case 48
	.4byte _081876A8 @ case 49
	.4byte _081876B8 @ case 50
	.4byte _081876C8 @ case 51
	.4byte _081876D8 @ case 52
	.4byte _081876E8 @ case 53
	.4byte _081876F8 @ case 54
	.4byte _08187708 @ case 55
	.4byte _08187718 @ case 56
	.4byte _08187728 @ case 57
	.4byte _08187738 @ case 58
	.4byte _08187748 @ case 59
_081870F4:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08187308
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xc
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x2e]
	movs r6, #0
	add r0, sp, #0x24
	mov sb, r0
	movs r1, #0x3b
	add r1, sp
	mov sl, r1
	mov r2, sp
	adds r2, #0x2b
	str r2, [sp, #0x80]
	mov r0, sp
	adds r0, #0x2a
	str r0, [sp, #0x7c]
	mov r1, sp
	adds r1, #0x68
	str r1, [sp, #0x8c]
	adds r2, #5
	str r2, [sp, #0x84]
	adds r0, #0x12
	str r0, [sp, #0x88]
	mov r8, r4
	add r4, sp, #0xc
_08187140:
	adds r1, r6, #0
	adds r1, #0xd
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x11
	mov r0, r8
	bl GetMonData
	mov r2, sb
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, #2
	adds r6, #1
	cmp r6, #3
	ble _08187140
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08187308
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl GetMonData
	mov r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x20
	bl GetMonData
	ldr r2, [sp, #0x80]
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0x19
	bl GetMonData
	str r0, [sp, #0x44]
	adds r0, r4, #0
	movs r1, #0x27
	bl GetMonData
	mov r3, sp
	movs r5, #0x1f
	ands r0, r5
	ldrb r2, [r3, #0x14]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x14]
	adds r0, r4, #0
	movs r1, #0x28
	bl GetMonData
	mov r3, sp
	movs r6, #0x1f
	ands r0, r6
	lsls r0, r0, #5
	ldrh r2, [r3, #0x14]
	ldr r1, _0818730C
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x14]
	adds r0, r4, #0
	movs r1, #0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r3, #0x15]
	movs r1, #0x7d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x15]
	adds r0, r4, #0
	movs r1, #0x2a
	bl GetMonData
	movs r1, #0x1f
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [sp, #0x14]
	ldr r2, _08187310
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0x14]
	adds r0, r4, #0
	movs r1, #0x2b
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, r0, #4
	ldrh r2, [r3, #0x16]
	ldr r1, _08187314
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x16]
	adds r0, r4, #0
	movs r1, #0x2c
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, r0, #1
	ldrb r2, [r3, #0x17]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #0
	bl GetMonData
	str r0, [sp, #0x48]
	adds r0, r4, #0
	movs r1, #0x37
	bl GetMonData
	str r0, [sp, #0x4c]
	adds r0, r4, #0
	movs r1, #0x38
	bl GetMonData
	ldr r1, [sp, #0x7c]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x28]
	adds r0, r4, #0
	movs r1, #0x3a
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0x2c]
	adds r0, r4, #0
	movs r1, #0x3b
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #2]
	adds r0, r4, #0
	movs r1, #0x3c
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #4]
	adds r0, r4, #0
	movs r1, #0x3d
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #6]
	adds r0, r4, #0
	movs r1, #0x3e
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #8]
	adds r0, r4, #0
	movs r1, #0x3f
	bl GetMonData
	mov r1, sp
	strh r0, [r1, #0xa]
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	mov r3, sp
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #6
	ldrb r2, [r3, #0x17]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #0x2e
	bl GetMonData
	mov r3, sp
	lsls r0, r0, #7
	ldrb r2, [r3, #0x17]
	movs r1, #0x7f
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0x17]
	adds r0, r4, #0
	movs r1, #1
	bl GetMonData
	str r0, [sp, #0x54]
	adds r0, r4, #0
	movs r1, #2
	ldr r2, [sp, #0x8c]
	bl GetMonData
	ldr r0, [sp, #0x84]
	ldr r1, [sp, #0x8c]
	bl StringCopy10
	adds r0, r4, #0
	movs r1, #7
	ldr r2, [sp, #0x88]
	bl GetMonData
	mov r2, sp
	movs r6, #0
_081872F8:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x57
	bls _081872F8
	b _0818775A
	.align 2, 0
_08187308: .4byte 0x020243E8
_0818730C: .4byte 0xFFFFFC1F
_08187310: .4byte 0xFFF07FFF
_08187314: .4byte 0xFFFFFE0F
_08187318:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187324
	adds r0, r0, r1
	movs r1, #0xb
	b _08187692
	.align 2, 0
_08187324: .4byte 0x020243E8
_08187328:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187334
	adds r0, r0, r1
	movs r1, #0xc
	b _08187692
	.align 2, 0
_08187334: .4byte 0x020243E8
_08187338:
	movs r6, #0
	add r2, sp, #0x58
	mov sb, r2
	add r0, sp, #0x60
	mov sl, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _0818739C
	adds r4, r1, r0
	mov r8, sb
_0818734E:
	adds r1, r6, #0
	adds r1, #0xd
	adds r0, r4, #0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, #0
	adds r1, #0x11
	adds r0, r4, #0
	bl GetMonData
	mov r2, sl
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, #2
	add r8, r0
	adds r6, #1
	cmp r6, #3
	ble _0818734E
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818739C
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	mov r1, sb
	strb r0, [r1, #0xc]
	mov r2, sb
	movs r6, #0
_0818738C:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0xf
	bls _0818738C
	b _0818775A
	.align 2, 0
_0818739C: .4byte 0x020243E8
_081873A0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081873B8
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #9
	b _08187692
	.align 2, 0
_081873B8: .4byte 0x020243E8
_081873BC:
	movs r6, #0
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r2, _081873F4
	mov r8, r2
_081873C8:
	adds r1, r6, #0
	adds r1, #0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	cmp r6, #3
	ble _081873C8
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081873F4
	adds r0, r0, r1
	movs r1, #0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, #1
	b _0818775A
	.align 2, 0
_081873F4: .4byte 0x020243E8
_081873F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187410
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #9
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #8
	b _08187752
	.align 2, 0
_08187410: .4byte 0x020243E8
_08187414:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187420
	adds r0, r0, r1
	movs r1, #1
	b _0818742E
	.align 2, 0
_08187420: .4byte 0x020243E8
_08187424:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187450
	adds r0, r0, r1
	movs r1, #0x19
_0818742E:
	bl GetMonData
	adds r1, r0, #0
	strb r1, [r7]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r7, #2]
	movs r6, #3
	b _0818775A
	.align 2, 0
_08187450: .4byte 0x020243E8
_08187454:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187460
	adds r0, r0, r1
	movs r1, #0x1a
	b _08187752
	.align 2, 0
_08187460: .4byte 0x020243E8
_08187464:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187470
	adds r0, r0, r1
	movs r1, #0x1b
	b _08187752
	.align 2, 0
_08187470: .4byte 0x020243E8
_08187474:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187480
	adds r0, r0, r1
	movs r1, #0x1c
	b _08187752
	.align 2, 0
_08187480: .4byte 0x020243E8
_08187484:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187490
	adds r0, r0, r1
	movs r1, #0x1d
	b _08187752
	.align 2, 0
_08187490: .4byte 0x020243E8
_08187494:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081874A0
	adds r0, r0, r1
	movs r1, #0x1e
	b _08187752
	.align 2, 0
_081874A0: .4byte 0x020243E8
_081874A4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081874B0
	adds r0, r0, r1
	movs r1, #0x1f
	b _08187752
	.align 2, 0
_081874B0: .4byte 0x020243E8
_081874B4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081874C0
	adds r0, r0, r1
	movs r1, #0x20
	b _08187752
	.align 2, 0
_081874C0: .4byte 0x020243E8
_081874C4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081874D0
	adds r0, r0, r1
	movs r1, #0x22
	b _08187752
	.align 2, 0
_081874D0: .4byte 0x020243E8
_081874D4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081874E0
	adds r0, r0, r1
	movs r1, #0x23
	b _08187752
	.align 2, 0
_081874E0: .4byte 0x020243E8
_081874E4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081874F0
	adds r0, r0, r1
	movs r1, #0x24
	b _08187752
	.align 2, 0
_081874F0: .4byte 0x020243E8
_081874F4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187500
	adds r0, r0, r1
	movs r1, #0x25
	b _08187752
	.align 2, 0
_08187500: .4byte 0x020243E8
_08187504:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187510
	adds r0, r0, r1
	movs r1, #0x26
	b _08187752
	.align 2, 0
_08187510: .4byte 0x020243E8
_08187514:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08187560
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, #0
	movs r1, #0x28
	bl GetMonData
	strb r0, [r7, #1]
	adds r0, r4, #0
	movs r1, #0x29
	bl GetMonData
	strb r0, [r7, #2]
	adds r0, r4, #0
	movs r1, #0x2a
	bl GetMonData
	strb r0, [r7, #3]
	adds r0, r4, #0
	movs r1, #0x2b
	bl GetMonData
	strb r0, [r7, #4]
	adds r0, r4, #0
	movs r1, #0x2c
	bl GetMonData
	strb r0, [r7, #5]
	movs r6, #6
	b _0818775A
	.align 2, 0
_08187560: .4byte 0x020243E8
_08187564:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187570
	adds r0, r0, r1
	movs r1, #0x27
	b _08187752
	.align 2, 0
_08187570: .4byte 0x020243E8
_08187574:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187580
	adds r0, r0, r1
	movs r1, #0x28
	b _08187752
	.align 2, 0
_08187580: .4byte 0x020243E8
_08187584:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187590
	adds r0, r0, r1
	movs r1, #0x29
	b _08187752
	.align 2, 0
_08187590: .4byte 0x020243E8
_08187594:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081875A0
	adds r0, r0, r1
	movs r1, #0x2a
	b _08187752
	.align 2, 0
_081875A0: .4byte 0x020243E8
_081875A4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081875B0
	adds r0, r0, r1
	movs r1, #0x2b
	b _08187752
	.align 2, 0
_081875B0: .4byte 0x020243E8
_081875B4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081875C0
	adds r0, r0, r1
	movs r1, #0x2c
	b _08187752
	.align 2, 0
_081875C0: .4byte 0x020243E8
_081875C4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081875D0
	adds r0, r0, r1
	movs r1, #0
	b _081875EE
	.align 2, 0
_081875D0: .4byte 0x020243E8
_081875D4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081875E0
	adds r0, r0, r1
	movs r1, #9
	b _08187692
	.align 2, 0
_081875E0: .4byte 0x020243E8
_081875E4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187614
	adds r0, r0, r1
	movs r1, #0x37
_081875EE:
	bl GetMonData
	adds r1, r0, #0
	strb r1, [r7]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	strb r0, [r7, #2]
	lsrs r0, r1, #0x18
	strb r0, [r7, #3]
	movs r6, #4
	b _0818775A
	.align 2, 0
_08187614: .4byte 0x020243E8
_08187618:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187624
	adds r0, r0, r1
	movs r1, #0x38
	b _08187752
	.align 2, 0
_08187624: .4byte 0x020243E8
_08187628:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187634
	adds r0, r0, r1
	movs r1, #0x39
	b _08187692
	.align 2, 0
_08187634: .4byte 0x020243E8
_08187638:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187644
	adds r0, r0, r1
	movs r1, #0x3a
	b _08187692
	.align 2, 0
_08187644: .4byte 0x020243E8
_08187648:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187654
	adds r0, r0, r1
	movs r1, #0x3b
	b _08187692
	.align 2, 0
_08187654: .4byte 0x020243E8
_08187658:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187664
	adds r0, r0, r1
	movs r1, #0x3c
	b _08187692
	.align 2, 0
_08187664: .4byte 0x020243E8
_08187668:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187674
	adds r0, r0, r1
	movs r1, #0x3d
	b _08187692
	.align 2, 0
_08187674: .4byte 0x020243E8
_08187678:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187684
	adds r0, r0, r1
	movs r1, #0x3e
	b _08187692
	.align 2, 0
_08187684: .4byte 0x020243E8
_08187688:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081876A4
	adds r0, r0, r1
	movs r1, #0x3f
_08187692:
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strb r0, [r7]
	lsrs r0, r0, #8
	strb r0, [r7, #1]
	movs r6, #2
	b _0818775A
	.align 2, 0
_081876A4: .4byte 0x020243E8
_081876A8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081876B4
	adds r0, r0, r1
	movs r1, #0x16
	b _08187752
	.align 2, 0
_081876B4: .4byte 0x020243E8
_081876B8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081876C4
	adds r0, r0, r1
	movs r1, #0x17
	b _08187752
	.align 2, 0
_081876C4: .4byte 0x020243E8
_081876C8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081876D4
	adds r0, r0, r1
	movs r1, #0x18
	b _08187752
	.align 2, 0
_081876D4: .4byte 0x020243E8
_081876D8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081876E4
	adds r0, r0, r1
	movs r1, #0x21
	b _08187752
	.align 2, 0
_081876E4: .4byte 0x020243E8
_081876E8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081876F4
	adds r0, r0, r1
	movs r1, #0x2f
	b _08187752
	.align 2, 0
_081876F4: .4byte 0x020243E8
_081876F8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187704
	adds r0, r0, r1
	movs r1, #0x30
	b _08187752
	.align 2, 0
_08187704: .4byte 0x020243E8
_08187708:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187714
	adds r0, r0, r1
	movs r1, #0x32
	b _08187752
	.align 2, 0
_08187714: .4byte 0x020243E8
_08187718:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187724
	adds r0, r0, r1
	movs r1, #0x33
	b _08187752
	.align 2, 0
_08187724: .4byte 0x020243E8
_08187728:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187734
	adds r0, r0, r1
	movs r1, #0x34
	b _08187752
	.align 2, 0
_08187734: .4byte 0x020243E8
_08187738:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187744
	adds r0, r0, r1
	movs r1, #0x35
	b _08187752
	.align 2, 0
_08187744: .4byte 0x020243E8
_08187748:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818776C
	adds r0, r0, r1
	movs r1, #0x36
_08187752:
	bl GetMonData
	strb r0, [r7]
	movs r6, #1
_0818775A:
	adds r0, r6, #0
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818776C: .4byte 0x020243E8
	thumb_func_end CopyRecordedOpponentMonData

	thumb_func_start RecordedOpponentHandleGetRawMonData
RecordedOpponentHandleGetRawMonData: @ 0x08187770
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleGetRawMonData

	thumb_func_start RecordedOpponentHandleSetMonData
RecordedOpponentHandleSetMonData: @ 0x0818777C
	push {r4, r5, lr}
	ldr r1, _081877A0
	ldr r0, _081877A4
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _081877AC
	ldr r0, _081877A8
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl SetRecordedOpponentMonData
	b _081877CA
	.align 2, 0
_081877A0: .4byte 0x02022D08
_081877A4: .4byte 0x02023D08
_081877A8: .4byte 0x02023D12
_081877AC:
	ldrb r4, [r1]
	movs r5, #0
_081877B0:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _081877BE
	adds r0, r5, #0
	bl SetRecordedOpponentMonData
_081877BE:
	lsrs r4, r4, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _081877B0
_081877CA:
	bl RecordedOpponentBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end RecordedOpponentHandleSetMonData

	thumb_func_start SetRecordedOpponentMonData
SetRecordedOpponentMonData: @ 0x081877D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, _0818780C
	ldrb r0, [r3]
	lsls r0, r0, #9
	ldr r2, _08187810
	adds r4, r0, r2
	adds r7, r4, #0
	subs r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r6, r3, #0
	adds r3, r2, #0
	cmp r0, #0x3b
	bls _08187802
	bl _081880E0
_08187802:
	lsls r0, r0, #2
	ldr r1, _08187814
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0818780C: .4byte 0x02023D08
_08187810: .4byte 0x02022D0B
_08187814: .4byte 0x08187818
_08187818: @ jump table
	.4byte _08187908 @ case 0
	.4byte _08187AA0 @ case 1
	.4byte _08187ABC @ case 2
	.4byte _08187AD8 @ case 3
	.4byte _08187B2C @ case 4
	.4byte _08187B2C @ case 5
	.4byte _08187B2C @ case 6
	.4byte _08187B2C @ case 7
	.4byte _08187B4C @ case 8
	.4byte _08187BB4 @ case 9
	.4byte _08187BB4 @ case 10
	.4byte _08187BB4 @ case 11
	.4byte _08187BB4 @ case 12
	.4byte _081880E0 @ case 13
	.4byte _081880E0 @ case 14
	.4byte _081880E0 @ case 15
	.4byte _081880E0 @ case 16
	.4byte _08187BDC @ case 17
	.4byte _08187BF8 @ case 18
	.4byte _08187C14 @ case 19
	.4byte _08187C30 @ case 20
	.4byte _08187C4C @ case 21
	.4byte _08187C68 @ case 22
	.4byte _08187C84 @ case 23
	.4byte _08187CA0 @ case 24
	.4byte _08187CBC @ case 25
	.4byte _08187CD8 @ case 26
	.4byte _08187CF4 @ case 27
	.4byte _08187D10 @ case 28
	.4byte _08187D2C @ case 29
	.4byte _08187D48 @ case 30
	.4byte _08187D64 @ case 31
	.4byte _08187DD8 @ case 32
	.4byte _08187DF4 @ case 33
	.4byte _08187E10 @ case 34
	.4byte _08187E2C @ case 35
	.4byte _08187E48 @ case 36
	.4byte _08187E64 @ case 37
	.4byte _08187E80 @ case 38
	.4byte _08187E9C @ case 39
	.4byte _08187EB8 @ case 40
	.4byte _08187ED4 @ case 41
	.4byte _08187EF0 @ case 42
	.4byte _08187F0C @ case 43
	.4byte _08187F28 @ case 44
	.4byte _08187F44 @ case 45
	.4byte _08187F60 @ case 46
	.4byte _08187F7C @ case 47
	.4byte _08187F98 @ case 48
	.4byte _08187FB4 @ case 49
	.4byte _08187FD0 @ case 50
	.4byte _08187FEC @ case 51
	.4byte _08188008 @ case 52
	.4byte _08188024 @ case 53
	.4byte _08188040 @ case 54
	.4byte _0818805C @ case 55
	.4byte _08188078 @ case 56
	.4byte _08188094 @ case 57
	.4byte _081880B0 @ case 58
	.4byte _081880CC @ case 59
_08187908:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08187A9C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	bl SetMonData
	adds r2, r7, #0
	adds r2, #0x2e
	adds r0, r4, #0
	movs r1, #0xc
	bl SetMonData
	movs r0, #0
	mov r8, r0
	movs r0, #0x3b
	adds r0, r0, r7
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x2b
	str r0, [sp, #0x20]
	adds r0, #0x19
	str r0, [sp, #0x28]
	adds r0, #4
	str r0, [sp, #0x2c]
	adds r0, #4
	str r0, [sp, #0x30]
	subs r0, #0x22
	str r0, [sp, #0x1c]
	subs r0, #2
	str r0, [sp, #0x18]
	adds r0, #4
	str r0, [sp, #0x24]
	adds r0, r7, #2
	str r0, [sp, #4]
	adds r0, r7, #4
	str r0, [sp, #8]
	adds r0, r7, #6
	str r0, [sp, #0xc]
	adds r0, #2
	str r0, [sp, #0x10]
	adds r0, #2
	str r0, [sp, #0x14]
	mov sb, r4
	adds r6, r7, #0
	adds r6, #0x24
	adds r4, r7, #0
	adds r4, #0xc
_0818796E:
	mov r1, r8
	adds r1, #0xd
	mov r0, sb
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	mov r0, sb
	adds r2, r6, #0
	bl SetMonData
	adds r6, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _0818796E
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08187A9C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x15
	mov r2, sl
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x20
	ldr r2, [sp, #0x20]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x19
	ldr r2, [sp, #0x28]
	bl SetMonData
	ldrb r0, [r7, #0x14]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r7, #0x14]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r7, #0x15]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r7, #0x14]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2a
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r7, #0x16]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2b
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x2c
	mov r2, sp
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0
	ldr r2, [sp, #0x2c]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x37
	ldr r2, [sp, #0x30]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x38
	ldr r2, [sp, #0x1c]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x39
	ldr r2, [sp, #0x18]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3a
	ldr r2, [sp, #0x24]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3b
	ldr r2, [sp, #4]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3c
	ldr r2, [sp, #8]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3d
	ldr r2, [sp, #0xc]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3e
	ldr r2, [sp, #0x10]
	bl SetMonData
	adds r0, r4, #0
	movs r1, #0x3f
	ldr r2, [sp, #0x14]
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187A9C: .4byte 0x020243E8
_08187AA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187AB8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0xb
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187AB8: .4byte 0x020243E8
_08187ABC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187AD4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0xc
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187AD4: .4byte 0x020243E8
_08187AD8:
	movs r0, #0
	mov r8, r0
	movs r0, #0xc
	adds r0, r0, r4
	mov sb, r0
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _08187B28
	adds r7, r1, r0
	adds r6, r4, #0
	adds r6, #8
_08187AF0:
	mov r1, r8
	adds r1, #0xd
	adds r0, r7, #0
	adds r2, r4, #0
	bl SetMonData
	mov r1, r8
	adds r1, #0x11
	adds r0, r7, #0
	adds r2, r6, #0
	bl SetMonData
	adds r6, #1
	adds r4, #2
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _08187AF0
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187B28
	adds r0, r0, r1
	movs r1, #0x15
	mov r2, sb
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187B28: .4byte 0x020243E8
_08187B2C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187B44
	adds r0, r0, r1
	ldr r3, _08187B48
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #9
	b _08187BCA
	.align 2, 0
_08187B44: .4byte 0x020243E8
_08187B48: .4byte 0x02022D08
_08187B4C:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08187BB0
	adds r4, r4, r0
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	adds r0, r4, #0
	movs r1, #0x11
	str r3, [sp, #0x34]
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x12
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x13
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x14
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x15
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187BB0: .4byte 0x020243E8
_08187BB4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187BD4
	adds r0, r0, r1
	ldr r3, _08187BD8
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r1, r3, #1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, #8
_08187BCA:
	adds r3, #3
	adds r2, r2, r3
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187BD4: .4byte 0x020243E8
_08187BD8: .4byte 0x02022D08
_08187BDC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187BF4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #1
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187BF4: .4byte 0x020243E8
_08187BF8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187C10
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x19
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187C10: .4byte 0x020243E8
_08187C14:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187C2C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1a
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187C2C: .4byte 0x020243E8
_08187C30:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187C48
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1b
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187C48: .4byte 0x020243E8
_08187C4C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187C64
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1c
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187C64: .4byte 0x020243E8
_08187C68:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187C80
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1d
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187C80: .4byte 0x020243E8
_08187C84:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187C9C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1e
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187C9C: .4byte 0x020243E8
_08187CA0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187CB8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x1f
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187CB8: .4byte 0x020243E8
_08187CBC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187CD4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x20
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187CD4: .4byte 0x020243E8
_08187CD8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187CF0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x22
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187CF0: .4byte 0x020243E8
_08187CF4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187D0C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x23
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187D0C: .4byte 0x020243E8
_08187D10:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187D28
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x24
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187D28: .4byte 0x020243E8
_08187D2C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187D44
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x25
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187D44: .4byte 0x020243E8
_08187D48:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187D60
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x26
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187D60: .4byte 0x020243E8
_08187D64:
	movs r0, #0x64
	adds r4, r5, #0
	muls r4, r0, r4
	ldr r0, _08187DD4
	adds r4, r4, r0
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	adds r0, r4, #0
	movs r1, #0x27
	str r3, [sp, #0x34]
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #1
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x28
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #2
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x29
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #3
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2a
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #4
	adds r2, r2, r0
	adds r0, r4, #0
	movs r1, #0x2b
	bl SetMonData
	ldrb r2, [r6]
	lsls r2, r2, #9
	ldr r3, [sp, #0x34]
	adds r0, r3, #5
	adds r2, r2, r0
	adds r0, r4, #0
	b _08187E72
	.align 2, 0
_08187DD4: .4byte 0x020243E8
_08187DD8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187DF0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x27
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187DF0: .4byte 0x020243E8
_08187DF4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187E0C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x28
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187E0C: .4byte 0x020243E8
_08187E10:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187E28
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x29
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187E28: .4byte 0x020243E8
_08187E2C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187E44
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2a
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187E44: .4byte 0x020243E8
_08187E48:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187E60
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2b
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187E60: .4byte 0x020243E8
_08187E64:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187E7C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
_08187E72:
	movs r1, #0x2c
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187E7C: .4byte 0x020243E8
_08187E80:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187E98
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187E98: .4byte 0x020243E8
_08187E9C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187EB4
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #9
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187EB4: .4byte 0x020243E8
_08187EB8:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187ED0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x37
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187ED0: .4byte 0x020243E8
_08187ED4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187EEC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x38
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187EEC: .4byte 0x020243E8
_08187EF0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187F08
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x39
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187F08: .4byte 0x020243E8
_08187F0C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187F24
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3a
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187F24: .4byte 0x020243E8
_08187F28:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187F40
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3b
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187F40: .4byte 0x020243E8
_08187F44:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187F5C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3c
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187F5C: .4byte 0x020243E8
_08187F60:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187F78
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3d
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187F78: .4byte 0x020243E8
_08187F7C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187F94
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3e
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187F94: .4byte 0x020243E8
_08187F98:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187FB0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x3f
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187FB0: .4byte 0x020243E8
_08187FB4:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187FCC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x16
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187FCC: .4byte 0x020243E8
_08187FD0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08187FE8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x17
	bl SetMonData
	b _081880E0
	.align 2, 0
_08187FE8: .4byte 0x020243E8
_08187FEC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08188004
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x18
	bl SetMonData
	b _081880E0
	.align 2, 0
_08188004: .4byte 0x020243E8
_08188008:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08188020
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x21
	bl SetMonData
	b _081880E0
	.align 2, 0
_08188020: .4byte 0x020243E8
_08188024:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _0818803C
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x2f
	bl SetMonData
	b _081880E0
	.align 2, 0
_0818803C: .4byte 0x020243E8
_08188040:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08188058
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x30
	bl SetMonData
	b _081880E0
	.align 2, 0
_08188058: .4byte 0x020243E8
_0818805C:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08188074
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x32
	bl SetMonData
	b _081880E0
	.align 2, 0
_08188074: .4byte 0x020243E8
_08188078:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _08188090
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x33
	bl SetMonData
	b _081880E0
	.align 2, 0
_08188090: .4byte 0x020243E8
_08188094:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081880AC
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x34
	bl SetMonData
	b _081880E0
	.align 2, 0
_081880AC: .4byte 0x020243E8
_081880B0:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081880C8
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x35
	bl SetMonData
	b _081880E0
	.align 2, 0
_081880C8: .4byte 0x020243E8
_081880CC:
	movs r0, #0x64
	muls r0, r5, r0
	ldr r1, _081880F0
	adds r0, r0, r1
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r2, r2, r3
	movs r1, #0x36
	bl SetMonData
_081880E0:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081880F0: .4byte 0x020243E8
	thumb_func_end SetRecordedOpponentMonData

	thumb_func_start RecordedOpponentHandleSetRawMonData
RecordedOpponentHandleSetRawMonData: @ 0x081880F4
	push {r4, r5, r6, r7, lr}
	ldr r1, _08188158
	ldr r7, _0818815C
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r4, _08188160
	lsls r2, r2, #9
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _08188164
	adds r0, r0, r1
	adds r5, r3, r0
	movs r3, #0
	adds r0, r4, #2
	adds r2, r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bhs _0818814C
	adds r6, r4, #0
	adds r2, r7, #0
	adds r4, r0, #0
_0818812A:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, r0, #9
	adds r0, #3
	adds r0, r3, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r2]
	lsls r0, r0, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	blo _0818812A
_0818814C:
	bl RecordedOpponentBufferExecCompleted
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08188158: .4byte 0x02023D12
_0818815C: .4byte 0x02023D08
_08188160: .4byte 0x02022D08
_08188164: .4byte 0x020243E8
	thumb_func_end RecordedOpponentHandleSetRawMonData

	thumb_func_start RecordedOpponentHandleLoadMonSprite
RecordedOpponentHandleLoadMonSprite: @ 0x08188168
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _08188290
	ldr r6, _08188294
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	movs r1, #0x64
	mov sl, r1
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	ldr r1, _08188298
	mov sb, r1
	add r0, sb
	movs r1, #0xb
	bl GetMonData
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	add r0, sb
	bl BattleLoadOpponentMonSpriteGfx
	ldrb r0, [r6]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _0818829C
	mov r8, r0
	ldrb r0, [r6]
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r0, [r6]
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r6]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, r8
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _081882A0
	ldrb r1, [r6]
	adds r1, r1, r4
	strb r0, [r1]
	ldr r5, _081882A4
	ldrb r0, [r6]
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081882A8
	strh r1, [r0, #0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r2, [r0, #0x2e]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r3, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _081882AC
	adds r2, r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldrb r4, [r6]
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sb
	movs r1, #0xb
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl SetBattlerShadowSpriteCallback
	ldr r1, _081882B0
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081882B4
	str r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08188290: .4byte 0x02023D12
_08188294: .4byte 0x02023D08
_08188298: .4byte 0x020243E8
_0818829C: .4byte 0x02024640
_081882A0: .4byte 0x02023E88
_081882A4: .4byte 0x020205AC
_081882A8: .4byte 0x0000FF10
_081882AC: .4byte 0x02024188
_081882B0: .4byte 0x03005AC0
_081882B4: .4byte 0x08186975
	thumb_func_end RecordedOpponentHandleLoadMonSprite

	thumb_func_start RecordedOpponentHandleSwitchInAnim
RecordedOpponentHandleSwitchInAnim: @ 0x081882B8
	push {r4, lr}
	ldr r1, _081882F0
	ldr r4, _081882F4
	ldrb r0, [r4]
	lsls r2, r0, #1
	adds r2, r2, r1
	ldr r3, _081882F8
	lsls r0, r0, #9
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	ldrb r0, [r4]
	lsls r1, r0, #9
	adds r3, #2
	adds r1, r1, r3
	ldrb r1, [r1]
	bl sub_08188304
	ldr r1, _081882FC
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08188300
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081882F0: .4byte 0x02023D12
_081882F4: .4byte 0x02023D08
_081882F8: .4byte 0x02022D08
_081882FC: .4byte 0x03005AC0
_08188300: .4byte 0x08186DB1
	thumb_func_end RecordedOpponentHandleSwitchInAnim

	thumb_func_start sub_08188304
sub_08188304: @ 0x08188304
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r6, #0
	bl ClearTemporarySpeciesSpriteData
	ldr r0, _0818846C
	lsls r4, r6, #1
	adds r4, r4, r0
	ldr r0, _08188470
	lsls r1, r6, #9
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, #0x64
	mov sb, r1
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r5, _08188474
	adds r0, r0, r5
	movs r1, #0xb
	bl GetMonData
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _08188478
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0818847C
	mov sl, r1
	add sl, r6
	mov r1, sl
	strb r0, [r1]
	ldrh r0, [r4]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r5
	adds r1, r6, #0
	bl BattleLoadOpponentMonSpriteGfx
	adds r0, r6, #0
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToPokemon
	ldr r0, _08188480
	mov sb, r0
	adds r0, r6, #0
	movs r1, #2
	bl GetBattlerSpriteCoord
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetBattlerSpriteDefault_Y
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r6, #0
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r0, sb
	adds r1, r5, #0
	adds r2, r4, #0
	bl CreateSprite
	ldr r4, _08188484
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _08188488
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r4]
	strh r1, [r0, #0x30]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x32]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strh r6, [r0, #0x2e]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x32]
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r3, r6, #4
	ldrb r2, [r1, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #5]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0818848C
	adds r6, r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08188490
	str r1, [r0]
	movs r0, #0
	movs r1, #0xfe
	bl DoPokeballSendOutAnimation
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r1, #0x2e]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818846C: .4byte 0x02023D12
_08188470: .4byte 0x02022D08
_08188474: .4byte 0x020243E8
_08188478: .4byte 0x0805D331
_0818847C: .4byte 0x03005ADC
_08188480: .4byte 0x02024640
_08188484: .4byte 0x02023E88
_08188488: .4byte 0x020205AC
_0818848C: .4byte 0x02024188
_08188490: .4byte 0x08007141
	thumb_func_end sub_08188304

	thumb_func_start RecordedOpponentHandleReturnMonToBall
RecordedOpponentHandleReturnMonToBall: @ 0x08188494
	push {r4, r5, r6, lr}
	ldr r1, _081884C8
	ldr r6, _081884CC
	ldrb r2, [r6]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _081884DC
	ldr r0, _081884D0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strb r3, [r0, #4]
	ldr r1, _081884D4
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081884D8
	str r1, [r0]
	b _08188518
	.align 2, 0
_081884C8: .4byte 0x02022D08
_081884CC: .4byte 0x02023D08
_081884D0: .4byte 0x02024174
_081884D4: .4byte 0x03005AC0
_081884D8: .4byte 0x0818852D
_081884DC:
	ldr r5, _08188520
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _08188524
	adds r0, r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl DestroySprite
	ldrb r0, [r6]
	bl HideBattlerShadowSprite
	ldr r1, _08188528
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl SetHealthboxSpriteInvisible
	bl RecordedOpponentBufferExecCompleted
_08188518:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08188520: .4byte 0x02023E88
_08188524: .4byte 0x020205AC
_08188528: .4byte 0x03005AD0
	thumb_func_end RecordedOpponentHandleReturnMonToBall

	thumb_func_start sub_0818852C
sub_0818852C: @ 0x0818852C
	push {r4, r5, r6, lr}
	ldr r6, _0818854C
	ldr r4, [r6]
	ldr r5, _08188550
	ldrb r2, [r5]
	ldr r1, [r4, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _08188554
	cmp r0, #1
	beq _08188582
	b _081885AA
	.align 2, 0
_0818854C: .4byte 0x02024174
_08188550: .4byte 0x02023D08
_08188554:
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0818856E
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_0818856E:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _081885AA
_08188582:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _081885AA
	strb r0, [r3, #4]
	ldrb r2, [r5]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #2
	bl InitAndLaunchSpecialAnimation
	ldr r1, _081885B0
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081885B4
	str r1, [r0]
_081885AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081885B0: .4byte 0x03005AC0
_081885B4: .4byte 0x08186AC9
	thumb_func_end sub_0818852C

	thumb_func_start RecordedOpponentHandleDrawTrainerPic
RecordedOpponentHandleDrawTrainerPic: @ 0x081885B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r5, _081885F8
	ldr r0, [r5]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08188622
	ldr r4, _081885FC
	ldrb r0, [r4]
	bl GetBattlerPosition
	movs r1, #2
	ands r1, r0
	movs r7, #0xc8
	cmp r1, #0
	beq _081885E0
	movs r7, #0x98
_081885E0:
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08188618
	ldrb r0, [r4]
	cmp r0, #1
	bne _08188604
	ldr r0, _08188600
	b _08188606
	.align 2, 0
_081885F8: .4byte 0x02022C90
_081885FC: .4byte 0x02023D08
_08188600: .4byte 0x0203886A
_08188604:
	ldr r0, _08188614
_08188606:
	ldrh r0, [r0]
	bl GetFrontierTrainerFrontSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08188658
	.align 2, 0
_08188614: .4byte 0x0203886C
_08188618:
	bl GetActiveBattlerLinkPlayerGender
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08188650
_08188622:
	movs r7, #0xb0
	ldr r0, _08188638
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	bne _0818863C
	bl sub_08068688
	b _08188654
	.align 2, 0
_08188638: .4byte 0x0203886A
_0818863C:
	ldr r2, _0818873C
	ldr r0, _08188740
	ldrb r0, [r0]
	movs r1, #1
	eors r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x13]
_08188650:
	bl PlayerGenderToFrontTrainerPicId
_08188654:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08188658:
	mov r8, r0
	ldr r5, _08188744
	ldrb r1, [r5]
	bl DecompressTrainerFrontPic
	ldrb r0, [r5]
	bl GetBattlerPosition
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl SetMultiuseSpriteTemplateToTrainerBack
	ldr r6, _08188748
	mov sb, r7
	ldr r1, _0818874C
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r4, #8
	subs r4, r4, r0
	lsls r4, r4, #0x12
	movs r0, #0xa0
	lsls r0, r0, #0xe
	adds r4, r4, r0
	asrs r4, r4, #0x10
	ldrb r0, [r5]
	bl GetBattlerSpriteSubpriority
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r6, #0
	mov r1, sb
	adds r2, r4, #0
	bl CreateSprite
	ldr r6, _08188750
	ldrb r1, [r5]
	adds r1, r1, r6
	strb r0, [r1]
	ldr r4, _08188754
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08188758
	strh r1, [r0, #0x24]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #2
	strh r1, [r0, #0x2e]
	ldr r1, _0818875C
	mov r2, r8
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	bl IndexOfSpritePaletteTag
	ldrb r1, [r5]
	adds r1, r1, r6
	ldrb r1, [r1]
	lsls r2, r1, #4
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r4
	lsls r0, r0, #4
	ldrb r3, [r2, #5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r1, r8
	strh r1, [r0, #6]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x1c
	adds r0, r0, r4
	ldr r1, _08188760
	str r1, [r0]
	ldr r1, _08188764
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08188768
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818873C: .4byte 0x020226A0
_08188740: .4byte 0x0203C480
_08188744: .4byte 0x02023D08
_08188748: .4byte 0x02024640
_0818874C: .4byte 0x082D8D70
_08188750: .4byte 0x02023E88
_08188754: .4byte 0x020205AC
_08188758: .4byte 0x0000FF10
_0818875C: .4byte 0x082D91CC
_08188760: .4byte 0x0805D3C9
_08188764: .4byte 0x03005AC0
_08188768: .4byte 0x08186285
	thumb_func_end RecordedOpponentHandleDrawTrainerPic

	thumb_func_start RecordedOpponentHandleTrainerSlide
RecordedOpponentHandleTrainerSlide: @ 0x0818876C
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleTrainerSlide

	thumb_func_start RecordedOpponentHandleTrainerSlideBack
RecordedOpponentHandleTrainerSlideBack: @ 0x08188778
	push {r4, r5, r6, lr}
	ldr r6, _08188808
	ldr r4, _0818880C
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r5, _08188810
	adds r0, r0, r5
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x23
	strh r1, [r0, #0x2e]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x8c
	lsls r1, r1, #1
	strh r1, [r0, #0x32]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08188814
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _08188818
	bl StoreSpriteCallbackInData6
	ldr r1, _0818881C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08188820
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08188808: .4byte 0x02023E88
_0818880C: .4byte 0x02023D08
_08188810: .4byte 0x020205AC
_08188814: .4byte 0x080A67B5
_08188818: .4byte 0x08007141
_0818881C: .4byte 0x03005AC0
_08188820: .4byte 0x081862F5
	thumb_func_end RecordedOpponentHandleTrainerSlideBack

	thumb_func_start RecordedOpponentHandleFaintAnimation
RecordedOpponentHandleFaintAnimation: @ 0x08188824
	push {r4, r5, r6, lr}
	ldr r6, _08188870
	ldr r4, [r6]
	ldr r5, _08188874
	ldrb r2, [r5]
	ldr r0, [r4, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, r1, r0
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _08188878
	ldr r1, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08188858
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_08188858:
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	adds r1, #1
	strb r1, [r0, #4]
	b _081888B4
	.align 2, 0
_08188870: .4byte 0x02024174
_08188874: .4byte 0x02023D08
_08188878:
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _081888B4
	strb r0, [r3, #4]
	movs r0, #0x10
	movs r1, #0x3f
	bl PlaySE12WithPanning
	ldr r2, _081888BC
	ldr r1, _081888C0
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, _081888C4
	str r1, [r0]
	ldr r1, _081888C8
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _081888CC
	str r1, [r0]
_081888B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081888BC: .4byte 0x020205AC
_081888C0: .4byte 0x02023E88
_081888C4: .4byte 0x08039579
_081888C8: .4byte 0x03005AC0
_081888CC: .4byte 0x08186A85
	thumb_func_end RecordedOpponentHandleFaintAnimation

	thumb_func_start RecordedOpponentHandlePaletteFade
RecordedOpponentHandlePaletteFade: @ 0x081888D0
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandlePaletteFade

	thumb_func_start RecordedOpponentHandleSuccessBallThrowAnim
RecordedOpponentHandleSuccessBallThrowAnim: @ 0x081888DC
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleSuccessBallThrowAnim

	thumb_func_start RecordedOpponentHandleBallThrowAnim
RecordedOpponentHandleBallThrowAnim: @ 0x081888E8
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleBallThrowAnim

	thumb_func_start RecordedOpponentHandlePause
RecordedOpponentHandlePause: @ 0x081888F4
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandlePause

	thumb_func_start RecordedOpponentHandleMoveAnimation
RecordedOpponentHandleMoveAnimation: @ 0x08188900
	push {r4, r5, r6, lr}
	ldr r6, _081889E4
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08188912
	b _08188A26
_08188912:
	ldr r0, _081889E8
	mov ip, r0
	ldrb r2, [r6]
	lsls r2, r2, #9
	adds r0, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, ip
	adds r1, #2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	ldr r5, _081889EC
	mov r1, ip
	adds r1, #3
	adds r2, r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _081889F0
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #5
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _081889F4
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r3, r1
	mov r1, ip
	adds r1, #8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x10
	orrs r3, r1
	mov r1, ip
	adds r1, #9
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #0x18
	orrs r3, r1
	str r3, [r4]
	ldr r3, _081889F8
	ldrb r1, [r6]
	lsls r1, r1, #9
	mov r2, ip
	adds r2, #0xa
	adds r1, r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _081889FC
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #0xc
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, ip
	adds r1, #0xd
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _08188A00
	ldrb r2, [r6]
	lsls r2, r2, #9
	mov r1, ip
	adds r1, #0x10
	adds r2, r2, r1
	str r2, [r3]
	ldr r3, _08188A04
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl IsMoveWithoutAnimation
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _08188A08
	bl RecordedOpponentBufferExecCompleted
	b _08188A26
	.align 2, 0
_081889E4: .4byte 0x02023D08
_081889E8: .4byte 0x02022D08
_081889EC: .4byte 0x020380D2
_081889F0: .4byte 0x020380A8
_081889F4: .4byte 0x020380A4
_081889F8: .4byte 0x020380BA
_081889FC: .4byte 0x020380BC
_08188A00: .4byte 0x020380A0
_08188A04: .4byte 0x02024160
_08188A08:
	ldr r0, _08188A2C
	ldr r0, [r0]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #4]
	ldr r1, _08188A30
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08188A34
	str r1, [r0]
_08188A26:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08188A2C: .4byte 0x02024174
_08188A30: .4byte 0x03005AC0
_08188A34: .4byte 0x08188A39
	thumb_func_end RecordedOpponentHandleMoveAnimation

	thumb_func_start RecordedOpponentDoMoveAnimation
RecordedOpponentDoMoveAnimation: @ 0x08188A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _08188A84
	ldr r6, _08188A88
	ldrb r3, [r6]
	lsls r1, r3, #9
	adds r0, r2, #1
	mov sl, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, r2, #2
	mov sb, r5
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r4, r0
	adds r2, #0xb
	adds r1, r1, r2
	ldrb r1, [r1]
	mov r8, r1
	ldr r7, _08188A8C
	ldr r5, [r7]
	ldr r1, [r5, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _08188AD0
	cmp r2, #1
	bgt _08188A90
	cmp r2, #0
	beq _08188A9A
	b _08188BAC
	.align 2, 0
_08188A84: .4byte 0x02022D08
_08188A88: .4byte 0x02023D08
_08188A8C: .4byte 0x02024174
_08188A90:
	cmp r2, #2
	beq _08188AFA
	cmp r2, #3
	beq _08188B70
	b _08188BAC
_08188A9A:
	ldr r1, [r5]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldrb r2, [r1]
	movs r0, #0xc
	ands r0, r2
	cmp r0, #4
	bne _08188ABC
	movs r0, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r6]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #5
	bl InitAndLaunchSpecialAnimation
_08188ABC:
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0, #4]
	b _08188BAC
_08188AD0:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08188BAC
	movs r0, #0
	bl sub_0805E7B8
	adds r0, r4, #0
	bl DoMoveAnim
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #2
	strb r1, [r0, #4]
	b _08188BAC
_08188AFA:
	ldr r0, _08188B60
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08188B64
	ldrb r0, [r0]
	cmp r0, #0
	bne _08188BAC
	movs r0, #1
	bl sub_0805E7B8
	ldr r0, [r7]
	ldrb r2, [r6]
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08188B48
	mov r0, r8
	cmp r0, #1
	bhi _08188B48
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #6
	bl InitAndLaunchSpecialAnimation
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_08188B48:
	ldr r0, _08188B68
	ldr r2, [r0]
	ldr r0, _08188B6C
	ldrb r1, [r0]
	ldr r2, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #3
	strb r1, [r0, #4]
	b _08188BAC
	.align 2, 0
_08188B60: .4byte 0x02038098
_08188B64: .4byte 0x0203809D
_08188B68: .4byte 0x02024174
_08188B6C: .4byte 0x02023D08
_08188B70:
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08188BAC
	bl CopyAllBattleSpritesInvisibilities
	ldrb r0, [r6]
	lsls r2, r0, #9
	mov r3, sl
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, sb
	ldrb r2, [r2]
	lsls r2, r2, #8
	orrs r1, r2
	bl TrySetBehindSubstituteSpriteBit
	ldr r0, [r7]
	ldrb r1, [r6]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r4, [r0, #4]
	bl RecordedOpponentBufferExecCompleted
_08188BAC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentDoMoveAnimation

	thumb_func_start RecordedOpponentHandlePrintString
RecordedOpponentHandlePrintString: @ 0x08188BBC
	push {r4, lr}
	ldr r0, _08188BF4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08188BF8
	strh r1, [r0]
	ldr r4, _08188BFC
	ldrb r0, [r4]
	lsls r0, r0, #9
	ldr r1, _08188C00
	adds r0, r0, r1
	ldrh r0, [r0]
	bl BufferStringBattle
	ldr r0, _08188C04
	movs r1, #0
	bl sub_0814FA04
	ldr r1, _08188C08
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08188C0C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08188BF4: .4byte 0x02022AC8
_08188BF8: .4byte 0x02022ACA
_08188BFC: .4byte 0x02023D08
_08188C00: .4byte 0x02022D0A
_08188C04: .4byte 0x02022AE0
_08188C08: .4byte 0x03005AC0
_08188C0C: .4byte 0x08186B3D
	thumb_func_end RecordedOpponentHandlePrintString

	thumb_func_start RecordedOpponentHandlePrintSelectionString
RecordedOpponentHandlePrintSelectionString: @ 0x08188C10
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandlePrintSelectionString

	thumb_func_start RecordedOpponentHandleChooseAction
RecordedOpponentHandleChooseAction: @ 0x08188C1C
	push {lr}
	ldr r0, _08188C3C
	ldrb r0, [r0]
	bl RecordedBattle_GetBattlerAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0
	bl BtlController_EmitTwoReturnValues
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08188C3C: .4byte 0x02023D08
	thumb_func_end RecordedOpponentHandleChooseAction

	thumb_func_start RecordedOpponentHandleUnknownYesNoBox
RecordedOpponentHandleUnknownYesNoBox: @ 0x08188C40
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleUnknownYesNoBox

	thumb_func_start RecordedOpponentHandleChooseMove
RecordedOpponentHandleChooseMove: @ 0x08188C4C
	push {r4, r5, lr}
	ldr r0, _08188C70
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08188C74
	bl ChooseMoveAndTargetInBattlePalace
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
	b _08188C98
	.align 2, 0
_08188C70: .4byte 0x02022C90
_08188C74:
	ldr r5, _08188CA4
	ldrb r0, [r5]
	bl RecordedBattle_GetBattlerAction
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r5]
	bl RecordedBattle_GetBattlerAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x10
	orrs r2, r4
	movs r0, #1
	movs r1, #0xa
	bl BtlController_EmitTwoReturnValues
_08188C98:
	bl RecordedOpponentBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08188CA4: .4byte 0x02023D08
	thumb_func_end RecordedOpponentHandleChooseMove

	thumb_func_start RecordedOpponentHandleChooseItem
RecordedOpponentHandleChooseItem: @ 0x08188CA8
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleChooseItem

	thumb_func_start RecordedOpponentHandleChoosePokemon
RecordedOpponentHandleChoosePokemon: @ 0x08188CB4
	push {r4, lr}
	ldr r4, _08188CE8
	ldrb r0, [r4]
	bl RecordedBattle_GetBattlerAction
	ldrb r1, [r4]
	ldr r3, _08188CEC
	ldr r2, [r3]
	adds r1, r1, r2
	adds r1, #0x5c
	strb r0, [r1]
	ldrb r0, [r4]
	ldr r1, [r3]
	adds r0, r0, r1
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0
	bl BtlController_EmitChosenMonReturnValue
	bl RecordedOpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08188CE8: .4byte 0x02023D08
_08188CEC: .4byte 0x02024140
	thumb_func_end RecordedOpponentHandleChoosePokemon

	thumb_func_start RecordedOpponentHandleCmd23
RecordedOpponentHandleCmd23: @ 0x08188CF0
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleCmd23

	thumb_func_start RecordedOpponentHandleHealthBarUpdate
RecordedOpponentHandleHealthBarUpdate: @ 0x08188CFC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	bl LoadBattleBarGfx
	ldr r3, _08188D74
	ldr r0, _08188D78
	mov sb, r0
	ldrb r4, [r0]
	lsls r2, r4, #9
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, #3
	adds r2, r2, r3
	ldrb r0, [r2]
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	ldr r0, _08188D7C
	cmp r7, r0
	beq _08188D8C
	ldr r6, _08188D80
	lsls r0, r4, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	movs r5, #0x64
	muls r0, r5, r0
	ldr r4, _08188D84
	adds r0, r0, r4
	movs r1, #0x3a
	bl GetMonData
	mov r8, r0
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r5, r0
	adds r0, r0, r4
	movs r1, #0x39
	bl GetMonData
	adds r3, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _08188D88
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl SetBattleBarStruct
	b _08188DB6
	.align 2, 0
_08188D74: .4byte 0x02022D08
_08188D78: .4byte 0x02023D08
_08188D7C: .4byte 0x00007FFF
_08188D80: .4byte 0x02023D12
_08188D84: .4byte 0x020243E8
_08188D88: .4byte 0x03005AD0
_08188D8C:
	ldr r1, _08188DD4
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _08188DD8
	adds r0, r0, r1
	movs r1, #0x3a
	bl GetMonData
	adds r2, r0, #0
	mov r1, sb
	ldrb r0, [r1]
	ldr r1, _08188DDC
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, #0
	bl SetBattleBarStruct
_08188DB6:
	ldr r1, _08188DE0
	ldr r0, _08188DE4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08188DE8
	str r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08188DD4: .4byte 0x02023D12
_08188DD8: .4byte 0x020243E8
_08188DDC: .4byte 0x03005AD0
_08188DE0: .4byte 0x03005AC0
_08188DE4: .4byte 0x02023D08
_08188DE8: .4byte 0x08186A31
	thumb_func_end RecordedOpponentHandleHealthBarUpdate

	thumb_func_start RecordedOpponentHandleExpUpdate
RecordedOpponentHandleExpUpdate: @ 0x08188DEC
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleExpUpdate

	thumb_func_start RecordedOpponentHandleStatusIconUpdate
RecordedOpponentHandleStatusIconUpdate: @ 0x08188DF8
	push {r4, lr}
	ldr r4, _08188E54
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08188E4C
	ldr r0, _08188E58
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08188E5C
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x64
	muls r1, r2, r1
	ldr r2, _08188E60
	adds r1, r1, r2
	movs r2, #9
	bl UpdateHealthboxAttribute
	ldrb r2, [r4]
	ldr r0, _08188E64
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08188E68
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08188E6C
	str r1, [r0]
_08188E4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08188E54: .4byte 0x02023D08
_08188E58: .4byte 0x03005AD0
_08188E5C: .4byte 0x02023D12
_08188E60: .4byte 0x020243E8
_08188E64: .4byte 0x02024174
_08188E68: .4byte 0x03005AC0
_08188E6C: .4byte 0x08186E79
	thumb_func_end RecordedOpponentHandleStatusIconUpdate

	thumb_func_start RecordedOpponentHandleStatusAnimation
RecordedOpponentHandleStatusAnimation: @ 0x08188E70
	push {r4, r5, lr}
	ldr r5, _08188EC8
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08188EC0
	ldr r4, _08188ECC
	ldrb r3, [r5]
	lsls r3, r3, #9
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, r2, #8
	orrs r1, r2
	adds r2, r4, #4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, r2, #0x10
	orrs r1, r2
	adds r4, #5
	adds r3, r3, r4
	ldrb r2, [r3]
	lsls r2, r2, #0x18
	orrs r1, r2
	bl InitAndLaunchChosenStatusAnimation
	ldr r1, _08188ED0
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08188ED4
	str r1, [r0]
_08188EC0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08188EC8: .4byte 0x02023D08
_08188ECC: .4byte 0x02022D08
_08188ED0: .4byte 0x03005AC0
_08188ED4: .4byte 0x08186E79
	thumb_func_end RecordedOpponentHandleStatusAnimation

	thumb_func_start RecordedOpponentHandleStatusXor
RecordedOpponentHandleStatusXor: @ 0x08188ED8
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleStatusXor

	thumb_func_start RecordedOpponentHandleDataTransfer
RecordedOpponentHandleDataTransfer: @ 0x08188EE4
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleDataTransfer

	thumb_func_start RecordedOpponentHandleDMA3Transfer
RecordedOpponentHandleDMA3Transfer: @ 0x08188EF0
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleDMA3Transfer

	thumb_func_start RecordedOpponentHandlePlayBGM
RecordedOpponentHandlePlayBGM: @ 0x08188EFC
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandlePlayBGM

	thumb_func_start RecordedOpponentHandleCmd32
RecordedOpponentHandleCmd32: @ 0x08188F08
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleCmd32

	thumb_func_start RecordedOpponentHandleTwoReturnValues
RecordedOpponentHandleTwoReturnValues: @ 0x08188F14
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleTwoReturnValues

	thumb_func_start RecordedOpponentHandleChosenMonReturnValue
RecordedOpponentHandleChosenMonReturnValue: @ 0x08188F20
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleChosenMonReturnValue

	thumb_func_start RecordedOpponentHandleOneReturnValue
RecordedOpponentHandleOneReturnValue: @ 0x08188F2C
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleOneReturnValue

	thumb_func_start RecordedOpponentHandleOneReturnValue_Duplicate
RecordedOpponentHandleOneReturnValue_Duplicate: @ 0x08188F38
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleOneReturnValue_Duplicate

	thumb_func_start RecordedOpponentHandleCmd37
RecordedOpponentHandleCmd37: @ 0x08188F44
	push {lr}
	ldr r2, _08188F5C
	ldrb r1, [r2]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08188F5C: .4byte 0x020229C0
	thumb_func_end RecordedOpponentHandleCmd37

	thumb_func_start RecordedOpponentHandleCmd38
RecordedOpponentHandleCmd38: @ 0x08188F60
	push {lr}
	ldr r3, _08188F8C
	ldr r1, _08188F90
	ldr r0, _08188F94
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08188F8C: .4byte 0x020229C0
_08188F90: .4byte 0x02022D08
_08188F94: .4byte 0x02023D08
	thumb_func_end RecordedOpponentHandleCmd38

	thumb_func_start RecordedOpponentHandleCmd39
RecordedOpponentHandleCmd39: @ 0x08188F98
	push {lr}
	ldr r2, _08188FAC
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08188FAC: .4byte 0x020229C0
	thumb_func_end RecordedOpponentHandleCmd39

	thumb_func_start RecordedOpponentHandleCmd40
RecordedOpponentHandleCmd40: @ 0x08188FB0
	push {lr}
	ldr r3, _08188FD4
	ldr r1, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #7
	ldrb r2, [r3]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08188FD4: .4byte 0x020229C0
	thumb_func_end RecordedOpponentHandleCmd40

	thumb_func_start RecordedOpponentHandleHitAnimation
RecordedOpponentHandleHitAnimation: @ 0x08188FD8
	push {r4, lr}
	ldr r3, _08189000
	ldr r2, _08189004
	ldr r4, _08189008
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0818900C
	bl RecordedOpponentBufferExecCompleted
	b _08189036
	.align 2, 0
_08189000: .4byte 0x020205AC
_08189004: .4byte 0x02023E88
_08189008: .4byte 0x02023D08
_0818900C:
	ldr r1, _0818903C
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r0, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strh r1, [r0, #0x30]
	ldrb r0, [r4]
	bl DoHitAnimHealthboxEffect
	ldr r1, _08189040
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08189044
	str r1, [r0]
_08189036:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818903C: .4byte 0x0202415D
_08189040: .4byte 0x03005AC0
_08189044: .4byte 0x08186B55
	thumb_func_end RecordedOpponentHandleHitAnimation

	thumb_func_start RecordedOpponentHandleCmd42
RecordedOpponentHandleCmd42: @ 0x08189048
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleCmd42

	thumb_func_start RecordedOpponentHandlePlaySE
RecordedOpponentHandlePlaySE: @ 0x08189054
	push {r4, lr}
	ldr r4, _08189090
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	movs r3, #0x3f
	cmp r0, #0
	bne _08189068
	movs r3, #0xc0
_08189068:
	ldr r2, _08189094
	ldrb r1, [r4]
	lsls r1, r1, #9
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	bl PlaySE12WithPanning
	bl RecordedOpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08189090: .4byte 0x02023D08
_08189094: .4byte 0x02022D08
	thumb_func_end RecordedOpponentHandlePlaySE

	thumb_func_start RecordedOpponentHandlePlayFanfareOrBGM
RecordedOpponentHandlePlayFanfareOrBGM: @ 0x08189098
	push {r4, r5, lr}
	ldr r4, _081890CC
	ldr r5, _081890D0
	ldrb r0, [r5]
	lsls r3, r0, #9
	adds r0, r4, #3
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _081890D4
	bl BattleStopLowHpSound
	ldrb r1, [r5]
	lsls r1, r1, #9
	adds r0, r4, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r4, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayBGM
	b _081890E8
	.align 2, 0
_081890CC: .4byte 0x02022D08
_081890D0: .4byte 0x02023D08
_081890D4:
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, #2
	adds r1, r3, r1
	ldrb r1, [r1]
	lsls r1, r1, #8
	orrs r0, r1
	bl PlayFanfare
_081890E8:
	bl RecordedOpponentBufferExecCompleted
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandlePlayFanfareOrBGM

	thumb_func_start RecordedOpponentHandleFaintingCry
RecordedOpponentHandleFaintingCry: @ 0x081890F4
	push {lr}
	ldr r1, _08189124
	ldr r0, _08189128
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _0818912C
	adds r0, r0, r1
	movs r1, #0xb
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x19
	movs r2, #5
	bl PlayCry3
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08189124: .4byte 0x02023D12
_08189128: .4byte 0x02023D08
_0818912C: .4byte 0x020243E8
	thumb_func_end RecordedOpponentHandleFaintingCry

	thumb_func_start RecordedOpponentHandleIntroSlide
RecordedOpponentHandleIntroSlide: @ 0x08189130
	push {lr}
	ldr r1, _08189158
	ldr r0, _0818915C
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bl HandleIntroSlide
	ldr r2, _08189160
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_08189158: .4byte 0x02022D08
_0818915C: .4byte 0x02023D08
_08189160: .4byte 0x020240A0
	thumb_func_end RecordedOpponentHandleIntroSlide

	thumb_func_start RecordedOpponentHandleIntroTrainerBallThrow
RecordedOpponentHandleIntroTrainerBallThrow: @ 0x08189164
	push {r4, r5, r6, lr}
	ldr r5, _08189244
	ldr r6, _08189248
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, _0818924C
	adds r0, r0, r4
	bl SetSpritePrimaryCoordsFromSecondaryCoords
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x23
	strh r1, [r0, #0x2e]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x8c
	lsls r1, r1, #1
	strh r1, [r0, #0x32]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0, #0x22]
	strh r1, [r0, #0x36]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x1c
	adds r0, r0, r1
	ldr r1, _08189250
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, _08189254
	bl StoreSpriteCallbackInData6
	ldr r0, _08189258
	movs r1, #5
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0818925C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r6]
	strh r0, [r1, #8]
	ldr r3, _08189260
	ldr r0, [r3]
	ldrb r2, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08189226
	ldr r0, _08189264
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, _08189268
	str r1, [r0]
_08189226:
	ldr r0, [r3]
	ldr r2, [r0, #8]
	ldrb r0, [r2, #9]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #9]
	ldr r1, _0818926C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08189270
	str r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08189244: .4byte 0x02023E88
_08189248: .4byte 0x02023D08
_0818924C: .4byte 0x020205AC
_08189250: .4byte 0x080A67B5
_08189254: .4byte 0x08189359
_08189258: .4byte 0x08189275
_0818925C: .4byte 0x03005B60
_08189260: .4byte 0x02024174
_08189264: .4byte 0x02024158
_08189268: .4byte 0x0807352D
_0818926C: .4byte 0x03005AC0
_08189270: .4byte 0x08186215
	thumb_func_end RecordedOpponentHandleIntroTrainerBallThrow

	thumb_func_start sub_08189274
sub_08189274: @ 0x08189274
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r7, _081892CC
	ldrb r0, [r7]
	mov sb, r0
	ldr r1, _081892D0
	mov r2, r8
	lsls r0, r2, #2
	add r0, r8
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081892AE
	ldr r0, _081892D4
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _081892E0
_081892AE:
	ldr r0, _081892D8
	ldrb r1, [r7]
	lsls r2, r1, #9
	adds r0, #1
	adds r2, r2, r0
	ldr r0, _081892DC
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_08188304
	b _08189320
	.align 2, 0
_081892CC: .4byte 0x02023D08
_081892D0: .4byte 0x03005B60
_081892D4: .4byte 0x02022C90
_081892D8: .4byte 0x02022D08
_081892DC: .4byte 0x02023D12
_081892E0:
	ldr r4, _08189344
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r4, #1
	adds r1, r1, r4
	ldr r6, _08189348
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_08188304
	ldrb r0, [r7]
	movs r5, #2
	eors r0, r5
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, #9
	adds r1, r1, r4
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #0
	bl sub_08188304
	ldrb r0, [r7]
	eors r0, r5
	strb r0, [r7]
_08189320:
	ldr r1, _0818934C
	ldr r2, _08189350
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08189354
	str r1, [r0]
	mov r0, sb
	strb r0, [r2]
	mov r0, r8
	bl DestroyTask
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08189344: .4byte 0x02022D08
_08189348: .4byte 0x02023D12
_0818934C: .4byte 0x03005AC0
_08189350: .4byte 0x02023D08
_08189354: .4byte 0x08186599
	thumb_func_end sub_08189274

	thumb_func_start sub_08189358
sub_08189358: @ 0x08189358
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #6]
	bl FreeTrainerFrontPicPalette
	adds r0, r4, #0
	bl FreeSpriteOamMatrix
	adds r0, r4, #0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08189358

	thumb_func_start RecordedOpponentHandleDrawPartyStatusSummary
RecordedOpponentHandleDrawPartyStatusSummary: @ 0x08189374
	push {r4, r5, r6, r7, lr}
	ldr r1, _0818939C
	ldr r0, _081893A0
	ldrb r2, [r0]
	lsls r0, r2, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _081893A4
	adds r0, r2, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081893A4
	bl RecordedOpponentBufferExecCompleted
	b _0818946E
	.align 2, 0
_0818939C: .4byte 0x02022D08
_081893A0: .4byte 0x02023D08
_081893A4:
	ldr r4, _081893FC
	ldr r0, [r4]
	ldr r3, _08189400
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _08189404
	ldrb r2, [r3]
	lsls r0, r2, #9
	adds r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r3, #0
	cmp r0, #0
	beq _08189410
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r2, [r3, #1]
	lsls r1, r2, #0x1b
	lsrs r0, r1, #0x1c
	cmp r0, #1
	bhi _08189408
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #1]
	b _0818946E
	.align 2, 0
_081893FC: .4byte 0x02024174
_08189400: .4byte 0x02023D08
_08189404: .4byte 0x02022D08
_08189408:
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3, #1]
_08189410:
	adds r5, r7, #0
	ldrb r0, [r5]
	lsls r3, r0, #9
	ldr r4, _08189474
	adds r1, r3, r4
	subs r2, r4, #3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, #2
	adds r3, r3, r4
	ldrb r3, [r3]
	bl CreatePartyStatusSummarySprites
	ldr r2, _08189478
	ldrb r1, [r5]
	adds r1, r1, r2
	movs r3, #0
	strb r0, [r1]
	ldr r6, _0818947C
	ldr r0, [r6]
	ldrb r1, [r5]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r3, [r0, #5]
	ldrb r2, [r5]
	lsls r0, r2, #9
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08189462
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x5d
	strb r1, [r0, #5]
_08189462:
	ldr r0, _08189480
	ldrb r1, [r7]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _08189484
	str r0, [r1]
_0818946E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08189474: .4byte 0x02022D0C
_08189478: .4byte 0x02024158
_0818947C: .4byte 0x02024174
_08189480: .4byte 0x03005AC0
_08189484: .4byte 0x08189489
	thumb_func_end RecordedOpponentHandleDrawPartyStatusSummary

	thumb_func_start sub_08189488
sub_08189488: @ 0x08189488
	push {r4, lr}
	ldr r4, _081894C8
	ldr r0, [r4]
	ldr r3, _081894CC
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #5]
	adds r2, r1, #1
	strb r2, [r0, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x5c
	bls _081894C0
	ldr r0, [r4]
	ldrb r1, [r3]
	ldr r2, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0, #5]
	bl RecordedOpponentBufferExecCompleted
_081894C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081894C8: .4byte 0x02024174
_081894CC: .4byte 0x02023D08
	thumb_func_end sub_08189488

	thumb_func_start RecordedOpponentHandleHidePartyStatusSummary
RecordedOpponentHandleHidePartyStatusSummary: @ 0x081894D0
	push {lr}
	ldr r0, _0818950C
	ldr r1, [r0]
	ldr r0, _08189510
	ldrb r3, [r0]
	ldr r1, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08189502
	ldr r2, _08189514
	ldr r0, _08189518
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _0818951C
	str r1, [r0]
_08189502:
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
_0818950C: .4byte 0x02024174
_08189510: .4byte 0x02023D08
_08189514: .4byte 0x03005B60
_08189518: .4byte 0x02024158
_0818951C: .4byte 0x0807352D
	thumb_func_end RecordedOpponentHandleHidePartyStatusSummary

	thumb_func_start RecordedOpponentHandleEndBounceEffect
RecordedOpponentHandleEndBounceEffect: @ 0x08189520
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleEndBounceEffect

	thumb_func_start RecordedOpponentHandleSpriteInvisibility
RecordedOpponentHandleSpriteInvisibility: @ 0x0818952C
	push {r4, lr}
	ldr r4, _0818957C
	ldrb r0, [r4]
	bl IsBattlerSpritePresent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08189572
	ldr r3, _08189580
	ldr r0, _08189584
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _08189588
	lsls r1, r1, #9
	adds r0, #1
	adds r1, r1, r0
	adds r2, #0x3e
	movs r0, #1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl CopyBattleSpriteInvisibility
_08189572:
	bl RecordedOpponentBufferExecCompleted
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818957C: .4byte 0x02023D08
_08189580: .4byte 0x020205AC
_08189584: .4byte 0x02023E88
_08189588: .4byte 0x02022D08
	thumb_func_end RecordedOpponentHandleSpriteInvisibility

	thumb_func_start RecordedOpponentHandleBattleAnimation
RecordedOpponentHandleBattleAnimation: @ 0x0818958C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _081895D0
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081895E4
	ldr r5, _081895D4
	ldrb r2, [r6]
	lsls r1, r2, #9
	adds r0, r5, #1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, #2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, #3
	adds r1, r1, r5
	ldrb r0, [r1]
	lsls r0, r0, #8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, #0
	adds r1, r2, #0
	bl TryHandleLaunchBattleTableAnimation
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081895D8
	bl RecordedOpponentBufferExecCompleted
	b _081895E4
	.align 2, 0
_081895D0: .4byte 0x02023D08
_081895D4: .4byte 0x02022D08
_081895D8:
	ldr r0, _081895EC
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _081895F0
	str r0, [r1]
_081895E4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081895EC: .4byte 0x03005AC0
_081895F0: .4byte 0x08186EA9
	thumb_func_end RecordedOpponentHandleBattleAnimation

	thumb_func_start RecordedOpponentHandleLinkStandbyMsg
RecordedOpponentHandleLinkStandbyMsg: @ 0x081895F4
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleLinkStandbyMsg

	thumb_func_start RecordedOpponentHandleResetActionMoveSelection
RecordedOpponentHandleResetActionMoveSelection: @ 0x08189600
	push {lr}
	bl RecordedOpponentBufferExecCompleted
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end RecordedOpponentHandleResetActionMoveSelection

	thumb_func_start RecordedOpponentHandleCmd55
RecordedOpponentHandleCmd55: @ 0x0818960C
	push {lr}
	ldr r1, _08189628
	ldr r0, _0818962C
	ldrb r0, [r0]
	lsls r0, r0, #9
	adds r1, #1
	adds r0, r0, r1
	ldrb r2, [r0]
	cmp r2, #3
	bne _08189634
	ldr r0, _08189630
	strb r2, [r0]
	b _0818963C
	.align 2, 0
_08189628: .4byte 0x02022D08
_0818962C: .4byte 0x02023D08
_08189630: .4byte 0x02023FDE
_08189634:
	ldr r0, _08189660
	movs r1, #3
	eors r1, r2
	strb r1, [r0]
_0818963C:
	movs r0, #5
	bl FadeOutMapMusic
	movs r0, #3
	bl BeginFastPaletteFade
	bl RecordedOpponentBufferExecCompleted
	ldr r1, _08189664
	ldr r0, _08189668
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _0818966C
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08189660: .4byte 0x02023FDE
_08189664: .4byte 0x03005AC0
_08189668: .4byte 0x02023D08
_0818966C: .4byte 0x080583C1
	thumb_func_end RecordedOpponentHandleCmd55

	thumb_func_start RecordedOpponentCmdEnd
RecordedOpponentCmdEnd: @ 0x08189670
	bx lr
	.align 2, 0
	thumb_func_end RecordedOpponentCmdEnd

