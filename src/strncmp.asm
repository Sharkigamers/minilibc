BITS 64

%ifdef DEBUG
    %define __strncmp__ _strncmp
%else
    %define __strncmp__ strncmp
%endif

global __strncmp__
section .text

__strncmp__:
    cmp rdx, 0
    jz _strncmp_end
    
    dec rdx

_strncmp_loop:
    mov r8b, byte [rdi]
    mov r9b, byte [rsi]
    
    cmp rdx, 0
    jz _strncmp_end
    cmp r8b, byte 0
    jz _strncmp_end
    cmp r9b, byte 0
    jz _strncmp_end
    cmp r8b, r9b
    jnz _strncmp_end

    inc rdi
    inc rsi
    dec rdx
    
    jmp _strncmp_loop

_strncmp_end:
    movzx rax, byte [rdi]
    movzx rcx, byte [rsi]
    sub rax, rcx

    ret