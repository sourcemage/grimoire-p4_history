(

  export CPPFLAGS="$CPPFLAGS -w -I/usr/include/libpng12"

  ./configure  --prefix=/usr            \
               --sysconfdir=/etc/imlib  &&
  make                                  &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1
