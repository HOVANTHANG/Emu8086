.model small
.stack 100h
.data
.code 
  main proc
   mov ax,@data
   mov ds,ax
   
   mov ah,2
   mov dl,48
intiep:
    int 21h
    mov bl,dl
    mov dl,32
    int 21h
    mov dl,bl
    add dl,1
    cmp dl,57
    jle intiep
    
    
    
    mov ah,4ch
    int 21h
    main endp
  
end main
    
   
   