assume cs:codesg

codesg segment

    mov ax,0200H
    mov ds,ax
    mov bx,0
    mov cx,64

    s: mov ds:[bx],bx
    inc bx
    loop s

    mov ax,4c00H
    int 21H

codesg ends

end