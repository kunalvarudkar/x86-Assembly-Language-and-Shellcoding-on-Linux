; Program Name: 8_Conditional_inst.nasm
; Author: Kunal Varudkar

; Program for understanding how conditional instruction works and how they can be used in assembly language.


global _start

section .text

_start:

	JMP Begin			; Unconditional Jump to label "Begin"


NeverExecute:				; Label which is not been executed/called in this program

	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, exit_message
	mov edx, exit_mlen
	int 0x80
	JMP Exit

Begin:					; Defining the label

	mov eax, 0x5			

PrintHW:

	Push eax			; Pushing the value of eax in stack so that we can retain it for further use.


	; printing hello world 

	mov eax, 0x4			; syscall 
	mov ebx, 0x1			; stdout 
	mov ecx, message		; message to print on screen
	mov edx, mlen			; Length of message to print
	int 0x80			; calling the interrupt
	
	pop eax
	dec eax
	JNZ PrintHW
	JMP NeverExecute

Exit:

	; Exit code

	mov eax, 0x1
	mov ebx, 0x2
	int 0x80


section .data

	message: db "Hello world!! "
	mlen	equ	$-message

	exit_message:	db	" In never execute label!! "
	exit_mlen	equ	$-exit_message
	
