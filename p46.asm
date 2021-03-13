assume cs:code

code segment

    start: mov ax,0
    mov es,ax
    mov di,0200H
    mov ax,cx
    mov ds,ax
    mov si,offset d0
    mov cx,offset d0end-offset d0
    cld
    rep movsb

    mov ax,0
    mov es,ax
    mov word ptr es:[0*4],200H
    mov word ptr es:[0*4 + 2],0

    mov ax,4c00H
    int 21H


    d0: jmp short d0start
    db 'overflow'
    d0start: mov ax,0b800h
    mov ds,ax
    mov si,12 * 160 + 2 * 36
    mov ax,cx
    mov es,ax
    mov di,202H

    mov cx,8

    s: mov al,es:[di]
    mov ds:[si],al
    inc di
    add si,2
    loop s

    mov ax,4c00H
    int 21H

    d0end: nop

code ends

end start