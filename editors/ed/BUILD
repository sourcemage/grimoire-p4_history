(

  sedit  's:$(prefix)/info:$(prefix)/share/info:'  Makefile.in  &&
  sedit  's:$(prefix)/man:$(prefix)/share/man:'    Makefile.in  &&

  ./configure  --build=$BUILD                 \
               --prefix=${INSTALL_ROOT}/usr   \
               $OPTS  &&
  make                &&
  prepare_install     &&
  make    install

) > $C_FIFO 2>&1
