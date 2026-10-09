format ELF64

public _start

include '../MyLibrary.asm'

section '.bss' writeable
    n dq 0

section '.text' executable

_start:
    ; Читаем n с клавиатуры в буфер
    mov rsi, buffer
    call input_keyboard

    ; Конвертируем введенную строку в число
    mov rax, rsi
    call ATOI
    ; Результат функции ATOI возвращается в rcx, сохраняем его в n
    mov [n], rcx

    ; Делим n на 481
    mov rax, [n]        ; Делимое в rax
    xor rdx, rdx        ; Обнуляем rdx перед делением
    mov rbx, 481        ; Делитель в rbx
    div rbx             ; rax = rax / rbx (целочисленный результат)

    ; Выводим результат (он остался в rax)
    call print_int
    
    ; Выходим из программы
    call exit
