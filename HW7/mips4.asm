.data
entery: .asciiz "Enter a number: "
result: .asciiz "The decimal value of bits 14-17 is: "

.text
.globl main

main:
    
    li $v0, 4
    la $a0, entery
    syscall

    
    li $v0, 5
    syscall
    move $t0, $v0

    
    srl $t3, $t0, 13      
    andi $t4, $t3, 0xF    

   
    li $v0, 4
    la $a0, result
    syscall


    addi $t1, $t4, 48     

    
    li $v0, 11
    move $a0, $t1
    syscall

    
    li $v0, 10
    syscall
