format ELF64

public _start

section ".data" writeable
    msg db 'fwFEkLiCHvNygsrxDkPKXWZr', 10
    len = $ - msg

section ".text" executable

_start:
    mov rsi, msg              ; левый указатель - начало строки
    mov rdi, msg + len - 2    ; правый указатель - последний символ (без \n)

swap:
    cmp rsi, rdi              ; указатели встретились - строка развернута
    jge print

    mov al, [rsi]             ; меняем местами левый и правый символы
    mov bl, [rdi]
    mov [rsi], bl
    mov [rdi], al

    inc rsi                   ; сдвигаем указатели навстречу друг другу
    dec rdi
    jmp swap

print:
    mov rax, 1                ; выводим строку
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
