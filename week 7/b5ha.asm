# s0: max
# s1: index c?a max
# s2: gia tri pop
# s3: min
# s4: index c?a min

.text
    li      $s0,    5
    li      $s1,    -3
    li      $s2,    9
    li      $s3,    2
    li      $s4,    0
    li      $s5,    1
    li      $s6,    -5
    li      $s7,    3

push:
    add     $sp,    $sp,        -32
    sw      $s0,    28($sp)
    sw      $s1,    24($sp)
    sw      $s2,    20($sp)
    sw      $s3,    16($sp)
    sw      $s4,    12($sp)
    sw      $s5,    8($sp)
    sw      $s6,    4($sp)
    sw      $s7,    0($sp)

find:
    lw      $s0,    0($sp)
    add     $s1,    $zero,      0
    lw      $s3,    0($sp)
    add     $s4,    $zero,      0
    add     $t0,    $t0,        8

loop:
    lw      $s2,    0($sp)
    slt     $t1,    $s0,        $s2
    beq     $t1,    $zero,      max
    move    $s0,    $s2
    move    $s1,    $t0

max:
    slt     $t1,    $s2,        $s3
    beq     $t1,    $zero,      min
    move    $s3,    $s2
    move    $s4,    $t0

min:
    add     $t0,    $t0,        -1
    add     $sp,    $sp,        4
    bne     $t0,    0,          loop
    li      $v0,    10
    syscall