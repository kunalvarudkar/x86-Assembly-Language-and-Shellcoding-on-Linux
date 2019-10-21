#!/usr/bin/python

# python code for xor encoder

shellcode = ("place your shellcode here")			

encoded = ""
encoded2 = ""

print "Encoded Shellcode ....."

for x in bytearray(shellcode):
	# xor encoding
        # Note: if xor character is present in shellcode, change it 
        # xoring same value is Zero

	y = x^0xAA
	encoded += '\\x'
	encoded += '%02x' % y

	encoded2 += '0x'
	encoded2 += '%02x,' %y


print encoded

print encoded2

print 'Length: %d' % len(bytearray(shellcode))
