.PHONY: clean

all: main.c
	aarch64-linux-gnu-gcc -static -o main main.c
asm: main.c
	aarch64-linux-gnu-gcc -static -S main.c
run: all
	qemu-aarch64 -L /usr/aarch64-linux-gnu ./main
clean:
	rm -f main main.s
