;jumping.asm - Exploring conditional jump....
extern printf               ;declare the external function printf
section .data
    number1 dq 44
    number2 dq 43
    fmt1    db  "Number1 >= Number2",10,0       ;format string for comparison
    fmt2    db  "Number1 <= Number2",10,0        ;format string for comparison
section .text
global main
main:
    push    rbp                     ;function prologue
    mov     rbp, rsp                ;function prologue
    mov     rax, [number1]
    mov     rbx, [number2]
    cmp     rax, rbx                ;comparing the values in rax and rbx
    jge     greater                 ;jumping to greater in rax >= rbx
    mov     rdi, fmt2               ;loading the format string for second message
    mov     rax, 0                  ;clearing the rax
    call    printf                  ;call printf to display Number1 <= Number2
    jmp     exit
greater:
    mov     rdi, fmt1               ;loading the format string for first message
    mov     rax, 0
    call    printf                  ;call printf to display Number1 >= Number2
exit:
    mov     rsp, rbp                ;function epilogue
    pop     rbp
    ret
    