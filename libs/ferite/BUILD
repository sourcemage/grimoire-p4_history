(

  unset  LDFLAGS
  ./configure                       &&
  make  INSTALLDIR=/usr/bin         \
        INCLUDEDIR=/usr/include     \
        MANDIR=/usr/share/man/man1  &&
  prepare_install                   &&
  make  INSTALLDIR=/usr/bin         \
        INCLUDEDIR=/usr/include     \
        MANDIR=/usr/share/man/man1  \
        install

) > $C_FIFO 2>&1
