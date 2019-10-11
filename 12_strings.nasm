; Program Name: 12_Strings.nasm
; Author: Kunal Varudkar

; Program to illustrate working of strings instruction in x86 assembly

global _start

section .text

_start:

	; copy a string from source to destination

	mov ecx, slen				; moving length of message so that rep inst will repeat it that number of times
	lea esi, [source]			; point source 
	lea edi, [destination]			; point destination

	cld 					; if set to Zero(cleared) copy of data happens from low mem to high mem
						; if set, copy of data happens from high mem to low mem

	rep movsb				; repeat movsb(byte by byte) untill ecx is not zero

	; print the data after copying into destination

	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, destination
	mov edx, slen
	int 0x80
	
	; Compare strings
	
	mov ecx, slen				; moving length of source string into ecx
	lea esi, [source]				
	lea edi, [compare] 
	repe cmpsb				; if comparision is true -> Zero flag is set
						; if comparision if false -> Zero flag is not set

	jz printequal				; jump if zero to printequal label
	mov ecx, notequal
	mov edx, notequallen
	JMP print
	
print:

	mov eax, 0x4
	mov ebx, 0x1
	int 0x80

	mov eax, 0x1
	mov ebx, 0x1
	int 0x80
	

printequal:

	mov ecx, equal
	mov edx, equallen

section .data

	source:	db "helloworld!!", 0xA
	slen	equ	$-source

	compare:	db	"hello"

	equal:	db	"Strings are equal!!", 0xA
	equallen	equ	$-equal

	notequal:	db	"Strings are not equal!!", 0xA
	notequallen	equ	$-notequal


section .bss

	destination:	resb	100
