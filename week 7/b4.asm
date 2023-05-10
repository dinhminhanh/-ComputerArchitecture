.data
Message: .asciiz "Ket qua tinh giai thua la: "
.text
main:
    jal     WARP
print:
    add     $a1,    $v0,        $zero           # $a0 = result from N!
    li      $v0,    56
    la      $a0,    Message
    syscall 

quit:
    li      $v0,    10                          # terminate
    syscall 
endmain:
WARP:
    sw      $fp,    -4($sp)                     # l?u giá tr? c?a frame pointer vào stack
    addi    $fp,    $sp, 0               # thi?t l?p frame pointer m?i ?? tr? ??n ??nh stack
    addi    $sp,    $sp, -8              # gi?m giá tr? c?a stack pointer 8 bytes
    sw      $ra,    0($sp)                      # l?u giá tr? c?a ra vào stack
    li      $a0,    7                           # gán giá tr? test cho bi?n  $a0(N=7)
    jal     FACT                                # jump and link t?i hàm tính giai th?a
    nop     
    lw      $ra,    0($sp)                      # khôi ph?c l?i giá tr? c?a ra t? stack
    addi    $sp,    $fp,  0               # khôi ph?c l?i stack pointer
    lw      $fp,    -4($sp)                     # load gía tr? c?a frame pointer
    jr      $ra
wrap_end:

FACT:
    sw      $fp,    -4($sp)                     # l?u l?i frame pointer
    addi    $fp,    $sp,        0               # thay ??i giá tr? c?a thanh ghi frame pointer tr? ??n ??nh stack hi?n t?i
    addi    $sp,    $sp,  -12             # -12 bytes ?? c?p phát không gian l?u tham s?
    sw      $ra,    4($sp)                      # l?u l?i gia tr? ra
    sw      $a0,    0($sp)                      # l?u a0 vào stack

    slti    $t0,    $a0,        2               # ki?m tra xem N có nh? h?n 2 không
    beq     $t0,    $zero,      recursive       # n?u N >= 2 thì ?? quy
    nop     
    li      $v0,    1                           # tr? v? 1 khi N = 1
    j       done
    nop     
recursive:
    addi    $a0,    $a0, -1              # N -= 1
    jal     FACT                                # g?i ?? quy ??n FACT
    nop     
    lw      $v1,    0($sp)                      # load a0
    mult    $v1,    $v0                         # compute the result
    mflo    $v0
done:
    lw      $ra,    4($sp)                      # l?y giá tr? ra t? stack và khôi ph?c vào ra
    lw      $a0,    0($sp)                      # l?y giá tr? a0 t? stack và l?u vào a0
    addi    $sp,    $fp, 0               # t??ng t?, khôi ph?c fp
    lw      $fp,    -4($sp)
    jr $ra                                 #jump to calling
  fact_end: