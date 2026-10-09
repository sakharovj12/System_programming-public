format ELF64

public _start

include '../MyLibrary.asm'

section '.bss' writeable
    n dq 0

section '.text' executable

_start:
    ; Читаем общее количество чисел n
    mov rsi, buffer
    call input_keyboard
    mov rax, rsi
    call ATOI
    mov [n], rcx       ; Сохраняем n в память

    xor r9, r9         ; r9 = счетчик цикла (i = 0)
    xor r8, r8         ; r8 = баланс (положительные делают +1, отрицательные -1)

.loop:
    cmp r9, [n]
    jge .check_result   ; Если i >= n, выходим из цикла

    ; Сохраняем r9, так как функции ввода могут затереть регистры
    push r9

    ; Читаем очередное число
    mov rsi, buffer
    call input_keyboard
    mov rax, rsi
    call ATOI          ; число теперь в rcx

    pop r9             ; Восстанавливаем i

    ; Проверяем знак числа (в ATOI результат знаковый в rcx)
    cmp rcx, 0
    jg .positive        ; Если > 0, переходим
    jl .negative        ; Если < 0, переходим
    jmp .next_iter      ; Если равно 0, ничего не делаем

.positive:
    inc r8             ; Положительное число: баланс +1
    jmp .next_iter

.negative:
    dec r8             ; Отрицательное число: баланс -1

.next_iter:
    inc r9             ; i++
    jmp .loop

.check_result:
    ; Сравниваем итоговый баланс в r8 с нулем
    cmp r8, 0
    jg .more_positive   ; Если баланс > 0
    jl .more_negative   ; Если баланс < 0

    ; Если баланс == 0 (поровну)
    mov rax, -1
    call print_int
    call exit

.more_positive:
    mov rax, 1
    call print_int
    call exit

.more_negative:
    mov rax, 0
    call print_int
    call exit
