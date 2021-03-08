assume cs:code

code segment

    start: mov ax,2000H
    mov ds,ax
    mov bx,0

    s: mov cl,[bx]
    mov ch,0
    add cl,1
    inc bx
    loop s

    mov ax,4c00H
    int 21H

code ends

end start