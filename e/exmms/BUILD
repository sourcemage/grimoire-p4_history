(

  sedit "s:/usr/local/lib/libepplet.la:/usr/lib/libepplet.la:"  \
    src/Makefile.am                  &&

  ./autogen.sh --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install


) > $C_FIFO 2>&1


