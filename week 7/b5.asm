# Laboratory Exercise 7, Assignment 5
.data
	largest: .asciiz "Largest: "
	smallest: .asciiz "\nSmallest: "
	comma: .asciiz ", "
.text
main:	li 	$s0, 5
	li 	$s1, -12
	li 	$s2, 56
	li 	$s3, 12
	li 	$s4, 87
	li 	$s5, -2
	li 	$s6, -343
	li 	$s7, 23
	
	jal 	saveNumbers
	nop
	
li 	$v0, 4		# in ra  Largest
	la 	$a0, largest
	syscall
	
add 	$a0, $t0, $zero	# in Max
	li 	$v0, 1		
	syscall		
	
li 	$v0, 4		# in dau phay
	la 	$a0, comma
	syscall
	
add 	$a0, $t5, $zero
	li 	$v0, 1		# in thanh ghi cua Max
	syscall
	
li 	$v0, 4		# in Smallest
	la 	$a0, smallest
	syscall
	
add 	$a0, $t1, $zero	# in Min
	li 	$v0, 1		
	syscall	
	
li 	$v0, 4		# in dau phay
	la 	$a0, comma
	syscall
	
add 	$a0, $t6, $zero
	li 	$v0, 1		# in thanh ghi cua Min
	syscall
endmain:	li 	$v0, 10		# Exit
		syscall
#---------------------------------------------------------------------- 
# Return $t0 = Max 
# Return $t1 = Min
# Index of Max = $t5
# Index of Min = $t6 
#return $v0 the largest value 
#---------------------------------------------------------------------- 
swapMax:
add 	$t0,$t3,$zero
	add 	$t5,$t2,$zero	
	jr 	$ra
swapMin:
add 	$t1,$t3,$zero
	add 	$t6,$t2,$zero
	jr 	$ra
saveNumbers:
	add 	$t9,$sp,$zero	# push dau so lan luot vao stack
	addi 	$sp,$sp, -32
	sw 	$s1, 0($sp)
	sw 	$s2, 4($sp)
	sw 	$s3, 8($sp)
	sw 	$s4, 12($sp)
	sw 	$s5, 16($sp)
	sw 	$s6, 20($sp)
	sw 	$s7, 24($sp)
	sw 	$ra, 28($sp)		# Save $ra for main
	add 	$t0,$s0,$zero		# Max = $s0
	add 	$t1,$s0,$zero		# Min = $s0
	li 	$t5, 0				# Index of Max to 0
	li 	$t6, 0				# Index of Min to 0
	li 	$t2, 0				# i = 0
findMaxMin:
	addi 	$sp,$sp,4
	lw 	$t3,-4($sp)
	sub 	$t4, $sp, $t9
	beq 	$t4,$zero, done		#  $sp = $fp nhay xuong 'done'
	nop
	addi 	$t2,$t2,1			# i++
	sub 	$t4,$t0,$t3
	bltzal $t4, swapMax		# $t3 > Max jump and link swapMax
	nop
	sub 	$t4,$t3,$t1
	bltzal $t4, swapMin	#  $t3 < Min jump and link swapMin
	nop
	j 	findMaxMin		# Repeat
done: 	
lw 	$ra, -4($sp)
	jr 	$ra 			# Return to calling program
