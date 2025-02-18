.data
msg:   .asciiz "Please enter the year:"
Ye:    .asciiz "YES"
No:    .asciiz "NO"
.text 
.globl main

main:
   #inputing
   la $a0, msg
   ori $v0, $zero, 4
   syscall
   #reading
   ori $v0, $zero, 5 #v0 = year
   syscall 
   move $t0, $v0
   
    rem $t1, $t0, 4
    rem $t2, $t0, 100
    rem $t3, $t0, 400

    beqz $t1, div4
    j notDivisible

div4:
    beqz $t2, div100
    j yesYear

div100:
    beqz $t3, yesYear

notDivisible:
    li $v0, 4
    la $a0, No
    syscall
    j end

yesYear:
    li $v0, 4
    la $a0, Ye
    syscall

end:
    li $v0, 10
    syscall
	