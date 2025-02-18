.data
a: .word 2, 5, 3, 7, 1  
b: .word 2
result: .word 0
nline: .asciiz "\n\r"

.text
.globl main
main:
    li $t0, 0           
loop:
    la $t6, a           
    mul $t2, $t0, 4     
    add $t6, $t6, $t2  
    lw $t3, 0($t1)      
    lw $t4, b           
    bgt $t3, $t4, true  
    j false             
true:
    sll $t3, $t3, 1
    sub $t1, $t3, $t4   
    sw $t1, result      
    j continue
false:
    li $t1, 0           
    sw $t1, result      
continue:
    li $v0, 1           
    lw $a0, result     
    syscall                 
    li $v0, 4           
    la $a0, nline      
    syscall             
    addi $t0, $t0, 1    
    blt $t0, 5, loop   
    li $v0, 10         
    syscall             
