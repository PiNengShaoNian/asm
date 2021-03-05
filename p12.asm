assume cs:codesg

codesg segment

    dw 0h,1h,2h,3h,4h,5h,6h,7h
start: mov ax,0
    mov ds,ax
    mov bx,0
    mov cx,8

    s: mov ax,ds:[bx]
    mov cs:[bx],ax
    add bx,2
    loop s

    mov ax,4c00H
    int 21H

codesg ends

end start