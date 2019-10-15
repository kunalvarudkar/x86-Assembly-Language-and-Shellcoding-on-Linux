; Program Name: 13_libc_func.nasm
; Author: Kunal Varudkar

; Program to understand usage of libc in assembly language


extern printf
extern exit

global main

section .text


	main:

		push message
		call printf
		add esp, 0x4		; adjust the stack


		mov eax, 0xa
		call exit


section .data

	message:	db	"helloworld!!",0xA
	mlen	equ	$-message
