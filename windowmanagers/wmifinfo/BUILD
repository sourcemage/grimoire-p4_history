(
	sedit "s|/usr/local/bin|${INSTALL_ROOT}/usr/bin|" Makefile &&
	make &&
	prepare_install &&
	make install

) > $C_FIFO 2>&1
