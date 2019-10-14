; Program Name: Arithmetic_operation.nasm
; Author: Kunal Varudkar
; A sample program to know how arithmetic operation is performed with the register, memory and eflags

global _start

section .text

_start:

	; register based addition

	mov eax, 0x0
	add al, 0x22
	add al, 0x11

	mov ax, 0x4455
	add ax, 0x1111

	mov eax, 0xffffffff
	add eax, 0x10

	; memory based addition

	mov eax, 0x0
	add byte [var1], 0x22
	add byte[var1], 0x22

	add word [var2], 0x1122
	add word [var2], 0x3344

	add dword [var3], 0xffffffff
	add dword [var3], 0x10

	; set/clear/compliment carry flag

	stc  	; set carry flag
	clc	; clear carry flag
	cmc	; compliment carry flag

	; add with carry 

	mov eax, 0x0
	stc
	add al, 0x22
	stc
	add al, 0x11
	
	mov ax, 0x2233
	stc
	add ax, 3333
	
	mov eax, 0xffffffff
	stc
	add eax, 0x10

	; subtract with carry

	mov eax, 10
	sub eax, 5
	stc
	sbb eax, 4

	; increment and decrement example
	
	inc eax
	dec eax

	; exit program

	mov eax, 0x1
	mov ebx, 0x1
	int 0x80 

section .data

	var1	db	0x00
	var2	dw	0x0000
	var3	dd	0x00000000
