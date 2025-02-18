.data
prompt1: .asciiz "Enter n: "
prompt2: .asciiz "Enter r: "
#usable microes
.macro read_int(%x)
	li $v0,  5
	syscall
	move %x, $v0
.end_macro

.macro print_string(%s)
	li $v0,  4
	la $a0, %s
	syscall
.end_macro

.macro print_int (%x)
	la $a0,  %x
	li $v0, 1
	syscall
	.end_macro

.macro push_stack(%x)
	addi $sp, $sp, -4
	sw %x, 0($sp)
.end_macro

.macro pop_stack(%x)
	lw %x, 0($sp)
	addi $sp, $sp, 4
.end_macro


.text
main:
la $s0,prompt1
read_int($s1)#s1 =n

la $s0,prompt2
read_int($s1)#s2 =r
jal C_function

print_int($v0)

li $v0, 10
syscall 

C_function:
	beq $s2, $zero, return1
	beq $s1, $s2, return1
	push_stack($ra)
	push_stack($s2)
	push_stack($s1)
	
	addi $s1,$s1,-1 # n-1
	jal C_function
	
	pop_stack($s2)
	addi $s2,$s2,-1 #r-1
	pop_stack($s1)
	addi $s2,$s2,-1 #n-1
	
	push_stack($v0)
	jal C_function
	
	pop_stcak($s3)
	add $v0,$v0,$s3 #summing C(n-1,r)+C(n-1,r-1)
	
	pop_stack($ra)
	jal $ra
	
	return1:
		addi $v0, $zero, 1
		jr $ra
	
	
	
	
	
	
	
	
	
	