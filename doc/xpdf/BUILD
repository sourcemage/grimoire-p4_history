(

  export    CFLAGS="$CFLAGS -I/usr/include/freetype2"
  export  CXXFLAGS="$CFLAGS"

  ./configure --prefix=/usr  &&
  make                       &&
  prepare_install            &&
  make    install

) > $C_FIFO 2>&1
