(

  ./configure  --prefix=/usr                                          \
               --sysconfdir=/etc                                      \
               --localstatedir=/var                                   \
               $OPTS                                                  &&

  sedit  "s:CFLAGS = \-O2 \-Wall:CFLAGS = $CFLAGS:g"        Makefile  &&
  sedit  "s:CXXFLAGS = \-O2 \-Wall:CXXFLAGS = $CXXFLAGS:g"  Makefile  &&

  make                                                                &&
  prepare_install                                                     &&
  make    install

) > $C_FIFO 2>&1
