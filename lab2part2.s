# Lab 2 Part 2
# Supavit Rojbundit

.data
A:    .word 10    # int A = 10;
B:    .word 15
C:    .word 6
Z:    .word 0

.text
main:
    lw    x1, A
    lw    x2, B
    lw    x3, C
    
    # if ((A < B) && C > 5))
    slt    x6, x1, x2        # x6 = (A < B)
    addi    x4, x0, 5        # t1
    slt    x7, x4, x3        # x7 = (C > 5)
    
    add    x6, x6, x7        # x6 = x6 + x7; should evaluate to 2 if both true
    addi    x7, zero, 2        # set x7 to 2
    beq    x6, x7, First_if    # jump to first if ((A < B) && C > 5))
    
    # else if ( A > B || ((C + 1) == 7)
    slt    x6, x2, x1        # x6 = (A > B)
    bne    x6, zero, Second_if    # x6? branch to second
    addi    x7, x3, 1        # x7 = C + 1
    addi    x4, zero, 7        # set x4 to 7
    beq    x7, x4, Second_if    # (x7 == x5)? branch to second
    # else
    addi    x4, zero, 3
    sw    x4, Z, x5        # Store x8 = 3 into var Z
    j    Return_if
    
# if Branches
First_if:
    addi    x4, x0, 1        # x4 = 1
    sw    x4, Z, x5        # Z = x4
    j    Return_if

Second_if:
    addi    x8, x0, 2
    sw    x8, Z, x5
    j    Return_if
    
Return_if:
    # case (Z)
    lw    x1, Z
    
    # case 1
    addi    x4, zero, 1        # Storing 1 into x4
    beq    x1, x4, Case_1        # check if Z == 1, branch to Case_1

    # case 2
    addi    x4, zero, 2        # Storing 2 into x4
    beq    x1, x4, Case_2        # Check if Z == 2, branch to Case_2
    
    # case 3
    addi    x4, zero, 3        # Storing 3 into x4
    beq    x1, x4, Case_3        # Check if Z == 3, branch to Case_3
    
    # default
    sw    zero, Z, x5
    j    Return_case

# case  Branches
Case_1:
    addi    x4, x0, -1
    sw    x4, Z, x5
    j    Return_case

Case_2:
    addi    x4, x0,    -2
    sw    x4, Z, x5
    j    Return_case
    
Case_3:
    addi    x4, x0, -3
    sw    x4, Z, x5
    j    Return_case
    
Return_case:
