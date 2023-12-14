#---------------------------------------------------------------------------------------------#
newNode:
# Function to dynamically allocate memory for a new node
# Inputs: a1 = value of the node key
# Outputs: a0 = pointer to the allocated node

    #things to do...
    #1. ecall to allocate memory (sbrk)
    #2. Store the node value
    #3. Store the null pointer as the next pointer (initialize to NULL)

	li a7, 9 
	li a0, 8
    	ecall
    
    	sw a1, 0(a0)
    	sw zero, 4(a0)

    	ret