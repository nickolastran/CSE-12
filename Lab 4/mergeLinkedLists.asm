#---------------------------------------------------------------------------------------------#
mergeLinkedLists:
#Function to merge the 2 sorted lists together and the resultant list is also sorted
#Inputs: a0 = address of head of 1st linked list; so if a0=0x10040000 points to empty list, then mem[0x10040000]=0
#	a1 = = address of head of 2nd linked list;
#Output: the first linked contains the combined elements of 1st and second lists sorted
   
     mv t4, a0 
     lw t5, 0(a1)
    
    mergeStart:
        beqz t5, mergeEnd
        lw a1, 0(t5)
        addi sp, sp, -12
        sw ra, 0(sp)
        sw a0, 4(sp)
        sw a1, 8(sp)
        
        jal insertSorted
        
        lw ra, 0(sp)
        lw a0, 4(sp)
        lw a1, 8(sp)
        addi sp, sp, 12
        lw t5, 4(t5)
        j mergeStart
    
    mergeEnd:
        ret