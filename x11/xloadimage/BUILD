(
patch -p1 < $SCRIPT_DIRECTORY/xloadimage.4.1-linux.patch &&
patch -p1 < $SCRIPT_DIRECTORY/xloadimage.4.1-nobr.patch &&
patch -p1 < $SCRIPT_DIRECTORY/xloadimage-unaligned.patch &&
patch -p1 < $SCRIPT_DIRECTORY/xloadimage-4.1-buffer.patch &&
cd jpeg &&
mv Makefile Makefile.orig &&
ln -s makefile.ansi Makefile &&
cd .. &&
xmkmf &&
cd jpeg &&
make libjpeg.a &&
cd .. &&
make &&
prepare_install &&
make    DESTDIR=/ \
	install install.man
) > $C_FIFO 2>&1
