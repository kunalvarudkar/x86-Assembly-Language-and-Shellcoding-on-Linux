; Program Name: exit_shellcode_bad_character.nasm
; Author: Kunal Varudkar

; Purpose: Developing shellcode for exit


global _start


section .text


_start:
 
	mov eax, 0x1		; syscall for exit
	mov ebx, 0x1		; return value for exit
	int 0x80		; calling interrupt


; -----------------------------------------------------------------------------------------------

; opcode with bad character

; lab@lab-VirtualBox:~/Documents/SLAE$ ./objdump_shellcode.sh Shellcode/Exit_Shellcode/exit_shellcode_bad_char
; [+]Starting objdump[+]

; Shellcode/Exit_Shellcode/exit_shellcode_bad_char:     file format elf32-i386


; Disassembly of section .text:

; 08048060 <_start>:
; 8048060:	b8 01 00 00 00       	mov    eax,0x1
; 8048065:	bb 01 00 00 00       	mov    ebx,0x1
; 804806a:	cd 80                	int    0x80

; "\xb8\x01\x00\x00\x00\xbb\x01\x00\x00\x00\xcd\x80"
