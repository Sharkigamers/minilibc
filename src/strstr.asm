BITS 64

%ifdef DEBUG
    %define __strstr__ _strstr
%else
    %define __strstr__ strstr
%endif

global __strstr__
section .text

__strstr__:
    push rcx

    xor rcx, rcx
    xor rax, rax

    cmp [rdi], byte 0
    cmp [rsi], byte 0
    jz _strstr_end

_strstr_loop:
    mov r8b, byte [rdi]
    mov r9b, byte [rsi + rcx]

    cmp r9b, byte 0
    jz _strstr_end
    cmp r8b, byte 0
    jz _strchr_special_end

    inc rdi

    cmp r8b, r9b
    jz  _strstr_found

    sub rdi, rcx
    xor rcx, rcx

    jmp _strstr_loop

_strstr_found:
    inc rcx
    jmp _strstr_loop

_strchr_special_end:
    xor rdi, rdi
    xor rcx, rcx

_strstr_end:
    sub rdi, rcx
    mov rax, rdi

    pop rcx

    ret
