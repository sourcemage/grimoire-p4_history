(

  ./configure  --prefix=/usr             \
               --libexecdir=/usr/libexec \
               --mandir=/usr/share/man   \
               $OPTS                    &&

  xmkmf                                 &&
  make includes                         &&
  make                                  &&
  prepare_install                       &&
  make install                          &&
  make install.man

) > $C_FIFO 2>&1
