(
   ./configure  --with-qt-moc=/usr/bin --with-qt-libs=/usr/lib \
		--with-qt-includes=/usr/include/qt \
		--prefix=/usr/qhacc \
		--localstatedir=/var \
		--sysconfdir=/etc $OPTS 	&&
   make						&&
   sedit "s:/local::" src/qhacc 		&&

   prepare_install				&&

   make install					&&
   ln -sf /usr/qhacc/bin/qhacc /usr/bin

) > $C_FIFO 2>&1  
