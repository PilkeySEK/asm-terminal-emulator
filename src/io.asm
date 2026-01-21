extern sys_write
extern strlen
extern sys_read

global prints
global printc
global reads

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

; read chars stdin
; arguments:
; rdi: buffer (char*)
; rsi: buffer size
reads:
    mov rdx, rsi
    mov rsi, rdi
    mov rdi, 0 ; 0 = stdin
    call sys_read
    ret
