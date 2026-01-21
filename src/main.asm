extern strlen
extern sys_write
extern prints
extern printc

section .data
prompt: db "> ", 0
newline: db 10, 0

section .text

global main

; arguments:
; rdi = argc
; rsi = argv (char**)
main:
    mov r10, 0
    .loop:
        cmp r10, rdi
        je .end
        push r10
        push rdi
        push rsi
        mov rdi, [rsi + 8 * r10]
        call prints
        mov rdi, 10
        call printc
        pop rsi
        pop rdi
        pop r10
        inc r10
        jmp .loop
    .end:
        ret
