.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start PlayTimeCounter_Reset
PlayTimeCounter_Reset: @ 0x08083B6C
	ldr r1, _08083B88
	movs r0, #0
	strb r0, [r1]
	ldr r2, _08083B8C
	ldr r3, [r2]
	movs r1, #0
	movs r0, #0
	strh r0, [r3, #0xe]
	strb r1, [r3, #0x10]
	ldr r0, [r2]
	strb r1, [r0, #0x11]
	ldr r0, [r2]
	strb r1, [r0, #0x12]
	bx lr
	.align 2, 0
_08083B88: .4byte 0x03000E08
_08083B8C: .4byte 0x03005AF0
	thumb_func_end PlayTimeCounter_Reset

	thumb_func_start PlayTimeCounter_Start
PlayTimeCounter_Start: @ 0x08083B90
	push {lr}
	ldr r1, _08083BAC
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08083BB0
	ldr r0, [r0]
	ldrh r1, [r0, #0xe]
	ldr r0, _08083BB4
	cmp r1, r0
	bls _08083BA8
	bl PlayTimeCounter_SetToMax
_08083BA8:
	pop {r0}
	bx r0
	.align 2, 0
_08083BAC: .4byte 0x03000E08
_08083BB0: .4byte 0x03005AF0
_08083BB4: .4byte 0x000003E7
	thumb_func_end PlayTimeCounter_Start

	thumb_func_start PlayTimeCounter_Stop
PlayTimeCounter_Stop: @ 0x08083BB8
	ldr r1, _08083BC0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08083BC0: .4byte 0x03000E08
	thumb_func_end PlayTimeCounter_Stop

	thumb_func_start PlayTimeCounter_Update
PlayTimeCounter_Update: @ 0x08083BC4
	push {lr}
	ldr r0, _08083C20
	ldrb r0, [r0]
	cmp r0, #1
	bne _08083C1C
	ldr r2, _08083C24
	ldr r0, [r2]
	ldrb r1, [r0, #0x12]
	adds r1, #1
	movs r3, #0
	strb r1, [r0, #0x12]
	ldr r1, [r2]
	ldrb r0, [r1, #0x12]
	cmp r0, #0x3b
	bls _08083C1C
	strb r3, [r1, #0x12]
	ldr r0, [r2]
	ldrb r1, [r0, #0x11]
	adds r1, #1
	strb r1, [r0, #0x11]
	ldr r1, [r2]
	ldrb r0, [r1, #0x11]
	cmp r0, #0x3b
	bls _08083C1C
	strb r3, [r1, #0x11]
	ldr r0, [r2]
	ldrb r1, [r0, #0x10]
	adds r1, #1
	strb r1, [r0, #0x10]
	ldr r1, [r2]
	ldrb r0, [r1, #0x10]
	cmp r0, #0x3b
	bls _08083C1C
	strb r3, [r1, #0x10]
	ldr r0, [r2]
	ldrh r1, [r0, #0xe]
	adds r1, #1
	strh r1, [r0, #0xe]
	lsls r1, r1, #0x10
	ldr r0, _08083C28
	cmp r1, r0
	bls _08083C1C
	bl PlayTimeCounter_SetToMax
_08083C1C:
	pop {r0}
	bx r0
	.align 2, 0
_08083C20: .4byte 0x03000E08
_08083C24: .4byte 0x03005AF0
_08083C28: .4byte 0x03E70000
	thumb_func_end PlayTimeCounter_Update

	thumb_func_start PlayTimeCounter_SetToMax
PlayTimeCounter_SetToMax: @ 0x08083C2C
	ldr r1, _08083C48
	movs r0, #2
	strb r0, [r1]
	ldr r2, _08083C4C
	ldr r3, [r2]
	ldr r0, _08083C50
	strh r0, [r3, #0xe]
	movs r1, #0x3b
	strb r1, [r3, #0x10]
	ldr r0, [r2]
	strb r1, [r0, #0x11]
	ldr r0, [r2]
	strb r1, [r0, #0x12]
	bx lr
	.align 2, 0
_08083C48: .4byte 0x03000E08
_08083C4C: .4byte 0x03005AF0
_08083C50: .4byte 0x000003E7
	thumb_func_end PlayTimeCounter_SetToMax

