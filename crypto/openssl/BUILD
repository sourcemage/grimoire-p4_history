(
  patch -p0 < $SCRIPT_DIRECTORY/config.patch

  ./config  --prefix=/usr          \
            --openssldir=/etc/ssl  \
            shared threads         &&
  sedit  "s/-O3//g"           Makefile  &&
  sedit  "s/-m486/$CFLAGS/g"  Makefile
  make                             &&
  prepare_install              
  make  MANDIR=/usr/share/man  install

) > $C_FIFO 2>&1
