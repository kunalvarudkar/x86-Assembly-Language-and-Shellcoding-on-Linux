; Program Name: 6_Multiply_div.nasm
; Author: Kunal Varudkar

; Assemply program for understanding the Multiplication and division operation with respect to eflags

; Unsigned Multiplication (MUL)
             
; AX  * r/m8  = |AX|			
; AX  * r/m16 = |DX|AX|
; EAX * r/m32 = |EDX|EAX|

; OF=1 & CF=1 , IF upper half of result is non zero

global _start

section .text

_start:

	; Mul for 8bit 

	mov eax, 0x0
	mov al, 0x10
	mov bl, 0x2
	mul bl

	; mul for 16bit

	mov eax, 0x0
	mov ebx, 0x0
	mov ax, 0x1122
	mov cx, 0x2222
	mul cx

	; mul for 32bit

	mov eax, 0x55667788
	mov ebx, 0x11223344
	mul ebx

	; mul using memory location

	mul byte [var1]
	mul word [var2]
	mul dword [var3]

	; division using r/m 16

	mov dx, 0x0
	mov ax, 0x7788
	mov cx, 0x2
	div cx

	mov ax, 0x7788 + 0x1
	mov cx, 0x2
	div cx		

	; exiting program

	mov eax, 0x4
	mov ebx, 0x1
	int 0x80


section .data

	var1:	db	0x05
	var2:	dw	0x1122
	var3:	dd	0x11223344
