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
