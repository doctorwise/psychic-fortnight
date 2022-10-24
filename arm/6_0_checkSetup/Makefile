.PHONY: clean

ARMCC=arm-linux-gnueabihf-gcc

all: executable asm

executable: main.c
	mkdir -p bin
	# aarch64-linux-gnu-gcc -static -o bin/main main.c
	${ARMCC} -O4 -static -S main.c
	${ARMCC} -static -o bin/main main.c

asm: main.c
	mkdir -p asm
	${ARMCC} -static -S -o asm/main.s main.c

run: all
	bin/main
	# qemu-aarch64 -L /usr/aarch64-linux-gnu ./bin/main

clean:
	rm -f bin asm
