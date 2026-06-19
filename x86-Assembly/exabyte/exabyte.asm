;exabyte.asm
section .data
    bNum    db  123
    wNum    dw  12345
    warray  times   5   dw  0
    dNum    dd  12345
    dNum1   dq  12345
    text1   db  "abc",0
    qNum2   dq  3.141592654
    text2   db  "cde",0
    
section .bss
    bvar    resb    1
    dvar    resd    1
    wvar    resw    10
    qvar    resq    3
    
section .text
    global main
main:
    push    rbp             ; Push the value of RBP onto the stack
    mov     rbp, rsp        ; Move the value of RSP int RBP
    lea     rax, [bNum]     ; Load the memory adress of bNum into RAX
    mov     rax, bNum       ; Load the value stored at bNum into RAX
    mov     rax, [bNum]     ; Load the value stored at the memory address stored in bNum into RAX
    mov     [bvar], rax     ; Store the value in RAX at the memory address of BVAR
    lea     rax, [bvar]     ; Load the memory address of BVAR into RAX
    lea     rax, [wNum]     ; Load the memory address of wNum into RAX
    mov     rax, [wNum]     ; Load the value stored in wNum into RAX
    lea     rax, [text1]    ; Load the memory address of TEXT1 into RAX
    mov     rax, text1      ; Load the memory address of TEXT1 into RAX
    mov     rax, text1+1    ; Load the value at the second character of TEXT1 into RAX
    lea     rax, [text1+1]  ; Load the memory address of the second character of TEXT1 into RAX
    mov     rax, [text1]    ; Load the value stored at the memory address of TEXT1 into RAX
    mov     rax, [text1+1]  ; Load the value stored at the memory address of TEXT1+1 into RAX
    mov     rsp, rbp        ; Restore the value of RSP from RBP (clean up the stack frame)
    pop     rbp             ; Pop the value of rbp from the stack
    ret                     ; RETURN FROM THE FUNCTION    