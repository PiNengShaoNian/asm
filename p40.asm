assume cs:code,ds:data

data segment

	     dw 8 dup(0)

data ends

stack segment
	      dw 64 dup(0)
stack ends

code segment

    reverse: push si
    push cx
    push bx
    push di

    
    mov bx,0
    mov di,si

    change_r: mov cx,ds:[si]
    jcxz ok_r
    push cx
    inc si
    inc bx
    jmp change_r

    ok_r: mov cx,bx
    mov si,di

    jcxz ret_r
    s: pop ds:[si]
    inc si
    loop s

    mov bx,0
    mov ds:[si],bx 
     
    ret_r: pop di
    pop bx 
    pop cx
    pop si
    ret

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

    dtoc:
    push dx
    push cx
    push si 
    change: mov dx,0
    mov cx,10
    call divdw
    add cl,30H
    mov ds:[si],cl
    inc si
    mov cx,ax
    jcxz ok
    jmp short change

    ok:mov cl,0
    mov ds:[si],cl

    pop si
    pop cx
    pop dx
    ret

    start: mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,64
    mov ax,12666
    mov si,0

    call dtoc

    call reverse

    mov ax,4c00H
    int 21H

code ends 


end start