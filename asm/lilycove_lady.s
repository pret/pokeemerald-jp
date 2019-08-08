.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start GetLilycoveLadyId
GetLilycoveLadyId: @ 0x0818D6D8
	ldr r0, _0818D6E4
	ldr r0, [r0]
	ldr r1, _0818D6E8
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0818D6E4: .4byte 0x03005AEC
_0818D6E8: .4byte 0x00003B58
	thumb_func_end GetLilycoveLadyId

	thumb_func_start sub_0818D6EC
sub_0818D6EC: @ 0x0818D6EC
	push {r4, r5, lr}
	ldr r5, _0818D730
	ldr r4, _0818D734
	bl GetLilycoveLadyId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r0, r5, #0
	bl VarSet
	bl GetLilycoveLadyId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0818D74C
	ldr r0, _0818D738
	ldr r1, [r0]
	ldr r0, _0818D73C
	adds r1, r1, r0
	ldr r0, _0818D740
	ldr r2, _0818D744
	ldrb r1, [r1, #0xd]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	bl VarSet
	ldr r1, _0818D748
	movs r0, #1
	b _0818D750
	.align 2, 0
_0818D730: .4byte 0x00004010
_0818D734: .4byte 0x085D3ADE
_0818D738: .4byte 0x03005AEC
_0818D73C: .4byte 0x00003B58
_0818D740: .4byte 0x00004011
_0818D744: .4byte 0x085D3AD4
_0818D748: .4byte 0x02037290
_0818D74C:
	ldr r1, _0818D758
	movs r0, #0
_0818D750:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818D758: .4byte 0x02037290
	thumb_func_end sub_0818D6EC

	thumb_func_start SetLilycoveLady
SetLilycoveLady: @ 0x0818D75C
	push {lr}
	ldr r0, _0818D784
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	lsls r1, r1, #8
	ldrb r0, [r0, #0xa]
	orrs r0, r1
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	adds r1, r0, #0
	cmp r0, #1
	beq _0818D794
	cmp r0, #1
	bgt _0818D788
	cmp r0, #0
	beq _0818D78E
	b _0818D79E
	.align 2, 0
_0818D784: .4byte 0x03005AF0
_0818D788:
	cmp r1, #2
	beq _0818D79A
	b _0818D79E
_0818D78E:
	bl SetLilycoveQuizLady
	b _0818D79E
_0818D794:
	bl SetLilycoveFavourLady
	b _0818D79E
_0818D79A:
	bl SetLilycoveContestLady
_0818D79E:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetLilycoveLady

	thumb_func_start sub_0818D7A4
sub_0818D7A4: @ 0x0818D7A4
	push {lr}
	bl GetLilycoveLadyId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0818D7C8
	cmp r0, #1
	bgt _0818D7BC
	cmp r0, #0
	beq _0818D7C2
	b _0818D7D2
_0818D7BC:
	cmp r0, #2
	beq _0818D7CE
	b _0818D7D2
_0818D7C2:
	bl sub_0818DD10
	b _0818D7D2
_0818D7C8:
	bl sub_0818D8F0
	b _0818D7D2
_0818D7CE:
	bl sub_0818E2D0
_0818D7D2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818D7A4

	thumb_func_start SetLilycoveLadyRandomly
SetLilycoveLadyRandomly: @ 0x0818D7D8
	push {lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _0818D808
	cmp r0, #1
	bgt _0818D7FC
	cmp r0, #0
	beq _0818D802
	b _0818D812
_0818D7FC:
	cmp r1, #2
	beq _0818D80E
	b _0818D812
_0818D802:
	bl SetLilycoveQuizLady
	b _0818D812
_0818D808:
	bl SetLilycoveFavourLady
	b _0818D812
_0818D80E:
	bl SetLilycoveContestLady
_0818D812:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetLilycoveLadyRandomly

	thumb_func_start sub_0818D818
sub_0818D818: @ 0x0818D818
	push {r4, lr}
	ldr r4, _0818D82C
	bl GetLilycoveLadyId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818D82C: .4byte 0x02037290
	thumb_func_end sub_0818D818

	thumb_func_start sub_0818D830
sub_0818D830: @ 0x0818D830
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	b _0818D840
_0818D838:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r1, #2
_0818D840:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0818D838
	adds r0, r2, #0
	pop {r1}
	bx r1
	thumb_func_end sub_0818D830

	thumb_func_start sub_0818D84C
sub_0818D84C: @ 0x0818D84C
	push {r4, r5, r6, lr}
	bl Random
	ldr r5, _0818D8A0
	ldr r4, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #6
	bl __umodsi3
	strb r0, [r4, #0xc]
	ldr r6, _0818D8A4
	ldr r0, [r5]
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl sub_0818D830
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __modsi3
	lsls r0, r0, #0x18
	ldr r2, [r5]
	ldrb r1, [r2, #0xc]
	lsls r1, r1, #2
	adds r1, r1, r6
	ldr r1, [r1]
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818D8A0: .4byte 0x0203CA30
_0818D8A4: .4byte 0x085D3D6C
	thumb_func_end sub_0818D84C

	thumb_func_start SetLilycoveFavourLady
SetLilycoveFavourLady: @ 0x0818D8A8
	push {lr}
	ldr r2, _0818D8E0
	ldr r0, _0818D8E4
	ldr r0, [r0]
	ldr r1, _0818D8E8
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	strb r3, [r0, #1]
	ldr r1, [r2]
	movs r0, #0xff
	strb r0, [r1, #4]
	ldr r0, [r2]
	strb r3, [r0, #2]
	ldr r0, [r2]
	strb r3, [r0, #3]
	ldr r1, [r2]
	strh r3, [r1, #0xe]
	ldr r0, _0818D8EC
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	bl sub_0818D84C
	pop {r0}
	bx r0
	.align 2, 0
_0818D8E0: .4byte 0x0203CA30
_0818D8E4: .4byte 0x03005AEC
_0818D8E8: .4byte 0x00003B58
_0818D8EC: .4byte 0x0829BDA5
	thumb_func_end SetLilycoveFavourLady

	thumb_func_start sub_0818D8F0
sub_0818D8F0: @ 0x0818D8F0
	ldr r3, _0818D908
	ldr r0, _0818D90C
	ldr r0, [r0]
	ldr r1, _0818D910
	adds r0, r0, r1
	str r0, [r3]
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r3]
	strb r2, [r0, #1]
	bx lr
	.align 2, 0
_0818D908: .4byte 0x0203CA30
_0818D90C: .4byte 0x03005AEC
_0818D910: .4byte 0x00003B58
	thumb_func_end sub_0818D8F0

	thumb_func_start sub_0818D914
sub_0818D914: @ 0x0818D914
	push {lr}
	ldr r1, _0818D92C
	ldr r0, _0818D930
	ldr r0, [r0]
	ldr r2, _0818D934
	adds r0, r0, r2
	str r0, [r1]
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0818D938
	movs r0, #2
	b _0818D942
	.align 2, 0
_0818D92C: .4byte 0x0203CA30
_0818D930: .4byte 0x03005AEC
_0818D934: .4byte 0x00003B58
_0818D938:
	cmp r0, #1
	beq _0818D940
	movs r0, #0
	b _0818D942
_0818D940:
	movs r0, #1
_0818D942:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0818D914

	thumb_func_start sub_0818D948
sub_0818D948: @ 0x0818D948
	lsls r0, r0, #0x18
	ldr r1, _0818D954
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0818D954: .4byte 0x085D3CA4
	thumb_func_end sub_0818D948

	thumb_func_start sub_0818D958
sub_0818D958: @ 0x0818D958
	push {r4, lr}
	ldr r1, _0818D97C
	ldr r0, _0818D980
	ldr r0, [r0]
	ldr r2, _0818D984
	adds r0, r0, r2
	str r0, [r1]
	ldr r4, _0818D988
	ldrb r0, [r0, #0xc]
	bl sub_0818D948
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818D97C: .4byte 0x0203CA30
_0818D980: .4byte 0x03005AEC
_0818D984: .4byte 0x00003B58
_0818D988: .4byte 0x02021C40
	thumb_func_end sub_0818D958

	thumb_func_start sub_0818D98C
sub_0818D98C: @ 0x0818D98C
	push {lr}
	ldr r1, _0818D9A4
	ldr r0, _0818D9A8
	ldr r2, [r0]
	ldr r3, _0818D9AC
	adds r0, r2, r3
	str r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne _0818D9B0
	movs r0, #0
	b _0818D9BC
	.align 2, 0
_0818D9A4: .4byte 0x0203CA30
_0818D9A8: .4byte 0x03005AEC
_0818D9AC: .4byte 0x00003B58
_0818D9B0:
	ldr r0, _0818D9C0
	ldr r3, _0818D9C4
	adds r1, r2, r3
	bl StringCopy7
	movs r0, #1
_0818D9BC:
	pop {r1}
	bx r1
	.align 2, 0
_0818D9C0: .4byte 0x02021C68
_0818D9C4: .4byte 0x00003B5C
	thumb_func_end sub_0818D98C

	thumb_func_start sub_0818D9C8
sub_0818D9C8: @ 0x0818D9C8
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818D9C8

	thumb_func_start sub_0818D9E4
sub_0818D9E4: @ 0x0818D9E4
	push {lr}
	ldr r2, _0818DA00
	ldr r0, _0818DA04
	ldr r1, [r0]
	ldr r0, _0818DA08
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0818DA0C
	ldrh r1, [r1, #0xe]
	bl sub_0818D9C8
	pop {r0}
	bx r0
	.align 2, 0
_0818DA00: .4byte 0x0203CA30
_0818DA04: .4byte 0x03005AEC
_0818DA08: .4byte 0x00003B58
_0818DA0C: .4byte 0x02021C54
	thumb_func_end sub_0818D9E4

	thumb_func_start sub_0818DA10
sub_0818DA10: @ 0x0818DA10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #8
	bl memset
	adds r0, r4, #0
	adds r1, r5, #0
	bl StringCopy7
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818DA10

	thumb_func_start sub_0818DA30
sub_0818DA30: @ 0x0818DA30
	push {lr}
	ldr r2, _0818DA4C
	ldr r0, _0818DA50
	ldr r0, [r0]
	ldr r3, _0818DA54
	adds r1, r0, r3
	str r1, [r2]
	ldr r1, _0818DA58
	adds r0, r0, r1
	ldr r1, _0818DA5C
	bl sub_0818DA10
	pop {r0}
	bx r0
	.align 2, 0
_0818DA4C: .4byte 0x0203CA30
_0818DA50: .4byte 0x03005AEC
_0818DA54: .4byte 0x00003B58
_0818DA58: .4byte 0x00003B5C
_0818DA5C: .4byte 0x02021C68
	thumb_func_end sub_0818DA30

	thumb_func_start sub_0818DA60
sub_0818DA60: @ 0x0818DA60
	ldr r1, _0818DA78
	ldr r0, _0818DA7C
	ldr r0, [r0]
	ldr r2, _0818DA80
	adds r0, r0, r2
	str r0, [r1]
	ldrb r1, [r0, #2]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0818DA78: .4byte 0x0203CA30
_0818DA7C: .4byte 0x03005AEC
_0818DA80: .4byte 0x00003B58
	thumb_func_end sub_0818DA60

	thumb_func_start sub_0818DA84
sub_0818DA84: @ 0x0818DA84
	push {lr}
	bl sub_081AA9C8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818DA84

	thumb_func_start sub_0818DA90
sub_0818DA90: @ 0x0818DA90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r4, _0818DB18
	ldr r0, _0818DB1C
	ldr r0, [r0]
	ldr r1, _0818DB20
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _0818DB24
	mov r8, r1
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	bl sub_0818D830
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, _0818DB28
	adds r1, r5, #0
	bl sub_0818D9C8
	ldr r1, [r4]
	strh r5, [r1, #0xe]
	ldr r0, _0818DB2C
	ldr r0, [r0]
	adds r1, #4
	bl sub_0818DA10
	ldr r1, [r4]
	ldr r0, _0818DB30
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	movs r7, #0
	movs r3, #0
	cmp r7, r6
	bhs _0818DB42
	mov ip, r8
_0818DAE8:
	ldr r2, [r4]
	ldrb r0, [r2, #0xc]
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	bne _0818DB34
	movs r7, #1
	ldrb r0, [r2, #3]
	adds r0, #1
	strb r0, [r2, #3]
	ldr r0, [r4]
	strb r7, [r0, #2]
	ldr r1, [r4]
	ldrh r0, [r1, #0x10]
	cmp r0, r5
	bne _0818DB42
	movs r0, #5
	strb r0, [r1, #3]
	b _0818DB42
	.align 2, 0
_0818DB18: .4byte 0x0203CA30
_0818DB1C: .4byte 0x03005AEC
_0818DB20: .4byte 0x00003B58
_0818DB24: .4byte 0x085D3D6C
_0818DB28: .4byte 0x02021C54
_0818DB2C: .4byte 0x03005AF0
_0818DB30: .4byte 0x0829BDA5
_0818DB34:
	movs r0, #0
	strb r0, [r2, #2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r6
	blo _0818DAE8
_0818DB42:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0818DA90

	thumb_func_start sub_0818DB50
sub_0818DB50: @ 0x0818DB50
	push {lr}
	ldr r0, _0818DB64
	ldrh r0, [r0]
	bl sub_0818DA90
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0818DB64: .4byte 0x0203CB48
	thumb_func_end sub_0818DB50

	thumb_func_start sub_0818DB68
sub_0818DB68: @ 0x0818DB68
	push {lr}
	ldr r1, _0818DB88
	ldr r0, _0818DB8C
	ldr r0, [r0]
	ldr r2, _0818DB90
	adds r0, r0, r2
	str r0, [r1]
	ldrb r0, [r0, #3]
	movs r1, #0
	cmp r0, #4
	bls _0818DB80
	movs r1, #1
_0818DB80:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0818DB88: .4byte 0x0203CA30
_0818DB8C: .4byte 0x03005AEC
_0818DB90: .4byte 0x00003B58
	thumb_func_end sub_0818DB68

	thumb_func_start sub_0818DB94
sub_0818DB94: @ 0x0818DB94
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _0818DBA8
	bl sub_0818D9C8
	pop {r0}
	bx r0
	.align 2, 0
_0818DBA8: .4byte 0x02021C54
	thumb_func_end sub_0818DB94

	thumb_func_start sub_0818DBAC
sub_0818DBAC: @ 0x0818DBAC
	push {r4, r5, lr}
	ldr r5, _0818DBD8
	ldr r0, _0818DBDC
	ldr r0, [r0]
	ldr r1, _0818DBE0
	adds r0, r0, r1
	str r0, [r5]
	ldr r1, _0818DBE4
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_0818DB94
	ldr r1, [r5]
	movs r0, #2
	strb r0, [r1, #1]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0818DBD8: .4byte 0x0203CA30
_0818DBDC: .4byte 0x03005AEC
_0818DBE0: .4byte 0x00003B58
_0818DBE4: .4byte 0x085D3D84
	thumb_func_end sub_0818DBAC

	thumb_func_start sub_0818DBE8
sub_0818DBE8: @ 0x0818DBE8
	push {lr}
	bl SetLilycoveFavourLady
	ldr r0, _0818DBFC
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0818DBFC: .4byte 0x0203CA30
	thumb_func_end sub_0818DBE8

	thumb_func_start sub_0818DC00
sub_0818DC00: @ 0x0818DC00
	push {lr}
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818DC00

	thumb_func_start sub_0818DC0C
sub_0818DC0C: @ 0x0818DC0C
	push {r4, r5, r6, r7, lr}
	bl Random
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xf
	ands r4, r0
	movs r3, #0
	ldr r5, _0818DC64
	ldr r1, _0818DC68
	lsls r0, r4, #2
	adds r6, r0, r1
	adds r7, r5, #0
_0818DC26:
	ldr r2, [r5]
	lsls r1, r3, #1
	adds r2, #2
	adds r2, r2, r1
	ldr r0, [r6]
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bls _0818DC26
	ldr r2, [r7]
	ldr r0, _0818DC6C
	lsls r1, r4, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2, #0x14]
	ldr r0, _0818DC70
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #0x28]
	adds r2, #0x2b
	strb r4, [r2]
	ldr r1, [r7]
	movs r0, #0xff
	strb r0, [r1, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818DC64: .4byte 0x0203CA34
_0818DC68: .4byte 0x085D3C04
_0818DC6C: .4byte 0x085D3C44
_0818DC70: .4byte 0x085D3C64
	thumb_func_end sub_0818DC0C

	thumb_func_start SetLilycoveQuizLady
SetLilycoveQuizLady: @ 0x0818DC74
	push {r4, r5, r6, lr}
	ldr r2, _0818DCFC
	ldr r0, _0818DD00
	ldr r0, [r0]
	ldr r1, _0818DD04
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #1]
	movs r3, #0
	adds r4, r2, #0
	ldr r6, _0818DD08
	adds r5, r4, #0
	ldr r0, _0818DD0C
	adds r2, r0, #0
_0818DC96:
	ldr r1, [r5]
	lsls r0, r3, #1
	adds r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bls _0818DC96
	ldr r0, [r4]
	ldr r1, _0818DD0C
	strh r1, [r0, #0x14]
	movs r1, #1
	rsbs r1, r1, #0
	strh r1, [r0, #0x16]
	movs r3, #0
	adds r5, r4, #0
	movs r2, #0
_0818DCC0:
	ldr r0, [r5]
	lsls r1, r3, #1
	adds r0, #0x20
	adds r0, r0, r1
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0818DCC0
	ldr r0, [r4]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x28]
	adds r0, #0x2a
	strb r2, [r0]
	ldr r0, [r4]
	adds r0, #0x2c
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, [r4]
	ldrb r1, [r6]
	adds r0, #0x2d
	strb r1, [r0]
	bl sub_0818DC0C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818DCFC: .4byte 0x0203CA34
_0818DD00: .4byte 0x03005AEC
_0818DD04: .4byte 0x00003B58
_0818DD08: .4byte 0x0829BDA5
_0818DD0C: .4byte 0x0000FFFF
	thumb_func_end SetLilycoveQuizLady

	thumb_func_start sub_0818DD10
sub_0818DD10: @ 0x0818DD10
	ldr r2, _0818DD34
	ldr r0, _0818DD38
	ldr r0, [r0]
	ldr r1, _0818DD3C
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #1]
	ldr r0, [r2]
	adds r0, #0x2a
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, _0818DD40
	strh r0, [r1, #0x16]
	bx lr
	.align 2, 0
_0818DD34: .4byte 0x0203CA34
_0818DD38: .4byte 0x03005AEC
_0818DD3C: .4byte 0x00003B58
_0818DD40: .4byte 0x0000FFFF
	thumb_func_end sub_0818DD10

	thumb_func_start sub_0818DD44
sub_0818DD44: @ 0x0818DD44
	push {lr}
	ldr r1, _0818DD5C
	ldr r0, _0818DD60
	ldr r0, [r0]
	ldr r2, _0818DD64
	adds r0, r0, r2
	str r0, [r1]
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0818DD68
	movs r0, #2
	b _0818DD72
	.align 2, 0
_0818DD5C: .4byte 0x0203CA34
_0818DD60: .4byte 0x03005AEC
_0818DD64: .4byte 0x00003B58
_0818DD68:
	cmp r0, #1
	beq _0818DD70
	movs r0, #0
	b _0818DD72
_0818DD70:
	movs r0, #1
_0818DD72:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0818DD44

	thumb_func_start sub_0818DD78
sub_0818DD78: @ 0x0818DD78
	push {lr}
	bl sub_0818DDA4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0818DD8A
	movs r0, #2
	b _0818DD9E
_0818DD8A:
	cmp r0, #2
	beq _0818DD98
	bl sub_0818DE50
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818DD9C
_0818DD98:
	movs r0, #1
	b _0818DD9E
_0818DD9C:
	movs r0, #0
_0818DD9E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0818DD78

	thumb_func_start sub_0818DDA4
sub_0818DDA4: @ 0x0818DDA4
	push {r4, r5, r6, r7, lr}
	movs r7, #1
	ldr r5, _0818DDC8
	ldr r0, _0818DDCC
	ldr r1, [r0]
	ldr r2, _0818DDD0
	adds r0, r1, r2
	str r0, [r5]
	ldrb r0, [r0, #0x18]
	cmp r0, #0xff
	bne _0818DDDC
	ldr r0, _0818DDD4
	ldr r1, _0818DDD8
	bl StringCopy7
	movs r7, #0
	b _0818DE36
	.align 2, 0
_0818DDC8: .4byte 0x0203CA34
_0818DDCC: .4byte 0x03005AEC
_0818DDD0: .4byte 0x00003B58
_0818DDD4: .4byte 0x02021C40
_0818DDD8: .4byte 0x085D3D90
_0818DDDC:
	ldr r0, _0818DE40
	ldr r2, _0818DE44
	adds r1, r1, r2
	bl StringCopy7
	ldr r0, [r5]
	adds r0, #0x18
	bl sub_0818DEB4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _0818DE48
	ldr r0, [r6]
	bl sub_0818DEB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0818DE36
	ldr r0, [r5]
	movs r2, #0
	cmp r2, r4
	bhs _0818DE36
	ldr r1, [r6]
	ldrb r0, [r0, #0x18]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0818DE34
_0818DE14:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r4
	bhs _0818DE36
	ldr r0, _0818DE4C
	ldr r1, [r0]
	adds r1, #0x18
	adds r1, r1, r2
	ldr r0, _0818DE48
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0818DE14
_0818DE34:
	movs r7, #2
_0818DE36:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0818DE40: .4byte 0x02021C40
_0818DE44: .4byte 0x00003B70
_0818DE48: .4byte 0x03005AF0
_0818DE4C: .4byte 0x0203CA34
	thumb_func_end sub_0818DDA4

	thumb_func_start sub_0818DE50
sub_0818DE50: @ 0x0818DE50
	push {r4, r5, r6, lr}
	ldr r3, _0818DEA0
	ldr r0, _0818DEA4
	ldr r1, [r0]
	ldr r2, _0818DEA8
	adds r0, r1, r2
	str r0, [r3]
	movs r5, #0
	movs r4, #0
	ldr r0, _0818DEAC
	adds r1, r1, r0
	ldr r0, _0818DEB0
	ldr r2, [r0]
	ldrh r1, [r1]
	adds r6, r3, #0
	adds r3, r0, #0
	ldrb r2, [r2, #0xa]
	cmp r1, r2
	bne _0818DE96
_0818DE76:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _0818DE98
	ldr r1, [r6]
	lsls r0, r4, #1
	adds r1, #0x20
	adds r1, r1, r0
	ldr r0, [r3]
	adds r0, #0xa
	adds r0, r0, r4
	ldrh r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0818DE76
_0818DE96:
	movs r5, #1
_0818DE98:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0818DEA0: .4byte 0x0203CA34
_0818DEA4: .4byte 0x03005AEC
_0818DEA8: .4byte 0x00003B58
_0818DEAC: .4byte 0x00003B78
_0818DEB0: .4byte 0x03005AF0
	thumb_func_end sub_0818DE50

	thumb_func_start sub_0818DEB4
sub_0818DEB4: @ 0x0818DEB4
	push {lr}
	movs r2, #0
	adds r1, r0, #0
	b _0818DEC4
_0818DEBC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r1, #1
_0818DEC4:
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0818DEBC
	adds r0, r2, #0
	pop {r1}
	bx r1
	thumb_func_end sub_0818DEB4

	thumb_func_start sub_0818DED0
sub_0818DED0: @ 0x0818DED0
	push {r4, lr}
	ldr r4, _0818DEEC
	ldr r0, _0818DEF0
	ldr r0, [r0]
	ldrh r0, [r0, #0x28]
	bl ItemId_GetName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818DEEC: .4byte 0x02021C40
_0818DEF0: .4byte 0x0203CA34
	thumb_func_end sub_0818DED0

	thumb_func_start sub_0818DEF4
sub_0818DEF4: @ 0x0818DEF4
	push {r4, lr}
	ldr r4, _0818DF10
	ldr r0, _0818DF14
	ldr r0, [r0]
	ldr r1, _0818DF18
	adds r0, r0, r1
	str r0, [r4]
	bl sub_0818DDA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818DF1C
	movs r0, #0
	b _0818DF28
	.align 2, 0
_0818DF10: .4byte 0x0203CA34
_0818DF14: .4byte 0x03005AEC
_0818DF18: .4byte 0x00003B58
_0818DF1C:
	ldr r0, [r4]
	ldr r1, _0818DF30
	ldrb r1, [r1]
	adds r0, #0x2d
	strb r1, [r0]
	movs r0, #1
_0818DF28:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0818DF30: .4byte 0x0829BDA5
	thumb_func_end sub_0818DEF4

	thumb_func_start sub_0818DF34
sub_0818DF34: @ 0x0818DF34
	ldr r2, _0818DF48
	ldr r0, _0818DF4C
	ldr r0, [r0]
	ldr r3, _0818DF50
	adds r1, r0, r3
	str r1, [r2]
	ldr r1, _0818DF54
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0818DF48: .4byte 0x0203CA34
_0818DF4C: .4byte 0x03005AEC
_0818DF50: .4byte 0x00003B58
_0818DF54: .4byte 0x00003B82
	thumb_func_end sub_0818DF34

	thumb_func_start sub_0818DF58
sub_0818DF58: @ 0x0818DF58
	push {lr}
	bl ShowEasyChatScreen
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818DF58

	thumb_func_start sub_0818DF64
sub_0818DF64: @ 0x0818DF64
	push {r4, r5, r6, lr}
	ldr r5, _0818DFA0
	ldr r0, _0818DFA4
	ldr r0, [r0]
	ldr r1, _0818DFA8
	adds r0, r0, r1
	str r0, [r5]
	ldr r6, _0818DFAC
	ldrh r1, [r0, #0x14]
	adds r0, r6, #0
	bl CopyEasyChatWord
	ldr r4, _0818DFB0
	ldr r0, [r5]
	ldrh r1, [r0, #0x16]
	adds r0, r4, #0
	bl CopyEasyChatWord
	adds r0, r6, #0
	adds r1, r4, #0
	bl StringCompare
	movs r1, #0
	cmp r0, #0
	bne _0818DF98
	movs r1, #1
_0818DF98:
	adds r0, r1, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0818DFA0: .4byte 0x0203CA34
_0818DFA4: .4byte 0x03005AEC
_0818DFA8: .4byte 0x00003B58
_0818DFAC: .4byte 0x02021C40
_0818DFB0: .4byte 0x02021C54
	thumb_func_end sub_0818DF64

	thumb_func_start sub_0818DFB4
sub_0818DFB4: @ 0x0818DFB4
	ldr r1, _0818DFC8
	ldr r0, _0818DFCC
	ldr r0, [r0]
	ldr r2, _0818DFD0
	adds r0, r0, r2
	str r0, [r1]
	ldr r1, _0818DFD4
	ldrh r0, [r0, #0x28]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0818DFC8: .4byte 0x0203CA34
_0818DFCC: .4byte 0x03005AEC
_0818DFD0: .4byte 0x00003B58
_0818DFD4: .4byte 0x02037282
	thumb_func_end sub_0818DFB4

	thumb_func_start sub_0818DFD8
sub_0818DFD8: @ 0x0818DFD8
	ldr r1, _0818DFEC
	ldr r0, _0818DFF0
	ldr r0, [r0]
	ldr r2, _0818DFF4
	adds r0, r0, r2
	str r0, [r1]
	movs r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_0818DFEC: .4byte 0x0203CA34
_0818DFF0: .4byte 0x03005AEC
_0818DFF4: .4byte 0x00003B58
	thumb_func_end sub_0818DFD8

	thumb_func_start sub_0818DFF8
sub_0818DFF8: @ 0x0818DFF8
	ldr r1, _0818E00C
	ldr r0, _0818E010
	ldr r0, [r0]
	ldr r2, _0818E014
	adds r0, r0, r2
	str r0, [r1]
	movs r1, #2
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_0818E00C: .4byte 0x0203CA34
_0818E010: .4byte 0x03005AEC
_0818E014: .4byte 0x00003B58
	thumb_func_end sub_0818DFF8

	thumb_func_start sub_0818E018
sub_0818E018: @ 0x0818E018
	ldr r1, _0818E02C
	ldr r0, _0818E030
	ldr r0, [r0]
	ldr r2, _0818E034
	adds r0, r0, r2
	str r0, [r1]
	ldr r1, _0818E038
	strh r1, [r0, #0x16]
	bx lr
	.align 2, 0
_0818E02C: .4byte 0x0203CA34
_0818E030: .4byte 0x03005AEC
_0818E034: .4byte 0x00003B58
_0818E038: .4byte 0x0000FFFF
	thumb_func_end sub_0818E018

	thumb_func_start sub_0818E03C
sub_0818E03C: @ 0x0818E03C
	push {lr}
	bl sub_081AA9E8
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818E03C

	thumb_func_start sub_0818E048
sub_0818E048: @ 0x0818E048
	push {r4, lr}
	ldr r4, _0818E06C
	ldr r0, _0818E070
	ldr r0, [r0]
	ldr r1, _0818E074
	adds r0, r0, r1
	str r0, [r4]
	bl sub_0818DEF4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0818E078
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, #0x2c
	b _0818E07E
	.align 2, 0
_0818E06C: .4byte 0x0203CA34
_0818E070: .4byte 0x03005AEC
_0818E074: .4byte 0x00003B58
_0818E078:
	ldr r0, [r4]
	adds r0, #0x2c
	movs r1, #0x10
_0818E07E:
	strb r1, [r0]
	bl sub_0818DC0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818E048

	thumb_func_start sub_0818E08C
sub_0818E08C: @ 0x0818E08C
	push {r4, r5, lr}
	ldr r1, _0818E0C8
	ldr r0, _0818E0CC
	ldr r0, [r0]
	ldr r2, _0818E0D0
	adds r0, r0, r2
	str r0, [r1]
	movs r2, #0
	adds r5, r1, #0
	adds r4, r5, #0
	ldr r0, _0818E0D4
	adds r3, r0, #0
_0818E0A4:
	ldr r1, [r4]
	lsls r0, r2, #1
	adds r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #8
	bls _0818E0A4
	ldr r1, [r5]
	ldr r0, _0818E0D4
	strh r0, [r1, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818E0C8: .4byte 0x0203CA34
_0818E0CC: .4byte 0x03005AEC
_0818E0D0: .4byte 0x00003B58
_0818E0D4: .4byte 0x0000FFFF
	thumb_func_end sub_0818E08C

	thumb_func_start sub_0818E0D8
sub_0818E0D8: @ 0x0818E0D8
	push {lr}
	ldr r1, _0818E0E8
	movs r0, #0x11
	strh r0, [r1]
	bl ShowEasyChatScreen
	pop {r0}
	bx r0
	.align 2, 0
_0818E0E8: .4byte 0x02037280
	thumb_func_end sub_0818E0D8

	thumb_func_start sub_0818E0EC
sub_0818E0EC: @ 0x0818E0EC
	push {lr}
	ldr r0, _0818E0FC
	ldrh r0, [r0]
	movs r1, #1
	bl RemoveBagItem
	pop {r0}
	bx r0
	.align 2, 0
_0818E0FC: .4byte 0x0203CB48
	thumb_func_end sub_0818E0EC

	thumb_func_start sub_0818E100
sub_0818E100: @ 0x0818E100
	push {r4, r5, r6, lr}
	ldr r2, _0818E154
	ldr r0, _0818E158
	ldr r0, [r0]
	ldr r1, _0818E15C
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _0818E160
	ldrh r1, [r1]
	strh r1, [r0, #0x28]
	movs r3, #0
	adds r4, r2, #0
	ldr r6, _0818E164
	adds r5, r4, #0
	adds r2, r6, #0
_0818E11E:
	ldr r1, [r5]
	lsls r0, r3, #1
	adds r1, #0x20
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, #0xa
	adds r0, r0, r3
	ldrb r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0818E11E
	ldr r0, [r4]
	adds r0, #0x18
	ldr r1, [r6]
	bl StringCopy7
	ldr r0, [r4]
	ldr r1, _0818E168
	ldrb r1, [r1]
	adds r0, #0x2d
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0818E154: .4byte 0x0203CA34
_0818E158: .4byte 0x03005AEC
_0818E15C: .4byte 0x00003B58
_0818E160: .4byte 0x0203CB48
_0818E164: .4byte 0x03005AF0
_0818E168: .4byte 0x0829BDA5
	thumb_func_end sub_0818E100

	thumb_func_start sub_0818E16C
sub_0818E16C: @ 0x0818E16C
	ldr r2, _0818E184
	ldr r0, _0818E188
	ldr r0, [r0]
	ldr r3, _0818E18C
	adds r1, r0, r3
	str r1, [r2]
	ldr r1, _0818E190
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0818E184: .4byte 0x0203CA34
_0818E188: .4byte 0x03005AEC
_0818E18C: .4byte 0x00003B58
_0818E190: .4byte 0x00003B82
	thumb_func_end sub_0818E16C

	thumb_func_start sub_0818E194
sub_0818E194: @ 0x0818E194
	push {lr}
	ldr r2, _0818E1B0
	ldr r0, _0818E1B4
	ldr r1, [r0]
	ldr r0, _0818E1B8
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0818E1BC
	ldrh r1, [r1, #0x14]
	bl CopyEasyChatWord
	pop {r0}
	bx r0
	.align 2, 0
_0818E1B0: .4byte 0x0203CA34
_0818E1B4: .4byte 0x03005AEC
_0818E1B8: .4byte 0x00003B58
_0818E1BC: .4byte 0x02021C68
	thumb_func_end sub_0818E194

	thumb_func_start sub_0818E1C0
sub_0818E1C0: @ 0x0818E1C0
	push {lr}
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0818E1C0

	thumb_func_start sub_0818E1CC
sub_0818E1CC: @ 0x0818E1CC
	push {r4, r5, r6, r7, lr}
	ldr r2, _0818E250
	ldr r1, _0818E254
	ldr r1, [r1]
	ldr r4, _0818E258
	adds r3, r1, r4
	str r3, [r2]
	adds r6, r0, #0
	adds r6, #0x2c
	ldrb r4, [r6]
	adds r7, r2, #0
	cmp r4, #0xf
	bhi _0818E248
	ldrb r0, [r3]
	cmp r0, #0
	bne _0818E248
	movs r5, #0
	ldr r2, _0818E25C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r4, r0
	bne _0818E240
	adds r4, r7, #0
_0818E1FA:
	bl Random
	ldr r2, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf
	ands r0, r1
	adds r2, #0x2b
	strb r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bhi _0818E222
	ldr r0, [r4]
	adds r0, #0x2b
	ldrb r1, [r6]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0818E1FA
_0818E222:
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0x2b
	ldrb r0, [r6]
	ldr r7, _0818E250
	ldrb r4, [r2]
	cmp r0, r4
	bne _0818E240
	ldrb r1, [r2]
	adds r3, r1, #1
	adds r0, r3, #0
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r3, r0
	strb r0, [r2]
_0818E240:
	ldr r0, [r7]
	ldrb r1, [r6]
	adds r0, #0x2c
	strb r1, [r0]
_0818E248:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0818E250: .4byte 0x0203CA34
_0818E254: .4byte 0x03005AEC
_0818E258: .4byte 0x00003B58
_0818E25C: .4byte 0x00003B83
	thumb_func_end sub_0818E1CC

	thumb_func_start sub_0818E260
sub_0818E260: @ 0x0818E260
	push {r4, lr}
	ldr r4, _0818E290
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #4]
	ldr r0, [r4]
	movs r1, #0
	strb r1, [r0, #2]
	ldr r0, [r4]
	strb r1, [r0, #3]
	ldr r0, [r4]
	strb r1, [r0, #0xc]
	bl Random
	ldr r4, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __umodsi3
	strb r0, [r4, #0xd]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818E290: .4byte 0x0203CA38
	thumb_func_end sub_0818E260

	thumb_func_start SetLilycoveContestLady
SetLilycoveContestLady: @ 0x0818E294
	push {r4, lr}
	ldr r4, _0818E2C0
	ldr r0, _0818E2C4
	ldr r0, [r0]
	ldr r1, _0818E2C8
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r4]
	strb r2, [r0, #1]
	bl sub_0818E260
	ldr r1, [r4]
	ldr r0, _0818E2CC
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818E2C0: .4byte 0x0203CA38
_0818E2C4: .4byte 0x03005AEC
_0818E2C8: .4byte 0x00003B58
_0818E2CC: .4byte 0x0829BDA5
	thumb_func_end SetLilycoveContestLady

	thumb_func_start sub_0818E2D0
sub_0818E2D0: @ 0x0818E2D0
	push {lr}
	ldr r2, _0818E300
	ldr r0, _0818E304
	ldr r0, [r0]
	ldr r1, _0818E308
	adds r0, r0, r1
	str r0, [r2]
	movs r3, #0
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r2]
	strb r3, [r0, #1]
	ldr r2, [r2]
	ldrb r0, [r2, #2]
	cmp r0, #5
	beq _0818E2F6
	ldrb r0, [r2, #3]
	cmp r0, #5
	bne _0818E2FA
_0818E2F6:
	bl sub_0818E260
_0818E2FA:
	pop {r0}
	bx r0
	.align 2, 0
_0818E300: .4byte 0x0203CA38
_0818E304: .4byte 0x03005AEC
_0818E308: .4byte 0x00003B58
	thumb_func_end sub_0818E2D0

	thumb_func_start sub_0818E30C
sub_0818E30C: @ 0x0818E30C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r4, _0818E34C
	ldr r0, _0818E350
	ldr r0, [r0]
	ldr r3, _0818E354
	adds r1, r0, r3
	str r1, [r4]
	ldrb r0, [r1, #0xc]
	cmp r0, r2
	bhi _0818E346
	strb r2, [r1, #0xc]
	ldr r0, [r4]
	adds r0, #4
	movs r1, #0xff
	movs r2, #8
	bl memset
	ldr r1, [r4]
	ldr r0, _0818E358
	adds r1, #4
	ldr r0, [r0]
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r1, [r4]
	ldr r0, _0818E35C
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
_0818E346:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818E34C: .4byte 0x0203CA38
_0818E350: .4byte 0x03005AEC
_0818E354: .4byte 0x00003B58
_0818E358: .4byte 0x03005AF0
_0818E35C: .4byte 0x0829BDA5
	thumb_func_end sub_0818E30C

	thumb_func_start GivePokeblockToContestLady
GivePokeblockToContestLady: @ 0x0818E360
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r3, #0
	movs r4, #0
	ldr r1, _0818E388
	ldr r0, _0818E38C
	ldr r0, [r0]
	ldr r5, _0818E390
	adds r0, r0, r5
	str r0, [r1]
	ldrb r0, [r0, #0xd]
	adds r5, r1, #0
	cmp r0, #4
	bhi _0818E3C6
	lsls r0, r0, #2
	ldr r1, _0818E394
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0818E388: .4byte 0x0203CA38
_0818E38C: .4byte 0x03005AEC
_0818E390: .4byte 0x00003B58
_0818E394: .4byte 0x0818E398
_0818E398: @ jump table
	.4byte _0818E3AC @ case 0
	.4byte _0818E3B0 @ case 1
	.4byte _0818E3B4 @ case 2
	.4byte _0818E3B8 @ case 3
	.4byte _0818E3BC @ case 4
_0818E3AC:
	ldrb r0, [r2, #1]
	b _0818E3BE
_0818E3B0:
	ldrb r0, [r2, #2]
	b _0818E3BE
_0818E3B4:
	ldrb r0, [r2, #3]
	b _0818E3BE
_0818E3B8:
	ldrb r0, [r2, #4]
	b _0818E3BE
_0818E3BC:
	ldrb r0, [r2, #5]
_0818E3BE:
	cmp r0, #0
	beq _0818E3C6
	adds r3, r0, #0
	movs r4, #1
_0818E3C6:
	cmp r4, #1
	bne _0818E3E0
	adds r0, r3, #0
	bl sub_0818E30C
	ldr r0, _0818E3DC
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	b _0818E3E8
	.align 2, 0
_0818E3DC: .4byte 0x0203CA38
_0818E3E0:
	ldr r1, [r5]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
_0818E3E8:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GivePokeblockToContestLady

	thumb_func_start sub_0818E3F0
sub_0818E3F0: @ 0x0818E3F0
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _0818E428
	ldr r1, _0818E42C
	ldr r1, [r1]
	ldr r2, _0818E430
	adds r1, r1, r2
	str r1, [r4]
	ldr r2, _0818E434
	ldrb r1, [r1, #0xd]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldr r1, _0818E438
	ldr r0, [r4]
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl StringCopy10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0818E428: .4byte 0x0203CA38
_0818E42C: .4byte 0x03005AEC
_0818E430: .4byte 0x00003B58
_0818E434: .4byte 0x085D3DDC
_0818E438: .4byte 0x085D3DB0
	thumb_func_end sub_0818E3F0

	thumb_func_start sub_0818E43C
sub_0818E43C: @ 0x0818E43C
	push {r4, lr}
	adds r3, r1, #0
	ldr r2, _0818E468
	ldr r1, _0818E46C
	ldr r1, [r1]
	ldr r4, _0818E470
	adds r1, r1, r4
	str r1, [r2]
	ldrb r2, [r1, #0xd]
	strb r2, [r0]
	ldr r2, _0818E474
	ldrb r0, [r1, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r3, #0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818E468: .4byte 0x0203CA38
_0818E46C: .4byte 0x03005AEC
_0818E470: .4byte 0x00003B58
_0818E474: .4byte 0x085D3DB0
	thumb_func_end sub_0818E43C

	thumb_func_start sub_0818E478
sub_0818E478: @ 0x0818E478
	push {r4, lr}
	ldr r3, _0818E494
	ldr r1, _0818E498
	ldr r1, [r1]
	ldr r4, _0818E49C
	adds r2, r1, r4
	str r2, [r3]
	ldr r2, _0818E4A0
	adds r1, r1, r2
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0818E494: .4byte 0x0203CA38
_0818E498: .4byte 0x03005AEC
_0818E49C: .4byte 0x00003B58
_0818E4A0: .4byte 0x00003B5C
	thumb_func_end sub_0818E478

	thumb_func_start sub_0818E4A4
sub_0818E4A4: @ 0x0818E4A4
	ldr r2, _0818E4B8
	ldr r1, _0818E4BC
	ldr r1, [r1]
	ldr r3, _0818E4C0
	adds r1, r1, r3
	str r1, [r2]
	ldrb r1, [r1, #0xe]
	strb r1, [r0]
	bx lr
	.align 2, 0
_0818E4B8: .4byte 0x0203CA38
_0818E4BC: .4byte 0x03005AEC
_0818E4C0: .4byte 0x00003B58
	thumb_func_end sub_0818E4A4

	thumb_func_start sub_0818E4C4
sub_0818E4C4: @ 0x0818E4C4
	push {lr}
	lsls r1, r1, #0x18
	ldr r2, _0818E4D8
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_0818E4D8: .4byte 0x085D3DDC
	thumb_func_end sub_0818E4C4

	thumb_func_start sub_0818E4DC
sub_0818E4DC: @ 0x0818E4DC
	push {lr}
	ldr r1, _0818E4F4
	ldr r0, _0818E4F8
	ldr r0, [r0]
	ldr r2, _0818E4FC
	adds r0, r0, r2
	str r0, [r1]
	ldrb r0, [r0, #2]
	cmp r0, #4
	bls _0818E500
	movs r0, #1
	b _0818E50A
	.align 2, 0
_0818E4F4: .4byte 0x0203CA38
_0818E4F8: .4byte 0x03005AEC
_0818E4FC: .4byte 0x00003B58
_0818E500:
	cmp r0, #0
	beq _0818E508
	movs r0, #0
	b _0818E50A
_0818E508:
	movs r0, #2
_0818E50A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0818E4DC

	thumb_func_start sub_0818E510
sub_0818E510: @ 0x0818E510
	push {lr}
	ldr r1, _0818E528
	ldr r0, _0818E52C
	ldr r0, [r0]
	ldr r2, _0818E530
	adds r0, r0, r2
	str r0, [r1]
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _0818E534
	movs r0, #0
	b _0818E536
	.align 2, 0
_0818E528: .4byte 0x0203CA38
_0818E52C: .4byte 0x03005AEC
_0818E530: .4byte 0x00003B58
_0818E534:
	movs r0, #1
_0818E536:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0818E510

	thumb_func_start sub_0818E53C
sub_0818E53C: @ 0x0818E53C
	push {r4, lr}
	movs r3, #0
	ldr r1, _0818E564
	ldr r0, _0818E568
	ldr r0, [r0]
	ldr r4, _0818E56C
	adds r2, r0, r4
	str r2, [r1]
	ldrb r0, [r2, #2]
	cmp r0, #4
	bhi _0818E558
	ldrb r0, [r2, #3]
	cmp r0, #4
	bls _0818E55A
_0818E558:
	movs r3, #1
_0818E55A:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0818E564: .4byte 0x0203CA38
_0818E568: .4byte 0x03005AEC
_0818E56C: .4byte 0x00003B58
	thumb_func_end sub_0818E53C

	thumb_func_start sub_0818E570
sub_0818E570: @ 0x0818E570
	push {lr}
	ldr r0, _0818E580
	ldr r1, _0818E584
	bl sub_0818E3F0
	pop {r0}
	bx r0
	.align 2, 0
_0818E580: .4byte 0x02021C54
_0818E584: .4byte 0x02021C40
	thumb_func_end sub_0818E570

	thumb_func_start sub_0818E588
sub_0818E588: @ 0x0818E588
	push {lr}
	ldr r1, _0818E598
	movs r0, #3
	bl sub_08135850
	pop {r0}
	bx r0
	.align 2, 0
_0818E598: .4byte 0x08085A31
	thumb_func_end sub_0818E588

	thumb_func_start sub_0818E59C
sub_0818E59C: @ 0x0818E59C
	ldr r1, _0818E5B0
	ldr r0, _0818E5B4
	ldr r0, [r0]
	ldr r2, _0818E5B8
	adds r0, r0, r2
	str r0, [r1]
	movs r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_0818E5B0: .4byte 0x0203CA38
_0818E5B4: .4byte 0x03005AEC
_0818E5B8: .4byte 0x00003B58
	thumb_func_end sub_0818E59C

	thumb_func_start sub_0818E5BC
sub_0818E5BC: @ 0x0818E5BC
	ldr r1, _0818E5D8
	ldr r0, _0818E5DC
	ldr r0, [r0]
	ldr r2, _0818E5E0
	adds r0, r0, r2
	str r0, [r1]
	ldr r2, _0818E5E4
	ldr r1, _0818E5E8
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_0818E5D8: .4byte 0x0203CA38
_0818E5DC: .4byte 0x03005AEC
_0818E5E0: .4byte 0x00003B58
_0818E5E4: .4byte 0x02037282
_0818E5E8: .4byte 0x085D3DF0
	thumb_func_end sub_0818E5BC

	thumb_func_start sub_0818E5EC
sub_0818E5EC: @ 0x0818E5EC
	ldr r1, _0818E5FC
	ldr r0, _0818E600
	ldr r0, [r0]
	ldr r2, _0818E604
	adds r0, r0, r2
	str r0, [r1]
	ldrb r0, [r0, #0xd]
	bx lr
	.align 2, 0
_0818E5FC: .4byte 0x0203CA38
_0818E600: .4byte 0x03005AEC
_0818E604: .4byte 0x00003B58
	thumb_func_end sub_0818E5EC

	thumb_func_start sub_0818E608
sub_0818E608: @ 0x0818E608
	push {lr}
	ldr r1, _0818E620
	ldr r0, _0818E624
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	thumb_func_end sub_0818E608

	thumb_func_start sub_0818E61C
sub_0818E61C: @ 0x0818E61C
	bx r0
	.align 2, 0
_0818E620: .4byte 0x085D5B0C
_0818E624: .4byte 0x02037280
	thumb_func_end sub_0818E61C

