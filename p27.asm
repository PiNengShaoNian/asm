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

table segment
  db 21 dup ('year summ ne ?? ')
table ends

code segment

    start: mov ax,data
    mov ds,ax
    mov ax,table
    mov es,ax
    mov cx,21
    mov bx,0
    mov si,0
    mov di,0
    mov bp,0

    s: mov ax,ds:[bx]
    mov es:[bp],ax
    mov ax,ds:[bx+2]
    mov es:[bp+2],ax
    mov ax,ds:[si+84]
    mov es:[bp+5],ax
    mov ax,ds:[si+86]
    mov es:[bp+7],ax
    mov ax,ds:[di+168]
    mov es:[bp+0aH],ax
    mov ax,[si+84]
    mov dx,[si+86]
    div word ptr [di+168]
    mov es:[bp+0DH],ax
    
    add bx,4
    add si,4
    add di,2
    add bp,16
    loop s

    mov ax,4c00H
    int 21H

code ends

end start