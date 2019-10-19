<h2>Execve /bin/sh shellcode</h2>

<b>Problem I faced:</b></br>
A) I Was using .text segment for doing write operation on text segment for string "/bin/shABBBBCCCC"</br>
   syntax:</br>
   
   section .text</br>
   _start:</br>
        JMP short call_shellcode
    
    shellcode:
            pop esi
            ......
            ......
            
    call_shellcode:
        call_shellcode
        message:  db  "/bin/shABBBBCCCC"</br>
        
Whatever,operation i was performing over the string in ESI register was not permitted, because the .text segment is write protected.</br>

B) <b>Solution:</b></br>

creating a new custom made section and make it writable</br>
Syntax:</br>

   section .shellcode  progbits alloc exec write align=16</br>
   _start:</br>
        JMP short call_shellcode
    
    shellcode:
            pop esi
            ......
            ......
            
    call_shellcode:
        call_shellcode
        message:  db  "/bin/shABBBBCCCC"</br>
        
        
 
 The progbits, alloc, exec, write and align flags description can be found on - https://www.tortall.net/projects/yasm/manual/html/objfmt-elf-section.html<br>
 
 Assemble code using - nasm -f elf32 -o execve.o execve.nsam</br>
 Link code using - ld -N execve.o -o execve</br>
 Run code - ./execve</br>
 
 <b>Note:</b><br>
 
 For Linking we use -N flag : Do not page align data, do not make text readonly
 

        

 

