Author: Kunal Varudkar

A) Reversing String using python



![alt text](https://raw.githubusercontent.com/kunalvarudkar/x86-Assembly-Language-and-Shellcoding-on-Linux/master/Shellcode/Helloworld_using_Stack/reverse%20string.png)

We are going to push the "Hello world!\naaa" onto the stack in reverse order.

later we will mov ecx, esp (pointing the esp to ecx) so that we could print our value


B) Memory layout of stack


![alt text](https://raw.githubusercontent.com/kunalvarudkar/x86-Assembly-Language-and-Shellcoding-on-Linux/master/Shellcode/Helloworld_using_Stack/stack_layout.png)
