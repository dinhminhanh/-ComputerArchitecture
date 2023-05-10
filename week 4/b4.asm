#Laboratory Assignment 4
.text
	li $s0, 1
	li $s1, 2
start:
	li $t0, 0 # default status
	addu $s2, $s0, $s1 # s3 = s0 +s1
	xor $t1,$s0,$s1 # test s1 and s2 have the same sing
	bltz $t1,EXIT
	xor $t2, $s2, $s1# test if $s3 and $s1 have the same sign
	bltz $t2,OVERFLOW
	j EXIT
OVERFLOW:
	li $t0,1 # the result is overflow
EXIT: