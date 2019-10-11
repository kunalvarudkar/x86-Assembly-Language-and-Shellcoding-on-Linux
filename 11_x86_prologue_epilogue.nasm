; Program Name: 11_x86_prologue_epilogue.nasm
; Author: Kunal Varudkar

; Program to illustrate how to use prologue and epilogue in x86 assembly

global _start

section .text

proc1:
	
	push ebp
	mov ebp, esp

	sub esp, 2
	mov [esp], byte 'P'
	mov [esp+1], byte 'D'
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, esp
	mov edx, 0x2
	int 0x80

	mov esp, ebp
	pop ebp

	ret

_start:

	call proc1
	mov eax, 0x1
	mov ebx, 0x1
	int 0x80

