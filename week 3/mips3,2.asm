.data
A:.word 1,0,3,4,5,6,7,8,9
.text
li $s1, -1
la $s2,A #the chua address cua mang A
li $s3,9 #so gia tri cua mang A
li $s4,1 #step
li $s5,0 #sum
loop:  
add $s1,$s1,$s4 #i=i+step
add $t1,$s1,$s1 #t1=2*s1
add $t1,$t1,$t1 #t1=4*s1
add $t1,$t1,$s2 #t1 store the address of A[i]
lw $t0,0($t1) #load value of A[i] in $t0
add $s5,$s5,$t0 #sum=sum+A[i]
beq $t0,$zero,loop #if A[i] !=0, got to loop

#a ) s1<s3 i<n
#slt $s2,$s1,$s3 
# $t2, $zero,loop

#b) s1 <=S3 i<=n
#slt $t2,$s3,$s1
#  beq $t2, $zezo, loop

#c)sum >=0
#slt $t2,$s5,$zero
#beq $t2,$zero,loop