(

  ./config  --prefix=${INSTALL_ROOT}/usr          \
            --openssldir=${INSTALL_ROOT}/etc/ssl  \
            shared threads                        &&

  sedit  "s/-O3//"                    Makefile    &&
  sedit  "s/-m486//"                  Makefile    &&
  sedit  "s/^CFLAG=/CFLAG=$CFLAGS /"  Makefile    &&
  sedit  "s/chmod 644\(.*pkgconfig\)/chmod 755\1/"  Makefile  &&

  make                                            &&
  prepare_install                                 && 
  make  MANDIR=${INSTALL_ROOT}/usr/share/man  install

) > $C_FIFO 2>&1
