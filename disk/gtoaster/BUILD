(

  patch  Makefile.in  $SCRIPT_DIRECTORY/Makefile.in.patch  &&

  sedit  "s/oggtst/ogginfo/"  defaultentries.h  &&

  ./configure  --build=$BUILD                   \
               --prefix=/usr                    \
               --sysconfdir=/etc                \
               --localstatedir=/var             \
               $OPTS                            &&

  make                                          &&
  prepare_install                               &&
  make    install

) > $C_FIFO 2>&1
