assume cs:codesg

codesg segment

    mov ax,0FFFFH
    mov ds,ax
    mov bx,0
    mov dx,0
    mov cx,8
  s:mov ah,0
    mov al,[bx]
    add dx,ax
    loop s

    mov ax,4c00H
    int 21H

codesg ends

end