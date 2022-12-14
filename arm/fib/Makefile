.PHONY: clean

ARMCC=arm-linux-gnueabihf-gcc -gstabs+

all: executable ref-asm asm

executable: src/main.c asm/recursive_fib.s asm/iterative_fib.s src/ref_fib.c src/ref_fibonacci_array.c ref-asm
	mkdir -p bin
	mkdir -p obj
	${ARMCC} -Iinclude -O4 -static -c -o obj/recursive_fib.o asm/recursive_fib.s
	${ARMCC} -Iinclude -O4 -static -c -o obj/iterative_fib.o asm/iterative_fib.s
	${ARMCC} -Iinclude -O4 -static -c -o obj/fibonacci_array.o asm/fibonacci_array.s
	${ARMCC} -Iinclude -O4 -static -o bin/main src/main.c src/ref_fib.c src/ref_fibonacci_array.c obj/recursive_fib.o obj/iterative_fib.o obj/fibonacci_array.o

run-test: executable
	bin/main ${a} ${b}

ref-asm: src/ref_fib.c
	mkdir -p ref-asm
	${ARMCC} -Iinclude -O4 -static -S -o ref-asm/ref_fib.s src/ref_fib.c

clean:
	rm -rf bin obj ref-asm

run-qemu: executable
	qemu-arm -g 1234 bin/main ${a} ${b}

gdb: executable
	gdb-multiarch \
		--ex="set arch armv7"\
		--ex="set sysroot /usr/arm-linux-gnueabihf/"\
		--ex="target remote localhost:1234"\
		--ex="break main"\
		--ex="break fib"\
		--ex="c"\
		--ex="tui enable"\
		--ex="tui new-layout mmw {-horizontal src 1 asm 1} 2 regs 1 cmd 1"\
		--ex="layout mmw"\
		--ex="n"\
		bin/main
