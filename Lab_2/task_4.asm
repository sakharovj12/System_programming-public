format ELF64

public _start

section ".data" writeable
    n = 2532246398
    buf rb 20                 ; буфер для цифр результата
    nl db 10                  ; сразу за буфером - перевод строки

section ".text" executable

_start:
    mov rax, n
    mov rcx, 10
    xor r8, r8                ; r8 - сумма цифр

sum:                          ; делим число на 10, пока не станет 0, остатки (цифры) суммируем
    xor rdx, rdx
    div rcx
    add r8, rdx
    test rax, rax
    jnz sum

    mov rax, r8               ; переводим сумму в текст: цифры пишем справа налево перед \n
    mov rsi, nl

digit:
    xor rdx, rdx
    div rcx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    test rax, rax
    jnz digit

    mov rdx, nl + 1           ; длина = от первой цифры до \n включительно
    sub rdx, rsi
    mov rax, 1
    mov rdi, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
