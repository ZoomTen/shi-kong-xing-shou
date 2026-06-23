# Broken sound engine

Only 1 (`engine_1.asm`) out of the 3 sound engines are able to play any
percussion channels. As a result, these tracks effectively have unused drum tracks:
  * BGM_ACADEMY
  * BGM_UNSETTLING_PLACE
  * BGM_TOWN2
  * BGM_RACING
  * BGM_LEVEL_UP_JINGLE
  * BGM_INTRO
  * BGM_JUNKYARD
  * BGM_TITLE
  * BGM_AIRPORT
  * BGM_SHOP
  * BGM_HEALING_CENTER

**Fix**: Perform a search-and-replace operation in `engine_2.asm` and `engine_3.asm` to substitute **wSound1** with **wSound2**.


