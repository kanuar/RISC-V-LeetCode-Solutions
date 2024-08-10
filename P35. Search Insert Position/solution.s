.data
arr: .word 1,3,5,6,0
target: .word 5
n: .word 4
ind: .zero 4

.text
la x1,arr
lw x2,target
lw x3,n

lw x4,0(x1)
slt x5,x2,x4
mv x7,x5
bne x5,x0,ender

slli x4,x3,2
add x4,x1,x4
lw x5,-4(x4)
slt x6,x5,x2
mv x7,x6
bne x6,x0,ender

li x4,2
li x5,0 #lower 
mv x6,x3 #upper
loop:
    bge x5,x6,ender
    add x7,x6,x5
    div x7,x7,x4
    slli x8,x7,2
    add x8,x1,x8
    lw x9,0(x8)
    beq x9,x2,ender
    blt x2,x9,shift_upper
    mv x5,x7
    addi x5,x5,1
    j loop
shift_upper:
    mv x6,x7
    addi x6,x6,-1
    j loop
ender:
    la x1,ind
    sw x7,0(x1)
    nop