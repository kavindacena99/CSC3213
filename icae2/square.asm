.model small 
.stack 100h 

.data 


.code 
main:
    mov ax,@data 
    mov ds,ax 

    mov dx,offset msg 
    mov ah,09h 
    int 21h 

    mov dl,10 
    mov ah,02h
    int 21h 

    mov cl,10
    mov bl,1

next_num:
    mov al,bl 
    mul bl 

    cmp al,10
    j1 digone
    jge digit 

digone:
mov dl,al 
add dl,48 
mov ah,02h 
int 21h 
jmp move 

digit:
cmp al,100
je digit3 

mov dl,10 ;dl=10, al=25 
mov ah,00 ; ah=0 
div dl ; al/dl=25/10 al=2 ah=5
mov r,ah 
mov dl,al 
add dl,48
mov ah,02h 
int 21h 


mov dl,r 
add dl,48
mov ah,02h 
int 21h 
jmp move


digit3:
mov dl,100 
mov ah,00 
div dl 
mov r1,ah 
mov dl,al 
add dl,48 
mov ah,02h 
int 21h 

mov al,r1 
mov dl,10 
mov ah,00 
div dl 
mov r2,ah 

mov dl,al 
add dl,48 
mov ah,02h 
int 21h 

mov al,r1 
mov dl,10 
mov ah,00 
div dl 
mov r2,ah 

mov dl,al 
add dl,48 
mov ah,02h
int 21h 

mov dl,r2 
add dl,48 
mov ah,02h 
int 21h
jmp move 

move:
move dx,offset newLine
mov ah,09h 
int 21h 

inc bl 
loop next_num 

mov ax,4c00h 
int 21h 

end main


