assume cs:code,ds:data,ss:stack

data segment
    dw 1,2
data ends

stack segment
    
    dw 0,0

stack ends

code segment

start:    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,5

    push ds:[0]
    push ds:[2]

    pop ds:[2]
    pop ds:[0]

    mov ax,4c00H
    int 21H

code ends

end start