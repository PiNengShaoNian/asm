assume cs:code,ds:stack

stack segment

    db 128 dup(0)

stack ends

code segment

    start: mov ax,stack
    mov ss,ax
    mov sp,128

    call copy_boot

    boot: jmp boot_begin
    func0 db '1) reset pc',0
    func1 db '2) start system',0
    func2 db '3) clock',0
    func3 db '4) set clock',0

    func_pos dw offset func0 - offset boot + 7e00h
     dw offset func1 - offset boot + 7e00h
     dw offset func2 - offset boot + 7e00h
     dw offset func3 - offset boot + 7e00h
    time db 'YY/MM/DD hh:mm:ss',0
    cmos db 9,8,7,4,2,0
    clock1 db 'F1----change the color        ESC----return menu',0
    change db 12 dup(0),0

    boot_begin:
    call init_boot
    call cls_screen
    ; call clear_stack
    call show_menu

    show_menu:
    mov di,160*10 + 30 * 2
    mov bx,offset func_pos - offset boot + 7e00h
    mov cx,4

    s1:
    mov si,ds:[bx]
    call show_line
    add bx,2
    add di,160
    loop s1
    ret

    show_line:
    push ax
    push di
    push si


    show_line_start:
    mov al,ds:[si]
    cmp al,0
    je show_line_end
    mov es:[di],al
    add di,2
    inc si
    jmp show_line_start

    show_line_end:
    pop si
    pop di
    pop ax

    cls_screen:
    mov bx,0
    mov cx,2000
    mov dl,' '
    mov dh,2
    s: mov es:[bx],dx
    inc bx
    loop s
    ret

    init_boot: mov bx,0B800H
    mov es,bx
    mov bx,0
    mov ds,bx
    ret

    clear_stack:
    push bx
    push cx

    mov bx,offset change-offset boot+7e00h
    mov cx,12
    cls_stack:
    mov byte ptr ds:[bx],'*'
    inc bx
    loop cls_stack

    pop cx
    pop bx
    ret
    boot_end: nop

    

    copy_boot: mov ax,0
    mov es,ax
    mov di,7e00h

    mov ax,cs
    mov ds,ax
    mov si,offset boot
    mov cx,offset boot_end - offset boot
    cld
    rep movsb
    ret
    

code ends

end start