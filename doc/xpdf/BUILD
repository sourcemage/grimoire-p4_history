(

  export    CFLAGS="$CFLAGS -I/usr/include/freetype2"
  export  CXXFLAGS="$CFLAGS"

  ./configure --prefix=/usr  --with-gzip &&
  make                                   &&
  prepare_install                        &&
  make    install

) > $C_FIFO 2>&1
