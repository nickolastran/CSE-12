.text
# syscall to allocate memory (sbrk)
    li a7, 9
    li a0, 8        # Allocate 8 bytes for the node
    ecall
    
    li a0, -1
    
    # syscall to allocate memory (sbrk)
    li a7, 9
    li a0, 8        # Allocate 8 bytes for the node
    ecall