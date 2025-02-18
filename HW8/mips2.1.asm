#answer to question1
.data
space: .asciiz " "

.text
.macro ABS ($x, $abs)
    sra $t2,$x,31   
    xor $x,$x,$t2   
    sub $abs,$x,$t2   
.end_macro

.macro MAX ($x1, $x2, $max)
   add $t0, $x1, $x2
   sub $t1, $x1, $x2
   ABS($t0, $t0)
   ABS($t1, $t1)
   add $max, $t0, $t1
   srl $max, $max, 1
.end_macro

    addi $s1, $zero, 22
    addi $s2, $zero,-4
    addi $s3, $zero, 12
      
    MAX($s1, $s2, $t4)
    MAX($s3, $t4, $t3)
    MAX($s2, $s3, $t5)
    MAX($s1, $s3, $t6)
    
    add $t4, $t4, $t5
    add $t4, $t4, $t6    
    sll $t7, $t3, 1   
    sub $t2, $t4, $t7    
    add $t5, $s1, $s2
    add $t5, $t5, $s3    
    sub $t5, $t5, $t3
    sub $t1 ,$t5, $t2 
    
    li $v0, 1        
    move $a0, $t1    
    syscall
    
    li $v0, 4        
    la $a0, space
    syscall
    
    li $v0, 1 
    move $a0, $t2    
    syscall
    
    li $v0, 4        
    la $a0, space
    syscall
    
    li $v0, 1 
    move $a0, $t3  
    syscall
    li $v0, 10
    syscall


