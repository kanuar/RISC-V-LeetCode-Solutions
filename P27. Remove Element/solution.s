.data
arr1: .word 1,2,2,3,4,2,0
key: .word 2
k: .zero 4
.text
la x1,arr1
lw x2,key
la x3,k
mv x4,x1
loop:
    lw x5,0(x1) 
    lw x6,0(x4) 
    beq x6,x0,ender
    bne x6,x2,next
    addi x4,x4,4
    j loop
next:
    sw x6,0(x1)
    addi x1,x1,4
    addi x4,x4,4
    j loop
ender:
    nop