extern printf

section .data
    num     dq  50000000                   ;8 bytes quadword
    fmt     db  "The sum from 0 to %ld is %ld",10,0
    
section .bss
    
section .text
    global main
main:
    push    rbp
    mov     rbp, rsp
    
    mov     rcx, [num]
    mov     rax, 0
    
bloop:  
    add     rax, rcx
    loop    bloop
    mov     rdi, fmt
    mov     rsi, [num]
    mov     rdx, rax
    mov     rax, 0
    
    
    call    printf
    
    mov     rsp, rbp
    pop     rbp
    ret
    