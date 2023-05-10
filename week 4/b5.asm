#Laboratory Assignment 5
.text
	li $s0, 2
	sll $t1,$s0,1 # s0 * (2^1)
	sll $t2,$s0,2 # s0 * (2^2)
	sll $t3,$s0,3 # s0 * (2^3)
	add $t4,$t1,$t2
	 add $t5,$t4,$t3 