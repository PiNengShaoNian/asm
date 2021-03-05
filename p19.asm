assume cs:code

dataA segment

    dw 1,2,3,4,5,6,7,8,9,10,11

dataA ends

dataB segment

    dw 0,0,0,0,0,0,0,0

dataB ends

code segment

    start: mov ax,dataA
    mov ds,ax
    mov ax,dataB
    mov ss,ax
    mov sp,16
    mov cx,8

    s: push ds:[bx]
    add bx,2
    loop s
    mov ax,4c00H
    int 21H

code ends

end start