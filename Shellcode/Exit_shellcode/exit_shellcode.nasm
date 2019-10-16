; Program Name: Exit_shellcode.nasm
; Author: Kunal Varudkar

; Purpose: Developing shellcode for exit


global _start


section .text


_start:

	; Simple Technique to avoid Bad character (0x00)
	xor eax, eax		; XOR of any value with itself is zero 
	mov al, 0x1		; syscall for exit
	xor ebx, ebx		; xor operation to avoid bad character 
	mov bl, 0x1		; return value for exit
	int 0x80		; calling interrupt



; -----------------------------------------------------------------------------------------------------------

; opcode without bad character

; lab@lab-VirtualBox:~/Documents/SLAE$ ./objdump_shellcode.sh Shellcode/Exit_Shellcode/exit_shellcode
; [+]Starting objdump[+]

; Shellcode/Exit_Shellcode/exit_shellcode:     file format elf32-i386


; Disassembly of section .text:

; 08048060 <_start>:
; 8048060:	31 c0                	xor    eax,eax
; 8048062:	b0 01                	mov    al,0x1
; 8048064:	31 db                	xor    ebx,ebx
; 8048066:	b3 01                	mov    bl,0x1
; 8048068:	cd 80                	int    0x80

;"\x31\xc0\xb0\x01\x31\xdb\xb3\x01\xcd\x80"

