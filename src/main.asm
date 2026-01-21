extern strlen
extern sys_write
extern prints
extern printc
extern reads

section .data
prompt: db "> ", 0
newline: db 10, 0

section .text

global main

; arguments:
; rdi = argc
; rsi = argv (char**)
main:
    mov rdi, prompt
    call prints
    sub rsp, 16 ; we only read 1 byte but the stack must be aligned 16 bytes at function calls (or so it seems)
    mov rdi, rsp
    push rdi
    mov rsi, 15
    call reads
    pop rdi
    mov byte [rdi + 15], 0
    call prints
    add rsp, 16

    mov rdi, 10
    call printc
    ret

; may be used in the future
print_args:
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