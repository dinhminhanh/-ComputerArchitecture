.data
	A: .word 4, -5,2,10
	Aend: .word
.text
	la $a0, A
	la $a1, Aend
	li $s0, 0	# count = 0 (count la bien dem phan tu)	
	li $s1, 0	# key = 0
	li $s2, 0	# j = 0	
	li $s3, 1	# i = 1
DemPhanTu:	beq  $a1, $a0, Loop	# So sanh dia chi hien tai trong a1 voi dia chi co so cua mang A
		addi $a1, $a1, -4	# Dia chi a1 giam de den tung dia chi cua tung phan  tu trong mang
		addi $s0, $s0, 1         #So luong phan tu tang len 1
		j DemPhanTu
Loop:	beq $s3, $s0, Exit	# Neu i=so luong phan tu trong mang thi thoat
	sll $t0, $s3, 2		# Tính Offset cua dia chi A[i]
	add $s4, $a0, $t0	# Tính dia chi A[i]
	lw $s1, 0($s4)		# Load gia tri A[i] = key
	addi $s2, $s3, -1	# j = i - 1
While: 	slt $t1, $s2, $zero	# Neu j >= 0 thi t1 = 0 
	sll $t0, $s2, 2		# Tính offset cua dia chi A[j]
	add $s5, $a0, $t0	# Tính dia chi cua A[j]
	lw $t3, 0($s5)		# Load gia tri A[j] = t3
	sle $t4, $s1, $t3	# Neu key >= t3 thi t4 = 0
	add $t1, $t1, $t4	
	bne $t1, $zero,  loop_continue # Neu t1 = 0 thi chuyen while
	addi $s5, $s5, 4		# Tính dia chi cua A[j+1]
	sw $t3, 0($s5)		# Ghi gia tri A[j] vào A[j+1]
	addi $s2, $s2, -1	# j = j - 1
	j While			
loop_continue:
	addi $s5, $s5, 4		# Tính dia chi cua A[j+1]
	sw $s1, 0($s5)		# Ghi gia tri  key vào A[j+1]
	addi $s3, $s3, 1		# i++
	j Loop
Exit: 	li $v0, 10
	syscall
 syscall
















