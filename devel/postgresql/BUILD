(

  ./configure  --prefix=/usr            \
               --with-CXX               \
               $OPTS                    &&
  make                                  &&
  prepare_install                       &&
  make    install                       &&
  make    install-all-headers

) > $C_FIFO 2>&1
