.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitEventData
InitEventData: @ 0x0809CBD8
	push {r4, lr}
	ldr r4, _0809CC0C
	ldr r0, [r4]
	ldr r1, _0809CC10
	adds r0, r0, r1
	movs r2, #0x96
	lsls r2, r2, #1
	movs r1, #0
	bl memset
	ldr r0, [r4]
	ldr r1, _0809CC14
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl memset
	ldr r0, _0809CC18
	movs r1, #0
	movs r2, #0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CC0C: .4byte 0x03005AEC
_0809CC10: .4byte 0x00001270
_0809CC14: .4byte 0x0000139C
_0809CC18: .4byte 0x0203729C
	thumb_func_end InitEventData

	thumb_func_start ClearTempFieldEventData
ClearTempFieldEventData: @ 0x0809CC1C
	push {lr}
	ldr r0, _0809CC5C
	ldr r0, [r0]
	ldr r1, _0809CC60
	adds r2, r0, r1
	movs r1, #0
	str r1, [r2]
	ldr r1, _0809CC64
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x20
	bl memset
	ldr r0, _0809CC68
	bl FlagClear
	ldr r0, _0809CC6C
	bl FlagClear
	ldr r0, _0809CC70
	bl FlagClear
	ldr r0, _0809CC74
	bl FlagClear
	movs r0, #0x88
	lsls r0, r0, #4
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0809CC5C: .4byte 0x03005AEC
_0809CC60: .4byte 0x00001270
_0809CC64: .4byte 0x0000139C
_0809CC68: .4byte 0x000008AD
_0809CC6C: .4byte 0x000008AE
_0809CC70: .4byte 0x00000889
_0809CC74: .4byte 0x000008C1
	thumb_func_end ClearTempFieldEventData

	thumb_func_start ClearDailyFlags
ClearDailyFlags: @ 0x0809CC78
	push {lr}
	ldr r0, _0809CC90
	ldr r0, [r0]
	ldr r1, _0809CC94
	adds r0, r0, r1
	movs r1, #0
	movs r2, #8
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0809CC90: .4byte 0x03005AEC
_0809CC94: .4byte 0x00001394
	thumb_func_end ClearDailyFlags

	thumb_func_start DisableNationalPokedex
DisableNationalPokedex: @ 0x0809CC98
	push {lr}
	ldr r0, _0809CCB4
	bl GetVarPointer
	ldr r1, _0809CCB8
	ldr r2, [r1]
	movs r1, #0
	strb r1, [r2, #0x1a]
	strh r1, [r0]
	ldr r0, _0809CCBC
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0809CCB4: .4byte 0x00004046
_0809CCB8: .4byte 0x03005AF0
_0809CCBC: .4byte 0x00000896
	thumb_func_end DisableNationalPokedex

	thumb_func_start EnableNationalPokedex
EnableNationalPokedex: @ 0x0809CCC0
	push {r4, r5, lr}
	ldr r0, _0809CCF4
	bl GetVarPointer
	ldr r4, _0809CCF8
	ldr r2, [r4]
	movs r5, #0
	movs r1, #0xda
	strb r1, [r2, #0x1a]
	ldr r2, _0809CCFC
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0809CD00
	bl FlagSet
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #0x19]
	ldr r0, [r4]
	strb r5, [r0, #0x18]
	bl ResetPokedexScrollPositions
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809CCF4: .4byte 0x00004046
_0809CCF8: .4byte 0x03005AF0
_0809CCFC: .4byte 0x00000302
_0809CD00: .4byte 0x00000896
	thumb_func_end EnableNationalPokedex

	thumb_func_start IsNationalPokedexEnabled
IsNationalPokedexEnabled: @ 0x0809CD04
	push {lr}
	ldr r0, _0809CD30
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	cmp r0, #0xda
	bne _0809CD40
	ldr r0, _0809CD34
	bl VarGet
	lsls r0, r0, #0x10
	ldr r1, _0809CD38
	cmp r0, r1
	bne _0809CD40
	ldr r0, _0809CD3C
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CD40
	movs r0, #1
	b _0809CD42
	.align 2, 0
_0809CD30: .4byte 0x03005AF0
_0809CD34: .4byte 0x00004046
_0809CD38: .4byte 0x03020000
_0809CD3C: .4byte 0x00000896
_0809CD40:
	movs r0, #0
_0809CD42:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsNationalPokedexEnabled

	thumb_func_start DisableMysteryEvent
DisableMysteryEvent: @ 0x0809CD48
	push {lr}
	ldr r0, _0809CD54
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0809CD54: .4byte 0x000008AC
	thumb_func_end DisableMysteryEvent

	thumb_func_start EnableMysteryEvent
EnableMysteryEvent: @ 0x0809CD58
	push {lr}
	ldr r0, _0809CD64
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0809CD64: .4byte 0x000008AC
	thumb_func_end EnableMysteryEvent

	thumb_func_start IsMysteryEventEnabled
IsMysteryEventEnabled: @ 0x0809CD68
	push {lr}
	ldr r0, _0809CD78
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0809CD78: .4byte 0x000008AC
	thumb_func_end IsMysteryEventEnabled

	thumb_func_start DisableMysteryGift
DisableMysteryGift: @ 0x0809CD7C
	push {lr}
	ldr r0, _0809CD88
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0809CD88: .4byte 0x000008DB
	thumb_func_end DisableMysteryGift

	thumb_func_start EnableMysteryGift
EnableMysteryGift: @ 0x0809CD8C
	push {lr}
	ldr r0, _0809CD98
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0809CD98: .4byte 0x000008DB
	thumb_func_end EnableMysteryGift

	thumb_func_start IsMysteryGiftEnabled
IsMysteryGiftEnabled: @ 0x0809CD9C
	push {lr}
	ldr r0, _0809CDAC
	bl FlagGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0809CDAC: .4byte 0x000008DB
	thumb_func_end IsMysteryGiftEnabled

	thumb_func_start sub_0809CDB0
sub_0809CDB0: @ 0x0809CDB0
	push {lr}
	movs r0, #0xf2
	lsls r0, r0, #1
	bl FlagClear
	ldr r0, _0809CE28
	bl FlagClear
	movs r0, #0xf3
	lsls r0, r0, #1
	bl FlagClear
	ldr r0, _0809CE2C
	bl FlagClear
	movs r0, #0xf4
	lsls r0, r0, #1
	bl FlagClear
	ldr r0, _0809CE30
	bl FlagClear
	movs r0, #0xf5
	lsls r0, r0, #1
	bl FlagClear
	ldr r0, _0809CE34
	bl FlagClear
	movs r0, #0xf6
	lsls r0, r0, #1
	bl FlagClear
	ldr r0, _0809CE38
	bl FlagClear
	movs r0, #0xf7
	lsls r0, r0, #1
	bl FlagClear
	ldr r0, _0809CE3C
	bl FlagClear
	movs r0, #0xf8
	lsls r0, r0, #1
	bl FlagClear
	ldr r0, _0809CE40
	bl FlagClear
	movs r0, #0xf9
	lsls r0, r0, #1
	bl FlagClear
	ldr r0, _0809CE44
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0809CE28: .4byte 0x000001E5
_0809CE2C: .4byte 0x000001E7
_0809CE30: .4byte 0x000001E9
_0809CE34: .4byte 0x000001EB
_0809CE38: .4byte 0x000001ED
_0809CE3C: .4byte 0x000001EF
_0809CE40: .4byte 0x000001F1
_0809CE44: .4byte 0x000001F3
	thumb_func_end sub_0809CDB0

	thumb_func_start sub_0809CE48
sub_0809CE48: @ 0x0809CE48
	push {lr}
	ldr r0, _0809CE90
	movs r1, #0
	bl VarSet
	ldr r0, _0809CE94
	movs r1, #0
	bl VarSet
	ldr r0, _0809CE98
	movs r1, #0
	bl VarSet
	ldr r0, _0809CE9C
	movs r1, #0
	bl VarSet
	ldr r0, _0809CEA0
	movs r1, #0
	bl VarSet
	ldr r0, _0809CEA4
	movs r1, #0
	bl VarSet
	ldr r0, _0809CEA8
	movs r1, #0
	bl VarSet
	ldr r0, _0809CEAC
	movs r1, #0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0809CE90: .4byte 0x000040DD
_0809CE94: .4byte 0x000040DE
_0809CE98: .4byte 0x000040DF
_0809CE9C: .4byte 0x000040E0
_0809CEA0: .4byte 0x000040E1
_0809CEA4: .4byte 0x000040E2
_0809CEA8: .4byte 0x000040E3
_0809CEAC: .4byte 0x000040E4
	thumb_func_end sub_0809CE48

	thumb_func_start DisableResetRTC
DisableResetRTC: @ 0x0809CEB0
	push {lr}
	ldr r0, _0809CEC4
	movs r1, #0
	bl VarSet
	ldr r0, _0809CEC8
	bl FlagClear
	pop {r0}
	bx r0
	.align 2, 0
_0809CEC4: .4byte 0x0000402C
_0809CEC8: .4byte 0x000008C2
	thumb_func_end DisableResetRTC

	thumb_func_start EnableResetRTC
EnableResetRTC: @ 0x0809CECC
	push {lr}
	ldr r0, _0809CEE4
	movs r1, #0x92
	lsls r1, r1, #4
	bl VarSet
	ldr r0, _0809CEE8
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0809CEE4: .4byte 0x0000402C
_0809CEE8: .4byte 0x000008C2
	thumb_func_end EnableResetRTC

	thumb_func_start CanResetRTC
CanResetRTC: @ 0x0809CEEC
	push {lr}
	ldr r0, _0809CF10
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CF18
	ldr r0, _0809CF14
	bl VarGet
	lsls r0, r0, #0x10
	movs r1, #0x92
	lsls r1, r1, #0x14
	cmp r0, r1
	bne _0809CF18
	movs r0, #1
	b _0809CF1A
	.align 2, 0
_0809CF10: .4byte 0x000008C2
_0809CF14: .4byte 0x0000402C
_0809CF18:
	movs r0, #0
_0809CF1A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CanResetRTC

	thumb_func_start GetVarPointer
GetVarPointer: @ 0x0809CF20
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	ldr r0, _0809CF34
	cmp r1, r0
	bhi _0809CF38
	movs r0, #0
	b _0809CF60
	.align 2, 0
_0809CF34: .4byte 0x00003FFF
_0809CF38:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0809CF54
	ldr r0, _0809CF4C
	ldr r2, _0809CF50
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	b _0809CF60
	.align 2, 0
_0809CF4C: .4byte 0x081DAF34
_0809CF50: .4byte 0xFFFF8000
_0809CF54:
	ldr r0, _0809CF64
	lsls r1, r2, #1
	ldr r2, _0809CF68
	adds r1, r1, r2
	ldr r0, [r0]
	adds r0, r0, r1
_0809CF60:
	pop {r1}
	bx r1
	.align 2, 0
_0809CF64: .4byte 0x03005AEC
_0809CF68: .4byte 0xFFFF939C
	thumb_func_end GetVarPointer

	thumb_func_start VarGet
VarGet: @ 0x0809CF6C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl GetVarPointer
	cmp r0, #0
	beq _0809CF80
	ldrh r0, [r0]
	b _0809CF82
_0809CF80:
	adds r0, r4, #0
_0809CF82:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarGet

	thumb_func_start VarSet
VarSet: @ 0x0809CF88
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	bl GetVarPointer
	cmp r0, #0
	beq _0809CFA0
	strh r4, [r0]
	movs r0, #1
	b _0809CFA2
_0809CFA0:
	movs r0, #0
_0809CFA2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarSet

	thumb_func_start VarGetEventObjectGraphicsId
VarGetEventObjectGraphicsId: @ 0x0809CFA8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	ldr r1, _0809CFC0
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	bl VarGet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0809CFC0: .4byte 0x40100000
	thumb_func_end VarGetEventObjectGraphicsId

	thumb_func_start GetFlagPointer
GetFlagPointer: @ 0x0809CFC4
	push {lr}
	lsls r1, r0, #0x10
	lsrs r2, r1, #0x10
	adds r3, r2, #0
	cmp r2, #0
	bne _0809CFD4
	movs r0, #0
	b _0809D006
_0809CFD4:
	ldr r0, _0809CFE8
	cmp r2, r0
	bhi _0809CFF4
	ldr r0, _0809CFEC
	lsrs r1, r1, #0x13
	ldr r2, _0809CFF0
	adds r1, r1, r2
	ldr r0, [r0]
	b _0809D004
	.align 2, 0
_0809CFE8: .4byte 0x00003FFF
_0809CFEC: .4byte 0x03005AEC
_0809CFF0: .4byte 0x00001270
_0809CFF4:
	ldr r1, _0809D00C
	adds r0, r3, r1
	cmp r0, #0
	bge _0809D000
	ldr r2, _0809D010
	adds r0, r3, r2
_0809D000:
	asrs r0, r0, #3
	ldr r1, _0809D014
_0809D004:
	adds r0, r0, r1
_0809D006:
	pop {r1}
	bx r1
	.align 2, 0
_0809D00C: .4byte 0xFFFFC000
_0809D010: .4byte 0xFFFFC007
_0809D014: .4byte 0x0203729C
	thumb_func_end GetFlagPointer

	thumb_func_start FlagSet
FlagSet: @ 0x0809D018
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl GetFlagPointer
	adds r2, r0, #0
	cmp r2, #0
	beq _0809D038
	movs r0, #7
	ands r0, r4
	movs r1, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
_0809D038:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagSet

	thumb_func_start FlagClear
FlagClear: @ 0x0809D040
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl GetFlagPointer
	adds r2, r0, #0
	cmp r2, #0
	beq _0809D060
	movs r0, #7
	ands r0, r4
	movs r1, #1
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_0809D060:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagClear

	thumb_func_start FlagGet
FlagGet: @ 0x0809D068
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl GetFlagPointer
	cmp r0, #0
	beq _0809D08C
	ldrb r0, [r0]
	movs r1, #7
	ands r1, r4
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0809D08C
	movs r0, #1
	b _0809D08E
_0809D08C:
	movs r0, #0
_0809D08E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagGet

