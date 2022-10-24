	.global	sum
	.type	sum, %function
sum:
  ldr r1, [r0]
  ldr r2, [r0, #4]
  str r0, [sp, #-4]! 
  ldr r0, [sp], #4 
  add r0, r1, r2
  mov pc, lr
