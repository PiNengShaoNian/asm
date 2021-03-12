assume cs:code,ds:data

data segment

    db "Beginner's All-purpose Symbolic Instruction Code.",0

data ends


code segment

   start: mov ax,data
   mov ds,ax
   mov bx,0
   mov ch,0

   change: mov al,[bx]
   mov cl,al
   jcxz ok
   cmp al,97
   jb next
   cmp al,7aH
   ja next
   and al,11011111B
   mov [bx],al

   next: inc bx
   jmp change

   ok: mov ax,4c00H
   int 21H

code ends

end start