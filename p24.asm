assume cs:code,ds:data,ss:stack

data segment
    db 'ibm             '
    db 'dec             '
    db 'dos             '
    db 'vax             '
data ends

stack segment
   dw 0,0,0,0,0,0,0,0
stack ends

code segment

   start: mov ax,data
   mov ds,ax
   mov ax,stack
   mov ss,ax
   mov sp,16
   mov bx,0
   mov cx,4

   s: mov si,0
   push cx
   mov cx,3
   s0: mov al,[si+bx]
   and al,11011111B
   mov [si+bx],al
   inc si
   loop s0
   pop cx
   add bx,16
   loop s

code ends

end start