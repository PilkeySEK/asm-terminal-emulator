extern main
extern prints
extern printc

section .text
global _start
_start:
    xor rbp, rbp
    
    ; get argc
    mov rdi, [rsp]
    ; rsp+8 is argv i think
    mov rsi, rsp
    add rsi, 8
    call main
    ; exit code 0
    mov rdi, 0
    call exit

exit:
    ; arg1 is expected to be in rdi already
    ; 60 = exit
    mov rax, 60
    syscall