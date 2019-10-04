; Program Name: 7_logical_inst.nasm
; Author: Kunal Varudkar

; Program for learning how logical instructions (AND, OR, XOR, NOT) works in x86 Architecture using Assembly language.

global _start

section .text

_start:
	
	; AND operation

	mov al, 0x12
	and al, 0x2

	and byte [var1], 0xbb				; doing ==>  0xaa[var1] AND 0xbb
	and word [var2], 0x2233				; doing ==>  0xaabb[var2] AND 0x2233

	; OR operation

	mov al, 0x11
	or al, 0x2

	or byte [var1], 0x11
	
	mov eax, 0
	or eax,0x0

	; XOR operation

	xor dword [var3], 0x11223344
	xor dword [var3], 0x11223344

	; NOT operation

	mov eax, 0xFFFFFFFF
	not eax
	not eax

	; exit code 

	mov eax, 0x1
	mov ebx, 0x2
	int 0x80


section .data

	var1:	db	0xaa
	var2:	dw	0xaabb
	var3:	dd	0x11223344
