(

  ./configure  --host=$BUILD                             \
               --prefix=/usr                             \
               --sysconfdir=/etc                         \
               --localstatedir=/var                      \
	       $OPTS                                     &&
  sedit  "s% -L/usr/lib % %g"  printerconf/src/Makefile  &&
  make                                                   &&
  prepare_install                                        &&
  make    install

) > $C_FIFO 2>&1
