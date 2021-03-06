assume cs:code,ds:data

data segment

    db '1. file         '
    db '2. edit         '
    db '3. search       '
    db '4. view         '
    db '5. options      '
    db '6. help         '

data ends

code segment
 
    start: mov ax,data
    mov ds,ax
    mov si,0
    mov cx,6

    s: mov al,[si+3]
    and al,11011111B
    mov [si+3],al
    add si,16
    loop s

code ends

end start