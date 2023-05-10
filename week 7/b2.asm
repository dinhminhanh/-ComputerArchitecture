.text
main:
    li      $a0,    2               # load gia tri dau vao
    li      $a1,    6
    li      $a2,    9
    jal     max                     # jump and link toi ham max
    nop     
    add 	$s0, $v0, $zero
     li 	$v0, 10 	#terminate 
	syscall

endmain:

max:
    add     $v0,    $a0,    $zero   # gan v0 = a0 (v0 la gia tri lon nhat hien tai)
    sub     $t0,    $a1,    $v0     # t0 = a1 - v0
    bltz    $t0,    okay            # neu a1 - v0 < 0 -> jump and link den okey
    nop     
    add     $v0,    $a1,    $zero   # neu a1 - v0 >= 0 thi gan v0 = a1 (a1 la gia tri lon nhat hien tai)

okay:
    sub     $t0,    $a2,    $v0     # tinh a2 - v0, luu vao t0
    bltz    $t0,    done            # neu a2 - v0 < 0 (tuc la a2 khong phai max) thi ket thuc ham
    nop     
    add     $v0,    $a2,    $zero   # neu a2 - v0 >= 0 (a2 la max) thi gan v0 = a2

done:
    jr      $ra                     # return to calling program

