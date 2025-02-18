#qustion 4
.data
prompt1: .asciiz "Enter n: "
.text
main:
   li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
#intializing i , n , sum
#t0 = n / f2 = n/ t1=i /t6 =i / t2 = sum/ t3 = address of array/f3 = sum
 move $t0, $v0
mtc1 $t0,$f2
 cvt.s.w $f2,$f2
 li $t1,1 
 li $t2,0
 li $t6,1 
 mtc1 $t2,$f3
 cvt.s.w $f3,$f3
#initializing array
mul $a0, $t0,4
li $v0,9
 syscall 
 move $t3, $v0
 #summing numbers and creating array  
Loop:
li $v0, 5
syscall
add $t2,$t2,$v0          
    mul $t1, $t1, 4     
    add $t4, $t1, $t3  
    sw  $v0,0($t4)
    div $t1,$t1,4

add $t1,$t1,1
bgt $t1,$t0,Varriance
j Loop
Varriance: 
mtc1 $t2, $f0
cvt.s.w $f0,$f0
mul $t6, $t6, 4     
    add $t4, $t6, $t3  
    lw  $t7,0($t4) 
    mtc1  $t7,$f1  
    cvt.s.w $f1,$f1
    div.s $f0,$f0,$f2
    sub.s $f1,$f1,$f0
    mul.s $f1,$f1,$f1
    add.s $f3,$f3,$f1
    div $t6,$t6,4 
    add $t6,$t6,1
    bgt $t6,$t0,Exit
    j Varriance
Exit:
#printing sum
li $v0 , 2
li $s3,0
mtc1 $s3,$f12
add.s $f12, $f12, $f0
syscall
#printing varriance
div.s $f3,$f3,$f2
li $v0 , 2
mtc1 $s3,$f12
add.s $f12, $f12, $f3
syscall
li $v0, 10
syscall
