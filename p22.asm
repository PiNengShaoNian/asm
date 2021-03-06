assume cs:code,ds:data

data segment
    db 'welcome to masm!'
    db '....... .. .....'
data ends

code segment

  start:  mov ax,data
    mov ds,ax
    mov si,0

    mov cx,16

    s: mov al,[si]
    mov [si+16],al
    inc si
    loop s

    mov ax,4c00H
    int 21H 

code ends

end start