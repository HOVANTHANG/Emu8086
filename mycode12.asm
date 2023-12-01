.model small
.stack 100h
.data
    s1 db 'Nhap xau:$'
    s2 db 10,13,'Xau vua nhap la:$'
    s3 db  10,13,'Tach chu thuong:$'  
     s4 db  10,13,'Tach chu hoa:$'
    s db 100 dup(?)  
    ss1 db 100 dup(?)
    ss2 db 100 dup(?)
.code
        main proc 
         mov ax,@data
         mov ds,ax     
         
         mov ah,9
         lea dx,s1
         int 21h      
         
         mov si,0
nhaptiep:
         mov ah,1
         int 21h
         mov s[si],al
         inc si
         cmp al,13
         je enter
         jmp nhaptiep
enter:
        mov ah,9
        lea dx,s2
        int 21h
        
         mov cx,si
         mov si,0
xuattiep:
        mov ah,2      
        mov dl,s[si]
        int 21h     
        inc si
        loop xuattiep
        
        
        
        ;tach xau
        mov cx,si
        mov bx,0  ;index cho s
        mov si,0   ;index cho ss1
        mov di,0   ;index cho ss2
tach:      
        mov dl,s[bx]   
        ;tach thuong
        cmp dl,'a'
        jb tachhoa
        cmp dl,'z'
        ja tachhoa
        mov ss1[si],dl   
        inc si
        
tachhoa:
        cmp dl,'A'
        jb duyettiep  
        cmp dl,'Z'
        ja duyettiep
        mov ss2[di],dl  
        inc di
duyettiep: 
         inc bx 
         loop tach   
         
         
         
         mov ah,9
        lea dx,s3
        int 21h
        
         mov cx,si
         mov si,0
xuatxt:
        mov ah,2      
        mov dl,ss1[si]
        int 21h     
        inc si
        loop xuatxt
                
                
          
         mov ah,9
        lea dx,s4
        int 21h
        
         mov cx,di
         mov di,0
xuatxh:
        mov ah,2      
        mov dl,ss2[di]
        int 21h     
        inc di
        loop xuatxh
        
         
         
         
         
              
                     
         
         mov ah,4ch
         int 21h
         main endp
end main
          



