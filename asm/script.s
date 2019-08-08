.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitScriptContext
InitScriptContext: @ 0x08098640
	push {lr}
	adds r3, r0, #0
	movs r0, #0
	strb r0, [r3, #1]
	str r0, [r3, #8]
	strb r0, [r3]
	str r0, [r3, #4]
	str r1, [r3, #0x5c]
	str r2, [r3, #0x60]
	movs r2, #0
	movs r1, #3
	adds r0, r3, #0
	adds r0, #0x70
_0809865A:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0809865A
	adds r1, r3, #0
	adds r1, #0xc
	movs r2, #0
	adds r0, r3, #0
	adds r0, #0x58
_0809866E:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0809866E
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitScriptContext

	thumb_func_start SetupBytecodeScript
SetupBytecodeScript: @ 0x0809867C
	str r1, [r0, #8]
	movs r1, #1
	strb r1, [r0, #1]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end SetupBytecodeScript

	thumb_func_start SetupNativeScript
SetupNativeScript: @ 0x08098688
	movs r2, #2
	strb r2, [r0, #1]
	str r1, [r0, #4]
	bx lr
	thumb_func_end SetupNativeScript

	thumb_func_start StopScript
StopScript: @ 0x08098690
	movs r1, #0
	strb r1, [r0, #1]
	str r1, [r0, #8]
	bx lr
	thumb_func_end StopScript

	thumb_func_start RunScriptCommand
RunScriptCommand: @ 0x08098698
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080986A6
_080986A2:
	movs r0, #0
	b _08098718
_080986A6:
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _080986DE
	cmp r0, #1
	bgt _080986B6
	cmp r0, #0
	beq _080986A2
	b _08098716
_080986B6:
	cmp r0, #2
	bne _08098716
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080986DA
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08098716
	strb r0, [r4, #1]
	b _08098716
_080986D0:
	strb r2, [r4, #1]
	b _080986A2
_080986D4:
	movs r0, #0
	strb r0, [r4, #1]
	b _08098718
_080986DA:
	movs r0, #1
	strb r0, [r4, #1]
_080986DE:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _080986D0
	ldr r0, _080986F0
	ldr r0, [r0]
	cmp r2, r0
	bne _080986F4
_080986EC:
	svc #2
	b _080986EC
	.align 2, 0
_080986F0: .4byte 0x084E8900
_080986F4:
	ldrb r1, [r2]
	adds r0, r2, #1
	str r0, [r4, #8]
	lsls r1, r1, #2
	ldr r0, [r4, #0x5c]
	adds r1, r0, r1
	ldr r0, [r4, #0x60]
	cmp r1, r0
	bhs _080986D4
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080986DE
_08098716:
	movs r0, #1
_08098718:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end RunScriptCommand

	thumb_func_start ScriptPush
ScriptPush: @ 0x08098720
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldrb r1, [r2]
	adds r0, r1, #1
	cmp r0, #0x13
	bgt _08098742
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0xc
	adds r1, r1, r0
	str r3, [r1]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r0, #0
	b _08098744
_08098742:
	movs r0, #1
_08098744:
	pop {r1}
	bx r1
	thumb_func_end ScriptPush

	thumb_func_start ScriptPop
ScriptPop: @ 0x08098748
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08098764
	subs r0, #1
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	b _08098766
_08098764:
	movs r0, #0
_08098766:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScriptPop

	thumb_func_start ScriptJump
ScriptJump: @ 0x0809876C
	str r1, [r0, #8]
	bx lr
	thumb_func_end ScriptJump

	thumb_func_start ScriptCall
ScriptCall: @ 0x08098770
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [r4, #8]
	bl ScriptPush
	str r5, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end ScriptCall

	thumb_func_start ScriptReturn
ScriptReturn: @ 0x08098784
	push {r4, lr}
	adds r4, r0, #0
	bl ScriptPop
	str r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ScriptReturn

	thumb_func_start ScriptReadHalfword
ScriptReadHalfword: @ 0x08098794
	adds r3, r0, #0
	ldr r2, [r3, #8]
	ldrb r0, [r2]
	adds r2, #1
	str r2, [r3, #8]
	ldrb r1, [r2]
	lsls r1, r1, #8
	orrs r0, r1
	adds r2, #1
	str r2, [r3, #8]
	bx lr
	.align 2, 0
	thumb_func_end ScriptReadHalfword

	thumb_func_start ScriptReadWord
ScriptReadWord: @ 0x080987AC
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #8]
	ldrb r6, [r0]
	adds r0, #1
	str r0, [r3, #8]
	ldrb r5, [r0]
	adds r2, r0, #1
	str r2, [r3, #8]
	ldrb r4, [r0, #1]
	adds r1, r2, #1
	str r1, [r3, #8]
	ldrb r0, [r2, #1]
	adds r1, #1
	str r1, [r3, #8]
	lsls r0, r0, #8
	adds r0, r0, r4
	lsls r0, r0, #8
	adds r0, r0, r5
	lsls r0, r0, #8
	adds r0, r0, r6
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end ScriptReadWord

	thumb_func_start ScriptContext2_Enable
ScriptContext2_Enable: @ 0x080987DC
	ldr r1, _080987E4
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080987E4: .4byte 0x03000F2C
	thumb_func_end ScriptContext2_Enable

	thumb_func_start ScriptContext2_Disable
ScriptContext2_Disable: @ 0x080987E8
	ldr r1, _080987F0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080987F0: .4byte 0x03000F2C
	thumb_func_end ScriptContext2_Disable

	thumb_func_start ScriptContext2_IsEnabled
ScriptContext2_IsEnabled: @ 0x080987F4
	ldr r0, _080987FC
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080987FC: .4byte 0x03000F2C
	thumb_func_end ScriptContext2_IsEnabled

	thumb_func_start ScriptContext1_IsScriptSetUp
ScriptContext1_IsScriptSetUp: @ 0x08098800
	push {lr}
	ldr r0, _08098810
	ldrb r0, [r0]
	cmp r0, #0
	beq _08098814
	movs r0, #0
	b _08098816
	.align 2, 0
_08098810: .4byte 0x03000E38
_08098814:
	movs r0, #1
_08098816:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ScriptContext1_IsScriptSetUp

	thumb_func_start ScriptContext1_Init
ScriptContext1_Init: @ 0x0809881C
	push {lr}
	ldr r0, _08098834
	ldr r1, _08098838
	ldr r2, _0809883C
	bl InitScriptContext
	ldr r1, _08098840
	movs r0, #2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08098834: .4byte 0x03000E40
_08098838: .4byte 0x081DABAC
_0809883C: .4byte 0x081DAF30
_08098840: .4byte 0x03000E38
	thumb_func_end ScriptContext1_Init

	thumb_func_start ScriptContext2_RunScript
ScriptContext2_RunScript: @ 0x08098844
	push {r4, lr}
	ldr r4, _08098868
	ldrb r0, [r4]
	cmp r0, #2
	beq _08098878
	cmp r0, #1
	beq _08098878
	bl ScriptContext2_Enable
	ldr r0, _0809886C
	bl RunScriptCommand
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098870
	movs r0, #1
	b _0809887A
	.align 2, 0
_08098868: .4byte 0x03000E38
_0809886C: .4byte 0x03000E40
_08098870:
	movs r0, #2
	strb r0, [r4]
	bl ScriptContext2_Disable
_08098878:
	movs r0, #0
_0809887A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScriptContext2_RunScript

	thumb_func_start ScriptContext1_SetupScript
ScriptContext1_SetupScript: @ 0x08098880
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080988A8
	ldr r1, _080988AC
	ldr r2, _080988B0
	adds r0, r4, #0
	bl InitScriptContext
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetupBytecodeScript
	bl ScriptContext2_Enable
	ldr r1, _080988B4
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080988A8: .4byte 0x03000E40
_080988AC: .4byte 0x081DABAC
_080988B0: .4byte 0x081DAF30
_080988B4: .4byte 0x03000E38
	thumb_func_end ScriptContext1_SetupScript

	thumb_func_start ScriptContext1_Stop
ScriptContext1_Stop: @ 0x080988B8
	ldr r1, _080988C0
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080988C0: .4byte 0x03000E38
	thumb_func_end ScriptContext1_Stop

	thumb_func_start EnableBothScriptContexts
EnableBothScriptContexts: @ 0x080988C4
	push {lr}
	ldr r1, _080988D4
	movs r0, #0
	strb r0, [r1]
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_080988D4: .4byte 0x03000E38
	thumb_func_end EnableBothScriptContexts

	thumb_func_start ScriptContext2_RunNewScript
ScriptContext2_RunNewScript: @ 0x080988D8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08098904
	ldr r1, _08098908
	ldr r2, _0809890C
	adds r0, r4, #0
	bl InitScriptContext
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetupBytecodeScript
_080988F0:
	ldr r0, _08098904
	bl RunScriptCommand
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080988F0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098904: .4byte 0x03000EB8
_08098908: .4byte 0x081DABAC
_0809890C: .4byte 0x081DAF30
	thumb_func_end ScriptContext2_RunNewScript

	thumb_func_start MapHeaderGetScriptTable
MapHeaderGetScriptTable: @ 0x08098910
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _08098928
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _08098924
_0809891E:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0809892C
_08098924:
	movs r0, #0
	b _0809894A
	.align 2, 0
_08098928: .4byte 0x02036FB8
_0809892C:
	cmp r0, r1
	beq _08098934
	adds r2, #5
	b _0809891E
_08098934:
	adds r2, #1
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	ldrb r1, [r2, #2]
	lsls r1, r1, #0x10
	adds r0, r0, r1
	ldrb r1, [r2, #3]
	lsls r1, r1, #0x18
	adds r0, r0, r1
_0809894A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MapHeaderGetScriptTable

	thumb_func_start MapHeaderRunScriptType
MapHeaderRunScriptType: @ 0x08098950
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MapHeaderGetScriptTable
	cmp r0, #0
	beq _08098962
	bl ScriptContext2_RunNewScript
_08098962:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MapHeaderRunScriptType

	thumb_func_start MapHeaderCheckScriptTable
MapHeaderCheckScriptTable: @ 0x08098968
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl MapHeaderGetScriptTable
	adds r6, r0, #0
	cmp r6, #0
	beq _08098984
_08098978:
	ldrb r1, [r6]
	ldrb r0, [r6, #1]
	lsls r0, r0, #8
	orrs r1, r0
	cmp r1, #0
	bne _08098988
_08098984:
	movs r0, #0
	b _080989C2
_08098988:
	adds r6, #2
	ldrb r5, [r6]
	ldrb r0, [r6, #1]
	lsls r0, r0, #8
	orrs r5, r0
	adds r6, #2
	adds r0, r1, #0
	bl VarGet
	adds r4, r0, #0
	adds r0, r5, #0
	bl VarGet
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	beq _080989AE
	adds r6, #4
	b _08098978
_080989AE:
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	lsls r1, r1, #8
	adds r0, r0, r1
	ldrb r1, [r6, #2]
	lsls r1, r1, #0x10
	adds r0, r0, r1
	ldrb r1, [r6, #3]
	lsls r1, r1, #0x18
	adds r0, r0, r1
_080989C2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end MapHeaderCheckScriptTable

	thumb_func_start RunOnLoadMapScript
RunOnLoadMapScript: @ 0x080989C8
	push {lr}
	movs r0, #1
	bl MapHeaderRunScriptType
	pop {r0}
	bx r0
	thumb_func_end RunOnLoadMapScript

	thumb_func_start RunOnTransitionMapScript
RunOnTransitionMapScript: @ 0x080989D4
	push {lr}
	movs r0, #3
	bl MapHeaderRunScriptType
	pop {r0}
	bx r0
	thumb_func_end RunOnTransitionMapScript

	thumb_func_start RunOnResumeMapScript
RunOnResumeMapScript: @ 0x080989E0
	push {lr}
	movs r0, #5
	bl MapHeaderRunScriptType
	pop {r0}
	bx r0
	thumb_func_end RunOnResumeMapScript

	thumb_func_start RunOnReturnToFieldMapScript
RunOnReturnToFieldMapScript: @ 0x080989EC
	push {lr}
	movs r0, #7
	bl MapHeaderRunScriptType
	pop {r0}
	bx r0
	thumb_func_end RunOnReturnToFieldMapScript

	thumb_func_start RunOnDiveWarpMapScript
RunOnDiveWarpMapScript: @ 0x080989F8
	push {lr}
	movs r0, #6
	bl MapHeaderRunScriptType
	pop {r0}
	bx r0
	thumb_func_end RunOnDiveWarpMapScript

	thumb_func_start TryRunOnFrameMapScript
TryRunOnFrameMapScript: @ 0x08098A04
	push {lr}
	movs r0, #2
	bl MapHeaderCheckScriptTable
	cmp r0, #0
	beq _08098A18
	bl ScriptContext1_SetupScript
	movs r0, #1
	b _08098A1A
_08098A18:
	movs r0, #0
_08098A1A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryRunOnFrameMapScript

	thumb_func_start TryRunOnWarpIntoMapScript
TryRunOnWarpIntoMapScript: @ 0x08098A20
	push {lr}
	movs r0, #4
	bl MapHeaderCheckScriptTable
	cmp r0, #0
	beq _08098A30
	bl ScriptContext2_RunNewScript
_08098A30:
	pop {r0}
	bx r0
	thumb_func_end TryRunOnWarpIntoMapScript

	thumb_func_start CalculateRamScriptChecksum
CalculateRamScriptChecksum: @ 0x08098A34
	push {lr}
	ldr r0, _08098A50
	ldr r0, [r0]
	ldr r1, _08098A54
	adds r0, r0, r1
	movs r1, #0xfa
	lsls r1, r1, #2
	bl CalcCRC16WithTable
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08098A50: .4byte 0x03005AEC
_08098A54: .4byte 0x0000372C
	thumb_func_end CalculateRamScriptChecksum

	thumb_func_start ClearRamScript
ClearRamScript: @ 0x08098A58
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r0, _08098A78
	ldr r1, [r0]
	ldr r0, _08098A7C
	adds r1, r1, r0
	ldr r2, _08098A80
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098A78: .4byte 0x03005AEC
_08098A7C: .4byte 0x00003728
_08098A80: .4byte 0x050000FB
	thumb_func_end ClearRamScript

	thumb_func_start InitRamScript
InitRamScript: @ 0x08098A84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r0, [sp, #0x24]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08098AE8
	mov sl, r0
	ldr r5, [r0]
	ldr r1, _08098AEC
	adds r4, r5, r1
	bl ClearRamScript
	ldr r0, _08098AF0
	cmp r8, r0
	bhi _08098AFC
	movs r0, #0x33
	strb r0, [r4]
	mov r2, sb
	strb r2, [r4, #1]
	strb r7, [r4, #2]
	strb r6, [r4, #3]
	ldr r1, _08098AF4
	adds r0, r5, r1
	ldr r1, [sp]
	mov r2, r8
	bl memcpy
	bl CalculateRamScriptChecksum
	mov r2, sl
	ldr r1, [r2]
	ldr r2, _08098AF8
	adds r1, r1, r2
	str r0, [r1]
	movs r0, #1
	b _08098AFE
	.align 2, 0
_08098AE8: .4byte 0x03005AEC
_08098AEC: .4byte 0x0000372C
_08098AF0: .4byte 0x000003E3
_08098AF4: .4byte 0x00003730
_08098AF8: .4byte 0x00003728
_08098AFC:
	movs r0, #0
_08098AFE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end InitRamScript

	thumb_func_start GetRamScript
GetRamScript: @ 0x08098B10
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r6, _08098B60
	ldr r5, [r6]
	ldr r0, _08098B64
	adds r2, r5, r0
	ldr r7, _08098B68
	movs r0, #0
	str r0, [r7]
	ldrb r0, [r2]
	cmp r0, #0x33
	bne _08098B78
	ldrb r1, [r2, #1]
	movs r0, #4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _08098B78
	ldrb r1, [r2, #2]
	movs r0, #5
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _08098B78
	ldrb r0, [r2, #3]
	cmp r0, r3
	bne _08098B78
	bl CalculateRamScriptChecksum
	ldr r1, [r6]
	ldr r2, _08098B6C
	adds r1, r1, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _08098B74
	str r4, [r7]
	ldr r1, _08098B70
	adds r0, r5, r1
	b _08098B7A
	.align 2, 0
_08098B60: .4byte 0x03005AEC
_08098B64: .4byte 0x0000372C
_08098B68: .4byte 0x02037260
_08098B6C: .4byte 0x00003728
_08098B70: .4byte 0x00003730
_08098B74:
	bl ClearRamScript
_08098B78:
	adds r0, r4, #0
_08098B7A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetRamScript

	thumb_func_start ValidateSavedRamScript
ValidateSavedRamScript: @ 0x08098B80
	push {r4, lr}
	ldr r4, _08098BB8
	ldr r0, [r4]
	ldr r2, _08098BBC
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0x33
	bne _08098BC4
	ldrb r0, [r1, #1]
	cmp r0, #0xff
	bne _08098BC4
	ldrb r0, [r1, #2]
	cmp r0, #0xff
	bne _08098BC4
	ldrb r0, [r1, #3]
	cmp r0, #0xff
	bne _08098BC4
	bl CalculateRamScriptChecksum
	ldr r1, [r4]
	ldr r2, _08098BC0
	adds r1, r1, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _08098BC4
	movs r0, #1
	b _08098BC6
	.align 2, 0
_08098BB8: .4byte 0x03005AEC
_08098BBC: .4byte 0x0000372C
_08098BC0: .4byte 0x00003728
_08098BC4:
	movs r0, #0
_08098BC6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ValidateSavedRamScript

	thumb_func_start GetSavedRamScriptIfValid
GetSavedRamScriptIfValid: @ 0x08098BCC
	push {r4, r5, r6, lr}
	ldr r6, _08098C0C
	ldr r5, [r6]
	ldr r0, _08098C10
	adds r4, r5, r0
	bl ValidateReceivedWonderCard
	cmp r0, #0
	beq _08098C20
	ldrb r0, [r4]
	cmp r0, #0x33
	bne _08098C20
	ldrb r0, [r4, #1]
	cmp r0, #0xff
	bne _08098C20
	ldrb r0, [r4, #2]
	cmp r0, #0xff
	bne _08098C20
	ldrb r0, [r4, #3]
	cmp r0, #0xff
	bne _08098C20
	bl CalculateRamScriptChecksum
	ldr r1, [r6]
	ldr r2, _08098C14
	adds r1, r1, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _08098C1C
	ldr r1, _08098C18
	adds r0, r5, r1
	b _08098C22
	.align 2, 0
_08098C0C: .4byte 0x03005AEC
_08098C10: .4byte 0x0000372C
_08098C14: .4byte 0x00003728
_08098C18: .4byte 0x00003730
_08098C1C:
	bl ClearRamScript
_08098C20:
	movs r0, #0
_08098C22:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetSavedRamScriptIfValid

	thumb_func_start InitRamScript_NoEventObject
InitRamScript_NoEventObject: @ 0x08098C28
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08098C50
	cmp r1, r0
	bls _08098C3A
	adds r1, r0, #0
_08098C3A:
	movs r0, #0xff
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xff
	movs r3, #0xff
	bl InitRamScript
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098C50: .4byte 0x000003E3
	thumb_func_end InitRamScript_NoEventObject

