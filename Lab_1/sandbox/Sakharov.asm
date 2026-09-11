format ELF executable 3
entry start

segment readable executable
start:
    ; Вывод фамилии
    mov eax, 4
    mov ebx, 1
    mov ecx, surname
    mov edx, surname_len
    int 0x80

    ; Вывод имени
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, name_len
    int 0x80

    ; Вывод отчества
    mov eax, 4
    mov ebx, 1
    mov ecx, patronymic
    mov edx, patronymic_len
    int 0x80

    ; Выход
    mov eax, 1
    xor ebx, ebx
    int 0x80

segment readable writeable
    surname      db 'Sakharov', 10
    surname_len  = $ - surname
    name         db 'Andrey', 10
    name_len     = $ - name
    patronymic   db 'Alekseevich', 10
    patronymic_len = $ - patronymic