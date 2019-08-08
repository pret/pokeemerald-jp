.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearSaveData
ClearSaveData: @ 0x0815262C
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08152658
_08152632:
	ldr r1, [r5]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [r5]
	bl _call_via_r1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _08152632
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08152658: .4byte 0x03007600
	thumb_func_end ClearSaveData

	thumb_func_start Save_ResetSaveCounters
Save_ResetSaveCounters: @ 0x0815265C
	ldr r0, _0815266C
	movs r1, #0
	str r1, [r0]
	ldr r0, _08152670
	strh r1, [r0]
	ldr r0, _08152674
	str r1, [r0]
	bx lr
	.align 2, 0
_0815266C: .4byte 0x03005F40
_08152670: .4byte 0x03005F30
_08152674: .4byte 0x03005F3C
	thumb_func_end Save_ResetSaveCounters

	thumb_func_start SetDamagedSectorBits
SetDamagedSectorBits: @ 0x08152678
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r4, #0
	cmp r0, #1
	beq _081526AC
	cmp r0, #1
	bgt _08152692
	cmp r0, #0
	beq _08152698
	b _081526D0
_08152692:
	cmp r0, #2
	beq _081526C0
	b _081526D0
_08152698:
	ldr r2, _081526A8
	movs r1, #1
	lsls r1, r3
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _081526D0
	.align 2, 0
_081526A8: .4byte 0x03005F3C
_081526AC:
	ldr r2, _081526BC
	adds r1, r0, #0
	lsls r1, r3
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	b _081526D0
	.align 2, 0
_081526BC: .4byte 0x03005F3C
_081526C0:
	ldr r0, _081526D8
	movs r1, #1
	lsls r1, r3
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _081526D0
	movs r4, #1
_081526D0:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081526D8: .4byte 0x03005F3C
	thumb_func_end SetDamagedSectorBits

	thumb_func_start save_write_to_flash
save_write_to_flash: @ 0x081526DC
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08152700
	ldr r0, _08152704
	str r0, [r1]
	ldr r0, _08152708
	cmp r2, r0
	beq _0815270C
	adds r0, r2, #0
	adds r1, r7, #0
	bl HandleWriteSector
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0815275E
	.align 2, 0
_08152700: .4byte 0x03005F44
_08152704: .4byte 0x0203A888
_08152708: .4byte 0x0000FFFF
_0815270C:
	ldr r1, _08152768
	ldr r5, _0815276C
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _08152770
	ldr r6, _08152774
	ldr r4, [r6]
	str r4, [r1]
	adds r0, #1
	strh r0, [r5]
	ldrh r0, [r5]
	movs r1, #0xe
	bl __umodsi3
	strh r0, [r5]
	adds r4, #1
	str r4, [r6]
	movs r5, #1
	movs r4, #0
_08152732:
	adds r0, r4, #0
	adds r1, r7, #0
	bl HandleWriteSector
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xd
	bls _08152732
	ldr r0, _08152778
	ldr r0, [r0]
	cmp r0, #0
	beq _0815275E
	movs r5, #0xff
	ldr r1, _0815276C
	ldr r0, _08152768
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08152774
	ldr r0, _08152770
	ldr r0, [r0]
	str r0, [r1]
_0815275E:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08152768: .4byte 0x03005F38
_0815276C: .4byte 0x03005F30
_08152770: .4byte 0x03005F34
_08152774: .4byte 0x03005F40
_08152778: .4byte 0x03005F3C
	thumb_func_end save_write_to_flash

	thumb_func_start HandleWriteSector
HandleWriteSector: @ 0x0815277C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08152848
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _0815284C
	ldr r1, [r2]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #3
	adds r0, r0, r4
	ldr r1, [r0]
	mov sl, r1
	ldrh r4, [r0, #4]
	movs r3, #0
	mov sb, r2
	ldr r2, _08152850
	mov ip, r2
	mov r8, ip
	movs r2, #0
	ldr r1, _08152854
_081527CE:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r0, r3
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	bls _081527CE
	mov r0, ip
	ldr r1, [r0]
	ldr r2, _08152858
	adds r0, r1, r2
	strh r6, [r0]
	ldr r3, _0815285C
	adds r2, r1, r3
	ldr r0, _08152860
	str r0, [r2]
	ldr r6, _08152864
	adds r1, r1, r6
	mov r7, sb
	ldr r0, [r7]
	str r0, [r1]
	movs r3, #0
	lsls r5, r5, #0x18
	cmp r3, r4
	bhs _0815281C
	mov r2, ip
_08152806:
	ldr r1, [r2]
	adds r1, r1, r3
	mov r6, sl
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blo _08152806
_0815281C:
	mov r0, sl
	adds r1, r4, #0
	bl CalculateChecksum
	ldr r1, _08152850
	ldr r1, [r1]
	ldr r7, _08152868
	adds r2, r1, r7
	strh r0, [r2]
	lsrs r0, r5, #0x18
	bl TryWriteSector
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08152848: .4byte 0x03005F30
_0815284C: .4byte 0x03005F40
_08152850: .4byte 0x03005F44
_08152854: .4byte 0x00000FFF
_08152858: .4byte 0x00000FF4
_0815285C: .4byte 0x00000FF8
_08152860: .4byte 0x08012025
_08152864: .4byte 0x00000FFC
_08152868: .4byte 0x00000FF6
	thumb_func_end HandleWriteSector

	thumb_func_start HandleWriteSectorNBytes
HandleWriteSectorNBytes: @ 0x0815286C
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _081528D0
	movs r3, #0
	movs r6, #0
	ldr r1, _081528D4
_08152880:
	adds r0, r4, r3
	strb r6, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	bls _08152880
	ldr r0, _081528D8
	adds r1, r4, r0
	ldr r0, _081528DC
	str r0, [r1]
	movs r3, #0
	cmp r3, r2
	bhs _081528AE
_0815289C:
	adds r1, r4, r3
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	blo _0815289C
_081528AE:
	adds r0, r5, #0
	adds r1, r2, #0
	bl CalculateChecksum
	ldr r2, _081528E0
	adds r1, r4, r2
	strh r0, [r1]
	adds r0, r7, #0
	adds r1, r4, #0
	bl TryWriteSector
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081528D0: .4byte 0x0203A888
_081528D4: .4byte 0x00000FFF
_081528D8: .4byte 0x00000FF8
_081528DC: .4byte 0x08012025
_081528E0: .4byte 0x00000FF4
	thumb_func_end HandleWriteSectorNBytes

	thumb_func_start TryWriteSector
TryWriteSector: @ 0x081528E4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl ProgramFlashSectorAndVerify
	cmp r0, #0
	bne _08152900
	movs r0, #1
	adds r1, r4, #0
	bl SetDamagedSectorBits
	movs r0, #1
	b _0815290A
_08152900:
	movs r0, #0
	adds r1, r4, #0
	bl SetDamagedSectorBits
	movs r0, #0xff
_0815290A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryWriteSector

	thumb_func_start RestoreSaveBackupVarsAndIncrement
RestoreSaveBackupVarsAndIncrement: @ 0x08152910
	push {r4, r5, r6, lr}
	ldr r1, _0815294C
	ldr r0, _08152950
	str r0, [r1]
	ldr r1, _08152954
	ldr r5, _08152958
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _0815295C
	ldr r6, _08152960
	ldr r4, [r6]
	str r4, [r1]
	adds r0, #1
	strh r0, [r5]
	ldrh r0, [r5]
	movs r1, #0xe
	bl __umodsi3
	strh r0, [r5]
	adds r4, #1
	str r4, [r6]
	ldr r1, _08152964
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08152968
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0815294C: .4byte 0x03005F44
_08152950: .4byte 0x0203A888
_08152954: .4byte 0x03005F38
_08152958: .4byte 0x03005F30
_0815295C: .4byte 0x03005F34
_08152960: .4byte 0x03005F40
_08152964: .4byte 0x03005F48
_08152968: .4byte 0x03005F3C
	thumb_func_end RestoreSaveBackupVarsAndIncrement

	thumb_func_start RestoreSaveBackupVars
RestoreSaveBackupVars: @ 0x0815296C
	ldr r1, _08152990
	ldr r0, _08152994
	str r0, [r1]
	ldr r1, _08152998
	ldr r0, _0815299C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081529A0
	ldr r0, _081529A4
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _081529A8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _081529AC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08152990: .4byte 0x03005F44
_08152994: .4byte 0x0203A888
_08152998: .4byte 0x03005F38
_0815299C: .4byte 0x03005F30
_081529A0: .4byte 0x03005F34
_081529A4: .4byte 0x03005F40
_081529A8: .4byte 0x03005F48
_081529AC: .4byte 0x03005F3C
	thumb_func_end RestoreSaveBackupVars

	thumb_func_start sub_081529B0
sub_081529B0: @ 0x081529B0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _081529EC
	ldrh r2, [r4]
	subs r0, #1
	cmp r2, r0
	bge _08152A04
	movs r5, #1
	adds r0, r2, #0
	bl HandleWriteSector
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, _081529F0
	ldr r0, [r0]
	cmp r0, #0
	beq _08152A06
	movs r5, #0xff
	ldr r1, _081529F4
	ldr r0, _081529F8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081529FC
	ldr r0, _08152A00
	ldr r0, [r0]
	str r0, [r1]
	b _08152A06
	.align 2, 0
_081529EC: .4byte 0x03005F48
_081529F0: .4byte 0x03005F3C
_081529F4: .4byte 0x03005F30
_081529F8: .4byte 0x03005F38
_081529FC: .4byte 0x03005F40
_08152A00: .4byte 0x03005F34
_08152A04:
	movs r5, #0xff
_08152A06:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081529B0

	thumb_func_start sub_08152A10
sub_08152A10: @ 0x08152A10
	push {r4, lr}
	lsls r0, r0, #0x10
	movs r4, #1
	ldr r2, _08152A44
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	bl ClearSaveData_2
	ldr r0, _08152A48
	ldr r0, [r0]
	cmp r0, #0
	beq _08152A3A
	movs r4, #0xff
	ldr r1, _08152A4C
	ldr r0, _08152A50
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08152A54
	ldr r0, _08152A58
	ldr r0, [r0]
	str r0, [r1]
_08152A3A:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08152A44: .4byte 0xFFFF0000
_08152A48: .4byte 0x03005F3C
_08152A4C: .4byte 0x03005F30
_08152A50: .4byte 0x03005F38
_08152A54: .4byte 0x03005F40
_08152A58: .4byte 0x03005F34
	thumb_func_end sub_08152A10

	thumb_func_start ClearSaveData_2
ClearSaveData_2: @ 0x08152A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08152B28
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _08152B2C
	ldr r1, [r2]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #3
	adds r0, r0, r4
	ldr r1, [r0]
	mov sl, r1
	ldrh r3, [r0, #4]
	movs r4, #0
	mov sb, r2
	ldr r2, _08152B30
	mov ip, r2
	mov r8, ip
	movs r2, #0
	ldr r1, _08152B34
_08152AAE:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r1
	bls _08152AAE
	mov r0, ip
	ldr r1, [r0]
	ldr r2, _08152B38
	adds r0, r1, r2
	strh r6, [r0]
	ldr r6, _08152B3C
	adds r2, r1, r6
	ldr r0, _08152B40
	str r0, [r2]
	ldr r7, _08152B44
	adds r1, r1, r7
	mov r2, sb
	ldr r0, [r2]
	str r0, [r1]
	movs r4, #0
	lsls r6, r5, #0x18
	mov r8, r6
	cmp r4, r3
	bhs _08152AFE
	mov r2, ip
_08152AE8:
	ldr r1, [r2]
	adds r1, r1, r4
	mov r7, sl
	adds r0, r7, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r3
	blo _08152AE8
_08152AFE:
	mov r0, sl
	adds r1, r3, #0
	bl CalculateChecksum
	ldr r1, _08152B30
	ldr r1, [r1]
	ldr r2, _08152B48
	adds r1, r1, r2
	strh r0, [r1]
	ldr r0, _08152B4C
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	movs r6, #1
	movs r4, #0
	ldr r7, _08152B50
	mov sb, r7
	ldr r7, _08152B54
	b _08152B5E
	.align 2, 0
_08152B28: .4byte 0x03005F30
_08152B2C: .4byte 0x03005F40
_08152B30: .4byte 0x03005F44
_08152B34: .4byte 0x00000FFF
_08152B38: .4byte 0x00000FF4
_08152B3C: .4byte 0x00000FF8
_08152B40: .4byte 0x08012025
_08152B44: .4byte 0x00000FFC
_08152B48: .4byte 0x00000FF6
_08152B4C: .4byte 0x03007600
_08152B50: .4byte 0x00000FF7
_08152B54: .4byte 0x030075F4
_08152B58:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08152B5E:
	cmp r4, sb
	bhi _08152B7C
	ldr r0, _08152B88
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	ldr r3, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08152B58
	movs r6, #0xff
_08152B7C:
	cmp r6, #0xff
	bne _08152B8C
	mov r0, r8
	lsrs r1, r0, #0x18
	b _08152BE4
	.align 2, 0
_08152B88: .4byte 0x03005F44
_08152B8C:
	movs r6, #1
	movs r4, #0
	ldr r1, _08152B98
	mov sb, r1
	ldr r7, _08152B9C
	b _08152BA6
	.align 2, 0
_08152B98: .4byte 0x030075F4
_08152B9C: .4byte 0x00000FF9
_08152BA0:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08152BA6:
	cmp r4, #6
	bhi _08152BC8
	adds r1, r4, r7
	ldr r0, _08152BDC
	ldr r0, [r0]
	adds r0, r4, r0
	adds r0, r0, r7
	ldrb r2, [r0]
	mov r0, sb
	ldr r3, [r0]
	adds r0, r5, #0
	bl _call_via_r3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08152BA0
	movs r6, #0xff
_08152BC8:
	cmp r6, #0xff
	beq _08152BE0
	mov r2, r8
	lsrs r1, r2, #0x18
	movs r0, #1
	bl SetDamagedSectorBits
	movs r0, #1
	b _08152BEC
	.align 2, 0
_08152BDC: .4byte 0x03005F44
_08152BE0:
	mov r6, r8
	lsrs r1, r6, #0x18
_08152BE4:
	movs r0, #0
	bl SetDamagedSectorBits
	movs r0, #0xff
_08152BEC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ClearSaveData_2

	thumb_func_start sub_08152BFC
sub_08152BFC: @ 0x08152BFC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r6, _08152C58
	lsrs r0, r0, #0x10
	ldrh r1, [r6]
	adds r0, r0, r1
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r5, _08152C5C
	ldr r1, [r5]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r3, _08152C60
	ldr r1, _08152C64
	ldr r0, _08152C68
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r3, [r3]
	adds r0, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08152C6C
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	bl SetDamagedSectorBits
	movs r0, #1
	b _08152C84
	.align 2, 0
_08152C58: .4byte 0x03005F30
_08152C5C: .4byte 0x03005F40
_08152C60: .4byte 0x030075F4
_08152C64: .4byte 0x00000FF8
_08152C68: .4byte 0x03005F44
_08152C6C:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl SetDamagedSectorBits
	ldr r0, _08152C8C
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _08152C90
	ldr r0, [r0]
	str r0, [r5]
	movs r0, #0xff
_08152C84:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08152C8C: .4byte 0x03005F38
_08152C90: .4byte 0x03005F34
	thumb_func_end sub_08152BFC

	thumb_func_start sub_08152C94
sub_08152C94: @ 0x08152C94
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r6, _08152CE8
	lsrs r0, r0, #0x10
	ldrh r1, [r6]
	adds r0, r0, r1
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r5, _08152CEC
	ldr r1, [r5]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08152CF0
	ldr r1, _08152CF4
	ldr r3, [r0]
	adds r0, r4, #0
	movs r2, #0x25
	bl _call_via_r3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08152CF8
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	bl SetDamagedSectorBits
	movs r0, #1
	b _08152D10
	.align 2, 0
_08152CE8: .4byte 0x03005F30
_08152CEC: .4byte 0x03005F40
_08152CF0: .4byte 0x030075F4
_08152CF4: .4byte 0x00000FF8
_08152CF8:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl SetDamagedSectorBits
	ldr r0, _08152D18
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _08152D1C
	ldr r0, [r0]
	str r0, [r5]
	movs r0, #0xff
_08152D10:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08152D18: .4byte 0x03005F38
_08152D1C: .4byte 0x03005F34
	thumb_func_end sub_08152C94

	thumb_func_start sub_08152D20
sub_08152D20: @ 0x08152D20
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _08152D38
	ldr r0, _08152D3C
	str r0, [r1]
	ldr r0, _08152D40
	cmp r4, r0
	beq _08152D44
	movs r5, #0xff
	b _08152D56
	.align 2, 0
_08152D38: .4byte 0x03005F44
_08152D3C: .4byte 0x0203A888
_08152D40: .4byte 0x0000FFFF
_08152D44:
	adds r0, r6, #0
	bl GetSaveValidStatus
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08152D60
_08152D56:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08152D20

	thumb_func_start sub_08152D60
sub_08152D60: @ 0x08152D60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	ldr r0, _08152DFC
	ldr r1, [r0]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #0x11
	lsrs r7, r0, #0x10
	movs r5, #0
	ldr r6, _08152E00
_08152D7C:
	adds r0, r5, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6]
	bl DoReadFlashWholeSection
	ldr r0, [r6]
	ldr r1, _08152E04
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	bne _08152D98
	ldr r0, _08152E08
	strh r5, [r0]
_08152D98:
	ldr r0, [r6]
	lsls r1, r1, #3
	mov r2, r8
	adds r4, r1, r2
	ldrh r1, [r4, #4]
	bl CalculateChecksum
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, [r6]
	ldr r1, _08152E0C
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08152E10
	adds r5, #1
	cmp r1, r0
	bne _08152DE8
	ldr r1, _08152E14
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _08152DE8
	movs r2, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bhs _08152DE8
	adds r3, r4, #0
	ldr r4, _08152E00
_08152DD0:
	ldr r1, [r3]
	adds r1, r1, r2
	ldr r0, [r4]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r3, #4]
	cmp r2, r1
	blo _08152DD0
_08152DE8:
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xd
	bls _08152D7C
	movs r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08152DFC: .4byte 0x03005F40
_08152E00: .4byte 0x03005F44
_08152E04: .4byte 0x00000FF4
_08152E08: .4byte 0x03005F30
_08152E0C: .4byte 0x00000FF8
_08152E10: .4byte 0x08012025
_08152E14: .4byte 0x00000FF6
	thumb_func_end sub_08152D60

	thumb_func_start GetSaveValidStatus
GetSaveValidStatus: @ 0x08152E18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0
	mov r8, r0
	mov sb, r0
	movs r6, #0
	movs r5, #0
	movs r4, #0
	ldr r7, _08152EA4
_08152E34:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r7]
	bl DoReadFlashWholeSection
	ldr r2, [r7]
	ldr r1, _08152EA8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08152EAC
	cmp r1, r0
	bne _08152E84
	movs r5, #1
	ldr r3, _08152EB0
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, r0, #3
	add r0, sl
	ldrh r1, [r0, #4]
	adds r0, r2, #0
	bl CalculateChecksum
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, [r7]
	ldr r3, _08152EB4
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08152E84
	ldr r2, _08152EB8
	adds r0, r1, r2
	ldr r0, [r0]
	mov r8, r0
	subs r3, #2
	adds r1, r1, r3
	adds r0, r5, #0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_08152E84:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xd
	bls _08152E34
	cmp r5, #0
	beq _08152EC0
	ldr r0, _08152EBC
	movs r1, #0xff
	str r1, [sp]
	cmp r6, r0
	bne _08152EC4
	movs r2, #1
	str r2, [sp]
	b _08152EC4
	.align 2, 0
_08152EA4: .4byte 0x03005F44
_08152EA8: .4byte 0x00000FF8
_08152EAC: .4byte 0x08012025
_08152EB0: .4byte 0x00000FF4
_08152EB4: .4byte 0x00000FF6
_08152EB8: .4byte 0x00000FFC
_08152EBC: .4byte 0x00003FFF
_08152EC0:
	movs r3, #0
	str r3, [sp]
_08152EC4:
	movs r6, #0
	movs r5, #0
	movs r4, #0
	ldr r7, _08152F3C
_08152ECC:
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r7]
	bl DoReadFlashWholeSection
	ldr r2, [r7]
	ldr r1, _08152F40
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08152F44
	cmp r1, r0
	bne _08152F20
	movs r5, #1
	ldr r3, _08152F48
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, r0, #3
	add r0, sl
	ldrh r1, [r0, #4]
	adds r0, r2, #0
	bl CalculateChecksum
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, [r7]
	ldr r3, _08152F4C
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08152F20
	ldr r2, _08152F50
	adds r0, r1, r2
	ldr r0, [r0]
	mov sb, r0
	subs r3, #2
	adds r1, r1, r3
	adds r0, r5, #0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_08152F20:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xd
	bls _08152ECC
	cmp r5, #0
	beq _08152F58
	ldr r0, _08152F54
	movs r1, #0xff
	cmp r6, r0
	bne _08152F5A
	movs r1, #1
	b _08152F5A
	.align 2, 0
_08152F3C: .4byte 0x03005F44
_08152F40: .4byte 0x00000FF8
_08152F44: .4byte 0x08012025
_08152F48: .4byte 0x00000FF4
_08152F4C: .4byte 0x00000FF6
_08152F50: .4byte 0x00000FFC
_08152F54: .4byte 0x00003FFF
_08152F58:
	movs r1, #0
_08152F5A:
	ldr r0, [sp]
	cmp r0, #1
	bne _08152FCC
	cmp r1, #1
	bne _08152FBC
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _08152F72
	mov r1, sb
	cmp r1, #0
	beq _08152F7C
_08152F72:
	mov r2, r8
	cmp r2, #0
	bne _08152FA0
	cmp sb, r0
	bne _08152FA0
_08152F7C:
	mov r1, r8
	adds r1, #1
	mov r0, sb
	adds r0, #1
	cmp r1, r0
	bhs _08152F94
	ldr r0, _08152F90
	mov r3, sb
	b _08152FB4
	.align 2, 0
_08152F90: .4byte 0x03005F40
_08152F94:
	ldr r0, _08152F9C
	mov r1, r8
	str r1, [r0]
	b _08152FE4
	.align 2, 0
_08152F9C: .4byte 0x03005F40
_08152FA0:
	cmp r8, sb
	bhs _08152FB0
	ldr r0, _08152FAC
	mov r2, sb
	str r2, [r0]
	b _08152FE4
	.align 2, 0
_08152FAC: .4byte 0x03005F40
_08152FB0:
	ldr r0, _08152FB8
	mov r3, r8
_08152FB4:
	str r3, [r0]
	b _08152FE4
	.align 2, 0
_08152FB8: .4byte 0x03005F40
_08152FBC:
	ldr r0, _08152FC8
	mov r2, r8
	str r2, [r0]
	cmp r1, #0xff
	beq _08152FDC
	b _08152FE4
	.align 2, 0
_08152FC8: .4byte 0x03005F40
_08152FCC:
	cmp r1, #1
	bne _08152FE8
	ldr r0, _08152FE0
	mov r3, sb
	str r3, [r0]
	ldr r0, [sp]
	cmp r0, #0xff
	bne _08152FE4
_08152FDC:
	movs r0, #0xff
	b _08153014
	.align 2, 0
_08152FE0: .4byte 0x03005F40
_08152FE4:
	movs r0, #1
	b _08153014
_08152FE8:
	ldr r2, [sp]
	cmp r2, #0
	bne _08153008
	cmp r1, #0
	bne _08153008
	ldr r0, _08153000
	str r1, [r0]
	ldr r0, _08153004
	strh r1, [r0]
	movs r0, #0
	b _08153014
	.align 2, 0
_08153000: .4byte 0x03005F40
_08153004: .4byte 0x03005F30
_08153008:
	ldr r0, _08153024
	movs r1, #0
	str r1, [r0]
	ldr r0, _08153028
	strh r1, [r0]
	movs r0, #2
_08153014:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08153024: .4byte 0x03005F40
_08153028: .4byte 0x03005F30
	thumb_func_end GetSaveValidStatus

	thumb_func_start sub_0815302C
sub_0815302C: @ 0x0815302C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldr r5, _08153080
	adds r1, r5, #0
	bl DoReadFlashWholeSection
	ldr r1, _08153084
	adds r0, r5, r1
	ldr r1, [r0]
	ldr r0, _08153088
	cmp r1, r0
	bne _08153094
	adds r0, r5, #0
	adds r1, r4, #0
	bl CalculateChecksum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0815308C
	adds r1, r5, r2
	ldrh r1, [r1]
	cmp r1, r0
	bne _08153090
	movs r2, #0
	cmp r2, r4
	bhs _0815307A
_08153068:
	adds r1, r6, r2
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r4
	blo _08153068
_0815307A:
	movs r0, #1
	b _08153096
	.align 2, 0
_08153080: .4byte 0x0203A888
_08153084: .4byte 0x00000FF8
_08153088: .4byte 0x08012025
_0815308C: .4byte 0x00000FF4
_08153090:
	movs r0, #2
	b _08153096
_08153094:
	movs r0, #0
_08153096:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0815302C

	thumb_func_start DoReadFlashWholeSection
DoReadFlashWholeSection: @ 0x0815309C
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0x80
	lsls r3, r3, #5
	movs r1, #0
	bl ReadFlash
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end DoReadFlashWholeSection

	thumb_func_start CalculateChecksum
CalculateChecksum: @ 0x081530B4
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	movs r2, #0
	movs r3, #0
	lsrs r1, r1, #0x12
	cmp r2, r1
	bhs _081530D2
_081530C4:
	ldm r4!, {r0}
	adds r2, r2, r0
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	blo _081530C4
_081530D2:
	lsrs r0, r2, #0x10
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CalculateChecksum

	thumb_func_start UpdateSaveAddresses
UpdateSaveAddresses: @ 0x081530E0
	push {r4, r5, lr}
	ldr r3, _08153140
	ldr r0, _08153144
	ldr r2, _08153148
	ldrh r1, [r2]
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r3]
	ldrh r0, [r2, #2]
	strh r0, [r3, #4]
	ldr r5, _0815314C
	adds r3, #8
	adds r2, #4
	movs r4, #3
_081530FC:
	ldrh r0, [r2]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r3]
	ldrh r0, [r2, #2]
	strh r0, [r3, #4]
	adds r3, #8
	adds r2, #4
	subs r4, #1
	cmp r4, #0
	bge _081530FC
	movs r4, #5
	ldr r1, _08153140
	ldr r5, _08153150
	ldr r0, _08153148
	adds r3, r1, #0
	adds r3, #0x28
	adds r2, r0, #0
	adds r2, #0x14
_08153122:
	ldrh r0, [r2]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r3]
	ldrh r0, [r2, #2]
	strh r0, [r3, #4]
	adds r3, #8
	adds r2, #4
	adds r4, #1
	cmp r4, #0xd
	ble _08153122
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08153140: .4byte 0x03005F60
_08153144: .4byte 0x03005AF0
_08153148: .4byte 0x085ACA08
_0815314C: .4byte 0x03005AEC
_08153150: .4byte 0x03005AF4
	thumb_func_end UpdateSaveAddresses

	thumb_func_start HandleSavingData
HandleSavingData: @ 0x08153154
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08153174
	ldr r6, [r1]
	movs r0, #0
	str r0, [r1]
	bl UpdateSaveAddresses
	cmp r4, #5
	bhi _081531FC
	lsls r0, r4, #2
	ldr r1, _08153178
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08153174: .4byte 0x0203CC28
_08153178: .4byte 0x0815317C
_0815317C: @ jump table
	.4byte _081531FC @ case 0
	.4byte _08153214 @ case 1
	.4byte _08153214 @ case 2
	.4byte _081531AA @ case 3
	.4byte _08153234 @ case 4
	.4byte _08153194 @ case 5
_08153194:
	movs r4, #0x1c
	ldr r5, _081531E8
_08153198:
	ldr r1, [r5]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _08153198
_081531AA:
	movs r0, #0xa
	bl GetGameStat
	ldr r1, _081531EC
	cmp r0, r1
	bhi _081531BC
	movs r0, #0xa
	bl IncrementGameStat
_081531BC:
	bl SaveSerializedGame
	ldr r0, _081531F0
	ldr r1, _081531F4
	bl save_write_to_flash
	ldr r4, _081531F8
	movs r5, #0xf8
	lsls r5, r5, #4
	movs r0, #0x1c
	adds r1, r4, #0
	adds r2, r5, #0
	bl HandleWriteSectorNBytes
	adds r4, r4, r5
	movs r0, #0x1d
	adds r1, r4, #0
	adds r2, r5, #0
	bl HandleWriteSectorNBytes
	b _08153256
	.align 2, 0
_081531E8: .4byte 0x03007600
_081531EC: .4byte 0x000003E6
_081531F0: .4byte 0x0000FFFF
_081531F4: .4byte 0x03005F60
_081531F8: .4byte 0x0201C000
_081531FC:
	bl SaveSerializedGame
	ldr r0, _0815320C
	ldr r1, _08153210
	bl save_write_to_flash
	b _08153256
	.align 2, 0
_0815320C: .4byte 0x0000FFFF
_08153210: .4byte 0x03005F60
_08153214:
	bl SaveSerializedGame
	movs r4, #0
_0815321A:
	adds r0, r4, #0
	ldr r1, _08153230
	bl save_write_to_flash
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0815321A
	b _08153256
	.align 2, 0
_08153230: .4byte 0x03005F60
_08153234:
	movs r4, #0x1c
	ldr r5, _08153264
_08153238:
	ldr r1, [r5]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _08153238
	bl SaveSerializedGame
	ldr r0, _08153268
	ldr r1, _0815326C
	bl save_write_to_flash
_08153256:
	ldr r0, _08153270
	str r6, [r0]
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08153264: .4byte 0x03007600
_08153268: .4byte 0x0000FFFF
_0815326C: .4byte 0x03005F60
_08153270: .4byte 0x0203CC28
	thumb_func_end HandleSavingData

	thumb_func_start TrySavingData
TrySavingData: @ 0x08153274
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _081532A0
	ldr r4, [r0]
	cmp r4, #1
	bne _08153296
	adds r0, r5, #0
	bl HandleSavingData
	ldr r0, _081532A4
	ldr r0, [r0]
	cmp r0, #0
	beq _081532AC
	adds r0, r5, #0
	bl DoSaveFailedScreen
_08153296:
	ldr r1, _081532A8
	movs r0, #0xff
	strh r0, [r1]
	movs r0, #0xff
	b _081532B2
	.align 2, 0
_081532A0: .4byte 0x03005AE8
_081532A4: .4byte 0x03005F3C
_081532A8: .4byte 0x03005FD4
_081532AC:
	ldr r0, _081532B8
	strh r4, [r0]
	movs r0, #1
_081532B2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081532B8: .4byte 0x03005FD4
	thumb_func_end TrySavingData

	thumb_func_start sub_081532BC
sub_081532BC: @ 0x081532BC
	push {lr}
	ldr r0, _081532D8
	ldr r0, [r0]
	cmp r0, #1
	bne _081532E0
	bl UpdateSaveAddresses
	bl SaveSerializedGame
	ldr r0, _081532DC
	bl RestoreSaveBackupVarsAndIncrement
	movs r0, #0
	b _081532E2
	.align 2, 0
_081532D8: .4byte 0x03005AE8
_081532DC: .4byte 0x03005F60
_081532E0:
	movs r0, #1
_081532E2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081532BC

	thumb_func_start sub_081532E8
sub_081532E8: @ 0x081532E8
	push {r4, lr}
	ldr r1, _0815330C
	movs r0, #0xe
	bl sub_081529B0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08153310
	ldr r0, [r0]
	cmp r0, #0
	beq _08153304
	movs r0, #0
	bl DoSaveFailedScreen
_08153304:
	cmp r4, #0xff
	beq _08153314
	movs r0, #0
	b _08153316
	.align 2, 0
_0815330C: .4byte 0x03005F60
_08153310: .4byte 0x03005F3C
_08153314:
	movs r0, #1
_08153316:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_081532E8

	thumb_func_start sub_0815331C
sub_0815331C: @ 0x0815331C
	push {lr}
	ldr r1, _0815333C
	movs r0, #0xe
	bl sub_08152A10
	ldr r0, _08153340
	ldr r0, [r0]
	cmp r0, #0
	beq _08153334
	movs r0, #0
	bl DoSaveFailedScreen
_08153334:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0815333C: .4byte 0x03005F60
_08153340: .4byte 0x03005F3C
	thumb_func_end sub_0815331C

	thumb_func_start sub_08153344
sub_08153344: @ 0x08153344
	push {lr}
	ldr r1, _08153364
	movs r0, #0xe
	bl sub_08152BFC
	ldr r0, _08153368
	ldr r0, [r0]
	cmp r0, #0
	beq _0815335C
	movs r0, #0
	bl DoSaveFailedScreen
_0815335C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08153364: .4byte 0x03005F60
_08153368: .4byte 0x03005F3C
	thumb_func_end sub_08153344

	thumb_func_start FullSaveGame
FullSaveGame: @ 0x0815336C
	push {r4, lr}
	ldr r0, _0815339C
	ldr r0, [r0]
	cmp r0, #1
	bne _081533A8
	bl UpdateSaveAddresses
	bl SaveSerializedGame
	ldr r4, _081533A0
	adds r0, r4, #0
	bl RestoreSaveBackupVars
	ldr r0, _081533A4
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_08152A10
	movs r0, #0
	b _081533AA
	.align 2, 0
_0815339C: .4byte 0x03005AE8
_081533A0: .4byte 0x03005F60
_081533A4: .4byte 0x03005F48
_081533A8:
	movs r0, #1
_081533AA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FullSaveGame

	thumb_func_start CheckSaveFile
CheckSaveFile: @ 0x081533B0
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r0, _081533DC
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bhi _081533E4
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _081533E0
	adds r1, r4, #0
	bl sub_08152A10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08152C94
	b _081533EE
	.align 2, 0
_081533DC: .4byte 0x03005F48
_081533E0: .4byte 0x03005F60
_081533E4:
	ldr r1, _08153404
	adds r0, r5, #0
	bl sub_08152C94
	movs r6, #1
_081533EE:
	ldr r0, _08153408
	ldr r0, [r0]
	cmp r0, #0
	beq _081533FC
	movs r0, #1
	bl DoSaveFailedScreen
_081533FC:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08153404: .4byte 0x03005F60
_08153408: .4byte 0x03005F3C
	thumb_func_end CheckSaveFile

	thumb_func_start Save_LoadGameData
Save_LoadGameData: @ 0x0815340C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08153424
	ldr r0, [r0]
	cmp r0, #1
	beq _0815342C
	ldr r1, _08153428
	movs r0, #4
	strh r0, [r1]
	movs r0, #0xff
	b _0815348C
	.align 2, 0
_08153424: .4byte 0x03005AE8
_08153428: .4byte 0x03005F50
_0815342C:
	bl UpdateSaveAddresses
	cmp r4, #0
	beq _08153438
	cmp r4, #3
	beq _08153464
_08153438:
	ldr r0, _08153454
	ldr r1, _08153458
	bl sub_08152D20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl LoadSerializedGame
	ldr r0, _0815345C
	strh r4, [r0]
	ldr r1, _08153460
	movs r0, #0
	str r0, [r1]
	b _0815348A
	.align 2, 0
_08153454: .4byte 0x0000FFFF
_08153458: .4byte 0x03005F60
_0815345C: .4byte 0x03005F50
_08153460: .4byte 0x03005F54
_08153464:
	ldr r5, _08153494
	movs r6, #0xf8
	lsls r6, r6, #4
	movs r0, #0x1c
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0815302C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _0815348A
	adds r1, r5, r6
	movs r0, #0x1d
	adds r2, r6, #0
	bl sub_0815302C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0815348A:
	adds r0, r4, #0
_0815348C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08153494: .4byte 0x0201C000
	thumb_func_end Save_LoadGameData

	thumb_func_start sub_08153498
sub_08153498: @ 0x08153498
	push {r4, r5, r6, r7, lr}
	ldr r5, _081534AC
	ldr r0, _081534B0
	str r0, [r5]
	adds r7, r0, #0
	ldr r0, _081534B4
	ldr r4, [r0]
	cmp r4, #1
	beq _081534C8
	b _08153504
	.align 2, 0
_081534AC: .4byte 0x03005F44
_081534B0: .4byte 0x0203A888
_081534B4: .4byte 0x03005AE8
_081534B8:
	ldrb r1, [r7, #0xa]
	ldrb r0, [r7, #0xb]
	adds r1, r1, r0
	ldrb r0, [r7, #0xc]
	adds r1, r1, r0
	ldrb r0, [r7, #0xd]
	adds r0, r0, r1
	b _08153506
_081534C8:
	bl UpdateSaveAddresses
	ldr r0, _0815350C
	bl GetSaveValidStatus
	ldr r0, _08153510
	ldr r1, [r0]
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #0x11
	lsrs r6, r0, #0x10
	movs r4, #0
_081534E2:
	adds r0, r4, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r5]
	bl DoReadFlashWholeSection
	ldr r0, [r5]
	ldr r1, _08153514
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _081534B8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xd
	bls _081534E2
_08153504:
	movs r0, #0
_08153506:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0815350C: .4byte 0x03005F60
_08153510: .4byte 0x03005F40
_08153514: .4byte 0x00000FF4
	thumb_func_end sub_08153498

	thumb_func_start TryReadSpecialSaveSection
TryReadSpecialSaveSection: @ 0x08153518
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0xe2
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08153544
	ldr r4, _08153548
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r1, #0
	movs r1, #0
	adds r2, r4, #0
	bl ReadFlash
	ldr r1, [r4]
	ldr r0, _0815354C
	cmp r1, r0
	beq _08153550
_08153544:
	movs r0, #0xff
	b _08153566
	.align 2, 0
_08153548: .4byte 0x0203A888
_0815354C: .4byte 0x0000B39D
_08153550:
	movs r3, #0
	ldr r5, _0815356C
	adds r2, r4, #4
_08153556:
	adds r0, r6, r3
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, r5
	ble _08153556
	movs r0, #1
_08153566:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0815356C: .4byte 0x00000FFB
	thumb_func_end TryReadSpecialSaveSection

	thumb_func_start TryWriteSpecialSaveSection
TryWriteSpecialSaveSection: @ 0x08153570
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r1, #0xe2
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _081535BC
	ldr r7, _081535B0
	ldr r0, _081535B4
	adds r3, r7, #0
	stm r3!, {r0}
	movs r2, #0
	ldr r4, _081535B8
_08153590:
	adds r0, r3, r2
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r4
	ble _08153590
	adds r0, r6, #0
	adds r1, r7, #0
	bl ProgramFlashSectorAndVerify
	cmp r0, #0
	bne _081535BC
	movs r0, #1
	b _081535BE
	.align 2, 0
_081535B0: .4byte 0x0203A888
_081535B4: .4byte 0x0000B39D
_081535B8: .4byte 0x00000FFB
_081535BC:
	movs r0, #0xff
_081535BE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TryWriteSpecialSaveSection

	thumb_func_start sub_081535C4
sub_081535C4: @ 0x081535C4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _081535E8
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xb
	bls _081535DE
	b _081536FE
_081535DE:
	lsls r0, r0, #2
	ldr r1, _081535EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081535E8: .4byte 0x03005B68
_081535EC: .4byte 0x081535F0
_081535F0: @ jump table
	.4byte _08153620 @ case 0
	.4byte _08153630 @ case 1
	.4byte _0815363A @ case 2
	.4byte _08153656 @ case 3
	.4byte _08153668 @ case 4
	.4byte _0815367E @ case 5
	.4byte _08153694 @ case 6
	.4byte _0815369E @ case 7
	.4byte _081536B4 @ case 8
	.4byte _081536C8 @ case 9
	.4byte _081536D2 @ case 10
	.4byte _081536E4 @ case 11
_08153620:
	ldr r0, _0815362C
	movs r1, #1
	strb r1, [r0]
	movs r0, #1
	strh r0, [r4]
	b _081536FE
	.align 2, 0
_0815362C: .4byte 0x030027A0
_08153630:
	bl sub_0800A8D4
	movs r0, #2
	strh r0, [r4]
	b _081536FE
_0815363A:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081536FE
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08153650
	bl save_serialize_map
_08153650:
	movs r0, #3
	strh r0, [r4]
	b _081536FE
_08153656:
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08153662
	bl SetContinueGameWarpStatusToDynamicWarp
_08153662:
	bl sub_081532BC
	b _0815368E
_08153668:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #5
	bne _081536FE
	movs r0, #0
	strh r0, [r4, #2]
	strh r1, [r4]
	b _081536FE
_0815367E:
	bl sub_081532E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0815368E
	movs r0, #6
	strh r0, [r4]
	b _081536FE
_0815368E:
	movs r0, #4
	strh r0, [r4]
	b _081536FE
_08153694:
	bl sub_0815331C
	movs r0, #7
	strh r0, [r4]
	b _081536FE
_0815369E:
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _081536AA
	bl ClearContinueGameWarpStatus
_081536AA:
	bl sub_0800A8D4
	movs r0, #8
	strh r0, [r4]
	b _081536FE
_081536B4:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081536FE
	bl sub_08153344
	movs r0, #9
	strh r0, [r4]
	b _081536FE
_081536C8:
	bl sub_0800A8D4
	movs r0, #0xa
	strh r0, [r4]
	b _081536FE
_081536D2:
	bl IsLinkTaskFinished
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081536FE
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _081536FE
_081536E4:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _081536FE
	ldr r1, _08153704
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	bl DestroyTask
_081536FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08153704: .4byte 0x030027A0
	thumb_func_end sub_081535C4

