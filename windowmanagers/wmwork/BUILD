(

  cd src                                   
  ./configure  --build=$BUILD                             \
               --prefix=/usr                              \
               --sysconfdir=/etc                          \
               $OPTS                                      &&
  make                                                    &&
  prepare_install                                         &&
  make install

) > $C_FIFO 2>&1
