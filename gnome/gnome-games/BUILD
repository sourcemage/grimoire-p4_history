(

  export  CFLAGS="$CFLAGS  -I/usr/include/gdk-pixbuf-1.0"

  ./configure  --prefix=/usr        \
               --bindir=/usr/games  \
               --sysconfdir=/etc    &&
  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
