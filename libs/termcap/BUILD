(
  if ! [ -f ${INSTALL_ROOT}/etc/termcap ];
	then OPTS="$OPTS --enable-install-termcap"
  fi  &&
  cd $SOURCE_DIRECTORY            &&
  ./configure --prefix=/usr $OPTS &&
  make                            &&

  prepare_install                 &&
  make install

) > $C_FIFO 2>&1
