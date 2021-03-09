assume cs:code,ds:data

data segment

    db 'welcome to masm!',0

data ends

stack segment

    db 16 dup(0)

stack ends


code segment

    show_str: push si
    push bx
    push cx
    push ax
    push di
    push dx
    push es
    push ax
    
    mov ax,0b800H
    mov es,ax
    mov al,dh
    mov ah,0
    mov bl,160
    mul bl
    mov dh,0
    add ax,dx
    add ax,dx
    mov bx,ax
    mov ch,0
    mov ah,cl
    and ah,00000111B
    
    change: mov cl,[si]
    mov ch,0
    jcxz ok
    mov al,ds:[si]
    mov es:[bx],al
    inc bx
    mov es:[bx],ah
    inc bx
    inc si
    jmp change

    ok: pop ax 
    pop es
    pop dx 
    pop di 
    pop ax 
    pop cx 
    pop bx
    pop si
    ret

    start: mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,16
    mov si,0
    mov dh,8
    mov dl,3
    mov cl,2

    call show_str

    mov ax,4c00H
    int 21H

code ends

end start