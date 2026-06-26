; Per-species base-stat factors and the level growth curve.
; Final stat = StatFactorTable[species*6 + stat] * StatBaseTable[level] / 100
; (see _ComputeStatValue in engine/battle/stat_calc.asm).
; Stat columns: HP, ATK(攻擊), DEF(防禦), SPD(速度), MAG(法力), MDEF(魔防)

StatFactorTable::
	mon_stats $00, $00, $00, $00, $00, $00 ; 000 
	mon_stats $46, $5f, $4c, $48, $5a, $45 ; 001 暴躁猴
	mon_stats $5f, $50, $50, $32, $6e, $50 ; 002 綠巨人
	mon_stats $4f, $62, $44, $4c, $95, $a2 ; 003 鐵拳蛙
	mon_stats $56, $41, $34, $66, $83, $7d ; 004 橡皮管
	mon_stats $41, $56, $41, $45, $46, $49 ; 005 金剛獸
	mon_stats $48, $47, $4b, $41, $3f, $46 ; 006 粉紅娘
	mon_stats $44, $4e, $46, $47, $4c, $43 ; 007 青草精
	mon_stats $46, $37, $35, $3f, $38, $3e ; 008 怪笑爺
	mon_stats $50, $44, $42, $28, $29, $3a ; 009 機甲人
	mon_stats $38, $43, $4f, $67, $50, $5a ; 010 長毛
	mon_stats $48, $41, $45, $52, $2b, $29 ; 011 紅豬
	mon_stats $50, $59, $5f, $48, $5e, $67 ; 012 火鳳凰
	mon_stats $44, $37, $35, $28, $54, $3e ; 013 赤鍊
	mon_stats $56, $61, $49, $3b, $67, $47 ; 014 噴火龍
	mon_stats $3c, $36, $2e, $4e, $1c, $2d ; 015 熔岩獸
	mon_stats $46, $41, $40, $49, $46, $3e ; 016 赤火狐
	mon_stats $35, $46, $55, $54, $39, $4b ; 017 燭妖
	mon_stats $3c, $44, $1e, $4c, $48, $4d ; 018 焱爐妖
	mon_stats $3d, $51, $5d, $52, $44, $56 ; 019 日輪
	mon_stats $5a, $37, $28, $8f, $4e, $59 ; 020 火眼狼
	mon_stats $5d, $43, $42, $40, $42, $36 ; 021 河童
	mon_stats $60, $52, $52, $35, $22, $45 ; 022 刺錘
	mon_stats $54, $54, $4c, $4b, $56, $41 ; 023 過河龍
	mon_stats $3d, $4e, $50, $42, $5e, $48 ; 024 翻江鯉
	mon_stats $41, $42, $41, $60, $23, $2d ; 025 水妖
	mon_stats $32, $4c, $5f, $48, $4b, $59 ; 026 夾面妖
	mon_stats $40, $31, $53, $3f, $54, $62 ; 027 圓圓
	mon_stats $41, $50, $54, $2f, $58, $2b ; 028 金魚王
	mon_stats $41, $49, $28, $55, $44, $4f ; 029 食人鯊
	mon_stats $4b, $35, $3e, $3f, $3a, $3f ; 030 水瓶座
	mon_stats $5a, $4a, $41, $4f, $53, $4c ; 031 草叢怪
	mon_stats $50, $56, $4e, $47, $54, $44 ; 032 蘑菇群
	mon_stats $49, $38, $35, $54, $3e, $3c ; 033 樹精
	mon_stats $47, $43, $36, $3c, $43, $3b ; 034 咬人果
	mon_stats $49, $58, $5a, $44, $23, $3e ; 035 足鐮
	mon_stats $55, $33, $3e, $41, $36, $40 ; 036 蛇王
	mon_stats $6e, $60, $53, $36, $86, $89 ; 037 毒菊
	mon_stats $84, $50, $46, $48, $54, $44 ; 038 蟲精
	mon_stats $50, $4c, $2a, $46, $4c, $62 ; 039 香菇精
	mon_stats $4b, $50, $35, $48, $39, $3c ; 040 花蝴蝶
	mon_stats $3c, $46, $4b, $57, $48, $46 ; 041 獨角龍
	mon_stats $5b, $57, $60, $48, $2f, $34 ; 042 獸面鳩
	mon_stats $5d, $50, $3c, $3f, $58, $63 ; 043 暗蝠
	mon_stats $44, $4c, $55, $41, $54, $55 ; 044 沙塵暴
	mon_stats $4c, $58, $4f, $48, $5c, $50 ; 045 鳥人獸
	mon_stats $59, $50, $46, $43, $45, $4e ; 046 大嘴鳥
	mon_stats $46, $51, $60, $58, $36, $3e ; 047 飛天牛
	mon_stats $4f, $35, $3f, $5b, $40, $42 ; 048 機械蝙
	mon_stats $5a, $46, $56, $55, $43, $55 ; 049 鳥人
	mon_stats $4f, $36, $3a, $48, $33, $3b ; 050 翼首龍
	mon_stats $44, $40, $46, $4f, $4b, $4c ; 051 土沙
	mon_stats $46, $36, $4c, $39, $46, $3a ; 052 泥獸
	mon_stats $57, $5e, $30, $3c, $43, $3c ; 053 四角龍
	mon_stats $94, $48, $53, $2c, $53, $51 ; 054 丟石怪
	mon_stats $45, $41, $3c, $40, $4b, $48 ; 055 鬥石
	mon_stats $56, $4a, $46, $34, $50, $54 ; 056 石蛟
	mon_stats $64, $35, $63, $48, $5c, $61 ; 057 刺角獸
	mon_stats $50, $4f, $52, $48, $1c, $28 ; 058 壁面石
	mon_stats $5a, $50, $50, $40, $4e, $46 ; 059 機械石
	mon_stats $35, $38, $45, $34, $20, $6d ; 060 泥人
	mon_stats $5e, $5c, $50, $37, $23, $5d ; 061 紅魔人
	mon_stats $3a, $31, $3c, $50, $59, $70 ; 062 飛首
	mon_stats $4d, $44, $28, $35, $48, $40 ; 063 屍妖
	mon_stats $5f, $5f, $52, $41, $67, $66 ; 064 閻魔人
	mon_stats $40, $36, $39, $48, $3b, $3c ; 065 傑森
	mon_stats $3c, $35, $28, $4e, $6b, $70 ; 066 豬妖
	mon_stats $41, $5a, $47, $44, $44, $46 ; 067 電子腦
	mon_stats $44, $47, $3c, $53, $4e, $5c ; 068 黑煞
	mon_stats $50, $4b, $57, $3e, $52, $44 ; 069 黑寡婦
	mon_stats $46, $56, $32, $4f, $5b, $48 ; 070 史萊姆
	mon_stats $45, $36, $50, $58, $2a, $2f ; 071 仙人
	mon_stats $48, $36, $49, $4e, $4e, $41 ; 072 雷神
	mon_stats $3c, $28, $5a, $4b, $4c, $49 ; 073 泥菩薩
	mon_stats $3a, $37, $4a, $48, $3a, $44 ; 074 天狗
	mon_stats $4b, $49, $5c, $43, $49, $4c ; 075 雷獸
	mon_stats $46, $46, $5a, $3c, $46, $32 ; 076 海神
	mon_stats $2d, $38, $5c, $37, $32, $79 ; 077 小天使
	mon_stats $4b, $4e, $50, $4f, $2a, $35 ; 078 天兵
	mon_stats $40, $3c, $40, $46, $35, $3e ; 079 機械雷
	mon_stats $33, $33, $52, $3c, $54, $52 ; 080 金光球
	mon_stats $55, $5e, $58, $35, $29, $32 ; 081 藍靈犬
	mon_stats $58, $40, $4a, $4d, $52, $4e ; 082 機械貓
	mon_stats $6a, $46, $65, $1a, $4e, $3a ; 083 妙虎
	mon_stats $3f, $32, $2a, $46, $48, $4f ; 084 寵物犬
	mon_stats $32, $51, $54, $51, $6c, $66 ; 085 虎犬
	mon_stats $52, $60, $41, $51, $3e, $3c ; 086 維京人
	mon_stats $4e, $52, $3a, $40, $4b, $49 ; 087 鬥精靈
	mon_stats $47, $40, $58, $3a, $49, $31 ; 088 雙面獸
	mon_stats $4d, $57, $54, $33, $5f, $2e ; 089 大舌蛙
	mon_stats $82, $56, $34, $4b, $68, $36 ; 090 火炎怪
	mon_stats $58, $55, $50, $58, $6f, $5f ; 091 鸚鵡獸
	mon_stats $51, $3d, $35, $1b, $3f, $2a ; 092 邪火怪
	mon_stats $5c, $33, $35, $48, $44, $3e ; 093 烈火劍
	mon_stats $3b, $56, $68, $3f, $2d, $36 ; 094 巨火岩
	mon_stats $47, $44, $52, $42, $36, $3c ; 095 火精靈
	mon_stats $4e, $48, $34, $46, $44, $4d ; 096 炎龍獸
	mon_stats $6d, $48, $4b, $53, $1a, $3a ; 097 風火輪
	mon_stats $47, $40, $58, $3a, $49, $31 ; 098 火神
	mon_stats $56, $4d, $64, $3c, $41, $55 ; 099 人魚
	mon_stats $52, $48, $57, $45, $4f, $3d ; 100 雪熊
	mon_stats $42, $3a, $4c, $3c, $40, $45 ; 101 章魚怪
	mon_stats $50, $36, $5f, $39, $4e, $3c ; 102 水妖
	mon_stats $4e, $43, $4c, $59, $5e, $46 ; 103 蟹居獸
	mon_stats $4b, $35, $63, $3f, $54, $44 ; 104 水精靈
	mon_stats $54, $3c, $46, $4b, $5a, $56 ; 105 巨獸龜
	mon_stats $4a, $36, $44, $48, $40, $3c ; 106 咕嚕妖
	mon_stats $28, $56, $76, $54, $28, $7d ; 107 蚌殼獸
	mon_stats $4f, $53, $4c, $4e, $3f, $4a ; 108 小綿羊
	mon_stats $7b, $5f, $4c, $48, $5a, $45 ; 109 紅螞蟻
	mon_stats $5f, $41, $3c, $82, $6e, $50 ; 110 樹精
	mon_stats $50, $3c, $4e, $4c, $95, $a2 ; 111 毛毛
	mon_stats $50, $36, $41, $4f, $53, $4c ; 112 紅毛怪
	mon_stats $49, $58, $5a, $44, $23, $3e ; 113 泰山
	mon_stats $3c, $41, $4e, $47, $54, $44 ; 114 絨球獸
	mon_stats $3f, $3f, $44, $4e, $3f, $4a ; 115 老山羊
	mon_stats $50, $36, $41, $4f, $53, $4c ; 116 怯膽茸
	mon_stats $59, $5f, $5a, $64, $33, $3b ; 117 機械鳥
	mon_stats $46, $49, $4b, $57, $48, $46 ; 118 飛馬
	mon_stats $3c, $4e, $30, $43, $45, $4e ; 119 笨笨鳥
	mon_stats $4c, $3d, $4f, $48, $5c, $50 ; 120 青蛟
	mon_stats $52, $34, $39, $63, $43, $55 ; 121 插翅兔
	mon_stats $5d, $3b, $33, $3f, $58, $63 ; 122 天精靈
	mon_stats $38, $51, $64, $58, $36, $3e ; 123 天龍
	mon_stats $4f, $35, $3f, $66, $40, $42 ; 124 飛天妖
	mon_stats $3c, $4a, $30, $43, $45, $4e ; 125 比比鳥
	mon_stats $69, $4b, $51, $3c, $43, $3c ; 126 彩繪精
	mon_stats $64, $34, $30, $3c, $43, $3c ; 127 咖啡獸
	mon_stats $50, $4f, $52, $48, $1c, $28 ; 128 石魔
	mon_stats $46, $36, $4c, $39, $46, $3a ; 129 混江獸
	mon_stats $64, $5a, $3e, $48, $5c, $61 ; 130 石星
	mon_stats $44, $40, $46, $4f, $4b, $4c ; 131 滾滾糢
	mon_stats $45, $41, $3c, $40, $4b, $48 ; 132 困途掌
	mon_stats $69, $62, $57, $40, $4e, $46 ; 133 地底人
	mon_stats $56, $3d, $3b, $34, $50, $54 ; 134 玉玲瓏
	mon_stats $4a, $44, $46, $41, $67, $66 ; 135 銷魂閹
	mon_stats $44, $47, $54, $53, $4e, $5c ; 136 勾魂使
	mon_stats $4d, $44, $28, $35, $48, $40 ; 137 木乃伊
	mon_stats $3c, $3c, $3c, $3c, $78, $3c ; 138 魔蛋獸
	mon_stats $4a, $4a, $51, $41, $67, $66 ; 139 布妖
	mon_stats $49, $42, $46, $4e, $6b, $70 ; 140 小惡魔
	mon_stats $44, $40, $46, $4f, $4b, $4c ; 141 奪命蠍
	mon_stats $40, $36, $39, $48, $3b, $3c ; 142 鏈鼠
	mon_stats $3a, $3b, $3c, $50, $59, $70 ; 143 大頭鬼
	mon_stats $51, $53, $54, $46, $35, $3e ; 144 時空獸
	mon_stats $6e, $4b, $44, $3c, $54, $52 ; 145 音樂靈
	mon_stats $3c, $46, $5e, $4b, $4c, $49 ; 146 時間獸
	mon_stats $45, $36, $3a, $58, $2a, $2f ; 147 時間郎
	mon_stats $33, $30, $52, $3c, $54, $52 ; 148 金獅王
	mon_stats $48, $36, $3f, $4e, $4e, $41 ; 149 天眼
	mon_stats $5a, $76, $4b, $3c, $54, $5a ; 150 音樂獸
	mon_stats $3c, $49, $50, $57, $48, $46 ; 151 天行馬
	mon_stats $5a, $4f, $53, $58, $36, $3e ; 152 翻天龍
	mon_stats $00, $00, $00, $00, $00, $00 ; 153 
	mon_stats $4e, $46, $3a, $40, $4b, $49 ; 154 狼人獸
	mon_stats $63, $46, $53, $48, $4b, $59 ; 155 水魔人
	mon_stats $55, $51, $5d, $4e, $1c, $2d ; 156 火魔人
	mon_stats $5f, $51, $64, $58, $36, $3e ; 157 神秘獸
	mon_stats $78, $3c, $55, $4f, $2a, $67 ; 158 懲罰者
	mon_stats $96, $5a, $41, $5a, $64, $96 ; 159 懲罰者

StatBaseTable::
; indexed by level (0-99)
	db $00 ; L0
	db $12 ; L1
	db $14 ; L2
	db $17 ; L3
	db $1a ; L4
	db $1d ; L5
	db $20 ; L6
	db $22 ; L7
	db $25 ; L8
	db $28 ; L9
	db $2b ; L10
	db $2e ; L11
	db $30 ; L12
	db $33 ; L13
	db $36 ; L14
	db $39 ; L15
	db $3c ; L16
	db $3e ; L17
	db $41 ; L18
	db $44 ; L19
	db $47 ; L20
	db $4a ; L21
	db $4c ; L22
	db $4f ; L23
	db $52 ; L24
	db $55 ; L25
	db $58 ; L26
	db $5a ; L27
	db $5d ; L28
	db $60 ; L29
	db $64 ; L30
	db $66 ; L31
	db $69 ; L32
	db $6b ; L33
	db $6e ; L34
	db $71 ; L35
	db $73 ; L36
	db $76 ; L37
	db $78 ; L38
	db $7b ; L39
	db $7e ; L40
	db $80 ; L41
	db $83 ; L42
	db $85 ; L43
	db $88 ; L44
	db $8b ; L45
	db $8d ; L46
	db $90 ; L47
	db $92 ; L48
	db $95 ; L49
	db $98 ; L50
	db $9a ; L51
	db $9d ; L52
	db $9f ; L53
	db $a2 ; L54
	db $a5 ; L55
	db $a7 ; L56
	db $ab ; L57
	db $ae ; L58
	db $b1 ; L59
	db $b4 ; L60
	db $b5 ; L61
	db $b7 ; L62
	db $b9 ; L63
	db $bb ; L64
	db $bd ; L65
	db $bf ; L66
	db $c1 ; L67
	db $c3 ; L68
	db $c5 ; L69
	db $c7 ; L70
	db $c8 ; L71
	db $ca ; L72
	db $cc ; L73
	db $ce ; L74
	db $d0 ; L75
	db $d2 ; L76
	db $d4 ; L77
	db $d6 ; L78
	db $d8 ; L79
	db $da ; L80
	db $db ; L81
	db $dd ; L82
	db $df ; L83
	db $e1 ; L84
	db $e3 ; L85
	db $e5 ; L86
	db $e7 ; L87
	db $e9 ; L88
	db $eb ; L89
	db $ed ; L90
	db $ee ; L91
	db $f0 ; L92
	db $f2 ; L93
	db $f4 ; L94
	db $f6 ; L95
	db $f8 ; L96
	db $fa ; L97
	db $fc ; L98
	db $fe ; L99
