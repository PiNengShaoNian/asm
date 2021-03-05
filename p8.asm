assume cs:codesg

codesg segment

    mov dx,0
    mov cx,12
    mov bx,0

    s: mov ax,0FFFFH
    mov ds,ax
    mov dl,ds:[bx]

    mov ax,0200H
    mov ds, ax
    mov ds:[bx],dl
    inc bx

    loop s

    mov ax,4c00H
    int 21H

codesg ends

end