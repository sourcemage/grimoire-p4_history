(

  ./config  --prefix=/usr                       \
            --openssldir=/etc/ssl               \
            shared threads                      &&

  sedit  "s/-O3//"                    Makefile  &&
  sedit  "s/^CFLAG=/CFLAG=$CFLAGS /"  Makefile  &&

  make                                          &&
  prepare_install                               && 
  make  MANDIR=/usr/share/man  install

) > $C_FIFO 2>&1
