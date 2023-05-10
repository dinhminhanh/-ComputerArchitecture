#Laboratory Exercise 3, Home Assignment 1
# a ) i < j
#start: 
#li $s1,3 # i=3
#li $s2,5 # j=5
#slt  $t0,$s1,$s2 # i<j 
#beq $t0,$zero,else # branch to else if j<i
#addi $t1,$t1,1 # then part: x=x+1
#addi $t3,$zero,1 # z=1
#j endif # skip “else” part
#else: addi $t2,$t2,-1 # begin else part: y=y-1
#add $t3,$t3,$t3 # z=2*z
#endif:

# b) i >=j
#.text
#li $s1,5 # i=5
#li $s2,3 # j =3
#start:
#sle $t0,$s2,$s1  # j <= i -> $t0 = 1 else $t0 = 0
#beq $t0,$zero,else # branch to else if j<i
#addi $t1,$t1,1 # then part: x=x+1
#addi $t3,$zero,1 # z=1
#j endif  
#else: addi $t2,$t2,-1 # begin else part: y=y-1
#add $t3,$t3,$t3 # z=2*z
#endif:

#c )i + j <= 0
#.text
#addi $s1, $0, 3 
#addi $s2, $0, 5 
#add $s3, $s1, $s2 # i + j
#start:
#sle $t0,$s3,$0 # i+j <= 0-> $t0 = 1 else $t0 = 0
#beq $t0,$zero,else # branch to else if j<i
#addi $t1,$t1,1 # then part: x=x+1
#addi $t3,$zero,1 # z=1
#j endif # endif
#else: addi $t2,$t2,-1 # begin else part: y=y-1
#add $t3,$t3,$t3 # z=2*z
#endif:

 #d. i + j > m + n
 .text
addi $s1, $0, 12 # i=12
addi $s2, $0, 5 # j=5
li $s3, 4 # m = 4
li $s4, 8 # n = 8
start:
add $s5,$s3,$s4 # m + n
add $s6,$s1,$s2 # i + j
slt $t0,$s5,$s6 # m + n < i+j -> $t0 = 1 else $t0 = 0
beq $t0,$zero,else # branch to else if j<i
addi $t1,$t1,1 # then part: x=x+1
addi $t3,$zero,1 # z=1
j endif # endif
else: addi $t2,$t2,-1 # begin else part: y=y-1
add $t3,$t3,$t3 # z=2*z
endif:
