#!/usr/bin/python

import sys

input = sys.argv[1]

print 'Length of String:'+str(len(input))

stringlist = [input[i:i+4] for i in range (0, len(input), 4)]

for item in stringlist[::-1]:
	print item[::-1] + ': 0x' + str(item[::-1].encode('hex'))
