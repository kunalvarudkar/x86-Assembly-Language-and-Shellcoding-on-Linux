; Program Name: 9_Loop.nasm
; Author: Kunal Varudkar

; Program for understanding how loop instruction works and how they can be used in assembly language.

;Notes:
;1. Loop basically depends on ECX reg(counter register)
;2. So you can load a value in ECX and you can call loop inst with a label
;3. Till the time the value in ECX is not zero(0), the loop inst will continue to call a label
;4. Loop inst will automatically decrement the value of ECX reg, hence no need to decrement the counter manually.
;_______________________________________________________________________________________________________________

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

	mov ecx, 0x5			; Used ECX reg, as loop inst uses this reg for counter purpose	

PrintHW:

	Push ecx			; Pushing the value of ecx in stack so that we can retain it for further use.


	; printing hello world 

	mov eax, 0x4			; syscall 
	mov ebx, 0x1			; stdout 
	mov ecx, message		; message to print on screen
	mov edx, mlen			; Length of message to print
	int 0x80			; calling the interrupt
	
	pop ecx				; Poping the value of ecx again for using the loop inst as counter.
	; dec eax			Not used, as Loop inst decrement the value of eax.
	loop PrintHW			; Used loop with label name
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
	
