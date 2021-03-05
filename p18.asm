assume cs:code,ss:stack

dataA segment

    db 1,1,1,1,1,1,1,1

dataA ends

dataB segment

    db 2,2,2,2,2,2,2,2

dataB ends

dataC segment

    db 0,0,0,0,0,0,0,0

dataC ends

stack segment
    dw 0000H
stack ends

code segment

    start: mov ax,dataA
    mov ds,ax
    mov ax,dataB
    mov es,ax
    mov bx,0
    mov cx,8
    mov ax,stack
    mov ss,ax
    mov sp,2 

    s: mov dl,[bx]
    add dl,es:[bx]
    push ds
    mov ax,dataC
    mov ds,ax
    mov [bx],dl
    pop ds 
    add bx,2
    loop s

code ends

end start