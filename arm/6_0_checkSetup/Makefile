.PHONY: clean

all: executable asm

executable: main.c
	mkdir -p bin
	aarch64-linux-gnu-gcc -static -o bin/main main.c

asm: main.c
	mkdir -p asm
	aarch64-linux-gnu-gcc -static -S -o asm/main.s main.c

run: all
	qemu-aarch64 -L /usr/aarch64-linux-gnu ./bin/main

clean:
	rm -f bin asm
