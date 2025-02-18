
.data
    seed:   .space 5
    input:    .space 21
    encrypted:    .space 21
    msgSeed:     .asciiz "Enter the seed 4 chars: "
    msgString:   .asciiz "Enter the string  20 bytes : "
    msgEncrypt:    .asciiz "encrypted String is: "

.text
main:
   
    li $v0, 4      
    la $a0, msgSeed
    syscall
    li $v0, 8       
    la $a0, seed
    li $a1, 5     
    syscall   
    li $v0, 4      
    la $a0, msgString
    syscall
    li $v0, 8     
    la $a0, msgString
    li $a1, 21     
    syscall
    li $t0, 0      
    jal strlen 
randomLoop:
   
    beq $t0, $t1, Xor
    li $v0, 42      
    la $a0, seed
    li $a1, 256     
    syscall

    lb $t3, input($t0)   
    xor $t3, $t3, $v0          
    sb $t3, encrypted($t0)   

    addi $t0, $t0, 1    
    j randomLoop

Xor:
   
    li $v0, 4      
    la $a0, msgEncrypt
    syscall    
    li $v0, 4      
    la $a0, encrypted
    syscall 
    li $v0, 10      
    syscall
        
strlen:
li $t1, 0 
la $a0, input
loop:
lb $t2, 0($a0) 
beqz $t2, jump_ra
addi $a0, $a0, 1 
addi $t1, $t1, 1 
j loop  
jump_ra:
jr $ra
