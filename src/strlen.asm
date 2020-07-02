BITS 64

%ifdef DEBUG
    %define __strlen__ _strlen
%else
    %define __strlen__ strlen
%endif

global __strlen__
section .text

__strlen__:
    push rcx
    xor rcx, rcx

_strlen_loop:
    cmp [rdi], byte 0
    jz _strlen_end

    inc rdi
    inc rcx
    
    jmp _strlen_loop

_strlen_end:
    mov rax, rcx

    pop rcx
    ret
