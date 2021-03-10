assume cs:code,ds:stack

stack segment

    dw 8 dup(0)

stack ends

code segment
    divdw:
    push ax
    mov ax,dx
    mov dx,0
    div cx
    mov bx,ax
    pop ax
    div cx
    mov cx,dx
    mov dx,bx
    ret

    start:	
	mov ax,stack
	mov ss,ax
	mov sp,10h
	mov ax,4240h
	mov dx,0fh
	mov cx,0ah

	call divdw

	mov ax,4c00h
	int 21h

code ends

end start