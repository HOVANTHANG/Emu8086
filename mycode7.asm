.model small
.stack 100h
.data
    s1 db 'Nhap so:$'
    s2 db 10,13,'so vua nhap:$' 
    a db 0
.code
    main proc
      mov ax,@data
      mov ds,ax
                               
                               
      mov ah,9
      lea dx,s1
      int 21h    
      
      mov bl,10    
      mov ch,0 
nhaptiep:            
      mov ah,1
      int 21h
      cmp al,13
      je enter
      sub al,48
      mov bh,al
      mov al,a
      mul bl  
      add al,bh
      mov a,al
      jmp nhaptiep
enter:
    mov ah,9
    lea dx,s2
    int 21h
    
    
    mov bl,10
    mov cl,0
      
    mov al,a
chiatiep:    
    mov ah,0
    div bl  
    cmp al,0
    je inso
    push ax
    inc cl
    jmp  chiatiep          
inso:
     push ax
     inc cl
    
intiep:                  
     mov ah,2 
     pop dx
     mov dl,dh
     add dl,48
     int 21h
     loop intiep
     
     
     mov ah,4ch
     int 21h
      
     main endp
 end main
     
    
    
    
    
    
    
    
    
    
      