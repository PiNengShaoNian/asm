assume cs:codesg

codesg segment
    mov ax,0FFFFH
    mov ds,ax
    mov ax,0000H

    mov ax,[0]
    mov dx,0
    mov cx,3
   s:add dx,ax
   loop s

   mov ax,4c00H
   int 21H
codesg ends

end