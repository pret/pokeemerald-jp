.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start InitMossdeepGymTiles
InitMossdeepGymTiles: @ 0x081A86B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _081A86D8
	ldr r0, [r4]
	cmp r0, #0
	bne _081A86CA
	movs r0, #0x44
	bl AllocZeroed
	str r0, [r4]
_081A86CA:
	ldr r0, [r4]
	adds r0, #0x41
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081A86D8: .4byte 0x0203CB1C
	thumb_func_end InitMossdeepGymTiles

	thumb_func_start FinishMossdeepGymTiles
FinishMossdeepGymTiles: @ 0x081A86DC
	push {r4, lr}
	ldr r4, _081A8718
	ldr r0, [r4]
	cmp r0, #0
	beq _081A86EE
	bl Free
	movs r0, #0
	str r0, [r4]
_081A86EE:
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl GetEventObjectIdByLocalIdAndMap
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _081A871C
	adds r0, r0, r1
	bl MovementAction_AcroEndWheelieFaceLeft_Step0
	bl sub_080D2C2C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A8718: .4byte 0x0203CB1C
_081A871C: .4byte 0x02036FF0
	thumb_func_end FinishMossdeepGymTiles

	thumb_func_start MossdeepGym_MoveEvents
MossdeepGym_MoveEvents: @ 0x081A8720
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _081A87B8
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r1, r1, r0
	mov sb, r1
	movs r3, #0
	mov sl, r3
	mov r8, r3
_081A8744:
	mov r0, r8
	lsls r4, r0, #1
	adds r1, r4, r0
	lsls r1, r1, #3
	add r1, sb
	ldrh r0, [r1, #4]
	adds r0, #7
	ldrh r1, [r1, #6]
	adds r1, #7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _081A87BC
	ldr r0, [r0]
	adds r0, #0x41
	ldrb r0, [r0]
	movs r2, #0xa6
	lsls r2, r2, #2
	cmp r0, #0
	bne _081A8778
	subs r2, #0x48
_081A8778:
	ldr r0, _081A87C0
	cmp r1, r0
	bls _081A8854
	subs r1, r1, r2
	adds r0, r1, #0
	cmp r1, #0
	bge _081A8788
	adds r0, r1, #7
_081A8788:
	asrs r2, r0, #3
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _081A8854
	ldr r3, [sp]
	cmp r0, r3
	bne _081A8854
	lsls r0, r2, #3
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bhi _081A8854
	movs r1, #0
	movs r2, #0
	cmp r5, #1
	beq _081A87D8
	cmp r5, #1
	bgt _081A87C4
	cmp r5, #0
	beq _081A87CE
	b _081A8854
	.align 2, 0
_081A87B8: .4byte 0x03005AEC
_081A87BC: .4byte 0x0203CB1C
_081A87C0: .4byte 0x0000024F
_081A87C4:
	cmp r5, #2
	beq _081A87E4
	cmp r5, #3
	beq _081A87F0
	b _081A8854
_081A87CE:
	ldr r7, _081A87D4
	movs r1, #1
	b _081A87F4
	.align 2, 0
_081A87D4: .4byte 0x085DDED0
_081A87D8:
	ldr r7, _081A87E0
	movs r2, #1
	b _081A87F4
	.align 2, 0
_081A87E0: .4byte 0x085DDED4
_081A87E4:
	ldr r7, _081A87EC
	movs r1, #0xff
	b _081A87F4
	.align 2, 0
_081A87EC: .4byte 0x085DDED8
_081A87F0:
	ldr r7, _081A8844
	movs r2, #0xff
_081A87F4:
	mov r3, r8
	adds r0, r4, r3
	lsls r0, r0, #3
	mov r3, sb
	adds r4, r0, r3
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r4, #4]
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r4, #6]
	adds r0, r0, r3
	strh r0, [r4, #6]
	ldrb r0, [r4]
	ldr r6, _081A8848
	ldr r2, [r6]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _081A884C
	mov r0, r8
	adds r1, r5, #0
	bl AddEventObject
	ldrb r4, [r4]
	mov sl, r4
	mov r0, sl
	ldr r2, [r6]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	adds r3, r7, #0
	bl ScriptMovement_StartObjectMovementScript
	b _081A8854
	.align 2, 0
_081A8844: .4byte 0x085DDEDC
_081A8848: .4byte 0x03005AEC
_081A884C:
	mov r0, r8
	adds r1, r5, #0
	bl sub_081A8B14
_081A8854:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x3f
	bhi _081A8864
	b _081A8744
_081A8864:
	mov r0, sl
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end MossdeepGym_MoveEvents

	thumb_func_start MossdeepGym_TurnEvents
MossdeepGym_TurnEvents: @ 0x081A8878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _081A8924
	ldr r2, [r1]
	cmp r2, #0
	bne _081A888C
	b _081A8ACA
_081A888C:
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	movs r3, #0xa6
	lsls r3, r3, #2
	mov sl, r3
	cmp r0, #0
	bne _081A88A2
	movs r0, #0x94
	lsls r0, r0, #2
	mov sl, r0
_081A88A2:
	ldr r0, _081A8928
	ldr r0, [r0]
	movs r3, #0xc7
	lsls r3, r3, #4
	adds r7, r0, r3
	movs r0, #0
	mov sb, r0
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp sb, r0
	blo _081A88BC
	b _081A8ACA
_081A88BC:
	mov r8, r1
_081A88BE:
	mov r1, r8
	ldr r0, [r1]
	mov r2, sb
	lsls r4, r2, #2
	adds r0, r0, r4
	ldrb r0, [r0, #1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r7
	ldrh r0, [r1, #4]
	adds r0, #7
	ldrh r1, [r1, #6]
	adds r1, #7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r3, sl
	subs r1, r0, r3
	adds r0, r1, #0
	cmp r1, #0
	bge _081A88F6
	adds r0, r1, #7
_081A88F6:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r4
	ldrb r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _081A8916
	cmp r1, #3
	bne _081A892C
_081A8916:
	movs r0, #3
	rsbs r0, r0, #0
	movs r6, #0
	cmp r1, r0
	bne _081A8934
	b _081A8932
	.align 2, 0
_081A8924: .4byte 0x0203CB1C
_081A8928: .4byte 0x03005AEC
_081A892C:
	movs r6, #2
	cmp r1, #0
	ble _081A8934
_081A8932:
	movs r6, #1
_081A8934:
	ldr r5, _081A8980
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r1, _081A8984
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl GetEventObjectIdByLocalIdAndMap
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x10
	bne _081A895C
	b _081A8AB2
_081A895C:
	ldr r0, _081A8988
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r1, r0, #0
	cmp r6, #0
	bne _081A8A1C
	cmp r0, #2
	beq _081A89E0
	cmp r0, #2
	bgt _081A898C
	cmp r0, #1
	beq _081A89B0
	b _081A8AB2
	.align 2, 0
_081A8980: .4byte 0x0203CB1C
_081A8984: .4byte 0x03005AEC
_081A8988: .4byte 0x02036FF0
_081A898C:
	cmp r0, #3
	beq _081A89C8
	cmp r0, #4
	beq _081A8996
	b _081A8AB2
_081A8996:
	ldr r3, _081A89AC
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #7
	b _081A89F2
	.align 2, 0
_081A89AC: .4byte 0x085DDEE6
_081A89B0:
	ldr r3, _081A89C4
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #0xa
	b _081A89F2
	.align 2, 0
_081A89C4: .4byte 0x085DDEE0
_081A89C8:
	ldr r3, _081A89DC
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #8
	b _081A89F2
	.align 2, 0
_081A89DC: .4byte 0x085DDEE2
_081A89E0:
	ldr r3, _081A8A14
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #9
_081A89F2:
	strb r1, [r0, #9]
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r1, _081A8A18
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl ScriptMovement_StartObjectMovementScript
	b _081A8AB2
	.align 2, 0
_081A8A14: .4byte 0x085DDEE4
_081A8A18: .4byte 0x03005AEC
_081A8A1C:
	cmp r6, #1
	bne _081A8AB2
	cmp r0, #2
	beq _081A8A80
	cmp r0, #2
	bgt _081A8A2E
	cmp r0, #1
	beq _081A8A50
	b _081A8AB2
_081A8A2E:
	cmp r1, #3
	beq _081A8A68
	cmp r1, #4
	bne _081A8AB2
	ldr r3, _081A8A4C
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #8
	b _081A8A92
	.align 2, 0
_081A8A4C: .4byte 0x085DDEE2
_081A8A50:
	ldr r3, _081A8A64
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #9
	b _081A8A92
	.align 2, 0
_081A8A64: .4byte 0x085DDEE4
_081A8A68:
	ldr r3, _081A8A7C
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #7
	b _081A8A92
	.align 2, 0
_081A8A7C: .4byte 0x085DDEE6
_081A8A80:
	ldr r3, _081A8AD8
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #0xa
_081A8A92:
	strb r1, [r0, #9]
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r1, _081A8ADC
	ldr r2, [r1]
	ldrb r1, [r2, #5]
	ldrb r2, [r2, #4]
	bl ScriptMovement_StartObjectMovementScript
_081A8AB2:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r3, r8
	ldr r0, [r3]
	adds r0, #0x40
	ldrb r0, [r0]
	cmp sb, r0
	bhs _081A8ACA
	b _081A88BE
_081A8ACA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081A8AD8: .4byte 0x085DDEE0
_081A8ADC: .4byte 0x03005AEC
	thumb_func_end MossdeepGym_TurnEvents

	thumb_func_start AddEventObject
AddEventObject: @ 0x081A8AE0
	push {r4, lr}
	ldr r4, _081A8B10
	ldr r3, [r4]
	adds r2, r3, #0
	adds r2, #0x40
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r3, r3, r2
	strb r0, [r3, #1]
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	strb r1, [r2]
	ldr r1, [r4]
	adds r1, #0x40
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081A8B10: .4byte 0x0203CB1C
	thumb_func_end AddEventObject

	thumb_func_start sub_081A8B14
sub_081A8B14: @ 0x081A8B14
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, _081A8B80
	ldr r0, [r0]
	movs r1, #0xc7
	lsls r1, r1, #4
	adds r5, r0, r1
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r0, [r1, #4]
	adds r0, #7
	ldrh r1, [r1, #6]
	adds r1, #7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl MapGridGetMetatileIdAt
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _081A8B84
	ldr r0, [r0]
	adds r0, #0x41
	ldrb r0, [r0]
	movs r1, #0xa6
	lsls r1, r1, #2
	cmp r0, #0
	bne _081A8B5A
	subs r1, #0x48
_081A8B5A:
	subs r1, r2, r1
	adds r0, r1, #0
	cmp r1, #0
	bge _081A8B64
	adds r0, r1, #7
_081A8B64:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, r0, r6
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _081A8B7C
	cmp r1, #3
	bne _081A8B88
_081A8B7C:
	movs r2, #0
	b _081A8B9A
	.align 2, 0
_081A8B80: .4byte 0x03005AEC
_081A8B84: .4byte 0x0203CB1C
_081A8B88:
	cmp r1, #0
	bgt _081A8B94
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _081A8B98
_081A8B94:
	movs r2, #1
	b _081A8B9A
_081A8B98:
	movs r2, #2
_081A8B9A:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r0, r5
	ldrb r0, [r1, #9]
	adds r3, r0, #0
	cmp r2, #0
	bne _081A8BCC
	cmp r0, #8
	beq _081A8BF2
	cmp r0, #8
	bgt _081A8BB8
	cmp r0, #7
	beq _081A8BC8
	b _081A8BF6
_081A8BB8:
	cmp r0, #9
	beq _081A8BC4
	cmp r0, #0xa
	bne _081A8BF6
	movs r0, #7
	b _081A8BF4
_081A8BC4:
	movs r0, #8
	b _081A8BF4
_081A8BC8:
	movs r0, #9
	b _081A8BF4
_081A8BCC:
	cmp r2, #1
	bne _081A8BF6
	cmp r0, #8
	beq _081A8BEA
	cmp r0, #8
	bgt _081A8BDE
	cmp r0, #7
	beq _081A8BF2
	b _081A8BF6
_081A8BDE:
	cmp r3, #9
	beq _081A8BEE
	cmp r3, #0xa
	bne _081A8BF6
	movs r0, #8
	b _081A8BF4
_081A8BEA:
	movs r0, #9
	b _081A8BF4
_081A8BEE:
	movs r0, #7
	b _081A8BF4
_081A8BF2:
	movs r0, #0xa
_081A8BF4:
	strb r0, [r1, #9]
_081A8BF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_081A8B14

