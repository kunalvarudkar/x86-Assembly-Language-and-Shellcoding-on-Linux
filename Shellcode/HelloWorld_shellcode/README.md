Author: Kunal Varudkar

Shellcode for printing "Helloworld"

This program uses a technique " JMP-CALL-POP" to use dynamic memory address while execution, as a hardcoded memory address cant
be used in shellcode.

Syntax for JMP-CALL-POP technique

_start:

JMP short call_shellcode                                 

shellcode:                                              

        ......
        ......
        

call_shellcode:                                             ; label

        call shellcode                                      ; call to label
  
        message:  db  "Helloworld"                          ; Message to print
        
        
Explanation: 

A) First of all we cant use hardcoded memory address which we were using previously, as the shellcode which we are going to develope is going to run on various system with different architecture.

B) So we use JMP-CALL-POP technique to get the dynamic memory address during runtine, we know that when "call" instruction is been executed the next instruction' memory address after the call is PUSHED onto the stack

C) So this method can be used to get the memory address dynamically. Hence we will first "JMP" to the "call_shellcode label".

D) As we make a jmp to call_shellcode, we will call shellcode inside it. before executing the call instruction, the memory of next operation will be pushed onto the stack. In our case it is the memory address of "message"

E) Later, when the instruction are been executed , we will pop ECX, that means  we will pop the value from stack and place it in ECX register.

In this way we can get the memory address dynamically using JMP-CALL-POP tecnique :) ;)
