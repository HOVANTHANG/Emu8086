.model small
.stack 100h
.data
         s1 db 'Nhap xau:$'      
         s2 db 10,13,'Xau vua nhap la:$'
         s3 db 10,13,'Xau chu thuong:$'
         s4 db 10,13,'Xau chu hoa:$'    
         s5 db 10,13,'Xau chu so:$'
         s db dup 100(?)  
         st db dup 100(?)
         sh db dup 100(?)     
         sso db dup 100(?)   
        
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
            cmp al,13
            je enter
            mov s[si],al
            inc si
            jmp nhaptiep 
enter:
        mov ah,9
        lea dx,s2
        int 21h
        
        mov cx,si
        mov si,0
inxau: 
        mov ah,2
        mov dl,s[si]
        inc si
        int 21h
        loop inxau
        
        
        mov cx,si
        mov bx,0
        mov si,0
        mov di,0   
        mov bp,0   
      
tach:
        mov dl,s[bx]
        cmp dl,'a'
        jb tachhoa
        cmp dl,'z'
        ja tachhoa
        mov st[si],dl
        inc si
tachhoa:
        cmp dl,'A'
        jb tachtiep
        cmp dl,'Z'
        ja tachtiep
        mov sh[di],dl
        inc di
tachtiep:  
        cmp dl,'0'
        jb tachtiep2
        cmp dl,'9'
        ja tachtiep2
        mov sso[bp],dl
        inc bp    
     
tachtiep2:     
         inc bx
         loop tach
         
         
        mov ah,9
        lea dx,s3
        int 21h
        
        mov cx,si
        mov si,0
        
inthuong:        
        mov ah,2
        mov dl,st[si]
        int 21h
        inc si
        loop inthuong 
                         
                         
         mov ah,9
         lea dx,s4
         int 21h
         
         mov cx,di
         mov di,0
inhoa:
        mov ah,2
        mov dl,sh[di]
        int 21h
        inc di
        loop inhoa
                      
                      
         mov ah,9
         lea dx,s5
         int 21h
         
         mov cx,bp
         mov bp,0
inso:
       mov ah,2
       mov dl,sso[bp]
       int 21h
       inc bp
       loop inso
         
        
        
        
        
         
            
           
            
            mov ah,4ch
            int 21h
            main endp
        end main