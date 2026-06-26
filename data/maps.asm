INCLUDE "constants.asm"

SECTION "Group 00 Map Defs", ROMX
Group00_Maps::
INCLUDE "data/maps/header_pointers/g00.asm"
INCLUDE "data/maps/headers/g00.asm"
INCLUDE "data/maps/events/g00.asm"

SECTION "Group 01 Map Defs", ROMX
Group01_Maps::
INCLUDE "data/maps/header_pointers/g01.asm"
INCLUDE "data/maps/headers/g01.asm"
INCLUDE "data/maps/events/g01.asm"

SECTION "Group 02 Map Defs", ROMX
Group02_Maps::
INCLUDE "data/maps/header_pointers/g02.asm"
INCLUDE "data/maps/headers/g02.asm"
INCLUDE "data/maps/events/g02.asm"

SECTION "Group 03 Map Defs", ROMX
Group03_Maps::
INCLUDE "data/maps/header_pointers/g03.asm"
INCLUDE "data/maps/headers/g03.asm"
INCLUDE "data/maps/events/g03.asm"

SECTION "Group 04 Map Defs", ROMX
Group04_Maps::
INCLUDE "data/maps/header_pointers/g04.asm"
INCLUDE "data/maps/headers/g04.asm"
INCLUDE "data/maps/events/g04.asm"

SECTION "Group 05 Map Defs", ROMX
Group05_Maps::
INCLUDE "data/maps/header_pointers/g05.asm"
INCLUDE "data/maps/headers/g05.asm"
INCLUDE "data/maps/events/g05.asm"

SECTION "Group 06 Map Defs", ROMX
Group06_Maps::
INCLUDE "data/maps/header_pointers/g06.asm"
INCLUDE "data/maps/headers/g06.asm"
INCLUDE "data/maps/events/g06.asm"

SECTION "Group 07 Map Defs", ROMX
Group07_Maps::
INCLUDE "data/maps/header_pointers/g07.asm"
INCLUDE "data/maps/headers/g07.asm"
INCLUDE "data/maps/events/g07.asm"

; these aren't just map_attrs, because they aren't neatly separated out and all
; absolute VF moment

SECTION "Map Data 1", ROMX
INCLUDE "data/maps/attributes/bank_01.asm"

SECTION "Map Data 2", ROMX
INCLUDE "data/maps/attributes/bank_11.asm"

SECTION "Map Data 3", ROMX
INCLUDE "data/maps/attributes/bank_17.asm"

SECTION "Map Data 4", ROMX
INCLUDE "data/maps/attributes/bank_18.asm"

SECTION "Map Data 5", ROMX
INCLUDE "data/maps/attributes/bank_50.asm"

SECTION "Map Data 6", ROMX
INCLUDE "data/maps/attributes/bank_53.asm"

SECTION "Map Data 7", ROMX
INCLUDE "data/maps/attributes/bank_57.asm"

SECTION "Map Data 8", ROMX
INCLUDE "data/maps/attributes/bank_64.asm"

SECTION "Map Data 9", ROMX
INCLUDE "data/maps/attributes/bank_69.asm"

SECTION "Map Data 10", ROMX
INCLUDE "data/maps/attributes/bank_6a.asm"

SECTION "Map Data 11", ROMX
INCLUDE "data/maps/attributes/bank_6b.asm"

SECTION "Map Data 12", ROMX
INCLUDE "data/maps/attributes/bank_6b_2.asm"

SECTION "Map Data 13", ROMX
INCLUDE "data/maps/attributes/bank_6e.asm"
