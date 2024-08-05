.data
arr1: .word 1,2,4,0
arr2: .word 1,3,4,0
arr3: .zero 4*6

.text
la x1,arr1
la x2,arr2
la x3,arr3

loop:
    lw x4,0(x1)
    lw x5,0(x2)
    beq x4,x0,ender_1
    beq x5,x0,ender_2
    bge x4,x5,store_2
    store_1:
        sw x4,0(x3)
        addi x3,x3,4
        addi x1,x1,4
        j loop
    store_2:
        sw x5,0(x3)
        addi x3,x3,4
        addi x2,x2,4
        j loop
ender_1:
    lw x5,0(x1)
    beq x5,x0,ender
    sw x5,0(x3)
    addi x3,x3,4
    addi x2,x2,4
    j ender_1
ender_2:
    lw x5,0(x1)
    beq x5,x0,ender
    sw x5,0(x3)
    addi x3,x3,4
    addi x1,x1,4
    j ender_2
ender:
    nop