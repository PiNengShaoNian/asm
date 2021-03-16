assume cs:code,ds:data

data segment

    a db 1,2,3,4,5,6,7,8
    b dw 0

data ends

code segment

    start: mov ax,data
    mov ds,ax

    mov si,0
    mov cx,8

    s: mov al,a[si]
    add byte ptr b[0],al
    adc byte ptr b[1],0
    inc si
    loop s

    mov ax,4c00h
    int 21H

code ends

end start