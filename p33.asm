assume cs:code,ds:data

data segment
    db 'welcome to masm!'
data ends

code segment

    start: mov ax,0b800H
    mov ds,ax
    mov ax,data
    mov es,ax
    mov bx,0
    mov cx,16
    mov si,0
    mov bx,708H

    s: mov al,es:[si]
    mov ds:[bx],al
    inc bx
    mov byte ptr [bx],00000010B
    inc bx
    inc si
    loop s

    mov ax,4c00H
    int 21H

code ends

end start