.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ScriptGetPokedexInfo
ScriptGetPokedexInfo: @ 0x08137ABC
	push {lr}
	ldr r0, _08137AD8
	ldrh r0, [r0]
	cmp r0, #0
	bne _08137AE0
	movs r0, #0
	bl GetHoennPokedexCount
	ldr r1, _08137ADC
	strh r0, [r1]
	movs r0, #1
	bl GetHoennPokedexCount
	b _08137AF0
	.align 2, 0
_08137AD8: .4byte 0x02037280
_08137ADC: .4byte 0x02037282
_08137AE0:
	movs r0, #0
	bl GetNationalPokedexCount
	ldr r1, _08137B00
	strh r0, [r1]
	movs r0, #1
	bl GetNationalPokedexCount
_08137AF0:
	ldr r1, _08137B04
	strh r0, [r1]
	bl IsNationalPokedexEnabled
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08137B00: .4byte 0x02037282
_08137B04: .4byte 0x02037284
	thumb_func_end ScriptGetPokedexInfo

	thumb_func_start GetPokedexRatingText
GetPokedexRatingText: @ 0x08137B08
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #9
	bhi _08137B14
	b _08137C6C
_08137B14:
	cmp r0, #0x13
	bhi _08137B20
	ldr r0, _08137B1C
	b _08137C76
	.align 2, 0
_08137B1C: .4byte 0x08262E81
_08137B20:
	cmp r0, #0x1d
	bhi _08137B2C
	ldr r0, _08137B28
	b _08137C76
	.align 2, 0
_08137B28: .4byte 0x08262EA6
_08137B2C:
	cmp r0, #0x27
	bhi _08137B38
	ldr r0, _08137B34
	b _08137C76
	.align 2, 0
_08137B34: .4byte 0x08262ECF
_08137B38:
	cmp r0, #0x31
	bhi _08137B44
	ldr r0, _08137B40
	b _08137C76
	.align 2, 0
_08137B40: .4byte 0x08262EF5
_08137B44:
	cmp r0, #0x3b
	bhi _08137B50
	ldr r0, _08137B4C
	b _08137C76
	.align 2, 0
_08137B4C: .4byte 0x08262F18
_08137B50:
	cmp r0, #0x45
	bhi _08137B5C
	ldr r0, _08137B58
	b _08137C76
	.align 2, 0
_08137B58: .4byte 0x08262F3F
_08137B5C:
	cmp r0, #0x4f
	bhi _08137B68
	ldr r0, _08137B64
	b _08137C76
	.align 2, 0
_08137B64: .4byte 0x08262F61
_08137B68:
	cmp r0, #0x59
	bhi _08137B74
	ldr r0, _08137B70
	b _08137C76
	.align 2, 0
_08137B70: .4byte 0x08262F8A
_08137B74:
	cmp r0, #0x63
	bhi _08137B80
	ldr r0, _08137B7C
	b _08137C76
	.align 2, 0
_08137B7C: .4byte 0x08262FAD
_08137B80:
	cmp r0, #0x6d
	bhi _08137B8C
	ldr r0, _08137B88
	b _08137C76
	.align 2, 0
_08137B88: .4byte 0x08262FE1
_08137B8C:
	cmp r0, #0x77
	bhi _08137B98
	ldr r0, _08137B94
	b _08137C76
	.align 2, 0
_08137B94: .4byte 0x0826300C
_08137B98:
	cmp r0, #0x81
	bhi _08137BA4
	ldr r0, _08137BA0
	b _08137C76
	.align 2, 0
_08137BA0: .4byte 0x08263032
_08137BA4:
	cmp r0, #0x8b
	bhi _08137BB0
	ldr r0, _08137BAC
	b _08137C76
	.align 2, 0
_08137BAC: .4byte 0x08263050
_08137BB0:
	cmp r0, #0x95
	bhi _08137BBC
	ldr r0, _08137BB8
	b _08137C76
	.align 2, 0
_08137BB8: .4byte 0x08263072
_08137BBC:
	cmp r0, #0x9f
	bhi _08137BC8
	ldr r0, _08137BC4
	b _08137C76
	.align 2, 0
_08137BC4: .4byte 0x08263095
_08137BC8:
	cmp r0, #0xa9
	bhi _08137BD4
	ldr r0, _08137BD0
	b _08137C76
	.align 2, 0
_08137BD0: .4byte 0x082630C7
_08137BD4:
	cmp r0, #0xb3
	bhi _08137BE0
	ldr r0, _08137BDC
	b _08137C76
	.align 2, 0
_08137BDC: .4byte 0x082630F0
_08137BE0:
	cmp r0, #0xbd
	bhi _08137BEC
	ldr r0, _08137BE8
	b _08137C76
	.align 2, 0
_08137BE8: .4byte 0x0826310C
_08137BEC:
	cmp r0, #0xc7
	bls _08137C5A
	cmp r0, #0xc8
	bne _08137C28
	ldr r0, _08137C24
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08137C5A
	movs r0, #0xcd
	lsls r0, r0, #1
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08137C5A
	b _08137C74
	.align 2, 0
_08137C24: .4byte 0x00000199
_08137C28:
	cmp r0, #0xc9
	bne _08137C68
	ldr r0, _08137C60
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08137C74
	movs r0, #0xcd
	lsls r0, r0, #1
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08137C74
_08137C5A:
	ldr r0, _08137C64
	b _08137C76
	.align 2, 0
_08137C60: .4byte 0x00000199
_08137C64: .4byte 0x0826312D
_08137C68:
	cmp r0, #0xca
	beq _08137C74
_08137C6C:
	ldr r0, _08137C70
	b _08137C76
	.align 2, 0
_08137C70: .4byte 0x08262E5F
_08137C74:
	ldr r0, _08137C7C
_08137C76:
	pop {r1}
	bx r1
	.align 2, 0
_08137C7C: .4byte 0x0826314F
	thumb_func_end GetPokedexRatingText

	thumb_func_start ShowPokedexRatingMessage
ShowPokedexRatingMessage: @ 0x08137C80
	push {lr}
	ldr r0, _08137C94
	ldrh r0, [r0]
	bl GetPokedexRatingText
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_08137C94: .4byte 0x02037280
	thumb_func_end ShowPokedexRatingMessage

