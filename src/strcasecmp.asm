BITS 64

%ifdef DEBUG
    %define __strcasecmp__ _strcasecmp
%else
    %define __strcasecmp__ strcasecmp
%endif

global __strcasecmp__
section .text

__strcasecmp__:
    mov r8b, byte [rdi]
    mov r9b, byte [rsi]

    inc rdi
    inc rsi

    cmp r8b, byte 0
    jz _strcasecmp_end
    cmp r9b, byte 0
    jz _strcasecmp_end
    cmp r8b, r9b
    jnz _strcasecmp_compare_first

    jmp __strcasecmp__

_strcasecmp_compare_first:
    cmp r8b, 0x41
    jl _strcasecmp_compare_second
    cmp r8b, 0x5A
    jg _strcasecmp_compare_second

    add r8b, 32
    
    jmp _strcasecmp_compare_second

_strcasecmp_compare_second:
    cmp r9b, 0x41
    jl _strcasecmp_lower_compare
    cmp r9b, 0x5A
    jg _strcasecmp_lower_compare

    add r9b, 32
    
    jmp _strcasecmp_lower_compare

_strcasecmp_lower_compare:
    cmp r8b, r9b
    jnz _strcasecmp_end
    
    jmp __strcasecmp__

_strcasecmp_end:
    movzx rax, r8b
    movzx rcx, r9b
    sub rax, rcx

    ret