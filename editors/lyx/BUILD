(

  CFLAGS=`echo $CFLAGS | sed "s/-O3/-O2/"` &&
  CXXFLAGS="$CFLAGS"                               &&
  export  CFLAGS                                   &&
  export  CXXFLAGS                                 &&
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1

