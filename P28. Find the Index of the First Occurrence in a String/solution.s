.data
w: .string "asadbutsad"
key: .string "sad"
ind: .zero 4
.text
la x1,w
la x2,key

outer:
    mv x3,x1
inner:
    lbu x4,0(x1)
    beq x4,x0,finally
    lbu x5,0(x2)
    beq x5,x0,found
    bne x4,x5,shift_outer 
shift_inner:
    addi x2,x2,1
    addi x1,x1,1
    j inner
shift_outer:
    li x3,0
    addi x1,x1,1
    la x2,key
    j outer
found:
    la x1,w
    sub x3,x3,x1
    j ender
finally:
    li x3,-1
ender:    
    la x1,ind
    sw x3,0(x1)
    nop