(

  cd $SOURCE_DIRECTORY                      &&

  sedit  's:$(prefix)/info:$(prefix)/share/info:'  Makefile.in  &&

  ./configure --prefix=${INSTALL_ROOT}/usr  \
              --enable-install-termcap      \
              $OPTS                         &&
  make                                      &&
  prepare_install                           &&
  make install

) > $C_FIFO 2>&1
