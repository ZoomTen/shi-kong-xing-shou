# Ghidra usage for code disassembly

A Ghidra MCP *may* be linked and accessible.

ROM addresses in Ghidra are in the form:
romX::YYYY

Where X is the bank number **in decimal**, and YYYY is the address **in hexadecimal** in the 4000-7fff range (0000-3fff for the home bank, which does not have a romX:: prefix.)

We use Ghidra in different ways.

## Me, the user

As Ghidra's CodeBrowser is better-equipped than the MCP or script tools inside Ghidra for disassembly code, I simply copy and paste a "half-finished" disassembly onto a file, usually in ghidra-buffer/ for your ease.

"Half-finished" usually means that I've worked out what is which in terms of flow control.

## You, Claude

The MCP is in a light assistive capacity, because as it turns out, it is not as capable as the CodeBrowser, the relevant tools for it might be:

* disassemble_function - simply a raw disassembly, with calls resolving to raw hex numbers. Useful only in certain cases.
* get_function_by_address - very often misses, due to me not explicitly marking something as a function.

## What I, the user, need your help with

1. I would direct you to a file in ghidra-buffer/ which contains my copy-pasted output from the Ghidra CodeBrowser.
2. I would state which file it's meant for, and which `dr` it should replace. If not, please ask that of me.
3. Run the following on the file:
```sh
python3 utils/ghidra2asm.py <file>
```
4. Use the output as a base for modifying assembly files.
5. You may use the MCP tools to double-check IF AND ONLY IF you are a might suspicious about its output.
6. You may also reference the original file if there any omissions caused by the script.
7. The output from the script should already agree with the style guide below; if not, then the style guide should take priority. Please also explain (in your response and not the code) why it disagrees.
8. Under any circumstances do not revert the labels derived from the script's output to the messy labels of the Ghidra original. If that's what you're thinking might cause code shifts—they aren't.
9. If you see in the original file something like:
```
LD HL,0xd40c
DEC (HL=>wSound1FadeTimer)
```
That is usually a good indication to render it in the target asm file to:
```
ld hl, wSound1FadeTimer
dec [hl]
```
Apply this wherever indirection is encountered.

10. To prevent confusion in terms of relative labels, prefer absolute labels. Optimizing using relative labels should be reserved AFTER you have ensured the compiled rom MATCHES.
