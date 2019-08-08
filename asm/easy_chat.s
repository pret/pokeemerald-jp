.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start DoEasyChatScreen
DoEasyChatScreen: @ 0x0811AA5C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r5, r3, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	bl ResetTasks
	ldr r0, _0811AABC
	movs r1, #0
	bl CreateTask
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0811AAC0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r6, [r0, #0xa]
	strh r5, [r0, #0x16]
	adds r0, r4, #0
	movs r1, #2
	mov r2, r8
	bl SetWordTaskArg
	adds r0, r4, #0
	movs r1, #4
	mov r2, sb
	bl SetWordTaskArg
	ldr r0, _0811AAC4
	bl SetMainCallback2
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811AABC: .4byte 0x0811AB11
_0811AAC0: .4byte 0x03005B60
_0811AAC4: .4byte 0x0811AAC9
	thumb_func_end DoEasyChatScreen

	thumb_func_start MainCallback_EasyChatScreen
MainCallback_EasyChatScreen: @ 0x0811AAC8
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end MainCallback_EasyChatScreen

	thumb_func_start VBlankCallback_EasyChatScreen
VBlankCallback_EasyChatScreen: @ 0x0811AAE0
	push {lr}
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end VBlankCallback_EasyChatScreen

	thumb_func_start sub_0811AAF4
sub_0811AAF4: @ 0x0811AAF4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0811AB0C
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	str r1, [r2]
	movs r0, #0
	strh r0, [r2, #8]
	bx lr
	.align 2, 0
_0811AB0C: .4byte 0x03005B60
	thumb_func_end sub_0811AAF4

	thumb_func_start sub_0811AB10
sub_0811AB10: @ 0x0811AB10
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl IsUpdateLinkStateCBActive
	cmp r0, #0
	bne _0811AB2C
_0811AB1E:
	adds r0, r4, #0
	bl sub_0811AC78
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811AB1E
	b _0811AB3A
_0811AB2C:
	adds r0, r4, #0
	bl sub_0811AC78
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0811AB42
_0811AB3A:
	ldr r1, _0811AB48
	adds r0, r4, #0
	bl sub_0811AAF4
_0811AB42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811AB48: .4byte 0x0811AB4D
	thumb_func_end sub_0811AB10

	thumb_func_start sub_0811AB4C
sub_0811AB4C: @ 0x0811AB4C
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _0811AB74
	adds r5, r0, r1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #5
	bls _0811AB68
	b _0811AC6C
_0811AB68:
	lsls r0, r0, #2
	ldr r1, _0811AB78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811AB74: .4byte 0x03005B68
_0811AB78: .4byte 0x0811AB7C
_0811AB7C: @ jump table
	.4byte _0811AB94 @ case 0
	.4byte _0811ABC0 @ case 1
	.4byte _0811AC1C @ case 2
	.4byte _0811AC24 @ case 3
	.4byte _0811AC3C @ case 4
	.4byte _0811AC5C @ case 5
_0811AB94:
	ldr r0, _0811ABBC
	bl SetVBlankCallback
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl BlendPalettes
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r4, #0
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	movs r0, #5
	b _0811AC6A
	.align 2, 0
_0811ABBC: .4byte 0x0811AAE1
_0811ABC0:
	bl sub_0811B2EC
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r6, r4, #0
	adds r0, r4, #0
	bl sub_0811B0DC
	cmp r0, #0
	beq _0811ABEE
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #2
	rsbs r1, r1, #0
	movs r2, #0
	str r2, [sp]
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #3
	strh r0, [r5]
	strh r4, [r5, #0xc]
	b _0811AC6C
_0811ABEE:
	cmp r4, #0x18
	bne _0811AC06
	movs r1, #1
	rsbs r1, r1, #0
	str r0, [sp]
	adds r0, r1, #0
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #4
	b _0811AC6A
_0811AC06:
	cmp r6, #0
	beq _0811AC6C
	movs r0, #5
	bl PlaySE
	adds r0, r6, #0
	bl sub_0811CA18
	ldrh r0, [r5]
	adds r0, #1
	b _0811AC6A
_0811AC1C:
	bl sub_0811CA30
	lsls r0, r0, #0x18
	b _0811AC64
_0811AC24:
	ldr r0, _0811AC38
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0811AC6C
	ldrh r0, [r5, #0xc]
	bl sub_0811B0F4
	b _0811AC6C
	.align 2, 0
_0811AC38: .4byte 0x02037C74
_0811AC3C:
	ldr r0, _0811AC58
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0811AC6C
	adds r0, r2, #0
	movs r1, #4
	bl GetWordTaskArg
	bl sub_0811AD20
	b _0811AC6C
	.align 2, 0
_0811AC58: .4byte 0x02037C74
_0811AC5C:
	ldr r0, _0811AC74
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
_0811AC64:
	cmp r0, #0
	bne _0811AC6C
	movs r0, #1
_0811AC6A:
	strh r0, [r5]
_0811AC6C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811AC74: .4byte 0x02037C74
	thumb_func_end sub_0811AB4C

	thumb_func_start sub_0811AC78
sub_0811AC78: @ 0x0811AC78
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0811AC9C
	adds r6, r0, r1
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0811AD0C
	lsls r0, r0, #2
	ldr r1, _0811ACA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811AC9C: .4byte 0x03005B68
_0811ACA0: .4byte 0x0811ACA4
_0811ACA4: @ jump table
	.4byte _0811ACB8 @ case 0
	.4byte _0811ACCC @ case 1
	.4byte _0811ACD2 @ case 2
	.4byte _0811ACE8 @ case 3
	.4byte _0811AD00 @ case 4
_0811ACB8:
	movs r0, #0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	b _0811AD10
_0811ACCC:
	bl sub_0811F7E8
	b _0811ACEC
_0811ACD2:
	ldrb r4, [r6, #2]
	adds r0, r5, #0
	movs r1, #2
	bl GetWordTaskArg
	adds r1, r0, #0
	ldrb r2, [r6, #0xe]
	adds r0, r4, #0
	bl EasyChat_AllocateResources
	b _0811ACEC
_0811ACE8:
	bl sub_0811C850
_0811ACEC:
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811AD10
	adds r0, r5, #0
	movs r1, #4
	bl GetWordTaskArg
	bl sub_0811AD20
	b _0811AD10
_0811AD00:
	bl sub_0811C868
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811AD10
	b _0811AD16
_0811AD0C:
	movs r0, #0
	b _0811AD18
_0811AD10:
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
_0811AD16:
	movs r0, #1
_0811AD18:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811AC78

	thumb_func_start sub_0811AD20
sub_0811AD20: @ 0x0811AD20
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0811C9FC
	bl EasyChat_FreeResources
	bl sub_0811F814
	bl FreeAllWindowBuffers
	adds r0, r4, #0
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0811AD20

	thumb_func_start ShowEasyChatScreen
ShowEasyChatScreen: @ 0x0811AD40
	push {r4, r5, lr}
	movs r5, #3
	ldr r0, _0811AD58
	ldrh r0, [r0]
	cmp r0, #0x14
	bls _0811AD4E
	b _0811B024
_0811AD4E:
	lsls r0, r0, #2
	ldr r1, _0811AD5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811AD58: .4byte 0x02037280
_0811AD5C: .4byte 0x0811AD60
_0811AD60: @ jump table
	.4byte _0811ADB4 @ case 0
	.4byte _0811ADC8 @ case 1
	.4byte _0811ADDC @ case 2
	.4byte _0811ADF0 @ case 3
	.4byte _0811AE04 @ case 4
	.4byte _0811AE54 @ case 5
	.4byte _0811AE28 @ case 6
	.4byte _0811AE80 @ case 7
	.4byte _0811AEB4 @ case 8
	.4byte _0811AED8 @ case 9
	.4byte _0811AF04 @ case 10
	.4byte _0811AF24 @ case 11
	.4byte _0811AF58 @ case 12
	.4byte _0811AF7C @ case 13
	.4byte _0811AF8C @ case 14
	.4byte _0811AFC0 @ case 15
	.4byte _0811B024 @ case 16
	.4byte _0811AFD4 @ case 17
	.4byte _0811AFE8 @ case 18
	.4byte _0811AFFC @ case 19
	.4byte _0811B00C @ case 20
_0811ADB4:
	ldr r0, _0811ADC0
	ldr r0, [r0]
	ldr r1, _0811ADC4
	adds r4, r0, r1
	b _0811B012
	.align 2, 0
_0811ADC0: .4byte 0x03005AEC
_0811ADC4: .4byte 0x00002BB0
_0811ADC8:
	ldr r0, _0811ADD4
	ldr r0, [r0]
	ldr r2, _0811ADD8
	adds r4, r0, r2
	b _0811B012
	.align 2, 0
_0811ADD4: .4byte 0x03005AEC
_0811ADD8: .4byte 0x00002BBC
_0811ADDC:
	ldr r0, _0811ADE8
	ldr r0, [r0]
	ldr r3, _0811ADEC
	adds r4, r0, r3
	b _0811B012
	.align 2, 0
_0811ADE8: .4byte 0x03005AEC
_0811ADEC: .4byte 0x00002BC8
_0811ADF0:
	ldr r0, _0811ADFC
	ldr r0, [r0]
	ldr r1, _0811AE00
	adds r4, r0, r1
	b _0811B012
	.align 2, 0
_0811ADFC: .4byte 0x03005AEC
_0811AE00: .4byte 0x00002BD4
_0811AE04:
	ldr r2, _0811AE1C
	ldr r0, _0811AE20
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _0811AE24
	adds r0, r0, r3
	ldr r1, [r2]
	adds r4, r1, r0
	b _0811B012
	.align 2, 0
_0811AE1C: .4byte 0x03005AEC
_0811AE20: .4byte 0x02037282
_0811AE24: .4byte 0x00002BE0
_0811AE28:
	ldr r0, _0811AE48
	ldr r0, [r0]
	ldr r2, _0811AE4C
	adds r1, r0, r2
	ldr r3, _0811AE50
	adds r2, r0, r3
	movs r3, #5
_0811AE36:
	ldrh r0, [r2]
	strh r0, [r2, #0xc]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0811AE36
	adds r4, r1, #0
	b _0811B012
	.align 2, 0
_0811AE48: .4byte 0x03005AEC
_0811AE4C: .4byte 0x00002E36
_0811AE50: .4byte 0x00002E2A
_0811AE54:
	ldr r2, _0811AE70
	ldr r0, _0811AE74
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _0811AE78
	adds r4, r0, r1
	ldr r0, _0811AE7C
	ldrb r5, [r0]
	b _0811B012
	.align 2, 0
_0811AE70: .4byte 0x03005AEC
_0811AE74: .4byte 0x02037282
_0811AE78: .4byte 0x000027D0
_0811AE7C: .4byte 0x02037284
_0811AE80:
	ldr r2, _0811AEA4
	ldr r0, _0811AEA8
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _0811AEAC
	adds r0, r0, r3
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r0, _0811AEB0
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1c
	adds r4, r1, r0
	movs r5, #1
	b _0811B012
	.align 2, 0
_0811AEA4: .4byte 0x03005AEC
_0811AEA8: .4byte 0x02037282
_0811AEAC: .4byte 0x000027CC
_0811AEB0: .4byte 0x02037284
_0811AEB4:
	ldr r2, _0811AECC
	ldr r0, _0811AED0
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _0811AED4
	adds r4, r0, r1
	movs r5, #0
	b _0811B012
	.align 2, 0
_0811AECC: .4byte 0x03005AEC
_0811AED0: .4byte 0x02037282
_0811AED4: .4byte 0x000027CE
_0811AED8:
	ldr r4, _0811AEF4
	ldr r1, _0811AEF8
	ldr r0, [r1]
	ldr r2, _0811AEFC
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, [r1]
	ldr r3, _0811AF00
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r4, #2]
	b _0811B012
	.align 2, 0
_0811AEF4: .4byte 0x02021C68
_0811AEF8: .4byte 0x03005AEC
_0811AEFC: .4byte 0x00002E6C
_0811AF00: .4byte 0x00002E6E
_0811AF04:
	ldr r0, _0811AF18
	ldr r0, [r0]
	ldr r1, _0811AF1C
	adds r4, r0, r1
	ldr r2, _0811AF20
	adds r0, r2, #0
	strh r0, [r4]
	movs r5, #1
	b _0811B012
	.align 2, 0
_0811AF18: .4byte 0x03005AEC
_0811AF1C: .4byte 0x00002BAA
_0811AF20: .4byte 0x0000FFFF
_0811AF24:
	ldr r2, _0811AF48
	ldr r0, _0811AF4C
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _0811AF50
	adds r0, r0, r3
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r0, _0811AF54
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, #4
	adds r4, r1, r0
	movs r5, #0
	b _0811B012
	.align 2, 0
_0811AF48: .4byte 0x03005AEC
_0811AF4C: .4byte 0x02037282
_0811AF50: .4byte 0x000027CC
_0811AF54: .4byte 0x02037284
_0811AF58:
	ldr r2, _0811AF70
	ldr r0, _0811AF74
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r1, _0811AF78
	adds r4, r0, r1
	movs r5, #1
	b _0811B012
	.align 2, 0
_0811AF70: .4byte 0x03005AEC
_0811AF74: .4byte 0x02037282
_0811AF78: .4byte 0x000027E4
_0811AF7C:
	ldr r4, _0811AF88
	adds r0, r4, #0
	movs r1, #2
	bl InitializeEasyChatWordArray
	b _0811B012
	.align 2, 0
_0811AF88: .4byte 0x02021C68
_0811AF8C:
	ldr r2, _0811AFB0
	ldr r0, _0811AFB4
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _0811AFB8
	adds r0, r0, r3
	ldr r1, [r2]
	adds r1, r1, r0
	adds r4, r1, #0
	adds r4, #0x14
	ldr r2, _0811AFBC
	adds r0, r2, #0
	strh r0, [r1, #0x14]
	movs r5, #2
	b _0811B012
	.align 2, 0
_0811AFB0: .4byte 0x03005AEC
_0811AFB4: .4byte 0x02037282
_0811AFB8: .4byte 0x000027CC
_0811AFBC: .4byte 0x0000FFFF
_0811AFC0:
	ldr r0, _0811AFCC
	ldr r0, [r0]
	ldr r3, _0811AFD0
	adds r4, r0, r3
	b _0811B012
	.align 2, 0
_0811AFCC: .4byte 0x03005AEC
_0811AFD0: .4byte 0x00003B6E
_0811AFD4:
	ldr r0, _0811AFE0
	ldr r0, [r0]
	ldr r1, _0811AFE4
	adds r4, r0, r1
	b _0811B012
	.align 2, 0
_0811AFE0: .4byte 0x03005AEC
_0811AFE4: .4byte 0x00003B5A
_0811AFE8:
	ldr r0, _0811AFF4
	ldr r0, [r0]
	ldr r2, _0811AFF8
	adds r4, r0, r2
	b _0811B012
	.align 2, 0
_0811AFF4: .4byte 0x03005AEC
_0811AFF8: .4byte 0x00003B6C
_0811AFFC:
	ldr r0, _0811B008
	ldr r0, [r0]
	movs r3, #0x82
	lsls r3, r3, #1
	adds r4, r0, r3
	b _0811B012
	.align 2, 0
_0811B008: .4byte 0x03005AF0
_0811B00C:
	bl sub_0801AB30
	adds r4, r0, #0
_0811B012:
	bl CleanupOverworldWindowsAndTilemaps
	ldr r0, _0811B02C
	ldrb r0, [r0]
	ldr r2, _0811B030
	adds r1, r4, #0
	adds r3, r5, #0
	bl DoEasyChatScreen
_0811B024:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B02C: .4byte 0x02037280
_0811B030: .4byte 0x08085B19
	thumb_func_end ShowEasyChatScreen

	thumb_func_start sub_0811B034
sub_0811B034: @ 0x0811B034
	push {lr}
	bl UpdatePaletteFade
	ldr r0, _0811B050
	movs r1, #0x87
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0811B054
	cmp r0, #1
	beq _0811B05E
	b _0811B090
	.align 2, 0
_0811B050: .4byte 0x03002360
_0811B054:
	movs r0, #1
	movs r1, #0
	bl FadeScreen
	b _0811B090
_0811B05E:
	ldr r0, _0811B080
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0811B09E
	ldr r0, _0811B084
	ldr r0, [r0]
	ldr r1, _0811B088
	adds r0, r0, r1
	ldr r1, _0811B08C
	strh r1, [r0, #0x16]
	bl CleanupOverworldWindowsAndTilemaps
	bl DoQuizQuestionEasyChatScreen
	b _0811B09E
	.align 2, 0
_0811B080: .4byte 0x02037C74
_0811B084: .4byte 0x03005AEC
_0811B088: .4byte 0x00003B58
_0811B08C: .4byte 0x0000FFFF
_0811B090:
	ldr r1, _0811B0A4
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0811B09E:
	pop {r0}
	bx r0
	.align 2, 0
_0811B0A4: .4byte 0x03002360
	thumb_func_end sub_0811B034

	thumb_func_start sub_0811B0A8
sub_0811B0A8: @ 0x0811B0A8
	push {lr}
	ldr r0, _0811B0B4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0811B0B4: .4byte 0x0811B035
	thumb_func_end sub_0811B0A8

	thumb_func_start sub_0811B0B8
sub_0811B0B8: @ 0x0811B0B8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	ldr r1, _0811B0D8
_0811B0C2:
	ldrh r3, [r1]
	cmp r2, r3
	beq _0811B0D4
	adds r1, #8
	adds r0, #1
	cmp r0, #3
	bls _0811B0C2
	movs r0, #1
	rsbs r0, r0, #0
_0811B0D4:
	pop {r1}
	bx r1
	.align 2, 0
_0811B0D8: .4byte 0x08573114
	thumb_func_end sub_0811B0B8

	thumb_func_start sub_0811B0DC
sub_0811B0DC: @ 0x0811B0DC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0811B0B8
	adds r1, r0, #0
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	thumb_func_end sub_0811B0DC

	thumb_func_start sub_0811B0F4
sub_0811B0F4: @ 0x0811B0F4
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0811B0B8
	adds r4, r0, #0
	bl ResetTasks
	ldr r0, _0811B118
	lsls r4, r4, #3
	adds r0, #4
	adds r4, r4, r0
	ldr r0, [r4]
	bl sub_0811AD20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811B118: .4byte 0x08573114
	thumb_func_end sub_0811B0F4

	thumb_func_start DoQuizAnswerEasyChatScreen
DoQuizAnswerEasyChatScreen: @ 0x0811B11C
	push {lr}
	ldr r0, _0811B134
	ldr r1, [r0]
	ldr r0, _0811B138
	adds r1, r1, r0
	ldr r2, _0811B13C
	movs r0, #0xf
	movs r3, #3
	bl DoEasyChatScreen
	pop {r0}
	bx r0
	.align 2, 0
_0811B134: .4byte 0x03005AEC
_0811B138: .4byte 0x00003B6E
_0811B13C: .4byte 0x08085B19
	thumb_func_end DoQuizAnswerEasyChatScreen

	thumb_func_start DoQuizQuestionEasyChatScreen
DoQuizQuestionEasyChatScreen: @ 0x0811B140
	push {lr}
	ldr r0, _0811B158
	ldr r1, [r0]
	ldr r0, _0811B15C
	adds r1, r1, r0
	ldr r2, _0811B160
	movs r0, #0x10
	movs r3, #3
	bl DoEasyChatScreen
	pop {r0}
	bx r0
	.align 2, 0
_0811B158: .4byte 0x03005AEC
_0811B15C: .4byte 0x00003B5A
_0811B160: .4byte 0x08085B19
	thumb_func_end DoQuizQuestionEasyChatScreen

	thumb_func_start DoQuizSetAnswerEasyChatScreen
DoQuizSetAnswerEasyChatScreen: @ 0x0811B164
	push {lr}
	ldr r0, _0811B17C
	ldr r1, [r0]
	ldr r0, _0811B180
	adds r1, r1, r0
	ldr r2, _0811B184
	movs r0, #0x12
	movs r3, #3
	bl DoEasyChatScreen
	pop {r0}
	bx r0
	.align 2, 0
_0811B17C: .4byte 0x03005AEC
_0811B180: .4byte 0x00003B6C
_0811B184: .4byte 0x08085B19
	thumb_func_end DoQuizSetAnswerEasyChatScreen

	thumb_func_start DoQuizSetQuestionEasyChatScreen
DoQuizSetQuestionEasyChatScreen: @ 0x0811B188
	push {lr}
	ldr r0, _0811B1A0
	ldr r1, [r0]
	ldr r0, _0811B1A4
	adds r1, r1, r0
	ldr r2, _0811B1A8
	movs r0, #0x11
	movs r3, #3
	bl DoEasyChatScreen
	pop {r0}
	bx r0
	.align 2, 0
_0811B1A0: .4byte 0x03005AEC
_0811B1A4: .4byte 0x00003B5A
_0811B1A8: .4byte 0x08085B19
	thumb_func_end DoQuizSetQuestionEasyChatScreen

	thumb_func_start EasyChat_AllocateResources
EasyChat_AllocateResources: @ 0x0811B1AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r4, _0811B1D0
	movs r0, #0x50
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	bne _0811B1D4
	movs r0, #0
	b _0811B2BE
	.align 2, 0
_0811B1D0: .4byte 0x02039DE4
_0811B1D4:
	movs r7, #0
	strb r5, [r0]
	ldr r0, [r4]
	mov r1, r8
	str r1, [r0, #0x38]
	strb r7, [r0, #5]
	ldr r0, [r4]
	strb r7, [r0, #6]
	ldr r0, [r4]
	strb r7, [r0, #9]
	ldr r0, [r4]
	strb r6, [r0, #0x12]
	ldr r0, [r4]
	strb r7, [r0, #0x13]
	adds r0, r5, #0
	bl GetEachChatScreenTemplateId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r5, #0x10
	bne _0811B216
	ldr r0, [r4]
	adds r0, #0x14
	bl sub_0811C5F4
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x14
	str r1, [r0, #0x34]
	movs r1, #7
	strb r1, [r0, #4]
	lsls r0, r6, #1
	b _0811B22E
_0811B216:
	ldr r0, [r4]
	strb r7, [r0, #4]
	ldr r3, [r4]
	ldr r1, _0811B26C
	lsls r2, r6, #1
	adds r0, r2, r6
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x34]
	adds r0, r2, #0
_0811B22E:
	ldr r3, _0811B270
	ldr r2, [r3]
	ldr r1, _0811B26C
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	strb r1, [r2, #2]
	ldr r1, [r3]
	ldrb r0, [r0, #2]
	strb r0, [r1, #3]
	ldr r0, [r3]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	adds r4, r2, #0
	muls r4, r1, r4
	adds r1, r4, #0
	strb r1, [r0, #7]
	ldr r0, [r3]
	strb r6, [r0, #1]
	mov r0, r8
	cmp r0, #0
	beq _0811B274
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x3c
	ldrb r2, [r0, #7]
	mov r0, r8
	bl CpuSet
	b _0811B2A4
	.align 2, 0
_0811B26C: .4byte 0x08573134
_0811B270: .4byte 0x02039DE4
_0811B274:
	movs r4, #0
	ldr r0, [r3]
	ldrb r0, [r0, #7]
	cmp r4, r0
	bge _0811B29C
	adds r6, r3, #0
	ldr r1, _0811B2C8
	adds r5, r1, #0
_0811B284:
	ldr r2, [r6]
	lsls r0, r4, #1
	adds r1, r2, #0
	adds r1, #0x3c
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	adds r4, #1
	ldrb r2, [r2, #7]
	cmp r4, r2
	blt _0811B284
_0811B29C:
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0x3c
	str r0, [r1, #0x38]
_0811B2A4:
	bl sub_0811F908
	ldr r1, _0811B2CC
	ldr r4, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r0, #1
	strb r0, [r4, #0xd]
	movs r0, #1
_0811B2BE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B2C8: .4byte 0x0000FFFF
_0811B2CC: .4byte 0x02039DE4
	thumb_func_end EasyChat_AllocateResources

	thumb_func_start EasyChat_FreeResources
EasyChat_FreeResources: @ 0x0811B2D0
	push {r4, lr}
	ldr r4, _0811B2E8
	ldr r0, [r4]
	cmp r0, #0
	beq _0811B2E2
	bl Free
	movs r0, #0
	str r0, [r4]
_0811B2E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811B2E8: .4byte 0x02039DE4
	thumb_func_end EasyChat_FreeResources

	thumb_func_start sub_0811B2EC
sub_0811B2EC: @ 0x0811B2EC
	push {lr}
	ldr r0, _0811B304
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0xa
	bhi _0811B37E
	lsls r0, r0, #2
	ldr r1, _0811B308
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811B304: .4byte 0x02039DE4
_0811B308: .4byte 0x0811B30C
_0811B30C: @ jump table
	.4byte _0811B338 @ case 0
	.4byte _0811B33E @ case 1
	.4byte _0811B344 @ case 2
	.4byte _0811B34A @ case 3
	.4byte _0811B350 @ case 4
	.4byte _0811B356 @ case 5
	.4byte _0811B35C @ case 6
	.4byte _0811B362 @ case 7
	.4byte _0811B368 @ case 8
	.4byte _0811B36E @ case 9
	.4byte _0811B374 @ case 10
_0811B338:
	bl sub_0811B384
	b _0811B378
_0811B33E:
	bl sub_0811B4D4
	b _0811B378
_0811B344:
	bl sub_0811B614
	b _0811B378
_0811B34A:
	bl sub_0811B6D0
	b _0811B378
_0811B350:
	bl sub_0811B75C
	b _0811B378
_0811B356:
	bl sub_0811B810
	b _0811B378
_0811B35C:
	bl sub_0811B7BC
	b _0811B378
_0811B362:
	bl sub_0811B85C
	b _0811B378
_0811B368:
	bl sub_0811B88C
	b _0811B378
_0811B36E:
	bl sub_0811B8B8
	b _0811B378
_0811B374:
	bl sub_0811B8C8
_0811B378:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0811B380
_0811B37E:
	movs r0, #0
_0811B380:
	pop {r1}
	bx r1
	thumb_func_end sub_0811B2EC

	thumb_func_start sub_0811B384
sub_0811B384: @ 0x0811B384
	push {r4, r5, r6, r7, lr}
	ldr r0, _0811B3B0
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0811B3D4
	bl sub_0811C79C
	ldr r1, _0811B3B4
	ldr r3, [r1]
	movs r2, #0
	movs r0, #2
	strb r0, [r3, #4]
	ldr r0, [r1]
	strb r2, [r0, #0xa]
	ldr r0, [r1]
	strb r2, [r0, #0xb]
	ldr r0, [r1]
	strb r2, [r0, #0xc]
	movs r0, #9
	b _0811B4CE
	.align 2, 0
_0811B3B0: .4byte 0x03002360
_0811B3B4: .4byte 0x02039DE4
_0811B3B8:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0811B484
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0811B474
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0811B464
	movs r0, #0
	b _0811B4CE
_0811B3D4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0811B494
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0811B49A
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0811B3B8
	ldr r2, _0811B45C
	ldr r1, [r2]
	ldrb r0, [r1, #6]
	subs r0, #1
_0811B3F4:
	strb r0, [r1, #6]
_0811B3F6:
	adds r7, r2, #0
	adds r4, r7, #0
	ldr r2, [r4]
	movs r0, #6
	ldrsb r0, [r2, r0]
	ldr r6, _0811B460
	cmp r0, #0
	bge _0811B414
	ldrb r0, [r2, #1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r6
	ldrb r0, [r1, #2]
	strb r0, [r2, #6]
_0811B414:
	ldr r3, [r4]
	movs r2, #6
	ldrsb r2, [r3, r2]
	adds r5, r6, #0
	ldrb r1, [r3, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #2]
	cmp r2, r0
	ble _0811B430
	movs r0, #0
	strb r0, [r3, #6]
_0811B430:
	ldr r3, [r4]
	movs r2, #6
	ldrsb r2, [r3, r2]
	ldrb r1, [r3, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r5
	ldrb r0, [r1, #2]
	cmp r2, r0
	bne _0811B4A4
	movs r0, #5
	ldrsb r0, [r3, r0]
	cmp r0, #2
	ble _0811B452
	movs r0, #2
	strb r0, [r3, #5]
_0811B452:
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #4]
	movs r0, #3
	b _0811B4CE
	.align 2, 0
_0811B45C: .4byte 0x02039DE4
_0811B460: .4byte 0x08573134
_0811B464:
	ldr r2, _0811B470
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	adds r0, #1
	strb r0, [r1, #5]
	b _0811B3F6
	.align 2, 0
_0811B470: .4byte 0x02039DE4
_0811B474:
	ldr r2, _0811B480
	ldr r1, [r2]
	ldrb r0, [r1, #6]
	adds r0, #1
	b _0811B3F4
	.align 2, 0
_0811B480: .4byte 0x02039DE4
_0811B484:
	ldr r2, _0811B490
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	b _0811B3F6
	.align 2, 0
_0811B490: .4byte 0x02039DE4
_0811B494:
	bl sub_0811B920
	b _0811B49E
_0811B49A:
	bl sub_0811B984
_0811B49E:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0811B4CE
_0811B4A4:
	movs r0, #5
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bge _0811B4B2
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r3, #5]
_0811B4B2:
	ldr r3, [r7]
	movs r2, #5
	ldrsb r2, [r3, r2]
	ldrb r1, [r3, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrb r0, [r0, #1]
	cmp r2, r0
	blt _0811B4CC
	movs r0, #0
	strb r0, [r3, #5]
_0811B4CC:
	movs r0, #2
_0811B4CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0811B384

	thumb_func_start sub_0811B4D4
sub_0811B4D4: @ 0x0811B4D4
	push {r4, r5, r6, lr}
	ldr r2, _0811B4F4
	ldrh r1, [r2, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0811B542
	ldr r0, _0811B4F8
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0811B536
	b _0811B51C
	.align 2, 0
_0811B4F4: .4byte 0x03002360
_0811B4F8: .4byte 0x02039DE4
_0811B4FC:
	movs r0, #0x20
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0811B5D8
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0811B5C8
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0811B5B8
	movs r0, #0
	b _0811B60E
_0811B51C:
	cmp r0, #1
	bgt _0811B526
	cmp r0, #0
	beq _0811B530
	b _0811B542
_0811B526:
	cmp r0, #2
	beq _0811B5EE
	cmp r0, #3
	beq _0811B53C
	b _0811B542
_0811B530:
	bl sub_0811B954
	b _0811B5F2
_0811B536:
	bl sub_0811B920
	b _0811B5F2
_0811B53C:
	bl sub_0811BA34
	b _0811B5F2
_0811B542:
	ldrh r2, [r2, #0x2e]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0811B5E8
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0811B5EE
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0811B4FC
	ldr r2, _0811B5B0
	ldr r1, [r2]
	ldrb r0, [r1, #6]
	subs r0, #1
	strb r0, [r1, #6]
_0811B566:
	adds r6, r2, #0
_0811B568:
	adds r5, r6, #0
	ldr r4, [r5]
	movs r3, #6
	ldrsb r3, [r4, r3]
	ldr r2, _0811B5B4
	ldrb r1, [r4, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrb r0, [r1, #2]
	cmp r3, r0
	bne _0811B5F8
	bl FooterHasFourOptions
	movs r2, #3
	cmp r0, #0
	beq _0811B58E
	movs r2, #4
_0811B58E:
	ldr r1, [r5]
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0811B59C
	subs r0, r2, #1
	strb r0, [r1, #5]
_0811B59C:
	ldr r1, [r5]
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, r2
	blt _0811B5AA
	movs r0, #0
	strb r0, [r1, #5]
_0811B5AA:
	movs r0, #3
	b _0811B60E
	.align 2, 0
_0811B5B0: .4byte 0x02039DE4
_0811B5B4: .4byte 0x08573134
_0811B5B8:
	ldr r2, _0811B5C4
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	adds r0, #1
	strb r0, [r1, #5]
	b _0811B566
	.align 2, 0
_0811B5C4: .4byte 0x02039DE4
_0811B5C8:
	ldr r1, _0811B5D4
	ldr r0, [r1]
	strb r3, [r0, #6]
	adds r6, r1, #0
	b _0811B568
	.align 2, 0
_0811B5D4: .4byte 0x02039DE4
_0811B5D8:
	ldr r2, _0811B5E4
	ldr r1, [r2]
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	b _0811B566
	.align 2, 0
_0811B5E4: .4byte 0x02039DE4
_0811B5E8:
	bl sub_0811B920
	b _0811B5F2
_0811B5EE:
	bl sub_0811B984
_0811B5F2:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0811B60E
_0811B5F8:
	movs r0, #5
	ldrsb r0, [r4, r0]
	ldrb r1, [r1, #1]
	cmp r0, r1
	blt _0811B606
	subs r0, r1, #1
	strb r0, [r4, #5]
_0811B606:
	ldr r1, [r6]
	movs r0, #0
	strb r0, [r1, #4]
	movs r0, #2
_0811B60E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0811B4D4

	thumb_func_start sub_0811B614
sub_0811B614: @ 0x0811B614
	push {lr}
	ldr r1, _0811B62C
	ldrh r2, [r1, #0x2e]
	movs r0, #2
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _0811B630
	bl sub_0811BAFC
	b _0811B6C6
	.align 2, 0
_0811B62C: .4byte 0x03002360
_0811B630:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0811B67E
	ldr r0, _0811B650
	ldr r2, [r0]
	movs r1, #0xa
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0811B654
	bl sub_0811BA80
	b _0811B6C6
	.align 2, 0
_0811B650: .4byte 0x02039DE4
_0811B654:
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _0811B672
	cmp r0, #1
	bgt _0811B666
	cmp r0, #0
	beq _0811B66C
	b _0811B67E
_0811B666:
	cmp r0, #2
	beq _0811B678
	b _0811B67E
_0811B66C:
	bl sub_0811BB0C
	b _0811B6C6
_0811B672:
	bl sub_0811BB38
	b _0811B6C6
_0811B678:
	bl sub_0811BAFC
	b _0811B6C6
_0811B67E:
	ldrh r1, [r3, #0x2e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0811B68E
	bl sub_0811BB0C
	b _0811B6C6
_0811B68E:
	ldrh r1, [r3, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0811B69C
	movs r0, #2
	b _0811B6C2
_0811B69C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0811B6A8
	movs r0, #3
	b _0811B6C2
_0811B6A8:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0811B6B4
	movs r0, #1
	b _0811B6C2
_0811B6B4:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0811B6C0
	movs r0, #0
	b _0811B6CA
_0811B6C0:
	movs r0, #0
_0811B6C2:
	bl sub_0811BCF8
_0811B6C6:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0811B6CA:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811B614

	thumb_func_start sub_0811B6D0
sub_0811B6D0: @ 0x0811B6D0
	push {lr}
	ldr r2, _0811B6EC
	ldrh r1, [r2, #0x2e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0811B6F4
	ldr r0, _0811B6F0
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1, #4]
	movs r0, #0xe
	b _0811B756
	.align 2, 0
_0811B6EC: .4byte 0x03002360
_0811B6F0: .4byte 0x02039DE4
_0811B6F4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0811B702
	bl sub_0811BB64
	b _0811B752
_0811B702:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0811B70E
	movs r0, #4
	b _0811B74E
_0811B70E:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0811B71A
	movs r0, #5
	b _0811B74E
_0811B71A:
	ldrh r1, [r2, #0x30]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0811B728
	movs r0, #2
	b _0811B74E
_0811B728:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0811B734
	movs r0, #3
	b _0811B74E
_0811B734:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0811B740
	movs r0, #1
	b _0811B74E
_0811B740:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0811B74C
	movs r0, #0
	b _0811B756
_0811B74C:
	movs r0, #0
_0811B74E:
	bl sub_0811BF64
_0811B752:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0811B756:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811B6D0

	thumb_func_start sub_0811B75C
sub_0811B75C: @ 0x0811B75C
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0811B790
	cmp r1, #0
	bgt _0811B778
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0811B77C
	b _0811B7B4
_0811B778:
	cmp r1, #1
	bne _0811B7B4
_0811B77C:
	bl sub_0811BA74
	ldr r1, _0811B78C
	ldr r1, [r1]
	strb r0, [r1, #4]
	movs r0, #7
	b _0811B7B6
	.align 2, 0
_0811B78C: .4byte 0x02039DE4
_0811B790:
	ldr r0, _0811B7AC
	strh r1, [r0]
	ldr r0, _0811B7B0
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0x11
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0811B7A8
	bl sub_0811BBB4
_0811B7A8:
	movs r0, #0x18
	b _0811B7B6
	.align 2, 0
_0811B7AC: .4byte 0x02037290
_0811B7B0: .4byte 0x02039DE4
_0811B7B4:
	movs r0, #0
_0811B7B6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811B75C

	thumb_func_start sub_0811B7BC
sub_0811B7BC: @ 0x0811B7BC
	push {r4, lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0811B7F0
	cmp r1, #0
	bgt _0811B7D8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0811B7DC
	b _0811B808
_0811B7D8:
	cmp r1, #1
	bne _0811B808
_0811B7DC:
	bl sub_0811BA74
	ldr r1, _0811B7EC
	ldr r1, [r1]
	strb r0, [r1, #4]
	movs r0, #7
	b _0811B80A
	.align 2, 0
_0811B7EC: .4byte 0x02039DE4
_0811B7F0:
	bl sub_0811C68C
	ldr r4, _0811B804
	bl sub_0811BCBC
	strh r0, [r4]
	bl sub_0811BBB4
	movs r0, #0x18
	b _0811B80A
	.align 2, 0
_0811B804: .4byte 0x02037290
_0811B808:
	movs r0, #0
_0811B80A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811B7BC

	thumb_func_start sub_0811B810
sub_0811B810: @ 0x0811B810
	push {lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0811B840
	cmp r1, #0
	bgt _0811B82C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0811B830
	b _0811B854
_0811B82C:
	cmp r1, #1
	bne _0811B854
_0811B830:
	ldr r0, _0811B83C
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #4]
	movs r0, #7
	b _0811B856
	.align 2, 0
_0811B83C: .4byte 0x02039DE4
_0811B840:
	bl sub_0811BBE8
	ldr r0, _0811B850
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #4]
	movs r0, #8
	b _0811B856
	.align 2, 0
_0811B850: .4byte 0x02039DE4
_0811B854:
	movs r0, #0
_0811B856:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811B810

	thumb_func_start sub_0811B85C
sub_0811B85C: @ 0x0811B85C
	push {lr}
	ldr r0, _0811B870
	ldrh r1, [r0, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0811B874
	movs r0, #0x1a
	b _0811B888
	.align 2, 0
_0811B870: .4byte 0x03002360
_0811B874:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0811B880
	movs r0, #0
	b _0811B888
_0811B880:
	bl sub_0811B920
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0811B888:
	pop {r1}
	bx r1
	thumb_func_end sub_0811B85C

	thumb_func_start sub_0811B88C
sub_0811B88C: @ 0x0811B88C
	push {lr}
	ldr r0, _0811B8A0
	ldrh r1, [r0, #0x2e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0811B8A4
	movs r0, #0
	b _0811B8B0
	.align 2, 0
_0811B8A0: .4byte 0x03002360
_0811B8A4:
	bl sub_0811BA74
	ldr r1, _0811B8B4
	ldr r1, [r1]
	strb r0, [r1, #4]
	movs r0, #7
_0811B8B0:
	pop {r1}
	bx r1
	.align 2, 0
_0811B8B4: .4byte 0x02039DE4
	thumb_func_end sub_0811B88C

	thumb_func_start sub_0811B8B8
sub_0811B8B8: @ 0x0811B8B8
	ldr r0, _0811B8C4
	ldr r1, [r0]
	movs r0, #0xa
	strb r0, [r1, #4]
	movs r0, #6
	bx lr
	.align 2, 0
_0811B8C4: .4byte 0x02039DE4
	thumb_func_end sub_0811B8B8

	thumb_func_start sub_0811B8C8
sub_0811B8C8: @ 0x0811B8C8
	push {r4, lr}
	bl Menu_ProcessInputNoWrapClearOnChoose
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0811B904
	cmp r1, #0
	bgt _0811B8E4
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0811B8E8
	b _0811B918
_0811B8E4:
	cmp r1, #1
	bne _0811B918
_0811B8E8:
	bl sub_0811BC24
	ldr r2, _0811B900
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #8]
	ldr r1, [r2]
	movs r0, #8
	strb r0, [r1, #4]
	movs r0, #0x1f
	b _0811B91A
	.align 2, 0
_0811B900: .4byte 0x02039DE4
_0811B904:
	ldr r4, _0811B914
	bl sub_0811BCBC
	strh r0, [r4]
	bl sub_0811BBB4
	movs r0, #0x18
	b _0811B91A
	.align 2, 0
_0811B914: .4byte 0x02037290
_0811B918:
	movs r0, #0
_0811B91A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811B8C8

	thumb_func_start sub_0811B920
sub_0811B920: @ 0x0811B920
	push {lr}
	ldr r1, _0811B940
	ldr r2, [r1]
	ldrb r0, [r2]
	cmp r0, #0x13
	beq _0811B930
	cmp r0, #0xb
	bne _0811B944
_0811B930:
	ldrb r0, [r2, #4]
	strb r0, [r2, #8]
	ldr r1, [r1]
	movs r0, #8
	strb r0, [r1, #4]
	movs r0, #0x22
	b _0811B950
	.align 2, 0
_0811B940: .4byte 0x02039DE4
_0811B944:
	ldrb r0, [r2, #4]
	strb r0, [r2, #8]
	ldr r1, [r1]
	movs r0, #4
	strb r0, [r1, #4]
	movs r0, #5
_0811B950:
	pop {r1}
	bx r1
	thumb_func_end sub_0811B920

	thumb_func_start sub_0811B954
sub_0811B954: @ 0x0811B954
	push {lr}
	ldr r2, _0811B974
	ldr r0, [r2]
	ldrb r1, [r0, #4]
	strb r1, [r0, #8]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #6
	bne _0811B978
	ldrb r0, [r1, #4]
	strb r0, [r1, #8]
	ldr r1, [r2]
	movs r0, #8
	strb r0, [r1, #4]
	movs r0, #0x20
	b _0811B97E
	.align 2, 0
_0811B974: .4byte 0x02039DE4
_0811B978:
	movs r0, #5
	strb r0, [r1, #4]
	movs r0, #4
_0811B97E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811B954

	thumb_func_start sub_0811B984
sub_0811B984: @ 0x0811B984
	push {r4, lr}
	ldr r4, _0811B9A8
	ldr r1, [r4]
	ldrb r0, [r1, #4]
	strb r0, [r1, #8]
	ldr r1, [r4]
	ldrb r0, [r1]
	cmp r0, #0x11
	bne _0811B9AC
	bl sub_0811C568
	cmp r0, #0
	bne _0811B9CA
	bl sub_0811C5B4
	cmp r0, #0
	bne _0811B9B8
	b _0811BA26
	.align 2, 0
_0811B9A8: .4byte 0x02039DE4
_0811B9AC:
	cmp r0, #0x12
	bne _0811B9D4
	bl sub_0811C5B4
	cmp r0, #0
	beq _0811B9C2
_0811B9B8:
	ldr r1, [r4]
	movs r0, #8
	strb r0, [r1, #4]
	movs r0, #0x1e
	b _0811BA2C
_0811B9C2:
	bl sub_0811C568
	cmp r0, #0
	beq _0811BA26
_0811B9CA:
	ldr r1, [r4]
	movs r0, #8
	strb r0, [r1, #4]
	movs r0, #0x1d
	b _0811BA2C
_0811B9D4:
	cmp r0, #9
	beq _0811B9DC
	cmp r0, #0xd
	bne _0811B9EE
_0811B9DC:
	bl sub_0811C530
	cmp r0, #0
	bne _0811BA26
	ldr r1, [r4]
	movs r0, #8
	strb r0, [r1, #4]
	movs r0, #0x21
	b _0811BA2C
_0811B9EE:
	cmp r0, #0x13
	beq _0811B9F6
	cmp r0, #0xb
	bne _0811BA08
_0811B9F6:
	bl sub_0811C4F8
	cmp r0, #0
	beq _0811BA26
	ldr r1, [r4]
	movs r0, #8
	strb r0, [r1, #4]
	movs r0, #0x22
	b _0811BA2C
_0811BA08:
	cmp r0, #0x14
	beq _0811BA28
	bl sub_0811C4F8
	cmp r0, #1
	beq _0811BA1C
	bl sub_0811BCBC
	cmp r0, #0
	bne _0811BA26
_0811BA1C:
	ldr r1, [r4]
	movs r0, #4
	strb r0, [r1, #4]
	movs r0, #5
	b _0811BA2C
_0811BA26:
	ldr r1, [r4]
_0811BA28:
	movs r0, #6
	strb r0, [r1, #4]
_0811BA2C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811B984

	thumb_func_start sub_0811BA34
sub_0811BA34: @ 0x0811BA34
	push {lr}
	ldr r2, _0811BA50
	ldr r1, [r2]
	ldrb r0, [r1, #4]
	strb r0, [r1, #8]
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0811BA5E
	cmp r0, #0x11
	bgt _0811BA54
	cmp r0, #0xf
	beq _0811BA5A
	b _0811BA6E
	.align 2, 0
_0811BA50: .4byte 0x02039DE4
_0811BA54:
	cmp r0, #0x12
	beq _0811BA66
	b _0811BA6E
_0811BA5A:
	movs r0, #0x19
	b _0811BA70
_0811BA5E:
	bl sub_0811BBB4
	movs r0, #0x1c
	b _0811BA70
_0811BA66:
	bl sub_0811BBB4
	movs r0, #0x1b
	b _0811BA70
_0811BA6E:
	movs r0, #0
_0811BA70:
	pop {r1}
	bx r1
	thumb_func_end sub_0811BA34

	thumb_func_start sub_0811BA74
sub_0811BA74: @ 0x0811BA74
	ldr r0, _0811BA7C
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_0811BA7C: .4byte 0x02039DE4
	thumb_func_end sub_0811BA74

	thumb_func_start sub_0811BA80
sub_0811BA80: @ 0x0811BA80
	push {r4, r5, r6, lr}
	ldr r0, _0811BAA8
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _0811BAAC
	bl sub_0811C0B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0811F914
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_0811FAA0
	b _0811BABC
	.align 2, 0
_0811BAA8: .4byte 0x02039DE4
_0811BAAC:
	bl GetFooterIndex
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	bl sub_0811FAA0
_0811BABC:
	bl sub_0811FB08
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0811BAF4
	ldr r4, _0811BAF0
	ldr r5, [r4]
	subs r0, #1
	movs r6, #3
	movs r1, #3
	bl __divsi3
	movs r1, #0
	strb r0, [r5, #0xf]
	ldr r0, [r4]
	strb r1, [r0, #0xe]
	ldr r0, [r4]
	strb r1, [r0, #0x10]
	ldr r0, [r4]
	strb r1, [r0, #0x11]
	ldr r0, [r4]
	strb r6, [r0, #4]
	movs r0, #0xb
	b _0811BAF6
	.align 2, 0
_0811BAF0: .4byte 0x02039DE4
_0811BAF4:
	movs r0, #0
_0811BAF6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0811BA80

	thumb_func_start sub_0811BAFC
sub_0811BAFC: @ 0x0811BAFC
	ldr r0, _0811BB08
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #4]
	movs r0, #0xa
	bx lr
	.align 2, 0
_0811BB08: .4byte 0x02039DE4
	thumb_func_end sub_0811BAFC

	thumb_func_start sub_0811BB0C
sub_0811BB0C: @ 0x0811BB0C
	push {lr}
	ldr r1, _0811BB2C
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #0xa]
	ldr r0, [r1]
	strb r2, [r0, #0xb]
	ldr r0, [r1]
	strb r2, [r0, #0xc]
	ldr r1, [r1]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _0811BB30
	movs r0, #1
	strb r0, [r1, #9]
	b _0811BB32
	.align 2, 0
_0811BB2C: .4byte 0x02039DE4
_0811BB30:
	strb r2, [r1, #9]
_0811BB32:
	movs r0, #0x17
	pop {r1}
	bx r1
	thumb_func_end sub_0811BB0C

	thumb_func_start sub_0811BB38
sub_0811BB38: @ 0x0811BB38
	push {lr}
	ldr r0, _0811BB50
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #6
	beq _0811BB58
	ldr r0, _0811BB54
	bl sub_0811BC58
	movs r0, #1
	b _0811BB60
	.align 2, 0
_0811BB50: .4byte 0x02039DE4
_0811BB54: .4byte 0x0000FFFF
_0811BB58:
	movs r0, #0x20
	bl PlaySE
	movs r0, #0
_0811BB60:
	pop {r1}
	bx r1
	thumb_func_end sub_0811BB38

	thumb_func_start sub_0811BB64
sub_0811BB64: @ 0x0811BB64
	push {r4, r5, lr}
	bl sub_0811C140
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0811FAD0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl sub_0811C820
	adds r5, r0, #0
	cmp r5, #0
	beq _0811BB8C
	movs r0, #0x20
	bl PlaySE
	movs r0, #0
	b _0811BBAC
_0811BB8C:
	adds r0, r4, #0
	bl sub_0811BC58
	ldr r0, _0811BBA4
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #6
	bne _0811BBA8
	movs r0, #9
	strb r0, [r1, #4]
	movs r0, #0xd
	b _0811BBAC
	.align 2, 0
_0811BBA4: .4byte 0x02039DE4
_0811BBA8:
	strb r5, [r1, #4]
	movs r0, #0xc
_0811BBAC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811BB64

	thumb_func_start sub_0811BBB4
sub_0811BBB4: @ 0x0811BBB4
	push {r4, r5, lr}
	movs r4, #0
	ldr r3, _0811BBE4
	ldr r0, [r3]
	ldrb r0, [r0, #7]
	cmp r4, r0
	bge _0811BBDE
	adds r5, r3, #0
_0811BBC4:
	ldr r3, [r5]
	ldr r1, [r3, #0x38]
	lsls r2, r4, #1
	adds r1, r2, r1
	adds r0, r3, #0
	adds r0, #0x3c
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldrb r3, [r3, #7]
	cmp r4, r3
	blt _0811BBC4
_0811BBDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BBE4: .4byte 0x02039DE4
	thumb_func_end sub_0811BBB4

	thumb_func_start sub_0811BBE8
sub_0811BBE8: @ 0x0811BBE8
	push {r4, r5, lr}
	movs r3, #0
	ldr r2, _0811BC1C
	ldr r0, [r2]
	ldrb r0, [r0, #7]
	cmp r3, r0
	bge _0811BC14
	adds r5, r2, #0
	ldr r0, _0811BC20
	adds r4, r0, #0
_0811BBFC:
	ldr r2, [r5]
	lsls r0, r3, #1
	adds r1, r2, #0
	adds r1, #0x3c
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r3, #1
	ldrb r2, [r2, #7]
	cmp r3, r2
	blt _0811BBFC
_0811BC14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BC1C: .4byte 0x02039DE4
_0811BC20: .4byte 0x0000FFFF
	thumb_func_end sub_0811BBE8

	thumb_func_start sub_0811BC24
sub_0811BC24: @ 0x0811BC24
	push {r4, r5, lr}
	movs r4, #0
	ldr r3, _0811BC54
	ldr r0, [r3]
	ldrb r0, [r0, #7]
	cmp r4, r0
	bge _0811BC4E
	adds r5, r3, #0
_0811BC34:
	ldr r3, [r5]
	lsls r1, r4, #1
	adds r2, r3, #0
	adds r2, #0x3c
	adds r2, r2, r1
	ldr r0, [r3, #0x38]
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	adds r4, #1
	ldrb r3, [r3, #7]
	cmp r4, r3
	blt _0811BC34
_0811BC4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BC54: .4byte 0x02039DE4
	thumb_func_end sub_0811BC24

	thumb_func_start sub_0811BC58
sub_0811BC58: @ 0x0811BC58
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_0811C098
	lsls r0, r0, #0x10
	ldr r1, _0811BC78
	ldr r1, [r1]
	lsrs r0, r0, #0xf
	adds r1, #0x3c
	adds r1, r1, r0
	strh r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811BC78: .4byte 0x02039DE4
	thumb_func_end sub_0811BC58

	thumb_func_start sub_0811BC7C
sub_0811BC7C: @ 0x0811BC7C
	push {r4, r5, lr}
	movs r2, #0
	ldr r0, _0811BCA4
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	cmp r2, r1
	bhs _0811BCB2
	adds r5, r1, #0
	adds r4, r0, #0
	adds r4, #0x3c
	ldr r3, [r0, #0x38]
_0811BC92:
	lsls r0, r2, #1
	adds r1, r4, r0
	adds r0, r0, r3
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0811BCA8
	movs r0, #1
	b _0811BCB4
	.align 2, 0
_0811BCA4: .4byte 0x02039DE4
_0811BCA8:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r5
	blo _0811BC92
_0811BCB2:
	movs r0, #0
_0811BCB4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811BC7C

	thumb_func_start sub_0811BCBC
sub_0811BCBC: @ 0x0811BCBC
	push {lr}
	ldr r0, _0811BCE4
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0x11
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0811BCEC
	bl sub_0811C568
	cmp r0, #0
	bne _0811BCDE
	bl sub_0811C5B4
	cmp r0, #0
	beq _0811BCE8
_0811BCDE:
	movs r0, #0
	b _0811BCF4
	.align 2, 0
_0811BCE4: .4byte 0x02039DE4
_0811BCE8:
	movs r0, #1
	b _0811BCF4
_0811BCEC:
	bl sub_0811BC7C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0811BCF4:
	pop {r1}
	bx r1
	thumb_func_end sub_0811BCBC

	thumb_func_start sub_0811BCF8
sub_0811BCF8: @ 0x0811BCF8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0811BD1C
	ldr r3, [r0]
	movs r1, #0xa
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0811BD28
	ldrb r0, [r3, #9]
	cmp r0, #0
	bne _0811BD20
	adds r0, r2, #0
	bl sub_0811BD38
	b _0811BD2E
	.align 2, 0
_0811BD1C: .4byte 0x02039DE4
_0811BD20:
	adds r0, r2, #0
	bl sub_0811BE04
	b _0811BD2E
_0811BD28:
	adds r0, r2, #0
	bl sub_0811BE94
_0811BD2E:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811BCF8

	thumb_func_start sub_0811BD38
sub_0811BD38: @ 0x0811BD38
	push {r4, lr}
	cmp r0, #1
	beq _0811BDAE
	cmp r0, #1
	blo _0811BDCE
	cmp r0, #2
	beq _0811BD4C
	cmp r0, #3
	beq _0811BD74
	b _0811BDFA
_0811BD4C:
	ldr r0, _0811BD68
	ldr r1, [r0]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	ldrb r3, [r1, #0xc]
	cmn r0, r3
	beq _0811BDFA
	ldrb r2, [r1, #0xb]
	cmp r0, #0
	beq _0811BD6C
	subs r0, r2, #1
	strb r0, [r1, #0xb]
_0811BD64:
	movs r0, #0xf
	b _0811BDFC
	.align 2, 0
_0811BD68: .4byte 0x02039DE4
_0811BD6C:
	subs r0, r3, #1
	strb r0, [r1, #0xc]
	movs r0, #0x11
	b _0811BDFC
_0811BD74:
	ldr r0, _0811BD9C
	ldr r2, [r0]
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	ldrb r3, [r2, #0xc]
	adds r1, r1, r3
	ldrb r0, [r2, #0xd]
	subs r0, #1
	cmp r1, r0
	bge _0811BDFA
	ldrb r1, [r2, #0xb]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	cmp r0, #2
	bgt _0811BDA0
	adds r0, r1, #1
	strb r0, [r2, #0xb]
	movs r4, #0xf
	b _0811BDA6
	.align 2, 0
_0811BD9C: .4byte 0x02039DE4
_0811BDA0:
	adds r0, r3, #1
	strb r0, [r2, #0xc]
	movs r4, #0x10
_0811BDA6:
	bl sub_0811C17C
	adds r0, r4, #0
	b _0811BDFC
_0811BDAE:
	ldr r0, _0811BDC4
	ldr r1, [r0]
	ldrb r2, [r1, #0xa]
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0811BDC8
	subs r0, r2, #1
	strb r0, [r1, #0xa]
	b _0811BD64
	.align 2, 0
_0811BDC4: .4byte 0x02039DE4
_0811BDC8:
	bl sub_0811BF14
	b _0811BD64
_0811BDCE:
	ldr r0, _0811BDF0
	ldr r1, [r0]
	ldrb r2, [r1, #0xa]
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0811BDF4
	adds r0, r2, #1
	strb r0, [r1, #0xa]
	bl sub_0811C1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811BD64
	bl sub_0811BF14
	b _0811BD64
	.align 2, 0
_0811BDF0: .4byte 0x02039DE4
_0811BDF4:
	bl sub_0811BF14
	b _0811BD64
_0811BDFA:
	movs r0, #0
_0811BDFC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811BD38

	thumb_func_start sub_0811BE04
sub_0811BE04: @ 0x0811BE04
	push {lr}
	cmp r0, #1
	beq _0811BE70
	cmp r0, #1
	blo _0811BE54
	cmp r0, #2
	beq _0811BE1A
	cmp r0, #3
	beq _0811BE3A
	movs r0, #0
	b _0811BE8C
_0811BE1A:
	ldr r0, _0811BE2C
	ldr r1, [r0]
	ldrb r2, [r1, #0xb]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0811BE30
	subs r0, r2, #1
	b _0811BE32
	.align 2, 0
_0811BE2C: .4byte 0x02039DE4
_0811BE30:
	movs r0, #3
_0811BE32:
	strb r0, [r1, #0xb]
	bl sub_0811C17C
	b _0811BE8A
_0811BE3A:
	ldr r0, _0811BE4C
	ldr r1, [r0]
	ldrb r2, [r1, #0xb]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #2
	bgt _0811BE50
	adds r0, r2, #1
	b _0811BE32
	.align 2, 0
_0811BE4C: .4byte 0x02039DE4
_0811BE50:
	movs r0, #0
	b _0811BE32
_0811BE54:
	ldr r0, _0811BE6C
	ldr r1, [r0]
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	bl sub_0811C1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811BE8A
	b _0811BE86
	.align 2, 0
_0811BE6C: .4byte 0x02039DE4
_0811BE70:
	ldr r2, _0811BE90
	ldr r1, [r2]
	ldrb r0, [r1, #0xa]
	subs r0, #1
	strb r0, [r1, #0xa]
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0811BE8A
_0811BE86:
	bl sub_0811BF14
_0811BE8A:
	movs r0, #0xf
_0811BE8C:
	pop {r1}
	bx r1
	.align 2, 0
_0811BE90: .4byte 0x02039DE4
	thumb_func_end sub_0811BE04

	thumb_func_start sub_0811BE94
sub_0811BE94: @ 0x0811BE94
	push {lr}
	adds r2, r0, #0
	cmp r2, #1
	beq _0811BEE4
	cmp r2, #1
	blo _0811BEF8
	cmp r2, #2
	beq _0811BEAC
	cmp r2, #3
	beq _0811BEC8
	movs r0, #0
	b _0811BF0A
_0811BEAC:
	ldr r0, _0811BEC0
	ldr r1, [r0]
	ldrb r3, [r1, #0xb]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0811BEC4
	subs r0, r3, #1
	b _0811BF06
	.align 2, 0
_0811BEC0: .4byte 0x02039DE4
_0811BEC4:
	strb r2, [r1, #0xb]
	b _0811BF08
_0811BEC8:
	ldr r0, _0811BEDC
	ldr r1, [r0]
	ldrb r2, [r1, #0xb]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0811BEE0
	adds r0, r2, #1
	b _0811BF06
	.align 2, 0
_0811BEDC: .4byte 0x02039DE4
_0811BEE0:
	movs r0, #0
	b _0811BF06
_0811BEE4:
	ldr r0, _0811BEF4
	ldr r1, [r0]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	bl sub_0811BF38
	b _0811BF08
	.align 2, 0
_0811BEF4: .4byte 0x02039DE4
_0811BEF8:
	ldr r2, _0811BF10
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #0xa]
	ldr r1, [r2]
	ldrb r0, [r1, #0xb]
	adds r0, #1
_0811BF06:
	strb r0, [r1, #0xb]
_0811BF08:
	movs r0, #0xf
_0811BF0A:
	pop {r1}
	bx r1
	.align 2, 0
_0811BF10: .4byte 0x02039DE4
	thumb_func_end sub_0811BE94

	thumb_func_start sub_0811BF14
sub_0811BF14: @ 0x0811BF14
	push {lr}
	ldr r2, _0811BF34
	ldr r1, [r2]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	ldr r2, [r2]
	ldrb r1, [r2, #0xb]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0811BF2E
	subs r0, r1, #1
	strb r0, [r2, #0xb]
_0811BF2E:
	pop {r0}
	bx r0
	.align 2, 0
_0811BF34: .4byte 0x02039DE4
	thumb_func_end sub_0811BF14

	thumb_func_start sub_0811BF38
sub_0811BF38: @ 0x0811BF38
	push {r4, lr}
	ldr r4, _0811BF50
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _0811BF54
	movs r0, #2
	strb r0, [r1, #0xa]
	bl sub_0811C17C
	b _0811BF5E
	.align 2, 0
_0811BF50: .4byte 0x02039DE4
_0811BF54:
	ldrb r0, [r1, #0xb]
	bl sub_0811C160
	ldr r1, [r4]
	strb r0, [r1, #0xa]
_0811BF5E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0811BF38

	thumb_func_start sub_0811BF64
sub_0811BF64: @ 0x0811BF64
	push {r4, lr}
	cmp r0, #5
	bls _0811BF6C
	b _0811C090
_0811BF6C:
	lsls r0, r0, #2
	ldr r1, _0811BF78
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811BF78: .4byte 0x0811BF7C
_0811BF7C: @ jump table
	.4byte _0811C018 @ case 0
	.4byte _0811BFF6 @ case 1
	.4byte _0811BF94 @ case 2
	.4byte _0811BFC0 @ case 3
	.4byte _0811C040 @ case 4
	.4byte _0811C060 @ case 5
_0811BF94:
	ldr r0, _0811BFB4
	ldr r1, [r0]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldrb r3, [r1, #0xe]
	adds r0, r0, r3
	cmp r0, #0
	bgt _0811BFA6
	b _0811C090
_0811BFA6:
	ldrb r2, [r1, #0x11]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0811BFB8
	subs r0, r2, #1
	b _0811BFDE
	.align 2, 0
_0811BFB4: .4byte 0x02039DE4
_0811BFB8:
	subs r0, r3, #1
	strb r0, [r1, #0xe]
	movs r4, #0x13
	b _0811BFEE
_0811BFC0:
	ldr r0, _0811BFE4
	ldr r1, [r0]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldrb r3, [r1, #0xe]
	adds r0, r0, r3
	ldrb r2, [r1, #0xf]
	cmp r0, r2
	bge _0811C090
	ldrb r2, [r1, #0x11]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #2
	bgt _0811BFE8
	adds r0, r2, #1
_0811BFDE:
	strb r0, [r1, #0x11]
	movs r4, #0x12
	b _0811BFEE
	.align 2, 0
_0811BFE4: .4byte 0x02039DE4
_0811BFE8:
	adds r0, r3, #1
	strb r0, [r1, #0xe]
	movs r4, #0x14
_0811BFEE:
	bl sub_0811C1A4
	adds r0, r4, #0
	b _0811C092
_0811BFF6:
	ldr r0, _0811C008
	ldr r1, [r0]
	ldrb r2, [r1, #0x10]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0811C00C
	subs r0, r2, #1
	b _0811C00E
	.align 2, 0
_0811C008: .4byte 0x02039DE4
_0811C00C:
	movs r0, #2
_0811C00E:
	strb r0, [r1, #0x10]
	bl sub_0811C1A4
_0811C014:
	movs r0, #0x12
	b _0811C092
_0811C018:
	ldr r4, _0811C03C
	ldr r1, [r4]
	ldrb r2, [r1, #0x10]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0811C036
	adds r0, r2, #1
	strb r0, [r1, #0x10]
	bl sub_0811C220
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811C014
	ldr r1, [r4]
_0811C036:
	movs r0, #0
	strb r0, [r1, #0x10]
	b _0811C014
	.align 2, 0
_0811C03C: .4byte 0x02039DE4
_0811C040:
	ldr r0, _0811C054
	ldr r2, [r0]
	ldrb r0, [r2, #0xe]
	adds r1, r0, #0
	cmp r1, #0
	beq _0811C090
	cmp r1, #3
	bls _0811C058
	subs r0, #4
	b _0811C05A
	.align 2, 0
_0811C054: .4byte 0x02039DE4
_0811C058:
	movs r0, #0
_0811C05A:
	strb r0, [r2, #0xe]
	movs r0, #0x15
	b _0811C092
_0811C060:
	ldr r3, _0811C08C
	ldr r1, [r3]
	ldrb r2, [r1, #0xe]
	ldrb r0, [r1, #0xf]
	subs r0, #4
	cmp r2, r0
	bgt _0811C090
	adds r0, r2, #4
	strb r0, [r1, #0xe]
	ldr r2, [r3]
	ldrb r1, [r2, #0xe]
	ldrb r3, [r2, #0xf]
	subs r0, r3, #3
	cmp r1, r0
	ble _0811C084
	adds r0, r3, #0
	adds r0, #0xfd
	strb r0, [r2, #0xe]
_0811C084:
	bl sub_0811C1A4
	movs r0, #0x16
	b _0811C092
	.align 2, 0
_0811C08C: .4byte 0x02039DE4
_0811C090:
	movs r0, #0
_0811C092:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811BF64

	thumb_func_start sub_0811C098
sub_0811C098: @ 0x0811C098
	ldr r0, _0811C0B4
	ldr r0, [r0]
	movs r2, #6
	ldrsb r2, [r0, r2]
	ldrb r1, [r0, #2]
	muls r1, r2, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0811C0B4: .4byte 0x02039DE4
	thumb_func_end sub_0811C098

	thumb_func_start sub_0811C0B8
sub_0811C0B8: @ 0x0811C0B8
	ldr r0, _0811C0D4
	ldr r2, [r0]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0811C0D4: .4byte 0x02039DE4
	thumb_func_end sub_0811C0B8

	thumb_func_start GetFooterIndex
GetFooterIndex: @ 0x0811C0D8
	push {lr}
	ldr r0, _0811C0F8
	ldr r2, [r0]
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	cmp r0, #4
	bgt _0811C0FC
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r1, #1
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	b _0811C130
	.align 2, 0
_0811C0F8: .4byte 0x02039DE4
_0811C0FC:
	cmp r0, #9
	bgt _0811C11E
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	cmp r0, #2
	bgt _0811C116
	lsls r1, r0, #2
	adds r1, r1, r0
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r0, #0x10
	b _0811C130
_0811C116:
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	adds r0, #0x22
	b _0811C130
_0811C11E:
	cmp r0, #0xc
	bgt _0811C13A
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0811C136
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	adds r0, #0x1a
_0811C130:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0811C13C
_0811C136:
	movs r0, #0
	b _0811C13C
_0811C13A:
	movs r0, #0x2c
_0811C13C:
	pop {r1}
	bx r1
	thumb_func_end GetFooterIndex

	thumb_func_start sub_0811C140
sub_0811C140: @ 0x0811C140
	ldr r0, _0811C15C
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, #0xe]
	adds r0, r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0811C15C: .4byte 0x02039DE4
	thumb_func_end sub_0811C140

	thumb_func_start sub_0811C160
sub_0811C160: @ 0x0811C160
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0811C172
	cmp r0, #1
	beq _0811C176
	movs r0, #9
	b _0811C178
_0811C172:
	movs r0, #0xd
	b _0811C178
_0811C176:
	movs r0, #0xa
_0811C178:
	pop {r1}
	bx r1
	thumb_func_end sub_0811C160

	thumb_func_start sub_0811C17C
sub_0811C17C: @ 0x0811C17C
	push {lr}
	b _0811C192
_0811C180:
	ldr r0, _0811C1A0
	ldr r1, [r0]
	ldrb r2, [r1, #0xa]
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0811C19C
	subs r0, r2, #1
	strb r0, [r1, #0xa]
_0811C192:
	bl sub_0811C1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811C180
_0811C19C:
	pop {r0}
	bx r0
	.align 2, 0
_0811C1A0: .4byte 0x02039DE4
	thumb_func_end sub_0811C17C

	thumb_func_start sub_0811C1A4
sub_0811C1A4: @ 0x0811C1A4
	push {lr}
	b _0811C1BA
_0811C1A8:
	ldr r0, _0811C1C8
	ldr r1, [r0]
	ldrb r2, [r1, #0x10]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0811C1C4
	subs r0, r2, #1
	strb r0, [r1, #0x10]
_0811C1BA:
	bl sub_0811C220
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811C1A8
_0811C1C4:
	pop {r0}
	bx r0
	.align 2, 0
_0811C1C8: .4byte 0x02039DE4
	thumb_func_end sub_0811C1A4

	thumb_func_start sub_0811C1CC
sub_0811C1CC: @ 0x0811C1CC
	push {r4, lr}
	ldr r4, _0811C1F8
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _0811C1FC
	bl sub_0811C0B8
	adds r4, r0, #0
	bl sub_0811F908
	movs r1, #0
	lsls r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blo _0811C1F2
	movs r1, #1
_0811C1F2:
	adds r0, r1, #0
	b _0811C218
	.align 2, 0
_0811C1F8: .4byte 0x02039DE4
_0811C1FC:
	ldrb r0, [r1, #0xb]
	bl sub_0811C160
	movs r2, #0
	ldr r1, [r4]
	ldrb r1, [r1, #0xa]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	ble _0811C216
	movs r2, #1
_0811C216:
	adds r0, r2, #0
_0811C218:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811C1CC

	thumb_func_start sub_0811C220
sub_0811C220: @ 0x0811C220
	push {r4, lr}
	bl sub_0811C140
	adds r4, r0, #0
	bl sub_0811FB08
	movs r1, #0
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	blo _0811C238
	movs r1, #1
_0811C238:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811C220

	thumb_func_start FooterHasFourOptions
FooterHasFourOptions: @ 0x0811C240
	ldr r2, _0811C258
	ldr r0, _0811C25C
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #3]
	lsrs r0, r0, #7
	bx lr
	.align 2, 0
_0811C258: .4byte 0x08573134
_0811C25C: .4byte 0x02039DE4
	thumb_func_end FooterHasFourOptions

	thumb_func_start GetEasyChatScreenType
GetEasyChatScreenType: @ 0x0811C260
	ldr r0, _0811C268
	ldr r0, [r0]
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0811C268: .4byte 0x02039DE4
	thumb_func_end GetEasyChatScreenType

	thumb_func_start GetEasyChatScreenFrameId
GetEasyChatScreenFrameId: @ 0x0811C26C
	ldr r2, _0811C284
	ldr r0, _0811C288
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bx lr
	.align 2, 0
_0811C284: .4byte 0x08573134
_0811C288: .4byte 0x02039DE4
	thumb_func_end GetEasyChatScreenFrameId

	thumb_func_start GetTitleText
GetTitleText: @ 0x0811C28C
	ldr r0, _0811C294
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	bx lr
	.align 2, 0
_0811C294: .4byte 0x02039DE4
	thumb_func_end GetTitleText

	thumb_func_start GetEasyChatWordBuffer
GetEasyChatWordBuffer: @ 0x0811C298
	ldr r0, _0811C2A0
	ldr r0, [r0]
	adds r0, #0x3c
	bx lr
	.align 2, 0
_0811C2A0: .4byte 0x02039DE4
	thumb_func_end GetEasyChatWordBuffer

	thumb_func_start GetNumRows
GetNumRows: @ 0x0811C2A4
	ldr r0, _0811C2AC
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_0811C2AC: .4byte 0x02039DE4
	thumb_func_end GetNumRows

	thumb_func_start GetNumColumns
GetNumColumns: @ 0x0811C2B0
	ldr r0, _0811C2B8
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_0811C2B8: .4byte 0x02039DE4
	thumb_func_end GetNumColumns

	thumb_func_start GetMainCursorColumn
GetMainCursorColumn: @ 0x0811C2BC
	ldr r0, _0811C2C4
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	bx lr
	.align 2, 0
_0811C2C4: .4byte 0x02039DE4
	thumb_func_end GetMainCursorColumn

	thumb_func_start GetMainCursorRow
GetMainCursorRow: @ 0x0811C2C8
	ldr r0, _0811C2D0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	bx lr
	.align 2, 0
_0811C2D0: .4byte 0x02039DE4
	thumb_func_end GetMainCursorRow

	thumb_func_start GetEasyChatInstructionsText
GetEasyChatInstructionsText: @ 0x0811C2D4
	push {r4, r5, lr}
	ldr r4, _0811C304
	ldr r2, _0811C308
	ldr r5, [r2]
	ldrb r3, [r5, #1]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r3, r4, #0
	adds r3, #8
	adds r2, r2, r3
	ldr r2, [r2]
	str r2, [r0]
	ldrb r2, [r5, #1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, #0xc
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C304: .4byte 0x08573134
_0811C308: .4byte 0x02039DE4
	thumb_func_end GetEasyChatInstructionsText

	thumb_func_start GetEasyChatConfirmText
GetEasyChatConfirmText: @ 0x0811C30C
	push {r4, r5, lr}
	ldr r4, _0811C33C
	ldr r2, _0811C340
	ldr r5, [r2]
	ldrb r3, [r5, #1]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r3, r4, #0
	adds r3, #0x10
	adds r2, r2, r3
	ldr r2, [r2]
	str r2, [r0]
	ldrb r2, [r5, #1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r4, #0x14
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C33C: .4byte 0x08573134
_0811C340: .4byte 0x02039DE4
	thumb_func_end GetEasyChatConfirmText

	thumb_func_start sub_0811C344
sub_0811C344: @ 0x0811C344
	push {lr}
	adds r2, r0, #0
	ldr r0, _0811C358
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #4
	bne _0811C360
	ldr r0, _0811C35C
	b _0811C37E
	.align 2, 0
_0811C358: .4byte 0x02039DE4
_0811C35C: .4byte 0x085CBA71
_0811C360:
	cmp r0, #4
	blt _0811C37C
	cmp r0, #0x10
	bgt _0811C37C
	cmp r0, #0xf
	blt _0811C37C
	ldr r0, _0811C374
	str r0, [r2]
	ldr r0, _0811C378
	b _0811C382
	.align 2, 0
_0811C374: .4byte 0x085CBCAB
_0811C378: .4byte 0x085CBCB7
_0811C37C:
	ldr r0, _0811C388
_0811C37E:
	str r0, [r2]
	movs r0, #0
_0811C382:
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811C388: .4byte 0x085CBA63
	thumb_func_end sub_0811C344

	thumb_func_start GetEasyChatConfirmDeletionText
GetEasyChatConfirmDeletionText: @ 0x0811C38C
	ldr r2, _0811C398
	str r2, [r0]
	ldr r0, _0811C39C
	str r0, [r1]
	bx lr
	.align 2, 0
_0811C398: .4byte 0x085CBAA7
_0811C39C: .4byte 0x085CBAB6
	thumb_func_end GetEasyChatConfirmDeletionText

	thumb_func_start sub_0811C3A0
sub_0811C3A0: @ 0x0811C3A0
	ldr r2, _0811C3B0
	ldr r3, [r2]
	ldrb r2, [r3, #0xa]
	strb r2, [r0]
	ldrb r0, [r3, #0xb]
	strb r0, [r1]
	bx lr
	.align 2, 0
_0811C3B0: .4byte 0x02039DE4
	thumb_func_end sub_0811C3A0

	thumb_func_start sub_0811C3B4
sub_0811C3B4: @ 0x0811C3B4
	ldr r0, _0811C3BC
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	bx lr
	.align 2, 0
_0811C3BC: .4byte 0x02039DE4
	thumb_func_end sub_0811C3B4

	thumb_func_start sub_0811C3C0
sub_0811C3C0: @ 0x0811C3C0
	ldr r0, _0811C3C8
	ldr r0, [r0]
	ldrb r0, [r0, #0xc]
	bx lr
	.align 2, 0
_0811C3C8: .4byte 0x02039DE4
	thumb_func_end sub_0811C3C0

	thumb_func_start sub_0811C3CC
sub_0811C3CC: @ 0x0811C3CC
	ldr r2, _0811C3DC
	ldr r3, [r2]
	ldrb r2, [r3, #0x10]
	strb r2, [r0]
	ldrb r0, [r3, #0x11]
	strb r0, [r1]
	bx lr
	.align 2, 0
_0811C3DC: .4byte 0x02039DE4
	thumb_func_end sub_0811C3CC

	thumb_func_start sub_0811C3E0
sub_0811C3E0: @ 0x0811C3E0
	ldr r0, _0811C3E8
	ldr r0, [r0]
	ldrb r0, [r0, #0xe]
	bx lr
	.align 2, 0
_0811C3E8: .4byte 0x02039DE4
	thumb_func_end sub_0811C3E0

	thumb_func_start sub_0811C3EC
sub_0811C3EC: @ 0x0811C3EC
	ldr r0, _0811C3F4
	ldr r0, [r0]
	ldrb r0, [r0, #0xf]
	bx lr
	.align 2, 0
_0811C3F4: .4byte 0x02039DE4
	thumb_func_end sub_0811C3EC

	thumb_func_start sub_0811C3F8
sub_0811C3F8: @ 0x0811C3F8
	movs r0, #0
	bx lr
	thumb_func_end sub_0811C3F8

	thumb_func_start sub_0811C3FC
sub_0811C3FC: @ 0x0811C3FC
	push {lr}
	ldr r0, _0811C410
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	cmp r0, #2
	beq _0811C414
	cmp r0, #3
	beq _0811C41E
	b _0811C428
	.align 2, 0
_0811C410: .4byte 0x02039DE4
_0811C414:
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _0811C428
	ldrb r0, [r1, #0xc]
	b _0811C420
_0811C41E:
	ldrb r0, [r1, #0xe]
_0811C420:
	cmp r0, #0
	beq _0811C428
	movs r0, #1
	b _0811C42A
_0811C428:
	movs r0, #0
_0811C42A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811C3FC

	thumb_func_start sub_0811C430
sub_0811C430: @ 0x0811C430
	push {lr}
	ldr r0, _0811C444
	ldr r2, [r0]
	ldrb r0, [r2, #4]
	cmp r0, #2
	beq _0811C448
	cmp r0, #3
	beq _0811C45E
	b _0811C46C
	.align 2, 0
_0811C444: .4byte 0x02039DE4
_0811C448:
	ldrb r0, [r2, #9]
	cmp r0, #0
	bne _0811C46C
	ldrb r1, [r2, #0xc]
	adds r1, #4
	ldrb r0, [r2, #0xd]
	subs r0, #1
	cmp r1, r0
	bgt _0811C46C
	movs r0, #1
	b _0811C46E
_0811C45E:
	ldrb r0, [r2, #0xe]
	adds r0, #4
	ldrb r2, [r2, #0xf]
	cmp r0, r2
	bgt _0811C46C
	movs r0, #1
	b _0811C46E
_0811C46C:
	movs r0, #0
_0811C46E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811C430

	thumb_func_start FooterHasFourOptions_
FooterHasFourOptions_: @ 0x0811C474
	push {lr}
	bl FooterHasFourOptions
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end FooterHasFourOptions_

	thumb_func_start sub_0811C480
sub_0811C480: @ 0x0811C480
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r2, #0
	cmp r2, r3
	bhs _0811C4B6
	ldr r0, _0811C4A8
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x3c
_0811C496:
	lsls r0, r2, #1
	adds r1, r0, r5
	adds r0, r4, r0
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0811C4AC
	movs r0, #1
	b _0811C4B8
	.align 2, 0
_0811C4A8: .4byte 0x02039DE4
_0811C4AC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r3
	blo _0811C496
_0811C4B6:
	movs r0, #0
_0811C4B8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811C480

	thumb_func_start GetDisplayedPersonType
GetDisplayedPersonType: @ 0x0811C4C0
	ldr r0, _0811C4C8
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	bx lr
	.align 2, 0
_0811C4C8: .4byte 0x02039DE4
	thumb_func_end GetDisplayedPersonType

	thumb_func_start GetEachChatScreenTemplateId
GetEachChatScreenTemplateId: @ 0x0811C4CC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	ldr r2, _0811C4E4
_0811C4D6:
	ldrb r0, [r2]
	cmp r0, r3
	bne _0811C4E8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	b _0811C4F2
	.align 2, 0
_0811C4E4: .4byte 0x08573134
_0811C4E8:
	adds r2, #0x18
	adds r1, #1
	cmp r1, #0x14
	bls _0811C4D6
	movs r0, #0
_0811C4F2:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetEachChatScreenTemplateId

	thumb_func_start sub_0811C4F8
sub_0811C4F8: @ 0x0811C4F8
	push {r4, lr}
	movs r2, #0
	ldr r0, _0811C518
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	cmp r2, r1
	bge _0811C528
	ldr r4, _0811C51C
	adds r3, r1, #0
	adds r1, r0, #0
	adds r1, #0x3c
_0811C50E:
	ldrh r0, [r1]
	cmp r0, r4
	beq _0811C520
	movs r0, #0
	b _0811C52A
	.align 2, 0
_0811C518: .4byte 0x02039DE4
_0811C51C: .4byte 0x0000FFFF
_0811C520:
	adds r1, #2
	adds r2, #1
	cmp r2, r3
	blt _0811C50E
_0811C528:
	movs r0, #1
_0811C52A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811C4F8

	thumb_func_start sub_0811C530
sub_0811C530: @ 0x0811C530
	push {r4, lr}
	movs r2, #0
	ldr r0, _0811C550
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	cmp r2, r1
	bge _0811C560
	ldr r4, _0811C554
	adds r3, r1, #0
	adds r1, r0, #0
	adds r1, #0x3c
_0811C546:
	ldrh r0, [r1]
	cmp r0, r4
	bne _0811C558
	movs r0, #0
	b _0811C562
	.align 2, 0
_0811C550: .4byte 0x02039DE4
_0811C554: .4byte 0x0000FFFF
_0811C558:
	adds r1, #2
	adds r2, #1
	cmp r2, r3
	blt _0811C546
_0811C560:
	movs r0, #1
_0811C562:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811C530

	thumb_func_start sub_0811C568
sub_0811C568: @ 0x0811C568
	push {r4, lr}
	ldr r0, _0811C57C
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0811C584
	bl sub_0811C4F8
	b _0811C5A0
	.align 2, 0
_0811C57C: .4byte 0x02039DE4
_0811C580:
	movs r0, #0
	b _0811C5A0
_0811C584:
	ldr r0, _0811C5A8
	ldr r0, [r0]
	movs r2, #0
	ldr r3, _0811C5AC
	ldr r4, _0811C5B0
	adds r1, r0, r4
_0811C590:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0811C580
	adds r1, #2
	adds r2, #1
	cmp r2, #8
	ble _0811C590
	movs r0, #1
_0811C5A0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C5A8: .4byte 0x03005AEC
_0811C5AC: .4byte 0x0000FFFF
_0811C5B0: .4byte 0x00003B5A
	thumb_func_end sub_0811C568

	thumb_func_start sub_0811C5B4
sub_0811C5B4: @ 0x0811C5B4
	push {lr}
	ldr r0, _0811C5C8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _0811C5CC
	bl sub_0811C4F8
	b _0811C5E2
	.align 2, 0
_0811C5C8: .4byte 0x02039DE4
_0811C5CC:
	ldr r0, _0811C5E8
	ldr r0, [r0]
	ldr r1, _0811C5EC
	adds r0, r0, r1
	movs r2, #0
	ldrh r1, [r0, #0x14]
	ldr r0, _0811C5F0
	cmp r1, r0
	bne _0811C5E0
	movs r2, #1
_0811C5E0:
	adds r0, r2, #0
_0811C5E2:
	pop {r1}
	bx r1
	.align 2, 0
_0811C5E8: .4byte 0x03005AEC
_0811C5EC: .4byte 0x00003B58
_0811C5F0: .4byte 0x0000FFFF
	thumb_func_end sub_0811C5B4

	thumb_func_start sub_0811C5F4
sub_0811C5F4: @ 0x0811C5F4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0811C61C
	ldr r4, [r0]
	bl DynamicPlaceholderTextUtil_Reset
	ldr r0, _0811C620
	adds r4, r4, r0
	adds r0, r4, #0
	bl StringLength
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0811C624
	movs r0, #0
	adds r1, r4, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
	b _0811C62C
	.align 2, 0
_0811C61C: .4byte 0x03005AEC
_0811C620: .4byte 0x00003B70
_0811C624:
	ldr r1, _0811C63C
	movs r0, #0
	bl DynamicPlaceholderTextUtil_SetPlaceholderPtr
_0811C62C:
	ldr r1, _0811C640
	adds r0, r5, #0
	bl DynamicPlaceholderTextUtil_ExpandPlaceholders
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C63C: .4byte 0x085CBC85
_0811C640: .4byte 0x085CBC7B
	thumb_func_end sub_0811C5F4

	thumb_func_start sub_0811C644
sub_0811C644: @ 0x0811C644
	push {r4, r5, lr}
	ldr r0, _0811C654
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x3c
	ldr r2, _0811C658
	movs r5, #0
	b _0811C676
	.align 2, 0
_0811C654: .4byte 0x02039DE4
_0811C658: .4byte 0x02021C54
_0811C65C:
	ldrh r1, [r4]
	adds r0, r2, #0
	movs r2, #0
	bl CopyEasyChatWordPadded
	adds r2, r0, #0
	movs r0, #0
	strb r0, [r2]
	adds r2, #1
	adds r4, #2
	adds r5, #1
	ldr r0, _0811C688
	ldr r0, [r0]
_0811C676:
	ldrb r0, [r0, #7]
	cmp r5, r0
	blt _0811C65C
	subs r2, #1
	movs r0, #0xff
	strb r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C688: .4byte 0x02039DE4
	thumb_func_end sub_0811C644

	thumb_func_start sub_0811C68C
sub_0811C68C: @ 0x0811C68C
	push {r4, r5, lr}
	ldr r5, _0811C6A4
	ldr r0, [r5]
	ldrb r0, [r0]
	cmp r0, #9
	beq _0811C6F4
	cmp r0, #9
	bgt _0811C6A8
	cmp r0, #0
	beq _0811C6B2
	b _0811C718
	.align 2, 0
_0811C6A4: .4byte 0x02039DE4
_0811C6A8:
	cmp r0, #0xd
	beq _0811C710
	cmp r0, #0x14
	beq _0811C6C0
	b _0811C718
_0811C6B2:
	ldr r0, _0811C6BC
	bl FlagSet
	b _0811C718
	.align 2, 0
_0811C6BC: .4byte 0x00000865
_0811C6C0:
	bl sub_0811C724
	cmp r0, #0
	beq _0811C6D4
	ldr r1, _0811C6D0
	movs r0, #1
	b _0811C716
	.align 2, 0
_0811C6D0: .4byte 0x02037280
_0811C6D4:
	bl sub_0811C744
	adds r1, r0, #0
	cmp r1, #0
	beq _0811C6E8
	ldr r1, _0811C6E4
	movs r0, #2
	b _0811C716
	.align 2, 0
_0811C6E4: .4byte 0x02037280
_0811C6E8:
	ldr r0, _0811C6F0
	strh r1, [r0]
	b _0811C718
	.align 2, 0
_0811C6F0: .4byte 0x02037280
_0811C6F4:
	bl sub_0811C644
	ldr r4, _0811C70C
	ldr r0, [r5]
	adds r0, #0x3c
	bl sub_081226E4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4]
	b _0811C718
	.align 2, 0
_0811C70C: .4byte 0x02037280
_0811C710:
	bl sub_0811C764
	ldr r1, _0811C720
_0811C716:
	strh r0, [r1]
_0811C718:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C720: .4byte 0x02037280
	thumb_func_end sub_0811C68C

	thumb_func_start sub_0811C724
sub_0811C724: @ 0x0811C724
	push {lr}
	ldr r0, _0811C740
	movs r1, #4
	bl sub_0811C480
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811C738
	movs r1, #1
_0811C738:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0811C740: .4byte 0x0857332C
	thumb_func_end sub_0811C724

	thumb_func_start sub_0811C744
sub_0811C744: @ 0x0811C744
	push {lr}
	ldr r0, _0811C760
	movs r1, #4
	bl sub_0811C480
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811C758
	movs r1, #1
_0811C758:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0811C760: .4byte 0x08573334
	thumb_func_end sub_0811C744

	thumb_func_start sub_0811C764
sub_0811C764: @ 0x0811C764
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #9
_0811C76C:
	lsls r0, r4, #2
	ldr r1, _0811C784
	adds r0, r0, r1
	movs r1, #2
	bl sub_0811C480
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811C788
	lsrs r0, r5, #0x10
	b _0811C796
	.align 2, 0
_0811C784: .4byte 0x0857333C
_0811C788:
	movs r0, #0x80
	lsls r0, r0, #9
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #4
	ble _0811C76C
	movs r0, #0
_0811C796:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0811C764

	thumb_func_start sub_0811C79C
sub_0811C79C: @ 0x0811C79C
	push {r4, r5, r6, lr}
	ldr r6, _0811C81C
	ldr r1, [r6]
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0811C814
	movs r0, #0
	strb r0, [r1, #0x13]
	ldr r4, [r6]
	bl sub_0811C098
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r4, #0x3c
	adds r4, r4, r0
	ldrh r0, [r4]
	bl GetEasyChatWordStringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bhi _0811C814
	ldr r0, [r6]
	movs r1, #6
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #2]
	adds r5, r1, #0
	muls r5, r0, r5
	movs r4, #0
	cmp r4, r0
	bge _0811C80C
_0811C7E0:
	ldr r2, [r6]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r4, r0
	beq _0811C800
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x3c
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetEasyChatWordStringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bls _0811C814
_0811C800:
	adds r5, #1
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #2]
	cmp r4, r0
	blt _0811C7E0
_0811C80C:
	ldr r0, _0811C81C
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x13]
_0811C814:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811C81C: .4byte 0x02039DE4
	thumb_func_end sub_0811C79C

	thumb_func_start sub_0811C820
sub_0811C820: @ 0x0811C820
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0811C844
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	beq _0811C848
	adds r0, r1, #0
	bl GetEasyChatWordStringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bls _0811C848
	movs r0, #1
	b _0811C84A
	.align 2, 0
_0811C844: .4byte 0x02039DE4
_0811C848:
	movs r0, #0
_0811C84A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811C820

	thumb_func_start sub_0811C850
sub_0811C850: @ 0x0811C850
	push {lr}
	bl sub_0811D748
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811C860
	movs r0, #1
	b _0811C862
_0811C860:
	movs r0, #0
_0811C862:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811C850

	thumb_func_start sub_0811C868
sub_0811C868: @ 0x0811C868
	push {r4, lr}
	sub sp, #8
	ldr r0, _0811C884
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #5
	bls _0811C878
	b _0811C9E0
_0811C878:
	lsls r0, r0, #2
	ldr r1, _0811C888
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811C884: .4byte 0x02039DE8
_0811C888: .4byte 0x0811C88C
_0811C88C: @ jump table
	.4byte _0811C8A4 @ case 0
	.4byte _0811C908 @ case 1
	.4byte _0811C950 @ case 2
	.4byte _0811C96C @ case 3
	.4byte _0811C97E @ case 4
	.4byte _0811C994 @ case 5
_0811C8A4:
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0811C8F4
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r4, _0811C8F8
	ldr r1, [r4]
	ldr r0, _0811C8FC
	adds r1, r1, r0
	movs r0, #3
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	movs r0, #0xbf
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r0, _0811C900
	bl InitWindows
	bl DeactivateAllTextPrinters
	bl sub_0811D814
	bl sub_0811D7B4
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ldr r2, _0811C904
	add r0, sp, #4
	bl CpuFastSet
	b _0811C9E4
	.align 2, 0
_0811C8F4: .4byte 0x0857437C
_0811C8F8: .4byte 0x02039DE8
_0811C8FC: .4byte 0x00000AFC
_0811C900: .4byte 0x0857438C
_0811C904: .4byte 0x01000100
_0811C908:
	ldr r1, _0811C944
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	ldr r1, _0811C948
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBuffer
	bl sub_0811DE14
	ldr r0, _0811C94C
	ldr r0, [r0]
	movs r1, #0xbf
	lsls r1, r1, #2
	adds r0, r0, r1
	bl sub_0811DCAC
	bl sub_0811DB10
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	b _0811C9E4
	.align 2, 0
_0811C944: .4byte 0x08573E84
_0811C948: .4byte 0x085740E4
_0811C94C: .4byte 0x02039DE8
_0811C950:
	ldr r1, _0811C968
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl DecompressAndLoadBgGfxUsingHeap
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	b _0811C9E4
	.align 2, 0
_0811C968: .4byte 0x0857427C
_0811C96C:
	bl sub_0811D87C
	bl sub_0811D990
	bl sub_0811DBA8
	bl sub_0811DE8C
	b _0811C9E4
_0811C97E:
	bl sub_0811E6A4
	bl GetEasyChatScreenType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	beq _0811C9E4
	bl sub_0811E6D8
	b _0811C9E4
_0811C994:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811C9EE
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_0811E670
	movs r0, #0x48
	movs r1, #0x3f
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0x3b
	bl SetGpuReg
	movs r0, #3
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #0
	bl ShowBg
	bl sub_0811ED20
	bl sub_0811EE6C
	bl sub_0811EF74
	b _0811C9E4
_0811C9E0:
	movs r0, #0
	b _0811C9F0
_0811C9E4:
	ldr r0, _0811C9F8
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811C9EE:
	movs r0, #1
_0811C9F0:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C9F8: .4byte 0x02039DE8
	thumb_func_end sub_0811C868

	thumb_func_start sub_0811C9FC
sub_0811C9FC: @ 0x0811C9FC
	push {r4, lr}
	ldr r4, _0811CA14
	ldr r0, [r4]
	cmp r0, #0
	beq _0811CA0E
	bl Free
	movs r0, #0
	str r0, [r4]
_0811CA0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811CA14: .4byte 0x02039DE8
	thumb_func_end sub_0811C9FC

	thumb_func_start sub_0811CA18
sub_0811CA18: @ 0x0811CA18
	push {lr}
	ldr r1, _0811CA2C
	ldr r1, [r1]
	movs r2, #0
	strh r0, [r1, #4]
	strh r2, [r1]
	bl sub_0811CA30
	pop {r0}
	bx r0
	.align 2, 0
_0811CA2C: .4byte 0x02039DE8
	thumb_func_end sub_0811CA18

	thumb_func_start sub_0811CA30
sub_0811CA30: @ 0x0811CA30
	push {lr}
	ldr r0, _0811CA48
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0x22
	bls _0811CA3E
	b _0811CB8E
_0811CA3E:
	lsls r0, r0, #2
	ldr r1, _0811CA4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811CA48: .4byte 0x02039DE8
_0811CA4C: .4byte 0x0811CA50
_0811CA50: @ jump table
	.4byte _0811CB8E @ case 0
	.4byte _0811CADC @ case 1
	.4byte _0811CAE2 @ case 2
	.4byte _0811CAE8 @ case 3
	.4byte _0811CAEE @ case 4
	.4byte _0811CAF4 @ case 5
	.4byte _0811CAFA @ case 6
	.4byte _0811CB00 @ case 7
	.4byte _0811CB06 @ case 8
	.4byte _0811CB0C @ case 9
	.4byte _0811CB12 @ case 10
	.4byte _0811CB18 @ case 11
	.4byte _0811CB1E @ case 12
	.4byte _0811CB24 @ case 13
	.4byte _0811CB2A @ case 14
	.4byte _0811CB30 @ case 15
	.4byte _0811CB36 @ case 16
	.4byte _0811CB3C @ case 17
	.4byte _0811CB42 @ case 18
	.4byte _0811CB48 @ case 19
	.4byte _0811CB4E @ case 20
	.4byte _0811CB54 @ case 21
	.4byte _0811CB5A @ case 22
	.4byte _0811CB60 @ case 23
	.4byte _0811CB8E @ case 24
	.4byte _0811CB8E @ case 25
	.4byte _0811CB8E @ case 26
	.4byte _0811CB8E @ case 27
	.4byte _0811CB8E @ case 28
	.4byte _0811CB66 @ case 29
	.4byte _0811CB6C @ case 30
	.4byte _0811CB72 @ case 31
	.4byte _0811CB78 @ case 32
	.4byte _0811CB7E @ case 33
	.4byte _0811CB84 @ case 34
_0811CADC:
	bl sub_0811CB94
	b _0811CB88
_0811CAE2:
	bl sub_0811CBCC
	b _0811CB88
_0811CAE8:
	bl sub_0811CC88
	b _0811CB88
_0811CAEE:
	bl sub_0811CD40
	b _0811CB88
_0811CAF4:
	bl sub_0811CCB8
	b _0811CB88
_0811CAFA:
	bl sub_0811CCFC
	b _0811CB88
_0811CB00:
	bl sub_0811CD84
	b _0811CB88
_0811CB06:
	bl sub_0811CDCC
	b _0811CB88
_0811CB0C:
	bl sub_0811CE08
	b _0811CB88
_0811CB12:
	bl sub_0811CED4
	b _0811CB88
_0811CB18:
	bl sub_0811D0E4
	b _0811CB88
_0811CB1E:
	bl sub_0811D1A4
	b _0811CB88
_0811CB24:
	bl sub_0811D250
	b _0811CB88
_0811CB2A:
	bl sub_0811D310
	b _0811CB88
_0811CB30:
	bl sub_0811D034
	b _0811CB88
_0811CB36:
	bl sub_0811D040
	b _0811CB88
_0811CB3C:
	bl sub_0811D088
	b _0811CB88
_0811CB42:
	bl sub_0811D3CC
	b _0811CB88
_0811CB48:
	bl sub_0811D44C
	b _0811CB88
_0811CB4E:
	bl sub_0811D3D8
	b _0811CB88
_0811CB54:
	bl sub_0811D544
	b _0811CB88
_0811CB5A:
	bl sub_0811D4BC
	b _0811CB88
_0811CB60:
	bl sub_0811CF74
	b _0811CB88
_0811CB66:
	bl sub_0811D5C8
	b _0811CB88
_0811CB6C:
	bl sub_0811D608
	b _0811CB88
_0811CB72:
	bl sub_0811D648
	b _0811CB88
_0811CB78:
	bl sub_0811D688
	b _0811CB88
_0811CB7E:
	bl sub_0811D6C8
	b _0811CB88
_0811CB84:
	bl sub_0811D708
_0811CB88:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811CB90
_0811CB8E:
	movs r0, #0
_0811CB90:
	pop {r1}
	bx r1
	thumb_func_end sub_0811CA30

	thumb_func_start sub_0811CB94
sub_0811CB94: @ 0x0811CB94
	push {r4, lr}
	ldr r4, _0811CBA8
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811CBAC
	cmp r0, #1
	beq _0811CBBA
	b _0811CBC4
	.align 2, 0
_0811CBA8: .4byte 0x02039DE8
_0811CBAC:
	bl sub_0811DBA8
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811CBC4
_0811CBBA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811CBC6
_0811CBC4:
	movs r0, #1
_0811CBC6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811CB94

	thumb_func_start sub_0811CBCC
sub_0811CBCC: @ 0x0811CBCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl GetEasyChatWordBuffer
	adds r5, r0, #0
	bl GetEasyChatScreenFrameId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	bl GetMainCursorColumn
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	bl GetMainCursorRow
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	bl GetNumColumns
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	lsls r0, r0, #1
	adds r5, r5, r0
	ldr r1, _0811CC3C
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0xb
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	movs r6, #0
	cmp r6, r7
	bhs _0811CC56
	ldr r2, _0811CC40
	mov r8, r2
_0811CC2A:
	ldrh r0, [r5]
	cmp r0, r8
	beq _0811CC44
	bl GetEasyChatWordStringLength
	adds r1, r4, #2
	adds r0, r0, r1
	b _0811CC46
	.align 2, 0
_0811CC3C: .4byte 0x08574358
_0811CC40: .4byte 0x0000FFFF
_0811CC44:
	adds r0, r4, #7
_0811CC46:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, #2
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _0811CC2A
_0811CC56:
	ldr r1, _0811CC84
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsrs r1, r1, #5
	mov r2, sb
	lsls r0, r2, #1
	adds r1, r1, r0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_0811E76C
	movs r0, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811CC84: .4byte 0x08574358
	thumb_func_end sub_0811CBCC

	thumb_func_start sub_0811CC88
sub_0811CC88: @ 0x0811CC88
	push {r4, lr}
	ldr r4, _0811CCB0
	bl GetMainCursorColumn
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0811CCB4
	ldr r1, [r1]
	ldrb r1, [r1, #0xa]
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0xa
	bl sub_0811E76C
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811CCB0: .4byte 0x085743B4
_0811CCB4: .4byte 0x02039DE8
	thumb_func_end sub_0811CC88

	thumb_func_start sub_0811CCB8
sub_0811CCB8: @ 0x0811CCB8
	push {r4, lr}
	ldr r4, _0811CCCC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811CCD0
	cmp r0, #1
	beq _0811CCEA
	b _0811CCF4
	.align 2, 0
_0811CCCC: .4byte 0x02039DE8
_0811CCD0:
	bl sub_0811E7A0
	movs r0, #2
	bl sub_0811D9D8
	movs r0, #1
	bl sub_0811DAE4
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811CCF4
_0811CCEA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811CCF6
_0811CCF4:
	movs r0, #1
_0811CCF6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811CCB8

	thumb_func_start sub_0811CCFC
sub_0811CCFC: @ 0x0811CCFC
	push {r4, lr}
	ldr r4, _0811CD10
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811CD14
	cmp r0, #1
	beq _0811CD2E
	b _0811CD38
	.align 2, 0
_0811CD10: .4byte 0x02039DE8
_0811CD14:
	bl sub_0811E7A0
	movs r0, #3
	bl sub_0811D9D8
	movs r0, #0
	bl sub_0811DAE4
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811CD38
_0811CD2E:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811CD3A
_0811CD38:
	movs r0, #1
_0811CD3A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811CCFC

	thumb_func_start sub_0811CD40
sub_0811CD40: @ 0x0811CD40
	push {r4, lr}
	ldr r4, _0811CD54
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811CD58
	cmp r0, #1
	beq _0811CD72
	b _0811CD7C
	.align 2, 0
_0811CD54: .4byte 0x02039DE8
_0811CD58:
	bl sub_0811E7A0
	movs r0, #1
	bl sub_0811D9D8
	movs r0, #1
	bl sub_0811DAE4
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811CD7C
_0811CD72:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811CD7E
_0811CD7C:
	movs r0, #1
_0811CD7E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811CD40

	thumb_func_start sub_0811CD84
sub_0811CD84: @ 0x0811CD84
	push {r4, lr}
	ldr r4, _0811CD98
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811CD9C
	cmp r0, #1
	beq _0811CDBA
	b _0811CDC4
	.align 2, 0
_0811CD98: .4byte 0x02039DE8
_0811CD9C:
	bl sub_0811E7C0
	movs r0, #0
	bl sub_0811D9D8
	bl sub_0811DBA8
	movs r0, #0
	bl ShowBg
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811CDC4
_0811CDBA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811CDC6
_0811CDC4:
	movs r0, #1
_0811CDC6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811CD84

	thumb_func_start sub_0811CDCC
sub_0811CDCC: @ 0x0811CDCC
	push {r4, lr}
	ldr r4, _0811CDE0
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811CDE4
	cmp r0, #1
	beq _0811CDFA
	movs r0, #1
	b _0811CE02
	.align 2, 0
_0811CDE0: .4byte 0x02039DE8
_0811CDE4:
	bl sub_0811E7C0
	movs r0, #0
	bl sub_0811D9D8
	bl sub_0811DBA8
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811CDFA:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0811CE02:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811CDCC

	thumb_func_start sub_0811CE08
sub_0811CE08: @ 0x0811CE08
	push {lr}
	ldr r0, _0811CE20
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #4
	bhi _0811CEC2
	lsls r0, r0, #2
	ldr r1, _0811CE24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811CE20: .4byte 0x02039DE8
_0811CE24: .4byte 0x0811CE28
_0811CE28: @ jump table
	.4byte _0811CE3C @ case 0
	.4byte _0811CE58 @ case 1
	.4byte _0811CE6A @ case 2
	.4byte _0811CE80 @ case 3
	.4byte _0811CEA0 @ case 4
_0811CE3C:
	bl sub_0811E7A0
	movs r0, #0
	bl HideBg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_0811E670
	bl sub_0811DEDC
	b _0811CE8E
_0811CE58:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811CECC
	movs r0, #0
	bl sub_0811E1E0
	b _0811CE8E
_0811CE6A:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811CECC
	bl sub_0811E2B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811CECC
	b _0811CE8E
_0811CE80:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811CECC
	bl sub_0811EAF8
_0811CE8E:
	ldr r0, _0811CE9C
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811CECC
	.align 2, 0
_0811CE9C: .4byte 0x02039DE8
_0811CEA0:
	bl sub_0811EB64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811CECC
	bl sub_0811E7D8
	movs r0, #0
	bl sub_0811EE2C
	bl sub_0811ED98
	ldr r0, _0811CEC8
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811CEC2:
	movs r0, #0
	b _0811CECE
	.align 2, 0
_0811CEC8: .4byte 0x02039DE8
_0811CECC:
	movs r0, #1
_0811CECE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811CE08

	thumb_func_start sub_0811CED4
sub_0811CED4: @ 0x0811CED4
	push {lr}
	ldr r0, _0811CEEC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #4
	bhi _0811CF6C
	lsls r0, r0, #2
	ldr r1, _0811CEF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811CEEC: .4byte 0x02039DE8
_0811CEF0: .4byte 0x0811CEF4
_0811CEF4: @ jump table
	.4byte _0811CF08 @ case 0
	.4byte _0811CF16 @ case 1
	.4byte _0811CF32 @ case 2
	.4byte _0811CF44 @ case 3
	.4byte _0811CF68 @ case 4
_0811CF08:
	bl sub_0811E814
	bl sub_0811EBF8
	bl sub_0811EDFC
	b _0811CF58
_0811CF16:
	bl sub_0811EC1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0811CF6C
	movs r0, #1
	bl sub_0811E1E0
	ldr r0, _0811CF40
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811CF32:
	bl sub_0811E2B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811CF6C
	b _0811CF58
	.align 2, 0
_0811CF40: .4byte 0x02039DE8
_0811CF44:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811CF6C
	bl sub_0811E7C0
	movs r0, #0
	bl ShowBg
_0811CF58:
	ldr r0, _0811CF64
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811CF6C
	.align 2, 0
_0811CF64: .4byte 0x02039DE8
_0811CF68:
	movs r0, #0
	b _0811CF6E
_0811CF6C:
	movs r0, #1
_0811CF6E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811CED4

	thumb_func_start sub_0811CF74
sub_0811CF74: @ 0x0811CF74
	push {lr}
	ldr r0, _0811CF8C
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #4
	bhi _0811D02C
	lsls r0, r0, #2
	ldr r1, _0811CF90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811CF8C: .4byte 0x02039DE8
_0811CF90: .4byte 0x0811CF94
_0811CF94: @ jump table
	.4byte _0811CFA8 @ case 0
	.4byte _0811CFBC @ case 1
	.4byte _0811CFD6 @ case 2
	.4byte _0811CFFC @ case 3
	.4byte _0811D022 @ case 4
_0811CFA8:
	bl sub_0811E814
	bl sub_0811EDFC
	bl sub_0811ECA8
	movs r0, #5
	bl sub_0811E1E0
	b _0811CFEA
_0811CFBC:
	bl sub_0811E2B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D02C
	bl sub_0811ED04
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D02C
	bl sub_0811DEDC
	b _0811CFEA
_0811CFD6:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D02C
	movs r0, #6
	bl sub_0811E1E0
	bl sub_0811ECC4
_0811CFEA:
	ldr r0, _0811CFF8
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D02C
	.align 2, 0
_0811CFF8: .4byte 0x02039DE8
_0811CFFC:
	bl sub_0811E2B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D02C
	bl sub_0811ED04
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D02C
	bl sub_0811ED98
	bl sub_0811E7D8
	ldr r0, _0811D028
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D022:
	movs r0, #0
	b _0811D02E
	.align 2, 0
_0811D028: .4byte 0x02039DE8
_0811D02C:
	movs r0, #1
_0811D02E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811CF74

	thumb_func_start sub_0811D034
sub_0811D034: @ 0x0811D034
	push {lr}
	bl sub_0811E838
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end sub_0811D034

	thumb_func_start sub_0811D040
sub_0811D040: @ 0x0811D040
	push {r4, lr}
	ldr r4, _0811D054
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811D058
	cmp r0, #1
	beq _0811D068
	b _0811D07E
	.align 2, 0
_0811D054: .4byte 0x02039DE8
_0811D058:
	movs r0, #1
	movs r1, #4
	bl sub_0811E5C0
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D068:
	bl sub_0811E624
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D07E
	bl sub_0811E838
	bl sub_0811ED98
	movs r0, #0
	b _0811D080
_0811D07E:
	movs r0, #1
_0811D080:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D040

	thumb_func_start sub_0811D088
sub_0811D088: @ 0x0811D088
	push {r4, lr}
	ldr r4, _0811D0A0
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #1
	beq _0811D0BC
	cmp r0, #1
	bgt _0811D0A4
	cmp r0, #0
	beq _0811D0AA
	b _0811D0DC
	.align 2, 0
_0811D0A0: .4byte 0x02039DE8
_0811D0A4:
	cmp r0, #2
	beq _0811D0D4
	b _0811D0DC
_0811D0AA:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #4
	bl sub_0811E5C0
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D0BC:
	bl sub_0811E624
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D0DC
	bl sub_0811ED98
	ldr r0, _0811D0D8
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D0D4:
	movs r0, #0
	b _0811D0DE
	.align 2, 0
_0811D0D8: .4byte 0x02039DE8
_0811D0DC:
	movs r0, #1
_0811D0DE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811D088

	thumb_func_start sub_0811D0E4
sub_0811D0E4: @ 0x0811D0E4
	push {lr}
	ldr r0, _0811D0FC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #5
	bhi _0811D19C
	lsls r0, r0, #2
	ldr r1, _0811D100
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811D0FC: .4byte 0x02039DE8
_0811D100: .4byte 0x0811D104
_0811D104: @ jump table
	.4byte _0811D11C @ case 0
	.4byte _0811D12A @ case 1
	.4byte _0811D13A @ case 2
	.4byte _0811D14C @ case 3
	.4byte _0811D16C @ case 4
	.4byte _0811D192 @ case 5
_0811D11C:
	bl sub_0811E814
	bl sub_0811EBF8
	bl sub_0811EDFC
	b _0811D15C
_0811D12A:
	bl sub_0811EC1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D19C
	bl sub_0811E1C8
	b _0811D15C
_0811D13A:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D19C
	movs r0, #2
	bl sub_0811E1E0
	b _0811D15C
_0811D14C:
	bl sub_0811E2B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D19C
	movs r0, #2
	bl sub_0811DEA0
_0811D15C:
	ldr r0, _0811D168
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D19C
	.align 2, 0
_0811D168: .4byte 0x02039DE8
_0811D16C:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D19C
	bl sub_0811E9D0
	movs r0, #1
	bl sub_0811EE2C
	bl sub_0811ED98
	bl sub_0811EEE0
	ldr r0, _0811D198
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D192:
	movs r0, #0
	b _0811D19E
	.align 2, 0
_0811D198: .4byte 0x02039DE8
_0811D19C:
	movs r0, #1
_0811D19E:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D0E4

	thumb_func_start sub_0811D1A4
sub_0811D1A4: @ 0x0811D1A4
	push {lr}
	ldr r0, _0811D1BC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #5
	bhi _0811D248
	lsls r0, r0, #2
	ldr r1, _0811D1C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811D1BC: .4byte 0x02039DE8
_0811D1C0: .4byte 0x0811D1C4
_0811D1C4: @ jump table
	.4byte _0811D1DC @ case 0
	.4byte _0811D1E2 @ case 1
	.4byte _0811D1F4 @ case 2
	.4byte _0811D206 @ case 3
	.4byte _0811D228 @ case 4
	.4byte _0811D240 @ case 5
_0811D1DC:
	bl sub_0811DBA8
	b _0811D216
_0811D1E2:
	bl sub_0811EACC
	bl sub_0811EDFC
	bl sub_0811EF44
	bl sub_0811E1C8
	b _0811D216
_0811D1F4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D248
	movs r0, #3
	bl sub_0811E1E0
	b _0811D216
_0811D206:
	bl sub_0811E2B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D248
	movs r0, #0
	bl ShowBg
_0811D216:
	ldr r0, _0811D224
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D248
	.align 2, 0
_0811D224: .4byte 0x02039DE8
_0811D228:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D248
	bl sub_0811E7C0
	ldr r0, _0811D244
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D240:
	movs r0, #0
	b _0811D24A
	.align 2, 0
_0811D244: .4byte 0x02039DE8
_0811D248:
	movs r0, #1
_0811D24A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D1A4

	thumb_func_start sub_0811D250
sub_0811D250: @ 0x0811D250
	push {lr}
	ldr r0, _0811D268
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #6
	bhi _0811D308
	lsls r0, r0, #2
	ldr r1, _0811D26C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811D268: .4byte 0x02039DE8
_0811D26C: .4byte 0x0811D270
_0811D270: @ jump table
	.4byte _0811D28C @ case 0
	.4byte _0811D292 @ case 1
	.4byte _0811D2A4 @ case 2
	.4byte _0811D2B6 @ case 3
	.4byte _0811D2C8 @ case 4
	.4byte _0811D2E8 @ case 5
	.4byte _0811D300 @ case 6
_0811D28C:
	bl sub_0811DBA8
	b _0811D2D8
_0811D292:
	bl sub_0811EACC
	bl sub_0811EDFC
	bl sub_0811EF44
	bl sub_0811E1C8
	b _0811D2D8
_0811D2A4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D308
	movs r0, #3
	bl sub_0811E1E0
	b _0811D2D8
_0811D2B6:
	bl sub_0811E2B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D308
	movs r0, #3
	bl sub_0811D9D8
	b _0811D2D8
_0811D2C8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D308
	movs r0, #0
	bl ShowBg
_0811D2D8:
	ldr r0, _0811D2E4
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D308
	.align 2, 0
_0811D2E4: .4byte 0x02039DE8
_0811D2E8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D308
	bl sub_0811E7C0
	ldr r0, _0811D304
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D300:
	movs r0, #0
	b _0811D30A
	.align 2, 0
_0811D304: .4byte 0x02039DE8
_0811D308:
	movs r0, #1
_0811D30A:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D250

	thumb_func_start sub_0811D310
sub_0811D310: @ 0x0811D310
	push {lr}
	ldr r0, _0811D328
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #4
	bhi _0811D3C4
	lsls r0, r0, #2
	ldr r1, _0811D32C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811D328: .4byte 0x02039DE8
_0811D32C: .4byte 0x0811D330
_0811D330: @ jump table
	.4byte _0811D344 @ case 0
	.4byte _0811D356 @ case 1
	.4byte _0811D368 @ case 2
	.4byte _0811D378 @ case 3
	.4byte _0811D398 @ case 4
_0811D344:
	bl sub_0811EACC
	bl sub_0811EDFC
	bl sub_0811EF44
	bl sub_0811E1C8
	b _0811D386
_0811D356:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D3C4
	movs r0, #4
	bl sub_0811E1E0
	b _0811D386
_0811D368:
	bl sub_0811E2B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D3C4
	bl sub_0811DEDC
	b _0811D386
_0811D378:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D3C4
	bl sub_0811EAF8
_0811D386:
	ldr r0, _0811D394
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D3C4
	.align 2, 0
_0811D394: .4byte 0x02039DE8
_0811D398:
	bl sub_0811EB64
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D3C4
	bl sub_0811E7D8
	movs r0, #0
	bl sub_0811EE2C
	bl sub_0811ED98
	ldr r0, _0811D3C0
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	b _0811D3C6
	.align 2, 0
_0811D3C0: .4byte 0x02039DE8
_0811D3C4:
	movs r0, #1
_0811D3C6:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D310

	thumb_func_start sub_0811D3CC
sub_0811D3CC: @ 0x0811D3CC
	push {lr}
	bl sub_0811EA54
	movs r0, #0
	pop {r1}
	bx r1
	thumb_func_end sub_0811D3CC

	thumb_func_start sub_0811D3D8
sub_0811D3D8: @ 0x0811D3D8
	push {r4, lr}
	ldr r4, _0811D3F0
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #1
	beq _0811D404
	cmp r0, #1
	bgt _0811D3F4
	cmp r0, #0
	beq _0811D3FE
	b _0811D442
	.align 2, 0
_0811D3F0: .4byte 0x02039DE8
_0811D3F4:
	cmp r0, #2
	beq _0811D420
	cmp r0, #3
	beq _0811D43E
	b _0811D442
_0811D3FE:
	bl sub_0811DFBC
	b _0811D416
_0811D404:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D442
	movs r0, #1
	movs r1, #4
	bl sub_0811E5C0
_0811D416:
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D442
_0811D420:
	bl sub_0811E624
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D442
	bl sub_0811EA54
	bl sub_0811ED98
	bl sub_0811EEE0
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D43E:
	movs r0, #0
	b _0811D444
_0811D442:
	movs r0, #1
_0811D444:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D3D8

	thumb_func_start sub_0811D44C
sub_0811D44C: @ 0x0811D44C
	push {r4, lr}
	ldr r4, _0811D464
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #1
	beq _0811D478
	cmp r0, #1
	bgt _0811D468
	cmp r0, #0
	beq _0811D472
	b _0811D4B4
	.align 2, 0
_0811D464: .4byte 0x02039DE8
_0811D468:
	cmp r0, #2
	beq _0811D496
	cmp r0, #3
	beq _0811D4B0
	b _0811D4B4
_0811D472:
	bl sub_0811DFE0
	b _0811D48C
_0811D478:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D4B4
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #4
	bl sub_0811E5C0
_0811D48C:
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D4B4
_0811D496:
	bl sub_0811E624
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D4B4
	bl sub_0811ED98
	bl sub_0811EEE0
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D4B0:
	movs r0, #0
	b _0811D4B6
_0811D4B4:
	movs r0, #1
_0811D4B6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811D44C

	thumb_func_start sub_0811D4BC
sub_0811D4BC: @ 0x0811D4BC
	push {r4, r5, lr}
	ldr r5, _0811D4D4
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r0, #1
	beq _0811D4E8
	cmp r0, #1
	bgt _0811D4D8
	cmp r0, #0
	beq _0811D4E2
	b _0811D53A
	.align 2, 0
_0811D4D4: .4byte 0x02039DE8
_0811D4D8:
	cmp r0, #2
	beq _0811D518
	cmp r0, #3
	beq _0811D536
	b _0811D53A
_0811D4E2:
	bl sub_0811E004
	b _0811D50E
_0811D4E8:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D53A
	bl sub_0811C3E0
	adds r4, r0, #0
	bl sub_0811E65C
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #8
	bl sub_0811E5C0
_0811D50E:
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D53A
_0811D518:
	bl sub_0811E624
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D53A
	bl sub_0811EA54
	bl sub_0811ED98
	bl sub_0811EEE0
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D536:
	movs r0, #0
	b _0811D53C
_0811D53A:
	movs r0, #1
_0811D53C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D4BC

	thumb_func_start sub_0811D544
sub_0811D544: @ 0x0811D544
	push {r4, r5, lr}
	ldr r5, _0811D55C
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r0, #1
	beq _0811D570
	cmp r0, #1
	bgt _0811D560
	cmp r0, #0
	beq _0811D56A
	b _0811D5BE
	.align 2, 0
_0811D55C: .4byte 0x02039DE8
_0811D560:
	cmp r0, #2
	beq _0811D5A0
	cmp r0, #3
	beq _0811D5BA
	b _0811D5BE
_0811D56A:
	bl sub_0811E048
	b _0811D596
_0811D570:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D5BE
	bl sub_0811C3E0
	adds r4, r0, #0
	bl sub_0811E65C
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #8
	bl sub_0811E5C0
_0811D596:
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D5BE
_0811D5A0:
	bl sub_0811E624
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811D5BE
	bl sub_0811ED98
	bl sub_0811EEE0
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0811D5BA:
	movs r0, #0
	b _0811D5C0
_0811D5BE:
	movs r0, #1
_0811D5C0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D544

	thumb_func_start sub_0811D5C8
sub_0811D5C8: @ 0x0811D5C8
	push {r4, lr}
	ldr r4, _0811D5DC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811D5E0
	cmp r0, #1
	beq _0811D5F4
	b _0811D5FE
	.align 2, 0
_0811D5DC: .4byte 0x02039DE8
_0811D5E0:
	bl sub_0811E7A0
	movs r0, #4
	bl sub_0811D9D8
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D5FE
_0811D5F4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811D600
_0811D5FE:
	movs r0, #1
_0811D600:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D5C8

	thumb_func_start sub_0811D608
sub_0811D608: @ 0x0811D608
	push {r4, lr}
	ldr r4, _0811D61C
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811D620
	cmp r0, #1
	beq _0811D634
	b _0811D63E
	.align 2, 0
_0811D61C: .4byte 0x02039DE8
_0811D620:
	bl sub_0811E7A0
	movs r0, #5
	bl sub_0811D9D8
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D63E
_0811D634:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811D640
_0811D63E:
	movs r0, #1
_0811D640:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D608

	thumb_func_start sub_0811D648
sub_0811D648: @ 0x0811D648
	push {r4, lr}
	ldr r4, _0811D65C
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811D660
	cmp r0, #1
	beq _0811D674
	b _0811D67E
	.align 2, 0
_0811D65C: .4byte 0x02039DE8
_0811D660:
	bl sub_0811E7A0
	movs r0, #6
	bl sub_0811D9D8
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D67E
_0811D674:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811D680
_0811D67E:
	movs r0, #1
_0811D680:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D648

	thumb_func_start sub_0811D688
sub_0811D688: @ 0x0811D688
	push {r4, lr}
	ldr r4, _0811D69C
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811D6A0
	cmp r0, #1
	beq _0811D6B4
	b _0811D6BE
	.align 2, 0
_0811D69C: .4byte 0x02039DE8
_0811D6A0:
	bl sub_0811E7A0
	movs r0, #7
	bl sub_0811D9D8
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D6BE
_0811D6B4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811D6C0
_0811D6BE:
	movs r0, #1
_0811D6C0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D688

	thumb_func_start sub_0811D6C8
sub_0811D6C8: @ 0x0811D6C8
	push {r4, lr}
	ldr r4, _0811D6DC
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811D6E0
	cmp r0, #1
	beq _0811D6F4
	b _0811D6FE
	.align 2, 0
_0811D6DC: .4byte 0x02039DE8
_0811D6E0:
	bl sub_0811E7A0
	movs r0, #8
	bl sub_0811D9D8
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D6FE
_0811D6F4:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811D700
_0811D6FE:
	movs r0, #1
_0811D700:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D6C8

	thumb_func_start sub_0811D708
sub_0811D708: @ 0x0811D708
	push {r4, lr}
	ldr r4, _0811D71C
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0811D720
	cmp r0, #1
	beq _0811D734
	b _0811D73E
	.align 2, 0
_0811D71C: .4byte 0x02039DE8
_0811D720:
	bl sub_0811E7A0
	movs r0, #9
	bl sub_0811D9D8
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0811D73E
_0811D734:
	bl IsDma3ManagerBusyWithBgCopy
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811D740
_0811D73E:
	movs r0, #1
_0811D740:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811D708

	thumb_func_start sub_0811D748
sub_0811D748: @ 0x0811D748
	push {r4, lr}
	ldr r4, _0811D7A4
	ldr r0, _0811D7A8
	bl Alloc
	adds r2, r0, #0
	str r2, [r4]
	cmp r2, #0
	beq _0811D7AC
	movs r1, #0
	strh r1, [r2]
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r0, r2, r3
	str r1, [r0]
	adds r3, #4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, #4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, #4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, #4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, #4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, #4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, #4
	adds r0, r2, r3
	str r1, [r0]
	adds r3, #4
	adds r0, r2, r3
	str r1, [r0]
	bl FooterHasFourOptions_
	ldr r1, [r4]
	strb r0, [r1, #0xa]
	movs r0, #1
	b _0811D7AE
	.align 2, 0
_0811D7A4: .4byte 0x02039DE8
_0811D7A8: .4byte 0x000012FC
_0811D7AC:
	movs r0, #0
_0811D7AE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811D748

	thumb_func_start sub_0811D7B4
sub_0811D7B4: @ 0x0811D7B4
	push {lr}
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgX
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl ChangeBgY
	movs r1, #0xc1
	lsls r1, r1, #6
	movs r0, #0
	bl SetGpuReg
	pop {r0}
	bx r0
	thumb_func_end sub_0811D7B4

	thumb_func_start sub_0811D814
sub_0811D814: @ 0x0811D814
	push {r4, lr}
	bl ResetPaletteFade
	ldr r0, _0811D868
	movs r1, #0
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0811D86C
	movs r1, #0x10
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0811D870
	movs r1, #0x40
	movs r2, #0x20
	bl LoadPalette
	ldr r0, _0811D874
	movs r1, #0xa0
	movs r2, #8
	bl LoadPalette
	ldr r4, _0811D878
	adds r0, r4, #0
	movs r1, #0xb0
	movs r2, #0xc
	bl LoadPalette
	adds r0, r4, #0
	movs r1, #0xf0
	movs r2, #0xc
	bl LoadPalette
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #0xc
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D868: .4byte 0x08573E64
_0811D86C: .4byte 0x0857423C
_0811D870: .4byte 0x0857425C
_0811D874: .4byte 0x08574344
_0811D878: .4byte 0x0857434C
	thumb_func_end sub_0811D814

	thumb_func_start sub_0811D87C
sub_0811D87C: @ 0x0811D87C
	push {r4, r5, lr}
	sub sp, #0x14
	bl GetTitleText
	adds r5, r0, #0
	cmp r5, #0
	beq _0811D8D8
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0x10
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	lsls r4, r4, #0x13
	lsrs r4, r4, #0x10
	movs r0, #0
	movs r1, #0
	bl FillWindowPixelBuffer
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #3
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #1
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0811D920
	movs r0, #0
	bl PutWindowTilemap
	movs r0, #0
	movs r1, #3
	bl CopyWindowToVram
_0811D8D8:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0811D87C

	thumb_func_start sub_0811D8E0
sub_0811D8E0: @ 0x0811D8E0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r2, #0
	ldr r2, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r1, #1
	bne _0811D908
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0811D908:
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [sp, #0x24]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r6, #0
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end sub_0811D8E0

	thumb_func_start sub_0811D920
sub_0811D920: @ 0x0811D920
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov sb, r2
	ldr r2, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	mov r8, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r1, #1
	bne _0811D966
	adds r0, r3, #2
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0811D966:
	add r0, sp, #0xc
	strb r5, [r0]
	strb r6, [r0, #1]
	strb r2, [r0, #2]
	str r0, [sp]
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	mov r0, ip
	adds r2, r7, #0
	bl AddTextPrinterParameterized3
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	thumb_func_end sub_0811D920

	thumb_func_start sub_0811D990
sub_0811D990: @ 0x0811D990
	push {lr}
	sub sp, #0xc
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	movs r0, #1
	movs r1, #1
	movs r2, #0xe0
	bl LoadUserWindowBorderGfx
	movs r0, #1
	movs r1, #1
	movs r2, #0xe
	bl DrawTextBorderOuter
	movs r0, #0
	bl sub_0811D9D8
	movs r0, #1
	bl PutWindowTilemap
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	add sp, #0xc
	pop {r0}
	bx r0
	thumb_func_end sub_0811D990

	thumb_func_start sub_0811D9D8
sub_0811D9D8: @ 0x0811D9D8
	push {lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	cmp r1, #9
	bhi _0811DA90
	lsls r0, r1, #2
	ldr r1, _0811D9F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811D9F4: .4byte 0x0811D9F8
_0811D9F8: @ jump table
	.4byte _0811DA20 @ case 0
	.4byte _0811DA3E @ case 1
	.4byte _0811DA2A @ case 2
	.4byte _0811DA34 @ case 3
	.4byte _0811DA48 @ case 4
	.4byte _0811DA54 @ case 5
	.4byte _0811DA60 @ case 6
	.4byte _0811DA70 @ case 7
	.4byte _0811DA7C @ case 8
	.4byte _0811DA88 @ case 9
_0811DA20:
	add r1, sp, #0x10
	add r0, sp, #0xc
	bl GetEasyChatInstructionsText
	b _0811DA90
_0811DA2A:
	add r1, sp, #0x10
	add r0, sp, #0xc
	bl sub_0811C344
	b _0811DA90
_0811DA34:
	add r1, sp, #0x10
	add r0, sp, #0xc
	bl GetEasyChatConfirmText
	b _0811DA90
_0811DA3E:
	add r1, sp, #0x10
	add r0, sp, #0xc
	bl GetEasyChatConfirmDeletionText
	b _0811DA90
_0811DA48:
	ldr r0, _0811DA50
	str r0, [sp, #0xc]
	b _0811DA90
	.align 2, 0
_0811DA50: .4byte 0x085CBCD0
_0811DA54:
	ldr r0, _0811DA5C
	str r0, [sp, #0xc]
	b _0811DA90
	.align 2, 0
_0811DA5C: .4byte 0x085CBCE0
_0811DA60:
	ldr r0, _0811DA68
	str r0, [sp, #0xc]
	ldr r0, _0811DA6C
	b _0811DA8E
	.align 2, 0
_0811DA68: .4byte 0x085CBB1B
_0811DA6C: .4byte 0x085CBB2F
_0811DA70:
	ldr r0, _0811DA78
	str r0, [sp, #0xc]
	b _0811DA90
	.align 2, 0
_0811DA78: .4byte 0x085CBCEF
_0811DA7C:
	ldr r0, _0811DA84
	str r0, [sp, #0xc]
	b _0811DA90
	.align 2, 0
_0811DA84: .4byte 0x085CBB4E
_0811DA88:
	ldr r0, _0811DADC
	str r0, [sp, #0xc]
	ldr r0, _0811DAE0
_0811DA8E:
	str r0, [sp, #0x10]
_0811DA90:
	movs r0, #1
	movs r1, #0x11
	bl FillWindowPixelBuffer
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _0811DAB2
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl sub_0811D8E0
_0811DAB2:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	beq _0811DACE
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #1
	movs r3, #0
	bl sub_0811D8E0
_0811DACE:
	movs r0, #1
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_0811DADC: .4byte 0x085CBC62
_0811DAE0: .4byte 0x085CBC6D
	thumb_func_end sub_0811D9D8

	thumb_func_start sub_0811DAE4
sub_0811DAE4: @ 0x0811DAE4
	push {lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0811DB0C
	movs r1, #1
	str r1, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_08198C08
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0811DB0C: .4byte 0x085743AC
	thumb_func_end sub_0811DAE4

	thumb_func_start sub_0811DB10
sub_0811DB10: @ 0x0811DB10
	push {r4, r5, r6, lr}
	sub sp, #8
	bl GetEasyChatScreenFrameId
	lsls r0, r0, #0x18
	ldr r6, _0811DB8C
	ldr r4, [sp]
	ands r4, r6
	movs r1, #3
	orrs r4, r1
	str r4, [sp]
	ldr r1, _0811DB90
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r3, [r0]
	lsls r1, r3, #0x1b
	lsrs r1, r1, #0x13
	ldr r5, _0811DB94
	adds r2, r5, #0
	ands r2, r4
	orrs r2, r1
	lsrs r3, r3, #5
	lsls r3, r3, #0x10
	ldr r1, _0811DB98
	ands r2, r1
	orrs r2, r3
	str r2, [sp]
	ldrb r3, [r0, #1]
	lsls r3, r3, #0x18
	ldr r1, _0811DB9C
	ands r1, r2
	orrs r1, r3
	str r1, [sp]
	ldrb r1, [r0, #2]
	ldr r0, [sp, #4]
	ands r0, r6
	orrs r0, r1
	ands r0, r5
	movs r1, #0xb0
	lsls r1, r1, #4
	orrs r0, r1
	ldr r1, _0811DBA0
	ands r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	bl AddWindow
	ldr r1, _0811DBA4
	ldr r1, [r1]
	strh r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl PutWindowTilemap
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811DB8C: .4byte 0xFFFFFF00
_0811DB90: .4byte 0x08574358
_0811DB94: .4byte 0xFFFF00FF
_0811DB98: .4byte 0xFF00FFFF
_0811DB9C: .4byte 0x00FFFFFF
_0811DBA0: .4byte 0x0000FFFF
_0811DBA4: .4byte 0x02039DE8
	thumb_func_end sub_0811DB10

	thumb_func_start sub_0811DBA8
sub_0811DBA8: @ 0x0811DBA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl GetEasyChatWordBuffer
	adds r6, r0, #0
	bl GetNumColumns
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	bl GetNumRows
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r4, _0811DBE0
	ldr r0, [r4]
	ldrb r0, [r0, #2]
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r5, #0
	b _0811DC86
	.align 2, 0
_0811DBE0: .4byte 0x02039DE8
_0811DBE4:
	ldr r1, _0811DC20
	ldr r0, [r1]
	adds r0, #0xb
	movs r1, #0
	movs r2, #0xc0
	bl StringFill
	ldr r1, _0811DC20
	ldr r0, [r1]
	adds r2, r0, #0
	adds r2, #0xd
	movs r4, #0
	lsls r7, r5, #0x1c
	adds r5, #1
	mov sb, r5
	cmp r4, r8
	bge _0811DC64
	ldr r0, _0811DC24
	mov sl, r0
_0811DC0A:
	ldrh r0, [r6]
	cmp r0, sl
	beq _0811DC28
	adds r1, r0, #0
	adds r0, r2, #0
	bl CopyEasyChatWord
	adds r2, r0, #0
	adds r5, r6, #2
	adds r4, #1
	b _0811DC58
	.align 2, 0
_0811DC20: .4byte 0x02039DE8
_0811DC24: .4byte 0x0000FFFF
_0811DC28:
	adds r0, r2, #0
	movs r1, #0
	movs r2, #4
	bl WriteColorChangeControlCode
	adds r2, r0, #0
	adds r5, r6, #2
	adds r4, #1
	movs r3, #0xf9
	movs r1, #9
	movs r0, #4
_0811DC3E:
	strb r3, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r2, #1
	subs r0, #1
	cmp r0, #0
	bge _0811DC3E
	adds r0, r2, #0
	movs r1, #0
	movs r2, #2
	bl WriteColorChangeControlCode
	adds r2, r0, #0
_0811DC58:
	movs r0, #0
	strb r0, [r2]
	adds r2, #2
	adds r6, r5, #0
	cmp r4, r8
	blt _0811DC0A
_0811DC64:
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _0811DCA8
	ldr r2, [r1]
	ldrb r0, [r2, #2]
	adds r2, #0xb
	lsrs r1, r7, #0x18
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	movs r3, #0
	bl sub_0811D8E0
	mov r5, sb
_0811DC86:
	ldr r0, [sp, #0xc]
	cmp r5, r0
	blt _0811DBE4
	ldr r0, _0811DCA8
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	movs r1, #3
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811DCA8: .4byte 0x02039DE8
	thumb_func_end sub_0811DBA8

	thumb_func_start sub_0811DCAC
sub_0811DCAC: @ 0x0811DCAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl GetEasyChatScreenFrameId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r0, #0
	str r0, [sp]
	ldr r2, _0811DDEC
	mov r0, sp
	mov r1, r8
	bl CpuFastSet
	ldr r0, _0811DDF0
	mov r1, sb
	lsls r3, r1, #2
	adds r3, r3, r0
	ldrb r0, [r3]
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x1d
	subs r6, r1, #1
	lsls r0, r0, #0x1b
	lsrs r4, r0, #0x1b
	subs r5, r4, #1
	adds r0, r4, #0
	ldrb r1, [r3, #1]
	adds r7, r0, r1
	lsrs r2, r2, #0x1d
	ldrb r3, [r3, #2]
	adds r3, r2, r3
	lsls r0, r6, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, r8
	ldr r2, _0811DDF4
	adds r1, r2, #0
	strh r1, [r0]
	adds r5, r4, #0
	cmp r5, r7
	bge _0811DD22
	ldr r4, _0811DDF8
	adds r2, r4, #0
	lsls r1, r5, #1
	lsls r0, r6, #6
	add r0, r8
	adds r1, r1, r0
	subs r5, r7, r5
_0811DD16:
	strh r2, [r1]
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bne _0811DD16
	adds r5, r7, #0
_0811DD22:
	lsls r0, r6, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, r8
	ldr r2, _0811DDFC
	adds r1, r2, #0
	strh r1, [r0]
	adds r6, #1
	ldr r4, _0811DDF0
	mov sl, r4
	mov r0, sb
	lsls r0, r0, #2
	mov sb, r0
	cmp r6, r3
	bge _0811DD94
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	mov ip, r0
_0811DD48:
	mov r1, ip
	lsrs r0, r1, #0x1b
	subs r5, r0, #1
	lsls r1, r6, #5
	adds r1, r1, r5
	lsls r1, r1, #1
	add r1, r8
	ldr r4, _0811DE00
	adds r2, r4, #0
	strh r2, [r1]
	adds r5, r0, #0
	adds r4, r6, #1
	cmp r5, r7
	bge _0811DD80
	movs r0, #0x80
	lsls r0, r0, #5
	adds r2, r0, #0
	lsls r1, r5, #1
	lsls r0, r6, #6
	add r0, r8
	adds r1, r1, r0
	subs r5, r7, r5
_0811DD74:
	strh r2, [r1]
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bne _0811DD74
	adds r5, r7, #0
_0811DD80:
	lsls r0, r6, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, r8
	ldr r2, _0811DE04
	adds r1, r2, #0
	strh r1, [r0]
	adds r6, r4, #0
	cmp r6, r3
	blt _0811DD48
_0811DD94:
	mov r0, sb
	add r0, sl
	ldrb r2, [r0]
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x1b
	subs r5, r2, #1
	lsls r3, r6, #5
	adds r0, r3, r5
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _0811DE08
	adds r1, r4, #0
	strh r1, [r0]
	adds r5, r2, #0
	cmp r5, r7
	bge _0811DDCE
	ldr r0, _0811DE0C
	adds r2, r0, #0
	lsls r1, r5, #1
	lsls r0, r6, #6
	add r0, r8
	adds r0, r1, r0
	subs r5, r7, r5
_0811DDC2:
	strh r2, [r0]
	adds r0, #2
	subs r5, #1
	cmp r5, #0
	bne _0811DDC2
	adds r5, r7, #0
_0811DDCE:
	adds r0, r3, r5
	lsls r0, r0, #1
	add r0, r8
	ldr r2, _0811DE10
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811DDEC: .4byte 0x01000200
_0811DDF0: .4byte 0x08574358
_0811DDF4: .4byte 0x00001001
_0811DDF8: .4byte 0x00001002
_0811DDFC: .4byte 0x00001003
_0811DE00: .4byte 0x00001005
_0811DE04: .4byte 0x00001007
_0811DE08: .4byte 0x00001009
_0811DE0C: .4byte 0x0000100A
_0811DE10: .4byte 0x0000100B
	thumb_func_end sub_0811DCAC

	thumb_func_start sub_0811DE14
sub_0811DE14: @ 0x0811DE14
	push {r4, lr}
	sub sp, #8
	movs r0, #3
	bl GetBgTilemapBuffer
	adds r4, r0, #0
	bl GetEasyChatScreenFrameId
	lsls r0, r0, #0x18
	ldr r1, _0811DE3C
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r1, [r0, #3]
	cmp r1, #2
	beq _0811DE46
	cmp r1, #2
	bgt _0811DE40
	cmp r1, #1
	beq _0811DE54
	b _0811DE84
	.align 2, 0
_0811DE3C: .4byte 0x08574358
_0811DE40:
	cmp r1, #3
	beq _0811DE70
	b _0811DE84
_0811DE46:
	movs r0, #0xa8
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r0, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	b _0811DE62
_0811DE54:
	movs r0, #0xc0
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
_0811DE62:
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0xa
	bl CopyToBgTilemapBufferRect
	b _0811DE84
_0811DE70:
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0
	movs r3, #9
	bl CopyToBgTilemapBufferRect
_0811DE84:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0811DE14

	thumb_func_start sub_0811DE8C
sub_0811DE8C: @ 0x0811DE8C
	push {lr}
	movs r0, #2
	bl PutWindowTilemap
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811DE8C

	thumb_func_start sub_0811DEA0
sub_0811DEA0: @ 0x0811DEA0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0811E598
	movs r0, #2
	movs r1, #0x11
	bl FillWindowPixelBuffer
	cmp r4, #1
	beq _0811DEC4
	cmp r4, #1
	blo _0811DEBE
	cmp r4, #2
	beq _0811DECA
	b _0811DECE
_0811DEBE:
	bl sub_0811DEFC
	b _0811DECE
_0811DEC4:
	bl sub_0811DF70
	b _0811DECE
_0811DECA:
	bl sub_0811DFAC
_0811DECE:
	movs r0, #2
	movs r1, #2
	bl CopyWindowToVram
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0811DEA0

	thumb_func_start sub_0811DEDC
sub_0811DEDC: @ 0x0811DEDC
	push {lr}
	bl sub_0811C3B4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811DEF0
	movs r0, #0
	bl sub_0811DEA0
	b _0811DEF6
_0811DEF0:
	movs r0, #1
	bl sub_0811DEA0
_0811DEF6:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811DEDC

	thumb_func_start sub_0811DEFC
sub_0811DEFC: @ 0x0811DEFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r6, #0
	movs r0, #0x60
	mov r8, r0
_0811DF0A:
	movs r5, #0
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	movs r4, #0x80
	lsls r4, r4, #0x14
_0811DF16:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	adds r6, #1
	bl sub_0811F914
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x16
	beq _0811DF54
	bl GetEasyChatWordGroupName
	adds r2, r0, #0
	lsrs r3, r4, #0x18
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	bl sub_0811D8E0
	movs r0, #0xe0
	lsls r0, r0, #0x16
	adds r4, r4, r0
	adds r5, #1
	cmp r5, #2
	ble _0811DF16
	movs r1, #0x10
	add r8, r1
	b _0811DF0A
_0811DF54:
	bl sub_0811C3C0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_0811E5C0
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811DEFC

	thumb_func_start sub_0811DF70
sub_0811DF70: @ 0x0811DF70
	push {r4, r5, r6, lr}
	sub sp, #0xc
	movs r5, #0
	movs r4, #0xc0
	lsls r4, r4, #0x17
	ldr r6, _0811DFA8
_0811DF7C:
	ldm r6!, {r2}
	lsrs r0, r4, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #2
	movs r1, #1
	movs r3, #8
	bl sub_0811D8E0
	movs r0, #0x80
	lsls r0, r0, #0x15
	adds r4, r4, r0
	adds r5, #1
	cmp r5, #3
	bls _0811DF7C
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811DFA8: .4byte 0x085743BC
	thumb_func_end sub_0811DF70

	thumb_func_start sub_0811DFAC
sub_0811DFAC: @ 0x0811DFAC
	push {lr}
	movs r0, #0
	movs r1, #4
	bl sub_0811E07C
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811DFAC

	thumb_func_start sub_0811DFBC
sub_0811DFBC: @ 0x0811DFBC
	push {r4, lr}
	bl sub_0811C3E0
	adds r4, r0, #0
	adds r4, #3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl sub_0811E164
	adds r0, r4, #0
	movs r1, #1
	bl sub_0811E07C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0811DFBC

	thumb_func_start sub_0811DFE0
sub_0811DFE0: @ 0x0811DFE0
	push {r4, lr}
	bl sub_0811C3E0
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #1
	bl sub_0811E164
	adds r0, r4, #0
	movs r1, #1
	bl sub_0811E07C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811DFE0

	thumb_func_start sub_0811E004
sub_0811E004: @ 0x0811E004
	push {r4, r5, lr}
	bl sub_0811C3E0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	adds r0, r5, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_0811C3EC
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bls _0811E026
	adds r4, r0, #0
_0811E026:
	cmp r5, r4
	bhs _0811E040
	subs r4, r4, r5
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0811E164
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0811E07C
_0811E040:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811E004

	thumb_func_start sub_0811E048
sub_0811E048: @ 0x0811E048
	push {r4, r5, lr}
	bl sub_0811C3E0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_0811E65C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bhs _0811E074
	subs r4, r0, r5
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0811E164
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0811E07C
_0811E074:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811E048

	thumb_func_start sub_0811E07C
sub_0811E07C: @ 0x0811E07C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	lsls r1, r0, #1
	adds r7, r1, r0
	lsls r0, r0, #4
	adds r1, r0, #0
	adds r1, #0x60
	movs r0, #0xff
	ands r1, r0
	movs r0, #0
	b _0811E144
_0811E0A4:
	movs r2, #0x10
	adds r2, r2, r1
	mov sl, r2
	adds r0, #1
	str r0, [sp, #0x18]
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x15
	mov r8, r0
	movs r2, #2
	mov sb, r2
_0811E0BC:
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	adds r7, #1
	bl sub_0811FAD0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0811E104
	cmp r4, r0
	beq _0811E12E
	ldr r5, _0811E108
	ldr r0, [r5]
	adds r0, #0xcc
	adds r1, r4, #0
	movs r2, #0
	bl CopyEasyChatWordPadded
	adds r0, r4, #0
	bl sub_0811C820
	adds r1, r0, #0
	cmp r1, #0
	bne _0811E10C
	ldr r2, [r5]
	adds r2, #0xcc
	mov r0, r8
	lsrs r3, r0, #0x18
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #2
	movs r1, #1
	bl sub_0811D8E0
	b _0811E12E
	.align 2, 0
_0811E104: .4byte 0x0000FFFF
_0811E108: .4byte 0x02039DE8
_0811E10C:
	ldr r2, [r5]
	adds r2, #0xcc
	mov r0, r8
	lsrs r3, r0, #0x18
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #3
	str r0, [sp, #0x10]
	movs r0, #2
	movs r1, #1
	bl sub_0811D920
_0811E12E:
	movs r2, #0x90
	lsls r2, r2, #0x17
	add r8, r2
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r2, sb
	cmp r2, #0
	bge _0811E0BC
	mov r1, sl
	ldr r0, [sp, #0x18]
_0811E144:
	ldr r2, [sp, #0x14]
	cmp r0, r2
	blt _0811E0A4
	movs r0, #2
	movs r1, #2
	bl CopyWindowToVram
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811E07C

	thumb_func_start sub_0811E164
sub_0811E164: @ 0x0811E164
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x14
	adds r3, r0, #0
	adds r3, #0x60
	movs r0, #0xff
	ands r3, r0
	lsrs r0, r1, #0x14
	adds r1, r3, r0
	cmp r1, #0xff
	ble _0811E190
	ldr r0, _0811E18C
	adds r4, r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r3
	b _0811E192
	.align 2, 0
_0811E18C: .4byte 0xFFFFFF00
_0811E190:
	movs r4, #0
_0811E192:
	movs r5, #0xe0
	str r5, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0x11
	movs r2, #0
	bl FillWindowPixelRect
	cmp r4, #0
	beq _0811E1BE
	str r5, [sp]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0x11
	movs r2, #0
	movs r3, #0
	bl FillWindowPixelRect
_0811E1BE:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811E164

	thumb_func_start sub_0811E1C8
sub_0811E1C8: @ 0x0811E1C8
	push {lr}
	movs r0, #2
	movs r1, #0x11
	bl FillWindowPixelBuffer
	movs r0, #2
	movs r1, #2
	bl CopyWindowToVram
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811E1C8

	thumb_func_start sub_0811E1E0
sub_0811E1E0: @ 0x0811E1E0
	push {lr}
	ldr r1, _0811E1F4
	cmp r0, #6
	bhi _0811E29A
	lsls r0, r0, #2
	ldr r1, _0811E1F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811E1F4: .4byte 0x02039DE8
_0811E1F8: .4byte 0x0811E1FC
_0811E1FC: @ jump table
	.4byte _0811E218 @ case 0
	.4byte _0811E22C @ case 1
	.4byte _0811E23C @ case 2
	.4byte _0811E250 @ case 3
	.4byte _0811E264 @ case 4
	.4byte _0811E278 @ case 5
	.4byte _0811E28C @ case 6
_0811E218:
	ldr r1, _0811E228
	ldr r2, [r1]
	movs r0, #0
	strb r0, [r2, #6]
	ldr r2, [r1]
	movs r0, #0xa
	b _0811E298
	.align 2, 0
_0811E228: .4byte 0x02039DE8
_0811E22C:
	ldr r1, _0811E238
	ldr r2, [r1]
	movs r3, #0
	movs r0, #9
	b _0811E258
	.align 2, 0
_0811E238: .4byte 0x02039DE8
_0811E23C:
	ldr r1, _0811E24C
	ldr r2, [r1]
	movs r0, #0xb
	strb r0, [r2, #6]
	ldr r2, [r1]
	movs r0, #0x11
	b _0811E298
	.align 2, 0
_0811E24C: .4byte 0x02039DE8
_0811E250:
	ldr r1, _0811E260
	ldr r2, [r1]
	movs r3, #0
	movs r0, #0x11
_0811E258:
	strb r0, [r2, #6]
	ldr r0, [r1]
	strb r3, [r0, #7]
	b _0811E29A
	.align 2, 0
_0811E260: .4byte 0x02039DE8
_0811E264:
	ldr r1, _0811E274
	ldr r2, [r1]
	movs r0, #0x11
	strb r0, [r2, #6]
	ldr r2, [r1]
	movs r0, #0xa
	b _0811E298
	.align 2, 0
_0811E274: .4byte 0x02039DE8
_0811E278:
	ldr r1, _0811E288
	ldr r2, [r1]
	movs r0, #0x12
	strb r0, [r2, #6]
	ldr r2, [r1]
	movs r0, #0x16
	b _0811E298
	.align 2, 0
_0811E288: .4byte 0x02039DE8
_0811E28C:
	ldr r1, _0811E2B4
	ldr r2, [r1]
	movs r0, #0x16
	strb r0, [r2, #6]
	ldr r2, [r1]
	movs r0, #0x12
_0811E298:
	strb r0, [r2, #7]
_0811E29A:
	ldr r1, [r1]
	ldrb r0, [r1, #6]
	movs r3, #1
	rsbs r3, r3, #0
	adds r2, r3, #0
	ldrb r3, [r1, #7]
	cmp r0, r3
	bhs _0811E2AC
	movs r2, #1
_0811E2AC:
	strb r2, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0811E2B4: .4byte 0x02039DE8
	thumb_func_end sub_0811E1E0

	thumb_func_start sub_0811E2B8
sub_0811E2B8: @ 0x0811E2B8
	push {r4, lr}
	ldr r4, _0811E2E4
	ldr r1, [r4]
	ldrb r2, [r1, #6]
	ldrb r0, [r1, #7]
	cmp r2, r0
	beq _0811E2E8
	ldrb r0, [r1, #8]
	adds r0, r2, r0
	strb r0, [r1, #6]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	bl sub_0811E2F0
	ldr r0, [r4]
	ldrb r1, [r0, #6]
	ldrb r0, [r0, #7]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _0811E2EA
	.align 2, 0
_0811E2E4: .4byte 0x02039DE8
_0811E2E8:
	movs r0, #0
_0811E2EA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811E2B8

	thumb_func_start sub_0811E2F0
sub_0811E2F0: @ 0x0811E2F0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0xa
	bl FillBgTilemapBufferRect_Palette0
	cmp r4, #0x16
	bls _0811E312
	b _0811E42E
_0811E312:
	lsls r0, r4, #2
	ldr r1, _0811E31C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811E31C: .4byte 0x0811E320
_0811E320: @ jump table
	.4byte _0811E42E @ case 0
	.4byte _0811E37C @ case 1
	.4byte _0811E384 @ case 2
	.4byte _0811E38C @ case 3
	.4byte _0811E394 @ case 4
	.4byte _0811E39C @ case 5
	.4byte _0811E3A4 @ case 6
	.4byte _0811E414 @ case 7
	.4byte _0811E406 @ case 8
	.4byte _0811E3F8 @ case 9
	.4byte _0811E3EA @ case 10
	.4byte _0811E3B2 @ case 11
	.4byte _0811E3BA @ case 12
	.4byte _0811E3C2 @ case 13
	.4byte _0811E3CA @ case 14
	.4byte _0811E3D2 @ case 15
	.4byte _0811E3DA @ case 16
	.4byte _0811E3E2 @ case 17
	.4byte _0811E3EA @ case 18
	.4byte _0811E3F8 @ case 19
	.4byte _0811E406 @ case 20
	.4byte _0811E414 @ case 21
	.4byte _0811E422 @ case 22
_0811E37C:
	movs r0, #0xb
	movs r1, #0xe
	movs r2, #3
	b _0811E3AA
_0811E384:
	movs r0, #9
	movs r1, #0xe
	movs r2, #7
	b _0811E3AA
_0811E38C:
	movs r0, #7
	movs r1, #0xe
	movs r2, #0xb
	b _0811E3AA
_0811E394:
	movs r0, #5
	movs r1, #0xe
	movs r2, #0xf
	b _0811E3AA
_0811E39C:
	movs r0, #3
	movs r1, #0xe
	movs r2, #0x13
	b _0811E3AA
_0811E3A4:
	movs r0, #1
	movs r1, #0xe
	movs r2, #0x17
_0811E3AA:
	movs r3, #2
	bl sub_0811E43C
	b _0811E42E
_0811E3B2:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0x18
	b _0811E3F0
_0811E3BA:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0x19
	b _0811E3F0
_0811E3C2:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0x1a
	b _0811E3F0
_0811E3CA:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0x1b
	b _0811E3F0
_0811E3D2:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0x1c
	b _0811E3F0
_0811E3DA:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0x1d
	b _0811E3F0
_0811E3E2:
	movs r0, #0
	movs r1, #0xa
	movs r2, #0x1e
	b _0811E3F0
_0811E3EA:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0x17
_0811E3F0:
	movs r3, #0xa
	bl sub_0811E43C
	b _0811E42E
_0811E3F8:
	movs r0, #1
	movs r1, #0xb
	movs r2, #0x17
	movs r3, #8
	bl sub_0811E43C
	b _0811E42E
_0811E406:
	movs r0, #1
	movs r1, #0xc
	movs r2, #0x17
	movs r3, #6
	bl sub_0811E43C
	b _0811E42E
_0811E414:
	movs r0, #1
	movs r1, #0xd
	movs r2, #0x17
	movs r3, #4
	bl sub_0811E43C
	b _0811E42E
_0811E422:
	movs r0, #1
	movs r1, #0xe
	movs r2, #0x17
	movs r3, #2
	bl sub_0811E43C
_0811E42E:
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0811E2F0

	thumb_func_start sub_0811E43C
sub_0811E43C: @ 0x0811E43C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov ip, r0
	adds r7, r1, #0
	mov sb, r2
	mov sl, r3
	ldr r0, _0811E574
	ldr r0, [r0]
	movs r1, #0xbf
	lsls r1, r1, #2
	adds r6, r0, r1
	mov r0, ip
	add r0, sb
	subs r5, r0, #1
	adds r0, r7, r3
	subs r0, #1
	mov r8, r0
	mov r2, ip
	adds r3, r7, #0
	lsls r0, r3, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r4, _0811E578
	adds r1, r4, #0
	strh r1, [r0]
	adds r2, #1
	cmp r2, r5
	bge _0811E498
	ldr r0, _0811E57C
	adds r4, r0, #0
	lsls r1, r2, #1
	lsls r0, r3, #6
	adds r0, r0, r6
	adds r1, r1, r0
	subs r2, r5, r2
_0811E48C:
	strh r4, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _0811E48C
	adds r2, r5, #0
_0811E498:
	lsls r0, r3, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r2, _0811E580
	adds r1, r2, #0
	strh r1, [r0]
	adds r3, #1
	mov r4, ip
	adds r4, #1
	adds r0, r7, #1
	str r0, [sp, #4]
	mov r1, sb
	subs r1, #2
	str r1, [sp]
	movs r2, #2
	rsbs r2, r2, #0
	add sl, r2
	cmp r3, r8
	bge _0811E508
	lsls r7, r4, #1
	mov sb, r7
_0811E4C4:
	lsls r0, r3, #5
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r2, _0811E584
	adds r1, r2, #0
	strh r1, [r0]
	adds r2, r4, #0
	adds r7, r3, #1
	cmp r4, r5
	bge _0811E4F4
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	lsls r0, r3, #6
	adds r0, r0, r6
	add r0, sb
	subs r2, r5, r4
_0811E4E8:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _0811E4E8
	adds r2, r5, #0
_0811E4F4:
	lsls r0, r3, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r2, _0811E588
	adds r1, r2, #0
	strh r1, [r0]
	adds r3, r7, #0
	cmp r3, r8
	blt _0811E4C4
_0811E508:
	lsls r0, r3, #5
	mov r7, ip
	adds r1, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldr r7, _0811E58C
	adds r2, r7, #0
	strh r2, [r1]
	adds r2, r4, #0
	mov ip, r0
	cmp r4, r5
	bge _0811E53A
	ldr r0, _0811E590
	adds r7, r0, #0
	lsls r1, r4, #1
	lsls r0, r3, #6
	adds r0, r0, r6
	adds r0, r1, r0
	subs r2, r5, r4
_0811E52E:
	strh r7, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _0811E52E
	adds r2, r5, #0
_0811E53A:
	mov r1, ip
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r2, _0811E594
	adds r1, r2, #0
	strh r1, [r0]
	lsls r0, r4, #0x1b
	lsrs r0, r0, #0x18
	ldr r3, [sp, #4]
	lsls r1, r3, #0x1b
	lsrs r1, r1, #0x18
	ldr r4, [sp]
	lsls r2, r4, #0x1b
	lsrs r2, r2, #0x18
	mov r7, sl
	lsls r3, r7, #0x1b
	lsrs r3, r3, #0x18
	bl sub_0811E670
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E574: .4byte 0x02039DE8
_0811E578: .4byte 0x00004001
_0811E57C: .4byte 0x00004002
_0811E580: .4byte 0x00004003
_0811E584: .4byte 0x00004005
_0811E588: .4byte 0x00004007
_0811E58C: .4byte 0x00004009
_0811E590: .4byte 0x0000400A
_0811E594: .4byte 0x0000400B
	thumb_func_end sub_0811E43C

	thumb_func_start sub_0811E598
sub_0811E598: @ 0x0811E598
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #4
	movs r0, #2
	movs r2, #0
	bl ChangeBgY
	ldr r0, _0811E5B8
	ldr r0, [r0]
	ldr r1, _0811E5BC
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0811E5B8: .4byte 0x02039DE8
_0811E5BC: .4byte 0x000002CE
	thumb_func_end sub_0811E598

	thumb_func_start sub_0811E5C0
sub_0811E5C0: @ 0x0811E5C0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #2
	bl GetBgY
	adds r2, r0, #0
	ldr r0, _0811E60C
	ldr r3, [r0]
	ldr r0, _0811E610
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	lsls r4, r4, #0x14
	asrs r4, r4, #0x10
	lsls r0, r4, #8
	adds r2, r2, r0
	cmp r5, #0
	beq _0811E614
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r0, r3, r1
	str r2, [r0]
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r1, r3, r0
	lsls r0, r5, #8
	str r0, [r1]
	cmp r4, #0
	bge _0811E61E
	rsbs r0, r0, #0
	str r0, [r1]
	b _0811E61E
	.align 2, 0
_0811E60C: .4byte 0x02039DE8
_0811E610: .4byte 0x000002CE
_0811E614:
	movs r0, #2
	adds r1, r2, #0
	movs r2, #0
	bl ChangeBgY
_0811E61E:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0811E5C0

	thumb_func_start sub_0811E624
sub_0811E624: @ 0x0811E624
	push {lr}
	movs r0, #2
	bl GetBgY
	ldr r1, _0811E650
	ldr r2, [r1]
	movs r3, #0xb4
	lsls r3, r3, #2
	adds r1, r2, r3
	ldr r1, [r1]
	cmp r0, r1
	beq _0811E654
	movs r1, #0xb5
	lsls r1, r1, #2
	adds r0, r2, r1
	ldr r1, [r0]
	movs r0, #2
	movs r2, #1
	bl ChangeBgY
	movs r0, #1
	b _0811E656
	.align 2, 0
_0811E650: .4byte 0x02039DE8
_0811E654:
	movs r0, #0
_0811E656:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811E624

	thumb_func_start sub_0811E65C
sub_0811E65C: @ 0x0811E65C
	ldr r0, _0811E668
	ldr r0, [r0]
	ldr r1, _0811E66C
	adds r0, r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0811E668: .4byte 0x02039DE8
_0811E66C: .4byte 0x000002CE
	thumb_func_end sub_0811E65C

	thumb_func_start sub_0811E670
sub_0811E670: @ 0x0811E670
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r0, #8
	adds r0, r0, r2
	orrs r4, r0
	lsls r5, r1, #8
	adds r1, r1, r3
	orrs r5, r1
	movs r0, #0x40
	adds r1, r4, #0
	bl SetGpuReg
	movs r0, #0x44
	adds r1, r5, #0
	bl SetGpuReg
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end sub_0811E670

	thumb_func_start sub_0811E6A4
sub_0811E6A4: @ 0x0811E6A4
	push {r4, r5, lr}
	ldr r0, _0811E6CC
	bl LoadSpriteSheets
	ldr r0, _0811E6D0
	bl LoadSpritePalettes
	movs r5, #0
	ldr r4, _0811E6D4
_0811E6B6:
	adds r0, r4, #0
	bl LoadCompressedSpriteSheet
	adds r4, #8
	adds r5, #1
	cmp r5, #3
	bls _0811E6B6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811E6CC: .4byte 0x085743CC
_0811E6D0: .4byte 0x085743EC
_0811E6D4: .4byte 0x08574414
	thumb_func_end sub_0811E6A4

	thumb_func_start sub_0811E6D8
sub_0811E6D8: @ 0x0811E6D8
	push {lr}
	bl GetEasyChatScreenFrameId
	lsls r0, r0, #0x18
	ldr r1, _0811E724
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrb r2, [r0]
	lsls r1, r2, #0x1b
	lsrs r1, r1, #8
	lsrs r2, r2, #5
	adds r2, #1
	ldr r0, _0811E728
	movs r3, #0xc0
	lsls r3, r3, #0xc
	adds r1, r1, r3
	asrs r1, r1, #0x10
	lsls r2, r2, #3
	movs r3, #2
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0811E72C
	ldr r2, [r1]
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r2, r2, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0811E730
	adds r1, r1, r0
	str r1, [r2]
	movs r0, #1
	strh r0, [r1, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
_0811E724: .4byte 0x08574358
_0811E728: .4byte 0x0857443C
_0811E72C: .4byte 0x02039DE8
_0811E730: .4byte 0x020205AC
	thumb_func_end sub_0811E6D8

	thumb_func_start sub_0811E734
sub_0811E734: @ 0x0811E734
	push {lr}
	adds r1, r0, #0
	movs r2, #0x30
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0811E762
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0811E762
	movs r0, #0
	strh r0, [r1, #0x2e]
	ldrh r0, [r1, #0x24]
	adds r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0811E762
	ldr r0, _0811E768
	strh r0, [r1, #0x24]
_0811E762:
	pop {r0}
	bx r0
	.align 2, 0
_0811E768: .4byte 0x0000FFFA
	thumb_func_end sub_0811E734

	thumb_func_start sub_0811E76C
sub_0811E76C: @ 0x0811E76C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _0811E79C
	ldr r2, [r2]
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r2, r2, r3
	ldr r3, [r2]
	lsrs r0, r0, #0x15
	adds r0, #4
	movs r4, #0
	strh r0, [r3, #0x20]
	ldr r0, [r2]
	lsrs r1, r1, #0x15
	adds r1, #8
	strh r1, [r0, #0x22]
	ldr r0, [r2]
	strh r4, [r0, #0x24]
	ldr r0, [r2]
	strh r4, [r0, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811E79C: .4byte 0x02039DE8
	thumb_func_end sub_0811E76C

	thumb_func_start sub_0811E7A0
sub_0811E7A0: @ 0x0811E7A0
	ldr r0, _0811E7BC
	ldr r1, [r0]
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r2, #0
	strh r2, [r0, #0x2e]
	ldr r0, [r1]
	strh r2, [r0, #0x30]
	ldr r0, [r1]
	strh r2, [r0, #0x24]
	bx lr
	.align 2, 0
_0811E7BC: .4byte 0x02039DE8
	thumb_func_end sub_0811E7A0

	thumb_func_start sub_0811E7C0
sub_0811E7C0: @ 0x0811E7C0
	ldr r0, _0811E7D4
	ldr r0, [r0]
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #1
	strh r0, [r1, #0x30]
	bx lr
	.align 2, 0
_0811E7D4: .4byte 0x02039DE8
	thumb_func_end sub_0811E7C0

	thumb_func_start sub_0811E7D8
sub_0811E7D8: @ 0x0811E7D8
	push {lr}
	ldr r0, _0811E808
	movs r1, #0
	movs r2, #0
	movs r3, #3
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0811E80C
	ldr r2, [r1]
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r2, r2, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0811E810
	adds r1, r1, r0
	str r1, [r2]
	bl sub_0811E838
	pop {r0}
	bx r0
	.align 2, 0
_0811E808: .4byte 0x0857448C
_0811E80C: .4byte 0x02039DE8
_0811E810: .4byte 0x020205AC
	thumb_func_end sub_0811E7D8

	thumb_func_start sub_0811E814
sub_0811E814: @ 0x0811E814
	push {r4, r5, lr}
	ldr r5, _0811E834
	ldr r0, [r5]
	movs r4, #0xb7
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811E834: .4byte 0x02039DE8
	thumb_func_end sub_0811E814

	thumb_func_start sub_0811E838
sub_0811E838: @ 0x0811E838
	push {r4, lr}
	sub sp, #4
	ldr r0, _0811E874
	ldr r0, [r0]
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0811E888
	mov r4, sp
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl sub_0811C3A0
	bl sub_0811C3B4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811E878
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_0811E890
	b _0811E888
	.align 2, 0
_0811E874: .4byte 0x02039DE8
_0811E878:
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_0811E904
_0811E888:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_0811E838

	thumb_func_start sub_0811E890
sub_0811E890: @ 0x0811E890
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	beq _0811E8D4
	ldr r5, _0811E8D0
	ldr r0, [r5]
	movs r4, #0xb7
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0
	bl StartSpriteAnim
	ldr r1, [r5]
	adds r1, r1, r4
	ldr r2, [r1]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, #0x28
	strh r0, [r2, #0x20]
	ldr r1, [r1]
	lsls r0, r7, #0x18
	asrs r0, r0, #0x14
	adds r0, #0x60
	b _0811E8F8
	.align 2, 0
_0811E8D0: .4byte 0x02039DE8
_0811E8D4:
	ldr r5, _0811E900
	ldr r0, [r5]
	movs r4, #0xb7
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r2, [r0]
	movs r1, #0xd8
	strh r1, [r2, #0x20]
	ldr r1, [r0]
	lsls r0, r7, #0x18
	asrs r0, r0, #0x14
	adds r0, #0x70
_0811E8F8:
	strh r0, [r1, #0x22]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E900: .4byte 0x02039DE8
	thumb_func_end sub_0811E890

	thumb_func_start sub_0811E904
sub_0811E904: @ 0x0811E904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsrs r1, r0, #0x18
	mov r8, r1
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0811E99C
	lsls r7, r6, #0x18
	cmp r1, #0xa
	bne _0811E950
	asrs r0, r7, #0x18
	cmp r0, #1
	bne _0811E950
	ldr r5, _0811E94C
	ldr r0, [r5]
	movs r4, #0xb7
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #2
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r2, [r0]
	movs r1, #0x7c
	strh r1, [r2, #0x20]
	ldr r1, [r0]
	movs r0, #0x70
	b _0811E9C0
	.align 2, 0
_0811E94C: .4byte 0x02039DE8
_0811E950:
	ldr r5, _0811E998
	ldr r0, [r5]
	movs r4, #0xb7
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #3
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r6, r0, r4
	ldr r5, [r6]
	mov r0, r8
	lsls r4, r0, #0x18
	asrs r4, r4, #0x18
	adds r0, r4, #0
	movs r1, #5
	bl __divsi3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r4, r0
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x20]
	ldr r1, [r6]
	asrs r0, r7, #0x14
	adds r0, #0x60
	strh r0, [r1, #0x22]
	cmp r4, #0xc
	ble _0811E9C2
	ldr r1, [r6]
	ldrh r0, [r1, #0x20]
	adds r0, #8
	strh r0, [r1, #0x20]
	b _0811E9C2
	.align 2, 0
_0811E998: .4byte 0x02039DE8
_0811E99C:
	ldr r5, _0811E9CC
	ldr r0, [r5]
	movs r4, #0xb7
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAnim
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r2, [r0]
	movs r1, #0xd8
	strh r1, [r2, #0x20]
	ldr r1, [r0]
	lsls r0, r6, #0x18
	asrs r0, r0, #0x14
	adds r0, #0x70
_0811E9C0:
	strh r0, [r1, #0x22]
_0811E9C2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E9CC: .4byte 0x02039DE8
	thumb_func_end sub_0811E904

	thumb_func_start sub_0811E9D0
sub_0811E9D0: @ 0x0811E9D0
	push {lr}
	ldr r0, _0811EA14
	movs r1, #0
	movs r2, #0
	movs r3, #4
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0811EA18
	ldr r2, [r1]
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r2, r2, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0811EA1C
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0811EA20
	str r0, [r1, #0x1c]
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #8
	orrs r0, r2
	strb r0, [r1, #5]
	bl sub_0811EA54
	pop {r0}
	bx r0
	.align 2, 0
_0811EA14: .4byte 0x0857443C
_0811EA18: .4byte 0x02039DE8
_0811EA1C: .4byte 0x020205AC
_0811EA20: .4byte 0x0811EA25
	thumb_func_end sub_0811E9D0

	thumb_func_start sub_0811EA24
sub_0811EA24: @ 0x0811EA24
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0811EA4A
	movs r0, #0
	strh r0, [r1, #0x2e]
	ldrh r0, [r1, #0x24]
	adds r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0811EA4A
	ldr r0, _0811EA50
	strh r0, [r1, #0x24]
_0811EA4A:
	pop {r0}
	bx r0
	.align 2, 0
_0811EA50: .4byte 0x0000FFFA
	thumb_func_end sub_0811EA24

	thumb_func_start sub_0811EA54
sub_0811EA54: @ 0x0811EA54
	push {r4, lr}
	sub sp, #4
	mov r4, sp
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl sub_0811C3CC
	mov r0, sp
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #0x19
	movs r2, #0xb0
	lsls r2, r2, #0x14
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	bl sub_0811EA90
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811EA54

	thumb_func_start sub_0811EA90
sub_0811EA90: @ 0x0811EA90
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _0811EAC8
	ldr r0, [r0]
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r3, r0, r1
	ldr r1, [r3]
	cmp r1, #0
	beq _0811EAC2
	lsls r0, r2, #3
	adds r0, #4
	movs r2, #0
	strh r0, [r1, #0x20]
	ldr r1, [r3]
	adds r0, r4, #1
	lsls r0, r0, #3
	strh r0, [r1, #0x22]
	ldr r0, [r3]
	strh r2, [r0, #0x24]
	ldr r0, [r3]
	strh r2, [r0, #0x2e]
_0811EAC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811EAC8: .4byte 0x02039DE8
	thumb_func_end sub_0811EA90

	thumb_func_start sub_0811EACC
sub_0811EACC: @ 0x0811EACC
	push {r4, lr}
	ldr r4, _0811EAF4
	ldr r0, [r4]
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0811EAEE
	bl DestroySprite
	ldr r0, [r4]
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
_0811EAEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811EAF4: .4byte 0x02039DE8
	thumb_func_end sub_0811EACC

	thumb_func_start sub_0811EAF8
sub_0811EAF8: @ 0x0811EAF8
	push {r4, r5, r6, lr}
	ldr r0, _0811EB50
	movs r1, #0xd0
	movs r2, #0x80
	movs r3, #6
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0811EB54
	ldr r2, [r5]
	movs r1, #0xb9
	lsls r1, r1, #2
	adds r2, r2, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r4, _0811EB58
	adds r1, r1, r4
	str r1, [r2]
	movs r6, #0
	ldr r0, _0811EB5C
	strh r0, [r1, #0x24]
	ldr r0, _0811EB60
	movs r1, #0xd0
	movs r2, #0x50
	movs r3, #5
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [r5]
	movs r1, #0xba
	lsls r1, r1, #2
	adds r3, r2, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	str r1, [r3]
	strb r6, [r2, #9]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811EB50: .4byte 0x08574514
_0811EB54: .4byte 0x02039DE8
_0811EB58: .4byte 0x020205AC
_0811EB5C: .4byte 0x0000FFC0
_0811EB60: .4byte 0x085744F4
	thumb_func_end sub_0811EAF8

	thumb_func_start sub_0811EB64
sub_0811EB64: @ 0x0811EB64
	push {r4, lr}
	ldr r4, _0811EB78
	ldr r2, [r4]
	ldrb r3, [r2, #9]
	cmp r3, #0
	beq _0811EB7C
	cmp r3, #1
	beq _0811EBD4
	movs r0, #0
	b _0811EBF2
	.align 2, 0
_0811EB78: .4byte 0x02039DE8
_0811EB7C:
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r1, [r2]
	ldrh r0, [r1, #0x24]
	adds r0, #8
	strh r0, [r1, #0x24]
	ldr r2, [r2]
	movs r1, #0x24
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _0811EBF0
	strh r3, [r2, #0x24]
	bl sub_0811C3B4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811EBB2
	ldr r0, [r4]
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAnim
	b _0811EBC2
_0811EBB2:
	ldr r0, [r4]
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #2
	bl StartSpriteAnim
_0811EBC2:
	ldr r0, _0811EBD0
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
	b _0811EBF0
	.align 2, 0
_0811EBD0: .4byte 0x02039DE8
_0811EBD4:
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r2, r1
	ldr r0, [r0]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0811EBF0
	movs r0, #2
	strb r0, [r2, #9]
	movs r0, #0
	b _0811EBF2
_0811EBF0:
	movs r0, #1
_0811EBF2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811EB64

	thumb_func_start sub_0811EBF8
sub_0811EBF8: @ 0x0811EBF8
	push {lr}
	ldr r2, _0811EC18
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1, #9]
	ldr r0, [r2]
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #3
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_0811EC18: .4byte 0x02039DE8
	thumb_func_end sub_0811EBF8

	thumb_func_start sub_0811EC1C
sub_0811EC1C: @ 0x0811EC1C
	push {r4, r5, r6, lr}
	ldr r5, _0811EC30
	ldr r3, [r5]
	ldrb r0, [r3, #9]
	cmp r0, #0
	beq _0811EC34
	cmp r0, #1
	beq _0811EC4E
	movs r0, #0
	b _0811ECA0
	.align 2, 0
_0811EC30: .4byte 0x02039DE8
_0811EC34:
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r3, r1
	ldr r0, [r0]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0811EC9E
	movs r0, #1
	strb r0, [r3, #9]
	b _0811EC9E
_0811EC4E:
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r2, r3, r0
	ldr r1, [r2]
	ldrh r0, [r1, #0x24]
	subs r0, #8
	movs r6, #0
	strh r0, [r1, #0x24]
	ldr r0, [r2]
	movs r2, #0x24
	ldrsh r1, [r0, r2]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _0811EC9E
	movs r4, #0xba
	lsls r4, r4, #2
	adds r0, r3, r4
	ldr r0, [r0]
	bl DestroySprite
	ldr r0, [r5]
	movs r1, #0xb9
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DestroySprite
	ldr r1, [r5]
	adds r4, r1, r4
	str r6, [r4]
	movs r2, #0xb9
	lsls r2, r2, #2
	adds r0, r1, r2
	str r6, [r0]
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
	movs r0, #0
	b _0811ECA0
_0811EC9E:
	movs r0, #1
_0811ECA0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811EC1C

	thumb_func_start sub_0811ECA8
sub_0811ECA8: @ 0x0811ECA8
	push {lr}
	ldr r0, _0811ECC0
	ldr r0, [r0]
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #4
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_0811ECC0: .4byte 0x02039DE8
	thumb_func_end sub_0811ECA8

	thumb_func_start sub_0811ECC4
sub_0811ECC4: @ 0x0811ECC4
	push {lr}
	bl sub_0811C3B4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811ECE8
	ldr r0, _0811ECE4
	ldr r0, [r0]
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	bl StartSpriteAnim
	b _0811ECFA
	.align 2, 0
_0811ECE4: .4byte 0x02039DE8
_0811ECE8:
	ldr r0, _0811ED00
	ldr r0, [r0]
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #2
	bl StartSpriteAnim
_0811ECFA:
	pop {r0}
	bx r0
	.align 2, 0
_0811ED00: .4byte 0x02039DE8
	thumb_func_end sub_0811ECC4

	thumb_func_start sub_0811ED04
sub_0811ED04: @ 0x0811ED04
	ldr r0, _0811ED1C
	ldr r0, [r0]
	movs r1, #0xba
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x3f
	ldrb r1, [r0]
	lsrs r1, r1, #4
	movs r0, #1
	bics r0, r1
	bx lr
	.align 2, 0
_0811ED1C: .4byte 0x02039DE8
	thumb_func_end sub_0811ED04

	thumb_func_start sub_0811ED20
sub_0811ED20: @ 0x0811ED20
	push {r4, lr}
	ldr r4, _0811ED8C
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x50
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _0811ED4E
	ldr r0, _0811ED90
	ldr r2, [r0]
	movs r0, #0xbb
	lsls r0, r0, #2
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811ED94
	adds r0, r0, r1
	str r0, [r2]
_0811ED4E:
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x9c
	movs r3, #0
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _0811ED82
	ldr r0, _0811ED90
	ldr r2, [r0]
	movs r0, #0xbc
	lsls r0, r0, #2
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811ED94
	adds r0, r0, r1
	str r0, [r2]
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
_0811ED82:
	bl sub_0811EDFC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811ED8C: .4byte 0x0857456C
_0811ED90: .4byte 0x02039DE8
_0811ED94: .4byte 0x020205AC
	thumb_func_end sub_0811ED20

	thumb_func_start sub_0811ED98
sub_0811ED98: @ 0x0811ED98
	push {r4, r5, r6, lr}
	bl sub_0811C3FC
	ldr r6, _0811EDF8
	ldr r1, [r6]
	movs r2, #0xbb
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0
	cmp r0, #0
	bne _0811EDB2
	movs r2, #1
_0811EDB2:
	adds r3, r1, #0
	adds r3, #0x3e
	movs r4, #1
	lsls r2, r2, #2
	ldrb r1, [r3]
	movs r5, #5
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	bl sub_0811C430
	ldr r1, [r6]
	movs r2, #0xbc
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0
	cmp r0, #0
	bne _0811EDDE
	movs r2, #1
_0811EDDE:
	adds r3, r1, #0
	adds r3, #0x3e
	adds r1, r4, #0
	ands r1, r2
	lsls r1, r1, #2
	ldrb r2, [r3]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811EDF8: .4byte 0x02039DE8
	thumb_func_end sub_0811ED98

	thumb_func_start sub_0811EDFC
sub_0811EDFC: @ 0x0811EDFC
	ldr r3, _0811EE28
	ldr r0, [r3]
	movs r1, #0xbb
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, #0xbc
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0811EE28: .4byte 0x02039DE8
	thumb_func_end sub_0811EDFC

	thumb_func_start sub_0811EE2C
sub_0811EE2C: @ 0x0811EE2C
	push {lr}
	cmp r0, #0
	bne _0811EE48
	ldr r0, _0811EE44
	ldr r2, [r0]
	movs r1, #0xbb
	lsls r1, r1, #2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, #0x60
	b _0811EE56
	.align 2, 0
_0811EE44: .4byte 0x02039DE8
_0811EE48:
	ldr r0, _0811EE68
	ldr r2, [r0]
	movs r1, #0xbb
	lsls r1, r1, #2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, #0x78
_0811EE56:
	strh r1, [r0, #0x20]
	movs r3, #0xbc
	lsls r3, r3, #2
	adds r0, r2, r3
	ldr r0, [r0]
	strh r1, [r0, #0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0811EE68: .4byte 0x02039DE8
	thumb_func_end sub_0811EE2C

	thumb_func_start sub_0811EE6C
sub_0811EE6C: @ 0x0811EE6C
	push {r4, lr}
	ldr r4, _0811EED4
	adds r0, r4, #0
	movs r1, #0xdc
	movs r2, #0x54
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _0811EE9A
	ldr r0, _0811EED8
	ldr r2, [r0]
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811EEDC
	adds r0, r0, r1
	str r0, [r2]
_0811EE9A:
	adds r0, r4, #0
	movs r1, #0xdc
	movs r2, #0x9c
	movs r3, #1
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x40
	beq _0811EECA
	ldr r0, _0811EED8
	ldr r2, [r0]
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0811EEDC
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	bl StartSpriteAnim
_0811EECA:
	bl sub_0811EF44
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811EED4: .4byte 0x08574554
_0811EED8: .4byte 0x02039DE8
_0811EEDC: .4byte 0x020205AC
	thumb_func_end sub_0811EE6C

	thumb_func_start sub_0811EEE0
sub_0811EEE0: @ 0x0811EEE0
	push {r4, r5, r6, lr}
	bl sub_0811C3FC
	ldr r6, _0811EF40
	ldr r1, [r6]
	movs r2, #0xbd
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0
	cmp r0, #0
	bne _0811EEFA
	movs r2, #1
_0811EEFA:
	adds r3, r1, #0
	adds r3, #0x3e
	movs r4, #1
	lsls r2, r2, #2
	ldrb r1, [r3]
	movs r5, #5
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	bl sub_0811C430
	ldr r1, [r6]
	movs r2, #0xbe
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0
	cmp r0, #0
	bne _0811EF26
	movs r2, #1
_0811EF26:
	adds r3, r1, #0
	adds r3, #0x3e
	adds r1, r4, #0
	ands r1, r2
	lsls r1, r1, #2
	ldrb r2, [r3]
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811EF40: .4byte 0x02039DE8
	thumb_func_end sub_0811EEE0

	thumb_func_start sub_0811EF44
sub_0811EF44: @ 0x0811EF44
	ldr r3, _0811EF70
	ldr r0, [r3]
	movs r1, #0xbd
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, #0xbe
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x3e
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0811EF70: .4byte 0x02039DE8
	thumb_func_end sub_0811EF44

	thumb_func_start sub_0811EF74
sub_0811EF74: @ 0x0811EF74
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	bl GetDisplayedPersonType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0811EF98
	cmp r0, #1
	bgt _0811EF8E
	cmp r0, #0
	beq _0811EF94
	b _0811F02E
_0811EF8E:
	cmp r0, #2
	beq _0811EF9C
	b _0811F02E
_0811EF94:
	movs r4, #0x43
	b _0811EF9E
_0811EF98:
	movs r4, #0x44
	b _0811EF9E
_0811EF9C:
	movs r4, #7
_0811EF9E:
	bl GetEasyChatScreenFrameId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _0811EFB0
	cmp r0, #5
	beq _0811EFB6
	b _0811F02E
_0811EFB0:
	movs r5, #0x4c
	movs r3, #0x28
	b _0811EFBA
_0811EFB6:
	movs r5, #0x30
	movs r3, #0x30
_0811EFBA:
	adds r0, r4, #0
	ldr r7, _0811F038
	adds r2, r5, #0
	adds r4, r3, #0
	movs r6, #0
	str r6, [sp]
	adds r1, r7, #0
	bl AddPseudoEventObject
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _0811EFEE
	ldr r1, _0811F03C
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0, #5]
	movs r1, #2
	bl StartSpriteAnim
_0811EFEE:
	ldr r0, _0811F040
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	movs r1, #0x69
	cmp r0, #0
	bne _0811EFFC
	movs r1, #0x64
_0811EFFC:
	adds r2, r5, #0
	subs r2, #0x18
	str r6, [sp]
	adds r0, r1, #0
	adds r1, r7, #0
	adds r3, r4, #0
	bl AddPseudoEventObject
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x40
	beq _0811F02E
	ldr r1, _0811F03C
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0, #5]
	movs r1, #3
	bl StartSpriteAnim
_0811F02E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F038: .4byte 0x08007141
_0811F03C: .4byte 0x020205AC
_0811F040: .4byte 0x03005AF0
	thumb_func_end sub_0811EF74

	thumb_func_start sub_0811F044
sub_0811F044: @ 0x0811F044
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x14
	beq _0811F06A
	cmp r0, #0x14
	bgt _0811F064
	cmp r0, #0x11
	blt _0811F082
	ldr r0, _0811F060
	bl FlagGet
	b _0811F07C
	.align 2, 0
_0811F060: .4byte 0x00000864
_0811F064:
	cmp r1, #0x15
	beq _0811F078
	b _0811F082
_0811F06A:
	ldr r0, _0811F074
	bl FlagGet
	b _0811F07C
	.align 2, 0
_0811F074: .4byte 0x00000866
_0811F078:
	bl sub_0811F5D8
_0811F07C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811F084
_0811F082:
	movs r0, #1
_0811F084:
	pop {r1}
	bx r1
	thumb_func_end sub_0811F044

	thumb_func_start EasyChat_GetNumWordsInGroup
EasyChat_GetNumWordsInGroup: @ 0x0811F088
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0
	bne _0811F0A0
	movs r0, #0
	bl GetNationalPokedexCount
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0811F0B6
_0811F0A0:
	bl sub_0811F044
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811F0AE
	movs r0, #0
	b _0811F0B6
_0811F0AE:
	ldr r0, _0811F0BC
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r0, [r1, #6]
_0811F0B6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811F0BC: .4byte 0x08578D14
	thumb_func_end EasyChat_GetNumWordsInGroup

	thumb_func_start sub_0811F0C0
sub_0811F0C0: @ 0x0811F0C0
	push {r4, r5, lr}
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	ldr r0, _0811F0EC
	cmp r1, r0
	beq _0811F120
	lsrs r3, r2, #0x19
	ldr r5, _0811F0F0
	ands r5, r1
	cmp r3, #0x15
	bhi _0811F124
	ldr r0, _0811F0F4
	lsls r2, r3, #3
	adds r1, r2, r0
	ldrh r4, [r1, #4]
	cmp r3, #0x13
	bgt _0811F0F8
	cmp r3, #0x12
	bge _0811F0FC
	cmp r3, #0
	beq _0811F0FC
	b _0811F11C
	.align 2, 0
_0811F0EC: .4byte 0x0000FFFF
_0811F0F0: .4byte 0x000001FF
_0811F0F4: .4byte 0x08578D14
_0811F0F8:
	cmp r3, #0x15
	bne _0811F11C
_0811F0FC:
	adds r0, r2, r0
	ldr r2, [r0]
	movs r1, #0
	cmp r1, r4
	bhs _0811F124
_0811F106:
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	beq _0811F120
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	blo _0811F106
	b _0811F124
_0811F11C:
	cmp r5, r4
	bhs _0811F124
_0811F120:
	movs r0, #0
	b _0811F126
_0811F124:
	movs r0, #1
_0811F126:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0811F0C0

	thumb_func_start GetEasyChatWord
GetEasyChatWord: @ 0x0811F12C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r0, #0x13
	bgt _0811F144
	cmp r0, #0x12
	bge _0811F158
	cmp r0, #0
	beq _0811F148
	b _0811F164
_0811F144:
	cmp r0, #0x15
	bne _0811F164
_0811F148:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _0811F154
	adds r0, r0, r1
	b _0811F176
	.align 2, 0
_0811F154: .4byte 0x082EA31C
_0811F158:
	lsls r0, r2, #3
	ldr r1, _0811F160
	adds r0, r0, r1
	b _0811F176
	.align 2, 0
_0811F160: .4byte 0x082EACC4
_0811F164:
	ldr r1, _0811F17C
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
_0811F176:
	pop {r1}
	bx r1
	.align 2, 0
_0811F17C: .4byte 0x08578D14
	thumb_func_end GetEasyChatWord

	thumb_func_start CopyEasyChatWord
CopyEasyChatWord: @ 0x0811F180
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r6, r1, #0x10
	lsrs r0, r6, #0x10
	adds r4, r0, #0
	bl sub_0811F0C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811F19C
	ldr r1, _0811F198
	b _0811F1AE
	.align 2, 0
_0811F198: .4byte 0x08579F30
_0811F19C:
	ldr r0, _0811F1B8
	cmp r4, r0
	beq _0811F1C0
	ldr r1, _0811F1BC
	ands r1, r4
	lsrs r0, r6, #0x19
	bl GetEasyChatWord
	adds r1, r0, #0
_0811F1AE:
	adds r0, r5, #0
	bl StringCopy
	b _0811F1C6
	.align 2, 0
_0811F1B8: .4byte 0x0000FFFF
_0811F1BC: .4byte 0x000001FF
_0811F1C0:
	movs r0, #0xff
	strb r0, [r5]
	adds r0, r5, #0
_0811F1C6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end CopyEasyChatWord

	thumb_func_start ConvertEasyChatWordsToString
ConvertEasyChatWordsToString: @ 0x0811F1CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r0, _0811F254
	adds r2, r2, r0
	lsrs r7, r2, #0x10
	movs r0, #0
	cmp r0, sb
	bhs _0811F23C
_0811F1EE:
	movs r6, #0
	adds r0, #1
	mov r8, r0
	cmp r6, r7
	bhs _0811F220
	ldr r2, _0811F258
_0811F1FA:
	ldrh r1, [r5]
	adds r0, r4, #0
	str r2, [sp]
	bl CopyEasyChatWord
	adds r4, r0, #0
	ldrh r0, [r5]
	ldr r2, [sp]
	cmp r0, r2
	beq _0811F214
	movs r0, #0
	strb r0, [r4]
	adds r4, #1
_0811F214:
	adds r5, #2
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, r7
	blo _0811F1FA
_0811F220:
	ldrh r1, [r5]
	adds r5, #2
	adds r0, r4, #0
	bl CopyEasyChatWord
	adds r4, r0, #0
	movs r0, #0xfe
	strb r0, [r4]
	adds r4, #1
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, sb
	blo _0811F1EE
_0811F23C:
	subs r4, #1
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811F254: .4byte 0xFFFF0000
_0811F258: .4byte 0x0000FFFF
	thumb_func_end ConvertEasyChatWordsToString

	thumb_func_start GetEasyChatWordStringLength
GetEasyChatWordStringLength: @ 0x0811F25C
	push {r4, r5, lr}
	lsls r5, r0, #0x10
	lsrs r0, r5, #0x10
	adds r4, r0, #0
	ldr r0, _0811F270
	cmp r4, r0
	bne _0811F274
	movs r0, #0
	b _0811F29A
	.align 2, 0
_0811F270: .4byte 0x0000FFFF
_0811F274:
	adds r0, r4, #0
	bl sub_0811F0C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811F290
	ldr r1, _0811F28C
	ands r1, r4
	lsrs r0, r5, #0x19
	bl GetEasyChatWord
	b _0811F292
	.align 2, 0
_0811F28C: .4byte 0x000001FF
_0811F290:
	ldr r0, _0811F2A0
_0811F292:
	bl StringLength
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0811F29A:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811F2A0: .4byte 0x08579F30
	thumb_func_end GetEasyChatWordStringLength

	thumb_func_start sub_0811F2A4
sub_0811F2A4: @ 0x0811F2A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	movs r7, #0
	cmp r7, r8
	bhs _0811F306
	subs r0, r1, #1
	lsls r0, r0, #0x10
	mov sb, r0
_0811F2CE:
	mov r0, sb
	lsrs r4, r0, #0x10
	movs r5, #0
	cmp r5, r1
	bhs _0811F2F4
_0811F2D8:
	ldrh r0, [r6]
	adds r6, #2
	str r1, [sp]
	bl GetEasyChatWordStringLength
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, [sp]
	cmp r5, r1
	blo _0811F2D8
_0811F2F4:
	cmp r4, sl
	bls _0811F2FC
	movs r0, #1
	b _0811F308
_0811F2FC:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, r8
	blo _0811F2CE
_0811F306:
	movs r0, #0
_0811F308:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	thumb_func_end sub_0811F2A4

	thumb_func_start sub_0811F318
sub_0811F318: @ 0x0811F318
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl Random
	ldr r2, _0811F368
	lsls r1, r4, #3
	adds r1, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #4]
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r4, #0
	beq _0811F346
	cmp r4, #0x15
	beq _0811F346
	cmp r4, #0x12
	beq _0811F346
	cmp r4, #0x13
	bne _0811F354
_0811F346:
	ldr r1, _0811F368
	lsls r0, r4, #3
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
_0811F354:
	movs r0, #0x7f
	ands r0, r4
	lsls r0, r0, #9
	ldr r1, _0811F36C
	ands r2, r1
	orrs r0, r2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811F368: .4byte 0x08578D14
_0811F36C: .4byte 0x000001FF
	thumb_func_end sub_0811F318

	thumb_func_start sub_0811F370
sub_0811F370: @ 0x0811F370
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0811F044
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811F390
	ldr r0, _0811F38C
	b _0811F3A4
	.align 2, 0
_0811F38C: .4byte 0x0000FFFF
_0811F390:
	cmp r4, #0
	beq _0811F39C
	adds r0, r4, #0
	bl sub_0811F318
	b _0811F3A0
_0811F39C:
	bl sub_0811F5E8
_0811F3A0:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0811F3A4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811F370

	thumb_func_start sub_0811F3AC
sub_0811F3AC: @ 0x0811F3AC
	push {r4, r5, lr}
	ldr r0, _0811F3C0
	ldrh r0, [r0]
	cmp r0, #1
	beq _0811F3E4
	cmp r0, #1
	bgt _0811F3C4
	cmp r0, #0
	beq _0811F3CE
	b _0811F438
	.align 2, 0
_0811F3C0: .4byte 0x02037280
_0811F3C4:
	cmp r0, #2
	beq _0811F40C
	cmp r0, #3
	beq _0811F41C
	b _0811F438
_0811F3CE:
	ldr r0, _0811F3DC
	ldr r0, [r0]
	ldr r1, _0811F3E0
	adds r5, r0, r1
	movs r2, #2
	b _0811F426
	.align 2, 0
_0811F3DC: .4byte 0x03005AEC
_0811F3E0: .4byte 0x00002BB0
_0811F3E4:
	ldr r0, _0811F404
	ldr r0, [r0]
	ldr r1, _0811F408
	adds r5, r0, r1
	adds r0, r5, #0
	movs r1, #3
	movs r2, #2
	movs r3, #0x12
	bl sub_0811F2A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811F424
	movs r2, #2
	movs r3, #3
	b _0811F428
	.align 2, 0
_0811F404: .4byte 0x03005AEC
_0811F408: .4byte 0x00002BBC
_0811F40C:
	ldr r0, _0811F414
	ldr r0, [r0]
	ldr r1, _0811F418
	b _0811F422
	.align 2, 0
_0811F414: .4byte 0x03005AEC
_0811F418: .4byte 0x00002BC8
_0811F41C:
	ldr r0, _0811F440
	ldr r0, [r0]
	ldr r1, _0811F444
_0811F422:
	adds r5, r0, r1
_0811F424:
	movs r2, #3
_0811F426:
	movs r3, #2
_0811F428:
	ldr r4, _0811F448
	adds r0, r4, #0
	adds r1, r5, #0
	bl ConvertEasyChatWordsToString
	adds r0, r4, #0
	bl ShowFieldAutoScrollMessage
_0811F438:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811F440: .4byte 0x03005AEC
_0811F444: .4byte 0x00002BD4
_0811F448: .4byte 0x02021C7C
	thumb_func_end sub_0811F3AC

	thumb_func_start sub_0811F44C
sub_0811F44C: @ 0x0811F44C
	push {lr}
	bl Random
	movs r1, #1
	ands r1, r0
	movs r0, #0xc
	cmp r1, #0
	beq _0811F45E
	movs r0, #0xd
_0811F45E:
	bl sub_0811F370
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _0811F474
	bl CopyEasyChatWord
	pop {r0}
	bx r0
	.align 2, 0
_0811F474: .4byte 0x02021C54
	thumb_func_end sub_0811F44C

	thumb_func_start sub_0811F478
sub_0811F478: @ 0x0811F478
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x1b
	movs r1, #0xe0
	lsls r1, r1, #0x13
	ands r1, r0
	lsrs r1, r1, #0x18
	ldr r0, _0811F498
	ldr r0, [r0]
	ldr r3, _0811F49C
	adds r0, r0, r3
	adds r0, r0, r2
	ldrb r0, [r0]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0811F498: .4byte 0x03005AEC
_0811F49C: .4byte 0x00002E20
	thumb_func_end sub_0811F478

	thumb_func_start sub_0811F4A0
sub_0811F4A0: @ 0x0811F4A0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x20
	bhi _0811F4C4
	lsrs r3, r0, #0x1b
	movs r2, #7
	ands r2, r1
	ldr r0, _0811F4C8
	ldr r1, [r0]
	ldr r0, _0811F4CC
	adds r1, r1, r0
	adds r1, r1, r3
	movs r0, #1
	lsls r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0811F4C4:
	pop {r0}
	bx r0
	.align 2, 0
_0811F4C8: .4byte 0x03005AEC
_0811F4CC: .4byte 0x00002E20
	thumb_func_end sub_0811F4A0

	thumb_func_start sub_0811F4D0
sub_0811F4D0: @ 0x0811F4D0
	push {r4, r5, lr}
	movs r4, #0
	movs r5, #0
_0811F4D6:
	adds r0, r4, #0
	bl sub_0811F478
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811F4E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0811F4E8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x20
	bls _0811F4D6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811F4D0

	thumb_func_start sub_0811F4FC
sub_0811F4FC: @ 0x0811F4FC
	push {r4, r5, r6, lr}
	bl sub_0811F4D0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x21
	bne _0811F528
	b _0811F562
_0811F50C:
	adds r0, r5, #0
	bl sub_0811F4A0
	ldr r0, _0811F524
	ands r4, r0
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r0, r1, #0
	orrs r4, r0
	adds r0, r4, #0
	b _0811F564
	.align 2, 0
_0811F524: .4byte 0x000001FF
_0811F528:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x21
	subs r1, r1, r4
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r4, #0
_0811F53E:
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl sub_0811F478
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0811F558
	cmp r6, #0
	beq _0811F50C
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_0811F558:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x20
	bls _0811F53E
_0811F562:
	ldr r0, _0811F56C
_0811F564:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811F56C: .4byte 0x0000FFFF
	thumb_func_end sub_0811F4FC

	thumb_func_start sub_0811F570
sub_0811F570: @ 0x0811F570
	push {r4, r5, lr}
	bl sub_0811F4D0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _0811F594
	b _0811F5CA
_0811F580:
	ldr r0, _0811F590
	ands r4, r0
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r0, r1, #0
	orrs r4, r0
	adds r0, r4, #0
	b _0811F5CC
	.align 2, 0
_0811F590: .4byte 0x000001FF
_0811F594:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #0
_0811F5A8:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0811F478
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811F5C0
	cmp r5, #0
	beq _0811F580
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0811F5C0:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x20
	bls _0811F5A8
_0811F5CA:
	ldr r0, _0811F5D4
_0811F5CC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811F5D4: .4byte 0x0000FFFF
	thumb_func_end sub_0811F570

	thumb_func_start sub_0811F5D8
sub_0811F5D8: @ 0x0811F5D8
	push {lr}
	bl IsNationalPokedexEnabled
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811F5D8

	thumb_func_start sub_0811F5E8
sub_0811F5E8: @ 0x0811F5E8
	push {r4, r5, r6, r7, lr}
	movs r0, #0
	bl EasyChat_GetNumWordsInGroup
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0811F608
	b _0811F652
_0811F5FA:
	ldrh r1, [r5]
	ldr r0, _0811F604
	ands r0, r1
	b _0811F654
	.align 2, 0
_0811F604: .4byte 0x000001FF
_0811F608:
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0811F65C
	ldr r5, [r0]
	ldrh r7, [r0, #4]
	movs r6, #0
	cmp r6, r7
	bhs _0811F652
_0811F626:
	ldrh r0, [r5]
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811F646
	cmp r4, #0
	beq _0811F5FA
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0811F646:
	adds r5, #2
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, r7
	blo _0811F626
_0811F652:
	ldr r0, _0811F660
_0811F654:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811F65C: .4byte 0x08578D14
_0811F660: .4byte 0x0000FFFF
	thumb_func_end sub_0811F5E8

	thumb_func_start InitEasyChatPhrases
InitEasyChatPhrases: @ 0x0811F664
	push {r4, r5, r6, r7, lr}
	ldr r4, _0811F770
	ldr r1, [r4]
	ldr r0, _0811F774
	adds r2, r1, r0
	ldr r0, _0811F778
	strh r0, [r2]
	ldr r5, _0811F77C
	adds r2, r1, r5
	ldr r0, _0811F780
	strh r0, [r2]
	ldr r0, _0811F784
	adds r2, r1, r0
	ldr r0, _0811F788
	strh r0, [r2]
	adds r5, #4
	adds r2, r1, r5
	ldr r0, _0811F78C
	strh r0, [r2]
	ldr r0, _0811F790
	adds r2, r1, r0
	ldr r0, _0811F794
	strh r0, [r2]
	adds r5, #8
	adds r2, r1, r5
	ldr r0, _0811F798
	strh r0, [r2]
	movs r0, #0xaf
	lsls r0, r0, #6
	adds r2, r1, r0
	ldr r0, _0811F79C
	strh r0, [r2]
	adds r5, #4
	adds r2, r1, r5
	ldr r0, _0811F7A0
	strh r0, [r2]
	ldr r0, _0811F7A4
	adds r2, r1, r0
	ldr r0, _0811F7A8
	strh r0, [r2]
	ldr r2, _0811F7AC
	adds r0, r1, r2
	ldr r3, _0811F7B0
	strh r3, [r0]
	adds r5, #6
	adds r2, r1, r5
	ldr r0, _0811F7B4
	strh r0, [r2]
	ldr r2, _0811F7B8
	adds r0, r1, r2
	strh r3, [r0]
	adds r5, #4
	adds r2, r1, r5
	ldr r0, _0811F7BC
	strh r0, [r2]
	ldr r2, _0811F7C0
	adds r0, r1, r2
	ldr r2, _0811F7C4
	strh r2, [r0]
	adds r5, #4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r2, _0811F7C8
	adds r0, r1, r2
	strh r3, [r0]
	adds r5, #4
	adds r2, r1, r5
	ldr r0, _0811F7CC
	strh r0, [r2]
	ldr r2, _0811F7D0
	adds r0, r1, r2
	adds r3, #5
	strh r3, [r0]
	adds r5, #4
	adds r2, r1, r5
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	ldr r0, _0811F7D4
	adds r2, r1, r0
	movs r0, #0xc6
	lsls r0, r0, #3
	strh r0, [r2]
	adds r5, #4
	adds r2, r1, r5
	ldr r0, _0811F7D8
	strh r0, [r2]
	ldr r0, _0811F7DC
	adds r1, r1, r0
	strh r3, [r1]
	movs r3, #0
	adds r7, r4, #0
	ldr r6, _0811F7E0
	movs r2, #1
	rsbs r2, r2, #0
	adds r5, r2, #0
_0811F724:
	movs r2, #0
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r4, r0, #2
_0811F72C:
	ldr r1, [r7]
	lsls r0, r2, #1
	adds r0, r0, r4
	adds r1, r1, r6
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #8
	bls _0811F72C
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xf
	bls _0811F724
	movs r3, #0
	ldr r4, _0811F770
	ldr r2, _0811F7E4
	movs r1, #0
_0811F758:
	ldr r0, [r4]
	adds r0, r0, r2
	adds r0, r0, r3
	strb r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x3f
	bls _0811F758
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811F770: .4byte 0x03005AEC
_0811F774: .4byte 0x00002BB0
_0811F778: .4byte 0x0000020E
_0811F77C: .4byte 0x00002BB2
_0811F780: .4byte 0x00001228
_0811F784: .4byte 0x00002BB4
_0811F788: .4byte 0x0000020B
_0811F78C: .4byte 0x0000101F
_0811F790: .4byte 0x00002BBC
_0811F794: .4byte 0x00000603
_0811F798: .4byte 0x00001405
_0811F79C: .4byte 0x00000C02
_0811F7A0: .4byte 0x00000E0E
_0811F7A4: .4byte 0x00002BC4
_0811F7A8: .4byte 0x00000803
_0811F7AC: .4byte 0x00002BC6
_0811F7B0: .4byte 0x00000C01
_0811F7B4: .4byte 0x0000123C
_0811F7B8: .4byte 0x00002BCA
_0811F7BC: .4byte 0x0000FFFF
_0811F7C0: .4byte 0x00002BCE
_0811F7C4: .4byte 0x00000607
_0811F7C8: .4byte 0x00002BD2
_0811F7CC: .4byte 0x0000121B
_0811F7D0: .4byte 0x00002BD6
_0811F7D4: .4byte 0x00002BDA
_0811F7D8: .4byte 0x0000121F
_0811F7DC: .4byte 0x00002BDE
_0811F7E0: .4byte 0x00002BE0
_0811F7E4: .4byte 0x00002E20
	thumb_func_end InitEasyChatPhrases

	thumb_func_start sub_0811F7E8
sub_0811F7E8: @ 0x0811F7E8
	push {r4, lr}
	ldr r4, _0811F804
	ldr r0, _0811F808
	bl Alloc
	str r0, [r4]
	cmp r0, #0
	beq _0811F80C
	bl sub_0811F830
	bl sub_0811F9C8
	movs r0, #1
	b _0811F80E
	.align 2, 0
_0811F804: .4byte 0x02039DEC
_0811F808: .4byte 0x00002CE8
_0811F80C:
	movs r0, #0
_0811F80E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811F7E8

	thumb_func_start sub_0811F814
sub_0811F814: @ 0x0811F814
	push {r4, lr}
	ldr r4, _0811F82C
	ldr r0, [r4]
	cmp r0, #0
	beq _0811F826
	bl Free
	movs r0, #0
	str r0, [r4]
_0811F826:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811F82C: .4byte 0x02039DEC
	thumb_func_end sub_0811F814

	thumb_func_start sub_0811F830
sub_0811F830: @ 0x0811F830
	push {r4, r5, lr}
	ldr r4, _0811F8FC
	ldr r0, [r4]
	movs r5, #0
	strh r5, [r0]
	movs r0, #0
	bl GetNationalPokedexCount
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0811F858
	ldr r0, [r4]
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xf
	adds r0, #2
	adds r0, r0, r1
	strh r5, [r0]
_0811F858:
	movs r3, #1
_0811F85A:
	ldr r0, [r4]
	ldrh r2, [r0]
	adds r1, r2, #1
	strh r1, [r0]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0xf
	adds r0, #2
	adds r0, r0, r2
	strh r3, [r0]
	adds r3, #1
	cmp r3, #0x10
	ble _0811F85A
	ldr r0, _0811F900
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811F8B4
	ldr r0, _0811F8FC
	ldr r2, [r0]
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r3, r2, #2
	adds r0, r3, r0
	movs r1, #0x11
	strh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r3, r0
	movs r1, #0x12
	strh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r3, r3, r0
	movs r0, #0x13
	strh r0, [r3]
_0811F8B4:
	ldr r0, _0811F904
	bl FlagGet
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811F8D6
	ldr r0, _0811F8FC
	ldr r0, [r0]
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xf
	adds r0, #2
	adds r0, r0, r1
	movs r1, #0x14
	strh r1, [r0]
_0811F8D6:
	bl IsNationalPokedexEnabled
	cmp r0, #0
	beq _0811F8F4
	ldr r0, _0811F8FC
	ldr r0, [r0]
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xf
	adds r0, #2
	adds r0, r0, r1
	movs r1, #0x15
	strh r1, [r0]
_0811F8F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811F8FC: .4byte 0x02039DEC
_0811F900: .4byte 0x00000864
_0811F904: .4byte 0x00000866
	thumb_func_end sub_0811F830

	thumb_func_start sub_0811F908
sub_0811F908: @ 0x0811F908
	ldr r0, _0811F910
	ldr r0, [r0]
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0811F910: .4byte 0x02039DEC
	thumb_func_end sub_0811F908

	thumb_func_start sub_0811F914
sub_0811F914: @ 0x0811F914
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0811F930
	ldr r1, [r0]
	ldrh r0, [r1]
	cmp r2, r0
	bhs _0811F934
	lsls r0, r2, #1
	adds r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _0811F936
	.align 2, 0
_0811F930: .4byte 0x02039DEC
_0811F934:
	movs r0, #0x16
_0811F936:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end sub_0811F914

	thumb_func_start unref_sub_811F3E0
unref_sub_811F3E0: @ 0x0811F93C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r0, _0811F97C
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl StringCopy
	adds r1, r0, #0
	subs r4, r1, r4
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	cmp r0, r5
	bhs _0811F970
	movs r2, #0
_0811F962:
	strb r2, [r1]
	adds r1, #1
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	blo _0811F962
_0811F970:
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811F97C: .4byte 0x08579ED8
	thumb_func_end unref_sub_811F3E0

	thumb_func_start GetEasyChatWordGroupName
GetEasyChatWordGroupName: @ 0x0811F980
	lsls r0, r0, #0x18
	ldr r1, _0811F98C
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0811F98C: .4byte 0x08579ED8
	thumb_func_end GetEasyChatWordGroupName

	thumb_func_start CopyEasyChatWordPadded
CopyEasyChatWordPadded: @ 0x0811F990
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	bl CopyEasyChatWord
	adds r1, r0, #0
	subs r4, r1, r4
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	cmp r0, r5
	bhs _0811F9BC
	movs r2, #0
_0811F9AE:
	strb r2, [r1]
	adds r1, #1
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r5
	blo _0811F9AE
_0811F9BC:
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end CopyEasyChatWordPadded

	thumb_func_start sub_0811F9C8
sub_0811F9C8: @ 0x0811F9C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r3, #0
_0811F9D6:
	ldr r2, _0811FA18
	lsls r1, r3, #3
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [sp]
	adds r1, r1, r2
	ldr r7, [r1]
	ldr r0, _0811FA1C
	ldr r1, [r0]
	lsls r2, r3, #1
	adds r1, #0x2e
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1]
	mov sl, r0
	movs r1, #0
	str r2, [sp, #4]
	adds r0, r3, #1
	str r0, [sp, #8]
	ldr r2, [sp]
	cmp r1, r2
	bge _0811FA88
_0811FA04:
	ldrh r0, [r7]
	ldr r2, _0811FA20
	cmp r0, r2
	bne _0811FA54
	adds r7, #2
	ldrh r4, [r7]
	adds r7, #2
	adds r0, r1, #1
	adds r1, r0, r4
	b _0811FA56
	.align 2, 0
_0811FA18: .4byte 0x08579D04
_0811FA1C: .4byte 0x02039DEC
_0811FA20: .4byte 0x0000FFFF
_0811FA24:
	ldr r0, _0811FA50
	ldr r2, [r0]
	mov r0, sl
	lsls r1, r0, #1
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x88
	adds r0, r0, r1
	ldrh r1, [r5]
	strh r1, [r0]
	movs r0, #1
	add sl, r0
	adds r2, #0x2e
	ldr r0, [sp, #4]
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0811FA7E
	.align 2, 0
_0811FA50: .4byte 0x02039DEC
_0811FA54:
	movs r4, #1
_0811FA56:
	movs r6, #0
	adds r1, #1
	mov sb, r1
	lsls r2, r4, #1
	mov r8, r2
	cmp r6, r4
	bge _0811FA7E
	adds r5, r7, #0
_0811FA66:
	ldrh r0, [r5]
	str r3, [sp, #0xc]
	bl sub_0811FDB4
	lsls r0, r0, #0x18
	ldr r3, [sp, #0xc]
	cmp r0, #0
	bne _0811FA24
	adds r5, #2
	adds r6, #1
	cmp r6, r4
	blt _0811FA66
_0811FA7E:
	add r7, r8
	mov r1, sb
	ldr r0, [sp]
	cmp r1, r0
	blt _0811FA04
_0811FA88:
	ldr r3, [sp, #8]
	cmp r3, #0x2c
	ble _0811F9D6
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0811F9C8

	thumb_func_start sub_0811FAA0
sub_0811FAA0: @ 0x0811FAA0
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r0, #0
	bne _0811FAB2
	adds r0, r1, #0
	bl sub_0811FB1C
	b _0811FAB8
_0811FAB2:
	adds r0, r1, #0
	bl sub_0811FC10
_0811FAB8:
	ldr r1, _0811FAC8
	ldr r1, [r1]
	ldr r2, _0811FACC
	adds r1, r1, r2
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811FAC8: .4byte 0x02039DEC
_0811FACC: .4byte 0x00002CE4
	thumb_func_end sub_0811FAA0

	thumb_func_start sub_0811FAD0
sub_0811FAD0: @ 0x0811FAD0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0811FAF0
	ldr r1, [r0]
	ldr r3, _0811FAF4
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r2, r0
	bhs _0811FAFC
	lsls r0, r2, #1
	ldr r2, _0811FAF8
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0811FAFE
	.align 2, 0
_0811FAF0: .4byte 0x02039DEC
_0811FAF4: .4byte 0x00002CE4
_0811FAF8: .4byte 0x00002AE4
_0811FAFC:
	ldr r0, _0811FB04
_0811FAFE:
	pop {r1}
	bx r1
	.align 2, 0
_0811FB04: .4byte 0x0000FFFF
	thumb_func_end sub_0811FAD0

	thumb_func_start sub_0811FB08
sub_0811FB08: @ 0x0811FB08
	ldr r0, _0811FB14
	ldr r0, [r0]
	ldr r1, _0811FB18
	adds r0, r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0811FB14: .4byte 0x02039DEC
_0811FB18: .4byte 0x00002CE4
	thumb_func_end sub_0811FB08

	thumb_func_start sub_0811FB1C
sub_0811FB1C: @ 0x0811FB1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _0811FB94
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	mov r8, r3
	cmp r2, #0
	beq _0811FB44
	cmp r2, #0x15
	beq _0811FB44
	cmp r2, #0x12
	beq _0811FB44
	cmp r2, #0x13
	bne _0811FBA4
_0811FB44:
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	movs r7, #0
	movs r5, #0
	cmp r5, r8
	bhs _0811FBF0
	movs r0, #0x7f
	ands r0, r2
	lsls r0, r0, #9
	mov sb, r0
	adds r4, r1, #0
	lsls r6, r2, #0x18
_0811FB5E:
	ldrh r0, [r4]
	lsrs r1, r6, #0x18
	bl sub_0811FCB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811FB88
	ldr r0, _0811FB98
	ldr r2, [r0]
	lsls r0, r5, #1
	ldr r1, _0811FB9C
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r4]
	ldr r3, _0811FBA0
	adds r1, r3, #0
	ands r0, r1
	mov r1, sb
	orrs r0, r1
	strh r0, [r2]
	adds r5, #1
_0811FB88:
	adds r4, #2
	adds r7, #1
	cmp r7, r8
	blo _0811FB5E
	b _0811FBF0
	.align 2, 0
_0811FB94: .4byte 0x08578D14
_0811FB98: .4byte 0x02039DEC
_0811FB9C: .4byte 0x00002AE4
_0811FBA0: .4byte 0x000001FF
_0811FBA4:
	ldr r1, [r0]
	movs r7, #0
	movs r5, #0
	cmp r5, r8
	bhs _0811FBF0
	movs r0, #0x7f
	ands r0, r2
	lsls r0, r0, #9
	mov sl, r0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	mov sb, r2
_0811FBBC:
	ldrh r4, [r6, #4]
	adds r0, r4, #0
	mov r2, sb
	lsrs r1, r2, #0x18
	bl sub_0811FCB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811FBE8
	ldr r0, _0811FC04
	ldr r1, [r0]
	lsls r0, r5, #1
	ldr r3, _0811FC08
	adds r1, r1, r3
	adds r1, r1, r0
	ldr r2, _0811FC0C
	adds r0, r2, #0
	ands r4, r0
	mov r3, sl
	orrs r4, r3
	strh r4, [r1]
	adds r5, #1
_0811FBE8:
	adds r6, #0xc
	adds r7, #1
	cmp r7, r8
	blo _0811FBBC
_0811FBF0:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811FC04: .4byte 0x02039DEC
_0811FC08: .4byte 0x00002AE4
_0811FC0C: .4byte 0x000001FF
	thumb_func_end sub_0811FB1C

	thumb_func_start sub_0811FC10
sub_0811FC10: @ 0x0811FC10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r4, #0
	movs r6, #0
	ldr r3, _0811FC78
	ldr r0, [r3]
	lsls r5, r1, #1
	adds r0, #0x2e
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r6, r0
	bhs _0811FC6C
	mov r8, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r7, r0, #4
	ldr r0, _0811FC7C
	mov ip, r0
_0811FC3A:
	mov r0, r8
	ldr r3, [r0]
	adds r1, r6, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #1
	mov r0, ip
	adds r2, r3, r0
	adds r2, r2, r1
	lsls r1, r4, #1
	adds r1, r1, r7
	adds r0, r3, #0
	adds r0, #0x88
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r3, #0x2e
	adds r3, r3, r5
	ldrh r3, [r3]
	cmp r4, r3
	blo _0811FC3A
_0811FC6C:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811FC78: .4byte 0x02039DEC
_0811FC7C: .4byte 0x00002AE4
	thumb_func_end sub_0811FC10

	thumb_func_start sub_0811FC80
sub_0811FC80: @ 0x0811FC80
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r0, _0811FCA4
	ldr r0, [r0]
	ldrh r1, [r0]
	cmp r2, r1
	bge _0811FCB0
	adds r4, r3, #0
	adds r3, r1, #0
	adds r1, r0, #2
_0811FC98:
	ldrh r0, [r1]
	cmp r0, r4
	bne _0811FCA8
	movs r0, #1
	b _0811FCB2
	.align 2, 0
_0811FCA4: .4byte 0x02039DEC
_0811FCA8:
	adds r1, #2
	adds r2, #1
	cmp r2, r3
	blt _0811FC98
_0811FCB0:
	movs r0, #0
_0811FCB2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_0811FC80

	thumb_func_start sub_0811FCB8
sub_0811FCB8: @ 0x0811FCB8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r2, #0x15
	bhi _0811FD6E
	lsls r0, r2, #2
	ldr r1, _0811FCD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811FCD0: .4byte 0x0811FCD4
_0811FCD4: @ jump table
	.4byte _0811FD2C @ case 0
	.4byte _0811FD6E @ case 1
	.4byte _0811FD6E @ case 2
	.4byte _0811FD6E @ case 3
	.4byte _0811FD6E @ case 4
	.4byte _0811FD6E @ case 5
	.4byte _0811FD6E @ case 6
	.4byte _0811FD6E @ case 7
	.4byte _0811FD6E @ case 8
	.4byte _0811FD6E @ case 9
	.4byte _0811FD6E @ case 10
	.4byte _0811FD6E @ case 11
	.4byte _0811FD6E @ case 12
	.4byte _0811FD6E @ case 13
	.4byte _0811FD6E @ case 14
	.4byte _0811FD6E @ case 15
	.4byte _0811FD6E @ case 16
	.4byte _0811FD6E @ case 17
	.4byte _0811FD5C @ case 18
	.4byte _0811FD5C @ case 19
	.4byte _0811FD60 @ case 20
	.4byte _0811FD42 @ case 21
_0811FD2C:
	adds r0, r4, #0
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl GetSetPokedexFlag
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811FD80
_0811FD42:
	adds r0, r4, #0
	bl GetFooterOptionXOffset
	cmp r0, #0
	beq _0811FD5C
	adds r0, r4, #0
	bl HoennToNationalOrder
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl GetSetPokedexFlag
_0811FD5C:
	movs r0, #1
	b _0811FD80
_0811FD60:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0811F478
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811FD80
_0811FD6E:
	ldr r1, _0811FD88
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
_0811FD80:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811FD88: .4byte 0x08578D14
	thumb_func_end sub_0811FCB8

	thumb_func_start GetFooterOptionXOffset
GetFooterOptionXOffset: @ 0x0811FD8C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r1, _0811FDA0
_0811FD96:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0811FDA4
	movs r0, #1
	b _0811FDAE
	.align 2, 0
_0811FDA0: .4byte 0x08579F34
_0811FDA4:
	adds r1, #2
	adds r2, #1
	cmp r2, #0
	beq _0811FD96
	movs r0, #0
_0811FDAE:
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetFooterOptionXOffset

	thumb_func_start sub_0811FDB4
sub_0811FDB4: @ 0x0811FDB4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x19
	lsls r0, r0, #7
	lsrs r4, r0, #0x17
	adds r0, r5, #0
	bl sub_0811FC80
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0811FDD8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0811FCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0811FDDA
_0811FDD8:
	movs r0, #0
_0811FDDA:
	pop {r4, r5}
	pop {r1}
	bx r1
	thumb_func_end sub_0811FDB4

	thumb_func_start InitializeEasyChatWordArray
InitializeEasyChatWordArray: @ 0x0811FDE0
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	ldr r0, _0811FE08
	adds r1, r1, r0
	lsrs r0, r1, #0x10
	ldr r1, _0811FE0C
	cmp r0, r1
	beq _0811FE02
	adds r3, r1, #0
_0811FDF4:
	strh r3, [r2]
	adds r2, #2
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bne _0811FDF4
_0811FE02:
	pop {r0}
	bx r0
	.align 2, 0
_0811FE08: .4byte 0xFFFF0000
_0811FE0C: .4byte 0x0000FFFF
	thumb_func_end InitializeEasyChatWordArray

	thumb_func_start sub_0811FE10
sub_0811FE10: @ 0x0811FE10
	push {lr}
	bl sub_0801AB30
	ldr r1, _0811FE28
	adds r2, r1, #0
	adds r1, r0, #6
_0811FE1C:
	strh r2, [r1]
	subs r1, #2
	cmp r1, r0
	bge _0811FE1C
	pop {r0}
	bx r0
	.align 2, 0
_0811FE28: .4byte 0x0000FFFF
	thumb_func_end sub_0811FE10

	thumb_func_start unref_sub_811BBF4
unref_sub_811BBF4: @ 0x0811FE2C
	ldr r1, _0811FE34
	str r0, [r1]
	bx lr
	.align 2, 0
_0811FE34: .4byte 0x02039DF0
	thumb_func_end unref_sub_811BBF4

