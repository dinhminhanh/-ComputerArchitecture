#Laboratory Assignment 3 
.text 
abs: 
	li	$s0, -38
	slti $t0,$s0,0 # t0<0
        bne $t0,$zero,else
        add $t0,$zero,$s0
        j endif
else:
    sub $t0,$zero,$s0 #abs
    endif: 
	 
EXIT: 
move: 
	li	$s0,-2 
	li	$s1,5
	add	$s0,$0,$s1 # move s1 to s0 -> s0 = 8 
not: 
	li	$s0,-4508 
	nor	$t0,$s0,$zero # t0 = not(s0) 
ble: 
	li	$s1, 8
	li	$s2, 5
	slt	$t0, $s1, $s2 
	beq	$t0, 1, CASE 
	
	addi	$s2,$s2,2 
	j a 
CASE: 
	addi	$s1, $s1, 3 
a: