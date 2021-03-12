assume cs:code

code segment

    start: mov ax,0f000H
    mov ds,ax
    mov bx,0
    mov ax,0
    mov cx,32

    s: cmp byte ptr[bx],32
    ja condition2
    jmp next
    condition2: cmp byte ptr[bx],128
    jb qualified
    jmp next
    qualified: inc ax
    next: inc bx
    loop s


code ends

end start