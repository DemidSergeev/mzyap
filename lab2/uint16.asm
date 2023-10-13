section .data
    extern a, b, result
section .text
global asm_func
asm_func:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov ax, [a]
    mov bx, [b]
    cmp ax, bx
    ja @A_GT_B
    je @A_EQ_B
    @A_LT_B:
    mov eax, 64
    div bx
    mov cx, [a]
    sub eax, ecx
    jmp @AFTER_IF
    @A_EQ_B:
    mov ax, 88
    jmp @AFTER_IF
    @A_GT_B:
    mov cx, 99
    sub ax, cx
    div bx
    @AFTER_IF:
    mov [result], eax
    ret