%include 'in_out.asm'

SECTION .data
msg1 db 'Введить N:',0h
SECTION .bss
    N: resb 10

SECTION .text
   Global _start
_start:

;------ Вывод сообщения 'Введите N:'
mov eax,msg1
call sprint
;----- Вывод 'N'
mov ecx,N
mov edx, 10
call sread

; Преобразования 'N' из символа в число
mov eax,N
call atoi
mov [N],eax

;------ Организация цикла
mov ecx,[N]
label:
mov [N],ecx
mov eax,[N]
call iprintLF
loop label
call quit
