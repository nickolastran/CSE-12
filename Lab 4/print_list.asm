#---------------------------------------------------------------------------------------------#
print_list:
# Function to traverse the linked list and print the values
# Inputs: a1 = head of the linked list
	
	beqz a1, emptyList

	traverseLoop:
		beqz a1, traverseEnd
		lw t0, 0(a1)
		print_int(t0)
		print_str(comma_space)
		lw a1, 4(a1)
		j traverseLoop

	traverseEnd:
    		print_str(endoflistmsg)
    		print_str(newline)
    		ret

	emptyList:
    		print_str(endoflistmsg)
    		ret
