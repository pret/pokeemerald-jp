.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CreateLoopedTask
CreateLoopedTask: @ 0x081C6838
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl IsUpdateLinkStateCBActive
	cmp r0, #0
	bne _081C6850
	ldr r0, _081C684C
	b _081C6852
	.align 2, 0
_081C684C: .4byte 0x081C6931
_081C6850:
	ldr r0, _081C688C
_081C6852:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl CreateTask
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	bl SetWordTaskArg
	ldr r1, _081C6890
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, _081C6894
	ldrb r1, [r2]
	strh r1, [r0, #0xe]
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	orrs r0, r4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_081C688C: .4byte 0x081C69A5
_081C6890: .4byte 0x03005B60
_081C6894: .4byte 0x0203CC08
	thumb_func_end CreateLoopedTask

	thumb_func_start IsLoopedTaskActive
IsLoopedTaskActive: @ 0x081C6898
	push {lr}
	ldr r1, _081C68CC
	ands r1, r0
	lsrs r3, r0, #0x10
	ldr r2, _081C68D0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _081C68DC
	ldr r2, [r1]
	ldr r0, _081C68D4
	cmp r2, r0
	beq _081C68BE
	ldr r0, _081C68D8
	cmp r2, r0
	bne _081C68DC
_081C68BE:
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bne _081C68DC
	movs r0, #1
	b _081C68DE
	.align 2, 0
_081C68CC: .4byte 0x0000FFFF
_081C68D0: .4byte 0x03005B60
_081C68D4: .4byte 0x081C6931
_081C68D8: .4byte 0x081C69A5
_081C68DC:
	movs r0, #0
_081C68DE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsLoopedTaskActive

	thumb_func_start FuncIsActiveLoopedTask
FuncIsActiveLoopedTask: @ 0x081C68E4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _081C6914
_081C68EC:
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _081C6920
	ldr r1, [r4]
	ldr r0, _081C6918
	cmp r1, r0
	beq _081C6900
	ldr r0, _081C691C
	cmp r1, r0
	bne _081C6920
_081C6900:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl GetWordTaskArg
	cmp r0, r6
	bne _081C6920
	movs r0, #1
	b _081C692A
	.align 2, 0
_081C6914: .4byte 0x03005B60
_081C6918: .4byte 0x081C6931
_081C691C: .4byte 0x081C69A5
_081C6920:
	adds r4, #0x28
	adds r5, #1
	cmp r5, #0xf
	ble _081C68EC
	movs r0, #0
_081C692A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end FuncIsActiveLoopedTask

	thumb_func_start Task_RunLoopedTask
Task_RunLoopedTask: @ 0x081C6930
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	movs r1, #1
	bl GetWordTaskArg
	adds r6, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C6964
	adds r4, r0, r1
	movs r7, #0
_081C694C:
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl _call_via_r6
	cmp r0, #4
	bhi _081C6996
	lsls r0, r0, #2
	ldr r1, _081C6968
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C6964: .4byte 0x03005B68
_081C6968: .4byte 0x081C696C
_081C696C: @ jump table
	.4byte _081C6986 @ case 0
	.4byte _081C6980 @ case 1
	.4byte _081C699E @ case 2
	.4byte _081C699A @ case 3
	.4byte _081C698E @ case 4
_081C6980:
	ldrh r0, [r4]
	adds r0, #1
	b _081C6998
_081C6986:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _081C699E
_081C698E:
	adds r0, r5, #0
	bl DestroyTask
	b _081C699E
_081C6996:
	subs r0, #5
_081C6998:
	strh r0, [r4]
_081C699A:
	cmp r7, #0
	beq _081C694C
_081C699E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end Task_RunLoopedTask

	thumb_func_start Task_RunLoopedTask_LinkMode
Task_RunLoopedTask_LinkMode: @ 0x081C69A4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_08086EFC
	cmp r0, #0
	bne _081C6A0A
	adds r0, r5, #0
	movs r1, #1
	bl GetWordTaskArg
	adds r2, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _081C69DC
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl _call_via_r2
	cmp r0, #4
	bhi _081C6A06
	lsls r0, r0, #2
	ldr r1, _081C69E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C69DC: .4byte 0x03005B68
_081C69E0: .4byte 0x081C69E4
_081C69E4: @ jump table
	.4byte _081C69F8 @ case 0
	.4byte _081C69F8 @ case 1
	.4byte _081C6A0A @ case 2
	.4byte _081C6A0A @ case 3
	.4byte _081C69FE @ case 4
_081C69F8:
	ldrh r0, [r4]
	adds r0, #1
	b _081C6A08
_081C69FE:
	adds r0, r5, #0
	bl DestroyTask
	b _081C6A0A
_081C6A06:
	subs r0, #5
_081C6A08:
	strh r0, [r4]
_081C6A0A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end Task_RunLoopedTask_LinkMode

	thumb_func_start CB2_InitPokeNav
CB2_InitPokeNav: @ 0x081C6A10
	push {r4, lr}
	ldr r4, _081C6A28
	movs r0, #0x5c
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	bne _081C6A30
	ldr r0, _081C6A2C
	bl SetMainCallback2
	b _081C6A52
	.align 2, 0
_081C6A28: .4byte 0x0203CC0C
_081C6A2C: .4byte 0x08085AFD
_081C6A30:
	bl InitPokenavResources
	bl ResetTasks
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, _081C6A58
	movs r1, #0
	bl CreateTask
	ldr r0, _081C6A5C
	bl SetMainCallback2
	ldr r0, _081C6A60
	bl SetVBlankCallback
_081C6A52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C6A58: .4byte 0x081C6BED
_081C6A5C: .4byte 0x081C6BC1
_081C6A60: .4byte 0x081C6BD9
	thumb_func_end CB2_InitPokeNav

	thumb_func_start sub_081C6A64
sub_081C6A64: @ 0x081C6A64
	push {lr}
	ldr r0, _081C6A78
	bl SetMainCallback2
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	pop {r0}
	bx r0
	.align 2, 0
_081C6A78: .4byte 0x081C6A7D
	thumb_func_end sub_081C6A64

	thumb_func_start sub_081C6A7C
sub_081C6A7C: @ 0x081C6A7C
	push {r4, lr}
	bl UpdatePaletteFade
	ldr r0, _081C6AA4
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081C6AE0
	ldr r4, _081C6AA8
	movs r0, #0x5c
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	bne _081C6AB0
	ldr r0, _081C6AAC
	bl SetMainCallback2
	b _081C6AE0
	.align 2, 0
_081C6AA4: .4byte 0x02037C74
_081C6AA8: .4byte 0x0203CC0C
_081C6AAC: .4byte 0x08085B35
_081C6AB0:
	bl InitPokenavResources
	ldr r1, [r4]
	movs r0, #1
	strh r0, [r1, #8]
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, #0
	bl SetVBlankCallback
	ldr r0, _081C6AE8
	movs r1, #0
	bl CreateTask
	ldr r0, _081C6AEC
	bl SetMainCallback2
	ldr r0, _081C6AF0
	bl SetVBlankCallback
_081C6AE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C6AE8: .4byte 0x081C6BED
_081C6AEC: .4byte 0x081C6BC1
_081C6AF0: .4byte 0x081C6BD9
	thumb_func_end sub_081C6A7C

	thumb_func_start FreePokenavResources
FreePokenavResources: @ 0x081C6AF4
	push {r4, lr}
	movs r4, #0
_081C6AF8:
	adds r0, r4, #0
	bl FreePokenavSubstruct
	adds r4, #1
	cmp r4, #0x12
	ble _081C6AF8
	ldr r4, _081C6B1C
	ldr r0, [r4]
	bl Free
	movs r0, #0
	str r0, [r4]
	bl InitKeys
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081C6B1C: .4byte 0x0203CC0C
	thumb_func_end FreePokenavResources

	thumb_func_start InitPokenavResources
InitPokenavResources: @ 0x081C6B20
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	movs r1, #0x12
	adds r0, #0x58
_081C6B2A:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _081C6B2A
	movs r4, #0
	strh r4, [r5, #8]
	str r4, [r5, #4]
	bl AnyMonHasRibbon
	str r0, [r5, #0xc]
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end InitPokenavResources

	thumb_func_start AnyMonHasRibbon
AnyMonHasRibbon: @ 0x081C6B48
	push {r4, r5, r6, lr}
	movs r5, #0
_081C6B4C:
	movs r0, #0x64
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _081C6BA8
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #5
	bl GetMonData
	cmp r0, #0
	beq _081C6B7A
	adds r0, r4, #0
	movs r1, #6
	bl GetMonData
	cmp r0, #0
	bne _081C6B7A
	adds r0, r4, #0
	movs r1, #0x52
	bl GetMonData
	cmp r0, #0
	bne _081C6BA2
_081C6B7A:
	adds r5, #1
	cmp r5, #5
	ble _081C6B4C
	movs r4, #0
_081C6B82:
	movs r5, #0
	lsls r6, r4, #0x18
_081C6B86:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CheckBoxMonSanityAt
	cmp r0, #0
	beq _081C6BAC
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r6, #0x18
	movs r2, #0x52
	bl GetBoxMonDataAt
	cmp r0, #0
	beq _081C6BAC
_081C6BA2:
	movs r0, #1
	b _081C6BBA
	.align 2, 0
_081C6BA8: .4byte 0x02024190
_081C6BAC:
	adds r5, #1
	cmp r5, #0x1d
	ble _081C6B86
	adds r4, #1
	cmp r4, #0xd
	ble _081C6B82
	movs r0, #0
_081C6BBA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end AnyMonHasRibbon

	thumb_func_start CB2_Pokenav
CB2_Pokenav: @ 0x081C6BC0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CB2_Pokenav

	thumb_func_start VBlankCB_Pokenav
VBlankCB_Pokenav: @ 0x081C6BD8
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCB_Pokenav

	thumb_func_start sub_081C6BEC
sub_081C6BEC: @ 0x081C6BEC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _081C6C10
	adds r7, r1, r0
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #5
	bls _081C6C06
	b _081C6D22
_081C6C06:
	lsls r0, r0, #2
	ldr r1, _081C6C14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081C6C10: .4byte 0x03005B68
_081C6C14: .4byte 0x081C6C18
_081C6C18: @ jump table
	.4byte _081C6C30 @ case 0
	.4byte _081C6C3A @ case 1
	.4byte _081C6C50 @ case 2
	.4byte _081C6C5C @ case 3
	.4byte _081C6CDE @ case 4
	.4byte _081C6CEC @ case 5
_081C6C30:
	bl InitPokenavMainMenu
	movs r0, #1
	strh r0, [r7]
	b _081C6D22
_081C6C3A:
	bl PokenavMainMenuLoopedTaskIsActive
	cmp r0, #0
	bne _081C6D22
	ldr r0, _081C6C4C
	bl CanViewRibbonsMenu
	b _081C6CA8
	.align 2, 0
_081C6C4C: .4byte 0x000186A0
_081C6C50:
	bl sub_081C702C
	cmp r0, #0
	bne _081C6D22
	movs r0, #3
	strh r0, [r7]
_081C6C5C:
	bl sub_081C6DA0
	adds r6, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	beq _081C6CBC
	ldr r0, _081C6CB0
	cmp r6, r0
	bls _081C6CC6
	ldr r4, _081C6CB4
	ldr r5, _081C6CB8
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0x14
	adds r0, r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r6, #0
	bl CanViewRibbonsMenu
	cmp r0, #0
	beq _081C6CBC
_081C6CA8:
	movs r0, #4
	strh r0, [r7]
	b _081C6D22
	.align 2, 0
_081C6CB0: .4byte 0x0001869F
_081C6CB4: .4byte 0x085EF83C
_081C6CB8: .4byte 0x0203CC0C
_081C6CBC:
	bl ShutdownPokenav
	movs r0, #5
	strh r0, [r7]
	b _081C6D22
_081C6CC6:
	cmp r6, #0
	beq _081C6D22
	adds r0, r6, #0
	bl sub_081C7010
	bl sub_081C702C
	cmp r0, #0
	beq _081C6D22
	movs r0, #2
	strh r0, [r7]
	b _081C6D22
_081C6CDE:
	bl sub_081C6D94
	cmp r0, #0
	bne _081C6D22
	movs r0, #3
	strh r0, [r7]
	b _081C6D22
_081C6CEC:
	bl WaitForPokenavShutdownFade
	cmp r0, #0
	bne _081C6D22
	ldr r0, _081C6D14
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	bl sub_081C8BDC
	bl FreePokenavResources
	cmp r4, #0
	beq _081C6D1C
	ldr r0, _081C6D18
	bl SetMainCallback2
	b _081C6D22
	.align 2, 0
_081C6D14: .4byte 0x0203CC0C
_081C6D18: .4byte 0x08085B35
_081C6D1C:
	ldr r0, _081C6D28
	bl SetMainCallback2
_081C6D22:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081C6D28: .4byte 0x08085AFD
	thumb_func_end sub_081C6BEC

	thumb_func_start CanViewRibbonsMenu
CanViewRibbonsMenu: @ 0x081C6D2C
	push {r4, r5, r6, lr}
	ldr r1, _081C6D80
	adds r6, r0, r1
	bl SetVBlankCallback_
	ldr r5, _081C6D84
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r4, r0, #2
	adds r0, r4, r5
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	thumb_func_end CanViewRibbonsMenu

	thumb_func_start SetActivePokenavMenu
SetActivePokenavMenu: @ 0x081C6D48
	beq _081C6D8C
	adds r0, r5, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	beq _081C6D8C
	adds r0, r5, #0
	adds r0, #0xc
	adds r0, r4, r0
	ldr r0, [r0]
	adds r1, r5, #0
	adds r1, #0x10
	adds r1, r4, r1
	ldr r1, [r1]
	bl sub_081C6FF4
	ldr r0, _081C6D88
	ldr r1, [r0]
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r1]
	str r6, [r1, #4]
	movs r0, #1
	b _081C6D8E
	.align 2, 0
_081C6D80: .4byte 0xFFFE7960
_081C6D84: .4byte 0x085EF83C
_081C6D88: .4byte 0x0203CC0C
_081C6D8C:
	movs r0, #0
_081C6D8E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end SetActivePokenavMenu

	thumb_func_start sub_081C6D94
sub_081C6D94: @ 0x081C6D94
	push {lr}
	bl sub_081C702C
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_081C6D94

	thumb_func_start sub_081C6DA0
sub_081C6DA0: @ 0x081C6DA0
	push {lr}
	ldr r0, _081C6DB0
	ldr r0, [r0]
	ldr r0, [r0]
	bl _call_via_r0
	thumb_func_end sub_081C6DA0

	thumb_func_start sub_081C6DAC
sub_081C6DAC: @ 0x081C6DAC
	pop {r1}
	bx r1
	.align 2, 0
_081C6DB0: .4byte 0x0203CC0C
	thumb_func_end sub_081C6DAC

	thumb_func_start SetVBlankCallback_
SetVBlankCallback_: @ 0x081C6DB4
	push {lr}
	bl InitKeys
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetVBlankCallback_

	thumb_func_start InitKeys_
InitKeys_: @ 0x081C6DC0
	push {lr}
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end InitKeys_

	thumb_func_start SetPokenavVBlankCallback
SetPokenavVBlankCallback: @ 0x081C6DCC
	push {lr}
	ldr r0, _081C6DD8
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_081C6DD8: .4byte 0x081C6BD9
	thumb_func_end SetPokenavVBlankCallback

	thumb_func_start AllocSubstruct
AllocSubstruct: @ 0x081C6DDC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl Alloc
	ldr r1, _081C6DF8
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #0x10
	adds r1, r1, r4
	str r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081C6DF8: .4byte 0x0203CC0C
	thumb_func_end AllocSubstruct

	thumb_func_start GetSubstructPtr
GetSubstructPtr: @ 0x081C6DFC
	ldr r1, _081C6E0C
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r1, #0x10
	adds r1, r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_081C6E0C: .4byte 0x0203CC0C
	thumb_func_end GetSubstructPtr

	thumb_func_start FreePokenavSubstruct
FreePokenavSubstruct: @ 0x081C6E10
	push {r4, r5, lr}
	ldr r5, _081C6E38
	ldr r1, [r5]
	lsls r4, r0, #2
	adds r1, #0x10
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _081C6E30
	bl Free
	ldr r0, [r5]
	adds r0, #0x10
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_081C6E30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081C6E38: .4byte 0x0203CC0C
	thumb_func_end FreePokenavSubstruct

	thumb_func_start GetPokenavMode
GetPokenavMode: @ 0x081C6E3C
	ldr r0, _081C6E44
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	bx lr
	.align 2, 0
_081C6E44: .4byte 0x0203CC0C
	thumb_func_end GetPokenavMode

	thumb_func_start SetPokenavMode
SetPokenavMode: @ 0x081C6E48
	ldr r1, _081C6E50
	ldr r1, [r1]
	strh r0, [r1, #8]
	bx lr
	.align 2, 0
_081C6E50: .4byte 0x0203CC0C
	thumb_func_end SetPokenavMode

	thumb_func_start sub_081C6E54
sub_081C6E54: @ 0x081C6E54
	push {lr}
	adds r1, r0, #0
	cmp r1, #4
	bls _081C6E5E
	movs r1, #0
_081C6E5E:
	ldr r0, _081C6E68
	ldr r0, [r0]
	strh r1, [r0, #0xa]
	pop {r0}
	bx r0
	.align 2, 0
_081C6E68: .4byte 0x0203CC0C
	thumb_func_end sub_081C6E54

	thumb_func_start sub_081C6E6C
sub_081C6E6C: @ 0x081C6E6C
	ldr r0, _081C6E74
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	bx lr
	.align 2, 0
_081C6E74: .4byte 0x0203CC0C
	thumb_func_end sub_081C6E6C

	thumb_func_start sub_081C6E78
sub_081C6E78: @ 0x081C6E78
	ldr r0, _081C6E80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bx lr
	.align 2, 0
_081C6E80: .4byte 0x0203CC0C
	thumb_func_end sub_081C6E78

