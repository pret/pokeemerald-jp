.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ScrCmd_nop
ScrCmd_nop: @ 0x08098C54
	movs r0, #0
	bx lr
	thumb_func_end ScrCmd_nop

	thumb_func_start ScrCmd_nop1
ScrCmd_nop1: @ 0x08098C58
	movs r0, #0
	bx lr
	thumb_func_end ScrCmd_nop1

	thumb_func_start ScrCmd_end
ScrCmd_end: @ 0x08098C5C
	push {lr}
	bl StopScript
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_end

	thumb_func_start ScrCmd_gotonative
ScrCmd_gotonative: @ 0x08098C68
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_gotonative

	thumb_func_start ScrCmd_special
ScrCmd_special: @ 0x08098C80
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	ldr r1, _08098C9C
	lsrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end ScrCmd_special

	thumb_func_start ScrCmd_showelevmenu
ScrCmd_showelevmenu: @ 0x08098C94
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08098C9C: .4byte 0x081DAF8C
	thumb_func_end ScrCmd_showelevmenu

	thumb_func_start ScrCmd_specialvar
ScrCmd_specialvar: @ 0x08098CA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r6, r0, #0
	ldr r4, _08098CD0
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	strh r0, [r6]
	thumb_func_end ScrCmd_specialvar

	thumb_func_start ScrCmd_cmdDA
ScrCmd_cmdDA: @ 0x08098CC8
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08098CD0: .4byte 0x081DAF8C
	thumb_func_end ScrCmd_cmdDA

	thumb_func_start ScrCmd_callnative
ScrCmd_callnative: @ 0x08098CD4
	push {lr}
	bl ScriptReadWord
	bl _call_via_r0
	movs r0, #0
	thumb_func_end ScrCmd_callnative

	thumb_func_start sub_08098CE0
sub_08098CE0: @ 0x08098CE0
	pop {r1}
	bx r1
	thumb_func_end sub_08098CE0

	thumb_func_start ScrCmd_waitstate
ScrCmd_waitstate: @ 0x08098CE4
	push {lr}
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_waitstate

	thumb_func_start ScrCmd_goto
ScrCmd_goto: @ 0x08098CF0
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r1, r0, #0
	adds r0, r4, #0
	bl ScriptJump
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_goto

	thumb_func_start ScrCmd_return
ScrCmd_return: @ 0x08098D08
	push {lr}
	bl ScriptReturn
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_return

	thumb_func_start ScrCmd_call
ScrCmd_call: @ 0x08098D14
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r1, r0, #0
	adds r0, r4, #0
	bl ScriptCall
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_call

	thumb_func_start ScrCmd_goto_if
ScrCmd_goto_if: @ 0x08098D2C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r4, [r0]
	adds r0, #1
	str r0, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadWord
	adds r2, r0, #0
	ldr r1, _08098D64
	lsls r0, r4, #1
	adds r0, r0, r4
	ldrb r3, [r5, #2]
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08098D5A
	adds r0, r5, #0
	adds r1, r2, #0
	bl ScriptJump
_08098D5A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08098D64: .4byte 0x084E8904
	thumb_func_end ScrCmd_goto_if

	thumb_func_start ScrCmd_call_if
ScrCmd_call_if: @ 0x08098D68
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r4, [r0]
	adds r0, #1
	str r0, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadWord
	adds r2, r0, #0
	ldr r1, _08098DA0
	lsls r0, r4, #1
	adds r0, r0, r4
	ldrb r3, [r5, #2]
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08098D96
	adds r0, r5, #0
	adds r1, r2, #0
	bl ScriptCall
_08098D96:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08098DA0: .4byte 0x084E8904
	thumb_func_end ScrCmd_call_if

	thumb_func_start ScrCmd_setvaddress
ScrCmd_setvaddress: @ 0x08098DA4
	push {r4, lr}
	ldr r4, [r0, #8]
	subs r4, #1
	bl ScriptReadWord
	ldr r1, _08098DBC
	subs r0, r0, r4
	str r0, [r1]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08098DBC: .4byte 0x02037264
	thumb_func_end ScrCmd_setvaddress

	thumb_func_start ScrCmd_vgoto
ScrCmd_vgoto: @ 0x08098DC0
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, _08098DE0
	ldr r0, [r0]
	subs r1, r1, r0
	adds r0, r4, #0
	bl ScriptJump
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08098DE0: .4byte 0x02037264
	thumb_func_end ScrCmd_vgoto

	thumb_func_start ScrCmd_vcall
ScrCmd_vcall: @ 0x08098DE4
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, _08098E04
	ldr r0, [r0]
	subs r1, r1, r0
	adds r0, r4, #0
	bl ScriptCall
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08098E04: .4byte 0x02037264
	thumb_func_end ScrCmd_vcall

	thumb_func_start ScrCmd_vgoto_if
ScrCmd_vgoto_if: @ 0x08098E08
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r4, [r0]
	adds r0, #1
	str r0, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadWord
	ldr r1, _08098E44
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08098E48
	lsls r0, r4, #1
	adds r0, r0, r4
	ldrb r3, [r5, #2]
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08098E3A
	adds r0, r5, #0
	adds r1, r2, #0
	bl ScriptJump
_08098E3A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08098E44: .4byte 0x02037264
_08098E48: .4byte 0x084E8904
	thumb_func_end ScrCmd_vgoto_if

	thumb_func_start ScrCmd_vcall_if
ScrCmd_vcall_if: @ 0x08098E4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r4, [r0]
	adds r0, #1
	str r0, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadWord
	ldr r1, _08098E88
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08098E8C
	lsls r0, r4, #1
	adds r0, r0, r4
	ldrb r3, [r5, #2]
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08098E7E
	adds r0, r5, #0
	adds r1, r2, #0
	bl ScriptCall
_08098E7E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08098E88: .4byte 0x02037264
_08098E8C: .4byte 0x084E8904
	thumb_func_end ScrCmd_vcall_if

	thumb_func_start ScrCmd_gotostd
ScrCmd_gotostd: @ 0x08098E90
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r2, #8]
	lsls r1, r1, #2
	ldr r0, _08098EB8
	adds r1, r1, r0
	ldr r0, _08098EBC
	cmp r1, r0
	bhs _08098EB0
	ldr r1, [r1]
	adds r0, r2, #0
	bl ScriptJump
_08098EB0:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08098EB8: .4byte 0x081DB7BC
_08098EBC: .4byte 0x081DB7E8
	thumb_func_end ScrCmd_gotostd

	thumb_func_start ScrCmd_callstd
ScrCmd_callstd: @ 0x08098EC0
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r2, #8]
	lsls r1, r1, #2
	ldr r0, _08098EE8
	adds r1, r1, r0
	ldr r0, _08098EEC
	cmp r1, r0
	bhs _08098EE0
	ldr r1, [r1]
	adds r0, r2, #0
	bl ScriptCall
_08098EE0:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08098EE8: .4byte 0x081DB7BC
_08098EEC: .4byte 0x081DB7E8
	thumb_func_end ScrCmd_callstd

	thumb_func_start ScrCmd_gotostd_if
ScrCmd_gotostd_if: @ 0x08098EF0
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #8]
	ldrb r2, [r0]
	adds r0, #1
	str r0, [r3, #8]
	ldrb r4, [r0]
	adds r0, #1
	str r0, [r3, #8]
	ldr r1, _08098F30
	lsls r0, r2, #1
	adds r0, r0, r2
	ldrb r2, [r3, #2]
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08098F28
	lsls r0, r4, #2
	ldr r1, _08098F34
	adds r1, r0, r1
	ldr r0, _08098F38
	cmp r1, r0
	bhs _08098F28
	ldr r1, [r1]
	adds r0, r3, #0
	bl ScriptJump
_08098F28:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08098F30: .4byte 0x084E8904
_08098F34: .4byte 0x081DB7BC
_08098F38: .4byte 0x081DB7E8
	thumb_func_end ScrCmd_gotostd_if

	thumb_func_start ScrCmd_callstd_if
ScrCmd_callstd_if: @ 0x08098F3C
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #8]
	ldrb r2, [r0]
	adds r0, #1
	str r0, [r3, #8]
	ldrb r4, [r0]
	adds r0, #1
	str r0, [r3, #8]
	ldr r1, _08098F7C
	lsls r0, r2, #1
	adds r0, r0, r2
	ldrb r2, [r3, #2]
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08098F74
	lsls r0, r4, #2
	ldr r1, _08098F80
	adds r1, r0, r1
	ldr r0, _08098F84
	cmp r1, r0
	bhs _08098F74
	ldr r1, [r1]
	adds r0, r3, #0
	bl ScriptCall
_08098F74:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08098F7C: .4byte 0x084E8904
_08098F80: .4byte 0x081DB7BC
_08098F84: .4byte 0x081DB7E8
	thumb_func_end ScrCmd_callstd_if

	thumb_func_start ScrCmd_returnram
ScrCmd_returnram: @ 0x08098F88
	push {lr}
	ldr r1, _08098F98
	ldr r1, [r1]
	bl ScriptJump
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08098F98: .4byte 0x02037260
	thumb_func_end ScrCmd_returnram

	thumb_func_start ScrCmd_killscript
ScrCmd_killscript: @ 0x08098F9C
	push {r4, lr}
	adds r4, r0, #0
	bl ClearRamScript
	adds r0, r4, #0
	bl StopScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_killscript

	thumb_func_start ScrCmd_setmysteryeventstatus
ScrCmd_setmysteryeventstatus: @ 0x08098FB4
	push {lr}
	ldr r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	adds r0, r2, #0
	bl SetMysteryEventScriptStatus
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setmysteryeventstatus

	thumb_func_start ScrCmd_loadword
ScrCmd_loadword: @ 0x08098FCC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	ldrb r5, [r0]
	adds r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadWord
	lsls r5, r5, #2
	adds r4, #0x64
	adds r4, r4, r5
	str r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_loadword

	thumb_func_start ScrCmd_loadbytefromaddr
ScrCmd_loadbytefromaddr: @ 0x08098FF0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	ldrb r5, [r0]
	adds r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadWord
	lsls r5, r5, #2
	adds r4, #0x64
	adds r4, r4, r5
	ldrb r0, [r0]
	str r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_loadbytefromaddr

	thumb_func_start ScrCmd_writebytetoaddr
ScrCmd_writebytetoaddr: @ 0x08099014
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadWord
	strb r4, [r0]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_writebytetoaddr

	thumb_func_start ScrCmd_loadbyte
ScrCmd_loadbyte: @ 0x0809902C
	ldr r1, [r0, #8]
	ldrb r3, [r1]
	adds r1, #1
	str r1, [r0, #8]
	lsls r3, r3, #2
	adds r2, r0, #0
	adds r2, #0x64
	adds r2, r2, r3
	ldrb r3, [r1]
	str r3, [r2]
	adds r1, #1
	str r1, [r0, #8]
	movs r0, #0
	bx lr
	thumb_func_end ScrCmd_loadbyte

	thumb_func_start ScrCmd_setptrbyte
ScrCmd_setptrbyte: @ 0x08099048
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	ldrb r5, [r0]
	adds r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadWord
	lsls r5, r5, #2
	adds r4, #0x64
	adds r4, r4, r5
	ldr r1, [r4]
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setptrbyte

	thumb_func_start ScrCmd_copylocal
ScrCmd_copylocal: @ 0x0809906C
	ldr r1, [r0, #8]
	ldrb r3, [r1]
	adds r1, #1
	str r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	lsls r3, r3, #2
	adds r0, #0x64
	adds r3, r0, r3
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r3]
	movs r0, #0
	bx lr
	thumb_func_end ScrCmd_copylocal

	thumb_func_start ScrCmd_copybyte
ScrCmd_copybyte: @ 0x0809908C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r5, r0, #0
	adds r0, r4, #0
	bl ScriptReadWord
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_copybyte

	thumb_func_start ScrCmd_setvar
ScrCmd_setvar: @ 0x080990A8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r4, r0, #0
	adds r0, r5, #0
	bl ScriptReadHalfword
	strh r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setvar

	thumb_func_start ScrCmd_copyvar
ScrCmd_copyvar: @ 0x080990CC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r5, r0, #0
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_copyvar

	thumb_func_start ScrCmd_setorcopyvar
ScrCmd_setorcopyvar: @ 0x080990F8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r5, r0, #0
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setorcopyvar

	thumb_func_start compare_012
compare_012: @ 0x08099124
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r0, r1
	bhs _08099136
	movs r0, #0
	b _08099140
_08099136:
	cmp r0, r1
	beq _0809913E
	movs r0, #2
	b _08099140
_0809913E:
	movs r0, #1
_08099140:
	pop {r1}
	bx r1
	thumb_func_end compare_012

	thumb_func_start ScrCmd_compare_local_to_local
ScrCmd_compare_local_to_local: @ 0x08099144
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #8]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r3, r4, #0
	adds r3, #0x64
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r2, #1
	str r2, [r4, #8]
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r3, r3, r1
	ldrb r1, [r3]
	adds r2, #1
	str r2, [r4, #8]
	bl compare_012
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compare_local_to_local

	thumb_func_start ScrCmd_compare_local_to_value
ScrCmd_compare_local_to_value: @ 0x08099174
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #8]
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r0, #0x64
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r2, #1
	str r2, [r4, #8]
	ldrb r1, [r2]
	adds r2, #1
	str r2, [r4, #8]
	bl compare_012
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compare_local_to_value

	thumb_func_start ScrCmd_compare_local_to_addr
ScrCmd_compare_local_to_addr: @ 0x0809919C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #8]
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r0, #0x64
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r2, #1
	str r2, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadWord
	ldrb r1, [r0]
	adds r0, r5, #0
	bl compare_012
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compare_local_to_addr

	thumb_func_start ScrCmd_compare_addr_to_local
ScrCmd_compare_addr_to_local: @ 0x080991C8
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	ldrb r0, [r0]
	ldr r3, [r4, #8]
	ldrb r2, [r3]
	lsls r2, r2, #2
	adds r1, r4, #0
	adds r1, #0x64
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r3, #1
	str r3, [r4, #8]
	bl compare_012
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_compare_addr_to_local

	thumb_func_start ScrCmd_compare_addr_to_value
ScrCmd_compare_addr_to_value: @ 0x080991F4
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	ldrb r0, [r0]
	ldr r2, [r4, #8]
	ldrb r1, [r2]
	adds r2, #1
	str r2, [r4, #8]
	bl compare_012
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compare_addr_to_value

	thumb_func_start ScrCmd_compare_addr_to_addr
ScrCmd_compare_addr_to_addr: @ 0x08099214
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	ldrb r5, [r0]
	adds r0, r4, #0
	bl ScriptReadWord
	ldrb r1, [r0]
	adds r0, r5, #0
	bl compare_012
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_compare_addr_to_addr

	thumb_func_start ScrCmd_compare_var_to_value
ScrCmd_compare_var_to_value: @ 0x08099238
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	ldrh r5, [r0]
	adds r0, r4, #0
	bl ScriptReadHalfword
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	bl compare_012
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_compare_var_to_value

	thumb_func_start ScrCmd_compare_var_to_var
ScrCmd_compare_var_to_var: @ 0x08099268
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r5, r0, #0
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	ldrh r2, [r5]
	ldrh r1, [r0]
	adds r0, r2, #0
	bl compare_012
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compare_var_to_var

	thumb_func_start ScrCmd_addvar
ScrCmd_addvar: @ 0x0809929C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r4, r0, #0
	adds r0, r5, #0
	bl ScriptReadHalfword
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_addvar

	thumb_func_start ScrCmd_subvar
ScrCmd_subvar: @ 0x080992C4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r5, r0, #0
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldrh r1, [r5]
	subs r1, r1, r0
	strh r1, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_subvar

	thumb_func_start ScrCmd_random
ScrCmd_random: @ 0x080992F4
	push {r4, r5, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r5, _08099324
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __umodsi3
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08099324: .4byte 0x02037290
	thumb_func_end ScrCmd_random

	thumb_func_start ScrCmd_giveitem
ScrCmd_giveitem: @ 0x08099328
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	ldr r5, _08099368
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl AddBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08099368: .4byte 0x02037290
	thumb_func_end ScrCmd_giveitem

	thumb_func_start ScrCmd_takeitem
ScrCmd_takeitem: @ 0x0809936C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	ldr r5, _080993AC
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl RemoveBagItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080993AC: .4byte 0x02037290
	thumb_func_end ScrCmd_takeitem

	thumb_func_start ScrCmd_checkitemspace
ScrCmd_checkitemspace: @ 0x080993B0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	ldr r5, _080993F0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl CheckBagHasSpace
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080993F0: .4byte 0x02037290
	thumb_func_end ScrCmd_checkitemspace

	thumb_func_start ScrCmd_checkitem
ScrCmd_checkitem: @ 0x080993F4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	ldr r5, _08099434
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl CheckBagHasItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08099434: .4byte 0x02037290
	thumb_func_end ScrCmd_checkitem

	thumb_func_start ScrCmd_checkitemtype
ScrCmd_checkitemtype: @ 0x08099438
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08099460
	bl GetPocketByItemId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099460: .4byte 0x02037290
	thumb_func_end ScrCmd_checkitemtype

	thumb_func_start ScrCmd_givepcitem
ScrCmd_givepcitem: @ 0x08099464
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r5, _080994A4
	adds r0, r4, #0
	bl AddPCItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080994A4: .4byte 0x02037290
	thumb_func_end ScrCmd_givepcitem

	thumb_func_start ScrCmd_checkpcitem
ScrCmd_checkpcitem: @ 0x080994A8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r5, _080994E8
	adds r0, r4, #0
	bl CheckPCHasItem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080994E8: .4byte 0x02037290
	thumb_func_end ScrCmd_checkpcitem

	thumb_func_start ScrCmd_givedecoration
ScrCmd_givedecoration: @ 0x080994EC
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r4, _08099514
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DecorationAdd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099514: .4byte 0x02037290
	thumb_func_end ScrCmd_givedecoration

	thumb_func_start ScrCmd_takedecoration
ScrCmd_takedecoration: @ 0x08099518
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r4, _08099540
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DecorationRemove
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099540: .4byte 0x02037290
	thumb_func_end ScrCmd_takedecoration

	thumb_func_start ScrCmd_checkdecorspace
ScrCmd_checkdecorspace: @ 0x08099544
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r4, _0809956C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl DecorationCheckSpace
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809956C: .4byte 0x02037290
	thumb_func_end ScrCmd_checkdecorspace

	thumb_func_start ScrCmd_checkdecor
ScrCmd_checkdecor: @ 0x08099570
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r4, _08099598
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl CheckHasDecoration
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099598: .4byte 0x02037290
	thumb_func_end ScrCmd_checkdecor

	thumb_func_start ScrCmd_setflag
ScrCmd_setflag: @ 0x0809959C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagSet
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setflag

	thumb_func_start ScrCmd_clearflag
ScrCmd_clearflag: @ 0x080995B0
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagClear
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_clearflag

	thumb_func_start ScrCmd_checkflag
ScrCmd_checkflag: @ 0x080995C4
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagGet
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_checkflag

	thumb_func_start ScrCmd_incrementgamestat
ScrCmd_incrementgamestat: @ 0x080995E0
	push {lr}
	ldr r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	adds r0, r2, #0
	bl IncrementGameStat
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_incrementgamestat

	thumb_func_start ScrCmd_animateflash
ScrCmd_animateflash: @ 0x080995F8
	push {lr}
	ldr r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	adds r0, r2, #0
	bl sub_080AF998
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_animateflash

	thumb_func_start ScrCmd_setflashradius
ScrCmd_setflashradius: @ 0x08099614
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl Overworld_SetFlashLevel
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setflashradius

	thumb_func_start IsPaletteNotActive
IsPaletteNotActive: @ 0x08099630
	push {lr}
	ldr r0, _08099644
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08099648
	movs r0, #0
	b _0809964A
	.align 2, 0
_08099644: .4byte 0x02037C74
_08099648:
	movs r0, #1
_0809964A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsPaletteNotActive

	thumb_func_start ScrCmd_fadescreen
ScrCmd_fadescreen: @ 0x08099650
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	ldrb r0, [r1]
	adds r1, #1
	str r1, [r4, #8]
	movs r1, #0
	bl FadeScreen
	ldr r1, _08099674
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099674: .4byte 0x08099631
	thumb_func_end ScrCmd_fadescreen

	thumb_func_start ScrCmd_fadescreenspeed
ScrCmd_fadescreenspeed: @ 0x08099678
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #8]
	ldrb r0, [r2]
	adds r2, #1
	str r2, [r4, #8]
	ldrb r1, [r2]
	adds r2, #1
	str r2, [r4, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl FadeScreen
	ldr r1, _080996A4
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080996A4: .4byte 0x08099631
	thumb_func_end ScrCmd_fadescreenspeed

	thumb_func_start ScrCmd_fadescreenswapbuffers
ScrCmd_fadescreenswapbuffers: @ 0x080996A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r4, [r0]
	adds r0, #1
	str r0, [r5, #8]
	cmp r4, #1
	beq _080996C6
	cmp r4, #1
	bgt _080996C2
	cmp r4, #0
	beq _080996E8
	b _080996C6
_080996C2:
	cmp r4, #2
	beq _080996E8
_080996C6:
	ldr r0, _080996DC
	ldr r1, _080996E0
	ldr r2, _080996E4
	bl CpuSet
	adds r0, r4, #0
	movs r1, #0
	bl FadeScreen
	b _080996FA
	.align 2, 0
_080996DC: .4byte 0x020373B4
_080996E0: .4byte 0x02037C88
_080996E4: .4byte 0x04000100
_080996E8:
	ldr r0, _0809970C
	ldr r1, _08099710
	ldr r2, _08099714
	bl CpuSet
	adds r0, r4, #0
	movs r1, #0
	bl FadeScreen
_080996FA:
	ldr r1, _08099718
	adds r0, r5, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809970C: .4byte 0x02037C88
_08099710: .4byte 0x020373B4
_08099714: .4byte 0x04000100
_08099718: .4byte 0x08099631
	thumb_func_end ScrCmd_fadescreenswapbuffers

	thumb_func_start RunPauseTimer
RunPauseTimer: @ 0x0809971C
	push {lr}
	ldr r1, _08099730
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08099734
	movs r0, #0
	b _08099736
	.align 2, 0
_08099730: .4byte 0x02037268
_08099734:
	movs r0, #1
_08099736:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RunPauseTimer

	thumb_func_start ScrCmd_delay
ScrCmd_delay: @ 0x0809973C
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	ldr r1, _08099758
	strh r0, [r1]
	ldr r1, _0809975C
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099758: .4byte 0x02037268
_0809975C: .4byte 0x0809971D
	thumb_func_end ScrCmd_delay

	thumb_func_start ScrCmd_initclock
ScrCmd_initclock: @ 0x08099760
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl RtcInitLocalTimeOffset
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_initclock

	thumb_func_start ScrCmd_dotimebasedevents
ScrCmd_dotimebasedevents: @ 0x08099798
	push {lr}
	bl DoTimeBasedEvents
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_dotimebasedevents

	thumb_func_start ScrCmd_gettime
ScrCmd_gettime: @ 0x080997A4
	push {lr}
	bl RtcCalcLocalTime
	ldr r2, _080997CC
	ldr r1, _080997D0
	movs r0, #2
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _080997D4
	movs r0, #3
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _080997D8
	movs r0, #4
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080997CC: .4byte 0x02037278
_080997D0: .4byte 0x03005A50
_080997D4: .4byte 0x0203727A
_080997D8: .4byte 0x0203727C
	thumb_func_end ScrCmd_gettime

	thumb_func_start ScrCmd_setweather
ScrCmd_setweather: @ 0x080997DC
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetSav1Weather
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setweather

	thumb_func_start ScrCmd_doweather
ScrCmd_doweather: @ 0x080997F8
	push {lr}
	bl SetSav1WeatherFromCurrMapHeader
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_doweather

	thumb_func_start ScrCmd_resetweather
ScrCmd_resetweather: @ 0x08099804
	push {lr}
	bl DoCurrentWeather
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_resetweather

	thumb_func_start ScrCmd_setstepcallback
ScrCmd_setstepcallback: @ 0x08099810
	push {lr}
	ldr r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	adds r0, r2, #0
	bl ActivatePerStepCallback
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setstepcallback

	thumb_func_start ScrCmd_setmaplayoutindex
ScrCmd_setmaplayoutindex: @ 0x08099828
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetCurrentMapLayout
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setmaplayoutindex

	thumb_func_start ScrCmd_warp
ScrCmd_warp: @ 0x08099844
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetWarpDestination
	bl DoWarp
	bl ResetInitialPlayerAvatarState
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_warp

	thumb_func_start ScrCmd_warpsilent
ScrCmd_warpsilent: @ 0x080998CC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetWarpDestination
	bl DoDiveWarp
	bl ResetInitialPlayerAvatarState
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_warpsilent

	thumb_func_start ScrCmd_warpdoor
ScrCmd_warpdoor: @ 0x08099954
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetWarpDestination
	bl DoDoorWarp
	bl ResetInitialPlayerAvatarState
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_warpdoor

	thumb_func_start ScrCmd_warphole
ScrCmd_warphole: @ 0x080999DC
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, [r0, #8]
	ldrb r6, [r1]
	adds r1, #1
	str r1, [r0, #8]
	ldrb r5, [r1]
	adds r1, #1
	str r1, [r0, #8]
	mov r4, sp
	adds r4, #6
	add r0, sp, #4
	adds r1, r4, #0
	bl PlayerGetDestCoords
	cmp r6, #0xff
	bne _08099A1A
	cmp r5, #0xff
	bne _08099A1A
	add r0, sp, #4
	ldrh r0, [r0]
	subs r0, #7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4]
	subs r1, #7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl SetWarpDestinationToFixedHoleWarp
	b _08099A3E
_08099A1A:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	add r3, sp, #4
	ldrb r3, [r3]
	subs r3, #7
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldrb r4, [r4]
	subs r4, #7
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl SetWarpDestination
_08099A3E:
	bl DoFallWarp
	bl ResetInitialPlayerAvatarState
	movs r0, #1
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warphole

	thumb_func_start ScrCmd_warpteleport
ScrCmd_warpteleport: @ 0x08099A50
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetWarpDestination
	bl sub_080AF144
	bl ResetInitialPlayerAvatarState
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_warpteleport

	thumb_func_start ScrCmd_warpD7
ScrCmd_warpD7: @ 0x08099AD8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetWarpDestination
	bl sub_080AF178
	bl ResetInitialPlayerAvatarState
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_warpD7

	thumb_func_start ScrCmd_setwarp
ScrCmd_setwarp: @ 0x08099B60
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetWarpDestination
	movs r0, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setwarp

	thumb_func_start ScrCmd_setdynamicwarp
ScrCmd_setdynamicwarp: @ 0x08099BE0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl SetDynamicWarpWithCoords
	movs r0, #0
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setdynamicwarp

	thumb_func_start ScrCmd_setdivewarp
ScrCmd_setdivewarp: @ 0x08099C64
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetFixedDiveWarp
	movs r0, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setdivewarp

	thumb_func_start ScrCmd_setholewarp
ScrCmd_setholewarp: @ 0x08099CE4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetFixedHoleWarp
	movs r0, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setholewarp

	thumb_func_start ScrCmd_setescapewarp
ScrCmd_setescapewarp: @ 0x08099D64
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetEscapeWarp
	movs r0, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setescapewarp

	thumb_func_start ScrCmd_getplayerxy
ScrCmd_getplayerxy: @ 0x08099DE4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r5, r0, #0
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	ldr r2, _08099E1C
	ldr r1, [r2]
	ldrh r1, [r1]
	strh r1, [r5]
	ldr r1, [r2]
	ldrh r1, [r1, #2]
	strh r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08099E1C: .4byte 0x03005AEC
	thumb_func_end ScrCmd_getplayerxy

	thumb_func_start ScrCmd_getpartysize
ScrCmd_getpartysize: @ 0x08099E20
	push {r4, lr}
	ldr r4, _08099E38
	bl CalculatePlayerPartyCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099E38: .4byte 0x02037290
	thumb_func_end ScrCmd_getpartysize

	thumb_func_start ScrCmd_playse
ScrCmd_playse: @ 0x08099E3C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl PlaySE
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playse

	thumb_func_start WaitForSoundEffectFinish
WaitForSoundEffectFinish: @ 0x08099E50
	push {lr}
	bl IsSEPlaying
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099E60
	movs r0, #0
	b _08099E62
_08099E60:
	movs r0, #1
_08099E62:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WaitForSoundEffectFinish

	thumb_func_start ScrCmd_waitse
ScrCmd_waitse: @ 0x08099E68
	push {lr}
	ldr r1, _08099E78
	bl SetupNativeScript
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_08099E78: .4byte 0x08099E51
	thumb_func_end ScrCmd_waitse

	thumb_func_start ScrCmd_playfanfare
ScrCmd_playfanfare: @ 0x08099E7C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl PlayFanfare
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playfanfare

	thumb_func_start WaitForFanfareFinish
WaitForFanfareFinish: @ 0x08099E90
	push {lr}
	bl IsFanfareTaskInactive
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WaitForFanfareFinish

	thumb_func_start ScrCmd_waitfanfare
ScrCmd_waitfanfare: @ 0x08099EA0
	push {lr}
	ldr r1, _08099EB0
	bl SetupNativeScript
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_08099EB0: .4byte 0x08099E91
	thumb_func_end ScrCmd_waitfanfare

	thumb_func_start ScrCmd_playbgm
ScrCmd_playbgm: @ 0x08099EB4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r5, r2, #0
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r4, #8]
	cmp r1, #1
	bne _08099ED4
	adds r0, r2, #0
	bl Overworld_SetSavedMusic
_08099ED4:
	adds r0, r5, #0
	bl PlayNewMapMusic
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_playbgm

	thumb_func_start ScrCmd_savebgm
ScrCmd_savebgm: @ 0x08099EE4
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl Overworld_SetSavedMusic
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_savebgm

	thumb_func_start ScrCmd_fadedefaultbgm
ScrCmd_fadedefaultbgm: @ 0x08099EF8
	push {lr}
	bl Overworld_ChangeMusicToDefault
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fadedefaultbgm

	thumb_func_start ScrCmd_fadenewbgm
ScrCmd_fadenewbgm: @ 0x08099F04
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl Overworld_ChangeMusicTo
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fadenewbgm

	thumb_func_start ScrCmd_fadeoutbgm
ScrCmd_fadeoutbgm: @ 0x08099F18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r4, #8]
	cmp r1, #0
	beq _08099F32
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x18
	bl FadeInBGM
	b _08099F38
_08099F32:
	movs r0, #4
	bl FadeInBGM
_08099F38:
	ldr r1, _08099F48
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099F48: .4byte 0x080A2AC9
	thumb_func_end ScrCmd_fadeoutbgm

	thumb_func_start ScrCmd_fadeinbgm
ScrCmd_fadeinbgm: @ 0x08099F4C
	push {lr}
	ldr r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	cmp r2, #0
	beq _08099F64
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x18
	bl FadeOutBGM
	b _08099F6A
_08099F64:
	movs r0, #4
	bl FadeOutBGM
_08099F6A:
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fadeinbgm

	thumb_func_start ScrCmd_applymovement
ScrCmd_applymovement: @ 0x08099F70
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadWord
	adds r3, r0, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08099FAC
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl ScriptMovement_StartObjectMovementScript
	ldr r0, _08099FB0
	strh r4, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08099FAC: .4byte 0x03005AEC
_08099FB0: .4byte 0x0203726A
	thumb_func_end ScrCmd_applymovement

	thumb_func_start ScrCmd_applymovement_at
ScrCmd_applymovement_at: @ 0x08099FB4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadWord
	adds r3, r0, #0
	ldr r0, [r5, #8]
	ldrb r2, [r0]
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r5, #8]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ScriptMovement_StartObjectMovementScript
	ldr r0, _08099FF4
	strh r4, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08099FF4: .4byte 0x0203726A
	thumb_func_end ScrCmd_applymovement_at

	thumb_func_start WaitForMovementFinish
WaitForMovementFinish: @ 0x08099FF8
	push {lr}
	ldr r0, _0809A014
	ldrb r0, [r0]
	ldr r1, _0809A018
	ldrb r1, [r1]
	ldr r2, _0809A01C
	ldrb r2, [r2]
	bl ScriptMovement_IsObjectMovementFinished
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0809A014: .4byte 0x0203726A
_0809A018: .4byte 0x0203726E
_0809A01C: .4byte 0x0203726C
	thumb_func_end WaitForMovementFinish

	thumb_func_start ScrCmd_waitmovement
ScrCmd_waitmovement: @ 0x0809A020
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0809A03C
	ldr r0, _0809A060
	strh r1, [r0]
_0809A03C:
	ldr r1, _0809A064
	ldr r0, _0809A068
	ldr r2, [r0]
	movs r0, #4
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _0809A06C
	movs r0, #5
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _0809A070
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A060: .4byte 0x0203726A
_0809A064: .4byte 0x0203726C
_0809A068: .4byte 0x03005AEC
_0809A06C: .4byte 0x0203726E
_0809A070: .4byte 0x08099FF9
	thumb_func_end ScrCmd_waitmovement

	thumb_func_start ScrCmd_waitmovement_at
ScrCmd_waitmovement_at: @ 0x0809A074
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0809A090
	ldr r0, _0809A0B8
	strh r1, [r0]
_0809A090:
	ldr r0, [r4, #8]
	ldrb r2, [r0]
	adds r0, #1
	str r0, [r4, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r4, #8]
	ldr r0, _0809A0BC
	strh r2, [r0]
	ldr r0, _0809A0C0
	strh r1, [r0]
	ldr r1, _0809A0C4
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A0B8: .4byte 0x0203726A
_0809A0BC: .4byte 0x0203726C
_0809A0C0: .4byte 0x0203726E
_0809A0C4: .4byte 0x08099FF9
	thumb_func_end ScrCmd_waitmovement_at

	thumb_func_start ScrCmd_removeobject
ScrCmd_removeobject: @ 0x0809A0C8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0809A0EC
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl RemoveEventObjectByLocalIdAndMap
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809A0EC: .4byte 0x03005AEC
	thumb_func_end ScrCmd_removeobject

	thumb_func_start ScrCmd_removeobject_at
ScrCmd_removeobject_at: @ 0x0809A0F0
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r3, [r4, #8]
	ldrb r2, [r3]
	adds r3, #1
	str r3, [r4, #8]
	ldrb r1, [r3]
	adds r3, #1
	str r3, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl RemoveEventObjectByLocalIdAndMap
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_removeobject_at

	thumb_func_start ScrCmd_addobject
ScrCmd_addobject: @ 0x0809A120
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0809A144
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl TrySpawnEventObject
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809A144: .4byte 0x03005AEC
	thumb_func_end ScrCmd_addobject

	thumb_func_start ScrCmd_addobject_at
ScrCmd_addobject_at: @ 0x0809A148
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r3, [r4, #8]
	ldrb r2, [r3]
	adds r3, #1
	str r3, [r4, #8]
	ldrb r1, [r3]
	adds r3, #1
	str r3, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl TrySpawnEventObject
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_addobject_at

	thumb_func_start ScrCmd_setobjectxy
ScrCmd_setobjectxy: @ 0x0809A178
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r6, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _0809A1DC
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r5, #0
	adds r3, r4, #0
	bl TryMoveEventObjectToMapCoords
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809A1DC: .4byte 0x03005AEC
	thumb_func_end ScrCmd_setobjectxy

	thumb_func_start ScrCmd_setobjectxyperm
ScrCmd_setobjectxyperm: @ 0x0809A1E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r6, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r6, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r2, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl Overworld_SetEventObjTemplateCoords
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setobjectxyperm

	thumb_func_start ScrCmd_moveobjectoffscreen
ScrCmd_moveobjectoffscreen: @ 0x0809A238
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0809A25C
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl TryOverrideEventObjectTemplateCoords
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809A25C: .4byte 0x03005AEC
	thumb_func_end ScrCmd_moveobjectoffscreen

	thumb_func_start ScrCmd_showobject_at
ScrCmd_showobject_at: @ 0x0809A260
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r3, [r4, #8]
	ldrb r2, [r3]
	adds r3, #1
	str r3, [r4, #8]
	ldrb r1, [r3]
	adds r3, #1
	str r3, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showobject_at

	thumb_func_start ScrCmd_hideobject_at
ScrCmd_hideobject_at: @ 0x0809A290
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r3, [r4, #8]
	ldrb r2, [r3]
	adds r3, #1
	str r3, [r4, #8]
	ldrb r1, [r3]
	adds r3, #1
	str r3, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #1
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hideobject_at

	thumb_func_start ScrCmd_setobjectpriority
ScrCmd_setobjectpriority: @ 0x0809A2C0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r3, [r5, #8]
	ldrb r2, [r3]
	adds r3, #1
	str r3, [r5, #8]
	ldrb r1, [r3]
	adds r4, r3, #1
	str r4, [r5, #8]
	ldrb r3, [r3, #1]
	adds r4, #1
	str r4, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, #0x53
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl sub_0808E0FC
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setobjectpriority

	thumb_func_start ScrCmd_resetobjectpriority
ScrCmd_resetobjectpriority: @ 0x0809A2FC
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r3, [r4, #8]
	ldrb r2, [r3]
	adds r3, #1
	str r3, [r4, #8]
	ldrb r1, [r3]
	adds r3, #1
	str r3, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0808E154
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_resetobjectpriority

	thumb_func_start ScrCmd_faceplayer
ScrCmd_faceplayer: @ 0x0809A32C
	push {r4, lr}
	ldr r2, _0809A35C
	ldr r0, _0809A360
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	ldrb r0, [r4]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809A354
	bl GetPlayerFacingDirection
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectFaceOppositeDirection
_0809A354:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A35C: .4byte 0x02036FF0
_0809A360: .4byte 0x03005B50
	thumb_func_end ScrCmd_faceplayer

	thumb_func_start ScrCmd_turnobject
ScrCmd_turnobject: @ 0x0809A364
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r1, [r4, #8]
	ldrb r3, [r1]
	adds r1, #1
	str r1, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0809A394
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl EventObjectTurnByLocalIdAndMap
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A394: .4byte 0x03005AEC
	thumb_func_end ScrCmd_turnobject

	thumb_func_start ScrCmd_setobjectmovementtype
ScrCmd_setobjectmovementtype: @ 0x0809A398
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r2, [r4, #8]
	ldrb r1, [r2]
	adds r2, #1
	str r2, [r4, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl Overworld_SetEventObjTemplateMovementType
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setobjectmovementtype

	thumb_func_start ScrCmd_createvobject
ScrCmd_createvobject: @ 0x0809A3C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r6, [r0]
	adds r0, #1
	str r0, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r3, r0, #0
	ldr r0, [r5, #8]
	ldrb r2, [r0]
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r5, #8]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r2, [sp]
	str r1, [sp, #4]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r4, #0
	bl sprite_new
	movs r0, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_createvobject

	thumb_func_start ScrCmd_turnvobject
ScrCmd_turnvobject: @ 0x0809A430
	push {lr}
	ldr r2, [r0, #8]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r0, #8]
	ldrb r1, [r2]
	adds r2, #1
	str r2, [r0, #8]
	adds r0, r3, #0
	bl sub_080974E8
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_turnvobject

	thumb_func_start ScrCmd_lockall
ScrCmd_lockall: @ 0x0809A44C
	push {r4, lr}
	adds r4, r0, #0
	bl IsUpdateLinkStateCBActive
	cmp r0, #0
	bne _0809A46C
	bl ScriptFreezeEventObjects
	ldr r1, _0809A468
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	b _0809A46E
	.align 2, 0
_0809A468: .4byte 0x08097D4D
_0809A46C:
	movs r0, #0
_0809A46E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_lockall

	thumb_func_start ScrCmd_lock
ScrCmd_lock: @ 0x0809A474
	push {r4, lr}
	adds r4, r0, #0
	bl IsUpdateLinkStateCBActive
	cmp r0, #0
	beq _0809A484
	movs r0, #0
	b _0809A4C2
_0809A484:
	ldr r2, _0809A4A8
	ldr r0, _0809A4AC
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809A4B4
	bl LockSelectedEventObject
	ldr r1, _0809A4B0
	adds r0, r4, #0
	bl SetupNativeScript
	b _0809A4C0
	.align 2, 0
_0809A4A8: .4byte 0x02036FF0
_0809A4AC: .4byte 0x03005B50
_0809A4B0: .4byte 0x08097E05
_0809A4B4:
	bl ScriptFreezeEventObjects
	ldr r1, _0809A4C8
	adds r0, r4, #0
	bl SetupNativeScript
_0809A4C0:
	movs r0, #1
_0809A4C2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A4C8: .4byte 0x08097D4D
	thumb_func_end ScrCmd_lock

	thumb_func_start ScrCmd_releaseall
ScrCmd_releaseall: @ 0x0809A4CC
	push {lr}
	bl HideFieldMessageBox
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0809A500
	adds r0, r0, r1
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	bl sub_080D2C2C
	bl UnfreezeEventObjects
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809A500: .4byte 0x02036FF0
	thumb_func_end ScrCmd_releaseall

	thumb_func_start ScrCmd_release
ScrCmd_release: @ 0x0809A504
	push {r4, lr}
	bl HideFieldMessageBox
	ldr r4, _0809A554
	ldr r0, _0809A558
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809A526
	adds r0, r1, #0
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
_0809A526:
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	bl sub_080D2C2C
	bl UnfreezeEventObjects
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A554: .4byte 0x02036FF0
_0809A558: .4byte 0x03005B50
	thumb_func_end ScrCmd_release

	thumb_func_start ScrCmd_message
ScrCmd_message: @ 0x0809A55C
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	cmp r0, #0
	bne _0809A56A
	ldr r0, [r4, #0x64]
_0809A56A:
	bl ShowFieldMessage
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_message

	thumb_func_start ScrCmd_pokenavcall
ScrCmd_pokenavcall: @ 0x0809A578
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	cmp r0, #0
	bne _0809A586
	ldr r0, [r4, #0x64]
_0809A586:
	bl sub_08097BC0
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_pokenavcall

	thumb_func_start ScrCmd_messageautoscroll
ScrCmd_messageautoscroll: @ 0x0809A594
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r3, r0, #0
	cmp r3, #0
	bne _0809A5A4
	ldr r3, [r4, #0x64]
_0809A5A4:
	ldr r2, _0809A5C0
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	bl ShowFieldAutoScrollMessage
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A5C0: .4byte 0x030030B4
	thumb_func_end ScrCmd_messageautoscroll

	thumb_func_start ScrCmd_cmdDB
ScrCmd_cmdDB: @ 0x0809A5C4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl ScriptReadWord
	adds r4, r0, #0
	cmp r4, #0
	bne _0809A5D6
	ldr r4, [r5, #0x64]
_0809A5D6:
	bl sub_08196F98
	movs r0, #0
	movs r1, #1
	bl ClearDialogWindowAndFrame
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0
	bl AddTextPrinterParameterized
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_cmdDB

	thumb_func_start ScrCmd_waitmessage
ScrCmd_waitmessage: @ 0x0809A600
	push {lr}
	ldr r1, _0809A610
	bl SetupNativeScript
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0809A610: .4byte 0x08097CC5
	thumb_func_end ScrCmd_waitmessage

	thumb_func_start ScrCmd_closemessage
ScrCmd_closemessage: @ 0x0809A614
	push {lr}
	bl HideFieldMessageBox
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_closemessage

	thumb_func_start WaitForAorBPress
WaitForAorBPress: @ 0x0809A620
	push {lr}
	ldr r0, _0809A63C
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809A640
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0809A640
	movs r0, #0
	b _0809A642
	.align 2, 0
_0809A63C: .4byte 0x03002360
_0809A640:
	movs r0, #1
_0809A642:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WaitForAorBPress

	thumb_func_start ScrCmd_waitbuttonpress
ScrCmd_waitbuttonpress: @ 0x0809A648
	push {lr}
	ldr r1, _0809A658
	bl SetupNativeScript
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0809A658: .4byte 0x0809A621
	thumb_func_end ScrCmd_waitbuttonpress

	thumb_func_start ScrCmd_yesnobox
ScrCmd_yesnobox: @ 0x0809A65C
	push {lr}
	ldr r2, [r0, #8]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r0, #8]
	ldrb r1, [r2]
	adds r2, #1
	str r2, [r0, #8]
	adds r0, r3, #0
	bl ScriptMenu_YesNo
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809A67E
	movs r0, #0
	b _0809A684
_0809A67E:
	bl ScriptContext1_Stop
	movs r0, #1
_0809A684:
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_yesnobox

	thumb_func_start ScrCmd_multichoice
ScrCmd_multichoice: @ 0x0809A688
	push {r4, r5, lr}
	ldr r2, [r0, #8]
	ldrb r5, [r2]
	adds r2, #1
	str r2, [r0, #8]
	ldrb r1, [r2]
	adds r3, r2, #1
	str r3, [r0, #8]
	ldrb r2, [r2, #1]
	adds r4, r3, #1
	str r4, [r0, #8]
	ldrb r3, [r3, #1]
	adds r4, #1
	str r4, [r0, #8]
	adds r0, r5, #0
	bl ScriptMenu_Multichoice
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809A6B6
	movs r0, #0
	b _0809A6BC
_0809A6B6:
	bl ScriptContext1_Stop
	movs r0, #1
_0809A6BC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_multichoice

	thumb_func_start ScrCmd_multichoicedefault
ScrCmd_multichoicedefault: @ 0x0809A6C4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r2, [r0, #8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, #1
	str r2, [r0, #8]
	ldrb r1, [r2]
	adds r3, r2, #1
	str r3, [r0, #8]
	ldrb r2, [r2, #1]
	adds r5, r3, #1
	str r5, [r0, #8]
	ldrb r6, [r3, #1]
	adds r4, r5, #1
	str r4, [r0, #8]
	ldrb r3, [r5, #1]
	adds r4, #1
	str r4, [r0, #8]
	str r6, [sp]
	mov r0, r8
	bl ScriptMenu_MultichoiceWithDefault
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809A702
	movs r0, #0
	b _0809A708
_0809A702:
	bl ScriptContext1_Stop
	movs r0, #1
_0809A708:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoicedefault

	thumb_func_start ScrCmd_erasebox
ScrCmd_erasebox: @ 0x0809A714
	movs r0, #0
	bx lr
	thumb_func_end ScrCmd_erasebox

	thumb_func_start ScrCmd_multichoicegrid
ScrCmd_multichoicegrid: @ 0x0809A718
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r2, [r0, #8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, #1
	str r2, [r0, #8]
	ldrb r1, [r2]
	adds r3, r2, #1
	str r3, [r0, #8]
	ldrb r2, [r2, #1]
	adds r5, r3, #1
	str r5, [r0, #8]
	ldrb r6, [r3, #1]
	adds r4, r5, #1
	str r4, [r0, #8]
	ldrb r3, [r5, #1]
	adds r4, #1
	str r4, [r0, #8]
	str r6, [sp]
	mov r0, r8
	bl sp106_CreateStartMenu
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809A756
	movs r0, #0
	b _0809A75C
_0809A756:
	bl ScriptContext1_Stop
	movs r0, #1
_0809A75C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoicegrid

	thumb_func_start ScrCmd_drawboxtext
ScrCmd_drawboxtext: @ 0x0809A768
	ldr r1, [r0, #8]
	adds r1, #4
	str r1, [r0, #8]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ScrCmd_drawboxtext

	thumb_func_start ScrCmd_mossdeepgym2
ScrCmd_mossdeepgym2: @ 0x0809A774
	ldr r1, [r0, #8]
	adds r1, #4
	str r1, [r0, #8]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ScrCmd_mossdeepgym2

	thumb_func_start ScrCmd_showmonpic
ScrCmd_showmonpic: @ 0x0809A780
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, [r4, #8]
	ldrb r1, [r3]
	adds r3, #1
	str r3, [r4, #8]
	ldrb r2, [r3]
	adds r3, #1
	str r3, [r4, #8]
	bl ScriptMenu_ShowPokemonPic
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_showmonpic

	thumb_func_start ScrCmd_hidemonpic
ScrCmd_hidemonpic: @ 0x0809A7B0
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptMenu_GetPicboxWaitFunc
	adds r1, r0, #0
	cmp r1, #0
	beq _0809A7C8
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	b _0809A7CA
_0809A7C8:
	movs r0, #0
_0809A7CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hidemonpic

	thumb_func_start ScrCmd_showcontestwinner
ScrCmd_showcontestwinner: @ 0x0809A7D0
	push {lr}
	ldr r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	cmp r2, #0
	beq _0809A7E4
	adds r0, r2, #0
	bl sub_0812FDE0
_0809A7E4:
	bl ShowContestWinner
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_showcontestwinner

	thumb_func_start ScrCmd_braillemessage
ScrCmd_braillemessage: @ 0x0809A7F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	bl ScriptReadWord
	adds r1, r0, #0
	ldrb r0, [r1]
	mov sb, r0
	ldrb r0, [r1, #1]
	mov sl, r0
	ldrb r4, [r1, #2]
	ldrb r5, [r1, #3]
	ldrb r0, [r1, #4]
	mov r8, r0
	ldrb r6, [r1, #5]
	ldr r7, _0809A8DC
	adds r1, #6
	adds r0, r7, #0
	bl StringExpandPlaceholders
	mov r2, sb
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sl
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r1, sb
	subs r4, r4, r1
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, sl
	subs r5, r5, r0
	subs r5, #1
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, r8
	subs r0, r0, r1
	mov r8, r0
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r0, r8
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r1, sl
	subs r6, r6, r1
	subs r6, #1
	lsls r6, r6, #0x1b
	lsrs r6, r6, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	movs r1, #0
	bl CreateWindowTemplate
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r4, _0809A8E0
	add r0, sp, #0x18
	bl AddWindow
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #0x85
	lsls r1, r1, #2
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	ldrb r0, [r4]
	movs r1, #0
	bl ClearStdWindowAndFrame
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldrb r0, [r4]
	str r6, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #6
	adds r2, r7, #0
	mov r3, r8
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	movs r1, #3
	bl CopyWindowToVram
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809A8DC: .4byte 0x02021C7C
_0809A8E0: .4byte 0x03000F30
	thumb_func_end ScrCmd_braillemessage

	thumb_func_start ScrCmd_mossdeepgym4
ScrCmd_mossdeepgym4: @ 0x0809A8E4
	push {lr}
	bl ScrCmd_bufferitemnameplural
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_mossdeepgym4

	thumb_func_start ScrCmd_vmessage
ScrCmd_vmessage: @ 0x0809A8F0
	push {lr}
	bl ScriptReadWord
	ldr r1, _0809A908
	ldr r1, [r1]
	subs r0, r0, r1
	bl ShowFieldMessage
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809A908: .4byte 0x02037264
	thumb_func_end ScrCmd_vmessage

	thumb_func_start ScrCmd_buffermovename
ScrCmd_buffermovename: @ 0x0809A90C
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0809A948
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0809A94C
	adds r1, r1, r0
	adds r0, r2, #0
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A948: .4byte 0x084E8918
_0809A94C: .4byte 0x082EA31C
	thumb_func_end ScrCmd_buffermovename

	thumb_func_start ScrCmd_bufferleadmonspeciesname
ScrCmd_bufferleadmonspeciesname: @ 0x0809A950
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r0, #8]
	ldr r0, _0809A994
	lsls r2, r2, #2
	adds r2, r2, r0
	ldr r4, [r2]
	bl GetLeadMonIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0809A998
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0809A99C
	adds r1, r1, r0
	adds r0, r4, #0
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A994: .4byte 0x084E8918
_0809A998: .4byte 0x02024190
_0809A99C: .4byte 0x082EA31C
	thumb_func_end ScrCmd_bufferleadmonspeciesname

	thumb_func_start ScrCmd_bufferpartymonnick
ScrCmd_bufferpartymonnick: @ 0x0809A9A0
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0809A9E0
	adds r0, r0, r1
	ldr r1, _0809A9E4
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r4, [r4]
	movs r1, #2
	adds r2, r4, #0
	bl GetMonData
	adds r0, r4, #0
	bl StringGetEnd10
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A9E0: .4byte 0x02024190
_0809A9E4: .4byte 0x084E8918
	thumb_func_end ScrCmd_bufferpartymonnick

	thumb_func_start ScrCmd_bufferitemname
ScrCmd_bufferitemname: @ 0x0809A9E8
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0809AA18
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl CopyItemName
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AA18: .4byte 0x084E8918
	thumb_func_end ScrCmd_bufferitemname

	thumb_func_start ScrCmd_bufferspeciesname
ScrCmd_bufferspeciesname: @ 0x0809AA1C
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0809AA58
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0809AA5C
	adds r1, r1, r0
	adds r0, r2, #0
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AA58: .4byte 0x084E8918
_0809AA5C: .4byte 0x08580CD1
	thumb_func_end ScrCmd_bufferspeciesname

	thumb_func_start ScrCmd_bufferdecorationname
ScrCmd_bufferdecorationname: @ 0x0809AA60
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x10
	ldr r0, _0809AA94
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	lsrs r1, r1, #0xd
	ldr r2, _0809AA98
	adds r1, r1, r2
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AA94: .4byte 0x084E8918
_0809AA98: .4byte 0x082EACC4
	thumb_func_end ScrCmd_bufferdecorationname

	thumb_func_start ScrCmd_buffernumberstring
ScrCmd_buffernumberstring: @ 0x0809AA9C
	push {r4, r5, lr}
	ldr r1, [r0, #8]
	ldrb r5, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	bl CountDigits
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r0, _0809AADC
	lsls r5, r5, #2
	adds r5, r5, r0
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #0
	bl ConvertIntToDecimalStringN
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809AADC: .4byte 0x084E8918
	thumb_func_end ScrCmd_buffernumberstring

	thumb_func_start ScrCmd_bufferstdstring
ScrCmd_bufferstdstring: @ 0x0809AAE0
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	ldr r1, _0809AB18
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	ldr r1, _0809AB1C
	lsrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r2, #0
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AB18: .4byte 0x084E8918
_0809AB1C: .4byte 0x085645A0
	thumb_func_end ScrCmd_bufferstdstring

	thumb_func_start ScrCmd_bufferstring
ScrCmd_bufferstring: @ 0x0809AB20
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, _0809AB44
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AB44: .4byte 0x084E8918
	thumb_func_end ScrCmd_bufferstring

	thumb_func_start ScrCmd_vloadword
ScrCmd_vloadword: @ 0x0809AB48
	push {lr}
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, _0809AB64
	ldr r0, [r0]
	subs r1, r1, r0
	ldr r0, _0809AB68
	bl StringExpandPlaceholders
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809AB64: .4byte 0x02037264
_0809AB68: .4byte 0x02021C7C
	thumb_func_end ScrCmd_vloadword

	thumb_func_start ScrCmd_vbufferstring
ScrCmd_vbufferstring: @ 0x0809AB6C
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadWord
	adds r1, r0, #0
	ldr r0, _0809AB98
	ldr r0, [r0]
	subs r1, r1, r0
	ldr r0, _0809AB9C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AB98: .4byte 0x02037264
_0809AB9C: .4byte 0x084E8918
	thumb_func_end ScrCmd_vbufferstring

	thumb_func_start ScrCmd_bufferboxname
ScrCmd_bufferboxname: @ 0x0809ABA0
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r1, _0809ABD8
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r4, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetBoxNamePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809ABD8: .4byte 0x084E8918
	thumb_func_end ScrCmd_bufferboxname

	thumb_func_start ScrCmd_givemon
ScrCmd_givemon: @ 0x0809ABDC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	bl ScriptReadWord
	mov r8, r0
	adds r0, r4, #0
	bl ScriptReadWord
	ldr r1, [r4, #8]
	ldrb r2, [r1]
	adds r1, #1
	str r1, [r4, #8]
	ldr r4, _0809AC58
	str r0, [sp]
	str r2, [sp, #4]
	adds r0, r6, #0
	mov r1, sb
	adds r2, r5, #0
	mov r3, r8
	bl ScriptGiveMon
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809AC58: .4byte 0x02037290
	thumb_func_end ScrCmd_givemon

	thumb_func_start ScrCmd_giveegg
ScrCmd_giveegg: @ 0x0809AC5C
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0809AC84
	bl ScriptGiveEgg
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AC84: .4byte 0x02037290
	thumb_func_end ScrCmd_giveegg

	thumb_func_start ScrCmd_setmonmove
ScrCmd_setmonmove: @ 0x0809AC88
	push {r4, r5, lr}
	ldr r1, [r0, #8]
	ldrb r5, [r1]
	adds r1, #1
	str r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	adds r2, r4, #0
	bl ScriptSetMonMoveSlot
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setmonmove

	thumb_func_start ScrCmd_checkpartymove
ScrCmd_checkpartymove: @ 0x0809ACB4
	push {r4, r5, r6, r7, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _0809ACC8
	movs r0, #6
	strh r0, [r1]
	movs r6, #0
	b _0809AD02
	.align 2, 0
_0809ACC8: .4byte 0x02037290
_0809ACCC:
	adds r0, r4, #0
	movs r1, #0x2d
	bl GetMonData
	cmp r0, #0
	bne _0809ACFC
	adds r0, r4, #0
	adds r1, r7, #0
	bl MonKnowsMove
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809ACFC
	ldr r0, _0809ACF4
	strh r6, [r0]
	ldr r0, _0809ACF8
	strh r5, [r0]
	b _0809AD22
	.align 2, 0
_0809ACF4: .4byte 0x02037290
_0809ACF8: .4byte 0x02037280
_0809ACFC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0809AD02:
	cmp r6, #5
	bhi _0809AD22
	movs r0, #0x64
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _0809AD2C
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0809ACCC
_0809AD22:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809AD2C: .4byte 0x02024190
	thumb_func_end ScrCmd_checkpartymove

	thumb_func_start ScrCmd_givemoney
ScrCmd_givemoney: @ 0x0809AD30
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r2, r0, #0
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r4, #8]
	cmp r1, #0
	bne _0809AD56
	ldr r0, _0809AD60
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r1, r2, #0
	bl AddMoney
_0809AD56:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AD60: .4byte 0x03005AEC
	thumb_func_end ScrCmd_givemoney

	thumb_func_start ScrCmd_takemoney
ScrCmd_takemoney: @ 0x0809AD64
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r2, r0, #0
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r4, #8]
	cmp r1, #0
	bne _0809AD8A
	ldr r0, _0809AD94
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r1, r2, #0
	bl RemoveMoney
_0809AD8A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AD94: .4byte 0x03005AEC
	thumb_func_end ScrCmd_takemoney

	thumb_func_start ScrCmd_checkmoney
ScrCmd_checkmoney: @ 0x0809AD98
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadWord
	adds r2, r0, #0
	ldr r0, [r4, #8]
	ldrb r1, [r0]
	adds r0, #1
	str r0, [r4, #8]
	cmp r1, #0
	bne _0809ADC6
	ldr r4, _0809ADD0
	ldr r0, _0809ADD4
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r1, r2, #0
	bl IsEnoughMoney
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
_0809ADC6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809ADD0: .4byte 0x02037290
_0809ADD4: .4byte 0x03005AEC
	thumb_func_end ScrCmd_checkmoney

	thumb_func_start ScrCmd_showmoneybox
ScrCmd_showmoneybox: @ 0x0809ADD8
	push {r4, r5, lr}
	ldr r1, [r0, #8]
	ldrb r5, [r1]
	adds r1, #1
	str r1, [r0, #8]
	ldrb r4, [r1]
	adds r2, r1, #1
	str r2, [r0, #8]
	ldrb r1, [r1, #1]
	adds r2, #1
	str r2, [r0, #8]
	cmp r1, #0
	bne _0809AE08
	ldr r0, _0809AE10
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	bl GetMoney
	adds r1, r5, #0
	adds r2, r4, #0
	bl DrawMoneyBox
_0809AE08:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809AE10: .4byte 0x03005AEC
	thumb_func_end ScrCmd_showmoneybox

	thumb_func_start ScrCmd_hidemoneybox
ScrCmd_hidemoneybox: @ 0x0809AE14
	push {lr}
	bl HideMoneyBox
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hidemoneybox

	thumb_func_start ScrCmd_updatemoneybox
ScrCmd_updatemoneybox: @ 0x0809AE20
	push {lr}
	ldr r1, [r0, #8]
	adds r1, #1
	adds r2, r1, #1
	str r2, [r0, #8]
	ldrb r1, [r1, #1]
	adds r2, #1
	str r2, [r0, #8]
	cmp r1, #0
	bne _0809AE46
	ldr r0, _0809AE4C
	ldr r0, [r0]
	movs r1, #0x92
	lsls r1, r1, #3
	adds r0, r0, r1
	bl GetMoney
	bl ChangeAmountInMoneyBox
_0809AE46:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809AE4C: .4byte 0x03005AEC
	thumb_func_end ScrCmd_updatemoneybox

	thumb_func_start ScrCmd_showcoinsbox
ScrCmd_showcoinsbox: @ 0x0809AE50
	push {r4, r5, lr}
	ldr r1, [r0, #8]
	ldrb r5, [r1]
	adds r1, #1
	str r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl ShowCoinsWindow
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showcoinsbox

	thumb_func_start ScrCmd_hidecoinsbox
ScrCmd_hidecoinsbox: @ 0x0809AE78
	push {lr}
	ldr r1, [r0, #8]
	adds r1, #2
	str r1, [r0, #8]
	bl HideCoinsWindow
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_hidecoinsbox

	thumb_func_start ScrCmd_updatecoinsbox
ScrCmd_updatecoinsbox: @ 0x0809AE8C
	push {lr}
	ldr r1, [r0, #8]
	adds r1, #2
	str r1, [r0, #8]
	bl GetCoins
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl PrintCoinsString
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_updatecoinsbox

	thumb_func_start ScrCmd_trainerbattle
ScrCmd_trainerbattle: @ 0x0809AEA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl BattleSetup_ConfigureTrainerBattle
	str r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_trainerbattle

	thumb_func_start ScrCmd_dotrainerbattle
ScrCmd_dotrainerbattle: @ 0x0809AEBC
	push {lr}
	bl BattleSetup_StartTrainerBattle
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_dotrainerbattle

	thumb_func_start ScrCmd_gotobeatenscript
ScrCmd_gotobeatenscript: @ 0x0809AEC8
	push {r4, lr}
	adds r4, r0, #0
	bl BattleSetup_GetScriptAddrAfterBattle
	str r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_gotobeatenscript

	thumb_func_start ScrCmd_gotopostbattlescript
ScrCmd_gotopostbattlescript: @ 0x0809AEDC
	push {r4, lr}
	adds r4, r0, #0
	bl BattleSetup_GetTrainerPostBattleScript
	str r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_gotopostbattlescript

	thumb_func_start ScrCmd_checktrainerflag
ScrCmd_checktrainerflag: @ 0x0809AEF0
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl HasTrainerBeenFought
	strb r0, [r4, #2]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_checktrainerflag

	thumb_func_start ScrCmd_settrainerflag
ScrCmd_settrainerflag: @ 0x0809AF14
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ClearTrainerFlag
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_settrainerflag

	thumb_func_start ScrCmd_cleartrainerflag
ScrCmd_cleartrainerflag: @ 0x0809AF30
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetTrainerFlag
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_cleartrainerflag

	thumb_func_start ScrCmd_setwildbattle
ScrCmd_setwildbattle: @ 0x0809AF4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, [r4, #8]
	ldrb r6, [r0]
	adds r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadHalfword
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl CreateScriptedWildMon
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setwildbattle

	thumb_func_start ScrCmd_dowildbattle
ScrCmd_dowildbattle: @ 0x0809AF80
	push {lr}
	bl BattleSetup_StartScriptedWildBattle
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_dowildbattle

	thumb_func_start ScrCmd_pokemart
ScrCmd_pokemart: @ 0x0809AF90
	push {lr}
	bl ScriptReadWord
	bl CreatePokemartMenu
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemart

	thumb_func_start ScrCmd_pokemartdecoration
ScrCmd_pokemartdecoration: @ 0x0809AFA4
	push {lr}
	bl ScriptReadWord
	bl CreateDecorationShop1Menu
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemartdecoration

	thumb_func_start ScrCmd_pokemartdecoration2
ScrCmd_pokemartdecoration2: @ 0x0809AFB8
	push {lr}
	bl ScriptReadWord
	bl CreateDecorationShop2Menu
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemartdecoration2

	thumb_func_start ScrCmd_playslotmachine
ScrCmd_playslotmachine: @ 0x0809AFCC
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0809AFF0
	bl PlaySlotMachine
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0809AFF0: .4byte 0x08085B35
	thumb_func_end ScrCmd_playslotmachine

	thumb_func_start ScrCmd_setberrytree
ScrCmd_setberrytree: @ 0x0809AFF4
	push {r4, r5, lr}
	ldr r1, [r0, #8]
	ldrb r5, [r1]
	adds r1, #1
	str r1, [r0, #8]
	ldrb r3, [r1]
	adds r2, r1, #1
	str r2, [r0, #8]
	ldrb r4, [r1, #1]
	adds r2, #1
	str r2, [r0, #8]
	cmp r3, #0
	bne _0809B01C
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0
	bl PlantBerryTree
	b _0809B028
_0809B01C:
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r4, #0
	movs r3, #0
	bl PlantBerryTree
_0809B028:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setberrytree

	thumb_func_start ScrCmd_getpricereduction
ScrCmd_getpricereduction: @ 0x0809B030
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r4, _0809B058
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetPriceReduction
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B058: .4byte 0x02037290
	thumb_func_end ScrCmd_getpricereduction

	thumb_func_start ScrCmd_showcontestresults
ScrCmd_showcontestresults: @ 0x0809B05C
	push {lr}
	bl sub_081B90A4
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showcontestresults

	thumb_func_start ScrCmd_startcontest
ScrCmd_startcontest: @ 0x0809B06C
	push {lr}
	bl sub_080F8C90
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_startcontest

	thumb_func_start ScrCmd_choosecontestmon
ScrCmd_choosecontestmon: @ 0x0809B07C
	push {lr}
	bl sub_080F8D08
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_choosecontestmon

	thumb_func_start ScrCmd_contestlinktransfer
ScrCmd_contestlinktransfer: @ 0x0809B08C
	push {lr}
	ldr r0, _0809B0A0
	ldrb r0, [r0]
	bl sub_080F8D48
	bl ScriptContext1_Stop
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0809B0A0: .4byte 0x02039BCC
	thumb_func_end ScrCmd_contestlinktransfer

	thumb_func_start ScrCmd_dofieldeffect
ScrCmd_dofieldeffect: @ 0x0809B0A4
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0809B0C8
	strh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FieldEffectStart
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809B0C8: .4byte 0x02037270
	thumb_func_end ScrCmd_dofieldeffect

	thumb_func_start ScrCmd_setfieldeffectarg
ScrCmd_setfieldeffectarg: @ 0x0809B0CC
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r1, _0809B0F8
	lsls r4, r4, #2
	adds r4, r4, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B0F8: .4byte 0x020388A8
	thumb_func_end ScrCmd_setfieldeffectarg

	thumb_func_start WaitForFieldEffectFinish
WaitForFieldEffectFinish: @ 0x0809B0FC
	push {lr}
	ldr r0, _0809B110
	ldrb r0, [r0]
	bl FieldEffectActiveListContains
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B114
	movs r0, #0
	b _0809B116
	.align 2, 0
_0809B110: .4byte 0x02037270
_0809B114:
	movs r0, #1
_0809B116:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end WaitForFieldEffectFinish

	thumb_func_start ScrCmd_waitfieldeffect
ScrCmd_waitfieldeffect: @ 0x0809B11C
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	ldr r1, _0809B140
	strh r0, [r1]
	ldr r1, _0809B144
	adds r0, r4, #0
	bl SetupNativeScript
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B140: .4byte 0x02037270
_0809B144: .4byte 0x0809B0FD
	thumb_func_end ScrCmd_waitfieldeffect

	thumb_func_start ScrCmd_setrespawn
ScrCmd_setrespawn: @ 0x0809B148
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetLastHealLocationWarp
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setrespawn

	thumb_func_start ScrCmd_checkplayergender
ScrCmd_checkplayergender: @ 0x0809B164
	ldr r1, _0809B174
	ldr r0, _0809B178
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	strh r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0809B174: .4byte 0x02037290
_0809B178: .4byte 0x03005AF0
	thumb_func_end ScrCmd_checkplayergender

	thumb_func_start ScrCmd_playmoncry
ScrCmd_playmoncry: @ 0x0809B17C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl PlayCry5
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playmoncry

	thumb_func_start ScrCmd_waitdooranim
ScrCmd_waitdooranim: @ 0x0809B1B4
	push {lr}
	ldr r1, _0809B1C4
	bl SetupNativeScript
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0809B1C4: .4byte 0x080A2F41
	thumb_func_end ScrCmd_waitdooranim

	thumb_func_start ScrCmd_setmetatile
ScrCmd_setmetatile: @ 0x0809B1C8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	adds r1, r6, #7
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	adds r1, r5, #7
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r0, #0
	bne _0809B22C
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl MapGridSetMetatileIdAt
	b _0809B23E
_0809B22C:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	adds r2, r7, #0
	orrs r2, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl MapGridSetMetatileIdAt
_0809B23E:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_setmetatile

	thumb_func_start ScrCmd_opendoor
ScrCmd_opendoor: @ 0x0809B248
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	adds r5, #7
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	adds r4, r4, r0
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetDoorSoundEffect
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl PlaySE
	adds r0, r5, #0
	adds r1, r4, #0
	bl FieldAnimateDoorOpen
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_opendoor

	thumb_func_start ScrCmd_closedoor
ScrCmd_closedoor: @ 0x0809B2A0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x10
	adds r4, #7
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl FieldAnimateDoorClose
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_closedoor

	thumb_func_start IsDoorAnimationStopped
IsDoorAnimationStopped: @ 0x0809B2E4
	push {lr}
	bl FieldIsDoorAnimationRunning
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B2F4
	movs r0, #0
	b _0809B2F6
_0809B2F4:
	movs r0, #1
_0809B2F6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsDoorAnimationStopped

	thumb_func_start ScrCmd_waitmoncry
ScrCmd_waitmoncry: @ 0x0809B2FC
	push {lr}
	ldr r1, _0809B30C
	bl SetupNativeScript
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0809B30C: .4byte 0x0809B2E5
	thumb_func_end ScrCmd_waitmoncry

	thumb_func_start ScrCmd_setdooropen
ScrCmd_setdooropen: @ 0x0809B310
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x10
	adds r4, #7
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl FieldSetDoorOpened
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdooropen

	thumb_func_start ScrCmd_setdoorclosed
ScrCmd_setdoorclosed: @ 0x0809B354
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r1, r0, #0
	lsls r1, r1, #0x10
	adds r4, #7
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0xb
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl FieldSetDoorClosed
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdoorclosed

	thumb_func_start ScrCmd_addelevmenuitem
ScrCmd_addelevmenuitem: @ 0x0809B398
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r0, r4, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_addelevmenuitem

	thumb_func_start ScrCmd_drawbox
ScrCmd_drawbox: @ 0x0809B3D4
	movs r0, #0
	bx lr
	thumb_func_end ScrCmd_drawbox

	thumb_func_start ScrCmd_checkcoins
ScrCmd_checkcoins: @ 0x0809B3D8
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetVarPointer
	adds r4, r0, #0
	bl GetCoins
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_checkcoins

	thumb_func_start ScrCmd_givecoins
ScrCmd_givecoins: @ 0x0809B3F8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GiveCoins
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809B420
	ldr r1, _0809B41C
	movs r0, #0
	b _0809B424
	.align 2, 0
_0809B41C: .4byte 0x02037290
_0809B420:
	ldr r1, _0809B42C
	movs r0, #1
_0809B424:
	strh r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809B42C: .4byte 0x02037290
	thumb_func_end ScrCmd_givecoins

	thumb_func_start ScrCmd_takecoins
ScrCmd_takecoins: @ 0x0809B430
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl TakeCoins
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809B458
	ldr r1, _0809B454
	movs r0, #0
	b _0809B45C
	.align 2, 0
_0809B454: .4byte 0x02037290
_0809B458:
	ldr r1, _0809B464
	movs r0, #1
_0809B45C:
	strh r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809B464: .4byte 0x02037290
	thumb_func_end ScrCmd_takecoins

	thumb_func_start ScrCmd_mossdeepgym1
ScrCmd_mossdeepgym1: @ 0x0809B468
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MossdeepGym_MoveEvents
	ldr r1, _0809B488
	strh r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809B488: .4byte 0x0203726A
	thumb_func_end ScrCmd_mossdeepgym1

	thumb_func_start sub_0809B48C
sub_0809B48C: @ 0x0809B48C
	push {lr}
	bl MossdeepGym_TurnEvents
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end sub_0809B48C

	thumb_func_start ScrCmd_mossdeepgym3
ScrCmd_mossdeepgym3: @ 0x0809B498
	push {lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl InitMossdeepGymTiles
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_mossdeepgym3

	thumb_func_start ScrCmd_buffercontesttype
ScrCmd_buffercontesttype: @ 0x0809B4B4
	push {lr}
	bl FinishMossdeepGymTiles
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_buffercontesttype

	thumb_func_start ScrCmd_cmdD8
ScrCmd_cmdD8: @ 0x0809B4C0
	push {lr}
	bl GetCurrentApproachingTrainerEventObjectId
	ldr r1, _0809B4D0
	strb r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0809B4D0: .4byte 0x03005B50
	thumb_func_end ScrCmd_cmdD8

	thumb_func_start ScrCmd_cmdD9
ScrCmd_cmdD9: @ 0x0809B4D4
	push {r4, lr}
	adds r4, r0, #0
	bl IsUpdateLinkStateCBActive
	cmp r0, #0
	beq _0809B4E4
	movs r0, #0
	b _0809B508
_0809B4E4:
	ldr r2, _0809B510
	ldr r0, _0809B514
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809B506
	bl sub_08097FB8
	ldr r1, _0809B518
	adds r0, r4, #0
	bl SetupNativeScript
_0809B506:
	movs r0, #1
_0809B508:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B510: .4byte 0x02036FF0
_0809B514: .4byte 0x03005B50
_0809B518: .4byte 0x080980BD
	thumb_func_end ScrCmd_cmdD9

	thumb_func_start ScrCmd_setmonobedient
ScrCmd_setmonobedient: @ 0x0809B51C
	push {lr}
	sub sp, #4
	movs r2, #1
	mov r1, sp
	strb r2, [r1]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0809B550
	adds r0, r0, r1
	movs r1, #0x50
	mov r2, sp
	bl SetMonData
	movs r0, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0809B550: .4byte 0x02024190
	thumb_func_end ScrCmd_setmonobedient

	thumb_func_start ScrCmd_checkmonobedience
ScrCmd_checkmonobedience: @ 0x0809B554
	push {r4, lr}
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0809B584
	movs r1, #0x64
	muls r0, r1, r0
	ldr r1, _0809B588
	adds r0, r0, r1
	movs r1, #0x50
	movs r2, #0
	bl GetMonData
	strh r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B584: .4byte 0x02037290
_0809B588: .4byte 0x02024190
	thumb_func_end ScrCmd_checkmonobedience

	thumb_func_start ScrCmd_gotoram
ScrCmd_gotoram: @ 0x0809B58C
	push {r4, lr}
	adds r4, r0, #0
	bl GetSavedRamScriptIfValid
	adds r2, r0, #0
	cmp r2, #0
	beq _0809B5A8
	ldr r1, _0809B5B0
	ldr r0, [r4, #8]
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r2, #0
	bl ScriptJump
_0809B5A8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B5B0: .4byte 0x02037260
	thumb_func_end ScrCmd_gotoram

	thumb_func_start ScrCmd_warpD1
ScrCmd_warpD1: @ 0x0809B5B4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetWarpDestination
	bl GetPlayerFacingDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0808C9E4
	bl sub_080AFB40
	bl ResetInitialPlayerAvatarState
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_warpD1

	thumb_func_start ScrCmd_setmonmetlocation
ScrCmd_setmonmetlocation: @ 0x0809B648
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [r4, #8]
	ldrb r2, [r0]
	mov r1, sp
	strb r2, [r1]
	adds r0, #1
	str r0, [r4, #8]
	cmp r3, #5
	bhi _0809B67E
	movs r0, #0x64
	muls r0, r3, r0
	ldr r1, _0809B688
	adds r0, r0, r1
	movs r1, #0x23
	mov r2, sp
	bl SetMonData
_0809B67E:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B688: .4byte 0x02024190
	thumb_func_end ScrCmd_setmonmetlocation

	thumb_func_start ScrCmd_bufferitemnameplural
ScrCmd_bufferitemnameplural: @ 0x0809B68C
	push {r4, lr}
	ldr r4, _0809B6A4
	ldrb r0, [r4]
	movs r1, #1
	bl DrawStdWindowFrame
	ldrb r0, [r4]
	bl RemoveWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B6A4: .4byte 0x03000F30
	thumb_func_end ScrCmd_bufferitemnameplural

	thumb_func_start ScrCmd_buffertrainerclassname
ScrCmd_buffertrainerclassname: @ 0x0809B6A8
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0809B6E0
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r4, [r4]
	bl GetTrainerClassNameFromId
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B6E0: .4byte 0x084E8918
	thumb_func_end ScrCmd_buffertrainerclassname

	thumb_func_start ScrCmd_buffertrainername
ScrCmd_buffertrainername: @ 0x0809B6E4
	push {r4, lr}
	ldr r1, [r0, #8]
	ldrb r4, [r1]
	adds r1, #1
	str r1, [r0, #8]
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0809B71C
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r4, [r4]
	bl sub_0806EB38
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B71C: .4byte 0x084E8918
	thumb_func_end ScrCmd_buffertrainername

	thumb_func_start sub_0809B720
sub_0809B720: @ 0x0809B720
	ldr r1, _0809B728
	strh r0, [r1]
	bx lr
	.align 2, 0
_0809B728: .4byte 0x0203726A
	thumb_func_end sub_0809B720

	thumb_func_start ScrCmd_warpE0
ScrCmd_warpE0: @ 0x0809B72C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldrb r1, [r0]
	mov sb, r1
	adds r0, #1
	str r0, [r5, #8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0, #1]
	adds r1, #1
	str r1, [r5, #8]
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl ScriptReadHalfword
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl VarGet
	mov r1, sb
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov r1, r8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r1
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	mov r0, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetWarpDestination
	bl sub_080AF098
	bl ResetInitialPlayerAvatarState
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScrCmd_warpE0

