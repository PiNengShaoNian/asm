assume cs:codesg

codesg segment
    mov ax,0D
    mov cx,236D
  s:add ax,123D
    loop s
    mov ax,4c00H
    int 21H
codesg ends

end