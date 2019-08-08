.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CheckCompatibility
CheckCompatibility: @ 0x08153708
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _08153738
	ands r1, r3
	cmp r1, #0
	beq _08153738
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq _08153738
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	cmp r0, #0
	beq _08153738
	movs r0, #1
	b _0815373A
_08153738:
	movs r0, #0
_0815373A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckCompatibility

	thumb_func_start SetIncompatible
SetIncompatible: @ 0x08153740
	push {lr}
	ldr r0, _08153754
	ldr r1, _08153758
	bl StringExpandPlaceholders
	movs r0, #3
	bl SetMysteryEventScriptStatus
	pop {r0}
	bx r0
	.align 2, 0
_08153754: .4byte 0x02021C7C
_08153758: .4byte 0x085FCBDE
	thumb_func_end SetIncompatible

	thumb_func_start InitMysteryEventScript
InitMysteryEventScript: @ 0x0815375C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08153784
	ldr r2, _08153788
	bl InitScriptContext
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetupBytecodeScript
	str r5, [r4, #0x64]
	movs r0, #0
	str r0, [r4, #0x68]
	str r0, [r4, #0x6c]
	str r0, [r4, #0x70]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08153784: .4byte 0x0828D2B4
_08153788: .4byte 0x0828D2F8
	thumb_func_end InitMysteryEventScript

	thumb_func_start RunMysteryEventScriptCommand
RunMysteryEventScriptCommand: @ 0x0815378C
	push {r4, lr}
	adds r4, r0, #0
	bl RunScriptCommand
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081537A4
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _081537A4
	movs r0, #1
	b _081537A6
_081537A4:
	movs r0, #0
_081537A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end RunMysteryEventScriptCommand

	thumb_func_start sub_081537AC
sub_081537AC: @ 0x081537AC
	push {lr}
	adds r1, r0, #0
	ldr r0, _081537BC
	bl InitMysteryEventScript
	pop {r0}
	bx r0
	.align 2, 0
_081537BC: .4byte 0x0203B88C
	thumb_func_end sub_081537AC

	thumb_func_start sub_081537C0
sub_081537C0: @ 0x081537C0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _081537D8
	adds r0, r4, #0
	bl RunMysteryEventScriptCommand
	ldr r1, [r4, #0x6c]
	str r1, [r5]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081537D8: .4byte 0x0203B88C
	thumb_func_end sub_081537C0

	thumb_func_start RunMysteryEventScript
RunMysteryEventScript: @ 0x081537DC
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _081537FC
	adds r0, r4, #0
	bl InitMysteryEventScript
_081537E8:
	adds r0, r4, #0
	bl RunMysteryEventScriptCommand
	cmp r0, #0
	bne _081537E8
	ldr r0, [r4, #0x6c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081537FC: .4byte 0x0203B88C
	thumb_func_end RunMysteryEventScript

	thumb_func_start SetMysteryEventScriptStatus
SetMysteryEventScriptStatus: @ 0x08153800
	ldr r1, _08153808
	str r0, [r1, #0x6c]
	bx lr
	.align 2, 0
_08153808: .4byte 0x0203B88C
	thumb_func_end SetMysteryEventScriptStatus

	thumb_func_start CalcRecordMixingGiftChecksum
CalcRecordMixingGiftChecksum: @ 0x0815380C
	push {lr}
	movs r2, #0
	ldr r0, _0815382C
	ldr r0, [r0]
	ldr r1, _08153830
	adds r3, r0, r1
	movs r1, #0
_0815381A:
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r1, #1
	cmp r1, #0xb
	bls _0815381A
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0815382C: .4byte 0x03005AEC
_08153830: .4byte 0x00003B18
	thumb_func_end CalcRecordMixingGiftChecksum

	thumb_func_start IsRecordMixingGiftValid
IsRecordMixingGiftValid: @ 0x08153834
	push {r4, r5, lr}
	ldr r5, _0815386C
	ldr r0, [r5]
	ldr r1, _08153870
	adds r4, r0, r1
	bl CalcRecordMixingGiftChecksum
	adds r1, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08153866
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _08153866
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _08153866
	cmp r1, #0
	beq _08153866
	ldr r0, [r5]
	ldr r2, _08153874
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r1, r0
	beq _08153878
_08153866:
	movs r0, #0
	b _0815387A
	.align 2, 0
_0815386C: .4byte 0x03005AEC
_08153870: .4byte 0x00003B18
_08153874: .4byte 0x00003B14
_08153878:
	movs r0, #1
_0815387A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsRecordMixingGiftValid

	thumb_func_start ClearRecordMixingGift
ClearRecordMixingGift: @ 0x08153880
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r0, _081538A0
	ldr r1, [r0]
	ldr r0, _081538A4
	adds r1, r1, r0
	ldr r2, _081538A8
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_081538A0: .4byte 0x03005AEC
_081538A4: .4byte 0x00003B14
_081538A8: .4byte 0x01000008
	thumb_func_end ClearRecordMixingGift

	thumb_func_start SetRecordMixingGift
SetRecordMixingGift: @ 0x081538AC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r6, r2, #0
	cmp r3, #0
	beq _081538CC
	cmp r1, #0
	beq _081538CC
	cmp r2, #0
	bne _081538D2
_081538CC:
	bl ClearRecordMixingGift
	b _081538F8
_081538D2:
	ldr r4, _08153900
	ldr r0, [r4]
	ldr r1, _08153904
	adds r0, r0, r1
	strb r3, [r0]
	ldr r0, [r4]
	ldr r2, _08153908
	adds r0, r0, r2
	strb r5, [r0]
	ldr r0, [r4]
	adds r1, #2
	adds r0, r0, r1
	strh r6, [r0]
	bl CalcRecordMixingGiftChecksum
	ldr r1, [r4]
	ldr r2, _0815390C
	adds r1, r1, r2
	str r0, [r1]
_081538F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08153900: .4byte 0x03005AEC
_08153904: .4byte 0x00003B18
_08153908: .4byte 0x00003B19
_0815390C: .4byte 0x00003B14
	thumb_func_end SetRecordMixingGift

	thumb_func_start GetRecordMixingGift
GetRecordMixingGift: @ 0x08153910
	push {r4, r5, r6, lr}
	ldr r6, _0815392C
	ldr r0, [r6]
	ldr r1, _08153930
	adds r4, r0, r1
	bl IsRecordMixingGiftValid
	cmp r0, #0
	bne _08153934
	bl ClearRecordMixingGift
	movs r0, #0
	b _08153956
	.align 2, 0
_0815392C: .4byte 0x03005AEC
_08153930: .4byte 0x00003B18
_08153934:
	ldrh r5, [r4, #2]
	ldrb r0, [r4, #1]
	subs r0, #1
	strb r0, [r4, #1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08153948
	bl ClearRecordMixingGift
	b _08153954
_08153948:
	bl CalcRecordMixingGiftChecksum
	ldr r1, [r6]
	ldr r2, _0815395C
	adds r1, r1, r2
	str r0, [r1]
_08153954:
	adds r0, r5, #0
_08153956:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0815395C: .4byte 0x00003B14
	thumb_func_end GetRecordMixingGift

	thumb_func_start MEScrCmd_end
MEScrCmd_end: @ 0x08153960
	push {lr}
	bl StopScript
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_end

	thumb_func_start MEScrCmd_checkcompat
MEScrCmd_checkcompat: @ 0x0815396C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl ScriptReadWord
	str r0, [r7, #0x68]
	adds r0, r7, #0
	bl ScriptReadHalfword
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r7, #0
	bl ScriptReadWord
	adds r6, r0, #0
	adds r0, r7, #0
	bl ScriptReadHalfword
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r7, #0
	bl ScriptReadWord
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl CheckCompatibility
	cmp r0, #1
	bne _081539B0
	str r0, [r7, #0x70]
	b _081539B4
_081539B0:
	bl SetIncompatible
_081539B4:
	movs r0, #1
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_checkcompat

	thumb_func_start MEScrCmd_nop
MEScrCmd_nop: @ 0x081539BC
	movs r0, #0
	bx lr
	thumb_func_end MEScrCmd_nop

	thumb_func_start MEScrCmd_setstatus
MEScrCmd_setstatus: @ 0x081539C0
	ldr r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	str r2, [r0, #0x6c]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end MEScrCmd_setstatus

	thumb_func_start MEScrCmd_setmsg
MEScrCmd_setmsg: @ 0x081539D0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	ldrb r5, [r0]
	adds r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadWord
	ldr r1, [r4, #0x68]
	subs r0, r0, r1
	ldr r1, [r4, #0x64]
	adds r1, r0, r1
	cmp r5, #0xff
	beq _081539F4
	ldr r0, [r4, #0x6c]
	cmp r5, r0
	bne _081539FA
_081539F4:
	ldr r0, _08153A04
	bl StringExpandPlaceholders
_081539FA:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08153A04: .4byte 0x02021C7C
	thumb_func_end MEScrCmd_setmsg

	thumb_func_start MEScrCmd_runscript
MEScrCmd_runscript: @ 0x08153A08
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	ldr r1, [r4, #0x68]
	subs r0, r0, r1
	ldr r1, [r4, #0x64]
	adds r0, r0, r1
	bl ScriptContext2_RunNewScript
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MEScrCmd_runscript

	thumb_func_start MEScrCmd_setenigmaberry
MEScrCmd_setenigmaberry: @ 0x08153A24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	bl IsEnigmaBerryValid
	mov r8, r0
	adds r0, r7, #0
	bl ScriptReadWord
	adds r4, r0, #0
	ldr r0, [r7, #0x68]
	subs r4, r4, r0
	ldr r0, [r7, #0x64]
	adds r4, r4, r0
	ldr r0, _08153A78
	mov sb, r0
	ldr r6, _08153A7C
	ldr r1, [r6]
	ldr r5, _08153A80
	adds r1, r1, r5
	movs r2, #7
	bl StringCopyN
	adds r0, r4, #0
	bl SetEnigmaBerry
	ldr r4, _08153A84
	ldr r1, [r6]
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #7
	bl StringCopyN
	mov r0, r8
	cmp r0, #0
	bne _08153A90
	ldr r0, _08153A88
	ldr r1, _08153A8C
	b _08153AB0
	.align 2, 0
_08153A78: .4byte 0x02021C40
_08153A7C: .4byte 0x03005AEC
_08153A80: .4byte 0x000031F8
_08153A84: .4byte 0x02021C54
_08153A88: .4byte 0x02021C7C
_08153A8C: .4byte 0x085FCAF8
_08153A90:
	mov r0, sb
	adds r1, r4, #0
	bl StringCompare
	cmp r0, #0
	beq _08153AAC
	ldr r0, _08153AA4
	ldr r1, _08153AA8
	b _08153AB0
	.align 2, 0
_08153AA4: .4byte 0x02021C7C
_08153AA8: .4byte 0x085FCB19
_08153AAC:
	ldr r0, _08153ACC
	ldr r1, _08153AD0
_08153AB0:
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [r7, #0x6c]
	bl IsEnigmaBerryValid
	cmp r0, #1
	bne _08153AD8
	ldr r0, _08153AD4
	movs r1, #1
	bl VarSet
	b _08153ADC
	.align 2, 0
_08153ACC: .4byte 0x02021C7C
_08153AD0: .4byte 0x085FCB2C
_08153AD4: .4byte 0x0000402D
_08153AD8:
	movs r0, #1
	str r0, [r7, #0x6c]
_08153ADC:
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MEScrCmd_setenigmaberry

	thumb_func_start MEScrCmd_giveribbon
MEScrCmd_giveribbon: @ 0x08153AEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #8]
	ldrb r0, [r2]
	adds r2, #1
	str r2, [r4, #8]
	ldrb r1, [r2]
	adds r2, #1
	str r2, [r4, #8]
	bl sub_080FA3A0
	ldr r0, _08153B18
	ldr r1, _08153B1C
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [r4, #0x6c]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08153B18: .4byte 0x02021C7C
_08153B1C: .4byte 0x085FCB3D
	thumb_func_end MEScrCmd_giveribbon

	thumb_func_start MEScrCmd_initramscript
MEScrCmd_initramscript: @ 0x08153B20
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r4, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r4, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadWord
	adds r5, r0, #0
	ldr r0, [r4, #0x68]
	subs r5, r5, r0
	ldr r0, [r4, #0x64]
	adds r5, r5, r0
	adds r0, r4, #0
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, [r4, #0x68]
	subs r1, r1, r0
	ldr r0, [r4, #0x64]
	adds r1, r1, r0
	subs r1, r1, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r6, [sp]
	adds r0, r5, #0
	mov r2, sb
	mov r3, r8
	bl InitRamScript
	movs r0, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MEScrCmd_initramscript

	thumb_func_start MEScrCmd_enableresetrtc
MEScrCmd_enableresetrtc: @ 0x08153B88
	push {r4, lr}
	adds r4, r0, #0
	bl EnableNationalPokedex
	ldr r0, _08153BA4
	ldr r1, _08153BA8
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [r4, #0x6c]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08153BA4: .4byte 0x02021C7C
_08153BA8: .4byte 0x085FCB59
	thumb_func_end MEScrCmd_enableresetrtc

	thumb_func_start MEScrCmd_addrareword
MEScrCmd_addrareword: @ 0x08153BAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	ldrb r0, [r1]
	adds r1, #1
	str r1, [r4, #8]
	bl sub_0811F4A0
	ldr r0, _08153BD0
	ldr r1, _08153BD4
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [r4, #0x6c]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08153BD0: .4byte 0x02021C7C
_08153BD4: .4byte 0x085FCB70
	thumb_func_end MEScrCmd_addrareword

	thumb_func_start MEScrCmd_setrecordmixinggift
MEScrCmd_setrecordmixinggift: @ 0x08153BD8
	push {r4, r5, lr}
	ldr r1, [r0, #8]
	ldrb r5, [r1]
	adds r1, #1
	str r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetRecordMixingGift
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MEScrCmd_setrecordmixinggift

	thumb_func_start MEScrCmd_givepokemon
MEScrCmd_givepokemon: @ 0x08153C04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x88
	adds r6, r0, #0
	bl ScriptReadWord
	ldr r1, [r6, #0x68]
	subs r0, r0, r1
	ldr r1, [r6, #0x64]
	adds r5, r0, r1
	movs r0, #0x64
	adds r0, r0, r5
	mov r8, r0
	add r4, sp, #0x24
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x64
	bl memcpy
	adds r0, r4, #0
	movs r1, #0x41
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	bne _08153C54
	ldr r0, _08153C4C
	ldr r1, _08153C50
	movs r2, #0xb
	bl StringCopyN
	b _08153C5E
	.align 2, 0
_08153C4C: .4byte 0x02021C40
_08153C50: .4byte 0x085C8C62
_08153C54:
	ldr r0, _08153C74
	ldr r1, _08153C78
	movs r2, #0xb
	bl StringCopyN
_08153C5E:
	ldr r0, _08153C7C
	ldrb r0, [r0]
	cmp r0, #6
	bne _08153C88
	ldr r0, _08153C80
	ldr r1, _08153C84
	bl StringExpandPlaceholders
	movs r0, #3
	b _08153CF2
	.align 2, 0
_08153C74: .4byte 0x02021C40
_08153C78: .4byte 0x085C8C66
_08153C7C: .4byte 0x0202418D
_08153C80: .4byte 0x02021C7C
_08153C84: .4byte 0x085FCB90
_08153C88:
	ldr r7, _08153D04
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x64
	bl memcpy
	mov r0, sp
	mov r1, r8
	movs r2, #0x24
	bl memcpy
	movs r0, #0xce
	lsls r0, r0, #1
	cmp r4, r0
	beq _08153CC2
	adds r0, r4, #0
	bl HoennToNationalOrder
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl GetSetPokedexFlag
	adds r0, r4, #0
	movs r1, #3
	bl GetSetPokedexFlag
_08153CC2:
	adds r0, r7, #0
	movs r1, #0xc
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ItemIsMail
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08153CE0
	adds r0, r7, #0
	mov r1, sp
	bl GiveMailToMon2
_08153CE0:
	bl CompactPartySlots
	bl CalculatePlayerPartyCount
	ldr r0, _08153D08
	ldr r1, _08153D0C
	bl StringExpandPlaceholders
	movs r0, #2
_08153CF2:
	str r0, [r6, #0x6c]
	movs r0, #0
	add sp, #0x88
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08153D04: .4byte 0x02024384
_08153D08: .4byte 0x02021C7C
_08153D0C: .4byte 0x085FCB83
	thumb_func_end MEScrCmd_givepokemon

	thumb_func_start MEScrCmd_addtrainer
MEScrCmd_addtrainer: @ 0x08153D10
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, [r4, #0x68]
	subs r1, r1, r0
	ldr r0, [r4, #0x64]
	adds r1, r1, r0
	ldr r0, _08153D48
	ldr r0, [r0]
	ldr r2, _08153D4C
	adds r0, r0, r2
	movs r2, #0xbc
	bl memcpy
	bl ValidateEReaderTrainer
	ldr r0, _08153D50
	ldr r1, _08153D54
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [r4, #0x6c]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08153D48: .4byte 0x03005AF0
_08153D4C: .4byte 0x00000BEC
_08153D50: .4byte 0x02021C7C
_08153D54: .4byte 0x085FCBAA
	thumb_func_end MEScrCmd_addtrainer

	thumb_func_start MEScrCmd_givenationaldex
MEScrCmd_givenationaldex: @ 0x08153D58
	push {r4, lr}
	adds r4, r0, #0
	bl EnableResetRTC
	ldr r0, _08153D74
	ldr r1, _08153D78
	bl StringExpandPlaceholders
	movs r0, #2
	str r0, [r4, #0x6c]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08153D74: .4byte 0x02021C7C
_08153D78: .4byte 0x085CBF86
	thumb_func_end MEScrCmd_givenationaldex

	thumb_func_start MEScrCmd_checksum
MEScrCmd_checksum: @ 0x08153D7C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ScriptReadWord
	adds r5, r0, #0
	adds r0, r6, #0
	bl ScriptReadWord
	adds r4, r0, #0
	ldr r0, [r6, #0x68]
	subs r4, r4, r0
	ldr r0, [r6, #0x64]
	adds r4, r4, r0
	adds r0, r6, #0
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, [r6, #0x68]
	subs r1, r1, r0
	ldr r0, [r6, #0x64]
	adds r1, r1, r0
	subs r1, r1, r4
	adds r0, r4, #0
	bl CalcByteArraySum
	cmp r5, r0
	beq _08153DBA
	movs r0, #0
	str r0, [r6, #0x70]
	movs r0, #1
	str r0, [r6, #0x6c]
_08153DBA:
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MEScrCmd_checksum

	thumb_func_start MEScrCmd_crc
MEScrCmd_crc: @ 0x08153DC4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ScriptReadWord
	adds r5, r0, #0
	adds r0, r6, #0
	bl ScriptReadWord
	adds r4, r0, #0
	ldr r0, [r6, #0x68]
	subs r4, r4, r0
	ldr r0, [r6, #0x64]
	adds r4, r4, r0
	adds r0, r6, #0
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, [r6, #0x68]
	subs r1, r1, r0
	ldr r0, [r6, #0x64]
	adds r1, r1, r0
	subs r1, r1, r4
	adds r0, r4, #0
	bl CalcCRC16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	beq _08153E06
	movs r0, #0
	str r0, [r6, #0x70]
	movs r0, #1
	str r0, [r6, #0x6c]
_08153E06:
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MEScrCmd_crc

