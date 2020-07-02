BITS 64

%ifdef DEBUG
    %define __memmove__ _memmove
%else
    %define __memmove__ memmove
%endif

global __memmove__
section .text

__memmove__:
    cmp rdi, rsi
    jg _memcpy

    mov rcx, rdx
    rep movsb
    
    ret

_memcpy:
    cmp rdx, 0
    jz _memcpy_end

_memcpy_loop:
    dec rdx

    mov r10b, byte [rsi + rdx]
    mov byte [rdi + rdx], r10b

    cmp rdx, 0
    jz _memcpy_end

    jmp _memcpy_loop

_memcpy_end:
    mov rax, rdi

    ret