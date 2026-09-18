format ELF executable 32
entry start
segment readable executable
start:
    mov eax, 4
    mov ebx, 1
    mov ecx, last_name
    mov edx, len_ln
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, first_name
    mov edx, len_fn
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, middle_name
    mov edx, len_mn
    int 0x80
    mov eax, 1
    xor ebx, ebx
    int 0x80
segment readable writeable
last_name   db 'Sakharov', 10
len_ln = $ - last_name
first_name  db 'Andrey', 10
len_fn = $ - first_name
middle_name db 'Alekseevich', 10
len_mn = $ - middle_name
