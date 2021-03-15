assume cs:codesg
codesg segment
          db 'yy/MM/dd hh:mm:ss',0  ; 用于存放从CMOS RAM中读取的时间ASCII
   index: db 9,8,7,4,2,0            ; 用于存放CMOS RAM中对应的日期存储单元地址
   start: mov ax,cs
          mov ds,ax
          mov si,0
          mov di,offset index
 
          mov cx,6
       s: mov dx,cx

          mov al,[di]
          out 70h,al
          in al,71h          ; 将CMOS RAM中的存储的信息依次读入al中

          mov ah,al
          mov cl,4
          shr ah,cl
          and al,00001111B
          add ah,30h
          add al,30h         ; 得到对应位的十进制ASCII

          mov [si],ah
          mov [si+1],al

          inc di
          add si,3
          mov cx,dx
          loop s             ; 循环的作用就是将得到的数据保存在time数据段中

          mov ax,0B800H
          mov es,ax
          mov bx,160*12+31*2 ; 显示时间的位置，在12行，31列处开始

          mov si,0
    show: mov cl,[si]
          mov ch,0
          jcxz comp
          mov es:[bx],cl
          mov byte ptr es:[bx+1],2
          inc si
          add bx,2
          jmp short show
    comp: mov ax,4c00h
          int 21h
codesg ends
end start