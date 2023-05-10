.data
A : .word -5,1,2,4
Aend: .word
.text
     la $a0,A
     la $a1,Aend
     li $s0,0         #count = 0 (count la bien dem phan tu)
     li $s1,-1         # i = -1
     
 Demphantu: 
 beq $a1,$a0,Size   #so sanh dia chi hien tai voi dia chi co so cua mang A
 addi $a1,$a1,-4      #dia chi a1 giam de den tung dia chi cua tung phan tu mang
 addi $s0,$s0,1       #so luong phan tu tang len 1
 j Demphantu
 
 Size:
  addi $t0,$s0,-1   #t0=so luong phan tu mang A tru 1
  
 loop1:
  addi $s1,$s1,1   # i++
  li $s2,0          #j=0 trong loop2
 beq $s1,$t0, exit  
    
 loop2:     
 sub $t2,$t0,$s1
 beq $s2,$t2,loop1
 
 if_swap:
 sll $t3,$s2,2    #tinh offset cua dia chi A[j]
 add $s3,$a0,$t3  #tinh dia chi A[j]
 lw $v0,0($s3)     #load gtri A[j]
 addi $s3,$s3,4   #tinh gia tri A[j+1]
lw $v1,0($s3) 
sle $t4,$v0,$v1      #neu A[j] < A[j+1] thi t4=1
beq $t4, $zero, swap    
addi $s2,$s2,1        #j++
j loop2

swap: 
sw $v0,0($s3)       #ghi A[j] vao A[j+1]
addi $s3,$s3,-4      #tinh dia chi A[j]
sw $v1, 0($s3)       #ghi A[j+1] vao A[j]
addi $s2,$2,1       #j++
j loop2

exit:
li $v0,10
syscall


            


