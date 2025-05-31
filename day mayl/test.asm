.model small
.stack 100h

.data
    msg db "Enter a number: $"
    even_msg db 0Dh, 0Ah, "Even numbers:$"
    newline db 0Dh, 0Ah, "$"
    a db ?  
    b db ?

.code 
    mov ax,@data
    mov ds,ax

    mov dx,offset msg 
    mov ah,09h
    int 21h

    call readInt  

    ; Display even numbers message
    mov dx,offset even_msg
    mov ah,09h
    int 21h

    ; Initialize loop
    mov cl,2  ; Start from 2
    loop_print:
        cmp cl, a
        jg exit_loop  ; Exit if cl > input number

        ; Print the number
        mov ah, 02h
        mov dl, cl
        add dl, '0' ; Convert to ASCII
        int 21h

        ; Print a newline
        mov dx, offset newline
        mov ah, 09h
        int 21h

        add cl, 2  ; Increment by 2 for the next even number
        jmp loop_print 

    exit_loop:
    mov ax,4c00h
    int 21h

    ; Function to read an integer input
    proc readInt
        mov ah,01h
        int 21h
        sub al,48
        mov a,al
        read:
            mov ah,01h
            int 21h
            cmp al,0dh
            je exit_read

            sub al,48
            mov b,al

            mov al,a
            mov bl,10
            mul bl
            add al,b
            mov a,al
            jmp read

        exit_read:
        mov al,a
        ret
    endp 

end
