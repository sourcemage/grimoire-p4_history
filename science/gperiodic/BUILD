(

  ./configure  --prefix=/usr                    \
               --sysconfdir=/etc                \
               --localstatedir=/var             \
               --datadir=/usr                   \
               $OPTS                            &&

  sedit "s:prefix = /usr/local:prefix = /usr:" po/Makefile              &&

  make                                          &&
  prepare_install                               &&
  make    install

) > $C_FIFO 2>&1
