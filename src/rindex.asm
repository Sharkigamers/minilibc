BITS 64

%ifdef DEBUG
    %define __rindex__ _rindex
%else
    %define __rindex__ rindex
%endif

global __rindex__
section .text

__rindex__:
    xor rax, rax

_rindex_loop:
    cmp sil, byte [rdi]
    cmove rax, rdi

    cmp [rdi], byte 0
    jz _rindex_end

    inc rdi

    jmp _rindex_loop

_rindex_end:
    ret