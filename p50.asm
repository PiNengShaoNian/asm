assume cs:code

code segment

    start: mov ax,cs
    mov ds,ax
    mov si,offset d0
    mov ax,0
    mov es,ax
    mov di,202h
    mov cx,offset d0end - offset d0
    rep movsb

    mov ax,0
    mov es,ax
    mov word ptr es:[7ch * 4],202h
    mov word ptr es:[7ch * 4+ 2],0

    mov ax,4c00H
    int 21h


    d0: push bx
    push si
    push cx
    push dx
    push ax
    
    mov ax,0b800H
    mov es,ax
    mov ah,0
    mov al,160
    mul dh
    mov dh,0
    add ax,dx
    add ax,dx
    mov bx,ax
    mov ch,0
    mov dl,cl

    change: mov cl,ds:[si]
    jcxz ok
    mov es:[bx],cl
    mov es:[bx+1],dl
    add bx,2
    inc si
    jmp change

    ok: pop ax 
    pop dx
    pop cx
    pop si
    pop bx
    iret
    d0end: nop

code ends

end start