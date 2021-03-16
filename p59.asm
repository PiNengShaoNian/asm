assume cs:code

code segment

    data dw 1,2,3,4,5,6,7,8
    sum dd 0

    start: mov si,0
    mov cx,8

    s: mov ax, data[si]
    add word ptr sum[0],ax
    adc word ptr sum[2],0
    add si,2
    loop s

    mov ax,4c00h
    int 21H

code ends

end start