(

  ./configure  --prefix=/usr           \
               --with-msw=no           \
               --with-file-coding=yes  \
               $OPTS                   &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1
