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
    jg @A_GT_B
    je @A_EQ_B
    @A_LT_B:
    mov ax, 64
    idiv bx
    mov cx, [a]
    cmp cx, 0
    jg @A_GT_0
    @A_LT_0:
    neg cx
    add eax, ecx
    jmp @AFTER_IF
    @A_GT_0:
    sub ax, cx
    jmp @AFTER_IF
    @A_EQ_B:
    mov ax, 88
    jmp @AFTER_IF
    @A_GT_B:
    mov cx, 99
    sub ax, cx
    idiv bx
    cwde
    @AFTER_IF:
    mov [result], eax
    ret
