(
	cd /$BUILD_DIRECTORY/nvclock-dev &&
	./autogen.sh &&
	./configure --prefix=/usr &&
	make &&
	prepare_install &&
	make install
) >$C_FIFO 2>&1
