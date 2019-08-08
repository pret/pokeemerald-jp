.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start CableCarTask1
CableCarTask1: @ 0x0814FC4C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0814FC70
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0814FC6A
	ldr r0, _0814FC74
	bl SetMainCallback2
	adds r0, r4, #0
	bl DestroyTask
_0814FC6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814FC70: .4byte 0x02037C74
_0814FC74: .4byte 0x0814FCA5
	thumb_func_end CableCarTask1

	thumb_func_start CableCar
CableCar: @ 0x0814FC78
	push {lr}
	sub sp, #4
	bl ScriptContext2_Enable
	ldr r0, _0814FCA0
	movs r1, #1
	bl CreateTask
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0814FCA0: .4byte 0x0814FC4D
	thumb_func_end CableCar

	thumb_func_start CableCarMainCallback_Setup
CableCarMainCallback_Setup: @ 0x0814FCA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	movs r4, #0
	str r4, [sp, #0x14]
	ldr r1, _0814FCCC
	movs r2, #0x87
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #9
	bhi _0814FCFC
	lsls r0, r0, #2
	ldr r1, _0814FCD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814FCCC: .4byte 0x03002360
_0814FCD0: .4byte 0x0814FCD4
_0814FCD4: @ jump table
	.4byte _0814FCFC @ case 0
	.4byte _0814FDB4 @ case 1
	.4byte _0814FE6C @ case 2
	.4byte _0814FF2C @ case 3
	.4byte _0814FF58 @ case 4
	.4byte _0814FF74 @ case 5
	.4byte _0814FFD4 @ case 6
	.4byte _0815006C @ case 7
	.4byte _0815016C @ case 8
	.4byte _081501A4 @ case 9
_0814FCFC:
	movs r0, #0
	bl SetVBlankCallback
	movs r0, #0
	bl sub_08150B48
	bl ScanlineEffect_Stop
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #9
	add r0, sp, #0x10
	mov sb, r0
	add r2, sp, #0xc
	movs r6, #0
	ldr r1, _0814FDA0
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _0814FDA4
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov r8, r0
_0814FD2A:
	strh r6, [r2]
	add r0, sp, #0xc
	str r0, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, r3, r5
	subs r4, r4, r5
	cmp r4, r5
	bhi _0814FD2A
	strh r6, [r2]
	add r2, sp, #0xc
	str r2, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r3, r8
	orrs r0, r3
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #0x10]
	ldr r2, _0814FDA0
	mov r1, sb
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	add r0, sp, #0xc
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r4, _0814FDA8
	ldr r0, _0814FDAC
	bl AllocZeroed
	str r0, [r4]
	ldr r1, _0814FDB0
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0814FDA0: .4byte 0x040000D4
_0814FDA4: .4byte 0x81000800
_0814FDA8: .4byte 0x0203A878
_0814FDAC: .4byte 0x00004110
_0814FDB0: .4byte 0x03002360
_0814FDB4:
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl reset_temp_tile_data_buffers
	bl StartWeather
	movs r4, #0
	ldr r0, _0814FE48
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0xf0
	movs r2, #0
_0814FDD8:
	lsls r0, r4, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _0814FDD8
	bl InitMapMusic
	bl ResetMapMusic
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r1, _0814FE4C
	movs r0, #0
	movs r2, #4
	bl InitBgsFromTemplates
	ldr r4, _0814FE50
	ldr r1, [r4]
	adds r1, #0xfc
	movs r0, #0
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r3, _0814FE54
	adds r1, r1, r3
	movs r0, #1
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r0, _0814FE58
	adds r1, r1, r0
	movs r0, #2
	bl SetBgTilemapBuffer
	ldr r1, [r4]
	ldr r2, _0814FE5C
	adds r1, r1, r2
	movs r0, #3
	bl SetBgTilemapBuffer
	ldr r2, _0814FE60
	ldr r1, _0814FE64
	movs r0, #0
	strh r0, [r1]
	strh r0, [r2]
	ldr r1, _0814FE68
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0814FE48: .4byte 0x08526DE8
_0814FE4C: .4byte 0x085AC474
_0814FE50: .4byte 0x0203A878
_0814FE54: .4byte 0x000010FC
_0814FE58: .4byte 0x000020FC
_0814FE5C: .4byte 0x000030FC
_0814FE60: .4byte 0x02021B38
_0814FE64: .4byte 0x02021B3A
_0814FE68: .4byte 0x03002360
_0814FE6C:
	movs r4, #0
	add r5, sp, #0x14
	ldr r6, _0814FEF4
_0814FE72:
	lsls r0, r4, #3
	adds r0, r0, r6
	bl LoadCompressedSpriteSheet
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0814FE72
	ldr r0, _0814FEF8
	bl LoadSpritePalettes
	ldr r0, _0814FEFC
	adds r1, r5, #0
	bl malloc_and_decompress
	ldr r4, _0814FF00
	ldr r1, [r4]
	ldr r2, _0814FF04
	adds r1, r1, r2
	str r0, [r1]
	ldr r0, _0814FF08
	adds r1, r5, #0
	bl malloc_and_decompress
	ldr r1, [r4]
	movs r3, #0x82
	lsls r3, r3, #7
	adds r1, r1, r3
	str r0, [r1]
	ldr r0, _0814FF0C
	adds r1, r5, #0
	bl malloc_and_decompress
	ldr r1, [r4]
	ldr r2, _0814FF10
	adds r1, r1, r2
	str r0, [r1]
	ldr r0, _0814FF14
	adds r1, r5, #0
	bl malloc_and_decompress
	ldr r1, [r4]
	ldr r3, _0814FF18
	adds r2, r1, r3
	str r0, [r2]
	ldr r0, _0814FF1C
	adds r1, r1, r0
	ldr r0, _0814FF20
	str r0, [r1]
	ldr r1, _0814FF24
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0
	bl decompress_and_copy_tile_data_to_vram
	ldr r1, _0814FF28
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0814FEF4: .4byte 0x085AC95C
_0814FEF8: .4byte 0x085AC97C
_0814FEFC: .4byte 0x085AC484
_0814FF00: .4byte 0x0203A878
_0814FF04: .4byte 0x000040FC
_0814FF08: .4byte 0x085AC5DC
_0814FF0C: .4byte 0x085AC760
_0814FF10: .4byte 0x00004104
_0814FF14: .4byte 0x085AC938
_0814FF18: .4byte 0x0000410C
_0814FF1C: .4byte 0x00004108
_0814FF20: .4byte 0x085AC924
_0814FF24: .4byte 0x08DBA860
_0814FF28: .4byte 0x03002360
_0814FF2C:
	bl free_temp_tile_data_buffers_if_possible
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0814FF38
	b _08150202
_0814FF38:
	ldr r0, _0814FF50
	movs r1, #0
	movs r2, #0x80
	bl LoadPalette
	ldr r1, _0814FF54
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0814FF50: .4byte 0x08DBA7C0
_0814FF54: .4byte 0x03002360
_0814FF58:
	bl LoadCableCarSprites
	bl RunTasks
	ldr r1, _0814FF70
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0814FF70: .4byte 0x03002360
_0814FF74:
	ldr r0, _0814FF8C
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #7
	bne _0814FF90
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0814FF8C: .4byte 0x0203A878
_0814FF90:
	ldr r0, _0814FFD0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0xf0
	ldr r0, [r1]
	cmp r0, #0
	bne _0814FFA0
	b _08150202
_0814FFA0:
	movs r4, #0
	adds r3, r1, #0
	movs r5, #0xd
	rsbs r5, r5, #0
_0814FFA8:
	lsls r0, r4, #2
	adds r0, r3, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _0814FFBA
	ldrb r1, [r2, #5]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2, #5]
_0814FFBA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _0814FFA8
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r6, r3
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0814FFD0: .4byte 0x08526DE8
_0814FFD4:
	ldr r6, _08150058
	ldr r0, [r6]
	movs r1, #0x82
	lsls r1, r1, #7
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r5, #0x11
	str r5, [sp, #8]
	movs r0, #1
	movs r2, #0
	movs r3, #0x11
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r0, [r6]
	ldr r2, _0815005C
	adds r0, r0, r2
	ldr r1, [r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r3, #0x14
	mov r8, r3
	str r3, [sp, #4]
	str r5, [sp, #8]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r0, [r6]
	ldr r1, _08150060
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #5
	str r0, [sp]
	movs r4, #2
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r0, [r6]
	ldr r2, _08150064
	adds r0, r0, r2
	ldr r1, [r0]
	str r4, [sp]
	mov r3, r8
	str r3, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r2, #0
	movs r3, #2
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r1, _08150068
	movs r0, #0x87
	lsls r0, r0, #3
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_08150058: .4byte 0x0203A878
_0815005C: .4byte 0x00004104
_08150060: .4byte 0x00004108
_08150064: .4byte 0x0000410C
_08150068: .4byte 0x03002360
_0815006C:
	ldr r0, _0815015C
	ldrb r0, [r0]
	bl sub_081514A4
	ldr r1, _08150160
	mov sb, r1
	ldr r0, [r1]
	ldr r2, _08150164
	mov r8, r2
	add r0, r8
	ldr r1, [r0]
	adds r1, #0x90
	movs r6, #0xc
	str r6, [sp]
	movs r5, #3
	str r5, [sp, #4]
	movs r4, #0x11
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0
	movs r3, #0xe
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r3, sb
	ldr r0, [r3]
	add r0, r8
	ldr r1, [r0]
	adds r1, #0xd8
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0xc
	movs r3, #0x11
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r1, sb
	ldr r0, [r1]
	add r0, r8
	ldr r1, [r0]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r1, r2
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0x18
	movs r3, #0x14
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r3, sb
	ldr r0, [r3]
	add r0, r8
	ldr r1, [r0]
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0
	movs r3, #0x11
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r1, sb
	ldr r0, [r1]
	add r0, r8
	ldr r1, [r0]
	adds r1, #0x48
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0
	movs r3, #0x14
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r2, sb
	ldr r0, [r2]
	add r0, r8
	ldr r1, [r0]
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0xc
	movs r3, #0x14
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r3, sb
	ldr r0, [r3]
	add r0, r8
	ldr r1, [r0]
	adds r1, #0x48
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0xc
	movs r3, #0x17
	bl CopyToBgTilemapBufferRect_ChangePalette
	mov r1, sb
	ldr r0, [r1]
	add r0, r8
	ldr r1, [r0]
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r2, #0x18
	movs r3, #0x17
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r1, _08150168
	movs r2, #0x87
	lsls r2, r2, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0815015C: .4byte 0x02037280
_08150160: .4byte 0x0203A878
_08150164: .4byte 0x000040FC
_08150168: .4byte 0x03002360
_0815016C:
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x10
	movs r3, #0
	bl BeginNormalPaletteFade
	ldr r0, _0815019C
	movs r1, #1
	bl FadeInNewBGM
	movs r0, #1
	bl sub_08150B48
	ldr r1, _081501A0
	movs r3, #0x87
	lsls r3, r3, #3
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	b _08150200
	.align 2, 0
_0815019C: .4byte 0x000001A9
_081501A0: .4byte 0x03002360
_081501A4:
	ldr r3, _081501D8
	ldrh r2, [r3]
	movs r0, #0
	strh r0, [r3]
	ldr r4, _081501DC
	ldrh r0, [r4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _081501E0
	bl SetVBlankCallback
	ldr r0, _081501E4
	bl SetMainCallback2
	ldr r0, _081501E8
	movs r1, #0
	bl CreateTask
	ldr r0, _081501EC
	ldrh r0, [r0]
	cmp r0, #0
	bne _081501F4
	ldr r0, _081501F0
	b _081501F6
	.align 2, 0
_081501D8: .4byte 0x04000208
_081501DC: .4byte 0x04000200
_081501E0: .4byte 0x081507DD
_081501E4: .4byte 0x08150219
_081501E8: .4byte 0x081503C1
_081501EC: .4byte 0x02037280
_081501F0: .4byte 0x0815052D
_081501F4:
	ldr r0, _08150210
_081501F6:
	movs r1, #1
	bl CreateTask
	ldr r1, _08150214
	ldr r1, [r1]
_08150200:
	strb r0, [r1]
_08150202:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08150210: .4byte 0x08150641
_08150214: .4byte 0x0203A878
	thumb_func_end CableCarMainCallback_Setup

	thumb_func_start CableCarMainCallback_Run
CableCarMainCallback_Run: @ 0x08150218
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl MapMusicMain
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end CableCarMainCallback_Run

	thumb_func_start CleanupCableCar
CleanupCableCar: @ 0x08150234
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r4, #0
	movs r0, #0
	bl HideBg
	movs r0, #1
	bl HideBg
	movs r0, #2
	bl HideBg
	movs r0, #3
	bl HideBg
	movs r0, #0
	bl sub_08150B48
	ldr r0, _08150394
	strh r4, [r0]
	movs r0, #0
	bl SetCurrentAndNextWeatherNoDelay
	add r0, sp, #4
	mov r8, r0
	ldr r0, _08150398
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0xf0
	movs r2, #0
_08150274:
	lsls r0, r4, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _08150274
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	movs r0, #0
	bl UnsetBgTilemapBuffer
	movs r0, #1
	bl UnsetBgTilemapBuffer
	movs r0, #2
	bl UnsetBgTilemapBuffer
	movs r0, #3
	bl UnsetBgTilemapBuffer
	movs r0, #0
	bl ResetBgsAndClearDma3BusyFlags
	ldr r6, _0815039C
	ldr r0, [r6]
	ldr r2, _081503A0
	adds r1, r0, r2
	movs r5, #0
	str r5, [r1]
	ldr r4, _081503A4
	adds r0, r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r4, r0, r4
	str r5, [r4]
	ldr r4, _081503A8
	adds r0, r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r4, r0, r4
	str r5, [r4]
	movs r4, #0x82
	lsls r4, r4, #7
	adds r0, r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r4, r0, r4
	str r5, [r4]
	ldr r4, _081503AC
	adds r0, r0, r4
	ldr r0, [r0]
	bl Free
	ldr r0, [r6]
	adds r4, r0, r4
	str r5, [r4]
	bl Free
	str r5, [r6]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	movs r3, #0xc0
	lsls r3, r3, #9
	mov r4, sp
	movs r6, #0
	ldr r1, _081503B0
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r7, _081503B4
	movs r0, #0x81
	lsls r0, r0, #0x18
	mov ip, r0
_0815031C:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, r2, r5
	subs r3, r3, r5
	cmp r3, r5
	bhi _0815031C
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	lsrs r0, r3, #1
	mov r2, ip
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	movs r3, #0x80
	lsls r3, r3, #3
	movs r4, #0
	str r4, [sp, #4]
	ldr r2, _081503B0
	mov r1, r8
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r3, #2
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r3, r3, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r3, r0
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	bl WarpIntoMap
	ldr r0, _081503B8
	str r4, [r0]
	ldr r0, _081503BC
	bl SetMainCallback2
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08150394: .4byte 0x02021B38
_08150398: .4byte 0x08526DE8
_0815039C: .4byte 0x0203A878
_081503A0: .4byte 0x00004108
_081503A4: .4byte 0x0000410C
_081503A8: .4byte 0x00004104
_081503AC: .4byte 0x000040FC
_081503B0: .4byte 0x040000D4
_081503B4: .4byte 0x81000800
_081503B8: .4byte 0x03005B0C
_081503BC: .4byte 0x08085935
	thumb_func_end CleanupCableCar

	thumb_func_start sub_081503C0
sub_081503C0: @ 0x081503C0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	ldr r5, _081503EC
	ldr r3, [r5]
	ldrh r0, [r3, #6]
	adds r0, #1
	strh r0, [r3, #6]
	ldrb r2, [r3, #1]
	adds r7, r5, #0
	cmp r2, #2
	beq _081504C6
	cmp r2, #2
	bgt _081503F0
	cmp r2, #0
	beq _081503FE
	cmp r2, #1
	beq _08150418
	b _0815051E
	.align 2, 0
_081503EC: .4byte 0x0203A878
_081503F0:
	cmp r2, #3
	bne _081503F6
	b _081504EC
_081503F6:
	cmp r2, #0xff
	bne _081503FC
	b _08150504
_081503FC:
	b _0815051E
_081503FE:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r3, #4]
	cmp r0, r1
	beq _0815040A
	b _0815051E
_0815040A:
	ldrb r0, [r3, #2]
	bl SetNextWeather
	ldr r1, [r5]
	movs r0, #1
	strb r0, [r1, #1]
	b _0815051E
_08150418:
	ldrb r0, [r3, #2]
	cmp r0, #2
	beq _0815046C
	cmp r0, #7
	beq _08150424
	b _0815051E
_08150424:
	ldr r0, _08150468
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0xf0
	ldr r0, [r2]
	cmp r0, #0
	beq _0815051E
	ldrb r1, [r0, #5]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0815051E
	adds r3, r2, #0
	movs r5, #0xd
	rsbs r5, r5, #0
_08150442:
	lsls r0, r4, #2
	adds r0, r3, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _08150454
	ldrb r1, [r2, #5]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2, #5]
_08150454:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _08150442
	ldr r1, [r7]
	movs r0, #2
	strb r0, [r1, #1]
	b _0815051E
	.align 2, 0
_08150468: .4byte 0x08526DE8
_0815046C:
	ldr r0, _08150480
	ldr r2, [r0]
	movs r1, #0xda
	lsls r1, r1, #3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08150484
	strb r0, [r3, #1]
	b _0815051E
	.align 2, 0
_08150480: .4byte 0x08526DE8
_08150484:
	ldrh r1, [r3, #6]
	ldrh r0, [r3, #4]
	adds r0, #8
	cmp r1, r0
	blt _0815051E
	adds r6, r2, #0
	adds r6, #0xf0
	movs r5, #1
	movs r7, #5
	rsbs r7, r7, #0
_08150498:
	lsls r0, r4, #2
	adds r0, r6, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _081504BA
	adds r3, r0, #0
	adds r3, #0x3e
	ldrb r2, [r3]
	lsls r1, r2, #0x1d
	lsrs r1, r1, #0x1f
	eors r1, r5
	ands r1, r5
	lsls r1, r1, #2
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_081504BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _08150498
	b _0815051E
_081504C6:
	lsls r1, r0, #0x10
	ldr r0, _081504E8
	cmp r1, r0
	bne _0815051E
	movs r0, #3
	strb r0, [r3, #1]
	subs r0, #4
	str r4, [sp]
	movs r1, #3
	movs r2, #0
	movs r3, #0x10
	bl BeginNormalPaletteFade
	movs r0, #4
	bl FadeOutBGMTemporarily
	b _0815051E
	.align 2, 0
_081504E8: .4byte 0x023A0000
_081504EC:
	ldr r0, _08150500
	ldrb r1, [r0, #7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0815051E
	movs r0, #0xff
	strb r0, [r3, #1]
	b _0815051E
	.align 2, 0
_08150500: .4byte 0x02037C74
_08150504:
	movs r0, #0
	bl SetVBlankCallback
	adds r0, r6, #0
	bl DestroyTask
	ldr r0, [r5]
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, _08150528
	bl SetMainCallback2
_0815051E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08150528: .4byte 0x08150235
	thumb_func_end sub_081503C0

	thumb_func_start sub_0815052C
sub_0815052C: @ 0x0815052C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _08150580
	ldr r1, [r6]
	ldrb r0, [r1, #1]
	cmp r0, #0xff
	beq _0815060C
	ldrb r0, [r1, #0x14]
	subs r0, #1
	strb r0, [r1, #0x14]
	ldr r1, [r6]
	ldrh r0, [r1, #6]
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	bne _08150552
	ldrb r0, [r1, #0x15]
	subs r0, #1
	strb r0, [r1, #0x15]
_08150552:
	ldr r2, [r6]
	ldrh r0, [r2, #6]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0815056C
	ldrb r0, [r2, #0xc]
	subs r0, #1
	strb r0, [r2, #0xc]
	ldr r1, [r6]
	ldrb r0, [r1, #0xd]
	subs r0, #1
	strb r0, [r1, #0xd]
_0815056C:
	ldr r0, [r6]
	ldrb r1, [r0, #0x14]
	cmp r1, #0x20
	beq _081505B8
	cmp r1, #0x20
	bgt _08150584
	cmp r1, #0x10
	beq _081505D0
	b _0815060C
	.align 2, 0
_08150580: .4byte 0x0203A878
_08150584:
	cmp r1, #0x28
	beq _081505A6
	cmp r1, #0xaf
	bne _0815060C
	movs r0, #2
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x16
	bl FillBgTilemapBufferRect
	b _0815060C
_081505A6:
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #3
	b _081505C8
_081505B8:
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #2
_081505C8:
	movs r3, #0
	bl FillBgTilemapBufferRect
	b _0815060C
_081505D0:
	ldr r1, _08150634
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #5
	str r0, [sp]
	movs r4, #2
	str r4, [sp, #4]
	movs r5, #0x11
	str r5, [sp, #8]
	movs r0, #3
	movs r2, #0
	movs r3, #0
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r0, [r6]
	ldr r1, _08150638
	adds r0, r0, r1
	ldr r1, [r0]
	str r4, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r2, #0
	movs r3, #2
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r1, [r6]
	movs r0, #0x40
	strb r0, [r1, #0x15]
_0815060C:
	bl sub_08151138
	ldr r3, _0815063C
	movs r0, #0
	ldrsh r2, [r3, r0]
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _08150622
	adds r0, r2, #0
	adds r0, #0x80
_08150622:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r0, r1, r0
	strh r0, [r3]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08150634: .4byte 0x00004108
_08150638: .4byte 0x0000410C
_0815063C: .4byte 0x02021B38
	thumb_func_end sub_0815052C

	thumb_func_start sub_08150640
sub_08150640: @ 0x08150640
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r7, _08150694
	ldr r1, [r7]
	ldrb r0, [r1, #1]
	cmp r0, #0xff
	bne _08150650
	b _08150792
_08150650:
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r1, [r7]
	ldrh r0, [r1, #6]
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne _08150668
	ldrb r0, [r1, #0x15]
	adds r0, #1
	strb r0, [r1, #0x15]
_08150668:
	ldr r2, [r7]
	ldrh r0, [r2, #6]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _08150682
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	ldr r1, [r7]
	ldrb r0, [r1, #0xd]
	adds r0, #1
	strb r0, [r1, #0xd]
_08150682:
	ldr r0, [r7]
	ldrb r1, [r0, #0x14]
	cmp r1, #0x20
	beq _081506F6
	cmp r1, #0x20
	bgt _08150698
	cmp r1, #0x10
	beq _081506C4
	b _08150792
	.align 2, 0
_08150694: .4byte 0x0203A878
_08150698:
	cmp r1, #0x28
	beq _08150760
	cmp r1, #0xb0
	bne _08150792
	ldr r1, _081506C0
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #2
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #3
	movs r2, #0
	movs r3, #2
	bl CopyToBgTilemapBufferRect_ChangePalette
	b _08150792
	.align 2, 0
_081506C0: .4byte 0x0000410C
_081506C4:
	movs r0, #3
	str r0, [sp]
	movs r4, #2
	str r4, [sp, #4]
	movs r5, #0x11
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #2
	movs r3, #0
	bl FillBgTilemapBufferRect
	str r4, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x16
	bl FillBgTilemapBufferRect
	ldr r1, [r7]
	movs r0, #0xc0
	strb r0, [r1, #0x15]
	b _08150792
_081506F6:
	ldr r5, _0815075C
	adds r0, r0, r5
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	str r6, [sp]
	str r6, [sp, #4]
	movs r4, #0x11
	str r4, [sp, #8]
	movs r0, #3
	movs r2, #2
	movs r3, #0
	bl FillBgTilemapBufferRect
	ldr r0, [r7]
	adds r0, r0, r5
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	str r6, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r2, #3
	movs r3, #0
	bl FillBgTilemapBufferRect
	ldr r0, [r7]
	adds r0, r0, r5
	ldr r0, [r0]
	ldrh r1, [r0, #0xe]
	str r6, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r2, #2
	movs r3, #1
	bl FillBgTilemapBufferRect
	ldr r0, [r7]
	adds r0, r0, r5
	ldr r0, [r0]
	ldrh r1, [r0, #0x10]
	str r6, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r2, #3
	movs r3, #1
	bl FillBgTilemapBufferRect
	b _08150792
	.align 2, 0
_0815075C: .4byte 0x00004108
_08150760:
	ldr r5, _081507AC
	adds r0, r0, r5
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	str r6, [sp]
	str r6, [sp, #4]
	movs r4, #0x11
	str r4, [sp, #8]
	movs r0, #3
	movs r2, #4
	movs r3, #0
	bl FillBgTilemapBufferRect
	ldr r0, [r7]
	adds r0, r0, r5
	ldr r0, [r0]
	ldrh r1, [r0, #0x12]
	str r6, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	movs r0, #3
	movs r2, #4
	movs r3, #1
	bl FillBgTilemapBufferRect
_08150792:
	bl sub_08151194
	ldr r0, _081507B0
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	ldrh r1, [r1, #4]
	cmp r0, r1
	bhs _081507B8
	ldr r4, _081507B4
	movs r1, #0
	ldrsh r0, [r4, r1]
	b _081507C2
	.align 2, 0
_081507AC: .4byte 0x00004108
_081507B0: .4byte 0x0203A878
_081507B4: .4byte 0x02021B38
_081507B8:
	ldr r0, _081507D4
	ldr r4, [r0]
	ldr r0, _081507D8
	adds r4, r4, r0
	ldrh r0, [r4]
_081507C2:
	adds r0, #0xf7
	movs r1, #0xf8
	bl __modsi3
	strh r0, [r4]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_081507D4: .4byte 0x08526DE8
_081507D8: .4byte 0x000006FC
	thumb_func_end sub_08150640

	thumb_func_start CableCarVblankCallback
CableCarVblankCallback: @ 0x081507DC
	push {r4, lr}
	movs r0, #0
	bl CopyBgTilemapBufferToVram
	movs r0, #3
	bl CopyBgTilemapBufferToVram
	ldr r4, _0815083C
	ldr r0, [r4]
	ldrb r1, [r0, #0x14]
	movs r0, #0x1c
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #0x15]
	movs r0, #0x1e
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #0xc]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #0xd]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #8]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #9]
	movs r0, #0x12
	bl SetGpuReg
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0815083C: .4byte 0x0203A878
	thumb_func_end CableCarVblankCallback

	thumb_func_start nullsub_58
nullsub_58: @ 0x08150840
	bx lr
	.align 2, 0
	thumb_func_end nullsub_58

	thumb_func_start sub_08150844
sub_08150844: @ 0x08150844
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _081508AC
	ldr r6, [r0]
	ldrb r0, [r6, #1]
	cmp r0, #0xff
	beq _08150910
	ldr r0, _081508B0
	ldrh r0, [r0]
	cmp r0, #0
	bne _081508C0
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _0815086E
	ldr r1, _081508B4
	bl __addsf3
_0815086E:
	ldr r1, _081508B8
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x2e]
	subs r1, r1, r0
	strh r1, [r5, #0x20]
	movs r1, #6
	ldrsh r4, [r6, r1]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _08150896
	ldr r1, _081508B4
	bl __addsf3
_08150896:
	ldr r1, _081508BC
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x30]
	subs r1, r1, r0
	strh r1, [r5, #0x22]
	b _08150910
	.align 2, 0
_081508AC: .4byte 0x0203A878
_081508B0: .4byte 0x02037280
_081508B4: .4byte 0x47800000
_081508B8: .4byte 0x3E0F5C29
_081508BC: .4byte 0x3D89374C
_081508C0:
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _081508D4
	ldr r1, _08150918
	bl __addsf3
_081508D4:
	ldr r1, _0815091C
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _081508FC
	ldr r1, _08150918
	bl __addsf3
_081508FC:
	ldr r1, _08150920
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x30]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
_08150910:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08150918: .4byte 0x47800000
_0815091C: .4byte 0x3E0F5C29
_08150920: .4byte 0x3D89374C
	thumb_func_end sub_08150844

	thumb_func_start sub_08150924
sub_08150924: @ 0x08150924
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08150990
	ldr r6, [r0]
	ldrb r0, [r6, #1]
	cmp r0, #0xff
	bne _08150934
	b _08150A3C
_08150934:
	ldr r0, _08150994
	ldrh r0, [r0]
	cmp r0, #0
	bne _081509A4
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _08150950
	ldr r1, _08150998
	bl __addsf3
_08150950:
	ldr r1, _0815099C
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x2e]
	subs r1, r1, r0
	strh r1, [r5, #0x20]
	movs r1, #6
	ldrsh r4, [r6, r1]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _08150978
	ldr r1, _08150998
	bl __addsf3
_08150978:
	ldr r1, _081509A0
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x30]
	subs r1, r1, r0
	strh r1, [r5, #0x22]
	b _081509F4
	.align 2, 0
_08150990: .4byte 0x0203A878
_08150994: .4byte 0x02037280
_08150998: .4byte 0x47800000
_0815099C: .4byte 0x3E0F5C29
_081509A0: .4byte 0x3D89374C
_081509A4:
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _081509B8
	ldr r1, _08150A18
	bl __addsf3
_081509B8:
	ldr r1, _08150A1C
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r0, r4, #0
	bl __floatsisf
	cmp r4, #0
	bge _081509E0
	ldr r1, _08150A18
	bl __addsf3
_081509E0:
	ldr r1, _08150A20
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5, #0x30]
	adds r0, r0, r1
	strh r0, [r5, #0x22]
_081509F4:
	movs r0, #0x32
	ldrsh r2, [r5, r0]
	cmp r2, #0
	bne _08150A24
	movs r0, #0x11
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #0x34]
	adds r1, r0, #1
	strh r1, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08150A3C
	strh r2, [r5, #0x34]
	ldrh r0, [r5, #0x32]
	adds r0, #1
	strh r0, [r5, #0x32]
	b _08150A3C
	.align 2, 0
_08150A18: .4byte 0x47800000
_08150A1C: .4byte 0x3E0F5C29
_08150A20: .4byte 0x3D89374C
_08150A24:
	movs r2, #0
	movs r0, #0x10
	strh r0, [r5, #0x26]
	ldrh r0, [r5, #0x34]
	adds r1, r0, #1
	strh r1, [r5, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08150A3C
	strh r2, [r5, #0x34]
	strh r2, [r5, #0x32]
_08150A3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08150924

	thumb_func_start sub_08150A44
sub_08150A44: @ 0x08150A44
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _08150A74
	adds r0, r2, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldrh r3, [r2, #0x20]
	adds r0, r0, r3
	strh r0, [r2, #0x20]
	ldrh r1, [r2, #0x22]
	adds r1, #0x10
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0x22]
_08150A74:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08150ACA
	movs r0, #0x30
	ldrsh r1, [r2, r0]
	cmp r1, #0
	beq _08150A94
	cmp r1, #1
	beq _08150A9E
	b _08150ABC
_08150A94:
	ldrh r0, [r2, #0x20]
	adds r0, #1
	strh r0, [r2, #0x20]
	ldrh r0, [r2, #0x2e]
	b _08150AAE
_08150A9E:
	ldrh r0, [r2, #0x2e]
	ands r0, r1
	cmp r0, #0
	beq _08150ABC
	ldrh r0, [r2, #0x20]
	adds r0, #1
	strh r0, [r2, #0x20]
	ldrh r0, [r2, #0x20]
_08150AAE:
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08150ABC
	ldrh r0, [r2, #0x22]
	adds r0, #1
	strh r0, [r2, #0x22]
_08150ABC:
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	cmp r0, #0xa0
	ble _08150ACA
	adds r0, r2, #0
	bl DestroySprite
_08150ACA:
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_08150A44

	thumb_func_start sub_08150AD0
sub_08150AD0: @ 0x08150AD0
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _08150AEE
	ldrh r1, [r2, #0x22]
	adds r1, #0x10
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0x22]
_08150AEE:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08150B44
	movs r0, #0x30
	ldrsh r1, [r2, r0]
	cmp r1, #0
	beq _08150B0E
	cmp r1, #1
	beq _08150B18
	b _08150B36
_08150B0E:
	ldrh r0, [r2, #0x20]
	subs r0, #1
	strh r0, [r2, #0x20]
	ldrh r0, [r2, #0x2e]
	b _08150B28
_08150B18:
	ldrh r0, [r2, #0x2e]
	ands r0, r1
	cmp r0, #0
	beq _08150B36
	ldrh r0, [r2, #0x20]
	subs r0, #1
	strh r0, [r2, #0x20]
	ldrh r0, [r2, #0x20]
_08150B28:
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08150B36
	ldrh r0, [r2, #0x22]
	subs r0, #1
	strh r0, [r2, #0x22]
_08150B36:
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _08150B44
	adds r0, r2, #0
	bl DestroySprite
_08150B44:
	pop {r0}
	bx r0
	thumb_func_end sub_08150AD0

	thumb_func_start sub_08150B48
sub_08150B48: @ 0x08150B48
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08150B56
	cmp r0, #1
	beq _08150BF8
_08150B56:
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x42
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x46
	movs r1, #0
	bl SetGpuReg
	movs r0, #0
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xe
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xc
	movs r1, #0
	bl SetGpuReg
	movs r0, #0xa
	movs r1, #0
	bl SetGpuReg
	movs r0, #8
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1c
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1e
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x14
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x16
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x10
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x12
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x50
	movs r1, #0
	bl SetGpuReg
	b _08150CF8
_08150BF8:
	movs r0, #0x48
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x4a
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x40
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x42
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x44
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x46
	movs r1, #0
	bl SetGpuReg
	ldr r0, _08150C48
	ldrh r3, [r0]
	cmp r3, #0
	bne _08150C50
	ldr r1, _08150C4C
	ldr r2, [r1]
	movs r0, #0xb0
	strb r0, [r2, #0x14]
	ldr r2, [r1]
	movs r0, #0x10
	strb r0, [r2, #0x15]
	ldr r0, [r1]
	strb r3, [r0, #0xc]
	ldr r2, [r1]
	movs r0, #0x50
	b _08150C68
	.align 2, 0
_08150C48: .4byte 0x02037280
_08150C4C: .4byte 0x0203A878
_08150C50:
	ldr r1, _08150D00
	ldr r2, [r1]
	movs r3, #0
	movs r0, #0x60
	strb r0, [r2, #0x14]
	ldr r2, [r1]
	movs r0, #0xe8
	strb r0, [r2, #0x15]
	ldr r0, [r1]
	strb r3, [r0, #0xc]
	ldr r2, [r1]
	movs r0, #4
_08150C68:
	strb r0, [r2, #0xd]
	ldr r0, [r1]
	strb r3, [r0, #9]
	ldr r0, [r1]
	strb r3, [r0, #9]
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r1, [r0, #0x14]
	movs r0, #0x1c
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #0x15]
	movs r0, #0x1e
	bl SetGpuReg
	movs r0, #0x18
	movs r1, #0
	bl SetGpuReg
	movs r0, #0x1a
	movs r1, #0
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #0xc]
	movs r0, #0x14
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #0xd]
	movs r0, #0x16
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #8]
	movs r0, #0x10
	bl SetGpuReg
	ldr r0, [r4]
	ldrb r1, [r0, #9]
	movs r0, #0x12
	bl SetGpuReg
	movs r1, #0x82
	lsls r1, r1, #5
	movs r0, #0
	bl SetGpuReg
	movs r0, #1
	bl CopyBgTilemapBufferToVram
	movs r0, #2
	bl CopyBgTilemapBufferToVram
	movs r0, #0
	bl ShowBg
	movs r0, #1
	bl ShowBg
	movs r0, #2
	bl ShowBg
	movs r0, #3
	bl ShowBg
	movs r1, #0xfc
	lsls r1, r1, #6
	movs r0, #0x50
	bl SetGpuReg
_08150CF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08150D00: .4byte 0x0203A878
	thumb_func_end sub_08150B48

	thumb_func_start LoadCableCarSprites
LoadCableCarSprites: @ 0x08150D04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r1, _08150E18
	add r0, sp, #0xc
	movs r2, #2
	bl memcpy
	bl Random
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	add r6, sp, #0x10
	ldr r1, _08150E1C
	adds r0, r6, #0
	movs r2, #4
	bl memcpy
	add r5, sp, #0x14
	ldr r1, _08150E20
	adds r0, r5, #0
	movs r2, #8
	bl memcpy
	add r4, sp, #0x1c
	ldr r1, _08150E24
	adds r0, r4, #0
	movs r2, #4
	bl memcpy
	ldr r0, _08150E28
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	ldr r0, _08150E2C
	ldrh r0, [r0]
	mov r8, r6
	mov sl, r5
	cmp r0, #0
	beq _08150D62
	cmp r0, #1
	beq _08150E44
_08150D62:
	ldr r0, _08150E30
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	add r0, sp
	adds r0, #0xc
	ldrb r0, [r0]
	ldr r1, _08150E34
	movs r2, #0x66
	str r2, [sp]
	movs r2, #0xc8
	movs r3, #0x49
	bl AddPseudoEventObject
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08150DAC
	ldr r0, _08150E38
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #8
	orrs r0, r2
	strb r0, [r1, #5]
	movs r0, #8
	strh r0, [r1, #0x24]
	movs r0, #0x10
	strh r0, [r1, #0x26]
	movs r0, #0xc8
	strh r0, [r1, #0x2e]
	movs r0, #0x49
	strh r0, [r1, #0x30]
_08150DAC:
	ldr r4, _08150E3C
	adds r0, r4, #0
	movs r1, #0xb0
	movs r2, #0x2b
	movs r3, #0x67
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _08150E38
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x20
	strh r1, [r0, #0x26]
	strh r1, [r0, #0x24]
	movs r1, #0xb0
	strh r1, [r0, #0x2e]
	movs r1, #0x2b
	strh r1, [r0, #0x30]
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0xc8
	movs r2, #0x63
	movs r3, #0x65
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #8
	strh r1, [r0, #0x24]
	movs r1, #4
	strh r1, [r0, #0x26]
	movs r1, #0xc8
	strh r1, [r0, #0x2e]
	movs r1, #0x63
	strh r1, [r0, #0x30]
	ldr r2, _08150E40
	ldr r1, [r2]
	movs r0, #7
	strb r0, [r1, #2]
	ldr r1, [r2]
	movs r0, #0xaf
	lsls r0, r0, #1
	strh r0, [r1, #4]
	movs r0, #2
	bl SetCurrentAndNextWeatherNoDelay
	b _08150F16
	.align 2, 0
_08150E18: .4byte 0x085AC9EC
_08150E1C: .4byte 0x085AC9EE
_08150E20: .4byte 0x085AC9F2
_08150E24: .4byte 0x085AC9FA
_08150E28: .4byte 0x085ACA00
_08150E2C: .4byte 0x02037280
_08150E30: .4byte 0x03005AF0
_08150E34: .4byte 0x08150925
_08150E38: .4byte 0x020205AC
_08150E3C: .4byte 0x085AC9A4
_08150E40: .4byte 0x0203A878
_08150E44:
	ldr r7, _08150FE4
	ldr r0, [r7]
	ldr r1, _08150FE8
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x48
	movs r0, #0xc
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r2, #0x18
	movs r3, #0x1a
	bl CopyToBgTilemapBufferRect_ChangePalette
	ldr r0, _08150FEC
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	add r0, sp
	adds r0, #0xc
	ldrb r0, [r0]
	ldr r1, _08150FF0
	movs r2, #0x66
	str r2, [sp]
	movs r2, #0x80
	movs r3, #0x27
	bl AddPseudoEventObject
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08150EB0
	ldr r0, _08150FF4
	lsls r1, r6, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #8
	orrs r0, r2
	strb r0, [r1, #5]
	movs r0, #8
	strh r0, [r1, #0x24]
	movs r0, #0x10
	strh r0, [r1, #0x26]
	movs r0, #0x80
	strh r0, [r1, #0x2e]
	movs r0, #0x27
	strh r0, [r1, #0x30]
_08150EB0:
	ldr r4, _08150FF8
	adds r0, r4, #0
	movs r1, #0x68
	movs r2, #9
	movs r3, #0x67
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r5, _08150FF4
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x20
	strh r1, [r0, #0x26]
	strh r1, [r0, #0x24]
	movs r1, #0x68
	strh r1, [r0, #0x2e]
	movs r1, #9
	strh r1, [r0, #0x30]
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x41
	movs r3, #0x65
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #8
	strh r1, [r0, #0x24]
	movs r1, #4
	strh r1, [r0, #0x26]
	movs r1, #0x80
	strh r1, [r0, #0x2e]
	movs r1, #0x41
	strh r1, [r0, #0x30]
	ldr r1, [r7]
	movs r0, #2
	strb r0, [r1, #2]
	ldr r1, [r7]
	ldr r0, _08150FFC
	strh r0, [r1, #4]
	movs r0, #7
	bl SetCurrentAndNextWeatherNoDelay
_08150F16:
	movs r4, #0
	ldr r5, _08150FF4
_08150F1A:
	lsls r1, r4, #0x14
	movs r2, #0xc0
	lsls r2, r2, #0xf
	adds r1, r1, r2
	asrs r1, r1, #0x10
	lsls r2, r4, #0x13
	ldr r3, _08151000
	adds r2, r2, r3
	asrs r2, r2, #0x10
	ldr r0, _08151004
	movs r3, #0x68
	bl CreateSprite
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #8
	strh r1, [r0, #0x24]
	strh r1, [r0, #0x26]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	bls _08150F1A
	movs r0, #0x3f
	mov r4, sb
	ands r0, r4
	cmp r0, #0
	bne _08151050
	mov r0, sb
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	ldrb r0, [r0]
	ldr r5, _08151008
	ldrh r4, [r5]
	lsls r4, r4, #2
	add r1, sp, #0x20
	adds r1, r4, r1
	ldr r1, [r1]
	mov r3, sl
	adds r2, r3, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	mov r3, sp
	adds r3, #0x16
	adds r3, r3, r4
	movs r4, #0
	ldrsh r3, [r3, r4]
	movs r4, #0x6a
	str r4, [sp]
	bl AddPseudoEventObject
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x40
	beq _08151050
	ldr r1, _08150FF4
	lsls r2, r6, #4
	adds r0, r2, r6
	lsls r0, r0, #2
	adds r4, r0, r1
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #5]
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	strh r0, [r4, #0x26]
	ldrh r0, [r5]
	mov r8, r2
	cmp r0, #0
	bne _08151012
	movs r7, #1
	mov r5, sb
	ands r5, r7
	cmp r5, #0
	beq _0815100C
	adds r0, r4, #0
	movs r1, #6
	b _08151020
	.align 2, 0
_08150FE4: .4byte 0x0203A878
_08150FE8: .4byte 0x000040FC
_08150FEC: .4byte 0x03005AF0
_08150FF0: .4byte 0x08150925
_08150FF4: .4byte 0x020205AC
_08150FF8: .4byte 0x085AC9A4
_08150FFC: .4byte 0x00000109
_08151000: .4byte 0xFFF80000
_08151004: .4byte 0x085AC9D4
_08151008: .4byte 0x02037280
_0815100C:
	adds r0, r4, #0
	movs r1, #7
	b _08151032
_08151012:
	movs r7, #1
	mov r5, sb
	ands r5, r7
	cmp r5, #0
	beq _0815102E
	adds r0, r4, #0
	movs r1, #7
_08151020:
	bl StartSpriteAnim
	strh r7, [r4, #0x30]
	ldrh r0, [r4, #0x22]
	adds r0, #2
	strh r0, [r4, #0x22]
	b _08151038
_0815102E:
	adds r0, r4, #0
	movs r1, #6
_08151032:
	bl StartSpriteAnim
	strh r5, [r4, #0x30]
_08151038:
	ldr r0, _08151060
	mov r2, r8
	adds r1, r2, r6
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #3
	mov r3, sb
	ands r0, r3
	add r0, sp
	adds r0, #0x1c
	ldrb r0, [r0]
	strh r0, [r1, #0x32]
_08151050:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08151060: .4byte 0x020205AC
	thumb_func_end LoadCableCarSprites

	thumb_func_start sub_08151064
sub_08151064: @ 0x08151064
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r3, #0
	mov sb, r3
	ldr r2, _08151130
	ldr r0, [r2]
	ldrb r1, [r0, #0x1b]
	adds r1, #2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	mov ip, r0
_08151086:
	movs r7, #0
	lsls r0, r3, #1
	adds r1, r3, #3
	adds r2, r3, #6
	adds r4, r3, #1
	str r4, [sp, #4]
	adds r0, r0, r3
	lsls r0, r0, #3
	str r0, [sp]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov sl, r0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	mov r8, r0
_081510A8:
	ldr r0, _08151130
	ldr r6, [r0]
	lsls r3, r7, #1
	ldr r1, [sp]
	adds r2, r3, r1
	adds r4, r6, #0
	adds r4, #0x22
	adds r2, r4, r2
	mov r1, ip
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r0, _08151134
	adds r5, r6, r0
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	mov r1, sl
	adds r2, r3, r1
	adds r2, r4, r2
	str r2, [sp, #8]
	ldr r0, [r5]
	mov r2, sb
	lsls r1, r2, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, [sp, #8]
	strh r0, [r2]
	add r3, r8
	adds r4, r4, r3
	ldr r0, [r5]
	adds r1, r1, r0
	adds r1, #0x48
	ldrh r0, [r1]
	strh r0, [r4]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xb
	bls _081510A8
	ldr r4, [sp, #4]
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08151086
	ldrb r0, [r6, #0x1b]
	adds r0, #1
	movs r1, #3
	bl __modsi3
	strb r0, [r6, #0x1b]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08151130: .4byte 0x0203A878
_08151134: .4byte 0x000040FC
	thumb_func_end sub_08151064

	thumb_func_start sub_08151138
sub_08151138: @ 0x08151138
	push {r4, r5, lr}
	ldr r5, _08151190
	ldr r4, [r5]
	ldrb r0, [r4, #0x1c]
	adds r0, #1
	movs r1, #0x60
	bl __modsi3
	strb r0, [r4, #0x1c]
	ldr r1, [r5]
	ldrb r0, [r1, #0x1f]
	ldrb r2, [r1, #0x1d]
	subs r0, r0, r2
	strb r0, [r1, #8]
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1e]
	subs r0, r0, r1
	strb r0, [r2, #9]
	ldr r1, [r5]
	ldrb r0, [r1, #0x1d]
	adds r0, #1
	strb r0, [r1, #0x1d]
	ldr r2, [r5]
	ldrb r0, [r2, #0x1d]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0815117C
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	strb r0, [r2, #0x1e]
_0815117C:
	ldr r0, [r5]
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x10
	bls _08151188
	bl sub_081511F0
_08151188:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08151190: .4byte 0x0203A878
	thumb_func_end sub_08151138

	thumb_func_start sub_08151194
sub_08151194: @ 0x08151194
	push {r4, r5, lr}
	ldr r5, _081511EC
	ldr r4, [r5]
	ldrb r0, [r4, #0x1c]
	adds r0, #1
	movs r1, #0x60
	bl __modsi3
	strb r0, [r4, #0x1c]
	ldr r1, [r5]
	ldrb r0, [r1, #0x1d]
	ldrb r2, [r1, #0x1f]
	adds r0, r0, r2
	strb r0, [r1, #8]
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x20
	ldrb r0, [r1, #0x1e]
	ldrb r2, [r2]
	adds r0, r0, r2
	strb r0, [r1, #9]
	ldr r1, [r5]
	ldrb r0, [r1, #0x1d]
	adds r0, #1
	strb r0, [r1, #0x1d]
	ldr r2, [r5]
	ldrb r0, [r2, #0x1d]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _081511D8
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	strb r0, [r2, #0x1e]
_081511D8:
	ldr r0, [r5]
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x10
	bls _081511E4
	bl sub_08151364
_081511E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_081511EC: .4byte 0x0203A878
	thumb_func_end sub_08151194

	thumb_func_start sub_081511F0
sub_081511F0: @ 0x081511F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r7, #0
	ldr r3, _08151354
	ldr r0, [r3]
	strb r7, [r0, #0x1e]
	strb r7, [r0, #0x1d]
	ldr r1, [r3]
	ldrb r0, [r1, #8]
	strb r0, [r1, #0x1f]
	ldr r0, [r3]
	ldrb r1, [r0, #9]
	adds r0, #0x20
	strb r1, [r0]
	ldr r4, [r3]
	ldrb r1, [r4, #0x19]
	adds r2, r1, #0
	adds r2, #0x1e
	adds r0, r2, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r2, r0
	strb r0, [r4, #0x19]
	ldr r1, [r3]
	ldrb r0, [r1, #0x18]
	subs r0, #2
	strb r0, [r1, #0x18]
	ldr r4, _08151358
	ldr r0, [r3]
	ldrb r1, [r0, #0x1a]
	adds r2, r1, #0
	adds r2, #0x17
	adds r0, r2, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r2, r0
	strb r0, [r4]
	ldr r6, _0815135C
	mov sb, r3
	ldr r0, _08151360
	mov r8, r0
_0815124A:
	mov r1, sb
	ldr r2, [r1]
	ldrb r0, [r2, #0x19]
	strb r0, [r6]
	ldr r0, _08151358
	ldrb r0, [r0]
	adds r1, r0, r7
	adds r0, r1, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r1, r0
	mov r1, r8
	strb r0, [r1]
	ldrb r1, [r2, #0x18]
	lsls r1, r1, #1
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r5, r0, #3
	adds r1, r1, r5
	adds r0, r2, #0
	adds r0, #0x22
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r2, [r6]
	mov r0, r8
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0x11
	mov sl, r0
	str r0, [sp, #8]
	movs r0, #0
	bl FillBgTilemapBufferRect
	ldrb r1, [r6]
	adds r2, r1, #1
	adds r0, r2, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r2, r0
	strb r0, [r6]
	mov r0, sb
	ldr r1, [r0]
	ldrb r0, [r1, #0x18]
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r5
	adds r1, #0x22
	adds r1, r1, r0
	ldrh r1, [r1]
	ldrb r2, [r6]
	mov r0, r8
	ldrb r3, [r0]
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	movs r0, #0
	bl FillBgTilemapBufferRect
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #8
	bls _0815124A
	ldr r5, _0815135C
	ldr r4, _08151354
	ldr r0, [r4]
	ldrb r1, [r0, #0x19]
	adds r2, r1, #0
	adds r2, #0x1e
	adds r0, r2, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r2, r0
	strb r0, [r5]
	ldrb r2, [r5]
	movs r0, #2
	str r0, [sp]
	movs r6, #0x20
	str r6, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r3, #0
	bl FillBgTilemapBufferRect
	ldr r1, [r4]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _08151344
	ldrb r2, [r1, #0x1a]
	adds r3, r2, #0
	adds r3, #0x1d
	adds r0, r3, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r3, r0
	strb r0, [r1, #0x1a]
	ldr r1, [r4]
	movs r0, #0xc
	strb r0, [r1, #0x18]
	bl sub_08151064
	ldr r0, [r4]
	ldrb r1, [r0, #0x1a]
	adds r2, r1, #1
	adds r0, r2, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r2, r0
	strb r0, [r5]
	ldrb r3, [r5]
	str r6, [sp]
	movs r0, #9
	str r0, [sp, #4]
	mov r1, sl
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl FillBgTilemapBufferRect
_08151344:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08151354: .4byte 0x0203A878
_08151358: .4byte 0x0203A87E
_0815135C: .4byte 0x0203A87C
_08151360: .4byte 0x0203A87D
	thumb_func_end sub_081511F0

	thumb_func_start sub_08151364
sub_08151364: @ 0x08151364
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r7, #0
	ldr r2, _08151494
	ldr r0, [r2]
	strb r7, [r0, #0x1e]
	strb r7, [r0, #0x1d]
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	strb r0, [r1, #0x1f]
	ldr r0, [r2]
	ldrb r1, [r0, #9]
	adds r0, #0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, #0x19]
	adds r3, r1, #2
	adds r0, r3, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r3, r0
	strb r0, [r4, #0x19]
	ldr r1, [r2]
	ldrb r0, [r1, #0x18]
	adds r0, #2
	strb r0, [r1, #0x18]
	ldr r1, _08151498
	ldr r0, [r2]
	ldrb r0, [r0, #0x1a]
	strb r0, [r1]
	ldr r6, _0815149C
	mov sl, r2
	ldr r0, _081514A0
	mov sb, r0
_081513B0:
	mov r1, sl
	ldr r2, [r1]
	ldrb r0, [r2, #0x19]
	strb r0, [r6]
	ldr r0, _08151498
	ldrb r0, [r0]
	adds r1, r0, r7
	adds r0, r1, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r1, r0
	mov r1, sb
	strb r0, [r1]
	ldrb r1, [r2, #0x18]
	lsls r1, r1, #1
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r5, r0, #3
	adds r1, r1, r5
	adds r0, r2, #0
	adds r0, #0x22
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r2, [r6]
	mov r0, sb
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0x11
	mov r8, r0
	str r0, [sp, #8]
	movs r0, #0
	bl FillBgTilemapBufferRect
	ldrb r1, [r6]
	adds r2, r1, #1
	adds r0, r2, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r2, r0
	strb r0, [r6]
	mov r0, sl
	ldr r1, [r0]
	ldrb r0, [r1, #0x18]
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r5
	adds r1, #0x22
	adds r1, r1, r0
	ldrh r1, [r1]
	ldrb r2, [r6]
	mov r0, sb
	ldrb r3, [r0]
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	movs r0, #0
	bl FillBgTilemapBufferRect
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #8
	bls _081513B0
	ldr r4, _081514A0
	ldr r5, _08151494
	ldr r3, [r5]
	ldrb r1, [r3, #0x1a]
	adds r2, r1, #0
	adds r2, #0x17
	adds r0, r2, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r2, r0
	strb r0, [r4]
	ldrb r2, [r3, #0x19]
	ldrb r3, [r4]
	movs r0, #2
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	bl FillBgTilemapBufferRect
	ldr r1, [r5]
	ldrb r0, [r1, #0x18]
	cmp r0, #0xa
	bne _08151482
	ldrb r2, [r1, #0x1a]
	adds r3, r2, #3
	adds r0, r3, #0
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r3, r0
	strb r0, [r1, #0x1a]
	ldr r1, [r5]
	movs r0, #0xfe
	strb r0, [r1, #0x18]
	bl sub_08151064
_08151482:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08151494: .4byte 0x0203A878
_08151498: .4byte 0x0203A881
_0815149C: .4byte 0x0203A87F
_081514A0: .4byte 0x0203A880
	thumb_func_end sub_08151364

