.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start sub_0816FEF0
sub_0816FEF0: @ 0x0816FEF0
	push {r4, r5, lr}
	ldr r5, _0816FF68
	ldrh r4, [r5]
	movs r0, #0
	strh r0, [r5]
	movs r0, #1
	bl RegisterRamReset
	movs r0, #0
	movs r1, #0x80
	bl ClearGpuRegBits
	strh r4, [r5]
	ldr r1, _0816FF6C
	ldr r0, _0816FF70
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	bl sub_08153498
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetSaveBlocksPointers
	bl ResetMenuAndMonGlobals
	bl Save_ResetSaveCounters
	movs r0, #0
	bl Save_LoadGameData
	ldr r0, _0816FF74
	ldrh r0, [r0]
	cmp r0, #0
	beq _0816FF40
	cmp r0, #2
	bne _0816FF44
_0816FF40:
	bl Sav2_ClearSetDefault
_0816FF44:
	ldr r0, _0816FF78
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl SetPokemonCryStereo
	ldr r0, _0816FF7C
	movs r1, #0xe0
	lsls r1, r1, #9
	bl InitHeap
	ldr r0, _0816FF80
	bl SetMainCallback2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0816FF68: .4byte 0x04000208
_0816FF6C: .4byte 0x03002360
_0816FF70: .4byte 0x00000439
_0816FF74: .4byte 0x03005F50
_0816FF78: .4byte 0x03005AF0
_0816FF7C: .4byte 0x02000000
_0816FF80: .4byte 0x08085B99
	thumb_func_end sub_0816FEF0

