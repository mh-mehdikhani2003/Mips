la $t4, $s7
lw $t4, 16($t4)  
lw $t1, 0($s2)       
lw $t2, 0($s1)     
add $t1, $t4, $t1          
add $t2, $t1, $t2    
sw $t2, 0($s1)    
sll $t3, $t4, 2            
add $t3, $t3, $s6          
lw $t3, 0($t3)
sub $t2, $t2, $t3  
sw $t2, 0($s1)  

