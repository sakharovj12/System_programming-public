format ELF64

public _start

section ".data" writeable
    n = 6
    buf db n dup (";")
    nl db 10

section ".text" executable

; в первой строке выводим 1 символ, в каждой следующей на 1 больше

_start:
    mov r12, 1                ; r12 - длина текущей строки
    mov r13, n                ; r13 - сколько символов осталось

row:
    cmp r12, r13              ; если осталось меньше, чем длина строки, выводим сколько осталось
    jbe @f
    mov r12, r13
@@:
    mov rax, 1
    mov rdi, 1
    mov rsi, buf
    mov rdx, r12
    syscall

    mov rax, 1                ; выводим перевод строки
    mov rdi, 1
    mov rsi, nl
    mov rdx, 1
    syscall

    sub r13, r12              ; вычитаем выведенные символы, следующая строка на 1 длиннее
    inc r12
    test r13, r13
    jnz row

    mov rax, 60
    xor rdi, rdi
    syscall
