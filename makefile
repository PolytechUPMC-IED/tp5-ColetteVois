LDLIBS = -lpng
CC = gcc
CFLAGS = -O3 -Wall -funroll-loops

all: pbm2png pbm2eps9 pbm2eps9.o printer.o

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

pbm2png: pbm2png.c
	$(CC) $(CFLAGS) -s -o pbm2png pbm2png.c $(LDLIBS) 

pbm2eps9: pbm2eps9.o printer.o
	$(CC) -s -o pbm2eps9 pbm2eps9.o printer.o

pbm2eps9.o: pbm2eps9.c printer.h

printer.o: printer.c

clean:
	rm -f pbm2png pbm2eps9 pbm2eps9.o printer.o

.PHONY: all clean
