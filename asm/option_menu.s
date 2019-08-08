.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start MainCB2
MainCB2: @ 0x08177894
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MainCB2

	thumb_func_start Task_DiplomaFadeIn
Task_DiplomaFadeIn: @ 0x081778AC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _081778D0
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _081778CC
	ldr r0, _081778D4
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, _081778D8
	str r0, [r1]
_081778CC:
	pop {r0}
	bx r0
	.align 2, 0
_081778D0: .4byte 0x02037C74
_081778D4: .4byte 0x03005B60
_081778D8: .4byte 0x081778DD
	thumb_func_end Task_DiplomaFadeIn

	thumb_func_start Task_DiplomaWaitForKeyPress
Task_DiplomaWaitForKeyPress: @ 0x081778DC
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08177918
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0817790E
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	ldr r1, _0817791C
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, _08177920
	str r1, [r0]
_0817790E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08177918: .4byte 0x03002360
_0817791C: .4byte 0x03005B60
_08177920: .4byte 0x08177925
	thumb_func_end Task_DiplomaWaitForKeyPress

	thumb_func_start Task_DiplomaFadeOut
Task_DiplomaFadeOut: @ 0x08177924
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08177954
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0817794E
	ldr r0, _08177958
	ldr r0, [r0]
	bl Free
	bl FreeAllWindowBuffers
	adds r0, r4, #0
	bl DestroyTask
	ldr r0, _0817795C
	bl SetMainCallback2
_0817794E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08177954: .4byte 0x02037C74
_08177958: .4byte 0x0203B9BC
_0817795C: .4byte 0x08085B51
	thumb_func_end Task_DiplomaFadeOut

	thumb_func_start DisplayDiplomaText
DisplayDiplomaText: @ 0x08177960
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _081779D8
	movs r1, #0
	movs r2, #2
	bl PrintDiplomaText
	ldr r1, _081779DC
	mov r0, sp
	bl StringCopy
	movs r2, #0
	ldr r0, _081779E0
	ldr r3, [r0]
_0817797C:
	adds r0, r2, #6
	mov r4, sp
	adds r1, r4, r0
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	bls _0817797C
	adds r0, r2, #6
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sp
	movs r1, #0x30
	movs r2, #2
	bl PrintDiplomaText
	ldr r0, _081779E4
	movs r1, #0x58
	movs r2, #2
	bl PrintDiplomaText
	ldr r0, _081779E8
	movs r1, #0
	movs r2, #0x22
	bl PrintDiplomaText
	bl sub_080BFE9C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081779F0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, _081779EC
	movs r1, #0
	movs r2, #0x22
	bl PrintDiplomaText
	b _08177A02
	.align 2, 0
_081779D8: .4byte 0x085C8BA8
_081779DC: .4byte 0x085C8C00
_081779E0: .4byte 0x03005AF0
_081779E4: .4byte 0x085C8BAE
_081779E8: .4byte 0x085C8BBB
_081779EC: .4byte 0x085C8BB6
_081779F0:
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	ldr r0, _08177A24
	movs r1, #0
	movs r2, #0x22
	bl PrintDiplomaText
_08177A02:
	ldr r0, _08177A28
	movs r1, #0x30
	movs r2, #0x72
	bl PrintDiplomaText
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08177A24: .4byte 0x085C8BB1
_08177A28: .4byte 0x085C8BF2
	thumb_func_end DisplayDiplomaText

	thumb_func_start InitDiplomaBg
InitDiplomaBg: @ 0x08177A2C
	push {lr}
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _08177A7C
	movs r0, #0
	movs r2, #2
	bl InitBgsFromTemplates
	ldr r0, _08177A80
	ldr r1, [r0]
	movs r0, #1
	bl SetBgTilemapBuffer
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x52
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x54
	movs r1, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_08177A7C: .4byte 0x085C8C08
_08177A80: .4byte 0x0203B9BC
	thumb_func_end InitDiplomaBg

	thumb_func_start InitDiplomaWindow
InitDiplomaWindow: @ 0x08177A84
	push {lr}
	ldr r0, _08177AAC
	bl InitWindows
	bl DeactivateAllTextPrinters
	ldr r0, _08177AB0
	movs r1, #0xf0
	movs r2, #0x20
	bl LoadPalette
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	movs r0, #0
	bl PutWindowTilemap
	pop {r0}
	bx r0
	.align 2, 0
_08177AAC: .4byte 0x085C8C10
_08177AB0: .4byte 0x085D7B04
	thumb_func_end InitDiplomaWindow

	thumb_func_start PrintDiplomaText
PrintDiplomaText: @ 0x08177AB4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _08177AF8
	add r0, sp, #0x14
	movs r2, #3
	bl memcpy
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, sp, #0x14
	str r0, [sp, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	adds r3, r5, #0
	bl AddTextPrinterParameterized4
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08177AF8: .4byte 0x085C8C20
	thumb_func_end PrintDiplomaText

