global start

extern GetStdHandle
extern WriteFile
extern AllocConsole
extern FreeConsole
extern SetConsoleTitleA
extern SetConsoleCursorPosition
extern Sleep
extern ExitProcess

section .text use32
start:

call [AllocConsole]

push dword the_title
call [SetConsoleTitleA]

push dword -11
call [GetStdHandle]

mov dword [hStdOut], eax

mov eax, msg_len
sub eax, msg
dec eax
mov dword [msg_len], eax

push dword 0
push dword nBytes
push dword [msg_len]
push dword msg
push dword [hStdOut]
call [WriteFile]

mov ax, 15
shl eax, 16
mov ax, 0

push eax
push dword [hStdOut]
call [SetConsoleCursorPosition]

push dword 5000
call [Sleep]

call [FreeConsole]

xor eax, eax
push eax
call [ExitProcess]

section .data use32
the_title	db "HelloWorldProgram", 0
msg			db "Hello World!", 13, 10, 0

msg_len		dd 0

section .bss use32
hStdOut		resd 1
nBytes		resd 1
