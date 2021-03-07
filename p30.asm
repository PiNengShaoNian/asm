assume cs:code

code segment

    start: mov ax,2000H
    mov ds,ax
    mov bx,0
    mov cx,0
    s: mov cl,[bx]
    inc bx
    jcxz ok
    jmp short s
    
    ok: mov dx,bx
    mov ax,4c00H
    int 21H

code ends

end start