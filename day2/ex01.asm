.model small
.stack 100h
.data
  n1 db 2
  n2 db 3
  msg1 db 'Number 01:$'
  msg2 db 'Number 02:$'
  msg3 db 'Sum of num1 and num2:$'
.code
start:
  mov ax,@data
  mov ds,ax
  
  mov dx,offset msg1
  mov ah,09h
  int 21h
  
  mov dl,n1
  add dl,48
  mov ah,02h
  int 21h
  
  mov dl,10
  mov ah,02h
  int 21h
  
  mov dx,offset msg2
  mov ah,09h
  int 21h
  
  mov dl,n2
  add dl,48
  mov ah,02h
  int 21h
  
  mov dl,10
  mov ah,02h
  int 21h
  
  mov dx,offset msg3
  mov ah,09h
  int 21h
  
  mov dl,n1
  add dl,n2
  add dl,48
  mov ah,02h
  int 21h
  
  mov ax,4c00h
  int 21h
  
end start