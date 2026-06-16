# Finding the closest label/symbol to an address

For things in ROM:
```sh
python3 utils/get_nearest_symbol.py <absolute address in hex/bank:addr>
```

Or in RAM (yes, including banked):
```sh
python3 utils/get_nearest_symbol.py <bank:addr> ram
```

Its output should be:
```
SymbolName
```

Or a relative offset:
```
SymbolName + 10
```

See `shi_kong_xing_shou.sym` for a full current list.
