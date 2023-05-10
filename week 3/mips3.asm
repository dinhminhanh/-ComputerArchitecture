.text

start:
li $s1,3 #i=3
li $s2, 5 #j=5
slt $t0,$s2,$s1 #j<i t0=1
bne $t0,$zero,else #khac 0 thi chuyen else
addi $s1,$s1,1 #x=x+1
addi $t3,$zero,1 #z=1
j endif
else:
addi $t2,$t2,-1 #y=y-1
add $t3,$t3,$t3 #z=2*z
endif: