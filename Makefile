hello.exe: hello.obj
	goling hello.obj kernel32.dll

hello.obj: hello.asm
	nasm -fwin hello.asm

all: hello.exe

clean:
	rm -f hello.obj hello.exe