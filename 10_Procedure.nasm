; Program Name: 10_Procedure.nasm
; Author: Kunal Varudkar

; Program to illustrate the usage of procedure in assembly language and how it can be used.


global _start

section .text

PHW_Procedure:				; defining a procedure
	
	; printing hello world 

        mov eax, 0x4                    ; syscall 
        mov ebx, 0x1                    ; stdout 
        mov ecx, message                ; message to print on screen
        mov edx, mlen                   ; Length of message to print
        int 0x80                        ; calling the interrupt
	ret;				; End of procedure

_start:

	JMP Begin			; Unconditional Jump to label "Begin"

Begin:					; Defining the label

	mov ecx, 0x5			; Used ECX reg, as loop inst uses this reg for counter purpose	

PrintHW:

	Push ecx			; Pushing the value of ecx in stack so that we can retain it for further use.
	CALL PHW_Procedure		; calling the procedure
	pop ecx				; Poping the value of ecx again for using the loop inst as counter.
	loop PrintHW

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

