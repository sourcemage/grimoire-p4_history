(
patch -p0 < $SCRIPT_DIRECTORY/ksensors-0.7-startupcrash.diff &&
patch -p0 < $SCRIPT_DIRECTORY/ksensors-0.7-fix.diff &&

  ./configure  --prefix=${INSTALL_ROOT}/usr        \
               --sysconfdir=${INSTALL_ROOT}/etc    \
	       --enable-mt	\
	       --with-qt-dir=${INSTALL_ROOT}/usr/lib/qt3       \
	       $OPTS                &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
