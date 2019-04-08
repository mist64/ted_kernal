all:
	cl65 -C kernal.cfg kernal.s

clean:
	rm kernal.o lokernal.bin hikernal.bin
