;%include "io.inc"
; (22/c+3*b)/(36-a*c/3)
section .data
    extern a, b, c, divisible, divider, result
    
section .text
global asm_func
asm_func:
 ;   mov rbp, rsp; for correct debugging
 
    movsx bx, [b]
    mov cl, [c]
    mov ax, 22
    idiv cl         ; al = 22 / c
    cbw
    imul dx, bx, 3  ; dx = 3 * b
    add dx, ax      ; dx = 22/c + 3*b - divisible
    mov [divisible], dx
    
    mov al, cl
    cbw             ; ax = c
    movsx cx, [a]
    imul cx         ; dx:ax = a * c

    mov bx, 3
    idiv bx         ; ax = a * c / 3
    mov cx, 36
    sub cx, ax      ; cx = 36 - a * c / 3 - divider
    mov [divider], cx
    
    mov ax, [divisible]
    cwd
    idiv cx         ; ax = result
    mov [result], ax
    ret