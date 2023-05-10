#Laboratory Exercise 5, Home Assignment 2
.data
Mess1: .asciiz "The sum of " 
Mess2: .asciiz " and "
Mess3: .asciiz " is "
.text
	li $s1, 3  
	li $s2, 7  
	
	li $v0, 4
	la $a0, Mess1
	syscall
	
	li $v0, 1
	add $a0,$zero, $s1  
	syscall
	
	li $v0, 4
	la $a0, Mess2
	syscall
	
	li $v0, 1
	add $a0, $zero, $s2  
	syscall
	
	li $v0, 4
	la $a0, Mess3
	syscall
	
	li $v0, 1
	add $a0, $s1, $s2
	syscall
