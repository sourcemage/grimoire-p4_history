(
  rm  -f  install-sh  missing  mkinstalldirs     &&
#  ln  -s  /usr/share/automake-1.6/install-sh     &&
#  ln  -s  /usr/share/automake-1.6/missing        &&
#  ln  -s  /usr/share/automake-1.6/mkinstalldirs  &&

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
