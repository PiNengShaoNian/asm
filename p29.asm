assume cs:code,ds:data

data segment

    dd 0

data ends

code segment

    start: mov ax,data
    mov ds,ax
    mov bx,0
    mov word ptr [bx],0
    mov word ptr [bx+2],cs
    jmp dword ptr ds:[0]

code ends

end start