# Lab 2 Part 5
# Supavit Rojbundit

.data 
a:	.word 0
b:	.word 0
c:	.word 0

.text
main:	
	addi t0, zero, 5	# t0 = 5 (i)
	addi t1, zero, 10	# t1 = 10 (j)
	
	addi	sp, sp, -8	# Pushing the stack by 2 units (-8 bytes)
	sw	t0,  (sp)	# store value at t0 to the location pointed by sp
	sw	t1, 4(sp)	# store value at t1 to the location pointed by sp + 4
				# sp -> [t0, t1, X]
	jal	AddItUp
	
	add	t2, zero, t1	# a = x <= AddItUp(i)
	
	jal	AddItUp
	
	add	t3, zero, t1	# b = x <= AddItUp(j)
	add	t1, t2, t3	# c = a + b
	sw 	t2, a, t6	# a = t2
	sw	t3, b, t6	# b = t3
	sw	t1, c, t6	# c = t1
	j	exit
AddItUp:
	lw	a2, 0(sp)	# load the value from the stack pointer to s0 (n = i)
	addi	sp, sp, 4	# Pop the stack
	
	addi	t0, zero, 0	# i = 0
	addi	t1, zero, 0	# x = 0
For:
	slt	t5, t0, a2 	# a5 = i < n 
	beq	t5, zero, next	# (i !< n)? branch to next
	addi	t1, t1, 1	# x++
	add	t1, t1, t0	# x += i
	addi	t0, t0, 1	# i++
	j	For
next:
	jr	ra
exit: