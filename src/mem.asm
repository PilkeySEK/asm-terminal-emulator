global memset

; arguments:
; rdi - start address
; rsi - number of bytes to write
; rdx - byte to set (only lower 8 bits are considered)
memset:
    mov r8, 0
    .loop:
        mov [r8 + rdi], dl
        inc r8
        cmp r8, rsi
        je .end
        jmp .loop
    .end:
        ret
