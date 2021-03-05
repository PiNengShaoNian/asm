assume cs:codesg

codesg segment
    mov ax,0FFFFH
    mov ds,ax
    mov ah,0
    mov bx,66H
    mov al,[06H]
    mov dx,0
    mov cx,3
    s: add dx,ax
    loop s
    mov ax,4c00H
    int 21H
codesg ends

end