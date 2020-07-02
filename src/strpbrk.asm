BITS 64

%ifdef DEBUG
    %define __strpbrk__ _strpbrk
%else
    %define __strpbrk__ strpbrk
%endif

global __strpbrk__
section .text

__strpbrk__:
    push rbp
    mov rbp, rsp
    push r8
    xor r8, r8

    xor rax, rax

    cmp [rsi], byte 0
    jz _strpbrk_special_exit
    
    jmp _strpbrk_loop

_strpbrk_loop:
    cmp byte [rdi], byte 0
    jz _strpbrk_special_exit

    mov r8, rsi

    jmp _strpbrk_check

_strpbrk_check:
    mov r10b, [rdi]
    cmp [r8], byte 0
    
    jz _strpbrk_continue
    cmp r10b, [r8]
    
    jz _strpbrk_end
    inc r8
    
    jmp _strpbrk_check

_strpbrk_continue:
    inc rdi
    
    jmp _strpbrk_loop

_strpbrk_special_exit:
    xor rdi, rdi
    
    jmp _strpbrk_end

_strpbrk_end:
    mov rax, rdi
    mov rsp, rbp
    
    pop rbp
    
    ret