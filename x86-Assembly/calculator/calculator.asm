; calculator.asm
extern printf

section .data
    number1     dq  100
    number2     dq  10
    neg_number  dq  -12
    
    fmt         db  "The number are %ld and %ld",10,0
    fmtint      db  "%s %ld",10,0
    sumi        db  "The sum is",10,0
    difi        db  "the difference is",10,0
    inci        db  "NUmber 1 incremented:",0
    deci        db  "NUmber 1 decremented:",0 
    sali        db  "NUmber 1 shift left 2 (x4) : ",0
    sari        db  "NUmber 1 shift right 2 (/4) : ",0
    sariex      db  "NUmber 1 shift right 2 (/4) with signed expression: ",0
    multi       db  "the product is",0
    divi        db  "the integer quotient is ",0
    remi        db  "the modulo is ",0
        
section .bss    
    resulti resq    1
    modulo  resq    1
section .text
    global main
main:
    push    rbp
    mov     rbp, rsp
    
    ;display the numbers
    mov     rdi, fmt
    mov     rsi, [number1]
    mov     rdx, [number2]
    mov     rax, 0
    call    printf
    
    ;Adding--------------
    mov     rax, [number1]
    add     rax, [number2]
    mov     [resulti], rax
    
    ;Displaying the result
    mov     rdi, fmtint
    mov     rsi, sumi
    mov     rdx, [resulti]
    mov     rax, 0
    call    printf
    
    ;Subtracting-----------
    mov     rax, [number1]
    sub     rax, [number2]
    mov     [resulti], rax
    
    ;Displaying the result
    mov     rdi, fmtint
    mov     rsi, difi
    mov     rdx, [resulti]
    mov     rax, 0
    call    printf
    
    ;Incrementing
    mov     rax, [number1]
    inc     rax
    mov     [resulti], rax
    
    ;displaying the result
    mov     rdi, fmt
    mov     rsi, inci
    mov     rdx, [resulti]
    mov     rax, 0
    call    printf
    
    ;Decrementing....
    mov     rax, [number1]
    dec     rax
    mov     [resulti], rax
    
    ;Displaying the result
    mov     rdi, fmt
    mov     rsi, deci
    mov     rdx, [resulti]
    mov     rax, 0
    call    printf
    
    ;shift arithmetic left
    mov     rax, [number1]
    sal     rax, 2
    mov     [resulti], rax
    ;Display the result
    mov     rdi, fmtint
    mov     rsi, sali
    mov     rdx, [resulti]
    mov     rax, 0
    call    printf
    
    ;Shift arithmetic right
    
    mov     rax, [number1]
    sar     rax, 2
    mov     [resulti],rax
    ;Display the result
    mov     rdi, fmtint
    mov     rsi, sari
    mov     rdx, [resulti]
    mov     rax, 0 
    call    printf
    
    ;Shift arithmetic right with sign extension
    mov     rax, [neg_number]  
    sar     rax, 2
    mov     [resulti], rax
    ;Display the result
    mov     rdi, fmtint 
    mov     rsi, sariex
    mov     rdx, [resulti]
    mov     rax, 0
    call    printf
    
    ;Multiply
    mov     rax, [number1]
    imul    qword[number2]
    mov     [resulti],rax
    ;Display the result
    mov     rdi, fmtint
    mov     rsi, multi
    mov     rdx, [resulti]
    mov     rax, 0
    call    printf
    
    ;Divide
    mov     rax, [number1]
    mov     rdx, 0
    idiv    qword[number2]
    mov     [resulti],rax
    mov     [modulo],rdx
    ;Display the quotient
    mov     rdi,fmtint
    mov     rsi,divi
    mov     rdx, [resulti]
    mov     rax, 0
    call    printf
    
    ;Display the remainder
    mov     rdi, fmtint
    mov     rsi, remi
    mov     rdx, [modulo]
    mov     rax, 0
    call    printf
    
    mov     rsp, rbp
    pop     rbp
    ret
    
    
    
    
    
    
    
    
         
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    