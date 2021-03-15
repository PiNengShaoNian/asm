assume cs:code

code segment

    start: mov ax,cs
    mov ds,ax
    mov si,offset d0
    mov ax,0
    mov es,ax
    mov di,200H
    mov cx,offset d0end - offset d0
    cld
    rep movsb

    mov ax,0
    mov es,ax
    mov word ptr es:[7ch * 4],200h
    mov word ptr es:[7ch * 4+ 2],0

    mov ax,4c00H
    int 21h

    d0: push bp
    mov bp,sp
    jcxz ok
    add word ptr ss:[bp+2],bx
    dec cx
    ok: pop bp
    iret
    d0end: nop

code ends

end start