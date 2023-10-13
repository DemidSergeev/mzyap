;%include "io.inc"
; (22/c+3*b)/(36-a*c/3)
section .data
    extern a, b, c, divisible, divider, result
    
section .text
global asm_func
asm_func:
   ; mov rbp, rsp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov cx, [c]
    mov ax, 22
    div cx          ; ax = 22 / c, dx = remainder
    xor dx, dx      ; clear remainder
    mov bx, ax      ; bx = 22 / c
    mov ax, [b]
    mov cx, 3
    mul cx          ; dx:ax = b * 3
    add ax, bx      ; bx = low part of divisible
    adc dx, 0       ; dx:ax = 22 / c + b * 3 - divisible
    shl edx, 16
    add eax, edx
    mov [divisible], eax
    
    ; (22/c+3*b)/(36-a*c/3)
    mov ax, [a]
    mov cx, [c]
    mul cx          ; dx:ax = a*c
    mov bx, ax
    mov ax, dx      ; ax - старшая часть, bx - младшая
    xor dx, dx      
    mov cx, 3
    div cx          ; делим старшую часть
    shl edx, 16     ; 
    add edx, ebx      ; edx = младшая часть + остаток от старшей
    mov bx, ax      ; bx - частное от старшей

    mov eax, edx
    xor edx, edx
    div ecx          ; ax - частное от младшей
    shl ebx, 16
    add eax, ebx    ; eax = a * c / 3
    mov ebx, 36
    sub ebx, eax

    mov [divider], ebx  
    mov eax, [divisible]
    xor dx, dx      ; в dx до этого мог оставаться 
                    ; остаток от деления младшей части
    idiv ebx        ; eax = result
    mov [result], eax
    ret