.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start TryBufferWaldaPhrase
TryBufferWaldaPhrase: @ 0x081D92F8
	push {r4, lr}
	bl IsWaldaPhraseEmpty
	cmp r0, #0
	bne _081D9318
	ldr r4, _081D9314
	bl GetWaldaPhrasePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	movs r0, #1
	b _081D931A
	.align 2, 0
_081D9314: .4byte 0x02021C40
_081D9318:
	movs r0, #0
_081D931A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryBufferWaldaPhrase

	thumb_func_start DoWaldaNamingScreen
DoWaldaNamingScreen: @ 0x081D9320
	push {r4, lr}
	sub sp, #8
	ldr r4, _081D9350
	bl GetWaldaPhrasePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	movs r0, #0
	str r0, [sp]
	ldr r0, _081D9354
	str r0, [sp, #4]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl DoNamingScreen
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081D9350: .4byte 0x02021C54
_081D9354: .4byte 0x081D9359
	thumb_func_end DoWaldaNamingScreen

	thumb_func_start CB2_HandleGivenWaldaPhrase
CB2_HandleGivenWaldaPhrase: @ 0x081D9358
	push {r4, r5, lr}
	ldr r4, _081D9378
	ldr r5, _081D937C
	adds r0, r5, #0
	bl GetWaldaPhraseInputCase
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #1
	beq _081D93A4
	cmp r0, #1
	bgt _081D9380
	cmp r0, #0
	beq _081D939E
	b _081D93A4
	.align 2, 0
_081D9378: .4byte 0x02037280
_081D937C: .4byte 0x02021C54
_081D9380:
	cmp r0, #2
	bne _081D93A4
	bl IsWaldaPhraseEmpty
	cmp r0, #0
	beq _081D9398
	ldr r0, _081D9394
	bl SetWaldaPhrase
	b _081D93A4
	.align 2, 0
_081D9394: .4byte 0x085FC010
_081D9398:
	movs r0, #1
	strh r0, [r4]
	b _081D93A4
_081D939E:
	adds r0, r5, #0
	bl SetWaldaPhrase
_081D93A4:
	ldr r4, _081D93C4
	bl GetWaldaPhrasePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldr r1, _081D93C8
	ldr r0, _081D93CC
	str r0, [r1]
	ldr r0, _081D93D0
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081D93C4: .4byte 0x02021C40
_081D93C8: .4byte 0x03005B0C
_081D93CC: .4byte 0x080AEA65
_081D93D0: .4byte 0x08085A31
	thumb_func_end CB2_HandleGivenWaldaPhrase

	thumb_func_start GetWaldaPhraseInputCase
GetWaldaPhraseInputCase: @ 0x081D93D4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _081D93E2
	movs r0, #2
	b _081D93F8
_081D93E2:
	bl GetWaldaPhrasePtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCompare
	cmp r0, #0
	beq _081D93F6
	movs r0, #0
	b _081D93F8
_081D93F6:
	movs r0, #1
_081D93F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetWaldaPhraseInputCase

	thumb_func_start TryGetWallpaperWithWaldaPhrase
TryGetWallpaperWithWaldaPhrase: @ 0x081D9400
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r0, _081D9474
	ldr r0, [r0]
	adds r0, #0xa
	bl GetTrainerId
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _081D9478
	mov r8, r0
	bl GetWaldaPhrasePtr
	mov r7, sp
	adds r7, #0xa
	add r6, sp, #0xc
	mov r5, sp
	adds r5, #0xd
	str r4, [sp]
	str r0, [sp, #4]
	add r0, sp, #8
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl TryCalculateWallpaper
	mov r1, r8
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _081D945A
	ldrb r0, [r5]
	bl SetWaldaWallpaperPatternId
	ldrb r0, [r6]
	bl SetWaldaWallpaperIconId
	add r0, sp, #8
	ldrh r0, [r0]
	ldrh r1, [r7]
	bl SetWaldaWallpaperColors
_081D945A:
	mov r1, r8
	ldrh r0, [r1]
	bl SetWaldaWallpaperLockedOrUnlocked
	mov r1, r8
	ldrb r0, [r1]
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_081D9474: .4byte 0x03005AF0
_081D9478: .4byte 0x02037290
	thumb_func_end TryGetWallpaperWithWaldaPhrase

	thumb_func_start TryCalculateWallpaper
TryCalculateWallpaper: @ 0x081D947C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	str r2, [sp, #0x24]
	str r3, [sp, #0x28]
	ldr r0, [sp, #0x4c]
	ldr r6, [sp, #0x50]
	lsls r5, r0, #0x10
	lsrs r0, r5, #0x10
	mov sl, r0
	adds r0, r6, #0
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc
	bne _081D9562
	movs r4, #0
	add r7, sp, #0x10
	lsrs r5, r5, #0x18
	mov sb, r5
	adds r2, r7, #0
_081D94B2:
	adds r1, r2, r4
	adds r0, r6, r4
	ldrb r0, [r0]
	subs r0, #1
	strb r0, [r1]
	adds r4, #1
	cmp r4, #0xb
	ble _081D94B2
	movs r6, #2
	movs r5, #0
	movs r1, #6
	mov r8, r1
	movs r4, #0xb
_081D94CC:
	mov r0, r8
	str r0, [sp]
	add r0, sp, #4
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_081D9640
	adds r6, #8
	adds r5, #6
	subs r4, #1
	cmp r4, #0
	bge _081D94CC
	add r0, sp, #4
	movs r1, #9
	movs r2, #0x15
	bl sub_081D9574
	add r0, sp, #4
	ldrb r0, [r0, #8]
	movs r2, #0xf
	ands r2, r0
	add r0, sp, #4
	movs r1, #8
	bl sub_081D9574
	add r0, sp, #4
	ldrb r2, [r0, #8]
	lsrs r2, r2, #4
	movs r1, #8
	bl sub_081D95C0
	add r0, sp, #4
	ldrb r2, [r0, #6]
	adds r1, r0, #0
	ldrb r0, [r0]
	ldrb r1, [r1, #2]
	eors r0, r1
	add r1, sp, #4
	ldrb r4, [r1, #4]
	eors r0, r4
	mov r1, sb
	eors r0, r1
	cmp r2, r0
	bne _081D9562
	add r0, sp, #4
	ldrb r3, [r0, #7]
	adds r2, r0, #0
	ldrb r1, [r0, #1]
	ldrb r0, [r2, #3]
	eors r1, r0
	adds r0, r2, #0
	ldrb r2, [r0, #5]
	eors r1, r2
	movs r0, #0xff
	mov r5, sl
	ands r0, r5
	eors r1, r0
	cmp r3, r1
	bne _081D9562
	add r0, sp, #4
	ldrh r0, [r0]
	ldr r1, [sp, #0x1c]
	strh r0, [r1]
	mov r0, sp
	adds r0, #6
	ldrh r0, [r0]
	ldr r5, [sp, #0x20]
	strh r0, [r5]
	ldr r0, [sp, #0x24]
	strb r4, [r0]
	ldr r1, [sp, #0x28]
	strb r2, [r1]
	movs r0, #1
	b _081D9564
_081D9562:
	movs r0, #0
_081D9564:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TryCalculateWallpaper

	thumb_func_start sub_081D9574
sub_081D9574: @ 0x081D9574
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	mov ip, r1
	subs r3, r2, #1
	cmp r2, #0
	beq _081D95BA
_081D9580:
	ldrb r1, [r7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x1f
	mov r2, ip
	subs r2, #1
	subs r5, r3, #1
	cmp r2, #0
	blt _081D95B0
	movs r6, #0x80
	adds r3, r2, r7
_081D9598:
	ldrb r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsls r1, r1, #1
	orrs r4, r1
	strb r4, [r3]
	lsrs r4, r0, #0x1f
	subs r3, #1
	subs r2, #1
	cmp r2, #0
	bge _081D9598
_081D95B0:
	adds r3, r5, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _081D9580
_081D95BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D9574

	thumb_func_start sub_081D95C0
sub_081D95C0: @ 0x081D95C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	lsls r0, r3, #4
	orrs r3, r0
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	movs r4, #0
	cmp r4, r5
	bhs _081D95E8
_081D95D8:
	adds r2, r6, r4
	ldrb r1, [r2]
	adds r0, r3, #0
	eors r0, r1
	strb r0, [r2]
	adds r4, #1
	cmp r4, r5
	blo _081D95D8
_081D95E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_081D95C0

	thumb_func_start sub_081D95F0
sub_081D95F0: @ 0x081D95F0
	push {lr}
	lsrs r3, r1, #3
	movs r2, #7
	ands r2, r1
	movs r1, #0x80
	asrs r1, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _081D9608
	movs r0, #1
_081D9608:
	pop {r1}
	bx r1
	thumb_func_end sub_081D95F0

	thumb_func_start sub_081D960C
sub_081D960C: @ 0x081D960C
	lsrs r3, r1, #3
	movs r2, #7
	ands r2, r1
	movs r1, #0x80
	asrs r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r0, r3
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_081D960C

	thumb_func_start sub_081D9624
sub_081D9624: @ 0x081D9624
	lsrs r3, r1, #3
	movs r2, #7
	ands r2, r1
	movs r1, #0x80
	asrs r1, r2
	mvns r1, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r0, r3
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end sub_081D9624

	thumb_func_start sub_081D9640
sub_081D9640: @ 0x081D9640
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	mov sb, r1
	adds r1, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x1c]
	movs r5, #0
	cmp r5, r7
	bhs _081D9684
	adds r4, r1, #0
_081D965A:
	mov r0, r8
	adds r1, r0, r5
	mov r0, sb
	bl sub_081D95F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _081D9674
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_081D960C
	b _081D967C
_081D9674:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_081D9624
_081D967C:
	adds r4, #1
	adds r5, #1
	cmp r5, r7
	blo _081D965A
_081D9684:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_081D9640

	thumb_func_start sub_081D9690
sub_081D9690: @ 0x081D9690
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _081D96B4
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _081D9750
	lsls r0, r0, #2
	ldr r1, _081D96B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081D96B4: .4byte 0x03005B60
_081D96B8: .4byte 0x081D96BC
_081D96BC: @ jump table
	.4byte _081D96D0 @ case 0
	.4byte _081D96F0 @ case 1
	.4byte _081D9710 @ case 2
	.4byte _081D9730 @ case 3
	.4byte _081D9750 @ case 4
_081D96D0:
	ldr r4, _081D96E4
	ldr r0, _081D96E8
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081D96EC
	adds r0, r0, r1
	movs r1, #0x32
	b _081D9760
	.align 2, 0
_081D96E4: .4byte 0x02039BD1
_081D96E8: .4byte 0x02039BC4
_081D96EC: .4byte 0x02024190
_081D96F0:
	ldr r4, _081D9704
	ldr r0, _081D9708
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081D970C
	adds r0, r0, r1
	movs r1, #0x33
	b _081D9760
	.align 2, 0
_081D9704: .4byte 0x02039BD1
_081D9708: .4byte 0x02039BC4
_081D970C: .4byte 0x02024190
_081D9710:
	ldr r4, _081D9724
	ldr r0, _081D9728
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081D972C
	adds r0, r0, r1
	movs r1, #0x34
	b _081D9760
	.align 2, 0
_081D9724: .4byte 0x02039BD1
_081D9728: .4byte 0x02039BC4
_081D972C: .4byte 0x02024190
_081D9730:
	ldr r4, _081D9744
	ldr r0, _081D9748
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081D974C
	adds r0, r0, r1
	movs r1, #0x35
	b _081D9760
	.align 2, 0
_081D9744: .4byte 0x02039BD1
_081D9748: .4byte 0x02039BC4
_081D974C: .4byte 0x02024190
_081D9750:
	ldr r4, _081D97A0
	ldr r0, _081D97A4
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, _081D97A8
	adds r0, r0, r1
	movs r1, #0x36
_081D9760:
	bl GetMonData
	strb r0, [r4]
	ldr r5, _081D97AC
	ldr r4, _081D97B0
	ldrb r0, [r4]
	lsls r0, r0, #6
	adds r0, r0, r5
	ldr r1, _081D97A0
	ldrb r1, [r1]
	adds r0, #0x2c
	strb r1, [r0]
	ldr r0, _081D97B4
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	ldrb r1, [r4]
	lsls r1, r1, #6
	adds r1, r1, r5
	adds r1, #0x2d
	strb r0, [r1]
	ldr r1, _081D97B8
	ldr r2, _081D97BC
	adds r0, r6, #0
	bl SetTaskFuncWithFollowupFunc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_081D97A0: .4byte 0x02039BD1
_081D97A4: .4byte 0x02039BC4
_081D97A8: .4byte 0x02024190
_081D97AC: .4byte 0x02039AA0
_081D97B0: .4byte 0x02039BC5
_081D97B4: .4byte 0x00000864
_081D97B8: .4byte 0x081D9A0D
_081D97BC: .4byte 0x081D97C1
	thumb_func_end sub_081D9690

	thumb_func_start GetLetterTableId
GetLetterTableId: @ 0x081D97C0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _081D97D4
	ldr r2, _081D97D8
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_081D97D4: .4byte 0x081D9AD5
_081D97D8: .4byte 0x081D97DD
	thumb_func_end GetLetterTableId

