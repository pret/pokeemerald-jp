.include "asm/macros.inc"
.include "constants/constants.inc"
.text
.syntax unified

	thumb_func_start BattleTv_SetDataBasedOnString
BattleTv_SetDataBasedOnString: @ 0x0817C808
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, _0817C88C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0817C834
	ldr r0, [sp]
	cmp r0, #0x1b
	beq _0817C834
	cmp r0, #0xdd
	beq _0817C834
	bl _0817DF52
_0817C834:
	ldr r0, _0817C890
	ldr r0, [r0]
	movs r1, #0x81
	lsls r1, r1, #2
	adds r7, r0, r1
	ldr r5, _0817C894
	ldrb r0, [r5]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0817C898
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0817C89C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0817C8A0
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r4, #0
	bne _0817C8AC
	ldr r2, _0817C8A4
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0817C8A8
	b _0817C8BC
	.align 2, 0
_0817C88C: .4byte 0x02022C90
_0817C890: .4byte 0x02024140
_0817C894: .4byte 0x02023EAF
_0817C898: .4byte 0x02023EB0
_0817C89C: .4byte 0x02023EB2
_0817C8A0: .4byte 0x0203A874
_0817C8A4: .4byte 0x02023D12
_0817C8A8: .4byte 0x02024190
_0817C8AC:
	ldr r2, _0817C8D8
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0817C8DC
_0817C8BC:
	adds r1, r1, r0
	str r1, [sp, #8]
	cmp r6, #0
	bne _0817C8E8
	ldr r0, _0817C8E0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0817C8E4
	b _0817C8F8
	.align 2, 0
_0817C8D8: .4byte 0x02023D12
_0817C8DC: .4byte 0x020243E8
_0817C8E0: .4byte 0x02023EB0
_0817C8E4: .4byte 0x02024190
_0817C8E8:
	ldr r0, _0817C938
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x64
	muls r1, r0, r1
	ldr r0, _0817C93C
_0817C8F8:
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldr r0, _0817C940
	ldrb r0, [r0]
	ldr r1, _0817C944
	ldr r1, [r1]
	ldrh r1, [r1]
	bl GetBattlerMoveSlotId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #3
	bls _0817C948
	ldr r0, [sp]
	bl sub_0817DF64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0817C948
	ldr r2, [sp]
	cmp r2, #0xc
	bls _0817C948
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r0, #0x57
	ldrb r1, [r0]
	movs r2, #0x1e
	bl _0817DF4E
	.align 2, 0
_0817C938: .4byte 0x02023EB0
_0817C93C: .4byte 0x020243E8
_0817C940: .4byte 0x02023EAF
_0817C944: .4byte 0x0203A874
_0817C948:
	ldr r0, _0817C988
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	mov r8, r0
	ldr r0, _0817C98C
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x19
	ldr r0, _0817C990
	ldrb r0, [r0]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x19
	ldr r1, [sp]
	subs r1, #2
	movs r0, #0xb0
	lsls r0, r0, #1
	cmp r1, r0
	bls _0817C97E
	bl _0817DF52
_0817C97E:
	lsls r0, r1, #2
	ldr r1, _0817C994
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0817C988: .4byte 0x02023EAF
_0817C98C: .4byte 0x02023EB0
_0817C990: .4byte 0x02023EB2
_0817C994: .4byte 0x0817C998
_0817C998: @ jump table
	.4byte _0817DC26 @ case 0
	.4byte _0817DF52 @ case 1
	.4byte _0817DF52 @ case 2
	.4byte _0817DF52 @ case 3
	.4byte _0817DF52 @ case 4
	.4byte _0817DF52 @ case 5
	.4byte _0817DF52 @ case 6
	.4byte _0817DF52 @ case 7
	.4byte _0817DF52 @ case 8
	.4byte _0817DF52 @ case 9
	.4byte _0817DF52 @ case 10
	.4byte _0817DF52 @ case 11
	.4byte _0817DF52 @ case 12
	.4byte _0817DF52 @ case 13
	.4byte _0817DF52 @ case 14
	.4byte _0817DF52 @ case 15
	.4byte _0817DF52 @ case 16
	.4byte _0817DF52 @ case 17
	.4byte _0817DF52 @ case 18
	.4byte _0817DF52 @ case 19
	.4byte _0817DF52 @ case 20
	.4byte _0817DF52 @ case 21
	.4byte _0817DF52 @ case 22
	.4byte _0817DF52 @ case 23
	.4byte _0817DF52 @ case 24
	.4byte _0817CF1C @ case 25
	.4byte _0817DC20 @ case 26
	.4byte _0817DC2C @ case 27
	.4byte _0817DF52 @ case 28
	.4byte _0817DF52 @ case 29
	.4byte _0817DF52 @ case 30
	.4byte _0817DF52 @ case 31
	.4byte _0817DF52 @ case 32
	.4byte _0817D914 @ case 33
	.4byte _0817DF52 @ case 34
	.4byte _0817DF52 @ case 35
	.4byte _0817DF52 @ case 36
	.4byte _0817DF52 @ case 37
	.4byte _0817D684 @ case 38
	.4byte _0817DF52 @ case 39
	.4byte _0817D750 @ case 40
	.4byte _0817DF52 @ case 41
	.4byte _0817D6E4 @ case 42
	.4byte _0817DF52 @ case 43
	.4byte _0817D5B0 @ case 44
	.4byte _0817DF52 @ case 45
	.4byte _0817D618 @ case 46
	.4byte _0817D9D0 @ case 47
	.4byte _0817DF52 @ case 48
	.4byte _0817DA3C @ case 49
	.4byte _0817DF52 @ case 50
	.4byte _0817DF52 @ case 51
	.4byte _0817DF52 @ case 52
	.4byte _0817D86E @ case 53
	.4byte _0817DF52 @ case 54
	.4byte _0817D8D0 @ case 55
	.4byte _0817DF52 @ case 56
	.4byte _0817DF52 @ case 57
	.4byte _0817DF52 @ case 58
	.4byte _0817DF52 @ case 59
	.4byte _0817DF52 @ case 60
	.4byte _0817DF52 @ case 61
	.4byte _0817DF52 @ case 62
	.4byte _0817DF52 @ case 63
	.4byte _0817DF52 @ case 64
	.4byte _0817DA80 @ case 65
	.4byte _0817DF52 @ case 66
	.4byte _0817D7F8 @ case 67
	.4byte _0817DF52 @ case 68
	.4byte _0817D840 @ case 69
	.4byte _0817DF52 @ case 70
	.4byte _0817DF52 @ case 71
	.4byte _0817DEEC @ case 72
	.4byte _0817DF52 @ case 73
	.4byte _0817DF52 @ case 74
	.4byte _0817DCBC @ case 75
	.4byte _0817DC74 @ case 76
	.4byte _0817DD88 @ case 77
	.4byte _0817DDD0 @ case 78
	.4byte _0817DDFA @ case 79
	.4byte _0817DF52 @ case 80
	.4byte _0817DF52 @ case 81
	.4byte _0817DF52 @ case 82
	.4byte _0817DF52 @ case 83
	.4byte _0817DF52 @ case 84
	.4byte _0817DF52 @ case 85
	.4byte _0817DF52 @ case 86
	.4byte _0817DF52 @ case 87
	.4byte _0817D50A @ case 88
	.4byte _0817D50A @ case 89
	.4byte _0817D50A @ case 90
	.4byte _0817D50A @ case 91
	.4byte _0817D544 @ case 92
	.4byte _0817DF52 @ case 93
	.4byte _0817DF3A @ case 94
	.4byte _0817DE1C @ case 95
	.4byte _0817DE68 @ case 96
	.4byte _0817DF52 @ case 97
	.4byte _0817DF3A @ case 98
	.4byte _0817DF52 @ case 99
	.4byte _0817DF52 @ case 100
	.4byte _0817DF52 @ case 101
	.4byte _0817D3E8 @ case 102
	.4byte _0817DF52 @ case 103
	.4byte _0817D430 @ case 104
	.4byte _0817D978 @ case 105
	.4byte _0817DF52 @ case 106
	.4byte _0817DF52 @ case 107
	.4byte _0817DF52 @ case 108
	.4byte _0817DF52 @ case 109
	.4byte _0817DF52 @ case 110
	.4byte _0817DF52 @ case 111
	.4byte _0817DF52 @ case 112
	.4byte _0817DF52 @ case 113
	.4byte _0817DF52 @ case 114
	.4byte _0817DF52 @ case 115
	.4byte _0817DF52 @ case 116
	.4byte _0817DF52 @ case 117
	.4byte _0817DF52 @ case 118
	.4byte _0817DF52 @ case 119
	.4byte _0817DF52 @ case 120
	.4byte _0817DF52 @ case 121
	.4byte _0817DF52 @ case 122
	.4byte _0817D252 @ case 123
	.4byte _0817DF52 @ case 124
	.4byte _0817DF52 @ case 125
	.4byte _0817DF52 @ case 126
	.4byte _0817DF52 @ case 127
	.4byte _0817DF52 @ case 128
	.4byte _0817DF52 @ case 129
	.4byte _0817DF52 @ case 130
	.4byte _0817DF52 @ case 131
	.4byte _0817DF52 @ case 132
	.4byte _0817DF52 @ case 133
	.4byte _0817DF52 @ case 134
	.4byte _0817DF52 @ case 135
	.4byte _0817DF52 @ case 136
	.4byte _0817D142 @ case 137
	.4byte _0817D190 @ case 138
	.4byte _0817DF52 @ case 139
	.4byte _0817DF52 @ case 140
	.4byte _0817DF52 @ case 141
	.4byte _0817D47A @ case 142
	.4byte _0817D4B4 @ case 143
	.4byte _0817D344 @ case 144
	.4byte _0817D38C @ case 145
	.4byte _0817DB0E @ case 146
	.4byte _0817DB44 @ case 147
	.4byte _0817DF52 @ case 148
	.4byte _0817D064 @ case 149
	.4byte _0817DF52 @ case 150
	.4byte _0817DF52 @ case 151
	.4byte _0817DF52 @ case 152
	.4byte _0817DF52 @ case 153
	.4byte _0817DF52 @ case 154
	.4byte _0817DF52 @ case 155
	.4byte _0817DF52 @ case 156
	.4byte _0817DB88 @ case 157
	.4byte _0817DF52 @ case 158
	.4byte _0817CF88 @ case 159
	.4byte _0817DF52 @ case 160
	.4byte _0817DF52 @ case 161
	.4byte _0817DF52 @ case 162
	.4byte _0817DF52 @ case 163
	.4byte _0817DF52 @ case 164
	.4byte _0817DF52 @ case 165
	.4byte _0817DF52 @ case 166
	.4byte _0817DF52 @ case 167
	.4byte _0817DF52 @ case 168
	.4byte _0817DF52 @ case 169
	.4byte _0817DF52 @ case 170
	.4byte _0817DF52 @ case 171
	.4byte _0817DF52 @ case 172
	.4byte _0817DF52 @ case 173
	.4byte _0817DF52 @ case 174
	.4byte _0817DF52 @ case 175
	.4byte _0817D08C @ case 176
	.4byte _0817D1C0 @ case 177
	.4byte _0817D200 @ case 178
	.4byte _0817D21E @ case 179
	.4byte _0817DF52 @ case 180
	.4byte _0817DF52 @ case 181
	.4byte _0817DF52 @ case 182
	.4byte _0817DF52 @ case 183
	.4byte _0817DF52 @ case 184
	.4byte _0817D0C2 @ case 185
	.4byte _0817D10C @ case 186
	.4byte _0817DF52 @ case 187
	.4byte _0817DF52 @ case 188
	.4byte _0817DF52 @ case 189
	.4byte _0817DF52 @ case 190
	.4byte _0817DF52 @ case 191
	.4byte _0817DF52 @ case 192
	.4byte _0817DF52 @ case 193
	.4byte _0817DF52 @ case 194
	.4byte _0817DF52 @ case 195
	.4byte _0817DF52 @ case 196
	.4byte _0817DF52 @ case 197
	.4byte _0817DF52 @ case 198
	.4byte _0817DF52 @ case 199
	.4byte _0817DF52 @ case 200
	.4byte _0817DF52 @ case 201
	.4byte _0817DF52 @ case 202
	.4byte _0817DF52 @ case 203
	.4byte _0817DF52 @ case 204
	.4byte _0817DF52 @ case 205
	.4byte _0817DF52 @ case 206
	.4byte _0817DF52 @ case 207
	.4byte _0817DF52 @ case 208
	.4byte _0817DF52 @ case 209
	.4byte _0817DF52 @ case 210
	.4byte _0817D26C @ case 211
	.4byte _0817D29E @ case 212
	.4byte _0817D2EC @ case 213
	.4byte _0817D308 @ case 214
	.4byte _0817D264 @ case 215
	.4byte _0817DF52 @ case 216
	.4byte _0817DF52 @ case 217
	.4byte _0817DF52 @ case 218
	.4byte _0817CF44 @ case 219
	.4byte _0817CF80 @ case 220
	.4byte _0817DF52 @ case 221
	.4byte _0817DF52 @ case 222
	.4byte _0817DF52 @ case 223
	.4byte _0817DF52 @ case 224
	.4byte _0817DF52 @ case 225
	.4byte _0817DF52 @ case 226
	.4byte _0817DF52 @ case 227
	.4byte _0817DACC @ case 228
	.4byte _0817DF52 @ case 229
	.4byte _0817DF52 @ case 230
	.4byte _0817DF52 @ case 231
	.4byte _0817DF52 @ case 232
	.4byte _0817DF52 @ case 233
	.4byte _0817DF52 @ case 234
	.4byte _0817DF52 @ case 235
	.4byte _0817DF52 @ case 236
	.4byte _0817DF52 @ case 237
	.4byte _0817DF52 @ case 238
	.4byte _0817DF52 @ case 239
	.4byte _0817DF52 @ case 240
	.4byte _0817DF52 @ case 241
	.4byte _0817DF52 @ case 242
	.4byte _0817DF52 @ case 243
	.4byte _0817DF52 @ case 244
	.4byte _0817DF52 @ case 245
	.4byte _0817DF52 @ case 246
	.4byte _0817DF52 @ case 247
	.4byte _0817DF52 @ case 248
	.4byte _0817DF52 @ case 249
	.4byte _0817DF52 @ case 250
	.4byte _0817DF52 @ case 251
	.4byte _0817D018 @ case 252
	.4byte _0817DF52 @ case 253
	.4byte _0817DF52 @ case 254
	.4byte _0817DF52 @ case 255
	.4byte _0817DF52 @ case 256
	.4byte _0817DF52 @ case 257
	.4byte _0817DF52 @ case 258
	.4byte _0817DF52 @ case 259
	.4byte _0817DF52 @ case 260
	.4byte _0817DF52 @ case 261
	.4byte _0817DF52 @ case 262
	.4byte _0817DF52 @ case 263
	.4byte _0817DF52 @ case 264
	.4byte _0817DF52 @ case 265
	.4byte _0817DF52 @ case 266
	.4byte _0817DF52 @ case 267
	.4byte _0817DF52 @ case 268
	.4byte _0817DF52 @ case 269
	.4byte _0817DF52 @ case 270
	.4byte _0817DF52 @ case 271
	.4byte _0817DF52 @ case 272
	.4byte _0817DF52 @ case 273
	.4byte _0817DF52 @ case 274
	.4byte _0817DF52 @ case 275
	.4byte _0817DF52 @ case 276
	.4byte _0817DF52 @ case 277
	.4byte _0817DF52 @ case 278
	.4byte _0817DF52 @ case 279
	.4byte _0817DF52 @ case 280
	.4byte _0817DF52 @ case 281
	.4byte _0817DF52 @ case 282
	.4byte _0817DF52 @ case 283
	.4byte _0817DF52 @ case 284
	.4byte _0817DF52 @ case 285
	.4byte _0817DF52 @ case 286
	.4byte _0817DF52 @ case 287
	.4byte _0817DF52 @ case 288
	.4byte _0817DF52 @ case 289
	.4byte _0817DF52 @ case 290
	.4byte _0817DF52 @ case 291
	.4byte _0817DF52 @ case 292
	.4byte _0817DF52 @ case 293
	.4byte _0817DF52 @ case 294
	.4byte _0817DF52 @ case 295
	.4byte _0817DF52 @ case 296
	.4byte _0817DF52 @ case 297
	.4byte _0817DF52 @ case 298
	.4byte _0817DF52 @ case 299
	.4byte _0817DF52 @ case 300
	.4byte _0817DF52 @ case 301
	.4byte _0817DF52 @ case 302
	.4byte _0817DF52 @ case 303
	.4byte _0817DF52 @ case 304
	.4byte _0817DF52 @ case 305
	.4byte _0817DF52 @ case 306
	.4byte _0817DF52 @ case 307
	.4byte _0817DF52 @ case 308
	.4byte _0817DF52 @ case 309
	.4byte _0817DF52 @ case 310
	.4byte _0817DF52 @ case 311
	.4byte _0817DF52 @ case 312
	.4byte _0817DBE4 @ case 313
	.4byte _0817DBA8 @ case 314
	.4byte _0817DF52 @ case 315
	.4byte _0817DF52 @ case 316
	.4byte _0817DF52 @ case 317
	.4byte _0817DF52 @ case 318
	.4byte _0817DF52 @ case 319
	.4byte _0817DF52 @ case 320
	.4byte _0817DF52 @ case 321
	.4byte _0817DF52 @ case 322
	.4byte _0817DF52 @ case 323
	.4byte _0817DF52 @ case 324
	.4byte _0817DF52 @ case 325
	.4byte _0817D50A @ case 326
	.4byte _0817DF52 @ case 327
	.4byte _0817DF52 @ case 328
	.4byte _0817DF52 @ case 329
	.4byte _0817DF52 @ case 330
	.4byte _0817DF52 @ case 331
	.4byte _0817DF52 @ case 332
	.4byte _0817CFD0 @ case 333
	.4byte _0817DF52 @ case 334
	.4byte _0817DF52 @ case 335
	.4byte _0817DF52 @ case 336
	.4byte _0817DF52 @ case 337
	.4byte _0817DF52 @ case 338
	.4byte _0817DF52 @ case 339
	.4byte _0817DF52 @ case 340
	.4byte _0817DF52 @ case 341
	.4byte _0817DF52 @ case 342
	.4byte _0817DF52 @ case 343
	.4byte _0817DF52 @ case 344
	.4byte _0817DF52 @ case 345
	.4byte _0817DF52 @ case 346
	.4byte _0817DF52 @ case 347
	.4byte _0817DF52 @ case 348
	.4byte _0817DD04 @ case 349
	.4byte _0817DC74 @ case 350
	.4byte _0817DCBC @ case 351
	.4byte _0817DE92 @ case 352
_0817CF1C:
	movs r0, #1
	mov r1, sl
	movs r2, #2
	movs r3, #0
	bl AddMovePoints
	ldr r0, _0817CF40
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0817CF38
	bl _0817DF52
_0817CF38:
	bl TrySetBattleSeminarShow
	bl _0817DF52
	.align 2, 0
_0817CF40: .4byte 0x02022C90
_0817CF44:
	movs r0, #1
	mov r1, sl
	movs r2, #1
	movs r3, #0
	bl AddMovePoints
	ldr r0, _0817CF7C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0817CF60
	bl _0817DF52
_0817CF60:
	ldr r0, [sp, #0xc]
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0817CF72
	bl _0817DF52
_0817CF72:
	bl TrySetBattleSeminarShow
	bl _0817DF52
	.align 2, 0
_0817CF7C: .4byte 0x02022C90
_0817CF80:
	movs r0, #1
	mov r1, sl
	movs r2, #0
	b _0817D33A
_0817CF88:
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #2
	adds r3, r7, r3
	ldr r1, _0817CFC4
	ldr r0, _0817CFC8
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xf
	ldr r1, [r3, #0x50]
	ldr r2, _0817CFCC
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #0x50]
	adds r3, #0x55
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	bl _0817DAB8
	.align 2, 0
_0817CFC4: .4byte 0x02023D12
_0817CFC8: .4byte 0x02023EAF
_0817CFCC: .4byte 0xFFFC7FFF
_0817CFD0:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r1, _0817D010
	ldr r0, _0817D014
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x52
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r4]
	movs r0, #0x1d
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x55
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r2]
	movs r0, #0x31
	rsbs r0, r0, #0
	bl _0817DE56
	.align 2, 0
_0817D010: .4byte 0x02023D12
_0817D014: .4byte 0x02023EAF
_0817D018:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r5, r7, r0
	ldr r1, _0817D05C
	ldr r0, _0817D060
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r3, r5, #0
	adds r3, #0x52
	lsls r1, r1, #5
	ldrb r2, [r3]
	movs r0, #0x1f
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r4, r5, #0
	adds r4, #0x55
	mov r0, sl
	lsls r2, r0, #6
	ldrb r1, [r4]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x58
	ldrb r0, [r2]
	movs r1, #0x40
	bl _0817DE58
	.align 2, 0
_0817D05C: .4byte 0x02023D12
_0817D060: .4byte 0x02023EAF
_0817D064:
	ldr r1, _0817D088
	ldrb r0, [r1]
	cmp r0, #0
	beq _0817D070
	bl _0817DF52
_0817D070:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r0, #0x57
	ldrb r2, [r0]
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #0x14
	bl _0817DF4E
	.align 2, 0
_0817D088: .4byte 0x02022C10
_0817D08C:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r3, r7, r0
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D0A6
	bl _0817DF52
_0817D0A6:
	adds r2, r6, #0
	subs r1, r0, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x56
	ldrb r3, [r0]
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	adds r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	bl sub_0817D9BC
_0817D0C2:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r1, _0817D104
	ldr r0, _0817D108
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x53
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #3
	ldrb r3, [r4]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x56
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	bl _0817DE56
	.align 2, 0
_0817D104: .4byte 0x02023D12
_0817D108: .4byte 0x02023EAF
_0817D10C:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r3, r7, r0
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D126
	bl _0817DF52
_0817D126:
	adds r2, r6, #0
	subs r1, r0, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x56
	ldrb r3, [r0]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	adds r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	bl sub_0817DA6E
_0817D142:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r1, _0817D184
	ldr r0, _0817D188
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r2, #0x56
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r2]
	movs r0, #0x71
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #7
	ldrh r3, [r2]
	ldr r0, _0817D18C
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	bl _0817DF52
	.align 2, 0
_0817D184: .4byte 0x02023D12
_0817D188: .4byte 0x02023EAF
_0817D18C: .4byte 0xFFFFFE7F
_0817D190:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D1A8
	bl _0817DF52
_0817D1A8:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r0, #0x57
	ldrb r2, [r0]
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #0x16
	bl _0817DF4E
_0817D1C0:
	mov r2, r8
	lsls r3, r2, #3
	lsls r0, r4, #4
	adds r3, r3, r0
	adds r3, r7, r3
	ldr r1, _0817D1F8
	ldr r0, _0817D1FC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r3, #0x35
	movs r0, #7
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	movs r2, #3
	mov r1, sl
	ands r1, r2
	lsls r1, r1, #3
	movs r2, #0x19
	rsbs r2, r2, #0
	bl _0817DAB8
	.align 2, 0
_0817D1F8: .4byte 0x02023D12
_0817D1FC: .4byte 0x02023EAF
_0817D200:
	mov r1, r8
	lsls r0, r1, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r0, r7, r0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D21A
	bl _0817DF52
_0817D21A:
	adds r2, r4, #0
	b _0817D238
_0817D21E:
	lsls r0, r5, #3
	lsls r1, r6, #4
	adds r0, r0, r1
	adds r0, r7, r0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D236
	bl _0817DF52
_0817D236:
	adds r2, r6, #0
_0817D238:
	subs r0, #1
	lsls r0, r0, #2
	lsls r3, r1, #0x1b
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #6
	bl AddMovePoints
	bl _0817DF52
_0817D252:
	ldr r0, _0817D260
	ldr r0, [r0]
	adds r0, #0xb3
	movs r1, #1
	bl _0817DF50
	.align 2, 0
_0817D260: .4byte 0x02024140
_0817D264:
	movs r0, #0x12
	mov r1, sl
	movs r2, #0
	b _0817D33A
_0817D26C:
	ldr r0, _0817D28C
	ldrb r2, [r0, #2]
	cmp r2, #0
	bne _0817D278
	bl _0817DF52
_0817D278:
	ldr r1, _0817D290
	ldrh r0, [r1]
	cmp r0, #0xd1
	bne _0817D294
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x17
	b _0817D338
	.align 2, 0
_0817D28C: .4byte 0x02022C0C
_0817D290: .4byte 0x02022C1E
_0817D294:
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x16
	b _0817D338
_0817D29E:
	ldr r0, _0817D2C8
	ldrb r2, [r0, #2]
	cmp r2, #0
	bne _0817D2AA
	bl _0817DF52
_0817D2AA:
	ldr r0, _0817D2CC
	ldr r1, _0817D2D0
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0817D2E2
	ldr r1, _0817D2D4
	ldrh r0, [r1]
	cmp r0, #0xd1
	bne _0817D2D8
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x17
	b _0817D338
	.align 2, 0
_0817D2C8: .4byte 0x02022C0C
_0817D2CC: .4byte 0x02023EAF
_0817D2D0: .4byte 0x02023EB0
_0817D2D4: .4byte 0x02022C1E
_0817D2D8:
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x16
	b _0817D338
_0817D2E2:
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x1b
	b _0817D338
_0817D2EC:
	ldr r0, _0817D304
	ldrb r2, [r0, #2]
	cmp r2, #0
	bne _0817D2F8
	bl _0817DF52
_0817D2F8:
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x18
	b _0817D338
	.align 2, 0
_0817D304: .4byte 0x02022C0C
_0817D308:
	ldr r0, _0817D328
	ldrb r2, [r0, #2]
	cmp r2, #0
	bne _0817D314
	bl _0817DF52
_0817D314:
	ldr r1, _0817D32C
	ldrh r0, [r1]
	cmp r0, #0xd3
	bne _0817D330
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x1a
	b _0817D338
	.align 2, 0
_0817D328: .4byte 0x02022C0C
_0817D32C: .4byte 0x02022C1E
_0817D330:
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x19
_0817D338:
	mov r1, sl
_0817D33A:
	movs r3, #0
	bl AddMovePoints
	bl _0817DF52
_0817D344:
	lsls r2, r5, #3
	lsls r0, r6, #4
	adds r2, r2, r0
	adds r2, r7, r2
	ldr r1, _0817D384
	ldr r0, _0817D388
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x30
	movs r0, #7
	ands r1, r0
	ldrb r3, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x32
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	bl _0817DE56
	.align 2, 0
_0817D384: .4byte 0x02023D12
_0817D388: .4byte 0x02023EAF
_0817D38C:
	ldr r0, [sp, #8]
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0817D39E
	bl _0817DF52
_0817D39E:
	mov r2, r8
	lsls r0, r2, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r1, r7, r0
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D3BA
	bl _0817DF52
_0817D3BA:
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	movs r0, #8
	movs r1, #0
	bl AddMovePoints
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r1, #0x57
	ldrb r2, [r1]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #2
	b _0817D59E
_0817D3E8:
	lsls r2, r5, #3
	lsls r0, r6, #4
	adds r2, r2, r0
	adds r2, r7, r2
	ldr r1, _0817D428
	ldr r0, _0817D42C
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x30
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #3
	ldrb r3, [r4]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x32
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r2]
	movs r0, #0x31
	rsbs r0, r0, #0
	bl _0817DE56
	.align 2, 0
_0817D428: .4byte 0x02023D12
_0817D42C: .4byte 0x02023EAF
_0817D430:
	mov r1, r8
	lsls r0, r1, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r1, r7, r0
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D44C
	bl _0817DF52
_0817D44C:
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	movs r0, #8
	movs r1, #1
	bl AddMovePoints
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r1, #0x57
	ldrb r2, [r1]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #4
	b _0817D59E
_0817D47A:
	lsls r2, r5, #3
	lsls r0, r6, #4
	adds r2, r2, r0
	adds r2, r7, r2
	ldr r1, _0817D4A8
	ldr r0, _0817D4AC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #6
	ldrh r3, [r2, #0x30]
	ldr r0, _0817D4B0
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #0x30]
	adds r2, #0x32
	bl _0817DDB6
	.align 2, 0
_0817D4A8: .4byte 0x02023D12
_0817D4AC: .4byte 0x02023EAF
_0817D4B0: .4byte 0xFFFFFE3F
_0817D4B4:
	ldr r0, [sp, #8]
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0817D4C6
	bl _0817DF52
_0817D4C6:
	mov r1, r8
	lsls r0, r1, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r1, r7, r0
	ldrh r0, [r1, #0x30]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D4DE
	bl _0817DF52
_0817D4DE:
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsrs r3, r3, #6
	movs r0, #8
	movs r1, #5
	bl AddMovePoints
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r1, #0x57
	ldrb r2, [r1]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #0xa
	b _0817D59E
_0817D50A:
	lsls r2, r5, #3
	lsls r0, r6, #4
	adds r2, r2, r0
	adds r2, r7, r2
	ldr r1, _0817D53C
	ldr r0, _0817D540
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x31
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r3, [r4]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x33
	bl _0817DE4A
	.align 2, 0
_0817D53C: .4byte 0x02023D12
_0817D540: .4byte 0x02023EAF
_0817D544:
	ldr r0, [sp, #8]
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0817D556
	bl _0817DF52
_0817D556:
	mov r1, r8
	lsls r0, r1, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r1, r7, r0
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D572
	bl _0817DF52
_0817D572:
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r3, [r0]
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	movs r0, #8
	movs r1, #6
	bl AddMovePoints
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r1, #0x57
	ldrb r2, [r1]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #0xc
_0817D59E:
	orrs r0, r2
	mov r2, r8
	lsls r3, r2, #5
	movs r2, #0x1f
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	bl _0817DF52
_0817D5B0:
	ldr r5, _0817D608
	ldr r6, _0817D60C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	lsls r2, r2, #2
	mov r0, sb
	lsls r4, r0, #1
	add r4, sb
	lsls r4, r4, #3
	adds r2, r2, r4
	adds r2, r7, r2
	ldr r0, _0817D610
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #6
	ldrh r3, [r2]
	ldr r0, _0817D614
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, r7, r1
	mov r2, sl
	lsls r3, r2, #6
	ldrb r2, [r1, #2]
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, #2]
	bl _0817DF52
	.align 2, 0
_0817D608: .4byte 0x02023D12
_0817D60C: .4byte 0x02023EB2
_0817D610: .4byte 0x02023EAF
_0817D614: .4byte 0xFFFFFE3F
_0817D618:
	ldr r0, [sp, #8]
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0817D62A
	bl _0817DF52
_0817D62A:
	ldr r6, _0817D67C
	ldr r5, _0817D680
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #2
	lsls r1, r4, #1
	adds r4, r1, r4
	lsls r1, r4, #3
	adds r0, r0, r1
	adds r1, r7, r0
	ldrh r0, [r1]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817D65E
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r1, #2]
	lsrs r3, r3, #6
	movs r0, #8
	movs r1, #4
	bl AddMovePoints
_0817D65E:
	lsls r3, r4, #2
	adds r3, r7, r3
	adds r3, #0x57
	ldrb r0, [r3]
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #8
	orrs r1, r0
	strb r1, [r3]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r6
	b _0817D7E0
	.align 2, 0
_0817D67C: .4byte 0x02023D12
_0817D680: .4byte 0x02023EAF
_0817D684:
	ldr r5, _0817D6D8
	ldr r6, _0817D6DC
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	lsls r2, r2, #2
	mov r0, sb
	lsls r4, r0, #1
	add r4, sb
	lsls r4, r4, #3
	adds r2, r2, r4
	adds r2, r7, r2
	ldr r0, _0817D6E0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	movs r0, #7
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, r7, r1
	movs r0, #3
	mov r2, sl
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r1, #2]
	movs r0, #0xd
	rsbs r0, r0, #0
	b _0817D738
	.align 2, 0
_0817D6D8: .4byte 0x02023D12
_0817D6DC: .4byte 0x02023EB2
_0817D6E0: .4byte 0x02023EAF
_0817D6E4:
	ldr r5, _0817D744
	ldr r6, _0817D748
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	lsls r2, r2, #2
	mov r1, sb
	lsls r4, r1, #1
	add r4, sb
	lsls r4, r4, #3
	adds r2, r2, r4
	adds r2, r7, r2
	ldr r0, _0817D74C
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #3
	ldrb r3, [r2]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, r7, r1
	movs r0, #3
	mov r2, sl
	ands r2, r0
	lsls r2, r2, #4
	ldrb r3, [r1, #2]
	movs r0, #0x31
	rsbs r0, r0, #0
_0817D738:
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #2]
	bl _0817DF52
	.align 2, 0
_0817D744: .4byte 0x02023D12
_0817D748: .4byte 0x02023EB2
_0817D74C: .4byte 0x02023EAF
_0817D750:
	ldr r0, [sp, #8]
	movs r1, #0x39
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0817D762
	bl _0817DF52
_0817D762:
	ldr r2, _0817D7F0
	mov r8, r2
	ldr r6, _0817D7F4
	ldrb r0, [r6]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	lsls r0, r0, #2
	lsls r1, r4, #1
	adds r5, r1, r4
	lsls r4, r5, #3
	adds r0, r0, r4
	adds r1, r7, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817D79A
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r1, #2]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	movs r0, #8
	movs r1, #2
	bl AddMovePoints
_0817D79A:
	ldrb r0, [r6]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r7, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817D7C6
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r1, #2]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	movs r0, #8
	movs r1, #3
	bl AddMovePoints
_0817D7C6:
	lsls r3, r5, #2
	adds r3, r7, r3
	adds r3, #0x57
	ldrb r0, [r3]
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #6
	orrs r1, r0
	strb r1, [r3]
	ldrb r0, [r6]
	lsls r0, r0, #1
	add r0, r8
_0817D7E0:
	ldrh r0, [r0]
	lsls r0, r0, #5
	movs r2, #0x1f
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	b _0817DF52
	.align 2, 0
_0817D7F0: .4byte 0x02023D12
_0817D7F4: .4byte 0x02023EAF
_0817D7F8:
	lsls r2, r5, #3
	lsls r0, r6, #4
	adds r2, r2, r0
	adds r2, r7, r2
	ldr r1, _0817D838
	ldr r0, _0817D83C
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x31
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r4]
	movs r0, #0x71
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x33
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	b _0817DE56
	.align 2, 0
_0817D838: .4byte 0x02023D12
_0817D83C: .4byte 0x02023EAF
_0817D840:
	mov r1, r8
	lsls r0, r1, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r1, r7, r0
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D85A
	b _0817DF52
_0817D85A:
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r3, [r0]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	movs r0, #9
	b _0817DF32
_0817D86E:
	ldr r5, _0817D8C4
	ldr r6, _0817D8C8
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	lsls r2, r2, #2
	mov r0, sb
	lsls r4, r0, #1
	add r4, sb
	lsls r4, r4, #3
	adds r2, r2, r4
	adds r2, r7, r2
	ldr r0, _0817D8CC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r3, [r2, #1]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, r7, r1
	movs r0, #3
	mov r2, sl
	ands r2, r0
	ldrb r3, [r1, #3]
	movs r0, #4
	rsbs r0, r0, #0
	b _0817DA22
	.align 2, 0
_0817D8C4: .4byte 0x02023D12
_0817D8C8: .4byte 0x02023EB2
_0817D8CC: .4byte 0x02023EAF
_0817D8D0:
	ldr r1, _0817D90C
	ldr r0, _0817D910
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #2
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r7, r1
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817D8F4
	b _0817DF52
_0817D8F4:
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	movs r0, #9
	movs r1, #2
	bl AddMovePoints
	b _0817DF52
	.align 2, 0
_0817D90C: .4byte 0x02023D12
_0817D910: .4byte 0x02023EAF
_0817D914:
	ldr r5, _0817D96C
	ldr r6, _0817D970
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	lsls r2, r2, #2
	mov r1, sb
	lsls r4, r1, #1
	add r4, sb
	lsls r4, r4, #3
	adds r2, r2, r4
	adds r2, r7, r2
	ldr r0, _0817D974
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, #1
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r2, #1]
	movs r0, #0x71
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, r7, r1
	movs r0, #3
	mov r2, sl
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r1, #3]
	movs r0, #0xd
	rsbs r0, r0, #0
	b _0817DA22
	.align 2, 0
_0817D96C: .4byte 0x02023D12
_0817D970: .4byte 0x02023EB2
_0817D974: .4byte 0x02023EAF
_0817D978:
	ldr r1, _0817D9C4
	ldr r0, _0817D9C8
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #2
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r7, r1
	ldrb r0, [r1, #1]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1d
	cmp r2, #0
	bne _0817D99C
	b _0817DF52
_0817D99C:
	ldr r0, _0817D9CC
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, #0xad
	bne _0817D9A8
	b _0817DF52
_0817D9A8:
	cmp r0, #0xd6
	bne _0817D9AE
	b _0817DF52
_0817D9AE:
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	movs r0, #9
	thumb_func_end BattleTv_SetDataBasedOnString

	thumb_func_start sub_0817D9BC
sub_0817D9BC: @ 0x0817D9BC
	movs r1, #3
	bl AddMovePoints
	b _0817DF52
	.align 2, 0
_0817D9C4: .4byte 0x02023D12
_0817D9C8: .4byte 0x02023EAF
_0817D9CC: .4byte 0x0203A874
_0817D9D0:
	ldr r5, _0817DA2C
	ldr r6, _0817DA30
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	lsls r3, r3, #2
	mov r2, sb
	lsls r4, r2, #1
	add r4, sb
	lsls r4, r4, #3
	adds r3, r3, r4
	adds r3, r7, r3
	ldr r0, _0817DA34
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xf
	ldr r1, [r3]
	ldr r2, _0817DA38
	ands r1, r2
	orrs r1, r0
	str r1, [r3]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, r7, r1
	movs r0, #3
	mov r2, sl
	ands r2, r0
	lsls r2, r2, #4
	ldrb r3, [r1, #3]
	movs r0, #0x31
	rsbs r0, r0, #0
_0817DA22:
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #3]
	b _0817DF52
	.align 2, 0
_0817DA2C: .4byte 0x02023D12
_0817DA30: .4byte 0x02023EB2
_0817DA34: .4byte 0x02023EAF
_0817DA38: .4byte 0xFFFC7FFF
_0817DA3C:
	ldr r1, _0817DA78
	ldr r0, _0817DA7C
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #2
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r7, r1
	ldr r0, [r1]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817DA60
	b _0817DF52
_0817DA60:
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	movs r0, #9
sub_0817DA6E: @ 0x0817DA6E
	movs r1, #4
	bl AddMovePoints
	b _0817DF52
	.align 2, 0
_0817DA78: .4byte 0x02023D12
_0817DA7C: .4byte 0x02023EAF
_0817DA80:
	lsls r3, r3, #3
	mov r1, sb
	lsls r0, r1, #4
	adds r3, r3, r0
	adds r3, r7, r3
	ldr r1, _0817DAC0
	ldr r0, _0817DAC4
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xf
	ldr r1, [r3, #0x30]
	ldr r2, _0817DAC8
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #0x30]
	adds r3, #0x33
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r3]
	movs r0, #0x31
	rsbs r0, r0, #0
_0817DAB8:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _0817DF52
	.align 2, 0
_0817DAC0: .4byte 0x02023D12
_0817DAC4: .4byte 0x02023EAF
_0817DAC8: .4byte 0xFFFC7FFF
_0817DACC:
	mov r2, r8
	lsls r0, r2, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r3, r7, r0
	ldr r0, [r3, #0x30]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817DAF8
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r3, #0
	adds r0, #0x33
	ldrb r3, [r0]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	movs r0, #9
	movs r1, #1
	bl AddMovePoints
_0817DAF8:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r0, #0x57
	ldrb r2, [r0]
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #0x18
	b _0817DF4E
_0817DB0E:
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r1, _0817DB3C
	ldr r0, _0817DB40
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x50
	movs r0, #7
	ands r1, r0
	ldrb r3, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x54
	b _0817DE4A
	.align 2, 0
_0817DB3C: .4byte 0x02023D12
_0817DB40: .4byte 0x02023EAF
_0817DB44:
	ldr r1, [sp, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r7, r0
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r2, r0, #0x1d
	cmp r2, #0
	bne _0817DB5E
	b _0817DF52
_0817DB5E:
	movs r0, #1
	eors r1, r0
	subs r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r3, [r0]
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	movs r0, #0xa
	bl AddMovePoints
	adds r2, r4, #0
	adds r2, #0x57
	ldrb r1, [r2]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0xe
	b _0817DE58
_0817DB88:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r3, r1, #0
	adds r3, #0x50
	ldrb r2, [r3]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3]
	adds r1, #0x54
	ldrb r2, [r1]
	movs r0, #4
	rsbs r0, r0, #0
	b _0817DE16
_0817DBA8:
	mov r0, r8
	lsls r2, r0, #3
	lsls r0, r4, #4
	adds r2, r2, r0
	adds r2, r7, r2
	ldr r1, _0817DBDC
	ldr r0, _0817DBE0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x34
	movs r0, #7
	ands r1, r0
	ldrb r3, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x33
	mov r1, sl
	lsls r3, r1, #6
	b _0817DDBA
	.align 2, 0
_0817DBDC: .4byte 0x02023D12
_0817DBE0: .4byte 0x02023EAF
_0817DBE4:
	mov r0, r8
	lsls r2, r0, #3
	lsls r0, r4, #4
	adds r2, r2, r0
	adds r2, r7, r2
	ldr r1, _0817DC18
	ldr r0, _0817DC1C
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r2, #0x34
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #3
	ldrb r3, [r2]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	mov r1, sl
	lsls r3, r1, #6
	movs r1, #0x3f
	b _0817DDBE
	.align 2, 0
_0817DC18: .4byte 0x02023D12
_0817DC1C: .4byte 0x02023EAF
_0817DC20:
	movs r0, #0
	bl AddPointsOnFainting
_0817DC26:
	mov r2, r8
	lsls r0, r2, #3
	b _0817DC34
_0817DC2C:
	movs r0, #1
	bl AddPointsOnFainting
	lsls r0, r5, #3
_0817DC34:
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r1, r7, r0
	adds r4, r1, #0
	adds r4, #0x34
	ldrb r5, [r4]
	lsls r0, r5, #0x1d
	cmp r0, #0
	beq _0817DC5A
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r5
	strb r0, [r4]
	adds r2, r1, #0
	adds r2, #0x33
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
_0817DC5A:
	ldrb r1, [r4]
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817DC66
	b _0817DF52
_0817DC66:
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r4]
	b _0817DF52
_0817DC74:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r1, _0817DCB4
	ldr r0, _0817DCB8
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x50
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #3
	ldrb r3, [r4]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x54
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	b _0817DE56
	.align 2, 0
_0817DCB4: .4byte 0x02023D12
_0817DCB8: .4byte 0x02023EAF
_0817DCBC:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r1, _0817DCF8
	ldr r0, _0817DCFC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x50
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #6
	ldrh r3, [r4]
	ldr r0, _0817DD00
	ands r0, r3
	orrs r0, r1
	strh r0, [r4]
	adds r2, #0x54
	movs r0, #3
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r2]
	movs r0, #0x31
	rsbs r0, r0, #0
	b _0817DE56
	.align 2, 0
_0817DCF8: .4byte 0x02023D12
_0817DCFC: .4byte 0x02023EAF
_0817DD00: .4byte 0xFFFFFE3F
_0817DD04:
	ldr r1, _0817DD80
	ldrh r0, [r1]
	cmp r0, #0x73
	bne _0817DD2E
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r3, r1, #0
	adds r3, #0x50
	ldrb r2, [r3]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3]
	adds r1, #0x54
	ldrb r2, [r1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_0817DD2E:
	ldr r2, _0817DD80
	ldrh r0, [r2]
	cmp r0, #0x71
	bne _0817DD56
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r3, r1, #0
	adds r3, #0x50
	ldrh r2, [r3]
	ldr r0, _0817DD84
	ands r0, r2
	strh r0, [r3]
	adds r1, #0x54
	ldrb r2, [r1]
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
_0817DD56:
	ldr r1, _0817DD80
	ldrh r0, [r1]
	cmp r0, #0x36
	beq _0817DD60
	b _0817DF52
_0817DD60:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r4, r1, #0
	adds r4, #0x51
	ldrb r2, [r4]
	movs r0, #0x71
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r4]
	adds r1, #0x55
	ldrb r2, [r1]
	movs r0, #4
	rsbs r0, r0, #0
	b _0817DE16
	.align 2, 0
_0817DD80: .4byte 0x02022C0E
_0817DD84: .4byte 0xFFFFFE3F
_0817DD88:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r1, _0817DDC8
	ldr r0, _0817DDCC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x51
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r3, [r4]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x54
_0817DDB6:
	mov r0, sl
	lsls r3, r0, #6
_0817DDBA:
	ldrb r1, [r2]
	movs r0, #0x3f
_0817DDBE:
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _0817DF52
	.align 2, 0
_0817DDC8: .4byte 0x02023D12
_0817DDCC: .4byte 0x02023EAF
_0817DDD0:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r0, r1, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817DDE8
	b _0817DF52
_0817DDE8:
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r1, #0
	adds r0, #0x54
	ldrb r3, [r0]
	lsrs r3, r3, #6
	movs r0, #0xf
	b _0817DF32
_0817DDFA:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r4, r1, #0
	adds r4, #0x51
	ldrb r2, [r4]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r4]
	adds r1, #0x54
	ldrb r2, [r1]
	movs r0, #0x3f
_0817DE16:
	ands r0, r2
	strb r0, [r1]
	b _0817DF52
_0817DE1C:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r1, _0817DE60
	ldr r0, _0817DE64
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x51
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r4]
	movs r0, #0x71
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	adds r2, #0x55
_0817DE4A:
	movs r0, #3
	mov r1, sl
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #4
	rsbs r0, r0, #0
_0817DE56:
	ands r0, r3
_0817DE58:
	orrs r0, r1
	strb r0, [r2]
	b _0817DF52
	.align 2, 0
_0817DE60: .4byte 0x02023D12
_0817DE64: .4byte 0x02023EAF
_0817DE68:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r0, r1, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817DF52
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r1, #0
	adds r0, #0x55
	ldrb r3, [r0]
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	movs r0, #0x10
	b _0817DF32
_0817DE92:
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #2
	adds r1, r7, r1
	adds r3, r1, #0
	adds r3, #0x50
	ldrb r2, [r3]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3]
	adds r1, #0x54
	ldrb r2, [r1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldrh r2, [r3]
	ldr r0, _0817DEE0
	ands r0, r2
	strh r0, [r3]
	ldrb r2, [r1]
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _0817DEE4
	ldr r0, _0817DEE8
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r0, #0x11
	movs r1, #0
	mov r3, sl
	bl AddMovePoints
	b _0817DF52
	.align 2, 0
_0817DEE0: .4byte 0xFFFFFE3F
_0817DEE4: .4byte 0x02023D12
_0817DEE8: .4byte 0x02023EAF
_0817DEEC:
	lsls r0, r4, #4
	adds r4, r7, r0
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsrs r0, r0, #5
	cmp r0, #0
	beq _0817DF14
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r3, [r0]
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	movs r0, #0x15
	movs r1, #0
	bl AddMovePoints
_0817DF14:
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsrs r0, r0, #5
	cmp r0, #0
	beq _0817DF52
	subs r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r3, [r0]
	lsls r3, r3, #0x1e
	lsrs r3, r3, #0x1e
	movs r0, #0x15
_0817DF32:
	movs r1, #0
	bl AddMovePoints
	b _0817DF52
_0817DF3A:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r0, #0x57
	ldrb r2, [r0]
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #0x1c
_0817DF4E:
	orrs r1, r2
_0817DF50:
	strb r1, [r0]
_0817DF52:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
	thumb_func_end sub_0817D9BC

	thumb_func_start sub_0817DF64
sub_0817DF64: @ 0x0817DF64
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r3, #0
	ldr r4, _0817DF98
	ldr r6, _0817DF9C
	adds r2, r4, #0
	adds r1, r4, #0
_0817DF74:
	ldrh r0, [r1]
	cmp r0, r5
	beq _0817DF86
	adds r2, #2
	adds r1, #2
	adds r3, #1
	ldrh r0, [r2]
	cmp r0, r6
	bne _0817DF74
_0817DF86:
	lsls r0, r3, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r0, _0817DF9C
	cmp r1, r0
	beq _0817DFA0
	movs r0, #0
	b _0817DFA2
	.align 2, 0
_0817DF98: .4byte 0x085D3304
_0817DF9C: .4byte 0x0000FFFF
_0817DFA0:
	movs r0, #1
_0817DFA2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	thumb_func_end sub_0817DF64

	thumb_func_start BattleTv_SetDataBasedOnMove
BattleTv_SetDataBasedOnMove: @ 0x0817DFA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r2, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	ldr r0, _0817E020
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0817DFCE
	b _0817E1BC
_0817DFCE:
	ldr r0, _0817E024
	ldr r0, [r0]
	movs r1, #0x81
	lsls r1, r1, #2
	adds r1, r0, r1
	str r1, [sp, #8]
	ldr r2, _0817E028
	mov sl, r2
	ldrb r0, [r2]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0817E02C
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	adds r1, r7, #0
	bl GetBattlerMoveSlotId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _0817E030
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	lsls r0, r0, #2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, #0x57
	ldrb r1, [r0]
	movs r2, #0x1e
	orrs r1, r2
	strb r1, [r0]
	b _0817E1BC
	.align 2, 0
_0817E020: .4byte 0x02022C90
_0817E024: .4byte 0x02024140
_0817E028: .4byte 0x02023EAF
_0817E02C: .4byte 0x02023EB0
_0817E030:
	mov r2, sl
	ldrb r0, [r2]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #3
	lsls r4, r4, #4
	adds r0, r0, r4
	ldr r1, [sp, #8]
	adds r0, r1, r0
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #1
	ldr r2, _0817E1CC
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r2, #1
	adds r0, #0x35
	lsls r2, r2, #5
	ldrb r3, [r0]
	movs r1, #0x1f
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	mov r1, sl
	ldrb r0, [r1]
	bl GetBattlerPosition
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r2, [sp, #8]
	adds r0, r2, r0
	adds r0, #0x36
	movs r1, #3
	mov r8, r6
	mov r2, r8
	ands r2, r1
	mov r8, r2
	ldrb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r2
	mov r2, r8
	orrs r1, r2
	strb r1, [r0]
	mov r1, sb
	lsls r0, r1, #1
	add r0, sb
	lsls r0, r0, #2
	ldr r2, [sp, #8]
	adds r0, r2, r0
	str r0, [sp, #0xc]
	adds r5, r0, #0
	adds r5, #0x53
	lsls r2, r6, #6
	ldrb r1, [r5]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	ldr r1, _0817E1D0
	lsls r4, r7, #1
	adds r0, r4, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r0, #0
	adds r1, r6, #0
	movs r3, #0
	bl AddMovePoints
	ldr r0, [sp]
	adds r1, r7, #0
	adds r2, r6, #0
	bl AddPointsBasedOnWeather
	ldr r0, [sp, #4]
	ldrb r1, [r0, #0x12]
	movs r0, #0xf
	ands r0, r1
	str r4, [sp, #0x10]
	cmp r0, #0
	beq _0817E0E8
	movs r0, #7
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl AddMovePoints
_0817E0E8:
	ldr r0, _0817E1D4
	cmp r7, r0
	bne _0817E11E
	mov r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #1
	ldr r2, _0817E1CC
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r1, #1
	movs r0, #7
	ands r1, r0
	ldrb r2, [r5]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r2, [sp, #0xc]
	adds r2, #0x56
	ldrb r1, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r2]
_0817E11E:
	cmp r7, #0x78
	beq _0817E126
	cmp r7, #0x99
	bne _0817E17E
_0817E126:
	movs r0, #1
	mov r2, sb
	eors r0, r2
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, [sp, #8]
	adds r2, r0, r2
	mov r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #1
	ldr r1, _0817E1CC
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r4, r2, #0
	adds r4, #0x58
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #3
	ldrb r3, [r4]
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	mov r1, r8
	lsls r3, r1, #1
	movs r1, #7
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r4]
	adds r2, #0x57
	ldrb r1, [r2]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x1a
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
_0817E17E:
	ldr r1, _0817E1D0
	ldr r2, [sp, #0x10]
	adds r0, r2, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0, #2]
	ldrb r5, [r0, #1]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl AddMovePoints
	movs r0, #0xe
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl AddMovePoints
	movs r0, #0xb
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl AddMovePoints
	movs r0, #0xc
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl AddMovePoints
_0817E1BC:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817E1CC: .4byte 0x02023D12
_0817E1D0: .4byte 0x082ED220
_0817E1D4: .4byte 0x00000111
	thumb_func_end BattleTv_SetDataBasedOnMove

	thumb_func_start BattleTv_SetDataBasedOnAnimation
BattleTv_SetDataBasedOnAnimation: @ 0x0817E1D8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0817E20C
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0817E29A
	ldr r0, _0817E210
	ldr r0, [r0]
	movs r1, #0x81
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r0, _0817E214
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r5, #0x12
	beq _0817E218
	cmp r5, #0x13
	beq _0817E256
	b _0817E29A
	.align 2, 0
_0817E20C: .4byte 0x02022C90
_0817E210: .4byte 0x02024140
_0817E214: .4byte 0x02023EAF
_0817E218:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4, #0x50]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817E29A
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r3, [r1]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	bl AddMovePoints
	adds r2, r4, #0
	adds r2, #0x57
	ldrb r1, [r2]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	b _0817E296
_0817E256:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817E29A
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r3, [r1]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #1
	bl AddMovePoints
	adds r2, r4, #0
	adds r2, #0x57
	ldrb r1, [r2]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x12
_0817E296:
	orrs r0, r1
	strb r0, [r2]
_0817E29A:
	pop {r4, r5}
	pop {r0}
	bx r0
	thumb_func_end BattleTv_SetDataBasedOnAnimation

	thumb_func_start TryPutLinkBattleTvShowOnAir
TryPutLinkBattleTvShowOnAir: @ 0x0817E2A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	ldr r3, _0817E428
	str r3, [sp, #0xc]
	movs r4, #0
	str r4, [sp, #0x10]
	movs r7, #0
	str r7, [sp, #0x14]
	mov r8, r0
	ldr r0, _0817E42C
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xb3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0817E2D6
	b _0817E51C
_0817E2D6:
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r2, r2, r1
	mov sl, r2
	movs r6, #0
_0817E2E0:
	movs r0, #0x64
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _0817E430
	adds r0, r4, r0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0817E300
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0817E300:
	ldr r5, _0817E434
	adds r0, r4, r5
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0817E316
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0817E316:
	adds r6, #1
	cmp r6, #5
	ble _0817E2E0
	ldr r0, _0817E438
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0817E32A
	b _0817E51C
_0817E32A:
	cmp r8, r7
	beq _0817E330
	b _0817E51C
_0817E330:
	movs r6, #0
	lsls r3, r6, #1
	str r3, [sp, #0x18]
	movs r4, #0x64
	mov r8, r4
_0817E33A:
	mov r1, r8
	muls r1, r6, r1
	ldr r0, _0817E430
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r6, #1
	mov sb, r0
	cmp r7, #0
	beq _0817E39A
	adds r0, r4, #0
	movs r1, #0x2d
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0817E39A
	movs r4, #0
	lsls r0, r6, #3
	mov r2, sl
	adds r1, r0, r2
	movs r3, #3
_0817E370:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r4, [r1]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _0817E370
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	lsls r1, r4, #0x10
	cmp r0, r1
	bge _0817E39A
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	str r7, [sp]
_0817E39A:
	mov r0, r8
	muls r0, r6, r0
	ldr r2, _0817E434
	adds r4, r0, r2
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r3, [sp, #8]
	lsls r3, r3, #0x10
	str r3, [sp, #0x1c]
	cmp r7, #0
	beq _0817E44C
	adds r0, r4, #0
	movs r1, #0x2d
	movs r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0817E44C
	movs r4, #0
	ldr r0, [sp, #0xc]
	lsls r2, r0, #0x10
	movs r3, #1
	lsls r1, r3, #1
	adds r1, #1
	lsls r1, r1, #4
	lsls r0, r6, #3
	adds r0, r0, r1
	mov r3, sl
	adds r1, r0, r3
	movs r3, #3
_0817E3E0:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r4, [r1]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _0817E3E0
	asrs r1, r2, #0x10
	lsls r5, r4, #0x10
	asrs r0, r5, #0x10
	cmp r1, r0
	bne _0817E43C
	mov r0, r8
	muls r0, r6, r0
	ldr r1, _0817E434
	adds r0, r0, r1
	movs r1, #0x19
	movs r2, #0
	bl GetMonData
	adds r4, r0, #0
	ldr r2, [sp, #0x14]
	mov r0, r8
	muls r0, r2, r0
	ldr r3, _0817E434
	adds r0, r0, r3
	movs r1, #0x19
	movs r2, #0
	bl GetMonData
	cmp r4, r0
	bls _0817E44C
	b _0817E440
	.align 2, 0
_0817E428: .4byte 0x00007FFF
_0817E42C: .4byte 0x02024140
_0817E430: .4byte 0x02024190
_0817E434: .4byte 0x020243E8
_0817E438: .4byte 0x02022C90
_0817E43C:
	cmp r1, r0
	ble _0817E44C
_0817E440:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	lsrs r5, r5, #0x10
	str r5, [sp, #0xc]
	str r7, [sp, #4]
_0817E44C:
	mov r6, sb
	cmp r6, #5
	bgt _0817E454
	b _0817E33A
_0817E454:
	movs r4, #0
	movs r6, #0
	movs r3, #0
	ldr r5, _0817E4C0
	ldr r7, [sp, #0x10]
	lsls r0, r7, #3
	mov r1, sl
	adds r2, r0, r1
_0817E464:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	bge _0817E474
	ldrh r4, [r2]
	adds r6, r3, #0
_0817E474:
	adds r2, #2
	adds r3, #1
	cmp r3, #3
	ble _0817E464
	movs r0, #0x64
	ldr r1, [sp, #0x10]
	muls r0, r1, r0
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0xd
	movs r2, #0
	bl GetMonData
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, [sp, #0x1c]
	cmp r2, #0
	beq _0817E51C
	cmp r4, #0
	beq _0817E51C
	ldr r0, _0817E4C4
	ldr r0, [r0]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0817E508
	ldr r3, [sp, #0x10]
	cmp r3, #2
	bhi _0817E4CC
	ldr r0, _0817E4C8
	adds r0, #0x25
	ldrb r0, [r0]
	bl GetLinkTrainerFlankId
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0817E4DC
	b _0817E51C
	.align 2, 0
_0817E4C0: .4byte 0x02024190
_0817E4C4: .4byte 0x02022C90
_0817E4C8: .4byte 0x02024118
_0817E4CC:
	ldr r0, _0817E504
	adds r0, #0x25
	ldrb r0, [r0]
	bl GetLinkTrainerFlankId
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0817E51C
_0817E4DC:
	movs r3, #0
	ldr r7, [sp, #0x14]
	cmp r7, #2
	bls _0817E4E6
	movs r3, #1
_0817E4E6:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0817E504
	adds r1, #0x25
	ldrb r1, [r1]
	bl sub_0806EA10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl PutBattleUpdateOnTheAir
	b _0817E51C
	.align 2, 0
_0817E504: .4byte 0x02024118
_0817E508:
	ldr r0, _0817E52C
	adds r0, #0x25
	ldrb r1, [r0]
	movs r0, #1
	eors r0, r1
	adds r1, r4, #0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl PutBattleUpdateOnTheAir
_0817E51C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817E52C: .4byte 0x02024118
	thumb_func_end TryPutLinkBattleTvShowOnAir

	thumb_func_start AddMovePoints
AddMovePoints: @ 0x0817E530
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	ldr r0, _0817E58C
	ldr r0, [r0]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r1, r1, r0
	mov r8, r1
	movs r2, #0x81
	lsls r2, r2, #2
	adds r7, r0, r2
	ldr r0, _0817E590
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0817E594
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, sl
	cmp r0, #0x1b
	bls _0817E580
	b _0817E918
_0817E580:
	lsls r0, r0, #2
	ldr r1, _0817E598
	adds r1, r0, r1
	ldr r1, [r1]
	mov ip, r0
	mov pc, r1
	.align 2, 0
_0817E58C: .4byte 0x02024140
_0817E590: .4byte 0x02023EAF
_0817E594: .4byte 0x02023EB0
_0817E598: .4byte 0x0817E59C
_0817E59C: @ jump table
	.4byte _0817E60C @ case 0
	.4byte _0817E60C @ case 1
	.4byte _0817E708 @ case 2
	.4byte _0817E648 @ case 3
	.4byte _0817E648 @ case 4
	.4byte _0817E648 @ case 5
	.4byte _0817E648 @ case 6
	.4byte _0817E648 @ case 7
	.4byte _0817E74C @ case 8
	.4byte _0817E74C @ case 9
	.4byte _0817E778 @ case 10
	.4byte _0817E79C @ case 11
	.4byte _0817E824 @ case 12
	.4byte _0817E88C @ case 13
	.4byte _0817E8D4 @ case 14
	.4byte _0817E74C @ case 15
	.4byte _0817E74C @ case 16
	.4byte _0817E72C @ case 17
	.4byte _0817E60C @ case 18
	.4byte _0817E6B6 @ case 19
	.4byte _0817E6F4 @ case 20
	.4byte _0817E74C @ case 21
	.4byte _0817E60C @ case 22
	.4byte _0817E60C @ case 23
	.4byte _0817E60C @ case 24
	.4byte _0817E60C @ case 25
	.4byte _0817E60C @ case 26
	.4byte _0817E60C @ case 27
_0817E60C:
	ldr r1, _0817E63C
	ldr r0, _0817E640
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r6
	lsls r1, r1, #1
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E644
	add r0, ip
	ldr r2, [r0]
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	b _0817E916
	.align 2, 0
_0817E63C: .4byte 0x02023D12
_0817E640: .4byte 0x02023EAF
_0817E644: .4byte 0x085D3294
_0817E648:
	ldr r1, _0817E67C
	add r1, ip
	ldr r7, _0817E680
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #4
	ldr r4, _0817E684
	ldr r1, [r1]
	ldr r3, _0817E688
	ldrh r0, [r1]
	cmp r6, r0
	bne _0817E68C
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r2
	add r0, r8
	ldrh r1, [r1, #2]
	ldrh r2, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	b _0817E918
	.align 2, 0
_0817E67C: .4byte 0x085D3294
_0817E680: .4byte 0x02023D12
_0817E684: .4byte 0x0000FFFF
_0817E688: .4byte 0x02023EAF
_0817E68C:
	adds r1, #4
	ldrh r0, [r1]
	cmp r0, r4
	bne _0817E696
	b _0817E918
_0817E696:
	cmp r6, r0
	bne _0817E68C
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r2
	add r0, r8
	ldrh r1, [r1, #2]
	ldrh r5, [r0]
	adds r1, r1, r5
	strh r1, [r0]
	b _0817E918
_0817E6B6:
	movs r0, #1
	adds r1, r5, #0
	eors r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r0, #0x57
	ldrb r2, [r0]
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	mov r0, sb
	lsls r1, r0, #1
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E6F0
	add r0, ip
	ldr r2, [r0]
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	b _0817E916
	.align 2, 0
_0817E6F0: .4byte 0x085D3294
_0817E6F4:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r0, #0x57
	ldrb r2, [r0]
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
_0817E708:
	mov r0, sb
	lsls r1, r0, #1
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E728
	add r0, ip
	ldr r2, [r0]
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	b _0817E916
	.align 2, 0
_0817E728: .4byte 0x085D3294
_0817E72C:
	lsls r1, r5, #2
	add r1, sb
	lsls r1, r1, #1
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E748
	add r0, ip
	ldr r2, [r0]
	lsls r0, r6, #1
	adds r0, r0, r2
	b _0817E910
	.align 2, 0
_0817E748: .4byte 0x085D3294
_0817E74C:
	lsls r2, r5, #2
	add r2, sb
	lsls r2, r2, #1
	movs r1, #1
	eors r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	add r2, r8
	ldr r0, _0817E774
	add r0, ip
	ldr r1, [r0]
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	b _0817E918
	.align 2, 0
_0817E774: .4byte 0x085D3294
_0817E778:
	lsls r1, r5, #2
	add r1, sb
	lsls r1, r1, #1
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E798
	add r0, ip
	ldr r0, [r0]
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	b _0817E916
	.align 2, 0
_0817E798: .4byte 0x085D3294
_0817E79C:
	lsls r0, r3, #4
	adds r2, r7, r0
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1d
	adds r4, r2, #0
	adds r4, #0x3c
	ldrb r0, [r4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmn r1, r0
	bne _0817E7BA
	b _0817E918
_0817E7BA:
	cmp r6, #0xa
	beq _0817E7C0
	b _0817E918
_0817E7C0:
	cmp r1, #0
	beq _0817E7EC
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsrs r0, r0, #6
	adds r1, r1, r0
	lsls r1, r1, #1
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E820
	add r0, ip
	ldr r0, [r0]
	ldrh r0, [r0]
	ldrh r5, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_0817E7EC:
	ldrb r0, [r4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817E7F8
	b _0817E918
_0817E7F8:
	subs r1, r0, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	lsrs r0, r0, #6
	adds r1, r1, r0
	lsls r1, r1, #1
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E820
	add r0, ip
	ldr r0, [r0]
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	b _0817E916
	.align 2, 0
_0817E820: .4byte 0x085D3294
_0817E824:
	lsls r1, r3, #4
	adds r1, r7, r1
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r4, [r0]
	lsls r0, r4, #0x1a
	lsrs r2, r0, #0x1d
	adds r5, r1, #0
	adds r5, #0x3c
	ldrb r0, [r5]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	cmn r2, r0
	beq _0817E918
	cmp r6, #0xd
	bne _0817E918
	cmp r2, #0
	beq _0817E86A
	subs r1, r2, #1
	lsls r1, r1, #2
	lsrs r0, r4, #6
	adds r1, r1, r0
	lsls r1, r1, #1
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E888
	add r0, ip
	ldr r0, [r0]
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_0817E86A:
	ldrb r2, [r5]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817E918
	subs r1, r0, #1
	lsls r1, r1, #2
	lsrs r0, r2, #6
	adds r1, r1, r0
	lsls r1, r1, #1
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	b _0817E906
	.align 2, 0
_0817E888: .4byte 0x085D3294
_0817E88C:
	cmp r6, #8
	bhi _0817E918
	cmp r5, #0
	beq _0817E918
	lsls r0, r3, #1
	adds r3, r0, r3
	lsls r0, r3, #2
	adds r2, r7, r0
	adds r0, r2, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817E918
	subs r1, r0, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x54
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r1, r1, r0
	lsls r1, r1, #1
	lsls r0, r3, #4
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E8D0
	add r0, ip
	ldr r0, [r0]
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	b _0817E916
	.align 2, 0
_0817E8D0: .4byte 0x085D3294
_0817E8D4:
	cmp r6, #8
	bls _0817E918
	cmp r5, #0
	beq _0817E918
	lsls r0, r3, #1
	adds r3, r0, r3
	lsls r0, r3, #2
	adds r2, r7, r0
	adds r0, r2, #0
	adds r0, #0x50
	ldrh r0, [r0]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817E918
	subs r1, r0, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x54
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, r1, r0
	lsls r1, r1, #1
	lsls r0, r3, #4
_0817E906:
	adds r1, r1, r0
	add r1, r8
	ldr r0, _0817E928
	add r0, ip
	ldr r0, [r0]
_0817E910:
	ldrh r0, [r0]
	ldrh r5, [r1]
	adds r0, r0, r5
_0817E916:
	strh r0, [r1]
_0817E918:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817E928: .4byte 0x085D3294
	thumb_func_end AddMovePoints

	thumb_func_start AddPointsOnFainting
AddPointsOnFainting: @ 0x0817E92C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0817E988
	ldr r0, [r0]
	movs r1, #0x81
	lsls r1, r1, #2
	adds r5, r0, r1
	ldr r3, _0817E98C
	mov r8, r3
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0817E990
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r6, r5, r0
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsrs r3, r0, #5
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	cmp r0, #0
	bne _0817E974
	b _0817ECFC
_0817E974:
	subs r0, #1
	cmp r0, #0xe
	bls _0817E97C
	b _0817ED68
_0817E97C:
	lsls r0, r0, #2
	ldr r1, _0817E994
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0817E988: .4byte 0x02024140
_0817E98C: .4byte 0x02023EAF
_0817E990: .4byte 0x02023EB0
_0817E994: .4byte 0x0817E998
_0817E998: @ jump table
	.4byte _0817E9D4 @ case 0
	.4byte _0817EA00 @ case 1
	.4byte _0817EA2C @ case 2
	.4byte _0817EA80 @ case 3
	.4byte _0817EAAA @ case 4
	.4byte _0817EAD2 @ case 5
	.4byte _0817EAFA @ case 6
	.4byte _0817EB18 @ case 7
	.4byte _0817EB46 @ case 8
	.4byte _0817EB78 @ case 9
	.4byte _0817EC00 @ case 10
	.4byte _0817EC2E @ case 11
	.4byte _0817EC6E @ case 12
	.4byte _0817ECC8 @ case 13
	.4byte _0817ED68 @ case 14
_0817E9D4:
	lsls r0, r3, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r3, r5, r0
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1d
	cmp r1, #0
	bne _0817E9EC
	b _0817ED68
_0817E9EC:
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsls r3, r3, #0x1c
	b _0817ED30
_0817EA00:
	lsls r0, r3, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r3, r5, r0
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r1, r0, #0x1d
	cmp r1, #0
	bne _0817EA18
	b _0817ED68
_0817EA18:
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsls r3, r3, #0x1a
	b _0817ED30
_0817EA2C:
	lsls r0, r3, #2
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r5, r5, r0
	ldrb r0, [r5]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1d
	cmp r1, #0
	beq _0817EA60
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	subs r0, r1, #1
	lsls r0, r0, #2
	ldrb r3, [r5, #2]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x13
	movs r1, #0
	bl AddMovePoints
_0817EA60:
	ldrb r0, [r5]
	lsls r0, r0, #0x1a
	lsrs r1, r0, #0x1d
	cmp r1, #0
	bne _0817EA6C
	b _0817ED68
_0817EA6C:
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	subs r0, r1, #1
	lsls r0, r0, #2
	ldrb r3, [r5, #2]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	b _0817ED34
_0817EA80:
	lsls r0, r3, #2
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r1, r5, r0
	ldrh r0, [r1]
	lsls r0, r0, #0x17
	lsrs r3, r0, #0x1d
	cmp r3, #0
	bne _0817EA98
	b _0817ED68
_0817EA98:
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	subs r0, r3, #1
	lsls r0, r0, #2
	ldrb r3, [r1, #2]
	lsrs r3, r3, #6
	adds r3, r3, r0
	b _0817ED34
_0817EAAA:
	lsls r0, r3, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r3, r5, r0
	ldrh r0, [r3, #0x30]
	lsls r0, r0, #0x17
	lsrs r1, r0, #0x1d
	cmp r1, #0
	bne _0817EABE
	b _0817ED68
_0817EABE:
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsrs r3, r3, #6
	b _0817ED32
_0817EAD2:
	lsls r0, r3, #3
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r3, r5, r0
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r1, r0, #0x1d
	cmp r1, #0
	bne _0817EAEA
	b _0817ED68
_0817EAEA:
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x33
	b _0817ED2C
_0817EAFA:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r5, r0
	adds r0, r3, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1d
	cmp r1, #0
	bne _0817EB12
	b _0817ED68
_0817EB12:
	movs r0, #1
	adds r2, r4, #0
	b _0817ED22
_0817EB18:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3, #0x50]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817EB2C
	b _0817ED68
_0817EB2C:
	adds r2, r4, #0
	subs r1, r0, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x55
	ldrb r3, [r0]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	adds r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x14
	b _0817ED3A
_0817EB46:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r5, r0
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0817EB5E
	b _0817ED68
_0817EB5E:
	adds r2, r4, #0
	subs r1, r0, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x55
	ldrb r3, [r0]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	adds r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x14
	b _0817ED3A
_0817EB78:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r3, r5, r0
	adds r0, r3, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _0817EBC0
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsrs r0, r0, #5
	subs r6, r0, #1
	ldr r1, _0817EBF8
	ldr r0, _0817EBFC
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	beq _0817EBC0
	adds r2, r4, #0
	lsls r1, r6, #2
	adds r0, r3, #0
	adds r0, #0x55
	ldrb r3, [r0]
	lsrs r3, r3, #6
	adds r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x13
	movs r1, #0
	bl AddMovePoints
_0817EBC0:
	movs r1, #1
	eors r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, r0
	adds r0, r1, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0817EBDA
	b _0817ED68
_0817EBDA:
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	adds r0, r1, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsrs r0, r0, #5
	subs r0, #1
	lsls r0, r0, #2
	adds r1, #0x55
	ldrb r3, [r1]
	lsrs r3, r3, #6
	adds r3, r3, r0
	b _0817ED34
	.align 2, 0
_0817EBF8: .4byte 0x02023D12
_0817EBFC: .4byte 0x02023EAF
_0817EC00:
	movs r0, #1
	eors r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r5, r1
	adds r1, #0x56
	ldrb r0, [r1]
	lsls r0, r0, #0x19
	lsrs r5, r0, #0x1d
	cmp r5, #0
	bne _0817EC1A
	b _0817ED68
_0817EC1A:
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	subs r0, r5, #1
	lsls r0, r0, #2
	ldrh r3, [r1]
	lsls r3, r3, #0x17
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	b _0817ED34
_0817EC2E:
	lsls r2, r4, #4
	movs r1, #1
	adds r0, r4, #0
	eors r0, r1
	lsls r6, r0, #0x18
	adds r0, r5, #0
	adds r0, #0x30
	adds r4, r2, r0
	movs r5, #1
_0817EC40:
	ldr r0, [r4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1d
	cmp r0, #0
	beq _0817EC64
	subs r0, #1
	lsls r0, r0, #2
	ldrb r3, [r4, #3]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x13
	movs r1, #0
	lsrs r2, r6, #0x18
	bl AddMovePoints
_0817EC64:
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0817EC40
	b _0817ED68
_0817EC6E:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0x58
	ldrb r3, [r0]
	lsls r0, r3, #0x1f
	cmp r0, #0
	beq _0817EC9C
	adds r2, r4, #0
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1d
	subs r0, #1
	lsls r0, r0, #2
	lsls r3, r3, #0x1d
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x13
	movs r1, #0
	bl AddMovePoints
_0817EC9C:
	movs r0, #1
	eors r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r5, r1
	adds r1, #0x58
	ldrb r1, [r1]
	lsls r0, r1, #0x1f
	cmp r0, #0
	beq _0817ED68
	movs r0, #1
	adds r2, r4, #0
	eors r2, r0
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1d
	subs r0, #1
	lsls r0, r0, #2
	lsls r3, r1, #0x1d
	lsrs r3, r3, #0x1e
	adds r3, r3, r0
	b _0817ED34
_0817ECC8:
	cmp r7, #1
	bne _0817ED68
	adds r2, r4, #0
	ldr r1, _0817ECF4
	ldr r0, _0817ECF8
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #2
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0x53
	ldrb r3, [r0]
	lsrs r3, r3, #6
	adds r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x14
	b _0817ED3A
	.align 2, 0
_0817ECF4: .4byte 0x02023D12
_0817ECF8: .4byte 0x02023EAF
_0817ECFC:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r5, r0
	adds r0, r3, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	cmp r0, #7
	bne _0817ED42
	adds r0, r3, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1d
	cmp r1, #0
	beq _0817ED68
	movs r0, #1
_0817ED22:
	eors r2, r0
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x54
_0817ED2C:
	ldrb r3, [r0]
	lsls r3, r3, #0x1e
_0817ED30:
	lsrs r3, r3, #0x1e
_0817ED32:
	adds r3, r3, r1
_0817ED34:
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x13
_0817ED3A:
	movs r1, #0
	bl AddMovePoints
	b _0817ED68
_0817ED42:
	adds r2, r4, #0
	ldr r1, _0817ED74
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r0, r6, #0
	adds r0, #0x53
	ldrb r3, [r0]
	lsrs r3, r3, #6
	adds r3, r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0x14
	movs r1, #0
	bl AddMovePoints
_0817ED68:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817ED74: .4byte 0x02023D12
	thumb_func_end AddPointsOnFainting

	thumb_func_start TrySetBattleSeminarShow
TrySetBattleSeminarShow: @ 0x0817ED78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r7, _0817F034
	ldr r0, [r7]
	ldr r1, _0817F038
	ands r0, r1
	cmp r0, #0
	beq _0817ED92
	b _0817F0A6
_0817ED92:
	ldr r4, _0817F03C
	ldrb r0, [r4]
	bl GetBattlerSide
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0817EDA4
	b _0817F0A6
_0817EDA4:
	ldr r5, _0817F040
	ldrb r4, [r4]
	movs r1, #0x58
	adds r6, r4, #0
	muls r6, r1, r6
	adds r0, r6, r5
	ldrb r0, [r0, #0x1e]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	bgt _0817EDBC
	b _0817F0A6
_0817EDBC:
	ldr r0, _0817F044
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r0, r0, r5
	ldrb r0, [r0, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0817EDD0
	b _0817F0A6
_0817EDD0:
	ldr r0, _0817F048
	ldrh r1, [r0]
	cmp r1, #0xed
	bne _0817EDDA
	b _0817F0A6
_0817EDDA:
	ldr r0, _0817F04C
	cmp r1, r0
	bne _0817EDE2
	b _0817F0A6
_0817EDE2:
	ldr r0, [r7]
	movs r1, #0xc8
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _0817EDF0
	b _0817F0A6
_0817EDF0:
	ldr r3, _0817F050
	ldr r2, _0817F054
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r6
	adds r1, r5, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	adds r6, r2, #0
	cmp r0, #0
	bne _0817EE16
	b _0817F0A6
_0817EE16:
	movs r5, #0
	str r1, [sp, #0x24]
	ldr r1, _0817F058
	ldr r4, _0817F05C
	adds r3, r1, #0
	adds r2, r1, #0
_0817EE22:
	ldr r0, [sp, #0x24]
	ldrh r7, [r2]
	cmp r0, r7
	beq _0817EE36
	adds r3, #2
	adds r2, #2
	adds r5, #1
	ldrh r0, [r3]
	cmp r0, r4
	bne _0817EE22
_0817EE36:
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _0817F05C
	cmp r1, r0
	beq _0817EE44
	b _0817F0A6
_0817EE44:
	ldr r2, _0817F03C
	ldrb r0, [r2]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #2
	mov r1, sp
	adds r1, r1, r0
	adds r1, #0x10
	ldr r0, _0817F060
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0817F048
	ldrh r1, [r0]
	str r1, [sp, #0x24]
	movs r5, #0
	add r3, sp, #0x20
	mov sl, r3
	mov r8, r0
	add r7, sp, #0x10
	ldr r4, _0817F044
	mov sb, r4
_0817EE6E:
	lsls r1, r5, #1
	ldr r6, _0817F03C
	ldrb r0, [r6]
	movs r2, #0x58
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _0817F040
	adds r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r3, r8
	strh r0, [r3]
	movs r6, #0
	mov r4, sl
	strh r6, [r4]
	ldrh r0, [r3]
	adds r1, r7, #0
	mov r2, sl
	bl ShouldCalculateDamage
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0817EF60
	ldr r4, _0817F064
	mov r1, sb
	ldrb r0, [r1]
	bl GetBattlerPosition
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r3, [r1]
	ldr r2, _0817F03C
	ldrb r0, [r2]
	movs r4, #0x58
	muls r0, r4, r0
	ldr r6, _0817F040
	adds r0, r0, r6
	mov r2, sb
	ldrb r1, [r2]
	muls r1, r4, r1
	adds r1, r1, r6
	mov r4, r8
	ldrh r2, [r4]
	mov r6, sl
	ldrh r4, [r6]
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldr r6, _0817F03C
	ldrb r4, [r6]
	str r4, [sp, #8]
	mov r6, sb
	ldrb r4, [r6]
	str r4, [sp, #0xc]
	bl CalculateBaseDamage
	adds r3, r0, #0
	ldr r4, _0817F060
	str r3, [r4]
	ldr r1, _0817F068
	ldr r2, _0817F03C
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0817EF16
	ldr r2, _0817F050
	mov r6, r8
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	cmp r0, #0xd
	bne _0817EF16
	lsls r0, r3, #1
	str r0, [r4]
_0817EF16:
	ldr r0, _0817F06C
	ldr r6, _0817F03C
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bge _0817EF38
	ldr r4, _0817F060
	ldr r1, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	movs r1, #0xa
	bl __divsi3
	str r0, [r4]
_0817EF38:
	mov r1, r8
	ldrh r0, [r1]
	ldrb r1, [r6]
	mov r3, sb
	ldrb r2, [r3]
	bl TypeCalc
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0817F060
	ldr r0, [r0]
	str r0, [r7]
	cmp r0, #0
	bne _0817EF60
	movs r0, #0x29
	ands r0, r1
	cmp r0, #0
	bne _0817EF60
	movs r0, #1
	str r0, [r7]
_0817EF60:
	adds r7, #4
	adds r5, #1
	cmp r5, #3
	ble _0817EE6E
	movs r5, #0
	ldr r3, _0817F03C
	ldr r6, _0817F054
	ldr r4, _0817F070
	mov r8, r4
	movs r7, #0x64
	mov sb, r7
	mov sl, r6
_0817EF78:
	ldrb r0, [r3]
	adds r0, r0, r6
	ldrb r2, [r0]
	cmp r5, r2
	bne _0817EF84
	b _0817F080
_0817EF84:
	lsls r0, r5, #2
	mov r1, sp
	adds r1, r1, r0
	adds r1, #0x10
	lsls r0, r2, #2
	add r0, sp
	adds r0, #0x10
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	ble _0817F080
	movs r7, #1
	cmp r2, #0
	beq _0817EFA2
	movs r7, #0
_0817EFA2:
	movs r5, #0
	ldr r4, _0817F044
	ldr r6, _0817F074
	ldr r0, _0817F03C
	ldrb r0, [r0]
	add r0, sl
	ldrb r3, [r0]
	add r2, sp, #0x10
_0817EFB2:
	cmp r5, r3
	beq _0817EFC6
	lsls r0, r7, #2
	add r0, sp
	adds r0, #0x10
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	ble _0817EFC6
	adds r7, r5, #0
_0817EFC6:
	adds r2, #4
	adds r5, #1
	cmp r5, #3
	ble _0817EFB2
	ldrb r0, [r4]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r6
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r6, r0, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r2, _0817F03C
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	mov r3, sb
	muls r3, r0, r3
	adds r0, r3, #0
	ldr r1, _0817F078
	adds r0, r0, r1
	movs r1, #0xb
	movs r2, #0
	bl GetMonData
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _0817F03C
	ldrb r3, [r4]
	mov r2, sl
	adds r0, r3, r2
	ldrb r2, [r0]
	movs r0, #0x58
	adds r4, r3, #0
	muls r4, r0, r4
	ldr r5, _0817F07C
	adds r3, r4, r5
	lsls r0, r7, #1
	adds r0, r0, r4
	adds r0, r0, r5
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	bl sub_080EEE7C
	b _0817F088
	.align 2, 0
_0817F034: .4byte 0x02022C90
_0817F038: .4byte 0x02000003
_0817F03C: .4byte 0x02023EAF
_0817F040: .4byte 0x02023D28
_0817F044: .4byte 0x02023EB0
_0817F048: .4byte 0x02023E8E
_0817F04C: .4byte 0x00000137
_0817F050: .4byte 0x082ED220
_0817F054: .4byte 0x02024154
_0817F058: .4byte 0x085D2F0C
_0817F05C: .4byte 0x0000FFFF
_0817F060: .4byte 0x02023E94
_0817F064: .4byte 0x02023F32
_0817F068: .4byte 0x02023F50
_0817F06C: .4byte 0x02023FE0
_0817F070: .4byte 0x02023D12
_0817F074: .4byte 0x020243E8
_0817F078: .4byte 0x02024190
_0817F07C: .4byte 0x02023D34
_0817F080:
	adds r5, #1
	cmp r5, #3
	bgt _0817F088
	b _0817EF78
_0817F088:
	ldr r2, _0817F0B8
	ldr r1, _0817F0BC
	ldr r0, _0817F0C0
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _0817F0C4
	mov r3, sp
	ldrh r3, [r3, #0x24]
	strh r3, [r0]
_0817F0A6:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0817F0B8: .4byte 0x02023E94
_0817F0BC: .4byte 0x02024154
_0817F0C0: .4byte 0x02023EAF
_0817F0C4: .4byte 0x02023E8E
	thumb_func_end TrySetBattleSeminarShow

	thumb_func_start ShouldCalculateDamage
ShouldCalculateDamage: @ 0x0817F0C8
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	mov ip, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _0817F110
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0817F132
	movs r4, #0
	ldr r5, _0817F114
	ldr r7, _0817F118
	adds r3, r5, #0
	adds r1, r5, #0
_0817F0EC:
	ldrh r0, [r1]
	cmp r2, r0
	beq _0817F0FE
	adds r3, #2
	adds r1, #2
	adds r4, #1
	ldrh r0, [r3]
	cmp r0, r7
	bne _0817F0EC
_0817F0FE:
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, _0817F118
	cmp r1, r0
	beq _0817F11C
	movs r0, #0
	str r0, [r6]
	b _0817F14C
	.align 2, 0
_0817F110: .4byte 0x082ED220
_0817F114: .4byte 0x085D2F0C
_0817F118: .4byte 0x0000FFFF
_0817F11C:
	cmp r2, #0x95
	bne _0817F140
	ldr r2, _0817F138
	ldr r0, _0817F13C
	ldrb r1, [r0]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x2a
	ldrb r0, [r0]
	asrs r0, r0, #1
_0817F132:
	str r0, [r6]
	movs r0, #0
	b _0817F14C
	.align 2, 0
_0817F138: .4byte 0x02023D28
_0817F13C: .4byte 0x02023EAF
_0817F140:
	cmp r2, #0xde
	bne _0817F14A
	movs r0, #0xa
	mov r1, ip
	strh r0, [r1]
_0817F14A:
	movs r0, #1
_0817F14C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end ShouldCalculateDamage

	thumb_func_start BattleTv_ClearExplosionFaintCause
BattleTv_ClearExplosionFaintCause: @ 0x0817F154
	push {r4, r5, lr}
	ldr r0, _0817F1D8
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0817F1D0
	ldr r0, _0817F1DC
	ldr r3, [r0]
	ldr r0, _0817F1E0
	adds r4, r3, r0
	ldrb r2, [r4]
	subs r1, #0x21
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4]
	ldr r0, _0817F1E4
	adds r2, r3, r0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldrb r5, [r4]
	movs r1, #0x1f
	adds r0, r1, #0
	ands r0, r5
	strb r0, [r4]
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	movs r0, #0x97
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrb r2, [r4]
	movs r1, #0x39
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4]
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r3, r3, r0
	ldrb r0, [r3]
	ands r1, r0
	strb r1, [r3]
	ldrb r2, [r4]
	movs r1, #7
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4]
	ldrb r0, [r3]
	ands r1, r0
	strb r1, [r3]
	ldrb r2, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4]
	ldrb r0, [r3]
	ands r1, r0
	strb r1, [r3]
_0817F1D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0817F1D8: .4byte 0x02022C90
_0817F1DC: .4byte 0x02024140
_0817F1E0: .4byte 0x0000025B
_0817F1E4: .4byte 0x00000267
	thumb_func_end BattleTv_ClearExplosionFaintCause

	thumb_func_start GetBattlerMoveSlotId
GetBattlerMoveSlotId: @ 0x0817F1E8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	adds r0, r5, #0
	bl GetBattlerSide
	lsls r0, r0, #0x18
	ldr r6, _0817F20C
	cmp r0, #0
	bne _0817F202
	ldr r6, _0817F210
_0817F202:
	movs r4, #0
	ldr r1, _0817F214
	lsls r0, r5, #1
	adds r5, r0, r1
	b _0817F21A
	.align 2, 0
_0817F20C: .4byte 0x020243E8
_0817F210: .4byte 0x02024190
_0817F214: .4byte 0x02023D12
_0817F218:
	adds r4, #1
_0817F21A:
	cmp r4, #3
	bgt _0817F234
	ldrh r1, [r5]
	movs r0, #0x64
	muls r0, r1, r0
	adds r0, r6, r0
	adds r1, r4, #0
	adds r1, #0xd
	movs r2, #0
	bl GetMonData
	cmp r0, r7
	bne _0817F218
_0817F234:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
	thumb_func_end GetBattlerMoveSlotId

	thumb_func_start AddPointsBasedOnWeather
AddPointsBasedOnWeather: @ 0x0817F240
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r5, r2, #0
	movs r0, #7
	ands r0, r3
	cmp r0, #0
	beq _0817F260
	movs r0, #3
	b _0817F276
_0817F260:
	movs r0, #0x60
	ands r0, r3
	cmp r0, #0
	beq _0817F26C
	movs r0, #4
	b _0817F276
_0817F26C:
	movs r0, #0x18
	ands r0, r3
	cmp r0, #0
	beq _0817F27E
	movs r0, #5
_0817F276:
	movs r3, #0
	bl AddMovePoints
	b _0817F292
_0817F27E:
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	beq _0817F292
	movs r0, #6
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl AddMovePoints
_0817F292:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	thumb_func_end AddPointsBasedOnWeather

