# Makefile for Ceres
#

CC= gcc -O2
CFLAGS= -DLINUX -DBIGENDIAN -I/usr/X11R6/include/X11 -Itich
LDFLAGS= -I/usr/X11R6/include/X11 -lXm -L/usr/X11R6/lib -lXt -lX11 -Ltich -laudio -laudiofile -lm

Ceres: ceres.o lpc.o
	$(CC) ceres.o lpc.o -o ceres $(CFLAGS) $(LDFLAGS)

ceres: ceres.c
	$(CC) -c $(CFLAGS) ceres.c
lpc: lpc.c
	$(CC) -c $(CFLAGS) lpc.c

install:
	cp ceres /usr/bin/ceres
	cp Ceres.ad /usr/X11R6/lib/X11/app-defaults/Ceres

clean:
	rm -f ceres *.o
