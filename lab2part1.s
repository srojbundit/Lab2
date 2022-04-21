# Lab 2 Part 1
# Supavit Rojbundit

.data
Z:    .word 0    # int Z = 0;

.text
main:
    addi x1, x0, 15 # int A = 15;
    addi x2, x0, 10 # int B = 10;
    addi x3, x0, 5    # int C = 5;
    addi x4, x0, 2    # int D = 2;
    addi x5, x0, 18    # int E = 18;
    addi x6, x0, -3    # int F = -3;
    
    sub x2, x1, x2    # B = A - B;
    mul x4, x3, x4    # D = C * D;
    sub x6, x5, x6    # F = E - F;
    div x1, x1, x3    # A = A / C;
    
    add x3, x2, x4    # (A-B) + (C*D)
    add x3, x3, x6    # (A-B) + (C*D) + (E-F)
    sub x3, x3, x1    # (A-B) + (C*D) + (E-F) + (A/C)
    
    sw x3, Z, x1
