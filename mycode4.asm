.model small
.stack 100h
.data
    s1 db 'Nhap ki tu:$'
    s2 db 10,13,'Ki tu viet hoa la:$'
    
.code
     main proc
      mov ax,@data
      mov ds,ax
      
      mov ah,9
      lea dx,s1
      int 21h
      
      mov ah,1
      int 21h
      mov bl,al 
      sub bl,20h ;sub bl,32
      
      
      mov ah,9
      lea dx,s2
      int 21h
      
      mov ah,2
      mov dl,bl
      int 21h

             
      mov ah,4ch
      int 21h
      
      main endp
     
end main
