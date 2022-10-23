CURL := curl
SHEETS_BASE_URL := https://docs.google.com/spreadsheets/d/1y9wnxMttF_YDSjfMHfQg1cBUDsa-2EC563a76XyYtFs/gviz/tq?tqx=out:csv&sheet=

data/translated/%.csv:
	curl "$(SHEETS_BASE_URL)$*" > $@
