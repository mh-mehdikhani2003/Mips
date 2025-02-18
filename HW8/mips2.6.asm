#Damn answer to the damn qu6
.data
space: .asciiz "="
input: .space 256
string: .asciiz "0123456789AB/CD+EFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
.text
la $s7,space
la $s1,string
li $v0,8
la $a0,input
add $a1,$zero,256
syscall
addi $s0,$a0,0
li $t5,4
li $t0,16
li $t9,64
li $k0,0  # counting to zero 
loopa:
  lb $t2, ($s0)          
  beqz $t2, done         
  addi $s0, $s0, 1       
  addi $k0, $k0, 1       
  j loopa                 
 done:
 sub $s0, $s0, $k0
 addi $k0, $k0, -1
    
loopthefirst :
blt $k0,3,loop2
lb $t7,0($s0)
lb $t2,1($s0)
lb $t3,2($s0)
div $t7,$t5
mflo $t4
add $t4,$s1,$t4
lb $a0,($t4)
li $v0,11
syscall
mfhi $t1 
mul $t1,$t1,16
div $t2,$t0
mflo $t8
add $t1,$t1,$t8
add $t1,$t1,$s1
lb $a0,($t1)
li $v0,11
syscall 
mfhi $t7
mul $t7,$t7,4
div $t3,$t9
mflo $t2
add $t7,$t7,$t2
add $t7,$t7,$s1
li $v0,11
lb $a0,($t7)
syscall 
mfhi $t3
li $v0,11
add $t3,$t3,$s1
lb $a0,($t3)
syscall 
add $s0,$s0,3
add $k0,$k0,-3
j loopthefirst
loopthesecond:
blt $k0,2,loop3
lb $t7,0($s0)
lb $t2,1($s0)
lb $t3,0($s7)
div $t7 ,$t5
mflo $t4
add $t4,$s1,$t4
lb $a0,($t4)
li $v0,11
syscall
mfhi $t1 
mul $t1,$t1,16
div $t2,$t0
mflo $t8
add $t1,$t1,$t8
add $t1,$t1,$s1
lb $a0,($t1)
li $v0,11
syscall 
mfhi $t7
mul $t7,$t7,4
div $t3,$t9
mflo $t2
add $t7,$t7,$t2
add $t7,$t7,$s1
li $v0,11
lb $a0,($t7)
syscall 
mfhi $t3
li $v0,11
add $t3,$t3,$s1
lb $a0,($t3)
syscall 
add $s0,$s0,3
add $k0,$k0,-3
j loopthesecond
loopthethird:
blt $k0,1,Exit
lb $t7,0($s0)
lb $t2,0($s7)
lb $t3,0($s7)
div $t7,$t5
mflo $t4
add $t4,$s1,$t4
lb $a0,($t4)
li $v0,11
syscall
mfhi $t1 
mul $t1,$t1,16
div $t2,$t0
mflo $t8
add $t1,$t1,$t8
add $t1,$t1,$s1
lb $a0,($t1)
li $v0,11
syscall 
mfhi $t7
mul $t7,$t7,4
div $t3,$t9
mflo $t2
add $t7,$t7,$t2
add $t7,$t7,$s1
li $v0,11
lb $a0,($t1)
syscall 
mfhi $t3
li $v0,11
add $t3,$t3,$s1
lb $a0,($t3)
syscall 
add $s0,$s0,3
add $k0,$k0,-3
j loopthethird
Exit:
li $v0,10
syscall 








