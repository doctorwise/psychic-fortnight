	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"ref_fib.c"
	.stabs	"/home/ubuntu/psychic-fortnight/arm/fib/",100,0,2,.Ltext0
	.stabs	"src/ref_fib.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.align	1
	.p2align 2,,3
	.stabs	"ref_recursive_fib:F(0,1)=r(0,1);-2147483648;2147483647;",36,0,4,ref_recursive_fib
	.stabs	"int:t(0,1)",128,0,0,0
	.stabs	"n:P(0,1)",64,0,4,11
	.global	ref_recursive_fib
	.syntax unified
	.thumb
	.thumb_func
	.type	ref_recursive_fib, %function
ref_recursive_fib:
	.stabn	68,0,4,.LM0-.LFBB1
.LM0:
.LFBB1:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.stabn	68,0,6,.LM1-.LFBB1
.LM1:
	adds	r2, r0, #1
	.stabn	68,0,4,.LM2-.LFBB1
.LM2:
	sub	sp, sp, #76
	.stabn	68,0,6,.LM3-.LFBB1
.LM3:
	blt	.L37
	.stabn	68,0,9,.LM4-.LFBB1
.LM4:
	beq	.L38
	mov	fp, r0
	.stabn	68,0,12,.LM5-.LFBB1
.LM5:
	cmp	r0, #0
	beq	.L49
	mov	fp, #0
	subs	r3, r0, #1
	mov	r1, fp
	str	r3, [sp, #16]
	mov	r3, r0
.L3:
	.stabn	68,0,17,.LM6-.LFBB1
.LM6:
	ldr	r0, [sp, #16]
	subs	r3, r3, #2
	str	r3, [sp, #40]
	mov	r2, r0
.LBB18:
.LBB19:
	.stabn	68,0,12,.LM7-.LFBB1
.LM7:
	cmp	r0, #0
	beq	.L4
	str	r3, [sp, #32]
	movs	r3, #0
	str	r1, [sp, #36]
	str	r3, [sp]
.L6:
	.stabn	68,0,17,.LM8-.LFBB1
.LM8:
	ldr	r1, [sp, #32]
	mov	r3, r1
.LBB20:
.LBB21:
	.stabn	68,0,12,.LM9-.LFBB1
.LM9:
	cmp	r1, #0
	beq	.L80
	subs	r2, r2, #2
	movs	r1, #0
	str	r2, [sp, #44]
	str	r2, [sp, #20]
	str	r1, [sp, #4]
.L8:
	.stabn	68,0,17,.LM10-.LFBB1
.LM10:
	ldr	r1, [sp, #20]
	mov	r2, r1
.LBB22:
.LBB23:
	.stabn	68,0,12,.LM11-.LFBB1
.LM11:
	cmp	r1, #0
	beq	.L10
	subs	r3, r3, #2
	movs	r1, #0
	str	r3, [sp, #60]
	str	r3, [sp, #28]
	str	r1, [sp, #8]
.L11:
	.stabn	68,0,17,.LM12-.LFBB1
.LM12:
	ldr	r1, [sp, #28]
	mov	r3, r1
.LBB24:
.LBB25:
	.stabn	68,0,12,.LM13-.LFBB1
.LM13:
	cmp	r1, #0
	beq	.L13
	subs	r2, r2, #2
	movs	r1, #0
	str	r2, [sp, #56]
	str	r2, [sp, #24]
	str	r1, [sp, #12]
.L14:
	.stabn	68,0,17,.LM14-.LFBB1
.LM14:
	ldr	r2, [sp, #24]
.LBB26:
.LBB27:
	.stabn	68,0,12,.LM15-.LFBB1
.LM15:
	cmp	r2, #0
	beq	.L16
	subs	r3, r3, #2
	movs	r7, #0
	mov	r9, r2
	mov	r2, r7
	mov	r7, r3
	str	r3, [sp, #52]
.L17:
	.stabn	68,0,17,.LM16-.LFBB1
.LM16:
	mov	r5, r7
.LBB28:
.LBB29:
	.stabn	68,0,12,.LM17-.LFBB1
.LM17:
	cmp	r7, #0
	beq	.L19
	sub	r9, r9, #2
	mov	r3, r7
	mov	r7, r9
	mov	r8, #0
	mov	r9, r2
	mov	r2, r7
.L20:
	.stabn	68,0,17,.LM18-.LFBB1
.LM18:
	mov	r6, r7
.LBB30:
.LBB31:
	.stabn	68,0,12,.LM19-.LFBB1
.LM19:
	cmp	r7, #0
	beq	.L22
	subs	r5, r5, #2
	movs	r4, #0
	mov	fp, r5
	mov	r1, r5
	mov	r5, r4
.L23:
	.stabn	68,0,17,.LM20-.LFBB1
.LM20:
	mov	r4, fp
.LBB32:
.LBB33:
	.stabn	68,0,12,.LM21-.LFBB1
.LM21:
	cmp	fp, #0
	beq	.L25
	str	fp, [sp, #48]
	mov	r10, #0
	mov	fp, r7
	mov	r7, r3
	b	.L26
.L28:
	cmp	r4, #0
	beq	.L78
.L26:
	.stabn	68,0,17,.LM22-.LFBB1
.LM22:
	subs	r0, r4, #1
	.stabn	68,0,17,.LM23-.LFBB1
.LM23:
	subs	r4, r4, #2
	strd	r2, r1, [sp, #64]
	.stabn	68,0,17,.LM24-.LFBB1
.LM24:
	bl	ref_recursive_fib(PLT)
	.stabn	68,0,9,.LM25-.LFBB1
.LM25:
	ldrd	r2, r1, [sp, #64]
	add	r10, r10, r0
	adds	r3, r4, #1
	bne	.L28
	mov	r3, r7
	mov	r7, fp
	ldr	fp, [sp, #48]
	add	r10, r10, #1
.L27:
.LBE33:
.LBE32:
	.stabn	68,0,17,.LM26-.LFBB1
.LM26:
	subs	r6, r6, #2
	add	r5, r5, r10
	.stabn	68,0,9,.LM27-.LFBB1
.LM27:
	adds	r0, r6, #1
	beq	.L25
	.stabn	68,0,12,.LM28-.LFBB1
.LM28:
	sub	fp, fp, #2
	cmp	r6, #0
	bne	.L23
	mov	r4, r5
	mov	r5, r1
.L24:
	add	r8, r8, r4
.LBE31:
.LBE30:
	.stabn	68,0,9,.LM29-.LFBB1
.LM29:
	adds	r6, r5, #1
	beq	.L22
	.stabn	68,0,12,.LM30-.LFBB1
.LM30:
	subs	r7, r7, #2
	cmp	r5, #0
	bne	.L20
	mov	r7, r3
	mov	r3, r2
	mov	r2, r9
	mov	r9, r3
	add	r2, r2, r8
.LBE29:
.LBE28:
	.stabn	68,0,9,.LM31-.LFBB1
.LM31:
	cmp	r9, #-1
	beq	.L19
.L31:
	.stabn	68,0,12,.LM32-.LFBB1
.LM32:
	subs	r7, r7, #2
	cmp	r9, #0
	bne	.L17
	mov	r7, r2
.L18:
	ldr	r3, [sp, #12]
	add	r3, r3, r7
	str	r3, [sp, #12]
.LBE27:
.LBE26:
	.stabn	68,0,17,.LM33-.LFBB1
.LM33:
	ldr	r3, [sp, #52]
	.stabn	68,0,9,.LM34-.LFBB1
.LM34:
	adds	r4, r3, #1
	beq	.L16
	.stabn	68,0,12,.LM35-.LFBB1
.LM35:
	ldr	r2, [sp, #24]
	subs	r2, r2, #2
	str	r2, [sp, #24]
	cmp	r3, #0
	bne	.L14
	ldr	r1, [sp, #12]
.L15:
	ldr	r3, [sp, #8]
.LBE25:
.LBE24:
	.stabn	68,0,17,.LM36-.LFBB1
.LM36:
	ldr	r2, [sp, #56]
	add	r3, r3, r1
	str	r3, [sp, #8]
	.stabn	68,0,9,.LM37-.LFBB1
.LM37:
	adds	r0, r2, #1
	beq	.L82
	.stabn	68,0,12,.LM38-.LFBB1
.LM38:
	ldr	r3, [sp, #28]
	subs	r3, r3, #2
	str	r3, [sp, #28]
	cmp	r2, #0
	bne	.L11
	ldr	r1, [sp, #8]
.L12:
	ldr	r2, [sp, #4]
.LBE23:
.LBE22:
	.stabn	68,0,17,.LM39-.LFBB1
.LM39:
	ldr	r3, [sp, #60]
	add	r2, r2, r1
	str	r2, [sp, #4]
	.stabn	68,0,9,.LM40-.LFBB1
.LM40:
	adds	r1, r3, #1
	beq	.L83
	.stabn	68,0,12,.LM41-.LFBB1
.LM41:
	ldr	r2, [sp, #20]
	subs	r2, r2, #2
	str	r2, [sp, #20]
	cmp	r3, #0
	bne	.L8
	ldr	r1, [sp, #4]
	b	.L9
.L22:
	mov	r7, r3
	mov	r3, r2
	add	r8, r8, #1
	mov	r2, r9
	mov	r9, r3
	add	r2, r2, r8
.LBB39:
.LBB38:
.LBB37:
.LBB36:
.LBB35:
.LBB34:
	.stabn	68,0,9,.LM42-.LFBB1
.LM42:
	cmp	r9, #-1
	bne	.L31
.L19:
	mov	r7, r2
	adds	r7, r7, #1
	b	.L18
.L25:
	mov	r4, r5
	mov	r5, r1
	adds	r4, r4, #1
	b	.L24
.L78:
	mov	r3, r7
	mov	r7, fp
	ldr	fp, [sp, #48]
	b	.L27
.L16:
	ldr	r1, [sp, #12]
	adds	r1, r1, #1
	b	.L15
.L13:
	ldr	r1, [sp, #8]
	adds	r1, r1, #1
	b	.L12
.L10:
	ldr	r1, [sp, #4]
	adds	r1, r1, #1
.L9:
.LBE34:
.LBE35:
.LBE36:
.LBE37:
.LBE38:
.LBE39:
.LBE21:
.LBE20:
	.stabn	68,0,17,.LM43-.LFBB1
.LM43:
	ldr	r0, [sp, #44]
	ldr	r3, [sp]
	mov	r2, r0
	add	r3, r3, r1
	str	r3, [sp]
	.stabn	68,0,9,.LM44-.LFBB1
.LM44:
	mov	r3, r0
	adds	r3, r3, #1
	beq	.L80
	.stabn	68,0,12,.LM45-.LFBB1
.LM45:
	ldr	r3, [sp, #32]
	subs	r3, r3, #2
	str	r3, [sp, #32]
	ldr	r3, [sp, #44]
	cmp	r3, #0
	bne	.L6
	ldr	r3, [sp]
	ldr	r1, [sp, #36]
	add	r1, r1, r3
.LBE19:
.LBE18:
	.stabn	68,0,17,.LM46-.LFBB1
.LM46:
	ldr	r3, [sp, #40]
	.stabn	68,0,9,.LM47-.LFBB1
.LM47:
	adds	r2, r3, #1
	bne	.L36
.L84:
	add	fp, r1, #1
.L49:
	.stabn	68,0,18,.LM48-.LFBB1
.LM48:
	mov	r0, fp
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L80:
	ldr	r3, [sp]
	ldr	r1, [sp, #36]
	adds	r3, r3, #1
	add	r1, r1, r3
.L4:
	.stabn	68,0,17,.LM49-.LFBB1
.LM49:
	ldr	r3, [sp, #40]
	.stabn	68,0,9,.LM50-.LFBB1
.LM50:
	adds	r2, r3, #1
	beq	.L84
.L36:
	.stabn	68,0,12,.LM51-.LFBB1
.LM51:
	ldr	r2, [sp, #16]
	subs	r2, r2, #2
	str	r2, [sp, #16]
	cmp	r3, #0
	bne	.L3
	mov	fp, r1
	.stabn	68,0,18,.LM52-.LFBB1
.LM52:
	mov	r0, fp
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L37:
	.stabn	68,0,6,.LM53-.LFBB1
.LM53:
	mov	fp, #0
	b	.L49
.L38:
	.stabn	68,0,9,.LM54-.LFBB1
.LM54:
	mov	fp, #1
	b	.L49
.L82:
	mov	r1, r3
	adds	r1, r1, #1
	b	.L12
.L83:
	mov	r1, r2
	adds	r1, r1, #1
	b	.L9
	.size	ref_recursive_fib, .-ref_recursive_fib
	.stabs	"n:r(0,1)",64,0,4,2
	.stabn	192,0,0,.LBB18-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,3
	.stabn	192,0,0,.LBB20-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,2
	.stabn	192,0,0,.LBB22-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,3
	.stabn	192,0,0,.LBB24-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,8
	.stabn	192,0,0,.LBB26-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,5
	.stabn	192,0,0,.LBB28-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,6
	.stabn	192,0,0,.LBB30-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,4
	.stabn	192,0,0,.LBB32-.LFBB1
	.stabn	224,0,0,.LBE32-.LFBB1
	.stabn	224,0,0,.LBE30-.LFBB1
	.stabn	224,0,0,.LBE28-.LFBB1
	.stabn	224,0,0,.LBE26-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,8
	.stabn	192,0,0,.LBB35-.LFBB1
	.stabn	224,0,0,.LBE35-.LFBB1
	.stabn	224,0,0,.LBE24-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,3
	.stabn	192,0,0,.LBB37-.LFBB1
	.stabn	224,0,0,.LBE37-.LFBB1
	.stabn	224,0,0,.LBE22-.LFBB1
	.stabs	"n:r(0,1)",64,0,4,2
	.stabn	192,0,0,.LBB39-.LFBB1
	.stabn	224,0,0,.LBE39-.LFBB1
	.stabn	224,0,0,.LBE20-.LFBB1
	.stabn	224,0,0,.LBE18-.LFBB1
.Lscope1:
	.stabs	"",36,0,0,.Lscope1-.LFBB1
	.align	1
	.p2align 2,,3
	.stabs	"ref_iterative_fib:F(0,1)",36,0,20,ref_iterative_fib
	.stabs	"n:P(0,1)",64,0,20,0
	.global	ref_iterative_fib
	.syntax unified
	.thumb
	.thumb_func
	.type	ref_iterative_fib, %function
ref_iterative_fib:
	.stabn	68,0,20,.LM55-.LFBB2
.LM55:
.LFBB2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.stabn	68,0,21,.LM56-.LFBB2
.LM56:
	adds	r3, r0, #1
	blt	.L88
	.stabn	68,0,25,.LM57-.LFBB2
.LM57:
	it	eq
	moveq	r1, #1
	.stabn	68,0,24,.LM58-.LFBB2
.LM58:
	beq	.L85
	.stabn	68,0,27,.LM59-.LFBB2
.LM59:
	cbz	r0, .L88
.LBB40:
	.stabn	68,0,34,.LM60-.LFBB2
.LM60:
	cmp	r0, #1
	beq	.L91
	.stabn	68,0,34,.LM61-.LFBB2
.LM61:
	movs	r3, #1
.LBE40:
	.stabn	68,0,32,.LM62-.LFBB2
.LM62:
	mov	ip, #0
	.stabn	68,0,31,.LM63-.LFBB2
.LM63:
	mov	r2, r3
.L87:
.LBB41:
	.stabn	68,0,36,.LM64-.LFBB2
.LM64:
	add	r1, r2, ip
	.stabn	68,0,34,.LM65-.LFBB2
.LM65:
	adds	r3, r3, #1
	mov	ip, r2
	.stabn	68,0,34,.LM66-.LFBB2
.LM66:
	cmp	r0, r3
	.stabn	68,0,36,.LM67-.LFBB2
.LM67:
	mov	r2, r1
	.stabn	68,0,34,.LM68-.LFBB2
.LM68:
	bne	.L87
.L85:
.LBE41:
	.stabn	68,0,40,.LM69-.LFBB2
.LM69:
	mov	r0, r1
	bx	lr
.L88:
	.stabn	68,0,22,.LM70-.LFBB2
.LM70:
	movs	r1, #0
	.stabn	68,0,40,.LM71-.LFBB2
.LM71:
	mov	r0, r1
	bx	lr
.L91:
	.stabn	68,0,25,.LM72-.LFBB2
.LM72:
	mov	r1, r0
	b	.L85
	.size	ref_iterative_fib, .-ref_iterative_fib
	.stabs	"f_prev:r(0,1)",64,0,32,12
	.stabn	192,0,0,.LFBB2-.LFBB2
	.stabs	"idx:r(0,1)",64,0,34,3
	.stabn	192,0,0,.LBB40-.LFBB2
	.stabn	224,0,0,.LBE40-.LFBB2
	.stabs	"idx:r(0,1)",64,0,34,3
	.stabn	192,0,0,.LBB41-.LFBB2
	.stabn	224,0,0,.LBE41-.LFBB2
	.stabn	224,0,0,.Lscope2-.LFBB2
.Lscope2:
	.stabs	"",36,0,0,.Lscope2-.LFBB2
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (Ubuntu 11.2.0-17ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",%progbits
