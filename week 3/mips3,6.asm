.data
A: .word 3,5,6,-4,-9,-2,1,4,7,8

.text
li $s1,-1 #i=-1
la $s2,A   # s2 store address A[1]
li $s3,9 # number of elements of A
li $s4,1 #step
li $s5,0 # max
li $s6,0 #load value for test case
li $s7,1

loop :
add $s1,$s1,$s4 # i=i+step
add $t1,$s1,$s1 # t1=s1*2
add $t1,$t1,$t1 #t1=4*s1=4*i
add $t1,$t1,$s2   # t1 = address A[1]
lw $t0,0($t1) #load value of a[1] in $t0

start:
slti $t6,$t0,0 # a[i]<0
bne $t6,$zero,else
slt $t8,$t0,$s5 # a[i]<max
beq $t8,$s6,case_0
beq $t8,$s7,case_1
j endif
else:
    sub $t0,$zero,$t0 #abs
    slt $t7,$t0,$s5 # so sanh a[i] < max
    beq $t7,$s6,case_0
    beq $t7,$s7,case_1
    j default
 endif: 
case_0 : add $s5,$t0,$zero  #t0=value A[i]
        j continue 
case_1: j continue
default :
continue: 

bne $s1,$s3,loop # if i!=n, go to loop
