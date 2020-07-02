BITS 64

%ifdef DEBUG
    %define __memset__ _memset
%else
    %define __memset__ memset
%endif

global __memset__
section .text

__memset__:
    cmp rdx, 0
    jz _memset_end

_memset_loop:
    dec rdx
    mov byte [rdi + rdx], sil

    cmp rdx, 0
    jz _memset_end

    jmp _memset_loop


_memset_end:
    mov rax, rdi

    ret
