(

	cd src				&&
	sedit "s!DESTDIR= /usr/X11R6!DESTDIR= /usr!" Makefile	&&
	make				&&
	prepare_install			&&
	cp allin1 /usr/bin		&&
	cp allin1.conf.example /etc/allin1.conf
			

) > $C_FIFO 2>&1
