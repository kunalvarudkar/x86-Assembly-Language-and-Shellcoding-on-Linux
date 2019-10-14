; Helloworld.asm
; Author: Kunal Varudkar

; program for printing Helloworld

global _start			; _start declared as global

section .text			; text section contain all the program

_start:				; Defining entry point to linker
	;printing hello world in output window
	; syntax followed
	; write(int fd , const void *buf, size_t count);
	; eax  ,   ebx ,            ecx ,         edx 

	mov eax, 0x4		; calling the function write whose value is 0x4
	mov ebx, 0x1		; we want to print on output screen, hence we use stdout having value 1
				; stdin=0 [default] , stdout=1 , stderror=2  
	mov ecx, message	; passing the data whatever we want to print 
	; mov edx, 11		; passing the length of data we want to print	
	mov edx, mlen		; you can also drirectly pass the length ( example above)
	int 0x80		; Interrupt 0x80 is used to call the system call

	; Now exiting the code
	; Syntax followed
	; _Exit(int status);
	;  eax ,    ebx

	mov eax, 0x1		; calling fucntion exit() whose value is 0x1
	mov ebx, 0x5		; entering any value which you want to get in return
	int 0x80		; Interrupt 0x80 is used to call the system call


section .data			; data section used to initialize the data

	message: db "Hello world"	; message is like variable which holds "hello world" using db (define byte)
	mlen	equ	$-message	; mlen equals message

; Find the system call number at "/usr/include/i386-linux-gnu/asm/unistd_32.h"

; Run - 
; nasm -f elf32 -o Helloworld.o Helloworld.asm
; ld -o helloworld Helloworld.o
; ./helloworld
