UpdatePlayerMapCoords::
	homecall _UpdatePlayerMapCoords
	ret

ParseMapEventsAtPlayer::
	ld a, [_BANKNUM]
	push af
	ld a, BANK(_UpdatePlayerMapCoords)
	rst Bankswitch
	call _UpdatePlayerMapCoords
	call ParseCurrentMapEvents
	pop af
	rst Bankswitch
	ret

SetMapLayoutPatchForItem::
	homecall _SetMapLayoutPatchForItem
	ret

SetMapLayoutPatch::
	homecall _SetMapLayoutPatch
	ret

ApplyMapLayoutFlagPatches::
	homecall _ApplyMapLayoutFlagPatches
	ret

ApplyMapLayoutPatchIfClear::
	homecall _ApplyMapLayoutPatchIfClear
	ret

ClearMapLayoutPatch::
	homecall _ClearMapLayoutPatch
	ret

