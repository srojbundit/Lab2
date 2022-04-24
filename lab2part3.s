# Lab 2 Part 3
# Supavit Rojbundit

.data
Z:    .word 2
i:    .word 0

.text
main:
    lw t0, Z        # load value of Z into a0
    lw t1, i        # load value of i into a1
For:
    slti t2, t1, 21        # t2 = i < 20
    beq t2, zero, Do    # (t2 == 0)? branch to Do
    addi t0, t0, 1        # Z++
    
    addi t1, t1, 2        # i += 2
    j    For
Do:
    addi t0, t0, 1        # Z++
    slti t2, t0, 100    # t2 = 1 if z < 100
    beq t2, zero, While    # (Z !< 100)? branch to While
    j    Do
While:
    addi t3, zero, 0    # t3 = 0
    slt t2, t3, t1        # t2 = 0 < i
    beq t2, zero, Exit    # (t2 == 0)? branch to Exit
    addi t0, t0, -1        # Z--
    addi t1, t1, -1        # i--
    j    While
Exit:
    sw t0, Z, t5        # Z = t0
    sw t1, i, t6        # i = t1
