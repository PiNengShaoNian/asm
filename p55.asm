assume cs:code

code segment

    start: mov al,7
    out 70h,al
    in al,71h

    mov ah,al
    mov cl,4
    shr ah,cl
    and al,00001111B

    add ah,30H
    add al,30h

    mov bx,0b800H
    mov es,bx
    mov byte ptr es:[160*12+40*2],ah
    mov byte ptr es:[160*12 + 40 * 2 + 2],al

    mov ax,4c00H
    int 21H

code ends

end start