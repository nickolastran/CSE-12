#------------------------------------------------------------#
#let's add  key=-1 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
#a0 currently is equal to 0x10040000
li a1,-1
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

#let's add  key=-7 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,-7
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4

#let's add  key=-6 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,-6
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4

#let's add  key=26 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,26
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4

#let's add  key=26 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,26
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4

#let's add  key=26 using insertSorted
addi sp, sp, -4
sw a0, 0(sp)
li a1,26
jal insertSorted
lw a0, 0(sp)
addi sp, sp, 4

#------------------------------------------------------------#