.text

push:
    addi    $sp,    $sp,    -8  # -8 byte pointer cua stack (stack luu 2 gia tri)
    sw      $s0,    4($sp)      # push s0 vao stack
    sw      $s1,    0($sp)      # push s1 vao stack

work:
    nop     
    nop     
    nop     

pop:
    lw      $s0,    0($sp)      # lay gia tri tai dinh stack (s0) luu vao s0
    lw      $s1,    4($sp)      # tuong tu, lay gia tri tiep theo luu vao s1
    addi    $sp,    $sp,    8   # +8 byte vao pointer cua stack (clear stack)