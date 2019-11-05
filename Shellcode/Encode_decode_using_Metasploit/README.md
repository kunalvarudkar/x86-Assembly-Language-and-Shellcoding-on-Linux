Author: Kunal Varudkar<br>
<B>Steps to be performed for using metasploit encoder for our shellcode</b>
<br>
1. Develope a shellcode (//bin/sh)<br>
2. Get the opcode <br>
<br>
Metsploit part: <br>
3. Check for all available encoder (select any encoder you want)<br>
   <b>#msfvenom -l encoders</b><br>
4. use the encoder to encode<br>
   <b>#echo -ne "SHELLCODE HERE" | msfvenom --arch x86 --platform linux -f c -e x86/shikata_ga_nai</b><br>
    For increasing the encoding iteration use -i flag<br>
   <b>#echo -ne "SHELLCODE HERE" | msfvenom --arch x86 --platform linux -f c -e x86/shikata_ga_nai -i 10</b><br> 
5. For creating a executable shellcode<br>
   <b>#echo -ne "SHELLCODE_HERE" | msfvenom --arch x86 --platform linux -f elf -e x86/shikata_ga_nai > shellcode</b></br>
   <b>Run ./Shellcode</b><br>

For Reference:


![alt text](https://raw.githubusercontent.com/kunalvarudkar/x86-Assembly-Language-and-Shellcoding-on-Linux/master/Shellcode/Encode_decode_using_Metasploit/Screenshot/encoder_SS.png)

![alt text](https://raw.githubusercontent.com/kunalvarudkar/x86-Assembly-Language-and-Shellcoding-on-Linux/master/Shellcode/Encode_decode_using_Metasploit/Screenshot/exec_shellcode.png)
