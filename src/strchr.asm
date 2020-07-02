BITS 64

%ifdef DEBUG
    %define __strchr__ _strchr
%else
    %define __strchr__ strchr
%endif

global __strchr__
section .text

__strchr__:
    xor rax, rax

_strchr_loop:
    cmp byte [rdi], sil
    jz _strchr_end

    cmp [rdi], byte 0
    jz _strchr_special_end

    inc rdi

    jmp _strchr_loop

_strchr_special_end:
    xor rdi, rdi

    jmp _strchr_end

_strchr_end:
    xor rax, rax
    mov rax, rdi

    ret
