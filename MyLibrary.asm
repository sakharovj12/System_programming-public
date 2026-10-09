section '.bss' writeable
    buffer rb 255

section '.text' executable

; --- Ввод строки с клавиатуры ---
input_keyboard:
    mov rax, 0          ; sys_read
    mov rdi, 0          ; stdin
    mov rdx, 255        ; размер
    syscall
    ret

; --- Конвертация ASCII в Integer (ATOI) ---
; Принимает указатель в rax, возвращает число в rcx
ATOI:
    xor rcx, rcx
.loop:
    movzx rbx, byte [rax]
    cmp rbx, 10         ; перевод строки
    je .done
    cmp rbx, 0          ; конец строки
    je .done
    cmp rbx, '0'
    jb .next
    cmp rbx, '9'
    ja .next
    sub rbx, '0'
    imul rcx, 10
    add rcx, rbx
.next:
    inc rax
    jmp .loop
.done:
    ret

; --- Вывод числа на экран (print_int) ---
; Принимает число в rax
print_int:
    mov rsi, buffer + 254
    mov byte [rsi], 10  ; символ новой строки
    mov rbx, 10
.loop:
    xor rdx, rdx
    div rbx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    test rax, rax
    jnz .loop
    
    ; Считаем длину строки для sys_write
    mov rdx, buffer + 255
    sub rdx, rsi
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    syscall
    ret

; --- Выход из программы ---
exit:
    mov rax, 60         ; sys_exit
    xor rdi, rdi
    syscall
