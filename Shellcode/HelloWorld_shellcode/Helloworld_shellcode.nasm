; Program Name: Helloworld_shellcode.nasm
; Author: Kunal Varudkar

; Purpose: Understanding the JMP-CALL-POP technique to dynamically use the memory address for shell coding :)


global _start


section .text

_start:

	JMP short call_shellcode

shellcode:
	
	; print code 

	xor eax, eax			; xor-ing to omit bad character (0x00) in op-code
	mov al, 0x4			; sys call for printf
	
	xor ebx, ebx
	mov bl, 0x1			; stdout=1

	pop ecx				; poping the the address of next instruction into ecx 

	xor edx, edx			
	mov dl, 27			; length of message
	int 0x80			; calling interrupt to execute syscall
	
	; exit code

	xor eax, eax
	mov al, 0x1			; syscall for exit
	int 0x80			; calling interruptto execute syscall

call_shellcode:

	call shellcode
	message:	db	"Hello world in shellcode!!", 0xA
