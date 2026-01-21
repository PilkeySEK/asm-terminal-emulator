; https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/#x86_64-64-bit

global sys_write
global sys_read

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

; arguments:
; rdi: file descriptor
; rsi: buf (char*)
; rdx: count (buf length)
sys_read:
    xor rax, rax ; set rax to 0
    syscall
    ret