format ELF
public _start

firstname db "Сахаров", 0xA, 0
name db "Андрей", 0xA, 0
fathername db "Алексеевич", 0xA, 0

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, firstname
    mov edx, 15
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, 13
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, fathername
    mov edx, 21
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
