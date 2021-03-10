assume cs:code,ds:data


data segment
  db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
  db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
  db '1993','1994','1995'

  dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
  dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

  dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
  dw 11542,14430,15257,17800
data ends

str_buffer segment

  dw 8 dup(0)

str_buffer ends

stack segment
    
    db 128 dup(0)

stack ends

code segment
    reverse: push si ;reverse
    push cx
    push bx
    push di

    
    mov bx,0
    mov di,si

    change_r: mov ch,0
    mov cl,ds:[si]
    jcxz ok_r
    push cx
    inc si
    inc bx
    jmp change_r

    ok_r: mov cx,bx
    mov si,di

    jcxz ret_r
    s: pop bx
    mov byte ptr ds:[si],bl
    inc si
    loop s

    mov bx,0 ;在最后填一个零
    mov ds:[si],bx 
     
    ret_r: pop di
    pop bx 
    pop cx
    pop si
    ret

    divdw: ;divdw
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

    dtoc: ;dtoc
    push cx
    push si 
    change: mov cx,10
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
    ret

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
    
    show_str_change: mov cl,[si]
    mov ch,0
    jcxz show_str_ok
    mov al,ds:[si]
    mov es:[bx],al
    inc bx
    mov es:[bx],ah
    inc bx
    inc si
    jmp show_str_change

    show_str_ok: pop ax 
    pop es
    pop dx 
    pop di 
    pop ax 
    pop cx 
    pop bx
    pop si
    ret

    start: mov ax,stack
    mov ss,ax
    mov ax,data
    mov ds,ax
    mov ax,str_buffer
    mov es,ax
    mov sp,128
    mov dh,3
    mov cl,2
    mov di,21
    mov si,0
    mov bx,0
    

    loop_print: push cx
    mov dl,3
    mov cx,di
    jcxz ret_print
    pop cx
    mov ax,ds:[si]
    mov es:[0],ax
    mov ax,ds:[si+2]
    mov es:[2],ax
    mov al,0
    mov es:[4],al
    push si
    push ds
    mov si,0
    mov ax,es
    mov ds,ax

    call show_str


    pop ds
    pop si
        
    push si
    push ds
    push dx

    mov ax,ds:[si + 84]
    mov dx,ds:[si + 86]

    mov si,0
    mov bp,es
    mov ds,bp
    
    call dtoc

    call reverse

    pop dx
    add dl,7
    call show_str

    pop ds
    pop si
    

    add bx,2
    add si,4
    sub di,1
    add dh,1

    jmp loop_print

    ret_print: mov ax,4c00H
    int 21H

code ends

end start