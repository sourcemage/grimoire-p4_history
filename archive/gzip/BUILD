patch -p1 < $SCRIPT_DIRECTORY/gzip-1.2.4b.patch

(

  sedit  's:$(prefix)/info:$(prefix)/share/info:'  Makefile.in  &&
  sedit  's:$(prefix)/man:$(prefix)/share/man:'    Makefile.in  &&
  ./configure  --build=$BUILD                \
               --prefix=${INSTALL_ROOT}/usr  \
               --bindir=${INSTALL_ROOT}/bin  &&
  make                                       &&
  prepare_install                            &&
  make  bindir=${INSTALL_ROOT}/bin  install

) > $C_FIFO 2>&1
