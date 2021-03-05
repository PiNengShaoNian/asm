assume cs:codesg

codesg segment

    dw 1,2,3,4,5,6,7,8
    dw 0,0,0,0,0,0,0,0,0,0
    start: mov ax,0
    mov ds,ax
    mov ss,cs
    mov sp,25h
    mov cx,8
    mov bx,0

    s: mov ax,ds:[bx]
    push ax
    add bx,2
    loop s

    mov ax,4c00H
    int 21H

codesg ends

end start