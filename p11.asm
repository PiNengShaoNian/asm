assume cs:codesg

codesg segment

    dw 0,1,2,3,4,5,6,7
    start: mov bx,0
    mov ax,cs
    mov ds,ax
    mov dx,0
    mov cx,8
    mov ah,0

    s: mov al,ds:[bx + 40H]
    add dx,ax
    add bx,2

    loop s

    mov ax,4c00H
    int 21H

codesg ends

end start