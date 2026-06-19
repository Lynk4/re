;move.asm
section .data
    bNum    db 123
    wNum    dw 12345
    dNum    dd 1234567890
    qNum1   dq 1234567890123456789
    qNum2   dq 123456
    qNum3   dq 3.14

section .bss

section .text
    global main
    
main:
    push    rbp 
    mov     rbp, rsp
    mov     rax, -1             ;fil rax with 1s
    mov     al, byte [bNum]     ;does not clear upper bits of rax
    xor     rax, rax            ;clears the rax
    mov     al, byte [bNum]     ;now rax has correct value
    
    mov     rax, -1             ;fil rax with 1s
    mov     ax, word [wNum]     ;does not clear upper bits of rax
    xor     rax, rax            ;clears the rax
    mov     ax, word [wNum]     ;now rax has correct value
    
    mov     rax, -1             ;fil rax with 1s
    mov     rax, qword [qNum1]  ;does clear upper bits of rax
    mov     qword [qNum2], rax  ; one operands always a registers
    mov     rax, 123456         ;source operands an immediare value
    
    movsd     xmm0, [qNum3]       ;instruction for floating point
    
    mov     rsp, rbp
    pop     rbp
    
    ret
    

    
    
    
    