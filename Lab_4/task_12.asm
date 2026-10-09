format ELF64

public _start

include '../MyLibrary.asm'

section '.bss' writeable
    n dq 0

section '.text' executable

_start:
    ; Читаем n с клавиатуры
    mov rsi, buffer
    call input_keyboard
    mov rax, rsi
    call ATOI
    mov [n], rcx       ; Сохраняем n

    xor r8, r8         ; r8 = count (наш счетчик подходящих чисел)
    mov r9, 1          ; r9 = i (текущее число, начинаем с 1)

.loop:
    cmp r9, [n]
    jg .print_result   ; Если i > n, выходим из цикла

    ; 1. Проверяем деление на 5 (должно делиться: остаток == 0)
    mov rax, r9
    xor rdx, rdx
    mov rbx, 5
    div rbx
    cmp rdx, 0
    jne .next_iter     ; Если остаток не 0, число не подходит

    ; 2. Проверяем деление на 3 (НЕ должно делиться: остаток != 0)
    mov rax, r9
    xor rdx, rdx
    mov rbx, 3
    div rbx
    cmp rdx, 0
    je .next_iter      ; Если остаток 0, число не подходит

    ; 3. Проверяем деление на 7 (НЕ должно делиться: остаток != 0)
    mov rax, r9
    xor rdx, rdx
    mov rbx, 7
    div rbx
    cmp rdx, 0
    je .next_iter      ; Если остаток 0, число не подходит

    ; Если прошли все проверки, увеличиваем счетчик
    inc r8

.next_iter:
    inc r9             ; i++
    jmp .loop

.print_result:
    mov rax, r8        ; Переносим count в rax для вывода
    call print_int
    call exit
