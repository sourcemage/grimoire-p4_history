(

  #  the following exportw as to deal with a zvt compilation problem.
  export  CFLAGS="$CFLAGS -I/usr/include/gnome-1.0"

  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
