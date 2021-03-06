assume cs:code

code segment
    start: mov ax,2000H
    mov ds, ax
    mov bx,1000H
    mov WORD PTR ds:[bx],00BEH
    mov WORD PTR ds:[bx+2],0006H
    mov ax,[bx]
    mov cx,[bx+1]
    add cx,[bx+2]

code ends


end start