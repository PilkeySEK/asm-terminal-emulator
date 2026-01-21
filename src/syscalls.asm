global sys_write

; arguments:
; rdx: file descriptor
; rsi: length
; rdi: pointer to string
sys_write:
    ; mov rdx (arg3) into rcx because we are modifying it later
    mov rcx, rdx
    mov rdx, rsi
    mov rsi, rdi
    ; restore arg3 into rdi
    mov rdi, rcx
    mov rax, 1
    syscall
    ret
