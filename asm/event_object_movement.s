.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ClearEventObject
ClearEventObject: @ 0x0808CD60
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x24
	bl memset
	movs r0, #0xff
	strb r0, [r4, #8]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0x1c]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearEventObject

	thumb_func_start ClearAllEventObjects
ClearAllEventObjects: @ 0x0808CD80
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _0808CDA4
_0808CD86:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	bl ClearEventObject
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0808CD86
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808CDA4: .4byte 0x02036FF0
	thumb_func_end ClearAllEventObjects

	thumb_func_start ResetEventObjects
ResetEventObjects: @ 0x0808CDA8
	push {lr}
	bl ClearLinkPlayerEventObjects
	bl ClearAllEventObjects
	bl ClearPlayerAvatarInfo
	bl CreateReflectionEffectSprites
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ResetEventObjects

	thumb_func_start CreateReflectionEffectSprites
CreateReflectionEffectSprites: @ 0x0808CDC0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, _0808CE5C
	ldr r0, [r0, #0x54]
	mov sb, r0
	movs r1, #0
	movs r2, #0
	movs r3, #0x1f
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808CE60
	mov sl, r1
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	add r4, sl
	ldrb r1, [r4, #1]
	movs r5, #4
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	movs r1, #1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAffineAnim
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r6, #4
	orrs r0, r6
	strb r0, [r4]
	mov r0, sb
	movs r1, #0
	movs r2, #0
	movs r3, #0x1f
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	add r4, sl
	ldrb r0, [r4, #1]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r4, #1]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	adds r0, r4, #0
	movs r1, #1
	bl StartSpriteAffineAnim
	adds r4, #0x3e
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808CE5C: .4byte 0x084DDE4C
_0808CE60: .4byte 0x020205AC
	thumb_func_end CreateReflectionEffectSprites

	thumb_func_start GetFirstInactiveEventObjectId
GetFirstInactiveEventObjectId: @ 0x0808CE64
	push {lr}
	movs r1, #0
	ldr r2, _0808CE70
	ldrb r0, [r2]
	b _0808CE88
	.align 2, 0
_0808CE70: .4byte 0x02036FF0
_0808CE74:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bhi _0808CE8E
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
_0808CE88:
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0808CE74
_0808CE8E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	thumb_func_end GetFirstInactiveEventObjectId

	thumb_func_start GetEventObjectIdByLocalIdAndMap
GetEventObjectIdByLocalIdAndMap: @ 0x0808CE94
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r0, #0xfe
	bls _0808CEAC
	bl GetEventObjectIdByLocalId
	b _0808CEB0
_0808CEAC:
	bl GetEventObjectIdByLocalIdAndMapInternal
_0808CEB0:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	thumb_func_end GetEventObjectIdByLocalIdAndMap

	thumb_func_start TryGetEventObjectIdByLocalIdAndMap
TryGetEventObjectIdByLocalIdAndMap: @ 0x0808CEB8
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl GetEventObjectIdByLocalIdAndMap
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _0808CEDA
	movs r0, #0
	b _0808CEDC
_0808CEDA:
	movs r0, #1
_0808CEDC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end TryGetEventObjectIdByLocalIdAndMap

	thumb_func_start GetEventObjectIdByXY
GetEventObjectIdByXY: @ 0x0808CEE4
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r5, _0808CF24
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
_0808CEF2:
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r5
	ldrb r0, [r2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0808CF12
	movs r6, #0x10
	ldrsh r0, [r2, r6]
	cmp r0, r4
	bne _0808CF12
	movs r6, #0x12
	ldrsh r0, [r2, r6]
	cmp r0, r1
	beq _0808CF1C
_0808CF12:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0808CEF2
_0808CF1C:
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808CF24: .4byte 0x02036FF0
	thumb_func_end GetEventObjectIdByXY

	thumb_func_start GetEventObjectIdByLocalIdAndMapInternal
GetEventObjectIdByLocalIdAndMapInternal: @ 0x0808CF28
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0
	ldr r6, _0808CF60
_0808CF3A:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r6
	ldrb r0, [r3]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0808CF64
	ldrb r0, [r3, #8]
	cmp r0, r5
	bne _0808CF64
	ldrb r0, [r3, #9]
	cmp r0, r4
	bne _0808CF64
	ldrb r0, [r3, #0xa]
	cmp r0, r2
	bne _0808CF64
	adds r0, r1, #0
	b _0808CF70
	.align 2, 0
_0808CF60: .4byte 0x02036FF0
_0808CF64:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0808CF3A
	movs r0, #0x10
_0808CF70:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetEventObjectIdByLocalIdAndMapInternal

	thumb_func_start GetEventObjectIdByLocalId
GetEventObjectIdByLocalId: @ 0x0808CF78
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _0808CF9C
_0808CF82:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0808CFA0
	ldrb r0, [r1, #8]
	cmp r0, r3
	bne _0808CFA0
	adds r0, r2, #0
	b _0808CFAC
	.align 2, 0
_0808CF9C: .4byte 0x02036FF0
_0808CFA0:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0808CF82
	movs r0, #0x10
_0808CFAC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetEventObjectIdByLocalId

	thumb_func_start InitEventObjectStateFromTemplate
InitEventObjectStateFromTemplate: @ 0x0808CFB4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, sp
	bl GetAvailableEventObjectId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808CFDE
	movs r0, #0x10
	b _0808D0D2
_0808CFDE:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808D0E0
	adds r4, r0, r1
	adds r0, r4, #0
	bl ClearEventObject
	ldrh r3, [r5, #4]
	adds r3, #7
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r2, [r5, #6]
	adds r2, #7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, #1]
	strb r0, [r4, #5]
	ldrb r0, [r5, #9]
	strb r0, [r4, #6]
	ldrb r0, [r5]
	strb r0, [r4, #8]
	strb r6, [r4, #9]
	strb r7, [r4, #0xa]
	strh r3, [r4, #0xc]
	strh r2, [r4, #0xe]
	strh r3, [r4, #0x10]
	strh r2, [r4, #0x12]
	strh r3, [r4, #0x14]
	strh r2, [r4, #0x16]
	ldrb r0, [r5, #8]
	movs r7, #0xf
	adds r1, r7, #0
	ands r1, r0
	ldrb r2, [r4, #0xb]
	movs r0, #0x10
	rsbs r0, r0, #0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0xb]
	ldrb r1, [r5, #8]
	lsls r1, r1, #4
	ands r0, r7
	orrs r0, r1
	strb r0, [r4, #0xb]
	ldrb r1, [r5, #0xa]
	lsls r1, r1, #0x1c
	movs r0, #0xf
	mov sb, r0
	lsrs r1, r1, #0x1c
	ldrb r2, [r4, #0x19]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x19]
	ldrb r1, [r5, #0xa]
	lsrs r1, r1, #4
	lsls r1, r1, #4
	ands r0, r7
	orrs r0, r1
	strb r0, [r4, #0x19]
	ldrh r0, [r5, #0xc]
	strb r0, [r4, #7]
	ldrh r0, [r5, #0xe]
	strb r0, [r4, #0x1d]
	ldr r1, _0808D0E4
	ldrb r0, [r5, #9]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	ldrb r1, [r0]
	adds r0, r4, #0
	bl SetEventObjectDirection
	adds r0, r4, #0
	bl SetEventObjectDynamicGraphicsId
	ldr r1, _0808D0E8
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808D0CE
	ldrb r2, [r4, #0x19]
	adds r0, r7, #0
	ands r0, r2
	cmp r0, #0
	bne _0808D0B6
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, #1
	mov r1, sb
	ands r0, r1
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #0x19]
_0808D0B6:
	ldrb r2, [r4, #0x19]
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _0808D0CE
	lsrs r1, r2, #4
	adds r1, #1
	lsls r1, r1, #4
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x19]
_0808D0CE:
	mov r0, sp
	ldrb r0, [r0]
_0808D0D2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808D0E0: .4byte 0x02036FF0
_0808D0E4: .4byte 0x084DDA21
_0808D0E8: .4byte 0x084DD9D0
	thumb_func_end InitEventObjectStateFromTemplate

	thumb_func_start Unref_TryInitLocalEventObject
Unref_TryInitLocalEventObject: @ 0x0808D0EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r4, _0808D114
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0808D16E
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808D118
	bl GetNumBattlePyramidEventObjects
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0808D13A
	.align 2, 0
_0808D114: .4byte 0x02036FB8
_0808D118:
	bl InTrainerHill
	cmp r0, #0
	beq _0808D136
	movs r6, #2
	b _0808D13A
_0808D124:
	ldr r0, [r7]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	adds r0, r4, #0
	bl InitEventObjectStateFromTemplate
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0808D170
_0808D136:
	ldr r0, [r4, #4]
	ldrb r6, [r0]
_0808D13A:
	movs r5, #0
	cmp r5, r6
	bhs _0808D16E
	ldr r7, _0808D17C
_0808D142:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r1, [r7]
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, r8
	bne _0808D164
	ldrh r0, [r4, #0x14]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808D124
_0808D164:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r6
	blo _0808D142
_0808D16E:
	movs r0, #0x10
_0808D170:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808D17C: .4byte 0x03005AEC
	thumb_func_end Unref_TryInitLocalEventObject

	thumb_func_start GetAvailableEventObjectId
GetAvailableEventObjectId: @ 0x0808D180
	push {r4, r5, r6, r7, lr}
	mov ip, r3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r2, #0
	ldr r1, _0808D1DC
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	adds r7, r1, #0
	cmp r0, #0
	beq _0808D1D4
	adds r3, r1, #0
_0808D1A0:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r3
	ldrb r0, [r1, #8]
	cmp r0, r6
	bne _0808D1BA
	ldrb r0, [r1, #9]
	cmp r0, r5
	bne _0808D1BA
	ldrb r0, [r1, #0xa]
	cmp r0, r4
	beq _0808D1D8
_0808D1BA:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0808D1D8
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0808D1A0
_0808D1D4:
	cmp r2, #0xf
	bls _0808D1E0
_0808D1D8:
	movs r0, #1
	b _0808D214
	.align 2, 0
_0808D1DC: .4byte 0x02036FF0
_0808D1E0:
	mov r0, ip
	strb r2, [r0]
	ldr r1, _0808D21C
_0808D1E6:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0808D208
	ldrb r0, [r3, #8]
	cmp r0, r6
	bne _0808D208
	ldrb r0, [r3, #9]
	cmp r0, r5
	bne _0808D208
	ldrb r0, [r3, #0xa]
	cmp r0, r4
	beq _0808D1D8
_0808D208:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0808D1E6
	movs r0, #0
_0808D214:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808D21C: .4byte 0x02036FF0
	thumb_func_end GetAvailableEventObjectId

	thumb_func_start RemoveEventObject
RemoveEventObject: @ 0x0808D220
	push {lr}
	ldrb r2, [r0]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	bl RemoveEventObjectInternal
	pop {r0}
	bx r0
	thumb_func_end RemoveEventObject

	thumb_func_start RemoveEventObjectByLocalIdAndMap
RemoveEventObjectByLocalIdAndMap: @ 0x0808D234
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808D272
	mov r0, sp
	ldrb r0, [r0]
	bl GetEventObjectFlagIdByEventObjectId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FlagSet
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808D278
	adds r0, r0, r1
	bl RemoveEventObject
_0808D272:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808D278: .4byte 0x02036FF0
	thumb_func_end RemoveEventObjectByLocalIdAndMap

	thumb_func_start RemoveEventObjectInternal
RemoveEventObjectInternal: @ 0x0808D27C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrb r0, [r4, #5]
	bl GetEventObjectGraphicsInfo
	ldrh r2, [r0, #6]
	ldr r1, _0808D2C0
	ldr r0, [sp, #4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	ldr r2, _0808D2C4
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0xc
	adds r0, r0, r1
	mov r1, sp
	str r1, [r0]
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	bl DestroySprite
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D2C0: .4byte 0xFFFF0000
_0808D2C4: .4byte 0x020205AC
	thumb_func_end RemoveEventObjectInternal

	thumb_func_start RemoveAllEventObjectsExceptPlayer
RemoveAllEventObjectsExceptPlayer: @ 0x0808D2C8
	push {r4, lr}
	movs r4, #0
_0808D2CC:
	ldr r0, _0808D2F4
	ldrb r0, [r0, #5]
	cmp r4, r0
	beq _0808D2E2
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0808D2F8
	adds r0, r0, r1
	bl RemoveEventObject
_0808D2E2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0808D2CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D2F4: .4byte 0x02037230
_0808D2F8: .4byte 0x02036FF0
	thumb_func_end RemoveAllEventObjectsExceptPlayer

	thumb_func_start TrySetupEventObjectSprite
TrySetupEventObjectSprite: @ 0x0808D2FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r1
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	bl InitEventObjectStateFromTemplate
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x10
	bne _0808D338
	movs r0, #0x10
	b _0808D49C
_0808D338:
	mov r0, sb
	lsls r4, r0, #3
	adds r0, r4, r0
	lsls r0, r0, #2
	ldr r1, _0808D360
	adds r6, r0, r1
	ldrb r0, [r6, #5]
	bl GetEventObjectGraphicsInfo
	adds r7, r0, #0
	ldrb r0, [r7, #0xc]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1c
	cmp r5, #0
	bne _0808D364
	ldrh r0, [r7, #2]
	movs r1, #0
	bl LoadPlayerObjectReflectionPalette
	b _0808D386
	.align 2, 0
_0808D360: .4byte 0x02036FF0
_0808D364:
	cmp r5, #0xa
	bne _0808D372
	ldrh r0, [r7, #2]
	movs r1, #0xa
	bl LoadSpecialObjectReflectionPalette
	b _0808D386
_0808D372:
	cmp r5, #0xf
	bls _0808D386
	adds r0, r5, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r7, #2]
	adds r1, r5, #0
	bl sub_0808E420
_0808D386:
	ldrb r0, [r6, #6]
	cmp r0, #0x4c
	bne _0808D394
	ldrb r0, [r6, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r6, #1]
_0808D394:
	ldr r1, _0808D3CC
	adds r0, r1, #0
	mov r2, r8
	strh r0, [r2, #2]
	mov r0, r8
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x40
	bne _0808D3D4
	ldr r0, _0808D3D0
	mov r2, sb
	adds r1, r4, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	movs r0, #0x10
	b _0808D49C
	.align 2, 0
_0808D3CC: .4byte 0x0000FFFF
_0808D3D0: .4byte 0x02036FF0
_0808D3D4:
	mov r1, r8
	lsls r0, r1, #4
	add r0, r8
	lsls r0, r0, #2
	ldr r1, _0808D4AC
	adds r4, r0, r1
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r6, #0x12]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	bl sub_08092960
	ldrh r0, [r7, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r1, r4, #0
	adds r1, #0x28
	strb r0, [r1]
	ldrh r0, [r7, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r2, r4, #0
	adds r2, #0x29
	strb r0, [r2]
	ldrh r0, [r4, #0x20]
	adds r0, #8
	strh r0, [r4, #0x20]
	ldrh r1, [r4, #0x22]
	adds r1, #0x10
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	lsls r2, r5, #4
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	mov r0, sb
	strh r0, [r4, #0x2e]
	mov r1, r8
	strb r1, [r6, #4]
	ldrb r1, [r7, #0xc]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #1]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0808D486
	ldrb r0, [r6, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
_0808D486:
	ldrb r0, [r6, #0xb]
	lsrs r0, r0, #4
	adds r1, r4, #0
	movs r2, #1
	bl SetObjectSubpriorityByZCoord
	adds r0, r6, #0
	adds r1, r4, #0
	bl UpdateEventObjectVisibility
	mov r0, sb
_0808D49C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808D4AC: .4byte 0x020205AC
	thumb_func_end TrySetupEventObjectSprite

	thumb_func_start TrySpawnEventObjectTemplate
TrySpawnEventObjectTemplate: @ 0x0808D4B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	mov sb, r0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x48]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r0, #0
	str r0, [sp, #0x20]
	mov r1, sb
	ldrb r0, [r1, #1]
	bl GetEventObjectGraphicsInfo
	adds r7, r0, #0
	add r2, sp, #0x20
	mov r0, sb
	add r1, sp, #8
	bl sub_0808D6C0
	ldrh r3, [r7, #6]
	ldr r2, _0808D528
	add r1, sp, #0x24
	ldr r0, [r1, #4]
	ands r0, r2
	orrs r0, r3
	str r0, [r1, #4]
	str r1, [sp, #0x14]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [sp, #4]
	mov r0, sb
	add r1, sp, #8
	adds r2, r6, #0
	mov r3, r8
	bl TrySetupEventObjectSprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r5, r2, #0
	cmp r2, #0x10
	bne _0808D52C
	movs r0, #0x10
	b _0808D562
	.align 2, 0
_0808D528: .4byte 0xFFFF0000
_0808D52C:
	ldr r4, _0808D570
	ldr r1, _0808D574
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r1, [r3, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r1, [r7, #0x1c]
	str r1, [r0]
	ldr r2, [sp, #0x20]
	cmp r2, #0
	beq _0808D560
	ldrb r1, [r3, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r2, #0
	bl SetSubspriteTables
_0808D560:
	adds r0, r5, #0
_0808D562:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808D570: .4byte 0x020205AC
_0808D574: .4byte 0x02036FF0
	thumb_func_end TrySpawnEventObjectTemplate

	thumb_func_start SpawnSpecialEventObject
SpawnSpecialEventObject: @ 0x0808D578
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	mov r4, sp
	adds r4, #6
	add r0, sp, #4
	adds r1, r4, #0
	bl GetEventObjectMovingCameraOffset
	ldr r0, _0808D5B0
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	add r0, sp, #4
	movs r6, #0
	ldrsh r3, [r0, r6]
	movs r6, #0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, #0
	bl TrySpawnEventObjectTemplate
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808D5B0: .4byte 0x03005AEC
	thumb_func_end SpawnSpecialEventObject

	thumb_func_start SpawnSpecialEventObjectParameterized
SpawnSpecialEventObjectParameterized: @ 0x0808D5B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	mov r8, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r3, #0x10
	ldr r5, _0808D618
	adds r3, r3, r5
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	adds r4, r4, r5
	lsrs r4, r4, #0x10
	mov r5, sp
	movs r6, #0
	strb r2, [r5]
	mov r2, sp
	strb r0, [r2, #1]
	mov r0, sp
	strb r6, [r0, #2]
	movs r5, #0
	strh r3, [r0, #4]
	strh r4, [r0, #6]
	mov r2, r8
	strb r2, [r0, #8]
	strb r1, [r0, #9]
	mov r2, sp
	ldrb r1, [r2, #0xa]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0xa]
	mov r0, sp
	strb r5, [r0, #0xa]
	strh r6, [r0, #0xc]
	strh r6, [r0, #0xe]
	bl SpawnSpecialEventObject
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808D618: .4byte 0xFFF90000
	thumb_func_end SpawnSpecialEventObjectParameterized

	thumb_func_start TrySpawnEventObject
TrySpawnEventObject: @ 0x0808D61C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	adds r1, r7, #0
	adds r2, r6, #0
	bl GetEventObjectTemplateByLocalIdAndMap
	adds r5, r0, #0
	cmp r5, #0
	beq _0808D662
	mov r4, sp
	adds r4, #6
	add r0, sp, #4
	adds r1, r4, #0
	bl GetEventObjectMovingCameraOffset
	add r0, sp, #4
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r1, #0
	ldrsh r0, [r4, r1]
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl TrySpawnEventObjectTemplate
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0808D664
_0808D662:
	movs r0, #0x10
_0808D664:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end TrySpawnEventObject

	thumb_func_start MakeObjectTemplateFromEventObjectGraphicsInfo
MakeObjectTemplateFromEventObjectGraphicsInfo: @ 0x0808D66C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetEventObjectGraphicsInfo
	ldrh r1, [r0]
	strh r1, [r4]
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldr r1, [r0, #0x10]
	str r1, [r4, #4]
	ldr r1, [r0, #0x18]
	str r1, [r4, #8]
	ldr r1, [r0, #0x1c]
	str r1, [r4, #0xc]
	ldr r1, [r0, #0x20]
	str r1, [r4, #0x10]
	str r5, [r4, #0x14]
	ldr r0, [r0, #0x14]
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end MakeObjectTemplateFromEventObjectGraphicsInfo

	thumb_func_start MakeObjectTemplateFromEventObjectGraphicsInfoWithCallbackIndex
MakeObjectTemplateFromEventObjectGraphicsInfoWithCallbackIndex: @ 0x0808D6A0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r4, _0808D6BC
	lsrs r1, r1, #0xe
	adds r1, r1, r4
	ldr r1, [r1]
	bl MakeObjectTemplateFromEventObjectGraphicsInfo
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D6BC: .4byte 0x084DD88C
	thumb_func_end MakeObjectTemplateFromEventObjectGraphicsInfoWithCallbackIndex

	thumb_func_start sub_0808D6C0
sub_0808D6C0: @ 0x0808D6C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #9]
	adds r2, r5, #0
	bl MakeObjectTemplateFromEventObjectGraphicsInfoWithCallbackIndex
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0808D6C0

	thumb_func_start AddPseudoEventObject
AddPseudoEventObject: @ 0x0808D6D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r0, #0x18
	bl Alloc
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, sp
	bl MakeObjectTemplateFromEventObjectGraphicsInfo
	ldrh r1, [r6, #2]
	ldr r0, _0808D774
	cmp r1, r0
	beq _0808D71E
	adds r0, r1, #0
	bl LoadEventObjectPalette
_0808D71E:
	mov r0, r8
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	mov r3, sb
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	bl Free
	cmp r5, #0x40
	beq _0808D762
	ldr r1, [sp]
	cmp r1, #0
	beq _0808D762
	lsls r4, r5, #4
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, _0808D778
	adds r4, r4, r0
	adds r0, r4, #0
	bl SetSubspriteTables
	adds r4, #0x42
	ldrb r1, [r4]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4]
_0808D762:
	adds r0, r5, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808D774: .4byte 0x0000FFFF
_0808D778: .4byte 0x020205AC
	thumb_func_end AddPseudoEventObject

	thumb_func_start sprite_new
sprite_new: @ 0x0808D77C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [sp, #0x40]
	ldr r4, [sp, #0x44]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	add r1, sp, #0x18
	mov r8, r1
	strh r2, [r1]
	mov r6, sp
	adds r6, #0x1a
	strh r3, [r6]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	adds r0, r5, #0
	bl GetEventObjectGraphicsInfo
	adds r4, r0, #0
	ldr r1, _0808D87C
	add r3, sp, #0x1c
	adds r0, r5, #0
	mov r2, sp
	bl MakeObjectTemplateFromEventObjectGraphicsInfo
	mov r1, sp
	ldr r2, _0808D880
	adds r0, r2, #0
	strh r0, [r1, #2]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, #7
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, #7
	strh r0, [r6]
	mov r0, r8
	adds r1, r6, #0
	movs r2, #8
	movs r3, #0x10
	bl sub_08092A50
	mov r2, r8
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0
	ldrsh r2, [r6, r0]
	mov r0, sp
	movs r3, #0
	bl CreateSpriteAtEnd
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _0808D8DC
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	ldr r1, _0808D884
	adds r5, r0, r1
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r1, r5, #0
	adds r1, #0x28
	strb r0, [r1]
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r1, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r1, [r5, #0x22]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
	ldrb r0, [r4, #0xc]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x18
	ldrb r1, [r5, #5]
	movs r3, #0xf
	adds r2, r3, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, #5]
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x1c
	cmp r0, #0xf
	bls _0808D854
	subs r0, #0x10
	lsls r0, r0, #4
	ands r2, r3
	orrs r2, r0
	strb r2, [r5, #5]
_0808D854:
	adds r2, r5, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	mov r2, sb
	strh r2, [r5, #0x2e]
	strh r7, [r5, #0x30]
	ldrb r1, [r4, #0xc]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0xa
	bne _0808D888
	ldrh r0, [r4, #2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl LoadSpecialObjectReflectionPalette
	b _0808D89C
	.align 2, 0
_0808D87C: .4byte 0x08097439
_0808D880: .4byte 0x0000FFFF
_0808D884: .4byte 0x020205AC
_0808D888:
	lsls r1, r1, #0x1c
	lsrs r0, r1, #0x1c
	cmp r0, #0xf
	bls _0808D89C
	ldrh r0, [r4, #2]
	lsrs r2, r1, #0x1c
	movs r1, #0xf0
	orrs r1, r2
	bl sub_0808E420
_0808D89C:
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	beq _0808D8B8
	adds r0, r5, #0
	bl SetSubspriteTables
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r0, [r2]
	movs r1, #0x3f
	ands r1, r0
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r2]
_0808D8B8:
	adds r0, r5, #0
	adds r1, r7, #0
	bl InitObjectPriorityByZCoord
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #1
	bl SetObjectSubpriorityByZCoord
	mov r0, sl
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
_0808D8DC:
	adds r0, r6, #0
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sprite_new

	thumb_func_start TrySpawnEventObjects
TrySpawnEventObjects: @ 0x0808D8F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	ldr r5, _0808D948
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0808D9E8
	ldr r0, _0808D94C
	ldr r2, [r0]
	ldrh r1, [r2]
	subs r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r1, #0x11
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	ldrh r4, [r2, #2]
	adds r0, r4, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	bl InBattlePyramid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808D950
	bl GetNumBattlePyramidEventObjects
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0808D960
	.align 2, 0
_0808D948: .4byte 0x02036FB8
_0808D94C: .4byte 0x03005AEC
_0808D950:
	bl InTrainerHill
	cmp r0, #0
	beq _0808D95C
	movs r6, #2
	b _0808D960
_0808D95C:
	ldr r0, [r5, #4]
	ldrb r6, [r0]
_0808D960:
	movs r5, #0
	cmp r5, r6
	bhs _0808D9E8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_0808D974:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	movs r2, #0xc7
	lsls r2, r2, #4
	adds r0, r0, r2
	ldr r3, _0808D9F8
	ldr r1, [r3]
	adds r4, r1, r0
	ldrh r0, [r4, #4]
	adds r0, #7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r4, #6]
	adds r0, #7
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp sb, r1
	bgt _0808D9DE
	mov r7, sl
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	blt _0808D9DE
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	cmp r8, r1
	bgt _0808D9DE
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	blt _0808D9DE
	ldrh r0, [r4, #0x14]
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808D9DE
	ldr r3, _0808D9F8
	ldr r0, [r3]
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	ldr r7, [sp, #4]
	lsls r3, r7, #0x10
	ldr r7, [sp, #8]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	asrs r3, r3, #0x10
	bl TrySpawnEventObjectTemplate
_0808D9DE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r6
	blo _0808D974
_0808D9E8:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D9F8: .4byte 0x03005AEC
	thumb_func_end TrySpawnEventObjects

	thumb_func_start RemoveEventObjectsOutsideView
RemoveEventObjectsOutsideView: @ 0x0808D9FC
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r6, _0808DA50
_0808DA02:
	movs r2, #0
	movs r4, #0
	adds r5, r3, #1
_0808DA08:
	lsls r0, r2, #2
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808DA1A
	ldrb r1, [r1, #2]
	cmp r3, r1
	bne _0808DA1A
	movs r4, #1
_0808DA1A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0808DA08
	cmp r4, #0
	bne _0808DA42
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, _0808DA54
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0808DA58
	ands r0, r1
	cmp r0, #1
	bne _0808DA42
	adds r0, r2, #0
	bl RemoveEventObjectIfOutsideView
_0808DA42:
	lsls r0, r5, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0808DA02
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DA50: .4byte 0x02031FA8
_0808DA54: .4byte 0x02036FF0
_0808DA58: .4byte 0x00010001
	thumb_func_end RemoveEventObjectsOutsideView

	thumb_func_start RemoveEventObjectIfOutsideView
RemoveEventObjectIfOutsideView: @ 0x0808DA5C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _0808DAD8
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r1, r0, #2
	lsls r1, r1, #0x10
	adds r0, #0x11
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r4, [r2, #2]
	adds r0, r4, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x10
	ldrsh r2, [r3, r0]
	lsrs r7, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	blt _0808DAA2
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bgt _0808DAA2
	movs r0, #0x12
	ldrsh r1, [r3, r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	blt _0808DAA2
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _0808DAD0
_0808DAA2:
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	blt _0808DACA
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _0808DACA
	movs r0, #0xe
	ldrsh r1, [r3, r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	blt _0808DACA
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _0808DAD0
_0808DACA:
	adds r0, r3, #0
	bl RemoveEventObject
_0808DAD0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DAD8: .4byte 0x03005AEC
	thumb_func_end RemoveEventObjectIfOutsideView

	thumb_func_start sub_0808DADC
sub_0808DADC: @ 0x0808DADC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl ClearPlayerAvatarInfo
	movs r6, #0
	ldr r7, _0808DB24
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
_0808DAF6:
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0808DB10
	adds r0, r6, #0
	asrs r1, r4, #0x10
	asrs r2, r5, #0x10
	bl sub_0808DB28
_0808DB10:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0808DAF6
	bl CreateReflectionEffectSprites
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB24: .4byte 0x02036FF0
	thumb_func_end sub_0808DADC

	thumb_func_start sub_0808DB28
sub_0808DB28: @ 0x0808DB28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x24]
	movs r7, #0
	ldr r2, _0808DBB8
_0808DB4A:
	lsls r0, r7, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808DB5C
	ldrb r1, [r1, #2]
	cmp sb, r1
	bne _0808DB5C
	b _0808DCE4
_0808DB5C:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bls _0808DB4A
	mov r1, sb
	lsls r0, r1, #3
	add r0, sb
	lsls r0, r0, #2
	ldr r1, _0808DBBC
	adds r6, r0, r1
	movs r0, #0
	str r0, [sp, #0x20]
	ldrb r0, [r6, #5]
	bl GetEventObjectGraphicsInfo
	adds r5, r0, #0
	ldrh r2, [r5, #6]
	ldr r1, _0808DBC0
	add r4, sp, #0x18
	ldr r0, [r4, #4]
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #4]
	ldrb r0, [r6, #5]
	ldrb r1, [r6, #6]
	add r3, sp, #0x20
	mov r2, sp
	bl MakeObjectTemplateFromEventObjectGraphicsInfoWithCallbackIndex
	str r4, [sp, #0xc]
	mov r1, sp
	ldr r2, _0808DBC4
	adds r0, r2, #0
	strh r0, [r1, #2]
	ldrb r0, [r5, #0xc]
	lsls r1, r0, #0x1c
	lsrs r0, r1, #0x1c
	mov r8, r0
	cmp r0, #0
	bne _0808DBC8
	ldrh r0, [r5, #2]
	lsrs r1, r1, #0x1c
	bl LoadPlayerObjectReflectionPalette
	b _0808DBEE
	.align 2, 0
_0808DBB8: .4byte 0x02031FA8
_0808DBBC: .4byte 0x02036FF0
_0808DBC0: .4byte 0xFFFF0000
_0808DBC4: .4byte 0x0000FFFF
_0808DBC8:
	mov r2, r8
	cmp r2, #0xa
	bne _0808DBD8
	ldrh r0, [r5, #2]
	lsrs r1, r1, #0x1c
	bl LoadSpecialObjectReflectionPalette
	b _0808DBEE
_0808DBD8:
	mov r0, r8
	cmp r0, #0xf
	bls _0808DBEE
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrh r0, [r5, #2]
	mov r1, r8
	bl sub_0808E420
_0808DBEE:
	mov r1, sp
	ldr r2, _0808DCF4
	adds r0, r2, #0
	strh r0, [r1, #2]
	mov r0, sp
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0x40
	beq _0808DCE4
	lsls r0, r7, #4
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r1, _0808DCF8
	adds r4, r0, r1
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6, #0x10]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x24]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r6, #0x12]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	bl sub_08092960
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r1, r4, #0
	adds r1, #0x28
	strb r0, [r1]
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r2, r4, #0
	adds r2, #0x29
	strb r0, [r2]
	ldrh r0, [r4, #0x20]
	adds r0, #8
	strh r0, [r4, #0x20]
	ldrh r1, [r4, #0x22]
	adds r1, #0x10
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0xc]
	ldrb r0, [r6, #6]
	cmp r0, #0xb
	bne _0808DC82
	mov r0, sb
	adds r1, r7, #0
	bl SetPlayerAvatarEventObjectIdAndObjectId
	bl CreateWarpArrowSprite
	strb r0, [r6, #0x1b]
_0808DC82:
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq _0808DC8E
	adds r0, r4, #0
	bl SetSubspriteTables
_0808DC8E:
	mov r0, r8
	lsls r2, r0, #4
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	mov r1, sb
	strh r1, [r4, #0x2e]
	strb r7, [r6, #4]
	ldrb r0, [r6, #1]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0808DCD2
	ldrb r0, [r6, #6]
	cmp r0, #0xb
	beq _0808DCD2
	ldrb r0, [r6, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
_0808DCD2:
	adds r0, r6, #0
	bl sub_0808DCFC
	ldrb r0, [r6, #0xb]
	lsrs r0, r0, #4
	adds r1, r4, #0
	movs r2, #1
	bl SetObjectSubpriorityByZCoord
_0808DCE4:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DCF4: .4byte 0x0000FFFF
_0808DCF8: .4byte 0x020205AC
	thumb_func_end sub_0808DB28

	thumb_func_start sub_0808DCFC
sub_0808DCFC: @ 0x0808DCFC
	push {lr}
	ldrb r2, [r0]
	movs r3, #3
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r2, [r0, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	ands r1, r3
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	subs r2, #0x10
	ands r1, r2
	strb r1, [r0, #2]
	bl EventObjectClearHeldMovement
	pop {r0}
	bx r0
	thumb_func_end sub_0808DCFC

	thumb_func_start SetPlayerAvatarEventObjectIdAndObjectId
SetPlayerAvatarEventObjectIdAndObjectId: @ 0x0808DD34
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0808DD60
	strb r0, [r5, #5]
	strb r1, [r5, #4]
	ldr r1, _0808DD64
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, r4, r1
	ldrb r0, [r4, #5]
	bl GetPlayerAvatarGenderByGraphicsId
	strb r0, [r5, #7]
	ldrb r0, [r4, #5]
	movs r1, #0x20
	bl SetPlayerAvatarExtraStateTransition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808DD60: .4byte 0x02037230
_0808DD64: .4byte 0x02036FF0
	thumb_func_end SetPlayerAvatarEventObjectIdAndObjectId

	thumb_func_start EventObjectSetGraphicsId
EventObjectSetGraphicsId: @ 0x0808DD68
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov r0, r8
	bl GetEventObjectGraphicsInfo
	adds r6, r0, #0
	ldrb r1, [r7, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808DDA0
	adds r4, r0, r1
	ldrb r0, [r6, #0xc]
	lsls r1, r0, #0x1c
	lsrs r5, r1, #0x1c
	cmp r5, #0
	bne _0808DDA4
	ldrh r0, [r6, #2]
	adds r1, r5, #0
	bl PatchObjectPalette
	b _0808DDC6
	.align 2, 0
_0808DDA0: .4byte 0x020205AC
_0808DDA4:
	cmp r5, #0xa
	bne _0808DDB2
	ldrh r0, [r6, #2]
	lsrs r1, r1, #0x1c
	bl LoadSpecialObjectReflectionPalette
	b _0808DDC6
_0808DDB2:
	cmp r5, #0xf
	bls _0808DDC6
	adds r0, r5, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r6, #2]
	adds r1, r5, #0
	bl sub_0808E420
_0808DDC6:
	ldr r0, [r6, #0x10]
	ldrb r2, [r0, #1]
	lsrs r2, r2, #6
	lsls r2, r2, #6
	ldrb r3, [r4, #1]
	movs r1, #0x3f
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #1]
	ldr r0, [r6, #0x10]
	ldrb r0, [r0, #3]
	lsrs r0, r0, #6
	lsls r0, r0, #6
	ldrb r2, [r4, #3]
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #3]
	ldr r0, [r6, #0x1c]
	str r0, [r4, #0xc]
	ldr r0, [r6, #0x18]
	str r0, [r4, #8]
	ldr r0, [r6, #0x14]
	str r0, [r4, #0x18]
	lsls r2, r5, #4
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
	ldrb r1, [r6, #0xc]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	lsls r1, r1, #4
	ldrb r2, [r7, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #1]
	mov r0, r8
	strb r0, [r7, #5]
	movs r1, #0x10
	ldrsh r0, [r7, r1]
	movs r2, #0x12
	ldrsh r1, [r7, r2]
	adds r2, r4, #0
	adds r2, #0x20
	adds r3, r4, #0
	adds r3, #0x22
	bl SetSpritePosToMapCoords
	ldrh r0, [r6, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r1, r4, #0
	adds r1, #0x28
	strb r0, [r1]
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r2, r4, #0
	adds r2, #0x29
	strb r0, [r2]
	ldrh r0, [r4, #0x20]
	adds r0, #8
	strh r0, [r4, #0x20]
	ldrh r1, [r4, #0x22]
	adds r1, #0x10
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	strh r0, [r4, #0x22]
	ldrb r0, [r7, #1]
	lsrs r0, r0, #7
	cmp r0, #0
	beq _0808DE68
	bl CameraObjectReset1
_0808DE68:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EventObjectSetGraphicsId

	thumb_func_start EventObjectSetGraphicsIdByLocalIdAndMap
EventObjectSetGraphicsIdByLocalIdAndMap: @ 0x0808DE74
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808DEA8
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808DEB0
	adds r0, r0, r1
	adds r1, r4, #0
	bl EventObjectSetGraphicsId
_0808DEA8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DEB0: .4byte 0x02036FF0
	thumb_func_end EventObjectSetGraphicsIdByLocalIdAndMap

	thumb_func_start EventObjectTurn
EventObjectTurn: @ 0x0808DEB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl SetEventObjectDirection
	ldrb r0, [r6, #1]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0808DEFA
	ldrb r0, [r6, #4]
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r5, _0808DF00
	adds r4, r4, r5
	ldrb r0, [r6, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	ldrb r1, [r6, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	bl SeekSpriteAnim
_0808DEFA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DF00: .4byte 0x020205AC
	thumb_func_end EventObjectTurn

	thumb_func_start EventObjectTurnByLocalIdAndMap
EventObjectTurnByLocalIdAndMap: @ 0x0808DF04
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808DF38
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808DF40
	adds r0, r0, r1
	adds r1, r4, #0
	bl EventObjectTurn
_0808DF38:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DF40: .4byte 0x02036FF0
	thumb_func_end EventObjectTurnByLocalIdAndMap

	thumb_func_start PlayerObjectTurn
PlayerObjectTurn: @ 0x0808DF44
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r0, #5]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808DF60
	adds r0, r0, r2
	bl EventObjectTurn
	pop {r0}
	bx r0
	.align 2, 0
_0808DF60: .4byte 0x02036FF0
	thumb_func_end PlayerObjectTurn

	thumb_func_start get_berry_tree_graphics
get_berry_tree_graphics: @ 0x0808DF64
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r0, [r5, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r5, #1]
	adds r4, r7, #0
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, #0x1d]
	bl GetStageByBerryTreeId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _0808DFF0
	ldrb r1, [r5, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldrb r1, [r4]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r5, #0x1d]
	bl GetBerryTypeByBerryTreeId
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r4, #0x2b
	bls _0808DFB8
	movs r4, #0
_0808DFB8:
	ldr r0, _0808DFF8
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	adds r0, r5, #0
	bl EventObjectSetGraphicsId
	ldr r0, _0808DFFC
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r7, #0xc]
	ldr r0, _0808E000
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r6
	ldrb r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r7, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #5]
	adds r0, r7, #0
	adds r1, r6, #0
	bl StartSpriteAnim
_0808DFF0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DFF8: .4byte 0x084E4D5C
_0808DFFC: .4byte 0x084E4C04
_0808E000: .4byte 0x084E4CB0
	thumb_func_end get_berry_tree_graphics

	thumb_func_start GetEventObjectGraphicsInfo
GetEventObjectGraphicsInfo: @ 0x0808E004
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xef
	bls _0808E01C
	adds r0, r1, #0
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl VarGetEventObjectGraphicsId
	adds r1, r0, #0
_0808E01C:
	cmp r1, #0x45
	bne _0808E034
	bl GetCurrentMauvilleOldMan
	lsls r0, r0, #0x18
	ldr r1, _0808E030
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	b _0808E042
	.align 2, 0
_0808E030: .4byte 0x084DDE30
_0808E034:
	cmp r1, #0xee
	bls _0808E03A
	movs r1, #5
_0808E03A:
	ldr r0, _0808E048
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
_0808E042:
	pop {r1}
	bx r1
	.align 2, 0
_0808E048: .4byte 0x084DDA74
	thumb_func_end GetEventObjectGraphicsInfo

	thumb_func_start SetEventObjectDynamicGraphicsId
SetEventObjectDynamicGraphicsId: @ 0x0808E04C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #5]
	cmp r0, #0xef
	bls _0808E062
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl VarGetEventObjectGraphicsId
	strb r0, [r4, #5]
_0808E062:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SetEventObjectDynamicGraphicsId

	thumb_func_start npc_by_local_id_and_map_set_field_1_bit_x20
npc_by_local_id_and_map_set_field_1_bit_x20: @ 0x0808E068
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E0AA
	ldr r2, _0808E0B4
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #1
	adds r2, r4, #0
	ands r2, r0
	lsls r2, r2, #5
	ldrb r3, [r1, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #1]
_0808E0AA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E0B4: .4byte 0x02036FF0
	thumb_func_end npc_by_local_id_and_map_set_field_1_bit_x20

	thumb_func_start EventObjectGetLocalIdAndMap
EventObjectGetLocalIdAndMap: @ 0x0808E0B8
	push {r4, lr}
	ldrb r4, [r0, #8]
	strb r4, [r1]
	ldrb r1, [r0, #9]
	strb r1, [r2]
	ldrb r0, [r0, #0xa]
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end EventObjectGetLocalIdAndMap

	thumb_func_start sub_0808E0CC
sub_0808E0CC: @ 0x0808E0CC
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl GetEventObjectIdByXY
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x10
	beq _0808E0F4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808E0F8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_0808E0F4:
	pop {r0}
	bx r0
	.align 2, 0
_0808E0F8: .4byte 0x02036FF0
	thumb_func_end sub_0808E0CC

	thumb_func_start sub_0808E0FC
sub_0808E0FC: @ 0x0808E0FC
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E142
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _0808E14C
	adds r2, r2, r0
	ldrb r1, [r2, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808E150
	adds r0, r0, r1
	ldrb r1, [r2, #3]
	movs r3, #4
	orrs r1, r3
	strb r1, [r2, #3]
	adds r0, #0x43
	strb r4, [r0]
_0808E142:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E14C: .4byte 0x02036FF0
_0808E150: .4byte 0x020205AC
	thumb_func_end sub_0808E0FC

	thumb_func_start sub_0808E154
sub_0808E154: @ 0x0808E154
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E190
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0808E198
	adds r1, r1, r0
	ldrb r2, [r1, #3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1, #3]
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
_0808E190:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808E198: .4byte 0x02036FF0
	thumb_func_end sub_0808E154

	thumb_func_start sub_0808E19C
sub_0808E19C: @ 0x0808E19C
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E1E0
	ldr r2, _0808E1E8
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808E1EC
	adds r0, r0, r1
	strh r5, [r0, #0x24]
	strh r4, [r0, #0x26]
_0808E1E0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E1E8: .4byte 0x02036FF0
_0808E1EC: .4byte 0x020205AC
	thumb_func_end sub_0808E19C

	thumb_func_start FreeAndReserveObjectSpritePalettes
FreeAndReserveObjectSpritePalettes: @ 0x0808E1F0
	push {lr}
	bl FreeAllSpritePalettes
	ldr r1, _0808E200
	movs r0, #0xc
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808E200: .4byte 0x030030BC
	thumb_func_end FreeAndReserveObjectSpritePalettes

	thumb_func_start LoadEventObjectPalette
LoadEventObjectPalette: @ 0x0808E204
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FindEventObjectPaletteIndexByTag
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0808E228
	cmp r1, r0
	beq _0808E222
	lsls r0, r1, #3
	ldr r1, _0808E22C
	adds r0, r0, r1
	bl sub_0808E264
_0808E222:
	pop {r0}
	bx r0
	.align 2, 0
_0808E228: .4byte 0x000011FF
_0808E22C: .4byte 0x084E401C
	thumb_func_end LoadEventObjectPalette

	thumb_func_start Unused_LoadEventObjectPaletteSet
Unused_LoadEventObjectPaletteSet: @ 0x0808E230
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldrh r0, [r5]
	ldr r1, _0808E260
	cmp r0, r1
	beq _0808E25A
	adds r6, r1, #0
_0808E240:
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	bl LoadEventObjectPalette
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, r6
	bne _0808E240
_0808E25A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E260: .4byte 0x000011FF
	thumb_func_end Unused_LoadEventObjectPaletteSet

	thumb_func_start sub_0808E264
sub_0808E264: @ 0x0808E264
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #4]
	bl IndexOfSpritePaletteTag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0808E282
	adds r0, r4, #0
	bl LoadSpritePalette
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0808E284
_0808E282:
	movs r0, #0xff
_0808E284:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0808E264

	thumb_func_start PatchObjectPalette
PatchObjectPalette: @ 0x0808E28C
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl FindEventObjectPaletteIndexByTag
	lsls r0, r0, #0x18
	ldr r1, _0808E2C0
	lsrs r0, r0, #0x15
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #0x14
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r4, r4, r1
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	movs r2, #0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E2C0: .4byte 0x084E401C
	thumb_func_end PatchObjectPalette

	thumb_func_start PatchObjectPaletteRange
PatchObjectPaletteRange: @ 0x0808E2C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	cmp r4, r6
	bhs _0808E2E8
_0808E2D4:
	ldrh r0, [r5]
	adds r1, r4, #0
	bl PatchObjectPalette
	adds r5, #2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0808E2D4
_0808E2E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end PatchObjectPaletteRange

	thumb_func_start FindEventObjectPaletteIndexByTag
FindEventObjectPaletteIndexByTag: @ 0x0808E2F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r2, #0
	ldr r0, _0808E318
	ldrh r1, [r0, #4]
	ldr r3, _0808E31C
	adds r4, r0, #0
	cmp r1, r3
	beq _0808E330
	adds r6, r4, #0
	adds r1, r3, #0
_0808E308:
	lsls r0, r2, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	cmp r0, r5
	bne _0808E320
	adds r0, r2, #0
	b _0808E332
	.align 2, 0
_0808E318: .4byte 0x084E401C
_0808E31C: .4byte 0x000011FF
_0808E320:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	cmp r0, r1
	bne _0808E308
_0808E330:
	movs r0, #0xff
_0808E332:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end FindEventObjectPaletteIndexByTag

	thumb_func_start LoadPlayerObjectReflectionPalette
LoadPlayerObjectReflectionPalette: @ 0x0808E338
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl PatchObjectPalette
	movs r3, #0
	ldr r1, _0808E380
	ldrh r0, [r1]
	ldr r2, _0808E384
	cmp r0, r2
	beq _0808E3A0
	ldr r0, _0808E388
	adds r5, r5, r0
	adds r6, r2, #0
_0808E35C:
	lsls r2, r3, #3
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0808E390
	adds r1, #4
	adds r1, r2, r1
	ldr r0, _0808E38C
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl PatchObjectPalette
	b _0808E3A0
	.align 2, 0
_0808E380: .4byte 0x084E4154
_0808E384: .4byte 0x000011FF
_0808E388: .4byte 0x0846FA18
_0808E38C: .4byte 0x02037254
_0808E390:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0808E35C
_0808E3A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadPlayerObjectReflectionPalette

	thumb_func_start LoadSpecialObjectReflectionPalette
LoadSpecialObjectReflectionPalette: @ 0x0808E3A8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _0808E3F4
	strh r4, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl PatchObjectPalette
	movs r3, #0
	ldr r1, _0808E3F8
	ldrh r0, [r1]
	ldr r2, _0808E3FC
	cmp r0, r2
	beq _0808E418
	ldr r0, _0808E400
	adds r5, r5, r0
	adds r6, r2, #0
_0808E3D0:
	lsls r2, r3, #3
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0808E408
	adds r1, #4
	adds r1, r2, r1
	ldr r0, _0808E404
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl PatchObjectPalette
	b _0808E418
	.align 2, 0
_0808E3F4: .4byte 0x02037256
_0808E3F8: .4byte 0x084E41CC
_0808E3FC: .4byte 0x000011FF
_0808E400: .4byte 0x0846FA18
_0808E404: .4byte 0x02037254
_0808E408:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0808E3D0
_0808E418:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end LoadSpecialObjectReflectionPalette

	thumb_func_start sub_0808E420
sub_0808E420: @ 0x0808E420
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl PatchObjectPalette
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0808E420

	thumb_func_start unref_sub_808EAC4
unref_sub_808EAC4: @ 0x0808E434
	push {r4, lr}
	ldrh r3, [r0, #0x10]
	strh r3, [r0, #0x14]
	ldrh r4, [r0, #0x12]
	strh r4, [r0, #0x16]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r3
	strh r1, [r0, #0x10]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r2, r2, r4
	strh r2, [r0, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_808EAC4

	thumb_func_start ShiftEventObjectCoords
ShiftEventObjectCoords: @ 0x0808E454
	ldrh r3, [r0, #0x10]
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x12]
	strh r3, [r0, #0x16]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	bx lr
	.align 2, 0
	thumb_func_end ShiftEventObjectCoords

	thumb_func_start SetEventObjectCoords
SetEventObjectCoords: @ 0x0808E464
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	bx lr
	.align 2, 0
	thumb_func_end SetEventObjectCoords

	thumb_func_start MoveEventObjectToMapCoords
MoveEventObjectToMapCoords: @ 0x0808E478
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrb r1, [r6, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808E514
	adds r7, r0, r1
	ldrb r0, [r6, #5]
	bl GetEventObjectGraphicsInfo
	mov r8, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEventObjectCoords
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	movs r2, #0x12
	ldrsh r1, [r6, r2]
	adds r2, r7, #0
	adds r2, #0x20
	adds r3, r7, #0
	adds r3, #0x22
	bl SetSpritePosToMapCoords
	mov r1, r8
	ldrh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r1, r7, #0
	adds r1, #0x28
	strb r0, [r1]
	mov r2, r8
	ldrh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	rsbs r0, r0, #0
	adds r2, r7, #0
	adds r2, #0x29
	strb r0, [r2]
	ldrh r0, [r7, #0x20]
	adds r0, #8
	strh r0, [r7, #0x20]
	ldrh r1, [r7, #0x22]
	adds r1, #0x10
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	strh r0, [r7, #0x22]
	adds r0, r6, #0
	bl sub_0808DCFC
	ldrb r0, [r6, #1]
	lsrs r0, r0, #7
	cmp r0, #0
	beq _0808E50A
	bl CameraObjectReset1
_0808E50A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E514: .4byte 0x020205AC
	thumb_func_end MoveEventObjectToMapCoords

	thumb_func_start TryMoveEventObjectToMapCoords
TryMoveEventObjectToMapCoords: @ 0x0808E518
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E560
	lsls r1, r5, #0x10
	lsls r2, r4, #0x10
	mov r0, sp
	ldrb r3, [r0]
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r3, _0808E568
	adds r0, r0, r3
	movs r3, #0xe0
	lsls r3, r3, #0xb
	adds r1, r1, r3
	asrs r1, r1, #0x10
	adds r2, r2, r3
	asrs r2, r2, #0x10
	bl MoveEventObjectToMapCoords
_0808E560:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E568: .4byte 0x02036FF0
	thumb_func_end TryMoveEventObjectToMapCoords

	thumb_func_start ShiftStillEventObjectCoords
ShiftStillEventObjectCoords: @ 0x0808E56C
	push {lr}
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	movs r3, #0x12
	ldrsh r2, [r0, r3]
	bl ShiftEventObjectCoords
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end ShiftStillEventObjectCoords

	thumb_func_start UpdateEventObjectCoordsForCameraUpdate
UpdateEventObjectCoordsForCameraUpdate: @ 0x0808E580
	push {r4, r5, lr}
	ldr r2, _0808E5E0
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808E5D8
	movs r3, #0
	ldr r5, _0808E5E4
	movs r0, #4
	ldrsh r4, [r2, r0]
	movs r0, #8
	ldrsh r1, [r2, r0]
_0808E59A:
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r5
	ldrb r0, [r2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0808E5CE
	ldrh r0, [r2, #0xc]
	subs r0, r0, r4
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #0xe]
	subs r0, r0, r1
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #0x10]
	subs r0, r0, r4
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0x12]
	subs r0, r0, r1
	strh r0, [r2, #0x12]
	ldrh r0, [r2, #0x14]
	subs r0, r0, r4
	strh r0, [r2, #0x14]
	ldrh r0, [r2, #0x16]
	subs r0, r0, r1
	strh r0, [r2, #0x16]
_0808E5CE:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0808E59A
_0808E5D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E5E0: .4byte 0x02036FD4
_0808E5E4: .4byte 0x02036FF0
	thumb_func_end UpdateEventObjectCoordsForCameraUpdate

	thumb_func_start GetEventObjectIdByXYZ
GetEventObjectIdByXYZ: @ 0x0808E5E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r4, #0
	ldr r0, _0808E634
	mov r8, r0
_0808E600:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0808E638
	movs r2, #0x10
	ldrsh r0, [r1, r2]
	cmp r0, r7
	bne _0808E638
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	cmp r0, r6
	bne _0808E638
	adds r0, r1, #0
	adds r1, r5, #0
	bl EventObjectDoesZCoordMatch
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E638
	adds r0, r4, #0
	b _0808E644
	.align 2, 0
_0808E634: .4byte 0x02036FF0
_0808E638:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0808E600
	movs r0, #0x10
_0808E644:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetEventObjectIdByXYZ

	thumb_func_start EventObjectDoesZCoordMatch
EventObjectDoesZCoordMatch: @ 0x0808E650
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r0, #0xb]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _0808E670
	cmp r1, #0
	beq _0808E670
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, r1
	beq _0808E670
	movs r0, #0
	b _0808E672
_0808E670:
	movs r0, #1
_0808E672:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end EventObjectDoesZCoordMatch

	thumb_func_start UpdateEventObjectsForCameraUpdate
UpdateEventObjectsForCameraUpdate: @ 0x0808E678
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl UpdateEventObjectCoordsForCameraUpdate
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl TrySpawnEventObjects
	bl RemoveEventObjectsOutsideView
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end UpdateEventObjectsForCameraUpdate

	thumb_func_start AddCameraObject
AddCameraObject: @ 0x0808E6A4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0808E6E0
	movs r1, #0
	movs r2, #0
	movs r3, #4
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808E6E4
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x3e
	adds r2, r2, r1
	mov ip, r2
	ldrb r2, [r2]
	movs r3, #4
	orrs r2, r3
	mov r3, ip
	strb r2, [r3]
	strh r4, [r1, #0x2e]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808E6E0: .4byte 0x0846FA28
_0808E6E4: .4byte 0x020205AC
	thumb_func_end AddCameraObject

	thumb_func_start ObjectCB_CameraObject
ObjectCB_CameraObject: @ 0x0808E6E8
	push {r4, r5, lr}
	sub sp, #0xc
	mov r2, sp
	ldr r1, _0808E70C
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	movs r2, #0x30
	ldrsh r1, [r0, r2]
	lsls r1, r1, #2
	add r1, sp
	ldr r1, [r1]
	bl _call_via_r1
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E70C: .4byte 0x0846FA40
	thumb_func_end ObjectCB_CameraObject

	thumb_func_start CameraObject_0
CameraObject_0: @ 0x0808E710
	push {lr}
	ldr r3, _0808E748
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x20]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r1, [r1, #0x22]
	strh r1, [r0, #0x22]
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r1, [r3]
	movs r2, #4
	orrs r1, r2
	strb r1, [r3]
	movs r1, #1
	strh r1, [r0, #0x30]
	bl CameraObject_1
	pop {r0}
	bx r0
	.align 2, 0
_0808E748: .4byte 0x020205AC
	thumb_func_end CameraObject_0

	thumb_func_start CameraObject_1
CameraObject_1: @ 0x0808E74C
	push {r4, r5, lr}
	ldr r3, _0808E780
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r3, [r1, #0x22]
	ldrh r2, [r0, #0x20]
	ldrh r4, [r1, #0x20]
	movs r5, #0x20
	ldrsh r1, [r1, r5]
	subs r1, r1, r2
	strh r1, [r0, #0x32]
	ldrh r2, [r0, #0x22]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	strh r1, [r0, #0x34]
	strh r4, [r0, #0x20]
	strh r3, [r0, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E780: .4byte 0x020205AC
	thumb_func_end CameraObject_1

	thumb_func_start CameraObject_2
CameraObject_2: @ 0x0808E784
	push {r4, lr}
	ldr r4, _0808E7B0
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x20]
	movs r3, #0
	strh r1, [r0, #0x20]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrh r1, [r1, #0x22]
	strh r1, [r0, #0x22]
	strh r3, [r0, #0x32]
	strh r3, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E7B0: .4byte 0x020205AC
	thumb_func_end CameraObject_2

	thumb_func_start FindCameraObject
FindCameraObject: @ 0x0808E7B4
	push {r4, r5, lr}
	movs r3, #0
	ldr r4, _0808E7E0
	adds r5, r4, #0
	adds r5, #0x1c
_0808E7BE:
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r1, r0, #2
	adds r2, r1, r4
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0808E7E8
	adds r0, r1, r5
	ldr r1, [r0]
	ldr r0, _0808E7E4
	cmp r1, r0
	bne _0808E7E8
	adds r0, r2, #0
	b _0808E7F4
	.align 2, 0
_0808E7E0: .4byte 0x020205AC
_0808E7E4: .4byte 0x0808E6E9
_0808E7E8:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x3f
	bls _0808E7BE
	movs r0, #0
_0808E7F4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FindCameraObject

	thumb_func_start CameraObjectReset1
CameraObjectReset1: @ 0x0808E7FC
	push {lr}
	bl FindCameraObject
	adds r2, r0, #0
	cmp r2, #0
	beq _0808E814
	movs r0, #0
	strh r0, [r2, #0x30]
	ldr r1, [r2, #0x1c]
	adds r0, r2, #0
	bl _call_via_r1
_0808E814:
	pop {r0}
	bx r0
	thumb_func_end CameraObjectReset1

	thumb_func_start CameraObjectSetFollowedObjectId
CameraObjectSetFollowedObjectId: @ 0x0808E818
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl FindCameraObject
	cmp r0, #0
	beq _0808E82C
	strh r4, [r0, #0x2e]
	bl CameraObjectReset1
_0808E82C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CameraObjectSetFollowedObjectId

	thumb_func_start CameraObjectGetFollowedObjectId
CameraObjectGetFollowedObjectId: @ 0x0808E834
	push {lr}
	bl FindCameraObject
	cmp r0, #0
	beq _0808E846
	ldrh r0, [r0, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0808E848
_0808E846:
	movs r0, #0x40
_0808E848:
	pop {r1}
	bx r1
	thumb_func_end CameraObjectGetFollowedObjectId

	thumb_func_start CameraObjectReset2
CameraObjectReset2: @ 0x0808E84C
	push {lr}
	bl FindCameraObject
	movs r1, #2
	strh r1, [r0, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CameraObjectReset2

	thumb_func_start CopySprite
CopySprite: @ 0x0808E85C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r5, #0
	ldr r1, _0808E8A4
_0808E876:
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0808E8A8
	adds r0, r4, #0
	mov r1, ip
	movs r2, #0x44
	bl memcpy
	mov r0, r8
	strh r0, [r4, #0x20]
	strh r6, [r4, #0x22]
	adds r0, r4, #0
	adds r0, #0x43
	strb r7, [r0]
	b _0808E8B2
	.align 2, 0
_0808E8A4: .4byte 0x020205AC
_0808E8A8:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3f
	bls _0808E876
_0808E8B2:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end CopySprite

	thumb_func_start CreateCopySpriteAt
CreateCopySpriteAt: @ 0x0808E8C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r5, #0x3f
	ldr r3, _0808E914
	movs r2, #1
	rsbs r2, r2, #0
_0808E8DE:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r3
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0808E918
	adds r0, r4, #0
	mov r1, ip
	movs r2, #0x44
	bl memcpy
	mov r0, r8
	strh r0, [r4, #0x20]
	strh r6, [r4, #0x22]
	adds r0, r4, #0
	adds r0, #0x43
	strb r7, [r0]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	b _0808E926
	.align 2, 0
_0808E914: .4byte 0x020205AC
_0808E918:
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bgt _0808E8DE
	movs r0, #0x40
_0808E926:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end CreateCopySpriteAt

	thumb_func_start SetEventObjectDirection
SetEventObjectDirection: @ 0x0808E930
	push {r4, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	adds r4, r2, #0
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r1, r3, #0
	adds r1, #0x20
	strb r0, [r1]
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808E960
	movs r0, #0xf
	adds r1, r2, #0
	ands r1, r0
	ldrb r2, [r3, #0x18]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x18]
_0808E960:
	lsls r2, r4, #4
	ldrb r1, [r3, #0x18]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetEventObjectDirection

	thumb_func_start GetEventObjectScriptPointerByLocalIdAndMap
GetEventObjectScriptPointerByLocalIdAndMap: @ 0x0808E974
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl GetEventObjectTemplateByLocalIdAndMap
	ldr r0, [r0, #0x10]
	pop {r1}
	bx r1
	thumb_func_end GetEventObjectScriptPointerByLocalIdAndMap

	thumb_func_start GetEventObjectScriptPointerByEventObjectId
GetEventObjectScriptPointerByEventObjectId: @ 0x0808E98C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808E9AC
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r0, [r2, #8]
	ldrb r1, [r2, #9]
	ldrb r2, [r2, #0xa]
	bl GetEventObjectScriptPointerByLocalIdAndMap
	pop {r1}
	bx r1
	.align 2, 0
_0808E9AC: .4byte 0x02036FF0
	thumb_func_end GetEventObjectScriptPointerByEventObjectId

	thumb_func_start GetEventObjectFlagIdByLocalIdAndMap
GetEventObjectFlagIdByLocalIdAndMap: @ 0x0808E9B0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl GetEventObjectTemplateByLocalIdAndMap
	ldrh r0, [r0, #0x14]
	pop {r1}
	bx r1
	thumb_func_end GetEventObjectFlagIdByLocalIdAndMap

	thumb_func_start GetEventObjectFlagIdByEventObjectId
GetEventObjectFlagIdByEventObjectId: @ 0x0808E9C8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0808E9EC
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r0, [r2, #8]
	ldrb r1, [r2, #9]
	ldrb r2, [r2, #0xa]
	bl GetEventObjectFlagIdByLocalIdAndMap
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_0808E9EC: .4byte 0x02036FF0
	thumb_func_end GetEventObjectFlagIdByEventObjectId

	thumb_func_start sub_0808E9F0
sub_0808E9F0: @ 0x0808E9F0
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EA24
	ldr r2, _0808EA20
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #7]
	b _0808EA26
	.align 2, 0
_0808EA20: .4byte 0x02036FF0
_0808EA24:
	movs r0, #0xff
_0808EA26:
	add sp, #4
	pop {r1}
	bx r1
	thumb_func_end sub_0808E9F0

	thumb_func_start sub_0808EA2C
sub_0808EA2C: @ 0x0808EA2C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808EA40
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #7]
	bx lr
	.align 2, 0
_0808EA40: .4byte 0x02036FF0
	thumb_func_end sub_0808EA2C

	thumb_func_start sub_0808EA44
sub_0808EA44: @ 0x0808EA44
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EA78
	ldr r2, _0808EA74
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	b _0808EA7A
	.align 2, 0
_0808EA74: .4byte 0x02036FF0
_0808EA78:
	movs r0, #0xff
_0808EA7A:
	add sp, #4
	pop {r1}
	bx r1
	thumb_func_end sub_0808EA44

	thumb_func_start EventObjectGetBerryTreeId
EventObjectGetBerryTreeId: @ 0x0808EA80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808EA94
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	bx lr
	.align 2, 0
_0808EA94: .4byte 0x02036FF0
	thumb_func_end EventObjectGetBerryTreeId

	thumb_func_start GetEventObjectTemplateByLocalIdAndMap
GetEventObjectTemplateByLocalIdAndMap: @ 0x0808EA98
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0808EAC8
	ldr r1, [r0]
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _0808EAD0
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _0808EAD0
	movs r0, #0xc7
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r0, _0808EACC
	ldr r0, [r0, #4]
	b _0808EADC
	.align 2, 0
_0808EAC8: .4byte 0x03005AEC
_0808EACC: .4byte 0x02036FB8
_0808EAD0:
	adds r0, r2, #0
	adds r1, r3, #0
	bl Overworld_GetMapHeaderByGroupAndId
	ldr r0, [r0, #4]
	ldr r1, [r0, #4]
_0808EADC:
	ldrb r2, [r0]
	adds r0, r4, #0
	bl FindEventObjectTemplateByLocalId
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetEventObjectTemplateByLocalIdAndMap

	thumb_func_start FindEventObjectTemplateByLocalId
FindEventObjectTemplateByLocalId: @ 0x0808EAEC
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #0
	cmp r1, r2
	bhs _0808EB1A
_0808EAFE:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r5
	ldrb r0, [r3]
	cmp r0, r4
	bne _0808EB10
	adds r0, r3, #0
	b _0808EB1C
_0808EB10:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	blo _0808EAFE
_0808EB1A:
	movs r0, #0
_0808EB1C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FindEventObjectTemplateByLocalId

	thumb_func_start GetBaseTemplateForEventObject
GetBaseTemplateForEventObject: @ 0x0808EB24
	push {r4, r5, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #9]
	ldr r1, _0808EB44
	ldr r2, [r1]
	movs r1, #5
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _0808EB70
	ldrb r1, [r3, #0xa]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _0808EB52
	b _0808EB70
	.align 2, 0
_0808EB44: .4byte 0x03005AEC
_0808EB48:
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r4, r0
	b _0808EB72
_0808EB52:
	movs r1, #0
	adds r4, r2, #0
	ldrb r3, [r3, #8]
	movs r5, #0xc7
	lsls r5, r5, #4
	adds r2, r4, r5
	movs r0, #0
_0808EB60:
	ldrb r5, [r2]
	cmp r3, r5
	beq _0808EB48
	adds r2, #0x18
	adds r0, #0x18
	adds r1, #1
	cmp r1, #0x3f
	ble _0808EB60
_0808EB70:
	movs r0, #0
_0808EB72:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end GetBaseTemplateForEventObject

	thumb_func_start OverrideTemplateCoordsForEventObject
OverrideTemplateCoordsForEventObject: @ 0x0808EB78
	push {r4, lr}
	adds r4, r0, #0
	bl GetBaseTemplateForEventObject
	adds r1, r0, #0
	cmp r1, #0
	beq _0808EB92
	ldrh r0, [r4, #0x10]
	subs r0, #7
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x12]
	subs r0, #7
	strh r0, [r1, #6]
_0808EB92:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end OverrideTemplateCoordsForEventObject

	thumb_func_start OverrideEventObjectTemplateScript
OverrideEventObjectTemplateScript: @ 0x0808EB98
	push {r4, lr}
	adds r4, r1, #0
	bl GetBaseTemplateForEventObject
	cmp r0, #0
	beq _0808EBA6
	str r4, [r0, #0x10]
_0808EBA6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end OverrideEventObjectTemplateScript

	thumb_func_start TryOverrideTemplateCoordsForEventObject
TryOverrideTemplateCoordsForEventObject: @ 0x0808EBAC
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl GetBaseTemplateForEventObject
	cmp r0, #0
	beq _0808EBBC
	strb r4, [r0, #9]
_0808EBBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TryOverrideTemplateCoordsForEventObject

	thumb_func_start TryOverrideEventObjectTemplateCoords
TryOverrideEventObjectTemplateCoords: @ 0x0808EBC4
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EBF2
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808EBF8
	adds r0, r0, r1
	bl OverrideTemplateCoordsForEventObject
_0808EBF2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808EBF8: .4byte 0x02036FF0
	thumb_func_end TryOverrideEventObjectTemplateCoords

	thumb_func_start OverrideSecretBaseDecorationSpriteScript
OverrideSecretBaseDecorationSpriteScript: @ 0x0808EBFC
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EC58
	cmp r4, #6
	beq _0808EC26
	cmp r4, #7
	beq _0808EC44
	b _0808EC58
_0808EC26:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808EC3C
	adds r0, r0, r1
	ldr r1, _0808EC40
	bl OverrideEventObjectTemplateScript
	b _0808EC58
	.align 2, 0
_0808EC3C: .4byte 0x02036FF0
_0808EC40: .4byte 0x082465B5
_0808EC44:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808EC60
	adds r0, r0, r1
	ldr r1, _0808EC64
	bl OverrideEventObjectTemplateScript
_0808EC58:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EC60: .4byte 0x02036FF0
_0808EC64: .4byte 0x082465B9
	thumb_func_end OverrideSecretBaseDecorationSpriteScript

	thumb_func_start InitEventObjectPalettes
InitEventObjectPalettes: @ 0x0808EC68
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl FreeAndReserveObjectSpritePalettes
	ldr r1, _0808ECA0
	ldr r2, _0808ECA4
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0808ECA8
	strb r4, [r2]
	cmp r4, #1
	bne _0808ECB4
	ldr r1, _0808ECAC
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	movs r2, #6
	bl PatchObjectPaletteRange
	ldr r1, _0808ECB0
	movs r0, #8
	strb r0, [r1]
	b _0808ECC6
	.align 2, 0
_0808ECA0: .4byte 0x02037256
_0808ECA4: .4byte 0x000011FF
_0808ECA8: .4byte 0x02037254
_0808ECAC: .4byte 0x084E428C
_0808ECB0: .4byte 0x030030BC
_0808ECB4:
	ldr r0, _0808ECCC
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	movs r2, #0xa
	bl PatchObjectPaletteRange
_0808ECC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ECCC: .4byte 0x084E428C
	thumb_func_end InitEventObjectPalettes

	thumb_func_start GetObjectPaletteTag
GetObjectPaletteTag: @ 0x0808ECD0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #9
	bhi _0808ED0C
	ldr r1, _0808ECEC
	ldr r0, _0808ECF0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #1
	b _0808ED00
	.align 2, 0
_0808ECEC: .4byte 0x084E428C
_0808ECF0: .4byte 0x02037254
_0808ECF4:
	adds r1, r4, #4
	adds r1, r2, r1
	ldr r0, _0808ED08
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #1
_0808ED00:
	adds r0, r0, r1
	ldrh r0, [r0]
	b _0808ED3E
	.align 2, 0
_0808ED08: .4byte 0x02037254
_0808ED0C:
	movs r3, #0
	ldr r0, _0808ED44
	ldrh r1, [r0]
	ldr r2, _0808ED48
	adds r4, r0, #0
	cmp r1, r2
	beq _0808ED3C
	adds r6, r4, #0
	ldr r0, _0808ED4C
	ldrh r1, [r0]
	adds r5, r2, #0
_0808ED22:
	lsls r2, r3, #3
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r1
	beq _0808ECF4
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, r5
	bne _0808ED22
_0808ED3C:
	ldr r0, _0808ED48
_0808ED3E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808ED44: .4byte 0x084E41CC
_0808ED48: .4byte 0x000011FF
_0808ED4C: .4byte 0x02037256
	thumb_func_end GetObjectPaletteTag

	thumb_func_start MovementType_None
MovementType_None: @ 0x0808ED50
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808ED6C
	adds r0, r0, r2
	ldr r2, _0808ED70
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808ED6C: .4byte 0x02036FF0
_0808ED70: .4byte 0x0808ED75
	thumb_func_end MovementType_None

	thumb_func_start MovementType_None_callback
MovementType_None_callback: @ 0x0808ED74
	movs r0, #0
	bx lr
	thumb_func_end MovementType_None_callback

	thumb_func_start MovementType_WanderAround
MovementType_WanderAround: @ 0x0808ED78
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808ED94
	adds r0, r0, r2
	ldr r2, _0808ED98
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808ED94: .4byte 0x02036FF0
_0808ED98: .4byte 0x0808ED9D
	thumb_func_end MovementType_WanderAround

	thumb_func_start MovementType_CopyPlayerInGrass_callback
MovementType_CopyPlayerInGrass_callback: @ 0x0808ED9C
	push {r4, lr}
	ldr r3, _0808EDB8
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_CopyPlayerInGrass_callback

	thumb_func_start MovementAction_Fly_Finish
MovementAction_Fly_Finish: @ 0x0808EDB0
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808EDB8: .4byte 0x084E5B48
	thumb_func_end MovementAction_Fly_Finish

	thumb_func_start MovementType_WanderAround_Step0
MovementType_WanderAround_Step0: @ 0x0808EDBC
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderAround_Step0

	thumb_func_start MovementType_WanderAround_Step1
MovementType_WanderAround_Step1: @ 0x0808EDD0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderAround_Step1

	thumb_func_start MovementType_WanderAround_Step2
MovementType_WanderAround_Step2: @ 0x0808EDFC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EE30
	ldr r5, _0808EE2C
	bl Random
	movs r4, #3
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r6, #0
	bl SetMovementDelay
	strh r4, [r6, #0x30]
	movs r0, #1
	b _0808EE32
	.align 2, 0
_0808EE2C: .4byte 0x084E5B30
_0808EE30:
	movs r0, #0
_0808EE32:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderAround_Step2

	thumb_func_start MovementType_WanderAround_Step3
MovementType_WanderAround_Step3: @ 0x0808EE38
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EE4C
	movs r0, #0
	b _0808EE52
_0808EE4C:
	movs r0, #4
	strh r0, [r4, #0x30]
	movs r0, #1
_0808EE52:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderAround_Step3

	thumb_func_start MovementType_WanderAround_Step4
MovementType_WanderAround_Step4: @ 0x0808EE58
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0808EEA0
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl Random
	movs r1, #3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetEventObjectDirection
	movs r0, #5
	strh r0, [r6, #0x30]
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetCollisionInDirection
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EE96
	movs r0, #1
	strh r0, [r6, #0x30]
_0808EE96:
	movs r0, #1
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808EEA0: .4byte 0x084E5B64
	thumb_func_end MovementType_WanderAround_Step4

	thumb_func_start MovementType_WanderAround_Step5
MovementType_WanderAround_Step5: @ 0x0808EEA4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092CF8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #6
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderAround_Step5

	thumb_func_start MovementType_WanderAround_Step6
MovementType_WanderAround_Step6: @ 0x0808EED4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EEF2
	ldrb r0, [r4]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	strh r0, [r5, #0x30]
_0808EEF2:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderAround_Step6

	thumb_func_start EventObjectIsTrainerAndCloseToPlayer
EventObjectIsTrainerAndCloseToPlayer: @ 0x0808EEFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x80
	bl TestPlayerAvatarFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EF68
	ldrb r0, [r5, #7]
	cmp r0, #1
	beq _0808EF18
	cmp r0, #3
	bne _0808EF68
_0808EF18:
	mov r7, sp
	adds r7, #2
	mov r0, sp
	adds r1, r7, #0
	bl PlayerGetDestCoords
	ldrh r2, [r5, #0x10]
	ldrh r4, [r5, #0x12]
	ldrb r1, [r5, #0x1d]
	subs r3, r2, r1
	subs r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r2, r1, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r0, sp
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	ldrsh r4, [r0, r1]
	cmp r3, r4
	bgt _0808EF68
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	blt _0808EF68
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r7, r2]
	cmp r0, r1
	bgt _0808EF68
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	bge _0808EF6C
_0808EF68:
	movs r0, #0
	b _0808EF6E
_0808EF6C:
	movs r0, #1
_0808EF6E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end EventObjectIsTrainerAndCloseToPlayer

	thumb_func_start GetVectorDirection
GetVectorDirection: @ 0x0808EF78
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	cmp r2, r3
	ble _0808EF96
	movs r2, #4
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _0808EFA0
	movs r2, #3
	b _0808EFA0
_0808EF96:
	movs r2, #1
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0808EFA0
	movs r2, #2
_0808EFA0:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetVectorDirection

	thumb_func_start GetLimitedVectorDirection_SouthNorth
GetLimitedVectorDirection_SouthNorth: @ 0x0808EFA8
	push {lr}
	movs r0, #1
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0808EFB4
	movs r0, #2
_0808EFB4:
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_SouthNorth

	thumb_func_start GetLimitedVectorDirection_WestEast
GetLimitedVectorDirection_WestEast: @ 0x0808EFB8
	push {lr}
	movs r1, #4
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0808EFC4
	movs r1, #3
_0808EFC4:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetLimitedVectorDirection_WestEast

	thumb_func_start GetLimitedVectorDirection_WestNorth
GetLimitedVectorDirection_WestNorth: @ 0x0808EFCC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r3, r3, #0x10
	asrs r7, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetVectorDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F008
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetLimitedVectorDirection_WestEast
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808F022
	b _0808F020
_0808F008:
	cmp r0, #4
	bne _0808F022
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetLimitedVectorDirection_SouthNorth
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F022
_0808F020:
	movs r0, #2
_0808F022:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_WestNorth

	thumb_func_start GetLimitedVectorDirection_EastNorth
GetLimitedVectorDirection_EastNorth: @ 0x0808F028
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r3, r3, #0x10
	asrs r7, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetVectorDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F064
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetLimitedVectorDirection_WestEast
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808F07E
	b _0808F07C
_0808F064:
	cmp r0, #3
	bne _0808F07E
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetLimitedVectorDirection_SouthNorth
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F07E
_0808F07C:
	movs r0, #2
_0808F07E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_EastNorth

	thumb_func_start GetLimitedVectorDirection_WestSouth
GetLimitedVectorDirection_WestSouth: @ 0x0808F084
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r3, r3, #0x10
	asrs r7, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetVectorDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808F0C0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetLimitedVectorDirection_WestEast
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808F0DA
	b _0808F0D8
_0808F0C0:
	cmp r0, #4
	bne _0808F0DA
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetLimitedVectorDirection_SouthNorth
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808F0DA
_0808F0D8:
	movs r0, #1
_0808F0DA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_WestSouth

	thumb_func_start GetLimitedVectorDirection_EastSouth
GetLimitedVectorDirection_EastSouth: @ 0x0808F0E0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r3, r3, #0x10
	asrs r7, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetVectorDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808F11C
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetLimitedVectorDirection_WestEast
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808F136
	b _0808F134
_0808F11C:
	cmp r0, #3
	bne _0808F136
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl GetLimitedVectorDirection_SouthNorth
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808F136
_0808F134:
	movs r0, #1
_0808F136:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_EastSouth

	thumb_func_start GetLimitedVectorDirection_SouthNorthWest
GetLimitedVectorDirection_SouthNorthWest: @ 0x0808F13C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	lsls r3, r3, #0x10
	asrs r4, r3, #0x10
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetVectorDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808F172
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetLimitedVectorDirection_SouthNorth
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0808F172:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_SouthNorthWest

	thumb_func_start GetLimitedVectorDirection_SouthNorthEast
GetLimitedVectorDirection_SouthNorthEast: @ 0x0808F178
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	lsls r3, r3, #0x10
	asrs r4, r3, #0x10
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetVectorDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808F1AE
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetLimitedVectorDirection_SouthNorth
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0808F1AE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_SouthNorthEast

	thumb_func_start GetLimitedVectorDirection_NorthWestEast
GetLimitedVectorDirection_NorthWestEast: @ 0x0808F1B4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	lsls r3, r3, #0x10
	asrs r4, r3, #0x10
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetVectorDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F1EA
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetLimitedVectorDirection_WestEast
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0808F1EA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_NorthWestEast

	thumb_func_start GetLimitedVectorDirection_SouthWestEast
GetLimitedVectorDirection_SouthWestEast: @ 0x0808F1F0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	lsls r3, r3, #0x10
	asrs r4, r3, #0x10
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetVectorDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808F226
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl GetLimitedVectorDirection_WestEast
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0808F226:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetLimitedVectorDirection_SouthWestEast

	thumb_func_start TryGetTrainerEncounterDirection
TryGetTrainerEncounterDirection: @ 0x0808F22C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F244
	movs r0, #0
	b _0808F2A8
_0808F244:
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r5, #0
	bl PlayerGetDestCoords
	mov r2, sp
	mov r0, sp
	ldrh r0, [r0]
	ldrh r1, [r4, #0x10]
	subs r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r5]
	ldrh r1, [r4, #0x12]
	subs r0, r0, r1
	strh r0, [r5]
	mov r0, sp
	ldrh r3, [r5]
	ldrh r2, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0808F278
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0808F278:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0808F286
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0808F286:
	ldr r0, _0808F2B0
	lsls r4, r6, #2
	adds r4, r4, r0
	mov r0, sp
	movs r6, #0
	ldrsh r0, [r0, r6]
	movs r6, #0
	ldrsh r1, [r5, r6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r4, [r4]
	bl _call_via_r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0808F2A8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808F2B0: .4byte 0x084E5B68
	thumb_func_end TryGetTrainerEncounterDirection

	thumb_func_start MovementType_LookAround
MovementType_LookAround: @ 0x0808F2B4
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808F2D0
	adds r0, r0, r2
	ldr r2, _0808F2D4
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808F2D0: .4byte 0x02036FF0
_0808F2D4: .4byte 0x0808F2D9
	thumb_func_end MovementType_LookAround

	thumb_func_start MovementType_CopyPlayer_callback
MovementType_CopyPlayer_callback: @ 0x0808F2D8
	push {r4, lr}
	ldr r3, _0808F2F4
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_CopyPlayer_callback

	thumb_func_start sub_0808F2EC
sub_0808F2EC: @ 0x0808F2EC
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F2F4: .4byte 0x084E5B94
	thumb_func_end sub_0808F2EC

	thumb_func_start MovementType_LookAround_Step0
MovementType_LookAround_Step0: @ 0x0808F2F8
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_LookAround_Step0

	thumb_func_start MovementType_LookAround_Step1
MovementType_LookAround_Step1: @ 0x0808F30C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_LookAround_Step1

	thumb_func_start MovementType_LookAround_Step2
MovementType_LookAround_Step2: @ 0x0808F338
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F36E
	ldr r4, _0808F378
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_0808F36E:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808F378: .4byte 0x084E5B30
	thumb_func_end MovementType_LookAround_Step2

	thumb_func_start MovementType_LookAround_Step3
MovementType_LookAround_Step3: @ 0x0808F37C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F39A
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F3A2
_0808F39A:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _0808F3A4
_0808F3A2:
	movs r0, #0
_0808F3A4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_LookAround_Step3

	thumb_func_start MovementType_LookAround_Step4
MovementType_LookAround_Step4: @ 0x0808F3AC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0808F3F0
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r0, r4, #0
	movs r1, #0
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0808F3DC
	bl Random
	movs r1, #3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0808F3DC:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808F3F0: .4byte 0x084E5B64
	thumb_func_end MovementType_LookAround_Step4

	thumb_func_start MovementType_WanderUpAndDown
MovementType_WanderUpAndDown: @ 0x0808F3F4
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808F410
	adds r0, r0, r2
	ldr r2, _0808F414
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808F410: .4byte 0x02036FF0
_0808F414: .4byte 0x0808F419
	thumb_func_end MovementType_WanderUpAndDown

	thumb_func_start MovementType_FaceDirection_callback
MovementType_FaceDirection_callback: @ 0x0808F418
	push {r4, lr}
	ldr r3, _0808F434
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceDirection_callback

	thumb_func_start sub_0808F42C
sub_0808F42C: @ 0x0808F42C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F434: .4byte 0x084E5BA8
	thumb_func_end sub_0808F42C

	thumb_func_start MovementType_WanderUpAndDown_Step0
MovementType_WanderUpAndDown_Step0: @ 0x0808F438
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderUpAndDown_Step0

	thumb_func_start MovementType_WanderUpAndDown_Step1
MovementType_WanderUpAndDown_Step1: @ 0x0808F44C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderUpAndDown_Step1

	thumb_func_start MovementType_WanderUpAndDown_Step2
MovementType_WanderUpAndDown_Step2: @ 0x0808F478
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F4AC
	ldr r5, _0808F4A8
	bl Random
	movs r4, #3
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r6, #0
	bl SetMovementDelay
	strh r4, [r6, #0x30]
	movs r0, #1
	b _0808F4AE
	.align 2, 0
_0808F4A8: .4byte 0x084E5B30
_0808F4AC:
	movs r0, #0
_0808F4AE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderUpAndDown_Step2

	thumb_func_start MovementType_WanderUpAndDown_Step3
MovementType_WanderUpAndDown_Step3: @ 0x0808F4B4
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F4C8
	movs r0, #0
	b _0808F4CE
_0808F4C8:
	movs r0, #4
	strh r0, [r4, #0x30]
	movs r0, #1
_0808F4CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderUpAndDown_Step3

	thumb_func_start MovementType_WanderUpAndDown_Step4
MovementType_WanderUpAndDown_Step4: @ 0x0808F4D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0808F51C
	mov r0, sp
	movs r2, #2
	bl memcpy
	bl Random
	movs r7, #1
	adds r1, r7, #0
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetEventObjectDirection
	movs r0, #5
	strh r0, [r6, #0x30]
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetCollisionInDirection
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F512
	strh r7, [r6, #0x30]
_0808F512:
	movs r0, #1
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808F51C: .4byte 0x084E5BC4
	thumb_func_end MovementType_WanderUpAndDown_Step4

	thumb_func_start MovementType_WanderUpAndDown_Step5
MovementType_WanderUpAndDown_Step5: @ 0x0808F520
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092CF8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #6
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderUpAndDown_Step5

	thumb_func_start MovementType_WanderUpAndDown_Step6
MovementType_WanderUpAndDown_Step6: @ 0x0808F550
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F56E
	ldrb r0, [r4]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	strh r0, [r5, #0x30]
_0808F56E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderUpAndDown_Step6

	thumb_func_start MovementType_WanderLeftAndRight
MovementType_WanderLeftAndRight: @ 0x0808F578
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808F594
	adds r0, r0, r2
	ldr r2, _0808F598
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808F594: .4byte 0x02036FF0
_0808F598: .4byte 0x0808F59D
	thumb_func_end MovementType_WanderLeftAndRight

	thumb_func_start MovementType_FaceDownAndLeft_callback
MovementType_FaceDownAndLeft_callback: @ 0x0808F59C
	push {r4, lr}
	ldr r3, _0808F5B8
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceDownAndLeft_callback

	thumb_func_start GetAcroUnusedActionDirectionAnimNum
GetAcroUnusedActionDirectionAnimNum: @ 0x0808F5B0
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F5B8: .4byte 0x084E5BC8
	thumb_func_end GetAcroUnusedActionDirectionAnimNum

	thumb_func_start MovementType_WanderLeftAndRight_Step0
MovementType_WanderLeftAndRight_Step0: @ 0x0808F5BC
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderLeftAndRight_Step0

	thumb_func_start MovementType_WanderLeftAndRight_Step1
MovementType_WanderLeftAndRight_Step1: @ 0x0808F5D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderLeftAndRight_Step1

	thumb_func_start MovementType_WanderLeftAndRight_Step2
MovementType_WanderLeftAndRight_Step2: @ 0x0808F5FC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F630
	ldr r5, _0808F62C
	bl Random
	movs r4, #3
	adds r1, r4, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r6, #0
	bl SetMovementDelay
	strh r4, [r6, #0x30]
	movs r0, #1
	b _0808F632
	.align 2, 0
_0808F62C: .4byte 0x084E5B30
_0808F630:
	movs r0, #0
_0808F632:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderLeftAndRight_Step2

	thumb_func_start MovementType_WanderLeftAndRight_Step3
MovementType_WanderLeftAndRight_Step3: @ 0x0808F638
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F64C
	movs r0, #0
	b _0808F652
_0808F64C:
	movs r0, #4
	strh r0, [r4, #0x30]
	movs r0, #1
_0808F652:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderLeftAndRight_Step3

	thumb_func_start MovementType_WanderLeftAndRight_Step4
MovementType_WanderLeftAndRight_Step4: @ 0x0808F658
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0808F6A0
	mov r0, sp
	movs r2, #2
	bl memcpy
	bl Random
	movs r7, #1
	adds r1, r7, #0
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetEventObjectDirection
	movs r0, #5
	strh r0, [r6, #0x30]
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetCollisionInDirection
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F696
	strh r7, [r6, #0x30]
_0808F696:
	movs r0, #1
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808F6A0: .4byte 0x084E5BE4
	thumb_func_end MovementType_WanderLeftAndRight_Step4

	thumb_func_start MovementType_WanderLeftAndRight_Step5
MovementType_WanderLeftAndRight_Step5: @ 0x0808F6A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092CF8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #6
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WanderLeftAndRight_Step5

	thumb_func_start MovementType_WanderLeftAndRight_Step6
MovementType_WanderLeftAndRight_Step6: @ 0x0808F6D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F6F2
	ldrb r0, [r4]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	strh r0, [r5, #0x30]
_0808F6F2:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WanderLeftAndRight_Step6

	thumb_func_start MovementType_FaceDirection
MovementType_FaceDirection: @ 0x0808F6FC
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808F718
	adds r0, r0, r2
	ldr r2, _0808F71C
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808F718: .4byte 0x02036FF0
_0808F71C: .4byte 0x0808F721
	thumb_func_end MovementType_FaceDirection

	thumb_func_start MovementType_FaceDownAndRight_callback
MovementType_FaceDownAndRight_callback: @ 0x0808F720
	push {r4, lr}
	ldr r3, _0808F73C
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceDownAndRight_callback

	thumb_func_start GetAcroWheelieDirectionAnimNum
GetAcroWheelieDirectionAnimNum: @ 0x0808F734
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F73C: .4byte 0x084E5BE8
	thumb_func_end GetAcroWheelieDirectionAnimNum

	thumb_func_start MovementType_FaceDirection_Step0
MovementType_FaceDirection_Step0: @ 0x0808F740
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_FaceDirection_Step0

	thumb_func_start MovementType_FaceDirection_Step1
MovementType_FaceDirection_Step1: @ 0x0808F76C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F77E
	movs r0, #0
	b _0808F784
_0808F77E:
	movs r0, #2
	strh r0, [r4, #0x30]
	movs r0, #1
_0808F784:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDirection_Step1

	thumb_func_start MovementType_Invisible_Step2
MovementType_Invisible_Step2: @ 0x0808F78C
	ldrb r2, [r0]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end MovementType_Invisible_Step2

	thumb_func_start MovementType_BerryTreeGrowth
MovementType_BerryTreeGrowth: @ 0x0808F79C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0808F7D8
	adds r5, r0, r1
	ldrh r1, [r4, #0x3c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0808F7C8
	adds r0, r5, #0
	adds r1, r4, #0
	bl get_berry_tree_graphics
	ldrh r1, [r4, #0x3c]
	movs r0, #1
	orrs r0, r1
	strh r0, [r4, #0x3c]
_0808F7C8:
	ldr r2, _0808F7DC
	adds r0, r5, #0
	adds r1, r4, #0
	bl UpdateEventObjectCurrentMovement
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F7D8: .4byte 0x02036FF0
_0808F7DC: .4byte 0x0808F7E1
	thumb_func_end MovementType_BerryTreeGrowth

	thumb_func_start MovementType_FaceDownAndUp_callback
MovementType_FaceDownAndUp_callback: @ 0x0808F7E0
	push {r4, lr}
	ldr r3, _0808F7FC
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceDownAndUp_callback

	thumb_func_start GetAcroWheeliePedalDirectionAnimNum
GetAcroWheeliePedalDirectionAnimNum: @ 0x0808F7F4
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F7FC: .4byte 0x084E5BF4
	thumb_func_end GetAcroWheeliePedalDirectionAnimNum

	thumb_func_start MovementType_BerryTreeGrowth_Step0
MovementType_BerryTreeGrowth_Step0: @ 0x0808F800
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #1]
	adds r6, r5, #0
	adds r6, #0x3e
	ldrb r0, [r6]
	movs r1, #4
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r4, #0x1d]
	bl GetStageByBerryTreeId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	bne _0808F870
	ldrh r1, [r5, #0x3c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0808F866
	subs r6, #0x14
	ldrb r0, [r6]
	cmp r0, #4
	bne _0808F866
	ldr r1, _0808F86C
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, #4]
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	subs r0, #1
	str r0, [r1, #8]
	ldrb r0, [r5, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r1, #0xc]
	movs r0, #0x17
	bl FieldEffectStart
	strb r7, [r6]
_0808F866:
	movs r0, #0
	b _0808F8B2
	.align 2, 0
_0808F86C: .4byte 0x020388A8
_0808F870:
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r6]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	subs r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r7
	bne _0808F8AC
	adds r0, r4, #0
	adds r1, r5, #0
	bl get_berry_tree_graphics
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x39
	bl EventObjectSetSingleMovement
	movs r0, #1
	strh r0, [r5, #0x30]
	b _0808F8B2
_0808F8AC:
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
_0808F8B2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end MovementType_BerryTreeGrowth_Step0

	thumb_func_start MovementType_BerryTreeGrowth_Step1
MovementType_BerryTreeGrowth_Step1: @ 0x0808F8B8
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F8CA
	movs r0, #0
	b _0808F8D0
_0808F8CA:
	movs r0, #0
	strh r0, [r4, #0x30]
	movs r0, #1
_0808F8D0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_BerryTreeGrowth_Step1

	thumb_func_start MovementType_BerryTreeGrowth_Step2
MovementType_BerryTreeGrowth_Step2: @ 0x0808F8D8
	push {r4, lr}
	ldrb r2, [r0]
	movs r3, #2
	orrs r2, r3
	strb r2, [r0]
	movs r3, #0
	movs r2, #3
	strh r2, [r1, #0x30]
	strh r3, [r1, #0x32]
	ldrh r3, [r1, #0x3c]
	movs r2, #2
	orrs r2, r3
	strh r2, [r1, #0x3c]
	ldr r3, _0808F920
	movs r4, #0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	str r0, [r3, #4]
	adds r0, r1, #0
	adds r0, #0x43
	ldrb r0, [r0]
	subs r0, #1
	str r0, [r3, #8]
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r3, #0xc]
	movs r0, #0x17
	bl FieldEffectStart
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F920: .4byte 0x020388A8
	thumb_func_end MovementType_BerryTreeGrowth_Step2

	thumb_func_start MovementType_BerryTreeGrowth_Step3
MovementType_BerryTreeGrowth_Step3: @ 0x0808F924
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldrh r1, [r4, #0x32]
	adds r1, #1
	strh r1, [r4, #0x32]
	movs r0, #2
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #5
	ldrb r2, [r3, #1]
	subs r0, #0x23
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	bgt _0808F95C
	movs r0, #0
	b _0808F96E
_0808F95C:
	adds r0, r3, #0
	adds r1, r4, #0
	bl get_berry_tree_graphics
	movs r0, #4
	strh r0, [r4, #0x30]
	movs r0, #0
	strh r0, [r4, #0x32]
	movs r0, #1
_0808F96E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementType_BerryTreeGrowth_Step3

	thumb_func_start MovementType_BerryTreeGrowth_Step4
MovementType_BerryTreeGrowth_Step4: @ 0x0808F974
	push {r4, lr}
	adds r4, r1, #0
	ldrh r2, [r4, #0x32]
	adds r2, #1
	strh r2, [r4, #0x32]
	movs r1, #2
	ands r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x11
	lsls r2, r2, #5
	ldrb r3, [r0, #1]
	subs r1, #0x23
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #1]
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	bgt _0808F9AA
	movs r0, #0
	b _0808F9B8
_0808F9AA:
	movs r0, #0
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x3c]
	subs r0, #3
	ands r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #1
_0808F9B8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_BerryTreeGrowth_Step4

	thumb_func_start MovementType_FaceDownAndUp
MovementType_FaceDownAndUp: @ 0x0808F9C0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808F9DC
	adds r0, r0, r2
	ldr r2, _0808F9E0
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808F9DC: .4byte 0x02036FF0
_0808F9E0: .4byte 0x0808F9E5
	thumb_func_end MovementType_FaceDownAndUp

	thumb_func_start MovementType_FaceDownRightAndLeft_callback
MovementType_FaceDownRightAndLeft_callback: @ 0x0808F9E4
	push {r4, lr}
	ldr r3, _0808FA00
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceDownRightAndLeft_callback

	thumb_func_start GetFaceDirectionAnimNum
GetFaceDirectionAnimNum: @ 0x0808F9F8
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808FA00: .4byte 0x084E5C08
	thumb_func_end GetFaceDirectionAnimNum

	thumb_func_start MovementType_FaceDownAndUp_Step0
MovementType_FaceDownAndUp_Step0: @ 0x0808FA04
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndUp_Step0

	thumb_func_start MovementType_FaceDownAndUp_Step1
MovementType_FaceDownAndUp_Step1: @ 0x0808FA18
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndUp_Step1

	thumb_func_start MovementType_FaceDownAndUp_Step2
MovementType_FaceDownAndUp_Step2: @ 0x0808FA44
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA7A
	ldr r4, _0808FA84
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_0808FA7A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808FA84: .4byte 0x084E5B30
	thumb_func_end MovementType_FaceDownAndUp_Step2

	thumb_func_start MovementType_FaceDownAndUp_Step3
MovementType_FaceDownAndUp_Step3: @ 0x0808FA88
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808FAA6
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FAAE
_0808FAA6:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _0808FAB0
_0808FAAE:
	movs r0, #0
_0808FAB0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndUp_Step3

	thumb_func_start MovementType_FaceDownAndUp_Step4
MovementType_FaceDownAndUp_Step4: @ 0x0808FAB8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0808FAFC
	mov r0, sp
	movs r2, #2
	bl memcpy
	adds r0, r4, #0
	movs r1, #1
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0808FAE8
	bl Random
	movs r1, #1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0808FAE8:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808FAFC: .4byte 0x084E5BC4
	thumb_func_end MovementType_FaceDownAndUp_Step4

	thumb_func_start MovementType_FaceLeftAndRight
MovementType_FaceLeftAndRight: @ 0x0808FB00
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808FB1C
	adds r0, r0, r2
	ldr r2, _0808FB20
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808FB1C: .4byte 0x02036FF0
_0808FB20: .4byte 0x0808FB25
	thumb_func_end MovementType_FaceLeftAndRight

	thumb_func_start MovementType_FaceDownUpAndLeft_callback
MovementType_FaceDownUpAndLeft_callback: @ 0x0808FB24
	push {r4, lr}
	ldr r3, _0808FB40
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceDownUpAndLeft_callback

	thumb_func_start GetFishingBiteDirectionAnimNum
GetFishingBiteDirectionAnimNum: @ 0x0808FB38
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808FB40: .4byte 0x084E5C1C
	thumb_func_end GetFishingBiteDirectionAnimNum

	thumb_func_start MovementType_FaceLeftAndRight_Step0
MovementType_FaceLeftAndRight_Step0: @ 0x0808FB44
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceLeftAndRight_Step0

	thumb_func_start MovementType_FaceLeftAndRight_Step1
MovementType_FaceLeftAndRight_Step1: @ 0x0808FB58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceLeftAndRight_Step1

	thumb_func_start MovementType_FaceLeftAndRight_Step2
MovementType_FaceLeftAndRight_Step2: @ 0x0808FB84
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FBBA
	ldr r4, _0808FBC4
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_0808FBBA:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808FBC4: .4byte 0x084E5B30
	thumb_func_end MovementType_FaceLeftAndRight_Step2

	thumb_func_start MovementType_FaceLeftAndRight_Step3
MovementType_FaceLeftAndRight_Step3: @ 0x0808FBC8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808FBE6
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FBEE
_0808FBE6:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _0808FBF0
_0808FBEE:
	movs r0, #0
_0808FBF0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceLeftAndRight_Step3

	thumb_func_start MovementType_FaceLeftAndRight_Step4
MovementType_FaceLeftAndRight_Step4: @ 0x0808FBF8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0808FC3C
	mov r0, sp
	movs r2, #2
	bl memcpy
	adds r0, r4, #0
	movs r1, #2
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0808FC28
	bl Random
	movs r1, #1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0808FC28:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808FC3C: .4byte 0x084E5BE4
	thumb_func_end MovementType_FaceLeftAndRight_Step4

	thumb_func_start MovementType_FaceUpAndLeft
MovementType_FaceUpAndLeft: @ 0x0808FC40
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808FC5C
	adds r0, r0, r2
	ldr r2, _0808FC60
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808FC5C: .4byte 0x02036FF0
_0808FC60: .4byte 0x0808FC65
	thumb_func_end MovementType_FaceUpAndLeft

	thumb_func_start MovementType_FaceDownUpAndRight_callback
MovementType_FaceDownUpAndRight_callback: @ 0x0808FC64
	push {r4, lr}
	ldr r3, _0808FC80
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceDownUpAndRight_callback

	thumb_func_start GetFishingDirectionAnimNum
GetFishingDirectionAnimNum: @ 0x0808FC78
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808FC80: .4byte 0x084E5C30
	thumb_func_end GetFishingDirectionAnimNum

	thumb_func_start MovementType_FaceUpAndLeft_Step0
MovementType_FaceUpAndLeft_Step0: @ 0x0808FC84
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpAndLeft_Step0

	thumb_func_start MovementType_FaceUpAndLeft_Step1
MovementType_FaceUpAndLeft_Step1: @ 0x0808FC98
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpAndLeft_Step1

	thumb_func_start MovementType_FaceUpAndLeft_Step2
MovementType_FaceUpAndLeft_Step2: @ 0x0808FCC4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FCFA
	ldr r4, _0808FD04
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_0808FCFA:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808FD04: .4byte 0x084E5B40
	thumb_func_end MovementType_FaceUpAndLeft_Step2

	thumb_func_start MovementType_FaceUpAndLeft_Step3
MovementType_FaceUpAndLeft_Step3: @ 0x0808FD08
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808FD26
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FD2E
_0808FD26:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _0808FD30
_0808FD2E:
	movs r0, #0
_0808FD30:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpAndLeft_Step3

	thumb_func_start MovementType_FaceUpAndLeft_Step4
MovementType_FaceUpAndLeft_Step4: @ 0x0808FD38
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0808FD7C
	mov r0, sp
	movs r2, #2
	bl memcpy
	adds r0, r4, #0
	movs r1, #3
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0808FD68
	bl Random
	movs r1, #1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0808FD68:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808FD7C: .4byte 0x084E5C44
	thumb_func_end MovementType_FaceUpAndLeft_Step4

	thumb_func_start MovementType_FaceUpAndRight
MovementType_FaceUpAndRight: @ 0x0808FD80
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808FD9C
	adds r0, r0, r2
	ldr r2, _0808FDA0
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808FD9C: .4byte 0x02036FF0
_0808FDA0: .4byte 0x0808FDA5
	thumb_func_end MovementType_FaceUpAndRight

	thumb_func_start MovementType_FaceLeftAndRight_callback
MovementType_FaceLeftAndRight_callback: @ 0x0808FDA4
	push {r4, lr}
	ldr r3, _0808FDC0
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceLeftAndRight_callback

	thumb_func_start GetFishingNoCatchDirectionAnimNum
GetFishingNoCatchDirectionAnimNum: @ 0x0808FDB8
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808FDC0: .4byte 0x084E5C48
	thumb_func_end GetFishingNoCatchDirectionAnimNum

	thumb_func_start MovementType_FaceUpAndRight_Step0
MovementType_FaceUpAndRight_Step0: @ 0x0808FDC4
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpAndRight_Step0

	thumb_func_start MovementType_FaceUpAndRight_Step1
MovementType_FaceUpAndRight_Step1: @ 0x0808FDD8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpAndRight_Step1

	thumb_func_start MovementType_FaceUpAndRight_Step2
MovementType_FaceUpAndRight_Step2: @ 0x0808FE04
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FE3A
	ldr r4, _0808FE44
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_0808FE3A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808FE44: .4byte 0x084E5B40
	thumb_func_end MovementType_FaceUpAndRight_Step2

	thumb_func_start MovementType_FaceUpAndRight_Step3
MovementType_FaceUpAndRight_Step3: @ 0x0808FE48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808FE66
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FE6E
_0808FE66:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _0808FE70
_0808FE6E:
	movs r0, #0
_0808FE70:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpAndRight_Step3

	thumb_func_start MovementType_FaceUpAndRight_Step4
MovementType_FaceUpAndRight_Step4: @ 0x0808FE78
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0808FEBC
	mov r0, sp
	movs r2, #2
	bl memcpy
	adds r0, r4, #0
	movs r1, #4
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0808FEA8
	bl Random
	movs r1, #1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0808FEA8:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808FEBC: .4byte 0x084E5C5C
	thumb_func_end MovementType_FaceUpAndRight_Step4

	thumb_func_start MovementType_FaceDownAndLeft
MovementType_FaceDownAndLeft: @ 0x0808FEC0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0808FEDC
	adds r0, r0, r2
	ldr r2, _0808FEE0
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0808FEDC: .4byte 0x02036FF0
_0808FEE0: .4byte 0x0808FEE5
	thumb_func_end MovementType_FaceDownAndLeft

	thumb_func_start MovementType_FaceUpAndLeft_callback
MovementType_FaceUpAndLeft_callback: @ 0x0808FEE4
	push {r4, lr}
	ldr r3, _0808FF00
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceUpAndLeft_callback

	thumb_func_start GetJumpSpecialDirectionAnimNum
GetJumpSpecialDirectionAnimNum: @ 0x0808FEF8
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808FF00: .4byte 0x084E5C60
	thumb_func_end GetJumpSpecialDirectionAnimNum

	thumb_func_start MovementType_FaceDownAndLeft_Step0
MovementType_FaceDownAndLeft_Step0: @ 0x0808FF04
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndLeft_Step0

	thumb_func_start MovementType_FaceDownAndLeft_Step1
MovementType_FaceDownAndLeft_Step1: @ 0x0808FF18
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndLeft_Step1

	thumb_func_start MovementType_FaceDownAndLeft_Step2
MovementType_FaceDownAndLeft_Step2: @ 0x0808FF44
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FF7A
	ldr r4, _0808FF84
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_0808FF7A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808FF84: .4byte 0x084E5B40
	thumb_func_end MovementType_FaceDownAndLeft_Step2

	thumb_func_start MovementType_FaceDownAndLeft_Step3
MovementType_FaceDownAndLeft_Step3: @ 0x0808FF88
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808FFA6
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FFAE
_0808FFA6:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _0808FFB0
_0808FFAE:
	movs r0, #0
_0808FFB0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndLeft_Step3

	thumb_func_start MovementType_FaceDownAndLeft_Step4
MovementType_FaceDownAndLeft_Step4: @ 0x0808FFB8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0808FFFC
	mov r0, sp
	movs r2, #2
	bl memcpy
	adds r0, r4, #0
	movs r1, #5
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0808FFE8
	bl Random
	movs r1, #1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0808FFE8:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808FFFC: .4byte 0x084E5C74
	thumb_func_end MovementType_FaceDownAndLeft_Step4

	thumb_func_start MovementType_FaceDownAndRight
MovementType_FaceDownAndRight: @ 0x08090000
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0809001C
	adds r0, r0, r2
	ldr r2, _08090020
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0809001C: .4byte 0x02036FF0
_08090020: .4byte 0x08090025
	thumb_func_end MovementType_FaceDownAndRight

	thumb_func_start MovementType_FaceUpAndRight_callback
MovementType_FaceUpAndRight_callback: @ 0x08090024
	push {r4, lr}
	ldr r3, _08090040
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceUpAndRight_callback

	thumb_func_start GetMoveDirectionAnimNum
GetMoveDirectionAnimNum: @ 0x08090038
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090040: .4byte 0x084E5C78
	thumb_func_end GetMoveDirectionAnimNum

	thumb_func_start MovementType_FaceDownAndRight_Step0
MovementType_FaceDownAndRight_Step0: @ 0x08090044
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndRight_Step0

	thumb_func_start MovementType_FaceDownAndRight_Step1
MovementType_FaceDownAndRight_Step1: @ 0x08090058
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndRight_Step1

	thumb_func_start MovementType_FaceDownAndRight_Step2
MovementType_FaceDownAndRight_Step2: @ 0x08090084
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080900BA
	ldr r4, _080900C4
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_080900BA:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080900C4: .4byte 0x084E5B40
	thumb_func_end MovementType_FaceDownAndRight_Step2

	thumb_func_start MovementType_FaceDownAndRight_Step3
MovementType_FaceDownAndRight_Step3: @ 0x080900C8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080900E6
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080900EE
_080900E6:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _080900F0
_080900EE:
	movs r0, #0
_080900F0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownAndRight_Step3

	thumb_func_start MovementType_FaceDownAndRight_Step4
MovementType_FaceDownAndRight_Step4: @ 0x080900F8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0809013C
	mov r0, sp
	movs r2, #2
	bl memcpy
	adds r0, r4, #0
	movs r1, #6
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08090128
	bl Random
	movs r1, #1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_08090128:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809013C: .4byte 0x084E5C8C
	thumb_func_end MovementType_FaceDownAndRight_Step4

	thumb_func_start MovementType_FaceDownUpAndLeft
MovementType_FaceDownUpAndLeft: @ 0x08090140
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0809015C
	adds r0, r0, r2
	ldr r2, _08090160
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0809015C: .4byte 0x02036FF0
_08090160: .4byte 0x08090165
	thumb_func_end MovementType_FaceDownUpAndLeft

	thumb_func_start MovementType_FaceUpRightAndLeft_callback
MovementType_FaceUpRightAndLeft_callback: @ 0x08090164
	push {r4, lr}
	ldr r3, _08090180
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_FaceUpRightAndLeft_callback

	thumb_func_start GetMoveDirectionFastAnimNum
GetMoveDirectionFastAnimNum: @ 0x08090178
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090180: .4byte 0x084E5C90
	thumb_func_end GetMoveDirectionFastAnimNum

	thumb_func_start MovementType_FaceDownUpAndLeft_Step0
MovementType_FaceDownUpAndLeft_Step0: @ 0x08090184
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownUpAndLeft_Step0

	thumb_func_start MovementType_FaceDownUpAndLeft_Step1
MovementType_FaceDownUpAndLeft_Step1: @ 0x08090198
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownUpAndLeft_Step1

	thumb_func_start MovementType_FaceDownUpAndLeft_Step2
MovementType_FaceDownUpAndLeft_Step2: @ 0x080901C4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080901FA
	ldr r4, _08090204
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_080901FA:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08090204: .4byte 0x084E5B40
	thumb_func_end MovementType_FaceDownUpAndLeft_Step2

	thumb_func_start MovementType_FaceDownUpAndLeft_Step3
MovementType_FaceDownUpAndLeft_Step3: @ 0x08090208
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08090226
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809022E
_08090226:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _08090230
_0809022E:
	movs r0, #0
_08090230:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownUpAndLeft_Step3

	thumb_func_start MovementType_FaceDownUpAndLeft_Step4
MovementType_FaceDownUpAndLeft_Step4: @ 0x08090238
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0809027C
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r0, r4, #0
	movs r1, #7
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08090268
	bl Random
	movs r1, #3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_08090268:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809027C: .4byte 0x084E5CA4
	thumb_func_end MovementType_FaceDownUpAndLeft_Step4

	thumb_func_start MovementType_FaceDownUpAndRight
MovementType_FaceDownUpAndRight: @ 0x08090280
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0809029C
	adds r0, r0, r2
	ldr r2, _080902A0
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0809029C: .4byte 0x02036FF0
_080902A0: .4byte 0x080902A5
	thumb_func_end MovementType_FaceDownUpAndRight

	thumb_func_start MovementType_Hidden_Callback
MovementType_Hidden_Callback: @ 0x080902A4
	push {r4, lr}
	ldr r3, _080902C0
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_Hidden_Callback

	thumb_func_start GetMoveDirectionFasterAnimNum
GetMoveDirectionFasterAnimNum: @ 0x080902B8
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080902C0: .4byte 0x084E5CA8
	thumb_func_end GetMoveDirectionFasterAnimNum

	thumb_func_start MovementType_FaceDownUpAndRight_Step0
MovementType_FaceDownUpAndRight_Step0: @ 0x080902C4
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownUpAndRight_Step0

	thumb_func_start MovementType_FaceDownUpAndRight_Step1
MovementType_FaceDownUpAndRight_Step1: @ 0x080902D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownUpAndRight_Step1

	thumb_func_start MovementType_FaceDownUpAndRight_Step2
MovementType_FaceDownUpAndRight_Step2: @ 0x08090304
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809033A
	ldr r4, _08090344
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_0809033A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08090344: .4byte 0x084E5B40
	thumb_func_end MovementType_FaceDownUpAndRight_Step2

	thumb_func_start MovementType_FaceDownUpAndRight_Step3
MovementType_FaceDownUpAndRight_Step3: @ 0x08090348
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08090366
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809036E
_08090366:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _08090370
_0809036E:
	movs r0, #0
_08090370:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownUpAndRight_Step3

	thumb_func_start MovementType_FaceDownUpAndRight_Step4
MovementType_FaceDownUpAndRight_Step4: @ 0x08090378
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080903BC
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r0, r4, #0
	movs r1, #8
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080903A8
	bl Random
	movs r1, #3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_080903A8:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080903BC: .4byte 0x084E5CBC
	thumb_func_end MovementType_FaceDownUpAndRight_Step4

	thumb_func_start MovementType_FaceUpRightAndLeft
MovementType_FaceUpRightAndLeft: @ 0x080903C0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080903DC
	adds r0, r0, r2
	ldr r2, _080903E0
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080903DC: .4byte 0x02036FF0
_080903E0: .4byte 0x080903E5
	thumb_func_end MovementType_FaceUpRightAndLeft

	thumb_func_start MovementType_Invisible_callback
MovementType_Invisible_callback: @ 0x080903E4
	push {r4, lr}
	ldr r3, _08090400
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_Invisible_callback

	thumb_func_start GetMoveDirectionFastestAnimNum
GetMoveDirectionFastestAnimNum: @ 0x080903F8
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090400: .4byte 0x084E5CC0
	thumb_func_end GetMoveDirectionFastestAnimNum

	thumb_func_start MovementType_FaceUpLeftAndRight_Step0
MovementType_FaceUpLeftAndRight_Step0: @ 0x08090404
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpLeftAndRight_Step0

	thumb_func_start MovementType_FaceUpLeftAndRight_Step1
MovementType_FaceUpLeftAndRight_Step1: @ 0x08090418
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpLeftAndRight_Step1

	thumb_func_start MovementType_FaceUpLeftAndRight_Step2
MovementType_FaceUpLeftAndRight_Step2: @ 0x08090444
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809047A
	ldr r4, _08090484
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_0809047A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08090484: .4byte 0x084E5B40
	thumb_func_end MovementType_FaceUpLeftAndRight_Step2

	thumb_func_start MovementType_FaceUpLeftAndRight_Step3
MovementType_FaceUpLeftAndRight_Step3: @ 0x08090488
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080904A6
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080904AE
_080904A6:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _080904B0
_080904AE:
	movs r0, #0
_080904B0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceUpLeftAndRight_Step3

	thumb_func_start MovementType_FaceUpLeftAndRight_Step4
MovementType_FaceUpLeftAndRight_Step4: @ 0x080904B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080904FC
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r0, r4, #0
	movs r1, #9
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080904E8
	bl Random
	movs r1, #3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_080904E8:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080904FC: .4byte 0x084E5CD4
	thumb_func_end MovementType_FaceUpLeftAndRight_Step4

	thumb_func_start MovementType_FaceDownRightAndLeft
MovementType_FaceDownRightAndLeft: @ 0x08090500
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0809051C
	adds r0, r0, r2
	ldr r2, _08090520
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0809051C: .4byte 0x02036FF0
_08090520: .4byte 0x08090525
	thumb_func_end MovementType_FaceDownRightAndLeft

	thumb_func_start MovementType_JogInPlace_callback
MovementType_JogInPlace_callback: @ 0x08090524
	push {r4, lr}
	ldr r3, _08090540
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_JogInPlace_callback

	thumb_func_start GetRunningDirectionAnimNum
GetRunningDirectionAnimNum: @ 0x08090538
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090540: .4byte 0x084E5CD8
	thumb_func_end GetRunningDirectionAnimNum

	thumb_func_start MovementType_FaceDownLeftAndRight_Step0
MovementType_FaceDownLeftAndRight_Step0: @ 0x08090544
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownLeftAndRight_Step0

	thumb_func_start MovementType_FaceDownLeftAndRight_Step1
MovementType_FaceDownLeftAndRight_Step1: @ 0x08090558
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownLeftAndRight_Step1

	thumb_func_start MovementType_FaceDownLeftAndRight_Step2
MovementType_FaceDownLeftAndRight_Step2: @ 0x08090584
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080905BA
	ldr r4, _080905C4
	bl Random
	movs r5, #3
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r7, #0
	bl SetMovementDelay
	ldrb r1, [r6]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, #0x30]
_080905BA:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080905C4: .4byte 0x084E5B40
	thumb_func_end MovementType_FaceDownLeftAndRight_Step2

	thumb_func_start MovementType_FaceDownLeftAndRight_Step3
MovementType_FaceDownLeftAndRight_Step3: @ 0x080905C8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080905E6
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080905EE
_080905E6:
	movs r0, #4
	strh r0, [r5, #0x30]
	movs r0, #1
	b _080905F0
_080905EE:
	movs r0, #0
_080905F0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_FaceDownLeftAndRight_Step3

	thumb_func_start MovementType_FaceDownLeftAndRight_Step4
MovementType_FaceDownLeftAndRight_Step4: @ 0x080905F8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0809063C
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r0, r4, #0
	movs r1, #0xa
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08090628
	bl Random
	movs r1, #3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_08090628:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809063C: .4byte 0x084E5CEC
	thumb_func_end MovementType_FaceDownLeftAndRight_Step4

	thumb_func_start MovementType_RotateCounterclockwise
MovementType_RotateCounterclockwise: @ 0x08090640
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0809065C
	adds r0, r0, r2
	ldr r2, _08090660
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0809065C: .4byte 0x02036FF0
_08090660: .4byte 0x08090665
	thumb_func_end MovementType_RotateCounterclockwise

	thumb_func_start MovementType_LookAround_callback
MovementType_LookAround_callback: @ 0x08090664
	push {r4, lr}
	ldr r3, _08090680
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_LookAround_callback

	thumb_func_start GetTrainerFacingDirectionMovementType
GetTrainerFacingDirectionMovementType: @ 0x08090678
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090680: .4byte 0x084E5CF0
	thumb_func_end GetTrainerFacingDirectionMovementType

	thumb_func_start MovementType_RotateCounterclockwise_Step0
MovementType_RotateCounterclockwise_Step0: @ 0x08090684
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_RotateCounterclockwise_Step0

	thumb_func_start MovementType_RotateCounterclockwise_Step1
MovementType_RotateCounterclockwise_Step1: @ 0x080906B0
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080906CA
	adds r0, r4, #0
	movs r1, #0x30
	bl SetMovementDelay
	movs r0, #2
	strh r0, [r4, #0x30]
_080906CA:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_RotateCounterclockwise_Step1

	thumb_func_start MovementType_RotateCounterclockwise_Step2
MovementType_RotateCounterclockwise_Step2: @ 0x080906D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080906F2
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080906F6
_080906F2:
	movs r0, #3
	strh r0, [r5, #0x30]
_080906F6:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_RotateCounterclockwise_Step2

	thumb_func_start MovementType_RotateCounterclockwise_Step3
MovementType_RotateCounterclockwise_Step3: @ 0x08090700
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090740
	mov r0, sp
	movs r2, #5
	bl memcpy
	adds r0, r4, #0
	movs r1, #0
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0809072C
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	add r0, sp
	ldrb r1, [r0]
_0809072C:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #0
	strh r0, [r5, #0x30]
	movs r0, #1
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090740: .4byte 0x084E5D00
	thumb_func_end MovementType_RotateCounterclockwise_Step3

	thumb_func_start MovementType_RotateClockwise
MovementType_RotateClockwise: @ 0x08090744
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090760
	adds r0, r0, r2
	ldr r2, _08090764
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090760: .4byte 0x02036FF0
_08090764: .4byte 0x08090769
	thumb_func_end MovementType_RotateClockwise

	thumb_func_start MovementType_RotateClockwise_callback
MovementType_RotateClockwise_callback: @ 0x08090768
	push {r4, lr}
	ldr r3, _08090784
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_RotateClockwise_callback

	thumb_func_start GroundEffect_Ripple
GroundEffect_Ripple: @ 0x0809077C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090784: .4byte 0x084E5D08
	thumb_func_end GroundEffect_Ripple

	thumb_func_start MovementType_RotateClockwise_Step0
MovementType_RotateClockwise_Step0: @ 0x08090788
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_RotateClockwise_Step0

	thumb_func_start MovementType_RotateClockwise_Step1
MovementType_RotateClockwise_Step1: @ 0x080907B4
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080907CE
	adds r0, r4, #0
	movs r1, #0x30
	bl SetMovementDelay
	movs r0, #2
	strh r0, [r4, #0x30]
_080907CE:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_RotateClockwise_Step1

	thumb_func_start MovementType_RotateClockwise_Step2
MovementType_RotateClockwise_Step2: @ 0x080907D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080907F6
	adds r0, r4, #0
	bl EventObjectIsTrainerAndCloseToPlayer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080907FA
_080907F6:
	movs r0, #3
	strh r0, [r5, #0x30]
_080907FA:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_RotateClockwise_Step2

	thumb_func_start MovementType_RotateClockwise_Step3
MovementType_RotateClockwise_Step3: @ 0x08090804
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090844
	mov r0, sp
	movs r2, #5
	bl memcpy
	adds r0, r4, #0
	movs r1, #0
	bl TryGetTrainerEncounterDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08090830
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	add r0, sp
	ldrb r1, [r0]
_08090830:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #0
	strh r0, [r5, #0x30]
	movs r0, #1
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090844: .4byte 0x084E5D18
	thumb_func_end MovementType_RotateClockwise_Step3

	thumb_func_start MovementType_WalkBackAndForth
MovementType_WalkBackAndForth: @ 0x08090848
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090864
	adds r0, r0, r2
	ldr r2, _08090868
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090864: .4byte 0x02036FF0
_08090868: .4byte 0x0809086D
	thumb_func_end MovementType_WalkBackAndForth

	thumb_func_start MovementType_RotateCounterclockwise_callback
MovementType_RotateCounterclockwise_callback: @ 0x0809086C
	push {r4, lr}
	ldr r3, _08090888
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_RotateCounterclockwise_callback

	thumb_func_start Unref_GetAnimNums_08375633
Unref_GetAnimNums_08375633: @ 0x08090880
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090888: .4byte 0x084E5D20
	thumb_func_end Unref_GetAnimNums_08375633

	thumb_func_start MovementType_WalkBackAndForth_Step0
MovementType_WalkBackAndForth_Step0: @ 0x0809088C
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WalkBackAndForth_Step0

	thumb_func_start MovementType_WalkBackAndForth_Step1
MovementType_WalkBackAndForth_Step1: @ 0x080908A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080908D4
	ldrb r1, [r4, #6]
	adds r1, r1, r0
	ldrb r1, [r1]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _080908C2
	adds r0, r1, #0
	bl GetOppositeDirection
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080908C2:
	adds r0, r4, #0
	bl SetEventObjectDirection
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080908D4: .4byte 0x084DDA21
	thumb_func_end MovementType_WalkBackAndForth_Step1

	thumb_func_start MovementType_WalkBackAndForth_Step2
MovementType_WalkBackAndForth_Step2: @ 0x080908D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #0
	beq _08090908
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bne _08090908
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl GetOppositeDirection
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetEventObjectDirection
_08090908:
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl GetCollisionInDirection
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092CF8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r5, #1
	bne _0809095E
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl GetOppositeDirection
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetEventObjectDirection
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092CF8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl GetCollisionInDirection
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0809095E:
	cmp r5, #0
	beq _08090970
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092F08
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08090970:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl EventObjectSetSingleMovement
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #3
	strh r0, [r7, #0x30]
	movs r0, #1
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WalkBackAndForth_Step2

	thumb_func_start MovementType_WalkBackAndForth_Step3
MovementType_WalkBackAndForth_Step3: @ 0x08090990
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080909AE
	ldrb r0, [r4]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	strh r0, [r5, #0x30]
_080909AE:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WalkBackAndForth_Step3

	thumb_func_start MovementType_WalkSequence_Step0
MovementType_WalkSequence_Step0: @ 0x080909B8
	push {r4, lr}
	adds r4, r1, #0
	bl ClearEventObjectMovement
	movs r0, #1
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WalkSequence_Step0

	thumb_func_start MoveNextDirectionInSequence
MoveNextDirectionInSequence: @ 0x080909CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #3
	bne _080909EE
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bne _080909EE
	movs r0, #0
	strb r0, [r2]
_080909EE:
	adds r5, r4, #0
	adds r5, #0x21
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl SetEventObjectDirection
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092CF8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl GetCollisionInDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08090A48
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl SetEventObjectDirection
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl sub_08092CF8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r1, [r4, #0x18]
	lsrs r1, r1, #4
	adds r0, r4, #0
	bl GetCollisionInDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08090A48:
	cmp r0, #0
	beq _08090A5A
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092F08
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08090A5A:
	adds r0, r4, #0
	mov r1, r8
	adds r2, r6, #0
	bl EventObjectSetSingleMovement
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	mov r1, r8
	strh r0, [r1, #0x30]
	movs r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MoveNextDirectionInSequence

	thumb_func_start MovementType_WalkSequence_Step2
MovementType_WalkSequence_Step2: @ 0x08090A80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090A9E
	ldrb r0, [r4]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	strh r0, [r5, #0x30]
_08090A9E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_WalkSequence_Step2

	thumb_func_start MovementType_WalkSequenceUpRightLeftDown
MovementType_WalkSequenceUpRightLeftDown: @ 0x08090AA8
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090AC4
	adds r0, r0, r2
	ldr r2, _08090AC8
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090AC4: .4byte 0x02036FF0
_08090AC8: .4byte 0x08090ACD
	thumb_func_end MovementType_WalkSequenceUpRightLeftDown

	thumb_func_start EventObjectCB2_BerryTree
EventObjectCB2_BerryTree: @ 0x08090ACC
	push {r4, lr}
	ldr r3, _08090AE8
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end EventObjectCB2_BerryTree

	thumb_func_start ZCoordToPriority
ZCoordToPriority: @ 0x08090AE0
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090AE8: .4byte 0x084E5D30
	thumb_func_end ZCoordToPriority

	thumb_func_start MovementType_WalkSequenceUpRightLeftDown_Step1
MovementType_WalkSequenceUpRightLeftDown_Step1: @ 0x08090AEC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090B30
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08090B18
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090B18
	movs r0, #3
	strb r0, [r2]
_08090B18:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090B30: .4byte 0x084E5D3C
	thumb_func_end MovementType_WalkSequenceUpRightLeftDown_Step1

	thumb_func_start MovementType_WalkSequenceRightLeftDownUp
MovementType_WalkSequenceRightLeftDownUp: @ 0x08090B34
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090B50
	adds r0, r0, r2
	ldr r2, _08090B54
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090B50: .4byte 0x02036FF0
_08090B54: .4byte 0x08090B59
	thumb_func_end MovementType_WalkSequenceRightLeftDownUp

	thumb_func_start MovementType_RunInPlace_callback
MovementType_RunInPlace_callback: @ 0x08090B58
	push {r4, lr}
	ldr r3, _08090B74
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_RunInPlace_callback

	thumb_func_start sub_08090B6C
sub_08090B6C: @ 0x08090B6C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090B74: .4byte 0x084E5D40
	thumb_func_end sub_08090B6C

	thumb_func_start MovementType_WalkSequenceRightLeftDownUp_Step1
MovementType_WalkSequenceRightLeftDownUp_Step1: @ 0x08090B78
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090BBC
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #1
	bne _08090BA4
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090BA4
	movs r0, #2
	strb r0, [r2]
_08090BA4:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090BBC: .4byte 0x084E5D4C
	thumb_func_end MovementType_WalkSequenceRightLeftDownUp_Step1

	thumb_func_start MovementType_WalkSequenceDownUpRightLeft
MovementType_WalkSequenceDownUpRightLeft: @ 0x08090BC0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090BDC
	adds r0, r0, r2
	ldr r2, _08090BE0
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090BDC: .4byte 0x02036FF0
_08090BE0: .4byte 0x08090BE5
	thumb_func_end MovementType_WalkSequenceDownUpRightLeft

	thumb_func_start MovementType_WalkBackAndForth_callback
MovementType_WalkBackAndForth_callback: @ 0x08090BE4
	push {r4, lr}
	ldr r3, _08090C00
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkBackAndForth_callback

	thumb_func_start sub_08090BF8
sub_08090BF8: @ 0x08090BF8
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090C00: .4byte 0x084E5D50
	thumb_func_end sub_08090BF8

	thumb_func_start MovementType_WalkSequenceDownUpRightLeft_Step1
MovementType_WalkSequenceDownUpRightLeft_Step1: @ 0x08090C04
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090C48
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #1
	bne _08090C30
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090C30
	movs r0, #2
	strb r0, [r2]
_08090C30:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090C48: .4byte 0x084E5D5C
	thumb_func_end MovementType_WalkSequenceDownUpRightLeft_Step1

	thumb_func_start MovementType_WalkSequenceLeftDownUpRight
MovementType_WalkSequenceLeftDownUpRight: @ 0x08090C4C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090C68
	adds r0, r0, r2
	ldr r2, _08090C6C
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090C68: .4byte 0x02036FF0
_08090C6C: .4byte 0x08090C71
	thumb_func_end MovementType_WalkSequenceLeftDownUpRight

	thumb_func_start MovementType_WalkInPlace_callback
MovementType_WalkInPlace_callback: @ 0x08090C70
	push {r4, lr}
	ldr r3, _08090C8C
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkInPlace_callback

	thumb_func_start sub_08090C84
sub_08090C84: @ 0x08090C84
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090C8C: .4byte 0x084E5D60
	thumb_func_end sub_08090C84

	thumb_func_start MovementType_WalkSequenceLeftDownUpRight_Step1
MovementType_WalkSequenceLeftDownUpRight_Step1: @ 0x08090C90
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090CD4
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08090CBC
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090CBC
	movs r0, #3
	strb r0, [r2]
_08090CBC:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090CD4: .4byte 0x084E5D6C
	thumb_func_end MovementType_WalkSequenceLeftDownUpRight_Step1

	thumb_func_start MovementType_WalkSequenceUpLeftRightDown
MovementType_WalkSequenceUpLeftRightDown: @ 0x08090CD8
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090CF4
	adds r0, r0, r2
	ldr r2, _08090CF8
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090CF4: .4byte 0x02036FF0
_08090CF8: .4byte 0x08090CFD
	thumb_func_end MovementType_WalkSequenceUpLeftRightDown

	thumb_func_start MovementType_WalkSequenceDownLeftRightUp_callback
MovementType_WalkSequenceDownLeftRightUp_callback: @ 0x08090CFC
	push {r4, lr}
	ldr r3, _08090D18
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceDownLeftRightUp_callback

	thumb_func_start sub_08090D10
sub_08090D10: @ 0x08090D10
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090D18: .4byte 0x084E5D70
	thumb_func_end sub_08090D10

	thumb_func_start MovementType_WalkSequenceUpLeftRightDown_Step1
MovementType_WalkSequenceUpLeftRightDown_Step1: @ 0x08090D1C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090D60
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08090D48
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090D48
	movs r0, #3
	strb r0, [r2]
_08090D48:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090D60: .4byte 0x084E5D7C
	thumb_func_end MovementType_WalkSequenceUpLeftRightDown_Step1

	thumb_func_start MovementType_WalkSequenceLeftRightDownUp
MovementType_WalkSequenceLeftRightDownUp: @ 0x08090D64
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090D80
	adds r0, r0, r2
	ldr r2, _08090D84
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090D80: .4byte 0x02036FF0
_08090D84: .4byte 0x08090D89
	thumb_func_end MovementType_WalkSequenceLeftRightDownUp

	thumb_func_start MovementType_WalkSequenceDownLeftUpRight_callback
MovementType_WalkSequenceDownLeftUpRight_callback: @ 0x08090D88
	push {r4, lr}
	ldr r3, _08090DA4
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceDownLeftUpRight_callback

	thumb_func_start sub_08090D9C
sub_08090D9C: @ 0x08090D9C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090DA4: .4byte 0x084E5D80
	thumb_func_end sub_08090D9C

	thumb_func_start MovementType_WalkSequenceLeftRightDownUp_Step1
MovementType_WalkSequenceLeftRightDownUp_Step1: @ 0x08090DA8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090DEC
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #1
	bne _08090DD4
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090DD4
	movs r0, #2
	strb r0, [r2]
_08090DD4:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090DEC: .4byte 0x084E5D8C
	thumb_func_end MovementType_WalkSequenceLeftRightDownUp_Step1

	thumb_func_start MovementType_WalkSequenceDownUpLeftRight
MovementType_WalkSequenceDownUpLeftRight: @ 0x08090DF0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090E0C
	adds r0, r0, r2
	ldr r2, _08090E10
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090E0C: .4byte 0x02036FF0
_08090E10: .4byte 0x08090E15
	thumb_func_end MovementType_WalkSequenceDownUpLeftRight

	thumb_func_start MovementType_WalkSequenceDownRightLeftUp_callback
MovementType_WalkSequenceDownRightLeftUp_callback: @ 0x08090E14
	push {r4, lr}
	ldr r3, _08090E30
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceDownRightLeftUp_callback

	thumb_func_start sub_08090E28
sub_08090E28: @ 0x08090E28
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090E30: .4byte 0x084E5D90
	thumb_func_end sub_08090E28

	thumb_func_start MovementType_WalkSequenceDownUpLeftRight_Step1
MovementType_WalkSequenceDownUpLeftRight_Step1: @ 0x08090E34
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090E78
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #1
	bne _08090E60
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090E60
	movs r0, #2
	strb r0, [r2]
_08090E60:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090E78: .4byte 0x084E5B64
	thumb_func_end MovementType_WalkSequenceDownUpLeftRight_Step1

	thumb_func_start MovementType_WalkSequenceRightDownUpLeft
MovementType_WalkSequenceRightDownUpLeft: @ 0x08090E7C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090E98
	adds r0, r0, r2
	ldr r2, _08090E9C
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090E98: .4byte 0x02036FF0
_08090E9C: .4byte 0x08090EA1
	thumb_func_end MovementType_WalkSequenceRightDownUpLeft

	thumb_func_start MovementType_WalkSequenceDownRightUpLeft_callback
MovementType_WalkSequenceDownRightUpLeft_callback: @ 0x08090EA0
	push {r4, lr}
	ldr r3, _08090EBC
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceDownRightUpLeft_callback

	thumb_func_start sub_08090EB4
sub_08090EB4: @ 0x08090EB4
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090EBC: .4byte 0x084E5D9C
	thumb_func_end sub_08090EB4

	thumb_func_start MovementType_WalkSequenceRightDownUpLeft_Step1
MovementType_WalkSequenceRightDownUpLeft_Step1: @ 0x08090EC0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090F04
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08090EEC
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090EEC
	movs r0, #3
	strb r0, [r2]
_08090EEC:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090F04: .4byte 0x084E5DA8
	thumb_func_end MovementType_WalkSequenceRightDownUpLeft_Step1

	thumb_func_start MovementType_WalkSequenceLeftUpDownRight
MovementType_WalkSequenceLeftUpDownRight: @ 0x08090F08
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090F24
	adds r0, r0, r2
	ldr r2, _08090F28
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090F24: .4byte 0x02036FF0
_08090F28: .4byte 0x08090F2D
	thumb_func_end MovementType_WalkSequenceLeftUpDownRight

	thumb_func_start MovementType_WalkSequenceDownUpLeftRight_callback
MovementType_WalkSequenceDownUpLeftRight_callback: @ 0x08090F2C
	push {r4, lr}
	ldr r3, _08090F48
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceDownUpLeftRight_callback

	thumb_func_start MovementType_WalkSequenceDownUpRightLeft_callback
MovementType_WalkSequenceDownUpRightLeft_callback: @ 0x08090F40
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090F48: .4byte 0x084E5DAC
	thumb_func_end MovementType_WalkSequenceDownUpRightLeft_callback

	thumb_func_start MovementType_WalkSequenceLeftUpDownRight_Step1
MovementType_WalkSequenceLeftUpDownRight_Step1: @ 0x08090F4C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08090F90
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08090F78
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08090F78
	movs r0, #3
	strb r0, [r2]
_08090F78:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08090F90: .4byte 0x084E5DB8
	thumb_func_end MovementType_WalkSequenceLeftUpDownRight_Step1

	thumb_func_start MovementType_WalkSequenceUpDownRightLeft
MovementType_WalkSequenceUpDownRightLeft: @ 0x08090F94
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08090FB0
	adds r0, r0, r2
	ldr r2, _08090FB4
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08090FB0: .4byte 0x02036FF0
_08090FB4: .4byte 0x08090FB9
	thumb_func_end MovementType_WalkSequenceUpDownRightLeft

	thumb_func_start MovementType_WalkSequenceLeftDownRightUp_callback
MovementType_WalkSequenceLeftDownRightUp_callback: @ 0x08090FB8
	push {r4, lr}
	ldr r3, _08090FD4
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceLeftDownRightUp_callback

	thumb_func_start MovementType_WalkSequenceLeftDownUpRight_callback
MovementType_WalkSequenceLeftDownUpRight_callback: @ 0x08090FCC
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090FD4: .4byte 0x084E5DBC
	thumb_func_end MovementType_WalkSequenceLeftDownUpRight_callback

	thumb_func_start MovementType_WalkSequenceUpDownRightLeft_Step1
MovementType_WalkSequenceUpDownRightLeft_Step1: @ 0x08090FD8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0809101C
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #1
	bne _08091004
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08091004
	movs r0, #2
	strb r0, [r2]
_08091004:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809101C: .4byte 0x084E5DC8
	thumb_func_end MovementType_WalkSequenceUpDownRightLeft_Step1

	thumb_func_start MovementType_WalkSequenceRightLeftUpDown
MovementType_WalkSequenceRightLeftUpDown: @ 0x08091020
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0809103C
	adds r0, r0, r2
	ldr r2, _08091040
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0809103C: .4byte 0x02036FF0
_08091040: .4byte 0x08091045
	thumb_func_end MovementType_WalkSequenceRightLeftUpDown

	thumb_func_start MovementType_WalkSequenceLeftRightDownUp_callback
MovementType_WalkSequenceLeftRightDownUp_callback: @ 0x08091044
	push {r4, lr}
	ldr r3, _08091060
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceLeftRightDownUp_callback

	thumb_func_start MovementType_WalkSequenceLeftRightUpDown_callback
MovementType_WalkSequenceLeftRightUpDown_callback: @ 0x08091058
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091060: .4byte 0x084E5DCC
	thumb_func_end MovementType_WalkSequenceLeftRightUpDown_callback

	thumb_func_start MovementType_WalkSequenceRightLeftUpDown_Step1
MovementType_WalkSequenceRightLeftUpDown_Step1: @ 0x08091064
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080910A8
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #1
	bne _08091090
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08091090
	movs r0, #2
	strb r0, [r2]
_08091090:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080910A8: .4byte 0x084E5DD8
	thumb_func_end MovementType_WalkSequenceRightLeftUpDown_Step1

	thumb_func_start MovementType_WalkSequenceDownRightLeftUp
MovementType_WalkSequenceDownRightLeftUp: @ 0x080910AC
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080910C8
	adds r0, r0, r2
	ldr r2, _080910CC
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080910C8: .4byte 0x02036FF0
_080910CC: .4byte 0x080910D1
	thumb_func_end MovementType_WalkSequenceDownRightLeftUp

	thumb_func_start MovementType_WalkSequenceLeftUpDownRight_callback
MovementType_WalkSequenceLeftUpDownRight_callback: @ 0x080910D0
	push {r4, lr}
	ldr r3, _080910EC
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceLeftUpDownRight_callback

	thumb_func_start MovementType_WalkSequenceLeftUpRightDown_callback
MovementType_WalkSequenceLeftUpRightDown_callback: @ 0x080910E4
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080910EC: .4byte 0x084E5DDC
	thumb_func_end MovementType_WalkSequenceLeftUpRightDown_callback

	thumb_func_start MovementType_WalkSequenceDownRightLeftUp_Step1
MovementType_WalkSequenceDownRightLeftUp_Step1: @ 0x080910F0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08091134
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _0809111C
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0809111C
	movs r0, #3
	strb r0, [r2]
_0809111C:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08091134: .4byte 0x084E5DE8
	thumb_func_end MovementType_WalkSequenceDownRightLeftUp_Step1

	thumb_func_start MovementType_WalkSequenceRightUpDownLeft
MovementType_WalkSequenceRightUpDownLeft: @ 0x08091138
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08091154
	adds r0, r0, r2
	ldr r2, _08091158
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08091154: .4byte 0x02036FF0
_08091158: .4byte 0x0809115D
	thumb_func_end MovementType_WalkSequenceRightUpDownLeft

	thumb_func_start MovementType_WalkSequenceRightDownLeftUp_callback
MovementType_WalkSequenceRightDownLeftUp_callback: @ 0x0809115C
	push {r4, lr}
	ldr r3, _08091178
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceRightDownLeftUp_callback

	thumb_func_start MovementType_WalkSequenceRightDownUpLeft_callback
MovementType_WalkSequenceRightDownUpLeft_callback: @ 0x08091170
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091178: .4byte 0x084E5DEC
	thumb_func_end MovementType_WalkSequenceRightDownUpLeft_callback

	thumb_func_start MovementType_WalkSequenceRightUpDownLeft_Step1
MovementType_WalkSequenceRightUpDownLeft_Step1: @ 0x0809117C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080911C0
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _080911A8
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080911A8
	movs r0, #3
	strb r0, [r2]
_080911A8:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080911C0: .4byte 0x084E5DF8
	thumb_func_end MovementType_WalkSequenceRightUpDownLeft_Step1

	thumb_func_start MovementType_WalkSequenceUpDownLeftRight
MovementType_WalkSequenceUpDownLeftRight: @ 0x080911C4
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080911E0
	adds r0, r0, r2
	ldr r2, _080911E4
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080911E0: .4byte 0x02036FF0
_080911E4: .4byte 0x080911E9
	thumb_func_end MovementType_WalkSequenceUpDownLeftRight

	thumb_func_start MovementType_WalkSequenceRightLeftDownUp_callback
MovementType_WalkSequenceRightLeftDownUp_callback: @ 0x080911E8
	push {r4, lr}
	ldr r3, _08091204
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceRightLeftDownUp_callback

	thumb_func_start MovementType_WalkSequenceRightLeftUpDown_callback
MovementType_WalkSequenceRightLeftUpDown_callback: @ 0x080911FC
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091204: .4byte 0x084E5DFC
	thumb_func_end MovementType_WalkSequenceRightLeftUpDown_callback

	thumb_func_start MovementType_WalkSequenceUpDownLeftRight_Step1
MovementType_WalkSequenceUpDownLeftRight_Step1: @ 0x08091208
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0809124C
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #1
	bne _08091234
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08091234
	movs r0, #2
	strb r0, [r2]
_08091234:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809124C: .4byte 0x084E5E08
	thumb_func_end MovementType_WalkSequenceUpDownLeftRight_Step1

	thumb_func_start MovementType_WalkSequenceLeftRightUpDown
MovementType_WalkSequenceLeftRightUpDown: @ 0x08091250
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0809126C
	adds r0, r0, r2
	ldr r2, _08091270
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0809126C: .4byte 0x02036FF0
_08091270: .4byte 0x08091275
	thumb_func_end MovementType_WalkSequenceLeftRightUpDown

	thumb_func_start MovementType_WalkSequenceRightUpDownLeft_callback
MovementType_WalkSequenceRightUpDownLeft_callback: @ 0x08091274
	push {r4, lr}
	ldr r3, _08091290
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceRightUpDownLeft_callback

	thumb_func_start MovementType_WalkSequenceRightUpLeftDown_callback
MovementType_WalkSequenceRightUpLeftDown_callback: @ 0x08091288
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091290: .4byte 0x084E5E0C
	thumb_func_end MovementType_WalkSequenceRightUpLeftDown_callback

	thumb_func_start MovementType_WalkSequenceLeftRightUpDown_Step1
MovementType_WalkSequenceLeftRightUpDown_Step1: @ 0x08091294
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080912D8
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #1
	bne _080912C0
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080912C0
	movs r0, #2
	strb r0, [r2]
_080912C0:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080912D8: .4byte 0x084E5E18
	thumb_func_end MovementType_WalkSequenceLeftRightUpDown_Step1

	thumb_func_start MovementType_WalkSequenceDownLeftRightUp
MovementType_WalkSequenceDownLeftRightUp: @ 0x080912DC
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080912F8
	adds r0, r0, r2
	ldr r2, _080912FC
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080912F8: .4byte 0x02036FF0
_080912FC: .4byte 0x08091301
	thumb_func_end MovementType_WalkSequenceDownLeftRightUp

	thumb_func_start MovementType_WalkSequenceUpDownLeftRight_callback
MovementType_WalkSequenceUpDownLeftRight_callback: @ 0x08091300
	push {r4, lr}
	ldr r3, _0809131C
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceUpDownLeftRight_callback

	thumb_func_start MovementType_WalkSequenceUpDownRightLeft_callback
MovementType_WalkSequenceUpDownRightLeft_callback: @ 0x08091314
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809131C: .4byte 0x084E5E1C
	thumb_func_end MovementType_WalkSequenceUpDownRightLeft_callback

	thumb_func_start MovementType_WalkSequenceDownLeftRightUp_Step1
MovementType_WalkSequenceDownLeftRightUp_Step1: @ 0x08091320
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08091364
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _0809134C
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0809134C
	movs r0, #3
	strb r0, [r2]
_0809134C:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08091364: .4byte 0x084E5E28
	thumb_func_end MovementType_WalkSequenceDownLeftRightUp_Step1

	thumb_func_start MovementType_WalkSequenceUpLeftDownRight
MovementType_WalkSequenceUpLeftDownRight: @ 0x08091368
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08091384
	adds r0, r0, r2
	ldr r2, _08091388
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08091384: .4byte 0x02036FF0
_08091388: .4byte 0x0809138D
	thumb_func_end MovementType_WalkSequenceUpLeftDownRight

	thumb_func_start MovementType_WalkSequenceUpLeftDownRight_callback
MovementType_WalkSequenceUpLeftDownRight_callback: @ 0x0809138C
	push {r4, lr}
	ldr r3, _080913A8
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceUpLeftDownRight_callback

	thumb_func_start MovementType_WalkSequenceUpLeftRightDown_callback
MovementType_WalkSequenceUpLeftRightDown_callback: @ 0x080913A0
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080913A8: .4byte 0x084E5E2C
	thumb_func_end MovementType_WalkSequenceUpLeftRightDown_callback

	thumb_func_start MovementType_WalkSequenceUpLeftDownRight_Step1
MovementType_WalkSequenceUpLeftDownRight_Step1: @ 0x080913AC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080913F0
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _080913D8
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080913D8
	movs r0, #3
	strb r0, [r2]
_080913D8:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080913F0: .4byte 0x084E5E38
	thumb_func_end MovementType_WalkSequenceUpLeftDownRight_Step1

	thumb_func_start MovementType_WalkSequenceDownRightUpLeft
MovementType_WalkSequenceDownRightUpLeft: @ 0x080913F4
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08091410
	adds r0, r0, r2
	ldr r2, _08091414
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08091410: .4byte 0x02036FF0
_08091414: .4byte 0x08091419
	thumb_func_end MovementType_WalkSequenceDownRightUpLeft

	thumb_func_start MovementType_WalkSequenceUpRightDownLeft_callback
MovementType_WalkSequenceUpRightDownLeft_callback: @ 0x08091418
	push {r4, lr}
	ldr r3, _08091434
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSequenceUpRightDownLeft_callback

	thumb_func_start MovementType_WalkSequenceUpRightLeftDown_callback
MovementType_WalkSequenceUpRightLeftDown_callback: @ 0x0809142C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091434: .4byte 0x084E5E3C
	thumb_func_end MovementType_WalkSequenceUpRightLeftDown_callback

	thumb_func_start MovementType_WalkSequenceDownRightUpLeft_Step1
MovementType_WalkSequenceDownRightUpLeft_Step1: @ 0x08091438
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0809147C
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08091464
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08091464
	movs r0, #3
	strb r0, [r2]
_08091464:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809147C: .4byte 0x084E5E48
	thumb_func_end MovementType_WalkSequenceDownRightUpLeft_Step1

	thumb_func_start MovementType_WalkSequenceLeftDownRightUp
MovementType_WalkSequenceLeftDownRightUp: @ 0x08091480
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _0809149C
	adds r0, r0, r2
	ldr r2, _080914A0
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_0809149C: .4byte 0x02036FF0
_080914A0: .4byte 0x080914A5
	thumb_func_end MovementType_WalkSequenceLeftDownRightUp

	thumb_func_start MovementType_WalkSlowlyInPlace_callback
MovementType_WalkSlowlyInPlace_callback: @ 0x080914A4
	push {r4, lr}
	ldr r3, _080914C0
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WalkSlowlyInPlace_callback

	thumb_func_start MovementType_WanderAround_callback
MovementType_WanderAround_callback: @ 0x080914B8
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080914C0: .4byte 0x084E5E4C
	thumb_func_end MovementType_WanderAround_callback

	thumb_func_start MovementType_WalkSequenceLeftDownRightUp_Step1
MovementType_WalkSequenceLeftDownRightUp_Step1: @ 0x080914C4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08091508
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _080914F0
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080914F0
	movs r0, #3
	strb r0, [r2]
_080914F0:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08091508: .4byte 0x084E5E58
	thumb_func_end MovementType_WalkSequenceLeftDownRightUp_Step1

	thumb_func_start MovementType_WalkSequenceRightUpLeftDown
MovementType_WalkSequenceRightUpLeftDown: @ 0x0809150C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08091528
	adds r0, r0, r2
	ldr r2, _0809152C
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08091528: .4byte 0x02036FF0
_0809152C: .4byte 0x08091531
	thumb_func_end MovementType_WalkSequenceRightUpLeftDown

	thumb_func_start MovementType_WanderLeftAndRight_callback
MovementType_WanderLeftAndRight_callback: @ 0x08091530
	push {r4, lr}
	ldr r3, _0809154C
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementType_WanderLeftAndRight_callback

	thumb_func_start MovementType_WanderUpAndDown_callback
MovementType_WanderUpAndDown_callback: @ 0x08091544
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809154C: .4byte 0x084E5E5C
	thumb_func_end MovementType_WanderUpAndDown_callback

	thumb_func_start MovementType_WalkSequenceRightUpLeftDown_Step1
MovementType_WalkSequenceRightUpLeftDown_Step1: @ 0x08091550
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08091594
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _0809157C
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0809157C
	movs r0, #3
	strb r0, [r2]
_0809157C:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08091594: .4byte 0x084E5E68
	thumb_func_end MovementType_WalkSequenceRightUpLeftDown_Step1

	thumb_func_start MovementType_WalkSequenceUpRightDownLeft
MovementType_WalkSequenceUpRightDownLeft: @ 0x08091598
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080915B4
	adds r0, r0, r2
	ldr r2, _080915B8
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080915B4: .4byte 0x02036FF0
_080915B8: .4byte 0x080915BD
	thumb_func_end MovementType_WalkSequenceUpRightDownLeft

	thumb_func_start sub_080915BC
sub_080915BC: @ 0x080915BC
	push {r4, lr}
	ldr r3, _080915D8
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end sub_080915BC

	thumb_func_start MovementAction_Figure8_Step1
MovementAction_Figure8_Step1: @ 0x080915D0
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080915D8: .4byte 0x084E5E6C
	thumb_func_end MovementAction_Figure8_Step1

	thumb_func_start MovementType_WalkSequenceUpRightDownLeft_Step1
MovementType_WalkSequenceUpRightDownLeft_Step1: @ 0x080915DC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08091620
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08091608
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08091608
	movs r0, #3
	strb r0, [r2]
_08091608:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08091620: .4byte 0x084E5E78
	thumb_func_end MovementType_WalkSequenceUpRightDownLeft_Step1

	thumb_func_start MovementType_WalkSequenceDownLeftUpRight
MovementType_WalkSequenceDownLeftUpRight: @ 0x08091624
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08091640
	adds r0, r0, r2
	ldr r2, _08091644
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08091640: .4byte 0x02036FF0
_08091644: .4byte 0x08091649
	thumb_func_end MovementType_WalkSequenceDownLeftUpRight

	thumb_func_start sub_08091648
sub_08091648: @ 0x08091648
	push {r4, lr}
	ldr r3, _08091664
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end sub_08091648

	thumb_func_start MovementAction_WalkSlowDiagonalUpLeft_Step1
MovementAction_WalkSlowDiagonalUpLeft_Step1: @ 0x0809165C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091664: .4byte 0x084E5E7C
	thumb_func_end MovementAction_WalkSlowDiagonalUpLeft_Step1

	thumb_func_start MovementType_WalkSequenceDownLeftUpRight_Step1
MovementType_WalkSequenceDownLeftUpRight_Step1: @ 0x08091668
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080916AC
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08091694
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08091694
	movs r0, #3
	strb r0, [r2]
_08091694:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080916AC: .4byte 0x084E5E88
	thumb_func_end MovementType_WalkSequenceDownLeftUpRight_Step1

	thumb_func_start MovementType_WalkSequenceLeftUpRightDown
MovementType_WalkSequenceLeftUpRightDown: @ 0x080916B0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080916CC
	adds r0, r0, r2
	ldr r2, _080916D0
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080916CC: .4byte 0x02036FF0
_080916D0: .4byte 0x080916D5
	thumb_func_end MovementType_WalkSequenceLeftUpRightDown

	thumb_func_start GetGroundEffectFlags_TallGrassOnBeginStep
GetGroundEffectFlags_TallGrassOnBeginStep: @ 0x080916D4
	push {r4, lr}
	ldr r3, _080916F0
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end GetGroundEffectFlags_TallGrassOnBeginStep

	thumb_func_start MovementAction_AcroPopWheelieMoveDown_Step0
MovementAction_AcroPopWheelieMoveDown_Step0: @ 0x080916E8
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080916F0: .4byte 0x084E5E8C
	thumb_func_end MovementAction_AcroPopWheelieMoveDown_Step0

	thumb_func_start MovementType_WalkSequenceLeftUpRightDown_Step1
MovementType_WalkSequenceLeftUpRightDown_Step1: @ 0x080916F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08091738
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _08091720
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _08091720
	movs r0, #3
	strb r0, [r2]
_08091720:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08091738: .4byte 0x084E5E98
	thumb_func_end MovementType_WalkSequenceLeftUpRightDown_Step1

	thumb_func_start MovementType_WalkSequenceRightDownLeftUp
MovementType_WalkSequenceRightDownLeftUp: @ 0x0809173C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08091758
	adds r0, r0, r2
	ldr r2, _0809175C
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08091758: .4byte 0x02036FF0
_0809175C: .4byte 0x08091761
	thumb_func_end MovementType_WalkSequenceRightDownLeftUp

	thumb_func_start sub_08091760
sub_08091760: @ 0x08091760
	push {r4, lr}
	ldr r3, _0809177C
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end sub_08091760

	thumb_func_start MovementAction_AcroPopWheelieMoveLeft_Step0
MovementAction_AcroPopWheelieMoveLeft_Step0: @ 0x08091774
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809177C: .4byte 0x084E5E9C
	thumb_func_end MovementAction_AcroPopWheelieMoveLeft_Step0

	thumb_func_start MovementType_WalkSequenceRightDownLeftUp_Step1
MovementType_WalkSequenceRightDownLeftUp_Step1: @ 0x08091780
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080917C4
	mov r0, sp
	movs r2, #4
	bl memcpy
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #2
	bne _080917AC
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080917AC
	movs r0, #3
	strb r0, [r2]
_080917AC:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl MoveNextDirectionInSequence
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080917C4: .4byte 0x084E5EA8
	thumb_func_end MovementType_WalkSequenceRightDownLeftUp_Step1

	thumb_func_start MovementType_CopyPlayer
MovementType_CopyPlayer: @ 0x080917C8
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080917E4
	adds r0, r0, r2
	ldr r2, _080917E8
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080917E4: .4byte 0x02036FF0
_080917E8: .4byte 0x080917ED
	thumb_func_end MovementType_CopyPlayer

	thumb_func_start MovementAction_AcroPopWheelieMoveRight_Step0
MovementAction_AcroPopWheelieMoveRight_Step0: @ 0x080917EC
	push {r4, lr}
	ldr r3, _08091808
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end MovementAction_AcroPopWheelieMoveRight_Step0

	thumb_func_start MovementAction_AcroPopWheelieMoveUp_Step0
MovementAction_AcroPopWheelieMoveUp_Step0: @ 0x08091800
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091808: .4byte 0x084E5EAC
	thumb_func_end MovementAction_AcroPopWheelieMoveUp_Step0

	thumb_func_start MovementType_CopyPlayer_Step0
MovementType_CopyPlayer_Step0: @ 0x0809180C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	adds r4, #0x21
	ldrb r0, [r4]
	cmp r0, #0
	bne _08091824
	bl GetPlayerFacingDirection
	strb r0, [r4]
_08091824:
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_CopyPlayer_Step0

	thumb_func_start MovementType_CopyPlayer_Step1
MovementType_CopyPlayer_Step1: @ 0x08091830
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r2, _08091854
	ldr r3, _08091858
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1c]
	cmp r0, #0xff
	beq _08091850
	ldrb r0, [r3, #3]
	cmp r0, #2
	bne _0809185C
_08091850:
	movs r0, #0
	b _08091884
	.align 2, 0
_08091854: .4byte 0x02036FF0
_08091858: .4byte 0x02037230
_0809185C:
	ldr r5, _0809188C
	bl PlayerGetCopyableMovement
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	adds r4, r4, r5
	bl GetPlayerMovementDirection
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, [r4]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r3, #0
	bl _call_via_r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08091884:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809188C: .4byte 0x084E5EB8
	thumb_func_end MovementType_CopyPlayer_Step1

	thumb_func_start MovementType_CopyPlayer_Step2
MovementType_CopyPlayer_Step2: @ 0x08091890
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080918AE
	ldrb r0, [r4]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	strh r0, [r5, #0x30]
_080918AE:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_CopyPlayer_Step2

	thumb_func_start CopyablePlayerMovement_None
CopyablePlayerMovement_None: @ 0x080918B8
	movs r0, #0
	bx lr
	thumb_func_end CopyablePlayerMovement_None

	thumb_func_start CopyablePlayerMovement_FaceDirection
CopyablePlayerMovement_FaceDirection: @ 0x080918BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _08091900
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08091900: .4byte 0x084DDA21
	thumb_func_end CopyablePlayerMovement_FaceDirection

	thumb_func_start CopyablePlayerMovement_GoSpeed0
CopyablePlayerMovement_GoSpeed0: @ 0x08091904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	mov r8, r3
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	adds r6, r5, #0
	bl EventObjectIsFarawayIslandMew
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809196C
	bl GetMewMoveDirection
	adds r5, r0, #0
	cmp r5, #0
	bne _08091982
	adds r5, r6, #0
	ldr r1, _08091968
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r5, #0
	bl state_to_direction
	adds r5, r0, #0
	mov r3, sp
	adds r3, #2
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl EventObjectMoveDestCoords
	adds r0, r5, #0
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
	b _080919F4
	.align 2, 0
_08091968: .4byte 0x084DDA21
_0809196C:
	ldr r1, _08091A10
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r5, #0
	bl state_to_direction
	adds r5, r0, #0
_08091982:
	mov r6, sp
	adds r6, #2
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	adds r3, r6, #0
	bl EventObjectMoveDestCoords
	adds r0, r5, #0
	bl sub_08092CF8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r6, r0]
	adds r0, r4, #0
	adds r3, r5, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080919E0
	mov r1, r8
	cmp r1, #0
	beq _080919F4
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080919F4
_080919E0:
	adds r0, r5, #0
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
_080919F4:
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	strh r0, [r7, #0x30]
	movs r0, #1
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091A10: .4byte 0x084DDA21
	thumb_func_end CopyablePlayerMovement_GoSpeed0

	thumb_func_start CopyablePlayerMovement_GoSpeed1
CopyablePlayerMovement_GoSpeed1: @ 0x08091A14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	mov r8, r3
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r1, _08091AC8
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r6, #0
	bl state_to_direction
	adds r6, r0, #0
	mov r5, sp
	adds r5, #2
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sp
	adds r3, r5, #0
	bl EventObjectMoveDestCoords
	adds r0, r6, #0
	bl sub_08092D24
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r4, #0
	adds r3, r6, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091A9A
	mov r1, r8
	cmp r1, #0
	beq _08091AAE
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091AAE
_08091A9A:
	adds r0, r6, #0
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
_08091AAE:
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	strh r0, [r7, #0x30]
	movs r0, #1
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091AC8: .4byte 0x084DDA21
	thumb_func_end CopyablePlayerMovement_GoSpeed1

	thumb_func_start CopyablePlayerMovement_GoSpeed2
CopyablePlayerMovement_GoSpeed2: @ 0x08091ACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	mov r8, r3
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r1, _08091B80
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r6, #0
	bl state_to_direction
	adds r6, r0, #0
	mov r5, sp
	adds r5, #2
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sp
	adds r3, r5, #0
	bl EventObjectMoveDestCoords
	adds r0, r6, #0
	bl sub_08092D7C
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r4, #0
	adds r3, r6, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091B52
	mov r1, r8
	cmp r1, #0
	beq _08091B66
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091B66
_08091B52:
	adds r0, r6, #0
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
_08091B66:
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	strh r0, [r7, #0x30]
	movs r0, #1
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091B80: .4byte 0x084DDA21
	thumb_func_end CopyablePlayerMovement_GoSpeed2

	thumb_func_start CopyablePlayerMovement_Slide
CopyablePlayerMovement_Slide: @ 0x08091B84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	mov r8, r3
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r1, _08091C38
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r6, #0
	bl state_to_direction
	adds r6, r0, #0
	mov r5, sp
	adds r5, #2
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sp
	adds r3, r5, #0
	bl EventObjectMoveDestCoords
	adds r0, r6, #0
	bl sub_08092DA8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r4, #0
	adds r3, r6, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091C0A
	mov r1, r8
	cmp r1, #0
	beq _08091C1E
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091C1E
_08091C0A:
	adds r0, r6, #0
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
_08091C1E:
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	strh r0, [r7, #0x30]
	movs r0, #1
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091C38: .4byte 0x084DDA21
	thumb_func_end CopyablePlayerMovement_Slide

	thumb_func_start cph_IM_DIFFERENT
cph_IM_DIFFERENT: @ 0x08091C3C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _08091C80
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl sub_08092E2C
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08091C80: .4byte 0x084DDA21
	thumb_func_end cph_IM_DIFFERENT

	thumb_func_start CopyablePlayerMovement_GoSpeed4
CopyablePlayerMovement_GoSpeed4: @ 0x08091C84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	mov r8, r3
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r1, _08091D38
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r6, #0
	bl state_to_direction
	adds r6, r0, #0
	mov r5, sp
	adds r5, #2
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sp
	adds r3, r5, #0
	bl EventObjectMoveDestCoords
	adds r0, r6, #0
	bl sub_08092E84
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r4, #0
	adds r3, r6, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091D0A
	mov r1, r8
	cmp r1, #0
	beq _08091D1E
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091D1E
_08091D0A:
	adds r0, r6, #0
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
_08091D1E:
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	strh r0, [r7, #0x30]
	movs r0, #1
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091D38: .4byte 0x084DDA21
	thumb_func_end CopyablePlayerMovement_GoSpeed4

	thumb_func_start CopyablePlayerMovement_Jump
CopyablePlayerMovement_Jump: @ 0x08091D3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	adds r7, r1, #0
	mov r8, r3
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r1, _08091E00
	ldrb r0, [r4, #6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r6, #0
	bl state_to_direction
	adds r6, r0, #0
	ldrh r1, [r4, #0x10]
	add r0, sp, #4
	strh r1, [r0]
	ldrh r0, [r4, #0x12]
	mov r5, sp
	adds r5, #6
	strh r0, [r5]
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	add r1, sp, #4
	adds r2, r5, #0
	movs r3, #2
	bl MoveCoordsInDirection
	adds r0, r6, #0
	bl sub_08092E00
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
	add r0, sp, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r4, #0
	adds r3, r6, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091DD0
	mov r1, r8
	cmp r1, #0
	beq _08091DE4
	add r0, sp, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl _call_via_r8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091DE4
_08091DD0:
	adds r0, r6, #0
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl EventObjectSetSingleMovement
_08091DE4:
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #2
	strh r0, [r7, #0x30]
	movs r0, #1
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091E00: .4byte 0x084DDA21
	thumb_func_end CopyablePlayerMovement_Jump

	thumb_func_start MovementType_CopyPlayerInGrass
MovementType_CopyPlayerInGrass: @ 0x08091E04
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08091E20
	adds r0, r0, r2
	ldr r2, _08091E24
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08091E20: .4byte 0x02036FF0
_08091E24: .4byte 0x08091E29
	thumb_func_end MovementType_CopyPlayerInGrass

	thumb_func_start StartFieldEffectForEventObject
StartFieldEffectForEventObject: @ 0x08091E28
	push {r4, lr}
	ldr r3, _08091E44
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end StartFieldEffectForEventObject

	thumb_func_start EventObjectClearHeldMovementIfFinished
EventObjectClearHeldMovementIfFinished: @ 0x08091E3C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091E44: .4byte 0x084E5EE4
	thumb_func_end EventObjectClearHeldMovementIfFinished

	thumb_func_start MovementType_CopyPlayerInGrass_Step1
MovementType_CopyPlayerInGrass_Step1: @ 0x08091E48
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r2, _08091E6C
	ldr r3, _08091E70
	ldrb r1, [r3, #5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1c]
	cmp r0, #0xff
	beq _08091E68
	ldrb r0, [r3, #3]
	cmp r0, #2
	bne _08091E74
_08091E68:
	movs r0, #0
	b _08091E9C
	.align 2, 0
_08091E6C: .4byte 0x02036FF0
_08091E70: .4byte 0x02037230
_08091E74:
	ldr r5, _08091EA4
	bl PlayerGetCopyableMovement
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	adds r4, r4, r5
	bl GetPlayerMovementDirection
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08091EA8
	ldr r4, [r4]
	adds r0, r6, #0
	adds r1, r7, #0
	bl _call_via_r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08091E9C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091EA4: .4byte 0x084E5EB8
_08091EA8: .4byte 0x080887C9
	thumb_func_end MovementType_CopyPlayerInGrass_Step1

	thumb_func_start MovementType_TreeDisguise
MovementType_TreeDisguise: @ 0x08091EAC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08091F10
	adds r4, r1, r0
	adds r6, r4, #0
	adds r6, #0x21
	ldrb r0, [r6]
	cmp r0, #0
	beq _08091ED4
	cmp r0, #1
	bne _08091EF4
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08091EF4
_08091ED4:
	ldr r1, _08091F14
	adds r2, r1, #4
	adds r3, r1, #0
	adds r3, #8
	adds r0, r4, #0
	bl EventObjectGetLocalIdAndMap
	movs r0, #0x1c
	bl FieldEffectStart
	strb r0, [r4, #0x1a]
	movs r0, #1
	strb r0, [r6]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
_08091EF4:
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08091F10
	adds r0, r0, r1
	ldr r2, _08091F18
	adds r1, r5, #0
	bl UpdateEventObjectCurrentMovement
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091F10: .4byte 0x02036FF0
_08091F14: .4byte 0x020388A8
_08091F18: .4byte 0x08091F1D
	thumb_func_end MovementType_TreeDisguise

	thumb_func_start MovementType_Disguise_Callback
MovementType_Disguise_Callback: @ 0x08091F1C
	push {lr}
	bl ClearEventObjectMovement
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end MovementType_Disguise_Callback

	thumb_func_start MovementType_MountainDisguise
MovementType_MountainDisguise: @ 0x08091F28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08091F8C
	adds r4, r1, r0
	adds r6, r4, #0
	adds r6, #0x21
	ldrb r0, [r6]
	cmp r0, #0
	beq _08091F50
	cmp r0, #1
	bne _08091F70
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08091F70
_08091F50:
	ldr r1, _08091F90
	adds r2, r1, #4
	adds r3, r1, #0
	adds r3, #8
	adds r0, r4, #0
	bl EventObjectGetLocalIdAndMap
	movs r0, #0x1d
	bl FieldEffectStart
	strb r0, [r4, #0x1a]
	movs r0, #1
	strb r0, [r6]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
_08091F70:
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08091F8C
	adds r0, r0, r1
	ldr r2, _08091F94
	adds r1, r5, #0
	bl UpdateEventObjectCurrentMovement
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091F8C: .4byte 0x02036FF0
_08091F90: .4byte 0x020388A8
_08091F94: .4byte 0x08091F1D
	thumb_func_end MovementType_MountainDisguise

	thumb_func_start MovementType_Hidden
MovementType_Hidden: @ 0x08091F98
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0x3c
	ldrsh r0, [r3, r1]
	ldr r4, _08091FF4
	cmp r0, #0
	bne _08091FD8
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #3]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #3]
	adds r2, r3, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r3, #5]
	ldrh r0, [r3, #0x3c]
	adds r0, #1
	strh r0, [r3, #0x3c]
_08091FD8:
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, _08091FF8
	adds r1, r3, #0
	bl UpdateEventObjectCurrentMovement
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091FF4: .4byte 0x02036FF0
_08091FF8: .4byte 0x08091FFD
	thumb_func_end MovementType_Hidden

	thumb_func_start sub_08091FFC
sub_08091FFC: @ 0x08091FFC
	push {r4, lr}
	ldr r3, _08092018
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end sub_08091FFC

	thumb_func_start GetAcroEndWheelieMoveDirectionMovementAction
GetAcroEndWheelieMoveDirectionMovementAction: @ 0x08092010
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092018: .4byte 0x084E5EF0
	thumb_func_end GetAcroEndWheelieMoveDirectionMovementAction

	thumb_func_start MovementType_Hidden_Step0
MovementType_Hidden_Step0: @ 0x0809201C
	push {lr}
	bl ClearEventObjectMovement
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end MovementType_Hidden_Step0

	thumb_func_start MovementType_MoveInPlace_Step1
MovementType_MoveInPlace_Step1: @ 0x08092028
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809203A
	movs r0, #0
	strh r0, [r4, #0x30]
_0809203A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_MoveInPlace_Step1

	thumb_func_start MovementType_WalkInPlace
MovementType_WalkInPlace: @ 0x08092044
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08092060
	adds r0, r0, r2
	ldr r2, _08092064
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08092060: .4byte 0x02036FF0
_08092064: .4byte 0x08092069
	thumb_func_end MovementType_WalkInPlace

	thumb_func_start GetAcroPopWheelieFaceDirectionMovementAction
GetAcroPopWheelieFaceDirectionMovementAction: @ 0x08092068
	push {r4, lr}
	ldr r3, _08092084
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end GetAcroPopWheelieFaceDirectionMovementAction

	thumb_func_start GetAcroPopWheelieMoveDirectionMovementAction
GetAcroPopWheelieMoveDirectionMovementAction: @ 0x0809207C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092084: .4byte 0x084E5EF4
	thumb_func_end GetAcroPopWheelieMoveDirectionMovementAction

	thumb_func_start MovementType_WalkInPlace_Step0
MovementType_WalkInPlace_Step0: @ 0x08092088
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092F08
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WalkInPlace_Step0

	thumb_func_start MovementType_WalkSlowlyInPlace
MovementType_WalkSlowlyInPlace: @ 0x080920B4
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080920D0
	adds r0, r0, r2
	ldr r2, _080920D4
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080920D0: .4byte 0x02036FF0
_080920D4: .4byte 0x080920D9
	thumb_func_end MovementType_WalkSlowlyInPlace

	thumb_func_start GetAcroWheelieFaceDirectionMovementAction
GetAcroWheelieFaceDirectionMovementAction: @ 0x080920D8
	push {r4, lr}
	ldr r3, _080920F4
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end GetAcroWheelieFaceDirectionMovementAction

	thumb_func_start GetAcroWheelieHopDirectionMovementAction
GetAcroWheelieHopDirectionMovementAction: @ 0x080920EC
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080920F4: .4byte 0x084E5EFC
	thumb_func_end GetAcroWheelieHopDirectionMovementAction

	thumb_func_start MovementType_WalkSlowlyInPlace_Step0
MovementType_WalkSlowlyInPlace_Step0: @ 0x080920F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092EDC
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_WalkSlowlyInPlace_Step0

	thumb_func_start MovementType_JogInPlace
MovementType_JogInPlace: @ 0x08092124
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08092140
	adds r0, r0, r2
	ldr r2, _08092144
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08092140: .4byte 0x02036FF0
_08092144: .4byte 0x08092149
	thumb_func_end MovementType_JogInPlace

	thumb_func_start GetAcroWheelieHopFaceDirectionMovementAction
GetAcroWheelieHopFaceDirectionMovementAction: @ 0x08092148
	push {r4, lr}
	ldr r3, _08092164
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end GetAcroWheelieHopFaceDirectionMovementAction

	thumb_func_start GetAcroWheelieInPlaceDirectionMovementAction
GetAcroWheelieInPlaceDirectionMovementAction: @ 0x0809215C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092164: .4byte 0x084E5F04
	thumb_func_end GetAcroWheelieInPlaceDirectionMovementAction

	thumb_func_start MovementType_JogInPlace_Step0
MovementType_JogInPlace_Step0: @ 0x08092168
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092F34
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_JogInPlace_Step0

	thumb_func_start MovementType_RunInPlace
MovementType_RunInPlace: @ 0x08092194
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _080921B0
	adds r0, r0, r2
	ldr r2, _080921B4
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_080921B0: .4byte 0x02036FF0
_080921B4: .4byte 0x080921B9
	thumb_func_end MovementType_RunInPlace

	thumb_func_start GetAcroWheelieJumpDirectionMovementAction
GetAcroWheelieJumpDirectionMovementAction: @ 0x080921B8
	push {r4, lr}
	ldr r3, _080921D4
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end GetAcroWheelieJumpDirectionMovementAction

	thumb_func_start GetAcroWheelieMoveDirectionMovementAction
GetAcroWheelieMoveDirectionMovementAction: @ 0x080921CC
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080921D4: .4byte 0x084E5F0C
	thumb_func_end GetAcroWheelieMoveDirectionMovementAction

	thumb_func_start MovementType_RunInPlace_Step0
MovementType_RunInPlace_Step0: @ 0x080921D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092F60
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_RunInPlace_Step0

	thumb_func_start MovementType_Invisible
MovementType_Invisible: @ 0x08092204
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r2, _08092220
	adds r0, r0, r2
	ldr r2, _08092224
	bl UpdateEventObjectCurrentMovement
	pop {r0}
	bx r0
	.align 2, 0
_08092220: .4byte 0x02036FF0
_08092224: .4byte 0x08092229
	thumb_func_end MovementType_Invisible

	thumb_func_start GetFaceDirectionMovementAction
GetFaceDirectionMovementAction: @ 0x08092228
	push {r4, lr}
	ldr r3, _08092244
	movs r4, #0x30
	ldrsh r2, [r1, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end GetFaceDirectionMovementAction

	thumb_func_start GetJump2MovementAction
GetJump2MovementAction: @ 0x0809223C
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092244: .4byte 0x084E5F14
	thumb_func_end GetJump2MovementAction

	thumb_func_start MovementType_Invisible_Step0
MovementType_Invisible_Step0: @ 0x08092248
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearEventObjectMovement
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl sub_08092CA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectSetSingleMovement
	ldrb r0, [r4, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #1
	strh r0, [r5, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementType_Invisible_Step0

	thumb_func_start MovementType_Invisible_Step1
MovementType_Invisible_Step1: @ 0x0809227C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08093234
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809228E
	movs r0, #0
	b _08092294
_0809228E:
	movs r0, #2
	strh r0, [r4, #0x30]
	movs r0, #1
_08092294:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementType_Invisible_Step1

	thumb_func_start MovementType_FaceDirection_Step2
MovementType_FaceDirection_Step2: @ 0x0809229C
	ldrb r2, [r0]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end MovementType_FaceDirection_Step2

	thumb_func_start ClearEventObjectMovement
ClearEventObjectMovement: @ 0x080922AC
	ldrb r3, [r0]
	movs r2, #3
	rsbs r2, r2, #0
	ands r2, r3
	movs r3, #0x41
	rsbs r3, r3, #0
	ands r2, r3
	movs r3, #0x7f
	ands r2, r3
	strb r2, [r0]
	movs r2, #0xff
	strb r2, [r0, #0x1c]
	movs r0, #0
	strh r0, [r1, #0x30]
	bx lr
	.align 2, 0
	thumb_func_end ClearEventObjectMovement

	thumb_func_start GetJumpInPlaceMovementAction
GetJumpInPlaceMovementAction: @ 0x080922CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080922D8
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080922D8: .4byte 0x084E5F20
	thumb_func_end GetJumpInPlaceMovementAction

	thumb_func_start GetJumpInPlaceTurnAroundMovementAction
GetJumpInPlaceTurnAroundMovementAction: @ 0x080922DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080922E8
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080922E8: .4byte 0x084E5F29
	thumb_func_end GetJumpInPlaceTurnAroundMovementAction

	thumb_func_start GetJumpMovementAction
GetJumpMovementAction: @ 0x080922EC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080922F8
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080922F8: .4byte 0x084E5F32
	thumb_func_end GetJumpMovementAction

	thumb_func_start GetJumpSpecialMovementAction
GetJumpSpecialMovementAction: @ 0x080922FC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092308
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092308: .4byte 0x084E5F3B
	thumb_func_end GetJumpSpecialMovementAction

	thumb_func_start GetPlayerRunMovementAction
GetPlayerRunMovementAction: @ 0x0809230C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092318
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092318: .4byte 0x084E5F44
	thumb_func_end GetPlayerRunMovementAction

	thumb_func_start GetRideWaterCurrentMovementAction
GetRideWaterCurrentMovementAction: @ 0x0809231C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092328
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092328: .4byte 0x084E5F4D
	thumb_func_end GetRideWaterCurrentMovementAction

	thumb_func_start GetSlideMovementAction
GetSlideMovementAction: @ 0x0809232C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092338
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092338: .4byte 0x084E5F56
	thumb_func_end GetSlideMovementAction

	thumb_func_start GetWalkFastMovementAction
GetWalkFastMovementAction: @ 0x0809233C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092348
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092348: .4byte 0x084E5F5F
	thumb_func_end GetWalkFastMovementAction

	thumb_func_start GetWalkFastestMovementAction
GetWalkFastestMovementAction: @ 0x0809234C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092358
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092358: .4byte 0x084E5F68
	thumb_func_end GetWalkFastestMovementAction

	thumb_func_start GetWalkInPlaceFastMovementAction
GetWalkInPlaceFastMovementAction: @ 0x0809235C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092368
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092368: .4byte 0x084E5F71
	thumb_func_end GetWalkInPlaceFastMovementAction

	thumb_func_start GetWalkInPlaceFastestMovementAction
GetWalkInPlaceFastestMovementAction: @ 0x0809236C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092378
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092378: .4byte 0x084E5F7A
	thumb_func_end GetWalkInPlaceFastestMovementAction

	thumb_func_start GetWalkInPlaceNormalMovementAction
GetWalkInPlaceNormalMovementAction: @ 0x0809237C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092388
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092388: .4byte 0x084E5F83
	thumb_func_end GetWalkInPlaceNormalMovementAction

	thumb_func_start GetWalkInPlaceSlowMovementAction
GetWalkInPlaceSlowMovementAction: @ 0x0809238C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08092398
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08092398: .4byte 0x084E5F8C
	thumb_func_end GetWalkInPlaceSlowMovementAction

	thumb_func_start GetWalkNormalMovementAction
GetWalkNormalMovementAction: @ 0x0809239C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080923A8
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080923A8: .4byte 0x084E5F95
	thumb_func_end GetWalkNormalMovementAction

	thumb_func_start GetWalkSlowMovementAction
GetWalkSlowMovementAction: @ 0x080923AC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080923B8
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080923B8: .4byte 0x084E5F9E
	thumb_func_end GetWalkSlowMovementAction

	thumb_func_start sub_080923BC
sub_080923BC: @ 0x080923BC
	push {lr}
	adds r2, r0, #0
	ldr r1, _080923C4
	b _080923D4
	.align 2, 0
_080923C4: .4byte 0x084E1900
_080923C8:
	ldr r0, [r1]
	cmp r0, r2
	bne _080923D2
	adds r0, r1, #0
	b _080923DC
_080923D2:
	adds r1, #8
_080923D4:
	ldr r0, [r1]
	cmp r0, #0
	bne _080923C8
	movs r0, #0
_080923DC:
	pop {r1}
	bx r1
	thumb_func_end sub_080923BC

	thumb_func_start npc_apply_anim_looping
npc_apply_anim_looping: @ 0x080923E0
	push {r4, lr}
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _08092422
	adds r0, r4, #0
	adds r0, #0x2a
	strb r2, [r0]
	ldr r0, [r4, #8]
	bl sub_080923BC
	adds r1, r4, #0
	adds r1, #0x2b
	cmp r0, #0
	beq _0809241A
	ldrb r2, [r1]
	ldrb r3, [r0, #4]
	cmp r2, r3
	bne _08092410
	ldrb r0, [r0, #7]
	b _08092418
_08092410:
	ldrb r3, [r0, #5]
	cmp r2, r3
	bne _0809241A
	ldrb r0, [r0, #6]
_08092418:
	strb r0, [r1]
_0809241A:
	ldrb r1, [r1]
	adds r0, r4, #0
	bl SeekSpriteAnim
_08092422:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end npc_apply_anim_looping

	thumb_func_start obj_npc_animation_step
obj_npc_animation_step: @ 0x08092428
	push {r4, lr}
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _08092460
	adds r0, r4, #0
	adds r0, #0x2a
	strb r2, [r0]
	ldr r0, [r4, #8]
	bl sub_080923BC
	adds r2, r0, #0
	cmp r2, #0
	beq _08092460
	ldrb r1, [r2, #5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	ldrb r3, [r2, #4]
	cmp r0, r3
	bhi _0809245A
	ldrb r1, [r2, #4]
_0809245A:
	adds r0, r4, #0
	bl SeekSpriteAnim
_08092460:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end obj_npc_animation_step

	thumb_func_start GetDirectionToFace
GetDirectionToFace: @ 0x08092468
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	ble _08092482
	movs r0, #3
	b _08092498
_08092482:
	cmp r0, r2
	bge _0809248A
	movs r0, #4
	b _08092498
_0809248A:
	lsls r1, r1, #0x10
	lsls r0, r3, #0x10
	cmp r1, r0
	bgt _08092496
	movs r0, #1
	b _08092498
_08092496:
	movs r0, #2
_08092498:
	pop {r1}
	bx r1
	thumb_func_end GetDirectionToFace

	thumb_func_start SetTrainerMovementType
SetTrainerMovementType: @ 0x0809249C
	push {r4, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0
	strb r1, [r0, #6]
	adds r0, #0x21
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r4, _080924E0
	mov r0, ip
	ldrb r2, [r0, #4]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r2, r4, #0
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r2, _080924E4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0]
	mov r0, ip
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r3, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080924E0: .4byte 0x020205AC
_080924E4: .4byte 0x084DD88C
	thumb_func_end SetTrainerMovementType

	thumb_func_start GroundEffect_DeepSandTracks
GroundEffect_DeepSandTracks: @ 0x080924E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080924F4
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080924F4: .4byte 0x084E5FA7
	thumb_func_end GroundEffect_DeepSandTracks

	thumb_func_start GetCollisionInDirection
GetCollisionInDirection: @ 0x080924F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	ldrh r1, [r6, #0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, #0x12]
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl MoveCoords
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r0, r6, #0
	adds r3, r5, #0
	bl GetCollisionAtCoords
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end GetCollisionInDirection

	thumb_func_start GetCollisionAtCoords
GetCollisionAtCoords: @ 0x08092538
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	mov r8, r7
	lsrs r0, r1, #0x10
	mov sb, r0
	asrs r5, r1, #0x10
	lsrs r0, r2, #0x10
	mov sl, r0
	asrs r4, r2, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl IsCoordOutsideEventObjectMovementRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809256E
	movs r0, #1
	b _080925EE
_0809256E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapGridIsImpassableAt
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080925B0
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetMapBorderIdAt
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080925B0
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl IsMetatileDirectionallyImpassable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080925B0
	ldrb r0, [r6, #1]
	lsrs r0, r0, #7
	cmp r0, #0
	beq _080925B4
	mov r0, r8
	bl CanCameraMoveInDirection
	cmp r0, #0
	bne _080925B4
_080925B0:
	movs r0, #2
	b _080925EE
_080925B4:
	ldrb r0, [r6, #0xb]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r5, r1, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r4, r1, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl IsZCoordMismatchAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080925D8
	movs r0, #3
	b _080925EE
_080925D8:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl DoesObjectCollideWithObjectAt
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080925EC
	movs r0, #0
	b _080925EE
_080925EC:
	movs r0, #4
_080925EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetCollisionAtCoords

	thumb_func_start GetCollisionFlagsAtCoords
GetCollisionFlagsAtCoords: @ 0x080925FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsrs r0, r1, #0x10
	mov sb, r0
	asrs r6, r1, #0x10
	lsrs r0, r2, #0x10
	mov sl, r0
	asrs r5, r2, #0x10
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl IsCoordOutsideEventObjectMovementRange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	adds r0, r6, #0
	adds r1, r5, #0
	bl MapGridIsImpassableAt
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092674
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetMapBorderIdAt
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08092674
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	mov r3, r8
	bl IsMetatileDirectionallyImpassable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092674
	ldrb r0, [r7, #1]
	lsrs r0, r0, #7
	cmp r0, #0
	beq _08092678
	mov r0, r8
	bl CanCameraMoveInDirection
	cmp r0, #0
	bne _08092678
_08092674:
	movs r0, #2
	orrs r4, r0
_08092678:
	ldrb r0, [r7, #0xb]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r6, r1, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r5, r1, #0x10
	adds r1, r6, #0
	adds r2, r5, #0
	bl IsZCoordMismatchAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080926A0
	movs r0, #4
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080926A0:
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl DoesObjectCollideWithObjectAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080926B8
	movs r0, #8
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080926B8:
	adds r0, r4, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end GetCollisionFlagsAtCoords

	thumb_func_start IsCoordOutsideEventObjectMovementRange
IsCoordOutsideEventObjectMovementRange: @ 0x080926C8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldrb r1, [r4, #0x19]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08092700
	lsls r1, r1, #0x1c
	lsrs r2, r1, #0x1c
	ldrh r0, [r4, #0xc]
	subs r2, r0, r2
	lsrs r1, r1, #0x1c
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	cmp r2, r0
	bgt _0809272C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	blt _0809272C
_08092700:
	ldrb r1, [r4, #0x19]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08092730
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x1c
	ldrh r0, [r4, #0xe]
	subs r2, r0, r2
	lsrs r1, r1, #0x1c
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	cmp r2, r0
	bgt _0809272C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	bge _08092730
_0809272C:
	movs r0, #1
	b _08092732
_08092730:
	movs r0, #0
_08092732:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end IsCoordOutsideEventObjectMovementRange

	thumb_func_start IsMetatileDirectionallyImpassable
IsMetatileDirectionallyImpassable: @ 0x08092738
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	ldr r1, _08092780
	lsrs r3, r3, #0x16
	subs r5, r3, #4
	adds r1, r5, r1
	ldrb r0, [r0, #0x1e]
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809277A
	ldr r4, _08092784
	adds r4, r5, r4
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092788
_0809277A:
	movs r0, #1
	b _0809278A
	.align 2, 0
_08092780: .4byte 0x084E5FB0
_08092784: .4byte 0x084E5FC0
_08092788:
	movs r0, #0
_0809278A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end IsMetatileDirectionallyImpassable

	thumb_func_start DoesObjectCollideWithObjectAt
DoesObjectCollideWithObjectAt: @ 0x08092790
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r4, #0
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
_0809279E:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080927F4
	adds r2, r0, r1
	ldrb r0, [r2]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080927F8
	cmp r2, r6
	beq _080927F8
	movs r0, #0x10
	ldrsh r1, [r2, r0]
	lsls r0, r7, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	bne _080927C8
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	cmp r0, r5
	beq _080927D8
_080927C8:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bne _080927F8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	cmp r0, r5
	bne _080927F8
_080927D8:
	ldrb r0, [r6, #0xb]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r1, [r2, #0xb]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl AreZCoordsCompatible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080927F8
	movs r0, #1
	b _08092804
	.align 2, 0
_080927F4: .4byte 0x02036FF0
_080927F8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0809279E
	movs r0, #0
_08092804:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end DoesObjectCollideWithObjectAt

	thumb_func_start IsBerryTreeSparkling
IsBerryTreeSparkling: @ 0x0809280C
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092858
	ldr r3, _08092850
	ldr r2, _08092854
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #0x3c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08092858
	movs r0, #1
	b _0809285A
	.align 2, 0
_08092850: .4byte 0x020205AC
_08092854: .4byte 0x02036FF0
_08092858:
	movs r0, #0
_0809285A:
	add sp, #4
	pop {r1}
	bx r1
	thumb_func_end IsBerryTreeSparkling

	thumb_func_start sub_08092860
sub_08092860: @ 0x08092860
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809289E
	ldr r3, _080928A4
	ldr r2, _080928A8
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r2, [r1, #0x3c]
	movs r0, #4
	orrs r0, r2
	strh r0, [r1, #0x3c]
_0809289E:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080928A4: .4byte 0x020205AC
_080928A8: .4byte 0x02036FF0
	thumb_func_end sub_08092860

	thumb_func_start MoveCoords
MoveCoords: @ 0x080928AC
	push {r4, lr}
	lsls r0, r0, #0x18
	ldr r3, _080928CC
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldrh r3, [r0]
	ldrh r4, [r1]
	adds r3, r3, r4
	strh r3, [r1]
	ldrh r0, [r0, #2]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080928CC: .4byte 0x084E5FD0
	thumb_func_end MoveCoords

	thumb_func_start sub_080928D0
sub_080928D0: @ 0x080928D0
	push {r4, lr}
	lsls r0, r0, #0x18
	ldr r3, _080928F4
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldrh r3, [r0]
	lsls r3, r3, #4
	ldrh r4, [r1]
	adds r3, r3, r4
	strh r3, [r1]
	ldrh r0, [r0, #2]
	lsls r0, r0, #4
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080928F4: .4byte 0x084E5FD0
	thumb_func_end sub_080928D0

	thumb_func_start MoveCoordsInDirection
MoveCoordsInDirection: @ 0x080928F8
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r7, r3, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov ip, r6
	ldr r1, _0809295C
	lsrs r0, r0, #0x16
	adds r5, r0, r1
	movs r0, #0
	ldrsh r1, [r5, r0]
	cmp r1, #0
	ble _08092924
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4]
	adds r0, r0, r3
	strh r0, [r4]
_08092924:
	cmp r1, #0
	bge _08092932
	ldrh r1, [r4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4]
_08092932:
	movs r0, #2
	ldrsh r1, [r5, r0]
	cmp r1, #0
	ble _08092944
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r2]
	adds r0, r0, r3
	strh r0, [r2]
_08092944:
	cmp r1, #0
	bge _08092954
	ldrh r1, [r2]
	mov r3, ip
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r2]
_08092954:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809295C: .4byte 0x084E5FD0
	thumb_func_end MoveCoordsInDirection

	thumb_func_start sub_08092960
sub_08092960: @ 0x08092960
	push {r4, r5, lr}
	ldr r5, _0809299C
	ldr r4, [r5]
	ldrh r4, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r4
	lsls r0, r0, #4
	strh r0, [r2]
	ldr r0, [r5]
	ldrh r0, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #4
	strh r1, [r3]
	ldr r1, _080929A0
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	ldr r1, _080929A4
	ldrh r0, [r3]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809299C: .4byte 0x03005AEC
_080929A0: .4byte 0x03005B4C
_080929A4: .4byte 0x03005B48
	thumb_func_end sub_08092960

	thumb_func_start SetSpritePosToMapCoords
SetSpritePosToMapCoords: @ 0x080929A8
	push {r4, r5, r6, r7, lr}
	adds r7, r2, #0
	mov ip, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _08092A3C
	ldrh r0, [r0]
	rsbs r0, r0, #0
	ldr r1, _08092A40
	ldr r2, [r1, #0x10]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08092A44
	ldrh r0, [r0]
	rsbs r0, r0, #0
	ldr r1, [r1, #0x14]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _080929E2
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #0xd
	adds r0, r0, r3
	lsrs r3, r0, #0x10
_080929E2:
	cmp r2, #0
	bge _080929EE
	lsls r0, r3, #0x10
	ldr r2, _08092A48
	adds r0, r0, r2
	lsrs r3, r0, #0x10
_080929EE:
	cmp r1, #0
	ble _080929FC
	lsls r0, r4, #0x10
	movs r2, #0x80
	lsls r2, r2, #0xd
	adds r0, r0, r2
	lsrs r4, r0, #0x10
_080929FC:
	cmp r1, #0
	bge _08092A08
	lsls r0, r4, #0x10
	ldr r1, _08092A48
	adds r0, r0, r1
	lsrs r4, r0, #0x10
_08092A08:
	ldr r2, _08092A4C
	ldr r0, [r2]
	ldrh r1, [r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #4
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	strh r1, [r7]
	ldr r0, [r2]
	ldrh r1, [r0, #2]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #4
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	mov r2, ip
	strh r1, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092A3C: .4byte 0x03005B4C
_08092A40: .4byte 0x03005B30
_08092A44: .4byte 0x03005B48
_08092A48: .4byte 0xFFF00000
_08092A4C: .4byte 0x03005AEC
	thumb_func_end SetSpritePosToMapCoords

	thumb_func_start sub_08092A50
sub_08092A50: @ 0x08092A50
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r5, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r6, #0
	mov r3, r8
	bl SetSpritePosToMapCoords
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r0, [r6]
	adds r4, r4, r0
	strh r4, [r6]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, r8
	ldrh r1, [r1]
	adds r5, r5, r1
	mov r2, r8
	strh r5, [r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08092A50

	thumb_func_start GetEventObjectMovingCameraOffset
GetEventObjectMovingCameraOffset: @ 0x08092A9C
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2]
	strh r0, [r1]
	ldr r3, _08092AD8
	ldr r0, [r3, #0x10]
	cmp r0, #0
	ble _08092AB2
	movs r0, #1
	strh r0, [r2]
_08092AB2:
	ldr r0, [r3, #0x10]
	cmp r0, #0
	bge _08092ABE
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
_08092ABE:
	ldr r2, [r3, #0x14]
	cmp r2, #0
	ble _08092ACA
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08092ACA:
	cmp r2, #0
	bge _08092AD4
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08092AD4:
	pop {r0}
	bx r0
	.align 2, 0
_08092AD8: .4byte 0x03005B30
	thumb_func_end GetEventObjectMovingCameraOffset

	thumb_func_start EventObjectMoveDestCoords
EventObjectMoveDestCoords: @ 0x08092ADC
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r4, [r0, #0x10]
	strh r4, [r2]
	ldrh r0, [r0, #0x12]
	strh r0, [r3]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	bl MoveCoords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EventObjectMoveDestCoords

	thumb_func_start EventObjectIsMovementOverridden
EventObjectIsMovementOverridden: @ 0x08092AFC
	push {lr}
	ldrb r1, [r0]
	movs r0, #0x42
	ands r0, r1
	cmp r0, #0
	bne _08092B0C
	movs r0, #0
	b _08092B0E
_08092B0C:
	movs r0, #1
_08092B0E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end EventObjectIsMovementOverridden

	thumb_func_start EventObjectIsHeldMovementActive
EventObjectIsHeldMovementActive: @ 0x08092B14
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _08092B2A
	ldrb r0, [r1, #0x1c]
	cmp r0, #0xff
	beq _08092B2A
	movs r0, #1
	b _08092B2C
_08092B2A:
	movs r0, #0
_08092B2C:
	pop {r1}
	bx r1
	thumb_func_end EventObjectIsHeldMovementActive

	thumb_func_start EventObjectSetHeldMovement
EventObjectSetHeldMovement: @ 0x08092B30
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl EventObjectIsMovementOverridden
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _08092B70
	adds r0, r4, #0
	bl UnfreezeEventObject
	strb r5, [r4, #0x1c]
	ldrb r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4]
	ldr r2, _08092B6C
	ldrb r1, [r4, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strh r6, [r0, #0x32]
	movs r0, #0
	b _08092B72
	.align 2, 0
_08092B6C: .4byte 0x020205AC
_08092B70:
	movs r0, #1
_08092B72:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end EventObjectSetHeldMovement

	thumb_func_start EventObjectForceSetHeldMovement
EventObjectForceSetHeldMovement: @ 0x08092B78
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl EventObjectClearHeldMovementIfActive
	adds r0, r5, #0
	adds r1, r4, #0
	bl EventObjectSetHeldMovement
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EventObjectForceSetHeldMovement

	thumb_func_start EventObjectClearHeldMovementIfActive
EventObjectClearHeldMovementIfActive: @ 0x08092B94
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _08092BA6
	adds r0, r1, #0
	bl EventObjectClearHeldMovement
_08092BA6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EventObjectClearHeldMovementIfActive

	thumb_func_start EventObjectClearHeldMovement
EventObjectClearHeldMovement: @ 0x08092BAC
	movs r1, #0xff
	strb r1, [r0, #0x1c]
	ldrb r2, [r0]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #0x7f
	ands r1, r2
	strb r1, [r0]
	ldr r3, _08092BDC
	ldrb r2, [r0, #4]
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r2, #0
	strh r2, [r1, #0x30]
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x32]
	bx lr
	.align 2, 0
_08092BDC: .4byte 0x020205AC
	thumb_func_end EventObjectClearHeldMovement

	thumb_func_start EventObjectCheckHeldMovementStatus
EventObjectCheckHeldMovementStatus: @ 0x08092BE0
	push {lr}
	ldrb r1, [r0]
	lsls r0, r1, #0x19
	cmp r0, #0
	blt _08092BEE
	movs r0, #0x10
	b _08092BF0
_08092BEE:
	lsrs r0, r1, #7
_08092BF0:
	pop {r1}
	bx r1
	thumb_func_end EventObjectCheckHeldMovementStatus

	thumb_func_start MovementAction_AcroEndWheelieFaceLeft_Step0
MovementAction_AcroEndWheelieFaceLeft_Step0: @ 0x08092BF4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl EventObjectCheckHeldMovementStatus
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08092C0E
	cmp r4, #0x10
	beq _08092C0E
	adds r0, r5, #0
	bl EventObjectClearHeldMovementIfActive
_08092C0E:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroEndWheelieFaceLeft_Step0

	thumb_func_start EventObjectGetHeldMovementActionId
EventObjectGetHeldMovementActionId: @ 0x08092C18
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _08092C28
	movs r0, #0xff
	b _08092C2A
_08092C28:
	ldrb r0, [r1, #0x1c]
_08092C2A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end EventObjectGetHeldMovementActionId

	thumb_func_start UpdateEventObjectCurrentMovement
UpdateEventObjectCurrentMovement: @ 0x08092C30
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl DoGroundEffects_OnSpawn
	adds r0, r4, #0
	adds r1, r5, #0
	bl TryEnableEventObjectAnim
	adds r0, r4, #0
	bl EventObjectIsHeldMovementActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092C5A
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectExecHeldMovementAction
	b _08092C70
_08092C5A:
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08092C70
_08092C62:
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r6
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092C62
_08092C70:
	adds r0, r4, #0
	adds r1, r5, #0
	bl DoGroundEffects_OnBeginStep
	adds r0, r4, #0
	adds r1, r5, #0
	bl DoGroundEffects_OnFinishStep
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateEventObjectSpriteAnimPause
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateEventObjectVisibility
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventObjectUpdateSubpriority
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateEventObjectCurrentMovement

	thumb_func_start sub_08092CA0
sub_08092CA0: @ 0x08092CA0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092CC8
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092CB8
	movs r4, #0
_08092CB8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092CC8: .4byte 0x084E5FF4
	thumb_func_end sub_08092CA0

	thumb_func_start sub_08092CCC
sub_08092CCC: @ 0x08092CCC
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092CF4
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092CE4
	movs r4, #0
_08092CE4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092CF4: .4byte 0x084E5FF9
	thumb_func_end sub_08092CCC

	thumb_func_start sub_08092CF8
sub_08092CF8: @ 0x08092CF8
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092D20
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092D10
	movs r4, #0
_08092D10:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092D20: .4byte 0x084E5FFE
	thumb_func_end sub_08092CF8

	thumb_func_start sub_08092D24
sub_08092D24: @ 0x08092D24
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092D4C
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092D3C
	movs r4, #0
_08092D3C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092D4C: .4byte 0x084E6003
	thumb_func_end sub_08092D24

	thumb_func_start sub_08092D50
sub_08092D50: @ 0x08092D50
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092D78
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092D68
	movs r4, #0
_08092D68:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092D78: .4byte 0x084E6008
	thumb_func_end sub_08092D50

	thumb_func_start sub_08092D7C
sub_08092D7C: @ 0x08092D7C
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092DA4
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092D94
	movs r4, #0
_08092D94:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092DA4: .4byte 0x084E600D
	thumb_func_end sub_08092D7C

	thumb_func_start sub_08092DA8
sub_08092DA8: @ 0x08092DA8
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092DD0
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092DC0
	movs r4, #0
_08092DC0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092DD0: .4byte 0x084E6012
	thumb_func_end sub_08092DA8

	thumb_func_start sub_08092DD4
sub_08092DD4: @ 0x08092DD4
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092DFC
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092DEC
	movs r4, #0
_08092DEC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092DFC: .4byte 0x084E6017
	thumb_func_end sub_08092DD4

	thumb_func_start sub_08092E00
sub_08092E00: @ 0x08092E00
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092E28
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092E18
	movs r4, #0
_08092E18:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092E28: .4byte 0x084E601C
	thumb_func_end sub_08092E00

	thumb_func_start sub_08092E2C
sub_08092E2C: @ 0x08092E2C
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092E54
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092E44
	movs r4, #0
_08092E44:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092E54: .4byte 0x084E6021
	thumb_func_end sub_08092E2C

	thumb_func_start sub_08092E58
sub_08092E58: @ 0x08092E58
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092E80
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092E70
	movs r4, #0
_08092E70:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092E80: .4byte 0x084E6026
	thumb_func_end sub_08092E58

	thumb_func_start sub_08092E84
sub_08092E84: @ 0x08092E84
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092EAC
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092E9C
	movs r4, #0
_08092E9C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092EAC: .4byte 0x084E602B
	thumb_func_end sub_08092E84

	thumb_func_start sub_08092EB0
sub_08092EB0: @ 0x08092EB0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092ED8
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092EC8
	movs r4, #0
_08092EC8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092ED8: .4byte 0x084E6030
	thumb_func_end sub_08092EB0

	thumb_func_start sub_08092EDC
sub_08092EDC: @ 0x08092EDC
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092F04
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092EF4
	movs r4, #0
_08092EF4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092F04: .4byte 0x084E6035
	thumb_func_end sub_08092EDC

	thumb_func_start sub_08092F08
sub_08092F08: @ 0x08092F08
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092F30
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092F20
	movs r4, #0
_08092F20:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092F30: .4byte 0x084E603A
	thumb_func_end sub_08092F08

	thumb_func_start sub_08092F34
sub_08092F34: @ 0x08092F34
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092F5C
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092F4C
	movs r4, #0
_08092F4C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092F5C: .4byte 0x084E603F
	thumb_func_end sub_08092F34

	thumb_func_start sub_08092F60
sub_08092F60: @ 0x08092F60
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092F88
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092F78
	movs r4, #0
_08092F78:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092F88: .4byte 0x084E6044
	thumb_func_end sub_08092F60

	thumb_func_start EventObjectFaceOppositeDirection
EventObjectFaceOppositeDirection: @ 0x08092F8C
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetOppositeDirection
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08092CA0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl EventObjectSetHeldMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end EventObjectFaceOppositeDirection

	thumb_func_start sub_08092FB8
sub_08092FB8: @ 0x08092FB8
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08092FE0
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092FD0
	movs r4, #0
_08092FD0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08092FE0: .4byte 0x084E6049
	thumb_func_end sub_08092FB8

	thumb_func_start sub_08092FE4
sub_08092FE4: @ 0x08092FE4
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0809300C
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08092FFC
	movs r4, #0
_08092FFC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809300C: .4byte 0x084E604E
	thumb_func_end sub_08092FE4

	thumb_func_start EventObjectExecSingleMovementAction
EventObjectExecSingleMovementAction: @ 0x08093010
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08093038
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08093028
	movs r4, #0
_08093028:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093038: .4byte 0x084E6053
	thumb_func_end EventObjectExecSingleMovementAction

	thumb_func_start sub_0809303C
sub_0809303C: @ 0x0809303C
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08093064
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08093054
	movs r4, #0
_08093054:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093064: .4byte 0x084E6058
	thumb_func_end sub_0809303C

	thumb_func_start GetAcroEndWheelieFaceDirectionMovementAction
GetAcroEndWheelieFaceDirectionMovementAction: @ 0x08093068
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08093090
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08093080
	movs r4, #0
_08093080:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093090: .4byte 0x084E605D
	thumb_func_end GetAcroEndWheelieFaceDirectionMovementAction

	thumb_func_start sub_08093094
sub_08093094: @ 0x08093094
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080930BC
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _080930AC
	movs r4, #0
_080930AC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080930BC: .4byte 0x084E6062
	thumb_func_end sub_08093094

	thumb_func_start sub_080930C0
sub_080930C0: @ 0x080930C0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080930E8
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _080930D8
	movs r4, #0
_080930D8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080930E8: .4byte 0x084E6067
	thumb_func_end sub_080930C0

	thumb_func_start sub_080930EC
sub_080930EC: @ 0x080930EC
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08093114
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08093104
	movs r4, #0
_08093104:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093114: .4byte 0x084E606C
	thumb_func_end sub_080930EC

	thumb_func_start sub_08093118
sub_08093118: @ 0x08093118
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08093140
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _08093130
	movs r4, #0
_08093130:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093140: .4byte 0x084E6071
	thumb_func_end sub_08093118

	thumb_func_start sub_08093144
sub_08093144: @ 0x08093144
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0809316C
	mov r0, sp
	movs r2, #5
	bl memcpy
	cmp r4, #4
	bls _0809315C
	movs r4, #0
_0809315C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809316C: .4byte 0x084E6076
	thumb_func_end sub_08093144

	thumb_func_start GetOppositeDirection
GetOppositeDirection: @ 0x08093170
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08093194
	mov r0, sp
	movs r2, #8
	bl memcpy
	subs r1, r4, #1
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _08093198
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	b _0809319A
	.align 2, 0
_08093194: .4byte 0x084E607B
_08093198:
	adds r0, r4, #0
_0809319A:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetOppositeDirection

	thumb_func_start zffu_offset_calc
zffu_offset_calc: @ 0x080931A4
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080931B8
	lsrs r0, r0, #0x16
	subs r0, #5
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080931B8: .4byte 0x084E6083
	thumb_func_end zffu_offset_calc

	thumb_func_start state_to_direction
state_to_direction: @ 0x080931BC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r1, #0
	beq _080931DC
	cmp r2, #0
	beq _080931DC
	cmp r1, #4
	bhi _080931DC
	cmp r2, #4
	bls _080931E0
_080931DC:
	movs r0, #0
	b _080931F2
_080931E0:
	adds r1, r2, #0
	bl zffu_offset_calc
	ldr r2, _080931F8
	lsls r1, r4, #2
	subs r1, #5
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
_080931F2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080931F8: .4byte 0x084E6093
	thumb_func_end state_to_direction

	thumb_func_start EventObjectExecHeldMovementAction
EventObjectExecHeldMovementAction: @ 0x080931FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08093230
	ldrb r0, [r4, #0x1c]
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x32
	ldrsh r2, [r1, r3]
	ldr r0, [r0]
	lsls r2, r2, #2
	adds r2, r2, r0
	ldr r2, [r2]
	adds r0, r4, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end EventObjectExecHeldMovementAction

	thumb_func_start sub_0809321C
sub_0809321C: @ 0x0809321C
	cmp r0, #0
	beq _08093228
	ldrb r0, [r4]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4]
_08093228:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093230: .4byte 0x084E60A4
	thumb_func_end sub_0809321C

	thumb_func_start sub_08093234
sub_08093234: @ 0x08093234
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08093260
	ldrb r0, [r4, #0x1c]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	thumb_func_end sub_08093234

	thumb_func_start sub_08093258
sub_08093258: @ 0x08093258
	cmp r0, #0
	bne _08093264
	movs r0, #0
	b _0809326E
	.align 2, 0
_08093260: .4byte 0x084E60A4
_08093264:
	movs r0, #0xff
	strb r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x32]
	movs r0, #1
_0809326E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08093258

	thumb_func_start EventObjectSetSingleMovement
EventObjectSetSingleMovement: @ 0x08093274
	movs r3, #0
	strb r2, [r0, #0x1c]
	strh r3, [r1, #0x32]
	bx lr
	thumb_func_end EventObjectSetSingleMovement

	thumb_func_start FaceDirection
FaceDirection: @ 0x0809327C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl SetEventObjectDirection
	adds r0, r4, #0
	bl ShiftStillEventObjectCoords
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl obj_npc_animation_step
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r5, #0x32]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end FaceDirection

	thumb_func_start MovementAction_FaceDown_Step0
MovementAction_FaceDown_Step0: @ 0x080932C0
	push {lr}
	movs r2, #1
	bl FaceDirection
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_FaceDown_Step0

	thumb_func_start MovementAction_FaceUp_Step0
MovementAction_FaceUp_Step0: @ 0x080932D0
	push {lr}
	movs r2, #2
	bl FaceDirection
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_FaceUp_Step0

	thumb_func_start MovementAction_FaceLeft_Step0
MovementAction_FaceLeft_Step0: @ 0x080932E0
	push {lr}
	movs r2, #3
	bl FaceDirection
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_FaceLeft_Step0

	thumb_func_start MovementAction_FaceRight_Step0
MovementAction_FaceRight_Step0: @ 0x080932F0
	push {lr}
	movs r2, #4
	bl FaceDirection
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_FaceRight_Step0

	thumb_func_start npc_apply_direction
npc_apply_direction: @ 0x08093300
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldrh r1, [r7, #0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r7, #0x12]
	mov r5, sp
	adds r5, #2
	strh r0, [r5]
	adds r0, r7, #0
	adds r1, r4, #0
	bl SetEventObjectDirection
	adds r0, r4, #0
	mov r1, sp
	adds r2, r5, #0
	bl MoveCoords
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r7, #0
	bl ShiftEventObjectCoords
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl oamt_npc_ministep_reset
	mov r4, r8
	adds r4, #0x2c
	ldrb r1, [r4]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldr r0, _08093398
	ldr r0, [r0]
	cmp r0, #0
	beq _0809337E
	adds r0, r7, #0
	bl FindLockedEventObjectIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _0809337E
	ldrb r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4]
_0809337E:
	ldrb r0, [r7]
	movs r1, #4
	orrs r0, r1
	strb r0, [r7]
	movs r0, #1
	mov r1, r8
	strh r0, [r1, #0x32]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093398: .4byte 0x02037258
	thumb_func_end npc_apply_direction

	thumb_func_start do_go_anim
do_go_anim: @ 0x0809339C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r5, r0, #0
	mov r8, r1
	adds r4, r3, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, sp
	ldr r0, _080933F4
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	ldm r0!, {r3, r6}
	stm r1!, {r3, r6}
	adds r0, r5, #0
	mov r1, r8
	adds r3, r4, #0
	bl npc_apply_direction
	lsls r4, r4, #2
	mov r7, sp
	adds r1, r7, r4
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	ldr r1, [r1]
	bl _call_via_r1
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	mov r1, r8
	bl npc_apply_anim_looping
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080933F4: .4byte 0x084E633C
	thumb_func_end do_go_anim

	thumb_func_start StartRunningAnim
StartRunningAnim: @ 0x080933F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #1
	bl npc_apply_direction
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetWalkSlowMovementAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl npc_apply_anim_looping
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end StartRunningAnim

	thumb_func_start npc_obj_ministep_stop_on_arrival
npc_obj_ministep_stop_on_arrival: @ 0x08093428
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl obj_npc_ministep
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809343E
	movs r0, #0
	b _0809345A
_0809343E:
	adds r0, r4, #0
	bl ShiftStillEventObjectCoords
	ldrb r0, [r4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
_0809345A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end npc_obj_ministep_stop_on_arrival

	thumb_func_start sub_08093460
sub_08093460: @ 0x08093460
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	lsls r5, r2, #0x18
	lsrs r5, r5, #0x18
	ldrh r1, [r6, #0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, #0x12]
	mov r4, sp
	adds r4, #2
	strh r0, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl SetEventObjectDirection
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl MoveCoords
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r0, r6, #0
	bl ShiftEventObjectCoords
	mov r0, r8
	adds r1, r5, #0
	bl sub_0809704C
	mov r2, r8
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	movs r1, #4
	orrs r0, r1
	strb r0, [r6]
	movs r0, #1
	mov r1, r8
	strh r0, [r1, #0x32]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08093460

	thumb_func_start sub_080934D0
sub_080934D0: @ 0x080934D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_08093460
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl npc_apply_anim_looping
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_080934D0

	thumb_func_start an_walk_any_2
an_walk_any_2: @ 0x080934FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl sub_0809705C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093512
	movs r0, #0
	b _0809352E
_08093512:
	adds r0, r4, #0
	bl ShiftStillEventObjectCoords
	ldrb r0, [r4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
_0809352E:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end an_walk_any_2

	thumb_func_start MovementAction_WalkSlowDiagonalUpLeft_Step0
MovementAction_WalkSlowDiagonalUpLeft_Step0: @ 0x08093534
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #7
	bl sub_080934D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08093554
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDiagonalUpLeft_Step0

	thumb_func_start sub_08093554
sub_08093554: @ 0x08093554
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093566
	movs r0, #0
	b _0809356C
_08093566:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809356C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08093554

	thumb_func_start MovementAction_WalkSlowDiagonalUpRight_Step0
MovementAction_WalkSlowDiagonalUpRight_Step0: @ 0x08093574
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #8
	bl sub_080934D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkSlowDiagonalUpRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDiagonalUpRight_Step0

	thumb_func_start MovementAction_WalkSlowDiagonalUpRight_Step1
MovementAction_WalkSlowDiagonalUpRight_Step1: @ 0x08093594
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080935A6
	movs r0, #0
	b _080935AC
_080935A6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080935AC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDiagonalUpRight_Step1

	thumb_func_start MovementAction_WalkSlowDiagonalDownLeft_Step0
MovementAction_WalkSlowDiagonalDownLeft_Step0: @ 0x080935B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #5
	bl sub_080934D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkSlowDiagonalDownLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDiagonalDownLeft_Step0

	thumb_func_start MovementAction_WalkSlowDiagonalDownLeft_Step1
MovementAction_WalkSlowDiagonalDownLeft_Step1: @ 0x080935D4
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080935E6
	movs r0, #0
	b _080935EC
_080935E6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080935EC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDiagonalDownLeft_Step1

	thumb_func_start MovementAction_WalkSlowDiagonalDownRight_Step0
MovementAction_WalkSlowDiagonalDownRight_Step0: @ 0x080935F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #6
	bl sub_080934D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkSlowDiagonalDownRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDiagonalDownRight_Step0

	thumb_func_start MovementAction_WalkSlowDiagonalDownRight_Step1
MovementAction_WalkSlowDiagonalDownRight_Step1: @ 0x08093614
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093626
	movs r0, #0
	b _0809362C
_08093626:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809362C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDiagonalDownRight_Step1

	thumb_func_start MovementAction_WalkSlowDown_Step0
MovementAction_WalkSlowDown_Step0: @ 0x08093634
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	bl sub_080934D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkSlowDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDown_Step0

	thumb_func_start MovementAction_WalkSlowDown_Step1
MovementAction_WalkSlowDown_Step1: @ 0x08093654
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093666
	movs r0, #0
	b _0809366C
_08093666:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809366C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowDown_Step1

	thumb_func_start MovementAction_WalkSlowUp_Step0
MovementAction_WalkSlowUp_Step0: @ 0x08093674
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	bl sub_080934D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkSlowUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowUp_Step0

	thumb_func_start MovementAction_WalkSlowUp_Step1
MovementAction_WalkSlowUp_Step1: @ 0x08093694
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080936A6
	movs r0, #0
	b _080936AC
_080936A6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080936AC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowUp_Step1

	thumb_func_start MovementAction_WalkSlowLeft_Step0
MovementAction_WalkSlowLeft_Step0: @ 0x080936B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	bl sub_080934D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkSlowLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowLeft_Step0

	thumb_func_start MovementAction_WalkSlowLeft_Step1
MovementAction_WalkSlowLeft_Step1: @ 0x080936D4
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080936E6
	movs r0, #0
	b _080936EC
_080936E6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080936EC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowLeft_Step1

	thumb_func_start MovementAction_WalkSlowRight_Step0
MovementAction_WalkSlowRight_Step0: @ 0x080936F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	bl sub_080934D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkSlowRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowRight_Step0

	thumb_func_start MovementAction_WalkSlowRight_Step1
MovementAction_WalkSlowRight_Step1: @ 0x08093714
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093726
	movs r0, #0
	b _0809372C
_08093726:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809372C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkSlowRight_Step1

	thumb_func_start MovementAction_WalkNormalDiagonalUpLeft_Step0
MovementAction_WalkNormalDiagonalUpLeft_Step0: @ 0x08093734
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #7
	movs r3, #0
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkNormalDiagonalUpLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkNormalDiagonalUpLeft_Step0

	thumb_func_start MovementAction_WalkNormalDiagonalUpLeft_Step1
MovementAction_WalkNormalDiagonalUpLeft_Step1: @ 0x08093754
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093766
	movs r0, #0
	b _0809376C
_08093766:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809376C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkNormalDiagonalUpLeft_Step1

	thumb_func_start MovementAction_WalkNormalDiagonalUpRight_Step0
MovementAction_WalkNormalDiagonalUpRight_Step0: @ 0x08093774
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #8
	movs r3, #0
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkNormalDiagonalUpRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkNormalDiagonalUpRight_Step0

	thumb_func_start MovementAction_WalkNormalDiagonalUpRight_Step1
MovementAction_WalkNormalDiagonalUpRight_Step1: @ 0x08093794
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080937A6
	movs r0, #0
	b _080937AC
_080937A6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080937AC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkNormalDiagonalUpRight_Step1

	thumb_func_start MovementAction_WalkNormalDiagonalDownLeft_Step0
MovementAction_WalkNormalDiagonalDownLeft_Step0: @ 0x080937B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #5
	movs r3, #0
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkNormalDiagonalDownLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkNormalDiagonalDownLeft_Step0

	thumb_func_start MovementAction_WalkNormalDiagonalDownLeft_Step1
MovementAction_WalkNormalDiagonalDownLeft_Step1: @ 0x080937D4
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080937E6
	movs r0, #0
	b _080937EC
_080937E6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080937EC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkNormalDiagonalDownLeft_Step1

	thumb_func_start MovementAction_WalkNormalDiagonalDownRight_Step0
MovementAction_WalkNormalDiagonalDownRight_Step0: @ 0x080937F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #6
	movs r3, #0
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkNormalDiagonalDownRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkNormalDiagonalDownRight_Step0

	thumb_func_start MovementAction_WalkNormalDiagonalDownRight_Step1
MovementAction_WalkNormalDiagonalDownRight_Step1: @ 0x08093814
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093826
	movs r0, #0
	b _0809382C
_08093826:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809382C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkNormalDiagonalDownRight_Step1

	thumb_func_start MovementAction_WalkNormalDown_Step0
MovementAction_WalkNormalDown_Step0: @ 0x08093834
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	movs r3, #0
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkNormalDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkNormalDown_Step0

	thumb_func_start MovementAction_WalkNormalDown_Step1
MovementAction_WalkNormalDown_Step1: @ 0x08093854
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093866
	movs r0, #0
	b _0809386C
_08093866:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809386C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkNormalDown_Step1

	thumb_func_start MovementAction_WalkNormalUp_Step0
MovementAction_WalkNormalUp_Step0: @ 0x08093874
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	movs r3, #0
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkNormalUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkNormalUp_Step0

	thumb_func_start MovementAction_WalkNormalUp_Step1
MovementAction_WalkNormalUp_Step1: @ 0x08093894
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080938A6
	movs r0, #0
	b _080938AC
_080938A6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080938AC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkNormalUp_Step1

	thumb_func_start MovementAction_WalkNormalLeft_Step0
MovementAction_WalkNormalLeft_Step0: @ 0x080938B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	movs r3, #0
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkNormalLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkNormalLeft_Step0

	thumb_func_start MovementAction_WalkNormalLeft_Step1
MovementAction_WalkNormalLeft_Step1: @ 0x080938D4
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080938E6
	movs r0, #0
	b _080938EC
_080938E6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080938EC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkNormalLeft_Step1

	thumb_func_start MovementAction_WalkNormalRight_Step0
MovementAction_WalkNormalRight_Step0: @ 0x080938F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	movs r3, #0
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkNormalRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkNormalRight_Step0

	thumb_func_start MovementAction_WalkNormalRight_Step1
MovementAction_WalkNormalRight_Step1: @ 0x08093914
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093926
	movs r0, #0
	b _0809392C
_08093926:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809392C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkNormalRight_Step1

	thumb_func_start sub_08093934
sub_08093934: @ 0x08093934
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	mov sl, r1
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x30]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _080939EC
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	add r5, sp, #0xc
	movs r0, #0
	strh r0, [r5]
	mov r6, sp
	adds r6, #0xe
	strh r0, [r6]
	adds r0, r7, #0
	adds r1, r4, #0
	bl SetEventObjectDirection
	mov r1, r8
	lsls r0, r1, #1
	add r0, sp
	adds r0, #4
	movs r1, #0
	ldrsh r3, [r0, r1]
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl MoveCoordsInDirection
	ldrh r1, [r5]
	ldrh r0, [r7, #0x10]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r6]
	ldrh r0, [r7, #0x12]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r7, #0
	bl ShiftEventObjectCoords
	mov r0, sl
	adds r1, r4, #0
	mov r2, r8
	mov r3, sb
	bl sub_080971AC
	movs r0, #1
	mov r1, sl
	strh r0, [r1, #0x32]
	movs r0, #0x2c
	add sl, r0
	mov r0, sl
	ldrb r1, [r0]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080939EC: .4byte 0x084E6410
	thumb_func_end sub_08093934

	thumb_func_start maybe_shadow_1
maybe_shadow_1: @ 0x080939F0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x10]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r4, #0
	bl sub_08093934
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl npc_apply_anim_looping
	adds r0, r4, #0
	bl DoShadowFieldEffect
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end maybe_shadow_1

	thumb_func_start sub_08093A34
sub_08093A34: @ 0x08093A34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r1, _08093AC0
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	adds r0, r7, #0
	bl _call_via_r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #1
	bne _08093AC4
	movs r1, #0x36
	ldrsh r0, [r7, r1]
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _08093AC4
	add r4, sp, #0xc
	movs r0, #0
	strh r0, [r4]
	mov r5, sp
	adds r5, #0xe
	strh r0, [r5]
	ldrb r0, [r6, #0x18]
	lsrs r0, r0, #4
	movs r2, #0x36
	ldrsh r1, [r7, r2]
	lsls r1, r1, #1
	add r1, sp
	adds r1, #4
	movs r2, #0
	ldrsh r3, [r1, r2]
	str r3, [sp]
	adds r1, r4, #0
	adds r2, r5, #0
	bl MoveCoordsInDirection
	ldrh r1, [r4]
	ldrh r0, [r6, #0x10]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r5]
	ldrh r0, [r6, #0x12]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	bl ShiftEventObjectCoords
	ldrb r0, [r6]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r6]
	b _08093AE8
	.align 2, 0
_08093AC0: .4byte 0x084E6416
_08093AC4:
	mov r1, r8
	cmp r1, #0xff
	bne _08093AE8
	adds r0, r6, #0
	bl ShiftStillEventObjectCoords
	ldrb r0, [r6]
	movs r1, #8
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r6]
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
_08093AE8:
	mov r0, r8
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08093A34

	thumb_func_start sub_08093AF8
sub_08093AF8: @ 0x08093AF8
	push {lr}
	ldr r2, _08093B08
	bl sub_08093A34
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08093B08: .4byte 0x080971CD
	thumb_func_end sub_08093AF8

	thumb_func_start sub_08093B0C
sub_08093B0C: @ 0x08093B0C
	push {lr}
	ldr r2, _08093B1C
	bl sub_08093A34
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08093B1C: .4byte 0x08097255
	thumb_func_end sub_08093B0C

	thumb_func_start sub_08093B20
sub_08093B20: @ 0x08093B20
	push {lr}
	bl sub_08093AF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08093B32
	movs r0, #0
	b _08093B34
_08093B32:
	movs r0, #1
_08093B34:
	pop {r1}
	bx r1
	thumb_func_end sub_08093B20

	thumb_func_start sub_08093B38
sub_08093B38: @ 0x08093B38
	push {lr}
	bl sub_08093B0C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08093B4A
	movs r0, #0
	b _08093B4C
_08093B4A:
	movs r0, #1
_08093B4C:
	pop {r1}
	bx r1
	thumb_func_end sub_08093B38

	thumb_func_start sub_08093B50
sub_08093B50: @ 0x08093B50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093AF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08093B6A
	cmp r0, #0xff
	bne _08093B96
	movs r0, #1
	b _08093B98
_08093B6A:
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	bl GetOppositeDirection
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetEventObjectDirection
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl obj_npc_animation_step
_08093B96:
	movs r0, #0
_08093B98:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08093B50

	thumb_func_start MovementAction_Jump2Down_Step0
MovementAction_Jump2Down_Step0: @ 0x08093BA0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_Jump2Down_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Jump2Down_Step0

	thumb_func_start MovementAction_Jump2Down_Step1
MovementAction_Jump2Down_Step1: @ 0x08093BCC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093BE0
	movs r0, #0
	b _08093BF0
_08093BE0:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08093BF0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Jump2Down_Step1

	thumb_func_start MovementAction_Jump2Up_Step0
MovementAction_Jump2Up_Step0: @ 0x08093BF8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #2
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_Jump2Up_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Jump2Up_Step0

	thumb_func_start MovementAction_Jump2Up_Step1
MovementAction_Jump2Up_Step1: @ 0x08093C24
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093C38
	movs r0, #0
	b _08093C48
_08093C38:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08093C48:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Jump2Up_Step1

	thumb_func_start MovementAction_Jump2Left_Step0
MovementAction_Jump2Left_Step0: @ 0x08093C50
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #2
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_Jump2Left_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Jump2Left_Step0

	thumb_func_start MovementAction_Jump2Left_Step1
MovementAction_Jump2Left_Step1: @ 0x08093C7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093C90
	movs r0, #0
	b _08093CA0
_08093C90:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08093CA0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Jump2Left_Step1

	thumb_func_start MovementAction_Jump2Right_Step0
MovementAction_Jump2Right_Step0: @ 0x08093CA8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #2
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_Jump2Right_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Jump2Right_Step0

	thumb_func_start MovementAction_Jump2Right_Step1
MovementAction_Jump2Right_Step1: @ 0x08093CD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093CE8
	movs r0, #0
	b _08093CF8
_08093CE8:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08093CF8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Jump2Right_Step1

	thumb_func_start sub_08093D00
sub_08093D00: @ 0x08093D00
	movs r2, #1
	strh r2, [r0, #0x32]
	strh r1, [r0, #0x34]
	bx lr
	thumb_func_end sub_08093D00

	thumb_func_start MovementAction_Delay_Step1
MovementAction_Delay_Step1: @ 0x08093D08
	push {lr}
	ldrh r0, [r1, #0x34]
	subs r0, #1
	strh r0, [r1, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08093D1A
	movs r0, #0
	b _08093D20
_08093D1A:
	movs r0, #2
	strh r0, [r1, #0x32]
	movs r0, #1
_08093D20:
	pop {r1}
	bx r1
	thumb_func_end MovementAction_Delay_Step1

	thumb_func_start MovementAction_Delay1_Step0
MovementAction_Delay1_Step0: @ 0x08093D24
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #1
	bl sub_08093D00
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_Delay_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_Delay1_Step0

	thumb_func_start MovementAction_Delay2_Step0
MovementAction_Delay2_Step0: @ 0x08093D44
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #2
	bl sub_08093D00
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_Delay_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_Delay2_Step0

	thumb_func_start MovementAction_Delay4_Step0
MovementAction_Delay4_Step0: @ 0x08093D64
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #4
	bl sub_08093D00
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_Delay_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_Delay4_Step0

	thumb_func_start MovementAction_Delay8_Step0
MovementAction_Delay8_Step0: @ 0x08093D84
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #8
	bl sub_08093D00
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_Delay_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_Delay8_Step0

	thumb_func_start MovementAction_Delay16_Step0
MovementAction_Delay16_Step0: @ 0x08093DA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_08093D00
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_Delay_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_Delay16_Step0

	thumb_func_start MovementAction_WalkFastDown_Step0
MovementAction_WalkFastDown_Step0: @ 0x08093DC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	movs r3, #1
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkFastDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkFastDown_Step0

	thumb_func_start MovementAction_WalkFastDown_Step1
MovementAction_WalkFastDown_Step1: @ 0x08093DE4
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093DF6
	movs r0, #0
	b _08093DFC
_08093DF6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08093DFC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkFastDown_Step1

	thumb_func_start MovementAction_WalkFastUp_Step0
MovementAction_WalkFastUp_Step0: @ 0x08093E04
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	movs r3, #1
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkFastUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkFastUp_Step0

	thumb_func_start MovementAction_WalkFastUp_Step1
MovementAction_WalkFastUp_Step1: @ 0x08093E24
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093E36
	movs r0, #0
	b _08093E3C
_08093E36:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08093E3C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkFastUp_Step1

	thumb_func_start MovementAction_WalkFastLeft_Step0
MovementAction_WalkFastLeft_Step0: @ 0x08093E44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	movs r3, #1
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkFastLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkFastLeft_Step0

	thumb_func_start MovementAction_WalkFastLeft_Step1
MovementAction_WalkFastLeft_Step1: @ 0x08093E64
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093E76
	movs r0, #0
	b _08093E7C
_08093E76:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08093E7C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkFastLeft_Step1

	thumb_func_start MovementAction_WalkFastRight_Step0
MovementAction_WalkFastRight_Step0: @ 0x08093E84
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	movs r3, #1
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkFastRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkFastRight_Step0

	thumb_func_start MovementAction_WalkFastRight_Step1
MovementAction_WalkFastRight_Step1: @ 0x08093EA4
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093EB6
	movs r0, #0
	b _08093EBC
_08093EB6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08093EBC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkFastRight_Step1

	thumb_func_start sub_08093EC4
sub_08093EC4: @ 0x08093EC4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	ldr r5, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl SetEventObjectDirection
	mov r0, r8
	adds r1, r6, #0
	adds r2, r4, #0
	bl npc_apply_anim_looping
	adds r2, r6, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r6, #0x32]
	strh r5, [r6, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08093EC4

	thumb_func_start MovementAction_WalkInPlace_Step1
MovementAction_WalkInPlace_Step1: @ 0x08093F0C
	push {lr}
	ldrh r0, [r1, #0x34]
	subs r0, #1
	strh r0, [r1, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08093F1E
	movs r0, #0
	b _08093F30
_08093F1E:
	movs r0, #2
	strh r0, [r1, #0x32]
	adds r2, r1, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
_08093F30:
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkInPlace_Step1

	thumb_func_start MovementAction_WalkInPlaceSlow_Step1
MovementAction_WalkInPlaceSlow_Step1: @ 0x08093F34
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrh r1, [r4, #0x34]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093F5E
	adds r3, r4, #0
	adds r3, #0x2c
	ldrb r2, [r3]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1a
	adds r1, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08093F5E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkInPlaceSlow_Step1

	thumb_func_start MovementAction_WalkInPlaceSlowDown_Step0
MovementAction_WalkInPlaceSlowDown_Step0: @ 0x08093F70
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x20
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlaceSlow_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceSlowDown_Step0

	thumb_func_start MovementAction_WalkInPlaceSlowUp_Step0
MovementAction_WalkInPlaceSlowUp_Step0: @ 0x08093FA8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x20
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlaceSlow_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceSlowUp_Step0

	thumb_func_start MovementAction_WalkInPlaceSlowLeft_Step0
MovementAction_WalkInPlaceSlowLeft_Step0: @ 0x08093FE0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #3
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x20
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlaceSlow_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceSlowLeft_Step0

	thumb_func_start MovementAction_WalkInPlaceSlowRight_Step0
MovementAction_WalkInPlaceSlowRight_Step0: @ 0x08094018
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #4
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x20
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlaceSlow_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceSlowRight_Step0

	thumb_func_start MovementAction_WalkInPlaceNormalDown_Step0
MovementAction_WalkInPlaceNormalDown_Step0: @ 0x08094050
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceNormalDown_Step0

	thumb_func_start MovementAction_WalkInPlaceNormalUp_Step0
MovementAction_WalkInPlaceNormalUp_Step0: @ 0x08094088
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceNormalUp_Step0

	thumb_func_start MovementAction_WalkInPlaceNormalLeft_Step0
MovementAction_WalkInPlaceNormalLeft_Step0: @ 0x080940C0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #3
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceNormalLeft_Step0

	thumb_func_start MovementAction_WalkInPlaceNormalRight_Step0
MovementAction_WalkInPlaceNormalRight_Step0: @ 0x080940F8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #4
	bl GetJumpInPlaceTurnAroundMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceNormalRight_Step0

	thumb_func_start MovementAction_WalkInPlaceFastDown_Step0
MovementAction_WalkInPlaceFastDown_Step0: @ 0x08094130
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl GetJumpMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceFastDown_Step0

	thumb_func_start MovementAction_WalkInPlaceFastUp_Step0
MovementAction_WalkInPlaceFastUp_Step0: @ 0x08094168
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	bl GetJumpMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceFastUp_Step0

	thumb_func_start MovementAction_WalkInPlaceFastLeft_Step0
MovementAction_WalkInPlaceFastLeft_Step0: @ 0x080941A0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #3
	bl GetJumpMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceFastLeft_Step0

	thumb_func_start MovementAction_WalkInPlaceFastRight_Step0
MovementAction_WalkInPlaceFastRight_Step0: @ 0x080941D8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #4
	bl GetJumpMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceFastRight_Step0

	thumb_func_start MovementAction_WalkInPlaceFastestDown_Step0
MovementAction_WalkInPlaceFastestDown_Step0: @ 0x08094210
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl GetJumpSpecialMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceFastestDown_Step0

	thumb_func_start MovementAction_WalkInPlaceFastestUp_Step0
MovementAction_WalkInPlaceFastestUp_Step0: @ 0x08094248
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	bl GetJumpSpecialMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceFastestUp_Step0

	thumb_func_start MovementAction_WalkInPlaceFastestLeft_Step0
MovementAction_WalkInPlaceFastestLeft_Step0: @ 0x08094280
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #3
	bl GetJumpSpecialMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceFastestLeft_Step0

	thumb_func_start MovementAction_WalkInPlaceFastestRight_Step0
MovementAction_WalkInPlaceFastestRight_Step0: @ 0x080942B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #4
	bl GetJumpSpecialMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkInPlaceFastestRight_Step0

	thumb_func_start MovementAction_RideWaterCurrentDown_Step0
MovementAction_RideWaterCurrentDown_Step0: @ 0x080942F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	movs r3, #2
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_RideWaterCurrentDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_RideWaterCurrentDown_Step0

	thumb_func_start MovementAction_RideWaterCurrentDown_Step1
MovementAction_RideWaterCurrentDown_Step1: @ 0x08094310
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094322
	movs r0, #0
	b _08094328
_08094322:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094328:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_RideWaterCurrentDown_Step1

	thumb_func_start MovementAction_RideWaterCurrentUp_Step0
MovementAction_RideWaterCurrentUp_Step0: @ 0x08094330
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	movs r3, #2
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_RideWaterCurrentUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_RideWaterCurrentUp_Step0

	thumb_func_start MovementAction_RideWaterCurrentUp_Step1
MovementAction_RideWaterCurrentUp_Step1: @ 0x08094350
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094362
	movs r0, #0
	b _08094368
_08094362:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094368:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_RideWaterCurrentUp_Step1

	thumb_func_start MovementAction_RideWaterCurrentLeft_Step0
MovementAction_RideWaterCurrentLeft_Step0: @ 0x08094370
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	movs r3, #2
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_RideWaterCurrentLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_RideWaterCurrentLeft_Step0

	thumb_func_start MovementAction_RideWaterCurrentLeft_Step1
MovementAction_RideWaterCurrentLeft_Step1: @ 0x08094390
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080943A2
	movs r0, #0
	b _080943A8
_080943A2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080943A8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_RideWaterCurrentLeft_Step1

	thumb_func_start MovementAction_RideWaterCurrentRight_Step0
MovementAction_RideWaterCurrentRight_Step0: @ 0x080943B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	movs r3, #2
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_RideWaterCurrentRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_RideWaterCurrentRight_Step0

	thumb_func_start MovementAction_RideWaterCurrentRight_Step1
MovementAction_RideWaterCurrentRight_Step1: @ 0x080943D0
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080943E2
	movs r0, #0
	b _080943E8
_080943E2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080943E8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_RideWaterCurrentRight_Step1

	thumb_func_start MovementAction_WalkFastestDown_Step0
MovementAction_WalkFastestDown_Step0: @ 0x080943F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	movs r3, #3
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkFastestDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkFastestDown_Step0

	thumb_func_start MovementAction_WalkFastestDown_Step1
MovementAction_WalkFastestDown_Step1: @ 0x08094410
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094422
	movs r0, #0
	b _08094428
_08094422:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094428:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkFastestDown_Step1

	thumb_func_start MovementAction_WalkFastestUp_Step0
MovementAction_WalkFastestUp_Step0: @ 0x08094430
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	movs r3, #3
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkFastestUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkFastestUp_Step0

	thumb_func_start MovementAction_WalkFastestUp_Step1
MovementAction_WalkFastestUp_Step1: @ 0x08094450
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094462
	movs r0, #0
	b _08094468
_08094462:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094468:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkFastestUp_Step1

	thumb_func_start MovementAction_WalkFastestLeft_Step0
MovementAction_WalkFastestLeft_Step0: @ 0x08094470
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	movs r3, #3
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkFastestLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkFastestLeft_Step0

	thumb_func_start MovementAction_WalkFastestLeft_Step1
MovementAction_WalkFastestLeft_Step1: @ 0x08094490
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080944A2
	movs r0, #0
	b _080944A8
_080944A2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080944A8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkFastestLeft_Step1

	thumb_func_start MovementAction_WalkFastestRight_Step0
MovementAction_WalkFastestRight_Step0: @ 0x080944B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	movs r3, #3
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkFastestRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkFastestRight_Step0

	thumb_func_start MovementAction_WalkFastestRight_Step1
MovementAction_WalkFastestRight_Step1: @ 0x080944D0
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080944E2
	movs r0, #0
	b _080944E8
_080944E2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080944E8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkFastestRight_Step1

	thumb_func_start MovementAction_SlideDown_Step0
MovementAction_SlideDown_Step0: @ 0x080944F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	movs r3, #4
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_SlideDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_SlideDown_Step0

	thumb_func_start MovementAction_SlideDown_Step1
MovementAction_SlideDown_Step1: @ 0x08094510
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094522
	movs r0, #0
	b _08094528
_08094522:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094528:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_SlideDown_Step1

	thumb_func_start MovementAction_SlideUp_Step0
MovementAction_SlideUp_Step0: @ 0x08094530
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	movs r3, #4
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_SlideUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_SlideUp_Step0

	thumb_func_start MovementAction_SlideUp_Step1
MovementAction_SlideUp_Step1: @ 0x08094550
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094562
	movs r0, #0
	b _08094568
_08094562:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094568:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_SlideUp_Step1

	thumb_func_start MovementAction_SlideLeft_Step0
MovementAction_SlideLeft_Step0: @ 0x08094570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	movs r3, #4
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_SlideLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_SlideLeft_Step0

	thumb_func_start MovementAction_SlideLeft_Step1
MovementAction_SlideLeft_Step1: @ 0x08094590
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080945A2
	movs r0, #0
	b _080945A8
_080945A2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080945A8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_SlideLeft_Step1

	thumb_func_start MovementAction_SlideRight_Step0
MovementAction_SlideRight_Step0: @ 0x080945B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	movs r3, #4
	bl do_go_anim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_SlideRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_SlideRight_Step0

	thumb_func_start MovementAction_SlideRight_Step1
MovementAction_SlideRight_Step1: @ 0x080945D0
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080945E2
	movs r0, #0
	b _080945E8
_080945E2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080945E8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_SlideRight_Step1

	thumb_func_start MovementAction_PlayerRunDown_Step0
MovementAction_PlayerRunDown_Step0: @ 0x080945F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	bl StartRunningAnim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_PlayerRunDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_PlayerRunDown_Step0

	thumb_func_start MovementAction_PlayerRunDown_Step1
MovementAction_PlayerRunDown_Step1: @ 0x08094610
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094622
	movs r0, #0
	b _08094628
_08094622:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094628:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_PlayerRunDown_Step1

	thumb_func_start MovementAction_PlayerRunUp_Step0
MovementAction_PlayerRunUp_Step0: @ 0x08094630
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	bl StartRunningAnim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_PlayerRunUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_PlayerRunUp_Step0

	thumb_func_start MovementAction_PlayerRunUp_Step1
MovementAction_PlayerRunUp_Step1: @ 0x08094650
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094662
	movs r0, #0
	b _08094668
_08094662:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094668:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_PlayerRunUp_Step1

	thumb_func_start MovementAction_PlayerRunLeft_Step0
MovementAction_PlayerRunLeft_Step0: @ 0x08094670
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	bl StartRunningAnim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_PlayerRunLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_PlayerRunLeft_Step0

	thumb_func_start MovementAction_PlayerRunLeft_Step1
MovementAction_PlayerRunLeft_Step1: @ 0x08094690
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080946A2
	movs r0, #0
	b _080946A8
_080946A2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080946A8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_PlayerRunLeft_Step1

	thumb_func_start MovementAction_PlayerRunRight_Step0
MovementAction_PlayerRunRight_Step0: @ 0x080946B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	bl StartRunningAnim
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_PlayerRunRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_PlayerRunRight_Step0

	thumb_func_start MovementAction_PlayerRunRight_Step1
MovementAction_PlayerRunRight_Step1: @ 0x080946D0
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080946E2
	movs r0, #0
	b _080946E8
_080946E2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080946E8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_PlayerRunRight_Step1

	thumb_func_start StartSpriteAnimInDirection
StartSpriteAnimInDirection: @ 0x080946F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	movs r2, #0
	bl SetAndStartSpriteAnim
	adds r0, r6, #0
	adds r1, r4, #0
	bl SetEventObjectDirection
	movs r0, #1
	strh r0, [r5, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end StartSpriteAnimInDirection

	thumb_func_start MovementAction_StartAnimInDirection_Step0
MovementAction_StartAnimInDirection_Step0: @ 0x0809471C
	push {lr}
	ldrb r2, [r0, #0x18]
	lsrs r2, r2, #4
	adds r3, r1, #0
	adds r3, #0x2a
	ldrb r3, [r3]
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_StartAnimInDirection_Step0

	thumb_func_start MovementAction_WaitSpriteAnim
MovementAction_WaitSpriteAnim: @ 0x08094734
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl SpriteAnimEnded
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094748
	movs r0, #0
	b _0809474E
_08094748:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_0809474E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WaitSpriteAnim

	thumb_func_start sub_08094754
sub_08094754: @ 0x08094754
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_08093934
	adds r0, r4, #0
	bl GetRideWaterCurrentMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnim
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08094754

	thumb_func_start MovementAction_JumpSpecialDown_Step0
MovementAction_JumpSpecialDown_Step0: @ 0x08094788
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	bl sub_08094754
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpSpecialDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpSpecialDown_Step0

	thumb_func_start MovementAction_JumpSpecialDown_Step1
MovementAction_JumpSpecialDown_Step1: @ 0x080947A8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080947BC
	movs r0, #0
	b _080947CA
_080947BC:
	movs r0, #2
	strh r0, [r5, #0x32]
	ldrb r1, [r4]
	subs r0, #0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, #1
_080947CA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_JumpSpecialDown_Step1

	thumb_func_start MovementAction_JumpSpecialUp_Step0
MovementAction_JumpSpecialUp_Step0: @ 0x080947D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	bl sub_08094754
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpSpecialUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpSpecialUp_Step0

	thumb_func_start MovementAction_JumpSpecialUp_Step1
MovementAction_JumpSpecialUp_Step1: @ 0x080947F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094804
	movs r0, #0
	b _08094812
_08094804:
	movs r0, #2
	strh r0, [r5, #0x32]
	ldrb r1, [r4]
	subs r0, #0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, #1
_08094812:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_JumpSpecialUp_Step1

	thumb_func_start MovementAction_JumpSpecialLeft_Step0
MovementAction_JumpSpecialLeft_Step0: @ 0x08094818
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	bl sub_08094754
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpSpecialLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpSpecialLeft_Step0

	thumb_func_start MovementAction_JumpSpecialLeft_Step1
MovementAction_JumpSpecialLeft_Step1: @ 0x08094838
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809484C
	movs r0, #0
	b _0809485A
_0809484C:
	movs r0, #2
	strh r0, [r5, #0x32]
	ldrb r1, [r4]
	subs r0, #0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, #1
_0809485A:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_JumpSpecialLeft_Step1

	thumb_func_start MovementAction_JumpSpecialRight_Step0
MovementAction_JumpSpecialRight_Step0: @ 0x08094860
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	bl sub_08094754
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpSpecialRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpSpecialRight_Step0

	thumb_func_start MovementAction_JumpSpecialRight_Step1
MovementAction_JumpSpecialRight_Step1: @ 0x08094880
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094894
	movs r0, #0
	b _080948A2
_08094894:
	movs r0, #2
	strh r0, [r5, #0x32]
	ldrb r1, [r4]
	subs r0, #0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, #1
_080948A2:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_JumpSpecialRight_Step1

	thumb_func_start MovementAction_FacePlayer_Step0
MovementAction_FacePlayer_Step0: @ 0x080948A8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080948F2
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	ldr r4, _08094900
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, #3
	adds r3, r3, r2
	lsls r3, r3, #2
	adds r3, r3, r4
	movs r4, #0x10
	ldrsh r2, [r3, r4]
	movs r4, #0x12
	ldrsh r3, [r3, r4]
	bl GetDirectionToFace
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl FaceDirection
_080948F2:
	movs r0, #1
	strh r0, [r6, #0x32]
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08094900: .4byte 0x02036FF0
	thumb_func_end MovementAction_FacePlayer_Step0

	thumb_func_start MovementAction_FaceAwayPlayer_Step0
MovementAction_FaceAwayPlayer_Step0: @ 0x08094904
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	mov r3, sp
	bl TryGetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094956
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	ldr r4, _08094964
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, #3
	adds r3, r3, r2
	lsls r3, r3, #2
	adds r3, r3, r4
	movs r4, #0x10
	ldrsh r2, [r3, r4]
	movs r4, #0x12
	ldrsh r3, [r3, r4]
	bl GetDirectionToFace
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetOppositeDirection
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl FaceDirection
_08094956:
	movs r0, #1
	strh r0, [r6, #0x32]
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08094964: .4byte 0x02036FF0
	thumb_func_end MovementAction_FaceAwayPlayer_Step0

	thumb_func_start MovementAction_LockFacingDirection_Step0
MovementAction_LockFacingDirection_Step0: @ 0x08094968
	ldrb r2, [r0, #1]
	movs r3, #2
	orrs r2, r3
	strb r2, [r0, #1]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	.align 2, 0
	thumb_func_end MovementAction_LockFacingDirection_Step0

	thumb_func_start MovementAction_UnlockFacingDirection_Step0
MovementAction_UnlockFacingDirection_Step0: @ 0x08094978
	ldrb r3, [r0, #1]
	movs r2, #3
	rsbs r2, r2, #0
	ands r2, r3
	strb r2, [r0, #1]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	thumb_func_end MovementAction_UnlockFacingDirection_Step0

	thumb_func_start MovementAction_JumpDown_Step0
MovementAction_JumpDown_Step0: @ 0x08094988
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #1
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpDown_Step0

	thumb_func_start MovementAction_JumpDown_Step1
MovementAction_JumpDown_Step1: @ 0x080949B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080949C8
	movs r0, #0
	b _080949D8
_080949C8:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_080949D8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpDown_Step1

	thumb_func_start MovementAction_JumpUp_Step0
MovementAction_JumpUp_Step0: @ 0x080949E0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #1
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpUp_Step0

	thumb_func_start MovementAction_JumpUp_Step1
MovementAction_JumpUp_Step1: @ 0x08094A0C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094A20
	movs r0, #0
	b _08094A30
_08094A20:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094A30:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpUp_Step1

	thumb_func_start MovementAction_JumpLeft_Step0
MovementAction_JumpLeft_Step0: @ 0x08094A38
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #1
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpLeft_Step0

	thumb_func_start MovementAction_JumpLeft_Step1
MovementAction_JumpLeft_Step1: @ 0x08094A64
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094A78
	movs r0, #0
	b _08094A88
_08094A78:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094A88:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpLeft_Step1

	thumb_func_start MovementAction_JumpRight_Step0
MovementAction_JumpRight_Step0: @ 0x08094A90
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #1
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpRight_Step0

	thumb_func_start MovementAction_JumpRight_Step1
MovementAction_JumpRight_Step1: @ 0x08094ABC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094AD0
	movs r0, #0
	b _08094AE0
_08094AD0:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094AE0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpRight_Step1

	thumb_func_start MovementAction_JumpInPlaceDown_Step0
MovementAction_JumpInPlaceDown_Step0: @ 0x08094AE8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpInPlaceDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceDown_Step0

	thumb_func_start MovementAction_JumpInPlaceDown_Step1
MovementAction_JumpInPlaceDown_Step1: @ 0x08094B14
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094B28
	movs r0, #0
	b _08094B38
_08094B28:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094B38:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceDown_Step1

	thumb_func_start MovementAction_JumpInPlaceUp_Step0
MovementAction_JumpInPlaceUp_Step0: @ 0x08094B40
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #0
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpInPlaceUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceUp_Step0

	thumb_func_start MovementAction_JumpInPlaceUp_Step1
MovementAction_JumpInPlaceUp_Step1: @ 0x08094B6C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094B80
	movs r0, #0
	b _08094B90
_08094B80:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094B90:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceUp_Step1

	thumb_func_start MovementAction_JumpInPlaceLeft_Step0
MovementAction_JumpInPlaceLeft_Step0: @ 0x08094B98
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #0
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpInPlaceLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceLeft_Step0

	thumb_func_start MovementAction_JumpInPlaceLeft_Step1
MovementAction_JumpInPlaceLeft_Step1: @ 0x08094BC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094BD8
	movs r0, #0
	b _08094BE8
_08094BD8:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094BE8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceLeft_Step1

	thumb_func_start MovementAction_JumpInPlaceRight_Step0
MovementAction_JumpInPlaceRight_Step0: @ 0x08094BF0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #0
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpInPlaceRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceRight_Step0

	thumb_func_start MovementAction_JumpInPlaceRight_Step1
MovementAction_JumpInPlaceRight_Step1: @ 0x08094C1C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094C30
	movs r0, #0
	b _08094C40
_08094C30:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094C40:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceRight_Step1

	thumb_func_start MovementAction_JumpInPlaceDownUp_Step0
MovementAction_JumpInPlaceDownUp_Step0: @ 0x08094C48
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpInPlaceDownUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceDownUp_Step0

	thumb_func_start MovementAction_JumpInPlaceDownUp_Step1
MovementAction_JumpInPlaceDownUp_Step1: @ 0x08094C74
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B50
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094C88
	movs r0, #0
	b _08094C98
_08094C88:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094C98:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceDownUp_Step1

	thumb_func_start MovementAction_JumpInPlaceUpDown_Step0
MovementAction_JumpInPlaceUpDown_Step0: @ 0x08094CA0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #0
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpInPlaceUpDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceUpDown_Step0

	thumb_func_start MovementAction_JumpInPlaceUpDown_Step1
MovementAction_JumpInPlaceUpDown_Step1: @ 0x08094CCC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B50
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094CE0
	movs r0, #0
	b _08094CF0
_08094CE0:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094CF0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceUpDown_Step1

	thumb_func_start MovementAction_JumpInPlaceLeftRight_Step0
MovementAction_JumpInPlaceLeftRight_Step0: @ 0x08094CF8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #0
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpInPlaceLeftRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceLeftRight_Step0

	thumb_func_start MovementAction_JumpInPlaceLeftRight_Step1
MovementAction_JumpInPlaceLeftRight_Step1: @ 0x08094D24
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B50
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094D38
	movs r0, #0
	b _08094D48
_08094D38:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094D48:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceLeftRight_Step1

	thumb_func_start MovementAction_JumpInPlaceRightLeft_Step0
MovementAction_JumpInPlaceRightLeft_Step0: @ 0x08094D50
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #0
	bl maybe_shadow_1
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_JumpInPlaceRightLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceRightLeft_Step0

	thumb_func_start MovementAction_JumpInPlaceRightLeft_Step1
MovementAction_JumpInPlaceRightLeft_Step1: @ 0x08094D7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B50
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094D90
	movs r0, #0
	b _08094DA0
_08094D90:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094DA0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_JumpInPlaceRightLeft_Step1

	thumb_func_start MovementAction_FaceOriginalDirection_Step0
MovementAction_FaceOriginalDirection_Step0: @ 0x08094DA8
	push {lr}
	ldr r3, _08094DBC
	ldrb r2, [r0, #6]
	adds r2, r2, r3
	ldrb r2, [r2]
	bl FaceDirection
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_08094DBC: .4byte 0x084DDA21
	thumb_func_end MovementAction_FaceOriginalDirection_Step0

	thumb_func_start MovementAction_NurseJoyBowDown_Step0
MovementAction_NurseJoyBowDown_Step0: @ 0x08094DC0
	push {lr}
	movs r2, #1
	movs r3, #0x14
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end MovementAction_NurseJoyBowDown_Step0

	thumb_func_start MovementAction_EnableJumpLandingGroundEffect_Step0
MovementAction_EnableJumpLandingGroundEffect_Step0: @ 0x08094DD0
	ldrb r3, [r0, #3]
	movs r2, #3
	rsbs r2, r2, #0
	ands r2, r3
	strb r2, [r0, #3]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	thumb_func_end MovementAction_EnableJumpLandingGroundEffect_Step0

	thumb_func_start MovementAction_DisableJumpLandingGroundEffect_Step0
MovementAction_DisableJumpLandingGroundEffect_Step0: @ 0x08094DE0
	ldrb r2, [r0, #3]
	movs r3, #2
	orrs r2, r3
	strb r2, [r0, #3]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	.align 2, 0
	thumb_func_end MovementAction_DisableJumpLandingGroundEffect_Step0

	thumb_func_start MovementAction_DisableAnimation_Step0
MovementAction_DisableAnimation_Step0: @ 0x08094DF0
	ldrb r2, [r0, #1]
	movs r3, #0x10
	orrs r2, r3
	strb r2, [r0, #1]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	.align 2, 0
	thumb_func_end MovementAction_DisableAnimation_Step0

	thumb_func_start MovementAction_RestoreAnimation_Step0
MovementAction_RestoreAnimation_Step0: @ 0x08094E00
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #5]
	bl GetEventObjectGraphicsInfo
	ldrb r1, [r0, #0xc]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	lsls r1, r1, #4
	ldrb r2, [r4, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #1
	strh r0, [r5, #0x32]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_RestoreAnimation_Step0

	thumb_func_start MovementAction_SetInvisible_Step0
MovementAction_SetInvisible_Step0: @ 0x08094E2C
	ldrb r2, [r0, #1]
	movs r3, #0x20
	orrs r2, r3
	strb r2, [r0, #1]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	.align 2, 0
	thumb_func_end MovementAction_SetInvisible_Step0

	thumb_func_start MovementAction_SetVisible_Step0
MovementAction_SetVisible_Step0: @ 0x08094E3C
	ldrb r3, [r0, #1]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r2, r3
	strb r2, [r0, #1]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	thumb_func_end MovementAction_SetVisible_Step0

	thumb_func_start MovementAction_EmoteExclamationMark_Step0
MovementAction_EmoteExclamationMark_Step0: @ 0x08094E4C
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _08094E6C
	adds r2, r1, #4
	adds r3, r1, #0
	adds r3, #8
	bl EventObjectGetLocalIdAndMap
	movs r0, #0
	bl FieldEffectStart
	movs r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08094E6C: .4byte 0x020388A8
	thumb_func_end MovementAction_EmoteExclamationMark_Step0

	thumb_func_start MovementAction_EmoteQuestionMark_Step0
MovementAction_EmoteQuestionMark_Step0: @ 0x08094E70
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _08094E90
	adds r2, r1, #4
	adds r3, r1, #0
	adds r3, #8
	bl EventObjectGetLocalIdAndMap
	movs r0, #0x21
	bl FieldEffectStart
	movs r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08094E90: .4byte 0x020388A8
	thumb_func_end MovementAction_EmoteQuestionMark_Step0

	thumb_func_start MovementAction_EmoteHeart_Step0
MovementAction_EmoteHeart_Step0: @ 0x08094E94
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _08094EB4
	adds r2, r1, #4
	adds r3, r1, #0
	adds r3, #8
	bl EventObjectGetLocalIdAndMap
	movs r0, #0x2e
	bl FieldEffectStart
	movs r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08094EB4: .4byte 0x020388A8
	thumb_func_end MovementAction_EmoteHeart_Step0

	thumb_func_start MovementAction_RevealTrainer_Step0
MovementAction_RevealTrainer_Step0: @ 0x08094EB8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #6]
	cmp r0, #0x3f
	bne _08094ECE
	adds r0, r4, #0
	bl sub_080B3CD0
	movs r0, #0
	b _08094EF6
_08094ECE:
	subs r0, #0x39
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08094EF0
	adds r0, r4, #0
	bl sub_08155CB4
	movs r0, #1
	strh r0, [r5, #0x32]
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_RevealTrainer_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08094EF6
_08094EF0:
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08094EF6:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_RevealTrainer_Step0

	thumb_func_start MovementAction_RevealTrainer_Step1
MovementAction_RevealTrainer_Step1: @ 0x08094EFC
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08155CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094F0E
	movs r0, #0
	b _08094F14
_08094F0E:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08094F14:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_RevealTrainer_Step1

	thumb_func_start MovementAction_RockSmashBreak_Step0
MovementAction_RockSmashBreak_Step0: @ 0x08094F1C
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl SetAndStartSpriteAnim
	movs r0, #1
	strh r0, [r4, #0x32]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_RockSmashBreak_Step0

	thumb_func_start MovementAction_RockSmashBreak_Step1
MovementAction_RockSmashBreak_Step1: @ 0x08094F38
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl SpriteAnimEnded
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094F54
	adds r0, r4, #0
	movs r1, #0x20
	bl SetMovementDelay
	movs r0, #2
	strh r0, [r4, #0x32]
_08094F54:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_RockSmashBreak_Step1

	thumb_func_start MovementAction_RockSmashBreak_Step2
MovementAction_RockSmashBreak_Step2: @ 0x08094F5C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r2, [r4, #1]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #5
	subs r0, #0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094F8E
	ldrb r0, [r4, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #3
	strh r0, [r5, #0x32]
_08094F8E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_RockSmashBreak_Step2

	thumb_func_start MovementAction_CutTree_Step0
MovementAction_CutTree_Step0: @ 0x08094F98
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl SetAndStartSpriteAnim
	movs r0, #1
	strh r0, [r4, #0x32]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_CutTree_Step0

	thumb_func_start MovementAction_CutTree_Step1
MovementAction_CutTree_Step1: @ 0x08094FB4
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl SpriteAnimEnded
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094FD0
	adds r0, r4, #0
	movs r1, #0x20
	bl SetMovementDelay
	movs r0, #2
	strh r0, [r4, #0x32]
_08094FD0:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_CutTree_Step1

	thumb_func_start MovementAction_CutTree_Step2
MovementAction_CutTree_Step2: @ 0x08094FD8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r2, [r4, #1]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1f
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #5
	subs r0, #0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl WaitForMovementDelay
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809500A
	ldrb r0, [r4, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #3
	strh r0, [r5, #0x32]
_0809500A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_CutTree_Step2

	thumb_func_start MovementAction_SetFixedPriority_Step0
MovementAction_SetFixedPriority_Step0: @ 0x08095014
	ldrb r2, [r0, #3]
	movs r3, #4
	orrs r2, r3
	strb r2, [r0, #3]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	.align 2, 0
	thumb_func_end MovementAction_SetFixedPriority_Step0

	thumb_func_start MovementAction_ClearFixedPriority_Step0
MovementAction_ClearFixedPriority_Step0: @ 0x08095024
	ldrb r3, [r0, #3]
	movs r2, #5
	rsbs r2, r2, #0
	ands r2, r3
	strb r2, [r0, #3]
	movs r0, #1
	strh r0, [r1, #0x32]
	bx lr
	thumb_func_end MovementAction_ClearFixedPriority_Step0

	thumb_func_start MovementAction_InitAffineAnim_Step0
MovementAction_InitAffineAnim_Step0: @ 0x08095034
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r4, #0
	bl InitSpriteAffineAnim
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r4, #0x42
	ldrb r1, [r4]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_InitAffineAnim_Step0

	thumb_func_start MovementAction_ClearAffineAnim_Step0
MovementAction_ClearAffineAnim_Step0: @ 0x08095064
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	bl FreeOamMatrix
	ldrb r0, [r4, #1]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #1]
	lsrs r1, r1, #6
	ldrb r2, [r4, #3]
	lsrs r2, r2, #6
	movs r3, #0
	adds r0, r4, #0
	bl CalcCenterToCornerVec
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_ClearAffineAnim_Step0

	thumb_func_start MovementAction_Unknown1_Step0
MovementAction_Unknown1_Step0: @ 0x08095094
	ldrb r1, [r0, #3]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #3]
	movs r0, #1
	bx lr
	thumb_func_end MovementAction_Unknown1_Step0

	thumb_func_start MovementAction_Unknown2_Step0
MovementAction_Unknown2_Step0: @ 0x080950A0
	ldrb r2, [r0, #3]
	movs r1, #9
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0, #3]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end MovementAction_Unknown2_Step0

	thumb_func_start MovementAction_WalkDownStartAffine_Step0
MovementAction_WalkDownStartAffine_Step0: @ 0x080950B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r2, #1
	bl sub_080934D0
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAffineAnimIfDifferent
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_WalkDownStartAffine_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkDownStartAffine_Step0

	thumb_func_start MovementAction_WalkDownStartAffine_Step1
MovementAction_WalkDownStartAffine_Step1: @ 0x080950E4
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080950F6
	movs r0, #0
	b _08095108
_080950F6:
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095108:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkDownStartAffine_Step1

	thumb_func_start MovementAction_WalkDownAffine_Step0
MovementAction_WalkDownAffine_Step0: @ 0x08095110
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r2, #1
	bl sub_080934D0
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #1
	bl ChangeSpriteAffineAnimIfDifferent
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_WalkDownAffine_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkDownAffine_Step0

	thumb_func_start MovementAction_WalkDownAffine_Step1
MovementAction_WalkDownAffine_Step1: @ 0x08095144
	push {r4, lr}
	adds r4, r1, #0
	bl an_walk_any_2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095156
	movs r0, #0
	b _08095168
_08095156:
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095168:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkDownAffine_Step1

	thumb_func_start MovementAction_WalkLeftAffine_Step0
MovementAction_WalkLeftAffine_Step0: @ 0x08095170
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r2, #3
	movs r3, #1
	bl do_go_anim
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #2
	bl ChangeSpriteAffineAnimIfDifferent
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_WalkLeftAffine_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkLeftAffine_Step0

	thumb_func_start MovementAction_WalkLeftAffine_Step1
MovementAction_WalkLeftAffine_Step1: @ 0x080951A4
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080951B6
	movs r0, #0
	b _080951C8
_080951B6:
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080951C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkLeftAffine_Step1

	thumb_func_start MovementAction_WalkRightAffine_Step0
MovementAction_WalkRightAffine_Step0: @ 0x080951D0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r2, #4
	movs r3, #1
	bl do_go_anim
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #3
	bl ChangeSpriteAffineAnimIfDifferent
	adds r0, r5, #0
	adds r1, r4, #0
	bl MovementAction_WalkRightAffine_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_WalkRightAffine_Step0

	thumb_func_start MovementAction_WalkRightAffine_Step1
MovementAction_WalkRightAffine_Step1: @ 0x08095204
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095216
	movs r0, #0
	b _08095228
_08095216:
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095228:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_WalkRightAffine_Step1

	thumb_func_start sub_08095230
sub_08095230: @ 0x08095230
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	adds r1, r4, #0
	bl SetEventObjectDirection
	adds r0, r5, #0
	bl ShiftStillEventObjectCoords
	adds r0, r4, #0
	bl GetWalkInPlaceFastestMovementAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl obj_npc_animation_step
	adds r2, r6, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r6, #0x32]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_08095230

	thumb_func_start MovementAction_AcroWheelieFaceDown_Step0
MovementAction_AcroWheelieFaceDown_Step0: @ 0x08095270
	push {lr}
	movs r2, #1
	bl sub_08095230
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieFaceDown_Step0

	thumb_func_start MovementAction_AcroWheelieFaceUp_Step0
MovementAction_AcroWheelieFaceUp_Step0: @ 0x08095280
	push {lr}
	movs r2, #2
	bl sub_08095230
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieFaceUp_Step0

	thumb_func_start MovementAction_AcroWheelieFaceLeft_Step0
MovementAction_AcroWheelieFaceLeft_Step0: @ 0x08095290
	push {lr}
	movs r2, #3
	bl sub_08095230
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieFaceLeft_Step0

	thumb_func_start MovementAction_AcroWheelieFaceRight_Step0
MovementAction_AcroWheelieFaceRight_Step0: @ 0x080952A0
	push {lr}
	movs r2, #4
	bl sub_08095230
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieFaceRight_Step0

	thumb_func_start MovementAction_AcroPopWheelieDown_Step0
MovementAction_AcroPopWheelieDown_Step0: @ 0x080952B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl GetSlideMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroPopWheelieDown_Step0

	thumb_func_start MovementAction_AcroPopWheelieUp_Step0
MovementAction_AcroPopWheelieUp_Step0: @ 0x080952D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	bl GetSlideMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroPopWheelieUp_Step0

	thumb_func_start MovementAction_AcroPopWheelieLeft_Step0
MovementAction_AcroPopWheelieLeft_Step0: @ 0x080952F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #3
	bl GetSlideMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroPopWheelieLeft_Step0

	thumb_func_start MovementAction_AcroPopWheelieRight_Step0
MovementAction_AcroPopWheelieRight_Step0: @ 0x0809531C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #4
	bl GetSlideMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroPopWheelieRight_Step0

	thumb_func_start MovementAction_AcroEndWheelieFaceDown_Step0
MovementAction_AcroEndWheelieFaceDown_Step0: @ 0x08095340
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl GetWalkFastestMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroEndWheelieFaceDown_Step0

	thumb_func_start MovementAction_AcroEndWheelieFaceUp_Step0
MovementAction_AcroEndWheelieFaceUp_Step0: @ 0x08095364
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	bl GetWalkFastestMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroEndWheelieFaceUp_Step0

	thumb_func_start sub_08095388
sub_08095388: @ 0x08095388
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #3
	bl GetWalkFastestMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08095388

	thumb_func_start MovementAction_AcroEndWheelieFaceRight_Step0
MovementAction_AcroEndWheelieFaceRight_Step0: @ 0x080953AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #4
	bl GetWalkFastestMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroEndWheelieFaceRight_Step0

	thumb_func_start MovementAction_UnusedAcroActionDown_Step0
MovementAction_UnusedAcroActionDown_Step0: @ 0x080953D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl GetWalkInPlaceFastMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_UnusedAcroActionDown_Step0

	thumb_func_start MovementAction_UnusedAcroActionUp_Step0
MovementAction_UnusedAcroActionUp_Step0: @ 0x080953F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	bl GetWalkInPlaceFastMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_UnusedAcroActionUp_Step0

	thumb_func_start MovementAction_UnusedAcroActionLeft_Step0
MovementAction_UnusedAcroActionLeft_Step0: @ 0x08095418
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #3
	bl GetWalkInPlaceFastMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_UnusedAcroActionLeft_Step0

	thumb_func_start MovementAction_UnusedAcroActionRight_Step0
MovementAction_UnusedAcroActionRight_Step0: @ 0x0809543C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #4
	bl GetWalkInPlaceFastMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl StartSpriteAnimInDirection
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_UnusedAcroActionRight_Step0

	thumb_func_start sub_08095460
sub_08095460: @ 0x08095460
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl sub_080970C0
	adds r4, #0x2c
	ldrb r1, [r4]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_08095460

	thumb_func_start sub_0809547C
sub_0809547C: @ 0x0809547C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl sub_080970C8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095492
	movs r0, #0
	b _080954AE
_08095492:
	adds r0, r4, #0
	bl ShiftStillEventObjectCoords
	ldrb r0, [r4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
_080954AE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0809547C

	thumb_func_start MovementAction_Figure8_Step0
MovementAction_Figure8_Step0: @ 0x080954B4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_08095460
	movs r0, #1
	strh r0, [r4, #0x32]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080954D4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_Figure8_Step0

	thumb_func_start sub_080954D4
sub_080954D4: @ 0x080954D4
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0809547C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080954E6
	movs r0, #0
	b _080954EC
_080954E6:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_080954EC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_080954D4

	thumb_func_start sub_080954F4
sub_080954F4: @ 0x080954F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_08093934
	adds r0, r4, #0
	bl GetSlideMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartSpriteAnimIfDifferent
	adds r0, r6, #0
	bl DoShadowFieldEffect
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080954F4

	thumb_func_start MovementAction_AcroWheelieHopFaceDown_Step0
MovementAction_AcroWheelieHopFaceDown_Step0: @ 0x08095538
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieHopFaceDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopFaceDown_Step0

	thumb_func_start MovementAction_AcroWheelieHopFaceDown_Step1
MovementAction_AcroWheelieHopFaceDown_Step1: @ 0x08095564
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095578
	movs r0, #0
	b _08095588
_08095578:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08095588:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopFaceDown_Step1

	thumb_func_start MovementAction_AcroWheelieHopFaceUp_Step0
MovementAction_AcroWheelieHopFaceUp_Step0: @ 0x08095590
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #0
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieHopFaceUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopFaceUp_Step0

	thumb_func_start MovementAction_AcroWheelieHopFaceUp_Step1
MovementAction_AcroWheelieHopFaceUp_Step1: @ 0x080955BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080955D0
	movs r0, #0
	b _080955E0
_080955D0:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_080955E0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopFaceUp_Step1

	thumb_func_start MovementAction_AcroWheelieHopFaceLeft_Step0
MovementAction_AcroWheelieHopFaceLeft_Step0: @ 0x080955E8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #0
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieHopFaceLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopFaceLeft_Step0

	thumb_func_start MovementAction_AcroWheelieHopFaceLeft_Step1
MovementAction_AcroWheelieHopFaceLeft_Step1: @ 0x08095614
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095628
	movs r0, #0
	b _08095638
_08095628:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08095638:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopFaceLeft_Step1

	thumb_func_start MovementAction_AcroWheelieHopFaceRight_Step0
MovementAction_AcroWheelieHopFaceRight_Step0: @ 0x08095640
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #0
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieHopFaceRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopFaceRight_Step0

	thumb_func_start MovementAction_AcroWheelieHopFaceRight_Step1
MovementAction_AcroWheelieHopFaceRight_Step1: @ 0x0809566C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095680
	movs r0, #0
	b _08095690
_08095680:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08095690:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopFaceRight_Step1

	thumb_func_start MovementAction_AcroWheelieHopDown_Step0
MovementAction_AcroWheelieHopDown_Step0: @ 0x08095698
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #1
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieHopDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopDown_Step0

	thumb_func_start MovementAction_AcroWheelieHopDown_Step1
MovementAction_AcroWheelieHopDown_Step1: @ 0x080956C4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080956D8
	movs r0, #0
	b _080956E8
_080956D8:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_080956E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopDown_Step1

	thumb_func_start MovementAction_AcroWheelieHopUp_Step0
MovementAction_AcroWheelieHopUp_Step0: @ 0x080956F0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #1
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieHopUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopUp_Step0

	thumb_func_start MovementAction_AcroWheelieHopUp_Step1
MovementAction_AcroWheelieHopUp_Step1: @ 0x0809571C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095730
	movs r0, #0
	b _08095740
_08095730:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08095740:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopUp_Step1

	thumb_func_start MovementAction_AcroWheelieHopLeft_Step0
MovementAction_AcroWheelieHopLeft_Step0: @ 0x08095748
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #1
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieHopLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopLeft_Step0

	thumb_func_start MovementAction_AcroWheelieHopLeft_Step1
MovementAction_AcroWheelieHopLeft_Step1: @ 0x08095774
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095788
	movs r0, #0
	b _08095798
_08095788:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08095798:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopLeft_Step1

	thumb_func_start MovementAction_AcroWheelieHopRight_Step0
MovementAction_AcroWheelieHopRight_Step0: @ 0x080957A0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #1
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieHopRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopRight_Step0

	thumb_func_start MovementAction_AcroWheelieHopRight_Step1
MovementAction_AcroWheelieHopRight_Step1: @ 0x080957CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080957E0
	movs r0, #0
	b _080957F0
_080957E0:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_080957F0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieHopRight_Step1

	thumb_func_start MovementAction_AcroWheelieJumpDown_Step0
MovementAction_AcroWheelieJumpDown_Step0: @ 0x080957F8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieJumpDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieJumpDown_Step0

	thumb_func_start MovementAction_AcroWheelieJumpDown_Step1
MovementAction_AcroWheelieJumpDown_Step1: @ 0x08095824
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095838
	movs r0, #0
	b _08095848
_08095838:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08095848:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieJumpDown_Step1

	thumb_func_start MovementAction_AcroWheelieJumpUp_Step0
MovementAction_AcroWheelieJumpUp_Step0: @ 0x08095850
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #2
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieJumpUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieJumpUp_Step0

	thumb_func_start MovementAction_AcroWheelieJumpUp_Step1
MovementAction_AcroWheelieJumpUp_Step1: @ 0x0809587C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095890
	movs r0, #0
	b _080958A0
_08095890:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_080958A0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieJumpUp_Step1

	thumb_func_start MovementAction_AcroWheelieJumpLeft_Step0
MovementAction_AcroWheelieJumpLeft_Step0: @ 0x080958A8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #2
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieJumpLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieJumpLeft_Step0

	thumb_func_start MovementAction_AcroWheelieJumpLeft_Step1
MovementAction_AcroWheelieJumpLeft_Step1: @ 0x080958D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080958E8
	movs r0, #0
	b _080958F8
_080958E8:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_080958F8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieJumpLeft_Step1

	thumb_func_start MovementAction_AcroWheelieJumpRight_Step0
MovementAction_AcroWheelieJumpRight_Step0: @ 0x08095900
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #2
	bl sub_080954F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieJumpRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieJumpRight_Step0

	thumb_func_start MovementAction_AcroWheelieJumpRight_Step1
MovementAction_AcroWheelieJumpRight_Step1: @ 0x0809592C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08093B20
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095940
	movs r0, #0
	b _08095950
_08095940:
	ldrb r0, [r4, #2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r4, #2]
	movs r0, #2
	strh r0, [r5, #0x32]
	movs r0, #1
_08095950:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieJumpRight_Step1

	thumb_func_start MovementAction_AcroWheelieInPlaceDown_Step0
MovementAction_AcroWheelieInPlaceDown_Step0: @ 0x08095958
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	bl GetWalkInPlaceFastestMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieInPlaceDown_Step0

	thumb_func_start MovementAction_AcroWheelieInPlaceUp_Step0
MovementAction_AcroWheelieInPlaceUp_Step0: @ 0x08095990
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #2
	bl GetWalkInPlaceFastestMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieInPlaceUp_Step0

	thumb_func_start MovementAction_AcroWheelieInPlaceLeft_Step0
MovementAction_AcroWheelieInPlaceLeft_Step0: @ 0x080959C8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #3
	bl GetWalkInPlaceFastestMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieInPlaceLeft_Step0

	thumb_func_start MovementAction_AcroWheelieInPlaceRight_Step0
MovementAction_AcroWheelieInPlaceRight_Step0: @ 0x08095A00
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #4
	bl GetWalkInPlaceFastestMovementAction
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl sub_08093EC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_WalkInPlace_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieInPlaceRight_Step0

	thumb_func_start sub_08095A38
sub_08095A38: @ 0x08095A38
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl npc_apply_direction
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetSlideMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	movs r1, #0
	bl SeekSpriteAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08095A38

	thumb_func_start sub_08095A70
sub_08095A70: @ 0x08095A70
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_08095A38
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroPopWheelieMoveDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08095A70

	thumb_func_start MovementAction_AcroPopWheelieMoveDown_Step1
MovementAction_AcroPopWheelieMoveDown_Step1: @ 0x08095A90
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095AA2
	movs r0, #0
	b _08095AA8
_08095AA2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095AA8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroPopWheelieMoveDown_Step1

	thumb_func_start sub_08095AB0
sub_08095AB0: @ 0x08095AB0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	movs r3, #1
	bl sub_08095A38
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroPopWheelieMoveUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08095AB0

	thumb_func_start MovementAction_AcroPopWheelieMoveUp_Step1
MovementAction_AcroPopWheelieMoveUp_Step1: @ 0x08095AD0
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095AE2
	movs r0, #0
	b _08095AE8
_08095AE2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095AE8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroPopWheelieMoveUp_Step1

	thumb_func_start sub_08095AF0
sub_08095AF0: @ 0x08095AF0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	movs r3, #1
	bl sub_08095A38
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroPopWheelieMoveLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08095AF0

	thumb_func_start MovementAction_AcroPopWheelieMoveLeft_Step1
MovementAction_AcroPopWheelieMoveLeft_Step1: @ 0x08095B10
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095B22
	movs r0, #0
	b _08095B28
_08095B22:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095B28:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroPopWheelieMoveLeft_Step1

	thumb_func_start sub_08095B30
sub_08095B30: @ 0x08095B30
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	movs r3, #1
	bl sub_08095A38
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroPopWheelieMoveRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_08095B30

	thumb_func_start MovementAction_AcroPopWheelieMoveRight_Step1
MovementAction_AcroPopWheelieMoveRight_Step1: @ 0x08095B50
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095B62
	movs r0, #0
	b _08095B68
_08095B62:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095B68:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroPopWheelieMoveRight_Step1

	thumb_func_start sub_08095B70
sub_08095B70: @ 0x08095B70
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl npc_apply_direction
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetWalkInPlaceFastestMovementAction
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl npc_apply_anim_looping
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08095B70

	thumb_func_start MovementAction_AcroWheelieMoveDown_Step0
MovementAction_AcroWheelieMoveDown_Step0: @ 0x08095BA0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_08095B70
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieMoveDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroWheelieMoveDown_Step0

	thumb_func_start MovementAction_AcroWheelieMoveDown_Step1
MovementAction_AcroWheelieMoveDown_Step1: @ 0x08095BC0
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095BD2
	movs r0, #0
	b _08095BD8
_08095BD2:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095BD8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieMoveDown_Step1

	thumb_func_start MovementAction_AcroWheelieMoveUp_Step0
MovementAction_AcroWheelieMoveUp_Step0: @ 0x08095BE0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	movs r3, #1
	bl sub_08095B70
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieMoveUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroWheelieMoveUp_Step0

	thumb_func_start MovementAction_AcroWheelieMoveUp_Step1
MovementAction_AcroWheelieMoveUp_Step1: @ 0x08095C00
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095C12
	movs r0, #0
	b _08095C18
_08095C12:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095C18:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieMoveUp_Step1

	thumb_func_start MovementAction_AcroWheelieMoveLeft_Step0
MovementAction_AcroWheelieMoveLeft_Step0: @ 0x08095C20
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	movs r3, #1
	bl sub_08095B70
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieMoveLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroWheelieMoveLeft_Step0

	thumb_func_start MovementAction_AcroWheelieMoveLeft_Step1
MovementAction_AcroWheelieMoveLeft_Step1: @ 0x08095C40
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095C52
	movs r0, #0
	b _08095C58
_08095C52:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095C58:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieMoveLeft_Step1

	thumb_func_start MovementAction_AcroWheelieMoveRight_Step0
MovementAction_AcroWheelieMoveRight_Step0: @ 0x08095C60
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	movs r3, #1
	bl sub_08095B70
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroWheelieMoveRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroWheelieMoveRight_Step0

	thumb_func_start MovementAction_AcroWheelieMoveRight_Step1
MovementAction_AcroWheelieMoveRight_Step1: @ 0x08095C80
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095C92
	movs r0, #0
	b _08095C98
_08095C92:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095C98:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroWheelieMoveRight_Step1

	thumb_func_start sub_08095CA0
sub_08095CA0: @ 0x08095CA0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl npc_apply_direction
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bl GetWalkFastestMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
	adds r0, r4, #0
	movs r1, #0
	bl SeekSpriteAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08095CA0

	thumb_func_start MovementAction_AcroEndWheelieMoveDown_Step0
MovementAction_AcroEndWheelieMoveDown_Step0: @ 0x08095CD8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_08095CA0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroEndWheelieMoveDown_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroEndWheelieMoveDown_Step0

	thumb_func_start MovementAction_AcroEndWheelieMoveDown_Step1
MovementAction_AcroEndWheelieMoveDown_Step1: @ 0x08095CF8
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095D0A
	movs r0, #0
	b _08095D10
_08095D0A:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095D10:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroEndWheelieMoveDown_Step1

	thumb_func_start MovementAction_AcroEndWheelieMoveUp_Step0
MovementAction_AcroEndWheelieMoveUp_Step0: @ 0x08095D18
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	movs r3, #1
	bl sub_08095CA0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroEndWheelieMoveUp_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroEndWheelieMoveUp_Step0

	thumb_func_start MovementAction_AcroEndWheelieMoveUp_Step1
MovementAction_AcroEndWheelieMoveUp_Step1: @ 0x08095D38
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095D4A
	movs r0, #0
	b _08095D50
_08095D4A:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095D50:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroEndWheelieMoveUp_Step1

	thumb_func_start MovementAction_AcroEndWheelieMoveLeft_Step0
MovementAction_AcroEndWheelieMoveLeft_Step0: @ 0x08095D58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #3
	movs r3, #1
	bl sub_08095CA0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroEndWheelieMoveLeft_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroEndWheelieMoveLeft_Step0

	thumb_func_start MovementAction_AcroEndWheelieMoveLeft_Step1
MovementAction_AcroEndWheelieMoveLeft_Step1: @ 0x08095D78
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095D8A
	movs r0, #0
	b _08095D90
_08095D8A:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095D90:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroEndWheelieMoveLeft_Step1

	thumb_func_start MovementAction_AcroEndWheelieMoveRight_Step0
MovementAction_AcroEndWheelieMoveRight_Step0: @ 0x08095D98
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #4
	movs r3, #1
	bl sub_08095CA0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MovementAction_AcroEndWheelieMoveRight_Step1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_AcroEndWheelieMoveRight_Step0

	thumb_func_start MovementAction_AcroEndWheelieMoveRight_Step1
MovementAction_AcroEndWheelieMoveRight_Step1: @ 0x08095DB8
	push {r4, lr}
	adds r4, r1, #0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095DCA
	movs r0, #0
	b _08095DD0
_08095DCA:
	movs r0, #2
	strh r0, [r4, #0x32]
	movs r0, #1
_08095DD0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_AcroEndWheelieMoveRight_Step1

	thumb_func_start MovementAction_Levitate_Step0
MovementAction_Levitate_Step0: @ 0x08095DD8
	push {r4, lr}
	adds r4, r1, #0
	bl CreateLevitateMovementTask
	movs r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_Levitate_Step0

	thumb_func_start MovementAction_StopLevitate_Step0
MovementAction_StopLevitate_Step0: @ 0x08095DEC
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r0, #0x1b]
	bl DestroyExtraMovementTask
	movs r0, #0
	strh r0, [r4, #0x26]
	movs r0, #1
	strh r0, [r4, #0x32]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_StopLevitate_Step0

	thumb_func_start MovementAction_DestroyExtraTaskIfAtTop_Step0
MovementAction_DestroyExtraTaskIfAtTop_Step0: @ 0x08095E04
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08095E16
	movs r0, #0
	b _08095E20
_08095E16:
	ldrb r0, [r2, #0x1b]
	bl DestroyExtraMovementTask
	movs r0, #1
	strh r0, [r4, #0x32]
_08095E20:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_DestroyExtraTaskIfAtTop_Step0

	thumb_func_start sub_08095E28
sub_08095E28: @ 0x08095E28
	movs r0, #1
	bx lr
	thumb_func_end sub_08095E28

	thumb_func_start MovementAction_PauseSpriteAnim
MovementAction_PauseSpriteAnim: @ 0x08095E2C
	adds r1, #0x2c
	ldrb r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end MovementAction_PauseSpriteAnim

	thumb_func_start UpdateEventObjectSpriteAnimPause
UpdateEventObjectSpriteAnimPause: @ 0x08095E3C
	push {lr}
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _08095E52
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
_08095E52:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateEventObjectSpriteAnimPause

	thumb_func_start TryEnableEventObjectAnim
TryEnableEventObjectAnim: @ 0x08095E58
	push {r4, lr}
	adds r4, r0, #0
	ldrb r3, [r4, #1]
	lsls r0, r3, #0x1c
	cmp r0, #0
	bge _08095E80
	adds r2, r1, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r3
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
_08095E80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end TryEnableEventObjectAnim

	thumb_func_start UpdateEventObjectVisibility
UpdateEventObjectVisibility: @ 0x08095E88
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08095EA0
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateEventObjSpriteVisibility
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end UpdateEventObjectVisibility

	thumb_func_start sub_08095EA0
sub_08095EA0: @ 0x08095EA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldrb r0, [r5, #5]
	bl GetEventObjectGraphicsInfo
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095F04
	ldrh r1, [r4, #0x24]
	ldrh r0, [r4, #0x20]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, _08095EFC
	adds r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r4, #0x26]
	ldrh r0, [r4, #0x22]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, _08095F00
	adds r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	b _08095F2C
	.align 2, 0
_08095EFC: .4byte 0x02021B38
_08095F00: .4byte 0x02021B3A
_08095F04:
	ldrh r1, [r4, #0x24]
	ldrh r0, [r4, #0x20]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r4, #0x26]
	ldrh r0, [r4, #0x22]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
_08095F2C:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r6, #8]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r6, #0xa]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	bgt _08095F54
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08095F5C
_08095F54:
	ldrb r0, [r5, #1]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5, #1]
_08095F5C:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xaf
	bgt _08095F70
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08095F78
_08095F70:
	ldrb r0, [r5, #1]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5, #1]
_08095F78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08095EA0

	thumb_func_start UpdateEventObjSpriteVisibility
UpdateEventObjSpriteVisibility: @ 0x08095F80
	push {lr}
	adds r2, r1, #0
	adds r2, #0x3e
	ldrb r1, [r2]
	movs r3, #5
	rsbs r3, r3, #0
	ands r3, r1
	strb r3, [r2]
	ldrb r1, [r0, #1]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _08095FA2
	movs r1, #4
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r2]
_08095FA2:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end UpdateEventObjSpriteVisibility

	thumb_func_start GetAllGroundEffectFlags_OnSpawn
GetAllGroundEffectFlags_OnSpawn: @ 0x08095FA8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl EventObjectUpdateMetatileBehaviors
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_Reflection
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_TallGrassOnSpawn
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0809615C
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_HotSprings
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnSpawn

	thumb_func_start GetAllGroundEffectFlags_OnBeginStep
GetAllGroundEffectFlags_OnBeginStep: @ 0x08095FF0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl EventObjectUpdateMetatileBehaviors
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_Reflection
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_LongGrassOnSpawn
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_LongGrassOnBeginStep
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_Tracks
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_Puddle
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_HotSprings
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnBeginStep

	thumb_func_start GetAllGroundEffectFlags_OnFinishStep
GetAllGroundEffectFlags_OnFinishStep: @ 0x08096048
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl EventObjectUpdateMetatileBehaviors
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_Puddle
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_Ripple
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_HotSprings
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_Seaweed
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetGroundEffectFlags_JumpLanding
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnFinishStep

	thumb_func_start EventObjectUpdateMetatileBehaviors
EventObjectUpdateMetatileBehaviors: @ 0x08096098
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	strb r0, [r4, #0x1f]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	strb r0, [r4, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EventObjectUpdateMetatileBehaviors

	thumb_func_start GetGroundEffectFlags_Reflection
GetGroundEffectFlags_Reflection: @ 0x080960C0
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08096104
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	adds r0, r4, #0
	bl EventObjectCheckForReflectiveSurface
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08096108
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _08096112
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #2]
	subs r0, r2, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r5]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r5]
	b _08096112
	.align 2, 0
_08096104: .4byte 0x084E6A30
_08096108:
	ldrb r1, [r4, #2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #2]
_08096112:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGroundEffectFlags_Reflection

	thumb_func_start GetGroundEffectFlags_TallGrassOnSpawn
GetGroundEffectFlags_TallGrassOnSpawn: @ 0x0809611C
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r0, #0x1e]
	bl MetatileBehavior_IsTallGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096134
	ldr r0, [r4]
	movs r1, #1
	orrs r0, r1
	str r0, [r4]
_08096134:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGroundEffectFlags_TallGrassOnSpawn

	thumb_func_start GetGroundEffectFlags_LongGrassOnSpawn
GetGroundEffectFlags_LongGrassOnSpawn: @ 0x0809613C
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r0, #0x1e]
	bl MetatileBehavior_IsTallGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096154
	ldr r0, [r4]
	movs r1, #2
	orrs r0, r1
	str r0, [r4]
_08096154:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGroundEffectFlags_LongGrassOnSpawn

	thumb_func_start sub_0809615C
sub_0809615C: @ 0x0809615C
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r0, #0x1e]
	bl MetatileBehavior_IsLongGrass_Duplicate
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096174
	ldr r0, [r4]
	movs r1, #4
	orrs r0, r1
	str r0, [r4]
_08096174:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0809615C

	thumb_func_start GetGroundEffectFlags_LongGrassOnBeginStep
GetGroundEffectFlags_LongGrassOnBeginStep: @ 0x0809617C
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r0, #0x1e]
	bl MetatileBehavior_IsLongGrass_Duplicate
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096194
	ldr r0, [r4]
	movs r1, #8
	orrs r0, r1
	str r0, [r4]
_08096194:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGroundEffectFlags_LongGrassOnBeginStep

	thumb_func_start GetGroundEffectFlags_Tracks
GetGroundEffectFlags_Tracks: @ 0x0809619C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsDeepSand
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080961B6
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #1
	b _080961D2
_080961B6:
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsSandOrDeepSand
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080961CE
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsFootprints
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080961D6
_080961CE:
	ldr r0, [r5]
	movs r1, #0x80
_080961D2:
	orrs r0, r1
	str r0, [r5]
_080961D6:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Tracks

	thumb_func_start GetGroundEffectFlags_SandHeap
GetGroundEffectFlags_SandHeap: @ 0x080961DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsDeepSand
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809621A
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsDeepSand
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809621A
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1b
	cmp r0, #0
	blt _08096224
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #2]
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5]
	b _08096224
_0809621A:
	ldrb r1, [r4, #2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #2]
_08096224:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGroundEffectFlags_SandHeap

	thumb_func_start GetGroundEffectFlags_ShallowFlowingWater
GetGroundEffectFlags_ShallowFlowingWater: @ 0x0809622C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsShallowFlowingWater
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809624A
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsShallowFlowingWater
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096262
_0809624A:
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096280
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096280
_08096262:
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1c
	cmp r0, #0
	blt _0809628A
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #2]
	ldr r0, [r5]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r5]
	b _0809628A
_08096280:
	ldrb r1, [r4, #2]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #2]
_0809628A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_ShallowFlowingWater

	thumb_func_start GetGroundEffectFlags_Puddle
GetGroundEffectFlags_Puddle: @ 0x08096290
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsPuddle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080962B8
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsPuddle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080962B8
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5]
_080962B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGroundEffectFlags_Puddle

	thumb_func_start GetGroundEffectFlags_Ripple
GetGroundEffectFlags_Ripple: @ 0x080962C0
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r0, #0x1e]
	bl MetatileBehavior_HasRipples
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080962DA
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r4]
_080962DA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Ripple

	thumb_func_start GetGroundEffectFlags_ShortGrass
GetGroundEffectFlags_ShortGrass: @ 0x080962E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsShortGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809631E
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsShortGrass
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809631E
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1d
	cmp r0, #0
	blt _08096328
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4, #2]
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0xa
	orrs r0, r1
	str r0, [r5]
	b _08096328
_0809631E:
	ldrb r1, [r4, #2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #2]
_08096328:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGroundEffectFlags_ShortGrass

	thumb_func_start GetGroundEffectFlags_HotSprings
GetGroundEffectFlags_HotSprings: @ 0x08096330
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1e]
	bl MetatileBehavior_IsHotSprings
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809636E
	ldrb r0, [r4, #0x1f]
	bl MetatileBehavior_IsHotSprings
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809636E
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1a
	cmp r0, #0
	blt _08096378
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4, #2]
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r5]
	b _08096378
_0809636E:
	ldrb r1, [r4, #2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #2]
_08096378:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GetGroundEffectFlags_HotSprings

	thumb_func_start GetGroundEffectFlags_Seaweed
GetGroundEffectFlags_Seaweed: @ 0x08096380
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r0, #0x1e]
	bl MetatileBehavior_IsSeaweed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809639A
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r4]
_0809639A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Seaweed

	thumb_func_start GetGroundEffectFlags_JumpLanding
GetGroundEffectFlags_JumpLanding: @ 0x080963A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [r7]
	ldr r1, _080963DC
	ands r0, r1
	cmp r0, #0x20
	bne _080963F2
	movs r5, #0
	ldr r0, _080963E0
	mov r8, r0
_080963BA:
	lsls r4, r5, #2
	mov r0, r8
	adds r1, r4, r0
	ldrb r0, [r7, #0x1e]
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080963E8
	ldr r0, _080963E4
	adds r0, r4, r0
	ldr r1, [r6]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r6]
	b _080963F2
	.align 2, 0
_080963DC: .4byte 0x02000020
_080963E0: .4byte 0x084E6A38
_080963E4: .4byte 0x084E6A50
_080963E8:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _080963BA
_080963F2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_JumpLanding

	thumb_func_start EventObjectCheckForReflectiveSurface
EventObjectCheckForReflectiveSurface: @ 0x080963FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5, #5]
	bl GetEventObjectGraphicsInfo
	movs r2, #8
	ldrsh r1, [r0, r2]
	adds r1, #8
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	adds r0, #8
	lsls r0, r0, #0xc
	movs r4, #0
	lsrs r2, r0, #0x10
	str r2, [sp, #4]
	asrs r0, r0, #0x10
	cmp r4, r0
	blt _08096432
	b _08096538
_08096432:
	movs r0, #1
	mov sl, r0
_08096436:
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	add r1, sl
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	adds r1, r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r4
	cmp r0, #0
	bne _0809653A
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	movs r2, #0x16
	ldrsh r1, [r5, r2]
	add r1, sl
	adds r1, r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0809653A
	movs r2, #1
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	mov r8, r0
	cmp r2, r1
	bge _08096526
	movs r0, #0x80
	lsls r0, r0, #9
	asrs r7, r0, #0x10
_08096490:
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	lsls r1, r2, #0x10
	asrs r4, r1, #0x10
	adds r0, r0, r4
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	adds r1, r1, r7
	adds r1, r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0809653A
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	subs r0, r0, r4
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	adds r1, r1, r7
	adds r1, r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0809653A
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	adds r0, r0, r4
	movs r2, #0x16
	ldrsh r1, [r5, r2]
	adds r1, r1, r7
	adds r1, r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0809653A
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	subs r0, r0, r4
	movs r2, #0x16
	ldrsh r1, [r5, r2]
	adds r1, r1, r7
	adds r1, r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0809653A
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, r8
	blt _08096490
_08096526:
	movs r1, #0x80
	lsls r1, r1, #9
	add r1, sb
	lsrs r4, r1, #0x10
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	cmp r1, r0
	bge _08096538
	b _08096436
_08096538:
	movs r0, #0
_0809653A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end EventObjectCheckForReflectiveSurface

	thumb_func_start GetReflectionTypeByMetatileBehavior
GetReflectionTypeByMetatileBehavior: @ 0x0809654C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl MetatileBehavior_IsIce_2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096562
	movs r0, #1
	b _08096574
_08096562:
	adds r0, r4, #0
	bl MetatileBehavior_IsReflective
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096572
	movs r0, #0
	b _08096574
_08096572:
	movs r0, #2
_08096574:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetReflectionTypeByMetatileBehavior

	thumb_func_start GetLedgeJumpDirection
GetLedgeJumpDirection: @ 0x0809657C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _080965C2
	cmp r4, #4
	bls _08096598
	subs r0, r4, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08096598:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileBehaviorAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080965C8
	lsls r1, r4, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080965CC
_080965C2:
	movs r0, #0
	b _080965D2
	.align 2, 0
_080965C8: .4byte 0x084E6A68
_080965CC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080965D2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLedgeJumpDirection

	thumb_func_start SetEventObjectSpriteOamTableForLongGrass
SetEventObjectSpriteOamTableForLongGrass: @ 0x080965D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r5]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0809662C
	ldrb r0, [r5, #0x1e]
	bl MetatileBehavior_IsLongGrass_Duplicate
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809662C
	ldrb r0, [r5, #0x1f]
	bl MetatileBehavior_IsLongGrass_Duplicate
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809662C
	adds r4, #0x42
	ldrb r1, [r4]
	movs r6, #0x40
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, #0xb]
	lsrs r0, r0, #4
	bl sub_08096718
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809662C
	ldrb r0, [r4]
	adds r1, r6, #0
	ands r1, r0
	movs r0, #5
	orrs r1, r0
	strb r1, [r4]
_0809662C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetEventObjectSpriteOamTableForLongGrass

	thumb_func_start IsZCoordMismatchAt
IsZCoordMismatchAt: @ 0x08096634
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	cmp r4, #0
	beq _08096662
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08096662
	cmp r0, #0xf
	beq _08096662
	cmp r0, r4
	bne _08096666
_08096662:
	movs r0, #0
	b _08096668
_08096666:
	movs r0, #1
_08096668:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end IsZCoordMismatchAt

	thumb_func_start UpdateEventObjectZCoordAndPriority
UpdateEventObjectZCoordAndPriority: @ 0x08096670
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _080966BE
	adds r0, r4, #0
	bl EventObjectUpdateZCoord
	ldr r1, _080966C4
	ldrb r2, [r4, #0xb]
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x1c
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r5, #0
	adds r4, #0x42
	movs r1, #0x3f
	ands r1, r0
	ldrb r3, [r4]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	ldr r0, _080966C8
	lsrs r2, r2, #0x1c
	adds r2, r2, r0
	movs r0, #3
	ldrb r1, [r2]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
_080966BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080966C4: .4byte 0x084E6A98
_080966C8: .4byte 0x084E6A88
	thumb_func_end UpdateEventObjectZCoordAndPriority

	thumb_func_start InitObjectPriorityByZCoord
InitObjectPriorityByZCoord: @ 0x080966CC
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08096710
	adds r2, r1, r2
	ldrb r2, [r2]
	movs r3, #0x42
	adds r3, r3, r0
	mov ip, r3
	movs r3, #0x3f
	ands r3, r2
	mov r2, ip
	ldrb r4, [r2]
	movs r2, #0x40
	rsbs r2, r2, #0
	ands r2, r4
	orrs r2, r3
	mov r3, ip
	strb r2, [r3]
	ldr r2, _08096714
	adds r1, r1, r2
	movs r3, #3
	ldrb r2, [r1]
	ands r2, r3
	lsls r2, r2, #2
	ldrb r3, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096710: .4byte 0x084E6A98
_08096714: .4byte 0x084E6A88
	thumb_func_end InitObjectPriorityByZCoord

	thumb_func_start sub_08096718
sub_08096718: @ 0x08096718
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08096724
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08096724: .4byte 0x084E6A88
	thumb_func_end sub_08096718

	thumb_func_start EventObjectUpdateZCoord
EventObjectUpdateZCoord: @ 0x08096728
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, #0xf
	beq _08096776
	cmp r0, #0xf
	beq _08096776
	movs r3, #0xf
	adds r0, r5, #0
	ands r0, r3
	ldrb r1, [r4, #0xb]
	movs r2, #0x10
	rsbs r2, r2, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, #0xb]
	cmp r5, #0
	beq _08096776
	cmp r5, #0xf
	beq _08096776
	lsls r0, r5, #4
	ands r2, r3
	orrs r2, r0
	strb r2, [r4, #0xb]
_08096776:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end EventObjectUpdateZCoord

	thumb_func_start SetObjectSubpriorityByZCoord
SetObjectSubpriorityByZCoord: @ 0x0809677C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r1, #0
	adds r3, #0x29
	movs r5, #0
	ldrsb r5, [r3, r5]
	ldrh r4, [r1, #0x22]
	ldr r3, _080967BC
	subs r4, r4, r5
	ldrh r3, [r3]
	adds r4, r4, r3
	adds r4, #8
	movs r3, #0xff
	ands r4, r3
	lsrs r4, r4, #4
	movs r3, #0x10
	subs r3, r3, r4
	lsls r3, r3, #0x11
	ldr r4, _080967C0
	adds r0, r0, r4
	lsrs r3, r3, #0x10
	ldrb r0, [r0]
	adds r3, r3, r0
	adds r2, r2, r3
	adds r1, #0x43
	strb r2, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080967BC: .4byte 0x02021B3A
_080967C0: .4byte 0x084E6A78
	thumb_func_end SetObjectSubpriorityByZCoord

	thumb_func_start EventObjectUpdateSubpriority
EventObjectUpdateSubpriority: @ 0x080967C4
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #3]
	lsls r0, r0, #0x1d
	cmp r0, #0
	blt _080967DA
	ldrb r0, [r2, #0xb]
	lsrs r0, r0, #4
	movs r2, #1
	bl SetObjectSubpriorityByZCoord
_080967DA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end EventObjectUpdateSubpriority

	thumb_func_start AreZCoordsCompatible
AreZCoordsCompatible: @ 0x080967E0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, #0
	beq _080967F6
	cmp r1, #0
	beq _080967F6
	cmp r0, r1
	bne _080967FA
_080967F6:
	movs r0, #1
	b _080967FC
_080967FA:
	movs r0, #0
_080967FC:
	pop {r1}
	bx r1
	thumb_func_end AreZCoordsCompatible

	thumb_func_start GroundEffect_SpawnOnTallGrass
GroundEffect_SpawnOnTallGrass: @ 0x08096800
	push {lr}
	ldr r3, _08096844
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, #0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, #4]
	ldrb r1, [r0, #0xb]
	lsrs r1, r1, #4
	str r1, [r3, #8]
	movs r1, #2
	str r1, [r3, #0xc]
	ldrb r1, [r0, #8]
	lsls r1, r1, #8
	ldrb r2, [r0, #9]
	orrs r1, r2
	str r1, [r3, #0x10]
	ldrb r0, [r0, #0xa]
	str r0, [r3, #0x14]
	ldr r0, _08096848
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	lsls r0, r0, #8
	ldrb r1, [r1, #4]
	orrs r0, r1
	str r0, [r3, #0x18]
	movs r0, #1
	str r0, [r3, #0x1c]
	movs r0, #4
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08096844: .4byte 0x020388A8
_08096848: .4byte 0x03005AEC
	thumb_func_end GroundEffect_SpawnOnTallGrass

	thumb_func_start GroundEffect_StepOnTallGrass
GroundEffect_StepOnTallGrass: @ 0x0809684C
	push {lr}
	ldr r3, _08096890
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, #0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, #4]
	ldrb r1, [r0, #0xb]
	lsrs r1, r1, #4
	str r1, [r3, #8]
	movs r1, #2
	str r1, [r3, #0xc]
	ldrb r1, [r0, #8]
	lsls r1, r1, #8
	ldrb r2, [r0, #9]
	orrs r1, r2
	str r1, [r3, #0x10]
	ldrb r0, [r0, #0xa]
	str r0, [r3, #0x14]
	ldr r0, _08096894
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	lsls r0, r0, #8
	ldrb r1, [r1, #4]
	orrs r0, r1
	str r0, [r3, #0x18]
	movs r0, #0
	str r0, [r3, #0x1c]
	movs r0, #4
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08096890: .4byte 0x020388A8
_08096894: .4byte 0x03005AEC
	thumb_func_end GroundEffect_StepOnTallGrass

	thumb_func_start GroundEffect_SpawnOnLongGrass
GroundEffect_SpawnOnLongGrass: @ 0x08096898
	push {lr}
	ldr r3, _080968DC
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, #0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, #4]
	ldrb r1, [r0, #0xb]
	lsrs r1, r1, #4
	str r1, [r3, #8]
	movs r1, #2
	str r1, [r3, #0xc]
	ldrb r1, [r0, #8]
	lsls r1, r1, #8
	ldrb r2, [r0, #9]
	orrs r1, r2
	str r1, [r3, #0x10]
	ldrb r0, [r0, #0xa]
	str r0, [r3, #0x14]
	ldr r0, _080968E0
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	lsls r0, r0, #8
	ldrb r1, [r1, #4]
	orrs r0, r1
	str r0, [r3, #0x18]
	movs r0, #1
	str r0, [r3, #0x1c]
	movs r0, #0x11
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_080968DC: .4byte 0x020388A8
_080968E0: .4byte 0x03005AEC
	thumb_func_end GroundEffect_SpawnOnLongGrass

	thumb_func_start GroundEffect_StepOnLongGrass
GroundEffect_StepOnLongGrass: @ 0x080968E4
	push {lr}
	ldr r3, _08096928
	movs r2, #0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, #0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, #4]
	ldrb r1, [r0, #0xb]
	lsrs r1, r1, #4
	str r1, [r3, #8]
	movs r1, #2
	str r1, [r3, #0xc]
	ldrb r1, [r0, #8]
	lsls r1, r1, #8
	ldrb r2, [r0, #9]
	orrs r1, r2
	str r1, [r3, #0x10]
	ldrb r0, [r0, #0xa]
	str r0, [r3, #0x14]
	ldr r0, _0809692C
	ldr r1, [r0]
	ldrb r0, [r1, #5]
	lsls r0, r0, #8
	ldrb r1, [r1, #4]
	orrs r0, r1
	str r0, [r3, #0x18]
	movs r0, #0
	str r0, [r3, #0x1c]
	movs r0, #0x11
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08096928: .4byte 0x020388A8
_0809692C: .4byte 0x03005AEC
	thumb_func_end GroundEffect_StepOnLongGrass

	thumb_func_start GroundEffect_WaterReflection
GroundEffect_WaterReflection: @ 0x08096930
	push {lr}
	movs r2, #0
	bl SetUpReflection
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_WaterReflection

	thumb_func_start GroundEffect_IceReflection
GroundEffect_IceReflection: @ 0x0809693C
	push {lr}
	movs r2, #1
	bl SetUpReflection
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_IceReflection

	thumb_func_start GroundEffect_FlowingWater
GroundEffect_FlowingWater: @ 0x08096948
	push {lr}
	adds r1, r0, #0
	movs r0, #0x22
	bl sub_08097758
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GroundEffect_FlowingWater

	thumb_func_start GroundEffect_SandTracks
GroundEffect_SandTracks: @ 0x08096958
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #5]
	bl GetEventObjectGraphicsInfo
	ldr r1, _08096980
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096980: .4byte 0x084E6AA8
	thumb_func_end GroundEffect_SandTracks

	thumb_func_start sub_08096984
sub_08096984: @ 0x08096984
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #5]
	bl GetEventObjectGraphicsInfo
	ldr r1, _080969AC
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080969AC: .4byte 0x084E6AA8
	thumb_func_end sub_08096984

	thumb_func_start DoTracksGroundEffect_None
DoTracksGroundEffect_None: @ 0x080969B0
	bx lr
	.align 2, 0
	thumb_func_end DoTracksGroundEffect_None

	thumb_func_start DoTracksGroundEffect_Footprints
DoTracksGroundEffect_Footprints: @ 0x080969B4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _080969FC
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r1, _08096A00
	movs r2, #0x14
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	str r0, [r1, #4]
	movs r0, #0x95
	str r0, [r1, #8]
	movs r0, #2
	str r0, [r1, #0xc]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [r1, #0x10]
	lsls r4, r4, #1
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl FieldEffectStart
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080969FC: .4byte 0x084E6AB4
_08096A00: .4byte 0x020388A8
	thumb_func_end DoTracksGroundEffect_Footprints

	thumb_func_start DoTracksGroundEffect_BikeTireTracks
DoTracksGroundEffect_BikeTireTracks: @ 0x08096A04
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	beq _08096A46
	ldr r2, _08096A4C
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	str r0, [r2, #4]
	movs r0, #0x95
	str r0, [r2, #8]
	movs r0, #2
	str r0, [r2, #0xc]
	ldr r3, _08096A50
	ldrb r1, [r4, #0x18]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #2
	subs r0, #5
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	str r0, [r2, #0x10]
	movs r0, #0x23
	bl FieldEffectStart
_08096A46:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096A4C: .4byte 0x020388A8
_08096A50: .4byte 0x084E6AB8
	thumb_func_end DoTracksGroundEffect_BikeTireTracks

	thumb_func_start sub_08096A54
sub_08096A54: @ 0x08096A54
	push {lr}
	bl DoRippleFieldEffect
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08096A54

	thumb_func_start GroundEffect_StepOnPuddle
GroundEffect_StepOnPuddle: @ 0x08096A60
	push {lr}
	adds r1, r0, #0
	movs r0, #0xf
	bl sub_08097758
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GroundEffect_StepOnPuddle

	thumb_func_start GroundEffect_SandHeap
GroundEffect_SandHeap: @ 0x08096A70
	push {lr}
	adds r1, r0, #0
	movs r0, #0x27
	bl sub_08097758
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GroundEffect_SandHeap

	thumb_func_start GroundEffect_JumpOnTallGrass
GroundEffect_JumpOnTallGrass: @ 0x08096A80
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08096AD4
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	str r0, [r1, #4]
	ldrb r0, [r5, #0xb]
	lsrs r0, r0, #4
	str r0, [r1, #8]
	movs r0, #2
	str r0, [r1, #0xc]
	movs r0, #0xc
	bl FieldEffectStart
	ldrb r0, [r5, #8]
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #0xa]
	movs r7, #0x10
	ldrsh r3, [r5, r7]
	movs r7, #0x12
	ldrsh r4, [r5, r7]
	str r4, [sp]
	bl FindTallGrassFieldEffectSpriteId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	bne _08096ACA
	adds r0, r5, #0
	adds r1, r6, #0
	bl GroundEffect_SpawnOnTallGrass
_08096ACA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096AD4: .4byte 0x020388A8
	thumb_func_end GroundEffect_JumpOnTallGrass

	thumb_func_start GroundEffect_JumpOnLongGrass
GroundEffect_JumpOnLongGrass: @ 0x08096AD8
	push {lr}
	ldr r2, _08096AFC
	movs r3, #0x10
	ldrsh r1, [r0, r3]
	str r1, [r2]
	movs r3, #0x12
	ldrsh r1, [r0, r3]
	str r1, [r2, #4]
	ldrb r0, [r0, #0xb]
	lsrs r0, r0, #4
	str r0, [r2, #8]
	movs r0, #2
	str r0, [r2, #0xc]
	movs r0, #0x12
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08096AFC: .4byte 0x020388A8
	thumb_func_end GroundEffect_JumpOnLongGrass

	thumb_func_start GroundEffect_JumpOnShallowWater
GroundEffect_JumpOnShallowWater: @ 0x08096B00
	push {r4, lr}
	ldr r3, _08096B2C
	movs r4, #0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, #0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, #4]
	ldrb r0, [r0, #0xb]
	lsrs r0, r0, #4
	str r0, [r3, #8]
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r3, #0xc]
	movs r0, #0x10
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096B2C: .4byte 0x020388A8
	thumb_func_end GroundEffect_JumpOnShallowWater

	thumb_func_start GroundEffect_JumpOnWater
GroundEffect_JumpOnWater: @ 0x08096B30
	push {r4, lr}
	ldr r3, _08096B5C
	movs r4, #0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, #0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, #4]
	ldrb r0, [r0, #0xb]
	lsrs r0, r0, #4
	str r0, [r3, #8]
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r3, #0xc]
	movs r0, #0xe
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096B5C: .4byte 0x020388A8
	thumb_func_end GroundEffect_JumpOnWater

	thumb_func_start GroundEffect_JumpLandingDust
GroundEffect_JumpLandingDust: @ 0x08096B60
	push {r4, lr}
	ldr r3, _08096B8C
	movs r4, #0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, #0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, #4]
	ldrb r0, [r0, #0xb]
	lsrs r0, r0, #4
	str r0, [r3, #8]
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	str r0, [r3, #0xc]
	movs r0, #0xa
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096B8C: .4byte 0x020388A8
	thumb_func_end GroundEffect_JumpLandingDust

	thumb_func_start GroundEffect_ShortGrass
GroundEffect_ShortGrass: @ 0x08096B90
	push {lr}
	adds r1, r0, #0
	movs r0, #0x29
	bl sub_08097758
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GroundEffect_ShortGrass

	thumb_func_start GroundEffect_HotSprings
GroundEffect_HotSprings: @ 0x08096BA0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x2a
	bl sub_08097758
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end GroundEffect_HotSprings

	thumb_func_start GroundEffect_Seaweed
GroundEffect_Seaweed: @ 0x08096BB0
	push {lr}
	ldr r2, _08096BCC
	movs r3, #0x10
	ldrsh r1, [r0, r3]
	str r1, [r2]
	movs r1, #0x12
	ldrsh r0, [r0, r1]
	str r0, [r2, #4]
	movs r0, #0x35
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08096BCC: .4byte 0x020388A8
	thumb_func_end GroundEffect_Seaweed

	thumb_func_start DoFlaggedGroundEffects
DoFlaggedGroundEffects: @ 0x08096BD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	bl EventObjectIsFarawayIslandMew
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08096BF4
	adds r0, r6, #0
	bl sub_081D40D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096C1C
_08096BF4:
	movs r4, #0
	ldr r0, _08096C28
	mov r8, r0
_08096BFA:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08096C10
	lsls r0, r4, #2
	add r0, r8
	ldr r2, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	bl _call_via_r2
_08096C10:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsrs r5, r5, #1
	cmp r4, #0x13
	bls _08096BFA
_08096C1C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096C28: .4byte 0x084E6AC8
	thumb_func_end DoFlaggedGroundEffects

	thumb_func_start filters_out_some_ground_effects
filters_out_some_ground_effects: @ 0x08096C2C
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldrb r0, [r2]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _08096C5A
	ldrb r1, [r2, #2]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #8
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	strb r0, [r2, #2]
	ldr r0, [r3]
	ldr r1, _08096C60
	ands r0, r1
	str r0, [r3]
_08096C5A:
	pop {r0}
	bx r0
	.align 2, 0
_08096C60: .4byte 0xFFF9F7BD
	thumb_func_end filters_out_some_ground_effects

	thumb_func_start FilterOutStepOnPuddleGroundEffectIfJumping
FilterOutStepOnPuddleGroundEffectIfJumping: @ 0x08096C64
	push {lr}
	adds r2, r1, #0
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _08096C78
	ldr r0, [r2]
	ldr r1, _08096C7C
	ands r0, r1
	str r0, [r2]
_08096C78:
	pop {r0}
	bx r0
	.align 2, 0
_08096C7C: .4byte 0xFFFFFBFF
	thumb_func_end FilterOutStepOnPuddleGroundEffectIfJumping

	thumb_func_start DoGroundEffects_OnSpawn
DoGroundEffects_OnSpawn: @ 0x08096C80
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _08096CC4
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	bl UpdateEventObjectZCoordAndPriority
	adds r0, r4, #0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnSpawn
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetEventObjectSpriteOamTableForLongGrass
	ldr r2, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl DoFlaggedGroundEffects
	ldrb r1, [r4]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4]
_08096CC4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnSpawn

	thumb_func_start DoGroundEffects_OnBeginStep
DoGroundEffects_OnBeginStep: @ 0x08096CCC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _08096D18
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	bl UpdateEventObjectZCoordAndPriority
	adds r0, r4, #0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnBeginStep
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetEventObjectSpriteOamTableForLongGrass
	adds r0, r4, #0
	mov r1, sp
	bl filters_out_some_ground_effects
	ldr r2, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl DoFlaggedGroundEffects
	ldrb r1, [r4]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4]
_08096D18:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnBeginStep

	thumb_func_start DoGroundEffects_OnFinishStep
DoGroundEffects_OnFinishStep: @ 0x08096D20
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _08096D6C
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	bl UpdateEventObjectZCoordAndPriority
	adds r0, r4, #0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnFinishStep
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetEventObjectSpriteOamTableForLongGrass
	adds r0, r4, #0
	mov r1, sp
	bl FilterOutStepOnPuddleGroundEffectIfJumping
	ldr r2, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl DoFlaggedGroundEffects
	ldrb r1, [r4]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4]
_08096D6C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnFinishStep

	thumb_func_start FreezeEventObject
FreezeEventObject: @ 0x08096D74
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r1, [r5]
	movs r0, #0xa0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08096DFC
	ldrb r0, [r5, #1]
	movs r4, #1
	orrs r0, r4
	strb r0, [r5, #1]
	ldr r3, _08096DF8
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	lsls r1, r1, #7
	ldrb r2, [r5, #2]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #2]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2c
	ldrb r1, [r0]
	lsrs r1, r1, #7
	ands r1, r4
	ldrb r2, [r5, #3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #3]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r5, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0
	b _08096DFE
	.align 2, 0
_08096DF8: .4byte 0x020205AC
_08096DFC:
	movs r0, #1
_08096DFE:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end FreezeEventObject

	thumb_func_start FreezeEventObjects
FreezeEventObjects: @ 0x08096E04
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08096E38
_08096E0A:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08096E28
	ldr r0, _08096E3C
	ldrb r0, [r0, #5]
	cmp r4, r0
	beq _08096E28
	adds r0, r1, #0
	bl FreezeEventObject
_08096E28:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _08096E0A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096E38: .4byte 0x02036FF0
_08096E3C: .4byte 0x02037230
	thumb_func_end FreezeEventObjects

	thumb_func_start FreezeEventObjectsExceptOne
FreezeEventObjectsExceptOne: @ 0x08096E40
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	ldr r6, _08096E7C
_08096E4A:
	cmp r4, r5
	beq _08096E6C
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r6
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08096E6C
	ldr r0, _08096E80
	ldrb r0, [r0, #5]
	cmp r4, r0
	beq _08096E6C
	adds r0, r1, #0
	bl FreezeEventObject
_08096E6C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _08096E4A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096E7C: .4byte 0x02036FF0
_08096E80: .4byte 0x02037230
	thumb_func_end FreezeEventObjectsExceptOne

	thumb_func_start UnfreezeEventObject
UnfreezeEventObject: @ 0x08096E84
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r2, [r5]
	ldr r1, _08096EE4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, r1
	bne _08096EDC
	ldrb r1, [r5, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldr r4, _08096EE8
	ldrb r0, [r5, #4]
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r2, [r5, #2]
	adds r1, #0x2c
	lsrs r2, r2, #7
	lsls r2, r2, #6
	ldrb r3, [r1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r5, #4]
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrb r1, [r5, #3]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	adds r2, #0x2c
	lsls r1, r1, #7
	ldrb r3, [r2]
	movs r0, #0x7f
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_08096EDC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096EE4: .4byte 0x00000101
_08096EE8: .4byte 0x020205AC
	thumb_func_end UnfreezeEventObject

	thumb_func_start UnfreezeEventObjects
UnfreezeEventObjects: @ 0x08096EEC
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _08096F18
_08096EF2:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08096F08
	adds r0, r1, #0
	bl UnfreezeEventObject
_08096F08:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _08096EF2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096F18: .4byte 0x02036FF0
	thumb_func_end UnfreezeEventObjects

	thumb_func_start Step1
Step1: @ 0x08096F1C
	lsls r1, r1, #0x18
	ldr r2, _08096F38
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldrh r2, [r1]
	ldrh r3, [r0, #0x20]
	adds r2, r2, r3
	strh r2, [r0, #0x20]
	ldrh r1, [r1, #2]
	ldrh r2, [r0, #0x22]
	adds r1, r1, r2
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_08096F38: .4byte 0x084E5FD0
	thumb_func_end Step1

	thumb_func_start Step2
Step2: @ 0x08096F3C
	lsls r1, r1, #0x18
	ldr r2, _08096F5C
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r2, r2, #1
	ldrh r3, [r0, #0x20]
	adds r2, r2, r3
	strh r2, [r0, #0x20]
	ldrh r1, [r1, #2]
	lsls r1, r1, #1
	ldrh r2, [r0, #0x22]
	adds r1, r1, r2
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_08096F5C: .4byte 0x084E5FD0
	thumb_func_end Step2

	thumb_func_start Step3
Step3: @ 0x08096F60
	lsls r1, r1, #0x18
	ldr r2, _08096F84
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r3, r2, #1
	adds r2, r2, r3
	ldrh r3, [r0, #0x20]
	adds r2, r2, r3
	strh r2, [r0, #0x20]
	ldrh r1, [r1, #2]
	lsls r2, r1, #1
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	adds r1, r1, r2
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_08096F84: .4byte 0x084E5FD0
	thumb_func_end Step3

	thumb_func_start Step4
Step4: @ 0x08096F88
	lsls r1, r1, #0x18
	ldr r2, _08096FA8
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r2, r2, #2
	ldrh r3, [r0, #0x20]
	adds r2, r2, r3
	strh r2, [r0, #0x20]
	ldrh r1, [r1, #2]
	lsls r1, r1, #2
	ldrh r2, [r0, #0x22]
	adds r1, r1, r2
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_08096FA8: .4byte 0x084E5FD0
	thumb_func_end Step4

	thumb_func_start Step8
Step8: @ 0x08096FAC
	lsls r1, r1, #0x18
	ldr r2, _08096FCC
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r2, r2, #3
	ldrh r3, [r0, #0x20]
	adds r2, r2, r3
	strh r2, [r0, #0x20]
	ldrh r1, [r1, #2]
	lsls r1, r1, #3
	ldrh r2, [r0, #0x22]
	adds r1, r1, r2
	strh r1, [r0, #0x22]
	bx lr
	.align 2, 0
_08096FCC: .4byte 0x084E5FD0
	thumb_func_end Step8

	thumb_func_start oamt_npc_ministep_reset
oamt_npc_ministep_reset: @ 0x08096FD0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #0
	strh r1, [r0, #0x34]
	strh r2, [r0, #0x36]
	strh r3, [r0, #0x38]
	bx lr
	.align 2, 0
	thumb_func_end oamt_npc_ministep_reset

	thumb_func_start obj_npc_ministep
obj_npc_ministep: @ 0x08096FE4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0809703C
	movs r0, #0x36
	ldrsh r2, [r4, r0]
	lsls r0, r2, #1
	adds r0, r0, r5
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _08097044
	ldr r1, _08097040
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0x38
	ldrsh r2, [r4, r1]
	ldr r0, [r0]
	lsls r2, r2, #2
	adds r2, r2, r0
	ldrh r1, [r4, #0x34]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r2]
	adds r0, r4, #0
	bl _call_via_r2
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	blt _08097044
	movs r0, #1
	b _08097046
	.align 2, 0
_0809703C: .4byte 0x084E6BBC
_08097040: .4byte 0x084E6BA8
_08097044:
	movs r0, #0
_08097046:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end obj_npc_ministep

	thumb_func_start sub_0809704C
sub_0809704C: @ 0x0809704C
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	strh r1, [r0, #0x34]
	strh r2, [r0, #0x36]
	strh r2, [r0, #0x38]
	bx lr
	.align 2, 0
	thumb_func_end sub_0809704C

	thumb_func_start sub_0809705C
sub_0809705C: @ 0x0809705C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x36]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809707C
	ldrh r1, [r4, #0x34]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl Step1
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0809707C:
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	bgt _0809708E
	movs r0, #0
	b _08097090
_0809708E:
	movs r0, #1
_08097090:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0809705C

	thumb_func_start sub_08097098
sub_08097098: @ 0x08097098
	ldr r1, _080970A8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080970A8: .4byte 0x084E6C0E
	thumb_func_end sub_08097098

	thumb_func_start sub_080970AC
sub_080970AC: @ 0x080970AC
	ldr r1, _080970BC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080970BC: .4byte 0x084E6BC6
	thumb_func_end sub_080970AC

	thumb_func_start sub_080970C0
sub_080970C0: @ 0x080970C0
	movs r1, #0
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x3c]
	bx lr
	thumb_func_end sub_080970C0

	thumb_func_start sub_080970C8
sub_080970C8: @ 0x080970C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	beq _080970FE
	cmp r0, #1
	bgt _080970E0
	cmp r0, #0
	beq _080970EA
	b _08097162
_080970E0:
	cmp r0, #2
	beq _08097126
	cmp r0, #3
	beq _0809713A
	b _08097162
_080970EA:
	movs r2, #0x3a
	ldrsh r0, [r5, r2]
	bl sub_080970AC
	ldrh r1, [r5, #0x24]
	adds r0, r0, r1
	strh r0, [r5, #0x24]
	movs r2, #0x3a
	ldrsh r0, [r5, r2]
	b _08097158
_080970FE:
	ldrh r0, [r5, #0x3a]
	movs r4, #0x47
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_080970AC
	ldrh r1, [r5, #0x24]
	subs r1, r1, r0
	strh r1, [r5, #0x24]
	ldrh r0, [r5, #0x3a]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl sub_08097098
	ldrh r2, [r5, #0x26]
	adds r0, r0, r2
	b _08097160
_08097126:
	movs r1, #0x3a
	ldrsh r0, [r5, r1]
	bl sub_080970AC
	ldrh r1, [r5, #0x24]
	subs r1, r1, r0
	strh r1, [r5, #0x24]
	movs r2, #0x3a
	ldrsh r0, [r5, r2]
	b _08097158
_0809713A:
	ldrh r0, [r5, #0x3a]
	movs r4, #0x47
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_080970AC
	ldrh r2, [r5, #0x24]
	adds r0, r0, r2
	strh r0, [r5, #0x24]
	ldrh r0, [r5, #0x3a]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
_08097158:
	bl sub_08097098
	ldrh r1, [r5, #0x26]
	adds r0, r0, r1
_08097160:
	strh r0, [r5, #0x26]
_08097162:
	ldrh r0, [r5, #0x3a]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x48
	bne _0809717A
	strh r1, [r5, #0x3a]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
_0809717A:
	movs r2, #0x3c
	ldrsh r0, [r5, r2]
	cmp r0, #4
	bne _08097188
	strh r1, [r5, #0x26]
	strh r1, [r5, #0x24]
	movs r6, #1
_08097188:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_080970C8

	thumb_func_start sub_08097190
sub_08097190: @ 0x08097190
	lsls r1, r1, #0x18
	ldr r2, _080971A8
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1]
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_080971A8: .4byte 0x084E6C88
	thumb_func_end sub_08097190

	thumb_func_start sub_080971AC
sub_080971AC: @ 0x080971AC
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	strh r1, [r0, #0x34]
	strh r2, [r0, #0x36]
	strh r3, [r0, #0x38]
	strh r4, [r0, #0x3a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_080971AC

	thumb_func_start sub_080971CC
sub_080971CC: @ 0x080971CC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _0809724C
	mov r0, sp
	movs r2, #6
	bl memcpy
	add r5, sp, #8
	ldr r1, _08097250
	adds r0, r5, #0
	movs r2, #3
	bl memcpy
	movs r6, #0
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080971FE
	ldrh r1, [r4, #0x34]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl Step1
_080971FE:
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, r5, r1
	ldrb r1, [r1]
	asrs r0, r1
	ldrh r1, [r4, #0x38]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_08097190
	strh r0, [r4, #0x26]
	ldrh r1, [r4, #0x3a]
	adds r1, #1
	strh r1, [r4, #0x3a]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r0, r0, #0x11
	cmp r1, r0
	bne _08097238
	movs r6, #1
_08097238:
	cmp r1, r2
	blt _08097242
	movs r0, #0
	strh r0, [r4, #0x26]
	movs r6, #0xff
_08097242:
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809724C: .4byte 0x084E6C94
_08097250: .4byte 0x084E6C9A
	thumb_func_end sub_080971CC

	thumb_func_start sub_08097254
sub_08097254: @ 0x08097254
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, _080972E0
	mov r0, sp
	movs r2, #6
	bl memcpy
	add r4, sp, #8
	ldr r1, _080972E4
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	movs r6, #0
	movs r1, #0x36
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08097290
	ldrh r1, [r5, #0x3a]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08097290
	ldrh r1, [r5, #0x34]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl Step1
_08097290:
	movs r2, #0x3a
	ldrsh r0, [r5, r2]
	movs r2, #0x36
	ldrsh r1, [r5, r2]
	adds r1, r4, r1
	ldrb r1, [r1]
	asrs r0, r1
	ldrh r1, [r5, #0x38]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_08097190
	strh r0, [r5, #0x26]
	ldrh r1, [r5, #0x3a]
	adds r1, #1
	strh r1, [r5, #0x3a]
	movs r2, #0x36
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r0, r0, #0x11
	cmp r1, r0
	bne _080972CA
	movs r6, #1
_080972CA:
	cmp r1, r2
	blt _080972D4
	movs r0, #0
	strh r0, [r5, #0x26]
	movs r6, #0xff
_080972D4:
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080972E0: .4byte 0x084E6C9E
_080972E4: .4byte 0x084E6CA4
	thumb_func_end sub_08097254

	thumb_func_start SetMovementDelay
SetMovementDelay: @ 0x080972E8
	strh r1, [r0, #0x34]
	bx lr
	thumb_func_end SetMovementDelay

	thumb_func_start WaitForMovementDelay
WaitForMovementDelay: @ 0x080972EC
	push {lr}
	ldrh r1, [r0, #0x34]
	subs r1, #1
	strh r1, [r0, #0x34]
	lsls r1, r1, #0x10
	cmp r1, #0
	beq _080972FE
	movs r0, #0
	b _08097300
_080972FE:
	movs r0, #1
_08097300:
	pop {r1}
	bx r1
	thumb_func_end WaitForMovementDelay

	thumb_func_start SetAndStartSpriteAnim
SetAndStartSpriteAnim: @ 0x08097304
	push {r4, lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r0, #0
	adds r3, #0x2a
	strb r1, [r3]
	adds r4, r0, #0
	adds r4, #0x2c
	ldrb r3, [r4]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r3
	strb r1, [r4]
	adds r1, r2, #0
	bl SeekSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end SetAndStartSpriteAnim

	thumb_func_start SpriteAnimEnded
SpriteAnimEnded: @ 0x0809732C
	push {lr}
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0809733E
	movs r0, #0
	b _08097340
_0809733E:
	movs r0, #1
_08097340:
	pop {r1}
	bx r1
	thumb_func_end SpriteAnimEnded

	thumb_func_start UpdateEventObjectSpriteVisibility
UpdateEventObjectSpriteVisibility: @ 0x08097344
	push {r4, r5, r6, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r3, ip
	adds r3, #0x3e
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080973AC
	mov r0, ip
	ldrh r1, [r0, #0x24]
	ldrh r2, [r0, #0x20]
	adds r1, r1, r2
	mov r4, ip
	adds r4, #0x28
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, _080973A4
	adds r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, ip
	ldrh r1, [r0, #0x26]
	ldrh r2, [r0, #0x22]
	adds r1, r1, r2
	subs r3, #0x15
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r2, _080973A8
	adds r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r2, r3, #0
	b _080973DA
	.align 2, 0
_080973A4: .4byte 0x02021B38
_080973A8: .4byte 0x02021B3A
_080973AC:
	mov r0, ip
	ldrh r1, [r0, #0x24]
	ldrh r2, [r0, #0x20]
	adds r1, r1, r2
	mov r3, ip
	adds r3, #0x28
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, ip
	ldrh r1, [r0, #0x26]
	ldrh r2, [r0, #0x22]
	adds r1, r1, r2
	mov r2, ip
	adds r2, #0x29
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, r3, #0
_080973DA:
	ldrb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x19
	subs r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x19
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	bgt _08097406
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08097412
_08097406:
	mov r4, ip
	adds r4, #0x3e
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_08097412:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xaf
	bgt _08097426
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08097432
_08097426:
	mov r0, ip
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
_08097432:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end UpdateEventObjectSpriteVisibility

	thumb_func_start UpdateEventObjectSpriteSubpriorityAndVisibility
UpdateEventObjectSpriteSubpriorityAndVisibility: @ 0x08097438
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080976D8
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	movs r2, #1
	bl SetObjectSubpriorityByZCoord
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateEventObjectSpriteVisibility
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdateEventObjectSpriteSubpriorityAndVisibility

	thumb_func_start sub_08097460
sub_08097460: @ 0x08097460
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x3f
_08097466:
	ldr r0, _08097494
	adds r2, r5, r0
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097486
	ldr r1, [r2, #0x1c]
	ldr r0, _08097498
	cmp r1, r0
	bne _08097486
	adds r0, r2, #0
	bl DestroySprite
_08097486:
	adds r5, #0x44
	subs r4, #1
	cmp r4, #0
	bge _08097466
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097494: .4byte 0x020205AC
_08097498: .4byte 0x08097439
	thumb_func_end sub_08097460

	thumb_func_start sub_0809749C
sub_0809749C: @ 0x0809749C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r3, #0
	ldr r6, _080974D0
	movs r4, #0
_080974A8:
	adds r2, r4, r6
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080974D8
	ldr r1, [r2, #0x1c]
	ldr r0, _080974D4
	cmp r1, r0
	bne _080974D8
	ldrh r0, [r2, #0x2e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r5
	bne _080974D8
	adds r0, r3, #0
	b _080974E2
	.align 2, 0
_080974D0: .4byte 0x020205AC
_080974D4: .4byte 0x08097439
_080974D8:
	adds r4, #0x44
	adds r3, #1
	cmp r3, #0x3f
	ble _080974A8
	movs r0, #0x40
_080974E2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0809749C

	thumb_func_start sub_080974E8
sub_080974E8: @ 0x080974E8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl sub_0809749C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0809751A
	lsls r4, r0, #4
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _08097520
	adds r4, r4, r0
	adds r0, r5, #0
	bl GetJumpInPlaceMovementAction
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl StartSpriteAnim
_0809751A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097520: .4byte 0x020205AC
	thumb_func_end sub_080974E8

	thumb_func_start sub_08097524
sub_08097524: @ 0x08097524
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl sub_0809749C
	adds r1, r0, #0
	cmp r1, #0x40
	beq _080975AE
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08097588
	adds r4, r0, r1
	adds r0, r5, #0
	bl GetEventObjectGraphicsInfo
	ldrh r3, [r4, #4]
	lsls r3, r3, #0x16
	ldr r1, [r0, #0x10]
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [r4]
	str r2, [r4, #4]
	lsrs r3, r3, #0x16
	ldrh r2, [r4, #4]
	ldr r1, _0809758C
	ands r1, r2
	orrs r1, r3
	strh r1, [r4, #4]
	ldrb r2, [r0, #0xc]
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x18
	ldrb r3, [r4, #5]
	movs r1, #0xf
	ands r1, r3
	orrs r1, r2
	strb r1, [r4, #5]
	ldr r1, [r0, #0x1c]
	str r1, [r4, #0xc]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	bne _08097590
	str r1, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x42
	strb r1, [r0]
	b _080975A6
	.align 2, 0
_08097588: .4byte 0x020205AC
_0809758C: .4byte 0xFFFFFC00
_08097590:
	adds r0, r4, #0
	bl SetSubspriteTables
	adds r2, r4, #0
	adds r2, #0x42
	ldrb r0, [r2]
	movs r1, #0x3f
	ands r1, r0
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r2]
_080975A6:
	adds r0, r4, #0
	movs r1, #0
	bl StartSpriteAnim
_080975AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_08097524

	thumb_func_start sub_080975B4
sub_080975B4: @ 0x080975B4
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0809749C
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r2, #0
	cmp r2, #0x40
	beq _080975F0
	cmp r4, #0
	beq _080975E4
	ldr r0, _080975E0
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1, #0x32]
	b _080975F0
	.align 2, 0
_080975E0: .4byte 0x020205AC
_080975E4:
	ldr r1, _080975F8
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r4, [r0, #0x32]
_080975F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080975F8: .4byte 0x020205AC
	thumb_func_end sub_080975B4

	thumb_func_start sub_080975FC
sub_080975FC: @ 0x080975FC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0809749C
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	bne _08097612
	movs r0, #0
	b _0809762A
_08097612:
	movs r3, #0
	ldr r0, _08097630
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _08097628
	movs r3, #1
_08097628:
	adds r0, r3, #0
_0809762A:
	pop {r1}
	bx r1
	.align 2, 0
_08097630: .4byte 0x020205AC
	thumb_func_end sub_080975FC

	thumb_func_start sub_08097634
sub_08097634: @ 0x08097634
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	bl sub_0809749C
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _0809765A
	ldr r0, _08097660
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0
	strh r4, [r1, #0x34]
	strh r0, [r1, #0x36]
_0809765A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097660: .4byte 0x020205AC
	thumb_func_end sub_08097634

	thumb_func_start sub_08097664
sub_08097664: @ 0x08097664
	push {lr}
	adds r2, r0, #0
	movs r1, #0x36
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08097676
	cmp r0, #1
	beq _0809767E
	b _0809769C
_08097676:
	strh r0, [r2, #0x26]
	ldrh r0, [r2, #0x36]
	adds r0, #1
	strh r0, [r2, #0x36]
_0809767E:
	ldrh r0, [r2, #0x26]
	subs r0, #8
	movs r3, #0
	strh r0, [r2, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa0
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0809769C
	strh r3, [r2, #0x26]
	movs r0, #1
	strh r0, [r2, #0x32]
	strh r3, [r2, #0x34]
	strh r3, [r2, #0x36]
_0809769C:
	pop {r0}
	bx r0
	thumb_func_end sub_08097664

	thumb_func_start sub_080976A0
sub_080976A0: @ 0x080976A0
	push {lr}
	adds r1, r0, #0
	movs r2, #0x36
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080976B2
	cmp r0, #1
	beq _080976BC
	b _080976CE
_080976B2:
	ldr r0, _080976D4
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_080976BC:
	ldrh r0, [r1, #0x26]
	adds r0, #8
	strh r0, [r1, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _080976CE
	strh r0, [r1, #0x34]
	strh r0, [r1, #0x36]
_080976CE:
	pop {r0}
	bx r0
	.align 2, 0
_080976D4: .4byte 0x0000FF60
	thumb_func_end sub_080976A0

	thumb_func_start sub_080976D8
sub_080976D8: @ 0x080976D8
	push {lr}
	adds r1, r0, #0
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #1
	beq _080976F4
	cmp r0, #1
	bgt _080976EE
	cmp r0, #0
	beq _08097714
	b _08097704
_080976EE:
	cmp r0, #2
	beq _080976FC
	b _08097704
_080976F4:
	adds r0, r1, #0
	bl sub_080976A0
	b _08097714
_080976FC:
	adds r0, r1, #0
	bl sub_08097664
	b _08097714
_08097704:
	movs r0, #0
	strh r0, [r1, #0x34]
	ldr r0, _08097718
	ldr r1, _0809771C
	ldr r2, _08097720
	movs r3, #1
	bl AGBAssert
_08097714:
	pop {r0}
	bx r0
	.align 2, 0
_08097718: .4byte 0x084E6CA8
_0809771C: .4byte 0x00003106
_08097720: .4byte 0x084E6CB4
	thumb_func_end sub_080976D8

	thumb_func_start sub_08097724
sub_08097724: @ 0x08097724
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0809749C
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _08097748
	ldr r0, _0809774C
	lsls r1, r2, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08097750
_08097748:
	movs r0, #0
	b _08097752
	.align 2, 0
_0809774C: .4byte 0x020205AC
_08097750:
	movs r0, #1
_08097752:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_08097724

	thumb_func_start sub_08097758
sub_08097758: @ 0x08097758
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0809777C
	adds r2, r1, #4
	adds r3, r1, #0
	adds r3, #8
	bl EventObjectGetLocalIdAndMap
	adds r0, r4, #0
	bl FieldEffectStart
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809777C: .4byte 0x020388A8
	thumb_func_end sub_08097758

	thumb_func_start DoShadowFieldEffect
DoShadowFieldEffect: @ 0x08097780
	push {lr}
	adds r1, r0, #0
	ldrb r2, [r1, #2]
	lsls r0, r2, #0x19
	cmp r0, #0
	blt _08097798
	movs r0, #0x40
	orrs r0, r2
	strb r0, [r1, #2]
	movs r0, #3
	bl sub_08097758
_08097798:
	pop {r0}
	bx r0
	thumb_func_end DoShadowFieldEffect

	thumb_func_start DoRippleFieldEffect
DoRippleFieldEffect: @ 0x0809779C
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r0, #5]
	bl GetEventObjectGraphicsInfo
	ldr r2, _080977D4
	movs r3, #0x20
	ldrsh r1, [r4, r3]
	str r1, [r2]
	movs r3, #0x22
	ldrsh r1, [r4, r3]
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r1, r1, r0
	subs r1, #2
	str r1, [r2, #4]
	movs r0, #0x97
	str r0, [r2, #8]
	movs r0, #3
	str r0, [r2, #0xc]
	movs r0, #5
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080977D4: .4byte 0x020388A8
	thumb_func_end DoRippleFieldEffect

	thumb_func_start MovementAction_StoreAndLockAnim_Step0
MovementAction_StoreAndLockAnim_Step0: @ 0x080977D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	movs r0, #0
	mov ip, r0
	ldr r0, _08097804
	ldr r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _08097808
	movs r0, #0x14
	bl AllocZeroed
	str r0, [r6]
	ldrb r1, [r4, #8]
	strb r1, [r0]
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x10]
	b _08097854
	.align 2, 0
_08097804: .4byte 0x02037258
_08097808:
	movs r2, #0x10
	movs r5, #0
	movs r1, #0
	adds r3, r6, #0
	b _08097818
_08097812:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08097818:
	cmp r1, #0xf
	bhi _0809783A
	cmp r2, #0x10
	bne _0809782C
	ldr r0, [r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809782C
	adds r2, r1, #0
_0809782C:
	ldr r0, [r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r7, [r4, #8]
	cmp r0, r7
	bne _08097812
	movs r5, #1
_0809783A:
	cmp r5, #0
	bne _08097856
	cmp r2, #0x10
	beq _08097856
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r1, [r4, #8]
	strb r1, [r0]
	ldr r1, [r6]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	movs r0, #1
_08097854:
	mov ip, r0
_08097856:
	mov r1, ip
	cmp r1, #1
	bne _08097868
	ldrb r0, [r4, #1]
	movs r1, #0x10
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #1]
_08097868:
	movs r0, #1
	mov r7, r8
	strh r0, [r7, #0x32]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end MovementAction_StoreAndLockAnim_Step0

	thumb_func_start MovementAction_FreeAndUnlockAnim_Step0
MovementAction_FreeAndUnlockAnim_Step0: @ 0x08097878
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	movs r0, #1
	strh r0, [r1, #0x32]
	ldr r5, _080978FC
	ldr r0, [r5]
	cmp r0, #0
	beq _080978F0
	movs r7, #0
	adds r0, r6, #0
	bl FindLockedEventObjectIndex
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x10
	beq _080978B0
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r1, [r5]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	strb r0, [r1, #0x10]
	movs r7, #1
_080978B0:
	ldr r0, [r5]
	ldrb r4, [r0, #0x10]
	cmp r4, #0
	bne _080978BE
	bl Free
	str r4, [r5]
_080978BE:
	cmp r7, #1
	bne _080978F0
	ldrb r0, [r6, #5]
	bl GetEventObjectGraphicsInfo
	ldrb r1, [r0, #0xc]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6, #1]
	mov r2, r8
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_080978F0:
	movs r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080978FC: .4byte 0x02037258
	thumb_func_end MovementAction_FreeAndUnlockAnim_Step0

	thumb_func_start FindLockedEventObjectIndex
FindLockedEventObjectIndex: @ 0x08097900
	push {lr}
	movs r2, #0
	ldr r1, _08097918
	ldr r1, [r1]
	ldrb r3, [r0, #8]
_0809790A:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r3
	bne _0809791C
	adds r0, r2, #0
	b _08097928
	.align 2, 0
_08097918: .4byte 0x02037258
_0809791C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0809790A
	movs r0, #0x10
_08097928:
	pop {r1}
	bx r1
	thumb_func_end FindLockedEventObjectIndex

	thumb_func_start CreateLevitateMovementTask
CreateLevitateMovementTask: @ 0x0809792C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08097960
	movs r1, #0xff
	bl CreateTask
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _08097964
	adds r4, r4, r0
	adds r0, r4, #0
	adds r0, #8
	adds r1, r6, #0
	bl StoreWordInTwoHalfwords
	strb r5, [r6, #0x1b]
	ldr r0, _08097968
	strh r0, [r4, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08097960: .4byte 0x0809796D
_08097964: .4byte 0x03005B60
_08097968: .4byte 0x0000FFFF
	thumb_func_end CreateLevitateMovementTask

	thumb_func_start ApplyLevitateMovement
ApplyLevitateMovement: @ 0x0809796C
	push {r4, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _080979C4
	adds r4, r1, r0
	adds r0, r4, #0
	adds r0, #8
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	ldrb r1, [r0, #4]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080979C8
	adds r2, r0, r1
	ldrh r1, [r4, #0xc]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080979A8
	ldrh r0, [r4, #0xe]
	ldrh r1, [r2, #0x26]
	adds r0, r0, r1
	strh r0, [r2, #0x26]
_080979A8:
	ldrh r1, [r4, #0xc]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080979B8
	ldrh r0, [r4, #0xe]
	rsbs r0, r0, #0
	strh r0, [r4, #0xe]
_080979B8:
	adds r0, r1, #1
	strh r0, [r4, #0xc]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080979C4: .4byte 0x03005B60
_080979C8: .4byte 0x020205AC
	thumb_func_end ApplyLevitateMovement

	thumb_func_start DestroyExtraMovementTask
DestroyExtraMovementTask: @ 0x080979CC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r1, _080979F8
	adds r0, r0, r1
	adds r0, #8
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	adds r0, r4, #0
	bl DestroyTask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080979F8: .4byte 0x03005B60
	thumb_func_end DestroyExtraMovementTask

	thumb_func_start sub_080979FC
sub_080979FC: @ 0x080979FC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r4, #0
	ldr r7, _08097A40
_08097A0A:
	cmp r4, r6
	beq _08097A30
	cmp r4, r5
	beq _08097A30
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r7
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08097A30
	ldr r0, _08097A44
	ldrb r0, [r0, #5]
	cmp r4, r0
	beq _08097A30
	adds r0, r1, #0
	bl FreezeEventObject
_08097A30:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _08097A0A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097A40: .4byte 0x02036FF0
_08097A44: .4byte 0x02037230
	thumb_func_end sub_080979FC

	thumb_func_start MovementAction_FlyUp_Step0
MovementAction_FlyUp_Step0: @ 0x08097A48
	movs r0, #0
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #0x32]
	adds r0, #1
	strh r0, [r1, #0x32]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end MovementAction_FlyUp_Step0

	thumb_func_start MovementAction_FlyUp_Step1
MovementAction_FlyUp_Step1: @ 0x08097A58
	push {lr}
	adds r2, r1, #0
	ldrh r0, [r2, #0x26]
	subs r0, #8
	strh r0, [r2, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa0
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08097A74
	ldrh r0, [r2, #0x32]
	adds r0, #1
	strh r0, [r2, #0x32]
_08097A74:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_FlyUp_Step1

	thumb_func_start MovementAction_FlyDown_Step0
MovementAction_FlyDown_Step0: @ 0x08097A7C
	ldr r0, _08097A8C
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #0x32]
	adds r0, #1
	strh r0, [r1, #0x32]
	movs r0, #0
	bx lr
	.align 2, 0
_08097A8C: .4byte 0x0000FF60
	thumb_func_end MovementAction_FlyDown_Step0

	thumb_func_start MovementAction_FlyDown_Step1
MovementAction_FlyDown_Step1: @ 0x08097A90
	push {lr}
	ldrh r0, [r1, #0x26]
	adds r0, #8
	strh r0, [r1, #0x26]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08097AA4
	ldrh r0, [r1, #0x32]
	adds r0, #1
	strh r0, [r1, #0x32]
_08097AA4:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MovementAction_FlyDown_Step1

	thumb_func_start MovementAction_Finish
MovementAction_Finish: @ 0x08097AAC
	movs r0, #1
	bx lr
	thumb_func_end MovementAction_Finish

