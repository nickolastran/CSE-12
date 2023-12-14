#---------------------------------------------------------------------------------------------#
insertSorted:
# Function to insert a new node into the given linkedlist in ascending order
# Inputs: a1 = value of the node key
#a0 = address of head of linked list; so if a0=0x10040000 points to empty list, then mem[0x10040000]=0
# Outputs: a0 = pointer to the final node in current sorted linked list

	addi sp, sp, -12
	sw ra, 0(sp)
	mv t3, a0
	
	jal newNode
	
	lw t0, 0(t3)
	mv t1, zero
	
	loop:
		beqz t0, insertMiddle
		lw t2, 0(t0)
		bge t2, a1, insertMiddle
		mv t1, t0
		lw t0, 4(t0)
		j loop
		
	insertMiddle:
		beqz t1, insertBeginning
		sw a0, 4(t1)
		sw t0, 4(a0)
		j end
		
	insertBeginning:
		sw t0, 4(a0)
		sw a0, 0(t3)
		j end
		
end:
	lw ra, 0(sp)
	addi sp, sp, 12
	ret
