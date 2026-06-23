# Ghidra usage for code disassembly

Ghidra MCP *may* be linked, accessible.

ROM addresses in Ghidra form:
romX::YYYY

X = bank number **in decimal**. YYYY = address **in hexadecimal**, 4000-7fff range (0000-3fff for home bank, no romX:: prefix).

Use Ghidra different ways.

## Me, the user

CodeBrowser better than MCP or in-Ghidra scripts for disassembly. I copy-paste "half-finished" disassembly to file, usually in ghidra-buffer/ for your ease.

"Half-finished" = I worked out flow control, what is which.

## You, Claude

MCP light assistive only — less capable than CodeBrowser. Relevant tools:

* disassemble_function - raw disassembly, calls resolve to raw hex. Useful only certain cases.
* get_function_by_address - often misses, since I not explicitly mark thing as function.

## What I, the user, need your help with

1. I point you to file in ghidra-buffer/ with my copy-pasted CodeBrowser output.
2. I state target file, which `dr` it replace. If not, ask me.
3. Run on file:
```sh
python3 utils/ghidra2asm.py <file>
```
4. Use output as base for modifying assembly files.
5. May use MCP tools to double-check IF AND ONLY IF suspicious of its output.
6. May reference original file for omissions caused by script.
7. Script output should already match style guide below; if not, style guide takes priority. Also explain (in response, not code) why it disagrees.
8. Never revert script-derived labels back to messy Ghidra-original labels. If you think that cause code shifts — it doesn't.
9. If original file shows like:
```
LD HL,0xd40c
DEC (HL=>wSound1FadeTimer)
```
Good sign to render in target asm as:
```
ld hl, wSound1FadeTimer
dec [hl]
```
Apply wherever indirection appears.

10. To avoid relative-label confusion, prefer absolute labels. Optimize with relative labels only AFTER compiled rom MATCHES.