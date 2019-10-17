; Helloworld_using_stack.nasm
; Author: Kunal Varudkar

; Purpose: Print String using stack in x86 assembly language.


global _start

section .text

_start:

	
	xor eax, eax			; to avoid bad character in shellcode
	mov al, 0x4
	
	xor ebx, ebx
	mov bl, 0x1
	
	xor edx, edx
	push edx			; Pushing on stack
	
	; Pushing "Hello world!\naaa" onto the stack in reverse order
	push 0x6161610a			
	push 0x21646c72
	push 0x6f57206f
	push 0x6c6c6548
	
	mov ecx, esp			; pointing the stack to ECX register
	mov dl, 16			; length 
	int 0x80
	
	xor eax, eax
	mov eax, 0x1
	int 0x80
