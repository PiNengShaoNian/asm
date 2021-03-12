assume cs:code

code segment

    mov ax,0f000H
    mov ds,ax
    mov bx,0
    mov ax,0

    mov cx,32
    s: cmp byte ptr[bx],32
    jb next
    cmp byte ptr[bx],128
    ja next
    inc ax

    next: inc bx
    loop s

code ends

end start