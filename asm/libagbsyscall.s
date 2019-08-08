.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start ArcTan2
ArcTan2: @ 0x082959B0
	svc #0xa
	bx lr
	thumb_func_end ArcTan2

	thumb_func_start BgAffineSet
BgAffineSet: @ 0x082959B4
	svc #0xe
	bx lr
	thumb_func_end BgAffineSet

	thumb_func_start CpuFastSet
CpuFastSet: @ 0x082959B8
	svc #0xc
	bx lr
	thumb_func_end CpuFastSet

	thumb_func_start CpuSet
CpuSet: @ 0x082959BC
	svc #0xb
	bx lr
	thumb_func_end CpuSet

	thumb_func_start Div
Div: @ 0x082959C0
	svc #6
	bx lr
	thumb_func_end Div

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 0x082959C4
	svc #0x12
	bx lr
	thumb_func_end LZ77UnCompVram

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 0x082959C8
	svc #0x11
	bx lr
	thumb_func_end LZ77UnCompWram

	thumb_func_start MultiBoot
MultiBoot: @ 0x082959CC
	movs r1, #1
	svc #0x25
	bx lr
	.align 2, 0
	thumb_func_end MultiBoot

	thumb_func_start ObjAffineSet
ObjAffineSet: @ 0x082959D4
	svc #0xf
	bx lr
	thumb_func_end ObjAffineSet

	thumb_func_start RLUnCompVram
RLUnCompVram: @ 0x082959D8
	svc #0x15
	bx lr
	thumb_func_end RLUnCompVram

	thumb_func_start RLUnCompWram
RLUnCompWram: @ 0x082959DC
	svc #0x14
	bx lr
	thumb_func_end RLUnCompWram

	thumb_func_start RegisterRamReset
RegisterRamReset: @ 0x082959E0
	svc #1
	bx lr
	thumb_func_end RegisterRamReset

	thumb_func_start SoftReset
SoftReset: @ 0x082959E4
	ldr r3, _082959F4
	movs r2, #0
	strb r2, [r3]
	ldr r1, _082959F8
	mov sp, r1
	svc #1
	svc #0
	movs r0, r0
	.align 2, 0
_082959F4: .4byte 0x04000208
_082959F8: .4byte 0x03007F00
	thumb_func_end SoftReset

	thumb_func_start Sqrt
Sqrt: @ 0x082959FC
	svc #8
	bx lr
	thumb_func_end Sqrt

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 0x08295A00
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0
	thumb_func_end VBlankIntrWait

