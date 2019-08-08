.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start UpdateGymLeaderRematch
UpdateGymLeaderRematch: @ 0x081D9DCC
	push {lr}
	ldr r0, _081D9E08
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9E1A
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bhi _081D9E1A
	movs r0, #0x5b
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9E10
	ldr r0, _081D9E0C
	movs r1, #8
	movs r2, #5
	bl UpdateGymLeaderRematchFromArray
	b _081D9E1A
	.align 2, 0
_081D9E08: .4byte 0x00000864
_081D9E0C: .4byte 0x085FC01C
_081D9E10:
	ldr r0, _081D9E20
	movs r1, #7
	movs r2, #1
	bl UpdateGymLeaderRematchFromArray
_081D9E1A:
	pop {r0}
	bx r0
	.align 2, 0
_081D9E20: .4byte 0x085FC02C
	thumb_func_end UpdateGymLeaderRematch

	thumb_func_start UpdateGymLeaderRematchFromArray
UpdateGymLeaderRematchFromArray: @ 0x081D9E24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r7, r1, #0
	mov sl, r2
	movs r6, #0
	movs r0, #5
	mov r8, r0
	movs r5, #0
	cmp r5, r7
	bhs _081D9E6C
	mov r4, sb
_081D9E44:
	ldr r0, _081D9EF8
	ldr r0, [r0]
	ldrh r1, [r4]
	ldr r2, _081D9EFC
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D9E64
	adds r0, r1, #0
	bl GetRematchIndex
	cmp r8, r0
	ble _081D9E62
	mov r8, r0
_081D9E62:
	adds r6, #1
_081D9E64:
	adds r4, #2
	adds r5, #1
	cmp r5, r7
	blo _081D9E44
_081D9E6C:
	cmp r6, #0
	beq _081D9F0A
	cmp r8, sl
	bhi _081D9F0A
	movs r6, #0
	movs r5, #0
	cmp r5, r7
	bhs _081D9EA4
	mov r4, sb
_081D9E7E:
	ldr r0, _081D9EF8
	ldr r0, [r0]
	ldrh r1, [r4]
	ldr r2, _081D9EFC
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D9E9C
	adds r0, r1, #0
	bl GetRematchIndex
	cmp r0, r8
	bne _081D9E9C
	adds r6, #1
_081D9E9C:
	adds r4, #2
	adds r5, #1
	cmp r5, r7
	blo _081D9E7E
_081D9EA4:
	cmp r6, #0
	beq _081D9F0A
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl __modsi3
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r7
	bhs _081D9F0A
	ldr r2, _081D9EF8
	ldr r3, _081D9EFC
	mov r4, sb
_081D9EC4:
	ldr r0, [r2]
	ldrh r1, [r4]
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _081D9F02
	adds r0, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl GetRematchIndex
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, r8
	bne _081D9F02
	cmp r6, #0
	bne _081D9F00
	ldr r0, [r2]
	adds r0, r0, r3
	ldrh r4, [r4]
	adds r0, r0, r4
	mov r1, r8
	strb r1, [r0]
	b _081D9F0A
	.align 2, 0
_081D9EF8: .4byte 0x03005AEC
_081D9EFC: .4byte 0x000009CA
_081D9F00:
	subs r6, #1
_081D9F02:
	adds r4, #2
	adds r5, #1
	cmp r5, r7
	blo _081D9EC4
_081D9F0A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateGymLeaderRematchFromArray

	thumb_func_start GetRematchIndex
GetRematchIndex: @ 0x081D9F1C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r6, _081D9F3C
_081D9F24:
	lsls r0, r4, #1
	lsls r1, r5, #4
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	bl HasTrainerBeenFought
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _081D9F40
	adds r0, r4, #0
	b _081D9F48
	.align 2, 0
_081D9F3C: .4byte 0x0852AD40
_081D9F40:
	adds r4, #1
	cmp r4, #4
	ble _081D9F24
	movs r0, #5
_081D9F48:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetRematchIndex

