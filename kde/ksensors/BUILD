(
patch -p0 < $SCRIPT_DIRECTORY/ksensors-0.7-startupcrash.diff &&
patch -p0 < $SCRIPT_DIRECTORY/ksensors-0.7-fix.diff &&

  ./configure  --prefix=/usr        \
               --sysconfdir=/etc    \
	       --enable-mt	\
	       --with-qt-dir=/usr/lib/qt3       \
	       $OPTS                &&
  make                              &&
  make    install

) > $C_FIFO 2>&1
