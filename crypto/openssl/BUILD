(

  ./config  --prefix=${INSTALL_ROOT}/usr          \
            --openssldir=${INSTALL_ROOT}/etc/ssl  \
            shared threads                        &&

  sedit  "s/-O3//"                    Makefile    &&
  sedit  "s/^CFLAG=/CFLAG=$CFLAGS /"  Makefile    &&

  make                                            &&
  prepare_install                                 && 
  make  MANDIR=${INSTALL_ROOT}/usr/share/man  install

) > $C_FIFO 2>&1
