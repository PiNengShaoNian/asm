assume cs:code

code segment

    sub1: push bx
    push cx
    push es
    mov bx,0B800H
    mov es,bx
    mov cx,2000
    mov bx,0

    sub1s: mov byte ptr es:[bx],' '
    add bx,2
    loop sub1s

    pop es
    pop cx
    pop bx
    ret

    sub2: push bx
    push cx
    push es
    mov bx,0B800H
    mov es,bx
    mov cx,2000
    mov bx,1

    sub2s: and byte ptr es:[bx],11111000B
    or es:[bx],al
    add bx,2
    loop sub2s

    pop es
    pop cx
    pop bx
    ret

    sub3: push bx
    push cx
    push es
    mov bx,0B800H
    mov es,bx
    mov cx,2000
    mov bx,1

    sub3s: and byte ptr es:[bx],10001111B
    or es:[bx],al
    add bx,2
    loop sub3s

    pop es
    pop cx
    pop bx
    ret

    start: jmp short set

    table dw sub1,sub2,sub3

    set: push bx
    
    cmp ah,3
    ja sret

    mov bl,ah
    mov bh,0
    add bx,bx

    call word ptr table[bx]

    sret: pop bx
    ret

code ends

end start