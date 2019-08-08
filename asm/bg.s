.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ResetBgs
ResetBgs: @ 0x08001308
	push {lr}
	bl ResetBgControlStructs
	ldr r1, _0800131C
	movs r0, #0
	strh r0, [r1, #0x10]
	bl SetTextModeAndHideBgs
	pop {r0}
	bx r0
	.align 2, 0
_0800131C: .4byte 0x030008E0
	thumb_func_end ResetBgs

	thumb_func_start SetBgModeInternal
SetBgModeInternal: @ 0x08001320
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08001334
	ldrh r2, [r3, #0x10]
	ldr r1, _08001338
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #0x10]
	bx lr
	.align 2, 0
_08001334: .4byte 0x030008E0
_08001338: .4byte 0x0000FFF8
	thumb_func_end SetBgModeInternal

	thumb_func_start GetBgMode
GetBgMode: @ 0x0800133C
	ldr r0, _08001348
	ldrb r1, [r0, #0x10]
	movs r0, #7
	ands r0, r1
	bx lr
	.align 2, 0
_08001348: .4byte 0x030008E0
	thumb_func_end GetBgMode

	thumb_func_start ResetBgControlStructs
ResetBgControlStructs: @ 0x0800134C
	push {lr}
	ldr r2, _08001364
	ldr r0, _08001368
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0xc
_08001358:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08001358
	pop {r0}
	bx r0
	.align 2, 0
_08001364: .4byte 0x030008E0
_08001368: .4byte 0x0829BEAC
	thumb_func_end ResetBgControlStructs

	thumb_func_start Unused_ResetBgControlStruct
Unused_ResetBgControlStruct: @ 0x0800136C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsInvalidBg32
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800138A
	ldr r1, _08001390
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, _08001394
	ldr r1, [r1]
	str r1, [r0]
_0800138A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001390: .4byte 0x030008E0
_08001394: .4byte 0x0829BEAC
	thumb_func_end Unused_ResetBgControlStruct

	thumb_func_start SetBgControlAttributes
SetBgControlAttributes: @ 0x08001398
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r4, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, [sp, #0x38]
	mov ip, r6
	ldr r6, [sp, #0x3c]
	mov r8, r6
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	str r7, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, ip
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	adds r0, r7, #0
	bl IsInvalidBg32
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #0
	bne _080014B0
	ldr r2, _080014C0
	mov r8, r2
	mov r0, sl
	cmp r0, #0xff
	beq _0800140C
	lsls r2, r7, #2
	add r2, r8
	movs r1, #3
	ands r1, r0
	ldrb r3, [r2, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #1]
_0800140C:
	cmp r6, #0xff
	beq _08001424
	lsls r1, r7, #2
	add r1, r8
	movs r0, #0x1f
	ands r6, r0
	lsls r3, r6, #2
	ldrb r2, [r1, #1]
	subs r0, #0x9c
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #1]
_08001424:
	mov r1, sb
	cmp r1, #0xff
	beq _08001440
	lsls r1, r7, #2
	add r1, r8
	movs r0, #3
	mov r2, sb
	ands r2, r0
	lsls r3, r2, #2
	ldrb r2, [r1]
	subs r0, #0x10
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_08001440:
	ldr r6, [sp, #4]
	cmp r6, #0xff
	beq _08001456
	lsls r1, r7, #2
	add r1, r8
	lsls r3, r6, #7
	ldrb r2, [r1, #1]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #1]
_08001456:
	cmp r5, #0xff
	beq _0800146E
	lsls r1, r7, #2
	add r1, r8
	movs r0, #3
	ands r5, r0
	lsls r3, r5, #4
	ldrb r2, [r1]
	subs r0, #0x34
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_0800146E:
	cmp r4, #0xff
	beq _08001486
	lsls r1, r7, #2
	add r1, r8
	movs r0, #1
	ands r4, r0
	lsls r3, r4, #6
	ldrb r2, [r1]
	subs r0, #0x42
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_08001486:
	ldr r0, [sp, #0xc]
	cmp r0, #0xff
	beq _0800149C
	lsls r1, r7, #2
	add r1, r8
	lsls r3, r0, #7
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_0800149C:
	ldr r1, [sp]
	lsls r0, r1, #2
	add r0, r8
	mov r2, ip
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
_080014B0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080014C0: .4byte 0x030008E0
	thumb_func_end SetBgControlAttributes

	thumb_func_start GetBgControlAttribute
GetBgControlAttribute: @ 0x080014C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r0, r4, #0
	bl IsInvalidBg32
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08001570
	ldr r1, _080014FC
	lsls r2, r4, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	adds r3, r1, #0
	cmp r0, #0
	beq _08001570
	subs r0, r5, #1
	cmp r0, #7
	bhi _08001570
	lsls r0, r0, #2
	ldr r1, _08001500
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080014FC: .4byte 0x030008E0
_08001500: .4byte 0x08001504
_08001504: @ jump table
	.4byte _08001524 @ case 0
	.4byte _0800152E @ case 1
	.4byte _08001538 @ case 2
	.4byte _08001542 @ case 3
	.4byte _0800154C @ case 4
	.4byte _08001554 @ case 5
	.4byte _0800155E @ case 6
	.4byte _08001568 @ case 7
_08001524:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	b _08001572
_0800152E:
	adds r0, r2, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	b _08001572
_08001538:
	adds r0, r2, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	b _08001572
_08001542:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	b _08001572
_0800154C:
	adds r0, r2, r3
	ldrb r0, [r0, #1]
	lsrs r0, r0, #7
	b _08001572
_08001554:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	b _08001572
_0800155E:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	b _08001572
_08001568:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsrs r0, r0, #7
	b _08001572
_08001570:
	movs r0, #0xff
_08001572:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetBgControlAttribute

	thumb_func_start LoadBgVram
LoadBgVram: @ 0x08001578
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	ldr r1, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r0, r4, #0
	bl IsInvalidBg32
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080015F0
	ldr r1, _080015B8
	lsls r0, r4, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080015F0
	cmp r5, #1
	beq _080015BC
	cmp r5, #2
	beq _080015C4
	movs r2, #0xff
	b _080015F4
	.align 2, 0
_080015B8: .4byte 0x030008E0
_080015BC:
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x10
	b _080015CC
_080015C4:
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	lsls r0, r0, #0xb
_080015CC:
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r1, r0, r1
	mov r0, r8
	adds r2, r7, #0
	movs r3, #0
	bl RequestDma3Copy
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080015F4
_080015F0:
	movs r0, #0xff
	b _080015F6
_080015F4:
	adds r0, r2, #0
_080015F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end LoadBgVram

	thumb_func_start ShowBgInternal
ShowBgInternal: @ 0x08001600
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsInvalidBg32
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800166E
	ldr r5, _08001674
	lsls r0, r4, #2
	adds r2, r0, r5
	ldrb r3, [r2]
	lsls r0, r3, #0x1f
	cmp r0, #0
	beq _0800166E
	lsls r1, r3, #0x1a
	lsrs r1, r1, #0x1e
	ldrb r2, [r2, #1]
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1c
	orrs r1, r0
	movs r0, #0x40
	ands r0, r3
	orrs r1, r0
	lsrs r0, r2, #7
	lsls r0, r0, #7
	orrs r1, r0
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x1b
	lsls r2, r2, #8
	orrs r1, r2
	lsrs r0, r3, #7
	lsls r0, r0, #0xd
	orrs r1, r0
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	orrs r1, r0
	lsls r0, r4, #0x19
	movs r2, #0x80
	lsls r2, r2, #0x14
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	bl SetGpuReg
	adds r1, r4, #0
	adds r1, #8
	movs r0, #1
	lsls r0, r1
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	ldr r1, _08001678
	ands r0, r1
	strh r0, [r5, #0x10]
_0800166E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001674: .4byte 0x030008E0
_08001678: .4byte 0x00000F07
	thumb_func_end ShowBgInternal

	thumb_func_start HideBgInternal
HideBgInternal: @ 0x0800167C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsInvalidBg32
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080016A2
	ldr r2, _080016A8
	adds r0, r4, #0
	adds r0, #8
	movs r1, #1
	lsls r1, r0
	ldrh r0, [r2, #0x10]
	bics r0, r1
	ldr r1, _080016AC
	ands r0, r1
	strh r0, [r2, #0x10]
_080016A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080016A8: .4byte 0x030008E0
_080016AC: .4byte 0x00000F07
	thumb_func_end HideBgInternal

	thumb_func_start SyncBgVisibilityAndMode
SyncBgVisibilityAndMode: @ 0x080016B0
	push {lr}
	movs r0, #0
	bl GetGpuReg
	ldr r1, _080016CC
	ands r1, r0
	ldr r0, _080016D0
	ldrh r0, [r0, #0x10]
	orrs r1, r0
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080016CC: .4byte 0x0000F0F8
_080016D0: .4byte 0x030008E0
	thumb_func_end SyncBgVisibilityAndMode

	thumb_func_start SetTextModeAndHideBgs
SetTextModeAndHideBgs: @ 0x080016D4
	push {lr}
	movs r0, #0
	bl GetGpuReg
	ldr r1, _080016EC
	ands r1, r0
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	.align 2, 0
_080016EC: .4byte 0x0000F0F8
	thumb_func_end SetTextModeAndHideBgs

	thumb_func_start SetBgAffineInternal
SetBgAffineInternal: @ 0x080016F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	mov ip, r1
	mov r8, r2
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x40]
	ldr r4, [sp, #0x44]
	ldr r5, [sp, #0x48]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08001734
	ldrh r0, [r0, #0x10]
	movs r1, #7
	ands r1, r0
	cmp r1, #1
	beq _08001738
	cmp r1, #1
	ble _080017AE
	cmp r1, #2
	beq _0800173E
	b _080017AE
	.align 2, 0
_08001734: .4byte 0x030008E0
_08001738:
	cmp r6, #2
	bne _080017AE
	b _08001748
_0800173E:
	subs r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080017AE
_08001748:
	mov r0, ip
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	mov r0, sp
	strh r3, [r0, #8]
	strh r7, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r4, [r0, #0xe]
	strh r5, [r0, #0x10]
	add r4, sp, #0x14
	adds r1, r4, #0
	movs r2, #1
	bl BgAffineSet
	ldrh r1, [r4]
	movs r0, #0x20
	bl SetGpuReg
	ldrh r1, [r4, #2]
	movs r0, #0x22
	bl SetGpuReg
	ldrh r1, [r4, #4]
	movs r0, #0x24
	bl SetGpuReg
	ldrh r1, [r4, #6]
	movs r0, #0x26
	bl SetGpuReg
	ldrh r1, [r4]
	movs r0, #0x20
	bl SetGpuReg
	ldrh r1, [r4, #8]
	movs r0, #0x28
	bl SetGpuReg
	ldrh r1, [r4, #0xa]
	movs r0, #0x2a
	bl SetGpuReg
	ldrh r1, [r4, #0xc]
	movs r0, #0x2c
	bl SetGpuReg
	ldrh r1, [r4, #0xe]
	movs r0, #0x2e
	bl SetGpuReg
_080017AE:
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetBgAffineInternal

	thumb_func_start IsInvalidBg32
IsInvalidBg32: @ 0x080017BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080017CA
	movs r0, #0
	b _080017CC
_080017CA:
	movs r0, #1
_080017CC:
	pop {r1}
	bx r1
	thumb_func_end IsInvalidBg32

	thumb_func_start DummiedOutFireRedLeafGreenTileAllocFunc
DummiedOutFireRedLeafGreenTileAllocFunc: @ 0x080017D0
	movs r0, #0
	bx lr
	thumb_func_end DummiedOutFireRedLeafGreenTileAllocFunc

	thumb_func_start ResetBgsAndClearDma3BusyFlags
ResetBgsAndClearDma3BusyFlags: @ 0x080017D4
	push {r4, lr}
	adds r4, r0, #0
	bl ResetBgs
	ldr r1, _080017F8
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0xc
_080017E4:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _080017E4
	ldr r0, _080017FC
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080017F8: .4byte 0x03000938
_080017FC: .4byte 0x03002FF4
	thumb_func_end ResetBgsAndClearDma3BusyFlags

	thumb_func_start InitBgsFromTemplates
InitBgsFromTemplates: @ 0x08001800
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	bl SetBgModeInternal
	bl ResetBgControlStructs
	cmp r4, #0
	beq _080018AC
	movs r7, #0
	ldr r0, _080018BC
	mov sb, r0
	movs r2, #0xc
	add r2, sb
	mov sl, r2
	adds r6, r5, #0
	mov r8, r4
_08001832:
	ldr r4, [r6]
	lsls r0, r4, #0x1e
	lsrs r5, r0, #0x1e
	cmp r5, #3
	bhi _0800189E
	lsls r1, r4, #0x1c
	lsrs r1, r1, #0x1e
	lsls r2, r4, #0x17
	lsrs r2, r2, #0x1b
	lsls r3, r4, #0x15
	lsrs r3, r3, #0x1e
	lsls r0, r4, #0x14
	lsrs r0, r0, #0x1f
	str r0, [sp]
	lsls r0, r4, #0x12
	lsrs r0, r0, #0x1e
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r7, [sp, #0xc]
	adds r0, r5, #0
	bl SetBgControlAttributes
	lsls r4, r5, #4
	mov r5, sb
	adds r3, r4, r5
	ldr r2, [r6]
	lsls r2, r2, #8
	lsrs r2, r2, #0x16
	ldrh r0, [r3]
	ldr r5, _080018C0
	adds r1, r5, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
	ldrb r0, [r3, #1]
	movs r2, #0x3d
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	strb r0, [r3, #1]
	ldr r0, [r3]
	ldr r1, _080018C4
	ands r0, r1
	str r0, [r3]
	mov r0, sb
	adds r0, #4
	adds r0, r4, r0
	str r7, [r0]
	mov r0, sb
	adds r0, #8
	adds r0, r4, r0
	str r7, [r0]
	add r4, sl
	str r7, [r4]
_0800189E:
	adds r6, #4
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	mov r0, r8
	cmp r0, #0
	bne _08001832
_080018AC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080018BC: .4byte 0x030008F8
_080018C0: .4byte 0xFFFFFC00
_080018C4: .4byte 0x00003FFF
	thumb_func_end InitBgsFromTemplates

	thumb_func_start InitBgFromTemplate
InitBgFromTemplate: @ 0x080018C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r4, [r7]
	lsls r0, r4, #0x1e
	lsrs r5, r0, #0x1e
	cmp r5, #3
	bhi _08001938
	lsls r1, r4, #0x1c
	lsrs r1, r1, #0x1e
	lsls r2, r4, #0x17
	lsrs r2, r2, #0x1b
	lsls r3, r4, #0x15
	lsrs r3, r3, #0x1e
	lsls r0, r4, #0x14
	lsrs r0, r0, #0x1f
	str r0, [sp]
	lsls r0, r4, #0x12
	lsrs r0, r0, #0x1e
	str r0, [sp, #4]
	movs r6, #0
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	adds r0, r5, #0
	bl SetBgControlAttributes
	ldr r4, _08001940
	lsls r5, r5, #4
	adds r3, r5, r4
	ldr r1, [r7]
	lsls r1, r1, #8
	lsrs r1, r1, #0x16
	ldrh r2, [r3]
	ldr r0, _08001944
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	ldrb r1, [r3, #1]
	movs r0, #0x3d
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #1]
	ldr r0, [r3]
	ldr r1, _08001948
	ands r0, r1
	str r0, [r3]
	adds r0, r4, #4
	adds r0, r5, r0
	str r6, [r0]
	adds r0, r4, #0
	adds r0, #8
	adds r0, r5, r0
	str r6, [r0]
	adds r4, #0xc
	adds r5, r5, r4
	str r6, [r5]
_08001938:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001940: .4byte 0x030008F8
_08001944: .4byte 0xFFFFFC00
_08001948: .4byte 0x00003FFF
	thumb_func_end InitBgFromTemplate

	thumb_func_start SetBgMode
SetBgMode: @ 0x0800194C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl SetBgModeInternal
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetBgMode

	thumb_func_start LoadBgTiles
LoadBgTiles: @ 0x0800195C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	adds r0, r5, #0
	movs r1, #5
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08001998
	ldr r1, _08001994
	lsls r0, r5, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	lsls r0, r0, #0x15
	b _080019A8
	.align 2, 0
_08001994: .4byte 0x030008F8
_08001998:
	ldr r1, _080019C8
	lsls r0, r5, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	lsls r0, r0, #0x16
_080019A8:
	lsrs r4, r0, #0x10
	movs r6, #1
	str r6, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	adds r3, r4, #0
	bl LoadBgVram
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r7, r1, #0
	cmp r1, #0xff
	bne _080019D0
	ldr r0, _080019CC
	b _080019FE
	.align 2, 0
_080019C8: .4byte 0x030008F8
_080019CC: .4byte 0x0000FFFF
_080019D0:
	ldr r0, _08001A0C
	lsrs r2, r2, #0x1d
	lsls r2, r2, #2
	adds r2, r2, r0
	movs r0, #0x1f
	ands r0, r1
	adds r1, r6, #0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, _08001A10
	ldr r0, [r0]
	cmp r0, #1
	bne _080019FC
	lsrs r1, r4, #5
	mov r0, r8
	lsrs r2, r0, #5
	adds r0, r5, #0
	movs r3, #1
	bl DummiedOutFireRedLeafGreenTileAllocFunc
_080019FC:
	adds r0, r7, #0
_080019FE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08001A0C: .4byte 0x03000938
_08001A10: .4byte 0x03002FF4
	thumb_func_end LoadBgTiles

	thumb_func_start LoadBgTilemap
LoadBgTilemap: @ 0x08001A14
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x10
	movs r4, #2
	str r4, [sp]
	bl LoadBgVram
	lsls r2, r0, #0x18
	lsrs r3, r2, #0x18
	cmp r3, #0xff
	beq _08001A54
	ldr r0, _08001A50
	lsrs r2, r2, #0x1d
	lsls r2, r2, #2
	adds r2, r2, r0
	movs r0, #0x1f
	ands r0, r3
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	adds r0, r3, #0
	b _08001A56
	.align 2, 0
_08001A50: .4byte 0x03000938
_08001A54:
	ldr r0, _08001A60
_08001A56:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08001A60: .4byte 0x0000FFFF
	thumb_func_end LoadBgTilemap

	thumb_func_start Unused_LoadBgPalette
Unused_LoadBgPalette: @ 0x08001A64
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	adds r0, r4, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _08001AB0
	ldr r1, _08001AB4
	lsls r0, r4, #4
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1c
	lsls r1, r1, #5
	lsls r0, r5, #1
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl RequestDma3Copy
	lsls r3, r0, #0x18
	asrs r1, r3, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08001ABC
_08001AB0:
	ldr r0, _08001AB8
	b _08001AE0
	.align 2, 0
_08001AB4: .4byte 0x030008F8
_08001AB8: .4byte 0x0000FFFF
_08001ABC:
	ldr r4, _08001AE8
	adds r0, r1, #0
	cmp r1, #0
	bge _08001AC6
	adds r0, #0x1f
_08001AC6:
	asrs r0, r0, #5
	lsls r2, r0, #2
	adds r2, r2, r4
	lsls r0, r0, #5
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	lsrs r0, r3, #0x18
_08001AE0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08001AE8: .4byte 0x03000938
	thumb_func_end Unused_LoadBgPalette

	thumb_func_start IsDma3ManagerBusyWithBgCopy
IsDma3ManagerBusyWithBgCopy: @ 0x08001AEC
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	movs r7, #1
	rsbs r7, r7, #0
_08001AF4:
	adds r0, r5, #0
	cmp r5, #0
	bge _08001AFC
	adds r0, #0x1f
_08001AFC:
	asrs r0, r0, #5
	lsls r2, r0, #0x18
	lsls r0, r0, #5
	subs r0, r5, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08001B30
	lsrs r2, r2, #0x16
	adds r4, r2, r1
	movs r6, #1
	lsls r6, r0
	ldr r0, [r4]
	ands r0, r6
	cmp r0, #0
	beq _08001B3A
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl CheckForSpaceForDma3Request
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r7
	bne _08001B34
	movs r0, #1
	b _08001B42
	.align 2, 0
_08001B30: .4byte 0x03000938
_08001B34:
	ldr r0, [r4]
	bics r0, r6
	str r0, [r4]
_08001B3A:
	adds r5, #1
	cmp r5, #0x7f
	ble _08001AF4
	movs r0, #0
_08001B42:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end IsDma3ManagerBusyWithBgCopy

	thumb_func_start ShowBg
ShowBg: @ 0x08001B48
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ShowBgInternal
	bl SyncBgVisibilityAndMode
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ShowBg

	thumb_func_start HideBg
HideBg: @ 0x08001B5C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl HideBgInternal
	bl SyncBgVisibilityAndMode
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end HideBg

	thumb_func_start SetBgAttribute
SetBgAttribute: @ 0x08001B70
	push {r4, lr}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	subs r0, r1, #1
	cmp r0, #6
	bhi _08001C2A
	lsls r0, r0, #2
	ldr r1, _08001B90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08001B90: .4byte 0x08001B94
_08001B94: @ jump table
	.4byte _08001BB0 @ case 0
	.4byte _08001BC0 @ case 1
	.4byte _08001BD2 @ case 2
	.4byte _08001BE8 @ case 3
	.4byte _08001BFC @ case 4
	.4byte _08001C14 @ case 5
	.4byte _08001BF2 @ case 6
_08001BB0:
	movs r0, #0xff
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r3, #0
	b _08001C0A
_08001BC0:
	movs r0, #0xff
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xff
	adds r2, r3, #0
	b _08001C0C
_08001BD2:
	movs r0, #0xff
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #0xff
	bl SetBgControlAttributes
	b _08001C2A
_08001BE8:
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r0, [sp, #8]
	b _08001C04
_08001BF2:
	movs r0, #0xff
	str r0, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	b _08001C04
_08001BFC:
	movs r0, #0xff
	str r0, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
_08001C04:
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xff
_08001C0A:
	movs r2, #0xff
_08001C0C:
	movs r3, #0xff
	bl SetBgControlAttributes
	b _08001C2A
_08001C14:
	movs r0, #0xff
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #0xff
	movs r3, #0xff
	bl SetBgControlAttributes
_08001C2A:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetBgAttribute

	thumb_func_start GetBgAttribute
GetBgAttribute: @ 0x08001C34
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	subs r0, r1, #1
	cmp r0, #9
	bhi _08001D10
	lsls r0, r0, #2
	ldr r1, _08001C50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08001C50: .4byte 0x08001C54
_08001C54: @ jump table
	.4byte _08001C7C @ case 0
	.4byte _08001C86 @ case 1
	.4byte _08001C90 @ case 2
	.4byte _08001C9A @ case 3
	.4byte _08001CAE @ case 4
	.4byte _08001CB8 @ case 5
	.4byte _08001CA4 @ case 6
	.4byte _08001CC2 @ case 7
	.4byte _08001CF0 @ case 8
	.4byte _08001CFC @ case 9
_08001C7C:
	adds r0, r4, #0
	movs r1, #2
	bl GetBgControlAttribute
	b _08001CF6
_08001C86:
	adds r0, r4, #0
	movs r1, #3
	bl GetBgControlAttribute
	b _08001CF6
_08001C90:
	adds r0, r4, #0
	movs r1, #4
	bl GetBgControlAttribute
	b _08001CF6
_08001C9A:
	adds r0, r4, #0
	movs r1, #5
	bl GetBgControlAttribute
	b _08001CF6
_08001CA4:
	adds r0, r4, #0
	movs r1, #6
	bl GetBgControlAttribute
	b _08001CF6
_08001CAE:
	adds r0, r4, #0
	movs r1, #7
	bl GetBgControlAttribute
	b _08001CF6
_08001CB8:
	adds r0, r4, #0
	movs r1, #8
	bl GetBgControlAttribute
	b _08001CF6
_08001CC2:
	adds r0, r4, #0
	bl GetBgType
	cmp r0, #0
	beq _08001CD4
	cmp r0, #1
	beq _08001CE2
	movs r0, #0
	b _08001D12
_08001CD4:
	adds r0, r4, #0
	movs r1, #0
	bl GetBgMetricTextMode
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x10
	b _08001D12
_08001CE2:
	adds r0, r4, #0
	movs r1, #0
	bl GetBgMetricAffineMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	b _08001D12
_08001CF0:
	adds r0, r4, #0
	bl GetBgType
_08001CF6:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08001D12
_08001CFC:
	ldr r0, _08001D0C
	lsls r1, r4, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	b _08001D12
	.align 2, 0
_08001D0C: .4byte 0x030008F8
_08001D10:
	ldr r0, _08001D18
_08001D12:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08001D18: .4byte 0x0000FFFF
	thumb_func_end GetBgAttribute

	thumb_func_start ChangeBgX
ChangeBgX: @ 0x08001D1C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r0, r4, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _08001D40
	adds r0, r4, #0
	movs r1, #1
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08001D46
_08001D40:
	movs r0, #1
	rsbs r0, r0, #0
	b _08001E4C
_08001D46:
	cmp r5, #1
	beq _08001D64
	cmp r5, #1
	ble _08001D52
	cmp r5, #2
	beq _08001D78
_08001D52:
	ldr r0, _08001D60
	lsls r1, r4, #4
	adds r0, #8
	adds r0, r1, r0
	str r6, [r0]
	adds r5, r1, #0
	b _08001D88
	.align 2, 0
_08001D60: .4byte 0x030008F8
_08001D64:
	ldr r0, _08001D74
	lsls r2, r4, #4
	adds r0, #8
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r6
	b _08001D84
	.align 2, 0
_08001D74: .4byte 0x030008F8
_08001D78:
	ldr r0, _08001DA0
	lsls r2, r4, #4
	adds r0, #8
	adds r0, r2, r0
	ldr r1, [r0]
	subs r1, r1, r6
_08001D84:
	str r1, [r0]
	adds r5, r2, #0
_08001D88:
	bl GetBgMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #1
	beq _08001DC4
	cmp r4, #1
	bgt _08001DA4
	cmp r4, #0
	beq _08001DAE
	b _08001E44
	.align 2, 0
_08001DA0: .4byte 0x030008F8
_08001DA4:
	cmp r4, #2
	beq _08001DD8
	cmp r4, #3
	beq _08001E10
	b _08001E44
_08001DAE:
	ldr r0, _08001DC0
	ldr r0, [r0, #8]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	movs r0, #0x10
	bl SetGpuReg
	b _08001E44
	.align 2, 0
_08001DC0: .4byte 0x030008F8
_08001DC4:
	ldr r0, _08001DD4
	ldr r0, [r0, #0x18]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	movs r0, #0x14
	bl SetGpuReg
	b _08001E44
	.align 2, 0
_08001DD4: .4byte 0x030008F8
_08001DD8:
	cmp r0, #0
	bne _08001DF0
	ldr r0, _08001DEC
	ldr r0, [r0, #0x28]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	movs r0, #0x18
	bl SetGpuReg
	b _08001E44
	.align 2, 0
_08001DEC: .4byte 0x030008F8
_08001DF0:
	ldr r0, _08001E0C
	ldr r0, [r0, #0x28]
	lsrs r1, r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x2a
	bl SetGpuReg
	movs r0, #0x28
	adds r1, r4, #0
	bl SetGpuReg
	b _08001E44
	.align 2, 0
_08001E0C: .4byte 0x030008F8
_08001E10:
	cmp r0, #0
	bne _08001E28
	ldr r0, _08001E24
	ldr r0, [r0, #0x38]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	movs r0, #0x1c
	bl SetGpuReg
	b _08001E44
	.align 2, 0
_08001E24: .4byte 0x030008F8
_08001E28:
	cmp r0, #2
	bne _08001E44
	ldr r0, _08001E54
	ldr r0, [r0, #0x38]
	lsrs r1, r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x3a
	bl SetGpuReg
	movs r0, #0x38
	adds r1, r4, #0
	bl SetGpuReg
_08001E44:
	ldr r0, _08001E54
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
_08001E4C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08001E54: .4byte 0x030008F8
	thumb_func_end ChangeBgX

	thumb_func_start GetBgX
GetBgX: @ 0x08001E58
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _08001E88
	adds r0, r4, #0
	movs r1, #1
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08001E88
	ldr r0, _08001E84
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	b _08001E8C
	.align 2, 0
_08001E84: .4byte 0x030008F8
_08001E88:
	movs r0, #1
	rsbs r0, r0, #0
_08001E8C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBgX

	thumb_func_start ChangeBgY
ChangeBgY: @ 0x08001E94
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r0, r4, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _08001EB8
	adds r0, r4, #0
	movs r1, #1
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08001EBE
_08001EB8:
	movs r0, #1
	rsbs r0, r0, #0
	b _08001FC4
_08001EBE:
	cmp r5, #1
	beq _08001EDC
	cmp r5, #1
	ble _08001ECA
	cmp r5, #2
	beq _08001EF0
_08001ECA:
	ldr r0, _08001ED8
	lsls r1, r4, #4
	adds r0, #0xc
	adds r0, r1, r0
	str r6, [r0]
	adds r5, r1, #0
	b _08001F00
	.align 2, 0
_08001ED8: .4byte 0x030008F8
_08001EDC:
	ldr r0, _08001EEC
	lsls r2, r4, #4
	adds r0, #0xc
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r6
	b _08001EFC
	.align 2, 0
_08001EEC: .4byte 0x030008F8
_08001EF0:
	ldr r0, _08001F18
	lsls r2, r4, #4
	adds r0, #0xc
	adds r0, r2, r0
	ldr r1, [r0]
	subs r1, r1, r6
_08001EFC:
	str r1, [r0]
	adds r5, r2, #0
_08001F00:
	bl GetBgMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #1
	beq _08001F3C
	cmp r4, #1
	bgt _08001F1C
	cmp r4, #0
	beq _08001F26
	b _08001FBC
	.align 2, 0
_08001F18: .4byte 0x030008F8
_08001F1C:
	cmp r4, #2
	beq _08001F50
	cmp r4, #3
	beq _08001F88
	b _08001FBC
_08001F26:
	ldr r0, _08001F38
	ldr r0, [r0, #0xc]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	movs r0, #0x12
	bl SetGpuReg
	b _08001FBC
	.align 2, 0
_08001F38: .4byte 0x030008F8
_08001F3C:
	ldr r0, _08001F4C
	ldr r0, [r0, #0x1c]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	movs r0, #0x16
	bl SetGpuReg
	b _08001FBC
	.align 2, 0
_08001F4C: .4byte 0x030008F8
_08001F50:
	cmp r0, #0
	bne _08001F68
	ldr r0, _08001F64
	ldr r0, [r0, #0x2c]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	movs r0, #0x1a
	bl SetGpuReg
	b _08001FBC
	.align 2, 0
_08001F64: .4byte 0x030008F8
_08001F68:
	ldr r0, _08001F84
	ldr r0, [r0, #0x2c]
	lsrs r1, r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x2e
	bl SetGpuReg
	movs r0, #0x2c
	adds r1, r4, #0
	bl SetGpuReg
	b _08001FBC
	.align 2, 0
_08001F84: .4byte 0x030008F8
_08001F88:
	cmp r0, #0
	bne _08001FA0
	ldr r0, _08001F9C
	ldr r0, [r0, #0x3c]
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	movs r0, #0x1e
	bl SetGpuReg
	b _08001FBC
	.align 2, 0
_08001F9C: .4byte 0x030008F8
_08001FA0:
	cmp r0, #2
	bne _08001FBC
	ldr r0, _08001FCC
	ldr r0, [r0, #0x3c]
	lsrs r1, r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x3e
	bl SetGpuReg
	movs r0, #0x3c
	adds r1, r4, #0
	bl SetGpuReg
_08001FBC:
	ldr r0, _08001FCC
	adds r0, #0xc
	adds r0, r5, r0
	ldr r0, [r0]
_08001FC4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08001FCC: .4byte 0x030008F8
	thumb_func_end ChangeBgY

	thumb_func_start GetBgY
GetBgY: @ 0x08001FD0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _08002000
	adds r0, r4, #0
	movs r1, #1
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08002000
	ldr r0, _08001FFC
	lsls r1, r4, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	b _08002004
	.align 2, 0
_08001FFC: .4byte 0x030008F8
_08002000:
	movs r0, #1
	rsbs r0, r0, #0
_08002004:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBgY

	thumb_func_start SetBgAffine
SetBgAffine: @ 0x0800200C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	ldr r7, [sp, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r7, r7, #0x10
	lsrs r7, r7, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #4]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	bl SetBgAffineInternal
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end SetBgAffine

	thumb_func_start Unused_AdjustBgMosaic
Unused_AdjustBgMosaic: @ 0x0800204C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r0, #0x4c
	bl GetGpuReg
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0xf
	movs r3, #0xf
	ands r3, r5
	lsrs r2, r0, #0x14
	ands r2, r1
	movs r0, #0xff
	lsls r0, r0, #8
	ands r5, r0
	cmp r6, #6
	bhi _080020A0
	lsls r0, r6, #2
	ldr r1, _08002080
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08002080: .4byte 0x08002084
_08002084: @ jump table
	.4byte _080020A0 @ case 0
	.4byte _080020A8 @ case 1
	.4byte _080020AE @ case 2
	.4byte _080020C0 @ case 3
	.4byte _080020D6 @ case 4
	.4byte _080020DC @ case 5
	.4byte _080020EE @ case 6
_080020A0:
	movs r3, #0xf
	ands r3, r4
	lsrs r2, r4, #4
	b _08002102
_080020A8:
	movs r3, #0xf
	ands r3, r4
	b _08002102
_080020AE:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r4
	cmp r0, #0xf
	ble _080020BC
	movs r3, #0xf
	b _08002102
_080020BC:
	adds r0, r3, r4
	b _080020D0
_080020C0:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r4
	cmp r0, #0
	bge _080020CE
	movs r3, #0
	b _08002102
_080020CE:
	subs r0, r3, r4
_080020D0:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _08002102
_080020D6:
	movs r2, #0xf
	ands r2, r4
	b _08002102
_080020DC:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r4
	cmp r0, #0xf
	ble _080020EA
	movs r2, #0xf
	b _08002102
_080020EA:
	adds r0, r2, r4
	b _080020FE
_080020EE:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r4
	cmp r0, #0
	bge _080020FC
	movs r2, #0
	b _08002102
_080020FC:
	subs r0, r2, r4
_080020FE:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08002102:
	lsls r0, r2, #0x10
	asrs r0, r0, #0xc
	movs r1, #0xf0
	ands r0, r1
	orrs r5, r0
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf
	ands r0, r1
	orrs r5, r0
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x4c
	adds r1, r5, #0
	bl SetGpuReg
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end Unused_AdjustBgMosaic

	thumb_func_start SetBgTilemapBuffer
SetBgTilemapBuffer: @ 0x0800212C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _08002156
	adds r0, r4, #0
	movs r1, #1
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08002156
	ldr r0, _0800215C
	lsls r1, r4, #4
	adds r0, #4
	adds r1, r1, r0
	str r5, [r1]
_08002156:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800215C: .4byte 0x030008F8
	thumb_func_end SetBgTilemapBuffer

	thumb_func_start UnsetBgTilemapBuffer
UnsetBgTilemapBuffer: @ 0x08002160
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsInvalidBg
	adds r5, r0, #0
	cmp r5, #0
	bne _0800218A
	adds r0, r4, #0
	movs r1, #1
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800218A
	ldr r0, _08002190
	lsls r1, r4, #4
	adds r0, #4
	adds r1, r1, r0
	str r5, [r1]
_0800218A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002190: .4byte 0x030008F8
	thumb_func_end UnsetBgTilemapBuffer

	thumb_func_start GetBgTilemapBuffer
GetBgTilemapBuffer: @ 0x08002194
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _080021C4
	adds r0, r4, #0
	movs r1, #1
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080021C4
	ldr r0, _080021C0
	lsls r1, r4, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	b _080021C6
	.align 2, 0
_080021C0: .4byte 0x030008F8
_080021C4:
	movs r0, #0
_080021C6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBgTilemapBuffer

	thumb_func_start CopyToBgTilemapBuffer
CopyToBgTilemapBuffer: @ 0x080021CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r7, r2, #0x10
	lsrs r6, r7, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	mov r8, r5
	adds r0, r4, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _08002234
	adds r0, r4, #0
	bl IsTileMapOutsideWram
	cmp r0, #0
	bne _08002234
	cmp r6, #0
	beq _0800221C
	ldr r0, _08002218
	lsls r1, r4, #4
	adds r0, #4
	adds r1, r1, r0
	lsls r0, r5, #1
	ldr r1, [r1]
	adds r1, r1, r0
	lsrs r2, r7, #0x11
	mov r0, sl
	bl CpuSet
	b _08002234
	.align 2, 0
_08002218: .4byte 0x030008F8
_0800221C:
	ldr r0, _08002244
	mov r2, sb
	lsls r1, r2, #4
	adds r0, #4
	adds r1, r1, r0
	mov r2, r8
	lsls r0, r2, #1
	ldr r1, [r1]
	adds r1, r1, r0
	mov r0, sl
	bl LZ77UnCompWram
_08002234:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002244: .4byte 0x030008F8
	thumb_func_end CopyToBgTilemapBuffer

	thumb_func_start CopyBgTilemapBufferToVram
CopyBgTilemapBufferToVram: @ 0x08002248
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _080022A4
	adds r0, r4, #0
	bl IsTileMapOutsideWram
	cmp r0, #0
	bne _080022A4
	adds r0, r4, #0
	bl GetBgType
	cmp r0, #0
	beq _08002276
	cmp r0, #1
	beq _08002282
	movs r2, #0
	b _0800228E
_08002276:
	adds r0, r4, #0
	movs r1, #0
	bl GetBgMetricTextMode
	lsls r0, r0, #0x1b
	b _0800228C
_08002282:
	adds r0, r4, #0
	movs r1, #0
	bl GetBgMetricAffineMode
	lsls r0, r0, #0x18
_0800228C:
	lsrs r2, r0, #0x10
_0800228E:
	ldr r0, _080022AC
	lsls r1, r4, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #0
	bl LoadBgVram
_080022A4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080022AC: .4byte 0x030008F8
	thumb_func_end CopyBgTilemapBufferToVram

	thumb_func_start CopyToBgTilemapBufferRect
CopyToBgTilemapBufferRect: @ 0x080022B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r1
	ldr r1, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r4, r4, #0x18
	lsrs r6, r4, #0x18
	adds r0, r5, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _080023A0
	adds r0, r5, #0
	bl IsTileMapOutsideWram
	cmp r0, #0
	bne _080023A0
	adds r0, r5, #0
	bl GetBgType
	cmp r0, #0
	beq _080022FE
	cmp r0, #1
	beq _0800234C
	b _080023A0
_080022FE:
	mov r4, r8
	adds r3, r7, #0
	adds r0, r3, r6
	cmp r3, r0
	bge _080023A0
	mov ip, r0
	lsls r1, r5, #4
	ldr r0, _08002348
	adds r1, r1, r0
	mov r8, r1
_08002312:
	mov r2, sl
	mov r1, sb
	adds r0, r2, r1
	adds r7, r3, #1
	cmp r2, r0
	bge _0800233C
	mov r1, r8
	ldr r6, [r1]
	lsls r5, r3, #5
	adds r3, r0, #0
_08002326:
	adds r0, r5, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r4]
	strh r1, [r0]
	adds r4, #2
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	blt _08002326
_0800233C:
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
	cmp r3, ip
	blt _08002312
	b _080023A0
	.align 2, 0
_08002348: .4byte 0x030008FC
_0800234C:
	mov r4, r8
	adds r0, r5, #0
	movs r1, #1
	bl GetBgMetricAffineMode
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	adds r3, r7, #0
	adds r0, r3, r6
	cmp r3, r0
	bge _080023A0
	mov ip, r0
	lsls r5, r5, #4
	mov r8, r5
_0800236A:
	mov r2, sl
	mov r1, sb
	adds r0, r2, r1
	adds r7, r3, #1
	cmp r2, r0
	bge _08002398
	ldr r6, _080023B0
	add r6, r8
	ldr r1, [sp]
	adds r5, r3, #0
	muls r5, r1, r5
	adds r3, r0, #0
_08002382:
	ldr r1, [r6]
	adds r0, r5, r2
	adds r1, r1, r0
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	blt _08002382
_08002398:
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
	cmp r3, ip
	blt _0800236A
_080023A0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080023B0: .4byte 0x030008FC
	thumb_func_end CopyToBgTilemapBufferRect

	thumb_func_start CopyToBgTilemapBufferRect_ChangePalette
CopyToBgTilemapBufferRect_ChangePalette: @ 0x080023B4
	push {r4, r5, r6, lr}
	sub sp, #0x24
	ldr r4, [sp, #0x34]
	ldr r5, [sp, #0x38]
	ldr r6, [sp, #0x3c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	str r5, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x1c]
	str r2, [sp, #0x20]
	movs r3, #0
	bl CopyRectToBgTilemapBufferRect
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end CopyToBgTilemapBufferRect_ChangePalette

	thumb_func_start CopyRectToBgTilemapBufferRect
CopyRectToBgTilemapBufferRect: @ 0x080023F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	str r1, [sp, #8]
	ldr r1, [sp, #0x60]
	ldr r4, [sp, #0x68]
	ldr r5, [sp, #0x6c]
	ldr r6, [sp, #0x70]
	ldr r7, [sp, #0x74]
	mov r8, r7
	ldr r7, [sp, #0x78]
	mov sb, r7
	ldr r7, [sp, #0x7c]
	mov sl, r7
	ldr r7, [sp, #0x80]
	mov ip, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x10]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x14]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #0x18]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x1c]
	mov r2, sl
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]
	mov r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	ldr r0, [sp, #4]
	bl IsInvalidBg
	cmp r0, #0
	beq _0800246E
	b _080025CA
_0800246E:
	ldr r0, [sp, #4]
	bl IsTileMapOutsideWram
	cmp r0, #0
	beq _0800247A
	b _080025CA
_0800247A:
	ldr r0, [sp, #4]
	movs r1, #4
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	ldr r0, [sp, #4]
	movs r1, #1
	bl GetBgMetricTextMode
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	ldr r0, [sp, #4]
	movs r1, #2
	bl GetBgMetricTextMode
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldr r0, [sp, #4]
	bl GetBgType
	cmp r0, #0
	beq _080024B4
	cmp r0, #1
	beq _08002550
	b _080025CA
_080024B4:
	ldr r1, [sp, #0x10]
	adds r0, r1, #0
	muls r0, r7, r0
	ldr r2, [sp, #0xc]
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, [sp, #8]
	adds r6, r1, r0
	adds r0, r5, r4
	cmp r5, r0
	blt _080024CC
	b _080025CA
_080024CC:
	ldr r2, [sp, #0x18]
	subs r2, r7, r2
	str r2, [sp, #0x34]
	str r0, [sp, #0x38]
_080024D4:
	ldr r4, [sp, #0x14]
	ldr r7, [sp, #0x18]
	adds r0, r4, r7
	adds r1, r5, #1
	str r1, [sp, #0x3c]
	cmp r4, r0
	bge _08002536
	ldr r2, [sp, #4]
	lsls r0, r2, #4
	ldr r1, _0800254C
	adds r0, r0, r1
	mov sl, r0
	ldr r7, [sp, #0x20]
	lsls r7, r7, #0x10
	mov sb, r7
	ldr r1, [sp, #0x24]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_080024FA:
	ldr r2, [sp, #0x2c]
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x28]
	bl GetTileMapIndexFromCoords
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	mov r7, sl
	ldr r1, [r7]
	adds r1, r1, r0
	mov r0, r8
	str r0, [sp]
	adds r0, r6, #0
	ldr r2, [sp, #0x1c]
	mov r7, sb
	asrs r3, r7, #0x10
	bl CopyTileMapEntry
	adds r6, #2
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	adds r0, r1, r2
	cmp r4, r0
	blt _080024FA
_08002536:
	ldr r5, [sp, #0x34]
	lsls r0, r5, #1
	adds r6, r6, r0
	ldr r7, [sp, #0x3c]
	lsls r0, r7, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [sp, #0x38]
	cmp r5, r0
	blt _080024D4
	b _080025CA
	.align 2, 0
_0800254C: .4byte 0x030008FC
_08002550:
	ldr r1, [sp, #0x10]
	adds r0, r1, #0
	muls r0, r7, r0
	ldr r2, [sp, #0xc]
	adds r0, r0, r2
	ldr r1, [sp, #8]
	adds r6, r1, r0
	ldr r0, [sp, #4]
	movs r1, #1
	bl GetBgMetricAffineMode
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r0, r5, r4
	cmp r5, r0
	bge _080025CA
	ldr r2, [sp, #0x18]
	subs r2, r7, r2
	str r2, [sp, #0x34]
	str r0, [sp, #0x38]
	ldr r7, _080025DC
	mov sl, r7
	ldr r0, [sp, #4]
	lsls r0, r0, #4
	mov r8, r0
_08002584:
	ldr r4, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r0, r4, r1
	adds r2, r5, #1
	str r2, [sp, #0x3c]
	cmp r4, r0
	bge _080025BA
	mov r3, r8
	add r3, sl
	mov r7, sb
	muls r7, r5, r7
	mov ip, r7
	adds r2, r0, #0
_0800259E:
	ldr r1, [r3]
	mov r5, ip
	adds r0, r5, r4
	adds r1, r1, r0
	ldrb r0, [r6]
	ldr r7, [sp, #0x20]
	adds r0, r0, r7
	strb r0, [r1]
	adds r6, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r2
	blt _0800259E
_080025BA:
	ldr r0, [sp, #0x34]
	adds r6, r6, r0
	ldr r1, [sp, #0x3c]
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x38]
	cmp r5, r2
	blt _08002584
_080025CA:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080025DC: .4byte 0x030008FC
	thumb_func_end CopyRectToBgTilemapBufferRect

	thumb_func_start FillBgTilemapBufferRect_Palette0
FillBgTilemapBufferRect_Palette0: @ 0x080025E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sb, r4
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl IsInvalidBg
	cmp r0, #0
	bne _080026CC
	adds r0, r6, #0
	bl IsTileMapOutsideWram
	cmp r0, #0
	bne _080026CC
	adds r0, r6, #0
	bl GetBgType
	cmp r0, #0
	beq _08002632
	cmp r0, #1
	beq _0800267C
	b _080026CC
_08002632:
	adds r3, r7, #0
	adds r5, r3, r5
	cmp r3, r5
	bge _080026CC
	adds r7, r5, #0
	lsls r1, r6, #4
	ldr r0, _08002678
	adds r1, r1, r0
	mov ip, r1
_08002644:
	mov r2, sl
	mov r1, sb
	adds r0, r2, r1
	adds r6, r3, #1
	cmp r2, r0
	bge _0800266C
	mov r5, ip
	ldr r4, [r5]
	lsls r3, r3, #5
	adds r1, r0, #0
_08002658:
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	mov r5, r8
	strh r5, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r1
	blt _08002658
_0800266C:
	lsls r0, r6, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r7
	blt _08002644
	b _080026CC
	.align 2, 0
_08002678: .4byte 0x030008FC
_0800267C:
	adds r0, r6, #0
	movs r1, #1
	bl GetBgMetricAffineMode
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	adds r3, r7, #0
	adds r5, r3, r5
	cmp r3, r5
	bge _080026CC
	adds r7, r5, #0
	lsls r6, r6, #4
	mov ip, r6
_08002698:
	mov r2, sl
	mov r1, sb
	adds r0, r2, r1
	adds r6, r3, #1
	cmp r2, r0
	bge _080026C4
	ldr r5, _080026DC
	add r5, ip
	ldr r1, [sp]
	adds r4, r3, #0
	muls r4, r1, r4
	adds r3, r0, #0
_080026B0:
	ldr r0, [r5]
	adds r1, r4, r2
	adds r0, r0, r1
	mov r1, r8
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	blt _080026B0
_080026C4:
	lsls r0, r6, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r7
	blt _08002698
_080026CC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080026DC: .4byte 0x030008FC
	thumb_func_end FillBgTilemapBufferRect_Palette0

	thumb_func_start FillBgTilemapBufferRect
FillBgTilemapBufferRect: @ 0x080026E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	bl WriteSequenceToBgTilemapBuffer
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end FillBgTilemapBufferRect

	thumb_func_start WriteSequenceToBgTilemapBuffer
WriteSequenceToBgTilemapBuffer: @ 0x0800271C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r4, [sp, #0x4c]
	ldr r5, [sp, #0x50]
	ldr r6, [sp, #0x54]
	ldr r7, [sp, #0x58]
	mov r8, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	add r0, sp, #4
	strh r1, [r0]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	lsls r5, r5, #0x18
	lsrs r4, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #0xc]
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r0, sb
	bl IsInvalidBg
	cmp r0, #0
	beq _0800276A
	b _080028B0
_0800276A:
	mov r0, sb
	bl IsTileMapOutsideWram
	cmp r0, #0
	beq _08002776
	b _080028B0
_08002776:
	mov r0, sb
	movs r1, #4
	bl GetBgControlAttribute
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
	mov r0, sb
	movs r1, #1
	bl GetBgMetricTextMode
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r0, sb
	movs r1, #2
	bl GetBgMetricTextMode
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	mov r0, sb
	bl GetBgType
	cmp r0, #0
	beq _080027B0
	cmp r0, #1
	beq _08002838
	b _080028B0
_080027B0:
	adds r5, r7, #0
	adds r0, r5, r4
	cmp r5, r0
	bge _080028B0
	str r0, [sp, #0x24]
	add r7, sp, #4
_080027BC:
	ldr r4, [sp, #8]
	mov r1, sl
	adds r0, r4, r1
	adds r2, r5, #1
	mov r8, r2
	cmp r4, r0
	bge _08002820
	mov r3, sb
	lsls r1, r3, #4
	ldr r0, _08002830
	adds r6, r1, r0
_080027D2:
	ldr r0, [sp, #0x18]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x14]
	bl GetTileMapIndexFromCoords
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	ldr r1, [r6]
	adds r1, r1, r0
	movs r0, #0
	str r0, [sp]
	add r0, sp, #4
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl CopyTileMapEntry
	ldrh r0, [r7]
	movs r2, #0xfc
	lsls r2, r2, #8
	adds r1, r2, #0
	adds r2, r0, #0
	ands r2, r1
	ldr r3, [sp, #0x10]
	adds r0, r0, r3
	ldr r3, _08002834
	adds r1, r3, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r7]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [sp, #8]
	add r0, sl
	cmp r4, r0
	blt _080027D2
_08002820:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x24]
	cmp r5, r2
	blt _080027BC
	b _080028B0
	.align 2, 0
_08002830: .4byte 0x030008FC
_08002834: .4byte 0x000003FF
_08002838:
	mov r0, sb
	movs r1, #1
	bl GetBgMetricAffineMode
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	adds r5, r7, #0
	adds r0, r5, r4
	cmp r5, r0
	bge _080028B0
	str r0, [sp, #0x24]
	mov r3, sb
	lsls r3, r3, #4
	mov ip, r3
_08002856:
	ldr r4, [sp, #8]
	mov r7, sl
	adds r0, r4, r7
	adds r1, r5, #1
	mov r8, r1
	cmp r4, r0
	bge _080028A4
	ldr r2, _080028C0
	add r2, ip
	str r2, [sp, #0x28]
	ldr r7, [sp, #0x20]
	adds r3, r5, #0
	muls r3, r7, r3
	add r2, sp, #4
	movs r1, #0xfc
	lsls r1, r1, #8
	mov sb, r1
	ldr r7, _080028C4
	adds r5, r7, #0
	adds r6, r0, #0
_0800287E:
	ldr r0, [sp, #0x28]
	ldr r1, [r0]
	adds r0, r3, r4
	adds r1, r1, r0
	ldrh r0, [r2]
	strb r0, [r1]
	ldrh r0, [r2]
	mov r1, sb
	ands r1, r0
	ldr r7, [sp, #0x10]
	adds r0, r0, r7
	ands r0, r5
	adds r1, r1, r0
	strh r1, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r6
	blt _0800287E
_080028A4:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x24]
	cmp r5, r2
	blt _08002856
_080028B0:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080028C0: .4byte 0x030008FC
_080028C4: .4byte 0x000003FF
	thumb_func_end WriteSequenceToBgTilemapBuffer

	thumb_func_start GetBgMetricTextMode
GetBgMetricTextMode: @ 0x080028C8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r5, r4, #0
	movs r1, #4
	bl GetBgControlAttribute
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #1
	beq _08002908
	cmp r4, #1
	bgt _080028EC
	cmp r4, #0
	beq _080028F2
	b _0800292E
_080028EC:
	cmp r5, #2
	beq _0800291A
	b _0800292E
_080028F2:
	cmp r0, #2
	bgt _08002900
	cmp r0, #1
	bge _0800292A
_080028FA:
	cmp r0, #0
	beq _08002922
	b _0800292E
_08002900:
	cmp r0, #3
	bne _0800292E
	movs r0, #4
	b _08002930
_08002908:
	cmp r0, #1
	beq _0800292A
	cmp r0, #1
	ble _080028FA
	cmp r0, #2
	beq _08002922
	cmp r0, #3
	bne _0800292E
	b _0800292A
_0800291A:
	cmp r0, #0
	blt _0800292E
	cmp r0, #1
	bgt _08002926
_08002922:
	movs r0, #1
	b _08002930
_08002926:
	cmp r0, #3
	bgt _0800292E
_0800292A:
	movs r0, #2
	b _08002930
_0800292E:
	movs r0, #0
_08002930:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBgMetricTextMode

	thumb_func_start GetBgMetricAffineMode
GetBgMetricAffineMode: @ 0x08002938
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r1, #4
	bl GetBgControlAttribute
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	cmp r4, #0
	beq _08002960
	cmp r4, #0
	blt _08002988
	cmp r4, #2
	bgt _08002988
	movs r0, #0x10
	lsls r0, r1
	b _0800298A
_08002960:
	cmp r1, #1
	beq _0800297C
	cmp r1, #1
	bgt _0800296E
	cmp r1, #0
	beq _08002978
	b _08002988
_0800296E:
	cmp r0, #2
	beq _08002980
	cmp r0, #3
	beq _08002984
	b _08002988
_08002978:
	movs r0, #1
	b _0800298A
_0800297C:
	movs r0, #4
	b _0800298A
_08002980:
	movs r0, #0x10
	b _0800298A
_08002984:
	movs r0, #0x40
	b _0800298A
_08002988:
	movs r0, #0
_0800298A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBgMetricAffineMode

	thumb_func_start GetTileMapIndexFromCoords
GetTileMapIndexFromCoords: @ 0x08002990
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [sp, #8]
	subs r3, #1
	ands r4, r3
	subs r0, #1
	ands r1, r0
	cmp r2, #1
	beq _080029B4
	cmp r2, #1
	ble _080029BC
	cmp r2, #2
	beq _080029BC
	cmp r2, #3
	bne _080029BC
	cmp r1, #0x1f
	ble _080029B4
	adds r1, #0x20
_080029B4:
	cmp r4, #0x1f
	ble _080029BC
	subs r4, #0x20
	adds r1, #0x20
_080029BC:
	lsls r0, r1, #5
	adds r0, r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetTileMapIndexFromCoords

	thumb_func_start CopyTileMapEntry
CopyTileMapEntry: @ 0x080029C8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r5, [sp, #0x10]
	cmp r2, #0x10
	beq _080029F0
	cmp r2, #0x10
	bgt _08002A10
	cmp r2, #0
	blt _08002A10
	ldrh r0, [r4]
	adds r0, r0, r3
	ldr r3, _080029EC
	adds r1, r3, #0
	ands r0, r1
	adds r1, r2, r5
	lsls r1, r1, #0xc
	b _08002A16
	.align 2, 0
_080029EC: .4byte 0x00000FFF
_080029F0:
	ldrh r1, [r6]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r1, r0
	lsls r2, r5, #0xc
	adds r2, r1, r2
	ldrh r0, [r4]
	adds r0, r0, r3
	ldr r3, _08002A0C
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	b _08002A18
	.align 2, 0
_08002A0C: .4byte 0x000003FF
_08002A10:
	ldrh r0, [r4]
	adds r0, r0, r3
	lsls r1, r5, #0xc
_08002A16:
	adds r0, r0, r1
_08002A18:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	strh r1, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end CopyTileMapEntry

	thumb_func_start GetBgType
GetBgType: @ 0x08002A24
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	bl GetBgMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #2
	beq _08002A52
	cmp r4, #2
	ble _08002A42
	cmp r4, #3
	beq _08002A62
	b _08002A6A
_08002A42:
	cmp r5, #0
	blt _08002A6A
	cmp r0, #1
	bgt _08002A6A
	cmp r0, #0
	blt _08002A6A
_08002A4E:
	movs r0, #0
	b _08002A6C
_08002A52:
	cmp r0, #0
	beq _08002A4E
	cmp r0, #0
	blt _08002A6A
	cmp r0, #2
	bgt _08002A6A
_08002A5E:
	movs r0, #1
	b _08002A6C
_08002A62:
	cmp r0, #0
	beq _08002A4E
	cmp r0, #2
	beq _08002A5E
_08002A6A:
	ldr r0, _08002A74
_08002A6C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08002A74: .4byte 0x0000FFFF
	thumb_func_end GetBgType

	thumb_func_start IsInvalidBg
IsInvalidBg: @ 0x08002A78
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08002A86
	movs r0, #0
	b _08002A88
_08002A86:
	movs r0, #1
_08002A88:
	pop {r1}
	bx r1
	thumb_func_end IsInvalidBg

	thumb_func_start IsTileMapOutsideWram
IsTileMapOutsideWram: @ 0x08002A8C
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _08002AA8
	lsrs r0, r0, #0x14
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08002AAC
	cmp r1, r0
	bhi _08002AB0
	cmp r1, #0
	beq _08002AB0
	movs r0, #0
	b _08002AB2
	.align 2, 0
_08002AA8: .4byte 0x030008F8
_08002AAC: .4byte 0x03008000
_08002AB0:
	movs r0, #1
_08002AB2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsTileMapOutsideWram

