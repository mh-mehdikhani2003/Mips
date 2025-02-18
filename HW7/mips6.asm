.text          
    li $v0, 4
    la $a0, entery
    syscall    
    li $v0, 5
    syscall
    move $s0, $v0
    move $t0, $s0    
    srl $t0, $t0, 1    
    sll $t0, $t0, 1    
    beq $s0, $t0, even    
    li $s0, 1
    j end    
even:    
    li $s0, 0    
end:
addi $s0, $s0, 48      
    li $v0, 4
    la $a0, result
    syscall  
    li $v0, 11
    move $a0, $s0
    syscall    
    li $v0, 10
    syscall     
main:    
    move $t0, $s0    
    srl $t5, $t0, 1      
    sll $t5, $t5, 1      
    sub $t2, $t0, $t5                       
    move $s0, $t2
    li $v0, 10
    syscall    
.data
entery: .asciiz "Enter a number: "
result: .asciiz "is a odd : "
    
