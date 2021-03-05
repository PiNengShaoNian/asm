assume cs:codesg

codesg segment

    mov ax,cs
    mov ds,ax
    mov ax,0200H
    mov es,ax
    mov al,0
    mov cx,17H
    mov bx,0

    s: mov al,ds:[bx]
    mov es:[bx],al
    inc bx
    loop s

    mov ax,4c00H
    int 21H

codesg ends

end