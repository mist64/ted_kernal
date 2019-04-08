all: kernal

kernal:
	ca65 kernal.s
	ld65 -C kernal.cfg kernal.o

full: kernal
	dd if=kernal.318004-05.bin bs=1 count=3584 > kernal.bin
	cat lokernal.bin >> kernal.bin
	dd if=kernal.318004-05.bin bs=1 count=2048 skip=4096 >> kernal.bin
	cat hikernal.bin >> kernal.bin

clean:
	rm -f kernal.o lokernal.bin hikernal.bin kernal.bin
