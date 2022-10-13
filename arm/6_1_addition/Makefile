.PHONY: clean

all: executable ref-executable ref-asm asm

executable: src/main.c asm/sum.s
	@mkdir -p bin
	@mkdir -p obj
	@aarch64-linux-gnu-gcc -Iinclude -O4 -static -c -o obj/sum.o asm/sum.s
	@aarch64-linux-gnu-gcc -Iinclude -O4 -static -o bin/main src/main.c obj/sum.o

run: executable
	@qemu-aarch64 -L /usr/aarch64-linux-gnu bin/main ${a} ${b}

ref-executable: src/main.c src/sum.c
	@mkdir -p bin
	@mkdir -p obj
	@aarch64-linux-gnu-gcc -Iinclude -O4 -static -c -o obj/ref-sum.o src/sum.c
	@aarch64-linux-gnu-gcc -Iinclude -O4 -static -o bin/ref-main src/main.c obj/ref-sum.o

ref-asm: src/sum.c
	@mkdir -p ref-asm
	@aarch64-linux-gnu-gcc -Iinclude -O4 -static -S -o ref-asm/sum.s src/sum.c

ref-run: ref-executable
	@qemu-aarch64 -L /usr/aarch64-linux-gnu bin/ref-main ${a} ${b}

clean:
	@rm -rf bin obj ref-asm
