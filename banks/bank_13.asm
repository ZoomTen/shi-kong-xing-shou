_LoadTextFaceExtraSprites2::
	ld de, FaceSprites2_GFX_Pointers
	ld a, [wTextFaceID]
	sub 58
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8700
	ld bc, $0100
	call CopyBytesVRAM
	call DelayFrame
	ld de, FaceSprites2_Palette_Pointers
	pop hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 8
	ld c, $88
	call LoadPalettes_OCPD
	ret

FaceSprites2_Palette_Pointers:
	dw .face_58
	dw .face_59
	dw .face_60
	dw .face_60
	dw .face_60
	dw .face_63
	dw .face_63
	dw .face_63
	dw .face_63
	dw .face_67
	dw .face_67
	dw .face_67
	dw .face_67
	dw .face_71
	dw .face_71
	dw .face_71
	dw .face_71
	dw .face_75
	dw .face_76
	dw .face_77
	dw .face_78
	dw .face_79
	dw .face_80
	dw .face_81
	dw .face_82
	dw .face_83
	dw .face_84
	dw .face_84
	dw .face_86
	dw .face_87
	dw .face_88
	dw .face_89
	dw .face_89
	dw .face_91
	dw .face_91
	dw .face_93
	dw .face_94
	dw .face_95
	dw .face_96
	dw .face_97
	dw .face_98
	dw .face_99
	dw .face_100
	dw .face_101
	dw .face_102
	dw .face_103
	dw .face_104
	dw .face_104
	dw .face_106
	dw .face_107
	dw .face_108
	dw .face_109
	dw .face_110
	dw .face_111
	dw .face_112
	dw .face_113
	dw .face_113
	dw .face_115
	dw .face_116
	dw .face_117
	dw .face_118
	dw .face_119
	dw .face_120

.face_58: INCBIN "gfx/faces/face_58.obj.gbcpal"
.face_59: INCBIN "gfx/faces/face_59.obj.gbcpal"
.face_60: INCBIN "gfx/faces/face_60.obj.gbcpal"
.face_63: INCBIN "gfx/faces/face_63.obj.gbcpal"
.face_67: INCBIN "gfx/faces/face_67.obj.gbcpal"
.face_71: INCBIN "gfx/faces/face_71.obj.gbcpal"
.face_75: INCBIN "gfx/faces/face_75.obj.gbcpal"
.face_76: INCBIN "gfx/faces/face_76.obj.gbcpal"
.face_77: INCBIN "gfx/faces/face_77.obj.gbcpal"
.face_78: INCBIN "gfx/faces/face_78.obj.gbcpal"
.face_79: INCBIN "gfx/faces/face_79.obj.gbcpal"
.face_80: INCBIN "gfx/faces/face_80.obj.gbcpal"
.face_81: INCBIN "gfx/faces/face_81.obj.gbcpal"
.face_82: INCBIN "gfx/faces/face_82.obj.gbcpal"
.face_83: INCBIN "gfx/faces/face_83.obj.gbcpal"
.face_84: INCBIN "gfx/faces/face_84.obj.gbcpal"
.face_86: INCBIN "gfx/faces/face_86.obj.gbcpal"
.face_87: INCBIN "gfx/faces/face_87.obj.gbcpal"
.face_88: INCBIN "gfx/faces/face_88.obj.gbcpal"
.face_89: INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_91: INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_93: dr $4c153, $4c15b ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_94: dr $4c15b, $4c163 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_95: dr $4c163, $4c16b ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_96: dr $4c16b, $4c173 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_97: dr $4c173, $4c17b ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_98: dr $4c17b, $4c183 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_99: dr $4c183, $4c18b ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_100: dr $4c18b, $4c193 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_101: dr $4c193, $4c19b ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_102: dr $4c19b, $4c1a3 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_103: dr $4c1a3, $4c1ab ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_104: dr $4c1ab, $4c1b3 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_106: dr $4c1b3, $4c1bb ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_107: dr $4c1bb, $4c1c3 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_108: dr $4c1c3, $4c1cb ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_109: dr $4c1cb, $4c1d3 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_110: dr $4c1d3, $4c1db ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_111: dr $4c1db, $4c1e3 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_112: dr $4c1e3, $4c1eb ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_113: dr $4c1eb, $4c1f3 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_115: dr $4c1f3, $4c1fb ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_116: dr $4c1fb, $4c203 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_117: dr $4c203, $4c20b ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_118: dr $4c20b, $4c213 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_119: dr $4c213, $4c21b ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"
.face_120: dr $4c21b, $4c223 ;Nonmatching for now ;INCBIN "gfx/faces/face_89.obj.gbcpal"

FaceSprites2_GFX_Pointers:
	dw .face_58
	dw .face_59
	dw .face_60
	dw .face_61
	dw .face_62
	dw .face_63
	dw .face_64
	dw .face_65
	dw .face_66
	dw .face_67
	dw .face_68
	dw .face_69
	dw .face_70
	dw .face_71
	dw .face_72
	dw .face_73
	dw .face_74
	dw .face_75
	dw .face_76
	dw .face_77
	dw .face_78
	dw .face_79
	dw .face_80
	dw .face_81
	dw .face_82
	dw .face_83
	dw .face_84
	dw .face_84
	dw .face_86
	dw .face_87
	dw .face_88
	dw .face_89
	dw .face_89
	dw .face_91
	dw .face_91
	dw .face_93
	dw .face_94
	dw .face_95
	dw .face_96
	dw .face_97
	dw .face_98
	dw .face_99
	dw .face_100
	dw .face_101
	dw .face_102
	dw .face_103
	dw .face_104
	dw .face_104
	dw .face_106
	dw .face_107
	dw .face_108
	dw .face_109
	dw .face_110
	dw .face_111
	dw .face_112
	dw .face_113
	dw .face_113
	dw .face_115
	dw .face_116
	dw .face_117
	dw .face_118
	dw .face_119
	dw .face_120

.face_58: INCBIN "gfx/faces/face_58.obj.2bpp"
.face_59: INCBIN "gfx/faces/face_59.obj.2bpp"
.face_60: INCBIN "gfx/faces/face_60.obj.2bpp"
.face_61: INCBIN "gfx/faces/face_61.obj.2bpp"
.face_62: INCBIN "gfx/faces/face_62.obj.2bpp"
.face_63: INCBIN "gfx/faces/face_63.obj.2bpp"
.face_64: INCBIN "gfx/faces/face_64.obj.2bpp"
.face_65: INCBIN "gfx/faces/face_65.obj.2bpp"
.face_66: INCBIN "gfx/faces/face_66.obj.2bpp"
.face_67: INCBIN "gfx/faces/face_67.obj.2bpp"
.face_68: INCBIN "gfx/faces/face_68.obj.2bpp"
.face_69: INCBIN "gfx/faces/face_69.obj.2bpp"
.face_70: INCBIN "gfx/faces/face_70.obj.2bpp"
.face_71: INCBIN "gfx/faces/face_71.obj.2bpp"
.face_72: INCBIN "gfx/faces/face_72.obj.2bpp"
.face_73: INCBIN "gfx/faces/face_73.obj.2bpp"
.face_74: INCBIN "gfx/faces/face_74.obj.2bpp"
.face_75: INCBIN "gfx/faces/face_75.obj.2bpp"
.face_76: INCBIN "gfx/faces/face_76.obj.2bpp"
.face_77: INCBIN "gfx/faces/face_77.obj.2bpp"
.face_78: INCBIN "gfx/faces/face_78.obj.2bpp"
.face_79: INCBIN "gfx/faces/face_79.obj.2bpp"
.face_80: INCBIN "gfx/faces/face_80.obj.2bpp"
.face_81: INCBIN "gfx/faces/face_81.obj.2bpp"
.face_82: INCBIN "gfx/faces/face_82.obj.2bpp"
.face_83: INCBIN "gfx/faces/face_83.obj.2bpp"
.face_84: INCBIN "gfx/faces/face_84.obj.2bpp"
.face_86: INCBIN "gfx/faces/face_86.obj.2bpp"
.face_87: INCBIN "gfx/faces/face_87.obj.2bpp"
.face_88: INCBIN "gfx/faces/face_88.obj.2bpp"
.face_89: INCBIN "gfx/faces/face_89.obj.2bpp"
.face_91: INCBIN "gfx/faces/face_91.obj.2bpp"
.face_93: INCBIN "gfx/faces/face_93.obj.2bpp"
.face_94: INCBIN "gfx/faces/face_94.obj.2bpp"
.face_95: INCBIN "gfx/faces/face_95.obj.2bpp"
.face_96: INCBIN "gfx/faces/face_96.obj.2bpp"
.face_97: INCBIN "gfx/faces/face_97.obj.2bpp"
.face_98: INCBIN "gfx/faces/face_98.obj.2bpp"
.face_99: INCBIN "gfx/faces/face_99.obj.2bpp"
.face_100: INCBIN "gfx/faces/face_100.obj.2bpp"
.face_101: INCBIN "gfx/faces/face_101.obj.2bpp"
.face_102: INCBIN "gfx/faces/face_102.obj.2bpp"
.face_103: INCBIN "gfx/faces/face_103.obj.2bpp"
.face_104: INCBIN "gfx/faces/face_104.obj.2bpp"
.face_106: INCBIN "gfx/faces/face_106.obj.2bpp"
.face_107: INCBIN "gfx/faces/face_107.obj.2bpp"
.face_108: INCBIN "gfx/faces/face_108.obj.2bpp"
.face_109: INCBIN "gfx/faces/face_109.obj.2bpp"
.face_110: INCBIN "gfx/faces/face_110.obj.2bpp"
.face_111: INCBIN "gfx/faces/face_111.obj.2bpp"
.face_112: INCBIN "gfx/faces/face_112.obj.2bpp"
.face_113: INCBIN "gfx/faces/face_113.obj.2bpp"
.face_115: INCBIN "gfx/faces/face_115.obj.2bpp"
.face_116: INCBIN "gfx/faces/face_116.obj.2bpp"
.face_117: INCBIN "gfx/faces/face_117.obj.2bpp"
.face_118: INCBIN "gfx/faces/face_118.obj.2bpp"
.face_119: INCBIN "gfx/faces/face_119.obj.2bpp"
.face_120: INCBIN "gfx/faces/face_120.obj.2bpp"

SECTION "banknum13", ROMX[$7fff], BANK[$13]
	db $13
