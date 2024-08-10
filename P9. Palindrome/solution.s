.data
var: .word 129
k: .zero 1
.text
la x1,var
lw x2,0(x1)
li x4,0
loop:
    slli x4,x4,1
    andi x5,x2,1
    add x4,x4,x5
    srli x2,x2,1
    bne x2,x0,loop

lw x2,0(x1)
beq x2,x4,ender
la x1,k
li x3,0xff
sw x3,0(x1)
ender:
    nop