BITS 64

%ifdef DEBUG
    %define __strcmp__ _strcmp
%else
    %define __strcmp__ strcmp
%endif

global __strcmp__
section .text

__strcmp__:
    mov r8b, byte [rdi]
    mov r9b, byte [rsi]
    
    cmp r8b, byte 0
    jz _strcmp_end
    cmp r9b, byte 0
    jz _strcmp_end
    cmp r8b, r9b
    jnz _strcmp_end

    inc rdi
    inc rsi
    
    jmp __strcmp__

_strcmp_end:
    movzx rax, r8b
    movzx rcx, r9b
    sub rax, rcx

    ret
