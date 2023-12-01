.model small
.stack 100h
.data
  s1 db 'Nhap n:$'
  s2 db 10,13 ,'Tong =$'
  
.code 
     main proc
     mov ax,@data
     mov ds,ax
     
     mov ah,9
     lea dx,s1
     int 21h    
     
      mov ah,1
      int 21h 
      sub al,48
      mov bl,al
      
      mov ah,9
      lea dx,s2
      int 21h 
      
      
      mov al,0
      mov cl,1
congtiep:
         add al,cl
         inc cl
         cmp cl,bl
         jle congtiep
          
          mov ah,0 
          mov bl,10
          div bl  
          
          mov bh,ah
          mov ah,2 
          mov dl,al
          add dl,48
          int 21h
          
   
         mov ah,2
         mov dl,bh
         add dl,48
         int 21h
         
         mov ah,4ch
         int 21h
         main endp
     
end main
