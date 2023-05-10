#laboratory exercise 2, assignment 1
.data #khai bao bien
X:.word 5
Y:.word -1
Z:.word 
#str: .asciiz "ABCD1234abcd"
.text
#4X+3Y-5
#addi $t1,$zero,5
#addi $t2,$zero,-1
#addi $t3,$zero,5

#mul $s0,$t1,4
#mul $s1, $t2,3
#add $s2,$s0,$s1
#sub $s3,$s2,$t3

#li $t1, 23
#li $t2, 3

#mul $s0,$t1,$t2
#mul $s0,$s0,3
#mflo  $s1
#mfhi $s2
#div $t1,$t2 #phep chia lo kq hi du

la $t8,X
la $t9,Y
lw $t6,12($t8)
lw $t1,0($t8)
lw $t2,0($t9)

add $s0,$t1,$t1
add $s0,$s0,$t2

la $t7,Z
sw $s0,0($t7)

