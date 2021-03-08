assume cs:code

code segment

    start: mov ax,0
    call far ptr s
    inc ax
    s: pop ax
    add ax,ax
    pop bx
    add ax,bx

    mov ax,4c00H
    int 21H

code ends

end start