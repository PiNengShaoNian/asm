assume cs:code,ds:data

data segment

    db 'hello',0
    db 'world',0

data ends

stack segment
    db 16 dup(0)
stack ends

code segment

    capital: push cx
    push si

    change: mov cl,[si]
    mov ch,0
    jcxz ok
    and byte ptr [si],11011111B
    inc si

    jmp short change

    ok: pop si
    pop cx
    ret

    start:  mov ax,data
    mov ds,ax
    mov si,0
    mov ax,stack
    mov ss,ax
    mov sp,16
    mov cx,2

    s: call capital
    add si,6
    loop s

    mov ax,4c00H
    int 21H

code ends

end start