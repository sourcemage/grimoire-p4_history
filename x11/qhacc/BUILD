(
   PREFIX=/usr/qhacc				&&
   ./configure  --with-qt-moc=/usr/bin --with-qt-libs=/usr/lib \
		--with-qt-includes=/usr/include/qt \
		--prefix=$PREFIX \
		--localstatedir=/var \
		--sysconfdir=/etc $OPTS 	&&
   make						&&
   sedit "s:/local::" src/qhacc 		&&

   prepare_install				&&

   make install					&&
   ln -sf $PREFIX/bin/qhacc /usr/bin		&&
   cp -r contrib/easysetup $PREFIX/share
) > $C_FIFO 2>&1  
