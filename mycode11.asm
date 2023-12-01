.model small
.stack 100h
.data
   s1 db 'Nhap chuoi:$'
   s2 db 10,13,'Chuoi vua nhap la:$' 
  ; s db 100 dup('$')  
   s db 100 dup (?)                        
.code
        main proc 
            ;chuyen du lieu cao cpu
        mov ax,@data
        mov ds,ax
               
        mov ah,9
        lea dx,s1
        int 21h  
       

        mov si,0   ;index     
nhaptiep:         
        mov ah,1
        int 21h
        mov s[si],al  
        inc si
        cmp al,13
        je  enter
        jmp nhaptiep
enter:
        mov ah,9
        lea dx,s2
        int 21h
        
        
        
        ;in xau   
      ;  mov ah,9
       ; lea dx,s
       ; int 21h
       
        mov cx,si
        mov si,0 
xuat:
        mov ah,2   
        mov dl,s[si]      
        cmp dl,'a'
        jb xth
        cmp dl,'z'
        ja xth
        sub dl,32
        
xth:        
        int 21h
        inc si
        loop xuat
                
                
         mov ah,4ch
         int 21h       
        main endp
end main




