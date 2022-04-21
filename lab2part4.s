# Lab 2 Part 4
# Supavit Rojbundit

.data
A:	.space 20 # int A[5];
B:	.word 1, 2, 4, 8, 16 # int B[5] = {1,2,4,8,16};

.text
main:
	add	t0, zero, zero	# int t0 = 0; where t0 represents i
	addi	t1, zero, 5	# int t1 = 5;
	la	t5, A		# store A[0] address in t5
	la	t6, B		# store B[0] address in t6
For_loop:
	bge	t0, t1, While_loop	# if t0 >= t1, branch to Exit
	slli	t3, t0, 2	# t3 = i * 4; where t2 represents the index address offset
	add	t2, t3, t6	# t2 = t3 + t6; storing the add. of B[i] in t2
	lw	t2, (t2)	# Load VALUE from ADDRESS t2
	addi	t2, t2, -1	# t2 = B[i] - 1
	
	add	t4, t3, t5	# store the address of A[i]
	sw	t2, (t4)	# A[i] = B[i] - 1
	addi	t0, t0, 1	# t0++
	j	For_loop	# Loop back to Loop

While_loop:
	addi	t0, t0, -1	# i--
	blez	t0, Exit
	slli	t3, t0, 2	# t3 = i * 4
	
	add	t2, t3, t6	# t2 = &B[i]
	lw	t2, (t2)	# t2 = B[i]
	
	add	t4, t3, t5	# t4 = &A[i]
	lw	t1, (t4)	# t1 = A[i]
	
	add	t2, t2, t1	# t2 = A[i] + B[i]
	add	t2, t2, t2	# t2 *= 2
	
	sw 	t2, (t4)
	j	While_loop
Exit: