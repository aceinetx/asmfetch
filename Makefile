asmfetch: asmfetch.o
	cc asmfetch.o -o asmfetch -m32 -g -static

asmfetch.o: asmfetch.asm
	fasm asmfetch.asm
