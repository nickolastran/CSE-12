
# RISC-V ISA Implementation of Linked list with a newNode function
#size of Node
#4 bytes to hold the key
#4 bytes to hold address of next node "next" 


.data

ListHeadReposiotory: .word 0x10000000
#this is the memory section where we keep track of the location of head of all created lists in program
#example, assume there are 3 linked lists created, with head nodes at 0x10040000, 0x1004001c and 0x10040020
#then mem[0x10000000]=0x10040000; mem[0x10000004]=0x1004001c; mem[0x10000008]=0x10040020
comma_space: .asciz " , "
newline: .asciz "\n"
empty_list_msg: .asciz "Empty List!\n"
endoflistmsg: .asciz "end of list"
printA: .asciz "printing list A: \n"
printAmerged: .asciz "printing merged list A: \n"
printB: .asciz "printing list B: \n"
mergeMsg: .asciz "now merging A and B sorted into list A....\n\n"

.macro print_str(%str)
#DO NOT CHANGE ANY LINE OF CODE WITHIN THIS MACRO!
	#ask user to print %str
	li a7, 4
	la a0, %str
	ecall
.end_macro

.macro print_int(%reg)
#DO NOT CHANGE ANY LINE OF CODE WITHIN THIS MACRO!
	#ask user to print value in %reg
	li a7, 1
	addi a0, %reg, 0
	ecall
.end_macro

.macro exit
	li a7, 10 # terminate the program gracefully
	ecall
.end_macro

.text
main:


#create head for out new list A
jal createHead
#a0 now containes pointer to head location.
#head itself is set to NULL

#the code from the file below will fill up list A
.include "fill_list_A.asm"


#now let's print the list:
addi sp, sp, -4
sw a0, 0(sp)
print_str(printA)
lw a0, 0(sp)
addi sp, sp, 4

lw a1, 0(a0)#argument for print_list
li t0, 0x10000000
sw a0, 0(t0)
#saving A's head reference to exclusive memory section for future use
jal print_list
#printing list A

#Now, let's create a new linked list B

#create head for out new list B
jal createHead
#a0 now containes pointer to head location.
#head itself is set to NULL

#the code from the file below will fill up list B
.include "fill_list_B.asm"


#now let's print the list:
addi sp, sp, -4
sw a0, 0(sp)
print_str(printB)
lw a0, 0(sp)
addi sp, sp, 4

lw a1, 0(a0) #argument for print_list
li t0, 0x10000004
sw a0, 0(t0)
#saving B's head reference to exclusive memory section for future use
jal print_list
#printing list B

#now let us test mergeLinkedLists

print_str(mergeMsg)

li t0, 0x10000000
lw a0, 0(t0)#a0= headref of A
lw a1, 4(t0)#a1= headref of B
#a0,a1 now have intented arguments
jal mergeLinkedLists

#print lists A and B again

print_str(printAmerged)
li t0, 0x10000000
lw a1, 0(t0)#a1= headref of A; i.e. the location in memoery where head exists
lw a1, 0(a1)#a1= headref of A points to a1; if A is empty, a1 = 0 

jal print_list
#printing list A

print_str(printB)
li t0, 0x10000004
lw a1, 0(t0)#a1= headref of B; i.e. the location in memoery where head exists
lw a1, 0(a1)#a1= headref of B points to a1; if A is empty, a1 = 0 

jal print_list
#printing list B

exit
#exit main

#---------------------------------------------------------------------------------------------#
createHead:
# Function to dynamically allocate memory for the head of a new linked list
# Outputs: a0 = pointer to the location where head exists

    # syscall to allocate memory (sbrk)
    li a7, 9
    li a0, 4        # Allocate 4 bytes for the head
    #remeber the head will just contain a reference address to the 1st entry in linked list
    ecall

    # newwly birted head will poin to NULL
    sw zero, 0(a0)    # Store value in the first word of the node
    
    #when the firs node is inserted, head pointer will contain the address where we placed this first node.
    #right now, it's set to NULL

    # Return the pointer to the allocated node in a0
    ret
    

    

#---------------------------------------------------------------------------------------------# 
 .include "newNode.asm"
 .include "insertSorted.asm"
 .include "mergeLinkedLists.asm"
 .include "print_list.asm"
