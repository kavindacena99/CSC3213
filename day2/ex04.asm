.model small
.stack 100h
.data
  n1 db 5
  n2 db 3
.code
start:
  mov ax,@data
  mov ds,ax
  
  mov dl,n1
  sub dl,n2
  add dl,48
  mov ah,02h
  int 21h
  
  mov ax,4c00h
  int 21h
  
end start