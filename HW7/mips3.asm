.data
    input: .asciiz "Enter integer number: "
    output: .asciiz "The mabna16 representation of the number is: "

.text
.globl main
main:
    
    li $v0, 4
    la $a0, input
    syscall
    
    
    li $v0, 5
    syscall
    move $s0, $v0 
    
    
    li $v0, 4
    la $a0, output
    syscall
    
    
    li $v0, 34
    move $a0, $s0
    syscall
    
    
    li $v0, 10
    syscall
