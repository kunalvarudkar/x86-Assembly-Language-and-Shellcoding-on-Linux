; Program Name: reg_flag_save.nasm
; Author: Kunal Varudkar

; Program to illustrate how to preserve and restore the value of register/ flags in x86 assembly.


global _start

section .text

_start:

	; simple mul operation
	
	mov eax, 0x10
	mov ebx, 0x20
	mul ebx
	
	; preserve register and flag
	
	pushad
	pushfd
	
	; printing Hello in stdout

	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg
	mov edx, mlen
	int 0x80

	; restoring register and flag
	
	popad
	popfd

	; exit 

	mov eax, 0x1
	mov ebx, 0x1
	int 0x80


section .data

	msg:	db	"Hello!!"
	mlen	equ	$-msg



