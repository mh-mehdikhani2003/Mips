#answer to question 2
.data
prompt1: .asciiz "Enter n: "
.text
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall

    move $t0, $v0
 li $t1,1
 li $t7,0
  mtc1 $t7,$f0
  cvt.s.w $f0,$f0
  mtc1 $t1,$f4
  cvt.s.w $f4,$f4
  # f4=cons one/ f0 =sum/ t1=i
Loop:
mul $t3,$t1,$t1
mtc1 $t3,$f6
cvt.s.w $f6,$f6
div.s $f2,$f4,$f6
add.s $f0,$f0,$f2
add $t1,$t1,1
bgt $t1,$t0,Exit
j Loop
Exit:
li $v0 , 2
mtc1 $t7,$f12
cvt.s.w $f12,$f12
li $s6,6
mtc1 $s6,$f10
cvt.s.w $f10,$f10
mul.s $f0,$f0,$f10
add.s $f12, $f12, $f0
syscall
li $v0, 10
syscall
