.model small
.stack 100h
.data
   s1 db  'Nhap so:$'  
   s2 db 10,13,'So vua nhap la:$'
   str db 100 dup('$')
   
.code
     main proc
        mov ax,@data
        mov ds,ax
        
         mov ah,9
        lea dx,s1
        int 21h              
                      
        mov ah,10 ; mov ah,0ah
        lea dx,str
        int 21h
        
         mov ah,9
        lea dx,s2
        int 21h 
        
        lea dx,str +2  
        mov al,str+2   
        sub al,'0'
        int 21h
        
          
        
        
        mov ah,4ch
        int 21h        
        
        
        main endp
     
end code


