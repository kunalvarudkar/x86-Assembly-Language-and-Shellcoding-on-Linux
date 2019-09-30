; Program Name: Push_Pop.nasm
; Author: Kunal Varudkar

; Program for understanding Push and Pop instruction

global _start

section .text

_start:

	mov eax, 0xAABBCCDD
	mov ebx, 0x0
	mov ecx, 0x0

	; push and pop for register/memory 16bit and 32bit
	; register push and pop

	push ax
	pop bx

	push eax
	pop ecx

	; memory push and pop

	push word [sample]
	pop ecx

	push dword [sample]
	pop edx

	; program exit

	mov eax, 0x1
	mov ebx, 0x1
	int 0x80

section .data
	
	sample:	db	0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x11, 0x22
