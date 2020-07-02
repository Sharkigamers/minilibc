BITS 64

%ifdef DEBUG
    %define __strcspn__ _strcspn
%else
    %define __strcspn__ strcspn
%endif

global __strcspn__
section .text

__strcspn__:
    push rbp
    mov rbp, rsp
    push r8
    xor r8, r8

    xor rax, rax

    jmp _strcspn_loop

_strcspn_loop:
    cmp byte [rdi], byte 0
    jz _strcspn_end

    mov r8, rsi

    jmp _strcspn_check

_strcspn_check:
    mov r10b, [rdi]

    cmp [r8], byte 0
    jz _strcspn_continue
    
    cmp r10b, [r8]
    jz _strcspn_end
    
    inc r8
    
    jmp _strcspn_check

_strcspn_continue:
    inc rdi
    inc rax
    
    jmp _strcspn_loop

_strcspn_end:
    mov rsp, rbp
    pop rbp
    
    ret