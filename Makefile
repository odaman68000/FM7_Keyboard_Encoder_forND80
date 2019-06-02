KEYENC.COM : keyenc_c.hex
	hex2bin keyenc_c.hex > KEYENC.COM

KEYENC.BIN : keyenc_b.hex
	hex2bin keyenc_b.hex > KEYENC.BIN

keyenc_c.hex : zout/keyenc.rel
	ld80 -o keyenc_c.hex -O ihex -P 100 zout/keyenc.rel

keyenc_b.hex : zout/keyenc.rel
	ld80 -o keyenc_b.hex -O ihex -P 8004 zout/keyenc.rel

zout/keyenc.rel : keyenc.mac
	zmac --rel keyenc.mac

clean :
	rm -f KEYENC.COM
	rm -f KEYENC.BIN
	rm -rf zout

