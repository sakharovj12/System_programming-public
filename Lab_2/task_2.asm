format ELF64

public _start

section ".data" writeable
    n = 6
    m = 2
    k = 3
    buf db n dup (";")
    nl db 10

section ".text" executable

_start:
    mov r12, buf              ; r12 - начало текущей строки в памяти
    mov r13, k                ; r13 - сколько строк осталось

row:
    mov rax, 1                ; выводим m символов
    mov rdi, 1
    mov rsi, r12
    mov rdx, m
    syscall

    mov rax, 1                ; выводим перевод строки
    mov rdi, 1
    mov rsi, nl
    mov rdx, 1
    syscall

    add r12, m                ; переходим к следующим m символам и уменьшаем счетчик строк
    dec r13
    jnz row

    mov rax, 60
    xor rdi, rdi
    syscall
