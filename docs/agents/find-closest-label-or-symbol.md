# Finding the closest label/symbol to an address

Things in ROM:
```sh
python3 utils/get_nearest_symbol.py <absolute address in hex/bank:addr>
```

Or RAM (yes, include banked):
```sh
python3 utils/get_nearest_symbol.py <bank:addr> ram
```

Output:
```
SymbolName
```

Or relative offset:
```
SymbolName + 10
```

See `shi_kong_xing_shou.sym` for full current list.