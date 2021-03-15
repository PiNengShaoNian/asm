assume cs:code

code segment

    mov al,2
    start: out 70h,al
    in al,71h

    mov ax,4c00H
    int 21H

code ends

end start