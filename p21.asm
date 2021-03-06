assume cs:code

data segment
    db 'HELLO'
    db 'hello'
data ends

code segment

    start: mov bx,0
    mov ax,data
    mov ds,ax

    mov cx,5

s:  mov al,[bx]
    or al,00100000B
    mov [bx],al
    mov al,[bx + 5]
    and al,11011111B
    mov [bx + 5],al
    inc bx
    loop s

    mov ax,4c00H
    int 21H
code ends

end start