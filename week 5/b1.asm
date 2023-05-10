#Laboratory Exercise 5, Home Assignment 1
.data
test: .asciiz "Dinh Minh Anh 20214991"
.text
	li $v0, 4
	la $a0, test
	syscall
