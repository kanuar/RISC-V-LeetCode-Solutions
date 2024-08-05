.data
arr1: .word 1,2,2,4,4,0
arr2: .zero 4*5
.text
la x1,arr1
la x2,arr2

loop:
    lw x3,0(x1)
    beq x3,x0,ender
    lw x4,-4(x2)
    addi x1,x1,4
    beq x3,x4,loop
    sw x3,0(x2)
    addi x2,x2,4
    j loop
ender:
    nop