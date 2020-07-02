BITS 64

%ifdef DEBUG
    %define __memcpy__ _memcpy
%else
    %define __memcpy__ memcpy
%endif

global __memcpy__
section .text

__memcpy__:
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