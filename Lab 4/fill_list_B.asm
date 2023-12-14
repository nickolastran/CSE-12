#------------------------------------------------------------#
#let's add  key=-1 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,31
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4

#let's add  key=10 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,10
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4

#let's add  key=-206 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,-206
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4


#let's add  key=-206 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,-206
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4



#let's add  key=36 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,36
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4


#let's add  key=606 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,606
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4



#------------------------------------------------------------#
