extern sys_write
extern strlen

global prints
global printc

; arguments:
; rdi: pointer to string
; rsi: length
print:
    mov rdx, 1
    call sys_write
    ret

; print a null-terminated string
; arguments:
; rdi: pointer to string
prints:
    call strlen
    mov rsi, rax
    call print
    ret

; print a single char
; arguments:
; rdi: the char
printc:
    push rdi
    mov rdi, rsp
    mov rsi, 1
    call print
    pop rdi
    ret